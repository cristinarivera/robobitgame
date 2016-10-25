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
                             23 	.globl _lookFor
                             24 	.globl _moverEnemigoSeek
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
   5F1C                      85 _enemy::
   5F1C                      86 	.ds 904
   62A4                      87 _prota::
   62A4                      88 	.ds 8
   62AC                      89 _cu::
   62AC                      90 	.ds 10
   62B6                      91 _i::
   62B6                      92 	.ds 1
                             93 ;--------------------------------------------------------
                             94 ; ram data
                             95 ;--------------------------------------------------------
                             96 	.area _INITIALIZED
   6380                      97 _mapa::
   6380                      98 	.ds 2
   6382                      99 _num_mapa::
   6382                     100 	.ds 1
   6383                     101 _puntuacion::
   6383                     102 	.ds 1
   6384                     103 _vidas::
   6384                     104 	.ds 1
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
   43EF                     129 _dummy_cpct_transparentMaskTable0M0_container::
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
   638A                     170 _dibujarMapa::
                            171 ;src/main.c:114: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, p, mapa);
   638A 2A 80 63      [16]  172 	ld	hl,(_mapa)
   638D E5            [11]  173 	push	hl
   638E 21 F0 C0      [10]  174 	ld	hl,#0xC0F0
   6391 E5            [11]  175 	push	hl
   6392 21 2C 28      [10]  176 	ld	hl,#0x282C
   6395 E5            [11]  177 	push	hl
   6396 2E 00         [ 7]  178 	ld	l, #0x00
   6398 E5            [11]  179 	push	hl
   6399 AF            [ 4]  180 	xor	a, a
   639A F5            [11]  181 	push	af
   639B 33            [ 6]  182 	inc	sp
   639C CD A3 53      [17]  183 	call	_cpct_etm_drawTileBox2x4
   639F C9            [10]  184 	ret
   63A0                     185 _mapas:
   63A0 C0 10               186 	.dw _g_map1
   63A2 E0 09               187 	.dw _g_map2
   63A4 00 03               188 	.dw _g_map3
   63A6                     189 _spawnX:
   63A6 24                  190 	.db #0x24	; 36
   63A7 47                  191 	.db #0x47	; 71	'G'
   63A8 32                  192 	.db #0x32	; 50	'2'
   63A9 18                  193 	.db #0x18	; 24
   63AA                     194 _spawnY:
   63AA 59                  195 	.db #0x59	; 89	'Y'
   63AB 72                  196 	.db #0x72	; 114	'r'
   63AC 9A                  197 	.db #0x9A	; 154
   63AD 68                  198 	.db #0x68	; 104	'h'
   63AE                     199 _patrolX:
   63AE 00                  200 	.db #0x00	; 0
   63AF 00                  201 	.db #0x00	; 0
   63B0 00                  202 	.db #0x00	; 0
   63B1 00                  203 	.db #0x00	; 0
   63B2 00                  204 	.db #0x00	; 0
   63B3 14                  205 	.db #0x14	; 20
   63B4 47                  206 	.db #0x47	; 71	'G'
   63B5 00                  207 	.db #0x00	; 0
   63B6 00                  208 	.db #0x00	; 0
   63B7 00                  209 	.db 0x00
   63B8 00                  210 	.db #0x00	; 0
   63B9 00                  211 	.db #0x00	; 0
   63BA 00                  212 	.db #0x00	; 0
   63BB 00                  213 	.db #0x00	; 0
   63BC 00                  214 	.db 0x00
   63BD 00                  215 	.db #0x00	; 0
   63BE 00                  216 	.db #0x00	; 0
   63BF 00                  217 	.db #0x00	; 0
   63C0 00                  218 	.db #0x00	; 0
   63C1 00                  219 	.db 0x00
   63C2                     220 _patrolY:
   63C2 00                  221 	.db #0x00	; 0
   63C3 00                  222 	.db #0x00	; 0
   63C4 00                  223 	.db #0x00	; 0
   63C5 00                  224 	.db #0x00	; 0
   63C6 00                  225 	.db 0x00
   63C7 59                  226 	.db #0x59	; 89	'Y'
   63C8 9C                  227 	.db #0x9C	; 156
   63C9 00                  228 	.db #0x00	; 0
   63CA 00                  229 	.db #0x00	; 0
   63CB 00                  230 	.db 0x00
   63CC 00                  231 	.db #0x00	; 0
   63CD 00                  232 	.db #0x00	; 0
   63CE 00                  233 	.db #0x00	; 0
   63CF 00                  234 	.db #0x00	; 0
   63D0 00                  235 	.db 0x00
   63D1 00                  236 	.db #0x00	; 0
   63D2 00                  237 	.db #0x00	; 0
   63D3 00                  238 	.db #0x00	; 0
   63D4 00                  239 	.db #0x00	; 0
   63D5 00                  240 	.db 0x00
                            241 ;src/main.c:117: void dibujarProta() {
                            242 ;	---------------------------------
                            243 ; Function dibujarProta
                            244 ; ---------------------------------
   63D6                     245 _dibujarProta::
                            246 ;src/main.c:118: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   63D6 21 A5 62      [10]  247 	ld	hl, #_prota + 1
   63D9 56            [ 7]  248 	ld	d,(hl)
   63DA 21 A4 62      [10]  249 	ld	hl, #_prota + 0
   63DD 46            [ 7]  250 	ld	b,(hl)
   63DE D5            [11]  251 	push	de
   63DF 33            [ 6]  252 	inc	sp
   63E0 C5            [11]  253 	push	bc
   63E1 33            [ 6]  254 	inc	sp
   63E2 21 00 C0      [10]  255 	ld	hl,#0xC000
   63E5 E5            [11]  256 	push	hl
   63E6 CD C1 5E      [17]  257 	call	_cpct_getScreenPtr
   63E9 EB            [ 4]  258 	ex	de,hl
                            259 ;src/main.c:119: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   63EA ED 4B A8 62   [20]  260 	ld	bc, (#_prota + 4)
   63EE 21 00 01      [10]  261 	ld	hl,#_g_tablatrans
   63F1 E5            [11]  262 	push	hl
   63F2 21 07 16      [10]  263 	ld	hl,#0x1607
   63F5 E5            [11]  264 	push	hl
   63F6 D5            [11]  265 	push	de
   63F7 C5            [11]  266 	push	bc
   63F8 CD E1 5E      [17]  267 	call	_cpct_drawSpriteMaskedAlignedTable
   63FB C9            [10]  268 	ret
                            269 ;src/main.c:122: void borrarProta() {
                            270 ;	---------------------------------
                            271 ; Function borrarProta
                            272 ; ---------------------------------
   63FC                     273 _borrarProta::
   63FC DD E5         [15]  274 	push	ix
   63FE DD 21 00 00   [14]  275 	ld	ix,#0
   6402 DD 39         [15]  276 	add	ix,sp
   6404 F5            [11]  277 	push	af
   6405 3B            [ 6]  278 	dec	sp
                            279 ;src/main.c:126: u8 w = 4 + (prota.px & 1);
   6406 21 A6 62      [10]  280 	ld	hl, #_prota + 2
   6409 4E            [ 7]  281 	ld	c,(hl)
   640A 79            [ 4]  282 	ld	a,c
   640B E6 01         [ 7]  283 	and	a, #0x01
   640D 47            [ 4]  284 	ld	b,a
   640E 04            [ 4]  285 	inc	b
   640F 04            [ 4]  286 	inc	b
   6410 04            [ 4]  287 	inc	b
   6411 04            [ 4]  288 	inc	b
                            289 ;src/main.c:129: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   6412 21 A7 62      [10]  290 	ld	hl, #_prota + 3
   6415 5E            [ 7]  291 	ld	e,(hl)
   6416 CB 4B         [ 8]  292 	bit	1, e
   6418 28 04         [12]  293 	jr	Z,00103$
   641A 3E 01         [ 7]  294 	ld	a,#0x01
   641C 18 02         [12]  295 	jr	00104$
   641E                     296 00103$:
   641E 3E 00         [ 7]  297 	ld	a,#0x00
   6420                     298 00104$:
   6420 C6 06         [ 7]  299 	add	a, #0x06
   6422 DD 77 FD      [19]  300 	ld	-3 (ix),a
                            301 ;src/main.c:131: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   6425 FD 2A 80 63   [20]  302 	ld	iy,(_mapa)
   6429 16 00         [ 7]  303 	ld	d,#0x00
   642B 7B            [ 4]  304 	ld	a,e
   642C C6 E8         [ 7]  305 	add	a,#0xE8
   642E DD 77 FE      [19]  306 	ld	-2 (ix),a
   6431 7A            [ 4]  307 	ld	a,d
   6432 CE FF         [ 7]  308 	adc	a,#0xFF
   6434 DD 77 FF      [19]  309 	ld	-1 (ix),a
   6437 DD 6E FE      [19]  310 	ld	l,-2 (ix)
   643A DD 66 FF      [19]  311 	ld	h,-1 (ix)
   643D DD CB FF 7E   [20]  312 	bit	7, -1 (ix)
   6441 28 04         [12]  313 	jr	Z,00105$
   6443 21 EB FF      [10]  314 	ld	hl,#0xFFEB
   6446 19            [11]  315 	add	hl,de
   6447                     316 00105$:
   6447 CB 2C         [ 8]  317 	sra	h
   6449 CB 1D         [ 8]  318 	rr	l
   644B CB 2C         [ 8]  319 	sra	h
   644D CB 1D         [ 8]  320 	rr	l
   644F 55            [ 4]  321 	ld	d,l
   6450 CB 39         [ 8]  322 	srl	c
   6452 FD E5         [15]  323 	push	iy
   6454 21 F0 C0      [10]  324 	ld	hl,#0xC0F0
   6457 E5            [11]  325 	push	hl
   6458 3E 28         [ 7]  326 	ld	a,#0x28
   645A F5            [11]  327 	push	af
   645B 33            [ 6]  328 	inc	sp
   645C DD 7E FD      [19]  329 	ld	a,-3 (ix)
   645F F5            [11]  330 	push	af
   6460 33            [ 6]  331 	inc	sp
   6461 C5            [11]  332 	push	bc
   6462 33            [ 6]  333 	inc	sp
   6463 D5            [11]  334 	push	de
   6464 33            [ 6]  335 	inc	sp
   6465 79            [ 4]  336 	ld	a,c
   6466 F5            [11]  337 	push	af
   6467 33            [ 6]  338 	inc	sp
   6468 CD A3 53      [17]  339 	call	_cpct_etm_drawTileBox2x4
   646B DD F9         [10]  340 	ld	sp, ix
   646D DD E1         [14]  341 	pop	ix
   646F C9            [10]  342 	ret
                            343 ;src/main.c:134: void redibujarProta() {
                            344 ;	---------------------------------
                            345 ; Function redibujarProta
                            346 ; ---------------------------------
   6470                     347 _redibujarProta::
                            348 ;src/main.c:135: borrarProta();
   6470 CD FC 63      [17]  349 	call	_borrarProta
                            350 ;src/main.c:136: prota.px = prota.x;
   6473 01 A6 62      [10]  351 	ld	bc,#_prota + 2
   6476 3A A4 62      [13]  352 	ld	a, (#_prota + 0)
   6479 02            [ 7]  353 	ld	(bc),a
                            354 ;src/main.c:137: prota.py = prota.y;
   647A 01 A7 62      [10]  355 	ld	bc,#_prota + 3
   647D 3A A5 62      [13]  356 	ld	a, (#_prota + 1)
   6480 02            [ 7]  357 	ld	(bc),a
                            358 ;src/main.c:138: dibujarProta();
   6481 C3 D6 63      [10]  359 	jp  _dibujarProta
                            360 ;src/main.c:141: void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
                            361 ;	---------------------------------
                            362 ; Function comprobarTeclado
                            363 ; ---------------------------------
   6484                     364 _comprobarTeclado::
                            365 ;src/main.c:142: cpct_scanKeyboard_if();
   6484 CD FB 54      [17]  366 	call	_cpct_scanKeyboard_if
                            367 ;src/main.c:144: if (cpct_isAnyKeyPressed()) {
   6487 CD EE 54      [17]  368 	call	_cpct_isAnyKeyPressed
   648A 7D            [ 4]  369 	ld	a,l
   648B B7            [ 4]  370 	or	a, a
   648C C8            [11]  371 	ret	Z
                            372 ;src/main.c:145: if (cpct_isKeyPressed(Key_CursorLeft)){
   648D 21 01 01      [10]  373 	ld	hl,#0x0101
   6490 CD C2 52      [17]  374 	call	_cpct_isKeyPressed
   6493 7D            [ 4]  375 	ld	a,l
   6494 B7            [ 4]  376 	or	a, a
                            377 ;src/main.c:146: moverIzquierda();
   6495 C2 AB 79      [10]  378 	jp	NZ,_moverIzquierda
                            379 ;src/main.c:147: }else if (cpct_isKeyPressed(Key_CursorRight)){
   6498 21 00 02      [10]  380 	ld	hl,#0x0200
   649B CD C2 52      [17]  381 	call	_cpct_isKeyPressed
   649E 7D            [ 4]  382 	ld	a,l
   649F B7            [ 4]  383 	or	a, a
                            384 ;src/main.c:148: moverDerecha();
   64A0 C2 D0 79      [10]  385 	jp	NZ,_moverDerecha
                            386 ;src/main.c:149: }else if (cpct_isKeyPressed(Key_CursorUp)){
   64A3 21 00 01      [10]  387 	ld	hl,#0x0100
   64A6 CD C2 52      [17]  388 	call	_cpct_isKeyPressed
   64A9 7D            [ 4]  389 	ld	a,l
   64AA B7            [ 4]  390 	or	a, a
                            391 ;src/main.c:150: moverArriba();
   64AB C2 15 7A      [10]  392 	jp	NZ,_moverArriba
                            393 ;src/main.c:151: }else if (cpct_isKeyPressed(Key_CursorDown)){
   64AE 21 00 04      [10]  394 	ld	hl,#0x0400
   64B1 CD C2 52      [17]  395 	call	_cpct_isKeyPressed
   64B4 7D            [ 4]  396 	ld	a,l
   64B5 B7            [ 4]  397 	or	a, a
                            398 ;src/main.c:152: moverAbajo();
   64B6 C2 39 7A      [10]  399 	jp	NZ,_moverAbajo
                            400 ;src/main.c:153: }else if (cpct_isKeyPressed(Key_Space)){
   64B9 21 05 80      [10]  401 	ld	hl,#0x8005
   64BC CD C2 52      [17]  402 	call	_cpct_isKeyPressed
   64BF 7D            [ 4]  403 	ld	a,l
   64C0 B7            [ 4]  404 	or	a, a
   64C1 C8            [11]  405 	ret	Z
                            406 ;src/main.c:154: lanzarCuchillo(cu, prota, mapa, g_tablatrans);
   64C2 21 08 00      [10]  407 	ld	hl, #8
   64C5 39            [11]  408 	add	hl, sp
   64C6 4E            [ 7]  409 	ld	c, (hl)
   64C7 23            [ 6]  410 	inc	hl
   64C8 46            [ 7]  411 	ld	b, (hl)
   64C9 C5            [11]  412 	push	bc
   64CA 21 08 00      [10]  413 	ld	hl, #8
   64CD 39            [11]  414 	add	hl, sp
   64CE 4E            [ 7]  415 	ld	c, (hl)
   64CF 23            [ 6]  416 	inc	hl
   64D0 46            [ 7]  417 	ld	b, (hl)
   64D1 C5            [11]  418 	push	bc
   64D2 21 08 00      [10]  419 	ld	hl, #8
   64D5 39            [11]  420 	add	hl, sp
   64D6 4E            [ 7]  421 	ld	c, (hl)
   64D7 23            [ 6]  422 	inc	hl
   64D8 46            [ 7]  423 	ld	b, (hl)
   64D9 C5            [11]  424 	push	bc
   64DA 21 08 00      [10]  425 	ld	hl, #8
   64DD 39            [11]  426 	add	hl, sp
   64DE 4E            [ 7]  427 	ld	c, (hl)
   64DF 23            [ 6]  428 	inc	hl
   64E0 46            [ 7]  429 	ld	b, (hl)
   64E1 C5            [11]  430 	push	bc
   64E2 CD 6C 40      [17]  431 	call	_lanzarCuchillo
   64E5 21 08 00      [10]  432 	ld	hl,#8
   64E8 39            [11]  433 	add	hl,sp
   64E9 F9            [ 6]  434 	ld	sp,hl
   64EA C9            [10]  435 	ret
                            436 ;src/main.c:159: u8 checkCollision(u8 direction) { // check optimization
                            437 ;	---------------------------------
                            438 ; Function checkCollision
                            439 ; ---------------------------------
   64EB                     440 _checkCollision::
   64EB DD E5         [15]  441 	push	ix
   64ED DD 21 00 00   [14]  442 	ld	ix,#0
   64F1 DD 39         [15]  443 	add	ix,sp
   64F3 F5            [11]  444 	push	af
                            445 ;src/main.c:160: u8 *headTile=0, *feetTile=0, *waistTile=0;
   64F4 21 00 00      [10]  446 	ld	hl,#0x0000
   64F7 E3            [19]  447 	ex	(sp), hl
   64F8 11 00 00      [10]  448 	ld	de,#0x0000
   64FB 01 00 00      [10]  449 	ld	bc,#0x0000
                            450 ;src/main.c:162: switch (direction) {
   64FE 3E 03         [ 7]  451 	ld	a,#0x03
   6500 DD 96 04      [19]  452 	sub	a, 4 (ix)
   6503 DA 3B 66      [10]  453 	jp	C,00105$
   6506 DD 5E 04      [19]  454 	ld	e,4 (ix)
   6509 16 00         [ 7]  455 	ld	d,#0x00
   650B 21 12 65      [10]  456 	ld	hl,#00124$
   650E 19            [11]  457 	add	hl,de
   650F 19            [11]  458 	add	hl,de
   6510 19            [11]  459 	add	hl,de
   6511 E9            [ 4]  460 	jp	(hl)
   6512                     461 00124$:
   6512 C3 1E 65      [10]  462 	jp	00101$
   6515 C3 73 65      [10]  463 	jp	00102$
   6518 C3 C3 65      [10]  464 	jp	00103$
   651B C3 00 66      [10]  465 	jp	00104$
                            466 ;src/main.c:163: case 0:
   651E                     467 00101$:
                            468 ;src/main.c:164: headTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y);
   651E 21 A5 62      [10]  469 	ld	hl, #(_prota + 0x0001) + 0
   6521 4E            [ 7]  470 	ld	c,(hl)
   6522 3A A4 62      [13]  471 	ld	a, (#_prota + 0)
   6525 C6 07         [ 7]  472 	add	a, #0x07
   6527 47            [ 4]  473 	ld	b,a
   6528 79            [ 4]  474 	ld	a,c
   6529 F5            [11]  475 	push	af
   652A 33            [ 6]  476 	inc	sp
   652B C5            [11]  477 	push	bc
   652C 33            [ 6]  478 	inc	sp
   652D 2A 80 63      [16]  479 	ld	hl,(_mapa)
   6530 E5            [11]  480 	push	hl
   6531 CD D8 49      [17]  481 	call	_getTilePtr
   6534 F1            [10]  482 	pop	af
   6535 F1            [10]  483 	pop	af
   6536 33            [ 6]  484 	inc	sp
   6537 33            [ 6]  485 	inc	sp
   6538 E5            [11]  486 	push	hl
                            487 ;src/main.c:165: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA - 2);
   6539 3A A5 62      [13]  488 	ld	a, (#(_prota + 0x0001) + 0)
   653C C6 14         [ 7]  489 	add	a, #0x14
   653E 4F            [ 4]  490 	ld	c,a
   653F 3A A4 62      [13]  491 	ld	a, (#_prota + 0)
   6542 C6 07         [ 7]  492 	add	a, #0x07
   6544 47            [ 4]  493 	ld	b,a
   6545 79            [ 4]  494 	ld	a,c
   6546 F5            [11]  495 	push	af
   6547 33            [ 6]  496 	inc	sp
   6548 C5            [11]  497 	push	bc
   6549 33            [ 6]  498 	inc	sp
   654A 2A 80 63      [16]  499 	ld	hl,(_mapa)
   654D E5            [11]  500 	push	hl
   654E CD D8 49      [17]  501 	call	_getTilePtr
   6551 F1            [10]  502 	pop	af
   6552 F1            [10]  503 	pop	af
   6553 EB            [ 4]  504 	ex	de,hl
                            505 ;src/main.c:166: waistTile = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA/2);
   6554 3A A5 62      [13]  506 	ld	a, (#(_prota + 0x0001) + 0)
   6557 C6 0B         [ 7]  507 	add	a, #0x0B
   6559 47            [ 4]  508 	ld	b,a
   655A 3A A4 62      [13]  509 	ld	a, (#_prota + 0)
   655D C6 07         [ 7]  510 	add	a, #0x07
   655F D5            [11]  511 	push	de
   6560 C5            [11]  512 	push	bc
   6561 33            [ 6]  513 	inc	sp
   6562 F5            [11]  514 	push	af
   6563 33            [ 6]  515 	inc	sp
   6564 2A 80 63      [16]  516 	ld	hl,(_mapa)
   6567 E5            [11]  517 	push	hl
   6568 CD D8 49      [17]  518 	call	_getTilePtr
   656B F1            [10]  519 	pop	af
   656C F1            [10]  520 	pop	af
   656D 4D            [ 4]  521 	ld	c,l
   656E 44            [ 4]  522 	ld	b,h
   656F D1            [10]  523 	pop	de
                            524 ;src/main.c:167: break;
   6570 C3 3B 66      [10]  525 	jp	00105$
                            526 ;src/main.c:168: case 1:
   6573                     527 00102$:
                            528 ;src/main.c:169: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
   6573 21 A5 62      [10]  529 	ld	hl, #(_prota + 0x0001) + 0
   6576 56            [ 7]  530 	ld	d,(hl)
   6577 21 A4 62      [10]  531 	ld	hl, #_prota + 0
   657A 46            [ 7]  532 	ld	b,(hl)
   657B 05            [ 4]  533 	dec	b
   657C D5            [11]  534 	push	de
   657D 33            [ 6]  535 	inc	sp
   657E C5            [11]  536 	push	bc
   657F 33            [ 6]  537 	inc	sp
   6580 2A 80 63      [16]  538 	ld	hl,(_mapa)
   6583 E5            [11]  539 	push	hl
   6584 CD D8 49      [17]  540 	call	_getTilePtr
   6587 F1            [10]  541 	pop	af
   6588 F1            [10]  542 	pop	af
   6589 33            [ 6]  543 	inc	sp
   658A 33            [ 6]  544 	inc	sp
   658B E5            [11]  545 	push	hl
                            546 ;src/main.c:170: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
   658C 3A A5 62      [13]  547 	ld	a, (#(_prota + 0x0001) + 0)
   658F C6 14         [ 7]  548 	add	a, #0x14
   6591 57            [ 4]  549 	ld	d,a
   6592 21 A4 62      [10]  550 	ld	hl, #_prota + 0
   6595 46            [ 7]  551 	ld	b,(hl)
   6596 05            [ 4]  552 	dec	b
   6597 D5            [11]  553 	push	de
   6598 33            [ 6]  554 	inc	sp
   6599 C5            [11]  555 	push	bc
   659A 33            [ 6]  556 	inc	sp
   659B 2A 80 63      [16]  557 	ld	hl,(_mapa)
   659E E5            [11]  558 	push	hl
   659F CD D8 49      [17]  559 	call	_getTilePtr
   65A2 F1            [10]  560 	pop	af
   65A3 F1            [10]  561 	pop	af
   65A4 EB            [ 4]  562 	ex	de,hl
                            563 ;src/main.c:171: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
   65A5 3A A5 62      [13]  564 	ld	a, (#(_prota + 0x0001) + 0)
   65A8 C6 0B         [ 7]  565 	add	a, #0x0B
   65AA 47            [ 4]  566 	ld	b,a
   65AB 3A A4 62      [13]  567 	ld	a, (#_prota + 0)
   65AE C6 FF         [ 7]  568 	add	a,#0xFF
   65B0 D5            [11]  569 	push	de
   65B1 C5            [11]  570 	push	bc
   65B2 33            [ 6]  571 	inc	sp
   65B3 F5            [11]  572 	push	af
   65B4 33            [ 6]  573 	inc	sp
   65B5 2A 80 63      [16]  574 	ld	hl,(_mapa)
   65B8 E5            [11]  575 	push	hl
   65B9 CD D8 49      [17]  576 	call	_getTilePtr
   65BC F1            [10]  577 	pop	af
   65BD F1            [10]  578 	pop	af
   65BE 4D            [ 4]  579 	ld	c,l
   65BF 44            [ 4]  580 	ld	b,h
   65C0 D1            [10]  581 	pop	de
                            582 ;src/main.c:172: break;
   65C1 18 78         [12]  583 	jr	00105$
                            584 ;src/main.c:173: case 2:
   65C3                     585 00103$:
                            586 ;src/main.c:174: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
   65C3 3A A5 62      [13]  587 	ld	a, (#(_prota + 0x0001) + 0)
   65C6 C6 FE         [ 7]  588 	add	a,#0xFE
   65C8 21 A4 62      [10]  589 	ld	hl, #_prota + 0
   65CB 56            [ 7]  590 	ld	d,(hl)
   65CC C5            [11]  591 	push	bc
   65CD F5            [11]  592 	push	af
   65CE 33            [ 6]  593 	inc	sp
   65CF D5            [11]  594 	push	de
   65D0 33            [ 6]  595 	inc	sp
   65D1 2A 80 63      [16]  596 	ld	hl,(_mapa)
   65D4 E5            [11]  597 	push	hl
   65D5 CD D8 49      [17]  598 	call	_getTilePtr
   65D8 F1            [10]  599 	pop	af
   65D9 F1            [10]  600 	pop	af
   65DA C1            [10]  601 	pop	bc
   65DB 33            [ 6]  602 	inc	sp
   65DC 33            [ 6]  603 	inc	sp
   65DD E5            [11]  604 	push	hl
                            605 ;src/main.c:175: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
   65DE 21 A5 62      [10]  606 	ld	hl, #(_prota + 0x0001) + 0
   65E1 56            [ 7]  607 	ld	d,(hl)
   65E2 15            [ 4]  608 	dec	d
   65E3 15            [ 4]  609 	dec	d
   65E4 3A A4 62      [13]  610 	ld	a, (#_prota + 0)
   65E7 C6 03         [ 7]  611 	add	a, #0x03
   65E9 C5            [11]  612 	push	bc
   65EA D5            [11]  613 	push	de
   65EB 33            [ 6]  614 	inc	sp
   65EC F5            [11]  615 	push	af
   65ED 33            [ 6]  616 	inc	sp
   65EE 2A 80 63      [16]  617 	ld	hl,(_mapa)
   65F1 E5            [11]  618 	push	hl
   65F2 CD D8 49      [17]  619 	call	_getTilePtr
   65F5 F1            [10]  620 	pop	af
   65F6 F1            [10]  621 	pop	af
   65F7 EB            [ 4]  622 	ex	de,hl
   65F8 C1            [10]  623 	pop	bc
                            624 ;src/main.c:176: *waistTile = 0;
   65F9 21 00 00      [10]  625 	ld	hl,#0x0000
   65FC 36 00         [10]  626 	ld	(hl),#0x00
                            627 ;src/main.c:177: break;
   65FE 18 3B         [12]  628 	jr	00105$
                            629 ;src/main.c:178: case 3:
   6600                     630 00104$:
                            631 ;src/main.c:179: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
   6600 3A A5 62      [13]  632 	ld	a, (#(_prota + 0x0001) + 0)
   6603 C6 16         [ 7]  633 	add	a, #0x16
   6605 21 A4 62      [10]  634 	ld	hl, #_prota + 0
   6608 56            [ 7]  635 	ld	d,(hl)
   6609 C5            [11]  636 	push	bc
   660A F5            [11]  637 	push	af
   660B 33            [ 6]  638 	inc	sp
   660C D5            [11]  639 	push	de
   660D 33            [ 6]  640 	inc	sp
   660E 2A 80 63      [16]  641 	ld	hl,(_mapa)
   6611 E5            [11]  642 	push	hl
   6612 CD D8 49      [17]  643 	call	_getTilePtr
   6615 F1            [10]  644 	pop	af
   6616 F1            [10]  645 	pop	af
   6617 C1            [10]  646 	pop	bc
   6618 33            [ 6]  647 	inc	sp
   6619 33            [ 6]  648 	inc	sp
   661A E5            [11]  649 	push	hl
                            650 ;src/main.c:180: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   661B 3A A5 62      [13]  651 	ld	a, (#(_prota + 0x0001) + 0)
   661E C6 16         [ 7]  652 	add	a, #0x16
   6620 57            [ 4]  653 	ld	d,a
   6621 3A A4 62      [13]  654 	ld	a, (#_prota + 0)
   6624 C6 03         [ 7]  655 	add	a, #0x03
   6626 C5            [11]  656 	push	bc
   6627 D5            [11]  657 	push	de
   6628 33            [ 6]  658 	inc	sp
   6629 F5            [11]  659 	push	af
   662A 33            [ 6]  660 	inc	sp
   662B 2A 80 63      [16]  661 	ld	hl,(_mapa)
   662E E5            [11]  662 	push	hl
   662F CD D8 49      [17]  663 	call	_getTilePtr
   6632 F1            [10]  664 	pop	af
   6633 F1            [10]  665 	pop	af
   6634 EB            [ 4]  666 	ex	de,hl
   6635 C1            [10]  667 	pop	bc
                            668 ;src/main.c:181: *waistTile = 0;
   6636 21 00 00      [10]  669 	ld	hl,#0x0000
   6639 36 00         [10]  670 	ld	(hl),#0x00
                            671 ;src/main.c:183: }
   663B                     672 00105$:
                            673 ;src/main.c:185: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   663B E1            [10]  674 	pop	hl
   663C E5            [11]  675 	push	hl
   663D 6E            [ 7]  676 	ld	l,(hl)
   663E 3E 02         [ 7]  677 	ld	a,#0x02
   6640 95            [ 4]  678 	sub	a, l
   6641 38 0E         [12]  679 	jr	C,00106$
   6643 1A            [ 7]  680 	ld	a,(de)
   6644 5F            [ 4]  681 	ld	e,a
   6645 3E 02         [ 7]  682 	ld	a,#0x02
   6647 93            [ 4]  683 	sub	a, e
   6648 38 07         [12]  684 	jr	C,00106$
   664A 0A            [ 7]  685 	ld	a,(bc)
   664B 4F            [ 4]  686 	ld	c,a
   664C 3E 02         [ 7]  687 	ld	a,#0x02
   664E 91            [ 4]  688 	sub	a, c
   664F 30 04         [12]  689 	jr	NC,00107$
   6651                     690 00106$:
                            691 ;src/main.c:186: return 1;
   6651 2E 01         [ 7]  692 	ld	l,#0x01
   6653 18 02         [12]  693 	jr	00110$
   6655                     694 00107$:
                            695 ;src/main.c:188: return 0;
   6655 2E 00         [ 7]  696 	ld	l,#0x00
   6657                     697 00110$:
   6657 DD F9         [10]  698 	ld	sp, ix
   6659 DD E1         [14]  699 	pop	ix
   665B C9            [10]  700 	ret
                            701 ;src/main.c:191: void dibujarEnemigo(TEnemy *enemy) {
                            702 ;	---------------------------------
                            703 ; Function dibujarEnemigo
                            704 ; ---------------------------------
   665C                     705 _dibujarEnemigo::
   665C DD E5         [15]  706 	push	ix
   665E DD 21 00 00   [14]  707 	ld	ix,#0
   6662 DD 39         [15]  708 	add	ix,sp
                            709 ;src/main.c:192: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   6664 DD 4E 04      [19]  710 	ld	c,4 (ix)
   6667 DD 46 05      [19]  711 	ld	b,5 (ix)
   666A 69            [ 4]  712 	ld	l, c
   666B 60            [ 4]  713 	ld	h, b
   666C 23            [ 6]  714 	inc	hl
   666D 56            [ 7]  715 	ld	d,(hl)
   666E 0A            [ 7]  716 	ld	a,(bc)
   666F C5            [11]  717 	push	bc
   6670 D5            [11]  718 	push	de
   6671 33            [ 6]  719 	inc	sp
   6672 F5            [11]  720 	push	af
   6673 33            [ 6]  721 	inc	sp
   6674 21 00 C0      [10]  722 	ld	hl,#0xC000
   6677 E5            [11]  723 	push	hl
   6678 CD C1 5E      [17]  724 	call	_cpct_getScreenPtr
   667B EB            [ 4]  725 	ex	de,hl
                            726 ;src/main.c:193: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   667C E1            [10]  727 	pop	hl
   667D 01 04 00      [10]  728 	ld	bc, #0x0004
   6680 09            [11]  729 	add	hl, bc
   6681 4E            [ 7]  730 	ld	c,(hl)
   6682 23            [ 6]  731 	inc	hl
   6683 46            [ 7]  732 	ld	b,(hl)
   6684 21 00 01      [10]  733 	ld	hl,#_g_tablatrans
   6687 E5            [11]  734 	push	hl
   6688 21 04 16      [10]  735 	ld	hl,#0x1604
   668B E5            [11]  736 	push	hl
   668C D5            [11]  737 	push	de
   668D C5            [11]  738 	push	bc
   668E CD E1 5E      [17]  739 	call	_cpct_drawSpriteMaskedAlignedTable
   6691 DD E1         [14]  740 	pop	ix
   6693 C9            [10]  741 	ret
                            742 ;src/main.c:196: void dibujarExplosion(TEnemy *enemy) {
                            743 ;	---------------------------------
                            744 ; Function dibujarExplosion
                            745 ; ---------------------------------
   6694                     746 _dibujarExplosion::
   6694 DD E5         [15]  747 	push	ix
   6696 DD 21 00 00   [14]  748 	ld	ix,#0
   669A DD 39         [15]  749 	add	ix,sp
                            750 ;src/main.c:197: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   669C DD 4E 04      [19]  751 	ld	c,4 (ix)
   669F DD 46 05      [19]  752 	ld	b,5 (ix)
   66A2 69            [ 4]  753 	ld	l, c
   66A3 60            [ 4]  754 	ld	h, b
   66A4 23            [ 6]  755 	inc	hl
   66A5 56            [ 7]  756 	ld	d,(hl)
   66A6 0A            [ 7]  757 	ld	a,(bc)
   66A7 47            [ 4]  758 	ld	b,a
   66A8 D5            [11]  759 	push	de
   66A9 33            [ 6]  760 	inc	sp
   66AA C5            [11]  761 	push	bc
   66AB 33            [ 6]  762 	inc	sp
   66AC 21 00 C0      [10]  763 	ld	hl,#0xC000
   66AF E5            [11]  764 	push	hl
   66B0 CD C1 5E      [17]  765 	call	_cpct_getScreenPtr
   66B3 4D            [ 4]  766 	ld	c,l
   66B4 44            [ 4]  767 	ld	b,h
                            768 ;src/main.c:198: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   66B5 11 00 01      [10]  769 	ld	de,#_g_tablatrans+0
   66B8 D5            [11]  770 	push	de
   66B9 21 04 16      [10]  771 	ld	hl,#0x1604
   66BC E5            [11]  772 	push	hl
   66BD C5            [11]  773 	push	bc
   66BE 21 70 19      [10]  774 	ld	hl,#_g_explosion
   66C1 E5            [11]  775 	push	hl
   66C2 CD E1 5E      [17]  776 	call	_cpct_drawSpriteMaskedAlignedTable
   66C5 DD E1         [14]  777 	pop	ix
   66C7 C9            [10]  778 	ret
                            779 ;src/main.c:201: void borrarExplosion(TEnemy *enemy) {
                            780 ;	---------------------------------
                            781 ; Function borrarExplosion
                            782 ; ---------------------------------
   66C8                     783 _borrarExplosion::
   66C8 DD E5         [15]  784 	push	ix
   66CA DD 21 00 00   [14]  785 	ld	ix,#0
   66CE DD 39         [15]  786 	add	ix,sp
   66D0 F5            [11]  787 	push	af
   66D1 3B            [ 6]  788 	dec	sp
                            789 ;src/main.c:204: u8 w = 4 + (enemy->px & 1);
   66D2 DD 5E 04      [19]  790 	ld	e,4 (ix)
   66D5 DD 56 05      [19]  791 	ld	d,5 (ix)
   66D8 6B            [ 4]  792 	ld	l, e
   66D9 62            [ 4]  793 	ld	h, d
   66DA 23            [ 6]  794 	inc	hl
   66DB 23            [ 6]  795 	inc	hl
   66DC 4E            [ 7]  796 	ld	c,(hl)
   66DD 79            [ 4]  797 	ld	a,c
   66DE E6 01         [ 7]  798 	and	a, #0x01
   66E0 47            [ 4]  799 	ld	b,a
   66E1 04            [ 4]  800 	inc	b
   66E2 04            [ 4]  801 	inc	b
   66E3 04            [ 4]  802 	inc	b
   66E4 04            [ 4]  803 	inc	b
                            804 ;src/main.c:207: u8 h = 6 + (enemy->py & 2 ? 1 : 0);
   66E5 EB            [ 4]  805 	ex	de,hl
   66E6 23            [ 6]  806 	inc	hl
   66E7 23            [ 6]  807 	inc	hl
   66E8 23            [ 6]  808 	inc	hl
   66E9 5E            [ 7]  809 	ld	e,(hl)
   66EA CB 4B         [ 8]  810 	bit	1, e
   66EC 28 04         [12]  811 	jr	Z,00103$
   66EE 3E 01         [ 7]  812 	ld	a,#0x01
   66F0 18 02         [12]  813 	jr	00104$
   66F2                     814 00103$:
   66F2 3E 00         [ 7]  815 	ld	a,#0x00
   66F4                     816 00104$:
   66F4 C6 06         [ 7]  817 	add	a, #0x06
   66F6 DD 77 FD      [19]  818 	ld	-3 (ix),a
                            819 ;src/main.c:209: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   66F9 FD 2A 80 63   [20]  820 	ld	iy,(_mapa)
   66FD 16 00         [ 7]  821 	ld	d,#0x00
   66FF 7B            [ 4]  822 	ld	a,e
   6700 C6 E8         [ 7]  823 	add	a,#0xE8
   6702 DD 77 FE      [19]  824 	ld	-2 (ix),a
   6705 7A            [ 4]  825 	ld	a,d
   6706 CE FF         [ 7]  826 	adc	a,#0xFF
   6708 DD 77 FF      [19]  827 	ld	-1 (ix),a
   670B DD 6E FE      [19]  828 	ld	l,-2 (ix)
   670E DD 66 FF      [19]  829 	ld	h,-1 (ix)
   6711 DD CB FF 7E   [20]  830 	bit	7, -1 (ix)
   6715 28 04         [12]  831 	jr	Z,00105$
   6717 21 EB FF      [10]  832 	ld	hl,#0xFFEB
   671A 19            [11]  833 	add	hl,de
   671B                     834 00105$:
   671B CB 2C         [ 8]  835 	sra	h
   671D CB 1D         [ 8]  836 	rr	l
   671F CB 2C         [ 8]  837 	sra	h
   6721 CB 1D         [ 8]  838 	rr	l
   6723 55            [ 4]  839 	ld	d,l
   6724 CB 39         [ 8]  840 	srl	c
   6726 FD E5         [15]  841 	push	iy
   6728 21 F0 C0      [10]  842 	ld	hl,#0xC0F0
   672B E5            [11]  843 	push	hl
   672C 3E 28         [ 7]  844 	ld	a,#0x28
   672E F5            [11]  845 	push	af
   672F 33            [ 6]  846 	inc	sp
   6730 DD 7E FD      [19]  847 	ld	a,-3 (ix)
   6733 F5            [11]  848 	push	af
   6734 33            [ 6]  849 	inc	sp
   6735 C5            [11]  850 	push	bc
   6736 33            [ 6]  851 	inc	sp
   6737 D5            [11]  852 	push	de
   6738 33            [ 6]  853 	inc	sp
   6739 79            [ 4]  854 	ld	a,c
   673A F5            [11]  855 	push	af
   673B 33            [ 6]  856 	inc	sp
   673C CD A3 53      [17]  857 	call	_cpct_etm_drawTileBox2x4
   673F DD F9         [10]  858 	ld	sp, ix
   6741 DD E1         [14]  859 	pop	ix
   6743 C9            [10]  860 	ret
                            861 ;src/main.c:213: void borrarEnemigo(u8 x, u8 y) {
                            862 ;	---------------------------------
                            863 ; Function borrarEnemigo
                            864 ; ---------------------------------
   6744                     865 _borrarEnemigo::
   6744 DD E5         [15]  866 	push	ix
   6746 DD 21 00 00   [14]  867 	ld	ix,#0
   674A DD 39         [15]  868 	add	ix,sp
   674C F5            [11]  869 	push	af
   674D F5            [11]  870 	push	af
                            871 ;src/main.c:217: u8 w = 4 + (x & 1);
   674E DD 7E 04      [19]  872 	ld	a,4 (ix)
   6751 E6 01         [ 7]  873 	and	a, #0x01
   6753 5F            [ 4]  874 	ld	e,a
   6754 1C            [ 4]  875 	inc	e
   6755 1C            [ 4]  876 	inc	e
   6756 1C            [ 4]  877 	inc	e
   6757 1C            [ 4]  878 	inc	e
                            879 ;src/main.c:220: u8 h = 6 + (y & 3 ? 1 : 0);
   6758 DD 7E 05      [19]  880 	ld	a,5 (ix)
   675B E6 03         [ 7]  881 	and	a, #0x03
   675D 28 04         [12]  882 	jr	Z,00103$
   675F 3E 01         [ 7]  883 	ld	a,#0x01
   6761 18 02         [12]  884 	jr	00104$
   6763                     885 00103$:
   6763 3E 00         [ 7]  886 	ld	a,#0x00
   6765                     887 00104$:
   6765 C6 06         [ 7]  888 	add	a, #0x06
   6767 57            [ 4]  889 	ld	d,a
                            890 ;src/main.c:222: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   6768 2A 80 63      [16]  891 	ld	hl,(_mapa)
   676B E3            [19]  892 	ex	(sp), hl
   676C DD 4E 05      [19]  893 	ld	c,5 (ix)
   676F 06 00         [ 7]  894 	ld	b,#0x00
   6771 79            [ 4]  895 	ld	a,c
   6772 C6 E8         [ 7]  896 	add	a,#0xE8
   6774 DD 77 FE      [19]  897 	ld	-2 (ix),a
   6777 78            [ 4]  898 	ld	a,b
   6778 CE FF         [ 7]  899 	adc	a,#0xFF
   677A DD 77 FF      [19]  900 	ld	-1 (ix),a
   677D DD 6E FE      [19]  901 	ld	l,-2 (ix)
   6780 DD 66 FF      [19]  902 	ld	h,-1 (ix)
   6783 DD CB FF 7E   [20]  903 	bit	7, -1 (ix)
   6787 28 04         [12]  904 	jr	Z,00105$
   6789 21 EB FF      [10]  905 	ld	hl,#0xFFEB
   678C 09            [11]  906 	add	hl,bc
   678D                     907 00105$:
   678D CB 2C         [ 8]  908 	sra	h
   678F CB 1D         [ 8]  909 	rr	l
   6791 CB 2C         [ 8]  910 	sra	h
   6793 CB 1D         [ 8]  911 	rr	l
   6795 45            [ 4]  912 	ld	b,l
   6796 DD 4E 04      [19]  913 	ld	c,4 (ix)
   6799 CB 39         [ 8]  914 	srl	c
   679B E1            [10]  915 	pop	hl
   679C E5            [11]  916 	push	hl
   679D E5            [11]  917 	push	hl
   679E 21 F0 C0      [10]  918 	ld	hl,#0xC0F0
   67A1 E5            [11]  919 	push	hl
   67A2 3E 28         [ 7]  920 	ld	a,#0x28
   67A4 F5            [11]  921 	push	af
   67A5 33            [ 6]  922 	inc	sp
   67A6 D5            [11]  923 	push	de
   67A7 C5            [11]  924 	push	bc
   67A8 CD A3 53      [17]  925 	call	_cpct_etm_drawTileBox2x4
                            926 ;src/main.c:224: enemy->mover = NO;
   67AB 21 22 5F      [10]  927 	ld	hl,#(_enemy + 0x0006)
   67AE 36 00         [10]  928 	ld	(hl),#0x00
   67B0 DD F9         [10]  929 	ld	sp, ix
   67B2 DD E1         [14]  930 	pop	ix
   67B4 C9            [10]  931 	ret
                            932 ;src/main.c:227: void redibujarEnemigo(u8 x, u8 y, TEnemy *enemy) {
                            933 ;	---------------------------------
                            934 ; Function redibujarEnemigo
                            935 ; ---------------------------------
   67B5                     936 _redibujarEnemigo::
   67B5 DD E5         [15]  937 	push	ix
   67B7 DD 21 00 00   [14]  938 	ld	ix,#0
   67BB DD 39         [15]  939 	add	ix,sp
                            940 ;src/main.c:228: borrarEnemigo(x, y);
   67BD DD 66 05      [19]  941 	ld	h,5 (ix)
   67C0 DD 6E 04      [19]  942 	ld	l,4 (ix)
   67C3 E5            [11]  943 	push	hl
   67C4 CD 44 67      [17]  944 	call	_borrarEnemigo
   67C7 F1            [10]  945 	pop	af
                            946 ;src/main.c:229: enemy->px = enemy->x;
   67C8 DD 4E 06      [19]  947 	ld	c,6 (ix)
   67CB DD 46 07      [19]  948 	ld	b,7 (ix)
   67CE 59            [ 4]  949 	ld	e, c
   67CF 50            [ 4]  950 	ld	d, b
   67D0 13            [ 6]  951 	inc	de
   67D1 13            [ 6]  952 	inc	de
   67D2 0A            [ 7]  953 	ld	a,(bc)
   67D3 12            [ 7]  954 	ld	(de),a
                            955 ;src/main.c:230: enemy->py = enemy->y;
   67D4 59            [ 4]  956 	ld	e, c
   67D5 50            [ 4]  957 	ld	d, b
   67D6 13            [ 6]  958 	inc	de
   67D7 13            [ 6]  959 	inc	de
   67D8 13            [ 6]  960 	inc	de
   67D9 69            [ 4]  961 	ld	l, c
   67DA 60            [ 4]  962 	ld	h, b
   67DB 23            [ 6]  963 	inc	hl
   67DC 7E            [ 7]  964 	ld	a,(hl)
   67DD 12            [ 7]  965 	ld	(de),a
                            966 ;src/main.c:231: dibujarEnemigo(enemy);
   67DE C5            [11]  967 	push	bc
   67DF CD 5C 66      [17]  968 	call	_dibujarEnemigo
   67E2 F1            [10]  969 	pop	af
   67E3 DD E1         [14]  970 	pop	ix
   67E5 C9            [10]  971 	ret
                            972 ;src/main.c:234: u8 checkEnemyCollision(u8 direction, TEnemy *enemy){
                            973 ;	---------------------------------
                            974 ; Function checkEnemyCollision
                            975 ; ---------------------------------
   67E6                     976 _checkEnemyCollision::
   67E6 DD E5         [15]  977 	push	ix
   67E8 DD 21 00 00   [14]  978 	ld	ix,#0
   67EC DD 39         [15]  979 	add	ix,sp
   67EE 21 F7 FF      [10]  980 	ld	hl,#-9
   67F1 39            [11]  981 	add	hl,sp
   67F2 F9            [ 6]  982 	ld	sp,hl
                            983 ;src/main.c:236: u8 colisiona = 1;
   67F3 DD 36 F7 01   [19]  984 	ld	-9 (ix),#0x01
                            985 ;src/main.c:238: switch (direction) {
   67F7 3E 03         [ 7]  986 	ld	a,#0x03
   67F9 DD 96 04      [19]  987 	sub	a, 4 (ix)
   67FC DA D9 6B      [10]  988 	jp	C,00165$
                            989 ;src/main.c:240: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   67FF DD 4E 05      [19]  990 	ld	c,5 (ix)
   6802 DD 46 06      [19]  991 	ld	b,6 (ix)
   6805 0A            [ 7]  992 	ld	a,(bc)
   6806 5F            [ 4]  993 	ld	e,a
   6807 21 01 00      [10]  994 	ld	hl,#0x0001
   680A 09            [11]  995 	add	hl,bc
   680B DD 75 F8      [19]  996 	ld	-8 (ix),l
   680E DD 74 F9      [19]  997 	ld	-7 (ix),h
   6811 DD 6E F8      [19]  998 	ld	l,-8 (ix)
   6814 DD 66 F9      [19]  999 	ld	h,-7 (ix)
   6817 56            [ 7] 1000 	ld	d,(hl)
                           1001 ;src/main.c:253: enemy->muerto = SI;
   6818 21 08 00      [10] 1002 	ld	hl,#0x0008
   681B 09            [11] 1003 	add	hl,bc
   681C DD 75 FA      [19] 1004 	ld	-6 (ix),l
   681F DD 74 FB      [19] 1005 	ld	-5 (ix),h
                           1006 ;src/main.c:260: enemy->mira = M_izquierda;
   6822 21 07 00      [10] 1007 	ld	hl,#0x0007
   6825 09            [11] 1008 	add	hl,bc
   6826 DD 75 FC      [19] 1009 	ld	-4 (ix),l
   6829 DD 74 FD      [19] 1010 	ld	-3 (ix),h
                           1011 ;src/main.c:238: switch (direction) {
   682C D5            [11] 1012 	push	de
   682D DD 5E 04      [19] 1013 	ld	e,4 (ix)
   6830 16 00         [ 7] 1014 	ld	d,#0x00
   6832 21 3A 68      [10] 1015 	ld	hl,#00268$
   6835 19            [11] 1016 	add	hl,de
   6836 19            [11] 1017 	add	hl,de
   6837 19            [11] 1018 	add	hl,de
   6838 D1            [10] 1019 	pop	de
   6839 E9            [ 4] 1020 	jp	(hl)
   683A                    1021 00268$:
   683A C3 46 68      [10] 1022 	jp	00101$
   683D C3 2E 69      [10] 1023 	jp	00117$
   6840 C3 12 6A      [10] 1024 	jp	00133$
   6843 C3 F0 6A      [10] 1025 	jp	00149$
                           1026 ;src/main.c:239: case 0:
   6846                    1027 00101$:
                           1028 ;src/main.c:240: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   6846 7B            [ 4] 1029 	ld	a,e
   6847 C6 05         [ 7] 1030 	add	a, #0x05
   6849 C5            [11] 1031 	push	bc
   684A D5            [11] 1032 	push	de
   684B 33            [ 6] 1033 	inc	sp
   684C F5            [11] 1034 	push	af
   684D 33            [ 6] 1035 	inc	sp
   684E 2A 80 63      [16] 1036 	ld	hl,(_mapa)
   6851 E5            [11] 1037 	push	hl
   6852 CD D8 49      [17] 1038 	call	_getTilePtr
   6855 F1            [10] 1039 	pop	af
   6856 F1            [10] 1040 	pop	af
   6857 C1            [10] 1041 	pop	bc
   6858 5E            [ 7] 1042 	ld	e,(hl)
   6859 3E 02         [ 7] 1043 	ld	a,#0x02
   685B 93            [ 4] 1044 	sub	a, e
   685C DA 23 69      [10] 1045 	jp	C,00113$
                           1046 ;src/main.c:241: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   685F DD 6E F8      [19] 1047 	ld	l,-8 (ix)
   6862 DD 66 F9      [19] 1048 	ld	h,-7 (ix)
   6865 7E            [ 7] 1049 	ld	a,(hl)
   6866 C6 0B         [ 7] 1050 	add	a, #0x0B
   6868 57            [ 4] 1051 	ld	d,a
   6869 0A            [ 7] 1052 	ld	a,(bc)
   686A C6 05         [ 7] 1053 	add	a, #0x05
   686C C5            [11] 1054 	push	bc
   686D D5            [11] 1055 	push	de
   686E 33            [ 6] 1056 	inc	sp
   686F F5            [11] 1057 	push	af
   6870 33            [ 6] 1058 	inc	sp
   6871 2A 80 63      [16] 1059 	ld	hl,(_mapa)
   6874 E5            [11] 1060 	push	hl
   6875 CD D8 49      [17] 1061 	call	_getTilePtr
   6878 F1            [10] 1062 	pop	af
   6879 F1            [10] 1063 	pop	af
   687A C1            [10] 1064 	pop	bc
   687B 5E            [ 7] 1065 	ld	e,(hl)
   687C 3E 02         [ 7] 1066 	ld	a,#0x02
   687E 93            [ 4] 1067 	sub	a, e
   687F DA 23 69      [10] 1068 	jp	C,00113$
                           1069 ;src/main.c:242: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   6882 DD 6E F8      [19] 1070 	ld	l,-8 (ix)
   6885 DD 66 F9      [19] 1071 	ld	h,-7 (ix)
   6888 7E            [ 7] 1072 	ld	a,(hl)
   6889 C6 16         [ 7] 1073 	add	a, #0x16
   688B 57            [ 4] 1074 	ld	d,a
   688C 0A            [ 7] 1075 	ld	a,(bc)
   688D C6 05         [ 7] 1076 	add	a, #0x05
   688F C5            [11] 1077 	push	bc
   6890 D5            [11] 1078 	push	de
   6891 33            [ 6] 1079 	inc	sp
   6892 F5            [11] 1080 	push	af
   6893 33            [ 6] 1081 	inc	sp
   6894 2A 80 63      [16] 1082 	ld	hl,(_mapa)
   6897 E5            [11] 1083 	push	hl
   6898 CD D8 49      [17] 1084 	call	_getTilePtr
   689B F1            [10] 1085 	pop	af
   689C F1            [10] 1086 	pop	af
   689D C1            [10] 1087 	pop	bc
   689E 5E            [ 7] 1088 	ld	e,(hl)
   689F 3E 02         [ 7] 1089 	ld	a,#0x02
   68A1 93            [ 4] 1090 	sub	a, e
   68A2 DA 23 69      [10] 1091 	jp	C,00113$
                           1092 ;src/main.c:244: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   68A5 21 AD 62      [10] 1093 	ld	hl, #_cu + 1
   68A8 5E            [ 7] 1094 	ld	e,(hl)
   68A9 16 00         [ 7] 1095 	ld	d,#0x00
   68AB 21 04 00      [10] 1096 	ld	hl,#0x0004
   68AE 19            [11] 1097 	add	hl,de
   68AF DD 75 FE      [19] 1098 	ld	-2 (ix),l
   68B2 DD 74 FF      [19] 1099 	ld	-1 (ix),h
   68B5 DD 6E F8      [19] 1100 	ld	l,-8 (ix)
   68B8 DD 66 F9      [19] 1101 	ld	h,-7 (ix)
   68BB 6E            [ 7] 1102 	ld	l,(hl)
   68BC 26 00         [ 7] 1103 	ld	h,#0x00
   68BE DD 7E FE      [19] 1104 	ld	a,-2 (ix)
   68C1 95            [ 4] 1105 	sub	a, l
   68C2 DD 7E FF      [19] 1106 	ld	a,-1 (ix)
   68C5 9C            [ 4] 1107 	sbc	a, h
   68C6 E2 CB 68      [10] 1108 	jp	PO, 00269$
   68C9 EE 80         [ 7] 1109 	xor	a, #0x80
   68CB                    1110 00269$:
   68CB FA E0 68      [10] 1111 	jp	M,00108$
   68CE D5            [11] 1112 	push	de
   68CF 11 16 00      [10] 1113 	ld	de,#0x0016
   68D2 19            [11] 1114 	add	hl, de
   68D3 D1            [10] 1115 	pop	de
   68D4 7D            [ 4] 1116 	ld	a,l
   68D5 93            [ 4] 1117 	sub	a, e
   68D6 7C            [ 4] 1118 	ld	a,h
   68D7 9A            [ 4] 1119 	sbc	a, d
   68D8 E2 DD 68      [10] 1120 	jp	PO, 00270$
   68DB EE 80         [ 7] 1121 	xor	a, #0x80
   68DD                    1122 00270$:
   68DD F2 E7 68      [10] 1123 	jp	P,00109$
   68E0                    1124 00108$:
                           1125 ;src/main.c:245: colisiona = 0;
   68E0 DD 36 F7 00   [19] 1126 	ld	-9 (ix),#0x00
   68E4 C3 D9 6B      [10] 1127 	jp	00165$
   68E7                    1128 00109$:
                           1129 ;src/main.c:248: if(cu.x > enemy->x){ //si el cu esta abajo
   68E7 21 AC 62      [10] 1130 	ld	hl, #_cu + 0
   68EA 5E            [ 7] 1131 	ld	e,(hl)
   68EB 0A            [ 7] 1132 	ld	a,(bc)
   68EC 4F            [ 4] 1133 	ld	c,a
   68ED 93            [ 4] 1134 	sub	a, e
   68EE 30 2C         [12] 1135 	jr	NC,00106$
                           1136 ;src/main.c:249: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
   68F0 6B            [ 4] 1137 	ld	l,e
   68F1 26 00         [ 7] 1138 	ld	h,#0x00
   68F3 06 00         [ 7] 1139 	ld	b,#0x00
   68F5 03            [ 6] 1140 	inc	bc
   68F6 03            [ 6] 1141 	inc	bc
   68F7 03            [ 6] 1142 	inc	bc
   68F8 03            [ 6] 1143 	inc	bc
   68F9 BF            [ 4] 1144 	cp	a, a
   68FA ED 42         [15] 1145 	sbc	hl, bc
   68FC 3E 01         [ 7] 1146 	ld	a,#0x01
   68FE BD            [ 4] 1147 	cp	a, l
   68FF 3E 00         [ 7] 1148 	ld	a,#0x00
   6901 9C            [ 4] 1149 	sbc	a, h
   6902 E2 07 69      [10] 1150 	jp	PO, 00271$
   6905 EE 80         [ 7] 1151 	xor	a, #0x80
   6907                    1152 00271$:
   6907 F2 11 69      [10] 1153 	jp	P,00103$
                           1154 ;src/main.c:250: colisiona = 0;
   690A DD 36 F7 00   [19] 1155 	ld	-9 (ix),#0x00
   690E C3 D9 6B      [10] 1156 	jp	00165$
   6911                    1157 00103$:
                           1158 ;src/main.c:253: enemy->muerto = SI;
   6911 DD 6E FA      [19] 1159 	ld	l,-6 (ix)
   6914 DD 66 FB      [19] 1160 	ld	h,-5 (ix)
   6917 36 01         [10] 1161 	ld	(hl),#0x01
   6919 C3 D9 6B      [10] 1162 	jp	00165$
   691C                    1163 00106$:
                           1164 ;src/main.c:256: colisiona = 0;
   691C DD 36 F7 00   [19] 1165 	ld	-9 (ix),#0x00
   6920 C3 D9 6B      [10] 1166 	jp	00165$
   6923                    1167 00113$:
                           1168 ;src/main.c:260: enemy->mira = M_izquierda;
   6923 DD 6E FC      [19] 1169 	ld	l,-4 (ix)
   6926 DD 66 FD      [19] 1170 	ld	h,-3 (ix)
   6929 36 01         [10] 1171 	ld	(hl),#0x01
                           1172 ;src/main.c:262: break;
   692B C3 D9 6B      [10] 1173 	jp	00165$
                           1174 ;src/main.c:263: case 1:
   692E                    1175 00117$:
                           1176 ;src/main.c:264: if( *getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   692E 1D            [ 4] 1177 	dec	e
   692F C5            [11] 1178 	push	bc
   6930 D5            [11] 1179 	push	de
   6931 2A 80 63      [16] 1180 	ld	hl,(_mapa)
   6934 E5            [11] 1181 	push	hl
   6935 CD D8 49      [17] 1182 	call	_getTilePtr
   6938 F1            [10] 1183 	pop	af
   6939 F1            [10] 1184 	pop	af
   693A C1            [10] 1185 	pop	bc
   693B 5E            [ 7] 1186 	ld	e,(hl)
   693C 3E 02         [ 7] 1187 	ld	a,#0x02
   693E 93            [ 4] 1188 	sub	a, e
   693F DA 07 6A      [10] 1189 	jp	C,00129$
                           1190 ;src/main.c:265: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   6942 DD 6E F8      [19] 1191 	ld	l,-8 (ix)
   6945 DD 66 F9      [19] 1192 	ld	h,-7 (ix)
   6948 7E            [ 7] 1193 	ld	a,(hl)
   6949 C6 0B         [ 7] 1194 	add	a, #0x0B
   694B 57            [ 4] 1195 	ld	d,a
   694C 0A            [ 7] 1196 	ld	a,(bc)
   694D C6 FF         [ 7] 1197 	add	a,#0xFF
   694F C5            [11] 1198 	push	bc
   6950 D5            [11] 1199 	push	de
   6951 33            [ 6] 1200 	inc	sp
   6952 F5            [11] 1201 	push	af
   6953 33            [ 6] 1202 	inc	sp
   6954 2A 80 63      [16] 1203 	ld	hl,(_mapa)
   6957 E5            [11] 1204 	push	hl
   6958 CD D8 49      [17] 1205 	call	_getTilePtr
   695B F1            [10] 1206 	pop	af
   695C F1            [10] 1207 	pop	af
   695D C1            [10] 1208 	pop	bc
   695E 5E            [ 7] 1209 	ld	e,(hl)
   695F 3E 02         [ 7] 1210 	ld	a,#0x02
   6961 93            [ 4] 1211 	sub	a, e
   6962 DA 07 6A      [10] 1212 	jp	C,00129$
                           1213 ;src/main.c:266: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   6965 DD 6E F8      [19] 1214 	ld	l,-8 (ix)
   6968 DD 66 F9      [19] 1215 	ld	h,-7 (ix)
   696B 7E            [ 7] 1216 	ld	a,(hl)
   696C C6 16         [ 7] 1217 	add	a, #0x16
   696E 57            [ 4] 1218 	ld	d,a
   696F 0A            [ 7] 1219 	ld	a,(bc)
   6970 C6 FF         [ 7] 1220 	add	a,#0xFF
   6972 C5            [11] 1221 	push	bc
   6973 D5            [11] 1222 	push	de
   6974 33            [ 6] 1223 	inc	sp
   6975 F5            [11] 1224 	push	af
   6976 33            [ 6] 1225 	inc	sp
   6977 2A 80 63      [16] 1226 	ld	hl,(_mapa)
   697A E5            [11] 1227 	push	hl
   697B CD D8 49      [17] 1228 	call	_getTilePtr
   697E F1            [10] 1229 	pop	af
   697F F1            [10] 1230 	pop	af
   6980 C1            [10] 1231 	pop	bc
   6981 5E            [ 7] 1232 	ld	e,(hl)
   6982 3E 02         [ 7] 1233 	ld	a,#0x02
   6984 93            [ 4] 1234 	sub	a, e
   6985 DA 07 6A      [10] 1235 	jp	C,00129$
                           1236 ;src/main.c:268: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   6988 21 AD 62      [10] 1237 	ld	hl, #_cu + 1
   698B 5E            [ 7] 1238 	ld	e,(hl)
   698C 16 00         [ 7] 1239 	ld	d,#0x00
   698E 21 04 00      [10] 1240 	ld	hl,#0x0004
   6991 19            [11] 1241 	add	hl,de
   6992 DD 75 FE      [19] 1242 	ld	-2 (ix),l
   6995 DD 74 FF      [19] 1243 	ld	-1 (ix),h
   6998 DD 6E F8      [19] 1244 	ld	l,-8 (ix)
   699B DD 66 F9      [19] 1245 	ld	h,-7 (ix)
   699E 6E            [ 7] 1246 	ld	l,(hl)
   699F 26 00         [ 7] 1247 	ld	h,#0x00
   69A1 DD 7E FE      [19] 1248 	ld	a,-2 (ix)
   69A4 95            [ 4] 1249 	sub	a, l
   69A5 DD 7E FF      [19] 1250 	ld	a,-1 (ix)
   69A8 9C            [ 4] 1251 	sbc	a, h
   69A9 E2 AE 69      [10] 1252 	jp	PO, 00272$
   69AC EE 80         [ 7] 1253 	xor	a, #0x80
   69AE                    1254 00272$:
   69AE FA C3 69      [10] 1255 	jp	M,00124$
   69B1 D5            [11] 1256 	push	de
   69B2 11 16 00      [10] 1257 	ld	de,#0x0016
   69B5 19            [11] 1258 	add	hl, de
   69B6 D1            [10] 1259 	pop	de
   69B7 7D            [ 4] 1260 	ld	a,l
   69B8 93            [ 4] 1261 	sub	a, e
   69B9 7C            [ 4] 1262 	ld	a,h
   69BA 9A            [ 4] 1263 	sbc	a, d
   69BB E2 C0 69      [10] 1264 	jp	PO, 00273$
   69BE EE 80         [ 7] 1265 	xor	a, #0x80
   69C0                    1266 00273$:
   69C0 F2 CA 69      [10] 1267 	jp	P,00125$
   69C3                    1268 00124$:
                           1269 ;src/main.c:269: colisiona = 0;
   69C3 DD 36 F7 00   [19] 1270 	ld	-9 (ix),#0x00
   69C7 C3 D9 6B      [10] 1271 	jp	00165$
   69CA                    1272 00125$:
                           1273 ;src/main.c:272: if(enemy->x > cu.x){ //si el cu esta abajo
   69CA 0A            [ 7] 1274 	ld	a,(bc)
   69CB 5F            [ 4] 1275 	ld	e,a
   69CC 21 AC 62      [10] 1276 	ld	hl, #_cu + 0
   69CF 4E            [ 7] 1277 	ld	c,(hl)
   69D0 79            [ 4] 1278 	ld	a,c
   69D1 93            [ 4] 1279 	sub	a, e
   69D2 30 2C         [12] 1280 	jr	NC,00122$
                           1281 ;src/main.c:273: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
   69D4 6B            [ 4] 1282 	ld	l,e
   69D5 26 00         [ 7] 1283 	ld	h,#0x00
   69D7 06 00         [ 7] 1284 	ld	b,#0x00
   69D9 03            [ 6] 1285 	inc	bc
   69DA 03            [ 6] 1286 	inc	bc
   69DB 03            [ 6] 1287 	inc	bc
   69DC 03            [ 6] 1288 	inc	bc
   69DD BF            [ 4] 1289 	cp	a, a
   69DE ED 42         [15] 1290 	sbc	hl, bc
   69E0 3E 01         [ 7] 1291 	ld	a,#0x01
   69E2 BD            [ 4] 1292 	cp	a, l
   69E3 3E 00         [ 7] 1293 	ld	a,#0x00
   69E5 9C            [ 4] 1294 	sbc	a, h
   69E6 E2 EB 69      [10] 1295 	jp	PO, 00274$
   69E9 EE 80         [ 7] 1296 	xor	a, #0x80
   69EB                    1297 00274$:
   69EB F2 F5 69      [10] 1298 	jp	P,00119$
                           1299 ;src/main.c:274: colisiona = 0;
   69EE DD 36 F7 00   [19] 1300 	ld	-9 (ix),#0x00
   69F2 C3 D9 6B      [10] 1301 	jp	00165$
   69F5                    1302 00119$:
                           1303 ;src/main.c:277: enemy->muerto = SI;
   69F5 DD 6E FA      [19] 1304 	ld	l,-6 (ix)
   69F8 DD 66 FB      [19] 1305 	ld	h,-5 (ix)
   69FB 36 01         [10] 1306 	ld	(hl),#0x01
   69FD C3 D9 6B      [10] 1307 	jp	00165$
   6A00                    1308 00122$:
                           1309 ;src/main.c:280: colisiona = 0;
   6A00 DD 36 F7 00   [19] 1310 	ld	-9 (ix),#0x00
   6A04 C3 D9 6B      [10] 1311 	jp	00165$
   6A07                    1312 00129$:
                           1313 ;src/main.c:284: enemy->mira = M_derecha;
   6A07 DD 6E FC      [19] 1314 	ld	l,-4 (ix)
   6A0A DD 66 FD      [19] 1315 	ld	h,-3 (ix)
   6A0D 36 00         [10] 1316 	ld	(hl),#0x00
                           1317 ;src/main.c:286: break;
   6A0F C3 D9 6B      [10] 1318 	jp	00165$
                           1319 ;src/main.c:287: case 2:
   6A12                    1320 00133$:
                           1321 ;src/main.c:288: if( *getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   6A12 15            [ 4] 1322 	dec	d
   6A13 15            [ 4] 1323 	dec	d
   6A14 C5            [11] 1324 	push	bc
   6A15 D5            [11] 1325 	push	de
   6A16 2A 80 63      [16] 1326 	ld	hl,(_mapa)
   6A19 E5            [11] 1327 	push	hl
   6A1A CD D8 49      [17] 1328 	call	_getTilePtr
   6A1D F1            [10] 1329 	pop	af
   6A1E F1            [10] 1330 	pop	af
   6A1F C1            [10] 1331 	pop	bc
   6A20 5E            [ 7] 1332 	ld	e,(hl)
   6A21 3E 02         [ 7] 1333 	ld	a,#0x02
   6A23 93            [ 4] 1334 	sub	a, e
   6A24 DA E8 6A      [10] 1335 	jp	C,00145$
                           1336 ;src/main.c:289: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   6A27 DD 6E F8      [19] 1337 	ld	l,-8 (ix)
   6A2A DD 66 F9      [19] 1338 	ld	h,-7 (ix)
   6A2D 56            [ 7] 1339 	ld	d,(hl)
   6A2E 15            [ 4] 1340 	dec	d
   6A2F 15            [ 4] 1341 	dec	d
   6A30 0A            [ 7] 1342 	ld	a,(bc)
   6A31 C6 02         [ 7] 1343 	add	a, #0x02
   6A33 C5            [11] 1344 	push	bc
   6A34 D5            [11] 1345 	push	de
   6A35 33            [ 6] 1346 	inc	sp
   6A36 F5            [11] 1347 	push	af
   6A37 33            [ 6] 1348 	inc	sp
   6A38 2A 80 63      [16] 1349 	ld	hl,(_mapa)
   6A3B E5            [11] 1350 	push	hl
   6A3C CD D8 49      [17] 1351 	call	_getTilePtr
   6A3F F1            [10] 1352 	pop	af
   6A40 F1            [10] 1353 	pop	af
   6A41 C1            [10] 1354 	pop	bc
   6A42 5E            [ 7] 1355 	ld	e,(hl)
   6A43 3E 02         [ 7] 1356 	ld	a,#0x02
   6A45 93            [ 4] 1357 	sub	a, e
   6A46 DA E8 6A      [10] 1358 	jp	C,00145$
                           1359 ;src/main.c:290: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   6A49 DD 6E F8      [19] 1360 	ld	l,-8 (ix)
   6A4C DD 66 F9      [19] 1361 	ld	h,-7 (ix)
   6A4F 56            [ 7] 1362 	ld	d,(hl)
   6A50 15            [ 4] 1363 	dec	d
   6A51 15            [ 4] 1364 	dec	d
   6A52 0A            [ 7] 1365 	ld	a,(bc)
   6A53 C6 04         [ 7] 1366 	add	a, #0x04
   6A55 C5            [11] 1367 	push	bc
   6A56 D5            [11] 1368 	push	de
   6A57 33            [ 6] 1369 	inc	sp
   6A58 F5            [11] 1370 	push	af
   6A59 33            [ 6] 1371 	inc	sp
   6A5A 2A 80 63      [16] 1372 	ld	hl,(_mapa)
   6A5D E5            [11] 1373 	push	hl
   6A5E CD D8 49      [17] 1374 	call	_getTilePtr
   6A61 F1            [10] 1375 	pop	af
   6A62 F1            [10] 1376 	pop	af
   6A63 C1            [10] 1377 	pop	bc
   6A64 5E            [ 7] 1378 	ld	e,(hl)
   6A65 3E 02         [ 7] 1379 	ld	a,#0x02
   6A67 93            [ 4] 1380 	sub	a, e
   6A68 DA E8 6A      [10] 1381 	jp	C,00145$
                           1382 ;src/main.c:292: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   6A6B 21 AC 62      [10] 1383 	ld	hl, #_cu + 0
   6A6E 5E            [ 7] 1384 	ld	e,(hl)
   6A6F 16 00         [ 7] 1385 	ld	d,#0x00
   6A71 21 02 00      [10] 1386 	ld	hl,#0x0002
   6A74 19            [11] 1387 	add	hl,de
   6A75 DD 75 FE      [19] 1388 	ld	-2 (ix),l
   6A78 DD 74 FF      [19] 1389 	ld	-1 (ix),h
   6A7B 0A            [ 7] 1390 	ld	a,(bc)
   6A7C 6F            [ 4] 1391 	ld	l,a
   6A7D 26 00         [ 7] 1392 	ld	h,#0x00
   6A7F DD 7E FE      [19] 1393 	ld	a,-2 (ix)
   6A82 95            [ 4] 1394 	sub	a, l
   6A83 DD 7E FF      [19] 1395 	ld	a,-1 (ix)
   6A86 9C            [ 4] 1396 	sbc	a, h
   6A87 E2 8C 6A      [10] 1397 	jp	PO, 00275$
   6A8A EE 80         [ 7] 1398 	xor	a, #0x80
   6A8C                    1399 00275$:
   6A8C FA 9F 6A      [10] 1400 	jp	M,00140$
   6A8F 23            [ 6] 1401 	inc	hl
   6A90 23            [ 6] 1402 	inc	hl
   6A91 23            [ 6] 1403 	inc	hl
   6A92 23            [ 6] 1404 	inc	hl
   6A93 7D            [ 4] 1405 	ld	a,l
   6A94 93            [ 4] 1406 	sub	a, e
   6A95 7C            [ 4] 1407 	ld	a,h
   6A96 9A            [ 4] 1408 	sbc	a, d
   6A97 E2 9C 6A      [10] 1409 	jp	PO, 00276$
   6A9A EE 80         [ 7] 1410 	xor	a, #0x80
   6A9C                    1411 00276$:
   6A9C F2 A5 6A      [10] 1412 	jp	P,00141$
   6A9F                    1413 00140$:
                           1414 ;src/main.c:294: colisiona = 0;
   6A9F DD 36 F7 00   [19] 1415 	ld	-9 (ix),#0x00
   6AA3 18 4B         [12] 1416 	jr	00149$
   6AA5                    1417 00141$:
                           1418 ;src/main.c:297: if(enemy->y>cu.y){
   6AA5 DD 6E F8      [19] 1419 	ld	l,-8 (ix)
   6AA8 DD 66 F9      [19] 1420 	ld	h,-7 (ix)
   6AAB 5E            [ 7] 1421 	ld	e,(hl)
   6AAC 21 AD 62      [10] 1422 	ld	hl, #(_cu + 0x0001) + 0
   6AAF 6E            [ 7] 1423 	ld	l,(hl)
   6AB0 7D            [ 4] 1424 	ld	a,l
   6AB1 93            [ 4] 1425 	sub	a, e
   6AB2 30 2E         [12] 1426 	jr	NC,00138$
                           1427 ;src/main.c:298: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   6AB4 16 00         [ 7] 1428 	ld	d,#0x00
   6AB6 26 00         [ 7] 1429 	ld	h,#0x00
   6AB8 D5            [11] 1430 	push	de
   6AB9 11 08 00      [10] 1431 	ld	de,#0x0008
   6ABC 19            [11] 1432 	add	hl, de
   6ABD D1            [10] 1433 	pop	de
   6ABE 7B            [ 4] 1434 	ld	a,e
   6ABF 95            [ 4] 1435 	sub	a, l
   6AC0 5F            [ 4] 1436 	ld	e,a
   6AC1 7A            [ 4] 1437 	ld	a,d
   6AC2 9C            [ 4] 1438 	sbc	a, h
   6AC3 57            [ 4] 1439 	ld	d,a
   6AC4 3E 02         [ 7] 1440 	ld	a,#0x02
   6AC6 BB            [ 4] 1441 	cp	a, e
   6AC7 3E 00         [ 7] 1442 	ld	a,#0x00
   6AC9 9A            [ 4] 1443 	sbc	a, d
   6ACA E2 CF 6A      [10] 1444 	jp	PO, 00277$
   6ACD EE 80         [ 7] 1445 	xor	a, #0x80
   6ACF                    1446 00277$:
   6ACF F2 D8 6A      [10] 1447 	jp	P,00135$
                           1448 ;src/main.c:299: colisiona = 0;
   6AD2 DD 36 F7 00   [19] 1449 	ld	-9 (ix),#0x00
   6AD6 18 18         [12] 1450 	jr	00149$
   6AD8                    1451 00135$:
                           1452 ;src/main.c:302: enemy->muerto = SI;
   6AD8 DD 6E FA      [19] 1453 	ld	l,-6 (ix)
   6ADB DD 66 FB      [19] 1454 	ld	h,-5 (ix)
   6ADE 36 01         [10] 1455 	ld	(hl),#0x01
   6AE0 18 0E         [12] 1456 	jr	00149$
   6AE2                    1457 00138$:
                           1458 ;src/main.c:306: colisiona = 0;
   6AE2 DD 36 F7 00   [19] 1459 	ld	-9 (ix),#0x00
   6AE6 18 08         [12] 1460 	jr	00149$
   6AE8                    1461 00145$:
                           1462 ;src/main.c:312: enemy->mira = M_abajo;
   6AE8 DD 6E FC      [19] 1463 	ld	l,-4 (ix)
   6AEB DD 66 FD      [19] 1464 	ld	h,-3 (ix)
   6AEE 36 03         [10] 1465 	ld	(hl),#0x03
                           1466 ;src/main.c:315: case 3:
   6AF0                    1467 00149$:
                           1468 ;src/main.c:318: if( *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   6AF0 DD 6E F8      [19] 1469 	ld	l,-8 (ix)
   6AF3 DD 66 F9      [19] 1470 	ld	h,-7 (ix)
   6AF6 7E            [ 7] 1471 	ld	a,(hl)
   6AF7 C6 18         [ 7] 1472 	add	a, #0x18
   6AF9 57            [ 4] 1473 	ld	d,a
   6AFA 0A            [ 7] 1474 	ld	a,(bc)
   6AFB C5            [11] 1475 	push	bc
   6AFC D5            [11] 1476 	push	de
   6AFD 33            [ 6] 1477 	inc	sp
   6AFE F5            [11] 1478 	push	af
   6AFF 33            [ 6] 1479 	inc	sp
   6B00 2A 80 63      [16] 1480 	ld	hl,(_mapa)
   6B03 E5            [11] 1481 	push	hl
   6B04 CD D8 49      [17] 1482 	call	_getTilePtr
   6B07 F1            [10] 1483 	pop	af
   6B08 F1            [10] 1484 	pop	af
   6B09 C1            [10] 1485 	pop	bc
   6B0A 5E            [ 7] 1486 	ld	e,(hl)
   6B0B 3E 02         [ 7] 1487 	ld	a,#0x02
   6B0D 93            [ 4] 1488 	sub	a, e
   6B0E DA D1 6B      [10] 1489 	jp	C,00161$
                           1490 ;src/main.c:319: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   6B11 DD 6E F8      [19] 1491 	ld	l,-8 (ix)
   6B14 DD 66 F9      [19] 1492 	ld	h,-7 (ix)
   6B17 7E            [ 7] 1493 	ld	a,(hl)
   6B18 C6 18         [ 7] 1494 	add	a, #0x18
   6B1A 57            [ 4] 1495 	ld	d,a
   6B1B 0A            [ 7] 1496 	ld	a,(bc)
   6B1C C6 02         [ 7] 1497 	add	a, #0x02
   6B1E C5            [11] 1498 	push	bc
   6B1F D5            [11] 1499 	push	de
   6B20 33            [ 6] 1500 	inc	sp
   6B21 F5            [11] 1501 	push	af
   6B22 33            [ 6] 1502 	inc	sp
   6B23 2A 80 63      [16] 1503 	ld	hl,(_mapa)
   6B26 E5            [11] 1504 	push	hl
   6B27 CD D8 49      [17] 1505 	call	_getTilePtr
   6B2A F1            [10] 1506 	pop	af
   6B2B F1            [10] 1507 	pop	af
   6B2C C1            [10] 1508 	pop	bc
   6B2D 5E            [ 7] 1509 	ld	e,(hl)
   6B2E 3E 02         [ 7] 1510 	ld	a,#0x02
   6B30 93            [ 4] 1511 	sub	a, e
   6B31 DA D1 6B      [10] 1512 	jp	C,00161$
                           1513 ;src/main.c:320: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   6B34 DD 6E F8      [19] 1514 	ld	l,-8 (ix)
   6B37 DD 66 F9      [19] 1515 	ld	h,-7 (ix)
   6B3A 7E            [ 7] 1516 	ld	a,(hl)
   6B3B C6 18         [ 7] 1517 	add	a, #0x18
   6B3D 57            [ 4] 1518 	ld	d,a
   6B3E 0A            [ 7] 1519 	ld	a,(bc)
   6B3F C6 04         [ 7] 1520 	add	a, #0x04
   6B41 C5            [11] 1521 	push	bc
   6B42 D5            [11] 1522 	push	de
   6B43 33            [ 6] 1523 	inc	sp
   6B44 F5            [11] 1524 	push	af
   6B45 33            [ 6] 1525 	inc	sp
   6B46 2A 80 63      [16] 1526 	ld	hl,(_mapa)
   6B49 E5            [11] 1527 	push	hl
   6B4A CD D8 49      [17] 1528 	call	_getTilePtr
   6B4D F1            [10] 1529 	pop	af
   6B4E F1            [10] 1530 	pop	af
   6B4F C1            [10] 1531 	pop	bc
   6B50 5E            [ 7] 1532 	ld	e,(hl)
   6B51 3E 02         [ 7] 1533 	ld	a,#0x02
   6B53 93            [ 4] 1534 	sub	a, e
   6B54 38 7B         [12] 1535 	jr	C,00161$
                           1536 ;src/main.c:322: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   6B56 21 AC 62      [10] 1537 	ld	hl, #_cu + 0
   6B59 5E            [ 7] 1538 	ld	e,(hl)
   6B5A 16 00         [ 7] 1539 	ld	d,#0x00
   6B5C 21 02 00      [10] 1540 	ld	hl,#0x0002
   6B5F 19            [11] 1541 	add	hl,de
   6B60 DD 75 FE      [19] 1542 	ld	-2 (ix),l
   6B63 DD 74 FF      [19] 1543 	ld	-1 (ix),h
   6B66 0A            [ 7] 1544 	ld	a,(bc)
   6B67 4F            [ 4] 1545 	ld	c,a
   6B68 06 00         [ 7] 1546 	ld	b,#0x00
   6B6A DD 7E FE      [19] 1547 	ld	a,-2 (ix)
   6B6D 91            [ 4] 1548 	sub	a, c
   6B6E DD 7E FF      [19] 1549 	ld	a,-1 (ix)
   6B71 98            [ 4] 1550 	sbc	a, b
   6B72 E2 77 6B      [10] 1551 	jp	PO, 00278$
   6B75 EE 80         [ 7] 1552 	xor	a, #0x80
   6B77                    1553 00278$:
   6B77 FA 8A 6B      [10] 1554 	jp	M,00156$
   6B7A 03            [ 6] 1555 	inc	bc
   6B7B 03            [ 6] 1556 	inc	bc
   6B7C 03            [ 6] 1557 	inc	bc
   6B7D 03            [ 6] 1558 	inc	bc
   6B7E 79            [ 4] 1559 	ld	a,c
   6B7F 93            [ 4] 1560 	sub	a, e
   6B80 78            [ 4] 1561 	ld	a,b
   6B81 9A            [ 4] 1562 	sbc	a, d
   6B82 E2 87 6B      [10] 1563 	jp	PO, 00279$
   6B85 EE 80         [ 7] 1564 	xor	a, #0x80
   6B87                    1565 00279$:
   6B87 F2 90 6B      [10] 1566 	jp	P,00157$
   6B8A                    1567 00156$:
                           1568 ;src/main.c:323: colisiona = 0;
   6B8A DD 36 F7 00   [19] 1569 	ld	-9 (ix),#0x00
   6B8E 18 49         [12] 1570 	jr	00165$
   6B90                    1571 00157$:
                           1572 ;src/main.c:326: if(cu.y > enemy->y){ //si el cu esta abajo
   6B90 21 AD 62      [10] 1573 	ld	hl, #(_cu + 0x0001) + 0
   6B93 4E            [ 7] 1574 	ld	c,(hl)
   6B94 DD 6E F8      [19] 1575 	ld	l,-8 (ix)
   6B97 DD 66 F9      [19] 1576 	ld	h,-7 (ix)
   6B9A 5E            [ 7] 1577 	ld	e,(hl)
   6B9B 7B            [ 4] 1578 	ld	a,e
   6B9C 91            [ 4] 1579 	sub	a, c
   6B9D 30 2C         [12] 1580 	jr	NC,00154$
                           1581 ;src/main.c:327: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   6B9F 06 00         [ 7] 1582 	ld	b,#0x00
   6BA1 16 00         [ 7] 1583 	ld	d,#0x00
   6BA3 21 16 00      [10] 1584 	ld	hl,#0x0016
   6BA6 19            [11] 1585 	add	hl,de
   6BA7 79            [ 4] 1586 	ld	a,c
   6BA8 95            [ 4] 1587 	sub	a, l
   6BA9 4F            [ 4] 1588 	ld	c,a
   6BAA 78            [ 4] 1589 	ld	a,b
   6BAB 9C            [ 4] 1590 	sbc	a, h
   6BAC 47            [ 4] 1591 	ld	b,a
   6BAD 3E 02         [ 7] 1592 	ld	a,#0x02
   6BAF B9            [ 4] 1593 	cp	a, c
   6BB0 3E 00         [ 7] 1594 	ld	a,#0x00
   6BB2 98            [ 4] 1595 	sbc	a, b
   6BB3 E2 B8 6B      [10] 1596 	jp	PO, 00280$
   6BB6 EE 80         [ 7] 1597 	xor	a, #0x80
   6BB8                    1598 00280$:
   6BB8 F2 C1 6B      [10] 1599 	jp	P,00151$
                           1600 ;src/main.c:328: colisiona = 0;
   6BBB DD 36 F7 00   [19] 1601 	ld	-9 (ix),#0x00
   6BBF 18 18         [12] 1602 	jr	00165$
   6BC1                    1603 00151$:
                           1604 ;src/main.c:331: enemy->muerto = SI;
   6BC1 DD 6E FA      [19] 1605 	ld	l,-6 (ix)
   6BC4 DD 66 FB      [19] 1606 	ld	h,-5 (ix)
   6BC7 36 01         [10] 1607 	ld	(hl),#0x01
   6BC9 18 0E         [12] 1608 	jr	00165$
   6BCB                    1609 00154$:
                           1610 ;src/main.c:335: colisiona = 0;
   6BCB DD 36 F7 00   [19] 1611 	ld	-9 (ix),#0x00
   6BCF 18 08         [12] 1612 	jr	00165$
   6BD1                    1613 00161$:
                           1614 ;src/main.c:339: enemy->mira = M_arriba;
   6BD1 DD 6E FC      [19] 1615 	ld	l,-4 (ix)
   6BD4 DD 66 FD      [19] 1616 	ld	h,-3 (ix)
   6BD7 36 02         [10] 1617 	ld	(hl),#0x02
                           1618 ;src/main.c:342: }
   6BD9                    1619 00165$:
                           1620 ;src/main.c:343: return colisiona;
   6BD9 DD 6E F7      [19] 1621 	ld	l,-9 (ix)
   6BDC DD F9         [10] 1622 	ld	sp, ix
   6BDE DD E1         [14] 1623 	pop	ix
   6BE0 C9            [10] 1624 	ret
                           1625 ;src/main.c:346: void moverEnemigoArriba(TEnemy *enemy){
                           1626 ;	---------------------------------
                           1627 ; Function moverEnemigoArriba
                           1628 ; ---------------------------------
   6BE1                    1629 _moverEnemigoArriba::
   6BE1 DD E5         [15] 1630 	push	ix
   6BE3 DD 21 00 00   [14] 1631 	ld	ix,#0
   6BE7 DD 39         [15] 1632 	add	ix,sp
                           1633 ;src/main.c:347: enemy->y--;
   6BE9 DD 4E 04      [19] 1634 	ld	c,4 (ix)
   6BEC DD 46 05      [19] 1635 	ld	b,5 (ix)
   6BEF 69            [ 4] 1636 	ld	l, c
   6BF0 60            [ 4] 1637 	ld	h, b
   6BF1 23            [ 6] 1638 	inc	hl
   6BF2 5E            [ 7] 1639 	ld	e,(hl)
   6BF3 1D            [ 4] 1640 	dec	e
   6BF4 73            [ 7] 1641 	ld	(hl),e
                           1642 ;src/main.c:348: enemy->y--;
   6BF5 1D            [ 4] 1643 	dec	e
   6BF6 73            [ 7] 1644 	ld	(hl),e
                           1645 ;src/main.c:349: enemy->mover = SI;
   6BF7 21 06 00      [10] 1646 	ld	hl,#0x0006
   6BFA 09            [11] 1647 	add	hl,bc
   6BFB 36 01         [10] 1648 	ld	(hl),#0x01
   6BFD DD E1         [14] 1649 	pop	ix
   6BFF C9            [10] 1650 	ret
                           1651 ;src/main.c:352: void moverEnemigoAbajo(TEnemy *enemy){
                           1652 ;	---------------------------------
                           1653 ; Function moverEnemigoAbajo
                           1654 ; ---------------------------------
   6C00                    1655 _moverEnemigoAbajo::
   6C00 DD E5         [15] 1656 	push	ix
   6C02 DD 21 00 00   [14] 1657 	ld	ix,#0
   6C06 DD 39         [15] 1658 	add	ix,sp
                           1659 ;src/main.c:353: enemy->y++;
   6C08 DD 4E 04      [19] 1660 	ld	c,4 (ix)
   6C0B DD 46 05      [19] 1661 	ld	b,5 (ix)
   6C0E 59            [ 4] 1662 	ld	e, c
   6C0F 50            [ 4] 1663 	ld	d, b
   6C10 13            [ 6] 1664 	inc	de
   6C11 1A            [ 7] 1665 	ld	a,(de)
   6C12 3C            [ 4] 1666 	inc	a
   6C13 12            [ 7] 1667 	ld	(de),a
                           1668 ;src/main.c:354: enemy->y++;
   6C14 3C            [ 4] 1669 	inc	a
   6C15 12            [ 7] 1670 	ld	(de),a
                           1671 ;src/main.c:355: enemy->mover = SI;
   6C16 21 06 00      [10] 1672 	ld	hl,#0x0006
   6C19 09            [11] 1673 	add	hl,bc
   6C1A 36 01         [10] 1674 	ld	(hl),#0x01
   6C1C DD E1         [14] 1675 	pop	ix
   6C1E C9            [10] 1676 	ret
                           1677 ;src/main.c:358: void moverEnemigoDerecha(TEnemy *enemy){
                           1678 ;	---------------------------------
                           1679 ; Function moverEnemigoDerecha
                           1680 ; ---------------------------------
   6C1F                    1681 _moverEnemigoDerecha::
                           1682 ;src/main.c:359: enemy->x++;
   6C1F D1            [10] 1683 	pop	de
   6C20 C1            [10] 1684 	pop	bc
   6C21 C5            [11] 1685 	push	bc
   6C22 D5            [11] 1686 	push	de
   6C23 0A            [ 7] 1687 	ld	a,(bc)
   6C24 3C            [ 4] 1688 	inc	a
   6C25 02            [ 7] 1689 	ld	(bc),a
                           1690 ;src/main.c:360: enemy->x++;
   6C26 3C            [ 4] 1691 	inc	a
   6C27 02            [ 7] 1692 	ld	(bc),a
                           1693 ;src/main.c:361: enemy->mover = SI;
   6C28 21 06 00      [10] 1694 	ld	hl,#0x0006
   6C2B 09            [11] 1695 	add	hl,bc
   6C2C 36 01         [10] 1696 	ld	(hl),#0x01
   6C2E C9            [10] 1697 	ret
                           1698 ;src/main.c:364: void moverEnemigoIzquierda(TEnemy *enemy){
                           1699 ;	---------------------------------
                           1700 ; Function moverEnemigoIzquierda
                           1701 ; ---------------------------------
   6C2F                    1702 _moverEnemigoIzquierda::
                           1703 ;src/main.c:365: enemy->x--;
   6C2F D1            [10] 1704 	pop	de
   6C30 C1            [10] 1705 	pop	bc
   6C31 C5            [11] 1706 	push	bc
   6C32 D5            [11] 1707 	push	de
   6C33 0A            [ 7] 1708 	ld	a,(bc)
   6C34 C6 FF         [ 7] 1709 	add	a,#0xFF
   6C36 02            [ 7] 1710 	ld	(bc),a
                           1711 ;src/main.c:366: enemy->x--;
   6C37 C6 FF         [ 7] 1712 	add	a,#0xFF
   6C39 02            [ 7] 1713 	ld	(bc),a
                           1714 ;src/main.c:367: enemy->mover = SI;
   6C3A 21 06 00      [10] 1715 	ld	hl,#0x0006
   6C3D 09            [11] 1716 	add	hl,bc
   6C3E 36 01         [10] 1717 	ld	(hl),#0x01
   6C40 C9            [10] 1718 	ret
                           1719 ;src/main.c:370: void moverEnemigoPatrol(TEnemy* enemy){
                           1720 ;	---------------------------------
                           1721 ; Function moverEnemigoPatrol
                           1722 ; ---------------------------------
   6C41                    1723 _moverEnemigoPatrol::
   6C41 DD E5         [15] 1724 	push	ix
   6C43 DD 21 00 00   [14] 1725 	ld	ix,#0
   6C47 DD 39         [15] 1726 	add	ix,sp
   6C49 21 F3 FF      [10] 1727 	ld	hl,#-13
   6C4C 39            [11] 1728 	add	hl,sp
   6C4D F9            [ 6] 1729 	ld	sp,hl
                           1730 ;src/main.c:372: if(!enemy->muerto){
   6C4E DD 4E 04      [19] 1731 	ld	c,4 (ix)
   6C51 DD 46 05      [19] 1732 	ld	b,5 (ix)
   6C54 C5            [11] 1733 	push	bc
   6C55 FD E1         [14] 1734 	pop	iy
   6C57 FD 7E 08      [19] 1735 	ld	a,8 (iy)
   6C5A B7            [ 4] 1736 	or	a, a
   6C5B C2 85 6E      [10] 1737 	jp	NZ,00118$
                           1738 ;src/main.c:375: if (!enemy->reversePatrol) {
   6C5E 21 0C 00      [10] 1739 	ld	hl,#0x000C
   6C61 09            [11] 1740 	add	hl,bc
   6C62 DD 75 FE      [19] 1741 	ld	-2 (ix),l
   6C65 DD 74 FF      [19] 1742 	ld	-1 (ix),h
   6C68 DD 6E FE      [19] 1743 	ld	l,-2 (ix)
   6C6B DD 66 FF      [19] 1744 	ld	h,-1 (ix)
   6C6E 7E            [ 7] 1745 	ld	a,(hl)
   6C6F DD 77 FD      [19] 1746 	ld	-3 (ix),a
                           1747 ;src/main.c:376: if(enemy->iter < enemy->longitud_camino){
   6C72 21 0E 00      [10] 1748 	ld	hl,#0x000E
   6C75 09            [11] 1749 	add	hl,bc
   6C76 DD 75 FB      [19] 1750 	ld	-5 (ix),l
   6C79 DD 74 FC      [19] 1751 	ld	-4 (ix),h
   6C7C DD 6E FB      [19] 1752 	ld	l,-5 (ix)
   6C7F DD 66 FC      [19] 1753 	ld	h,-4 (ix)
   6C82 5E            [ 7] 1754 	ld	e,(hl)
   6C83 23            [ 6] 1755 	inc	hl
   6C84 56            [ 7] 1756 	ld	d,(hl)
   6C85 21 E1 00      [10] 1757 	ld	hl,#0x00E1
   6C88 09            [11] 1758 	add	hl,bc
   6C89 DD 75 F9      [19] 1759 	ld	-7 (ix),l
   6C8C DD 74 FA      [19] 1760 	ld	-6 (ix),h
                           1761 ;src/main.c:379: enemy->mover = SI;
   6C8F 21 06 00      [10] 1762 	ld	hl,#0x0006
   6C92 09            [11] 1763 	add	hl,bc
   6C93 DD 75 F7      [19] 1764 	ld	-9 (ix),l
   6C96 DD 74 F8      [19] 1765 	ld	-8 (ix),h
                           1766 ;src/main.c:381: enemy->x = enemy->camino[enemy->iter];
   6C99 21 19 00      [10] 1767 	ld	hl,#0x0019
   6C9C 09            [11] 1768 	add	hl,bc
   6C9D DD 75 F5      [19] 1769 	ld	-11 (ix),l
   6CA0 DD 74 F6      [19] 1770 	ld	-10 (ix),h
                           1771 ;src/main.c:383: enemy->y = enemy->camino[enemy->iter];
   6CA3 21 01 00      [10] 1772 	ld	hl,#0x0001
   6CA6 09            [11] 1773 	add	hl,bc
   6CA7 E3            [19] 1774 	ex	(sp), hl
                           1775 ;src/main.c:375: if (!enemy->reversePatrol) {
   6CA8 DD 7E FD      [19] 1776 	ld	a,-3 (ix)
   6CAB B7            [ 4] 1777 	or	a, a
   6CAC C2 83 6D      [10] 1778 	jp	NZ,00114$
                           1779 ;src/main.c:376: if(enemy->iter < enemy->longitud_camino){
   6CAF DD 6E F9      [19] 1780 	ld	l,-7 (ix)
   6CB2 DD 66 FA      [19] 1781 	ld	h,-6 (ix)
   6CB5 6E            [ 7] 1782 	ld	l,(hl)
   6CB6 26 00         [ 7] 1783 	ld	h,#0x00
   6CB8 7B            [ 4] 1784 	ld	a,e
   6CB9 95            [ 4] 1785 	sub	a, l
   6CBA 7A            [ 4] 1786 	ld	a,d
   6CBB 9C            [ 4] 1787 	sbc	a, h
   6CBC E2 C1 6C      [10] 1788 	jp	PO, 00144$
   6CBF EE 80         [ 7] 1789 	xor	a, #0x80
   6CC1                    1790 00144$:
   6CC1 F2 5E 6D      [10] 1791 	jp	P,00105$
                           1792 ;src/main.c:377: if(enemy->iter == 0){
   6CC4 7A            [ 4] 1793 	ld	a,d
   6CC5 B3            [ 4] 1794 	or	a,e
   6CC6 20 50         [12] 1795 	jr	NZ,00102$
                           1796 ;src/main.c:379: enemy->mover = SI;
   6CC8 DD 6E F7      [19] 1797 	ld	l,-9 (ix)
   6CCB DD 66 F8      [19] 1798 	ld	h,-8 (ix)
   6CCE 36 01         [10] 1799 	ld	(hl),#0x01
                           1800 ;src/main.c:380: enemy->iter = 2;
   6CD0 DD 6E FB      [19] 1801 	ld	l,-5 (ix)
   6CD3 DD 66 FC      [19] 1802 	ld	h,-4 (ix)
   6CD6 36 02         [10] 1803 	ld	(hl),#0x02
   6CD8 23            [ 6] 1804 	inc	hl
   6CD9 36 00         [10] 1805 	ld	(hl),#0x00
                           1806 ;src/main.c:381: enemy->x = enemy->camino[enemy->iter];
   6CDB DD 6E FB      [19] 1807 	ld	l,-5 (ix)
   6CDE DD 66 FC      [19] 1808 	ld	h,-4 (ix)
   6CE1 5E            [ 7] 1809 	ld	e,(hl)
   6CE2 23            [ 6] 1810 	inc	hl
   6CE3 56            [ 7] 1811 	ld	d,(hl)
   6CE4 DD 6E F5      [19] 1812 	ld	l,-11 (ix)
   6CE7 DD 66 F6      [19] 1813 	ld	h,-10 (ix)
   6CEA 19            [11] 1814 	add	hl,de
   6CEB 7E            [ 7] 1815 	ld	a,(hl)
   6CEC 02            [ 7] 1816 	ld	(bc),a
                           1817 ;src/main.c:382: ++enemy->iter;
   6CED DD 6E FB      [19] 1818 	ld	l,-5 (ix)
   6CF0 DD 66 FC      [19] 1819 	ld	h,-4 (ix)
   6CF3 4E            [ 7] 1820 	ld	c,(hl)
   6CF4 23            [ 6] 1821 	inc	hl
   6CF5 46            [ 7] 1822 	ld	b,(hl)
   6CF6 03            [ 6] 1823 	inc	bc
   6CF7 DD 6E FB      [19] 1824 	ld	l,-5 (ix)
   6CFA DD 66 FC      [19] 1825 	ld	h,-4 (ix)
   6CFD 71            [ 7] 1826 	ld	(hl),c
   6CFE 23            [ 6] 1827 	inc	hl
   6CFF 70            [ 7] 1828 	ld	(hl),b
                           1829 ;src/main.c:383: enemy->y = enemy->camino[enemy->iter];
   6D00 DD 6E F5      [19] 1830 	ld	l,-11 (ix)
   6D03 DD 66 F6      [19] 1831 	ld	h,-10 (ix)
   6D06 09            [11] 1832 	add	hl,bc
   6D07 5E            [ 7] 1833 	ld	e,(hl)
   6D08 E1            [10] 1834 	pop	hl
   6D09 E5            [11] 1835 	push	hl
   6D0A 73            [ 7] 1836 	ld	(hl),e
                           1837 ;src/main.c:384: ++enemy->iter;
   6D0B 03            [ 6] 1838 	inc	bc
   6D0C DD 6E FB      [19] 1839 	ld	l,-5 (ix)
   6D0F DD 66 FC      [19] 1840 	ld	h,-4 (ix)
   6D12 71            [ 7] 1841 	ld	(hl),c
   6D13 23            [ 6] 1842 	inc	hl
   6D14 70            [ 7] 1843 	ld	(hl),b
   6D15 C3 85 6E      [10] 1844 	jp	00118$
   6D18                    1845 00102$:
                           1846 ;src/main.c:387: enemy->mover = SI;
   6D18 DD 6E F7      [19] 1847 	ld	l,-9 (ix)
   6D1B DD 66 F8      [19] 1848 	ld	h,-8 (ix)
   6D1E 36 01         [10] 1849 	ld	(hl),#0x01
                           1850 ;src/main.c:388: enemy->x = enemy->camino[enemy->iter];
   6D20 DD 6E FB      [19] 1851 	ld	l,-5 (ix)
   6D23 DD 66 FC      [19] 1852 	ld	h,-4 (ix)
   6D26 5E            [ 7] 1853 	ld	e,(hl)
   6D27 23            [ 6] 1854 	inc	hl
   6D28 56            [ 7] 1855 	ld	d,(hl)
   6D29 DD 6E F5      [19] 1856 	ld	l,-11 (ix)
   6D2C DD 66 F6      [19] 1857 	ld	h,-10 (ix)
   6D2F 19            [11] 1858 	add	hl,de
   6D30 7E            [ 7] 1859 	ld	a,(hl)
   6D31 02            [ 7] 1860 	ld	(bc),a
                           1861 ;src/main.c:389: ++enemy->iter;
   6D32 DD 6E FB      [19] 1862 	ld	l,-5 (ix)
   6D35 DD 66 FC      [19] 1863 	ld	h,-4 (ix)
   6D38 5E            [ 7] 1864 	ld	e,(hl)
   6D39 23            [ 6] 1865 	inc	hl
   6D3A 56            [ 7] 1866 	ld	d,(hl)
   6D3B 13            [ 6] 1867 	inc	de
   6D3C DD 6E FB      [19] 1868 	ld	l,-5 (ix)
   6D3F DD 66 FC      [19] 1869 	ld	h,-4 (ix)
   6D42 73            [ 7] 1870 	ld	(hl),e
   6D43 23            [ 6] 1871 	inc	hl
   6D44 72            [ 7] 1872 	ld	(hl),d
                           1873 ;src/main.c:390: enemy->y = enemy->camino[enemy->iter];
   6D45 DD 6E F5      [19] 1874 	ld	l,-11 (ix)
   6D48 DD 66 F6      [19] 1875 	ld	h,-10 (ix)
   6D4B 19            [11] 1876 	add	hl,de
   6D4C 7E            [ 7] 1877 	ld	a,(hl)
   6D4D E1            [10] 1878 	pop	hl
   6D4E E5            [11] 1879 	push	hl
   6D4F 77            [ 7] 1880 	ld	(hl),a
                           1881 ;src/main.c:391: ++enemy->iter;
   6D50 13            [ 6] 1882 	inc	de
   6D51 4B            [ 4] 1883 	ld	c,e
   6D52 DD 6E FB      [19] 1884 	ld	l,-5 (ix)
   6D55 DD 66 FC      [19] 1885 	ld	h,-4 (ix)
   6D58 71            [ 7] 1886 	ld	(hl),c
   6D59 23            [ 6] 1887 	inc	hl
   6D5A 72            [ 7] 1888 	ld	(hl),d
   6D5B C3 85 6E      [10] 1889 	jp	00118$
   6D5E                    1890 00105$:
                           1891 ;src/main.c:396: enemy->mover = NO;
   6D5E DD 6E F7      [19] 1892 	ld	l,-9 (ix)
   6D61 DD 66 F8      [19] 1893 	ld	h,-8 (ix)
   6D64 36 00         [10] 1894 	ld	(hl),#0x00
                           1895 ;src/main.c:397: enemy->iter = enemy->longitud_camino;
   6D66 DD 6E F9      [19] 1896 	ld	l,-7 (ix)
   6D69 DD 66 FA      [19] 1897 	ld	h,-6 (ix)
   6D6C 4E            [ 7] 1898 	ld	c,(hl)
   6D6D 06 00         [ 7] 1899 	ld	b,#0x00
   6D6F DD 6E FB      [19] 1900 	ld	l,-5 (ix)
   6D72 DD 66 FC      [19] 1901 	ld	h,-4 (ix)
   6D75 71            [ 7] 1902 	ld	(hl),c
   6D76 23            [ 6] 1903 	inc	hl
   6D77 70            [ 7] 1904 	ld	(hl),b
                           1905 ;src/main.c:401: enemy->reversePatrol = 1;
   6D78 DD 6E FE      [19] 1906 	ld	l,-2 (ix)
   6D7B DD 66 FF      [19] 1907 	ld	h,-1 (ix)
   6D7E 36 01         [10] 1908 	ld	(hl),#0x01
   6D80 C3 85 6E      [10] 1909 	jp	00118$
   6D83                    1910 00114$:
                           1911 ;src/main.c:406: if(enemy->iter > 0){
   6D83 AF            [ 4] 1912 	xor	a, a
   6D84 BB            [ 4] 1913 	cp	a, e
   6D85 9A            [ 4] 1914 	sbc	a, d
   6D86 E2 8B 6D      [10] 1915 	jp	PO, 00145$
   6D89 EE 80         [ 7] 1916 	xor	a, #0x80
   6D8B                    1917 00145$:
   6D8B F2 6B 6E      [10] 1918 	jp	P,00111$
                           1919 ;src/main.c:407: if(enemy->iter == enemy->longitud_camino){
   6D8E DD 6E F9      [19] 1920 	ld	l,-7 (ix)
   6D91 DD 66 FA      [19] 1921 	ld	h,-6 (ix)
   6D94 6E            [ 7] 1922 	ld	l,(hl)
   6D95 DD 75 F9      [19] 1923 	ld	-7 (ix),l
   6D98 DD 36 FA 00   [19] 1924 	ld	-6 (ix),#0x00
   6D9C 7B            [ 4] 1925 	ld	a,e
   6D9D DD 96 F9      [19] 1926 	sub	a, -7 (ix)
   6DA0 C2 27 6E      [10] 1927 	jp	NZ,00108$
   6DA3 7A            [ 4] 1928 	ld	a,d
   6DA4 DD 96 FA      [19] 1929 	sub	a, -6 (ix)
   6DA7 C2 27 6E      [10] 1930 	jp	NZ,00108$
                           1931 ;src/main.c:408: enemy->mover = SI;
   6DAA DD 6E F7      [19] 1932 	ld	l,-9 (ix)
   6DAD DD 66 F8      [19] 1933 	ld	h,-8 (ix)
   6DB0 36 01         [10] 1934 	ld	(hl),#0x01
                           1935 ;src/main.c:409: enemy->iter = enemy->iter - 1;
   6DB2 DD 6E FB      [19] 1936 	ld	l,-5 (ix)
   6DB5 DD 66 FC      [19] 1937 	ld	h,-4 (ix)
   6DB8 5E            [ 7] 1938 	ld	e,(hl)
   6DB9 23            [ 6] 1939 	inc	hl
   6DBA 56            [ 7] 1940 	ld	d,(hl)
   6DBB 7B            [ 4] 1941 	ld	a,e
   6DBC C6 FF         [ 7] 1942 	add	a,#0xFF
   6DBE DD 77 F9      [19] 1943 	ld	-7 (ix),a
   6DC1 7A            [ 4] 1944 	ld	a,d
   6DC2 CE FF         [ 7] 1945 	adc	a,#0xFF
   6DC4 DD 77 FA      [19] 1946 	ld	-6 (ix),a
   6DC7 DD 6E FB      [19] 1947 	ld	l,-5 (ix)
   6DCA DD 66 FC      [19] 1948 	ld	h,-4 (ix)
   6DCD DD 7E F9      [19] 1949 	ld	a,-7 (ix)
   6DD0 77            [ 7] 1950 	ld	(hl),a
   6DD1 23            [ 6] 1951 	inc	hl
   6DD2 DD 7E FA      [19] 1952 	ld	a,-6 (ix)
   6DD5 77            [ 7] 1953 	ld	(hl),a
                           1954 ;src/main.c:410: enemy->iter = enemy->iter - 2;
   6DD6 DD 5E F9      [19] 1955 	ld	e,-7 (ix)
   6DD9 DD 56 FA      [19] 1956 	ld	d,-6 (ix)
   6DDC 1B            [ 6] 1957 	dec	de
   6DDD 1B            [ 6] 1958 	dec	de
   6DDE DD 6E FB      [19] 1959 	ld	l,-5 (ix)
   6DE1 DD 66 FC      [19] 1960 	ld	h,-4 (ix)
   6DE4 73            [ 7] 1961 	ld	(hl),e
   6DE5 23            [ 6] 1962 	inc	hl
   6DE6 72            [ 7] 1963 	ld	(hl),d
                           1964 ;src/main.c:411: enemy->y = enemy->camino[enemy->iter];
   6DE7 DD 6E F5      [19] 1965 	ld	l,-11 (ix)
   6DEA DD 66 F6      [19] 1966 	ld	h,-10 (ix)
   6DED 19            [11] 1967 	add	hl,de
   6DEE 5E            [ 7] 1968 	ld	e,(hl)
   6DEF E1            [10] 1969 	pop	hl
   6DF0 E5            [11] 1970 	push	hl
   6DF1 73            [ 7] 1971 	ld	(hl),e
                           1972 ;src/main.c:412: --enemy->iter;
   6DF2 DD 7E F9      [19] 1973 	ld	a,-7 (ix)
   6DF5 C6 FD         [ 7] 1974 	add	a,#0xFD
   6DF7 5F            [ 4] 1975 	ld	e,a
   6DF8 DD 7E FA      [19] 1976 	ld	a,-6 (ix)
   6DFB CE FF         [ 7] 1977 	adc	a,#0xFF
   6DFD 57            [ 4] 1978 	ld	d,a
   6DFE DD 6E FB      [19] 1979 	ld	l,-5 (ix)
   6E01 DD 66 FC      [19] 1980 	ld	h,-4 (ix)
   6E04 73            [ 7] 1981 	ld	(hl),e
   6E05 23            [ 6] 1982 	inc	hl
   6E06 72            [ 7] 1983 	ld	(hl),d
                           1984 ;src/main.c:413: enemy->x = enemy->camino[enemy->iter];
   6E07 DD 6E F5      [19] 1985 	ld	l,-11 (ix)
   6E0A DD 66 F6      [19] 1986 	ld	h,-10 (ix)
   6E0D 19            [11] 1987 	add	hl,de
   6E0E 7E            [ 7] 1988 	ld	a,(hl)
   6E0F 02            [ 7] 1989 	ld	(bc),a
                           1990 ;src/main.c:414: --enemy->iter;
   6E10 DD 7E F9      [19] 1991 	ld	a,-7 (ix)
   6E13 C6 FC         [ 7] 1992 	add	a,#0xFC
   6E15 4F            [ 4] 1993 	ld	c,a
   6E16 DD 7E FA      [19] 1994 	ld	a,-6 (ix)
   6E19 CE FF         [ 7] 1995 	adc	a,#0xFF
   6E1B 47            [ 4] 1996 	ld	b,a
   6E1C DD 6E FB      [19] 1997 	ld	l,-5 (ix)
   6E1F DD 66 FC      [19] 1998 	ld	h,-4 (ix)
   6E22 71            [ 7] 1999 	ld	(hl),c
   6E23 23            [ 6] 2000 	inc	hl
   6E24 70            [ 7] 2001 	ld	(hl),b
   6E25 18 5E         [12] 2002 	jr	00118$
   6E27                    2003 00108$:
                           2004 ;src/main.c:416: enemy->mover = SI;
   6E27 DD 6E F7      [19] 2005 	ld	l,-9 (ix)
   6E2A DD 66 F8      [19] 2006 	ld	h,-8 (ix)
   6E2D 36 01         [10] 2007 	ld	(hl),#0x01
                           2008 ;src/main.c:417: enemy->y = enemy->camino[enemy->iter];
   6E2F DD 6E FB      [19] 2009 	ld	l,-5 (ix)
   6E32 DD 66 FC      [19] 2010 	ld	h,-4 (ix)
   6E35 5E            [ 7] 2011 	ld	e,(hl)
   6E36 23            [ 6] 2012 	inc	hl
   6E37 56            [ 7] 2013 	ld	d,(hl)
   6E38 DD 6E F5      [19] 2014 	ld	l,-11 (ix)
   6E3B DD 66 F6      [19] 2015 	ld	h,-10 (ix)
   6E3E 19            [11] 2016 	add	hl,de
   6E3F 5E            [ 7] 2017 	ld	e,(hl)
   6E40 E1            [10] 2018 	pop	hl
   6E41 E5            [11] 2019 	push	hl
   6E42 73            [ 7] 2020 	ld	(hl),e
                           2021 ;src/main.c:418: --enemy->iter;
   6E43 DD 6E FB      [19] 2022 	ld	l,-5 (ix)
   6E46 DD 66 FC      [19] 2023 	ld	h,-4 (ix)
   6E49 5E            [ 7] 2024 	ld	e,(hl)
   6E4A 23            [ 6] 2025 	inc	hl
   6E4B 56            [ 7] 2026 	ld	d,(hl)
   6E4C 1B            [ 6] 2027 	dec	de
   6E4D DD 6E FB      [19] 2028 	ld	l,-5 (ix)
   6E50 DD 66 FC      [19] 2029 	ld	h,-4 (ix)
   6E53 73            [ 7] 2030 	ld	(hl),e
   6E54 23            [ 6] 2031 	inc	hl
   6E55 72            [ 7] 2032 	ld	(hl),d
                           2033 ;src/main.c:419: enemy->x = enemy->camino[enemy->iter];
   6E56 DD 6E F5      [19] 2034 	ld	l,-11 (ix)
   6E59 DD 66 F6      [19] 2035 	ld	h,-10 (ix)
   6E5C 19            [11] 2036 	add	hl,de
   6E5D 7E            [ 7] 2037 	ld	a,(hl)
   6E5E 02            [ 7] 2038 	ld	(bc),a
                           2039 ;src/main.c:420: --enemy->iter;
   6E5F 1B            [ 6] 2040 	dec	de
   6E60 DD 6E FB      [19] 2041 	ld	l,-5 (ix)
   6E63 DD 66 FC      [19] 2042 	ld	h,-4 (ix)
   6E66 73            [ 7] 2043 	ld	(hl),e
   6E67 23            [ 6] 2044 	inc	hl
   6E68 72            [ 7] 2045 	ld	(hl),d
   6E69 18 1A         [12] 2046 	jr	00118$
   6E6B                    2047 00111$:
                           2048 ;src/main.c:425: enemy->mover = NO;
   6E6B DD 6E F7      [19] 2049 	ld	l,-9 (ix)
   6E6E DD 66 F8      [19] 2050 	ld	h,-8 (ix)
   6E71 36 00         [10] 2051 	ld	(hl),#0x00
                           2052 ;src/main.c:426: enemy->iter = 0;
   6E73 DD 6E FB      [19] 2053 	ld	l,-5 (ix)
   6E76 DD 66 FC      [19] 2054 	ld	h,-4 (ix)
   6E79 AF            [ 4] 2055 	xor	a, a
   6E7A 77            [ 7] 2056 	ld	(hl), a
   6E7B 23            [ 6] 2057 	inc	hl
   6E7C 77            [ 7] 2058 	ld	(hl), a
                           2059 ;src/main.c:428: enemy->reversePatrol = 0;
   6E7D DD 6E FE      [19] 2060 	ld	l,-2 (ix)
   6E80 DD 66 FF      [19] 2061 	ld	h,-1 (ix)
   6E83 36 00         [10] 2062 	ld	(hl),#0x00
   6E85                    2063 00118$:
   6E85 DD F9         [10] 2064 	ld	sp, ix
   6E87 DD E1         [14] 2065 	pop	ix
   6E89 C9            [10] 2066 	ret
                           2067 ;src/main.c:435: void moverEnemigoSeek(TEnemy* enemy){
                           2068 ;	---------------------------------
                           2069 ; Function moverEnemigoSeek
                           2070 ; ---------------------------------
   6E8A                    2071 _moverEnemigoSeek::
   6E8A DD E5         [15] 2072 	push	ix
   6E8C DD 21 00 00   [14] 2073 	ld	ix,#0
   6E90 DD 39         [15] 2074 	add	ix,sp
   6E92 F5            [11] 2075 	push	af
   6E93 F5            [11] 2076 	push	af
                           2077 ;src/main.c:436: if(!enemy->muerto){
   6E94 DD 4E 04      [19] 2078 	ld	c,4 (ix)
   6E97 DD 46 05      [19] 2079 	ld	b,5 (ix)
   6E9A C5            [11] 2080 	push	bc
   6E9B FD E1         [14] 2081 	pop	iy
   6E9D FD 7E 08      [19] 2082 	ld	a,8 (iy)
   6EA0 B7            [ 4] 2083 	or	a, a
   6EA1 C2 86 6F      [10] 2084 	jp	NZ,00108$
                           2085 ;src/main.c:438: if (!enemy->reversePatrol) {
   6EA4 21 0C 00      [10] 2086 	ld	hl,#0x000C
   6EA7 09            [11] 2087 	add	hl,bc
   6EA8 EB            [ 4] 2088 	ex	de,hl
   6EA9 1A            [ 7] 2089 	ld	a,(de)
   6EAA B7            [ 4] 2090 	or	a, a
   6EAB C2 86 6F      [10] 2091 	jp	NZ,00108$
                           2092 ;src/main.c:439: if(enemy->iter < enemy->longitud_camino - 8){
   6EAE FD 21 0E 00   [14] 2093 	ld	iy,#0x000E
   6EB2 FD 09         [15] 2094 	add	iy, bc
   6EB4 FD 7E 00      [19] 2095 	ld	a,0 (iy)
   6EB7 DD 77 FE      [19] 2096 	ld	-2 (ix),a
   6EBA FD 7E 01      [19] 2097 	ld	a,1 (iy)
   6EBD DD 77 FF      [19] 2098 	ld	-1 (ix),a
   6EC0 69            [ 4] 2099 	ld	l, c
   6EC1 60            [ 4] 2100 	ld	h, b
   6EC2 C5            [11] 2101 	push	bc
   6EC3 01 E1 00      [10] 2102 	ld	bc, #0x00E1
   6EC6 09            [11] 2103 	add	hl, bc
   6EC7 C1            [10] 2104 	pop	bc
   6EC8 6E            [ 7] 2105 	ld	l,(hl)
   6EC9 26 00         [ 7] 2106 	ld	h,#0x00
   6ECB 7D            [ 4] 2107 	ld	a,l
   6ECC C6 F8         [ 7] 2108 	add	a,#0xF8
   6ECE 6F            [ 4] 2109 	ld	l,a
   6ECF 7C            [ 4] 2110 	ld	a,h
   6ED0 CE FF         [ 7] 2111 	adc	a,#0xFF
   6ED2 67            [ 4] 2112 	ld	h,a
                           2113 ;src/main.c:442: enemy->y = enemy->camino[enemy->iter];
   6ED3 79            [ 4] 2114 	ld	a,c
   6ED4 C6 01         [ 7] 2115 	add	a, #0x01
   6ED6 DD 77 FC      [19] 2116 	ld	-4 (ix),a
   6ED9 78            [ 4] 2117 	ld	a,b
   6EDA CE 00         [ 7] 2118 	adc	a, #0x00
   6EDC DD 77 FD      [19] 2119 	ld	-3 (ix),a
                           2120 ;src/main.c:439: if(enemy->iter < enemy->longitud_camino - 8){
   6EDF DD 7E FE      [19] 2121 	ld	a,-2 (ix)
   6EE2 95            [ 4] 2122 	sub	a, l
   6EE3 DD 7E FF      [19] 2123 	ld	a,-1 (ix)
   6EE6 9C            [ 4] 2124 	sbc	a, h
   6EE7 E2 EC 6E      [10] 2125 	jp	PO, 00122$
   6EEA EE 80         [ 7] 2126 	xor	a, #0x80
   6EEC                    2127 00122$:
   6EEC F2 36 6F      [10] 2128 	jp	P,00102$
                           2129 ;src/main.c:440: enemy->x = enemy->camino[enemy->iter];
   6EEF 21 19 00      [10] 2130 	ld	hl,#0x0019
   6EF2 09            [11] 2131 	add	hl,bc
   6EF3 EB            [ 4] 2132 	ex	de,hl
   6EF4 DD 6E FE      [19] 2133 	ld	l,-2 (ix)
   6EF7 DD 66 FF      [19] 2134 	ld	h,-1 (ix)
   6EFA 19            [11] 2135 	add	hl,de
   6EFB 7E            [ 7] 2136 	ld	a,(hl)
   6EFC 02            [ 7] 2137 	ld	(bc),a
                           2138 ;src/main.c:441: enemy->iter++;
   6EFD FD 6E 00      [19] 2139 	ld	l,0 (iy)
   6F00 FD 66 01      [19] 2140 	ld	h,1 (iy)
   6F03 23            [ 6] 2141 	inc	hl
   6F04 DD 75 FE      [19] 2142 	ld	-2 (ix),l
   6F07 DD 74 FF      [19] 2143 	ld	-1 (ix),h
   6F0A DD 7E FE      [19] 2144 	ld	a,-2 (ix)
   6F0D FD 77 00      [19] 2145 	ld	0 (iy),a
   6F10 DD 7E FF      [19] 2146 	ld	a,-1 (ix)
   6F13 FD 77 01      [19] 2147 	ld	1 (iy),a
                           2148 ;src/main.c:442: enemy->y = enemy->camino[enemy->iter];
   6F16 DD 6E FE      [19] 2149 	ld	l,-2 (ix)
   6F19 DD 66 FF      [19] 2150 	ld	h,-1 (ix)
   6F1C 19            [11] 2151 	add	hl,de
   6F1D 5E            [ 7] 2152 	ld	e,(hl)
   6F1E E1            [10] 2153 	pop	hl
   6F1F E5            [11] 2154 	push	hl
   6F20 73            [ 7] 2155 	ld	(hl),e
                           2156 ;src/main.c:443: enemy->iter++;
   6F21 DD 5E FE      [19] 2157 	ld	e,-2 (ix)
   6F24 DD 56 FF      [19] 2158 	ld	d,-1 (ix)
   6F27 13            [ 6] 2159 	inc	de
   6F28 FD 73 00      [19] 2160 	ld	0 (iy),e
   6F2B FD 72 01      [19] 2161 	ld	1 (iy),d
                           2162 ;src/main.c:444: enemy->mover = SI;
   6F2E 21 06 00      [10] 2163 	ld	hl,#0x0006
   6F31 09            [11] 2164 	add	hl,bc
   6F32 36 01         [10] 2165 	ld	(hl),#0x01
   6F34 18 50         [12] 2166 	jr	00108$
   6F36                    2167 00102$:
                           2168 ;src/main.c:447: enemy->reversePatrol = NO;
   6F36 AF            [ 4] 2169 	xor	a, a
   6F37 12            [ 7] 2170 	ld	(de),a
                           2171 ;src/main.c:448: enemy->patrolling = 1;
   6F38 21 0B 00      [10] 2172 	ld	hl,#0x000B
   6F3B 09            [11] 2173 	add	hl,bc
   6F3C 36 01         [10] 2174 	ld	(hl),#0x01
                           2175 ;src/main.c:449: enemy->seek = 0;
   6F3E 21 14 00      [10] 2176 	ld	hl,#0x0014
   6F41 09            [11] 2177 	add	hl,bc
   6F42 36 00         [10] 2178 	ld	(hl),#0x00
                           2179 ;src/main.c:450: enemy->lastIter = enemy->iter - 1;
   6F44 21 10 00      [10] 2180 	ld	hl,#0x0010
   6F47 09            [11] 2181 	add	hl,bc
   6F48 EB            [ 4] 2182 	ex	de,hl
   6F49 FD 7E 00      [19] 2183 	ld	a, 0 (iy)
   6F4C C6 FF         [ 7] 2184 	add	a,#0xFF
   6F4E 12            [ 7] 2185 	ld	(de),a
                           2186 ;src/main.c:451: enemy->iter = 0;
   6F4F FD 36 00 00   [19] 2187 	ld	0 (iy),#0x00
   6F53 FD 36 01 00   [19] 2188 	ld	1 (iy),#0x00
                           2189 ;src/main.c:452: pathFinding(enemy->x, enemy->y, enemy->p_seek_x, enemy->p_seek_y, enemy, mapa);
   6F57 69            [ 4] 2190 	ld	l, c
   6F58 60            [ 4] 2191 	ld	h, b
   6F59 11 18 00      [10] 2192 	ld	de, #0x0018
   6F5C 19            [11] 2193 	add	hl, de
   6F5D 56            [ 7] 2194 	ld	d,(hl)
   6F5E C5            [11] 2195 	push	bc
   6F5F FD E1         [14] 2196 	pop	iy
   6F61 FD 7E 17      [19] 2197 	ld	a,23 (iy)
   6F64 DD 77 FE      [19] 2198 	ld	-2 (ix),a
   6F67 E1            [10] 2199 	pop	hl
   6F68 E5            [11] 2200 	push	hl
   6F69 5E            [ 7] 2201 	ld	e,(hl)
   6F6A 0A            [ 7] 2202 	ld	a,(bc)
   6F6B DD 77 FC      [19] 2203 	ld	-4 (ix),a
   6F6E 2A 80 63      [16] 2204 	ld	hl,(_mapa)
   6F71 E5            [11] 2205 	push	hl
   6F72 C5            [11] 2206 	push	bc
   6F73 D5            [11] 2207 	push	de
   6F74 33            [ 6] 2208 	inc	sp
   6F75 DD 56 FE      [19] 2209 	ld	d, -2 (ix)
   6F78 D5            [11] 2210 	push	de
   6F79 DD 7E FC      [19] 2211 	ld	a,-4 (ix)
   6F7C F5            [11] 2212 	push	af
   6F7D 33            [ 6] 2213 	inc	sp
   6F7E CD 28 48      [17] 2214 	call	_pathFinding
   6F81 21 08 00      [10] 2215 	ld	hl,#8
   6F84 39            [11] 2216 	add	hl,sp
   6F85 F9            [ 6] 2217 	ld	sp,hl
   6F86                    2218 00108$:
   6F86 DD F9         [10] 2219 	ld	sp, ix
   6F88 DD E1         [14] 2220 	pop	ix
   6F8A C9            [10] 2221 	ret
                           2222 ;src/main.c:459: void lookFor(TEnemy* enemy){
                           2223 ;	---------------------------------
                           2224 ; Function lookFor
                           2225 ; ---------------------------------
   6F8B                    2226 _lookFor::
   6F8B DD E5         [15] 2227 	push	ix
   6F8D DD 21 00 00   [14] 2228 	ld	ix,#0
   6F91 DD 39         [15] 2229 	add	ix,sp
                           2230 ;src/main.c:468: i16 difx = abs((i16)(enemy->x - prota.x));
   6F93 DD 4E 04      [19] 2231 	ld	c,4 (ix)
   6F96 DD 46 05      [19] 2232 	ld	b,5 (ix)
   6F99 0A            [ 7] 2233 	ld	a,(bc)
   6F9A 5F            [ 4] 2234 	ld	e,a
   6F9B 16 00         [ 7] 2235 	ld	d,#0x00
   6F9D 21 A4 62      [10] 2236 	ld	hl,#_prota+0
   6FA0 6E            [ 7] 2237 	ld	l,(hl)
   6FA1 26 00         [ 7] 2238 	ld	h,#0x00
   6FA3 7B            [ 4] 2239 	ld	a,e
   6FA4 95            [ 4] 2240 	sub	a, l
   6FA5 5F            [ 4] 2241 	ld	e,a
   6FA6 7A            [ 4] 2242 	ld	a,d
   6FA7 9C            [ 4] 2243 	sbc	a, h
   6FA8 57            [ 4] 2244 	ld	d,a
   6FA9 C5            [11] 2245 	push	bc
   6FAA D5            [11] 2246 	push	de
   6FAB CD 1C 4A      [17] 2247 	call	_abs
   6FAE F1            [10] 2248 	pop	af
   6FAF C1            [10] 2249 	pop	bc
                           2250 ;src/main.c:469: i16 dify = abs((i16)(enemy->y - prota.y));
   6FB0 69            [ 4] 2251 	ld	l, c
   6FB1 60            [ 4] 2252 	ld	h, b
   6FB2 23            [ 6] 2253 	inc	hl
   6FB3 5E            [ 7] 2254 	ld	e,(hl)
   6FB4 16 00         [ 7] 2255 	ld	d,#0x00
   6FB6 21 A5 62      [10] 2256 	ld	hl,#_prota+1
   6FB9 6E            [ 7] 2257 	ld	l,(hl)
   6FBA 26 00         [ 7] 2258 	ld	h,#0x00
   6FBC 7B            [ 4] 2259 	ld	a,e
   6FBD 95            [ 4] 2260 	sub	a, l
   6FBE 5F            [ 4] 2261 	ld	e,a
   6FBF 7A            [ 4] 2262 	ld	a,d
   6FC0 9C            [ 4] 2263 	sbc	a, h
   6FC1 57            [ 4] 2264 	ld	d,a
   6FC2 C5            [11] 2265 	push	bc
   6FC3 D5            [11] 2266 	push	de
   6FC4 CD 1C 4A      [17] 2267 	call	_abs
   6FC7 F1            [10] 2268 	pop	af
   6FC8 C1            [10] 2269 	pop	bc
                           2270 ;src/main.c:472: enemy->seen = NO;
   6FC9 21 12 00      [10] 2271 	ld	hl,#0x0012
   6FCC 09            [11] 2272 	add	hl,bc
   6FCD 36 00         [10] 2273 	ld	(hl),#0x00
                           2274 ;src/main.c:473: enemy->inRange = NO;
   6FCF 21 11 00      [10] 2275 	ld	hl,#0x0011
   6FD2 09            [11] 2276 	add	hl,bc
   6FD3 36 00         [10] 2277 	ld	(hl),#0x00
                           2278 ;src/main.c:474: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90);
   6FD5 21 18 5A      [10] 2279 	ld	hl,#0x5A18
   6FD8 E5            [11] 2280 	push	hl
   6FD9 21 00 C0      [10] 2281 	ld	hl,#0xC000
   6FDC E5            [11] 2282 	push	hl
   6FDD CD C1 5E      [17] 2283 	call	_cpct_getScreenPtr
   6FE0 DD E1         [14] 2284 	pop	ix
   6FE2 C9            [10] 2285 	ret
                           2286 ;src/main.c:487: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2287 ;	---------------------------------
                           2288 ; Function engage
                           2289 ; ---------------------------------
   6FE3                    2290 _engage::
   6FE3 DD E5         [15] 2291 	push	ix
   6FE5 DD 21 00 00   [14] 2292 	ld	ix,#0
   6FE9 DD 39         [15] 2293 	add	ix,sp
   6FEB 21 F3 FF      [10] 2294 	ld	hl,#-13
   6FEE 39            [11] 2295 	add	hl,sp
   6FEF F9            [ 6] 2296 	ld	sp,hl
                           2297 ;src/main.c:488: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   6FF0 DD 7E 04      [19] 2298 	ld	a,4 (ix)
   6FF3 DD 77 F7      [19] 2299 	ld	-9 (ix),a
   6FF6 DD 7E 05      [19] 2300 	ld	a,5 (ix)
   6FF9 DD 77 F8      [19] 2301 	ld	-8 (ix),a
   6FFC DD 6E F7      [19] 2302 	ld	l,-9 (ix)
   6FFF DD 66 F8      [19] 2303 	ld	h,-8 (ix)
   7002 4E            [ 7] 2304 	ld	c,(hl)
   7003 06 00         [ 7] 2305 	ld	b,#0x00
   7005 21 A4 62      [10] 2306 	ld	hl,#_prota+0
   7008 5E            [ 7] 2307 	ld	e,(hl)
   7009 16 00         [ 7] 2308 	ld	d,#0x00
   700B 79            [ 4] 2309 	ld	a,c
   700C 93            [ 4] 2310 	sub	a, e
   700D 4F            [ 4] 2311 	ld	c,a
   700E 78            [ 4] 2312 	ld	a,b
   700F 9A            [ 4] 2313 	sbc	a, d
   7010 47            [ 4] 2314 	ld	b,a
   7011 C5            [11] 2315 	push	bc
   7012 CD 1C 4A      [17] 2316 	call	_abs
   7015 F1            [10] 2317 	pop	af
   7016 4D            [ 4] 2318 	ld	c,l
                           2319 ;src/main.c:489: u8 dify = abs(enemy->y - prota.y);
   7017 DD 7E F7      [19] 2320 	ld	a,-9 (ix)
   701A C6 01         [ 7] 2321 	add	a, #0x01
   701C DD 77 F9      [19] 2322 	ld	-7 (ix),a
   701F DD 7E F8      [19] 2323 	ld	a,-8 (ix)
   7022 CE 00         [ 7] 2324 	adc	a, #0x00
   7024 DD 77 FA      [19] 2325 	ld	-6 (ix),a
   7027 DD 6E F9      [19] 2326 	ld	l,-7 (ix)
   702A DD 66 FA      [19] 2327 	ld	h,-6 (ix)
   702D 5E            [ 7] 2328 	ld	e,(hl)
   702E 16 00         [ 7] 2329 	ld	d,#0x00
   7030 21 A5 62      [10] 2330 	ld	hl,#_prota+1
   7033 6E            [ 7] 2331 	ld	l,(hl)
   7034 26 00         [ 7] 2332 	ld	h,#0x00
   7036 7B            [ 4] 2333 	ld	a,e
   7037 95            [ 4] 2334 	sub	a, l
   7038 5F            [ 4] 2335 	ld	e,a
   7039 7A            [ 4] 2336 	ld	a,d
   703A 9C            [ 4] 2337 	sbc	a, h
   703B 57            [ 4] 2338 	ld	d,a
   703C C5            [11] 2339 	push	bc
   703D D5            [11] 2340 	push	de
   703E CD 1C 4A      [17] 2341 	call	_abs
   7041 F1            [10] 2342 	pop	af
   7042 C1            [10] 2343 	pop	bc
                           2344 ;src/main.c:490: u8 dist = difx + dify; // manhattan
   7043 09            [11] 2345 	add	hl, bc
   7044 DD 75 F6      [19] 2346 	ld	-10 (ix),l
                           2347 ;src/main.c:492: u8 movX = 0;
   7047 DD 36 F5 00   [19] 2348 	ld	-11 (ix),#0x00
                           2349 ;src/main.c:493: u8 movY = 0;
   704B DD 36 F4 00   [19] 2350 	ld	-12 (ix),#0x00
                           2351 ;src/main.c:494: u8 mov = 0;
   704F DD 36 F3 00   [19] 2352 	ld	-13 (ix),#0x00
                           2353 ;src/main.c:496: if (enemy->y == dy) { // alineado en el eje x
   7053 DD 6E F9      [19] 2354 	ld	l,-7 (ix)
   7056 DD 66 FA      [19] 2355 	ld	h,-6 (ix)
   7059 7E            [ 7] 2356 	ld	a,(hl)
   705A DD 77 FB      [19] 2357 	ld	-5 (ix),a
                           2358 ;src/main.c:498: if (dist > 10) {
   705D 3E 0A         [ 7] 2359 	ld	a,#0x0A
   705F DD 96 F6      [19] 2360 	sub	a, -10 (ix)
   7062 3E 00         [ 7] 2361 	ld	a,#0x00
   7064 17            [ 4] 2362 	rla
   7065 DD 77 FC      [19] 2363 	ld	-4 (ix),a
                           2364 ;src/main.c:496: if (enemy->y == dy) { // alineado en el eje x
   7068 DD 7E 07      [19] 2365 	ld	a,7 (ix)
   706B DD 96 FB      [19] 2366 	sub	a, -5 (ix)
   706E C2 70 71      [10] 2367 	jp	NZ,00187$
                           2368 ;src/main.c:498: if (dist > 10) {
   7071 DD 7E FC      [19] 2369 	ld	a,-4 (ix)
   7074 B7            [ 4] 2370 	or	a, a
   7075 CA D4 76      [10] 2371 	jp	Z,00189$
                           2372 ;src/main.c:499: if (dx < enemy->x) { // izquierda
   7078 DD 6E F7      [19] 2373 	ld	l,-9 (ix)
   707B DD 66 F8      [19] 2374 	ld	h,-8 (ix)
   707E 46            [ 7] 2375 	ld	b,(hl)
   707F DD 7E 06      [19] 2376 	ld	a,6 (ix)
   7082 90            [ 4] 2377 	sub	a, b
   7083 30 72         [12] 2378 	jr	NC,00110$
                           2379 ;src/main.c:500: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   7085 05            [ 4] 2380 	dec	b
   7086 DD 7E FB      [19] 2381 	ld	a,-5 (ix)
   7089 F5            [11] 2382 	push	af
   708A 33            [ 6] 2383 	inc	sp
   708B C5            [11] 2384 	push	bc
   708C 33            [ 6] 2385 	inc	sp
   708D 2A 80 63      [16] 2386 	ld	hl,(_mapa)
   7090 E5            [11] 2387 	push	hl
   7091 CD D8 49      [17] 2388 	call	_getTilePtr
   7094 F1            [10] 2389 	pop	af
   7095 F1            [10] 2390 	pop	af
   7096 4E            [ 7] 2391 	ld	c,(hl)
   7097 3E 02         [ 7] 2392 	ld	a,#0x02
   7099 91            [ 4] 2393 	sub	a, c
   709A DA D4 76      [10] 2394 	jp	C,00189$
                           2395 ;src/main.c:501: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   709D DD 6E F9      [19] 2396 	ld	l,-7 (ix)
   70A0 DD 66 FA      [19] 2397 	ld	h,-6 (ix)
   70A3 7E            [ 7] 2398 	ld	a,(hl)
   70A4 C6 0B         [ 7] 2399 	add	a, #0x0B
   70A6 57            [ 4] 2400 	ld	d,a
   70A7 DD 6E F7      [19] 2401 	ld	l,-9 (ix)
   70AA DD 66 F8      [19] 2402 	ld	h,-8 (ix)
   70AD 46            [ 7] 2403 	ld	b,(hl)
   70AE 05            [ 4] 2404 	dec	b
   70AF D5            [11] 2405 	push	de
   70B0 33            [ 6] 2406 	inc	sp
   70B1 C5            [11] 2407 	push	bc
   70B2 33            [ 6] 2408 	inc	sp
   70B3 2A 80 63      [16] 2409 	ld	hl,(_mapa)
   70B6 E5            [11] 2410 	push	hl
   70B7 CD D8 49      [17] 2411 	call	_getTilePtr
   70BA F1            [10] 2412 	pop	af
   70BB F1            [10] 2413 	pop	af
   70BC 4E            [ 7] 2414 	ld	c,(hl)
   70BD 3E 02         [ 7] 2415 	ld	a,#0x02
   70BF 91            [ 4] 2416 	sub	a, c
   70C0 DA D4 76      [10] 2417 	jp	C,00189$
                           2418 ;src/main.c:502: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   70C3 DD 6E F9      [19] 2419 	ld	l,-7 (ix)
   70C6 DD 66 FA      [19] 2420 	ld	h,-6 (ix)
   70C9 7E            [ 7] 2421 	ld	a,(hl)
   70CA C6 16         [ 7] 2422 	add	a, #0x16
   70CC 57            [ 4] 2423 	ld	d,a
   70CD DD 6E F7      [19] 2424 	ld	l,-9 (ix)
   70D0 DD 66 F8      [19] 2425 	ld	h,-8 (ix)
   70D3 46            [ 7] 2426 	ld	b,(hl)
   70D4 05            [ 4] 2427 	dec	b
   70D5 D5            [11] 2428 	push	de
   70D6 33            [ 6] 2429 	inc	sp
   70D7 C5            [11] 2430 	push	bc
   70D8 33            [ 6] 2431 	inc	sp
   70D9 2A 80 63      [16] 2432 	ld	hl,(_mapa)
   70DC E5            [11] 2433 	push	hl
   70DD CD D8 49      [17] 2434 	call	_getTilePtr
   70E0 F1            [10] 2435 	pop	af
   70E1 F1            [10] 2436 	pop	af
   70E2 4E            [ 7] 2437 	ld	c,(hl)
   70E3 3E 02         [ 7] 2438 	ld	a,#0x02
   70E5 91            [ 4] 2439 	sub	a, c
   70E6 DA D4 76      [10] 2440 	jp	C,00189$
                           2441 ;src/main.c:503: moverEnemigoIzquierda(enemy);
   70E9 DD 6E F7      [19] 2442 	ld	l,-9 (ix)
   70EC DD 66 F8      [19] 2443 	ld	h,-8 (ix)
   70EF E5            [11] 2444 	push	hl
   70F0 CD 2F 6C      [17] 2445 	call	_moverEnemigoIzquierda
   70F3 F1            [10] 2446 	pop	af
                           2447 ;src/main.c:505: mov = 1;
   70F4 C3 D4 76      [10] 2448 	jp	00189$
   70F7                    2449 00110$:
                           2450 ;src/main.c:508: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   70F7 78            [ 4] 2451 	ld	a,b
   70F8 C6 05         [ 7] 2452 	add	a, #0x05
   70FA 47            [ 4] 2453 	ld	b,a
   70FB DD 7E FB      [19] 2454 	ld	a,-5 (ix)
   70FE F5            [11] 2455 	push	af
   70FF 33            [ 6] 2456 	inc	sp
   7100 C5            [11] 2457 	push	bc
   7101 33            [ 6] 2458 	inc	sp
   7102 2A 80 63      [16] 2459 	ld	hl,(_mapa)
   7105 E5            [11] 2460 	push	hl
   7106 CD D8 49      [17] 2461 	call	_getTilePtr
   7109 F1            [10] 2462 	pop	af
   710A F1            [10] 2463 	pop	af
   710B 4E            [ 7] 2464 	ld	c,(hl)
   710C 3E 02         [ 7] 2465 	ld	a,#0x02
   710E 91            [ 4] 2466 	sub	a, c
   710F DA D4 76      [10] 2467 	jp	C,00189$
                           2468 ;src/main.c:509: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   7112 DD 6E F9      [19] 2469 	ld	l,-7 (ix)
   7115 DD 66 FA      [19] 2470 	ld	h,-6 (ix)
   7118 7E            [ 7] 2471 	ld	a,(hl)
   7119 C6 0B         [ 7] 2472 	add	a, #0x0B
   711B 57            [ 4] 2473 	ld	d,a
   711C DD 6E F7      [19] 2474 	ld	l,-9 (ix)
   711F DD 66 F8      [19] 2475 	ld	h,-8 (ix)
   7122 7E            [ 7] 2476 	ld	a,(hl)
   7123 C6 05         [ 7] 2477 	add	a, #0x05
   7125 47            [ 4] 2478 	ld	b,a
   7126 D5            [11] 2479 	push	de
   7127 33            [ 6] 2480 	inc	sp
   7128 C5            [11] 2481 	push	bc
   7129 33            [ 6] 2482 	inc	sp
   712A 2A 80 63      [16] 2483 	ld	hl,(_mapa)
   712D E5            [11] 2484 	push	hl
   712E CD D8 49      [17] 2485 	call	_getTilePtr
   7131 F1            [10] 2486 	pop	af
   7132 F1            [10] 2487 	pop	af
   7133 4E            [ 7] 2488 	ld	c,(hl)
   7134 3E 02         [ 7] 2489 	ld	a,#0x02
   7136 91            [ 4] 2490 	sub	a, c
   7137 DA D4 76      [10] 2491 	jp	C,00189$
                           2492 ;src/main.c:510: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   713A DD 6E F9      [19] 2493 	ld	l,-7 (ix)
   713D DD 66 FA      [19] 2494 	ld	h,-6 (ix)
   7140 7E            [ 7] 2495 	ld	a,(hl)
   7141 C6 16         [ 7] 2496 	add	a, #0x16
   7143 57            [ 4] 2497 	ld	d,a
   7144 DD 6E F7      [19] 2498 	ld	l,-9 (ix)
   7147 DD 66 F8      [19] 2499 	ld	h,-8 (ix)
   714A 7E            [ 7] 2500 	ld	a,(hl)
   714B C6 05         [ 7] 2501 	add	a, #0x05
   714D 47            [ 4] 2502 	ld	b,a
   714E D5            [11] 2503 	push	de
   714F 33            [ 6] 2504 	inc	sp
   7150 C5            [11] 2505 	push	bc
   7151 33            [ 6] 2506 	inc	sp
   7152 2A 80 63      [16] 2507 	ld	hl,(_mapa)
   7155 E5            [11] 2508 	push	hl
   7156 CD D8 49      [17] 2509 	call	_getTilePtr
   7159 F1            [10] 2510 	pop	af
   715A F1            [10] 2511 	pop	af
   715B 4E            [ 7] 2512 	ld	c,(hl)
   715C 3E 02         [ 7] 2513 	ld	a,#0x02
   715E 91            [ 4] 2514 	sub	a, c
   715F DA D4 76      [10] 2515 	jp	C,00189$
                           2516 ;src/main.c:511: moverEnemigoDerecha(enemy);
   7162 DD 6E F7      [19] 2517 	ld	l,-9 (ix)
   7165 DD 66 F8      [19] 2518 	ld	h,-8 (ix)
   7168 E5            [11] 2519 	push	hl
   7169 CD 1F 6C      [17] 2520 	call	_moverEnemigoDerecha
   716C F1            [10] 2521 	pop	af
                           2522 ;src/main.c:513: mov = 1;
   716D C3 D4 76      [10] 2523 	jp	00189$
   7170                    2524 00187$:
                           2525 ;src/main.c:518: else if (enemy->x == dx) {
   7170 DD 6E F7      [19] 2526 	ld	l,-9 (ix)
   7173 DD 66 F8      [19] 2527 	ld	h,-8 (ix)
   7176 7E            [ 7] 2528 	ld	a,(hl)
   7177 DD 77 FD      [19] 2529 	ld	-3 (ix), a
   717A DD 96 06      [19] 2530 	sub	a, 6 (ix)
   717D C2 7A 72      [10] 2531 	jp	NZ,00184$
                           2532 ;src/main.c:520: if (dist > 10) {
   7180 DD 7E FC      [19] 2533 	ld	a,-4 (ix)
   7183 B7            [ 4] 2534 	or	a, a
   7184 CA D4 76      [10] 2535 	jp	Z,00189$
                           2536 ;src/main.c:521: if (dy < enemy->y) {
   7187 DD 7E 07      [19] 2537 	ld	a,7 (ix)
   718A DD 96 FB      [19] 2538 	sub	a, -5 (ix)
   718D 30 74         [12] 2539 	jr	NC,00123$
                           2540 ;src/main.c:522: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   718F DD 46 FB      [19] 2541 	ld	b,-5 (ix)
   7192 05            [ 4] 2542 	dec	b
   7193 05            [ 4] 2543 	dec	b
   7194 C5            [11] 2544 	push	bc
   7195 33            [ 6] 2545 	inc	sp
   7196 DD 7E FD      [19] 2546 	ld	a,-3 (ix)
   7199 F5            [11] 2547 	push	af
   719A 33            [ 6] 2548 	inc	sp
   719B 2A 80 63      [16] 2549 	ld	hl,(_mapa)
   719E E5            [11] 2550 	push	hl
   719F CD D8 49      [17] 2551 	call	_getTilePtr
   71A2 F1            [10] 2552 	pop	af
   71A3 F1            [10] 2553 	pop	af
   71A4 4E            [ 7] 2554 	ld	c,(hl)
   71A5 3E 02         [ 7] 2555 	ld	a,#0x02
   71A7 91            [ 4] 2556 	sub	a, c
   71A8 DA D4 76      [10] 2557 	jp	C,00189$
                           2558 ;src/main.c:523: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   71AB DD 6E F9      [19] 2559 	ld	l,-7 (ix)
   71AE DD 66 FA      [19] 2560 	ld	h,-6 (ix)
   71B1 46            [ 7] 2561 	ld	b,(hl)
   71B2 05            [ 4] 2562 	dec	b
   71B3 05            [ 4] 2563 	dec	b
   71B4 DD 6E F7      [19] 2564 	ld	l,-9 (ix)
   71B7 DD 66 F8      [19] 2565 	ld	h,-8 (ix)
   71BA 56            [ 7] 2566 	ld	d,(hl)
   71BB 14            [ 4] 2567 	inc	d
   71BC 14            [ 4] 2568 	inc	d
   71BD 4A            [ 4] 2569 	ld	c, d
   71BE C5            [11] 2570 	push	bc
   71BF 2A 80 63      [16] 2571 	ld	hl,(_mapa)
   71C2 E5            [11] 2572 	push	hl
   71C3 CD D8 49      [17] 2573 	call	_getTilePtr
   71C6 F1            [10] 2574 	pop	af
   71C7 F1            [10] 2575 	pop	af
   71C8 4E            [ 7] 2576 	ld	c,(hl)
   71C9 3E 02         [ 7] 2577 	ld	a,#0x02
   71CB 91            [ 4] 2578 	sub	a, c
   71CC DA D4 76      [10] 2579 	jp	C,00189$
                           2580 ;src/main.c:524: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   71CF DD 6E F9      [19] 2581 	ld	l,-7 (ix)
   71D2 DD 66 FA      [19] 2582 	ld	h,-6 (ix)
   71D5 46            [ 7] 2583 	ld	b,(hl)
   71D6 05            [ 4] 2584 	dec	b
   71D7 05            [ 4] 2585 	dec	b
   71D8 DD 6E F7      [19] 2586 	ld	l,-9 (ix)
   71DB DD 66 F8      [19] 2587 	ld	h,-8 (ix)
   71DE 7E            [ 7] 2588 	ld	a,(hl)
   71DF C6 04         [ 7] 2589 	add	a, #0x04
   71E1 C5            [11] 2590 	push	bc
   71E2 33            [ 6] 2591 	inc	sp
   71E3 F5            [11] 2592 	push	af
   71E4 33            [ 6] 2593 	inc	sp
   71E5 2A 80 63      [16] 2594 	ld	hl,(_mapa)
   71E8 E5            [11] 2595 	push	hl
   71E9 CD D8 49      [17] 2596 	call	_getTilePtr
   71EC F1            [10] 2597 	pop	af
   71ED F1            [10] 2598 	pop	af
   71EE 4E            [ 7] 2599 	ld	c,(hl)
   71EF 3E 02         [ 7] 2600 	ld	a,#0x02
   71F1 91            [ 4] 2601 	sub	a, c
   71F2 DA D4 76      [10] 2602 	jp	C,00189$
                           2603 ;src/main.c:525: moverEnemigoArriba(enemy);
   71F5 DD 6E F7      [19] 2604 	ld	l,-9 (ix)
   71F8 DD 66 F8      [19] 2605 	ld	h,-8 (ix)
   71FB E5            [11] 2606 	push	hl
   71FC CD E1 6B      [17] 2607 	call	_moverEnemigoArriba
   71FF F1            [10] 2608 	pop	af
                           2609 ;src/main.c:527: mov = 1;
   7200 C3 D4 76      [10] 2610 	jp	00189$
   7203                    2611 00123$:
                           2612 ;src/main.c:530: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7203 DD 7E FB      [19] 2613 	ld	a,-5 (ix)
   7206 C6 18         [ 7] 2614 	add	a, #0x18
   7208 47            [ 4] 2615 	ld	b,a
   7209 C5            [11] 2616 	push	bc
   720A 33            [ 6] 2617 	inc	sp
   720B DD 7E FD      [19] 2618 	ld	a,-3 (ix)
   720E F5            [11] 2619 	push	af
   720F 33            [ 6] 2620 	inc	sp
   7210 2A 80 63      [16] 2621 	ld	hl,(_mapa)
   7213 E5            [11] 2622 	push	hl
   7214 CD D8 49      [17] 2623 	call	_getTilePtr
   7217 F1            [10] 2624 	pop	af
   7218 F1            [10] 2625 	pop	af
   7219 4E            [ 7] 2626 	ld	c,(hl)
   721A 3E 02         [ 7] 2627 	ld	a,#0x02
   721C 91            [ 4] 2628 	sub	a, c
   721D DA D4 76      [10] 2629 	jp	C,00189$
                           2630 ;src/main.c:531: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7220 DD 6E F9      [19] 2631 	ld	l,-7 (ix)
   7223 DD 66 FA      [19] 2632 	ld	h,-6 (ix)
   7226 7E            [ 7] 2633 	ld	a,(hl)
   7227 C6 18         [ 7] 2634 	add	a, #0x18
   7229 47            [ 4] 2635 	ld	b,a
   722A DD 6E F7      [19] 2636 	ld	l,-9 (ix)
   722D DD 66 F8      [19] 2637 	ld	h,-8 (ix)
   7230 56            [ 7] 2638 	ld	d,(hl)
   7231 14            [ 4] 2639 	inc	d
   7232 14            [ 4] 2640 	inc	d
   7233 4A            [ 4] 2641 	ld	c, d
   7234 C5            [11] 2642 	push	bc
   7235 2A 80 63      [16] 2643 	ld	hl,(_mapa)
   7238 E5            [11] 2644 	push	hl
   7239 CD D8 49      [17] 2645 	call	_getTilePtr
   723C F1            [10] 2646 	pop	af
   723D F1            [10] 2647 	pop	af
   723E 4E            [ 7] 2648 	ld	c,(hl)
   723F 3E 02         [ 7] 2649 	ld	a,#0x02
   7241 91            [ 4] 2650 	sub	a, c
   7242 DA D4 76      [10] 2651 	jp	C,00189$
                           2652 ;src/main.c:532: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7245 DD 6E F9      [19] 2653 	ld	l,-7 (ix)
   7248 DD 66 FA      [19] 2654 	ld	h,-6 (ix)
   724B 7E            [ 7] 2655 	ld	a,(hl)
   724C C6 18         [ 7] 2656 	add	a, #0x18
   724E 47            [ 4] 2657 	ld	b,a
   724F DD 6E F7      [19] 2658 	ld	l,-9 (ix)
   7252 DD 66 F8      [19] 2659 	ld	h,-8 (ix)
   7255 7E            [ 7] 2660 	ld	a,(hl)
   7256 C6 04         [ 7] 2661 	add	a, #0x04
   7258 C5            [11] 2662 	push	bc
   7259 33            [ 6] 2663 	inc	sp
   725A F5            [11] 2664 	push	af
   725B 33            [ 6] 2665 	inc	sp
   725C 2A 80 63      [16] 2666 	ld	hl,(_mapa)
   725F E5            [11] 2667 	push	hl
   7260 CD D8 49      [17] 2668 	call	_getTilePtr
   7263 F1            [10] 2669 	pop	af
   7264 F1            [10] 2670 	pop	af
   7265 4E            [ 7] 2671 	ld	c,(hl)
   7266 3E 02         [ 7] 2672 	ld	a,#0x02
   7268 91            [ 4] 2673 	sub	a, c
   7269 DA D4 76      [10] 2674 	jp	C,00189$
                           2675 ;src/main.c:533: moverEnemigoAbajo(enemy);
   726C DD 6E F7      [19] 2676 	ld	l,-9 (ix)
   726F DD 66 F8      [19] 2677 	ld	h,-8 (ix)
   7272 E5            [11] 2678 	push	hl
   7273 CD 00 6C      [17] 2679 	call	_moverEnemigoAbajo
   7276 F1            [10] 2680 	pop	af
                           2681 ;src/main.c:535: mov = 1;
   7277 C3 D4 76      [10] 2682 	jp	00189$
   727A                    2683 00184$:
                           2684 ;src/main.c:541: if (dist > 20) {
   727A 3E 14         [ 7] 2685 	ld	a,#0x14
   727C DD 96 F6      [19] 2686 	sub	a, -10 (ix)
   727F D2 D4 76      [10] 2687 	jp	NC,00189$
                           2688 ;src/main.c:542: if (dx < enemy->x) {
   7282 DD 7E 06      [19] 2689 	ld	a,6 (ix)
   7285 DD 96 FD      [19] 2690 	sub	a, -3 (ix)
   7288 D2 0A 73      [10] 2691 	jp	NC,00136$
                           2692 ;src/main.c:543: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   728B DD 46 FD      [19] 2693 	ld	b,-3 (ix)
   728E 05            [ 4] 2694 	dec	b
   728F DD 7E FB      [19] 2695 	ld	a,-5 (ix)
   7292 F5            [11] 2696 	push	af
   7293 33            [ 6] 2697 	inc	sp
   7294 C5            [11] 2698 	push	bc
   7295 33            [ 6] 2699 	inc	sp
   7296 2A 80 63      [16] 2700 	ld	hl,(_mapa)
   7299 E5            [11] 2701 	push	hl
   729A CD D8 49      [17] 2702 	call	_getTilePtr
   729D F1            [10] 2703 	pop	af
   729E F1            [10] 2704 	pop	af
   729F 4E            [ 7] 2705 	ld	c,(hl)
   72A0 3E 02         [ 7] 2706 	ld	a,#0x02
   72A2 91            [ 4] 2707 	sub	a, c
   72A3 DA 87 73      [10] 2708 	jp	C,00137$
                           2709 ;src/main.c:544: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   72A6 DD 6E F9      [19] 2710 	ld	l,-7 (ix)
   72A9 DD 66 FA      [19] 2711 	ld	h,-6 (ix)
   72AC 7E            [ 7] 2712 	ld	a,(hl)
   72AD C6 0B         [ 7] 2713 	add	a, #0x0B
   72AF 4F            [ 4] 2714 	ld	c,a
   72B0 DD 6E F7      [19] 2715 	ld	l,-9 (ix)
   72B3 DD 66 F8      [19] 2716 	ld	h,-8 (ix)
   72B6 46            [ 7] 2717 	ld	b,(hl)
   72B7 05            [ 4] 2718 	dec	b
   72B8 79            [ 4] 2719 	ld	a,c
   72B9 F5            [11] 2720 	push	af
   72BA 33            [ 6] 2721 	inc	sp
   72BB C5            [11] 2722 	push	bc
   72BC 33            [ 6] 2723 	inc	sp
   72BD 2A 80 63      [16] 2724 	ld	hl,(_mapa)
   72C0 E5            [11] 2725 	push	hl
   72C1 CD D8 49      [17] 2726 	call	_getTilePtr
   72C4 F1            [10] 2727 	pop	af
   72C5 F1            [10] 2728 	pop	af
   72C6 4E            [ 7] 2729 	ld	c,(hl)
   72C7 3E 02         [ 7] 2730 	ld	a,#0x02
   72C9 91            [ 4] 2731 	sub	a, c
   72CA DA 87 73      [10] 2732 	jp	C,00137$
                           2733 ;src/main.c:545: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   72CD DD 6E F9      [19] 2734 	ld	l,-7 (ix)
   72D0 DD 66 FA      [19] 2735 	ld	h,-6 (ix)
   72D3 7E            [ 7] 2736 	ld	a,(hl)
   72D4 C6 16         [ 7] 2737 	add	a, #0x16
   72D6 4F            [ 4] 2738 	ld	c,a
   72D7 DD 6E F7      [19] 2739 	ld	l,-9 (ix)
   72DA DD 66 F8      [19] 2740 	ld	h,-8 (ix)
   72DD 46            [ 7] 2741 	ld	b,(hl)
   72DE 05            [ 4] 2742 	dec	b
   72DF 79            [ 4] 2743 	ld	a,c
   72E0 F5            [11] 2744 	push	af
   72E1 33            [ 6] 2745 	inc	sp
   72E2 C5            [11] 2746 	push	bc
   72E3 33            [ 6] 2747 	inc	sp
   72E4 2A 80 63      [16] 2748 	ld	hl,(_mapa)
   72E7 E5            [11] 2749 	push	hl
   72E8 CD D8 49      [17] 2750 	call	_getTilePtr
   72EB F1            [10] 2751 	pop	af
   72EC F1            [10] 2752 	pop	af
   72ED 4E            [ 7] 2753 	ld	c,(hl)
   72EE 3E 02         [ 7] 2754 	ld	a,#0x02
   72F0 91            [ 4] 2755 	sub	a, c
   72F1 DA 87 73      [10] 2756 	jp	C,00137$
                           2757 ;src/main.c:546: moverEnemigoIzquierda(enemy);
   72F4 DD 6E F7      [19] 2758 	ld	l,-9 (ix)
   72F7 DD 66 F8      [19] 2759 	ld	h,-8 (ix)
   72FA E5            [11] 2760 	push	hl
   72FB CD 2F 6C      [17] 2761 	call	_moverEnemigoIzquierda
   72FE F1            [10] 2762 	pop	af
                           2763 ;src/main.c:547: movX = 1;
   72FF DD 36 F5 01   [19] 2764 	ld	-11 (ix),#0x01
                           2765 ;src/main.c:548: mov = 1;
   7303 DD 36 F3 01   [19] 2766 	ld	-13 (ix),#0x01
   7307 C3 87 73      [10] 2767 	jp	00137$
   730A                    2768 00136$:
                           2769 ;src/main.c:551: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   730A DD 7E FD      [19] 2770 	ld	a,-3 (ix)
   730D C6 05         [ 7] 2771 	add	a, #0x05
   730F 47            [ 4] 2772 	ld	b,a
   7310 DD 7E FB      [19] 2773 	ld	a,-5 (ix)
   7313 F5            [11] 2774 	push	af
   7314 33            [ 6] 2775 	inc	sp
   7315 C5            [11] 2776 	push	bc
   7316 33            [ 6] 2777 	inc	sp
   7317 2A 80 63      [16] 2778 	ld	hl,(_mapa)
   731A E5            [11] 2779 	push	hl
   731B CD D8 49      [17] 2780 	call	_getTilePtr
   731E F1            [10] 2781 	pop	af
   731F F1            [10] 2782 	pop	af
   7320 4E            [ 7] 2783 	ld	c,(hl)
   7321 3E 02         [ 7] 2784 	ld	a,#0x02
   7323 91            [ 4] 2785 	sub	a, c
   7324 38 61         [12] 2786 	jr	C,00137$
                           2787 ;src/main.c:552: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   7326 DD 6E F9      [19] 2788 	ld	l,-7 (ix)
   7329 DD 66 FA      [19] 2789 	ld	h,-6 (ix)
   732C 7E            [ 7] 2790 	ld	a,(hl)
   732D C6 0B         [ 7] 2791 	add	a, #0x0B
   732F 57            [ 4] 2792 	ld	d,a
   7330 DD 6E F7      [19] 2793 	ld	l,-9 (ix)
   7333 DD 66 F8      [19] 2794 	ld	h,-8 (ix)
   7336 7E            [ 7] 2795 	ld	a,(hl)
   7337 C6 05         [ 7] 2796 	add	a, #0x05
   7339 47            [ 4] 2797 	ld	b,a
   733A D5            [11] 2798 	push	de
   733B 33            [ 6] 2799 	inc	sp
   733C C5            [11] 2800 	push	bc
   733D 33            [ 6] 2801 	inc	sp
   733E 2A 80 63      [16] 2802 	ld	hl,(_mapa)
   7341 E5            [11] 2803 	push	hl
   7342 CD D8 49      [17] 2804 	call	_getTilePtr
   7345 F1            [10] 2805 	pop	af
   7346 F1            [10] 2806 	pop	af
   7347 4E            [ 7] 2807 	ld	c,(hl)
   7348 3E 02         [ 7] 2808 	ld	a,#0x02
   734A 91            [ 4] 2809 	sub	a, c
   734B 38 3A         [12] 2810 	jr	C,00137$
                           2811 ;src/main.c:553: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   734D DD 6E F9      [19] 2812 	ld	l,-7 (ix)
   7350 DD 66 FA      [19] 2813 	ld	h,-6 (ix)
   7353 7E            [ 7] 2814 	ld	a,(hl)
   7354 C6 16         [ 7] 2815 	add	a, #0x16
   7356 57            [ 4] 2816 	ld	d,a
   7357 DD 6E F7      [19] 2817 	ld	l,-9 (ix)
   735A DD 66 F8      [19] 2818 	ld	h,-8 (ix)
   735D 7E            [ 7] 2819 	ld	a,(hl)
   735E C6 05         [ 7] 2820 	add	a, #0x05
   7360 47            [ 4] 2821 	ld	b,a
   7361 D5            [11] 2822 	push	de
   7362 33            [ 6] 2823 	inc	sp
   7363 C5            [11] 2824 	push	bc
   7364 33            [ 6] 2825 	inc	sp
   7365 2A 80 63      [16] 2826 	ld	hl,(_mapa)
   7368 E5            [11] 2827 	push	hl
   7369 CD D8 49      [17] 2828 	call	_getTilePtr
   736C F1            [10] 2829 	pop	af
   736D F1            [10] 2830 	pop	af
   736E 4E            [ 7] 2831 	ld	c,(hl)
   736F 3E 02         [ 7] 2832 	ld	a,#0x02
   7371 91            [ 4] 2833 	sub	a, c
   7372 38 13         [12] 2834 	jr	C,00137$
                           2835 ;src/main.c:554: moverEnemigoDerecha(enemy);
   7374 DD 6E F7      [19] 2836 	ld	l,-9 (ix)
   7377 DD 66 F8      [19] 2837 	ld	h,-8 (ix)
   737A E5            [11] 2838 	push	hl
   737B CD 1F 6C      [17] 2839 	call	_moverEnemigoDerecha
   737E F1            [10] 2840 	pop	af
                           2841 ;src/main.c:555: movX = 1;
   737F DD 36 F5 01   [19] 2842 	ld	-11 (ix),#0x01
                           2843 ;src/main.c:556: mov = 1;
   7383 DD 36 F3 01   [19] 2844 	ld	-13 (ix),#0x01
   7387                    2845 00137$:
                           2846 ;src/main.c:559: if (dy < enemy->y) {
   7387 DD 6E F9      [19] 2847 	ld	l,-7 (ix)
   738A DD 66 FA      [19] 2848 	ld	h,-6 (ix)
   738D 7E            [ 7] 2849 	ld	a,(hl)
   738E DD 77 FD      [19] 2850 	ld	-3 (ix),a
                           2851 ;src/main.c:488: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7391 DD 6E F7      [19] 2852 	ld	l,-9 (ix)
   7394 DD 66 F8      [19] 2853 	ld	h,-8 (ix)
   7397 7E            [ 7] 2854 	ld	a,(hl)
   7398 DD 77 FC      [19] 2855 	ld	-4 (ix),a
                           2856 ;src/main.c:559: if (dy < enemy->y) {
   739B DD 7E 07      [19] 2857 	ld	a,7 (ix)
   739E DD 96 FD      [19] 2858 	sub	a, -3 (ix)
   73A1 D2 37 74      [10] 2859 	jp	NC,00147$
                           2860 ;src/main.c:560: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   73A4 DD 7E FD      [19] 2861 	ld	a,-3 (ix)
   73A7 C6 FE         [ 7] 2862 	add	a,#0xFE
   73A9 DD 77 FB      [19] 2863 	ld	-5 (ix), a
   73AC F5            [11] 2864 	push	af
   73AD 33            [ 6] 2865 	inc	sp
   73AE DD 7E FC      [19] 2866 	ld	a,-4 (ix)
   73B1 F5            [11] 2867 	push	af
   73B2 33            [ 6] 2868 	inc	sp
   73B3 2A 80 63      [16] 2869 	ld	hl,(_mapa)
   73B6 E5            [11] 2870 	push	hl
   73B7 CD D8 49      [17] 2871 	call	_getTilePtr
   73BA F1            [10] 2872 	pop	af
   73BB F1            [10] 2873 	pop	af
   73BC DD 74 FF      [19] 2874 	ld	-1 (ix),h
   73BF DD 75 FE      [19] 2875 	ld	-2 (ix), l
   73C2 DD 66 FF      [19] 2876 	ld	h,-1 (ix)
   73C5 4E            [ 7] 2877 	ld	c,(hl)
   73C6 3E 02         [ 7] 2878 	ld	a,#0x02
   73C8 91            [ 4] 2879 	sub	a, c
   73C9 DA B2 74      [10] 2880 	jp	C,00148$
                           2881 ;src/main.c:561: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   73CC DD 6E F9      [19] 2882 	ld	l,-7 (ix)
   73CF DD 66 FA      [19] 2883 	ld	h,-6 (ix)
   73D2 7E            [ 7] 2884 	ld	a,(hl)
   73D3 DD 77 FE      [19] 2885 	ld	-2 (ix), a
   73D6 C6 FE         [ 7] 2886 	add	a,#0xFE
   73D8 DD 77 FE      [19] 2887 	ld	-2 (ix),a
   73DB DD 6E F7      [19] 2888 	ld	l,-9 (ix)
   73DE DD 66 F8      [19] 2889 	ld	h,-8 (ix)
   73E1 46            [ 7] 2890 	ld	b,(hl)
   73E2 04            [ 4] 2891 	inc	b
   73E3 04            [ 4] 2892 	inc	b
   73E4 DD 7E FE      [19] 2893 	ld	a,-2 (ix)
   73E7 F5            [11] 2894 	push	af
   73E8 33            [ 6] 2895 	inc	sp
   73E9 C5            [11] 2896 	push	bc
   73EA 33            [ 6] 2897 	inc	sp
   73EB 2A 80 63      [16] 2898 	ld	hl,(_mapa)
   73EE E5            [11] 2899 	push	hl
   73EF CD D8 49      [17] 2900 	call	_getTilePtr
   73F2 F1            [10] 2901 	pop	af
   73F3 F1            [10] 2902 	pop	af
   73F4 4E            [ 7] 2903 	ld	c,(hl)
   73F5 3E 02         [ 7] 2904 	ld	a,#0x02
   73F7 91            [ 4] 2905 	sub	a, c
   73F8 DA B2 74      [10] 2906 	jp	C,00148$
                           2907 ;src/main.c:562: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   73FB DD 6E F9      [19] 2908 	ld	l,-7 (ix)
   73FE DD 66 FA      [19] 2909 	ld	h,-6 (ix)
   7401 46            [ 7] 2910 	ld	b,(hl)
   7402 05            [ 4] 2911 	dec	b
   7403 05            [ 4] 2912 	dec	b
   7404 DD 6E F7      [19] 2913 	ld	l,-9 (ix)
   7407 DD 66 F8      [19] 2914 	ld	h,-8 (ix)
   740A 7E            [ 7] 2915 	ld	a,(hl)
   740B C6 04         [ 7] 2916 	add	a, #0x04
   740D C5            [11] 2917 	push	bc
   740E 33            [ 6] 2918 	inc	sp
   740F F5            [11] 2919 	push	af
   7410 33            [ 6] 2920 	inc	sp
   7411 2A 80 63      [16] 2921 	ld	hl,(_mapa)
   7414 E5            [11] 2922 	push	hl
   7415 CD D8 49      [17] 2923 	call	_getTilePtr
   7418 F1            [10] 2924 	pop	af
   7419 F1            [10] 2925 	pop	af
   741A 4E            [ 7] 2926 	ld	c,(hl)
   741B 3E 02         [ 7] 2927 	ld	a,#0x02
   741D 91            [ 4] 2928 	sub	a, c
   741E DA B2 74      [10] 2929 	jp	C,00148$
                           2930 ;src/main.c:563: moverEnemigoArriba(enemy);
   7421 DD 6E F7      [19] 2931 	ld	l,-9 (ix)
   7424 DD 66 F8      [19] 2932 	ld	h,-8 (ix)
   7427 E5            [11] 2933 	push	hl
   7428 CD E1 6B      [17] 2934 	call	_moverEnemigoArriba
   742B F1            [10] 2935 	pop	af
                           2936 ;src/main.c:564: movY = 1;
   742C DD 36 F4 01   [19] 2937 	ld	-12 (ix),#0x01
                           2938 ;src/main.c:565: mov = 1;
   7430 DD 36 F3 01   [19] 2939 	ld	-13 (ix),#0x01
   7434 C3 B2 74      [10] 2940 	jp	00148$
   7437                    2941 00147$:
                           2942 ;src/main.c:568: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7437 DD 7E FD      [19] 2943 	ld	a,-3 (ix)
   743A C6 18         [ 7] 2944 	add	a, #0x18
   743C 47            [ 4] 2945 	ld	b,a
   743D C5            [11] 2946 	push	bc
   743E 33            [ 6] 2947 	inc	sp
   743F DD 7E FC      [19] 2948 	ld	a,-4 (ix)
   7442 F5            [11] 2949 	push	af
   7443 33            [ 6] 2950 	inc	sp
   7444 2A 80 63      [16] 2951 	ld	hl,(_mapa)
   7447 E5            [11] 2952 	push	hl
   7448 CD D8 49      [17] 2953 	call	_getTilePtr
   744B F1            [10] 2954 	pop	af
   744C F1            [10] 2955 	pop	af
   744D 4E            [ 7] 2956 	ld	c,(hl)
   744E 3E 02         [ 7] 2957 	ld	a,#0x02
   7450 91            [ 4] 2958 	sub	a, c
   7451 38 5F         [12] 2959 	jr	C,00148$
                           2960 ;src/main.c:569: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7453 DD 6E F9      [19] 2961 	ld	l,-7 (ix)
   7456 DD 66 FA      [19] 2962 	ld	h,-6 (ix)
   7459 7E            [ 7] 2963 	ld	a,(hl)
   745A C6 18         [ 7] 2964 	add	a, #0x18
   745C 57            [ 4] 2965 	ld	d,a
   745D DD 6E F7      [19] 2966 	ld	l,-9 (ix)
   7460 DD 66 F8      [19] 2967 	ld	h,-8 (ix)
   7463 46            [ 7] 2968 	ld	b,(hl)
   7464 04            [ 4] 2969 	inc	b
   7465 04            [ 4] 2970 	inc	b
   7466 D5            [11] 2971 	push	de
   7467 33            [ 6] 2972 	inc	sp
   7468 C5            [11] 2973 	push	bc
   7469 33            [ 6] 2974 	inc	sp
   746A 2A 80 63      [16] 2975 	ld	hl,(_mapa)
   746D E5            [11] 2976 	push	hl
   746E CD D8 49      [17] 2977 	call	_getTilePtr
   7471 F1            [10] 2978 	pop	af
   7472 F1            [10] 2979 	pop	af
   7473 4E            [ 7] 2980 	ld	c,(hl)
   7474 3E 02         [ 7] 2981 	ld	a,#0x02
   7476 91            [ 4] 2982 	sub	a, c
   7477 38 39         [12] 2983 	jr	C,00148$
                           2984 ;src/main.c:570: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7479 DD 6E F9      [19] 2985 	ld	l,-7 (ix)
   747C DD 66 FA      [19] 2986 	ld	h,-6 (ix)
   747F 7E            [ 7] 2987 	ld	a,(hl)
   7480 C6 18         [ 7] 2988 	add	a, #0x18
   7482 47            [ 4] 2989 	ld	b,a
   7483 DD 6E F7      [19] 2990 	ld	l,-9 (ix)
   7486 DD 66 F8      [19] 2991 	ld	h,-8 (ix)
   7489 7E            [ 7] 2992 	ld	a,(hl)
   748A C6 04         [ 7] 2993 	add	a, #0x04
   748C C5            [11] 2994 	push	bc
   748D 33            [ 6] 2995 	inc	sp
   748E F5            [11] 2996 	push	af
   748F 33            [ 6] 2997 	inc	sp
   7490 2A 80 63      [16] 2998 	ld	hl,(_mapa)
   7493 E5            [11] 2999 	push	hl
   7494 CD D8 49      [17] 3000 	call	_getTilePtr
   7497 F1            [10] 3001 	pop	af
   7498 F1            [10] 3002 	pop	af
   7499 4E            [ 7] 3003 	ld	c,(hl)
   749A 3E 02         [ 7] 3004 	ld	a,#0x02
   749C 91            [ 4] 3005 	sub	a, c
   749D 38 13         [12] 3006 	jr	C,00148$
                           3007 ;src/main.c:571: moverEnemigoAbajo(enemy);
   749F DD 6E F7      [19] 3008 	ld	l,-9 (ix)
   74A2 DD 66 F8      [19] 3009 	ld	h,-8 (ix)
   74A5 E5            [11] 3010 	push	hl
   74A6 CD 00 6C      [17] 3011 	call	_moverEnemigoAbajo
   74A9 F1            [10] 3012 	pop	af
                           3013 ;src/main.c:572: movY = 1;
   74AA DD 36 F4 01   [19] 3014 	ld	-12 (ix),#0x01
                           3015 ;src/main.c:573: mov = 1;
   74AE DD 36 F3 01   [19] 3016 	ld	-13 (ix),#0x01
   74B2                    3017 00148$:
                           3018 ;src/main.c:576: if (!mov) {
   74B2 DD 7E F3      [19] 3019 	ld	a,-13 (ix)
   74B5 B7            [ 4] 3020 	or	a, a
   74B6 C2 D4 76      [10] 3021 	jp	NZ,00189$
                           3022 ;src/main.c:577: if (!movX) {
   74B9 DD 7E F5      [19] 3023 	ld	a,-11 (ix)
   74BC B7            [ 4] 3024 	or	a, a
   74BD C2 C4 75      [10] 3025 	jp	NZ,00163$
                           3026 ;src/main.c:578: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   74C0 DD 6E F9      [19] 3027 	ld	l,-7 (ix)
   74C3 DD 66 FA      [19] 3028 	ld	h,-6 (ix)
   74C6 5E            [ 7] 3029 	ld	e,(hl)
                           3030 ;src/main.c:488: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   74C7 DD 6E F7      [19] 3031 	ld	l,-9 (ix)
   74CA DD 66 F8      [19] 3032 	ld	h,-8 (ix)
   74CD 4E            [ 7] 3033 	ld	c,(hl)
                           3034 ;src/main.c:578: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   74CE 3E 70         [ 7] 3035 	ld	a,#0x70
   74D0 93            [ 4] 3036 	sub	a, e
   74D1 30 7C         [12] 3037 	jr	NC,00160$
                           3038 ;src/main.c:579: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   74D3 7B            [ 4] 3039 	ld	a,e
   74D4 C6 18         [ 7] 3040 	add	a, #0x18
   74D6 47            [ 4] 3041 	ld	b,a
   74D7 C5            [11] 3042 	push	bc
   74D8 2A 80 63      [16] 3043 	ld	hl,(_mapa)
   74DB E5            [11] 3044 	push	hl
   74DC CD D8 49      [17] 3045 	call	_getTilePtr
   74DF F1            [10] 3046 	pop	af
   74E0 F1            [10] 3047 	pop	af
   74E1 4E            [ 7] 3048 	ld	c,(hl)
   74E2 3E 02         [ 7] 3049 	ld	a,#0x02
   74E4 91            [ 4] 3050 	sub	a, c
   74E5 38 5B         [12] 3051 	jr	C,00150$
                           3052 ;src/main.c:580: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   74E7 DD 6E F9      [19] 3053 	ld	l,-7 (ix)
   74EA DD 66 FA      [19] 3054 	ld	h,-6 (ix)
   74ED 7E            [ 7] 3055 	ld	a,(hl)
   74EE C6 18         [ 7] 3056 	add	a, #0x18
   74F0 57            [ 4] 3057 	ld	d,a
   74F1 DD 6E F7      [19] 3058 	ld	l,-9 (ix)
   74F4 DD 66 F8      [19] 3059 	ld	h,-8 (ix)
   74F7 4E            [ 7] 3060 	ld	c,(hl)
   74F8 41            [ 4] 3061 	ld	b,c
   74F9 04            [ 4] 3062 	inc	b
   74FA 04            [ 4] 3063 	inc	b
   74FB D5            [11] 3064 	push	de
   74FC 33            [ 6] 3065 	inc	sp
   74FD C5            [11] 3066 	push	bc
   74FE 33            [ 6] 3067 	inc	sp
   74FF 2A 80 63      [16] 3068 	ld	hl,(_mapa)
   7502 E5            [11] 3069 	push	hl
   7503 CD D8 49      [17] 3070 	call	_getTilePtr
   7506 F1            [10] 3071 	pop	af
   7507 F1            [10] 3072 	pop	af
   7508 4E            [ 7] 3073 	ld	c,(hl)
   7509 3E 02         [ 7] 3074 	ld	a,#0x02
   750B 91            [ 4] 3075 	sub	a, c
   750C 38 34         [12] 3076 	jr	C,00150$
                           3077 ;src/main.c:581: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   750E DD 6E F9      [19] 3078 	ld	l,-7 (ix)
   7511 DD 66 FA      [19] 3079 	ld	h,-6 (ix)
   7514 7E            [ 7] 3080 	ld	a,(hl)
   7515 C6 18         [ 7] 3081 	add	a, #0x18
   7517 47            [ 4] 3082 	ld	b,a
   7518 DD 6E F7      [19] 3083 	ld	l,-9 (ix)
   751B DD 66 F8      [19] 3084 	ld	h,-8 (ix)
   751E 7E            [ 7] 3085 	ld	a,(hl)
   751F C6 04         [ 7] 3086 	add	a, #0x04
   7521 C5            [11] 3087 	push	bc
   7522 33            [ 6] 3088 	inc	sp
   7523 F5            [11] 3089 	push	af
   7524 33            [ 6] 3090 	inc	sp
   7525 2A 80 63      [16] 3091 	ld	hl,(_mapa)
   7528 E5            [11] 3092 	push	hl
   7529 CD D8 49      [17] 3093 	call	_getTilePtr
   752C F1            [10] 3094 	pop	af
   752D F1            [10] 3095 	pop	af
   752E 4E            [ 7] 3096 	ld	c,(hl)
   752F 3E 02         [ 7] 3097 	ld	a,#0x02
   7531 91            [ 4] 3098 	sub	a, c
   7532 38 0E         [12] 3099 	jr	C,00150$
                           3100 ;src/main.c:582: moverEnemigoAbajo(enemy);
   7534 DD 6E F7      [19] 3101 	ld	l,-9 (ix)
   7537 DD 66 F8      [19] 3102 	ld	h,-8 (ix)
   753A E5            [11] 3103 	push	hl
   753B CD 00 6C      [17] 3104 	call	_moverEnemigoAbajo
   753E F1            [10] 3105 	pop	af
   753F C3 C4 75      [10] 3106 	jp	00163$
   7542                    3107 00150$:
                           3108 ;src/main.c:584: moverEnemigoArriba(enemy);
   7542 DD 6E F7      [19] 3109 	ld	l,-9 (ix)
   7545 DD 66 F8      [19] 3110 	ld	h,-8 (ix)
   7548 E5            [11] 3111 	push	hl
   7549 CD E1 6B      [17] 3112 	call	_moverEnemigoArriba
   754C F1            [10] 3113 	pop	af
   754D 18 75         [12] 3114 	jr	00163$
   754F                    3115 00160$:
                           3116 ;src/main.c:586: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   754F 43            [ 4] 3117 	ld	b,e
   7550 05            [ 4] 3118 	dec	b
   7551 05            [ 4] 3119 	dec	b
   7552 C5            [11] 3120 	push	bc
   7553 2A 80 63      [16] 3121 	ld	hl,(_mapa)
   7556 E5            [11] 3122 	push	hl
   7557 CD D8 49      [17] 3123 	call	_getTilePtr
   755A F1            [10] 3124 	pop	af
   755B F1            [10] 3125 	pop	af
   755C 4E            [ 7] 3126 	ld	c,(hl)
   755D 3E 02         [ 7] 3127 	ld	a,#0x02
   755F 91            [ 4] 3128 	sub	a, c
   7560 38 57         [12] 3129 	jr	C,00155$
                           3130 ;src/main.c:587: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7562 DD 6E F9      [19] 3131 	ld	l,-7 (ix)
   7565 DD 66 FA      [19] 3132 	ld	h,-6 (ix)
   7568 56            [ 7] 3133 	ld	d,(hl)
   7569 15            [ 4] 3134 	dec	d
   756A 15            [ 4] 3135 	dec	d
   756B DD 6E F7      [19] 3136 	ld	l,-9 (ix)
   756E DD 66 F8      [19] 3137 	ld	h,-8 (ix)
   7571 46            [ 7] 3138 	ld	b,(hl)
   7572 04            [ 4] 3139 	inc	b
   7573 04            [ 4] 3140 	inc	b
   7574 D5            [11] 3141 	push	de
   7575 33            [ 6] 3142 	inc	sp
   7576 C5            [11] 3143 	push	bc
   7577 33            [ 6] 3144 	inc	sp
   7578 2A 80 63      [16] 3145 	ld	hl,(_mapa)
   757B E5            [11] 3146 	push	hl
   757C CD D8 49      [17] 3147 	call	_getTilePtr
   757F F1            [10] 3148 	pop	af
   7580 F1            [10] 3149 	pop	af
   7581 4E            [ 7] 3150 	ld	c,(hl)
   7582 3E 02         [ 7] 3151 	ld	a,#0x02
   7584 91            [ 4] 3152 	sub	a, c
   7585 38 32         [12] 3153 	jr	C,00155$
                           3154 ;src/main.c:588: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   7587 DD 6E F9      [19] 3155 	ld	l,-7 (ix)
   758A DD 66 FA      [19] 3156 	ld	h,-6 (ix)
   758D 46            [ 7] 3157 	ld	b,(hl)
   758E 05            [ 4] 3158 	dec	b
   758F 05            [ 4] 3159 	dec	b
   7590 DD 6E F7      [19] 3160 	ld	l,-9 (ix)
   7593 DD 66 F8      [19] 3161 	ld	h,-8 (ix)
   7596 7E            [ 7] 3162 	ld	a,(hl)
   7597 C6 04         [ 7] 3163 	add	a, #0x04
   7599 C5            [11] 3164 	push	bc
   759A 33            [ 6] 3165 	inc	sp
   759B F5            [11] 3166 	push	af
   759C 33            [ 6] 3167 	inc	sp
   759D 2A 80 63      [16] 3168 	ld	hl,(_mapa)
   75A0 E5            [11] 3169 	push	hl
   75A1 CD D8 49      [17] 3170 	call	_getTilePtr
   75A4 F1            [10] 3171 	pop	af
   75A5 F1            [10] 3172 	pop	af
   75A6 4E            [ 7] 3173 	ld	c,(hl)
   75A7 3E 02         [ 7] 3174 	ld	a,#0x02
   75A9 91            [ 4] 3175 	sub	a, c
   75AA 38 0D         [12] 3176 	jr	C,00155$
                           3177 ;src/main.c:589: moverEnemigoArriba(enemy);
   75AC DD 6E F7      [19] 3178 	ld	l,-9 (ix)
   75AF DD 66 F8      [19] 3179 	ld	h,-8 (ix)
   75B2 E5            [11] 3180 	push	hl
   75B3 CD E1 6B      [17] 3181 	call	_moverEnemigoArriba
   75B6 F1            [10] 3182 	pop	af
   75B7 18 0B         [12] 3183 	jr	00163$
   75B9                    3184 00155$:
                           3185 ;src/main.c:591: moverEnemigoAbajo(enemy);
   75B9 DD 6E F7      [19] 3186 	ld	l,-9 (ix)
   75BC DD 66 F8      [19] 3187 	ld	h,-8 (ix)
   75BF E5            [11] 3188 	push	hl
   75C0 CD 00 6C      [17] 3189 	call	_moverEnemigoAbajo
   75C3 F1            [10] 3190 	pop	af
   75C4                    3191 00163$:
                           3192 ;src/main.c:595: if (!movY) {
   75C4 DD 7E F4      [19] 3193 	ld	a,-12 (ix)
   75C7 B7            [ 4] 3194 	or	a, a
   75C8 C2 D4 76      [10] 3195 	jp	NZ,00189$
                           3196 ;src/main.c:596: if (enemy->x < ANCHO_PANTALLA/2) {
   75CB DD 6E F7      [19] 3197 	ld	l,-9 (ix)
   75CE DD 66 F8      [19] 3198 	ld	h,-8 (ix)
   75D1 4E            [ 7] 3199 	ld	c,(hl)
                           3200 ;src/main.c:489: u8 dify = abs(enemy->y - prota.y);
   75D2 DD 6E F9      [19] 3201 	ld	l,-7 (ix)
   75D5 DD 66 FA      [19] 3202 	ld	h,-6 (ix)
   75D8 5E            [ 7] 3203 	ld	e,(hl)
                           3204 ;src/main.c:596: if (enemy->x < ANCHO_PANTALLA/2) {
   75D9 79            [ 4] 3205 	ld	a,c
   75DA D6 28         [ 7] 3206 	sub	a, #0x28
   75DC D2 5C 76      [10] 3207 	jp	NC,00175$
                           3208 ;src/main.c:597: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   75DF 41            [ 4] 3209 	ld	b,c
   75E0 05            [ 4] 3210 	dec	b
   75E1 7B            [ 4] 3211 	ld	a,e
   75E2 F5            [11] 3212 	push	af
   75E3 33            [ 6] 3213 	inc	sp
   75E4 C5            [11] 3214 	push	bc
   75E5 33            [ 6] 3215 	inc	sp
   75E6 2A 80 63      [16] 3216 	ld	hl,(_mapa)
   75E9 E5            [11] 3217 	push	hl
   75EA CD D8 49      [17] 3218 	call	_getTilePtr
   75ED F1            [10] 3219 	pop	af
   75EE F1            [10] 3220 	pop	af
   75EF 4E            [ 7] 3221 	ld	c,(hl)
   75F0 3E 02         [ 7] 3222 	ld	a,#0x02
   75F2 91            [ 4] 3223 	sub	a, c
   75F3 38 5A         [12] 3224 	jr	C,00165$
                           3225 ;src/main.c:598: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   75F5 DD 6E F9      [19] 3226 	ld	l,-7 (ix)
   75F8 DD 66 FA      [19] 3227 	ld	h,-6 (ix)
   75FB 7E            [ 7] 3228 	ld	a,(hl)
   75FC C6 0B         [ 7] 3229 	add	a, #0x0B
   75FE 4F            [ 4] 3230 	ld	c,a
   75FF DD 6E F7      [19] 3231 	ld	l,-9 (ix)
   7602 DD 66 F8      [19] 3232 	ld	h,-8 (ix)
   7605 46            [ 7] 3233 	ld	b,(hl)
   7606 05            [ 4] 3234 	dec	b
   7607 79            [ 4] 3235 	ld	a,c
   7608 F5            [11] 3236 	push	af
   7609 33            [ 6] 3237 	inc	sp
   760A C5            [11] 3238 	push	bc
   760B 33            [ 6] 3239 	inc	sp
   760C 2A 80 63      [16] 3240 	ld	hl,(_mapa)
   760F E5            [11] 3241 	push	hl
   7610 CD D8 49      [17] 3242 	call	_getTilePtr
   7613 F1            [10] 3243 	pop	af
   7614 F1            [10] 3244 	pop	af
   7615 4E            [ 7] 3245 	ld	c,(hl)
   7616 3E 02         [ 7] 3246 	ld	a,#0x02
   7618 91            [ 4] 3247 	sub	a, c
   7619 38 34         [12] 3248 	jr	C,00165$
                           3249 ;src/main.c:599: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   761B DD 6E F9      [19] 3250 	ld	l,-7 (ix)
   761E DD 66 FA      [19] 3251 	ld	h,-6 (ix)
   7621 7E            [ 7] 3252 	ld	a,(hl)
   7622 C6 16         [ 7] 3253 	add	a, #0x16
   7624 4F            [ 4] 3254 	ld	c,a
   7625 DD 6E F7      [19] 3255 	ld	l,-9 (ix)
   7628 DD 66 F8      [19] 3256 	ld	h,-8 (ix)
   762B 46            [ 7] 3257 	ld	b,(hl)
   762C 05            [ 4] 3258 	dec	b
   762D 79            [ 4] 3259 	ld	a,c
   762E F5            [11] 3260 	push	af
   762F 33            [ 6] 3261 	inc	sp
   7630 C5            [11] 3262 	push	bc
   7631 33            [ 6] 3263 	inc	sp
   7632 2A 80 63      [16] 3264 	ld	hl,(_mapa)
   7635 E5            [11] 3265 	push	hl
   7636 CD D8 49      [17] 3266 	call	_getTilePtr
   7639 F1            [10] 3267 	pop	af
   763A F1            [10] 3268 	pop	af
   763B 4E            [ 7] 3269 	ld	c,(hl)
   763C 3E 02         [ 7] 3270 	ld	a,#0x02
   763E 91            [ 4] 3271 	sub	a, c
   763F 38 0E         [12] 3272 	jr	C,00165$
                           3273 ;src/main.c:600: moverEnemigoIzquierda(enemy);
   7641 DD 6E F7      [19] 3274 	ld	l,-9 (ix)
   7644 DD 66 F8      [19] 3275 	ld	h,-8 (ix)
   7647 E5            [11] 3276 	push	hl
   7648 CD 2F 6C      [17] 3277 	call	_moverEnemigoIzquierda
   764B F1            [10] 3278 	pop	af
   764C C3 D4 76      [10] 3279 	jp	00189$
   764F                    3280 00165$:
                           3281 ;src/main.c:602: moverEnemigoDerecha(enemy);
   764F DD 6E F7      [19] 3282 	ld	l,-9 (ix)
   7652 DD 66 F8      [19] 3283 	ld	h,-8 (ix)
   7655 E5            [11] 3284 	push	hl
   7656 CD 1F 6C      [17] 3285 	call	_moverEnemigoDerecha
   7659 F1            [10] 3286 	pop	af
   765A 18 78         [12] 3287 	jr	00189$
   765C                    3288 00175$:
                           3289 ;src/main.c:605: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   765C 79            [ 4] 3290 	ld	a,c
   765D C6 05         [ 7] 3291 	add	a, #0x05
   765F 47            [ 4] 3292 	ld	b,a
   7660 7B            [ 4] 3293 	ld	a,e
   7661 F5            [11] 3294 	push	af
   7662 33            [ 6] 3295 	inc	sp
   7663 C5            [11] 3296 	push	bc
   7664 33            [ 6] 3297 	inc	sp
   7665 2A 80 63      [16] 3298 	ld	hl,(_mapa)
   7668 E5            [11] 3299 	push	hl
   7669 CD D8 49      [17] 3300 	call	_getTilePtr
   766C F1            [10] 3301 	pop	af
   766D F1            [10] 3302 	pop	af
   766E 4E            [ 7] 3303 	ld	c,(hl)
   766F 3E 02         [ 7] 3304 	ld	a,#0x02
   7671 91            [ 4] 3305 	sub	a, c
   7672 38 55         [12] 3306 	jr	C,00170$
                           3307 ;src/main.c:606: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   7674 DD 6E F9      [19] 3308 	ld	l,-7 (ix)
   7677 DD 66 FA      [19] 3309 	ld	h,-6 (ix)
   767A 7E            [ 7] 3310 	ld	a,(hl)
   767B C6 0B         [ 7] 3311 	add	a, #0x0B
   767D 47            [ 4] 3312 	ld	b,a
   767E DD 6E F7      [19] 3313 	ld	l,-9 (ix)
   7681 DD 66 F8      [19] 3314 	ld	h,-8 (ix)
   7684 7E            [ 7] 3315 	ld	a,(hl)
   7685 C6 05         [ 7] 3316 	add	a, #0x05
   7687 4F            [ 4] 3317 	ld	c,a
   7688 C5            [11] 3318 	push	bc
   7689 2A 80 63      [16] 3319 	ld	hl,(_mapa)
   768C E5            [11] 3320 	push	hl
   768D CD D8 49      [17] 3321 	call	_getTilePtr
   7690 F1            [10] 3322 	pop	af
   7691 F1            [10] 3323 	pop	af
   7692 4E            [ 7] 3324 	ld	c,(hl)
   7693 3E 02         [ 7] 3325 	ld	a,#0x02
   7695 91            [ 4] 3326 	sub	a, c
   7696 38 31         [12] 3327 	jr	C,00170$
                           3328 ;src/main.c:607: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   7698 DD 6E F9      [19] 3329 	ld	l,-7 (ix)
   769B DD 66 FA      [19] 3330 	ld	h,-6 (ix)
   769E 7E            [ 7] 3331 	ld	a,(hl)
   769F C6 16         [ 7] 3332 	add	a, #0x16
   76A1 47            [ 4] 3333 	ld	b,a
   76A2 DD 6E F7      [19] 3334 	ld	l,-9 (ix)
   76A5 DD 66 F8      [19] 3335 	ld	h,-8 (ix)
   76A8 7E            [ 7] 3336 	ld	a,(hl)
   76A9 C6 05         [ 7] 3337 	add	a, #0x05
   76AB 4F            [ 4] 3338 	ld	c,a
   76AC C5            [11] 3339 	push	bc
   76AD 2A 80 63      [16] 3340 	ld	hl,(_mapa)
   76B0 E5            [11] 3341 	push	hl
   76B1 CD D8 49      [17] 3342 	call	_getTilePtr
   76B4 F1            [10] 3343 	pop	af
   76B5 F1            [10] 3344 	pop	af
   76B6 4E            [ 7] 3345 	ld	c,(hl)
   76B7 3E 02         [ 7] 3346 	ld	a,#0x02
   76B9 91            [ 4] 3347 	sub	a, c
   76BA 38 0D         [12] 3348 	jr	C,00170$
                           3349 ;src/main.c:608: moverEnemigoDerecha(enemy);
   76BC DD 6E F7      [19] 3350 	ld	l,-9 (ix)
   76BF DD 66 F8      [19] 3351 	ld	h,-8 (ix)
   76C2 E5            [11] 3352 	push	hl
   76C3 CD 1F 6C      [17] 3353 	call	_moverEnemigoDerecha
   76C6 F1            [10] 3354 	pop	af
   76C7 18 0B         [12] 3355 	jr	00189$
   76C9                    3356 00170$:
                           3357 ;src/main.c:611: moverEnemigoIzquierda(enemy);
   76C9 DD 6E F7      [19] 3358 	ld	l,-9 (ix)
   76CC DD 66 F8      [19] 3359 	ld	h,-8 (ix)
   76CF E5            [11] 3360 	push	hl
   76D0 CD 2F 6C      [17] 3361 	call	_moverEnemigoIzquierda
   76D3 F1            [10] 3362 	pop	af
   76D4                    3363 00189$:
   76D4 DD F9         [10] 3364 	ld	sp, ix
   76D6 DD E1         [14] 3365 	pop	ix
   76D8 C9            [10] 3366 	ret
                           3367 ;src/main.c:620: void updateEnemy(TEnemy* actual) { // maquina de estados
                           3368 ;	---------------------------------
                           3369 ; Function updateEnemy
                           3370 ; ---------------------------------
   76D9                    3371 _updateEnemy::
   76D9 DD E5         [15] 3372 	push	ix
   76DB DD 21 00 00   [14] 3373 	ld	ix,#0
   76DF DD 39         [15] 3374 	add	ix,sp
   76E1 21 F4 FF      [10] 3375 	ld	hl,#-12
   76E4 39            [11] 3376 	add	hl,sp
   76E5 F9            [ 6] 3377 	ld	sp,hl
                           3378 ;src/main.c:625: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   76E6 DD 4E 04      [19] 3379 	ld	c,4 (ix)
   76E9 DD 46 05      [19] 3380 	ld	b,5 (ix)
   76EC 21 16 00      [10] 3381 	ld	hl,#0x0016
   76EF 09            [11] 3382 	add	hl,bc
   76F0 EB            [ 4] 3383 	ex	de,hl
   76F1 1A            [ 7] 3384 	ld	a,(de)
   76F2 DD 77 FF      [19] 3385 	ld	-1 (ix), a
   76F5 B7            [ 4] 3386 	or	a, a
   76F6 28 14         [12] 3387 	jr	Z,00117$
                           3388 ;src/main.c:626: engage(actual, prota.x, prota.y);
   76F8 3A A5 62      [13] 3389 	ld	a, (#_prota + 1)
   76FB 21 A4 62      [10] 3390 	ld	hl, #_prota + 0
   76FE 56            [ 7] 3391 	ld	d,(hl)
   76FF F5            [11] 3392 	push	af
   7700 33            [ 6] 3393 	inc	sp
   7701 D5            [11] 3394 	push	de
   7702 33            [ 6] 3395 	inc	sp
   7703 C5            [11] 3396 	push	bc
   7704 CD E3 6F      [17] 3397 	call	_engage
   7707 F1            [10] 3398 	pop	af
   7708 F1            [10] 3399 	pop	af
   7709 C3 46 78      [10] 3400 	jp	00119$
   770C                    3401 00117$:
                           3402 ;src/main.c:629: if (actual->patrolling) {
   770C 21 0B 00      [10] 3403 	ld	hl,#0x000B
   770F 09            [11] 3404 	add	hl,bc
   7710 DD 75 FD      [19] 3405 	ld	-3 (ix),l
   7713 DD 74 FE      [19] 3406 	ld	-2 (ix),h
   7716 DD 6E FD      [19] 3407 	ld	l,-3 (ix)
   7719 DD 66 FE      [19] 3408 	ld	h,-2 (ix)
   771C 6E            [ 7] 3409 	ld	l,(hl)
                           3410 ;src/main.c:641: actual->seek = 1;
   771D 79            [ 4] 3411 	ld	a,c
   771E C6 14         [ 7] 3412 	add	a, #0x14
   7720 DD 77 FB      [19] 3413 	ld	-5 (ix),a
   7723 78            [ 4] 3414 	ld	a,b
   7724 CE 00         [ 7] 3415 	adc	a, #0x00
   7726 DD 77 FC      [19] 3416 	ld	-4 (ix),a
                           3417 ;src/main.c:632: if (actual->inRange) {
   7729 79            [ 4] 3418 	ld	a,c
   772A C6 11         [ 7] 3419 	add	a, #0x11
   772C DD 77 F9      [19] 3420 	ld	-7 (ix),a
   772F 78            [ 4] 3421 	ld	a,b
   7730 CE 00         [ 7] 3422 	adc	a, #0x00
   7732 DD 77 FA      [19] 3423 	ld	-6 (ix),a
                           3424 ;src/main.c:629: if (actual->patrolling) {
   7735 7D            [ 4] 3425 	ld	a,l
   7736 B7            [ 4] 3426 	or	a, a
   7737 CA 04 78      [10] 3427 	jp	Z,00114$
                           3428 ;src/main.c:631: moverEnemigoPatrol(actual);
   773A C5            [11] 3429 	push	bc
   773B D5            [11] 3430 	push	de
   773C C5            [11] 3431 	push	bc
   773D CD 41 6C      [17] 3432 	call	_moverEnemigoPatrol
   7740 F1            [10] 3433 	pop	af
   7741 D1            [10] 3434 	pop	de
   7742 C1            [10] 3435 	pop	bc
                           3436 ;src/main.c:632: if (actual->inRange) {
   7743 DD 6E F9      [19] 3437 	ld	l,-7 (ix)
   7746 DD 66 FA      [19] 3438 	ld	h,-6 (ix)
   7749 7E            [ 7] 3439 	ld	a,(hl)
   774A B7            [ 4] 3440 	or	a, a
   774B 28 29         [12] 3441 	jr	Z,00104$
                           3442 ;src/main.c:633: engage(actual, prota.x, prota.y);
   774D 3A A5 62      [13] 3443 	ld	a, (#_prota + 1)
   7750 21 A4 62      [10] 3444 	ld	hl, #_prota + 0
   7753 F5            [11] 3445 	push	af
   7754 7E            [ 7] 3446 	ld	a,(hl)
   7755 DD 77 FF      [19] 3447 	ld	-1 (ix),a
   7758 F1            [10] 3448 	pop	af
   7759 D5            [11] 3449 	push	de
   775A F5            [11] 3450 	push	af
   775B 33            [ 6] 3451 	inc	sp
   775C DD 7E FF      [19] 3452 	ld	a,-1 (ix)
   775F F5            [11] 3453 	push	af
   7760 33            [ 6] 3454 	inc	sp
   7761 C5            [11] 3455 	push	bc
   7762 CD E3 6F      [17] 3456 	call	_engage
   7765 F1            [10] 3457 	pop	af
   7766 F1            [10] 3458 	pop	af
   7767 D1            [10] 3459 	pop	de
                           3460 ;src/main.c:634: actual->patrolling = 0;
   7768 DD 6E FD      [19] 3461 	ld	l,-3 (ix)
   776B DD 66 FE      [19] 3462 	ld	h,-2 (ix)
   776E 36 00         [10] 3463 	ld	(hl),#0x00
                           3464 ;src/main.c:635: actual->engage = 1;
   7770 3E 01         [ 7] 3465 	ld	a,#0x01
   7772 12            [ 7] 3466 	ld	(de),a
   7773 C3 46 78      [10] 3467 	jp	00119$
   7776                    3468 00104$:
                           3469 ;src/main.c:636: } else if (actual->seen) {
   7776 21 12 00      [10] 3470 	ld	hl,#0x0012
   7779 09            [11] 3471 	add	hl,bc
   777A DD 75 F7      [19] 3472 	ld	-9 (ix),l
   777D DD 74 F8      [19] 3473 	ld	-8 (ix),h
   7780 DD 6E F7      [19] 3474 	ld	l,-9 (ix)
   7783 DD 66 F8      [19] 3475 	ld	h,-8 (ix)
   7786 7E            [ 7] 3476 	ld	a,(hl)
   7787 B7            [ 4] 3477 	or	a, a
   7788 CA 46 78      [10] 3478 	jp	Z,00119$
                           3479 ;src/main.c:638: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   778B 3A A5 62      [13] 3480 	ld	a,(#_prota + 1)
   778E DD 77 FF      [19] 3481 	ld	-1 (ix),a
   7791 21 A4 62      [10] 3482 	ld	hl, #_prota + 0
   7794 5E            [ 7] 3483 	ld	e,(hl)
   7795 21 01 00      [10] 3484 	ld	hl,#0x0001
   7798 09            [11] 3485 	add	hl,bc
   7799 DD 75 F5      [19] 3486 	ld	-11 (ix),l
   779C DD 74 F6      [19] 3487 	ld	-10 (ix),h
   779F DD 6E F5      [19] 3488 	ld	l,-11 (ix)
   77A2 DD 66 F6      [19] 3489 	ld	h,-10 (ix)
   77A5 56            [ 7] 3490 	ld	d,(hl)
   77A6 0A            [ 7] 3491 	ld	a,(bc)
   77A7 DD 77 F4      [19] 3492 	ld	-12 (ix),a
   77AA C5            [11] 3493 	push	bc
   77AB 2A 80 63      [16] 3494 	ld	hl,(_mapa)
   77AE E5            [11] 3495 	push	hl
   77AF C5            [11] 3496 	push	bc
   77B0 DD 7E FF      [19] 3497 	ld	a,-1 (ix)
   77B3 F5            [11] 3498 	push	af
   77B4 33            [ 6] 3499 	inc	sp
   77B5 7B            [ 4] 3500 	ld	a,e
   77B6 F5            [11] 3501 	push	af
   77B7 33            [ 6] 3502 	inc	sp
   77B8 D5            [11] 3503 	push	de
   77B9 33            [ 6] 3504 	inc	sp
   77BA DD 7E F4      [19] 3505 	ld	a,-12 (ix)
   77BD F5            [11] 3506 	push	af
   77BE 33            [ 6] 3507 	inc	sp
   77BF CD 28 48      [17] 3508 	call	_pathFinding
   77C2 21 08 00      [10] 3509 	ld	hl,#8
   77C5 39            [11] 3510 	add	hl,sp
   77C6 F9            [ 6] 3511 	ld	sp,hl
   77C7 C1            [10] 3512 	pop	bc
                           3513 ;src/main.c:639: actual->p_seek_x = actual->x;
   77C8 21 17 00      [10] 3514 	ld	hl,#0x0017
   77CB 09            [11] 3515 	add	hl,bc
   77CC EB            [ 4] 3516 	ex	de,hl
   77CD 0A            [ 7] 3517 	ld	a,(bc)
   77CE 12            [ 7] 3518 	ld	(de),a
                           3519 ;src/main.c:640: actual->p_seek_y = actual->y;
   77CF 21 18 00      [10] 3520 	ld	hl,#0x0018
   77D2 09            [11] 3521 	add	hl,bc
   77D3 EB            [ 4] 3522 	ex	de,hl
   77D4 DD 6E F5      [19] 3523 	ld	l,-11 (ix)
   77D7 DD 66 F6      [19] 3524 	ld	h,-10 (ix)
   77DA 7E            [ 7] 3525 	ld	a,(hl)
   77DB 12            [ 7] 3526 	ld	(de),a
                           3527 ;src/main.c:641: actual->seek = 1;
   77DC DD 6E FB      [19] 3528 	ld	l,-5 (ix)
   77DF DD 66 FC      [19] 3529 	ld	h,-4 (ix)
   77E2 36 01         [10] 3530 	ld	(hl),#0x01
                           3531 ;src/main.c:642: actual->iter=0;
   77E4 21 0E 00      [10] 3532 	ld	hl,#0x000E
   77E7 09            [11] 3533 	add	hl,bc
   77E8 AF            [ 4] 3534 	xor	a, a
   77E9 77            [ 7] 3535 	ld	(hl), a
   77EA 23            [ 6] 3536 	inc	hl
   77EB 77            [ 7] 3537 	ld	(hl), a
                           3538 ;src/main.c:643: actual->reversePatrol = NO;
   77EC 21 0C 00      [10] 3539 	ld	hl,#0x000C
   77EF 09            [11] 3540 	add	hl,bc
   77F0 36 00         [10] 3541 	ld	(hl),#0x00
                           3542 ;src/main.c:644: actual->patrolling = 0;
   77F2 DD 6E FD      [19] 3543 	ld	l,-3 (ix)
   77F5 DD 66 FE      [19] 3544 	ld	h,-2 (ix)
   77F8 36 00         [10] 3545 	ld	(hl),#0x00
                           3546 ;src/main.c:645: actual->seen = 0;
   77FA DD 6E F7      [19] 3547 	ld	l,-9 (ix)
   77FD DD 66 F8      [19] 3548 	ld	h,-8 (ix)
   7800 36 00         [10] 3549 	ld	(hl),#0x00
   7802 18 42         [12] 3550 	jr	00119$
   7804                    3551 00114$:
                           3552 ;src/main.c:647: } else if (actual->seek) {
   7804 DD 6E FB      [19] 3553 	ld	l,-5 (ix)
   7807 DD 66 FC      [19] 3554 	ld	h,-4 (ix)
   780A 7E            [ 7] 3555 	ld	a,(hl)
   780B B7            [ 4] 3556 	or	a, a
   780C 28 38         [12] 3557 	jr	Z,00119$
                           3558 ;src/main.c:649: if (!actual->found /*&& actual->seekTimer <= 5*/) {
   780E C5            [11] 3559 	push	bc
   780F FD E1         [14] 3560 	pop	iy
   7811 FD 7E 13      [19] 3561 	ld	a,19 (iy)
   7814 B7            [ 4] 3562 	or	a, a
   7815 20 07         [12] 3563 	jr	NZ,00109$
                           3564 ;src/main.c:650: moverEnemigoSeek(actual); // buscar en posiciones cercanas a la actual
   7817 C5            [11] 3565 	push	bc
   7818 CD 8A 6E      [17] 3566 	call	_moverEnemigoSeek
   781B F1            [10] 3567 	pop	af
   781C 18 28         [12] 3568 	jr	00119$
   781E                    3569 00109$:
                           3570 ;src/main.c:651: } else if (actual->inRange) {
   781E DD 6E F9      [19] 3571 	ld	l,-7 (ix)
   7821 DD 66 FA      [19] 3572 	ld	h,-6 (ix)
   7824 7E            [ 7] 3573 	ld	a,(hl)
   7825 B7            [ 4] 3574 	or	a, a
   7826 28 1E         [12] 3575 	jr	Z,00119$
                           3576 ;src/main.c:652: engage(actual, prota.x, prota.y);
   7828 3A A5 62      [13] 3577 	ld	a, (#_prota + 1)
   782B 21 A4 62      [10] 3578 	ld	hl, #_prota + 0
   782E F5            [11] 3579 	push	af
   782F 7E            [ 7] 3580 	ld	a,(hl)
   7830 DD 77 F4      [19] 3581 	ld	-12 (ix),a
   7833 F1            [10] 3582 	pop	af
   7834 D5            [11] 3583 	push	de
   7835 F5            [11] 3584 	push	af
   7836 33            [ 6] 3585 	inc	sp
   7837 DD 7E F4      [19] 3586 	ld	a,-12 (ix)
   783A F5            [11] 3587 	push	af
   783B 33            [ 6] 3588 	inc	sp
   783C C5            [11] 3589 	push	bc
   783D CD E3 6F      [17] 3590 	call	_engage
   7840 F1            [10] 3591 	pop	af
   7841 F1            [10] 3592 	pop	af
   7842 D1            [10] 3593 	pop	de
                           3594 ;src/main.c:653: actual->engage = 1;
   7843 3E 01         [ 7] 3595 	ld	a,#0x01
   7845 12            [ 7] 3596 	ld	(de),a
   7846                    3597 00119$:
   7846 DD F9         [10] 3598 	ld	sp, ix
   7848 DD E1         [14] 3599 	pop	ix
   784A C9            [10] 3600 	ret
                           3601 ;src/main.c:659: void inicializarEnemy() {
                           3602 ;	---------------------------------
                           3603 ; Function inicializarEnemy
                           3604 ; ---------------------------------
   784B                    3605 _inicializarEnemy::
   784B DD E5         [15] 3606 	push	ix
   784D DD 21 00 00   [14] 3607 	ld	ix,#0
   7851 DD 39         [15] 3608 	add	ix,sp
   7853 21 F9 FF      [10] 3609 	ld	hl,#-7
   7856 39            [11] 3610 	add	hl,sp
   7857 F9            [ 6] 3611 	ld	sp,hl
                           3612 ;src/main.c:670: actual = enemy;
   7858 01 1C 5F      [10] 3613 	ld	bc,#_enemy+0
                           3614 ;src/main.c:671: while(i){
   785B DD 36 F9 02   [19] 3615 	ld	-7 (ix),#0x02
   785F                    3616 00103$:
   785F DD 7E F9      [19] 3617 	ld	a,-7 (ix)
   7862 B7            [ 4] 3618 	or	a, a
   7863 CA 5F 79      [10] 3619 	jp	Z,00106$
                           3620 ;src/main.c:672: --i;
   7866 DD 35 F9      [23] 3621 	dec	-7 (ix)
                           3622 ;src/main.c:673: actual->x = actual->px = spawnX[i];
   7869 59            [ 4] 3623 	ld	e, c
   786A 50            [ 4] 3624 	ld	d, b
   786B 13            [ 6] 3625 	inc	de
   786C 13            [ 6] 3626 	inc	de
   786D 3E A6         [ 7] 3627 	ld	a,#<(_spawnX)
   786F DD 86 F9      [19] 3628 	add	a, -7 (ix)
   7872 DD 77 FC      [19] 3629 	ld	-4 (ix),a
   7875 3E 63         [ 7] 3630 	ld	a,#>(_spawnX)
   7877 CE 00         [ 7] 3631 	adc	a, #0x00
   7879 DD 77 FD      [19] 3632 	ld	-3 (ix),a
   787C DD 6E FC      [19] 3633 	ld	l,-4 (ix)
   787F DD 66 FD      [19] 3634 	ld	h,-3 (ix)
   7882 7E            [ 7] 3635 	ld	a,(hl)
   7883 12            [ 7] 3636 	ld	(de),a
   7884 02            [ 7] 3637 	ld	(bc),a
                           3638 ;src/main.c:674: actual->y = actual->py = spawnY[i];
   7885 C5            [11] 3639 	push	bc
   7886 FD E1         [14] 3640 	pop	iy
   7888 FD 23         [10] 3641 	inc	iy
   788A 59            [ 4] 3642 	ld	e, c
   788B 50            [ 4] 3643 	ld	d, b
   788C 13            [ 6] 3644 	inc	de
   788D 13            [ 6] 3645 	inc	de
   788E 13            [ 6] 3646 	inc	de
   788F 3E AA         [ 7] 3647 	ld	a,#<(_spawnY)
   7891 DD 86 F9      [19] 3648 	add	a, -7 (ix)
   7894 DD 77 FA      [19] 3649 	ld	-6 (ix),a
   7897 3E 63         [ 7] 3650 	ld	a,#>(_spawnY)
   7899 CE 00         [ 7] 3651 	adc	a, #0x00
   789B DD 77 FB      [19] 3652 	ld	-5 (ix),a
   789E DD 6E FA      [19] 3653 	ld	l,-6 (ix)
   78A1 DD 66 FB      [19] 3654 	ld	h,-5 (ix)
   78A4 7E            [ 7] 3655 	ld	a,(hl)
   78A5 12            [ 7] 3656 	ld	(de),a
   78A6 FD 77 00      [19] 3657 	ld	0 (iy), a
                           3658 ;src/main.c:675: actual->mover  = NO;
   78A9 21 06 00      [10] 3659 	ld	hl,#0x0006
   78AC 09            [11] 3660 	add	hl,bc
   78AD 36 00         [10] 3661 	ld	(hl),#0x00
                           3662 ;src/main.c:676: actual->mira   = M_abajo;
   78AF 21 07 00      [10] 3663 	ld	hl,#0x0007
   78B2 09            [11] 3664 	add	hl,bc
   78B3 36 03         [10] 3665 	ld	(hl),#0x03
                           3666 ;src/main.c:677: actual->sprite = g_enemy;
   78B5 21 04 00      [10] 3667 	ld	hl,#0x0004
   78B8 09            [11] 3668 	add	hl,bc
   78B9 36 3A         [10] 3669 	ld	(hl),#<(_g_enemy)
   78BB 23            [ 6] 3670 	inc	hl
   78BC 36 3C         [10] 3671 	ld	(hl),#>(_g_enemy)
                           3672 ;src/main.c:678: actual->muerto = NO;
   78BE 21 08 00      [10] 3673 	ld	hl,#0x0008
   78C1 09            [11] 3674 	add	hl,bc
   78C2 36 00         [10] 3675 	ld	(hl),#0x00
                           3676 ;src/main.c:679: actual->muertes = 0;
   78C4 21 0A 00      [10] 3677 	ld	hl,#0x000A
   78C7 09            [11] 3678 	add	hl,bc
   78C8 36 00         [10] 3679 	ld	(hl),#0x00
                           3680 ;src/main.c:680: actual->patrolling = SI;
   78CA 21 0B 00      [10] 3681 	ld	hl,#0x000B
   78CD 09            [11] 3682 	add	hl,bc
   78CE 36 01         [10] 3683 	ld	(hl),#0x01
                           3684 ;src/main.c:681: actual->reversePatrol = NO;
   78D0 21 0C 00      [10] 3685 	ld	hl,#0x000C
   78D3 09            [11] 3686 	add	hl,bc
   78D4 36 00         [10] 3687 	ld	(hl),#0x00
                           3688 ;src/main.c:682: actual->iter = 0;
   78D6 21 0E 00      [10] 3689 	ld	hl,#0x000E
   78D9 09            [11] 3690 	add	hl,bc
   78DA AF            [ 4] 3691 	xor	a, a
   78DB 77            [ 7] 3692 	ld	(hl), a
   78DC 23            [ 6] 3693 	inc	hl
   78DD 77            [ 7] 3694 	ld	(hl), a
                           3695 ;src/main.c:683: actual->lastIter = 0;
   78DE 21 10 00      [10] 3696 	ld	hl,#0x0010
   78E1 09            [11] 3697 	add	hl,bc
   78E2 36 00         [10] 3698 	ld	(hl),#0x00
                           3699 ;src/main.c:684: actual->seen = 0;
   78E4 21 12 00      [10] 3700 	ld	hl,#0x0012
   78E7 09            [11] 3701 	add	hl,bc
   78E8 36 00         [10] 3702 	ld	(hl),#0x00
                           3703 ;src/main.c:685: actual->found = 0;
   78EA 21 13 00      [10] 3704 	ld	hl,#0x0013
   78ED 09            [11] 3705 	add	hl,bc
   78EE 36 00         [10] 3706 	ld	(hl),#0x00
                           3707 ;src/main.c:686: pathFinding( spawnX[i],  spawnY[i], patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
   78F0 21 82 63      [10] 3708 	ld	hl,#_num_mapa + 0
   78F3 5E            [ 7] 3709 	ld	e, (hl)
   78F4 1C            [ 4] 3710 	inc	e
   78F5 16 00         [ 7] 3711 	ld	d,#0x00
   78F7 6B            [ 4] 3712 	ld	l, e
   78F8 62            [ 4] 3713 	ld	h, d
   78F9 29            [11] 3714 	add	hl, hl
   78FA 29            [11] 3715 	add	hl, hl
   78FB 19            [11] 3716 	add	hl, de
   78FC EB            [ 4] 3717 	ex	de,hl
   78FD 21 C2 63      [10] 3718 	ld	hl,#_patrolY
   7900 19            [11] 3719 	add	hl,de
   7901 DD 7E F9      [19] 3720 	ld	a,-7 (ix)
   7904 85            [ 4] 3721 	add	a, l
   7905 6F            [ 4] 3722 	ld	l,a
   7906 3E 00         [ 7] 3723 	ld	a,#0x00
   7908 8C            [ 4] 3724 	adc	a, h
   7909 67            [ 4] 3725 	ld	h,a
   790A 7E            [ 7] 3726 	ld	a,(hl)
   790B DD 77 FF      [19] 3727 	ld	-1 (ix),a
   790E 21 AE 63      [10] 3728 	ld	hl,#_patrolX
   7911 19            [11] 3729 	add	hl,de
   7912 DD 5E F9      [19] 3730 	ld	e,-7 (ix)
   7915 16 00         [ 7] 3731 	ld	d,#0x00
   7917 19            [11] 3732 	add	hl,de
   7918 7E            [ 7] 3733 	ld	a,(hl)
   7919 DD 77 FE      [19] 3734 	ld	-2 (ix),a
   791C DD 6E FA      [19] 3735 	ld	l,-6 (ix)
   791F DD 66 FB      [19] 3736 	ld	h,-5 (ix)
   7922 5E            [ 7] 3737 	ld	e,(hl)
   7923 DD 6E FC      [19] 3738 	ld	l,-4 (ix)
   7926 DD 66 FD      [19] 3739 	ld	h,-3 (ix)
   7929 56            [ 7] 3740 	ld	d,(hl)
   792A C5            [11] 3741 	push	bc
   792B 2A 80 63      [16] 3742 	ld	hl,(_mapa)
   792E E5            [11] 3743 	push	hl
   792F C5            [11] 3744 	push	bc
   7930 DD 66 FF      [19] 3745 	ld	h,-1 (ix)
   7933 DD 6E FE      [19] 3746 	ld	l,-2 (ix)
   7936 E5            [11] 3747 	push	hl
   7937 7B            [ 4] 3748 	ld	a,e
   7938 F5            [11] 3749 	push	af
   7939 33            [ 6] 3750 	inc	sp
   793A D5            [11] 3751 	push	de
   793B 33            [ 6] 3752 	inc	sp
   793C CD 28 48      [17] 3753 	call	_pathFinding
   793F 21 08 00      [10] 3754 	ld	hl,#8
   7942 39            [11] 3755 	add	hl,sp
   7943 F9            [ 6] 3756 	ld	sp,hl
   7944 C1            [10] 3757 	pop	bc
                           3758 ;src/main.c:709: if(actual->longitud_camino > 0){
   7945 69            [ 4] 3759 	ld	l, c
   7946 60            [ 4] 3760 	ld	h, b
   7947 11 E1 00      [10] 3761 	ld	de, #0x00E1
   794A 19            [11] 3762 	add	hl, de
   794B 7E            [ 7] 3763 	ld	a,(hl)
   794C B7            [ 4] 3764 	or	a, a
   794D 28 07         [12] 3765 	jr	Z,00102$
                           3766 ;src/main.c:710: dibujarEnemigo(actual);
   794F C5            [11] 3767 	push	bc
   7950 C5            [11] 3768 	push	bc
   7951 CD 5C 66      [17] 3769 	call	_dibujarEnemigo
   7954 F1            [10] 3770 	pop	af
   7955 C1            [10] 3771 	pop	bc
   7956                    3772 00102$:
                           3773 ;src/main.c:712: ++actual;
   7956 21 E2 00      [10] 3774 	ld	hl,#0x00E2
   7959 09            [11] 3775 	add	hl,bc
   795A 4D            [ 4] 3776 	ld	c,l
   795B 44            [ 4] 3777 	ld	b,h
   795C C3 5F 78      [10] 3778 	jp	00103$
   795F                    3779 00106$:
   795F DD F9         [10] 3780 	ld	sp, ix
   7961 DD E1         [14] 3781 	pop	ix
   7963 C9            [10] 3782 	ret
                           3783 ;src/main.c:716: void avanzarMapa() {
                           3784 ;	---------------------------------
                           3785 ; Function avanzarMapa
                           3786 ; ---------------------------------
   7964                    3787 _avanzarMapa::
                           3788 ;src/main.c:717: if(num_mapa < NUM_MAPAS -1) {
   7964 3A 82 63      [13] 3789 	ld	a,(#_num_mapa + 0)
   7967 D6 02         [ 7] 3790 	sub	a, #0x02
   7969 30 34         [12] 3791 	jr	NC,00102$
                           3792 ;src/main.c:718: mapa = mapas[++num_mapa];
   796B 01 A0 63      [10] 3793 	ld	bc,#_mapas+0
   796E 21 82 63      [10] 3794 	ld	hl, #_num_mapa+0
   7971 34            [11] 3795 	inc	(hl)
   7972 FD 21 82 63   [14] 3796 	ld	iy,#_num_mapa
   7976 FD 6E 00      [19] 3797 	ld	l,0 (iy)
   7979 26 00         [ 7] 3798 	ld	h,#0x00
   797B 29            [11] 3799 	add	hl, hl
   797C 09            [11] 3800 	add	hl,bc
   797D 7E            [ 7] 3801 	ld	a,(hl)
   797E FD 21 80 63   [14] 3802 	ld	iy,#_mapa
   7982 FD 77 00      [19] 3803 	ld	0 (iy),a
   7985 23            [ 6] 3804 	inc	hl
   7986 7E            [ 7] 3805 	ld	a,(hl)
   7987 32 81 63      [13] 3806 	ld	(#_mapa + 1),a
                           3807 ;src/main.c:719: prota.x = prota.px = 2;
   798A 21 A6 62      [10] 3808 	ld	hl,#(_prota + 0x0002)
   798D 36 02         [10] 3809 	ld	(hl),#0x02
   798F 21 A4 62      [10] 3810 	ld	hl,#_prota
   7992 36 02         [10] 3811 	ld	(hl),#0x02
                           3812 ;src/main.c:720: prota.mover = SI;
   7994 21 AA 62      [10] 3813 	ld	hl,#(_prota + 0x0006)
   7997 36 01         [10] 3814 	ld	(hl),#0x01
                           3815 ;src/main.c:721: dibujarMapa();
   7999 CD 8A 63      [17] 3816 	call	_dibujarMapa
                           3817 ;src/main.c:722: inicializarEnemy();
   799C C3 4B 78      [10] 3818 	jp  _inicializarEnemy
   799F                    3819 00102$:
                           3820 ;src/main.c:725: menuFin(puntuacion);
   799F FD 21 83 63   [14] 3821 	ld	iy,#_puntuacion
   79A3 FD 6E 00      [19] 3822 	ld	l,0 (iy)
   79A6 26 00         [ 7] 3823 	ld	h,#0x00
   79A8 C3 5C 4A      [10] 3824 	jp  _menuFin
                           3825 ;src/main.c:729: void moverIzquierda() {
                           3826 ;	---------------------------------
                           3827 ; Function moverIzquierda
                           3828 ; ---------------------------------
   79AB                    3829 _moverIzquierda::
                           3830 ;src/main.c:730: prota.mira = M_izquierda;
   79AB 01 A4 62      [10] 3831 	ld	bc,#_prota+0
   79AE 21 AB 62      [10] 3832 	ld	hl,#(_prota + 0x0007)
   79B1 36 01         [10] 3833 	ld	(hl),#0x01
                           3834 ;src/main.c:731: if (!checkCollision(M_izquierda)) {
   79B3 C5            [11] 3835 	push	bc
   79B4 3E 01         [ 7] 3836 	ld	a,#0x01
   79B6 F5            [11] 3837 	push	af
   79B7 33            [ 6] 3838 	inc	sp
   79B8 CD EB 64      [17] 3839 	call	_checkCollision
   79BB 33            [ 6] 3840 	inc	sp
   79BC C1            [10] 3841 	pop	bc
   79BD 7D            [ 4] 3842 	ld	a,l
   79BE B7            [ 4] 3843 	or	a, a
   79BF C0            [11] 3844 	ret	NZ
                           3845 ;src/main.c:732: prota.x--;
   79C0 0A            [ 7] 3846 	ld	a,(bc)
   79C1 C6 FF         [ 7] 3847 	add	a,#0xFF
   79C3 02            [ 7] 3848 	ld	(bc),a
                           3849 ;src/main.c:733: prota.mover = SI;
   79C4 21 AA 62      [10] 3850 	ld	hl,#(_prota + 0x0006)
   79C7 36 01         [10] 3851 	ld	(hl),#0x01
                           3852 ;src/main.c:734: prota.sprite = g_hero_left;
   79C9 21 C6 3D      [10] 3853 	ld	hl,#_g_hero_left
   79CC 22 A8 62      [16] 3854 	ld	((_prota + 0x0004)), hl
   79CF C9            [10] 3855 	ret
                           3856 ;src/main.c:738: void moverDerecha() {
                           3857 ;	---------------------------------
                           3858 ; Function moverDerecha
                           3859 ; ---------------------------------
   79D0                    3860 _moverDerecha::
                           3861 ;src/main.c:739: prota.mira = M_derecha;
   79D0 21 AB 62      [10] 3862 	ld	hl,#(_prota + 0x0007)
   79D3 36 00         [10] 3863 	ld	(hl),#0x00
                           3864 ;src/main.c:740: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   79D5 AF            [ 4] 3865 	xor	a, a
   79D6 F5            [11] 3866 	push	af
   79D7 33            [ 6] 3867 	inc	sp
   79D8 CD EB 64      [17] 3868 	call	_checkCollision
   79DB 33            [ 6] 3869 	inc	sp
   79DC 45            [ 4] 3870 	ld	b,l
   79DD 21 A4 62      [10] 3871 	ld	hl, #_prota + 0
   79E0 4E            [ 7] 3872 	ld	c,(hl)
   79E1 59            [ 4] 3873 	ld	e,c
   79E2 16 00         [ 7] 3874 	ld	d,#0x00
   79E4 21 07 00      [10] 3875 	ld	hl,#0x0007
   79E7 19            [11] 3876 	add	hl,de
   79E8 11 50 80      [10] 3877 	ld	de, #0x8050
   79EB 29            [11] 3878 	add	hl, hl
   79EC 3F            [ 4] 3879 	ccf
   79ED CB 1C         [ 8] 3880 	rr	h
   79EF CB 1D         [ 8] 3881 	rr	l
   79F1 ED 52         [15] 3882 	sbc	hl, de
   79F3 3E 00         [ 7] 3883 	ld	a,#0x00
   79F5 17            [ 4] 3884 	rla
   79F6 5F            [ 4] 3885 	ld	e,a
   79F7 78            [ 4] 3886 	ld	a,b
   79F8 B7            [ 4] 3887 	or	a,a
   79F9 20 14         [12] 3888 	jr	NZ,00104$
   79FB B3            [ 4] 3889 	or	a,e
   79FC 28 11         [12] 3890 	jr	Z,00104$
                           3891 ;src/main.c:741: prota.x++;
   79FE 0C            [ 4] 3892 	inc	c
   79FF 21 A4 62      [10] 3893 	ld	hl,#_prota
   7A02 71            [ 7] 3894 	ld	(hl),c
                           3895 ;src/main.c:742: prota.mover = SI;
   7A03 21 AA 62      [10] 3896 	ld	hl,#(_prota + 0x0006)
   7A06 36 01         [10] 3897 	ld	(hl),#0x01
                           3898 ;src/main.c:743: prota.sprite = g_hero;
   7A08 21 70 3E      [10] 3899 	ld	hl,#_g_hero
   7A0B 22 A8 62      [16] 3900 	ld	((_prota + 0x0004)), hl
   7A0E C9            [10] 3901 	ret
   7A0F                    3902 00104$:
                           3903 ;src/main.c:745: }else if( prota.x + G_HERO_W >= 80){
   7A0F 7B            [ 4] 3904 	ld	a,e
   7A10 B7            [ 4] 3905 	or	a, a
   7A11 C0            [11] 3906 	ret	NZ
                           3907 ;src/main.c:746: avanzarMapa();
   7A12 C3 64 79      [10] 3908 	jp  _avanzarMapa
                           3909 ;src/main.c:750: void moverArriba() {
                           3910 ;	---------------------------------
                           3911 ; Function moverArriba
                           3912 ; ---------------------------------
   7A15                    3913 _moverArriba::
                           3914 ;src/main.c:751: prota.mira = M_arriba;
   7A15 21 AB 62      [10] 3915 	ld	hl,#(_prota + 0x0007)
   7A18 36 02         [10] 3916 	ld	(hl),#0x02
                           3917 ;src/main.c:752: if (!checkCollision(M_arriba)) {
   7A1A 3E 02         [ 7] 3918 	ld	a,#0x02
   7A1C F5            [11] 3919 	push	af
   7A1D 33            [ 6] 3920 	inc	sp
   7A1E CD EB 64      [17] 3921 	call	_checkCollision
   7A21 33            [ 6] 3922 	inc	sp
   7A22 7D            [ 4] 3923 	ld	a,l
   7A23 B7            [ 4] 3924 	or	a, a
   7A24 C0            [11] 3925 	ret	NZ
                           3926 ;src/main.c:753: prota.y--;
   7A25 21 A5 62      [10] 3927 	ld	hl,#_prota + 1
   7A28 4E            [ 7] 3928 	ld	c,(hl)
   7A29 0D            [ 4] 3929 	dec	c
   7A2A 71            [ 7] 3930 	ld	(hl),c
                           3931 ;src/main.c:754: prota.y--;
   7A2B 0D            [ 4] 3932 	dec	c
   7A2C 71            [ 7] 3933 	ld	(hl),c
                           3934 ;src/main.c:755: prota.mover  = SI;
   7A2D 21 AA 62      [10] 3935 	ld	hl,#(_prota + 0x0006)
   7A30 36 01         [10] 3936 	ld	(hl),#0x01
                           3937 ;src/main.c:756: prota.sprite = g_hero_up;
   7A32 21 2C 3D      [10] 3938 	ld	hl,#_g_hero_up
   7A35 22 A8 62      [16] 3939 	ld	((_prota + 0x0004)), hl
   7A38 C9            [10] 3940 	ret
                           3941 ;src/main.c:760: void moverAbajo() {
                           3942 ;	---------------------------------
                           3943 ; Function moverAbajo
                           3944 ; ---------------------------------
   7A39                    3945 _moverAbajo::
                           3946 ;src/main.c:761: prota.mira = M_abajo;
   7A39 21 AB 62      [10] 3947 	ld	hl,#(_prota + 0x0007)
   7A3C 36 03         [10] 3948 	ld	(hl),#0x03
                           3949 ;src/main.c:762: if (!checkCollision(M_abajo) ) {
   7A3E 3E 03         [ 7] 3950 	ld	a,#0x03
   7A40 F5            [11] 3951 	push	af
   7A41 33            [ 6] 3952 	inc	sp
   7A42 CD EB 64      [17] 3953 	call	_checkCollision
   7A45 33            [ 6] 3954 	inc	sp
   7A46 7D            [ 4] 3955 	ld	a,l
   7A47 B7            [ 4] 3956 	or	a, a
   7A48 C0            [11] 3957 	ret	NZ
                           3958 ;src/main.c:763: prota.y++;
   7A49 01 A5 62      [10] 3959 	ld	bc,#_prota + 1
   7A4C 0A            [ 7] 3960 	ld	a,(bc)
   7A4D 3C            [ 4] 3961 	inc	a
   7A4E 02            [ 7] 3962 	ld	(bc),a
                           3963 ;src/main.c:764: prota.y++;
   7A4F 3C            [ 4] 3964 	inc	a
   7A50 02            [ 7] 3965 	ld	(bc),a
                           3966 ;src/main.c:765: prota.mover  = SI;
   7A51 21 AA 62      [10] 3967 	ld	hl,#(_prota + 0x0006)
   7A54 36 01         [10] 3968 	ld	(hl),#0x01
                           3969 ;src/main.c:766: prota.sprite = g_hero_down;
   7A56 21 92 3C      [10] 3970 	ld	hl,#_g_hero_down
   7A59 22 A8 62      [16] 3971 	ld	((_prota + 0x0004)), hl
   7A5C C9            [10] 3972 	ret
                           3973 ;src/main.c:773: void intHandler() {
                           3974 ;	---------------------------------
                           3975 ; Function intHandler
                           3976 ; ---------------------------------
   7A5D                    3977 _intHandler::
                           3978 ;src/main.c:774: if (++i == 6) {
   7A5D 21 B6 62      [10] 3979 	ld	hl, #_i+0
   7A60 34            [11] 3980 	inc	(hl)
   7A61 3A B6 62      [13] 3981 	ld	a,(#_i + 0)
   7A64 D6 06         [ 7] 3982 	sub	a, #0x06
   7A66 C0            [11] 3983 	ret	NZ
                           3984 ;src/main.c:775: play();
   7A67 CD F0 51      [17] 3985 	call	_play
                           3986 ;src/main.c:776: i=0;
   7A6A 21 B6 62      [10] 3987 	ld	hl,#_i + 0
   7A6D 36 00         [10] 3988 	ld	(hl), #0x00
   7A6F C9            [10] 3989 	ret
                           3990 ;src/main.c:780: void inicializarCPC() {
                           3991 ;	---------------------------------
                           3992 ; Function inicializarCPC
                           3993 ; ---------------------------------
   7A70                    3994 _inicializarCPC::
                           3995 ;src/main.c:781: cpct_disableFirmware();
   7A70 CD 97 55      [17] 3996 	call	_cpct_disableFirmware
                           3997 ;src/main.c:782: cpct_setVideoMode(0);
   7A73 2E 00         [ 7] 3998 	ld	l,#0x00
   7A75 CD 6B 55      [17] 3999 	call	_cpct_setVideoMode
                           4000 ;src/main.c:783: cpct_setBorder(HW_BLACK);
   7A78 21 10 14      [10] 4001 	ld	hl,#0x1410
   7A7B E5            [11] 4002 	push	hl
   7A7C CD CE 52      [17] 4003 	call	_cpct_setPALColour
                           4004 ;src/main.c:784: cpct_setPalette(g_palette, 16);
   7A7F 21 10 00      [10] 4005 	ld	hl,#0x0010
   7A82 E5            [11] 4006 	push	hl
   7A83 21 60 3E      [10] 4007 	ld	hl,#_g_palette
   7A86 E5            [11] 4008 	push	hl
   7A87 CD AB 52      [17] 4009 	call	_cpct_setPalette
   7A8A C9            [10] 4010 	ret
                           4011 ;src/main.c:789: void inicializarJuego() {
                           4012 ;	---------------------------------
                           4013 ; Function inicializarJuego
                           4014 ; ---------------------------------
   7A8B                    4015 _inicializarJuego::
                           4016 ;src/main.c:791: num_mapa = 0;
   7A8B 21 82 63      [10] 4017 	ld	hl,#_num_mapa + 0
   7A8E 36 00         [10] 4018 	ld	(hl), #0x00
                           4019 ;src/main.c:792: mapa = mapas[num_mapa];
   7A90 21 A0 63      [10] 4020 	ld	hl, #_mapas + 0
   7A93 7E            [ 7] 4021 	ld	a,(hl)
   7A94 FD 21 80 63   [14] 4022 	ld	iy,#_mapa
   7A98 FD 77 00      [19] 4023 	ld	0 (iy),a
   7A9B 23            [ 6] 4024 	inc	hl
   7A9C 7E            [ 7] 4025 	ld	a,(hl)
   7A9D 32 81 63      [13] 4026 	ld	(#_mapa + 1),a
                           4027 ;src/main.c:793: cpct_etm_setTileset2x4(g_tileset);
   7AA0 21 E0 17      [10] 4028 	ld	hl,#_g_tileset
   7AA3 CD BF 54      [17] 4029 	call	_cpct_etm_setTileset2x4
                           4030 ;src/main.c:795: dibujarMapa();
   7AA6 CD 8A 63      [17] 4031 	call	_dibujarMapa
                           4032 ;src/main.c:798: barraPuntuacionInicial();
   7AA9 CD FC 4F      [17] 4033 	call	_barraPuntuacionInicial
                           4034 ;src/main.c:801: prota.x = prota.px = 4;
   7AAC 21 A6 62      [10] 4035 	ld	hl,#(_prota + 0x0002)
   7AAF 36 04         [10] 4036 	ld	(hl),#0x04
   7AB1 21 A4 62      [10] 4037 	ld	hl,#_prota
   7AB4 36 04         [10] 4038 	ld	(hl),#0x04
                           4039 ;src/main.c:802: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   7AB6 21 A7 62      [10] 4040 	ld	hl,#(_prota + 0x0003)
   7AB9 36 68         [10] 4041 	ld	(hl),#0x68
   7ABB 21 A5 62      [10] 4042 	ld	hl,#(_prota + 0x0001)
   7ABE 36 68         [10] 4043 	ld	(hl),#0x68
                           4044 ;src/main.c:803: prota.mover  = NO;
   7AC0 21 AA 62      [10] 4045 	ld	hl,#(_prota + 0x0006)
   7AC3 36 00         [10] 4046 	ld	(hl),#0x00
                           4047 ;src/main.c:804: prota.mira=M_derecha;
   7AC5 21 AB 62      [10] 4048 	ld	hl,#(_prota + 0x0007)
   7AC8 36 00         [10] 4049 	ld	(hl),#0x00
                           4050 ;src/main.c:805: prota.sprite = g_hero;
   7ACA 21 70 3E      [10] 4051 	ld	hl,#_g_hero
   7ACD 22 A8 62      [16] 4052 	ld	((_prota + 0x0004)), hl
                           4053 ;src/main.c:809: cu.x = cu.px = 0;
   7AD0 21 AE 62      [10] 4054 	ld	hl,#(_cu + 0x0002)
   7AD3 36 00         [10] 4055 	ld	(hl),#0x00
   7AD5 21 AC 62      [10] 4056 	ld	hl,#_cu
   7AD8 36 00         [10] 4057 	ld	(hl),#0x00
                           4058 ;src/main.c:810: cu.y = cu.py = 0;
   7ADA 21 AF 62      [10] 4059 	ld	hl,#(_cu + 0x0003)
   7ADD 36 00         [10] 4060 	ld	(hl),#0x00
   7ADF 21 AD 62      [10] 4061 	ld	hl,#(_cu + 0x0001)
   7AE2 36 00         [10] 4062 	ld	(hl),#0x00
                           4063 ;src/main.c:811: cu.lanzado = NO;
   7AE4 21 B2 62      [10] 4064 	ld	hl,#(_cu + 0x0006)
   7AE7 36 00         [10] 4065 	ld	(hl),#0x00
                           4066 ;src/main.c:812: cu.mover = NO;
   7AE9 21 B5 62      [10] 4067 	ld	hl,#(_cu + 0x0009)
   7AEC 36 00         [10] 4068 	ld	(hl),#0x00
                           4069 ;src/main.c:814: inicializarEnemy();
   7AEE CD 4B 78      [17] 4070 	call	_inicializarEnemy
                           4071 ;src/main.c:816: dibujarProta();
   7AF1 C3 D6 63      [10] 4072 	jp  _dibujarProta
                           4073 ;src/main.c:819: void main(void) {
                           4074 ;	---------------------------------
                           4075 ; Function main
                           4076 ; ---------------------------------
   7AF4                    4077 _main::
   7AF4 DD E5         [15] 4078 	push	ix
   7AF6 DD 21 00 00   [14] 4079 	ld	ix,#0
   7AFA DD 39         [15] 4080 	add	ix,sp
   7AFC F5            [11] 4081 	push	af
   7AFD 3B            [ 6] 4082 	dec	sp
                           4083 ;src/main.c:824: inicializarCPC();
   7AFE CD 70 7A      [17] 4084 	call	_inicializarCPC
                           4085 ;src/main.c:826: menuInicio();
   7B01 CD 1D 4F      [17] 4086 	call	_menuInicio
                           4087 ;src/main.c:828: inicializarJuego();
   7B04 CD 8B 7A      [17] 4088 	call	_inicializarJuego
                           4089 ;src/main.c:832: while (1) {
   7B07                    4090 00119$:
                           4091 ;src/main.c:835: actual = enemy;
                           4092 ;src/main.c:837: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   7B07 21 00 01      [10] 4093 	ld	hl,#_g_tablatrans
   7B0A E5            [11] 4094 	push	hl
   7B0B 2A 80 63      [16] 4095 	ld	hl,(_mapa)
   7B0E E5            [11] 4096 	push	hl
   7B0F 21 A4 62      [10] 4097 	ld	hl,#_prota
   7B12 E5            [11] 4098 	push	hl
   7B13 21 AC 62      [10] 4099 	ld	hl,#_cu
   7B16 E5            [11] 4100 	push	hl
   7B17 CD 84 64      [17] 4101 	call	_comprobarTeclado
   7B1A 21 08 00      [10] 4102 	ld	hl,#8
   7B1D 39            [11] 4103 	add	hl,sp
   7B1E F9            [ 6] 4104 	ld	sp,hl
                           4105 ;src/main.c:838: moverCuchillo(&cu, mapa);
   7B1F 2A 80 63      [16] 4106 	ld	hl,(_mapa)
   7B22 E5            [11] 4107 	push	hl
   7B23 21 AC 62      [10] 4108 	ld	hl,#_cu
   7B26 E5            [11] 4109 	push	hl
   7B27 CD 00 43      [17] 4110 	call	_moverCuchillo
   7B2A F1            [10] 4111 	pop	af
   7B2B F1            [10] 4112 	pop	af
                           4113 ;src/main.c:839: while(i){
   7B2C DD 36 FD 02   [19] 4114 	ld	-3 (ix),#0x02
   7B30 DD 36 FE 1C   [19] 4115 	ld	-2 (ix),#<(_enemy)
   7B34 DD 36 FF 5F   [19] 4116 	ld	-1 (ix),#>(_enemy)
   7B38                    4117 00101$:
   7B38 DD 7E FD      [19] 4118 	ld	a,-3 (ix)
   7B3B B7            [ 4] 4119 	or	a, a
   7B3C 28 20         [12] 4120 	jr	Z,00103$
                           4121 ;src/main.c:840: --i;
   7B3E DD 35 FD      [23] 4122 	dec	-3 (ix)
                           4123 ;src/main.c:841: updateEnemy(actual);
   7B41 DD 6E FE      [19] 4124 	ld	l,-2 (ix)
   7B44 DD 66 FF      [19] 4125 	ld	h,-1 (ix)
   7B47 E5            [11] 4126 	push	hl
   7B48 CD D9 76      [17] 4127 	call	_updateEnemy
   7B4B F1            [10] 4128 	pop	af
                           4129 ;src/main.c:842: ++actual;
   7B4C DD 7E FE      [19] 4130 	ld	a,-2 (ix)
   7B4F C6 E2         [ 7] 4131 	add	a, #0xE2
   7B51 DD 77 FE      [19] 4132 	ld	-2 (ix),a
   7B54 DD 7E FF      [19] 4133 	ld	a,-1 (ix)
   7B57 CE 00         [ 7] 4134 	adc	a, #0x00
   7B59 DD 77 FF      [19] 4135 	ld	-1 (ix),a
   7B5C 18 DA         [12] 4136 	jr	00101$
   7B5E                    4137 00103$:
                           4138 ;src/main.c:845: cpct_waitVSYNC();
   7B5E CD 63 55      [17] 4139 	call	_cpct_waitVSYNC
                           4140 ;src/main.c:848: if (prota.mover) {
   7B61 01 AA 62      [10] 4141 	ld	bc,#_prota + 6
   7B64 0A            [ 7] 4142 	ld	a,(bc)
   7B65 B7            [ 4] 4143 	or	a, a
   7B66 28 07         [12] 4144 	jr	Z,00105$
                           4145 ;src/main.c:849: redibujarProta();
   7B68 C5            [11] 4146 	push	bc
   7B69 CD 70 64      [17] 4147 	call	_redibujarProta
   7B6C C1            [10] 4148 	pop	bc
                           4149 ;src/main.c:850: prota.mover = NO;
   7B6D AF            [ 4] 4150 	xor	a, a
   7B6E 02            [ 7] 4151 	ld	(bc),a
   7B6F                    4152 00105$:
                           4153 ;src/main.c:852: if(cu.lanzado && cu.mover){
   7B6F 21 B2 62      [10] 4154 	ld	hl, #(_cu + 0x0006) + 0
   7B72 4E            [ 7] 4155 	ld	c,(hl)
                           4156 ;src/main.c:853: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4157 ;src/main.c:852: if(cu.lanzado && cu.mover){
   7B73 79            [ 4] 4158 	ld	a,c
   7B74 B7            [ 4] 4159 	or	a, a
   7B75 28 30         [12] 4160 	jr	Z,00110$
   7B77 3A B5 62      [13] 4161 	ld	a, (#(_cu + 0x0009) + 0)
   7B7A B7            [ 4] 4162 	or	a, a
   7B7B 28 2A         [12] 4163 	jr	Z,00110$
                           4164 ;src/main.c:853: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   7B7D 21 AD 62      [10] 4165 	ld	hl, #(_cu + 0x0001) + 0
   7B80 4E            [ 7] 4166 	ld	c,(hl)
   7B81 21 AC 62      [10] 4167 	ld	hl, #_cu + 0
   7B84 46            [ 7] 4168 	ld	b,(hl)
   7B85 21 B4 62      [10] 4169 	ld	hl, #(_cu + 0x0008) + 0
   7B88 5E            [ 7] 4170 	ld	e,(hl)
   7B89 2A 80 63      [16] 4171 	ld	hl,(_mapa)
   7B8C E5            [11] 4172 	push	hl
   7B8D 21 00 01      [10] 4173 	ld	hl,#_g_tablatrans
   7B90 E5            [11] 4174 	push	hl
   7B91 21 AC 62      [10] 4175 	ld	hl,#_cu
   7B94 E5            [11] 4176 	push	hl
   7B95 79            [ 4] 4177 	ld	a,c
   7B96 F5            [11] 4178 	push	af
   7B97 33            [ 6] 4179 	inc	sp
   7B98 C5            [11] 4180 	push	bc
   7B99 33            [ 6] 4181 	inc	sp
   7B9A 7B            [ 4] 4182 	ld	a,e
   7B9B F5            [11] 4183 	push	af
   7B9C 33            [ 6] 4184 	inc	sp
   7B9D CD 25 40      [17] 4185 	call	_redibujarCuchillo
   7BA0 21 09 00      [10] 4186 	ld	hl,#9
   7BA3 39            [11] 4187 	add	hl,sp
   7BA4 F9            [ 6] 4188 	ld	sp,hl
   7BA5 18 28         [12] 4189 	jr	00111$
   7BA7                    4190 00110$:
                           4191 ;src/main.c:854: }else if (cu.lanzado && !cu.mover){
   7BA7 79            [ 4] 4192 	ld	a,c
   7BA8 B7            [ 4] 4193 	or	a, a
   7BA9 28 24         [12] 4194 	jr	Z,00111$
   7BAB 3A B5 62      [13] 4195 	ld	a, (#(_cu + 0x0009) + 0)
   7BAE B7            [ 4] 4196 	or	a, a
   7BAF 20 1E         [12] 4197 	jr	NZ,00111$
                           4198 ;src/main.c:855: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   7BB1 21 AD 62      [10] 4199 	ld	hl, #(_cu + 0x0001) + 0
   7BB4 46            [ 7] 4200 	ld	b,(hl)
   7BB5 21 AC 62      [10] 4201 	ld	hl, #_cu + 0
   7BB8 4E            [ 7] 4202 	ld	c,(hl)
   7BB9 21 B4 62      [10] 4203 	ld	hl, #(_cu + 0x0008) + 0
   7BBC 56            [ 7] 4204 	ld	d,(hl)
   7BBD 2A 80 63      [16] 4205 	ld	hl,(_mapa)
   7BC0 E5            [11] 4206 	push	hl
   7BC1 C5            [11] 4207 	push	bc
   7BC2 D5            [11] 4208 	push	de
   7BC3 33            [ 6] 4209 	inc	sp
   7BC4 CD 92 3F      [17] 4210 	call	_borrarCuchillo
   7BC7 F1            [10] 4211 	pop	af
   7BC8 F1            [10] 4212 	pop	af
   7BC9 33            [ 6] 4213 	inc	sp
                           4214 ;src/main.c:856: cu.lanzado = NO;
   7BCA 21 B2 62      [10] 4215 	ld	hl,#(_cu + 0x0006)
   7BCD 36 00         [10] 4216 	ld	(hl),#0x00
   7BCF                    4217 00111$:
                           4218 ;src/main.c:860: actual = enemy;
   7BCF 01 1C 5F      [10] 4219 	ld	bc,#_enemy
                           4220 ;src/main.c:861: while(i){
   7BD2 DD 36 FD 02   [19] 4221 	ld	-3 (ix),#0x02
   7BD6                    4222 00115$:
   7BD6 DD 7E FD      [19] 4223 	ld	a,-3 (ix)
   7BD9 B7            [ 4] 4224 	or	a, a
   7BDA 28 2C         [12] 4225 	jr	Z,00117$
                           4226 ;src/main.c:863: --i;
   7BDC DD 35 FD      [23] 4227 	dec	-3 (ix)
                           4228 ;src/main.c:864: if(actual->mover){
   7BDF C5            [11] 4229 	push	bc
   7BE0 FD E1         [14] 4230 	pop	iy
   7BE2 FD 7E 06      [19] 4231 	ld	a,6 (iy)
   7BE5 B7            [ 4] 4232 	or	a, a
   7BE6 28 18         [12] 4233 	jr	Z,00114$
                           4234 ;src/main.c:865: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7BE8 69            [ 4] 4235 	ld	l, c
   7BE9 60            [ 4] 4236 	ld	h, b
   7BEA 23            [ 6] 4237 	inc	hl
   7BEB 23            [ 6] 4238 	inc	hl
   7BEC 23            [ 6] 4239 	inc	hl
   7BED 5E            [ 7] 4240 	ld	e,(hl)
   7BEE 69            [ 4] 4241 	ld	l, c
   7BEF 60            [ 4] 4242 	ld	h, b
   7BF0 23            [ 6] 4243 	inc	hl
   7BF1 23            [ 6] 4244 	inc	hl
   7BF2 56            [ 7] 4245 	ld	d,(hl)
   7BF3 C5            [11] 4246 	push	bc
   7BF4 C5            [11] 4247 	push	bc
   7BF5 7B            [ 4] 4248 	ld	a,e
   7BF6 F5            [11] 4249 	push	af
   7BF7 33            [ 6] 4250 	inc	sp
   7BF8 D5            [11] 4251 	push	de
   7BF9 33            [ 6] 4252 	inc	sp
   7BFA CD B5 67      [17] 4253 	call	_redibujarEnemigo
   7BFD F1            [10] 4254 	pop	af
   7BFE F1            [10] 4255 	pop	af
   7BFF C1            [10] 4256 	pop	bc
   7C00                    4257 00114$:
                           4258 ;src/main.c:878: ++actual;
   7C00 21 E2 00      [10] 4259 	ld	hl,#0x00E2
   7C03 09            [11] 4260 	add	hl,bc
   7C04 4D            [ 4] 4261 	ld	c,l
   7C05 44            [ 4] 4262 	ld	b,h
   7C06 18 CE         [12] 4263 	jr	00115$
   7C08                    4264 00117$:
                           4265 ;src/main.c:880: cpct_waitVSYNC();
   7C08 CD 63 55      [17] 4266 	call	_cpct_waitVSYNC
   7C0B C3 07 7B      [10] 4267 	jp	00119$
                           4268 	.area _CODE
                           4269 	.area _INITIALIZER
   6385                    4270 __xinit__mapa:
   6385 00 00              4271 	.dw #0x0000
   6387                    4272 __xinit__num_mapa:
   6387 00                 4273 	.db #0x00	; 0
   6388                    4274 __xinit__puntuacion:
   6388 00                 4275 	.db #0x00	; 0
   6389                    4276 __xinit__vidas:
   6389 05                 4277 	.db #0x05	; 5
                           4278 	.area _CABS (ABS)
