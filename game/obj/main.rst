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
                             21 	.globl _updateEnemies
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
   6008                      87 _enemy::
   6008                      88 	.ds 1300
   651C                      89 _prota::
   651C                      90 	.ds 8
   6524                      91 _cu::
   6524                      92 	.ds 10
   652E                      93 _i::
   652E                      94 	.ds 1
                             95 ;--------------------------------------------------------
                             96 ; ram data
                             97 ;--------------------------------------------------------
                             98 	.area _INITIALIZED
   65F8                      99 _mapa::
   65F8                     100 	.ds 2
   65FA                     101 _num_mapa::
   65FA                     102 	.ds 1
   65FB                     103 _puntuacion::
   65FB                     104 	.ds 1
   65FC                     105 _vidas::
   65FC                     106 	.ds 1
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
                            127 ;src/main.c:108: cpctm_createTransparentMaskTable(g_tablatrans, 0x0100, M0, 0);
                            128 ;	---------------------------------
                            129 ; Function dummy_cpct_transparentMaskTable0M0_container
                            130 ; ---------------------------------
   43EF                     131 _dummy_cpct_transparentMaskTable0M0_container::
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
                            168 ;src/main.c:111: void dibujarMapa() {
                            169 ;	---------------------------------
                            170 ; Function dibujarMapa
                            171 ; ---------------------------------
   6602                     172 _dibujarMapa::
                            173 ;src/main.c:114: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, p, mapa);
   6602 2A F8 65      [16]  174 	ld	hl,(_mapa)
   6605 E5            [11]  175 	push	hl
   6606 21 F0 C0      [10]  176 	ld	hl,#0xC0F0
   6609 E5            [11]  177 	push	hl
   660A 21 2C 28      [10]  178 	ld	hl,#0x282C
   660D E5            [11]  179 	push	hl
   660E 2E 00         [ 7]  180 	ld	l, #0x00
   6610 E5            [11]  181 	push	hl
   6611 AF            [ 4]  182 	xor	a, a
   6612 F5            [11]  183 	push	af
   6613 33            [ 6]  184 	inc	sp
   6614 CD 8F 54      [17]  185 	call	_cpct_etm_drawTileBox2x4
   6617 C9            [10]  186 	ret
   6618                     187 _mapas:
   6618 C0 10               188 	.dw _g_map1
   661A E0 09               189 	.dw _g_map2
   661C 00 03               190 	.dw _g_map3
   661E                     191 _spawnX:
   661E 00                  192 	.db #0x00	; 0
   661F 24                  193 	.db #0x24	; 36
   6620 47                  194 	.db #0x47	; 71	'G'
   6621 32                  195 	.db #0x32	; 50	'2'
   6622 18                  196 	.db #0x18	; 24
   6623                     197 _spawnY:
   6623 00                  198 	.db #0x00	; 0
   6624 40                  199 	.db #0x40	; 64
   6625 72                  200 	.db #0x72	; 114	'r'
   6626 9A                  201 	.db #0x9A	; 154
   6627 68                  202 	.db #0x68	; 104	'h'
   6628                     203 _patrolX:
   6628 00                  204 	.db #0x00	; 0
   6629 00                  205 	.db #0x00	; 0
   662A 00                  206 	.db #0x00	; 0
   662B 00                  207 	.db #0x00	; 0
   662C 00                  208 	.db #0x00	; 0
   662D 00                  209 	.db #0x00	; 0
   662E 24                  210 	.db #0x24	; 36
   662F 47                  211 	.db #0x47	; 71	'G'
   6630 00                  212 	.db #0x00	; 0
   6631 00                  213 	.db #0x00	; 0
   6632 00                  214 	.db #0x00	; 0
   6633 00                  215 	.db #0x00	; 0
   6634 00                  216 	.db #0x00	; 0
   6635 00                  217 	.db #0x00	; 0
   6636 00                  218 	.db #0x00	; 0
   6637 00                  219 	.db #0x00	; 0
   6638 00                  220 	.db #0x00	; 0
   6639 00                  221 	.db #0x00	; 0
   663A 00                  222 	.db #0x00	; 0
   663B 00                  223 	.db #0x00	; 0
   663C                     224 _patrolY:
   663C 00                  225 	.db #0x00	; 0
   663D 00                  226 	.db #0x00	; 0
   663E 00                  227 	.db #0x00	; 0
   663F 00                  228 	.db #0x00	; 0
   6640 00                  229 	.db #0x00	; 0
   6641 00                  230 	.db #0x00	; 0
   6642 3C                  231 	.db #0x3C	; 60
   6643 84                  232 	.db #0x84	; 132
   6644 00                  233 	.db #0x00	; 0
   6645 00                  234 	.db #0x00	; 0
   6646 00                  235 	.db #0x00	; 0
   6647 00                  236 	.db #0x00	; 0
   6648 00                  237 	.db #0x00	; 0
   6649 00                  238 	.db #0x00	; 0
   664A 00                  239 	.db #0x00	; 0
   664B 00                  240 	.db #0x00	; 0
   664C 00                  241 	.db #0x00	; 0
   664D 00                  242 	.db #0x00	; 0
   664E 00                  243 	.db #0x00	; 0
   664F 00                  244 	.db #0x00	; 0
                            245 ;src/main.c:117: void dibujarProta() {
                            246 ;	---------------------------------
                            247 ; Function dibujarProta
                            248 ; ---------------------------------
   6650                     249 _dibujarProta::
                            250 ;src/main.c:118: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   6650 21 1D 65      [10]  251 	ld	hl, #_prota + 1
   6653 56            [ 7]  252 	ld	d,(hl)
   6654 21 1C 65      [10]  253 	ld	hl, #_prota + 0
   6657 46            [ 7]  254 	ld	b,(hl)
   6658 D5            [11]  255 	push	de
   6659 33            [ 6]  256 	inc	sp
   665A C5            [11]  257 	push	bc
   665B 33            [ 6]  258 	inc	sp
   665C 21 00 C0      [10]  259 	ld	hl,#0xC000
   665F E5            [11]  260 	push	hl
   6660 CD AD 5F      [17]  261 	call	_cpct_getScreenPtr
   6663 EB            [ 4]  262 	ex	de,hl
                            263 ;src/main.c:119: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   6664 ED 4B 20 65   [20]  264 	ld	bc, (#_prota + 4)
   6668 21 00 01      [10]  265 	ld	hl,#_g_tablatrans
   666B E5            [11]  266 	push	hl
   666C 21 07 16      [10]  267 	ld	hl,#0x1607
   666F E5            [11]  268 	push	hl
   6670 D5            [11]  269 	push	de
   6671 C5            [11]  270 	push	bc
   6672 CD CD 5F      [17]  271 	call	_cpct_drawSpriteMaskedAlignedTable
   6675 C9            [10]  272 	ret
                            273 ;src/main.c:122: void borrarProta() {
                            274 ;	---------------------------------
                            275 ; Function borrarProta
                            276 ; ---------------------------------
   6676                     277 _borrarProta::
   6676 DD E5         [15]  278 	push	ix
   6678 DD 21 00 00   [14]  279 	ld	ix,#0
   667C DD 39         [15]  280 	add	ix,sp
   667E F5            [11]  281 	push	af
   667F 3B            [ 6]  282 	dec	sp
                            283 ;src/main.c:126: u8 w = 4 + (prota.px & 1);
   6680 21 1E 65      [10]  284 	ld	hl, #_prota + 2
   6683 4E            [ 7]  285 	ld	c,(hl)
   6684 79            [ 4]  286 	ld	a,c
   6685 E6 01         [ 7]  287 	and	a, #0x01
   6687 47            [ 4]  288 	ld	b,a
   6688 04            [ 4]  289 	inc	b
   6689 04            [ 4]  290 	inc	b
   668A 04            [ 4]  291 	inc	b
   668B 04            [ 4]  292 	inc	b
                            293 ;src/main.c:129: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   668C 21 1F 65      [10]  294 	ld	hl, #_prota + 3
   668F 5E            [ 7]  295 	ld	e,(hl)
   6690 CB 4B         [ 8]  296 	bit	1, e
   6692 28 04         [12]  297 	jr	Z,00103$
   6694 3E 01         [ 7]  298 	ld	a,#0x01
   6696 18 02         [12]  299 	jr	00104$
   6698                     300 00103$:
   6698 3E 00         [ 7]  301 	ld	a,#0x00
   669A                     302 00104$:
   669A C6 06         [ 7]  303 	add	a, #0x06
   669C DD 77 FD      [19]  304 	ld	-3 (ix),a
                            305 ;src/main.c:131: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   669F FD 2A F8 65   [20]  306 	ld	iy,(_mapa)
   66A3 16 00         [ 7]  307 	ld	d,#0x00
   66A5 7B            [ 4]  308 	ld	a,e
   66A6 C6 E8         [ 7]  309 	add	a,#0xE8
   66A8 DD 77 FE      [19]  310 	ld	-2 (ix),a
   66AB 7A            [ 4]  311 	ld	a,d
   66AC CE FF         [ 7]  312 	adc	a,#0xFF
   66AE DD 77 FF      [19]  313 	ld	-1 (ix),a
   66B1 DD 6E FE      [19]  314 	ld	l,-2 (ix)
   66B4 DD 66 FF      [19]  315 	ld	h,-1 (ix)
   66B7 DD CB FF 7E   [20]  316 	bit	7, -1 (ix)
   66BB 28 04         [12]  317 	jr	Z,00105$
   66BD 21 EB FF      [10]  318 	ld	hl,#0xFFEB
   66C0 19            [11]  319 	add	hl,de
   66C1                     320 00105$:
   66C1 CB 2C         [ 8]  321 	sra	h
   66C3 CB 1D         [ 8]  322 	rr	l
   66C5 CB 2C         [ 8]  323 	sra	h
   66C7 CB 1D         [ 8]  324 	rr	l
   66C9 55            [ 4]  325 	ld	d,l
   66CA CB 39         [ 8]  326 	srl	c
   66CC FD E5         [15]  327 	push	iy
   66CE 21 F0 C0      [10]  328 	ld	hl,#0xC0F0
   66D1 E5            [11]  329 	push	hl
   66D2 3E 28         [ 7]  330 	ld	a,#0x28
   66D4 F5            [11]  331 	push	af
   66D5 33            [ 6]  332 	inc	sp
   66D6 DD 7E FD      [19]  333 	ld	a,-3 (ix)
   66D9 F5            [11]  334 	push	af
   66DA 33            [ 6]  335 	inc	sp
   66DB C5            [11]  336 	push	bc
   66DC 33            [ 6]  337 	inc	sp
   66DD D5            [11]  338 	push	de
   66DE 33            [ 6]  339 	inc	sp
   66DF 79            [ 4]  340 	ld	a,c
   66E0 F5            [11]  341 	push	af
   66E1 33            [ 6]  342 	inc	sp
   66E2 CD 8F 54      [17]  343 	call	_cpct_etm_drawTileBox2x4
   66E5 DD F9         [10]  344 	ld	sp, ix
   66E7 DD E1         [14]  345 	pop	ix
   66E9 C9            [10]  346 	ret
                            347 ;src/main.c:134: void redibujarProta() {
                            348 ;	---------------------------------
                            349 ; Function redibujarProta
                            350 ; ---------------------------------
   66EA                     351 _redibujarProta::
                            352 ;src/main.c:135: borrarProta();
   66EA CD 76 66      [17]  353 	call	_borrarProta
                            354 ;src/main.c:136: prota.px = prota.x;
   66ED 01 1E 65      [10]  355 	ld	bc,#_prota + 2
   66F0 3A 1C 65      [13]  356 	ld	a, (#_prota + 0)
   66F3 02            [ 7]  357 	ld	(bc),a
                            358 ;src/main.c:137: prota.py = prota.y;
   66F4 01 1F 65      [10]  359 	ld	bc,#_prota + 3
   66F7 3A 1D 65      [13]  360 	ld	a, (#_prota + 1)
   66FA 02            [ 7]  361 	ld	(bc),a
                            362 ;src/main.c:138: dibujarProta();
   66FB C3 50 66      [10]  363 	jp  _dibujarProta
                            364 ;src/main.c:141: void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
                            365 ;	---------------------------------
                            366 ; Function comprobarTeclado
                            367 ; ---------------------------------
   66FE                     368 _comprobarTeclado::
                            369 ;src/main.c:142: cpct_scanKeyboard_if();
   66FE CD E7 55      [17]  370 	call	_cpct_scanKeyboard_if
                            371 ;src/main.c:144: if (cpct_isAnyKeyPressed()) {
   6701 CD DA 55      [17]  372 	call	_cpct_isAnyKeyPressed
   6704 7D            [ 4]  373 	ld	a,l
   6705 B7            [ 4]  374 	or	a, a
   6706 C8            [11]  375 	ret	Z
                            376 ;src/main.c:145: if (cpct_isKeyPressed(Key_CursorLeft)){
   6707 21 01 01      [10]  377 	ld	hl,#0x0101
   670A CD AE 53      [17]  378 	call	_cpct_isKeyPressed
   670D 7D            [ 4]  379 	ld	a,l
   670E B7            [ 4]  380 	or	a, a
                            381 ;src/main.c:146: moverIzquierda();
   670F C2 D4 7B      [10]  382 	jp	NZ,_moverIzquierda
                            383 ;src/main.c:147: }else if (cpct_isKeyPressed(Key_CursorRight)){
   6712 21 00 02      [10]  384 	ld	hl,#0x0200
   6715 CD AE 53      [17]  385 	call	_cpct_isKeyPressed
   6718 7D            [ 4]  386 	ld	a,l
   6719 B7            [ 4]  387 	or	a, a
                            388 ;src/main.c:148: moverDerecha();
   671A C2 F9 7B      [10]  389 	jp	NZ,_moverDerecha
                            390 ;src/main.c:149: }else if (cpct_isKeyPressed(Key_CursorUp)){
   671D 21 00 01      [10]  391 	ld	hl,#0x0100
   6720 CD AE 53      [17]  392 	call	_cpct_isKeyPressed
   6723 7D            [ 4]  393 	ld	a,l
   6724 B7            [ 4]  394 	or	a, a
                            395 ;src/main.c:150: moverArriba();
   6725 C2 3E 7C      [10]  396 	jp	NZ,_moverArriba
                            397 ;src/main.c:151: }else if (cpct_isKeyPressed(Key_CursorDown)){
   6728 21 00 04      [10]  398 	ld	hl,#0x0400
   672B CD AE 53      [17]  399 	call	_cpct_isKeyPressed
   672E 7D            [ 4]  400 	ld	a,l
   672F B7            [ 4]  401 	or	a, a
                            402 ;src/main.c:152: moverAbajo();
   6730 C2 62 7C      [10]  403 	jp	NZ,_moverAbajo
                            404 ;src/main.c:153: }else if (cpct_isKeyPressed(Key_Space)){
   6733 21 05 80      [10]  405 	ld	hl,#0x8005
   6736 CD AE 53      [17]  406 	call	_cpct_isKeyPressed
   6739 7D            [ 4]  407 	ld	a,l
   673A B7            [ 4]  408 	or	a, a
   673B C8            [11]  409 	ret	Z
                            410 ;src/main.c:154: lanzarCuchillo(cu, prota, mapa, g_tablatrans);
   673C 21 08 00      [10]  411 	ld	hl, #8
   673F 39            [11]  412 	add	hl, sp
   6740 4E            [ 7]  413 	ld	c, (hl)
   6741 23            [ 6]  414 	inc	hl
   6742 46            [ 7]  415 	ld	b, (hl)
   6743 C5            [11]  416 	push	bc
   6744 21 08 00      [10]  417 	ld	hl, #8
   6747 39            [11]  418 	add	hl, sp
   6748 4E            [ 7]  419 	ld	c, (hl)
   6749 23            [ 6]  420 	inc	hl
   674A 46            [ 7]  421 	ld	b, (hl)
   674B C5            [11]  422 	push	bc
   674C 21 08 00      [10]  423 	ld	hl, #8
   674F 39            [11]  424 	add	hl, sp
   6750 4E            [ 7]  425 	ld	c, (hl)
   6751 23            [ 6]  426 	inc	hl
   6752 46            [ 7]  427 	ld	b, (hl)
   6753 C5            [11]  428 	push	bc
   6754 21 08 00      [10]  429 	ld	hl, #8
   6757 39            [11]  430 	add	hl, sp
   6758 4E            [ 7]  431 	ld	c, (hl)
   6759 23            [ 6]  432 	inc	hl
   675A 46            [ 7]  433 	ld	b, (hl)
   675B C5            [11]  434 	push	bc
   675C CD 6C 40      [17]  435 	call	_lanzarCuchillo
   675F 21 08 00      [10]  436 	ld	hl,#8
   6762 39            [11]  437 	add	hl,sp
   6763 F9            [ 6]  438 	ld	sp,hl
   6764 C9            [10]  439 	ret
                            440 ;src/main.c:159: u8 checkCollision(u8 direction) { // check optimization
                            441 ;	---------------------------------
                            442 ; Function checkCollision
                            443 ; ---------------------------------
   6765                     444 _checkCollision::
   6765 DD E5         [15]  445 	push	ix
   6767 DD 21 00 00   [14]  446 	ld	ix,#0
   676B DD 39         [15]  447 	add	ix,sp
   676D F5            [11]  448 	push	af
                            449 ;src/main.c:160: u8 *headTile=0, *feetTile=0, *waistTile=0;
   676E 21 00 00      [10]  450 	ld	hl,#0x0000
   6771 E3            [19]  451 	ex	(sp), hl
   6772 11 00 00      [10]  452 	ld	de,#0x0000
   6775 01 00 00      [10]  453 	ld	bc,#0x0000
                            454 ;src/main.c:162: switch (direction) {
   6778 3E 03         [ 7]  455 	ld	a,#0x03
   677A DD 96 04      [19]  456 	sub	a, 4 (ix)
   677D DA B9 68      [10]  457 	jp	C,00105$
   6780 DD 5E 04      [19]  458 	ld	e,4 (ix)
   6783 16 00         [ 7]  459 	ld	d,#0x00
   6785 21 8C 67      [10]  460 	ld	hl,#00124$
   6788 19            [11]  461 	add	hl,de
   6789 19            [11]  462 	add	hl,de
   678A 19            [11]  463 	add	hl,de
   678B E9            [ 4]  464 	jp	(hl)
   678C                     465 00124$:
   678C C3 98 67      [10]  466 	jp	00101$
   678F C3 F1 67      [10]  467 	jp	00102$
   6792 C3 41 68      [10]  468 	jp	00103$
   6795 C3 7E 68      [10]  469 	jp	00104$
                            470 ;src/main.c:163: case 0:
   6798                     471 00101$:
                            472 ;src/main.c:164: headTile  = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y);
   6798 21 1D 65      [10]  473 	ld	hl, #(_prota + 0x0001) + 0
   679B 4E            [ 7]  474 	ld	c,(hl)
   679C 3A 1C 65      [13]  475 	ld	a, (#_prota + 0)
   679F 47            [ 4]  476 	ld	b,a
   67A0 04            [ 4]  477 	inc	b
   67A1 04            [ 4]  478 	inc	b
   67A2 04            [ 4]  479 	inc	b
   67A3 04            [ 4]  480 	inc	b
   67A4 79            [ 4]  481 	ld	a,c
   67A5 F5            [11]  482 	push	af
   67A6 33            [ 6]  483 	inc	sp
   67A7 C5            [11]  484 	push	bc
   67A8 33            [ 6]  485 	inc	sp
   67A9 2A F8 65      [16]  486 	ld	hl,(_mapa)
   67AC E5            [11]  487 	push	hl
   67AD CD C4 4A      [17]  488 	call	_getTilePtr
   67B0 F1            [10]  489 	pop	af
   67B1 F1            [10]  490 	pop	af
   67B2 33            [ 6]  491 	inc	sp
   67B3 33            [ 6]  492 	inc	sp
   67B4 E5            [11]  493 	push	hl
                            494 ;src/main.c:165: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   67B5 3A 1D 65      [13]  495 	ld	a, (#(_prota + 0x0001) + 0)
   67B8 C6 14         [ 7]  496 	add	a, #0x14
   67BA 4F            [ 4]  497 	ld	c,a
   67BB 21 1C 65      [10]  498 	ld	hl, #_prota + 0
   67BE 46            [ 7]  499 	ld	b,(hl)
   67BF 04            [ 4]  500 	inc	b
   67C0 04            [ 4]  501 	inc	b
   67C1 04            [ 4]  502 	inc	b
   67C2 04            [ 4]  503 	inc	b
   67C3 79            [ 4]  504 	ld	a,c
   67C4 F5            [11]  505 	push	af
   67C5 33            [ 6]  506 	inc	sp
   67C6 C5            [11]  507 	push	bc
   67C7 33            [ 6]  508 	inc	sp
   67C8 2A F8 65      [16]  509 	ld	hl,(_mapa)
   67CB E5            [11]  510 	push	hl
   67CC CD C4 4A      [17]  511 	call	_getTilePtr
   67CF F1            [10]  512 	pop	af
   67D0 F1            [10]  513 	pop	af
   67D1 EB            [ 4]  514 	ex	de,hl
                            515 ;src/main.c:166: waistTile = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   67D2 3A 1D 65      [13]  516 	ld	a, (#(_prota + 0x0001) + 0)
   67D5 C6 0B         [ 7]  517 	add	a, #0x0B
   67D7 47            [ 4]  518 	ld	b,a
   67D8 3A 1C 65      [13]  519 	ld	a, (#_prota + 0)
   67DB C6 04         [ 7]  520 	add	a, #0x04
   67DD D5            [11]  521 	push	de
   67DE C5            [11]  522 	push	bc
   67DF 33            [ 6]  523 	inc	sp
   67E0 F5            [11]  524 	push	af
   67E1 33            [ 6]  525 	inc	sp
   67E2 2A F8 65      [16]  526 	ld	hl,(_mapa)
   67E5 E5            [11]  527 	push	hl
   67E6 CD C4 4A      [17]  528 	call	_getTilePtr
   67E9 F1            [10]  529 	pop	af
   67EA F1            [10]  530 	pop	af
   67EB 4D            [ 4]  531 	ld	c,l
   67EC 44            [ 4]  532 	ld	b,h
   67ED D1            [10]  533 	pop	de
                            534 ;src/main.c:167: break;
   67EE C3 B9 68      [10]  535 	jp	00105$
                            536 ;src/main.c:168: case 1:
   67F1                     537 00102$:
                            538 ;src/main.c:169: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
   67F1 21 1D 65      [10]  539 	ld	hl, #(_prota + 0x0001) + 0
   67F4 56            [ 7]  540 	ld	d,(hl)
   67F5 21 1C 65      [10]  541 	ld	hl, #_prota + 0
   67F8 46            [ 7]  542 	ld	b,(hl)
   67F9 05            [ 4]  543 	dec	b
   67FA D5            [11]  544 	push	de
   67FB 33            [ 6]  545 	inc	sp
   67FC C5            [11]  546 	push	bc
   67FD 33            [ 6]  547 	inc	sp
   67FE 2A F8 65      [16]  548 	ld	hl,(_mapa)
   6801 E5            [11]  549 	push	hl
   6802 CD C4 4A      [17]  550 	call	_getTilePtr
   6805 F1            [10]  551 	pop	af
   6806 F1            [10]  552 	pop	af
   6807 33            [ 6]  553 	inc	sp
   6808 33            [ 6]  554 	inc	sp
   6809 E5            [11]  555 	push	hl
                            556 ;src/main.c:170: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
   680A 3A 1D 65      [13]  557 	ld	a, (#(_prota + 0x0001) + 0)
   680D C6 14         [ 7]  558 	add	a, #0x14
   680F 57            [ 4]  559 	ld	d,a
   6810 21 1C 65      [10]  560 	ld	hl, #_prota + 0
   6813 46            [ 7]  561 	ld	b,(hl)
   6814 05            [ 4]  562 	dec	b
   6815 D5            [11]  563 	push	de
   6816 33            [ 6]  564 	inc	sp
   6817 C5            [11]  565 	push	bc
   6818 33            [ 6]  566 	inc	sp
   6819 2A F8 65      [16]  567 	ld	hl,(_mapa)
   681C E5            [11]  568 	push	hl
   681D CD C4 4A      [17]  569 	call	_getTilePtr
   6820 F1            [10]  570 	pop	af
   6821 F1            [10]  571 	pop	af
   6822 EB            [ 4]  572 	ex	de,hl
                            573 ;src/main.c:171: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
   6823 3A 1D 65      [13]  574 	ld	a, (#(_prota + 0x0001) + 0)
   6826 C6 0B         [ 7]  575 	add	a, #0x0B
   6828 47            [ 4]  576 	ld	b,a
   6829 3A 1C 65      [13]  577 	ld	a, (#_prota + 0)
   682C C6 FF         [ 7]  578 	add	a,#0xFF
   682E D5            [11]  579 	push	de
   682F C5            [11]  580 	push	bc
   6830 33            [ 6]  581 	inc	sp
   6831 F5            [11]  582 	push	af
   6832 33            [ 6]  583 	inc	sp
   6833 2A F8 65      [16]  584 	ld	hl,(_mapa)
   6836 E5            [11]  585 	push	hl
   6837 CD C4 4A      [17]  586 	call	_getTilePtr
   683A F1            [10]  587 	pop	af
   683B F1            [10]  588 	pop	af
   683C 4D            [ 4]  589 	ld	c,l
   683D 44            [ 4]  590 	ld	b,h
   683E D1            [10]  591 	pop	de
                            592 ;src/main.c:172: break;
   683F 18 78         [12]  593 	jr	00105$
                            594 ;src/main.c:173: case 2:
   6841                     595 00103$:
                            596 ;src/main.c:174: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
   6841 3A 1D 65      [13]  597 	ld	a, (#(_prota + 0x0001) + 0)
   6844 C6 FE         [ 7]  598 	add	a,#0xFE
   6846 21 1C 65      [10]  599 	ld	hl, #_prota + 0
   6849 56            [ 7]  600 	ld	d,(hl)
   684A C5            [11]  601 	push	bc
   684B F5            [11]  602 	push	af
   684C 33            [ 6]  603 	inc	sp
   684D D5            [11]  604 	push	de
   684E 33            [ 6]  605 	inc	sp
   684F 2A F8 65      [16]  606 	ld	hl,(_mapa)
   6852 E5            [11]  607 	push	hl
   6853 CD C4 4A      [17]  608 	call	_getTilePtr
   6856 F1            [10]  609 	pop	af
   6857 F1            [10]  610 	pop	af
   6858 C1            [10]  611 	pop	bc
   6859 33            [ 6]  612 	inc	sp
   685A 33            [ 6]  613 	inc	sp
   685B E5            [11]  614 	push	hl
                            615 ;src/main.c:175: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
   685C 21 1D 65      [10]  616 	ld	hl, #(_prota + 0x0001) + 0
   685F 56            [ 7]  617 	ld	d,(hl)
   6860 15            [ 4]  618 	dec	d
   6861 15            [ 4]  619 	dec	d
   6862 3A 1C 65      [13]  620 	ld	a, (#_prota + 0)
   6865 C6 03         [ 7]  621 	add	a, #0x03
   6867 C5            [11]  622 	push	bc
   6868 D5            [11]  623 	push	de
   6869 33            [ 6]  624 	inc	sp
   686A F5            [11]  625 	push	af
   686B 33            [ 6]  626 	inc	sp
   686C 2A F8 65      [16]  627 	ld	hl,(_mapa)
   686F E5            [11]  628 	push	hl
   6870 CD C4 4A      [17]  629 	call	_getTilePtr
   6873 F1            [10]  630 	pop	af
   6874 F1            [10]  631 	pop	af
   6875 EB            [ 4]  632 	ex	de,hl
   6876 C1            [10]  633 	pop	bc
                            634 ;src/main.c:176: *waistTile = 0;
   6877 21 00 00      [10]  635 	ld	hl,#0x0000
   687A 36 00         [10]  636 	ld	(hl),#0x00
                            637 ;src/main.c:177: break;
   687C 18 3B         [12]  638 	jr	00105$
                            639 ;src/main.c:178: case 3:
   687E                     640 00104$:
                            641 ;src/main.c:179: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
   687E 3A 1D 65      [13]  642 	ld	a, (#(_prota + 0x0001) + 0)
   6881 C6 16         [ 7]  643 	add	a, #0x16
   6883 21 1C 65      [10]  644 	ld	hl, #_prota + 0
   6886 56            [ 7]  645 	ld	d,(hl)
   6887 C5            [11]  646 	push	bc
   6888 F5            [11]  647 	push	af
   6889 33            [ 6]  648 	inc	sp
   688A D5            [11]  649 	push	de
   688B 33            [ 6]  650 	inc	sp
   688C 2A F8 65      [16]  651 	ld	hl,(_mapa)
   688F E5            [11]  652 	push	hl
   6890 CD C4 4A      [17]  653 	call	_getTilePtr
   6893 F1            [10]  654 	pop	af
   6894 F1            [10]  655 	pop	af
   6895 C1            [10]  656 	pop	bc
   6896 33            [ 6]  657 	inc	sp
   6897 33            [ 6]  658 	inc	sp
   6898 E5            [11]  659 	push	hl
                            660 ;src/main.c:180: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   6899 3A 1D 65      [13]  661 	ld	a, (#(_prota + 0x0001) + 0)
   689C C6 16         [ 7]  662 	add	a, #0x16
   689E 57            [ 4]  663 	ld	d,a
   689F 3A 1C 65      [13]  664 	ld	a, (#_prota + 0)
   68A2 C6 03         [ 7]  665 	add	a, #0x03
   68A4 C5            [11]  666 	push	bc
   68A5 D5            [11]  667 	push	de
   68A6 33            [ 6]  668 	inc	sp
   68A7 F5            [11]  669 	push	af
   68A8 33            [ 6]  670 	inc	sp
   68A9 2A F8 65      [16]  671 	ld	hl,(_mapa)
   68AC E5            [11]  672 	push	hl
   68AD CD C4 4A      [17]  673 	call	_getTilePtr
   68B0 F1            [10]  674 	pop	af
   68B1 F1            [10]  675 	pop	af
   68B2 EB            [ 4]  676 	ex	de,hl
   68B3 C1            [10]  677 	pop	bc
                            678 ;src/main.c:181: *waistTile = 0;
   68B4 21 00 00      [10]  679 	ld	hl,#0x0000
   68B7 36 00         [10]  680 	ld	(hl),#0x00
                            681 ;src/main.c:183: }
   68B9                     682 00105$:
                            683 ;src/main.c:185: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   68B9 E1            [10]  684 	pop	hl
   68BA E5            [11]  685 	push	hl
   68BB 6E            [ 7]  686 	ld	l,(hl)
   68BC 3E 02         [ 7]  687 	ld	a,#0x02
   68BE 95            [ 4]  688 	sub	a, l
   68BF 38 0E         [12]  689 	jr	C,00106$
   68C1 1A            [ 7]  690 	ld	a,(de)
   68C2 5F            [ 4]  691 	ld	e,a
   68C3 3E 02         [ 7]  692 	ld	a,#0x02
   68C5 93            [ 4]  693 	sub	a, e
   68C6 38 07         [12]  694 	jr	C,00106$
   68C8 0A            [ 7]  695 	ld	a,(bc)
   68C9 4F            [ 4]  696 	ld	c,a
   68CA 3E 02         [ 7]  697 	ld	a,#0x02
   68CC 91            [ 4]  698 	sub	a, c
   68CD 30 04         [12]  699 	jr	NC,00107$
   68CF                     700 00106$:
                            701 ;src/main.c:186: return 1;
   68CF 2E 01         [ 7]  702 	ld	l,#0x01
   68D1 18 02         [12]  703 	jr	00110$
   68D3                     704 00107$:
                            705 ;src/main.c:188: return 0;
   68D3 2E 00         [ 7]  706 	ld	l,#0x00
   68D5                     707 00110$:
   68D5 DD F9         [10]  708 	ld	sp, ix
   68D7 DD E1         [14]  709 	pop	ix
   68D9 C9            [10]  710 	ret
                            711 ;src/main.c:191: void dibujarEnemigo(TEnemy *enemy) {
                            712 ;	---------------------------------
                            713 ; Function dibujarEnemigo
                            714 ; ---------------------------------
   68DA                     715 _dibujarEnemigo::
   68DA DD E5         [15]  716 	push	ix
   68DC DD 21 00 00   [14]  717 	ld	ix,#0
   68E0 DD 39         [15]  718 	add	ix,sp
                            719 ;src/main.c:192: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   68E2 DD 4E 04      [19]  720 	ld	c,4 (ix)
   68E5 DD 46 05      [19]  721 	ld	b,5 (ix)
   68E8 69            [ 4]  722 	ld	l, c
   68E9 60            [ 4]  723 	ld	h, b
   68EA 23            [ 6]  724 	inc	hl
   68EB 56            [ 7]  725 	ld	d,(hl)
   68EC 0A            [ 7]  726 	ld	a,(bc)
   68ED C5            [11]  727 	push	bc
   68EE D5            [11]  728 	push	de
   68EF 33            [ 6]  729 	inc	sp
   68F0 F5            [11]  730 	push	af
   68F1 33            [ 6]  731 	inc	sp
   68F2 21 00 C0      [10]  732 	ld	hl,#0xC000
   68F5 E5            [11]  733 	push	hl
   68F6 CD AD 5F      [17]  734 	call	_cpct_getScreenPtr
   68F9 EB            [ 4]  735 	ex	de,hl
                            736 ;src/main.c:193: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   68FA E1            [10]  737 	pop	hl
   68FB 01 04 00      [10]  738 	ld	bc, #0x0004
   68FE 09            [11]  739 	add	hl, bc
   68FF 4E            [ 7]  740 	ld	c,(hl)
   6900 23            [ 6]  741 	inc	hl
   6901 46            [ 7]  742 	ld	b,(hl)
   6902 21 00 01      [10]  743 	ld	hl,#_g_tablatrans
   6905 E5            [11]  744 	push	hl
   6906 21 04 16      [10]  745 	ld	hl,#0x1604
   6909 E5            [11]  746 	push	hl
   690A D5            [11]  747 	push	de
   690B C5            [11]  748 	push	bc
   690C CD CD 5F      [17]  749 	call	_cpct_drawSpriteMaskedAlignedTable
   690F DD E1         [14]  750 	pop	ix
   6911 C9            [10]  751 	ret
                            752 ;src/main.c:196: void dibujarExplosion(TEnemy *enemy) {
                            753 ;	---------------------------------
                            754 ; Function dibujarExplosion
                            755 ; ---------------------------------
   6912                     756 _dibujarExplosion::
   6912 DD E5         [15]  757 	push	ix
   6914 DD 21 00 00   [14]  758 	ld	ix,#0
   6918 DD 39         [15]  759 	add	ix,sp
                            760 ;src/main.c:197: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   691A DD 4E 04      [19]  761 	ld	c,4 (ix)
   691D DD 46 05      [19]  762 	ld	b,5 (ix)
   6920 69            [ 4]  763 	ld	l, c
   6921 60            [ 4]  764 	ld	h, b
   6922 23            [ 6]  765 	inc	hl
   6923 56            [ 7]  766 	ld	d,(hl)
   6924 0A            [ 7]  767 	ld	a,(bc)
   6925 47            [ 4]  768 	ld	b,a
   6926 D5            [11]  769 	push	de
   6927 33            [ 6]  770 	inc	sp
   6928 C5            [11]  771 	push	bc
   6929 33            [ 6]  772 	inc	sp
   692A 21 00 C0      [10]  773 	ld	hl,#0xC000
   692D E5            [11]  774 	push	hl
   692E CD AD 5F      [17]  775 	call	_cpct_getScreenPtr
   6931 4D            [ 4]  776 	ld	c,l
   6932 44            [ 4]  777 	ld	b,h
                            778 ;src/main.c:198: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   6933 11 00 01      [10]  779 	ld	de,#_g_tablatrans+0
   6936 D5            [11]  780 	push	de
   6937 21 04 16      [10]  781 	ld	hl,#0x1604
   693A E5            [11]  782 	push	hl
   693B C5            [11]  783 	push	bc
   693C 21 70 19      [10]  784 	ld	hl,#_g_explosion
   693F E5            [11]  785 	push	hl
   6940 CD CD 5F      [17]  786 	call	_cpct_drawSpriteMaskedAlignedTable
   6943 DD E1         [14]  787 	pop	ix
   6945 C9            [10]  788 	ret
                            789 ;src/main.c:201: void borrarExplosion() {
                            790 ;	---------------------------------
                            791 ; Function borrarExplosion
                            792 ; ---------------------------------
   6946                     793 _borrarExplosion::
   6946 DD E5         [15]  794 	push	ix
   6948 DD 21 00 00   [14]  795 	ld	ix,#0
   694C DD 39         [15]  796 	add	ix,sp
   694E F5            [11]  797 	push	af
   694F 3B            [ 6]  798 	dec	sp
                            799 ;src/main.c:204: u8 w = 4 + (enemy->px & 1);
   6950 21 0A 60      [10]  800 	ld	hl, #_enemy + 2
   6953 4E            [ 7]  801 	ld	c,(hl)
   6954 79            [ 4]  802 	ld	a,c
   6955 E6 01         [ 7]  803 	and	a, #0x01
   6957 47            [ 4]  804 	ld	b,a
   6958 04            [ 4]  805 	inc	b
   6959 04            [ 4]  806 	inc	b
   695A 04            [ 4]  807 	inc	b
   695B 04            [ 4]  808 	inc	b
                            809 ;src/main.c:207: u8 h = 6 + (enemy->py & 2 ? 1 : 0);
   695C 21 0B 60      [10]  810 	ld	hl, #_enemy + 3
   695F 5E            [ 7]  811 	ld	e,(hl)
   6960 CB 4B         [ 8]  812 	bit	1, e
   6962 28 04         [12]  813 	jr	Z,00103$
   6964 3E 01         [ 7]  814 	ld	a,#0x01
   6966 18 02         [12]  815 	jr	00104$
   6968                     816 00103$:
   6968 3E 00         [ 7]  817 	ld	a,#0x00
   696A                     818 00104$:
   696A C6 06         [ 7]  819 	add	a, #0x06
   696C DD 77 FD      [19]  820 	ld	-3 (ix),a
                            821 ;src/main.c:209: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   696F FD 2A F8 65   [20]  822 	ld	iy,(_mapa)
   6973 16 00         [ 7]  823 	ld	d,#0x00
   6975 7B            [ 4]  824 	ld	a,e
   6976 C6 E8         [ 7]  825 	add	a,#0xE8
   6978 DD 77 FE      [19]  826 	ld	-2 (ix),a
   697B 7A            [ 4]  827 	ld	a,d
   697C CE FF         [ 7]  828 	adc	a,#0xFF
   697E DD 77 FF      [19]  829 	ld	-1 (ix),a
   6981 DD 6E FE      [19]  830 	ld	l,-2 (ix)
   6984 DD 66 FF      [19]  831 	ld	h,-1 (ix)
   6987 DD CB FF 7E   [20]  832 	bit	7, -1 (ix)
   698B 28 04         [12]  833 	jr	Z,00105$
   698D 21 EB FF      [10]  834 	ld	hl,#0xFFEB
   6990 19            [11]  835 	add	hl,de
   6991                     836 00105$:
   6991 CB 2C         [ 8]  837 	sra	h
   6993 CB 1D         [ 8]  838 	rr	l
   6995 CB 2C         [ 8]  839 	sra	h
   6997 CB 1D         [ 8]  840 	rr	l
   6999 55            [ 4]  841 	ld	d,l
   699A CB 39         [ 8]  842 	srl	c
   699C FD E5         [15]  843 	push	iy
   699E 21 F0 C0      [10]  844 	ld	hl,#0xC0F0
   69A1 E5            [11]  845 	push	hl
   69A2 3E 28         [ 7]  846 	ld	a,#0x28
   69A4 F5            [11]  847 	push	af
   69A5 33            [ 6]  848 	inc	sp
   69A6 DD 7E FD      [19]  849 	ld	a,-3 (ix)
   69A9 F5            [11]  850 	push	af
   69AA 33            [ 6]  851 	inc	sp
   69AB C5            [11]  852 	push	bc
   69AC 33            [ 6]  853 	inc	sp
   69AD D5            [11]  854 	push	de
   69AE 33            [ 6]  855 	inc	sp
   69AF 79            [ 4]  856 	ld	a,c
   69B0 F5            [11]  857 	push	af
   69B1 33            [ 6]  858 	inc	sp
   69B2 CD 8F 54      [17]  859 	call	_cpct_etm_drawTileBox2x4
   69B5 DD F9         [10]  860 	ld	sp, ix
   69B7 DD E1         [14]  861 	pop	ix
   69B9 C9            [10]  862 	ret
                            863 ;src/main.c:213: void borrarEnemigo(u8 x, u8 y) {
                            864 ;	---------------------------------
                            865 ; Function borrarEnemigo
                            866 ; ---------------------------------
   69BA                     867 _borrarEnemigo::
   69BA DD E5         [15]  868 	push	ix
   69BC DD 21 00 00   [14]  869 	ld	ix,#0
   69C0 DD 39         [15]  870 	add	ix,sp
   69C2 F5            [11]  871 	push	af
   69C3 F5            [11]  872 	push	af
                            873 ;src/main.c:217: u8 w = 4 + (x & 1);
   69C4 DD 7E 04      [19]  874 	ld	a,4 (ix)
   69C7 E6 01         [ 7]  875 	and	a, #0x01
   69C9 5F            [ 4]  876 	ld	e,a
   69CA 1C            [ 4]  877 	inc	e
   69CB 1C            [ 4]  878 	inc	e
   69CC 1C            [ 4]  879 	inc	e
   69CD 1C            [ 4]  880 	inc	e
                            881 ;src/main.c:220: u8 h = 6 + (y & 3 ? 1 : 0);
   69CE DD 7E 05      [19]  882 	ld	a,5 (ix)
   69D1 E6 03         [ 7]  883 	and	a, #0x03
   69D3 28 04         [12]  884 	jr	Z,00103$
   69D5 3E 01         [ 7]  885 	ld	a,#0x01
   69D7 18 02         [12]  886 	jr	00104$
   69D9                     887 00103$:
   69D9 3E 00         [ 7]  888 	ld	a,#0x00
   69DB                     889 00104$:
   69DB C6 06         [ 7]  890 	add	a, #0x06
   69DD 57            [ 4]  891 	ld	d,a
                            892 ;src/main.c:222: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   69DE 2A F8 65      [16]  893 	ld	hl,(_mapa)
   69E1 DD 75 FE      [19]  894 	ld	-2 (ix),l
   69E4 DD 74 FF      [19]  895 	ld	-1 (ix),h
   69E7 DD 4E 05      [19]  896 	ld	c,5 (ix)
   69EA 06 00         [ 7]  897 	ld	b,#0x00
   69EC 79            [ 4]  898 	ld	a,c
   69ED C6 E8         [ 7]  899 	add	a,#0xE8
   69EF DD 77 FC      [19]  900 	ld	-4 (ix),a
   69F2 78            [ 4]  901 	ld	a,b
   69F3 CE FF         [ 7]  902 	adc	a,#0xFF
   69F5 DD 77 FD      [19]  903 	ld	-3 (ix),a
   69F8 E1            [10]  904 	pop	hl
   69F9 E5            [11]  905 	push	hl
   69FA DD CB FD 7E   [20]  906 	bit	7, -3 (ix)
   69FE 28 04         [12]  907 	jr	Z,00105$
   6A00 21 EB FF      [10]  908 	ld	hl,#0xFFEB
   6A03 09            [11]  909 	add	hl,bc
   6A04                     910 00105$:
   6A04 CB 2C         [ 8]  911 	sra	h
   6A06 CB 1D         [ 8]  912 	rr	l
   6A08 CB 2C         [ 8]  913 	sra	h
   6A0A CB 1D         [ 8]  914 	rr	l
   6A0C 45            [ 4]  915 	ld	b,l
   6A0D DD 4E 04      [19]  916 	ld	c,4 (ix)
   6A10 CB 39         [ 8]  917 	srl	c
   6A12 DD 6E FE      [19]  918 	ld	l,-2 (ix)
   6A15 DD 66 FF      [19]  919 	ld	h,-1 (ix)
   6A18 E5            [11]  920 	push	hl
   6A19 21 F0 C0      [10]  921 	ld	hl,#0xC0F0
   6A1C E5            [11]  922 	push	hl
   6A1D 3E 28         [ 7]  923 	ld	a,#0x28
   6A1F F5            [11]  924 	push	af
   6A20 33            [ 6]  925 	inc	sp
   6A21 D5            [11]  926 	push	de
   6A22 C5            [11]  927 	push	bc
   6A23 CD 8F 54      [17]  928 	call	_cpct_etm_drawTileBox2x4
                            929 ;src/main.c:224: enemy->mover = NO;
   6A26 21 0E 60      [10]  930 	ld	hl,#(_enemy + 0x0006)
   6A29 36 00         [10]  931 	ld	(hl),#0x00
   6A2B DD F9         [10]  932 	ld	sp, ix
   6A2D DD E1         [14]  933 	pop	ix
   6A2F C9            [10]  934 	ret
                            935 ;src/main.c:227: void redibujarEnemigo(u8 x, u8 y, TEnemy *enemy) {
                            936 ;	---------------------------------
                            937 ; Function redibujarEnemigo
                            938 ; ---------------------------------
   6A30                     939 _redibujarEnemigo::
   6A30 DD E5         [15]  940 	push	ix
   6A32 DD 21 00 00   [14]  941 	ld	ix,#0
   6A36 DD 39         [15]  942 	add	ix,sp
                            943 ;src/main.c:229: enemy->px = enemy->x;
   6A38 DD 4E 06      [19]  944 	ld	c,6 (ix)
   6A3B DD 46 07      [19]  945 	ld	b,7 (ix)
   6A3E 59            [ 4]  946 	ld	e, c
   6A3F 50            [ 4]  947 	ld	d, b
   6A40 13            [ 6]  948 	inc	de
   6A41 13            [ 6]  949 	inc	de
   6A42 0A            [ 7]  950 	ld	a,(bc)
   6A43 12            [ 7]  951 	ld	(de),a
                            952 ;src/main.c:230: enemy->py = enemy->y;
   6A44 59            [ 4]  953 	ld	e, c
   6A45 50            [ 4]  954 	ld	d, b
   6A46 13            [ 6]  955 	inc	de
   6A47 13            [ 6]  956 	inc	de
   6A48 13            [ 6]  957 	inc	de
   6A49 69            [ 4]  958 	ld	l, c
   6A4A 60            [ 4]  959 	ld	h, b
   6A4B 23            [ 6]  960 	inc	hl
   6A4C 7E            [ 7]  961 	ld	a,(hl)
   6A4D 12            [ 7]  962 	ld	(de),a
                            963 ;src/main.c:231: dibujarEnemigo(enemy);
   6A4E C5            [11]  964 	push	bc
   6A4F CD DA 68      [17]  965 	call	_dibujarEnemigo
   6A52 F1            [10]  966 	pop	af
   6A53 DD E1         [14]  967 	pop	ix
   6A55 C9            [10]  968 	ret
                            969 ;src/main.c:234: u8 checkEnemyCollision(u8 direction, TEnemy *enemy){
                            970 ;	---------------------------------
                            971 ; Function checkEnemyCollision
                            972 ; ---------------------------------
   6A56                     973 _checkEnemyCollision::
   6A56 DD E5         [15]  974 	push	ix
   6A58 DD 21 00 00   [14]  975 	ld	ix,#0
   6A5C DD 39         [15]  976 	add	ix,sp
   6A5E 21 F7 FF      [10]  977 	ld	hl,#-9
   6A61 39            [11]  978 	add	hl,sp
   6A62 F9            [ 6]  979 	ld	sp,hl
                            980 ;src/main.c:236: u8 colisiona = 1;
   6A63 DD 36 F7 01   [19]  981 	ld	-9 (ix),#0x01
                            982 ;src/main.c:238: switch (direction) {
   6A67 3E 03         [ 7]  983 	ld	a,#0x03
   6A69 DD 96 04      [19]  984 	sub	a, 4 (ix)
   6A6C DA 49 6E      [10]  985 	jp	C,00165$
                            986 ;src/main.c:240: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   6A6F DD 4E 05      [19]  987 	ld	c,5 (ix)
   6A72 DD 46 06      [19]  988 	ld	b,6 (ix)
   6A75 0A            [ 7]  989 	ld	a,(bc)
   6A76 5F            [ 4]  990 	ld	e,a
   6A77 21 01 00      [10]  991 	ld	hl,#0x0001
   6A7A 09            [11]  992 	add	hl,bc
   6A7B DD 75 F8      [19]  993 	ld	-8 (ix),l
   6A7E DD 74 F9      [19]  994 	ld	-7 (ix),h
   6A81 DD 6E F8      [19]  995 	ld	l,-8 (ix)
   6A84 DD 66 F9      [19]  996 	ld	h,-7 (ix)
   6A87 56            [ 7]  997 	ld	d,(hl)
                            998 ;src/main.c:253: enemy->muerto = SI;
   6A88 21 08 00      [10]  999 	ld	hl,#0x0008
   6A8B 09            [11] 1000 	add	hl,bc
   6A8C DD 75 FA      [19] 1001 	ld	-6 (ix),l
   6A8F DD 74 FB      [19] 1002 	ld	-5 (ix),h
                           1003 ;src/main.c:260: enemy->mira = M_izquierda;
   6A92 21 07 00      [10] 1004 	ld	hl,#0x0007
   6A95 09            [11] 1005 	add	hl,bc
   6A96 DD 75 FC      [19] 1006 	ld	-4 (ix),l
   6A99 DD 74 FD      [19] 1007 	ld	-3 (ix),h
                           1008 ;src/main.c:238: switch (direction) {
   6A9C D5            [11] 1009 	push	de
   6A9D DD 5E 04      [19] 1010 	ld	e,4 (ix)
   6AA0 16 00         [ 7] 1011 	ld	d,#0x00
   6AA2 21 AA 6A      [10] 1012 	ld	hl,#00268$
   6AA5 19            [11] 1013 	add	hl,de
   6AA6 19            [11] 1014 	add	hl,de
   6AA7 19            [11] 1015 	add	hl,de
   6AA8 D1            [10] 1016 	pop	de
   6AA9 E9            [ 4] 1017 	jp	(hl)
   6AAA                    1018 00268$:
   6AAA C3 B6 6A      [10] 1019 	jp	00101$
   6AAD C3 9E 6B      [10] 1020 	jp	00117$
   6AB0 C3 82 6C      [10] 1021 	jp	00133$
   6AB3 C3 60 6D      [10] 1022 	jp	00149$
                           1023 ;src/main.c:239: case 0:
   6AB6                    1024 00101$:
                           1025 ;src/main.c:240: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   6AB6 7B            [ 4] 1026 	ld	a,e
   6AB7 C6 05         [ 7] 1027 	add	a, #0x05
   6AB9 C5            [11] 1028 	push	bc
   6ABA D5            [11] 1029 	push	de
   6ABB 33            [ 6] 1030 	inc	sp
   6ABC F5            [11] 1031 	push	af
   6ABD 33            [ 6] 1032 	inc	sp
   6ABE 2A F8 65      [16] 1033 	ld	hl,(_mapa)
   6AC1 E5            [11] 1034 	push	hl
   6AC2 CD C4 4A      [17] 1035 	call	_getTilePtr
   6AC5 F1            [10] 1036 	pop	af
   6AC6 F1            [10] 1037 	pop	af
   6AC7 C1            [10] 1038 	pop	bc
   6AC8 5E            [ 7] 1039 	ld	e,(hl)
   6AC9 3E 02         [ 7] 1040 	ld	a,#0x02
   6ACB 93            [ 4] 1041 	sub	a, e
   6ACC DA 93 6B      [10] 1042 	jp	C,00113$
                           1043 ;src/main.c:241: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   6ACF DD 6E F8      [19] 1044 	ld	l,-8 (ix)
   6AD2 DD 66 F9      [19] 1045 	ld	h,-7 (ix)
   6AD5 7E            [ 7] 1046 	ld	a,(hl)
   6AD6 C6 0B         [ 7] 1047 	add	a, #0x0B
   6AD8 57            [ 4] 1048 	ld	d,a
   6AD9 0A            [ 7] 1049 	ld	a,(bc)
   6ADA C6 05         [ 7] 1050 	add	a, #0x05
   6ADC C5            [11] 1051 	push	bc
   6ADD D5            [11] 1052 	push	de
   6ADE 33            [ 6] 1053 	inc	sp
   6ADF F5            [11] 1054 	push	af
   6AE0 33            [ 6] 1055 	inc	sp
   6AE1 2A F8 65      [16] 1056 	ld	hl,(_mapa)
   6AE4 E5            [11] 1057 	push	hl
   6AE5 CD C4 4A      [17] 1058 	call	_getTilePtr
   6AE8 F1            [10] 1059 	pop	af
   6AE9 F1            [10] 1060 	pop	af
   6AEA C1            [10] 1061 	pop	bc
   6AEB 5E            [ 7] 1062 	ld	e,(hl)
   6AEC 3E 02         [ 7] 1063 	ld	a,#0x02
   6AEE 93            [ 4] 1064 	sub	a, e
   6AEF DA 93 6B      [10] 1065 	jp	C,00113$
                           1066 ;src/main.c:242: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   6AF2 DD 6E F8      [19] 1067 	ld	l,-8 (ix)
   6AF5 DD 66 F9      [19] 1068 	ld	h,-7 (ix)
   6AF8 7E            [ 7] 1069 	ld	a,(hl)
   6AF9 C6 16         [ 7] 1070 	add	a, #0x16
   6AFB 57            [ 4] 1071 	ld	d,a
   6AFC 0A            [ 7] 1072 	ld	a,(bc)
   6AFD C6 05         [ 7] 1073 	add	a, #0x05
   6AFF C5            [11] 1074 	push	bc
   6B00 D5            [11] 1075 	push	de
   6B01 33            [ 6] 1076 	inc	sp
   6B02 F5            [11] 1077 	push	af
   6B03 33            [ 6] 1078 	inc	sp
   6B04 2A F8 65      [16] 1079 	ld	hl,(_mapa)
   6B07 E5            [11] 1080 	push	hl
   6B08 CD C4 4A      [17] 1081 	call	_getTilePtr
   6B0B F1            [10] 1082 	pop	af
   6B0C F1            [10] 1083 	pop	af
   6B0D C1            [10] 1084 	pop	bc
   6B0E 5E            [ 7] 1085 	ld	e,(hl)
   6B0F 3E 02         [ 7] 1086 	ld	a,#0x02
   6B11 93            [ 4] 1087 	sub	a, e
   6B12 DA 93 6B      [10] 1088 	jp	C,00113$
                           1089 ;src/main.c:244: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   6B15 21 25 65      [10] 1090 	ld	hl, #_cu + 1
   6B18 5E            [ 7] 1091 	ld	e,(hl)
   6B19 16 00         [ 7] 1092 	ld	d,#0x00
   6B1B 21 04 00      [10] 1093 	ld	hl,#0x0004
   6B1E 19            [11] 1094 	add	hl,de
   6B1F DD 75 FE      [19] 1095 	ld	-2 (ix),l
   6B22 DD 74 FF      [19] 1096 	ld	-1 (ix),h
   6B25 DD 6E F8      [19] 1097 	ld	l,-8 (ix)
   6B28 DD 66 F9      [19] 1098 	ld	h,-7 (ix)
   6B2B 6E            [ 7] 1099 	ld	l,(hl)
   6B2C 26 00         [ 7] 1100 	ld	h,#0x00
   6B2E DD 7E FE      [19] 1101 	ld	a,-2 (ix)
   6B31 95            [ 4] 1102 	sub	a, l
   6B32 DD 7E FF      [19] 1103 	ld	a,-1 (ix)
   6B35 9C            [ 4] 1104 	sbc	a, h
   6B36 E2 3B 6B      [10] 1105 	jp	PO, 00269$
   6B39 EE 80         [ 7] 1106 	xor	a, #0x80
   6B3B                    1107 00269$:
   6B3B FA 50 6B      [10] 1108 	jp	M,00108$
   6B3E D5            [11] 1109 	push	de
   6B3F 11 16 00      [10] 1110 	ld	de,#0x0016
   6B42 19            [11] 1111 	add	hl, de
   6B43 D1            [10] 1112 	pop	de
   6B44 7D            [ 4] 1113 	ld	a,l
   6B45 93            [ 4] 1114 	sub	a, e
   6B46 7C            [ 4] 1115 	ld	a,h
   6B47 9A            [ 4] 1116 	sbc	a, d
   6B48 E2 4D 6B      [10] 1117 	jp	PO, 00270$
   6B4B EE 80         [ 7] 1118 	xor	a, #0x80
   6B4D                    1119 00270$:
   6B4D F2 57 6B      [10] 1120 	jp	P,00109$
   6B50                    1121 00108$:
                           1122 ;src/main.c:245: colisiona = 0;
   6B50 DD 36 F7 00   [19] 1123 	ld	-9 (ix),#0x00
   6B54 C3 49 6E      [10] 1124 	jp	00165$
   6B57                    1125 00109$:
                           1126 ;src/main.c:248: if(cu.x > enemy->x){ //si el cu esta abajo
   6B57 21 24 65      [10] 1127 	ld	hl, #_cu + 0
   6B5A 5E            [ 7] 1128 	ld	e,(hl)
   6B5B 0A            [ 7] 1129 	ld	a,(bc)
   6B5C 4F            [ 4] 1130 	ld	c,a
   6B5D 93            [ 4] 1131 	sub	a, e
   6B5E 30 2C         [12] 1132 	jr	NC,00106$
                           1133 ;src/main.c:249: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
   6B60 6B            [ 4] 1134 	ld	l,e
   6B61 26 00         [ 7] 1135 	ld	h,#0x00
   6B63 06 00         [ 7] 1136 	ld	b,#0x00
   6B65 03            [ 6] 1137 	inc	bc
   6B66 03            [ 6] 1138 	inc	bc
   6B67 03            [ 6] 1139 	inc	bc
   6B68 03            [ 6] 1140 	inc	bc
   6B69 BF            [ 4] 1141 	cp	a, a
   6B6A ED 42         [15] 1142 	sbc	hl, bc
   6B6C 3E 01         [ 7] 1143 	ld	a,#0x01
   6B6E BD            [ 4] 1144 	cp	a, l
   6B6F 3E 00         [ 7] 1145 	ld	a,#0x00
   6B71 9C            [ 4] 1146 	sbc	a, h
   6B72 E2 77 6B      [10] 1147 	jp	PO, 00271$
   6B75 EE 80         [ 7] 1148 	xor	a, #0x80
   6B77                    1149 00271$:
   6B77 F2 81 6B      [10] 1150 	jp	P,00103$
                           1151 ;src/main.c:250: colisiona = 0;
   6B7A DD 36 F7 00   [19] 1152 	ld	-9 (ix),#0x00
   6B7E C3 49 6E      [10] 1153 	jp	00165$
   6B81                    1154 00103$:
                           1155 ;src/main.c:253: enemy->muerto = SI;
   6B81 DD 6E FA      [19] 1156 	ld	l,-6 (ix)
   6B84 DD 66 FB      [19] 1157 	ld	h,-5 (ix)
   6B87 36 01         [10] 1158 	ld	(hl),#0x01
   6B89 C3 49 6E      [10] 1159 	jp	00165$
   6B8C                    1160 00106$:
                           1161 ;src/main.c:256: colisiona = 0;
   6B8C DD 36 F7 00   [19] 1162 	ld	-9 (ix),#0x00
   6B90 C3 49 6E      [10] 1163 	jp	00165$
   6B93                    1164 00113$:
                           1165 ;src/main.c:260: enemy->mira = M_izquierda;
   6B93 DD 6E FC      [19] 1166 	ld	l,-4 (ix)
   6B96 DD 66 FD      [19] 1167 	ld	h,-3 (ix)
   6B99 36 01         [10] 1168 	ld	(hl),#0x01
                           1169 ;src/main.c:262: break;
   6B9B C3 49 6E      [10] 1170 	jp	00165$
                           1171 ;src/main.c:263: case 1:
   6B9E                    1172 00117$:
                           1173 ;src/main.c:264: if( *getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   6B9E 1D            [ 4] 1174 	dec	e
   6B9F C5            [11] 1175 	push	bc
   6BA0 D5            [11] 1176 	push	de
   6BA1 2A F8 65      [16] 1177 	ld	hl,(_mapa)
   6BA4 E5            [11] 1178 	push	hl
   6BA5 CD C4 4A      [17] 1179 	call	_getTilePtr
   6BA8 F1            [10] 1180 	pop	af
   6BA9 F1            [10] 1181 	pop	af
   6BAA C1            [10] 1182 	pop	bc
   6BAB 5E            [ 7] 1183 	ld	e,(hl)
   6BAC 3E 02         [ 7] 1184 	ld	a,#0x02
   6BAE 93            [ 4] 1185 	sub	a, e
   6BAF DA 77 6C      [10] 1186 	jp	C,00129$
                           1187 ;src/main.c:265: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   6BB2 DD 6E F8      [19] 1188 	ld	l,-8 (ix)
   6BB5 DD 66 F9      [19] 1189 	ld	h,-7 (ix)
   6BB8 7E            [ 7] 1190 	ld	a,(hl)
   6BB9 C6 0B         [ 7] 1191 	add	a, #0x0B
   6BBB 57            [ 4] 1192 	ld	d,a
   6BBC 0A            [ 7] 1193 	ld	a,(bc)
   6BBD C6 FF         [ 7] 1194 	add	a,#0xFF
   6BBF C5            [11] 1195 	push	bc
   6BC0 D5            [11] 1196 	push	de
   6BC1 33            [ 6] 1197 	inc	sp
   6BC2 F5            [11] 1198 	push	af
   6BC3 33            [ 6] 1199 	inc	sp
   6BC4 2A F8 65      [16] 1200 	ld	hl,(_mapa)
   6BC7 E5            [11] 1201 	push	hl
   6BC8 CD C4 4A      [17] 1202 	call	_getTilePtr
   6BCB F1            [10] 1203 	pop	af
   6BCC F1            [10] 1204 	pop	af
   6BCD C1            [10] 1205 	pop	bc
   6BCE 5E            [ 7] 1206 	ld	e,(hl)
   6BCF 3E 02         [ 7] 1207 	ld	a,#0x02
   6BD1 93            [ 4] 1208 	sub	a, e
   6BD2 DA 77 6C      [10] 1209 	jp	C,00129$
                           1210 ;src/main.c:266: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   6BD5 DD 6E F8      [19] 1211 	ld	l,-8 (ix)
   6BD8 DD 66 F9      [19] 1212 	ld	h,-7 (ix)
   6BDB 7E            [ 7] 1213 	ld	a,(hl)
   6BDC C6 16         [ 7] 1214 	add	a, #0x16
   6BDE 57            [ 4] 1215 	ld	d,a
   6BDF 0A            [ 7] 1216 	ld	a,(bc)
   6BE0 C6 FF         [ 7] 1217 	add	a,#0xFF
   6BE2 C5            [11] 1218 	push	bc
   6BE3 D5            [11] 1219 	push	de
   6BE4 33            [ 6] 1220 	inc	sp
   6BE5 F5            [11] 1221 	push	af
   6BE6 33            [ 6] 1222 	inc	sp
   6BE7 2A F8 65      [16] 1223 	ld	hl,(_mapa)
   6BEA E5            [11] 1224 	push	hl
   6BEB CD C4 4A      [17] 1225 	call	_getTilePtr
   6BEE F1            [10] 1226 	pop	af
   6BEF F1            [10] 1227 	pop	af
   6BF0 C1            [10] 1228 	pop	bc
   6BF1 5E            [ 7] 1229 	ld	e,(hl)
   6BF2 3E 02         [ 7] 1230 	ld	a,#0x02
   6BF4 93            [ 4] 1231 	sub	a, e
   6BF5 DA 77 6C      [10] 1232 	jp	C,00129$
                           1233 ;src/main.c:268: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   6BF8 21 25 65      [10] 1234 	ld	hl, #_cu + 1
   6BFB 5E            [ 7] 1235 	ld	e,(hl)
   6BFC 16 00         [ 7] 1236 	ld	d,#0x00
   6BFE 21 04 00      [10] 1237 	ld	hl,#0x0004
   6C01 19            [11] 1238 	add	hl,de
   6C02 DD 75 FE      [19] 1239 	ld	-2 (ix),l
   6C05 DD 74 FF      [19] 1240 	ld	-1 (ix),h
   6C08 DD 6E F8      [19] 1241 	ld	l,-8 (ix)
   6C0B DD 66 F9      [19] 1242 	ld	h,-7 (ix)
   6C0E 6E            [ 7] 1243 	ld	l,(hl)
   6C0F 26 00         [ 7] 1244 	ld	h,#0x00
   6C11 DD 7E FE      [19] 1245 	ld	a,-2 (ix)
   6C14 95            [ 4] 1246 	sub	a, l
   6C15 DD 7E FF      [19] 1247 	ld	a,-1 (ix)
   6C18 9C            [ 4] 1248 	sbc	a, h
   6C19 E2 1E 6C      [10] 1249 	jp	PO, 00272$
   6C1C EE 80         [ 7] 1250 	xor	a, #0x80
   6C1E                    1251 00272$:
   6C1E FA 33 6C      [10] 1252 	jp	M,00124$
   6C21 D5            [11] 1253 	push	de
   6C22 11 16 00      [10] 1254 	ld	de,#0x0016
   6C25 19            [11] 1255 	add	hl, de
   6C26 D1            [10] 1256 	pop	de
   6C27 7D            [ 4] 1257 	ld	a,l
   6C28 93            [ 4] 1258 	sub	a, e
   6C29 7C            [ 4] 1259 	ld	a,h
   6C2A 9A            [ 4] 1260 	sbc	a, d
   6C2B E2 30 6C      [10] 1261 	jp	PO, 00273$
   6C2E EE 80         [ 7] 1262 	xor	a, #0x80
   6C30                    1263 00273$:
   6C30 F2 3A 6C      [10] 1264 	jp	P,00125$
   6C33                    1265 00124$:
                           1266 ;src/main.c:269: colisiona = 0;
   6C33 DD 36 F7 00   [19] 1267 	ld	-9 (ix),#0x00
   6C37 C3 49 6E      [10] 1268 	jp	00165$
   6C3A                    1269 00125$:
                           1270 ;src/main.c:272: if(enemy->x > cu.x){ //si el cu esta abajo
   6C3A 0A            [ 7] 1271 	ld	a,(bc)
   6C3B 5F            [ 4] 1272 	ld	e,a
   6C3C 21 24 65      [10] 1273 	ld	hl, #_cu + 0
   6C3F 4E            [ 7] 1274 	ld	c,(hl)
   6C40 79            [ 4] 1275 	ld	a,c
   6C41 93            [ 4] 1276 	sub	a, e
   6C42 30 2C         [12] 1277 	jr	NC,00122$
                           1278 ;src/main.c:273: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
   6C44 6B            [ 4] 1279 	ld	l,e
   6C45 26 00         [ 7] 1280 	ld	h,#0x00
   6C47 06 00         [ 7] 1281 	ld	b,#0x00
   6C49 03            [ 6] 1282 	inc	bc
   6C4A 03            [ 6] 1283 	inc	bc
   6C4B 03            [ 6] 1284 	inc	bc
   6C4C 03            [ 6] 1285 	inc	bc
   6C4D BF            [ 4] 1286 	cp	a, a
   6C4E ED 42         [15] 1287 	sbc	hl, bc
   6C50 3E 01         [ 7] 1288 	ld	a,#0x01
   6C52 BD            [ 4] 1289 	cp	a, l
   6C53 3E 00         [ 7] 1290 	ld	a,#0x00
   6C55 9C            [ 4] 1291 	sbc	a, h
   6C56 E2 5B 6C      [10] 1292 	jp	PO, 00274$
   6C59 EE 80         [ 7] 1293 	xor	a, #0x80
   6C5B                    1294 00274$:
   6C5B F2 65 6C      [10] 1295 	jp	P,00119$
                           1296 ;src/main.c:274: colisiona = 0;
   6C5E DD 36 F7 00   [19] 1297 	ld	-9 (ix),#0x00
   6C62 C3 49 6E      [10] 1298 	jp	00165$
   6C65                    1299 00119$:
                           1300 ;src/main.c:277: enemy->muerto = SI;
   6C65 DD 6E FA      [19] 1301 	ld	l,-6 (ix)
   6C68 DD 66 FB      [19] 1302 	ld	h,-5 (ix)
   6C6B 36 01         [10] 1303 	ld	(hl),#0x01
   6C6D C3 49 6E      [10] 1304 	jp	00165$
   6C70                    1305 00122$:
                           1306 ;src/main.c:280: colisiona = 0;
   6C70 DD 36 F7 00   [19] 1307 	ld	-9 (ix),#0x00
   6C74 C3 49 6E      [10] 1308 	jp	00165$
   6C77                    1309 00129$:
                           1310 ;src/main.c:284: enemy->mira = M_derecha;
   6C77 DD 6E FC      [19] 1311 	ld	l,-4 (ix)
   6C7A DD 66 FD      [19] 1312 	ld	h,-3 (ix)
   6C7D 36 00         [10] 1313 	ld	(hl),#0x00
                           1314 ;src/main.c:286: break;
   6C7F C3 49 6E      [10] 1315 	jp	00165$
                           1316 ;src/main.c:287: case 2:
   6C82                    1317 00133$:
                           1318 ;src/main.c:288: if( *getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   6C82 15            [ 4] 1319 	dec	d
   6C83 15            [ 4] 1320 	dec	d
   6C84 C5            [11] 1321 	push	bc
   6C85 D5            [11] 1322 	push	de
   6C86 2A F8 65      [16] 1323 	ld	hl,(_mapa)
   6C89 E5            [11] 1324 	push	hl
   6C8A CD C4 4A      [17] 1325 	call	_getTilePtr
   6C8D F1            [10] 1326 	pop	af
   6C8E F1            [10] 1327 	pop	af
   6C8F C1            [10] 1328 	pop	bc
   6C90 5E            [ 7] 1329 	ld	e,(hl)
   6C91 3E 02         [ 7] 1330 	ld	a,#0x02
   6C93 93            [ 4] 1331 	sub	a, e
   6C94 DA 58 6D      [10] 1332 	jp	C,00145$
                           1333 ;src/main.c:289: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   6C97 DD 6E F8      [19] 1334 	ld	l,-8 (ix)
   6C9A DD 66 F9      [19] 1335 	ld	h,-7 (ix)
   6C9D 56            [ 7] 1336 	ld	d,(hl)
   6C9E 15            [ 4] 1337 	dec	d
   6C9F 15            [ 4] 1338 	dec	d
   6CA0 0A            [ 7] 1339 	ld	a,(bc)
   6CA1 C6 02         [ 7] 1340 	add	a, #0x02
   6CA3 C5            [11] 1341 	push	bc
   6CA4 D5            [11] 1342 	push	de
   6CA5 33            [ 6] 1343 	inc	sp
   6CA6 F5            [11] 1344 	push	af
   6CA7 33            [ 6] 1345 	inc	sp
   6CA8 2A F8 65      [16] 1346 	ld	hl,(_mapa)
   6CAB E5            [11] 1347 	push	hl
   6CAC CD C4 4A      [17] 1348 	call	_getTilePtr
   6CAF F1            [10] 1349 	pop	af
   6CB0 F1            [10] 1350 	pop	af
   6CB1 C1            [10] 1351 	pop	bc
   6CB2 5E            [ 7] 1352 	ld	e,(hl)
   6CB3 3E 02         [ 7] 1353 	ld	a,#0x02
   6CB5 93            [ 4] 1354 	sub	a, e
   6CB6 DA 58 6D      [10] 1355 	jp	C,00145$
                           1356 ;src/main.c:290: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   6CB9 DD 6E F8      [19] 1357 	ld	l,-8 (ix)
   6CBC DD 66 F9      [19] 1358 	ld	h,-7 (ix)
   6CBF 56            [ 7] 1359 	ld	d,(hl)
   6CC0 15            [ 4] 1360 	dec	d
   6CC1 15            [ 4] 1361 	dec	d
   6CC2 0A            [ 7] 1362 	ld	a,(bc)
   6CC3 C6 04         [ 7] 1363 	add	a, #0x04
   6CC5 C5            [11] 1364 	push	bc
   6CC6 D5            [11] 1365 	push	de
   6CC7 33            [ 6] 1366 	inc	sp
   6CC8 F5            [11] 1367 	push	af
   6CC9 33            [ 6] 1368 	inc	sp
   6CCA 2A F8 65      [16] 1369 	ld	hl,(_mapa)
   6CCD E5            [11] 1370 	push	hl
   6CCE CD C4 4A      [17] 1371 	call	_getTilePtr
   6CD1 F1            [10] 1372 	pop	af
   6CD2 F1            [10] 1373 	pop	af
   6CD3 C1            [10] 1374 	pop	bc
   6CD4 5E            [ 7] 1375 	ld	e,(hl)
   6CD5 3E 02         [ 7] 1376 	ld	a,#0x02
   6CD7 93            [ 4] 1377 	sub	a, e
   6CD8 DA 58 6D      [10] 1378 	jp	C,00145$
                           1379 ;src/main.c:292: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   6CDB 21 24 65      [10] 1380 	ld	hl, #_cu + 0
   6CDE 5E            [ 7] 1381 	ld	e,(hl)
   6CDF 16 00         [ 7] 1382 	ld	d,#0x00
   6CE1 21 02 00      [10] 1383 	ld	hl,#0x0002
   6CE4 19            [11] 1384 	add	hl,de
   6CE5 DD 75 FE      [19] 1385 	ld	-2 (ix),l
   6CE8 DD 74 FF      [19] 1386 	ld	-1 (ix),h
   6CEB 0A            [ 7] 1387 	ld	a,(bc)
   6CEC 6F            [ 4] 1388 	ld	l,a
   6CED 26 00         [ 7] 1389 	ld	h,#0x00
   6CEF DD 7E FE      [19] 1390 	ld	a,-2 (ix)
   6CF2 95            [ 4] 1391 	sub	a, l
   6CF3 DD 7E FF      [19] 1392 	ld	a,-1 (ix)
   6CF6 9C            [ 4] 1393 	sbc	a, h
   6CF7 E2 FC 6C      [10] 1394 	jp	PO, 00275$
   6CFA EE 80         [ 7] 1395 	xor	a, #0x80
   6CFC                    1396 00275$:
   6CFC FA 0F 6D      [10] 1397 	jp	M,00140$
   6CFF 23            [ 6] 1398 	inc	hl
   6D00 23            [ 6] 1399 	inc	hl
   6D01 23            [ 6] 1400 	inc	hl
   6D02 23            [ 6] 1401 	inc	hl
   6D03 7D            [ 4] 1402 	ld	a,l
   6D04 93            [ 4] 1403 	sub	a, e
   6D05 7C            [ 4] 1404 	ld	a,h
   6D06 9A            [ 4] 1405 	sbc	a, d
   6D07 E2 0C 6D      [10] 1406 	jp	PO, 00276$
   6D0A EE 80         [ 7] 1407 	xor	a, #0x80
   6D0C                    1408 00276$:
   6D0C F2 15 6D      [10] 1409 	jp	P,00141$
   6D0F                    1410 00140$:
                           1411 ;src/main.c:294: colisiona = 0;
   6D0F DD 36 F7 00   [19] 1412 	ld	-9 (ix),#0x00
   6D13 18 4B         [12] 1413 	jr	00149$
   6D15                    1414 00141$:
                           1415 ;src/main.c:297: if(enemy->y>cu.y){
   6D15 DD 6E F8      [19] 1416 	ld	l,-8 (ix)
   6D18 DD 66 F9      [19] 1417 	ld	h,-7 (ix)
   6D1B 5E            [ 7] 1418 	ld	e,(hl)
   6D1C 21 25 65      [10] 1419 	ld	hl, #(_cu + 0x0001) + 0
   6D1F 6E            [ 7] 1420 	ld	l,(hl)
   6D20 7D            [ 4] 1421 	ld	a,l
   6D21 93            [ 4] 1422 	sub	a, e
   6D22 30 2E         [12] 1423 	jr	NC,00138$
                           1424 ;src/main.c:298: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   6D24 16 00         [ 7] 1425 	ld	d,#0x00
   6D26 26 00         [ 7] 1426 	ld	h,#0x00
   6D28 D5            [11] 1427 	push	de
   6D29 11 08 00      [10] 1428 	ld	de,#0x0008
   6D2C 19            [11] 1429 	add	hl, de
   6D2D D1            [10] 1430 	pop	de
   6D2E 7B            [ 4] 1431 	ld	a,e
   6D2F 95            [ 4] 1432 	sub	a, l
   6D30 5F            [ 4] 1433 	ld	e,a
   6D31 7A            [ 4] 1434 	ld	a,d
   6D32 9C            [ 4] 1435 	sbc	a, h
   6D33 57            [ 4] 1436 	ld	d,a
   6D34 3E 02         [ 7] 1437 	ld	a,#0x02
   6D36 BB            [ 4] 1438 	cp	a, e
   6D37 3E 00         [ 7] 1439 	ld	a,#0x00
   6D39 9A            [ 4] 1440 	sbc	a, d
   6D3A E2 3F 6D      [10] 1441 	jp	PO, 00277$
   6D3D EE 80         [ 7] 1442 	xor	a, #0x80
   6D3F                    1443 00277$:
   6D3F F2 48 6D      [10] 1444 	jp	P,00135$
                           1445 ;src/main.c:299: colisiona = 0;
   6D42 DD 36 F7 00   [19] 1446 	ld	-9 (ix),#0x00
   6D46 18 18         [12] 1447 	jr	00149$
   6D48                    1448 00135$:
                           1449 ;src/main.c:302: enemy->muerto = SI;
   6D48 DD 6E FA      [19] 1450 	ld	l,-6 (ix)
   6D4B DD 66 FB      [19] 1451 	ld	h,-5 (ix)
   6D4E 36 01         [10] 1452 	ld	(hl),#0x01
   6D50 18 0E         [12] 1453 	jr	00149$
   6D52                    1454 00138$:
                           1455 ;src/main.c:306: colisiona = 0;
   6D52 DD 36 F7 00   [19] 1456 	ld	-9 (ix),#0x00
   6D56 18 08         [12] 1457 	jr	00149$
   6D58                    1458 00145$:
                           1459 ;src/main.c:312: enemy->mira = M_abajo;
   6D58 DD 6E FC      [19] 1460 	ld	l,-4 (ix)
   6D5B DD 66 FD      [19] 1461 	ld	h,-3 (ix)
   6D5E 36 03         [10] 1462 	ld	(hl),#0x03
                           1463 ;src/main.c:315: case 3:
   6D60                    1464 00149$:
                           1465 ;src/main.c:318: if( *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   6D60 DD 6E F8      [19] 1466 	ld	l,-8 (ix)
   6D63 DD 66 F9      [19] 1467 	ld	h,-7 (ix)
   6D66 7E            [ 7] 1468 	ld	a,(hl)
   6D67 C6 18         [ 7] 1469 	add	a, #0x18
   6D69 57            [ 4] 1470 	ld	d,a
   6D6A 0A            [ 7] 1471 	ld	a,(bc)
   6D6B C5            [11] 1472 	push	bc
   6D6C D5            [11] 1473 	push	de
   6D6D 33            [ 6] 1474 	inc	sp
   6D6E F5            [11] 1475 	push	af
   6D6F 33            [ 6] 1476 	inc	sp
   6D70 2A F8 65      [16] 1477 	ld	hl,(_mapa)
   6D73 E5            [11] 1478 	push	hl
   6D74 CD C4 4A      [17] 1479 	call	_getTilePtr
   6D77 F1            [10] 1480 	pop	af
   6D78 F1            [10] 1481 	pop	af
   6D79 C1            [10] 1482 	pop	bc
   6D7A 5E            [ 7] 1483 	ld	e,(hl)
   6D7B 3E 02         [ 7] 1484 	ld	a,#0x02
   6D7D 93            [ 4] 1485 	sub	a, e
   6D7E DA 41 6E      [10] 1486 	jp	C,00161$
                           1487 ;src/main.c:319: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   6D81 DD 6E F8      [19] 1488 	ld	l,-8 (ix)
   6D84 DD 66 F9      [19] 1489 	ld	h,-7 (ix)
   6D87 7E            [ 7] 1490 	ld	a,(hl)
   6D88 C6 18         [ 7] 1491 	add	a, #0x18
   6D8A 57            [ 4] 1492 	ld	d,a
   6D8B 0A            [ 7] 1493 	ld	a,(bc)
   6D8C C6 02         [ 7] 1494 	add	a, #0x02
   6D8E C5            [11] 1495 	push	bc
   6D8F D5            [11] 1496 	push	de
   6D90 33            [ 6] 1497 	inc	sp
   6D91 F5            [11] 1498 	push	af
   6D92 33            [ 6] 1499 	inc	sp
   6D93 2A F8 65      [16] 1500 	ld	hl,(_mapa)
   6D96 E5            [11] 1501 	push	hl
   6D97 CD C4 4A      [17] 1502 	call	_getTilePtr
   6D9A F1            [10] 1503 	pop	af
   6D9B F1            [10] 1504 	pop	af
   6D9C C1            [10] 1505 	pop	bc
   6D9D 5E            [ 7] 1506 	ld	e,(hl)
   6D9E 3E 02         [ 7] 1507 	ld	a,#0x02
   6DA0 93            [ 4] 1508 	sub	a, e
   6DA1 DA 41 6E      [10] 1509 	jp	C,00161$
                           1510 ;src/main.c:320: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   6DA4 DD 6E F8      [19] 1511 	ld	l,-8 (ix)
   6DA7 DD 66 F9      [19] 1512 	ld	h,-7 (ix)
   6DAA 7E            [ 7] 1513 	ld	a,(hl)
   6DAB C6 18         [ 7] 1514 	add	a, #0x18
   6DAD 57            [ 4] 1515 	ld	d,a
   6DAE 0A            [ 7] 1516 	ld	a,(bc)
   6DAF C6 04         [ 7] 1517 	add	a, #0x04
   6DB1 C5            [11] 1518 	push	bc
   6DB2 D5            [11] 1519 	push	de
   6DB3 33            [ 6] 1520 	inc	sp
   6DB4 F5            [11] 1521 	push	af
   6DB5 33            [ 6] 1522 	inc	sp
   6DB6 2A F8 65      [16] 1523 	ld	hl,(_mapa)
   6DB9 E5            [11] 1524 	push	hl
   6DBA CD C4 4A      [17] 1525 	call	_getTilePtr
   6DBD F1            [10] 1526 	pop	af
   6DBE F1            [10] 1527 	pop	af
   6DBF C1            [10] 1528 	pop	bc
   6DC0 5E            [ 7] 1529 	ld	e,(hl)
   6DC1 3E 02         [ 7] 1530 	ld	a,#0x02
   6DC3 93            [ 4] 1531 	sub	a, e
   6DC4 38 7B         [12] 1532 	jr	C,00161$
                           1533 ;src/main.c:322: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   6DC6 21 24 65      [10] 1534 	ld	hl, #_cu + 0
   6DC9 5E            [ 7] 1535 	ld	e,(hl)
   6DCA 16 00         [ 7] 1536 	ld	d,#0x00
   6DCC 21 02 00      [10] 1537 	ld	hl,#0x0002
   6DCF 19            [11] 1538 	add	hl,de
   6DD0 DD 75 FE      [19] 1539 	ld	-2 (ix),l
   6DD3 DD 74 FF      [19] 1540 	ld	-1 (ix),h
   6DD6 0A            [ 7] 1541 	ld	a,(bc)
   6DD7 4F            [ 4] 1542 	ld	c,a
   6DD8 06 00         [ 7] 1543 	ld	b,#0x00
   6DDA DD 7E FE      [19] 1544 	ld	a,-2 (ix)
   6DDD 91            [ 4] 1545 	sub	a, c
   6DDE DD 7E FF      [19] 1546 	ld	a,-1 (ix)
   6DE1 98            [ 4] 1547 	sbc	a, b
   6DE2 E2 E7 6D      [10] 1548 	jp	PO, 00278$
   6DE5 EE 80         [ 7] 1549 	xor	a, #0x80
   6DE7                    1550 00278$:
   6DE7 FA FA 6D      [10] 1551 	jp	M,00156$
   6DEA 03            [ 6] 1552 	inc	bc
   6DEB 03            [ 6] 1553 	inc	bc
   6DEC 03            [ 6] 1554 	inc	bc
   6DED 03            [ 6] 1555 	inc	bc
   6DEE 79            [ 4] 1556 	ld	a,c
   6DEF 93            [ 4] 1557 	sub	a, e
   6DF0 78            [ 4] 1558 	ld	a,b
   6DF1 9A            [ 4] 1559 	sbc	a, d
   6DF2 E2 F7 6D      [10] 1560 	jp	PO, 00279$
   6DF5 EE 80         [ 7] 1561 	xor	a, #0x80
   6DF7                    1562 00279$:
   6DF7 F2 00 6E      [10] 1563 	jp	P,00157$
   6DFA                    1564 00156$:
                           1565 ;src/main.c:323: colisiona = 0;
   6DFA DD 36 F7 00   [19] 1566 	ld	-9 (ix),#0x00
   6DFE 18 49         [12] 1567 	jr	00165$
   6E00                    1568 00157$:
                           1569 ;src/main.c:326: if(cu.y > enemy->y){ //si el cu esta abajo
   6E00 21 25 65      [10] 1570 	ld	hl, #(_cu + 0x0001) + 0
   6E03 4E            [ 7] 1571 	ld	c,(hl)
   6E04 DD 6E F8      [19] 1572 	ld	l,-8 (ix)
   6E07 DD 66 F9      [19] 1573 	ld	h,-7 (ix)
   6E0A 5E            [ 7] 1574 	ld	e,(hl)
   6E0B 7B            [ 4] 1575 	ld	a,e
   6E0C 91            [ 4] 1576 	sub	a, c
   6E0D 30 2C         [12] 1577 	jr	NC,00154$
                           1578 ;src/main.c:327: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   6E0F 06 00         [ 7] 1579 	ld	b,#0x00
   6E11 16 00         [ 7] 1580 	ld	d,#0x00
   6E13 21 16 00      [10] 1581 	ld	hl,#0x0016
   6E16 19            [11] 1582 	add	hl,de
   6E17 79            [ 4] 1583 	ld	a,c
   6E18 95            [ 4] 1584 	sub	a, l
   6E19 4F            [ 4] 1585 	ld	c,a
   6E1A 78            [ 4] 1586 	ld	a,b
   6E1B 9C            [ 4] 1587 	sbc	a, h
   6E1C 47            [ 4] 1588 	ld	b,a
   6E1D 3E 02         [ 7] 1589 	ld	a,#0x02
   6E1F B9            [ 4] 1590 	cp	a, c
   6E20 3E 00         [ 7] 1591 	ld	a,#0x00
   6E22 98            [ 4] 1592 	sbc	a, b
   6E23 E2 28 6E      [10] 1593 	jp	PO, 00280$
   6E26 EE 80         [ 7] 1594 	xor	a, #0x80
   6E28                    1595 00280$:
   6E28 F2 31 6E      [10] 1596 	jp	P,00151$
                           1597 ;src/main.c:328: colisiona = 0;
   6E2B DD 36 F7 00   [19] 1598 	ld	-9 (ix),#0x00
   6E2F 18 18         [12] 1599 	jr	00165$
   6E31                    1600 00151$:
                           1601 ;src/main.c:331: enemy->muerto = SI;
   6E31 DD 6E FA      [19] 1602 	ld	l,-6 (ix)
   6E34 DD 66 FB      [19] 1603 	ld	h,-5 (ix)
   6E37 36 01         [10] 1604 	ld	(hl),#0x01
   6E39 18 0E         [12] 1605 	jr	00165$
   6E3B                    1606 00154$:
                           1607 ;src/main.c:335: colisiona = 0;
   6E3B DD 36 F7 00   [19] 1608 	ld	-9 (ix),#0x00
   6E3F 18 08         [12] 1609 	jr	00165$
   6E41                    1610 00161$:
                           1611 ;src/main.c:339: enemy->mira = M_arriba;
   6E41 DD 6E FC      [19] 1612 	ld	l,-4 (ix)
   6E44 DD 66 FD      [19] 1613 	ld	h,-3 (ix)
   6E47 36 02         [10] 1614 	ld	(hl),#0x02
                           1615 ;src/main.c:342: }
   6E49                    1616 00165$:
                           1617 ;src/main.c:343: return colisiona;
   6E49 DD 6E F7      [19] 1618 	ld	l,-9 (ix)
   6E4C DD F9         [10] 1619 	ld	sp, ix
   6E4E DD E1         [14] 1620 	pop	ix
   6E50 C9            [10] 1621 	ret
                           1622 ;src/main.c:346: void moverEnemigoArriba(TEnemy *enemy){
                           1623 ;	---------------------------------
                           1624 ; Function moverEnemigoArriba
                           1625 ; ---------------------------------
   6E51                    1626 _moverEnemigoArriba::
   6E51 DD E5         [15] 1627 	push	ix
   6E53 DD 21 00 00   [14] 1628 	ld	ix,#0
   6E57 DD 39         [15] 1629 	add	ix,sp
                           1630 ;src/main.c:347: enemy->y--;
   6E59 DD 4E 04      [19] 1631 	ld	c,4 (ix)
   6E5C DD 46 05      [19] 1632 	ld	b,5 (ix)
   6E5F 69            [ 4] 1633 	ld	l, c
   6E60 60            [ 4] 1634 	ld	h, b
   6E61 23            [ 6] 1635 	inc	hl
   6E62 5E            [ 7] 1636 	ld	e,(hl)
   6E63 1D            [ 4] 1637 	dec	e
   6E64 73            [ 7] 1638 	ld	(hl),e
                           1639 ;src/main.c:348: enemy->y--;
   6E65 1D            [ 4] 1640 	dec	e
   6E66 73            [ 7] 1641 	ld	(hl),e
                           1642 ;src/main.c:349: enemy->mover = SI;
   6E67 21 06 00      [10] 1643 	ld	hl,#0x0006
   6E6A 09            [11] 1644 	add	hl,bc
   6E6B 36 01         [10] 1645 	ld	(hl),#0x01
   6E6D DD E1         [14] 1646 	pop	ix
   6E6F C9            [10] 1647 	ret
                           1648 ;src/main.c:352: void moverEnemigoAbajo(TEnemy *enemy){
                           1649 ;	---------------------------------
                           1650 ; Function moverEnemigoAbajo
                           1651 ; ---------------------------------
   6E70                    1652 _moverEnemigoAbajo::
   6E70 DD E5         [15] 1653 	push	ix
   6E72 DD 21 00 00   [14] 1654 	ld	ix,#0
   6E76 DD 39         [15] 1655 	add	ix,sp
                           1656 ;src/main.c:353: enemy->y++;
   6E78 DD 4E 04      [19] 1657 	ld	c,4 (ix)
   6E7B DD 46 05      [19] 1658 	ld	b,5 (ix)
   6E7E 59            [ 4] 1659 	ld	e, c
   6E7F 50            [ 4] 1660 	ld	d, b
   6E80 13            [ 6] 1661 	inc	de
   6E81 1A            [ 7] 1662 	ld	a,(de)
   6E82 3C            [ 4] 1663 	inc	a
   6E83 12            [ 7] 1664 	ld	(de),a
                           1665 ;src/main.c:354: enemy->y++;
   6E84 3C            [ 4] 1666 	inc	a
   6E85 12            [ 7] 1667 	ld	(de),a
                           1668 ;src/main.c:355: enemy->mover = SI;
   6E86 21 06 00      [10] 1669 	ld	hl,#0x0006
   6E89 09            [11] 1670 	add	hl,bc
   6E8A 36 01         [10] 1671 	ld	(hl),#0x01
   6E8C DD E1         [14] 1672 	pop	ix
   6E8E C9            [10] 1673 	ret
                           1674 ;src/main.c:358: void moverEnemigoDerecha(TEnemy *enemy){
                           1675 ;	---------------------------------
                           1676 ; Function moverEnemigoDerecha
                           1677 ; ---------------------------------
   6E8F                    1678 _moverEnemigoDerecha::
                           1679 ;src/main.c:359: enemy->x++;
   6E8F D1            [10] 1680 	pop	de
   6E90 C1            [10] 1681 	pop	bc
   6E91 C5            [11] 1682 	push	bc
   6E92 D5            [11] 1683 	push	de
   6E93 0A            [ 7] 1684 	ld	a,(bc)
   6E94 3C            [ 4] 1685 	inc	a
   6E95 02            [ 7] 1686 	ld	(bc),a
                           1687 ;src/main.c:360: enemy->x++;
   6E96 3C            [ 4] 1688 	inc	a
   6E97 02            [ 7] 1689 	ld	(bc),a
                           1690 ;src/main.c:361: enemy->mover = SI;
   6E98 21 06 00      [10] 1691 	ld	hl,#0x0006
   6E9B 09            [11] 1692 	add	hl,bc
   6E9C 36 01         [10] 1693 	ld	(hl),#0x01
   6E9E C9            [10] 1694 	ret
                           1695 ;src/main.c:364: void moverEnemigoIzquierda(TEnemy *enemy){
                           1696 ;	---------------------------------
                           1697 ; Function moverEnemigoIzquierda
                           1698 ; ---------------------------------
   6E9F                    1699 _moverEnemigoIzquierda::
                           1700 ;src/main.c:365: enemy->x--;
   6E9F D1            [10] 1701 	pop	de
   6EA0 C1            [10] 1702 	pop	bc
   6EA1 C5            [11] 1703 	push	bc
   6EA2 D5            [11] 1704 	push	de
   6EA3 0A            [ 7] 1705 	ld	a,(bc)
   6EA4 C6 FF         [ 7] 1706 	add	a,#0xFF
   6EA6 02            [ 7] 1707 	ld	(bc),a
                           1708 ;src/main.c:366: enemy->x--;
   6EA7 C6 FF         [ 7] 1709 	add	a,#0xFF
   6EA9 02            [ 7] 1710 	ld	(bc),a
                           1711 ;src/main.c:367: enemy->mover = SI;
   6EAA 21 06 00      [10] 1712 	ld	hl,#0x0006
   6EAD 09            [11] 1713 	add	hl,bc
   6EAE 36 01         [10] 1714 	ld	(hl),#0x01
   6EB0 C9            [10] 1715 	ret
                           1716 ;src/main.c:370: void moverEnemigoPatrol(TEnemy *enemy){
                           1717 ;	---------------------------------
                           1718 ; Function moverEnemigoPatrol
                           1719 ; ---------------------------------
   6EB1                    1720 _moverEnemigoPatrol::
   6EB1 DD E5         [15] 1721 	push	ix
   6EB3 DD 21 00 00   [14] 1722 	ld	ix,#0
   6EB7 DD 39         [15] 1723 	add	ix,sp
   6EB9 21 F3 FF      [10] 1724 	ld	hl,#-13
   6EBC 39            [11] 1725 	add	hl,sp
   6EBD F9            [ 6] 1726 	ld	sp,hl
                           1727 ;src/main.c:371: if(!enemy->muerto){
   6EBE DD 4E 04      [19] 1728 	ld	c,4 (ix)
   6EC1 DD 46 05      [19] 1729 	ld	b,5 (ix)
   6EC4 C5            [11] 1730 	push	bc
   6EC5 FD E1         [14] 1731 	pop	iy
   6EC7 FD 7E 08      [19] 1732 	ld	a,8 (iy)
   6ECA B7            [ 4] 1733 	or	a, a
   6ECB C2 E8 6F      [10] 1734 	jp	NZ,00112$
                           1735 ;src/main.c:373: if (!enemy->reversePatrol) {
   6ECE 21 0C 00      [10] 1736 	ld	hl,#0x000C
   6ED1 09            [11] 1737 	add	hl,bc
   6ED2 DD 75 F4      [19] 1738 	ld	-12 (ix),l
   6ED5 DD 74 F5      [19] 1739 	ld	-11 (ix),h
   6ED8 DD 6E F4      [19] 1740 	ld	l,-12 (ix)
   6EDB DD 66 F5      [19] 1741 	ld	h,-11 (ix)
   6EDE 7E            [ 7] 1742 	ld	a,(hl)
   6EDF DD 77 F3      [19] 1743 	ld	-13 (ix),a
                           1744 ;src/main.c:374: if(enemy->iter < enemy->longitud_camino - 8){
   6EE2 21 0E 00      [10] 1745 	ld	hl,#0x000E
   6EE5 09            [11] 1746 	add	hl,bc
   6EE6 EB            [ 4] 1747 	ex	de,hl
                           1748 ;src/main.c:375: enemy->x = enemy->camino[enemy->iter];
   6EE7 21 18 00      [10] 1749 	ld	hl,#0x0018
   6EEA 09            [11] 1750 	add	hl,bc
   6EEB DD 75 FE      [19] 1751 	ld	-2 (ix),l
   6EEE DD 74 FF      [19] 1752 	ld	-1 (ix),h
                           1753 ;src/main.c:377: enemy->y = enemy->camino[enemy->iter];
   6EF1 21 01 00      [10] 1754 	ld	hl,#0x0001
   6EF4 09            [11] 1755 	add	hl,bc
   6EF5 DD 75 FC      [19] 1756 	ld	-4 (ix),l
   6EF8 DD 74 FD      [19] 1757 	ld	-3 (ix),h
                           1758 ;src/main.c:379: enemy->mover = SI;
   6EFB 21 06 00      [10] 1759 	ld	hl,#0x0006
   6EFE 09            [11] 1760 	add	hl,bc
   6EFF DD 75 FA      [19] 1761 	ld	-6 (ix),l
   6F02 DD 74 FB      [19] 1762 	ld	-5 (ix),h
                           1763 ;src/main.c:382: enemy->lastIter = enemy->iter - 1;
   6F05 21 0F 00      [10] 1764 	ld	hl,#0x000F
   6F08 09            [11] 1765 	add	hl,bc
   6F09 DD 75 F8      [19] 1766 	ld	-8 (ix),l
   6F0C DD 74 F9      [19] 1767 	ld	-7 (ix),h
                           1768 ;src/main.c:373: if (!enemy->reversePatrol) {
   6F0F DD 7E F3      [19] 1769 	ld	a,-13 (ix)
   6F12 B7            [ 4] 1770 	or	a, a
   6F13 20 7C         [12] 1771 	jr	NZ,00108$
                           1772 ;src/main.c:374: if(enemy->iter < enemy->longitud_camino - 8){
   6F15 1A            [ 7] 1773 	ld	a,(de)
   6F16 DD 77 F3      [19] 1774 	ld	-13 (ix),a
   6F19 69            [ 4] 1775 	ld	l, c
   6F1A 60            [ 4] 1776 	ld	h, b
   6F1B C5            [11] 1777 	push	bc
   6F1C 01 44 01      [10] 1778 	ld	bc, #0x0144
   6F1F 09            [11] 1779 	add	hl, bc
   6F20 C1            [10] 1780 	pop	bc
   6F21 6E            [ 7] 1781 	ld	l,(hl)
   6F22 26 00         [ 7] 1782 	ld	h,#0x00
   6F24 7D            [ 4] 1783 	ld	a,l
   6F25 C6 F8         [ 7] 1784 	add	a,#0xF8
   6F27 DD 77 F6      [19] 1785 	ld	-10 (ix),a
   6F2A 7C            [ 4] 1786 	ld	a,h
   6F2B CE FF         [ 7] 1787 	adc	a,#0xFF
   6F2D DD 77 F7      [19] 1788 	ld	-9 (ix),a
   6F30 DD 7E F3      [19] 1789 	ld	a, -13 (ix)
   6F33 26 00         [ 7] 1790 	ld	h, #0x00
   6F35 DD 96 F6      [19] 1791 	sub	a, -10 (ix)
   6F38 7C            [ 4] 1792 	ld	a,h
   6F39 DD 9E F7      [19] 1793 	sbc	a, -9 (ix)
   6F3C E2 41 6F      [10] 1794 	jp	PO, 00130$
   6F3F EE 80         [ 7] 1795 	xor	a, #0x80
   6F41                    1796 00130$:
   6F41 F2 7C 6F      [10] 1797 	jp	P,00102$
                           1798 ;src/main.c:375: enemy->x = enemy->camino[enemy->iter];
   6F44 DD 6E F3      [19] 1799 	ld	l,-13 (ix)
   6F47 26 00         [ 7] 1800 	ld	h,#0x00
   6F49 DD 7E FE      [19] 1801 	ld	a,-2 (ix)
   6F4C 85            [ 4] 1802 	add	a, l
   6F4D 6F            [ 4] 1803 	ld	l,a
   6F4E DD 7E FF      [19] 1804 	ld	a,-1 (ix)
   6F51 8C            [ 4] 1805 	adc	a, h
   6F52 67            [ 4] 1806 	ld	h,a
   6F53 7E            [ 7] 1807 	ld	a,(hl)
   6F54 02            [ 7] 1808 	ld	(bc),a
                           1809 ;src/main.c:376: enemy->iter++;
   6F55 1A            [ 7] 1810 	ld	a,(de)
   6F56 4F            [ 4] 1811 	ld	c,a
   6F57 0C            [ 4] 1812 	inc	c
   6F58 79            [ 4] 1813 	ld	a,c
   6F59 12            [ 7] 1814 	ld	(de),a
                           1815 ;src/main.c:377: enemy->y = enemy->camino[enemy->iter];
   6F5A 69            [ 4] 1816 	ld	l,c
   6F5B 26 00         [ 7] 1817 	ld	h,#0x00
   6F5D DD 7E FE      [19] 1818 	ld	a,-2 (ix)
   6F60 85            [ 4] 1819 	add	a, l
   6F61 6F            [ 4] 1820 	ld	l,a
   6F62 DD 7E FF      [19] 1821 	ld	a,-1 (ix)
   6F65 8C            [ 4] 1822 	adc	a, h
   6F66 67            [ 4] 1823 	ld	h,a
   6F67 46            [ 7] 1824 	ld	b,(hl)
   6F68 DD 6E FC      [19] 1825 	ld	l,-4 (ix)
   6F6B DD 66 FD      [19] 1826 	ld	h,-3 (ix)
   6F6E 70            [ 7] 1827 	ld	(hl),b
                           1828 ;src/main.c:378: enemy->iter++;
   6F6F 0C            [ 4] 1829 	inc	c
   6F70 79            [ 4] 1830 	ld	a,c
   6F71 12            [ 7] 1831 	ld	(de),a
                           1832 ;src/main.c:379: enemy->mover = SI;
   6F72 DD 6E FA      [19] 1833 	ld	l,-6 (ix)
   6F75 DD 66 FB      [19] 1834 	ld	h,-5 (ix)
   6F78 36 01         [10] 1835 	ld	(hl),#0x01
   6F7A 18 6C         [12] 1836 	jr	00112$
   6F7C                    1837 00102$:
                           1838 ;src/main.c:382: enemy->lastIter = enemy->iter - 1;
   6F7C DD 4E F3      [19] 1839 	ld	c,-13 (ix)
   6F7F 0D            [ 4] 1840 	dec	c
   6F80 DD 6E F8      [19] 1841 	ld	l,-8 (ix)
   6F83 DD 66 F9      [19] 1842 	ld	h,-7 (ix)
   6F86 71            [ 7] 1843 	ld	(hl),c
                           1844 ;src/main.c:385: enemy->reversePatrol = 1;
   6F87 DD 6E F4      [19] 1845 	ld	l,-12 (ix)
   6F8A DD 66 F5      [19] 1846 	ld	h,-11 (ix)
   6F8D 36 01         [10] 1847 	ld	(hl),#0x01
   6F8F 18 57         [12] 1848 	jr	00112$
   6F91                    1849 00108$:
                           1850 ;src/main.c:388: if(enemy->lastIter > 1){
   6F91 DD 6E F8      [19] 1851 	ld	l,-8 (ix)
   6F94 DD 66 F9      [19] 1852 	ld	h,-7 (ix)
   6F97 6E            [ 7] 1853 	ld	l,(hl)
   6F98 3E 01         [ 7] 1854 	ld	a,#0x01
   6F9A 95            [ 4] 1855 	sub	a, l
   6F9B 30 41         [12] 1856 	jr	NC,00105$
                           1857 ;src/main.c:389: enemy->y = enemy->camino[enemy->lastIter];
   6F9D 26 00         [ 7] 1858 	ld	h,#0x00
   6F9F DD 5E FE      [19] 1859 	ld	e,-2 (ix)
   6FA2 DD 56 FF      [19] 1860 	ld	d,-1 (ix)
   6FA5 19            [11] 1861 	add	hl,de
   6FA6 5E            [ 7] 1862 	ld	e,(hl)
   6FA7 DD 6E FC      [19] 1863 	ld	l,-4 (ix)
   6FAA DD 66 FD      [19] 1864 	ld	h,-3 (ix)
   6FAD 73            [ 7] 1865 	ld	(hl),e
                           1866 ;src/main.c:390: enemy->lastIter--;
   6FAE DD 6E F8      [19] 1867 	ld	l,-8 (ix)
   6FB1 DD 66 F9      [19] 1868 	ld	h,-7 (ix)
   6FB4 5E            [ 7] 1869 	ld	e,(hl)
   6FB5 1D            [ 4] 1870 	dec	e
   6FB6 DD 6E F8      [19] 1871 	ld	l,-8 (ix)
   6FB9 DD 66 F9      [19] 1872 	ld	h,-7 (ix)
   6FBC 73            [ 7] 1873 	ld	(hl),e
                           1874 ;src/main.c:391: enemy->x = enemy->camino[enemy->lastIter];
   6FBD 6B            [ 4] 1875 	ld	l,e
   6FBE 26 00         [ 7] 1876 	ld	h,#0x00
   6FC0 DD 7E FE      [19] 1877 	ld	a,-2 (ix)
   6FC3 85            [ 4] 1878 	add	a, l
   6FC4 6F            [ 4] 1879 	ld	l,a
   6FC5 DD 7E FF      [19] 1880 	ld	a,-1 (ix)
   6FC8 8C            [ 4] 1881 	adc	a, h
   6FC9 67            [ 4] 1882 	ld	h,a
   6FCA 7E            [ 7] 1883 	ld	a,(hl)
   6FCB 02            [ 7] 1884 	ld	(bc),a
                           1885 ;src/main.c:392: enemy->lastIter--;
   6FCC 1D            [ 4] 1886 	dec	e
   6FCD DD 6E F8      [19] 1887 	ld	l,-8 (ix)
   6FD0 DD 66 F9      [19] 1888 	ld	h,-7 (ix)
   6FD3 73            [ 7] 1889 	ld	(hl),e
                           1890 ;src/main.c:393: enemy->mover = SI;
   6FD4 DD 6E FA      [19] 1891 	ld	l,-6 (ix)
   6FD7 DD 66 FB      [19] 1892 	ld	h,-5 (ix)
   6FDA 36 01         [10] 1893 	ld	(hl),#0x01
   6FDC 18 0A         [12] 1894 	jr	00112$
   6FDE                    1895 00105$:
                           1896 ;src/main.c:396: enemy->iter = 0;
   6FDE AF            [ 4] 1897 	xor	a, a
   6FDF 12            [ 7] 1898 	ld	(de),a
                           1899 ;src/main.c:398: enemy->reversePatrol = 0;
   6FE0 DD 6E F4      [19] 1900 	ld	l,-12 (ix)
   6FE3 DD 66 F5      [19] 1901 	ld	h,-11 (ix)
   6FE6 36 00         [10] 1902 	ld	(hl),#0x00
   6FE8                    1903 00112$:
   6FE8 DD F9         [10] 1904 	ld	sp, ix
   6FEA DD E1         [14] 1905 	pop	ix
   6FEC C9            [10] 1906 	ret
                           1907 ;src/main.c:405: void moverEnemigoSeek(TEnemy* enemy){
                           1908 ;	---------------------------------
                           1909 ; Function moverEnemigoSeek
                           1910 ; ---------------------------------
   6FED                    1911 _moverEnemigoSeek::
   6FED DD E5         [15] 1912 	push	ix
   6FEF DD 21 00 00   [14] 1913 	ld	ix,#0
   6FF3 DD 39         [15] 1914 	add	ix,sp
   6FF5 F5            [11] 1915 	push	af
   6FF6 F5            [11] 1916 	push	af
   6FF7 3B            [ 6] 1917 	dec	sp
                           1918 ;src/main.c:406: if(!enemy->muerto){
   6FF8 DD 4E 04      [19] 1919 	ld	c,4 (ix)
   6FFB DD 46 05      [19] 1920 	ld	b,5 (ix)
   6FFE C5            [11] 1921 	push	bc
   6FFF FD E1         [14] 1922 	pop	iy
   7001 FD 7E 08      [19] 1923 	ld	a,8 (iy)
   7004 B7            [ 4] 1924 	or	a, a
   7005 C2 DA 70      [10] 1925 	jp	NZ,00108$
                           1926 ;src/main.c:408: if (!enemy->reversePatrol) {
   7008 21 0C 00      [10] 1927 	ld	hl,#0x000C
   700B 09            [11] 1928 	add	hl,bc
   700C EB            [ 4] 1929 	ex	de,hl
   700D 1A            [ 7] 1930 	ld	a,(de)
   700E B7            [ 4] 1931 	or	a, a
   700F C2 DA 70      [10] 1932 	jp	NZ,00108$
                           1933 ;src/main.c:409: if(enemy->iter < enemy->longitud_camino - 8){
   7012 FD 21 0E 00   [14] 1934 	ld	iy,#0x000E
   7016 FD 09         [15] 1935 	add	iy, bc
   7018 FD 7E 00      [19] 1936 	ld	a, 0 (iy)
   701B DD 77 FF      [19] 1937 	ld	-1 (ix),a
   701E 69            [ 4] 1938 	ld	l, c
   701F 60            [ 4] 1939 	ld	h, b
   7020 C5            [11] 1940 	push	bc
   7021 01 44 01      [10] 1941 	ld	bc, #0x0144
   7024 09            [11] 1942 	add	hl, bc
   7025 C1            [10] 1943 	pop	bc
   7026 6E            [ 7] 1944 	ld	l,(hl)
   7027 26 00         [ 7] 1945 	ld	h,#0x00
   7029 7D            [ 4] 1946 	ld	a,l
   702A C6 F8         [ 7] 1947 	add	a,#0xF8
   702C DD 77 FB      [19] 1948 	ld	-5 (ix),a
   702F 7C            [ 4] 1949 	ld	a,h
   7030 CE FF         [ 7] 1950 	adc	a,#0xFF
   7032 DD 77 FC      [19] 1951 	ld	-4 (ix),a
   7035 DD 6E FF      [19] 1952 	ld	l,-1 (ix)
   7038 26 00         [ 7] 1953 	ld	h,#0x00
                           1954 ;src/main.c:412: enemy->y = enemy->camino[enemy->iter];
   703A 79            [ 4] 1955 	ld	a,c
   703B C6 01         [ 7] 1956 	add	a, #0x01
   703D DD 77 FD      [19] 1957 	ld	-3 (ix),a
   7040 78            [ 4] 1958 	ld	a,b
   7041 CE 00         [ 7] 1959 	adc	a, #0x00
   7043 DD 77 FE      [19] 1960 	ld	-2 (ix),a
                           1961 ;src/main.c:409: if(enemy->iter < enemy->longitud_camino - 8){
   7046 7D            [ 4] 1962 	ld	a,l
   7047 DD 96 FB      [19] 1963 	sub	a, -5 (ix)
   704A 7C            [ 4] 1964 	ld	a,h
   704B DD 9E FC      [19] 1965 	sbc	a, -4 (ix)
   704E E2 53 70      [10] 1966 	jp	PO, 00122$
   7051 EE 80         [ 7] 1967 	xor	a, #0x80
   7053                    1968 00122$:
   7053 F2 8A 70      [10] 1969 	jp	P,00102$
                           1970 ;src/main.c:410: enemy->x = enemy->camino[enemy->iter];
   7056 21 18 00      [10] 1971 	ld	hl,#0x0018
   7059 09            [11] 1972 	add	hl,bc
   705A EB            [ 4] 1973 	ex	de,hl
   705B DD 6E FF      [19] 1974 	ld	l,-1 (ix)
   705E 26 00         [ 7] 1975 	ld	h,#0x00
   7060 19            [11] 1976 	add	hl,de
   7061 7E            [ 7] 1977 	ld	a,(hl)
   7062 02            [ 7] 1978 	ld	(bc),a
                           1979 ;src/main.c:411: enemy->iter++;
   7063 FD 7E 00      [19] 1980 	ld	a, 0 (iy)
   7066 3C            [ 4] 1981 	inc	a
   7067 DD 77 FB      [19] 1982 	ld	-5 (ix), a
   706A FD 77 00      [19] 1983 	ld	0 (iy), a
                           1984 ;src/main.c:412: enemy->y = enemy->camino[enemy->iter];
   706D DD 6E FB      [19] 1985 	ld	l,-5 (ix)
   7070 26 00         [ 7] 1986 	ld	h,#0x00
   7072 19            [11] 1987 	add	hl,de
   7073 5E            [ 7] 1988 	ld	e,(hl)
   7074 DD 6E FD      [19] 1989 	ld	l,-3 (ix)
   7077 DD 66 FE      [19] 1990 	ld	h,-2 (ix)
   707A 73            [ 7] 1991 	ld	(hl),e
                           1992 ;src/main.c:413: enemy->iter++;
   707B DD 5E FB      [19] 1993 	ld	e,-5 (ix)
   707E 1C            [ 4] 1994 	inc	e
   707F FD 73 00      [19] 1995 	ld	0 (iy), e
                           1996 ;src/main.c:414: enemy->mover = SI;
   7082 21 06 00      [10] 1997 	ld	hl,#0x0006
   7085 09            [11] 1998 	add	hl,bc
   7086 36 01         [10] 1999 	ld	(hl),#0x01
   7088 18 50         [12] 2000 	jr	00108$
   708A                    2001 00102$:
                           2002 ;src/main.c:417: enemy->reversePatrol = NO;
   708A AF            [ 4] 2003 	xor	a, a
   708B 12            [ 7] 2004 	ld	(de),a
                           2005 ;src/main.c:418: enemy->patrolling = 1;
   708C 21 0B 00      [10] 2006 	ld	hl,#0x000B
   708F 09            [11] 2007 	add	hl,bc
   7090 36 01         [10] 2008 	ld	(hl),#0x01
                           2009 ;src/main.c:419: enemy->seek = 0;
   7092 21 13 00      [10] 2010 	ld	hl,#0x0013
   7095 09            [11] 2011 	add	hl,bc
   7096 36 00         [10] 2012 	ld	(hl),#0x00
                           2013 ;src/main.c:420: enemy->lastIter = enemy->iter - 1;
   7098 21 0F 00      [10] 2014 	ld	hl,#0x000F
   709B 09            [11] 2015 	add	hl,bc
   709C EB            [ 4] 2016 	ex	de,hl
   709D FD 7E 00      [19] 2017 	ld	a, 0 (iy)
   70A0 C6 FF         [ 7] 2018 	add	a,#0xFF
   70A2 12            [ 7] 2019 	ld	(de),a
                           2020 ;src/main.c:421: enemy->iter = 0;
   70A3 FD 36 00 00   [19] 2021 	ld	0 (iy), #0x00
                           2022 ;src/main.c:422: pathFinding(enemy->x, enemy->y, enemy->p_seek_x, enemy->p_seek_y, enemy, mapa);
   70A7 69            [ 4] 2023 	ld	l, c
   70A8 60            [ 4] 2024 	ld	h, b
   70A9 11 17 00      [10] 2025 	ld	de, #0x0017
   70AC 19            [11] 2026 	add	hl, de
   70AD 56            [ 7] 2027 	ld	d,(hl)
   70AE C5            [11] 2028 	push	bc
   70AF FD E1         [14] 2029 	pop	iy
   70B1 FD 7E 16      [19] 2030 	ld	a,22 (iy)
   70B4 DD 77 FB      [19] 2031 	ld	-5 (ix),a
   70B7 DD 6E FD      [19] 2032 	ld	l,-3 (ix)
   70BA DD 66 FE      [19] 2033 	ld	h,-2 (ix)
   70BD 5E            [ 7] 2034 	ld	e,(hl)
   70BE 0A            [ 7] 2035 	ld	a,(bc)
   70BF DD 77 FD      [19] 2036 	ld	-3 (ix),a
   70C2 2A F8 65      [16] 2037 	ld	hl,(_mapa)
   70C5 E5            [11] 2038 	push	hl
   70C6 C5            [11] 2039 	push	bc
   70C7 D5            [11] 2040 	push	de
   70C8 33            [ 6] 2041 	inc	sp
   70C9 DD 56 FB      [19] 2042 	ld	d, -5 (ix)
   70CC D5            [11] 2043 	push	de
   70CD DD 7E FD      [19] 2044 	ld	a,-3 (ix)
   70D0 F5            [11] 2045 	push	af
   70D1 33            [ 6] 2046 	inc	sp
   70D2 CD 06 49      [17] 2047 	call	_pathFinding
   70D5 21 08 00      [10] 2048 	ld	hl,#8
   70D8 39            [11] 2049 	add	hl,sp
   70D9 F9            [ 6] 2050 	ld	sp,hl
   70DA                    2051 00108$:
   70DA DD F9         [10] 2052 	ld	sp, ix
   70DC DD E1         [14] 2053 	pop	ix
   70DE C9            [10] 2054 	ret
                           2055 ;src/main.c:429: void lookFor(TEnemy* enemy){
                           2056 ;	---------------------------------
                           2057 ; Function lookFor
                           2058 ; ---------------------------------
   70DF                    2059 _lookFor::
   70DF DD E5         [15] 2060 	push	ix
   70E1 DD 21 00 00   [14] 2061 	ld	ix,#0
   70E5 DD 39         [15] 2062 	add	ix,sp
   70E7 21 F5 FF      [10] 2063 	ld	hl,#-11
   70EA 39            [11] 2064 	add	hl,sp
   70EB F9            [ 6] 2065 	ld	sp,hl
                           2066 ;src/main.c:438: i16 difx = abs((i16)(enemy->x - prota.x));
   70EC DD 5E 04      [19] 2067 	ld	e,4 (ix)
   70EF DD 56 05      [19] 2068 	ld	d,5 (ix)
   70F2 1A            [ 7] 2069 	ld	a,(de)
   70F3 4F            [ 4] 2070 	ld	c,a
   70F4 06 00         [ 7] 2071 	ld	b,#0x00
   70F6 21 1C 65      [10] 2072 	ld	hl,#_prota+0
   70F9 6E            [ 7] 2073 	ld	l,(hl)
   70FA 26 00         [ 7] 2074 	ld	h,#0x00
   70FC 79            [ 4] 2075 	ld	a,c
   70FD 95            [ 4] 2076 	sub	a, l
   70FE 4F            [ 4] 2077 	ld	c,a
   70FF 78            [ 4] 2078 	ld	a,b
   7100 9C            [ 4] 2079 	sbc	a, h
   7101 47            [ 4] 2080 	ld	b,a
   7102 D5            [11] 2081 	push	de
   7103 C5            [11] 2082 	push	bc
   7104 CD 08 4B      [17] 2083 	call	_abs
   7107 F1            [10] 2084 	pop	af
   7108 D1            [10] 2085 	pop	de
   7109 DD 75 F6      [19] 2086 	ld	-10 (ix),l
   710C DD 74 F7      [19] 2087 	ld	-9 (ix),h
                           2088 ;src/main.c:439: i16 dify = abs((i16)(enemy->y - prota.y));
   710F 21 01 00      [10] 2089 	ld	hl,#0x0001
   7112 19            [11] 2090 	add	hl,de
   7113 DD 75 FC      [19] 2091 	ld	-4 (ix),l
   7116 DD 74 FD      [19] 2092 	ld	-3 (ix),h
   7119 DD 6E FC      [19] 2093 	ld	l,-4 (ix)
   711C DD 66 FD      [19] 2094 	ld	h,-3 (ix)
   711F 4E            [ 7] 2095 	ld	c,(hl)
   7120 06 00         [ 7] 2096 	ld	b,#0x00
   7122 21 1D 65      [10] 2097 	ld	hl, #(_prota + 0x0001) + 0
   7125 6E            [ 7] 2098 	ld	l,(hl)
   7126 26 00         [ 7] 2099 	ld	h,#0x00
   7128 79            [ 4] 2100 	ld	a,c
   7129 95            [ 4] 2101 	sub	a, l
   712A 4F            [ 4] 2102 	ld	c,a
   712B 78            [ 4] 2103 	ld	a,b
   712C 9C            [ 4] 2104 	sbc	a, h
   712D 47            [ 4] 2105 	ld	b,a
   712E D5            [11] 2106 	push	de
   712F C5            [11] 2107 	push	bc
   7130 CD 08 4B      [17] 2108 	call	_abs
   7133 F1            [10] 2109 	pop	af
   7134 D1            [10] 2110 	pop	de
                           2111 ;src/main.c:441: dist = difx + dify; // manhattan
   7135 DD 4E F6      [19] 2112 	ld	c,-10 (ix)
   7138 09            [11] 2113 	add	hl, bc
   7139 DD 75 F5      [19] 2114 	ld	-11 (ix),l
                           2115 ;src/main.c:442: enemy->seen = NO;
   713C 21 11 00      [10] 2116 	ld	hl,#0x0011
   713F 19            [11] 2117 	add	hl,de
   7140 DD 75 FA      [19] 2118 	ld	-6 (ix),l
   7143 DD 74 FB      [19] 2119 	ld	-5 (ix),h
   7146 DD 6E FA      [19] 2120 	ld	l,-6 (ix)
   7149 DD 66 FB      [19] 2121 	ld	h,-5 (ix)
   714C 36 00         [10] 2122 	ld	(hl),#0x00
                           2123 ;src/main.c:443: enemy->inRange = NO;
   714E 21 10 00      [10] 2124 	ld	hl,#0x0010
   7151 19            [11] 2125 	add	hl,de
   7152 DD 75 FE      [19] 2126 	ld	-2 (ix),l
   7155 DD 74 FF      [19] 2127 	ld	-1 (ix),h
   7158 DD 6E FE      [19] 2128 	ld	l,-2 (ix)
   715B DD 66 FF      [19] 2129 	ld	h,-1 (ix)
   715E 36 00         [10] 2130 	ld	(hl),#0x00
                           2131 ;src/main.c:444: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90);
   7160 D5            [11] 2132 	push	de
   7161 21 18 5A      [10] 2133 	ld	hl,#0x5A18
   7164 E5            [11] 2134 	push	hl
   7165 21 00 C0      [10] 2135 	ld	hl,#0xC000
   7168 E5            [11] 2136 	push	hl
   7169 CD AD 5F      [17] 2137 	call	_cpct_getScreenPtr
   716C D1            [10] 2138 	pop	de
                           2139 ;src/main.c:445: if(!enemy->seek){
   716D D5            [11] 2140 	push	de
   716E FD E1         [14] 2141 	pop	iy
   7170 FD 7E 13      [19] 2142 	ld	a,19 (iy)
   7173 B7            [ 4] 2143 	or	a, a
   7174 C2 0B 72      [10] 2144 	jp	NZ,00111$
                           2145 ;src/main.c:446: if(prota.x > enemy->x - 25 && prota.x < enemy->x + 25
   7177 21 1C 65      [10] 2146 	ld	hl, #_prota + 0
   717A 4E            [ 7] 2147 	ld	c,(hl)
   717B 1A            [ 7] 2148 	ld	a,(de)
   717C 6F            [ 4] 2149 	ld	l,a
   717D 26 00         [ 7] 2150 	ld	h,#0x00
   717F 7D            [ 4] 2151 	ld	a,l
   7180 C6 E7         [ 7] 2152 	add	a,#0xE7
   7182 DD 77 F8      [19] 2153 	ld	-8 (ix),a
   7185 7C            [ 4] 2154 	ld	a,h
   7186 CE FF         [ 7] 2155 	adc	a,#0xFF
   7188 DD 77 F9      [19] 2156 	ld	-7 (ix),a
   718B 06 00         [ 7] 2157 	ld	b,#0x00
   718D DD 7E F8      [19] 2158 	ld	a,-8 (ix)
   7190 91            [ 4] 2159 	sub	a, c
   7191 DD 7E F9      [19] 2160 	ld	a,-7 (ix)
   7194 98            [ 4] 2161 	sbc	a, b
   7195 E2 9A 71      [10] 2162 	jp	PO, 00137$
   7198 EE 80         [ 7] 2163 	xor	a, #0x80
   719A                    2164 00137$:
   719A F2 F6 71      [10] 2165 	jp	P,00104$
   719D D5            [11] 2166 	push	de
   719E 11 19 00      [10] 2167 	ld	de,#0x0019
   71A1 19            [11] 2168 	add	hl, de
   71A2 D1            [10] 2169 	pop	de
   71A3 79            [ 4] 2170 	ld	a,c
   71A4 95            [ 4] 2171 	sub	a, l
   71A5 78            [ 4] 2172 	ld	a,b
   71A6 9C            [ 4] 2173 	sbc	a, h
   71A7 E2 AC 71      [10] 2174 	jp	PO, 00138$
   71AA EE 80         [ 7] 2175 	xor	a, #0x80
   71AC                    2176 00138$:
   71AC F2 F6 71      [10] 2177 	jp	P,00104$
                           2178 ;src/main.c:447: && prota.y > enemy->y - 25 && prota.y < enemy->y + 25){
   71AF 21 1D 65      [10] 2179 	ld	hl, #(_prota + 0x0001) + 0
   71B2 4E            [ 7] 2180 	ld	c,(hl)
   71B3 DD 6E FC      [19] 2181 	ld	l,-4 (ix)
   71B6 DD 66 FD      [19] 2182 	ld	h,-3 (ix)
   71B9 6E            [ 7] 2183 	ld	l,(hl)
   71BA 26 00         [ 7] 2184 	ld	h,#0x00
   71BC 7D            [ 4] 2185 	ld	a,l
   71BD C6 E7         [ 7] 2186 	add	a,#0xE7
   71BF DD 77 F8      [19] 2187 	ld	-8 (ix),a
   71C2 7C            [ 4] 2188 	ld	a,h
   71C3 CE FF         [ 7] 2189 	adc	a,#0xFF
   71C5 DD 77 F9      [19] 2190 	ld	-7 (ix),a
   71C8 06 00         [ 7] 2191 	ld	b,#0x00
   71CA DD 7E F8      [19] 2192 	ld	a,-8 (ix)
   71CD 91            [ 4] 2193 	sub	a, c
   71CE DD 7E F9      [19] 2194 	ld	a,-7 (ix)
   71D1 98            [ 4] 2195 	sbc	a, b
   71D2 E2 D7 71      [10] 2196 	jp	PO, 00139$
   71D5 EE 80         [ 7] 2197 	xor	a, #0x80
   71D7                    2198 00139$:
   71D7 F2 F6 71      [10] 2199 	jp	P,00104$
   71DA D5            [11] 2200 	push	de
   71DB 11 19 00      [10] 2201 	ld	de,#0x0019
   71DE 19            [11] 2202 	add	hl, de
   71DF D1            [10] 2203 	pop	de
   71E0 79            [ 4] 2204 	ld	a,c
   71E1 95            [ 4] 2205 	sub	a, l
   71E2 78            [ 4] 2206 	ld	a,b
   71E3 9C            [ 4] 2207 	sbc	a, h
   71E4 E2 E9 71      [10] 2208 	jp	PO, 00140$
   71E7 EE 80         [ 7] 2209 	xor	a, #0x80
   71E9                    2210 00140$:
   71E9 F2 F6 71      [10] 2211 	jp	P,00104$
                           2212 ;src/main.c:448: enemy->seen = SI;
   71EC DD 6E FA      [19] 2213 	ld	l,-6 (ix)
   71EF DD 66 FB      [19] 2214 	ld	h,-5 (ix)
   71F2 36 01         [10] 2215 	ld	(hl),#0x01
   71F4 18 15         [12] 2216 	jr	00111$
   71F6                    2217 00104$:
                           2218 ;src/main.c:450: }else   if (dist <= 10) {// te detectan los sensores de proximidad
   71F6 3E 0A         [ 7] 2219 	ld	a,#0x0A
   71F8 DD 96 F5      [19] 2220 	sub	a, -11 (ix)
   71FB 38 0E         [12] 2221 	jr	C,00111$
                           2222 ;src/main.c:451: enemy->inRange = 1;
   71FD DD 6E FE      [19] 2223 	ld	l,-2 (ix)
   7200 DD 66 FF      [19] 2224 	ld	h,-1 (ix)
   7203 36 01         [10] 2225 	ld	(hl),#0x01
                           2226 ;src/main.c:452: enemy->engage = 1;
   7205 21 15 00      [10] 2227 	ld	hl,#0x0015
   7208 19            [11] 2228 	add	hl,de
   7209 36 01         [10] 2229 	ld	(hl),#0x01
   720B                    2230 00111$:
   720B DD F9         [10] 2231 	ld	sp, ix
   720D DD E1         [14] 2232 	pop	ix
   720F C9            [10] 2233 	ret
                           2234 ;src/main.c:457: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2235 ;	---------------------------------
                           2236 ; Function engage
                           2237 ; ---------------------------------
   7210                    2238 _engage::
   7210 DD E5         [15] 2239 	push	ix
   7212 DD 21 00 00   [14] 2240 	ld	ix,#0
   7216 DD 39         [15] 2241 	add	ix,sp
   7218 21 F3 FF      [10] 2242 	ld	hl,#-13
   721B 39            [11] 2243 	add	hl,sp
   721C F9            [ 6] 2244 	ld	sp,hl
                           2245 ;src/main.c:458: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   721D DD 7E 04      [19] 2246 	ld	a,4 (ix)
   7220 DD 77 F7      [19] 2247 	ld	-9 (ix),a
   7223 DD 7E 05      [19] 2248 	ld	a,5 (ix)
   7226 DD 77 F8      [19] 2249 	ld	-8 (ix),a
   7229 DD 6E F7      [19] 2250 	ld	l,-9 (ix)
   722C DD 66 F8      [19] 2251 	ld	h,-8 (ix)
   722F 4E            [ 7] 2252 	ld	c,(hl)
   7230 06 00         [ 7] 2253 	ld	b,#0x00
   7232 21 1C 65      [10] 2254 	ld	hl,#_prota+0
   7235 5E            [ 7] 2255 	ld	e,(hl)
   7236 16 00         [ 7] 2256 	ld	d,#0x00
   7238 79            [ 4] 2257 	ld	a,c
   7239 93            [ 4] 2258 	sub	a, e
   723A 4F            [ 4] 2259 	ld	c,a
   723B 78            [ 4] 2260 	ld	a,b
   723C 9A            [ 4] 2261 	sbc	a, d
   723D 47            [ 4] 2262 	ld	b,a
   723E C5            [11] 2263 	push	bc
   723F CD 08 4B      [17] 2264 	call	_abs
   7242 F1            [10] 2265 	pop	af
   7243 4D            [ 4] 2266 	ld	c,l
                           2267 ;src/main.c:459: u8 dify = abs(enemy->y - prota.y);
   7244 DD 7E F7      [19] 2268 	ld	a,-9 (ix)
   7247 C6 01         [ 7] 2269 	add	a, #0x01
   7249 DD 77 F9      [19] 2270 	ld	-7 (ix),a
   724C DD 7E F8      [19] 2271 	ld	a,-8 (ix)
   724F CE 00         [ 7] 2272 	adc	a, #0x00
   7251 DD 77 FA      [19] 2273 	ld	-6 (ix),a
   7254 DD 6E F9      [19] 2274 	ld	l,-7 (ix)
   7257 DD 66 FA      [19] 2275 	ld	h,-6 (ix)
   725A 5E            [ 7] 2276 	ld	e,(hl)
   725B 16 00         [ 7] 2277 	ld	d,#0x00
   725D 21 1D 65      [10] 2278 	ld	hl,#_prota+1
   7260 6E            [ 7] 2279 	ld	l,(hl)
   7261 26 00         [ 7] 2280 	ld	h,#0x00
   7263 7B            [ 4] 2281 	ld	a,e
   7264 95            [ 4] 2282 	sub	a, l
   7265 5F            [ 4] 2283 	ld	e,a
   7266 7A            [ 4] 2284 	ld	a,d
   7267 9C            [ 4] 2285 	sbc	a, h
   7268 57            [ 4] 2286 	ld	d,a
   7269 C5            [11] 2287 	push	bc
   726A D5            [11] 2288 	push	de
   726B CD 08 4B      [17] 2289 	call	_abs
   726E F1            [10] 2290 	pop	af
   726F C1            [10] 2291 	pop	bc
                           2292 ;src/main.c:460: u8 dist = difx + dify; // manhattan
   7270 09            [11] 2293 	add	hl, bc
   7271 DD 75 F3      [19] 2294 	ld	-13 (ix),l
                           2295 ;src/main.c:462: u8 movX = 0;
   7274 DD 36 F6 00   [19] 2296 	ld	-10 (ix),#0x00
                           2297 ;src/main.c:463: u8 movY = 0;
   7278 DD 36 F5 00   [19] 2298 	ld	-11 (ix),#0x00
                           2299 ;src/main.c:464: u8 mov = 0;
   727C DD 36 F4 00   [19] 2300 	ld	-12 (ix),#0x00
                           2301 ;src/main.c:466: if (enemy->y == dy) { // alineado en el eje x
   7280 DD 6E F9      [19] 2302 	ld	l,-7 (ix)
   7283 DD 66 FA      [19] 2303 	ld	h,-6 (ix)
   7286 7E            [ 7] 2304 	ld	a,(hl)
   7287 DD 77 FB      [19] 2305 	ld	-5 (ix),a
                           2306 ;src/main.c:468: if (dist > 10) {
   728A 3E 0A         [ 7] 2307 	ld	a,#0x0A
   728C DD 96 F3      [19] 2308 	sub	a, -13 (ix)
   728F 3E 00         [ 7] 2309 	ld	a,#0x00
   7291 17            [ 4] 2310 	rla
   7292 DD 77 FC      [19] 2311 	ld	-4 (ix),a
                           2312 ;src/main.c:466: if (enemy->y == dy) { // alineado en el eje x
   7295 DD 7E 07      [19] 2313 	ld	a,7 (ix)
   7298 DD 96 FB      [19] 2314 	sub	a, -5 (ix)
   729B C2 9D 73      [10] 2315 	jp	NZ,00187$
                           2316 ;src/main.c:468: if (dist > 10) {
   729E DD 7E FC      [19] 2317 	ld	a,-4 (ix)
   72A1 B7            [ 4] 2318 	or	a, a
   72A2 CA 01 79      [10] 2319 	jp	Z,00189$
                           2320 ;src/main.c:469: if (dx < enemy->x) { // izquierda
   72A5 DD 6E F7      [19] 2321 	ld	l,-9 (ix)
   72A8 DD 66 F8      [19] 2322 	ld	h,-8 (ix)
   72AB 46            [ 7] 2323 	ld	b,(hl)
   72AC DD 7E 06      [19] 2324 	ld	a,6 (ix)
   72AF 90            [ 4] 2325 	sub	a, b
   72B0 30 72         [12] 2326 	jr	NC,00110$
                           2327 ;src/main.c:470: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   72B2 05            [ 4] 2328 	dec	b
   72B3 DD 7E FB      [19] 2329 	ld	a,-5 (ix)
   72B6 F5            [11] 2330 	push	af
   72B7 33            [ 6] 2331 	inc	sp
   72B8 C5            [11] 2332 	push	bc
   72B9 33            [ 6] 2333 	inc	sp
   72BA 2A F8 65      [16] 2334 	ld	hl,(_mapa)
   72BD E5            [11] 2335 	push	hl
   72BE CD C4 4A      [17] 2336 	call	_getTilePtr
   72C1 F1            [10] 2337 	pop	af
   72C2 F1            [10] 2338 	pop	af
   72C3 4E            [ 7] 2339 	ld	c,(hl)
   72C4 3E 02         [ 7] 2340 	ld	a,#0x02
   72C6 91            [ 4] 2341 	sub	a, c
   72C7 DA 01 79      [10] 2342 	jp	C,00189$
                           2343 ;src/main.c:471: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   72CA DD 6E F9      [19] 2344 	ld	l,-7 (ix)
   72CD DD 66 FA      [19] 2345 	ld	h,-6 (ix)
   72D0 7E            [ 7] 2346 	ld	a,(hl)
   72D1 C6 0B         [ 7] 2347 	add	a, #0x0B
   72D3 57            [ 4] 2348 	ld	d,a
   72D4 DD 6E F7      [19] 2349 	ld	l,-9 (ix)
   72D7 DD 66 F8      [19] 2350 	ld	h,-8 (ix)
   72DA 46            [ 7] 2351 	ld	b,(hl)
   72DB 05            [ 4] 2352 	dec	b
   72DC D5            [11] 2353 	push	de
   72DD 33            [ 6] 2354 	inc	sp
   72DE C5            [11] 2355 	push	bc
   72DF 33            [ 6] 2356 	inc	sp
   72E0 2A F8 65      [16] 2357 	ld	hl,(_mapa)
   72E3 E5            [11] 2358 	push	hl
   72E4 CD C4 4A      [17] 2359 	call	_getTilePtr
   72E7 F1            [10] 2360 	pop	af
   72E8 F1            [10] 2361 	pop	af
   72E9 4E            [ 7] 2362 	ld	c,(hl)
   72EA 3E 02         [ 7] 2363 	ld	a,#0x02
   72EC 91            [ 4] 2364 	sub	a, c
   72ED DA 01 79      [10] 2365 	jp	C,00189$
                           2366 ;src/main.c:472: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   72F0 DD 6E F9      [19] 2367 	ld	l,-7 (ix)
   72F3 DD 66 FA      [19] 2368 	ld	h,-6 (ix)
   72F6 7E            [ 7] 2369 	ld	a,(hl)
   72F7 C6 16         [ 7] 2370 	add	a, #0x16
   72F9 57            [ 4] 2371 	ld	d,a
   72FA DD 6E F7      [19] 2372 	ld	l,-9 (ix)
   72FD DD 66 F8      [19] 2373 	ld	h,-8 (ix)
   7300 46            [ 7] 2374 	ld	b,(hl)
   7301 05            [ 4] 2375 	dec	b
   7302 D5            [11] 2376 	push	de
   7303 33            [ 6] 2377 	inc	sp
   7304 C5            [11] 2378 	push	bc
   7305 33            [ 6] 2379 	inc	sp
   7306 2A F8 65      [16] 2380 	ld	hl,(_mapa)
   7309 E5            [11] 2381 	push	hl
   730A CD C4 4A      [17] 2382 	call	_getTilePtr
   730D F1            [10] 2383 	pop	af
   730E F1            [10] 2384 	pop	af
   730F 4E            [ 7] 2385 	ld	c,(hl)
   7310 3E 02         [ 7] 2386 	ld	a,#0x02
   7312 91            [ 4] 2387 	sub	a, c
   7313 DA 01 79      [10] 2388 	jp	C,00189$
                           2389 ;src/main.c:473: moverEnemigoIzquierda(enemy);
   7316 DD 6E F7      [19] 2390 	ld	l,-9 (ix)
   7319 DD 66 F8      [19] 2391 	ld	h,-8 (ix)
   731C E5            [11] 2392 	push	hl
   731D CD 9F 6E      [17] 2393 	call	_moverEnemigoIzquierda
   7320 F1            [10] 2394 	pop	af
                           2395 ;src/main.c:475: mov = 1;
   7321 C3 01 79      [10] 2396 	jp	00189$
   7324                    2397 00110$:
                           2398 ;src/main.c:478: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   7324 78            [ 4] 2399 	ld	a,b
   7325 C6 05         [ 7] 2400 	add	a, #0x05
   7327 47            [ 4] 2401 	ld	b,a
   7328 DD 7E FB      [19] 2402 	ld	a,-5 (ix)
   732B F5            [11] 2403 	push	af
   732C 33            [ 6] 2404 	inc	sp
   732D C5            [11] 2405 	push	bc
   732E 33            [ 6] 2406 	inc	sp
   732F 2A F8 65      [16] 2407 	ld	hl,(_mapa)
   7332 E5            [11] 2408 	push	hl
   7333 CD C4 4A      [17] 2409 	call	_getTilePtr
   7336 F1            [10] 2410 	pop	af
   7337 F1            [10] 2411 	pop	af
   7338 4E            [ 7] 2412 	ld	c,(hl)
   7339 3E 02         [ 7] 2413 	ld	a,#0x02
   733B 91            [ 4] 2414 	sub	a, c
   733C DA 01 79      [10] 2415 	jp	C,00189$
                           2416 ;src/main.c:479: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   733F DD 6E F9      [19] 2417 	ld	l,-7 (ix)
   7342 DD 66 FA      [19] 2418 	ld	h,-6 (ix)
   7345 7E            [ 7] 2419 	ld	a,(hl)
   7346 C6 0B         [ 7] 2420 	add	a, #0x0B
   7348 57            [ 4] 2421 	ld	d,a
   7349 DD 6E F7      [19] 2422 	ld	l,-9 (ix)
   734C DD 66 F8      [19] 2423 	ld	h,-8 (ix)
   734F 7E            [ 7] 2424 	ld	a,(hl)
   7350 C6 05         [ 7] 2425 	add	a, #0x05
   7352 47            [ 4] 2426 	ld	b,a
   7353 D5            [11] 2427 	push	de
   7354 33            [ 6] 2428 	inc	sp
   7355 C5            [11] 2429 	push	bc
   7356 33            [ 6] 2430 	inc	sp
   7357 2A F8 65      [16] 2431 	ld	hl,(_mapa)
   735A E5            [11] 2432 	push	hl
   735B CD C4 4A      [17] 2433 	call	_getTilePtr
   735E F1            [10] 2434 	pop	af
   735F F1            [10] 2435 	pop	af
   7360 4E            [ 7] 2436 	ld	c,(hl)
   7361 3E 02         [ 7] 2437 	ld	a,#0x02
   7363 91            [ 4] 2438 	sub	a, c
   7364 DA 01 79      [10] 2439 	jp	C,00189$
                           2440 ;src/main.c:480: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   7367 DD 6E F9      [19] 2441 	ld	l,-7 (ix)
   736A DD 66 FA      [19] 2442 	ld	h,-6 (ix)
   736D 7E            [ 7] 2443 	ld	a,(hl)
   736E C6 16         [ 7] 2444 	add	a, #0x16
   7370 57            [ 4] 2445 	ld	d,a
   7371 DD 6E F7      [19] 2446 	ld	l,-9 (ix)
   7374 DD 66 F8      [19] 2447 	ld	h,-8 (ix)
   7377 7E            [ 7] 2448 	ld	a,(hl)
   7378 C6 05         [ 7] 2449 	add	a, #0x05
   737A 47            [ 4] 2450 	ld	b,a
   737B D5            [11] 2451 	push	de
   737C 33            [ 6] 2452 	inc	sp
   737D C5            [11] 2453 	push	bc
   737E 33            [ 6] 2454 	inc	sp
   737F 2A F8 65      [16] 2455 	ld	hl,(_mapa)
   7382 E5            [11] 2456 	push	hl
   7383 CD C4 4A      [17] 2457 	call	_getTilePtr
   7386 F1            [10] 2458 	pop	af
   7387 F1            [10] 2459 	pop	af
   7388 4E            [ 7] 2460 	ld	c,(hl)
   7389 3E 02         [ 7] 2461 	ld	a,#0x02
   738B 91            [ 4] 2462 	sub	a, c
   738C DA 01 79      [10] 2463 	jp	C,00189$
                           2464 ;src/main.c:481: moverEnemigoDerecha(enemy);
   738F DD 6E F7      [19] 2465 	ld	l,-9 (ix)
   7392 DD 66 F8      [19] 2466 	ld	h,-8 (ix)
   7395 E5            [11] 2467 	push	hl
   7396 CD 8F 6E      [17] 2468 	call	_moverEnemigoDerecha
   7399 F1            [10] 2469 	pop	af
                           2470 ;src/main.c:483: mov = 1;
   739A C3 01 79      [10] 2471 	jp	00189$
   739D                    2472 00187$:
                           2473 ;src/main.c:488: else if (enemy->x == dx) {
   739D DD 6E F7      [19] 2474 	ld	l,-9 (ix)
   73A0 DD 66 F8      [19] 2475 	ld	h,-8 (ix)
   73A3 7E            [ 7] 2476 	ld	a,(hl)
   73A4 DD 77 FD      [19] 2477 	ld	-3 (ix), a
   73A7 DD 96 06      [19] 2478 	sub	a, 6 (ix)
   73AA C2 A7 74      [10] 2479 	jp	NZ,00184$
                           2480 ;src/main.c:490: if (dist > 10) {
   73AD DD 7E FC      [19] 2481 	ld	a,-4 (ix)
   73B0 B7            [ 4] 2482 	or	a, a
   73B1 CA 01 79      [10] 2483 	jp	Z,00189$
                           2484 ;src/main.c:491: if (dy < enemy->y) {
   73B4 DD 7E 07      [19] 2485 	ld	a,7 (ix)
   73B7 DD 96 FB      [19] 2486 	sub	a, -5 (ix)
   73BA 30 74         [12] 2487 	jr	NC,00123$
                           2488 ;src/main.c:492: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   73BC DD 46 FB      [19] 2489 	ld	b,-5 (ix)
   73BF 05            [ 4] 2490 	dec	b
   73C0 05            [ 4] 2491 	dec	b
   73C1 C5            [11] 2492 	push	bc
   73C2 33            [ 6] 2493 	inc	sp
   73C3 DD 7E FD      [19] 2494 	ld	a,-3 (ix)
   73C6 F5            [11] 2495 	push	af
   73C7 33            [ 6] 2496 	inc	sp
   73C8 2A F8 65      [16] 2497 	ld	hl,(_mapa)
   73CB E5            [11] 2498 	push	hl
   73CC CD C4 4A      [17] 2499 	call	_getTilePtr
   73CF F1            [10] 2500 	pop	af
   73D0 F1            [10] 2501 	pop	af
   73D1 4E            [ 7] 2502 	ld	c,(hl)
   73D2 3E 02         [ 7] 2503 	ld	a,#0x02
   73D4 91            [ 4] 2504 	sub	a, c
   73D5 DA 01 79      [10] 2505 	jp	C,00189$
                           2506 ;src/main.c:493: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   73D8 DD 6E F9      [19] 2507 	ld	l,-7 (ix)
   73DB DD 66 FA      [19] 2508 	ld	h,-6 (ix)
   73DE 46            [ 7] 2509 	ld	b,(hl)
   73DF 05            [ 4] 2510 	dec	b
   73E0 05            [ 4] 2511 	dec	b
   73E1 DD 6E F7      [19] 2512 	ld	l,-9 (ix)
   73E4 DD 66 F8      [19] 2513 	ld	h,-8 (ix)
   73E7 56            [ 7] 2514 	ld	d,(hl)
   73E8 14            [ 4] 2515 	inc	d
   73E9 14            [ 4] 2516 	inc	d
   73EA 4A            [ 4] 2517 	ld	c, d
   73EB C5            [11] 2518 	push	bc
   73EC 2A F8 65      [16] 2519 	ld	hl,(_mapa)
   73EF E5            [11] 2520 	push	hl
   73F0 CD C4 4A      [17] 2521 	call	_getTilePtr
   73F3 F1            [10] 2522 	pop	af
   73F4 F1            [10] 2523 	pop	af
   73F5 4E            [ 7] 2524 	ld	c,(hl)
   73F6 3E 02         [ 7] 2525 	ld	a,#0x02
   73F8 91            [ 4] 2526 	sub	a, c
   73F9 DA 01 79      [10] 2527 	jp	C,00189$
                           2528 ;src/main.c:494: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   73FC DD 6E F9      [19] 2529 	ld	l,-7 (ix)
   73FF DD 66 FA      [19] 2530 	ld	h,-6 (ix)
   7402 46            [ 7] 2531 	ld	b,(hl)
   7403 05            [ 4] 2532 	dec	b
   7404 05            [ 4] 2533 	dec	b
   7405 DD 6E F7      [19] 2534 	ld	l,-9 (ix)
   7408 DD 66 F8      [19] 2535 	ld	h,-8 (ix)
   740B 7E            [ 7] 2536 	ld	a,(hl)
   740C C6 04         [ 7] 2537 	add	a, #0x04
   740E C5            [11] 2538 	push	bc
   740F 33            [ 6] 2539 	inc	sp
   7410 F5            [11] 2540 	push	af
   7411 33            [ 6] 2541 	inc	sp
   7412 2A F8 65      [16] 2542 	ld	hl,(_mapa)
   7415 E5            [11] 2543 	push	hl
   7416 CD C4 4A      [17] 2544 	call	_getTilePtr
   7419 F1            [10] 2545 	pop	af
   741A F1            [10] 2546 	pop	af
   741B 4E            [ 7] 2547 	ld	c,(hl)
   741C 3E 02         [ 7] 2548 	ld	a,#0x02
   741E 91            [ 4] 2549 	sub	a, c
   741F DA 01 79      [10] 2550 	jp	C,00189$
                           2551 ;src/main.c:495: moverEnemigoArriba(enemy);
   7422 DD 6E F7      [19] 2552 	ld	l,-9 (ix)
   7425 DD 66 F8      [19] 2553 	ld	h,-8 (ix)
   7428 E5            [11] 2554 	push	hl
   7429 CD 51 6E      [17] 2555 	call	_moverEnemigoArriba
   742C F1            [10] 2556 	pop	af
                           2557 ;src/main.c:497: mov = 1;
   742D C3 01 79      [10] 2558 	jp	00189$
   7430                    2559 00123$:
                           2560 ;src/main.c:500: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7430 DD 7E FB      [19] 2561 	ld	a,-5 (ix)
   7433 C6 18         [ 7] 2562 	add	a, #0x18
   7435 47            [ 4] 2563 	ld	b,a
   7436 C5            [11] 2564 	push	bc
   7437 33            [ 6] 2565 	inc	sp
   7438 DD 7E FD      [19] 2566 	ld	a,-3 (ix)
   743B F5            [11] 2567 	push	af
   743C 33            [ 6] 2568 	inc	sp
   743D 2A F8 65      [16] 2569 	ld	hl,(_mapa)
   7440 E5            [11] 2570 	push	hl
   7441 CD C4 4A      [17] 2571 	call	_getTilePtr
   7444 F1            [10] 2572 	pop	af
   7445 F1            [10] 2573 	pop	af
   7446 4E            [ 7] 2574 	ld	c,(hl)
   7447 3E 02         [ 7] 2575 	ld	a,#0x02
   7449 91            [ 4] 2576 	sub	a, c
   744A DA 01 79      [10] 2577 	jp	C,00189$
                           2578 ;src/main.c:501: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   744D DD 6E F9      [19] 2579 	ld	l,-7 (ix)
   7450 DD 66 FA      [19] 2580 	ld	h,-6 (ix)
   7453 7E            [ 7] 2581 	ld	a,(hl)
   7454 C6 18         [ 7] 2582 	add	a, #0x18
   7456 47            [ 4] 2583 	ld	b,a
   7457 DD 6E F7      [19] 2584 	ld	l,-9 (ix)
   745A DD 66 F8      [19] 2585 	ld	h,-8 (ix)
   745D 56            [ 7] 2586 	ld	d,(hl)
   745E 14            [ 4] 2587 	inc	d
   745F 14            [ 4] 2588 	inc	d
   7460 4A            [ 4] 2589 	ld	c, d
   7461 C5            [11] 2590 	push	bc
   7462 2A F8 65      [16] 2591 	ld	hl,(_mapa)
   7465 E5            [11] 2592 	push	hl
   7466 CD C4 4A      [17] 2593 	call	_getTilePtr
   7469 F1            [10] 2594 	pop	af
   746A F1            [10] 2595 	pop	af
   746B 4E            [ 7] 2596 	ld	c,(hl)
   746C 3E 02         [ 7] 2597 	ld	a,#0x02
   746E 91            [ 4] 2598 	sub	a, c
   746F DA 01 79      [10] 2599 	jp	C,00189$
                           2600 ;src/main.c:502: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7472 DD 6E F9      [19] 2601 	ld	l,-7 (ix)
   7475 DD 66 FA      [19] 2602 	ld	h,-6 (ix)
   7478 7E            [ 7] 2603 	ld	a,(hl)
   7479 C6 18         [ 7] 2604 	add	a, #0x18
   747B 47            [ 4] 2605 	ld	b,a
   747C DD 6E F7      [19] 2606 	ld	l,-9 (ix)
   747F DD 66 F8      [19] 2607 	ld	h,-8 (ix)
   7482 7E            [ 7] 2608 	ld	a,(hl)
   7483 C6 04         [ 7] 2609 	add	a, #0x04
   7485 C5            [11] 2610 	push	bc
   7486 33            [ 6] 2611 	inc	sp
   7487 F5            [11] 2612 	push	af
   7488 33            [ 6] 2613 	inc	sp
   7489 2A F8 65      [16] 2614 	ld	hl,(_mapa)
   748C E5            [11] 2615 	push	hl
   748D CD C4 4A      [17] 2616 	call	_getTilePtr
   7490 F1            [10] 2617 	pop	af
   7491 F1            [10] 2618 	pop	af
   7492 4E            [ 7] 2619 	ld	c,(hl)
   7493 3E 02         [ 7] 2620 	ld	a,#0x02
   7495 91            [ 4] 2621 	sub	a, c
   7496 DA 01 79      [10] 2622 	jp	C,00189$
                           2623 ;src/main.c:503: moverEnemigoAbajo(enemy);
   7499 DD 6E F7      [19] 2624 	ld	l,-9 (ix)
   749C DD 66 F8      [19] 2625 	ld	h,-8 (ix)
   749F E5            [11] 2626 	push	hl
   74A0 CD 70 6E      [17] 2627 	call	_moverEnemigoAbajo
   74A3 F1            [10] 2628 	pop	af
                           2629 ;src/main.c:505: mov = 1;
   74A4 C3 01 79      [10] 2630 	jp	00189$
   74A7                    2631 00184$:
                           2632 ;src/main.c:511: if (dist > 20) {
   74A7 3E 14         [ 7] 2633 	ld	a,#0x14
   74A9 DD 96 F3      [19] 2634 	sub	a, -13 (ix)
   74AC D2 01 79      [10] 2635 	jp	NC,00189$
                           2636 ;src/main.c:512: if (dx < enemy->x) {
   74AF DD 7E 06      [19] 2637 	ld	a,6 (ix)
   74B2 DD 96 FD      [19] 2638 	sub	a, -3 (ix)
   74B5 D2 37 75      [10] 2639 	jp	NC,00136$
                           2640 ;src/main.c:513: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   74B8 DD 46 FD      [19] 2641 	ld	b,-3 (ix)
   74BB 05            [ 4] 2642 	dec	b
   74BC DD 7E FB      [19] 2643 	ld	a,-5 (ix)
   74BF F5            [11] 2644 	push	af
   74C0 33            [ 6] 2645 	inc	sp
   74C1 C5            [11] 2646 	push	bc
   74C2 33            [ 6] 2647 	inc	sp
   74C3 2A F8 65      [16] 2648 	ld	hl,(_mapa)
   74C6 E5            [11] 2649 	push	hl
   74C7 CD C4 4A      [17] 2650 	call	_getTilePtr
   74CA F1            [10] 2651 	pop	af
   74CB F1            [10] 2652 	pop	af
   74CC 4E            [ 7] 2653 	ld	c,(hl)
   74CD 3E 02         [ 7] 2654 	ld	a,#0x02
   74CF 91            [ 4] 2655 	sub	a, c
   74D0 DA B4 75      [10] 2656 	jp	C,00137$
                           2657 ;src/main.c:514: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   74D3 DD 6E F9      [19] 2658 	ld	l,-7 (ix)
   74D6 DD 66 FA      [19] 2659 	ld	h,-6 (ix)
   74D9 7E            [ 7] 2660 	ld	a,(hl)
   74DA C6 0B         [ 7] 2661 	add	a, #0x0B
   74DC 4F            [ 4] 2662 	ld	c,a
   74DD DD 6E F7      [19] 2663 	ld	l,-9 (ix)
   74E0 DD 66 F8      [19] 2664 	ld	h,-8 (ix)
   74E3 46            [ 7] 2665 	ld	b,(hl)
   74E4 05            [ 4] 2666 	dec	b
   74E5 79            [ 4] 2667 	ld	a,c
   74E6 F5            [11] 2668 	push	af
   74E7 33            [ 6] 2669 	inc	sp
   74E8 C5            [11] 2670 	push	bc
   74E9 33            [ 6] 2671 	inc	sp
   74EA 2A F8 65      [16] 2672 	ld	hl,(_mapa)
   74ED E5            [11] 2673 	push	hl
   74EE CD C4 4A      [17] 2674 	call	_getTilePtr
   74F1 F1            [10] 2675 	pop	af
   74F2 F1            [10] 2676 	pop	af
   74F3 4E            [ 7] 2677 	ld	c,(hl)
   74F4 3E 02         [ 7] 2678 	ld	a,#0x02
   74F6 91            [ 4] 2679 	sub	a, c
   74F7 DA B4 75      [10] 2680 	jp	C,00137$
                           2681 ;src/main.c:515: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   74FA DD 6E F9      [19] 2682 	ld	l,-7 (ix)
   74FD DD 66 FA      [19] 2683 	ld	h,-6 (ix)
   7500 7E            [ 7] 2684 	ld	a,(hl)
   7501 C6 16         [ 7] 2685 	add	a, #0x16
   7503 4F            [ 4] 2686 	ld	c,a
   7504 DD 6E F7      [19] 2687 	ld	l,-9 (ix)
   7507 DD 66 F8      [19] 2688 	ld	h,-8 (ix)
   750A 46            [ 7] 2689 	ld	b,(hl)
   750B 05            [ 4] 2690 	dec	b
   750C 79            [ 4] 2691 	ld	a,c
   750D F5            [11] 2692 	push	af
   750E 33            [ 6] 2693 	inc	sp
   750F C5            [11] 2694 	push	bc
   7510 33            [ 6] 2695 	inc	sp
   7511 2A F8 65      [16] 2696 	ld	hl,(_mapa)
   7514 E5            [11] 2697 	push	hl
   7515 CD C4 4A      [17] 2698 	call	_getTilePtr
   7518 F1            [10] 2699 	pop	af
   7519 F1            [10] 2700 	pop	af
   751A 4E            [ 7] 2701 	ld	c,(hl)
   751B 3E 02         [ 7] 2702 	ld	a,#0x02
   751D 91            [ 4] 2703 	sub	a, c
   751E DA B4 75      [10] 2704 	jp	C,00137$
                           2705 ;src/main.c:516: moverEnemigoIzquierda(enemy);
   7521 DD 6E F7      [19] 2706 	ld	l,-9 (ix)
   7524 DD 66 F8      [19] 2707 	ld	h,-8 (ix)
   7527 E5            [11] 2708 	push	hl
   7528 CD 9F 6E      [17] 2709 	call	_moverEnemigoIzquierda
   752B F1            [10] 2710 	pop	af
                           2711 ;src/main.c:517: movX = 1;
   752C DD 36 F6 01   [19] 2712 	ld	-10 (ix),#0x01
                           2713 ;src/main.c:518: mov = 1;
   7530 DD 36 F4 01   [19] 2714 	ld	-12 (ix),#0x01
   7534 C3 B4 75      [10] 2715 	jp	00137$
   7537                    2716 00136$:
                           2717 ;src/main.c:521: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   7537 DD 7E FD      [19] 2718 	ld	a,-3 (ix)
   753A C6 05         [ 7] 2719 	add	a, #0x05
   753C 47            [ 4] 2720 	ld	b,a
   753D DD 7E FB      [19] 2721 	ld	a,-5 (ix)
   7540 F5            [11] 2722 	push	af
   7541 33            [ 6] 2723 	inc	sp
   7542 C5            [11] 2724 	push	bc
   7543 33            [ 6] 2725 	inc	sp
   7544 2A F8 65      [16] 2726 	ld	hl,(_mapa)
   7547 E5            [11] 2727 	push	hl
   7548 CD C4 4A      [17] 2728 	call	_getTilePtr
   754B F1            [10] 2729 	pop	af
   754C F1            [10] 2730 	pop	af
   754D 4E            [ 7] 2731 	ld	c,(hl)
   754E 3E 02         [ 7] 2732 	ld	a,#0x02
   7550 91            [ 4] 2733 	sub	a, c
   7551 38 61         [12] 2734 	jr	C,00137$
                           2735 ;src/main.c:522: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   7553 DD 6E F9      [19] 2736 	ld	l,-7 (ix)
   7556 DD 66 FA      [19] 2737 	ld	h,-6 (ix)
   7559 7E            [ 7] 2738 	ld	a,(hl)
   755A C6 0B         [ 7] 2739 	add	a, #0x0B
   755C 57            [ 4] 2740 	ld	d,a
   755D DD 6E F7      [19] 2741 	ld	l,-9 (ix)
   7560 DD 66 F8      [19] 2742 	ld	h,-8 (ix)
   7563 7E            [ 7] 2743 	ld	a,(hl)
   7564 C6 05         [ 7] 2744 	add	a, #0x05
   7566 47            [ 4] 2745 	ld	b,a
   7567 D5            [11] 2746 	push	de
   7568 33            [ 6] 2747 	inc	sp
   7569 C5            [11] 2748 	push	bc
   756A 33            [ 6] 2749 	inc	sp
   756B 2A F8 65      [16] 2750 	ld	hl,(_mapa)
   756E E5            [11] 2751 	push	hl
   756F CD C4 4A      [17] 2752 	call	_getTilePtr
   7572 F1            [10] 2753 	pop	af
   7573 F1            [10] 2754 	pop	af
   7574 4E            [ 7] 2755 	ld	c,(hl)
   7575 3E 02         [ 7] 2756 	ld	a,#0x02
   7577 91            [ 4] 2757 	sub	a, c
   7578 38 3A         [12] 2758 	jr	C,00137$
                           2759 ;src/main.c:523: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   757A DD 6E F9      [19] 2760 	ld	l,-7 (ix)
   757D DD 66 FA      [19] 2761 	ld	h,-6 (ix)
   7580 7E            [ 7] 2762 	ld	a,(hl)
   7581 C6 16         [ 7] 2763 	add	a, #0x16
   7583 57            [ 4] 2764 	ld	d,a
   7584 DD 6E F7      [19] 2765 	ld	l,-9 (ix)
   7587 DD 66 F8      [19] 2766 	ld	h,-8 (ix)
   758A 7E            [ 7] 2767 	ld	a,(hl)
   758B C6 05         [ 7] 2768 	add	a, #0x05
   758D 47            [ 4] 2769 	ld	b,a
   758E D5            [11] 2770 	push	de
   758F 33            [ 6] 2771 	inc	sp
   7590 C5            [11] 2772 	push	bc
   7591 33            [ 6] 2773 	inc	sp
   7592 2A F8 65      [16] 2774 	ld	hl,(_mapa)
   7595 E5            [11] 2775 	push	hl
   7596 CD C4 4A      [17] 2776 	call	_getTilePtr
   7599 F1            [10] 2777 	pop	af
   759A F1            [10] 2778 	pop	af
   759B 4E            [ 7] 2779 	ld	c,(hl)
   759C 3E 02         [ 7] 2780 	ld	a,#0x02
   759E 91            [ 4] 2781 	sub	a, c
   759F 38 13         [12] 2782 	jr	C,00137$
                           2783 ;src/main.c:524: moverEnemigoDerecha(enemy);
   75A1 DD 6E F7      [19] 2784 	ld	l,-9 (ix)
   75A4 DD 66 F8      [19] 2785 	ld	h,-8 (ix)
   75A7 E5            [11] 2786 	push	hl
   75A8 CD 8F 6E      [17] 2787 	call	_moverEnemigoDerecha
   75AB F1            [10] 2788 	pop	af
                           2789 ;src/main.c:525: movX = 1;
   75AC DD 36 F6 01   [19] 2790 	ld	-10 (ix),#0x01
                           2791 ;src/main.c:526: mov = 1;
   75B0 DD 36 F4 01   [19] 2792 	ld	-12 (ix),#0x01
   75B4                    2793 00137$:
                           2794 ;src/main.c:529: if (dy < enemy->y) {
   75B4 DD 6E F9      [19] 2795 	ld	l,-7 (ix)
   75B7 DD 66 FA      [19] 2796 	ld	h,-6 (ix)
   75BA 7E            [ 7] 2797 	ld	a,(hl)
   75BB DD 77 FD      [19] 2798 	ld	-3 (ix),a
                           2799 ;src/main.c:458: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   75BE DD 6E F7      [19] 2800 	ld	l,-9 (ix)
   75C1 DD 66 F8      [19] 2801 	ld	h,-8 (ix)
   75C4 7E            [ 7] 2802 	ld	a,(hl)
   75C5 DD 77 FC      [19] 2803 	ld	-4 (ix),a
                           2804 ;src/main.c:529: if (dy < enemy->y) {
   75C8 DD 7E 07      [19] 2805 	ld	a,7 (ix)
   75CB DD 96 FD      [19] 2806 	sub	a, -3 (ix)
   75CE D2 64 76      [10] 2807 	jp	NC,00147$
                           2808 ;src/main.c:530: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   75D1 DD 7E FD      [19] 2809 	ld	a,-3 (ix)
   75D4 C6 FE         [ 7] 2810 	add	a,#0xFE
   75D6 DD 77 FB      [19] 2811 	ld	-5 (ix), a
   75D9 F5            [11] 2812 	push	af
   75DA 33            [ 6] 2813 	inc	sp
   75DB DD 7E FC      [19] 2814 	ld	a,-4 (ix)
   75DE F5            [11] 2815 	push	af
   75DF 33            [ 6] 2816 	inc	sp
   75E0 2A F8 65      [16] 2817 	ld	hl,(_mapa)
   75E3 E5            [11] 2818 	push	hl
   75E4 CD C4 4A      [17] 2819 	call	_getTilePtr
   75E7 F1            [10] 2820 	pop	af
   75E8 F1            [10] 2821 	pop	af
   75E9 DD 74 FF      [19] 2822 	ld	-1 (ix),h
   75EC DD 75 FE      [19] 2823 	ld	-2 (ix), l
   75EF DD 66 FF      [19] 2824 	ld	h,-1 (ix)
   75F2 4E            [ 7] 2825 	ld	c,(hl)
   75F3 3E 02         [ 7] 2826 	ld	a,#0x02
   75F5 91            [ 4] 2827 	sub	a, c
   75F6 DA DF 76      [10] 2828 	jp	C,00148$
                           2829 ;src/main.c:531: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   75F9 DD 6E F9      [19] 2830 	ld	l,-7 (ix)
   75FC DD 66 FA      [19] 2831 	ld	h,-6 (ix)
   75FF 7E            [ 7] 2832 	ld	a,(hl)
   7600 DD 77 FE      [19] 2833 	ld	-2 (ix), a
   7603 C6 FE         [ 7] 2834 	add	a,#0xFE
   7605 DD 77 FE      [19] 2835 	ld	-2 (ix),a
   7608 DD 6E F7      [19] 2836 	ld	l,-9 (ix)
   760B DD 66 F8      [19] 2837 	ld	h,-8 (ix)
   760E 46            [ 7] 2838 	ld	b,(hl)
   760F 04            [ 4] 2839 	inc	b
   7610 04            [ 4] 2840 	inc	b
   7611 DD 7E FE      [19] 2841 	ld	a,-2 (ix)
   7614 F5            [11] 2842 	push	af
   7615 33            [ 6] 2843 	inc	sp
   7616 C5            [11] 2844 	push	bc
   7617 33            [ 6] 2845 	inc	sp
   7618 2A F8 65      [16] 2846 	ld	hl,(_mapa)
   761B E5            [11] 2847 	push	hl
   761C CD C4 4A      [17] 2848 	call	_getTilePtr
   761F F1            [10] 2849 	pop	af
   7620 F1            [10] 2850 	pop	af
   7621 4E            [ 7] 2851 	ld	c,(hl)
   7622 3E 02         [ 7] 2852 	ld	a,#0x02
   7624 91            [ 4] 2853 	sub	a, c
   7625 DA DF 76      [10] 2854 	jp	C,00148$
                           2855 ;src/main.c:532: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   7628 DD 6E F9      [19] 2856 	ld	l,-7 (ix)
   762B DD 66 FA      [19] 2857 	ld	h,-6 (ix)
   762E 46            [ 7] 2858 	ld	b,(hl)
   762F 05            [ 4] 2859 	dec	b
   7630 05            [ 4] 2860 	dec	b
   7631 DD 6E F7      [19] 2861 	ld	l,-9 (ix)
   7634 DD 66 F8      [19] 2862 	ld	h,-8 (ix)
   7637 7E            [ 7] 2863 	ld	a,(hl)
   7638 C6 04         [ 7] 2864 	add	a, #0x04
   763A C5            [11] 2865 	push	bc
   763B 33            [ 6] 2866 	inc	sp
   763C F5            [11] 2867 	push	af
   763D 33            [ 6] 2868 	inc	sp
   763E 2A F8 65      [16] 2869 	ld	hl,(_mapa)
   7641 E5            [11] 2870 	push	hl
   7642 CD C4 4A      [17] 2871 	call	_getTilePtr
   7645 F1            [10] 2872 	pop	af
   7646 F1            [10] 2873 	pop	af
   7647 4E            [ 7] 2874 	ld	c,(hl)
   7648 3E 02         [ 7] 2875 	ld	a,#0x02
   764A 91            [ 4] 2876 	sub	a, c
   764B DA DF 76      [10] 2877 	jp	C,00148$
                           2878 ;src/main.c:533: moverEnemigoArriba(enemy);
   764E DD 6E F7      [19] 2879 	ld	l,-9 (ix)
   7651 DD 66 F8      [19] 2880 	ld	h,-8 (ix)
   7654 E5            [11] 2881 	push	hl
   7655 CD 51 6E      [17] 2882 	call	_moverEnemigoArriba
   7658 F1            [10] 2883 	pop	af
                           2884 ;src/main.c:534: movY = 1;
   7659 DD 36 F5 01   [19] 2885 	ld	-11 (ix),#0x01
                           2886 ;src/main.c:535: mov = 1;
   765D DD 36 F4 01   [19] 2887 	ld	-12 (ix),#0x01
   7661 C3 DF 76      [10] 2888 	jp	00148$
   7664                    2889 00147$:
                           2890 ;src/main.c:538: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7664 DD 7E FD      [19] 2891 	ld	a,-3 (ix)
   7667 C6 18         [ 7] 2892 	add	a, #0x18
   7669 47            [ 4] 2893 	ld	b,a
   766A C5            [11] 2894 	push	bc
   766B 33            [ 6] 2895 	inc	sp
   766C DD 7E FC      [19] 2896 	ld	a,-4 (ix)
   766F F5            [11] 2897 	push	af
   7670 33            [ 6] 2898 	inc	sp
   7671 2A F8 65      [16] 2899 	ld	hl,(_mapa)
   7674 E5            [11] 2900 	push	hl
   7675 CD C4 4A      [17] 2901 	call	_getTilePtr
   7678 F1            [10] 2902 	pop	af
   7679 F1            [10] 2903 	pop	af
   767A 4E            [ 7] 2904 	ld	c,(hl)
   767B 3E 02         [ 7] 2905 	ld	a,#0x02
   767D 91            [ 4] 2906 	sub	a, c
   767E 38 5F         [12] 2907 	jr	C,00148$
                           2908 ;src/main.c:539: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7680 DD 6E F9      [19] 2909 	ld	l,-7 (ix)
   7683 DD 66 FA      [19] 2910 	ld	h,-6 (ix)
   7686 7E            [ 7] 2911 	ld	a,(hl)
   7687 C6 18         [ 7] 2912 	add	a, #0x18
   7689 57            [ 4] 2913 	ld	d,a
   768A DD 6E F7      [19] 2914 	ld	l,-9 (ix)
   768D DD 66 F8      [19] 2915 	ld	h,-8 (ix)
   7690 46            [ 7] 2916 	ld	b,(hl)
   7691 04            [ 4] 2917 	inc	b
   7692 04            [ 4] 2918 	inc	b
   7693 D5            [11] 2919 	push	de
   7694 33            [ 6] 2920 	inc	sp
   7695 C5            [11] 2921 	push	bc
   7696 33            [ 6] 2922 	inc	sp
   7697 2A F8 65      [16] 2923 	ld	hl,(_mapa)
   769A E5            [11] 2924 	push	hl
   769B CD C4 4A      [17] 2925 	call	_getTilePtr
   769E F1            [10] 2926 	pop	af
   769F F1            [10] 2927 	pop	af
   76A0 4E            [ 7] 2928 	ld	c,(hl)
   76A1 3E 02         [ 7] 2929 	ld	a,#0x02
   76A3 91            [ 4] 2930 	sub	a, c
   76A4 38 39         [12] 2931 	jr	C,00148$
                           2932 ;src/main.c:540: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   76A6 DD 6E F9      [19] 2933 	ld	l,-7 (ix)
   76A9 DD 66 FA      [19] 2934 	ld	h,-6 (ix)
   76AC 7E            [ 7] 2935 	ld	a,(hl)
   76AD C6 18         [ 7] 2936 	add	a, #0x18
   76AF 47            [ 4] 2937 	ld	b,a
   76B0 DD 6E F7      [19] 2938 	ld	l,-9 (ix)
   76B3 DD 66 F8      [19] 2939 	ld	h,-8 (ix)
   76B6 7E            [ 7] 2940 	ld	a,(hl)
   76B7 C6 04         [ 7] 2941 	add	a, #0x04
   76B9 C5            [11] 2942 	push	bc
   76BA 33            [ 6] 2943 	inc	sp
   76BB F5            [11] 2944 	push	af
   76BC 33            [ 6] 2945 	inc	sp
   76BD 2A F8 65      [16] 2946 	ld	hl,(_mapa)
   76C0 E5            [11] 2947 	push	hl
   76C1 CD C4 4A      [17] 2948 	call	_getTilePtr
   76C4 F1            [10] 2949 	pop	af
   76C5 F1            [10] 2950 	pop	af
   76C6 4E            [ 7] 2951 	ld	c,(hl)
   76C7 3E 02         [ 7] 2952 	ld	a,#0x02
   76C9 91            [ 4] 2953 	sub	a, c
   76CA 38 13         [12] 2954 	jr	C,00148$
                           2955 ;src/main.c:541: moverEnemigoAbajo(enemy);
   76CC DD 6E F7      [19] 2956 	ld	l,-9 (ix)
   76CF DD 66 F8      [19] 2957 	ld	h,-8 (ix)
   76D2 E5            [11] 2958 	push	hl
   76D3 CD 70 6E      [17] 2959 	call	_moverEnemigoAbajo
   76D6 F1            [10] 2960 	pop	af
                           2961 ;src/main.c:542: movY = 1;
   76D7 DD 36 F5 01   [19] 2962 	ld	-11 (ix),#0x01
                           2963 ;src/main.c:543: mov = 1;
   76DB DD 36 F4 01   [19] 2964 	ld	-12 (ix),#0x01
   76DF                    2965 00148$:
                           2966 ;src/main.c:546: if (!mov) {
   76DF DD 7E F4      [19] 2967 	ld	a,-12 (ix)
   76E2 B7            [ 4] 2968 	or	a, a
   76E3 C2 01 79      [10] 2969 	jp	NZ,00189$
                           2970 ;src/main.c:547: if (!movX) {
   76E6 DD 7E F6      [19] 2971 	ld	a,-10 (ix)
   76E9 B7            [ 4] 2972 	or	a, a
   76EA C2 F1 77      [10] 2973 	jp	NZ,00163$
                           2974 ;src/main.c:548: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   76ED DD 6E F9      [19] 2975 	ld	l,-7 (ix)
   76F0 DD 66 FA      [19] 2976 	ld	h,-6 (ix)
   76F3 5E            [ 7] 2977 	ld	e,(hl)
                           2978 ;src/main.c:458: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   76F4 DD 6E F7      [19] 2979 	ld	l,-9 (ix)
   76F7 DD 66 F8      [19] 2980 	ld	h,-8 (ix)
   76FA 4E            [ 7] 2981 	ld	c,(hl)
                           2982 ;src/main.c:548: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   76FB 3E 70         [ 7] 2983 	ld	a,#0x70
   76FD 93            [ 4] 2984 	sub	a, e
   76FE 30 7C         [12] 2985 	jr	NC,00160$
                           2986 ;src/main.c:549: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7700 7B            [ 4] 2987 	ld	a,e
   7701 C6 18         [ 7] 2988 	add	a, #0x18
   7703 47            [ 4] 2989 	ld	b,a
   7704 C5            [11] 2990 	push	bc
   7705 2A F8 65      [16] 2991 	ld	hl,(_mapa)
   7708 E5            [11] 2992 	push	hl
   7709 CD C4 4A      [17] 2993 	call	_getTilePtr
   770C F1            [10] 2994 	pop	af
   770D F1            [10] 2995 	pop	af
   770E 4E            [ 7] 2996 	ld	c,(hl)
   770F 3E 02         [ 7] 2997 	ld	a,#0x02
   7711 91            [ 4] 2998 	sub	a, c
   7712 38 5B         [12] 2999 	jr	C,00150$
                           3000 ;src/main.c:550: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7714 DD 6E F9      [19] 3001 	ld	l,-7 (ix)
   7717 DD 66 FA      [19] 3002 	ld	h,-6 (ix)
   771A 7E            [ 7] 3003 	ld	a,(hl)
   771B C6 18         [ 7] 3004 	add	a, #0x18
   771D 57            [ 4] 3005 	ld	d,a
   771E DD 6E F7      [19] 3006 	ld	l,-9 (ix)
   7721 DD 66 F8      [19] 3007 	ld	h,-8 (ix)
   7724 4E            [ 7] 3008 	ld	c,(hl)
   7725 41            [ 4] 3009 	ld	b,c
   7726 04            [ 4] 3010 	inc	b
   7727 04            [ 4] 3011 	inc	b
   7728 D5            [11] 3012 	push	de
   7729 33            [ 6] 3013 	inc	sp
   772A C5            [11] 3014 	push	bc
   772B 33            [ 6] 3015 	inc	sp
   772C 2A F8 65      [16] 3016 	ld	hl,(_mapa)
   772F E5            [11] 3017 	push	hl
   7730 CD C4 4A      [17] 3018 	call	_getTilePtr
   7733 F1            [10] 3019 	pop	af
   7734 F1            [10] 3020 	pop	af
   7735 4E            [ 7] 3021 	ld	c,(hl)
   7736 3E 02         [ 7] 3022 	ld	a,#0x02
   7738 91            [ 4] 3023 	sub	a, c
   7739 38 34         [12] 3024 	jr	C,00150$
                           3025 ;src/main.c:551: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   773B DD 6E F9      [19] 3026 	ld	l,-7 (ix)
   773E DD 66 FA      [19] 3027 	ld	h,-6 (ix)
   7741 7E            [ 7] 3028 	ld	a,(hl)
   7742 C6 18         [ 7] 3029 	add	a, #0x18
   7744 47            [ 4] 3030 	ld	b,a
   7745 DD 6E F7      [19] 3031 	ld	l,-9 (ix)
   7748 DD 66 F8      [19] 3032 	ld	h,-8 (ix)
   774B 7E            [ 7] 3033 	ld	a,(hl)
   774C C6 04         [ 7] 3034 	add	a, #0x04
   774E C5            [11] 3035 	push	bc
   774F 33            [ 6] 3036 	inc	sp
   7750 F5            [11] 3037 	push	af
   7751 33            [ 6] 3038 	inc	sp
   7752 2A F8 65      [16] 3039 	ld	hl,(_mapa)
   7755 E5            [11] 3040 	push	hl
   7756 CD C4 4A      [17] 3041 	call	_getTilePtr
   7759 F1            [10] 3042 	pop	af
   775A F1            [10] 3043 	pop	af
   775B 4E            [ 7] 3044 	ld	c,(hl)
   775C 3E 02         [ 7] 3045 	ld	a,#0x02
   775E 91            [ 4] 3046 	sub	a, c
   775F 38 0E         [12] 3047 	jr	C,00150$
                           3048 ;src/main.c:552: moverEnemigoAbajo(enemy);
   7761 DD 6E F7      [19] 3049 	ld	l,-9 (ix)
   7764 DD 66 F8      [19] 3050 	ld	h,-8 (ix)
   7767 E5            [11] 3051 	push	hl
   7768 CD 70 6E      [17] 3052 	call	_moverEnemigoAbajo
   776B F1            [10] 3053 	pop	af
   776C C3 F1 77      [10] 3054 	jp	00163$
   776F                    3055 00150$:
                           3056 ;src/main.c:554: moverEnemigoArriba(enemy);
   776F DD 6E F7      [19] 3057 	ld	l,-9 (ix)
   7772 DD 66 F8      [19] 3058 	ld	h,-8 (ix)
   7775 E5            [11] 3059 	push	hl
   7776 CD 51 6E      [17] 3060 	call	_moverEnemigoArriba
   7779 F1            [10] 3061 	pop	af
   777A 18 75         [12] 3062 	jr	00163$
   777C                    3063 00160$:
                           3064 ;src/main.c:556: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   777C 43            [ 4] 3065 	ld	b,e
   777D 05            [ 4] 3066 	dec	b
   777E 05            [ 4] 3067 	dec	b
   777F C5            [11] 3068 	push	bc
   7780 2A F8 65      [16] 3069 	ld	hl,(_mapa)
   7783 E5            [11] 3070 	push	hl
   7784 CD C4 4A      [17] 3071 	call	_getTilePtr
   7787 F1            [10] 3072 	pop	af
   7788 F1            [10] 3073 	pop	af
   7789 4E            [ 7] 3074 	ld	c,(hl)
   778A 3E 02         [ 7] 3075 	ld	a,#0x02
   778C 91            [ 4] 3076 	sub	a, c
   778D 38 57         [12] 3077 	jr	C,00155$
                           3078 ;src/main.c:557: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   778F DD 6E F9      [19] 3079 	ld	l,-7 (ix)
   7792 DD 66 FA      [19] 3080 	ld	h,-6 (ix)
   7795 56            [ 7] 3081 	ld	d,(hl)
   7796 15            [ 4] 3082 	dec	d
   7797 15            [ 4] 3083 	dec	d
   7798 DD 6E F7      [19] 3084 	ld	l,-9 (ix)
   779B DD 66 F8      [19] 3085 	ld	h,-8 (ix)
   779E 46            [ 7] 3086 	ld	b,(hl)
   779F 04            [ 4] 3087 	inc	b
   77A0 04            [ 4] 3088 	inc	b
   77A1 D5            [11] 3089 	push	de
   77A2 33            [ 6] 3090 	inc	sp
   77A3 C5            [11] 3091 	push	bc
   77A4 33            [ 6] 3092 	inc	sp
   77A5 2A F8 65      [16] 3093 	ld	hl,(_mapa)
   77A8 E5            [11] 3094 	push	hl
   77A9 CD C4 4A      [17] 3095 	call	_getTilePtr
   77AC F1            [10] 3096 	pop	af
   77AD F1            [10] 3097 	pop	af
   77AE 4E            [ 7] 3098 	ld	c,(hl)
   77AF 3E 02         [ 7] 3099 	ld	a,#0x02
   77B1 91            [ 4] 3100 	sub	a, c
   77B2 38 32         [12] 3101 	jr	C,00155$
                           3102 ;src/main.c:558: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   77B4 DD 6E F9      [19] 3103 	ld	l,-7 (ix)
   77B7 DD 66 FA      [19] 3104 	ld	h,-6 (ix)
   77BA 46            [ 7] 3105 	ld	b,(hl)
   77BB 05            [ 4] 3106 	dec	b
   77BC 05            [ 4] 3107 	dec	b
   77BD DD 6E F7      [19] 3108 	ld	l,-9 (ix)
   77C0 DD 66 F8      [19] 3109 	ld	h,-8 (ix)
   77C3 7E            [ 7] 3110 	ld	a,(hl)
   77C4 C6 04         [ 7] 3111 	add	a, #0x04
   77C6 C5            [11] 3112 	push	bc
   77C7 33            [ 6] 3113 	inc	sp
   77C8 F5            [11] 3114 	push	af
   77C9 33            [ 6] 3115 	inc	sp
   77CA 2A F8 65      [16] 3116 	ld	hl,(_mapa)
   77CD E5            [11] 3117 	push	hl
   77CE CD C4 4A      [17] 3118 	call	_getTilePtr
   77D1 F1            [10] 3119 	pop	af
   77D2 F1            [10] 3120 	pop	af
   77D3 4E            [ 7] 3121 	ld	c,(hl)
   77D4 3E 02         [ 7] 3122 	ld	a,#0x02
   77D6 91            [ 4] 3123 	sub	a, c
   77D7 38 0D         [12] 3124 	jr	C,00155$
                           3125 ;src/main.c:559: moverEnemigoArriba(enemy);
   77D9 DD 6E F7      [19] 3126 	ld	l,-9 (ix)
   77DC DD 66 F8      [19] 3127 	ld	h,-8 (ix)
   77DF E5            [11] 3128 	push	hl
   77E0 CD 51 6E      [17] 3129 	call	_moverEnemigoArriba
   77E3 F1            [10] 3130 	pop	af
   77E4 18 0B         [12] 3131 	jr	00163$
   77E6                    3132 00155$:
                           3133 ;src/main.c:561: moverEnemigoAbajo(enemy);
   77E6 DD 6E F7      [19] 3134 	ld	l,-9 (ix)
   77E9 DD 66 F8      [19] 3135 	ld	h,-8 (ix)
   77EC E5            [11] 3136 	push	hl
   77ED CD 70 6E      [17] 3137 	call	_moverEnemigoAbajo
   77F0 F1            [10] 3138 	pop	af
   77F1                    3139 00163$:
                           3140 ;src/main.c:565: if (!movY) {
   77F1 DD 7E F5      [19] 3141 	ld	a,-11 (ix)
   77F4 B7            [ 4] 3142 	or	a, a
   77F5 C2 01 79      [10] 3143 	jp	NZ,00189$
                           3144 ;src/main.c:566: if (enemy->x < ANCHO_PANTALLA/2) {
   77F8 DD 6E F7      [19] 3145 	ld	l,-9 (ix)
   77FB DD 66 F8      [19] 3146 	ld	h,-8 (ix)
   77FE 4E            [ 7] 3147 	ld	c,(hl)
                           3148 ;src/main.c:459: u8 dify = abs(enemy->y - prota.y);
   77FF DD 6E F9      [19] 3149 	ld	l,-7 (ix)
   7802 DD 66 FA      [19] 3150 	ld	h,-6 (ix)
   7805 5E            [ 7] 3151 	ld	e,(hl)
                           3152 ;src/main.c:566: if (enemy->x < ANCHO_PANTALLA/2) {
   7806 79            [ 4] 3153 	ld	a,c
   7807 D6 28         [ 7] 3154 	sub	a, #0x28
   7809 D2 89 78      [10] 3155 	jp	NC,00175$
                           3156 ;src/main.c:567: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   780C 41            [ 4] 3157 	ld	b,c
   780D 05            [ 4] 3158 	dec	b
   780E 7B            [ 4] 3159 	ld	a,e
   780F F5            [11] 3160 	push	af
   7810 33            [ 6] 3161 	inc	sp
   7811 C5            [11] 3162 	push	bc
   7812 33            [ 6] 3163 	inc	sp
   7813 2A F8 65      [16] 3164 	ld	hl,(_mapa)
   7816 E5            [11] 3165 	push	hl
   7817 CD C4 4A      [17] 3166 	call	_getTilePtr
   781A F1            [10] 3167 	pop	af
   781B F1            [10] 3168 	pop	af
   781C 4E            [ 7] 3169 	ld	c,(hl)
   781D 3E 02         [ 7] 3170 	ld	a,#0x02
   781F 91            [ 4] 3171 	sub	a, c
   7820 38 5A         [12] 3172 	jr	C,00165$
                           3173 ;src/main.c:568: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   7822 DD 6E F9      [19] 3174 	ld	l,-7 (ix)
   7825 DD 66 FA      [19] 3175 	ld	h,-6 (ix)
   7828 7E            [ 7] 3176 	ld	a,(hl)
   7829 C6 0B         [ 7] 3177 	add	a, #0x0B
   782B 4F            [ 4] 3178 	ld	c,a
   782C DD 6E F7      [19] 3179 	ld	l,-9 (ix)
   782F DD 66 F8      [19] 3180 	ld	h,-8 (ix)
   7832 46            [ 7] 3181 	ld	b,(hl)
   7833 05            [ 4] 3182 	dec	b
   7834 79            [ 4] 3183 	ld	a,c
   7835 F5            [11] 3184 	push	af
   7836 33            [ 6] 3185 	inc	sp
   7837 C5            [11] 3186 	push	bc
   7838 33            [ 6] 3187 	inc	sp
   7839 2A F8 65      [16] 3188 	ld	hl,(_mapa)
   783C E5            [11] 3189 	push	hl
   783D CD C4 4A      [17] 3190 	call	_getTilePtr
   7840 F1            [10] 3191 	pop	af
   7841 F1            [10] 3192 	pop	af
   7842 4E            [ 7] 3193 	ld	c,(hl)
   7843 3E 02         [ 7] 3194 	ld	a,#0x02
   7845 91            [ 4] 3195 	sub	a, c
   7846 38 34         [12] 3196 	jr	C,00165$
                           3197 ;src/main.c:569: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   7848 DD 6E F9      [19] 3198 	ld	l,-7 (ix)
   784B DD 66 FA      [19] 3199 	ld	h,-6 (ix)
   784E 7E            [ 7] 3200 	ld	a,(hl)
   784F C6 16         [ 7] 3201 	add	a, #0x16
   7851 4F            [ 4] 3202 	ld	c,a
   7852 DD 6E F7      [19] 3203 	ld	l,-9 (ix)
   7855 DD 66 F8      [19] 3204 	ld	h,-8 (ix)
   7858 46            [ 7] 3205 	ld	b,(hl)
   7859 05            [ 4] 3206 	dec	b
   785A 79            [ 4] 3207 	ld	a,c
   785B F5            [11] 3208 	push	af
   785C 33            [ 6] 3209 	inc	sp
   785D C5            [11] 3210 	push	bc
   785E 33            [ 6] 3211 	inc	sp
   785F 2A F8 65      [16] 3212 	ld	hl,(_mapa)
   7862 E5            [11] 3213 	push	hl
   7863 CD C4 4A      [17] 3214 	call	_getTilePtr
   7866 F1            [10] 3215 	pop	af
   7867 F1            [10] 3216 	pop	af
   7868 4E            [ 7] 3217 	ld	c,(hl)
   7869 3E 02         [ 7] 3218 	ld	a,#0x02
   786B 91            [ 4] 3219 	sub	a, c
   786C 38 0E         [12] 3220 	jr	C,00165$
                           3221 ;src/main.c:570: moverEnemigoIzquierda(enemy);
   786E DD 6E F7      [19] 3222 	ld	l,-9 (ix)
   7871 DD 66 F8      [19] 3223 	ld	h,-8 (ix)
   7874 E5            [11] 3224 	push	hl
   7875 CD 9F 6E      [17] 3225 	call	_moverEnemigoIzquierda
   7878 F1            [10] 3226 	pop	af
   7879 C3 01 79      [10] 3227 	jp	00189$
   787C                    3228 00165$:
                           3229 ;src/main.c:572: moverEnemigoDerecha(enemy);
   787C DD 6E F7      [19] 3230 	ld	l,-9 (ix)
   787F DD 66 F8      [19] 3231 	ld	h,-8 (ix)
   7882 E5            [11] 3232 	push	hl
   7883 CD 8F 6E      [17] 3233 	call	_moverEnemigoDerecha
   7886 F1            [10] 3234 	pop	af
   7887 18 78         [12] 3235 	jr	00189$
   7889                    3236 00175$:
                           3237 ;src/main.c:575: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   7889 79            [ 4] 3238 	ld	a,c
   788A C6 05         [ 7] 3239 	add	a, #0x05
   788C 47            [ 4] 3240 	ld	b,a
   788D 7B            [ 4] 3241 	ld	a,e
   788E F5            [11] 3242 	push	af
   788F 33            [ 6] 3243 	inc	sp
   7890 C5            [11] 3244 	push	bc
   7891 33            [ 6] 3245 	inc	sp
   7892 2A F8 65      [16] 3246 	ld	hl,(_mapa)
   7895 E5            [11] 3247 	push	hl
   7896 CD C4 4A      [17] 3248 	call	_getTilePtr
   7899 F1            [10] 3249 	pop	af
   789A F1            [10] 3250 	pop	af
   789B 4E            [ 7] 3251 	ld	c,(hl)
   789C 3E 02         [ 7] 3252 	ld	a,#0x02
   789E 91            [ 4] 3253 	sub	a, c
   789F 38 55         [12] 3254 	jr	C,00170$
                           3255 ;src/main.c:576: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   78A1 DD 6E F9      [19] 3256 	ld	l,-7 (ix)
   78A4 DD 66 FA      [19] 3257 	ld	h,-6 (ix)
   78A7 7E            [ 7] 3258 	ld	a,(hl)
   78A8 C6 0B         [ 7] 3259 	add	a, #0x0B
   78AA 47            [ 4] 3260 	ld	b,a
   78AB DD 6E F7      [19] 3261 	ld	l,-9 (ix)
   78AE DD 66 F8      [19] 3262 	ld	h,-8 (ix)
   78B1 7E            [ 7] 3263 	ld	a,(hl)
   78B2 C6 05         [ 7] 3264 	add	a, #0x05
   78B4 4F            [ 4] 3265 	ld	c,a
   78B5 C5            [11] 3266 	push	bc
   78B6 2A F8 65      [16] 3267 	ld	hl,(_mapa)
   78B9 E5            [11] 3268 	push	hl
   78BA CD C4 4A      [17] 3269 	call	_getTilePtr
   78BD F1            [10] 3270 	pop	af
   78BE F1            [10] 3271 	pop	af
   78BF 4E            [ 7] 3272 	ld	c,(hl)
   78C0 3E 02         [ 7] 3273 	ld	a,#0x02
   78C2 91            [ 4] 3274 	sub	a, c
   78C3 38 31         [12] 3275 	jr	C,00170$
                           3276 ;src/main.c:577: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   78C5 DD 6E F9      [19] 3277 	ld	l,-7 (ix)
   78C8 DD 66 FA      [19] 3278 	ld	h,-6 (ix)
   78CB 7E            [ 7] 3279 	ld	a,(hl)
   78CC C6 16         [ 7] 3280 	add	a, #0x16
   78CE 47            [ 4] 3281 	ld	b,a
   78CF DD 6E F7      [19] 3282 	ld	l,-9 (ix)
   78D2 DD 66 F8      [19] 3283 	ld	h,-8 (ix)
   78D5 7E            [ 7] 3284 	ld	a,(hl)
   78D6 C6 05         [ 7] 3285 	add	a, #0x05
   78D8 4F            [ 4] 3286 	ld	c,a
   78D9 C5            [11] 3287 	push	bc
   78DA 2A F8 65      [16] 3288 	ld	hl,(_mapa)
   78DD E5            [11] 3289 	push	hl
   78DE CD C4 4A      [17] 3290 	call	_getTilePtr
   78E1 F1            [10] 3291 	pop	af
   78E2 F1            [10] 3292 	pop	af
   78E3 4E            [ 7] 3293 	ld	c,(hl)
   78E4 3E 02         [ 7] 3294 	ld	a,#0x02
   78E6 91            [ 4] 3295 	sub	a, c
   78E7 38 0D         [12] 3296 	jr	C,00170$
                           3297 ;src/main.c:578: moverEnemigoDerecha(enemy);
   78E9 DD 6E F7      [19] 3298 	ld	l,-9 (ix)
   78EC DD 66 F8      [19] 3299 	ld	h,-8 (ix)
   78EF E5            [11] 3300 	push	hl
   78F0 CD 8F 6E      [17] 3301 	call	_moverEnemigoDerecha
   78F3 F1            [10] 3302 	pop	af
   78F4 18 0B         [12] 3303 	jr	00189$
   78F6                    3304 00170$:
                           3305 ;src/main.c:581: moverEnemigoIzquierda(enemy);
   78F6 DD 6E F7      [19] 3306 	ld	l,-9 (ix)
   78F9 DD 66 F8      [19] 3307 	ld	h,-8 (ix)
   78FC E5            [11] 3308 	push	hl
   78FD CD 9F 6E      [17] 3309 	call	_moverEnemigoIzquierda
   7900 F1            [10] 3310 	pop	af
   7901                    3311 00189$:
   7901 DD F9         [10] 3312 	ld	sp, ix
   7903 DD E1         [14] 3313 	pop	ix
   7905 C9            [10] 3314 	ret
                           3315 ;src/main.c:590: void updateEnemies() { // maquina de estados
                           3316 ;	---------------------------------
                           3317 ; Function updateEnemies
                           3318 ; ---------------------------------
   7906                    3319 _updateEnemies::
   7906 DD E5         [15] 3320 	push	ix
   7908 DD 21 00 00   [14] 3321 	ld	ix,#0
   790C DD 39         [15] 3322 	add	ix,sp
   790E 21 F3 FF      [10] 3323 	ld	hl,#-13
   7911 39            [11] 3324 	add	hl,sp
   7912 F9            [ 6] 3325 	ld	sp,hl
                           3326 ;src/main.c:593: u8 i = 2 + 1;
   7913 DD 36 F3 03   [19] 3327 	ld	-13 (ix),#0x03
                           3328 ;src/main.c:596: actual = enemy;
                           3329 ;src/main.c:597: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   7917 21 18 5A      [10] 3330 	ld	hl,#0x5A18
   791A E5            [11] 3331 	push	hl
   791B 21 00 C0      [10] 3332 	ld	hl,#0xC000
   791E E5            [11] 3333 	push	hl
   791F CD AD 5F      [17] 3334 	call	_cpct_getScreenPtr
                           3335 ;src/main.c:600: while(--i) {
   7922 01 08 60      [10] 3336 	ld	bc,#_enemy
   7925                    3337 00119$:
   7925 DD 35 F3      [23] 3338 	dec	-13 (ix)
   7928 DD 5E F3      [19] 3339 	ld	e, -13 (ix)
   792B 7B            [ 4] 3340 	ld	a,e
   792C B7            [ 4] 3341 	or	a, a
   792D CA 8B 7A      [10] 3342 	jp	Z,00122$
                           3343 ;src/main.c:601: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   7930 21 15 00      [10] 3344 	ld	hl,#0x0015
   7933 09            [11] 3345 	add	hl,bc
   7934 DD 75 F4      [19] 3346 	ld	-12 (ix),l
   7937 DD 74 F5      [19] 3347 	ld	-11 (ix),h
   793A DD 6E F4      [19] 3348 	ld	l,-12 (ix)
   793D DD 66 F5      [19] 3349 	ld	h,-11 (ix)
   7940 7E            [ 7] 3350 	ld	a,(hl)
   7941 B7            [ 4] 3351 	or	a, a
   7942 28 16         [12] 3352 	jr	Z,00117$
                           3353 ;src/main.c:602: engage(actual, prota.x, prota.y);
   7944 3A 1D 65      [13] 3354 	ld	a, (#(_prota + 0x0001) + 0)
   7947 21 1C 65      [10] 3355 	ld	hl, #_prota + 0
   794A 56            [ 7] 3356 	ld	d,(hl)
   794B C5            [11] 3357 	push	bc
   794C F5            [11] 3358 	push	af
   794D 33            [ 6] 3359 	inc	sp
   794E D5            [11] 3360 	push	de
   794F 33            [ 6] 3361 	inc	sp
   7950 C5            [11] 3362 	push	bc
   7951 CD 10 72      [17] 3363 	call	_engage
   7954 F1            [10] 3364 	pop	af
   7955 F1            [10] 3365 	pop	af
   7956 C1            [10] 3366 	pop	bc
   7957 C3 82 7A      [10] 3367 	jp	00118$
   795A                    3368 00117$:
                           3369 ;src/main.c:604: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   795A C5            [11] 3370 	push	bc
   795B C5            [11] 3371 	push	bc
   795C CD DF 70      [17] 3372 	call	_lookFor
   795F F1            [10] 3373 	pop	af
   7960 C1            [10] 3374 	pop	bc
                           3375 ;src/main.c:605: if (actual->patrolling) { // esta patrullando
   7961 21 0B 00      [10] 3376 	ld	hl,#0x000B
   7964 09            [11] 3377 	add	hl,bc
   7965 DD 75 FA      [19] 3378 	ld	-6 (ix),l
   7968 DD 74 FB      [19] 3379 	ld	-5 (ix),h
   796B DD 6E FA      [19] 3380 	ld	l,-6 (ix)
   796E DD 66 FB      [19] 3381 	ld	h,-5 (ix)
   7971 6E            [ 7] 3382 	ld	l,(hl)
                           3383 ;src/main.c:607: if (actual->inRange) {
   7972 79            [ 4] 3384 	ld	a,c
   7973 C6 10         [ 7] 3385 	add	a, #0x10
   7975 5F            [ 4] 3386 	ld	e,a
   7976 78            [ 4] 3387 	ld	a,b
   7977 CE 00         [ 7] 3388 	adc	a, #0x00
   7979 57            [ 4] 3389 	ld	d,a
                           3390 ;src/main.c:616: actual->seek = 1;
   797A 79            [ 4] 3391 	ld	a,c
   797B C6 13         [ 7] 3392 	add	a, #0x13
   797D DD 77 FE      [19] 3393 	ld	-2 (ix),a
   7980 78            [ 4] 3394 	ld	a,b
   7981 CE 00         [ 7] 3395 	adc	a, #0x00
   7983 DD 77 FF      [19] 3396 	ld	-1 (ix),a
                           3397 ;src/main.c:605: if (actual->patrolling) { // esta patrullando
   7986 7D            [ 4] 3398 	ld	a,l
   7987 B7            [ 4] 3399 	or	a, a
   7988 CA 47 7A      [10] 3400 	jp	Z,00114$
                           3401 ;src/main.c:606: moverEnemigoPatrol(actual);
   798B C5            [11] 3402 	push	bc
   798C D5            [11] 3403 	push	de
   798D C5            [11] 3404 	push	bc
   798E CD B1 6E      [17] 3405 	call	_moverEnemigoPatrol
   7991 F1            [10] 3406 	pop	af
   7992 D1            [10] 3407 	pop	de
   7993 C1            [10] 3408 	pop	bc
                           3409 ;src/main.c:607: if (actual->inRange) {
   7994 1A            [ 7] 3410 	ld	a,(de)
   7995 B7            [ 4] 3411 	or	a, a
   7996 28 26         [12] 3412 	jr	Z,00104$
                           3413 ;src/main.c:608: engage(actual, prota.x, prota.y);
   7998 3A 1D 65      [13] 3414 	ld	a, (#(_prota + 0x0001) + 0)
   799B 21 1C 65      [10] 3415 	ld	hl, #_prota + 0
   799E 56            [ 7] 3416 	ld	d,(hl)
   799F C5            [11] 3417 	push	bc
   79A0 F5            [11] 3418 	push	af
   79A1 33            [ 6] 3419 	inc	sp
   79A2 D5            [11] 3420 	push	de
   79A3 33            [ 6] 3421 	inc	sp
   79A4 C5            [11] 3422 	push	bc
   79A5 CD 10 72      [17] 3423 	call	_engage
   79A8 F1            [10] 3424 	pop	af
   79A9 F1            [10] 3425 	pop	af
   79AA C1            [10] 3426 	pop	bc
                           3427 ;src/main.c:609: actual->patrolling = 0;
   79AB DD 6E FA      [19] 3428 	ld	l,-6 (ix)
   79AE DD 66 FB      [19] 3429 	ld	h,-5 (ix)
   79B1 36 00         [10] 3430 	ld	(hl),#0x00
                           3431 ;src/main.c:610: actual->engage = 1;
   79B3 DD 6E F4      [19] 3432 	ld	l,-12 (ix)
   79B6 DD 66 F5      [19] 3433 	ld	h,-11 (ix)
   79B9 36 01         [10] 3434 	ld	(hl),#0x01
   79BB C3 82 7A      [10] 3435 	jp	00118$
   79BE                    3436 00104$:
                           3437 ;src/main.c:611: } else if (actual->seen) {
   79BE 21 11 00      [10] 3438 	ld	hl,#0x0011
   79C1 09            [11] 3439 	add	hl,bc
   79C2 DD 75 F7      [19] 3440 	ld	-9 (ix),l
   79C5 DD 74 F8      [19] 3441 	ld	-8 (ix),h
   79C8 DD 6E F7      [19] 3442 	ld	l,-9 (ix)
   79CB DD 66 F8      [19] 3443 	ld	h,-8 (ix)
   79CE 7E            [ 7] 3444 	ld	a,(hl)
   79CF B7            [ 4] 3445 	or	a, a
   79D0 CA 82 7A      [10] 3446 	jp	Z,00118$
                           3447 ;src/main.c:613: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   79D3 3A 1D 65      [13] 3448 	ld	a,(#(_prota + 0x0001) + 0)
   79D6 DD 77 F9      [19] 3449 	ld	-7 (ix),a
   79D9 3A 1C 65      [13] 3450 	ld	a,(#_prota + 0)
   79DC DD 77 F6      [19] 3451 	ld	-10 (ix),a
   79DF 21 01 00      [10] 3452 	ld	hl,#0x0001
   79E2 09            [11] 3453 	add	hl,bc
   79E3 DD 75 FC      [19] 3454 	ld	-4 (ix),l
   79E6 DD 74 FD      [19] 3455 	ld	-3 (ix),h
   79E9 DD 6E FC      [19] 3456 	ld	l,-4 (ix)
   79EC DD 66 FD      [19] 3457 	ld	h,-3 (ix)
   79EF 5E            [ 7] 3458 	ld	e,(hl)
   79F0 0A            [ 7] 3459 	ld	a,(bc)
   79F1 57            [ 4] 3460 	ld	d,a
   79F2 C5            [11] 3461 	push	bc
   79F3 2A F8 65      [16] 3462 	ld	hl,(_mapa)
   79F6 E5            [11] 3463 	push	hl
   79F7 C5            [11] 3464 	push	bc
   79F8 DD 66 F9      [19] 3465 	ld	h,-7 (ix)
   79FB DD 6E F6      [19] 3466 	ld	l,-10 (ix)
   79FE E5            [11] 3467 	push	hl
   79FF 7B            [ 4] 3468 	ld	a,e
   7A00 F5            [11] 3469 	push	af
   7A01 33            [ 6] 3470 	inc	sp
   7A02 D5            [11] 3471 	push	de
   7A03 33            [ 6] 3472 	inc	sp
   7A04 CD 06 49      [17] 3473 	call	_pathFinding
   7A07 21 08 00      [10] 3474 	ld	hl,#8
   7A0A 39            [11] 3475 	add	hl,sp
   7A0B F9            [ 6] 3476 	ld	sp,hl
   7A0C C1            [10] 3477 	pop	bc
                           3478 ;src/main.c:614: actual->p_seek_x = actual->x;
   7A0D 21 16 00      [10] 3479 	ld	hl,#0x0016
   7A10 09            [11] 3480 	add	hl,bc
   7A11 EB            [ 4] 3481 	ex	de,hl
   7A12 0A            [ 7] 3482 	ld	a,(bc)
   7A13 12            [ 7] 3483 	ld	(de),a
                           3484 ;src/main.c:615: actual->p_seek_y = actual->y;
   7A14 21 17 00      [10] 3485 	ld	hl,#0x0017
   7A17 09            [11] 3486 	add	hl,bc
   7A18 EB            [ 4] 3487 	ex	de,hl
   7A19 DD 6E FC      [19] 3488 	ld	l,-4 (ix)
   7A1C DD 66 FD      [19] 3489 	ld	h,-3 (ix)
   7A1F 7E            [ 7] 3490 	ld	a,(hl)
   7A20 12            [ 7] 3491 	ld	(de),a
                           3492 ;src/main.c:616: actual->seek = 1;
   7A21 DD 6E FE      [19] 3493 	ld	l,-2 (ix)
   7A24 DD 66 FF      [19] 3494 	ld	h,-1 (ix)
   7A27 36 01         [10] 3495 	ld	(hl),#0x01
                           3496 ;src/main.c:617: actual->iter=0;
   7A29 21 0E 00      [10] 3497 	ld	hl,#0x000E
   7A2C 09            [11] 3498 	add	hl,bc
   7A2D 36 00         [10] 3499 	ld	(hl),#0x00
                           3500 ;src/main.c:618: actual->reversePatrol = NO;
   7A2F 21 0C 00      [10] 3501 	ld	hl,#0x000C
   7A32 09            [11] 3502 	add	hl,bc
   7A33 36 00         [10] 3503 	ld	(hl),#0x00
                           3504 ;src/main.c:619: actual->patrolling = 0;
   7A35 DD 6E FA      [19] 3505 	ld	l,-6 (ix)
   7A38 DD 66 FB      [19] 3506 	ld	h,-5 (ix)
   7A3B 36 00         [10] 3507 	ld	(hl),#0x00
                           3508 ;src/main.c:620: actual->seen = 0;
   7A3D DD 6E F7      [19] 3509 	ld	l,-9 (ix)
   7A40 DD 66 F8      [19] 3510 	ld	h,-8 (ix)
   7A43 36 00         [10] 3511 	ld	(hl),#0x00
   7A45 18 3B         [12] 3512 	jr	00118$
   7A47                    3513 00114$:
                           3514 ;src/main.c:622: } else if (actual->seek) {
   7A47 DD 6E FE      [19] 3515 	ld	l,-2 (ix)
   7A4A DD 66 FF      [19] 3516 	ld	h,-1 (ix)
   7A4D 7E            [ 7] 3517 	ld	a,(hl)
   7A4E B7            [ 4] 3518 	or	a, a
   7A4F 28 31         [12] 3519 	jr	Z,00118$
                           3520 ;src/main.c:624: if (!actual->found /*&& actual->seekTimer <= 5*/) {
   7A51 C5            [11] 3521 	push	bc
   7A52 FD E1         [14] 3522 	pop	iy
   7A54 FD 7E 12      [19] 3523 	ld	a,18 (iy)
   7A57 B7            [ 4] 3524 	or	a, a
   7A58 20 09         [12] 3525 	jr	NZ,00109$
                           3526 ;src/main.c:625: moverEnemigoSeek(actual); // buscar en posiciones cercanas a la actual
   7A5A C5            [11] 3527 	push	bc
   7A5B C5            [11] 3528 	push	bc
   7A5C CD ED 6F      [17] 3529 	call	_moverEnemigoSeek
   7A5F F1            [10] 3530 	pop	af
   7A60 C1            [10] 3531 	pop	bc
   7A61 18 1F         [12] 3532 	jr	00118$
   7A63                    3533 00109$:
                           3534 ;src/main.c:626: } else if (actual->inRange) {
   7A63 1A            [ 7] 3535 	ld	a,(de)
   7A64 B7            [ 4] 3536 	or	a, a
   7A65 28 1B         [12] 3537 	jr	Z,00118$
                           3538 ;src/main.c:627: engage(actual, prota.x, prota.y);
   7A67 3A 1D 65      [13] 3539 	ld	a, (#(_prota + 0x0001) + 0)
   7A6A 21 1C 65      [10] 3540 	ld	hl, #_prota + 0
   7A6D 56            [ 7] 3541 	ld	d,(hl)
   7A6E C5            [11] 3542 	push	bc
   7A6F F5            [11] 3543 	push	af
   7A70 33            [ 6] 3544 	inc	sp
   7A71 D5            [11] 3545 	push	de
   7A72 33            [ 6] 3546 	inc	sp
   7A73 C5            [11] 3547 	push	bc
   7A74 CD 10 72      [17] 3548 	call	_engage
   7A77 F1            [10] 3549 	pop	af
   7A78 F1            [10] 3550 	pop	af
   7A79 C1            [10] 3551 	pop	bc
                           3552 ;src/main.c:628: actual->engage = 1;
   7A7A DD 6E F4      [19] 3553 	ld	l,-12 (ix)
   7A7D DD 66 F5      [19] 3554 	ld	h,-11 (ix)
   7A80 36 01         [10] 3555 	ld	(hl),#0x01
   7A82                    3556 00118$:
                           3557 ;src/main.c:632: actual++;
   7A82 21 45 01      [10] 3558 	ld	hl,#0x0145
   7A85 09            [11] 3559 	add	hl,bc
   7A86 4D            [ 4] 3560 	ld	c,l
   7A87 44            [ 4] 3561 	ld	b,h
   7A88 C3 25 79      [10] 3562 	jp	00119$
   7A8B                    3563 00122$:
   7A8B DD F9         [10] 3564 	ld	sp, ix
   7A8D DD E1         [14] 3565 	pop	ix
   7A8F C9            [10] 3566 	ret
                           3567 ;src/main.c:636: void inicializarEnemy() {
                           3568 ;	---------------------------------
                           3569 ; Function inicializarEnemy
                           3570 ; ---------------------------------
   7A90                    3571 _inicializarEnemy::
   7A90 DD E5         [15] 3572 	push	ix
   7A92 DD 21 00 00   [14] 3573 	ld	ix,#0
   7A96 DD 39         [15] 3574 	add	ix,sp
   7A98 F5            [11] 3575 	push	af
   7A99 F5            [11] 3576 	push	af
                           3577 ;src/main.c:647: actual = enemy;
   7A9A 01 08 60      [10] 3578 	ld	bc,#_enemy+0
                           3579 ;src/main.c:648: while(--i){
   7A9D DD 36 FC 03   [19] 3580 	ld	-4 (ix),#0x03
   7AA1                    3581 00103$:
   7AA1 DD 35 FC      [23] 3582 	dec	-4 (ix)
   7AA4 DD 7E FC      [19] 3583 	ld	a,-4 (ix)
   7AA7 B7            [ 4] 3584 	or	a, a
   7AA8 CA 88 7B      [10] 3585 	jp	Z,00106$
                           3586 ;src/main.c:649: actual->x = actual->px = spawnX[i];
   7AAB 59            [ 4] 3587 	ld	e, c
   7AAC 50            [ 4] 3588 	ld	d, b
   7AAD 13            [ 6] 3589 	inc	de
   7AAE 13            [ 6] 3590 	inc	de
   7AAF 3E 1E         [ 7] 3591 	ld	a,#<(_spawnX)
   7AB1 DD 86 FC      [19] 3592 	add	a, -4 (ix)
   7AB4 6F            [ 4] 3593 	ld	l,a
   7AB5 3E 66         [ 7] 3594 	ld	a,#>(_spawnX)
   7AB7 CE 00         [ 7] 3595 	adc	a, #0x00
   7AB9 67            [ 4] 3596 	ld	h,a
   7ABA 7E            [ 7] 3597 	ld	a,(hl)
   7ABB DD 77 FD      [19] 3598 	ld	-3 (ix), a
   7ABE 12            [ 7] 3599 	ld	(de),a
   7ABF DD 7E FD      [19] 3600 	ld	a,-3 (ix)
   7AC2 02            [ 7] 3601 	ld	(bc),a
                           3602 ;src/main.c:650: actual->y = actual->py = spawnY[i];
   7AC3 C5            [11] 3603 	push	bc
   7AC4 FD E1         [14] 3604 	pop	iy
   7AC6 FD 23         [10] 3605 	inc	iy
   7AC8 59            [ 4] 3606 	ld	e, c
   7AC9 50            [ 4] 3607 	ld	d, b
   7ACA 13            [ 6] 3608 	inc	de
   7ACB 13            [ 6] 3609 	inc	de
   7ACC 13            [ 6] 3610 	inc	de
   7ACD 3E 23         [ 7] 3611 	ld	a,#<(_spawnY)
   7ACF DD 86 FC      [19] 3612 	add	a, -4 (ix)
   7AD2 6F            [ 4] 3613 	ld	l,a
   7AD3 3E 66         [ 7] 3614 	ld	a,#>(_spawnY)
   7AD5 CE 00         [ 7] 3615 	adc	a, #0x00
   7AD7 67            [ 4] 3616 	ld	h,a
   7AD8 7E            [ 7] 3617 	ld	a,(hl)
   7AD9 DD 77 FE      [19] 3618 	ld	-2 (ix), a
   7ADC 12            [ 7] 3619 	ld	(de),a
   7ADD DD 7E FE      [19] 3620 	ld	a,-2 (ix)
   7AE0 FD 77 00      [19] 3621 	ld	0 (iy), a
                           3622 ;src/main.c:651: actual->mover  = NO;
   7AE3 21 06 00      [10] 3623 	ld	hl,#0x0006
   7AE6 09            [11] 3624 	add	hl,bc
   7AE7 36 00         [10] 3625 	ld	(hl),#0x00
                           3626 ;src/main.c:652: actual->mira   = M_abajo;
   7AE9 21 07 00      [10] 3627 	ld	hl,#0x0007
   7AEC 09            [11] 3628 	add	hl,bc
   7AED 36 03         [10] 3629 	ld	(hl),#0x03
                           3630 ;src/main.c:653: actual->sprite = g_enemy;
   7AEF 21 04 00      [10] 3631 	ld	hl,#0x0004
   7AF2 09            [11] 3632 	add	hl,bc
   7AF3 36 3A         [10] 3633 	ld	(hl),#<(_g_enemy)
   7AF5 23            [ 6] 3634 	inc	hl
   7AF6 36 3C         [10] 3635 	ld	(hl),#>(_g_enemy)
                           3636 ;src/main.c:654: actual->muerto = NO;
   7AF8 21 08 00      [10] 3637 	ld	hl,#0x0008
   7AFB 09            [11] 3638 	add	hl,bc
   7AFC 36 00         [10] 3639 	ld	(hl),#0x00
                           3640 ;src/main.c:655: actual->muertes = 0;
   7AFE 21 0A 00      [10] 3641 	ld	hl,#0x000A
   7B01 09            [11] 3642 	add	hl,bc
   7B02 36 00         [10] 3643 	ld	(hl),#0x00
                           3644 ;src/main.c:656: actual->patrolling = SI;
   7B04 21 0B 00      [10] 3645 	ld	hl,#0x000B
   7B07 09            [11] 3646 	add	hl,bc
   7B08 36 01         [10] 3647 	ld	(hl),#0x01
                           3648 ;src/main.c:657: actual->reversePatrol = NO;
   7B0A 21 0C 00      [10] 3649 	ld	hl,#0x000C
   7B0D 09            [11] 3650 	add	hl,bc
   7B0E 36 00         [10] 3651 	ld	(hl),#0x00
                           3652 ;src/main.c:658: actual->iter = 0;
   7B10 21 0E 00      [10] 3653 	ld	hl,#0x000E
   7B13 09            [11] 3654 	add	hl,bc
   7B14 36 00         [10] 3655 	ld	(hl),#0x00
                           3656 ;src/main.c:659: actual->lastIter = 0;
   7B16 21 0F 00      [10] 3657 	ld	hl,#0x000F
   7B19 09            [11] 3658 	add	hl,bc
   7B1A 36 00         [10] 3659 	ld	(hl),#0x00
                           3660 ;src/main.c:660: actual->seen = 0;
   7B1C 21 11 00      [10] 3661 	ld	hl,#0x0011
   7B1F 09            [11] 3662 	add	hl,bc
   7B20 36 00         [10] 3663 	ld	(hl),#0x00
                           3664 ;src/main.c:661: actual->found = 0;
   7B22 21 12 00      [10] 3665 	ld	hl,#0x0012
   7B25 09            [11] 3666 	add	hl,bc
   7B26 36 00         [10] 3667 	ld	(hl),#0x00
                           3668 ;src/main.c:662: pathFinding(actual->x, actual->y, patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
   7B28 21 FA 65      [10] 3669 	ld	hl,#_num_mapa + 0
   7B2B 5E            [ 7] 3670 	ld	e, (hl)
   7B2C 1C            [ 4] 3671 	inc	e
   7B2D 16 00         [ 7] 3672 	ld	d,#0x00
   7B2F 6B            [ 4] 3673 	ld	l, e
   7B30 62            [ 4] 3674 	ld	h, d
   7B31 29            [11] 3675 	add	hl, hl
   7B32 29            [11] 3676 	add	hl, hl
   7B33 19            [11] 3677 	add	hl, de
   7B34 EB            [ 4] 3678 	ex	de,hl
   7B35 21 3C 66      [10] 3679 	ld	hl,#_patrolY
   7B38 19            [11] 3680 	add	hl,de
   7B39 DD 7E FC      [19] 3681 	ld	a,-4 (ix)
   7B3C 85            [ 4] 3682 	add	a, l
   7B3D 6F            [ 4] 3683 	ld	l,a
   7B3E 3E 00         [ 7] 3684 	ld	a,#0x00
   7B40 8C            [ 4] 3685 	adc	a, h
   7B41 67            [ 4] 3686 	ld	h,a
   7B42 7E            [ 7] 3687 	ld	a,(hl)
   7B43 DD 77 FF      [19] 3688 	ld	-1 (ix),a
   7B46 21 28 66      [10] 3689 	ld	hl,#_patrolX
   7B49 19            [11] 3690 	add	hl,de
   7B4A DD 5E FC      [19] 3691 	ld	e,-4 (ix)
   7B4D 16 00         [ 7] 3692 	ld	d,#0x00
   7B4F 19            [11] 3693 	add	hl,de
   7B50 56            [ 7] 3694 	ld	d,(hl)
   7B51 C5            [11] 3695 	push	bc
   7B52 2A F8 65      [16] 3696 	ld	hl,(_mapa)
   7B55 E5            [11] 3697 	push	hl
   7B56 C5            [11] 3698 	push	bc
   7B57 DD 7E FF      [19] 3699 	ld	a,-1 (ix)
   7B5A F5            [11] 3700 	push	af
   7B5B 33            [ 6] 3701 	inc	sp
   7B5C D5            [11] 3702 	push	de
   7B5D 33            [ 6] 3703 	inc	sp
   7B5E DD 66 FE      [19] 3704 	ld	h,-2 (ix)
   7B61 DD 6E FD      [19] 3705 	ld	l,-3 (ix)
   7B64 E5            [11] 3706 	push	hl
   7B65 CD 06 49      [17] 3707 	call	_pathFinding
   7B68 21 08 00      [10] 3708 	ld	hl,#8
   7B6B 39            [11] 3709 	add	hl,sp
   7B6C F9            [ 6] 3710 	ld	sp,hl
   7B6D C1            [10] 3711 	pop	bc
                           3712 ;src/main.c:685: if(actual->longitud_camino > 0){
   7B6E 69            [ 4] 3713 	ld	l, c
   7B6F 60            [ 4] 3714 	ld	h, b
   7B70 11 44 01      [10] 3715 	ld	de, #0x0144
   7B73 19            [11] 3716 	add	hl, de
   7B74 7E            [ 7] 3717 	ld	a,(hl)
   7B75 B7            [ 4] 3718 	or	a, a
   7B76 28 07         [12] 3719 	jr	Z,00102$
                           3720 ;src/main.c:686: dibujarEnemigo(actual);
   7B78 C5            [11] 3721 	push	bc
   7B79 C5            [11] 3722 	push	bc
   7B7A CD DA 68      [17] 3723 	call	_dibujarEnemigo
   7B7D F1            [10] 3724 	pop	af
   7B7E C1            [10] 3725 	pop	bc
   7B7F                    3726 00102$:
                           3727 ;src/main.c:688: ++actual;
   7B7F 21 45 01      [10] 3728 	ld	hl,#0x0145
   7B82 09            [11] 3729 	add	hl,bc
   7B83 4D            [ 4] 3730 	ld	c,l
   7B84 44            [ 4] 3731 	ld	b,h
   7B85 C3 A1 7A      [10] 3732 	jp	00103$
   7B88                    3733 00106$:
   7B88 DD F9         [10] 3734 	ld	sp, ix
   7B8A DD E1         [14] 3735 	pop	ix
   7B8C C9            [10] 3736 	ret
                           3737 ;src/main.c:692: void avanzarMapa() {
                           3738 ;	---------------------------------
                           3739 ; Function avanzarMapa
                           3740 ; ---------------------------------
   7B8D                    3741 _avanzarMapa::
                           3742 ;src/main.c:693: if(num_mapa < NUM_MAPAS -1) {
   7B8D 3A FA 65      [13] 3743 	ld	a,(#_num_mapa + 0)
   7B90 D6 02         [ 7] 3744 	sub	a, #0x02
   7B92 30 34         [12] 3745 	jr	NC,00102$
                           3746 ;src/main.c:694: mapa = mapas[++num_mapa];
   7B94 01 18 66      [10] 3747 	ld	bc,#_mapas+0
   7B97 21 FA 65      [10] 3748 	ld	hl, #_num_mapa+0
   7B9A 34            [11] 3749 	inc	(hl)
   7B9B FD 21 FA 65   [14] 3750 	ld	iy,#_num_mapa
   7B9F FD 6E 00      [19] 3751 	ld	l,0 (iy)
   7BA2 26 00         [ 7] 3752 	ld	h,#0x00
   7BA4 29            [11] 3753 	add	hl, hl
   7BA5 09            [11] 3754 	add	hl,bc
   7BA6 7E            [ 7] 3755 	ld	a,(hl)
   7BA7 FD 21 F8 65   [14] 3756 	ld	iy,#_mapa
   7BAB FD 77 00      [19] 3757 	ld	0 (iy),a
   7BAE 23            [ 6] 3758 	inc	hl
   7BAF 7E            [ 7] 3759 	ld	a,(hl)
   7BB0 32 F9 65      [13] 3760 	ld	(#_mapa + 1),a
                           3761 ;src/main.c:695: prota.x = prota.px = 2;
   7BB3 21 1E 65      [10] 3762 	ld	hl,#(_prota + 0x0002)
   7BB6 36 02         [10] 3763 	ld	(hl),#0x02
   7BB8 21 1C 65      [10] 3764 	ld	hl,#_prota
   7BBB 36 02         [10] 3765 	ld	(hl),#0x02
                           3766 ;src/main.c:696: prota.mover = SI;
   7BBD 21 22 65      [10] 3767 	ld	hl,#(_prota + 0x0006)
   7BC0 36 01         [10] 3768 	ld	(hl),#0x01
                           3769 ;src/main.c:697: dibujarMapa();
   7BC2 CD 02 66      [17] 3770 	call	_dibujarMapa
                           3771 ;src/main.c:698: inicializarEnemy();
   7BC5 C3 90 7A      [10] 3772 	jp  _inicializarEnemy
   7BC8                    3773 00102$:
                           3774 ;src/main.c:701: menuFin(puntuacion);
   7BC8 FD 21 FB 65   [14] 3775 	ld	iy,#_puntuacion
   7BCC FD 6E 00      [19] 3776 	ld	l,0 (iy)
   7BCF 26 00         [ 7] 3777 	ld	h,#0x00
   7BD1 C3 48 4B      [10] 3778 	jp  _menuFin
                           3779 ;src/main.c:705: void moverIzquierda() {
                           3780 ;	---------------------------------
                           3781 ; Function moverIzquierda
                           3782 ; ---------------------------------
   7BD4                    3783 _moverIzquierda::
                           3784 ;src/main.c:706: prota.mira = M_izquierda;
   7BD4 01 1C 65      [10] 3785 	ld	bc,#_prota+0
   7BD7 21 23 65      [10] 3786 	ld	hl,#(_prota + 0x0007)
   7BDA 36 01         [10] 3787 	ld	(hl),#0x01
                           3788 ;src/main.c:707: if (!checkCollision(M_izquierda)) {
   7BDC C5            [11] 3789 	push	bc
   7BDD 3E 01         [ 7] 3790 	ld	a,#0x01
   7BDF F5            [11] 3791 	push	af
   7BE0 33            [ 6] 3792 	inc	sp
   7BE1 CD 65 67      [17] 3793 	call	_checkCollision
   7BE4 33            [ 6] 3794 	inc	sp
   7BE5 C1            [10] 3795 	pop	bc
   7BE6 7D            [ 4] 3796 	ld	a,l
   7BE7 B7            [ 4] 3797 	or	a, a
   7BE8 C0            [11] 3798 	ret	NZ
                           3799 ;src/main.c:708: prota.x--;
   7BE9 0A            [ 7] 3800 	ld	a,(bc)
   7BEA C6 FF         [ 7] 3801 	add	a,#0xFF
   7BEC 02            [ 7] 3802 	ld	(bc),a
                           3803 ;src/main.c:709: prota.mover = SI;
   7BED 21 22 65      [10] 3804 	ld	hl,#(_prota + 0x0006)
   7BF0 36 01         [10] 3805 	ld	(hl),#0x01
                           3806 ;src/main.c:710: prota.sprite = g_hero_left;
   7BF2 21 C6 3D      [10] 3807 	ld	hl,#_g_hero_left
   7BF5 22 20 65      [16] 3808 	ld	((_prota + 0x0004)), hl
   7BF8 C9            [10] 3809 	ret
                           3810 ;src/main.c:714: void moverDerecha() {
                           3811 ;	---------------------------------
                           3812 ; Function moverDerecha
                           3813 ; ---------------------------------
   7BF9                    3814 _moverDerecha::
                           3815 ;src/main.c:715: prota.mira = M_derecha;
   7BF9 21 23 65      [10] 3816 	ld	hl,#(_prota + 0x0007)
   7BFC 36 00         [10] 3817 	ld	(hl),#0x00
                           3818 ;src/main.c:716: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7BFE AF            [ 4] 3819 	xor	a, a
   7BFF F5            [11] 3820 	push	af
   7C00 33            [ 6] 3821 	inc	sp
   7C01 CD 65 67      [17] 3822 	call	_checkCollision
   7C04 33            [ 6] 3823 	inc	sp
   7C05 45            [ 4] 3824 	ld	b,l
   7C06 21 1C 65      [10] 3825 	ld	hl, #_prota + 0
   7C09 4E            [ 7] 3826 	ld	c,(hl)
   7C0A 59            [ 4] 3827 	ld	e,c
   7C0B 16 00         [ 7] 3828 	ld	d,#0x00
   7C0D 21 07 00      [10] 3829 	ld	hl,#0x0007
   7C10 19            [11] 3830 	add	hl,de
   7C11 11 50 80      [10] 3831 	ld	de, #0x8050
   7C14 29            [11] 3832 	add	hl, hl
   7C15 3F            [ 4] 3833 	ccf
   7C16 CB 1C         [ 8] 3834 	rr	h
   7C18 CB 1D         [ 8] 3835 	rr	l
   7C1A ED 52         [15] 3836 	sbc	hl, de
   7C1C 3E 00         [ 7] 3837 	ld	a,#0x00
   7C1E 17            [ 4] 3838 	rla
   7C1F 5F            [ 4] 3839 	ld	e,a
   7C20 78            [ 4] 3840 	ld	a,b
   7C21 B7            [ 4] 3841 	or	a,a
   7C22 20 14         [12] 3842 	jr	NZ,00104$
   7C24 B3            [ 4] 3843 	or	a,e
   7C25 28 11         [12] 3844 	jr	Z,00104$
                           3845 ;src/main.c:717: prota.x++;
   7C27 0C            [ 4] 3846 	inc	c
   7C28 21 1C 65      [10] 3847 	ld	hl,#_prota
   7C2B 71            [ 7] 3848 	ld	(hl),c
                           3849 ;src/main.c:718: prota.mover = SI;
   7C2C 21 22 65      [10] 3850 	ld	hl,#(_prota + 0x0006)
   7C2F 36 01         [10] 3851 	ld	(hl),#0x01
                           3852 ;src/main.c:719: prota.sprite = g_hero;
   7C31 21 70 3E      [10] 3853 	ld	hl,#_g_hero
   7C34 22 20 65      [16] 3854 	ld	((_prota + 0x0004)), hl
   7C37 C9            [10] 3855 	ret
   7C38                    3856 00104$:
                           3857 ;src/main.c:721: }else if( prota.x + G_HERO_W >= 80){
   7C38 7B            [ 4] 3858 	ld	a,e
   7C39 B7            [ 4] 3859 	or	a, a
   7C3A C0            [11] 3860 	ret	NZ
                           3861 ;src/main.c:722: avanzarMapa();
   7C3B C3 8D 7B      [10] 3862 	jp  _avanzarMapa
                           3863 ;src/main.c:726: void moverArriba() {
                           3864 ;	---------------------------------
                           3865 ; Function moverArriba
                           3866 ; ---------------------------------
   7C3E                    3867 _moverArriba::
                           3868 ;src/main.c:727: prota.mira = M_arriba;
   7C3E 21 23 65      [10] 3869 	ld	hl,#(_prota + 0x0007)
   7C41 36 02         [10] 3870 	ld	(hl),#0x02
                           3871 ;src/main.c:728: if (!checkCollision(M_arriba)) {
   7C43 3E 02         [ 7] 3872 	ld	a,#0x02
   7C45 F5            [11] 3873 	push	af
   7C46 33            [ 6] 3874 	inc	sp
   7C47 CD 65 67      [17] 3875 	call	_checkCollision
   7C4A 33            [ 6] 3876 	inc	sp
   7C4B 7D            [ 4] 3877 	ld	a,l
   7C4C B7            [ 4] 3878 	or	a, a
   7C4D C0            [11] 3879 	ret	NZ
                           3880 ;src/main.c:729: prota.y--;
   7C4E 21 1D 65      [10] 3881 	ld	hl,#_prota + 1
   7C51 4E            [ 7] 3882 	ld	c,(hl)
   7C52 0D            [ 4] 3883 	dec	c
   7C53 71            [ 7] 3884 	ld	(hl),c
                           3885 ;src/main.c:730: prota.y--;
   7C54 0D            [ 4] 3886 	dec	c
   7C55 71            [ 7] 3887 	ld	(hl),c
                           3888 ;src/main.c:731: prota.mover  = SI;
   7C56 21 22 65      [10] 3889 	ld	hl,#(_prota + 0x0006)
   7C59 36 01         [10] 3890 	ld	(hl),#0x01
                           3891 ;src/main.c:732: prota.sprite = g_hero_up;
   7C5B 21 2C 3D      [10] 3892 	ld	hl,#_g_hero_up
   7C5E 22 20 65      [16] 3893 	ld	((_prota + 0x0004)), hl
   7C61 C9            [10] 3894 	ret
                           3895 ;src/main.c:736: void moverAbajo() {
                           3896 ;	---------------------------------
                           3897 ; Function moverAbajo
                           3898 ; ---------------------------------
   7C62                    3899 _moverAbajo::
                           3900 ;src/main.c:737: prota.mira = M_abajo;
   7C62 21 23 65      [10] 3901 	ld	hl,#(_prota + 0x0007)
   7C65 36 03         [10] 3902 	ld	(hl),#0x03
                           3903 ;src/main.c:738: if (!checkCollision(M_abajo) ) {
   7C67 3E 03         [ 7] 3904 	ld	a,#0x03
   7C69 F5            [11] 3905 	push	af
   7C6A 33            [ 6] 3906 	inc	sp
   7C6B CD 65 67      [17] 3907 	call	_checkCollision
   7C6E 33            [ 6] 3908 	inc	sp
   7C6F 7D            [ 4] 3909 	ld	a,l
   7C70 B7            [ 4] 3910 	or	a, a
   7C71 C0            [11] 3911 	ret	NZ
                           3912 ;src/main.c:739: prota.y++;
   7C72 01 1D 65      [10] 3913 	ld	bc,#_prota + 1
   7C75 0A            [ 7] 3914 	ld	a,(bc)
   7C76 3C            [ 4] 3915 	inc	a
   7C77 02            [ 7] 3916 	ld	(bc),a
                           3917 ;src/main.c:740: prota.y++;
   7C78 3C            [ 4] 3918 	inc	a
   7C79 02            [ 7] 3919 	ld	(bc),a
                           3920 ;src/main.c:741: prota.mover  = SI;
   7C7A 21 22 65      [10] 3921 	ld	hl,#(_prota + 0x0006)
   7C7D 36 01         [10] 3922 	ld	(hl),#0x01
                           3923 ;src/main.c:742: prota.sprite = g_hero_down;
   7C7F 21 92 3C      [10] 3924 	ld	hl,#_g_hero_down
   7C82 22 20 65      [16] 3925 	ld	((_prota + 0x0004)), hl
   7C85 C9            [10] 3926 	ret
                           3927 ;src/main.c:749: void intHandler() {
                           3928 ;	---------------------------------
                           3929 ; Function intHandler
                           3930 ; ---------------------------------
   7C86                    3931 _intHandler::
                           3932 ;src/main.c:750: if (++i == 6) {
   7C86 21 2E 65      [10] 3933 	ld	hl, #_i+0
   7C89 34            [11] 3934 	inc	(hl)
   7C8A 3A 2E 65      [13] 3935 	ld	a,(#_i + 0)
   7C8D D6 06         [ 7] 3936 	sub	a, #0x06
   7C8F C0            [11] 3937 	ret	NZ
                           3938 ;src/main.c:751: play();
   7C90 CD DC 52      [17] 3939 	call	_play
                           3940 ;src/main.c:752: i=0;
   7C93 21 2E 65      [10] 3941 	ld	hl,#_i + 0
   7C96 36 00         [10] 3942 	ld	(hl), #0x00
   7C98 C9            [10] 3943 	ret
                           3944 ;src/main.c:756: void inicializarCPC() {
                           3945 ;	---------------------------------
                           3946 ; Function inicializarCPC
                           3947 ; ---------------------------------
   7C99                    3948 _inicializarCPC::
                           3949 ;src/main.c:757: cpct_disableFirmware();
   7C99 CD 83 56      [17] 3950 	call	_cpct_disableFirmware
                           3951 ;src/main.c:758: cpct_setVideoMode(0);
   7C9C 2E 00         [ 7] 3952 	ld	l,#0x00
   7C9E CD 57 56      [17] 3953 	call	_cpct_setVideoMode
                           3954 ;src/main.c:759: cpct_setBorder(HW_BLACK);
   7CA1 21 10 14      [10] 3955 	ld	hl,#0x1410
   7CA4 E5            [11] 3956 	push	hl
   7CA5 CD BA 53      [17] 3957 	call	_cpct_setPALColour
                           3958 ;src/main.c:760: cpct_setPalette(g_palette, 16);
   7CA8 21 10 00      [10] 3959 	ld	hl,#0x0010
   7CAB E5            [11] 3960 	push	hl
   7CAC 21 60 3E      [10] 3961 	ld	hl,#_g_palette
   7CAF E5            [11] 3962 	push	hl
   7CB0 CD 97 53      [17] 3963 	call	_cpct_setPalette
   7CB3 C9            [10] 3964 	ret
                           3965 ;src/main.c:765: void inicializarJuego() {
                           3966 ;	---------------------------------
                           3967 ; Function inicializarJuego
                           3968 ; ---------------------------------
   7CB4                    3969 _inicializarJuego::
                           3970 ;src/main.c:767: num_mapa = 0;
   7CB4 21 FA 65      [10] 3971 	ld	hl,#_num_mapa + 0
   7CB7 36 00         [10] 3972 	ld	(hl), #0x00
                           3973 ;src/main.c:768: mapa = mapas[num_mapa];
   7CB9 21 18 66      [10] 3974 	ld	hl, #_mapas + 0
   7CBC 7E            [ 7] 3975 	ld	a,(hl)
   7CBD FD 21 F8 65   [14] 3976 	ld	iy,#_mapa
   7CC1 FD 77 00      [19] 3977 	ld	0 (iy),a
   7CC4 23            [ 6] 3978 	inc	hl
   7CC5 7E            [ 7] 3979 	ld	a,(hl)
   7CC6 32 F9 65      [13] 3980 	ld	(#_mapa + 1),a
                           3981 ;src/main.c:769: cpct_etm_setTileset2x4(g_tileset);
   7CC9 21 E0 17      [10] 3982 	ld	hl,#_g_tileset
   7CCC CD AB 55      [17] 3983 	call	_cpct_etm_setTileset2x4
                           3984 ;src/main.c:771: dibujarMapa();
   7CCF CD 02 66      [17] 3985 	call	_dibujarMapa
                           3986 ;src/main.c:774: barraPuntuacionInicial();
   7CD2 CD E8 50      [17] 3987 	call	_barraPuntuacionInicial
                           3988 ;src/main.c:777: prota.x = prota.px = 4;
   7CD5 21 1E 65      [10] 3989 	ld	hl,#(_prota + 0x0002)
   7CD8 36 04         [10] 3990 	ld	(hl),#0x04
   7CDA 21 1C 65      [10] 3991 	ld	hl,#_prota
   7CDD 36 04         [10] 3992 	ld	(hl),#0x04
                           3993 ;src/main.c:778: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   7CDF 21 1F 65      [10] 3994 	ld	hl,#(_prota + 0x0003)
   7CE2 36 68         [10] 3995 	ld	(hl),#0x68
   7CE4 21 1D 65      [10] 3996 	ld	hl,#(_prota + 0x0001)
   7CE7 36 68         [10] 3997 	ld	(hl),#0x68
                           3998 ;src/main.c:779: prota.mover  = NO;
   7CE9 21 22 65      [10] 3999 	ld	hl,#(_prota + 0x0006)
   7CEC 36 00         [10] 4000 	ld	(hl),#0x00
                           4001 ;src/main.c:780: prota.mira=M_derecha;
   7CEE 21 23 65      [10] 4002 	ld	hl,#(_prota + 0x0007)
   7CF1 36 00         [10] 4003 	ld	(hl),#0x00
                           4004 ;src/main.c:781: prota.sprite = g_hero;
   7CF3 21 70 3E      [10] 4005 	ld	hl,#_g_hero
   7CF6 22 20 65      [16] 4006 	ld	((_prota + 0x0004)), hl
                           4007 ;src/main.c:785: cu.x = cu.px = 0;
   7CF9 21 26 65      [10] 4008 	ld	hl,#(_cu + 0x0002)
   7CFC 36 00         [10] 4009 	ld	(hl),#0x00
   7CFE 21 24 65      [10] 4010 	ld	hl,#_cu
   7D01 36 00         [10] 4011 	ld	(hl),#0x00
                           4012 ;src/main.c:786: cu.y = cu.py = 0;
   7D03 21 27 65      [10] 4013 	ld	hl,#(_cu + 0x0003)
   7D06 36 00         [10] 4014 	ld	(hl),#0x00
   7D08 21 25 65      [10] 4015 	ld	hl,#(_cu + 0x0001)
   7D0B 36 00         [10] 4016 	ld	(hl),#0x00
                           4017 ;src/main.c:787: cu.lanzado = NO;
   7D0D 21 2A 65      [10] 4018 	ld	hl,#(_cu + 0x0006)
   7D10 36 00         [10] 4019 	ld	(hl),#0x00
                           4020 ;src/main.c:788: cu.mover = NO;
   7D12 21 2D 65      [10] 4021 	ld	hl,#(_cu + 0x0009)
   7D15 36 00         [10] 4022 	ld	(hl),#0x00
                           4023 ;src/main.c:790: inicializarEnemy();
   7D17 CD 90 7A      [17] 4024 	call	_inicializarEnemy
                           4025 ;src/main.c:792: dibujarProta();
   7D1A C3 50 66      [10] 4026 	jp  _dibujarProta
                           4027 ;src/main.c:795: void main(void) {
                           4028 ;	---------------------------------
                           4029 ; Function main
                           4030 ; ---------------------------------
   7D1D                    4031 _main::
   7D1D DD E5         [15] 4032 	push	ix
   7D1F DD 21 00 00   [14] 4033 	ld	ix,#0
   7D23 DD 39         [15] 4034 	add	ix,sp
   7D25 F5            [11] 4035 	push	af
   7D26 F5            [11] 4036 	push	af
                           4037 ;src/main.c:800: inicializarCPC();
   7D27 CD 99 7C      [17] 4038 	call	_inicializarCPC
                           4039 ;src/main.c:802: menuInicio();
   7D2A CD 09 50      [17] 4040 	call	_menuInicio
                           4041 ;src/main.c:804: inicializarJuego();
   7D2D CD B4 7C      [17] 4042 	call	_inicializarJuego
                           4043 ;src/main.c:808: while (1) {
   7D30                    4044 00119$:
                           4045 ;src/main.c:810: i = 2 + 1;
   7D30 DD 36 FC 03   [19] 4046 	ld	-4 (ix),#0x03
                           4047 ;src/main.c:811: actual = enemy;
                           4048 ;src/main.c:813: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   7D34 21 00 01      [10] 4049 	ld	hl,#_g_tablatrans
   7D37 E5            [11] 4050 	push	hl
   7D38 2A F8 65      [16] 4051 	ld	hl,(_mapa)
   7D3B E5            [11] 4052 	push	hl
   7D3C 21 1C 65      [10] 4053 	ld	hl,#_prota
   7D3F E5            [11] 4054 	push	hl
   7D40 21 24 65      [10] 4055 	ld	hl,#_cu
   7D43 E5            [11] 4056 	push	hl
   7D44 CD FE 66      [17] 4057 	call	_comprobarTeclado
   7D47 21 08 00      [10] 4058 	ld	hl,#8
   7D4A 39            [11] 4059 	add	hl,sp
   7D4B F9            [ 6] 4060 	ld	sp,hl
                           4061 ;src/main.c:814: moverCuchillo(&cu, mapa);
   7D4C 2A F8 65      [16] 4062 	ld	hl,(_mapa)
   7D4F E5            [11] 4063 	push	hl
   7D50 21 24 65      [10] 4064 	ld	hl,#_cu
   7D53 E5            [11] 4065 	push	hl
   7D54 CD 00 43      [17] 4066 	call	_moverCuchillo
   7D57 F1            [10] 4067 	pop	af
   7D58 F1            [10] 4068 	pop	af
                           4069 ;src/main.c:815: updateEnemies();
   7D59 CD 06 79      [17] 4070 	call	_updateEnemies
                           4071 ;src/main.c:817: cpct_waitVSYNC();
   7D5C CD 4F 56      [17] 4072 	call	_cpct_waitVSYNC
                           4073 ;src/main.c:820: if (prota.mover) {
   7D5F 01 22 65      [10] 4074 	ld	bc,#_prota + 6
   7D62 0A            [ 7] 4075 	ld	a,(bc)
   7D63 B7            [ 4] 4076 	or	a, a
   7D64 28 07         [12] 4077 	jr	Z,00102$
                           4078 ;src/main.c:821: redibujarProta();
   7D66 C5            [11] 4079 	push	bc
   7D67 CD EA 66      [17] 4080 	call	_redibujarProta
   7D6A C1            [10] 4081 	pop	bc
                           4082 ;src/main.c:822: prota.mover = NO;
   7D6B AF            [ 4] 4083 	xor	a, a
   7D6C 02            [ 7] 4084 	ld	(bc),a
   7D6D                    4085 00102$:
                           4086 ;src/main.c:824: if(cu.lanzado && cu.mover){
   7D6D 21 2A 65      [10] 4087 	ld	hl, #(_cu + 0x0006) + 0
   7D70 4E            [ 7] 4088 	ld	c,(hl)
                           4089 ;src/main.c:825: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4090 ;src/main.c:824: if(cu.lanzado && cu.mover){
   7D71 79            [ 4] 4091 	ld	a,c
   7D72 B7            [ 4] 4092 	or	a, a
   7D73 28 30         [12] 4093 	jr	Z,00107$
   7D75 3A 2D 65      [13] 4094 	ld	a, (#(_cu + 0x0009) + 0)
   7D78 B7            [ 4] 4095 	or	a, a
   7D79 28 2A         [12] 4096 	jr	Z,00107$
                           4097 ;src/main.c:825: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   7D7B 21 25 65      [10] 4098 	ld	hl, #(_cu + 0x0001) + 0
   7D7E 4E            [ 7] 4099 	ld	c,(hl)
   7D7F 21 24 65      [10] 4100 	ld	hl, #_cu + 0
   7D82 46            [ 7] 4101 	ld	b,(hl)
   7D83 21 2C 65      [10] 4102 	ld	hl, #(_cu + 0x0008) + 0
   7D86 5E            [ 7] 4103 	ld	e,(hl)
   7D87 2A F8 65      [16] 4104 	ld	hl,(_mapa)
   7D8A E5            [11] 4105 	push	hl
   7D8B 21 00 01      [10] 4106 	ld	hl,#_g_tablatrans
   7D8E E5            [11] 4107 	push	hl
   7D8F 21 24 65      [10] 4108 	ld	hl,#_cu
   7D92 E5            [11] 4109 	push	hl
   7D93 79            [ 4] 4110 	ld	a,c
   7D94 F5            [11] 4111 	push	af
   7D95 33            [ 6] 4112 	inc	sp
   7D96 C5            [11] 4113 	push	bc
   7D97 33            [ 6] 4114 	inc	sp
   7D98 7B            [ 4] 4115 	ld	a,e
   7D99 F5            [11] 4116 	push	af
   7D9A 33            [ 6] 4117 	inc	sp
   7D9B CD 25 40      [17] 4118 	call	_redibujarCuchillo
   7D9E 21 09 00      [10] 4119 	ld	hl,#9
   7DA1 39            [11] 4120 	add	hl,sp
   7DA2 F9            [ 6] 4121 	ld	sp,hl
   7DA3 18 28         [12] 4122 	jr	00132$
   7DA5                    4123 00107$:
                           4124 ;src/main.c:826: }else if (cu.lanzado && !cu.mover){
   7DA5 79            [ 4] 4125 	ld	a,c
   7DA6 B7            [ 4] 4126 	or	a, a
   7DA7 28 24         [12] 4127 	jr	Z,00132$
   7DA9 3A 2D 65      [13] 4128 	ld	a, (#(_cu + 0x0009) + 0)
   7DAC B7            [ 4] 4129 	or	a, a
   7DAD 20 1E         [12] 4130 	jr	NZ,00132$
                           4131 ;src/main.c:827: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   7DAF 21 25 65      [10] 4132 	ld	hl, #(_cu + 0x0001) + 0
   7DB2 46            [ 7] 4133 	ld	b,(hl)
   7DB3 21 24 65      [10] 4134 	ld	hl, #_cu + 0
   7DB6 4E            [ 7] 4135 	ld	c,(hl)
   7DB7 21 2C 65      [10] 4136 	ld	hl, #(_cu + 0x0008) + 0
   7DBA 56            [ 7] 4137 	ld	d,(hl)
   7DBB 2A F8 65      [16] 4138 	ld	hl,(_mapa)
   7DBE E5            [11] 4139 	push	hl
   7DBF C5            [11] 4140 	push	bc
   7DC0 D5            [11] 4141 	push	de
   7DC1 33            [ 6] 4142 	inc	sp
   7DC2 CD 92 3F      [17] 4143 	call	_borrarCuchillo
   7DC5 F1            [10] 4144 	pop	af
   7DC6 F1            [10] 4145 	pop	af
   7DC7 33            [ 6] 4146 	inc	sp
                           4147 ;src/main.c:828: cu.lanzado = NO;
   7DC8 21 2A 65      [10] 4148 	ld	hl,#(_cu + 0x0006)
   7DCB 36 00         [10] 4149 	ld	(hl),#0x00
                           4150 ;src/main.c:831: while(--i){
   7DCD                    4151 00132$:
   7DCD 01 08 60      [10] 4152 	ld	bc,#_enemy
   7DD0                    4153 00115$:
   7DD0 DD 35 FC      [23] 4154 	dec	-4 (ix)
   7DD3 DD 7E FC      [19] 4155 	ld	a, -4 (ix)
   7DD6 B7            [ 4] 4156 	or	a, a
   7DD7 CA 7A 7E      [10] 4157 	jp	Z,00117$
                           4158 ;src/main.c:832: if(actual->mover){
   7DDA C5            [11] 4159 	push	bc
   7DDB FD E1         [14] 4160 	pop	iy
   7DDD FD 5E 06      [19] 4161 	ld	e,6 (iy)
                           4162 ;src/main.c:833: redibujarEnemigo((*actual).x, (*actual).y, actual);
   7DE0 21 01 00      [10] 4163 	ld	hl,#0x0001
   7DE3 09            [11] 4164 	add	hl,bc
   7DE4 DD 75 FD      [19] 4165 	ld	-3 (ix),l
   7DE7 DD 74 FE      [19] 4166 	ld	-2 (ix),h
                           4167 ;src/main.c:832: if(actual->mover){
   7DEA 7B            [ 4] 4168 	ld	a,e
   7DEB B7            [ 4] 4169 	or	a, a
   7DEC 28 14         [12] 4170 	jr	Z,00111$
                           4171 ;src/main.c:833: redibujarEnemigo((*actual).x, (*actual).y, actual);
   7DEE DD 6E FD      [19] 4172 	ld	l,-3 (ix)
   7DF1 DD 66 FE      [19] 4173 	ld	h,-2 (ix)
   7DF4 56            [ 7] 4174 	ld	d,(hl)
   7DF5 0A            [ 7] 4175 	ld	a,(bc)
   7DF6 C5            [11] 4176 	push	bc
   7DF7 C5            [11] 4177 	push	bc
   7DF8 D5            [11] 4178 	push	de
   7DF9 33            [ 6] 4179 	inc	sp
   7DFA F5            [11] 4180 	push	af
   7DFB 33            [ 6] 4181 	inc	sp
   7DFC CD 30 6A      [17] 4182 	call	_redibujarEnemigo
   7DFF F1            [10] 4183 	pop	af
   7E00 F1            [10] 4184 	pop	af
   7E01 C1            [10] 4185 	pop	bc
   7E02                    4186 00111$:
                           4187 ;src/main.c:835: if (actual->muerto && actual->muertes == 0){
   7E02 C5            [11] 4188 	push	bc
   7E03 FD E1         [14] 4189 	pop	iy
   7E05 FD 7E 08      [19] 4190 	ld	a,8 (iy)
   7E08 B7            [ 4] 4191 	or	a, a
   7E09 28 66         [12] 4192 	jr	Z,00113$
   7E0B 21 0A 00      [10] 4193 	ld	hl,#0x000A
   7E0E 09            [11] 4194 	add	hl,bc
   7E0F EB            [ 4] 4195 	ex	de,hl
   7E10 1A            [ 7] 4196 	ld	a,(de)
   7E11 B7            [ 4] 4197 	or	a, a
   7E12 20 5D         [12] 4198 	jr	NZ,00113$
                           4199 ;src/main.c:836: borrarEnemigo((*actual).x, (*actual).y);
   7E14 DD 6E FD      [19] 4200 	ld	l,-3 (ix)
   7E17 DD 66 FE      [19] 4201 	ld	h,-2 (ix)
   7E1A 7E            [ 7] 4202 	ld	a,(hl)
   7E1B F5            [11] 4203 	push	af
   7E1C 0A            [ 7] 4204 	ld	a,(bc)
   7E1D DD 77 FF      [19] 4205 	ld	-1 (ix),a
   7E20 F1            [10] 4206 	pop	af
   7E21 C5            [11] 4207 	push	bc
   7E22 D5            [11] 4208 	push	de
   7E23 F5            [11] 4209 	push	af
   7E24 33            [ 6] 4210 	inc	sp
   7E25 DD 7E FF      [19] 4211 	ld	a,-1 (ix)
   7E28 F5            [11] 4212 	push	af
   7E29 33            [ 6] 4213 	inc	sp
   7E2A CD BA 69      [17] 4214 	call	_borrarEnemigo
   7E2D F1            [10] 4215 	pop	af
   7E2E D1            [10] 4216 	pop	de
   7E2F C1            [10] 4217 	pop	bc
                           4218 ;src/main.c:837: dibujarExplosion(actual);
   7E30 C5            [11] 4219 	push	bc
   7E31 D5            [11] 4220 	push	de
   7E32 C5            [11] 4221 	push	bc
   7E33 CD 12 69      [17] 4222 	call	_dibujarExplosion
   7E36 F1            [10] 4223 	pop	af
   7E37 D1            [10] 4224 	pop	de
   7E38 C1            [10] 4225 	pop	bc
                           4226 ;src/main.c:838: puntuacion_aux = puntuacion;
   7E39 FD 21 FB 65   [14] 4227 	ld	iy,#_puntuacion
   7E3D FD 6E 00      [19] 4228 	ld	l,0 (iy)
   7E40 26 00         [ 7] 4229 	ld	h,#0x00
                           4230 ;src/main.c:839: puntuacion = aumentarPuntuacion(puntuacion_aux);
   7E42 C5            [11] 4231 	push	bc
   7E43 D5            [11] 4232 	push	de
   7E44 E5            [11] 4233 	push	hl
   7E45 CD C1 52      [17] 4234 	call	_aumentarPuntuacion
   7E48 F1            [10] 4235 	pop	af
   7E49 D1            [10] 4236 	pop	de
   7E4A C1            [10] 4237 	pop	bc
   7E4B FD 21 FB 65   [14] 4238 	ld	iy,#_puntuacion
   7E4F FD 75 00      [19] 4239 	ld	0 (iy),l
                           4240 ;src/main.c:840: modificarPuntuacion(puntuacion);
   7E52 FD 21 FB 65   [14] 4241 	ld	iy,#_puntuacion
   7E56 FD 6E 00      [19] 4242 	ld	l,0 (iy)
   7E59 26 00         [ 7] 4243 	ld	h,#0x00
   7E5B C5            [11] 4244 	push	bc
   7E5C D5            [11] 4245 	push	de
   7E5D E5            [11] 4246 	push	hl
   7E5E CD 84 51      [17] 4247 	call	_modificarPuntuacion
   7E61 F1            [10] 4248 	pop	af
   7E62 D1            [10] 4249 	pop	de
   7E63 C1            [10] 4250 	pop	bc
                           4251 ;src/main.c:842: actual->muertes++;
   7E64 1A            [ 7] 4252 	ld	a,(de)
   7E65 3C            [ 4] 4253 	inc	a
   7E66 12            [ 7] 4254 	ld	(de),a
                           4255 ;src/main.c:843: actual->x = 0;
   7E67 AF            [ 4] 4256 	xor	a, a
   7E68 02            [ 7] 4257 	ld	(bc),a
                           4258 ;src/main.c:844: actual->y = 0;
   7E69 DD 6E FD      [19] 4259 	ld	l,-3 (ix)
   7E6C DD 66 FE      [19] 4260 	ld	h,-2 (ix)
   7E6F 36 00         [10] 4261 	ld	(hl),#0x00
   7E71                    4262 00113$:
                           4263 ;src/main.c:846: ++actual;
   7E71 21 45 01      [10] 4264 	ld	hl,#0x0145
   7E74 09            [11] 4265 	add	hl,bc
   7E75 4D            [ 4] 4266 	ld	c,l
   7E76 44            [ 4] 4267 	ld	b,h
   7E77 C3 D0 7D      [10] 4268 	jp	00115$
   7E7A                    4269 00117$:
                           4270 ;src/main.c:848: cpct_waitVSYNC();
   7E7A CD 4F 56      [17] 4271 	call	_cpct_waitVSYNC
   7E7D C3 30 7D      [10] 4272 	jp	00119$
                           4273 	.area _CODE
                           4274 	.area _INITIALIZER
   65FD                    4275 __xinit__mapa:
   65FD 00 00              4276 	.dw #0x0000
   65FF                    4277 __xinit__num_mapa:
   65FF 00                 4278 	.db #0x00	; 0
   6600                    4279 __xinit__puntuacion:
   6600 00                 4280 	.db #0x00	; 0
   6601                    4281 __xinit__vidas:
   6601 05                 4282 	.db #0x05	; 5
                           4283 	.area _CABS (ABS)
