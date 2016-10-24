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
                             78 	.globl _spawnY
                             79 	.globl _spawnX
                             80 	.globl _mapas
                             81 ;--------------------------------------------------------
                             82 ; special function registers
                             83 ;--------------------------------------------------------
                             84 ;--------------------------------------------------------
                             85 ; ram data
                             86 ;--------------------------------------------------------
                             87 	.area _DATA
   64FE                      88 _enemy::
   64FE                      89 	.ds 1304
   6A16                      90 _prota::
   6A16                      91 	.ds 8
   6A1E                      92 _cu::
   6A1E                      93 	.ds 10
   6A28                      94 _i::
   6A28                      95 	.ds 1
                             96 ;--------------------------------------------------------
                             97 ; ram data
                             98 ;--------------------------------------------------------
                             99 	.area _INITIALIZED
   72CE                     100 _mapa::
   72CE                     101 	.ds 2
   72D0                     102 _num_mapa::
   72D0                     103 	.ds 1
   72D1                     104 _puntuacion::
   72D1                     105 	.ds 1
   72D2                     106 _vidas::
   72D2                     107 	.ds 1
                            108 ;--------------------------------------------------------
                            109 ; absolute external ram data
                            110 ;--------------------------------------------------------
                            111 	.area _DABS (ABS)
                            112 ;--------------------------------------------------------
                            113 ; global & static initialisations
                            114 ;--------------------------------------------------------
                            115 	.area _HOME
                            116 	.area _GSINIT
                            117 	.area _GSFINAL
                            118 	.area _GSINIT
                            119 ;--------------------------------------------------------
                            120 ; Home
                            121 ;--------------------------------------------------------
                            122 	.area _HOME
                            123 	.area _HOME
                            124 ;--------------------------------------------------------
                            125 ; code
                            126 ;--------------------------------------------------------
                            127 	.area _CODE
                            128 ;src/main.c:93: cpctm_createTransparentMaskTable(g_tablatrans, 0x0100, M0, 0);
                            129 ;	---------------------------------
                            130 ; Function dummy_cpct_transparentMaskTable0M0_container
                            131 ; ---------------------------------
   43EF                     132 _dummy_cpct_transparentMaskTable0M0_container::
                            133 	.area _g_tablatrans_ (ABS) 
   0100                     134 	.org 0x0100 
   0100                     135 	 _g_tablatrans::
   0100 FF AA 55 00 AA AA   136 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0108 55 00 55 00 00 00   137 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0110 AA AA 00 00 AA AA   138 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0118 00 00 00 00 00 00   139 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0120 55 00 55 00 00 00   140 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0128 55 00 55 00 00 00   141 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0130 00 00 00 00 00 00   142 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0138 00 00 00 00 00 00   143 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0140 AA AA 00 00 AA AA   144 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0148 00 00 00 00 00 00   145 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0150 AA AA 00 00 AA AA   146 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0158 00 00 00 00 00 00   147 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0160 00 00 00 00 00 00   148 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0168 00 00 00 00 00 00   149 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0170 00 00 00 00 00 00   150 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0178 00 00 00 00 00 00   151 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0180 55 00 55 00 00 00   152 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0188 55 00 55 00 00 00   153 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0190 00 00 00 00 00 00   154 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0198 00 00 00 00 00 00   155 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A0 55 00 55 00 00 00   156 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A8 55 00 55 00 00 00   157 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B0 00 00 00 00 00 00   158 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B8 00 00 00 00 00 00   159 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C0 00 00 00 00 00 00   160 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C8 00 00 00 00 00 00   161 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D0 00 00 00 00 00 00   162 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D8 00 00 00 00 00 00   163 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E0 00 00 00 00 00 00   164 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E8 00 00 00 00 00 00   165 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F0 00 00 00 00 00 00   166 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F8 00 00 00 00 00 00   167 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            168 	.area _CSEG (REL, CON) 
                            169 ;src/main.c:96: void dibujarMapa() {
                            170 ;	---------------------------------
                            171 ; Function dibujarMapa
                            172 ; ---------------------------------
   72D8                     173 _dibujarMapa::
                            174 ;src/main.c:99: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, p, mapa);
   72D8 2A CE 72      [16]  175 	ld	hl,(_mapa)
   72DB E5            [11]  176 	push	hl
   72DC 21 F0 C0      [10]  177 	ld	hl,#0xC0F0
   72DF E5            [11]  178 	push	hl
   72E0 21 2C 28      [10]  179 	ld	hl,#0x282C
   72E3 E5            [11]  180 	push	hl
   72E4 2E 00         [ 7]  181 	ld	l, #0x00
   72E6 E5            [11]  182 	push	hl
   72E7 AF            [ 4]  183 	xor	a, a
   72E8 F5            [11]  184 	push	af
   72E9 33            [ 6]  185 	inc	sp
   72EA CD 85 59      [17]  186 	call	_cpct_etm_drawTileBox2x4
   72ED C9            [10]  187 	ret
   72EE                     188 _mapas:
   72EE C0 10               189 	.dw _g_map1
   72F0 E0 09               190 	.dw _g_map2
   72F2 00 03               191 	.dw _g_map3
   72F4                     192 _spawnX:
   72F4 00                  193 	.db #0x00	; 0
   72F5 28                  194 	.db #0x28	; 40
   72F6 47                  195 	.db #0x47	; 71	'G'
   72F7 14                  196 	.db #0x14	; 20
   72F8 3C                  197 	.db #0x3C	; 60
   72F9                     198 _spawnY:
   72F9 00                  199 	.db #0x00	; 0
   72FA 2C                  200 	.db #0x2C	; 44
   72FB 72                  201 	.db #0x72	; 114	'r'
   72FC 8A                  202 	.db #0x8A	; 138
   72FD 8A                  203 	.db #0x8A	; 138
                            204 ;src/main.c:102: void dibujarProta() {
                            205 ;	---------------------------------
                            206 ; Function dibujarProta
                            207 ; ---------------------------------
   72FE                     208 _dibujarProta::
                            209 ;src/main.c:103: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   72FE 21 17 6A      [10]  210 	ld	hl, #_prota + 1
   7301 56            [ 7]  211 	ld	d,(hl)
   7302 21 16 6A      [10]  212 	ld	hl, #_prota + 0
   7305 46            [ 7]  213 	ld	b,(hl)
   7306 D5            [11]  214 	push	de
   7307 33            [ 6]  215 	inc	sp
   7308 C5            [11]  216 	push	bc
   7309 33            [ 6]  217 	inc	sp
   730A 21 00 C0      [10]  218 	ld	hl,#0xC000
   730D E5            [11]  219 	push	hl
   730E CD A3 64      [17]  220 	call	_cpct_getScreenPtr
   7311 EB            [ 4]  221 	ex	de,hl
                            222 ;src/main.c:104: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   7312 ED 4B 1A 6A   [20]  223 	ld	bc, (#_prota + 4)
   7316 21 00 01      [10]  224 	ld	hl,#_g_tablatrans
   7319 E5            [11]  225 	push	hl
   731A 21 07 16      [10]  226 	ld	hl,#0x1607
   731D E5            [11]  227 	push	hl
   731E D5            [11]  228 	push	de
   731F C5            [11]  229 	push	bc
   7320 CD C3 64      [17]  230 	call	_cpct_drawSpriteMaskedAlignedTable
   7323 C9            [10]  231 	ret
                            232 ;src/main.c:107: void borrarProta() {
                            233 ;	---------------------------------
                            234 ; Function borrarProta
                            235 ; ---------------------------------
   7324                     236 _borrarProta::
   7324 DD E5         [15]  237 	push	ix
   7326 DD 21 00 00   [14]  238 	ld	ix,#0
   732A DD 39         [15]  239 	add	ix,sp
   732C F5            [11]  240 	push	af
   732D 3B            [ 6]  241 	dec	sp
                            242 ;src/main.c:111: u8 w = 4 + (prota.px & 1);
   732E 21 18 6A      [10]  243 	ld	hl, #_prota + 2
   7331 4E            [ 7]  244 	ld	c,(hl)
   7332 79            [ 4]  245 	ld	a,c
   7333 E6 01         [ 7]  246 	and	a, #0x01
   7335 47            [ 4]  247 	ld	b,a
   7336 04            [ 4]  248 	inc	b
   7337 04            [ 4]  249 	inc	b
   7338 04            [ 4]  250 	inc	b
   7339 04            [ 4]  251 	inc	b
                            252 ;src/main.c:114: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   733A 21 19 6A      [10]  253 	ld	hl, #_prota + 3
   733D 5E            [ 7]  254 	ld	e,(hl)
   733E CB 4B         [ 8]  255 	bit	1, e
   7340 28 04         [12]  256 	jr	Z,00103$
   7342 3E 01         [ 7]  257 	ld	a,#0x01
   7344 18 02         [12]  258 	jr	00104$
   7346                     259 00103$:
   7346 3E 00         [ 7]  260 	ld	a,#0x00
   7348                     261 00104$:
   7348 C6 06         [ 7]  262 	add	a, #0x06
   734A DD 77 FD      [19]  263 	ld	-3 (ix),a
                            264 ;src/main.c:116: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   734D FD 2A CE 72   [20]  265 	ld	iy,(_mapa)
   7351 16 00         [ 7]  266 	ld	d,#0x00
   7353 7B            [ 4]  267 	ld	a,e
   7354 C6 E8         [ 7]  268 	add	a,#0xE8
   7356 DD 77 FE      [19]  269 	ld	-2 (ix),a
   7359 7A            [ 4]  270 	ld	a,d
   735A CE FF         [ 7]  271 	adc	a,#0xFF
   735C DD 77 FF      [19]  272 	ld	-1 (ix),a
   735F DD 6E FE      [19]  273 	ld	l,-2 (ix)
   7362 DD 66 FF      [19]  274 	ld	h,-1 (ix)
   7365 DD CB FF 7E   [20]  275 	bit	7, -1 (ix)
   7369 28 04         [12]  276 	jr	Z,00105$
   736B 21 EB FF      [10]  277 	ld	hl,#0xFFEB
   736E 19            [11]  278 	add	hl,de
   736F                     279 00105$:
   736F CB 2C         [ 8]  280 	sra	h
   7371 CB 1D         [ 8]  281 	rr	l
   7373 CB 2C         [ 8]  282 	sra	h
   7375 CB 1D         [ 8]  283 	rr	l
   7377 55            [ 4]  284 	ld	d,l
   7378 CB 39         [ 8]  285 	srl	c
   737A FD E5         [15]  286 	push	iy
   737C 21 F0 C0      [10]  287 	ld	hl,#0xC0F0
   737F E5            [11]  288 	push	hl
   7380 3E 28         [ 7]  289 	ld	a,#0x28
   7382 F5            [11]  290 	push	af
   7383 33            [ 6]  291 	inc	sp
   7384 DD 7E FD      [19]  292 	ld	a,-3 (ix)
   7387 F5            [11]  293 	push	af
   7388 33            [ 6]  294 	inc	sp
   7389 C5            [11]  295 	push	bc
   738A 33            [ 6]  296 	inc	sp
   738B D5            [11]  297 	push	de
   738C 33            [ 6]  298 	inc	sp
   738D 79            [ 4]  299 	ld	a,c
   738E F5            [11]  300 	push	af
   738F 33            [ 6]  301 	inc	sp
   7390 CD 85 59      [17]  302 	call	_cpct_etm_drawTileBox2x4
   7393 DD F9         [10]  303 	ld	sp, ix
   7395 DD E1         [14]  304 	pop	ix
   7397 C9            [10]  305 	ret
                            306 ;src/main.c:119: void redibujarProta() {
                            307 ;	---------------------------------
                            308 ; Function redibujarProta
                            309 ; ---------------------------------
   7398                     310 _redibujarProta::
                            311 ;src/main.c:120: borrarProta();
   7398 CD 24 73      [17]  312 	call	_borrarProta
                            313 ;src/main.c:121: prota.px = prota.x;
   739B 01 18 6A      [10]  314 	ld	bc,#_prota + 2
   739E 3A 16 6A      [13]  315 	ld	a, (#_prota + 0)
   73A1 02            [ 7]  316 	ld	(bc),a
                            317 ;src/main.c:122: prota.py = prota.y;
   73A2 01 19 6A      [10]  318 	ld	bc,#_prota + 3
   73A5 3A 17 6A      [13]  319 	ld	a, (#_prota + 1)
   73A8 02            [ 7]  320 	ld	(bc),a
                            321 ;src/main.c:123: dibujarProta();
   73A9 C3 FE 72      [10]  322 	jp  _dibujarProta
                            323 ;src/main.c:126: void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
                            324 ;	---------------------------------
                            325 ; Function comprobarTeclado
                            326 ; ---------------------------------
   73AC                     327 _comprobarTeclado::
                            328 ;src/main.c:127: cpct_scanKeyboard_if();
   73AC CD DD 5A      [17]  329 	call	_cpct_scanKeyboard_if
                            330 ;src/main.c:129: if (cpct_isAnyKeyPressed()) {
   73AF CD D0 5A      [17]  331 	call	_cpct_isAnyKeyPressed
   73B2 7D            [ 4]  332 	ld	a,l
   73B3 B7            [ 4]  333 	or	a, a
   73B4 C8            [11]  334 	ret	Z
                            335 ;src/main.c:130: if (cpct_isKeyPressed(Key_CursorLeft)){
   73B5 21 01 01      [10]  336 	ld	hl,#0x0101
   73B8 CD A4 58      [17]  337 	call	_cpct_isKeyPressed
   73BB 7D            [ 4]  338 	ld	a,l
   73BC B7            [ 4]  339 	or	a, a
                            340 ;src/main.c:131: moverIzquierda();
   73BD C2 77 88      [10]  341 	jp	NZ,_moverIzquierda
                            342 ;src/main.c:132: }else if (cpct_isKeyPressed(Key_CursorRight)){
   73C0 21 00 02      [10]  343 	ld	hl,#0x0200
   73C3 CD A4 58      [17]  344 	call	_cpct_isKeyPressed
   73C6 7D            [ 4]  345 	ld	a,l
   73C7 B7            [ 4]  346 	or	a, a
                            347 ;src/main.c:133: moverDerecha();
   73C8 C2 9C 88      [10]  348 	jp	NZ,_moverDerecha
                            349 ;src/main.c:134: }else if (cpct_isKeyPressed(Key_CursorUp)){
   73CB 21 00 01      [10]  350 	ld	hl,#0x0100
   73CE CD A4 58      [17]  351 	call	_cpct_isKeyPressed
   73D1 7D            [ 4]  352 	ld	a,l
   73D2 B7            [ 4]  353 	or	a, a
                            354 ;src/main.c:135: moverArriba();
   73D3 C2 E1 88      [10]  355 	jp	NZ,_moverArriba
                            356 ;src/main.c:136: }else if (cpct_isKeyPressed(Key_CursorDown)){
   73D6 21 00 04      [10]  357 	ld	hl,#0x0400
   73D9 CD A4 58      [17]  358 	call	_cpct_isKeyPressed
   73DC 7D            [ 4]  359 	ld	a,l
   73DD B7            [ 4]  360 	or	a, a
                            361 ;src/main.c:137: moverAbajo();
   73DE C2 05 89      [10]  362 	jp	NZ,_moverAbajo
                            363 ;src/main.c:138: }else if (cpct_isKeyPressed(Key_Space)){
   73E1 21 05 80      [10]  364 	ld	hl,#0x8005
   73E4 CD A4 58      [17]  365 	call	_cpct_isKeyPressed
   73E7 7D            [ 4]  366 	ld	a,l
   73E8 B7            [ 4]  367 	or	a, a
   73E9 C8            [11]  368 	ret	Z
                            369 ;src/main.c:139: lanzarCuchillo(cu, prota, mapa, g_tablatrans);
   73EA 21 08 00      [10]  370 	ld	hl, #8
   73ED 39            [11]  371 	add	hl, sp
   73EE 4E            [ 7]  372 	ld	c, (hl)
   73EF 23            [ 6]  373 	inc	hl
   73F0 46            [ 7]  374 	ld	b, (hl)
   73F1 C5            [11]  375 	push	bc
   73F2 21 08 00      [10]  376 	ld	hl, #8
   73F5 39            [11]  377 	add	hl, sp
   73F6 4E            [ 7]  378 	ld	c, (hl)
   73F7 23            [ 6]  379 	inc	hl
   73F8 46            [ 7]  380 	ld	b, (hl)
   73F9 C5            [11]  381 	push	bc
   73FA 21 08 00      [10]  382 	ld	hl, #8
   73FD 39            [11]  383 	add	hl, sp
   73FE 4E            [ 7]  384 	ld	c, (hl)
   73FF 23            [ 6]  385 	inc	hl
   7400 46            [ 7]  386 	ld	b, (hl)
   7401 C5            [11]  387 	push	bc
   7402 21 08 00      [10]  388 	ld	hl, #8
   7405 39            [11]  389 	add	hl, sp
   7406 4E            [ 7]  390 	ld	c, (hl)
   7407 23            [ 6]  391 	inc	hl
   7408 46            [ 7]  392 	ld	b, (hl)
   7409 C5            [11]  393 	push	bc
   740A CD 6C 40      [17]  394 	call	_lanzarCuchillo
   740D 21 08 00      [10]  395 	ld	hl,#8
   7410 39            [11]  396 	add	hl,sp
   7411 F9            [ 6]  397 	ld	sp,hl
   7412 C9            [10]  398 	ret
                            399 ;src/main.c:144: u8 checkCollision(u8 direction) { // check optimization
                            400 ;	---------------------------------
                            401 ; Function checkCollision
                            402 ; ---------------------------------
   7413                     403 _checkCollision::
   7413 DD E5         [15]  404 	push	ix
   7415 DD 21 00 00   [14]  405 	ld	ix,#0
   7419 DD 39         [15]  406 	add	ix,sp
   741B F5            [11]  407 	push	af
                            408 ;src/main.c:145: u8 *headTile=0, *feetTile=0, *waistTile=0;
   741C 21 00 00      [10]  409 	ld	hl,#0x0000
   741F E3            [19]  410 	ex	(sp), hl
   7420 11 00 00      [10]  411 	ld	de,#0x0000
   7423 01 00 00      [10]  412 	ld	bc,#0x0000
                            413 ;src/main.c:147: switch (direction) {
   7426 3E 03         [ 7]  414 	ld	a,#0x03
   7428 DD 96 04      [19]  415 	sub	a, 4 (ix)
   742B DA 67 75      [10]  416 	jp	C,00105$
   742E DD 5E 04      [19]  417 	ld	e,4 (ix)
   7431 16 00         [ 7]  418 	ld	d,#0x00
   7433 21 3A 74      [10]  419 	ld	hl,#00124$
   7436 19            [11]  420 	add	hl,de
   7437 19            [11]  421 	add	hl,de
   7438 19            [11]  422 	add	hl,de
   7439 E9            [ 4]  423 	jp	(hl)
   743A                     424 00124$:
   743A C3 46 74      [10]  425 	jp	00101$
   743D C3 9F 74      [10]  426 	jp	00102$
   7440 C3 EF 74      [10]  427 	jp	00103$
   7443 C3 2C 75      [10]  428 	jp	00104$
                            429 ;src/main.c:148: case 0:
   7446                     430 00101$:
                            431 ;src/main.c:149: headTile  = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y);
   7446 21 17 6A      [10]  432 	ld	hl, #(_prota + 0x0001) + 0
   7449 4E            [ 7]  433 	ld	c,(hl)
   744A 3A 16 6A      [13]  434 	ld	a, (#_prota + 0)
   744D 47            [ 4]  435 	ld	b,a
   744E 04            [ 4]  436 	inc	b
   744F 04            [ 4]  437 	inc	b
   7450 04            [ 4]  438 	inc	b
   7451 04            [ 4]  439 	inc	b
   7452 79            [ 4]  440 	ld	a,c
   7453 F5            [11]  441 	push	af
   7454 33            [ 6]  442 	inc	sp
   7455 C5            [11]  443 	push	bc
   7456 33            [ 6]  444 	inc	sp
   7457 2A CE 72      [16]  445 	ld	hl,(_mapa)
   745A E5            [11]  446 	push	hl
   745B CD BA 4F      [17]  447 	call	_getTilePtr
   745E F1            [10]  448 	pop	af
   745F F1            [10]  449 	pop	af
   7460 33            [ 6]  450 	inc	sp
   7461 33            [ 6]  451 	inc	sp
   7462 E5            [11]  452 	push	hl
                            453 ;src/main.c:150: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   7463 3A 17 6A      [13]  454 	ld	a, (#(_prota + 0x0001) + 0)
   7466 C6 14         [ 7]  455 	add	a, #0x14
   7468 4F            [ 4]  456 	ld	c,a
   7469 21 16 6A      [10]  457 	ld	hl, #_prota + 0
   746C 46            [ 7]  458 	ld	b,(hl)
   746D 04            [ 4]  459 	inc	b
   746E 04            [ 4]  460 	inc	b
   746F 04            [ 4]  461 	inc	b
   7470 04            [ 4]  462 	inc	b
   7471 79            [ 4]  463 	ld	a,c
   7472 F5            [11]  464 	push	af
   7473 33            [ 6]  465 	inc	sp
   7474 C5            [11]  466 	push	bc
   7475 33            [ 6]  467 	inc	sp
   7476 2A CE 72      [16]  468 	ld	hl,(_mapa)
   7479 E5            [11]  469 	push	hl
   747A CD BA 4F      [17]  470 	call	_getTilePtr
   747D F1            [10]  471 	pop	af
   747E F1            [10]  472 	pop	af
   747F EB            [ 4]  473 	ex	de,hl
                            474 ;src/main.c:151: waistTile = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   7480 3A 17 6A      [13]  475 	ld	a, (#(_prota + 0x0001) + 0)
   7483 C6 0B         [ 7]  476 	add	a, #0x0B
   7485 47            [ 4]  477 	ld	b,a
   7486 3A 16 6A      [13]  478 	ld	a, (#_prota + 0)
   7489 C6 04         [ 7]  479 	add	a, #0x04
   748B D5            [11]  480 	push	de
   748C C5            [11]  481 	push	bc
   748D 33            [ 6]  482 	inc	sp
   748E F5            [11]  483 	push	af
   748F 33            [ 6]  484 	inc	sp
   7490 2A CE 72      [16]  485 	ld	hl,(_mapa)
   7493 E5            [11]  486 	push	hl
   7494 CD BA 4F      [17]  487 	call	_getTilePtr
   7497 F1            [10]  488 	pop	af
   7498 F1            [10]  489 	pop	af
   7499 4D            [ 4]  490 	ld	c,l
   749A 44            [ 4]  491 	ld	b,h
   749B D1            [10]  492 	pop	de
                            493 ;src/main.c:152: break;
   749C C3 67 75      [10]  494 	jp	00105$
                            495 ;src/main.c:153: case 1:
   749F                     496 00102$:
                            497 ;src/main.c:154: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
   749F 21 17 6A      [10]  498 	ld	hl, #(_prota + 0x0001) + 0
   74A2 56            [ 7]  499 	ld	d,(hl)
   74A3 21 16 6A      [10]  500 	ld	hl, #_prota + 0
   74A6 46            [ 7]  501 	ld	b,(hl)
   74A7 05            [ 4]  502 	dec	b
   74A8 D5            [11]  503 	push	de
   74A9 33            [ 6]  504 	inc	sp
   74AA C5            [11]  505 	push	bc
   74AB 33            [ 6]  506 	inc	sp
   74AC 2A CE 72      [16]  507 	ld	hl,(_mapa)
   74AF E5            [11]  508 	push	hl
   74B0 CD BA 4F      [17]  509 	call	_getTilePtr
   74B3 F1            [10]  510 	pop	af
   74B4 F1            [10]  511 	pop	af
   74B5 33            [ 6]  512 	inc	sp
   74B6 33            [ 6]  513 	inc	sp
   74B7 E5            [11]  514 	push	hl
                            515 ;src/main.c:155: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
   74B8 3A 17 6A      [13]  516 	ld	a, (#(_prota + 0x0001) + 0)
   74BB C6 14         [ 7]  517 	add	a, #0x14
   74BD 57            [ 4]  518 	ld	d,a
   74BE 21 16 6A      [10]  519 	ld	hl, #_prota + 0
   74C1 46            [ 7]  520 	ld	b,(hl)
   74C2 05            [ 4]  521 	dec	b
   74C3 D5            [11]  522 	push	de
   74C4 33            [ 6]  523 	inc	sp
   74C5 C5            [11]  524 	push	bc
   74C6 33            [ 6]  525 	inc	sp
   74C7 2A CE 72      [16]  526 	ld	hl,(_mapa)
   74CA E5            [11]  527 	push	hl
   74CB CD BA 4F      [17]  528 	call	_getTilePtr
   74CE F1            [10]  529 	pop	af
   74CF F1            [10]  530 	pop	af
   74D0 EB            [ 4]  531 	ex	de,hl
                            532 ;src/main.c:156: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
   74D1 3A 17 6A      [13]  533 	ld	a, (#(_prota + 0x0001) + 0)
   74D4 C6 0B         [ 7]  534 	add	a, #0x0B
   74D6 47            [ 4]  535 	ld	b,a
   74D7 3A 16 6A      [13]  536 	ld	a, (#_prota + 0)
   74DA C6 FF         [ 7]  537 	add	a,#0xFF
   74DC D5            [11]  538 	push	de
   74DD C5            [11]  539 	push	bc
   74DE 33            [ 6]  540 	inc	sp
   74DF F5            [11]  541 	push	af
   74E0 33            [ 6]  542 	inc	sp
   74E1 2A CE 72      [16]  543 	ld	hl,(_mapa)
   74E4 E5            [11]  544 	push	hl
   74E5 CD BA 4F      [17]  545 	call	_getTilePtr
   74E8 F1            [10]  546 	pop	af
   74E9 F1            [10]  547 	pop	af
   74EA 4D            [ 4]  548 	ld	c,l
   74EB 44            [ 4]  549 	ld	b,h
   74EC D1            [10]  550 	pop	de
                            551 ;src/main.c:157: break;
   74ED 18 78         [12]  552 	jr	00105$
                            553 ;src/main.c:158: case 2:
   74EF                     554 00103$:
                            555 ;src/main.c:159: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
   74EF 3A 17 6A      [13]  556 	ld	a, (#(_prota + 0x0001) + 0)
   74F2 C6 FE         [ 7]  557 	add	a,#0xFE
   74F4 21 16 6A      [10]  558 	ld	hl, #_prota + 0
   74F7 56            [ 7]  559 	ld	d,(hl)
   74F8 C5            [11]  560 	push	bc
   74F9 F5            [11]  561 	push	af
   74FA 33            [ 6]  562 	inc	sp
   74FB D5            [11]  563 	push	de
   74FC 33            [ 6]  564 	inc	sp
   74FD 2A CE 72      [16]  565 	ld	hl,(_mapa)
   7500 E5            [11]  566 	push	hl
   7501 CD BA 4F      [17]  567 	call	_getTilePtr
   7504 F1            [10]  568 	pop	af
   7505 F1            [10]  569 	pop	af
   7506 C1            [10]  570 	pop	bc
   7507 33            [ 6]  571 	inc	sp
   7508 33            [ 6]  572 	inc	sp
   7509 E5            [11]  573 	push	hl
                            574 ;src/main.c:160: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
   750A 21 17 6A      [10]  575 	ld	hl, #(_prota + 0x0001) + 0
   750D 56            [ 7]  576 	ld	d,(hl)
   750E 15            [ 4]  577 	dec	d
   750F 15            [ 4]  578 	dec	d
   7510 3A 16 6A      [13]  579 	ld	a, (#_prota + 0)
   7513 C6 03         [ 7]  580 	add	a, #0x03
   7515 C5            [11]  581 	push	bc
   7516 D5            [11]  582 	push	de
   7517 33            [ 6]  583 	inc	sp
   7518 F5            [11]  584 	push	af
   7519 33            [ 6]  585 	inc	sp
   751A 2A CE 72      [16]  586 	ld	hl,(_mapa)
   751D E5            [11]  587 	push	hl
   751E CD BA 4F      [17]  588 	call	_getTilePtr
   7521 F1            [10]  589 	pop	af
   7522 F1            [10]  590 	pop	af
   7523 EB            [ 4]  591 	ex	de,hl
   7524 C1            [10]  592 	pop	bc
                            593 ;src/main.c:161: *waistTile = 0;
   7525 21 00 00      [10]  594 	ld	hl,#0x0000
   7528 36 00         [10]  595 	ld	(hl),#0x00
                            596 ;src/main.c:162: break;
   752A 18 3B         [12]  597 	jr	00105$
                            598 ;src/main.c:163: case 3:
   752C                     599 00104$:
                            600 ;src/main.c:164: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
   752C 3A 17 6A      [13]  601 	ld	a, (#(_prota + 0x0001) + 0)
   752F C6 16         [ 7]  602 	add	a, #0x16
   7531 21 16 6A      [10]  603 	ld	hl, #_prota + 0
   7534 56            [ 7]  604 	ld	d,(hl)
   7535 C5            [11]  605 	push	bc
   7536 F5            [11]  606 	push	af
   7537 33            [ 6]  607 	inc	sp
   7538 D5            [11]  608 	push	de
   7539 33            [ 6]  609 	inc	sp
   753A 2A CE 72      [16]  610 	ld	hl,(_mapa)
   753D E5            [11]  611 	push	hl
   753E CD BA 4F      [17]  612 	call	_getTilePtr
   7541 F1            [10]  613 	pop	af
   7542 F1            [10]  614 	pop	af
   7543 C1            [10]  615 	pop	bc
   7544 33            [ 6]  616 	inc	sp
   7545 33            [ 6]  617 	inc	sp
   7546 E5            [11]  618 	push	hl
                            619 ;src/main.c:165: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   7547 3A 17 6A      [13]  620 	ld	a, (#(_prota + 0x0001) + 0)
   754A C6 16         [ 7]  621 	add	a, #0x16
   754C 57            [ 4]  622 	ld	d,a
   754D 3A 16 6A      [13]  623 	ld	a, (#_prota + 0)
   7550 C6 03         [ 7]  624 	add	a, #0x03
   7552 C5            [11]  625 	push	bc
   7553 D5            [11]  626 	push	de
   7554 33            [ 6]  627 	inc	sp
   7555 F5            [11]  628 	push	af
   7556 33            [ 6]  629 	inc	sp
   7557 2A CE 72      [16]  630 	ld	hl,(_mapa)
   755A E5            [11]  631 	push	hl
   755B CD BA 4F      [17]  632 	call	_getTilePtr
   755E F1            [10]  633 	pop	af
   755F F1            [10]  634 	pop	af
   7560 EB            [ 4]  635 	ex	de,hl
   7561 C1            [10]  636 	pop	bc
                            637 ;src/main.c:166: *waistTile = 0;
   7562 21 00 00      [10]  638 	ld	hl,#0x0000
   7565 36 00         [10]  639 	ld	(hl),#0x00
                            640 ;src/main.c:168: }
   7567                     641 00105$:
                            642 ;src/main.c:170: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   7567 E1            [10]  643 	pop	hl
   7568 E5            [11]  644 	push	hl
   7569 6E            [ 7]  645 	ld	l,(hl)
   756A 3E 02         [ 7]  646 	ld	a,#0x02
   756C 95            [ 4]  647 	sub	a, l
   756D 38 0E         [12]  648 	jr	C,00106$
   756F 1A            [ 7]  649 	ld	a,(de)
   7570 5F            [ 4]  650 	ld	e,a
   7571 3E 02         [ 7]  651 	ld	a,#0x02
   7573 93            [ 4]  652 	sub	a, e
   7574 38 07         [12]  653 	jr	C,00106$
   7576 0A            [ 7]  654 	ld	a,(bc)
   7577 4F            [ 4]  655 	ld	c,a
   7578 3E 02         [ 7]  656 	ld	a,#0x02
   757A 91            [ 4]  657 	sub	a, c
   757B 30 04         [12]  658 	jr	NC,00107$
   757D                     659 00106$:
                            660 ;src/main.c:171: return 1;
   757D 2E 01         [ 7]  661 	ld	l,#0x01
   757F 18 02         [12]  662 	jr	00110$
   7581                     663 00107$:
                            664 ;src/main.c:173: return 0;
   7581 2E 00         [ 7]  665 	ld	l,#0x00
   7583                     666 00110$:
   7583 DD F9         [10]  667 	ld	sp, ix
   7585 DD E1         [14]  668 	pop	ix
   7587 C9            [10]  669 	ret
                            670 ;src/main.c:176: void dibujarEnemigo(TEnemy *enemy) {
                            671 ;	---------------------------------
                            672 ; Function dibujarEnemigo
                            673 ; ---------------------------------
   7588                     674 _dibujarEnemigo::
   7588 DD E5         [15]  675 	push	ix
   758A DD 21 00 00   [14]  676 	ld	ix,#0
   758E DD 39         [15]  677 	add	ix,sp
                            678 ;src/main.c:177: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   7590 DD 4E 04      [19]  679 	ld	c,4 (ix)
   7593 DD 46 05      [19]  680 	ld	b,5 (ix)
   7596 69            [ 4]  681 	ld	l, c
   7597 60            [ 4]  682 	ld	h, b
   7598 23            [ 6]  683 	inc	hl
   7599 56            [ 7]  684 	ld	d,(hl)
   759A 0A            [ 7]  685 	ld	a,(bc)
   759B C5            [11]  686 	push	bc
   759C D5            [11]  687 	push	de
   759D 33            [ 6]  688 	inc	sp
   759E F5            [11]  689 	push	af
   759F 33            [ 6]  690 	inc	sp
   75A0 21 00 C0      [10]  691 	ld	hl,#0xC000
   75A3 E5            [11]  692 	push	hl
   75A4 CD A3 64      [17]  693 	call	_cpct_getScreenPtr
   75A7 EB            [ 4]  694 	ex	de,hl
                            695 ;src/main.c:178: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   75A8 E1            [10]  696 	pop	hl
   75A9 01 04 00      [10]  697 	ld	bc, #0x0004
   75AC 09            [11]  698 	add	hl, bc
   75AD 4E            [ 7]  699 	ld	c,(hl)
   75AE 23            [ 6]  700 	inc	hl
   75AF 46            [ 7]  701 	ld	b,(hl)
   75B0 21 00 01      [10]  702 	ld	hl,#_g_tablatrans
   75B3 E5            [11]  703 	push	hl
   75B4 21 04 16      [10]  704 	ld	hl,#0x1604
   75B7 E5            [11]  705 	push	hl
   75B8 D5            [11]  706 	push	de
   75B9 C5            [11]  707 	push	bc
   75BA CD C3 64      [17]  708 	call	_cpct_drawSpriteMaskedAlignedTable
   75BD DD E1         [14]  709 	pop	ix
   75BF C9            [10]  710 	ret
                            711 ;src/main.c:181: void dibujarExplosion(TEnemy *enemy) {
                            712 ;	---------------------------------
                            713 ; Function dibujarExplosion
                            714 ; ---------------------------------
   75C0                     715 _dibujarExplosion::
   75C0 DD E5         [15]  716 	push	ix
   75C2 DD 21 00 00   [14]  717 	ld	ix,#0
   75C6 DD 39         [15]  718 	add	ix,sp
                            719 ;src/main.c:182: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   75C8 DD 4E 04      [19]  720 	ld	c,4 (ix)
   75CB DD 46 05      [19]  721 	ld	b,5 (ix)
   75CE 69            [ 4]  722 	ld	l, c
   75CF 60            [ 4]  723 	ld	h, b
   75D0 23            [ 6]  724 	inc	hl
   75D1 56            [ 7]  725 	ld	d,(hl)
   75D2 0A            [ 7]  726 	ld	a,(bc)
   75D3 47            [ 4]  727 	ld	b,a
   75D4 D5            [11]  728 	push	de
   75D5 33            [ 6]  729 	inc	sp
   75D6 C5            [11]  730 	push	bc
   75D7 33            [ 6]  731 	inc	sp
   75D8 21 00 C0      [10]  732 	ld	hl,#0xC000
   75DB E5            [11]  733 	push	hl
   75DC CD A3 64      [17]  734 	call	_cpct_getScreenPtr
   75DF 4D            [ 4]  735 	ld	c,l
   75E0 44            [ 4]  736 	ld	b,h
                            737 ;src/main.c:183: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   75E1 11 00 01      [10]  738 	ld	de,#_g_tablatrans+0
   75E4 D5            [11]  739 	push	de
   75E5 21 04 16      [10]  740 	ld	hl,#0x1604
   75E8 E5            [11]  741 	push	hl
   75E9 C5            [11]  742 	push	bc
   75EA 21 70 19      [10]  743 	ld	hl,#_g_explosion
   75ED E5            [11]  744 	push	hl
   75EE CD C3 64      [17]  745 	call	_cpct_drawSpriteMaskedAlignedTable
   75F1 DD E1         [14]  746 	pop	ix
   75F3 C9            [10]  747 	ret
                            748 ;src/main.c:186: void borrarExplosion() {
                            749 ;	---------------------------------
                            750 ; Function borrarExplosion
                            751 ; ---------------------------------
   75F4                     752 _borrarExplosion::
   75F4 DD E5         [15]  753 	push	ix
   75F6 DD 21 00 00   [14]  754 	ld	ix,#0
   75FA DD 39         [15]  755 	add	ix,sp
   75FC F5            [11]  756 	push	af
   75FD 3B            [ 6]  757 	dec	sp
                            758 ;src/main.c:189: u8 w = 4 + (enemy->px & 1);
   75FE 21 00 65      [10]  759 	ld	hl, #_enemy + 2
   7601 4E            [ 7]  760 	ld	c,(hl)
   7602 79            [ 4]  761 	ld	a,c
   7603 E6 01         [ 7]  762 	and	a, #0x01
   7605 47            [ 4]  763 	ld	b,a
   7606 04            [ 4]  764 	inc	b
   7607 04            [ 4]  765 	inc	b
   7608 04            [ 4]  766 	inc	b
   7609 04            [ 4]  767 	inc	b
                            768 ;src/main.c:192: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   760A 21 01 65      [10]  769 	ld	hl, #_enemy + 3
   760D 5E            [ 7]  770 	ld	e,(hl)
   760E CB 4B         [ 8]  771 	bit	1, e
   7610 28 04         [12]  772 	jr	Z,00103$
   7612 3E 01         [ 7]  773 	ld	a,#0x01
   7614 18 02         [12]  774 	jr	00104$
   7616                     775 00103$:
   7616 3E 00         [ 7]  776 	ld	a,#0x00
   7618                     777 00104$:
   7618 C6 07         [ 7]  778 	add	a, #0x07
   761A DD 77 FD      [19]  779 	ld	-3 (ix),a
                            780 ;src/main.c:194: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   761D FD 2A CE 72   [20]  781 	ld	iy,(_mapa)
   7621 16 00         [ 7]  782 	ld	d,#0x00
   7623 7B            [ 4]  783 	ld	a,e
   7624 C6 E8         [ 7]  784 	add	a,#0xE8
   7626 DD 77 FE      [19]  785 	ld	-2 (ix),a
   7629 7A            [ 4]  786 	ld	a,d
   762A CE FF         [ 7]  787 	adc	a,#0xFF
   762C DD 77 FF      [19]  788 	ld	-1 (ix),a
   762F DD 6E FE      [19]  789 	ld	l,-2 (ix)
   7632 DD 66 FF      [19]  790 	ld	h,-1 (ix)
   7635 DD CB FF 7E   [20]  791 	bit	7, -1 (ix)
   7639 28 04         [12]  792 	jr	Z,00105$
   763B 21 EB FF      [10]  793 	ld	hl,#0xFFEB
   763E 19            [11]  794 	add	hl,de
   763F                     795 00105$:
   763F CB 2C         [ 8]  796 	sra	h
   7641 CB 1D         [ 8]  797 	rr	l
   7643 CB 2C         [ 8]  798 	sra	h
   7645 CB 1D         [ 8]  799 	rr	l
   7647 55            [ 4]  800 	ld	d,l
   7648 CB 39         [ 8]  801 	srl	c
   764A FD E5         [15]  802 	push	iy
   764C 21 F0 C0      [10]  803 	ld	hl,#0xC0F0
   764F E5            [11]  804 	push	hl
   7650 3E 28         [ 7]  805 	ld	a,#0x28
   7652 F5            [11]  806 	push	af
   7653 33            [ 6]  807 	inc	sp
   7654 DD 7E FD      [19]  808 	ld	a,-3 (ix)
   7657 F5            [11]  809 	push	af
   7658 33            [ 6]  810 	inc	sp
   7659 C5            [11]  811 	push	bc
   765A 33            [ 6]  812 	inc	sp
   765B D5            [11]  813 	push	de
   765C 33            [ 6]  814 	inc	sp
   765D 79            [ 4]  815 	ld	a,c
   765E F5            [11]  816 	push	af
   765F 33            [ 6]  817 	inc	sp
   7660 CD 85 59      [17]  818 	call	_cpct_etm_drawTileBox2x4
   7663 DD F9         [10]  819 	ld	sp, ix
   7665 DD E1         [14]  820 	pop	ix
   7667 C9            [10]  821 	ret
                            822 ;src/main.c:198: void borrarEnemigo(TEnemy *enemy) {
                            823 ;	---------------------------------
                            824 ; Function borrarEnemigo
                            825 ; ---------------------------------
   7668                     826 _borrarEnemigo::
   7668 DD E5         [15]  827 	push	ix
   766A DD 21 00 00   [14]  828 	ld	ix,#0
   766E DD 39         [15]  829 	add	ix,sp
   7670 21 FA FF      [10]  830 	ld	hl,#-6
   7673 39            [11]  831 	add	hl,sp
   7674 F9            [ 6]  832 	ld	sp,hl
                            833 ;src/main.c:202: u8 w = 4 + (enemy->px & 1);
   7675 DD 4E 04      [19]  834 	ld	c,4 (ix)
   7678 DD 46 05      [19]  835 	ld	b,5 (ix)
   767B 69            [ 4]  836 	ld	l, c
   767C 60            [ 4]  837 	ld	h, b
   767D 23            [ 6]  838 	inc	hl
   767E 23            [ 6]  839 	inc	hl
   767F 5E            [ 7]  840 	ld	e,(hl)
   7680 7B            [ 4]  841 	ld	a,e
   7681 E6 01         [ 7]  842 	and	a, #0x01
   7683 C6 04         [ 7]  843 	add	a, #0x04
   7685 DD 77 FB      [19]  844 	ld	-5 (ix),a
                            845 ;src/main.c:205: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   7688 69            [ 4]  846 	ld	l, c
   7689 60            [ 4]  847 	ld	h, b
   768A 23            [ 6]  848 	inc	hl
   768B 23            [ 6]  849 	inc	hl
   768C 23            [ 6]  850 	inc	hl
   768D 56            [ 7]  851 	ld	d,(hl)
   768E CB 4A         [ 8]  852 	bit	1, d
   7690 28 04         [12]  853 	jr	Z,00103$
   7692 3E 01         [ 7]  854 	ld	a,#0x01
   7694 18 02         [12]  855 	jr	00104$
   7696                     856 00103$:
   7696 3E 00         [ 7]  857 	ld	a,#0x00
   7698                     858 00104$:
   7698 C6 07         [ 7]  859 	add	a, #0x07
   769A DD 77 FA      [19]  860 	ld	-6 (ix),a
                            861 ;src/main.c:207: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   769D FD 2A CE 72   [20]  862 	ld	iy,(_mapa)
   76A1 DD 72 FE      [19]  863 	ld	-2 (ix),d
   76A4 DD 36 FF 00   [19]  864 	ld	-1 (ix),#0x00
   76A8 DD 7E FE      [19]  865 	ld	a,-2 (ix)
   76AB C6 E8         [ 7]  866 	add	a,#0xE8
   76AD DD 77 FC      [19]  867 	ld	-4 (ix),a
   76B0 DD 7E FF      [19]  868 	ld	a,-1 (ix)
   76B3 CE FF         [ 7]  869 	adc	a,#0xFF
   76B5 DD 77 FD      [19]  870 	ld	-3 (ix),a
   76B8 DD 56 FC      [19]  871 	ld	d,-4 (ix)
   76BB DD 6E FD      [19]  872 	ld	l,-3 (ix)
   76BE DD CB FD 7E   [20]  873 	bit	7, -3 (ix)
   76C2 28 0C         [12]  874 	jr	Z,00105$
   76C4 DD 7E FE      [19]  875 	ld	a,-2 (ix)
   76C7 C6 EB         [ 7]  876 	add	a, #0xEB
   76C9 57            [ 4]  877 	ld	d,a
   76CA DD 7E FF      [19]  878 	ld	a,-1 (ix)
   76CD CE FF         [ 7]  879 	adc	a, #0xFF
   76CF 6F            [ 4]  880 	ld	l,a
   76D0                     881 00105$:
   76D0 CB 2D         [ 8]  882 	sra	l
   76D2 CB 1A         [ 8]  883 	rr	d
   76D4 CB 2D         [ 8]  884 	sra	l
   76D6 CB 1A         [ 8]  885 	rr	d
   76D8 CB 3B         [ 8]  886 	srl	e
   76DA C5            [11]  887 	push	bc
   76DB FD E5         [15]  888 	push	iy
   76DD 21 F0 C0      [10]  889 	ld	hl,#0xC0F0
   76E0 E5            [11]  890 	push	hl
   76E1 3E 28         [ 7]  891 	ld	a,#0x28
   76E3 F5            [11]  892 	push	af
   76E4 33            [ 6]  893 	inc	sp
   76E5 DD 66 FA      [19]  894 	ld	h,-6 (ix)
   76E8 DD 6E FB      [19]  895 	ld	l,-5 (ix)
   76EB E5            [11]  896 	push	hl
   76EC D5            [11]  897 	push	de
   76ED CD 85 59      [17]  898 	call	_cpct_etm_drawTileBox2x4
   76F0 C1            [10]  899 	pop	bc
                            900 ;src/main.c:209: enemy->mover = NO;
   76F1 21 06 00      [10]  901 	ld	hl,#0x0006
   76F4 09            [11]  902 	add	hl,bc
   76F5 36 00         [10]  903 	ld	(hl),#0x00
   76F7 DD F9         [10]  904 	ld	sp, ix
   76F9 DD E1         [14]  905 	pop	ix
   76FB C9            [10]  906 	ret
                            907 ;src/main.c:212: void redibujarEnemigo(TEnemy *enemy) {
                            908 ;	---------------------------------
                            909 ; Function redibujarEnemigo
                            910 ; ---------------------------------
   76FC                     911 _redibujarEnemigo::
   76FC DD E5         [15]  912 	push	ix
   76FE DD 21 00 00   [14]  913 	ld	ix,#0
   7702 DD 39         [15]  914 	add	ix,sp
                            915 ;src/main.c:213: borrarEnemigo(enemy);
   7704 DD 6E 04      [19]  916 	ld	l,4 (ix)
   7707 DD 66 05      [19]  917 	ld	h,5 (ix)
   770A E5            [11]  918 	push	hl
   770B CD 68 76      [17]  919 	call	_borrarEnemigo
   770E F1            [10]  920 	pop	af
                            921 ;src/main.c:214: enemy->px = enemy->x;
   770F DD 4E 04      [19]  922 	ld	c,4 (ix)
   7712 DD 46 05      [19]  923 	ld	b,5 (ix)
   7715 59            [ 4]  924 	ld	e, c
   7716 50            [ 4]  925 	ld	d, b
   7717 13            [ 6]  926 	inc	de
   7718 13            [ 6]  927 	inc	de
   7719 0A            [ 7]  928 	ld	a,(bc)
   771A 12            [ 7]  929 	ld	(de),a
                            930 ;src/main.c:215: enemy->py = enemy->y;
   771B 59            [ 4]  931 	ld	e, c
   771C 50            [ 4]  932 	ld	d, b
   771D 13            [ 6]  933 	inc	de
   771E 13            [ 6]  934 	inc	de
   771F 13            [ 6]  935 	inc	de
   7720 69            [ 4]  936 	ld	l, c
   7721 60            [ 4]  937 	ld	h, b
   7722 23            [ 6]  938 	inc	hl
   7723 7E            [ 7]  939 	ld	a,(hl)
   7724 12            [ 7]  940 	ld	(de),a
                            941 ;src/main.c:216: dibujarEnemigo(enemy);
   7725 C5            [11]  942 	push	bc
   7726 CD 88 75      [17]  943 	call	_dibujarEnemigo
   7729 F1            [10]  944 	pop	af
   772A DD E1         [14]  945 	pop	ix
   772C C9            [10]  946 	ret
                            947 ;src/main.c:219: u8 checkEnemyCollision(u8 direction, TEnemy *enemy){
                            948 ;	---------------------------------
                            949 ; Function checkEnemyCollision
                            950 ; ---------------------------------
   772D                     951 _checkEnemyCollision::
   772D DD E5         [15]  952 	push	ix
   772F DD 21 00 00   [14]  953 	ld	ix,#0
   7733 DD 39         [15]  954 	add	ix,sp
   7735 21 F7 FF      [10]  955 	ld	hl,#-9
   7738 39            [11]  956 	add	hl,sp
   7739 F9            [ 6]  957 	ld	sp,hl
                            958 ;src/main.c:221: u8 colisiona = 1;
   773A DD 36 F7 01   [19]  959 	ld	-9 (ix),#0x01
                            960 ;src/main.c:223: switch (direction) {
   773E 3E 03         [ 7]  961 	ld	a,#0x03
   7740 DD 96 04      [19]  962 	sub	a, 4 (ix)
   7743 DA 20 7B      [10]  963 	jp	C,00165$
                            964 ;src/main.c:225: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   7746 DD 4E 05      [19]  965 	ld	c,5 (ix)
   7749 DD 46 06      [19]  966 	ld	b,6 (ix)
   774C 0A            [ 7]  967 	ld	a,(bc)
   774D 5F            [ 4]  968 	ld	e,a
   774E 21 01 00      [10]  969 	ld	hl,#0x0001
   7751 09            [11]  970 	add	hl,bc
   7752 DD 75 F8      [19]  971 	ld	-8 (ix),l
   7755 DD 74 F9      [19]  972 	ld	-7 (ix),h
   7758 DD 6E F8      [19]  973 	ld	l,-8 (ix)
   775B DD 66 F9      [19]  974 	ld	h,-7 (ix)
   775E 56            [ 7]  975 	ld	d,(hl)
                            976 ;src/main.c:238: enemy->muerto = SI;
   775F 21 08 00      [10]  977 	ld	hl,#0x0008
   7762 09            [11]  978 	add	hl,bc
   7763 DD 75 FA      [19]  979 	ld	-6 (ix),l
   7766 DD 74 FB      [19]  980 	ld	-5 (ix),h
                            981 ;src/main.c:245: enemy->mira = M_izquierda;
   7769 21 07 00      [10]  982 	ld	hl,#0x0007
   776C 09            [11]  983 	add	hl,bc
   776D DD 75 FC      [19]  984 	ld	-4 (ix),l
   7770 DD 74 FD      [19]  985 	ld	-3 (ix),h
                            986 ;src/main.c:223: switch (direction) {
   7773 D5            [11]  987 	push	de
   7774 DD 5E 04      [19]  988 	ld	e,4 (ix)
   7777 16 00         [ 7]  989 	ld	d,#0x00
   7779 21 81 77      [10]  990 	ld	hl,#00268$
   777C 19            [11]  991 	add	hl,de
   777D 19            [11]  992 	add	hl,de
   777E 19            [11]  993 	add	hl,de
   777F D1            [10]  994 	pop	de
   7780 E9            [ 4]  995 	jp	(hl)
   7781                     996 00268$:
   7781 C3 8D 77      [10]  997 	jp	00101$
   7784 C3 75 78      [10]  998 	jp	00117$
   7787 C3 59 79      [10]  999 	jp	00133$
   778A C3 37 7A      [10] 1000 	jp	00149$
                           1001 ;src/main.c:224: case 0:
   778D                    1002 00101$:
                           1003 ;src/main.c:225: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   778D 7B            [ 4] 1004 	ld	a,e
   778E C6 05         [ 7] 1005 	add	a, #0x05
   7790 C5            [11] 1006 	push	bc
   7791 D5            [11] 1007 	push	de
   7792 33            [ 6] 1008 	inc	sp
   7793 F5            [11] 1009 	push	af
   7794 33            [ 6] 1010 	inc	sp
   7795 2A CE 72      [16] 1011 	ld	hl,(_mapa)
   7798 E5            [11] 1012 	push	hl
   7799 CD BA 4F      [17] 1013 	call	_getTilePtr
   779C F1            [10] 1014 	pop	af
   779D F1            [10] 1015 	pop	af
   779E C1            [10] 1016 	pop	bc
   779F 5E            [ 7] 1017 	ld	e,(hl)
   77A0 3E 02         [ 7] 1018 	ld	a,#0x02
   77A2 93            [ 4] 1019 	sub	a, e
   77A3 DA 6A 78      [10] 1020 	jp	C,00113$
                           1021 ;src/main.c:226: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   77A6 DD 6E F8      [19] 1022 	ld	l,-8 (ix)
   77A9 DD 66 F9      [19] 1023 	ld	h,-7 (ix)
   77AC 7E            [ 7] 1024 	ld	a,(hl)
   77AD C6 0B         [ 7] 1025 	add	a, #0x0B
   77AF 57            [ 4] 1026 	ld	d,a
   77B0 0A            [ 7] 1027 	ld	a,(bc)
   77B1 C6 05         [ 7] 1028 	add	a, #0x05
   77B3 C5            [11] 1029 	push	bc
   77B4 D5            [11] 1030 	push	de
   77B5 33            [ 6] 1031 	inc	sp
   77B6 F5            [11] 1032 	push	af
   77B7 33            [ 6] 1033 	inc	sp
   77B8 2A CE 72      [16] 1034 	ld	hl,(_mapa)
   77BB E5            [11] 1035 	push	hl
   77BC CD BA 4F      [17] 1036 	call	_getTilePtr
   77BF F1            [10] 1037 	pop	af
   77C0 F1            [10] 1038 	pop	af
   77C1 C1            [10] 1039 	pop	bc
   77C2 5E            [ 7] 1040 	ld	e,(hl)
   77C3 3E 02         [ 7] 1041 	ld	a,#0x02
   77C5 93            [ 4] 1042 	sub	a, e
   77C6 DA 6A 78      [10] 1043 	jp	C,00113$
                           1044 ;src/main.c:227: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   77C9 DD 6E F8      [19] 1045 	ld	l,-8 (ix)
   77CC DD 66 F9      [19] 1046 	ld	h,-7 (ix)
   77CF 7E            [ 7] 1047 	ld	a,(hl)
   77D0 C6 16         [ 7] 1048 	add	a, #0x16
   77D2 57            [ 4] 1049 	ld	d,a
   77D3 0A            [ 7] 1050 	ld	a,(bc)
   77D4 C6 05         [ 7] 1051 	add	a, #0x05
   77D6 C5            [11] 1052 	push	bc
   77D7 D5            [11] 1053 	push	de
   77D8 33            [ 6] 1054 	inc	sp
   77D9 F5            [11] 1055 	push	af
   77DA 33            [ 6] 1056 	inc	sp
   77DB 2A CE 72      [16] 1057 	ld	hl,(_mapa)
   77DE E5            [11] 1058 	push	hl
   77DF CD BA 4F      [17] 1059 	call	_getTilePtr
   77E2 F1            [10] 1060 	pop	af
   77E3 F1            [10] 1061 	pop	af
   77E4 C1            [10] 1062 	pop	bc
   77E5 5E            [ 7] 1063 	ld	e,(hl)
   77E6 3E 02         [ 7] 1064 	ld	a,#0x02
   77E8 93            [ 4] 1065 	sub	a, e
   77E9 DA 6A 78      [10] 1066 	jp	C,00113$
                           1067 ;src/main.c:229: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   77EC 21 1F 6A      [10] 1068 	ld	hl, #_cu + 1
   77EF 5E            [ 7] 1069 	ld	e,(hl)
   77F0 16 00         [ 7] 1070 	ld	d,#0x00
   77F2 21 04 00      [10] 1071 	ld	hl,#0x0004
   77F5 19            [11] 1072 	add	hl,de
   77F6 DD 75 FE      [19] 1073 	ld	-2 (ix),l
   77F9 DD 74 FF      [19] 1074 	ld	-1 (ix),h
   77FC DD 6E F8      [19] 1075 	ld	l,-8 (ix)
   77FF DD 66 F9      [19] 1076 	ld	h,-7 (ix)
   7802 6E            [ 7] 1077 	ld	l,(hl)
   7803 26 00         [ 7] 1078 	ld	h,#0x00
   7805 DD 7E FE      [19] 1079 	ld	a,-2 (ix)
   7808 95            [ 4] 1080 	sub	a, l
   7809 DD 7E FF      [19] 1081 	ld	a,-1 (ix)
   780C 9C            [ 4] 1082 	sbc	a, h
   780D E2 12 78      [10] 1083 	jp	PO, 00269$
   7810 EE 80         [ 7] 1084 	xor	a, #0x80
   7812                    1085 00269$:
   7812 FA 27 78      [10] 1086 	jp	M,00108$
   7815 D5            [11] 1087 	push	de
   7816 11 16 00      [10] 1088 	ld	de,#0x0016
   7819 19            [11] 1089 	add	hl, de
   781A D1            [10] 1090 	pop	de
   781B 7D            [ 4] 1091 	ld	a,l
   781C 93            [ 4] 1092 	sub	a, e
   781D 7C            [ 4] 1093 	ld	a,h
   781E 9A            [ 4] 1094 	sbc	a, d
   781F E2 24 78      [10] 1095 	jp	PO, 00270$
   7822 EE 80         [ 7] 1096 	xor	a, #0x80
   7824                    1097 00270$:
   7824 F2 2E 78      [10] 1098 	jp	P,00109$
   7827                    1099 00108$:
                           1100 ;src/main.c:230: colisiona = 0;
   7827 DD 36 F7 00   [19] 1101 	ld	-9 (ix),#0x00
   782B C3 20 7B      [10] 1102 	jp	00165$
   782E                    1103 00109$:
                           1104 ;src/main.c:233: if(cu.x > enemy->x){ //si el cu esta abajo
   782E 21 1E 6A      [10] 1105 	ld	hl, #_cu + 0
   7831 5E            [ 7] 1106 	ld	e,(hl)
   7832 0A            [ 7] 1107 	ld	a,(bc)
   7833 4F            [ 4] 1108 	ld	c,a
   7834 93            [ 4] 1109 	sub	a, e
   7835 30 2C         [12] 1110 	jr	NC,00106$
                           1111 ;src/main.c:234: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
   7837 6B            [ 4] 1112 	ld	l,e
   7838 26 00         [ 7] 1113 	ld	h,#0x00
   783A 06 00         [ 7] 1114 	ld	b,#0x00
   783C 03            [ 6] 1115 	inc	bc
   783D 03            [ 6] 1116 	inc	bc
   783E 03            [ 6] 1117 	inc	bc
   783F 03            [ 6] 1118 	inc	bc
   7840 BF            [ 4] 1119 	cp	a, a
   7841 ED 42         [15] 1120 	sbc	hl, bc
   7843 3E 01         [ 7] 1121 	ld	a,#0x01
   7845 BD            [ 4] 1122 	cp	a, l
   7846 3E 00         [ 7] 1123 	ld	a,#0x00
   7848 9C            [ 4] 1124 	sbc	a, h
   7849 E2 4E 78      [10] 1125 	jp	PO, 00271$
   784C EE 80         [ 7] 1126 	xor	a, #0x80
   784E                    1127 00271$:
   784E F2 58 78      [10] 1128 	jp	P,00103$
                           1129 ;src/main.c:235: colisiona = 0;
   7851 DD 36 F7 00   [19] 1130 	ld	-9 (ix),#0x00
   7855 C3 20 7B      [10] 1131 	jp	00165$
   7858                    1132 00103$:
                           1133 ;src/main.c:238: enemy->muerto = SI;
   7858 DD 6E FA      [19] 1134 	ld	l,-6 (ix)
   785B DD 66 FB      [19] 1135 	ld	h,-5 (ix)
   785E 36 01         [10] 1136 	ld	(hl),#0x01
   7860 C3 20 7B      [10] 1137 	jp	00165$
   7863                    1138 00106$:
                           1139 ;src/main.c:241: colisiona = 0;
   7863 DD 36 F7 00   [19] 1140 	ld	-9 (ix),#0x00
   7867 C3 20 7B      [10] 1141 	jp	00165$
   786A                    1142 00113$:
                           1143 ;src/main.c:245: enemy->mira = M_izquierda;
   786A DD 6E FC      [19] 1144 	ld	l,-4 (ix)
   786D DD 66 FD      [19] 1145 	ld	h,-3 (ix)
   7870 36 01         [10] 1146 	ld	(hl),#0x01
                           1147 ;src/main.c:247: break;
   7872 C3 20 7B      [10] 1148 	jp	00165$
                           1149 ;src/main.c:248: case 1:
   7875                    1150 00117$:
                           1151 ;src/main.c:249: if( *getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   7875 1D            [ 4] 1152 	dec	e
   7876 C5            [11] 1153 	push	bc
   7877 D5            [11] 1154 	push	de
   7878 2A CE 72      [16] 1155 	ld	hl,(_mapa)
   787B E5            [11] 1156 	push	hl
   787C CD BA 4F      [17] 1157 	call	_getTilePtr
   787F F1            [10] 1158 	pop	af
   7880 F1            [10] 1159 	pop	af
   7881 C1            [10] 1160 	pop	bc
   7882 5E            [ 7] 1161 	ld	e,(hl)
   7883 3E 02         [ 7] 1162 	ld	a,#0x02
   7885 93            [ 4] 1163 	sub	a, e
   7886 DA 4E 79      [10] 1164 	jp	C,00129$
                           1165 ;src/main.c:250: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   7889 DD 6E F8      [19] 1166 	ld	l,-8 (ix)
   788C DD 66 F9      [19] 1167 	ld	h,-7 (ix)
   788F 7E            [ 7] 1168 	ld	a,(hl)
   7890 C6 0B         [ 7] 1169 	add	a, #0x0B
   7892 57            [ 4] 1170 	ld	d,a
   7893 0A            [ 7] 1171 	ld	a,(bc)
   7894 C6 FF         [ 7] 1172 	add	a,#0xFF
   7896 C5            [11] 1173 	push	bc
   7897 D5            [11] 1174 	push	de
   7898 33            [ 6] 1175 	inc	sp
   7899 F5            [11] 1176 	push	af
   789A 33            [ 6] 1177 	inc	sp
   789B 2A CE 72      [16] 1178 	ld	hl,(_mapa)
   789E E5            [11] 1179 	push	hl
   789F CD BA 4F      [17] 1180 	call	_getTilePtr
   78A2 F1            [10] 1181 	pop	af
   78A3 F1            [10] 1182 	pop	af
   78A4 C1            [10] 1183 	pop	bc
   78A5 5E            [ 7] 1184 	ld	e,(hl)
   78A6 3E 02         [ 7] 1185 	ld	a,#0x02
   78A8 93            [ 4] 1186 	sub	a, e
   78A9 DA 4E 79      [10] 1187 	jp	C,00129$
                           1188 ;src/main.c:251: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   78AC DD 6E F8      [19] 1189 	ld	l,-8 (ix)
   78AF DD 66 F9      [19] 1190 	ld	h,-7 (ix)
   78B2 7E            [ 7] 1191 	ld	a,(hl)
   78B3 C6 16         [ 7] 1192 	add	a, #0x16
   78B5 57            [ 4] 1193 	ld	d,a
   78B6 0A            [ 7] 1194 	ld	a,(bc)
   78B7 C6 FF         [ 7] 1195 	add	a,#0xFF
   78B9 C5            [11] 1196 	push	bc
   78BA D5            [11] 1197 	push	de
   78BB 33            [ 6] 1198 	inc	sp
   78BC F5            [11] 1199 	push	af
   78BD 33            [ 6] 1200 	inc	sp
   78BE 2A CE 72      [16] 1201 	ld	hl,(_mapa)
   78C1 E5            [11] 1202 	push	hl
   78C2 CD BA 4F      [17] 1203 	call	_getTilePtr
   78C5 F1            [10] 1204 	pop	af
   78C6 F1            [10] 1205 	pop	af
   78C7 C1            [10] 1206 	pop	bc
   78C8 5E            [ 7] 1207 	ld	e,(hl)
   78C9 3E 02         [ 7] 1208 	ld	a,#0x02
   78CB 93            [ 4] 1209 	sub	a, e
   78CC DA 4E 79      [10] 1210 	jp	C,00129$
                           1211 ;src/main.c:253: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   78CF 21 1F 6A      [10] 1212 	ld	hl, #_cu + 1
   78D2 5E            [ 7] 1213 	ld	e,(hl)
   78D3 16 00         [ 7] 1214 	ld	d,#0x00
   78D5 21 04 00      [10] 1215 	ld	hl,#0x0004
   78D8 19            [11] 1216 	add	hl,de
   78D9 DD 75 FE      [19] 1217 	ld	-2 (ix),l
   78DC DD 74 FF      [19] 1218 	ld	-1 (ix),h
   78DF DD 6E F8      [19] 1219 	ld	l,-8 (ix)
   78E2 DD 66 F9      [19] 1220 	ld	h,-7 (ix)
   78E5 6E            [ 7] 1221 	ld	l,(hl)
   78E6 26 00         [ 7] 1222 	ld	h,#0x00
   78E8 DD 7E FE      [19] 1223 	ld	a,-2 (ix)
   78EB 95            [ 4] 1224 	sub	a, l
   78EC DD 7E FF      [19] 1225 	ld	a,-1 (ix)
   78EF 9C            [ 4] 1226 	sbc	a, h
   78F0 E2 F5 78      [10] 1227 	jp	PO, 00272$
   78F3 EE 80         [ 7] 1228 	xor	a, #0x80
   78F5                    1229 00272$:
   78F5 FA 0A 79      [10] 1230 	jp	M,00124$
   78F8 D5            [11] 1231 	push	de
   78F9 11 16 00      [10] 1232 	ld	de,#0x0016
   78FC 19            [11] 1233 	add	hl, de
   78FD D1            [10] 1234 	pop	de
   78FE 7D            [ 4] 1235 	ld	a,l
   78FF 93            [ 4] 1236 	sub	a, e
   7900 7C            [ 4] 1237 	ld	a,h
   7901 9A            [ 4] 1238 	sbc	a, d
   7902 E2 07 79      [10] 1239 	jp	PO, 00273$
   7905 EE 80         [ 7] 1240 	xor	a, #0x80
   7907                    1241 00273$:
   7907 F2 11 79      [10] 1242 	jp	P,00125$
   790A                    1243 00124$:
                           1244 ;src/main.c:254: colisiona = 0;
   790A DD 36 F7 00   [19] 1245 	ld	-9 (ix),#0x00
   790E C3 20 7B      [10] 1246 	jp	00165$
   7911                    1247 00125$:
                           1248 ;src/main.c:257: if(enemy->x > cu.x){ //si el cu esta abajo
   7911 0A            [ 7] 1249 	ld	a,(bc)
   7912 5F            [ 4] 1250 	ld	e,a
   7913 21 1E 6A      [10] 1251 	ld	hl, #_cu + 0
   7916 4E            [ 7] 1252 	ld	c,(hl)
   7917 79            [ 4] 1253 	ld	a,c
   7918 93            [ 4] 1254 	sub	a, e
   7919 30 2C         [12] 1255 	jr	NC,00122$
                           1256 ;src/main.c:258: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
   791B 6B            [ 4] 1257 	ld	l,e
   791C 26 00         [ 7] 1258 	ld	h,#0x00
   791E 06 00         [ 7] 1259 	ld	b,#0x00
   7920 03            [ 6] 1260 	inc	bc
   7921 03            [ 6] 1261 	inc	bc
   7922 03            [ 6] 1262 	inc	bc
   7923 03            [ 6] 1263 	inc	bc
   7924 BF            [ 4] 1264 	cp	a, a
   7925 ED 42         [15] 1265 	sbc	hl, bc
   7927 3E 01         [ 7] 1266 	ld	a,#0x01
   7929 BD            [ 4] 1267 	cp	a, l
   792A 3E 00         [ 7] 1268 	ld	a,#0x00
   792C 9C            [ 4] 1269 	sbc	a, h
   792D E2 32 79      [10] 1270 	jp	PO, 00274$
   7930 EE 80         [ 7] 1271 	xor	a, #0x80
   7932                    1272 00274$:
   7932 F2 3C 79      [10] 1273 	jp	P,00119$
                           1274 ;src/main.c:259: colisiona = 0;
   7935 DD 36 F7 00   [19] 1275 	ld	-9 (ix),#0x00
   7939 C3 20 7B      [10] 1276 	jp	00165$
   793C                    1277 00119$:
                           1278 ;src/main.c:262: enemy->muerto = SI;
   793C DD 6E FA      [19] 1279 	ld	l,-6 (ix)
   793F DD 66 FB      [19] 1280 	ld	h,-5 (ix)
   7942 36 01         [10] 1281 	ld	(hl),#0x01
   7944 C3 20 7B      [10] 1282 	jp	00165$
   7947                    1283 00122$:
                           1284 ;src/main.c:265: colisiona = 0;
   7947 DD 36 F7 00   [19] 1285 	ld	-9 (ix),#0x00
   794B C3 20 7B      [10] 1286 	jp	00165$
   794E                    1287 00129$:
                           1288 ;src/main.c:269: enemy->mira = M_derecha;
   794E DD 6E FC      [19] 1289 	ld	l,-4 (ix)
   7951 DD 66 FD      [19] 1290 	ld	h,-3 (ix)
   7954 36 00         [10] 1291 	ld	(hl),#0x00
                           1292 ;src/main.c:271: break;
   7956 C3 20 7B      [10] 1293 	jp	00165$
                           1294 ;src/main.c:272: case 2:
   7959                    1295 00133$:
                           1296 ;src/main.c:273: if( *getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7959 15            [ 4] 1297 	dec	d
   795A 15            [ 4] 1298 	dec	d
   795B C5            [11] 1299 	push	bc
   795C D5            [11] 1300 	push	de
   795D 2A CE 72      [16] 1301 	ld	hl,(_mapa)
   7960 E5            [11] 1302 	push	hl
   7961 CD BA 4F      [17] 1303 	call	_getTilePtr
   7964 F1            [10] 1304 	pop	af
   7965 F1            [10] 1305 	pop	af
   7966 C1            [10] 1306 	pop	bc
   7967 5E            [ 7] 1307 	ld	e,(hl)
   7968 3E 02         [ 7] 1308 	ld	a,#0x02
   796A 93            [ 4] 1309 	sub	a, e
   796B DA 2F 7A      [10] 1310 	jp	C,00145$
                           1311 ;src/main.c:274: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   796E DD 6E F8      [19] 1312 	ld	l,-8 (ix)
   7971 DD 66 F9      [19] 1313 	ld	h,-7 (ix)
   7974 56            [ 7] 1314 	ld	d,(hl)
   7975 15            [ 4] 1315 	dec	d
   7976 15            [ 4] 1316 	dec	d
   7977 0A            [ 7] 1317 	ld	a,(bc)
   7978 C6 02         [ 7] 1318 	add	a, #0x02
   797A C5            [11] 1319 	push	bc
   797B D5            [11] 1320 	push	de
   797C 33            [ 6] 1321 	inc	sp
   797D F5            [11] 1322 	push	af
   797E 33            [ 6] 1323 	inc	sp
   797F 2A CE 72      [16] 1324 	ld	hl,(_mapa)
   7982 E5            [11] 1325 	push	hl
   7983 CD BA 4F      [17] 1326 	call	_getTilePtr
   7986 F1            [10] 1327 	pop	af
   7987 F1            [10] 1328 	pop	af
   7988 C1            [10] 1329 	pop	bc
   7989 5E            [ 7] 1330 	ld	e,(hl)
   798A 3E 02         [ 7] 1331 	ld	a,#0x02
   798C 93            [ 4] 1332 	sub	a, e
   798D DA 2F 7A      [10] 1333 	jp	C,00145$
                           1334 ;src/main.c:275: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   7990 DD 6E F8      [19] 1335 	ld	l,-8 (ix)
   7993 DD 66 F9      [19] 1336 	ld	h,-7 (ix)
   7996 56            [ 7] 1337 	ld	d,(hl)
   7997 15            [ 4] 1338 	dec	d
   7998 15            [ 4] 1339 	dec	d
   7999 0A            [ 7] 1340 	ld	a,(bc)
   799A C6 04         [ 7] 1341 	add	a, #0x04
   799C C5            [11] 1342 	push	bc
   799D D5            [11] 1343 	push	de
   799E 33            [ 6] 1344 	inc	sp
   799F F5            [11] 1345 	push	af
   79A0 33            [ 6] 1346 	inc	sp
   79A1 2A CE 72      [16] 1347 	ld	hl,(_mapa)
   79A4 E5            [11] 1348 	push	hl
   79A5 CD BA 4F      [17] 1349 	call	_getTilePtr
   79A8 F1            [10] 1350 	pop	af
   79A9 F1            [10] 1351 	pop	af
   79AA C1            [10] 1352 	pop	bc
   79AB 5E            [ 7] 1353 	ld	e,(hl)
   79AC 3E 02         [ 7] 1354 	ld	a,#0x02
   79AE 93            [ 4] 1355 	sub	a, e
   79AF DA 2F 7A      [10] 1356 	jp	C,00145$
                           1357 ;src/main.c:277: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   79B2 21 1E 6A      [10] 1358 	ld	hl, #_cu + 0
   79B5 5E            [ 7] 1359 	ld	e,(hl)
   79B6 16 00         [ 7] 1360 	ld	d,#0x00
   79B8 21 02 00      [10] 1361 	ld	hl,#0x0002
   79BB 19            [11] 1362 	add	hl,de
   79BC DD 75 FE      [19] 1363 	ld	-2 (ix),l
   79BF DD 74 FF      [19] 1364 	ld	-1 (ix),h
   79C2 0A            [ 7] 1365 	ld	a,(bc)
   79C3 6F            [ 4] 1366 	ld	l,a
   79C4 26 00         [ 7] 1367 	ld	h,#0x00
   79C6 DD 7E FE      [19] 1368 	ld	a,-2 (ix)
   79C9 95            [ 4] 1369 	sub	a, l
   79CA DD 7E FF      [19] 1370 	ld	a,-1 (ix)
   79CD 9C            [ 4] 1371 	sbc	a, h
   79CE E2 D3 79      [10] 1372 	jp	PO, 00275$
   79D1 EE 80         [ 7] 1373 	xor	a, #0x80
   79D3                    1374 00275$:
   79D3 FA E6 79      [10] 1375 	jp	M,00140$
   79D6 23            [ 6] 1376 	inc	hl
   79D7 23            [ 6] 1377 	inc	hl
   79D8 23            [ 6] 1378 	inc	hl
   79D9 23            [ 6] 1379 	inc	hl
   79DA 7D            [ 4] 1380 	ld	a,l
   79DB 93            [ 4] 1381 	sub	a, e
   79DC 7C            [ 4] 1382 	ld	a,h
   79DD 9A            [ 4] 1383 	sbc	a, d
   79DE E2 E3 79      [10] 1384 	jp	PO, 00276$
   79E1 EE 80         [ 7] 1385 	xor	a, #0x80
   79E3                    1386 00276$:
   79E3 F2 EC 79      [10] 1387 	jp	P,00141$
   79E6                    1388 00140$:
                           1389 ;src/main.c:279: colisiona = 0;
   79E6 DD 36 F7 00   [19] 1390 	ld	-9 (ix),#0x00
   79EA 18 4B         [12] 1391 	jr	00149$
   79EC                    1392 00141$:
                           1393 ;src/main.c:282: if(enemy->y>cu.y){
   79EC DD 6E F8      [19] 1394 	ld	l,-8 (ix)
   79EF DD 66 F9      [19] 1395 	ld	h,-7 (ix)
   79F2 5E            [ 7] 1396 	ld	e,(hl)
   79F3 21 1F 6A      [10] 1397 	ld	hl, #(_cu + 0x0001) + 0
   79F6 6E            [ 7] 1398 	ld	l,(hl)
   79F7 7D            [ 4] 1399 	ld	a,l
   79F8 93            [ 4] 1400 	sub	a, e
   79F9 30 2E         [12] 1401 	jr	NC,00138$
                           1402 ;src/main.c:283: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   79FB 16 00         [ 7] 1403 	ld	d,#0x00
   79FD 26 00         [ 7] 1404 	ld	h,#0x00
   79FF D5            [11] 1405 	push	de
   7A00 11 08 00      [10] 1406 	ld	de,#0x0008
   7A03 19            [11] 1407 	add	hl, de
   7A04 D1            [10] 1408 	pop	de
   7A05 7B            [ 4] 1409 	ld	a,e
   7A06 95            [ 4] 1410 	sub	a, l
   7A07 5F            [ 4] 1411 	ld	e,a
   7A08 7A            [ 4] 1412 	ld	a,d
   7A09 9C            [ 4] 1413 	sbc	a, h
   7A0A 57            [ 4] 1414 	ld	d,a
   7A0B 3E 02         [ 7] 1415 	ld	a,#0x02
   7A0D BB            [ 4] 1416 	cp	a, e
   7A0E 3E 00         [ 7] 1417 	ld	a,#0x00
   7A10 9A            [ 4] 1418 	sbc	a, d
   7A11 E2 16 7A      [10] 1419 	jp	PO, 00277$
   7A14 EE 80         [ 7] 1420 	xor	a, #0x80
   7A16                    1421 00277$:
   7A16 F2 1F 7A      [10] 1422 	jp	P,00135$
                           1423 ;src/main.c:284: colisiona = 0;
   7A19 DD 36 F7 00   [19] 1424 	ld	-9 (ix),#0x00
   7A1D 18 18         [12] 1425 	jr	00149$
   7A1F                    1426 00135$:
                           1427 ;src/main.c:287: enemy->muerto = SI;
   7A1F DD 6E FA      [19] 1428 	ld	l,-6 (ix)
   7A22 DD 66 FB      [19] 1429 	ld	h,-5 (ix)
   7A25 36 01         [10] 1430 	ld	(hl),#0x01
   7A27 18 0E         [12] 1431 	jr	00149$
   7A29                    1432 00138$:
                           1433 ;src/main.c:291: colisiona = 0;
   7A29 DD 36 F7 00   [19] 1434 	ld	-9 (ix),#0x00
   7A2D 18 08         [12] 1435 	jr	00149$
   7A2F                    1436 00145$:
                           1437 ;src/main.c:297: enemy->mira = M_abajo;
   7A2F DD 6E FC      [19] 1438 	ld	l,-4 (ix)
   7A32 DD 66 FD      [19] 1439 	ld	h,-3 (ix)
   7A35 36 03         [10] 1440 	ld	(hl),#0x03
                           1441 ;src/main.c:300: case 3:
   7A37                    1442 00149$:
                           1443 ;src/main.c:303: if( *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7A37 DD 6E F8      [19] 1444 	ld	l,-8 (ix)
   7A3A DD 66 F9      [19] 1445 	ld	h,-7 (ix)
   7A3D 7E            [ 7] 1446 	ld	a,(hl)
   7A3E C6 18         [ 7] 1447 	add	a, #0x18
   7A40 57            [ 4] 1448 	ld	d,a
   7A41 0A            [ 7] 1449 	ld	a,(bc)
   7A42 C5            [11] 1450 	push	bc
   7A43 D5            [11] 1451 	push	de
   7A44 33            [ 6] 1452 	inc	sp
   7A45 F5            [11] 1453 	push	af
   7A46 33            [ 6] 1454 	inc	sp
   7A47 2A CE 72      [16] 1455 	ld	hl,(_mapa)
   7A4A E5            [11] 1456 	push	hl
   7A4B CD BA 4F      [17] 1457 	call	_getTilePtr
   7A4E F1            [10] 1458 	pop	af
   7A4F F1            [10] 1459 	pop	af
   7A50 C1            [10] 1460 	pop	bc
   7A51 5E            [ 7] 1461 	ld	e,(hl)
   7A52 3E 02         [ 7] 1462 	ld	a,#0x02
   7A54 93            [ 4] 1463 	sub	a, e
   7A55 DA 18 7B      [10] 1464 	jp	C,00161$
                           1465 ;src/main.c:304: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7A58 DD 6E F8      [19] 1466 	ld	l,-8 (ix)
   7A5B DD 66 F9      [19] 1467 	ld	h,-7 (ix)
   7A5E 7E            [ 7] 1468 	ld	a,(hl)
   7A5F C6 18         [ 7] 1469 	add	a, #0x18
   7A61 57            [ 4] 1470 	ld	d,a
   7A62 0A            [ 7] 1471 	ld	a,(bc)
   7A63 C6 02         [ 7] 1472 	add	a, #0x02
   7A65 C5            [11] 1473 	push	bc
   7A66 D5            [11] 1474 	push	de
   7A67 33            [ 6] 1475 	inc	sp
   7A68 F5            [11] 1476 	push	af
   7A69 33            [ 6] 1477 	inc	sp
   7A6A 2A CE 72      [16] 1478 	ld	hl,(_mapa)
   7A6D E5            [11] 1479 	push	hl
   7A6E CD BA 4F      [17] 1480 	call	_getTilePtr
   7A71 F1            [10] 1481 	pop	af
   7A72 F1            [10] 1482 	pop	af
   7A73 C1            [10] 1483 	pop	bc
   7A74 5E            [ 7] 1484 	ld	e,(hl)
   7A75 3E 02         [ 7] 1485 	ld	a,#0x02
   7A77 93            [ 4] 1486 	sub	a, e
   7A78 DA 18 7B      [10] 1487 	jp	C,00161$
                           1488 ;src/main.c:305: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   7A7B DD 6E F8      [19] 1489 	ld	l,-8 (ix)
   7A7E DD 66 F9      [19] 1490 	ld	h,-7 (ix)
   7A81 7E            [ 7] 1491 	ld	a,(hl)
   7A82 C6 18         [ 7] 1492 	add	a, #0x18
   7A84 57            [ 4] 1493 	ld	d,a
   7A85 0A            [ 7] 1494 	ld	a,(bc)
   7A86 C6 04         [ 7] 1495 	add	a, #0x04
   7A88 C5            [11] 1496 	push	bc
   7A89 D5            [11] 1497 	push	de
   7A8A 33            [ 6] 1498 	inc	sp
   7A8B F5            [11] 1499 	push	af
   7A8C 33            [ 6] 1500 	inc	sp
   7A8D 2A CE 72      [16] 1501 	ld	hl,(_mapa)
   7A90 E5            [11] 1502 	push	hl
   7A91 CD BA 4F      [17] 1503 	call	_getTilePtr
   7A94 F1            [10] 1504 	pop	af
   7A95 F1            [10] 1505 	pop	af
   7A96 C1            [10] 1506 	pop	bc
   7A97 5E            [ 7] 1507 	ld	e,(hl)
   7A98 3E 02         [ 7] 1508 	ld	a,#0x02
   7A9A 93            [ 4] 1509 	sub	a, e
   7A9B 38 7B         [12] 1510 	jr	C,00161$
                           1511 ;src/main.c:307: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   7A9D 21 1E 6A      [10] 1512 	ld	hl, #_cu + 0
   7AA0 5E            [ 7] 1513 	ld	e,(hl)
   7AA1 16 00         [ 7] 1514 	ld	d,#0x00
   7AA3 21 02 00      [10] 1515 	ld	hl,#0x0002
   7AA6 19            [11] 1516 	add	hl,de
   7AA7 DD 75 FE      [19] 1517 	ld	-2 (ix),l
   7AAA DD 74 FF      [19] 1518 	ld	-1 (ix),h
   7AAD 0A            [ 7] 1519 	ld	a,(bc)
   7AAE 4F            [ 4] 1520 	ld	c,a
   7AAF 06 00         [ 7] 1521 	ld	b,#0x00
   7AB1 DD 7E FE      [19] 1522 	ld	a,-2 (ix)
   7AB4 91            [ 4] 1523 	sub	a, c
   7AB5 DD 7E FF      [19] 1524 	ld	a,-1 (ix)
   7AB8 98            [ 4] 1525 	sbc	a, b
   7AB9 E2 BE 7A      [10] 1526 	jp	PO, 00278$
   7ABC EE 80         [ 7] 1527 	xor	a, #0x80
   7ABE                    1528 00278$:
   7ABE FA D1 7A      [10] 1529 	jp	M,00156$
   7AC1 03            [ 6] 1530 	inc	bc
   7AC2 03            [ 6] 1531 	inc	bc
   7AC3 03            [ 6] 1532 	inc	bc
   7AC4 03            [ 6] 1533 	inc	bc
   7AC5 79            [ 4] 1534 	ld	a,c
   7AC6 93            [ 4] 1535 	sub	a, e
   7AC7 78            [ 4] 1536 	ld	a,b
   7AC8 9A            [ 4] 1537 	sbc	a, d
   7AC9 E2 CE 7A      [10] 1538 	jp	PO, 00279$
   7ACC EE 80         [ 7] 1539 	xor	a, #0x80
   7ACE                    1540 00279$:
   7ACE F2 D7 7A      [10] 1541 	jp	P,00157$
   7AD1                    1542 00156$:
                           1543 ;src/main.c:308: colisiona = 0;
   7AD1 DD 36 F7 00   [19] 1544 	ld	-9 (ix),#0x00
   7AD5 18 49         [12] 1545 	jr	00165$
   7AD7                    1546 00157$:
                           1547 ;src/main.c:311: if(cu.y > enemy->y){ //si el cu esta abajo
   7AD7 21 1F 6A      [10] 1548 	ld	hl, #(_cu + 0x0001) + 0
   7ADA 4E            [ 7] 1549 	ld	c,(hl)
   7ADB DD 6E F8      [19] 1550 	ld	l,-8 (ix)
   7ADE DD 66 F9      [19] 1551 	ld	h,-7 (ix)
   7AE1 5E            [ 7] 1552 	ld	e,(hl)
   7AE2 7B            [ 4] 1553 	ld	a,e
   7AE3 91            [ 4] 1554 	sub	a, c
   7AE4 30 2C         [12] 1555 	jr	NC,00154$
                           1556 ;src/main.c:312: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   7AE6 06 00         [ 7] 1557 	ld	b,#0x00
   7AE8 16 00         [ 7] 1558 	ld	d,#0x00
   7AEA 21 16 00      [10] 1559 	ld	hl,#0x0016
   7AED 19            [11] 1560 	add	hl,de
   7AEE 79            [ 4] 1561 	ld	a,c
   7AEF 95            [ 4] 1562 	sub	a, l
   7AF0 4F            [ 4] 1563 	ld	c,a
   7AF1 78            [ 4] 1564 	ld	a,b
   7AF2 9C            [ 4] 1565 	sbc	a, h
   7AF3 47            [ 4] 1566 	ld	b,a
   7AF4 3E 02         [ 7] 1567 	ld	a,#0x02
   7AF6 B9            [ 4] 1568 	cp	a, c
   7AF7 3E 00         [ 7] 1569 	ld	a,#0x00
   7AF9 98            [ 4] 1570 	sbc	a, b
   7AFA E2 FF 7A      [10] 1571 	jp	PO, 00280$
   7AFD EE 80         [ 7] 1572 	xor	a, #0x80
   7AFF                    1573 00280$:
   7AFF F2 08 7B      [10] 1574 	jp	P,00151$
                           1575 ;src/main.c:313: colisiona = 0;
   7B02 DD 36 F7 00   [19] 1576 	ld	-9 (ix),#0x00
   7B06 18 18         [12] 1577 	jr	00165$
   7B08                    1578 00151$:
                           1579 ;src/main.c:316: enemy->muerto = SI;
   7B08 DD 6E FA      [19] 1580 	ld	l,-6 (ix)
   7B0B DD 66 FB      [19] 1581 	ld	h,-5 (ix)
   7B0E 36 01         [10] 1582 	ld	(hl),#0x01
   7B10 18 0E         [12] 1583 	jr	00165$
   7B12                    1584 00154$:
                           1585 ;src/main.c:320: colisiona = 0;
   7B12 DD 36 F7 00   [19] 1586 	ld	-9 (ix),#0x00
   7B16 18 08         [12] 1587 	jr	00165$
   7B18                    1588 00161$:
                           1589 ;src/main.c:324: enemy->mira = M_arriba;
   7B18 DD 6E FC      [19] 1590 	ld	l,-4 (ix)
   7B1B DD 66 FD      [19] 1591 	ld	h,-3 (ix)
   7B1E 36 02         [10] 1592 	ld	(hl),#0x02
                           1593 ;src/main.c:327: }
   7B20                    1594 00165$:
                           1595 ;src/main.c:328: return colisiona;
   7B20 DD 6E F7      [19] 1596 	ld	l,-9 (ix)
   7B23 DD F9         [10] 1597 	ld	sp, ix
   7B25 DD E1         [14] 1598 	pop	ix
   7B27 C9            [10] 1599 	ret
                           1600 ;src/main.c:331: void moverEnemigoArriba(TEnemy *enemy){
                           1601 ;	---------------------------------
                           1602 ; Function moverEnemigoArriba
                           1603 ; ---------------------------------
   7B28                    1604 _moverEnemigoArriba::
   7B28 DD E5         [15] 1605 	push	ix
   7B2A DD 21 00 00   [14] 1606 	ld	ix,#0
   7B2E DD 39         [15] 1607 	add	ix,sp
                           1608 ;src/main.c:332: enemy->y--;
   7B30 DD 4E 04      [19] 1609 	ld	c,4 (ix)
   7B33 DD 46 05      [19] 1610 	ld	b,5 (ix)
   7B36 69            [ 4] 1611 	ld	l, c
   7B37 60            [ 4] 1612 	ld	h, b
   7B38 23            [ 6] 1613 	inc	hl
   7B39 5E            [ 7] 1614 	ld	e,(hl)
   7B3A 1D            [ 4] 1615 	dec	e
   7B3B 73            [ 7] 1616 	ld	(hl),e
                           1617 ;src/main.c:333: enemy->y--;
   7B3C 1D            [ 4] 1618 	dec	e
   7B3D 73            [ 7] 1619 	ld	(hl),e
                           1620 ;src/main.c:334: enemy->mover = SI;
   7B3E 21 06 00      [10] 1621 	ld	hl,#0x0006
   7B41 09            [11] 1622 	add	hl,bc
   7B42 36 01         [10] 1623 	ld	(hl),#0x01
   7B44 DD E1         [14] 1624 	pop	ix
   7B46 C9            [10] 1625 	ret
                           1626 ;src/main.c:337: void moverEnemigoAbajo(TEnemy *enemy){
                           1627 ;	---------------------------------
                           1628 ; Function moverEnemigoAbajo
                           1629 ; ---------------------------------
   7B47                    1630 _moverEnemigoAbajo::
   7B47 DD E5         [15] 1631 	push	ix
   7B49 DD 21 00 00   [14] 1632 	ld	ix,#0
   7B4D DD 39         [15] 1633 	add	ix,sp
                           1634 ;src/main.c:338: enemy->y++;
   7B4F DD 4E 04      [19] 1635 	ld	c,4 (ix)
   7B52 DD 46 05      [19] 1636 	ld	b,5 (ix)
   7B55 59            [ 4] 1637 	ld	e, c
   7B56 50            [ 4] 1638 	ld	d, b
   7B57 13            [ 6] 1639 	inc	de
   7B58 1A            [ 7] 1640 	ld	a,(de)
   7B59 3C            [ 4] 1641 	inc	a
   7B5A 12            [ 7] 1642 	ld	(de),a
                           1643 ;src/main.c:339: enemy->y++;
   7B5B 3C            [ 4] 1644 	inc	a
   7B5C 12            [ 7] 1645 	ld	(de),a
                           1646 ;src/main.c:340: enemy->mover = SI;
   7B5D 21 06 00      [10] 1647 	ld	hl,#0x0006
   7B60 09            [11] 1648 	add	hl,bc
   7B61 36 01         [10] 1649 	ld	(hl),#0x01
   7B63 DD E1         [14] 1650 	pop	ix
   7B65 C9            [10] 1651 	ret
                           1652 ;src/main.c:343: void moverEnemigoDerecha(TEnemy *enemy){
                           1653 ;	---------------------------------
                           1654 ; Function moverEnemigoDerecha
                           1655 ; ---------------------------------
   7B66                    1656 _moverEnemigoDerecha::
                           1657 ;src/main.c:344: enemy->x++;
   7B66 D1            [10] 1658 	pop	de
   7B67 C1            [10] 1659 	pop	bc
   7B68 C5            [11] 1660 	push	bc
   7B69 D5            [11] 1661 	push	de
   7B6A 0A            [ 7] 1662 	ld	a,(bc)
   7B6B 3C            [ 4] 1663 	inc	a
   7B6C 02            [ 7] 1664 	ld	(bc),a
                           1665 ;src/main.c:345: enemy->x++;
   7B6D 3C            [ 4] 1666 	inc	a
   7B6E 02            [ 7] 1667 	ld	(bc),a
                           1668 ;src/main.c:346: enemy->mover = SI;
   7B6F 21 06 00      [10] 1669 	ld	hl,#0x0006
   7B72 09            [11] 1670 	add	hl,bc
   7B73 36 01         [10] 1671 	ld	(hl),#0x01
   7B75 C9            [10] 1672 	ret
                           1673 ;src/main.c:349: void moverEnemigoIzquierda(TEnemy *enemy){
                           1674 ;	---------------------------------
                           1675 ; Function moverEnemigoIzquierda
                           1676 ; ---------------------------------
   7B76                    1677 _moverEnemigoIzquierda::
                           1678 ;src/main.c:350: enemy->x--;
   7B76 D1            [10] 1679 	pop	de
   7B77 C1            [10] 1680 	pop	bc
   7B78 C5            [11] 1681 	push	bc
   7B79 D5            [11] 1682 	push	de
   7B7A 0A            [ 7] 1683 	ld	a,(bc)
   7B7B C6 FF         [ 7] 1684 	add	a,#0xFF
   7B7D 02            [ 7] 1685 	ld	(bc),a
                           1686 ;src/main.c:351: enemy->x--;
   7B7E C6 FF         [ 7] 1687 	add	a,#0xFF
   7B80 02            [ 7] 1688 	ld	(bc),a
                           1689 ;src/main.c:352: enemy->mover = SI;
   7B81 21 06 00      [10] 1690 	ld	hl,#0x0006
   7B84 09            [11] 1691 	add	hl,bc
   7B85 36 01         [10] 1692 	ld	(hl),#0x01
   7B87 C9            [10] 1693 	ret
                           1694 ;src/main.c:355: void moverEnemigo(TEnemy *enemy){
                           1695 ;	---------------------------------
                           1696 ; Function moverEnemigo
                           1697 ; ---------------------------------
   7B88                    1698 _moverEnemigo::
                           1699 ;src/main.c:356: if(!enemy->muerto){
   7B88 D1            [10] 1700 	pop	de
   7B89 C1            [10] 1701 	pop	bc
   7B8A C5            [11] 1702 	push	bc
   7B8B D5            [11] 1703 	push	de
   7B8C C5            [11] 1704 	push	bc
   7B8D FD E1         [14] 1705 	pop	iy
   7B8F FD 7E 08      [19] 1706 	ld	a,8 (iy)
   7B92 B7            [ 4] 1707 	or	a, a
   7B93 C0            [11] 1708 	ret	NZ
                           1709 ;src/main.c:357: if(!checkEnemyCollision(enemy->mira, enemy)){
   7B94 21 07 00      [10] 1710 	ld	hl,#0x0007
   7B97 09            [11] 1711 	add	hl,bc
   7B98 56            [ 7] 1712 	ld	d,(hl)
   7B99 E5            [11] 1713 	push	hl
   7B9A C5            [11] 1714 	push	bc
   7B9B C5            [11] 1715 	push	bc
   7B9C D5            [11] 1716 	push	de
   7B9D 33            [ 6] 1717 	inc	sp
   7B9E CD 2D 77      [17] 1718 	call	_checkEnemyCollision
   7BA1 F1            [10] 1719 	pop	af
   7BA2 33            [ 6] 1720 	inc	sp
   7BA3 7D            [ 4] 1721 	ld	a,l
   7BA4 C1            [10] 1722 	pop	bc
   7BA5 E1            [10] 1723 	pop	hl
   7BA6 B7            [ 4] 1724 	or	a, a
   7BA7 C0            [11] 1725 	ret	NZ
                           1726 ;src/main.c:359: switch (enemy->mira) {
   7BA8 5E            [ 7] 1727 	ld	e,(hl)
   7BA9 3E 03         [ 7] 1728 	ld	a,#0x03
   7BAB 93            [ 4] 1729 	sub	a, e
   7BAC D8            [11] 1730 	ret	C
   7BAD 16 00         [ 7] 1731 	ld	d,#0x00
   7BAF 21 B5 7B      [10] 1732 	ld	hl,#00124$
   7BB2 19            [11] 1733 	add	hl,de
   7BB3 19            [11] 1734 	add	hl,de
                           1735 ;src/main.c:361: case 0:
   7BB4 E9            [ 4] 1736 	jp	(hl)
   7BB5                    1737 00124$:
   7BB5 18 06         [12] 1738 	jr	00101$
   7BB7 18 0A         [12] 1739 	jr	00102$
   7BB9 18 0E         [12] 1740 	jr	00103$
   7BBB 18 12         [12] 1741 	jr	00104$
   7BBD                    1742 00101$:
                           1743 ;src/main.c:362: moverEnemigoDerecha(enemy);
   7BBD C5            [11] 1744 	push	bc
   7BBE CD 66 7B      [17] 1745 	call	_moverEnemigoDerecha
   7BC1 F1            [10] 1746 	pop	af
                           1747 ;src/main.c:363: break;
   7BC2 C9            [10] 1748 	ret
                           1749 ;src/main.c:364: case 1:
   7BC3                    1750 00102$:
                           1751 ;src/main.c:365: moverEnemigoIzquierda(enemy);
   7BC3 C5            [11] 1752 	push	bc
   7BC4 CD 76 7B      [17] 1753 	call	_moverEnemigoIzquierda
   7BC7 F1            [10] 1754 	pop	af
                           1755 ;src/main.c:366: break;
   7BC8 C9            [10] 1756 	ret
                           1757 ;src/main.c:367: case 2:
   7BC9                    1758 00103$:
                           1759 ;src/main.c:368: moverEnemigoArriba(enemy);
   7BC9 C5            [11] 1760 	push	bc
   7BCA CD 28 7B      [17] 1761 	call	_moverEnemigoArriba
   7BCD F1            [10] 1762 	pop	af
                           1763 ;src/main.c:369: break;
   7BCE C9            [10] 1764 	ret
                           1765 ;src/main.c:370: case 3:
   7BCF                    1766 00104$:
                           1767 ;src/main.c:371: moverEnemigoAbajo(enemy);
   7BCF C5            [11] 1768 	push	bc
   7BD0 CD 47 7B      [17] 1769 	call	_moverEnemigoAbajo
   7BD3 F1            [10] 1770 	pop	af
                           1771 ;src/main.c:373: }
   7BD4 C9            [10] 1772 	ret
                           1773 ;src/main.c:378: void moverEnemigoPatrol(TEnemy *enemy){
                           1774 ;	---------------------------------
                           1775 ; Function moverEnemigoPatrol
                           1776 ; ---------------------------------
   7BD5                    1777 _moverEnemigoPatrol::
   7BD5 DD E5         [15] 1778 	push	ix
   7BD7 DD 21 00 00   [14] 1779 	ld	ix,#0
   7BDB DD 39         [15] 1780 	add	ix,sp
   7BDD 21 F3 FF      [10] 1781 	ld	hl,#-13
   7BE0 39            [11] 1782 	add	hl,sp
   7BE1 F9            [ 6] 1783 	ld	sp,hl
                           1784 ;src/main.c:379: if(!enemy->muerto){
   7BE2 DD 4E 04      [19] 1785 	ld	c,4 (ix)
   7BE5 DD 46 05      [19] 1786 	ld	b,5 (ix)
   7BE8 C5            [11] 1787 	push	bc
   7BE9 FD E1         [14] 1788 	pop	iy
   7BEB FD 7E 08      [19] 1789 	ld	a,8 (iy)
   7BEE B7            [ 4] 1790 	or	a, a
   7BEF C2 FF 7C      [10] 1791 	jp	NZ,00112$
                           1792 ;src/main.c:381: if (!enemy->reversePatrol) {
   7BF2 21 0D 00      [10] 1793 	ld	hl,#0x000D
   7BF5 09            [11] 1794 	add	hl,bc
   7BF6 DD 75 FA      [19] 1795 	ld	-6 (ix),l
   7BF9 DD 74 FB      [19] 1796 	ld	-5 (ix),h
   7BFC DD 6E FA      [19] 1797 	ld	l,-6 (ix)
   7BFF DD 66 FB      [19] 1798 	ld	h,-5 (ix)
   7C02 7E            [ 7] 1799 	ld	a,(hl)
   7C03 DD 77 F9      [19] 1800 	ld	-7 (ix),a
                           1801 ;src/main.c:382: if(enemy->iter < enemy->longitud_camino - 8){
   7C06 21 0F 00      [10] 1802 	ld	hl,#0x000F
   7C09 09            [11] 1803 	add	hl,bc
   7C0A EB            [ 4] 1804 	ex	de,hl
                           1805 ;src/main.c:383: enemy->x = enemy->camino[enemy->iter];
   7C0B 21 19 00      [10] 1806 	ld	hl,#0x0019
   7C0E 09            [11] 1807 	add	hl,bc
   7C0F DD 75 F7      [19] 1808 	ld	-9 (ix),l
   7C12 DD 74 F8      [19] 1809 	ld	-8 (ix),h
                           1810 ;src/main.c:385: enemy->y = enemy->camino[enemy->iter];
   7C15 21 01 00      [10] 1811 	ld	hl,#0x0001
   7C18 09            [11] 1812 	add	hl,bc
   7C19 DD 75 F5      [19] 1813 	ld	-11 (ix),l
   7C1C DD 74 F6      [19] 1814 	ld	-10 (ix),h
                           1815 ;src/main.c:387: enemy->mover = SI;
   7C1F 21 06 00      [10] 1816 	ld	hl,#0x0006
   7C22 09            [11] 1817 	add	hl,bc
   7C23 E3            [19] 1818 	ex	(sp), hl
                           1819 ;src/main.c:390: enemy->lastIter = enemy->iter - 1;
   7C24 21 10 00      [10] 1820 	ld	hl,#0x0010
   7C27 09            [11] 1821 	add	hl,bc
   7C28 DD 75 FE      [19] 1822 	ld	-2 (ix),l
   7C2B DD 74 FF      [19] 1823 	ld	-1 (ix),h
                           1824 ;src/main.c:381: if (!enemy->reversePatrol) {
   7C2E DD 7E F9      [19] 1825 	ld	a,-7 (ix)
   7C31 B7            [ 4] 1826 	or	a, a
   7C32 20 78         [12] 1827 	jr	NZ,00108$
                           1828 ;src/main.c:382: if(enemy->iter < enemy->longitud_camino - 8){
   7C34 1A            [ 7] 1829 	ld	a,(de)
   7C35 DD 77 F9      [19] 1830 	ld	-7 (ix),a
   7C38 69            [ 4] 1831 	ld	l, c
   7C39 60            [ 4] 1832 	ld	h, b
   7C3A C5            [11] 1833 	push	bc
   7C3B 01 45 01      [10] 1834 	ld	bc, #0x0145
   7C3E 09            [11] 1835 	add	hl, bc
   7C3F C1            [10] 1836 	pop	bc
   7C40 6E            [ 7] 1837 	ld	l,(hl)
   7C41 26 00         [ 7] 1838 	ld	h,#0x00
   7C43 7D            [ 4] 1839 	ld	a,l
   7C44 C6 F8         [ 7] 1840 	add	a,#0xF8
   7C46 DD 77 FC      [19] 1841 	ld	-4 (ix),a
   7C49 7C            [ 4] 1842 	ld	a,h
   7C4A CE FF         [ 7] 1843 	adc	a,#0xFF
   7C4C DD 77 FD      [19] 1844 	ld	-3 (ix),a
   7C4F DD 7E F9      [19] 1845 	ld	a, -7 (ix)
   7C52 26 00         [ 7] 1846 	ld	h, #0x00
   7C54 DD 96 FC      [19] 1847 	sub	a, -4 (ix)
   7C57 7C            [ 4] 1848 	ld	a,h
   7C58 DD 9E FD      [19] 1849 	sbc	a, -3 (ix)
   7C5B E2 60 7C      [10] 1850 	jp	PO, 00130$
   7C5E EE 80         [ 7] 1851 	xor	a, #0x80
   7C60                    1852 00130$:
   7C60 F2 97 7C      [10] 1853 	jp	P,00102$
                           1854 ;src/main.c:383: enemy->x = enemy->camino[enemy->iter];
   7C63 DD 6E F9      [19] 1855 	ld	l,-7 (ix)
   7C66 26 00         [ 7] 1856 	ld	h,#0x00
   7C68 DD 7E F7      [19] 1857 	ld	a,-9 (ix)
   7C6B 85            [ 4] 1858 	add	a, l
   7C6C 6F            [ 4] 1859 	ld	l,a
   7C6D DD 7E F8      [19] 1860 	ld	a,-8 (ix)
   7C70 8C            [ 4] 1861 	adc	a, h
   7C71 67            [ 4] 1862 	ld	h,a
   7C72 7E            [ 7] 1863 	ld	a,(hl)
   7C73 02            [ 7] 1864 	ld	(bc),a
                           1865 ;src/main.c:384: enemy->iter++;
   7C74 1A            [ 7] 1866 	ld	a,(de)
   7C75 4F            [ 4] 1867 	ld	c,a
   7C76 0C            [ 4] 1868 	inc	c
   7C77 79            [ 4] 1869 	ld	a,c
   7C78 12            [ 7] 1870 	ld	(de),a
                           1871 ;src/main.c:385: enemy->y = enemy->camino[enemy->iter];
   7C79 69            [ 4] 1872 	ld	l,c
   7C7A 26 00         [ 7] 1873 	ld	h,#0x00
   7C7C DD 7E F7      [19] 1874 	ld	a,-9 (ix)
   7C7F 85            [ 4] 1875 	add	a, l
   7C80 6F            [ 4] 1876 	ld	l,a
   7C81 DD 7E F8      [19] 1877 	ld	a,-8 (ix)
   7C84 8C            [ 4] 1878 	adc	a, h
   7C85 67            [ 4] 1879 	ld	h,a
   7C86 46            [ 7] 1880 	ld	b,(hl)
   7C87 DD 6E F5      [19] 1881 	ld	l,-11 (ix)
   7C8A DD 66 F6      [19] 1882 	ld	h,-10 (ix)
   7C8D 70            [ 7] 1883 	ld	(hl),b
                           1884 ;src/main.c:386: enemy->iter++;
   7C8E 0C            [ 4] 1885 	inc	c
   7C8F 79            [ 4] 1886 	ld	a,c
   7C90 12            [ 7] 1887 	ld	(de),a
                           1888 ;src/main.c:387: enemy->mover = SI;
   7C91 E1            [10] 1889 	pop	hl
   7C92 E5            [11] 1890 	push	hl
   7C93 36 01         [10] 1891 	ld	(hl),#0x01
   7C95 18 68         [12] 1892 	jr	00112$
   7C97                    1893 00102$:
                           1894 ;src/main.c:390: enemy->lastIter = enemy->iter - 1;
   7C97 DD 4E F9      [19] 1895 	ld	c,-7 (ix)
   7C9A 0D            [ 4] 1896 	dec	c
   7C9B DD 6E FE      [19] 1897 	ld	l,-2 (ix)
   7C9E DD 66 FF      [19] 1898 	ld	h,-1 (ix)
   7CA1 71            [ 7] 1899 	ld	(hl),c
                           1900 ;src/main.c:393: enemy->reversePatrol = 1;
   7CA2 DD 6E FA      [19] 1901 	ld	l,-6 (ix)
   7CA5 DD 66 FB      [19] 1902 	ld	h,-5 (ix)
   7CA8 36 01         [10] 1903 	ld	(hl),#0x01
   7CAA 18 53         [12] 1904 	jr	00112$
   7CAC                    1905 00108$:
                           1906 ;src/main.c:396: if(enemy->lastIter > 1){
   7CAC DD 6E FE      [19] 1907 	ld	l,-2 (ix)
   7CAF DD 66 FF      [19] 1908 	ld	h,-1 (ix)
   7CB2 6E            [ 7] 1909 	ld	l,(hl)
   7CB3 3E 01         [ 7] 1910 	ld	a,#0x01
   7CB5 95            [ 4] 1911 	sub	a, l
   7CB6 30 3D         [12] 1912 	jr	NC,00105$
                           1913 ;src/main.c:397: enemy->y = enemy->camino[enemy->lastIter];
   7CB8 26 00         [ 7] 1914 	ld	h,#0x00
   7CBA DD 5E F7      [19] 1915 	ld	e,-9 (ix)
   7CBD DD 56 F8      [19] 1916 	ld	d,-8 (ix)
   7CC0 19            [11] 1917 	add	hl,de
   7CC1 5E            [ 7] 1918 	ld	e,(hl)
   7CC2 DD 6E F5      [19] 1919 	ld	l,-11 (ix)
   7CC5 DD 66 F6      [19] 1920 	ld	h,-10 (ix)
   7CC8 73            [ 7] 1921 	ld	(hl),e
                           1922 ;src/main.c:398: enemy->lastIter--;
   7CC9 DD 6E FE      [19] 1923 	ld	l,-2 (ix)
   7CCC DD 66 FF      [19] 1924 	ld	h,-1 (ix)
   7CCF 5E            [ 7] 1925 	ld	e,(hl)
   7CD0 1D            [ 4] 1926 	dec	e
   7CD1 DD 6E FE      [19] 1927 	ld	l,-2 (ix)
   7CD4 DD 66 FF      [19] 1928 	ld	h,-1 (ix)
   7CD7 73            [ 7] 1929 	ld	(hl),e
                           1930 ;src/main.c:399: enemy->x = enemy->camino[enemy->lastIter];
   7CD8 6B            [ 4] 1931 	ld	l,e
   7CD9 26 00         [ 7] 1932 	ld	h,#0x00
   7CDB DD 7E F7      [19] 1933 	ld	a,-9 (ix)
   7CDE 85            [ 4] 1934 	add	a, l
   7CDF 6F            [ 4] 1935 	ld	l,a
   7CE0 DD 7E F8      [19] 1936 	ld	a,-8 (ix)
   7CE3 8C            [ 4] 1937 	adc	a, h
   7CE4 67            [ 4] 1938 	ld	h,a
   7CE5 7E            [ 7] 1939 	ld	a,(hl)
   7CE6 02            [ 7] 1940 	ld	(bc),a
                           1941 ;src/main.c:400: enemy->lastIter--;
   7CE7 1D            [ 4] 1942 	dec	e
   7CE8 DD 6E FE      [19] 1943 	ld	l,-2 (ix)
   7CEB DD 66 FF      [19] 1944 	ld	h,-1 (ix)
   7CEE 73            [ 7] 1945 	ld	(hl),e
                           1946 ;src/main.c:401: enemy->mover = SI;
   7CEF E1            [10] 1947 	pop	hl
   7CF0 E5            [11] 1948 	push	hl
   7CF1 36 01         [10] 1949 	ld	(hl),#0x01
   7CF3 18 0A         [12] 1950 	jr	00112$
   7CF5                    1951 00105$:
                           1952 ;src/main.c:404: enemy->iter = 0;
   7CF5 AF            [ 4] 1953 	xor	a, a
   7CF6 12            [ 7] 1954 	ld	(de),a
                           1955 ;src/main.c:406: enemy->reversePatrol = 0;
   7CF7 DD 6E FA      [19] 1956 	ld	l,-6 (ix)
   7CFA DD 66 FB      [19] 1957 	ld	h,-5 (ix)
   7CFD 36 00         [10] 1958 	ld	(hl),#0x00
   7CFF                    1959 00112$:
   7CFF DD F9         [10] 1960 	ld	sp, ix
   7D01 DD E1         [14] 1961 	pop	ix
   7D03 C9            [10] 1962 	ret
                           1963 ;src/main.c:415: void lookFor(TEnemy* enemy){
                           1964 ;	---------------------------------
                           1965 ; Function lookFor
                           1966 ; ---------------------------------
   7D04                    1967 _lookFor::
   7D04 DD E5         [15] 1968 	push	ix
   7D06 DD 21 00 00   [14] 1969 	ld	ix,#0
   7D0A DD 39         [15] 1970 	add	ix,sp
   7D0C 21 FA FF      [10] 1971 	ld	hl,#-6
   7D0F 39            [11] 1972 	add	hl,sp
   7D10 F9            [ 6] 1973 	ld	sp,hl
                           1974 ;src/main.c:422: u8 difx = abs(enemy->x - prota.x);
   7D11 DD 4E 04      [19] 1975 	ld	c,4 (ix)
   7D14 DD 46 05      [19] 1976 	ld	b,5 (ix)
   7D17 0A            [ 7] 1977 	ld	a,(bc)
   7D18 5F            [ 4] 1978 	ld	e,a
   7D19 16 00         [ 7] 1979 	ld	d,#0x00
   7D1B 21 16 6A      [10] 1980 	ld	hl,#_prota+0
   7D1E 6E            [ 7] 1981 	ld	l,(hl)
   7D1F 26 00         [ 7] 1982 	ld	h,#0x00
   7D21 7B            [ 4] 1983 	ld	a,e
   7D22 95            [ 4] 1984 	sub	a, l
   7D23 5F            [ 4] 1985 	ld	e,a
   7D24 7A            [ 4] 1986 	ld	a,d
   7D25 9C            [ 4] 1987 	sbc	a, h
   7D26 57            [ 4] 1988 	ld	d,a
   7D27 C5            [11] 1989 	push	bc
   7D28 D5            [11] 1990 	push	de
   7D29 CD FE 4F      [17] 1991 	call	_abs
   7D2C F1            [10] 1992 	pop	af
   7D2D C1            [10] 1993 	pop	bc
   7D2E DD 75 FB      [19] 1994 	ld	-5 (ix),l
                           1995 ;src/main.c:423: u8 dify = abs(enemy->y - prota.y);
   7D31 59            [ 4] 1996 	ld	e, c
   7D32 50            [ 4] 1997 	ld	d, b
   7D33 13            [ 6] 1998 	inc	de
   7D34 1A            [ 7] 1999 	ld	a,(de)
   7D35 DD 77 FC      [19] 2000 	ld	-4 (ix),a
   7D38 DD 36 FD 00   [19] 2001 	ld	-3 (ix),#0x00
   7D3C 21 17 6A      [10] 2002 	ld	hl, #(_prota + 0x0001) + 0
   7D3F 6E            [ 7] 2003 	ld	l,(hl)
   7D40 26 00         [ 7] 2004 	ld	h,#0x00
   7D42 DD 7E FC      [19] 2005 	ld	a,-4 (ix)
   7D45 95            [ 4] 2006 	sub	a, l
   7D46 6F            [ 4] 2007 	ld	l,a
   7D47 DD 7E FD      [19] 2008 	ld	a,-3 (ix)
   7D4A 9C            [ 4] 2009 	sbc	a, h
   7D4B 67            [ 4] 2010 	ld	h,a
   7D4C C5            [11] 2011 	push	bc
   7D4D D5            [11] 2012 	push	de
   7D4E E5            [11] 2013 	push	hl
   7D4F CD FE 4F      [17] 2014 	call	_abs
   7D52 F1            [10] 2015 	pop	af
   7D53 D1            [10] 2016 	pop	de
   7D54 C1            [10] 2017 	pop	bc
                           2018 ;src/main.c:424: dist = difx + dify; // manhattan
   7D55 DD 7E FB      [19] 2019 	ld	a,-5 (ix)
   7D58 85            [ 4] 2020 	add	a, l
   7D59 DD 77 FA      [19] 2021 	ld	-6 (ix),a
                           2022 ;src/main.c:426: enemy->seen = NO;
   7D5C 21 12 00      [10] 2023 	ld	hl,#0x0012
   7D5F 09            [11] 2024 	add	hl,bc
   7D60 DD 75 FC      [19] 2025 	ld	-4 (ix),l
   7D63 DD 74 FD      [19] 2026 	ld	-3 (ix),h
   7D66 DD 6E FC      [19] 2027 	ld	l,-4 (ix)
   7D69 DD 66 FD      [19] 2028 	ld	h,-3 (ix)
   7D6C 36 00         [10] 2029 	ld	(hl),#0x00
                           2030 ;src/main.c:427: enemy->inRange = NO;
   7D6E 21 11 00      [10] 2031 	ld	hl,#0x0011
   7D71 09            [11] 2032 	add	hl,bc
   7D72 DD 75 FE      [19] 2033 	ld	-2 (ix),l
   7D75 DD 74 FF      [19] 2034 	ld	-1 (ix),h
   7D78 DD 6E FE      [19] 2035 	ld	l,-2 (ix)
   7D7B DD 66 FF      [19] 2036 	ld	h,-1 (ix)
   7D7E 36 00         [10] 2037 	ld	(hl),#0x00
                           2038 ;src/main.c:429: if (dist <= 10) {// te detectan los sensores de proximidad
   7D80 3E 0A         [ 7] 2039 	ld	a,#0x0A
   7D82 DD 96 FA      [19] 2040 	sub	a, -6 (ix)
   7D85 3E 00         [ 7] 2041 	ld	a,#0x00
   7D87 17            [ 4] 2042 	rla
   7D88 CB 47         [ 8] 2043 	bit	0,a
   7D8A 20 12         [12] 2044 	jr	NZ,00116$
                           2045 ;src/main.c:430: enemy->seen = 1;
   7D8C DD 6E FC      [19] 2046 	ld	l,-4 (ix)
   7D8F DD 66 FD      [19] 2047 	ld	h,-3 (ix)
   7D92 36 01         [10] 2048 	ld	(hl),#0x01
                           2049 ;src/main.c:431: enemy->inRange = 1;
   7D94 DD 6E FE      [19] 2050 	ld	l,-2 (ix)
   7D97 DD 66 FF      [19] 2051 	ld	h,-1 (ix)
   7D9A 36 01         [10] 2052 	ld	(hl),#0x01
   7D9C 18 5B         [12] 2053 	jr	00118$
   7D9E                    2054 00116$:
                           2055 ;src/main.c:432: } else if(dist > 10){
   7D9E CB 47         [ 8] 2056 	bit	0,a
   7DA0 28 57         [12] 2057 	jr	Z,00118$
                           2058 ;src/main.c:433: if(enemy->y > prota.y - 4 && enemy->y < prota.y + 4){
   7DA2 1A            [ 7] 2059 	ld	a,(de)
   7DA3 5F            [ 4] 2060 	ld	e,a
   7DA4 21 17 6A      [10] 2061 	ld	hl, #(_prota + 0x0001) + 0
   7DA7 6E            [ 7] 2062 	ld	l,(hl)
   7DA8 26 00         [ 7] 2063 	ld	h,#0x00
   7DAA 7D            [ 4] 2064 	ld	a,l
   7DAB C6 FC         [ 7] 2065 	add	a,#0xFC
   7DAD DD 77 FE      [19] 2066 	ld	-2 (ix),a
   7DB0 7C            [ 4] 2067 	ld	a,h
   7DB1 CE FF         [ 7] 2068 	adc	a,#0xFF
   7DB3 DD 77 FF      [19] 2069 	ld	-1 (ix),a
   7DB6 16 00         [ 7] 2070 	ld	d,#0x00
   7DB8 DD 7E FE      [19] 2071 	ld	a,-2 (ix)
   7DBB 93            [ 4] 2072 	sub	a, e
   7DBC DD 7E FF      [19] 2073 	ld	a,-1 (ix)
   7DBF 9A            [ 4] 2074 	sbc	a, d
   7DC0 E2 C5 7D      [10] 2075 	jp	PO, 00146$
   7DC3 EE 80         [ 7] 2076 	xor	a, #0x80
   7DC5                    2077 00146$:
   7DC5 F2 F9 7D      [10] 2078 	jp	P,00118$
   7DC8 23            [ 6] 2079 	inc	hl
   7DC9 23            [ 6] 2080 	inc	hl
   7DCA 23            [ 6] 2081 	inc	hl
   7DCB 23            [ 6] 2082 	inc	hl
   7DCC 7B            [ 4] 2083 	ld	a,e
   7DCD 95            [ 4] 2084 	sub	a, l
   7DCE 7A            [ 4] 2085 	ld	a,d
   7DCF 9C            [ 4] 2086 	sbc	a, h
   7DD0 E2 D5 7D      [10] 2087 	jp	PO, 00147$
   7DD3 EE 80         [ 7] 2088 	xor	a, #0x80
   7DD5                    2089 00147$:
   7DD5 F2 F9 7D      [10] 2090 	jp	P,00118$
                           2091 ;src/main.c:434: if(enemy->x > prota.x){
   7DD8 0A            [ 7] 2092 	ld	a,(bc)
   7DD9 4F            [ 4] 2093 	ld	c,a
   7DDA 3A 16 6A      [13] 2094 	ld	a,(#_prota + 0)
   7DDD 91            [ 4] 2095 	sub	a, c
   7DDE 3E 00         [ 7] 2096 	ld	a,#0x00
   7DE0 17            [ 4] 2097 	rla
   7DE1 B7            [ 4] 2098 	or	a, a
   7DE2 28 0A         [12] 2099 	jr	Z,00108$
                           2100 ;src/main.c:442: enemy->seen = SI;
   7DE4 DD 6E FC      [19] 2101 	ld	l,-4 (ix)
   7DE7 DD 66 FD      [19] 2102 	ld	h,-3 (ix)
   7DEA 36 01         [10] 2103 	ld	(hl),#0x01
   7DEC 18 0B         [12] 2104 	jr	00118$
   7DEE                    2105 00108$:
                           2106 ;src/main.c:444: }else if(enemy->x > prota.x){
   7DEE B7            [ 4] 2107 	or	a, a
   7DEF 28 08         [12] 2108 	jr	Z,00118$
                           2109 ;src/main.c:452: enemy->seen = SI;
   7DF1 DD 6E FC      [19] 2110 	ld	l,-4 (ix)
   7DF4 DD 66 FD      [19] 2111 	ld	h,-3 (ix)
   7DF7 36 01         [10] 2112 	ld	(hl),#0x01
   7DF9                    2113 00118$:
   7DF9 DD F9         [10] 2114 	ld	sp, ix
   7DFB DD E1         [14] 2115 	pop	ix
   7DFD C9            [10] 2116 	ret
                           2117 ;src/main.c:459: void moverEnemigoSeek(TEnemy* enemy){
                           2118 ;	---------------------------------
                           2119 ; Function moverEnemigoSeek
                           2120 ; ---------------------------------
   7DFE                    2121 _moverEnemigoSeek::
   7DFE DD E5         [15] 2122 	push	ix
   7E00 DD 21 00 00   [14] 2123 	ld	ix,#0
   7E04 DD 39         [15] 2124 	add	ix,sp
   7E06 F5            [11] 2125 	push	af
   7E07 F5            [11] 2126 	push	af
   7E08 3B            [ 6] 2127 	dec	sp
                           2128 ;src/main.c:460: if(!enemy->muerto){
   7E09 DD 4E 04      [19] 2129 	ld	c,4 (ix)
   7E0C DD 46 05      [19] 2130 	ld	b,5 (ix)
   7E0F C5            [11] 2131 	push	bc
   7E10 FD E1         [14] 2132 	pop	iy
   7E12 FD 7E 08      [19] 2133 	ld	a,8 (iy)
   7E15 B7            [ 4] 2134 	or	a, a
   7E16 C2 F1 7E      [10] 2135 	jp	NZ,00108$
                           2136 ;src/main.c:462: if (!enemy->reversePatrol) {
   7E19 21 0D 00      [10] 2137 	ld	hl,#0x000D
   7E1C 09            [11] 2138 	add	hl,bc
   7E1D EB            [ 4] 2139 	ex	de,hl
   7E1E 1A            [ 7] 2140 	ld	a,(de)
   7E1F B7            [ 4] 2141 	or	a, a
   7E20 C2 F1 7E      [10] 2142 	jp	NZ,00108$
                           2143 ;src/main.c:463: if(enemy->iter < enemy->longitud_camino - 8){
   7E23 FD 21 0F 00   [14] 2144 	ld	iy,#0x000F
   7E27 FD 09         [15] 2145 	add	iy, bc
   7E29 FD 7E 00      [19] 2146 	ld	a, 0 (iy)
   7E2C DD 77 FB      [19] 2147 	ld	-5 (ix),a
   7E2F 69            [ 4] 2148 	ld	l, c
   7E30 60            [ 4] 2149 	ld	h, b
   7E31 C5            [11] 2150 	push	bc
   7E32 01 45 01      [10] 2151 	ld	bc, #0x0145
   7E35 09            [11] 2152 	add	hl, bc
   7E36 C1            [10] 2153 	pop	bc
   7E37 6E            [ 7] 2154 	ld	l,(hl)
   7E38 26 00         [ 7] 2155 	ld	h,#0x00
   7E3A 7D            [ 4] 2156 	ld	a,l
   7E3B C6 F8         [ 7] 2157 	add	a,#0xF8
   7E3D DD 77 FC      [19] 2158 	ld	-4 (ix),a
   7E40 7C            [ 4] 2159 	ld	a,h
   7E41 CE FF         [ 7] 2160 	adc	a,#0xFF
   7E43 DD 77 FD      [19] 2161 	ld	-3 (ix),a
   7E46 DD 6E FB      [19] 2162 	ld	l,-5 (ix)
   7E49 26 00         [ 7] 2163 	ld	h,#0x00
                           2164 ;src/main.c:466: enemy->y = enemy->camino[enemy->iter];
   7E4B 79            [ 4] 2165 	ld	a,c
   7E4C C6 01         [ 7] 2166 	add	a, #0x01
   7E4E DD 77 FE      [19] 2167 	ld	-2 (ix),a
   7E51 78            [ 4] 2168 	ld	a,b
   7E52 CE 00         [ 7] 2169 	adc	a, #0x00
   7E54 DD 77 FF      [19] 2170 	ld	-1 (ix),a
                           2171 ;src/main.c:463: if(enemy->iter < enemy->longitud_camino - 8){
   7E57 7D            [ 4] 2172 	ld	a,l
   7E58 DD 96 FC      [19] 2173 	sub	a, -4 (ix)
   7E5B 7C            [ 4] 2174 	ld	a,h
   7E5C DD 9E FD      [19] 2175 	sbc	a, -3 (ix)
   7E5F E2 64 7E      [10] 2176 	jp	PO, 00122$
   7E62 EE 80         [ 7] 2177 	xor	a, #0x80
   7E64                    2178 00122$:
   7E64 F2 9B 7E      [10] 2179 	jp	P,00102$
                           2180 ;src/main.c:464: enemy->x = enemy->camino[enemy->iter];
   7E67 21 19 00      [10] 2181 	ld	hl,#0x0019
   7E6A 09            [11] 2182 	add	hl,bc
   7E6B EB            [ 4] 2183 	ex	de,hl
   7E6C DD 6E FB      [19] 2184 	ld	l,-5 (ix)
   7E6F 26 00         [ 7] 2185 	ld	h,#0x00
   7E71 19            [11] 2186 	add	hl,de
   7E72 7E            [ 7] 2187 	ld	a,(hl)
   7E73 02            [ 7] 2188 	ld	(bc),a
                           2189 ;src/main.c:465: enemy->iter++;
   7E74 FD 7E 00      [19] 2190 	ld	a, 0 (iy)
   7E77 3C            [ 4] 2191 	inc	a
   7E78 DD 77 FC      [19] 2192 	ld	-4 (ix), a
   7E7B FD 77 00      [19] 2193 	ld	0 (iy), a
                           2194 ;src/main.c:466: enemy->y = enemy->camino[enemy->iter];
   7E7E DD 6E FC      [19] 2195 	ld	l,-4 (ix)
   7E81 26 00         [ 7] 2196 	ld	h,#0x00
   7E83 19            [11] 2197 	add	hl,de
   7E84 5E            [ 7] 2198 	ld	e,(hl)
   7E85 DD 6E FE      [19] 2199 	ld	l,-2 (ix)
   7E88 DD 66 FF      [19] 2200 	ld	h,-1 (ix)
   7E8B 73            [ 7] 2201 	ld	(hl),e
                           2202 ;src/main.c:467: enemy->iter++;
   7E8C DD 5E FC      [19] 2203 	ld	e,-4 (ix)
   7E8F 1C            [ 4] 2204 	inc	e
   7E90 FD 73 00      [19] 2205 	ld	0 (iy), e
                           2206 ;src/main.c:468: enemy->mover = SI;
   7E93 21 06 00      [10] 2207 	ld	hl,#0x0006
   7E96 09            [11] 2208 	add	hl,bc
   7E97 36 01         [10] 2209 	ld	(hl),#0x01
   7E99 18 56         [12] 2210 	jr	00108$
   7E9B                    2211 00102$:
                           2212 ;src/main.c:471: enemy->reversePatrol = NO;
   7E9B AF            [ 4] 2213 	xor	a, a
   7E9C 12            [ 7] 2214 	ld	(de),a
                           2215 ;src/main.c:472: enemy->patrolling = 1;
   7E9D 21 0B 00      [10] 2216 	ld	hl,#0x000B
   7EA0 09            [11] 2217 	add	hl,bc
   7EA1 36 01         [10] 2218 	ld	(hl),#0x01
                           2219 ;src/main.c:473: enemy->onPathPatrol = 1;
   7EA3 21 0C 00      [10] 2220 	ld	hl,#0x000C
   7EA6 09            [11] 2221 	add	hl,bc
   7EA7 36 01         [10] 2222 	ld	(hl),#0x01
                           2223 ;src/main.c:474: enemy->seek = 0;
   7EA9 21 14 00      [10] 2224 	ld	hl,#0x0014
   7EAC 09            [11] 2225 	add	hl,bc
   7EAD 36 00         [10] 2226 	ld	(hl),#0x00
                           2227 ;src/main.c:475: enemy->lastIter = enemy->iter - 1;
   7EAF 21 10 00      [10] 2228 	ld	hl,#0x0010
   7EB2 09            [11] 2229 	add	hl,bc
   7EB3 EB            [ 4] 2230 	ex	de,hl
   7EB4 FD 7E 00      [19] 2231 	ld	a, 0 (iy)
   7EB7 C6 FF         [ 7] 2232 	add	a,#0xFF
   7EB9 12            [ 7] 2233 	ld	(de),a
                           2234 ;src/main.c:476: enemy->iter = 0;
   7EBA FD 36 00 00   [19] 2235 	ld	0 (iy), #0x00
                           2236 ;src/main.c:477: pathFinding(enemy->x, enemy->y, enemy->p_seek_x, enemy->p_seek_y, enemy, mapa);
   7EBE 69            [ 4] 2237 	ld	l, c
   7EBF 60            [ 4] 2238 	ld	h, b
   7EC0 11 18 00      [10] 2239 	ld	de, #0x0018
   7EC3 19            [11] 2240 	add	hl, de
   7EC4 56            [ 7] 2241 	ld	d,(hl)
   7EC5 C5            [11] 2242 	push	bc
   7EC6 FD E1         [14] 2243 	pop	iy
   7EC8 FD 7E 17      [19] 2244 	ld	a,23 (iy)
   7ECB DD 77 FC      [19] 2245 	ld	-4 (ix),a
   7ECE DD 6E FE      [19] 2246 	ld	l,-2 (ix)
   7ED1 DD 66 FF      [19] 2247 	ld	h,-1 (ix)
   7ED4 5E            [ 7] 2248 	ld	e,(hl)
   7ED5 0A            [ 7] 2249 	ld	a,(bc)
   7ED6 DD 77 FE      [19] 2250 	ld	-2 (ix),a
   7ED9 2A CE 72      [16] 2251 	ld	hl,(_mapa)
   7EDC E5            [11] 2252 	push	hl
   7EDD C5            [11] 2253 	push	bc
   7EDE D5            [11] 2254 	push	de
   7EDF 33            [ 6] 2255 	inc	sp
   7EE0 DD 56 FC      [19] 2256 	ld	d, -4 (ix)
   7EE3 D5            [11] 2257 	push	de
   7EE4 DD 7E FE      [19] 2258 	ld	a,-2 (ix)
   7EE7 F5            [11] 2259 	push	af
   7EE8 33            [ 6] 2260 	inc	sp
   7EE9 CD 6F 4C      [17] 2261 	call	_pathFinding
   7EEC 21 08 00      [10] 2262 	ld	hl,#8
   7EEF 39            [11] 2263 	add	hl,sp
   7EF0 F9            [ 6] 2264 	ld	sp,hl
   7EF1                    2265 00108$:
   7EF1 DD F9         [10] 2266 	ld	sp, ix
   7EF3 DD E1         [14] 2267 	pop	ix
   7EF5 C9            [10] 2268 	ret
                           2269 ;src/main.c:484: void patrol(TEnemy *enemy) {
                           2270 ;	---------------------------------
                           2271 ; Function patrol
                           2272 ; ---------------------------------
   7EF6                    2273 _patrol::
                           2274 ;src/main.c:485: if (enemy->onPathPatrol) {
   7EF6 D1            [10] 2275 	pop	de
   7EF7 C1            [10] 2276 	pop	bc
   7EF8 C5            [11] 2277 	push	bc
   7EF9 D5            [11] 2278 	push	de
   7EFA C5            [11] 2279 	push	bc
   7EFB FD E1         [14] 2280 	pop	iy
   7EFD FD 7E 0C      [19] 2281 	ld	a,12 (iy)
   7F00 B7            [ 4] 2282 	or	a, a
   7F01 C8            [11] 2283 	ret	Z
                           2284 ;src/main.c:486: moverEnemigoPatrol(enemy);
   7F02 C5            [11] 2285 	push	bc
   7F03 CD D5 7B      [17] 2286 	call	_moverEnemigoPatrol
   7F06 F1            [10] 2287 	pop	af
   7F07 C9            [10] 2288 	ret
                           2289 ;src/main.c:490: void seek(TEnemy* actual){
                           2290 ;	---------------------------------
                           2291 ; Function seek
                           2292 ; ---------------------------------
   7F08                    2293 _seek::
                           2294 ;src/main.c:491: moverEnemigoSeek(actual);
   7F08 C1            [10] 2295 	pop	bc
   7F09 E1            [10] 2296 	pop	hl
   7F0A E5            [11] 2297 	push	hl
   7F0B C5            [11] 2298 	push	bc
   7F0C E5            [11] 2299 	push	hl
   7F0D CD FE 7D      [17] 2300 	call	_moverEnemigoSeek
   7F10 F1            [10] 2301 	pop	af
   7F11 C9            [10] 2302 	ret
                           2303 ;src/main.c:494: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2304 ;	---------------------------------
                           2305 ; Function engage
                           2306 ; ---------------------------------
   7F12                    2307 _engage::
   7F12 DD E5         [15] 2308 	push	ix
   7F14 DD 21 00 00   [14] 2309 	ld	ix,#0
   7F18 DD 39         [15] 2310 	add	ix,sp
   7F1A 21 F3 FF      [10] 2311 	ld	hl,#-13
   7F1D 39            [11] 2312 	add	hl,sp
   7F1E F9            [ 6] 2313 	ld	sp,hl
                           2314 ;src/main.c:495: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7F1F DD 7E 04      [19] 2315 	ld	a,4 (ix)
   7F22 DD 77 F7      [19] 2316 	ld	-9 (ix),a
   7F25 DD 7E 05      [19] 2317 	ld	a,5 (ix)
   7F28 DD 77 F8      [19] 2318 	ld	-8 (ix),a
   7F2B DD 6E F7      [19] 2319 	ld	l,-9 (ix)
   7F2E DD 66 F8      [19] 2320 	ld	h,-8 (ix)
   7F31 4E            [ 7] 2321 	ld	c,(hl)
   7F32 06 00         [ 7] 2322 	ld	b,#0x00
   7F34 21 16 6A      [10] 2323 	ld	hl,#_prota+0
   7F37 5E            [ 7] 2324 	ld	e,(hl)
   7F38 16 00         [ 7] 2325 	ld	d,#0x00
   7F3A 79            [ 4] 2326 	ld	a,c
   7F3B 93            [ 4] 2327 	sub	a, e
   7F3C 4F            [ 4] 2328 	ld	c,a
   7F3D 78            [ 4] 2329 	ld	a,b
   7F3E 9A            [ 4] 2330 	sbc	a, d
   7F3F 47            [ 4] 2331 	ld	b,a
   7F40 C5            [11] 2332 	push	bc
   7F41 CD FE 4F      [17] 2333 	call	_abs
   7F44 F1            [10] 2334 	pop	af
   7F45 4D            [ 4] 2335 	ld	c,l
                           2336 ;src/main.c:496: u8 dify = abs(enemy->y - prota.y);
   7F46 DD 7E F7      [19] 2337 	ld	a,-9 (ix)
   7F49 C6 01         [ 7] 2338 	add	a, #0x01
   7F4B DD 77 F9      [19] 2339 	ld	-7 (ix),a
   7F4E DD 7E F8      [19] 2340 	ld	a,-8 (ix)
   7F51 CE 00         [ 7] 2341 	adc	a, #0x00
   7F53 DD 77 FA      [19] 2342 	ld	-6 (ix),a
   7F56 DD 6E F9      [19] 2343 	ld	l,-7 (ix)
   7F59 DD 66 FA      [19] 2344 	ld	h,-6 (ix)
   7F5C 5E            [ 7] 2345 	ld	e,(hl)
   7F5D 16 00         [ 7] 2346 	ld	d,#0x00
   7F5F 21 17 6A      [10] 2347 	ld	hl,#_prota+1
   7F62 6E            [ 7] 2348 	ld	l,(hl)
   7F63 26 00         [ 7] 2349 	ld	h,#0x00
   7F65 7B            [ 4] 2350 	ld	a,e
   7F66 95            [ 4] 2351 	sub	a, l
   7F67 5F            [ 4] 2352 	ld	e,a
   7F68 7A            [ 4] 2353 	ld	a,d
   7F69 9C            [ 4] 2354 	sbc	a, h
   7F6A 57            [ 4] 2355 	ld	d,a
   7F6B C5            [11] 2356 	push	bc
   7F6C D5            [11] 2357 	push	de
   7F6D CD FE 4F      [17] 2358 	call	_abs
   7F70 F1            [10] 2359 	pop	af
   7F71 C1            [10] 2360 	pop	bc
                           2361 ;src/main.c:497: u8 dist = difx + dify; // manhattan
   7F72 09            [11] 2362 	add	hl, bc
   7F73 DD 75 F6      [19] 2363 	ld	-10 (ix),l
                           2364 ;src/main.c:499: u8 movX = 0;
   7F76 DD 36 F5 00   [19] 2365 	ld	-11 (ix),#0x00
                           2366 ;src/main.c:500: u8 movY = 0;
   7F7A DD 36 F4 00   [19] 2367 	ld	-12 (ix),#0x00
                           2368 ;src/main.c:501: u8 mov = 0;
   7F7E DD 36 F3 00   [19] 2369 	ld	-13 (ix),#0x00
                           2370 ;src/main.c:503: if (enemy->y == dy) { // alineado en el eje x
   7F82 DD 6E F9      [19] 2371 	ld	l,-7 (ix)
   7F85 DD 66 FA      [19] 2372 	ld	h,-6 (ix)
   7F88 7E            [ 7] 2373 	ld	a,(hl)
   7F89 DD 77 FB      [19] 2374 	ld	-5 (ix),a
                           2375 ;src/main.c:505: if (dist > 10) {
   7F8C 3E 0A         [ 7] 2376 	ld	a,#0x0A
   7F8E DD 96 F6      [19] 2377 	sub	a, -10 (ix)
   7F91 3E 00         [ 7] 2378 	ld	a,#0x00
   7F93 17            [ 4] 2379 	rla
   7F94 DD 77 FC      [19] 2380 	ld	-4 (ix),a
                           2381 ;src/main.c:503: if (enemy->y == dy) { // alineado en el eje x
   7F97 DD 7E 07      [19] 2382 	ld	a,7 (ix)
   7F9A DD 96 FB      [19] 2383 	sub	a, -5 (ix)
   7F9D C2 9F 80      [10] 2384 	jp	NZ,00187$
                           2385 ;src/main.c:505: if (dist > 10) {
   7FA0 DD 7E FC      [19] 2386 	ld	a,-4 (ix)
   7FA3 B7            [ 4] 2387 	or	a, a
   7FA4 CA 03 86      [10] 2388 	jp	Z,00189$
                           2389 ;src/main.c:506: if (dx < enemy->x) { // izquierda
   7FA7 DD 6E F7      [19] 2390 	ld	l,-9 (ix)
   7FAA DD 66 F8      [19] 2391 	ld	h,-8 (ix)
   7FAD 46            [ 7] 2392 	ld	b,(hl)
   7FAE DD 7E 06      [19] 2393 	ld	a,6 (ix)
   7FB1 90            [ 4] 2394 	sub	a, b
   7FB2 30 72         [12] 2395 	jr	NC,00110$
                           2396 ;src/main.c:507: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   7FB4 05            [ 4] 2397 	dec	b
   7FB5 DD 7E FB      [19] 2398 	ld	a,-5 (ix)
   7FB8 F5            [11] 2399 	push	af
   7FB9 33            [ 6] 2400 	inc	sp
   7FBA C5            [11] 2401 	push	bc
   7FBB 33            [ 6] 2402 	inc	sp
   7FBC 2A CE 72      [16] 2403 	ld	hl,(_mapa)
   7FBF E5            [11] 2404 	push	hl
   7FC0 CD BA 4F      [17] 2405 	call	_getTilePtr
   7FC3 F1            [10] 2406 	pop	af
   7FC4 F1            [10] 2407 	pop	af
   7FC5 4E            [ 7] 2408 	ld	c,(hl)
   7FC6 3E 02         [ 7] 2409 	ld	a,#0x02
   7FC8 91            [ 4] 2410 	sub	a, c
   7FC9 DA 03 86      [10] 2411 	jp	C,00189$
                           2412 ;src/main.c:508: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   7FCC DD 6E F9      [19] 2413 	ld	l,-7 (ix)
   7FCF DD 66 FA      [19] 2414 	ld	h,-6 (ix)
   7FD2 7E            [ 7] 2415 	ld	a,(hl)
   7FD3 C6 0B         [ 7] 2416 	add	a, #0x0B
   7FD5 57            [ 4] 2417 	ld	d,a
   7FD6 DD 6E F7      [19] 2418 	ld	l,-9 (ix)
   7FD9 DD 66 F8      [19] 2419 	ld	h,-8 (ix)
   7FDC 46            [ 7] 2420 	ld	b,(hl)
   7FDD 05            [ 4] 2421 	dec	b
   7FDE D5            [11] 2422 	push	de
   7FDF 33            [ 6] 2423 	inc	sp
   7FE0 C5            [11] 2424 	push	bc
   7FE1 33            [ 6] 2425 	inc	sp
   7FE2 2A CE 72      [16] 2426 	ld	hl,(_mapa)
   7FE5 E5            [11] 2427 	push	hl
   7FE6 CD BA 4F      [17] 2428 	call	_getTilePtr
   7FE9 F1            [10] 2429 	pop	af
   7FEA F1            [10] 2430 	pop	af
   7FEB 4E            [ 7] 2431 	ld	c,(hl)
   7FEC 3E 02         [ 7] 2432 	ld	a,#0x02
   7FEE 91            [ 4] 2433 	sub	a, c
   7FEF DA 03 86      [10] 2434 	jp	C,00189$
                           2435 ;src/main.c:509: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   7FF2 DD 6E F9      [19] 2436 	ld	l,-7 (ix)
   7FF5 DD 66 FA      [19] 2437 	ld	h,-6 (ix)
   7FF8 7E            [ 7] 2438 	ld	a,(hl)
   7FF9 C6 16         [ 7] 2439 	add	a, #0x16
   7FFB 57            [ 4] 2440 	ld	d,a
   7FFC DD 6E F7      [19] 2441 	ld	l,-9 (ix)
   7FFF DD 66 F8      [19] 2442 	ld	h,-8 (ix)
   8002 46            [ 7] 2443 	ld	b,(hl)
   8003 05            [ 4] 2444 	dec	b
   8004 D5            [11] 2445 	push	de
   8005 33            [ 6] 2446 	inc	sp
   8006 C5            [11] 2447 	push	bc
   8007 33            [ 6] 2448 	inc	sp
   8008 2A CE 72      [16] 2449 	ld	hl,(_mapa)
   800B E5            [11] 2450 	push	hl
   800C CD BA 4F      [17] 2451 	call	_getTilePtr
   800F F1            [10] 2452 	pop	af
   8010 F1            [10] 2453 	pop	af
   8011 4E            [ 7] 2454 	ld	c,(hl)
   8012 3E 02         [ 7] 2455 	ld	a,#0x02
   8014 91            [ 4] 2456 	sub	a, c
   8015 DA 03 86      [10] 2457 	jp	C,00189$
                           2458 ;src/main.c:510: moverEnemigoIzquierda(enemy);
   8018 DD 6E F7      [19] 2459 	ld	l,-9 (ix)
   801B DD 66 F8      [19] 2460 	ld	h,-8 (ix)
   801E E5            [11] 2461 	push	hl
   801F CD 76 7B      [17] 2462 	call	_moverEnemigoIzquierda
   8022 F1            [10] 2463 	pop	af
                           2464 ;src/main.c:512: mov = 1;
   8023 C3 03 86      [10] 2465 	jp	00189$
   8026                    2466 00110$:
                           2467 ;src/main.c:515: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   8026 78            [ 4] 2468 	ld	a,b
   8027 C6 05         [ 7] 2469 	add	a, #0x05
   8029 47            [ 4] 2470 	ld	b,a
   802A DD 7E FB      [19] 2471 	ld	a,-5 (ix)
   802D F5            [11] 2472 	push	af
   802E 33            [ 6] 2473 	inc	sp
   802F C5            [11] 2474 	push	bc
   8030 33            [ 6] 2475 	inc	sp
   8031 2A CE 72      [16] 2476 	ld	hl,(_mapa)
   8034 E5            [11] 2477 	push	hl
   8035 CD BA 4F      [17] 2478 	call	_getTilePtr
   8038 F1            [10] 2479 	pop	af
   8039 F1            [10] 2480 	pop	af
   803A 4E            [ 7] 2481 	ld	c,(hl)
   803B 3E 02         [ 7] 2482 	ld	a,#0x02
   803D 91            [ 4] 2483 	sub	a, c
   803E DA 03 86      [10] 2484 	jp	C,00189$
                           2485 ;src/main.c:516: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   8041 DD 6E F9      [19] 2486 	ld	l,-7 (ix)
   8044 DD 66 FA      [19] 2487 	ld	h,-6 (ix)
   8047 7E            [ 7] 2488 	ld	a,(hl)
   8048 C6 0B         [ 7] 2489 	add	a, #0x0B
   804A 57            [ 4] 2490 	ld	d,a
   804B DD 6E F7      [19] 2491 	ld	l,-9 (ix)
   804E DD 66 F8      [19] 2492 	ld	h,-8 (ix)
   8051 7E            [ 7] 2493 	ld	a,(hl)
   8052 C6 05         [ 7] 2494 	add	a, #0x05
   8054 47            [ 4] 2495 	ld	b,a
   8055 D5            [11] 2496 	push	de
   8056 33            [ 6] 2497 	inc	sp
   8057 C5            [11] 2498 	push	bc
   8058 33            [ 6] 2499 	inc	sp
   8059 2A CE 72      [16] 2500 	ld	hl,(_mapa)
   805C E5            [11] 2501 	push	hl
   805D CD BA 4F      [17] 2502 	call	_getTilePtr
   8060 F1            [10] 2503 	pop	af
   8061 F1            [10] 2504 	pop	af
   8062 4E            [ 7] 2505 	ld	c,(hl)
   8063 3E 02         [ 7] 2506 	ld	a,#0x02
   8065 91            [ 4] 2507 	sub	a, c
   8066 DA 03 86      [10] 2508 	jp	C,00189$
                           2509 ;src/main.c:517: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   8069 DD 6E F9      [19] 2510 	ld	l,-7 (ix)
   806C DD 66 FA      [19] 2511 	ld	h,-6 (ix)
   806F 7E            [ 7] 2512 	ld	a,(hl)
   8070 C6 16         [ 7] 2513 	add	a, #0x16
   8072 57            [ 4] 2514 	ld	d,a
   8073 DD 6E F7      [19] 2515 	ld	l,-9 (ix)
   8076 DD 66 F8      [19] 2516 	ld	h,-8 (ix)
   8079 7E            [ 7] 2517 	ld	a,(hl)
   807A C6 05         [ 7] 2518 	add	a, #0x05
   807C 47            [ 4] 2519 	ld	b,a
   807D D5            [11] 2520 	push	de
   807E 33            [ 6] 2521 	inc	sp
   807F C5            [11] 2522 	push	bc
   8080 33            [ 6] 2523 	inc	sp
   8081 2A CE 72      [16] 2524 	ld	hl,(_mapa)
   8084 E5            [11] 2525 	push	hl
   8085 CD BA 4F      [17] 2526 	call	_getTilePtr
   8088 F1            [10] 2527 	pop	af
   8089 F1            [10] 2528 	pop	af
   808A 4E            [ 7] 2529 	ld	c,(hl)
   808B 3E 02         [ 7] 2530 	ld	a,#0x02
   808D 91            [ 4] 2531 	sub	a, c
   808E DA 03 86      [10] 2532 	jp	C,00189$
                           2533 ;src/main.c:518: moverEnemigoDerecha(enemy);
   8091 DD 6E F7      [19] 2534 	ld	l,-9 (ix)
   8094 DD 66 F8      [19] 2535 	ld	h,-8 (ix)
   8097 E5            [11] 2536 	push	hl
   8098 CD 66 7B      [17] 2537 	call	_moverEnemigoDerecha
   809B F1            [10] 2538 	pop	af
                           2539 ;src/main.c:520: mov = 1;
   809C C3 03 86      [10] 2540 	jp	00189$
   809F                    2541 00187$:
                           2542 ;src/main.c:525: else if (enemy->x == dx) {
   809F DD 6E F7      [19] 2543 	ld	l,-9 (ix)
   80A2 DD 66 F8      [19] 2544 	ld	h,-8 (ix)
   80A5 7E            [ 7] 2545 	ld	a,(hl)
   80A6 DD 77 FD      [19] 2546 	ld	-3 (ix), a
   80A9 DD 96 06      [19] 2547 	sub	a, 6 (ix)
   80AC C2 A9 81      [10] 2548 	jp	NZ,00184$
                           2549 ;src/main.c:527: if (dist > 10) {
   80AF DD 7E FC      [19] 2550 	ld	a,-4 (ix)
   80B2 B7            [ 4] 2551 	or	a, a
   80B3 CA 03 86      [10] 2552 	jp	Z,00189$
                           2553 ;src/main.c:528: if (dy < enemy->y) {
   80B6 DD 7E 07      [19] 2554 	ld	a,7 (ix)
   80B9 DD 96 FB      [19] 2555 	sub	a, -5 (ix)
   80BC 30 74         [12] 2556 	jr	NC,00123$
                           2557 ;src/main.c:529: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   80BE DD 46 FB      [19] 2558 	ld	b,-5 (ix)
   80C1 05            [ 4] 2559 	dec	b
   80C2 05            [ 4] 2560 	dec	b
   80C3 C5            [11] 2561 	push	bc
   80C4 33            [ 6] 2562 	inc	sp
   80C5 DD 7E FD      [19] 2563 	ld	a,-3 (ix)
   80C8 F5            [11] 2564 	push	af
   80C9 33            [ 6] 2565 	inc	sp
   80CA 2A CE 72      [16] 2566 	ld	hl,(_mapa)
   80CD E5            [11] 2567 	push	hl
   80CE CD BA 4F      [17] 2568 	call	_getTilePtr
   80D1 F1            [10] 2569 	pop	af
   80D2 F1            [10] 2570 	pop	af
   80D3 4E            [ 7] 2571 	ld	c,(hl)
   80D4 3E 02         [ 7] 2572 	ld	a,#0x02
   80D6 91            [ 4] 2573 	sub	a, c
   80D7 DA 03 86      [10] 2574 	jp	C,00189$
                           2575 ;src/main.c:530: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   80DA DD 6E F9      [19] 2576 	ld	l,-7 (ix)
   80DD DD 66 FA      [19] 2577 	ld	h,-6 (ix)
   80E0 46            [ 7] 2578 	ld	b,(hl)
   80E1 05            [ 4] 2579 	dec	b
   80E2 05            [ 4] 2580 	dec	b
   80E3 DD 6E F7      [19] 2581 	ld	l,-9 (ix)
   80E6 DD 66 F8      [19] 2582 	ld	h,-8 (ix)
   80E9 56            [ 7] 2583 	ld	d,(hl)
   80EA 14            [ 4] 2584 	inc	d
   80EB 14            [ 4] 2585 	inc	d
   80EC 4A            [ 4] 2586 	ld	c, d
   80ED C5            [11] 2587 	push	bc
   80EE 2A CE 72      [16] 2588 	ld	hl,(_mapa)
   80F1 E5            [11] 2589 	push	hl
   80F2 CD BA 4F      [17] 2590 	call	_getTilePtr
   80F5 F1            [10] 2591 	pop	af
   80F6 F1            [10] 2592 	pop	af
   80F7 4E            [ 7] 2593 	ld	c,(hl)
   80F8 3E 02         [ 7] 2594 	ld	a,#0x02
   80FA 91            [ 4] 2595 	sub	a, c
   80FB DA 03 86      [10] 2596 	jp	C,00189$
                           2597 ;src/main.c:531: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   80FE DD 6E F9      [19] 2598 	ld	l,-7 (ix)
   8101 DD 66 FA      [19] 2599 	ld	h,-6 (ix)
   8104 46            [ 7] 2600 	ld	b,(hl)
   8105 05            [ 4] 2601 	dec	b
   8106 05            [ 4] 2602 	dec	b
   8107 DD 6E F7      [19] 2603 	ld	l,-9 (ix)
   810A DD 66 F8      [19] 2604 	ld	h,-8 (ix)
   810D 7E            [ 7] 2605 	ld	a,(hl)
   810E C6 04         [ 7] 2606 	add	a, #0x04
   8110 C5            [11] 2607 	push	bc
   8111 33            [ 6] 2608 	inc	sp
   8112 F5            [11] 2609 	push	af
   8113 33            [ 6] 2610 	inc	sp
   8114 2A CE 72      [16] 2611 	ld	hl,(_mapa)
   8117 E5            [11] 2612 	push	hl
   8118 CD BA 4F      [17] 2613 	call	_getTilePtr
   811B F1            [10] 2614 	pop	af
   811C F1            [10] 2615 	pop	af
   811D 4E            [ 7] 2616 	ld	c,(hl)
   811E 3E 02         [ 7] 2617 	ld	a,#0x02
   8120 91            [ 4] 2618 	sub	a, c
   8121 DA 03 86      [10] 2619 	jp	C,00189$
                           2620 ;src/main.c:532: moverEnemigoArriba(enemy);
   8124 DD 6E F7      [19] 2621 	ld	l,-9 (ix)
   8127 DD 66 F8      [19] 2622 	ld	h,-8 (ix)
   812A E5            [11] 2623 	push	hl
   812B CD 28 7B      [17] 2624 	call	_moverEnemigoArriba
   812E F1            [10] 2625 	pop	af
                           2626 ;src/main.c:534: mov = 1;
   812F C3 03 86      [10] 2627 	jp	00189$
   8132                    2628 00123$:
                           2629 ;src/main.c:537: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   8132 DD 7E FB      [19] 2630 	ld	a,-5 (ix)
   8135 C6 18         [ 7] 2631 	add	a, #0x18
   8137 47            [ 4] 2632 	ld	b,a
   8138 C5            [11] 2633 	push	bc
   8139 33            [ 6] 2634 	inc	sp
   813A DD 7E FD      [19] 2635 	ld	a,-3 (ix)
   813D F5            [11] 2636 	push	af
   813E 33            [ 6] 2637 	inc	sp
   813F 2A CE 72      [16] 2638 	ld	hl,(_mapa)
   8142 E5            [11] 2639 	push	hl
   8143 CD BA 4F      [17] 2640 	call	_getTilePtr
   8146 F1            [10] 2641 	pop	af
   8147 F1            [10] 2642 	pop	af
   8148 4E            [ 7] 2643 	ld	c,(hl)
   8149 3E 02         [ 7] 2644 	ld	a,#0x02
   814B 91            [ 4] 2645 	sub	a, c
   814C DA 03 86      [10] 2646 	jp	C,00189$
                           2647 ;src/main.c:538: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   814F DD 6E F9      [19] 2648 	ld	l,-7 (ix)
   8152 DD 66 FA      [19] 2649 	ld	h,-6 (ix)
   8155 7E            [ 7] 2650 	ld	a,(hl)
   8156 C6 18         [ 7] 2651 	add	a, #0x18
   8158 47            [ 4] 2652 	ld	b,a
   8159 DD 6E F7      [19] 2653 	ld	l,-9 (ix)
   815C DD 66 F8      [19] 2654 	ld	h,-8 (ix)
   815F 56            [ 7] 2655 	ld	d,(hl)
   8160 14            [ 4] 2656 	inc	d
   8161 14            [ 4] 2657 	inc	d
   8162 4A            [ 4] 2658 	ld	c, d
   8163 C5            [11] 2659 	push	bc
   8164 2A CE 72      [16] 2660 	ld	hl,(_mapa)
   8167 E5            [11] 2661 	push	hl
   8168 CD BA 4F      [17] 2662 	call	_getTilePtr
   816B F1            [10] 2663 	pop	af
   816C F1            [10] 2664 	pop	af
   816D 4E            [ 7] 2665 	ld	c,(hl)
   816E 3E 02         [ 7] 2666 	ld	a,#0x02
   8170 91            [ 4] 2667 	sub	a, c
   8171 DA 03 86      [10] 2668 	jp	C,00189$
                           2669 ;src/main.c:539: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   8174 DD 6E F9      [19] 2670 	ld	l,-7 (ix)
   8177 DD 66 FA      [19] 2671 	ld	h,-6 (ix)
   817A 7E            [ 7] 2672 	ld	a,(hl)
   817B C6 18         [ 7] 2673 	add	a, #0x18
   817D 47            [ 4] 2674 	ld	b,a
   817E DD 6E F7      [19] 2675 	ld	l,-9 (ix)
   8181 DD 66 F8      [19] 2676 	ld	h,-8 (ix)
   8184 7E            [ 7] 2677 	ld	a,(hl)
   8185 C6 04         [ 7] 2678 	add	a, #0x04
   8187 C5            [11] 2679 	push	bc
   8188 33            [ 6] 2680 	inc	sp
   8189 F5            [11] 2681 	push	af
   818A 33            [ 6] 2682 	inc	sp
   818B 2A CE 72      [16] 2683 	ld	hl,(_mapa)
   818E E5            [11] 2684 	push	hl
   818F CD BA 4F      [17] 2685 	call	_getTilePtr
   8192 F1            [10] 2686 	pop	af
   8193 F1            [10] 2687 	pop	af
   8194 4E            [ 7] 2688 	ld	c,(hl)
   8195 3E 02         [ 7] 2689 	ld	a,#0x02
   8197 91            [ 4] 2690 	sub	a, c
   8198 DA 03 86      [10] 2691 	jp	C,00189$
                           2692 ;src/main.c:540: moverEnemigoAbajo(enemy);
   819B DD 6E F7      [19] 2693 	ld	l,-9 (ix)
   819E DD 66 F8      [19] 2694 	ld	h,-8 (ix)
   81A1 E5            [11] 2695 	push	hl
   81A2 CD 47 7B      [17] 2696 	call	_moverEnemigoAbajo
   81A5 F1            [10] 2697 	pop	af
                           2698 ;src/main.c:542: mov = 1;
   81A6 C3 03 86      [10] 2699 	jp	00189$
   81A9                    2700 00184$:
                           2701 ;src/main.c:548: if (dist > 20) {
   81A9 3E 14         [ 7] 2702 	ld	a,#0x14
   81AB DD 96 F6      [19] 2703 	sub	a, -10 (ix)
   81AE D2 03 86      [10] 2704 	jp	NC,00189$
                           2705 ;src/main.c:549: if (dx < enemy->x) {
   81B1 DD 7E 06      [19] 2706 	ld	a,6 (ix)
   81B4 DD 96 FD      [19] 2707 	sub	a, -3 (ix)
   81B7 D2 39 82      [10] 2708 	jp	NC,00136$
                           2709 ;src/main.c:550: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   81BA DD 46 FD      [19] 2710 	ld	b,-3 (ix)
   81BD 05            [ 4] 2711 	dec	b
   81BE DD 7E FB      [19] 2712 	ld	a,-5 (ix)
   81C1 F5            [11] 2713 	push	af
   81C2 33            [ 6] 2714 	inc	sp
   81C3 C5            [11] 2715 	push	bc
   81C4 33            [ 6] 2716 	inc	sp
   81C5 2A CE 72      [16] 2717 	ld	hl,(_mapa)
   81C8 E5            [11] 2718 	push	hl
   81C9 CD BA 4F      [17] 2719 	call	_getTilePtr
   81CC F1            [10] 2720 	pop	af
   81CD F1            [10] 2721 	pop	af
   81CE 4E            [ 7] 2722 	ld	c,(hl)
   81CF 3E 02         [ 7] 2723 	ld	a,#0x02
   81D1 91            [ 4] 2724 	sub	a, c
   81D2 DA B6 82      [10] 2725 	jp	C,00137$
                           2726 ;src/main.c:551: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   81D5 DD 6E F9      [19] 2727 	ld	l,-7 (ix)
   81D8 DD 66 FA      [19] 2728 	ld	h,-6 (ix)
   81DB 7E            [ 7] 2729 	ld	a,(hl)
   81DC C6 0B         [ 7] 2730 	add	a, #0x0B
   81DE 4F            [ 4] 2731 	ld	c,a
   81DF DD 6E F7      [19] 2732 	ld	l,-9 (ix)
   81E2 DD 66 F8      [19] 2733 	ld	h,-8 (ix)
   81E5 46            [ 7] 2734 	ld	b,(hl)
   81E6 05            [ 4] 2735 	dec	b
   81E7 79            [ 4] 2736 	ld	a,c
   81E8 F5            [11] 2737 	push	af
   81E9 33            [ 6] 2738 	inc	sp
   81EA C5            [11] 2739 	push	bc
   81EB 33            [ 6] 2740 	inc	sp
   81EC 2A CE 72      [16] 2741 	ld	hl,(_mapa)
   81EF E5            [11] 2742 	push	hl
   81F0 CD BA 4F      [17] 2743 	call	_getTilePtr
   81F3 F1            [10] 2744 	pop	af
   81F4 F1            [10] 2745 	pop	af
   81F5 4E            [ 7] 2746 	ld	c,(hl)
   81F6 3E 02         [ 7] 2747 	ld	a,#0x02
   81F8 91            [ 4] 2748 	sub	a, c
   81F9 DA B6 82      [10] 2749 	jp	C,00137$
                           2750 ;src/main.c:552: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   81FC DD 6E F9      [19] 2751 	ld	l,-7 (ix)
   81FF DD 66 FA      [19] 2752 	ld	h,-6 (ix)
   8202 7E            [ 7] 2753 	ld	a,(hl)
   8203 C6 16         [ 7] 2754 	add	a, #0x16
   8205 4F            [ 4] 2755 	ld	c,a
   8206 DD 6E F7      [19] 2756 	ld	l,-9 (ix)
   8209 DD 66 F8      [19] 2757 	ld	h,-8 (ix)
   820C 46            [ 7] 2758 	ld	b,(hl)
   820D 05            [ 4] 2759 	dec	b
   820E 79            [ 4] 2760 	ld	a,c
   820F F5            [11] 2761 	push	af
   8210 33            [ 6] 2762 	inc	sp
   8211 C5            [11] 2763 	push	bc
   8212 33            [ 6] 2764 	inc	sp
   8213 2A CE 72      [16] 2765 	ld	hl,(_mapa)
   8216 E5            [11] 2766 	push	hl
   8217 CD BA 4F      [17] 2767 	call	_getTilePtr
   821A F1            [10] 2768 	pop	af
   821B F1            [10] 2769 	pop	af
   821C 4E            [ 7] 2770 	ld	c,(hl)
   821D 3E 02         [ 7] 2771 	ld	a,#0x02
   821F 91            [ 4] 2772 	sub	a, c
   8220 DA B6 82      [10] 2773 	jp	C,00137$
                           2774 ;src/main.c:553: moverEnemigoIzquierda(enemy);
   8223 DD 6E F7      [19] 2775 	ld	l,-9 (ix)
   8226 DD 66 F8      [19] 2776 	ld	h,-8 (ix)
   8229 E5            [11] 2777 	push	hl
   822A CD 76 7B      [17] 2778 	call	_moverEnemigoIzquierda
   822D F1            [10] 2779 	pop	af
                           2780 ;src/main.c:554: movX = 1;
   822E DD 36 F5 01   [19] 2781 	ld	-11 (ix),#0x01
                           2782 ;src/main.c:555: mov = 1;
   8232 DD 36 F3 01   [19] 2783 	ld	-13 (ix),#0x01
   8236 C3 B6 82      [10] 2784 	jp	00137$
   8239                    2785 00136$:
                           2786 ;src/main.c:558: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   8239 DD 7E FD      [19] 2787 	ld	a,-3 (ix)
   823C C6 05         [ 7] 2788 	add	a, #0x05
   823E 47            [ 4] 2789 	ld	b,a
   823F DD 7E FB      [19] 2790 	ld	a,-5 (ix)
   8242 F5            [11] 2791 	push	af
   8243 33            [ 6] 2792 	inc	sp
   8244 C5            [11] 2793 	push	bc
   8245 33            [ 6] 2794 	inc	sp
   8246 2A CE 72      [16] 2795 	ld	hl,(_mapa)
   8249 E5            [11] 2796 	push	hl
   824A CD BA 4F      [17] 2797 	call	_getTilePtr
   824D F1            [10] 2798 	pop	af
   824E F1            [10] 2799 	pop	af
   824F 4E            [ 7] 2800 	ld	c,(hl)
   8250 3E 02         [ 7] 2801 	ld	a,#0x02
   8252 91            [ 4] 2802 	sub	a, c
   8253 38 61         [12] 2803 	jr	C,00137$
                           2804 ;src/main.c:559: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   8255 DD 6E F9      [19] 2805 	ld	l,-7 (ix)
   8258 DD 66 FA      [19] 2806 	ld	h,-6 (ix)
   825B 7E            [ 7] 2807 	ld	a,(hl)
   825C C6 0B         [ 7] 2808 	add	a, #0x0B
   825E 57            [ 4] 2809 	ld	d,a
   825F DD 6E F7      [19] 2810 	ld	l,-9 (ix)
   8262 DD 66 F8      [19] 2811 	ld	h,-8 (ix)
   8265 7E            [ 7] 2812 	ld	a,(hl)
   8266 C6 05         [ 7] 2813 	add	a, #0x05
   8268 47            [ 4] 2814 	ld	b,a
   8269 D5            [11] 2815 	push	de
   826A 33            [ 6] 2816 	inc	sp
   826B C5            [11] 2817 	push	bc
   826C 33            [ 6] 2818 	inc	sp
   826D 2A CE 72      [16] 2819 	ld	hl,(_mapa)
   8270 E5            [11] 2820 	push	hl
   8271 CD BA 4F      [17] 2821 	call	_getTilePtr
   8274 F1            [10] 2822 	pop	af
   8275 F1            [10] 2823 	pop	af
   8276 4E            [ 7] 2824 	ld	c,(hl)
   8277 3E 02         [ 7] 2825 	ld	a,#0x02
   8279 91            [ 4] 2826 	sub	a, c
   827A 38 3A         [12] 2827 	jr	C,00137$
                           2828 ;src/main.c:560: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   827C DD 6E F9      [19] 2829 	ld	l,-7 (ix)
   827F DD 66 FA      [19] 2830 	ld	h,-6 (ix)
   8282 7E            [ 7] 2831 	ld	a,(hl)
   8283 C6 16         [ 7] 2832 	add	a, #0x16
   8285 57            [ 4] 2833 	ld	d,a
   8286 DD 6E F7      [19] 2834 	ld	l,-9 (ix)
   8289 DD 66 F8      [19] 2835 	ld	h,-8 (ix)
   828C 7E            [ 7] 2836 	ld	a,(hl)
   828D C6 05         [ 7] 2837 	add	a, #0x05
   828F 47            [ 4] 2838 	ld	b,a
   8290 D5            [11] 2839 	push	de
   8291 33            [ 6] 2840 	inc	sp
   8292 C5            [11] 2841 	push	bc
   8293 33            [ 6] 2842 	inc	sp
   8294 2A CE 72      [16] 2843 	ld	hl,(_mapa)
   8297 E5            [11] 2844 	push	hl
   8298 CD BA 4F      [17] 2845 	call	_getTilePtr
   829B F1            [10] 2846 	pop	af
   829C F1            [10] 2847 	pop	af
   829D 4E            [ 7] 2848 	ld	c,(hl)
   829E 3E 02         [ 7] 2849 	ld	a,#0x02
   82A0 91            [ 4] 2850 	sub	a, c
   82A1 38 13         [12] 2851 	jr	C,00137$
                           2852 ;src/main.c:561: moverEnemigoDerecha(enemy);
   82A3 DD 6E F7      [19] 2853 	ld	l,-9 (ix)
   82A6 DD 66 F8      [19] 2854 	ld	h,-8 (ix)
   82A9 E5            [11] 2855 	push	hl
   82AA CD 66 7B      [17] 2856 	call	_moverEnemigoDerecha
   82AD F1            [10] 2857 	pop	af
                           2858 ;src/main.c:562: movX = 1;
   82AE DD 36 F5 01   [19] 2859 	ld	-11 (ix),#0x01
                           2860 ;src/main.c:563: mov = 1;
   82B2 DD 36 F3 01   [19] 2861 	ld	-13 (ix),#0x01
   82B6                    2862 00137$:
                           2863 ;src/main.c:566: if (dy < enemy->y) {
   82B6 DD 6E F9      [19] 2864 	ld	l,-7 (ix)
   82B9 DD 66 FA      [19] 2865 	ld	h,-6 (ix)
   82BC 7E            [ 7] 2866 	ld	a,(hl)
   82BD DD 77 FD      [19] 2867 	ld	-3 (ix),a
                           2868 ;src/main.c:495: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   82C0 DD 6E F7      [19] 2869 	ld	l,-9 (ix)
   82C3 DD 66 F8      [19] 2870 	ld	h,-8 (ix)
   82C6 7E            [ 7] 2871 	ld	a,(hl)
   82C7 DD 77 FC      [19] 2872 	ld	-4 (ix),a
                           2873 ;src/main.c:566: if (dy < enemy->y) {
   82CA DD 7E 07      [19] 2874 	ld	a,7 (ix)
   82CD DD 96 FD      [19] 2875 	sub	a, -3 (ix)
   82D0 D2 66 83      [10] 2876 	jp	NC,00147$
                           2877 ;src/main.c:567: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   82D3 DD 7E FD      [19] 2878 	ld	a,-3 (ix)
   82D6 C6 FE         [ 7] 2879 	add	a,#0xFE
   82D8 DD 77 FB      [19] 2880 	ld	-5 (ix), a
   82DB F5            [11] 2881 	push	af
   82DC 33            [ 6] 2882 	inc	sp
   82DD DD 7E FC      [19] 2883 	ld	a,-4 (ix)
   82E0 F5            [11] 2884 	push	af
   82E1 33            [ 6] 2885 	inc	sp
   82E2 2A CE 72      [16] 2886 	ld	hl,(_mapa)
   82E5 E5            [11] 2887 	push	hl
   82E6 CD BA 4F      [17] 2888 	call	_getTilePtr
   82E9 F1            [10] 2889 	pop	af
   82EA F1            [10] 2890 	pop	af
   82EB DD 74 FF      [19] 2891 	ld	-1 (ix),h
   82EE DD 75 FE      [19] 2892 	ld	-2 (ix), l
   82F1 DD 66 FF      [19] 2893 	ld	h,-1 (ix)
   82F4 4E            [ 7] 2894 	ld	c,(hl)
   82F5 3E 02         [ 7] 2895 	ld	a,#0x02
   82F7 91            [ 4] 2896 	sub	a, c
   82F8 DA E1 83      [10] 2897 	jp	C,00148$
                           2898 ;src/main.c:568: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   82FB DD 6E F9      [19] 2899 	ld	l,-7 (ix)
   82FE DD 66 FA      [19] 2900 	ld	h,-6 (ix)
   8301 7E            [ 7] 2901 	ld	a,(hl)
   8302 DD 77 FE      [19] 2902 	ld	-2 (ix), a
   8305 C6 FE         [ 7] 2903 	add	a,#0xFE
   8307 DD 77 FE      [19] 2904 	ld	-2 (ix),a
   830A DD 6E F7      [19] 2905 	ld	l,-9 (ix)
   830D DD 66 F8      [19] 2906 	ld	h,-8 (ix)
   8310 46            [ 7] 2907 	ld	b,(hl)
   8311 04            [ 4] 2908 	inc	b
   8312 04            [ 4] 2909 	inc	b
   8313 DD 7E FE      [19] 2910 	ld	a,-2 (ix)
   8316 F5            [11] 2911 	push	af
   8317 33            [ 6] 2912 	inc	sp
   8318 C5            [11] 2913 	push	bc
   8319 33            [ 6] 2914 	inc	sp
   831A 2A CE 72      [16] 2915 	ld	hl,(_mapa)
   831D E5            [11] 2916 	push	hl
   831E CD BA 4F      [17] 2917 	call	_getTilePtr
   8321 F1            [10] 2918 	pop	af
   8322 F1            [10] 2919 	pop	af
   8323 4E            [ 7] 2920 	ld	c,(hl)
   8324 3E 02         [ 7] 2921 	ld	a,#0x02
   8326 91            [ 4] 2922 	sub	a, c
   8327 DA E1 83      [10] 2923 	jp	C,00148$
                           2924 ;src/main.c:569: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   832A DD 6E F9      [19] 2925 	ld	l,-7 (ix)
   832D DD 66 FA      [19] 2926 	ld	h,-6 (ix)
   8330 46            [ 7] 2927 	ld	b,(hl)
   8331 05            [ 4] 2928 	dec	b
   8332 05            [ 4] 2929 	dec	b
   8333 DD 6E F7      [19] 2930 	ld	l,-9 (ix)
   8336 DD 66 F8      [19] 2931 	ld	h,-8 (ix)
   8339 7E            [ 7] 2932 	ld	a,(hl)
   833A C6 04         [ 7] 2933 	add	a, #0x04
   833C C5            [11] 2934 	push	bc
   833D 33            [ 6] 2935 	inc	sp
   833E F5            [11] 2936 	push	af
   833F 33            [ 6] 2937 	inc	sp
   8340 2A CE 72      [16] 2938 	ld	hl,(_mapa)
   8343 E5            [11] 2939 	push	hl
   8344 CD BA 4F      [17] 2940 	call	_getTilePtr
   8347 F1            [10] 2941 	pop	af
   8348 F1            [10] 2942 	pop	af
   8349 4E            [ 7] 2943 	ld	c,(hl)
   834A 3E 02         [ 7] 2944 	ld	a,#0x02
   834C 91            [ 4] 2945 	sub	a, c
   834D DA E1 83      [10] 2946 	jp	C,00148$
                           2947 ;src/main.c:570: moverEnemigoArriba(enemy);
   8350 DD 6E F7      [19] 2948 	ld	l,-9 (ix)
   8353 DD 66 F8      [19] 2949 	ld	h,-8 (ix)
   8356 E5            [11] 2950 	push	hl
   8357 CD 28 7B      [17] 2951 	call	_moverEnemigoArriba
   835A F1            [10] 2952 	pop	af
                           2953 ;src/main.c:571: movY = 1;
   835B DD 36 F4 01   [19] 2954 	ld	-12 (ix),#0x01
                           2955 ;src/main.c:572: mov = 1;
   835F DD 36 F3 01   [19] 2956 	ld	-13 (ix),#0x01
   8363 C3 E1 83      [10] 2957 	jp	00148$
   8366                    2958 00147$:
                           2959 ;src/main.c:575: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   8366 DD 7E FD      [19] 2960 	ld	a,-3 (ix)
   8369 C6 18         [ 7] 2961 	add	a, #0x18
   836B 47            [ 4] 2962 	ld	b,a
   836C C5            [11] 2963 	push	bc
   836D 33            [ 6] 2964 	inc	sp
   836E DD 7E FC      [19] 2965 	ld	a,-4 (ix)
   8371 F5            [11] 2966 	push	af
   8372 33            [ 6] 2967 	inc	sp
   8373 2A CE 72      [16] 2968 	ld	hl,(_mapa)
   8376 E5            [11] 2969 	push	hl
   8377 CD BA 4F      [17] 2970 	call	_getTilePtr
   837A F1            [10] 2971 	pop	af
   837B F1            [10] 2972 	pop	af
   837C 4E            [ 7] 2973 	ld	c,(hl)
   837D 3E 02         [ 7] 2974 	ld	a,#0x02
   837F 91            [ 4] 2975 	sub	a, c
   8380 38 5F         [12] 2976 	jr	C,00148$
                           2977 ;src/main.c:576: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   8382 DD 6E F9      [19] 2978 	ld	l,-7 (ix)
   8385 DD 66 FA      [19] 2979 	ld	h,-6 (ix)
   8388 7E            [ 7] 2980 	ld	a,(hl)
   8389 C6 18         [ 7] 2981 	add	a, #0x18
   838B 57            [ 4] 2982 	ld	d,a
   838C DD 6E F7      [19] 2983 	ld	l,-9 (ix)
   838F DD 66 F8      [19] 2984 	ld	h,-8 (ix)
   8392 46            [ 7] 2985 	ld	b,(hl)
   8393 04            [ 4] 2986 	inc	b
   8394 04            [ 4] 2987 	inc	b
   8395 D5            [11] 2988 	push	de
   8396 33            [ 6] 2989 	inc	sp
   8397 C5            [11] 2990 	push	bc
   8398 33            [ 6] 2991 	inc	sp
   8399 2A CE 72      [16] 2992 	ld	hl,(_mapa)
   839C E5            [11] 2993 	push	hl
   839D CD BA 4F      [17] 2994 	call	_getTilePtr
   83A0 F1            [10] 2995 	pop	af
   83A1 F1            [10] 2996 	pop	af
   83A2 4E            [ 7] 2997 	ld	c,(hl)
   83A3 3E 02         [ 7] 2998 	ld	a,#0x02
   83A5 91            [ 4] 2999 	sub	a, c
   83A6 38 39         [12] 3000 	jr	C,00148$
                           3001 ;src/main.c:577: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   83A8 DD 6E F9      [19] 3002 	ld	l,-7 (ix)
   83AB DD 66 FA      [19] 3003 	ld	h,-6 (ix)
   83AE 7E            [ 7] 3004 	ld	a,(hl)
   83AF C6 18         [ 7] 3005 	add	a, #0x18
   83B1 47            [ 4] 3006 	ld	b,a
   83B2 DD 6E F7      [19] 3007 	ld	l,-9 (ix)
   83B5 DD 66 F8      [19] 3008 	ld	h,-8 (ix)
   83B8 7E            [ 7] 3009 	ld	a,(hl)
   83B9 C6 04         [ 7] 3010 	add	a, #0x04
   83BB C5            [11] 3011 	push	bc
   83BC 33            [ 6] 3012 	inc	sp
   83BD F5            [11] 3013 	push	af
   83BE 33            [ 6] 3014 	inc	sp
   83BF 2A CE 72      [16] 3015 	ld	hl,(_mapa)
   83C2 E5            [11] 3016 	push	hl
   83C3 CD BA 4F      [17] 3017 	call	_getTilePtr
   83C6 F1            [10] 3018 	pop	af
   83C7 F1            [10] 3019 	pop	af
   83C8 4E            [ 7] 3020 	ld	c,(hl)
   83C9 3E 02         [ 7] 3021 	ld	a,#0x02
   83CB 91            [ 4] 3022 	sub	a, c
   83CC 38 13         [12] 3023 	jr	C,00148$
                           3024 ;src/main.c:578: moverEnemigoAbajo(enemy);
   83CE DD 6E F7      [19] 3025 	ld	l,-9 (ix)
   83D1 DD 66 F8      [19] 3026 	ld	h,-8 (ix)
   83D4 E5            [11] 3027 	push	hl
   83D5 CD 47 7B      [17] 3028 	call	_moverEnemigoAbajo
   83D8 F1            [10] 3029 	pop	af
                           3030 ;src/main.c:579: movY = 1;
   83D9 DD 36 F4 01   [19] 3031 	ld	-12 (ix),#0x01
                           3032 ;src/main.c:580: mov = 1;
   83DD DD 36 F3 01   [19] 3033 	ld	-13 (ix),#0x01
   83E1                    3034 00148$:
                           3035 ;src/main.c:583: if (!mov) {
   83E1 DD 7E F3      [19] 3036 	ld	a,-13 (ix)
   83E4 B7            [ 4] 3037 	or	a, a
   83E5 C2 03 86      [10] 3038 	jp	NZ,00189$
                           3039 ;src/main.c:584: if (!movX) {
   83E8 DD 7E F5      [19] 3040 	ld	a,-11 (ix)
   83EB B7            [ 4] 3041 	or	a, a
   83EC C2 F3 84      [10] 3042 	jp	NZ,00163$
                           3043 ;src/main.c:585: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   83EF DD 6E F9      [19] 3044 	ld	l,-7 (ix)
   83F2 DD 66 FA      [19] 3045 	ld	h,-6 (ix)
   83F5 5E            [ 7] 3046 	ld	e,(hl)
                           3047 ;src/main.c:495: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   83F6 DD 6E F7      [19] 3048 	ld	l,-9 (ix)
   83F9 DD 66 F8      [19] 3049 	ld	h,-8 (ix)
   83FC 4E            [ 7] 3050 	ld	c,(hl)
                           3051 ;src/main.c:585: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   83FD 3E 70         [ 7] 3052 	ld	a,#0x70
   83FF 93            [ 4] 3053 	sub	a, e
   8400 30 7C         [12] 3054 	jr	NC,00160$
                           3055 ;src/main.c:586: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   8402 7B            [ 4] 3056 	ld	a,e
   8403 C6 18         [ 7] 3057 	add	a, #0x18
   8405 47            [ 4] 3058 	ld	b,a
   8406 C5            [11] 3059 	push	bc
   8407 2A CE 72      [16] 3060 	ld	hl,(_mapa)
   840A E5            [11] 3061 	push	hl
   840B CD BA 4F      [17] 3062 	call	_getTilePtr
   840E F1            [10] 3063 	pop	af
   840F F1            [10] 3064 	pop	af
   8410 4E            [ 7] 3065 	ld	c,(hl)
   8411 3E 02         [ 7] 3066 	ld	a,#0x02
   8413 91            [ 4] 3067 	sub	a, c
   8414 38 5B         [12] 3068 	jr	C,00150$
                           3069 ;src/main.c:587: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   8416 DD 6E F9      [19] 3070 	ld	l,-7 (ix)
   8419 DD 66 FA      [19] 3071 	ld	h,-6 (ix)
   841C 7E            [ 7] 3072 	ld	a,(hl)
   841D C6 18         [ 7] 3073 	add	a, #0x18
   841F 57            [ 4] 3074 	ld	d,a
   8420 DD 6E F7      [19] 3075 	ld	l,-9 (ix)
   8423 DD 66 F8      [19] 3076 	ld	h,-8 (ix)
   8426 4E            [ 7] 3077 	ld	c,(hl)
   8427 41            [ 4] 3078 	ld	b,c
   8428 04            [ 4] 3079 	inc	b
   8429 04            [ 4] 3080 	inc	b
   842A D5            [11] 3081 	push	de
   842B 33            [ 6] 3082 	inc	sp
   842C C5            [11] 3083 	push	bc
   842D 33            [ 6] 3084 	inc	sp
   842E 2A CE 72      [16] 3085 	ld	hl,(_mapa)
   8431 E5            [11] 3086 	push	hl
   8432 CD BA 4F      [17] 3087 	call	_getTilePtr
   8435 F1            [10] 3088 	pop	af
   8436 F1            [10] 3089 	pop	af
   8437 4E            [ 7] 3090 	ld	c,(hl)
   8438 3E 02         [ 7] 3091 	ld	a,#0x02
   843A 91            [ 4] 3092 	sub	a, c
   843B 38 34         [12] 3093 	jr	C,00150$
                           3094 ;src/main.c:588: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   843D DD 6E F9      [19] 3095 	ld	l,-7 (ix)
   8440 DD 66 FA      [19] 3096 	ld	h,-6 (ix)
   8443 7E            [ 7] 3097 	ld	a,(hl)
   8444 C6 18         [ 7] 3098 	add	a, #0x18
   8446 47            [ 4] 3099 	ld	b,a
   8447 DD 6E F7      [19] 3100 	ld	l,-9 (ix)
   844A DD 66 F8      [19] 3101 	ld	h,-8 (ix)
   844D 7E            [ 7] 3102 	ld	a,(hl)
   844E C6 04         [ 7] 3103 	add	a, #0x04
   8450 C5            [11] 3104 	push	bc
   8451 33            [ 6] 3105 	inc	sp
   8452 F5            [11] 3106 	push	af
   8453 33            [ 6] 3107 	inc	sp
   8454 2A CE 72      [16] 3108 	ld	hl,(_mapa)
   8457 E5            [11] 3109 	push	hl
   8458 CD BA 4F      [17] 3110 	call	_getTilePtr
   845B F1            [10] 3111 	pop	af
   845C F1            [10] 3112 	pop	af
   845D 4E            [ 7] 3113 	ld	c,(hl)
   845E 3E 02         [ 7] 3114 	ld	a,#0x02
   8460 91            [ 4] 3115 	sub	a, c
   8461 38 0E         [12] 3116 	jr	C,00150$
                           3117 ;src/main.c:589: moverEnemigoAbajo(enemy);
   8463 DD 6E F7      [19] 3118 	ld	l,-9 (ix)
   8466 DD 66 F8      [19] 3119 	ld	h,-8 (ix)
   8469 E5            [11] 3120 	push	hl
   846A CD 47 7B      [17] 3121 	call	_moverEnemigoAbajo
   846D F1            [10] 3122 	pop	af
   846E C3 F3 84      [10] 3123 	jp	00163$
   8471                    3124 00150$:
                           3125 ;src/main.c:591: moverEnemigoArriba(enemy);
   8471 DD 6E F7      [19] 3126 	ld	l,-9 (ix)
   8474 DD 66 F8      [19] 3127 	ld	h,-8 (ix)
   8477 E5            [11] 3128 	push	hl
   8478 CD 28 7B      [17] 3129 	call	_moverEnemigoArriba
   847B F1            [10] 3130 	pop	af
   847C 18 75         [12] 3131 	jr	00163$
   847E                    3132 00160$:
                           3133 ;src/main.c:593: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   847E 43            [ 4] 3134 	ld	b,e
   847F 05            [ 4] 3135 	dec	b
   8480 05            [ 4] 3136 	dec	b
   8481 C5            [11] 3137 	push	bc
   8482 2A CE 72      [16] 3138 	ld	hl,(_mapa)
   8485 E5            [11] 3139 	push	hl
   8486 CD BA 4F      [17] 3140 	call	_getTilePtr
   8489 F1            [10] 3141 	pop	af
   848A F1            [10] 3142 	pop	af
   848B 4E            [ 7] 3143 	ld	c,(hl)
   848C 3E 02         [ 7] 3144 	ld	a,#0x02
   848E 91            [ 4] 3145 	sub	a, c
   848F 38 57         [12] 3146 	jr	C,00155$
                           3147 ;src/main.c:594: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   8491 DD 6E F9      [19] 3148 	ld	l,-7 (ix)
   8494 DD 66 FA      [19] 3149 	ld	h,-6 (ix)
   8497 56            [ 7] 3150 	ld	d,(hl)
   8498 15            [ 4] 3151 	dec	d
   8499 15            [ 4] 3152 	dec	d
   849A DD 6E F7      [19] 3153 	ld	l,-9 (ix)
   849D DD 66 F8      [19] 3154 	ld	h,-8 (ix)
   84A0 46            [ 7] 3155 	ld	b,(hl)
   84A1 04            [ 4] 3156 	inc	b
   84A2 04            [ 4] 3157 	inc	b
   84A3 D5            [11] 3158 	push	de
   84A4 33            [ 6] 3159 	inc	sp
   84A5 C5            [11] 3160 	push	bc
   84A6 33            [ 6] 3161 	inc	sp
   84A7 2A CE 72      [16] 3162 	ld	hl,(_mapa)
   84AA E5            [11] 3163 	push	hl
   84AB CD BA 4F      [17] 3164 	call	_getTilePtr
   84AE F1            [10] 3165 	pop	af
   84AF F1            [10] 3166 	pop	af
   84B0 4E            [ 7] 3167 	ld	c,(hl)
   84B1 3E 02         [ 7] 3168 	ld	a,#0x02
   84B3 91            [ 4] 3169 	sub	a, c
   84B4 38 32         [12] 3170 	jr	C,00155$
                           3171 ;src/main.c:595: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   84B6 DD 6E F9      [19] 3172 	ld	l,-7 (ix)
   84B9 DD 66 FA      [19] 3173 	ld	h,-6 (ix)
   84BC 46            [ 7] 3174 	ld	b,(hl)
   84BD 05            [ 4] 3175 	dec	b
   84BE 05            [ 4] 3176 	dec	b
   84BF DD 6E F7      [19] 3177 	ld	l,-9 (ix)
   84C2 DD 66 F8      [19] 3178 	ld	h,-8 (ix)
   84C5 7E            [ 7] 3179 	ld	a,(hl)
   84C6 C6 04         [ 7] 3180 	add	a, #0x04
   84C8 C5            [11] 3181 	push	bc
   84C9 33            [ 6] 3182 	inc	sp
   84CA F5            [11] 3183 	push	af
   84CB 33            [ 6] 3184 	inc	sp
   84CC 2A CE 72      [16] 3185 	ld	hl,(_mapa)
   84CF E5            [11] 3186 	push	hl
   84D0 CD BA 4F      [17] 3187 	call	_getTilePtr
   84D3 F1            [10] 3188 	pop	af
   84D4 F1            [10] 3189 	pop	af
   84D5 4E            [ 7] 3190 	ld	c,(hl)
   84D6 3E 02         [ 7] 3191 	ld	a,#0x02
   84D8 91            [ 4] 3192 	sub	a, c
   84D9 38 0D         [12] 3193 	jr	C,00155$
                           3194 ;src/main.c:596: moverEnemigoArriba(enemy);
   84DB DD 6E F7      [19] 3195 	ld	l,-9 (ix)
   84DE DD 66 F8      [19] 3196 	ld	h,-8 (ix)
   84E1 E5            [11] 3197 	push	hl
   84E2 CD 28 7B      [17] 3198 	call	_moverEnemigoArriba
   84E5 F1            [10] 3199 	pop	af
   84E6 18 0B         [12] 3200 	jr	00163$
   84E8                    3201 00155$:
                           3202 ;src/main.c:598: moverEnemigoAbajo(enemy);
   84E8 DD 6E F7      [19] 3203 	ld	l,-9 (ix)
   84EB DD 66 F8      [19] 3204 	ld	h,-8 (ix)
   84EE E5            [11] 3205 	push	hl
   84EF CD 47 7B      [17] 3206 	call	_moverEnemigoAbajo
   84F2 F1            [10] 3207 	pop	af
   84F3                    3208 00163$:
                           3209 ;src/main.c:602: if (!movY) {
   84F3 DD 7E F4      [19] 3210 	ld	a,-12 (ix)
   84F6 B7            [ 4] 3211 	or	a, a
   84F7 C2 03 86      [10] 3212 	jp	NZ,00189$
                           3213 ;src/main.c:603: if (enemy->x < ANCHO_PANTALLA/2) {
   84FA DD 6E F7      [19] 3214 	ld	l,-9 (ix)
   84FD DD 66 F8      [19] 3215 	ld	h,-8 (ix)
   8500 4E            [ 7] 3216 	ld	c,(hl)
                           3217 ;src/main.c:496: u8 dify = abs(enemy->y - prota.y);
   8501 DD 6E F9      [19] 3218 	ld	l,-7 (ix)
   8504 DD 66 FA      [19] 3219 	ld	h,-6 (ix)
   8507 5E            [ 7] 3220 	ld	e,(hl)
                           3221 ;src/main.c:603: if (enemy->x < ANCHO_PANTALLA/2) {
   8508 79            [ 4] 3222 	ld	a,c
   8509 D6 28         [ 7] 3223 	sub	a, #0x28
   850B D2 8B 85      [10] 3224 	jp	NC,00175$
                           3225 ;src/main.c:604: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   850E 41            [ 4] 3226 	ld	b,c
   850F 05            [ 4] 3227 	dec	b
   8510 7B            [ 4] 3228 	ld	a,e
   8511 F5            [11] 3229 	push	af
   8512 33            [ 6] 3230 	inc	sp
   8513 C5            [11] 3231 	push	bc
   8514 33            [ 6] 3232 	inc	sp
   8515 2A CE 72      [16] 3233 	ld	hl,(_mapa)
   8518 E5            [11] 3234 	push	hl
   8519 CD BA 4F      [17] 3235 	call	_getTilePtr
   851C F1            [10] 3236 	pop	af
   851D F1            [10] 3237 	pop	af
   851E 4E            [ 7] 3238 	ld	c,(hl)
   851F 3E 02         [ 7] 3239 	ld	a,#0x02
   8521 91            [ 4] 3240 	sub	a, c
   8522 38 5A         [12] 3241 	jr	C,00165$
                           3242 ;src/main.c:605: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   8524 DD 6E F9      [19] 3243 	ld	l,-7 (ix)
   8527 DD 66 FA      [19] 3244 	ld	h,-6 (ix)
   852A 7E            [ 7] 3245 	ld	a,(hl)
   852B C6 0B         [ 7] 3246 	add	a, #0x0B
   852D 4F            [ 4] 3247 	ld	c,a
   852E DD 6E F7      [19] 3248 	ld	l,-9 (ix)
   8531 DD 66 F8      [19] 3249 	ld	h,-8 (ix)
   8534 46            [ 7] 3250 	ld	b,(hl)
   8535 05            [ 4] 3251 	dec	b
   8536 79            [ 4] 3252 	ld	a,c
   8537 F5            [11] 3253 	push	af
   8538 33            [ 6] 3254 	inc	sp
   8539 C5            [11] 3255 	push	bc
   853A 33            [ 6] 3256 	inc	sp
   853B 2A CE 72      [16] 3257 	ld	hl,(_mapa)
   853E E5            [11] 3258 	push	hl
   853F CD BA 4F      [17] 3259 	call	_getTilePtr
   8542 F1            [10] 3260 	pop	af
   8543 F1            [10] 3261 	pop	af
   8544 4E            [ 7] 3262 	ld	c,(hl)
   8545 3E 02         [ 7] 3263 	ld	a,#0x02
   8547 91            [ 4] 3264 	sub	a, c
   8548 38 34         [12] 3265 	jr	C,00165$
                           3266 ;src/main.c:606: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   854A DD 6E F9      [19] 3267 	ld	l,-7 (ix)
   854D DD 66 FA      [19] 3268 	ld	h,-6 (ix)
   8550 7E            [ 7] 3269 	ld	a,(hl)
   8551 C6 16         [ 7] 3270 	add	a, #0x16
   8553 4F            [ 4] 3271 	ld	c,a
   8554 DD 6E F7      [19] 3272 	ld	l,-9 (ix)
   8557 DD 66 F8      [19] 3273 	ld	h,-8 (ix)
   855A 46            [ 7] 3274 	ld	b,(hl)
   855B 05            [ 4] 3275 	dec	b
   855C 79            [ 4] 3276 	ld	a,c
   855D F5            [11] 3277 	push	af
   855E 33            [ 6] 3278 	inc	sp
   855F C5            [11] 3279 	push	bc
   8560 33            [ 6] 3280 	inc	sp
   8561 2A CE 72      [16] 3281 	ld	hl,(_mapa)
   8564 E5            [11] 3282 	push	hl
   8565 CD BA 4F      [17] 3283 	call	_getTilePtr
   8568 F1            [10] 3284 	pop	af
   8569 F1            [10] 3285 	pop	af
   856A 4E            [ 7] 3286 	ld	c,(hl)
   856B 3E 02         [ 7] 3287 	ld	a,#0x02
   856D 91            [ 4] 3288 	sub	a, c
   856E 38 0E         [12] 3289 	jr	C,00165$
                           3290 ;src/main.c:607: moverEnemigoIzquierda(enemy);
   8570 DD 6E F7      [19] 3291 	ld	l,-9 (ix)
   8573 DD 66 F8      [19] 3292 	ld	h,-8 (ix)
   8576 E5            [11] 3293 	push	hl
   8577 CD 76 7B      [17] 3294 	call	_moverEnemigoIzquierda
   857A F1            [10] 3295 	pop	af
   857B C3 03 86      [10] 3296 	jp	00189$
   857E                    3297 00165$:
                           3298 ;src/main.c:609: moverEnemigoDerecha(enemy);
   857E DD 6E F7      [19] 3299 	ld	l,-9 (ix)
   8581 DD 66 F8      [19] 3300 	ld	h,-8 (ix)
   8584 E5            [11] 3301 	push	hl
   8585 CD 66 7B      [17] 3302 	call	_moverEnemigoDerecha
   8588 F1            [10] 3303 	pop	af
   8589 18 78         [12] 3304 	jr	00189$
   858B                    3305 00175$:
                           3306 ;src/main.c:612: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   858B 79            [ 4] 3307 	ld	a,c
   858C C6 05         [ 7] 3308 	add	a, #0x05
   858E 47            [ 4] 3309 	ld	b,a
   858F 7B            [ 4] 3310 	ld	a,e
   8590 F5            [11] 3311 	push	af
   8591 33            [ 6] 3312 	inc	sp
   8592 C5            [11] 3313 	push	bc
   8593 33            [ 6] 3314 	inc	sp
   8594 2A CE 72      [16] 3315 	ld	hl,(_mapa)
   8597 E5            [11] 3316 	push	hl
   8598 CD BA 4F      [17] 3317 	call	_getTilePtr
   859B F1            [10] 3318 	pop	af
   859C F1            [10] 3319 	pop	af
   859D 4E            [ 7] 3320 	ld	c,(hl)
   859E 3E 02         [ 7] 3321 	ld	a,#0x02
   85A0 91            [ 4] 3322 	sub	a, c
   85A1 38 55         [12] 3323 	jr	C,00170$
                           3324 ;src/main.c:613: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   85A3 DD 6E F9      [19] 3325 	ld	l,-7 (ix)
   85A6 DD 66 FA      [19] 3326 	ld	h,-6 (ix)
   85A9 7E            [ 7] 3327 	ld	a,(hl)
   85AA C6 0B         [ 7] 3328 	add	a, #0x0B
   85AC 47            [ 4] 3329 	ld	b,a
   85AD DD 6E F7      [19] 3330 	ld	l,-9 (ix)
   85B0 DD 66 F8      [19] 3331 	ld	h,-8 (ix)
   85B3 7E            [ 7] 3332 	ld	a,(hl)
   85B4 C6 05         [ 7] 3333 	add	a, #0x05
   85B6 4F            [ 4] 3334 	ld	c,a
   85B7 C5            [11] 3335 	push	bc
   85B8 2A CE 72      [16] 3336 	ld	hl,(_mapa)
   85BB E5            [11] 3337 	push	hl
   85BC CD BA 4F      [17] 3338 	call	_getTilePtr
   85BF F1            [10] 3339 	pop	af
   85C0 F1            [10] 3340 	pop	af
   85C1 4E            [ 7] 3341 	ld	c,(hl)
   85C2 3E 02         [ 7] 3342 	ld	a,#0x02
   85C4 91            [ 4] 3343 	sub	a, c
   85C5 38 31         [12] 3344 	jr	C,00170$
                           3345 ;src/main.c:614: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   85C7 DD 6E F9      [19] 3346 	ld	l,-7 (ix)
   85CA DD 66 FA      [19] 3347 	ld	h,-6 (ix)
   85CD 7E            [ 7] 3348 	ld	a,(hl)
   85CE C6 16         [ 7] 3349 	add	a, #0x16
   85D0 47            [ 4] 3350 	ld	b,a
   85D1 DD 6E F7      [19] 3351 	ld	l,-9 (ix)
   85D4 DD 66 F8      [19] 3352 	ld	h,-8 (ix)
   85D7 7E            [ 7] 3353 	ld	a,(hl)
   85D8 C6 05         [ 7] 3354 	add	a, #0x05
   85DA 4F            [ 4] 3355 	ld	c,a
   85DB C5            [11] 3356 	push	bc
   85DC 2A CE 72      [16] 3357 	ld	hl,(_mapa)
   85DF E5            [11] 3358 	push	hl
   85E0 CD BA 4F      [17] 3359 	call	_getTilePtr
   85E3 F1            [10] 3360 	pop	af
   85E4 F1            [10] 3361 	pop	af
   85E5 4E            [ 7] 3362 	ld	c,(hl)
   85E6 3E 02         [ 7] 3363 	ld	a,#0x02
   85E8 91            [ 4] 3364 	sub	a, c
   85E9 38 0D         [12] 3365 	jr	C,00170$
                           3366 ;src/main.c:615: moverEnemigoDerecha(enemy);
   85EB DD 6E F7      [19] 3367 	ld	l,-9 (ix)
   85EE DD 66 F8      [19] 3368 	ld	h,-8 (ix)
   85F1 E5            [11] 3369 	push	hl
   85F2 CD 66 7B      [17] 3370 	call	_moverEnemigoDerecha
   85F5 F1            [10] 3371 	pop	af
   85F6 18 0B         [12] 3372 	jr	00189$
   85F8                    3373 00170$:
                           3374 ;src/main.c:618: moverEnemigoIzquierda(enemy);
   85F8 DD 6E F7      [19] 3375 	ld	l,-9 (ix)
   85FB DD 66 F8      [19] 3376 	ld	h,-8 (ix)
   85FE E5            [11] 3377 	push	hl
   85FF CD 76 7B      [17] 3378 	call	_moverEnemigoIzquierda
   8602 F1            [10] 3379 	pop	af
   8603                    3380 00189$:
   8603 DD F9         [10] 3381 	ld	sp, ix
   8605 DD E1         [14] 3382 	pop	ix
   8607 C9            [10] 3383 	ret
                           3384 ;src/main.c:627: void updateEnemies() { // maquina de estados
                           3385 ;	---------------------------------
                           3386 ; Function updateEnemies
                           3387 ; ---------------------------------
   8608                    3388 _updateEnemies::
   8608 DD E5         [15] 3389 	push	ix
   860A DD 21 00 00   [14] 3390 	ld	ix,#0
   860E DD 39         [15] 3391 	add	ix,sp
   8610 F5            [11] 3392 	push	af
   8611 F5            [11] 3393 	push	af
                           3394 ;src/main.c:628: u8 i = 1 + 1;
   8612 DD 36 FC 02   [19] 3395 	ld	-4 (ix),#0x02
                           3396 ;src/main.c:632: actual = enemy;
                           3397 ;src/main.c:634: while (--i) {
   8616 DD 36 FE FE   [19] 3398 	ld	-2 (ix),#<(_enemy)
   861A DD 36 FF 64   [19] 3399 	ld	-1 (ix),#>(_enemy)
   861E                    3400 00123$:
   861E DD 35 FC      [23] 3401 	dec	-4 (ix)
   8621 DD 4E FC      [19] 3402 	ld	c, -4 (ix)
   8624 79            [ 4] 3403 	ld	a,c
   8625 B7            [ 4] 3404 	or	a, a
   8626 CA 35 87      [10] 3405 	jp	Z,00126$
                           3406 ;src/main.c:635: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   8629 3A 14 65      [13] 3407 	ld	a, (#(_enemy + 0x0016) + 0)
   862C B7            [ 4] 3408 	or	a, a
   862D 28 1C         [12] 3409 	jr	Z,00121$
                           3410 ;src/main.c:636: engage(actual, prota.x, prota.y);
   862F 3A 17 6A      [13] 3411 	ld	a,(#(_prota + 0x0001) + 0)
   8632 DD 77 FD      [19] 3412 	ld	-3 (ix),a
   8635 21 16 6A      [10] 3413 	ld	hl, #_prota + 0
   8638 46            [ 7] 3414 	ld	b,(hl)
   8639 DD 7E FD      [19] 3415 	ld	a,-3 (ix)
   863C F5            [11] 3416 	push	af
   863D 33            [ 6] 3417 	inc	sp
   863E C5            [11] 3418 	push	bc
   863F 33            [ 6] 3419 	inc	sp
   8640 21 FE 64      [10] 3420 	ld	hl,#_enemy
   8643 E5            [11] 3421 	push	hl
   8644 CD 12 7F      [17] 3422 	call	_engage
   8647 F1            [10] 3423 	pop	af
   8648 F1            [10] 3424 	pop	af
   8649 18 D3         [12] 3425 	jr	00123$
   864B                    3426 00121$:
                           3427 ;src/main.c:638: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   864B 21 FE 64      [10] 3428 	ld	hl,#_enemy
   864E E5            [11] 3429 	push	hl
   864F CD 04 7D      [17] 3430 	call	_lookFor
   8652 F1            [10] 3431 	pop	af
                           3432 ;src/main.c:639: if (actual->patrolling) { // esta patrullando
   8653 3A 09 65      [13] 3433 	ld	a, (#(_enemy + 0x000b) + 0)
   8656 B7            [ 4] 3434 	or	a, a
   8657 CA F4 86      [10] 3435 	jp	Z,00118$
                           3436 ;src/main.c:640: if (!actual->seen && !actual->inRange) {
   865A 21 10 65      [10] 3437 	ld	hl, #(_enemy + 0x0012) + 0
   865D 4E            [ 7] 3438 	ld	c,(hl)
   865E 79            [ 4] 3439 	ld	a,c
   865F B7            [ 4] 3440 	or	a, a
   8660 20 10         [12] 3441 	jr	NZ,00107$
   8662 3A 0F 65      [13] 3442 	ld	a, (#(_enemy + 0x0011) + 0)
   8665 B7            [ 4] 3443 	or	a, a
   8666 20 0A         [12] 3444 	jr	NZ,00107$
                           3445 ;src/main.c:641: patrol(actual);
   8668 21 FE 64      [10] 3446 	ld	hl,#_enemy
   866B E5            [11] 3447 	push	hl
   866C CD F6 7E      [17] 3448 	call	_patrol
   866F F1            [10] 3449 	pop	af
   8670 18 AC         [12] 3450 	jr	00123$
   8672                    3451 00107$:
                           3452 ;src/main.c:642: }else if (actual->inRange) {
                           3453 ;src/main.c:645: actual->onPathPatrol = 0;
                           3454 ;src/main.c:642: }else if (actual->inRange) {
   8672 3A 0F 65      [13] 3455 	ld	a,(#(_enemy + 0x0011) + 0)
   8675 B7            [ 4] 3456 	or	a, a
   8676 28 24         [12] 3457 	jr	Z,00104$
                           3458 ;src/main.c:643: engage(actual, prota.x, prota.y);
   8678 21 17 6A      [10] 3459 	ld	hl, #(_prota + 0x0001) + 0
   867B 46            [ 7] 3460 	ld	b,(hl)
   867C 21 16 6A      [10] 3461 	ld	hl, #_prota + 0
   867F 4E            [ 7] 3462 	ld	c, (hl)
   8680 C5            [11] 3463 	push	bc
   8681 21 FE 64      [10] 3464 	ld	hl,#_enemy
   8684 E5            [11] 3465 	push	hl
   8685 CD 12 7F      [17] 3466 	call	_engage
   8688 F1            [10] 3467 	pop	af
   8689 F1            [10] 3468 	pop	af
                           3469 ;src/main.c:644: actual->patrolling = 0;
   868A 21 09 65      [10] 3470 	ld	hl,#(_enemy + 0x000b)
   868D 36 00         [10] 3471 	ld	(hl),#0x00
                           3472 ;src/main.c:645: actual->onPathPatrol = 0;
   868F 21 0A 65      [10] 3473 	ld	hl,#(_enemy + 0x000c)
   8692 36 00         [10] 3474 	ld	(hl),#0x00
                           3475 ;src/main.c:646: actual->engage = 1;
   8694 21 14 65      [10] 3476 	ld	hl,#(_enemy + 0x0016)
   8697 36 01         [10] 3477 	ld	(hl),#0x01
   8699 C3 1E 86      [10] 3478 	jp	00123$
   869C                    3479 00104$:
                           3480 ;src/main.c:647: } else if (actual->seen) {
   869C 79            [ 4] 3481 	ld	a,c
   869D B7            [ 4] 3482 	or	a, a
   869E CA 1E 86      [10] 3483 	jp	Z,00123$
                           3484 ;src/main.c:649: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   86A1 21 17 6A      [10] 3485 	ld	hl, #(_prota + 0x0001) + 0
   86A4 46            [ 7] 3486 	ld	b,(hl)
   86A5 21 16 6A      [10] 3487 	ld	hl, #_prota + 0
   86A8 4E            [ 7] 3488 	ld	c,(hl)
   86A9 21 FF 64      [10] 3489 	ld	hl, #(_enemy + 0x0001) + 0
   86AC 5E            [ 7] 3490 	ld	e,(hl)
   86AD 21 FE 64      [10] 3491 	ld	hl, #_enemy + 0
   86B0 56            [ 7] 3492 	ld	d,(hl)
   86B1 2A CE 72      [16] 3493 	ld	hl,(_mapa)
   86B4 E5            [11] 3494 	push	hl
   86B5 21 FE 64      [10] 3495 	ld	hl,#_enemy
   86B8 E5            [11] 3496 	push	hl
   86B9 C5            [11] 3497 	push	bc
   86BA 7B            [ 4] 3498 	ld	a,e
   86BB F5            [11] 3499 	push	af
   86BC 33            [ 6] 3500 	inc	sp
   86BD D5            [11] 3501 	push	de
   86BE 33            [ 6] 3502 	inc	sp
   86BF CD 6F 4C      [17] 3503 	call	_pathFinding
   86C2 21 08 00      [10] 3504 	ld	hl,#8
   86C5 39            [11] 3505 	add	hl,sp
   86C6 F9            [ 6] 3506 	ld	sp,hl
                           3507 ;src/main.c:650: actual->p_seek_x = actual->x;
   86C7 3A FE 64      [13] 3508 	ld	a, (#_enemy + 0)
   86CA 32 15 65      [13] 3509 	ld	(#(_enemy + 0x0017)),a
                           3510 ;src/main.c:651: actual->p_seek_y = actual->y;
   86CD 3A FF 64      [13] 3511 	ld	a, (#(_enemy + 0x0001) + 0)
   86D0 32 16 65      [13] 3512 	ld	(#(_enemy + 0x0018)),a
                           3513 ;src/main.c:652: actual->seek = 1;
   86D3 21 12 65      [10] 3514 	ld	hl,#(_enemy + 0x0014)
   86D6 36 01         [10] 3515 	ld	(hl),#0x01
                           3516 ;src/main.c:653: actual->iter=0;
   86D8 21 0D 65      [10] 3517 	ld	hl,#(_enemy + 0x000f)
   86DB 36 00         [10] 3518 	ld	(hl),#0x00
                           3519 ;src/main.c:654: actual->reversePatrol = NO;
   86DD 21 0B 65      [10] 3520 	ld	hl,#(_enemy + 0x000d)
   86E0 36 00         [10] 3521 	ld	(hl),#0x00
                           3522 ;src/main.c:655: actual->patrolling = 0;
   86E2 21 09 65      [10] 3523 	ld	hl,#(_enemy + 0x000b)
   86E5 36 00         [10] 3524 	ld	(hl),#0x00
                           3525 ;src/main.c:656: actual->onPathPatrol = 0;
   86E7 21 0A 65      [10] 3526 	ld	hl,#(_enemy + 0x000c)
   86EA 36 00         [10] 3527 	ld	(hl),#0x00
                           3528 ;src/main.c:657: actual->seen = 0;
   86EC 21 10 65      [10] 3529 	ld	hl,#(_enemy + 0x0012)
   86EF 36 00         [10] 3530 	ld	(hl),#0x00
   86F1 C3 1E 86      [10] 3531 	jp	00123$
   86F4                    3532 00118$:
                           3533 ;src/main.c:659: } else if (actual->seek) { // esta buscando
   86F4 3A 12 65      [13] 3534 	ld	a, (#(_enemy + 0x0014) + 0)
   86F7 B7            [ 4] 3535 	or	a, a
   86F8 CA 1E 86      [10] 3536 	jp	Z,00123$
                           3537 ;src/main.c:660: if (!actual->found /*&& actual->seekTimer <= 5*/) {
   86FB DD 6E FE      [19] 3538 	ld	l,-2 (ix)
   86FE DD 66 FF      [19] 3539 	ld	h,-1 (ix)
   8701 11 13 00      [10] 3540 	ld	de, #0x0013
   8704 19            [11] 3541 	add	hl, de
   8705 7E            [ 7] 3542 	ld	a,(hl)
   8706 B7            [ 4] 3543 	or	a, a
   8707 20 0B         [12] 3544 	jr	NZ,00113$
                           3545 ;src/main.c:661: seek(actual); // buscar en posiciones cercanas a la actual
   8709 21 FE 64      [10] 3546 	ld	hl,#_enemy
   870C E5            [11] 3547 	push	hl
   870D CD 08 7F      [17] 3548 	call	_seek
   8710 F1            [10] 3549 	pop	af
   8711 C3 1E 86      [10] 3550 	jp	00123$
   8714                    3551 00113$:
                           3552 ;src/main.c:662: } else if (actual->inRange) {
   8714 3A 0F 65      [13] 3553 	ld	a, (#(_enemy + 0x0011) + 0)
   8717 B7            [ 4] 3554 	or	a, a
   8718 CA 1E 86      [10] 3555 	jp	Z,00123$
                           3556 ;src/main.c:663: engage(actual, prota.x, prota.y);
   871B 21 17 6A      [10] 3557 	ld	hl, #(_prota + 0x0001) + 0
   871E 46            [ 7] 3558 	ld	b,(hl)
   871F 21 16 6A      [10] 3559 	ld	hl, #_prota + 0
   8722 4E            [ 7] 3560 	ld	c, (hl)
   8723 C5            [11] 3561 	push	bc
   8724 21 FE 64      [10] 3562 	ld	hl,#_enemy
   8727 E5            [11] 3563 	push	hl
   8728 CD 12 7F      [17] 3564 	call	_engage
   872B F1            [10] 3565 	pop	af
   872C F1            [10] 3566 	pop	af
                           3567 ;src/main.c:664: actual->engage = 1;
   872D 21 14 65      [10] 3568 	ld	hl,#(_enemy + 0x0016)
   8730 36 01         [10] 3569 	ld	(hl),#0x01
   8732 C3 1E 86      [10] 3570 	jp	00123$
   8735                    3571 00126$:
   8735 DD F9         [10] 3572 	ld	sp, ix
   8737 DD E1         [14] 3573 	pop	ix
   8739 C9            [10] 3574 	ret
                           3575 ;src/main.c:671: void inicializarEnemy() {
                           3576 ;	---------------------------------
                           3577 ; Function inicializarEnemy
                           3578 ; ---------------------------------
   873A                    3579 _inicializarEnemy::
   873A DD E5         [15] 3580 	push	ix
   873C DD 21 00 00   [14] 3581 	ld	ix,#0
   8740 DD 39         [15] 3582 	add	ix,sp
   8742 21 F9 FF      [10] 3583 	ld	hl,#-7
   8745 39            [11] 3584 	add	hl,sp
   8746 F9            [ 6] 3585 	ld	sp,hl
                           3586 ;src/main.c:682: actual = enemy;
   8747 01 FE 64      [10] 3587 	ld	bc,#_enemy+0
                           3588 ;src/main.c:683: while(--i){
   874A DD 36 F9 02   [19] 3589 	ld	-7 (ix),#0x02
   874E                    3590 00101$:
   874E DD 35 F9      [23] 3591 	dec	-7 (ix)
   8751 DD 7E F9      [19] 3592 	ld	a,-7 (ix)
   8754 B7            [ 4] 3593 	or	a, a
   8755 CA 2B 88      [10] 3594 	jp	Z,00104$
                           3595 ;src/main.c:684: actual->x = actual->px = spawnX[i];
   8758 59            [ 4] 3596 	ld	e, c
   8759 50            [ 4] 3597 	ld	d, b
   875A 13            [ 6] 3598 	inc	de
   875B 13            [ 6] 3599 	inc	de
   875C 3E F4         [ 7] 3600 	ld	a,#<(_spawnX)
   875E DD 86 F9      [19] 3601 	add	a, -7 (ix)
   8761 DD 77 FA      [19] 3602 	ld	-6 (ix),a
   8764 3E 72         [ 7] 3603 	ld	a,#>(_spawnX)
   8766 CE 00         [ 7] 3604 	adc	a, #0x00
   8768 DD 77 FB      [19] 3605 	ld	-5 (ix),a
   876B DD 6E FA      [19] 3606 	ld	l,-6 (ix)
   876E DD 66 FB      [19] 3607 	ld	h,-5 (ix)
   8771 7E            [ 7] 3608 	ld	a,(hl)
   8772 DD 77 FE      [19] 3609 	ld	-2 (ix), a
   8775 12            [ 7] 3610 	ld	(de),a
   8776 DD 7E FE      [19] 3611 	ld	a,-2 (ix)
   8779 02            [ 7] 3612 	ld	(bc),a
                           3613 ;src/main.c:685: actual->y = actual->py = spawnY[i];
   877A 59            [ 4] 3614 	ld	e, c
   877B 50            [ 4] 3615 	ld	d, b
   877C 13            [ 6] 3616 	inc	de
   877D 21 03 00      [10] 3617 	ld	hl,#0x0003
   8780 09            [11] 3618 	add	hl,bc
   8781 DD 75 FC      [19] 3619 	ld	-4 (ix),l
   8784 DD 74 FD      [19] 3620 	ld	-3 (ix),h
   8787 FD 21 F9 72   [14] 3621 	ld	iy,#_spawnY
   878B C5            [11] 3622 	push	bc
   878C DD 4E F9      [19] 3623 	ld	c,-7 (ix)
   878F 06 00         [ 7] 3624 	ld	b,#0x00
   8791 FD 09         [15] 3625 	add	iy, bc
   8793 C1            [10] 3626 	pop	bc
   8794 FD 7E 00      [19] 3627 	ld	a, 0 (iy)
   8797 DD 77 FF      [19] 3628 	ld	-1 (ix),a
   879A DD 6E FC      [19] 3629 	ld	l,-4 (ix)
   879D DD 66 FD      [19] 3630 	ld	h,-3 (ix)
   87A0 DD 7E FF      [19] 3631 	ld	a,-1 (ix)
   87A3 77            [ 7] 3632 	ld	(hl),a
   87A4 DD 7E FF      [19] 3633 	ld	a,-1 (ix)
   87A7 12            [ 7] 3634 	ld	(de),a
                           3635 ;src/main.c:686: actual->mover  = NO;
   87A8 21 06 00      [10] 3636 	ld	hl,#0x0006
   87AB 09            [11] 3637 	add	hl,bc
   87AC 36 00         [10] 3638 	ld	(hl),#0x00
                           3639 ;src/main.c:687: actual->mira   = M_abajo;
   87AE 21 07 00      [10] 3640 	ld	hl,#0x0007
   87B1 09            [11] 3641 	add	hl,bc
   87B2 36 03         [10] 3642 	ld	(hl),#0x03
                           3643 ;src/main.c:688: actual->sprite = g_enemy;
   87B4 21 04 00      [10] 3644 	ld	hl,#0x0004
   87B7 09            [11] 3645 	add	hl,bc
   87B8 36 3A         [10] 3646 	ld	(hl),#<(_g_enemy)
   87BA 23            [ 6] 3647 	inc	hl
   87BB 36 3C         [10] 3648 	ld	(hl),#>(_g_enemy)
                           3649 ;src/main.c:689: actual->muerto = NO;
   87BD 21 08 00      [10] 3650 	ld	hl,#0x0008
   87C0 09            [11] 3651 	add	hl,bc
   87C1 36 00         [10] 3652 	ld	(hl),#0x00
                           3653 ;src/main.c:690: actual->muertes = 0;
   87C3 21 0A 00      [10] 3654 	ld	hl,#0x000A
   87C6 09            [11] 3655 	add	hl,bc
   87C7 36 00         [10] 3656 	ld	(hl),#0x00
                           3657 ;src/main.c:691: actual->patrolling = SI;
   87C9 21 0B 00      [10] 3658 	ld	hl,#0x000B
   87CC 09            [11] 3659 	add	hl,bc
   87CD 36 01         [10] 3660 	ld	(hl),#0x01
                           3661 ;src/main.c:692: actual->onPathPatrol = SI;
   87CF 21 0C 00      [10] 3662 	ld	hl,#0x000C
   87D2 09            [11] 3663 	add	hl,bc
   87D3 36 01         [10] 3664 	ld	(hl),#0x01
                           3665 ;src/main.c:693: actual->reversePatrol = NO;
   87D5 21 0D 00      [10] 3666 	ld	hl,#0x000D
   87D8 09            [11] 3667 	add	hl,bc
   87D9 36 00         [10] 3668 	ld	(hl),#0x00
                           3669 ;src/main.c:694: actual->iter = 0;
   87DB 21 0F 00      [10] 3670 	ld	hl,#0x000F
   87DE 09            [11] 3671 	add	hl,bc
   87DF 36 00         [10] 3672 	ld	(hl),#0x00
                           3673 ;src/main.c:695: actual->lastIter = 0;
   87E1 21 10 00      [10] 3674 	ld	hl,#0x0010
   87E4 09            [11] 3675 	add	hl,bc
   87E5 36 00         [10] 3676 	ld	(hl),#0x00
                           3677 ;src/main.c:696: actual->seen = 0;
   87E7 21 12 00      [10] 3678 	ld	hl,#0x0012
   87EA 09            [11] 3679 	add	hl,bc
   87EB 36 00         [10] 3680 	ld	(hl),#0x00
                           3681 ;src/main.c:697: actual->found = 0;
   87ED 21 13 00      [10] 3682 	ld	hl,#0x0013
   87F0 09            [11] 3683 	add	hl,bc
   87F1 36 00         [10] 3684 	ld	(hl),#0x00
                           3685 ;src/main.c:698: pathFinding(actual->x, actual->y, spawnX[i] - 20, spawnY[i], actual, mapa); // calculo rutas de patrulla
   87F3 FD 5E 00      [19] 3686 	ld	e, 0 (iy)
   87F6 DD 6E FA      [19] 3687 	ld	l,-6 (ix)
   87F9 DD 66 FB      [19] 3688 	ld	h,-5 (ix)
   87FC 7E            [ 7] 3689 	ld	a,(hl)
   87FD C6 EC         [ 7] 3690 	add	a,#0xEC
   87FF 57            [ 4] 3691 	ld	d,a
   8800 C5            [11] 3692 	push	bc
   8801 2A CE 72      [16] 3693 	ld	hl,(_mapa)
   8804 E5            [11] 3694 	push	hl
   8805 C5            [11] 3695 	push	bc
   8806 7B            [ 4] 3696 	ld	a,e
   8807 F5            [11] 3697 	push	af
   8808 33            [ 6] 3698 	inc	sp
   8809 D5            [11] 3699 	push	de
   880A 33            [ 6] 3700 	inc	sp
   880B DD 66 FF      [19] 3701 	ld	h,-1 (ix)
   880E DD 6E FE      [19] 3702 	ld	l,-2 (ix)
   8811 E5            [11] 3703 	push	hl
   8812 CD 6F 4C      [17] 3704 	call	_pathFinding
   8815 21 08 00      [10] 3705 	ld	hl,#8
   8818 39            [11] 3706 	add	hl,sp
   8819 F9            [ 6] 3707 	ld	sp,hl
   881A C1            [10] 3708 	pop	bc
                           3709 ;src/main.c:721: dibujarEnemigo(actual);
   881B C5            [11] 3710 	push	bc
   881C C5            [11] 3711 	push	bc
   881D CD 88 75      [17] 3712 	call	_dibujarEnemigo
   8820 F1            [10] 3713 	pop	af
   8821 C1            [10] 3714 	pop	bc
                           3715 ;src/main.c:723: ++actual;
   8822 21 46 01      [10] 3716 	ld	hl,#0x0146
   8825 09            [11] 3717 	add	hl,bc
   8826 4D            [ 4] 3718 	ld	c,l
   8827 44            [ 4] 3719 	ld	b,h
   8828 C3 4E 87      [10] 3720 	jp	00101$
   882B                    3721 00104$:
   882B DD F9         [10] 3722 	ld	sp, ix
   882D DD E1         [14] 3723 	pop	ix
   882F C9            [10] 3724 	ret
                           3725 ;src/main.c:726: void avanzarMapa() {
                           3726 ;	---------------------------------
                           3727 ; Function avanzarMapa
                           3728 ; ---------------------------------
   8830                    3729 _avanzarMapa::
                           3730 ;src/main.c:727: if(num_mapa < NUM_MAPAS -1) {
   8830 3A D0 72      [13] 3731 	ld	a,(#_num_mapa + 0)
   8833 D6 02         [ 7] 3732 	sub	a, #0x02
   8835 30 34         [12] 3733 	jr	NC,00102$
                           3734 ;src/main.c:728: mapa = mapas[++num_mapa];
   8837 01 EE 72      [10] 3735 	ld	bc,#_mapas+0
   883A 21 D0 72      [10] 3736 	ld	hl, #_num_mapa+0
   883D 34            [11] 3737 	inc	(hl)
   883E FD 21 D0 72   [14] 3738 	ld	iy,#_num_mapa
   8842 FD 6E 00      [19] 3739 	ld	l,0 (iy)
   8845 26 00         [ 7] 3740 	ld	h,#0x00
   8847 29            [11] 3741 	add	hl, hl
   8848 09            [11] 3742 	add	hl,bc
   8849 7E            [ 7] 3743 	ld	a,(hl)
   884A FD 21 CE 72   [14] 3744 	ld	iy,#_mapa
   884E FD 77 00      [19] 3745 	ld	0 (iy),a
   8851 23            [ 6] 3746 	inc	hl
   8852 7E            [ 7] 3747 	ld	a,(hl)
   8853 32 CF 72      [13] 3748 	ld	(#_mapa + 1),a
                           3749 ;src/main.c:729: prota.x = prota.px = 2;
   8856 21 18 6A      [10] 3750 	ld	hl,#(_prota + 0x0002)
   8859 36 02         [10] 3751 	ld	(hl),#0x02
   885B 21 16 6A      [10] 3752 	ld	hl,#_prota
   885E 36 02         [10] 3753 	ld	(hl),#0x02
                           3754 ;src/main.c:730: prota.mover = SI;
   8860 21 1C 6A      [10] 3755 	ld	hl,#(_prota + 0x0006)
   8863 36 01         [10] 3756 	ld	(hl),#0x01
                           3757 ;src/main.c:731: dibujarMapa();
   8865 CD D8 72      [17] 3758 	call	_dibujarMapa
                           3759 ;src/main.c:732: inicializarEnemy();
   8868 C3 3A 87      [10] 3760 	jp  _inicializarEnemy
   886B                    3761 00102$:
                           3762 ;src/main.c:735: menuFin(puntuacion);
   886B FD 21 D1 72   [14] 3763 	ld	iy,#_puntuacion
   886F FD 6E 00      [19] 3764 	ld	l,0 (iy)
   8872 26 00         [ 7] 3765 	ld	h,#0x00
   8874 C3 3E 50      [10] 3766 	jp  _menuFin
                           3767 ;src/main.c:739: void moverIzquierda() {
                           3768 ;	---------------------------------
                           3769 ; Function moverIzquierda
                           3770 ; ---------------------------------
   8877                    3771 _moverIzquierda::
                           3772 ;src/main.c:740: prota.mira = M_izquierda;
   8877 01 16 6A      [10] 3773 	ld	bc,#_prota+0
   887A 21 1D 6A      [10] 3774 	ld	hl,#(_prota + 0x0007)
   887D 36 01         [10] 3775 	ld	(hl),#0x01
                           3776 ;src/main.c:741: if (!checkCollision(M_izquierda)) {
   887F C5            [11] 3777 	push	bc
   8880 3E 01         [ 7] 3778 	ld	a,#0x01
   8882 F5            [11] 3779 	push	af
   8883 33            [ 6] 3780 	inc	sp
   8884 CD 13 74      [17] 3781 	call	_checkCollision
   8887 33            [ 6] 3782 	inc	sp
   8888 C1            [10] 3783 	pop	bc
   8889 7D            [ 4] 3784 	ld	a,l
   888A B7            [ 4] 3785 	or	a, a
   888B C0            [11] 3786 	ret	NZ
                           3787 ;src/main.c:742: prota.x--;
   888C 0A            [ 7] 3788 	ld	a,(bc)
   888D C6 FF         [ 7] 3789 	add	a,#0xFF
   888F 02            [ 7] 3790 	ld	(bc),a
                           3791 ;src/main.c:743: prota.mover = SI;
   8890 21 1C 6A      [10] 3792 	ld	hl,#(_prota + 0x0006)
   8893 36 01         [10] 3793 	ld	(hl),#0x01
                           3794 ;src/main.c:744: prota.sprite = g_hero_left;
   8895 21 C6 3D      [10] 3795 	ld	hl,#_g_hero_left
   8898 22 1A 6A      [16] 3796 	ld	((_prota + 0x0004)), hl
   889B C9            [10] 3797 	ret
                           3798 ;src/main.c:748: void moverDerecha() {
                           3799 ;	---------------------------------
                           3800 ; Function moverDerecha
                           3801 ; ---------------------------------
   889C                    3802 _moverDerecha::
                           3803 ;src/main.c:749: prota.mira = M_derecha;
   889C 21 1D 6A      [10] 3804 	ld	hl,#(_prota + 0x0007)
   889F 36 00         [10] 3805 	ld	(hl),#0x00
                           3806 ;src/main.c:750: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   88A1 AF            [ 4] 3807 	xor	a, a
   88A2 F5            [11] 3808 	push	af
   88A3 33            [ 6] 3809 	inc	sp
   88A4 CD 13 74      [17] 3810 	call	_checkCollision
   88A7 33            [ 6] 3811 	inc	sp
   88A8 45            [ 4] 3812 	ld	b,l
   88A9 21 16 6A      [10] 3813 	ld	hl, #_prota + 0
   88AC 4E            [ 7] 3814 	ld	c,(hl)
   88AD 59            [ 4] 3815 	ld	e,c
   88AE 16 00         [ 7] 3816 	ld	d,#0x00
   88B0 21 07 00      [10] 3817 	ld	hl,#0x0007
   88B3 19            [11] 3818 	add	hl,de
   88B4 11 50 80      [10] 3819 	ld	de, #0x8050
   88B7 29            [11] 3820 	add	hl, hl
   88B8 3F            [ 4] 3821 	ccf
   88B9 CB 1C         [ 8] 3822 	rr	h
   88BB CB 1D         [ 8] 3823 	rr	l
   88BD ED 52         [15] 3824 	sbc	hl, de
   88BF 3E 00         [ 7] 3825 	ld	a,#0x00
   88C1 17            [ 4] 3826 	rla
   88C2 5F            [ 4] 3827 	ld	e,a
   88C3 78            [ 4] 3828 	ld	a,b
   88C4 B7            [ 4] 3829 	or	a,a
   88C5 20 14         [12] 3830 	jr	NZ,00104$
   88C7 B3            [ 4] 3831 	or	a,e
   88C8 28 11         [12] 3832 	jr	Z,00104$
                           3833 ;src/main.c:751: prota.x++;
   88CA 0C            [ 4] 3834 	inc	c
   88CB 21 16 6A      [10] 3835 	ld	hl,#_prota
   88CE 71            [ 7] 3836 	ld	(hl),c
                           3837 ;src/main.c:752: prota.mover = SI;
   88CF 21 1C 6A      [10] 3838 	ld	hl,#(_prota + 0x0006)
   88D2 36 01         [10] 3839 	ld	(hl),#0x01
                           3840 ;src/main.c:753: prota.sprite = g_hero;
   88D4 21 70 3E      [10] 3841 	ld	hl,#_g_hero
   88D7 22 1A 6A      [16] 3842 	ld	((_prota + 0x0004)), hl
   88DA C9            [10] 3843 	ret
   88DB                    3844 00104$:
                           3845 ;src/main.c:755: }else if( prota.x + G_HERO_W >= 80){
   88DB 7B            [ 4] 3846 	ld	a,e
   88DC B7            [ 4] 3847 	or	a, a
   88DD C0            [11] 3848 	ret	NZ
                           3849 ;src/main.c:756: avanzarMapa();
   88DE C3 30 88      [10] 3850 	jp  _avanzarMapa
                           3851 ;src/main.c:760: void moverArriba() {
                           3852 ;	---------------------------------
                           3853 ; Function moverArriba
                           3854 ; ---------------------------------
   88E1                    3855 _moverArriba::
                           3856 ;src/main.c:761: prota.mira = M_arriba;
   88E1 21 1D 6A      [10] 3857 	ld	hl,#(_prota + 0x0007)
   88E4 36 02         [10] 3858 	ld	(hl),#0x02
                           3859 ;src/main.c:762: if (!checkCollision(M_arriba)) {
   88E6 3E 02         [ 7] 3860 	ld	a,#0x02
   88E8 F5            [11] 3861 	push	af
   88E9 33            [ 6] 3862 	inc	sp
   88EA CD 13 74      [17] 3863 	call	_checkCollision
   88ED 33            [ 6] 3864 	inc	sp
   88EE 7D            [ 4] 3865 	ld	a,l
   88EF B7            [ 4] 3866 	or	a, a
   88F0 C0            [11] 3867 	ret	NZ
                           3868 ;src/main.c:763: prota.y--;
   88F1 21 17 6A      [10] 3869 	ld	hl,#_prota + 1
   88F4 4E            [ 7] 3870 	ld	c,(hl)
   88F5 0D            [ 4] 3871 	dec	c
   88F6 71            [ 7] 3872 	ld	(hl),c
                           3873 ;src/main.c:764: prota.y--;
   88F7 0D            [ 4] 3874 	dec	c
   88F8 71            [ 7] 3875 	ld	(hl),c
                           3876 ;src/main.c:765: prota.mover  = SI;
   88F9 21 1C 6A      [10] 3877 	ld	hl,#(_prota + 0x0006)
   88FC 36 01         [10] 3878 	ld	(hl),#0x01
                           3879 ;src/main.c:766: prota.sprite = g_hero_up;
   88FE 21 2C 3D      [10] 3880 	ld	hl,#_g_hero_up
   8901 22 1A 6A      [16] 3881 	ld	((_prota + 0x0004)), hl
   8904 C9            [10] 3882 	ret
                           3883 ;src/main.c:770: void moverAbajo() {
                           3884 ;	---------------------------------
                           3885 ; Function moverAbajo
                           3886 ; ---------------------------------
   8905                    3887 _moverAbajo::
                           3888 ;src/main.c:771: prota.mira = M_abajo;
   8905 21 1D 6A      [10] 3889 	ld	hl,#(_prota + 0x0007)
   8908 36 03         [10] 3890 	ld	(hl),#0x03
                           3891 ;src/main.c:772: if (!checkCollision(M_abajo) ) {
   890A 3E 03         [ 7] 3892 	ld	a,#0x03
   890C F5            [11] 3893 	push	af
   890D 33            [ 6] 3894 	inc	sp
   890E CD 13 74      [17] 3895 	call	_checkCollision
   8911 33            [ 6] 3896 	inc	sp
   8912 7D            [ 4] 3897 	ld	a,l
   8913 B7            [ 4] 3898 	or	a, a
   8914 C0            [11] 3899 	ret	NZ
                           3900 ;src/main.c:773: prota.y++;
   8915 01 17 6A      [10] 3901 	ld	bc,#_prota + 1
   8918 0A            [ 7] 3902 	ld	a,(bc)
   8919 3C            [ 4] 3903 	inc	a
   891A 02            [ 7] 3904 	ld	(bc),a
                           3905 ;src/main.c:774: prota.y++;
   891B 3C            [ 4] 3906 	inc	a
   891C 02            [ 7] 3907 	ld	(bc),a
                           3908 ;src/main.c:775: prota.mover  = SI;
   891D 21 1C 6A      [10] 3909 	ld	hl,#(_prota + 0x0006)
   8920 36 01         [10] 3910 	ld	(hl),#0x01
                           3911 ;src/main.c:776: prota.sprite = g_hero_down;
   8922 21 92 3C      [10] 3912 	ld	hl,#_g_hero_down
   8925 22 1A 6A      [16] 3913 	ld	((_prota + 0x0004)), hl
   8928 C9            [10] 3914 	ret
                           3915 ;src/main.c:783: void intHandler() {
                           3916 ;	---------------------------------
                           3917 ; Function intHandler
                           3918 ; ---------------------------------
   8929                    3919 _intHandler::
                           3920 ;src/main.c:784: if (++i == 6) {
   8929 21 28 6A      [10] 3921 	ld	hl, #_i+0
   892C 34            [11] 3922 	inc	(hl)
   892D 3A 28 6A      [13] 3923 	ld	a,(#_i + 0)
   8930 D6 06         [ 7] 3924 	sub	a, #0x06
   8932 C0            [11] 3925 	ret	NZ
                           3926 ;src/main.c:785: play();
   8933 CD D2 57      [17] 3927 	call	_play
                           3928 ;src/main.c:786: i=0;
   8936 21 28 6A      [10] 3929 	ld	hl,#_i + 0
   8939 36 00         [10] 3930 	ld	(hl), #0x00
   893B C9            [10] 3931 	ret
                           3932 ;src/main.c:790: void inicializarCPC() {
                           3933 ;	---------------------------------
                           3934 ; Function inicializarCPC
                           3935 ; ---------------------------------
   893C                    3936 _inicializarCPC::
                           3937 ;src/main.c:791: cpct_disableFirmware();
   893C CD 79 5B      [17] 3938 	call	_cpct_disableFirmware
                           3939 ;src/main.c:792: cpct_setVideoMode(0);
   893F 2E 00         [ 7] 3940 	ld	l,#0x00
   8941 CD 4D 5B      [17] 3941 	call	_cpct_setVideoMode
                           3942 ;src/main.c:793: cpct_setBorder(HW_BLACK);
   8944 21 10 14      [10] 3943 	ld	hl,#0x1410
   8947 E5            [11] 3944 	push	hl
   8948 CD B0 58      [17] 3945 	call	_cpct_setPALColour
                           3946 ;src/main.c:794: cpct_setPalette(g_palette, 16);
   894B 21 10 00      [10] 3947 	ld	hl,#0x0010
   894E E5            [11] 3948 	push	hl
   894F 21 60 3E      [10] 3949 	ld	hl,#_g_palette
   8952 E5            [11] 3950 	push	hl
   8953 CD 8D 58      [17] 3951 	call	_cpct_setPalette
   8956 C9            [10] 3952 	ret
                           3953 ;src/main.c:799: void inicializarJuego() {
                           3954 ;	---------------------------------
                           3955 ; Function inicializarJuego
                           3956 ; ---------------------------------
   8957                    3957 _inicializarJuego::
                           3958 ;src/main.c:801: num_mapa = 0;
   8957 21 D0 72      [10] 3959 	ld	hl,#_num_mapa + 0
   895A 36 00         [10] 3960 	ld	(hl), #0x00
                           3961 ;src/main.c:802: mapa = mapas[num_mapa];
   895C 21 EE 72      [10] 3962 	ld	hl, #_mapas + 0
   895F 7E            [ 7] 3963 	ld	a,(hl)
   8960 FD 21 CE 72   [14] 3964 	ld	iy,#_mapa
   8964 FD 77 00      [19] 3965 	ld	0 (iy),a
   8967 23            [ 6] 3966 	inc	hl
   8968 7E            [ 7] 3967 	ld	a,(hl)
   8969 32 CF 72      [13] 3968 	ld	(#_mapa + 1),a
                           3969 ;src/main.c:803: cpct_etm_setTileset2x4(g_tileset);
   896C 21 E0 17      [10] 3970 	ld	hl,#_g_tileset
   896F CD A1 5A      [17] 3971 	call	_cpct_etm_setTileset2x4
                           3972 ;src/main.c:805: dibujarMapa();
   8972 CD D8 72      [17] 3973 	call	_dibujarMapa
                           3974 ;src/main.c:808: barraPuntuacionInicial();
   8975 CD DE 55      [17] 3975 	call	_barraPuntuacionInicial
                           3976 ;src/main.c:811: prota.x = prota.px = 4;
   8978 21 18 6A      [10] 3977 	ld	hl,#(_prota + 0x0002)
   897B 36 04         [10] 3978 	ld	(hl),#0x04
   897D 21 16 6A      [10] 3979 	ld	hl,#_prota
   8980 36 04         [10] 3980 	ld	(hl),#0x04
                           3981 ;src/main.c:812: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   8982 21 19 6A      [10] 3982 	ld	hl,#(_prota + 0x0003)
   8985 36 68         [10] 3983 	ld	(hl),#0x68
   8987 21 17 6A      [10] 3984 	ld	hl,#(_prota + 0x0001)
   898A 36 68         [10] 3985 	ld	(hl),#0x68
                           3986 ;src/main.c:813: prota.mover  = NO;
   898C 21 1C 6A      [10] 3987 	ld	hl,#(_prota + 0x0006)
   898F 36 00         [10] 3988 	ld	(hl),#0x00
                           3989 ;src/main.c:814: prota.mira=M_derecha;
   8991 21 1D 6A      [10] 3990 	ld	hl,#(_prota + 0x0007)
   8994 36 00         [10] 3991 	ld	(hl),#0x00
                           3992 ;src/main.c:815: prota.sprite = g_hero;
   8996 21 70 3E      [10] 3993 	ld	hl,#_g_hero
   8999 22 1A 6A      [16] 3994 	ld	((_prota + 0x0004)), hl
                           3995 ;src/main.c:819: cu.x = cu.px = 0;
   899C 21 20 6A      [10] 3996 	ld	hl,#(_cu + 0x0002)
   899F 36 00         [10] 3997 	ld	(hl),#0x00
   89A1 21 1E 6A      [10] 3998 	ld	hl,#_cu
   89A4 36 00         [10] 3999 	ld	(hl),#0x00
                           4000 ;src/main.c:820: cu.y = cu.py = 0;
   89A6 21 21 6A      [10] 4001 	ld	hl,#(_cu + 0x0003)
   89A9 36 00         [10] 4002 	ld	(hl),#0x00
   89AB 21 1F 6A      [10] 4003 	ld	hl,#(_cu + 0x0001)
   89AE 36 00         [10] 4004 	ld	(hl),#0x00
                           4005 ;src/main.c:821: cu.lanzado = NO;
   89B0 21 24 6A      [10] 4006 	ld	hl,#(_cu + 0x0006)
   89B3 36 00         [10] 4007 	ld	(hl),#0x00
                           4008 ;src/main.c:822: cu.mover = NO;
   89B5 21 27 6A      [10] 4009 	ld	hl,#(_cu + 0x0009)
   89B8 36 00         [10] 4010 	ld	(hl),#0x00
                           4011 ;src/main.c:824: inicializarEnemy();
   89BA CD 3A 87      [17] 4012 	call	_inicializarEnemy
                           4013 ;src/main.c:826: dibujarProta();
   89BD C3 FE 72      [10] 4014 	jp  _dibujarProta
                           4015 ;src/main.c:829: void main(void) {
                           4016 ;	---------------------------------
                           4017 ; Function main
                           4018 ; ---------------------------------
   89C0                    4019 _main::
   89C0 DD E5         [15] 4020 	push	ix
   89C2 DD 21 00 00   [14] 4021 	ld	ix,#0
   89C6 DD 39         [15] 4022 	add	ix,sp
   89C8 3B            [ 6] 4023 	dec	sp
                           4024 ;src/main.c:834: inicializarCPC();
   89C9 CD 3C 89      [17] 4025 	call	_inicializarCPC
                           4026 ;src/main.c:836: menuInicio();
   89CC CD FF 54      [17] 4027 	call	_menuInicio
                           4028 ;src/main.c:838: inicializarJuego();
   89CF CD 57 89      [17] 4029 	call	_inicializarJuego
                           4030 ;src/main.c:842: while (1) {
   89D2                    4031 00119$:
                           4032 ;src/main.c:844: i = 1 + 1;
   89D2 DD 36 FF 02   [19] 4033 	ld	-1 (ix),#0x02
                           4034 ;src/main.c:845: actual = enemy;
                           4035 ;src/main.c:847: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   89D6 21 00 01      [10] 4036 	ld	hl,#_g_tablatrans
   89D9 E5            [11] 4037 	push	hl
   89DA 2A CE 72      [16] 4038 	ld	hl,(_mapa)
   89DD E5            [11] 4039 	push	hl
   89DE 21 16 6A      [10] 4040 	ld	hl,#_prota
   89E1 E5            [11] 4041 	push	hl
   89E2 21 1E 6A      [10] 4042 	ld	hl,#_cu
   89E5 E5            [11] 4043 	push	hl
   89E6 CD AC 73      [17] 4044 	call	_comprobarTeclado
   89E9 21 08 00      [10] 4045 	ld	hl,#8
   89EC 39            [11] 4046 	add	hl,sp
   89ED F9            [ 6] 4047 	ld	sp,hl
                           4048 ;src/main.c:848: moverCuchillo(&cu, mapa);
   89EE 2A CE 72      [16] 4049 	ld	hl,(_mapa)
   89F1 E5            [11] 4050 	push	hl
   89F2 21 1E 6A      [10] 4051 	ld	hl,#_cu
   89F5 E5            [11] 4052 	push	hl
   89F6 CD 00 43      [17] 4053 	call	_moverCuchillo
   89F9 F1            [10] 4054 	pop	af
   89FA F1            [10] 4055 	pop	af
                           4056 ;src/main.c:849: updateEnemies();
   89FB CD 08 86      [17] 4057 	call	_updateEnemies
                           4058 ;src/main.c:851: cpct_waitVSYNC();
   89FE CD 45 5B      [17] 4059 	call	_cpct_waitVSYNC
                           4060 ;src/main.c:854: if (prota.mover) {
   8A01 01 1C 6A      [10] 4061 	ld	bc,#_prota + 6
   8A04 0A            [ 7] 4062 	ld	a,(bc)
   8A05 B7            [ 4] 4063 	or	a, a
   8A06 28 07         [12] 4064 	jr	Z,00102$
                           4065 ;src/main.c:855: redibujarProta();
   8A08 C5            [11] 4066 	push	bc
   8A09 CD 98 73      [17] 4067 	call	_redibujarProta
   8A0C C1            [10] 4068 	pop	bc
                           4069 ;src/main.c:856: prota.mover = NO;
   8A0D AF            [ 4] 4070 	xor	a, a
   8A0E 02            [ 7] 4071 	ld	(bc),a
   8A0F                    4072 00102$:
                           4073 ;src/main.c:858: if(cu.lanzado && cu.mover){
   8A0F 21 24 6A      [10] 4074 	ld	hl, #(_cu + 0x0006) + 0
   8A12 4E            [ 7] 4075 	ld	c,(hl)
                           4076 ;src/main.c:859: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4077 ;src/main.c:858: if(cu.lanzado && cu.mover){
   8A13 79            [ 4] 4078 	ld	a,c
   8A14 B7            [ 4] 4079 	or	a, a
   8A15 28 30         [12] 4080 	jr	Z,00107$
   8A17 3A 27 6A      [13] 4081 	ld	a, (#(_cu + 0x0009) + 0)
   8A1A B7            [ 4] 4082 	or	a, a
   8A1B 28 2A         [12] 4083 	jr	Z,00107$
                           4084 ;src/main.c:859: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   8A1D 21 1F 6A      [10] 4085 	ld	hl, #(_cu + 0x0001) + 0
   8A20 4E            [ 7] 4086 	ld	c,(hl)
   8A21 21 1E 6A      [10] 4087 	ld	hl, #_cu + 0
   8A24 46            [ 7] 4088 	ld	b,(hl)
   8A25 21 26 6A      [10] 4089 	ld	hl, #(_cu + 0x0008) + 0
   8A28 5E            [ 7] 4090 	ld	e,(hl)
   8A29 2A CE 72      [16] 4091 	ld	hl,(_mapa)
   8A2C E5            [11] 4092 	push	hl
   8A2D 21 00 01      [10] 4093 	ld	hl,#_g_tablatrans
   8A30 E5            [11] 4094 	push	hl
   8A31 21 1E 6A      [10] 4095 	ld	hl,#_cu
   8A34 E5            [11] 4096 	push	hl
   8A35 79            [ 4] 4097 	ld	a,c
   8A36 F5            [11] 4098 	push	af
   8A37 33            [ 6] 4099 	inc	sp
   8A38 C5            [11] 4100 	push	bc
   8A39 33            [ 6] 4101 	inc	sp
   8A3A 7B            [ 4] 4102 	ld	a,e
   8A3B F5            [11] 4103 	push	af
   8A3C 33            [ 6] 4104 	inc	sp
   8A3D CD 25 40      [17] 4105 	call	_redibujarCuchillo
   8A40 21 09 00      [10] 4106 	ld	hl,#9
   8A43 39            [11] 4107 	add	hl,sp
   8A44 F9            [ 6] 4108 	ld	sp,hl
   8A45 18 28         [12] 4109 	jr	00132$
   8A47                    4110 00107$:
                           4111 ;src/main.c:860: }else if (cu.lanzado && !cu.mover){
   8A47 79            [ 4] 4112 	ld	a,c
   8A48 B7            [ 4] 4113 	or	a, a
   8A49 28 24         [12] 4114 	jr	Z,00132$
   8A4B 3A 27 6A      [13] 4115 	ld	a, (#(_cu + 0x0009) + 0)
   8A4E B7            [ 4] 4116 	or	a, a
   8A4F 20 1E         [12] 4117 	jr	NZ,00132$
                           4118 ;src/main.c:861: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   8A51 21 1F 6A      [10] 4119 	ld	hl, #(_cu + 0x0001) + 0
   8A54 46            [ 7] 4120 	ld	b,(hl)
   8A55 21 1E 6A      [10] 4121 	ld	hl, #_cu + 0
   8A58 4E            [ 7] 4122 	ld	c,(hl)
   8A59 21 26 6A      [10] 4123 	ld	hl, #(_cu + 0x0008) + 0
   8A5C 56            [ 7] 4124 	ld	d,(hl)
   8A5D 2A CE 72      [16] 4125 	ld	hl,(_mapa)
   8A60 E5            [11] 4126 	push	hl
   8A61 C5            [11] 4127 	push	bc
   8A62 D5            [11] 4128 	push	de
   8A63 33            [ 6] 4129 	inc	sp
   8A64 CD 92 3F      [17] 4130 	call	_borrarCuchillo
   8A67 F1            [10] 4131 	pop	af
   8A68 F1            [10] 4132 	pop	af
   8A69 33            [ 6] 4133 	inc	sp
                           4134 ;src/main.c:862: cu.lanzado = NO;
   8A6A 21 24 6A      [10] 4135 	ld	hl,#(_cu + 0x0006)
   8A6D 36 00         [10] 4136 	ld	(hl),#0x00
                           4137 ;src/main.c:865: while(--i){
   8A6F                    4138 00132$:
   8A6F 01 FE 64      [10] 4139 	ld	bc,#_enemy
   8A72                    4140 00115$:
   8A72 DD 35 FF      [23] 4141 	dec	-1 (ix)
   8A75 DD 7E FF      [19] 4142 	ld	a, -1 (ix)
   8A78 B7            [ 4] 4143 	or	a, a
   8A79 28 71         [12] 4144 	jr	Z,00117$
                           4145 ;src/main.c:866: if(actual->mover){
   8A7B C5            [11] 4146 	push	bc
   8A7C FD E1         [14] 4147 	pop	iy
   8A7E FD 7E 06      [19] 4148 	ld	a,6 (iy)
   8A81 B7            [ 4] 4149 	or	a, a
   8A82 28 07         [12] 4150 	jr	Z,00111$
                           4151 ;src/main.c:867: redibujarEnemigo(actual);
   8A84 C5            [11] 4152 	push	bc
   8A85 C5            [11] 4153 	push	bc
   8A86 CD FC 76      [17] 4154 	call	_redibujarEnemigo
   8A89 F1            [10] 4155 	pop	af
   8A8A C1            [10] 4156 	pop	bc
   8A8B                    4157 00111$:
                           4158 ;src/main.c:869: if (actual->muerto && actual->muertes == 0){
   8A8B C5            [11] 4159 	push	bc
   8A8C FD E1         [14] 4160 	pop	iy
   8A8E FD 7E 08      [19] 4161 	ld	a,8 (iy)
   8A91 B7            [ 4] 4162 	or	a, a
   8A92 28 50         [12] 4163 	jr	Z,00113$
   8A94 21 0A 00      [10] 4164 	ld	hl,#0x000A
   8A97 09            [11] 4165 	add	hl,bc
   8A98 EB            [ 4] 4166 	ex	de,hl
   8A99 1A            [ 7] 4167 	ld	a,(de)
   8A9A B7            [ 4] 4168 	or	a, a
   8A9B 20 47         [12] 4169 	jr	NZ,00113$
                           4170 ;src/main.c:870: borrarEnemigo(actual);
   8A9D C5            [11] 4171 	push	bc
   8A9E D5            [11] 4172 	push	de
   8A9F C5            [11] 4173 	push	bc
   8AA0 CD 68 76      [17] 4174 	call	_borrarEnemigo
   8AA3 F1            [10] 4175 	pop	af
   8AA4 D1            [10] 4176 	pop	de
   8AA5 C1            [10] 4177 	pop	bc
                           4178 ;src/main.c:871: dibujarExplosion(actual);
   8AA6 C5            [11] 4179 	push	bc
   8AA7 D5            [11] 4180 	push	de
   8AA8 C5            [11] 4181 	push	bc
   8AA9 CD C0 75      [17] 4182 	call	_dibujarExplosion
   8AAC F1            [10] 4183 	pop	af
   8AAD D1            [10] 4184 	pop	de
   8AAE C1            [10] 4185 	pop	bc
                           4186 ;src/main.c:872: puntuacion_aux = puntuacion;
   8AAF FD 21 D1 72   [14] 4187 	ld	iy,#_puntuacion
   8AB3 FD 6E 00      [19] 4188 	ld	l,0 (iy)
   8AB6 26 00         [ 7] 4189 	ld	h,#0x00
                           4190 ;src/main.c:873: puntuacion = aumentarPuntuacion(puntuacion_aux);
   8AB8 C5            [11] 4191 	push	bc
   8AB9 D5            [11] 4192 	push	de
   8ABA E5            [11] 4193 	push	hl
   8ABB CD B7 57      [17] 4194 	call	_aumentarPuntuacion
   8ABE F1            [10] 4195 	pop	af
   8ABF D1            [10] 4196 	pop	de
   8AC0 C1            [10] 4197 	pop	bc
   8AC1 FD 21 D1 72   [14] 4198 	ld	iy,#_puntuacion
   8AC5 FD 75 00      [19] 4199 	ld	0 (iy),l
                           4200 ;src/main.c:874: modificarPuntuacion(puntuacion);
   8AC8 FD 21 D1 72   [14] 4201 	ld	iy,#_puntuacion
   8ACC FD 6E 00      [19] 4202 	ld	l,0 (iy)
   8ACF 26 00         [ 7] 4203 	ld	h,#0x00
   8AD1 C5            [11] 4204 	push	bc
   8AD2 D5            [11] 4205 	push	de
   8AD3 E5            [11] 4206 	push	hl
   8AD4 CD 7A 56      [17] 4207 	call	_modificarPuntuacion
   8AD7 F1            [10] 4208 	pop	af
   8AD8 D1            [10] 4209 	pop	de
   8AD9 C1            [10] 4210 	pop	bc
                           4211 ;src/main.c:876: actual->muertes++;
   8ADA 1A            [ 7] 4212 	ld	a,(de)
   8ADB 3C            [ 4] 4213 	inc	a
   8ADC 12            [ 7] 4214 	ld	(de),a
                           4215 ;src/main.c:877: actual->x = 0;
   8ADD AF            [ 4] 4216 	xor	a, a
   8ADE 02            [ 7] 4217 	ld	(bc),a
                           4218 ;src/main.c:878: actual->y = 0;
   8ADF 59            [ 4] 4219 	ld	e, c
   8AE0 50            [ 4] 4220 	ld	d, b
   8AE1 13            [ 6] 4221 	inc	de
   8AE2 AF            [ 4] 4222 	xor	a, a
   8AE3 12            [ 7] 4223 	ld	(de),a
   8AE4                    4224 00113$:
                           4225 ;src/main.c:880: ++actual;
   8AE4 21 46 01      [10] 4226 	ld	hl,#0x0146
   8AE7 09            [11] 4227 	add	hl,bc
   8AE8 4D            [ 4] 4228 	ld	c,l
   8AE9 44            [ 4] 4229 	ld	b,h
   8AEA 18 86         [12] 4230 	jr	00115$
   8AEC                    4231 00117$:
                           4232 ;src/main.c:882: cpct_waitVSYNC();
   8AEC CD 45 5B      [17] 4233 	call	_cpct_waitVSYNC
   8AEF C3 D2 89      [10] 4234 	jp	00119$
   8AF2 33            [ 6] 4235 	inc	sp
   8AF3 DD E1         [14] 4236 	pop	ix
   8AF5 C9            [10] 4237 	ret
                           4238 	.area _CODE
                           4239 	.area _INITIALIZER
   72D3                    4240 __xinit__mapa:
   72D3 00 00              4241 	.dw #0x0000
   72D5                    4242 __xinit__num_mapa:
   72D5 00                 4243 	.db #0x00	; 0
   72D6                    4244 __xinit__puntuacion:
   72D6 00                 4245 	.db #0x00	; 0
   72D7                    4246 __xinit__vidas:
   72D7 05                 4247 	.db #0x05	; 5
                           4248 	.area _CABS (ABS)
