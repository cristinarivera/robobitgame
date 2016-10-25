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
   5F60                      85 _enemy::
   5F60                      86 	.ds 904
   62E8                      87 _prota::
   62E8                      88 	.ds 8
   62F0                      89 _cu::
   62F0                      90 	.ds 11
   62FB                      91 _i::
   62FB                      92 	.ds 1
                             93 ;--------------------------------------------------------
                             94 ; ram data
                             95 ;--------------------------------------------------------
                             96 	.area _INITIALIZED
   63C5                      97 _mapa::
   63C5                      98 	.ds 2
   63C7                      99 _num_mapa::
   63C7                     100 	.ds 1
   63C8                     101 _puntuacion::
   63C8                     102 	.ds 1
   63C9                     103 _vidas::
   63C9                     104 	.ds 1
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
                            125 ;src/main.c:108: cpctm_createTransparentMaskTable(g_tablatrans, 0x0100, M0, 0);
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
                            166 ;src/main.c:111: void dibujarMapa() {
                            167 ;	---------------------------------
                            168 ; Function dibujarMapa
                            169 ; ---------------------------------
   63CF                     170 _dibujarMapa::
                            171 ;src/main.c:114: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, p, mapa);
   63CF 2A C5 63      [16]  172 	ld	hl,(_mapa)
   63D2 E5            [11]  173 	push	hl
   63D3 21 F0 C0      [10]  174 	ld	hl,#0xC0F0
   63D6 E5            [11]  175 	push	hl
   63D7 21 2C 28      [10]  176 	ld	hl,#0x282C
   63DA E5            [11]  177 	push	hl
   63DB 2E 00         [ 7]  178 	ld	l, #0x00
   63DD E5            [11]  179 	push	hl
   63DE AF            [ 4]  180 	xor	a, a
   63DF F5            [11]  181 	push	af
   63E0 33            [ 6]  182 	inc	sp
   63E1 CD E7 53      [17]  183 	call	_cpct_etm_drawTileBox2x4
   63E4 C9            [10]  184 	ret
   63E5                     185 _mapas:
   63E5 C0 10               186 	.dw _g_map1
   63E7 E0 09               187 	.dw _g_map2
   63E9 00 03               188 	.dw _g_map3
   63EB                     189 _spawnX:
   63EB 24                  190 	.db #0x24	; 36
   63EC 47                  191 	.db #0x47	; 71	'G'
   63ED 32                  192 	.db #0x32	; 50	'2'
   63EE 18                  193 	.db #0x18	; 24
   63EF                     194 _spawnY:
   63EF 5A                  195 	.db #0x5A	; 90	'Z'
   63F0 72                  196 	.db #0x72	; 114	'r'
   63F1 9A                  197 	.db #0x9A	; 154
   63F2 68                  198 	.db #0x68	; 104	'h'
   63F3                     199 _patrolX:
   63F3 00                  200 	.db #0x00	; 0
   63F4 00                  201 	.db #0x00	; 0
   63F5 00                  202 	.db #0x00	; 0
   63F6 00                  203 	.db #0x00	; 0
   63F7 00                  204 	.db #0x00	; 0
   63F8 14                  205 	.db #0x14	; 20
   63F9 47                  206 	.db #0x47	; 71	'G'
   63FA 00                  207 	.db #0x00	; 0
   63FB 00                  208 	.db #0x00	; 0
   63FC 00                  209 	.db 0x00
   63FD 00                  210 	.db #0x00	; 0
   63FE 00                  211 	.db #0x00	; 0
   63FF 00                  212 	.db #0x00	; 0
   6400 00                  213 	.db #0x00	; 0
   6401 00                  214 	.db 0x00
   6402 00                  215 	.db #0x00	; 0
   6403 00                  216 	.db #0x00	; 0
   6404 00                  217 	.db #0x00	; 0
   6405 00                  218 	.db #0x00	; 0
   6406 00                  219 	.db 0x00
   6407                     220 _patrolY:
   6407 00                  221 	.db #0x00	; 0
   6408 00                  222 	.db #0x00	; 0
   6409 00                  223 	.db #0x00	; 0
   640A 00                  224 	.db #0x00	; 0
   640B 00                  225 	.db 0x00
   640C 5A                  226 	.db #0x5A	; 90	'Z'
   640D 9C                  227 	.db #0x9C	; 156
   640E 00                  228 	.db #0x00	; 0
   640F 00                  229 	.db #0x00	; 0
   6410 00                  230 	.db 0x00
   6411 00                  231 	.db #0x00	; 0
   6412 00                  232 	.db #0x00	; 0
   6413 00                  233 	.db #0x00	; 0
   6414 00                  234 	.db #0x00	; 0
   6415 00                  235 	.db 0x00
   6416 00                  236 	.db #0x00	; 0
   6417 00                  237 	.db #0x00	; 0
   6418 00                  238 	.db #0x00	; 0
   6419 00                  239 	.db #0x00	; 0
   641A 00                  240 	.db 0x00
                            241 ;src/main.c:117: void dibujarProta() {
                            242 ;	---------------------------------
                            243 ; Function dibujarProta
                            244 ; ---------------------------------
   641B                     245 _dibujarProta::
                            246 ;src/main.c:118: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   641B 21 E9 62      [10]  247 	ld	hl, #_prota + 1
   641E 56            [ 7]  248 	ld	d,(hl)
   641F 21 E8 62      [10]  249 	ld	hl, #_prota + 0
   6422 46            [ 7]  250 	ld	b,(hl)
   6423 D5            [11]  251 	push	de
   6424 33            [ 6]  252 	inc	sp
   6425 C5            [11]  253 	push	bc
   6426 33            [ 6]  254 	inc	sp
   6427 21 00 C0      [10]  255 	ld	hl,#0xC000
   642A E5            [11]  256 	push	hl
   642B CD 05 5F      [17]  257 	call	_cpct_getScreenPtr
   642E EB            [ 4]  258 	ex	de,hl
                            259 ;src/main.c:119: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   642F ED 4B EC 62   [20]  260 	ld	bc, (#_prota + 4)
   6433 21 00 01      [10]  261 	ld	hl,#_g_tablatrans
   6436 E5            [11]  262 	push	hl
   6437 21 07 16      [10]  263 	ld	hl,#0x1607
   643A E5            [11]  264 	push	hl
   643B D5            [11]  265 	push	de
   643C C5            [11]  266 	push	bc
   643D CD 25 5F      [17]  267 	call	_cpct_drawSpriteMaskedAlignedTable
   6440 C9            [10]  268 	ret
                            269 ;src/main.c:122: void borrarProta() {
                            270 ;	---------------------------------
                            271 ; Function borrarProta
                            272 ; ---------------------------------
   6441                     273 _borrarProta::
   6441 DD E5         [15]  274 	push	ix
   6443 DD 21 00 00   [14]  275 	ld	ix,#0
   6447 DD 39         [15]  276 	add	ix,sp
   6449 F5            [11]  277 	push	af
   644A 3B            [ 6]  278 	dec	sp
                            279 ;src/main.c:126: u8 w = 4 + (prota.px & 1);
   644B 21 EA 62      [10]  280 	ld	hl, #_prota + 2
   644E 4E            [ 7]  281 	ld	c,(hl)
   644F 79            [ 4]  282 	ld	a,c
   6450 E6 01         [ 7]  283 	and	a, #0x01
   6452 47            [ 4]  284 	ld	b,a
   6453 04            [ 4]  285 	inc	b
   6454 04            [ 4]  286 	inc	b
   6455 04            [ 4]  287 	inc	b
   6456 04            [ 4]  288 	inc	b
                            289 ;src/main.c:129: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   6457 21 EB 62      [10]  290 	ld	hl, #_prota + 3
   645A 5E            [ 7]  291 	ld	e,(hl)
   645B CB 4B         [ 8]  292 	bit	1, e
   645D 28 04         [12]  293 	jr	Z,00103$
   645F 3E 01         [ 7]  294 	ld	a,#0x01
   6461 18 02         [12]  295 	jr	00104$
   6463                     296 00103$:
   6463 3E 00         [ 7]  297 	ld	a,#0x00
   6465                     298 00104$:
   6465 C6 06         [ 7]  299 	add	a, #0x06
   6467 DD 77 FD      [19]  300 	ld	-3 (ix),a
                            301 ;src/main.c:131: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   646A FD 2A C5 63   [20]  302 	ld	iy,(_mapa)
   646E 16 00         [ 7]  303 	ld	d,#0x00
   6470 7B            [ 4]  304 	ld	a,e
   6471 C6 E8         [ 7]  305 	add	a,#0xE8
   6473 DD 77 FE      [19]  306 	ld	-2 (ix),a
   6476 7A            [ 4]  307 	ld	a,d
   6477 CE FF         [ 7]  308 	adc	a,#0xFF
   6479 DD 77 FF      [19]  309 	ld	-1 (ix),a
   647C DD 6E FE      [19]  310 	ld	l,-2 (ix)
   647F DD 66 FF      [19]  311 	ld	h,-1 (ix)
   6482 DD CB FF 7E   [20]  312 	bit	7, -1 (ix)
   6486 28 04         [12]  313 	jr	Z,00105$
   6488 21 EB FF      [10]  314 	ld	hl,#0xFFEB
   648B 19            [11]  315 	add	hl,de
   648C                     316 00105$:
   648C CB 2C         [ 8]  317 	sra	h
   648E CB 1D         [ 8]  318 	rr	l
   6490 CB 2C         [ 8]  319 	sra	h
   6492 CB 1D         [ 8]  320 	rr	l
   6494 55            [ 4]  321 	ld	d,l
   6495 CB 39         [ 8]  322 	srl	c
   6497 FD E5         [15]  323 	push	iy
   6499 21 F0 C0      [10]  324 	ld	hl,#0xC0F0
   649C E5            [11]  325 	push	hl
   649D 3E 28         [ 7]  326 	ld	a,#0x28
   649F F5            [11]  327 	push	af
   64A0 33            [ 6]  328 	inc	sp
   64A1 DD 7E FD      [19]  329 	ld	a,-3 (ix)
   64A4 F5            [11]  330 	push	af
   64A5 33            [ 6]  331 	inc	sp
   64A6 C5            [11]  332 	push	bc
   64A7 33            [ 6]  333 	inc	sp
   64A8 D5            [11]  334 	push	de
   64A9 33            [ 6]  335 	inc	sp
   64AA 79            [ 4]  336 	ld	a,c
   64AB F5            [11]  337 	push	af
   64AC 33            [ 6]  338 	inc	sp
   64AD CD E7 53      [17]  339 	call	_cpct_etm_drawTileBox2x4
   64B0 DD F9         [10]  340 	ld	sp, ix
   64B2 DD E1         [14]  341 	pop	ix
   64B4 C9            [10]  342 	ret
                            343 ;src/main.c:134: void redibujarProta() {
                            344 ;	---------------------------------
                            345 ; Function redibujarProta
                            346 ; ---------------------------------
   64B5                     347 _redibujarProta::
                            348 ;src/main.c:135: borrarProta();
   64B5 CD 41 64      [17]  349 	call	_borrarProta
                            350 ;src/main.c:136: prota.px = prota.x;
   64B8 01 EA 62      [10]  351 	ld	bc,#_prota + 2
   64BB 3A E8 62      [13]  352 	ld	a, (#_prota + 0)
   64BE 02            [ 7]  353 	ld	(bc),a
                            354 ;src/main.c:137: prota.py = prota.y;
   64BF 01 EB 62      [10]  355 	ld	bc,#_prota + 3
   64C2 3A E9 62      [13]  356 	ld	a, (#_prota + 1)
   64C5 02            [ 7]  357 	ld	(bc),a
                            358 ;src/main.c:138: dibujarProta();
   64C6 C3 1B 64      [10]  359 	jp  _dibujarProta
                            360 ;src/main.c:141: void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
                            361 ;	---------------------------------
                            362 ; Function comprobarTeclado
                            363 ; ---------------------------------
   64C9                     364 _comprobarTeclado::
                            365 ;src/main.c:142: cpct_scanKeyboard_if();
   64C9 CD 3F 55      [17]  366 	call	_cpct_scanKeyboard_if
                            367 ;src/main.c:144: if (cpct_isAnyKeyPressed()) {
   64CC CD 32 55      [17]  368 	call	_cpct_isAnyKeyPressed
   64CF 7D            [ 4]  369 	ld	a,l
   64D0 B7            [ 4]  370 	or	a, a
   64D1 C8            [11]  371 	ret	Z
                            372 ;src/main.c:145: if (cpct_isKeyPressed(Key_CursorLeft)){
   64D2 21 01 01      [10]  373 	ld	hl,#0x0101
   64D5 CD 06 53      [17]  374 	call	_cpct_isKeyPressed
   64D8 7D            [ 4]  375 	ld	a,l
   64D9 B7            [ 4]  376 	or	a, a
                            377 ;src/main.c:146: moverIzquierda();
   64DA C2 00 7C      [10]  378 	jp	NZ,_moverIzquierda
                            379 ;src/main.c:147: }else if (cpct_isKeyPressed(Key_CursorRight)){
   64DD 21 00 02      [10]  380 	ld	hl,#0x0200
   64E0 CD 06 53      [17]  381 	call	_cpct_isKeyPressed
   64E3 7D            [ 4]  382 	ld	a,l
   64E4 B7            [ 4]  383 	or	a, a
                            384 ;src/main.c:148: moverDerecha();
   64E5 C2 25 7C      [10]  385 	jp	NZ,_moverDerecha
                            386 ;src/main.c:149: }else if (cpct_isKeyPressed(Key_CursorUp)){
   64E8 21 00 01      [10]  387 	ld	hl,#0x0100
   64EB CD 06 53      [17]  388 	call	_cpct_isKeyPressed
   64EE 7D            [ 4]  389 	ld	a,l
   64EF B7            [ 4]  390 	or	a, a
                            391 ;src/main.c:150: moverArriba();
   64F0 C2 6A 7C      [10]  392 	jp	NZ,_moverArriba
                            393 ;src/main.c:151: }else if (cpct_isKeyPressed(Key_CursorDown)){
   64F3 21 00 04      [10]  394 	ld	hl,#0x0400
   64F6 CD 06 53      [17]  395 	call	_cpct_isKeyPressed
   64F9 7D            [ 4]  396 	ld	a,l
   64FA B7            [ 4]  397 	or	a, a
                            398 ;src/main.c:152: moverAbajo();
   64FB C2 8E 7C      [10]  399 	jp	NZ,_moverAbajo
                            400 ;src/main.c:153: }else if (cpct_isKeyPressed(Key_Space)){
   64FE 21 05 80      [10]  401 	ld	hl,#0x8005
   6501 CD 06 53      [17]  402 	call	_cpct_isKeyPressed
   6504 7D            [ 4]  403 	ld	a,l
   6505 B7            [ 4]  404 	or	a, a
   6506 C8            [11]  405 	ret	Z
                            406 ;src/main.c:154: lanzarCuchillo(cu, prota, mapa, g_tablatrans);
   6507 21 08 00      [10]  407 	ld	hl, #8
   650A 39            [11]  408 	add	hl, sp
   650B 4E            [ 7]  409 	ld	c, (hl)
   650C 23            [ 6]  410 	inc	hl
   650D 46            [ 7]  411 	ld	b, (hl)
   650E C5            [11]  412 	push	bc
   650F 21 08 00      [10]  413 	ld	hl, #8
   6512 39            [11]  414 	add	hl, sp
   6513 4E            [ 7]  415 	ld	c, (hl)
   6514 23            [ 6]  416 	inc	hl
   6515 46            [ 7]  417 	ld	b, (hl)
   6516 C5            [11]  418 	push	bc
   6517 21 08 00      [10]  419 	ld	hl, #8
   651A 39            [11]  420 	add	hl, sp
   651B 4E            [ 7]  421 	ld	c, (hl)
   651C 23            [ 6]  422 	inc	hl
   651D 46            [ 7]  423 	ld	b, (hl)
   651E C5            [11]  424 	push	bc
   651F 21 08 00      [10]  425 	ld	hl, #8
   6522 39            [11]  426 	add	hl, sp
   6523 4E            [ 7]  427 	ld	c, (hl)
   6524 23            [ 6]  428 	inc	hl
   6525 46            [ 7]  429 	ld	b, (hl)
   6526 C5            [11]  430 	push	bc
   6527 CD 4C 46      [17]  431 	call	_lanzarCuchillo
   652A 21 08 00      [10]  432 	ld	hl,#8
   652D 39            [11]  433 	add	hl,sp
   652E F9            [ 6]  434 	ld	sp,hl
   652F C9            [10]  435 	ret
                            436 ;src/main.c:159: u8 checkCollision(u8 direction) { // check optimization
                            437 ;	---------------------------------
                            438 ; Function checkCollision
                            439 ; ---------------------------------
   6530                     440 _checkCollision::
   6530 DD E5         [15]  441 	push	ix
   6532 DD 21 00 00   [14]  442 	ld	ix,#0
   6536 DD 39         [15]  443 	add	ix,sp
   6538 F5            [11]  444 	push	af
                            445 ;src/main.c:160: u8 *headTile=0, *feetTile=0, *waistTile=0;
   6539 21 00 00      [10]  446 	ld	hl,#0x0000
   653C E3            [19]  447 	ex	(sp), hl
   653D 11 00 00      [10]  448 	ld	de,#0x0000
   6540 01 00 00      [10]  449 	ld	bc,#0x0000
                            450 ;src/main.c:162: switch (direction) {
   6543 3E 03         [ 7]  451 	ld	a,#0x03
   6545 DD 96 04      [19]  452 	sub	a, 4 (ix)
   6548 DA 80 66      [10]  453 	jp	C,00105$
   654B DD 5E 04      [19]  454 	ld	e,4 (ix)
   654E 16 00         [ 7]  455 	ld	d,#0x00
   6550 21 57 65      [10]  456 	ld	hl,#00124$
   6553 19            [11]  457 	add	hl,de
   6554 19            [11]  458 	add	hl,de
   6555 19            [11]  459 	add	hl,de
   6556 E9            [ 4]  460 	jp	(hl)
   6557                     461 00124$:
   6557 C3 63 65      [10]  462 	jp	00101$
   655A C3 B8 65      [10]  463 	jp	00102$
   655D C3 08 66      [10]  464 	jp	00103$
   6560 C3 45 66      [10]  465 	jp	00104$
                            466 ;src/main.c:163: case 0:
   6563                     467 00101$:
                            468 ;src/main.c:164: headTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y);
   6563 21 E9 62      [10]  469 	ld	hl, #(_prota + 0x0001) + 0
   6566 4E            [ 7]  470 	ld	c,(hl)
   6567 3A E8 62      [13]  471 	ld	a, (#_prota + 0)
   656A C6 07         [ 7]  472 	add	a, #0x07
   656C 47            [ 4]  473 	ld	b,a
   656D 79            [ 4]  474 	ld	a,c
   656E F5            [11]  475 	push	af
   656F 33            [ 6]  476 	inc	sp
   6570 C5            [11]  477 	push	bc
   6571 33            [ 6]  478 	inc	sp
   6572 2A C5 63      [16]  479 	ld	hl,(_mapa)
   6575 E5            [11]  480 	push	hl
   6576 CD 1C 4A      [17]  481 	call	_getTilePtr
   6579 F1            [10]  482 	pop	af
   657A F1            [10]  483 	pop	af
   657B 33            [ 6]  484 	inc	sp
   657C 33            [ 6]  485 	inc	sp
   657D E5            [11]  486 	push	hl
                            487 ;src/main.c:165: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA - 2);
   657E 3A E9 62      [13]  488 	ld	a, (#(_prota + 0x0001) + 0)
   6581 C6 14         [ 7]  489 	add	a, #0x14
   6583 4F            [ 4]  490 	ld	c,a
   6584 3A E8 62      [13]  491 	ld	a, (#_prota + 0)
   6587 C6 07         [ 7]  492 	add	a, #0x07
   6589 47            [ 4]  493 	ld	b,a
   658A 79            [ 4]  494 	ld	a,c
   658B F5            [11]  495 	push	af
   658C 33            [ 6]  496 	inc	sp
   658D C5            [11]  497 	push	bc
   658E 33            [ 6]  498 	inc	sp
   658F 2A C5 63      [16]  499 	ld	hl,(_mapa)
   6592 E5            [11]  500 	push	hl
   6593 CD 1C 4A      [17]  501 	call	_getTilePtr
   6596 F1            [10]  502 	pop	af
   6597 F1            [10]  503 	pop	af
   6598 EB            [ 4]  504 	ex	de,hl
                            505 ;src/main.c:166: waistTile = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA/2);
   6599 3A E9 62      [13]  506 	ld	a, (#(_prota + 0x0001) + 0)
   659C C6 0B         [ 7]  507 	add	a, #0x0B
   659E 47            [ 4]  508 	ld	b,a
   659F 3A E8 62      [13]  509 	ld	a, (#_prota + 0)
   65A2 C6 07         [ 7]  510 	add	a, #0x07
   65A4 D5            [11]  511 	push	de
   65A5 C5            [11]  512 	push	bc
   65A6 33            [ 6]  513 	inc	sp
   65A7 F5            [11]  514 	push	af
   65A8 33            [ 6]  515 	inc	sp
   65A9 2A C5 63      [16]  516 	ld	hl,(_mapa)
   65AC E5            [11]  517 	push	hl
   65AD CD 1C 4A      [17]  518 	call	_getTilePtr
   65B0 F1            [10]  519 	pop	af
   65B1 F1            [10]  520 	pop	af
   65B2 4D            [ 4]  521 	ld	c,l
   65B3 44            [ 4]  522 	ld	b,h
   65B4 D1            [10]  523 	pop	de
                            524 ;src/main.c:167: break;
   65B5 C3 80 66      [10]  525 	jp	00105$
                            526 ;src/main.c:168: case 1:
   65B8                     527 00102$:
                            528 ;src/main.c:169: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
   65B8 21 E9 62      [10]  529 	ld	hl, #(_prota + 0x0001) + 0
   65BB 56            [ 7]  530 	ld	d,(hl)
   65BC 21 E8 62      [10]  531 	ld	hl, #_prota + 0
   65BF 46            [ 7]  532 	ld	b,(hl)
   65C0 05            [ 4]  533 	dec	b
   65C1 D5            [11]  534 	push	de
   65C2 33            [ 6]  535 	inc	sp
   65C3 C5            [11]  536 	push	bc
   65C4 33            [ 6]  537 	inc	sp
   65C5 2A C5 63      [16]  538 	ld	hl,(_mapa)
   65C8 E5            [11]  539 	push	hl
   65C9 CD 1C 4A      [17]  540 	call	_getTilePtr
   65CC F1            [10]  541 	pop	af
   65CD F1            [10]  542 	pop	af
   65CE 33            [ 6]  543 	inc	sp
   65CF 33            [ 6]  544 	inc	sp
   65D0 E5            [11]  545 	push	hl
                            546 ;src/main.c:170: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
   65D1 3A E9 62      [13]  547 	ld	a, (#(_prota + 0x0001) + 0)
   65D4 C6 14         [ 7]  548 	add	a, #0x14
   65D6 57            [ 4]  549 	ld	d,a
   65D7 21 E8 62      [10]  550 	ld	hl, #_prota + 0
   65DA 46            [ 7]  551 	ld	b,(hl)
   65DB 05            [ 4]  552 	dec	b
   65DC D5            [11]  553 	push	de
   65DD 33            [ 6]  554 	inc	sp
   65DE C5            [11]  555 	push	bc
   65DF 33            [ 6]  556 	inc	sp
   65E0 2A C5 63      [16]  557 	ld	hl,(_mapa)
   65E3 E5            [11]  558 	push	hl
   65E4 CD 1C 4A      [17]  559 	call	_getTilePtr
   65E7 F1            [10]  560 	pop	af
   65E8 F1            [10]  561 	pop	af
   65E9 EB            [ 4]  562 	ex	de,hl
                            563 ;src/main.c:171: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
   65EA 3A E9 62      [13]  564 	ld	a, (#(_prota + 0x0001) + 0)
   65ED C6 0B         [ 7]  565 	add	a, #0x0B
   65EF 47            [ 4]  566 	ld	b,a
   65F0 3A E8 62      [13]  567 	ld	a, (#_prota + 0)
   65F3 C6 FF         [ 7]  568 	add	a,#0xFF
   65F5 D5            [11]  569 	push	de
   65F6 C5            [11]  570 	push	bc
   65F7 33            [ 6]  571 	inc	sp
   65F8 F5            [11]  572 	push	af
   65F9 33            [ 6]  573 	inc	sp
   65FA 2A C5 63      [16]  574 	ld	hl,(_mapa)
   65FD E5            [11]  575 	push	hl
   65FE CD 1C 4A      [17]  576 	call	_getTilePtr
   6601 F1            [10]  577 	pop	af
   6602 F1            [10]  578 	pop	af
   6603 4D            [ 4]  579 	ld	c,l
   6604 44            [ 4]  580 	ld	b,h
   6605 D1            [10]  581 	pop	de
                            582 ;src/main.c:172: break;
   6606 18 78         [12]  583 	jr	00105$
                            584 ;src/main.c:173: case 2:
   6608                     585 00103$:
                            586 ;src/main.c:174: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
   6608 3A E9 62      [13]  587 	ld	a, (#(_prota + 0x0001) + 0)
   660B C6 FE         [ 7]  588 	add	a,#0xFE
   660D 21 E8 62      [10]  589 	ld	hl, #_prota + 0
   6610 56            [ 7]  590 	ld	d,(hl)
   6611 C5            [11]  591 	push	bc
   6612 F5            [11]  592 	push	af
   6613 33            [ 6]  593 	inc	sp
   6614 D5            [11]  594 	push	de
   6615 33            [ 6]  595 	inc	sp
   6616 2A C5 63      [16]  596 	ld	hl,(_mapa)
   6619 E5            [11]  597 	push	hl
   661A CD 1C 4A      [17]  598 	call	_getTilePtr
   661D F1            [10]  599 	pop	af
   661E F1            [10]  600 	pop	af
   661F C1            [10]  601 	pop	bc
   6620 33            [ 6]  602 	inc	sp
   6621 33            [ 6]  603 	inc	sp
   6622 E5            [11]  604 	push	hl
                            605 ;src/main.c:175: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
   6623 21 E9 62      [10]  606 	ld	hl, #(_prota + 0x0001) + 0
   6626 56            [ 7]  607 	ld	d,(hl)
   6627 15            [ 4]  608 	dec	d
   6628 15            [ 4]  609 	dec	d
   6629 3A E8 62      [13]  610 	ld	a, (#_prota + 0)
   662C C6 03         [ 7]  611 	add	a, #0x03
   662E C5            [11]  612 	push	bc
   662F D5            [11]  613 	push	de
   6630 33            [ 6]  614 	inc	sp
   6631 F5            [11]  615 	push	af
   6632 33            [ 6]  616 	inc	sp
   6633 2A C5 63      [16]  617 	ld	hl,(_mapa)
   6636 E5            [11]  618 	push	hl
   6637 CD 1C 4A      [17]  619 	call	_getTilePtr
   663A F1            [10]  620 	pop	af
   663B F1            [10]  621 	pop	af
   663C EB            [ 4]  622 	ex	de,hl
   663D C1            [10]  623 	pop	bc
                            624 ;src/main.c:176: *waistTile = 0;
   663E 21 00 00      [10]  625 	ld	hl,#0x0000
   6641 36 00         [10]  626 	ld	(hl),#0x00
                            627 ;src/main.c:177: break;
   6643 18 3B         [12]  628 	jr	00105$
                            629 ;src/main.c:178: case 3:
   6645                     630 00104$:
                            631 ;src/main.c:179: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
   6645 3A E9 62      [13]  632 	ld	a, (#(_prota + 0x0001) + 0)
   6648 C6 16         [ 7]  633 	add	a, #0x16
   664A 21 E8 62      [10]  634 	ld	hl, #_prota + 0
   664D 56            [ 7]  635 	ld	d,(hl)
   664E C5            [11]  636 	push	bc
   664F F5            [11]  637 	push	af
   6650 33            [ 6]  638 	inc	sp
   6651 D5            [11]  639 	push	de
   6652 33            [ 6]  640 	inc	sp
   6653 2A C5 63      [16]  641 	ld	hl,(_mapa)
   6656 E5            [11]  642 	push	hl
   6657 CD 1C 4A      [17]  643 	call	_getTilePtr
   665A F1            [10]  644 	pop	af
   665B F1            [10]  645 	pop	af
   665C C1            [10]  646 	pop	bc
   665D 33            [ 6]  647 	inc	sp
   665E 33            [ 6]  648 	inc	sp
   665F E5            [11]  649 	push	hl
                            650 ;src/main.c:180: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   6660 3A E9 62      [13]  651 	ld	a, (#(_prota + 0x0001) + 0)
   6663 C6 16         [ 7]  652 	add	a, #0x16
   6665 57            [ 4]  653 	ld	d,a
   6666 3A E8 62      [13]  654 	ld	a, (#_prota + 0)
   6669 C6 03         [ 7]  655 	add	a, #0x03
   666B C5            [11]  656 	push	bc
   666C D5            [11]  657 	push	de
   666D 33            [ 6]  658 	inc	sp
   666E F5            [11]  659 	push	af
   666F 33            [ 6]  660 	inc	sp
   6670 2A C5 63      [16]  661 	ld	hl,(_mapa)
   6673 E5            [11]  662 	push	hl
   6674 CD 1C 4A      [17]  663 	call	_getTilePtr
   6677 F1            [10]  664 	pop	af
   6678 F1            [10]  665 	pop	af
   6679 EB            [ 4]  666 	ex	de,hl
   667A C1            [10]  667 	pop	bc
                            668 ;src/main.c:181: *waistTile = 0;
   667B 21 00 00      [10]  669 	ld	hl,#0x0000
   667E 36 00         [10]  670 	ld	(hl),#0x00
                            671 ;src/main.c:183: }
   6680                     672 00105$:
                            673 ;src/main.c:185: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   6680 E1            [10]  674 	pop	hl
   6681 E5            [11]  675 	push	hl
   6682 6E            [ 7]  676 	ld	l,(hl)
   6683 3E 02         [ 7]  677 	ld	a,#0x02
   6685 95            [ 4]  678 	sub	a, l
   6686 38 0E         [12]  679 	jr	C,00106$
   6688 1A            [ 7]  680 	ld	a,(de)
   6689 5F            [ 4]  681 	ld	e,a
   668A 3E 02         [ 7]  682 	ld	a,#0x02
   668C 93            [ 4]  683 	sub	a, e
   668D 38 07         [12]  684 	jr	C,00106$
   668F 0A            [ 7]  685 	ld	a,(bc)
   6690 4F            [ 4]  686 	ld	c,a
   6691 3E 02         [ 7]  687 	ld	a,#0x02
   6693 91            [ 4]  688 	sub	a, c
   6694 30 04         [12]  689 	jr	NC,00107$
   6696                     690 00106$:
                            691 ;src/main.c:186: return 1;
   6696 2E 01         [ 7]  692 	ld	l,#0x01
   6698 18 02         [12]  693 	jr	00110$
   669A                     694 00107$:
                            695 ;src/main.c:188: return 0;
   669A 2E 00         [ 7]  696 	ld	l,#0x00
   669C                     697 00110$:
   669C DD F9         [10]  698 	ld	sp, ix
   669E DD E1         [14]  699 	pop	ix
   66A0 C9            [10]  700 	ret
                            701 ;src/main.c:191: void dibujarEnemigo(TEnemy *enemy) {
                            702 ;	---------------------------------
                            703 ; Function dibujarEnemigo
                            704 ; ---------------------------------
   66A1                     705 _dibujarEnemigo::
   66A1 DD E5         [15]  706 	push	ix
   66A3 DD 21 00 00   [14]  707 	ld	ix,#0
   66A7 DD 39         [15]  708 	add	ix,sp
                            709 ;src/main.c:192: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   66A9 DD 4E 04      [19]  710 	ld	c,4 (ix)
   66AC DD 46 05      [19]  711 	ld	b,5 (ix)
   66AF 69            [ 4]  712 	ld	l, c
   66B0 60            [ 4]  713 	ld	h, b
   66B1 23            [ 6]  714 	inc	hl
   66B2 56            [ 7]  715 	ld	d,(hl)
   66B3 0A            [ 7]  716 	ld	a,(bc)
   66B4 C5            [11]  717 	push	bc
   66B5 D5            [11]  718 	push	de
   66B6 33            [ 6]  719 	inc	sp
   66B7 F5            [11]  720 	push	af
   66B8 33            [ 6]  721 	inc	sp
   66B9 21 00 C0      [10]  722 	ld	hl,#0xC000
   66BC E5            [11]  723 	push	hl
   66BD CD 05 5F      [17]  724 	call	_cpct_getScreenPtr
   66C0 EB            [ 4]  725 	ex	de,hl
                            726 ;src/main.c:193: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   66C1 E1            [10]  727 	pop	hl
   66C2 01 04 00      [10]  728 	ld	bc, #0x0004
   66C5 09            [11]  729 	add	hl, bc
   66C6 4E            [ 7]  730 	ld	c,(hl)
   66C7 23            [ 6]  731 	inc	hl
   66C8 46            [ 7]  732 	ld	b,(hl)
   66C9 21 00 01      [10]  733 	ld	hl,#_g_tablatrans
   66CC E5            [11]  734 	push	hl
   66CD 21 04 16      [10]  735 	ld	hl,#0x1604
   66D0 E5            [11]  736 	push	hl
   66D1 D5            [11]  737 	push	de
   66D2 C5            [11]  738 	push	bc
   66D3 CD 25 5F      [17]  739 	call	_cpct_drawSpriteMaskedAlignedTable
   66D6 DD E1         [14]  740 	pop	ix
   66D8 C9            [10]  741 	ret
                            742 ;src/main.c:196: void dibujarExplosion(TEnemy *enemy) {
                            743 ;	---------------------------------
                            744 ; Function dibujarExplosion
                            745 ; ---------------------------------
   66D9                     746 _dibujarExplosion::
   66D9 DD E5         [15]  747 	push	ix
   66DB DD 21 00 00   [14]  748 	ld	ix,#0
   66DF DD 39         [15]  749 	add	ix,sp
                            750 ;src/main.c:197: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   66E1 DD 4E 04      [19]  751 	ld	c,4 (ix)
   66E4 DD 46 05      [19]  752 	ld	b,5 (ix)
   66E7 69            [ 4]  753 	ld	l, c
   66E8 60            [ 4]  754 	ld	h, b
   66E9 23            [ 6]  755 	inc	hl
   66EA 56            [ 7]  756 	ld	d,(hl)
   66EB 0A            [ 7]  757 	ld	a,(bc)
   66EC 47            [ 4]  758 	ld	b,a
   66ED D5            [11]  759 	push	de
   66EE 33            [ 6]  760 	inc	sp
   66EF C5            [11]  761 	push	bc
   66F0 33            [ 6]  762 	inc	sp
   66F1 21 00 C0      [10]  763 	ld	hl,#0xC000
   66F4 E5            [11]  764 	push	hl
   66F5 CD 05 5F      [17]  765 	call	_cpct_getScreenPtr
   66F8 4D            [ 4]  766 	ld	c,l
   66F9 44            [ 4]  767 	ld	b,h
                            768 ;src/main.c:198: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   66FA 11 00 01      [10]  769 	ld	de,#_g_tablatrans+0
   66FD D5            [11]  770 	push	de
   66FE 21 04 16      [10]  771 	ld	hl,#0x1604
   6701 E5            [11]  772 	push	hl
   6702 C5            [11]  773 	push	bc
   6703 21 70 19      [10]  774 	ld	hl,#_g_explosion
   6706 E5            [11]  775 	push	hl
   6707 CD 25 5F      [17]  776 	call	_cpct_drawSpriteMaskedAlignedTable
   670A DD E1         [14]  777 	pop	ix
   670C C9            [10]  778 	ret
                            779 ;src/main.c:201: void borrarExplosion(TEnemy *enemy) {
                            780 ;	---------------------------------
                            781 ; Function borrarExplosion
                            782 ; ---------------------------------
   670D                     783 _borrarExplosion::
   670D DD E5         [15]  784 	push	ix
   670F DD 21 00 00   [14]  785 	ld	ix,#0
   6713 DD 39         [15]  786 	add	ix,sp
   6715 F5            [11]  787 	push	af
   6716 3B            [ 6]  788 	dec	sp
                            789 ;src/main.c:204: u8 w = 4 + (enemy->px & 1);
   6717 DD 5E 04      [19]  790 	ld	e,4 (ix)
   671A DD 56 05      [19]  791 	ld	d,5 (ix)
   671D 6B            [ 4]  792 	ld	l, e
   671E 62            [ 4]  793 	ld	h, d
   671F 23            [ 6]  794 	inc	hl
   6720 23            [ 6]  795 	inc	hl
   6721 4E            [ 7]  796 	ld	c,(hl)
   6722 79            [ 4]  797 	ld	a,c
   6723 E6 01         [ 7]  798 	and	a, #0x01
   6725 47            [ 4]  799 	ld	b,a
   6726 04            [ 4]  800 	inc	b
   6727 04            [ 4]  801 	inc	b
   6728 04            [ 4]  802 	inc	b
   6729 04            [ 4]  803 	inc	b
                            804 ;src/main.c:207: u8 h = 6 + (enemy->py & 2 ? 1 : 0);
   672A EB            [ 4]  805 	ex	de,hl
   672B 23            [ 6]  806 	inc	hl
   672C 23            [ 6]  807 	inc	hl
   672D 23            [ 6]  808 	inc	hl
   672E 5E            [ 7]  809 	ld	e,(hl)
   672F CB 4B         [ 8]  810 	bit	1, e
   6731 28 04         [12]  811 	jr	Z,00103$
   6733 3E 01         [ 7]  812 	ld	a,#0x01
   6735 18 02         [12]  813 	jr	00104$
   6737                     814 00103$:
   6737 3E 00         [ 7]  815 	ld	a,#0x00
   6739                     816 00104$:
   6739 C6 06         [ 7]  817 	add	a, #0x06
   673B DD 77 FD      [19]  818 	ld	-3 (ix),a
                            819 ;src/main.c:209: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   673E FD 2A C5 63   [20]  820 	ld	iy,(_mapa)
   6742 16 00         [ 7]  821 	ld	d,#0x00
   6744 7B            [ 4]  822 	ld	a,e
   6745 C6 E8         [ 7]  823 	add	a,#0xE8
   6747 DD 77 FE      [19]  824 	ld	-2 (ix),a
   674A 7A            [ 4]  825 	ld	a,d
   674B CE FF         [ 7]  826 	adc	a,#0xFF
   674D DD 77 FF      [19]  827 	ld	-1 (ix),a
   6750 DD 6E FE      [19]  828 	ld	l,-2 (ix)
   6753 DD 66 FF      [19]  829 	ld	h,-1 (ix)
   6756 DD CB FF 7E   [20]  830 	bit	7, -1 (ix)
   675A 28 04         [12]  831 	jr	Z,00105$
   675C 21 EB FF      [10]  832 	ld	hl,#0xFFEB
   675F 19            [11]  833 	add	hl,de
   6760                     834 00105$:
   6760 CB 2C         [ 8]  835 	sra	h
   6762 CB 1D         [ 8]  836 	rr	l
   6764 CB 2C         [ 8]  837 	sra	h
   6766 CB 1D         [ 8]  838 	rr	l
   6768 55            [ 4]  839 	ld	d,l
   6769 CB 39         [ 8]  840 	srl	c
   676B FD E5         [15]  841 	push	iy
   676D 21 F0 C0      [10]  842 	ld	hl,#0xC0F0
   6770 E5            [11]  843 	push	hl
   6771 3E 28         [ 7]  844 	ld	a,#0x28
   6773 F5            [11]  845 	push	af
   6774 33            [ 6]  846 	inc	sp
   6775 DD 7E FD      [19]  847 	ld	a,-3 (ix)
   6778 F5            [11]  848 	push	af
   6779 33            [ 6]  849 	inc	sp
   677A C5            [11]  850 	push	bc
   677B 33            [ 6]  851 	inc	sp
   677C D5            [11]  852 	push	de
   677D 33            [ 6]  853 	inc	sp
   677E 79            [ 4]  854 	ld	a,c
   677F F5            [11]  855 	push	af
   6780 33            [ 6]  856 	inc	sp
   6781 CD E7 53      [17]  857 	call	_cpct_etm_drawTileBox2x4
   6784 DD F9         [10]  858 	ld	sp, ix
   6786 DD E1         [14]  859 	pop	ix
   6788 C9            [10]  860 	ret
                            861 ;src/main.c:213: void borrarEnemigo(u8 x, u8 y) {
                            862 ;	---------------------------------
                            863 ; Function borrarEnemigo
                            864 ; ---------------------------------
   6789                     865 _borrarEnemigo::
   6789 DD E5         [15]  866 	push	ix
   678B DD 21 00 00   [14]  867 	ld	ix,#0
   678F DD 39         [15]  868 	add	ix,sp
   6791 F5            [11]  869 	push	af
   6792 F5            [11]  870 	push	af
                            871 ;src/main.c:217: u8 w = 4 + (x & 1);
   6793 DD 7E 04      [19]  872 	ld	a,4 (ix)
   6796 E6 01         [ 7]  873 	and	a, #0x01
   6798 5F            [ 4]  874 	ld	e,a
   6799 1C            [ 4]  875 	inc	e
   679A 1C            [ 4]  876 	inc	e
   679B 1C            [ 4]  877 	inc	e
   679C 1C            [ 4]  878 	inc	e
                            879 ;src/main.c:220: u8 h = 6 + (y & 3 ? 1 : 0);
   679D DD 7E 05      [19]  880 	ld	a,5 (ix)
   67A0 E6 03         [ 7]  881 	and	a, #0x03
   67A2 28 04         [12]  882 	jr	Z,00103$
   67A4 3E 01         [ 7]  883 	ld	a,#0x01
   67A6 18 02         [12]  884 	jr	00104$
   67A8                     885 00103$:
   67A8 3E 00         [ 7]  886 	ld	a,#0x00
   67AA                     887 00104$:
   67AA C6 06         [ 7]  888 	add	a, #0x06
   67AC 57            [ 4]  889 	ld	d,a
                            890 ;src/main.c:222: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   67AD 2A C5 63      [16]  891 	ld	hl,(_mapa)
   67B0 DD 75 FE      [19]  892 	ld	-2 (ix),l
   67B3 DD 74 FF      [19]  893 	ld	-1 (ix),h
   67B6 DD 4E 05      [19]  894 	ld	c,5 (ix)
   67B9 06 00         [ 7]  895 	ld	b,#0x00
   67BB 79            [ 4]  896 	ld	a,c
   67BC C6 E8         [ 7]  897 	add	a,#0xE8
   67BE DD 77 FC      [19]  898 	ld	-4 (ix),a
   67C1 78            [ 4]  899 	ld	a,b
   67C2 CE FF         [ 7]  900 	adc	a,#0xFF
   67C4 DD 77 FD      [19]  901 	ld	-3 (ix),a
   67C7 E1            [10]  902 	pop	hl
   67C8 E5            [11]  903 	push	hl
   67C9 DD CB FD 7E   [20]  904 	bit	7, -3 (ix)
   67CD 28 04         [12]  905 	jr	Z,00105$
   67CF 21 EB FF      [10]  906 	ld	hl,#0xFFEB
   67D2 09            [11]  907 	add	hl,bc
   67D3                     908 00105$:
   67D3 CB 2C         [ 8]  909 	sra	h
   67D5 CB 1D         [ 8]  910 	rr	l
   67D7 CB 2C         [ 8]  911 	sra	h
   67D9 CB 1D         [ 8]  912 	rr	l
   67DB 45            [ 4]  913 	ld	b,l
   67DC DD 4E 04      [19]  914 	ld	c,4 (ix)
   67DF CB 39         [ 8]  915 	srl	c
   67E1 DD 6E FE      [19]  916 	ld	l,-2 (ix)
   67E4 DD 66 FF      [19]  917 	ld	h,-1 (ix)
   67E7 E5            [11]  918 	push	hl
   67E8 21 F0 C0      [10]  919 	ld	hl,#0xC0F0
   67EB E5            [11]  920 	push	hl
   67EC 3E 28         [ 7]  921 	ld	a,#0x28
   67EE F5            [11]  922 	push	af
   67EF 33            [ 6]  923 	inc	sp
   67F0 D5            [11]  924 	push	de
   67F1 C5            [11]  925 	push	bc
   67F2 CD E7 53      [17]  926 	call	_cpct_etm_drawTileBox2x4
                            927 ;src/main.c:224: enemy->mover = NO;
   67F5 21 66 5F      [10]  928 	ld	hl,#(_enemy + 0x0006)
   67F8 36 00         [10]  929 	ld	(hl),#0x00
   67FA DD F9         [10]  930 	ld	sp, ix
   67FC DD E1         [14]  931 	pop	ix
   67FE C9            [10]  932 	ret
                            933 ;src/main.c:227: void redibujarEnemigo(u8 x, u8 y, TEnemy *enemy) {
                            934 ;	---------------------------------
                            935 ; Function redibujarEnemigo
                            936 ; ---------------------------------
   67FF                     937 _redibujarEnemigo::
   67FF DD E5         [15]  938 	push	ix
   6801 DD 21 00 00   [14]  939 	ld	ix,#0
   6805 DD 39         [15]  940 	add	ix,sp
                            941 ;src/main.c:228: borrarEnemigo(x, y);
   6807 DD 66 05      [19]  942 	ld	h,5 (ix)
   680A DD 6E 04      [19]  943 	ld	l,4 (ix)
   680D E5            [11]  944 	push	hl
   680E CD 89 67      [17]  945 	call	_borrarEnemigo
   6811 F1            [10]  946 	pop	af
                            947 ;src/main.c:229: enemy->px = enemy->x;
   6812 DD 4E 06      [19]  948 	ld	c,6 (ix)
   6815 DD 46 07      [19]  949 	ld	b,7 (ix)
   6818 59            [ 4]  950 	ld	e, c
   6819 50            [ 4]  951 	ld	d, b
   681A 13            [ 6]  952 	inc	de
   681B 13            [ 6]  953 	inc	de
   681C 0A            [ 7]  954 	ld	a,(bc)
   681D 12            [ 7]  955 	ld	(de),a
                            956 ;src/main.c:230: enemy->py = enemy->y;
   681E 59            [ 4]  957 	ld	e, c
   681F 50            [ 4]  958 	ld	d, b
   6820 13            [ 6]  959 	inc	de
   6821 13            [ 6]  960 	inc	de
   6822 13            [ 6]  961 	inc	de
   6823 69            [ 4]  962 	ld	l, c
   6824 60            [ 4]  963 	ld	h, b
   6825 23            [ 6]  964 	inc	hl
   6826 7E            [ 7]  965 	ld	a,(hl)
   6827 12            [ 7]  966 	ld	(de),a
                            967 ;src/main.c:231: dibujarEnemigo(enemy);
   6828 C5            [11]  968 	push	bc
   6829 CD A1 66      [17]  969 	call	_dibujarEnemigo
   682C F1            [10]  970 	pop	af
   682D DD E1         [14]  971 	pop	ix
   682F C9            [10]  972 	ret
                            973 ;src/main.c:234: u8 checkEnemyCollision(u8 direction, TEnemy *enemy){
                            974 ;	---------------------------------
                            975 ; Function checkEnemyCollision
                            976 ; ---------------------------------
   6830                     977 _checkEnemyCollision::
   6830 DD E5         [15]  978 	push	ix
   6832 DD 21 00 00   [14]  979 	ld	ix,#0
   6836 DD 39         [15]  980 	add	ix,sp
   6838 21 F7 FF      [10]  981 	ld	hl,#-9
   683B 39            [11]  982 	add	hl,sp
   683C F9            [ 6]  983 	ld	sp,hl
                            984 ;src/main.c:236: u8 colisiona = 1;
   683D DD 36 F7 01   [19]  985 	ld	-9 (ix),#0x01
                            986 ;src/main.c:238: switch (direction) {
   6841 3E 03         [ 7]  987 	ld	a,#0x03
   6843 DD 96 04      [19]  988 	sub	a, 4 (ix)
   6846 DA 23 6C      [10]  989 	jp	C,00165$
                            990 ;src/main.c:240: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   6849 DD 4E 05      [19]  991 	ld	c,5 (ix)
   684C DD 46 06      [19]  992 	ld	b,6 (ix)
   684F 0A            [ 7]  993 	ld	a,(bc)
   6850 5F            [ 4]  994 	ld	e,a
   6851 21 01 00      [10]  995 	ld	hl,#0x0001
   6854 09            [11]  996 	add	hl,bc
   6855 DD 75 F8      [19]  997 	ld	-8 (ix),l
   6858 DD 74 F9      [19]  998 	ld	-7 (ix),h
   685B DD 6E F8      [19]  999 	ld	l,-8 (ix)
   685E DD 66 F9      [19] 1000 	ld	h,-7 (ix)
   6861 56            [ 7] 1001 	ld	d,(hl)
                           1002 ;src/main.c:253: enemy->muerto = SI;
   6862 21 08 00      [10] 1003 	ld	hl,#0x0008
   6865 09            [11] 1004 	add	hl,bc
   6866 DD 75 FA      [19] 1005 	ld	-6 (ix),l
   6869 DD 74 FB      [19] 1006 	ld	-5 (ix),h
                           1007 ;src/main.c:260: enemy->mira = M_izquierda;
   686C 21 07 00      [10] 1008 	ld	hl,#0x0007
   686F 09            [11] 1009 	add	hl,bc
   6870 DD 75 FC      [19] 1010 	ld	-4 (ix),l
   6873 DD 74 FD      [19] 1011 	ld	-3 (ix),h
                           1012 ;src/main.c:238: switch (direction) {
   6876 D5            [11] 1013 	push	de
   6877 DD 5E 04      [19] 1014 	ld	e,4 (ix)
   687A 16 00         [ 7] 1015 	ld	d,#0x00
   687C 21 84 68      [10] 1016 	ld	hl,#00268$
   687F 19            [11] 1017 	add	hl,de
   6880 19            [11] 1018 	add	hl,de
   6881 19            [11] 1019 	add	hl,de
   6882 D1            [10] 1020 	pop	de
   6883 E9            [ 4] 1021 	jp	(hl)
   6884                    1022 00268$:
   6884 C3 90 68      [10] 1023 	jp	00101$
   6887 C3 78 69      [10] 1024 	jp	00117$
   688A C3 5C 6A      [10] 1025 	jp	00133$
   688D C3 3A 6B      [10] 1026 	jp	00149$
                           1027 ;src/main.c:239: case 0:
   6890                    1028 00101$:
                           1029 ;src/main.c:240: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   6890 7B            [ 4] 1030 	ld	a,e
   6891 C6 05         [ 7] 1031 	add	a, #0x05
   6893 C5            [11] 1032 	push	bc
   6894 D5            [11] 1033 	push	de
   6895 33            [ 6] 1034 	inc	sp
   6896 F5            [11] 1035 	push	af
   6897 33            [ 6] 1036 	inc	sp
   6898 2A C5 63      [16] 1037 	ld	hl,(_mapa)
   689B E5            [11] 1038 	push	hl
   689C CD 1C 4A      [17] 1039 	call	_getTilePtr
   689F F1            [10] 1040 	pop	af
   68A0 F1            [10] 1041 	pop	af
   68A1 C1            [10] 1042 	pop	bc
   68A2 5E            [ 7] 1043 	ld	e,(hl)
   68A3 3E 02         [ 7] 1044 	ld	a,#0x02
   68A5 93            [ 4] 1045 	sub	a, e
   68A6 DA 6D 69      [10] 1046 	jp	C,00113$
                           1047 ;src/main.c:241: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   68A9 DD 6E F8      [19] 1048 	ld	l,-8 (ix)
   68AC DD 66 F9      [19] 1049 	ld	h,-7 (ix)
   68AF 7E            [ 7] 1050 	ld	a,(hl)
   68B0 C6 0B         [ 7] 1051 	add	a, #0x0B
   68B2 57            [ 4] 1052 	ld	d,a
   68B3 0A            [ 7] 1053 	ld	a,(bc)
   68B4 C6 05         [ 7] 1054 	add	a, #0x05
   68B6 C5            [11] 1055 	push	bc
   68B7 D5            [11] 1056 	push	de
   68B8 33            [ 6] 1057 	inc	sp
   68B9 F5            [11] 1058 	push	af
   68BA 33            [ 6] 1059 	inc	sp
   68BB 2A C5 63      [16] 1060 	ld	hl,(_mapa)
   68BE E5            [11] 1061 	push	hl
   68BF CD 1C 4A      [17] 1062 	call	_getTilePtr
   68C2 F1            [10] 1063 	pop	af
   68C3 F1            [10] 1064 	pop	af
   68C4 C1            [10] 1065 	pop	bc
   68C5 5E            [ 7] 1066 	ld	e,(hl)
   68C6 3E 02         [ 7] 1067 	ld	a,#0x02
   68C8 93            [ 4] 1068 	sub	a, e
   68C9 DA 6D 69      [10] 1069 	jp	C,00113$
                           1070 ;src/main.c:242: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   68CC DD 6E F8      [19] 1071 	ld	l,-8 (ix)
   68CF DD 66 F9      [19] 1072 	ld	h,-7 (ix)
   68D2 7E            [ 7] 1073 	ld	a,(hl)
   68D3 C6 16         [ 7] 1074 	add	a, #0x16
   68D5 57            [ 4] 1075 	ld	d,a
   68D6 0A            [ 7] 1076 	ld	a,(bc)
   68D7 C6 05         [ 7] 1077 	add	a, #0x05
   68D9 C5            [11] 1078 	push	bc
   68DA D5            [11] 1079 	push	de
   68DB 33            [ 6] 1080 	inc	sp
   68DC F5            [11] 1081 	push	af
   68DD 33            [ 6] 1082 	inc	sp
   68DE 2A C5 63      [16] 1083 	ld	hl,(_mapa)
   68E1 E5            [11] 1084 	push	hl
   68E2 CD 1C 4A      [17] 1085 	call	_getTilePtr
   68E5 F1            [10] 1086 	pop	af
   68E6 F1            [10] 1087 	pop	af
   68E7 C1            [10] 1088 	pop	bc
   68E8 5E            [ 7] 1089 	ld	e,(hl)
   68E9 3E 02         [ 7] 1090 	ld	a,#0x02
   68EB 93            [ 4] 1091 	sub	a, e
   68EC DA 6D 69      [10] 1092 	jp	C,00113$
                           1093 ;src/main.c:244: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   68EF 21 F1 62      [10] 1094 	ld	hl, #_cu + 1
   68F2 5E            [ 7] 1095 	ld	e,(hl)
   68F3 16 00         [ 7] 1096 	ld	d,#0x00
   68F5 21 04 00      [10] 1097 	ld	hl,#0x0004
   68F8 19            [11] 1098 	add	hl,de
   68F9 DD 75 FE      [19] 1099 	ld	-2 (ix),l
   68FC DD 74 FF      [19] 1100 	ld	-1 (ix),h
   68FF DD 6E F8      [19] 1101 	ld	l,-8 (ix)
   6902 DD 66 F9      [19] 1102 	ld	h,-7 (ix)
   6905 6E            [ 7] 1103 	ld	l,(hl)
   6906 26 00         [ 7] 1104 	ld	h,#0x00
   6908 DD 7E FE      [19] 1105 	ld	a,-2 (ix)
   690B 95            [ 4] 1106 	sub	a, l
   690C DD 7E FF      [19] 1107 	ld	a,-1 (ix)
   690F 9C            [ 4] 1108 	sbc	a, h
   6910 E2 15 69      [10] 1109 	jp	PO, 00269$
   6913 EE 80         [ 7] 1110 	xor	a, #0x80
   6915                    1111 00269$:
   6915 FA 2A 69      [10] 1112 	jp	M,00108$
   6918 D5            [11] 1113 	push	de
   6919 11 16 00      [10] 1114 	ld	de,#0x0016
   691C 19            [11] 1115 	add	hl, de
   691D D1            [10] 1116 	pop	de
   691E 7D            [ 4] 1117 	ld	a,l
   691F 93            [ 4] 1118 	sub	a, e
   6920 7C            [ 4] 1119 	ld	a,h
   6921 9A            [ 4] 1120 	sbc	a, d
   6922 E2 27 69      [10] 1121 	jp	PO, 00270$
   6925 EE 80         [ 7] 1122 	xor	a, #0x80
   6927                    1123 00270$:
   6927 F2 31 69      [10] 1124 	jp	P,00109$
   692A                    1125 00108$:
                           1126 ;src/main.c:245: colisiona = 0;
   692A DD 36 F7 00   [19] 1127 	ld	-9 (ix),#0x00
   692E C3 23 6C      [10] 1128 	jp	00165$
   6931                    1129 00109$:
                           1130 ;src/main.c:248: if(cu.x > enemy->x){ //si el cu esta abajo
   6931 21 F0 62      [10] 1131 	ld	hl, #_cu + 0
   6934 5E            [ 7] 1132 	ld	e,(hl)
   6935 0A            [ 7] 1133 	ld	a,(bc)
   6936 4F            [ 4] 1134 	ld	c,a
   6937 93            [ 4] 1135 	sub	a, e
   6938 30 2C         [12] 1136 	jr	NC,00106$
                           1137 ;src/main.c:249: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
   693A 6B            [ 4] 1138 	ld	l,e
   693B 26 00         [ 7] 1139 	ld	h,#0x00
   693D 06 00         [ 7] 1140 	ld	b,#0x00
   693F 03            [ 6] 1141 	inc	bc
   6940 03            [ 6] 1142 	inc	bc
   6941 03            [ 6] 1143 	inc	bc
   6942 03            [ 6] 1144 	inc	bc
   6943 BF            [ 4] 1145 	cp	a, a
   6944 ED 42         [15] 1146 	sbc	hl, bc
   6946 3E 01         [ 7] 1147 	ld	a,#0x01
   6948 BD            [ 4] 1148 	cp	a, l
   6949 3E 00         [ 7] 1149 	ld	a,#0x00
   694B 9C            [ 4] 1150 	sbc	a, h
   694C E2 51 69      [10] 1151 	jp	PO, 00271$
   694F EE 80         [ 7] 1152 	xor	a, #0x80
   6951                    1153 00271$:
   6951 F2 5B 69      [10] 1154 	jp	P,00103$
                           1155 ;src/main.c:250: colisiona = 0;
   6954 DD 36 F7 00   [19] 1156 	ld	-9 (ix),#0x00
   6958 C3 23 6C      [10] 1157 	jp	00165$
   695B                    1158 00103$:
                           1159 ;src/main.c:253: enemy->muerto = SI;
   695B DD 6E FA      [19] 1160 	ld	l,-6 (ix)
   695E DD 66 FB      [19] 1161 	ld	h,-5 (ix)
   6961 36 01         [10] 1162 	ld	(hl),#0x01
   6963 C3 23 6C      [10] 1163 	jp	00165$
   6966                    1164 00106$:
                           1165 ;src/main.c:256: colisiona = 0;
   6966 DD 36 F7 00   [19] 1166 	ld	-9 (ix),#0x00
   696A C3 23 6C      [10] 1167 	jp	00165$
   696D                    1168 00113$:
                           1169 ;src/main.c:260: enemy->mira = M_izquierda;
   696D DD 6E FC      [19] 1170 	ld	l,-4 (ix)
   6970 DD 66 FD      [19] 1171 	ld	h,-3 (ix)
   6973 36 01         [10] 1172 	ld	(hl),#0x01
                           1173 ;src/main.c:262: break;
   6975 C3 23 6C      [10] 1174 	jp	00165$
                           1175 ;src/main.c:263: case 1:
   6978                    1176 00117$:
                           1177 ;src/main.c:264: if( *getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   6978 1D            [ 4] 1178 	dec	e
   6979 C5            [11] 1179 	push	bc
   697A D5            [11] 1180 	push	de
   697B 2A C5 63      [16] 1181 	ld	hl,(_mapa)
   697E E5            [11] 1182 	push	hl
   697F CD 1C 4A      [17] 1183 	call	_getTilePtr
   6982 F1            [10] 1184 	pop	af
   6983 F1            [10] 1185 	pop	af
   6984 C1            [10] 1186 	pop	bc
   6985 5E            [ 7] 1187 	ld	e,(hl)
   6986 3E 02         [ 7] 1188 	ld	a,#0x02
   6988 93            [ 4] 1189 	sub	a, e
   6989 DA 51 6A      [10] 1190 	jp	C,00129$
                           1191 ;src/main.c:265: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   698C DD 6E F8      [19] 1192 	ld	l,-8 (ix)
   698F DD 66 F9      [19] 1193 	ld	h,-7 (ix)
   6992 7E            [ 7] 1194 	ld	a,(hl)
   6993 C6 0B         [ 7] 1195 	add	a, #0x0B
   6995 57            [ 4] 1196 	ld	d,a
   6996 0A            [ 7] 1197 	ld	a,(bc)
   6997 C6 FF         [ 7] 1198 	add	a,#0xFF
   6999 C5            [11] 1199 	push	bc
   699A D5            [11] 1200 	push	de
   699B 33            [ 6] 1201 	inc	sp
   699C F5            [11] 1202 	push	af
   699D 33            [ 6] 1203 	inc	sp
   699E 2A C5 63      [16] 1204 	ld	hl,(_mapa)
   69A1 E5            [11] 1205 	push	hl
   69A2 CD 1C 4A      [17] 1206 	call	_getTilePtr
   69A5 F1            [10] 1207 	pop	af
   69A6 F1            [10] 1208 	pop	af
   69A7 C1            [10] 1209 	pop	bc
   69A8 5E            [ 7] 1210 	ld	e,(hl)
   69A9 3E 02         [ 7] 1211 	ld	a,#0x02
   69AB 93            [ 4] 1212 	sub	a, e
   69AC DA 51 6A      [10] 1213 	jp	C,00129$
                           1214 ;src/main.c:266: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   69AF DD 6E F8      [19] 1215 	ld	l,-8 (ix)
   69B2 DD 66 F9      [19] 1216 	ld	h,-7 (ix)
   69B5 7E            [ 7] 1217 	ld	a,(hl)
   69B6 C6 16         [ 7] 1218 	add	a, #0x16
   69B8 57            [ 4] 1219 	ld	d,a
   69B9 0A            [ 7] 1220 	ld	a,(bc)
   69BA C6 FF         [ 7] 1221 	add	a,#0xFF
   69BC C5            [11] 1222 	push	bc
   69BD D5            [11] 1223 	push	de
   69BE 33            [ 6] 1224 	inc	sp
   69BF F5            [11] 1225 	push	af
   69C0 33            [ 6] 1226 	inc	sp
   69C1 2A C5 63      [16] 1227 	ld	hl,(_mapa)
   69C4 E5            [11] 1228 	push	hl
   69C5 CD 1C 4A      [17] 1229 	call	_getTilePtr
   69C8 F1            [10] 1230 	pop	af
   69C9 F1            [10] 1231 	pop	af
   69CA C1            [10] 1232 	pop	bc
   69CB 5E            [ 7] 1233 	ld	e,(hl)
   69CC 3E 02         [ 7] 1234 	ld	a,#0x02
   69CE 93            [ 4] 1235 	sub	a, e
   69CF DA 51 6A      [10] 1236 	jp	C,00129$
                           1237 ;src/main.c:268: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   69D2 21 F1 62      [10] 1238 	ld	hl, #_cu + 1
   69D5 5E            [ 7] 1239 	ld	e,(hl)
   69D6 16 00         [ 7] 1240 	ld	d,#0x00
   69D8 21 04 00      [10] 1241 	ld	hl,#0x0004
   69DB 19            [11] 1242 	add	hl,de
   69DC DD 75 FE      [19] 1243 	ld	-2 (ix),l
   69DF DD 74 FF      [19] 1244 	ld	-1 (ix),h
   69E2 DD 6E F8      [19] 1245 	ld	l,-8 (ix)
   69E5 DD 66 F9      [19] 1246 	ld	h,-7 (ix)
   69E8 6E            [ 7] 1247 	ld	l,(hl)
   69E9 26 00         [ 7] 1248 	ld	h,#0x00
   69EB DD 7E FE      [19] 1249 	ld	a,-2 (ix)
   69EE 95            [ 4] 1250 	sub	a, l
   69EF DD 7E FF      [19] 1251 	ld	a,-1 (ix)
   69F2 9C            [ 4] 1252 	sbc	a, h
   69F3 E2 F8 69      [10] 1253 	jp	PO, 00272$
   69F6 EE 80         [ 7] 1254 	xor	a, #0x80
   69F8                    1255 00272$:
   69F8 FA 0D 6A      [10] 1256 	jp	M,00124$
   69FB D5            [11] 1257 	push	de
   69FC 11 16 00      [10] 1258 	ld	de,#0x0016
   69FF 19            [11] 1259 	add	hl, de
   6A00 D1            [10] 1260 	pop	de
   6A01 7D            [ 4] 1261 	ld	a,l
   6A02 93            [ 4] 1262 	sub	a, e
   6A03 7C            [ 4] 1263 	ld	a,h
   6A04 9A            [ 4] 1264 	sbc	a, d
   6A05 E2 0A 6A      [10] 1265 	jp	PO, 00273$
   6A08 EE 80         [ 7] 1266 	xor	a, #0x80
   6A0A                    1267 00273$:
   6A0A F2 14 6A      [10] 1268 	jp	P,00125$
   6A0D                    1269 00124$:
                           1270 ;src/main.c:269: colisiona = 0;
   6A0D DD 36 F7 00   [19] 1271 	ld	-9 (ix),#0x00
   6A11 C3 23 6C      [10] 1272 	jp	00165$
   6A14                    1273 00125$:
                           1274 ;src/main.c:272: if(enemy->x > cu.x){ //si el cu esta abajo
   6A14 0A            [ 7] 1275 	ld	a,(bc)
   6A15 5F            [ 4] 1276 	ld	e,a
   6A16 21 F0 62      [10] 1277 	ld	hl, #_cu + 0
   6A19 4E            [ 7] 1278 	ld	c,(hl)
   6A1A 79            [ 4] 1279 	ld	a,c
   6A1B 93            [ 4] 1280 	sub	a, e
   6A1C 30 2C         [12] 1281 	jr	NC,00122$
                           1282 ;src/main.c:273: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
   6A1E 6B            [ 4] 1283 	ld	l,e
   6A1F 26 00         [ 7] 1284 	ld	h,#0x00
   6A21 06 00         [ 7] 1285 	ld	b,#0x00
   6A23 03            [ 6] 1286 	inc	bc
   6A24 03            [ 6] 1287 	inc	bc
   6A25 03            [ 6] 1288 	inc	bc
   6A26 03            [ 6] 1289 	inc	bc
   6A27 BF            [ 4] 1290 	cp	a, a
   6A28 ED 42         [15] 1291 	sbc	hl, bc
   6A2A 3E 01         [ 7] 1292 	ld	a,#0x01
   6A2C BD            [ 4] 1293 	cp	a, l
   6A2D 3E 00         [ 7] 1294 	ld	a,#0x00
   6A2F 9C            [ 4] 1295 	sbc	a, h
   6A30 E2 35 6A      [10] 1296 	jp	PO, 00274$
   6A33 EE 80         [ 7] 1297 	xor	a, #0x80
   6A35                    1298 00274$:
   6A35 F2 3F 6A      [10] 1299 	jp	P,00119$
                           1300 ;src/main.c:274: colisiona = 0;
   6A38 DD 36 F7 00   [19] 1301 	ld	-9 (ix),#0x00
   6A3C C3 23 6C      [10] 1302 	jp	00165$
   6A3F                    1303 00119$:
                           1304 ;src/main.c:277: enemy->muerto = SI;
   6A3F DD 6E FA      [19] 1305 	ld	l,-6 (ix)
   6A42 DD 66 FB      [19] 1306 	ld	h,-5 (ix)
   6A45 36 01         [10] 1307 	ld	(hl),#0x01
   6A47 C3 23 6C      [10] 1308 	jp	00165$
   6A4A                    1309 00122$:
                           1310 ;src/main.c:280: colisiona = 0;
   6A4A DD 36 F7 00   [19] 1311 	ld	-9 (ix),#0x00
   6A4E C3 23 6C      [10] 1312 	jp	00165$
   6A51                    1313 00129$:
                           1314 ;src/main.c:284: enemy->mira = M_derecha;
   6A51 DD 6E FC      [19] 1315 	ld	l,-4 (ix)
   6A54 DD 66 FD      [19] 1316 	ld	h,-3 (ix)
   6A57 36 00         [10] 1317 	ld	(hl),#0x00
                           1318 ;src/main.c:286: break;
   6A59 C3 23 6C      [10] 1319 	jp	00165$
                           1320 ;src/main.c:287: case 2:
   6A5C                    1321 00133$:
                           1322 ;src/main.c:288: if( *getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   6A5C 15            [ 4] 1323 	dec	d
   6A5D 15            [ 4] 1324 	dec	d
   6A5E C5            [11] 1325 	push	bc
   6A5F D5            [11] 1326 	push	de
   6A60 2A C5 63      [16] 1327 	ld	hl,(_mapa)
   6A63 E5            [11] 1328 	push	hl
   6A64 CD 1C 4A      [17] 1329 	call	_getTilePtr
   6A67 F1            [10] 1330 	pop	af
   6A68 F1            [10] 1331 	pop	af
   6A69 C1            [10] 1332 	pop	bc
   6A6A 5E            [ 7] 1333 	ld	e,(hl)
   6A6B 3E 02         [ 7] 1334 	ld	a,#0x02
   6A6D 93            [ 4] 1335 	sub	a, e
   6A6E DA 32 6B      [10] 1336 	jp	C,00145$
                           1337 ;src/main.c:289: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   6A71 DD 6E F8      [19] 1338 	ld	l,-8 (ix)
   6A74 DD 66 F9      [19] 1339 	ld	h,-7 (ix)
   6A77 56            [ 7] 1340 	ld	d,(hl)
   6A78 15            [ 4] 1341 	dec	d
   6A79 15            [ 4] 1342 	dec	d
   6A7A 0A            [ 7] 1343 	ld	a,(bc)
   6A7B C6 02         [ 7] 1344 	add	a, #0x02
   6A7D C5            [11] 1345 	push	bc
   6A7E D5            [11] 1346 	push	de
   6A7F 33            [ 6] 1347 	inc	sp
   6A80 F5            [11] 1348 	push	af
   6A81 33            [ 6] 1349 	inc	sp
   6A82 2A C5 63      [16] 1350 	ld	hl,(_mapa)
   6A85 E5            [11] 1351 	push	hl
   6A86 CD 1C 4A      [17] 1352 	call	_getTilePtr
   6A89 F1            [10] 1353 	pop	af
   6A8A F1            [10] 1354 	pop	af
   6A8B C1            [10] 1355 	pop	bc
   6A8C 5E            [ 7] 1356 	ld	e,(hl)
   6A8D 3E 02         [ 7] 1357 	ld	a,#0x02
   6A8F 93            [ 4] 1358 	sub	a, e
   6A90 DA 32 6B      [10] 1359 	jp	C,00145$
                           1360 ;src/main.c:290: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   6A93 DD 6E F8      [19] 1361 	ld	l,-8 (ix)
   6A96 DD 66 F9      [19] 1362 	ld	h,-7 (ix)
   6A99 56            [ 7] 1363 	ld	d,(hl)
   6A9A 15            [ 4] 1364 	dec	d
   6A9B 15            [ 4] 1365 	dec	d
   6A9C 0A            [ 7] 1366 	ld	a,(bc)
   6A9D C6 04         [ 7] 1367 	add	a, #0x04
   6A9F C5            [11] 1368 	push	bc
   6AA0 D5            [11] 1369 	push	de
   6AA1 33            [ 6] 1370 	inc	sp
   6AA2 F5            [11] 1371 	push	af
   6AA3 33            [ 6] 1372 	inc	sp
   6AA4 2A C5 63      [16] 1373 	ld	hl,(_mapa)
   6AA7 E5            [11] 1374 	push	hl
   6AA8 CD 1C 4A      [17] 1375 	call	_getTilePtr
   6AAB F1            [10] 1376 	pop	af
   6AAC F1            [10] 1377 	pop	af
   6AAD C1            [10] 1378 	pop	bc
   6AAE 5E            [ 7] 1379 	ld	e,(hl)
   6AAF 3E 02         [ 7] 1380 	ld	a,#0x02
   6AB1 93            [ 4] 1381 	sub	a, e
   6AB2 DA 32 6B      [10] 1382 	jp	C,00145$
                           1383 ;src/main.c:292: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   6AB5 21 F0 62      [10] 1384 	ld	hl, #_cu + 0
   6AB8 5E            [ 7] 1385 	ld	e,(hl)
   6AB9 16 00         [ 7] 1386 	ld	d,#0x00
   6ABB 21 02 00      [10] 1387 	ld	hl,#0x0002
   6ABE 19            [11] 1388 	add	hl,de
   6ABF DD 75 FE      [19] 1389 	ld	-2 (ix),l
   6AC2 DD 74 FF      [19] 1390 	ld	-1 (ix),h
   6AC5 0A            [ 7] 1391 	ld	a,(bc)
   6AC6 6F            [ 4] 1392 	ld	l,a
   6AC7 26 00         [ 7] 1393 	ld	h,#0x00
   6AC9 DD 7E FE      [19] 1394 	ld	a,-2 (ix)
   6ACC 95            [ 4] 1395 	sub	a, l
   6ACD DD 7E FF      [19] 1396 	ld	a,-1 (ix)
   6AD0 9C            [ 4] 1397 	sbc	a, h
   6AD1 E2 D6 6A      [10] 1398 	jp	PO, 00275$
   6AD4 EE 80         [ 7] 1399 	xor	a, #0x80
   6AD6                    1400 00275$:
   6AD6 FA E9 6A      [10] 1401 	jp	M,00140$
   6AD9 23            [ 6] 1402 	inc	hl
   6ADA 23            [ 6] 1403 	inc	hl
   6ADB 23            [ 6] 1404 	inc	hl
   6ADC 23            [ 6] 1405 	inc	hl
   6ADD 7D            [ 4] 1406 	ld	a,l
   6ADE 93            [ 4] 1407 	sub	a, e
   6ADF 7C            [ 4] 1408 	ld	a,h
   6AE0 9A            [ 4] 1409 	sbc	a, d
   6AE1 E2 E6 6A      [10] 1410 	jp	PO, 00276$
   6AE4 EE 80         [ 7] 1411 	xor	a, #0x80
   6AE6                    1412 00276$:
   6AE6 F2 EF 6A      [10] 1413 	jp	P,00141$
   6AE9                    1414 00140$:
                           1415 ;src/main.c:294: colisiona = 0;
   6AE9 DD 36 F7 00   [19] 1416 	ld	-9 (ix),#0x00
   6AED 18 4B         [12] 1417 	jr	00149$
   6AEF                    1418 00141$:
                           1419 ;src/main.c:297: if(enemy->y>cu.y){
   6AEF DD 6E F8      [19] 1420 	ld	l,-8 (ix)
   6AF2 DD 66 F9      [19] 1421 	ld	h,-7 (ix)
   6AF5 5E            [ 7] 1422 	ld	e,(hl)
   6AF6 21 F1 62      [10] 1423 	ld	hl, #(_cu + 0x0001) + 0
   6AF9 6E            [ 7] 1424 	ld	l,(hl)
   6AFA 7D            [ 4] 1425 	ld	a,l
   6AFB 93            [ 4] 1426 	sub	a, e
   6AFC 30 2E         [12] 1427 	jr	NC,00138$
                           1428 ;src/main.c:298: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   6AFE 16 00         [ 7] 1429 	ld	d,#0x00
   6B00 26 00         [ 7] 1430 	ld	h,#0x00
   6B02 D5            [11] 1431 	push	de
   6B03 11 08 00      [10] 1432 	ld	de,#0x0008
   6B06 19            [11] 1433 	add	hl, de
   6B07 D1            [10] 1434 	pop	de
   6B08 7B            [ 4] 1435 	ld	a,e
   6B09 95            [ 4] 1436 	sub	a, l
   6B0A 5F            [ 4] 1437 	ld	e,a
   6B0B 7A            [ 4] 1438 	ld	a,d
   6B0C 9C            [ 4] 1439 	sbc	a, h
   6B0D 57            [ 4] 1440 	ld	d,a
   6B0E 3E 02         [ 7] 1441 	ld	a,#0x02
   6B10 BB            [ 4] 1442 	cp	a, e
   6B11 3E 00         [ 7] 1443 	ld	a,#0x00
   6B13 9A            [ 4] 1444 	sbc	a, d
   6B14 E2 19 6B      [10] 1445 	jp	PO, 00277$
   6B17 EE 80         [ 7] 1446 	xor	a, #0x80
   6B19                    1447 00277$:
   6B19 F2 22 6B      [10] 1448 	jp	P,00135$
                           1449 ;src/main.c:299: colisiona = 0;
   6B1C DD 36 F7 00   [19] 1450 	ld	-9 (ix),#0x00
   6B20 18 18         [12] 1451 	jr	00149$
   6B22                    1452 00135$:
                           1453 ;src/main.c:302: enemy->muerto = SI;
   6B22 DD 6E FA      [19] 1454 	ld	l,-6 (ix)
   6B25 DD 66 FB      [19] 1455 	ld	h,-5 (ix)
   6B28 36 01         [10] 1456 	ld	(hl),#0x01
   6B2A 18 0E         [12] 1457 	jr	00149$
   6B2C                    1458 00138$:
                           1459 ;src/main.c:306: colisiona = 0;
   6B2C DD 36 F7 00   [19] 1460 	ld	-9 (ix),#0x00
   6B30 18 08         [12] 1461 	jr	00149$
   6B32                    1462 00145$:
                           1463 ;src/main.c:312: enemy->mira = M_abajo;
   6B32 DD 6E FC      [19] 1464 	ld	l,-4 (ix)
   6B35 DD 66 FD      [19] 1465 	ld	h,-3 (ix)
   6B38 36 03         [10] 1466 	ld	(hl),#0x03
                           1467 ;src/main.c:315: case 3:
   6B3A                    1468 00149$:
                           1469 ;src/main.c:318: if( *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   6B3A DD 6E F8      [19] 1470 	ld	l,-8 (ix)
   6B3D DD 66 F9      [19] 1471 	ld	h,-7 (ix)
   6B40 7E            [ 7] 1472 	ld	a,(hl)
   6B41 C6 18         [ 7] 1473 	add	a, #0x18
   6B43 57            [ 4] 1474 	ld	d,a
   6B44 0A            [ 7] 1475 	ld	a,(bc)
   6B45 C5            [11] 1476 	push	bc
   6B46 D5            [11] 1477 	push	de
   6B47 33            [ 6] 1478 	inc	sp
   6B48 F5            [11] 1479 	push	af
   6B49 33            [ 6] 1480 	inc	sp
   6B4A 2A C5 63      [16] 1481 	ld	hl,(_mapa)
   6B4D E5            [11] 1482 	push	hl
   6B4E CD 1C 4A      [17] 1483 	call	_getTilePtr
   6B51 F1            [10] 1484 	pop	af
   6B52 F1            [10] 1485 	pop	af
   6B53 C1            [10] 1486 	pop	bc
   6B54 5E            [ 7] 1487 	ld	e,(hl)
   6B55 3E 02         [ 7] 1488 	ld	a,#0x02
   6B57 93            [ 4] 1489 	sub	a, e
   6B58 DA 1B 6C      [10] 1490 	jp	C,00161$
                           1491 ;src/main.c:319: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   6B5B DD 6E F8      [19] 1492 	ld	l,-8 (ix)
   6B5E DD 66 F9      [19] 1493 	ld	h,-7 (ix)
   6B61 7E            [ 7] 1494 	ld	a,(hl)
   6B62 C6 18         [ 7] 1495 	add	a, #0x18
   6B64 57            [ 4] 1496 	ld	d,a
   6B65 0A            [ 7] 1497 	ld	a,(bc)
   6B66 C6 02         [ 7] 1498 	add	a, #0x02
   6B68 C5            [11] 1499 	push	bc
   6B69 D5            [11] 1500 	push	de
   6B6A 33            [ 6] 1501 	inc	sp
   6B6B F5            [11] 1502 	push	af
   6B6C 33            [ 6] 1503 	inc	sp
   6B6D 2A C5 63      [16] 1504 	ld	hl,(_mapa)
   6B70 E5            [11] 1505 	push	hl
   6B71 CD 1C 4A      [17] 1506 	call	_getTilePtr
   6B74 F1            [10] 1507 	pop	af
   6B75 F1            [10] 1508 	pop	af
   6B76 C1            [10] 1509 	pop	bc
   6B77 5E            [ 7] 1510 	ld	e,(hl)
   6B78 3E 02         [ 7] 1511 	ld	a,#0x02
   6B7A 93            [ 4] 1512 	sub	a, e
   6B7B DA 1B 6C      [10] 1513 	jp	C,00161$
                           1514 ;src/main.c:320: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   6B7E DD 6E F8      [19] 1515 	ld	l,-8 (ix)
   6B81 DD 66 F9      [19] 1516 	ld	h,-7 (ix)
   6B84 7E            [ 7] 1517 	ld	a,(hl)
   6B85 C6 18         [ 7] 1518 	add	a, #0x18
   6B87 57            [ 4] 1519 	ld	d,a
   6B88 0A            [ 7] 1520 	ld	a,(bc)
   6B89 C6 04         [ 7] 1521 	add	a, #0x04
   6B8B C5            [11] 1522 	push	bc
   6B8C D5            [11] 1523 	push	de
   6B8D 33            [ 6] 1524 	inc	sp
   6B8E F5            [11] 1525 	push	af
   6B8F 33            [ 6] 1526 	inc	sp
   6B90 2A C5 63      [16] 1527 	ld	hl,(_mapa)
   6B93 E5            [11] 1528 	push	hl
   6B94 CD 1C 4A      [17] 1529 	call	_getTilePtr
   6B97 F1            [10] 1530 	pop	af
   6B98 F1            [10] 1531 	pop	af
   6B99 C1            [10] 1532 	pop	bc
   6B9A 5E            [ 7] 1533 	ld	e,(hl)
   6B9B 3E 02         [ 7] 1534 	ld	a,#0x02
   6B9D 93            [ 4] 1535 	sub	a, e
   6B9E 38 7B         [12] 1536 	jr	C,00161$
                           1537 ;src/main.c:322: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   6BA0 21 F0 62      [10] 1538 	ld	hl, #_cu + 0
   6BA3 5E            [ 7] 1539 	ld	e,(hl)
   6BA4 16 00         [ 7] 1540 	ld	d,#0x00
   6BA6 21 02 00      [10] 1541 	ld	hl,#0x0002
   6BA9 19            [11] 1542 	add	hl,de
   6BAA DD 75 FE      [19] 1543 	ld	-2 (ix),l
   6BAD DD 74 FF      [19] 1544 	ld	-1 (ix),h
   6BB0 0A            [ 7] 1545 	ld	a,(bc)
   6BB1 4F            [ 4] 1546 	ld	c,a
   6BB2 06 00         [ 7] 1547 	ld	b,#0x00
   6BB4 DD 7E FE      [19] 1548 	ld	a,-2 (ix)
   6BB7 91            [ 4] 1549 	sub	a, c
   6BB8 DD 7E FF      [19] 1550 	ld	a,-1 (ix)
   6BBB 98            [ 4] 1551 	sbc	a, b
   6BBC E2 C1 6B      [10] 1552 	jp	PO, 00278$
   6BBF EE 80         [ 7] 1553 	xor	a, #0x80
   6BC1                    1554 00278$:
   6BC1 FA D4 6B      [10] 1555 	jp	M,00156$
   6BC4 03            [ 6] 1556 	inc	bc
   6BC5 03            [ 6] 1557 	inc	bc
   6BC6 03            [ 6] 1558 	inc	bc
   6BC7 03            [ 6] 1559 	inc	bc
   6BC8 79            [ 4] 1560 	ld	a,c
   6BC9 93            [ 4] 1561 	sub	a, e
   6BCA 78            [ 4] 1562 	ld	a,b
   6BCB 9A            [ 4] 1563 	sbc	a, d
   6BCC E2 D1 6B      [10] 1564 	jp	PO, 00279$
   6BCF EE 80         [ 7] 1565 	xor	a, #0x80
   6BD1                    1566 00279$:
   6BD1 F2 DA 6B      [10] 1567 	jp	P,00157$
   6BD4                    1568 00156$:
                           1569 ;src/main.c:323: colisiona = 0;
   6BD4 DD 36 F7 00   [19] 1570 	ld	-9 (ix),#0x00
   6BD8 18 49         [12] 1571 	jr	00165$
   6BDA                    1572 00157$:
                           1573 ;src/main.c:326: if(cu.y > enemy->y){ //si el cu esta abajo
   6BDA 21 F1 62      [10] 1574 	ld	hl, #(_cu + 0x0001) + 0
   6BDD 4E            [ 7] 1575 	ld	c,(hl)
   6BDE DD 6E F8      [19] 1576 	ld	l,-8 (ix)
   6BE1 DD 66 F9      [19] 1577 	ld	h,-7 (ix)
   6BE4 5E            [ 7] 1578 	ld	e,(hl)
   6BE5 7B            [ 4] 1579 	ld	a,e
   6BE6 91            [ 4] 1580 	sub	a, c
   6BE7 30 2C         [12] 1581 	jr	NC,00154$
                           1582 ;src/main.c:327: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   6BE9 06 00         [ 7] 1583 	ld	b,#0x00
   6BEB 16 00         [ 7] 1584 	ld	d,#0x00
   6BED 21 16 00      [10] 1585 	ld	hl,#0x0016
   6BF0 19            [11] 1586 	add	hl,de
   6BF1 79            [ 4] 1587 	ld	a,c
   6BF2 95            [ 4] 1588 	sub	a, l
   6BF3 4F            [ 4] 1589 	ld	c,a
   6BF4 78            [ 4] 1590 	ld	a,b
   6BF5 9C            [ 4] 1591 	sbc	a, h
   6BF6 47            [ 4] 1592 	ld	b,a
   6BF7 3E 02         [ 7] 1593 	ld	a,#0x02
   6BF9 B9            [ 4] 1594 	cp	a, c
   6BFA 3E 00         [ 7] 1595 	ld	a,#0x00
   6BFC 98            [ 4] 1596 	sbc	a, b
   6BFD E2 02 6C      [10] 1597 	jp	PO, 00280$
   6C00 EE 80         [ 7] 1598 	xor	a, #0x80
   6C02                    1599 00280$:
   6C02 F2 0B 6C      [10] 1600 	jp	P,00151$
                           1601 ;src/main.c:328: colisiona = 0;
   6C05 DD 36 F7 00   [19] 1602 	ld	-9 (ix),#0x00
   6C09 18 18         [12] 1603 	jr	00165$
   6C0B                    1604 00151$:
                           1605 ;src/main.c:331: enemy->muerto = SI;
   6C0B DD 6E FA      [19] 1606 	ld	l,-6 (ix)
   6C0E DD 66 FB      [19] 1607 	ld	h,-5 (ix)
   6C11 36 01         [10] 1608 	ld	(hl),#0x01
   6C13 18 0E         [12] 1609 	jr	00165$
   6C15                    1610 00154$:
                           1611 ;src/main.c:335: colisiona = 0;
   6C15 DD 36 F7 00   [19] 1612 	ld	-9 (ix),#0x00
   6C19 18 08         [12] 1613 	jr	00165$
   6C1B                    1614 00161$:
                           1615 ;src/main.c:339: enemy->mira = M_arriba;
   6C1B DD 6E FC      [19] 1616 	ld	l,-4 (ix)
   6C1E DD 66 FD      [19] 1617 	ld	h,-3 (ix)
   6C21 36 02         [10] 1618 	ld	(hl),#0x02
                           1619 ;src/main.c:342: }
   6C23                    1620 00165$:
                           1621 ;src/main.c:343: return colisiona;
   6C23 DD 6E F7      [19] 1622 	ld	l,-9 (ix)
   6C26 DD F9         [10] 1623 	ld	sp, ix
   6C28 DD E1         [14] 1624 	pop	ix
   6C2A C9            [10] 1625 	ret
                           1626 ;src/main.c:346: void moverEnemigoArriba(TEnemy *enemy){
                           1627 ;	---------------------------------
                           1628 ; Function moverEnemigoArriba
                           1629 ; ---------------------------------
   6C2B                    1630 _moverEnemigoArriba::
   6C2B DD E5         [15] 1631 	push	ix
   6C2D DD 21 00 00   [14] 1632 	ld	ix,#0
   6C31 DD 39         [15] 1633 	add	ix,sp
                           1634 ;src/main.c:347: enemy->y--;
   6C33 DD 4E 04      [19] 1635 	ld	c,4 (ix)
   6C36 DD 46 05      [19] 1636 	ld	b,5 (ix)
   6C39 69            [ 4] 1637 	ld	l, c
   6C3A 60            [ 4] 1638 	ld	h, b
   6C3B 23            [ 6] 1639 	inc	hl
   6C3C 5E            [ 7] 1640 	ld	e,(hl)
   6C3D 1D            [ 4] 1641 	dec	e
   6C3E 73            [ 7] 1642 	ld	(hl),e
                           1643 ;src/main.c:348: enemy->y--;
   6C3F 1D            [ 4] 1644 	dec	e
   6C40 73            [ 7] 1645 	ld	(hl),e
                           1646 ;src/main.c:349: enemy->mover = SI;
   6C41 21 06 00      [10] 1647 	ld	hl,#0x0006
   6C44 09            [11] 1648 	add	hl,bc
   6C45 36 01         [10] 1649 	ld	(hl),#0x01
   6C47 DD E1         [14] 1650 	pop	ix
   6C49 C9            [10] 1651 	ret
                           1652 ;src/main.c:352: void moverEnemigoAbajo(TEnemy *enemy){
                           1653 ;	---------------------------------
                           1654 ; Function moverEnemigoAbajo
                           1655 ; ---------------------------------
   6C4A                    1656 _moverEnemigoAbajo::
   6C4A DD E5         [15] 1657 	push	ix
   6C4C DD 21 00 00   [14] 1658 	ld	ix,#0
   6C50 DD 39         [15] 1659 	add	ix,sp
                           1660 ;src/main.c:353: enemy->y++;
   6C52 DD 4E 04      [19] 1661 	ld	c,4 (ix)
   6C55 DD 46 05      [19] 1662 	ld	b,5 (ix)
   6C58 59            [ 4] 1663 	ld	e, c
   6C59 50            [ 4] 1664 	ld	d, b
   6C5A 13            [ 6] 1665 	inc	de
   6C5B 1A            [ 7] 1666 	ld	a,(de)
   6C5C 3C            [ 4] 1667 	inc	a
   6C5D 12            [ 7] 1668 	ld	(de),a
                           1669 ;src/main.c:354: enemy->y++;
   6C5E 3C            [ 4] 1670 	inc	a
   6C5F 12            [ 7] 1671 	ld	(de),a
                           1672 ;src/main.c:355: enemy->mover = SI;
   6C60 21 06 00      [10] 1673 	ld	hl,#0x0006
   6C63 09            [11] 1674 	add	hl,bc
   6C64 36 01         [10] 1675 	ld	(hl),#0x01
   6C66 DD E1         [14] 1676 	pop	ix
   6C68 C9            [10] 1677 	ret
                           1678 ;src/main.c:358: void moverEnemigoDerecha(TEnemy *enemy){
                           1679 ;	---------------------------------
                           1680 ; Function moverEnemigoDerecha
                           1681 ; ---------------------------------
   6C69                    1682 _moverEnemigoDerecha::
                           1683 ;src/main.c:359: enemy->x++;
   6C69 D1            [10] 1684 	pop	de
   6C6A C1            [10] 1685 	pop	bc
   6C6B C5            [11] 1686 	push	bc
   6C6C D5            [11] 1687 	push	de
   6C6D 0A            [ 7] 1688 	ld	a,(bc)
   6C6E 3C            [ 4] 1689 	inc	a
   6C6F 02            [ 7] 1690 	ld	(bc),a
                           1691 ;src/main.c:360: enemy->x++;
   6C70 3C            [ 4] 1692 	inc	a
   6C71 02            [ 7] 1693 	ld	(bc),a
                           1694 ;src/main.c:361: enemy->mover = SI;
   6C72 21 06 00      [10] 1695 	ld	hl,#0x0006
   6C75 09            [11] 1696 	add	hl,bc
   6C76 36 01         [10] 1697 	ld	(hl),#0x01
   6C78 C9            [10] 1698 	ret
                           1699 ;src/main.c:364: void moverEnemigoIzquierda(TEnemy *enemy){
                           1700 ;	---------------------------------
                           1701 ; Function moverEnemigoIzquierda
                           1702 ; ---------------------------------
   6C79                    1703 _moverEnemigoIzquierda::
                           1704 ;src/main.c:365: enemy->x--;
   6C79 D1            [10] 1705 	pop	de
   6C7A C1            [10] 1706 	pop	bc
   6C7B C5            [11] 1707 	push	bc
   6C7C D5            [11] 1708 	push	de
   6C7D 0A            [ 7] 1709 	ld	a,(bc)
   6C7E C6 FF         [ 7] 1710 	add	a,#0xFF
   6C80 02            [ 7] 1711 	ld	(bc),a
                           1712 ;src/main.c:366: enemy->x--;
   6C81 C6 FF         [ 7] 1713 	add	a,#0xFF
   6C83 02            [ 7] 1714 	ld	(bc),a
                           1715 ;src/main.c:367: enemy->mover = SI;
   6C84 21 06 00      [10] 1716 	ld	hl,#0x0006
   6C87 09            [11] 1717 	add	hl,bc
   6C88 36 01         [10] 1718 	ld	(hl),#0x01
   6C8A C9            [10] 1719 	ret
                           1720 ;src/main.c:370: void moverEnemigoPatrol(TEnemy* enemy){
                           1721 ;	---------------------------------
                           1722 ; Function moverEnemigoPatrol
                           1723 ; ---------------------------------
   6C8B                    1724 _moverEnemigoPatrol::
   6C8B DD E5         [15] 1725 	push	ix
   6C8D DD 21 00 00   [14] 1726 	ld	ix,#0
   6C91 DD 39         [15] 1727 	add	ix,sp
   6C93 21 F3 FF      [10] 1728 	ld	hl,#-13
   6C96 39            [11] 1729 	add	hl,sp
   6C97 F9            [ 6] 1730 	ld	sp,hl
                           1731 ;src/main.c:372: if(!enemy->muerto){
   6C98 DD 4E 04      [19] 1732 	ld	c,4 (ix)
   6C9B DD 46 05      [19] 1733 	ld	b,5 (ix)
   6C9E C5            [11] 1734 	push	bc
   6C9F FD E1         [14] 1735 	pop	iy
   6CA1 FD 7E 08      [19] 1736 	ld	a,8 (iy)
   6CA4 B7            [ 4] 1737 	or	a, a
   6CA5 C2 D3 6E      [10] 1738 	jp	NZ,00118$
                           1739 ;src/main.c:375: if (!enemy->reversePatrol) {
   6CA8 21 0C 00      [10] 1740 	ld	hl,#0x000C
   6CAB 09            [11] 1741 	add	hl,bc
   6CAC DD 75 F8      [19] 1742 	ld	-8 (ix),l
   6CAF DD 74 F9      [19] 1743 	ld	-7 (ix),h
   6CB2 DD 6E F8      [19] 1744 	ld	l,-8 (ix)
   6CB5 DD 66 F9      [19] 1745 	ld	h,-7 (ix)
   6CB8 7E            [ 7] 1746 	ld	a,(hl)
   6CB9 DD 77 F7      [19] 1747 	ld	-9 (ix),a
                           1748 ;src/main.c:376: if(enemy->iter < enemy->longitud_camino){
   6CBC 21 0E 00      [10] 1749 	ld	hl,#0x000E
   6CBF 09            [11] 1750 	add	hl,bc
   6CC0 DD 75 F5      [19] 1751 	ld	-11 (ix),l
   6CC3 DD 74 F6      [19] 1752 	ld	-10 (ix),h
   6CC6 DD 6E F5      [19] 1753 	ld	l,-11 (ix)
   6CC9 DD 66 F6      [19] 1754 	ld	h,-10 (ix)
   6CCC 5E            [ 7] 1755 	ld	e,(hl)
   6CCD 23            [ 6] 1756 	inc	hl
   6CCE 56            [ 7] 1757 	ld	d,(hl)
   6CCF 21 E1 00      [10] 1758 	ld	hl,#0x00E1
   6CD2 09            [11] 1759 	add	hl,bc
   6CD3 E3            [19] 1760 	ex	(sp), hl
                           1761 ;src/main.c:379: enemy->mover = SI;
   6CD4 21 06 00      [10] 1762 	ld	hl,#0x0006
   6CD7 09            [11] 1763 	add	hl,bc
   6CD8 DD 75 FE      [19] 1764 	ld	-2 (ix),l
   6CDB DD 74 FF      [19] 1765 	ld	-1 (ix),h
                           1766 ;src/main.c:381: enemy->x = enemy->camino[enemy->iter];
   6CDE 21 19 00      [10] 1767 	ld	hl,#0x0019
   6CE1 09            [11] 1768 	add	hl,bc
   6CE2 DD 75 FC      [19] 1769 	ld	-4 (ix),l
   6CE5 DD 74 FD      [19] 1770 	ld	-3 (ix),h
                           1771 ;src/main.c:383: enemy->y = enemy->camino[enemy->iter];
   6CE8 21 01 00      [10] 1772 	ld	hl,#0x0001
   6CEB 09            [11] 1773 	add	hl,bc
   6CEC DD 75 FA      [19] 1774 	ld	-6 (ix),l
   6CEF DD 74 FB      [19] 1775 	ld	-5 (ix),h
                           1776 ;src/main.c:375: if (!enemy->reversePatrol) {
   6CF2 DD 7E F7      [19] 1777 	ld	a,-9 (ix)
   6CF5 B7            [ 4] 1778 	or	a, a
   6CF6 C2 CD 6D      [10] 1779 	jp	NZ,00114$
                           1780 ;src/main.c:376: if(enemy->iter < enemy->longitud_camino){
   6CF9 E1            [10] 1781 	pop	hl
   6CFA E5            [11] 1782 	push	hl
   6CFB 6E            [ 7] 1783 	ld	l,(hl)
   6CFC 26 00         [ 7] 1784 	ld	h,#0x00
   6CFE 7B            [ 4] 1785 	ld	a,e
   6CFF 95            [ 4] 1786 	sub	a, l
   6D00 7A            [ 4] 1787 	ld	a,d
   6D01 9C            [ 4] 1788 	sbc	a, h
   6D02 E2 07 6D      [10] 1789 	jp	PO, 00144$
   6D05 EE 80         [ 7] 1790 	xor	a, #0x80
   6D07                    1791 00144$:
   6D07 F2 AC 6D      [10] 1792 	jp	P,00105$
                           1793 ;src/main.c:377: if(enemy->iter == 0){
   6D0A 7A            [ 4] 1794 	ld	a,d
   6D0B B3            [ 4] 1795 	or	a,e
   6D0C 20 54         [12] 1796 	jr	NZ,00102$
                           1797 ;src/main.c:379: enemy->mover = SI;
   6D0E DD 6E FE      [19] 1798 	ld	l,-2 (ix)
   6D11 DD 66 FF      [19] 1799 	ld	h,-1 (ix)
   6D14 36 01         [10] 1800 	ld	(hl),#0x01
                           1801 ;src/main.c:380: enemy->iter = 2;
   6D16 DD 6E F5      [19] 1802 	ld	l,-11 (ix)
   6D19 DD 66 F6      [19] 1803 	ld	h,-10 (ix)
   6D1C 36 02         [10] 1804 	ld	(hl),#0x02
   6D1E 23            [ 6] 1805 	inc	hl
   6D1F 36 00         [10] 1806 	ld	(hl),#0x00
                           1807 ;src/main.c:381: enemy->x = enemy->camino[enemy->iter];
   6D21 DD 6E F5      [19] 1808 	ld	l,-11 (ix)
   6D24 DD 66 F6      [19] 1809 	ld	h,-10 (ix)
   6D27 5E            [ 7] 1810 	ld	e,(hl)
   6D28 23            [ 6] 1811 	inc	hl
   6D29 56            [ 7] 1812 	ld	d,(hl)
   6D2A DD 6E FC      [19] 1813 	ld	l,-4 (ix)
   6D2D DD 66 FD      [19] 1814 	ld	h,-3 (ix)
   6D30 19            [11] 1815 	add	hl,de
   6D31 7E            [ 7] 1816 	ld	a,(hl)
   6D32 02            [ 7] 1817 	ld	(bc),a
                           1818 ;src/main.c:382: ++enemy->iter;
   6D33 DD 6E F5      [19] 1819 	ld	l,-11 (ix)
   6D36 DD 66 F6      [19] 1820 	ld	h,-10 (ix)
   6D39 4E            [ 7] 1821 	ld	c,(hl)
   6D3A 23            [ 6] 1822 	inc	hl
   6D3B 46            [ 7] 1823 	ld	b,(hl)
   6D3C 03            [ 6] 1824 	inc	bc
   6D3D DD 6E F5      [19] 1825 	ld	l,-11 (ix)
   6D40 DD 66 F6      [19] 1826 	ld	h,-10 (ix)
   6D43 71            [ 7] 1827 	ld	(hl),c
   6D44 23            [ 6] 1828 	inc	hl
   6D45 70            [ 7] 1829 	ld	(hl),b
                           1830 ;src/main.c:383: enemy->y = enemy->camino[enemy->iter];
   6D46 DD 6E FC      [19] 1831 	ld	l,-4 (ix)
   6D49 DD 66 FD      [19] 1832 	ld	h,-3 (ix)
   6D4C 09            [11] 1833 	add	hl,bc
   6D4D 5E            [ 7] 1834 	ld	e,(hl)
   6D4E DD 6E FA      [19] 1835 	ld	l,-6 (ix)
   6D51 DD 66 FB      [19] 1836 	ld	h,-5 (ix)
   6D54 73            [ 7] 1837 	ld	(hl),e
                           1838 ;src/main.c:384: ++enemy->iter;
   6D55 03            [ 6] 1839 	inc	bc
   6D56 DD 6E F5      [19] 1840 	ld	l,-11 (ix)
   6D59 DD 66 F6      [19] 1841 	ld	h,-10 (ix)
   6D5C 71            [ 7] 1842 	ld	(hl),c
   6D5D 23            [ 6] 1843 	inc	hl
   6D5E 70            [ 7] 1844 	ld	(hl),b
   6D5F C3 D3 6E      [10] 1845 	jp	00118$
   6D62                    1846 00102$:
                           1847 ;src/main.c:387: enemy->mover = SI;
   6D62 DD 6E FE      [19] 1848 	ld	l,-2 (ix)
   6D65 DD 66 FF      [19] 1849 	ld	h,-1 (ix)
   6D68 36 01         [10] 1850 	ld	(hl),#0x01
                           1851 ;src/main.c:388: enemy->x = enemy->camino[enemy->iter];
   6D6A DD 6E F5      [19] 1852 	ld	l,-11 (ix)
   6D6D DD 66 F6      [19] 1853 	ld	h,-10 (ix)
   6D70 5E            [ 7] 1854 	ld	e,(hl)
   6D71 23            [ 6] 1855 	inc	hl
   6D72 56            [ 7] 1856 	ld	d,(hl)
   6D73 DD 6E FC      [19] 1857 	ld	l,-4 (ix)
   6D76 DD 66 FD      [19] 1858 	ld	h,-3 (ix)
   6D79 19            [11] 1859 	add	hl,de
   6D7A 7E            [ 7] 1860 	ld	a,(hl)
   6D7B 02            [ 7] 1861 	ld	(bc),a
                           1862 ;src/main.c:389: ++enemy->iter;
   6D7C DD 6E F5      [19] 1863 	ld	l,-11 (ix)
   6D7F DD 66 F6      [19] 1864 	ld	h,-10 (ix)
   6D82 5E            [ 7] 1865 	ld	e,(hl)
   6D83 23            [ 6] 1866 	inc	hl
   6D84 56            [ 7] 1867 	ld	d,(hl)
   6D85 13            [ 6] 1868 	inc	de
   6D86 DD 6E F5      [19] 1869 	ld	l,-11 (ix)
   6D89 DD 66 F6      [19] 1870 	ld	h,-10 (ix)
   6D8C 73            [ 7] 1871 	ld	(hl),e
   6D8D 23            [ 6] 1872 	inc	hl
   6D8E 72            [ 7] 1873 	ld	(hl),d
                           1874 ;src/main.c:390: enemy->y = enemy->camino[enemy->iter];
   6D8F DD 6E FC      [19] 1875 	ld	l,-4 (ix)
   6D92 DD 66 FD      [19] 1876 	ld	h,-3 (ix)
   6D95 19            [11] 1877 	add	hl,de
   6D96 7E            [ 7] 1878 	ld	a,(hl)
   6D97 DD 6E FA      [19] 1879 	ld	l,-6 (ix)
   6D9A DD 66 FB      [19] 1880 	ld	h,-5 (ix)
   6D9D 77            [ 7] 1881 	ld	(hl),a
                           1882 ;src/main.c:391: ++enemy->iter;
   6D9E 13            [ 6] 1883 	inc	de
   6D9F 4B            [ 4] 1884 	ld	c,e
   6DA0 DD 6E F5      [19] 1885 	ld	l,-11 (ix)
   6DA3 DD 66 F6      [19] 1886 	ld	h,-10 (ix)
   6DA6 71            [ 7] 1887 	ld	(hl),c
   6DA7 23            [ 6] 1888 	inc	hl
   6DA8 72            [ 7] 1889 	ld	(hl),d
   6DA9 C3 D3 6E      [10] 1890 	jp	00118$
   6DAC                    1891 00105$:
                           1892 ;src/main.c:396: enemy->mover = NO;
   6DAC DD 6E FE      [19] 1893 	ld	l,-2 (ix)
   6DAF DD 66 FF      [19] 1894 	ld	h,-1 (ix)
   6DB2 36 00         [10] 1895 	ld	(hl),#0x00
                           1896 ;src/main.c:397: enemy->iter = enemy->longitud_camino;
   6DB4 E1            [10] 1897 	pop	hl
   6DB5 E5            [11] 1898 	push	hl
   6DB6 4E            [ 7] 1899 	ld	c,(hl)
   6DB7 06 00         [ 7] 1900 	ld	b,#0x00
   6DB9 DD 6E F5      [19] 1901 	ld	l,-11 (ix)
   6DBC DD 66 F6      [19] 1902 	ld	h,-10 (ix)
   6DBF 71            [ 7] 1903 	ld	(hl),c
   6DC0 23            [ 6] 1904 	inc	hl
   6DC1 70            [ 7] 1905 	ld	(hl),b
                           1906 ;src/main.c:401: enemy->reversePatrol = 1;
   6DC2 DD 6E F8      [19] 1907 	ld	l,-8 (ix)
   6DC5 DD 66 F9      [19] 1908 	ld	h,-7 (ix)
   6DC8 36 01         [10] 1909 	ld	(hl),#0x01
   6DCA C3 D3 6E      [10] 1910 	jp	00118$
   6DCD                    1911 00114$:
                           1912 ;src/main.c:406: if(enemy->iter > 0){
   6DCD AF            [ 4] 1913 	xor	a, a
   6DCE BB            [ 4] 1914 	cp	a, e
   6DCF 9A            [ 4] 1915 	sbc	a, d
   6DD0 E2 D5 6D      [10] 1916 	jp	PO, 00145$
   6DD3 EE 80         [ 7] 1917 	xor	a, #0x80
   6DD5                    1918 00145$:
   6DD5 F2 B9 6E      [10] 1919 	jp	P,00111$
                           1920 ;src/main.c:407: if(enemy->iter == enemy->longitud_camino){
   6DD8 E1            [10] 1921 	pop	hl
   6DD9 E5            [11] 1922 	push	hl
   6DDA 6E            [ 7] 1923 	ld	l,(hl)
   6DDB DD 75 F3      [19] 1924 	ld	-13 (ix),l
   6DDE DD 36 F4 00   [19] 1925 	ld	-12 (ix),#0x00
   6DE2 7B            [ 4] 1926 	ld	a,e
   6DE3 DD 96 F3      [19] 1927 	sub	a, -13 (ix)
   6DE6 C2 71 6E      [10] 1928 	jp	NZ,00108$
   6DE9 7A            [ 4] 1929 	ld	a,d
   6DEA DD 96 F4      [19] 1930 	sub	a, -12 (ix)
   6DED C2 71 6E      [10] 1931 	jp	NZ,00108$
                           1932 ;src/main.c:408: enemy->mover = SI;
   6DF0 DD 6E FE      [19] 1933 	ld	l,-2 (ix)
   6DF3 DD 66 FF      [19] 1934 	ld	h,-1 (ix)
   6DF6 36 01         [10] 1935 	ld	(hl),#0x01
                           1936 ;src/main.c:409: enemy->iter = enemy->iter - 1;
   6DF8 DD 6E F5      [19] 1937 	ld	l,-11 (ix)
   6DFB DD 66 F6      [19] 1938 	ld	h,-10 (ix)
   6DFE 5E            [ 7] 1939 	ld	e,(hl)
   6DFF 23            [ 6] 1940 	inc	hl
   6E00 56            [ 7] 1941 	ld	d,(hl)
   6E01 7B            [ 4] 1942 	ld	a,e
   6E02 C6 FF         [ 7] 1943 	add	a,#0xFF
   6E04 DD 77 F3      [19] 1944 	ld	-13 (ix),a
   6E07 7A            [ 4] 1945 	ld	a,d
   6E08 CE FF         [ 7] 1946 	adc	a,#0xFF
   6E0A DD 77 F4      [19] 1947 	ld	-12 (ix),a
   6E0D DD 6E F5      [19] 1948 	ld	l,-11 (ix)
   6E10 DD 66 F6      [19] 1949 	ld	h,-10 (ix)
   6E13 DD 7E F3      [19] 1950 	ld	a,-13 (ix)
   6E16 77            [ 7] 1951 	ld	(hl),a
   6E17 23            [ 6] 1952 	inc	hl
   6E18 DD 7E F4      [19] 1953 	ld	a,-12 (ix)
   6E1B 77            [ 7] 1954 	ld	(hl),a
                           1955 ;src/main.c:410: enemy->iter = enemy->iter - 2;
   6E1C DD 5E F3      [19] 1956 	ld	e,-13 (ix)
   6E1F DD 56 F4      [19] 1957 	ld	d,-12 (ix)
   6E22 1B            [ 6] 1958 	dec	de
   6E23 1B            [ 6] 1959 	dec	de
   6E24 DD 6E F5      [19] 1960 	ld	l,-11 (ix)
   6E27 DD 66 F6      [19] 1961 	ld	h,-10 (ix)
   6E2A 73            [ 7] 1962 	ld	(hl),e
   6E2B 23            [ 6] 1963 	inc	hl
   6E2C 72            [ 7] 1964 	ld	(hl),d
                           1965 ;src/main.c:411: enemy->y = enemy->camino[enemy->iter];
   6E2D DD 6E FC      [19] 1966 	ld	l,-4 (ix)
   6E30 DD 66 FD      [19] 1967 	ld	h,-3 (ix)
   6E33 19            [11] 1968 	add	hl,de
   6E34 5E            [ 7] 1969 	ld	e,(hl)
   6E35 DD 6E FA      [19] 1970 	ld	l,-6 (ix)
   6E38 DD 66 FB      [19] 1971 	ld	h,-5 (ix)
   6E3B 73            [ 7] 1972 	ld	(hl),e
                           1973 ;src/main.c:412: --enemy->iter;
   6E3C DD 7E F3      [19] 1974 	ld	a,-13 (ix)
   6E3F C6 FD         [ 7] 1975 	add	a,#0xFD
   6E41 5F            [ 4] 1976 	ld	e,a
   6E42 DD 7E F4      [19] 1977 	ld	a,-12 (ix)
   6E45 CE FF         [ 7] 1978 	adc	a,#0xFF
   6E47 57            [ 4] 1979 	ld	d,a
   6E48 DD 6E F5      [19] 1980 	ld	l,-11 (ix)
   6E4B DD 66 F6      [19] 1981 	ld	h,-10 (ix)
   6E4E 73            [ 7] 1982 	ld	(hl),e
   6E4F 23            [ 6] 1983 	inc	hl
   6E50 72            [ 7] 1984 	ld	(hl),d
                           1985 ;src/main.c:413: enemy->x = enemy->camino[enemy->iter];
   6E51 DD 6E FC      [19] 1986 	ld	l,-4 (ix)
   6E54 DD 66 FD      [19] 1987 	ld	h,-3 (ix)
   6E57 19            [11] 1988 	add	hl,de
   6E58 7E            [ 7] 1989 	ld	a,(hl)
   6E59 02            [ 7] 1990 	ld	(bc),a
                           1991 ;src/main.c:414: --enemy->iter;
   6E5A DD 7E F3      [19] 1992 	ld	a,-13 (ix)
   6E5D C6 FC         [ 7] 1993 	add	a,#0xFC
   6E5F 4F            [ 4] 1994 	ld	c,a
   6E60 DD 7E F4      [19] 1995 	ld	a,-12 (ix)
   6E63 CE FF         [ 7] 1996 	adc	a,#0xFF
   6E65 47            [ 4] 1997 	ld	b,a
   6E66 DD 6E F5      [19] 1998 	ld	l,-11 (ix)
   6E69 DD 66 F6      [19] 1999 	ld	h,-10 (ix)
   6E6C 71            [ 7] 2000 	ld	(hl),c
   6E6D 23            [ 6] 2001 	inc	hl
   6E6E 70            [ 7] 2002 	ld	(hl),b
   6E6F 18 62         [12] 2003 	jr	00118$
   6E71                    2004 00108$:
                           2005 ;src/main.c:416: enemy->mover = SI;
   6E71 DD 6E FE      [19] 2006 	ld	l,-2 (ix)
   6E74 DD 66 FF      [19] 2007 	ld	h,-1 (ix)
   6E77 36 01         [10] 2008 	ld	(hl),#0x01
                           2009 ;src/main.c:417: enemy->y = enemy->camino[enemy->iter];
   6E79 DD 6E F5      [19] 2010 	ld	l,-11 (ix)
   6E7C DD 66 F6      [19] 2011 	ld	h,-10 (ix)
   6E7F 5E            [ 7] 2012 	ld	e,(hl)
   6E80 23            [ 6] 2013 	inc	hl
   6E81 56            [ 7] 2014 	ld	d,(hl)
   6E82 DD 6E FC      [19] 2015 	ld	l,-4 (ix)
   6E85 DD 66 FD      [19] 2016 	ld	h,-3 (ix)
   6E88 19            [11] 2017 	add	hl,de
   6E89 5E            [ 7] 2018 	ld	e,(hl)
   6E8A DD 6E FA      [19] 2019 	ld	l,-6 (ix)
   6E8D DD 66 FB      [19] 2020 	ld	h,-5 (ix)
   6E90 73            [ 7] 2021 	ld	(hl),e
                           2022 ;src/main.c:418: --enemy->iter;
   6E91 DD 6E F5      [19] 2023 	ld	l,-11 (ix)
   6E94 DD 66 F6      [19] 2024 	ld	h,-10 (ix)
   6E97 5E            [ 7] 2025 	ld	e,(hl)
   6E98 23            [ 6] 2026 	inc	hl
   6E99 56            [ 7] 2027 	ld	d,(hl)
   6E9A 1B            [ 6] 2028 	dec	de
   6E9B DD 6E F5      [19] 2029 	ld	l,-11 (ix)
   6E9E DD 66 F6      [19] 2030 	ld	h,-10 (ix)
   6EA1 73            [ 7] 2031 	ld	(hl),e
   6EA2 23            [ 6] 2032 	inc	hl
   6EA3 72            [ 7] 2033 	ld	(hl),d
                           2034 ;src/main.c:419: enemy->x = enemy->camino[enemy->iter];
   6EA4 DD 6E FC      [19] 2035 	ld	l,-4 (ix)
   6EA7 DD 66 FD      [19] 2036 	ld	h,-3 (ix)
   6EAA 19            [11] 2037 	add	hl,de
   6EAB 7E            [ 7] 2038 	ld	a,(hl)
   6EAC 02            [ 7] 2039 	ld	(bc),a
                           2040 ;src/main.c:420: --enemy->iter;
   6EAD 1B            [ 6] 2041 	dec	de
   6EAE DD 6E F5      [19] 2042 	ld	l,-11 (ix)
   6EB1 DD 66 F6      [19] 2043 	ld	h,-10 (ix)
   6EB4 73            [ 7] 2044 	ld	(hl),e
   6EB5 23            [ 6] 2045 	inc	hl
   6EB6 72            [ 7] 2046 	ld	(hl),d
   6EB7 18 1A         [12] 2047 	jr	00118$
   6EB9                    2048 00111$:
                           2049 ;src/main.c:425: enemy->mover = NO;
   6EB9 DD 6E FE      [19] 2050 	ld	l,-2 (ix)
   6EBC DD 66 FF      [19] 2051 	ld	h,-1 (ix)
   6EBF 36 00         [10] 2052 	ld	(hl),#0x00
                           2053 ;src/main.c:426: enemy->iter = 0;
   6EC1 DD 6E F5      [19] 2054 	ld	l,-11 (ix)
   6EC4 DD 66 F6      [19] 2055 	ld	h,-10 (ix)
   6EC7 AF            [ 4] 2056 	xor	a, a
   6EC8 77            [ 7] 2057 	ld	(hl), a
   6EC9 23            [ 6] 2058 	inc	hl
   6ECA 77            [ 7] 2059 	ld	(hl), a
                           2060 ;src/main.c:428: enemy->reversePatrol = 0;
   6ECB DD 6E F8      [19] 2061 	ld	l,-8 (ix)
   6ECE DD 66 F9      [19] 2062 	ld	h,-7 (ix)
   6ED1 36 00         [10] 2063 	ld	(hl),#0x00
   6ED3                    2064 00118$:
   6ED3 DD F9         [10] 2065 	ld	sp, ix
   6ED5 DD E1         [14] 2066 	pop	ix
   6ED7 C9            [10] 2067 	ret
                           2068 ;src/main.c:435: void lookFor(TEnemy* enemy){
                           2069 ;	---------------------------------
                           2070 ; Function lookFor
                           2071 ; ---------------------------------
   6ED8                    2072 _lookFor::
   6ED8 DD E5         [15] 2073 	push	ix
   6EDA DD 21 00 00   [14] 2074 	ld	ix,#0
   6EDE DD 39         [15] 2075 	add	ix,sp
   6EE0 21 F9 FF      [10] 2076 	ld	hl,#-7
   6EE3 39            [11] 2077 	add	hl,sp
   6EE4 F9            [ 6] 2078 	ld	sp,hl
                           2079 ;src/main.c:444: i16 difx = abs((i16)(enemy->x - prota.x));
   6EE5 DD 5E 04      [19] 2080 	ld	e,4 (ix)
   6EE8 DD 56 05      [19] 2081 	ld	d,5 (ix)
   6EEB 1A            [ 7] 2082 	ld	a,(de)
   6EEC 4F            [ 4] 2083 	ld	c,a
   6EED 06 00         [ 7] 2084 	ld	b,#0x00
   6EEF 21 E8 62      [10] 2085 	ld	hl,#_prota+0
   6EF2 6E            [ 7] 2086 	ld	l,(hl)
   6EF3 26 00         [ 7] 2087 	ld	h,#0x00
   6EF5 79            [ 4] 2088 	ld	a,c
   6EF6 95            [ 4] 2089 	sub	a, l
   6EF7 4F            [ 4] 2090 	ld	c,a
   6EF8 78            [ 4] 2091 	ld	a,b
   6EF9 9C            [ 4] 2092 	sbc	a, h
   6EFA 47            [ 4] 2093 	ld	b,a
   6EFB D5            [11] 2094 	push	de
   6EFC C5            [11] 2095 	push	bc
   6EFD CD 60 4A      [17] 2096 	call	_abs
   6F00 F1            [10] 2097 	pop	af
   6F01 D1            [10] 2098 	pop	de
   6F02 33            [ 6] 2099 	inc	sp
   6F03 33            [ 6] 2100 	inc	sp
   6F04 E5            [11] 2101 	push	hl
                           2102 ;src/main.c:445: i16 dify = abs((i16)(enemy->y - prota.y));
   6F05 21 01 00      [10] 2103 	ld	hl,#0x0001
   6F08 19            [11] 2104 	add	hl,de
   6F09 DD 75 FC      [19] 2105 	ld	-4 (ix),l
   6F0C DD 74 FD      [19] 2106 	ld	-3 (ix),h
   6F0F DD 6E FC      [19] 2107 	ld	l,-4 (ix)
   6F12 DD 66 FD      [19] 2108 	ld	h,-3 (ix)
   6F15 4E            [ 7] 2109 	ld	c,(hl)
   6F16 06 00         [ 7] 2110 	ld	b,#0x00
   6F18 21 E9 62      [10] 2111 	ld	hl, #(_prota + 0x0001) + 0
   6F1B 6E            [ 7] 2112 	ld	l,(hl)
   6F1C 26 00         [ 7] 2113 	ld	h,#0x00
   6F1E 79            [ 4] 2114 	ld	a,c
   6F1F 95            [ 4] 2115 	sub	a, l
   6F20 4F            [ 4] 2116 	ld	c,a
   6F21 78            [ 4] 2117 	ld	a,b
   6F22 9C            [ 4] 2118 	sbc	a, h
   6F23 47            [ 4] 2119 	ld	b,a
   6F24 D5            [11] 2120 	push	de
   6F25 C5            [11] 2121 	push	bc
   6F26 CD 60 4A      [17] 2122 	call	_abs
   6F29 F1            [10] 2123 	pop	af
   6F2A D1            [10] 2124 	pop	de
                           2125 ;src/main.c:447: dist = difx + dify; // manhattan
   6F2B DD 4E F9      [19] 2126 	ld	c,-7 (ix)
   6F2E 09            [11] 2127 	add	hl, bc
   6F2F DD 75 FB      [19] 2128 	ld	-5 (ix),l
                           2129 ;src/main.c:448: enemy->seen = NO;
   6F32 21 12 00      [10] 2130 	ld	hl,#0x0012
   6F35 19            [11] 2131 	add	hl,de
   6F36 DD 75 FE      [19] 2132 	ld	-2 (ix),l
   6F39 DD 74 FF      [19] 2133 	ld	-1 (ix),h
   6F3C DD 6E FE      [19] 2134 	ld	l,-2 (ix)
   6F3F DD 66 FF      [19] 2135 	ld	h,-1 (ix)
   6F42 36 00         [10] 2136 	ld	(hl),#0x00
                           2137 ;src/main.c:449: enemy->inRange = NO;
   6F44 21 11 00      [10] 2138 	ld	hl,#0x0011
   6F47 19            [11] 2139 	add	hl,de
   6F48 4D            [ 4] 2140 	ld	c,l
   6F49 44            [ 4] 2141 	ld	b,h
   6F4A AF            [ 4] 2142 	xor	a, a
   6F4B 02            [ 7] 2143 	ld	(bc),a
                           2144 ;src/main.c:450: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90);
   6F4C C5            [11] 2145 	push	bc
   6F4D D5            [11] 2146 	push	de
   6F4E 21 18 5A      [10] 2147 	ld	hl,#0x5A18
   6F51 E5            [11] 2148 	push	hl
   6F52 21 00 C0      [10] 2149 	ld	hl,#0xC000
   6F55 E5            [11] 2150 	push	hl
   6F56 CD 05 5F      [17] 2151 	call	_cpct_getScreenPtr
   6F59 D1            [10] 2152 	pop	de
   6F5A C1            [10] 2153 	pop	bc
                           2154 ;src/main.c:451: if(!enemy->seek){
   6F5B D5            [11] 2155 	push	de
   6F5C FD E1         [14] 2156 	pop	iy
   6F5E FD 7E 14      [19] 2157 	ld	a,20 (iy)
   6F61 B7            [ 4] 2158 	or	a, a
   6F62 20 7B         [12] 2159 	jr	NZ,00111$
                           2160 ;src/main.c:452: if (dist <= 10) {// te detectan los sensores de proximidad
   6F64 3E 0A         [ 7] 2161 	ld	a,#0x0A
   6F66 DD 96 FB      [19] 2162 	sub	a, -5 (ix)
   6F69 38 0B         [12] 2163 	jr	C,00107$
                           2164 ;src/main.c:453: enemy->inRange = 1;
   6F6B 3E 01         [ 7] 2165 	ld	a,#0x01
   6F6D 02            [ 7] 2166 	ld	(bc),a
                           2167 ;src/main.c:454: enemy->engage = 1;
   6F6E 21 16 00      [10] 2168 	ld	hl,#0x0016
   6F71 19            [11] 2169 	add	hl,de
   6F72 36 01         [10] 2170 	ld	(hl),#0x01
   6F74 18 69         [12] 2171 	jr	00111$
   6F76                    2172 00107$:
                           2173 ;src/main.c:455: }else if(prota.x > enemy->x - 25 && prota.x < enemy->x + 25
   6F76 21 E8 62      [10] 2174 	ld	hl, #_prota + 0
   6F79 4E            [ 7] 2175 	ld	c,(hl)
   6F7A 1A            [ 7] 2176 	ld	a,(de)
   6F7B 5F            [ 4] 2177 	ld	e,a
   6F7C 16 00         [ 7] 2178 	ld	d,#0x00
   6F7E 7B            [ 4] 2179 	ld	a,e
   6F7F C6 E7         [ 7] 2180 	add	a,#0xE7
   6F81 6F            [ 4] 2181 	ld	l,a
   6F82 7A            [ 4] 2182 	ld	a,d
   6F83 CE FF         [ 7] 2183 	adc	a,#0xFF
   6F85 67            [ 4] 2184 	ld	h,a
   6F86 06 00         [ 7] 2185 	ld	b,#0x00
   6F88 7D            [ 4] 2186 	ld	a,l
   6F89 91            [ 4] 2187 	sub	a, c
   6F8A 7C            [ 4] 2188 	ld	a,h
   6F8B 98            [ 4] 2189 	sbc	a, b
   6F8C E2 91 6F      [10] 2190 	jp	PO, 00137$
   6F8F EE 80         [ 7] 2191 	xor	a, #0x80
   6F91                    2192 00137$:
   6F91 F2 DF 6F      [10] 2193 	jp	P,00111$
   6F94 21 19 00      [10] 2194 	ld	hl,#0x0019
   6F97 19            [11] 2195 	add	hl,de
   6F98 79            [ 4] 2196 	ld	a,c
   6F99 95            [ 4] 2197 	sub	a, l
   6F9A 78            [ 4] 2198 	ld	a,b
   6F9B 9C            [ 4] 2199 	sbc	a, h
   6F9C E2 A1 6F      [10] 2200 	jp	PO, 00138$
   6F9F EE 80         [ 7] 2201 	xor	a, #0x80
   6FA1                    2202 00138$:
   6FA1 F2 DF 6F      [10] 2203 	jp	P,00111$
                           2204 ;src/main.c:456: && prota.y > enemy->y - 26*2 && prota.y < enemy->y + 26*2){
   6FA4 21 E9 62      [10] 2205 	ld	hl, #(_prota + 0x0001) + 0
   6FA7 4E            [ 7] 2206 	ld	c,(hl)
   6FA8 DD 6E FC      [19] 2207 	ld	l,-4 (ix)
   6FAB DD 66 FD      [19] 2208 	ld	h,-3 (ix)
   6FAE 5E            [ 7] 2209 	ld	e,(hl)
   6FAF 16 00         [ 7] 2210 	ld	d,#0x00
   6FB1 7B            [ 4] 2211 	ld	a,e
   6FB2 C6 CC         [ 7] 2212 	add	a,#0xCC
   6FB4 6F            [ 4] 2213 	ld	l,a
   6FB5 7A            [ 4] 2214 	ld	a,d
   6FB6 CE FF         [ 7] 2215 	adc	a,#0xFF
   6FB8 67            [ 4] 2216 	ld	h,a
   6FB9 06 00         [ 7] 2217 	ld	b,#0x00
   6FBB 7D            [ 4] 2218 	ld	a,l
   6FBC 91            [ 4] 2219 	sub	a, c
   6FBD 7C            [ 4] 2220 	ld	a,h
   6FBE 98            [ 4] 2221 	sbc	a, b
   6FBF E2 C4 6F      [10] 2222 	jp	PO, 00139$
   6FC2 EE 80         [ 7] 2223 	xor	a, #0x80
   6FC4                    2224 00139$:
   6FC4 F2 DF 6F      [10] 2225 	jp	P,00111$
   6FC7 21 34 00      [10] 2226 	ld	hl,#0x0034
   6FCA 19            [11] 2227 	add	hl,de
   6FCB 79            [ 4] 2228 	ld	a,c
   6FCC 95            [ 4] 2229 	sub	a, l
   6FCD 78            [ 4] 2230 	ld	a,b
   6FCE 9C            [ 4] 2231 	sbc	a, h
   6FCF E2 D4 6F      [10] 2232 	jp	PO, 00140$
   6FD2 EE 80         [ 7] 2233 	xor	a, #0x80
   6FD4                    2234 00140$:
   6FD4 F2 DF 6F      [10] 2235 	jp	P,00111$
                           2236 ;src/main.c:457: enemy->seen = SI;
   6FD7 DD 6E FE      [19] 2237 	ld	l,-2 (ix)
   6FDA DD 66 FF      [19] 2238 	ld	h,-1 (ix)
   6FDD 36 01         [10] 2239 	ld	(hl),#0x01
   6FDF                    2240 00111$:
   6FDF DD F9         [10] 2241 	ld	sp, ix
   6FE1 DD E1         [14] 2242 	pop	ix
   6FE3 C9            [10] 2243 	ret
                           2244 ;src/main.c:463: void moverEnemigoSeek(TEnemy* actual){
                           2245 ;	---------------------------------
                           2246 ; Function moverEnemigoSeek
                           2247 ; ---------------------------------
   6FE4                    2248 _moverEnemigoSeek::
   6FE4 DD E5         [15] 2249 	push	ix
   6FE6 DD 21 00 00   [14] 2250 	ld	ix,#0
   6FEA DD 39         [15] 2251 	add	ix,sp
   6FEC 21 F6 FF      [10] 2252 	ld	hl,#-10
   6FEF 39            [11] 2253 	add	hl,sp
   6FF0 F9            [ 6] 2254 	ld	sp,hl
                           2255 ;src/main.c:466: if(!actual->muerto){
   6FF1 DD 4E 04      [19] 2256 	ld	c,4 (ix)
   6FF4 DD 46 05      [19] 2257 	ld	b,5 (ix)
   6FF7 C5            [11] 2258 	push	bc
   6FF8 FD E1         [14] 2259 	pop	iy
   6FFA FD 7E 08      [19] 2260 	ld	a,8 (iy)
   6FFD B7            [ 4] 2261 	or	a, a
   6FFE C2 91 71      [10] 2262 	jp	NZ,00114$
                           2263 ;src/main.c:469: if (!actual->reversePatrol) {
   7001 21 0C 00      [10] 2264 	ld	hl,#0x000C
   7004 09            [11] 2265 	add	hl,bc
   7005 EB            [ 4] 2266 	ex	de,hl
   7006 1A            [ 7] 2267 	ld	a,(de)
   7007 B7            [ 4] 2268 	or	a, a
   7008 C2 91 71      [10] 2269 	jp	NZ,00114$
                           2270 ;src/main.c:470: if(actual->iter < actual->longitud_camino){
   700B 21 0E 00      [10] 2271 	ld	hl,#0x000E
   700E 09            [11] 2272 	add	hl,bc
   700F DD 75 FE      [19] 2273 	ld	-2 (ix),l
   7012 DD 74 FF      [19] 2274 	ld	-1 (ix),h
   7015 DD 6E FE      [19] 2275 	ld	l,-2 (ix)
   7018 DD 66 FF      [19] 2276 	ld	h,-1 (ix)
   701B 7E            [ 7] 2277 	ld	a,(hl)
   701C DD 77 FC      [19] 2278 	ld	-4 (ix),a
   701F 23            [ 6] 2279 	inc	hl
   7020 7E            [ 7] 2280 	ld	a,(hl)
   7021 DD 77 FD      [19] 2281 	ld	-3 (ix),a
   7024 69            [ 4] 2282 	ld	l, c
   7025 60            [ 4] 2283 	ld	h, b
   7026 C5            [11] 2284 	push	bc
   7027 01 E1 00      [10] 2285 	ld	bc, #0x00E1
   702A 09            [11] 2286 	add	hl, bc
   702B C1            [10] 2287 	pop	bc
   702C 6E            [ 7] 2288 	ld	l,(hl)
   702D 26 00         [ 7] 2289 	ld	h,#0x00
                           2290 ;src/main.c:479: actual->y = actual->camino[actual->iter];
   702F 79            [ 4] 2291 	ld	a,c
   7030 C6 01         [ 7] 2292 	add	a, #0x01
   7032 DD 77 FA      [19] 2293 	ld	-6 (ix),a
   7035 78            [ 4] 2294 	ld	a,b
   7036 CE 00         [ 7] 2295 	adc	a, #0x00
   7038 DD 77 FB      [19] 2296 	ld	-5 (ix),a
                           2297 ;src/main.c:470: if(actual->iter < actual->longitud_camino){
   703B DD 7E FC      [19] 2298 	ld	a,-4 (ix)
   703E 95            [ 4] 2299 	sub	a, l
   703F DD 7E FD      [19] 2300 	ld	a,-3 (ix)
   7042 9C            [ 4] 2301 	sbc	a, h
   7043 E2 48 70      [10] 2302 	jp	PO, 00136$
   7046 EE 80         [ 7] 2303 	xor	a, #0x80
   7048                    2304 00136$:
   7048 F2 DD 70      [10] 2305 	jp	P,00108$
                           2306 ;src/main.c:475: actual->mover = SI;
   704B 21 06 00      [10] 2307 	ld	hl,#0x0006
   704E 09            [11] 2308 	add	hl,bc
                           2309 ;src/main.c:477: actual->x = actual->camino[actual->iter];
   704F 79            [ 4] 2310 	ld	a,c
   7050 C6 19         [ 7] 2311 	add	a, #0x19
   7052 5F            [ 4] 2312 	ld	e,a
   7053 78            [ 4] 2313 	ld	a,b
   7054 CE 00         [ 7] 2314 	adc	a, #0x00
   7056 57            [ 4] 2315 	ld	d,a
                           2316 ;src/main.c:473: if(actual->iter == 0){
   7057 DD 7E FD      [19] 2317 	ld	a,-3 (ix)
   705A DD B6 FC      [19] 2318 	or	a,-4 (ix)
   705D 20 45         [12] 2319 	jr	NZ,00102$
                           2320 ;src/main.c:475: actual->mover = SI;
   705F 36 01         [10] 2321 	ld	(hl),#0x01
                           2322 ;src/main.c:476: actual->iter = 2;
   7061 DD 6E FE      [19] 2323 	ld	l,-2 (ix)
   7064 DD 66 FF      [19] 2324 	ld	h,-1 (ix)
   7067 36 02         [10] 2325 	ld	(hl),#0x02
   7069 23            [ 6] 2326 	inc	hl
   706A 36 00         [10] 2327 	ld	(hl),#0x00
                           2328 ;src/main.c:477: actual->x = actual->camino[actual->iter];
   706C DD 6E FE      [19] 2329 	ld	l,-2 (ix)
   706F DD 66 FF      [19] 2330 	ld	h,-1 (ix)
   7072 7E            [ 7] 2331 	ld	a, (hl)
   7073 23            [ 6] 2332 	inc	hl
   7074 66            [ 7] 2333 	ld	h,(hl)
   7075 6F            [ 4] 2334 	ld	l,a
   7076 19            [11] 2335 	add	hl,de
   7077 7E            [ 7] 2336 	ld	a,(hl)
   7078 02            [ 7] 2337 	ld	(bc),a
                           2338 ;src/main.c:478: ++actual->iter;
   7079 DD 6E FE      [19] 2339 	ld	l,-2 (ix)
   707C DD 66 FF      [19] 2340 	ld	h,-1 (ix)
   707F 4E            [ 7] 2341 	ld	c,(hl)
   7080 23            [ 6] 2342 	inc	hl
   7081 46            [ 7] 2343 	ld	b,(hl)
   7082 03            [ 6] 2344 	inc	bc
   7083 DD 6E FE      [19] 2345 	ld	l,-2 (ix)
   7086 DD 66 FF      [19] 2346 	ld	h,-1 (ix)
   7089 71            [ 7] 2347 	ld	(hl),c
   708A 23            [ 6] 2348 	inc	hl
   708B 70            [ 7] 2349 	ld	(hl),b
                           2350 ;src/main.c:479: actual->y = actual->camino[actual->iter];
   708C 69            [ 4] 2351 	ld	l, c
   708D 60            [ 4] 2352 	ld	h, b
   708E 19            [11] 2353 	add	hl,de
   708F 5E            [ 7] 2354 	ld	e,(hl)
   7090 DD 6E FA      [19] 2355 	ld	l,-6 (ix)
   7093 DD 66 FB      [19] 2356 	ld	h,-5 (ix)
   7096 73            [ 7] 2357 	ld	(hl),e
                           2358 ;src/main.c:480: ++actual->iter;
   7097 03            [ 6] 2359 	inc	bc
   7098 DD 6E FE      [19] 2360 	ld	l,-2 (ix)
   709B DD 66 FF      [19] 2361 	ld	h,-1 (ix)
   709E 71            [ 7] 2362 	ld	(hl),c
   709F 23            [ 6] 2363 	inc	hl
   70A0 70            [ 7] 2364 	ld	(hl),b
   70A1 C3 91 71      [10] 2365 	jp	00114$
   70A4                    2366 00102$:
                           2367 ;src/main.c:483: actual->mover = SI;
   70A4 36 01         [10] 2368 	ld	(hl),#0x01
                           2369 ;src/main.c:484: actual->x = actual->camino[actual->iter];
   70A6 DD 6E FE      [19] 2370 	ld	l,-2 (ix)
   70A9 DD 66 FF      [19] 2371 	ld	h,-1 (ix)
   70AC 7E            [ 7] 2372 	ld	a, (hl)
   70AD 23            [ 6] 2373 	inc	hl
   70AE 66            [ 7] 2374 	ld	h,(hl)
   70AF 6F            [ 4] 2375 	ld	l,a
   70B0 19            [11] 2376 	add	hl,de
   70B1 7E            [ 7] 2377 	ld	a,(hl)
   70B2 02            [ 7] 2378 	ld	(bc),a
                           2379 ;src/main.c:485: ++actual->iter;
   70B3 DD 6E FE      [19] 2380 	ld	l,-2 (ix)
   70B6 DD 66 FF      [19] 2381 	ld	h,-1 (ix)
   70B9 4E            [ 7] 2382 	ld	c,(hl)
   70BA 23            [ 6] 2383 	inc	hl
   70BB 46            [ 7] 2384 	ld	b,(hl)
   70BC 03            [ 6] 2385 	inc	bc
   70BD DD 6E FE      [19] 2386 	ld	l,-2 (ix)
   70C0 DD 66 FF      [19] 2387 	ld	h,-1 (ix)
   70C3 71            [ 7] 2388 	ld	(hl),c
   70C4 23            [ 6] 2389 	inc	hl
   70C5 70            [ 7] 2390 	ld	(hl),b
                           2391 ;src/main.c:486: actual->y = actual->camino[actual->iter];
   70C6 EB            [ 4] 2392 	ex	de,hl
   70C7 09            [11] 2393 	add	hl,bc
   70C8 5E            [ 7] 2394 	ld	e,(hl)
   70C9 DD 6E FA      [19] 2395 	ld	l,-6 (ix)
   70CC DD 66 FB      [19] 2396 	ld	h,-5 (ix)
   70CF 73            [ 7] 2397 	ld	(hl),e
                           2398 ;src/main.c:487: ++actual->iter;
   70D0 03            [ 6] 2399 	inc	bc
   70D1 DD 6E FE      [19] 2400 	ld	l,-2 (ix)
   70D4 DD 66 FF      [19] 2401 	ld	h,-1 (ix)
   70D7 71            [ 7] 2402 	ld	(hl),c
   70D8 23            [ 6] 2403 	inc	hl
   70D9 70            [ 7] 2404 	ld	(hl),b
   70DA C3 91 71      [10] 2405 	jp	00114$
   70DD                    2406 00108$:
                           2407 ;src/main.c:492: lookFor(actual);
   70DD C5            [11] 2408 	push	bc
   70DE D5            [11] 2409 	push	de
   70DF C5            [11] 2410 	push	bc
   70E0 CD D8 6E      [17] 2411 	call	_lookFor
   70E3 F1            [10] 2412 	pop	af
   70E4 D1            [10] 2413 	pop	de
   70E5 C1            [10] 2414 	pop	bc
                           2415 ;src/main.c:493: actual->reversePatrol = NO;
   70E6 AF            [ 4] 2416 	xor	a, a
   70E7 12            [ 7] 2417 	ld	(de),a
                           2418 ;src/main.c:494: if(!actual->seen){
   70E8 C5            [11] 2419 	push	bc
   70E9 FD E1         [14] 2420 	pop	iy
   70EB FD 5E 12      [19] 2421 	ld	e,18 (iy)
                           2422 ;src/main.c:495: actual->patrolling = 1;
   70EE 21 0B 00      [10] 2423 	ld	hl,#0x000B
   70F1 09            [11] 2424 	add	hl,bc
   70F2 DD 75 FC      [19] 2425 	ld	-4 (ix),l
   70F5 DD 74 FD      [19] 2426 	ld	-3 (ix),h
                           2427 ;src/main.c:496: actual->seek = 0;
   70F8 21 14 00      [10] 2428 	ld	hl,#0x0014
   70FB 09            [11] 2429 	add	hl,bc
   70FC DD 75 F8      [19] 2430 	ld	-8 (ix),l
   70FF DD 74 F9      [19] 2431 	ld	-7 (ix),h
                           2432 ;src/main.c:494: if(!actual->seen){
   7102 7B            [ 4] 2433 	ld	a,e
   7103 B7            [ 4] 2434 	or	a, a
   7104 20 3D         [12] 2435 	jr	NZ,00105$
                           2436 ;src/main.c:495: actual->patrolling = 1;
   7106 DD 6E FC      [19] 2437 	ld	l,-4 (ix)
   7109 DD 66 FD      [19] 2438 	ld	h,-3 (ix)
   710C 36 01         [10] 2439 	ld	(hl),#0x01
                           2440 ;src/main.c:496: actual->seek = 0;
   710E DD 6E F8      [19] 2441 	ld	l,-8 (ix)
   7111 DD 66 F9      [19] 2442 	ld	h,-7 (ix)
   7114 36 00         [10] 2443 	ld	(hl),#0x00
                           2444 ;src/main.c:497: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   7116 21 E9 62      [10] 2445 	ld	hl, #_prota + 1
   7119 56            [ 7] 2446 	ld	d,(hl)
   711A 21 E8 62      [10] 2447 	ld	hl, #_prota + 0
   711D 5E            [ 7] 2448 	ld	e,(hl)
   711E DD 6E FA      [19] 2449 	ld	l,-6 (ix)
   7121 DD 66 FB      [19] 2450 	ld	h,-5 (ix)
   7124 7E            [ 7] 2451 	ld	a,(hl)
   7125 DD 77 F7      [19] 2452 	ld	-9 (ix),a
   7128 0A            [ 7] 2453 	ld	a,(bc)
   7129 DD 77 F6      [19] 2454 	ld	-10 (ix),a
   712C 2A C5 63      [16] 2455 	ld	hl,(_mapa)
   712F E5            [11] 2456 	push	hl
   7130 C5            [11] 2457 	push	bc
   7131 D5            [11] 2458 	push	de
   7132 DD 66 F7      [19] 2459 	ld	h,-9 (ix)
   7135 DD 6E F6      [19] 2460 	ld	l,-10 (ix)
   7138 E5            [11] 2461 	push	hl
   7139 CD 40 43      [17] 2462 	call	_pathFinding
   713C 21 08 00      [10] 2463 	ld	hl,#8
   713F 39            [11] 2464 	add	hl,sp
   7140 F9            [ 6] 2465 	ld	sp,hl
   7141 18 44         [12] 2466 	jr	00106$
   7143                    2467 00105$:
                           2468 ;src/main.c:499: actual->patrolling = 0;
   7143 DD 6E FC      [19] 2469 	ld	l,-4 (ix)
   7146 DD 66 FD      [19] 2470 	ld	h,-3 (ix)
   7149 36 00         [10] 2471 	ld	(hl),#0x00
                           2472 ;src/main.c:500: actual->seek = 1;
   714B DD 6E F8      [19] 2473 	ld	l,-8 (ix)
   714E DD 66 F9      [19] 2474 	ld	h,-7 (ix)
   7151 36 01         [10] 2475 	ld	(hl),#0x01
                           2476 ;src/main.c:501: pathFinding(actual->x, actual->y, actual->p_seek_x, actual->p_seek_y, actual, mapa);
   7153 C5            [11] 2477 	push	bc
   7154 FD E1         [14] 2478 	pop	iy
   7156 FD 7E 18      [19] 2479 	ld	a,24 (iy)
   7159 DD 77 F6      [19] 2480 	ld	-10 (ix),a
   715C C5            [11] 2481 	push	bc
   715D FD E1         [14] 2482 	pop	iy
   715F FD 7E 17      [19] 2483 	ld	a,23 (iy)
   7162 DD 77 F7      [19] 2484 	ld	-9 (ix),a
   7165 DD 6E FA      [19] 2485 	ld	l,-6 (ix)
   7168 DD 66 FB      [19] 2486 	ld	h,-5 (ix)
   716B 5E            [ 7] 2487 	ld	e,(hl)
   716C 0A            [ 7] 2488 	ld	a,(bc)
   716D 57            [ 4] 2489 	ld	d,a
   716E 2A C5 63      [16] 2490 	ld	hl,(_mapa)
   7171 E5            [11] 2491 	push	hl
   7172 C5            [11] 2492 	push	bc
   7173 DD 66 F6      [19] 2493 	ld	h,-10 (ix)
   7176 DD 6E F7      [19] 2494 	ld	l,-9 (ix)
   7179 E5            [11] 2495 	push	hl
   717A 7B            [ 4] 2496 	ld	a,e
   717B F5            [11] 2497 	push	af
   717C 33            [ 6] 2498 	inc	sp
   717D D5            [11] 2499 	push	de
   717E 33            [ 6] 2500 	inc	sp
   717F CD 40 43      [17] 2501 	call	_pathFinding
   7182 21 08 00      [10] 2502 	ld	hl,#8
   7185 39            [11] 2503 	add	hl,sp
   7186 F9            [ 6] 2504 	ld	sp,hl
   7187                    2505 00106$:
                           2506 ;src/main.c:503: actual->iter = 0;
   7187 DD 6E FE      [19] 2507 	ld	l,-2 (ix)
   718A DD 66 FF      [19] 2508 	ld	h,-1 (ix)
   718D AF            [ 4] 2509 	xor	a, a
   718E 77            [ 7] 2510 	ld	(hl), a
   718F 23            [ 6] 2511 	inc	hl
   7190 77            [ 7] 2512 	ld	(hl), a
   7191                    2513 00114$:
   7191 DD F9         [10] 2514 	ld	sp, ix
   7193 DD E1         [14] 2515 	pop	ix
   7195 C9            [10] 2516 	ret
                           2517 ;src/main.c:512: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2518 ;	---------------------------------
                           2519 ; Function engage
                           2520 ; ---------------------------------
   7196                    2521 _engage::
   7196 DD E5         [15] 2522 	push	ix
   7198 DD 21 00 00   [14] 2523 	ld	ix,#0
   719C DD 39         [15] 2524 	add	ix,sp
   719E 21 F1 FF      [10] 2525 	ld	hl,#-15
   71A1 39            [11] 2526 	add	hl,sp
   71A2 F9            [ 6] 2527 	ld	sp,hl
                           2528 ;src/main.c:513: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   71A3 DD 7E 04      [19] 2529 	ld	a,4 (ix)
   71A6 DD 77 F4      [19] 2530 	ld	-12 (ix),a
   71A9 DD 7E 05      [19] 2531 	ld	a,5 (ix)
   71AC DD 77 F5      [19] 2532 	ld	-11 (ix),a
   71AF DD 6E F4      [19] 2533 	ld	l,-12 (ix)
   71B2 DD 66 F5      [19] 2534 	ld	h,-11 (ix)
   71B5 4E            [ 7] 2535 	ld	c,(hl)
   71B6 06 00         [ 7] 2536 	ld	b,#0x00
   71B8 21 E8 62      [10] 2537 	ld	hl,#_prota+0
   71BB 5E            [ 7] 2538 	ld	e,(hl)
   71BC 16 00         [ 7] 2539 	ld	d,#0x00
   71BE 79            [ 4] 2540 	ld	a,c
   71BF 93            [ 4] 2541 	sub	a, e
   71C0 4F            [ 4] 2542 	ld	c,a
   71C1 78            [ 4] 2543 	ld	a,b
   71C2 9A            [ 4] 2544 	sbc	a, d
   71C3 47            [ 4] 2545 	ld	b,a
   71C4 C5            [11] 2546 	push	bc
   71C5 CD 60 4A      [17] 2547 	call	_abs
   71C8 F1            [10] 2548 	pop	af
   71C9 4D            [ 4] 2549 	ld	c,l
                           2550 ;src/main.c:514: u8 dify = abs(enemy->y - prota.y);
   71CA DD 7E F4      [19] 2551 	ld	a,-12 (ix)
   71CD C6 01         [ 7] 2552 	add	a, #0x01
   71CF DD 77 F6      [19] 2553 	ld	-10 (ix),a
   71D2 DD 7E F5      [19] 2554 	ld	a,-11 (ix)
   71D5 CE 00         [ 7] 2555 	adc	a, #0x00
   71D7 DD 77 F7      [19] 2556 	ld	-9 (ix),a
   71DA DD 6E F6      [19] 2557 	ld	l,-10 (ix)
   71DD DD 66 F7      [19] 2558 	ld	h,-9 (ix)
   71E0 5E            [ 7] 2559 	ld	e,(hl)
   71E1 16 00         [ 7] 2560 	ld	d,#0x00
   71E3 21 E9 62      [10] 2561 	ld	hl, #_prota + 1
   71E6 6E            [ 7] 2562 	ld	l,(hl)
   71E7 26 00         [ 7] 2563 	ld	h,#0x00
   71E9 7B            [ 4] 2564 	ld	a,e
   71EA 95            [ 4] 2565 	sub	a, l
   71EB 5F            [ 4] 2566 	ld	e,a
   71EC 7A            [ 4] 2567 	ld	a,d
   71ED 9C            [ 4] 2568 	sbc	a, h
   71EE 57            [ 4] 2569 	ld	d,a
   71EF C5            [11] 2570 	push	bc
   71F0 D5            [11] 2571 	push	de
   71F1 CD 60 4A      [17] 2572 	call	_abs
   71F4 F1            [10] 2573 	pop	af
   71F5 C1            [10] 2574 	pop	bc
                           2575 ;src/main.c:515: u8 dist = difx + dify; // manhattan
   71F6 09            [11] 2576 	add	hl, bc
   71F7 DD 75 F1      [19] 2577 	ld	-15 (ix),l
                           2578 ;src/main.c:517: u8 movX = 0;
   71FA DD 36 F3 00   [19] 2579 	ld	-13 (ix),#0x00
                           2580 ;src/main.c:518: u8 movY = 0;
   71FE DD 36 F2 00   [19] 2581 	ld	-14 (ix),#0x00
                           2582 ;src/main.c:519: u8 distConstraint = 25;
   7202 0E 19         [ 7] 2583 	ld	c,#0x19
                           2584 ;src/main.c:520: enemy->mover = NO;
   7204 DD 7E F4      [19] 2585 	ld	a,-12 (ix)
   7207 C6 06         [ 7] 2586 	add	a, #0x06
   7209 DD 77 F8      [19] 2587 	ld	-8 (ix),a
   720C DD 7E F5      [19] 2588 	ld	a,-11 (ix)
   720F CE 00         [ 7] 2589 	adc	a, #0x00
   7211 DD 77 F9      [19] 2590 	ld	-7 (ix),a
   7214 DD 6E F8      [19] 2591 	ld	l,-8 (ix)
   7217 DD 66 F9      [19] 2592 	ld	h,-7 (ix)
   721A 36 00         [10] 2593 	ld	(hl),#0x00
                           2594 ;src/main.c:522: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   721C DD 6E F6      [19] 2595 	ld	l,-10 (ix)
   721F DD 66 F7      [19] 2596 	ld	h,-9 (ix)
   7222 7E            [ 7] 2597 	ld	a,(hl)
   7223 DD 77 FA      [19] 2598 	ld	-6 (ix),a
                           2599 ;src/main.c:513: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7226 DD 6E F4      [19] 2600 	ld	l,-12 (ix)
   7229 DD 66 F5      [19] 2601 	ld	h,-11 (ix)
   722C 46            [ 7] 2602 	ld	b,(hl)
                           2603 ;src/main.c:535: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   722D 78            [ 4] 2604 	ld	a,b
   722E C6 04         [ 7] 2605 	add	a, #0x04
   7230 DD 77 FB      [19] 2606 	ld	-5 (ix),a
                           2607 ;src/main.c:522: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   7233 DD 7E 07      [19] 2608 	ld	a,7 (ix)
   7236 DD 96 FA      [19] 2609 	sub	a, -6 (ix)
   7239 28 38         [12] 2610 	jr	Z,00194$
   723B DD 5E 07      [19] 2611 	ld	e,7 (ix)
   723E 16 00         [ 7] 2612 	ld	d,#0x00
   7240 21 01 00      [10] 2613 	ld	hl,#0x0001
   7243 19            [11] 2614 	add	hl,de
   7244 DD 75 FC      [19] 2615 	ld	-4 (ix),l
   7247 DD 74 FD      [19] 2616 	ld	-3 (ix),h
   724A DD 7E FA      [19] 2617 	ld	a,-6 (ix)
   724D DD 77 FE      [19] 2618 	ld	-2 (ix),a
   7250 DD 36 FF 00   [19] 2619 	ld	-1 (ix),#0x00
   7254 DD 7E FE      [19] 2620 	ld	a,-2 (ix)
   7257 DD 96 FC      [19] 2621 	sub	a, -4 (ix)
   725A 20 08         [12] 2622 	jr	NZ,00422$
   725C DD 7E FF      [19] 2623 	ld	a,-1 (ix)
   725F DD 96 FD      [19] 2624 	sub	a, -3 (ix)
   7262 28 0F         [12] 2625 	jr	Z,00194$
   7264                    2626 00422$:
   7264 1B            [ 6] 2627 	dec	de
   7265 DD 7E FE      [19] 2628 	ld	a,-2 (ix)
   7268 93            [ 4] 2629 	sub	a, e
   7269 C2 7C 73      [10] 2630 	jp	NZ,00195$
   726C DD 7E FF      [19] 2631 	ld	a,-1 (ix)
   726F 92            [ 4] 2632 	sub	a, d
   7270 C2 7C 73      [10] 2633 	jp	NZ,00195$
   7273                    2634 00194$:
                           2635 ;src/main.c:523: if (dx < enemy->x) { // izquierda
   7273 DD 7E 06      [19] 2636 	ld	a,6 (ix)
   7276 90            [ 4] 2637 	sub	a, b
   7277 D2 F9 72      [10] 2638 	jp	NC,00114$
                           2639 ;src/main.c:524: if (dist > 11) {
   727A 3E 0B         [ 7] 2640 	ld	a,#0x0B
   727C DD 96 F1      [19] 2641 	sub	a, -15 (ix)
   727F D2 3C 79      [10] 2642 	jp	NC,00199$
                           2643 ;src/main.c:525: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   7282 DD 7E FA      [19] 2644 	ld	a,-6 (ix)
   7285 F5            [11] 2645 	push	af
   7286 33            [ 6] 2646 	inc	sp
   7287 C5            [11] 2647 	push	bc
   7288 33            [ 6] 2648 	inc	sp
   7289 2A C5 63      [16] 2649 	ld	hl,(_mapa)
   728C E5            [11] 2650 	push	hl
   728D CD 1C 4A      [17] 2651 	call	_getTilePtr
   7290 F1            [10] 2652 	pop	af
   7291 F1            [10] 2653 	pop	af
   7292 4E            [ 7] 2654 	ld	c,(hl)
   7293 3E 02         [ 7] 2655 	ld	a,#0x02
   7295 91            [ 4] 2656 	sub	a, c
   7296 DA 3C 79      [10] 2657 	jp	C,00199$
                           2658 ;src/main.c:526: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   7299 DD 6E F6      [19] 2659 	ld	l,-10 (ix)
   729C DD 66 F7      [19] 2660 	ld	h,-9 (ix)
   729F 7E            [ 7] 2661 	ld	a,(hl)
   72A0 C6 0B         [ 7] 2662 	add	a, #0x0B
   72A2 57            [ 4] 2663 	ld	d,a
   72A3 DD 6E F4      [19] 2664 	ld	l,-12 (ix)
   72A6 DD 66 F5      [19] 2665 	ld	h,-11 (ix)
   72A9 46            [ 7] 2666 	ld	b,(hl)
   72AA D5            [11] 2667 	push	de
   72AB 33            [ 6] 2668 	inc	sp
   72AC C5            [11] 2669 	push	bc
   72AD 33            [ 6] 2670 	inc	sp
   72AE 2A C5 63      [16] 2671 	ld	hl,(_mapa)
   72B1 E5            [11] 2672 	push	hl
   72B2 CD 1C 4A      [17] 2673 	call	_getTilePtr
   72B5 F1            [10] 2674 	pop	af
   72B6 F1            [10] 2675 	pop	af
   72B7 4E            [ 7] 2676 	ld	c,(hl)
   72B8 3E 02         [ 7] 2677 	ld	a,#0x02
   72BA 91            [ 4] 2678 	sub	a, c
   72BB DA 3C 79      [10] 2679 	jp	C,00199$
                           2680 ;src/main.c:527: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   72BE DD 6E F6      [19] 2681 	ld	l,-10 (ix)
   72C1 DD 66 F7      [19] 2682 	ld	h,-9 (ix)
   72C4 7E            [ 7] 2683 	ld	a,(hl)
   72C5 C6 16         [ 7] 2684 	add	a, #0x16
   72C7 57            [ 4] 2685 	ld	d,a
   72C8 DD 6E F4      [19] 2686 	ld	l,-12 (ix)
   72CB DD 66 F5      [19] 2687 	ld	h,-11 (ix)
   72CE 46            [ 7] 2688 	ld	b,(hl)
   72CF D5            [11] 2689 	push	de
   72D0 33            [ 6] 2690 	inc	sp
   72D1 C5            [11] 2691 	push	bc
   72D2 33            [ 6] 2692 	inc	sp
   72D3 2A C5 63      [16] 2693 	ld	hl,(_mapa)
   72D6 E5            [11] 2694 	push	hl
   72D7 CD 1C 4A      [17] 2695 	call	_getTilePtr
   72DA F1            [10] 2696 	pop	af
   72DB F1            [10] 2697 	pop	af
   72DC 4E            [ 7] 2698 	ld	c,(hl)
   72DD 3E 02         [ 7] 2699 	ld	a,#0x02
   72DF 91            [ 4] 2700 	sub	a, c
   72E0 DA 3C 79      [10] 2701 	jp	C,00199$
                           2702 ;src/main.c:528: moverEnemigoIzquierda(enemy);
   72E3 DD 6E F4      [19] 2703 	ld	l,-12 (ix)
   72E6 DD 66 F5      [19] 2704 	ld	h,-11 (ix)
   72E9 E5            [11] 2705 	push	hl
   72EA CD 79 6C      [17] 2706 	call	_moverEnemigoIzquierda
   72ED F1            [10] 2707 	pop	af
                           2708 ;src/main.c:530: enemy->mover = SI;
   72EE DD 6E F8      [19] 2709 	ld	l,-8 (ix)
   72F1 DD 66 F9      [19] 2710 	ld	h,-7 (ix)
   72F4 36 01         [10] 2711 	ld	(hl),#0x01
   72F6 C3 3C 79      [10] 2712 	jp	00199$
   72F9                    2713 00114$:
                           2714 ;src/main.c:534: if (dist > G_ENEMY_W + 3) {
   72F9 3E 07         [ 7] 2715 	ld	a,#0x07
   72FB DD 96 F1      [19] 2716 	sub	a, -15 (ix)
   72FE D2 3C 79      [10] 2717 	jp	NC,00199$
                           2718 ;src/main.c:535: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7301 DD 66 FA      [19] 2719 	ld	h,-6 (ix)
   7304 DD 6E FB      [19] 2720 	ld	l,-5 (ix)
   7307 E5            [11] 2721 	push	hl
   7308 2A C5 63      [16] 2722 	ld	hl,(_mapa)
   730B E5            [11] 2723 	push	hl
   730C CD 1C 4A      [17] 2724 	call	_getTilePtr
   730F F1            [10] 2725 	pop	af
   7310 F1            [10] 2726 	pop	af
   7311 4E            [ 7] 2727 	ld	c,(hl)
   7312 3E 02         [ 7] 2728 	ld	a,#0x02
   7314 91            [ 4] 2729 	sub	a, c
   7315 DA 3C 79      [10] 2730 	jp	C,00199$
                           2731 ;src/main.c:536: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   7318 DD 6E F6      [19] 2732 	ld	l,-10 (ix)
   731B DD 66 F7      [19] 2733 	ld	h,-9 (ix)
   731E 7E            [ 7] 2734 	ld	a,(hl)
   731F C6 0B         [ 7] 2735 	add	a, #0x0B
   7321 47            [ 4] 2736 	ld	b,a
   7322 DD 6E F4      [19] 2737 	ld	l,-12 (ix)
   7325 DD 66 F5      [19] 2738 	ld	h,-11 (ix)
   7328 7E            [ 7] 2739 	ld	a,(hl)
   7329 C6 04         [ 7] 2740 	add	a, #0x04
   732B C5            [11] 2741 	push	bc
   732C 33            [ 6] 2742 	inc	sp
   732D F5            [11] 2743 	push	af
   732E 33            [ 6] 2744 	inc	sp
   732F 2A C5 63      [16] 2745 	ld	hl,(_mapa)
   7332 E5            [11] 2746 	push	hl
   7333 CD 1C 4A      [17] 2747 	call	_getTilePtr
   7336 F1            [10] 2748 	pop	af
   7337 F1            [10] 2749 	pop	af
   7338 4E            [ 7] 2750 	ld	c,(hl)
   7339 3E 02         [ 7] 2751 	ld	a,#0x02
   733B 91            [ 4] 2752 	sub	a, c
   733C DA 3C 79      [10] 2753 	jp	C,00199$
                           2754 ;src/main.c:537: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   733F DD 6E F6      [19] 2755 	ld	l,-10 (ix)
   7342 DD 66 F7      [19] 2756 	ld	h,-9 (ix)
   7345 7E            [ 7] 2757 	ld	a,(hl)
   7346 C6 16         [ 7] 2758 	add	a, #0x16
   7348 47            [ 4] 2759 	ld	b,a
   7349 DD 6E F4      [19] 2760 	ld	l,-12 (ix)
   734C DD 66 F5      [19] 2761 	ld	h,-11 (ix)
   734F 7E            [ 7] 2762 	ld	a,(hl)
   7350 C6 04         [ 7] 2763 	add	a, #0x04
   7352 C5            [11] 2764 	push	bc
   7353 33            [ 6] 2765 	inc	sp
   7354 F5            [11] 2766 	push	af
   7355 33            [ 6] 2767 	inc	sp
   7356 2A C5 63      [16] 2768 	ld	hl,(_mapa)
   7359 E5            [11] 2769 	push	hl
   735A CD 1C 4A      [17] 2770 	call	_getTilePtr
   735D F1            [10] 2771 	pop	af
   735E F1            [10] 2772 	pop	af
   735F 4E            [ 7] 2773 	ld	c,(hl)
   7360 3E 02         [ 7] 2774 	ld	a,#0x02
   7362 91            [ 4] 2775 	sub	a, c
   7363 DA 3C 79      [10] 2776 	jp	C,00199$
                           2777 ;src/main.c:538: moverEnemigoDerecha(enemy);
   7366 DD 6E F4      [19] 2778 	ld	l,-12 (ix)
   7369 DD 66 F5      [19] 2779 	ld	h,-11 (ix)
   736C E5            [11] 2780 	push	hl
   736D CD 69 6C      [17] 2781 	call	_moverEnemigoDerecha
   7370 F1            [10] 2782 	pop	af
                           2783 ;src/main.c:540: enemy->mover = SI;
   7371 DD 6E F8      [19] 2784 	ld	l,-8 (ix)
   7374 DD 66 F9      [19] 2785 	ld	h,-7 (ix)
   7377 36 01         [10] 2786 	ld	(hl),#0x01
   7379 C3 3C 79      [10] 2787 	jp	00199$
   737C                    2788 00195$:
                           2789 ;src/main.c:545: else if (enemy->x == dx) {
   737C DD 7E 06      [19] 2790 	ld	a,6 (ix)
   737F 90            [ 4] 2791 	sub	a, b
   7380 C2 95 74      [10] 2792 	jp	NZ,00192$
                           2793 ;src/main.c:546: if (dy < enemy->y) {
   7383 DD 7E 07      [19] 2794 	ld	a,7 (ix)
   7386 DD 96 FA      [19] 2795 	sub	a, -6 (ix)
   7389 D2 0F 74      [10] 2796 	jp	NC,00129$
                           2797 ;src/main.c:547: if (dist > G_HERO_H + 5) {
   738C 3E 1B         [ 7] 2798 	ld	a,#0x1B
   738E DD 96 F1      [19] 2799 	sub	a, -15 (ix)
   7391 D2 3C 79      [10] 2800 	jp	NC,00199$
                           2801 ;src/main.c:548: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7394 DD 56 FA      [19] 2802 	ld	d,-6 (ix)
   7397 15            [ 4] 2803 	dec	d
   7398 15            [ 4] 2804 	dec	d
   7399 D5            [11] 2805 	push	de
   739A 33            [ 6] 2806 	inc	sp
   739B C5            [11] 2807 	push	bc
   739C 33            [ 6] 2808 	inc	sp
   739D 2A C5 63      [16] 2809 	ld	hl,(_mapa)
   73A0 E5            [11] 2810 	push	hl
   73A1 CD 1C 4A      [17] 2811 	call	_getTilePtr
   73A4 F1            [10] 2812 	pop	af
   73A5 F1            [10] 2813 	pop	af
   73A6 4E            [ 7] 2814 	ld	c,(hl)
   73A7 3E 02         [ 7] 2815 	ld	a,#0x02
   73A9 91            [ 4] 2816 	sub	a, c
   73AA DA 3C 79      [10] 2817 	jp	C,00199$
                           2818 ;src/main.c:549: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   73AD DD 6E F6      [19] 2819 	ld	l,-10 (ix)
   73B0 DD 66 F7      [19] 2820 	ld	h,-9 (ix)
   73B3 56            [ 7] 2821 	ld	d,(hl)
   73B4 15            [ 4] 2822 	dec	d
   73B5 15            [ 4] 2823 	dec	d
   73B6 DD 6E F4      [19] 2824 	ld	l,-12 (ix)
   73B9 DD 66 F5      [19] 2825 	ld	h,-11 (ix)
   73BC 46            [ 7] 2826 	ld	b,(hl)
   73BD 04            [ 4] 2827 	inc	b
   73BE 04            [ 4] 2828 	inc	b
   73BF D5            [11] 2829 	push	de
   73C0 33            [ 6] 2830 	inc	sp
   73C1 C5            [11] 2831 	push	bc
   73C2 33            [ 6] 2832 	inc	sp
   73C3 2A C5 63      [16] 2833 	ld	hl,(_mapa)
   73C6 E5            [11] 2834 	push	hl
   73C7 CD 1C 4A      [17] 2835 	call	_getTilePtr
   73CA F1            [10] 2836 	pop	af
   73CB F1            [10] 2837 	pop	af
   73CC 4E            [ 7] 2838 	ld	c,(hl)
   73CD 3E 02         [ 7] 2839 	ld	a,#0x02
   73CF 91            [ 4] 2840 	sub	a, c
   73D0 DA 3C 79      [10] 2841 	jp	C,00199$
                           2842 ;src/main.c:550: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   73D3 DD 6E F6      [19] 2843 	ld	l,-10 (ix)
   73D6 DD 66 F7      [19] 2844 	ld	h,-9 (ix)
   73D9 46            [ 7] 2845 	ld	b,(hl)
   73DA 05            [ 4] 2846 	dec	b
   73DB 05            [ 4] 2847 	dec	b
   73DC DD 6E F4      [19] 2848 	ld	l,-12 (ix)
   73DF DD 66 F5      [19] 2849 	ld	h,-11 (ix)
   73E2 7E            [ 7] 2850 	ld	a,(hl)
   73E3 C6 04         [ 7] 2851 	add	a, #0x04
   73E5 C5            [11] 2852 	push	bc
   73E6 33            [ 6] 2853 	inc	sp
   73E7 F5            [11] 2854 	push	af
   73E8 33            [ 6] 2855 	inc	sp
   73E9 2A C5 63      [16] 2856 	ld	hl,(_mapa)
   73EC E5            [11] 2857 	push	hl
   73ED CD 1C 4A      [17] 2858 	call	_getTilePtr
   73F0 F1            [10] 2859 	pop	af
   73F1 F1            [10] 2860 	pop	af
   73F2 4E            [ 7] 2861 	ld	c,(hl)
   73F3 3E 02         [ 7] 2862 	ld	a,#0x02
   73F5 91            [ 4] 2863 	sub	a, c
   73F6 DA 3C 79      [10] 2864 	jp	C,00199$
                           2865 ;src/main.c:551: moverEnemigoArriba(enemy);
   73F9 DD 6E F4      [19] 2866 	ld	l,-12 (ix)
   73FC DD 66 F5      [19] 2867 	ld	h,-11 (ix)
   73FF E5            [11] 2868 	push	hl
   7400 CD 2B 6C      [17] 2869 	call	_moverEnemigoArriba
   7403 F1            [10] 2870 	pop	af
                           2871 ;src/main.c:553: enemy->mover = SI;
   7404 DD 6E F8      [19] 2872 	ld	l,-8 (ix)
   7407 DD 66 F9      [19] 2873 	ld	h,-7 (ix)
   740A 36 01         [10] 2874 	ld	(hl),#0x01
   740C C3 3C 79      [10] 2875 	jp	00199$
   740F                    2876 00129$:
                           2877 ;src/main.c:557: if(dist > G_ENEMY_H + 7) {
   740F 3E 1D         [ 7] 2878 	ld	a,#0x1D
   7411 DD 96 F1      [19] 2879 	sub	a, -15 (ix)
   7414 D2 3C 79      [10] 2880 	jp	NC,00199$
                           2881 ;src/main.c:558: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7417 DD 7E FA      [19] 2882 	ld	a,-6 (ix)
   741A C6 18         [ 7] 2883 	add	a, #0x18
   741C 57            [ 4] 2884 	ld	d,a
   741D D5            [11] 2885 	push	de
   741E 33            [ 6] 2886 	inc	sp
   741F C5            [11] 2887 	push	bc
   7420 33            [ 6] 2888 	inc	sp
   7421 2A C5 63      [16] 2889 	ld	hl,(_mapa)
   7424 E5            [11] 2890 	push	hl
   7425 CD 1C 4A      [17] 2891 	call	_getTilePtr
   7428 F1            [10] 2892 	pop	af
   7429 F1            [10] 2893 	pop	af
   742A 4E            [ 7] 2894 	ld	c,(hl)
   742B 3E 02         [ 7] 2895 	ld	a,#0x02
   742D 91            [ 4] 2896 	sub	a, c
   742E DA 3C 79      [10] 2897 	jp	C,00199$
                           2898 ;src/main.c:559: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7431 DD 6E F6      [19] 2899 	ld	l,-10 (ix)
   7434 DD 66 F7      [19] 2900 	ld	h,-9 (ix)
   7437 7E            [ 7] 2901 	ld	a,(hl)
   7438 C6 18         [ 7] 2902 	add	a, #0x18
   743A 57            [ 4] 2903 	ld	d,a
   743B DD 6E F4      [19] 2904 	ld	l,-12 (ix)
   743E DD 66 F5      [19] 2905 	ld	h,-11 (ix)
   7441 46            [ 7] 2906 	ld	b,(hl)
   7442 04            [ 4] 2907 	inc	b
   7443 04            [ 4] 2908 	inc	b
   7444 D5            [11] 2909 	push	de
   7445 33            [ 6] 2910 	inc	sp
   7446 C5            [11] 2911 	push	bc
   7447 33            [ 6] 2912 	inc	sp
   7448 2A C5 63      [16] 2913 	ld	hl,(_mapa)
   744B E5            [11] 2914 	push	hl
   744C CD 1C 4A      [17] 2915 	call	_getTilePtr
   744F F1            [10] 2916 	pop	af
   7450 F1            [10] 2917 	pop	af
   7451 4E            [ 7] 2918 	ld	c,(hl)
   7452 3E 02         [ 7] 2919 	ld	a,#0x02
   7454 91            [ 4] 2920 	sub	a, c
   7455 DA 3C 79      [10] 2921 	jp	C,00199$
                           2922 ;src/main.c:560: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7458 DD 6E F6      [19] 2923 	ld	l,-10 (ix)
   745B DD 66 F7      [19] 2924 	ld	h,-9 (ix)
   745E 7E            [ 7] 2925 	ld	a,(hl)
   745F C6 18         [ 7] 2926 	add	a, #0x18
   7461 47            [ 4] 2927 	ld	b,a
   7462 DD 6E F4      [19] 2928 	ld	l,-12 (ix)
   7465 DD 66 F5      [19] 2929 	ld	h,-11 (ix)
   7468 7E            [ 7] 2930 	ld	a,(hl)
   7469 C6 04         [ 7] 2931 	add	a, #0x04
   746B C5            [11] 2932 	push	bc
   746C 33            [ 6] 2933 	inc	sp
   746D F5            [11] 2934 	push	af
   746E 33            [ 6] 2935 	inc	sp
   746F 2A C5 63      [16] 2936 	ld	hl,(_mapa)
   7472 E5            [11] 2937 	push	hl
   7473 CD 1C 4A      [17] 2938 	call	_getTilePtr
   7476 F1            [10] 2939 	pop	af
   7477 F1            [10] 2940 	pop	af
   7478 4E            [ 7] 2941 	ld	c,(hl)
   7479 3E 02         [ 7] 2942 	ld	a,#0x02
   747B 91            [ 4] 2943 	sub	a, c
   747C DA 3C 79      [10] 2944 	jp	C,00199$
                           2945 ;src/main.c:561: moverEnemigoAbajo(enemy);
   747F DD 6E F4      [19] 2946 	ld	l,-12 (ix)
   7482 DD 66 F5      [19] 2947 	ld	h,-11 (ix)
   7485 E5            [11] 2948 	push	hl
   7486 CD 4A 6C      [17] 2949 	call	_moverEnemigoAbajo
   7489 F1            [10] 2950 	pop	af
                           2951 ;src/main.c:563: enemy->mover = SI;
   748A DD 6E F8      [19] 2952 	ld	l,-8 (ix)
   748D DD 66 F9      [19] 2953 	ld	h,-7 (ix)
   7490 36 01         [10] 2954 	ld	(hl),#0x01
   7492 C3 3C 79      [10] 2955 	jp	00199$
   7495                    2956 00192$:
                           2957 ;src/main.c:569: if (!prota.mover) distConstraint = 20; // ajuste en parado
   7495 3A EE 62      [13] 2958 	ld	a, (#_prota + 6)
   7498 B7            [ 4] 2959 	or	a, a
   7499 20 02         [12] 2960 	jr	NZ,00132$
   749B 0E 14         [ 7] 2961 	ld	c,#0x14
   749D                    2962 00132$:
                           2963 ;src/main.c:571: if (dist > distConstraint) {
   749D 79            [ 4] 2964 	ld	a,c
   749E DD 96 F1      [19] 2965 	sub	a, -15 (ix)
   74A1 D2 3C 79      [10] 2966 	jp	NC,00199$
                           2967 ;src/main.c:572: if (dx + 1 < enemy->x) {
   74A4 DD 5E 06      [19] 2968 	ld	e,6 (ix)
   74A7 16 00         [ 7] 2969 	ld	d,#0x00
   74A9 13            [ 6] 2970 	inc	de
   74AA DD 73 FE      [19] 2971 	ld	-2 (ix),e
   74AD DD 72 FF      [19] 2972 	ld	-1 (ix),d
   74B0 DD 70 FC      [19] 2973 	ld	-4 (ix),b
   74B3 DD 36 FD 00   [19] 2974 	ld	-3 (ix),#0x00
   74B7 DD 7E FE      [19] 2975 	ld	a,-2 (ix)
   74BA DD 96 FC      [19] 2976 	sub	a, -4 (ix)
   74BD DD 7E FF      [19] 2977 	ld	a,-1 (ix)
   74C0 DD 9E FD      [19] 2978 	sbc	a, -3 (ix)
   74C3 E2 C8 74      [10] 2979 	jp	PO, 00427$
   74C6 EE 80         [ 7] 2980 	xor	a, #0x80
   74C8                    2981 00427$:
   74C8 F2 44 75      [10] 2982 	jp	P,00144$
                           2983 ;src/main.c:573: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   74CB DD 7E FA      [19] 2984 	ld	a,-6 (ix)
   74CE F5            [11] 2985 	push	af
   74CF 33            [ 6] 2986 	inc	sp
   74D0 C5            [11] 2987 	push	bc
   74D1 33            [ 6] 2988 	inc	sp
   74D2 2A C5 63      [16] 2989 	ld	hl,(_mapa)
   74D5 E5            [11] 2990 	push	hl
   74D6 CD 1C 4A      [17] 2991 	call	_getTilePtr
   74D9 F1            [10] 2992 	pop	af
   74DA F1            [10] 2993 	pop	af
   74DB 4E            [ 7] 2994 	ld	c,(hl)
   74DC 3E 02         [ 7] 2995 	ld	a,#0x02
   74DE 91            [ 4] 2996 	sub	a, c
   74DF DA D1 75      [10] 2997 	jp	C,00145$
                           2998 ;src/main.c:574: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   74E2 DD 6E F6      [19] 2999 	ld	l,-10 (ix)
   74E5 DD 66 F7      [19] 3000 	ld	h,-9 (ix)
   74E8 7E            [ 7] 3001 	ld	a,(hl)
   74E9 C6 0B         [ 7] 3002 	add	a, #0x0B
   74EB DD 6E F4      [19] 3003 	ld	l,-12 (ix)
   74EE DD 66 F5      [19] 3004 	ld	h,-11 (ix)
   74F1 46            [ 7] 3005 	ld	b,(hl)
   74F2 F5            [11] 3006 	push	af
   74F3 33            [ 6] 3007 	inc	sp
   74F4 C5            [11] 3008 	push	bc
   74F5 33            [ 6] 3009 	inc	sp
   74F6 2A C5 63      [16] 3010 	ld	hl,(_mapa)
   74F9 E5            [11] 3011 	push	hl
   74FA CD 1C 4A      [17] 3012 	call	_getTilePtr
   74FD F1            [10] 3013 	pop	af
   74FE F1            [10] 3014 	pop	af
   74FF 4E            [ 7] 3015 	ld	c,(hl)
   7500 3E 02         [ 7] 3016 	ld	a,#0x02
   7502 91            [ 4] 3017 	sub	a, c
   7503 DA D1 75      [10] 3018 	jp	C,00145$
                           3019 ;src/main.c:575: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   7506 DD 6E F6      [19] 3020 	ld	l,-10 (ix)
   7509 DD 66 F7      [19] 3021 	ld	h,-9 (ix)
   750C 7E            [ 7] 3022 	ld	a,(hl)
   750D C6 16         [ 7] 3023 	add	a, #0x16
   750F DD 6E F4      [19] 3024 	ld	l,-12 (ix)
   7512 DD 66 F5      [19] 3025 	ld	h,-11 (ix)
   7515 46            [ 7] 3026 	ld	b,(hl)
   7516 F5            [11] 3027 	push	af
   7517 33            [ 6] 3028 	inc	sp
   7518 C5            [11] 3029 	push	bc
   7519 33            [ 6] 3030 	inc	sp
   751A 2A C5 63      [16] 3031 	ld	hl,(_mapa)
   751D E5            [11] 3032 	push	hl
   751E CD 1C 4A      [17] 3033 	call	_getTilePtr
   7521 F1            [10] 3034 	pop	af
   7522 F1            [10] 3035 	pop	af
   7523 4E            [ 7] 3036 	ld	c,(hl)
   7524 3E 02         [ 7] 3037 	ld	a,#0x02
   7526 91            [ 4] 3038 	sub	a, c
   7527 DA D1 75      [10] 3039 	jp	C,00145$
                           3040 ;src/main.c:576: moverEnemigoIzquierda(enemy);
   752A DD 6E F4      [19] 3041 	ld	l,-12 (ix)
   752D DD 66 F5      [19] 3042 	ld	h,-11 (ix)
   7530 E5            [11] 3043 	push	hl
   7531 CD 79 6C      [17] 3044 	call	_moverEnemigoIzquierda
   7534 F1            [10] 3045 	pop	af
                           3046 ;src/main.c:577: movX = 1;
   7535 DD 36 F3 01   [19] 3047 	ld	-13 (ix),#0x01
                           3048 ;src/main.c:578: enemy->mover = SI;
   7539 DD 6E F8      [19] 3049 	ld	l,-8 (ix)
   753C DD 66 F9      [19] 3050 	ld	h,-7 (ix)
   753F 36 01         [10] 3051 	ld	(hl),#0x01
   7541 C3 D1 75      [10] 3052 	jp	00145$
   7544                    3053 00144$:
                           3054 ;src/main.c:580: } else if (dx + 1 > enemy->x){
   7544 DD 7E FC      [19] 3055 	ld	a,-4 (ix)
   7547 DD 96 FE      [19] 3056 	sub	a, -2 (ix)
   754A DD 7E FD      [19] 3057 	ld	a,-3 (ix)
   754D DD 9E FF      [19] 3058 	sbc	a, -1 (ix)
   7550 E2 55 75      [10] 3059 	jp	PO, 00428$
   7553 EE 80         [ 7] 3060 	xor	a, #0x80
   7555                    3061 00428$:
   7555 F2 D1 75      [10] 3062 	jp	P,00145$
                           3063 ;src/main.c:581: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7558 DD 66 FA      [19] 3064 	ld	h,-6 (ix)
   755B DD 6E FB      [19] 3065 	ld	l,-5 (ix)
   755E E5            [11] 3066 	push	hl
   755F 2A C5 63      [16] 3067 	ld	hl,(_mapa)
   7562 E5            [11] 3068 	push	hl
   7563 CD 1C 4A      [17] 3069 	call	_getTilePtr
   7566 F1            [10] 3070 	pop	af
   7567 F1            [10] 3071 	pop	af
   7568 4E            [ 7] 3072 	ld	c,(hl)
   7569 3E 02         [ 7] 3073 	ld	a,#0x02
   756B 91            [ 4] 3074 	sub	a, c
   756C 38 63         [12] 3075 	jr	C,00145$
                           3076 ;src/main.c:582: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   756E DD 6E F6      [19] 3077 	ld	l,-10 (ix)
   7571 DD 66 F7      [19] 3078 	ld	h,-9 (ix)
   7574 7E            [ 7] 3079 	ld	a,(hl)
   7575 C6 0B         [ 7] 3080 	add	a, #0x0B
   7577 47            [ 4] 3081 	ld	b,a
   7578 DD 6E F4      [19] 3082 	ld	l,-12 (ix)
   757B DD 66 F5      [19] 3083 	ld	h,-11 (ix)
   757E 7E            [ 7] 3084 	ld	a,(hl)
   757F C6 04         [ 7] 3085 	add	a, #0x04
   7581 C5            [11] 3086 	push	bc
   7582 33            [ 6] 3087 	inc	sp
   7583 F5            [11] 3088 	push	af
   7584 33            [ 6] 3089 	inc	sp
   7585 2A C5 63      [16] 3090 	ld	hl,(_mapa)
   7588 E5            [11] 3091 	push	hl
   7589 CD 1C 4A      [17] 3092 	call	_getTilePtr
   758C F1            [10] 3093 	pop	af
   758D F1            [10] 3094 	pop	af
   758E 4E            [ 7] 3095 	ld	c,(hl)
   758F 3E 02         [ 7] 3096 	ld	a,#0x02
   7591 91            [ 4] 3097 	sub	a, c
   7592 38 3D         [12] 3098 	jr	C,00145$
                           3099 ;src/main.c:583: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   7594 DD 6E F6      [19] 3100 	ld	l,-10 (ix)
   7597 DD 66 F7      [19] 3101 	ld	h,-9 (ix)
   759A 7E            [ 7] 3102 	ld	a,(hl)
   759B C6 16         [ 7] 3103 	add	a, #0x16
   759D 47            [ 4] 3104 	ld	b,a
   759E DD 6E F4      [19] 3105 	ld	l,-12 (ix)
   75A1 DD 66 F5      [19] 3106 	ld	h,-11 (ix)
   75A4 7E            [ 7] 3107 	ld	a,(hl)
   75A5 C6 04         [ 7] 3108 	add	a, #0x04
   75A7 C5            [11] 3109 	push	bc
   75A8 33            [ 6] 3110 	inc	sp
   75A9 F5            [11] 3111 	push	af
   75AA 33            [ 6] 3112 	inc	sp
   75AB 2A C5 63      [16] 3113 	ld	hl,(_mapa)
   75AE E5            [11] 3114 	push	hl
   75AF CD 1C 4A      [17] 3115 	call	_getTilePtr
   75B2 F1            [10] 3116 	pop	af
   75B3 F1            [10] 3117 	pop	af
   75B4 4E            [ 7] 3118 	ld	c,(hl)
   75B5 3E 02         [ 7] 3119 	ld	a,#0x02
   75B7 91            [ 4] 3120 	sub	a, c
   75B8 38 17         [12] 3121 	jr	C,00145$
                           3122 ;src/main.c:584: moverEnemigoDerecha(enemy);
   75BA DD 6E F4      [19] 3123 	ld	l,-12 (ix)
   75BD DD 66 F5      [19] 3124 	ld	h,-11 (ix)
   75C0 E5            [11] 3125 	push	hl
   75C1 CD 69 6C      [17] 3126 	call	_moverEnemigoDerecha
   75C4 F1            [10] 3127 	pop	af
                           3128 ;src/main.c:585: movX = 1;
   75C5 DD 36 F3 01   [19] 3129 	ld	-13 (ix),#0x01
                           3130 ;src/main.c:586: enemy->mover = SI;
   75C9 DD 6E F8      [19] 3131 	ld	l,-8 (ix)
   75CC DD 66 F9      [19] 3132 	ld	h,-7 (ix)
   75CF 36 01         [10] 3133 	ld	(hl),#0x01
   75D1                    3134 00145$:
                           3135 ;src/main.c:589: if (dy < enemy->y) {
   75D1 DD 6E F6      [19] 3136 	ld	l,-10 (ix)
   75D4 DD 66 F7      [19] 3137 	ld	h,-9 (ix)
   75D7 4E            [ 7] 3138 	ld	c,(hl)
                           3139 ;src/main.c:513: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   75D8 DD 6E F4      [19] 3140 	ld	l,-12 (ix)
   75DB DD 66 F5      [19] 3141 	ld	h,-11 (ix)
   75DE 46            [ 7] 3142 	ld	b,(hl)
                           3143 ;src/main.c:589: if (dy < enemy->y) {
   75DF DD 7E 07      [19] 3144 	ld	a,7 (ix)
   75E2 91            [ 4] 3145 	sub	a, c
   75E3 D2 63 76      [10] 3146 	jp	NC,00155$
                           3147 ;src/main.c:590: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   75E6 51            [ 4] 3148 	ld	d,c
   75E7 15            [ 4] 3149 	dec	d
   75E8 15            [ 4] 3150 	dec	d
   75E9 D5            [11] 3151 	push	de
   75EA 33            [ 6] 3152 	inc	sp
   75EB C5            [11] 3153 	push	bc
   75EC 33            [ 6] 3154 	inc	sp
   75ED 2A C5 63      [16] 3155 	ld	hl,(_mapa)
   75F0 E5            [11] 3156 	push	hl
   75F1 CD 1C 4A      [17] 3157 	call	_getTilePtr
   75F4 F1            [10] 3158 	pop	af
   75F5 F1            [10] 3159 	pop	af
   75F6 4E            [ 7] 3160 	ld	c,(hl)
   75F7 3E 02         [ 7] 3161 	ld	a,#0x02
   75F9 91            [ 4] 3162 	sub	a, c
   75FA DA DD 76      [10] 3163 	jp	C,00156$
                           3164 ;src/main.c:591: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   75FD DD 6E F6      [19] 3165 	ld	l,-10 (ix)
   7600 DD 66 F7      [19] 3166 	ld	h,-9 (ix)
   7603 56            [ 7] 3167 	ld	d,(hl)
   7604 15            [ 4] 3168 	dec	d
   7605 15            [ 4] 3169 	dec	d
   7606 DD 6E F4      [19] 3170 	ld	l,-12 (ix)
   7609 DD 66 F5      [19] 3171 	ld	h,-11 (ix)
   760C 46            [ 7] 3172 	ld	b,(hl)
   760D 04            [ 4] 3173 	inc	b
   760E 04            [ 4] 3174 	inc	b
   760F D5            [11] 3175 	push	de
   7610 33            [ 6] 3176 	inc	sp
   7611 C5            [11] 3177 	push	bc
   7612 33            [ 6] 3178 	inc	sp
   7613 2A C5 63      [16] 3179 	ld	hl,(_mapa)
   7616 E5            [11] 3180 	push	hl
   7617 CD 1C 4A      [17] 3181 	call	_getTilePtr
   761A F1            [10] 3182 	pop	af
   761B F1            [10] 3183 	pop	af
   761C 4E            [ 7] 3184 	ld	c,(hl)
   761D 3E 02         [ 7] 3185 	ld	a,#0x02
   761F 91            [ 4] 3186 	sub	a, c
   7620 DA DD 76      [10] 3187 	jp	C,00156$
                           3188 ;src/main.c:592: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   7623 DD 6E F6      [19] 3189 	ld	l,-10 (ix)
   7626 DD 66 F7      [19] 3190 	ld	h,-9 (ix)
   7629 46            [ 7] 3191 	ld	b,(hl)
   762A 05            [ 4] 3192 	dec	b
   762B 05            [ 4] 3193 	dec	b
   762C DD 6E F4      [19] 3194 	ld	l,-12 (ix)
   762F DD 66 F5      [19] 3195 	ld	h,-11 (ix)
   7632 7E            [ 7] 3196 	ld	a,(hl)
   7633 C6 04         [ 7] 3197 	add	a, #0x04
   7635 C5            [11] 3198 	push	bc
   7636 33            [ 6] 3199 	inc	sp
   7637 F5            [11] 3200 	push	af
   7638 33            [ 6] 3201 	inc	sp
   7639 2A C5 63      [16] 3202 	ld	hl,(_mapa)
   763C E5            [11] 3203 	push	hl
   763D CD 1C 4A      [17] 3204 	call	_getTilePtr
   7640 F1            [10] 3205 	pop	af
   7641 F1            [10] 3206 	pop	af
   7642 4E            [ 7] 3207 	ld	c,(hl)
   7643 3E 02         [ 7] 3208 	ld	a,#0x02
   7645 91            [ 4] 3209 	sub	a, c
   7646 DA DD 76      [10] 3210 	jp	C,00156$
                           3211 ;src/main.c:593: moverEnemigoArriba(enemy);
   7649 DD 6E F4      [19] 3212 	ld	l,-12 (ix)
   764C DD 66 F5      [19] 3213 	ld	h,-11 (ix)
   764F E5            [11] 3214 	push	hl
   7650 CD 2B 6C      [17] 3215 	call	_moverEnemigoArriba
   7653 F1            [10] 3216 	pop	af
                           3217 ;src/main.c:594: movY = 1;
   7654 DD 36 F2 01   [19] 3218 	ld	-14 (ix),#0x01
                           3219 ;src/main.c:595: enemy->mover = SI;
   7658 DD 6E F8      [19] 3220 	ld	l,-8 (ix)
   765B DD 66 F9      [19] 3221 	ld	h,-7 (ix)
   765E 36 01         [10] 3222 	ld	(hl),#0x01
   7660 C3 DD 76      [10] 3223 	jp	00156$
   7663                    3224 00155$:
                           3225 ;src/main.c:598: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7663 79            [ 4] 3226 	ld	a,c
   7664 C6 18         [ 7] 3227 	add	a, #0x18
   7666 57            [ 4] 3228 	ld	d,a
   7667 D5            [11] 3229 	push	de
   7668 33            [ 6] 3230 	inc	sp
   7669 C5            [11] 3231 	push	bc
   766A 33            [ 6] 3232 	inc	sp
   766B 2A C5 63      [16] 3233 	ld	hl,(_mapa)
   766E E5            [11] 3234 	push	hl
   766F CD 1C 4A      [17] 3235 	call	_getTilePtr
   7672 F1            [10] 3236 	pop	af
   7673 F1            [10] 3237 	pop	af
   7674 4E            [ 7] 3238 	ld	c,(hl)
   7675 3E 02         [ 7] 3239 	ld	a,#0x02
   7677 91            [ 4] 3240 	sub	a, c
   7678 38 63         [12] 3241 	jr	C,00156$
                           3242 ;src/main.c:599: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   767A DD 6E F6      [19] 3243 	ld	l,-10 (ix)
   767D DD 66 F7      [19] 3244 	ld	h,-9 (ix)
   7680 7E            [ 7] 3245 	ld	a,(hl)
   7681 C6 18         [ 7] 3246 	add	a, #0x18
   7683 57            [ 4] 3247 	ld	d,a
   7684 DD 6E F4      [19] 3248 	ld	l,-12 (ix)
   7687 DD 66 F5      [19] 3249 	ld	h,-11 (ix)
   768A 46            [ 7] 3250 	ld	b,(hl)
   768B 04            [ 4] 3251 	inc	b
   768C 04            [ 4] 3252 	inc	b
   768D D5            [11] 3253 	push	de
   768E 33            [ 6] 3254 	inc	sp
   768F C5            [11] 3255 	push	bc
   7690 33            [ 6] 3256 	inc	sp
   7691 2A C5 63      [16] 3257 	ld	hl,(_mapa)
   7694 E5            [11] 3258 	push	hl
   7695 CD 1C 4A      [17] 3259 	call	_getTilePtr
   7698 F1            [10] 3260 	pop	af
   7699 F1            [10] 3261 	pop	af
   769A 4E            [ 7] 3262 	ld	c,(hl)
   769B 3E 02         [ 7] 3263 	ld	a,#0x02
   769D 91            [ 4] 3264 	sub	a, c
   769E 38 3D         [12] 3265 	jr	C,00156$
                           3266 ;src/main.c:600: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   76A0 DD 6E F6      [19] 3267 	ld	l,-10 (ix)
   76A3 DD 66 F7      [19] 3268 	ld	h,-9 (ix)
   76A6 7E            [ 7] 3269 	ld	a,(hl)
   76A7 C6 18         [ 7] 3270 	add	a, #0x18
   76A9 47            [ 4] 3271 	ld	b,a
   76AA DD 6E F4      [19] 3272 	ld	l,-12 (ix)
   76AD DD 66 F5      [19] 3273 	ld	h,-11 (ix)
   76B0 7E            [ 7] 3274 	ld	a,(hl)
   76B1 C6 04         [ 7] 3275 	add	a, #0x04
   76B3 C5            [11] 3276 	push	bc
   76B4 33            [ 6] 3277 	inc	sp
   76B5 F5            [11] 3278 	push	af
   76B6 33            [ 6] 3279 	inc	sp
   76B7 2A C5 63      [16] 3280 	ld	hl,(_mapa)
   76BA E5            [11] 3281 	push	hl
   76BB CD 1C 4A      [17] 3282 	call	_getTilePtr
   76BE F1            [10] 3283 	pop	af
   76BF F1            [10] 3284 	pop	af
   76C0 4E            [ 7] 3285 	ld	c,(hl)
   76C1 3E 02         [ 7] 3286 	ld	a,#0x02
   76C3 91            [ 4] 3287 	sub	a, c
   76C4 38 17         [12] 3288 	jr	C,00156$
                           3289 ;src/main.c:601: moverEnemigoAbajo(enemy);
   76C6 DD 6E F4      [19] 3290 	ld	l,-12 (ix)
   76C9 DD 66 F5      [19] 3291 	ld	h,-11 (ix)
   76CC E5            [11] 3292 	push	hl
   76CD CD 4A 6C      [17] 3293 	call	_moverEnemigoAbajo
   76D0 F1            [10] 3294 	pop	af
                           3295 ;src/main.c:602: movY = 1;
   76D1 DD 36 F2 01   [19] 3296 	ld	-14 (ix),#0x01
                           3297 ;src/main.c:603: enemy->mover = SI;
   76D5 DD 6E F8      [19] 3298 	ld	l,-8 (ix)
   76D8 DD 66 F9      [19] 3299 	ld	h,-7 (ix)
   76DB 36 01         [10] 3300 	ld	(hl),#0x01
   76DD                    3301 00156$:
                           3302 ;src/main.c:606: if (!enemy->mover) {
   76DD DD 6E F8      [19] 3303 	ld	l,-8 (ix)
   76E0 DD 66 F9      [19] 3304 	ld	h,-7 (ix)
   76E3 7E            [ 7] 3305 	ld	a,(hl)
   76E4 B7            [ 4] 3306 	or	a, a
   76E5 C2 3C 79      [10] 3307 	jp	NZ,00199$
                           3308 ;src/main.c:607: if (!movX) {
   76E8 DD 7E F3      [19] 3309 	ld	a,-13 (ix)
   76EB B7            [ 4] 3310 	or	a, a
   76EC C2 15 78      [10] 3311 	jp	NZ,00171$
                           3312 ;src/main.c:608: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   76EF DD 6E F6      [19] 3313 	ld	l,-10 (ix)
   76F2 DD 66 F7      [19] 3314 	ld	h,-9 (ix)
   76F5 5E            [ 7] 3315 	ld	e,(hl)
                           3316 ;src/main.c:513: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   76F6 DD 6E F4      [19] 3317 	ld	l,-12 (ix)
   76F9 DD 66 F5      [19] 3318 	ld	h,-11 (ix)
   76FC 4E            [ 7] 3319 	ld	c,(hl)
                           3320 ;src/main.c:608: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   76FD 3E 70         [ 7] 3321 	ld	a,#0x70
   76FF 93            [ 4] 3322 	sub	a, e
   7700 D2 90 77      [10] 3323 	jp	NC,00168$
                           3324 ;src/main.c:609: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7703 7B            [ 4] 3325 	ld	a,e
   7704 C6 18         [ 7] 3326 	add	a, #0x18
   7706 47            [ 4] 3327 	ld	b,a
   7707 C5            [11] 3328 	push	bc
   7708 2A C5 63      [16] 3329 	ld	hl,(_mapa)
   770B E5            [11] 3330 	push	hl
   770C CD 1C 4A      [17] 3331 	call	_getTilePtr
   770F F1            [10] 3332 	pop	af
   7710 F1            [10] 3333 	pop	af
   7711 4E            [ 7] 3334 	ld	c,(hl)
   7712 3E 02         [ 7] 3335 	ld	a,#0x02
   7714 91            [ 4] 3336 	sub	a, c
   7715 38 63         [12] 3337 	jr	C,00158$
                           3338 ;src/main.c:610: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7717 DD 6E F6      [19] 3339 	ld	l,-10 (ix)
   771A DD 66 F7      [19] 3340 	ld	h,-9 (ix)
   771D 7E            [ 7] 3341 	ld	a,(hl)
   771E C6 18         [ 7] 3342 	add	a, #0x18
   7720 57            [ 4] 3343 	ld	d,a
   7721 DD 6E F4      [19] 3344 	ld	l,-12 (ix)
   7724 DD 66 F5      [19] 3345 	ld	h,-11 (ix)
   7727 4E            [ 7] 3346 	ld	c,(hl)
   7728 41            [ 4] 3347 	ld	b,c
   7729 04            [ 4] 3348 	inc	b
   772A 04            [ 4] 3349 	inc	b
   772B D5            [11] 3350 	push	de
   772C 33            [ 6] 3351 	inc	sp
   772D C5            [11] 3352 	push	bc
   772E 33            [ 6] 3353 	inc	sp
   772F 2A C5 63      [16] 3354 	ld	hl,(_mapa)
   7732 E5            [11] 3355 	push	hl
   7733 CD 1C 4A      [17] 3356 	call	_getTilePtr
   7736 F1            [10] 3357 	pop	af
   7737 F1            [10] 3358 	pop	af
   7738 4E            [ 7] 3359 	ld	c,(hl)
   7739 3E 02         [ 7] 3360 	ld	a,#0x02
   773B 91            [ 4] 3361 	sub	a, c
   773C 38 3C         [12] 3362 	jr	C,00158$
                           3363 ;src/main.c:611: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   773E DD 6E F6      [19] 3364 	ld	l,-10 (ix)
   7741 DD 66 F7      [19] 3365 	ld	h,-9 (ix)
   7744 7E            [ 7] 3366 	ld	a,(hl)
   7745 C6 18         [ 7] 3367 	add	a, #0x18
   7747 47            [ 4] 3368 	ld	b,a
   7748 DD 6E F4      [19] 3369 	ld	l,-12 (ix)
   774B DD 66 F5      [19] 3370 	ld	h,-11 (ix)
   774E 7E            [ 7] 3371 	ld	a,(hl)
   774F C6 04         [ 7] 3372 	add	a, #0x04
   7751 C5            [11] 3373 	push	bc
   7752 33            [ 6] 3374 	inc	sp
   7753 F5            [11] 3375 	push	af
   7754 33            [ 6] 3376 	inc	sp
   7755 2A C5 63      [16] 3377 	ld	hl,(_mapa)
   7758 E5            [11] 3378 	push	hl
   7759 CD 1C 4A      [17] 3379 	call	_getTilePtr
   775C F1            [10] 3380 	pop	af
   775D F1            [10] 3381 	pop	af
   775E 4E            [ 7] 3382 	ld	c,(hl)
   775F 3E 02         [ 7] 3383 	ld	a,#0x02
   7761 91            [ 4] 3384 	sub	a, c
   7762 38 16         [12] 3385 	jr	C,00158$
                           3386 ;src/main.c:612: moverEnemigoAbajo(enemy);
   7764 DD 6E F4      [19] 3387 	ld	l,-12 (ix)
   7767 DD 66 F5      [19] 3388 	ld	h,-11 (ix)
   776A E5            [11] 3389 	push	hl
   776B CD 4A 6C      [17] 3390 	call	_moverEnemigoAbajo
   776E F1            [10] 3391 	pop	af
                           3392 ;src/main.c:613: enemy->mover = SI;
   776F DD 6E F8      [19] 3393 	ld	l,-8 (ix)
   7772 DD 66 F9      [19] 3394 	ld	h,-7 (ix)
   7775 36 01         [10] 3395 	ld	(hl),#0x01
   7777 C3 15 78      [10] 3396 	jp	00171$
   777A                    3397 00158$:
                           3398 ;src/main.c:615: moverEnemigoArriba(enemy);
   777A DD 6E F4      [19] 3399 	ld	l,-12 (ix)
   777D DD 66 F5      [19] 3400 	ld	h,-11 (ix)
   7780 E5            [11] 3401 	push	hl
   7781 CD 2B 6C      [17] 3402 	call	_moverEnemigoArriba
   7784 F1            [10] 3403 	pop	af
                           3404 ;src/main.c:616: enemy->mover = SI;
   7785 DD 6E F8      [19] 3405 	ld	l,-8 (ix)
   7788 DD 66 F9      [19] 3406 	ld	h,-7 (ix)
   778B 36 01         [10] 3407 	ld	(hl),#0x01
   778D C3 15 78      [10] 3408 	jp	00171$
   7790                    3409 00168$:
                           3410 ;src/main.c:619: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7790 43            [ 4] 3411 	ld	b,e
   7791 05            [ 4] 3412 	dec	b
   7792 05            [ 4] 3413 	dec	b
   7793 C5            [11] 3414 	push	bc
   7794 2A C5 63      [16] 3415 	ld	hl,(_mapa)
   7797 E5            [11] 3416 	push	hl
   7798 CD 1C 4A      [17] 3417 	call	_getTilePtr
   779B F1            [10] 3418 	pop	af
   779C F1            [10] 3419 	pop	af
   779D 4E            [ 7] 3420 	ld	c,(hl)
   779E 3E 02         [ 7] 3421 	ld	a,#0x02
   77A0 91            [ 4] 3422 	sub	a, c
   77A1 38 5F         [12] 3423 	jr	C,00163$
                           3424 ;src/main.c:620: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   77A3 DD 6E F6      [19] 3425 	ld	l,-10 (ix)
   77A6 DD 66 F7      [19] 3426 	ld	h,-9 (ix)
   77A9 56            [ 7] 3427 	ld	d,(hl)
   77AA 15            [ 4] 3428 	dec	d
   77AB 15            [ 4] 3429 	dec	d
   77AC DD 6E F4      [19] 3430 	ld	l,-12 (ix)
   77AF DD 66 F5      [19] 3431 	ld	h,-11 (ix)
   77B2 46            [ 7] 3432 	ld	b,(hl)
   77B3 04            [ 4] 3433 	inc	b
   77B4 04            [ 4] 3434 	inc	b
   77B5 D5            [11] 3435 	push	de
   77B6 33            [ 6] 3436 	inc	sp
   77B7 C5            [11] 3437 	push	bc
   77B8 33            [ 6] 3438 	inc	sp
   77B9 2A C5 63      [16] 3439 	ld	hl,(_mapa)
   77BC E5            [11] 3440 	push	hl
   77BD CD 1C 4A      [17] 3441 	call	_getTilePtr
   77C0 F1            [10] 3442 	pop	af
   77C1 F1            [10] 3443 	pop	af
   77C2 4E            [ 7] 3444 	ld	c,(hl)
   77C3 3E 02         [ 7] 3445 	ld	a,#0x02
   77C5 91            [ 4] 3446 	sub	a, c
   77C6 38 3A         [12] 3447 	jr	C,00163$
                           3448 ;src/main.c:621: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   77C8 DD 6E F6      [19] 3449 	ld	l,-10 (ix)
   77CB DD 66 F7      [19] 3450 	ld	h,-9 (ix)
   77CE 46            [ 7] 3451 	ld	b,(hl)
   77CF 05            [ 4] 3452 	dec	b
   77D0 05            [ 4] 3453 	dec	b
   77D1 DD 6E F4      [19] 3454 	ld	l,-12 (ix)
   77D4 DD 66 F5      [19] 3455 	ld	h,-11 (ix)
   77D7 7E            [ 7] 3456 	ld	a,(hl)
   77D8 C6 04         [ 7] 3457 	add	a, #0x04
   77DA C5            [11] 3458 	push	bc
   77DB 33            [ 6] 3459 	inc	sp
   77DC F5            [11] 3460 	push	af
   77DD 33            [ 6] 3461 	inc	sp
   77DE 2A C5 63      [16] 3462 	ld	hl,(_mapa)
   77E1 E5            [11] 3463 	push	hl
   77E2 CD 1C 4A      [17] 3464 	call	_getTilePtr
   77E5 F1            [10] 3465 	pop	af
   77E6 F1            [10] 3466 	pop	af
   77E7 4E            [ 7] 3467 	ld	c,(hl)
   77E8 3E 02         [ 7] 3468 	ld	a,#0x02
   77EA 91            [ 4] 3469 	sub	a, c
   77EB 38 15         [12] 3470 	jr	C,00163$
                           3471 ;src/main.c:622: moverEnemigoArriba(enemy);
   77ED DD 6E F4      [19] 3472 	ld	l,-12 (ix)
   77F0 DD 66 F5      [19] 3473 	ld	h,-11 (ix)
   77F3 E5            [11] 3474 	push	hl
   77F4 CD 2B 6C      [17] 3475 	call	_moverEnemigoArriba
   77F7 F1            [10] 3476 	pop	af
                           3477 ;src/main.c:623: enemy->mover = SI;
   77F8 DD 6E F8      [19] 3478 	ld	l,-8 (ix)
   77FB DD 66 F9      [19] 3479 	ld	h,-7 (ix)
   77FE 36 01         [10] 3480 	ld	(hl),#0x01
   7800 18 13         [12] 3481 	jr	00171$
   7802                    3482 00163$:
                           3483 ;src/main.c:625: moverEnemigoAbajo(enemy);
   7802 DD 6E F4      [19] 3484 	ld	l,-12 (ix)
   7805 DD 66 F5      [19] 3485 	ld	h,-11 (ix)
   7808 E5            [11] 3486 	push	hl
   7809 CD 4A 6C      [17] 3487 	call	_moverEnemigoAbajo
   780C F1            [10] 3488 	pop	af
                           3489 ;src/main.c:626: enemy->mover = SI;
   780D DD 6E F8      [19] 3490 	ld	l,-8 (ix)
   7810 DD 66 F9      [19] 3491 	ld	h,-7 (ix)
   7813 36 01         [10] 3492 	ld	(hl),#0x01
   7815                    3493 00171$:
                           3494 ;src/main.c:631: if (!movY) {
   7815 DD 7E F2      [19] 3495 	ld	a,-14 (ix)
   7818 B7            [ 4] 3496 	or	a, a
   7819 C2 3C 79      [10] 3497 	jp	NZ,00199$
                           3498 ;src/main.c:632: if (enemy->x < ANCHO_PANTALLA/2) {
   781C DD 6E F4      [19] 3499 	ld	l,-12 (ix)
   781F DD 66 F5      [19] 3500 	ld	h,-11 (ix)
   7822 4E            [ 7] 3501 	ld	c,(hl)
                           3502 ;src/main.c:514: u8 dify = abs(enemy->y - prota.y);
   7823 DD 6E F6      [19] 3503 	ld	l,-10 (ix)
   7826 DD 66 F7      [19] 3504 	ld	h,-9 (ix)
   7829 46            [ 7] 3505 	ld	b,(hl)
                           3506 ;src/main.c:632: if (enemy->x < ANCHO_PANTALLA/2) {
   782A 79            [ 4] 3507 	ld	a,c
   782B D6 28         [ 7] 3508 	sub	a, #0x28
   782D D2 B2 78      [10] 3509 	jp	NC,00183$
                           3510 ;src/main.c:633: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   7830 C5            [11] 3511 	push	bc
   7831 2A C5 63      [16] 3512 	ld	hl,(_mapa)
   7834 E5            [11] 3513 	push	hl
   7835 CD 1C 4A      [17] 3514 	call	_getTilePtr
   7838 F1            [10] 3515 	pop	af
   7839 F1            [10] 3516 	pop	af
   783A 4E            [ 7] 3517 	ld	c,(hl)
   783B 3E 02         [ 7] 3518 	ld	a,#0x02
   783D 91            [ 4] 3519 	sub	a, c
   783E 38 5C         [12] 3520 	jr	C,00173$
                           3521 ;src/main.c:634: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   7840 DD 6E F6      [19] 3522 	ld	l,-10 (ix)
   7843 DD 66 F7      [19] 3523 	ld	h,-9 (ix)
   7846 7E            [ 7] 3524 	ld	a,(hl)
   7847 C6 0B         [ 7] 3525 	add	a, #0x0B
   7849 DD 6E F4      [19] 3526 	ld	l,-12 (ix)
   784C DD 66 F5      [19] 3527 	ld	h,-11 (ix)
   784F 46            [ 7] 3528 	ld	b,(hl)
   7850 F5            [11] 3529 	push	af
   7851 33            [ 6] 3530 	inc	sp
   7852 C5            [11] 3531 	push	bc
   7853 33            [ 6] 3532 	inc	sp
   7854 2A C5 63      [16] 3533 	ld	hl,(_mapa)
   7857 E5            [11] 3534 	push	hl
   7858 CD 1C 4A      [17] 3535 	call	_getTilePtr
   785B F1            [10] 3536 	pop	af
   785C F1            [10] 3537 	pop	af
   785D 4E            [ 7] 3538 	ld	c,(hl)
   785E 3E 02         [ 7] 3539 	ld	a,#0x02
   7860 91            [ 4] 3540 	sub	a, c
   7861 38 39         [12] 3541 	jr	C,00173$
                           3542 ;src/main.c:635: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   7863 DD 6E F6      [19] 3543 	ld	l,-10 (ix)
   7866 DD 66 F7      [19] 3544 	ld	h,-9 (ix)
   7869 7E            [ 7] 3545 	ld	a,(hl)
   786A C6 16         [ 7] 3546 	add	a, #0x16
   786C DD 6E F4      [19] 3547 	ld	l,-12 (ix)
   786F DD 66 F5      [19] 3548 	ld	h,-11 (ix)
   7872 46            [ 7] 3549 	ld	b,(hl)
   7873 F5            [11] 3550 	push	af
   7874 33            [ 6] 3551 	inc	sp
   7875 C5            [11] 3552 	push	bc
   7876 33            [ 6] 3553 	inc	sp
   7877 2A C5 63      [16] 3554 	ld	hl,(_mapa)
   787A E5            [11] 3555 	push	hl
   787B CD 1C 4A      [17] 3556 	call	_getTilePtr
   787E F1            [10] 3557 	pop	af
   787F F1            [10] 3558 	pop	af
   7880 4E            [ 7] 3559 	ld	c,(hl)
   7881 3E 02         [ 7] 3560 	ld	a,#0x02
   7883 91            [ 4] 3561 	sub	a, c
   7884 38 16         [12] 3562 	jr	C,00173$
                           3563 ;src/main.c:636: moverEnemigoIzquierda(enemy);
   7886 DD 6E F4      [19] 3564 	ld	l,-12 (ix)
   7889 DD 66 F5      [19] 3565 	ld	h,-11 (ix)
   788C E5            [11] 3566 	push	hl
   788D CD 79 6C      [17] 3567 	call	_moverEnemigoIzquierda
   7890 F1            [10] 3568 	pop	af
                           3569 ;src/main.c:637: enemy->mover = SI;
   7891 DD 6E F8      [19] 3570 	ld	l,-8 (ix)
   7894 DD 66 F9      [19] 3571 	ld	h,-7 (ix)
   7897 36 01         [10] 3572 	ld	(hl),#0x01
   7899 C3 3C 79      [10] 3573 	jp	00199$
   789C                    3574 00173$:
                           3575 ;src/main.c:639: moverEnemigoDerecha(enemy);
   789C DD 6E F4      [19] 3576 	ld	l,-12 (ix)
   789F DD 66 F5      [19] 3577 	ld	h,-11 (ix)
   78A2 E5            [11] 3578 	push	hl
   78A3 CD 69 6C      [17] 3579 	call	_moverEnemigoDerecha
   78A6 F1            [10] 3580 	pop	af
                           3581 ;src/main.c:640: enemy->mover = SI;
   78A7 DD 6E F8      [19] 3582 	ld	l,-8 (ix)
   78AA DD 66 F9      [19] 3583 	ld	h,-7 (ix)
   78AD 36 01         [10] 3584 	ld	(hl),#0x01
   78AF C3 3C 79      [10] 3585 	jp	00199$
   78B2                    3586 00183$:
                           3587 ;src/main.c:643: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   78B2 79            [ 4] 3588 	ld	a,c
   78B3 C6 04         [ 7] 3589 	add	a, #0x04
   78B5 C5            [11] 3590 	push	bc
   78B6 33            [ 6] 3591 	inc	sp
   78B7 F5            [11] 3592 	push	af
   78B8 33            [ 6] 3593 	inc	sp
   78B9 2A C5 63      [16] 3594 	ld	hl,(_mapa)
   78BC E5            [11] 3595 	push	hl
   78BD CD 1C 4A      [17] 3596 	call	_getTilePtr
   78C0 F1            [10] 3597 	pop	af
   78C1 F1            [10] 3598 	pop	af
   78C2 4E            [ 7] 3599 	ld	c,(hl)
   78C3 3E 02         [ 7] 3600 	ld	a,#0x02
   78C5 91            [ 4] 3601 	sub	a, c
   78C6 38 61         [12] 3602 	jr	C,00178$
                           3603 ;src/main.c:644: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   78C8 DD 6E F6      [19] 3604 	ld	l,-10 (ix)
   78CB DD 66 F7      [19] 3605 	ld	h,-9 (ix)
   78CE 7E            [ 7] 3606 	ld	a,(hl)
   78CF C6 0B         [ 7] 3607 	add	a, #0x0B
   78D1 47            [ 4] 3608 	ld	b,a
   78D2 DD 6E F4      [19] 3609 	ld	l,-12 (ix)
   78D5 DD 66 F5      [19] 3610 	ld	h,-11 (ix)
   78D8 7E            [ 7] 3611 	ld	a,(hl)
   78D9 C6 04         [ 7] 3612 	add	a, #0x04
   78DB C5            [11] 3613 	push	bc
   78DC 33            [ 6] 3614 	inc	sp
   78DD F5            [11] 3615 	push	af
   78DE 33            [ 6] 3616 	inc	sp
   78DF 2A C5 63      [16] 3617 	ld	hl,(_mapa)
   78E2 E5            [11] 3618 	push	hl
   78E3 CD 1C 4A      [17] 3619 	call	_getTilePtr
   78E6 F1            [10] 3620 	pop	af
   78E7 F1            [10] 3621 	pop	af
   78E8 4E            [ 7] 3622 	ld	c,(hl)
   78E9 3E 02         [ 7] 3623 	ld	a,#0x02
   78EB 91            [ 4] 3624 	sub	a, c
   78EC 38 3B         [12] 3625 	jr	C,00178$
                           3626 ;src/main.c:645: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   78EE DD 6E F6      [19] 3627 	ld	l,-10 (ix)
   78F1 DD 66 F7      [19] 3628 	ld	h,-9 (ix)
   78F4 7E            [ 7] 3629 	ld	a,(hl)
   78F5 C6 16         [ 7] 3630 	add	a, #0x16
   78F7 47            [ 4] 3631 	ld	b,a
   78F8 DD 6E F4      [19] 3632 	ld	l,-12 (ix)
   78FB DD 66 F5      [19] 3633 	ld	h,-11 (ix)
   78FE 7E            [ 7] 3634 	ld	a,(hl)
   78FF C6 04         [ 7] 3635 	add	a, #0x04
   7901 C5            [11] 3636 	push	bc
   7902 33            [ 6] 3637 	inc	sp
   7903 F5            [11] 3638 	push	af
   7904 33            [ 6] 3639 	inc	sp
   7905 2A C5 63      [16] 3640 	ld	hl,(_mapa)
   7908 E5            [11] 3641 	push	hl
   7909 CD 1C 4A      [17] 3642 	call	_getTilePtr
   790C F1            [10] 3643 	pop	af
   790D F1            [10] 3644 	pop	af
   790E 4E            [ 7] 3645 	ld	c,(hl)
   790F 3E 02         [ 7] 3646 	ld	a,#0x02
   7911 91            [ 4] 3647 	sub	a, c
   7912 38 15         [12] 3648 	jr	C,00178$
                           3649 ;src/main.c:646: moverEnemigoDerecha(enemy);
   7914 DD 6E F4      [19] 3650 	ld	l,-12 (ix)
   7917 DD 66 F5      [19] 3651 	ld	h,-11 (ix)
   791A E5            [11] 3652 	push	hl
   791B CD 69 6C      [17] 3653 	call	_moverEnemigoDerecha
   791E F1            [10] 3654 	pop	af
                           3655 ;src/main.c:647: enemy->mover = SI;
   791F DD 6E F8      [19] 3656 	ld	l,-8 (ix)
   7922 DD 66 F9      [19] 3657 	ld	h,-7 (ix)
   7925 36 01         [10] 3658 	ld	(hl),#0x01
   7927 18 13         [12] 3659 	jr	00199$
   7929                    3660 00178$:
                           3661 ;src/main.c:650: moverEnemigoIzquierda(enemy);
   7929 DD 6E F4      [19] 3662 	ld	l,-12 (ix)
   792C DD 66 F5      [19] 3663 	ld	h,-11 (ix)
   792F E5            [11] 3664 	push	hl
   7930 CD 79 6C      [17] 3665 	call	_moverEnemigoIzquierda
   7933 F1            [10] 3666 	pop	af
                           3667 ;src/main.c:651: enemy->mover = SI;
   7934 DD 6E F8      [19] 3668 	ld	l,-8 (ix)
   7937 DD 66 F9      [19] 3669 	ld	h,-7 (ix)
   793A 36 01         [10] 3670 	ld	(hl),#0x01
   793C                    3671 00199$:
   793C DD F9         [10] 3672 	ld	sp, ix
   793E DD E1         [14] 3673 	pop	ix
   7940 C9            [10] 3674 	ret
                           3675 ;src/main.c:660: void updateEnemy(TEnemy* actual) { // maquina de estados
                           3676 ;	---------------------------------
                           3677 ; Function updateEnemy
                           3678 ; ---------------------------------
   7941                    3679 _updateEnemy::
   7941 DD E5         [15] 3680 	push	ix
   7943 DD 21 00 00   [14] 3681 	ld	ix,#0
   7947 DD 39         [15] 3682 	add	ix,sp
   7949 21 F4 FF      [10] 3683 	ld	hl,#-12
   794C 39            [11] 3684 	add	hl,sp
   794D F9            [ 6] 3685 	ld	sp,hl
                           3686 ;src/main.c:667: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   794E DD 4E 04      [19] 3687 	ld	c,4 (ix)
   7951 DD 46 05      [19] 3688 	ld	b,5 (ix)
   7954 21 16 00      [10] 3689 	ld	hl,#0x0016
   7957 09            [11] 3690 	add	hl,bc
   7958 DD 75 F9      [19] 3691 	ld	-7 (ix),l
   795B DD 74 FA      [19] 3692 	ld	-6 (ix),h
   795E DD 6E F9      [19] 3693 	ld	l,-7 (ix)
   7961 DD 66 FA      [19] 3694 	ld	h,-6 (ix)
   7964 7E            [ 7] 3695 	ld	a,(hl)
   7965 B7            [ 4] 3696 	or	a, a
   7966 28 14         [12] 3697 	jr	Z,00117$
                           3698 ;src/main.c:668: engage(actual, prota.x, prota.y);
   7968 3A E9 62      [13] 3699 	ld	a, (#_prota + 1)
   796B 21 E8 62      [10] 3700 	ld	hl, #_prota + 0
   796E 56            [ 7] 3701 	ld	d,(hl)
   796F F5            [11] 3702 	push	af
   7970 33            [ 6] 3703 	inc	sp
   7971 D5            [11] 3704 	push	de
   7972 33            [ 6] 3705 	inc	sp
   7973 C5            [11] 3706 	push	bc
   7974 CD 96 71      [17] 3707 	call	_engage
   7977 F1            [10] 3708 	pop	af
   7978 F1            [10] 3709 	pop	af
   7979 C3 9B 7A      [10] 3710 	jp	00119$
   797C                    3711 00117$:
                           3712 ;src/main.c:670: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   797C C5            [11] 3713 	push	bc
   797D C5            [11] 3714 	push	bc
   797E CD D8 6E      [17] 3715 	call	_lookFor
   7981 F1            [10] 3716 	pop	af
   7982 C1            [10] 3717 	pop	bc
                           3718 ;src/main.c:676: actual->patrolling = 0;
   7983 21 0B 00      [10] 3719 	ld	hl,#0x000B
   7986 09            [11] 3720 	add	hl,bc
   7987 DD 75 F7      [19] 3721 	ld	-9 (ix),l
   798A DD 74 F8      [19] 3722 	ld	-8 (ix),h
                           3723 ;src/main.c:671: if (actual->patrolling) {
   798D DD 6E F7      [19] 3724 	ld	l,-9 (ix)
   7990 DD 66 F8      [19] 3725 	ld	h,-8 (ix)
   7993 6E            [ 7] 3726 	ld	l,(hl)
                           3727 ;src/main.c:674: if (actual->inRange) {
   7994 79            [ 4] 3728 	ld	a,c
   7995 C6 11         [ 7] 3729 	add	a, #0x11
   7997 5F            [ 4] 3730 	ld	e,a
   7998 78            [ 4] 3731 	ld	a,b
   7999 CE 00         [ 7] 3732 	adc	a, #0x00
   799B 57            [ 4] 3733 	ld	d,a
                           3734 ;src/main.c:683: actual->seek = 1;
   799C 79            [ 4] 3735 	ld	a,c
   799D C6 14         [ 7] 3736 	add	a, #0x14
   799F DD 77 F4      [19] 3737 	ld	-12 (ix),a
   79A2 78            [ 4] 3738 	ld	a,b
   79A3 CE 00         [ 7] 3739 	adc	a, #0x00
   79A5 DD 77 F5      [19] 3740 	ld	-11 (ix),a
                           3741 ;src/main.c:671: if (actual->patrolling) {
   79A8 7D            [ 4] 3742 	ld	a,l
   79A9 B7            [ 4] 3743 	or	a, a
   79AA CA 68 7A      [10] 3744 	jp	Z,00114$
                           3745 ;src/main.c:673: moverEnemigoPatrol(actual);
   79AD C5            [11] 3746 	push	bc
   79AE D5            [11] 3747 	push	de
   79AF C5            [11] 3748 	push	bc
   79B0 CD 8B 6C      [17] 3749 	call	_moverEnemigoPatrol
   79B3 F1            [10] 3750 	pop	af
   79B4 D1            [10] 3751 	pop	de
   79B5 C1            [10] 3752 	pop	bc
                           3753 ;src/main.c:674: if (actual->inRange) {
   79B6 1A            [ 7] 3754 	ld	a,(de)
   79B7 B7            [ 4] 3755 	or	a, a
   79B8 28 24         [12] 3756 	jr	Z,00104$
                           3757 ;src/main.c:675: engage(actual, prota.x, prota.y);
   79BA 3A E9 62      [13] 3758 	ld	a, (#_prota + 1)
   79BD 21 E8 62      [10] 3759 	ld	hl, #_prota + 0
   79C0 56            [ 7] 3760 	ld	d,(hl)
   79C1 F5            [11] 3761 	push	af
   79C2 33            [ 6] 3762 	inc	sp
   79C3 D5            [11] 3763 	push	de
   79C4 33            [ 6] 3764 	inc	sp
   79C5 C5            [11] 3765 	push	bc
   79C6 CD 96 71      [17] 3766 	call	_engage
   79C9 F1            [10] 3767 	pop	af
   79CA F1            [10] 3768 	pop	af
                           3769 ;src/main.c:676: actual->patrolling = 0;
   79CB DD 6E F7      [19] 3770 	ld	l,-9 (ix)
   79CE DD 66 F8      [19] 3771 	ld	h,-8 (ix)
   79D1 36 00         [10] 3772 	ld	(hl),#0x00
                           3773 ;src/main.c:677: actual->engage = 1;
   79D3 DD 6E F9      [19] 3774 	ld	l,-7 (ix)
   79D6 DD 66 FA      [19] 3775 	ld	h,-6 (ix)
   79D9 36 01         [10] 3776 	ld	(hl),#0x01
   79DB C3 9B 7A      [10] 3777 	jp	00119$
   79DE                    3778 00104$:
                           3779 ;src/main.c:678: } else if (actual->seen) {
   79DE 21 12 00      [10] 3780 	ld	hl,#0x0012
   79E1 09            [11] 3781 	add	hl,bc
   79E2 DD 75 FD      [19] 3782 	ld	-3 (ix),l
   79E5 DD 74 FE      [19] 3783 	ld	-2 (ix),h
   79E8 DD 6E FD      [19] 3784 	ld	l,-3 (ix)
   79EB DD 66 FE      [19] 3785 	ld	h,-2 (ix)
   79EE 7E            [ 7] 3786 	ld	a,(hl)
   79EF B7            [ 4] 3787 	or	a, a
   79F0 CA 9B 7A      [10] 3788 	jp	Z,00119$
                           3789 ;src/main.c:680: pathFinding(actual->x, actual->y, prota.x , prota.y, actual, mapa);
   79F3 3A E9 62      [13] 3790 	ld	a,(#_prota + 1)
   79F6 DD 77 FF      [19] 3791 	ld	-1 (ix),a
   79F9 21 E8 62      [10] 3792 	ld	hl, #_prota + 0
   79FC 5E            [ 7] 3793 	ld	e,(hl)
   79FD 21 01 00      [10] 3794 	ld	hl,#0x0001
   7A00 09            [11] 3795 	add	hl,bc
   7A01 DD 75 FB      [19] 3796 	ld	-5 (ix),l
   7A04 DD 74 FC      [19] 3797 	ld	-4 (ix),h
   7A07 DD 6E FB      [19] 3798 	ld	l,-5 (ix)
   7A0A DD 66 FC      [19] 3799 	ld	h,-4 (ix)
   7A0D 56            [ 7] 3800 	ld	d,(hl)
   7A0E 0A            [ 7] 3801 	ld	a,(bc)
   7A0F DD 77 F6      [19] 3802 	ld	-10 (ix),a
   7A12 C5            [11] 3803 	push	bc
   7A13 2A C5 63      [16] 3804 	ld	hl,(_mapa)
   7A16 E5            [11] 3805 	push	hl
   7A17 C5            [11] 3806 	push	bc
   7A18 DD 7E FF      [19] 3807 	ld	a,-1 (ix)
   7A1B F5            [11] 3808 	push	af
   7A1C 33            [ 6] 3809 	inc	sp
   7A1D 7B            [ 4] 3810 	ld	a,e
   7A1E F5            [11] 3811 	push	af
   7A1F 33            [ 6] 3812 	inc	sp
   7A20 D5            [11] 3813 	push	de
   7A21 33            [ 6] 3814 	inc	sp
   7A22 DD 7E F6      [19] 3815 	ld	a,-10 (ix)
   7A25 F5            [11] 3816 	push	af
   7A26 33            [ 6] 3817 	inc	sp
   7A27 CD 40 43      [17] 3818 	call	_pathFinding
   7A2A 21 08 00      [10] 3819 	ld	hl,#8
   7A2D 39            [11] 3820 	add	hl,sp
   7A2E F9            [ 6] 3821 	ld	sp,hl
   7A2F C1            [10] 3822 	pop	bc
                           3823 ;src/main.c:681: actual->p_seek_x = actual->x;
   7A30 21 17 00      [10] 3824 	ld	hl,#0x0017
   7A33 09            [11] 3825 	add	hl,bc
   7A34 EB            [ 4] 3826 	ex	de,hl
   7A35 0A            [ 7] 3827 	ld	a,(bc)
   7A36 12            [ 7] 3828 	ld	(de),a
                           3829 ;src/main.c:682: actual->p_seek_y = actual->y;
   7A37 21 18 00      [10] 3830 	ld	hl,#0x0018
   7A3A 09            [11] 3831 	add	hl,bc
   7A3B EB            [ 4] 3832 	ex	de,hl
   7A3C DD 6E FB      [19] 3833 	ld	l,-5 (ix)
   7A3F DD 66 FC      [19] 3834 	ld	h,-4 (ix)
   7A42 7E            [ 7] 3835 	ld	a,(hl)
   7A43 12            [ 7] 3836 	ld	(de),a
                           3837 ;src/main.c:683: actual->seek = 1;
   7A44 E1            [10] 3838 	pop	hl
   7A45 E5            [11] 3839 	push	hl
   7A46 36 01         [10] 3840 	ld	(hl),#0x01
                           3841 ;src/main.c:684: actual->iter=0;
   7A48 21 0E 00      [10] 3842 	ld	hl,#0x000E
   7A4B 09            [11] 3843 	add	hl,bc
   7A4C AF            [ 4] 3844 	xor	a, a
   7A4D 77            [ 7] 3845 	ld	(hl), a
   7A4E 23            [ 6] 3846 	inc	hl
   7A4F 77            [ 7] 3847 	ld	(hl), a
                           3848 ;src/main.c:685: actual->reversePatrol = NO;
   7A50 21 0C 00      [10] 3849 	ld	hl,#0x000C
   7A53 09            [11] 3850 	add	hl,bc
   7A54 36 00         [10] 3851 	ld	(hl),#0x00
                           3852 ;src/main.c:686: actual->patrolling = 0;
   7A56 DD 6E F7      [19] 3853 	ld	l,-9 (ix)
   7A59 DD 66 F8      [19] 3854 	ld	h,-8 (ix)
   7A5C 36 00         [10] 3855 	ld	(hl),#0x00
                           3856 ;src/main.c:687: actual->seen = 0;
   7A5E DD 6E FD      [19] 3857 	ld	l,-3 (ix)
   7A61 DD 66 FE      [19] 3858 	ld	h,-2 (ix)
   7A64 36 00         [10] 3859 	ld	(hl),#0x00
   7A66 18 33         [12] 3860 	jr	00119$
   7A68                    3861 00114$:
                           3862 ;src/main.c:689: } else if (actual->seek) {
   7A68 E1            [10] 3863 	pop	hl
   7A69 E5            [11] 3864 	push	hl
   7A6A 7E            [ 7] 3865 	ld	a,(hl)
   7A6B B7            [ 4] 3866 	or	a, a
   7A6C 28 2D         [12] 3867 	jr	Z,00119$
                           3868 ;src/main.c:691: if (!actual->found /*&& actual->seekTimer <= 5*/) {
   7A6E C5            [11] 3869 	push	bc
   7A6F FD E1         [14] 3870 	pop	iy
   7A71 FD 7E 13      [19] 3871 	ld	a,19 (iy)
   7A74 B7            [ 4] 3872 	or	a, a
   7A75 20 07         [12] 3873 	jr	NZ,00109$
                           3874 ;src/main.c:694: moverEnemigoSeek(actual); // buscar en posiciones cercanas a la actual
   7A77 C5            [11] 3875 	push	bc
   7A78 CD E4 6F      [17] 3876 	call	_moverEnemigoSeek
   7A7B F1            [10] 3877 	pop	af
   7A7C 18 1D         [12] 3878 	jr	00119$
   7A7E                    3879 00109$:
                           3880 ;src/main.c:695: } else if (actual->inRange) {
   7A7E 1A            [ 7] 3881 	ld	a,(de)
   7A7F B7            [ 4] 3882 	or	a, a
   7A80 28 19         [12] 3883 	jr	Z,00119$
                           3884 ;src/main.c:696: engage(actual, prota.x, prota.y);
   7A82 3A E9 62      [13] 3885 	ld	a, (#_prota + 1)
   7A85 21 E8 62      [10] 3886 	ld	hl, #_prota + 0
   7A88 56            [ 7] 3887 	ld	d,(hl)
   7A89 F5            [11] 3888 	push	af
   7A8A 33            [ 6] 3889 	inc	sp
   7A8B D5            [11] 3890 	push	de
   7A8C 33            [ 6] 3891 	inc	sp
   7A8D C5            [11] 3892 	push	bc
   7A8E CD 96 71      [17] 3893 	call	_engage
   7A91 F1            [10] 3894 	pop	af
   7A92 F1            [10] 3895 	pop	af
                           3896 ;src/main.c:697: actual->engage = 1;
   7A93 DD 6E F9      [19] 3897 	ld	l,-7 (ix)
   7A96 DD 66 FA      [19] 3898 	ld	h,-6 (ix)
   7A99 36 01         [10] 3899 	ld	(hl),#0x01
   7A9B                    3900 00119$:
   7A9B DD F9         [10] 3901 	ld	sp, ix
   7A9D DD E1         [14] 3902 	pop	ix
   7A9F C9            [10] 3903 	ret
                           3904 ;src/main.c:703: void inicializarEnemy() {
                           3905 ;	---------------------------------
                           3906 ; Function inicializarEnemy
                           3907 ; ---------------------------------
   7AA0                    3908 _inicializarEnemy::
   7AA0 DD E5         [15] 3909 	push	ix
   7AA2 DD 21 00 00   [14] 3910 	ld	ix,#0
   7AA6 DD 39         [15] 3911 	add	ix,sp
   7AA8 21 F9 FF      [10] 3912 	ld	hl,#-7
   7AAB 39            [11] 3913 	add	hl,sp
   7AAC F9            [ 6] 3914 	ld	sp,hl
                           3915 ;src/main.c:714: actual = enemy;
   7AAD 01 60 5F      [10] 3916 	ld	bc,#_enemy+0
                           3917 ;src/main.c:715: while(i){
   7AB0 DD 36 F9 02   [19] 3918 	ld	-7 (ix),#0x02
   7AB4                    3919 00103$:
   7AB4 DD 7E F9      [19] 3920 	ld	a,-7 (ix)
   7AB7 B7            [ 4] 3921 	or	a, a
   7AB8 CA B4 7B      [10] 3922 	jp	Z,00106$
                           3923 ;src/main.c:716: --i;
   7ABB DD 35 F9      [23] 3924 	dec	-7 (ix)
                           3925 ;src/main.c:717: actual->x = actual->px = spawnX[i];
   7ABE 59            [ 4] 3926 	ld	e, c
   7ABF 50            [ 4] 3927 	ld	d, b
   7AC0 13            [ 6] 3928 	inc	de
   7AC1 13            [ 6] 3929 	inc	de
   7AC2 3E EB         [ 7] 3930 	ld	a,#<(_spawnX)
   7AC4 DD 86 F9      [19] 3931 	add	a, -7 (ix)
   7AC7 DD 77 FE      [19] 3932 	ld	-2 (ix),a
   7ACA 3E 63         [ 7] 3933 	ld	a,#>(_spawnX)
   7ACC CE 00         [ 7] 3934 	adc	a, #0x00
   7ACE DD 77 FF      [19] 3935 	ld	-1 (ix),a
   7AD1 DD 6E FE      [19] 3936 	ld	l,-2 (ix)
   7AD4 DD 66 FF      [19] 3937 	ld	h,-1 (ix)
   7AD7 7E            [ 7] 3938 	ld	a,(hl)
   7AD8 12            [ 7] 3939 	ld	(de),a
   7AD9 02            [ 7] 3940 	ld	(bc),a
                           3941 ;src/main.c:718: actual->y = actual->py = spawnY[i];
   7ADA C5            [11] 3942 	push	bc
   7ADB FD E1         [14] 3943 	pop	iy
   7ADD FD 23         [10] 3944 	inc	iy
   7ADF 59            [ 4] 3945 	ld	e, c
   7AE0 50            [ 4] 3946 	ld	d, b
   7AE1 13            [ 6] 3947 	inc	de
   7AE2 13            [ 6] 3948 	inc	de
   7AE3 13            [ 6] 3949 	inc	de
   7AE4 3E EF         [ 7] 3950 	ld	a,#<(_spawnY)
   7AE6 DD 86 F9      [19] 3951 	add	a, -7 (ix)
   7AE9 DD 77 FC      [19] 3952 	ld	-4 (ix),a
   7AEC 3E 63         [ 7] 3953 	ld	a,#>(_spawnY)
   7AEE CE 00         [ 7] 3954 	adc	a, #0x00
   7AF0 DD 77 FD      [19] 3955 	ld	-3 (ix),a
   7AF3 DD 6E FC      [19] 3956 	ld	l,-4 (ix)
   7AF6 DD 66 FD      [19] 3957 	ld	h,-3 (ix)
   7AF9 7E            [ 7] 3958 	ld	a,(hl)
   7AFA 12            [ 7] 3959 	ld	(de),a
   7AFB FD 77 00      [19] 3960 	ld	0 (iy), a
                           3961 ;src/main.c:719: actual->mover  = NO;
   7AFE 21 06 00      [10] 3962 	ld	hl,#0x0006
   7B01 09            [11] 3963 	add	hl,bc
   7B02 36 00         [10] 3964 	ld	(hl),#0x00
                           3965 ;src/main.c:720: actual->mira   = M_abajo;
   7B04 21 07 00      [10] 3966 	ld	hl,#0x0007
   7B07 09            [11] 3967 	add	hl,bc
   7B08 36 03         [10] 3968 	ld	(hl),#0x03
                           3969 ;src/main.c:721: actual->sprite = g_enemy;
   7B0A 21 04 00      [10] 3970 	ld	hl,#0x0004
   7B0D 09            [11] 3971 	add	hl,bc
   7B0E 36 3A         [10] 3972 	ld	(hl),#<(_g_enemy)
   7B10 23            [ 6] 3973 	inc	hl
   7B11 36 3C         [10] 3974 	ld	(hl),#>(_g_enemy)
                           3975 ;src/main.c:722: actual->muerto = NO;
   7B13 21 08 00      [10] 3976 	ld	hl,#0x0008
   7B16 09            [11] 3977 	add	hl,bc
   7B17 36 00         [10] 3978 	ld	(hl),#0x00
                           3979 ;src/main.c:723: actual->muertes = 0;
   7B19 21 0A 00      [10] 3980 	ld	hl,#0x000A
   7B1C 09            [11] 3981 	add	hl,bc
   7B1D 36 00         [10] 3982 	ld	(hl),#0x00
                           3983 ;src/main.c:724: actual->patrolling = SI;
   7B1F 21 0B 00      [10] 3984 	ld	hl,#0x000B
   7B22 09            [11] 3985 	add	hl,bc
   7B23 36 01         [10] 3986 	ld	(hl),#0x01
                           3987 ;src/main.c:725: actual->reversePatrol = NO;
   7B25 21 0C 00      [10] 3988 	ld	hl,#0x000C
   7B28 09            [11] 3989 	add	hl,bc
   7B29 36 00         [10] 3990 	ld	(hl),#0x00
                           3991 ;src/main.c:726: actual->iter = 0;
   7B2B 21 0E 00      [10] 3992 	ld	hl,#0x000E
   7B2E 09            [11] 3993 	add	hl,bc
   7B2F AF            [ 4] 3994 	xor	a, a
   7B30 77            [ 7] 3995 	ld	(hl), a
   7B31 23            [ 6] 3996 	inc	hl
   7B32 77            [ 7] 3997 	ld	(hl), a
                           3998 ;src/main.c:727: actual->lastIter = 0;
   7B33 21 10 00      [10] 3999 	ld	hl,#0x0010
   7B36 09            [11] 4000 	add	hl,bc
   7B37 36 00         [10] 4001 	ld	(hl),#0x00
                           4002 ;src/main.c:728: actual->seen = 0;
   7B39 21 12 00      [10] 4003 	ld	hl,#0x0012
   7B3C 09            [11] 4004 	add	hl,bc
   7B3D 36 00         [10] 4005 	ld	(hl),#0x00
                           4006 ;src/main.c:729: actual->found = 0;
   7B3F 21 13 00      [10] 4007 	ld	hl,#0x0013
   7B42 09            [11] 4008 	add	hl,bc
   7B43 36 00         [10] 4009 	ld	(hl),#0x00
                           4010 ;src/main.c:730: pathFinding( spawnX[i],  spawnY[i], patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
   7B45 21 C7 63      [10] 4011 	ld	hl,#_num_mapa + 0
   7B48 5E            [ 7] 4012 	ld	e, (hl)
   7B49 1C            [ 4] 4013 	inc	e
   7B4A 16 00         [ 7] 4014 	ld	d,#0x00
   7B4C 6B            [ 4] 4015 	ld	l, e
   7B4D 62            [ 4] 4016 	ld	h, d
   7B4E 29            [11] 4017 	add	hl, hl
   7B4F 29            [11] 4018 	add	hl, hl
   7B50 19            [11] 4019 	add	hl, de
   7B51 EB            [ 4] 4020 	ex	de,hl
   7B52 21 07 64      [10] 4021 	ld	hl,#_patrolY
   7B55 19            [11] 4022 	add	hl,de
   7B56 DD 7E F9      [19] 4023 	ld	a,-7 (ix)
   7B59 85            [ 4] 4024 	add	a, l
   7B5A 6F            [ 4] 4025 	ld	l,a
   7B5B 3E 00         [ 7] 4026 	ld	a,#0x00
   7B5D 8C            [ 4] 4027 	adc	a, h
   7B5E 67            [ 4] 4028 	ld	h,a
   7B5F 7E            [ 7] 4029 	ld	a,(hl)
   7B60 DD 77 FB      [19] 4030 	ld	-5 (ix),a
   7B63 21 F3 63      [10] 4031 	ld	hl,#_patrolX
   7B66 19            [11] 4032 	add	hl,de
   7B67 DD 5E F9      [19] 4033 	ld	e,-7 (ix)
   7B6A 16 00         [ 7] 4034 	ld	d,#0x00
   7B6C 19            [11] 4035 	add	hl,de
   7B6D 7E            [ 7] 4036 	ld	a,(hl)
   7B6E DD 77 FA      [19] 4037 	ld	-6 (ix),a
   7B71 DD 6E FC      [19] 4038 	ld	l,-4 (ix)
   7B74 DD 66 FD      [19] 4039 	ld	h,-3 (ix)
   7B77 5E            [ 7] 4040 	ld	e,(hl)
   7B78 DD 6E FE      [19] 4041 	ld	l,-2 (ix)
   7B7B DD 66 FF      [19] 4042 	ld	h,-1 (ix)
   7B7E 56            [ 7] 4043 	ld	d,(hl)
   7B7F C5            [11] 4044 	push	bc
   7B80 2A C5 63      [16] 4045 	ld	hl,(_mapa)
   7B83 E5            [11] 4046 	push	hl
   7B84 C5            [11] 4047 	push	bc
   7B85 DD 66 FB      [19] 4048 	ld	h,-5 (ix)
   7B88 DD 6E FA      [19] 4049 	ld	l,-6 (ix)
   7B8B E5            [11] 4050 	push	hl
   7B8C 7B            [ 4] 4051 	ld	a,e
   7B8D F5            [11] 4052 	push	af
   7B8E 33            [ 6] 4053 	inc	sp
   7B8F D5            [11] 4054 	push	de
   7B90 33            [ 6] 4055 	inc	sp
   7B91 CD 40 43      [17] 4056 	call	_pathFinding
   7B94 21 08 00      [10] 4057 	ld	hl,#8
   7B97 39            [11] 4058 	add	hl,sp
   7B98 F9            [ 6] 4059 	ld	sp,hl
   7B99 C1            [10] 4060 	pop	bc
                           4061 ;src/main.c:753: if(actual->longitud_camino > 0){
   7B9A 69            [ 4] 4062 	ld	l, c
   7B9B 60            [ 4] 4063 	ld	h, b
   7B9C 11 E1 00      [10] 4064 	ld	de, #0x00E1
   7B9F 19            [11] 4065 	add	hl, de
   7BA0 7E            [ 7] 4066 	ld	a,(hl)
   7BA1 B7            [ 4] 4067 	or	a, a
   7BA2 28 07         [12] 4068 	jr	Z,00102$
                           4069 ;src/main.c:754: dibujarEnemigo(actual);
   7BA4 C5            [11] 4070 	push	bc
   7BA5 C5            [11] 4071 	push	bc
   7BA6 CD A1 66      [17] 4072 	call	_dibujarEnemigo
   7BA9 F1            [10] 4073 	pop	af
   7BAA C1            [10] 4074 	pop	bc
   7BAB                    4075 00102$:
                           4076 ;src/main.c:756: ++actual;
   7BAB 21 E2 00      [10] 4077 	ld	hl,#0x00E2
   7BAE 09            [11] 4078 	add	hl,bc
   7BAF 4D            [ 4] 4079 	ld	c,l
   7BB0 44            [ 4] 4080 	ld	b,h
   7BB1 C3 B4 7A      [10] 4081 	jp	00103$
   7BB4                    4082 00106$:
   7BB4 DD F9         [10] 4083 	ld	sp, ix
   7BB6 DD E1         [14] 4084 	pop	ix
   7BB8 C9            [10] 4085 	ret
                           4086 ;src/main.c:760: void avanzarMapa() {
                           4087 ;	---------------------------------
                           4088 ; Function avanzarMapa
                           4089 ; ---------------------------------
   7BB9                    4090 _avanzarMapa::
                           4091 ;src/main.c:761: if(num_mapa < NUM_MAPAS -1) {
   7BB9 3A C7 63      [13] 4092 	ld	a,(#_num_mapa + 0)
   7BBC D6 02         [ 7] 4093 	sub	a, #0x02
   7BBE 30 34         [12] 4094 	jr	NC,00102$
                           4095 ;src/main.c:762: mapa = mapas[++num_mapa];
   7BC0 01 E5 63      [10] 4096 	ld	bc,#_mapas+0
   7BC3 21 C7 63      [10] 4097 	ld	hl, #_num_mapa+0
   7BC6 34            [11] 4098 	inc	(hl)
   7BC7 FD 21 C7 63   [14] 4099 	ld	iy,#_num_mapa
   7BCB FD 6E 00      [19] 4100 	ld	l,0 (iy)
   7BCE 26 00         [ 7] 4101 	ld	h,#0x00
   7BD0 29            [11] 4102 	add	hl, hl
   7BD1 09            [11] 4103 	add	hl,bc
   7BD2 7E            [ 7] 4104 	ld	a,(hl)
   7BD3 FD 21 C5 63   [14] 4105 	ld	iy,#_mapa
   7BD7 FD 77 00      [19] 4106 	ld	0 (iy),a
   7BDA 23            [ 6] 4107 	inc	hl
   7BDB 7E            [ 7] 4108 	ld	a,(hl)
   7BDC 32 C6 63      [13] 4109 	ld	(#_mapa + 1),a
                           4110 ;src/main.c:763: prota.x = prota.px = 2;
   7BDF 21 EA 62      [10] 4111 	ld	hl,#(_prota + 0x0002)
   7BE2 36 02         [10] 4112 	ld	(hl),#0x02
   7BE4 21 E8 62      [10] 4113 	ld	hl,#_prota
   7BE7 36 02         [10] 4114 	ld	(hl),#0x02
                           4115 ;src/main.c:764: prota.mover = SI;
   7BE9 21 EE 62      [10] 4116 	ld	hl,#(_prota + 0x0006)
   7BEC 36 01         [10] 4117 	ld	(hl),#0x01
                           4118 ;src/main.c:765: dibujarMapa();
   7BEE CD CF 63      [17] 4119 	call	_dibujarMapa
                           4120 ;src/main.c:766: inicializarEnemy();
   7BF1 C3 A0 7A      [10] 4121 	jp  _inicializarEnemy
   7BF4                    4122 00102$:
                           4123 ;src/main.c:769: menuFin(puntuacion);
   7BF4 FD 21 C8 63   [14] 4124 	ld	iy,#_puntuacion
   7BF8 FD 6E 00      [19] 4125 	ld	l,0 (iy)
   7BFB 26 00         [ 7] 4126 	ld	h,#0x00
   7BFD C3 A0 4A      [10] 4127 	jp  _menuFin
                           4128 ;src/main.c:773: void moverIzquierda() {
                           4129 ;	---------------------------------
                           4130 ; Function moverIzquierda
                           4131 ; ---------------------------------
   7C00                    4132 _moverIzquierda::
                           4133 ;src/main.c:774: prota.mira = M_izquierda;
   7C00 01 E8 62      [10] 4134 	ld	bc,#_prota+0
   7C03 21 EF 62      [10] 4135 	ld	hl,#(_prota + 0x0007)
   7C06 36 01         [10] 4136 	ld	(hl),#0x01
                           4137 ;src/main.c:775: if (!checkCollision(M_izquierda)) {
   7C08 C5            [11] 4138 	push	bc
   7C09 3E 01         [ 7] 4139 	ld	a,#0x01
   7C0B F5            [11] 4140 	push	af
   7C0C 33            [ 6] 4141 	inc	sp
   7C0D CD 30 65      [17] 4142 	call	_checkCollision
   7C10 33            [ 6] 4143 	inc	sp
   7C11 C1            [10] 4144 	pop	bc
   7C12 7D            [ 4] 4145 	ld	a,l
   7C13 B7            [ 4] 4146 	or	a, a
   7C14 C0            [11] 4147 	ret	NZ
                           4148 ;src/main.c:776: prota.x--;
   7C15 0A            [ 7] 4149 	ld	a,(bc)
   7C16 C6 FF         [ 7] 4150 	add	a,#0xFF
   7C18 02            [ 7] 4151 	ld	(bc),a
                           4152 ;src/main.c:777: prota.mover = SI;
   7C19 21 EE 62      [10] 4153 	ld	hl,#(_prota + 0x0006)
   7C1C 36 01         [10] 4154 	ld	(hl),#0x01
                           4155 ;src/main.c:778: prota.sprite = g_hero_left;
   7C1E 21 C6 3D      [10] 4156 	ld	hl,#_g_hero_left
   7C21 22 EC 62      [16] 4157 	ld	((_prota + 0x0004)), hl
   7C24 C9            [10] 4158 	ret
                           4159 ;src/main.c:782: void moverDerecha() {
                           4160 ;	---------------------------------
                           4161 ; Function moverDerecha
                           4162 ; ---------------------------------
   7C25                    4163 _moverDerecha::
                           4164 ;src/main.c:783: prota.mira = M_derecha;
   7C25 21 EF 62      [10] 4165 	ld	hl,#(_prota + 0x0007)
   7C28 36 00         [10] 4166 	ld	(hl),#0x00
                           4167 ;src/main.c:784: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7C2A AF            [ 4] 4168 	xor	a, a
   7C2B F5            [11] 4169 	push	af
   7C2C 33            [ 6] 4170 	inc	sp
   7C2D CD 30 65      [17] 4171 	call	_checkCollision
   7C30 33            [ 6] 4172 	inc	sp
   7C31 45            [ 4] 4173 	ld	b,l
   7C32 21 E8 62      [10] 4174 	ld	hl, #_prota + 0
   7C35 4E            [ 7] 4175 	ld	c,(hl)
   7C36 59            [ 4] 4176 	ld	e,c
   7C37 16 00         [ 7] 4177 	ld	d,#0x00
   7C39 21 07 00      [10] 4178 	ld	hl,#0x0007
   7C3C 19            [11] 4179 	add	hl,de
   7C3D 11 50 80      [10] 4180 	ld	de, #0x8050
   7C40 29            [11] 4181 	add	hl, hl
   7C41 3F            [ 4] 4182 	ccf
   7C42 CB 1C         [ 8] 4183 	rr	h
   7C44 CB 1D         [ 8] 4184 	rr	l
   7C46 ED 52         [15] 4185 	sbc	hl, de
   7C48 3E 00         [ 7] 4186 	ld	a,#0x00
   7C4A 17            [ 4] 4187 	rla
   7C4B 5F            [ 4] 4188 	ld	e,a
   7C4C 78            [ 4] 4189 	ld	a,b
   7C4D B7            [ 4] 4190 	or	a,a
   7C4E 20 14         [12] 4191 	jr	NZ,00104$
   7C50 B3            [ 4] 4192 	or	a,e
   7C51 28 11         [12] 4193 	jr	Z,00104$
                           4194 ;src/main.c:785: prota.x++;
   7C53 0C            [ 4] 4195 	inc	c
   7C54 21 E8 62      [10] 4196 	ld	hl,#_prota
   7C57 71            [ 7] 4197 	ld	(hl),c
                           4198 ;src/main.c:786: prota.mover = SI;
   7C58 21 EE 62      [10] 4199 	ld	hl,#(_prota + 0x0006)
   7C5B 36 01         [10] 4200 	ld	(hl),#0x01
                           4201 ;src/main.c:787: prota.sprite = g_hero;
   7C5D 21 70 3E      [10] 4202 	ld	hl,#_g_hero
   7C60 22 EC 62      [16] 4203 	ld	((_prota + 0x0004)), hl
   7C63 C9            [10] 4204 	ret
   7C64                    4205 00104$:
                           4206 ;src/main.c:789: }else if( prota.x + G_HERO_W >= 80){
   7C64 7B            [ 4] 4207 	ld	a,e
   7C65 B7            [ 4] 4208 	or	a, a
   7C66 C0            [11] 4209 	ret	NZ
                           4210 ;src/main.c:790: avanzarMapa();
   7C67 C3 B9 7B      [10] 4211 	jp  _avanzarMapa
                           4212 ;src/main.c:794: void moverArriba() {
                           4213 ;	---------------------------------
                           4214 ; Function moverArriba
                           4215 ; ---------------------------------
   7C6A                    4216 _moverArriba::
                           4217 ;src/main.c:795: prota.mira = M_arriba;
   7C6A 21 EF 62      [10] 4218 	ld	hl,#(_prota + 0x0007)
   7C6D 36 02         [10] 4219 	ld	(hl),#0x02
                           4220 ;src/main.c:796: if (!checkCollision(M_arriba)) {
   7C6F 3E 02         [ 7] 4221 	ld	a,#0x02
   7C71 F5            [11] 4222 	push	af
   7C72 33            [ 6] 4223 	inc	sp
   7C73 CD 30 65      [17] 4224 	call	_checkCollision
   7C76 33            [ 6] 4225 	inc	sp
   7C77 7D            [ 4] 4226 	ld	a,l
   7C78 B7            [ 4] 4227 	or	a, a
   7C79 C0            [11] 4228 	ret	NZ
                           4229 ;src/main.c:797: prota.y--;
   7C7A 21 E9 62      [10] 4230 	ld	hl,#_prota + 1
   7C7D 4E            [ 7] 4231 	ld	c,(hl)
   7C7E 0D            [ 4] 4232 	dec	c
   7C7F 71            [ 7] 4233 	ld	(hl),c
                           4234 ;src/main.c:798: prota.y--;
   7C80 0D            [ 4] 4235 	dec	c
   7C81 71            [ 7] 4236 	ld	(hl),c
                           4237 ;src/main.c:799: prota.mover  = SI;
   7C82 21 EE 62      [10] 4238 	ld	hl,#(_prota + 0x0006)
   7C85 36 01         [10] 4239 	ld	(hl),#0x01
                           4240 ;src/main.c:800: prota.sprite = g_hero_up;
   7C87 21 2C 3D      [10] 4241 	ld	hl,#_g_hero_up
   7C8A 22 EC 62      [16] 4242 	ld	((_prota + 0x0004)), hl
   7C8D C9            [10] 4243 	ret
                           4244 ;src/main.c:804: void moverAbajo() {
                           4245 ;	---------------------------------
                           4246 ; Function moverAbajo
                           4247 ; ---------------------------------
   7C8E                    4248 _moverAbajo::
                           4249 ;src/main.c:805: prota.mira = M_abajo;
   7C8E 21 EF 62      [10] 4250 	ld	hl,#(_prota + 0x0007)
   7C91 36 03         [10] 4251 	ld	(hl),#0x03
                           4252 ;src/main.c:806: if (!checkCollision(M_abajo) ) {
   7C93 3E 03         [ 7] 4253 	ld	a,#0x03
   7C95 F5            [11] 4254 	push	af
   7C96 33            [ 6] 4255 	inc	sp
   7C97 CD 30 65      [17] 4256 	call	_checkCollision
   7C9A 33            [ 6] 4257 	inc	sp
   7C9B 7D            [ 4] 4258 	ld	a,l
   7C9C B7            [ 4] 4259 	or	a, a
   7C9D C0            [11] 4260 	ret	NZ
                           4261 ;src/main.c:807: prota.y++;
   7C9E 01 E9 62      [10] 4262 	ld	bc,#_prota + 1
   7CA1 0A            [ 7] 4263 	ld	a,(bc)
   7CA2 3C            [ 4] 4264 	inc	a
   7CA3 02            [ 7] 4265 	ld	(bc),a
                           4266 ;src/main.c:808: prota.y++;
   7CA4 3C            [ 4] 4267 	inc	a
   7CA5 02            [ 7] 4268 	ld	(bc),a
                           4269 ;src/main.c:809: prota.mover  = SI;
   7CA6 21 EE 62      [10] 4270 	ld	hl,#(_prota + 0x0006)
   7CA9 36 01         [10] 4271 	ld	(hl),#0x01
                           4272 ;src/main.c:810: prota.sprite = g_hero_down;
   7CAB 21 92 3C      [10] 4273 	ld	hl,#_g_hero_down
   7CAE 22 EC 62      [16] 4274 	ld	((_prota + 0x0004)), hl
   7CB1 C9            [10] 4275 	ret
                           4276 ;src/main.c:817: void intHandler() {
                           4277 ;	---------------------------------
                           4278 ; Function intHandler
                           4279 ; ---------------------------------
   7CB2                    4280 _intHandler::
                           4281 ;src/main.c:818: if (++i == 6) {
   7CB2 21 FB 62      [10] 4282 	ld	hl, #_i+0
   7CB5 34            [11] 4283 	inc	(hl)
   7CB6 3A FB 62      [13] 4284 	ld	a,(#_i + 0)
   7CB9 D6 06         [ 7] 4285 	sub	a, #0x06
   7CBB C0            [11] 4286 	ret	NZ
                           4287 ;src/main.c:819: play();
   7CBC CD 34 52      [17] 4288 	call	_play
                           4289 ;src/main.c:820: i=0;
   7CBF 21 FB 62      [10] 4290 	ld	hl,#_i + 0
   7CC2 36 00         [10] 4291 	ld	(hl), #0x00
   7CC4 C9            [10] 4292 	ret
                           4293 ;src/main.c:824: void inicializarCPC() {
                           4294 ;	---------------------------------
                           4295 ; Function inicializarCPC
                           4296 ; ---------------------------------
   7CC5                    4297 _inicializarCPC::
                           4298 ;src/main.c:825: cpct_disableFirmware();
   7CC5 CD DB 55      [17] 4299 	call	_cpct_disableFirmware
                           4300 ;src/main.c:826: cpct_setVideoMode(0);
   7CC8 2E 00         [ 7] 4301 	ld	l,#0x00
   7CCA CD AF 55      [17] 4302 	call	_cpct_setVideoMode
                           4303 ;src/main.c:827: cpct_setBorder(HW_BLACK);
   7CCD 21 10 14      [10] 4304 	ld	hl,#0x1410
   7CD0 E5            [11] 4305 	push	hl
   7CD1 CD 12 53      [17] 4306 	call	_cpct_setPALColour
                           4307 ;src/main.c:828: cpct_setPalette(g_palette, 16);
   7CD4 21 10 00      [10] 4308 	ld	hl,#0x0010
   7CD7 E5            [11] 4309 	push	hl
   7CD8 21 60 3E      [10] 4310 	ld	hl,#_g_palette
   7CDB E5            [11] 4311 	push	hl
   7CDC CD EF 52      [17] 4312 	call	_cpct_setPalette
   7CDF C9            [10] 4313 	ret
                           4314 ;src/main.c:833: void inicializarJuego() {
                           4315 ;	---------------------------------
                           4316 ; Function inicializarJuego
                           4317 ; ---------------------------------
   7CE0                    4318 _inicializarJuego::
                           4319 ;src/main.c:835: num_mapa = 0;
   7CE0 21 C7 63      [10] 4320 	ld	hl,#_num_mapa + 0
   7CE3 36 00         [10] 4321 	ld	(hl), #0x00
                           4322 ;src/main.c:836: mapa = mapas[num_mapa];
   7CE5 21 E5 63      [10] 4323 	ld	hl, #_mapas + 0
   7CE8 7E            [ 7] 4324 	ld	a,(hl)
   7CE9 FD 21 C5 63   [14] 4325 	ld	iy,#_mapa
   7CED FD 77 00      [19] 4326 	ld	0 (iy),a
   7CF0 23            [ 6] 4327 	inc	hl
   7CF1 7E            [ 7] 4328 	ld	a,(hl)
   7CF2 32 C6 63      [13] 4329 	ld	(#_mapa + 1),a
                           4330 ;src/main.c:837: cpct_etm_setTileset2x4(g_tileset);
   7CF5 21 E0 17      [10] 4331 	ld	hl,#_g_tileset
   7CF8 CD 03 55      [17] 4332 	call	_cpct_etm_setTileset2x4
                           4333 ;src/main.c:839: dibujarMapa();
   7CFB CD CF 63      [17] 4334 	call	_dibujarMapa
                           4335 ;src/main.c:842: barraPuntuacionInicial();
   7CFE CD 40 50      [17] 4336 	call	_barraPuntuacionInicial
                           4337 ;src/main.c:845: prota.x = prota.px = 4;
   7D01 21 EA 62      [10] 4338 	ld	hl,#(_prota + 0x0002)
   7D04 36 04         [10] 4339 	ld	(hl),#0x04
   7D06 21 E8 62      [10] 4340 	ld	hl,#_prota
   7D09 36 04         [10] 4341 	ld	(hl),#0x04
                           4342 ;src/main.c:846: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   7D0B 21 EB 62      [10] 4343 	ld	hl,#(_prota + 0x0003)
   7D0E 36 68         [10] 4344 	ld	(hl),#0x68
   7D10 21 E9 62      [10] 4345 	ld	hl,#(_prota + 0x0001)
   7D13 36 68         [10] 4346 	ld	(hl),#0x68
                           4347 ;src/main.c:847: prota.mover  = NO;
   7D15 21 EE 62      [10] 4348 	ld	hl,#(_prota + 0x0006)
   7D18 36 00         [10] 4349 	ld	(hl),#0x00
                           4350 ;src/main.c:848: prota.mira=M_derecha;
   7D1A 21 EF 62      [10] 4351 	ld	hl,#(_prota + 0x0007)
   7D1D 36 00         [10] 4352 	ld	(hl),#0x00
                           4353 ;src/main.c:849: prota.sprite = g_hero;
   7D1F 21 70 3E      [10] 4354 	ld	hl,#_g_hero
   7D22 22 EC 62      [16] 4355 	ld	((_prota + 0x0004)), hl
                           4356 ;src/main.c:853: cu.x = cu.px = 0;
   7D25 21 F2 62      [10] 4357 	ld	hl,#(_cu + 0x0002)
   7D28 36 00         [10] 4358 	ld	(hl),#0x00
   7D2A 21 F0 62      [10] 4359 	ld	hl,#_cu
   7D2D 36 00         [10] 4360 	ld	(hl),#0x00
                           4361 ;src/main.c:854: cu.y = cu.py = 0;
   7D2F 21 F3 62      [10] 4362 	ld	hl,#(_cu + 0x0003)
   7D32 36 00         [10] 4363 	ld	(hl),#0x00
   7D34 21 F1 62      [10] 4364 	ld	hl,#(_cu + 0x0001)
   7D37 36 00         [10] 4365 	ld	(hl),#0x00
                           4366 ;src/main.c:855: cu.lanzado = NO;
   7D39 21 F6 62      [10] 4367 	ld	hl,#(_cu + 0x0006)
   7D3C 36 00         [10] 4368 	ld	(hl),#0x00
                           4369 ;src/main.c:856: cu.mover = NO;
   7D3E 21 F9 62      [10] 4370 	ld	hl,#(_cu + 0x0009)
   7D41 36 00         [10] 4371 	ld	(hl),#0x00
                           4372 ;src/main.c:857: cu.off_bound = NO;
   7D43 21 FA 62      [10] 4373 	ld	hl,#(_cu + 0x000a)
   7D46 36 00         [10] 4374 	ld	(hl),#0x00
                           4375 ;src/main.c:859: inicializarEnemy();
   7D48 CD A0 7A      [17] 4376 	call	_inicializarEnemy
                           4377 ;src/main.c:861: dibujarProta();
   7D4B C3 1B 64      [10] 4378 	jp  _dibujarProta
                           4379 ;src/main.c:864: void main(void) {
                           4380 ;	---------------------------------
                           4381 ; Function main
                           4382 ; ---------------------------------
   7D4E                    4383 _main::
   7D4E DD E5         [15] 4384 	push	ix
   7D50 DD 21 00 00   [14] 4385 	ld	ix,#0
   7D54 DD 39         [15] 4386 	add	ix,sp
   7D56 F5            [11] 4387 	push	af
   7D57 3B            [ 6] 4388 	dec	sp
                           4389 ;src/main.c:869: inicializarCPC();
   7D58 CD C5 7C      [17] 4390 	call	_inicializarCPC
                           4391 ;src/main.c:871: menuInicio();
   7D5B CD 61 4F      [17] 4392 	call	_menuInicio
                           4393 ;src/main.c:873: inicializarJuego();
   7D5E CD E0 7C      [17] 4394 	call	_inicializarJuego
                           4395 ;src/main.c:877: while (1) {
   7D61                    4396 00119$:
                           4397 ;src/main.c:880: actual = enemy;
                           4398 ;src/main.c:882: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   7D61 21 00 01      [10] 4399 	ld	hl,#_g_tablatrans
   7D64 E5            [11] 4400 	push	hl
   7D65 2A C5 63      [16] 4401 	ld	hl,(_mapa)
   7D68 E5            [11] 4402 	push	hl
   7D69 21 E8 62      [10] 4403 	ld	hl,#_prota
   7D6C E5            [11] 4404 	push	hl
   7D6D 21 F0 62      [10] 4405 	ld	hl,#_cu
   7D70 E5            [11] 4406 	push	hl
   7D71 CD C9 64      [17] 4407 	call	_comprobarTeclado
   7D74 21 08 00      [10] 4408 	ld	hl,#8
   7D77 39            [11] 4409 	add	hl,sp
   7D78 F9            [ 6] 4410 	ld	sp,hl
                           4411 ;src/main.c:883: moverCuchillo(&cu, mapa);
   7D79 2A C5 63      [16] 4412 	ld	hl,(_mapa)
   7D7C E5            [11] 4413 	push	hl
   7D7D 21 F0 62      [10] 4414 	ld	hl,#_cu
   7D80 E5            [11] 4415 	push	hl
   7D81 CD E5 48      [17] 4416 	call	_moverCuchillo
   7D84 F1            [10] 4417 	pop	af
   7D85 F1            [10] 4418 	pop	af
                           4419 ;src/main.c:884: while(i){
   7D86 DD 36 FD 02   [19] 4420 	ld	-3 (ix),#0x02
   7D8A DD 36 FE 60   [19] 4421 	ld	-2 (ix),#<(_enemy)
   7D8E DD 36 FF 5F   [19] 4422 	ld	-1 (ix),#>(_enemy)
   7D92                    4423 00101$:
   7D92 DD 7E FD      [19] 4424 	ld	a,-3 (ix)
   7D95 B7            [ 4] 4425 	or	a, a
   7D96 28 20         [12] 4426 	jr	Z,00103$
                           4427 ;src/main.c:885: --i;
   7D98 DD 35 FD      [23] 4428 	dec	-3 (ix)
                           4429 ;src/main.c:886: updateEnemy(actual);
   7D9B DD 6E FE      [19] 4430 	ld	l,-2 (ix)
   7D9E DD 66 FF      [19] 4431 	ld	h,-1 (ix)
   7DA1 E5            [11] 4432 	push	hl
   7DA2 CD 41 79      [17] 4433 	call	_updateEnemy
   7DA5 F1            [10] 4434 	pop	af
                           4435 ;src/main.c:887: ++actual;
   7DA6 DD 7E FE      [19] 4436 	ld	a,-2 (ix)
   7DA9 C6 E2         [ 7] 4437 	add	a, #0xE2
   7DAB DD 77 FE      [19] 4438 	ld	-2 (ix),a
   7DAE DD 7E FF      [19] 4439 	ld	a,-1 (ix)
   7DB1 CE 00         [ 7] 4440 	adc	a, #0x00
   7DB3 DD 77 FF      [19] 4441 	ld	-1 (ix),a
   7DB6 18 DA         [12] 4442 	jr	00101$
   7DB8                    4443 00103$:
                           4444 ;src/main.c:890: cpct_waitVSYNC();
   7DB8 CD A7 55      [17] 4445 	call	_cpct_waitVSYNC
                           4446 ;src/main.c:893: if (prota.mover) {
   7DBB 01 EE 62      [10] 4447 	ld	bc,#_prota + 6
   7DBE 0A            [ 7] 4448 	ld	a,(bc)
   7DBF B7            [ 4] 4449 	or	a, a
   7DC0 28 07         [12] 4450 	jr	Z,00105$
                           4451 ;src/main.c:894: redibujarProta();
   7DC2 C5            [11] 4452 	push	bc
   7DC3 CD B5 64      [17] 4453 	call	_redibujarProta
   7DC6 C1            [10] 4454 	pop	bc
                           4455 ;src/main.c:895: prota.mover = NO;
   7DC7 AF            [ 4] 4456 	xor	a, a
   7DC8 02            [ 7] 4457 	ld	(bc),a
   7DC9                    4458 00105$:
                           4459 ;src/main.c:897: if(cu.lanzado && cu.mover){
   7DC9 21 F6 62      [10] 4460 	ld	hl, #(_cu + 0x0006) + 0
   7DCC 4E            [ 7] 4461 	ld	c,(hl)
                           4462 ;src/main.c:898: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4463 ;src/main.c:897: if(cu.lanzado && cu.mover){
   7DCD 79            [ 4] 4464 	ld	a,c
   7DCE B7            [ 4] 4465 	or	a, a
   7DCF 28 30         [12] 4466 	jr	Z,00110$
   7DD1 3A F9 62      [13] 4467 	ld	a, (#(_cu + 0x0009) + 0)
   7DD4 B7            [ 4] 4468 	or	a, a
   7DD5 28 2A         [12] 4469 	jr	Z,00110$
                           4470 ;src/main.c:898: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   7DD7 21 F1 62      [10] 4471 	ld	hl, #(_cu + 0x0001) + 0
   7DDA 4E            [ 7] 4472 	ld	c,(hl)
   7DDB 21 F0 62      [10] 4473 	ld	hl, #_cu + 0
   7DDE 46            [ 7] 4474 	ld	b,(hl)
   7DDF 21 F8 62      [10] 4475 	ld	hl, #(_cu + 0x0008) + 0
   7DE2 5E            [ 7] 4476 	ld	e,(hl)
   7DE3 2A C5 63      [16] 4477 	ld	hl,(_mapa)
   7DE6 E5            [11] 4478 	push	hl
   7DE7 21 00 01      [10] 4479 	ld	hl,#_g_tablatrans
   7DEA E5            [11] 4480 	push	hl
   7DEB 21 F0 62      [10] 4481 	ld	hl,#_cu
   7DEE E5            [11] 4482 	push	hl
   7DEF 79            [ 4] 4483 	ld	a,c
   7DF0 F5            [11] 4484 	push	af
   7DF1 33            [ 6] 4485 	inc	sp
   7DF2 C5            [11] 4486 	push	bc
   7DF3 33            [ 6] 4487 	inc	sp
   7DF4 7B            [ 4] 4488 	ld	a,e
   7DF5 F5            [11] 4489 	push	af
   7DF6 33            [ 6] 4490 	inc	sp
   7DF7 CD 05 46      [17] 4491 	call	_redibujarCuchillo
   7DFA 21 09 00      [10] 4492 	ld	hl,#9
   7DFD 39            [11] 4493 	add	hl,sp
   7DFE F9            [ 6] 4494 	ld	sp,hl
   7DFF 18 28         [12] 4495 	jr	00111$
   7E01                    4496 00110$:
                           4497 ;src/main.c:899: }else if (cu.lanzado && !cu.mover){
   7E01 79            [ 4] 4498 	ld	a,c
   7E02 B7            [ 4] 4499 	or	a, a
   7E03 28 24         [12] 4500 	jr	Z,00111$
   7E05 3A F9 62      [13] 4501 	ld	a, (#(_cu + 0x0009) + 0)
   7E08 B7            [ 4] 4502 	or	a, a
   7E09 20 1E         [12] 4503 	jr	NZ,00111$
                           4504 ;src/main.c:900: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   7E0B 21 F1 62      [10] 4505 	ld	hl, #(_cu + 0x0001) + 0
   7E0E 46            [ 7] 4506 	ld	b,(hl)
   7E0F 21 F0 62      [10] 4507 	ld	hl, #_cu + 0
   7E12 4E            [ 7] 4508 	ld	c,(hl)
   7E13 21 F8 62      [10] 4509 	ld	hl, #(_cu + 0x0008) + 0
   7E16 56            [ 7] 4510 	ld	d,(hl)
   7E17 2A C5 63      [16] 4511 	ld	hl,(_mapa)
   7E1A E5            [11] 4512 	push	hl
   7E1B C5            [11] 4513 	push	bc
   7E1C D5            [11] 4514 	push	de
   7E1D 33            [ 6] 4515 	inc	sp
   7E1E CD 72 45      [17] 4516 	call	_borrarCuchillo
   7E21 F1            [10] 4517 	pop	af
   7E22 F1            [10] 4518 	pop	af
   7E23 33            [ 6] 4519 	inc	sp
                           4520 ;src/main.c:901: cu.lanzado = NO;
   7E24 21 F6 62      [10] 4521 	ld	hl,#(_cu + 0x0006)
   7E27 36 00         [10] 4522 	ld	(hl),#0x00
   7E29                    4523 00111$:
                           4524 ;src/main.c:905: actual = enemy;
   7E29 01 60 5F      [10] 4525 	ld	bc,#_enemy
                           4526 ;src/main.c:906: while(i){
   7E2C DD 36 FD 02   [19] 4527 	ld	-3 (ix),#0x02
   7E30                    4528 00115$:
   7E30 DD 7E FD      [19] 4529 	ld	a,-3 (ix)
   7E33 B7            [ 4] 4530 	or	a, a
   7E34 28 2C         [12] 4531 	jr	Z,00117$
                           4532 ;src/main.c:908: --i;
   7E36 DD 35 FD      [23] 4533 	dec	-3 (ix)
                           4534 ;src/main.c:909: if(actual->mover){
   7E39 C5            [11] 4535 	push	bc
   7E3A FD E1         [14] 4536 	pop	iy
   7E3C FD 7E 06      [19] 4537 	ld	a,6 (iy)
   7E3F B7            [ 4] 4538 	or	a, a
   7E40 28 18         [12] 4539 	jr	Z,00114$
                           4540 ;src/main.c:910: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7E42 69            [ 4] 4541 	ld	l, c
   7E43 60            [ 4] 4542 	ld	h, b
   7E44 23            [ 6] 4543 	inc	hl
   7E45 23            [ 6] 4544 	inc	hl
   7E46 23            [ 6] 4545 	inc	hl
   7E47 5E            [ 7] 4546 	ld	e,(hl)
   7E48 69            [ 4] 4547 	ld	l, c
   7E49 60            [ 4] 4548 	ld	h, b
   7E4A 23            [ 6] 4549 	inc	hl
   7E4B 23            [ 6] 4550 	inc	hl
   7E4C 56            [ 7] 4551 	ld	d,(hl)
   7E4D C5            [11] 4552 	push	bc
   7E4E C5            [11] 4553 	push	bc
   7E4F 7B            [ 4] 4554 	ld	a,e
   7E50 F5            [11] 4555 	push	af
   7E51 33            [ 6] 4556 	inc	sp
   7E52 D5            [11] 4557 	push	de
   7E53 33            [ 6] 4558 	inc	sp
   7E54 CD FF 67      [17] 4559 	call	_redibujarEnemigo
   7E57 F1            [10] 4560 	pop	af
   7E58 F1            [10] 4561 	pop	af
   7E59 C1            [10] 4562 	pop	bc
   7E5A                    4563 00114$:
                           4564 ;src/main.c:923: ++actual;
   7E5A 21 E2 00      [10] 4565 	ld	hl,#0x00E2
   7E5D 09            [11] 4566 	add	hl,bc
   7E5E 4D            [ 4] 4567 	ld	c,l
   7E5F 44            [ 4] 4568 	ld	b,h
   7E60 18 CE         [12] 4569 	jr	00115$
   7E62                    4570 00117$:
                           4571 ;src/main.c:925: cpct_waitVSYNC();
   7E62 CD A7 55      [17] 4572 	call	_cpct_waitVSYNC
   7E65 C3 61 7D      [10] 4573 	jp	00119$
                           4574 	.area _CODE
                           4575 	.area _INITIALIZER
   63CA                    4576 __xinit__mapa:
   63CA 00 00              4577 	.dw #0x0000
   63CC                    4578 __xinit__num_mapa:
   63CC 00                 4579 	.db #0x00	; 0
   63CD                    4580 __xinit__puntuacion:
   63CD 00                 4581 	.db #0x00	; 0
   63CE                    4582 __xinit__vidas:
   63CE 05                 4583 	.db #0x05	; 5
                           4584 	.area _CABS (ABS)
