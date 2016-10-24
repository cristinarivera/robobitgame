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
                             60 	.globl _cpct_getScreenPtr
                             61 	.globl _cpct_setPALColour
                             62 	.globl _cpct_setPalette
                             63 	.globl _cpct_waitVSYNC
                             64 	.globl _cpct_setVideoMode
                             65 	.globl _cpct_drawSpriteMaskedAlignedTable
                             66 	.globl _cpct_isAnyKeyPressed
                             67 	.globl _cpct_isKeyPressed
                             68 	.globl _cpct_scanKeyboard_if
                             69 	.globl _cpct_disableFirmware
                             70 	.globl _vidas
                             71 	.globl _puntuacion
                             72 	.globl _num_mapa
                             73 	.globl _mapa
                             74 	.globl _i
                             75 	.globl _cu
                             76 	.globl _prota
                             77 	.globl _enemy
                             78 	.globl _patrolY
                             79 	.globl _patrolX
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
   64EE                      90 _enemy::
   64EE                      91 	.ds 1304
   6A06                      92 _prota::
   6A06                      93 	.ds 8
   6A0E                      94 _cu::
   6A0E                      95 	.ds 10
   6A18                      96 _i::
   6A18                      97 	.ds 1
                             98 ;--------------------------------------------------------
                             99 ; ram data
                            100 ;--------------------------------------------------------
                            101 	.area _INITIALIZED
   72BE                     102 _mapa::
   72BE                     103 	.ds 2
   72C0                     104 _num_mapa::
   72C0                     105 	.ds 1
   72C1                     106 _puntuacion::
   72C1                     107 	.ds 1
   72C2                     108 _vidas::
   72C2                     109 	.ds 1
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
                            130 ;src/main.c:108: cpctm_createTransparentMaskTable(g_tablatrans, 0x0100, M0, 0);
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
                            171 ;src/main.c:111: void dibujarMapa() {
                            172 ;	---------------------------------
                            173 ; Function dibujarMapa
                            174 ; ---------------------------------
   72C8                     175 _dibujarMapa::
                            176 ;src/main.c:114: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, p, mapa);
   72C8 2A BE 72      [16]  177 	ld	hl,(_mapa)
   72CB E5            [11]  178 	push	hl
   72CC 21 F0 C0      [10]  179 	ld	hl,#0xC0F0
   72CF E5            [11]  180 	push	hl
   72D0 21 2C 28      [10]  181 	ld	hl,#0x282C
   72D3 E5            [11]  182 	push	hl
   72D4 2E 00         [ 7]  183 	ld	l, #0x00
   72D6 E5            [11]  184 	push	hl
   72D7 AF            [ 4]  185 	xor	a, a
   72D8 F5            [11]  186 	push	af
   72D9 33            [ 6]  187 	inc	sp
   72DA CD 75 59      [17]  188 	call	_cpct_etm_drawTileBox2x4
   72DD C9            [10]  189 	ret
   72DE                     190 _mapas:
   72DE C0 10               191 	.dw _g_map1
   72E0 E0 09               192 	.dw _g_map2
   72E2 00 03               193 	.dw _g_map3
   72E4                     194 _spawnX:
   72E4 00                  195 	.db #0x00	; 0
   72E5 26                  196 	.db #0x26	; 38
   72E6 47                  197 	.db #0x47	; 71	'G'
   72E7 32                  198 	.db #0x32	; 50	'2'
   72E8 18                  199 	.db #0x18	; 24
   72E9                     200 _spawnY:
   72E9 00                  201 	.db #0x00	; 0
   72EA 2C                  202 	.db #0x2C	; 44
   72EB 72                  203 	.db #0x72	; 114	'r'
   72EC 9A                  204 	.db #0x9A	; 154
   72ED 68                  205 	.db #0x68	; 104	'h'
   72EE                     206 _patrolX:
   72EE 00                  207 	.db #0x00	; 0
   72EF 00                  208 	.db #0x00	; 0
   72F0 00                  209 	.db #0x00	; 0
   72F1 00                  210 	.db #0x00	; 0
   72F2 00                  211 	.db #0x00	; 0
   72F3 00                  212 	.db #0x00	; 0
   72F4 14                  213 	.db #0x14	; 20
   72F5 47                  214 	.db #0x47	; 71	'G'
   72F6 00                  215 	.db #0x00	; 0
   72F7 00                  216 	.db #0x00	; 0
   72F8 00                  217 	.db #0x00	; 0
   72F9 00                  218 	.db #0x00	; 0
   72FA 00                  219 	.db #0x00	; 0
   72FB 00                  220 	.db #0x00	; 0
   72FC 00                  221 	.db #0x00	; 0
   72FD 00                  222 	.db #0x00	; 0
   72FE 00                  223 	.db #0x00	; 0
   72FF 00                  224 	.db #0x00	; 0
   7300 00                  225 	.db #0x00	; 0
   7301 00                  226 	.db #0x00	; 0
   7302                     227 _patrolY:
   7302 00                  228 	.db #0x00	; 0
   7303 00                  229 	.db #0x00	; 0
   7304 00                  230 	.db #0x00	; 0
   7305 00                  231 	.db #0x00	; 0
   7306 00                  232 	.db #0x00	; 0
   7307 00                  233 	.db #0x00	; 0
   7308 2C                  234 	.db #0x2C	; 44
   7309 84                  235 	.db #0x84	; 132
   730A 00                  236 	.db #0x00	; 0
   730B 00                  237 	.db #0x00	; 0
   730C 00                  238 	.db #0x00	; 0
   730D 00                  239 	.db #0x00	; 0
   730E 00                  240 	.db #0x00	; 0
   730F 00                  241 	.db #0x00	; 0
   7310 00                  242 	.db #0x00	; 0
   7311 00                  243 	.db #0x00	; 0
   7312 00                  244 	.db #0x00	; 0
   7313 00                  245 	.db #0x00	; 0
   7314 00                  246 	.db #0x00	; 0
   7315 00                  247 	.db #0x00	; 0
                            248 ;src/main.c:117: void dibujarProta() {
                            249 ;	---------------------------------
                            250 ; Function dibujarProta
                            251 ; ---------------------------------
   7316                     252 _dibujarProta::
                            253 ;src/main.c:118: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   7316 21 07 6A      [10]  254 	ld	hl, #_prota + 1
   7319 56            [ 7]  255 	ld	d,(hl)
   731A 21 06 6A      [10]  256 	ld	hl, #_prota + 0
   731D 46            [ 7]  257 	ld	b,(hl)
   731E D5            [11]  258 	push	de
   731F 33            [ 6]  259 	inc	sp
   7320 C5            [11]  260 	push	bc
   7321 33            [ 6]  261 	inc	sp
   7322 21 00 C0      [10]  262 	ld	hl,#0xC000
   7325 E5            [11]  263 	push	hl
   7326 CD 93 64      [17]  264 	call	_cpct_getScreenPtr
   7329 EB            [ 4]  265 	ex	de,hl
                            266 ;src/main.c:119: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   732A ED 4B 0A 6A   [20]  267 	ld	bc, (#_prota + 4)
   732E 21 00 01      [10]  268 	ld	hl,#_g_tablatrans
   7331 E5            [11]  269 	push	hl
   7332 21 07 16      [10]  270 	ld	hl,#0x1607
   7335 E5            [11]  271 	push	hl
   7336 D5            [11]  272 	push	de
   7337 C5            [11]  273 	push	bc
   7338 CD B3 64      [17]  274 	call	_cpct_drawSpriteMaskedAlignedTable
   733B C9            [10]  275 	ret
                            276 ;src/main.c:122: void borrarProta() {
                            277 ;	---------------------------------
                            278 ; Function borrarProta
                            279 ; ---------------------------------
   733C                     280 _borrarProta::
   733C DD E5         [15]  281 	push	ix
   733E DD 21 00 00   [14]  282 	ld	ix,#0
   7342 DD 39         [15]  283 	add	ix,sp
   7344 F5            [11]  284 	push	af
   7345 3B            [ 6]  285 	dec	sp
                            286 ;src/main.c:126: u8 w = 4 + (prota.px & 1);
   7346 21 08 6A      [10]  287 	ld	hl, #_prota + 2
   7349 4E            [ 7]  288 	ld	c,(hl)
   734A 79            [ 4]  289 	ld	a,c
   734B E6 01         [ 7]  290 	and	a, #0x01
   734D 47            [ 4]  291 	ld	b,a
   734E 04            [ 4]  292 	inc	b
   734F 04            [ 4]  293 	inc	b
   7350 04            [ 4]  294 	inc	b
   7351 04            [ 4]  295 	inc	b
                            296 ;src/main.c:129: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   7352 21 09 6A      [10]  297 	ld	hl, #_prota + 3
   7355 5E            [ 7]  298 	ld	e,(hl)
   7356 CB 4B         [ 8]  299 	bit	1, e
   7358 28 04         [12]  300 	jr	Z,00103$
   735A 3E 01         [ 7]  301 	ld	a,#0x01
   735C 18 02         [12]  302 	jr	00104$
   735E                     303 00103$:
   735E 3E 00         [ 7]  304 	ld	a,#0x00
   7360                     305 00104$:
   7360 C6 06         [ 7]  306 	add	a, #0x06
   7362 DD 77 FD      [19]  307 	ld	-3 (ix),a
                            308 ;src/main.c:131: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   7365 FD 2A BE 72   [20]  309 	ld	iy,(_mapa)
   7369 16 00         [ 7]  310 	ld	d,#0x00
   736B 7B            [ 4]  311 	ld	a,e
   736C C6 E8         [ 7]  312 	add	a,#0xE8
   736E DD 77 FE      [19]  313 	ld	-2 (ix),a
   7371 7A            [ 4]  314 	ld	a,d
   7372 CE FF         [ 7]  315 	adc	a,#0xFF
   7374 DD 77 FF      [19]  316 	ld	-1 (ix),a
   7377 DD 6E FE      [19]  317 	ld	l,-2 (ix)
   737A DD 66 FF      [19]  318 	ld	h,-1 (ix)
   737D DD CB FF 7E   [20]  319 	bit	7, -1 (ix)
   7381 28 04         [12]  320 	jr	Z,00105$
   7383 21 EB FF      [10]  321 	ld	hl,#0xFFEB
   7386 19            [11]  322 	add	hl,de
   7387                     323 00105$:
   7387 CB 2C         [ 8]  324 	sra	h
   7389 CB 1D         [ 8]  325 	rr	l
   738B CB 2C         [ 8]  326 	sra	h
   738D CB 1D         [ 8]  327 	rr	l
   738F 55            [ 4]  328 	ld	d,l
   7390 CB 39         [ 8]  329 	srl	c
   7392 FD E5         [15]  330 	push	iy
   7394 21 F0 C0      [10]  331 	ld	hl,#0xC0F0
   7397 E5            [11]  332 	push	hl
   7398 3E 28         [ 7]  333 	ld	a,#0x28
   739A F5            [11]  334 	push	af
   739B 33            [ 6]  335 	inc	sp
   739C DD 7E FD      [19]  336 	ld	a,-3 (ix)
   739F F5            [11]  337 	push	af
   73A0 33            [ 6]  338 	inc	sp
   73A1 C5            [11]  339 	push	bc
   73A2 33            [ 6]  340 	inc	sp
   73A3 D5            [11]  341 	push	de
   73A4 33            [ 6]  342 	inc	sp
   73A5 79            [ 4]  343 	ld	a,c
   73A6 F5            [11]  344 	push	af
   73A7 33            [ 6]  345 	inc	sp
   73A8 CD 75 59      [17]  346 	call	_cpct_etm_drawTileBox2x4
   73AB DD F9         [10]  347 	ld	sp, ix
   73AD DD E1         [14]  348 	pop	ix
   73AF C9            [10]  349 	ret
                            350 ;src/main.c:134: void redibujarProta() {
                            351 ;	---------------------------------
                            352 ; Function redibujarProta
                            353 ; ---------------------------------
   73B0                     354 _redibujarProta::
                            355 ;src/main.c:135: borrarProta();
   73B0 CD 3C 73      [17]  356 	call	_borrarProta
                            357 ;src/main.c:136: prota.px = prota.x;
   73B3 01 08 6A      [10]  358 	ld	bc,#_prota + 2
   73B6 3A 06 6A      [13]  359 	ld	a, (#_prota + 0)
   73B9 02            [ 7]  360 	ld	(bc),a
                            361 ;src/main.c:137: prota.py = prota.y;
   73BA 01 09 6A      [10]  362 	ld	bc,#_prota + 3
   73BD 3A 07 6A      [13]  363 	ld	a, (#_prota + 1)
   73C0 02            [ 7]  364 	ld	(bc),a
                            365 ;src/main.c:138: dibujarProta();
   73C1 C3 16 73      [10]  366 	jp  _dibujarProta
                            367 ;src/main.c:141: void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
                            368 ;	---------------------------------
                            369 ; Function comprobarTeclado
                            370 ; ---------------------------------
   73C4                     371 _comprobarTeclado::
                            372 ;src/main.c:142: cpct_scanKeyboard_if();
   73C4 CD CD 5A      [17]  373 	call	_cpct_scanKeyboard_if
                            374 ;src/main.c:144: if (cpct_isAnyKeyPressed()) {
   73C7 CD C0 5A      [17]  375 	call	_cpct_isAnyKeyPressed
   73CA 7D            [ 4]  376 	ld	a,l
   73CB B7            [ 4]  377 	or	a, a
   73CC C8            [11]  378 	ret	Z
                            379 ;src/main.c:145: if (cpct_isKeyPressed(Key_CursorLeft)){
   73CD 21 01 01      [10]  380 	ld	hl,#0x0101
   73D0 CD 94 58      [17]  381 	call	_cpct_isKeyPressed
   73D3 7D            [ 4]  382 	ld	a,l
   73D4 B7            [ 4]  383 	or	a, a
                            384 ;src/main.c:146: moverIzquierda();
   73D5 C2 9E 88      [10]  385 	jp	NZ,_moverIzquierda
                            386 ;src/main.c:147: }else if (cpct_isKeyPressed(Key_CursorRight)){
   73D8 21 00 02      [10]  387 	ld	hl,#0x0200
   73DB CD 94 58      [17]  388 	call	_cpct_isKeyPressed
   73DE 7D            [ 4]  389 	ld	a,l
   73DF B7            [ 4]  390 	or	a, a
                            391 ;src/main.c:148: moverDerecha();
   73E0 C2 C3 88      [10]  392 	jp	NZ,_moverDerecha
                            393 ;src/main.c:149: }else if (cpct_isKeyPressed(Key_CursorUp)){
   73E3 21 00 01      [10]  394 	ld	hl,#0x0100
   73E6 CD 94 58      [17]  395 	call	_cpct_isKeyPressed
   73E9 7D            [ 4]  396 	ld	a,l
   73EA B7            [ 4]  397 	or	a, a
                            398 ;src/main.c:150: moverArriba();
   73EB C2 08 89      [10]  399 	jp	NZ,_moverArriba
                            400 ;src/main.c:151: }else if (cpct_isKeyPressed(Key_CursorDown)){
   73EE 21 00 04      [10]  401 	ld	hl,#0x0400
   73F1 CD 94 58      [17]  402 	call	_cpct_isKeyPressed
   73F4 7D            [ 4]  403 	ld	a,l
   73F5 B7            [ 4]  404 	or	a, a
                            405 ;src/main.c:152: moverAbajo();
   73F6 C2 2C 89      [10]  406 	jp	NZ,_moverAbajo
                            407 ;src/main.c:153: }else if (cpct_isKeyPressed(Key_Space)){
   73F9 21 05 80      [10]  408 	ld	hl,#0x8005
   73FC CD 94 58      [17]  409 	call	_cpct_isKeyPressed
   73FF 7D            [ 4]  410 	ld	a,l
   7400 B7            [ 4]  411 	or	a, a
   7401 C8            [11]  412 	ret	Z
                            413 ;src/main.c:154: lanzarCuchillo(cu, prota, mapa, g_tablatrans);
   7402 21 08 00      [10]  414 	ld	hl, #8
   7405 39            [11]  415 	add	hl, sp
   7406 4E            [ 7]  416 	ld	c, (hl)
   7407 23            [ 6]  417 	inc	hl
   7408 46            [ 7]  418 	ld	b, (hl)
   7409 C5            [11]  419 	push	bc
   740A 21 08 00      [10]  420 	ld	hl, #8
   740D 39            [11]  421 	add	hl, sp
   740E 4E            [ 7]  422 	ld	c, (hl)
   740F 23            [ 6]  423 	inc	hl
   7410 46            [ 7]  424 	ld	b, (hl)
   7411 C5            [11]  425 	push	bc
   7412 21 08 00      [10]  426 	ld	hl, #8
   7415 39            [11]  427 	add	hl, sp
   7416 4E            [ 7]  428 	ld	c, (hl)
   7417 23            [ 6]  429 	inc	hl
   7418 46            [ 7]  430 	ld	b, (hl)
   7419 C5            [11]  431 	push	bc
   741A 21 08 00      [10]  432 	ld	hl, #8
   741D 39            [11]  433 	add	hl, sp
   741E 4E            [ 7]  434 	ld	c, (hl)
   741F 23            [ 6]  435 	inc	hl
   7420 46            [ 7]  436 	ld	b, (hl)
   7421 C5            [11]  437 	push	bc
   7422 CD 47 4C      [17]  438 	call	_lanzarCuchillo
   7425 21 08 00      [10]  439 	ld	hl,#8
   7428 39            [11]  440 	add	hl,sp
   7429 F9            [ 6]  441 	ld	sp,hl
   742A C9            [10]  442 	ret
                            443 ;src/main.c:159: u8 checkCollision(u8 direction) { // check optimization
                            444 ;	---------------------------------
                            445 ; Function checkCollision
                            446 ; ---------------------------------
   742B                     447 _checkCollision::
   742B DD E5         [15]  448 	push	ix
   742D DD 21 00 00   [14]  449 	ld	ix,#0
   7431 DD 39         [15]  450 	add	ix,sp
   7433 F5            [11]  451 	push	af
                            452 ;src/main.c:160: u8 *headTile=0, *feetTile=0, *waistTile=0;
   7434 21 00 00      [10]  453 	ld	hl,#0x0000
   7437 E3            [19]  454 	ex	(sp), hl
   7438 11 00 00      [10]  455 	ld	de,#0x0000
   743B 01 00 00      [10]  456 	ld	bc,#0x0000
                            457 ;src/main.c:162: switch (direction) {
   743E 3E 03         [ 7]  458 	ld	a,#0x03
   7440 DD 96 04      [19]  459 	sub	a, 4 (ix)
   7443 DA 7F 75      [10]  460 	jp	C,00105$
   7446 DD 5E 04      [19]  461 	ld	e,4 (ix)
   7449 16 00         [ 7]  462 	ld	d,#0x00
   744B 21 52 74      [10]  463 	ld	hl,#00124$
   744E 19            [11]  464 	add	hl,de
   744F 19            [11]  465 	add	hl,de
   7450 19            [11]  466 	add	hl,de
   7451 E9            [ 4]  467 	jp	(hl)
   7452                     468 00124$:
   7452 C3 5E 74      [10]  469 	jp	00101$
   7455 C3 B7 74      [10]  470 	jp	00102$
   7458 C3 07 75      [10]  471 	jp	00103$
   745B C3 44 75      [10]  472 	jp	00104$
                            473 ;src/main.c:163: case 0:
   745E                     474 00101$:
                            475 ;src/main.c:164: headTile  = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y);
   745E 21 07 6A      [10]  476 	ld	hl, #(_prota + 0x0001) + 0
   7461 4E            [ 7]  477 	ld	c,(hl)
   7462 3A 06 6A      [13]  478 	ld	a, (#_prota + 0)
   7465 47            [ 4]  479 	ld	b,a
   7466 04            [ 4]  480 	inc	b
   7467 04            [ 4]  481 	inc	b
   7468 04            [ 4]  482 	inc	b
   7469 04            [ 4]  483 	inc	b
   746A 79            [ 4]  484 	ld	a,c
   746B F5            [11]  485 	push	af
   746C 33            [ 6]  486 	inc	sp
   746D C5            [11]  487 	push	bc
   746E 33            [ 6]  488 	inc	sp
   746F 2A BE 72      [16]  489 	ld	hl,(_mapa)
   7472 E5            [11]  490 	push	hl
   7473 CD AA 4F      [17]  491 	call	_getTilePtr
   7476 F1            [10]  492 	pop	af
   7477 F1            [10]  493 	pop	af
   7478 33            [ 6]  494 	inc	sp
   7479 33            [ 6]  495 	inc	sp
   747A E5            [11]  496 	push	hl
                            497 ;src/main.c:165: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   747B 3A 07 6A      [13]  498 	ld	a, (#(_prota + 0x0001) + 0)
   747E C6 14         [ 7]  499 	add	a, #0x14
   7480 4F            [ 4]  500 	ld	c,a
   7481 21 06 6A      [10]  501 	ld	hl, #_prota + 0
   7484 46            [ 7]  502 	ld	b,(hl)
   7485 04            [ 4]  503 	inc	b
   7486 04            [ 4]  504 	inc	b
   7487 04            [ 4]  505 	inc	b
   7488 04            [ 4]  506 	inc	b
   7489 79            [ 4]  507 	ld	a,c
   748A F5            [11]  508 	push	af
   748B 33            [ 6]  509 	inc	sp
   748C C5            [11]  510 	push	bc
   748D 33            [ 6]  511 	inc	sp
   748E 2A BE 72      [16]  512 	ld	hl,(_mapa)
   7491 E5            [11]  513 	push	hl
   7492 CD AA 4F      [17]  514 	call	_getTilePtr
   7495 F1            [10]  515 	pop	af
   7496 F1            [10]  516 	pop	af
   7497 EB            [ 4]  517 	ex	de,hl
                            518 ;src/main.c:166: waistTile = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   7498 3A 07 6A      [13]  519 	ld	a, (#(_prota + 0x0001) + 0)
   749B C6 0B         [ 7]  520 	add	a, #0x0B
   749D 47            [ 4]  521 	ld	b,a
   749E 3A 06 6A      [13]  522 	ld	a, (#_prota + 0)
   74A1 C6 04         [ 7]  523 	add	a, #0x04
   74A3 D5            [11]  524 	push	de
   74A4 C5            [11]  525 	push	bc
   74A5 33            [ 6]  526 	inc	sp
   74A6 F5            [11]  527 	push	af
   74A7 33            [ 6]  528 	inc	sp
   74A8 2A BE 72      [16]  529 	ld	hl,(_mapa)
   74AB E5            [11]  530 	push	hl
   74AC CD AA 4F      [17]  531 	call	_getTilePtr
   74AF F1            [10]  532 	pop	af
   74B0 F1            [10]  533 	pop	af
   74B1 4D            [ 4]  534 	ld	c,l
   74B2 44            [ 4]  535 	ld	b,h
   74B3 D1            [10]  536 	pop	de
                            537 ;src/main.c:167: break;
   74B4 C3 7F 75      [10]  538 	jp	00105$
                            539 ;src/main.c:168: case 1:
   74B7                     540 00102$:
                            541 ;src/main.c:169: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
   74B7 21 07 6A      [10]  542 	ld	hl, #(_prota + 0x0001) + 0
   74BA 56            [ 7]  543 	ld	d,(hl)
   74BB 21 06 6A      [10]  544 	ld	hl, #_prota + 0
   74BE 46            [ 7]  545 	ld	b,(hl)
   74BF 05            [ 4]  546 	dec	b
   74C0 D5            [11]  547 	push	de
   74C1 33            [ 6]  548 	inc	sp
   74C2 C5            [11]  549 	push	bc
   74C3 33            [ 6]  550 	inc	sp
   74C4 2A BE 72      [16]  551 	ld	hl,(_mapa)
   74C7 E5            [11]  552 	push	hl
   74C8 CD AA 4F      [17]  553 	call	_getTilePtr
   74CB F1            [10]  554 	pop	af
   74CC F1            [10]  555 	pop	af
   74CD 33            [ 6]  556 	inc	sp
   74CE 33            [ 6]  557 	inc	sp
   74CF E5            [11]  558 	push	hl
                            559 ;src/main.c:170: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
   74D0 3A 07 6A      [13]  560 	ld	a, (#(_prota + 0x0001) + 0)
   74D3 C6 14         [ 7]  561 	add	a, #0x14
   74D5 57            [ 4]  562 	ld	d,a
   74D6 21 06 6A      [10]  563 	ld	hl, #_prota + 0
   74D9 46            [ 7]  564 	ld	b,(hl)
   74DA 05            [ 4]  565 	dec	b
   74DB D5            [11]  566 	push	de
   74DC 33            [ 6]  567 	inc	sp
   74DD C5            [11]  568 	push	bc
   74DE 33            [ 6]  569 	inc	sp
   74DF 2A BE 72      [16]  570 	ld	hl,(_mapa)
   74E2 E5            [11]  571 	push	hl
   74E3 CD AA 4F      [17]  572 	call	_getTilePtr
   74E6 F1            [10]  573 	pop	af
   74E7 F1            [10]  574 	pop	af
   74E8 EB            [ 4]  575 	ex	de,hl
                            576 ;src/main.c:171: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
   74E9 3A 07 6A      [13]  577 	ld	a, (#(_prota + 0x0001) + 0)
   74EC C6 0B         [ 7]  578 	add	a, #0x0B
   74EE 47            [ 4]  579 	ld	b,a
   74EF 3A 06 6A      [13]  580 	ld	a, (#_prota + 0)
   74F2 C6 FF         [ 7]  581 	add	a,#0xFF
   74F4 D5            [11]  582 	push	de
   74F5 C5            [11]  583 	push	bc
   74F6 33            [ 6]  584 	inc	sp
   74F7 F5            [11]  585 	push	af
   74F8 33            [ 6]  586 	inc	sp
   74F9 2A BE 72      [16]  587 	ld	hl,(_mapa)
   74FC E5            [11]  588 	push	hl
   74FD CD AA 4F      [17]  589 	call	_getTilePtr
   7500 F1            [10]  590 	pop	af
   7501 F1            [10]  591 	pop	af
   7502 4D            [ 4]  592 	ld	c,l
   7503 44            [ 4]  593 	ld	b,h
   7504 D1            [10]  594 	pop	de
                            595 ;src/main.c:172: break;
   7505 18 78         [12]  596 	jr	00105$
                            597 ;src/main.c:173: case 2:
   7507                     598 00103$:
                            599 ;src/main.c:174: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
   7507 3A 07 6A      [13]  600 	ld	a, (#(_prota + 0x0001) + 0)
   750A C6 FE         [ 7]  601 	add	a,#0xFE
   750C 21 06 6A      [10]  602 	ld	hl, #_prota + 0
   750F 56            [ 7]  603 	ld	d,(hl)
   7510 C5            [11]  604 	push	bc
   7511 F5            [11]  605 	push	af
   7512 33            [ 6]  606 	inc	sp
   7513 D5            [11]  607 	push	de
   7514 33            [ 6]  608 	inc	sp
   7515 2A BE 72      [16]  609 	ld	hl,(_mapa)
   7518 E5            [11]  610 	push	hl
   7519 CD AA 4F      [17]  611 	call	_getTilePtr
   751C F1            [10]  612 	pop	af
   751D F1            [10]  613 	pop	af
   751E C1            [10]  614 	pop	bc
   751F 33            [ 6]  615 	inc	sp
   7520 33            [ 6]  616 	inc	sp
   7521 E5            [11]  617 	push	hl
                            618 ;src/main.c:175: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
   7522 21 07 6A      [10]  619 	ld	hl, #(_prota + 0x0001) + 0
   7525 56            [ 7]  620 	ld	d,(hl)
   7526 15            [ 4]  621 	dec	d
   7527 15            [ 4]  622 	dec	d
   7528 3A 06 6A      [13]  623 	ld	a, (#_prota + 0)
   752B C6 03         [ 7]  624 	add	a, #0x03
   752D C5            [11]  625 	push	bc
   752E D5            [11]  626 	push	de
   752F 33            [ 6]  627 	inc	sp
   7530 F5            [11]  628 	push	af
   7531 33            [ 6]  629 	inc	sp
   7532 2A BE 72      [16]  630 	ld	hl,(_mapa)
   7535 E5            [11]  631 	push	hl
   7536 CD AA 4F      [17]  632 	call	_getTilePtr
   7539 F1            [10]  633 	pop	af
   753A F1            [10]  634 	pop	af
   753B EB            [ 4]  635 	ex	de,hl
   753C C1            [10]  636 	pop	bc
                            637 ;src/main.c:176: *waistTile = 0;
   753D 21 00 00      [10]  638 	ld	hl,#0x0000
   7540 36 00         [10]  639 	ld	(hl),#0x00
                            640 ;src/main.c:177: break;
   7542 18 3B         [12]  641 	jr	00105$
                            642 ;src/main.c:178: case 3:
   7544                     643 00104$:
                            644 ;src/main.c:179: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
   7544 3A 07 6A      [13]  645 	ld	a, (#(_prota + 0x0001) + 0)
   7547 C6 16         [ 7]  646 	add	a, #0x16
   7549 21 06 6A      [10]  647 	ld	hl, #_prota + 0
   754C 56            [ 7]  648 	ld	d,(hl)
   754D C5            [11]  649 	push	bc
   754E F5            [11]  650 	push	af
   754F 33            [ 6]  651 	inc	sp
   7550 D5            [11]  652 	push	de
   7551 33            [ 6]  653 	inc	sp
   7552 2A BE 72      [16]  654 	ld	hl,(_mapa)
   7555 E5            [11]  655 	push	hl
   7556 CD AA 4F      [17]  656 	call	_getTilePtr
   7559 F1            [10]  657 	pop	af
   755A F1            [10]  658 	pop	af
   755B C1            [10]  659 	pop	bc
   755C 33            [ 6]  660 	inc	sp
   755D 33            [ 6]  661 	inc	sp
   755E E5            [11]  662 	push	hl
                            663 ;src/main.c:180: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   755F 3A 07 6A      [13]  664 	ld	a, (#(_prota + 0x0001) + 0)
   7562 C6 16         [ 7]  665 	add	a, #0x16
   7564 57            [ 4]  666 	ld	d,a
   7565 3A 06 6A      [13]  667 	ld	a, (#_prota + 0)
   7568 C6 03         [ 7]  668 	add	a, #0x03
   756A C5            [11]  669 	push	bc
   756B D5            [11]  670 	push	de
   756C 33            [ 6]  671 	inc	sp
   756D F5            [11]  672 	push	af
   756E 33            [ 6]  673 	inc	sp
   756F 2A BE 72      [16]  674 	ld	hl,(_mapa)
   7572 E5            [11]  675 	push	hl
   7573 CD AA 4F      [17]  676 	call	_getTilePtr
   7576 F1            [10]  677 	pop	af
   7577 F1            [10]  678 	pop	af
   7578 EB            [ 4]  679 	ex	de,hl
   7579 C1            [10]  680 	pop	bc
                            681 ;src/main.c:181: *waistTile = 0;
   757A 21 00 00      [10]  682 	ld	hl,#0x0000
   757D 36 00         [10]  683 	ld	(hl),#0x00
                            684 ;src/main.c:183: }
   757F                     685 00105$:
                            686 ;src/main.c:185: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   757F E1            [10]  687 	pop	hl
   7580 E5            [11]  688 	push	hl
   7581 6E            [ 7]  689 	ld	l,(hl)
   7582 3E 02         [ 7]  690 	ld	a,#0x02
   7584 95            [ 4]  691 	sub	a, l
   7585 38 0E         [12]  692 	jr	C,00106$
   7587 1A            [ 7]  693 	ld	a,(de)
   7588 5F            [ 4]  694 	ld	e,a
   7589 3E 02         [ 7]  695 	ld	a,#0x02
   758B 93            [ 4]  696 	sub	a, e
   758C 38 07         [12]  697 	jr	C,00106$
   758E 0A            [ 7]  698 	ld	a,(bc)
   758F 4F            [ 4]  699 	ld	c,a
   7590 3E 02         [ 7]  700 	ld	a,#0x02
   7592 91            [ 4]  701 	sub	a, c
   7593 30 04         [12]  702 	jr	NC,00107$
   7595                     703 00106$:
                            704 ;src/main.c:186: return 1;
   7595 2E 01         [ 7]  705 	ld	l,#0x01
   7597 18 02         [12]  706 	jr	00110$
   7599                     707 00107$:
                            708 ;src/main.c:188: return 0;
   7599 2E 00         [ 7]  709 	ld	l,#0x00
   759B                     710 00110$:
   759B DD F9         [10]  711 	ld	sp, ix
   759D DD E1         [14]  712 	pop	ix
   759F C9            [10]  713 	ret
                            714 ;src/main.c:191: void dibujarEnemigo(TEnemy *enemy) {
                            715 ;	---------------------------------
                            716 ; Function dibujarEnemigo
                            717 ; ---------------------------------
   75A0                     718 _dibujarEnemigo::
   75A0 DD E5         [15]  719 	push	ix
   75A2 DD 21 00 00   [14]  720 	ld	ix,#0
   75A6 DD 39         [15]  721 	add	ix,sp
                            722 ;src/main.c:192: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   75A8 DD 4E 04      [19]  723 	ld	c,4 (ix)
   75AB DD 46 05      [19]  724 	ld	b,5 (ix)
   75AE 69            [ 4]  725 	ld	l, c
   75AF 60            [ 4]  726 	ld	h, b
   75B0 23            [ 6]  727 	inc	hl
   75B1 56            [ 7]  728 	ld	d,(hl)
   75B2 0A            [ 7]  729 	ld	a,(bc)
   75B3 C5            [11]  730 	push	bc
   75B4 D5            [11]  731 	push	de
   75B5 33            [ 6]  732 	inc	sp
   75B6 F5            [11]  733 	push	af
   75B7 33            [ 6]  734 	inc	sp
   75B8 21 00 C0      [10]  735 	ld	hl,#0xC000
   75BB E5            [11]  736 	push	hl
   75BC CD 93 64      [17]  737 	call	_cpct_getScreenPtr
   75BF EB            [ 4]  738 	ex	de,hl
                            739 ;src/main.c:193: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   75C0 E1            [10]  740 	pop	hl
   75C1 01 04 00      [10]  741 	ld	bc, #0x0004
   75C4 09            [11]  742 	add	hl, bc
   75C5 4E            [ 7]  743 	ld	c,(hl)
   75C6 23            [ 6]  744 	inc	hl
   75C7 46            [ 7]  745 	ld	b,(hl)
   75C8 21 00 01      [10]  746 	ld	hl,#_g_tablatrans
   75CB E5            [11]  747 	push	hl
   75CC 21 04 16      [10]  748 	ld	hl,#0x1604
   75CF E5            [11]  749 	push	hl
   75D0 D5            [11]  750 	push	de
   75D1 C5            [11]  751 	push	bc
   75D2 CD B3 64      [17]  752 	call	_cpct_drawSpriteMaskedAlignedTable
   75D5 DD E1         [14]  753 	pop	ix
   75D7 C9            [10]  754 	ret
                            755 ;src/main.c:196: void dibujarExplosion(TEnemy *enemy) {
                            756 ;	---------------------------------
                            757 ; Function dibujarExplosion
                            758 ; ---------------------------------
   75D8                     759 _dibujarExplosion::
   75D8 DD E5         [15]  760 	push	ix
   75DA DD 21 00 00   [14]  761 	ld	ix,#0
   75DE DD 39         [15]  762 	add	ix,sp
                            763 ;src/main.c:197: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   75E0 DD 4E 04      [19]  764 	ld	c,4 (ix)
   75E3 DD 46 05      [19]  765 	ld	b,5 (ix)
   75E6 69            [ 4]  766 	ld	l, c
   75E7 60            [ 4]  767 	ld	h, b
   75E8 23            [ 6]  768 	inc	hl
   75E9 56            [ 7]  769 	ld	d,(hl)
   75EA 0A            [ 7]  770 	ld	a,(bc)
   75EB 47            [ 4]  771 	ld	b,a
   75EC D5            [11]  772 	push	de
   75ED 33            [ 6]  773 	inc	sp
   75EE C5            [11]  774 	push	bc
   75EF 33            [ 6]  775 	inc	sp
   75F0 21 00 C0      [10]  776 	ld	hl,#0xC000
   75F3 E5            [11]  777 	push	hl
   75F4 CD 93 64      [17]  778 	call	_cpct_getScreenPtr
   75F7 4D            [ 4]  779 	ld	c,l
   75F8 44            [ 4]  780 	ld	b,h
                            781 ;src/main.c:198: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   75F9 11 00 01      [10]  782 	ld	de,#_g_tablatrans+0
   75FC D5            [11]  783 	push	de
   75FD 21 04 16      [10]  784 	ld	hl,#0x1604
   7600 E5            [11]  785 	push	hl
   7601 C5            [11]  786 	push	bc
   7602 21 70 19      [10]  787 	ld	hl,#_g_explosion
   7605 E5            [11]  788 	push	hl
   7606 CD B3 64      [17]  789 	call	_cpct_drawSpriteMaskedAlignedTable
   7609 DD E1         [14]  790 	pop	ix
   760B C9            [10]  791 	ret
                            792 ;src/main.c:201: void borrarExplosion() {
                            793 ;	---------------------------------
                            794 ; Function borrarExplosion
                            795 ; ---------------------------------
   760C                     796 _borrarExplosion::
   760C DD E5         [15]  797 	push	ix
   760E DD 21 00 00   [14]  798 	ld	ix,#0
   7612 DD 39         [15]  799 	add	ix,sp
   7614 F5            [11]  800 	push	af
   7615 3B            [ 6]  801 	dec	sp
                            802 ;src/main.c:204: u8 w = 4 + (enemy->px & 1);
   7616 21 F0 64      [10]  803 	ld	hl, #_enemy + 2
   7619 4E            [ 7]  804 	ld	c,(hl)
   761A 79            [ 4]  805 	ld	a,c
   761B E6 01         [ 7]  806 	and	a, #0x01
   761D 47            [ 4]  807 	ld	b,a
   761E 04            [ 4]  808 	inc	b
   761F 04            [ 4]  809 	inc	b
   7620 04            [ 4]  810 	inc	b
   7621 04            [ 4]  811 	inc	b
                            812 ;src/main.c:207: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   7622 21 F1 64      [10]  813 	ld	hl, #_enemy + 3
   7625 5E            [ 7]  814 	ld	e,(hl)
   7626 CB 4B         [ 8]  815 	bit	1, e
   7628 28 04         [12]  816 	jr	Z,00103$
   762A 3E 01         [ 7]  817 	ld	a,#0x01
   762C 18 02         [12]  818 	jr	00104$
   762E                     819 00103$:
   762E 3E 00         [ 7]  820 	ld	a,#0x00
   7630                     821 00104$:
   7630 C6 07         [ 7]  822 	add	a, #0x07
   7632 DD 77 FD      [19]  823 	ld	-3 (ix),a
                            824 ;src/main.c:209: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   7635 FD 2A BE 72   [20]  825 	ld	iy,(_mapa)
   7639 16 00         [ 7]  826 	ld	d,#0x00
   763B 7B            [ 4]  827 	ld	a,e
   763C C6 E8         [ 7]  828 	add	a,#0xE8
   763E DD 77 FE      [19]  829 	ld	-2 (ix),a
   7641 7A            [ 4]  830 	ld	a,d
   7642 CE FF         [ 7]  831 	adc	a,#0xFF
   7644 DD 77 FF      [19]  832 	ld	-1 (ix),a
   7647 DD 6E FE      [19]  833 	ld	l,-2 (ix)
   764A DD 66 FF      [19]  834 	ld	h,-1 (ix)
   764D DD CB FF 7E   [20]  835 	bit	7, -1 (ix)
   7651 28 04         [12]  836 	jr	Z,00105$
   7653 21 EB FF      [10]  837 	ld	hl,#0xFFEB
   7656 19            [11]  838 	add	hl,de
   7657                     839 00105$:
   7657 CB 2C         [ 8]  840 	sra	h
   7659 CB 1D         [ 8]  841 	rr	l
   765B CB 2C         [ 8]  842 	sra	h
   765D CB 1D         [ 8]  843 	rr	l
   765F 55            [ 4]  844 	ld	d,l
   7660 CB 39         [ 8]  845 	srl	c
   7662 FD E5         [15]  846 	push	iy
   7664 21 F0 C0      [10]  847 	ld	hl,#0xC0F0
   7667 E5            [11]  848 	push	hl
   7668 3E 28         [ 7]  849 	ld	a,#0x28
   766A F5            [11]  850 	push	af
   766B 33            [ 6]  851 	inc	sp
   766C DD 7E FD      [19]  852 	ld	a,-3 (ix)
   766F F5            [11]  853 	push	af
   7670 33            [ 6]  854 	inc	sp
   7671 C5            [11]  855 	push	bc
   7672 33            [ 6]  856 	inc	sp
   7673 D5            [11]  857 	push	de
   7674 33            [ 6]  858 	inc	sp
   7675 79            [ 4]  859 	ld	a,c
   7676 F5            [11]  860 	push	af
   7677 33            [ 6]  861 	inc	sp
   7678 CD 75 59      [17]  862 	call	_cpct_etm_drawTileBox2x4
   767B DD F9         [10]  863 	ld	sp, ix
   767D DD E1         [14]  864 	pop	ix
   767F C9            [10]  865 	ret
                            866 ;src/main.c:213: void borrarEnemigo(TEnemy *enemy) {
                            867 ;	---------------------------------
                            868 ; Function borrarEnemigo
                            869 ; ---------------------------------
   7680                     870 _borrarEnemigo::
   7680 DD E5         [15]  871 	push	ix
   7682 DD 21 00 00   [14]  872 	ld	ix,#0
   7686 DD 39         [15]  873 	add	ix,sp
   7688 21 FA FF      [10]  874 	ld	hl,#-6
   768B 39            [11]  875 	add	hl,sp
   768C F9            [ 6]  876 	ld	sp,hl
                            877 ;src/main.c:217: u8 w = 4 + (enemy->px & 1);
   768D DD 4E 04      [19]  878 	ld	c,4 (ix)
   7690 DD 46 05      [19]  879 	ld	b,5 (ix)
   7693 69            [ 4]  880 	ld	l, c
   7694 60            [ 4]  881 	ld	h, b
   7695 23            [ 6]  882 	inc	hl
   7696 23            [ 6]  883 	inc	hl
   7697 5E            [ 7]  884 	ld	e,(hl)
   7698 7B            [ 4]  885 	ld	a,e
   7699 E6 01         [ 7]  886 	and	a, #0x01
   769B C6 04         [ 7]  887 	add	a, #0x04
   769D DD 77 FB      [19]  888 	ld	-5 (ix),a
                            889 ;src/main.c:220: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   76A0 69            [ 4]  890 	ld	l, c
   76A1 60            [ 4]  891 	ld	h, b
   76A2 23            [ 6]  892 	inc	hl
   76A3 23            [ 6]  893 	inc	hl
   76A4 23            [ 6]  894 	inc	hl
   76A5 56            [ 7]  895 	ld	d,(hl)
   76A6 CB 4A         [ 8]  896 	bit	1, d
   76A8 28 04         [12]  897 	jr	Z,00103$
   76AA 3E 01         [ 7]  898 	ld	a,#0x01
   76AC 18 02         [12]  899 	jr	00104$
   76AE                     900 00103$:
   76AE 3E 00         [ 7]  901 	ld	a,#0x00
   76B0                     902 00104$:
   76B0 C6 07         [ 7]  903 	add	a, #0x07
   76B2 DD 77 FA      [19]  904 	ld	-6 (ix),a
                            905 ;src/main.c:222: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   76B5 FD 2A BE 72   [20]  906 	ld	iy,(_mapa)
   76B9 DD 72 FE      [19]  907 	ld	-2 (ix),d
   76BC DD 36 FF 00   [19]  908 	ld	-1 (ix),#0x00
   76C0 DD 7E FE      [19]  909 	ld	a,-2 (ix)
   76C3 C6 E8         [ 7]  910 	add	a,#0xE8
   76C5 DD 77 FC      [19]  911 	ld	-4 (ix),a
   76C8 DD 7E FF      [19]  912 	ld	a,-1 (ix)
   76CB CE FF         [ 7]  913 	adc	a,#0xFF
   76CD DD 77 FD      [19]  914 	ld	-3 (ix),a
   76D0 DD 56 FC      [19]  915 	ld	d,-4 (ix)
   76D3 DD 6E FD      [19]  916 	ld	l,-3 (ix)
   76D6 DD CB FD 7E   [20]  917 	bit	7, -3 (ix)
   76DA 28 0C         [12]  918 	jr	Z,00105$
   76DC DD 7E FE      [19]  919 	ld	a,-2 (ix)
   76DF C6 EB         [ 7]  920 	add	a, #0xEB
   76E1 57            [ 4]  921 	ld	d,a
   76E2 DD 7E FF      [19]  922 	ld	a,-1 (ix)
   76E5 CE FF         [ 7]  923 	adc	a, #0xFF
   76E7 6F            [ 4]  924 	ld	l,a
   76E8                     925 00105$:
   76E8 CB 2D         [ 8]  926 	sra	l
   76EA CB 1A         [ 8]  927 	rr	d
   76EC CB 2D         [ 8]  928 	sra	l
   76EE CB 1A         [ 8]  929 	rr	d
   76F0 CB 3B         [ 8]  930 	srl	e
   76F2 C5            [11]  931 	push	bc
   76F3 FD E5         [15]  932 	push	iy
   76F5 21 F0 C0      [10]  933 	ld	hl,#0xC0F0
   76F8 E5            [11]  934 	push	hl
   76F9 3E 28         [ 7]  935 	ld	a,#0x28
   76FB F5            [11]  936 	push	af
   76FC 33            [ 6]  937 	inc	sp
   76FD DD 66 FA      [19]  938 	ld	h,-6 (ix)
   7700 DD 6E FB      [19]  939 	ld	l,-5 (ix)
   7703 E5            [11]  940 	push	hl
   7704 D5            [11]  941 	push	de
   7705 CD 75 59      [17]  942 	call	_cpct_etm_drawTileBox2x4
   7708 C1            [10]  943 	pop	bc
                            944 ;src/main.c:224: enemy->mover = NO;
   7709 21 06 00      [10]  945 	ld	hl,#0x0006
   770C 09            [11]  946 	add	hl,bc
   770D 36 00         [10]  947 	ld	(hl),#0x00
   770F DD F9         [10]  948 	ld	sp, ix
   7711 DD E1         [14]  949 	pop	ix
   7713 C9            [10]  950 	ret
                            951 ;src/main.c:227: void redibujarEnemigo(TEnemy *enemy) {
                            952 ;	---------------------------------
                            953 ; Function redibujarEnemigo
                            954 ; ---------------------------------
   7714                     955 _redibujarEnemigo::
   7714 DD E5         [15]  956 	push	ix
   7716 DD 21 00 00   [14]  957 	ld	ix,#0
   771A DD 39         [15]  958 	add	ix,sp
                            959 ;src/main.c:228: borrarEnemigo(enemy);
   771C DD 6E 04      [19]  960 	ld	l,4 (ix)
   771F DD 66 05      [19]  961 	ld	h,5 (ix)
   7722 E5            [11]  962 	push	hl
   7723 CD 80 76      [17]  963 	call	_borrarEnemigo
   7726 F1            [10]  964 	pop	af
                            965 ;src/main.c:229: enemy->px = enemy->x;
   7727 DD 4E 04      [19]  966 	ld	c,4 (ix)
   772A DD 46 05      [19]  967 	ld	b,5 (ix)
   772D 59            [ 4]  968 	ld	e, c
   772E 50            [ 4]  969 	ld	d, b
   772F 13            [ 6]  970 	inc	de
   7730 13            [ 6]  971 	inc	de
   7731 0A            [ 7]  972 	ld	a,(bc)
   7732 12            [ 7]  973 	ld	(de),a
                            974 ;src/main.c:230: enemy->py = enemy->y;
   7733 59            [ 4]  975 	ld	e, c
   7734 50            [ 4]  976 	ld	d, b
   7735 13            [ 6]  977 	inc	de
   7736 13            [ 6]  978 	inc	de
   7737 13            [ 6]  979 	inc	de
   7738 69            [ 4]  980 	ld	l, c
   7739 60            [ 4]  981 	ld	h, b
   773A 23            [ 6]  982 	inc	hl
   773B 7E            [ 7]  983 	ld	a,(hl)
   773C 12            [ 7]  984 	ld	(de),a
                            985 ;src/main.c:231: dibujarEnemigo(enemy);
   773D C5            [11]  986 	push	bc
   773E CD A0 75      [17]  987 	call	_dibujarEnemigo
   7741 F1            [10]  988 	pop	af
   7742 DD E1         [14]  989 	pop	ix
   7744 C9            [10]  990 	ret
                            991 ;src/main.c:234: u8 checkEnemyCollision(u8 direction, TEnemy *enemy){
                            992 ;	---------------------------------
                            993 ; Function checkEnemyCollision
                            994 ; ---------------------------------
   7745                     995 _checkEnemyCollision::
   7745 DD E5         [15]  996 	push	ix
   7747 DD 21 00 00   [14]  997 	ld	ix,#0
   774B DD 39         [15]  998 	add	ix,sp
   774D 21 F7 FF      [10]  999 	ld	hl,#-9
   7750 39            [11] 1000 	add	hl,sp
   7751 F9            [ 6] 1001 	ld	sp,hl
                           1002 ;src/main.c:236: u8 colisiona = 1;
   7752 DD 36 F7 01   [19] 1003 	ld	-9 (ix),#0x01
                           1004 ;src/main.c:238: switch (direction) {
   7756 3E 03         [ 7] 1005 	ld	a,#0x03
   7758 DD 96 04      [19] 1006 	sub	a, 4 (ix)
   775B DA 38 7B      [10] 1007 	jp	C,00165$
                           1008 ;src/main.c:240: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   775E DD 4E 05      [19] 1009 	ld	c,5 (ix)
   7761 DD 46 06      [19] 1010 	ld	b,6 (ix)
   7764 0A            [ 7] 1011 	ld	a,(bc)
   7765 5F            [ 4] 1012 	ld	e,a
   7766 21 01 00      [10] 1013 	ld	hl,#0x0001
   7769 09            [11] 1014 	add	hl,bc
   776A DD 75 F8      [19] 1015 	ld	-8 (ix),l
   776D DD 74 F9      [19] 1016 	ld	-7 (ix),h
   7770 DD 6E F8      [19] 1017 	ld	l,-8 (ix)
   7773 DD 66 F9      [19] 1018 	ld	h,-7 (ix)
   7776 56            [ 7] 1019 	ld	d,(hl)
                           1020 ;src/main.c:253: enemy->muerto = SI;
   7777 21 08 00      [10] 1021 	ld	hl,#0x0008
   777A 09            [11] 1022 	add	hl,bc
   777B DD 75 FA      [19] 1023 	ld	-6 (ix),l
   777E DD 74 FB      [19] 1024 	ld	-5 (ix),h
                           1025 ;src/main.c:260: enemy->mira = M_izquierda;
   7781 21 07 00      [10] 1026 	ld	hl,#0x0007
   7784 09            [11] 1027 	add	hl,bc
   7785 DD 75 FC      [19] 1028 	ld	-4 (ix),l
   7788 DD 74 FD      [19] 1029 	ld	-3 (ix),h
                           1030 ;src/main.c:238: switch (direction) {
   778B D5            [11] 1031 	push	de
   778C DD 5E 04      [19] 1032 	ld	e,4 (ix)
   778F 16 00         [ 7] 1033 	ld	d,#0x00
   7791 21 99 77      [10] 1034 	ld	hl,#00268$
   7794 19            [11] 1035 	add	hl,de
   7795 19            [11] 1036 	add	hl,de
   7796 19            [11] 1037 	add	hl,de
   7797 D1            [10] 1038 	pop	de
   7798 E9            [ 4] 1039 	jp	(hl)
   7799                    1040 00268$:
   7799 C3 A5 77      [10] 1041 	jp	00101$
   779C C3 8D 78      [10] 1042 	jp	00117$
   779F C3 71 79      [10] 1043 	jp	00133$
   77A2 C3 4F 7A      [10] 1044 	jp	00149$
                           1045 ;src/main.c:239: case 0:
   77A5                    1046 00101$:
                           1047 ;src/main.c:240: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   77A5 7B            [ 4] 1048 	ld	a,e
   77A6 C6 05         [ 7] 1049 	add	a, #0x05
   77A8 C5            [11] 1050 	push	bc
   77A9 D5            [11] 1051 	push	de
   77AA 33            [ 6] 1052 	inc	sp
   77AB F5            [11] 1053 	push	af
   77AC 33            [ 6] 1054 	inc	sp
   77AD 2A BE 72      [16] 1055 	ld	hl,(_mapa)
   77B0 E5            [11] 1056 	push	hl
   77B1 CD AA 4F      [17] 1057 	call	_getTilePtr
   77B4 F1            [10] 1058 	pop	af
   77B5 F1            [10] 1059 	pop	af
   77B6 C1            [10] 1060 	pop	bc
   77B7 5E            [ 7] 1061 	ld	e,(hl)
   77B8 3E 02         [ 7] 1062 	ld	a,#0x02
   77BA 93            [ 4] 1063 	sub	a, e
   77BB DA 82 78      [10] 1064 	jp	C,00113$
                           1065 ;src/main.c:241: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   77BE DD 6E F8      [19] 1066 	ld	l,-8 (ix)
   77C1 DD 66 F9      [19] 1067 	ld	h,-7 (ix)
   77C4 7E            [ 7] 1068 	ld	a,(hl)
   77C5 C6 0B         [ 7] 1069 	add	a, #0x0B
   77C7 57            [ 4] 1070 	ld	d,a
   77C8 0A            [ 7] 1071 	ld	a,(bc)
   77C9 C6 05         [ 7] 1072 	add	a, #0x05
   77CB C5            [11] 1073 	push	bc
   77CC D5            [11] 1074 	push	de
   77CD 33            [ 6] 1075 	inc	sp
   77CE F5            [11] 1076 	push	af
   77CF 33            [ 6] 1077 	inc	sp
   77D0 2A BE 72      [16] 1078 	ld	hl,(_mapa)
   77D3 E5            [11] 1079 	push	hl
   77D4 CD AA 4F      [17] 1080 	call	_getTilePtr
   77D7 F1            [10] 1081 	pop	af
   77D8 F1            [10] 1082 	pop	af
   77D9 C1            [10] 1083 	pop	bc
   77DA 5E            [ 7] 1084 	ld	e,(hl)
   77DB 3E 02         [ 7] 1085 	ld	a,#0x02
   77DD 93            [ 4] 1086 	sub	a, e
   77DE DA 82 78      [10] 1087 	jp	C,00113$
                           1088 ;src/main.c:242: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   77E1 DD 6E F8      [19] 1089 	ld	l,-8 (ix)
   77E4 DD 66 F9      [19] 1090 	ld	h,-7 (ix)
   77E7 7E            [ 7] 1091 	ld	a,(hl)
   77E8 C6 16         [ 7] 1092 	add	a, #0x16
   77EA 57            [ 4] 1093 	ld	d,a
   77EB 0A            [ 7] 1094 	ld	a,(bc)
   77EC C6 05         [ 7] 1095 	add	a, #0x05
   77EE C5            [11] 1096 	push	bc
   77EF D5            [11] 1097 	push	de
   77F0 33            [ 6] 1098 	inc	sp
   77F1 F5            [11] 1099 	push	af
   77F2 33            [ 6] 1100 	inc	sp
   77F3 2A BE 72      [16] 1101 	ld	hl,(_mapa)
   77F6 E5            [11] 1102 	push	hl
   77F7 CD AA 4F      [17] 1103 	call	_getTilePtr
   77FA F1            [10] 1104 	pop	af
   77FB F1            [10] 1105 	pop	af
   77FC C1            [10] 1106 	pop	bc
   77FD 5E            [ 7] 1107 	ld	e,(hl)
   77FE 3E 02         [ 7] 1108 	ld	a,#0x02
   7800 93            [ 4] 1109 	sub	a, e
   7801 DA 82 78      [10] 1110 	jp	C,00113$
                           1111 ;src/main.c:244: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   7804 21 0F 6A      [10] 1112 	ld	hl, #_cu + 1
   7807 5E            [ 7] 1113 	ld	e,(hl)
   7808 16 00         [ 7] 1114 	ld	d,#0x00
   780A 21 04 00      [10] 1115 	ld	hl,#0x0004
   780D 19            [11] 1116 	add	hl,de
   780E DD 75 FE      [19] 1117 	ld	-2 (ix),l
   7811 DD 74 FF      [19] 1118 	ld	-1 (ix),h
   7814 DD 6E F8      [19] 1119 	ld	l,-8 (ix)
   7817 DD 66 F9      [19] 1120 	ld	h,-7 (ix)
   781A 6E            [ 7] 1121 	ld	l,(hl)
   781B 26 00         [ 7] 1122 	ld	h,#0x00
   781D DD 7E FE      [19] 1123 	ld	a,-2 (ix)
   7820 95            [ 4] 1124 	sub	a, l
   7821 DD 7E FF      [19] 1125 	ld	a,-1 (ix)
   7824 9C            [ 4] 1126 	sbc	a, h
   7825 E2 2A 78      [10] 1127 	jp	PO, 00269$
   7828 EE 80         [ 7] 1128 	xor	a, #0x80
   782A                    1129 00269$:
   782A FA 3F 78      [10] 1130 	jp	M,00108$
   782D D5            [11] 1131 	push	de
   782E 11 16 00      [10] 1132 	ld	de,#0x0016
   7831 19            [11] 1133 	add	hl, de
   7832 D1            [10] 1134 	pop	de
   7833 7D            [ 4] 1135 	ld	a,l
   7834 93            [ 4] 1136 	sub	a, e
   7835 7C            [ 4] 1137 	ld	a,h
   7836 9A            [ 4] 1138 	sbc	a, d
   7837 E2 3C 78      [10] 1139 	jp	PO, 00270$
   783A EE 80         [ 7] 1140 	xor	a, #0x80
   783C                    1141 00270$:
   783C F2 46 78      [10] 1142 	jp	P,00109$
   783F                    1143 00108$:
                           1144 ;src/main.c:245: colisiona = 0;
   783F DD 36 F7 00   [19] 1145 	ld	-9 (ix),#0x00
   7843 C3 38 7B      [10] 1146 	jp	00165$
   7846                    1147 00109$:
                           1148 ;src/main.c:248: if(cu.x > enemy->x){ //si el cu esta abajo
   7846 21 0E 6A      [10] 1149 	ld	hl, #_cu + 0
   7849 5E            [ 7] 1150 	ld	e,(hl)
   784A 0A            [ 7] 1151 	ld	a,(bc)
   784B 4F            [ 4] 1152 	ld	c,a
   784C 93            [ 4] 1153 	sub	a, e
   784D 30 2C         [12] 1154 	jr	NC,00106$
                           1155 ;src/main.c:249: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
   784F 6B            [ 4] 1156 	ld	l,e
   7850 26 00         [ 7] 1157 	ld	h,#0x00
   7852 06 00         [ 7] 1158 	ld	b,#0x00
   7854 03            [ 6] 1159 	inc	bc
   7855 03            [ 6] 1160 	inc	bc
   7856 03            [ 6] 1161 	inc	bc
   7857 03            [ 6] 1162 	inc	bc
   7858 BF            [ 4] 1163 	cp	a, a
   7859 ED 42         [15] 1164 	sbc	hl, bc
   785B 3E 01         [ 7] 1165 	ld	a,#0x01
   785D BD            [ 4] 1166 	cp	a, l
   785E 3E 00         [ 7] 1167 	ld	a,#0x00
   7860 9C            [ 4] 1168 	sbc	a, h
   7861 E2 66 78      [10] 1169 	jp	PO, 00271$
   7864 EE 80         [ 7] 1170 	xor	a, #0x80
   7866                    1171 00271$:
   7866 F2 70 78      [10] 1172 	jp	P,00103$
                           1173 ;src/main.c:250: colisiona = 0;
   7869 DD 36 F7 00   [19] 1174 	ld	-9 (ix),#0x00
   786D C3 38 7B      [10] 1175 	jp	00165$
   7870                    1176 00103$:
                           1177 ;src/main.c:253: enemy->muerto = SI;
   7870 DD 6E FA      [19] 1178 	ld	l,-6 (ix)
   7873 DD 66 FB      [19] 1179 	ld	h,-5 (ix)
   7876 36 01         [10] 1180 	ld	(hl),#0x01
   7878 C3 38 7B      [10] 1181 	jp	00165$
   787B                    1182 00106$:
                           1183 ;src/main.c:256: colisiona = 0;
   787B DD 36 F7 00   [19] 1184 	ld	-9 (ix),#0x00
   787F C3 38 7B      [10] 1185 	jp	00165$
   7882                    1186 00113$:
                           1187 ;src/main.c:260: enemy->mira = M_izquierda;
   7882 DD 6E FC      [19] 1188 	ld	l,-4 (ix)
   7885 DD 66 FD      [19] 1189 	ld	h,-3 (ix)
   7888 36 01         [10] 1190 	ld	(hl),#0x01
                           1191 ;src/main.c:262: break;
   788A C3 38 7B      [10] 1192 	jp	00165$
                           1193 ;src/main.c:263: case 1:
   788D                    1194 00117$:
                           1195 ;src/main.c:264: if( *getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   788D 1D            [ 4] 1196 	dec	e
   788E C5            [11] 1197 	push	bc
   788F D5            [11] 1198 	push	de
   7890 2A BE 72      [16] 1199 	ld	hl,(_mapa)
   7893 E5            [11] 1200 	push	hl
   7894 CD AA 4F      [17] 1201 	call	_getTilePtr
   7897 F1            [10] 1202 	pop	af
   7898 F1            [10] 1203 	pop	af
   7899 C1            [10] 1204 	pop	bc
   789A 5E            [ 7] 1205 	ld	e,(hl)
   789B 3E 02         [ 7] 1206 	ld	a,#0x02
   789D 93            [ 4] 1207 	sub	a, e
   789E DA 66 79      [10] 1208 	jp	C,00129$
                           1209 ;src/main.c:265: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   78A1 DD 6E F8      [19] 1210 	ld	l,-8 (ix)
   78A4 DD 66 F9      [19] 1211 	ld	h,-7 (ix)
   78A7 7E            [ 7] 1212 	ld	a,(hl)
   78A8 C6 0B         [ 7] 1213 	add	a, #0x0B
   78AA 57            [ 4] 1214 	ld	d,a
   78AB 0A            [ 7] 1215 	ld	a,(bc)
   78AC C6 FF         [ 7] 1216 	add	a,#0xFF
   78AE C5            [11] 1217 	push	bc
   78AF D5            [11] 1218 	push	de
   78B0 33            [ 6] 1219 	inc	sp
   78B1 F5            [11] 1220 	push	af
   78B2 33            [ 6] 1221 	inc	sp
   78B3 2A BE 72      [16] 1222 	ld	hl,(_mapa)
   78B6 E5            [11] 1223 	push	hl
   78B7 CD AA 4F      [17] 1224 	call	_getTilePtr
   78BA F1            [10] 1225 	pop	af
   78BB F1            [10] 1226 	pop	af
   78BC C1            [10] 1227 	pop	bc
   78BD 5E            [ 7] 1228 	ld	e,(hl)
   78BE 3E 02         [ 7] 1229 	ld	a,#0x02
   78C0 93            [ 4] 1230 	sub	a, e
   78C1 DA 66 79      [10] 1231 	jp	C,00129$
                           1232 ;src/main.c:266: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   78C4 DD 6E F8      [19] 1233 	ld	l,-8 (ix)
   78C7 DD 66 F9      [19] 1234 	ld	h,-7 (ix)
   78CA 7E            [ 7] 1235 	ld	a,(hl)
   78CB C6 16         [ 7] 1236 	add	a, #0x16
   78CD 57            [ 4] 1237 	ld	d,a
   78CE 0A            [ 7] 1238 	ld	a,(bc)
   78CF C6 FF         [ 7] 1239 	add	a,#0xFF
   78D1 C5            [11] 1240 	push	bc
   78D2 D5            [11] 1241 	push	de
   78D3 33            [ 6] 1242 	inc	sp
   78D4 F5            [11] 1243 	push	af
   78D5 33            [ 6] 1244 	inc	sp
   78D6 2A BE 72      [16] 1245 	ld	hl,(_mapa)
   78D9 E5            [11] 1246 	push	hl
   78DA CD AA 4F      [17] 1247 	call	_getTilePtr
   78DD F1            [10] 1248 	pop	af
   78DE F1            [10] 1249 	pop	af
   78DF C1            [10] 1250 	pop	bc
   78E0 5E            [ 7] 1251 	ld	e,(hl)
   78E1 3E 02         [ 7] 1252 	ld	a,#0x02
   78E3 93            [ 4] 1253 	sub	a, e
   78E4 DA 66 79      [10] 1254 	jp	C,00129$
                           1255 ;src/main.c:268: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   78E7 21 0F 6A      [10] 1256 	ld	hl, #_cu + 1
   78EA 5E            [ 7] 1257 	ld	e,(hl)
   78EB 16 00         [ 7] 1258 	ld	d,#0x00
   78ED 21 04 00      [10] 1259 	ld	hl,#0x0004
   78F0 19            [11] 1260 	add	hl,de
   78F1 DD 75 FE      [19] 1261 	ld	-2 (ix),l
   78F4 DD 74 FF      [19] 1262 	ld	-1 (ix),h
   78F7 DD 6E F8      [19] 1263 	ld	l,-8 (ix)
   78FA DD 66 F9      [19] 1264 	ld	h,-7 (ix)
   78FD 6E            [ 7] 1265 	ld	l,(hl)
   78FE 26 00         [ 7] 1266 	ld	h,#0x00
   7900 DD 7E FE      [19] 1267 	ld	a,-2 (ix)
   7903 95            [ 4] 1268 	sub	a, l
   7904 DD 7E FF      [19] 1269 	ld	a,-1 (ix)
   7907 9C            [ 4] 1270 	sbc	a, h
   7908 E2 0D 79      [10] 1271 	jp	PO, 00272$
   790B EE 80         [ 7] 1272 	xor	a, #0x80
   790D                    1273 00272$:
   790D FA 22 79      [10] 1274 	jp	M,00124$
   7910 D5            [11] 1275 	push	de
   7911 11 16 00      [10] 1276 	ld	de,#0x0016
   7914 19            [11] 1277 	add	hl, de
   7915 D1            [10] 1278 	pop	de
   7916 7D            [ 4] 1279 	ld	a,l
   7917 93            [ 4] 1280 	sub	a, e
   7918 7C            [ 4] 1281 	ld	a,h
   7919 9A            [ 4] 1282 	sbc	a, d
   791A E2 1F 79      [10] 1283 	jp	PO, 00273$
   791D EE 80         [ 7] 1284 	xor	a, #0x80
   791F                    1285 00273$:
   791F F2 29 79      [10] 1286 	jp	P,00125$
   7922                    1287 00124$:
                           1288 ;src/main.c:269: colisiona = 0;
   7922 DD 36 F7 00   [19] 1289 	ld	-9 (ix),#0x00
   7926 C3 38 7B      [10] 1290 	jp	00165$
   7929                    1291 00125$:
                           1292 ;src/main.c:272: if(enemy->x > cu.x){ //si el cu esta abajo
   7929 0A            [ 7] 1293 	ld	a,(bc)
   792A 5F            [ 4] 1294 	ld	e,a
   792B 21 0E 6A      [10] 1295 	ld	hl, #_cu + 0
   792E 4E            [ 7] 1296 	ld	c,(hl)
   792F 79            [ 4] 1297 	ld	a,c
   7930 93            [ 4] 1298 	sub	a, e
   7931 30 2C         [12] 1299 	jr	NC,00122$
                           1300 ;src/main.c:273: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
   7933 6B            [ 4] 1301 	ld	l,e
   7934 26 00         [ 7] 1302 	ld	h,#0x00
   7936 06 00         [ 7] 1303 	ld	b,#0x00
   7938 03            [ 6] 1304 	inc	bc
   7939 03            [ 6] 1305 	inc	bc
   793A 03            [ 6] 1306 	inc	bc
   793B 03            [ 6] 1307 	inc	bc
   793C BF            [ 4] 1308 	cp	a, a
   793D ED 42         [15] 1309 	sbc	hl, bc
   793F 3E 01         [ 7] 1310 	ld	a,#0x01
   7941 BD            [ 4] 1311 	cp	a, l
   7942 3E 00         [ 7] 1312 	ld	a,#0x00
   7944 9C            [ 4] 1313 	sbc	a, h
   7945 E2 4A 79      [10] 1314 	jp	PO, 00274$
   7948 EE 80         [ 7] 1315 	xor	a, #0x80
   794A                    1316 00274$:
   794A F2 54 79      [10] 1317 	jp	P,00119$
                           1318 ;src/main.c:274: colisiona = 0;
   794D DD 36 F7 00   [19] 1319 	ld	-9 (ix),#0x00
   7951 C3 38 7B      [10] 1320 	jp	00165$
   7954                    1321 00119$:
                           1322 ;src/main.c:277: enemy->muerto = SI;
   7954 DD 6E FA      [19] 1323 	ld	l,-6 (ix)
   7957 DD 66 FB      [19] 1324 	ld	h,-5 (ix)
   795A 36 01         [10] 1325 	ld	(hl),#0x01
   795C C3 38 7B      [10] 1326 	jp	00165$
   795F                    1327 00122$:
                           1328 ;src/main.c:280: colisiona = 0;
   795F DD 36 F7 00   [19] 1329 	ld	-9 (ix),#0x00
   7963 C3 38 7B      [10] 1330 	jp	00165$
   7966                    1331 00129$:
                           1332 ;src/main.c:284: enemy->mira = M_derecha;
   7966 DD 6E FC      [19] 1333 	ld	l,-4 (ix)
   7969 DD 66 FD      [19] 1334 	ld	h,-3 (ix)
   796C 36 00         [10] 1335 	ld	(hl),#0x00
                           1336 ;src/main.c:286: break;
   796E C3 38 7B      [10] 1337 	jp	00165$
                           1338 ;src/main.c:287: case 2:
   7971                    1339 00133$:
                           1340 ;src/main.c:288: if( *getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7971 15            [ 4] 1341 	dec	d
   7972 15            [ 4] 1342 	dec	d
   7973 C5            [11] 1343 	push	bc
   7974 D5            [11] 1344 	push	de
   7975 2A BE 72      [16] 1345 	ld	hl,(_mapa)
   7978 E5            [11] 1346 	push	hl
   7979 CD AA 4F      [17] 1347 	call	_getTilePtr
   797C F1            [10] 1348 	pop	af
   797D F1            [10] 1349 	pop	af
   797E C1            [10] 1350 	pop	bc
   797F 5E            [ 7] 1351 	ld	e,(hl)
   7980 3E 02         [ 7] 1352 	ld	a,#0x02
   7982 93            [ 4] 1353 	sub	a, e
   7983 DA 47 7A      [10] 1354 	jp	C,00145$
                           1355 ;src/main.c:289: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7986 DD 6E F8      [19] 1356 	ld	l,-8 (ix)
   7989 DD 66 F9      [19] 1357 	ld	h,-7 (ix)
   798C 56            [ 7] 1358 	ld	d,(hl)
   798D 15            [ 4] 1359 	dec	d
   798E 15            [ 4] 1360 	dec	d
   798F 0A            [ 7] 1361 	ld	a,(bc)
   7990 C6 02         [ 7] 1362 	add	a, #0x02
   7992 C5            [11] 1363 	push	bc
   7993 D5            [11] 1364 	push	de
   7994 33            [ 6] 1365 	inc	sp
   7995 F5            [11] 1366 	push	af
   7996 33            [ 6] 1367 	inc	sp
   7997 2A BE 72      [16] 1368 	ld	hl,(_mapa)
   799A E5            [11] 1369 	push	hl
   799B CD AA 4F      [17] 1370 	call	_getTilePtr
   799E F1            [10] 1371 	pop	af
   799F F1            [10] 1372 	pop	af
   79A0 C1            [10] 1373 	pop	bc
   79A1 5E            [ 7] 1374 	ld	e,(hl)
   79A2 3E 02         [ 7] 1375 	ld	a,#0x02
   79A4 93            [ 4] 1376 	sub	a, e
   79A5 DA 47 7A      [10] 1377 	jp	C,00145$
                           1378 ;src/main.c:290: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   79A8 DD 6E F8      [19] 1379 	ld	l,-8 (ix)
   79AB DD 66 F9      [19] 1380 	ld	h,-7 (ix)
   79AE 56            [ 7] 1381 	ld	d,(hl)
   79AF 15            [ 4] 1382 	dec	d
   79B0 15            [ 4] 1383 	dec	d
   79B1 0A            [ 7] 1384 	ld	a,(bc)
   79B2 C6 04         [ 7] 1385 	add	a, #0x04
   79B4 C5            [11] 1386 	push	bc
   79B5 D5            [11] 1387 	push	de
   79B6 33            [ 6] 1388 	inc	sp
   79B7 F5            [11] 1389 	push	af
   79B8 33            [ 6] 1390 	inc	sp
   79B9 2A BE 72      [16] 1391 	ld	hl,(_mapa)
   79BC E5            [11] 1392 	push	hl
   79BD CD AA 4F      [17] 1393 	call	_getTilePtr
   79C0 F1            [10] 1394 	pop	af
   79C1 F1            [10] 1395 	pop	af
   79C2 C1            [10] 1396 	pop	bc
   79C3 5E            [ 7] 1397 	ld	e,(hl)
   79C4 3E 02         [ 7] 1398 	ld	a,#0x02
   79C6 93            [ 4] 1399 	sub	a, e
   79C7 DA 47 7A      [10] 1400 	jp	C,00145$
                           1401 ;src/main.c:292: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   79CA 21 0E 6A      [10] 1402 	ld	hl, #_cu + 0
   79CD 5E            [ 7] 1403 	ld	e,(hl)
   79CE 16 00         [ 7] 1404 	ld	d,#0x00
   79D0 21 02 00      [10] 1405 	ld	hl,#0x0002
   79D3 19            [11] 1406 	add	hl,de
   79D4 DD 75 FE      [19] 1407 	ld	-2 (ix),l
   79D7 DD 74 FF      [19] 1408 	ld	-1 (ix),h
   79DA 0A            [ 7] 1409 	ld	a,(bc)
   79DB 6F            [ 4] 1410 	ld	l,a
   79DC 26 00         [ 7] 1411 	ld	h,#0x00
   79DE DD 7E FE      [19] 1412 	ld	a,-2 (ix)
   79E1 95            [ 4] 1413 	sub	a, l
   79E2 DD 7E FF      [19] 1414 	ld	a,-1 (ix)
   79E5 9C            [ 4] 1415 	sbc	a, h
   79E6 E2 EB 79      [10] 1416 	jp	PO, 00275$
   79E9 EE 80         [ 7] 1417 	xor	a, #0x80
   79EB                    1418 00275$:
   79EB FA FE 79      [10] 1419 	jp	M,00140$
   79EE 23            [ 6] 1420 	inc	hl
   79EF 23            [ 6] 1421 	inc	hl
   79F0 23            [ 6] 1422 	inc	hl
   79F1 23            [ 6] 1423 	inc	hl
   79F2 7D            [ 4] 1424 	ld	a,l
   79F3 93            [ 4] 1425 	sub	a, e
   79F4 7C            [ 4] 1426 	ld	a,h
   79F5 9A            [ 4] 1427 	sbc	a, d
   79F6 E2 FB 79      [10] 1428 	jp	PO, 00276$
   79F9 EE 80         [ 7] 1429 	xor	a, #0x80
   79FB                    1430 00276$:
   79FB F2 04 7A      [10] 1431 	jp	P,00141$
   79FE                    1432 00140$:
                           1433 ;src/main.c:294: colisiona = 0;
   79FE DD 36 F7 00   [19] 1434 	ld	-9 (ix),#0x00
   7A02 18 4B         [12] 1435 	jr	00149$
   7A04                    1436 00141$:
                           1437 ;src/main.c:297: if(enemy->y>cu.y){
   7A04 DD 6E F8      [19] 1438 	ld	l,-8 (ix)
   7A07 DD 66 F9      [19] 1439 	ld	h,-7 (ix)
   7A0A 5E            [ 7] 1440 	ld	e,(hl)
   7A0B 21 0F 6A      [10] 1441 	ld	hl, #(_cu + 0x0001) + 0
   7A0E 6E            [ 7] 1442 	ld	l,(hl)
   7A0F 7D            [ 4] 1443 	ld	a,l
   7A10 93            [ 4] 1444 	sub	a, e
   7A11 30 2E         [12] 1445 	jr	NC,00138$
                           1446 ;src/main.c:298: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   7A13 16 00         [ 7] 1447 	ld	d,#0x00
   7A15 26 00         [ 7] 1448 	ld	h,#0x00
   7A17 D5            [11] 1449 	push	de
   7A18 11 08 00      [10] 1450 	ld	de,#0x0008
   7A1B 19            [11] 1451 	add	hl, de
   7A1C D1            [10] 1452 	pop	de
   7A1D 7B            [ 4] 1453 	ld	a,e
   7A1E 95            [ 4] 1454 	sub	a, l
   7A1F 5F            [ 4] 1455 	ld	e,a
   7A20 7A            [ 4] 1456 	ld	a,d
   7A21 9C            [ 4] 1457 	sbc	a, h
   7A22 57            [ 4] 1458 	ld	d,a
   7A23 3E 02         [ 7] 1459 	ld	a,#0x02
   7A25 BB            [ 4] 1460 	cp	a, e
   7A26 3E 00         [ 7] 1461 	ld	a,#0x00
   7A28 9A            [ 4] 1462 	sbc	a, d
   7A29 E2 2E 7A      [10] 1463 	jp	PO, 00277$
   7A2C EE 80         [ 7] 1464 	xor	a, #0x80
   7A2E                    1465 00277$:
   7A2E F2 37 7A      [10] 1466 	jp	P,00135$
                           1467 ;src/main.c:299: colisiona = 0;
   7A31 DD 36 F7 00   [19] 1468 	ld	-9 (ix),#0x00
   7A35 18 18         [12] 1469 	jr	00149$
   7A37                    1470 00135$:
                           1471 ;src/main.c:302: enemy->muerto = SI;
   7A37 DD 6E FA      [19] 1472 	ld	l,-6 (ix)
   7A3A DD 66 FB      [19] 1473 	ld	h,-5 (ix)
   7A3D 36 01         [10] 1474 	ld	(hl),#0x01
   7A3F 18 0E         [12] 1475 	jr	00149$
   7A41                    1476 00138$:
                           1477 ;src/main.c:306: colisiona = 0;
   7A41 DD 36 F7 00   [19] 1478 	ld	-9 (ix),#0x00
   7A45 18 08         [12] 1479 	jr	00149$
   7A47                    1480 00145$:
                           1481 ;src/main.c:312: enemy->mira = M_abajo;
   7A47 DD 6E FC      [19] 1482 	ld	l,-4 (ix)
   7A4A DD 66 FD      [19] 1483 	ld	h,-3 (ix)
   7A4D 36 03         [10] 1484 	ld	(hl),#0x03
                           1485 ;src/main.c:315: case 3:
   7A4F                    1486 00149$:
                           1487 ;src/main.c:318: if( *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7A4F DD 6E F8      [19] 1488 	ld	l,-8 (ix)
   7A52 DD 66 F9      [19] 1489 	ld	h,-7 (ix)
   7A55 7E            [ 7] 1490 	ld	a,(hl)
   7A56 C6 18         [ 7] 1491 	add	a, #0x18
   7A58 57            [ 4] 1492 	ld	d,a
   7A59 0A            [ 7] 1493 	ld	a,(bc)
   7A5A C5            [11] 1494 	push	bc
   7A5B D5            [11] 1495 	push	de
   7A5C 33            [ 6] 1496 	inc	sp
   7A5D F5            [11] 1497 	push	af
   7A5E 33            [ 6] 1498 	inc	sp
   7A5F 2A BE 72      [16] 1499 	ld	hl,(_mapa)
   7A62 E5            [11] 1500 	push	hl
   7A63 CD AA 4F      [17] 1501 	call	_getTilePtr
   7A66 F1            [10] 1502 	pop	af
   7A67 F1            [10] 1503 	pop	af
   7A68 C1            [10] 1504 	pop	bc
   7A69 5E            [ 7] 1505 	ld	e,(hl)
   7A6A 3E 02         [ 7] 1506 	ld	a,#0x02
   7A6C 93            [ 4] 1507 	sub	a, e
   7A6D DA 30 7B      [10] 1508 	jp	C,00161$
                           1509 ;src/main.c:319: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7A70 DD 6E F8      [19] 1510 	ld	l,-8 (ix)
   7A73 DD 66 F9      [19] 1511 	ld	h,-7 (ix)
   7A76 7E            [ 7] 1512 	ld	a,(hl)
   7A77 C6 18         [ 7] 1513 	add	a, #0x18
   7A79 57            [ 4] 1514 	ld	d,a
   7A7A 0A            [ 7] 1515 	ld	a,(bc)
   7A7B C6 02         [ 7] 1516 	add	a, #0x02
   7A7D C5            [11] 1517 	push	bc
   7A7E D5            [11] 1518 	push	de
   7A7F 33            [ 6] 1519 	inc	sp
   7A80 F5            [11] 1520 	push	af
   7A81 33            [ 6] 1521 	inc	sp
   7A82 2A BE 72      [16] 1522 	ld	hl,(_mapa)
   7A85 E5            [11] 1523 	push	hl
   7A86 CD AA 4F      [17] 1524 	call	_getTilePtr
   7A89 F1            [10] 1525 	pop	af
   7A8A F1            [10] 1526 	pop	af
   7A8B C1            [10] 1527 	pop	bc
   7A8C 5E            [ 7] 1528 	ld	e,(hl)
   7A8D 3E 02         [ 7] 1529 	ld	a,#0x02
   7A8F 93            [ 4] 1530 	sub	a, e
   7A90 DA 30 7B      [10] 1531 	jp	C,00161$
                           1532 ;src/main.c:320: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   7A93 DD 6E F8      [19] 1533 	ld	l,-8 (ix)
   7A96 DD 66 F9      [19] 1534 	ld	h,-7 (ix)
   7A99 7E            [ 7] 1535 	ld	a,(hl)
   7A9A C6 18         [ 7] 1536 	add	a, #0x18
   7A9C 57            [ 4] 1537 	ld	d,a
   7A9D 0A            [ 7] 1538 	ld	a,(bc)
   7A9E C6 04         [ 7] 1539 	add	a, #0x04
   7AA0 C5            [11] 1540 	push	bc
   7AA1 D5            [11] 1541 	push	de
   7AA2 33            [ 6] 1542 	inc	sp
   7AA3 F5            [11] 1543 	push	af
   7AA4 33            [ 6] 1544 	inc	sp
   7AA5 2A BE 72      [16] 1545 	ld	hl,(_mapa)
   7AA8 E5            [11] 1546 	push	hl
   7AA9 CD AA 4F      [17] 1547 	call	_getTilePtr
   7AAC F1            [10] 1548 	pop	af
   7AAD F1            [10] 1549 	pop	af
   7AAE C1            [10] 1550 	pop	bc
   7AAF 5E            [ 7] 1551 	ld	e,(hl)
   7AB0 3E 02         [ 7] 1552 	ld	a,#0x02
   7AB2 93            [ 4] 1553 	sub	a, e
   7AB3 38 7B         [12] 1554 	jr	C,00161$
                           1555 ;src/main.c:322: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   7AB5 21 0E 6A      [10] 1556 	ld	hl, #_cu + 0
   7AB8 5E            [ 7] 1557 	ld	e,(hl)
   7AB9 16 00         [ 7] 1558 	ld	d,#0x00
   7ABB 21 02 00      [10] 1559 	ld	hl,#0x0002
   7ABE 19            [11] 1560 	add	hl,de
   7ABF DD 75 FE      [19] 1561 	ld	-2 (ix),l
   7AC2 DD 74 FF      [19] 1562 	ld	-1 (ix),h
   7AC5 0A            [ 7] 1563 	ld	a,(bc)
   7AC6 4F            [ 4] 1564 	ld	c,a
   7AC7 06 00         [ 7] 1565 	ld	b,#0x00
   7AC9 DD 7E FE      [19] 1566 	ld	a,-2 (ix)
   7ACC 91            [ 4] 1567 	sub	a, c
   7ACD DD 7E FF      [19] 1568 	ld	a,-1 (ix)
   7AD0 98            [ 4] 1569 	sbc	a, b
   7AD1 E2 D6 7A      [10] 1570 	jp	PO, 00278$
   7AD4 EE 80         [ 7] 1571 	xor	a, #0x80
   7AD6                    1572 00278$:
   7AD6 FA E9 7A      [10] 1573 	jp	M,00156$
   7AD9 03            [ 6] 1574 	inc	bc
   7ADA 03            [ 6] 1575 	inc	bc
   7ADB 03            [ 6] 1576 	inc	bc
   7ADC 03            [ 6] 1577 	inc	bc
   7ADD 79            [ 4] 1578 	ld	a,c
   7ADE 93            [ 4] 1579 	sub	a, e
   7ADF 78            [ 4] 1580 	ld	a,b
   7AE0 9A            [ 4] 1581 	sbc	a, d
   7AE1 E2 E6 7A      [10] 1582 	jp	PO, 00279$
   7AE4 EE 80         [ 7] 1583 	xor	a, #0x80
   7AE6                    1584 00279$:
   7AE6 F2 EF 7A      [10] 1585 	jp	P,00157$
   7AE9                    1586 00156$:
                           1587 ;src/main.c:323: colisiona = 0;
   7AE9 DD 36 F7 00   [19] 1588 	ld	-9 (ix),#0x00
   7AED 18 49         [12] 1589 	jr	00165$
   7AEF                    1590 00157$:
                           1591 ;src/main.c:326: if(cu.y > enemy->y){ //si el cu esta abajo
   7AEF 21 0F 6A      [10] 1592 	ld	hl, #(_cu + 0x0001) + 0
   7AF2 4E            [ 7] 1593 	ld	c,(hl)
   7AF3 DD 6E F8      [19] 1594 	ld	l,-8 (ix)
   7AF6 DD 66 F9      [19] 1595 	ld	h,-7 (ix)
   7AF9 5E            [ 7] 1596 	ld	e,(hl)
   7AFA 7B            [ 4] 1597 	ld	a,e
   7AFB 91            [ 4] 1598 	sub	a, c
   7AFC 30 2C         [12] 1599 	jr	NC,00154$
                           1600 ;src/main.c:327: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   7AFE 06 00         [ 7] 1601 	ld	b,#0x00
   7B00 16 00         [ 7] 1602 	ld	d,#0x00
   7B02 21 16 00      [10] 1603 	ld	hl,#0x0016
   7B05 19            [11] 1604 	add	hl,de
   7B06 79            [ 4] 1605 	ld	a,c
   7B07 95            [ 4] 1606 	sub	a, l
   7B08 4F            [ 4] 1607 	ld	c,a
   7B09 78            [ 4] 1608 	ld	a,b
   7B0A 9C            [ 4] 1609 	sbc	a, h
   7B0B 47            [ 4] 1610 	ld	b,a
   7B0C 3E 02         [ 7] 1611 	ld	a,#0x02
   7B0E B9            [ 4] 1612 	cp	a, c
   7B0F 3E 00         [ 7] 1613 	ld	a,#0x00
   7B11 98            [ 4] 1614 	sbc	a, b
   7B12 E2 17 7B      [10] 1615 	jp	PO, 00280$
   7B15 EE 80         [ 7] 1616 	xor	a, #0x80
   7B17                    1617 00280$:
   7B17 F2 20 7B      [10] 1618 	jp	P,00151$
                           1619 ;src/main.c:328: colisiona = 0;
   7B1A DD 36 F7 00   [19] 1620 	ld	-9 (ix),#0x00
   7B1E 18 18         [12] 1621 	jr	00165$
   7B20                    1622 00151$:
                           1623 ;src/main.c:331: enemy->muerto = SI;
   7B20 DD 6E FA      [19] 1624 	ld	l,-6 (ix)
   7B23 DD 66 FB      [19] 1625 	ld	h,-5 (ix)
   7B26 36 01         [10] 1626 	ld	(hl),#0x01
   7B28 18 0E         [12] 1627 	jr	00165$
   7B2A                    1628 00154$:
                           1629 ;src/main.c:335: colisiona = 0;
   7B2A DD 36 F7 00   [19] 1630 	ld	-9 (ix),#0x00
   7B2E 18 08         [12] 1631 	jr	00165$
   7B30                    1632 00161$:
                           1633 ;src/main.c:339: enemy->mira = M_arriba;
   7B30 DD 6E FC      [19] 1634 	ld	l,-4 (ix)
   7B33 DD 66 FD      [19] 1635 	ld	h,-3 (ix)
   7B36 36 02         [10] 1636 	ld	(hl),#0x02
                           1637 ;src/main.c:342: }
   7B38                    1638 00165$:
                           1639 ;src/main.c:343: return colisiona;
   7B38 DD 6E F7      [19] 1640 	ld	l,-9 (ix)
   7B3B DD F9         [10] 1641 	ld	sp, ix
   7B3D DD E1         [14] 1642 	pop	ix
   7B3F C9            [10] 1643 	ret
                           1644 ;src/main.c:346: void moverEnemigoArriba(TEnemy *enemy){
                           1645 ;	---------------------------------
                           1646 ; Function moverEnemigoArriba
                           1647 ; ---------------------------------
   7B40                    1648 _moverEnemigoArriba::
   7B40 DD E5         [15] 1649 	push	ix
   7B42 DD 21 00 00   [14] 1650 	ld	ix,#0
   7B46 DD 39         [15] 1651 	add	ix,sp
                           1652 ;src/main.c:347: enemy->y--;
   7B48 DD 4E 04      [19] 1653 	ld	c,4 (ix)
   7B4B DD 46 05      [19] 1654 	ld	b,5 (ix)
   7B4E 69            [ 4] 1655 	ld	l, c
   7B4F 60            [ 4] 1656 	ld	h, b
   7B50 23            [ 6] 1657 	inc	hl
   7B51 5E            [ 7] 1658 	ld	e,(hl)
   7B52 1D            [ 4] 1659 	dec	e
   7B53 73            [ 7] 1660 	ld	(hl),e
                           1661 ;src/main.c:348: enemy->y--;
   7B54 1D            [ 4] 1662 	dec	e
   7B55 73            [ 7] 1663 	ld	(hl),e
                           1664 ;src/main.c:349: enemy->mover = SI;
   7B56 21 06 00      [10] 1665 	ld	hl,#0x0006
   7B59 09            [11] 1666 	add	hl,bc
   7B5A 36 01         [10] 1667 	ld	(hl),#0x01
   7B5C DD E1         [14] 1668 	pop	ix
   7B5E C9            [10] 1669 	ret
                           1670 ;src/main.c:352: void moverEnemigoAbajo(TEnemy *enemy){
                           1671 ;	---------------------------------
                           1672 ; Function moverEnemigoAbajo
                           1673 ; ---------------------------------
   7B5F                    1674 _moverEnemigoAbajo::
   7B5F DD E5         [15] 1675 	push	ix
   7B61 DD 21 00 00   [14] 1676 	ld	ix,#0
   7B65 DD 39         [15] 1677 	add	ix,sp
                           1678 ;src/main.c:353: enemy->y++;
   7B67 DD 4E 04      [19] 1679 	ld	c,4 (ix)
   7B6A DD 46 05      [19] 1680 	ld	b,5 (ix)
   7B6D 59            [ 4] 1681 	ld	e, c
   7B6E 50            [ 4] 1682 	ld	d, b
   7B6F 13            [ 6] 1683 	inc	de
   7B70 1A            [ 7] 1684 	ld	a,(de)
   7B71 3C            [ 4] 1685 	inc	a
   7B72 12            [ 7] 1686 	ld	(de),a
                           1687 ;src/main.c:354: enemy->y++;
   7B73 3C            [ 4] 1688 	inc	a
   7B74 12            [ 7] 1689 	ld	(de),a
                           1690 ;src/main.c:355: enemy->mover = SI;
   7B75 21 06 00      [10] 1691 	ld	hl,#0x0006
   7B78 09            [11] 1692 	add	hl,bc
   7B79 36 01         [10] 1693 	ld	(hl),#0x01
   7B7B DD E1         [14] 1694 	pop	ix
   7B7D C9            [10] 1695 	ret
                           1696 ;src/main.c:358: void moverEnemigoDerecha(TEnemy *enemy){
                           1697 ;	---------------------------------
                           1698 ; Function moverEnemigoDerecha
                           1699 ; ---------------------------------
   7B7E                    1700 _moverEnemigoDerecha::
                           1701 ;src/main.c:359: enemy->x++;
   7B7E D1            [10] 1702 	pop	de
   7B7F C1            [10] 1703 	pop	bc
   7B80 C5            [11] 1704 	push	bc
   7B81 D5            [11] 1705 	push	de
   7B82 0A            [ 7] 1706 	ld	a,(bc)
   7B83 3C            [ 4] 1707 	inc	a
   7B84 02            [ 7] 1708 	ld	(bc),a
                           1709 ;src/main.c:360: enemy->x++;
   7B85 3C            [ 4] 1710 	inc	a
   7B86 02            [ 7] 1711 	ld	(bc),a
                           1712 ;src/main.c:361: enemy->mover = SI;
   7B87 21 06 00      [10] 1713 	ld	hl,#0x0006
   7B8A 09            [11] 1714 	add	hl,bc
   7B8B 36 01         [10] 1715 	ld	(hl),#0x01
   7B8D C9            [10] 1716 	ret
                           1717 ;src/main.c:364: void moverEnemigoIzquierda(TEnemy *enemy){
                           1718 ;	---------------------------------
                           1719 ; Function moverEnemigoIzquierda
                           1720 ; ---------------------------------
   7B8E                    1721 _moverEnemigoIzquierda::
                           1722 ;src/main.c:365: enemy->x--;
   7B8E D1            [10] 1723 	pop	de
   7B8F C1            [10] 1724 	pop	bc
   7B90 C5            [11] 1725 	push	bc
   7B91 D5            [11] 1726 	push	de
   7B92 0A            [ 7] 1727 	ld	a,(bc)
   7B93 C6 FF         [ 7] 1728 	add	a,#0xFF
   7B95 02            [ 7] 1729 	ld	(bc),a
                           1730 ;src/main.c:366: enemy->x--;
   7B96 C6 FF         [ 7] 1731 	add	a,#0xFF
   7B98 02            [ 7] 1732 	ld	(bc),a
                           1733 ;src/main.c:367: enemy->mover = SI;
   7B99 21 06 00      [10] 1734 	ld	hl,#0x0006
   7B9C 09            [11] 1735 	add	hl,bc
   7B9D 36 01         [10] 1736 	ld	(hl),#0x01
   7B9F C9            [10] 1737 	ret
                           1738 ;src/main.c:370: void moverEnemigo(TEnemy *enemy){
                           1739 ;	---------------------------------
                           1740 ; Function moverEnemigo
                           1741 ; ---------------------------------
   7BA0                    1742 _moverEnemigo::
                           1743 ;src/main.c:371: if(!enemy->muerto){
   7BA0 D1            [10] 1744 	pop	de
   7BA1 C1            [10] 1745 	pop	bc
   7BA2 C5            [11] 1746 	push	bc
   7BA3 D5            [11] 1747 	push	de
   7BA4 C5            [11] 1748 	push	bc
   7BA5 FD E1         [14] 1749 	pop	iy
   7BA7 FD 7E 08      [19] 1750 	ld	a,8 (iy)
   7BAA B7            [ 4] 1751 	or	a, a
   7BAB C0            [11] 1752 	ret	NZ
                           1753 ;src/main.c:372: if(!checkEnemyCollision(enemy->mira, enemy)){
   7BAC 21 07 00      [10] 1754 	ld	hl,#0x0007
   7BAF 09            [11] 1755 	add	hl,bc
   7BB0 56            [ 7] 1756 	ld	d,(hl)
   7BB1 E5            [11] 1757 	push	hl
   7BB2 C5            [11] 1758 	push	bc
   7BB3 C5            [11] 1759 	push	bc
   7BB4 D5            [11] 1760 	push	de
   7BB5 33            [ 6] 1761 	inc	sp
   7BB6 CD 45 77      [17] 1762 	call	_checkEnemyCollision
   7BB9 F1            [10] 1763 	pop	af
   7BBA 33            [ 6] 1764 	inc	sp
   7BBB 7D            [ 4] 1765 	ld	a,l
   7BBC C1            [10] 1766 	pop	bc
   7BBD E1            [10] 1767 	pop	hl
   7BBE B7            [ 4] 1768 	or	a, a
   7BBF C0            [11] 1769 	ret	NZ
                           1770 ;src/main.c:374: switch (enemy->mira) {
   7BC0 5E            [ 7] 1771 	ld	e,(hl)
   7BC1 3E 03         [ 7] 1772 	ld	a,#0x03
   7BC3 93            [ 4] 1773 	sub	a, e
   7BC4 D8            [11] 1774 	ret	C
   7BC5 16 00         [ 7] 1775 	ld	d,#0x00
   7BC7 21 CD 7B      [10] 1776 	ld	hl,#00124$
   7BCA 19            [11] 1777 	add	hl,de
   7BCB 19            [11] 1778 	add	hl,de
                           1779 ;src/main.c:376: case 0:
   7BCC E9            [ 4] 1780 	jp	(hl)
   7BCD                    1781 00124$:
   7BCD 18 06         [12] 1782 	jr	00101$
   7BCF 18 0A         [12] 1783 	jr	00102$
   7BD1 18 0E         [12] 1784 	jr	00103$
   7BD3 18 12         [12] 1785 	jr	00104$
   7BD5                    1786 00101$:
                           1787 ;src/main.c:377: moverEnemigoDerecha(enemy);
   7BD5 C5            [11] 1788 	push	bc
   7BD6 CD 7E 7B      [17] 1789 	call	_moverEnemigoDerecha
   7BD9 F1            [10] 1790 	pop	af
                           1791 ;src/main.c:378: break;
   7BDA C9            [10] 1792 	ret
                           1793 ;src/main.c:379: case 1:
   7BDB                    1794 00102$:
                           1795 ;src/main.c:380: moverEnemigoIzquierda(enemy);
   7BDB C5            [11] 1796 	push	bc
   7BDC CD 8E 7B      [17] 1797 	call	_moverEnemigoIzquierda
   7BDF F1            [10] 1798 	pop	af
                           1799 ;src/main.c:381: break;
   7BE0 C9            [10] 1800 	ret
                           1801 ;src/main.c:382: case 2:
   7BE1                    1802 00103$:
                           1803 ;src/main.c:383: moverEnemigoArriba(enemy);
   7BE1 C5            [11] 1804 	push	bc
   7BE2 CD 40 7B      [17] 1805 	call	_moverEnemigoArriba
   7BE5 F1            [10] 1806 	pop	af
                           1807 ;src/main.c:384: break;
   7BE6 C9            [10] 1808 	ret
                           1809 ;src/main.c:385: case 3:
   7BE7                    1810 00104$:
                           1811 ;src/main.c:386: moverEnemigoAbajo(enemy);
   7BE7 C5            [11] 1812 	push	bc
   7BE8 CD 5F 7B      [17] 1813 	call	_moverEnemigoAbajo
   7BEB F1            [10] 1814 	pop	af
                           1815 ;src/main.c:388: }
   7BEC C9            [10] 1816 	ret
                           1817 ;src/main.c:393: void moverEnemigoPatrol(TEnemy *enemy){
                           1818 ;	---------------------------------
                           1819 ; Function moverEnemigoPatrol
                           1820 ; ---------------------------------
   7BED                    1821 _moverEnemigoPatrol::
   7BED DD E5         [15] 1822 	push	ix
   7BEF DD 21 00 00   [14] 1823 	ld	ix,#0
   7BF3 DD 39         [15] 1824 	add	ix,sp
   7BF5 21 F3 FF      [10] 1825 	ld	hl,#-13
   7BF8 39            [11] 1826 	add	hl,sp
   7BF9 F9            [ 6] 1827 	ld	sp,hl
                           1828 ;src/main.c:394: if(!enemy->muerto){
   7BFA DD 4E 04      [19] 1829 	ld	c,4 (ix)
   7BFD DD 46 05      [19] 1830 	ld	b,5 (ix)
   7C00 C5            [11] 1831 	push	bc
   7C01 FD E1         [14] 1832 	pop	iy
   7C03 FD 7E 08      [19] 1833 	ld	a,8 (iy)
   7C06 B7            [ 4] 1834 	or	a, a
   7C07 C2 1B 7D      [10] 1835 	jp	NZ,00112$
                           1836 ;src/main.c:396: if (!enemy->reversePatrol) {
   7C0A 21 0D 00      [10] 1837 	ld	hl,#0x000D
   7C0D 09            [11] 1838 	add	hl,bc
   7C0E DD 75 F6      [19] 1839 	ld	-10 (ix),l
   7C11 DD 74 F7      [19] 1840 	ld	-9 (ix),h
   7C14 DD 6E F6      [19] 1841 	ld	l,-10 (ix)
   7C17 DD 66 F7      [19] 1842 	ld	h,-9 (ix)
   7C1A 7E            [ 7] 1843 	ld	a,(hl)
   7C1B DD 77 F5      [19] 1844 	ld	-11 (ix),a
                           1845 ;src/main.c:397: if(enemy->iter < enemy->longitud_camino - 8){
   7C1E 21 0F 00      [10] 1846 	ld	hl,#0x000F
   7C21 09            [11] 1847 	add	hl,bc
   7C22 EB            [ 4] 1848 	ex	de,hl
                           1849 ;src/main.c:398: enemy->x = enemy->camino[enemy->iter];
   7C23 21 19 00      [10] 1850 	ld	hl,#0x0019
   7C26 09            [11] 1851 	add	hl,bc
   7C27 E3            [19] 1852 	ex	(sp), hl
                           1853 ;src/main.c:400: enemy->y = enemy->camino[enemy->iter];
   7C28 21 01 00      [10] 1854 	ld	hl,#0x0001
   7C2B 09            [11] 1855 	add	hl,bc
   7C2C DD 75 FE      [19] 1856 	ld	-2 (ix),l
   7C2F DD 74 FF      [19] 1857 	ld	-1 (ix),h
                           1858 ;src/main.c:402: enemy->mover = SI;
   7C32 21 06 00      [10] 1859 	ld	hl,#0x0006
   7C35 09            [11] 1860 	add	hl,bc
   7C36 DD 75 FC      [19] 1861 	ld	-4 (ix),l
   7C39 DD 74 FD      [19] 1862 	ld	-3 (ix),h
                           1863 ;src/main.c:405: enemy->lastIter = enemy->iter - 1;
   7C3C 21 10 00      [10] 1864 	ld	hl,#0x0010
   7C3F 09            [11] 1865 	add	hl,bc
   7C40 DD 75 FA      [19] 1866 	ld	-6 (ix),l
   7C43 DD 74 FB      [19] 1867 	ld	-5 (ix),h
                           1868 ;src/main.c:396: if (!enemy->reversePatrol) {
   7C46 DD 7E F5      [19] 1869 	ld	a,-11 (ix)
   7C49 B7            [ 4] 1870 	or	a, a
   7C4A 20 7C         [12] 1871 	jr	NZ,00108$
                           1872 ;src/main.c:397: if(enemy->iter < enemy->longitud_camino - 8){
   7C4C 1A            [ 7] 1873 	ld	a,(de)
   7C4D DD 77 F5      [19] 1874 	ld	-11 (ix),a
   7C50 69            [ 4] 1875 	ld	l, c
   7C51 60            [ 4] 1876 	ld	h, b
   7C52 C5            [11] 1877 	push	bc
   7C53 01 45 01      [10] 1878 	ld	bc, #0x0145
   7C56 09            [11] 1879 	add	hl, bc
   7C57 C1            [10] 1880 	pop	bc
   7C58 6E            [ 7] 1881 	ld	l,(hl)
   7C59 26 00         [ 7] 1882 	ld	h,#0x00
   7C5B 7D            [ 4] 1883 	ld	a,l
   7C5C C6 F8         [ 7] 1884 	add	a,#0xF8
   7C5E DD 77 F8      [19] 1885 	ld	-8 (ix),a
   7C61 7C            [ 4] 1886 	ld	a,h
   7C62 CE FF         [ 7] 1887 	adc	a,#0xFF
   7C64 DD 77 F9      [19] 1888 	ld	-7 (ix),a
   7C67 DD 7E F5      [19] 1889 	ld	a, -11 (ix)
   7C6A 26 00         [ 7] 1890 	ld	h, #0x00
   7C6C DD 96 F8      [19] 1891 	sub	a, -8 (ix)
   7C6F 7C            [ 4] 1892 	ld	a,h
   7C70 DD 9E F9      [19] 1893 	sbc	a, -7 (ix)
   7C73 E2 78 7C      [10] 1894 	jp	PO, 00130$
   7C76 EE 80         [ 7] 1895 	xor	a, #0x80
   7C78                    1896 00130$:
   7C78 F2 B3 7C      [10] 1897 	jp	P,00102$
                           1898 ;src/main.c:398: enemy->x = enemy->camino[enemy->iter];
   7C7B DD 6E F5      [19] 1899 	ld	l,-11 (ix)
   7C7E 26 00         [ 7] 1900 	ld	h,#0x00
   7C80 DD 7E F3      [19] 1901 	ld	a,-13 (ix)
   7C83 85            [ 4] 1902 	add	a, l
   7C84 6F            [ 4] 1903 	ld	l,a
   7C85 DD 7E F4      [19] 1904 	ld	a,-12 (ix)
   7C88 8C            [ 4] 1905 	adc	a, h
   7C89 67            [ 4] 1906 	ld	h,a
   7C8A 7E            [ 7] 1907 	ld	a,(hl)
   7C8B 02            [ 7] 1908 	ld	(bc),a
                           1909 ;src/main.c:399: enemy->iter++;
   7C8C 1A            [ 7] 1910 	ld	a,(de)
   7C8D 4F            [ 4] 1911 	ld	c,a
   7C8E 0C            [ 4] 1912 	inc	c
   7C8F 79            [ 4] 1913 	ld	a,c
   7C90 12            [ 7] 1914 	ld	(de),a
                           1915 ;src/main.c:400: enemy->y = enemy->camino[enemy->iter];
   7C91 69            [ 4] 1916 	ld	l,c
   7C92 26 00         [ 7] 1917 	ld	h,#0x00
   7C94 DD 7E F3      [19] 1918 	ld	a,-13 (ix)
   7C97 85            [ 4] 1919 	add	a, l
   7C98 6F            [ 4] 1920 	ld	l,a
   7C99 DD 7E F4      [19] 1921 	ld	a,-12 (ix)
   7C9C 8C            [ 4] 1922 	adc	a, h
   7C9D 67            [ 4] 1923 	ld	h,a
   7C9E 46            [ 7] 1924 	ld	b,(hl)
   7C9F DD 6E FE      [19] 1925 	ld	l,-2 (ix)
   7CA2 DD 66 FF      [19] 1926 	ld	h,-1 (ix)
   7CA5 70            [ 7] 1927 	ld	(hl),b
                           1928 ;src/main.c:401: enemy->iter++;
   7CA6 0C            [ 4] 1929 	inc	c
   7CA7 79            [ 4] 1930 	ld	a,c
   7CA8 12            [ 7] 1931 	ld	(de),a
                           1932 ;src/main.c:402: enemy->mover = SI;
   7CA9 DD 6E FC      [19] 1933 	ld	l,-4 (ix)
   7CAC DD 66 FD      [19] 1934 	ld	h,-3 (ix)
   7CAF 36 01         [10] 1935 	ld	(hl),#0x01
   7CB1 18 68         [12] 1936 	jr	00112$
   7CB3                    1937 00102$:
                           1938 ;src/main.c:405: enemy->lastIter = enemy->iter - 1;
   7CB3 DD 4E F5      [19] 1939 	ld	c,-11 (ix)
   7CB6 0D            [ 4] 1940 	dec	c
   7CB7 DD 6E FA      [19] 1941 	ld	l,-6 (ix)
   7CBA DD 66 FB      [19] 1942 	ld	h,-5 (ix)
   7CBD 71            [ 7] 1943 	ld	(hl),c
                           1944 ;src/main.c:408: enemy->reversePatrol = 1;
   7CBE DD 6E F6      [19] 1945 	ld	l,-10 (ix)
   7CC1 DD 66 F7      [19] 1946 	ld	h,-9 (ix)
   7CC4 36 01         [10] 1947 	ld	(hl),#0x01
   7CC6 18 53         [12] 1948 	jr	00112$
   7CC8                    1949 00108$:
                           1950 ;src/main.c:411: if(enemy->lastIter > 1){
   7CC8 DD 6E FA      [19] 1951 	ld	l,-6 (ix)
   7CCB DD 66 FB      [19] 1952 	ld	h,-5 (ix)
   7CCE 6E            [ 7] 1953 	ld	l,(hl)
   7CCF 3E 01         [ 7] 1954 	ld	a,#0x01
   7CD1 95            [ 4] 1955 	sub	a, l
   7CD2 30 3D         [12] 1956 	jr	NC,00105$
                           1957 ;src/main.c:412: enemy->y = enemy->camino[enemy->lastIter];
   7CD4 26 00         [ 7] 1958 	ld	h,#0x00
   7CD6 D1            [10] 1959 	pop	de
   7CD7 D5            [11] 1960 	push	de
   7CD8 19            [11] 1961 	add	hl,de
   7CD9 5E            [ 7] 1962 	ld	e,(hl)
   7CDA DD 6E FE      [19] 1963 	ld	l,-2 (ix)
   7CDD DD 66 FF      [19] 1964 	ld	h,-1 (ix)
   7CE0 73            [ 7] 1965 	ld	(hl),e
                           1966 ;src/main.c:413: enemy->lastIter--;
   7CE1 DD 6E FA      [19] 1967 	ld	l,-6 (ix)
   7CE4 DD 66 FB      [19] 1968 	ld	h,-5 (ix)
   7CE7 5E            [ 7] 1969 	ld	e,(hl)
   7CE8 1D            [ 4] 1970 	dec	e
   7CE9 DD 6E FA      [19] 1971 	ld	l,-6 (ix)
   7CEC DD 66 FB      [19] 1972 	ld	h,-5 (ix)
   7CEF 73            [ 7] 1973 	ld	(hl),e
                           1974 ;src/main.c:414: enemy->x = enemy->camino[enemy->lastIter];
   7CF0 6B            [ 4] 1975 	ld	l,e
   7CF1 26 00         [ 7] 1976 	ld	h,#0x00
   7CF3 DD 7E F3      [19] 1977 	ld	a,-13 (ix)
   7CF6 85            [ 4] 1978 	add	a, l
   7CF7 6F            [ 4] 1979 	ld	l,a
   7CF8 DD 7E F4      [19] 1980 	ld	a,-12 (ix)
   7CFB 8C            [ 4] 1981 	adc	a, h
   7CFC 67            [ 4] 1982 	ld	h,a
   7CFD 7E            [ 7] 1983 	ld	a,(hl)
   7CFE 02            [ 7] 1984 	ld	(bc),a
                           1985 ;src/main.c:415: enemy->lastIter--;
   7CFF 1D            [ 4] 1986 	dec	e
   7D00 DD 6E FA      [19] 1987 	ld	l,-6 (ix)
   7D03 DD 66 FB      [19] 1988 	ld	h,-5 (ix)
   7D06 73            [ 7] 1989 	ld	(hl),e
                           1990 ;src/main.c:416: enemy->mover = SI;
   7D07 DD 6E FC      [19] 1991 	ld	l,-4 (ix)
   7D0A DD 66 FD      [19] 1992 	ld	h,-3 (ix)
   7D0D 36 01         [10] 1993 	ld	(hl),#0x01
   7D0F 18 0A         [12] 1994 	jr	00112$
   7D11                    1995 00105$:
                           1996 ;src/main.c:419: enemy->iter = 0;
   7D11 AF            [ 4] 1997 	xor	a, a
   7D12 12            [ 7] 1998 	ld	(de),a
                           1999 ;src/main.c:421: enemy->reversePatrol = 0;
   7D13 DD 6E F6      [19] 2000 	ld	l,-10 (ix)
   7D16 DD 66 F7      [19] 2001 	ld	h,-9 (ix)
   7D19 36 00         [10] 2002 	ld	(hl),#0x00
   7D1B                    2003 00112$:
   7D1B DD F9         [10] 2004 	ld	sp, ix
   7D1D DD E1         [14] 2005 	pop	ix
   7D1F C9            [10] 2006 	ret
                           2007 ;src/main.c:430: void lookFor(TEnemy* enemy){
                           2008 ;	---------------------------------
                           2009 ; Function lookFor
                           2010 ; ---------------------------------
   7D20                    2011 _lookFor::
   7D20 DD E5         [15] 2012 	push	ix
   7D22 DD 21 00 00   [14] 2013 	ld	ix,#0
   7D26 DD 39         [15] 2014 	add	ix,sp
   7D28 21 FA FF      [10] 2015 	ld	hl,#-6
   7D2B 39            [11] 2016 	add	hl,sp
   7D2C F9            [ 6] 2017 	ld	sp,hl
                           2018 ;src/main.c:437: u8 difx = abs(enemy->x - prota.x);
   7D2D DD 4E 04      [19] 2019 	ld	c,4 (ix)
   7D30 DD 46 05      [19] 2020 	ld	b,5 (ix)
   7D33 0A            [ 7] 2021 	ld	a,(bc)
   7D34 5F            [ 4] 2022 	ld	e,a
   7D35 16 00         [ 7] 2023 	ld	d,#0x00
   7D37 21 06 6A      [10] 2024 	ld	hl,#_prota+0
   7D3A 6E            [ 7] 2025 	ld	l,(hl)
   7D3B 26 00         [ 7] 2026 	ld	h,#0x00
   7D3D 7B            [ 4] 2027 	ld	a,e
   7D3E 95            [ 4] 2028 	sub	a, l
   7D3F 5F            [ 4] 2029 	ld	e,a
   7D40 7A            [ 4] 2030 	ld	a,d
   7D41 9C            [ 4] 2031 	sbc	a, h
   7D42 57            [ 4] 2032 	ld	d,a
   7D43 C5            [11] 2033 	push	bc
   7D44 D5            [11] 2034 	push	de
   7D45 CD EE 4F      [17] 2035 	call	_abs
   7D48 F1            [10] 2036 	pop	af
   7D49 C1            [10] 2037 	pop	bc
   7D4A DD 75 FA      [19] 2038 	ld	-6 (ix),l
                           2039 ;src/main.c:438: u8 dify = abs(enemy->y - prota.y);
   7D4D 59            [ 4] 2040 	ld	e, c
   7D4E 50            [ 4] 2041 	ld	d, b
   7D4F 13            [ 6] 2042 	inc	de
   7D50 1A            [ 7] 2043 	ld	a,(de)
   7D51 DD 77 FC      [19] 2044 	ld	-4 (ix),a
   7D54 DD 36 FD 00   [19] 2045 	ld	-3 (ix),#0x00
   7D58 21 07 6A      [10] 2046 	ld	hl, #(_prota + 0x0001) + 0
   7D5B 6E            [ 7] 2047 	ld	l,(hl)
   7D5C 26 00         [ 7] 2048 	ld	h,#0x00
   7D5E DD 7E FC      [19] 2049 	ld	a,-4 (ix)
   7D61 95            [ 4] 2050 	sub	a, l
   7D62 6F            [ 4] 2051 	ld	l,a
   7D63 DD 7E FD      [19] 2052 	ld	a,-3 (ix)
   7D66 9C            [ 4] 2053 	sbc	a, h
   7D67 67            [ 4] 2054 	ld	h,a
   7D68 C5            [11] 2055 	push	bc
   7D69 D5            [11] 2056 	push	de
   7D6A E5            [11] 2057 	push	hl
   7D6B CD EE 4F      [17] 2058 	call	_abs
   7D6E F1            [10] 2059 	pop	af
   7D6F D1            [10] 2060 	pop	de
   7D70 C1            [10] 2061 	pop	bc
                           2062 ;src/main.c:439: dist = difx + dify; // manhattan
   7D71 DD 7E FA      [19] 2063 	ld	a,-6 (ix)
   7D74 85            [ 4] 2064 	add	a, l
   7D75 DD 77 FB      [19] 2065 	ld	-5 (ix),a
                           2066 ;src/main.c:441: enemy->seen = NO;
   7D78 21 12 00      [10] 2067 	ld	hl,#0x0012
   7D7B 09            [11] 2068 	add	hl,bc
   7D7C DD 75 FC      [19] 2069 	ld	-4 (ix),l
   7D7F DD 74 FD      [19] 2070 	ld	-3 (ix),h
   7D82 DD 6E FC      [19] 2071 	ld	l,-4 (ix)
   7D85 DD 66 FD      [19] 2072 	ld	h,-3 (ix)
   7D88 36 00         [10] 2073 	ld	(hl),#0x00
                           2074 ;src/main.c:442: enemy->inRange = NO;
   7D8A 21 11 00      [10] 2075 	ld	hl,#0x0011
   7D8D 09            [11] 2076 	add	hl,bc
   7D8E DD 75 FE      [19] 2077 	ld	-2 (ix),l
   7D91 DD 74 FF      [19] 2078 	ld	-1 (ix),h
   7D94 DD 6E FE      [19] 2079 	ld	l,-2 (ix)
   7D97 DD 66 FF      [19] 2080 	ld	h,-1 (ix)
   7D9A 36 00         [10] 2081 	ld	(hl),#0x00
                           2082 ;src/main.c:444: if (dist <= 10) {// te detectan los sensores de proximidad
   7D9C 3E 0A         [ 7] 2083 	ld	a,#0x0A
   7D9E DD 96 FB      [19] 2084 	sub	a, -5 (ix)
   7DA1 3E 00         [ 7] 2085 	ld	a,#0x00
   7DA3 17            [ 4] 2086 	rla
   7DA4 CB 47         [ 8] 2087 	bit	0,a
   7DA6 20 12         [12] 2088 	jr	NZ,00116$
                           2089 ;src/main.c:445: enemy->seen = 1;
   7DA8 DD 6E FC      [19] 2090 	ld	l,-4 (ix)
   7DAB DD 66 FD      [19] 2091 	ld	h,-3 (ix)
   7DAE 36 01         [10] 2092 	ld	(hl),#0x01
                           2093 ;src/main.c:446: enemy->inRange = 1;
   7DB0 DD 6E FE      [19] 2094 	ld	l,-2 (ix)
   7DB3 DD 66 FF      [19] 2095 	ld	h,-1 (ix)
   7DB6 36 01         [10] 2096 	ld	(hl),#0x01
   7DB8 18 5B         [12] 2097 	jr	00118$
   7DBA                    2098 00116$:
                           2099 ;src/main.c:447: } else if(dist > 10){
   7DBA CB 47         [ 8] 2100 	bit	0,a
   7DBC 28 57         [12] 2101 	jr	Z,00118$
                           2102 ;src/main.c:448: if(enemy->y > prota.y - 4 && enemy->y < prota.y + 4){
   7DBE 1A            [ 7] 2103 	ld	a,(de)
   7DBF 5F            [ 4] 2104 	ld	e,a
   7DC0 21 07 6A      [10] 2105 	ld	hl, #(_prota + 0x0001) + 0
   7DC3 6E            [ 7] 2106 	ld	l,(hl)
   7DC4 26 00         [ 7] 2107 	ld	h,#0x00
   7DC6 7D            [ 4] 2108 	ld	a,l
   7DC7 C6 FC         [ 7] 2109 	add	a,#0xFC
   7DC9 DD 77 FE      [19] 2110 	ld	-2 (ix),a
   7DCC 7C            [ 4] 2111 	ld	a,h
   7DCD CE FF         [ 7] 2112 	adc	a,#0xFF
   7DCF DD 77 FF      [19] 2113 	ld	-1 (ix),a
   7DD2 16 00         [ 7] 2114 	ld	d,#0x00
   7DD4 DD 7E FE      [19] 2115 	ld	a,-2 (ix)
   7DD7 93            [ 4] 2116 	sub	a, e
   7DD8 DD 7E FF      [19] 2117 	ld	a,-1 (ix)
   7DDB 9A            [ 4] 2118 	sbc	a, d
   7DDC E2 E1 7D      [10] 2119 	jp	PO, 00146$
   7DDF EE 80         [ 7] 2120 	xor	a, #0x80
   7DE1                    2121 00146$:
   7DE1 F2 15 7E      [10] 2122 	jp	P,00118$
   7DE4 23            [ 6] 2123 	inc	hl
   7DE5 23            [ 6] 2124 	inc	hl
   7DE6 23            [ 6] 2125 	inc	hl
   7DE7 23            [ 6] 2126 	inc	hl
   7DE8 7B            [ 4] 2127 	ld	a,e
   7DE9 95            [ 4] 2128 	sub	a, l
   7DEA 7A            [ 4] 2129 	ld	a,d
   7DEB 9C            [ 4] 2130 	sbc	a, h
   7DEC E2 F1 7D      [10] 2131 	jp	PO, 00147$
   7DEF EE 80         [ 7] 2132 	xor	a, #0x80
   7DF1                    2133 00147$:
   7DF1 F2 15 7E      [10] 2134 	jp	P,00118$
                           2135 ;src/main.c:449: if(enemy->x > prota.x){
   7DF4 0A            [ 7] 2136 	ld	a,(bc)
   7DF5 4F            [ 4] 2137 	ld	c,a
   7DF6 3A 06 6A      [13] 2138 	ld	a,(#_prota + 0)
   7DF9 91            [ 4] 2139 	sub	a, c
   7DFA 3E 00         [ 7] 2140 	ld	a,#0x00
   7DFC 17            [ 4] 2141 	rla
   7DFD B7            [ 4] 2142 	or	a, a
   7DFE 28 0A         [12] 2143 	jr	Z,00108$
                           2144 ;src/main.c:457: enemy->seen = SI;
   7E00 DD 6E FC      [19] 2145 	ld	l,-4 (ix)
   7E03 DD 66 FD      [19] 2146 	ld	h,-3 (ix)
   7E06 36 01         [10] 2147 	ld	(hl),#0x01
   7E08 18 0B         [12] 2148 	jr	00118$
   7E0A                    2149 00108$:
                           2150 ;src/main.c:459: }else if(enemy->x > prota.x){
   7E0A B7            [ 4] 2151 	or	a, a
   7E0B 28 08         [12] 2152 	jr	Z,00118$
                           2153 ;src/main.c:467: enemy->seen = SI;
   7E0D DD 6E FC      [19] 2154 	ld	l,-4 (ix)
   7E10 DD 66 FD      [19] 2155 	ld	h,-3 (ix)
   7E13 36 01         [10] 2156 	ld	(hl),#0x01
   7E15                    2157 00118$:
   7E15 DD F9         [10] 2158 	ld	sp, ix
   7E17 DD E1         [14] 2159 	pop	ix
   7E19 C9            [10] 2160 	ret
                           2161 ;src/main.c:474: void moverEnemigoSeek(TEnemy* enemy){
                           2162 ;	---------------------------------
                           2163 ; Function moverEnemigoSeek
                           2164 ; ---------------------------------
   7E1A                    2165 _moverEnemigoSeek::
   7E1A DD E5         [15] 2166 	push	ix
   7E1C DD 21 00 00   [14] 2167 	ld	ix,#0
   7E20 DD 39         [15] 2168 	add	ix,sp
   7E22 F5            [11] 2169 	push	af
   7E23 F5            [11] 2170 	push	af
   7E24 3B            [ 6] 2171 	dec	sp
                           2172 ;src/main.c:475: if(!enemy->muerto){
   7E25 DD 4E 04      [19] 2173 	ld	c,4 (ix)
   7E28 DD 46 05      [19] 2174 	ld	b,5 (ix)
   7E2B C5            [11] 2175 	push	bc
   7E2C FD E1         [14] 2176 	pop	iy
   7E2E FD 7E 08      [19] 2177 	ld	a,8 (iy)
   7E31 B7            [ 4] 2178 	or	a, a
   7E32 C2 0D 7F      [10] 2179 	jp	NZ,00108$
                           2180 ;src/main.c:477: if (!enemy->reversePatrol) {
   7E35 21 0D 00      [10] 2181 	ld	hl,#0x000D
   7E38 09            [11] 2182 	add	hl,bc
   7E39 EB            [ 4] 2183 	ex	de,hl
   7E3A 1A            [ 7] 2184 	ld	a,(de)
   7E3B B7            [ 4] 2185 	or	a, a
   7E3C C2 0D 7F      [10] 2186 	jp	NZ,00108$
                           2187 ;src/main.c:478: if(enemy->iter < enemy->longitud_camino - 8){
   7E3F FD 21 0F 00   [14] 2188 	ld	iy,#0x000F
   7E43 FD 09         [15] 2189 	add	iy, bc
   7E45 FD 7E 00      [19] 2190 	ld	a, 0 (iy)
   7E48 DD 77 FF      [19] 2191 	ld	-1 (ix),a
   7E4B 69            [ 4] 2192 	ld	l, c
   7E4C 60            [ 4] 2193 	ld	h, b
   7E4D C5            [11] 2194 	push	bc
   7E4E 01 45 01      [10] 2195 	ld	bc, #0x0145
   7E51 09            [11] 2196 	add	hl, bc
   7E52 C1            [10] 2197 	pop	bc
   7E53 6E            [ 7] 2198 	ld	l,(hl)
   7E54 26 00         [ 7] 2199 	ld	h,#0x00
   7E56 7D            [ 4] 2200 	ld	a,l
   7E57 C6 F8         [ 7] 2201 	add	a,#0xF8
   7E59 DD 77 FB      [19] 2202 	ld	-5 (ix),a
   7E5C 7C            [ 4] 2203 	ld	a,h
   7E5D CE FF         [ 7] 2204 	adc	a,#0xFF
   7E5F DD 77 FC      [19] 2205 	ld	-4 (ix),a
   7E62 DD 6E FF      [19] 2206 	ld	l,-1 (ix)
   7E65 26 00         [ 7] 2207 	ld	h,#0x00
                           2208 ;src/main.c:481: enemy->y = enemy->camino[enemy->iter];
   7E67 79            [ 4] 2209 	ld	a,c
   7E68 C6 01         [ 7] 2210 	add	a, #0x01
   7E6A DD 77 FD      [19] 2211 	ld	-3 (ix),a
   7E6D 78            [ 4] 2212 	ld	a,b
   7E6E CE 00         [ 7] 2213 	adc	a, #0x00
   7E70 DD 77 FE      [19] 2214 	ld	-2 (ix),a
                           2215 ;src/main.c:478: if(enemy->iter < enemy->longitud_camino - 8){
   7E73 7D            [ 4] 2216 	ld	a,l
   7E74 DD 96 FB      [19] 2217 	sub	a, -5 (ix)
   7E77 7C            [ 4] 2218 	ld	a,h
   7E78 DD 9E FC      [19] 2219 	sbc	a, -4 (ix)
   7E7B E2 80 7E      [10] 2220 	jp	PO, 00122$
   7E7E EE 80         [ 7] 2221 	xor	a, #0x80
   7E80                    2222 00122$:
   7E80 F2 B7 7E      [10] 2223 	jp	P,00102$
                           2224 ;src/main.c:479: enemy->x = enemy->camino[enemy->iter];
   7E83 21 19 00      [10] 2225 	ld	hl,#0x0019
   7E86 09            [11] 2226 	add	hl,bc
   7E87 EB            [ 4] 2227 	ex	de,hl
   7E88 DD 6E FF      [19] 2228 	ld	l,-1 (ix)
   7E8B 26 00         [ 7] 2229 	ld	h,#0x00
   7E8D 19            [11] 2230 	add	hl,de
   7E8E 7E            [ 7] 2231 	ld	a,(hl)
   7E8F 02            [ 7] 2232 	ld	(bc),a
                           2233 ;src/main.c:480: enemy->iter++;
   7E90 FD 7E 00      [19] 2234 	ld	a, 0 (iy)
   7E93 3C            [ 4] 2235 	inc	a
   7E94 DD 77 FB      [19] 2236 	ld	-5 (ix), a
   7E97 FD 77 00      [19] 2237 	ld	0 (iy), a
                           2238 ;src/main.c:481: enemy->y = enemy->camino[enemy->iter];
   7E9A DD 6E FB      [19] 2239 	ld	l,-5 (ix)
   7E9D 26 00         [ 7] 2240 	ld	h,#0x00
   7E9F 19            [11] 2241 	add	hl,de
   7EA0 5E            [ 7] 2242 	ld	e,(hl)
   7EA1 DD 6E FD      [19] 2243 	ld	l,-3 (ix)
   7EA4 DD 66 FE      [19] 2244 	ld	h,-2 (ix)
   7EA7 73            [ 7] 2245 	ld	(hl),e
                           2246 ;src/main.c:482: enemy->iter++;
   7EA8 DD 5E FB      [19] 2247 	ld	e,-5 (ix)
   7EAB 1C            [ 4] 2248 	inc	e
   7EAC FD 73 00      [19] 2249 	ld	0 (iy), e
                           2250 ;src/main.c:483: enemy->mover = SI;
   7EAF 21 06 00      [10] 2251 	ld	hl,#0x0006
   7EB2 09            [11] 2252 	add	hl,bc
   7EB3 36 01         [10] 2253 	ld	(hl),#0x01
   7EB5 18 56         [12] 2254 	jr	00108$
   7EB7                    2255 00102$:
                           2256 ;src/main.c:486: enemy->reversePatrol = NO;
   7EB7 AF            [ 4] 2257 	xor	a, a
   7EB8 12            [ 7] 2258 	ld	(de),a
                           2259 ;src/main.c:487: enemy->patrolling = 1;
   7EB9 21 0B 00      [10] 2260 	ld	hl,#0x000B
   7EBC 09            [11] 2261 	add	hl,bc
   7EBD 36 01         [10] 2262 	ld	(hl),#0x01
                           2263 ;src/main.c:488: enemy->onPathPatrol = 1;
   7EBF 21 0C 00      [10] 2264 	ld	hl,#0x000C
   7EC2 09            [11] 2265 	add	hl,bc
   7EC3 36 01         [10] 2266 	ld	(hl),#0x01
                           2267 ;src/main.c:489: enemy->seek = 0;
   7EC5 21 14 00      [10] 2268 	ld	hl,#0x0014
   7EC8 09            [11] 2269 	add	hl,bc
   7EC9 36 00         [10] 2270 	ld	(hl),#0x00
                           2271 ;src/main.c:490: enemy->lastIter = enemy->iter - 1;
   7ECB 21 10 00      [10] 2272 	ld	hl,#0x0010
   7ECE 09            [11] 2273 	add	hl,bc
   7ECF EB            [ 4] 2274 	ex	de,hl
   7ED0 FD 7E 00      [19] 2275 	ld	a, 0 (iy)
   7ED3 C6 FF         [ 7] 2276 	add	a,#0xFF
   7ED5 12            [ 7] 2277 	ld	(de),a
                           2278 ;src/main.c:491: enemy->iter = 0;
   7ED6 FD 36 00 00   [19] 2279 	ld	0 (iy), #0x00
                           2280 ;src/main.c:492: pathFinding(enemy->x, enemy->y, enemy->p_seek_x, enemy->p_seek_y, enemy, mapa);
   7EDA 69            [ 4] 2281 	ld	l, c
   7EDB 60            [ 4] 2282 	ld	h, b
   7EDC 11 18 00      [10] 2283 	ld	de, #0x0018
   7EDF 19            [11] 2284 	add	hl, de
   7EE0 56            [ 7] 2285 	ld	d,(hl)
   7EE1 C5            [11] 2286 	push	bc
   7EE2 FD E1         [14] 2287 	pop	iy
   7EE4 FD 7E 17      [19] 2288 	ld	a,23 (iy)
   7EE7 DD 77 FB      [19] 2289 	ld	-5 (ix),a
   7EEA DD 6E FD      [19] 2290 	ld	l,-3 (ix)
   7EED DD 66 FE      [19] 2291 	ld	h,-2 (ix)
   7EF0 5E            [ 7] 2292 	ld	e,(hl)
   7EF1 0A            [ 7] 2293 	ld	a,(bc)
   7EF2 DD 77 FD      [19] 2294 	ld	-3 (ix),a
   7EF5 2A BE 72      [16] 2295 	ld	hl,(_mapa)
   7EF8 E5            [11] 2296 	push	hl
   7EF9 C5            [11] 2297 	push	bc
   7EFA D5            [11] 2298 	push	de
   7EFB 33            [ 6] 2299 	inc	sp
   7EFC DD 56 FB      [19] 2300 	ld	d, -5 (ix)
   7EFF D5            [11] 2301 	push	de
   7F00 DD 7E FD      [19] 2302 	ld	a,-3 (ix)
   7F03 F5            [11] 2303 	push	af
   7F04 33            [ 6] 2304 	inc	sp
   7F05 CD 9A 47      [17] 2305 	call	_pathFinding
   7F08 21 08 00      [10] 2306 	ld	hl,#8
   7F0B 39            [11] 2307 	add	hl,sp
   7F0C F9            [ 6] 2308 	ld	sp,hl
   7F0D                    2309 00108$:
   7F0D DD F9         [10] 2310 	ld	sp, ix
   7F0F DD E1         [14] 2311 	pop	ix
   7F11 C9            [10] 2312 	ret
                           2313 ;src/main.c:499: void patrol(TEnemy *enemy) {
                           2314 ;	---------------------------------
                           2315 ; Function patrol
                           2316 ; ---------------------------------
   7F12                    2317 _patrol::
                           2318 ;src/main.c:500: if (enemy->onPathPatrol) {
   7F12 D1            [10] 2319 	pop	de
   7F13 C1            [10] 2320 	pop	bc
   7F14 C5            [11] 2321 	push	bc
   7F15 D5            [11] 2322 	push	de
   7F16 C5            [11] 2323 	push	bc
   7F17 FD E1         [14] 2324 	pop	iy
   7F19 FD 7E 0C      [19] 2325 	ld	a,12 (iy)
   7F1C B7            [ 4] 2326 	or	a, a
   7F1D C8            [11] 2327 	ret	Z
                           2328 ;src/main.c:501: moverEnemigoPatrol(enemy);
   7F1E C5            [11] 2329 	push	bc
   7F1F CD ED 7B      [17] 2330 	call	_moverEnemigoPatrol
   7F22 F1            [10] 2331 	pop	af
   7F23 C9            [10] 2332 	ret
                           2333 ;src/main.c:505: void seek(TEnemy* actual){
                           2334 ;	---------------------------------
                           2335 ; Function seek
                           2336 ; ---------------------------------
   7F24                    2337 _seek::
                           2338 ;src/main.c:506: moverEnemigoSeek(actual);
   7F24 C1            [10] 2339 	pop	bc
   7F25 E1            [10] 2340 	pop	hl
   7F26 E5            [11] 2341 	push	hl
   7F27 C5            [11] 2342 	push	bc
   7F28 E5            [11] 2343 	push	hl
   7F29 CD 1A 7E      [17] 2344 	call	_moverEnemigoSeek
   7F2C F1            [10] 2345 	pop	af
   7F2D C9            [10] 2346 	ret
                           2347 ;src/main.c:509: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2348 ;	---------------------------------
                           2349 ; Function engage
                           2350 ; ---------------------------------
   7F2E                    2351 _engage::
   7F2E DD E5         [15] 2352 	push	ix
   7F30 DD 21 00 00   [14] 2353 	ld	ix,#0
   7F34 DD 39         [15] 2354 	add	ix,sp
   7F36 21 F3 FF      [10] 2355 	ld	hl,#-13
   7F39 39            [11] 2356 	add	hl,sp
   7F3A F9            [ 6] 2357 	ld	sp,hl
                           2358 ;src/main.c:510: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7F3B DD 7E 04      [19] 2359 	ld	a,4 (ix)
   7F3E DD 77 F7      [19] 2360 	ld	-9 (ix),a
   7F41 DD 7E 05      [19] 2361 	ld	a,5 (ix)
   7F44 DD 77 F8      [19] 2362 	ld	-8 (ix),a
   7F47 DD 6E F7      [19] 2363 	ld	l,-9 (ix)
   7F4A DD 66 F8      [19] 2364 	ld	h,-8 (ix)
   7F4D 4E            [ 7] 2365 	ld	c,(hl)
   7F4E 06 00         [ 7] 2366 	ld	b,#0x00
   7F50 21 06 6A      [10] 2367 	ld	hl,#_prota+0
   7F53 5E            [ 7] 2368 	ld	e,(hl)
   7F54 16 00         [ 7] 2369 	ld	d,#0x00
   7F56 79            [ 4] 2370 	ld	a,c
   7F57 93            [ 4] 2371 	sub	a, e
   7F58 4F            [ 4] 2372 	ld	c,a
   7F59 78            [ 4] 2373 	ld	a,b
   7F5A 9A            [ 4] 2374 	sbc	a, d
   7F5B 47            [ 4] 2375 	ld	b,a
   7F5C C5            [11] 2376 	push	bc
   7F5D CD EE 4F      [17] 2377 	call	_abs
   7F60 F1            [10] 2378 	pop	af
   7F61 4D            [ 4] 2379 	ld	c,l
                           2380 ;src/main.c:511: u8 dify = abs(enemy->y - prota.y);
   7F62 DD 7E F7      [19] 2381 	ld	a,-9 (ix)
   7F65 C6 01         [ 7] 2382 	add	a, #0x01
   7F67 DD 77 F9      [19] 2383 	ld	-7 (ix),a
   7F6A DD 7E F8      [19] 2384 	ld	a,-8 (ix)
   7F6D CE 00         [ 7] 2385 	adc	a, #0x00
   7F6F DD 77 FA      [19] 2386 	ld	-6 (ix),a
   7F72 DD 6E F9      [19] 2387 	ld	l,-7 (ix)
   7F75 DD 66 FA      [19] 2388 	ld	h,-6 (ix)
   7F78 5E            [ 7] 2389 	ld	e,(hl)
   7F79 16 00         [ 7] 2390 	ld	d,#0x00
   7F7B 21 07 6A      [10] 2391 	ld	hl,#_prota+1
   7F7E 6E            [ 7] 2392 	ld	l,(hl)
   7F7F 26 00         [ 7] 2393 	ld	h,#0x00
   7F81 7B            [ 4] 2394 	ld	a,e
   7F82 95            [ 4] 2395 	sub	a, l
   7F83 5F            [ 4] 2396 	ld	e,a
   7F84 7A            [ 4] 2397 	ld	a,d
   7F85 9C            [ 4] 2398 	sbc	a, h
   7F86 57            [ 4] 2399 	ld	d,a
   7F87 C5            [11] 2400 	push	bc
   7F88 D5            [11] 2401 	push	de
   7F89 CD EE 4F      [17] 2402 	call	_abs
   7F8C F1            [10] 2403 	pop	af
   7F8D C1            [10] 2404 	pop	bc
                           2405 ;src/main.c:512: u8 dist = difx + dify; // manhattan
   7F8E 09            [11] 2406 	add	hl, bc
   7F8F DD 75 F3      [19] 2407 	ld	-13 (ix),l
                           2408 ;src/main.c:514: u8 movX = 0;
   7F92 DD 36 F6 00   [19] 2409 	ld	-10 (ix),#0x00
                           2410 ;src/main.c:515: u8 movY = 0;
   7F96 DD 36 F5 00   [19] 2411 	ld	-11 (ix),#0x00
                           2412 ;src/main.c:516: u8 mov = 0;
   7F9A DD 36 F4 00   [19] 2413 	ld	-12 (ix),#0x00
                           2414 ;src/main.c:518: if (enemy->y == dy) { // alineado en el eje x
   7F9E DD 6E F9      [19] 2415 	ld	l,-7 (ix)
   7FA1 DD 66 FA      [19] 2416 	ld	h,-6 (ix)
   7FA4 7E            [ 7] 2417 	ld	a,(hl)
   7FA5 DD 77 FB      [19] 2418 	ld	-5 (ix),a
                           2419 ;src/main.c:520: if (dist > 10) {
   7FA8 3E 0A         [ 7] 2420 	ld	a,#0x0A
   7FAA DD 96 F3      [19] 2421 	sub	a, -13 (ix)
   7FAD 3E 00         [ 7] 2422 	ld	a,#0x00
   7FAF 17            [ 4] 2423 	rla
   7FB0 DD 77 FC      [19] 2424 	ld	-4 (ix),a
                           2425 ;src/main.c:518: if (enemy->y == dy) { // alineado en el eje x
   7FB3 DD 7E 07      [19] 2426 	ld	a,7 (ix)
   7FB6 DD 96 FB      [19] 2427 	sub	a, -5 (ix)
   7FB9 C2 BB 80      [10] 2428 	jp	NZ,00187$
                           2429 ;src/main.c:520: if (dist > 10) {
   7FBC DD 7E FC      [19] 2430 	ld	a,-4 (ix)
   7FBF B7            [ 4] 2431 	or	a, a
   7FC0 CA 1F 86      [10] 2432 	jp	Z,00189$
                           2433 ;src/main.c:521: if (dx < enemy->x) { // izquierda
   7FC3 DD 6E F7      [19] 2434 	ld	l,-9 (ix)
   7FC6 DD 66 F8      [19] 2435 	ld	h,-8 (ix)
   7FC9 46            [ 7] 2436 	ld	b,(hl)
   7FCA DD 7E 06      [19] 2437 	ld	a,6 (ix)
   7FCD 90            [ 4] 2438 	sub	a, b
   7FCE 30 72         [12] 2439 	jr	NC,00110$
                           2440 ;src/main.c:522: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   7FD0 05            [ 4] 2441 	dec	b
   7FD1 DD 7E FB      [19] 2442 	ld	a,-5 (ix)
   7FD4 F5            [11] 2443 	push	af
   7FD5 33            [ 6] 2444 	inc	sp
   7FD6 C5            [11] 2445 	push	bc
   7FD7 33            [ 6] 2446 	inc	sp
   7FD8 2A BE 72      [16] 2447 	ld	hl,(_mapa)
   7FDB E5            [11] 2448 	push	hl
   7FDC CD AA 4F      [17] 2449 	call	_getTilePtr
   7FDF F1            [10] 2450 	pop	af
   7FE0 F1            [10] 2451 	pop	af
   7FE1 4E            [ 7] 2452 	ld	c,(hl)
   7FE2 3E 02         [ 7] 2453 	ld	a,#0x02
   7FE4 91            [ 4] 2454 	sub	a, c
   7FE5 DA 1F 86      [10] 2455 	jp	C,00189$
                           2456 ;src/main.c:523: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   7FE8 DD 6E F9      [19] 2457 	ld	l,-7 (ix)
   7FEB DD 66 FA      [19] 2458 	ld	h,-6 (ix)
   7FEE 7E            [ 7] 2459 	ld	a,(hl)
   7FEF C6 0B         [ 7] 2460 	add	a, #0x0B
   7FF1 57            [ 4] 2461 	ld	d,a
   7FF2 DD 6E F7      [19] 2462 	ld	l,-9 (ix)
   7FF5 DD 66 F8      [19] 2463 	ld	h,-8 (ix)
   7FF8 46            [ 7] 2464 	ld	b,(hl)
   7FF9 05            [ 4] 2465 	dec	b
   7FFA D5            [11] 2466 	push	de
   7FFB 33            [ 6] 2467 	inc	sp
   7FFC C5            [11] 2468 	push	bc
   7FFD 33            [ 6] 2469 	inc	sp
   7FFE 2A BE 72      [16] 2470 	ld	hl,(_mapa)
   8001 E5            [11] 2471 	push	hl
   8002 CD AA 4F      [17] 2472 	call	_getTilePtr
   8005 F1            [10] 2473 	pop	af
   8006 F1            [10] 2474 	pop	af
   8007 4E            [ 7] 2475 	ld	c,(hl)
   8008 3E 02         [ 7] 2476 	ld	a,#0x02
   800A 91            [ 4] 2477 	sub	a, c
   800B DA 1F 86      [10] 2478 	jp	C,00189$
                           2479 ;src/main.c:524: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   800E DD 6E F9      [19] 2480 	ld	l,-7 (ix)
   8011 DD 66 FA      [19] 2481 	ld	h,-6 (ix)
   8014 7E            [ 7] 2482 	ld	a,(hl)
   8015 C6 16         [ 7] 2483 	add	a, #0x16
   8017 57            [ 4] 2484 	ld	d,a
   8018 DD 6E F7      [19] 2485 	ld	l,-9 (ix)
   801B DD 66 F8      [19] 2486 	ld	h,-8 (ix)
   801E 46            [ 7] 2487 	ld	b,(hl)
   801F 05            [ 4] 2488 	dec	b
   8020 D5            [11] 2489 	push	de
   8021 33            [ 6] 2490 	inc	sp
   8022 C5            [11] 2491 	push	bc
   8023 33            [ 6] 2492 	inc	sp
   8024 2A BE 72      [16] 2493 	ld	hl,(_mapa)
   8027 E5            [11] 2494 	push	hl
   8028 CD AA 4F      [17] 2495 	call	_getTilePtr
   802B F1            [10] 2496 	pop	af
   802C F1            [10] 2497 	pop	af
   802D 4E            [ 7] 2498 	ld	c,(hl)
   802E 3E 02         [ 7] 2499 	ld	a,#0x02
   8030 91            [ 4] 2500 	sub	a, c
   8031 DA 1F 86      [10] 2501 	jp	C,00189$
                           2502 ;src/main.c:525: moverEnemigoIzquierda(enemy);
   8034 DD 6E F7      [19] 2503 	ld	l,-9 (ix)
   8037 DD 66 F8      [19] 2504 	ld	h,-8 (ix)
   803A E5            [11] 2505 	push	hl
   803B CD 8E 7B      [17] 2506 	call	_moverEnemigoIzquierda
   803E F1            [10] 2507 	pop	af
                           2508 ;src/main.c:527: mov = 1;
   803F C3 1F 86      [10] 2509 	jp	00189$
   8042                    2510 00110$:
                           2511 ;src/main.c:530: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   8042 78            [ 4] 2512 	ld	a,b
   8043 C6 05         [ 7] 2513 	add	a, #0x05
   8045 47            [ 4] 2514 	ld	b,a
   8046 DD 7E FB      [19] 2515 	ld	a,-5 (ix)
   8049 F5            [11] 2516 	push	af
   804A 33            [ 6] 2517 	inc	sp
   804B C5            [11] 2518 	push	bc
   804C 33            [ 6] 2519 	inc	sp
   804D 2A BE 72      [16] 2520 	ld	hl,(_mapa)
   8050 E5            [11] 2521 	push	hl
   8051 CD AA 4F      [17] 2522 	call	_getTilePtr
   8054 F1            [10] 2523 	pop	af
   8055 F1            [10] 2524 	pop	af
   8056 4E            [ 7] 2525 	ld	c,(hl)
   8057 3E 02         [ 7] 2526 	ld	a,#0x02
   8059 91            [ 4] 2527 	sub	a, c
   805A DA 1F 86      [10] 2528 	jp	C,00189$
                           2529 ;src/main.c:531: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   805D DD 6E F9      [19] 2530 	ld	l,-7 (ix)
   8060 DD 66 FA      [19] 2531 	ld	h,-6 (ix)
   8063 7E            [ 7] 2532 	ld	a,(hl)
   8064 C6 0B         [ 7] 2533 	add	a, #0x0B
   8066 57            [ 4] 2534 	ld	d,a
   8067 DD 6E F7      [19] 2535 	ld	l,-9 (ix)
   806A DD 66 F8      [19] 2536 	ld	h,-8 (ix)
   806D 7E            [ 7] 2537 	ld	a,(hl)
   806E C6 05         [ 7] 2538 	add	a, #0x05
   8070 47            [ 4] 2539 	ld	b,a
   8071 D5            [11] 2540 	push	de
   8072 33            [ 6] 2541 	inc	sp
   8073 C5            [11] 2542 	push	bc
   8074 33            [ 6] 2543 	inc	sp
   8075 2A BE 72      [16] 2544 	ld	hl,(_mapa)
   8078 E5            [11] 2545 	push	hl
   8079 CD AA 4F      [17] 2546 	call	_getTilePtr
   807C F1            [10] 2547 	pop	af
   807D F1            [10] 2548 	pop	af
   807E 4E            [ 7] 2549 	ld	c,(hl)
   807F 3E 02         [ 7] 2550 	ld	a,#0x02
   8081 91            [ 4] 2551 	sub	a, c
   8082 DA 1F 86      [10] 2552 	jp	C,00189$
                           2553 ;src/main.c:532: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   8085 DD 6E F9      [19] 2554 	ld	l,-7 (ix)
   8088 DD 66 FA      [19] 2555 	ld	h,-6 (ix)
   808B 7E            [ 7] 2556 	ld	a,(hl)
   808C C6 16         [ 7] 2557 	add	a, #0x16
   808E 57            [ 4] 2558 	ld	d,a
   808F DD 6E F7      [19] 2559 	ld	l,-9 (ix)
   8092 DD 66 F8      [19] 2560 	ld	h,-8 (ix)
   8095 7E            [ 7] 2561 	ld	a,(hl)
   8096 C6 05         [ 7] 2562 	add	a, #0x05
   8098 47            [ 4] 2563 	ld	b,a
   8099 D5            [11] 2564 	push	de
   809A 33            [ 6] 2565 	inc	sp
   809B C5            [11] 2566 	push	bc
   809C 33            [ 6] 2567 	inc	sp
   809D 2A BE 72      [16] 2568 	ld	hl,(_mapa)
   80A0 E5            [11] 2569 	push	hl
   80A1 CD AA 4F      [17] 2570 	call	_getTilePtr
   80A4 F1            [10] 2571 	pop	af
   80A5 F1            [10] 2572 	pop	af
   80A6 4E            [ 7] 2573 	ld	c,(hl)
   80A7 3E 02         [ 7] 2574 	ld	a,#0x02
   80A9 91            [ 4] 2575 	sub	a, c
   80AA DA 1F 86      [10] 2576 	jp	C,00189$
                           2577 ;src/main.c:533: moverEnemigoDerecha(enemy);
   80AD DD 6E F7      [19] 2578 	ld	l,-9 (ix)
   80B0 DD 66 F8      [19] 2579 	ld	h,-8 (ix)
   80B3 E5            [11] 2580 	push	hl
   80B4 CD 7E 7B      [17] 2581 	call	_moverEnemigoDerecha
   80B7 F1            [10] 2582 	pop	af
                           2583 ;src/main.c:535: mov = 1;
   80B8 C3 1F 86      [10] 2584 	jp	00189$
   80BB                    2585 00187$:
                           2586 ;src/main.c:540: else if (enemy->x == dx) {
   80BB DD 6E F7      [19] 2587 	ld	l,-9 (ix)
   80BE DD 66 F8      [19] 2588 	ld	h,-8 (ix)
   80C1 7E            [ 7] 2589 	ld	a,(hl)
   80C2 DD 77 FD      [19] 2590 	ld	-3 (ix), a
   80C5 DD 96 06      [19] 2591 	sub	a, 6 (ix)
   80C8 C2 C5 81      [10] 2592 	jp	NZ,00184$
                           2593 ;src/main.c:542: if (dist > 10) {
   80CB DD 7E FC      [19] 2594 	ld	a,-4 (ix)
   80CE B7            [ 4] 2595 	or	a, a
   80CF CA 1F 86      [10] 2596 	jp	Z,00189$
                           2597 ;src/main.c:543: if (dy < enemy->y) {
   80D2 DD 7E 07      [19] 2598 	ld	a,7 (ix)
   80D5 DD 96 FB      [19] 2599 	sub	a, -5 (ix)
   80D8 30 74         [12] 2600 	jr	NC,00123$
                           2601 ;src/main.c:544: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   80DA DD 46 FB      [19] 2602 	ld	b,-5 (ix)
   80DD 05            [ 4] 2603 	dec	b
   80DE 05            [ 4] 2604 	dec	b
   80DF C5            [11] 2605 	push	bc
   80E0 33            [ 6] 2606 	inc	sp
   80E1 DD 7E FD      [19] 2607 	ld	a,-3 (ix)
   80E4 F5            [11] 2608 	push	af
   80E5 33            [ 6] 2609 	inc	sp
   80E6 2A BE 72      [16] 2610 	ld	hl,(_mapa)
   80E9 E5            [11] 2611 	push	hl
   80EA CD AA 4F      [17] 2612 	call	_getTilePtr
   80ED F1            [10] 2613 	pop	af
   80EE F1            [10] 2614 	pop	af
   80EF 4E            [ 7] 2615 	ld	c,(hl)
   80F0 3E 02         [ 7] 2616 	ld	a,#0x02
   80F2 91            [ 4] 2617 	sub	a, c
   80F3 DA 1F 86      [10] 2618 	jp	C,00189$
                           2619 ;src/main.c:545: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   80F6 DD 6E F9      [19] 2620 	ld	l,-7 (ix)
   80F9 DD 66 FA      [19] 2621 	ld	h,-6 (ix)
   80FC 46            [ 7] 2622 	ld	b,(hl)
   80FD 05            [ 4] 2623 	dec	b
   80FE 05            [ 4] 2624 	dec	b
   80FF DD 6E F7      [19] 2625 	ld	l,-9 (ix)
   8102 DD 66 F8      [19] 2626 	ld	h,-8 (ix)
   8105 56            [ 7] 2627 	ld	d,(hl)
   8106 14            [ 4] 2628 	inc	d
   8107 14            [ 4] 2629 	inc	d
   8108 4A            [ 4] 2630 	ld	c, d
   8109 C5            [11] 2631 	push	bc
   810A 2A BE 72      [16] 2632 	ld	hl,(_mapa)
   810D E5            [11] 2633 	push	hl
   810E CD AA 4F      [17] 2634 	call	_getTilePtr
   8111 F1            [10] 2635 	pop	af
   8112 F1            [10] 2636 	pop	af
   8113 4E            [ 7] 2637 	ld	c,(hl)
   8114 3E 02         [ 7] 2638 	ld	a,#0x02
   8116 91            [ 4] 2639 	sub	a, c
   8117 DA 1F 86      [10] 2640 	jp	C,00189$
                           2641 ;src/main.c:546: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   811A DD 6E F9      [19] 2642 	ld	l,-7 (ix)
   811D DD 66 FA      [19] 2643 	ld	h,-6 (ix)
   8120 46            [ 7] 2644 	ld	b,(hl)
   8121 05            [ 4] 2645 	dec	b
   8122 05            [ 4] 2646 	dec	b
   8123 DD 6E F7      [19] 2647 	ld	l,-9 (ix)
   8126 DD 66 F8      [19] 2648 	ld	h,-8 (ix)
   8129 7E            [ 7] 2649 	ld	a,(hl)
   812A C6 04         [ 7] 2650 	add	a, #0x04
   812C C5            [11] 2651 	push	bc
   812D 33            [ 6] 2652 	inc	sp
   812E F5            [11] 2653 	push	af
   812F 33            [ 6] 2654 	inc	sp
   8130 2A BE 72      [16] 2655 	ld	hl,(_mapa)
   8133 E5            [11] 2656 	push	hl
   8134 CD AA 4F      [17] 2657 	call	_getTilePtr
   8137 F1            [10] 2658 	pop	af
   8138 F1            [10] 2659 	pop	af
   8139 4E            [ 7] 2660 	ld	c,(hl)
   813A 3E 02         [ 7] 2661 	ld	a,#0x02
   813C 91            [ 4] 2662 	sub	a, c
   813D DA 1F 86      [10] 2663 	jp	C,00189$
                           2664 ;src/main.c:547: moverEnemigoArriba(enemy);
   8140 DD 6E F7      [19] 2665 	ld	l,-9 (ix)
   8143 DD 66 F8      [19] 2666 	ld	h,-8 (ix)
   8146 E5            [11] 2667 	push	hl
   8147 CD 40 7B      [17] 2668 	call	_moverEnemigoArriba
   814A F1            [10] 2669 	pop	af
                           2670 ;src/main.c:549: mov = 1;
   814B C3 1F 86      [10] 2671 	jp	00189$
   814E                    2672 00123$:
                           2673 ;src/main.c:552: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   814E DD 7E FB      [19] 2674 	ld	a,-5 (ix)
   8151 C6 18         [ 7] 2675 	add	a, #0x18
   8153 47            [ 4] 2676 	ld	b,a
   8154 C5            [11] 2677 	push	bc
   8155 33            [ 6] 2678 	inc	sp
   8156 DD 7E FD      [19] 2679 	ld	a,-3 (ix)
   8159 F5            [11] 2680 	push	af
   815A 33            [ 6] 2681 	inc	sp
   815B 2A BE 72      [16] 2682 	ld	hl,(_mapa)
   815E E5            [11] 2683 	push	hl
   815F CD AA 4F      [17] 2684 	call	_getTilePtr
   8162 F1            [10] 2685 	pop	af
   8163 F1            [10] 2686 	pop	af
   8164 4E            [ 7] 2687 	ld	c,(hl)
   8165 3E 02         [ 7] 2688 	ld	a,#0x02
   8167 91            [ 4] 2689 	sub	a, c
   8168 DA 1F 86      [10] 2690 	jp	C,00189$
                           2691 ;src/main.c:553: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   816B DD 6E F9      [19] 2692 	ld	l,-7 (ix)
   816E DD 66 FA      [19] 2693 	ld	h,-6 (ix)
   8171 7E            [ 7] 2694 	ld	a,(hl)
   8172 C6 18         [ 7] 2695 	add	a, #0x18
   8174 47            [ 4] 2696 	ld	b,a
   8175 DD 6E F7      [19] 2697 	ld	l,-9 (ix)
   8178 DD 66 F8      [19] 2698 	ld	h,-8 (ix)
   817B 56            [ 7] 2699 	ld	d,(hl)
   817C 14            [ 4] 2700 	inc	d
   817D 14            [ 4] 2701 	inc	d
   817E 4A            [ 4] 2702 	ld	c, d
   817F C5            [11] 2703 	push	bc
   8180 2A BE 72      [16] 2704 	ld	hl,(_mapa)
   8183 E5            [11] 2705 	push	hl
   8184 CD AA 4F      [17] 2706 	call	_getTilePtr
   8187 F1            [10] 2707 	pop	af
   8188 F1            [10] 2708 	pop	af
   8189 4E            [ 7] 2709 	ld	c,(hl)
   818A 3E 02         [ 7] 2710 	ld	a,#0x02
   818C 91            [ 4] 2711 	sub	a, c
   818D DA 1F 86      [10] 2712 	jp	C,00189$
                           2713 ;src/main.c:554: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   8190 DD 6E F9      [19] 2714 	ld	l,-7 (ix)
   8193 DD 66 FA      [19] 2715 	ld	h,-6 (ix)
   8196 7E            [ 7] 2716 	ld	a,(hl)
   8197 C6 18         [ 7] 2717 	add	a, #0x18
   8199 47            [ 4] 2718 	ld	b,a
   819A DD 6E F7      [19] 2719 	ld	l,-9 (ix)
   819D DD 66 F8      [19] 2720 	ld	h,-8 (ix)
   81A0 7E            [ 7] 2721 	ld	a,(hl)
   81A1 C6 04         [ 7] 2722 	add	a, #0x04
   81A3 C5            [11] 2723 	push	bc
   81A4 33            [ 6] 2724 	inc	sp
   81A5 F5            [11] 2725 	push	af
   81A6 33            [ 6] 2726 	inc	sp
   81A7 2A BE 72      [16] 2727 	ld	hl,(_mapa)
   81AA E5            [11] 2728 	push	hl
   81AB CD AA 4F      [17] 2729 	call	_getTilePtr
   81AE F1            [10] 2730 	pop	af
   81AF F1            [10] 2731 	pop	af
   81B0 4E            [ 7] 2732 	ld	c,(hl)
   81B1 3E 02         [ 7] 2733 	ld	a,#0x02
   81B3 91            [ 4] 2734 	sub	a, c
   81B4 DA 1F 86      [10] 2735 	jp	C,00189$
                           2736 ;src/main.c:555: moverEnemigoAbajo(enemy);
   81B7 DD 6E F7      [19] 2737 	ld	l,-9 (ix)
   81BA DD 66 F8      [19] 2738 	ld	h,-8 (ix)
   81BD E5            [11] 2739 	push	hl
   81BE CD 5F 7B      [17] 2740 	call	_moverEnemigoAbajo
   81C1 F1            [10] 2741 	pop	af
                           2742 ;src/main.c:557: mov = 1;
   81C2 C3 1F 86      [10] 2743 	jp	00189$
   81C5                    2744 00184$:
                           2745 ;src/main.c:563: if (dist > 20) {
   81C5 3E 14         [ 7] 2746 	ld	a,#0x14
   81C7 DD 96 F3      [19] 2747 	sub	a, -13 (ix)
   81CA D2 1F 86      [10] 2748 	jp	NC,00189$
                           2749 ;src/main.c:564: if (dx < enemy->x) {
   81CD DD 7E 06      [19] 2750 	ld	a,6 (ix)
   81D0 DD 96 FD      [19] 2751 	sub	a, -3 (ix)
   81D3 D2 55 82      [10] 2752 	jp	NC,00136$
                           2753 ;src/main.c:565: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   81D6 DD 46 FD      [19] 2754 	ld	b,-3 (ix)
   81D9 05            [ 4] 2755 	dec	b
   81DA DD 7E FB      [19] 2756 	ld	a,-5 (ix)
   81DD F5            [11] 2757 	push	af
   81DE 33            [ 6] 2758 	inc	sp
   81DF C5            [11] 2759 	push	bc
   81E0 33            [ 6] 2760 	inc	sp
   81E1 2A BE 72      [16] 2761 	ld	hl,(_mapa)
   81E4 E5            [11] 2762 	push	hl
   81E5 CD AA 4F      [17] 2763 	call	_getTilePtr
   81E8 F1            [10] 2764 	pop	af
   81E9 F1            [10] 2765 	pop	af
   81EA 4E            [ 7] 2766 	ld	c,(hl)
   81EB 3E 02         [ 7] 2767 	ld	a,#0x02
   81ED 91            [ 4] 2768 	sub	a, c
   81EE DA D2 82      [10] 2769 	jp	C,00137$
                           2770 ;src/main.c:566: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   81F1 DD 6E F9      [19] 2771 	ld	l,-7 (ix)
   81F4 DD 66 FA      [19] 2772 	ld	h,-6 (ix)
   81F7 7E            [ 7] 2773 	ld	a,(hl)
   81F8 C6 0B         [ 7] 2774 	add	a, #0x0B
   81FA 4F            [ 4] 2775 	ld	c,a
   81FB DD 6E F7      [19] 2776 	ld	l,-9 (ix)
   81FE DD 66 F8      [19] 2777 	ld	h,-8 (ix)
   8201 46            [ 7] 2778 	ld	b,(hl)
   8202 05            [ 4] 2779 	dec	b
   8203 79            [ 4] 2780 	ld	a,c
   8204 F5            [11] 2781 	push	af
   8205 33            [ 6] 2782 	inc	sp
   8206 C5            [11] 2783 	push	bc
   8207 33            [ 6] 2784 	inc	sp
   8208 2A BE 72      [16] 2785 	ld	hl,(_mapa)
   820B E5            [11] 2786 	push	hl
   820C CD AA 4F      [17] 2787 	call	_getTilePtr
   820F F1            [10] 2788 	pop	af
   8210 F1            [10] 2789 	pop	af
   8211 4E            [ 7] 2790 	ld	c,(hl)
   8212 3E 02         [ 7] 2791 	ld	a,#0x02
   8214 91            [ 4] 2792 	sub	a, c
   8215 DA D2 82      [10] 2793 	jp	C,00137$
                           2794 ;src/main.c:567: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   8218 DD 6E F9      [19] 2795 	ld	l,-7 (ix)
   821B DD 66 FA      [19] 2796 	ld	h,-6 (ix)
   821E 7E            [ 7] 2797 	ld	a,(hl)
   821F C6 16         [ 7] 2798 	add	a, #0x16
   8221 4F            [ 4] 2799 	ld	c,a
   8222 DD 6E F7      [19] 2800 	ld	l,-9 (ix)
   8225 DD 66 F8      [19] 2801 	ld	h,-8 (ix)
   8228 46            [ 7] 2802 	ld	b,(hl)
   8229 05            [ 4] 2803 	dec	b
   822A 79            [ 4] 2804 	ld	a,c
   822B F5            [11] 2805 	push	af
   822C 33            [ 6] 2806 	inc	sp
   822D C5            [11] 2807 	push	bc
   822E 33            [ 6] 2808 	inc	sp
   822F 2A BE 72      [16] 2809 	ld	hl,(_mapa)
   8232 E5            [11] 2810 	push	hl
   8233 CD AA 4F      [17] 2811 	call	_getTilePtr
   8236 F1            [10] 2812 	pop	af
   8237 F1            [10] 2813 	pop	af
   8238 4E            [ 7] 2814 	ld	c,(hl)
   8239 3E 02         [ 7] 2815 	ld	a,#0x02
   823B 91            [ 4] 2816 	sub	a, c
   823C DA D2 82      [10] 2817 	jp	C,00137$
                           2818 ;src/main.c:568: moverEnemigoIzquierda(enemy);
   823F DD 6E F7      [19] 2819 	ld	l,-9 (ix)
   8242 DD 66 F8      [19] 2820 	ld	h,-8 (ix)
   8245 E5            [11] 2821 	push	hl
   8246 CD 8E 7B      [17] 2822 	call	_moverEnemigoIzquierda
   8249 F1            [10] 2823 	pop	af
                           2824 ;src/main.c:569: movX = 1;
   824A DD 36 F6 01   [19] 2825 	ld	-10 (ix),#0x01
                           2826 ;src/main.c:570: mov = 1;
   824E DD 36 F4 01   [19] 2827 	ld	-12 (ix),#0x01
   8252 C3 D2 82      [10] 2828 	jp	00137$
   8255                    2829 00136$:
                           2830 ;src/main.c:573: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   8255 DD 7E FD      [19] 2831 	ld	a,-3 (ix)
   8258 C6 05         [ 7] 2832 	add	a, #0x05
   825A 47            [ 4] 2833 	ld	b,a
   825B DD 7E FB      [19] 2834 	ld	a,-5 (ix)
   825E F5            [11] 2835 	push	af
   825F 33            [ 6] 2836 	inc	sp
   8260 C5            [11] 2837 	push	bc
   8261 33            [ 6] 2838 	inc	sp
   8262 2A BE 72      [16] 2839 	ld	hl,(_mapa)
   8265 E5            [11] 2840 	push	hl
   8266 CD AA 4F      [17] 2841 	call	_getTilePtr
   8269 F1            [10] 2842 	pop	af
   826A F1            [10] 2843 	pop	af
   826B 4E            [ 7] 2844 	ld	c,(hl)
   826C 3E 02         [ 7] 2845 	ld	a,#0x02
   826E 91            [ 4] 2846 	sub	a, c
   826F 38 61         [12] 2847 	jr	C,00137$
                           2848 ;src/main.c:574: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   8271 DD 6E F9      [19] 2849 	ld	l,-7 (ix)
   8274 DD 66 FA      [19] 2850 	ld	h,-6 (ix)
   8277 7E            [ 7] 2851 	ld	a,(hl)
   8278 C6 0B         [ 7] 2852 	add	a, #0x0B
   827A 57            [ 4] 2853 	ld	d,a
   827B DD 6E F7      [19] 2854 	ld	l,-9 (ix)
   827E DD 66 F8      [19] 2855 	ld	h,-8 (ix)
   8281 7E            [ 7] 2856 	ld	a,(hl)
   8282 C6 05         [ 7] 2857 	add	a, #0x05
   8284 47            [ 4] 2858 	ld	b,a
   8285 D5            [11] 2859 	push	de
   8286 33            [ 6] 2860 	inc	sp
   8287 C5            [11] 2861 	push	bc
   8288 33            [ 6] 2862 	inc	sp
   8289 2A BE 72      [16] 2863 	ld	hl,(_mapa)
   828C E5            [11] 2864 	push	hl
   828D CD AA 4F      [17] 2865 	call	_getTilePtr
   8290 F1            [10] 2866 	pop	af
   8291 F1            [10] 2867 	pop	af
   8292 4E            [ 7] 2868 	ld	c,(hl)
   8293 3E 02         [ 7] 2869 	ld	a,#0x02
   8295 91            [ 4] 2870 	sub	a, c
   8296 38 3A         [12] 2871 	jr	C,00137$
                           2872 ;src/main.c:575: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   8298 DD 6E F9      [19] 2873 	ld	l,-7 (ix)
   829B DD 66 FA      [19] 2874 	ld	h,-6 (ix)
   829E 7E            [ 7] 2875 	ld	a,(hl)
   829F C6 16         [ 7] 2876 	add	a, #0x16
   82A1 57            [ 4] 2877 	ld	d,a
   82A2 DD 6E F7      [19] 2878 	ld	l,-9 (ix)
   82A5 DD 66 F8      [19] 2879 	ld	h,-8 (ix)
   82A8 7E            [ 7] 2880 	ld	a,(hl)
   82A9 C6 05         [ 7] 2881 	add	a, #0x05
   82AB 47            [ 4] 2882 	ld	b,a
   82AC D5            [11] 2883 	push	de
   82AD 33            [ 6] 2884 	inc	sp
   82AE C5            [11] 2885 	push	bc
   82AF 33            [ 6] 2886 	inc	sp
   82B0 2A BE 72      [16] 2887 	ld	hl,(_mapa)
   82B3 E5            [11] 2888 	push	hl
   82B4 CD AA 4F      [17] 2889 	call	_getTilePtr
   82B7 F1            [10] 2890 	pop	af
   82B8 F1            [10] 2891 	pop	af
   82B9 4E            [ 7] 2892 	ld	c,(hl)
   82BA 3E 02         [ 7] 2893 	ld	a,#0x02
   82BC 91            [ 4] 2894 	sub	a, c
   82BD 38 13         [12] 2895 	jr	C,00137$
                           2896 ;src/main.c:576: moverEnemigoDerecha(enemy);
   82BF DD 6E F7      [19] 2897 	ld	l,-9 (ix)
   82C2 DD 66 F8      [19] 2898 	ld	h,-8 (ix)
   82C5 E5            [11] 2899 	push	hl
   82C6 CD 7E 7B      [17] 2900 	call	_moverEnemigoDerecha
   82C9 F1            [10] 2901 	pop	af
                           2902 ;src/main.c:577: movX = 1;
   82CA DD 36 F6 01   [19] 2903 	ld	-10 (ix),#0x01
                           2904 ;src/main.c:578: mov = 1;
   82CE DD 36 F4 01   [19] 2905 	ld	-12 (ix),#0x01
   82D2                    2906 00137$:
                           2907 ;src/main.c:581: if (dy < enemy->y) {
   82D2 DD 6E F9      [19] 2908 	ld	l,-7 (ix)
   82D5 DD 66 FA      [19] 2909 	ld	h,-6 (ix)
   82D8 7E            [ 7] 2910 	ld	a,(hl)
   82D9 DD 77 FD      [19] 2911 	ld	-3 (ix),a
                           2912 ;src/main.c:510: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   82DC DD 6E F7      [19] 2913 	ld	l,-9 (ix)
   82DF DD 66 F8      [19] 2914 	ld	h,-8 (ix)
   82E2 7E            [ 7] 2915 	ld	a,(hl)
   82E3 DD 77 FC      [19] 2916 	ld	-4 (ix),a
                           2917 ;src/main.c:581: if (dy < enemy->y) {
   82E6 DD 7E 07      [19] 2918 	ld	a,7 (ix)
   82E9 DD 96 FD      [19] 2919 	sub	a, -3 (ix)
   82EC D2 82 83      [10] 2920 	jp	NC,00147$
                           2921 ;src/main.c:582: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   82EF DD 7E FD      [19] 2922 	ld	a,-3 (ix)
   82F2 C6 FE         [ 7] 2923 	add	a,#0xFE
   82F4 DD 77 FB      [19] 2924 	ld	-5 (ix), a
   82F7 F5            [11] 2925 	push	af
   82F8 33            [ 6] 2926 	inc	sp
   82F9 DD 7E FC      [19] 2927 	ld	a,-4 (ix)
   82FC F5            [11] 2928 	push	af
   82FD 33            [ 6] 2929 	inc	sp
   82FE 2A BE 72      [16] 2930 	ld	hl,(_mapa)
   8301 E5            [11] 2931 	push	hl
   8302 CD AA 4F      [17] 2932 	call	_getTilePtr
   8305 F1            [10] 2933 	pop	af
   8306 F1            [10] 2934 	pop	af
   8307 DD 74 FF      [19] 2935 	ld	-1 (ix),h
   830A DD 75 FE      [19] 2936 	ld	-2 (ix), l
   830D DD 66 FF      [19] 2937 	ld	h,-1 (ix)
   8310 4E            [ 7] 2938 	ld	c,(hl)
   8311 3E 02         [ 7] 2939 	ld	a,#0x02
   8313 91            [ 4] 2940 	sub	a, c
   8314 DA FD 83      [10] 2941 	jp	C,00148$
                           2942 ;src/main.c:583: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   8317 DD 6E F9      [19] 2943 	ld	l,-7 (ix)
   831A DD 66 FA      [19] 2944 	ld	h,-6 (ix)
   831D 7E            [ 7] 2945 	ld	a,(hl)
   831E DD 77 FE      [19] 2946 	ld	-2 (ix), a
   8321 C6 FE         [ 7] 2947 	add	a,#0xFE
   8323 DD 77 FE      [19] 2948 	ld	-2 (ix),a
   8326 DD 6E F7      [19] 2949 	ld	l,-9 (ix)
   8329 DD 66 F8      [19] 2950 	ld	h,-8 (ix)
   832C 46            [ 7] 2951 	ld	b,(hl)
   832D 04            [ 4] 2952 	inc	b
   832E 04            [ 4] 2953 	inc	b
   832F DD 7E FE      [19] 2954 	ld	a,-2 (ix)
   8332 F5            [11] 2955 	push	af
   8333 33            [ 6] 2956 	inc	sp
   8334 C5            [11] 2957 	push	bc
   8335 33            [ 6] 2958 	inc	sp
   8336 2A BE 72      [16] 2959 	ld	hl,(_mapa)
   8339 E5            [11] 2960 	push	hl
   833A CD AA 4F      [17] 2961 	call	_getTilePtr
   833D F1            [10] 2962 	pop	af
   833E F1            [10] 2963 	pop	af
   833F 4E            [ 7] 2964 	ld	c,(hl)
   8340 3E 02         [ 7] 2965 	ld	a,#0x02
   8342 91            [ 4] 2966 	sub	a, c
   8343 DA FD 83      [10] 2967 	jp	C,00148$
                           2968 ;src/main.c:584: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   8346 DD 6E F9      [19] 2969 	ld	l,-7 (ix)
   8349 DD 66 FA      [19] 2970 	ld	h,-6 (ix)
   834C 46            [ 7] 2971 	ld	b,(hl)
   834D 05            [ 4] 2972 	dec	b
   834E 05            [ 4] 2973 	dec	b
   834F DD 6E F7      [19] 2974 	ld	l,-9 (ix)
   8352 DD 66 F8      [19] 2975 	ld	h,-8 (ix)
   8355 7E            [ 7] 2976 	ld	a,(hl)
   8356 C6 04         [ 7] 2977 	add	a, #0x04
   8358 C5            [11] 2978 	push	bc
   8359 33            [ 6] 2979 	inc	sp
   835A F5            [11] 2980 	push	af
   835B 33            [ 6] 2981 	inc	sp
   835C 2A BE 72      [16] 2982 	ld	hl,(_mapa)
   835F E5            [11] 2983 	push	hl
   8360 CD AA 4F      [17] 2984 	call	_getTilePtr
   8363 F1            [10] 2985 	pop	af
   8364 F1            [10] 2986 	pop	af
   8365 4E            [ 7] 2987 	ld	c,(hl)
   8366 3E 02         [ 7] 2988 	ld	a,#0x02
   8368 91            [ 4] 2989 	sub	a, c
   8369 DA FD 83      [10] 2990 	jp	C,00148$
                           2991 ;src/main.c:585: moverEnemigoArriba(enemy);
   836C DD 6E F7      [19] 2992 	ld	l,-9 (ix)
   836F DD 66 F8      [19] 2993 	ld	h,-8 (ix)
   8372 E5            [11] 2994 	push	hl
   8373 CD 40 7B      [17] 2995 	call	_moverEnemigoArriba
   8376 F1            [10] 2996 	pop	af
                           2997 ;src/main.c:586: movY = 1;
   8377 DD 36 F5 01   [19] 2998 	ld	-11 (ix),#0x01
                           2999 ;src/main.c:587: mov = 1;
   837B DD 36 F4 01   [19] 3000 	ld	-12 (ix),#0x01
   837F C3 FD 83      [10] 3001 	jp	00148$
   8382                    3002 00147$:
                           3003 ;src/main.c:590: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   8382 DD 7E FD      [19] 3004 	ld	a,-3 (ix)
   8385 C6 18         [ 7] 3005 	add	a, #0x18
   8387 47            [ 4] 3006 	ld	b,a
   8388 C5            [11] 3007 	push	bc
   8389 33            [ 6] 3008 	inc	sp
   838A DD 7E FC      [19] 3009 	ld	a,-4 (ix)
   838D F5            [11] 3010 	push	af
   838E 33            [ 6] 3011 	inc	sp
   838F 2A BE 72      [16] 3012 	ld	hl,(_mapa)
   8392 E5            [11] 3013 	push	hl
   8393 CD AA 4F      [17] 3014 	call	_getTilePtr
   8396 F1            [10] 3015 	pop	af
   8397 F1            [10] 3016 	pop	af
   8398 4E            [ 7] 3017 	ld	c,(hl)
   8399 3E 02         [ 7] 3018 	ld	a,#0x02
   839B 91            [ 4] 3019 	sub	a, c
   839C 38 5F         [12] 3020 	jr	C,00148$
                           3021 ;src/main.c:591: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   839E DD 6E F9      [19] 3022 	ld	l,-7 (ix)
   83A1 DD 66 FA      [19] 3023 	ld	h,-6 (ix)
   83A4 7E            [ 7] 3024 	ld	a,(hl)
   83A5 C6 18         [ 7] 3025 	add	a, #0x18
   83A7 57            [ 4] 3026 	ld	d,a
   83A8 DD 6E F7      [19] 3027 	ld	l,-9 (ix)
   83AB DD 66 F8      [19] 3028 	ld	h,-8 (ix)
   83AE 46            [ 7] 3029 	ld	b,(hl)
   83AF 04            [ 4] 3030 	inc	b
   83B0 04            [ 4] 3031 	inc	b
   83B1 D5            [11] 3032 	push	de
   83B2 33            [ 6] 3033 	inc	sp
   83B3 C5            [11] 3034 	push	bc
   83B4 33            [ 6] 3035 	inc	sp
   83B5 2A BE 72      [16] 3036 	ld	hl,(_mapa)
   83B8 E5            [11] 3037 	push	hl
   83B9 CD AA 4F      [17] 3038 	call	_getTilePtr
   83BC F1            [10] 3039 	pop	af
   83BD F1            [10] 3040 	pop	af
   83BE 4E            [ 7] 3041 	ld	c,(hl)
   83BF 3E 02         [ 7] 3042 	ld	a,#0x02
   83C1 91            [ 4] 3043 	sub	a, c
   83C2 38 39         [12] 3044 	jr	C,00148$
                           3045 ;src/main.c:592: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   83C4 DD 6E F9      [19] 3046 	ld	l,-7 (ix)
   83C7 DD 66 FA      [19] 3047 	ld	h,-6 (ix)
   83CA 7E            [ 7] 3048 	ld	a,(hl)
   83CB C6 18         [ 7] 3049 	add	a, #0x18
   83CD 47            [ 4] 3050 	ld	b,a
   83CE DD 6E F7      [19] 3051 	ld	l,-9 (ix)
   83D1 DD 66 F8      [19] 3052 	ld	h,-8 (ix)
   83D4 7E            [ 7] 3053 	ld	a,(hl)
   83D5 C6 04         [ 7] 3054 	add	a, #0x04
   83D7 C5            [11] 3055 	push	bc
   83D8 33            [ 6] 3056 	inc	sp
   83D9 F5            [11] 3057 	push	af
   83DA 33            [ 6] 3058 	inc	sp
   83DB 2A BE 72      [16] 3059 	ld	hl,(_mapa)
   83DE E5            [11] 3060 	push	hl
   83DF CD AA 4F      [17] 3061 	call	_getTilePtr
   83E2 F1            [10] 3062 	pop	af
   83E3 F1            [10] 3063 	pop	af
   83E4 4E            [ 7] 3064 	ld	c,(hl)
   83E5 3E 02         [ 7] 3065 	ld	a,#0x02
   83E7 91            [ 4] 3066 	sub	a, c
   83E8 38 13         [12] 3067 	jr	C,00148$
                           3068 ;src/main.c:593: moverEnemigoAbajo(enemy);
   83EA DD 6E F7      [19] 3069 	ld	l,-9 (ix)
   83ED DD 66 F8      [19] 3070 	ld	h,-8 (ix)
   83F0 E5            [11] 3071 	push	hl
   83F1 CD 5F 7B      [17] 3072 	call	_moverEnemigoAbajo
   83F4 F1            [10] 3073 	pop	af
                           3074 ;src/main.c:594: movY = 1;
   83F5 DD 36 F5 01   [19] 3075 	ld	-11 (ix),#0x01
                           3076 ;src/main.c:595: mov = 1;
   83F9 DD 36 F4 01   [19] 3077 	ld	-12 (ix),#0x01
   83FD                    3078 00148$:
                           3079 ;src/main.c:598: if (!mov) {
   83FD DD 7E F4      [19] 3080 	ld	a,-12 (ix)
   8400 B7            [ 4] 3081 	or	a, a
   8401 C2 1F 86      [10] 3082 	jp	NZ,00189$
                           3083 ;src/main.c:599: if (!movX) {
   8404 DD 7E F6      [19] 3084 	ld	a,-10 (ix)
   8407 B7            [ 4] 3085 	or	a, a
   8408 C2 0F 85      [10] 3086 	jp	NZ,00163$
                           3087 ;src/main.c:600: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   840B DD 6E F9      [19] 3088 	ld	l,-7 (ix)
   840E DD 66 FA      [19] 3089 	ld	h,-6 (ix)
   8411 5E            [ 7] 3090 	ld	e,(hl)
                           3091 ;src/main.c:510: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   8412 DD 6E F7      [19] 3092 	ld	l,-9 (ix)
   8415 DD 66 F8      [19] 3093 	ld	h,-8 (ix)
   8418 4E            [ 7] 3094 	ld	c,(hl)
                           3095 ;src/main.c:600: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   8419 3E 70         [ 7] 3096 	ld	a,#0x70
   841B 93            [ 4] 3097 	sub	a, e
   841C 30 7C         [12] 3098 	jr	NC,00160$
                           3099 ;src/main.c:601: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   841E 7B            [ 4] 3100 	ld	a,e
   841F C6 18         [ 7] 3101 	add	a, #0x18
   8421 47            [ 4] 3102 	ld	b,a
   8422 C5            [11] 3103 	push	bc
   8423 2A BE 72      [16] 3104 	ld	hl,(_mapa)
   8426 E5            [11] 3105 	push	hl
   8427 CD AA 4F      [17] 3106 	call	_getTilePtr
   842A F1            [10] 3107 	pop	af
   842B F1            [10] 3108 	pop	af
   842C 4E            [ 7] 3109 	ld	c,(hl)
   842D 3E 02         [ 7] 3110 	ld	a,#0x02
   842F 91            [ 4] 3111 	sub	a, c
   8430 38 5B         [12] 3112 	jr	C,00150$
                           3113 ;src/main.c:602: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   8432 DD 6E F9      [19] 3114 	ld	l,-7 (ix)
   8435 DD 66 FA      [19] 3115 	ld	h,-6 (ix)
   8438 7E            [ 7] 3116 	ld	a,(hl)
   8439 C6 18         [ 7] 3117 	add	a, #0x18
   843B 57            [ 4] 3118 	ld	d,a
   843C DD 6E F7      [19] 3119 	ld	l,-9 (ix)
   843F DD 66 F8      [19] 3120 	ld	h,-8 (ix)
   8442 4E            [ 7] 3121 	ld	c,(hl)
   8443 41            [ 4] 3122 	ld	b,c
   8444 04            [ 4] 3123 	inc	b
   8445 04            [ 4] 3124 	inc	b
   8446 D5            [11] 3125 	push	de
   8447 33            [ 6] 3126 	inc	sp
   8448 C5            [11] 3127 	push	bc
   8449 33            [ 6] 3128 	inc	sp
   844A 2A BE 72      [16] 3129 	ld	hl,(_mapa)
   844D E5            [11] 3130 	push	hl
   844E CD AA 4F      [17] 3131 	call	_getTilePtr
   8451 F1            [10] 3132 	pop	af
   8452 F1            [10] 3133 	pop	af
   8453 4E            [ 7] 3134 	ld	c,(hl)
   8454 3E 02         [ 7] 3135 	ld	a,#0x02
   8456 91            [ 4] 3136 	sub	a, c
   8457 38 34         [12] 3137 	jr	C,00150$
                           3138 ;src/main.c:603: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   8459 DD 6E F9      [19] 3139 	ld	l,-7 (ix)
   845C DD 66 FA      [19] 3140 	ld	h,-6 (ix)
   845F 7E            [ 7] 3141 	ld	a,(hl)
   8460 C6 18         [ 7] 3142 	add	a, #0x18
   8462 47            [ 4] 3143 	ld	b,a
   8463 DD 6E F7      [19] 3144 	ld	l,-9 (ix)
   8466 DD 66 F8      [19] 3145 	ld	h,-8 (ix)
   8469 7E            [ 7] 3146 	ld	a,(hl)
   846A C6 04         [ 7] 3147 	add	a, #0x04
   846C C5            [11] 3148 	push	bc
   846D 33            [ 6] 3149 	inc	sp
   846E F5            [11] 3150 	push	af
   846F 33            [ 6] 3151 	inc	sp
   8470 2A BE 72      [16] 3152 	ld	hl,(_mapa)
   8473 E5            [11] 3153 	push	hl
   8474 CD AA 4F      [17] 3154 	call	_getTilePtr
   8477 F1            [10] 3155 	pop	af
   8478 F1            [10] 3156 	pop	af
   8479 4E            [ 7] 3157 	ld	c,(hl)
   847A 3E 02         [ 7] 3158 	ld	a,#0x02
   847C 91            [ 4] 3159 	sub	a, c
   847D 38 0E         [12] 3160 	jr	C,00150$
                           3161 ;src/main.c:604: moverEnemigoAbajo(enemy);
   847F DD 6E F7      [19] 3162 	ld	l,-9 (ix)
   8482 DD 66 F8      [19] 3163 	ld	h,-8 (ix)
   8485 E5            [11] 3164 	push	hl
   8486 CD 5F 7B      [17] 3165 	call	_moverEnemigoAbajo
   8489 F1            [10] 3166 	pop	af
   848A C3 0F 85      [10] 3167 	jp	00163$
   848D                    3168 00150$:
                           3169 ;src/main.c:606: moverEnemigoArriba(enemy);
   848D DD 6E F7      [19] 3170 	ld	l,-9 (ix)
   8490 DD 66 F8      [19] 3171 	ld	h,-8 (ix)
   8493 E5            [11] 3172 	push	hl
   8494 CD 40 7B      [17] 3173 	call	_moverEnemigoArriba
   8497 F1            [10] 3174 	pop	af
   8498 18 75         [12] 3175 	jr	00163$
   849A                    3176 00160$:
                           3177 ;src/main.c:608: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   849A 43            [ 4] 3178 	ld	b,e
   849B 05            [ 4] 3179 	dec	b
   849C 05            [ 4] 3180 	dec	b
   849D C5            [11] 3181 	push	bc
   849E 2A BE 72      [16] 3182 	ld	hl,(_mapa)
   84A1 E5            [11] 3183 	push	hl
   84A2 CD AA 4F      [17] 3184 	call	_getTilePtr
   84A5 F1            [10] 3185 	pop	af
   84A6 F1            [10] 3186 	pop	af
   84A7 4E            [ 7] 3187 	ld	c,(hl)
   84A8 3E 02         [ 7] 3188 	ld	a,#0x02
   84AA 91            [ 4] 3189 	sub	a, c
   84AB 38 57         [12] 3190 	jr	C,00155$
                           3191 ;src/main.c:609: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   84AD DD 6E F9      [19] 3192 	ld	l,-7 (ix)
   84B0 DD 66 FA      [19] 3193 	ld	h,-6 (ix)
   84B3 56            [ 7] 3194 	ld	d,(hl)
   84B4 15            [ 4] 3195 	dec	d
   84B5 15            [ 4] 3196 	dec	d
   84B6 DD 6E F7      [19] 3197 	ld	l,-9 (ix)
   84B9 DD 66 F8      [19] 3198 	ld	h,-8 (ix)
   84BC 46            [ 7] 3199 	ld	b,(hl)
   84BD 04            [ 4] 3200 	inc	b
   84BE 04            [ 4] 3201 	inc	b
   84BF D5            [11] 3202 	push	de
   84C0 33            [ 6] 3203 	inc	sp
   84C1 C5            [11] 3204 	push	bc
   84C2 33            [ 6] 3205 	inc	sp
   84C3 2A BE 72      [16] 3206 	ld	hl,(_mapa)
   84C6 E5            [11] 3207 	push	hl
   84C7 CD AA 4F      [17] 3208 	call	_getTilePtr
   84CA F1            [10] 3209 	pop	af
   84CB F1            [10] 3210 	pop	af
   84CC 4E            [ 7] 3211 	ld	c,(hl)
   84CD 3E 02         [ 7] 3212 	ld	a,#0x02
   84CF 91            [ 4] 3213 	sub	a, c
   84D0 38 32         [12] 3214 	jr	C,00155$
                           3215 ;src/main.c:610: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   84D2 DD 6E F9      [19] 3216 	ld	l,-7 (ix)
   84D5 DD 66 FA      [19] 3217 	ld	h,-6 (ix)
   84D8 46            [ 7] 3218 	ld	b,(hl)
   84D9 05            [ 4] 3219 	dec	b
   84DA 05            [ 4] 3220 	dec	b
   84DB DD 6E F7      [19] 3221 	ld	l,-9 (ix)
   84DE DD 66 F8      [19] 3222 	ld	h,-8 (ix)
   84E1 7E            [ 7] 3223 	ld	a,(hl)
   84E2 C6 04         [ 7] 3224 	add	a, #0x04
   84E4 C5            [11] 3225 	push	bc
   84E5 33            [ 6] 3226 	inc	sp
   84E6 F5            [11] 3227 	push	af
   84E7 33            [ 6] 3228 	inc	sp
   84E8 2A BE 72      [16] 3229 	ld	hl,(_mapa)
   84EB E5            [11] 3230 	push	hl
   84EC CD AA 4F      [17] 3231 	call	_getTilePtr
   84EF F1            [10] 3232 	pop	af
   84F0 F1            [10] 3233 	pop	af
   84F1 4E            [ 7] 3234 	ld	c,(hl)
   84F2 3E 02         [ 7] 3235 	ld	a,#0x02
   84F4 91            [ 4] 3236 	sub	a, c
   84F5 38 0D         [12] 3237 	jr	C,00155$
                           3238 ;src/main.c:611: moverEnemigoArriba(enemy);
   84F7 DD 6E F7      [19] 3239 	ld	l,-9 (ix)
   84FA DD 66 F8      [19] 3240 	ld	h,-8 (ix)
   84FD E5            [11] 3241 	push	hl
   84FE CD 40 7B      [17] 3242 	call	_moverEnemigoArriba
   8501 F1            [10] 3243 	pop	af
   8502 18 0B         [12] 3244 	jr	00163$
   8504                    3245 00155$:
                           3246 ;src/main.c:613: moverEnemigoAbajo(enemy);
   8504 DD 6E F7      [19] 3247 	ld	l,-9 (ix)
   8507 DD 66 F8      [19] 3248 	ld	h,-8 (ix)
   850A E5            [11] 3249 	push	hl
   850B CD 5F 7B      [17] 3250 	call	_moverEnemigoAbajo
   850E F1            [10] 3251 	pop	af
   850F                    3252 00163$:
                           3253 ;src/main.c:617: if (!movY) {
   850F DD 7E F5      [19] 3254 	ld	a,-11 (ix)
   8512 B7            [ 4] 3255 	or	a, a
   8513 C2 1F 86      [10] 3256 	jp	NZ,00189$
                           3257 ;src/main.c:618: if (enemy->x < ANCHO_PANTALLA/2) {
   8516 DD 6E F7      [19] 3258 	ld	l,-9 (ix)
   8519 DD 66 F8      [19] 3259 	ld	h,-8 (ix)
   851C 4E            [ 7] 3260 	ld	c,(hl)
                           3261 ;src/main.c:511: u8 dify = abs(enemy->y - prota.y);
   851D DD 6E F9      [19] 3262 	ld	l,-7 (ix)
   8520 DD 66 FA      [19] 3263 	ld	h,-6 (ix)
   8523 5E            [ 7] 3264 	ld	e,(hl)
                           3265 ;src/main.c:618: if (enemy->x < ANCHO_PANTALLA/2) {
   8524 79            [ 4] 3266 	ld	a,c
   8525 D6 28         [ 7] 3267 	sub	a, #0x28
   8527 D2 A7 85      [10] 3268 	jp	NC,00175$
                           3269 ;src/main.c:619: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   852A 41            [ 4] 3270 	ld	b,c
   852B 05            [ 4] 3271 	dec	b
   852C 7B            [ 4] 3272 	ld	a,e
   852D F5            [11] 3273 	push	af
   852E 33            [ 6] 3274 	inc	sp
   852F C5            [11] 3275 	push	bc
   8530 33            [ 6] 3276 	inc	sp
   8531 2A BE 72      [16] 3277 	ld	hl,(_mapa)
   8534 E5            [11] 3278 	push	hl
   8535 CD AA 4F      [17] 3279 	call	_getTilePtr
   8538 F1            [10] 3280 	pop	af
   8539 F1            [10] 3281 	pop	af
   853A 4E            [ 7] 3282 	ld	c,(hl)
   853B 3E 02         [ 7] 3283 	ld	a,#0x02
   853D 91            [ 4] 3284 	sub	a, c
   853E 38 5A         [12] 3285 	jr	C,00165$
                           3286 ;src/main.c:620: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   8540 DD 6E F9      [19] 3287 	ld	l,-7 (ix)
   8543 DD 66 FA      [19] 3288 	ld	h,-6 (ix)
   8546 7E            [ 7] 3289 	ld	a,(hl)
   8547 C6 0B         [ 7] 3290 	add	a, #0x0B
   8549 4F            [ 4] 3291 	ld	c,a
   854A DD 6E F7      [19] 3292 	ld	l,-9 (ix)
   854D DD 66 F8      [19] 3293 	ld	h,-8 (ix)
   8550 46            [ 7] 3294 	ld	b,(hl)
   8551 05            [ 4] 3295 	dec	b
   8552 79            [ 4] 3296 	ld	a,c
   8553 F5            [11] 3297 	push	af
   8554 33            [ 6] 3298 	inc	sp
   8555 C5            [11] 3299 	push	bc
   8556 33            [ 6] 3300 	inc	sp
   8557 2A BE 72      [16] 3301 	ld	hl,(_mapa)
   855A E5            [11] 3302 	push	hl
   855B CD AA 4F      [17] 3303 	call	_getTilePtr
   855E F1            [10] 3304 	pop	af
   855F F1            [10] 3305 	pop	af
   8560 4E            [ 7] 3306 	ld	c,(hl)
   8561 3E 02         [ 7] 3307 	ld	a,#0x02
   8563 91            [ 4] 3308 	sub	a, c
   8564 38 34         [12] 3309 	jr	C,00165$
                           3310 ;src/main.c:621: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   8566 DD 6E F9      [19] 3311 	ld	l,-7 (ix)
   8569 DD 66 FA      [19] 3312 	ld	h,-6 (ix)
   856C 7E            [ 7] 3313 	ld	a,(hl)
   856D C6 16         [ 7] 3314 	add	a, #0x16
   856F 4F            [ 4] 3315 	ld	c,a
   8570 DD 6E F7      [19] 3316 	ld	l,-9 (ix)
   8573 DD 66 F8      [19] 3317 	ld	h,-8 (ix)
   8576 46            [ 7] 3318 	ld	b,(hl)
   8577 05            [ 4] 3319 	dec	b
   8578 79            [ 4] 3320 	ld	a,c
   8579 F5            [11] 3321 	push	af
   857A 33            [ 6] 3322 	inc	sp
   857B C5            [11] 3323 	push	bc
   857C 33            [ 6] 3324 	inc	sp
   857D 2A BE 72      [16] 3325 	ld	hl,(_mapa)
   8580 E5            [11] 3326 	push	hl
   8581 CD AA 4F      [17] 3327 	call	_getTilePtr
   8584 F1            [10] 3328 	pop	af
   8585 F1            [10] 3329 	pop	af
   8586 4E            [ 7] 3330 	ld	c,(hl)
   8587 3E 02         [ 7] 3331 	ld	a,#0x02
   8589 91            [ 4] 3332 	sub	a, c
   858A 38 0E         [12] 3333 	jr	C,00165$
                           3334 ;src/main.c:622: moverEnemigoIzquierda(enemy);
   858C DD 6E F7      [19] 3335 	ld	l,-9 (ix)
   858F DD 66 F8      [19] 3336 	ld	h,-8 (ix)
   8592 E5            [11] 3337 	push	hl
   8593 CD 8E 7B      [17] 3338 	call	_moverEnemigoIzquierda
   8596 F1            [10] 3339 	pop	af
   8597 C3 1F 86      [10] 3340 	jp	00189$
   859A                    3341 00165$:
                           3342 ;src/main.c:624: moverEnemigoDerecha(enemy);
   859A DD 6E F7      [19] 3343 	ld	l,-9 (ix)
   859D DD 66 F8      [19] 3344 	ld	h,-8 (ix)
   85A0 E5            [11] 3345 	push	hl
   85A1 CD 7E 7B      [17] 3346 	call	_moverEnemigoDerecha
   85A4 F1            [10] 3347 	pop	af
   85A5 18 78         [12] 3348 	jr	00189$
   85A7                    3349 00175$:
                           3350 ;src/main.c:627: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   85A7 79            [ 4] 3351 	ld	a,c
   85A8 C6 05         [ 7] 3352 	add	a, #0x05
   85AA 47            [ 4] 3353 	ld	b,a
   85AB 7B            [ 4] 3354 	ld	a,e
   85AC F5            [11] 3355 	push	af
   85AD 33            [ 6] 3356 	inc	sp
   85AE C5            [11] 3357 	push	bc
   85AF 33            [ 6] 3358 	inc	sp
   85B0 2A BE 72      [16] 3359 	ld	hl,(_mapa)
   85B3 E5            [11] 3360 	push	hl
   85B4 CD AA 4F      [17] 3361 	call	_getTilePtr
   85B7 F1            [10] 3362 	pop	af
   85B8 F1            [10] 3363 	pop	af
   85B9 4E            [ 7] 3364 	ld	c,(hl)
   85BA 3E 02         [ 7] 3365 	ld	a,#0x02
   85BC 91            [ 4] 3366 	sub	a, c
   85BD 38 55         [12] 3367 	jr	C,00170$
                           3368 ;src/main.c:628: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   85BF DD 6E F9      [19] 3369 	ld	l,-7 (ix)
   85C2 DD 66 FA      [19] 3370 	ld	h,-6 (ix)
   85C5 7E            [ 7] 3371 	ld	a,(hl)
   85C6 C6 0B         [ 7] 3372 	add	a, #0x0B
   85C8 47            [ 4] 3373 	ld	b,a
   85C9 DD 6E F7      [19] 3374 	ld	l,-9 (ix)
   85CC DD 66 F8      [19] 3375 	ld	h,-8 (ix)
   85CF 7E            [ 7] 3376 	ld	a,(hl)
   85D0 C6 05         [ 7] 3377 	add	a, #0x05
   85D2 4F            [ 4] 3378 	ld	c,a
   85D3 C5            [11] 3379 	push	bc
   85D4 2A BE 72      [16] 3380 	ld	hl,(_mapa)
   85D7 E5            [11] 3381 	push	hl
   85D8 CD AA 4F      [17] 3382 	call	_getTilePtr
   85DB F1            [10] 3383 	pop	af
   85DC F1            [10] 3384 	pop	af
   85DD 4E            [ 7] 3385 	ld	c,(hl)
   85DE 3E 02         [ 7] 3386 	ld	a,#0x02
   85E0 91            [ 4] 3387 	sub	a, c
   85E1 38 31         [12] 3388 	jr	C,00170$
                           3389 ;src/main.c:629: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   85E3 DD 6E F9      [19] 3390 	ld	l,-7 (ix)
   85E6 DD 66 FA      [19] 3391 	ld	h,-6 (ix)
   85E9 7E            [ 7] 3392 	ld	a,(hl)
   85EA C6 16         [ 7] 3393 	add	a, #0x16
   85EC 47            [ 4] 3394 	ld	b,a
   85ED DD 6E F7      [19] 3395 	ld	l,-9 (ix)
   85F0 DD 66 F8      [19] 3396 	ld	h,-8 (ix)
   85F3 7E            [ 7] 3397 	ld	a,(hl)
   85F4 C6 05         [ 7] 3398 	add	a, #0x05
   85F6 4F            [ 4] 3399 	ld	c,a
   85F7 C5            [11] 3400 	push	bc
   85F8 2A BE 72      [16] 3401 	ld	hl,(_mapa)
   85FB E5            [11] 3402 	push	hl
   85FC CD AA 4F      [17] 3403 	call	_getTilePtr
   85FF F1            [10] 3404 	pop	af
   8600 F1            [10] 3405 	pop	af
   8601 4E            [ 7] 3406 	ld	c,(hl)
   8602 3E 02         [ 7] 3407 	ld	a,#0x02
   8604 91            [ 4] 3408 	sub	a, c
   8605 38 0D         [12] 3409 	jr	C,00170$
                           3410 ;src/main.c:630: moverEnemigoDerecha(enemy);
   8607 DD 6E F7      [19] 3411 	ld	l,-9 (ix)
   860A DD 66 F8      [19] 3412 	ld	h,-8 (ix)
   860D E5            [11] 3413 	push	hl
   860E CD 7E 7B      [17] 3414 	call	_moverEnemigoDerecha
   8611 F1            [10] 3415 	pop	af
   8612 18 0B         [12] 3416 	jr	00189$
   8614                    3417 00170$:
                           3418 ;src/main.c:633: moverEnemigoIzquierda(enemy);
   8614 DD 6E F7      [19] 3419 	ld	l,-9 (ix)
   8617 DD 66 F8      [19] 3420 	ld	h,-8 (ix)
   861A E5            [11] 3421 	push	hl
   861B CD 8E 7B      [17] 3422 	call	_moverEnemigoIzquierda
   861E F1            [10] 3423 	pop	af
   861F                    3424 00189$:
   861F DD F9         [10] 3425 	ld	sp, ix
   8621 DD E1         [14] 3426 	pop	ix
   8623 C9            [10] 3427 	ret
                           3428 ;src/main.c:642: void updateEnemies() { // maquina de estados
                           3429 ;	---------------------------------
                           3430 ; Function updateEnemies
                           3431 ; ---------------------------------
   8624                    3432 _updateEnemies::
   8624 DD E5         [15] 3433 	push	ix
   8626 DD 21 00 00   [14] 3434 	ld	ix,#0
   862A DD 39         [15] 3435 	add	ix,sp
   862C F5            [11] 3436 	push	af
   862D F5            [11] 3437 	push	af
                           3438 ;src/main.c:643: u8 i = (2 + num_mapa) + 1;
   862E 3A C0 72      [13] 3439 	ld	a,(#_num_mapa + 0)
   8631 C6 03         [ 7] 3440 	add	a, #0x03
   8633 DD 77 FC      [19] 3441 	ld	-4 (ix),a
                           3442 ;src/main.c:647: actual = enemy;
                           3443 ;src/main.c:649: while (--i) {
   8636 DD 36 FE EE   [19] 3444 	ld	-2 (ix),#<(_enemy)
   863A DD 36 FF 64   [19] 3445 	ld	-1 (ix),#>(_enemy)
   863E                    3446 00123$:
   863E DD 35 FC      [23] 3447 	dec	-4 (ix)
   8641 DD 4E FC      [19] 3448 	ld	c, -4 (ix)
   8644 79            [ 4] 3449 	ld	a,c
   8645 B7            [ 4] 3450 	or	a, a
   8646 CA 55 87      [10] 3451 	jp	Z,00126$
                           3452 ;src/main.c:650: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   8649 3A 04 65      [13] 3453 	ld	a, (#(_enemy + 0x0016) + 0)
   864C B7            [ 4] 3454 	or	a, a
   864D 28 1C         [12] 3455 	jr	Z,00121$
                           3456 ;src/main.c:651: engage(actual, prota.x, prota.y);
   864F 3A 07 6A      [13] 3457 	ld	a,(#(_prota + 0x0001) + 0)
   8652 DD 77 FD      [19] 3458 	ld	-3 (ix),a
   8655 21 06 6A      [10] 3459 	ld	hl, #_prota + 0
   8658 46            [ 7] 3460 	ld	b,(hl)
   8659 DD 7E FD      [19] 3461 	ld	a,-3 (ix)
   865C F5            [11] 3462 	push	af
   865D 33            [ 6] 3463 	inc	sp
   865E C5            [11] 3464 	push	bc
   865F 33            [ 6] 3465 	inc	sp
   8660 21 EE 64      [10] 3466 	ld	hl,#_enemy
   8663 E5            [11] 3467 	push	hl
   8664 CD 2E 7F      [17] 3468 	call	_engage
   8667 F1            [10] 3469 	pop	af
   8668 F1            [10] 3470 	pop	af
   8669 18 D3         [12] 3471 	jr	00123$
   866B                    3472 00121$:
                           3473 ;src/main.c:653: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   866B 21 EE 64      [10] 3474 	ld	hl,#_enemy
   866E E5            [11] 3475 	push	hl
   866F CD 20 7D      [17] 3476 	call	_lookFor
   8672 F1            [10] 3477 	pop	af
                           3478 ;src/main.c:654: if (actual->patrolling) { // esta patrullando
   8673 3A F9 64      [13] 3479 	ld	a, (#(_enemy + 0x000b) + 0)
   8676 B7            [ 4] 3480 	or	a, a
   8677 CA 14 87      [10] 3481 	jp	Z,00118$
                           3482 ;src/main.c:655: if (!actual->seen && !actual->inRange) {
   867A 21 00 65      [10] 3483 	ld	hl, #(_enemy + 0x0012) + 0
   867D 4E            [ 7] 3484 	ld	c,(hl)
   867E 79            [ 4] 3485 	ld	a,c
   867F B7            [ 4] 3486 	or	a, a
   8680 20 10         [12] 3487 	jr	NZ,00107$
   8682 3A FF 64      [13] 3488 	ld	a, (#(_enemy + 0x0011) + 0)
   8685 B7            [ 4] 3489 	or	a, a
   8686 20 0A         [12] 3490 	jr	NZ,00107$
                           3491 ;src/main.c:656: patrol(actual);
   8688 21 EE 64      [10] 3492 	ld	hl,#_enemy
   868B E5            [11] 3493 	push	hl
   868C CD 12 7F      [17] 3494 	call	_patrol
   868F F1            [10] 3495 	pop	af
   8690 18 AC         [12] 3496 	jr	00123$
   8692                    3497 00107$:
                           3498 ;src/main.c:657: }else if (actual->inRange) {
                           3499 ;src/main.c:660: actual->onPathPatrol = 0;
                           3500 ;src/main.c:657: }else if (actual->inRange) {
   8692 3A FF 64      [13] 3501 	ld	a,(#(_enemy + 0x0011) + 0)
   8695 B7            [ 4] 3502 	or	a, a
   8696 28 24         [12] 3503 	jr	Z,00104$
                           3504 ;src/main.c:658: engage(actual, prota.x, prota.y);
   8698 21 07 6A      [10] 3505 	ld	hl, #(_prota + 0x0001) + 0
   869B 46            [ 7] 3506 	ld	b,(hl)
   869C 21 06 6A      [10] 3507 	ld	hl, #_prota + 0
   869F 4E            [ 7] 3508 	ld	c, (hl)
   86A0 C5            [11] 3509 	push	bc
   86A1 21 EE 64      [10] 3510 	ld	hl,#_enemy
   86A4 E5            [11] 3511 	push	hl
   86A5 CD 2E 7F      [17] 3512 	call	_engage
   86A8 F1            [10] 3513 	pop	af
   86A9 F1            [10] 3514 	pop	af
                           3515 ;src/main.c:659: actual->patrolling = 0;
   86AA 21 F9 64      [10] 3516 	ld	hl,#(_enemy + 0x000b)
   86AD 36 00         [10] 3517 	ld	(hl),#0x00
                           3518 ;src/main.c:660: actual->onPathPatrol = 0;
   86AF 21 FA 64      [10] 3519 	ld	hl,#(_enemy + 0x000c)
   86B2 36 00         [10] 3520 	ld	(hl),#0x00
                           3521 ;src/main.c:661: actual->engage = 1;
   86B4 21 04 65      [10] 3522 	ld	hl,#(_enemy + 0x0016)
   86B7 36 01         [10] 3523 	ld	(hl),#0x01
   86B9 C3 3E 86      [10] 3524 	jp	00123$
   86BC                    3525 00104$:
                           3526 ;src/main.c:662: } else if (actual->seen) {
   86BC 79            [ 4] 3527 	ld	a,c
   86BD B7            [ 4] 3528 	or	a, a
   86BE CA 3E 86      [10] 3529 	jp	Z,00123$
                           3530 ;src/main.c:663: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   86C1 21 07 6A      [10] 3531 	ld	hl, #(_prota + 0x0001) + 0
   86C4 46            [ 7] 3532 	ld	b,(hl)
   86C5 21 06 6A      [10] 3533 	ld	hl, #_prota + 0
   86C8 4E            [ 7] 3534 	ld	c,(hl)
   86C9 21 EF 64      [10] 3535 	ld	hl, #(_enemy + 0x0001) + 0
   86CC 5E            [ 7] 3536 	ld	e,(hl)
   86CD 21 EE 64      [10] 3537 	ld	hl, #_enemy + 0
   86D0 56            [ 7] 3538 	ld	d,(hl)
   86D1 2A BE 72      [16] 3539 	ld	hl,(_mapa)
   86D4 E5            [11] 3540 	push	hl
   86D5 21 EE 64      [10] 3541 	ld	hl,#_enemy
   86D8 E5            [11] 3542 	push	hl
   86D9 C5            [11] 3543 	push	bc
   86DA 7B            [ 4] 3544 	ld	a,e
   86DB F5            [11] 3545 	push	af
   86DC 33            [ 6] 3546 	inc	sp
   86DD D5            [11] 3547 	push	de
   86DE 33            [ 6] 3548 	inc	sp
   86DF CD 9A 47      [17] 3549 	call	_pathFinding
   86E2 21 08 00      [10] 3550 	ld	hl,#8
   86E5 39            [11] 3551 	add	hl,sp
   86E6 F9            [ 6] 3552 	ld	sp,hl
                           3553 ;src/main.c:664: actual->p_seek_x = actual->x;
   86E7 3A EE 64      [13] 3554 	ld	a, (#_enemy + 0)
   86EA 32 05 65      [13] 3555 	ld	(#(_enemy + 0x0017)),a
                           3556 ;src/main.c:665: actual->p_seek_y = actual->y;
   86ED 3A EF 64      [13] 3557 	ld	a, (#(_enemy + 0x0001) + 0)
   86F0 32 06 65      [13] 3558 	ld	(#(_enemy + 0x0018)),a
                           3559 ;src/main.c:666: actual->seek = 1;
   86F3 21 02 65      [10] 3560 	ld	hl,#(_enemy + 0x0014)
   86F6 36 01         [10] 3561 	ld	(hl),#0x01
                           3562 ;src/main.c:667: actual->iter=0;
   86F8 21 FD 64      [10] 3563 	ld	hl,#(_enemy + 0x000f)
   86FB 36 00         [10] 3564 	ld	(hl),#0x00
                           3565 ;src/main.c:668: actual->reversePatrol = NO;
   86FD 21 FB 64      [10] 3566 	ld	hl,#(_enemy + 0x000d)
   8700 36 00         [10] 3567 	ld	(hl),#0x00
                           3568 ;src/main.c:669: actual->patrolling = 0;
   8702 21 F9 64      [10] 3569 	ld	hl,#(_enemy + 0x000b)
   8705 36 00         [10] 3570 	ld	(hl),#0x00
                           3571 ;src/main.c:670: actual->onPathPatrol = 0;
   8707 21 FA 64      [10] 3572 	ld	hl,#(_enemy + 0x000c)
   870A 36 00         [10] 3573 	ld	(hl),#0x00
                           3574 ;src/main.c:671: actual->seen = 0;
   870C 21 00 65      [10] 3575 	ld	hl,#(_enemy + 0x0012)
   870F 36 00         [10] 3576 	ld	(hl),#0x00
   8711 C3 3E 86      [10] 3577 	jp	00123$
   8714                    3578 00118$:
                           3579 ;src/main.c:673: } else if (actual->seek) { // esta buscando
   8714 3A 02 65      [13] 3580 	ld	a, (#(_enemy + 0x0014) + 0)
   8717 B7            [ 4] 3581 	or	a, a
   8718 CA 3E 86      [10] 3582 	jp	Z,00123$
                           3583 ;src/main.c:674: if (!actual->found /*&& actual->seekTimer <= 5*/) {
   871B DD 6E FE      [19] 3584 	ld	l,-2 (ix)
   871E DD 66 FF      [19] 3585 	ld	h,-1 (ix)
   8721 11 13 00      [10] 3586 	ld	de, #0x0013
   8724 19            [11] 3587 	add	hl, de
   8725 7E            [ 7] 3588 	ld	a,(hl)
   8726 B7            [ 4] 3589 	or	a, a
   8727 20 0B         [12] 3590 	jr	NZ,00113$
                           3591 ;src/main.c:675: seek(actual); // buscar en posiciones cercanas a la actual
   8729 21 EE 64      [10] 3592 	ld	hl,#_enemy
   872C E5            [11] 3593 	push	hl
   872D CD 24 7F      [17] 3594 	call	_seek
   8730 F1            [10] 3595 	pop	af
   8731 C3 3E 86      [10] 3596 	jp	00123$
   8734                    3597 00113$:
                           3598 ;src/main.c:676: } else if (actual->inRange) {
   8734 3A FF 64      [13] 3599 	ld	a, (#(_enemy + 0x0011) + 0)
   8737 B7            [ 4] 3600 	or	a, a
   8738 CA 3E 86      [10] 3601 	jp	Z,00123$
                           3602 ;src/main.c:677: engage(actual, prota.x, prota.y);
   873B 21 07 6A      [10] 3603 	ld	hl, #(_prota + 0x0001) + 0
   873E 46            [ 7] 3604 	ld	b,(hl)
   873F 21 06 6A      [10] 3605 	ld	hl, #_prota + 0
   8742 4E            [ 7] 3606 	ld	c, (hl)
   8743 C5            [11] 3607 	push	bc
   8744 21 EE 64      [10] 3608 	ld	hl,#_enemy
   8747 E5            [11] 3609 	push	hl
   8748 CD 2E 7F      [17] 3610 	call	_engage
   874B F1            [10] 3611 	pop	af
   874C F1            [10] 3612 	pop	af
                           3613 ;src/main.c:678: actual->engage = 1;
   874D 21 04 65      [10] 3614 	ld	hl,#(_enemy + 0x0016)
   8750 36 01         [10] 3615 	ld	(hl),#0x01
   8752 C3 3E 86      [10] 3616 	jp	00123$
   8755                    3617 00126$:
   8755 DD F9         [10] 3618 	ld	sp, ix
   8757 DD E1         [14] 3619 	pop	ix
   8759 C9            [10] 3620 	ret
                           3621 ;src/main.c:685: void inicializarEnemy() {
                           3622 ;	---------------------------------
                           3623 ; Function inicializarEnemy
                           3624 ; ---------------------------------
   875A                    3625 _inicializarEnemy::
   875A DD E5         [15] 3626 	push	ix
   875C DD 21 00 00   [14] 3627 	ld	ix,#0
   8760 DD 39         [15] 3628 	add	ix,sp
   8762 F5            [11] 3629 	push	af
   8763 F5            [11] 3630 	push	af
                           3631 ;src/main.c:686: u8 i = (2 + num_mapa) + 1; //sacar distinto numero dependiendo del mapa
   8764 3A C0 72      [13] 3632 	ld	a,(#_num_mapa + 0)
   8767 C6 03         [ 7] 3633 	add	a, #0x03
   8769 DD 77 FD      [19] 3634 	ld	-3 (ix),a
                           3635 ;src/main.c:696: actual = enemy;
   876C 11 EE 64      [10] 3636 	ld	de,#_enemy+0
                           3637 ;src/main.c:697: while(--i){
   876F                    3638 00101$:
   876F DD 35 FD      [23] 3639 	dec	-3 (ix)
   8772 DD 7E FD      [19] 3640 	ld	a,-3 (ix)
   8775 B7            [ 4] 3641 	or	a, a
   8776 CA 52 88      [10] 3642 	jp	Z,00104$
                           3643 ;src/main.c:698: actual->x = actual->px = spawnX[i];
   8779 4B            [ 4] 3644 	ld	c, e
   877A 42            [ 4] 3645 	ld	b, d
   877B 03            [ 6] 3646 	inc	bc
   877C 03            [ 6] 3647 	inc	bc
   877D 3E E4         [ 7] 3648 	ld	a,#<(_spawnX)
   877F DD 86 FD      [19] 3649 	add	a, -3 (ix)
   8782 6F            [ 4] 3650 	ld	l,a
   8783 3E 72         [ 7] 3651 	ld	a,#>(_spawnX)
   8785 CE 00         [ 7] 3652 	adc	a, #0x00
   8787 67            [ 4] 3653 	ld	h,a
   8788 7E            [ 7] 3654 	ld	a,(hl)
   8789 DD 77 FE      [19] 3655 	ld	-2 (ix), a
   878C 02            [ 7] 3656 	ld	(bc),a
   878D DD 7E FE      [19] 3657 	ld	a,-2 (ix)
   8790 12            [ 7] 3658 	ld	(de),a
                           3659 ;src/main.c:699: actual->y = actual->py = spawnY[i];
   8791 D5            [11] 3660 	push	de
   8792 FD E1         [14] 3661 	pop	iy
   8794 FD 23         [10] 3662 	inc	iy
   8796 4B            [ 4] 3663 	ld	c, e
   8797 42            [ 4] 3664 	ld	b, d
   8798 03            [ 6] 3665 	inc	bc
   8799 03            [ 6] 3666 	inc	bc
   879A 03            [ 6] 3667 	inc	bc
   879B 3E E9         [ 7] 3668 	ld	a,#<(_spawnY)
   879D DD 86 FD      [19] 3669 	add	a, -3 (ix)
   87A0 6F            [ 4] 3670 	ld	l,a
   87A1 3E 72         [ 7] 3671 	ld	a,#>(_spawnY)
   87A3 CE 00         [ 7] 3672 	adc	a, #0x00
   87A5 67            [ 4] 3673 	ld	h,a
   87A6 7E            [ 7] 3674 	ld	a,(hl)
   87A7 DD 77 FF      [19] 3675 	ld	-1 (ix), a
   87AA 02            [ 7] 3676 	ld	(bc),a
   87AB DD 7E FF      [19] 3677 	ld	a,-1 (ix)
   87AE FD 77 00      [19] 3678 	ld	0 (iy), a
                           3679 ;src/main.c:700: actual->mover  = NO;
   87B1 21 06 00      [10] 3680 	ld	hl,#0x0006
   87B4 19            [11] 3681 	add	hl,de
   87B5 36 00         [10] 3682 	ld	(hl),#0x00
                           3683 ;src/main.c:701: actual->mira   = M_abajo;
   87B7 21 07 00      [10] 3684 	ld	hl,#0x0007
   87BA 19            [11] 3685 	add	hl,de
   87BB 36 03         [10] 3686 	ld	(hl),#0x03
                           3687 ;src/main.c:702: actual->sprite = g_enemy;
   87BD 21 04 00      [10] 3688 	ld	hl,#0x0004
   87C0 19            [11] 3689 	add	hl,de
   87C1 36 3A         [10] 3690 	ld	(hl),#<(_g_enemy)
   87C3 23            [ 6] 3691 	inc	hl
   87C4 36 3C         [10] 3692 	ld	(hl),#>(_g_enemy)
                           3693 ;src/main.c:703: actual->muerto = NO;
   87C6 21 08 00      [10] 3694 	ld	hl,#0x0008
   87C9 19            [11] 3695 	add	hl,de
   87CA 36 00         [10] 3696 	ld	(hl),#0x00
                           3697 ;src/main.c:704: actual->muertes = 0;
   87CC 21 0A 00      [10] 3698 	ld	hl,#0x000A
   87CF 19            [11] 3699 	add	hl,de
   87D0 36 00         [10] 3700 	ld	(hl),#0x00
                           3701 ;src/main.c:705: actual->patrolling = SI;
   87D2 21 0B 00      [10] 3702 	ld	hl,#0x000B
   87D5 19            [11] 3703 	add	hl,de
   87D6 36 01         [10] 3704 	ld	(hl),#0x01
                           3705 ;src/main.c:706: actual->onPathPatrol = SI;
   87D8 21 0C 00      [10] 3706 	ld	hl,#0x000C
   87DB 19            [11] 3707 	add	hl,de
   87DC 36 01         [10] 3708 	ld	(hl),#0x01
                           3709 ;src/main.c:707: actual->reversePatrol = NO;
   87DE 21 0D 00      [10] 3710 	ld	hl,#0x000D
   87E1 19            [11] 3711 	add	hl,de
   87E2 36 00         [10] 3712 	ld	(hl),#0x00
                           3713 ;src/main.c:708: actual->iter = 0;
   87E4 21 0F 00      [10] 3714 	ld	hl,#0x000F
   87E7 19            [11] 3715 	add	hl,de
   87E8 36 00         [10] 3716 	ld	(hl),#0x00
                           3717 ;src/main.c:709: actual->lastIter = 0;
   87EA 21 10 00      [10] 3718 	ld	hl,#0x0010
   87ED 19            [11] 3719 	add	hl,de
   87EE 36 00         [10] 3720 	ld	(hl),#0x00
                           3721 ;src/main.c:710: actual->seen = 0;
   87F0 21 12 00      [10] 3722 	ld	hl,#0x0012
   87F3 19            [11] 3723 	add	hl,de
   87F4 36 00         [10] 3724 	ld	(hl),#0x00
                           3725 ;src/main.c:711: actual->found = 0;
   87F6 21 13 00      [10] 3726 	ld	hl,#0x0013
   87F9 19            [11] 3727 	add	hl,de
   87FA 36 00         [10] 3728 	ld	(hl),#0x00
                           3729 ;src/main.c:712: pathFinding(actual->x, actual->y, patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
   87FC 21 C0 72      [10] 3730 	ld	hl,#_num_mapa + 0
   87FF 4E            [ 7] 3731 	ld	c, (hl)
   8800 0C            [ 4] 3732 	inc	c
   8801 06 00         [ 7] 3733 	ld	b,#0x00
   8803 69            [ 4] 3734 	ld	l, c
   8804 60            [ 4] 3735 	ld	h, b
   8805 29            [11] 3736 	add	hl, hl
   8806 29            [11] 3737 	add	hl, hl
   8807 09            [11] 3738 	add	hl, bc
   8808 4D            [ 4] 3739 	ld	c,l
   8809 44            [ 4] 3740 	ld	b,h
   880A 21 02 73      [10] 3741 	ld	hl,#_patrolY
   880D 09            [11] 3742 	add	hl,bc
   880E DD 7E FD      [19] 3743 	ld	a,-3 (ix)
   8811 85            [ 4] 3744 	add	a, l
   8812 6F            [ 4] 3745 	ld	l,a
   8813 3E 00         [ 7] 3746 	ld	a,#0x00
   8815 8C            [ 4] 3747 	adc	a, h
   8816 67            [ 4] 3748 	ld	h,a
   8817 7E            [ 7] 3749 	ld	a,(hl)
   8818 DD 77 FC      [19] 3750 	ld	-4 (ix),a
   881B 21 EE 72      [10] 3751 	ld	hl,#_patrolX
   881E 09            [11] 3752 	add	hl,bc
   881F DD 4E FD      [19] 3753 	ld	c,-3 (ix)
   8822 06 00         [ 7] 3754 	ld	b,#0x00
   8824 09            [11] 3755 	add	hl,bc
   8825 46            [ 7] 3756 	ld	b,(hl)
   8826 D5            [11] 3757 	push	de
   8827 2A BE 72      [16] 3758 	ld	hl,(_mapa)
   882A E5            [11] 3759 	push	hl
   882B D5            [11] 3760 	push	de
   882C DD 7E FC      [19] 3761 	ld	a,-4 (ix)
   882F F5            [11] 3762 	push	af
   8830 33            [ 6] 3763 	inc	sp
   8831 C5            [11] 3764 	push	bc
   8832 33            [ 6] 3765 	inc	sp
   8833 DD 66 FF      [19] 3766 	ld	h,-1 (ix)
   8836 DD 6E FE      [19] 3767 	ld	l,-2 (ix)
   8839 E5            [11] 3768 	push	hl
   883A CD 9A 47      [17] 3769 	call	_pathFinding
   883D 21 08 00      [10] 3770 	ld	hl,#8
   8840 39            [11] 3771 	add	hl,sp
   8841 F9            [ 6] 3772 	ld	sp,hl
   8842 D1            [10] 3773 	pop	de
                           3774 ;src/main.c:735: dibujarEnemigo(actual);
   8843 D5            [11] 3775 	push	de
   8844 D5            [11] 3776 	push	de
   8845 CD A0 75      [17] 3777 	call	_dibujarEnemigo
   8848 F1            [10] 3778 	pop	af
   8849 D1            [10] 3779 	pop	de
                           3780 ;src/main.c:737: ++actual;
   884A 21 46 01      [10] 3781 	ld	hl,#0x0146
   884D 19            [11] 3782 	add	hl,de
   884E EB            [ 4] 3783 	ex	de,hl
   884F C3 6F 87      [10] 3784 	jp	00101$
   8852                    3785 00104$:
   8852 DD F9         [10] 3786 	ld	sp, ix
   8854 DD E1         [14] 3787 	pop	ix
   8856 C9            [10] 3788 	ret
                           3789 ;src/main.c:741: void avanzarMapa() {
                           3790 ;	---------------------------------
                           3791 ; Function avanzarMapa
                           3792 ; ---------------------------------
   8857                    3793 _avanzarMapa::
                           3794 ;src/main.c:742: if(num_mapa < NUM_MAPAS -1) {
   8857 3A C0 72      [13] 3795 	ld	a,(#_num_mapa + 0)
   885A D6 02         [ 7] 3796 	sub	a, #0x02
   885C 30 34         [12] 3797 	jr	NC,00102$
                           3798 ;src/main.c:743: mapa = mapas[++num_mapa];
   885E 01 DE 72      [10] 3799 	ld	bc,#_mapas+0
   8861 21 C0 72      [10] 3800 	ld	hl, #_num_mapa+0
   8864 34            [11] 3801 	inc	(hl)
   8865 FD 21 C0 72   [14] 3802 	ld	iy,#_num_mapa
   8869 FD 6E 00      [19] 3803 	ld	l,0 (iy)
   886C 26 00         [ 7] 3804 	ld	h,#0x00
   886E 29            [11] 3805 	add	hl, hl
   886F 09            [11] 3806 	add	hl,bc
   8870 7E            [ 7] 3807 	ld	a,(hl)
   8871 FD 21 BE 72   [14] 3808 	ld	iy,#_mapa
   8875 FD 77 00      [19] 3809 	ld	0 (iy),a
   8878 23            [ 6] 3810 	inc	hl
   8879 7E            [ 7] 3811 	ld	a,(hl)
   887A 32 BF 72      [13] 3812 	ld	(#_mapa + 1),a
                           3813 ;src/main.c:744: prota.x = prota.px = 2;
   887D 21 08 6A      [10] 3814 	ld	hl,#(_prota + 0x0002)
   8880 36 02         [10] 3815 	ld	(hl),#0x02
   8882 21 06 6A      [10] 3816 	ld	hl,#_prota
   8885 36 02         [10] 3817 	ld	(hl),#0x02
                           3818 ;src/main.c:745: prota.mover = SI;
   8887 21 0C 6A      [10] 3819 	ld	hl,#(_prota + 0x0006)
   888A 36 01         [10] 3820 	ld	(hl),#0x01
                           3821 ;src/main.c:746: dibujarMapa();
   888C CD C8 72      [17] 3822 	call	_dibujarMapa
                           3823 ;src/main.c:747: inicializarEnemy();
   888F C3 5A 87      [10] 3824 	jp  _inicializarEnemy
   8892                    3825 00102$:
                           3826 ;src/main.c:750: menuFin(puntuacion);
   8892 FD 21 C1 72   [14] 3827 	ld	iy,#_puntuacion
   8896 FD 6E 00      [19] 3828 	ld	l,0 (iy)
   8899 26 00         [ 7] 3829 	ld	h,#0x00
   889B C3 2E 50      [10] 3830 	jp  _menuFin
                           3831 ;src/main.c:754: void moverIzquierda() {
                           3832 ;	---------------------------------
                           3833 ; Function moverIzquierda
                           3834 ; ---------------------------------
   889E                    3835 _moverIzquierda::
                           3836 ;src/main.c:755: prota.mira = M_izquierda;
   889E 01 06 6A      [10] 3837 	ld	bc,#_prota+0
   88A1 21 0D 6A      [10] 3838 	ld	hl,#(_prota + 0x0007)
   88A4 36 01         [10] 3839 	ld	(hl),#0x01
                           3840 ;src/main.c:756: if (!checkCollision(M_izquierda)) {
   88A6 C5            [11] 3841 	push	bc
   88A7 3E 01         [ 7] 3842 	ld	a,#0x01
   88A9 F5            [11] 3843 	push	af
   88AA 33            [ 6] 3844 	inc	sp
   88AB CD 2B 74      [17] 3845 	call	_checkCollision
   88AE 33            [ 6] 3846 	inc	sp
   88AF C1            [10] 3847 	pop	bc
   88B0 7D            [ 4] 3848 	ld	a,l
   88B1 B7            [ 4] 3849 	or	a, a
   88B2 C0            [11] 3850 	ret	NZ
                           3851 ;src/main.c:757: prota.x--;
   88B3 0A            [ 7] 3852 	ld	a,(bc)
   88B4 C6 FF         [ 7] 3853 	add	a,#0xFF
   88B6 02            [ 7] 3854 	ld	(bc),a
                           3855 ;src/main.c:758: prota.mover = SI;
   88B7 21 0C 6A      [10] 3856 	ld	hl,#(_prota + 0x0006)
   88BA 36 01         [10] 3857 	ld	(hl),#0x01
                           3858 ;src/main.c:759: prota.sprite = g_hero_left;
   88BC 21 C6 3D      [10] 3859 	ld	hl,#_g_hero_left
   88BF 22 0A 6A      [16] 3860 	ld	((_prota + 0x0004)), hl
   88C2 C9            [10] 3861 	ret
                           3862 ;src/main.c:763: void moverDerecha() {
                           3863 ;	---------------------------------
                           3864 ; Function moverDerecha
                           3865 ; ---------------------------------
   88C3                    3866 _moverDerecha::
                           3867 ;src/main.c:764: prota.mira = M_derecha;
   88C3 21 0D 6A      [10] 3868 	ld	hl,#(_prota + 0x0007)
   88C6 36 00         [10] 3869 	ld	(hl),#0x00
                           3870 ;src/main.c:765: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   88C8 AF            [ 4] 3871 	xor	a, a
   88C9 F5            [11] 3872 	push	af
   88CA 33            [ 6] 3873 	inc	sp
   88CB CD 2B 74      [17] 3874 	call	_checkCollision
   88CE 33            [ 6] 3875 	inc	sp
   88CF 45            [ 4] 3876 	ld	b,l
   88D0 21 06 6A      [10] 3877 	ld	hl, #_prota + 0
   88D3 4E            [ 7] 3878 	ld	c,(hl)
   88D4 59            [ 4] 3879 	ld	e,c
   88D5 16 00         [ 7] 3880 	ld	d,#0x00
   88D7 21 07 00      [10] 3881 	ld	hl,#0x0007
   88DA 19            [11] 3882 	add	hl,de
   88DB 11 50 80      [10] 3883 	ld	de, #0x8050
   88DE 29            [11] 3884 	add	hl, hl
   88DF 3F            [ 4] 3885 	ccf
   88E0 CB 1C         [ 8] 3886 	rr	h
   88E2 CB 1D         [ 8] 3887 	rr	l
   88E4 ED 52         [15] 3888 	sbc	hl, de
   88E6 3E 00         [ 7] 3889 	ld	a,#0x00
   88E8 17            [ 4] 3890 	rla
   88E9 5F            [ 4] 3891 	ld	e,a
   88EA 78            [ 4] 3892 	ld	a,b
   88EB B7            [ 4] 3893 	or	a,a
   88EC 20 14         [12] 3894 	jr	NZ,00104$
   88EE B3            [ 4] 3895 	or	a,e
   88EF 28 11         [12] 3896 	jr	Z,00104$
                           3897 ;src/main.c:766: prota.x++;
   88F1 0C            [ 4] 3898 	inc	c
   88F2 21 06 6A      [10] 3899 	ld	hl,#_prota
   88F5 71            [ 7] 3900 	ld	(hl),c
                           3901 ;src/main.c:767: prota.mover = SI;
   88F6 21 0C 6A      [10] 3902 	ld	hl,#(_prota + 0x0006)
   88F9 36 01         [10] 3903 	ld	(hl),#0x01
                           3904 ;src/main.c:768: prota.sprite = g_hero;
   88FB 21 70 3E      [10] 3905 	ld	hl,#_g_hero
   88FE 22 0A 6A      [16] 3906 	ld	((_prota + 0x0004)), hl
   8901 C9            [10] 3907 	ret
   8902                    3908 00104$:
                           3909 ;src/main.c:770: }else if( prota.x + G_HERO_W >= 80){
   8902 7B            [ 4] 3910 	ld	a,e
   8903 B7            [ 4] 3911 	or	a, a
   8904 C0            [11] 3912 	ret	NZ
                           3913 ;src/main.c:771: avanzarMapa();
   8905 C3 57 88      [10] 3914 	jp  _avanzarMapa
                           3915 ;src/main.c:775: void moverArriba() {
                           3916 ;	---------------------------------
                           3917 ; Function moverArriba
                           3918 ; ---------------------------------
   8908                    3919 _moverArriba::
                           3920 ;src/main.c:776: prota.mira = M_arriba;
   8908 21 0D 6A      [10] 3921 	ld	hl,#(_prota + 0x0007)
   890B 36 02         [10] 3922 	ld	(hl),#0x02
                           3923 ;src/main.c:777: if (!checkCollision(M_arriba)) {
   890D 3E 02         [ 7] 3924 	ld	a,#0x02
   890F F5            [11] 3925 	push	af
   8910 33            [ 6] 3926 	inc	sp
   8911 CD 2B 74      [17] 3927 	call	_checkCollision
   8914 33            [ 6] 3928 	inc	sp
   8915 7D            [ 4] 3929 	ld	a,l
   8916 B7            [ 4] 3930 	or	a, a
   8917 C0            [11] 3931 	ret	NZ
                           3932 ;src/main.c:778: prota.y--;
   8918 21 07 6A      [10] 3933 	ld	hl,#_prota + 1
   891B 4E            [ 7] 3934 	ld	c,(hl)
   891C 0D            [ 4] 3935 	dec	c
   891D 71            [ 7] 3936 	ld	(hl),c
                           3937 ;src/main.c:779: prota.y--;
   891E 0D            [ 4] 3938 	dec	c
   891F 71            [ 7] 3939 	ld	(hl),c
                           3940 ;src/main.c:780: prota.mover  = SI;
   8920 21 0C 6A      [10] 3941 	ld	hl,#(_prota + 0x0006)
   8923 36 01         [10] 3942 	ld	(hl),#0x01
                           3943 ;src/main.c:781: prota.sprite = g_hero_up;
   8925 21 2C 3D      [10] 3944 	ld	hl,#_g_hero_up
   8928 22 0A 6A      [16] 3945 	ld	((_prota + 0x0004)), hl
   892B C9            [10] 3946 	ret
                           3947 ;src/main.c:785: void moverAbajo() {
                           3948 ;	---------------------------------
                           3949 ; Function moverAbajo
                           3950 ; ---------------------------------
   892C                    3951 _moverAbajo::
                           3952 ;src/main.c:786: prota.mira = M_abajo;
   892C 21 0D 6A      [10] 3953 	ld	hl,#(_prota + 0x0007)
   892F 36 03         [10] 3954 	ld	(hl),#0x03
                           3955 ;src/main.c:787: if (!checkCollision(M_abajo) ) {
   8931 3E 03         [ 7] 3956 	ld	a,#0x03
   8933 F5            [11] 3957 	push	af
   8934 33            [ 6] 3958 	inc	sp
   8935 CD 2B 74      [17] 3959 	call	_checkCollision
   8938 33            [ 6] 3960 	inc	sp
   8939 7D            [ 4] 3961 	ld	a,l
   893A B7            [ 4] 3962 	or	a, a
   893B C0            [11] 3963 	ret	NZ
                           3964 ;src/main.c:788: prota.y++;
   893C 01 07 6A      [10] 3965 	ld	bc,#_prota + 1
   893F 0A            [ 7] 3966 	ld	a,(bc)
   8940 3C            [ 4] 3967 	inc	a
   8941 02            [ 7] 3968 	ld	(bc),a
                           3969 ;src/main.c:789: prota.y++;
   8942 3C            [ 4] 3970 	inc	a
   8943 02            [ 7] 3971 	ld	(bc),a
                           3972 ;src/main.c:790: prota.mover  = SI;
   8944 21 0C 6A      [10] 3973 	ld	hl,#(_prota + 0x0006)
   8947 36 01         [10] 3974 	ld	(hl),#0x01
                           3975 ;src/main.c:791: prota.sprite = g_hero_down;
   8949 21 92 3C      [10] 3976 	ld	hl,#_g_hero_down
   894C 22 0A 6A      [16] 3977 	ld	((_prota + 0x0004)), hl
   894F C9            [10] 3978 	ret
                           3979 ;src/main.c:798: void intHandler() {
                           3980 ;	---------------------------------
                           3981 ; Function intHandler
                           3982 ; ---------------------------------
   8950                    3983 _intHandler::
                           3984 ;src/main.c:799: if (++i == 6) {
   8950 21 18 6A      [10] 3985 	ld	hl, #_i+0
   8953 34            [11] 3986 	inc	(hl)
   8954 3A 18 6A      [13] 3987 	ld	a,(#_i + 0)
   8957 D6 06         [ 7] 3988 	sub	a, #0x06
   8959 C0            [11] 3989 	ret	NZ
                           3990 ;src/main.c:800: play();
   895A CD C2 57      [17] 3991 	call	_play
                           3992 ;src/main.c:801: i=0;
   895D 21 18 6A      [10] 3993 	ld	hl,#_i + 0
   8960 36 00         [10] 3994 	ld	(hl), #0x00
   8962 C9            [10] 3995 	ret
                           3996 ;src/main.c:805: void inicializarCPC() {
                           3997 ;	---------------------------------
                           3998 ; Function inicializarCPC
                           3999 ; ---------------------------------
   8963                    4000 _inicializarCPC::
                           4001 ;src/main.c:806: cpct_disableFirmware();
   8963 CD 69 5B      [17] 4002 	call	_cpct_disableFirmware
                           4003 ;src/main.c:807: cpct_setVideoMode(0);
   8966 2E 00         [ 7] 4004 	ld	l,#0x00
   8968 CD 3D 5B      [17] 4005 	call	_cpct_setVideoMode
                           4006 ;src/main.c:808: cpct_setBorder(HW_BLACK);
   896B 21 10 14      [10] 4007 	ld	hl,#0x1410
   896E E5            [11] 4008 	push	hl
   896F CD A0 58      [17] 4009 	call	_cpct_setPALColour
                           4010 ;src/main.c:809: cpct_setPalette(g_palette, 16);
   8972 21 10 00      [10] 4011 	ld	hl,#0x0010
   8975 E5            [11] 4012 	push	hl
   8976 21 60 3E      [10] 4013 	ld	hl,#_g_palette
   8979 E5            [11] 4014 	push	hl
   897A CD 7D 58      [17] 4015 	call	_cpct_setPalette
   897D C9            [10] 4016 	ret
                           4017 ;src/main.c:814: void inicializarJuego() {
                           4018 ;	---------------------------------
                           4019 ; Function inicializarJuego
                           4020 ; ---------------------------------
   897E                    4021 _inicializarJuego::
                           4022 ;src/main.c:816: num_mapa = 0;
   897E 21 C0 72      [10] 4023 	ld	hl,#_num_mapa + 0
   8981 36 00         [10] 4024 	ld	(hl), #0x00
                           4025 ;src/main.c:817: mapa = mapas[num_mapa];
   8983 21 DE 72      [10] 4026 	ld	hl, #_mapas + 0
   8986 7E            [ 7] 4027 	ld	a,(hl)
   8987 FD 21 BE 72   [14] 4028 	ld	iy,#_mapa
   898B FD 77 00      [19] 4029 	ld	0 (iy),a
   898E 23            [ 6] 4030 	inc	hl
   898F 7E            [ 7] 4031 	ld	a,(hl)
   8990 32 BF 72      [13] 4032 	ld	(#_mapa + 1),a
                           4033 ;src/main.c:818: cpct_etm_setTileset2x4(g_tileset);
   8993 21 E0 17      [10] 4034 	ld	hl,#_g_tileset
   8996 CD 91 5A      [17] 4035 	call	_cpct_etm_setTileset2x4
                           4036 ;src/main.c:820: dibujarMapa();
   8999 CD C8 72      [17] 4037 	call	_dibujarMapa
                           4038 ;src/main.c:823: barraPuntuacionInicial();
   899C CD CE 55      [17] 4039 	call	_barraPuntuacionInicial
                           4040 ;src/main.c:826: prota.x = prota.px = 4;
   899F 21 08 6A      [10] 4041 	ld	hl,#(_prota + 0x0002)
   89A2 36 04         [10] 4042 	ld	(hl),#0x04
   89A4 21 06 6A      [10] 4043 	ld	hl,#_prota
   89A7 36 04         [10] 4044 	ld	(hl),#0x04
                           4045 ;src/main.c:827: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   89A9 21 09 6A      [10] 4046 	ld	hl,#(_prota + 0x0003)
   89AC 36 68         [10] 4047 	ld	(hl),#0x68
   89AE 21 07 6A      [10] 4048 	ld	hl,#(_prota + 0x0001)
   89B1 36 68         [10] 4049 	ld	(hl),#0x68
                           4050 ;src/main.c:828: prota.mover  = NO;
   89B3 21 0C 6A      [10] 4051 	ld	hl,#(_prota + 0x0006)
   89B6 36 00         [10] 4052 	ld	(hl),#0x00
                           4053 ;src/main.c:829: prota.mira=M_derecha;
   89B8 21 0D 6A      [10] 4054 	ld	hl,#(_prota + 0x0007)
   89BB 36 00         [10] 4055 	ld	(hl),#0x00
                           4056 ;src/main.c:830: prota.sprite = g_hero;
   89BD 21 70 3E      [10] 4057 	ld	hl,#_g_hero
   89C0 22 0A 6A      [16] 4058 	ld	((_prota + 0x0004)), hl
                           4059 ;src/main.c:834: cu.x = cu.px = 0;
   89C3 21 10 6A      [10] 4060 	ld	hl,#(_cu + 0x0002)
   89C6 36 00         [10] 4061 	ld	(hl),#0x00
   89C8 21 0E 6A      [10] 4062 	ld	hl,#_cu
   89CB 36 00         [10] 4063 	ld	(hl),#0x00
                           4064 ;src/main.c:835: cu.y = cu.py = 0;
   89CD 21 11 6A      [10] 4065 	ld	hl,#(_cu + 0x0003)
   89D0 36 00         [10] 4066 	ld	(hl),#0x00
   89D2 21 0F 6A      [10] 4067 	ld	hl,#(_cu + 0x0001)
   89D5 36 00         [10] 4068 	ld	(hl),#0x00
                           4069 ;src/main.c:836: cu.lanzado = NO;
   89D7 21 14 6A      [10] 4070 	ld	hl,#(_cu + 0x0006)
   89DA 36 00         [10] 4071 	ld	(hl),#0x00
                           4072 ;src/main.c:837: cu.mover = NO;
   89DC 21 17 6A      [10] 4073 	ld	hl,#(_cu + 0x0009)
   89DF 36 00         [10] 4074 	ld	(hl),#0x00
                           4075 ;src/main.c:839: inicializarEnemy();
   89E1 CD 5A 87      [17] 4076 	call	_inicializarEnemy
                           4077 ;src/main.c:841: dibujarProta();
   89E4 C3 16 73      [10] 4078 	jp  _dibujarProta
                           4079 ;src/main.c:844: void main(void) {
                           4080 ;	---------------------------------
                           4081 ; Function main
                           4082 ; ---------------------------------
   89E7                    4083 _main::
   89E7 DD E5         [15] 4084 	push	ix
   89E9 DD 21 00 00   [14] 4085 	ld	ix,#0
   89ED DD 39         [15] 4086 	add	ix,sp
   89EF 3B            [ 6] 4087 	dec	sp
                           4088 ;src/main.c:849: inicializarCPC();
   89F0 CD 63 89      [17] 4089 	call	_inicializarCPC
                           4090 ;src/main.c:851: menuInicio();
   89F3 CD EF 54      [17] 4091 	call	_menuInicio
                           4092 ;src/main.c:853: inicializarJuego();
   89F6 CD 7E 89      [17] 4093 	call	_inicializarJuego
                           4094 ;src/main.c:857: while (1) {
   89F9                    4095 00119$:
                           4096 ;src/main.c:859: i = (2 + num_mapa) + 1;
   89F9 3A C0 72      [13] 4097 	ld	a,(#_num_mapa + 0)
   89FC C6 03         [ 7] 4098 	add	a, #0x03
   89FE DD 77 FF      [19] 4099 	ld	-1 (ix),a
                           4100 ;src/main.c:860: actual = enemy;
                           4101 ;src/main.c:862: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   8A01 21 00 01      [10] 4102 	ld	hl,#_g_tablatrans
   8A04 E5            [11] 4103 	push	hl
   8A05 2A BE 72      [16] 4104 	ld	hl,(_mapa)
   8A08 E5            [11] 4105 	push	hl
   8A09 21 06 6A      [10] 4106 	ld	hl,#_prota
   8A0C E5            [11] 4107 	push	hl
   8A0D 21 0E 6A      [10] 4108 	ld	hl,#_cu
   8A10 E5            [11] 4109 	push	hl
   8A11 CD C4 73      [17] 4110 	call	_comprobarTeclado
   8A14 21 08 00      [10] 4111 	ld	hl,#8
   8A17 39            [11] 4112 	add	hl,sp
   8A18 F9            [ 6] 4113 	ld	sp,hl
                           4114 ;src/main.c:863: moverCuchillo(&cu, mapa);
   8A19 2A BE 72      [16] 4115 	ld	hl,(_mapa)
   8A1C E5            [11] 4116 	push	hl
   8A1D 21 0E 6A      [10] 4117 	ld	hl,#_cu
   8A20 E5            [11] 4118 	push	hl
   8A21 CD BB 4E      [17] 4119 	call	_moverCuchillo
   8A24 F1            [10] 4120 	pop	af
   8A25 F1            [10] 4121 	pop	af
                           4122 ;src/main.c:864: updateEnemies();
   8A26 CD 24 86      [17] 4123 	call	_updateEnemies
                           4124 ;src/main.c:866: cpct_waitVSYNC();
   8A29 CD 35 5B      [17] 4125 	call	_cpct_waitVSYNC
                           4126 ;src/main.c:869: if (prota.mover) {
   8A2C 01 0C 6A      [10] 4127 	ld	bc,#_prota + 6
   8A2F 0A            [ 7] 4128 	ld	a,(bc)
   8A30 B7            [ 4] 4129 	or	a, a
   8A31 28 07         [12] 4130 	jr	Z,00102$
                           4131 ;src/main.c:870: redibujarProta();
   8A33 C5            [11] 4132 	push	bc
   8A34 CD B0 73      [17] 4133 	call	_redibujarProta
   8A37 C1            [10] 4134 	pop	bc
                           4135 ;src/main.c:871: prota.mover = NO;
   8A38 AF            [ 4] 4136 	xor	a, a
   8A39 02            [ 7] 4137 	ld	(bc),a
   8A3A                    4138 00102$:
                           4139 ;src/main.c:873: if(cu.lanzado && cu.mover){
   8A3A 21 14 6A      [10] 4140 	ld	hl, #(_cu + 0x0006) + 0
   8A3D 4E            [ 7] 4141 	ld	c,(hl)
                           4142 ;src/main.c:874: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4143 ;src/main.c:873: if(cu.lanzado && cu.mover){
   8A3E 79            [ 4] 4144 	ld	a,c
   8A3F B7            [ 4] 4145 	or	a, a
   8A40 28 30         [12] 4146 	jr	Z,00107$
   8A42 3A 17 6A      [13] 4147 	ld	a, (#(_cu + 0x0009) + 0)
   8A45 B7            [ 4] 4148 	or	a, a
   8A46 28 2A         [12] 4149 	jr	Z,00107$
                           4150 ;src/main.c:874: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   8A48 21 0F 6A      [10] 4151 	ld	hl, #(_cu + 0x0001) + 0
   8A4B 4E            [ 7] 4152 	ld	c,(hl)
   8A4C 21 0E 6A      [10] 4153 	ld	hl, #_cu + 0
   8A4F 46            [ 7] 4154 	ld	b,(hl)
   8A50 21 16 6A      [10] 4155 	ld	hl, #(_cu + 0x0008) + 0
   8A53 5E            [ 7] 4156 	ld	e,(hl)
   8A54 2A BE 72      [16] 4157 	ld	hl,(_mapa)
   8A57 E5            [11] 4158 	push	hl
   8A58 21 00 01      [10] 4159 	ld	hl,#_g_tablatrans
   8A5B E5            [11] 4160 	push	hl
   8A5C 21 0E 6A      [10] 4161 	ld	hl,#_cu
   8A5F E5            [11] 4162 	push	hl
   8A60 79            [ 4] 4163 	ld	a,c
   8A61 F5            [11] 4164 	push	af
   8A62 33            [ 6] 4165 	inc	sp
   8A63 C5            [11] 4166 	push	bc
   8A64 33            [ 6] 4167 	inc	sp
   8A65 7B            [ 4] 4168 	ld	a,e
   8A66 F5            [11] 4169 	push	af
   8A67 33            [ 6] 4170 	inc	sp
   8A68 CD 00 4C      [17] 4171 	call	_redibujarCuchillo
   8A6B 21 09 00      [10] 4172 	ld	hl,#9
   8A6E 39            [11] 4173 	add	hl,sp
   8A6F F9            [ 6] 4174 	ld	sp,hl
   8A70 18 28         [12] 4175 	jr	00132$
   8A72                    4176 00107$:
                           4177 ;src/main.c:875: }else if (cu.lanzado && !cu.mover){
   8A72 79            [ 4] 4178 	ld	a,c
   8A73 B7            [ 4] 4179 	or	a, a
   8A74 28 24         [12] 4180 	jr	Z,00132$
   8A76 3A 17 6A      [13] 4181 	ld	a, (#(_cu + 0x0009) + 0)
   8A79 B7            [ 4] 4182 	or	a, a
   8A7A 20 1E         [12] 4183 	jr	NZ,00132$
                           4184 ;src/main.c:876: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   8A7C 21 0F 6A      [10] 4185 	ld	hl, #(_cu + 0x0001) + 0
   8A7F 46            [ 7] 4186 	ld	b,(hl)
   8A80 21 0E 6A      [10] 4187 	ld	hl, #_cu + 0
   8A83 4E            [ 7] 4188 	ld	c,(hl)
   8A84 21 16 6A      [10] 4189 	ld	hl, #(_cu + 0x0008) + 0
   8A87 56            [ 7] 4190 	ld	d,(hl)
   8A88 2A BE 72      [16] 4191 	ld	hl,(_mapa)
   8A8B E5            [11] 4192 	push	hl
   8A8C C5            [11] 4193 	push	bc
   8A8D D5            [11] 4194 	push	de
   8A8E 33            [ 6] 4195 	inc	sp
   8A8F CD 6D 4B      [17] 4196 	call	_borrarCuchillo
   8A92 F1            [10] 4197 	pop	af
   8A93 F1            [10] 4198 	pop	af
   8A94 33            [ 6] 4199 	inc	sp
                           4200 ;src/main.c:877: cu.lanzado = NO;
   8A95 21 14 6A      [10] 4201 	ld	hl,#(_cu + 0x0006)
   8A98 36 00         [10] 4202 	ld	(hl),#0x00
                           4203 ;src/main.c:880: while(--i){
   8A9A                    4204 00132$:
   8A9A 01 EE 64      [10] 4205 	ld	bc,#_enemy
   8A9D                    4206 00115$:
   8A9D DD 35 FF      [23] 4207 	dec	-1 (ix)
   8AA0 DD 7E FF      [19] 4208 	ld	a, -1 (ix)
   8AA3 B7            [ 4] 4209 	or	a, a
   8AA4 28 71         [12] 4210 	jr	Z,00117$
                           4211 ;src/main.c:881: if(actual->mover){
   8AA6 C5            [11] 4212 	push	bc
   8AA7 FD E1         [14] 4213 	pop	iy
   8AA9 FD 7E 06      [19] 4214 	ld	a,6 (iy)
   8AAC B7            [ 4] 4215 	or	a, a
   8AAD 28 07         [12] 4216 	jr	Z,00111$
                           4217 ;src/main.c:882: redibujarEnemigo(actual);
   8AAF C5            [11] 4218 	push	bc
   8AB0 C5            [11] 4219 	push	bc
   8AB1 CD 14 77      [17] 4220 	call	_redibujarEnemigo
   8AB4 F1            [10] 4221 	pop	af
   8AB5 C1            [10] 4222 	pop	bc
   8AB6                    4223 00111$:
                           4224 ;src/main.c:884: if (actual->muerto && actual->muertes == 0){
   8AB6 C5            [11] 4225 	push	bc
   8AB7 FD E1         [14] 4226 	pop	iy
   8AB9 FD 7E 08      [19] 4227 	ld	a,8 (iy)
   8ABC B7            [ 4] 4228 	or	a, a
   8ABD 28 50         [12] 4229 	jr	Z,00113$
   8ABF 21 0A 00      [10] 4230 	ld	hl,#0x000A
   8AC2 09            [11] 4231 	add	hl,bc
   8AC3 EB            [ 4] 4232 	ex	de,hl
   8AC4 1A            [ 7] 4233 	ld	a,(de)
   8AC5 B7            [ 4] 4234 	or	a, a
   8AC6 20 47         [12] 4235 	jr	NZ,00113$
                           4236 ;src/main.c:885: borrarEnemigo(actual);
   8AC8 C5            [11] 4237 	push	bc
   8AC9 D5            [11] 4238 	push	de
   8ACA C5            [11] 4239 	push	bc
   8ACB CD 80 76      [17] 4240 	call	_borrarEnemigo
   8ACE F1            [10] 4241 	pop	af
   8ACF D1            [10] 4242 	pop	de
   8AD0 C1            [10] 4243 	pop	bc
                           4244 ;src/main.c:886: dibujarExplosion(actual);
   8AD1 C5            [11] 4245 	push	bc
   8AD2 D5            [11] 4246 	push	de
   8AD3 C5            [11] 4247 	push	bc
   8AD4 CD D8 75      [17] 4248 	call	_dibujarExplosion
   8AD7 F1            [10] 4249 	pop	af
   8AD8 D1            [10] 4250 	pop	de
   8AD9 C1            [10] 4251 	pop	bc
                           4252 ;src/main.c:887: puntuacion_aux = puntuacion;
   8ADA FD 21 C1 72   [14] 4253 	ld	iy,#_puntuacion
   8ADE FD 6E 00      [19] 4254 	ld	l,0 (iy)
   8AE1 26 00         [ 7] 4255 	ld	h,#0x00
                           4256 ;src/main.c:888: puntuacion = aumentarPuntuacion(puntuacion_aux);
   8AE3 C5            [11] 4257 	push	bc
   8AE4 D5            [11] 4258 	push	de
   8AE5 E5            [11] 4259 	push	hl
   8AE6 CD A7 57      [17] 4260 	call	_aumentarPuntuacion
   8AE9 F1            [10] 4261 	pop	af
   8AEA D1            [10] 4262 	pop	de
   8AEB C1            [10] 4263 	pop	bc
   8AEC FD 21 C1 72   [14] 4264 	ld	iy,#_puntuacion
   8AF0 FD 75 00      [19] 4265 	ld	0 (iy),l
                           4266 ;src/main.c:889: modificarPuntuacion(puntuacion);
   8AF3 FD 21 C1 72   [14] 4267 	ld	iy,#_puntuacion
   8AF7 FD 6E 00      [19] 4268 	ld	l,0 (iy)
   8AFA 26 00         [ 7] 4269 	ld	h,#0x00
   8AFC C5            [11] 4270 	push	bc
   8AFD D5            [11] 4271 	push	de
   8AFE E5            [11] 4272 	push	hl
   8AFF CD 6A 56      [17] 4273 	call	_modificarPuntuacion
   8B02 F1            [10] 4274 	pop	af
   8B03 D1            [10] 4275 	pop	de
   8B04 C1            [10] 4276 	pop	bc
                           4277 ;src/main.c:891: actual->muertes++;
   8B05 1A            [ 7] 4278 	ld	a,(de)
   8B06 3C            [ 4] 4279 	inc	a
   8B07 12            [ 7] 4280 	ld	(de),a
                           4281 ;src/main.c:892: actual->x = 0;
   8B08 AF            [ 4] 4282 	xor	a, a
   8B09 02            [ 7] 4283 	ld	(bc),a
                           4284 ;src/main.c:893: actual->y = 0;
   8B0A 59            [ 4] 4285 	ld	e, c
   8B0B 50            [ 4] 4286 	ld	d, b
   8B0C 13            [ 6] 4287 	inc	de
   8B0D AF            [ 4] 4288 	xor	a, a
   8B0E 12            [ 7] 4289 	ld	(de),a
   8B0F                    4290 00113$:
                           4291 ;src/main.c:895: ++actual;
   8B0F 21 46 01      [10] 4292 	ld	hl,#0x0146
   8B12 09            [11] 4293 	add	hl,bc
   8B13 4D            [ 4] 4294 	ld	c,l
   8B14 44            [ 4] 4295 	ld	b,h
   8B15 18 86         [12] 4296 	jr	00115$
   8B17                    4297 00117$:
                           4298 ;src/main.c:897: cpct_waitVSYNC();
   8B17 CD 35 5B      [17] 4299 	call	_cpct_waitVSYNC
   8B1A C3 F9 89      [10] 4300 	jp	00119$
   8B1D 33            [ 6] 4301 	inc	sp
   8B1E DD E1         [14] 4302 	pop	ix
   8B20 C9            [10] 4303 	ret
                           4304 	.area _CODE
                           4305 	.area _INITIALIZER
   72C3                    4306 __xinit__mapa:
   72C3 00 00              4307 	.dw #0x0000
   72C5                    4308 __xinit__num_mapa:
   72C5 00                 4309 	.db #0x00	; 0
   72C6                    4310 __xinit__puntuacion:
   72C6 00                 4311 	.db #0x00	; 0
   72C7                    4312 __xinit__vidas:
   72C7 05                 4313 	.db #0x05	; 5
                           4314 	.area _CABS (ABS)
