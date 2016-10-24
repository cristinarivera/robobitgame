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
                             23 	.globl _seek
                             24 	.globl _patrol
                             25 	.globl _moverEnemigoSeek
                             26 	.globl _lookFor
                             27 	.globl _moverEnemigoPatrol
                             28 	.globl _moverEnemigo
                             29 	.globl _moverEnemigoIzquierda
                             30 	.globl _moverEnemigoDerecha
                             31 	.globl _moverEnemigoAbajo
                             32 	.globl _moverEnemigoArriba
                             33 	.globl _checkEnemyCollision
                             34 	.globl _redibujarEnemigo
                             35 	.globl _borrarEnemigo
                             36 	.globl _borrarExplosion
                             37 	.globl _dibujarExplosion
                             38 	.globl _dibujarEnemigo
                             39 	.globl _checkCollision
                             40 	.globl _comprobarTeclado
                             41 	.globl _redibujarProta
                             42 	.globl _borrarProta
                             43 	.globl _dibujarProta
                             44 	.globl _dibujarMapa
                             45 	.globl _play
                             46 	.globl _pathFinding
                             47 	.globl _moverCuchillo
                             48 	.globl _lanzarCuchillo
                             49 	.globl _redibujarCuchillo
                             50 	.globl _borrarCuchillo
                             51 	.globl _abs
                             52 	.globl _getTilePtr
                             53 	.globl _aumentarPuntuacion
                             54 	.globl _modificarPuntuacion
                             55 	.globl _barraPuntuacionInicial
                             56 	.globl _menuInicio
                             57 	.globl _menuFin
                             58 	.globl _cpct_etm_setTileset2x4
                             59 	.globl _cpct_etm_drawTileBox2x4
                             60 	.globl _cpct_akp_musicInit
                             61 	.globl _cpct_getScreenPtr
                             62 	.globl _cpct_setPALColour
                             63 	.globl _cpct_setPalette
                             64 	.globl _cpct_waitVSYNC
                             65 	.globl _cpct_setVideoMode
                             66 	.globl _cpct_drawSpriteMaskedAlignedTable
                             67 	.globl _cpct_isAnyKeyPressed
                             68 	.globl _cpct_isKeyPressed
                             69 	.globl _cpct_scanKeyboard_if
                             70 	.globl _cpct_setInterruptHandler
                             71 	.globl _cpct_disableFirmware
                             72 	.globl _vidas
                             73 	.globl _puntuacion
                             74 	.globl _num_mapa
                             75 	.globl _mapa
                             76 	.globl _i
                             77 	.globl _cu
                             78 	.globl _prota
                             79 	.globl _enemy
                             80 	.globl _spawnY
                             81 	.globl _spawnX
                             82 	.globl _mapas
                             83 ;--------------------------------------------------------
                             84 ; special function registers
                             85 ;--------------------------------------------------------
                             86 ;--------------------------------------------------------
                             87 ; ram data
                             88 ;--------------------------------------------------------
                             89 	.area _DATA
   653F                      90 _enemy::
   653F                      91 	.ds 1304
   6A57                      92 _prota::
   6A57                      93 	.ds 8
   6A5F                      94 _cu::
   6A5F                      95 	.ds 10
   6A69                      96 _i::
   6A69                      97 	.ds 1
                             98 ;--------------------------------------------------------
                             99 ; ram data
                            100 ;--------------------------------------------------------
                            101 	.area _INITIALIZED
   730F                     102 _mapa::
   730F                     103 	.ds 2
   7311                     104 _num_mapa::
   7311                     105 	.ds 1
   7312                     106 _puntuacion::
   7312                     107 	.ds 1
   7313                     108 _vidas::
   7313                     109 	.ds 1
                            110 ;--------------------------------------------------------
                            111 ; absolute external ram data
                            112 ;--------------------------------------------------------
                            113 	.area _DABS (ABS)
                            114 ;--------------------------------------------------------
                            115 ; global & static initialisations
                            116 ;--------------------------------------------------------
                            117 	.area _HOME
                            118 	.area _GSINIT
                            119 	.area _GSFINAL
                            120 	.area _GSINIT
                            121 ;--------------------------------------------------------
                            122 ; Home
                            123 ;--------------------------------------------------------
                            124 	.area _HOME
                            125 	.area _HOME
                            126 ;--------------------------------------------------------
                            127 ; code
                            128 ;--------------------------------------------------------
                            129 	.area _CODE
                            130 ;src/main.c:93: cpctm_createTransparentMaskTable(g_tablatrans, 0x0100, M0, 0); 
                            131 ;	---------------------------------
                            132 ; Function dummy_cpct_transparentMaskTable0M0_container
                            133 ; ---------------------------------
   3F0A                     134 _dummy_cpct_transparentMaskTable0M0_container::
                            135 	.area _g_tablatrans_ (ABS) 
   0100                     136 	.org 0x0100 
   0100                     137 	 _g_tablatrans::
   0100 FF AA 55 00 AA AA   138 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0108 55 00 55 00 00 00   139 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0110 AA AA 00 00 AA AA   140 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0118 00 00 00 00 00 00   141 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0120 55 00 55 00 00 00   142 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0128 55 00 55 00 00 00   143 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0130 00 00 00 00 00 00   144 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0138 00 00 00 00 00 00   145 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0140 AA AA 00 00 AA AA   146 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0148 00 00 00 00 00 00   147 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0150 AA AA 00 00 AA AA   148 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0158 00 00 00 00 00 00   149 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0160 00 00 00 00 00 00   150 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0168 00 00 00 00 00 00   151 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0170 00 00 00 00 00 00   152 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0178 00 00 00 00 00 00   153 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0180 55 00 55 00 00 00   154 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0188 55 00 55 00 00 00   155 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0190 00 00 00 00 00 00   156 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0198 00 00 00 00 00 00   157 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A0 55 00 55 00 00 00   158 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A8 55 00 55 00 00 00   159 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B0 00 00 00 00 00 00   160 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B8 00 00 00 00 00 00   161 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C0 00 00 00 00 00 00   162 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C8 00 00 00 00 00 00   163 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D0 00 00 00 00 00 00   164 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D8 00 00 00 00 00 00   165 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E0 00 00 00 00 00 00   166 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E8 00 00 00 00 00 00   167 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F0 00 00 00 00 00 00   168 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F8 00 00 00 00 00 00   169 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            170 	.area _CSEG (REL, CON) 
                            171 ;src/main.c:96: void dibujarMapa() {
                            172 ;	---------------------------------
                            173 ; Function dibujarMapa
                            174 ; ---------------------------------
   7319                     175 _dibujarMapa::
                            176 ;src/main.c:99: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, p, mapa);
   7319 2A 0F 73      [16]  177 	ld	hl,(_mapa)
   731C E5            [11]  178 	push	hl
   731D 21 F0 C0      [10]  179 	ld	hl,#0xC0F0
   7320 E5            [11]  180 	push	hl
   7321 21 2C 28      [10]  181 	ld	hl,#0x282C
   7324 E5            [11]  182 	push	hl
   7325 2E 00         [ 7]  183 	ld	l, #0x00
   7327 E5            [11]  184 	push	hl
   7328 AF            [ 4]  185 	xor	a, a
   7329 F5            [11]  186 	push	af
   732A 33            [ 6]  187 	inc	sp
   732B CD 9E 59      [17]  188 	call	_cpct_etm_drawTileBox2x4
   732E C9            [10]  189 	ret
   732F                     190 _mapas:
   732F C0 10               191 	.dw _g_map1
   7331 E0 09               192 	.dw _g_map2
   7333 00 03               193 	.dw _g_map3
   7335                     194 _spawnX:
   7335 00                  195 	.db #0x00	; 0
   7336 28                  196 	.db #0x28	; 40
   7337 47                  197 	.db #0x47	; 71	'G'
   7338 14                  198 	.db #0x14	; 20
   7339 3C                  199 	.db #0x3C	; 60
   733A                     200 _spawnY:
   733A 00                  201 	.db #0x00	; 0
   733B 2C                  202 	.db #0x2C	; 44
   733C 72                  203 	.db #0x72	; 114	'r'
   733D 8A                  204 	.db #0x8A	; 138
   733E 8A                  205 	.db #0x8A	; 138
                            206 ;src/main.c:102: void dibujarProta() {
                            207 ;	---------------------------------
                            208 ; Function dibujarProta
                            209 ; ---------------------------------
   733F                     210 _dibujarProta::
                            211 ;src/main.c:103: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   733F 21 58 6A      [10]  212 	ld	hl, #_prota + 1
   7342 56            [ 7]  213 	ld	d,(hl)
   7343 21 57 6A      [10]  214 	ld	hl, #_prota + 0
   7346 46            [ 7]  215 	ld	b,(hl)
   7347 D5            [11]  216 	push	de
   7348 33            [ 6]  217 	inc	sp
   7349 C5            [11]  218 	push	bc
   734A 33            [ 6]  219 	inc	sp
   734B 21 00 C0      [10]  220 	ld	hl,#0xC000
   734E E5            [11]  221 	push	hl
   734F CD BC 64      [17]  222 	call	_cpct_getScreenPtr
   7352 EB            [ 4]  223 	ex	de,hl
                            224 ;src/main.c:104: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   7353 ED 4B 5B 6A   [20]  225 	ld	bc, (#_prota + 4)
   7357 21 00 01      [10]  226 	ld	hl,#_g_tablatrans
   735A E5            [11]  227 	push	hl
   735B 21 07 16      [10]  228 	ld	hl,#0x1607
   735E E5            [11]  229 	push	hl
   735F D5            [11]  230 	push	de
   7360 C5            [11]  231 	push	bc
   7361 CD DC 64      [17]  232 	call	_cpct_drawSpriteMaskedAlignedTable
   7364 C9            [10]  233 	ret
                            234 ;src/main.c:107: void borrarProta() {
                            235 ;	---------------------------------
                            236 ; Function borrarProta
                            237 ; ---------------------------------
   7365                     238 _borrarProta::
   7365 DD E5         [15]  239 	push	ix
   7367 DD 21 00 00   [14]  240 	ld	ix,#0
   736B DD 39         [15]  241 	add	ix,sp
   736D F5            [11]  242 	push	af
   736E 3B            [ 6]  243 	dec	sp
                            244 ;src/main.c:111: u8 w = 4 + (prota.px & 1);
   736F 21 59 6A      [10]  245 	ld	hl, #_prota + 2
   7372 4E            [ 7]  246 	ld	c,(hl)
   7373 79            [ 4]  247 	ld	a,c
   7374 E6 01         [ 7]  248 	and	a, #0x01
   7376 47            [ 4]  249 	ld	b,a
   7377 04            [ 4]  250 	inc	b
   7378 04            [ 4]  251 	inc	b
   7379 04            [ 4]  252 	inc	b
   737A 04            [ 4]  253 	inc	b
                            254 ;src/main.c:114: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   737B 21 5A 6A      [10]  255 	ld	hl, #_prota + 3
   737E 5E            [ 7]  256 	ld	e,(hl)
   737F CB 4B         [ 8]  257 	bit	1, e
   7381 28 04         [12]  258 	jr	Z,00103$
   7383 3E 01         [ 7]  259 	ld	a,#0x01
   7385 18 02         [12]  260 	jr	00104$
   7387                     261 00103$:
   7387 3E 00         [ 7]  262 	ld	a,#0x00
   7389                     263 00104$:
   7389 C6 06         [ 7]  264 	add	a, #0x06
   738B DD 77 FD      [19]  265 	ld	-3 (ix),a
                            266 ;src/main.c:116: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   738E FD 2A 0F 73   [20]  267 	ld	iy,(_mapa)
   7392 16 00         [ 7]  268 	ld	d,#0x00
   7394 7B            [ 4]  269 	ld	a,e
   7395 C6 E8         [ 7]  270 	add	a,#0xE8
   7397 DD 77 FE      [19]  271 	ld	-2 (ix),a
   739A 7A            [ 4]  272 	ld	a,d
   739B CE FF         [ 7]  273 	adc	a,#0xFF
   739D DD 77 FF      [19]  274 	ld	-1 (ix),a
   73A0 DD 6E FE      [19]  275 	ld	l,-2 (ix)
   73A3 DD 66 FF      [19]  276 	ld	h,-1 (ix)
   73A6 DD CB FF 7E   [20]  277 	bit	7, -1 (ix)
   73AA 28 04         [12]  278 	jr	Z,00105$
   73AC 21 EB FF      [10]  279 	ld	hl,#0xFFEB
   73AF 19            [11]  280 	add	hl,de
   73B0                     281 00105$:
   73B0 CB 2C         [ 8]  282 	sra	h
   73B2 CB 1D         [ 8]  283 	rr	l
   73B4 CB 2C         [ 8]  284 	sra	h
   73B6 CB 1D         [ 8]  285 	rr	l
   73B8 55            [ 4]  286 	ld	d,l
   73B9 CB 39         [ 8]  287 	srl	c
   73BB FD E5         [15]  288 	push	iy
   73BD 21 F0 C0      [10]  289 	ld	hl,#0xC0F0
   73C0 E5            [11]  290 	push	hl
   73C1 3E 28         [ 7]  291 	ld	a,#0x28
   73C3 F5            [11]  292 	push	af
   73C4 33            [ 6]  293 	inc	sp
   73C5 DD 7E FD      [19]  294 	ld	a,-3 (ix)
   73C8 F5            [11]  295 	push	af
   73C9 33            [ 6]  296 	inc	sp
   73CA C5            [11]  297 	push	bc
   73CB 33            [ 6]  298 	inc	sp
   73CC D5            [11]  299 	push	de
   73CD 33            [ 6]  300 	inc	sp
   73CE 79            [ 4]  301 	ld	a,c
   73CF F5            [11]  302 	push	af
   73D0 33            [ 6]  303 	inc	sp
   73D1 CD 9E 59      [17]  304 	call	_cpct_etm_drawTileBox2x4
   73D4 DD F9         [10]  305 	ld	sp, ix
   73D6 DD E1         [14]  306 	pop	ix
   73D8 C9            [10]  307 	ret
                            308 ;src/main.c:119: void redibujarProta() {
                            309 ;	---------------------------------
                            310 ; Function redibujarProta
                            311 ; ---------------------------------
   73D9                     312 _redibujarProta::
                            313 ;src/main.c:120: borrarProta();
   73D9 CD 65 73      [17]  314 	call	_borrarProta
                            315 ;src/main.c:121: prota.px = prota.x;
   73DC 01 59 6A      [10]  316 	ld	bc,#_prota + 2
   73DF 3A 57 6A      [13]  317 	ld	a, (#_prota + 0)
   73E2 02            [ 7]  318 	ld	(bc),a
                            319 ;src/main.c:122: prota.py = prota.y;
   73E3 01 5A 6A      [10]  320 	ld	bc,#_prota + 3
   73E6 3A 58 6A      [13]  321 	ld	a, (#_prota + 1)
   73E9 02            [ 7]  322 	ld	(bc),a
                            323 ;src/main.c:123: dibujarProta();
   73EA C3 3F 73      [10]  324 	jp  _dibujarProta
                            325 ;src/main.c:126: void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
                            326 ;	---------------------------------
                            327 ; Function comprobarTeclado
                            328 ; ---------------------------------
   73ED                     329 _comprobarTeclado::
                            330 ;src/main.c:127: cpct_scanKeyboard_if();
   73ED CD F6 5A      [17]  331 	call	_cpct_scanKeyboard_if
                            332 ;src/main.c:129: if (cpct_isAnyKeyPressed()) {
   73F0 CD E9 5A      [17]  333 	call	_cpct_isAnyKeyPressed
   73F3 7D            [ 4]  334 	ld	a,l
   73F4 B7            [ 4]  335 	or	a, a
   73F5 C8            [11]  336 	ret	Z
                            337 ;src/main.c:130: if (cpct_isKeyPressed(Key_CursorLeft))
   73F6 21 01 01      [10]  338 	ld	hl,#0x0101
   73F9 CD BD 58      [17]  339 	call	_cpct_isKeyPressed
   73FC 7D            [ 4]  340 	ld	a,l
   73FD B7            [ 4]  341 	or	a, a
                            342 ;src/main.c:131: moverIzquierda();
   73FE C2 B0 88      [10]  343 	jp	NZ,_moverIzquierda
                            344 ;src/main.c:132: else if (cpct_isKeyPressed(Key_CursorRight))
   7401 21 00 02      [10]  345 	ld	hl,#0x0200
   7404 CD BD 58      [17]  346 	call	_cpct_isKeyPressed
   7407 7D            [ 4]  347 	ld	a,l
   7408 B7            [ 4]  348 	or	a, a
                            349 ;src/main.c:133: moverDerecha();
   7409 C2 D5 88      [10]  350 	jp	NZ,_moverDerecha
                            351 ;src/main.c:134: else if (cpct_isKeyPressed(Key_CursorUp))
   740C 21 00 01      [10]  352 	ld	hl,#0x0100
   740F CD BD 58      [17]  353 	call	_cpct_isKeyPressed
   7412 7D            [ 4]  354 	ld	a,l
   7413 B7            [ 4]  355 	or	a, a
                            356 ;src/main.c:135: moverArriba();
   7414 C2 1A 89      [10]  357 	jp	NZ,_moverArriba
                            358 ;src/main.c:136: else if (cpct_isKeyPressed(Key_CursorDown))
   7417 21 00 04      [10]  359 	ld	hl,#0x0400
   741A CD BD 58      [17]  360 	call	_cpct_isKeyPressed
   741D 7D            [ 4]  361 	ld	a,l
   741E B7            [ 4]  362 	or	a, a
                            363 ;src/main.c:137: moverAbajo();
   741F C2 3E 89      [10]  364 	jp	NZ,_moverAbajo
                            365 ;src/main.c:138: else if (cpct_isKeyPressed(Key_Space))
   7422 21 05 80      [10]  366 	ld	hl,#0x8005
   7425 CD BD 58      [17]  367 	call	_cpct_isKeyPressed
   7428 7D            [ 4]  368 	ld	a,l
   7429 B7            [ 4]  369 	or	a, a
   742A C8            [11]  370 	ret	Z
                            371 ;src/main.c:139: lanzarCuchillo(cu, prota, mapa, g_tablatrans);
   742B 21 08 00      [10]  372 	ld	hl, #8
   742E 39            [11]  373 	add	hl, sp
   742F 4E            [ 7]  374 	ld	c, (hl)
   7430 23            [ 6]  375 	inc	hl
   7431 46            [ 7]  376 	ld	b, (hl)
   7432 C5            [11]  377 	push	bc
   7433 21 08 00      [10]  378 	ld	hl, #8
   7436 39            [11]  379 	add	hl, sp
   7437 4E            [ 7]  380 	ld	c, (hl)
   7438 23            [ 6]  381 	inc	hl
   7439 46            [ 7]  382 	ld	b, (hl)
   743A C5            [11]  383 	push	bc
   743B 21 08 00      [10]  384 	ld	hl, #8
   743E 39            [11]  385 	add	hl, sp
   743F 4E            [ 7]  386 	ld	c, (hl)
   7440 23            [ 6]  387 	inc	hl
   7441 46            [ 7]  388 	ld	b, (hl)
   7442 C5            [11]  389 	push	bc
   7443 21 08 00      [10]  390 	ld	hl, #8
   7446 39            [11]  391 	add	hl, sp
   7447 4E            [ 7]  392 	ld	c, (hl)
   7448 23            [ 6]  393 	inc	hl
   7449 46            [ 7]  394 	ld	b, (hl)
   744A C5            [11]  395 	push	bc
   744B CD 52 4C      [17]  396 	call	_lanzarCuchillo
   744E 21 08 00      [10]  397 	ld	hl,#8
   7451 39            [11]  398 	add	hl,sp
   7452 F9            [ 6]  399 	ld	sp,hl
   7453 C9            [10]  400 	ret
                            401 ;src/main.c:143: u8 checkCollision(u8 direction) { // check optimization
                            402 ;	---------------------------------
                            403 ; Function checkCollision
                            404 ; ---------------------------------
   7454                     405 _checkCollision::
   7454 DD E5         [15]  406 	push	ix
   7456 DD 21 00 00   [14]  407 	ld	ix,#0
   745A DD 39         [15]  408 	add	ix,sp
   745C F5            [11]  409 	push	af
                            410 ;src/main.c:144: u8 *headTile=0, *feetTile=0, *waistTile=0;
   745D 21 00 00      [10]  411 	ld	hl,#0x0000
   7460 E3            [19]  412 	ex	(sp), hl
   7461 11 00 00      [10]  413 	ld	de,#0x0000
   7464 01 00 00      [10]  414 	ld	bc,#0x0000
                            415 ;src/main.c:146: switch (direction) {
   7467 3E 03         [ 7]  416 	ld	a,#0x03
   7469 DD 96 04      [19]  417 	sub	a, 4 (ix)
   746C DA A8 75      [10]  418 	jp	C,00105$
   746F DD 5E 04      [19]  419 	ld	e,4 (ix)
   7472 16 00         [ 7]  420 	ld	d,#0x00
   7474 21 7B 74      [10]  421 	ld	hl,#00124$
   7477 19            [11]  422 	add	hl,de
   7478 19            [11]  423 	add	hl,de
   7479 19            [11]  424 	add	hl,de
   747A E9            [ 4]  425 	jp	(hl)
   747B                     426 00124$:
   747B C3 87 74      [10]  427 	jp	00101$
   747E C3 E0 74      [10]  428 	jp	00102$
   7481 C3 30 75      [10]  429 	jp	00103$
   7484 C3 6D 75      [10]  430 	jp	00104$
                            431 ;src/main.c:147: case 0:
   7487                     432 00101$:
                            433 ;src/main.c:148: headTile  = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y);
   7487 21 58 6A      [10]  434 	ld	hl, #(_prota + 0x0001) + 0
   748A 4E            [ 7]  435 	ld	c,(hl)
   748B 3A 57 6A      [13]  436 	ld	a, (#_prota + 0)
   748E 47            [ 4]  437 	ld	b,a
   748F 04            [ 4]  438 	inc	b
   7490 04            [ 4]  439 	inc	b
   7491 04            [ 4]  440 	inc	b
   7492 04            [ 4]  441 	inc	b
   7493 79            [ 4]  442 	ld	a,c
   7494 F5            [11]  443 	push	af
   7495 33            [ 6]  444 	inc	sp
   7496 C5            [11]  445 	push	bc
   7497 33            [ 6]  446 	inc	sp
   7498 2A 0F 73      [16]  447 	ld	hl,(_mapa)
   749B E5            [11]  448 	push	hl
   749C CD D3 4F      [17]  449 	call	_getTilePtr
   749F F1            [10]  450 	pop	af
   74A0 F1            [10]  451 	pop	af
   74A1 33            [ 6]  452 	inc	sp
   74A2 33            [ 6]  453 	inc	sp
   74A3 E5            [11]  454 	push	hl
                            455 ;src/main.c:149: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   74A4 3A 58 6A      [13]  456 	ld	a, (#(_prota + 0x0001) + 0)
   74A7 C6 14         [ 7]  457 	add	a, #0x14
   74A9 4F            [ 4]  458 	ld	c,a
   74AA 21 57 6A      [10]  459 	ld	hl, #_prota + 0
   74AD 46            [ 7]  460 	ld	b,(hl)
   74AE 04            [ 4]  461 	inc	b
   74AF 04            [ 4]  462 	inc	b
   74B0 04            [ 4]  463 	inc	b
   74B1 04            [ 4]  464 	inc	b
   74B2 79            [ 4]  465 	ld	a,c
   74B3 F5            [11]  466 	push	af
   74B4 33            [ 6]  467 	inc	sp
   74B5 C5            [11]  468 	push	bc
   74B6 33            [ 6]  469 	inc	sp
   74B7 2A 0F 73      [16]  470 	ld	hl,(_mapa)
   74BA E5            [11]  471 	push	hl
   74BB CD D3 4F      [17]  472 	call	_getTilePtr
   74BE F1            [10]  473 	pop	af
   74BF F1            [10]  474 	pop	af
   74C0 EB            [ 4]  475 	ex	de,hl
                            476 ;src/main.c:150: waistTile = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   74C1 3A 58 6A      [13]  477 	ld	a, (#(_prota + 0x0001) + 0)
   74C4 C6 0B         [ 7]  478 	add	a, #0x0B
   74C6 47            [ 4]  479 	ld	b,a
   74C7 3A 57 6A      [13]  480 	ld	a, (#_prota + 0)
   74CA C6 04         [ 7]  481 	add	a, #0x04
   74CC D5            [11]  482 	push	de
   74CD C5            [11]  483 	push	bc
   74CE 33            [ 6]  484 	inc	sp
   74CF F5            [11]  485 	push	af
   74D0 33            [ 6]  486 	inc	sp
   74D1 2A 0F 73      [16]  487 	ld	hl,(_mapa)
   74D4 E5            [11]  488 	push	hl
   74D5 CD D3 4F      [17]  489 	call	_getTilePtr
   74D8 F1            [10]  490 	pop	af
   74D9 F1            [10]  491 	pop	af
   74DA 4D            [ 4]  492 	ld	c,l
   74DB 44            [ 4]  493 	ld	b,h
   74DC D1            [10]  494 	pop	de
                            495 ;src/main.c:151: break;
   74DD C3 A8 75      [10]  496 	jp	00105$
                            497 ;src/main.c:152: case 1:
   74E0                     498 00102$:
                            499 ;src/main.c:153: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
   74E0 21 58 6A      [10]  500 	ld	hl, #(_prota + 0x0001) + 0
   74E3 56            [ 7]  501 	ld	d,(hl)
   74E4 21 57 6A      [10]  502 	ld	hl, #_prota + 0
   74E7 46            [ 7]  503 	ld	b,(hl)
   74E8 05            [ 4]  504 	dec	b
   74E9 D5            [11]  505 	push	de
   74EA 33            [ 6]  506 	inc	sp
   74EB C5            [11]  507 	push	bc
   74EC 33            [ 6]  508 	inc	sp
   74ED 2A 0F 73      [16]  509 	ld	hl,(_mapa)
   74F0 E5            [11]  510 	push	hl
   74F1 CD D3 4F      [17]  511 	call	_getTilePtr
   74F4 F1            [10]  512 	pop	af
   74F5 F1            [10]  513 	pop	af
   74F6 33            [ 6]  514 	inc	sp
   74F7 33            [ 6]  515 	inc	sp
   74F8 E5            [11]  516 	push	hl
                            517 ;src/main.c:154: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
   74F9 3A 58 6A      [13]  518 	ld	a, (#(_prota + 0x0001) + 0)
   74FC C6 14         [ 7]  519 	add	a, #0x14
   74FE 57            [ 4]  520 	ld	d,a
   74FF 21 57 6A      [10]  521 	ld	hl, #_prota + 0
   7502 46            [ 7]  522 	ld	b,(hl)
   7503 05            [ 4]  523 	dec	b
   7504 D5            [11]  524 	push	de
   7505 33            [ 6]  525 	inc	sp
   7506 C5            [11]  526 	push	bc
   7507 33            [ 6]  527 	inc	sp
   7508 2A 0F 73      [16]  528 	ld	hl,(_mapa)
   750B E5            [11]  529 	push	hl
   750C CD D3 4F      [17]  530 	call	_getTilePtr
   750F F1            [10]  531 	pop	af
   7510 F1            [10]  532 	pop	af
   7511 EB            [ 4]  533 	ex	de,hl
                            534 ;src/main.c:155: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
   7512 3A 58 6A      [13]  535 	ld	a, (#(_prota + 0x0001) + 0)
   7515 C6 0B         [ 7]  536 	add	a, #0x0B
   7517 47            [ 4]  537 	ld	b,a
   7518 3A 57 6A      [13]  538 	ld	a, (#_prota + 0)
   751B C6 FF         [ 7]  539 	add	a,#0xFF
   751D D5            [11]  540 	push	de
   751E C5            [11]  541 	push	bc
   751F 33            [ 6]  542 	inc	sp
   7520 F5            [11]  543 	push	af
   7521 33            [ 6]  544 	inc	sp
   7522 2A 0F 73      [16]  545 	ld	hl,(_mapa)
   7525 E5            [11]  546 	push	hl
   7526 CD D3 4F      [17]  547 	call	_getTilePtr
   7529 F1            [10]  548 	pop	af
   752A F1            [10]  549 	pop	af
   752B 4D            [ 4]  550 	ld	c,l
   752C 44            [ 4]  551 	ld	b,h
   752D D1            [10]  552 	pop	de
                            553 ;src/main.c:156: break;
   752E 18 78         [12]  554 	jr	00105$
                            555 ;src/main.c:157: case 2:
   7530                     556 00103$:
                            557 ;src/main.c:158: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
   7530 3A 58 6A      [13]  558 	ld	a, (#(_prota + 0x0001) + 0)
   7533 C6 FE         [ 7]  559 	add	a,#0xFE
   7535 21 57 6A      [10]  560 	ld	hl, #_prota + 0
   7538 56            [ 7]  561 	ld	d,(hl)
   7539 C5            [11]  562 	push	bc
   753A F5            [11]  563 	push	af
   753B 33            [ 6]  564 	inc	sp
   753C D5            [11]  565 	push	de
   753D 33            [ 6]  566 	inc	sp
   753E 2A 0F 73      [16]  567 	ld	hl,(_mapa)
   7541 E5            [11]  568 	push	hl
   7542 CD D3 4F      [17]  569 	call	_getTilePtr
   7545 F1            [10]  570 	pop	af
   7546 F1            [10]  571 	pop	af
   7547 C1            [10]  572 	pop	bc
   7548 33            [ 6]  573 	inc	sp
   7549 33            [ 6]  574 	inc	sp
   754A E5            [11]  575 	push	hl
                            576 ;src/main.c:159: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
   754B 21 58 6A      [10]  577 	ld	hl, #(_prota + 0x0001) + 0
   754E 56            [ 7]  578 	ld	d,(hl)
   754F 15            [ 4]  579 	dec	d
   7550 15            [ 4]  580 	dec	d
   7551 3A 57 6A      [13]  581 	ld	a, (#_prota + 0)
   7554 C6 03         [ 7]  582 	add	a, #0x03
   7556 C5            [11]  583 	push	bc
   7557 D5            [11]  584 	push	de
   7558 33            [ 6]  585 	inc	sp
   7559 F5            [11]  586 	push	af
   755A 33            [ 6]  587 	inc	sp
   755B 2A 0F 73      [16]  588 	ld	hl,(_mapa)
   755E E5            [11]  589 	push	hl
   755F CD D3 4F      [17]  590 	call	_getTilePtr
   7562 F1            [10]  591 	pop	af
   7563 F1            [10]  592 	pop	af
   7564 EB            [ 4]  593 	ex	de,hl
   7565 C1            [10]  594 	pop	bc
                            595 ;src/main.c:160: *waistTile = 0;
   7566 21 00 00      [10]  596 	ld	hl,#0x0000
   7569 36 00         [10]  597 	ld	(hl),#0x00
                            598 ;src/main.c:161: break;
   756B 18 3B         [12]  599 	jr	00105$
                            600 ;src/main.c:162: case 3:
   756D                     601 00104$:
                            602 ;src/main.c:163: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
   756D 3A 58 6A      [13]  603 	ld	a, (#(_prota + 0x0001) + 0)
   7570 C6 16         [ 7]  604 	add	a, #0x16
   7572 21 57 6A      [10]  605 	ld	hl, #_prota + 0
   7575 56            [ 7]  606 	ld	d,(hl)
   7576 C5            [11]  607 	push	bc
   7577 F5            [11]  608 	push	af
   7578 33            [ 6]  609 	inc	sp
   7579 D5            [11]  610 	push	de
   757A 33            [ 6]  611 	inc	sp
   757B 2A 0F 73      [16]  612 	ld	hl,(_mapa)
   757E E5            [11]  613 	push	hl
   757F CD D3 4F      [17]  614 	call	_getTilePtr
   7582 F1            [10]  615 	pop	af
   7583 F1            [10]  616 	pop	af
   7584 C1            [10]  617 	pop	bc
   7585 33            [ 6]  618 	inc	sp
   7586 33            [ 6]  619 	inc	sp
   7587 E5            [11]  620 	push	hl
                            621 ;src/main.c:164: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   7588 3A 58 6A      [13]  622 	ld	a, (#(_prota + 0x0001) + 0)
   758B C6 16         [ 7]  623 	add	a, #0x16
   758D 57            [ 4]  624 	ld	d,a
   758E 3A 57 6A      [13]  625 	ld	a, (#_prota + 0)
   7591 C6 03         [ 7]  626 	add	a, #0x03
   7593 C5            [11]  627 	push	bc
   7594 D5            [11]  628 	push	de
   7595 33            [ 6]  629 	inc	sp
   7596 F5            [11]  630 	push	af
   7597 33            [ 6]  631 	inc	sp
   7598 2A 0F 73      [16]  632 	ld	hl,(_mapa)
   759B E5            [11]  633 	push	hl
   759C CD D3 4F      [17]  634 	call	_getTilePtr
   759F F1            [10]  635 	pop	af
   75A0 F1            [10]  636 	pop	af
   75A1 EB            [ 4]  637 	ex	de,hl
   75A2 C1            [10]  638 	pop	bc
                            639 ;src/main.c:165: *waistTile = 0;
   75A3 21 00 00      [10]  640 	ld	hl,#0x0000
   75A6 36 00         [10]  641 	ld	(hl),#0x00
                            642 ;src/main.c:167: }
   75A8                     643 00105$:
                            644 ;src/main.c:169: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   75A8 E1            [10]  645 	pop	hl
   75A9 E5            [11]  646 	push	hl
   75AA 6E            [ 7]  647 	ld	l,(hl)
   75AB 3E 02         [ 7]  648 	ld	a,#0x02
   75AD 95            [ 4]  649 	sub	a, l
   75AE 38 0E         [12]  650 	jr	C,00106$
   75B0 1A            [ 7]  651 	ld	a,(de)
   75B1 5F            [ 4]  652 	ld	e,a
   75B2 3E 02         [ 7]  653 	ld	a,#0x02
   75B4 93            [ 4]  654 	sub	a, e
   75B5 38 07         [12]  655 	jr	C,00106$
   75B7 0A            [ 7]  656 	ld	a,(bc)
   75B8 4F            [ 4]  657 	ld	c,a
   75B9 3E 02         [ 7]  658 	ld	a,#0x02
   75BB 91            [ 4]  659 	sub	a, c
   75BC 30 04         [12]  660 	jr	NC,00107$
   75BE                     661 00106$:
                            662 ;src/main.c:170: return 1;
   75BE 2E 01         [ 7]  663 	ld	l,#0x01
   75C0 18 02         [12]  664 	jr	00110$
   75C2                     665 00107$:
                            666 ;src/main.c:172: return 0;
   75C2 2E 00         [ 7]  667 	ld	l,#0x00
   75C4                     668 00110$:
   75C4 DD F9         [10]  669 	ld	sp, ix
   75C6 DD E1         [14]  670 	pop	ix
   75C8 C9            [10]  671 	ret
                            672 ;src/main.c:175: void dibujarEnemigo(TEnemy *enemy) {
                            673 ;	---------------------------------
                            674 ; Function dibujarEnemigo
                            675 ; ---------------------------------
   75C9                     676 _dibujarEnemigo::
   75C9 DD E5         [15]  677 	push	ix
   75CB DD 21 00 00   [14]  678 	ld	ix,#0
   75CF DD 39         [15]  679 	add	ix,sp
                            680 ;src/main.c:176: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   75D1 DD 4E 04      [19]  681 	ld	c,4 (ix)
   75D4 DD 46 05      [19]  682 	ld	b,5 (ix)
   75D7 69            [ 4]  683 	ld	l, c
   75D8 60            [ 4]  684 	ld	h, b
   75D9 23            [ 6]  685 	inc	hl
   75DA 56            [ 7]  686 	ld	d,(hl)
   75DB 0A            [ 7]  687 	ld	a,(bc)
   75DC C5            [11]  688 	push	bc
   75DD D5            [11]  689 	push	de
   75DE 33            [ 6]  690 	inc	sp
   75DF F5            [11]  691 	push	af
   75E0 33            [ 6]  692 	inc	sp
   75E1 21 00 C0      [10]  693 	ld	hl,#0xC000
   75E4 E5            [11]  694 	push	hl
   75E5 CD BC 64      [17]  695 	call	_cpct_getScreenPtr
   75E8 EB            [ 4]  696 	ex	de,hl
                            697 ;src/main.c:177: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   75E9 E1            [10]  698 	pop	hl
   75EA 01 04 00      [10]  699 	ld	bc, #0x0004
   75ED 09            [11]  700 	add	hl, bc
   75EE 4E            [ 7]  701 	ld	c,(hl)
   75EF 23            [ 6]  702 	inc	hl
   75F0 46            [ 7]  703 	ld	b,(hl)
   75F1 21 00 01      [10]  704 	ld	hl,#_g_tablatrans
   75F4 E5            [11]  705 	push	hl
   75F5 21 04 16      [10]  706 	ld	hl,#0x1604
   75F8 E5            [11]  707 	push	hl
   75F9 D5            [11]  708 	push	de
   75FA C5            [11]  709 	push	bc
   75FB CD DC 64      [17]  710 	call	_cpct_drawSpriteMaskedAlignedTable
   75FE DD E1         [14]  711 	pop	ix
   7600 C9            [10]  712 	ret
                            713 ;src/main.c:180: void dibujarExplosion(TEnemy *enemy) {
                            714 ;	---------------------------------
                            715 ; Function dibujarExplosion
                            716 ; ---------------------------------
   7601                     717 _dibujarExplosion::
   7601 DD E5         [15]  718 	push	ix
   7603 DD 21 00 00   [14]  719 	ld	ix,#0
   7607 DD 39         [15]  720 	add	ix,sp
                            721 ;src/main.c:181: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   7609 DD 4E 04      [19]  722 	ld	c,4 (ix)
   760C DD 46 05      [19]  723 	ld	b,5 (ix)
   760F 69            [ 4]  724 	ld	l, c
   7610 60            [ 4]  725 	ld	h, b
   7611 23            [ 6]  726 	inc	hl
   7612 56            [ 7]  727 	ld	d,(hl)
   7613 0A            [ 7]  728 	ld	a,(bc)
   7614 47            [ 4]  729 	ld	b,a
   7615 D5            [11]  730 	push	de
   7616 33            [ 6]  731 	inc	sp
   7617 C5            [11]  732 	push	bc
   7618 33            [ 6]  733 	inc	sp
   7619 21 00 C0      [10]  734 	ld	hl,#0xC000
   761C E5            [11]  735 	push	hl
   761D CD BC 64      [17]  736 	call	_cpct_getScreenPtr
   7620 4D            [ 4]  737 	ld	c,l
   7621 44            [ 4]  738 	ld	b,h
                            739 ;src/main.c:182: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   7622 11 00 01      [10]  740 	ld	de,#_g_tablatrans+0
   7625 D5            [11]  741 	push	de
   7626 21 04 16      [10]  742 	ld	hl,#0x1604
   7629 E5            [11]  743 	push	hl
   762A C5            [11]  744 	push	bc
   762B 21 70 19      [10]  745 	ld	hl,#_g_explosion
   762E E5            [11]  746 	push	hl
   762F CD DC 64      [17]  747 	call	_cpct_drawSpriteMaskedAlignedTable
   7632 DD E1         [14]  748 	pop	ix
   7634 C9            [10]  749 	ret
                            750 ;src/main.c:185: void borrarExplosion() {
                            751 ;	---------------------------------
                            752 ; Function borrarExplosion
                            753 ; ---------------------------------
   7635                     754 _borrarExplosion::
   7635 DD E5         [15]  755 	push	ix
   7637 DD 21 00 00   [14]  756 	ld	ix,#0
   763B DD 39         [15]  757 	add	ix,sp
   763D F5            [11]  758 	push	af
   763E 3B            [ 6]  759 	dec	sp
                            760 ;src/main.c:188: u8 w = 4 + (enemy->px & 1);
   763F 21 41 65      [10]  761 	ld	hl, #_enemy + 2
   7642 4E            [ 7]  762 	ld	c,(hl)
   7643 79            [ 4]  763 	ld	a,c
   7644 E6 01         [ 7]  764 	and	a, #0x01
   7646 47            [ 4]  765 	ld	b,a
   7647 04            [ 4]  766 	inc	b
   7648 04            [ 4]  767 	inc	b
   7649 04            [ 4]  768 	inc	b
   764A 04            [ 4]  769 	inc	b
                            770 ;src/main.c:191: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   764B 21 42 65      [10]  771 	ld	hl, #_enemy + 3
   764E 5E            [ 7]  772 	ld	e,(hl)
   764F CB 4B         [ 8]  773 	bit	1, e
   7651 28 04         [12]  774 	jr	Z,00103$
   7653 3E 01         [ 7]  775 	ld	a,#0x01
   7655 18 02         [12]  776 	jr	00104$
   7657                     777 00103$:
   7657 3E 00         [ 7]  778 	ld	a,#0x00
   7659                     779 00104$:
   7659 C6 07         [ 7]  780 	add	a, #0x07
   765B DD 77 FD      [19]  781 	ld	-3 (ix),a
                            782 ;src/main.c:193: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   765E FD 2A 0F 73   [20]  783 	ld	iy,(_mapa)
   7662 16 00         [ 7]  784 	ld	d,#0x00
   7664 7B            [ 4]  785 	ld	a,e
   7665 C6 E8         [ 7]  786 	add	a,#0xE8
   7667 DD 77 FE      [19]  787 	ld	-2 (ix),a
   766A 7A            [ 4]  788 	ld	a,d
   766B CE FF         [ 7]  789 	adc	a,#0xFF
   766D DD 77 FF      [19]  790 	ld	-1 (ix),a
   7670 DD 6E FE      [19]  791 	ld	l,-2 (ix)
   7673 DD 66 FF      [19]  792 	ld	h,-1 (ix)
   7676 DD CB FF 7E   [20]  793 	bit	7, -1 (ix)
   767A 28 04         [12]  794 	jr	Z,00105$
   767C 21 EB FF      [10]  795 	ld	hl,#0xFFEB
   767F 19            [11]  796 	add	hl,de
   7680                     797 00105$:
   7680 CB 2C         [ 8]  798 	sra	h
   7682 CB 1D         [ 8]  799 	rr	l
   7684 CB 2C         [ 8]  800 	sra	h
   7686 CB 1D         [ 8]  801 	rr	l
   7688 55            [ 4]  802 	ld	d,l
   7689 CB 39         [ 8]  803 	srl	c
   768B FD E5         [15]  804 	push	iy
   768D 21 F0 C0      [10]  805 	ld	hl,#0xC0F0
   7690 E5            [11]  806 	push	hl
   7691 3E 28         [ 7]  807 	ld	a,#0x28
   7693 F5            [11]  808 	push	af
   7694 33            [ 6]  809 	inc	sp
   7695 DD 7E FD      [19]  810 	ld	a,-3 (ix)
   7698 F5            [11]  811 	push	af
   7699 33            [ 6]  812 	inc	sp
   769A C5            [11]  813 	push	bc
   769B 33            [ 6]  814 	inc	sp
   769C D5            [11]  815 	push	de
   769D 33            [ 6]  816 	inc	sp
   769E 79            [ 4]  817 	ld	a,c
   769F F5            [11]  818 	push	af
   76A0 33            [ 6]  819 	inc	sp
   76A1 CD 9E 59      [17]  820 	call	_cpct_etm_drawTileBox2x4
   76A4 DD F9         [10]  821 	ld	sp, ix
   76A6 DD E1         [14]  822 	pop	ix
   76A8 C9            [10]  823 	ret
                            824 ;src/main.c:197: void borrarEnemigo(TEnemy *enemy) {
                            825 ;	---------------------------------
                            826 ; Function borrarEnemigo
                            827 ; ---------------------------------
   76A9                     828 _borrarEnemigo::
   76A9 DD E5         [15]  829 	push	ix
   76AB DD 21 00 00   [14]  830 	ld	ix,#0
   76AF DD 39         [15]  831 	add	ix,sp
   76B1 21 FA FF      [10]  832 	ld	hl,#-6
   76B4 39            [11]  833 	add	hl,sp
   76B5 F9            [ 6]  834 	ld	sp,hl
                            835 ;src/main.c:201: u8 w = 4 + (enemy->px & 1);
   76B6 DD 4E 04      [19]  836 	ld	c,4 (ix)
   76B9 DD 46 05      [19]  837 	ld	b,5 (ix)
   76BC 69            [ 4]  838 	ld	l, c
   76BD 60            [ 4]  839 	ld	h, b
   76BE 23            [ 6]  840 	inc	hl
   76BF 23            [ 6]  841 	inc	hl
   76C0 5E            [ 7]  842 	ld	e,(hl)
   76C1 7B            [ 4]  843 	ld	a,e
   76C2 E6 01         [ 7]  844 	and	a, #0x01
   76C4 C6 04         [ 7]  845 	add	a, #0x04
   76C6 DD 77 FB      [19]  846 	ld	-5 (ix),a
                            847 ;src/main.c:204: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   76C9 69            [ 4]  848 	ld	l, c
   76CA 60            [ 4]  849 	ld	h, b
   76CB 23            [ 6]  850 	inc	hl
   76CC 23            [ 6]  851 	inc	hl
   76CD 23            [ 6]  852 	inc	hl
   76CE 56            [ 7]  853 	ld	d,(hl)
   76CF CB 4A         [ 8]  854 	bit	1, d
   76D1 28 04         [12]  855 	jr	Z,00103$
   76D3 3E 01         [ 7]  856 	ld	a,#0x01
   76D5 18 02         [12]  857 	jr	00104$
   76D7                     858 00103$:
   76D7 3E 00         [ 7]  859 	ld	a,#0x00
   76D9                     860 00104$:
   76D9 C6 07         [ 7]  861 	add	a, #0x07
   76DB DD 77 FA      [19]  862 	ld	-6 (ix),a
                            863 ;src/main.c:206: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   76DE FD 2A 0F 73   [20]  864 	ld	iy,(_mapa)
   76E2 DD 72 FE      [19]  865 	ld	-2 (ix),d
   76E5 DD 36 FF 00   [19]  866 	ld	-1 (ix),#0x00
   76E9 DD 7E FE      [19]  867 	ld	a,-2 (ix)
   76EC C6 E8         [ 7]  868 	add	a,#0xE8
   76EE DD 77 FC      [19]  869 	ld	-4 (ix),a
   76F1 DD 7E FF      [19]  870 	ld	a,-1 (ix)
   76F4 CE FF         [ 7]  871 	adc	a,#0xFF
   76F6 DD 77 FD      [19]  872 	ld	-3 (ix),a
   76F9 DD 56 FC      [19]  873 	ld	d,-4 (ix)
   76FC DD 6E FD      [19]  874 	ld	l,-3 (ix)
   76FF DD CB FD 7E   [20]  875 	bit	7, -3 (ix)
   7703 28 0C         [12]  876 	jr	Z,00105$
   7705 DD 7E FE      [19]  877 	ld	a,-2 (ix)
   7708 C6 EB         [ 7]  878 	add	a, #0xEB
   770A 57            [ 4]  879 	ld	d,a
   770B DD 7E FF      [19]  880 	ld	a,-1 (ix)
   770E CE FF         [ 7]  881 	adc	a, #0xFF
   7710 6F            [ 4]  882 	ld	l,a
   7711                     883 00105$:
   7711 CB 2D         [ 8]  884 	sra	l
   7713 CB 1A         [ 8]  885 	rr	d
   7715 CB 2D         [ 8]  886 	sra	l
   7717 CB 1A         [ 8]  887 	rr	d
   7719 CB 3B         [ 8]  888 	srl	e
   771B C5            [11]  889 	push	bc
   771C FD E5         [15]  890 	push	iy
   771E 21 F0 C0      [10]  891 	ld	hl,#0xC0F0
   7721 E5            [11]  892 	push	hl
   7722 3E 28         [ 7]  893 	ld	a,#0x28
   7724 F5            [11]  894 	push	af
   7725 33            [ 6]  895 	inc	sp
   7726 DD 66 FA      [19]  896 	ld	h,-6 (ix)
   7729 DD 6E FB      [19]  897 	ld	l,-5 (ix)
   772C E5            [11]  898 	push	hl
   772D D5            [11]  899 	push	de
   772E CD 9E 59      [17]  900 	call	_cpct_etm_drawTileBox2x4
   7731 C1            [10]  901 	pop	bc
                            902 ;src/main.c:208: enemy->mover = NO;
   7732 21 06 00      [10]  903 	ld	hl,#0x0006
   7735 09            [11]  904 	add	hl,bc
   7736 36 00         [10]  905 	ld	(hl),#0x00
   7738 DD F9         [10]  906 	ld	sp, ix
   773A DD E1         [14]  907 	pop	ix
   773C C9            [10]  908 	ret
                            909 ;src/main.c:211: void redibujarEnemigo(TEnemy *enemy) {
                            910 ;	---------------------------------
                            911 ; Function redibujarEnemigo
                            912 ; ---------------------------------
   773D                     913 _redibujarEnemigo::
   773D DD E5         [15]  914 	push	ix
   773F DD 21 00 00   [14]  915 	ld	ix,#0
   7743 DD 39         [15]  916 	add	ix,sp
                            917 ;src/main.c:212: borrarEnemigo(enemy);
   7745 DD 6E 04      [19]  918 	ld	l,4 (ix)
   7748 DD 66 05      [19]  919 	ld	h,5 (ix)
   774B E5            [11]  920 	push	hl
   774C CD A9 76      [17]  921 	call	_borrarEnemigo
   774F F1            [10]  922 	pop	af
                            923 ;src/main.c:213: enemy->px = enemy->x;
   7750 DD 4E 04      [19]  924 	ld	c,4 (ix)
   7753 DD 46 05      [19]  925 	ld	b,5 (ix)
   7756 59            [ 4]  926 	ld	e, c
   7757 50            [ 4]  927 	ld	d, b
   7758 13            [ 6]  928 	inc	de
   7759 13            [ 6]  929 	inc	de
   775A 0A            [ 7]  930 	ld	a,(bc)
   775B 12            [ 7]  931 	ld	(de),a
                            932 ;src/main.c:214: enemy->py = enemy->y;
   775C 59            [ 4]  933 	ld	e, c
   775D 50            [ 4]  934 	ld	d, b
   775E 13            [ 6]  935 	inc	de
   775F 13            [ 6]  936 	inc	de
   7760 13            [ 6]  937 	inc	de
   7761 69            [ 4]  938 	ld	l, c
   7762 60            [ 4]  939 	ld	h, b
   7763 23            [ 6]  940 	inc	hl
   7764 7E            [ 7]  941 	ld	a,(hl)
   7765 12            [ 7]  942 	ld	(de),a
                            943 ;src/main.c:215: dibujarEnemigo(enemy);
   7766 C5            [11]  944 	push	bc
   7767 CD C9 75      [17]  945 	call	_dibujarEnemigo
   776A F1            [10]  946 	pop	af
   776B DD E1         [14]  947 	pop	ix
   776D C9            [10]  948 	ret
                            949 ;src/main.c:218: u8 checkEnemyCollision(u8 direction, TEnemy *enemy){
                            950 ;	---------------------------------
                            951 ; Function checkEnemyCollision
                            952 ; ---------------------------------
   776E                     953 _checkEnemyCollision::
   776E DD E5         [15]  954 	push	ix
   7770 DD 21 00 00   [14]  955 	ld	ix,#0
   7774 DD 39         [15]  956 	add	ix,sp
   7776 21 F7 FF      [10]  957 	ld	hl,#-9
   7779 39            [11]  958 	add	hl,sp
   777A F9            [ 6]  959 	ld	sp,hl
                            960 ;src/main.c:220: u8 colisiona = 1;
   777B DD 36 F7 01   [19]  961 	ld	-9 (ix),#0x01
                            962 ;src/main.c:222: switch (direction) {
   777F 3E 03         [ 7]  963 	ld	a,#0x03
   7781 DD 96 04      [19]  964 	sub	a, 4 (ix)
   7784 DA 61 7B      [10]  965 	jp	C,00165$
                            966 ;src/main.c:224: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   7787 DD 4E 05      [19]  967 	ld	c,5 (ix)
   778A DD 46 06      [19]  968 	ld	b,6 (ix)
   778D 0A            [ 7]  969 	ld	a,(bc)
   778E 5F            [ 4]  970 	ld	e,a
   778F 21 01 00      [10]  971 	ld	hl,#0x0001
   7792 09            [11]  972 	add	hl,bc
   7793 DD 75 F8      [19]  973 	ld	-8 (ix),l
   7796 DD 74 F9      [19]  974 	ld	-7 (ix),h
   7799 DD 6E F8      [19]  975 	ld	l,-8 (ix)
   779C DD 66 F9      [19]  976 	ld	h,-7 (ix)
   779F 56            [ 7]  977 	ld	d,(hl)
                            978 ;src/main.c:237: enemy->muerto = SI;
   77A0 21 08 00      [10]  979 	ld	hl,#0x0008
   77A3 09            [11]  980 	add	hl,bc
   77A4 DD 75 FA      [19]  981 	ld	-6 (ix),l
   77A7 DD 74 FB      [19]  982 	ld	-5 (ix),h
                            983 ;src/main.c:244: enemy->mira = M_izquierda;
   77AA 21 07 00      [10]  984 	ld	hl,#0x0007
   77AD 09            [11]  985 	add	hl,bc
   77AE DD 75 FC      [19]  986 	ld	-4 (ix),l
   77B1 DD 74 FD      [19]  987 	ld	-3 (ix),h
                            988 ;src/main.c:222: switch (direction) {
   77B4 D5            [11]  989 	push	de
   77B5 DD 5E 04      [19]  990 	ld	e,4 (ix)
   77B8 16 00         [ 7]  991 	ld	d,#0x00
   77BA 21 C2 77      [10]  992 	ld	hl,#00268$
   77BD 19            [11]  993 	add	hl,de
   77BE 19            [11]  994 	add	hl,de
   77BF 19            [11]  995 	add	hl,de
   77C0 D1            [10]  996 	pop	de
   77C1 E9            [ 4]  997 	jp	(hl)
   77C2                     998 00268$:
   77C2 C3 CE 77      [10]  999 	jp	00101$
   77C5 C3 B6 78      [10] 1000 	jp	00117$
   77C8 C3 9A 79      [10] 1001 	jp	00133$
   77CB C3 78 7A      [10] 1002 	jp	00149$
                           1003 ;src/main.c:223: case 0:
   77CE                    1004 00101$:
                           1005 ;src/main.c:224: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   77CE 7B            [ 4] 1006 	ld	a,e
   77CF C6 05         [ 7] 1007 	add	a, #0x05
   77D1 C5            [11] 1008 	push	bc
   77D2 D5            [11] 1009 	push	de
   77D3 33            [ 6] 1010 	inc	sp
   77D4 F5            [11] 1011 	push	af
   77D5 33            [ 6] 1012 	inc	sp
   77D6 2A 0F 73      [16] 1013 	ld	hl,(_mapa)
   77D9 E5            [11] 1014 	push	hl
   77DA CD D3 4F      [17] 1015 	call	_getTilePtr
   77DD F1            [10] 1016 	pop	af
   77DE F1            [10] 1017 	pop	af
   77DF C1            [10] 1018 	pop	bc
   77E0 5E            [ 7] 1019 	ld	e,(hl)
   77E1 3E 02         [ 7] 1020 	ld	a,#0x02
   77E3 93            [ 4] 1021 	sub	a, e
   77E4 DA AB 78      [10] 1022 	jp	C,00113$
                           1023 ;src/main.c:225: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   77E7 DD 6E F8      [19] 1024 	ld	l,-8 (ix)
   77EA DD 66 F9      [19] 1025 	ld	h,-7 (ix)
   77ED 7E            [ 7] 1026 	ld	a,(hl)
   77EE C6 0B         [ 7] 1027 	add	a, #0x0B
   77F0 57            [ 4] 1028 	ld	d,a
   77F1 0A            [ 7] 1029 	ld	a,(bc)
   77F2 C6 05         [ 7] 1030 	add	a, #0x05
   77F4 C5            [11] 1031 	push	bc
   77F5 D5            [11] 1032 	push	de
   77F6 33            [ 6] 1033 	inc	sp
   77F7 F5            [11] 1034 	push	af
   77F8 33            [ 6] 1035 	inc	sp
   77F9 2A 0F 73      [16] 1036 	ld	hl,(_mapa)
   77FC E5            [11] 1037 	push	hl
   77FD CD D3 4F      [17] 1038 	call	_getTilePtr
   7800 F1            [10] 1039 	pop	af
   7801 F1            [10] 1040 	pop	af
   7802 C1            [10] 1041 	pop	bc
   7803 5E            [ 7] 1042 	ld	e,(hl)
   7804 3E 02         [ 7] 1043 	ld	a,#0x02
   7806 93            [ 4] 1044 	sub	a, e
   7807 DA AB 78      [10] 1045 	jp	C,00113$
                           1046 ;src/main.c:226: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   780A DD 6E F8      [19] 1047 	ld	l,-8 (ix)
   780D DD 66 F9      [19] 1048 	ld	h,-7 (ix)
   7810 7E            [ 7] 1049 	ld	a,(hl)
   7811 C6 16         [ 7] 1050 	add	a, #0x16
   7813 57            [ 4] 1051 	ld	d,a
   7814 0A            [ 7] 1052 	ld	a,(bc)
   7815 C6 05         [ 7] 1053 	add	a, #0x05
   7817 C5            [11] 1054 	push	bc
   7818 D5            [11] 1055 	push	de
   7819 33            [ 6] 1056 	inc	sp
   781A F5            [11] 1057 	push	af
   781B 33            [ 6] 1058 	inc	sp
   781C 2A 0F 73      [16] 1059 	ld	hl,(_mapa)
   781F E5            [11] 1060 	push	hl
   7820 CD D3 4F      [17] 1061 	call	_getTilePtr
   7823 F1            [10] 1062 	pop	af
   7824 F1            [10] 1063 	pop	af
   7825 C1            [10] 1064 	pop	bc
   7826 5E            [ 7] 1065 	ld	e,(hl)
   7827 3E 02         [ 7] 1066 	ld	a,#0x02
   7829 93            [ 4] 1067 	sub	a, e
   782A DA AB 78      [10] 1068 	jp	C,00113$
                           1069 ;src/main.c:228: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   782D 21 60 6A      [10] 1070 	ld	hl, #_cu + 1
   7830 5E            [ 7] 1071 	ld	e,(hl)
   7831 16 00         [ 7] 1072 	ld	d,#0x00
   7833 21 04 00      [10] 1073 	ld	hl,#0x0004
   7836 19            [11] 1074 	add	hl,de
   7837 DD 75 FE      [19] 1075 	ld	-2 (ix),l
   783A DD 74 FF      [19] 1076 	ld	-1 (ix),h
   783D DD 6E F8      [19] 1077 	ld	l,-8 (ix)
   7840 DD 66 F9      [19] 1078 	ld	h,-7 (ix)
   7843 6E            [ 7] 1079 	ld	l,(hl)
   7844 26 00         [ 7] 1080 	ld	h,#0x00
   7846 DD 7E FE      [19] 1081 	ld	a,-2 (ix)
   7849 95            [ 4] 1082 	sub	a, l
   784A DD 7E FF      [19] 1083 	ld	a,-1 (ix)
   784D 9C            [ 4] 1084 	sbc	a, h
   784E E2 53 78      [10] 1085 	jp	PO, 00269$
   7851 EE 80         [ 7] 1086 	xor	a, #0x80
   7853                    1087 00269$:
   7853 FA 68 78      [10] 1088 	jp	M,00108$
   7856 D5            [11] 1089 	push	de
   7857 11 16 00      [10] 1090 	ld	de,#0x0016
   785A 19            [11] 1091 	add	hl, de
   785B D1            [10] 1092 	pop	de
   785C 7D            [ 4] 1093 	ld	a,l
   785D 93            [ 4] 1094 	sub	a, e
   785E 7C            [ 4] 1095 	ld	a,h
   785F 9A            [ 4] 1096 	sbc	a, d
   7860 E2 65 78      [10] 1097 	jp	PO, 00270$
   7863 EE 80         [ 7] 1098 	xor	a, #0x80
   7865                    1099 00270$:
   7865 F2 6F 78      [10] 1100 	jp	P,00109$
   7868                    1101 00108$:
                           1102 ;src/main.c:229: colisiona = 0;
   7868 DD 36 F7 00   [19] 1103 	ld	-9 (ix),#0x00
   786C C3 61 7B      [10] 1104 	jp	00165$
   786F                    1105 00109$:
                           1106 ;src/main.c:232: if(cu.x > enemy->x){ //si el cu esta abajo
   786F 21 5F 6A      [10] 1107 	ld	hl, #_cu + 0
   7872 5E            [ 7] 1108 	ld	e,(hl)
   7873 0A            [ 7] 1109 	ld	a,(bc)
   7874 4F            [ 4] 1110 	ld	c,a
   7875 93            [ 4] 1111 	sub	a, e
   7876 30 2C         [12] 1112 	jr	NC,00106$
                           1113 ;src/main.c:233: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
   7878 6B            [ 4] 1114 	ld	l,e
   7879 26 00         [ 7] 1115 	ld	h,#0x00
   787B 06 00         [ 7] 1116 	ld	b,#0x00
   787D 03            [ 6] 1117 	inc	bc
   787E 03            [ 6] 1118 	inc	bc
   787F 03            [ 6] 1119 	inc	bc
   7880 03            [ 6] 1120 	inc	bc
   7881 BF            [ 4] 1121 	cp	a, a
   7882 ED 42         [15] 1122 	sbc	hl, bc
   7884 3E 01         [ 7] 1123 	ld	a,#0x01
   7886 BD            [ 4] 1124 	cp	a, l
   7887 3E 00         [ 7] 1125 	ld	a,#0x00
   7889 9C            [ 4] 1126 	sbc	a, h
   788A E2 8F 78      [10] 1127 	jp	PO, 00271$
   788D EE 80         [ 7] 1128 	xor	a, #0x80
   788F                    1129 00271$:
   788F F2 99 78      [10] 1130 	jp	P,00103$
                           1131 ;src/main.c:234: colisiona = 0;
   7892 DD 36 F7 00   [19] 1132 	ld	-9 (ix),#0x00
   7896 C3 61 7B      [10] 1133 	jp	00165$
   7899                    1134 00103$:
                           1135 ;src/main.c:237: enemy->muerto = SI;
   7899 DD 6E FA      [19] 1136 	ld	l,-6 (ix)
   789C DD 66 FB      [19] 1137 	ld	h,-5 (ix)
   789F 36 01         [10] 1138 	ld	(hl),#0x01
   78A1 C3 61 7B      [10] 1139 	jp	00165$
   78A4                    1140 00106$:
                           1141 ;src/main.c:240: colisiona = 0;
   78A4 DD 36 F7 00   [19] 1142 	ld	-9 (ix),#0x00
   78A8 C3 61 7B      [10] 1143 	jp	00165$
   78AB                    1144 00113$:
                           1145 ;src/main.c:244: enemy->mira = M_izquierda;
   78AB DD 6E FC      [19] 1146 	ld	l,-4 (ix)
   78AE DD 66 FD      [19] 1147 	ld	h,-3 (ix)
   78B1 36 01         [10] 1148 	ld	(hl),#0x01
                           1149 ;src/main.c:246: break;
   78B3 C3 61 7B      [10] 1150 	jp	00165$
                           1151 ;src/main.c:247: case 1:
   78B6                    1152 00117$:
                           1153 ;src/main.c:248: if( *getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   78B6 1D            [ 4] 1154 	dec	e
   78B7 C5            [11] 1155 	push	bc
   78B8 D5            [11] 1156 	push	de
   78B9 2A 0F 73      [16] 1157 	ld	hl,(_mapa)
   78BC E5            [11] 1158 	push	hl
   78BD CD D3 4F      [17] 1159 	call	_getTilePtr
   78C0 F1            [10] 1160 	pop	af
   78C1 F1            [10] 1161 	pop	af
   78C2 C1            [10] 1162 	pop	bc
   78C3 5E            [ 7] 1163 	ld	e,(hl)
   78C4 3E 02         [ 7] 1164 	ld	a,#0x02
   78C6 93            [ 4] 1165 	sub	a, e
   78C7 DA 8F 79      [10] 1166 	jp	C,00129$
                           1167 ;src/main.c:249: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   78CA DD 6E F8      [19] 1168 	ld	l,-8 (ix)
   78CD DD 66 F9      [19] 1169 	ld	h,-7 (ix)
   78D0 7E            [ 7] 1170 	ld	a,(hl)
   78D1 C6 0B         [ 7] 1171 	add	a, #0x0B
   78D3 57            [ 4] 1172 	ld	d,a
   78D4 0A            [ 7] 1173 	ld	a,(bc)
   78D5 C6 FF         [ 7] 1174 	add	a,#0xFF
   78D7 C5            [11] 1175 	push	bc
   78D8 D5            [11] 1176 	push	de
   78D9 33            [ 6] 1177 	inc	sp
   78DA F5            [11] 1178 	push	af
   78DB 33            [ 6] 1179 	inc	sp
   78DC 2A 0F 73      [16] 1180 	ld	hl,(_mapa)
   78DF E5            [11] 1181 	push	hl
   78E0 CD D3 4F      [17] 1182 	call	_getTilePtr
   78E3 F1            [10] 1183 	pop	af
   78E4 F1            [10] 1184 	pop	af
   78E5 C1            [10] 1185 	pop	bc
   78E6 5E            [ 7] 1186 	ld	e,(hl)
   78E7 3E 02         [ 7] 1187 	ld	a,#0x02
   78E9 93            [ 4] 1188 	sub	a, e
   78EA DA 8F 79      [10] 1189 	jp	C,00129$
                           1190 ;src/main.c:250: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   78ED DD 6E F8      [19] 1191 	ld	l,-8 (ix)
   78F0 DD 66 F9      [19] 1192 	ld	h,-7 (ix)
   78F3 7E            [ 7] 1193 	ld	a,(hl)
   78F4 C6 16         [ 7] 1194 	add	a, #0x16
   78F6 57            [ 4] 1195 	ld	d,a
   78F7 0A            [ 7] 1196 	ld	a,(bc)
   78F8 C6 FF         [ 7] 1197 	add	a,#0xFF
   78FA C5            [11] 1198 	push	bc
   78FB D5            [11] 1199 	push	de
   78FC 33            [ 6] 1200 	inc	sp
   78FD F5            [11] 1201 	push	af
   78FE 33            [ 6] 1202 	inc	sp
   78FF 2A 0F 73      [16] 1203 	ld	hl,(_mapa)
   7902 E5            [11] 1204 	push	hl
   7903 CD D3 4F      [17] 1205 	call	_getTilePtr
   7906 F1            [10] 1206 	pop	af
   7907 F1            [10] 1207 	pop	af
   7908 C1            [10] 1208 	pop	bc
   7909 5E            [ 7] 1209 	ld	e,(hl)
   790A 3E 02         [ 7] 1210 	ld	a,#0x02
   790C 93            [ 4] 1211 	sub	a, e
   790D DA 8F 79      [10] 1212 	jp	C,00129$
                           1213 ;src/main.c:252: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   7910 21 60 6A      [10] 1214 	ld	hl, #_cu + 1
   7913 5E            [ 7] 1215 	ld	e,(hl)
   7914 16 00         [ 7] 1216 	ld	d,#0x00
   7916 21 04 00      [10] 1217 	ld	hl,#0x0004
   7919 19            [11] 1218 	add	hl,de
   791A DD 75 FE      [19] 1219 	ld	-2 (ix),l
   791D DD 74 FF      [19] 1220 	ld	-1 (ix),h
   7920 DD 6E F8      [19] 1221 	ld	l,-8 (ix)
   7923 DD 66 F9      [19] 1222 	ld	h,-7 (ix)
   7926 6E            [ 7] 1223 	ld	l,(hl)
   7927 26 00         [ 7] 1224 	ld	h,#0x00
   7929 DD 7E FE      [19] 1225 	ld	a,-2 (ix)
   792C 95            [ 4] 1226 	sub	a, l
   792D DD 7E FF      [19] 1227 	ld	a,-1 (ix)
   7930 9C            [ 4] 1228 	sbc	a, h
   7931 E2 36 79      [10] 1229 	jp	PO, 00272$
   7934 EE 80         [ 7] 1230 	xor	a, #0x80
   7936                    1231 00272$:
   7936 FA 4B 79      [10] 1232 	jp	M,00124$
   7939 D5            [11] 1233 	push	de
   793A 11 16 00      [10] 1234 	ld	de,#0x0016
   793D 19            [11] 1235 	add	hl, de
   793E D1            [10] 1236 	pop	de
   793F 7D            [ 4] 1237 	ld	a,l
   7940 93            [ 4] 1238 	sub	a, e
   7941 7C            [ 4] 1239 	ld	a,h
   7942 9A            [ 4] 1240 	sbc	a, d
   7943 E2 48 79      [10] 1241 	jp	PO, 00273$
   7946 EE 80         [ 7] 1242 	xor	a, #0x80
   7948                    1243 00273$:
   7948 F2 52 79      [10] 1244 	jp	P,00125$
   794B                    1245 00124$:
                           1246 ;src/main.c:253: colisiona = 0;
   794B DD 36 F7 00   [19] 1247 	ld	-9 (ix),#0x00
   794F C3 61 7B      [10] 1248 	jp	00165$
   7952                    1249 00125$:
                           1250 ;src/main.c:256: if(enemy->x > cu.x){ //si el cu esta abajo
   7952 0A            [ 7] 1251 	ld	a,(bc)
   7953 5F            [ 4] 1252 	ld	e,a
   7954 21 5F 6A      [10] 1253 	ld	hl, #_cu + 0
   7957 4E            [ 7] 1254 	ld	c,(hl)
   7958 79            [ 4] 1255 	ld	a,c
   7959 93            [ 4] 1256 	sub	a, e
   795A 30 2C         [12] 1257 	jr	NC,00122$
                           1258 ;src/main.c:257: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
   795C 6B            [ 4] 1259 	ld	l,e
   795D 26 00         [ 7] 1260 	ld	h,#0x00
   795F 06 00         [ 7] 1261 	ld	b,#0x00
   7961 03            [ 6] 1262 	inc	bc
   7962 03            [ 6] 1263 	inc	bc
   7963 03            [ 6] 1264 	inc	bc
   7964 03            [ 6] 1265 	inc	bc
   7965 BF            [ 4] 1266 	cp	a, a
   7966 ED 42         [15] 1267 	sbc	hl, bc
   7968 3E 01         [ 7] 1268 	ld	a,#0x01
   796A BD            [ 4] 1269 	cp	a, l
   796B 3E 00         [ 7] 1270 	ld	a,#0x00
   796D 9C            [ 4] 1271 	sbc	a, h
   796E E2 73 79      [10] 1272 	jp	PO, 00274$
   7971 EE 80         [ 7] 1273 	xor	a, #0x80
   7973                    1274 00274$:
   7973 F2 7D 79      [10] 1275 	jp	P,00119$
                           1276 ;src/main.c:258: colisiona = 0;
   7976 DD 36 F7 00   [19] 1277 	ld	-9 (ix),#0x00
   797A C3 61 7B      [10] 1278 	jp	00165$
   797D                    1279 00119$:
                           1280 ;src/main.c:261: enemy->muerto = SI;
   797D DD 6E FA      [19] 1281 	ld	l,-6 (ix)
   7980 DD 66 FB      [19] 1282 	ld	h,-5 (ix)
   7983 36 01         [10] 1283 	ld	(hl),#0x01
   7985 C3 61 7B      [10] 1284 	jp	00165$
   7988                    1285 00122$:
                           1286 ;src/main.c:264: colisiona = 0;
   7988 DD 36 F7 00   [19] 1287 	ld	-9 (ix),#0x00
   798C C3 61 7B      [10] 1288 	jp	00165$
   798F                    1289 00129$:
                           1290 ;src/main.c:268: enemy->mira = M_derecha;
   798F DD 6E FC      [19] 1291 	ld	l,-4 (ix)
   7992 DD 66 FD      [19] 1292 	ld	h,-3 (ix)
   7995 36 00         [10] 1293 	ld	(hl),#0x00
                           1294 ;src/main.c:270: break;
   7997 C3 61 7B      [10] 1295 	jp	00165$
                           1296 ;src/main.c:271: case 2:
   799A                    1297 00133$:
                           1298 ;src/main.c:272: if( *getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   799A 15            [ 4] 1299 	dec	d
   799B 15            [ 4] 1300 	dec	d
   799C C5            [11] 1301 	push	bc
   799D D5            [11] 1302 	push	de
   799E 2A 0F 73      [16] 1303 	ld	hl,(_mapa)
   79A1 E5            [11] 1304 	push	hl
   79A2 CD D3 4F      [17] 1305 	call	_getTilePtr
   79A5 F1            [10] 1306 	pop	af
   79A6 F1            [10] 1307 	pop	af
   79A7 C1            [10] 1308 	pop	bc
   79A8 5E            [ 7] 1309 	ld	e,(hl)
   79A9 3E 02         [ 7] 1310 	ld	a,#0x02
   79AB 93            [ 4] 1311 	sub	a, e
   79AC DA 70 7A      [10] 1312 	jp	C,00145$
                           1313 ;src/main.c:273: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   79AF DD 6E F8      [19] 1314 	ld	l,-8 (ix)
   79B2 DD 66 F9      [19] 1315 	ld	h,-7 (ix)
   79B5 56            [ 7] 1316 	ld	d,(hl)
   79B6 15            [ 4] 1317 	dec	d
   79B7 15            [ 4] 1318 	dec	d
   79B8 0A            [ 7] 1319 	ld	a,(bc)
   79B9 C6 02         [ 7] 1320 	add	a, #0x02
   79BB C5            [11] 1321 	push	bc
   79BC D5            [11] 1322 	push	de
   79BD 33            [ 6] 1323 	inc	sp
   79BE F5            [11] 1324 	push	af
   79BF 33            [ 6] 1325 	inc	sp
   79C0 2A 0F 73      [16] 1326 	ld	hl,(_mapa)
   79C3 E5            [11] 1327 	push	hl
   79C4 CD D3 4F      [17] 1328 	call	_getTilePtr
   79C7 F1            [10] 1329 	pop	af
   79C8 F1            [10] 1330 	pop	af
   79C9 C1            [10] 1331 	pop	bc
   79CA 5E            [ 7] 1332 	ld	e,(hl)
   79CB 3E 02         [ 7] 1333 	ld	a,#0x02
   79CD 93            [ 4] 1334 	sub	a, e
   79CE DA 70 7A      [10] 1335 	jp	C,00145$
                           1336 ;src/main.c:274: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   79D1 DD 6E F8      [19] 1337 	ld	l,-8 (ix)
   79D4 DD 66 F9      [19] 1338 	ld	h,-7 (ix)
   79D7 56            [ 7] 1339 	ld	d,(hl)
   79D8 15            [ 4] 1340 	dec	d
   79D9 15            [ 4] 1341 	dec	d
   79DA 0A            [ 7] 1342 	ld	a,(bc)
   79DB C6 04         [ 7] 1343 	add	a, #0x04
   79DD C5            [11] 1344 	push	bc
   79DE D5            [11] 1345 	push	de
   79DF 33            [ 6] 1346 	inc	sp
   79E0 F5            [11] 1347 	push	af
   79E1 33            [ 6] 1348 	inc	sp
   79E2 2A 0F 73      [16] 1349 	ld	hl,(_mapa)
   79E5 E5            [11] 1350 	push	hl
   79E6 CD D3 4F      [17] 1351 	call	_getTilePtr
   79E9 F1            [10] 1352 	pop	af
   79EA F1            [10] 1353 	pop	af
   79EB C1            [10] 1354 	pop	bc
   79EC 5E            [ 7] 1355 	ld	e,(hl)
   79ED 3E 02         [ 7] 1356 	ld	a,#0x02
   79EF 93            [ 4] 1357 	sub	a, e
   79F0 DA 70 7A      [10] 1358 	jp	C,00145$
                           1359 ;src/main.c:276: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   79F3 21 5F 6A      [10] 1360 	ld	hl, #_cu + 0
   79F6 5E            [ 7] 1361 	ld	e,(hl)
   79F7 16 00         [ 7] 1362 	ld	d,#0x00
   79F9 21 02 00      [10] 1363 	ld	hl,#0x0002
   79FC 19            [11] 1364 	add	hl,de
   79FD DD 75 FE      [19] 1365 	ld	-2 (ix),l
   7A00 DD 74 FF      [19] 1366 	ld	-1 (ix),h
   7A03 0A            [ 7] 1367 	ld	a,(bc)
   7A04 6F            [ 4] 1368 	ld	l,a
   7A05 26 00         [ 7] 1369 	ld	h,#0x00
   7A07 DD 7E FE      [19] 1370 	ld	a,-2 (ix)
   7A0A 95            [ 4] 1371 	sub	a, l
   7A0B DD 7E FF      [19] 1372 	ld	a,-1 (ix)
   7A0E 9C            [ 4] 1373 	sbc	a, h
   7A0F E2 14 7A      [10] 1374 	jp	PO, 00275$
   7A12 EE 80         [ 7] 1375 	xor	a, #0x80
   7A14                    1376 00275$:
   7A14 FA 27 7A      [10] 1377 	jp	M,00140$
   7A17 23            [ 6] 1378 	inc	hl
   7A18 23            [ 6] 1379 	inc	hl
   7A19 23            [ 6] 1380 	inc	hl
   7A1A 23            [ 6] 1381 	inc	hl
   7A1B 7D            [ 4] 1382 	ld	a,l
   7A1C 93            [ 4] 1383 	sub	a, e
   7A1D 7C            [ 4] 1384 	ld	a,h
   7A1E 9A            [ 4] 1385 	sbc	a, d
   7A1F E2 24 7A      [10] 1386 	jp	PO, 00276$
   7A22 EE 80         [ 7] 1387 	xor	a, #0x80
   7A24                    1388 00276$:
   7A24 F2 2D 7A      [10] 1389 	jp	P,00141$
   7A27                    1390 00140$:
                           1391 ;src/main.c:278: colisiona = 0;
   7A27 DD 36 F7 00   [19] 1392 	ld	-9 (ix),#0x00
   7A2B 18 4B         [12] 1393 	jr	00149$
   7A2D                    1394 00141$:
                           1395 ;src/main.c:281: if(enemy->y>cu.y){
   7A2D DD 6E F8      [19] 1396 	ld	l,-8 (ix)
   7A30 DD 66 F9      [19] 1397 	ld	h,-7 (ix)
   7A33 5E            [ 7] 1398 	ld	e,(hl)
   7A34 21 60 6A      [10] 1399 	ld	hl, #(_cu + 0x0001) + 0
   7A37 6E            [ 7] 1400 	ld	l,(hl)
   7A38 7D            [ 4] 1401 	ld	a,l
   7A39 93            [ 4] 1402 	sub	a, e
   7A3A 30 2E         [12] 1403 	jr	NC,00138$
                           1404 ;src/main.c:282: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   7A3C 16 00         [ 7] 1405 	ld	d,#0x00
   7A3E 26 00         [ 7] 1406 	ld	h,#0x00
   7A40 D5            [11] 1407 	push	de
   7A41 11 08 00      [10] 1408 	ld	de,#0x0008
   7A44 19            [11] 1409 	add	hl, de
   7A45 D1            [10] 1410 	pop	de
   7A46 7B            [ 4] 1411 	ld	a,e
   7A47 95            [ 4] 1412 	sub	a, l
   7A48 5F            [ 4] 1413 	ld	e,a
   7A49 7A            [ 4] 1414 	ld	a,d
   7A4A 9C            [ 4] 1415 	sbc	a, h
   7A4B 57            [ 4] 1416 	ld	d,a
   7A4C 3E 02         [ 7] 1417 	ld	a,#0x02
   7A4E BB            [ 4] 1418 	cp	a, e
   7A4F 3E 00         [ 7] 1419 	ld	a,#0x00
   7A51 9A            [ 4] 1420 	sbc	a, d
   7A52 E2 57 7A      [10] 1421 	jp	PO, 00277$
   7A55 EE 80         [ 7] 1422 	xor	a, #0x80
   7A57                    1423 00277$:
   7A57 F2 60 7A      [10] 1424 	jp	P,00135$
                           1425 ;src/main.c:283: colisiona = 0;
   7A5A DD 36 F7 00   [19] 1426 	ld	-9 (ix),#0x00
   7A5E 18 18         [12] 1427 	jr	00149$
   7A60                    1428 00135$:
                           1429 ;src/main.c:286: enemy->muerto = SI;
   7A60 DD 6E FA      [19] 1430 	ld	l,-6 (ix)
   7A63 DD 66 FB      [19] 1431 	ld	h,-5 (ix)
   7A66 36 01         [10] 1432 	ld	(hl),#0x01
   7A68 18 0E         [12] 1433 	jr	00149$
   7A6A                    1434 00138$:
                           1435 ;src/main.c:290: colisiona = 0;
   7A6A DD 36 F7 00   [19] 1436 	ld	-9 (ix),#0x00
   7A6E 18 08         [12] 1437 	jr	00149$
   7A70                    1438 00145$:
                           1439 ;src/main.c:296: enemy->mira = M_abajo;
   7A70 DD 6E FC      [19] 1440 	ld	l,-4 (ix)
   7A73 DD 66 FD      [19] 1441 	ld	h,-3 (ix)
   7A76 36 03         [10] 1442 	ld	(hl),#0x03
                           1443 ;src/main.c:299: case 3:
   7A78                    1444 00149$:
                           1445 ;src/main.c:302: if( *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7A78 DD 6E F8      [19] 1446 	ld	l,-8 (ix)
   7A7B DD 66 F9      [19] 1447 	ld	h,-7 (ix)
   7A7E 7E            [ 7] 1448 	ld	a,(hl)
   7A7F C6 18         [ 7] 1449 	add	a, #0x18
   7A81 57            [ 4] 1450 	ld	d,a
   7A82 0A            [ 7] 1451 	ld	a,(bc)
   7A83 C5            [11] 1452 	push	bc
   7A84 D5            [11] 1453 	push	de
   7A85 33            [ 6] 1454 	inc	sp
   7A86 F5            [11] 1455 	push	af
   7A87 33            [ 6] 1456 	inc	sp
   7A88 2A 0F 73      [16] 1457 	ld	hl,(_mapa)
   7A8B E5            [11] 1458 	push	hl
   7A8C CD D3 4F      [17] 1459 	call	_getTilePtr
   7A8F F1            [10] 1460 	pop	af
   7A90 F1            [10] 1461 	pop	af
   7A91 C1            [10] 1462 	pop	bc
   7A92 5E            [ 7] 1463 	ld	e,(hl)
   7A93 3E 02         [ 7] 1464 	ld	a,#0x02
   7A95 93            [ 4] 1465 	sub	a, e
   7A96 DA 59 7B      [10] 1466 	jp	C,00161$
                           1467 ;src/main.c:303: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7A99 DD 6E F8      [19] 1468 	ld	l,-8 (ix)
   7A9C DD 66 F9      [19] 1469 	ld	h,-7 (ix)
   7A9F 7E            [ 7] 1470 	ld	a,(hl)
   7AA0 C6 18         [ 7] 1471 	add	a, #0x18
   7AA2 57            [ 4] 1472 	ld	d,a
   7AA3 0A            [ 7] 1473 	ld	a,(bc)
   7AA4 C6 02         [ 7] 1474 	add	a, #0x02
   7AA6 C5            [11] 1475 	push	bc
   7AA7 D5            [11] 1476 	push	de
   7AA8 33            [ 6] 1477 	inc	sp
   7AA9 F5            [11] 1478 	push	af
   7AAA 33            [ 6] 1479 	inc	sp
   7AAB 2A 0F 73      [16] 1480 	ld	hl,(_mapa)
   7AAE E5            [11] 1481 	push	hl
   7AAF CD D3 4F      [17] 1482 	call	_getTilePtr
   7AB2 F1            [10] 1483 	pop	af
   7AB3 F1            [10] 1484 	pop	af
   7AB4 C1            [10] 1485 	pop	bc
   7AB5 5E            [ 7] 1486 	ld	e,(hl)
   7AB6 3E 02         [ 7] 1487 	ld	a,#0x02
   7AB8 93            [ 4] 1488 	sub	a, e
   7AB9 DA 59 7B      [10] 1489 	jp	C,00161$
                           1490 ;src/main.c:304: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   7ABC DD 6E F8      [19] 1491 	ld	l,-8 (ix)
   7ABF DD 66 F9      [19] 1492 	ld	h,-7 (ix)
   7AC2 7E            [ 7] 1493 	ld	a,(hl)
   7AC3 C6 18         [ 7] 1494 	add	a, #0x18
   7AC5 57            [ 4] 1495 	ld	d,a
   7AC6 0A            [ 7] 1496 	ld	a,(bc)
   7AC7 C6 04         [ 7] 1497 	add	a, #0x04
   7AC9 C5            [11] 1498 	push	bc
   7ACA D5            [11] 1499 	push	de
   7ACB 33            [ 6] 1500 	inc	sp
   7ACC F5            [11] 1501 	push	af
   7ACD 33            [ 6] 1502 	inc	sp
   7ACE 2A 0F 73      [16] 1503 	ld	hl,(_mapa)
   7AD1 E5            [11] 1504 	push	hl
   7AD2 CD D3 4F      [17] 1505 	call	_getTilePtr
   7AD5 F1            [10] 1506 	pop	af
   7AD6 F1            [10] 1507 	pop	af
   7AD7 C1            [10] 1508 	pop	bc
   7AD8 5E            [ 7] 1509 	ld	e,(hl)
   7AD9 3E 02         [ 7] 1510 	ld	a,#0x02
   7ADB 93            [ 4] 1511 	sub	a, e
   7ADC 38 7B         [12] 1512 	jr	C,00161$
                           1513 ;src/main.c:306: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   7ADE 21 5F 6A      [10] 1514 	ld	hl, #_cu + 0
   7AE1 5E            [ 7] 1515 	ld	e,(hl)
   7AE2 16 00         [ 7] 1516 	ld	d,#0x00
   7AE4 21 02 00      [10] 1517 	ld	hl,#0x0002
   7AE7 19            [11] 1518 	add	hl,de
   7AE8 DD 75 FE      [19] 1519 	ld	-2 (ix),l
   7AEB DD 74 FF      [19] 1520 	ld	-1 (ix),h
   7AEE 0A            [ 7] 1521 	ld	a,(bc)
   7AEF 4F            [ 4] 1522 	ld	c,a
   7AF0 06 00         [ 7] 1523 	ld	b,#0x00
   7AF2 DD 7E FE      [19] 1524 	ld	a,-2 (ix)
   7AF5 91            [ 4] 1525 	sub	a, c
   7AF6 DD 7E FF      [19] 1526 	ld	a,-1 (ix)
   7AF9 98            [ 4] 1527 	sbc	a, b
   7AFA E2 FF 7A      [10] 1528 	jp	PO, 00278$
   7AFD EE 80         [ 7] 1529 	xor	a, #0x80
   7AFF                    1530 00278$:
   7AFF FA 12 7B      [10] 1531 	jp	M,00156$
   7B02 03            [ 6] 1532 	inc	bc
   7B03 03            [ 6] 1533 	inc	bc
   7B04 03            [ 6] 1534 	inc	bc
   7B05 03            [ 6] 1535 	inc	bc
   7B06 79            [ 4] 1536 	ld	a,c
   7B07 93            [ 4] 1537 	sub	a, e
   7B08 78            [ 4] 1538 	ld	a,b
   7B09 9A            [ 4] 1539 	sbc	a, d
   7B0A E2 0F 7B      [10] 1540 	jp	PO, 00279$
   7B0D EE 80         [ 7] 1541 	xor	a, #0x80
   7B0F                    1542 00279$:
   7B0F F2 18 7B      [10] 1543 	jp	P,00157$
   7B12                    1544 00156$:
                           1545 ;src/main.c:307: colisiona = 0;
   7B12 DD 36 F7 00   [19] 1546 	ld	-9 (ix),#0x00
   7B16 18 49         [12] 1547 	jr	00165$
   7B18                    1548 00157$:
                           1549 ;src/main.c:310: if(cu.y > enemy->y){ //si el cu esta abajo
   7B18 21 60 6A      [10] 1550 	ld	hl, #(_cu + 0x0001) + 0
   7B1B 4E            [ 7] 1551 	ld	c,(hl)
   7B1C DD 6E F8      [19] 1552 	ld	l,-8 (ix)
   7B1F DD 66 F9      [19] 1553 	ld	h,-7 (ix)
   7B22 5E            [ 7] 1554 	ld	e,(hl)
   7B23 7B            [ 4] 1555 	ld	a,e
   7B24 91            [ 4] 1556 	sub	a, c
   7B25 30 2C         [12] 1557 	jr	NC,00154$
                           1558 ;src/main.c:311: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   7B27 06 00         [ 7] 1559 	ld	b,#0x00
   7B29 16 00         [ 7] 1560 	ld	d,#0x00
   7B2B 21 16 00      [10] 1561 	ld	hl,#0x0016
   7B2E 19            [11] 1562 	add	hl,de
   7B2F 79            [ 4] 1563 	ld	a,c
   7B30 95            [ 4] 1564 	sub	a, l
   7B31 4F            [ 4] 1565 	ld	c,a
   7B32 78            [ 4] 1566 	ld	a,b
   7B33 9C            [ 4] 1567 	sbc	a, h
   7B34 47            [ 4] 1568 	ld	b,a
   7B35 3E 02         [ 7] 1569 	ld	a,#0x02
   7B37 B9            [ 4] 1570 	cp	a, c
   7B38 3E 00         [ 7] 1571 	ld	a,#0x00
   7B3A 98            [ 4] 1572 	sbc	a, b
   7B3B E2 40 7B      [10] 1573 	jp	PO, 00280$
   7B3E EE 80         [ 7] 1574 	xor	a, #0x80
   7B40                    1575 00280$:
   7B40 F2 49 7B      [10] 1576 	jp	P,00151$
                           1577 ;src/main.c:312: colisiona = 0;
   7B43 DD 36 F7 00   [19] 1578 	ld	-9 (ix),#0x00
   7B47 18 18         [12] 1579 	jr	00165$
   7B49                    1580 00151$:
                           1581 ;src/main.c:315: enemy->muerto = SI;
   7B49 DD 6E FA      [19] 1582 	ld	l,-6 (ix)
   7B4C DD 66 FB      [19] 1583 	ld	h,-5 (ix)
   7B4F 36 01         [10] 1584 	ld	(hl),#0x01
   7B51 18 0E         [12] 1585 	jr	00165$
   7B53                    1586 00154$:
                           1587 ;src/main.c:319: colisiona = 0;
   7B53 DD 36 F7 00   [19] 1588 	ld	-9 (ix),#0x00
   7B57 18 08         [12] 1589 	jr	00165$
   7B59                    1590 00161$:
                           1591 ;src/main.c:323: enemy->mira = M_arriba;
   7B59 DD 6E FC      [19] 1592 	ld	l,-4 (ix)
   7B5C DD 66 FD      [19] 1593 	ld	h,-3 (ix)
   7B5F 36 02         [10] 1594 	ld	(hl),#0x02
                           1595 ;src/main.c:326: }
   7B61                    1596 00165$:
                           1597 ;src/main.c:327: return colisiona;
   7B61 DD 6E F7      [19] 1598 	ld	l,-9 (ix)
   7B64 DD F9         [10] 1599 	ld	sp, ix
   7B66 DD E1         [14] 1600 	pop	ix
   7B68 C9            [10] 1601 	ret
                           1602 ;src/main.c:330: void moverEnemigoArriba(TEnemy *enemy){
                           1603 ;	---------------------------------
                           1604 ; Function moverEnemigoArriba
                           1605 ; ---------------------------------
   7B69                    1606 _moverEnemigoArriba::
   7B69 DD E5         [15] 1607 	push	ix
   7B6B DD 21 00 00   [14] 1608 	ld	ix,#0
   7B6F DD 39         [15] 1609 	add	ix,sp
                           1610 ;src/main.c:331: enemy->y--;
   7B71 DD 4E 04      [19] 1611 	ld	c,4 (ix)
   7B74 DD 46 05      [19] 1612 	ld	b,5 (ix)
   7B77 69            [ 4] 1613 	ld	l, c
   7B78 60            [ 4] 1614 	ld	h, b
   7B79 23            [ 6] 1615 	inc	hl
   7B7A 5E            [ 7] 1616 	ld	e,(hl)
   7B7B 1D            [ 4] 1617 	dec	e
   7B7C 73            [ 7] 1618 	ld	(hl),e
                           1619 ;src/main.c:332: enemy->y--;
   7B7D 1D            [ 4] 1620 	dec	e
   7B7E 73            [ 7] 1621 	ld	(hl),e
                           1622 ;src/main.c:333: enemy->mover = SI;
   7B7F 21 06 00      [10] 1623 	ld	hl,#0x0006
   7B82 09            [11] 1624 	add	hl,bc
   7B83 36 01         [10] 1625 	ld	(hl),#0x01
   7B85 DD E1         [14] 1626 	pop	ix
   7B87 C9            [10] 1627 	ret
                           1628 ;src/main.c:336: void moverEnemigoAbajo(TEnemy *enemy){
                           1629 ;	---------------------------------
                           1630 ; Function moverEnemigoAbajo
                           1631 ; ---------------------------------
   7B88                    1632 _moverEnemigoAbajo::
   7B88 DD E5         [15] 1633 	push	ix
   7B8A DD 21 00 00   [14] 1634 	ld	ix,#0
   7B8E DD 39         [15] 1635 	add	ix,sp
                           1636 ;src/main.c:337: enemy->y++;
   7B90 DD 4E 04      [19] 1637 	ld	c,4 (ix)
   7B93 DD 46 05      [19] 1638 	ld	b,5 (ix)
   7B96 59            [ 4] 1639 	ld	e, c
   7B97 50            [ 4] 1640 	ld	d, b
   7B98 13            [ 6] 1641 	inc	de
   7B99 1A            [ 7] 1642 	ld	a,(de)
   7B9A 3C            [ 4] 1643 	inc	a
   7B9B 12            [ 7] 1644 	ld	(de),a
                           1645 ;src/main.c:338: enemy->y++;
   7B9C 3C            [ 4] 1646 	inc	a
   7B9D 12            [ 7] 1647 	ld	(de),a
                           1648 ;src/main.c:339: enemy->mover = SI;
   7B9E 21 06 00      [10] 1649 	ld	hl,#0x0006
   7BA1 09            [11] 1650 	add	hl,bc
   7BA2 36 01         [10] 1651 	ld	(hl),#0x01
   7BA4 DD E1         [14] 1652 	pop	ix
   7BA6 C9            [10] 1653 	ret
                           1654 ;src/main.c:342: void moverEnemigoDerecha(TEnemy *enemy){
                           1655 ;	---------------------------------
                           1656 ; Function moverEnemigoDerecha
                           1657 ; ---------------------------------
   7BA7                    1658 _moverEnemigoDerecha::
                           1659 ;src/main.c:343: enemy->x++;
   7BA7 D1            [10] 1660 	pop	de
   7BA8 C1            [10] 1661 	pop	bc
   7BA9 C5            [11] 1662 	push	bc
   7BAA D5            [11] 1663 	push	de
   7BAB 0A            [ 7] 1664 	ld	a,(bc)
   7BAC 3C            [ 4] 1665 	inc	a
   7BAD 02            [ 7] 1666 	ld	(bc),a
                           1667 ;src/main.c:344: enemy->x++;
   7BAE 3C            [ 4] 1668 	inc	a
   7BAF 02            [ 7] 1669 	ld	(bc),a
                           1670 ;src/main.c:345: enemy->mover = SI;
   7BB0 21 06 00      [10] 1671 	ld	hl,#0x0006
   7BB3 09            [11] 1672 	add	hl,bc
   7BB4 36 01         [10] 1673 	ld	(hl),#0x01
   7BB6 C9            [10] 1674 	ret
                           1675 ;src/main.c:348: void moverEnemigoIzquierda(TEnemy *enemy){
                           1676 ;	---------------------------------
                           1677 ; Function moverEnemigoIzquierda
                           1678 ; ---------------------------------
   7BB7                    1679 _moverEnemigoIzquierda::
                           1680 ;src/main.c:349: enemy->x--;
   7BB7 D1            [10] 1681 	pop	de
   7BB8 C1            [10] 1682 	pop	bc
   7BB9 C5            [11] 1683 	push	bc
   7BBA D5            [11] 1684 	push	de
   7BBB 0A            [ 7] 1685 	ld	a,(bc)
   7BBC C6 FF         [ 7] 1686 	add	a,#0xFF
   7BBE 02            [ 7] 1687 	ld	(bc),a
                           1688 ;src/main.c:350: enemy->x--;
   7BBF C6 FF         [ 7] 1689 	add	a,#0xFF
   7BC1 02            [ 7] 1690 	ld	(bc),a
                           1691 ;src/main.c:351: enemy->mover = SI;
   7BC2 21 06 00      [10] 1692 	ld	hl,#0x0006
   7BC5 09            [11] 1693 	add	hl,bc
   7BC6 36 01         [10] 1694 	ld	(hl),#0x01
   7BC8 C9            [10] 1695 	ret
                           1696 ;src/main.c:354: void moverEnemigo(TEnemy *enemy){
                           1697 ;	---------------------------------
                           1698 ; Function moverEnemigo
                           1699 ; ---------------------------------
   7BC9                    1700 _moverEnemigo::
                           1701 ;src/main.c:355: if(!enemy->muerto){
   7BC9 D1            [10] 1702 	pop	de
   7BCA C1            [10] 1703 	pop	bc
   7BCB C5            [11] 1704 	push	bc
   7BCC D5            [11] 1705 	push	de
   7BCD C5            [11] 1706 	push	bc
   7BCE FD E1         [14] 1707 	pop	iy
   7BD0 FD 7E 08      [19] 1708 	ld	a,8 (iy)
   7BD3 B7            [ 4] 1709 	or	a, a
   7BD4 C0            [11] 1710 	ret	NZ
                           1711 ;src/main.c:356: if(!checkEnemyCollision(enemy->mira, enemy)){
   7BD5 21 07 00      [10] 1712 	ld	hl,#0x0007
   7BD8 09            [11] 1713 	add	hl,bc
   7BD9 56            [ 7] 1714 	ld	d,(hl)
   7BDA E5            [11] 1715 	push	hl
   7BDB C5            [11] 1716 	push	bc
   7BDC C5            [11] 1717 	push	bc
   7BDD D5            [11] 1718 	push	de
   7BDE 33            [ 6] 1719 	inc	sp
   7BDF CD 6E 77      [17] 1720 	call	_checkEnemyCollision
   7BE2 F1            [10] 1721 	pop	af
   7BE3 33            [ 6] 1722 	inc	sp
   7BE4 7D            [ 4] 1723 	ld	a,l
   7BE5 C1            [10] 1724 	pop	bc
   7BE6 E1            [10] 1725 	pop	hl
   7BE7 B7            [ 4] 1726 	or	a, a
   7BE8 C0            [11] 1727 	ret	NZ
                           1728 ;src/main.c:358: switch (enemy->mira) {
   7BE9 5E            [ 7] 1729 	ld	e,(hl)
   7BEA 3E 03         [ 7] 1730 	ld	a,#0x03
   7BEC 93            [ 4] 1731 	sub	a, e
   7BED D8            [11] 1732 	ret	C
   7BEE 16 00         [ 7] 1733 	ld	d,#0x00
   7BF0 21 F6 7B      [10] 1734 	ld	hl,#00124$
   7BF3 19            [11] 1735 	add	hl,de
   7BF4 19            [11] 1736 	add	hl,de
                           1737 ;src/main.c:360: case 0:
   7BF5 E9            [ 4] 1738 	jp	(hl)
   7BF6                    1739 00124$:
   7BF6 18 06         [12] 1740 	jr	00101$
   7BF8 18 0A         [12] 1741 	jr	00102$
   7BFA 18 0E         [12] 1742 	jr	00103$
   7BFC 18 12         [12] 1743 	jr	00104$
   7BFE                    1744 00101$:
                           1745 ;src/main.c:361: moverEnemigoDerecha(enemy);
   7BFE C5            [11] 1746 	push	bc
   7BFF CD A7 7B      [17] 1747 	call	_moverEnemigoDerecha
   7C02 F1            [10] 1748 	pop	af
                           1749 ;src/main.c:362: break;
   7C03 C9            [10] 1750 	ret
                           1751 ;src/main.c:363: case 1:
   7C04                    1752 00102$:
                           1753 ;src/main.c:364: moverEnemigoIzquierda(enemy);
   7C04 C5            [11] 1754 	push	bc
   7C05 CD B7 7B      [17] 1755 	call	_moverEnemigoIzquierda
   7C08 F1            [10] 1756 	pop	af
                           1757 ;src/main.c:365: break;
   7C09 C9            [10] 1758 	ret
                           1759 ;src/main.c:366: case 2:
   7C0A                    1760 00103$:
                           1761 ;src/main.c:367: moverEnemigoArriba(enemy);
   7C0A C5            [11] 1762 	push	bc
   7C0B CD 69 7B      [17] 1763 	call	_moverEnemigoArriba
   7C0E F1            [10] 1764 	pop	af
                           1765 ;src/main.c:368: break;
   7C0F C9            [10] 1766 	ret
                           1767 ;src/main.c:369: case 3:
   7C10                    1768 00104$:
                           1769 ;src/main.c:370: moverEnemigoAbajo(enemy);
   7C10 C5            [11] 1770 	push	bc
   7C11 CD 88 7B      [17] 1771 	call	_moverEnemigoAbajo
   7C14 F1            [10] 1772 	pop	af
                           1773 ;src/main.c:372: }
   7C15 C9            [10] 1774 	ret
                           1775 ;src/main.c:377: void moverEnemigoPatrol(TEnemy *enemy){
                           1776 ;	---------------------------------
                           1777 ; Function moverEnemigoPatrol
                           1778 ; ---------------------------------
   7C16                    1779 _moverEnemigoPatrol::
   7C16 DD E5         [15] 1780 	push	ix
   7C18 DD 21 00 00   [14] 1781 	ld	ix,#0
   7C1C DD 39         [15] 1782 	add	ix,sp
   7C1E 21 F3 FF      [10] 1783 	ld	hl,#-13
   7C21 39            [11] 1784 	add	hl,sp
   7C22 F9            [ 6] 1785 	ld	sp,hl
                           1786 ;src/main.c:378: if(!enemy->muerto){
   7C23 DD 4E 04      [19] 1787 	ld	c,4 (ix)
   7C26 DD 46 05      [19] 1788 	ld	b,5 (ix)
   7C29 C5            [11] 1789 	push	bc
   7C2A FD E1         [14] 1790 	pop	iy
   7C2C FD 7E 08      [19] 1791 	ld	a,8 (iy)
   7C2F B7            [ 4] 1792 	or	a, a
   7C30 C2 40 7D      [10] 1793 	jp	NZ,00112$
                           1794 ;src/main.c:380: if (!enemy->reversePatrol) {
   7C33 21 0D 00      [10] 1795 	ld	hl,#0x000D
   7C36 09            [11] 1796 	add	hl,bc
   7C37 DD 75 F8      [19] 1797 	ld	-8 (ix),l
   7C3A DD 74 F9      [19] 1798 	ld	-7 (ix),h
   7C3D DD 6E F8      [19] 1799 	ld	l,-8 (ix)
   7C40 DD 66 F9      [19] 1800 	ld	h,-7 (ix)
   7C43 7E            [ 7] 1801 	ld	a,(hl)
   7C44 DD 77 F7      [19] 1802 	ld	-9 (ix),a
                           1803 ;src/main.c:381: if(enemy->iter < enemy->longitud_camino - 8){
   7C47 21 0F 00      [10] 1804 	ld	hl,#0x000F
   7C4A 09            [11] 1805 	add	hl,bc
   7C4B EB            [ 4] 1806 	ex	de,hl
                           1807 ;src/main.c:382: enemy->x = enemy->camino[enemy->iter];
   7C4C 21 19 00      [10] 1808 	ld	hl,#0x0019
   7C4F 09            [11] 1809 	add	hl,bc
   7C50 DD 75 F5      [19] 1810 	ld	-11 (ix),l
   7C53 DD 74 F6      [19] 1811 	ld	-10 (ix),h
                           1812 ;src/main.c:384: enemy->y = enemy->camino[enemy->iter];
   7C56 21 01 00      [10] 1813 	ld	hl,#0x0001
   7C59 09            [11] 1814 	add	hl,bc
   7C5A E3            [19] 1815 	ex	(sp), hl
                           1816 ;src/main.c:386: enemy->mover = SI;
   7C5B 21 06 00      [10] 1817 	ld	hl,#0x0006
   7C5E 09            [11] 1818 	add	hl,bc
   7C5F DD 75 FE      [19] 1819 	ld	-2 (ix),l
   7C62 DD 74 FF      [19] 1820 	ld	-1 (ix),h
                           1821 ;src/main.c:389: enemy->lastIter = enemy->iter - 1;
   7C65 21 10 00      [10] 1822 	ld	hl,#0x0010
   7C68 09            [11] 1823 	add	hl,bc
   7C69 DD 75 FC      [19] 1824 	ld	-4 (ix),l
   7C6C DD 74 FD      [19] 1825 	ld	-3 (ix),h
                           1826 ;src/main.c:380: if (!enemy->reversePatrol) {
   7C6F DD 7E F7      [19] 1827 	ld	a,-9 (ix)
   7C72 B7            [ 4] 1828 	or	a, a
   7C73 20 78         [12] 1829 	jr	NZ,00108$
                           1830 ;src/main.c:381: if(enemy->iter < enemy->longitud_camino - 8){
   7C75 1A            [ 7] 1831 	ld	a,(de)
   7C76 DD 77 F7      [19] 1832 	ld	-9 (ix),a
   7C79 69            [ 4] 1833 	ld	l, c
   7C7A 60            [ 4] 1834 	ld	h, b
   7C7B C5            [11] 1835 	push	bc
   7C7C 01 45 01      [10] 1836 	ld	bc, #0x0145
   7C7F 09            [11] 1837 	add	hl, bc
   7C80 C1            [10] 1838 	pop	bc
   7C81 6E            [ 7] 1839 	ld	l,(hl)
   7C82 26 00         [ 7] 1840 	ld	h,#0x00
   7C84 7D            [ 4] 1841 	ld	a,l
   7C85 C6 F8         [ 7] 1842 	add	a,#0xF8
   7C87 DD 77 FA      [19] 1843 	ld	-6 (ix),a
   7C8A 7C            [ 4] 1844 	ld	a,h
   7C8B CE FF         [ 7] 1845 	adc	a,#0xFF
   7C8D DD 77 FB      [19] 1846 	ld	-5 (ix),a
   7C90 DD 7E F7      [19] 1847 	ld	a, -9 (ix)
   7C93 26 00         [ 7] 1848 	ld	h, #0x00
   7C95 DD 96 FA      [19] 1849 	sub	a, -6 (ix)
   7C98 7C            [ 4] 1850 	ld	a,h
   7C99 DD 9E FB      [19] 1851 	sbc	a, -5 (ix)
   7C9C E2 A1 7C      [10] 1852 	jp	PO, 00130$
   7C9F EE 80         [ 7] 1853 	xor	a, #0x80
   7CA1                    1854 00130$:
   7CA1 F2 D8 7C      [10] 1855 	jp	P,00102$
                           1856 ;src/main.c:382: enemy->x = enemy->camino[enemy->iter];
   7CA4 DD 6E F7      [19] 1857 	ld	l,-9 (ix)
   7CA7 26 00         [ 7] 1858 	ld	h,#0x00
   7CA9 DD 7E F5      [19] 1859 	ld	a,-11 (ix)
   7CAC 85            [ 4] 1860 	add	a, l
   7CAD 6F            [ 4] 1861 	ld	l,a
   7CAE DD 7E F6      [19] 1862 	ld	a,-10 (ix)
   7CB1 8C            [ 4] 1863 	adc	a, h
   7CB2 67            [ 4] 1864 	ld	h,a
   7CB3 7E            [ 7] 1865 	ld	a,(hl)
   7CB4 02            [ 7] 1866 	ld	(bc),a
                           1867 ;src/main.c:383: enemy->iter++;
   7CB5 1A            [ 7] 1868 	ld	a,(de)
   7CB6 4F            [ 4] 1869 	ld	c,a
   7CB7 0C            [ 4] 1870 	inc	c
   7CB8 79            [ 4] 1871 	ld	a,c
   7CB9 12            [ 7] 1872 	ld	(de),a
                           1873 ;src/main.c:384: enemy->y = enemy->camino[enemy->iter];
   7CBA 69            [ 4] 1874 	ld	l,c
   7CBB 26 00         [ 7] 1875 	ld	h,#0x00
   7CBD DD 7E F5      [19] 1876 	ld	a,-11 (ix)
   7CC0 85            [ 4] 1877 	add	a, l
   7CC1 6F            [ 4] 1878 	ld	l,a
   7CC2 DD 7E F6      [19] 1879 	ld	a,-10 (ix)
   7CC5 8C            [ 4] 1880 	adc	a, h
   7CC6 67            [ 4] 1881 	ld	h,a
   7CC7 46            [ 7] 1882 	ld	b,(hl)
   7CC8 E1            [10] 1883 	pop	hl
   7CC9 E5            [11] 1884 	push	hl
   7CCA 70            [ 7] 1885 	ld	(hl),b
                           1886 ;src/main.c:385: enemy->iter++;
   7CCB 0C            [ 4] 1887 	inc	c
   7CCC 79            [ 4] 1888 	ld	a,c
   7CCD 12            [ 7] 1889 	ld	(de),a
                           1890 ;src/main.c:386: enemy->mover = SI;
   7CCE DD 6E FE      [19] 1891 	ld	l,-2 (ix)
   7CD1 DD 66 FF      [19] 1892 	ld	h,-1 (ix)
   7CD4 36 01         [10] 1893 	ld	(hl),#0x01
   7CD6 18 68         [12] 1894 	jr	00112$
   7CD8                    1895 00102$:
                           1896 ;src/main.c:389: enemy->lastIter = enemy->iter - 1;
   7CD8 DD 4E F7      [19] 1897 	ld	c,-9 (ix)
   7CDB 0D            [ 4] 1898 	dec	c
   7CDC DD 6E FC      [19] 1899 	ld	l,-4 (ix)
   7CDF DD 66 FD      [19] 1900 	ld	h,-3 (ix)
   7CE2 71            [ 7] 1901 	ld	(hl),c
                           1902 ;src/main.c:392: enemy->reversePatrol = 1;
   7CE3 DD 6E F8      [19] 1903 	ld	l,-8 (ix)
   7CE6 DD 66 F9      [19] 1904 	ld	h,-7 (ix)
   7CE9 36 01         [10] 1905 	ld	(hl),#0x01
   7CEB 18 53         [12] 1906 	jr	00112$
   7CED                    1907 00108$:
                           1908 ;src/main.c:395: if(enemy->lastIter > 1){
   7CED DD 6E FC      [19] 1909 	ld	l,-4 (ix)
   7CF0 DD 66 FD      [19] 1910 	ld	h,-3 (ix)
   7CF3 6E            [ 7] 1911 	ld	l,(hl)
   7CF4 3E 01         [ 7] 1912 	ld	a,#0x01
   7CF6 95            [ 4] 1913 	sub	a, l
   7CF7 30 3D         [12] 1914 	jr	NC,00105$
                           1915 ;src/main.c:396: enemy->y = enemy->camino[enemy->lastIter];
   7CF9 26 00         [ 7] 1916 	ld	h,#0x00
   7CFB DD 5E F5      [19] 1917 	ld	e,-11 (ix)
   7CFE DD 56 F6      [19] 1918 	ld	d,-10 (ix)
   7D01 19            [11] 1919 	add	hl,de
   7D02 5E            [ 7] 1920 	ld	e,(hl)
   7D03 E1            [10] 1921 	pop	hl
   7D04 E5            [11] 1922 	push	hl
   7D05 73            [ 7] 1923 	ld	(hl),e
                           1924 ;src/main.c:397: enemy->lastIter--;
   7D06 DD 6E FC      [19] 1925 	ld	l,-4 (ix)
   7D09 DD 66 FD      [19] 1926 	ld	h,-3 (ix)
   7D0C 5E            [ 7] 1927 	ld	e,(hl)
   7D0D 1D            [ 4] 1928 	dec	e
   7D0E DD 6E FC      [19] 1929 	ld	l,-4 (ix)
   7D11 DD 66 FD      [19] 1930 	ld	h,-3 (ix)
   7D14 73            [ 7] 1931 	ld	(hl),e
                           1932 ;src/main.c:398: enemy->x = enemy->camino[enemy->lastIter];
   7D15 6B            [ 4] 1933 	ld	l,e
   7D16 26 00         [ 7] 1934 	ld	h,#0x00
   7D18 DD 7E F5      [19] 1935 	ld	a,-11 (ix)
   7D1B 85            [ 4] 1936 	add	a, l
   7D1C 6F            [ 4] 1937 	ld	l,a
   7D1D DD 7E F6      [19] 1938 	ld	a,-10 (ix)
   7D20 8C            [ 4] 1939 	adc	a, h
   7D21 67            [ 4] 1940 	ld	h,a
   7D22 7E            [ 7] 1941 	ld	a,(hl)
   7D23 02            [ 7] 1942 	ld	(bc),a
                           1943 ;src/main.c:399: enemy->lastIter--;
   7D24 1D            [ 4] 1944 	dec	e
   7D25 DD 6E FC      [19] 1945 	ld	l,-4 (ix)
   7D28 DD 66 FD      [19] 1946 	ld	h,-3 (ix)
   7D2B 73            [ 7] 1947 	ld	(hl),e
                           1948 ;src/main.c:400: enemy->mover = SI;
   7D2C DD 6E FE      [19] 1949 	ld	l,-2 (ix)
   7D2F DD 66 FF      [19] 1950 	ld	h,-1 (ix)
   7D32 36 01         [10] 1951 	ld	(hl),#0x01
   7D34 18 0A         [12] 1952 	jr	00112$
   7D36                    1953 00105$:
                           1954 ;src/main.c:403: enemy->iter = 0;
   7D36 AF            [ 4] 1955 	xor	a, a
   7D37 12            [ 7] 1956 	ld	(de),a
                           1957 ;src/main.c:405: enemy->reversePatrol = 0;
   7D38 DD 6E F8      [19] 1958 	ld	l,-8 (ix)
   7D3B DD 66 F9      [19] 1959 	ld	h,-7 (ix)
   7D3E 36 00         [10] 1960 	ld	(hl),#0x00
   7D40                    1961 00112$:
   7D40 DD F9         [10] 1962 	ld	sp, ix
   7D42 DD E1         [14] 1963 	pop	ix
   7D44 C9            [10] 1964 	ret
                           1965 ;src/main.c:414: void lookFor(TEnemy* enemy){
                           1966 ;	---------------------------------
                           1967 ; Function lookFor
                           1968 ; ---------------------------------
   7D45                    1969 _lookFor::
   7D45 DD E5         [15] 1970 	push	ix
   7D47 DD 21 00 00   [14] 1971 	ld	ix,#0
   7D4B DD 39         [15] 1972 	add	ix,sp
   7D4D 21 FA FF      [10] 1973 	ld	hl,#-6
   7D50 39            [11] 1974 	add	hl,sp
   7D51 F9            [ 6] 1975 	ld	sp,hl
                           1976 ;src/main.c:421: u8 difx = abs(enemy->x - prota.x);
   7D52 DD 4E 04      [19] 1977 	ld	c,4 (ix)
   7D55 DD 46 05      [19] 1978 	ld	b,5 (ix)
   7D58 0A            [ 7] 1979 	ld	a,(bc)
   7D59 5F            [ 4] 1980 	ld	e,a
   7D5A 16 00         [ 7] 1981 	ld	d,#0x00
   7D5C 21 57 6A      [10] 1982 	ld	hl,#_prota+0
   7D5F 6E            [ 7] 1983 	ld	l,(hl)
   7D60 26 00         [ 7] 1984 	ld	h,#0x00
   7D62 7B            [ 4] 1985 	ld	a,e
   7D63 95            [ 4] 1986 	sub	a, l
   7D64 5F            [ 4] 1987 	ld	e,a
   7D65 7A            [ 4] 1988 	ld	a,d
   7D66 9C            [ 4] 1989 	sbc	a, h
   7D67 57            [ 4] 1990 	ld	d,a
   7D68 C5            [11] 1991 	push	bc
   7D69 D5            [11] 1992 	push	de
   7D6A CD 17 50      [17] 1993 	call	_abs
   7D6D F1            [10] 1994 	pop	af
   7D6E C1            [10] 1995 	pop	bc
   7D6F DD 75 FB      [19] 1996 	ld	-5 (ix),l
                           1997 ;src/main.c:422: u8 dify = abs(enemy->y - prota.y);
   7D72 59            [ 4] 1998 	ld	e, c
   7D73 50            [ 4] 1999 	ld	d, b
   7D74 13            [ 6] 2000 	inc	de
   7D75 1A            [ 7] 2001 	ld	a,(de)
   7D76 DD 77 FE      [19] 2002 	ld	-2 (ix),a
   7D79 DD 36 FF 00   [19] 2003 	ld	-1 (ix),#0x00
   7D7D 21 58 6A      [10] 2004 	ld	hl, #(_prota + 0x0001) + 0
   7D80 6E            [ 7] 2005 	ld	l,(hl)
   7D81 26 00         [ 7] 2006 	ld	h,#0x00
   7D83 DD 7E FE      [19] 2007 	ld	a,-2 (ix)
   7D86 95            [ 4] 2008 	sub	a, l
   7D87 6F            [ 4] 2009 	ld	l,a
   7D88 DD 7E FF      [19] 2010 	ld	a,-1 (ix)
   7D8B 9C            [ 4] 2011 	sbc	a, h
   7D8C 67            [ 4] 2012 	ld	h,a
   7D8D C5            [11] 2013 	push	bc
   7D8E D5            [11] 2014 	push	de
   7D8F E5            [11] 2015 	push	hl
   7D90 CD 17 50      [17] 2016 	call	_abs
   7D93 F1            [10] 2017 	pop	af
   7D94 D1            [10] 2018 	pop	de
   7D95 C1            [10] 2019 	pop	bc
                           2020 ;src/main.c:423: dist = difx + dify; // manhattan
   7D96 DD 7E FB      [19] 2021 	ld	a,-5 (ix)
   7D99 85            [ 4] 2022 	add	a, l
   7D9A DD 77 FA      [19] 2023 	ld	-6 (ix),a
                           2024 ;src/main.c:425: enemy->seen = NO;
   7D9D 21 12 00      [10] 2025 	ld	hl,#0x0012
   7DA0 09            [11] 2026 	add	hl,bc
   7DA1 DD 75 FE      [19] 2027 	ld	-2 (ix),l
   7DA4 DD 74 FF      [19] 2028 	ld	-1 (ix),h
   7DA7 DD 6E FE      [19] 2029 	ld	l,-2 (ix)
   7DAA DD 66 FF      [19] 2030 	ld	h,-1 (ix)
   7DAD 36 00         [10] 2031 	ld	(hl),#0x00
                           2032 ;src/main.c:426: enemy->inRange = NO;
   7DAF 21 11 00      [10] 2033 	ld	hl,#0x0011
   7DB2 09            [11] 2034 	add	hl,bc
   7DB3 DD 75 FC      [19] 2035 	ld	-4 (ix),l
   7DB6 DD 74 FD      [19] 2036 	ld	-3 (ix),h
   7DB9 DD 6E FC      [19] 2037 	ld	l,-4 (ix)
   7DBC DD 66 FD      [19] 2038 	ld	h,-3 (ix)
   7DBF 36 00         [10] 2039 	ld	(hl),#0x00
                           2040 ;src/main.c:428: if (dist <= 10) {// te detectan los sensores de proximidad
   7DC1 3E 0A         [ 7] 2041 	ld	a,#0x0A
   7DC3 DD 96 FA      [19] 2042 	sub	a, -6 (ix)
   7DC6 3E 00         [ 7] 2043 	ld	a,#0x00
   7DC8 17            [ 4] 2044 	rla
   7DC9 CB 47         [ 8] 2045 	bit	0,a
   7DCB 20 12         [12] 2046 	jr	NZ,00116$
                           2047 ;src/main.c:429: enemy->seen = 1;
   7DCD DD 6E FE      [19] 2048 	ld	l,-2 (ix)
   7DD0 DD 66 FF      [19] 2049 	ld	h,-1 (ix)
   7DD3 36 01         [10] 2050 	ld	(hl),#0x01
                           2051 ;src/main.c:430: enemy->inRange = 1;
   7DD5 DD 6E FC      [19] 2052 	ld	l,-4 (ix)
   7DD8 DD 66 FD      [19] 2053 	ld	h,-3 (ix)
   7DDB 36 01         [10] 2054 	ld	(hl),#0x01
   7DDD 18 5B         [12] 2055 	jr	00118$
   7DDF                    2056 00116$:
                           2057 ;src/main.c:431: } else if(dist > 10){
   7DDF CB 47         [ 8] 2058 	bit	0,a
   7DE1 28 57         [12] 2059 	jr	Z,00118$
                           2060 ;src/main.c:432: if(enemy->y > prota.y - 4 && enemy->y < prota.y + 4){
   7DE3 1A            [ 7] 2061 	ld	a,(de)
   7DE4 5F            [ 4] 2062 	ld	e,a
   7DE5 21 58 6A      [10] 2063 	ld	hl, #(_prota + 0x0001) + 0
   7DE8 6E            [ 7] 2064 	ld	l,(hl)
   7DE9 26 00         [ 7] 2065 	ld	h,#0x00
   7DEB 7D            [ 4] 2066 	ld	a,l
   7DEC C6 FC         [ 7] 2067 	add	a,#0xFC
   7DEE DD 77 FC      [19] 2068 	ld	-4 (ix),a
   7DF1 7C            [ 4] 2069 	ld	a,h
   7DF2 CE FF         [ 7] 2070 	adc	a,#0xFF
   7DF4 DD 77 FD      [19] 2071 	ld	-3 (ix),a
   7DF7 16 00         [ 7] 2072 	ld	d,#0x00
   7DF9 DD 7E FC      [19] 2073 	ld	a,-4 (ix)
   7DFC 93            [ 4] 2074 	sub	a, e
   7DFD DD 7E FD      [19] 2075 	ld	a,-3 (ix)
   7E00 9A            [ 4] 2076 	sbc	a, d
   7E01 E2 06 7E      [10] 2077 	jp	PO, 00146$
   7E04 EE 80         [ 7] 2078 	xor	a, #0x80
   7E06                    2079 00146$:
   7E06 F2 3A 7E      [10] 2080 	jp	P,00118$
   7E09 23            [ 6] 2081 	inc	hl
   7E0A 23            [ 6] 2082 	inc	hl
   7E0B 23            [ 6] 2083 	inc	hl
   7E0C 23            [ 6] 2084 	inc	hl
   7E0D 7B            [ 4] 2085 	ld	a,e
   7E0E 95            [ 4] 2086 	sub	a, l
   7E0F 7A            [ 4] 2087 	ld	a,d
   7E10 9C            [ 4] 2088 	sbc	a, h
   7E11 E2 16 7E      [10] 2089 	jp	PO, 00147$
   7E14 EE 80         [ 7] 2090 	xor	a, #0x80
   7E16                    2091 00147$:
   7E16 F2 3A 7E      [10] 2092 	jp	P,00118$
                           2093 ;src/main.c:433: if(enemy->x > prota.x){
   7E19 0A            [ 7] 2094 	ld	a,(bc)
   7E1A 4F            [ 4] 2095 	ld	c,a
   7E1B 3A 57 6A      [13] 2096 	ld	a,(#_prota + 0)
   7E1E 91            [ 4] 2097 	sub	a, c
   7E1F 3E 00         [ 7] 2098 	ld	a,#0x00
   7E21 17            [ 4] 2099 	rla
   7E22 B7            [ 4] 2100 	or	a, a
   7E23 28 0A         [12] 2101 	jr	Z,00108$
                           2102 ;src/main.c:441: enemy->seen = SI;
   7E25 DD 6E FE      [19] 2103 	ld	l,-2 (ix)
   7E28 DD 66 FF      [19] 2104 	ld	h,-1 (ix)
   7E2B 36 01         [10] 2105 	ld	(hl),#0x01
   7E2D 18 0B         [12] 2106 	jr	00118$
   7E2F                    2107 00108$:
                           2108 ;src/main.c:443: }else if(enemy->x > prota.x){
   7E2F B7            [ 4] 2109 	or	a, a
   7E30 28 08         [12] 2110 	jr	Z,00118$
                           2111 ;src/main.c:451: enemy->seen = SI;
   7E32 DD 6E FE      [19] 2112 	ld	l,-2 (ix)
   7E35 DD 66 FF      [19] 2113 	ld	h,-1 (ix)
   7E38 36 01         [10] 2114 	ld	(hl),#0x01
   7E3A                    2115 00118$:
   7E3A DD F9         [10] 2116 	ld	sp, ix
   7E3C DD E1         [14] 2117 	pop	ix
   7E3E C9            [10] 2118 	ret
                           2119 ;src/main.c:458: void moverEnemigoSeek(TEnemy* enemy){
                           2120 ;	---------------------------------
                           2121 ; Function moverEnemigoSeek
                           2122 ; ---------------------------------
   7E3F                    2123 _moverEnemigoSeek::
   7E3F DD E5         [15] 2124 	push	ix
   7E41 DD 21 00 00   [14] 2125 	ld	ix,#0
   7E45 DD 39         [15] 2126 	add	ix,sp
   7E47 F5            [11] 2127 	push	af
   7E48 F5            [11] 2128 	push	af
   7E49 3B            [ 6] 2129 	dec	sp
                           2130 ;src/main.c:459: if(!enemy->muerto){
   7E4A DD 4E 04      [19] 2131 	ld	c,4 (ix)
   7E4D DD 46 05      [19] 2132 	ld	b,5 (ix)
   7E50 C5            [11] 2133 	push	bc
   7E51 FD E1         [14] 2134 	pop	iy
   7E53 FD 7E 08      [19] 2135 	ld	a,8 (iy)
   7E56 B7            [ 4] 2136 	or	a, a
   7E57 C2 2A 7F      [10] 2137 	jp	NZ,00108$
                           2138 ;src/main.c:461: if (!enemy->reversePatrol) {
   7E5A 21 0D 00      [10] 2139 	ld	hl,#0x000D
   7E5D 09            [11] 2140 	add	hl,bc
   7E5E EB            [ 4] 2141 	ex	de,hl
   7E5F 1A            [ 7] 2142 	ld	a,(de)
   7E60 B7            [ 4] 2143 	or	a, a
   7E61 C2 2A 7F      [10] 2144 	jp	NZ,00108$
                           2145 ;src/main.c:462: if(enemy->iter < enemy->longitud_camino - 8){
   7E64 FD 21 0F 00   [14] 2146 	ld	iy,#0x000F
   7E68 FD 09         [15] 2147 	add	iy, bc
   7E6A FD 7E 00      [19] 2148 	ld	a, 0 (iy)
   7E6D DD 77 FF      [19] 2149 	ld	-1 (ix),a
   7E70 69            [ 4] 2150 	ld	l, c
   7E71 60            [ 4] 2151 	ld	h, b
   7E72 C5            [11] 2152 	push	bc
   7E73 01 45 01      [10] 2153 	ld	bc, #0x0145
   7E76 09            [11] 2154 	add	hl, bc
   7E77 C1            [10] 2155 	pop	bc
   7E78 6E            [ 7] 2156 	ld	l,(hl)
   7E79 26 00         [ 7] 2157 	ld	h,#0x00
   7E7B 7D            [ 4] 2158 	ld	a,l
   7E7C C6 F8         [ 7] 2159 	add	a,#0xF8
   7E7E DD 77 FD      [19] 2160 	ld	-3 (ix),a
   7E81 7C            [ 4] 2161 	ld	a,h
   7E82 CE FF         [ 7] 2162 	adc	a,#0xFF
   7E84 DD 77 FE      [19] 2163 	ld	-2 (ix),a
   7E87 DD 6E FF      [19] 2164 	ld	l,-1 (ix)
   7E8A 26 00         [ 7] 2165 	ld	h,#0x00
                           2166 ;src/main.c:465: enemy->y = enemy->camino[enemy->iter];
   7E8C 79            [ 4] 2167 	ld	a,c
   7E8D C6 01         [ 7] 2168 	add	a, #0x01
   7E8F DD 77 FB      [19] 2169 	ld	-5 (ix),a
   7E92 78            [ 4] 2170 	ld	a,b
   7E93 CE 00         [ 7] 2171 	adc	a, #0x00
   7E95 DD 77 FC      [19] 2172 	ld	-4 (ix),a
                           2173 ;src/main.c:462: if(enemy->iter < enemy->longitud_camino - 8){
   7E98 7D            [ 4] 2174 	ld	a,l
   7E99 DD 96 FD      [19] 2175 	sub	a, -3 (ix)
   7E9C 7C            [ 4] 2176 	ld	a,h
   7E9D DD 9E FE      [19] 2177 	sbc	a, -2 (ix)
   7EA0 E2 A5 7E      [10] 2178 	jp	PO, 00122$
   7EA3 EE 80         [ 7] 2179 	xor	a, #0x80
   7EA5                    2180 00122$:
   7EA5 F2 D8 7E      [10] 2181 	jp	P,00102$
                           2182 ;src/main.c:463: enemy->x = enemy->camino[enemy->iter];
   7EA8 21 19 00      [10] 2183 	ld	hl,#0x0019
   7EAB 09            [11] 2184 	add	hl,bc
   7EAC EB            [ 4] 2185 	ex	de,hl
   7EAD DD 6E FF      [19] 2186 	ld	l,-1 (ix)
   7EB0 26 00         [ 7] 2187 	ld	h,#0x00
   7EB2 19            [11] 2188 	add	hl,de
   7EB3 7E            [ 7] 2189 	ld	a,(hl)
   7EB4 02            [ 7] 2190 	ld	(bc),a
                           2191 ;src/main.c:464: enemy->iter++;
   7EB5 FD 7E 00      [19] 2192 	ld	a, 0 (iy)
   7EB8 3C            [ 4] 2193 	inc	a
   7EB9 DD 77 FD      [19] 2194 	ld	-3 (ix), a
   7EBC FD 77 00      [19] 2195 	ld	0 (iy), a
                           2196 ;src/main.c:465: enemy->y = enemy->camino[enemy->iter];
   7EBF DD 6E FD      [19] 2197 	ld	l,-3 (ix)
   7EC2 26 00         [ 7] 2198 	ld	h,#0x00
   7EC4 19            [11] 2199 	add	hl,de
   7EC5 5E            [ 7] 2200 	ld	e,(hl)
   7EC6 E1            [10] 2201 	pop	hl
   7EC7 E5            [11] 2202 	push	hl
   7EC8 73            [ 7] 2203 	ld	(hl),e
                           2204 ;src/main.c:466: enemy->iter++;
   7EC9 DD 5E FD      [19] 2205 	ld	e,-3 (ix)
   7ECC 1C            [ 4] 2206 	inc	e
   7ECD FD 73 00      [19] 2207 	ld	0 (iy), e
                           2208 ;src/main.c:467: enemy->mover = SI;
   7ED0 21 06 00      [10] 2209 	ld	hl,#0x0006
   7ED3 09            [11] 2210 	add	hl,bc
   7ED4 36 01         [10] 2211 	ld	(hl),#0x01
   7ED6 18 52         [12] 2212 	jr	00108$
   7ED8                    2213 00102$:
                           2214 ;src/main.c:470: enemy->reversePatrol = NO;
   7ED8 AF            [ 4] 2215 	xor	a, a
   7ED9 12            [ 7] 2216 	ld	(de),a
                           2217 ;src/main.c:471: enemy->patrolling = 1;
   7EDA 21 0B 00      [10] 2218 	ld	hl,#0x000B
   7EDD 09            [11] 2219 	add	hl,bc
   7EDE 36 01         [10] 2220 	ld	(hl),#0x01
                           2221 ;src/main.c:472: enemy->onPathPatrol = 1;
   7EE0 21 0C 00      [10] 2222 	ld	hl,#0x000C
   7EE3 09            [11] 2223 	add	hl,bc
   7EE4 36 01         [10] 2224 	ld	(hl),#0x01
                           2225 ;src/main.c:473: enemy->seek = 0;
   7EE6 21 14 00      [10] 2226 	ld	hl,#0x0014
   7EE9 09            [11] 2227 	add	hl,bc
   7EEA 36 00         [10] 2228 	ld	(hl),#0x00
                           2229 ;src/main.c:474: enemy->lastIter = enemy->iter - 1;
   7EEC 21 10 00      [10] 2230 	ld	hl,#0x0010
   7EEF 09            [11] 2231 	add	hl,bc
   7EF0 EB            [ 4] 2232 	ex	de,hl
   7EF1 FD 7E 00      [19] 2233 	ld	a, 0 (iy)
   7EF4 C6 FF         [ 7] 2234 	add	a,#0xFF
   7EF6 12            [ 7] 2235 	ld	(de),a
                           2236 ;src/main.c:475: enemy->iter = 0;
   7EF7 FD 36 00 00   [19] 2237 	ld	0 (iy), #0x00
                           2238 ;src/main.c:476: pathFinding(enemy->x, enemy->y, enemy->p_seek_x, enemy->p_seek_y, enemy, mapa);
   7EFB 69            [ 4] 2239 	ld	l, c
   7EFC 60            [ 4] 2240 	ld	h, b
   7EFD 11 18 00      [10] 2241 	ld	de, #0x0018
   7F00 19            [11] 2242 	add	hl, de
   7F01 56            [ 7] 2243 	ld	d,(hl)
   7F02 C5            [11] 2244 	push	bc
   7F03 FD E1         [14] 2245 	pop	iy
   7F05 FD 7E 17      [19] 2246 	ld	a,23 (iy)
   7F08 DD 77 FD      [19] 2247 	ld	-3 (ix),a
   7F0B E1            [10] 2248 	pop	hl
   7F0C E5            [11] 2249 	push	hl
   7F0D 5E            [ 7] 2250 	ld	e,(hl)
   7F0E 0A            [ 7] 2251 	ld	a,(bc)
   7F0F DD 77 FB      [19] 2252 	ld	-5 (ix),a
   7F12 2A 0F 73      [16] 2253 	ld	hl,(_mapa)
   7F15 E5            [11] 2254 	push	hl
   7F16 C5            [11] 2255 	push	bc
   7F17 D5            [11] 2256 	push	de
   7F18 33            [ 6] 2257 	inc	sp
   7F19 DD 56 FD      [19] 2258 	ld	d, -3 (ix)
   7F1C D5            [11] 2259 	push	de
   7F1D DD 7E FB      [19] 2260 	ld	a,-5 (ix)
   7F20 F5            [11] 2261 	push	af
   7F21 33            [ 6] 2262 	inc	sp
   7F22 CD 9A 47      [17] 2263 	call	_pathFinding
   7F25 21 08 00      [10] 2264 	ld	hl,#8
   7F28 39            [11] 2265 	add	hl,sp
   7F29 F9            [ 6] 2266 	ld	sp,hl
   7F2A                    2267 00108$:
   7F2A DD F9         [10] 2268 	ld	sp, ix
   7F2C DD E1         [14] 2269 	pop	ix
   7F2E C9            [10] 2270 	ret
                           2271 ;src/main.c:483: void patrol(TEnemy *enemy) {
                           2272 ;	---------------------------------
                           2273 ; Function patrol
                           2274 ; ---------------------------------
   7F2F                    2275 _patrol::
                           2276 ;src/main.c:484: if (enemy->onPathPatrol) {
   7F2F D1            [10] 2277 	pop	de
   7F30 C1            [10] 2278 	pop	bc
   7F31 C5            [11] 2279 	push	bc
   7F32 D5            [11] 2280 	push	de
   7F33 C5            [11] 2281 	push	bc
   7F34 FD E1         [14] 2282 	pop	iy
   7F36 FD 7E 0C      [19] 2283 	ld	a,12 (iy)
   7F39 B7            [ 4] 2284 	or	a, a
   7F3A C8            [11] 2285 	ret	Z
                           2286 ;src/main.c:485: moverEnemigoPatrol(enemy);
   7F3B C5            [11] 2287 	push	bc
   7F3C CD 16 7C      [17] 2288 	call	_moverEnemigoPatrol
   7F3F F1            [10] 2289 	pop	af
   7F40 C9            [10] 2290 	ret
                           2291 ;src/main.c:489: void seek(TEnemy* actual){
                           2292 ;	---------------------------------
                           2293 ; Function seek
                           2294 ; ---------------------------------
   7F41                    2295 _seek::
                           2296 ;src/main.c:490: moverEnemigoSeek(actual);
   7F41 C1            [10] 2297 	pop	bc
   7F42 E1            [10] 2298 	pop	hl
   7F43 E5            [11] 2299 	push	hl
   7F44 C5            [11] 2300 	push	bc
   7F45 E5            [11] 2301 	push	hl
   7F46 CD 3F 7E      [17] 2302 	call	_moverEnemigoSeek
   7F49 F1            [10] 2303 	pop	af
   7F4A C9            [10] 2304 	ret
                           2305 ;src/main.c:493: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2306 ;	---------------------------------
                           2307 ; Function engage
                           2308 ; ---------------------------------
   7F4B                    2309 _engage::
   7F4B DD E5         [15] 2310 	push	ix
   7F4D DD 21 00 00   [14] 2311 	ld	ix,#0
   7F51 DD 39         [15] 2312 	add	ix,sp
   7F53 21 F3 FF      [10] 2313 	ld	hl,#-13
   7F56 39            [11] 2314 	add	hl,sp
   7F57 F9            [ 6] 2315 	ld	sp,hl
                           2316 ;src/main.c:494: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7F58 DD 7E 04      [19] 2317 	ld	a,4 (ix)
   7F5B DD 77 F7      [19] 2318 	ld	-9 (ix),a
   7F5E DD 7E 05      [19] 2319 	ld	a,5 (ix)
   7F61 DD 77 F8      [19] 2320 	ld	-8 (ix),a
   7F64 DD 6E F7      [19] 2321 	ld	l,-9 (ix)
   7F67 DD 66 F8      [19] 2322 	ld	h,-8 (ix)
   7F6A 4E            [ 7] 2323 	ld	c,(hl)
   7F6B 06 00         [ 7] 2324 	ld	b,#0x00
   7F6D 21 57 6A      [10] 2325 	ld	hl,#_prota+0
   7F70 5E            [ 7] 2326 	ld	e,(hl)
   7F71 16 00         [ 7] 2327 	ld	d,#0x00
   7F73 79            [ 4] 2328 	ld	a,c
   7F74 93            [ 4] 2329 	sub	a, e
   7F75 4F            [ 4] 2330 	ld	c,a
   7F76 78            [ 4] 2331 	ld	a,b
   7F77 9A            [ 4] 2332 	sbc	a, d
   7F78 47            [ 4] 2333 	ld	b,a
   7F79 C5            [11] 2334 	push	bc
   7F7A CD 17 50      [17] 2335 	call	_abs
   7F7D F1            [10] 2336 	pop	af
   7F7E 4D            [ 4] 2337 	ld	c,l
                           2338 ;src/main.c:495: u8 dify = abs(enemy->y - prota.y);
   7F7F DD 7E F7      [19] 2339 	ld	a,-9 (ix)
   7F82 C6 01         [ 7] 2340 	add	a, #0x01
   7F84 DD 77 F9      [19] 2341 	ld	-7 (ix),a
   7F87 DD 7E F8      [19] 2342 	ld	a,-8 (ix)
   7F8A CE 00         [ 7] 2343 	adc	a, #0x00
   7F8C DD 77 FA      [19] 2344 	ld	-6 (ix),a
   7F8F DD 6E F9      [19] 2345 	ld	l,-7 (ix)
   7F92 DD 66 FA      [19] 2346 	ld	h,-6 (ix)
   7F95 5E            [ 7] 2347 	ld	e,(hl)
   7F96 16 00         [ 7] 2348 	ld	d,#0x00
   7F98 21 58 6A      [10] 2349 	ld	hl,#_prota+1
   7F9B 6E            [ 7] 2350 	ld	l,(hl)
   7F9C 26 00         [ 7] 2351 	ld	h,#0x00
   7F9E 7B            [ 4] 2352 	ld	a,e
   7F9F 95            [ 4] 2353 	sub	a, l
   7FA0 5F            [ 4] 2354 	ld	e,a
   7FA1 7A            [ 4] 2355 	ld	a,d
   7FA2 9C            [ 4] 2356 	sbc	a, h
   7FA3 57            [ 4] 2357 	ld	d,a
   7FA4 C5            [11] 2358 	push	bc
   7FA5 D5            [11] 2359 	push	de
   7FA6 CD 17 50      [17] 2360 	call	_abs
   7FA9 F1            [10] 2361 	pop	af
   7FAA C1            [10] 2362 	pop	bc
                           2363 ;src/main.c:496: u8 dist = difx + dify; // manhattan
   7FAB 09            [11] 2364 	add	hl, bc
   7FAC DD 75 F6      [19] 2365 	ld	-10 (ix),l
                           2366 ;src/main.c:498: u8 movX = 0;
   7FAF DD 36 F5 00   [19] 2367 	ld	-11 (ix),#0x00
                           2368 ;src/main.c:499: u8 movY = 0;
   7FB3 DD 36 F4 00   [19] 2369 	ld	-12 (ix),#0x00
                           2370 ;src/main.c:500: u8 mov = 0;
   7FB7 DD 36 F3 00   [19] 2371 	ld	-13 (ix),#0x00
                           2372 ;src/main.c:502: if (enemy->y == dy) { // alineado en el eje x
   7FBB DD 6E F9      [19] 2373 	ld	l,-7 (ix)
   7FBE DD 66 FA      [19] 2374 	ld	h,-6 (ix)
   7FC1 7E            [ 7] 2375 	ld	a,(hl)
   7FC2 DD 77 FB      [19] 2376 	ld	-5 (ix),a
                           2377 ;src/main.c:504: if (dist > 10) {
   7FC5 3E 0A         [ 7] 2378 	ld	a,#0x0A
   7FC7 DD 96 F6      [19] 2379 	sub	a, -10 (ix)
   7FCA 3E 00         [ 7] 2380 	ld	a,#0x00
   7FCC 17            [ 4] 2381 	rla
   7FCD DD 77 FC      [19] 2382 	ld	-4 (ix),a
                           2383 ;src/main.c:502: if (enemy->y == dy) { // alineado en el eje x
   7FD0 DD 7E 07      [19] 2384 	ld	a,7 (ix)
   7FD3 DD 96 FB      [19] 2385 	sub	a, -5 (ix)
   7FD6 C2 D8 80      [10] 2386 	jp	NZ,00187$
                           2387 ;src/main.c:504: if (dist > 10) {
   7FD9 DD 7E FC      [19] 2388 	ld	a,-4 (ix)
   7FDC B7            [ 4] 2389 	or	a, a
   7FDD CA 3C 86      [10] 2390 	jp	Z,00189$
                           2391 ;src/main.c:505: if (dx < enemy->x) { // izquierda
   7FE0 DD 6E F7      [19] 2392 	ld	l,-9 (ix)
   7FE3 DD 66 F8      [19] 2393 	ld	h,-8 (ix)
   7FE6 46            [ 7] 2394 	ld	b,(hl)
   7FE7 DD 7E 06      [19] 2395 	ld	a,6 (ix)
   7FEA 90            [ 4] 2396 	sub	a, b
   7FEB 30 72         [12] 2397 	jr	NC,00110$
                           2398 ;src/main.c:506: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   7FED 05            [ 4] 2399 	dec	b
   7FEE DD 7E FB      [19] 2400 	ld	a,-5 (ix)
   7FF1 F5            [11] 2401 	push	af
   7FF2 33            [ 6] 2402 	inc	sp
   7FF3 C5            [11] 2403 	push	bc
   7FF4 33            [ 6] 2404 	inc	sp
   7FF5 2A 0F 73      [16] 2405 	ld	hl,(_mapa)
   7FF8 E5            [11] 2406 	push	hl
   7FF9 CD D3 4F      [17] 2407 	call	_getTilePtr
   7FFC F1            [10] 2408 	pop	af
   7FFD F1            [10] 2409 	pop	af
   7FFE 4E            [ 7] 2410 	ld	c,(hl)
   7FFF 3E 02         [ 7] 2411 	ld	a,#0x02
   8001 91            [ 4] 2412 	sub	a, c
   8002 DA 3C 86      [10] 2413 	jp	C,00189$
                           2414 ;src/main.c:507: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   8005 DD 6E F9      [19] 2415 	ld	l,-7 (ix)
   8008 DD 66 FA      [19] 2416 	ld	h,-6 (ix)
   800B 7E            [ 7] 2417 	ld	a,(hl)
   800C C6 0B         [ 7] 2418 	add	a, #0x0B
   800E 57            [ 4] 2419 	ld	d,a
   800F DD 6E F7      [19] 2420 	ld	l,-9 (ix)
   8012 DD 66 F8      [19] 2421 	ld	h,-8 (ix)
   8015 46            [ 7] 2422 	ld	b,(hl)
   8016 05            [ 4] 2423 	dec	b
   8017 D5            [11] 2424 	push	de
   8018 33            [ 6] 2425 	inc	sp
   8019 C5            [11] 2426 	push	bc
   801A 33            [ 6] 2427 	inc	sp
   801B 2A 0F 73      [16] 2428 	ld	hl,(_mapa)
   801E E5            [11] 2429 	push	hl
   801F CD D3 4F      [17] 2430 	call	_getTilePtr
   8022 F1            [10] 2431 	pop	af
   8023 F1            [10] 2432 	pop	af
   8024 4E            [ 7] 2433 	ld	c,(hl)
   8025 3E 02         [ 7] 2434 	ld	a,#0x02
   8027 91            [ 4] 2435 	sub	a, c
   8028 DA 3C 86      [10] 2436 	jp	C,00189$
                           2437 ;src/main.c:508: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   802B DD 6E F9      [19] 2438 	ld	l,-7 (ix)
   802E DD 66 FA      [19] 2439 	ld	h,-6 (ix)
   8031 7E            [ 7] 2440 	ld	a,(hl)
   8032 C6 16         [ 7] 2441 	add	a, #0x16
   8034 57            [ 4] 2442 	ld	d,a
   8035 DD 6E F7      [19] 2443 	ld	l,-9 (ix)
   8038 DD 66 F8      [19] 2444 	ld	h,-8 (ix)
   803B 46            [ 7] 2445 	ld	b,(hl)
   803C 05            [ 4] 2446 	dec	b
   803D D5            [11] 2447 	push	de
   803E 33            [ 6] 2448 	inc	sp
   803F C5            [11] 2449 	push	bc
   8040 33            [ 6] 2450 	inc	sp
   8041 2A 0F 73      [16] 2451 	ld	hl,(_mapa)
   8044 E5            [11] 2452 	push	hl
   8045 CD D3 4F      [17] 2453 	call	_getTilePtr
   8048 F1            [10] 2454 	pop	af
   8049 F1            [10] 2455 	pop	af
   804A 4E            [ 7] 2456 	ld	c,(hl)
   804B 3E 02         [ 7] 2457 	ld	a,#0x02
   804D 91            [ 4] 2458 	sub	a, c
   804E DA 3C 86      [10] 2459 	jp	C,00189$
                           2460 ;src/main.c:509: moverEnemigoIzquierda(enemy);
   8051 DD 6E F7      [19] 2461 	ld	l,-9 (ix)
   8054 DD 66 F8      [19] 2462 	ld	h,-8 (ix)
   8057 E5            [11] 2463 	push	hl
   8058 CD B7 7B      [17] 2464 	call	_moverEnemigoIzquierda
   805B F1            [10] 2465 	pop	af
                           2466 ;src/main.c:511: mov = 1;
   805C C3 3C 86      [10] 2467 	jp	00189$
   805F                    2468 00110$:
                           2469 ;src/main.c:514: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   805F 78            [ 4] 2470 	ld	a,b
   8060 C6 05         [ 7] 2471 	add	a, #0x05
   8062 47            [ 4] 2472 	ld	b,a
   8063 DD 7E FB      [19] 2473 	ld	a,-5 (ix)
   8066 F5            [11] 2474 	push	af
   8067 33            [ 6] 2475 	inc	sp
   8068 C5            [11] 2476 	push	bc
   8069 33            [ 6] 2477 	inc	sp
   806A 2A 0F 73      [16] 2478 	ld	hl,(_mapa)
   806D E5            [11] 2479 	push	hl
   806E CD D3 4F      [17] 2480 	call	_getTilePtr
   8071 F1            [10] 2481 	pop	af
   8072 F1            [10] 2482 	pop	af
   8073 4E            [ 7] 2483 	ld	c,(hl)
   8074 3E 02         [ 7] 2484 	ld	a,#0x02
   8076 91            [ 4] 2485 	sub	a, c
   8077 DA 3C 86      [10] 2486 	jp	C,00189$
                           2487 ;src/main.c:515: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   807A DD 6E F9      [19] 2488 	ld	l,-7 (ix)
   807D DD 66 FA      [19] 2489 	ld	h,-6 (ix)
   8080 7E            [ 7] 2490 	ld	a,(hl)
   8081 C6 0B         [ 7] 2491 	add	a, #0x0B
   8083 57            [ 4] 2492 	ld	d,a
   8084 DD 6E F7      [19] 2493 	ld	l,-9 (ix)
   8087 DD 66 F8      [19] 2494 	ld	h,-8 (ix)
   808A 7E            [ 7] 2495 	ld	a,(hl)
   808B C6 05         [ 7] 2496 	add	a, #0x05
   808D 47            [ 4] 2497 	ld	b,a
   808E D5            [11] 2498 	push	de
   808F 33            [ 6] 2499 	inc	sp
   8090 C5            [11] 2500 	push	bc
   8091 33            [ 6] 2501 	inc	sp
   8092 2A 0F 73      [16] 2502 	ld	hl,(_mapa)
   8095 E5            [11] 2503 	push	hl
   8096 CD D3 4F      [17] 2504 	call	_getTilePtr
   8099 F1            [10] 2505 	pop	af
   809A F1            [10] 2506 	pop	af
   809B 4E            [ 7] 2507 	ld	c,(hl)
   809C 3E 02         [ 7] 2508 	ld	a,#0x02
   809E 91            [ 4] 2509 	sub	a, c
   809F DA 3C 86      [10] 2510 	jp	C,00189$
                           2511 ;src/main.c:516: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   80A2 DD 6E F9      [19] 2512 	ld	l,-7 (ix)
   80A5 DD 66 FA      [19] 2513 	ld	h,-6 (ix)
   80A8 7E            [ 7] 2514 	ld	a,(hl)
   80A9 C6 16         [ 7] 2515 	add	a, #0x16
   80AB 57            [ 4] 2516 	ld	d,a
   80AC DD 6E F7      [19] 2517 	ld	l,-9 (ix)
   80AF DD 66 F8      [19] 2518 	ld	h,-8 (ix)
   80B2 7E            [ 7] 2519 	ld	a,(hl)
   80B3 C6 05         [ 7] 2520 	add	a, #0x05
   80B5 47            [ 4] 2521 	ld	b,a
   80B6 D5            [11] 2522 	push	de
   80B7 33            [ 6] 2523 	inc	sp
   80B8 C5            [11] 2524 	push	bc
   80B9 33            [ 6] 2525 	inc	sp
   80BA 2A 0F 73      [16] 2526 	ld	hl,(_mapa)
   80BD E5            [11] 2527 	push	hl
   80BE CD D3 4F      [17] 2528 	call	_getTilePtr
   80C1 F1            [10] 2529 	pop	af
   80C2 F1            [10] 2530 	pop	af
   80C3 4E            [ 7] 2531 	ld	c,(hl)
   80C4 3E 02         [ 7] 2532 	ld	a,#0x02
   80C6 91            [ 4] 2533 	sub	a, c
   80C7 DA 3C 86      [10] 2534 	jp	C,00189$
                           2535 ;src/main.c:517: moverEnemigoDerecha(enemy);
   80CA DD 6E F7      [19] 2536 	ld	l,-9 (ix)
   80CD DD 66 F8      [19] 2537 	ld	h,-8 (ix)
   80D0 E5            [11] 2538 	push	hl
   80D1 CD A7 7B      [17] 2539 	call	_moverEnemigoDerecha
   80D4 F1            [10] 2540 	pop	af
                           2541 ;src/main.c:519: mov = 1;
   80D5 C3 3C 86      [10] 2542 	jp	00189$
   80D8                    2543 00187$:
                           2544 ;src/main.c:524: else if (enemy->x == dx) {
   80D8 DD 6E F7      [19] 2545 	ld	l,-9 (ix)
   80DB DD 66 F8      [19] 2546 	ld	h,-8 (ix)
   80DE 7E            [ 7] 2547 	ld	a,(hl)
   80DF DD 77 FD      [19] 2548 	ld	-3 (ix), a
   80E2 DD 96 06      [19] 2549 	sub	a, 6 (ix)
   80E5 C2 E2 81      [10] 2550 	jp	NZ,00184$
                           2551 ;src/main.c:526: if (dist > 10) {
   80E8 DD 7E FC      [19] 2552 	ld	a,-4 (ix)
   80EB B7            [ 4] 2553 	or	a, a
   80EC CA 3C 86      [10] 2554 	jp	Z,00189$
                           2555 ;src/main.c:527: if (dy < enemy->y) {
   80EF DD 7E 07      [19] 2556 	ld	a,7 (ix)
   80F2 DD 96 FB      [19] 2557 	sub	a, -5 (ix)
   80F5 30 74         [12] 2558 	jr	NC,00123$
                           2559 ;src/main.c:528: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   80F7 DD 46 FB      [19] 2560 	ld	b,-5 (ix)
   80FA 05            [ 4] 2561 	dec	b
   80FB 05            [ 4] 2562 	dec	b
   80FC C5            [11] 2563 	push	bc
   80FD 33            [ 6] 2564 	inc	sp
   80FE DD 7E FD      [19] 2565 	ld	a,-3 (ix)
   8101 F5            [11] 2566 	push	af
   8102 33            [ 6] 2567 	inc	sp
   8103 2A 0F 73      [16] 2568 	ld	hl,(_mapa)
   8106 E5            [11] 2569 	push	hl
   8107 CD D3 4F      [17] 2570 	call	_getTilePtr
   810A F1            [10] 2571 	pop	af
   810B F1            [10] 2572 	pop	af
   810C 4E            [ 7] 2573 	ld	c,(hl)
   810D 3E 02         [ 7] 2574 	ld	a,#0x02
   810F 91            [ 4] 2575 	sub	a, c
   8110 DA 3C 86      [10] 2576 	jp	C,00189$
                           2577 ;src/main.c:529: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   8113 DD 6E F9      [19] 2578 	ld	l,-7 (ix)
   8116 DD 66 FA      [19] 2579 	ld	h,-6 (ix)
   8119 46            [ 7] 2580 	ld	b,(hl)
   811A 05            [ 4] 2581 	dec	b
   811B 05            [ 4] 2582 	dec	b
   811C DD 6E F7      [19] 2583 	ld	l,-9 (ix)
   811F DD 66 F8      [19] 2584 	ld	h,-8 (ix)
   8122 56            [ 7] 2585 	ld	d,(hl)
   8123 14            [ 4] 2586 	inc	d
   8124 14            [ 4] 2587 	inc	d
   8125 4A            [ 4] 2588 	ld	c, d
   8126 C5            [11] 2589 	push	bc
   8127 2A 0F 73      [16] 2590 	ld	hl,(_mapa)
   812A E5            [11] 2591 	push	hl
   812B CD D3 4F      [17] 2592 	call	_getTilePtr
   812E F1            [10] 2593 	pop	af
   812F F1            [10] 2594 	pop	af
   8130 4E            [ 7] 2595 	ld	c,(hl)
   8131 3E 02         [ 7] 2596 	ld	a,#0x02
   8133 91            [ 4] 2597 	sub	a, c
   8134 DA 3C 86      [10] 2598 	jp	C,00189$
                           2599 ;src/main.c:530: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   8137 DD 6E F9      [19] 2600 	ld	l,-7 (ix)
   813A DD 66 FA      [19] 2601 	ld	h,-6 (ix)
   813D 46            [ 7] 2602 	ld	b,(hl)
   813E 05            [ 4] 2603 	dec	b
   813F 05            [ 4] 2604 	dec	b
   8140 DD 6E F7      [19] 2605 	ld	l,-9 (ix)
   8143 DD 66 F8      [19] 2606 	ld	h,-8 (ix)
   8146 7E            [ 7] 2607 	ld	a,(hl)
   8147 C6 04         [ 7] 2608 	add	a, #0x04
   8149 C5            [11] 2609 	push	bc
   814A 33            [ 6] 2610 	inc	sp
   814B F5            [11] 2611 	push	af
   814C 33            [ 6] 2612 	inc	sp
   814D 2A 0F 73      [16] 2613 	ld	hl,(_mapa)
   8150 E5            [11] 2614 	push	hl
   8151 CD D3 4F      [17] 2615 	call	_getTilePtr
   8154 F1            [10] 2616 	pop	af
   8155 F1            [10] 2617 	pop	af
   8156 4E            [ 7] 2618 	ld	c,(hl)
   8157 3E 02         [ 7] 2619 	ld	a,#0x02
   8159 91            [ 4] 2620 	sub	a, c
   815A DA 3C 86      [10] 2621 	jp	C,00189$
                           2622 ;src/main.c:531: moverEnemigoArriba(enemy);
   815D DD 6E F7      [19] 2623 	ld	l,-9 (ix)
   8160 DD 66 F8      [19] 2624 	ld	h,-8 (ix)
   8163 E5            [11] 2625 	push	hl
   8164 CD 69 7B      [17] 2626 	call	_moverEnemigoArriba
   8167 F1            [10] 2627 	pop	af
                           2628 ;src/main.c:533: mov = 1;
   8168 C3 3C 86      [10] 2629 	jp	00189$
   816B                    2630 00123$:
                           2631 ;src/main.c:536: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   816B DD 7E FB      [19] 2632 	ld	a,-5 (ix)
   816E C6 18         [ 7] 2633 	add	a, #0x18
   8170 47            [ 4] 2634 	ld	b,a
   8171 C5            [11] 2635 	push	bc
   8172 33            [ 6] 2636 	inc	sp
   8173 DD 7E FD      [19] 2637 	ld	a,-3 (ix)
   8176 F5            [11] 2638 	push	af
   8177 33            [ 6] 2639 	inc	sp
   8178 2A 0F 73      [16] 2640 	ld	hl,(_mapa)
   817B E5            [11] 2641 	push	hl
   817C CD D3 4F      [17] 2642 	call	_getTilePtr
   817F F1            [10] 2643 	pop	af
   8180 F1            [10] 2644 	pop	af
   8181 4E            [ 7] 2645 	ld	c,(hl)
   8182 3E 02         [ 7] 2646 	ld	a,#0x02
   8184 91            [ 4] 2647 	sub	a, c
   8185 DA 3C 86      [10] 2648 	jp	C,00189$
                           2649 ;src/main.c:537: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   8188 DD 6E F9      [19] 2650 	ld	l,-7 (ix)
   818B DD 66 FA      [19] 2651 	ld	h,-6 (ix)
   818E 7E            [ 7] 2652 	ld	a,(hl)
   818F C6 18         [ 7] 2653 	add	a, #0x18
   8191 47            [ 4] 2654 	ld	b,a
   8192 DD 6E F7      [19] 2655 	ld	l,-9 (ix)
   8195 DD 66 F8      [19] 2656 	ld	h,-8 (ix)
   8198 56            [ 7] 2657 	ld	d,(hl)
   8199 14            [ 4] 2658 	inc	d
   819A 14            [ 4] 2659 	inc	d
   819B 4A            [ 4] 2660 	ld	c, d
   819C C5            [11] 2661 	push	bc
   819D 2A 0F 73      [16] 2662 	ld	hl,(_mapa)
   81A0 E5            [11] 2663 	push	hl
   81A1 CD D3 4F      [17] 2664 	call	_getTilePtr
   81A4 F1            [10] 2665 	pop	af
   81A5 F1            [10] 2666 	pop	af
   81A6 4E            [ 7] 2667 	ld	c,(hl)
   81A7 3E 02         [ 7] 2668 	ld	a,#0x02
   81A9 91            [ 4] 2669 	sub	a, c
   81AA DA 3C 86      [10] 2670 	jp	C,00189$
                           2671 ;src/main.c:538: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   81AD DD 6E F9      [19] 2672 	ld	l,-7 (ix)
   81B0 DD 66 FA      [19] 2673 	ld	h,-6 (ix)
   81B3 7E            [ 7] 2674 	ld	a,(hl)
   81B4 C6 18         [ 7] 2675 	add	a, #0x18
   81B6 47            [ 4] 2676 	ld	b,a
   81B7 DD 6E F7      [19] 2677 	ld	l,-9 (ix)
   81BA DD 66 F8      [19] 2678 	ld	h,-8 (ix)
   81BD 7E            [ 7] 2679 	ld	a,(hl)
   81BE C6 04         [ 7] 2680 	add	a, #0x04
   81C0 C5            [11] 2681 	push	bc
   81C1 33            [ 6] 2682 	inc	sp
   81C2 F5            [11] 2683 	push	af
   81C3 33            [ 6] 2684 	inc	sp
   81C4 2A 0F 73      [16] 2685 	ld	hl,(_mapa)
   81C7 E5            [11] 2686 	push	hl
   81C8 CD D3 4F      [17] 2687 	call	_getTilePtr
   81CB F1            [10] 2688 	pop	af
   81CC F1            [10] 2689 	pop	af
   81CD 4E            [ 7] 2690 	ld	c,(hl)
   81CE 3E 02         [ 7] 2691 	ld	a,#0x02
   81D0 91            [ 4] 2692 	sub	a, c
   81D1 DA 3C 86      [10] 2693 	jp	C,00189$
                           2694 ;src/main.c:539: moverEnemigoAbajo(enemy);
   81D4 DD 6E F7      [19] 2695 	ld	l,-9 (ix)
   81D7 DD 66 F8      [19] 2696 	ld	h,-8 (ix)
   81DA E5            [11] 2697 	push	hl
   81DB CD 88 7B      [17] 2698 	call	_moverEnemigoAbajo
   81DE F1            [10] 2699 	pop	af
                           2700 ;src/main.c:541: mov = 1;
   81DF C3 3C 86      [10] 2701 	jp	00189$
   81E2                    2702 00184$:
                           2703 ;src/main.c:547: if (dist > 20) {
   81E2 3E 14         [ 7] 2704 	ld	a,#0x14
   81E4 DD 96 F6      [19] 2705 	sub	a, -10 (ix)
   81E7 D2 3C 86      [10] 2706 	jp	NC,00189$
                           2707 ;src/main.c:548: if (dx < enemy->x) {
   81EA DD 7E 06      [19] 2708 	ld	a,6 (ix)
   81ED DD 96 FD      [19] 2709 	sub	a, -3 (ix)
   81F0 D2 72 82      [10] 2710 	jp	NC,00136$
                           2711 ;src/main.c:549: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   81F3 DD 46 FD      [19] 2712 	ld	b,-3 (ix)
   81F6 05            [ 4] 2713 	dec	b
   81F7 DD 7E FB      [19] 2714 	ld	a,-5 (ix)
   81FA F5            [11] 2715 	push	af
   81FB 33            [ 6] 2716 	inc	sp
   81FC C5            [11] 2717 	push	bc
   81FD 33            [ 6] 2718 	inc	sp
   81FE 2A 0F 73      [16] 2719 	ld	hl,(_mapa)
   8201 E5            [11] 2720 	push	hl
   8202 CD D3 4F      [17] 2721 	call	_getTilePtr
   8205 F1            [10] 2722 	pop	af
   8206 F1            [10] 2723 	pop	af
   8207 4E            [ 7] 2724 	ld	c,(hl)
   8208 3E 02         [ 7] 2725 	ld	a,#0x02
   820A 91            [ 4] 2726 	sub	a, c
   820B DA EF 82      [10] 2727 	jp	C,00137$
                           2728 ;src/main.c:550: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   820E DD 6E F9      [19] 2729 	ld	l,-7 (ix)
   8211 DD 66 FA      [19] 2730 	ld	h,-6 (ix)
   8214 7E            [ 7] 2731 	ld	a,(hl)
   8215 C6 0B         [ 7] 2732 	add	a, #0x0B
   8217 4F            [ 4] 2733 	ld	c,a
   8218 DD 6E F7      [19] 2734 	ld	l,-9 (ix)
   821B DD 66 F8      [19] 2735 	ld	h,-8 (ix)
   821E 46            [ 7] 2736 	ld	b,(hl)
   821F 05            [ 4] 2737 	dec	b
   8220 79            [ 4] 2738 	ld	a,c
   8221 F5            [11] 2739 	push	af
   8222 33            [ 6] 2740 	inc	sp
   8223 C5            [11] 2741 	push	bc
   8224 33            [ 6] 2742 	inc	sp
   8225 2A 0F 73      [16] 2743 	ld	hl,(_mapa)
   8228 E5            [11] 2744 	push	hl
   8229 CD D3 4F      [17] 2745 	call	_getTilePtr
   822C F1            [10] 2746 	pop	af
   822D F1            [10] 2747 	pop	af
   822E 4E            [ 7] 2748 	ld	c,(hl)
   822F 3E 02         [ 7] 2749 	ld	a,#0x02
   8231 91            [ 4] 2750 	sub	a, c
   8232 DA EF 82      [10] 2751 	jp	C,00137$
                           2752 ;src/main.c:551: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   8235 DD 6E F9      [19] 2753 	ld	l,-7 (ix)
   8238 DD 66 FA      [19] 2754 	ld	h,-6 (ix)
   823B 7E            [ 7] 2755 	ld	a,(hl)
   823C C6 16         [ 7] 2756 	add	a, #0x16
   823E 4F            [ 4] 2757 	ld	c,a
   823F DD 6E F7      [19] 2758 	ld	l,-9 (ix)
   8242 DD 66 F8      [19] 2759 	ld	h,-8 (ix)
   8245 46            [ 7] 2760 	ld	b,(hl)
   8246 05            [ 4] 2761 	dec	b
   8247 79            [ 4] 2762 	ld	a,c
   8248 F5            [11] 2763 	push	af
   8249 33            [ 6] 2764 	inc	sp
   824A C5            [11] 2765 	push	bc
   824B 33            [ 6] 2766 	inc	sp
   824C 2A 0F 73      [16] 2767 	ld	hl,(_mapa)
   824F E5            [11] 2768 	push	hl
   8250 CD D3 4F      [17] 2769 	call	_getTilePtr
   8253 F1            [10] 2770 	pop	af
   8254 F1            [10] 2771 	pop	af
   8255 4E            [ 7] 2772 	ld	c,(hl)
   8256 3E 02         [ 7] 2773 	ld	a,#0x02
   8258 91            [ 4] 2774 	sub	a, c
   8259 DA EF 82      [10] 2775 	jp	C,00137$
                           2776 ;src/main.c:552: moverEnemigoIzquierda(enemy);
   825C DD 6E F7      [19] 2777 	ld	l,-9 (ix)
   825F DD 66 F8      [19] 2778 	ld	h,-8 (ix)
   8262 E5            [11] 2779 	push	hl
   8263 CD B7 7B      [17] 2780 	call	_moverEnemigoIzquierda
   8266 F1            [10] 2781 	pop	af
                           2782 ;src/main.c:553: movX = 1;
   8267 DD 36 F5 01   [19] 2783 	ld	-11 (ix),#0x01
                           2784 ;src/main.c:554: mov = 1;
   826B DD 36 F3 01   [19] 2785 	ld	-13 (ix),#0x01
   826F C3 EF 82      [10] 2786 	jp	00137$
   8272                    2787 00136$:
                           2788 ;src/main.c:557: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   8272 DD 7E FD      [19] 2789 	ld	a,-3 (ix)
   8275 C6 05         [ 7] 2790 	add	a, #0x05
   8277 47            [ 4] 2791 	ld	b,a
   8278 DD 7E FB      [19] 2792 	ld	a,-5 (ix)
   827B F5            [11] 2793 	push	af
   827C 33            [ 6] 2794 	inc	sp
   827D C5            [11] 2795 	push	bc
   827E 33            [ 6] 2796 	inc	sp
   827F 2A 0F 73      [16] 2797 	ld	hl,(_mapa)
   8282 E5            [11] 2798 	push	hl
   8283 CD D3 4F      [17] 2799 	call	_getTilePtr
   8286 F1            [10] 2800 	pop	af
   8287 F1            [10] 2801 	pop	af
   8288 4E            [ 7] 2802 	ld	c,(hl)
   8289 3E 02         [ 7] 2803 	ld	a,#0x02
   828B 91            [ 4] 2804 	sub	a, c
   828C 38 61         [12] 2805 	jr	C,00137$
                           2806 ;src/main.c:558: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   828E DD 6E F9      [19] 2807 	ld	l,-7 (ix)
   8291 DD 66 FA      [19] 2808 	ld	h,-6 (ix)
   8294 7E            [ 7] 2809 	ld	a,(hl)
   8295 C6 0B         [ 7] 2810 	add	a, #0x0B
   8297 57            [ 4] 2811 	ld	d,a
   8298 DD 6E F7      [19] 2812 	ld	l,-9 (ix)
   829B DD 66 F8      [19] 2813 	ld	h,-8 (ix)
   829E 7E            [ 7] 2814 	ld	a,(hl)
   829F C6 05         [ 7] 2815 	add	a, #0x05
   82A1 47            [ 4] 2816 	ld	b,a
   82A2 D5            [11] 2817 	push	de
   82A3 33            [ 6] 2818 	inc	sp
   82A4 C5            [11] 2819 	push	bc
   82A5 33            [ 6] 2820 	inc	sp
   82A6 2A 0F 73      [16] 2821 	ld	hl,(_mapa)
   82A9 E5            [11] 2822 	push	hl
   82AA CD D3 4F      [17] 2823 	call	_getTilePtr
   82AD F1            [10] 2824 	pop	af
   82AE F1            [10] 2825 	pop	af
   82AF 4E            [ 7] 2826 	ld	c,(hl)
   82B0 3E 02         [ 7] 2827 	ld	a,#0x02
   82B2 91            [ 4] 2828 	sub	a, c
   82B3 38 3A         [12] 2829 	jr	C,00137$
                           2830 ;src/main.c:559: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   82B5 DD 6E F9      [19] 2831 	ld	l,-7 (ix)
   82B8 DD 66 FA      [19] 2832 	ld	h,-6 (ix)
   82BB 7E            [ 7] 2833 	ld	a,(hl)
   82BC C6 16         [ 7] 2834 	add	a, #0x16
   82BE 57            [ 4] 2835 	ld	d,a
   82BF DD 6E F7      [19] 2836 	ld	l,-9 (ix)
   82C2 DD 66 F8      [19] 2837 	ld	h,-8 (ix)
   82C5 7E            [ 7] 2838 	ld	a,(hl)
   82C6 C6 05         [ 7] 2839 	add	a, #0x05
   82C8 47            [ 4] 2840 	ld	b,a
   82C9 D5            [11] 2841 	push	de
   82CA 33            [ 6] 2842 	inc	sp
   82CB C5            [11] 2843 	push	bc
   82CC 33            [ 6] 2844 	inc	sp
   82CD 2A 0F 73      [16] 2845 	ld	hl,(_mapa)
   82D0 E5            [11] 2846 	push	hl
   82D1 CD D3 4F      [17] 2847 	call	_getTilePtr
   82D4 F1            [10] 2848 	pop	af
   82D5 F1            [10] 2849 	pop	af
   82D6 4E            [ 7] 2850 	ld	c,(hl)
   82D7 3E 02         [ 7] 2851 	ld	a,#0x02
   82D9 91            [ 4] 2852 	sub	a, c
   82DA 38 13         [12] 2853 	jr	C,00137$
                           2854 ;src/main.c:560: moverEnemigoDerecha(enemy);
   82DC DD 6E F7      [19] 2855 	ld	l,-9 (ix)
   82DF DD 66 F8      [19] 2856 	ld	h,-8 (ix)
   82E2 E5            [11] 2857 	push	hl
   82E3 CD A7 7B      [17] 2858 	call	_moverEnemigoDerecha
   82E6 F1            [10] 2859 	pop	af
                           2860 ;src/main.c:561: movX = 1;
   82E7 DD 36 F5 01   [19] 2861 	ld	-11 (ix),#0x01
                           2862 ;src/main.c:562: mov = 1;
   82EB DD 36 F3 01   [19] 2863 	ld	-13 (ix),#0x01
   82EF                    2864 00137$:
                           2865 ;src/main.c:565: if (dy < enemy->y) {
   82EF DD 6E F9      [19] 2866 	ld	l,-7 (ix)
   82F2 DD 66 FA      [19] 2867 	ld	h,-6 (ix)
   82F5 7E            [ 7] 2868 	ld	a,(hl)
   82F6 DD 77 FD      [19] 2869 	ld	-3 (ix),a
                           2870 ;src/main.c:494: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   82F9 DD 6E F7      [19] 2871 	ld	l,-9 (ix)
   82FC DD 66 F8      [19] 2872 	ld	h,-8 (ix)
   82FF 7E            [ 7] 2873 	ld	a,(hl)
   8300 DD 77 FC      [19] 2874 	ld	-4 (ix),a
                           2875 ;src/main.c:565: if (dy < enemy->y) {
   8303 DD 7E 07      [19] 2876 	ld	a,7 (ix)
   8306 DD 96 FD      [19] 2877 	sub	a, -3 (ix)
   8309 D2 9F 83      [10] 2878 	jp	NC,00147$
                           2879 ;src/main.c:566: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   830C DD 7E FD      [19] 2880 	ld	a,-3 (ix)
   830F C6 FE         [ 7] 2881 	add	a,#0xFE
   8311 DD 77 FB      [19] 2882 	ld	-5 (ix), a
   8314 F5            [11] 2883 	push	af
   8315 33            [ 6] 2884 	inc	sp
   8316 DD 7E FC      [19] 2885 	ld	a,-4 (ix)
   8319 F5            [11] 2886 	push	af
   831A 33            [ 6] 2887 	inc	sp
   831B 2A 0F 73      [16] 2888 	ld	hl,(_mapa)
   831E E5            [11] 2889 	push	hl
   831F CD D3 4F      [17] 2890 	call	_getTilePtr
   8322 F1            [10] 2891 	pop	af
   8323 F1            [10] 2892 	pop	af
   8324 DD 74 FF      [19] 2893 	ld	-1 (ix),h
   8327 DD 75 FE      [19] 2894 	ld	-2 (ix), l
   832A DD 66 FF      [19] 2895 	ld	h,-1 (ix)
   832D 4E            [ 7] 2896 	ld	c,(hl)
   832E 3E 02         [ 7] 2897 	ld	a,#0x02
   8330 91            [ 4] 2898 	sub	a, c
   8331 DA 1A 84      [10] 2899 	jp	C,00148$
                           2900 ;src/main.c:567: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   8334 DD 6E F9      [19] 2901 	ld	l,-7 (ix)
   8337 DD 66 FA      [19] 2902 	ld	h,-6 (ix)
   833A 7E            [ 7] 2903 	ld	a,(hl)
   833B DD 77 FE      [19] 2904 	ld	-2 (ix), a
   833E C6 FE         [ 7] 2905 	add	a,#0xFE
   8340 DD 77 FE      [19] 2906 	ld	-2 (ix),a
   8343 DD 6E F7      [19] 2907 	ld	l,-9 (ix)
   8346 DD 66 F8      [19] 2908 	ld	h,-8 (ix)
   8349 46            [ 7] 2909 	ld	b,(hl)
   834A 04            [ 4] 2910 	inc	b
   834B 04            [ 4] 2911 	inc	b
   834C DD 7E FE      [19] 2912 	ld	a,-2 (ix)
   834F F5            [11] 2913 	push	af
   8350 33            [ 6] 2914 	inc	sp
   8351 C5            [11] 2915 	push	bc
   8352 33            [ 6] 2916 	inc	sp
   8353 2A 0F 73      [16] 2917 	ld	hl,(_mapa)
   8356 E5            [11] 2918 	push	hl
   8357 CD D3 4F      [17] 2919 	call	_getTilePtr
   835A F1            [10] 2920 	pop	af
   835B F1            [10] 2921 	pop	af
   835C 4E            [ 7] 2922 	ld	c,(hl)
   835D 3E 02         [ 7] 2923 	ld	a,#0x02
   835F 91            [ 4] 2924 	sub	a, c
   8360 DA 1A 84      [10] 2925 	jp	C,00148$
                           2926 ;src/main.c:568: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   8363 DD 6E F9      [19] 2927 	ld	l,-7 (ix)
   8366 DD 66 FA      [19] 2928 	ld	h,-6 (ix)
   8369 46            [ 7] 2929 	ld	b,(hl)
   836A 05            [ 4] 2930 	dec	b
   836B 05            [ 4] 2931 	dec	b
   836C DD 6E F7      [19] 2932 	ld	l,-9 (ix)
   836F DD 66 F8      [19] 2933 	ld	h,-8 (ix)
   8372 7E            [ 7] 2934 	ld	a,(hl)
   8373 C6 04         [ 7] 2935 	add	a, #0x04
   8375 C5            [11] 2936 	push	bc
   8376 33            [ 6] 2937 	inc	sp
   8377 F5            [11] 2938 	push	af
   8378 33            [ 6] 2939 	inc	sp
   8379 2A 0F 73      [16] 2940 	ld	hl,(_mapa)
   837C E5            [11] 2941 	push	hl
   837D CD D3 4F      [17] 2942 	call	_getTilePtr
   8380 F1            [10] 2943 	pop	af
   8381 F1            [10] 2944 	pop	af
   8382 4E            [ 7] 2945 	ld	c,(hl)
   8383 3E 02         [ 7] 2946 	ld	a,#0x02
   8385 91            [ 4] 2947 	sub	a, c
   8386 DA 1A 84      [10] 2948 	jp	C,00148$
                           2949 ;src/main.c:569: moverEnemigoArriba(enemy);
   8389 DD 6E F7      [19] 2950 	ld	l,-9 (ix)
   838C DD 66 F8      [19] 2951 	ld	h,-8 (ix)
   838F E5            [11] 2952 	push	hl
   8390 CD 69 7B      [17] 2953 	call	_moverEnemigoArriba
   8393 F1            [10] 2954 	pop	af
                           2955 ;src/main.c:570: movY = 1;
   8394 DD 36 F4 01   [19] 2956 	ld	-12 (ix),#0x01
                           2957 ;src/main.c:571: mov = 1;
   8398 DD 36 F3 01   [19] 2958 	ld	-13 (ix),#0x01
   839C C3 1A 84      [10] 2959 	jp	00148$
   839F                    2960 00147$:
                           2961 ;src/main.c:574: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   839F DD 7E FD      [19] 2962 	ld	a,-3 (ix)
   83A2 C6 18         [ 7] 2963 	add	a, #0x18
   83A4 47            [ 4] 2964 	ld	b,a
   83A5 C5            [11] 2965 	push	bc
   83A6 33            [ 6] 2966 	inc	sp
   83A7 DD 7E FC      [19] 2967 	ld	a,-4 (ix)
   83AA F5            [11] 2968 	push	af
   83AB 33            [ 6] 2969 	inc	sp
   83AC 2A 0F 73      [16] 2970 	ld	hl,(_mapa)
   83AF E5            [11] 2971 	push	hl
   83B0 CD D3 4F      [17] 2972 	call	_getTilePtr
   83B3 F1            [10] 2973 	pop	af
   83B4 F1            [10] 2974 	pop	af
   83B5 4E            [ 7] 2975 	ld	c,(hl)
   83B6 3E 02         [ 7] 2976 	ld	a,#0x02
   83B8 91            [ 4] 2977 	sub	a, c
   83B9 38 5F         [12] 2978 	jr	C,00148$
                           2979 ;src/main.c:575: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   83BB DD 6E F9      [19] 2980 	ld	l,-7 (ix)
   83BE DD 66 FA      [19] 2981 	ld	h,-6 (ix)
   83C1 7E            [ 7] 2982 	ld	a,(hl)
   83C2 C6 18         [ 7] 2983 	add	a, #0x18
   83C4 57            [ 4] 2984 	ld	d,a
   83C5 DD 6E F7      [19] 2985 	ld	l,-9 (ix)
   83C8 DD 66 F8      [19] 2986 	ld	h,-8 (ix)
   83CB 46            [ 7] 2987 	ld	b,(hl)
   83CC 04            [ 4] 2988 	inc	b
   83CD 04            [ 4] 2989 	inc	b
   83CE D5            [11] 2990 	push	de
   83CF 33            [ 6] 2991 	inc	sp
   83D0 C5            [11] 2992 	push	bc
   83D1 33            [ 6] 2993 	inc	sp
   83D2 2A 0F 73      [16] 2994 	ld	hl,(_mapa)
   83D5 E5            [11] 2995 	push	hl
   83D6 CD D3 4F      [17] 2996 	call	_getTilePtr
   83D9 F1            [10] 2997 	pop	af
   83DA F1            [10] 2998 	pop	af
   83DB 4E            [ 7] 2999 	ld	c,(hl)
   83DC 3E 02         [ 7] 3000 	ld	a,#0x02
   83DE 91            [ 4] 3001 	sub	a, c
   83DF 38 39         [12] 3002 	jr	C,00148$
                           3003 ;src/main.c:576: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   83E1 DD 6E F9      [19] 3004 	ld	l,-7 (ix)
   83E4 DD 66 FA      [19] 3005 	ld	h,-6 (ix)
   83E7 7E            [ 7] 3006 	ld	a,(hl)
   83E8 C6 18         [ 7] 3007 	add	a, #0x18
   83EA 47            [ 4] 3008 	ld	b,a
   83EB DD 6E F7      [19] 3009 	ld	l,-9 (ix)
   83EE DD 66 F8      [19] 3010 	ld	h,-8 (ix)
   83F1 7E            [ 7] 3011 	ld	a,(hl)
   83F2 C6 04         [ 7] 3012 	add	a, #0x04
   83F4 C5            [11] 3013 	push	bc
   83F5 33            [ 6] 3014 	inc	sp
   83F6 F5            [11] 3015 	push	af
   83F7 33            [ 6] 3016 	inc	sp
   83F8 2A 0F 73      [16] 3017 	ld	hl,(_mapa)
   83FB E5            [11] 3018 	push	hl
   83FC CD D3 4F      [17] 3019 	call	_getTilePtr
   83FF F1            [10] 3020 	pop	af
   8400 F1            [10] 3021 	pop	af
   8401 4E            [ 7] 3022 	ld	c,(hl)
   8402 3E 02         [ 7] 3023 	ld	a,#0x02
   8404 91            [ 4] 3024 	sub	a, c
   8405 38 13         [12] 3025 	jr	C,00148$
                           3026 ;src/main.c:577: moverEnemigoAbajo(enemy);
   8407 DD 6E F7      [19] 3027 	ld	l,-9 (ix)
   840A DD 66 F8      [19] 3028 	ld	h,-8 (ix)
   840D E5            [11] 3029 	push	hl
   840E CD 88 7B      [17] 3030 	call	_moverEnemigoAbajo
   8411 F1            [10] 3031 	pop	af
                           3032 ;src/main.c:578: movY = 1;
   8412 DD 36 F4 01   [19] 3033 	ld	-12 (ix),#0x01
                           3034 ;src/main.c:579: mov = 1;
   8416 DD 36 F3 01   [19] 3035 	ld	-13 (ix),#0x01
   841A                    3036 00148$:
                           3037 ;src/main.c:582: if (!mov) {
   841A DD 7E F3      [19] 3038 	ld	a,-13 (ix)
   841D B7            [ 4] 3039 	or	a, a
   841E C2 3C 86      [10] 3040 	jp	NZ,00189$
                           3041 ;src/main.c:583: if (!movX) {
   8421 DD 7E F5      [19] 3042 	ld	a,-11 (ix)
   8424 B7            [ 4] 3043 	or	a, a
   8425 C2 2C 85      [10] 3044 	jp	NZ,00163$
                           3045 ;src/main.c:584: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   8428 DD 6E F9      [19] 3046 	ld	l,-7 (ix)
   842B DD 66 FA      [19] 3047 	ld	h,-6 (ix)
   842E 5E            [ 7] 3048 	ld	e,(hl)
                           3049 ;src/main.c:494: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   842F DD 6E F7      [19] 3050 	ld	l,-9 (ix)
   8432 DD 66 F8      [19] 3051 	ld	h,-8 (ix)
   8435 4E            [ 7] 3052 	ld	c,(hl)
                           3053 ;src/main.c:584: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   8436 3E 70         [ 7] 3054 	ld	a,#0x70
   8438 93            [ 4] 3055 	sub	a, e
   8439 30 7C         [12] 3056 	jr	NC,00160$
                           3057 ;src/main.c:585: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   843B 7B            [ 4] 3058 	ld	a,e
   843C C6 18         [ 7] 3059 	add	a, #0x18
   843E 47            [ 4] 3060 	ld	b,a
   843F C5            [11] 3061 	push	bc
   8440 2A 0F 73      [16] 3062 	ld	hl,(_mapa)
   8443 E5            [11] 3063 	push	hl
   8444 CD D3 4F      [17] 3064 	call	_getTilePtr
   8447 F1            [10] 3065 	pop	af
   8448 F1            [10] 3066 	pop	af
   8449 4E            [ 7] 3067 	ld	c,(hl)
   844A 3E 02         [ 7] 3068 	ld	a,#0x02
   844C 91            [ 4] 3069 	sub	a, c
   844D 38 5B         [12] 3070 	jr	C,00150$
                           3071 ;src/main.c:586: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   844F DD 6E F9      [19] 3072 	ld	l,-7 (ix)
   8452 DD 66 FA      [19] 3073 	ld	h,-6 (ix)
   8455 7E            [ 7] 3074 	ld	a,(hl)
   8456 C6 18         [ 7] 3075 	add	a, #0x18
   8458 57            [ 4] 3076 	ld	d,a
   8459 DD 6E F7      [19] 3077 	ld	l,-9 (ix)
   845C DD 66 F8      [19] 3078 	ld	h,-8 (ix)
   845F 4E            [ 7] 3079 	ld	c,(hl)
   8460 41            [ 4] 3080 	ld	b,c
   8461 04            [ 4] 3081 	inc	b
   8462 04            [ 4] 3082 	inc	b
   8463 D5            [11] 3083 	push	de
   8464 33            [ 6] 3084 	inc	sp
   8465 C5            [11] 3085 	push	bc
   8466 33            [ 6] 3086 	inc	sp
   8467 2A 0F 73      [16] 3087 	ld	hl,(_mapa)
   846A E5            [11] 3088 	push	hl
   846B CD D3 4F      [17] 3089 	call	_getTilePtr
   846E F1            [10] 3090 	pop	af
   846F F1            [10] 3091 	pop	af
   8470 4E            [ 7] 3092 	ld	c,(hl)
   8471 3E 02         [ 7] 3093 	ld	a,#0x02
   8473 91            [ 4] 3094 	sub	a, c
   8474 38 34         [12] 3095 	jr	C,00150$
                           3096 ;src/main.c:587: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   8476 DD 6E F9      [19] 3097 	ld	l,-7 (ix)
   8479 DD 66 FA      [19] 3098 	ld	h,-6 (ix)
   847C 7E            [ 7] 3099 	ld	a,(hl)
   847D C6 18         [ 7] 3100 	add	a, #0x18
   847F 47            [ 4] 3101 	ld	b,a
   8480 DD 6E F7      [19] 3102 	ld	l,-9 (ix)
   8483 DD 66 F8      [19] 3103 	ld	h,-8 (ix)
   8486 7E            [ 7] 3104 	ld	a,(hl)
   8487 C6 04         [ 7] 3105 	add	a, #0x04
   8489 C5            [11] 3106 	push	bc
   848A 33            [ 6] 3107 	inc	sp
   848B F5            [11] 3108 	push	af
   848C 33            [ 6] 3109 	inc	sp
   848D 2A 0F 73      [16] 3110 	ld	hl,(_mapa)
   8490 E5            [11] 3111 	push	hl
   8491 CD D3 4F      [17] 3112 	call	_getTilePtr
   8494 F1            [10] 3113 	pop	af
   8495 F1            [10] 3114 	pop	af
   8496 4E            [ 7] 3115 	ld	c,(hl)
   8497 3E 02         [ 7] 3116 	ld	a,#0x02
   8499 91            [ 4] 3117 	sub	a, c
   849A 38 0E         [12] 3118 	jr	C,00150$
                           3119 ;src/main.c:588: moverEnemigoAbajo(enemy);
   849C DD 6E F7      [19] 3120 	ld	l,-9 (ix)
   849F DD 66 F8      [19] 3121 	ld	h,-8 (ix)
   84A2 E5            [11] 3122 	push	hl
   84A3 CD 88 7B      [17] 3123 	call	_moverEnemigoAbajo
   84A6 F1            [10] 3124 	pop	af
   84A7 C3 2C 85      [10] 3125 	jp	00163$
   84AA                    3126 00150$:
                           3127 ;src/main.c:590: moverEnemigoArriba(enemy);
   84AA DD 6E F7      [19] 3128 	ld	l,-9 (ix)
   84AD DD 66 F8      [19] 3129 	ld	h,-8 (ix)
   84B0 E5            [11] 3130 	push	hl
   84B1 CD 69 7B      [17] 3131 	call	_moverEnemigoArriba
   84B4 F1            [10] 3132 	pop	af
   84B5 18 75         [12] 3133 	jr	00163$
   84B7                    3134 00160$:
                           3135 ;src/main.c:592: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   84B7 43            [ 4] 3136 	ld	b,e
   84B8 05            [ 4] 3137 	dec	b
   84B9 05            [ 4] 3138 	dec	b
   84BA C5            [11] 3139 	push	bc
   84BB 2A 0F 73      [16] 3140 	ld	hl,(_mapa)
   84BE E5            [11] 3141 	push	hl
   84BF CD D3 4F      [17] 3142 	call	_getTilePtr
   84C2 F1            [10] 3143 	pop	af
   84C3 F1            [10] 3144 	pop	af
   84C4 4E            [ 7] 3145 	ld	c,(hl)
   84C5 3E 02         [ 7] 3146 	ld	a,#0x02
   84C7 91            [ 4] 3147 	sub	a, c
   84C8 38 57         [12] 3148 	jr	C,00155$
                           3149 ;src/main.c:593: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   84CA DD 6E F9      [19] 3150 	ld	l,-7 (ix)
   84CD DD 66 FA      [19] 3151 	ld	h,-6 (ix)
   84D0 56            [ 7] 3152 	ld	d,(hl)
   84D1 15            [ 4] 3153 	dec	d
   84D2 15            [ 4] 3154 	dec	d
   84D3 DD 6E F7      [19] 3155 	ld	l,-9 (ix)
   84D6 DD 66 F8      [19] 3156 	ld	h,-8 (ix)
   84D9 46            [ 7] 3157 	ld	b,(hl)
   84DA 04            [ 4] 3158 	inc	b
   84DB 04            [ 4] 3159 	inc	b
   84DC D5            [11] 3160 	push	de
   84DD 33            [ 6] 3161 	inc	sp
   84DE C5            [11] 3162 	push	bc
   84DF 33            [ 6] 3163 	inc	sp
   84E0 2A 0F 73      [16] 3164 	ld	hl,(_mapa)
   84E3 E5            [11] 3165 	push	hl
   84E4 CD D3 4F      [17] 3166 	call	_getTilePtr
   84E7 F1            [10] 3167 	pop	af
   84E8 F1            [10] 3168 	pop	af
   84E9 4E            [ 7] 3169 	ld	c,(hl)
   84EA 3E 02         [ 7] 3170 	ld	a,#0x02
   84EC 91            [ 4] 3171 	sub	a, c
   84ED 38 32         [12] 3172 	jr	C,00155$
                           3173 ;src/main.c:594: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   84EF DD 6E F9      [19] 3174 	ld	l,-7 (ix)
   84F2 DD 66 FA      [19] 3175 	ld	h,-6 (ix)
   84F5 46            [ 7] 3176 	ld	b,(hl)
   84F6 05            [ 4] 3177 	dec	b
   84F7 05            [ 4] 3178 	dec	b
   84F8 DD 6E F7      [19] 3179 	ld	l,-9 (ix)
   84FB DD 66 F8      [19] 3180 	ld	h,-8 (ix)
   84FE 7E            [ 7] 3181 	ld	a,(hl)
   84FF C6 04         [ 7] 3182 	add	a, #0x04
   8501 C5            [11] 3183 	push	bc
   8502 33            [ 6] 3184 	inc	sp
   8503 F5            [11] 3185 	push	af
   8504 33            [ 6] 3186 	inc	sp
   8505 2A 0F 73      [16] 3187 	ld	hl,(_mapa)
   8508 E5            [11] 3188 	push	hl
   8509 CD D3 4F      [17] 3189 	call	_getTilePtr
   850C F1            [10] 3190 	pop	af
   850D F1            [10] 3191 	pop	af
   850E 4E            [ 7] 3192 	ld	c,(hl)
   850F 3E 02         [ 7] 3193 	ld	a,#0x02
   8511 91            [ 4] 3194 	sub	a, c
   8512 38 0D         [12] 3195 	jr	C,00155$
                           3196 ;src/main.c:595: moverEnemigoArriba(enemy);
   8514 DD 6E F7      [19] 3197 	ld	l,-9 (ix)
   8517 DD 66 F8      [19] 3198 	ld	h,-8 (ix)
   851A E5            [11] 3199 	push	hl
   851B CD 69 7B      [17] 3200 	call	_moverEnemigoArriba
   851E F1            [10] 3201 	pop	af
   851F 18 0B         [12] 3202 	jr	00163$
   8521                    3203 00155$:
                           3204 ;src/main.c:597: moverEnemigoAbajo(enemy);
   8521 DD 6E F7      [19] 3205 	ld	l,-9 (ix)
   8524 DD 66 F8      [19] 3206 	ld	h,-8 (ix)
   8527 E5            [11] 3207 	push	hl
   8528 CD 88 7B      [17] 3208 	call	_moverEnemigoAbajo
   852B F1            [10] 3209 	pop	af
   852C                    3210 00163$:
                           3211 ;src/main.c:601: if (!movY) {
   852C DD 7E F4      [19] 3212 	ld	a,-12 (ix)
   852F B7            [ 4] 3213 	or	a, a
   8530 C2 3C 86      [10] 3214 	jp	NZ,00189$
                           3215 ;src/main.c:602: if (enemy->x < ANCHO_PANTALLA/2) {
   8533 DD 6E F7      [19] 3216 	ld	l,-9 (ix)
   8536 DD 66 F8      [19] 3217 	ld	h,-8 (ix)
   8539 4E            [ 7] 3218 	ld	c,(hl)
                           3219 ;src/main.c:495: u8 dify = abs(enemy->y - prota.y);
   853A DD 6E F9      [19] 3220 	ld	l,-7 (ix)
   853D DD 66 FA      [19] 3221 	ld	h,-6 (ix)
   8540 5E            [ 7] 3222 	ld	e,(hl)
                           3223 ;src/main.c:602: if (enemy->x < ANCHO_PANTALLA/2) {
   8541 79            [ 4] 3224 	ld	a,c
   8542 D6 28         [ 7] 3225 	sub	a, #0x28
   8544 D2 C4 85      [10] 3226 	jp	NC,00175$
                           3227 ;src/main.c:603: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   8547 41            [ 4] 3228 	ld	b,c
   8548 05            [ 4] 3229 	dec	b
   8549 7B            [ 4] 3230 	ld	a,e
   854A F5            [11] 3231 	push	af
   854B 33            [ 6] 3232 	inc	sp
   854C C5            [11] 3233 	push	bc
   854D 33            [ 6] 3234 	inc	sp
   854E 2A 0F 73      [16] 3235 	ld	hl,(_mapa)
   8551 E5            [11] 3236 	push	hl
   8552 CD D3 4F      [17] 3237 	call	_getTilePtr
   8555 F1            [10] 3238 	pop	af
   8556 F1            [10] 3239 	pop	af
   8557 4E            [ 7] 3240 	ld	c,(hl)
   8558 3E 02         [ 7] 3241 	ld	a,#0x02
   855A 91            [ 4] 3242 	sub	a, c
   855B 38 5A         [12] 3243 	jr	C,00165$
                           3244 ;src/main.c:604: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   855D DD 6E F9      [19] 3245 	ld	l,-7 (ix)
   8560 DD 66 FA      [19] 3246 	ld	h,-6 (ix)
   8563 7E            [ 7] 3247 	ld	a,(hl)
   8564 C6 0B         [ 7] 3248 	add	a, #0x0B
   8566 4F            [ 4] 3249 	ld	c,a
   8567 DD 6E F7      [19] 3250 	ld	l,-9 (ix)
   856A DD 66 F8      [19] 3251 	ld	h,-8 (ix)
   856D 46            [ 7] 3252 	ld	b,(hl)
   856E 05            [ 4] 3253 	dec	b
   856F 79            [ 4] 3254 	ld	a,c
   8570 F5            [11] 3255 	push	af
   8571 33            [ 6] 3256 	inc	sp
   8572 C5            [11] 3257 	push	bc
   8573 33            [ 6] 3258 	inc	sp
   8574 2A 0F 73      [16] 3259 	ld	hl,(_mapa)
   8577 E5            [11] 3260 	push	hl
   8578 CD D3 4F      [17] 3261 	call	_getTilePtr
   857B F1            [10] 3262 	pop	af
   857C F1            [10] 3263 	pop	af
   857D 4E            [ 7] 3264 	ld	c,(hl)
   857E 3E 02         [ 7] 3265 	ld	a,#0x02
   8580 91            [ 4] 3266 	sub	a, c
   8581 38 34         [12] 3267 	jr	C,00165$
                           3268 ;src/main.c:605: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   8583 DD 6E F9      [19] 3269 	ld	l,-7 (ix)
   8586 DD 66 FA      [19] 3270 	ld	h,-6 (ix)
   8589 7E            [ 7] 3271 	ld	a,(hl)
   858A C6 16         [ 7] 3272 	add	a, #0x16
   858C 4F            [ 4] 3273 	ld	c,a
   858D DD 6E F7      [19] 3274 	ld	l,-9 (ix)
   8590 DD 66 F8      [19] 3275 	ld	h,-8 (ix)
   8593 46            [ 7] 3276 	ld	b,(hl)
   8594 05            [ 4] 3277 	dec	b
   8595 79            [ 4] 3278 	ld	a,c
   8596 F5            [11] 3279 	push	af
   8597 33            [ 6] 3280 	inc	sp
   8598 C5            [11] 3281 	push	bc
   8599 33            [ 6] 3282 	inc	sp
   859A 2A 0F 73      [16] 3283 	ld	hl,(_mapa)
   859D E5            [11] 3284 	push	hl
   859E CD D3 4F      [17] 3285 	call	_getTilePtr
   85A1 F1            [10] 3286 	pop	af
   85A2 F1            [10] 3287 	pop	af
   85A3 4E            [ 7] 3288 	ld	c,(hl)
   85A4 3E 02         [ 7] 3289 	ld	a,#0x02
   85A6 91            [ 4] 3290 	sub	a, c
   85A7 38 0E         [12] 3291 	jr	C,00165$
                           3292 ;src/main.c:606: moverEnemigoIzquierda(enemy);
   85A9 DD 6E F7      [19] 3293 	ld	l,-9 (ix)
   85AC DD 66 F8      [19] 3294 	ld	h,-8 (ix)
   85AF E5            [11] 3295 	push	hl
   85B0 CD B7 7B      [17] 3296 	call	_moverEnemigoIzquierda
   85B3 F1            [10] 3297 	pop	af
   85B4 C3 3C 86      [10] 3298 	jp	00189$
   85B7                    3299 00165$:
                           3300 ;src/main.c:608: moverEnemigoDerecha(enemy);
   85B7 DD 6E F7      [19] 3301 	ld	l,-9 (ix)
   85BA DD 66 F8      [19] 3302 	ld	h,-8 (ix)
   85BD E5            [11] 3303 	push	hl
   85BE CD A7 7B      [17] 3304 	call	_moverEnemigoDerecha
   85C1 F1            [10] 3305 	pop	af
   85C2 18 78         [12] 3306 	jr	00189$
   85C4                    3307 00175$:
                           3308 ;src/main.c:611: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   85C4 79            [ 4] 3309 	ld	a,c
   85C5 C6 05         [ 7] 3310 	add	a, #0x05
   85C7 47            [ 4] 3311 	ld	b,a
   85C8 7B            [ 4] 3312 	ld	a,e
   85C9 F5            [11] 3313 	push	af
   85CA 33            [ 6] 3314 	inc	sp
   85CB C5            [11] 3315 	push	bc
   85CC 33            [ 6] 3316 	inc	sp
   85CD 2A 0F 73      [16] 3317 	ld	hl,(_mapa)
   85D0 E5            [11] 3318 	push	hl
   85D1 CD D3 4F      [17] 3319 	call	_getTilePtr
   85D4 F1            [10] 3320 	pop	af
   85D5 F1            [10] 3321 	pop	af
   85D6 4E            [ 7] 3322 	ld	c,(hl)
   85D7 3E 02         [ 7] 3323 	ld	a,#0x02
   85D9 91            [ 4] 3324 	sub	a, c
   85DA 38 55         [12] 3325 	jr	C,00170$
                           3326 ;src/main.c:612: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   85DC DD 6E F9      [19] 3327 	ld	l,-7 (ix)
   85DF DD 66 FA      [19] 3328 	ld	h,-6 (ix)
   85E2 7E            [ 7] 3329 	ld	a,(hl)
   85E3 C6 0B         [ 7] 3330 	add	a, #0x0B
   85E5 47            [ 4] 3331 	ld	b,a
   85E6 DD 6E F7      [19] 3332 	ld	l,-9 (ix)
   85E9 DD 66 F8      [19] 3333 	ld	h,-8 (ix)
   85EC 7E            [ 7] 3334 	ld	a,(hl)
   85ED C6 05         [ 7] 3335 	add	a, #0x05
   85EF 4F            [ 4] 3336 	ld	c,a
   85F0 C5            [11] 3337 	push	bc
   85F1 2A 0F 73      [16] 3338 	ld	hl,(_mapa)
   85F4 E5            [11] 3339 	push	hl
   85F5 CD D3 4F      [17] 3340 	call	_getTilePtr
   85F8 F1            [10] 3341 	pop	af
   85F9 F1            [10] 3342 	pop	af
   85FA 4E            [ 7] 3343 	ld	c,(hl)
   85FB 3E 02         [ 7] 3344 	ld	a,#0x02
   85FD 91            [ 4] 3345 	sub	a, c
   85FE 38 31         [12] 3346 	jr	C,00170$
                           3347 ;src/main.c:613: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   8600 DD 6E F9      [19] 3348 	ld	l,-7 (ix)
   8603 DD 66 FA      [19] 3349 	ld	h,-6 (ix)
   8606 7E            [ 7] 3350 	ld	a,(hl)
   8607 C6 16         [ 7] 3351 	add	a, #0x16
   8609 47            [ 4] 3352 	ld	b,a
   860A DD 6E F7      [19] 3353 	ld	l,-9 (ix)
   860D DD 66 F8      [19] 3354 	ld	h,-8 (ix)
   8610 7E            [ 7] 3355 	ld	a,(hl)
   8611 C6 05         [ 7] 3356 	add	a, #0x05
   8613 4F            [ 4] 3357 	ld	c,a
   8614 C5            [11] 3358 	push	bc
   8615 2A 0F 73      [16] 3359 	ld	hl,(_mapa)
   8618 E5            [11] 3360 	push	hl
   8619 CD D3 4F      [17] 3361 	call	_getTilePtr
   861C F1            [10] 3362 	pop	af
   861D F1            [10] 3363 	pop	af
   861E 4E            [ 7] 3364 	ld	c,(hl)
   861F 3E 02         [ 7] 3365 	ld	a,#0x02
   8621 91            [ 4] 3366 	sub	a, c
   8622 38 0D         [12] 3367 	jr	C,00170$
                           3368 ;src/main.c:614: moverEnemigoDerecha(enemy);
   8624 DD 6E F7      [19] 3369 	ld	l,-9 (ix)
   8627 DD 66 F8      [19] 3370 	ld	h,-8 (ix)
   862A E5            [11] 3371 	push	hl
   862B CD A7 7B      [17] 3372 	call	_moverEnemigoDerecha
   862E F1            [10] 3373 	pop	af
   862F 18 0B         [12] 3374 	jr	00189$
   8631                    3375 00170$:
                           3376 ;src/main.c:617: moverEnemigoIzquierda(enemy);
   8631 DD 6E F7      [19] 3377 	ld	l,-9 (ix)
   8634 DD 66 F8      [19] 3378 	ld	h,-8 (ix)
   8637 E5            [11] 3379 	push	hl
   8638 CD B7 7B      [17] 3380 	call	_moverEnemigoIzquierda
   863B F1            [10] 3381 	pop	af
   863C                    3382 00189$:
   863C DD F9         [10] 3383 	ld	sp, ix
   863E DD E1         [14] 3384 	pop	ix
   8640 C9            [10] 3385 	ret
                           3386 ;src/main.c:626: void updateEnemies() { // maquina de estados
                           3387 ;	---------------------------------
                           3388 ; Function updateEnemies
                           3389 ; ---------------------------------
   8641                    3390 _updateEnemies::
   8641 DD E5         [15] 3391 	push	ix
   8643 DD 21 00 00   [14] 3392 	ld	ix,#0
   8647 DD 39         [15] 3393 	add	ix,sp
   8649 F5            [11] 3394 	push	af
   864A F5            [11] 3395 	push	af
                           3396 ;src/main.c:627: u8 i = 1 + 1;
   864B DD 36 FC 02   [19] 3397 	ld	-4 (ix),#0x02
                           3398 ;src/main.c:631: actual = enemy;
                           3399 ;src/main.c:633: while (--i) {
   864F DD 36 FE 3F   [19] 3400 	ld	-2 (ix),#<(_enemy)
   8653 DD 36 FF 65   [19] 3401 	ld	-1 (ix),#>(_enemy)
   8657                    3402 00123$:
   8657 DD 35 FC      [23] 3403 	dec	-4 (ix)
   865A DD 4E FC      [19] 3404 	ld	c, -4 (ix)
   865D 79            [ 4] 3405 	ld	a,c
   865E B7            [ 4] 3406 	or	a, a
   865F CA 6E 87      [10] 3407 	jp	Z,00126$
                           3408 ;src/main.c:634: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   8662 3A 55 65      [13] 3409 	ld	a, (#(_enemy + 0x0016) + 0)
   8665 B7            [ 4] 3410 	or	a, a
   8666 28 1C         [12] 3411 	jr	Z,00121$
                           3412 ;src/main.c:635: engage(actual, prota.x, prota.y);
   8668 3A 58 6A      [13] 3413 	ld	a,(#(_prota + 0x0001) + 0)
   866B DD 77 FD      [19] 3414 	ld	-3 (ix),a
   866E 21 57 6A      [10] 3415 	ld	hl, #_prota + 0
   8671 46            [ 7] 3416 	ld	b,(hl)
   8672 DD 7E FD      [19] 3417 	ld	a,-3 (ix)
   8675 F5            [11] 3418 	push	af
   8676 33            [ 6] 3419 	inc	sp
   8677 C5            [11] 3420 	push	bc
   8678 33            [ 6] 3421 	inc	sp
   8679 21 3F 65      [10] 3422 	ld	hl,#_enemy
   867C E5            [11] 3423 	push	hl
   867D CD 4B 7F      [17] 3424 	call	_engage
   8680 F1            [10] 3425 	pop	af
   8681 F1            [10] 3426 	pop	af
   8682 18 D3         [12] 3427 	jr	00123$
   8684                    3428 00121$:
                           3429 ;src/main.c:637: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   8684 21 3F 65      [10] 3430 	ld	hl,#_enemy
   8687 E5            [11] 3431 	push	hl
   8688 CD 45 7D      [17] 3432 	call	_lookFor
   868B F1            [10] 3433 	pop	af
                           3434 ;src/main.c:638: if (actual->patrolling) { // esta patrullando
   868C 3A 4A 65      [13] 3435 	ld	a, (#(_enemy + 0x000b) + 0)
   868F B7            [ 4] 3436 	or	a, a
   8690 CA 2D 87      [10] 3437 	jp	Z,00118$
                           3438 ;src/main.c:639: if (!actual->seen && !actual->inRange) {
   8693 21 51 65      [10] 3439 	ld	hl, #(_enemy + 0x0012) + 0
   8696 4E            [ 7] 3440 	ld	c,(hl)
   8697 79            [ 4] 3441 	ld	a,c
   8698 B7            [ 4] 3442 	or	a, a
   8699 20 10         [12] 3443 	jr	NZ,00107$
   869B 3A 50 65      [13] 3444 	ld	a, (#(_enemy + 0x0011) + 0)
   869E B7            [ 4] 3445 	or	a, a
   869F 20 0A         [12] 3446 	jr	NZ,00107$
                           3447 ;src/main.c:640: patrol(actual);
   86A1 21 3F 65      [10] 3448 	ld	hl,#_enemy
   86A4 E5            [11] 3449 	push	hl
   86A5 CD 2F 7F      [17] 3450 	call	_patrol
   86A8 F1            [10] 3451 	pop	af
   86A9 18 AC         [12] 3452 	jr	00123$
   86AB                    3453 00107$:
                           3454 ;src/main.c:641: }else if (actual->inRange) {
                           3455 ;src/main.c:644: actual->onPathPatrol = 0;
                           3456 ;src/main.c:641: }else if (actual->inRange) {
   86AB 3A 50 65      [13] 3457 	ld	a,(#(_enemy + 0x0011) + 0)
   86AE B7            [ 4] 3458 	or	a, a
   86AF 28 24         [12] 3459 	jr	Z,00104$
                           3460 ;src/main.c:642: engage(actual, prota.x, prota.y);
   86B1 21 58 6A      [10] 3461 	ld	hl, #(_prota + 0x0001) + 0
   86B4 46            [ 7] 3462 	ld	b,(hl)
   86B5 21 57 6A      [10] 3463 	ld	hl, #_prota + 0
   86B8 4E            [ 7] 3464 	ld	c, (hl)
   86B9 C5            [11] 3465 	push	bc
   86BA 21 3F 65      [10] 3466 	ld	hl,#_enemy
   86BD E5            [11] 3467 	push	hl
   86BE CD 4B 7F      [17] 3468 	call	_engage
   86C1 F1            [10] 3469 	pop	af
   86C2 F1            [10] 3470 	pop	af
                           3471 ;src/main.c:643: actual->patrolling = 0;
   86C3 21 4A 65      [10] 3472 	ld	hl,#(_enemy + 0x000b)
   86C6 36 00         [10] 3473 	ld	(hl),#0x00
                           3474 ;src/main.c:644: actual->onPathPatrol = 0;
   86C8 21 4B 65      [10] 3475 	ld	hl,#(_enemy + 0x000c)
   86CB 36 00         [10] 3476 	ld	(hl),#0x00
                           3477 ;src/main.c:645: actual->engage = 1;
   86CD 21 55 65      [10] 3478 	ld	hl,#(_enemy + 0x0016)
   86D0 36 01         [10] 3479 	ld	(hl),#0x01
   86D2 C3 57 86      [10] 3480 	jp	00123$
   86D5                    3481 00104$:
                           3482 ;src/main.c:646: } else if (actual->seen) {
   86D5 79            [ 4] 3483 	ld	a,c
   86D6 B7            [ 4] 3484 	or	a, a
   86D7 CA 57 86      [10] 3485 	jp	Z,00123$
                           3486 ;src/main.c:648: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   86DA 21 58 6A      [10] 3487 	ld	hl, #(_prota + 0x0001) + 0
   86DD 46            [ 7] 3488 	ld	b,(hl)
   86DE 21 57 6A      [10] 3489 	ld	hl, #_prota + 0
   86E1 4E            [ 7] 3490 	ld	c,(hl)
   86E2 21 40 65      [10] 3491 	ld	hl, #(_enemy + 0x0001) + 0
   86E5 5E            [ 7] 3492 	ld	e,(hl)
   86E6 21 3F 65      [10] 3493 	ld	hl, #_enemy + 0
   86E9 56            [ 7] 3494 	ld	d,(hl)
   86EA 2A 0F 73      [16] 3495 	ld	hl,(_mapa)
   86ED E5            [11] 3496 	push	hl
   86EE 21 3F 65      [10] 3497 	ld	hl,#_enemy
   86F1 E5            [11] 3498 	push	hl
   86F2 C5            [11] 3499 	push	bc
   86F3 7B            [ 4] 3500 	ld	a,e
   86F4 F5            [11] 3501 	push	af
   86F5 33            [ 6] 3502 	inc	sp
   86F6 D5            [11] 3503 	push	de
   86F7 33            [ 6] 3504 	inc	sp
   86F8 CD 9A 47      [17] 3505 	call	_pathFinding
   86FB 21 08 00      [10] 3506 	ld	hl,#8
   86FE 39            [11] 3507 	add	hl,sp
   86FF F9            [ 6] 3508 	ld	sp,hl
                           3509 ;src/main.c:649: actual->p_seek_x = actual->x;
   8700 3A 3F 65      [13] 3510 	ld	a, (#_enemy + 0)
   8703 32 56 65      [13] 3511 	ld	(#(_enemy + 0x0017)),a
                           3512 ;src/main.c:650: actual->p_seek_y = actual->y;
   8706 3A 40 65      [13] 3513 	ld	a, (#(_enemy + 0x0001) + 0)
   8709 32 57 65      [13] 3514 	ld	(#(_enemy + 0x0018)),a
                           3515 ;src/main.c:651: actual->seek = 1;
   870C 21 53 65      [10] 3516 	ld	hl,#(_enemy + 0x0014)
   870F 36 01         [10] 3517 	ld	(hl),#0x01
                           3518 ;src/main.c:652: actual->iter=0;
   8711 21 4E 65      [10] 3519 	ld	hl,#(_enemy + 0x000f)
   8714 36 00         [10] 3520 	ld	(hl),#0x00
                           3521 ;src/main.c:653: actual->reversePatrol = NO;
   8716 21 4C 65      [10] 3522 	ld	hl,#(_enemy + 0x000d)
   8719 36 00         [10] 3523 	ld	(hl),#0x00
                           3524 ;src/main.c:654: actual->patrolling = 0;
   871B 21 4A 65      [10] 3525 	ld	hl,#(_enemy + 0x000b)
   871E 36 00         [10] 3526 	ld	(hl),#0x00
                           3527 ;src/main.c:655: actual->onPathPatrol = 0;
   8720 21 4B 65      [10] 3528 	ld	hl,#(_enemy + 0x000c)
   8723 36 00         [10] 3529 	ld	(hl),#0x00
                           3530 ;src/main.c:656: actual->seen = 0;
   8725 21 51 65      [10] 3531 	ld	hl,#(_enemy + 0x0012)
   8728 36 00         [10] 3532 	ld	(hl),#0x00
   872A C3 57 86      [10] 3533 	jp	00123$
   872D                    3534 00118$:
                           3535 ;src/main.c:658: } else if (actual->seek) { // esta buscando
   872D 3A 53 65      [13] 3536 	ld	a, (#(_enemy + 0x0014) + 0)
   8730 B7            [ 4] 3537 	or	a, a
   8731 CA 57 86      [10] 3538 	jp	Z,00123$
                           3539 ;src/main.c:659: if (!actual->found /*&& actual->seekTimer <= 5*/) {
   8734 DD 6E FE      [19] 3540 	ld	l,-2 (ix)
   8737 DD 66 FF      [19] 3541 	ld	h,-1 (ix)
   873A 11 13 00      [10] 3542 	ld	de, #0x0013
   873D 19            [11] 3543 	add	hl, de
   873E 7E            [ 7] 3544 	ld	a,(hl)
   873F B7            [ 4] 3545 	or	a, a
   8740 20 0B         [12] 3546 	jr	NZ,00113$
                           3547 ;src/main.c:660: seek(actual); // buscar en posiciones cercanas a la actual
   8742 21 3F 65      [10] 3548 	ld	hl,#_enemy
   8745 E5            [11] 3549 	push	hl
   8746 CD 41 7F      [17] 3550 	call	_seek
   8749 F1            [10] 3551 	pop	af
   874A C3 57 86      [10] 3552 	jp	00123$
   874D                    3553 00113$:
                           3554 ;src/main.c:661: } else if (actual->inRange) {
   874D 3A 50 65      [13] 3555 	ld	a, (#(_enemy + 0x0011) + 0)
   8750 B7            [ 4] 3556 	or	a, a
   8751 CA 57 86      [10] 3557 	jp	Z,00123$
                           3558 ;src/main.c:662: engage(actual, prota.x, prota.y);
   8754 21 58 6A      [10] 3559 	ld	hl, #(_prota + 0x0001) + 0
   8757 46            [ 7] 3560 	ld	b,(hl)
   8758 21 57 6A      [10] 3561 	ld	hl, #_prota + 0
   875B 4E            [ 7] 3562 	ld	c, (hl)
   875C C5            [11] 3563 	push	bc
   875D 21 3F 65      [10] 3564 	ld	hl,#_enemy
   8760 E5            [11] 3565 	push	hl
   8761 CD 4B 7F      [17] 3566 	call	_engage
   8764 F1            [10] 3567 	pop	af
   8765 F1            [10] 3568 	pop	af
                           3569 ;src/main.c:663: actual->engage = 1;
   8766 21 55 65      [10] 3570 	ld	hl,#(_enemy + 0x0016)
   8769 36 01         [10] 3571 	ld	(hl),#0x01
   876B C3 57 86      [10] 3572 	jp	00123$
   876E                    3573 00126$:
   876E DD F9         [10] 3574 	ld	sp, ix
   8770 DD E1         [14] 3575 	pop	ix
   8772 C9            [10] 3576 	ret
                           3577 ;src/main.c:670: void inicializarEnemy() {
                           3578 ;	---------------------------------
                           3579 ; Function inicializarEnemy
                           3580 ; ---------------------------------
   8773                    3581 _inicializarEnemy::
   8773 DD E5         [15] 3582 	push	ix
   8775 DD 21 00 00   [14] 3583 	ld	ix,#0
   8779 DD 39         [15] 3584 	add	ix,sp
   877B 21 F9 FF      [10] 3585 	ld	hl,#-7
   877E 39            [11] 3586 	add	hl,sp
   877F F9            [ 6] 3587 	ld	sp,hl
                           3588 ;src/main.c:681: actual = enemy;
   8780 01 3F 65      [10] 3589 	ld	bc,#_enemy+0
                           3590 ;src/main.c:682: while(--i){
   8783 DD 36 F9 02   [19] 3591 	ld	-7 (ix),#0x02
   8787                    3592 00101$:
   8787 DD 35 F9      [23] 3593 	dec	-7 (ix)
   878A DD 7E F9      [19] 3594 	ld	a,-7 (ix)
   878D B7            [ 4] 3595 	or	a, a
   878E CA 64 88      [10] 3596 	jp	Z,00104$
                           3597 ;src/main.c:683: actual->x = actual->px = spawnX[i];
   8791 59            [ 4] 3598 	ld	e, c
   8792 50            [ 4] 3599 	ld	d, b
   8793 13            [ 6] 3600 	inc	de
   8794 13            [ 6] 3601 	inc	de
   8795 3E 35         [ 7] 3602 	ld	a,#<(_spawnX)
   8797 DD 86 F9      [19] 3603 	add	a, -7 (ix)
   879A DD 77 FE      [19] 3604 	ld	-2 (ix),a
   879D 3E 73         [ 7] 3605 	ld	a,#>(_spawnX)
   879F CE 00         [ 7] 3606 	adc	a, #0x00
   87A1 DD 77 FF      [19] 3607 	ld	-1 (ix),a
   87A4 DD 6E FE      [19] 3608 	ld	l,-2 (ix)
   87A7 DD 66 FF      [19] 3609 	ld	h,-1 (ix)
   87AA 7E            [ 7] 3610 	ld	a,(hl)
   87AB DD 77 FD      [19] 3611 	ld	-3 (ix), a
   87AE 12            [ 7] 3612 	ld	(de),a
   87AF DD 7E FD      [19] 3613 	ld	a,-3 (ix)
   87B2 02            [ 7] 3614 	ld	(bc),a
                           3615 ;src/main.c:684: actual->y = actual->py = spawnY[i];
   87B3 59            [ 4] 3616 	ld	e, c
   87B4 50            [ 4] 3617 	ld	d, b
   87B5 13            [ 6] 3618 	inc	de
   87B6 21 03 00      [10] 3619 	ld	hl,#0x0003
   87B9 09            [11] 3620 	add	hl,bc
   87BA DD 75 FB      [19] 3621 	ld	-5 (ix),l
   87BD DD 74 FC      [19] 3622 	ld	-4 (ix),h
   87C0 FD 21 3A 73   [14] 3623 	ld	iy,#_spawnY
   87C4 C5            [11] 3624 	push	bc
   87C5 DD 4E F9      [19] 3625 	ld	c,-7 (ix)
   87C8 06 00         [ 7] 3626 	ld	b,#0x00
   87CA FD 09         [15] 3627 	add	iy, bc
   87CC C1            [10] 3628 	pop	bc
   87CD FD 7E 00      [19] 3629 	ld	a, 0 (iy)
   87D0 DD 77 FA      [19] 3630 	ld	-6 (ix),a
   87D3 DD 6E FB      [19] 3631 	ld	l,-5 (ix)
   87D6 DD 66 FC      [19] 3632 	ld	h,-4 (ix)
   87D9 DD 7E FA      [19] 3633 	ld	a,-6 (ix)
   87DC 77            [ 7] 3634 	ld	(hl),a
   87DD DD 7E FA      [19] 3635 	ld	a,-6 (ix)
   87E0 12            [ 7] 3636 	ld	(de),a
                           3637 ;src/main.c:685: actual->mover  = NO;
   87E1 21 06 00      [10] 3638 	ld	hl,#0x0006
   87E4 09            [11] 3639 	add	hl,bc
   87E5 36 00         [10] 3640 	ld	(hl),#0x00
                           3641 ;src/main.c:686: actual->mira   = M_abajo;
   87E7 21 07 00      [10] 3642 	ld	hl,#0x0007
   87EA 09            [11] 3643 	add	hl,bc
   87EB 36 03         [10] 3644 	ld	(hl),#0x03
                           3645 ;src/main.c:687: actual->sprite = g_enemy;
   87ED 21 04 00      [10] 3646 	ld	hl,#0x0004
   87F0 09            [11] 3647 	add	hl,bc
   87F1 36 3A         [10] 3648 	ld	(hl),#<(_g_enemy)
   87F3 23            [ 6] 3649 	inc	hl
   87F4 36 3C         [10] 3650 	ld	(hl),#>(_g_enemy)
                           3651 ;src/main.c:688: actual->muerto = NO;
   87F6 21 08 00      [10] 3652 	ld	hl,#0x0008
   87F9 09            [11] 3653 	add	hl,bc
   87FA 36 00         [10] 3654 	ld	(hl),#0x00
                           3655 ;src/main.c:689: actual->muertes = 0;
   87FC 21 0A 00      [10] 3656 	ld	hl,#0x000A
   87FF 09            [11] 3657 	add	hl,bc
   8800 36 00         [10] 3658 	ld	(hl),#0x00
                           3659 ;src/main.c:690: actual->patrolling = SI;
   8802 21 0B 00      [10] 3660 	ld	hl,#0x000B
   8805 09            [11] 3661 	add	hl,bc
   8806 36 01         [10] 3662 	ld	(hl),#0x01
                           3663 ;src/main.c:691: actual->onPathPatrol = SI;
   8808 21 0C 00      [10] 3664 	ld	hl,#0x000C
   880B 09            [11] 3665 	add	hl,bc
   880C 36 01         [10] 3666 	ld	(hl),#0x01
                           3667 ;src/main.c:692: actual->reversePatrol = NO;
   880E 21 0D 00      [10] 3668 	ld	hl,#0x000D
   8811 09            [11] 3669 	add	hl,bc
   8812 36 00         [10] 3670 	ld	(hl),#0x00
                           3671 ;src/main.c:693: actual->iter = 0;
   8814 21 0F 00      [10] 3672 	ld	hl,#0x000F
   8817 09            [11] 3673 	add	hl,bc
   8818 36 00         [10] 3674 	ld	(hl),#0x00
                           3675 ;src/main.c:694: actual->lastIter = 0;
   881A 21 10 00      [10] 3676 	ld	hl,#0x0010
   881D 09            [11] 3677 	add	hl,bc
   881E 36 00         [10] 3678 	ld	(hl),#0x00
                           3679 ;src/main.c:695: actual->seen = 0;
   8820 21 12 00      [10] 3680 	ld	hl,#0x0012
   8823 09            [11] 3681 	add	hl,bc
   8824 36 00         [10] 3682 	ld	(hl),#0x00
                           3683 ;src/main.c:696: actual->found = 0;
   8826 21 13 00      [10] 3684 	ld	hl,#0x0013
   8829 09            [11] 3685 	add	hl,bc
   882A 36 00         [10] 3686 	ld	(hl),#0x00
                           3687 ;src/main.c:697: pathFinding(actual->x, actual->y, spawnX[i] - 20, spawnY[i], actual, mapa); // calculo rutas de patrulla
   882C FD 5E 00      [19] 3688 	ld	e, 0 (iy)
   882F DD 6E FE      [19] 3689 	ld	l,-2 (ix)
   8832 DD 66 FF      [19] 3690 	ld	h,-1 (ix)
   8835 7E            [ 7] 3691 	ld	a,(hl)
   8836 C6 EC         [ 7] 3692 	add	a,#0xEC
   8838 57            [ 4] 3693 	ld	d,a
   8839 C5            [11] 3694 	push	bc
   883A 2A 0F 73      [16] 3695 	ld	hl,(_mapa)
   883D E5            [11] 3696 	push	hl
   883E C5            [11] 3697 	push	bc
   883F 7B            [ 4] 3698 	ld	a,e
   8840 F5            [11] 3699 	push	af
   8841 33            [ 6] 3700 	inc	sp
   8842 D5            [11] 3701 	push	de
   8843 33            [ 6] 3702 	inc	sp
   8844 DD 66 FA      [19] 3703 	ld	h,-6 (ix)
   8847 DD 6E FD      [19] 3704 	ld	l,-3 (ix)
   884A E5            [11] 3705 	push	hl
   884B CD 9A 47      [17] 3706 	call	_pathFinding
   884E 21 08 00      [10] 3707 	ld	hl,#8
   8851 39            [11] 3708 	add	hl,sp
   8852 F9            [ 6] 3709 	ld	sp,hl
   8853 C1            [10] 3710 	pop	bc
                           3711 ;src/main.c:720: dibujarEnemigo(actual);
   8854 C5            [11] 3712 	push	bc
   8855 C5            [11] 3713 	push	bc
   8856 CD C9 75      [17] 3714 	call	_dibujarEnemigo
   8859 F1            [10] 3715 	pop	af
   885A C1            [10] 3716 	pop	bc
                           3717 ;src/main.c:722: ++actual;
   885B 21 46 01      [10] 3718 	ld	hl,#0x0146
   885E 09            [11] 3719 	add	hl,bc
   885F 4D            [ 4] 3720 	ld	c,l
   8860 44            [ 4] 3721 	ld	b,h
   8861 C3 87 87      [10] 3722 	jp	00101$
   8864                    3723 00104$:
   8864 DD F9         [10] 3724 	ld	sp, ix
   8866 DD E1         [14] 3725 	pop	ix
   8868 C9            [10] 3726 	ret
                           3727 ;src/main.c:725: void avanzarMapa() {
                           3728 ;	---------------------------------
                           3729 ; Function avanzarMapa
                           3730 ; ---------------------------------
   8869                    3731 _avanzarMapa::
                           3732 ;src/main.c:726: if(num_mapa < NUM_MAPAS -1) {
   8869 3A 11 73      [13] 3733 	ld	a,(#_num_mapa + 0)
   886C D6 02         [ 7] 3734 	sub	a, #0x02
   886E 30 34         [12] 3735 	jr	NC,00102$
                           3736 ;src/main.c:727: mapa = mapas[++num_mapa];
   8870 01 2F 73      [10] 3737 	ld	bc,#_mapas+0
   8873 21 11 73      [10] 3738 	ld	hl, #_num_mapa+0
   8876 34            [11] 3739 	inc	(hl)
   8877 FD 21 11 73   [14] 3740 	ld	iy,#_num_mapa
   887B FD 6E 00      [19] 3741 	ld	l,0 (iy)
   887E 26 00         [ 7] 3742 	ld	h,#0x00
   8880 29            [11] 3743 	add	hl, hl
   8881 09            [11] 3744 	add	hl,bc
   8882 7E            [ 7] 3745 	ld	a,(hl)
   8883 FD 21 0F 73   [14] 3746 	ld	iy,#_mapa
   8887 FD 77 00      [19] 3747 	ld	0 (iy),a
   888A 23            [ 6] 3748 	inc	hl
   888B 7E            [ 7] 3749 	ld	a,(hl)
   888C 32 10 73      [13] 3750 	ld	(#_mapa + 1),a
                           3751 ;src/main.c:728: prota.x = prota.px = 2;
   888F 21 59 6A      [10] 3752 	ld	hl,#(_prota + 0x0002)
   8892 36 02         [10] 3753 	ld	(hl),#0x02
   8894 21 57 6A      [10] 3754 	ld	hl,#_prota
   8897 36 02         [10] 3755 	ld	(hl),#0x02
                           3756 ;src/main.c:729: prota.mover = SI;
   8899 21 5D 6A      [10] 3757 	ld	hl,#(_prota + 0x0006)
   889C 36 01         [10] 3758 	ld	(hl),#0x01
                           3759 ;src/main.c:730: dibujarMapa();
   889E CD 19 73      [17] 3760 	call	_dibujarMapa
                           3761 ;src/main.c:731: inicializarEnemy();
   88A1 C3 73 87      [10] 3762 	jp  _inicializarEnemy
   88A4                    3763 00102$:
                           3764 ;src/main.c:734: menuFin(puntuacion);
   88A4 FD 21 12 73   [14] 3765 	ld	iy,#_puntuacion
   88A8 FD 6E 00      [19] 3766 	ld	l,0 (iy)
   88AB 26 00         [ 7] 3767 	ld	h,#0x00
   88AD C3 57 50      [10] 3768 	jp  _menuFin
                           3769 ;src/main.c:738: void moverIzquierda() {
                           3770 ;	---------------------------------
                           3771 ; Function moverIzquierda
                           3772 ; ---------------------------------
   88B0                    3773 _moverIzquierda::
                           3774 ;src/main.c:739: prota.mira = M_izquierda;
   88B0 01 57 6A      [10] 3775 	ld	bc,#_prota+0
   88B3 21 5E 6A      [10] 3776 	ld	hl,#(_prota + 0x0007)
   88B6 36 01         [10] 3777 	ld	(hl),#0x01
                           3778 ;src/main.c:740: if (!checkCollision(M_izquierda)) {
   88B8 C5            [11] 3779 	push	bc
   88B9 3E 01         [ 7] 3780 	ld	a,#0x01
   88BB F5            [11] 3781 	push	af
   88BC 33            [ 6] 3782 	inc	sp
   88BD CD 54 74      [17] 3783 	call	_checkCollision
   88C0 33            [ 6] 3784 	inc	sp
   88C1 C1            [10] 3785 	pop	bc
   88C2 7D            [ 4] 3786 	ld	a,l
   88C3 B7            [ 4] 3787 	or	a, a
   88C4 C0            [11] 3788 	ret	NZ
                           3789 ;src/main.c:741: prota.x--;
   88C5 0A            [ 7] 3790 	ld	a,(bc)
   88C6 C6 FF         [ 7] 3791 	add	a,#0xFF
   88C8 02            [ 7] 3792 	ld	(bc),a
                           3793 ;src/main.c:742: prota.mover = SI;
   88C9 21 5D 6A      [10] 3794 	ld	hl,#(_prota + 0x0006)
   88CC 36 01         [10] 3795 	ld	(hl),#0x01
                           3796 ;src/main.c:743: prota.sprite = g_hero_left;
   88CE 21 C6 3D      [10] 3797 	ld	hl,#_g_hero_left
   88D1 22 5B 6A      [16] 3798 	ld	((_prota + 0x0004)), hl
   88D4 C9            [10] 3799 	ret
                           3800 ;src/main.c:747: void moverDerecha() {
                           3801 ;	---------------------------------
                           3802 ; Function moverDerecha
                           3803 ; ---------------------------------
   88D5                    3804 _moverDerecha::
                           3805 ;src/main.c:748: prota.mira = M_derecha;
   88D5 21 5E 6A      [10] 3806 	ld	hl,#(_prota + 0x0007)
   88D8 36 00         [10] 3807 	ld	(hl),#0x00
                           3808 ;src/main.c:749: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   88DA AF            [ 4] 3809 	xor	a, a
   88DB F5            [11] 3810 	push	af
   88DC 33            [ 6] 3811 	inc	sp
   88DD CD 54 74      [17] 3812 	call	_checkCollision
   88E0 33            [ 6] 3813 	inc	sp
   88E1 45            [ 4] 3814 	ld	b,l
   88E2 21 57 6A      [10] 3815 	ld	hl, #_prota + 0
   88E5 4E            [ 7] 3816 	ld	c,(hl)
   88E6 59            [ 4] 3817 	ld	e,c
   88E7 16 00         [ 7] 3818 	ld	d,#0x00
   88E9 21 07 00      [10] 3819 	ld	hl,#0x0007
   88EC 19            [11] 3820 	add	hl,de
   88ED 11 50 80      [10] 3821 	ld	de, #0x8050
   88F0 29            [11] 3822 	add	hl, hl
   88F1 3F            [ 4] 3823 	ccf
   88F2 CB 1C         [ 8] 3824 	rr	h
   88F4 CB 1D         [ 8] 3825 	rr	l
   88F6 ED 52         [15] 3826 	sbc	hl, de
   88F8 3E 00         [ 7] 3827 	ld	a,#0x00
   88FA 17            [ 4] 3828 	rla
   88FB 5F            [ 4] 3829 	ld	e,a
   88FC 78            [ 4] 3830 	ld	a,b
   88FD B7            [ 4] 3831 	or	a,a
   88FE 20 14         [12] 3832 	jr	NZ,00104$
   8900 B3            [ 4] 3833 	or	a,e
   8901 28 11         [12] 3834 	jr	Z,00104$
                           3835 ;src/main.c:750: prota.x++;
   8903 0C            [ 4] 3836 	inc	c
   8904 21 57 6A      [10] 3837 	ld	hl,#_prota
   8907 71            [ 7] 3838 	ld	(hl),c
                           3839 ;src/main.c:751: prota.mover = SI;
   8908 21 5D 6A      [10] 3840 	ld	hl,#(_prota + 0x0006)
   890B 36 01         [10] 3841 	ld	(hl),#0x01
                           3842 ;src/main.c:752: prota.sprite = g_hero;
   890D 21 70 3E      [10] 3843 	ld	hl,#_g_hero
   8910 22 5B 6A      [16] 3844 	ld	((_prota + 0x0004)), hl
   8913 C9            [10] 3845 	ret
   8914                    3846 00104$:
                           3847 ;src/main.c:754: }else if( prota.x + G_HERO_W >= 80){
   8914 7B            [ 4] 3848 	ld	a,e
   8915 B7            [ 4] 3849 	or	a, a
   8916 C0            [11] 3850 	ret	NZ
                           3851 ;src/main.c:755: avanzarMapa();
   8917 C3 69 88      [10] 3852 	jp  _avanzarMapa
                           3853 ;src/main.c:759: void moverArriba() {
                           3854 ;	---------------------------------
                           3855 ; Function moverArriba
                           3856 ; ---------------------------------
   891A                    3857 _moverArriba::
                           3858 ;src/main.c:760: prota.mira = M_arriba;
   891A 21 5E 6A      [10] 3859 	ld	hl,#(_prota + 0x0007)
   891D 36 02         [10] 3860 	ld	(hl),#0x02
                           3861 ;src/main.c:761: if (!checkCollision(M_arriba)) { 
   891F 3E 02         [ 7] 3862 	ld	a,#0x02
   8921 F5            [11] 3863 	push	af
   8922 33            [ 6] 3864 	inc	sp
   8923 CD 54 74      [17] 3865 	call	_checkCollision
   8926 33            [ 6] 3866 	inc	sp
   8927 7D            [ 4] 3867 	ld	a,l
   8928 B7            [ 4] 3868 	or	a, a
   8929 C0            [11] 3869 	ret	NZ
                           3870 ;src/main.c:762: prota.y--;
   892A 21 58 6A      [10] 3871 	ld	hl,#_prota + 1
   892D 4E            [ 7] 3872 	ld	c,(hl)
   892E 0D            [ 4] 3873 	dec	c
   892F 71            [ 7] 3874 	ld	(hl),c
                           3875 ;src/main.c:763: prota.y--;
   8930 0D            [ 4] 3876 	dec	c
   8931 71            [ 7] 3877 	ld	(hl),c
                           3878 ;src/main.c:764: prota.mover  = SI;
   8932 21 5D 6A      [10] 3879 	ld	hl,#(_prota + 0x0006)
   8935 36 01         [10] 3880 	ld	(hl),#0x01
                           3881 ;src/main.c:765: prota.sprite = g_hero_up;
   8937 21 2C 3D      [10] 3882 	ld	hl,#_g_hero_up
   893A 22 5B 6A      [16] 3883 	ld	((_prota + 0x0004)), hl
   893D C9            [10] 3884 	ret
                           3885 ;src/main.c:769: void moverAbajo() {
                           3886 ;	---------------------------------
                           3887 ; Function moverAbajo
                           3888 ; ---------------------------------
   893E                    3889 _moverAbajo::
                           3890 ;src/main.c:770: prota.mira = M_abajo;
   893E 21 5E 6A      [10] 3891 	ld	hl,#(_prota + 0x0007)
   8941 36 03         [10] 3892 	ld	(hl),#0x03
                           3893 ;src/main.c:771: if (!checkCollision(M_abajo) ) { 
   8943 3E 03         [ 7] 3894 	ld	a,#0x03
   8945 F5            [11] 3895 	push	af
   8946 33            [ 6] 3896 	inc	sp
   8947 CD 54 74      [17] 3897 	call	_checkCollision
   894A 33            [ 6] 3898 	inc	sp
   894B 7D            [ 4] 3899 	ld	a,l
   894C B7            [ 4] 3900 	or	a, a
   894D C0            [11] 3901 	ret	NZ
                           3902 ;src/main.c:772: prota.y++;
   894E 01 58 6A      [10] 3903 	ld	bc,#_prota + 1
   8951 0A            [ 7] 3904 	ld	a,(bc)
   8952 3C            [ 4] 3905 	inc	a
   8953 02            [ 7] 3906 	ld	(bc),a
                           3907 ;src/main.c:773: prota.y++;
   8954 3C            [ 4] 3908 	inc	a
   8955 02            [ 7] 3909 	ld	(bc),a
                           3910 ;src/main.c:774: prota.mover  = SI;
   8956 21 5D 6A      [10] 3911 	ld	hl,#(_prota + 0x0006)
   8959 36 01         [10] 3912 	ld	(hl),#0x01
                           3913 ;src/main.c:775: prota.sprite = g_hero_down;
   895B 21 92 3C      [10] 3914 	ld	hl,#_g_hero_down
   895E 22 5B 6A      [16] 3915 	ld	((_prota + 0x0004)), hl
   8961 C9            [10] 3916 	ret
                           3917 ;src/main.c:782: void intHandler() {
                           3918 ;	---------------------------------
                           3919 ; Function intHandler
                           3920 ; ---------------------------------
   8962                    3921 _intHandler::
                           3922 ;src/main.c:783: if (++i == 6) {
   8962 21 69 6A      [10] 3923 	ld	hl, #_i+0
   8965 34            [11] 3924 	inc	(hl)
   8966 3A 69 6A      [13] 3925 	ld	a,(#_i + 0)
   8969 D6 06         [ 7] 3926 	sub	a, #0x06
   896B C0            [11] 3927 	ret	NZ
                           3928 ;src/main.c:784: play();
   896C CD EB 57      [17] 3929 	call	_play
                           3930 ;src/main.c:785: i=0;
   896F 21 69 6A      [10] 3931 	ld	hl,#_i + 0
   8972 36 00         [10] 3932 	ld	(hl), #0x00
   8974 C9            [10] 3933 	ret
                           3934 ;src/main.c:789: void inicializarCPC() {
                           3935 ;	---------------------------------
                           3936 ; Function inicializarCPC
                           3937 ; ---------------------------------
   8975                    3938 _inicializarCPC::
                           3939 ;src/main.c:790: cpct_disableFirmware();
   8975 CD BB 63      [17] 3940 	call	_cpct_disableFirmware
                           3941 ;src/main.c:791: cpct_setVideoMode(0);
   8978 2E 00         [ 7] 3942 	ld	l,#0x00
   897A CD 66 5B      [17] 3943 	call	_cpct_setVideoMode
                           3944 ;src/main.c:792: cpct_setBorder(HW_BLACK);
   897D 21 10 14      [10] 3945 	ld	hl,#0x1410
   8980 E5            [11] 3946 	push	hl
   8981 CD C9 58      [17] 3947 	call	_cpct_setPALColour
                           3948 ;src/main.c:793: cpct_setPalette(g_palette, 16);
   8984 21 10 00      [10] 3949 	ld	hl,#0x0010
   8987 E5            [11] 3950 	push	hl
   8988 21 60 3E      [10] 3951 	ld	hl,#_g_palette
   898B E5            [11] 3952 	push	hl
   898C CD A6 58      [17] 3953 	call	_cpct_setPalette
                           3954 ;src/main.c:794: cpct_akp_musicInit(g_song);
   898F 21 00 02      [10] 3955 	ld	hl,#_g_song
   8992 E5            [11] 3956 	push	hl
   8993 CD 97 62      [17] 3957 	call	_cpct_akp_musicInit
   8996 F1            [10] 3958 	pop	af
                           3959 ;src/main.c:795: cpct_setInterruptHandler(intHandler);
   8997 21 62 89      [10] 3960 	ld	hl,#_intHandler
   899A CD 17 65      [17] 3961 	call	_cpct_setInterruptHandler
   899D C9            [10] 3962 	ret
                           3963 ;src/main.c:798: void inicializarJuego() {
                           3964 ;	---------------------------------
                           3965 ; Function inicializarJuego
                           3966 ; ---------------------------------
   899E                    3967 _inicializarJuego::
                           3968 ;src/main.c:800: num_mapa = 0;
   899E 21 11 73      [10] 3969 	ld	hl,#_num_mapa + 0
   89A1 36 00         [10] 3970 	ld	(hl), #0x00
                           3971 ;src/main.c:801: mapa = mapas[num_mapa];
   89A3 21 2F 73      [10] 3972 	ld	hl, #_mapas + 0
   89A6 7E            [ 7] 3973 	ld	a,(hl)
   89A7 FD 21 0F 73   [14] 3974 	ld	iy,#_mapa
   89AB FD 77 00      [19] 3975 	ld	0 (iy),a
   89AE 23            [ 6] 3976 	inc	hl
   89AF 7E            [ 7] 3977 	ld	a,(hl)
   89B0 32 10 73      [13] 3978 	ld	(#_mapa + 1),a
                           3979 ;src/main.c:802: cpct_etm_setTileset2x4(g_tileset);
   89B3 21 E0 17      [10] 3980 	ld	hl,#_g_tileset
   89B6 CD BA 5A      [17] 3981 	call	_cpct_etm_setTileset2x4
                           3982 ;src/main.c:804: dibujarMapa();
   89B9 CD 19 73      [17] 3983 	call	_dibujarMapa
                           3984 ;src/main.c:807: barraPuntuacionInicial();
   89BC CD F7 55      [17] 3985 	call	_barraPuntuacionInicial
                           3986 ;src/main.c:810: prota.x = prota.px = 4;
   89BF 21 59 6A      [10] 3987 	ld	hl,#(_prota + 0x0002)
   89C2 36 04         [10] 3988 	ld	(hl),#0x04
   89C4 21 57 6A      [10] 3989 	ld	hl,#_prota
   89C7 36 04         [10] 3990 	ld	(hl),#0x04
                           3991 ;src/main.c:811: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   89C9 21 5A 6A      [10] 3992 	ld	hl,#(_prota + 0x0003)
   89CC 36 68         [10] 3993 	ld	(hl),#0x68
   89CE 21 58 6A      [10] 3994 	ld	hl,#(_prota + 0x0001)
   89D1 36 68         [10] 3995 	ld	(hl),#0x68
                           3996 ;src/main.c:812: prota.mover  = NO;
   89D3 21 5D 6A      [10] 3997 	ld	hl,#(_prota + 0x0006)
   89D6 36 00         [10] 3998 	ld	(hl),#0x00
                           3999 ;src/main.c:813: prota.mira=M_derecha;
   89D8 21 5E 6A      [10] 4000 	ld	hl,#(_prota + 0x0007)
   89DB 36 00         [10] 4001 	ld	(hl),#0x00
                           4002 ;src/main.c:814: prota.sprite = g_hero;
   89DD 21 70 3E      [10] 4003 	ld	hl,#_g_hero
   89E0 22 5B 6A      [16] 4004 	ld	((_prota + 0x0004)), hl
                           4005 ;src/main.c:818: cu.x = cu.px = 0;
   89E3 21 61 6A      [10] 4006 	ld	hl,#(_cu + 0x0002)
   89E6 36 00         [10] 4007 	ld	(hl),#0x00
   89E8 21 5F 6A      [10] 4008 	ld	hl,#_cu
   89EB 36 00         [10] 4009 	ld	(hl),#0x00
                           4010 ;src/main.c:819: cu.y = cu.py = 0;
   89ED 21 62 6A      [10] 4011 	ld	hl,#(_cu + 0x0003)
   89F0 36 00         [10] 4012 	ld	(hl),#0x00
   89F2 21 60 6A      [10] 4013 	ld	hl,#(_cu + 0x0001)
   89F5 36 00         [10] 4014 	ld	(hl),#0x00
                           4015 ;src/main.c:820: cu.lanzado = NO;
   89F7 21 65 6A      [10] 4016 	ld	hl,#(_cu + 0x0006)
   89FA 36 00         [10] 4017 	ld	(hl),#0x00
                           4018 ;src/main.c:821: cu.mover = NO;
   89FC 21 68 6A      [10] 4019 	ld	hl,#(_cu + 0x0009)
   89FF 36 00         [10] 4020 	ld	(hl),#0x00
                           4021 ;src/main.c:823: inicializarEnemy();
   8A01 CD 73 87      [17] 4022 	call	_inicializarEnemy
                           4023 ;src/main.c:825: dibujarProta();
   8A04 C3 3F 73      [10] 4024 	jp  _dibujarProta
                           4025 ;src/main.c:828: void main(void) {
                           4026 ;	---------------------------------
                           4027 ; Function main
                           4028 ; ---------------------------------
   8A07                    4029 _main::
   8A07 DD E5         [15] 4030 	push	ix
   8A09 DD 21 00 00   [14] 4031 	ld	ix,#0
   8A0D DD 39         [15] 4032 	add	ix,sp
   8A0F 3B            [ 6] 4033 	dec	sp
                           4034 ;src/main.c:833: inicializarCPC();
   8A10 CD 75 89      [17] 4035 	call	_inicializarCPC
                           4036 ;src/main.c:835: menuInicio();
   8A13 CD 18 55      [17] 4037 	call	_menuInicio
                           4038 ;src/main.c:837: inicializarJuego();
   8A16 CD 9E 89      [17] 4039 	call	_inicializarJuego
                           4040 ;src/main.c:841: while (1) {
   8A19                    4041 00122$:
                           4042 ;src/main.c:844: actual = enemy;
                           4043 ;src/main.c:846: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   8A19 21 00 01      [10] 4044 	ld	hl,#_g_tablatrans
   8A1C E5            [11] 4045 	push	hl
   8A1D 2A 0F 73      [16] 4046 	ld	hl,(_mapa)
   8A20 E5            [11] 4047 	push	hl
   8A21 21 57 6A      [10] 4048 	ld	hl,#_prota
   8A24 E5            [11] 4049 	push	hl
   8A25 21 5F 6A      [10] 4050 	ld	hl,#_cu
   8A28 E5            [11] 4051 	push	hl
   8A29 CD ED 73      [17] 4052 	call	_comprobarTeclado
   8A2C 21 08 00      [10] 4053 	ld	hl,#8
   8A2F 39            [11] 4054 	add	hl,sp
   8A30 F9            [ 6] 4055 	ld	sp,hl
                           4056 ;src/main.c:847: moverCuchillo(&cu, mapa);
   8A31 2A 0F 73      [16] 4057 	ld	hl,(_mapa)
   8A34 E5            [11] 4058 	push	hl
   8A35 21 5F 6A      [10] 4059 	ld	hl,#_cu
   8A38 E5            [11] 4060 	push	hl
   8A39 CD E4 4E      [17] 4061 	call	_moverCuchillo
   8A3C F1            [10] 4062 	pop	af
   8A3D F1            [10] 4063 	pop	af
                           4064 ;src/main.c:848: updateEnemies();
   8A3E CD 41 86      [17] 4065 	call	_updateEnemies
                           4066 ;src/main.c:850: while(--i){
   8A41 21 3F 65      [10] 4067 	ld	hl,#_enemy
   8A44 0E 02         [ 7] 4068 	ld	c,#0x02
   8A46                    4069 00101$:
   8A46 0D            [ 4] 4070 	dec	c
   8A47 79            [ 4] 4071 	ld	a,c
   8A48 B7            [ 4] 4072 	or	a, a
   8A49 28 0F         [12] 4073 	jr	Z,00103$
                           4074 ;src/main.c:851: moverEnemigo(actual);
   8A4B E5            [11] 4075 	push	hl
   8A4C C5            [11] 4076 	push	bc
   8A4D E5            [11] 4077 	push	hl
   8A4E CD C9 7B      [17] 4078 	call	_moverEnemigo
   8A51 F1            [10] 4079 	pop	af
   8A52 C1            [10] 4080 	pop	bc
   8A53 E1            [10] 4081 	pop	hl
                           4082 ;src/main.c:852: ++actual;
   8A54 11 46 01      [10] 4083 	ld	de,#0x0146
   8A57 19            [11] 4084 	add	hl,de
   8A58 18 EC         [12] 4085 	jr	00101$
   8A5A                    4086 00103$:
                           4087 ;src/main.c:855: actual = enemy;
   8A5A 01 3F 65      [10] 4088 	ld	bc,#_enemy
                           4089 ;src/main.c:857: cpct_waitVSYNC();
   8A5D C5            [11] 4090 	push	bc
   8A5E CD 5E 5B      [17] 4091 	call	_cpct_waitVSYNC
   8A61 C1            [10] 4092 	pop	bc
                           4093 ;src/main.c:860: if (prota.mover) {
   8A62 3A 5D 6A      [13] 4094 	ld	a, (#(_prota + 0x0006) + 0)
   8A65 B7            [ 4] 4095 	or	a, a
   8A66 28 0A         [12] 4096 	jr	Z,00105$
                           4097 ;src/main.c:861: redibujarProta();
   8A68 C5            [11] 4098 	push	bc
   8A69 CD D9 73      [17] 4099 	call	_redibujarProta
   8A6C C1            [10] 4100 	pop	bc
                           4101 ;src/main.c:862: prota.mover = NO;
   8A6D 21 5D 6A      [10] 4102 	ld	hl,#(_prota + 0x0006)
   8A70 36 00         [10] 4103 	ld	(hl),#0x00
   8A72                    4104 00105$:
                           4105 ;src/main.c:864: if(cu.lanzado && cu.mover){
   8A72 21 65 6A      [10] 4106 	ld	hl, #(_cu + 0x0006) + 0
   8A75 5E            [ 7] 4107 	ld	e,(hl)
   8A76 7B            [ 4] 4108 	ld	a,e
   8A77 B7            [ 4] 4109 	or	a, a
   8A78 28 1E         [12] 4110 	jr	Z,00110$
   8A7A 3A 68 6A      [13] 4111 	ld	a, (#(_cu + 0x0009) + 0)
   8A7D B7            [ 4] 4112 	or	a, a
   8A7E 28 18         [12] 4113 	jr	Z,00110$
                           4114 ;src/main.c:865: redibujarCuchillo(&cu, g_tablatrans, mapa);
   8A80 C5            [11] 4115 	push	bc
   8A81 2A 0F 73      [16] 4116 	ld	hl,(_mapa)
   8A84 E5            [11] 4117 	push	hl
   8A85 21 00 01      [10] 4118 	ld	hl,#_g_tablatrans
   8A88 E5            [11] 4119 	push	hl
   8A89 21 5F 6A      [10] 4120 	ld	hl,#_cu
   8A8C E5            [11] 4121 	push	hl
   8A8D CD 11 4C      [17] 4122 	call	_redibujarCuchillo
   8A90 21 06 00      [10] 4123 	ld	hl,#6
   8A93 39            [11] 4124 	add	hl,sp
   8A94 F9            [ 6] 4125 	ld	sp,hl
   8A95 C1            [10] 4126 	pop	bc
   8A96 18 19         [12] 4127 	jr	00137$
   8A98                    4128 00110$:
                           4129 ;src/main.c:866: }else if (cu.lanzado && !cu.mover){
   8A98 7B            [ 4] 4130 	ld	a,e
   8A99 B7            [ 4] 4131 	or	a, a
   8A9A 28 15         [12] 4132 	jr	Z,00137$
   8A9C 3A 68 6A      [13] 4133 	ld	a, (#(_cu + 0x0009) + 0)
   8A9F B7            [ 4] 4134 	or	a, a
   8AA0 20 0F         [12] 4135 	jr	NZ,00137$
                           4136 ;src/main.c:867: borrarCuchillo(&cu, mapa);
   8AA2 C5            [11] 4137 	push	bc
   8AA3 2A 0F 73      [16] 4138 	ld	hl,(_mapa)
   8AA6 E5            [11] 4139 	push	hl
   8AA7 21 5F 6A      [10] 4140 	ld	hl,#_cu
   8AAA E5            [11] 4141 	push	hl
   8AAB CD 6D 4B      [17] 4142 	call	_borrarCuchillo
   8AAE F1            [10] 4143 	pop	af
   8AAF F1            [10] 4144 	pop	af
   8AB0 C1            [10] 4145 	pop	bc
                           4146 ;src/main.c:870: while(--i){
   8AB1                    4147 00137$:
   8AB1 DD 36 FF 02   [19] 4148 	ld	-1 (ix),#0x02
   8AB5                    4149 00118$:
   8AB5 DD 35 FF      [23] 4150 	dec	-1 (ix)
   8AB8 DD 7E FF      [19] 4151 	ld	a,-1 (ix)
   8ABB B7            [ 4] 4152 	or	a, a
   8ABC 28 71         [12] 4153 	jr	Z,00120$
                           4154 ;src/main.c:871: if(actual->mover){
   8ABE C5            [11] 4155 	push	bc
   8ABF FD E1         [14] 4156 	pop	iy
   8AC1 FD 7E 06      [19] 4157 	ld	a,6 (iy)
   8AC4 B7            [ 4] 4158 	or	a, a
   8AC5 28 07         [12] 4159 	jr	Z,00114$
                           4160 ;src/main.c:872: redibujarEnemigo(actual);
   8AC7 C5            [11] 4161 	push	bc
   8AC8 C5            [11] 4162 	push	bc
   8AC9 CD 3D 77      [17] 4163 	call	_redibujarEnemigo
   8ACC F1            [10] 4164 	pop	af
   8ACD C1            [10] 4165 	pop	bc
   8ACE                    4166 00114$:
                           4167 ;src/main.c:874: if (actual->muerto && actual->muertes == 0){
   8ACE C5            [11] 4168 	push	bc
   8ACF FD E1         [14] 4169 	pop	iy
   8AD1 FD 7E 08      [19] 4170 	ld	a,8 (iy)
   8AD4 B7            [ 4] 4171 	or	a, a
   8AD5 28 50         [12] 4172 	jr	Z,00116$
   8AD7 21 0A 00      [10] 4173 	ld	hl,#0x000A
   8ADA 09            [11] 4174 	add	hl,bc
   8ADB EB            [ 4] 4175 	ex	de,hl
   8ADC 1A            [ 7] 4176 	ld	a,(de)
   8ADD B7            [ 4] 4177 	or	a, a
   8ADE 20 47         [12] 4178 	jr	NZ,00116$
                           4179 ;src/main.c:875: borrarEnemigo(actual);
   8AE0 C5            [11] 4180 	push	bc
   8AE1 D5            [11] 4181 	push	de
   8AE2 C5            [11] 4182 	push	bc
   8AE3 CD A9 76      [17] 4183 	call	_borrarEnemigo
   8AE6 F1            [10] 4184 	pop	af
   8AE7 D1            [10] 4185 	pop	de
   8AE8 C1            [10] 4186 	pop	bc
                           4187 ;src/main.c:876: dibujarExplosion(actual);
   8AE9 C5            [11] 4188 	push	bc
   8AEA D5            [11] 4189 	push	de
   8AEB C5            [11] 4190 	push	bc
   8AEC CD 01 76      [17] 4191 	call	_dibujarExplosion
   8AEF F1            [10] 4192 	pop	af
   8AF0 D1            [10] 4193 	pop	de
   8AF1 C1            [10] 4194 	pop	bc
                           4195 ;src/main.c:877: puntuacion_aux = puntuacion;
   8AF2 FD 21 12 73   [14] 4196 	ld	iy,#_puntuacion
   8AF6 FD 6E 00      [19] 4197 	ld	l,0 (iy)
   8AF9 26 00         [ 7] 4198 	ld	h,#0x00
                           4199 ;src/main.c:878: puntuacion = aumentarPuntuacion(puntuacion_aux);
   8AFB C5            [11] 4200 	push	bc
   8AFC D5            [11] 4201 	push	de
   8AFD E5            [11] 4202 	push	hl
   8AFE CD D0 57      [17] 4203 	call	_aumentarPuntuacion
   8B01 F1            [10] 4204 	pop	af
   8B02 D1            [10] 4205 	pop	de
   8B03 C1            [10] 4206 	pop	bc
   8B04 FD 21 12 73   [14] 4207 	ld	iy,#_puntuacion
   8B08 FD 75 00      [19] 4208 	ld	0 (iy),l
                           4209 ;src/main.c:879: modificarPuntuacion(puntuacion);
   8B0B FD 21 12 73   [14] 4210 	ld	iy,#_puntuacion
   8B0F FD 6E 00      [19] 4211 	ld	l,0 (iy)
   8B12 26 00         [ 7] 4212 	ld	h,#0x00
   8B14 C5            [11] 4213 	push	bc
   8B15 D5            [11] 4214 	push	de
   8B16 E5            [11] 4215 	push	hl
   8B17 CD 93 56      [17] 4216 	call	_modificarPuntuacion
   8B1A F1            [10] 4217 	pop	af
   8B1B D1            [10] 4218 	pop	de
   8B1C C1            [10] 4219 	pop	bc
                           4220 ;src/main.c:881: actual->muertes++;
   8B1D 1A            [ 7] 4221 	ld	a,(de)
   8B1E 3C            [ 4] 4222 	inc	a
   8B1F 12            [ 7] 4223 	ld	(de),a
                           4224 ;src/main.c:882: actual->x = 0;
   8B20 AF            [ 4] 4225 	xor	a, a
   8B21 02            [ 7] 4226 	ld	(bc),a
                           4227 ;src/main.c:883: actual->y = 0;
   8B22 59            [ 4] 4228 	ld	e, c
   8B23 50            [ 4] 4229 	ld	d, b
   8B24 13            [ 6] 4230 	inc	de
   8B25 AF            [ 4] 4231 	xor	a, a
   8B26 12            [ 7] 4232 	ld	(de),a
   8B27                    4233 00116$:
                           4234 ;src/main.c:885: ++actual;
   8B27 21 46 01      [10] 4235 	ld	hl,#0x0146
   8B2A 09            [11] 4236 	add	hl,bc
   8B2B 4D            [ 4] 4237 	ld	c,l
   8B2C 44            [ 4] 4238 	ld	b,h
   8B2D 18 86         [12] 4239 	jr	00118$
   8B2F                    4240 00120$:
                           4241 ;src/main.c:887: cpct_waitVSYNC();
   8B2F CD 5E 5B      [17] 4242 	call	_cpct_waitVSYNC
   8B32 C3 19 8A      [10] 4243 	jp	00122$
   8B35 33            [ 6] 4244 	inc	sp
   8B36 DD E1         [14] 4245 	pop	ix
   8B38 C9            [10] 4246 	ret
                           4247 	.area _CODE
                           4248 	.area _INITIALIZER
   7314                    4249 __xinit__mapa:
   7314 00 00              4250 	.dw #0x0000
   7316                    4251 __xinit__num_mapa:
   7316 00                 4252 	.db #0x00	; 0
   7317                    4253 __xinit__puntuacion:
   7317 00                 4254 	.db #0x00	; 0
   7318                    4255 __xinit__vidas:
   7318 05                 4256 	.db #0x05	; 5
                           4257 	.area _CABS (ABS)
