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
                             58 	.globl _cpct_akp_musicInit
                             59 	.globl _cpct_getScreenPtr
                             60 	.globl _cpct_setPALColour
                             61 	.globl _cpct_setPalette
                             62 	.globl _cpct_waitVSYNC
                             63 	.globl _cpct_setVideoMode
                             64 	.globl _cpct_drawSpriteMaskedAlignedTable
                             65 	.globl _cpct_isAnyKeyPressed
                             66 	.globl _cpct_isKeyPressed
                             67 	.globl _cpct_scanKeyboard_if
                             68 	.globl _cpct_setInterruptHandler
                             69 	.globl _cpct_disableFirmware
                             70 	.globl _puntuacion
                             71 	.globl _num_mapa
                             72 	.globl _mapa
                             73 	.globl _i
                             74 	.globl _vidas
                             75 	.globl _timer
                             76 	.globl _cambio
                             77 	.globl _parpadeo
                             78 	.globl _cu
                             79 	.globl _prota
                             80 	.globl _enemy
                             81 	.globl _patrolY
                             82 	.globl _patrolX
                             83 	.globl _spawnY
                             84 	.globl _spawnX
                             85 	.globl _mapas
                             86 ;--------------------------------------------------------
                             87 ; special function registers
                             88 ;--------------------------------------------------------
                             89 ;--------------------------------------------------------
                             90 ; ram data
                             91 ;--------------------------------------------------------
                             92 	.area _DATA
   6102                      93 _enemy::
   6102                      94 	.ds 908
   648E                      95 _prota::
   648E                      96 	.ds 8
   6496                      97 _cu::
   6496                      98 	.ds 11
   64A1                      99 _parpadeo::
   64A1                     100 	.ds 1
   64A2                     101 _cambio::
   64A2                     102 	.ds 1
   64A3                     103 _timer::
   64A3                     104 	.ds 2
   64A5                     105 _vidas::
   64A5                     106 	.ds 1
   64A6                     107 _i::
   64A6                     108 	.ds 1
                            109 ;--------------------------------------------------------
                            110 ; ram data
                            111 ;--------------------------------------------------------
                            112 	.area _INITIALIZED
   6570                     113 _mapa::
   6570                     114 	.ds 2
   6572                     115 _num_mapa::
   6572                     116 	.ds 1
   6573                     117 _puntuacion::
   6573                     118 	.ds 1
                            119 ;--------------------------------------------------------
                            120 ; absolute external ram data
                            121 ;--------------------------------------------------------
                            122 	.area _DABS (ABS)
                            123 ;--------------------------------------------------------
                            124 ; global & static initialisations
                            125 ;--------------------------------------------------------
                            126 	.area _HOME
                            127 	.area _GSINIT
                            128 	.area _GSFINAL
                            129 	.area _GSINIT
                            130 ;--------------------------------------------------------
                            131 ; Home
                            132 ;--------------------------------------------------------
                            133 	.area _HOME
                            134 	.area _HOME
                            135 ;--------------------------------------------------------
                            136 ; code
                            137 ;--------------------------------------------------------
                            138 	.area _CODE
                            139 ;src/main.c:111: cpctm_createTransparentMaskTable(g_tablatrans, 0x0100, M0, 0);
                            140 ;	---------------------------------
                            141 ; Function dummy_cpct_transparentMaskTable0M0_container
                            142 ; ---------------------------------
   444C                     143 _dummy_cpct_transparentMaskTable0M0_container::
                            144 	.area _g_tablatrans_ (ABS) 
   0100                     145 	.org 0x0100 
   0100                     146 	 _g_tablatrans::
   0100 FF AA 55 00 AA AA   147 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0108 55 00 55 00 00 00   148 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0110 AA AA 00 00 AA AA   149 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0118 00 00 00 00 00 00   150 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0120 55 00 55 00 00 00   151 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0128 55 00 55 00 00 00   152 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0130 00 00 00 00 00 00   153 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0138 00 00 00 00 00 00   154 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0140 AA AA 00 00 AA AA   155 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0148 00 00 00 00 00 00   156 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0150 AA AA 00 00 AA AA   157 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0158 00 00 00 00 00 00   158 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0160 00 00 00 00 00 00   159 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0168 00 00 00 00 00 00   160 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0170 00 00 00 00 00 00   161 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0178 00 00 00 00 00 00   162 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0180 55 00 55 00 00 00   163 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0188 55 00 55 00 00 00   164 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0190 00 00 00 00 00 00   165 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0198 00 00 00 00 00 00   166 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A0 55 00 55 00 00 00   167 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A8 55 00 55 00 00 00   168 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B0 00 00 00 00 00 00   169 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B8 00 00 00 00 00 00   170 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C0 00 00 00 00 00 00   171 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C8 00 00 00 00 00 00   172 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D0 00 00 00 00 00 00   173 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D8 00 00 00 00 00 00   174 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E0 00 00 00 00 00 00   175 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E8 00 00 00 00 00 00   176 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F0 00 00 00 00 00 00   177 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F8 00 00 00 00 00 00   178 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            179 	.area _CSEG (REL, CON) 
                            180 ;src/main.c:114: void dibujarMapa() {
                            181 ;	---------------------------------
                            182 ; Function dibujarMapa
                            183 ; ---------------------------------
   6578                     184 _dibujarMapa::
                            185 ;src/main.c:117: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, p, mapa);
   6578 2A 70 65      [16]  186 	ld	hl,(_mapa)
   657B E5            [11]  187 	push	hl
   657C 21 F0 C0      [10]  188 	ld	hl,#0xC0F0
   657F E5            [11]  189 	push	hl
   6580 21 2C 28      [10]  190 	ld	hl,#0x282C
   6583 E5            [11]  191 	push	hl
   6584 2E 00         [ 7]  192 	ld	l, #0x00
   6586 E5            [11]  193 	push	hl
   6587 AF            [ 4]  194 	xor	a, a
   6588 F5            [11]  195 	push	af
   6589 33            [ 6]  196 	inc	sp
   658A CD 61 55      [17]  197 	call	_cpct_etm_drawTileBox2x4
   658D C9            [10]  198 	ret
   658E                     199 _mapas:
   658E C0 10               200 	.dw _g_map1
   6590 E0 09               201 	.dw _g_map2
   6592 00 03               202 	.dw _g_map3
   6594                     203 _spawnX:
   6594 24                  204 	.db #0x24	; 36
   6595 47                  205 	.db #0x47	; 71	'G'
   6596 30                  206 	.db #0x30	; 48	'0'
   6597 18                  207 	.db #0x18	; 24
   6598                     208 _spawnY:
   6598 2C                  209 	.db #0x2C	; 44
   6599 66                  210 	.db #0x66	; 102	'f'
   659A 9A                  211 	.db #0x9A	; 154
   659B 40                  212 	.db #0x40	; 64
   659C                     213 _patrolX:
   659C 00                  214 	.db #0x00	; 0
   659D 00                  215 	.db #0x00	; 0
   659E 00                  216 	.db #0x00	; 0
   659F 00                  217 	.db #0x00	; 0
   65A0 00                  218 	.db #0x00	; 0
   65A1 42                  219 	.db #0x42	; 66	'B'
   65A2 33                  220 	.db #0x33	; 51	'3'
   65A3 00                  221 	.db #0x00	; 0
   65A4 00                  222 	.db #0x00	; 0
   65A5 00                  223 	.db 0x00
   65A6 10                  224 	.db #0x10	; 16
   65A7 33                  225 	.db #0x33	; 51	'3'
   65A8 19                  226 	.db #0x19	; 25
   65A9 00                  227 	.db #0x00	; 0
   65AA 00                  228 	.db 0x00
   65AB 24                  229 	.db #0x24	; 36
   65AC 3C                  230 	.db #0x3C	; 60
   65AD 30                  231 	.db #0x30	; 48	'0'
   65AE 18                  232 	.db #0x18	; 24
   65AF 00                  233 	.db 0x00
   65B0                     234 _patrolY:
   65B0 00                  235 	.db #0x00	; 0
   65B1 00                  236 	.db #0x00	; 0
   65B2 00                  237 	.db #0x00	; 0
   65B3 00                  238 	.db #0x00	; 0
   65B4 00                  239 	.db 0x00
   65B5 5E                  240 	.db #0x5E	; 94
   65B6 A6                  241 	.db #0xA6	; 166
   65B7 00                  242 	.db #0x00	; 0
   65B8 00                  243 	.db #0x00	; 0
   65B9 00                  244 	.db 0x00
   65BA 2C                  245 	.db #0x2C	; 44
   65BB 66                  246 	.db #0x66	; 102	'f'
   65BC 9A                  247 	.db #0x9A	; 154
   65BD 00                  248 	.db #0x00	; 0
   65BE 00                  249 	.db 0x00
   65BF 90                  250 	.db #0x90	; 144
   65C0 66                  251 	.db #0x66	; 102	'f'
   65C1 2C                  252 	.db #0x2C	; 44
   65C2 86                  253 	.db #0x86	; 134
   65C3 00                  254 	.db 0x00
                            255 ;src/main.c:120: void dibujarProta() {
                            256 ;	---------------------------------
                            257 ; Function dibujarProta
                            258 ; ---------------------------------
   65C4                     259 _dibujarProta::
                            260 ;src/main.c:121: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   65C4 21 8F 64      [10]  261 	ld	hl, #_prota + 1
   65C7 56            [ 7]  262 	ld	d,(hl)
   65C8 21 8E 64      [10]  263 	ld	hl, #_prota + 0
   65CB 46            [ 7]  264 	ld	b,(hl)
   65CC D5            [11]  265 	push	de
   65CD 33            [ 6]  266 	inc	sp
   65CE C5            [11]  267 	push	bc
   65CF 33            [ 6]  268 	inc	sp
   65D0 21 00 C0      [10]  269 	ld	hl,#0xC000
   65D3 E5            [11]  270 	push	hl
   65D4 CD 7F 60      [17]  271 	call	_cpct_getScreenPtr
   65D7 EB            [ 4]  272 	ex	de,hl
                            273 ;src/main.c:122: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   65D8 ED 4B 92 64   [20]  274 	ld	bc, (#_prota + 4)
   65DC 21 00 01      [10]  275 	ld	hl,#_g_tablatrans
   65DF E5            [11]  276 	push	hl
   65E0 21 07 16      [10]  277 	ld	hl,#0x1607
   65E3 E5            [11]  278 	push	hl
   65E4 D5            [11]  279 	push	de
   65E5 C5            [11]  280 	push	bc
   65E6 CD 9F 60      [17]  281 	call	_cpct_drawSpriteMaskedAlignedTable
   65E9 C9            [10]  282 	ret
                            283 ;src/main.c:125: void borrarProta() {
                            284 ;	---------------------------------
                            285 ; Function borrarProta
                            286 ; ---------------------------------
   65EA                     287 _borrarProta::
   65EA DD E5         [15]  288 	push	ix
   65EC DD 21 00 00   [14]  289 	ld	ix,#0
   65F0 DD 39         [15]  290 	add	ix,sp
   65F2 F5            [11]  291 	push	af
   65F3 3B            [ 6]  292 	dec	sp
                            293 ;src/main.c:129: u8 w = 4 + (prota.px & 1);
   65F4 21 90 64      [10]  294 	ld	hl, #_prota + 2
   65F7 4E            [ 7]  295 	ld	c,(hl)
   65F8 79            [ 4]  296 	ld	a,c
   65F9 E6 01         [ 7]  297 	and	a, #0x01
   65FB 47            [ 4]  298 	ld	b,a
   65FC 04            [ 4]  299 	inc	b
   65FD 04            [ 4]  300 	inc	b
   65FE 04            [ 4]  301 	inc	b
   65FF 04            [ 4]  302 	inc	b
                            303 ;src/main.c:132: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   6600 21 91 64      [10]  304 	ld	hl, #_prota + 3
   6603 5E            [ 7]  305 	ld	e,(hl)
   6604 CB 4B         [ 8]  306 	bit	1, e
   6606 28 04         [12]  307 	jr	Z,00103$
   6608 3E 01         [ 7]  308 	ld	a,#0x01
   660A 18 02         [12]  309 	jr	00104$
   660C                     310 00103$:
   660C 3E 00         [ 7]  311 	ld	a,#0x00
   660E                     312 00104$:
   660E C6 06         [ 7]  313 	add	a, #0x06
   6610 DD 77 FD      [19]  314 	ld	-3 (ix),a
                            315 ;src/main.c:134: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   6613 FD 2A 70 65   [20]  316 	ld	iy,(_mapa)
   6617 16 00         [ 7]  317 	ld	d,#0x00
   6619 7B            [ 4]  318 	ld	a,e
   661A C6 E8         [ 7]  319 	add	a,#0xE8
   661C DD 77 FE      [19]  320 	ld	-2 (ix),a
   661F 7A            [ 4]  321 	ld	a,d
   6620 CE FF         [ 7]  322 	adc	a,#0xFF
   6622 DD 77 FF      [19]  323 	ld	-1 (ix),a
   6625 DD 6E FE      [19]  324 	ld	l,-2 (ix)
   6628 DD 66 FF      [19]  325 	ld	h,-1 (ix)
   662B DD CB FF 7E   [20]  326 	bit	7, -1 (ix)
   662F 28 04         [12]  327 	jr	Z,00105$
   6631 21 EB FF      [10]  328 	ld	hl,#0xFFEB
   6634 19            [11]  329 	add	hl,de
   6635                     330 00105$:
   6635 CB 2C         [ 8]  331 	sra	h
   6637 CB 1D         [ 8]  332 	rr	l
   6639 CB 2C         [ 8]  333 	sra	h
   663B CB 1D         [ 8]  334 	rr	l
   663D 55            [ 4]  335 	ld	d,l
   663E CB 39         [ 8]  336 	srl	c
   6640 FD E5         [15]  337 	push	iy
   6642 21 F0 C0      [10]  338 	ld	hl,#0xC0F0
   6645 E5            [11]  339 	push	hl
   6646 3E 28         [ 7]  340 	ld	a,#0x28
   6648 F5            [11]  341 	push	af
   6649 33            [ 6]  342 	inc	sp
   664A DD 7E FD      [19]  343 	ld	a,-3 (ix)
   664D F5            [11]  344 	push	af
   664E 33            [ 6]  345 	inc	sp
   664F C5            [11]  346 	push	bc
   6650 33            [ 6]  347 	inc	sp
   6651 D5            [11]  348 	push	de
   6652 33            [ 6]  349 	inc	sp
   6653 79            [ 4]  350 	ld	a,c
   6654 F5            [11]  351 	push	af
   6655 33            [ 6]  352 	inc	sp
   6656 CD 61 55      [17]  353 	call	_cpct_etm_drawTileBox2x4
   6659 DD F9         [10]  354 	ld	sp, ix
   665B DD E1         [14]  355 	pop	ix
   665D C9            [10]  356 	ret
                            357 ;src/main.c:137: void redibujarProta() {
                            358 ;	---------------------------------
                            359 ; Function redibujarProta
                            360 ; ---------------------------------
   665E                     361 _redibujarProta::
                            362 ;src/main.c:138: borrarProta();
   665E CD EA 65      [17]  363 	call	_borrarProta
                            364 ;src/main.c:139: prota.px = prota.x;
   6661 01 90 64      [10]  365 	ld	bc,#_prota + 2
   6664 3A 8E 64      [13]  366 	ld	a, (#_prota + 0)
   6667 02            [ 7]  367 	ld	(bc),a
                            368 ;src/main.c:140: prota.py = prota.y;
   6668 01 91 64      [10]  369 	ld	bc,#_prota + 3
   666B 3A 8F 64      [13]  370 	ld	a, (#_prota + 1)
   666E 02            [ 7]  371 	ld	(bc),a
                            372 ;src/main.c:141: dibujarProta();
   666F C3 C4 65      [10]  373 	jp  _dibujarProta
                            374 ;src/main.c:144: void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
                            375 ;	---------------------------------
                            376 ; Function comprobarTeclado
                            377 ; ---------------------------------
   6672                     378 _comprobarTeclado::
                            379 ;src/main.c:145: cpct_scanKeyboard_if();
   6672 CD D0 56      [17]  380 	call	_cpct_scanKeyboard_if
                            381 ;src/main.c:147: if (cpct_isAnyKeyPressed()) {
   6675 CD C3 56      [17]  382 	call	_cpct_isAnyKeyPressed
   6678 7D            [ 4]  383 	ld	a,l
   6679 B7            [ 4]  384 	or	a, a
   667A C8            [11]  385 	ret	Z
                            386 ;src/main.c:148: if (cpct_isKeyPressed(Key_CursorLeft)){
   667B 21 01 01      [10]  387 	ld	hl,#0x0101
   667E CD 80 54      [17]  388 	call	_cpct_isKeyPressed
   6681 7D            [ 4]  389 	ld	a,l
   6682 B7            [ 4]  390 	or	a, a
                            391 ;src/main.c:149: moverIzquierda();
   6683 C2 FE 7B      [10]  392 	jp	NZ,_moverIzquierda
                            393 ;src/main.c:150: }else if (cpct_isKeyPressed(Key_CursorRight)){
   6686 21 00 02      [10]  394 	ld	hl,#0x0200
   6689 CD 80 54      [17]  395 	call	_cpct_isKeyPressed
   668C 7D            [ 4]  396 	ld	a,l
   668D B7            [ 4]  397 	or	a, a
                            398 ;src/main.c:151: moverDerecha();
   668E C2 23 7C      [10]  399 	jp	NZ,_moverDerecha
                            400 ;src/main.c:152: }else if (cpct_isKeyPressed(Key_CursorUp)){
   6691 21 00 01      [10]  401 	ld	hl,#0x0100
   6694 CD 80 54      [17]  402 	call	_cpct_isKeyPressed
   6697 7D            [ 4]  403 	ld	a,l
   6698 B7            [ 4]  404 	or	a, a
                            405 ;src/main.c:153: moverArriba();
   6699 C2 68 7C      [10]  406 	jp	NZ,_moverArriba
                            407 ;src/main.c:154: }else if (cpct_isKeyPressed(Key_CursorDown)){
   669C 21 00 04      [10]  408 	ld	hl,#0x0400
   669F CD 80 54      [17]  409 	call	_cpct_isKeyPressed
   66A2 7D            [ 4]  410 	ld	a,l
   66A3 B7            [ 4]  411 	or	a, a
                            412 ;src/main.c:155: moverAbajo();
   66A4 C2 8C 7C      [10]  413 	jp	NZ,_moverAbajo
                            414 ;src/main.c:156: }else if (cpct_isKeyPressed(Key_Space)){
   66A7 21 05 80      [10]  415 	ld	hl,#0x8005
   66AA CD 80 54      [17]  416 	call	_cpct_isKeyPressed
   66AD 7D            [ 4]  417 	ld	a,l
   66AE B7            [ 4]  418 	or	a, a
   66AF C8            [11]  419 	ret	Z
                            420 ;src/main.c:157: lanzarCuchillo(cu, prota, mapa, g_tablatrans);
   66B0 21 08 00      [10]  421 	ld	hl, #8
   66B3 39            [11]  422 	add	hl, sp
   66B4 4E            [ 7]  423 	ld	c, (hl)
   66B5 23            [ 6]  424 	inc	hl
   66B6 46            [ 7]  425 	ld	b, (hl)
   66B7 C5            [11]  426 	push	bc
   66B8 21 08 00      [10]  427 	ld	hl, #8
   66BB 39            [11]  428 	add	hl, sp
   66BC 4E            [ 7]  429 	ld	c, (hl)
   66BD 23            [ 6]  430 	inc	hl
   66BE 46            [ 7]  431 	ld	b, (hl)
   66BF C5            [11]  432 	push	bc
   66C0 21 08 00      [10]  433 	ld	hl, #8
   66C3 39            [11]  434 	add	hl, sp
   66C4 4E            [ 7]  435 	ld	c, (hl)
   66C5 23            [ 6]  436 	inc	hl
   66C6 46            [ 7]  437 	ld	b, (hl)
   66C7 C5            [11]  438 	push	bc
   66C8 21 08 00      [10]  439 	ld	hl, #8
   66CB 39            [11]  440 	add	hl, sp
   66CC 4E            [ 7]  441 	ld	c, (hl)
   66CD 23            [ 6]  442 	inc	hl
   66CE 46            [ 7]  443 	ld	b, (hl)
   66CF C5            [11]  444 	push	bc
   66D0 CD 6C 40      [17]  445 	call	_lanzarCuchillo
   66D3 21 08 00      [10]  446 	ld	hl,#8
   66D6 39            [11]  447 	add	hl,sp
   66D7 F9            [ 6]  448 	ld	sp,hl
   66D8 C9            [10]  449 	ret
                            450 ;src/main.c:162: u8 checkCollision(u8 direction) { // check optimization
                            451 ;	---------------------------------
                            452 ; Function checkCollision
                            453 ; ---------------------------------
   66D9                     454 _checkCollision::
   66D9 DD E5         [15]  455 	push	ix
   66DB DD 21 00 00   [14]  456 	ld	ix,#0
   66DF DD 39         [15]  457 	add	ix,sp
   66E1 F5            [11]  458 	push	af
                            459 ;src/main.c:163: u8 *headTile=0, *feetTile=0, *waistTile=0;
   66E2 21 00 00      [10]  460 	ld	hl,#0x0000
   66E5 E3            [19]  461 	ex	(sp), hl
   66E6 11 00 00      [10]  462 	ld	de,#0x0000
   66E9 01 00 00      [10]  463 	ld	bc,#0x0000
                            464 ;src/main.c:165: switch (direction) {
   66EC 3E 03         [ 7]  465 	ld	a,#0x03
   66EE DD 96 04      [19]  466 	sub	a, 4 (ix)
   66F1 DA 29 68      [10]  467 	jp	C,00105$
   66F4 DD 5E 04      [19]  468 	ld	e,4 (ix)
   66F7 16 00         [ 7]  469 	ld	d,#0x00
   66F9 21 00 67      [10]  470 	ld	hl,#00124$
   66FC 19            [11]  471 	add	hl,de
   66FD 19            [11]  472 	add	hl,de
   66FE 19            [11]  473 	add	hl,de
   66FF E9            [ 4]  474 	jp	(hl)
   6700                     475 00124$:
   6700 C3 0C 67      [10]  476 	jp	00101$
   6703 C3 61 67      [10]  477 	jp	00102$
   6706 C3 B1 67      [10]  478 	jp	00103$
   6709 C3 EE 67      [10]  479 	jp	00104$
                            480 ;src/main.c:166: case 0:
   670C                     481 00101$:
                            482 ;src/main.c:167: headTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y);
   670C 21 8F 64      [10]  483 	ld	hl, #(_prota + 0x0001) + 0
   670F 4E            [ 7]  484 	ld	c,(hl)
   6710 3A 8E 64      [13]  485 	ld	a, (#_prota + 0)
   6713 C6 07         [ 7]  486 	add	a, #0x07
   6715 47            [ 4]  487 	ld	b,a
   6716 79            [ 4]  488 	ld	a,c
   6717 F5            [11]  489 	push	af
   6718 33            [ 6]  490 	inc	sp
   6719 C5            [11]  491 	push	bc
   671A 33            [ 6]  492 	inc	sp
   671B 2A 70 65      [16]  493 	ld	hl,(_mapa)
   671E E5            [11]  494 	push	hl
   671F CD 71 4B      [17]  495 	call	_getTilePtr
   6722 F1            [10]  496 	pop	af
   6723 F1            [10]  497 	pop	af
   6724 33            [ 6]  498 	inc	sp
   6725 33            [ 6]  499 	inc	sp
   6726 E5            [11]  500 	push	hl
                            501 ;src/main.c:168: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA - 2);
   6727 3A 8F 64      [13]  502 	ld	a, (#(_prota + 0x0001) + 0)
   672A C6 14         [ 7]  503 	add	a, #0x14
   672C 4F            [ 4]  504 	ld	c,a
   672D 3A 8E 64      [13]  505 	ld	a, (#_prota + 0)
   6730 C6 07         [ 7]  506 	add	a, #0x07
   6732 47            [ 4]  507 	ld	b,a
   6733 79            [ 4]  508 	ld	a,c
   6734 F5            [11]  509 	push	af
   6735 33            [ 6]  510 	inc	sp
   6736 C5            [11]  511 	push	bc
   6737 33            [ 6]  512 	inc	sp
   6738 2A 70 65      [16]  513 	ld	hl,(_mapa)
   673B E5            [11]  514 	push	hl
   673C CD 71 4B      [17]  515 	call	_getTilePtr
   673F F1            [10]  516 	pop	af
   6740 F1            [10]  517 	pop	af
   6741 EB            [ 4]  518 	ex	de,hl
                            519 ;src/main.c:169: waistTile = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA/2);
   6742 3A 8F 64      [13]  520 	ld	a, (#(_prota + 0x0001) + 0)
   6745 C6 0B         [ 7]  521 	add	a, #0x0B
   6747 47            [ 4]  522 	ld	b,a
   6748 3A 8E 64      [13]  523 	ld	a, (#_prota + 0)
   674B C6 07         [ 7]  524 	add	a, #0x07
   674D D5            [11]  525 	push	de
   674E C5            [11]  526 	push	bc
   674F 33            [ 6]  527 	inc	sp
   6750 F5            [11]  528 	push	af
   6751 33            [ 6]  529 	inc	sp
   6752 2A 70 65      [16]  530 	ld	hl,(_mapa)
   6755 E5            [11]  531 	push	hl
   6756 CD 71 4B      [17]  532 	call	_getTilePtr
   6759 F1            [10]  533 	pop	af
   675A F1            [10]  534 	pop	af
   675B 4D            [ 4]  535 	ld	c,l
   675C 44            [ 4]  536 	ld	b,h
   675D D1            [10]  537 	pop	de
                            538 ;src/main.c:170: break;
   675E C3 29 68      [10]  539 	jp	00105$
                            540 ;src/main.c:171: case 1:
   6761                     541 00102$:
                            542 ;src/main.c:172: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
   6761 21 8F 64      [10]  543 	ld	hl, #(_prota + 0x0001) + 0
   6764 56            [ 7]  544 	ld	d,(hl)
   6765 21 8E 64      [10]  545 	ld	hl, #_prota + 0
   6768 46            [ 7]  546 	ld	b,(hl)
   6769 05            [ 4]  547 	dec	b
   676A D5            [11]  548 	push	de
   676B 33            [ 6]  549 	inc	sp
   676C C5            [11]  550 	push	bc
   676D 33            [ 6]  551 	inc	sp
   676E 2A 70 65      [16]  552 	ld	hl,(_mapa)
   6771 E5            [11]  553 	push	hl
   6772 CD 71 4B      [17]  554 	call	_getTilePtr
   6775 F1            [10]  555 	pop	af
   6776 F1            [10]  556 	pop	af
   6777 33            [ 6]  557 	inc	sp
   6778 33            [ 6]  558 	inc	sp
   6779 E5            [11]  559 	push	hl
                            560 ;src/main.c:173: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
   677A 3A 8F 64      [13]  561 	ld	a, (#(_prota + 0x0001) + 0)
   677D C6 14         [ 7]  562 	add	a, #0x14
   677F 57            [ 4]  563 	ld	d,a
   6780 21 8E 64      [10]  564 	ld	hl, #_prota + 0
   6783 46            [ 7]  565 	ld	b,(hl)
   6784 05            [ 4]  566 	dec	b
   6785 D5            [11]  567 	push	de
   6786 33            [ 6]  568 	inc	sp
   6787 C5            [11]  569 	push	bc
   6788 33            [ 6]  570 	inc	sp
   6789 2A 70 65      [16]  571 	ld	hl,(_mapa)
   678C E5            [11]  572 	push	hl
   678D CD 71 4B      [17]  573 	call	_getTilePtr
   6790 F1            [10]  574 	pop	af
   6791 F1            [10]  575 	pop	af
   6792 EB            [ 4]  576 	ex	de,hl
                            577 ;src/main.c:174: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
   6793 3A 8F 64      [13]  578 	ld	a, (#(_prota + 0x0001) + 0)
   6796 C6 0B         [ 7]  579 	add	a, #0x0B
   6798 47            [ 4]  580 	ld	b,a
   6799 3A 8E 64      [13]  581 	ld	a, (#_prota + 0)
   679C C6 FF         [ 7]  582 	add	a,#0xFF
   679E D5            [11]  583 	push	de
   679F C5            [11]  584 	push	bc
   67A0 33            [ 6]  585 	inc	sp
   67A1 F5            [11]  586 	push	af
   67A2 33            [ 6]  587 	inc	sp
   67A3 2A 70 65      [16]  588 	ld	hl,(_mapa)
   67A6 E5            [11]  589 	push	hl
   67A7 CD 71 4B      [17]  590 	call	_getTilePtr
   67AA F1            [10]  591 	pop	af
   67AB F1            [10]  592 	pop	af
   67AC 4D            [ 4]  593 	ld	c,l
   67AD 44            [ 4]  594 	ld	b,h
   67AE D1            [10]  595 	pop	de
                            596 ;src/main.c:175: break;
   67AF 18 78         [12]  597 	jr	00105$
                            598 ;src/main.c:176: case 2:
   67B1                     599 00103$:
                            600 ;src/main.c:177: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
   67B1 3A 8F 64      [13]  601 	ld	a, (#(_prota + 0x0001) + 0)
   67B4 C6 FE         [ 7]  602 	add	a,#0xFE
   67B6 21 8E 64      [10]  603 	ld	hl, #_prota + 0
   67B9 56            [ 7]  604 	ld	d,(hl)
   67BA C5            [11]  605 	push	bc
   67BB F5            [11]  606 	push	af
   67BC 33            [ 6]  607 	inc	sp
   67BD D5            [11]  608 	push	de
   67BE 33            [ 6]  609 	inc	sp
   67BF 2A 70 65      [16]  610 	ld	hl,(_mapa)
   67C2 E5            [11]  611 	push	hl
   67C3 CD 71 4B      [17]  612 	call	_getTilePtr
   67C6 F1            [10]  613 	pop	af
   67C7 F1            [10]  614 	pop	af
   67C8 C1            [10]  615 	pop	bc
   67C9 33            [ 6]  616 	inc	sp
   67CA 33            [ 6]  617 	inc	sp
   67CB E5            [11]  618 	push	hl
                            619 ;src/main.c:178: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
   67CC 21 8F 64      [10]  620 	ld	hl, #(_prota + 0x0001) + 0
   67CF 56            [ 7]  621 	ld	d,(hl)
   67D0 15            [ 4]  622 	dec	d
   67D1 15            [ 4]  623 	dec	d
   67D2 3A 8E 64      [13]  624 	ld	a, (#_prota + 0)
   67D5 C6 03         [ 7]  625 	add	a, #0x03
   67D7 C5            [11]  626 	push	bc
   67D8 D5            [11]  627 	push	de
   67D9 33            [ 6]  628 	inc	sp
   67DA F5            [11]  629 	push	af
   67DB 33            [ 6]  630 	inc	sp
   67DC 2A 70 65      [16]  631 	ld	hl,(_mapa)
   67DF E5            [11]  632 	push	hl
   67E0 CD 71 4B      [17]  633 	call	_getTilePtr
   67E3 F1            [10]  634 	pop	af
   67E4 F1            [10]  635 	pop	af
   67E5 EB            [ 4]  636 	ex	de,hl
   67E6 C1            [10]  637 	pop	bc
                            638 ;src/main.c:179: *waistTile = 0;
   67E7 21 00 00      [10]  639 	ld	hl,#0x0000
   67EA 36 00         [10]  640 	ld	(hl),#0x00
                            641 ;src/main.c:180: break;
   67EC 18 3B         [12]  642 	jr	00105$
                            643 ;src/main.c:181: case 3:
   67EE                     644 00104$:
                            645 ;src/main.c:182: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
   67EE 3A 8F 64      [13]  646 	ld	a, (#(_prota + 0x0001) + 0)
   67F1 C6 16         [ 7]  647 	add	a, #0x16
   67F3 21 8E 64      [10]  648 	ld	hl, #_prota + 0
   67F6 56            [ 7]  649 	ld	d,(hl)
   67F7 C5            [11]  650 	push	bc
   67F8 F5            [11]  651 	push	af
   67F9 33            [ 6]  652 	inc	sp
   67FA D5            [11]  653 	push	de
   67FB 33            [ 6]  654 	inc	sp
   67FC 2A 70 65      [16]  655 	ld	hl,(_mapa)
   67FF E5            [11]  656 	push	hl
   6800 CD 71 4B      [17]  657 	call	_getTilePtr
   6803 F1            [10]  658 	pop	af
   6804 F1            [10]  659 	pop	af
   6805 C1            [10]  660 	pop	bc
   6806 33            [ 6]  661 	inc	sp
   6807 33            [ 6]  662 	inc	sp
   6808 E5            [11]  663 	push	hl
                            664 ;src/main.c:183: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   6809 3A 8F 64      [13]  665 	ld	a, (#(_prota + 0x0001) + 0)
   680C C6 16         [ 7]  666 	add	a, #0x16
   680E 57            [ 4]  667 	ld	d,a
   680F 3A 8E 64      [13]  668 	ld	a, (#_prota + 0)
   6812 C6 03         [ 7]  669 	add	a, #0x03
   6814 C5            [11]  670 	push	bc
   6815 D5            [11]  671 	push	de
   6816 33            [ 6]  672 	inc	sp
   6817 F5            [11]  673 	push	af
   6818 33            [ 6]  674 	inc	sp
   6819 2A 70 65      [16]  675 	ld	hl,(_mapa)
   681C E5            [11]  676 	push	hl
   681D CD 71 4B      [17]  677 	call	_getTilePtr
   6820 F1            [10]  678 	pop	af
   6821 F1            [10]  679 	pop	af
   6822 EB            [ 4]  680 	ex	de,hl
   6823 C1            [10]  681 	pop	bc
                            682 ;src/main.c:184: *waistTile = 0;
   6824 21 00 00      [10]  683 	ld	hl,#0x0000
   6827 36 00         [10]  684 	ld	(hl),#0x00
                            685 ;src/main.c:186: }
   6829                     686 00105$:
                            687 ;src/main.c:188: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   6829 E1            [10]  688 	pop	hl
   682A E5            [11]  689 	push	hl
   682B 6E            [ 7]  690 	ld	l,(hl)
   682C 3E 02         [ 7]  691 	ld	a,#0x02
   682E 95            [ 4]  692 	sub	a, l
   682F 38 0E         [12]  693 	jr	C,00106$
   6831 1A            [ 7]  694 	ld	a,(de)
   6832 5F            [ 4]  695 	ld	e,a
   6833 3E 02         [ 7]  696 	ld	a,#0x02
   6835 93            [ 4]  697 	sub	a, e
   6836 38 07         [12]  698 	jr	C,00106$
   6838 0A            [ 7]  699 	ld	a,(bc)
   6839 4F            [ 4]  700 	ld	c,a
   683A 3E 02         [ 7]  701 	ld	a,#0x02
   683C 91            [ 4]  702 	sub	a, c
   683D 30 04         [12]  703 	jr	NC,00107$
   683F                     704 00106$:
                            705 ;src/main.c:189: return 1;
   683F 2E 01         [ 7]  706 	ld	l,#0x01
   6841 18 02         [12]  707 	jr	00110$
   6843                     708 00107$:
                            709 ;src/main.c:191: return 0;
   6843 2E 00         [ 7]  710 	ld	l,#0x00
   6845                     711 00110$:
   6845 DD F9         [10]  712 	ld	sp, ix
   6847 DD E1         [14]  713 	pop	ix
   6849 C9            [10]  714 	ret
                            715 ;src/main.c:194: void dibujarEnemigo(TEnemy *enemy) {
                            716 ;	---------------------------------
                            717 ; Function dibujarEnemigo
                            718 ; ---------------------------------
   684A                     719 _dibujarEnemigo::
   684A DD E5         [15]  720 	push	ix
   684C DD 21 00 00   [14]  721 	ld	ix,#0
   6850 DD 39         [15]  722 	add	ix,sp
                            723 ;src/main.c:195: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   6852 DD 4E 04      [19]  724 	ld	c,4 (ix)
   6855 DD 46 05      [19]  725 	ld	b,5 (ix)
   6858 69            [ 4]  726 	ld	l, c
   6859 60            [ 4]  727 	ld	h, b
   685A 23            [ 6]  728 	inc	hl
   685B 56            [ 7]  729 	ld	d,(hl)
   685C 0A            [ 7]  730 	ld	a,(bc)
   685D C5            [11]  731 	push	bc
   685E D5            [11]  732 	push	de
   685F 33            [ 6]  733 	inc	sp
   6860 F5            [11]  734 	push	af
   6861 33            [ 6]  735 	inc	sp
   6862 21 00 C0      [10]  736 	ld	hl,#0xC000
   6865 E5            [11]  737 	push	hl
   6866 CD 7F 60      [17]  738 	call	_cpct_getScreenPtr
   6869 EB            [ 4]  739 	ex	de,hl
                            740 ;src/main.c:196: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   686A E1            [10]  741 	pop	hl
   686B 01 04 00      [10]  742 	ld	bc, #0x0004
   686E 09            [11]  743 	add	hl, bc
   686F 4E            [ 7]  744 	ld	c,(hl)
   6870 23            [ 6]  745 	inc	hl
   6871 46            [ 7]  746 	ld	b,(hl)
   6872 21 00 01      [10]  747 	ld	hl,#_g_tablatrans
   6875 E5            [11]  748 	push	hl
   6876 21 04 16      [10]  749 	ld	hl,#0x1604
   6879 E5            [11]  750 	push	hl
   687A D5            [11]  751 	push	de
   687B C5            [11]  752 	push	bc
   687C CD 9F 60      [17]  753 	call	_cpct_drawSpriteMaskedAlignedTable
   687F DD E1         [14]  754 	pop	ix
   6881 C9            [10]  755 	ret
                            756 ;src/main.c:199: void dibujarExplosion(TEnemy *enemy) {
                            757 ;	---------------------------------
                            758 ; Function dibujarExplosion
                            759 ; ---------------------------------
   6882                     760 _dibujarExplosion::
   6882 DD E5         [15]  761 	push	ix
   6884 DD 21 00 00   [14]  762 	ld	ix,#0
   6888 DD 39         [15]  763 	add	ix,sp
                            764 ;src/main.c:200: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->px, enemy->py);
   688A DD 4E 04      [19]  765 	ld	c,4 (ix)
   688D DD 46 05      [19]  766 	ld	b,5 (ix)
   6890 69            [ 4]  767 	ld	l, c
   6891 60            [ 4]  768 	ld	h, b
   6892 23            [ 6]  769 	inc	hl
   6893 23            [ 6]  770 	inc	hl
   6894 23            [ 6]  771 	inc	hl
   6895 56            [ 7]  772 	ld	d,(hl)
   6896 69            [ 4]  773 	ld	l, c
   6897 60            [ 4]  774 	ld	h, b
   6898 23            [ 6]  775 	inc	hl
   6899 23            [ 6]  776 	inc	hl
   689A 46            [ 7]  777 	ld	b,(hl)
   689B D5            [11]  778 	push	de
   689C 33            [ 6]  779 	inc	sp
   689D C5            [11]  780 	push	bc
   689E 33            [ 6]  781 	inc	sp
   689F 21 00 C0      [10]  782 	ld	hl,#0xC000
   68A2 E5            [11]  783 	push	hl
   68A3 CD 7F 60      [17]  784 	call	_cpct_getScreenPtr
   68A6 4D            [ 4]  785 	ld	c,l
   68A7 44            [ 4]  786 	ld	b,h
                            787 ;src/main.c:201: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   68A8 11 00 01      [10]  788 	ld	de,#_g_tablatrans+0
   68AB D5            [11]  789 	push	de
   68AC 21 04 16      [10]  790 	ld	hl,#0x1604
   68AF E5            [11]  791 	push	hl
   68B0 C5            [11]  792 	push	bc
   68B1 21 70 19      [10]  793 	ld	hl,#_g_explosion
   68B4 E5            [11]  794 	push	hl
   68B5 CD 9F 60      [17]  795 	call	_cpct_drawSpriteMaskedAlignedTable
   68B8 DD E1         [14]  796 	pop	ix
   68BA C9            [10]  797 	ret
                            798 ;src/main.c:204: void borrarExplosion(u8 x, u8 y) {
                            799 ;	---------------------------------
                            800 ; Function borrarExplosion
                            801 ; ---------------------------------
   68BB                     802 _borrarExplosion::
   68BB DD E5         [15]  803 	push	ix
   68BD DD 21 00 00   [14]  804 	ld	ix,#0
   68C1 DD 39         [15]  805 	add	ix,sp
   68C3 F5            [11]  806 	push	af
   68C4 F5            [11]  807 	push	af
                            808 ;src/main.c:207: u8 w = 4 + (x & 1);
   68C5 DD 7E 04      [19]  809 	ld	a,4 (ix)
   68C8 E6 01         [ 7]  810 	and	a, #0x01
   68CA 4F            [ 4]  811 	ld	c,a
   68CB 0C            [ 4]  812 	inc	c
   68CC 0C            [ 4]  813 	inc	c
   68CD 0C            [ 4]  814 	inc	c
   68CE 0C            [ 4]  815 	inc	c
                            816 ;src/main.c:208: u8 h = 6 + (y & 3 ? 1 : 0);
   68CF DD 7E 05      [19]  817 	ld	a,5 (ix)
   68D2 E6 03         [ 7]  818 	and	a, #0x03
   68D4 28 04         [12]  819 	jr	Z,00103$
   68D6 3E 01         [ 7]  820 	ld	a,#0x01
   68D8 18 02         [12]  821 	jr	00104$
   68DA                     822 00103$:
   68DA 3E 00         [ 7]  823 	ld	a,#0x00
   68DC                     824 00104$:
   68DC C6 06         [ 7]  825 	add	a, #0x06
   68DE 47            [ 4]  826 	ld	b,a
                            827 ;src/main.c:210: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   68DF 2A 70 65      [16]  828 	ld	hl,(_mapa)
   68E2 E3            [19]  829 	ex	(sp), hl
   68E3 DD 5E 05      [19]  830 	ld	e,5 (ix)
   68E6 16 00         [ 7]  831 	ld	d,#0x00
   68E8 7B            [ 4]  832 	ld	a,e
   68E9 C6 E8         [ 7]  833 	add	a,#0xE8
   68EB DD 77 FE      [19]  834 	ld	-2 (ix),a
   68EE 7A            [ 4]  835 	ld	a,d
   68EF CE FF         [ 7]  836 	adc	a,#0xFF
   68F1 DD 77 FF      [19]  837 	ld	-1 (ix),a
   68F4 DD 6E FE      [19]  838 	ld	l,-2 (ix)
   68F7 DD 66 FF      [19]  839 	ld	h,-1 (ix)
   68FA DD CB FF 7E   [20]  840 	bit	7, -1 (ix)
   68FE 28 04         [12]  841 	jr	Z,00105$
   6900 21 EB FF      [10]  842 	ld	hl,#0xFFEB
   6903 19            [11]  843 	add	hl,de
   6904                     844 00105$:
   6904 CB 2C         [ 8]  845 	sra	h
   6906 CB 1D         [ 8]  846 	rr	l
   6908 CB 2C         [ 8]  847 	sra	h
   690A CB 1D         [ 8]  848 	rr	l
   690C 5D            [ 4]  849 	ld	e,l
   690D DD 56 04      [19]  850 	ld	d,4 (ix)
   6910 CB 3A         [ 8]  851 	srl	d
   6912 E1            [10]  852 	pop	hl
   6913 E5            [11]  853 	push	hl
   6914 E5            [11]  854 	push	hl
   6915 21 F0 C0      [10]  855 	ld	hl,#0xC0F0
   6918 E5            [11]  856 	push	hl
   6919 3E 28         [ 7]  857 	ld	a,#0x28
   691B F5            [11]  858 	push	af
   691C 33            [ 6]  859 	inc	sp
   691D C5            [11]  860 	push	bc
   691E 7B            [ 4]  861 	ld	a,e
   691F F5            [11]  862 	push	af
   6920 33            [ 6]  863 	inc	sp
   6921 D5            [11]  864 	push	de
   6922 33            [ 6]  865 	inc	sp
   6923 CD 61 55      [17]  866 	call	_cpct_etm_drawTileBox2x4
   6926 DD F9         [10]  867 	ld	sp, ix
   6928 DD E1         [14]  868 	pop	ix
   692A C9            [10]  869 	ret
                            870 ;src/main.c:214: void borrarEnemigo(u8 x, u8 y) {
                            871 ;	---------------------------------
                            872 ; Function borrarEnemigo
                            873 ; ---------------------------------
   692B                     874 _borrarEnemigo::
   692B DD E5         [15]  875 	push	ix
   692D DD 21 00 00   [14]  876 	ld	ix,#0
   6931 DD 39         [15]  877 	add	ix,sp
   6933 F5            [11]  878 	push	af
   6934 F5            [11]  879 	push	af
                            880 ;src/main.c:218: u8 w = 4 + (x & 1);
   6935 DD 7E 04      [19]  881 	ld	a,4 (ix)
   6938 E6 01         [ 7]  882 	and	a, #0x01
   693A 4F            [ 4]  883 	ld	c,a
   693B 0C            [ 4]  884 	inc	c
   693C 0C            [ 4]  885 	inc	c
   693D 0C            [ 4]  886 	inc	c
   693E 0C            [ 4]  887 	inc	c
                            888 ;src/main.c:220: u8 h = 6 + (y & 3 ? 1 : 0);
   693F DD 7E 05      [19]  889 	ld	a,5 (ix)
   6942 E6 03         [ 7]  890 	and	a, #0x03
   6944 28 04         [12]  891 	jr	Z,00103$
   6946 3E 01         [ 7]  892 	ld	a,#0x01
   6948 18 02         [12]  893 	jr	00104$
   694A                     894 00103$:
   694A 3E 00         [ 7]  895 	ld	a,#0x00
   694C                     896 00104$:
   694C C6 06         [ 7]  897 	add	a, #0x06
   694E 47            [ 4]  898 	ld	b,a
                            899 ;src/main.c:222: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   694F 2A 70 65      [16]  900 	ld	hl,(_mapa)
   6952 E3            [19]  901 	ex	(sp), hl
   6953 DD 5E 05      [19]  902 	ld	e,5 (ix)
   6956 16 00         [ 7]  903 	ld	d,#0x00
   6958 7B            [ 4]  904 	ld	a,e
   6959 C6 E8         [ 7]  905 	add	a,#0xE8
   695B DD 77 FE      [19]  906 	ld	-2 (ix),a
   695E 7A            [ 4]  907 	ld	a,d
   695F CE FF         [ 7]  908 	adc	a,#0xFF
   6961 DD 77 FF      [19]  909 	ld	-1 (ix),a
   6964 DD 6E FE      [19]  910 	ld	l,-2 (ix)
   6967 DD 66 FF      [19]  911 	ld	h,-1 (ix)
   696A DD CB FF 7E   [20]  912 	bit	7, -1 (ix)
   696E 28 04         [12]  913 	jr	Z,00105$
   6970 21 EB FF      [10]  914 	ld	hl,#0xFFEB
   6973 19            [11]  915 	add	hl,de
   6974                     916 00105$:
   6974 CB 2C         [ 8]  917 	sra	h
   6976 CB 1D         [ 8]  918 	rr	l
   6978 CB 2C         [ 8]  919 	sra	h
   697A CB 1D         [ 8]  920 	rr	l
   697C 5D            [ 4]  921 	ld	e,l
   697D DD 56 04      [19]  922 	ld	d,4 (ix)
   6980 CB 3A         [ 8]  923 	srl	d
   6982 E1            [10]  924 	pop	hl
   6983 E5            [11]  925 	push	hl
   6984 E5            [11]  926 	push	hl
   6985 21 F0 C0      [10]  927 	ld	hl,#0xC0F0
   6988 E5            [11]  928 	push	hl
   6989 3E 28         [ 7]  929 	ld	a,#0x28
   698B F5            [11]  930 	push	af
   698C 33            [ 6]  931 	inc	sp
   698D C5            [11]  932 	push	bc
   698E 7B            [ 4]  933 	ld	a,e
   698F F5            [11]  934 	push	af
   6990 33            [ 6]  935 	inc	sp
   6991 D5            [11]  936 	push	de
   6992 33            [ 6]  937 	inc	sp
   6993 CD 61 55      [17]  938 	call	_cpct_etm_drawTileBox2x4
   6996 DD F9         [10]  939 	ld	sp, ix
   6998 DD E1         [14]  940 	pop	ix
   699A C9            [10]  941 	ret
                            942 ;src/main.c:225: void redibujarEnemigo(u8 x, u8 y, TEnemy *enemy) {
                            943 ;	---------------------------------
                            944 ; Function redibujarEnemigo
                            945 ; ---------------------------------
   699B                     946 _redibujarEnemigo::
   699B DD E5         [15]  947 	push	ix
   699D DD 21 00 00   [14]  948 	ld	ix,#0
   69A1 DD 39         [15]  949 	add	ix,sp
                            950 ;src/main.c:226: borrarEnemigo(x, y);
   69A3 DD 66 05      [19]  951 	ld	h,5 (ix)
   69A6 DD 6E 04      [19]  952 	ld	l,4 (ix)
   69A9 E5            [11]  953 	push	hl
   69AA CD 2B 69      [17]  954 	call	_borrarEnemigo
   69AD F1            [10]  955 	pop	af
                            956 ;src/main.c:227: enemy->px = enemy->x;
   69AE DD 4E 06      [19]  957 	ld	c,6 (ix)
   69B1 DD 46 07      [19]  958 	ld	b,7 (ix)
   69B4 59            [ 4]  959 	ld	e, c
   69B5 50            [ 4]  960 	ld	d, b
   69B6 13            [ 6]  961 	inc	de
   69B7 13            [ 6]  962 	inc	de
   69B8 0A            [ 7]  963 	ld	a,(bc)
   69B9 12            [ 7]  964 	ld	(de),a
                            965 ;src/main.c:228: enemy->py = enemy->y;
   69BA 59            [ 4]  966 	ld	e, c
   69BB 50            [ 4]  967 	ld	d, b
   69BC 13            [ 6]  968 	inc	de
   69BD 13            [ 6]  969 	inc	de
   69BE 13            [ 6]  970 	inc	de
   69BF 69            [ 4]  971 	ld	l, c
   69C0 60            [ 4]  972 	ld	h, b
   69C1 23            [ 6]  973 	inc	hl
   69C2 7E            [ 7]  974 	ld	a,(hl)
   69C3 12            [ 7]  975 	ld	(de),a
                            976 ;src/main.c:229: dibujarEnemigo(enemy);
   69C4 C5            [11]  977 	push	bc
   69C5 CD 4A 68      [17]  978 	call	_dibujarEnemigo
   69C8 F1            [10]  979 	pop	af
   69C9 DD E1         [14]  980 	pop	ix
   69CB C9            [10]  981 	ret
                            982 ;src/main.c:233: void checkEnemyDead(u8 direction, TEnemy *enemy){
                            983 ;	---------------------------------
                            984 ; Function checkEnemyDead
                            985 ; ---------------------------------
   69CC                     986 _checkEnemyDead::
   69CC DD E5         [15]  987 	push	ix
   69CE DD 21 00 00   [14]  988 	ld	ix,#0
   69D2 DD 39         [15]  989 	add	ix,sp
   69D4 21 FA FF      [10]  990 	ld	hl,#-6
   69D7 39            [11]  991 	add	hl,sp
   69D8 F9            [ 6]  992 	ld	sp,hl
                            993 ;src/main.c:235: switch (direction) {
   69D9 3E 03         [ 7]  994 	ld	a,#0x03
   69DB DD 96 04      [19]  995 	sub	a, 4 (ix)
   69DE DA BA 6B      [10]  996 	jp	C,00134$
                            997 ;src/main.c:239: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   69E1 DD 7E 05      [19]  998 	ld	a,5 (ix)
   69E4 DD 77 FC      [19]  999 	ld	-4 (ix),a
   69E7 DD 7E 06      [19] 1000 	ld	a,6 (ix)
   69EA DD 77 FD      [19] 1001 	ld	-3 (ix),a
   69ED DD 7E FC      [19] 1002 	ld	a,-4 (ix)
   69F0 C6 01         [ 7] 1003 	add	a, #0x01
   69F2 DD 77 FE      [19] 1004 	ld	-2 (ix),a
   69F5 DD 7E FD      [19] 1005 	ld	a,-3 (ix)
   69F8 CE 00         [ 7] 1006 	adc	a, #0x00
   69FA DD 77 FF      [19] 1007 	ld	-1 (ix),a
                           1008 ;src/main.c:242: enemy->muerto = SI;
   69FD DD 7E FC      [19] 1009 	ld	a,-4 (ix)
   6A00 C6 08         [ 7] 1010 	add	a, #0x08
   6A02 DD 77 FA      [19] 1011 	ld	-6 (ix),a
   6A05 DD 7E FD      [19] 1012 	ld	a,-3 (ix)
   6A08 CE 00         [ 7] 1013 	adc	a, #0x00
   6A0A DD 77 FB      [19] 1014 	ld	-5 (ix),a
                           1015 ;src/main.c:235: switch (direction) {
   6A0D DD 5E 04      [19] 1016 	ld	e,4 (ix)
   6A10 16 00         [ 7] 1017 	ld	d,#0x00
   6A12 21 19 6A      [10] 1018 	ld	hl,#00204$
   6A15 19            [11] 1019 	add	hl,de
   6A16 19            [11] 1020 	add	hl,de
   6A17 19            [11] 1021 	add	hl,de
   6A18 E9            [ 4] 1022 	jp	(hl)
   6A19                    1023 00204$:
   6A19 C3 25 6A      [10] 1024 	jp	00101$
   6A1C C3 8D 6A      [10] 1025 	jp	00109$
   6A1F C3 F5 6A      [10] 1026 	jp	00117$
   6A22 C3 5C 6B      [10] 1027 	jp	00125$
                           1028 ;src/main.c:238: case 0:
   6A25                    1029 00101$:
                           1030 ;src/main.c:239: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   6A25 21 97 64      [10] 1031 	ld	hl, #_cu + 1
   6A28 4E            [ 7] 1032 	ld	c,(hl)
   6A29 06 00         [ 7] 1033 	ld	b,#0x00
   6A2B 21 04 00      [10] 1034 	ld	hl,#0x0004
   6A2E 09            [11] 1035 	add	hl,bc
   6A2F EB            [ 4] 1036 	ex	de,hl
   6A30 DD 6E FE      [19] 1037 	ld	l,-2 (ix)
   6A33 DD 66 FF      [19] 1038 	ld	h,-1 (ix)
   6A36 6E            [ 7] 1039 	ld	l,(hl)
   6A37 26 00         [ 7] 1040 	ld	h,#0x00
   6A39 7B            [ 4] 1041 	ld	a,e
   6A3A 95            [ 4] 1042 	sub	a, l
   6A3B 7A            [ 4] 1043 	ld	a,d
   6A3C 9C            [ 4] 1044 	sbc	a, h
   6A3D E2 42 6A      [10] 1045 	jp	PO, 00205$
   6A40 EE 80         [ 7] 1046 	xor	a, #0x80
   6A42                    1047 00205$:
   6A42 FA BA 6B      [10] 1048 	jp	M,00134$
   6A45 11 16 00      [10] 1049 	ld	de,#0x0016
   6A48 19            [11] 1050 	add	hl,de
   6A49 7D            [ 4] 1051 	ld	a,l
   6A4A 91            [ 4] 1052 	sub	a, c
   6A4B 7C            [ 4] 1053 	ld	a,h
   6A4C 98            [ 4] 1054 	sbc	a, b
   6A4D E2 52 6A      [10] 1055 	jp	PO, 00206$
   6A50 EE 80         [ 7] 1056 	xor	a, #0x80
   6A52                    1057 00206$:
   6A52 FA BA 6B      [10] 1058 	jp	M,00134$
                           1059 ;src/main.c:240: if(enemy->x > cu.x + G_KNIFEX_0_W){ //si el cu esta abajo
   6A55 DD 6E FC      [19] 1060 	ld	l,-4 (ix)
   6A58 DD 66 FD      [19] 1061 	ld	h,-3 (ix)
   6A5B 4E            [ 7] 1062 	ld	c,(hl)
   6A5C 21 96 64      [10] 1063 	ld	hl, #_cu + 0
   6A5F 5E            [ 7] 1064 	ld	e,(hl)
   6A60 16 00         [ 7] 1065 	ld	d,#0x00
   6A62 13            [ 6] 1066 	inc	de
   6A63 13            [ 6] 1067 	inc	de
   6A64 13            [ 6] 1068 	inc	de
   6A65 13            [ 6] 1069 	inc	de
   6A66 69            [ 4] 1070 	ld	l,c
   6A67 26 00         [ 7] 1071 	ld	h,#0x00
   6A69 7B            [ 4] 1072 	ld	a,e
   6A6A 95            [ 4] 1073 	sub	a, l
   6A6B 7A            [ 4] 1074 	ld	a,d
   6A6C 9C            [ 4] 1075 	sbc	a, h
   6A6D E2 72 6A      [10] 1076 	jp	PO, 00207$
   6A70 EE 80         [ 7] 1077 	xor	a, #0x80
   6A72                    1078 00207$:
   6A72 F2 BA 6B      [10] 1079 	jp	P,00134$
                           1080 ;src/main.c:241: if( !(enemy->x - (cu.x + G_KNIFEX_0_W) > 1)){ // si hay espacio entre el enemigo y el cu
   6A75 BF            [ 4] 1081 	cp	a, a
   6A76 ED 52         [15] 1082 	sbc	hl, de
   6A78 3E 01         [ 7] 1083 	ld	a,#0x01
   6A7A BD            [ 4] 1084 	cp	a, l
   6A7B 3E 00         [ 7] 1085 	ld	a,#0x00
   6A7D 9C            [ 4] 1086 	sbc	a, h
   6A7E E2 83 6A      [10] 1087 	jp	PO, 00208$
   6A81 EE 80         [ 7] 1088 	xor	a, #0x80
   6A83                    1089 00208$:
   6A83 FA BA 6B      [10] 1090 	jp	M,00134$
                           1091 ;src/main.c:242: enemy->muerto = SI;
   6A86 E1            [10] 1092 	pop	hl
   6A87 E5            [11] 1093 	push	hl
   6A88 36 01         [10] 1094 	ld	(hl),#0x01
                           1095 ;src/main.c:246: break;
   6A8A C3 BA 6B      [10] 1096 	jp	00134$
                           1097 ;src/main.c:247: case 1:
   6A8D                    1098 00109$:
                           1099 ;src/main.c:248: if( !((cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H))){
   6A8D 21 97 64      [10] 1100 	ld	hl, #_cu + 1
   6A90 4E            [ 7] 1101 	ld	c,(hl)
   6A91 06 00         [ 7] 1102 	ld	b,#0x00
   6A93 21 04 00      [10] 1103 	ld	hl,#0x0004
   6A96 09            [11] 1104 	add	hl,bc
   6A97 EB            [ 4] 1105 	ex	de,hl
   6A98 DD 6E FE      [19] 1106 	ld	l,-2 (ix)
   6A9B DD 66 FF      [19] 1107 	ld	h,-1 (ix)
   6A9E 6E            [ 7] 1108 	ld	l,(hl)
   6A9F 26 00         [ 7] 1109 	ld	h,#0x00
   6AA1 7B            [ 4] 1110 	ld	a,e
   6AA2 95            [ 4] 1111 	sub	a, l
   6AA3 7A            [ 4] 1112 	ld	a,d
   6AA4 9C            [ 4] 1113 	sbc	a, h
   6AA5 E2 AA 6A      [10] 1114 	jp	PO, 00209$
   6AA8 EE 80         [ 7] 1115 	xor	a, #0x80
   6AAA                    1116 00209$:
   6AAA FA BA 6B      [10] 1117 	jp	M,00134$
   6AAD 11 16 00      [10] 1118 	ld	de,#0x0016
   6AB0 19            [11] 1119 	add	hl,de
   6AB1 7D            [ 4] 1120 	ld	a,l
   6AB2 91            [ 4] 1121 	sub	a, c
   6AB3 7C            [ 4] 1122 	ld	a,h
   6AB4 98            [ 4] 1123 	sbc	a, b
   6AB5 E2 BA 6A      [10] 1124 	jp	PO, 00210$
   6AB8 EE 80         [ 7] 1125 	xor	a, #0x80
   6ABA                    1126 00210$:
   6ABA FA BA 6B      [10] 1127 	jp	M,00134$
                           1128 ;src/main.c:249: if(cu.x > enemy->x + G_ENEMY_W){ //si el cu esta abajo
   6ABD 21 96 64      [10] 1129 	ld	hl, #_cu + 0
   6AC0 4E            [ 7] 1130 	ld	c,(hl)
   6AC1 DD 6E FC      [19] 1131 	ld	l,-4 (ix)
   6AC4 DD 66 FD      [19] 1132 	ld	h,-3 (ix)
   6AC7 5E            [ 7] 1133 	ld	e,(hl)
   6AC8 16 00         [ 7] 1134 	ld	d,#0x00
   6ACA 13            [ 6] 1135 	inc	de
   6ACB 13            [ 6] 1136 	inc	de
   6ACC 13            [ 6] 1137 	inc	de
   6ACD 13            [ 6] 1138 	inc	de
   6ACE 69            [ 4] 1139 	ld	l,c
   6ACF 26 00         [ 7] 1140 	ld	h,#0x00
   6AD1 7B            [ 4] 1141 	ld	a,e
   6AD2 95            [ 4] 1142 	sub	a, l
   6AD3 7A            [ 4] 1143 	ld	a,d
   6AD4 9C            [ 4] 1144 	sbc	a, h
   6AD5 E2 DA 6A      [10] 1145 	jp	PO, 00211$
   6AD8 EE 80         [ 7] 1146 	xor	a, #0x80
   6ADA                    1147 00211$:
   6ADA F2 BA 6B      [10] 1148 	jp	P,00134$
                           1149 ;src/main.c:250: if( !(cu.x - (enemy->x + G_ENEMY_W) > 1)){ // si hay espacio entre el enemigo y el cu
   6ADD BF            [ 4] 1150 	cp	a, a
   6ADE ED 52         [15] 1151 	sbc	hl, de
   6AE0 3E 01         [ 7] 1152 	ld	a,#0x01
   6AE2 BD            [ 4] 1153 	cp	a, l
   6AE3 3E 00         [ 7] 1154 	ld	a,#0x00
   6AE5 9C            [ 4] 1155 	sbc	a, h
   6AE6 E2 EB 6A      [10] 1156 	jp	PO, 00212$
   6AE9 EE 80         [ 7] 1157 	xor	a, #0x80
   6AEB                    1158 00212$:
   6AEB FA BA 6B      [10] 1159 	jp	M,00134$
                           1160 ;src/main.c:251: enemy->muerto = SI;
   6AEE E1            [10] 1161 	pop	hl
   6AEF E5            [11] 1162 	push	hl
   6AF0 36 01         [10] 1163 	ld	(hl),#0x01
                           1164 ;src/main.c:255: break;
   6AF2 C3 BA 6B      [10] 1165 	jp	00134$
                           1166 ;src/main.c:257: case 2:
   6AF5                    1167 00117$:
                           1168 ;src/main.c:258: if( !((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)) ){
   6AF5 21 96 64      [10] 1169 	ld	hl, #_cu + 0
   6AF8 4E            [ 7] 1170 	ld	c,(hl)
   6AF9 06 00         [ 7] 1171 	ld	b,#0x00
   6AFB 59            [ 4] 1172 	ld	e, c
   6AFC 50            [ 4] 1173 	ld	d, b
   6AFD 13            [ 6] 1174 	inc	de
   6AFE 13            [ 6] 1175 	inc	de
   6AFF DD 6E FC      [19] 1176 	ld	l,-4 (ix)
   6B02 DD 66 FD      [19] 1177 	ld	h,-3 (ix)
   6B05 6E            [ 7] 1178 	ld	l,(hl)
   6B06 26 00         [ 7] 1179 	ld	h,#0x00
   6B08 7B            [ 4] 1180 	ld	a,e
   6B09 95            [ 4] 1181 	sub	a, l
   6B0A 7A            [ 4] 1182 	ld	a,d
   6B0B 9C            [ 4] 1183 	sbc	a, h
   6B0C E2 11 6B      [10] 1184 	jp	PO, 00213$
   6B0F EE 80         [ 7] 1185 	xor	a, #0x80
   6B11                    1186 00213$:
   6B11 FA BA 6B      [10] 1187 	jp	M,00134$
   6B14 11 04 00      [10] 1188 	ld	de,#0x0004
   6B17 19            [11] 1189 	add	hl,de
   6B18 7D            [ 4] 1190 	ld	a,l
   6B19 91            [ 4] 1191 	sub	a, c
   6B1A 7C            [ 4] 1192 	ld	a,h
   6B1B 98            [ 4] 1193 	sbc	a, b
   6B1C E2 21 6B      [10] 1194 	jp	PO, 00214$
   6B1F EE 80         [ 7] 1195 	xor	a, #0x80
   6B21                    1196 00214$:
   6B21 FA BA 6B      [10] 1197 	jp	M,00134$
                           1198 ;src/main.c:259: if(cu.y > enemy->y + G_ENEMY_H){ //si el cu esta abajo
   6B24 21 97 64      [10] 1199 	ld	hl, #(_cu + 0x0001) + 0
   6B27 4E            [ 7] 1200 	ld	c,(hl)
   6B28 DD 6E FE      [19] 1201 	ld	l,-2 (ix)
   6B2B DD 66 FF      [19] 1202 	ld	h,-1 (ix)
   6B2E 5E            [ 7] 1203 	ld	e,(hl)
   6B2F 16 00         [ 7] 1204 	ld	d,#0x00
   6B31 21 16 00      [10] 1205 	ld	hl,#0x0016
   6B34 19            [11] 1206 	add	hl,de
   6B35 EB            [ 4] 1207 	ex	de,hl
   6B36 69            [ 4] 1208 	ld	l,c
   6B37 26 00         [ 7] 1209 	ld	h,#0x00
   6B39 7B            [ 4] 1210 	ld	a,e
   6B3A 95            [ 4] 1211 	sub	a, l
   6B3B 7A            [ 4] 1212 	ld	a,d
   6B3C 9C            [ 4] 1213 	sbc	a, h
   6B3D E2 42 6B      [10] 1214 	jp	PO, 00215$
   6B40 EE 80         [ 7] 1215 	xor	a, #0x80
   6B42                    1216 00215$:
   6B42 F2 BA 6B      [10] 1217 	jp	P,00134$
                           1218 ;src/main.c:260: if( !(cu.y - (enemy->y + G_ENEMY_H)  > 2)){ // si hay espacio entre el enemigo y el cu
   6B45 BF            [ 4] 1219 	cp	a, a
   6B46 ED 52         [15] 1220 	sbc	hl, de
   6B48 3E 02         [ 7] 1221 	ld	a,#0x02
   6B4A BD            [ 4] 1222 	cp	a, l
   6B4B 3E 00         [ 7] 1223 	ld	a,#0x00
   6B4D 9C            [ 4] 1224 	sbc	a, h
   6B4E E2 53 6B      [10] 1225 	jp	PO, 00216$
   6B51 EE 80         [ 7] 1226 	xor	a, #0x80
   6B53                    1227 00216$:
   6B53 FA BA 6B      [10] 1228 	jp	M,00134$
                           1229 ;src/main.c:261: enemy->muerto = SI;
   6B56 E1            [10] 1230 	pop	hl
   6B57 E5            [11] 1231 	push	hl
   6B58 36 01         [10] 1232 	ld	(hl),#0x01
                           1233 ;src/main.c:265: break;
   6B5A 18 5E         [12] 1234 	jr	00134$
                           1235 ;src/main.c:266: case 3:
   6B5C                    1236 00125$:
                           1237 ;src/main.c:267: if(!((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W))){
   6B5C 21 96 64      [10] 1238 	ld	hl, #_cu + 0
   6B5F 4E            [ 7] 1239 	ld	c,(hl)
   6B60 06 00         [ 7] 1240 	ld	b,#0x00
   6B62 59            [ 4] 1241 	ld	e, c
   6B63 50            [ 4] 1242 	ld	d, b
   6B64 13            [ 6] 1243 	inc	de
   6B65 13            [ 6] 1244 	inc	de
   6B66 DD 6E FC      [19] 1245 	ld	l,-4 (ix)
   6B69 DD 66 FD      [19] 1246 	ld	h,-3 (ix)
   6B6C 6E            [ 7] 1247 	ld	l,(hl)
   6B6D 26 00         [ 7] 1248 	ld	h,#0x00
   6B6F 7B            [ 4] 1249 	ld	a,e
   6B70 95            [ 4] 1250 	sub	a, l
   6B71 7A            [ 4] 1251 	ld	a,d
   6B72 9C            [ 4] 1252 	sbc	a, h
   6B73 E2 78 6B      [10] 1253 	jp	PO, 00217$
   6B76 EE 80         [ 7] 1254 	xor	a, #0x80
   6B78                    1255 00217$:
   6B78 FA BA 6B      [10] 1256 	jp	M,00134$
   6B7B 11 04 00      [10] 1257 	ld	de,#0x0004
   6B7E 19            [11] 1258 	add	hl,de
   6B7F 7D            [ 4] 1259 	ld	a,l
   6B80 91            [ 4] 1260 	sub	a, c
   6B81 7C            [ 4] 1261 	ld	a,h
   6B82 98            [ 4] 1262 	sbc	a, b
   6B83 E2 88 6B      [10] 1263 	jp	PO, 00218$
   6B86 EE 80         [ 7] 1264 	xor	a, #0x80
   6B88                    1265 00218$:
   6B88 FA BA 6B      [10] 1266 	jp	M,00134$
                           1267 ;src/main.c:268: if(enemy->y>cu.y){
   6B8B DD 6E FE      [19] 1268 	ld	l,-2 (ix)
   6B8E DD 66 FF      [19] 1269 	ld	h,-1 (ix)
   6B91 4E            [ 7] 1270 	ld	c,(hl)
   6B92 21 97 64      [10] 1271 	ld	hl, #(_cu + 0x0001) + 0
   6B95 5E            [ 7] 1272 	ld	e,(hl)
   6B96 7B            [ 4] 1273 	ld	a,e
   6B97 91            [ 4] 1274 	sub	a, c
   6B98 30 20         [12] 1275 	jr	NC,00134$
                           1276 ;src/main.c:269: if(!(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2)){
   6B9A 06 00         [ 7] 1277 	ld	b,#0x00
   6B9C 16 00         [ 7] 1278 	ld	d,#0x00
   6B9E 21 08 00      [10] 1279 	ld	hl,#0x0008
   6BA1 19            [11] 1280 	add	hl,de
   6BA2 79            [ 4] 1281 	ld	a,c
   6BA3 95            [ 4] 1282 	sub	a, l
   6BA4 4F            [ 4] 1283 	ld	c,a
   6BA5 78            [ 4] 1284 	ld	a,b
   6BA6 9C            [ 4] 1285 	sbc	a, h
   6BA7 47            [ 4] 1286 	ld	b,a
   6BA8 3E 02         [ 7] 1287 	ld	a,#0x02
   6BAA B9            [ 4] 1288 	cp	a, c
   6BAB 3E 00         [ 7] 1289 	ld	a,#0x00
   6BAD 98            [ 4] 1290 	sbc	a, b
   6BAE E2 B3 6B      [10] 1291 	jp	PO, 00219$
   6BB1 EE 80         [ 7] 1292 	xor	a, #0x80
   6BB3                    1293 00219$:
   6BB3 FA BA 6B      [10] 1294 	jp	M,00134$
                           1295 ;src/main.c:270: enemy->muerto = SI;
   6BB6 E1            [10] 1296 	pop	hl
   6BB7 E5            [11] 1297 	push	hl
   6BB8 36 01         [10] 1298 	ld	(hl),#0x01
                           1299 ;src/main.c:275: }
   6BBA                    1300 00134$:
   6BBA DD F9         [10] 1301 	ld	sp, ix
   6BBC DD E1         [14] 1302 	pop	ix
   6BBE C9            [10] 1303 	ret
                           1304 ;src/main.c:278: void moverEnemigoArriba(TEnemy *enemy){
                           1305 ;	---------------------------------
                           1306 ; Function moverEnemigoArriba
                           1307 ; ---------------------------------
   6BBF                    1308 _moverEnemigoArriba::
   6BBF DD E5         [15] 1309 	push	ix
   6BC1 DD 21 00 00   [14] 1310 	ld	ix,#0
   6BC5 DD 39         [15] 1311 	add	ix,sp
                           1312 ;src/main.c:279: enemy->y--;
   6BC7 DD 4E 04      [19] 1313 	ld	c,4 (ix)
   6BCA DD 46 05      [19] 1314 	ld	b,5 (ix)
   6BCD 69            [ 4] 1315 	ld	l, c
   6BCE 60            [ 4] 1316 	ld	h, b
   6BCF 23            [ 6] 1317 	inc	hl
   6BD0 5E            [ 7] 1318 	ld	e,(hl)
   6BD1 1D            [ 4] 1319 	dec	e
   6BD2 73            [ 7] 1320 	ld	(hl),e
                           1321 ;src/main.c:280: enemy->y--;
   6BD3 1D            [ 4] 1322 	dec	e
   6BD4 73            [ 7] 1323 	ld	(hl),e
                           1324 ;src/main.c:281: enemy->mover = SI;
   6BD5 21 06 00      [10] 1325 	ld	hl,#0x0006
   6BD8 09            [11] 1326 	add	hl,bc
   6BD9 36 01         [10] 1327 	ld	(hl),#0x01
   6BDB DD E1         [14] 1328 	pop	ix
   6BDD C9            [10] 1329 	ret
                           1330 ;src/main.c:284: void moverEnemigoAbajo(TEnemy *enemy){
                           1331 ;	---------------------------------
                           1332 ; Function moverEnemigoAbajo
                           1333 ; ---------------------------------
   6BDE                    1334 _moverEnemigoAbajo::
   6BDE DD E5         [15] 1335 	push	ix
   6BE0 DD 21 00 00   [14] 1336 	ld	ix,#0
   6BE4 DD 39         [15] 1337 	add	ix,sp
                           1338 ;src/main.c:285: enemy->y++;
   6BE6 DD 4E 04      [19] 1339 	ld	c,4 (ix)
   6BE9 DD 46 05      [19] 1340 	ld	b,5 (ix)
   6BEC 59            [ 4] 1341 	ld	e, c
   6BED 50            [ 4] 1342 	ld	d, b
   6BEE 13            [ 6] 1343 	inc	de
   6BEF 1A            [ 7] 1344 	ld	a,(de)
   6BF0 3C            [ 4] 1345 	inc	a
   6BF1 12            [ 7] 1346 	ld	(de),a
                           1347 ;src/main.c:286: enemy->y++;
   6BF2 3C            [ 4] 1348 	inc	a
   6BF3 12            [ 7] 1349 	ld	(de),a
                           1350 ;src/main.c:287: enemy->mover = SI;
   6BF4 21 06 00      [10] 1351 	ld	hl,#0x0006
   6BF7 09            [11] 1352 	add	hl,bc
   6BF8 36 01         [10] 1353 	ld	(hl),#0x01
   6BFA DD E1         [14] 1354 	pop	ix
   6BFC C9            [10] 1355 	ret
                           1356 ;src/main.c:290: void moverEnemigoDerecha(TEnemy *enemy){
                           1357 ;	---------------------------------
                           1358 ; Function moverEnemigoDerecha
                           1359 ; ---------------------------------
   6BFD                    1360 _moverEnemigoDerecha::
                           1361 ;src/main.c:291: enemy->x++;
   6BFD D1            [10] 1362 	pop	de
   6BFE C1            [10] 1363 	pop	bc
   6BFF C5            [11] 1364 	push	bc
   6C00 D5            [11] 1365 	push	de
   6C01 0A            [ 7] 1366 	ld	a,(bc)
   6C02 3C            [ 4] 1367 	inc	a
   6C03 02            [ 7] 1368 	ld	(bc),a
                           1369 ;src/main.c:292: enemy->x++;
   6C04 3C            [ 4] 1370 	inc	a
   6C05 02            [ 7] 1371 	ld	(bc),a
                           1372 ;src/main.c:293: enemy->mover = SI;
   6C06 21 06 00      [10] 1373 	ld	hl,#0x0006
   6C09 09            [11] 1374 	add	hl,bc
   6C0A 36 01         [10] 1375 	ld	(hl),#0x01
   6C0C C9            [10] 1376 	ret
                           1377 ;src/main.c:296: void moverEnemigoIzquierda(TEnemy *enemy){
                           1378 ;	---------------------------------
                           1379 ; Function moverEnemigoIzquierda
                           1380 ; ---------------------------------
   6C0D                    1381 _moverEnemigoIzquierda::
                           1382 ;src/main.c:297: enemy->x--;
   6C0D D1            [10] 1383 	pop	de
   6C0E C1            [10] 1384 	pop	bc
   6C0F C5            [11] 1385 	push	bc
   6C10 D5            [11] 1386 	push	de
   6C11 0A            [ 7] 1387 	ld	a,(bc)
   6C12 C6 FF         [ 7] 1388 	add	a,#0xFF
   6C14 02            [ 7] 1389 	ld	(bc),a
                           1390 ;src/main.c:298: enemy->x--;
   6C15 C6 FF         [ 7] 1391 	add	a,#0xFF
   6C17 02            [ 7] 1392 	ld	(bc),a
                           1393 ;src/main.c:299: enemy->mover = SI;
   6C18 21 06 00      [10] 1394 	ld	hl,#0x0006
   6C1B 09            [11] 1395 	add	hl,bc
   6C1C 36 01         [10] 1396 	ld	(hl),#0x01
   6C1E C9            [10] 1397 	ret
                           1398 ;src/main.c:302: void moverEnemigoPatrol(TEnemy* enemy){
                           1399 ;	---------------------------------
                           1400 ; Function moverEnemigoPatrol
                           1401 ; ---------------------------------
   6C1F                    1402 _moverEnemigoPatrol::
   6C1F DD E5         [15] 1403 	push	ix
   6C21 DD 21 00 00   [14] 1404 	ld	ix,#0
   6C25 DD 39         [15] 1405 	add	ix,sp
   6C27 21 F3 FF      [10] 1406 	ld	hl,#-13
   6C2A 39            [11] 1407 	add	hl,sp
   6C2B F9            [ 6] 1408 	ld	sp,hl
                           1409 ;src/main.c:304: if(!enemy->muerto){
   6C2C DD 4E 04      [19] 1410 	ld	c,4 (ix)
   6C2F DD 46 05      [19] 1411 	ld	b,5 (ix)
   6C32 C5            [11] 1412 	push	bc
   6C33 FD E1         [14] 1413 	pop	iy
   6C35 FD 7E 08      [19] 1414 	ld	a,8 (iy)
   6C38 B7            [ 4] 1415 	or	a, a
   6C39 C2 63 6E      [10] 1416 	jp	NZ,00118$
                           1417 ;src/main.c:305: if (!enemy->reversePatrol) {
   6C3C 21 0B 00      [10] 1418 	ld	hl,#0x000B
   6C3F 09            [11] 1419 	add	hl,bc
   6C40 DD 75 F9      [19] 1420 	ld	-7 (ix),l
   6C43 DD 74 FA      [19] 1421 	ld	-6 (ix),h
   6C46 DD 6E F9      [19] 1422 	ld	l,-7 (ix)
   6C49 DD 66 FA      [19] 1423 	ld	h,-6 (ix)
   6C4C 7E            [ 7] 1424 	ld	a,(hl)
   6C4D DD 77 FF      [19] 1425 	ld	-1 (ix),a
                           1426 ;src/main.c:306: if(enemy->iter < enemy->longitud_camino){
   6C50 21 0D 00      [10] 1427 	ld	hl,#0x000D
   6C53 09            [11] 1428 	add	hl,bc
   6C54 DD 75 FB      [19] 1429 	ld	-5 (ix),l
   6C57 DD 74 FC      [19] 1430 	ld	-4 (ix),h
   6C5A DD 6E FB      [19] 1431 	ld	l,-5 (ix)
   6C5D DD 66 FC      [19] 1432 	ld	h,-4 (ix)
   6C60 5E            [ 7] 1433 	ld	e,(hl)
   6C61 23            [ 6] 1434 	inc	hl
   6C62 56            [ 7] 1435 	ld	d,(hl)
   6C63 21 E2 00      [10] 1436 	ld	hl,#0x00E2
   6C66 09            [11] 1437 	add	hl,bc
   6C67 DD 75 FD      [19] 1438 	ld	-3 (ix),l
   6C6A DD 74 FE      [19] 1439 	ld	-2 (ix),h
                           1440 ;src/main.c:308: enemy->mover = SI;
   6C6D 21 06 00      [10] 1441 	ld	hl,#0x0006
   6C70 09            [11] 1442 	add	hl,bc
   6C71 DD 75 F7      [19] 1443 	ld	-9 (ix),l
   6C74 DD 74 F8      [19] 1444 	ld	-8 (ix),h
                           1445 ;src/main.c:310: enemy->x = enemy->camino[enemy->iter];
   6C77 21 1A 00      [10] 1446 	ld	hl,#0x001A
   6C7A 09            [11] 1447 	add	hl,bc
   6C7B DD 75 F5      [19] 1448 	ld	-11 (ix),l
   6C7E DD 74 F6      [19] 1449 	ld	-10 (ix),h
                           1450 ;src/main.c:312: enemy->y = enemy->camino[enemy->iter];
   6C81 21 01 00      [10] 1451 	ld	hl,#0x0001
   6C84 09            [11] 1452 	add	hl,bc
   6C85 E3            [19] 1453 	ex	(sp), hl
                           1454 ;src/main.c:305: if (!enemy->reversePatrol) {
   6C86 DD 7E FF      [19] 1455 	ld	a,-1 (ix)
   6C89 B7            [ 4] 1456 	or	a, a
   6C8A C2 61 6D      [10] 1457 	jp	NZ,00114$
                           1458 ;src/main.c:306: if(enemy->iter < enemy->longitud_camino){
   6C8D DD 6E FD      [19] 1459 	ld	l,-3 (ix)
   6C90 DD 66 FE      [19] 1460 	ld	h,-2 (ix)
   6C93 6E            [ 7] 1461 	ld	l,(hl)
   6C94 26 00         [ 7] 1462 	ld	h,#0x00
   6C96 7B            [ 4] 1463 	ld	a,e
   6C97 95            [ 4] 1464 	sub	a, l
   6C98 7A            [ 4] 1465 	ld	a,d
   6C99 9C            [ 4] 1466 	sbc	a, h
   6C9A E2 9F 6C      [10] 1467 	jp	PO, 00144$
   6C9D EE 80         [ 7] 1468 	xor	a, #0x80
   6C9F                    1469 00144$:
   6C9F F2 3C 6D      [10] 1470 	jp	P,00105$
                           1471 ;src/main.c:307: if(enemy->iter == 0){
   6CA2 7A            [ 4] 1472 	ld	a,d
   6CA3 B3            [ 4] 1473 	or	a,e
   6CA4 20 50         [12] 1474 	jr	NZ,00102$
                           1475 ;src/main.c:308: enemy->mover = SI;
   6CA6 DD 6E F7      [19] 1476 	ld	l,-9 (ix)
   6CA9 DD 66 F8      [19] 1477 	ld	h,-8 (ix)
   6CAC 36 01         [10] 1478 	ld	(hl),#0x01
                           1479 ;src/main.c:309: enemy->iter = 2;
   6CAE DD 6E FB      [19] 1480 	ld	l,-5 (ix)
   6CB1 DD 66 FC      [19] 1481 	ld	h,-4 (ix)
   6CB4 36 02         [10] 1482 	ld	(hl),#0x02
   6CB6 23            [ 6] 1483 	inc	hl
   6CB7 36 00         [10] 1484 	ld	(hl),#0x00
                           1485 ;src/main.c:310: enemy->x = enemy->camino[enemy->iter];
   6CB9 DD 6E FB      [19] 1486 	ld	l,-5 (ix)
   6CBC DD 66 FC      [19] 1487 	ld	h,-4 (ix)
   6CBF 5E            [ 7] 1488 	ld	e,(hl)
   6CC0 23            [ 6] 1489 	inc	hl
   6CC1 56            [ 7] 1490 	ld	d,(hl)
   6CC2 DD 6E F5      [19] 1491 	ld	l,-11 (ix)
   6CC5 DD 66 F6      [19] 1492 	ld	h,-10 (ix)
   6CC8 19            [11] 1493 	add	hl,de
   6CC9 7E            [ 7] 1494 	ld	a,(hl)
   6CCA 02            [ 7] 1495 	ld	(bc),a
                           1496 ;src/main.c:311: ++enemy->iter;
   6CCB DD 6E FB      [19] 1497 	ld	l,-5 (ix)
   6CCE DD 66 FC      [19] 1498 	ld	h,-4 (ix)
   6CD1 4E            [ 7] 1499 	ld	c,(hl)
   6CD2 23            [ 6] 1500 	inc	hl
   6CD3 46            [ 7] 1501 	ld	b,(hl)
   6CD4 03            [ 6] 1502 	inc	bc
   6CD5 DD 6E FB      [19] 1503 	ld	l,-5 (ix)
   6CD8 DD 66 FC      [19] 1504 	ld	h,-4 (ix)
   6CDB 71            [ 7] 1505 	ld	(hl),c
   6CDC 23            [ 6] 1506 	inc	hl
   6CDD 70            [ 7] 1507 	ld	(hl),b
                           1508 ;src/main.c:312: enemy->y = enemy->camino[enemy->iter];
   6CDE DD 6E F5      [19] 1509 	ld	l,-11 (ix)
   6CE1 DD 66 F6      [19] 1510 	ld	h,-10 (ix)
   6CE4 09            [11] 1511 	add	hl,bc
   6CE5 5E            [ 7] 1512 	ld	e,(hl)
   6CE6 E1            [10] 1513 	pop	hl
   6CE7 E5            [11] 1514 	push	hl
   6CE8 73            [ 7] 1515 	ld	(hl),e
                           1516 ;src/main.c:313: ++enemy->iter;
   6CE9 03            [ 6] 1517 	inc	bc
   6CEA DD 6E FB      [19] 1518 	ld	l,-5 (ix)
   6CED DD 66 FC      [19] 1519 	ld	h,-4 (ix)
   6CF0 71            [ 7] 1520 	ld	(hl),c
   6CF1 23            [ 6] 1521 	inc	hl
   6CF2 70            [ 7] 1522 	ld	(hl),b
   6CF3 C3 63 6E      [10] 1523 	jp	00118$
   6CF6                    1524 00102$:
                           1525 ;src/main.c:315: enemy->mover = SI;
   6CF6 DD 6E F7      [19] 1526 	ld	l,-9 (ix)
   6CF9 DD 66 F8      [19] 1527 	ld	h,-8 (ix)
   6CFC 36 01         [10] 1528 	ld	(hl),#0x01
                           1529 ;src/main.c:316: enemy->x = enemy->camino[enemy->iter];
   6CFE DD 6E FB      [19] 1530 	ld	l,-5 (ix)
   6D01 DD 66 FC      [19] 1531 	ld	h,-4 (ix)
   6D04 5E            [ 7] 1532 	ld	e,(hl)
   6D05 23            [ 6] 1533 	inc	hl
   6D06 56            [ 7] 1534 	ld	d,(hl)
   6D07 DD 6E F5      [19] 1535 	ld	l,-11 (ix)
   6D0A DD 66 F6      [19] 1536 	ld	h,-10 (ix)
   6D0D 19            [11] 1537 	add	hl,de
   6D0E 7E            [ 7] 1538 	ld	a,(hl)
   6D0F 02            [ 7] 1539 	ld	(bc),a
                           1540 ;src/main.c:317: ++enemy->iter;
   6D10 DD 6E FB      [19] 1541 	ld	l,-5 (ix)
   6D13 DD 66 FC      [19] 1542 	ld	h,-4 (ix)
   6D16 5E            [ 7] 1543 	ld	e,(hl)
   6D17 23            [ 6] 1544 	inc	hl
   6D18 56            [ 7] 1545 	ld	d,(hl)
   6D19 13            [ 6] 1546 	inc	de
   6D1A DD 6E FB      [19] 1547 	ld	l,-5 (ix)
   6D1D DD 66 FC      [19] 1548 	ld	h,-4 (ix)
   6D20 73            [ 7] 1549 	ld	(hl),e
   6D21 23            [ 6] 1550 	inc	hl
   6D22 72            [ 7] 1551 	ld	(hl),d
                           1552 ;src/main.c:318: enemy->y = enemy->camino[enemy->iter];
   6D23 DD 6E F5      [19] 1553 	ld	l,-11 (ix)
   6D26 DD 66 F6      [19] 1554 	ld	h,-10 (ix)
   6D29 19            [11] 1555 	add	hl,de
   6D2A 7E            [ 7] 1556 	ld	a,(hl)
   6D2B E1            [10] 1557 	pop	hl
   6D2C E5            [11] 1558 	push	hl
   6D2D 77            [ 7] 1559 	ld	(hl),a
                           1560 ;src/main.c:319: ++enemy->iter;
   6D2E 13            [ 6] 1561 	inc	de
   6D2F 4B            [ 4] 1562 	ld	c,e
   6D30 DD 6E FB      [19] 1563 	ld	l,-5 (ix)
   6D33 DD 66 FC      [19] 1564 	ld	h,-4 (ix)
   6D36 71            [ 7] 1565 	ld	(hl),c
   6D37 23            [ 6] 1566 	inc	hl
   6D38 72            [ 7] 1567 	ld	(hl),d
   6D39 C3 63 6E      [10] 1568 	jp	00118$
   6D3C                    1569 00105$:
                           1570 ;src/main.c:323: enemy->mover = NO;
   6D3C DD 6E F7      [19] 1571 	ld	l,-9 (ix)
   6D3F DD 66 F8      [19] 1572 	ld	h,-8 (ix)
   6D42 36 00         [10] 1573 	ld	(hl),#0x00
                           1574 ;src/main.c:324: enemy->iter = enemy->longitud_camino;
   6D44 DD 6E FD      [19] 1575 	ld	l,-3 (ix)
   6D47 DD 66 FE      [19] 1576 	ld	h,-2 (ix)
   6D4A 4E            [ 7] 1577 	ld	c,(hl)
   6D4B 06 00         [ 7] 1578 	ld	b,#0x00
   6D4D DD 6E FB      [19] 1579 	ld	l,-5 (ix)
   6D50 DD 66 FC      [19] 1580 	ld	h,-4 (ix)
   6D53 71            [ 7] 1581 	ld	(hl),c
   6D54 23            [ 6] 1582 	inc	hl
   6D55 70            [ 7] 1583 	ld	(hl),b
                           1584 ;src/main.c:325: enemy->reversePatrol = 1;
   6D56 DD 6E F9      [19] 1585 	ld	l,-7 (ix)
   6D59 DD 66 FA      [19] 1586 	ld	h,-6 (ix)
   6D5C 36 01         [10] 1587 	ld	(hl),#0x01
   6D5E C3 63 6E      [10] 1588 	jp	00118$
   6D61                    1589 00114$:
                           1590 ;src/main.c:328: if(enemy->iter > 0){
   6D61 AF            [ 4] 1591 	xor	a, a
   6D62 BB            [ 4] 1592 	cp	a, e
   6D63 9A            [ 4] 1593 	sbc	a, d
   6D64 E2 69 6D      [10] 1594 	jp	PO, 00145$
   6D67 EE 80         [ 7] 1595 	xor	a, #0x80
   6D69                    1596 00145$:
   6D69 F2 49 6E      [10] 1597 	jp	P,00111$
                           1598 ;src/main.c:329: if(enemy->iter == enemy->longitud_camino){
   6D6C DD 6E FD      [19] 1599 	ld	l,-3 (ix)
   6D6F DD 66 FE      [19] 1600 	ld	h,-2 (ix)
   6D72 6E            [ 7] 1601 	ld	l,(hl)
   6D73 DD 75 FD      [19] 1602 	ld	-3 (ix),l
   6D76 DD 36 FE 00   [19] 1603 	ld	-2 (ix),#0x00
   6D7A 7B            [ 4] 1604 	ld	a,e
   6D7B DD 96 FD      [19] 1605 	sub	a, -3 (ix)
   6D7E C2 05 6E      [10] 1606 	jp	NZ,00108$
   6D81 7A            [ 4] 1607 	ld	a,d
   6D82 DD 96 FE      [19] 1608 	sub	a, -2 (ix)
   6D85 C2 05 6E      [10] 1609 	jp	NZ,00108$
                           1610 ;src/main.c:330: enemy->mover = SI;
   6D88 DD 6E F7      [19] 1611 	ld	l,-9 (ix)
   6D8B DD 66 F8      [19] 1612 	ld	h,-8 (ix)
   6D8E 36 01         [10] 1613 	ld	(hl),#0x01
                           1614 ;src/main.c:331: enemy->iter = enemy->iter - 1;
   6D90 DD 6E FB      [19] 1615 	ld	l,-5 (ix)
   6D93 DD 66 FC      [19] 1616 	ld	h,-4 (ix)
   6D96 5E            [ 7] 1617 	ld	e,(hl)
   6D97 23            [ 6] 1618 	inc	hl
   6D98 56            [ 7] 1619 	ld	d,(hl)
   6D99 7B            [ 4] 1620 	ld	a,e
   6D9A C6 FF         [ 7] 1621 	add	a,#0xFF
   6D9C DD 77 FD      [19] 1622 	ld	-3 (ix),a
   6D9F 7A            [ 4] 1623 	ld	a,d
   6DA0 CE FF         [ 7] 1624 	adc	a,#0xFF
   6DA2 DD 77 FE      [19] 1625 	ld	-2 (ix),a
   6DA5 DD 6E FB      [19] 1626 	ld	l,-5 (ix)
   6DA8 DD 66 FC      [19] 1627 	ld	h,-4 (ix)
   6DAB DD 7E FD      [19] 1628 	ld	a,-3 (ix)
   6DAE 77            [ 7] 1629 	ld	(hl),a
   6DAF 23            [ 6] 1630 	inc	hl
   6DB0 DD 7E FE      [19] 1631 	ld	a,-2 (ix)
   6DB3 77            [ 7] 1632 	ld	(hl),a
                           1633 ;src/main.c:332: enemy->iter = enemy->iter - 2;
   6DB4 DD 5E FD      [19] 1634 	ld	e,-3 (ix)
   6DB7 DD 56 FE      [19] 1635 	ld	d,-2 (ix)
   6DBA 1B            [ 6] 1636 	dec	de
   6DBB 1B            [ 6] 1637 	dec	de
   6DBC DD 6E FB      [19] 1638 	ld	l,-5 (ix)
   6DBF DD 66 FC      [19] 1639 	ld	h,-4 (ix)
   6DC2 73            [ 7] 1640 	ld	(hl),e
   6DC3 23            [ 6] 1641 	inc	hl
   6DC4 72            [ 7] 1642 	ld	(hl),d
                           1643 ;src/main.c:333: enemy->y = enemy->camino[enemy->iter];
   6DC5 DD 6E F5      [19] 1644 	ld	l,-11 (ix)
   6DC8 DD 66 F6      [19] 1645 	ld	h,-10 (ix)
   6DCB 19            [11] 1646 	add	hl,de
   6DCC 5E            [ 7] 1647 	ld	e,(hl)
   6DCD E1            [10] 1648 	pop	hl
   6DCE E5            [11] 1649 	push	hl
   6DCF 73            [ 7] 1650 	ld	(hl),e
                           1651 ;src/main.c:334: --enemy->iter;
   6DD0 DD 7E FD      [19] 1652 	ld	a,-3 (ix)
   6DD3 C6 FD         [ 7] 1653 	add	a,#0xFD
   6DD5 5F            [ 4] 1654 	ld	e,a
   6DD6 DD 7E FE      [19] 1655 	ld	a,-2 (ix)
   6DD9 CE FF         [ 7] 1656 	adc	a,#0xFF
   6DDB 57            [ 4] 1657 	ld	d,a
   6DDC DD 6E FB      [19] 1658 	ld	l,-5 (ix)
   6DDF DD 66 FC      [19] 1659 	ld	h,-4 (ix)
   6DE2 73            [ 7] 1660 	ld	(hl),e
   6DE3 23            [ 6] 1661 	inc	hl
   6DE4 72            [ 7] 1662 	ld	(hl),d
                           1663 ;src/main.c:335: enemy->x = enemy->camino[enemy->iter];
   6DE5 DD 6E F5      [19] 1664 	ld	l,-11 (ix)
   6DE8 DD 66 F6      [19] 1665 	ld	h,-10 (ix)
   6DEB 19            [11] 1666 	add	hl,de
   6DEC 7E            [ 7] 1667 	ld	a,(hl)
   6DED 02            [ 7] 1668 	ld	(bc),a
                           1669 ;src/main.c:336: --enemy->iter;
   6DEE DD 7E FD      [19] 1670 	ld	a,-3 (ix)
   6DF1 C6 FC         [ 7] 1671 	add	a,#0xFC
   6DF3 4F            [ 4] 1672 	ld	c,a
   6DF4 DD 7E FE      [19] 1673 	ld	a,-2 (ix)
   6DF7 CE FF         [ 7] 1674 	adc	a,#0xFF
   6DF9 47            [ 4] 1675 	ld	b,a
   6DFA DD 6E FB      [19] 1676 	ld	l,-5 (ix)
   6DFD DD 66 FC      [19] 1677 	ld	h,-4 (ix)
   6E00 71            [ 7] 1678 	ld	(hl),c
   6E01 23            [ 6] 1679 	inc	hl
   6E02 70            [ 7] 1680 	ld	(hl),b
   6E03 18 5E         [12] 1681 	jr	00118$
   6E05                    1682 00108$:
                           1683 ;src/main.c:338: enemy->mover = SI;
   6E05 DD 6E F7      [19] 1684 	ld	l,-9 (ix)
   6E08 DD 66 F8      [19] 1685 	ld	h,-8 (ix)
   6E0B 36 01         [10] 1686 	ld	(hl),#0x01
                           1687 ;src/main.c:339: enemy->y = enemy->camino[enemy->iter];
   6E0D DD 6E FB      [19] 1688 	ld	l,-5 (ix)
   6E10 DD 66 FC      [19] 1689 	ld	h,-4 (ix)
   6E13 5E            [ 7] 1690 	ld	e,(hl)
   6E14 23            [ 6] 1691 	inc	hl
   6E15 56            [ 7] 1692 	ld	d,(hl)
   6E16 DD 6E F5      [19] 1693 	ld	l,-11 (ix)
   6E19 DD 66 F6      [19] 1694 	ld	h,-10 (ix)
   6E1C 19            [11] 1695 	add	hl,de
   6E1D 5E            [ 7] 1696 	ld	e,(hl)
   6E1E E1            [10] 1697 	pop	hl
   6E1F E5            [11] 1698 	push	hl
   6E20 73            [ 7] 1699 	ld	(hl),e
                           1700 ;src/main.c:340: --enemy->iter;
   6E21 DD 6E FB      [19] 1701 	ld	l,-5 (ix)
   6E24 DD 66 FC      [19] 1702 	ld	h,-4 (ix)
   6E27 5E            [ 7] 1703 	ld	e,(hl)
   6E28 23            [ 6] 1704 	inc	hl
   6E29 56            [ 7] 1705 	ld	d,(hl)
   6E2A 1B            [ 6] 1706 	dec	de
   6E2B DD 6E FB      [19] 1707 	ld	l,-5 (ix)
   6E2E DD 66 FC      [19] 1708 	ld	h,-4 (ix)
   6E31 73            [ 7] 1709 	ld	(hl),e
   6E32 23            [ 6] 1710 	inc	hl
   6E33 72            [ 7] 1711 	ld	(hl),d
                           1712 ;src/main.c:341: enemy->x = enemy->camino[enemy->iter];
   6E34 DD 6E F5      [19] 1713 	ld	l,-11 (ix)
   6E37 DD 66 F6      [19] 1714 	ld	h,-10 (ix)
   6E3A 19            [11] 1715 	add	hl,de
   6E3B 7E            [ 7] 1716 	ld	a,(hl)
   6E3C 02            [ 7] 1717 	ld	(bc),a
                           1718 ;src/main.c:342: --enemy->iter;
   6E3D 1B            [ 6] 1719 	dec	de
   6E3E DD 6E FB      [19] 1720 	ld	l,-5 (ix)
   6E41 DD 66 FC      [19] 1721 	ld	h,-4 (ix)
   6E44 73            [ 7] 1722 	ld	(hl),e
   6E45 23            [ 6] 1723 	inc	hl
   6E46 72            [ 7] 1724 	ld	(hl),d
   6E47 18 1A         [12] 1725 	jr	00118$
   6E49                    1726 00111$:
                           1727 ;src/main.c:346: enemy->mover = NO;
   6E49 DD 6E F7      [19] 1728 	ld	l,-9 (ix)
   6E4C DD 66 F8      [19] 1729 	ld	h,-8 (ix)
   6E4F 36 00         [10] 1730 	ld	(hl),#0x00
                           1731 ;src/main.c:347: enemy->iter = 0;
   6E51 DD 6E FB      [19] 1732 	ld	l,-5 (ix)
   6E54 DD 66 FC      [19] 1733 	ld	h,-4 (ix)
   6E57 AF            [ 4] 1734 	xor	a, a
   6E58 77            [ 7] 1735 	ld	(hl), a
   6E59 23            [ 6] 1736 	inc	hl
   6E5A 77            [ 7] 1737 	ld	(hl), a
                           1738 ;src/main.c:348: enemy->reversePatrol = 0;
   6E5B DD 6E F9      [19] 1739 	ld	l,-7 (ix)
   6E5E DD 66 FA      [19] 1740 	ld	h,-6 (ix)
   6E61 36 00         [10] 1741 	ld	(hl),#0x00
   6E63                    1742 00118$:
   6E63 DD F9         [10] 1743 	ld	sp, ix
   6E65 DD E1         [14] 1744 	pop	ix
   6E67 C9            [10] 1745 	ret
                           1746 ;src/main.c:354: void lookFor(TEnemy* enemy){
                           1747 ;	---------------------------------
                           1748 ; Function lookFor
                           1749 ; ---------------------------------
   6E68                    1750 _lookFor::
   6E68 DD E5         [15] 1751 	push	ix
   6E6A DD 21 00 00   [14] 1752 	ld	ix,#0
   6E6E DD 39         [15] 1753 	add	ix,sp
   6E70 21 F9 FF      [10] 1754 	ld	hl,#-7
   6E73 39            [11] 1755 	add	hl,sp
   6E74 F9            [ 6] 1756 	ld	sp,hl
                           1757 ;src/main.c:360: i16 difx = abs((i16)(enemy->x - prota.x));
   6E75 DD 5E 04      [19] 1758 	ld	e,4 (ix)
   6E78 DD 56 05      [19] 1759 	ld	d,5 (ix)
   6E7B 1A            [ 7] 1760 	ld	a,(de)
   6E7C 4F            [ 4] 1761 	ld	c,a
   6E7D 06 00         [ 7] 1762 	ld	b,#0x00
   6E7F 21 8E 64      [10] 1763 	ld	hl,#_prota+0
   6E82 6E            [ 7] 1764 	ld	l,(hl)
   6E83 26 00         [ 7] 1765 	ld	h,#0x00
   6E85 79            [ 4] 1766 	ld	a,c
   6E86 95            [ 4] 1767 	sub	a, l
   6E87 4F            [ 4] 1768 	ld	c,a
   6E88 78            [ 4] 1769 	ld	a,b
   6E89 9C            [ 4] 1770 	sbc	a, h
   6E8A 47            [ 4] 1771 	ld	b,a
   6E8B D5            [11] 1772 	push	de
   6E8C C5            [11] 1773 	push	bc
   6E8D CD B5 4B      [17] 1774 	call	_abs
   6E90 F1            [10] 1775 	pop	af
   6E91 D1            [10] 1776 	pop	de
   6E92 DD 75 FA      [19] 1777 	ld	-6 (ix),l
   6E95 DD 74 FB      [19] 1778 	ld	-5 (ix),h
                           1779 ;src/main.c:361: i16 dify = abs((i16)(enemy->y - prota.y));
   6E98 21 01 00      [10] 1780 	ld	hl,#0x0001
   6E9B 19            [11] 1781 	add	hl,de
   6E9C DD 75 FE      [19] 1782 	ld	-2 (ix),l
   6E9F DD 74 FF      [19] 1783 	ld	-1 (ix),h
   6EA2 DD 6E FE      [19] 1784 	ld	l,-2 (ix)
   6EA5 DD 66 FF      [19] 1785 	ld	h,-1 (ix)
   6EA8 4E            [ 7] 1786 	ld	c,(hl)
   6EA9 06 00         [ 7] 1787 	ld	b,#0x00
   6EAB 21 8F 64      [10] 1788 	ld	hl, #(_prota + 0x0001) + 0
   6EAE 6E            [ 7] 1789 	ld	l,(hl)
   6EAF 26 00         [ 7] 1790 	ld	h,#0x00
   6EB1 79            [ 4] 1791 	ld	a,c
   6EB2 95            [ 4] 1792 	sub	a, l
   6EB3 4F            [ 4] 1793 	ld	c,a
   6EB4 78            [ 4] 1794 	ld	a,b
   6EB5 9C            [ 4] 1795 	sbc	a, h
   6EB6 47            [ 4] 1796 	ld	b,a
   6EB7 D5            [11] 1797 	push	de
   6EB8 C5            [11] 1798 	push	bc
   6EB9 CD B5 4B      [17] 1799 	call	_abs
   6EBC F1            [10] 1800 	pop	af
   6EBD D1            [10] 1801 	pop	de
                           1802 ;src/main.c:363: dist = difx + dify; // manhattan
   6EBE DD 4E FA      [19] 1803 	ld	c,-6 (ix)
   6EC1 09            [11] 1804 	add	hl, bc
   6EC2 DD 75 F9      [19] 1805 	ld	-7 (ix),l
                           1806 ;src/main.c:364: enemy->seen = NO;
   6EC5 21 11 00      [10] 1807 	ld	hl,#0x0011
   6EC8 19            [11] 1808 	add	hl,de
   6EC9 DD 75 FC      [19] 1809 	ld	-4 (ix),l
   6ECC DD 74 FD      [19] 1810 	ld	-3 (ix),h
   6ECF DD 6E FC      [19] 1811 	ld	l,-4 (ix)
   6ED2 DD 66 FD      [19] 1812 	ld	h,-3 (ix)
   6ED5 36 00         [10] 1813 	ld	(hl),#0x00
                           1814 ;src/main.c:365: enemy->in_range = NO;
   6ED7 21 10 00      [10] 1815 	ld	hl,#0x0010
   6EDA 19            [11] 1816 	add	hl,de
   6EDB 4D            [ 4] 1817 	ld	c,l
   6EDC 44            [ 4] 1818 	ld	b,h
   6EDD AF            [ 4] 1819 	xor	a, a
   6EDE 02            [ 7] 1820 	ld	(bc),a
                           1821 ;src/main.c:367: if(!enemy->seek){
   6EDF D5            [11] 1822 	push	de
   6EE0 FD E1         [14] 1823 	pop	iy
   6EE2 FD 7E 13      [19] 1824 	ld	a,19 (iy)
   6EE5 B7            [ 4] 1825 	or	a, a
   6EE6 C2 6C 6F      [10] 1826 	jp	NZ,00111$
                           1827 ;src/main.c:368: if (dist <= 17) {// te detectan los sensores de proximidad
   6EE9 3E 11         [ 7] 1828 	ld	a,#0x11
   6EEB DD 96 F9      [19] 1829 	sub	a, -7 (ix)
   6EEE 38 13         [12] 1830 	jr	C,00107$
                           1831 ;src/main.c:369: enemy->in_range = 1;
   6EF0 3E 01         [ 7] 1832 	ld	a,#0x01
   6EF2 02            [ 7] 1833 	ld	(bc),a
                           1834 ;src/main.c:370: enemy->engage = 1;
   6EF3 21 15 00      [10] 1835 	ld	hl,#0x0015
   6EF6 19            [11] 1836 	add	hl,de
   6EF7 36 01         [10] 1837 	ld	(hl),#0x01
                           1838 ;src/main.c:371: enemy->seen = SI;
   6EF9 DD 6E FC      [19] 1839 	ld	l,-4 (ix)
   6EFC DD 66 FD      [19] 1840 	ld	h,-3 (ix)
   6EFF 36 01         [10] 1841 	ld	(hl),#0x01
   6F01 18 69         [12] 1842 	jr	00111$
   6F03                    1843 00107$:
                           1844 ;src/main.c:372: }else if(prota.x > enemy->x - 20 && prota.x < enemy->x + 20
   6F03 21 8E 64      [10] 1845 	ld	hl, #_prota + 0
   6F06 4E            [ 7] 1846 	ld	c,(hl)
   6F07 1A            [ 7] 1847 	ld	a,(de)
   6F08 5F            [ 4] 1848 	ld	e,a
   6F09 16 00         [ 7] 1849 	ld	d,#0x00
   6F0B 7B            [ 4] 1850 	ld	a,e
   6F0C C6 EC         [ 7] 1851 	add	a,#0xEC
   6F0E 6F            [ 4] 1852 	ld	l,a
   6F0F 7A            [ 4] 1853 	ld	a,d
   6F10 CE FF         [ 7] 1854 	adc	a,#0xFF
   6F12 67            [ 4] 1855 	ld	h,a
   6F13 06 00         [ 7] 1856 	ld	b,#0x00
   6F15 7D            [ 4] 1857 	ld	a,l
   6F16 91            [ 4] 1858 	sub	a, c
   6F17 7C            [ 4] 1859 	ld	a,h
   6F18 98            [ 4] 1860 	sbc	a, b
   6F19 E2 1E 6F      [10] 1861 	jp	PO, 00137$
   6F1C EE 80         [ 7] 1862 	xor	a, #0x80
   6F1E                    1863 00137$:
   6F1E F2 6C 6F      [10] 1864 	jp	P,00111$
   6F21 21 14 00      [10] 1865 	ld	hl,#0x0014
   6F24 19            [11] 1866 	add	hl,de
   6F25 79            [ 4] 1867 	ld	a,c
   6F26 95            [ 4] 1868 	sub	a, l
   6F27 78            [ 4] 1869 	ld	a,b
   6F28 9C            [ 4] 1870 	sbc	a, h
   6F29 E2 2E 6F      [10] 1871 	jp	PO, 00138$
   6F2C EE 80         [ 7] 1872 	xor	a, #0x80
   6F2E                    1873 00138$:
   6F2E F2 6C 6F      [10] 1874 	jp	P,00111$
                           1875 ;src/main.c:373: && prota.y > enemy->y - 20*2 && prota.y < enemy->y + 20*2){
   6F31 21 8F 64      [10] 1876 	ld	hl, #(_prota + 0x0001) + 0
   6F34 4E            [ 7] 1877 	ld	c,(hl)
   6F35 DD 6E FE      [19] 1878 	ld	l,-2 (ix)
   6F38 DD 66 FF      [19] 1879 	ld	h,-1 (ix)
   6F3B 5E            [ 7] 1880 	ld	e,(hl)
   6F3C 16 00         [ 7] 1881 	ld	d,#0x00
   6F3E 7B            [ 4] 1882 	ld	a,e
   6F3F C6 D8         [ 7] 1883 	add	a,#0xD8
   6F41 6F            [ 4] 1884 	ld	l,a
   6F42 7A            [ 4] 1885 	ld	a,d
   6F43 CE FF         [ 7] 1886 	adc	a,#0xFF
   6F45 67            [ 4] 1887 	ld	h,a
   6F46 06 00         [ 7] 1888 	ld	b,#0x00
   6F48 7D            [ 4] 1889 	ld	a,l
   6F49 91            [ 4] 1890 	sub	a, c
   6F4A 7C            [ 4] 1891 	ld	a,h
   6F4B 98            [ 4] 1892 	sbc	a, b
   6F4C E2 51 6F      [10] 1893 	jp	PO, 00139$
   6F4F EE 80         [ 7] 1894 	xor	a, #0x80
   6F51                    1895 00139$:
   6F51 F2 6C 6F      [10] 1896 	jp	P,00111$
   6F54 21 28 00      [10] 1897 	ld	hl,#0x0028
   6F57 19            [11] 1898 	add	hl,de
   6F58 79            [ 4] 1899 	ld	a,c
   6F59 95            [ 4] 1900 	sub	a, l
   6F5A 78            [ 4] 1901 	ld	a,b
   6F5B 9C            [ 4] 1902 	sbc	a, h
   6F5C E2 61 6F      [10] 1903 	jp	PO, 00140$
   6F5F EE 80         [ 7] 1904 	xor	a, #0x80
   6F61                    1905 00140$:
   6F61 F2 6C 6F      [10] 1906 	jp	P,00111$
                           1907 ;src/main.c:374: enemy->seen = SI;
   6F64 DD 6E FC      [19] 1908 	ld	l,-4 (ix)
   6F67 DD 66 FD      [19] 1909 	ld	h,-3 (ix)
   6F6A 36 01         [10] 1910 	ld	(hl),#0x01
   6F6C                    1911 00111$:
   6F6C DD F9         [10] 1912 	ld	sp, ix
   6F6E DD E1         [14] 1913 	pop	ix
   6F70 C9            [10] 1914 	ret
                           1915 ;src/main.c:379: void moverEnemigoSeek(TEnemy* actual){
                           1916 ;	---------------------------------
                           1917 ; Function moverEnemigoSeek
                           1918 ; ---------------------------------
   6F71                    1919 _moverEnemigoSeek::
   6F71 DD E5         [15] 1920 	push	ix
   6F73 DD 21 00 00   [14] 1921 	ld	ix,#0
   6F77 DD 39         [15] 1922 	add	ix,sp
   6F79 21 F6 FF      [10] 1923 	ld	hl,#-10
   6F7C 39            [11] 1924 	add	hl,sp
   6F7D F9            [ 6] 1925 	ld	sp,hl
                           1926 ;src/main.c:381: if(!actual->muerto){
   6F7E DD 4E 04      [19] 1927 	ld	c,4 (ix)
   6F81 DD 46 05      [19] 1928 	ld	b,5 (ix)
   6F84 C5            [11] 1929 	push	bc
   6F85 FD E1         [14] 1930 	pop	iy
   6F87 FD 7E 08      [19] 1931 	ld	a, 8 (iy)
   6F8A B7            [ 4] 1932 	or	a, a
   6F8B C2 1E 71      [10] 1933 	jp	NZ,00114$
                           1934 ;src/main.c:384: if(actual->iter < actual->longitud_camino){
   6F8E 21 0D 00      [10] 1935 	ld	hl,#0x000D
   6F91 09            [11] 1936 	add	hl,bc
   6F92 DD 75 FE      [19] 1937 	ld	-2 (ix),l
   6F95 DD 74 FF      [19] 1938 	ld	-1 (ix),h
   6F98 DD 6E FE      [19] 1939 	ld	l,-2 (ix)
   6F9B DD 66 FF      [19] 1940 	ld	h,-1 (ix)
   6F9E 7E            [ 7] 1941 	ld	a,(hl)
   6F9F DD 77 FC      [19] 1942 	ld	-4 (ix),a
   6FA2 23            [ 6] 1943 	inc	hl
   6FA3 7E            [ 7] 1944 	ld	a,(hl)
   6FA4 DD 77 FD      [19] 1945 	ld	-3 (ix),a
   6FA7 69            [ 4] 1946 	ld	l, c
   6FA8 60            [ 4] 1947 	ld	h, b
   6FA9 11 E2 00      [10] 1948 	ld	de, #0x00E2
   6FAC 19            [11] 1949 	add	hl, de
   6FAD 5E            [ 7] 1950 	ld	e,(hl)
   6FAE 16 00         [ 7] 1951 	ld	d,#0x00
                           1952 ;src/main.c:393: actual->y = actual->camino[actual->iter];
   6FB0 21 01 00      [10] 1953 	ld	hl,#0x0001
   6FB3 09            [11] 1954 	add	hl,bc
   6FB4 DD 75 FA      [19] 1955 	ld	-6 (ix),l
   6FB7 DD 74 FB      [19] 1956 	ld	-5 (ix),h
                           1957 ;src/main.c:384: if(actual->iter < actual->longitud_camino){
   6FBA DD 7E FC      [19] 1958 	ld	a,-4 (ix)
   6FBD 93            [ 4] 1959 	sub	a, e
   6FBE DD 7E FD      [19] 1960 	ld	a,-3 (ix)
   6FC1 9A            [ 4] 1961 	sbc	a, d
   6FC2 E2 C7 6F      [10] 1962 	jp	PO, 00136$
   6FC5 EE 80         [ 7] 1963 	xor	a, #0x80
   6FC7                    1964 00136$:
   6FC7 F2 5B 70      [10] 1965 	jp	P,00110$
                           1966 ;src/main.c:389: actual->mover = SI;
   6FCA 21 06 00      [10] 1967 	ld	hl,#0x0006
   6FCD 09            [11] 1968 	add	hl,bc
                           1969 ;src/main.c:391: actual->x = actual->camino[actual->iter];
   6FCE 79            [ 4] 1970 	ld	a,c
   6FCF C6 1A         [ 7] 1971 	add	a, #0x1A
   6FD1 5F            [ 4] 1972 	ld	e,a
   6FD2 78            [ 4] 1973 	ld	a,b
   6FD3 CE 00         [ 7] 1974 	adc	a, #0x00
   6FD5 57            [ 4] 1975 	ld	d,a
                           1976 ;src/main.c:387: if(actual->iter == 0){
   6FD6 DD 7E FD      [19] 1977 	ld	a,-3 (ix)
   6FD9 DD B6 FC      [19] 1978 	or	a,-4 (ix)
   6FDC 20 44         [12] 1979 	jr	NZ,00102$
                           1980 ;src/main.c:389: actual->mover = SI;
   6FDE 36 01         [10] 1981 	ld	(hl),#0x01
                           1982 ;src/main.c:390: actual->iter = 2;
   6FE0 DD 6E FE      [19] 1983 	ld	l,-2 (ix)
   6FE3 DD 66 FF      [19] 1984 	ld	h,-1 (ix)
   6FE6 36 02         [10] 1985 	ld	(hl),#0x02
   6FE8 23            [ 6] 1986 	inc	hl
   6FE9 36 00         [10] 1987 	ld	(hl),#0x00
                           1988 ;src/main.c:391: actual->x = actual->camino[actual->iter];
   6FEB DD 6E FE      [19] 1989 	ld	l,-2 (ix)
   6FEE DD 66 FF      [19] 1990 	ld	h,-1 (ix)
   6FF1 7E            [ 7] 1991 	ld	a, (hl)
   6FF2 23            [ 6] 1992 	inc	hl
   6FF3 66            [ 7] 1993 	ld	h,(hl)
   6FF4 6F            [ 4] 1994 	ld	l,a
   6FF5 19            [11] 1995 	add	hl,de
   6FF6 7E            [ 7] 1996 	ld	a,(hl)
   6FF7 02            [ 7] 1997 	ld	(bc),a
                           1998 ;src/main.c:392: ++actual->iter;
   6FF8 DD 6E FE      [19] 1999 	ld	l,-2 (ix)
   6FFB DD 66 FF      [19] 2000 	ld	h,-1 (ix)
   6FFE 4E            [ 7] 2001 	ld	c,(hl)
   6FFF 23            [ 6] 2002 	inc	hl
   7000 46            [ 7] 2003 	ld	b,(hl)
   7001 03            [ 6] 2004 	inc	bc
   7002 DD 6E FE      [19] 2005 	ld	l,-2 (ix)
   7005 DD 66 FF      [19] 2006 	ld	h,-1 (ix)
   7008 71            [ 7] 2007 	ld	(hl),c
   7009 23            [ 6] 2008 	inc	hl
   700A 70            [ 7] 2009 	ld	(hl),b
                           2010 ;src/main.c:393: actual->y = actual->camino[actual->iter];
   700B EB            [ 4] 2011 	ex	de,hl
   700C 09            [11] 2012 	add	hl,bc
   700D 5E            [ 7] 2013 	ld	e,(hl)
   700E DD 6E FA      [19] 2014 	ld	l,-6 (ix)
   7011 DD 66 FB      [19] 2015 	ld	h,-5 (ix)
   7014 73            [ 7] 2016 	ld	(hl),e
                           2017 ;src/main.c:394: ++actual->iter;
   7015 03            [ 6] 2018 	inc	bc
   7016 DD 6E FE      [19] 2019 	ld	l,-2 (ix)
   7019 DD 66 FF      [19] 2020 	ld	h,-1 (ix)
   701C 71            [ 7] 2021 	ld	(hl),c
   701D 23            [ 6] 2022 	inc	hl
   701E 70            [ 7] 2023 	ld	(hl),b
   701F C3 1E 71      [10] 2024 	jp	00114$
   7022                    2025 00102$:
                           2026 ;src/main.c:397: actual->mover = SI;
   7022 36 01         [10] 2027 	ld	(hl),#0x01
                           2028 ;src/main.c:398: actual->x = actual->camino[actual->iter];
   7024 DD 6E FE      [19] 2029 	ld	l,-2 (ix)
   7027 DD 66 FF      [19] 2030 	ld	h,-1 (ix)
   702A 7E            [ 7] 2031 	ld	a, (hl)
   702B 23            [ 6] 2032 	inc	hl
   702C 66            [ 7] 2033 	ld	h,(hl)
   702D 6F            [ 4] 2034 	ld	l,a
   702E 19            [11] 2035 	add	hl,de
   702F 7E            [ 7] 2036 	ld	a,(hl)
   7030 02            [ 7] 2037 	ld	(bc),a
                           2038 ;src/main.c:399: ++actual->iter;
   7031 DD 6E FE      [19] 2039 	ld	l,-2 (ix)
   7034 DD 66 FF      [19] 2040 	ld	h,-1 (ix)
   7037 4E            [ 7] 2041 	ld	c,(hl)
   7038 23            [ 6] 2042 	inc	hl
   7039 46            [ 7] 2043 	ld	b,(hl)
   703A 03            [ 6] 2044 	inc	bc
   703B DD 6E FE      [19] 2045 	ld	l,-2 (ix)
   703E DD 66 FF      [19] 2046 	ld	h,-1 (ix)
   7041 71            [ 7] 2047 	ld	(hl),c
   7042 23            [ 6] 2048 	inc	hl
   7043 70            [ 7] 2049 	ld	(hl),b
                           2050 ;src/main.c:400: actual->y = actual->camino[actual->iter];
   7044 EB            [ 4] 2051 	ex	de,hl
   7045 09            [11] 2052 	add	hl,bc
   7046 5E            [ 7] 2053 	ld	e,(hl)
   7047 DD 6E FA      [19] 2054 	ld	l,-6 (ix)
   704A DD 66 FB      [19] 2055 	ld	h,-5 (ix)
   704D 73            [ 7] 2056 	ld	(hl),e
                           2057 ;src/main.c:401: ++actual->iter;
   704E 03            [ 6] 2058 	inc	bc
   704F DD 6E FE      [19] 2059 	ld	l,-2 (ix)
   7052 DD 66 FF      [19] 2060 	ld	h,-1 (ix)
   7055 71            [ 7] 2061 	ld	(hl),c
   7056 23            [ 6] 2062 	inc	hl
   7057 70            [ 7] 2063 	ld	(hl),b
   7058 C3 1E 71      [10] 2064 	jp	00114$
   705B                    2065 00110$:
                           2066 ;src/main.c:407: actual->seek = 0;
   705B 21 13 00      [10] 2067 	ld	hl,#0x0013
   705E 09            [11] 2068 	add	hl,bc
   705F DD 75 FC      [19] 2069 	ld	-4 (ix),l
   7062 DD 74 FD      [19] 2070 	ld	-3 (ix),h
   7065 DD 6E FC      [19] 2071 	ld	l,-4 (ix)
   7068 DD 66 FD      [19] 2072 	ld	h,-3 (ix)
   706B 36 00         [10] 2073 	ld	(hl),#0x00
                           2074 ;src/main.c:408: lookFor(actual);
   706D C5            [11] 2075 	push	bc
   706E C5            [11] 2076 	push	bc
   706F CD 68 6E      [17] 2077 	call	_lookFor
   7072 F1            [10] 2078 	pop	af
   7073 C1            [10] 2079 	pop	bc
                           2080 ;src/main.c:409: if(!actual->seen){
   7074 69            [ 4] 2081 	ld	l, c
   7075 60            [ 4] 2082 	ld	h, b
   7076 11 11 00      [10] 2083 	ld	de, #0x0011
   7079 19            [11] 2084 	add	hl, de
   707A 7E            [ 7] 2085 	ld	a,(hl)
   707B DD 77 F9      [19] 2086 	ld	-7 (ix),a
                           2087 ;src/main.c:410: actual->patrolling = 1;
   707E 21 0A 00      [10] 2088 	ld	hl,#0x000A
   7081 09            [11] 2089 	add	hl,bc
   7082 DD 75 F7      [19] 2090 	ld	-9 (ix),l
   7085 DD 74 F8      [19] 2091 	ld	-8 (ix),h
                           2092 ;src/main.c:409: if(!actual->seen){
   7088 DD 7E F9      [19] 2093 	ld	a,-7 (ix)
   708B B7            [ 4] 2094 	or	a, a
   708C 20 3C         [12] 2095 	jr	NZ,00107$
                           2096 ;src/main.c:410: actual->patrolling = 1;
   708E DD 6E F7      [19] 2097 	ld	l,-9 (ix)
   7091 DD 66 F8      [19] 2098 	ld	h,-8 (ix)
   7094 36 01         [10] 2099 	ld	(hl),#0x01
                           2100 ;src/main.c:411: pathFinding(actual->x, actual->y, actual->p_seek_x, actual->p_seek_y, actual, mapa);
   7096 C5            [11] 2101 	push	bc
   7097 FD E1         [14] 2102 	pop	iy
   7099 FD 7E 18      [19] 2103 	ld	a,24 (iy)
   709C DD 77 F9      [19] 2104 	ld	-7 (ix),a
   709F C5            [11] 2105 	push	bc
   70A0 FD E1         [14] 2106 	pop	iy
   70A2 FD 56 17      [19] 2107 	ld	d,23 (iy)
   70A5 DD 6E FA      [19] 2108 	ld	l,-6 (ix)
   70A8 DD 66 FB      [19] 2109 	ld	h,-5 (ix)
   70AB 5E            [ 7] 2110 	ld	e,(hl)
   70AC 0A            [ 7] 2111 	ld	a,(bc)
   70AD DD 77 F6      [19] 2112 	ld	-10 (ix),a
   70B0 2A 70 65      [16] 2113 	ld	hl,(_mapa)
   70B3 E5            [11] 2114 	push	hl
   70B4 C5            [11] 2115 	push	bc
   70B5 DD 7E F9      [19] 2116 	ld	a,-7 (ix)
   70B8 F5            [11] 2117 	push	af
   70B9 33            [ 6] 2118 	inc	sp
   70BA D5            [11] 2119 	push	de
   70BB DD 7E F6      [19] 2120 	ld	a,-10 (ix)
   70BE F5            [11] 2121 	push	af
   70BF 33            [ 6] 2122 	inc	sp
   70C0 CD 72 49      [17] 2123 	call	_pathFinding
   70C3 21 08 00      [10] 2124 	ld	hl,#8
   70C6 39            [11] 2125 	add	hl,sp
   70C7 F9            [ 6] 2126 	ld	sp,hl
   70C8 18 4A         [12] 2127 	jr	00108$
   70CA                    2128 00107$:
                           2129 ;src/main.c:413: actual->patrolling = 0;
   70CA DD 6E F7      [19] 2130 	ld	l,-9 (ix)
   70CD DD 66 F8      [19] 2131 	ld	h,-8 (ix)
   70D0 36 00         [10] 2132 	ld	(hl),#0x00
                           2133 ;src/main.c:414: if(!actual->engage){
   70D2 C5            [11] 2134 	push	bc
   70D3 FD E1         [14] 2135 	pop	iy
   70D5 FD 7E 15      [19] 2136 	ld	a,21 (iy)
   70D8 B7            [ 4] 2137 	or	a, a
   70D9 20 39         [12] 2138 	jr	NZ,00108$
                           2139 ;src/main.c:415: actual->seek = 1;
   70DB DD 6E FC      [19] 2140 	ld	l,-4 (ix)
   70DE DD 66 FD      [19] 2141 	ld	h,-3 (ix)
   70E1 36 01         [10] 2142 	ld	(hl),#0x01
                           2143 ;src/main.c:416: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   70E3 3A 8F 64      [13] 2144 	ld	a,(#_prota + 1)
   70E6 DD 77 F6      [19] 2145 	ld	-10 (ix),a
   70E9 21 8E 64      [10] 2146 	ld	hl, #_prota + 0
   70EC 5E            [ 7] 2147 	ld	e,(hl)
   70ED DD 6E FA      [19] 2148 	ld	l,-6 (ix)
   70F0 DD 66 FB      [19] 2149 	ld	h,-5 (ix)
   70F3 56            [ 7] 2150 	ld	d,(hl)
   70F4 0A            [ 7] 2151 	ld	a,(bc)
   70F5 DD 77 F7      [19] 2152 	ld	-9 (ix),a
   70F8 2A 70 65      [16] 2153 	ld	hl,(_mapa)
   70FB E5            [11] 2154 	push	hl
   70FC C5            [11] 2155 	push	bc
   70FD DD 7E F6      [19] 2156 	ld	a,-10 (ix)
   7100 F5            [11] 2157 	push	af
   7101 33            [ 6] 2158 	inc	sp
   7102 7B            [ 4] 2159 	ld	a,e
   7103 F5            [11] 2160 	push	af
   7104 33            [ 6] 2161 	inc	sp
   7105 D5            [11] 2162 	push	de
   7106 33            [ 6] 2163 	inc	sp
   7107 DD 7E F7      [19] 2164 	ld	a,-9 (ix)
   710A F5            [11] 2165 	push	af
   710B 33            [ 6] 2166 	inc	sp
   710C CD 72 49      [17] 2167 	call	_pathFinding
   710F 21 08 00      [10] 2168 	ld	hl,#8
   7112 39            [11] 2169 	add	hl,sp
   7113 F9            [ 6] 2170 	ld	sp,hl
   7114                    2171 00108$:
                           2172 ;src/main.c:419: actual->iter = 0;
   7114 DD 6E FE      [19] 2173 	ld	l,-2 (ix)
   7117 DD 66 FF      [19] 2174 	ld	h,-1 (ix)
   711A AF            [ 4] 2175 	xor	a, a
   711B 77            [ 7] 2176 	ld	(hl), a
   711C 23            [ 6] 2177 	inc	hl
   711D 77            [ 7] 2178 	ld	(hl), a
   711E                    2179 00114$:
   711E DD F9         [10] 2180 	ld	sp, ix
   7120 DD E1         [14] 2181 	pop	ix
   7122 C9            [10] 2182 	ret
                           2183 ;src/main.c:425: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2184 ;	---------------------------------
                           2185 ; Function engage
                           2186 ; ---------------------------------
   7123                    2187 _engage::
   7123 DD E5         [15] 2188 	push	ix
   7125 DD 21 00 00   [14] 2189 	ld	ix,#0
   7129 DD 39         [15] 2190 	add	ix,sp
   712B 21 F0 FF      [10] 2191 	ld	hl,#-16
   712E 39            [11] 2192 	add	hl,sp
   712F F9            [ 6] 2193 	ld	sp,hl
                           2194 ;src/main.c:426: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7130 DD 7E 04      [19] 2195 	ld	a,4 (ix)
   7133 DD 77 F4      [19] 2196 	ld	-12 (ix),a
   7136 DD 7E 05      [19] 2197 	ld	a,5 (ix)
   7139 DD 77 F5      [19] 2198 	ld	-11 (ix),a
   713C DD 6E F4      [19] 2199 	ld	l,-12 (ix)
   713F DD 66 F5      [19] 2200 	ld	h,-11 (ix)
   7142 4E            [ 7] 2201 	ld	c,(hl)
   7143 06 00         [ 7] 2202 	ld	b,#0x00
   7145 21 8E 64      [10] 2203 	ld	hl,#_prota+0
   7148 5E            [ 7] 2204 	ld	e,(hl)
   7149 16 00         [ 7] 2205 	ld	d,#0x00
   714B 79            [ 4] 2206 	ld	a,c
   714C 93            [ 4] 2207 	sub	a, e
   714D 4F            [ 4] 2208 	ld	c,a
   714E 78            [ 4] 2209 	ld	a,b
   714F 9A            [ 4] 2210 	sbc	a, d
   7150 47            [ 4] 2211 	ld	b,a
   7151 C5            [11] 2212 	push	bc
   7152 CD B5 4B      [17] 2213 	call	_abs
   7155 F1            [10] 2214 	pop	af
   7156 4D            [ 4] 2215 	ld	c,l
                           2216 ;src/main.c:427: u8 dify = abs(enemy->y - prota.y);
   7157 DD 7E F4      [19] 2217 	ld	a,-12 (ix)
   715A C6 01         [ 7] 2218 	add	a, #0x01
   715C DD 77 F6      [19] 2219 	ld	-10 (ix),a
   715F DD 7E F5      [19] 2220 	ld	a,-11 (ix)
   7162 CE 00         [ 7] 2221 	adc	a, #0x00
   7164 DD 77 F7      [19] 2222 	ld	-9 (ix),a
   7167 DD 6E F6      [19] 2223 	ld	l,-10 (ix)
   716A DD 66 F7      [19] 2224 	ld	h,-9 (ix)
   716D 5E            [ 7] 2225 	ld	e,(hl)
   716E 16 00         [ 7] 2226 	ld	d,#0x00
   7170 21 8F 64      [10] 2227 	ld	hl, #_prota + 1
   7173 6E            [ 7] 2228 	ld	l,(hl)
   7174 26 00         [ 7] 2229 	ld	h,#0x00
   7176 7B            [ 4] 2230 	ld	a,e
   7177 95            [ 4] 2231 	sub	a, l
   7178 5F            [ 4] 2232 	ld	e,a
   7179 7A            [ 4] 2233 	ld	a,d
   717A 9C            [ 4] 2234 	sbc	a, h
   717B 57            [ 4] 2235 	ld	d,a
   717C C5            [11] 2236 	push	bc
   717D D5            [11] 2237 	push	de
   717E CD B5 4B      [17] 2238 	call	_abs
   7181 F1            [10] 2239 	pop	af
   7182 C1            [10] 2240 	pop	bc
                           2241 ;src/main.c:428: u8 dist = difx + dify; // manhattan
   7183 09            [11] 2242 	add	hl, bc
   7184 DD 75 F0      [19] 2243 	ld	-16 (ix),l
                           2244 ;src/main.c:430: u8 movX = 0;
   7187 DD 36 F3 00   [19] 2245 	ld	-13 (ix),#0x00
                           2246 ;src/main.c:431: u8 movY = 0;
   718B DD 36 F2 00   [19] 2247 	ld	-14 (ix),#0x00
                           2248 ;src/main.c:432: u8 distConstraint = 25;
   718F DD 36 F1 19   [19] 2249 	ld	-15 (ix),#0x19
                           2250 ;src/main.c:433: enemy->mover = NO;
   7193 DD 7E F4      [19] 2251 	ld	a,-12 (ix)
   7196 C6 06         [ 7] 2252 	add	a, #0x06
   7198 DD 77 F8      [19] 2253 	ld	-8 (ix),a
   719B DD 7E F5      [19] 2254 	ld	a,-11 (ix)
   719E CE 00         [ 7] 2255 	adc	a, #0x00
   71A0 DD 77 F9      [19] 2256 	ld	-7 (ix),a
   71A3 DD 6E F8      [19] 2257 	ld	l,-8 (ix)
   71A6 DD 66 F9      [19] 2258 	ld	h,-7 (ix)
   71A9 36 00         [10] 2259 	ld	(hl),#0x00
                           2260 ;src/main.c:443: enemy->didDamage = 1;
   71AB DD 7E F4      [19] 2261 	ld	a,-12 (ix)
   71AE C6 16         [ 7] 2262 	add	a, #0x16
   71B0 4F            [ 4] 2263 	ld	c,a
   71B1 DD 7E F5      [19] 2264 	ld	a,-11 (ix)
   71B4 CE 00         [ 7] 2265 	adc	a, #0x00
   71B6 47            [ 4] 2266 	ld	b,a
                           2267 ;src/main.c:435: if (dist < 20) {
   71B7 DD 7E F0      [19] 2268 	ld	a,-16 (ix)
   71BA D6 14         [ 7] 2269 	sub	a, #0x14
   71BC 30 3B         [12] 2270 	jr	NC,00107$
                           2271 ;src/main.c:436: vidas--;
   71BE 21 A5 64      [10] 2272 	ld	hl, #_vidas+0
   71C1 35            [11] 2273 	dec	(hl)
                           2274 ;src/main.c:437: if(vidas % 20 == 0){
   71C2 C5            [11] 2275 	push	bc
   71C3 3E 14         [ 7] 2276 	ld	a,#0x14
   71C5 F5            [11] 2277 	push	af
   71C6 33            [ 6] 2278 	inc	sp
   71C7 3A A5 64      [13] 2279 	ld	a,(_vidas)
   71CA F5            [11] 2280 	push	af
   71CB 33            [ 6] 2281 	inc	sp
   71CC CD 81 56      [17] 2282 	call	__moduchar
   71CF F1            [10] 2283 	pop	af
   71D0 C1            [10] 2284 	pop	bc
   71D1 7D            [ 4] 2285 	ld	a,l
   71D2 B7            [ 4] 2286 	or	a, a
   71D3 20 21         [12] 2287 	jr	NZ,00105$
                           2288 ;src/main.c:438: if (vidas == 0) {
   71D5 3A A5 64      [13] 2289 	ld	a,(#_vidas + 0)
   71D8 B7            [ 4] 2290 	or	a, a
   71D9 20 10         [12] 2291 	jr	NZ,00102$
                           2292 ;src/main.c:439: menuFin(puntuacion);
   71DB FD 21 73 65   [14] 2293 	ld	iy,#_puntuacion
   71DF FD 6E 00      [19] 2294 	ld	l,0 (iy)
   71E2 26 00         [ 7] 2295 	ld	h,#0x00
   71E4 C5            [11] 2296 	push	bc
   71E5 CD F5 4B      [17] 2297 	call	_menuFin
   71E8 C1            [10] 2298 	pop	bc
   71E9 18 0B         [12] 2299 	jr	00105$
   71EB                    2300 00102$:
                           2301 ;src/main.c:441: modificarVidas(vidas);
   71EB C5            [11] 2302 	push	bc
   71EC 3A A5 64      [13] 2303 	ld	a,(_vidas)
   71EF F5            [11] 2304 	push	af
   71F0 33            [ 6] 2305 	inc	sp
   71F1 CD 38 53      [17] 2306 	call	_modificarVidas
   71F4 33            [ 6] 2307 	inc	sp
   71F5 C1            [10] 2308 	pop	bc
   71F6                    2309 00105$:
                           2310 ;src/main.c:443: enemy->didDamage = 1;
   71F6 3E 01         [ 7] 2311 	ld	a,#0x01
   71F8 02            [ 7] 2312 	ld	(bc),a
   71F9                    2313 00107$:
                           2314 ;src/main.c:445: if (!enemy->didDamage) {
   71F9 0A            [ 7] 2315 	ld	a,(bc)
   71FA B7            [ 4] 2316 	or	a, a
   71FB C2 31 79      [10] 2317 	jp	NZ,00208$
                           2318 ;src/main.c:446: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   71FE DD 6E F6      [19] 2319 	ld	l,-10 (ix)
   7201 DD 66 F7      [19] 2320 	ld	h,-9 (ix)
   7204 4E            [ 7] 2321 	ld	c,(hl)
                           2322 ;src/main.c:426: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7205 DD 6E F4      [19] 2323 	ld	l,-12 (ix)
   7208 DD 66 F5      [19] 2324 	ld	h,-11 (ix)
   720B 7E            [ 7] 2325 	ld	a,(hl)
                           2326 ;src/main.c:459: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   720C DD 77 FA      [19] 2327 	ld	-6 (ix), a
   720F C6 04         [ 7] 2328 	add	a, #0x04
   7211 DD 77 FB      [19] 2329 	ld	-5 (ix),a
                           2330 ;src/main.c:446: if (enemy->y == dy || enemy->y == dy + 1 || enemy->y == dy - 1) { // alineado en el eje x
   7214 DD 7E 07      [19] 2331 	ld	a,7 (ix)
   7217 91            [ 4] 2332 	sub	a, c
   7218 28 35         [12] 2333 	jr	Z,00201$
   721A DD 5E 07      [19] 2334 	ld	e,7 (ix)
   721D 16 00         [ 7] 2335 	ld	d,#0x00
   721F 21 01 00      [10] 2336 	ld	hl,#0x0001
   7222 19            [11] 2337 	add	hl,de
   7223 DD 75 FC      [19] 2338 	ld	-4 (ix),l
   7226 DD 74 FD      [19] 2339 	ld	-3 (ix),h
   7229 DD 71 FE      [19] 2340 	ld	-2 (ix),c
   722C DD 36 FF 00   [19] 2341 	ld	-1 (ix),#0x00
   7230 DD 7E FC      [19] 2342 	ld	a,-4 (ix)
   7233 DD 96 FE      [19] 2343 	sub	a, -2 (ix)
   7236 20 08         [12] 2344 	jr	NZ,00447$
   7238 DD 7E FD      [19] 2345 	ld	a,-3 (ix)
   723B DD 96 FF      [19] 2346 	sub	a, -1 (ix)
   723E 28 0F         [12] 2347 	jr	Z,00201$
   7240                    2348 00447$:
   7240 1B            [ 6] 2349 	dec	de
   7241 DD 7E FE      [19] 2350 	ld	a,-2 (ix)
   7244 93            [ 4] 2351 	sub	a, e
   7245 C2 5C 73      [10] 2352 	jp	NZ,00202$
   7248 DD 7E FF      [19] 2353 	ld	a,-1 (ix)
   724B 92            [ 4] 2354 	sub	a, d
   724C C2 5C 73      [10] 2355 	jp	NZ,00202$
   724F                    2356 00201$:
                           2357 ;src/main.c:447: if (dx < enemy->x) { // izquierda
   724F DD 7E 06      [19] 2358 	ld	a,6 (ix)
   7252 DD 96 FA      [19] 2359 	sub	a, -6 (ix)
   7255 D2 D8 72      [10] 2360 	jp	NC,00121$
                           2361 ;src/main.c:448: if (dist > 11) {
   7258 3E 0B         [ 7] 2362 	ld	a,#0x0B
   725A DD 96 F0      [19] 2363 	sub	a, -16 (ix)
   725D D2 31 79      [10] 2364 	jp	NC,00208$
                           2365 ;src/main.c:449: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   7260 79            [ 4] 2366 	ld	a,c
   7261 F5            [11] 2367 	push	af
   7262 33            [ 6] 2368 	inc	sp
   7263 DD 7E FA      [19] 2369 	ld	a,-6 (ix)
   7266 F5            [11] 2370 	push	af
   7267 33            [ 6] 2371 	inc	sp
   7268 2A 70 65      [16] 2372 	ld	hl,(_mapa)
   726B E5            [11] 2373 	push	hl
   726C CD 71 4B      [17] 2374 	call	_getTilePtr
   726F F1            [10] 2375 	pop	af
   7270 F1            [10] 2376 	pop	af
   7271 4E            [ 7] 2377 	ld	c,(hl)
   7272 3E 02         [ 7] 2378 	ld	a,#0x02
   7274 91            [ 4] 2379 	sub	a, c
   7275 DA 31 79      [10] 2380 	jp	C,00208$
                           2381 ;src/main.c:450: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   7278 DD 6E F6      [19] 2382 	ld	l,-10 (ix)
   727B DD 66 F7      [19] 2383 	ld	h,-9 (ix)
   727E 7E            [ 7] 2384 	ld	a,(hl)
   727F C6 0B         [ 7] 2385 	add	a, #0x0B
   7281 57            [ 4] 2386 	ld	d,a
   7282 DD 6E F4      [19] 2387 	ld	l,-12 (ix)
   7285 DD 66 F5      [19] 2388 	ld	h,-11 (ix)
   7288 46            [ 7] 2389 	ld	b,(hl)
   7289 D5            [11] 2390 	push	de
   728A 33            [ 6] 2391 	inc	sp
   728B C5            [11] 2392 	push	bc
   728C 33            [ 6] 2393 	inc	sp
   728D 2A 70 65      [16] 2394 	ld	hl,(_mapa)
   7290 E5            [11] 2395 	push	hl
   7291 CD 71 4B      [17] 2396 	call	_getTilePtr
   7294 F1            [10] 2397 	pop	af
   7295 F1            [10] 2398 	pop	af
   7296 4E            [ 7] 2399 	ld	c,(hl)
   7297 3E 02         [ 7] 2400 	ld	a,#0x02
   7299 91            [ 4] 2401 	sub	a, c
   729A DA 31 79      [10] 2402 	jp	C,00208$
                           2403 ;src/main.c:451: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   729D DD 6E F6      [19] 2404 	ld	l,-10 (ix)
   72A0 DD 66 F7      [19] 2405 	ld	h,-9 (ix)
   72A3 7E            [ 7] 2406 	ld	a,(hl)
   72A4 C6 16         [ 7] 2407 	add	a, #0x16
   72A6 57            [ 4] 2408 	ld	d,a
   72A7 DD 6E F4      [19] 2409 	ld	l,-12 (ix)
   72AA DD 66 F5      [19] 2410 	ld	h,-11 (ix)
   72AD 46            [ 7] 2411 	ld	b,(hl)
   72AE D5            [11] 2412 	push	de
   72AF 33            [ 6] 2413 	inc	sp
   72B0 C5            [11] 2414 	push	bc
   72B1 33            [ 6] 2415 	inc	sp
   72B2 2A 70 65      [16] 2416 	ld	hl,(_mapa)
   72B5 E5            [11] 2417 	push	hl
   72B6 CD 71 4B      [17] 2418 	call	_getTilePtr
   72B9 F1            [10] 2419 	pop	af
   72BA F1            [10] 2420 	pop	af
   72BB 4E            [ 7] 2421 	ld	c,(hl)
   72BC 3E 02         [ 7] 2422 	ld	a,#0x02
   72BE 91            [ 4] 2423 	sub	a, c
   72BF DA 31 79      [10] 2424 	jp	C,00208$
                           2425 ;src/main.c:452: moverEnemigoIzquierda(enemy);
   72C2 DD 6E F4      [19] 2426 	ld	l,-12 (ix)
   72C5 DD 66 F5      [19] 2427 	ld	h,-11 (ix)
   72C8 E5            [11] 2428 	push	hl
   72C9 CD 0D 6C      [17] 2429 	call	_moverEnemigoIzquierda
   72CC F1            [10] 2430 	pop	af
                           2431 ;src/main.c:454: enemy->mover = SI;
   72CD DD 6E F8      [19] 2432 	ld	l,-8 (ix)
   72D0 DD 66 F9      [19] 2433 	ld	h,-7 (ix)
   72D3 36 01         [10] 2434 	ld	(hl),#0x01
   72D5 C3 31 79      [10] 2435 	jp	00208$
   72D8                    2436 00121$:
                           2437 ;src/main.c:458: if (dist > G_ENEMY_W + 3) {
   72D8 3E 07         [ 7] 2438 	ld	a,#0x07
   72DA DD 96 F0      [19] 2439 	sub	a, -16 (ix)
   72DD D2 31 79      [10] 2440 	jp	NC,00208$
                           2441 ;src/main.c:459: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   72E0 79            [ 4] 2442 	ld	a,c
   72E1 F5            [11] 2443 	push	af
   72E2 33            [ 6] 2444 	inc	sp
   72E3 DD 7E FB      [19] 2445 	ld	a,-5 (ix)
   72E6 F5            [11] 2446 	push	af
   72E7 33            [ 6] 2447 	inc	sp
   72E8 2A 70 65      [16] 2448 	ld	hl,(_mapa)
   72EB E5            [11] 2449 	push	hl
   72EC CD 71 4B      [17] 2450 	call	_getTilePtr
   72EF F1            [10] 2451 	pop	af
   72F0 F1            [10] 2452 	pop	af
   72F1 4E            [ 7] 2453 	ld	c,(hl)
   72F2 3E 02         [ 7] 2454 	ld	a,#0x02
   72F4 91            [ 4] 2455 	sub	a, c
   72F5 DA 31 79      [10] 2456 	jp	C,00208$
                           2457 ;src/main.c:460: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   72F8 DD 6E F6      [19] 2458 	ld	l,-10 (ix)
   72FB DD 66 F7      [19] 2459 	ld	h,-9 (ix)
   72FE 7E            [ 7] 2460 	ld	a,(hl)
   72FF C6 0B         [ 7] 2461 	add	a, #0x0B
   7301 47            [ 4] 2462 	ld	b,a
   7302 DD 6E F4      [19] 2463 	ld	l,-12 (ix)
   7305 DD 66 F5      [19] 2464 	ld	h,-11 (ix)
   7308 7E            [ 7] 2465 	ld	a,(hl)
   7309 C6 04         [ 7] 2466 	add	a, #0x04
   730B C5            [11] 2467 	push	bc
   730C 33            [ 6] 2468 	inc	sp
   730D F5            [11] 2469 	push	af
   730E 33            [ 6] 2470 	inc	sp
   730F 2A 70 65      [16] 2471 	ld	hl,(_mapa)
   7312 E5            [11] 2472 	push	hl
   7313 CD 71 4B      [17] 2473 	call	_getTilePtr
   7316 F1            [10] 2474 	pop	af
   7317 F1            [10] 2475 	pop	af
   7318 4E            [ 7] 2476 	ld	c,(hl)
   7319 3E 02         [ 7] 2477 	ld	a,#0x02
   731B 91            [ 4] 2478 	sub	a, c
   731C DA 31 79      [10] 2479 	jp	C,00208$
                           2480 ;src/main.c:461: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   731F DD 6E F6      [19] 2481 	ld	l,-10 (ix)
   7322 DD 66 F7      [19] 2482 	ld	h,-9 (ix)
   7325 7E            [ 7] 2483 	ld	a,(hl)
   7326 C6 16         [ 7] 2484 	add	a, #0x16
   7328 47            [ 4] 2485 	ld	b,a
   7329 DD 6E F4      [19] 2486 	ld	l,-12 (ix)
   732C DD 66 F5      [19] 2487 	ld	h,-11 (ix)
   732F 7E            [ 7] 2488 	ld	a,(hl)
   7330 C6 04         [ 7] 2489 	add	a, #0x04
   7332 C5            [11] 2490 	push	bc
   7333 33            [ 6] 2491 	inc	sp
   7334 F5            [11] 2492 	push	af
   7335 33            [ 6] 2493 	inc	sp
   7336 2A 70 65      [16] 2494 	ld	hl,(_mapa)
   7339 E5            [11] 2495 	push	hl
   733A CD 71 4B      [17] 2496 	call	_getTilePtr
   733D F1            [10] 2497 	pop	af
   733E F1            [10] 2498 	pop	af
   733F 4E            [ 7] 2499 	ld	c,(hl)
   7340 3E 02         [ 7] 2500 	ld	a,#0x02
   7342 91            [ 4] 2501 	sub	a, c
   7343 DA 31 79      [10] 2502 	jp	C,00208$
                           2503 ;src/main.c:462: moverEnemigoDerecha(enemy);
   7346 DD 6E F4      [19] 2504 	ld	l,-12 (ix)
   7349 DD 66 F5      [19] 2505 	ld	h,-11 (ix)
   734C E5            [11] 2506 	push	hl
   734D CD FD 6B      [17] 2507 	call	_moverEnemigoDerecha
   7350 F1            [10] 2508 	pop	af
                           2509 ;src/main.c:464: enemy->mover = SI;
   7351 DD 6E F8      [19] 2510 	ld	l,-8 (ix)
   7354 DD 66 F9      [19] 2511 	ld	h,-7 (ix)
   7357 36 01         [10] 2512 	ld	(hl),#0x01
   7359 C3 31 79      [10] 2513 	jp	00208$
   735C                    2514 00202$:
                           2515 ;src/main.c:469: else if (enemy->x == dx) {
   735C DD 7E FA      [19] 2516 	ld	a,-6 (ix)
   735F DD 96 06      [19] 2517 	sub	a, 6 (ix)
   7362 C2 77 74      [10] 2518 	jp	NZ,00199$
                           2519 ;src/main.c:470: if (dy < enemy->y) {
   7365 DD 7E 07      [19] 2520 	ld	a,7 (ix)
   7368 91            [ 4] 2521 	sub	a, c
   7369 D2 F0 73      [10] 2522 	jp	NC,00136$
                           2523 ;src/main.c:471: if (dist > G_HERO_H + 5) {
   736C 3E 1B         [ 7] 2524 	ld	a,#0x1B
   736E DD 96 F0      [19] 2525 	sub	a, -16 (ix)
   7371 D2 31 79      [10] 2526 	jp	NC,00208$
                           2527 ;src/main.c:472: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7374 41            [ 4] 2528 	ld	b,c
   7375 05            [ 4] 2529 	dec	b
   7376 05            [ 4] 2530 	dec	b
   7377 C5            [11] 2531 	push	bc
   7378 33            [ 6] 2532 	inc	sp
   7379 DD 7E FA      [19] 2533 	ld	a,-6 (ix)
   737C F5            [11] 2534 	push	af
   737D 33            [ 6] 2535 	inc	sp
   737E 2A 70 65      [16] 2536 	ld	hl,(_mapa)
   7381 E5            [11] 2537 	push	hl
   7382 CD 71 4B      [17] 2538 	call	_getTilePtr
   7385 F1            [10] 2539 	pop	af
   7386 F1            [10] 2540 	pop	af
   7387 4E            [ 7] 2541 	ld	c,(hl)
   7388 3E 02         [ 7] 2542 	ld	a,#0x02
   738A 91            [ 4] 2543 	sub	a, c
   738B DA 31 79      [10] 2544 	jp	C,00208$
                           2545 ;src/main.c:473: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   738E DD 6E F6      [19] 2546 	ld	l,-10 (ix)
   7391 DD 66 F7      [19] 2547 	ld	h,-9 (ix)
   7394 56            [ 7] 2548 	ld	d,(hl)
   7395 15            [ 4] 2549 	dec	d
   7396 15            [ 4] 2550 	dec	d
   7397 DD 6E F4      [19] 2551 	ld	l,-12 (ix)
   739A DD 66 F5      [19] 2552 	ld	h,-11 (ix)
   739D 46            [ 7] 2553 	ld	b,(hl)
   739E 04            [ 4] 2554 	inc	b
   739F 04            [ 4] 2555 	inc	b
   73A0 D5            [11] 2556 	push	de
   73A1 33            [ 6] 2557 	inc	sp
   73A2 C5            [11] 2558 	push	bc
   73A3 33            [ 6] 2559 	inc	sp
   73A4 2A 70 65      [16] 2560 	ld	hl,(_mapa)
   73A7 E5            [11] 2561 	push	hl
   73A8 CD 71 4B      [17] 2562 	call	_getTilePtr
   73AB F1            [10] 2563 	pop	af
   73AC F1            [10] 2564 	pop	af
   73AD 4E            [ 7] 2565 	ld	c,(hl)
   73AE 3E 02         [ 7] 2566 	ld	a,#0x02
   73B0 91            [ 4] 2567 	sub	a, c
   73B1 DA 31 79      [10] 2568 	jp	C,00208$
                           2569 ;src/main.c:474: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   73B4 DD 6E F6      [19] 2570 	ld	l,-10 (ix)
   73B7 DD 66 F7      [19] 2571 	ld	h,-9 (ix)
   73BA 46            [ 7] 2572 	ld	b,(hl)
   73BB 05            [ 4] 2573 	dec	b
   73BC 05            [ 4] 2574 	dec	b
   73BD DD 6E F4      [19] 2575 	ld	l,-12 (ix)
   73C0 DD 66 F5      [19] 2576 	ld	h,-11 (ix)
   73C3 7E            [ 7] 2577 	ld	a,(hl)
   73C4 C6 04         [ 7] 2578 	add	a, #0x04
   73C6 C5            [11] 2579 	push	bc
   73C7 33            [ 6] 2580 	inc	sp
   73C8 F5            [11] 2581 	push	af
   73C9 33            [ 6] 2582 	inc	sp
   73CA 2A 70 65      [16] 2583 	ld	hl,(_mapa)
   73CD E5            [11] 2584 	push	hl
   73CE CD 71 4B      [17] 2585 	call	_getTilePtr
   73D1 F1            [10] 2586 	pop	af
   73D2 F1            [10] 2587 	pop	af
   73D3 4E            [ 7] 2588 	ld	c,(hl)
   73D4 3E 02         [ 7] 2589 	ld	a,#0x02
   73D6 91            [ 4] 2590 	sub	a, c
   73D7 DA 31 79      [10] 2591 	jp	C,00208$
                           2592 ;src/main.c:475: moverEnemigoArriba(enemy);
   73DA DD 6E F4      [19] 2593 	ld	l,-12 (ix)
   73DD DD 66 F5      [19] 2594 	ld	h,-11 (ix)
   73E0 E5            [11] 2595 	push	hl
   73E1 CD BF 6B      [17] 2596 	call	_moverEnemigoArriba
   73E4 F1            [10] 2597 	pop	af
                           2598 ;src/main.c:477: enemy->mover = SI;
   73E5 DD 6E F8      [19] 2599 	ld	l,-8 (ix)
   73E8 DD 66 F9      [19] 2600 	ld	h,-7 (ix)
   73EB 36 01         [10] 2601 	ld	(hl),#0x01
   73ED C3 31 79      [10] 2602 	jp	00208$
   73F0                    2603 00136$:
                           2604 ;src/main.c:481: if(dist > G_ENEMY_H + 7) {
   73F0 3E 1D         [ 7] 2605 	ld	a,#0x1D
   73F2 DD 96 F0      [19] 2606 	sub	a, -16 (ix)
   73F5 D2 31 79      [10] 2607 	jp	NC,00208$
                           2608 ;src/main.c:482: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   73F8 79            [ 4] 2609 	ld	a,c
   73F9 C6 18         [ 7] 2610 	add	a, #0x18
   73FB 47            [ 4] 2611 	ld	b,a
   73FC C5            [11] 2612 	push	bc
   73FD 33            [ 6] 2613 	inc	sp
   73FE DD 7E FA      [19] 2614 	ld	a,-6 (ix)
   7401 F5            [11] 2615 	push	af
   7402 33            [ 6] 2616 	inc	sp
   7403 2A 70 65      [16] 2617 	ld	hl,(_mapa)
   7406 E5            [11] 2618 	push	hl
   7407 CD 71 4B      [17] 2619 	call	_getTilePtr
   740A F1            [10] 2620 	pop	af
   740B F1            [10] 2621 	pop	af
   740C 4E            [ 7] 2622 	ld	c,(hl)
   740D 3E 02         [ 7] 2623 	ld	a,#0x02
   740F 91            [ 4] 2624 	sub	a, c
   7410 DA 31 79      [10] 2625 	jp	C,00208$
                           2626 ;src/main.c:483: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7413 DD 6E F6      [19] 2627 	ld	l,-10 (ix)
   7416 DD 66 F7      [19] 2628 	ld	h,-9 (ix)
   7419 7E            [ 7] 2629 	ld	a,(hl)
   741A C6 18         [ 7] 2630 	add	a, #0x18
   741C 57            [ 4] 2631 	ld	d,a
   741D DD 6E F4      [19] 2632 	ld	l,-12 (ix)
   7420 DD 66 F5      [19] 2633 	ld	h,-11 (ix)
   7423 46            [ 7] 2634 	ld	b,(hl)
   7424 04            [ 4] 2635 	inc	b
   7425 04            [ 4] 2636 	inc	b
   7426 D5            [11] 2637 	push	de
   7427 33            [ 6] 2638 	inc	sp
   7428 C5            [11] 2639 	push	bc
   7429 33            [ 6] 2640 	inc	sp
   742A 2A 70 65      [16] 2641 	ld	hl,(_mapa)
   742D E5            [11] 2642 	push	hl
   742E CD 71 4B      [17] 2643 	call	_getTilePtr
   7431 F1            [10] 2644 	pop	af
   7432 F1            [10] 2645 	pop	af
   7433 4E            [ 7] 2646 	ld	c,(hl)
   7434 3E 02         [ 7] 2647 	ld	a,#0x02
   7436 91            [ 4] 2648 	sub	a, c
   7437 DA 31 79      [10] 2649 	jp	C,00208$
                           2650 ;src/main.c:484: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   743A DD 6E F6      [19] 2651 	ld	l,-10 (ix)
   743D DD 66 F7      [19] 2652 	ld	h,-9 (ix)
   7440 7E            [ 7] 2653 	ld	a,(hl)
   7441 C6 18         [ 7] 2654 	add	a, #0x18
   7443 47            [ 4] 2655 	ld	b,a
   7444 DD 6E F4      [19] 2656 	ld	l,-12 (ix)
   7447 DD 66 F5      [19] 2657 	ld	h,-11 (ix)
   744A 7E            [ 7] 2658 	ld	a,(hl)
   744B C6 04         [ 7] 2659 	add	a, #0x04
   744D C5            [11] 2660 	push	bc
   744E 33            [ 6] 2661 	inc	sp
   744F F5            [11] 2662 	push	af
   7450 33            [ 6] 2663 	inc	sp
   7451 2A 70 65      [16] 2664 	ld	hl,(_mapa)
   7454 E5            [11] 2665 	push	hl
   7455 CD 71 4B      [17] 2666 	call	_getTilePtr
   7458 F1            [10] 2667 	pop	af
   7459 F1            [10] 2668 	pop	af
   745A 4E            [ 7] 2669 	ld	c,(hl)
   745B 3E 02         [ 7] 2670 	ld	a,#0x02
   745D 91            [ 4] 2671 	sub	a, c
   745E DA 31 79      [10] 2672 	jp	C,00208$
                           2673 ;src/main.c:485: moverEnemigoAbajo(enemy);
   7461 DD 6E F4      [19] 2674 	ld	l,-12 (ix)
   7464 DD 66 F5      [19] 2675 	ld	h,-11 (ix)
   7467 E5            [11] 2676 	push	hl
   7468 CD DE 6B      [17] 2677 	call	_moverEnemigoAbajo
   746B F1            [10] 2678 	pop	af
                           2679 ;src/main.c:487: enemy->mover = SI;
   746C DD 6E F8      [19] 2680 	ld	l,-8 (ix)
   746F DD 66 F9      [19] 2681 	ld	h,-7 (ix)
   7472 36 01         [10] 2682 	ld	(hl),#0x01
   7474 C3 31 79      [10] 2683 	jp	00208$
   7477                    2684 00199$:
                           2685 ;src/main.c:493: if (!prota.mover) distConstraint = 20; // ajuste en parado
   7477 3A 94 64      [13] 2686 	ld	a, (#_prota + 6)
   747A B7            [ 4] 2687 	or	a, a
   747B 20 04         [12] 2688 	jr	NZ,00139$
   747D DD 36 F1 14   [19] 2689 	ld	-15 (ix),#0x14
   7481                    2690 00139$:
                           2691 ;src/main.c:495: if (dist > distConstraint) {
   7481 DD 7E F1      [19] 2692 	ld	a,-15 (ix)
   7484 DD 96 F0      [19] 2693 	sub	a, -16 (ix)
   7487 D2 31 79      [10] 2694 	jp	NC,00208$
                           2695 ;src/main.c:496: if (dx + 1 < enemy->x) {
   748A DD 5E 06      [19] 2696 	ld	e,6 (ix)
   748D 16 00         [ 7] 2697 	ld	d,#0x00
   748F 13            [ 6] 2698 	inc	de
   7490 DD 7E FA      [19] 2699 	ld	a,-6 (ix)
   7493 DD 77 FE      [19] 2700 	ld	-2 (ix),a
   7496 DD 36 FF 00   [19] 2701 	ld	-1 (ix),#0x00
   749A 7B            [ 4] 2702 	ld	a,e
   749B DD 96 FE      [19] 2703 	sub	a, -2 (ix)
   749E 7A            [ 4] 2704 	ld	a,d
   749F DD 9E FF      [19] 2705 	sbc	a, -1 (ix)
   74A2 E2 A7 74      [10] 2706 	jp	PO, 00452$
   74A5 EE 80         [ 7] 2707 	xor	a, #0x80
   74A7                    2708 00452$:
   74A7 F2 26 75      [10] 2709 	jp	P,00151$
                           2710 ;src/main.c:497: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   74AA 79            [ 4] 2711 	ld	a,c
   74AB F5            [11] 2712 	push	af
   74AC 33            [ 6] 2713 	inc	sp
   74AD DD 7E FA      [19] 2714 	ld	a,-6 (ix)
   74B0 F5            [11] 2715 	push	af
   74B1 33            [ 6] 2716 	inc	sp
   74B2 2A 70 65      [16] 2717 	ld	hl,(_mapa)
   74B5 E5            [11] 2718 	push	hl
   74B6 CD 71 4B      [17] 2719 	call	_getTilePtr
   74B9 F1            [10] 2720 	pop	af
   74BA F1            [10] 2721 	pop	af
   74BB 4E            [ 7] 2722 	ld	c,(hl)
   74BC 3E 02         [ 7] 2723 	ld	a,#0x02
   74BE 91            [ 4] 2724 	sub	a, c
   74BF DA B0 75      [10] 2725 	jp	C,00152$
                           2726 ;src/main.c:498: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   74C2 DD 6E F6      [19] 2727 	ld	l,-10 (ix)
   74C5 DD 66 F7      [19] 2728 	ld	h,-9 (ix)
   74C8 7E            [ 7] 2729 	ld	a,(hl)
   74C9 C6 0B         [ 7] 2730 	add	a, #0x0B
   74CB 57            [ 4] 2731 	ld	d,a
   74CC DD 6E F4      [19] 2732 	ld	l,-12 (ix)
   74CF DD 66 F5      [19] 2733 	ld	h,-11 (ix)
   74D2 46            [ 7] 2734 	ld	b,(hl)
   74D3 D5            [11] 2735 	push	de
   74D4 33            [ 6] 2736 	inc	sp
   74D5 C5            [11] 2737 	push	bc
   74D6 33            [ 6] 2738 	inc	sp
   74D7 2A 70 65      [16] 2739 	ld	hl,(_mapa)
   74DA E5            [11] 2740 	push	hl
   74DB CD 71 4B      [17] 2741 	call	_getTilePtr
   74DE F1            [10] 2742 	pop	af
   74DF F1            [10] 2743 	pop	af
   74E0 4E            [ 7] 2744 	ld	c,(hl)
   74E1 3E 02         [ 7] 2745 	ld	a,#0x02
   74E3 91            [ 4] 2746 	sub	a, c
   74E4 DA B0 75      [10] 2747 	jp	C,00152$
                           2748 ;src/main.c:499: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   74E7 DD 6E F6      [19] 2749 	ld	l,-10 (ix)
   74EA DD 66 F7      [19] 2750 	ld	h,-9 (ix)
   74ED 7E            [ 7] 2751 	ld	a,(hl)
   74EE C6 16         [ 7] 2752 	add	a, #0x16
   74F0 57            [ 4] 2753 	ld	d,a
   74F1 DD 6E F4      [19] 2754 	ld	l,-12 (ix)
   74F4 DD 66 F5      [19] 2755 	ld	h,-11 (ix)
   74F7 46            [ 7] 2756 	ld	b,(hl)
   74F8 D5            [11] 2757 	push	de
   74F9 33            [ 6] 2758 	inc	sp
   74FA C5            [11] 2759 	push	bc
   74FB 33            [ 6] 2760 	inc	sp
   74FC 2A 70 65      [16] 2761 	ld	hl,(_mapa)
   74FF E5            [11] 2762 	push	hl
   7500 CD 71 4B      [17] 2763 	call	_getTilePtr
   7503 F1            [10] 2764 	pop	af
   7504 F1            [10] 2765 	pop	af
   7505 4E            [ 7] 2766 	ld	c,(hl)
   7506 3E 02         [ 7] 2767 	ld	a,#0x02
   7508 91            [ 4] 2768 	sub	a, c
   7509 DA B0 75      [10] 2769 	jp	C,00152$
                           2770 ;src/main.c:500: moverEnemigoIzquierda(enemy);
   750C DD 6E F4      [19] 2771 	ld	l,-12 (ix)
   750F DD 66 F5      [19] 2772 	ld	h,-11 (ix)
   7512 E5            [11] 2773 	push	hl
   7513 CD 0D 6C      [17] 2774 	call	_moverEnemigoIzquierda
   7516 F1            [10] 2775 	pop	af
                           2776 ;src/main.c:501: movX = 1;
   7517 DD 36 F3 01   [19] 2777 	ld	-13 (ix),#0x01
                           2778 ;src/main.c:502: enemy->mover = SI;
   751B DD 6E F8      [19] 2779 	ld	l,-8 (ix)
   751E DD 66 F9      [19] 2780 	ld	h,-7 (ix)
   7521 36 01         [10] 2781 	ld	(hl),#0x01
   7523 C3 B0 75      [10] 2782 	jp	00152$
   7526                    2783 00151$:
                           2784 ;src/main.c:504: } else if (dx + 1 > enemy->x){
   7526 DD 7E FE      [19] 2785 	ld	a,-2 (ix)
   7529 93            [ 4] 2786 	sub	a, e
   752A DD 7E FF      [19] 2787 	ld	a,-1 (ix)
   752D 9A            [ 4] 2788 	sbc	a, d
   752E E2 33 75      [10] 2789 	jp	PO, 00453$
   7531 EE 80         [ 7] 2790 	xor	a, #0x80
   7533                    2791 00453$:
   7533 F2 B0 75      [10] 2792 	jp	P,00152$
                           2793 ;src/main.c:505: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   7536 79            [ 4] 2794 	ld	a,c
   7537 F5            [11] 2795 	push	af
   7538 33            [ 6] 2796 	inc	sp
   7539 DD 7E FB      [19] 2797 	ld	a,-5 (ix)
   753C F5            [11] 2798 	push	af
   753D 33            [ 6] 2799 	inc	sp
   753E 2A 70 65      [16] 2800 	ld	hl,(_mapa)
   7541 E5            [11] 2801 	push	hl
   7542 CD 71 4B      [17] 2802 	call	_getTilePtr
   7545 F1            [10] 2803 	pop	af
   7546 F1            [10] 2804 	pop	af
   7547 4E            [ 7] 2805 	ld	c,(hl)
   7548 3E 02         [ 7] 2806 	ld	a,#0x02
   754A 91            [ 4] 2807 	sub	a, c
   754B 38 63         [12] 2808 	jr	C,00152$
                           2809 ;src/main.c:506: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   754D DD 6E F6      [19] 2810 	ld	l,-10 (ix)
   7550 DD 66 F7      [19] 2811 	ld	h,-9 (ix)
   7553 7E            [ 7] 2812 	ld	a,(hl)
   7554 C6 0B         [ 7] 2813 	add	a, #0x0B
   7556 47            [ 4] 2814 	ld	b,a
   7557 DD 6E F4      [19] 2815 	ld	l,-12 (ix)
   755A DD 66 F5      [19] 2816 	ld	h,-11 (ix)
   755D 7E            [ 7] 2817 	ld	a,(hl)
   755E C6 04         [ 7] 2818 	add	a, #0x04
   7560 C5            [11] 2819 	push	bc
   7561 33            [ 6] 2820 	inc	sp
   7562 F5            [11] 2821 	push	af
   7563 33            [ 6] 2822 	inc	sp
   7564 2A 70 65      [16] 2823 	ld	hl,(_mapa)
   7567 E5            [11] 2824 	push	hl
   7568 CD 71 4B      [17] 2825 	call	_getTilePtr
   756B F1            [10] 2826 	pop	af
   756C F1            [10] 2827 	pop	af
   756D 4E            [ 7] 2828 	ld	c,(hl)
   756E 3E 02         [ 7] 2829 	ld	a,#0x02
   7570 91            [ 4] 2830 	sub	a, c
   7571 38 3D         [12] 2831 	jr	C,00152$
                           2832 ;src/main.c:507: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   7573 DD 6E F6      [19] 2833 	ld	l,-10 (ix)
   7576 DD 66 F7      [19] 2834 	ld	h,-9 (ix)
   7579 7E            [ 7] 2835 	ld	a,(hl)
   757A C6 16         [ 7] 2836 	add	a, #0x16
   757C 47            [ 4] 2837 	ld	b,a
   757D DD 6E F4      [19] 2838 	ld	l,-12 (ix)
   7580 DD 66 F5      [19] 2839 	ld	h,-11 (ix)
   7583 7E            [ 7] 2840 	ld	a,(hl)
   7584 C6 04         [ 7] 2841 	add	a, #0x04
   7586 C5            [11] 2842 	push	bc
   7587 33            [ 6] 2843 	inc	sp
   7588 F5            [11] 2844 	push	af
   7589 33            [ 6] 2845 	inc	sp
   758A 2A 70 65      [16] 2846 	ld	hl,(_mapa)
   758D E5            [11] 2847 	push	hl
   758E CD 71 4B      [17] 2848 	call	_getTilePtr
   7591 F1            [10] 2849 	pop	af
   7592 F1            [10] 2850 	pop	af
   7593 4E            [ 7] 2851 	ld	c,(hl)
   7594 3E 02         [ 7] 2852 	ld	a,#0x02
   7596 91            [ 4] 2853 	sub	a, c
   7597 38 17         [12] 2854 	jr	C,00152$
                           2855 ;src/main.c:508: moverEnemigoDerecha(enemy);
   7599 DD 6E F4      [19] 2856 	ld	l,-12 (ix)
   759C DD 66 F5      [19] 2857 	ld	h,-11 (ix)
   759F E5            [11] 2858 	push	hl
   75A0 CD FD 6B      [17] 2859 	call	_moverEnemigoDerecha
   75A3 F1            [10] 2860 	pop	af
                           2861 ;src/main.c:509: movX = 1;
   75A4 DD 36 F3 01   [19] 2862 	ld	-13 (ix),#0x01
                           2863 ;src/main.c:510: enemy->mover = SI;
   75A8 DD 6E F8      [19] 2864 	ld	l,-8 (ix)
   75AB DD 66 F9      [19] 2865 	ld	h,-7 (ix)
   75AE 36 01         [10] 2866 	ld	(hl),#0x01
   75B0                    2867 00152$:
                           2868 ;src/main.c:513: if (dy < enemy->y) {
   75B0 DD 6E F6      [19] 2869 	ld	l,-10 (ix)
   75B3 DD 66 F7      [19] 2870 	ld	h,-9 (ix)
   75B6 7E            [ 7] 2871 	ld	a,(hl)
   75B7 DD 77 FE      [19] 2872 	ld	-2 (ix),a
                           2873 ;src/main.c:426: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   75BA DD 6E F4      [19] 2874 	ld	l,-12 (ix)
   75BD DD 66 F5      [19] 2875 	ld	h,-11 (ix)
   75C0 7E            [ 7] 2876 	ld	a,(hl)
   75C1 DD 77 FC      [19] 2877 	ld	-4 (ix),a
                           2878 ;src/main.c:513: if (dy < enemy->y) {
   75C4 DD 7E 07      [19] 2879 	ld	a,7 (ix)
   75C7 DD 96 FE      [19] 2880 	sub	a, -2 (ix)
   75CA D2 4F 76      [10] 2881 	jp	NC,00162$
                           2882 ;src/main.c:514: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   75CD DD 46 FE      [19] 2883 	ld	b,-2 (ix)
   75D0 05            [ 4] 2884 	dec	b
   75D1 05            [ 4] 2885 	dec	b
   75D2 C5            [11] 2886 	push	bc
   75D3 33            [ 6] 2887 	inc	sp
   75D4 DD 7E FC      [19] 2888 	ld	a,-4 (ix)
   75D7 F5            [11] 2889 	push	af
   75D8 33            [ 6] 2890 	inc	sp
   75D9 2A 70 65      [16] 2891 	ld	hl,(_mapa)
   75DC E5            [11] 2892 	push	hl
   75DD CD 71 4B      [17] 2893 	call	_getTilePtr
   75E0 F1            [10] 2894 	pop	af
   75E1 F1            [10] 2895 	pop	af
   75E2 4E            [ 7] 2896 	ld	c,(hl)
   75E3 3E 02         [ 7] 2897 	ld	a,#0x02
   75E5 91            [ 4] 2898 	sub	a, c
   75E6 DA CE 76      [10] 2899 	jp	C,00163$
                           2900 ;src/main.c:515: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   75E9 DD 6E F6      [19] 2901 	ld	l,-10 (ix)
   75EC DD 66 F7      [19] 2902 	ld	h,-9 (ix)
   75EF 56            [ 7] 2903 	ld	d,(hl)
   75F0 15            [ 4] 2904 	dec	d
   75F1 15            [ 4] 2905 	dec	d
   75F2 DD 6E F4      [19] 2906 	ld	l,-12 (ix)
   75F5 DD 66 F5      [19] 2907 	ld	h,-11 (ix)
   75F8 46            [ 7] 2908 	ld	b,(hl)
   75F9 04            [ 4] 2909 	inc	b
   75FA 04            [ 4] 2910 	inc	b
   75FB D5            [11] 2911 	push	de
   75FC 33            [ 6] 2912 	inc	sp
   75FD C5            [11] 2913 	push	bc
   75FE 33            [ 6] 2914 	inc	sp
   75FF 2A 70 65      [16] 2915 	ld	hl,(_mapa)
   7602 E5            [11] 2916 	push	hl
   7603 CD 71 4B      [17] 2917 	call	_getTilePtr
   7606 F1            [10] 2918 	pop	af
   7607 F1            [10] 2919 	pop	af
   7608 4E            [ 7] 2920 	ld	c,(hl)
   7609 3E 02         [ 7] 2921 	ld	a,#0x02
   760B 91            [ 4] 2922 	sub	a, c
   760C DA CE 76      [10] 2923 	jp	C,00163$
                           2924 ;src/main.c:516: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   760F DD 6E F6      [19] 2925 	ld	l,-10 (ix)
   7612 DD 66 F7      [19] 2926 	ld	h,-9 (ix)
   7615 46            [ 7] 2927 	ld	b,(hl)
   7616 05            [ 4] 2928 	dec	b
   7617 05            [ 4] 2929 	dec	b
   7618 DD 6E F4      [19] 2930 	ld	l,-12 (ix)
   761B DD 66 F5      [19] 2931 	ld	h,-11 (ix)
   761E 7E            [ 7] 2932 	ld	a,(hl)
   761F C6 04         [ 7] 2933 	add	a, #0x04
   7621 C5            [11] 2934 	push	bc
   7622 33            [ 6] 2935 	inc	sp
   7623 F5            [11] 2936 	push	af
   7624 33            [ 6] 2937 	inc	sp
   7625 2A 70 65      [16] 2938 	ld	hl,(_mapa)
   7628 E5            [11] 2939 	push	hl
   7629 CD 71 4B      [17] 2940 	call	_getTilePtr
   762C F1            [10] 2941 	pop	af
   762D F1            [10] 2942 	pop	af
   762E 4E            [ 7] 2943 	ld	c,(hl)
   762F 3E 02         [ 7] 2944 	ld	a,#0x02
   7631 91            [ 4] 2945 	sub	a, c
   7632 DA CE 76      [10] 2946 	jp	C,00163$
                           2947 ;src/main.c:517: moverEnemigoArriba(enemy);
   7635 DD 6E F4      [19] 2948 	ld	l,-12 (ix)
   7638 DD 66 F5      [19] 2949 	ld	h,-11 (ix)
   763B E5            [11] 2950 	push	hl
   763C CD BF 6B      [17] 2951 	call	_moverEnemigoArriba
   763F F1            [10] 2952 	pop	af
                           2953 ;src/main.c:518: movY = 1;
   7640 DD 36 F2 01   [19] 2954 	ld	-14 (ix),#0x01
                           2955 ;src/main.c:519: enemy->mover = SI;
   7644 DD 6E F8      [19] 2956 	ld	l,-8 (ix)
   7647 DD 66 F9      [19] 2957 	ld	h,-7 (ix)
   764A 36 01         [10] 2958 	ld	(hl),#0x01
   764C C3 CE 76      [10] 2959 	jp	00163$
   764F                    2960 00162$:
                           2961 ;src/main.c:522: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   764F DD 7E FE      [19] 2962 	ld	a,-2 (ix)
   7652 C6 18         [ 7] 2963 	add	a, #0x18
   7654 47            [ 4] 2964 	ld	b,a
   7655 C5            [11] 2965 	push	bc
   7656 33            [ 6] 2966 	inc	sp
   7657 DD 7E FC      [19] 2967 	ld	a,-4 (ix)
   765A F5            [11] 2968 	push	af
   765B 33            [ 6] 2969 	inc	sp
   765C 2A 70 65      [16] 2970 	ld	hl,(_mapa)
   765F E5            [11] 2971 	push	hl
   7660 CD 71 4B      [17] 2972 	call	_getTilePtr
   7663 F1            [10] 2973 	pop	af
   7664 F1            [10] 2974 	pop	af
   7665 4E            [ 7] 2975 	ld	c,(hl)
   7666 3E 02         [ 7] 2976 	ld	a,#0x02
   7668 91            [ 4] 2977 	sub	a, c
   7669 38 63         [12] 2978 	jr	C,00163$
                           2979 ;src/main.c:523: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   766B DD 6E F6      [19] 2980 	ld	l,-10 (ix)
   766E DD 66 F7      [19] 2981 	ld	h,-9 (ix)
   7671 7E            [ 7] 2982 	ld	a,(hl)
   7672 C6 18         [ 7] 2983 	add	a, #0x18
   7674 57            [ 4] 2984 	ld	d,a
   7675 DD 6E F4      [19] 2985 	ld	l,-12 (ix)
   7678 DD 66 F5      [19] 2986 	ld	h,-11 (ix)
   767B 46            [ 7] 2987 	ld	b,(hl)
   767C 04            [ 4] 2988 	inc	b
   767D 04            [ 4] 2989 	inc	b
   767E D5            [11] 2990 	push	de
   767F 33            [ 6] 2991 	inc	sp
   7680 C5            [11] 2992 	push	bc
   7681 33            [ 6] 2993 	inc	sp
   7682 2A 70 65      [16] 2994 	ld	hl,(_mapa)
   7685 E5            [11] 2995 	push	hl
   7686 CD 71 4B      [17] 2996 	call	_getTilePtr
   7689 F1            [10] 2997 	pop	af
   768A F1            [10] 2998 	pop	af
   768B 4E            [ 7] 2999 	ld	c,(hl)
   768C 3E 02         [ 7] 3000 	ld	a,#0x02
   768E 91            [ 4] 3001 	sub	a, c
   768F 38 3D         [12] 3002 	jr	C,00163$
                           3003 ;src/main.c:524: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7691 DD 6E F6      [19] 3004 	ld	l,-10 (ix)
   7694 DD 66 F7      [19] 3005 	ld	h,-9 (ix)
   7697 7E            [ 7] 3006 	ld	a,(hl)
   7698 C6 18         [ 7] 3007 	add	a, #0x18
   769A 47            [ 4] 3008 	ld	b,a
   769B DD 6E F4      [19] 3009 	ld	l,-12 (ix)
   769E DD 66 F5      [19] 3010 	ld	h,-11 (ix)
   76A1 7E            [ 7] 3011 	ld	a,(hl)
   76A2 C6 04         [ 7] 3012 	add	a, #0x04
   76A4 C5            [11] 3013 	push	bc
   76A5 33            [ 6] 3014 	inc	sp
   76A6 F5            [11] 3015 	push	af
   76A7 33            [ 6] 3016 	inc	sp
   76A8 2A 70 65      [16] 3017 	ld	hl,(_mapa)
   76AB E5            [11] 3018 	push	hl
   76AC CD 71 4B      [17] 3019 	call	_getTilePtr
   76AF F1            [10] 3020 	pop	af
   76B0 F1            [10] 3021 	pop	af
   76B1 4E            [ 7] 3022 	ld	c,(hl)
   76B2 3E 02         [ 7] 3023 	ld	a,#0x02
   76B4 91            [ 4] 3024 	sub	a, c
   76B5 38 17         [12] 3025 	jr	C,00163$
                           3026 ;src/main.c:525: moverEnemigoAbajo(enemy);
   76B7 DD 6E F4      [19] 3027 	ld	l,-12 (ix)
   76BA DD 66 F5      [19] 3028 	ld	h,-11 (ix)
   76BD E5            [11] 3029 	push	hl
   76BE CD DE 6B      [17] 3030 	call	_moverEnemigoAbajo
   76C1 F1            [10] 3031 	pop	af
                           3032 ;src/main.c:526: movY = 1;
   76C2 DD 36 F2 01   [19] 3033 	ld	-14 (ix),#0x01
                           3034 ;src/main.c:527: enemy->mover = SI;
   76C6 DD 6E F8      [19] 3035 	ld	l,-8 (ix)
   76C9 DD 66 F9      [19] 3036 	ld	h,-7 (ix)
   76CC 36 01         [10] 3037 	ld	(hl),#0x01
   76CE                    3038 00163$:
                           3039 ;src/main.c:530: if (!enemy->mover) {
   76CE DD 6E F8      [19] 3040 	ld	l,-8 (ix)
   76D1 DD 66 F9      [19] 3041 	ld	h,-7 (ix)
   76D4 7E            [ 7] 3042 	ld	a,(hl)
   76D5 B7            [ 4] 3043 	or	a, a
   76D6 C2 31 79      [10] 3044 	jp	NZ,00208$
                           3045 ;src/main.c:531: if (!movX) {
   76D9 DD 7E F3      [19] 3046 	ld	a,-13 (ix)
   76DC B7            [ 4] 3047 	or	a, a
   76DD C2 06 78      [10] 3048 	jp	NZ,00178$
                           3049 ;src/main.c:532: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   76E0 DD 6E F6      [19] 3050 	ld	l,-10 (ix)
   76E3 DD 66 F7      [19] 3051 	ld	h,-9 (ix)
   76E6 5E            [ 7] 3052 	ld	e,(hl)
                           3053 ;src/main.c:426: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   76E7 DD 6E F4      [19] 3054 	ld	l,-12 (ix)
   76EA DD 66 F5      [19] 3055 	ld	h,-11 (ix)
   76ED 4E            [ 7] 3056 	ld	c,(hl)
                           3057 ;src/main.c:532: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   76EE 3E 70         [ 7] 3058 	ld	a,#0x70
   76F0 93            [ 4] 3059 	sub	a, e
   76F1 D2 81 77      [10] 3060 	jp	NC,00175$
                           3061 ;src/main.c:533: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   76F4 7B            [ 4] 3062 	ld	a,e
   76F5 C6 18         [ 7] 3063 	add	a, #0x18
   76F7 47            [ 4] 3064 	ld	b,a
   76F8 C5            [11] 3065 	push	bc
   76F9 2A 70 65      [16] 3066 	ld	hl,(_mapa)
   76FC E5            [11] 3067 	push	hl
   76FD CD 71 4B      [17] 3068 	call	_getTilePtr
   7700 F1            [10] 3069 	pop	af
   7701 F1            [10] 3070 	pop	af
   7702 4E            [ 7] 3071 	ld	c,(hl)
   7703 3E 02         [ 7] 3072 	ld	a,#0x02
   7705 91            [ 4] 3073 	sub	a, c
   7706 38 63         [12] 3074 	jr	C,00165$
                           3075 ;src/main.c:534: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7708 DD 6E F6      [19] 3076 	ld	l,-10 (ix)
   770B DD 66 F7      [19] 3077 	ld	h,-9 (ix)
   770E 7E            [ 7] 3078 	ld	a,(hl)
   770F C6 18         [ 7] 3079 	add	a, #0x18
   7711 57            [ 4] 3080 	ld	d,a
   7712 DD 6E F4      [19] 3081 	ld	l,-12 (ix)
   7715 DD 66 F5      [19] 3082 	ld	h,-11 (ix)
   7718 4E            [ 7] 3083 	ld	c,(hl)
   7719 41            [ 4] 3084 	ld	b,c
   771A 04            [ 4] 3085 	inc	b
   771B 04            [ 4] 3086 	inc	b
   771C D5            [11] 3087 	push	de
   771D 33            [ 6] 3088 	inc	sp
   771E C5            [11] 3089 	push	bc
   771F 33            [ 6] 3090 	inc	sp
   7720 2A 70 65      [16] 3091 	ld	hl,(_mapa)
   7723 E5            [11] 3092 	push	hl
   7724 CD 71 4B      [17] 3093 	call	_getTilePtr
   7727 F1            [10] 3094 	pop	af
   7728 F1            [10] 3095 	pop	af
   7729 4E            [ 7] 3096 	ld	c,(hl)
   772A 3E 02         [ 7] 3097 	ld	a,#0x02
   772C 91            [ 4] 3098 	sub	a, c
   772D 38 3C         [12] 3099 	jr	C,00165$
                           3100 ;src/main.c:535: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   772F DD 6E F6      [19] 3101 	ld	l,-10 (ix)
   7732 DD 66 F7      [19] 3102 	ld	h,-9 (ix)
   7735 7E            [ 7] 3103 	ld	a,(hl)
   7736 C6 18         [ 7] 3104 	add	a, #0x18
   7738 47            [ 4] 3105 	ld	b,a
   7739 DD 6E F4      [19] 3106 	ld	l,-12 (ix)
   773C DD 66 F5      [19] 3107 	ld	h,-11 (ix)
   773F 7E            [ 7] 3108 	ld	a,(hl)
   7740 C6 04         [ 7] 3109 	add	a, #0x04
   7742 C5            [11] 3110 	push	bc
   7743 33            [ 6] 3111 	inc	sp
   7744 F5            [11] 3112 	push	af
   7745 33            [ 6] 3113 	inc	sp
   7746 2A 70 65      [16] 3114 	ld	hl,(_mapa)
   7749 E5            [11] 3115 	push	hl
   774A CD 71 4B      [17] 3116 	call	_getTilePtr
   774D F1            [10] 3117 	pop	af
   774E F1            [10] 3118 	pop	af
   774F 4E            [ 7] 3119 	ld	c,(hl)
   7750 3E 02         [ 7] 3120 	ld	a,#0x02
   7752 91            [ 4] 3121 	sub	a, c
   7753 38 16         [12] 3122 	jr	C,00165$
                           3123 ;src/main.c:536: moverEnemigoAbajo(enemy);
   7755 DD 6E F4      [19] 3124 	ld	l,-12 (ix)
   7758 DD 66 F5      [19] 3125 	ld	h,-11 (ix)
   775B E5            [11] 3126 	push	hl
   775C CD DE 6B      [17] 3127 	call	_moverEnemigoAbajo
   775F F1            [10] 3128 	pop	af
                           3129 ;src/main.c:537: enemy->mover = SI;
   7760 DD 6E F8      [19] 3130 	ld	l,-8 (ix)
   7763 DD 66 F9      [19] 3131 	ld	h,-7 (ix)
   7766 36 01         [10] 3132 	ld	(hl),#0x01
   7768 C3 06 78      [10] 3133 	jp	00178$
   776B                    3134 00165$:
                           3135 ;src/main.c:539: moverEnemigoArriba(enemy);
   776B DD 6E F4      [19] 3136 	ld	l,-12 (ix)
   776E DD 66 F5      [19] 3137 	ld	h,-11 (ix)
   7771 E5            [11] 3138 	push	hl
   7772 CD BF 6B      [17] 3139 	call	_moverEnemigoArriba
   7775 F1            [10] 3140 	pop	af
                           3141 ;src/main.c:540: enemy->mover = SI;
   7776 DD 6E F8      [19] 3142 	ld	l,-8 (ix)
   7779 DD 66 F9      [19] 3143 	ld	h,-7 (ix)
   777C 36 01         [10] 3144 	ld	(hl),#0x01
   777E C3 06 78      [10] 3145 	jp	00178$
   7781                    3146 00175$:
                           3147 ;src/main.c:543: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7781 43            [ 4] 3148 	ld	b,e
   7782 05            [ 4] 3149 	dec	b
   7783 05            [ 4] 3150 	dec	b
   7784 C5            [11] 3151 	push	bc
   7785 2A 70 65      [16] 3152 	ld	hl,(_mapa)
   7788 E5            [11] 3153 	push	hl
   7789 CD 71 4B      [17] 3154 	call	_getTilePtr
   778C F1            [10] 3155 	pop	af
   778D F1            [10] 3156 	pop	af
   778E 4E            [ 7] 3157 	ld	c,(hl)
   778F 3E 02         [ 7] 3158 	ld	a,#0x02
   7791 91            [ 4] 3159 	sub	a, c
   7792 38 5F         [12] 3160 	jr	C,00170$
                           3161 ;src/main.c:544: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7794 DD 6E F6      [19] 3162 	ld	l,-10 (ix)
   7797 DD 66 F7      [19] 3163 	ld	h,-9 (ix)
   779A 56            [ 7] 3164 	ld	d,(hl)
   779B 15            [ 4] 3165 	dec	d
   779C 15            [ 4] 3166 	dec	d
   779D DD 6E F4      [19] 3167 	ld	l,-12 (ix)
   77A0 DD 66 F5      [19] 3168 	ld	h,-11 (ix)
   77A3 46            [ 7] 3169 	ld	b,(hl)
   77A4 04            [ 4] 3170 	inc	b
   77A5 04            [ 4] 3171 	inc	b
   77A6 D5            [11] 3172 	push	de
   77A7 33            [ 6] 3173 	inc	sp
   77A8 C5            [11] 3174 	push	bc
   77A9 33            [ 6] 3175 	inc	sp
   77AA 2A 70 65      [16] 3176 	ld	hl,(_mapa)
   77AD E5            [11] 3177 	push	hl
   77AE CD 71 4B      [17] 3178 	call	_getTilePtr
   77B1 F1            [10] 3179 	pop	af
   77B2 F1            [10] 3180 	pop	af
   77B3 4E            [ 7] 3181 	ld	c,(hl)
   77B4 3E 02         [ 7] 3182 	ld	a,#0x02
   77B6 91            [ 4] 3183 	sub	a, c
   77B7 38 3A         [12] 3184 	jr	C,00170$
                           3185 ;src/main.c:545: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   77B9 DD 6E F6      [19] 3186 	ld	l,-10 (ix)
   77BC DD 66 F7      [19] 3187 	ld	h,-9 (ix)
   77BF 46            [ 7] 3188 	ld	b,(hl)
   77C0 05            [ 4] 3189 	dec	b
   77C1 05            [ 4] 3190 	dec	b
   77C2 DD 6E F4      [19] 3191 	ld	l,-12 (ix)
   77C5 DD 66 F5      [19] 3192 	ld	h,-11 (ix)
   77C8 7E            [ 7] 3193 	ld	a,(hl)
   77C9 C6 04         [ 7] 3194 	add	a, #0x04
   77CB C5            [11] 3195 	push	bc
   77CC 33            [ 6] 3196 	inc	sp
   77CD F5            [11] 3197 	push	af
   77CE 33            [ 6] 3198 	inc	sp
   77CF 2A 70 65      [16] 3199 	ld	hl,(_mapa)
   77D2 E5            [11] 3200 	push	hl
   77D3 CD 71 4B      [17] 3201 	call	_getTilePtr
   77D6 F1            [10] 3202 	pop	af
   77D7 F1            [10] 3203 	pop	af
   77D8 4E            [ 7] 3204 	ld	c,(hl)
   77D9 3E 02         [ 7] 3205 	ld	a,#0x02
   77DB 91            [ 4] 3206 	sub	a, c
   77DC 38 15         [12] 3207 	jr	C,00170$
                           3208 ;src/main.c:546: moverEnemigoArriba(enemy);
   77DE DD 6E F4      [19] 3209 	ld	l,-12 (ix)
   77E1 DD 66 F5      [19] 3210 	ld	h,-11 (ix)
   77E4 E5            [11] 3211 	push	hl
   77E5 CD BF 6B      [17] 3212 	call	_moverEnemigoArriba
   77E8 F1            [10] 3213 	pop	af
                           3214 ;src/main.c:547: enemy->mover = SI;
   77E9 DD 6E F8      [19] 3215 	ld	l,-8 (ix)
   77EC DD 66 F9      [19] 3216 	ld	h,-7 (ix)
   77EF 36 01         [10] 3217 	ld	(hl),#0x01
   77F1 18 13         [12] 3218 	jr	00178$
   77F3                    3219 00170$:
                           3220 ;src/main.c:549: moverEnemigoAbajo(enemy);
   77F3 DD 6E F4      [19] 3221 	ld	l,-12 (ix)
   77F6 DD 66 F5      [19] 3222 	ld	h,-11 (ix)
   77F9 E5            [11] 3223 	push	hl
   77FA CD DE 6B      [17] 3224 	call	_moverEnemigoAbajo
   77FD F1            [10] 3225 	pop	af
                           3226 ;src/main.c:550: enemy->mover = SI;
   77FE DD 6E F8      [19] 3227 	ld	l,-8 (ix)
   7801 DD 66 F9      [19] 3228 	ld	h,-7 (ix)
   7804 36 01         [10] 3229 	ld	(hl),#0x01
   7806                    3230 00178$:
                           3231 ;src/main.c:555: if (!movY) {
   7806 DD 7E F2      [19] 3232 	ld	a,-14 (ix)
   7809 B7            [ 4] 3233 	or	a, a
   780A C2 31 79      [10] 3234 	jp	NZ,00208$
                           3235 ;src/main.c:556: if (enemy->x < ANCHO_PANTALLA/2) {
   780D DD 6E F4      [19] 3236 	ld	l,-12 (ix)
   7810 DD 66 F5      [19] 3237 	ld	h,-11 (ix)
   7813 4E            [ 7] 3238 	ld	c,(hl)
                           3239 ;src/main.c:427: u8 dify = abs(enemy->y - prota.y);
   7814 DD 6E F6      [19] 3240 	ld	l,-10 (ix)
   7817 DD 66 F7      [19] 3241 	ld	h,-9 (ix)
   781A 56            [ 7] 3242 	ld	d,(hl)
                           3243 ;src/main.c:556: if (enemy->x < ANCHO_PANTALLA/2) {
   781B 79            [ 4] 3244 	ld	a,c
   781C D6 28         [ 7] 3245 	sub	a, #0x28
   781E D2 A7 78      [10] 3246 	jp	NC,00190$
                           3247 ;src/main.c:557: if(*getTilePtr(mapa, enemy->x, enemy->y) <= 2
   7821 D5            [11] 3248 	push	de
   7822 33            [ 6] 3249 	inc	sp
   7823 79            [ 4] 3250 	ld	a,c
   7824 F5            [11] 3251 	push	af
   7825 33            [ 6] 3252 	inc	sp
   7826 2A 70 65      [16] 3253 	ld	hl,(_mapa)
   7829 E5            [11] 3254 	push	hl
   782A CD 71 4B      [17] 3255 	call	_getTilePtr
   782D F1            [10] 3256 	pop	af
   782E F1            [10] 3257 	pop	af
   782F 4E            [ 7] 3258 	ld	c,(hl)
   7830 3E 02         [ 7] 3259 	ld	a,#0x02
   7832 91            [ 4] 3260 	sub	a, c
   7833 38 5C         [12] 3261 	jr	C,00180$
                           3262 ;src/main.c:558: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H/2) <= 2
   7835 DD 6E F6      [19] 3263 	ld	l,-10 (ix)
   7838 DD 66 F7      [19] 3264 	ld	h,-9 (ix)
   783B 7E            [ 7] 3265 	ld	a,(hl)
   783C C6 0B         [ 7] 3266 	add	a, #0x0B
   783E DD 6E F4      [19] 3267 	ld	l,-12 (ix)
   7841 DD 66 F5      [19] 3268 	ld	h,-11 (ix)
   7844 46            [ 7] 3269 	ld	b,(hl)
   7845 F5            [11] 3270 	push	af
   7846 33            [ 6] 3271 	inc	sp
   7847 C5            [11] 3272 	push	bc
   7848 33            [ 6] 3273 	inc	sp
   7849 2A 70 65      [16] 3274 	ld	hl,(_mapa)
   784C E5            [11] 3275 	push	hl
   784D CD 71 4B      [17] 3276 	call	_getTilePtr
   7850 F1            [10] 3277 	pop	af
   7851 F1            [10] 3278 	pop	af
   7852 4E            [ 7] 3279 	ld	c,(hl)
   7853 3E 02         [ 7] 3280 	ld	a,#0x02
   7855 91            [ 4] 3281 	sub	a, c
   7856 38 39         [12] 3282 	jr	C,00180$
                           3283 ;src/main.c:559: && *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H) <= 2) {
   7858 DD 6E F6      [19] 3284 	ld	l,-10 (ix)
   785B DD 66 F7      [19] 3285 	ld	h,-9 (ix)
   785E 7E            [ 7] 3286 	ld	a,(hl)
   785F C6 16         [ 7] 3287 	add	a, #0x16
   7861 DD 6E F4      [19] 3288 	ld	l,-12 (ix)
   7864 DD 66 F5      [19] 3289 	ld	h,-11 (ix)
   7867 46            [ 7] 3290 	ld	b,(hl)
   7868 F5            [11] 3291 	push	af
   7869 33            [ 6] 3292 	inc	sp
   786A C5            [11] 3293 	push	bc
   786B 33            [ 6] 3294 	inc	sp
   786C 2A 70 65      [16] 3295 	ld	hl,(_mapa)
   786F E5            [11] 3296 	push	hl
   7870 CD 71 4B      [17] 3297 	call	_getTilePtr
   7873 F1            [10] 3298 	pop	af
   7874 F1            [10] 3299 	pop	af
   7875 4E            [ 7] 3300 	ld	c,(hl)
   7876 3E 02         [ 7] 3301 	ld	a,#0x02
   7878 91            [ 4] 3302 	sub	a, c
   7879 38 16         [12] 3303 	jr	C,00180$
                           3304 ;src/main.c:560: moverEnemigoIzquierda(enemy);
   787B DD 6E F4      [19] 3305 	ld	l,-12 (ix)
   787E DD 66 F5      [19] 3306 	ld	h,-11 (ix)
   7881 E5            [11] 3307 	push	hl
   7882 CD 0D 6C      [17] 3308 	call	_moverEnemigoIzquierda
   7885 F1            [10] 3309 	pop	af
                           3310 ;src/main.c:561: enemy->mover = SI;
   7886 DD 6E F8      [19] 3311 	ld	l,-8 (ix)
   7889 DD 66 F9      [19] 3312 	ld	h,-7 (ix)
   788C 36 01         [10] 3313 	ld	(hl),#0x01
   788E C3 31 79      [10] 3314 	jp	00208$
   7891                    3315 00180$:
                           3316 ;src/main.c:563: moverEnemigoDerecha(enemy);
   7891 DD 6E F4      [19] 3317 	ld	l,-12 (ix)
   7894 DD 66 F5      [19] 3318 	ld	h,-11 (ix)
   7897 E5            [11] 3319 	push	hl
   7898 CD FD 6B      [17] 3320 	call	_moverEnemigoDerecha
   789B F1            [10] 3321 	pop	af
                           3322 ;src/main.c:564: enemy->mover = SI;
   789C DD 6E F8      [19] 3323 	ld	l,-8 (ix)
   789F DD 66 F9      [19] 3324 	ld	h,-7 (ix)
   78A2 36 01         [10] 3325 	ld	(hl),#0x01
   78A4 C3 31 79      [10] 3326 	jp	00208$
   78A7                    3327 00190$:
                           3328 ;src/main.c:567: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y) <= 2
   78A7 79            [ 4] 3329 	ld	a,c
   78A8 C6 04         [ 7] 3330 	add	a, #0x04
   78AA D5            [11] 3331 	push	de
   78AB 33            [ 6] 3332 	inc	sp
   78AC F5            [11] 3333 	push	af
   78AD 33            [ 6] 3334 	inc	sp
   78AE 2A 70 65      [16] 3335 	ld	hl,(_mapa)
   78B1 E5            [11] 3336 	push	hl
   78B2 CD 71 4B      [17] 3337 	call	_getTilePtr
   78B5 F1            [10] 3338 	pop	af
   78B6 F1            [10] 3339 	pop	af
   78B7 4E            [ 7] 3340 	ld	c,(hl)
   78B8 3E 02         [ 7] 3341 	ld	a,#0x02
   78BA 91            [ 4] 3342 	sub	a, c
   78BB 38 61         [12] 3343 	jr	C,00185$
                           3344 ;src/main.c:568: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H/2) <= 2
   78BD DD 6E F6      [19] 3345 	ld	l,-10 (ix)
   78C0 DD 66 F7      [19] 3346 	ld	h,-9 (ix)
   78C3 7E            [ 7] 3347 	ld	a,(hl)
   78C4 C6 0B         [ 7] 3348 	add	a, #0x0B
   78C6 47            [ 4] 3349 	ld	b,a
   78C7 DD 6E F4      [19] 3350 	ld	l,-12 (ix)
   78CA DD 66 F5      [19] 3351 	ld	h,-11 (ix)
   78CD 7E            [ 7] 3352 	ld	a,(hl)
   78CE C6 04         [ 7] 3353 	add	a, #0x04
   78D0 C5            [11] 3354 	push	bc
   78D1 33            [ 6] 3355 	inc	sp
   78D2 F5            [11] 3356 	push	af
   78D3 33            [ 6] 3357 	inc	sp
   78D4 2A 70 65      [16] 3358 	ld	hl,(_mapa)
   78D7 E5            [11] 3359 	push	hl
   78D8 CD 71 4B      [17] 3360 	call	_getTilePtr
   78DB F1            [10] 3361 	pop	af
   78DC F1            [10] 3362 	pop	af
   78DD 4E            [ 7] 3363 	ld	c,(hl)
   78DE 3E 02         [ 7] 3364 	ld	a,#0x02
   78E0 91            [ 4] 3365 	sub	a, c
   78E1 38 3B         [12] 3366 	jr	C,00185$
                           3367 ;src/main.c:569: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H) <= 2) {
   78E3 DD 6E F6      [19] 3368 	ld	l,-10 (ix)
   78E6 DD 66 F7      [19] 3369 	ld	h,-9 (ix)
   78E9 7E            [ 7] 3370 	ld	a,(hl)
   78EA C6 16         [ 7] 3371 	add	a, #0x16
   78EC 47            [ 4] 3372 	ld	b,a
   78ED DD 6E F4      [19] 3373 	ld	l,-12 (ix)
   78F0 DD 66 F5      [19] 3374 	ld	h,-11 (ix)
   78F3 7E            [ 7] 3375 	ld	a,(hl)
   78F4 C6 04         [ 7] 3376 	add	a, #0x04
   78F6 C5            [11] 3377 	push	bc
   78F7 33            [ 6] 3378 	inc	sp
   78F8 F5            [11] 3379 	push	af
   78F9 33            [ 6] 3380 	inc	sp
   78FA 2A 70 65      [16] 3381 	ld	hl,(_mapa)
   78FD E5            [11] 3382 	push	hl
   78FE CD 71 4B      [17] 3383 	call	_getTilePtr
   7901 F1            [10] 3384 	pop	af
   7902 F1            [10] 3385 	pop	af
   7903 4E            [ 7] 3386 	ld	c,(hl)
   7904 3E 02         [ 7] 3387 	ld	a,#0x02
   7906 91            [ 4] 3388 	sub	a, c
   7907 38 15         [12] 3389 	jr	C,00185$
                           3390 ;src/main.c:570: moverEnemigoDerecha(enemy);
   7909 DD 6E F4      [19] 3391 	ld	l,-12 (ix)
   790C DD 66 F5      [19] 3392 	ld	h,-11 (ix)
   790F E5            [11] 3393 	push	hl
   7910 CD FD 6B      [17] 3394 	call	_moverEnemigoDerecha
   7913 F1            [10] 3395 	pop	af
                           3396 ;src/main.c:571: enemy->mover = SI;
   7914 DD 6E F8      [19] 3397 	ld	l,-8 (ix)
   7917 DD 66 F9      [19] 3398 	ld	h,-7 (ix)
   791A 36 01         [10] 3399 	ld	(hl),#0x01
   791C 18 13         [12] 3400 	jr	00208$
   791E                    3401 00185$:
                           3402 ;src/main.c:574: moverEnemigoIzquierda(enemy);
   791E DD 6E F4      [19] 3403 	ld	l,-12 (ix)
   7921 DD 66 F5      [19] 3404 	ld	h,-11 (ix)
   7924 E5            [11] 3405 	push	hl
   7925 CD 0D 6C      [17] 3406 	call	_moverEnemigoIzquierda
   7928 F1            [10] 3407 	pop	af
                           3408 ;src/main.c:575: enemy->mover = SI;
   7929 DD 6E F8      [19] 3409 	ld	l,-8 (ix)
   792C DD 66 F9      [19] 3410 	ld	h,-7 (ix)
   792F 36 01         [10] 3411 	ld	(hl),#0x01
   7931                    3412 00208$:
   7931 DD F9         [10] 3413 	ld	sp, ix
   7933 DD E1         [14] 3414 	pop	ix
   7935 C9            [10] 3415 	ret
                           3416 ;src/main.c:585: void updateEnemy(TEnemy* actual) { // maquina de estados
                           3417 ;	---------------------------------
                           3418 ; Function updateEnemy
                           3419 ; ---------------------------------
   7936                    3420 _updateEnemy::
   7936 DD E5         [15] 3421 	push	ix
   7938 DD 21 00 00   [14] 3422 	ld	ix,#0
   793C DD 39         [15] 3423 	add	ix,sp
   793E 21 F4 FF      [10] 3424 	ld	hl,#-12
   7941 39            [11] 3425 	add	hl,sp
   7942 F9            [ 6] 3426 	ld	sp,hl
                           3427 ;src/main.c:592: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   7943 DD 4E 04      [19] 3428 	ld	c,4 (ix)
   7946 DD 46 05      [19] 3429 	ld	b,5 (ix)
   7949 21 15 00      [10] 3430 	ld	hl,#0x0015
   794C 09            [11] 3431 	add	hl,bc
   794D DD 75 FB      [19] 3432 	ld	-5 (ix),l
   7950 DD 74 FC      [19] 3433 	ld	-4 (ix),h
   7953 DD 6E FB      [19] 3434 	ld	l,-5 (ix)
   7956 DD 66 FC      [19] 3435 	ld	h,-4 (ix)
   7959 7E            [ 7] 3436 	ld	a,(hl)
   795A B7            [ 4] 3437 	or	a, a
   795B 28 19         [12] 3438 	jr	Z,00115$
                           3439 ;src/main.c:593: enemy->patrolling = 0;
   795D 21 0C 61      [10] 3440 	ld	hl,#(_enemy + 0x000a)
   7960 36 00         [10] 3441 	ld	(hl),#0x00
                           3442 ;src/main.c:594: engage(actual, prota.x, prota.y);
   7962 3A 8F 64      [13] 3443 	ld	a, (#_prota + 1)
   7965 21 8E 64      [10] 3444 	ld	hl, #_prota + 0
   7968 56            [ 7] 3445 	ld	d,(hl)
   7969 F5            [11] 3446 	push	af
   796A 33            [ 6] 3447 	inc	sp
   796B D5            [11] 3448 	push	de
   796C 33            [ 6] 3449 	inc	sp
   796D C5            [11] 3450 	push	bc
   796E CD 23 71      [17] 3451 	call	_engage
   7971 F1            [10] 3452 	pop	af
   7972 F1            [10] 3453 	pop	af
   7973 C3 8D 7A      [10] 3454 	jp	00117$
   7976                    3455 00115$:
                           3456 ;src/main.c:596: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   7976 C5            [11] 3457 	push	bc
   7977 C5            [11] 3458 	push	bc
   7978 CD 68 6E      [17] 3459 	call	_lookFor
   797B F1            [10] 3460 	pop	af
   797C C1            [10] 3461 	pop	bc
                           3462 ;src/main.c:602: actual->patrolling = 0;
   797D 21 0A 00      [10] 3463 	ld	hl,#0x000A
   7980 09            [11] 3464 	add	hl,bc
   7981 E3            [19] 3465 	ex	(sp), hl
                           3466 ;src/main.c:597: if (actual->patrolling) {
   7982 E1            [10] 3467 	pop	hl
   7983 E5            [11] 3468 	push	hl
   7984 6E            [ 7] 3469 	ld	l,(hl)
                           3470 ;src/main.c:600: if (actual->in_range) {
   7985 79            [ 4] 3471 	ld	a,c
   7986 C6 10         [ 7] 3472 	add	a, #0x10
   7988 5F            [ 4] 3473 	ld	e,a
   7989 78            [ 4] 3474 	ld	a,b
   798A CE 00         [ 7] 3475 	adc	a, #0x00
   798C 57            [ 4] 3476 	ld	d,a
                           3477 ;src/main.c:608: actual->seek = 1;
   798D 79            [ 4] 3478 	ld	a,c
   798E C6 13         [ 7] 3479 	add	a, #0x13
   7990 DD 77 FD      [19] 3480 	ld	-3 (ix),a
   7993 78            [ 4] 3481 	ld	a,b
   7994 CE 00         [ 7] 3482 	adc	a, #0x00
   7996 DD 77 FE      [19] 3483 	ld	-2 (ix),a
                           3484 ;src/main.c:597: if (actual->patrolling) {
   7999 7D            [ 4] 3485 	ld	a,l
   799A B7            [ 4] 3486 	or	a, a
   799B CA 55 7A      [10] 3487 	jp	Z,00112$
                           3488 ;src/main.c:599: moverEnemigoPatrol(actual);
   799E C5            [11] 3489 	push	bc
   799F D5            [11] 3490 	push	de
   79A0 C5            [11] 3491 	push	bc
   79A1 CD 1F 6C      [17] 3492 	call	_moverEnemigoPatrol
   79A4 F1            [10] 3493 	pop	af
   79A5 D1            [10] 3494 	pop	de
   79A6 C1            [10] 3495 	pop	bc
                           3496 ;src/main.c:600: if (actual->in_range) {
   79A7 1A            [ 7] 3497 	ld	a,(de)
   79A8 B7            [ 4] 3498 	or	a, a
   79A9 28 20         [12] 3499 	jr	Z,00104$
                           3500 ;src/main.c:601: engage(actual, prota.x, prota.y);
   79AB 3A 8F 64      [13] 3501 	ld	a, (#_prota + 1)
   79AE 21 8E 64      [10] 3502 	ld	hl, #_prota + 0
   79B1 56            [ 7] 3503 	ld	d,(hl)
   79B2 F5            [11] 3504 	push	af
   79B3 33            [ 6] 3505 	inc	sp
   79B4 D5            [11] 3506 	push	de
   79B5 33            [ 6] 3507 	inc	sp
   79B6 C5            [11] 3508 	push	bc
   79B7 CD 23 71      [17] 3509 	call	_engage
   79BA F1            [10] 3510 	pop	af
   79BB F1            [10] 3511 	pop	af
                           3512 ;src/main.c:602: actual->patrolling = 0;
   79BC E1            [10] 3513 	pop	hl
   79BD E5            [11] 3514 	push	hl
   79BE 36 00         [10] 3515 	ld	(hl),#0x00
                           3516 ;src/main.c:603: actual->engage = 1;
   79C0 DD 6E FB      [19] 3517 	ld	l,-5 (ix)
   79C3 DD 66 FC      [19] 3518 	ld	h,-4 (ix)
   79C6 36 01         [10] 3519 	ld	(hl),#0x01
   79C8 C3 8D 7A      [10] 3520 	jp	00117$
   79CB                    3521 00104$:
                           3522 ;src/main.c:604: } else if (actual->seen) {
   79CB 21 11 00      [10] 3523 	ld	hl,#0x0011
   79CE 09            [11] 3524 	add	hl,bc
   79CF DD 75 F6      [19] 3525 	ld	-10 (ix),l
   79D2 DD 74 F7      [19] 3526 	ld	-9 (ix),h
   79D5 DD 6E F6      [19] 3527 	ld	l,-10 (ix)
   79D8 DD 66 F7      [19] 3528 	ld	h,-9 (ix)
   79DB 7E            [ 7] 3529 	ld	a,(hl)
   79DC B7            [ 4] 3530 	or	a, a
   79DD CA 8D 7A      [10] 3531 	jp	Z,00117$
                           3532 ;src/main.c:605: pathFinding(actual->x, actual->y, prota.x , prota.y, actual, mapa);
   79E0 3A 8F 64      [13] 3533 	ld	a,(#_prota + 1)
   79E3 DD 77 F8      [19] 3534 	ld	-8 (ix),a
   79E6 21 8E 64      [10] 3535 	ld	hl, #_prota + 0
   79E9 5E            [ 7] 3536 	ld	e,(hl)
   79EA 21 01 00      [10] 3537 	ld	hl,#0x0001
   79ED 09            [11] 3538 	add	hl,bc
   79EE DD 75 F9      [19] 3539 	ld	-7 (ix),l
   79F1 DD 74 FA      [19] 3540 	ld	-6 (ix),h
   79F4 DD 6E F9      [19] 3541 	ld	l,-7 (ix)
   79F7 DD 66 FA      [19] 3542 	ld	h,-6 (ix)
   79FA 56            [ 7] 3543 	ld	d,(hl)
   79FB 0A            [ 7] 3544 	ld	a,(bc)
   79FC DD 77 FF      [19] 3545 	ld	-1 (ix),a
   79FF C5            [11] 3546 	push	bc
   7A00 2A 70 65      [16] 3547 	ld	hl,(_mapa)
   7A03 E5            [11] 3548 	push	hl
   7A04 C5            [11] 3549 	push	bc
   7A05 DD 7E F8      [19] 3550 	ld	a,-8 (ix)
   7A08 F5            [11] 3551 	push	af
   7A09 33            [ 6] 3552 	inc	sp
   7A0A 7B            [ 4] 3553 	ld	a,e
   7A0B F5            [11] 3554 	push	af
   7A0C 33            [ 6] 3555 	inc	sp
   7A0D D5            [11] 3556 	push	de
   7A0E 33            [ 6] 3557 	inc	sp
   7A0F DD 7E FF      [19] 3558 	ld	a,-1 (ix)
   7A12 F5            [11] 3559 	push	af
   7A13 33            [ 6] 3560 	inc	sp
   7A14 CD 72 49      [17] 3561 	call	_pathFinding
   7A17 21 08 00      [10] 3562 	ld	hl,#8
   7A1A 39            [11] 3563 	add	hl,sp
   7A1B F9            [ 6] 3564 	ld	sp,hl
   7A1C C1            [10] 3565 	pop	bc
                           3566 ;src/main.c:606: actual->p_seek_x = actual->x;
   7A1D 21 17 00      [10] 3567 	ld	hl,#0x0017
   7A20 09            [11] 3568 	add	hl,bc
   7A21 EB            [ 4] 3569 	ex	de,hl
   7A22 0A            [ 7] 3570 	ld	a,(bc)
   7A23 12            [ 7] 3571 	ld	(de),a
                           3572 ;src/main.c:607: actual->p_seek_y = actual->y;
   7A24 21 18 00      [10] 3573 	ld	hl,#0x0018
   7A27 09            [11] 3574 	add	hl,bc
   7A28 EB            [ 4] 3575 	ex	de,hl
   7A29 DD 6E F9      [19] 3576 	ld	l,-7 (ix)
   7A2C DD 66 FA      [19] 3577 	ld	h,-6 (ix)
   7A2F 7E            [ 7] 3578 	ld	a,(hl)
   7A30 12            [ 7] 3579 	ld	(de),a
                           3580 ;src/main.c:608: actual->seek = 1;
   7A31 DD 6E FD      [19] 3581 	ld	l,-3 (ix)
   7A34 DD 66 FE      [19] 3582 	ld	h,-2 (ix)
   7A37 36 01         [10] 3583 	ld	(hl),#0x01
                           3584 ;src/main.c:609: actual->iter=0;
   7A39 21 0D 00      [10] 3585 	ld	hl,#0x000D
   7A3C 09            [11] 3586 	add	hl,bc
   7A3D AF            [ 4] 3587 	xor	a, a
   7A3E 77            [ 7] 3588 	ld	(hl), a
   7A3F 23            [ 6] 3589 	inc	hl
   7A40 77            [ 7] 3590 	ld	(hl), a
                           3591 ;src/main.c:610: actual->reversePatrol = NO;
   7A41 21 0B 00      [10] 3592 	ld	hl,#0x000B
   7A44 09            [11] 3593 	add	hl,bc
   7A45 36 00         [10] 3594 	ld	(hl),#0x00
                           3595 ;src/main.c:611: actual->patrolling = 0;
   7A47 E1            [10] 3596 	pop	hl
   7A48 E5            [11] 3597 	push	hl
   7A49 36 00         [10] 3598 	ld	(hl),#0x00
                           3599 ;src/main.c:612: actual->seen = 0;
   7A4B DD 6E F6      [19] 3600 	ld	l,-10 (ix)
   7A4E DD 66 F7      [19] 3601 	ld	h,-9 (ix)
   7A51 36 00         [10] 3602 	ld	(hl),#0x00
   7A53 18 38         [12] 3603 	jr	00117$
   7A55                    3604 00112$:
                           3605 ;src/main.c:614: } else if (actual->seek) {
   7A55 DD 6E FD      [19] 3606 	ld	l,-3 (ix)
   7A58 DD 66 FE      [19] 3607 	ld	h,-2 (ix)
   7A5B 7E            [ 7] 3608 	ld	a,(hl)
   7A5C B7            [ 4] 3609 	or	a, a
   7A5D 28 2E         [12] 3610 	jr	Z,00117$
                           3611 ;src/main.c:615: moverEnemigoSeek(actual);
   7A5F C5            [11] 3612 	push	bc
   7A60 D5            [11] 3613 	push	de
   7A61 C5            [11] 3614 	push	bc
   7A62 CD 71 6F      [17] 3615 	call	_moverEnemigoSeek
   7A65 F1            [10] 3616 	pop	af
   7A66 D1            [10] 3617 	pop	de
   7A67 C1            [10] 3618 	pop	bc
                           3619 ;src/main.c:616: if (actual->in_range) {
   7A68 1A            [ 7] 3620 	ld	a,(de)
   7A69 B7            [ 4] 3621 	or	a, a
   7A6A 28 21         [12] 3622 	jr	Z,00117$
                           3623 ;src/main.c:617: engage(actual, prota.x, prota.y);
   7A6C 3A 8F 64      [13] 3624 	ld	a, (#_prota + 1)
   7A6F 21 8E 64      [10] 3625 	ld	hl, #_prota + 0
   7A72 56            [ 7] 3626 	ld	d,(hl)
   7A73 F5            [11] 3627 	push	af
   7A74 33            [ 6] 3628 	inc	sp
   7A75 D5            [11] 3629 	push	de
   7A76 33            [ 6] 3630 	inc	sp
   7A77 C5            [11] 3631 	push	bc
   7A78 CD 23 71      [17] 3632 	call	_engage
   7A7B F1            [10] 3633 	pop	af
   7A7C F1            [10] 3634 	pop	af
                           3635 ;src/main.c:618: actual->seek = 0;
   7A7D DD 6E FD      [19] 3636 	ld	l,-3 (ix)
   7A80 DD 66 FE      [19] 3637 	ld	h,-2 (ix)
   7A83 36 00         [10] 3638 	ld	(hl),#0x00
                           3639 ;src/main.c:619: actual->engage = 1;
   7A85 DD 6E FB      [19] 3640 	ld	l,-5 (ix)
   7A88 DD 66 FC      [19] 3641 	ld	h,-4 (ix)
   7A8B 36 01         [10] 3642 	ld	(hl),#0x01
                           3643 ;src/main.c:620: } else if (actual->seen) {
   7A8D                    3644 00117$:
   7A8D DD F9         [10] 3645 	ld	sp, ix
   7A8F DD E1         [14] 3646 	pop	ix
   7A91 C9            [10] 3647 	ret
                           3648 ;src/main.c:627: void inicializarEnemy() {
                           3649 ;	---------------------------------
                           3650 ; Function inicializarEnemy
                           3651 ; ---------------------------------
   7A92                    3652 _inicializarEnemy::
   7A92 DD E5         [15] 3653 	push	ix
   7A94 DD 21 00 00   [14] 3654 	ld	ix,#0
   7A98 DD 39         [15] 3655 	add	ix,sp
   7A9A 21 F9 FF      [10] 3656 	ld	hl,#-7
   7A9D 39            [11] 3657 	add	hl,sp
   7A9E F9            [ 6] 3658 	ld	sp,hl
                           3659 ;src/main.c:628: u8 i = 2 + num_mapa; //sacar distinto numero dependiendo del mapa
   7A9F 3A 72 65      [13] 3660 	ld	a,(#_num_mapa + 0)
   7AA2 C6 02         [ 7] 3661 	add	a, #0x02
   7AA4 DD 77 FF      [19] 3662 	ld	-1 (ix),a
                           3663 ;src/main.c:638: actual = enemy;
   7AA7 11 02 61      [10] 3664 	ld	de,#_enemy+0
                           3665 ;src/main.c:639: while(i){
   7AAA                    3666 00101$:
   7AAA DD 7E FF      [19] 3667 	ld	a,-1 (ix)
   7AAD B7            [ 4] 3668 	or	a, a
   7AAE CA B2 7B      [10] 3669 	jp	Z,00104$
                           3670 ;src/main.c:640: --i;
   7AB1 DD 35 FF      [23] 3671 	dec	-1 (ix)
                           3672 ;src/main.c:641: actual->x = actual->px = spawnX[i];
   7AB4 4B            [ 4] 3673 	ld	c, e
   7AB5 42            [ 4] 3674 	ld	b, d
   7AB6 03            [ 6] 3675 	inc	bc
   7AB7 03            [ 6] 3676 	inc	bc
   7AB8 3E 94         [ 7] 3677 	ld	a,#<(_spawnX)
   7ABA DD 86 FF      [19] 3678 	add	a, -1 (ix)
   7ABD DD 77 FD      [19] 3679 	ld	-3 (ix),a
   7AC0 3E 65         [ 7] 3680 	ld	a,#>(_spawnX)
   7AC2 CE 00         [ 7] 3681 	adc	a, #0x00
   7AC4 DD 77 FE      [19] 3682 	ld	-2 (ix),a
   7AC7 DD 6E FD      [19] 3683 	ld	l,-3 (ix)
   7ACA DD 66 FE      [19] 3684 	ld	h,-2 (ix)
   7ACD 7E            [ 7] 3685 	ld	a,(hl)
   7ACE 02            [ 7] 3686 	ld	(bc),a
   7ACF 12            [ 7] 3687 	ld	(de),a
                           3688 ;src/main.c:642: actual->y = actual->py = spawnY[i];
   7AD0 D5            [11] 3689 	push	de
   7AD1 FD E1         [14] 3690 	pop	iy
   7AD3 FD 23         [10] 3691 	inc	iy
   7AD5 4B            [ 4] 3692 	ld	c, e
   7AD6 42            [ 4] 3693 	ld	b, d
   7AD7 03            [ 6] 3694 	inc	bc
   7AD8 03            [ 6] 3695 	inc	bc
   7AD9 03            [ 6] 3696 	inc	bc
   7ADA 3E 98         [ 7] 3697 	ld	a,#<(_spawnY)
   7ADC DD 86 FF      [19] 3698 	add	a, -1 (ix)
   7ADF DD 77 FB      [19] 3699 	ld	-5 (ix),a
   7AE2 3E 65         [ 7] 3700 	ld	a,#>(_spawnY)
   7AE4 CE 00         [ 7] 3701 	adc	a, #0x00
   7AE6 DD 77 FC      [19] 3702 	ld	-4 (ix),a
   7AE9 DD 6E FB      [19] 3703 	ld	l,-5 (ix)
   7AEC DD 66 FC      [19] 3704 	ld	h,-4 (ix)
   7AEF 7E            [ 7] 3705 	ld	a,(hl)
   7AF0 02            [ 7] 3706 	ld	(bc),a
   7AF1 FD 77 00      [19] 3707 	ld	0 (iy), a
                           3708 ;src/main.c:643: actual->mover  = NO;
   7AF4 21 06 00      [10] 3709 	ld	hl,#0x0006
   7AF7 19            [11] 3710 	add	hl,de
   7AF8 36 00         [10] 3711 	ld	(hl),#0x00
                           3712 ;src/main.c:644: actual->mira   = M_abajo;
   7AFA 21 07 00      [10] 3713 	ld	hl,#0x0007
   7AFD 19            [11] 3714 	add	hl,de
   7AFE 36 03         [10] 3715 	ld	(hl),#0x03
                           3716 ;src/main.c:645: actual->sprite = g_enemy;
   7B00 21 04 00      [10] 3717 	ld	hl,#0x0004
   7B03 19            [11] 3718 	add	hl,de
   7B04 36 3A         [10] 3719 	ld	(hl),#<(_g_enemy)
   7B06 23            [ 6] 3720 	inc	hl
   7B07 36 3C         [10] 3721 	ld	(hl),#>(_g_enemy)
                           3722 ;src/main.c:646: actual->muerto = NO;
   7B09 21 08 00      [10] 3723 	ld	hl,#0x0008
   7B0C 19            [11] 3724 	add	hl,de
   7B0D 36 00         [10] 3725 	ld	(hl),#0x00
                           3726 ;src/main.c:647: actual->muertes = 0;
   7B0F 21 09 00      [10] 3727 	ld	hl,#0x0009
   7B12 19            [11] 3728 	add	hl,de
   7B13 36 00         [10] 3729 	ld	(hl),#0x00
                           3730 ;src/main.c:648: actual->patrolling = SI;
   7B15 21 0A 00      [10] 3731 	ld	hl,#0x000A
   7B18 19            [11] 3732 	add	hl,de
   7B19 36 01         [10] 3733 	ld	(hl),#0x01
                           3734 ;src/main.c:649: actual->reversePatrol = NO;
   7B1B 21 0B 00      [10] 3735 	ld	hl,#0x000B
   7B1E 19            [11] 3736 	add	hl,de
   7B1F 36 00         [10] 3737 	ld	(hl),#0x00
                           3738 ;src/main.c:650: actual->didDamage = 0;
   7B21 21 16 00      [10] 3739 	ld	hl,#0x0016
   7B24 19            [11] 3740 	add	hl,de
   7B25 36 00         [10] 3741 	ld	(hl),#0x00
                           3742 ;src/main.c:651: actual->iter = 0;
   7B27 21 0D 00      [10] 3743 	ld	hl,#0x000D
   7B2A 19            [11] 3744 	add	hl,de
   7B2B AF            [ 4] 3745 	xor	a, a
   7B2C 77            [ 7] 3746 	ld	(hl), a
   7B2D 23            [ 6] 3747 	inc	hl
   7B2E 77            [ 7] 3748 	ld	(hl), a
                           3749 ;src/main.c:652: actual->lastIter = 0;
   7B2F 21 0F 00      [10] 3750 	ld	hl,#0x000F
   7B32 19            [11] 3751 	add	hl,de
   7B33 36 00         [10] 3752 	ld	(hl),#0x00
                           3753 ;src/main.c:653: actual->seen = 0;
   7B35 21 11 00      [10] 3754 	ld	hl,#0x0011
   7B38 19            [11] 3755 	add	hl,de
   7B39 36 00         [10] 3756 	ld	(hl),#0x00
                           3757 ;src/main.c:654: actual->found = 0;
   7B3B 21 12 00      [10] 3758 	ld	hl,#0x0012
   7B3E 19            [11] 3759 	add	hl,de
   7B3F 36 00         [10] 3760 	ld	(hl),#0x00
                           3761 ;src/main.c:655: actual->engage = 0;
   7B41 21 15 00      [10] 3762 	ld	hl,#0x0015
   7B44 19            [11] 3763 	add	hl,de
   7B45 36 00         [10] 3764 	ld	(hl),#0x00
                           3765 ;src/main.c:656: actual->xplot = NO;
   7B47 21 19 00      [10] 3766 	ld	hl,#0x0019
   7B4A 19            [11] 3767 	add	hl,de
   7B4B 36 00         [10] 3768 	ld	(hl),#0x00
                           3769 ;src/main.c:657: pathFinding( spawnX[i],  spawnY[i], patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
   7B4D 21 72 65      [10] 3770 	ld	hl,#_num_mapa + 0
   7B50 4E            [ 7] 3771 	ld	c, (hl)
   7B51 0C            [ 4] 3772 	inc	c
   7B52 06 00         [ 7] 3773 	ld	b,#0x00
   7B54 69            [ 4] 3774 	ld	l, c
   7B55 60            [ 4] 3775 	ld	h, b
   7B56 29            [11] 3776 	add	hl, hl
   7B57 29            [11] 3777 	add	hl, hl
   7B58 09            [11] 3778 	add	hl, bc
   7B59 4D            [ 4] 3779 	ld	c,l
   7B5A 44            [ 4] 3780 	ld	b,h
   7B5B 21 B0 65      [10] 3781 	ld	hl,#_patrolY
   7B5E 09            [11] 3782 	add	hl,bc
   7B5F 7D            [ 4] 3783 	ld	a,l
   7B60 DD 86 FF      [19] 3784 	add	a, -1 (ix)
   7B63 6F            [ 4] 3785 	ld	l,a
   7B64 7C            [ 4] 3786 	ld	a,h
   7B65 CE 00         [ 7] 3787 	adc	a, #0x00
   7B67 67            [ 4] 3788 	ld	h,a
   7B68 7E            [ 7] 3789 	ld	a,(hl)
   7B69 DD 77 FA      [19] 3790 	ld	-6 (ix),a
   7B6C 21 9C 65      [10] 3791 	ld	hl,#_patrolX
   7B6F 09            [11] 3792 	add	hl,bc
   7B70 DD 4E FF      [19] 3793 	ld	c,-1 (ix)
   7B73 06 00         [ 7] 3794 	ld	b,#0x00
   7B75 09            [11] 3795 	add	hl,bc
   7B76 7E            [ 7] 3796 	ld	a,(hl)
   7B77 DD 77 F9      [19] 3797 	ld	-7 (ix),a
   7B7A DD 6E FB      [19] 3798 	ld	l,-5 (ix)
   7B7D DD 66 FC      [19] 3799 	ld	h,-4 (ix)
   7B80 4E            [ 7] 3800 	ld	c,(hl)
   7B81 DD 6E FD      [19] 3801 	ld	l,-3 (ix)
   7B84 DD 66 FE      [19] 3802 	ld	h,-2 (ix)
   7B87 46            [ 7] 3803 	ld	b,(hl)
   7B88 D5            [11] 3804 	push	de
   7B89 2A 70 65      [16] 3805 	ld	hl,(_mapa)
   7B8C E5            [11] 3806 	push	hl
   7B8D D5            [11] 3807 	push	de
   7B8E DD 66 FA      [19] 3808 	ld	h,-6 (ix)
   7B91 DD 6E F9      [19] 3809 	ld	l,-7 (ix)
   7B94 E5            [11] 3810 	push	hl
   7B95 79            [ 4] 3811 	ld	a,c
   7B96 F5            [11] 3812 	push	af
   7B97 33            [ 6] 3813 	inc	sp
   7B98 C5            [11] 3814 	push	bc
   7B99 33            [ 6] 3815 	inc	sp
   7B9A CD 72 49      [17] 3816 	call	_pathFinding
   7B9D 21 08 00      [10] 3817 	ld	hl,#8
   7BA0 39            [11] 3818 	add	hl,sp
   7BA1 F9            [ 6] 3819 	ld	sp,hl
   7BA2 D1            [10] 3820 	pop	de
                           3821 ;src/main.c:658: dibujarEnemigo(actual);
   7BA3 D5            [11] 3822 	push	de
   7BA4 D5            [11] 3823 	push	de
   7BA5 CD 4A 68      [17] 3824 	call	_dibujarEnemigo
   7BA8 F1            [10] 3825 	pop	af
   7BA9 D1            [10] 3826 	pop	de
                           3827 ;src/main.c:659: ++actual;
   7BAA 21 E3 00      [10] 3828 	ld	hl,#0x00E3
   7BAD 19            [11] 3829 	add	hl,de
   7BAE EB            [ 4] 3830 	ex	de,hl
   7BAF C3 AA 7A      [10] 3831 	jp	00101$
   7BB2                    3832 00104$:
   7BB2 DD F9         [10] 3833 	ld	sp, ix
   7BB4 DD E1         [14] 3834 	pop	ix
   7BB6 C9            [10] 3835 	ret
                           3836 ;src/main.c:663: void avanzarMapa() {
                           3837 ;	---------------------------------
                           3838 ; Function avanzarMapa
                           3839 ; ---------------------------------
   7BB7                    3840 _avanzarMapa::
                           3841 ;src/main.c:664: if(num_mapa < NUM_MAPAS -1) {
   7BB7 3A 72 65      [13] 3842 	ld	a,(#_num_mapa + 0)
   7BBA D6 02         [ 7] 3843 	sub	a, #0x02
   7BBC 30 34         [12] 3844 	jr	NC,00102$
                           3845 ;src/main.c:665: mapa = mapas[++num_mapa];
   7BBE 01 8E 65      [10] 3846 	ld	bc,#_mapas+0
   7BC1 21 72 65      [10] 3847 	ld	hl, #_num_mapa+0
   7BC4 34            [11] 3848 	inc	(hl)
   7BC5 FD 21 72 65   [14] 3849 	ld	iy,#_num_mapa
   7BC9 FD 6E 00      [19] 3850 	ld	l,0 (iy)
   7BCC 26 00         [ 7] 3851 	ld	h,#0x00
   7BCE 29            [11] 3852 	add	hl, hl
   7BCF 09            [11] 3853 	add	hl,bc
   7BD0 7E            [ 7] 3854 	ld	a,(hl)
   7BD1 FD 21 70 65   [14] 3855 	ld	iy,#_mapa
   7BD5 FD 77 00      [19] 3856 	ld	0 (iy),a
   7BD8 23            [ 6] 3857 	inc	hl
   7BD9 7E            [ 7] 3858 	ld	a,(hl)
   7BDA 32 71 65      [13] 3859 	ld	(#_mapa + 1),a
                           3860 ;src/main.c:666: prota.x = prota.px = 2;
   7BDD 21 90 64      [10] 3861 	ld	hl,#(_prota + 0x0002)
   7BE0 36 02         [10] 3862 	ld	(hl),#0x02
   7BE2 21 8E 64      [10] 3863 	ld	hl,#_prota
   7BE5 36 02         [10] 3864 	ld	(hl),#0x02
                           3865 ;src/main.c:667: prota.mover = SI;
   7BE7 21 94 64      [10] 3866 	ld	hl,#(_prota + 0x0006)
   7BEA 36 01         [10] 3867 	ld	(hl),#0x01
                           3868 ;src/main.c:668: dibujarMapa();
   7BEC CD 78 65      [17] 3869 	call	_dibujarMapa
                           3870 ;src/main.c:669: inicializarEnemy();
   7BEF C3 92 7A      [10] 3871 	jp  _inicializarEnemy
   7BF2                    3872 00102$:
                           3873 ;src/main.c:672: menuFin(puntuacion);
   7BF2 FD 21 73 65   [14] 3874 	ld	iy,#_puntuacion
   7BF6 FD 6E 00      [19] 3875 	ld	l,0 (iy)
   7BF9 26 00         [ 7] 3876 	ld	h,#0x00
   7BFB C3 F5 4B      [10] 3877 	jp  _menuFin
                           3878 ;src/main.c:676: void moverIzquierda() {
                           3879 ;	---------------------------------
                           3880 ; Function moverIzquierda
                           3881 ; ---------------------------------
   7BFE                    3882 _moverIzquierda::
                           3883 ;src/main.c:677: prota.mira = M_izquierda;
   7BFE 01 8E 64      [10] 3884 	ld	bc,#_prota+0
   7C01 21 95 64      [10] 3885 	ld	hl,#(_prota + 0x0007)
   7C04 36 01         [10] 3886 	ld	(hl),#0x01
                           3887 ;src/main.c:678: if (!checkCollision(M_izquierda)) {
   7C06 C5            [11] 3888 	push	bc
   7C07 3E 01         [ 7] 3889 	ld	a,#0x01
   7C09 F5            [11] 3890 	push	af
   7C0A 33            [ 6] 3891 	inc	sp
   7C0B CD D9 66      [17] 3892 	call	_checkCollision
   7C0E 33            [ 6] 3893 	inc	sp
   7C0F C1            [10] 3894 	pop	bc
   7C10 7D            [ 4] 3895 	ld	a,l
   7C11 B7            [ 4] 3896 	or	a, a
   7C12 C0            [11] 3897 	ret	NZ
                           3898 ;src/main.c:679: prota.x--;
   7C13 0A            [ 7] 3899 	ld	a,(bc)
   7C14 C6 FF         [ 7] 3900 	add	a,#0xFF
   7C16 02            [ 7] 3901 	ld	(bc),a
                           3902 ;src/main.c:680: prota.mover = SI;
   7C17 21 94 64      [10] 3903 	ld	hl,#(_prota + 0x0006)
   7C1A 36 01         [10] 3904 	ld	(hl),#0x01
                           3905 ;src/main.c:681: prota.sprite = g_hero_left;
   7C1C 21 C6 3D      [10] 3906 	ld	hl,#_g_hero_left
   7C1F 22 92 64      [16] 3907 	ld	((_prota + 0x0004)), hl
   7C22 C9            [10] 3908 	ret
                           3909 ;src/main.c:685: void moverDerecha() {
                           3910 ;	---------------------------------
                           3911 ; Function moverDerecha
                           3912 ; ---------------------------------
   7C23                    3913 _moverDerecha::
                           3914 ;src/main.c:686: prota.mira = M_derecha;
   7C23 21 95 64      [10] 3915 	ld	hl,#(_prota + 0x0007)
   7C26 36 00         [10] 3916 	ld	(hl),#0x00
                           3917 ;src/main.c:687: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7C28 AF            [ 4] 3918 	xor	a, a
   7C29 F5            [11] 3919 	push	af
   7C2A 33            [ 6] 3920 	inc	sp
   7C2B CD D9 66      [17] 3921 	call	_checkCollision
   7C2E 33            [ 6] 3922 	inc	sp
   7C2F 45            [ 4] 3923 	ld	b,l
   7C30 21 8E 64      [10] 3924 	ld	hl, #_prota + 0
   7C33 4E            [ 7] 3925 	ld	c,(hl)
   7C34 59            [ 4] 3926 	ld	e,c
   7C35 16 00         [ 7] 3927 	ld	d,#0x00
   7C37 21 07 00      [10] 3928 	ld	hl,#0x0007
   7C3A 19            [11] 3929 	add	hl,de
   7C3B 11 50 80      [10] 3930 	ld	de, #0x8050
   7C3E 29            [11] 3931 	add	hl, hl
   7C3F 3F            [ 4] 3932 	ccf
   7C40 CB 1C         [ 8] 3933 	rr	h
   7C42 CB 1D         [ 8] 3934 	rr	l
   7C44 ED 52         [15] 3935 	sbc	hl, de
   7C46 3E 00         [ 7] 3936 	ld	a,#0x00
   7C48 17            [ 4] 3937 	rla
   7C49 5F            [ 4] 3938 	ld	e,a
   7C4A 78            [ 4] 3939 	ld	a,b
   7C4B B7            [ 4] 3940 	or	a,a
   7C4C 20 14         [12] 3941 	jr	NZ,00104$
   7C4E B3            [ 4] 3942 	or	a,e
   7C4F 28 11         [12] 3943 	jr	Z,00104$
                           3944 ;src/main.c:688: prota.x++;
   7C51 0C            [ 4] 3945 	inc	c
   7C52 21 8E 64      [10] 3946 	ld	hl,#_prota
   7C55 71            [ 7] 3947 	ld	(hl),c
                           3948 ;src/main.c:689: prota.mover = SI;
   7C56 21 94 64      [10] 3949 	ld	hl,#(_prota + 0x0006)
   7C59 36 01         [10] 3950 	ld	(hl),#0x01
                           3951 ;src/main.c:690: prota.sprite = g_hero;
   7C5B 21 70 3E      [10] 3952 	ld	hl,#_g_hero
   7C5E 22 92 64      [16] 3953 	ld	((_prota + 0x0004)), hl
   7C61 C9            [10] 3954 	ret
   7C62                    3955 00104$:
                           3956 ;src/main.c:691: }else if( prota.x + G_HERO_W >= 80){
   7C62 7B            [ 4] 3957 	ld	a,e
   7C63 B7            [ 4] 3958 	or	a, a
   7C64 C0            [11] 3959 	ret	NZ
                           3960 ;src/main.c:692: avanzarMapa();
   7C65 C3 B7 7B      [10] 3961 	jp  _avanzarMapa
                           3962 ;src/main.c:696: void moverArriba() {
                           3963 ;	---------------------------------
                           3964 ; Function moverArriba
                           3965 ; ---------------------------------
   7C68                    3966 _moverArriba::
                           3967 ;src/main.c:697: prota.mira = M_arriba;
   7C68 21 95 64      [10] 3968 	ld	hl,#(_prota + 0x0007)
   7C6B 36 02         [10] 3969 	ld	(hl),#0x02
                           3970 ;src/main.c:698: if (!checkCollision(M_arriba)) {
   7C6D 3E 02         [ 7] 3971 	ld	a,#0x02
   7C6F F5            [11] 3972 	push	af
   7C70 33            [ 6] 3973 	inc	sp
   7C71 CD D9 66      [17] 3974 	call	_checkCollision
   7C74 33            [ 6] 3975 	inc	sp
   7C75 7D            [ 4] 3976 	ld	a,l
   7C76 B7            [ 4] 3977 	or	a, a
   7C77 C0            [11] 3978 	ret	NZ
                           3979 ;src/main.c:699: prota.y--;
   7C78 21 8F 64      [10] 3980 	ld	hl,#_prota + 1
   7C7B 4E            [ 7] 3981 	ld	c,(hl)
   7C7C 0D            [ 4] 3982 	dec	c
   7C7D 71            [ 7] 3983 	ld	(hl),c
                           3984 ;src/main.c:700: prota.y--;
   7C7E 0D            [ 4] 3985 	dec	c
   7C7F 71            [ 7] 3986 	ld	(hl),c
                           3987 ;src/main.c:701: prota.mover  = SI;
   7C80 21 94 64      [10] 3988 	ld	hl,#(_prota + 0x0006)
   7C83 36 01         [10] 3989 	ld	(hl),#0x01
                           3990 ;src/main.c:702: prota.sprite = g_hero_up;
   7C85 21 2C 3D      [10] 3991 	ld	hl,#_g_hero_up
   7C88 22 92 64      [16] 3992 	ld	((_prota + 0x0004)), hl
   7C8B C9            [10] 3993 	ret
                           3994 ;src/main.c:706: void moverAbajo() {
                           3995 ;	---------------------------------
                           3996 ; Function moverAbajo
                           3997 ; ---------------------------------
   7C8C                    3998 _moverAbajo::
                           3999 ;src/main.c:707: prota.mira = M_abajo;
   7C8C 21 95 64      [10] 4000 	ld	hl,#(_prota + 0x0007)
   7C8F 36 03         [10] 4001 	ld	(hl),#0x03
                           4002 ;src/main.c:708: if (!checkCollision(M_abajo) ) {
   7C91 3E 03         [ 7] 4003 	ld	a,#0x03
   7C93 F5            [11] 4004 	push	af
   7C94 33            [ 6] 4005 	inc	sp
   7C95 CD D9 66      [17] 4006 	call	_checkCollision
   7C98 33            [ 6] 4007 	inc	sp
   7C99 7D            [ 4] 4008 	ld	a,l
   7C9A B7            [ 4] 4009 	or	a, a
   7C9B C0            [11] 4010 	ret	NZ
                           4011 ;src/main.c:709: prota.y++;
   7C9C 01 8F 64      [10] 4012 	ld	bc,#_prota + 1
   7C9F 0A            [ 7] 4013 	ld	a,(bc)
   7CA0 3C            [ 4] 4014 	inc	a
   7CA1 02            [ 7] 4015 	ld	(bc),a
                           4016 ;src/main.c:710: prota.y++;
   7CA2 3C            [ 4] 4017 	inc	a
   7CA3 02            [ 7] 4018 	ld	(bc),a
                           4019 ;src/main.c:711: prota.mover  = SI;
   7CA4 21 94 64      [10] 4020 	ld	hl,#(_prota + 0x0006)
   7CA7 36 01         [10] 4021 	ld	(hl),#0x01
                           4022 ;src/main.c:712: prota.sprite = g_hero_down;
   7CA9 21 92 3C      [10] 4023 	ld	hl,#_g_hero_down
   7CAC 22 92 64      [16] 4024 	ld	((_prota + 0x0004)), hl
   7CAF C9            [10] 4025 	ret
                           4026 ;src/main.c:719: void intHandler() {
                           4027 ;	---------------------------------
                           4028 ; Function intHandler
                           4029 ; ---------------------------------
   7CB0                    4030 _intHandler::
                           4031 ;src/main.c:720: if (++i == 6) {
   7CB0 21 A6 64      [10] 4032 	ld	hl, #_i+0
   7CB3 34            [11] 4033 	inc	(hl)
   7CB4 3A A6 64      [13] 4034 	ld	a,(#_i + 0)
   7CB7 D6 06         [ 7] 4035 	sub	a, #0x06
   7CB9 C0            [11] 4036 	ret	NZ
                           4037 ;src/main.c:721: play();
   7CBA CD AE 53      [17] 4038 	call	_play
                           4039 ;src/main.c:722: i=0;
   7CBD 21 A6 64      [10] 4040 	ld	hl,#_i + 0
   7CC0 36 00         [10] 4041 	ld	(hl), #0x00
   7CC2 C9            [10] 4042 	ret
                           4043 ;src/main.c:726: void inicializarCPC() {
                           4044 ;	---------------------------------
                           4045 ; Function inicializarCPC
                           4046 ; ---------------------------------
   7CC3                    4047 _inicializarCPC::
                           4048 ;src/main.c:727: cpct_disableFirmware();
   7CC3 CD 95 5F      [17] 4049 	call	_cpct_disableFirmware
                           4050 ;src/main.c:728: cpct_setVideoMode(0);
   7CC6 2E 00         [ 7] 4051 	ld	l,#0x00
   7CC8 CD 40 57      [17] 4052 	call	_cpct_setVideoMode
                           4053 ;src/main.c:729: cpct_setBorder(HW_BLACK);
   7CCB 21 10 14      [10] 4054 	ld	hl,#0x1410
   7CCE E5            [11] 4055 	push	hl
   7CCF CD 8C 54      [17] 4056 	call	_cpct_setPALColour
                           4057 ;src/main.c:730: cpct_setPalette(g_palette, 16);
   7CD2 21 10 00      [10] 4058 	ld	hl,#0x0010
   7CD5 E5            [11] 4059 	push	hl
   7CD6 21 60 3E      [10] 4060 	ld	hl,#_g_palette
   7CD9 E5            [11] 4061 	push	hl
   7CDA CD 69 54      [17] 4062 	call	_cpct_setPalette
                           4063 ;src/main.c:731: cpct_akp_musicInit(g_song);
   7CDD 21 00 02      [10] 4064 	ld	hl,#_g_song
   7CE0 E5            [11] 4065 	push	hl
   7CE1 CD 71 5E      [17] 4066 	call	_cpct_akp_musicInit
   7CE4 F1            [10] 4067 	pop	af
                           4068 ;src/main.c:732: cpct_setInterruptHandler(intHandler);
   7CE5 21 B0 7C      [10] 4069 	ld	hl,#_intHandler
   7CE8 CD DA 60      [17] 4070 	call	_cpct_setInterruptHandler
   7CEB C9            [10] 4071 	ret
                           4072 ;src/main.c:735: void inicializarJuego() {
                           4073 ;	---------------------------------
                           4074 ; Function inicializarJuego
                           4075 ; ---------------------------------
   7CEC                    4076 _inicializarJuego::
                           4077 ;src/main.c:736: cambio = 0;
   7CEC 21 A2 64      [10] 4078 	ld	hl,#_cambio + 0
   7CEF 36 00         [10] 4079 	ld	(hl), #0x00
                           4080 ;src/main.c:737: timer = 0;
   7CF1 21 00 00      [10] 4081 	ld	hl,#0x0000
   7CF4 22 A3 64      [16] 4082 	ld	(_timer),hl
                           4083 ;src/main.c:738: parpadeo = 0;
   7CF7 21 A1 64      [10] 4084 	ld	hl,#_parpadeo + 0
   7CFA 36 00         [10] 4085 	ld	(hl), #0x00
                           4086 ;src/main.c:740: num_mapa = 0;
   7CFC 21 72 65      [10] 4087 	ld	hl,#_num_mapa + 0
   7CFF 36 00         [10] 4088 	ld	(hl), #0x00
                           4089 ;src/main.c:741: mapa = mapas[num_mapa];
   7D01 21 8E 65      [10] 4090 	ld	hl, #_mapas + 0
   7D04 7E            [ 7] 4091 	ld	a,(hl)
   7D05 FD 21 70 65   [14] 4092 	ld	iy,#_mapa
   7D09 FD 77 00      [19] 4093 	ld	0 (iy),a
   7D0C 23            [ 6] 4094 	inc	hl
   7D0D 7E            [ 7] 4095 	ld	a,(hl)
   7D0E 32 71 65      [13] 4096 	ld	(#_mapa + 1),a
                           4097 ;src/main.c:742: cpct_etm_setTileset2x4(g_tileset);
   7D11 21 E0 17      [10] 4098 	ld	hl,#_g_tileset
   7D14 CD 7D 56      [17] 4099 	call	_cpct_etm_setTileset2x4
                           4100 ;src/main.c:744: dibujarMapa();
   7D17 CD 78 65      [17] 4101 	call	_dibujarMapa
                           4102 ;src/main.c:747: barraPuntuacionInicial();
   7D1A CD 95 51      [17] 4103 	call	_barraPuntuacionInicial
                           4104 ;src/main.c:750: prota.x = prota.px = 4;
   7D1D 21 90 64      [10] 4105 	ld	hl,#(_prota + 0x0002)
   7D20 36 04         [10] 4106 	ld	(hl),#0x04
   7D22 21 8E 64      [10] 4107 	ld	hl,#_prota
   7D25 36 04         [10] 4108 	ld	(hl),#0x04
                           4109 ;src/main.c:751: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   7D27 21 91 64      [10] 4110 	ld	hl,#(_prota + 0x0003)
   7D2A 36 68         [10] 4111 	ld	(hl),#0x68
   7D2C 21 8F 64      [10] 4112 	ld	hl,#(_prota + 0x0001)
   7D2F 36 68         [10] 4113 	ld	(hl),#0x68
                           4114 ;src/main.c:752: prota.mover  = NO;
   7D31 21 94 64      [10] 4115 	ld	hl,#(_prota + 0x0006)
   7D34 36 00         [10] 4116 	ld	(hl),#0x00
                           4117 ;src/main.c:753: prota.mira=M_derecha;
   7D36 21 95 64      [10] 4118 	ld	hl,#(_prota + 0x0007)
   7D39 36 00         [10] 4119 	ld	(hl),#0x00
                           4120 ;src/main.c:754: prota.sprite = g_hero;
   7D3B 21 70 3E      [10] 4121 	ld	hl,#_g_hero
   7D3E 22 92 64      [16] 4122 	ld	((_prota + 0x0004)), hl
                           4123 ;src/main.c:758: cu.x = cu.px = 0;
   7D41 21 98 64      [10] 4124 	ld	hl,#(_cu + 0x0002)
   7D44 36 00         [10] 4125 	ld	(hl),#0x00
   7D46 21 96 64      [10] 4126 	ld	hl,#_cu
   7D49 36 00         [10] 4127 	ld	(hl),#0x00
                           4128 ;src/main.c:759: cu.y = cu.py = 0;
   7D4B 21 99 64      [10] 4129 	ld	hl,#(_cu + 0x0003)
   7D4E 36 00         [10] 4130 	ld	(hl),#0x00
   7D50 21 97 64      [10] 4131 	ld	hl,#(_cu + 0x0001)
   7D53 36 00         [10] 4132 	ld	(hl),#0x00
                           4133 ;src/main.c:760: cu.lanzado = NO;
   7D55 21 9C 64      [10] 4134 	ld	hl,#(_cu + 0x0006)
   7D58 36 00         [10] 4135 	ld	(hl),#0x00
                           4136 ;src/main.c:761: cu.mover = NO;
   7D5A 21 9F 64      [10] 4137 	ld	hl,#(_cu + 0x0009)
   7D5D 36 00         [10] 4138 	ld	(hl),#0x00
                           4139 ;src/main.c:762: cu.off_bound = NO;
   7D5F 21 A0 64      [10] 4140 	ld	hl,#(_cu + 0x000a)
   7D62 36 00         [10] 4141 	ld	(hl),#0x00
                           4142 ;src/main.c:764: inicializarEnemy();
   7D64 CD 92 7A      [17] 4143 	call	_inicializarEnemy
                           4144 ;src/main.c:766: dibujarProta();
   7D67 C3 C4 65      [10] 4145 	jp  _dibujarProta
                           4146 ;src/main.c:769: void main(void) {
                           4147 ;	---------------------------------
                           4148 ; Function main
                           4149 ; ---------------------------------
   7D6A                    4150 _main::
   7D6A DD E5         [15] 4151 	push	ix
   7D6C DD 21 00 00   [14] 4152 	ld	ix,#0
   7D70 DD 39         [15] 4153 	add	ix,sp
   7D72 21 F3 FF      [10] 4154 	ld	hl,#-13
   7D75 39            [11] 4155 	add	hl,sp
   7D76 F9            [ 6] 4156 	ld	sp,hl
                           4157 ;src/main.c:774: vidas = 100;
   7D77 21 A5 64      [10] 4158 	ld	hl,#_vidas + 0
   7D7A 36 64         [10] 4159 	ld	(hl), #0x64
                           4160 ;src/main.c:776: inicializarCPC();
   7D7C CD C3 7C      [17] 4161 	call	_inicializarCPC
                           4162 ;src/main.c:778: menuInicio();
   7D7F CD B6 50      [17] 4163 	call	_menuInicio
                           4164 ;src/main.c:780: inicializarJuego();
   7D82 CD EC 7C      [17] 4165 	call	_inicializarJuego
                           4166 ;src/main.c:784: while (1) {
   7D85                    4167 00148$:
                           4168 ;src/main.c:785: ++timer;
   7D85 21 A3 64      [10] 4169 	ld	hl, #_timer+0
   7D88 34            [11] 4170 	inc	(hl)
   7D89 20 04         [12] 4171 	jr	NZ,00266$
   7D8B 21 A4 64      [10] 4172 	ld	hl, #_timer+1
   7D8E 34            [11] 4173 	inc	(hl)
   7D8F                    4174 00266$:
                           4175 ;src/main.c:786: if(timer == 4 && (cambio > 0 && cambio<=12)){
   7D8F 3A A3 64      [13] 4176 	ld	a,(#_timer + 0)
   7D92 D6 04         [ 7] 4177 	sub	a, #0x04
   7D94 20 30         [12] 4178 	jr	NZ,00104$
   7D96 3A A4 64      [13] 4179 	ld	a,(#_timer + 1)
   7D99 B7            [ 4] 4180 	or	a, a
   7D9A 20 2A         [12] 4181 	jr	NZ,00104$
   7D9C 3A A2 64      [13] 4182 	ld	a,(#_cambio + 0)
   7D9F B7            [ 4] 4183 	or	a, a
   7DA0 28 24         [12] 4184 	jr	Z,00104$
   7DA2 3E 0C         [ 7] 4185 	ld	a,#0x0C
   7DA4 FD 21 A2 64   [14] 4186 	ld	iy,#_cambio
   7DA8 FD 96 00      [19] 4187 	sub	a, 0 (iy)
   7DAB 38 19         [12] 4188 	jr	C,00104$
                           4189 ;src/main.c:787: timer = 0;
   7DAD 21 00 00      [10] 4190 	ld	hl,#0x0000
   7DB0 22 A3 64      [16] 4191 	ld	(_timer),hl
                           4192 ;src/main.c:788: parpadeo = !parpadeo;
   7DB3 3A A1 64      [13] 4193 	ld	a,(#_parpadeo + 0)
   7DB6 D6 01         [ 7] 4194 	sub	a,#0x01
   7DB8 3E 00         [ 7] 4195 	ld	a,#0x00
   7DBA 17            [ 4] 4196 	rla
   7DBB 4F            [ 4] 4197 	ld	c,a
   7DBC 21 A1 64      [10] 4198 	ld	hl,#_parpadeo + 0
   7DBF 71            [ 7] 4199 	ld	(hl), c
                           4200 ;src/main.c:789: cambio ++;
   7DC0 21 A2 64      [10] 4201 	ld	hl, #_cambio+0
   7DC3 34            [11] 4202 	inc	(hl)
   7DC4 18 0C         [12] 4203 	jr	00105$
   7DC6                    4204 00104$:
                           4205 ;src/main.c:790: }else if(cambio == 12){
   7DC6 3A A2 64      [13] 4206 	ld	a,(#_cambio + 0)
   7DC9 D6 0C         [ 7] 4207 	sub	a, #0x0C
   7DCB 20 05         [12] 4208 	jr	NZ,00105$
                           4209 ;src/main.c:791: cambio = 0;
   7DCD 21 A2 64      [10] 4210 	ld	hl,#_cambio + 0
   7DD0 36 00         [10] 4211 	ld	(hl), #0x00
   7DD2                    4212 00105$:
                           4213 ;src/main.c:793: i = 2 + num_mapa;
   7DD2 21 72 65      [10] 4214 	ld	hl,#_num_mapa + 0
   7DD5 4E            [ 7] 4215 	ld	c, (hl)
   7DD6 0C            [ 4] 4216 	inc	c
   7DD7 0C            [ 4] 4217 	inc	c
                           4218 ;src/main.c:794: actual = enemy;
                           4219 ;src/main.c:796: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   7DD8 C5            [11] 4220 	push	bc
   7DD9 21 00 01      [10] 4221 	ld	hl,#_g_tablatrans
   7DDC E5            [11] 4222 	push	hl
   7DDD 2A 70 65      [16] 4223 	ld	hl,(_mapa)
   7DE0 E5            [11] 4224 	push	hl
   7DE1 21 8E 64      [10] 4225 	ld	hl,#_prota
   7DE4 E5            [11] 4226 	push	hl
   7DE5 21 96 64      [10] 4227 	ld	hl,#_cu
   7DE8 E5            [11] 4228 	push	hl
   7DE9 CD 72 66      [17] 4229 	call	_comprobarTeclado
   7DEC 21 08 00      [10] 4230 	ld	hl,#8
   7DEF 39            [11] 4231 	add	hl,sp
   7DF0 F9            [ 6] 4232 	ld	sp,hl
   7DF1 2A 70 65      [16] 4233 	ld	hl,(_mapa)
   7DF4 E5            [11] 4234 	push	hl
   7DF5 21 96 64      [10] 4235 	ld	hl,#_cu
   7DF8 E5            [11] 4236 	push	hl
   7DF9 CD 15 43      [17] 4237 	call	_moverCuchillo
   7DFC F1            [10] 4238 	pop	af
   7DFD F1            [10] 4239 	pop	af
   7DFE C1            [10] 4240 	pop	bc
                           4241 ;src/main.c:798: while(i){
   7DFF DD 71 F3      [19] 4242 	ld	-13 (ix),c
   7E02 DD 36 FC 02   [19] 4243 	ld	-4 (ix),#<(_enemy)
   7E06 DD 36 FD 61   [19] 4244 	ld	-3 (ix),#>(_enemy)
   7E0A                    4245 00115$:
   7E0A DD 7E F3      [19] 4246 	ld	a,-13 (ix)
   7E0D B7            [ 4] 4247 	or	a, a
   7E0E 28 6A         [12] 4248 	jr	Z,00117$
                           4249 ;src/main.c:800: --i;
   7E10 DD 35 F3      [23] 4250 	dec	-13 (ix)
                           4251 ;src/main.c:801: if(!actual->muerto){
   7E13 DD 7E FC      [19] 4252 	ld	a,-4 (ix)
   7E16 C6 08         [ 7] 4253 	add	a, #0x08
   7E18 DD 77 F6      [19] 4254 	ld	-10 (ix),a
   7E1B DD 7E FD      [19] 4255 	ld	a,-3 (ix)
   7E1E CE 00         [ 7] 4256 	adc	a, #0x00
   7E20 DD 77 F7      [19] 4257 	ld	-9 (ix),a
   7E23 DD 6E F6      [19] 4258 	ld	l,-10 (ix)
   7E26 DD 66 F7      [19] 4259 	ld	h,-9 (ix)
   7E29 7E            [ 7] 4260 	ld	a,(hl)
   7E2A B7            [ 4] 4261 	or	a, a
   7E2B 20 12         [12] 4262 	jr	NZ,00109$
                           4263 ;src/main.c:802: checkEnemyDead(cu.direccion, actual);
   7E2D 21 9D 64      [10] 4264 	ld	hl, #_cu + 7
   7E30 46            [ 7] 4265 	ld	b,(hl)
   7E31 DD 6E FC      [19] 4266 	ld	l,-4 (ix)
   7E34 DD 66 FD      [19] 4267 	ld	h,-3 (ix)
   7E37 E5            [11] 4268 	push	hl
   7E38 C5            [11] 4269 	push	bc
   7E39 33            [ 6] 4270 	inc	sp
   7E3A CD CC 69      [17] 4271 	call	_checkEnemyDead
   7E3D F1            [10] 4272 	pop	af
   7E3E 33            [ 6] 4273 	inc	sp
   7E3F                    4274 00109$:
                           4275 ;src/main.c:804: if(!actual->muerto){
   7E3F DD 6E F6      [19] 4276 	ld	l,-10 (ix)
   7E42 DD 66 F7      [19] 4277 	ld	h,-9 (ix)
   7E45 7E            [ 7] 4278 	ld	a,(hl)
   7E46 B7            [ 4] 4279 	or	a, a
   7E47 20 1F         [12] 4280 	jr	NZ,00114$
                           4281 ;src/main.c:805: if (!actual->didDamage)
   7E49 DD 7E FC      [19] 4282 	ld	a,-4 (ix)
   7E4C C6 16         [ 7] 4283 	add	a, #0x16
   7E4E 4F            [ 4] 4284 	ld	c,a
   7E4F DD 7E FD      [19] 4285 	ld	a,-3 (ix)
   7E52 CE 00         [ 7] 4286 	adc	a, #0x00
   7E54 47            [ 4] 4287 	ld	b,a
   7E55 0A            [ 7] 4288 	ld	a,(bc)
   7E56 B7            [ 4] 4289 	or	a, a
   7E57 20 0D         [12] 4290 	jr	NZ,00111$
                           4291 ;src/main.c:806: updateEnemy(actual);
   7E59 DD 6E FC      [19] 4292 	ld	l,-4 (ix)
   7E5C DD 66 FD      [19] 4293 	ld	h,-3 (ix)
   7E5F E5            [11] 4294 	push	hl
   7E60 CD 36 79      [17] 4295 	call	_updateEnemy
   7E63 F1            [10] 4296 	pop	af
   7E64 18 02         [12] 4297 	jr	00114$
   7E66                    4298 00111$:
                           4299 ;src/main.c:808: actual->didDamage = 0;
   7E66 AF            [ 4] 4300 	xor	a, a
   7E67 02            [ 7] 4301 	ld	(bc),a
   7E68                    4302 00114$:
                           4303 ;src/main.c:810: ++actual;
   7E68 DD 7E FC      [19] 4304 	ld	a,-4 (ix)
   7E6B C6 E3         [ 7] 4305 	add	a, #0xE3
   7E6D DD 77 FC      [19] 4306 	ld	-4 (ix),a
   7E70 DD 7E FD      [19] 4307 	ld	a,-3 (ix)
   7E73 CE 00         [ 7] 4308 	adc	a, #0x00
   7E75 DD 77 FD      [19] 4309 	ld	-3 (ix),a
   7E78 18 90         [12] 4310 	jr	00115$
   7E7A                    4311 00117$:
                           4312 ;src/main.c:813: cpct_waitVSYNC();
   7E7A CD 38 57      [17] 4313 	call	_cpct_waitVSYNC
                           4314 ;src/main.c:816: if (prota.mover) {
   7E7D 01 94 64      [10] 4315 	ld	bc,#_prota + 6
   7E80 0A            [ 7] 4316 	ld	a,(bc)
   7E81 B7            [ 4] 4317 	or	a, a
   7E82 28 07         [12] 4318 	jr	Z,00119$
                           4319 ;src/main.c:817: redibujarProta();
   7E84 C5            [11] 4320 	push	bc
   7E85 CD 5E 66      [17] 4321 	call	_redibujarProta
   7E88 C1            [10] 4322 	pop	bc
                           4323 ;src/main.c:818: prota.mover = NO;
   7E89 AF            [ 4] 4324 	xor	a, a
   7E8A 02            [ 7] 4325 	ld	(bc),a
   7E8B                    4326 00119$:
                           4327 ;src/main.c:820: if(cu.lanzado && cu.mover){
   7E8B 21 9C 64      [10] 4328 	ld	hl, #(_cu + 0x0006) + 0
   7E8E 4E            [ 7] 4329 	ld	c,(hl)
                           4330 ;src/main.c:821: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4331 ;src/main.c:820: if(cu.lanzado && cu.mover){
   7E8F 79            [ 4] 4332 	ld	a,c
   7E90 B7            [ 4] 4333 	or	a, a
   7E91 28 30         [12] 4334 	jr	Z,00124$
   7E93 3A 9F 64      [13] 4335 	ld	a, (#(_cu + 0x0009) + 0)
   7E96 B7            [ 4] 4336 	or	a, a
   7E97 28 2A         [12] 4337 	jr	Z,00124$
                           4338 ;src/main.c:821: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   7E99 21 97 64      [10] 4339 	ld	hl, #(_cu + 0x0001) + 0
   7E9C 4E            [ 7] 4340 	ld	c,(hl)
   7E9D 21 96 64      [10] 4341 	ld	hl, #_cu + 0
   7EA0 46            [ 7] 4342 	ld	b,(hl)
   7EA1 21 9E 64      [10] 4343 	ld	hl, #(_cu + 0x0008) + 0
   7EA4 5E            [ 7] 4344 	ld	e,(hl)
   7EA5 2A 70 65      [16] 4345 	ld	hl,(_mapa)
   7EA8 E5            [11] 4346 	push	hl
   7EA9 21 00 01      [10] 4347 	ld	hl,#_g_tablatrans
   7EAC E5            [11] 4348 	push	hl
   7EAD 21 96 64      [10] 4349 	ld	hl,#_cu
   7EB0 E5            [11] 4350 	push	hl
   7EB1 79            [ 4] 4351 	ld	a,c
   7EB2 F5            [11] 4352 	push	af
   7EB3 33            [ 6] 4353 	inc	sp
   7EB4 C5            [11] 4354 	push	bc
   7EB5 33            [ 6] 4355 	inc	sp
   7EB6 7B            [ 4] 4356 	ld	a,e
   7EB7 F5            [11] 4357 	push	af
   7EB8 33            [ 6] 4358 	inc	sp
   7EB9 CD 25 40      [17] 4359 	call	_redibujarCuchillo
   7EBC 21 09 00      [10] 4360 	ld	hl,#9
   7EBF 39            [11] 4361 	add	hl,sp
   7EC0 F9            [ 6] 4362 	ld	sp,hl
   7EC1 18 32         [12] 4363 	jr	00125$
   7EC3                    4364 00124$:
                           4365 ;src/main.c:822: }else if (cu.lanzado && !cu.mover){
   7EC3 79            [ 4] 4366 	ld	a,c
   7EC4 B7            [ 4] 4367 	or	a, a
   7EC5 28 2E         [12] 4368 	jr	Z,00125$
   7EC7 3A 9F 64      [13] 4369 	ld	a, (#(_cu + 0x0009) + 0)
   7ECA B7            [ 4] 4370 	or	a, a
   7ECB 20 28         [12] 4371 	jr	NZ,00125$
                           4372 ;src/main.c:823: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   7ECD 21 97 64      [10] 4373 	ld	hl, #(_cu + 0x0001) + 0
   7ED0 46            [ 7] 4374 	ld	b,(hl)
   7ED1 21 96 64      [10] 4375 	ld	hl, #_cu + 0
   7ED4 4E            [ 7] 4376 	ld	c,(hl)
   7ED5 21 9E 64      [10] 4377 	ld	hl, #(_cu + 0x0008) + 0
   7ED8 56            [ 7] 4378 	ld	d,(hl)
   7ED9 2A 70 65      [16] 4379 	ld	hl,(_mapa)
   7EDC E5            [11] 4380 	push	hl
   7EDD C5            [11] 4381 	push	bc
   7EDE D5            [11] 4382 	push	de
   7EDF 33            [ 6] 4383 	inc	sp
   7EE0 CD 92 3F      [17] 4384 	call	_borrarCuchillo
   7EE3 F1            [10] 4385 	pop	af
   7EE4 F1            [10] 4386 	pop	af
   7EE5 33            [ 6] 4387 	inc	sp
                           4388 ;src/main.c:824: cu.lanzado = NO;
   7EE6 21 9C 64      [10] 4389 	ld	hl,#(_cu + 0x0006)
   7EE9 36 00         [10] 4390 	ld	(hl),#0x00
                           4391 ;src/main.c:826: cu.x = 0;
   7EEB 21 96 64      [10] 4392 	ld	hl,#_cu
   7EEE 36 00         [10] 4393 	ld	(hl),#0x00
                           4394 ;src/main.c:827: cu.y=0;
   7EF0 21 97 64      [10] 4395 	ld	hl,#(_cu + 0x0001)
   7EF3 36 00         [10] 4396 	ld	(hl),#0x00
   7EF5                    4397 00125$:
                           4398 ;src/main.c:830: i = 2 + num_mapa;
   7EF5 21 72 65      [10] 4399 	ld	hl,#_num_mapa + 0
   7EF8 4E            [ 7] 4400 	ld	c, (hl)
   7EF9 0C            [ 4] 4401 	inc	c
   7EFA 0C            [ 4] 4402 	inc	c
                           4403 ;src/main.c:831: actual = enemy;
   7EFB 11 02 61      [10] 4404 	ld	de,#_enemy
                           4405 ;src/main.c:832: while(i){
   7EFE                    4406 00144$:
   7EFE 79            [ 4] 4407 	ld	a,c
   7EFF B7            [ 4] 4408 	or	a, a
   7F00 CA 7C 80      [10] 4409 	jp	Z,00146$
                           4410 ;src/main.c:834: --i;
   7F03 0D            [ 4] 4411 	dec	c
                           4412 ;src/main.c:835: if(actual->mover){
   7F04 21 06 00      [10] 4413 	ld	hl,#0x0006
   7F07 19            [11] 4414 	add	hl,de
   7F08 DD 75 F6      [19] 4415 	ld	-10 (ix),l
   7F0B DD 74 F7      [19] 4416 	ld	-9 (ix),h
   7F0E DD 6E F6      [19] 4417 	ld	l,-10 (ix)
   7F11 DD 66 F7      [19] 4418 	ld	h,-9 (ix)
   7F14 46            [ 7] 4419 	ld	b,(hl)
                           4420 ;src/main.c:836: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7F15 21 03 00      [10] 4421 	ld	hl,#0x0003
   7F18 19            [11] 4422 	add	hl,de
   7F19 DD 75 FC      [19] 4423 	ld	-4 (ix),l
   7F1C DD 74 FD      [19] 4424 	ld	-3 (ix),h
   7F1F 21 02 00      [10] 4425 	ld	hl,#0x0002
   7F22 19            [11] 4426 	add	hl,de
   7F23 DD 75 F4      [19] 4427 	ld	-12 (ix),l
   7F26 DD 74 F5      [19] 4428 	ld	-11 (ix),h
                           4429 ;src/main.c:835: if(actual->mover){
   7F29 78            [ 4] 4430 	ld	a,b
   7F2A B7            [ 4] 4431 	or	a, a
   7F2B 28 22         [12] 4432 	jr	Z,00128$
                           4433 ;src/main.c:836: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7F2D DD 6E FC      [19] 4434 	ld	l,-4 (ix)
   7F30 DD 66 FD      [19] 4435 	ld	h,-3 (ix)
   7F33 7E            [ 7] 4436 	ld	a,(hl)
   7F34 DD 77 F3      [19] 4437 	ld	-13 (ix),a
   7F37 DD 6E F4      [19] 4438 	ld	l,-12 (ix)
   7F3A DD 66 F5      [19] 4439 	ld	h,-11 (ix)
   7F3D 46            [ 7] 4440 	ld	b,(hl)
   7F3E C5            [11] 4441 	push	bc
   7F3F D5            [11] 4442 	push	de
   7F40 D5            [11] 4443 	push	de
   7F41 DD 7E F3      [19] 4444 	ld	a,-13 (ix)
   7F44 F5            [11] 4445 	push	af
   7F45 33            [ 6] 4446 	inc	sp
   7F46 C5            [11] 4447 	push	bc
   7F47 33            [ 6] 4448 	inc	sp
   7F48 CD 9B 69      [17] 4449 	call	_redibujarEnemigo
   7F4B F1            [10] 4450 	pop	af
   7F4C F1            [10] 4451 	pop	af
   7F4D D1            [10] 4452 	pop	de
   7F4E C1            [10] 4453 	pop	bc
   7F4F                    4454 00128$:
                           4455 ;src/main.c:839: if (actual->muerto && actual->muertes == 0){
   7F4F 21 08 00      [10] 4456 	ld	hl,#0x0008
   7F52 19            [11] 4457 	add	hl,de
   7F53 DD 75 F8      [19] 4458 	ld	-8 (ix),l
   7F56 DD 74 F9      [19] 4459 	ld	-7 (ix),h
   7F59 DD 6E F8      [19] 4460 	ld	l,-8 (ix)
   7F5C DD 66 F9      [19] 4461 	ld	h,-7 (ix)
   7F5F 7E            [ 7] 4462 	ld	a,(hl)
   7F60 B7            [ 4] 4463 	or	a, a
   7F61 CA F7 7F      [10] 4464 	jp	Z,00130$
   7F64 21 09 00      [10] 4465 	ld	hl,#0x0009
   7F67 19            [11] 4466 	add	hl,de
   7F68 DD 75 FA      [19] 4467 	ld	-6 (ix),l
   7F6B DD 74 FB      [19] 4468 	ld	-5 (ix),h
   7F6E DD 6E FA      [19] 4469 	ld	l,-6 (ix)
   7F71 DD 66 FB      [19] 4470 	ld	h,-5 (ix)
   7F74 7E            [ 7] 4471 	ld	a,(hl)
   7F75 B7            [ 4] 4472 	or	a, a
   7F76 C2 F7 7F      [10] 4473 	jp	NZ,00130$
                           4474 ;src/main.c:840: timer = 3;
   7F79 21 03 00      [10] 4475 	ld	hl,#0x0003
   7F7C 22 A3 64      [16] 4476 	ld	(_timer),hl
                           4477 ;src/main.c:841: cambio++;
   7F7F FD 21 A2 64   [14] 4478 	ld	iy,#_cambio
   7F83 FD 34 00      [23] 4479 	inc	0 (iy)
                           4480 ;src/main.c:842: parpadeo = 1;
   7F86 FD 21 A1 64   [14] 4481 	ld	iy,#_parpadeo
   7F8A FD 36 00 01   [19] 4482 	ld	0 (iy),#0x01
                           4483 ;src/main.c:843: borrarEnemigo((*actual).x, (*actual).y);
   7F8E 2E 01         [ 7] 4484 	ld	l, #0x01
   7F90 19            [11] 4485 	add	hl,de
   7F91 DD 75 FE      [19] 4486 	ld	-2 (ix),l
   7F94 DD 74 FF      [19] 4487 	ld	-1 (ix),h
   7F97 DD 6E FE      [19] 4488 	ld	l,-2 (ix)
   7F9A DD 66 FF      [19] 4489 	ld	h,-1 (ix)
   7F9D 46            [ 7] 4490 	ld	b,(hl)
   7F9E 1A            [ 7] 4491 	ld	a,(de)
   7F9F C5            [11] 4492 	push	bc
   7FA0 D5            [11] 4493 	push	de
   7FA1 C5            [11] 4494 	push	bc
   7FA2 33            [ 6] 4495 	inc	sp
   7FA3 F5            [11] 4496 	push	af
   7FA4 33            [ 6] 4497 	inc	sp
   7FA5 CD 2B 69      [17] 4498 	call	_borrarEnemigo
   7FA8 F1            [10] 4499 	pop	af
   7FA9 D1            [10] 4500 	pop	de
   7FAA C1            [10] 4501 	pop	bc
                           4502 ;src/main.c:844: puntuacion_aux = puntuacion;
   7FAB FD 21 73 65   [14] 4503 	ld	iy,#_puntuacion
   7FAF FD 6E 00      [19] 4504 	ld	l,0 (iy)
   7FB2 26 00         [ 7] 4505 	ld	h,#0x00
                           4506 ;src/main.c:845: puntuacion = aumentarPuntuacion(puntuacion_aux);
   7FB4 C5            [11] 4507 	push	bc
   7FB5 D5            [11] 4508 	push	de
   7FB6 E5            [11] 4509 	push	hl
   7FB7 CD 9B 53      [17] 4510 	call	_aumentarPuntuacion
   7FBA F1            [10] 4511 	pop	af
   7FBB D1            [10] 4512 	pop	de
   7FBC C1            [10] 4513 	pop	bc
   7FBD FD 21 73 65   [14] 4514 	ld	iy,#_puntuacion
   7FC1 FD 75 00      [19] 4515 	ld	0 (iy),l
                           4516 ;src/main.c:846: modificarPuntuacion(puntuacion);
   7FC4 FD 21 73 65   [14] 4517 	ld	iy,#_puntuacion
   7FC8 FD 6E 00      [19] 4518 	ld	l,0 (iy)
   7FCB 26 00         [ 7] 4519 	ld	h,#0x00
   7FCD C5            [11] 4520 	push	bc
   7FCE D5            [11] 4521 	push	de
   7FCF E5            [11] 4522 	push	hl
   7FD0 CD 31 52      [17] 4523 	call	_modificarPuntuacion
   7FD3 F1            [10] 4524 	pop	af
   7FD4 D1            [10] 4525 	pop	de
   7FD5 C1            [10] 4526 	pop	bc
                           4527 ;src/main.c:847: actual->mover = NO;
   7FD6 DD 6E F6      [19] 4528 	ld	l,-10 (ix)
   7FD9 DD 66 F7      [19] 4529 	ld	h,-9 (ix)
   7FDC 36 00         [10] 4530 	ld	(hl),#0x00
                           4531 ;src/main.c:848: actual->muertes++;
   7FDE DD 6E FA      [19] 4532 	ld	l,-6 (ix)
   7FE1 DD 66 FB      [19] 4533 	ld	h,-5 (ix)
   7FE4 46            [ 7] 4534 	ld	b,(hl)
   7FE5 04            [ 4] 4535 	inc	b
   7FE6 DD 6E FA      [19] 4536 	ld	l,-6 (ix)
   7FE9 DD 66 FB      [19] 4537 	ld	h,-5 (ix)
   7FEC 70            [ 7] 4538 	ld	(hl),b
                           4539 ;src/main.c:849: actual->x = 0;
   7FED AF            [ 4] 4540 	xor	a, a
   7FEE 12            [ 7] 4541 	ld	(de),a
                           4542 ;src/main.c:850: actual->y = 0;
   7FEF DD 6E FE      [19] 4543 	ld	l,-2 (ix)
   7FF2 DD 66 FF      [19] 4544 	ld	h,-1 (ix)
   7FF5 36 00         [10] 4545 	ld	(hl),#0x00
   7FF7                    4546 00130$:
                           4547 ;src/main.c:852: if(parpadeo && actual->muerto && !actual->xplot){
   7FF7 21 19 00      [10] 4548 	ld	hl,#0x0019
   7FFA 19            [11] 4549 	add	hl,de
   7FFB DD 75 FE      [19] 4550 	ld	-2 (ix),l
   7FFE DD 74 FF      [19] 4551 	ld	-1 (ix),h
   8001 3A A1 64      [13] 4552 	ld	a,(#_parpadeo + 0)
   8004 B7            [ 4] 4553 	or	a, a
   8005 28 1F         [12] 4554 	jr	Z,00140$
   8007 DD 6E F8      [19] 4555 	ld	l,-8 (ix)
   800A DD 66 F9      [19] 4556 	ld	h,-7 (ix)
   800D 7E            [ 7] 4557 	ld	a,(hl)
   800E B7            [ 4] 4558 	or	a, a
   800F 28 15         [12] 4559 	jr	Z,00140$
   8011 DD 6E FE      [19] 4560 	ld	l,-2 (ix)
   8014 DD 66 FF      [19] 4561 	ld	h,-1 (ix)
   8017 7E            [ 7] 4562 	ld	a,(hl)
   8018 B7            [ 4] 4563 	or	a, a
   8019 20 0B         [12] 4564 	jr	NZ,00140$
                           4565 ;src/main.c:853: dibujarExplosion(actual);
   801B C5            [11] 4566 	push	bc
   801C D5            [11] 4567 	push	de
   801D D5            [11] 4568 	push	de
   801E CD 82 68      [17] 4569 	call	_dibujarExplosion
   8021 F1            [10] 4570 	pop	af
   8022 D1            [10] 4571 	pop	de
   8023 C1            [10] 4572 	pop	bc
   8024 18 4E         [12] 4573 	jr	00141$
   8026                    4574 00140$:
                           4575 ;src/main.c:854: }else if(!parpadeo && actual->muerto && cambio<=12 && !actual->xplot){
   8026 3A A1 64      [13] 4576 	ld	a,(#_parpadeo + 0)
   8029 B7            [ 4] 4577 	or	a, a
   802A 20 48         [12] 4578 	jr	NZ,00141$
   802C DD 6E F8      [19] 4579 	ld	l,-8 (ix)
   802F DD 66 F9      [19] 4580 	ld	h,-7 (ix)
   8032 7E            [ 7] 4581 	ld	a,(hl)
   8033 B7            [ 4] 4582 	or	a, a
   8034 28 3E         [12] 4583 	jr	Z,00141$
   8036 3E 0C         [ 7] 4584 	ld	a,#0x0C
   8038 FD 21 A2 64   [14] 4585 	ld	iy,#_cambio
   803C FD 96 00      [19] 4586 	sub	a, 0 (iy)
   803F 38 33         [12] 4587 	jr	C,00141$
   8041 DD 6E FE      [19] 4588 	ld	l,-2 (ix)
   8044 DD 66 FF      [19] 4589 	ld	h,-1 (ix)
   8047 7E            [ 7] 4590 	ld	a,(hl)
   8048 B7            [ 4] 4591 	or	a, a
   8049 20 29         [12] 4592 	jr	NZ,00141$
                           4593 ;src/main.c:855: borrarExplosion((*actual).px, (*actual).py);
   804B DD 6E FC      [19] 4594 	ld	l,-4 (ix)
   804E DD 66 FD      [19] 4595 	ld	h,-3 (ix)
   8051 7E            [ 7] 4596 	ld	a,(hl)
   8052 DD 6E F4      [19] 4597 	ld	l,-12 (ix)
   8055 DD 66 F5      [19] 4598 	ld	h,-11 (ix)
   8058 46            [ 7] 4599 	ld	b,(hl)
   8059 C5            [11] 4600 	push	bc
   805A D5            [11] 4601 	push	de
   805B F5            [11] 4602 	push	af
   805C 33            [ 6] 4603 	inc	sp
   805D C5            [11] 4604 	push	bc
   805E 33            [ 6] 4605 	inc	sp
   805F CD BB 68      [17] 4606 	call	_borrarExplosion
   8062 F1            [10] 4607 	pop	af
   8063 D1            [10] 4608 	pop	de
   8064 C1            [10] 4609 	pop	bc
                           4610 ;src/main.c:856: if(cambio == 12){
   8065 3A A2 64      [13] 4611 	ld	a,(#_cambio + 0)
   8068 D6 0C         [ 7] 4612 	sub	a, #0x0C
   806A 20 08         [12] 4613 	jr	NZ,00141$
                           4614 ;src/main.c:857: actual->xplot = SI;
   806C DD 6E FE      [19] 4615 	ld	l,-2 (ix)
   806F DD 66 FF      [19] 4616 	ld	h,-1 (ix)
   8072 36 01         [10] 4617 	ld	(hl),#0x01
   8074                    4618 00141$:
                           4619 ;src/main.c:860: ++actual;
   8074 21 E3 00      [10] 4620 	ld	hl,#0x00E3
   8077 19            [11] 4621 	add	hl,de
   8078 EB            [ 4] 4622 	ex	de,hl
   8079 C3 FE 7E      [10] 4623 	jp	00144$
   807C                    4624 00146$:
                           4625 ;src/main.c:862: cpct_waitVSYNC();
   807C CD 38 57      [17] 4626 	call	_cpct_waitVSYNC
   807F C3 85 7D      [10] 4627 	jp	00148$
                           4628 	.area _CODE
                           4629 	.area _INITIALIZER
   6574                    4630 __xinit__mapa:
   6574 00 00              4631 	.dw #0x0000
   6576                    4632 __xinit__num_mapa:
   6576 00                 4633 	.db #0x00	; 0
   6577                    4634 __xinit__puntuacion:
   6577 00                 4635 	.db #0x00	; 0
                           4636 	.area _CABS (ABS)
