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
                             11 	.globl _G_song
                             12 	.globl _main
                             13 	.globl _inicializarJuego
                             14 	.globl _inicializarEnemy
                             15 	.globl _inicializarCPC
                             16 	.globl _menuInicio
                             17 	.globl _borrarPantallaArriba
                             18 	.globl _barraPuntuacionInicial
                             19 	.globl _moverCuchillo
                             20 	.globl _checkKnifeCollision
                             21 	.globl _comprobarTeclado
                             22 	.globl _lanzarCuchillo
                             23 	.globl _redibujarCuchillo
                             24 	.globl _borrarCuchillo
                             25 	.globl _dibujarCuchillo
                             26 	.globl _moverAbajo
                             27 	.globl _moverArriba
                             28 	.globl _moverDerecha
                             29 	.globl _moverIzquierda
                             30 	.globl _avanzarMapa
                             31 	.globl _updateEnemies
                             32 	.globl _seek
                             33 	.globl _patrol
                             34 	.globl _lookFor
                             35 	.globl _moverEnemigo
                             36 	.globl _moverEnemigoPathfinding
                             37 	.globl _moverEnemigoIzquierda
                             38 	.globl _moverEnemigoDerecha
                             39 	.globl _moverEnemigoAbajo
                             40 	.globl _moverEnemigoArriba
                             41 	.globl _checkEnemyCollision
                             42 	.globl _redibujarEnemigo
                             43 	.globl _borrarEnemigo
                             44 	.globl _borrarExplosion
                             45 	.globl _dibujarExplosion
                             46 	.globl _dibujarEnemigo
                             47 	.globl _checkCollision
                             48 	.globl _getTilePtr
                             49 	.globl _redibujarProta
                             50 	.globl _menuFin
                             51 	.globl _borrarProta
                             52 	.globl _dibujarProta
                             53 	.globl _dibujarMapa
                             54 	.globl _pathFinding
                             55 	.globl _abs
                             56 	.globl _cpct_etm_setTileset2x4
                             57 	.globl _cpct_etm_drawTileBox2x4
                             58 	.globl _cpct_akp_musicPlay
                             59 	.globl _cpct_akp_musicInit
                             60 	.globl _cpct_getScreenPtr
                             61 	.globl _cpct_setPALColour
                             62 	.globl _cpct_setPalette
                             63 	.globl _cpct_waitVSYNC
                             64 	.globl _cpct_setVideoMode
                             65 	.globl _cpct_drawStringM0
                             66 	.globl _cpct_drawSpriteMaskedAlignedTable
                             67 	.globl _cpct_drawSolidBox
                             68 	.globl _cpct_drawSprite
                             69 	.globl _cpct_isAnyKeyPressed
                             70 	.globl _cpct_isKeyPressed
                             71 	.globl _cpct_scanKeyboard_if
                             72 	.globl _cpct_scanKeyboard_f
                             73 	.globl _cpct_memset
                             74 	.globl _cpct_disableFirmware
                             75 	.globl _num_mapa
                             76 	.globl _mapa
                             77 	.globl _iter
                             78 	.globl _cu
                             79 	.globl _prota
                             80 	.globl _enemy
                             81 	.globl _EEje
                             82 	.globl _EMirar
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
   64C4                      93 _EMirar::
   64C4                      94 	.ds 1
   64C5                      95 _EEje::
   64C5                      96 	.ds 1
   64C6                      97 _enemy::
   64C6                      98 	.ds 1296
   69D6                      99 _prota::
   69D6                     100 	.ds 8
   69DE                     101 _cu::
   69DE                     102 	.ds 10
   69E8                     103 _iter::
   69E8                     104 	.ds 1
   69E9                     105 _mapa::
   69E9                     106 	.ds 2
   69EB                     107 _num_mapa::
   69EB                     108 	.ds 1
                            109 ;--------------------------------------------------------
                            110 ; ram data
                            111 ;--------------------------------------------------------
                            112 	.area _INITIALIZED
                            113 ;--------------------------------------------------------
                            114 ; absolute external ram data
                            115 ;--------------------------------------------------------
                            116 	.area _DABS (ABS)
                            117 ;--------------------------------------------------------
                            118 ; global & static initialisations
                            119 ;--------------------------------------------------------
                            120 	.area _HOME
                            121 	.area _GSINIT
                            122 	.area _GSFINAL
                            123 	.area _GSINIT
                            124 ;--------------------------------------------------------
                            125 ; Home
                            126 ;--------------------------------------------------------
                            127 	.area _HOME
                            128 	.area _HOME
                            129 ;--------------------------------------------------------
                            130 ; code
                            131 ;--------------------------------------------------------
                            132 	.area _CODE
                            133 ;src/main.c:109: cpctm_createTransparentMaskTable(g_tablatrans, 0x0E00, M0, 0); // es el color 8 - 4D - FF00FF
                            134 ;	---------------------------------
                            135 ; Function dummy_cpct_transparentMaskTable0M0_container
                            136 ; ---------------------------------
   4B92                     137 _dummy_cpct_transparentMaskTable0M0_container::
                            138 	.area _g_tablatrans_ (ABS) 
   0E00                     139 	.org 0x0E00 
   0E00                     140 	 _g_tablatrans::
   0E00 FF AA 55 00 AA AA   141 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0E08 55 00 55 00 00 00   142 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E10 AA AA 00 00 AA AA   143 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0E18 00 00 00 00 00 00   144 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E20 55 00 55 00 00 00   145 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E28 55 00 55 00 00 00   146 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E30 00 00 00 00 00 00   147 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E38 00 00 00 00 00 00   148 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E40 AA AA 00 00 AA AA   149 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0E48 00 00 00 00 00 00   150 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E50 AA AA 00 00 AA AA   151 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0E58 00 00 00 00 00 00   152 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E60 00 00 00 00 00 00   153 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E68 00 00 00 00 00 00   154 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E70 00 00 00 00 00 00   155 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E78 00 00 00 00 00 00   156 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E80 55 00 55 00 00 00   157 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E88 55 00 55 00 00 00   158 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E90 00 00 00 00 00 00   159 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E98 00 00 00 00 00 00   160 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EA0 55 00 55 00 00 00   161 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EA8 55 00 55 00 00 00   162 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EB0 00 00 00 00 00 00   163 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EB8 00 00 00 00 00 00   164 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EC0 00 00 00 00 00 00   165 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EC8 00 00 00 00 00 00   166 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0ED0 00 00 00 00 00 00   167 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0ED8 00 00 00 00 00 00   168 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EE0 00 00 00 00 00 00   169 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EE8 00 00 00 00 00 00   170 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EF0 00 00 00 00 00 00   171 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EF8 00 00 00 00 00 00   172 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            173 	.area _CSEG (REL, CON) 
                            174 ;src/main.c:112: void dibujarMapa() {
                            175 ;	---------------------------------
                            176 ; Function dibujarMapa
                            177 ; ---------------------------------
   7273                     178 _dibujarMapa::
                            179 ;src/main.c:113: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   7273 2A E9 69      [16]  180 	ld	hl,(_mapa)
   7276 E5            [11]  181 	push	hl
   7277 21 F0 C0      [10]  182 	ld	hl,#0xC0F0
   727A E5            [11]  183 	push	hl
   727B 21 2C 28      [10]  184 	ld	hl,#0x282C
   727E E5            [11]  185 	push	hl
   727F 2E 00         [ 7]  186 	ld	l, #0x00
   7281 E5            [11]  187 	push	hl
   7282 AF            [ 4]  188 	xor	a, a
   7283 F5            [11]  189 	push	af
   7284 33            [ 6]  190 	inc	sp
   7285 CD 62 59      [17]  191 	call	_cpct_etm_drawTileBox2x4
   7288 C9            [10]  192 	ret
   7289                     193 _mapas:
   7289 C0 1D               194 	.dw _g_map1
   728B E0 16               195 	.dw _g_map2
   728D 00 10               196 	.dw _g_map3
   728F                     197 _spawnX:
   728F 00                  198 	.db #0x00	; 0
   7290 3C                  199 	.db #0x3C	; 60
   7291 47                  200 	.db #0x47	; 71	'G'
   7292 14                  201 	.db #0x14	; 20
   7293 3C                  202 	.db #0x3C	; 60
   7294                     203 _spawnY:
   7294 00                  204 	.db #0x00	; 0
   7295 2C                  205 	.db #0x2C	; 44
   7296 72                  206 	.db #0x72	; 114	'r'
   7297 8A                  207 	.db #0x8A	; 138
   7298 8A                  208 	.db #0x8A	; 138
                            209 ;src/main.c:116: void dibujarProta() {
                            210 ;	---------------------------------
                            211 ; Function dibujarProta
                            212 ; ---------------------------------
   7299                     213 _dibujarProta::
                            214 ;src/main.c:117: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   7299 21 D7 69      [10]  215 	ld	hl, #_prota + 1
   729C 56            [ 7]  216 	ld	d,(hl)
   729D 21 D6 69      [10]  217 	ld	hl, #_prota + 0
   72A0 46            [ 7]  218 	ld	b,(hl)
   72A1 D5            [11]  219 	push	de
   72A2 33            [ 6]  220 	inc	sp
   72A3 C5            [11]  221 	push	bc
   72A4 33            [ 6]  222 	inc	sp
   72A5 21 00 C0      [10]  223 	ld	hl,#0xC000
   72A8 E5            [11]  224 	push	hl
   72A9 CD 69 64      [17]  225 	call	_cpct_getScreenPtr
   72AC EB            [ 4]  226 	ex	de,hl
                            227 ;src/main.c:118: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   72AD ED 4B DA 69   [20]  228 	ld	bc, (#_prota + 4)
   72B1 21 00 0E      [10]  229 	ld	hl,#_g_tablatrans
   72B4 E5            [11]  230 	push	hl
   72B5 21 07 16      [10]  231 	ld	hl,#0x1607
   72B8 E5            [11]  232 	push	hl
   72B9 D5            [11]  233 	push	de
   72BA C5            [11]  234 	push	bc
   72BB CD 89 64      [17]  235 	call	_cpct_drawSpriteMaskedAlignedTable
   72BE C9            [10]  236 	ret
                            237 ;src/main.c:121: void borrarProta() {
                            238 ;	---------------------------------
                            239 ; Function borrarProta
                            240 ; ---------------------------------
   72BF                     241 _borrarProta::
   72BF DD E5         [15]  242 	push	ix
   72C1 DD 21 00 00   [14]  243 	ld	ix,#0
   72C5 DD 39         [15]  244 	add	ix,sp
   72C7 F5            [11]  245 	push	af
   72C8 3B            [ 6]  246 	dec	sp
                            247 ;src/main.c:123: u8 w = 4 + (prota.px & 1);
   72C9 21 D8 69      [10]  248 	ld	hl, #_prota + 2
   72CC 4E            [ 7]  249 	ld	c,(hl)
   72CD 79            [ 4]  250 	ld	a,c
   72CE E6 01         [ 7]  251 	and	a, #0x01
   72D0 47            [ 4]  252 	ld	b,a
   72D1 04            [ 4]  253 	inc	b
   72D2 04            [ 4]  254 	inc	b
   72D3 04            [ 4]  255 	inc	b
   72D4 04            [ 4]  256 	inc	b
                            257 ;src/main.c:126: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   72D5 21 D9 69      [10]  258 	ld	hl, #_prota + 3
   72D8 5E            [ 7]  259 	ld	e,(hl)
   72D9 CB 4B         [ 8]  260 	bit	1, e
   72DB 28 04         [12]  261 	jr	Z,00103$
   72DD 3E 01         [ 7]  262 	ld	a,#0x01
   72DF 18 02         [12]  263 	jr	00104$
   72E1                     264 00103$:
   72E1 3E 00         [ 7]  265 	ld	a,#0x00
   72E3                     266 00104$:
   72E3 C6 06         [ 7]  267 	add	a, #0x06
   72E5 DD 77 FD      [19]  268 	ld	-3 (ix),a
                            269 ;src/main.c:128: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   72E8 FD 2A E9 69   [20]  270 	ld	iy,(_mapa)
   72EC 16 00         [ 7]  271 	ld	d,#0x00
   72EE 7B            [ 4]  272 	ld	a,e
   72EF C6 E8         [ 7]  273 	add	a,#0xE8
   72F1 DD 77 FE      [19]  274 	ld	-2 (ix),a
   72F4 7A            [ 4]  275 	ld	a,d
   72F5 CE FF         [ 7]  276 	adc	a,#0xFF
   72F7 DD 77 FF      [19]  277 	ld	-1 (ix),a
   72FA DD 6E FE      [19]  278 	ld	l,-2 (ix)
   72FD DD 66 FF      [19]  279 	ld	h,-1 (ix)
   7300 DD CB FF 7E   [20]  280 	bit	7, -1 (ix)
   7304 28 04         [12]  281 	jr	Z,00105$
   7306 21 EB FF      [10]  282 	ld	hl,#0xFFEB
   7309 19            [11]  283 	add	hl,de
   730A                     284 00105$:
   730A CB 2C         [ 8]  285 	sra	h
   730C CB 1D         [ 8]  286 	rr	l
   730E CB 2C         [ 8]  287 	sra	h
   7310 CB 1D         [ 8]  288 	rr	l
   7312 55            [ 4]  289 	ld	d,l
   7313 CB 39         [ 8]  290 	srl	c
   7315 FD E5         [15]  291 	push	iy
   7317 21 F0 C0      [10]  292 	ld	hl,#0xC0F0
   731A E5            [11]  293 	push	hl
   731B 3E 28         [ 7]  294 	ld	a,#0x28
   731D F5            [11]  295 	push	af
   731E 33            [ 6]  296 	inc	sp
   731F DD 7E FD      [19]  297 	ld	a,-3 (ix)
   7322 F5            [11]  298 	push	af
   7323 33            [ 6]  299 	inc	sp
   7324 C5            [11]  300 	push	bc
   7325 33            [ 6]  301 	inc	sp
   7326 D5            [11]  302 	push	de
   7327 33            [ 6]  303 	inc	sp
   7328 79            [ 4]  304 	ld	a,c
   7329 F5            [11]  305 	push	af
   732A 33            [ 6]  306 	inc	sp
   732B CD 62 59      [17]  307 	call	_cpct_etm_drawTileBox2x4
   732E DD F9         [10]  308 	ld	sp, ix
   7330 DD E1         [14]  309 	pop	ix
   7332 C9            [10]  310 	ret
                            311 ;src/main.c:131: void menuFin(){
                            312 ;	---------------------------------
                            313 ; Function menuFin
                            314 ; ---------------------------------
   7333                     315 _menuFin::
                            316 ;src/main.c:134: cpct_clearScreen(0);
   7333 21 00 40      [10]  317 	ld	hl,#0x4000
   7336 E5            [11]  318 	push	hl
   7337 AF            [ 4]  319 	xor	a, a
   7338 F5            [11]  320 	push	af
   7339 33            [ 6]  321 	inc	sp
   733A 26 C0         [ 7]  322 	ld	h, #0xC0
   733C E5            [11]  323 	push	hl
   733D CD 48 5B      [17]  324 	call	_cpct_memset
                            325 ;src/main.c:136: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   7340 21 18 5A      [10]  326 	ld	hl,#0x5A18
   7343 E5            [11]  327 	push	hl
   7344 21 00 C0      [10]  328 	ld	hl,#0xC000
   7347 E5            [11]  329 	push	hl
   7348 CD 69 64      [17]  330 	call	_cpct_getScreenPtr
   734B 4D            [ 4]  331 	ld	c,l
   734C 44            [ 4]  332 	ld	b,h
                            333 ;src/main.c:137: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   734D 21 02 00      [10]  334 	ld	hl,#0x0002
   7350 E5            [11]  335 	push	hl
   7351 C5            [11]  336 	push	bc
   7352 21 60 73      [10]  337 	ld	hl,#___str_0
   7355 E5            [11]  338 	push	hl
   7356 CD 99 58      [17]  339 	call	_cpct_drawStringM0
   7359 21 06 00      [10]  340 	ld	hl,#6
   735C 39            [11]  341 	add	hl,sp
   735D F9            [ 6]  342 	ld	sp,hl
                            343 ;src/main.c:139: while(1){}
   735E                     344 00102$:
   735E 18 FE         [12]  345 	jr	00102$
   7360                     346 ___str_0:
   7360 47 41 4D 45 20 4F   347 	.ascii "GAME OVER"
        56 45 52
   7369 00                  348 	.db 0x00
                            349 ;src/main.c:142: void redibujarProta() {
                            350 ;	---------------------------------
                            351 ; Function redibujarProta
                            352 ; ---------------------------------
   736A                     353 _redibujarProta::
                            354 ;src/main.c:143: borrarProta();
   736A CD BF 72      [17]  355 	call	_borrarProta
                            356 ;src/main.c:144: prota.px = prota.x;
   736D 01 D8 69      [10]  357 	ld	bc,#_prota + 2
   7370 3A D6 69      [13]  358 	ld	a, (#_prota + 0)
   7373 02            [ 7]  359 	ld	(bc),a
                            360 ;src/main.c:145: prota.py = prota.y;
   7374 01 D9 69      [10]  361 	ld	bc,#_prota + 3
   7377 3A D7 69      [13]  362 	ld	a, (#_prota + 1)
   737A 02            [ 7]  363 	ld	(bc),a
                            364 ;src/main.c:146: dibujarProta();
   737B C3 99 72      [10]  365 	jp  _dibujarProta
                            366 ;src/main.c:149: u8* getTilePtr(u8 x, u8 y) {
                            367 ;	---------------------------------
                            368 ; Function getTilePtr
                            369 ; ---------------------------------
   737E                     370 _getTilePtr::
   737E DD E5         [15]  371 	push	ix
   7380 DD 21 00 00   [14]  372 	ld	ix,#0
   7384 DD 39         [15]  373 	add	ix,sp
                            374 ;src/main.c:150: return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
   7386 DD 4E 05      [19]  375 	ld	c,5 (ix)
   7389 06 00         [ 7]  376 	ld	b,#0x00
   738B 79            [ 4]  377 	ld	a,c
   738C C6 E8         [ 7]  378 	add	a,#0xE8
   738E 5F            [ 4]  379 	ld	e,a
   738F 78            [ 4]  380 	ld	a,b
   7390 CE FF         [ 7]  381 	adc	a,#0xFF
   7392 57            [ 4]  382 	ld	d,a
   7393 6B            [ 4]  383 	ld	l, e
   7394 62            [ 4]  384 	ld	h, d
   7395 CB 7A         [ 8]  385 	bit	7, d
   7397 28 04         [12]  386 	jr	Z,00103$
   7399 21 EB FF      [10]  387 	ld	hl,#0xFFEB
   739C 09            [11]  388 	add	hl,bc
   739D                     389 00103$:
   739D CB 2C         [ 8]  390 	sra	h
   739F CB 1D         [ 8]  391 	rr	l
   73A1 CB 2C         [ 8]  392 	sra	h
   73A3 CB 1D         [ 8]  393 	rr	l
   73A5 4D            [ 4]  394 	ld	c, l
   73A6 44            [ 4]  395 	ld	b, h
   73A7 29            [11]  396 	add	hl, hl
   73A8 29            [11]  397 	add	hl, hl
   73A9 09            [11]  398 	add	hl, bc
   73AA 29            [11]  399 	add	hl, hl
   73AB 29            [11]  400 	add	hl, hl
   73AC 29            [11]  401 	add	hl, hl
   73AD 4D            [ 4]  402 	ld	c,l
   73AE 44            [ 4]  403 	ld	b,h
   73AF 2A E9 69      [16]  404 	ld	hl,(_mapa)
   73B2 09            [11]  405 	add	hl,bc
   73B3 DD 4E 04      [19]  406 	ld	c,4 (ix)
   73B6 CB 39         [ 8]  407 	srl	c
   73B8 59            [ 4]  408 	ld	e,c
   73B9 16 00         [ 7]  409 	ld	d,#0x00
   73BB 19            [11]  410 	add	hl,de
   73BC DD E1         [14]  411 	pop	ix
   73BE C9            [10]  412 	ret
                            413 ;src/main.c:153: u8 checkCollision(int direction) { // check optimization
                            414 ;	---------------------------------
                            415 ; Function checkCollision
                            416 ; ---------------------------------
   73BF                     417 _checkCollision::
   73BF DD E5         [15]  418 	push	ix
   73C1 DD 21 00 00   [14]  419 	ld	ix,#0
   73C5 DD 39         [15]  420 	add	ix,sp
   73C7 F5            [11]  421 	push	af
                            422 ;src/main.c:154: u8 *headTile=0, *feetTile=0, *waistTile=0;
   73C8 21 00 00      [10]  423 	ld	hl,#0x0000
   73CB E3            [19]  424 	ex	(sp), hl
   73CC 11 00 00      [10]  425 	ld	de,#0x0000
   73CF 01 00 00      [10]  426 	ld	bc,#0x0000
                            427 ;src/main.c:156: switch (direction) {
   73D2 DD CB 05 7E   [20]  428 	bit	7, 5 (ix)
   73D6 C2 F3 74      [10]  429 	jp	NZ,00105$
   73D9 3E 03         [ 7]  430 	ld	a,#0x03
   73DB DD BE 04      [19]  431 	cp	a, 4 (ix)
   73DE 3E 00         [ 7]  432 	ld	a,#0x00
   73E0 DD 9E 05      [19]  433 	sbc	a, 5 (ix)
   73E3 E2 E8 73      [10]  434 	jp	PO, 00128$
   73E6 EE 80         [ 7]  435 	xor	a, #0x80
   73E8                     436 00128$:
   73E8 FA F3 74      [10]  437 	jp	M,00105$
   73EB DD 5E 04      [19]  438 	ld	e,4 (ix)
   73EE 16 00         [ 7]  439 	ld	d,#0x00
   73F0 21 F7 73      [10]  440 	ld	hl,#00129$
   73F3 19            [11]  441 	add	hl,de
   73F4 19            [11]  442 	add	hl,de
   73F5 19            [11]  443 	add	hl,de
   73F6 E9            [ 4]  444 	jp	(hl)
   73F7                     445 00129$:
   73F7 C3 03 74      [10]  446 	jp	00101$
   73FA C3 4E 74      [10]  447 	jp	00102$
   73FD C3 8F 74      [10]  448 	jp	00103$
   7400 C3 C2 74      [10]  449 	jp	00104$
                            450 ;src/main.c:157: case 0:
   7403                     451 00101$:
                            452 ;src/main.c:158: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   7403 21 D7 69      [10]  453 	ld	hl, #(_prota + 0x0001) + 0
   7406 5E            [ 7]  454 	ld	e,(hl)
   7407 21 D6 69      [10]  455 	ld	hl, #_prota + 0
   740A 4E            [ 7]  456 	ld	c,(hl)
   740B 0C            [ 4]  457 	inc	c
   740C 0C            [ 4]  458 	inc	c
   740D 0C            [ 4]  459 	inc	c
   740E 0C            [ 4]  460 	inc	c
   740F 7B            [ 4]  461 	ld	a,e
   7410 F5            [11]  462 	push	af
   7411 33            [ 6]  463 	inc	sp
   7412 79            [ 4]  464 	ld	a,c
   7413 F5            [11]  465 	push	af
   7414 33            [ 6]  466 	inc	sp
   7415 CD 7E 73      [17]  467 	call	_getTilePtr
   7418 F1            [10]  468 	pop	af
   7419 33            [ 6]  469 	inc	sp
   741A 33            [ 6]  470 	inc	sp
   741B E5            [11]  471 	push	hl
                            472 ;src/main.c:159: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   741C 3A D7 69      [13]  473 	ld	a, (#(_prota + 0x0001) + 0)
   741F C6 14         [ 7]  474 	add	a, #0x14
   7421 4F            [ 4]  475 	ld	c,a
   7422 21 D6 69      [10]  476 	ld	hl, #_prota + 0
   7425 46            [ 7]  477 	ld	b,(hl)
   7426 04            [ 4]  478 	inc	b
   7427 04            [ 4]  479 	inc	b
   7428 04            [ 4]  480 	inc	b
   7429 04            [ 4]  481 	inc	b
   742A 79            [ 4]  482 	ld	a,c
   742B F5            [11]  483 	push	af
   742C 33            [ 6]  484 	inc	sp
   742D C5            [11]  485 	push	bc
   742E 33            [ 6]  486 	inc	sp
   742F CD 7E 73      [17]  487 	call	_getTilePtr
   7432 F1            [10]  488 	pop	af
   7433 EB            [ 4]  489 	ex	de,hl
                            490 ;src/main.c:160: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   7434 3A D7 69      [13]  491 	ld	a, (#(_prota + 0x0001) + 0)
   7437 C6 0B         [ 7]  492 	add	a, #0x0B
   7439 47            [ 4]  493 	ld	b,a
   743A 3A D6 69      [13]  494 	ld	a, (#_prota + 0)
   743D C6 04         [ 7]  495 	add	a, #0x04
   743F D5            [11]  496 	push	de
   7440 C5            [11]  497 	push	bc
   7441 33            [ 6]  498 	inc	sp
   7442 F5            [11]  499 	push	af
   7443 33            [ 6]  500 	inc	sp
   7444 CD 7E 73      [17]  501 	call	_getTilePtr
   7447 F1            [10]  502 	pop	af
   7448 4D            [ 4]  503 	ld	c,l
   7449 44            [ 4]  504 	ld	b,h
   744A D1            [10]  505 	pop	de
                            506 ;src/main.c:161: break;
   744B C3 F3 74      [10]  507 	jp	00105$
                            508 ;src/main.c:162: case 1:
   744E                     509 00102$:
                            510 ;src/main.c:163: headTile  = getTilePtr(prota.x - 1, prota.y);
   744E 21 D7 69      [10]  511 	ld	hl, #(_prota + 0x0001) + 0
   7451 56            [ 7]  512 	ld	d,(hl)
   7452 21 D6 69      [10]  513 	ld	hl, #_prota + 0
   7455 46            [ 7]  514 	ld	b,(hl)
   7456 05            [ 4]  515 	dec	b
   7457 D5            [11]  516 	push	de
   7458 33            [ 6]  517 	inc	sp
   7459 C5            [11]  518 	push	bc
   745A 33            [ 6]  519 	inc	sp
   745B CD 7E 73      [17]  520 	call	_getTilePtr
   745E F1            [10]  521 	pop	af
   745F 33            [ 6]  522 	inc	sp
   7460 33            [ 6]  523 	inc	sp
   7461 E5            [11]  524 	push	hl
                            525 ;src/main.c:164: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
   7462 3A D7 69      [13]  526 	ld	a, (#(_prota + 0x0001) + 0)
   7465 C6 14         [ 7]  527 	add	a, #0x14
   7467 57            [ 4]  528 	ld	d,a
   7468 21 D6 69      [10]  529 	ld	hl, #_prota + 0
   746B 46            [ 7]  530 	ld	b,(hl)
   746C 05            [ 4]  531 	dec	b
   746D D5            [11]  532 	push	de
   746E 33            [ 6]  533 	inc	sp
   746F C5            [11]  534 	push	bc
   7470 33            [ 6]  535 	inc	sp
   7471 CD 7E 73      [17]  536 	call	_getTilePtr
   7474 F1            [10]  537 	pop	af
   7475 EB            [ 4]  538 	ex	de,hl
                            539 ;src/main.c:165: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
   7476 3A D7 69      [13]  540 	ld	a, (#(_prota + 0x0001) + 0)
   7479 C6 0B         [ 7]  541 	add	a, #0x0B
   747B 47            [ 4]  542 	ld	b,a
   747C 3A D6 69      [13]  543 	ld	a, (#_prota + 0)
   747F C6 FF         [ 7]  544 	add	a,#0xFF
   7481 D5            [11]  545 	push	de
   7482 C5            [11]  546 	push	bc
   7483 33            [ 6]  547 	inc	sp
   7484 F5            [11]  548 	push	af
   7485 33            [ 6]  549 	inc	sp
   7486 CD 7E 73      [17]  550 	call	_getTilePtr
   7489 F1            [10]  551 	pop	af
   748A 4D            [ 4]  552 	ld	c,l
   748B 44            [ 4]  553 	ld	b,h
   748C D1            [10]  554 	pop	de
                            555 ;src/main.c:166: break;
   748D 18 64         [12]  556 	jr	00105$
                            557 ;src/main.c:167: case 2:
   748F                     558 00103$:
                            559 ;src/main.c:168: headTile   = getTilePtr(prota.x, prota.y - 2);
   748F 3A D7 69      [13]  560 	ld	a, (#(_prota + 0x0001) + 0)
   7492 C6 FE         [ 7]  561 	add	a,#0xFE
   7494 21 D6 69      [10]  562 	ld	hl, #_prota + 0
   7497 56            [ 7]  563 	ld	d,(hl)
   7498 C5            [11]  564 	push	bc
   7499 F5            [11]  565 	push	af
   749A 33            [ 6]  566 	inc	sp
   749B D5            [11]  567 	push	de
   749C 33            [ 6]  568 	inc	sp
   749D CD 7E 73      [17]  569 	call	_getTilePtr
   74A0 F1            [10]  570 	pop	af
   74A1 C1            [10]  571 	pop	bc
   74A2 33            [ 6]  572 	inc	sp
   74A3 33            [ 6]  573 	inc	sp
   74A4 E5            [11]  574 	push	hl
                            575 ;src/main.c:169: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
   74A5 21 D7 69      [10]  576 	ld	hl, #(_prota + 0x0001) + 0
   74A8 56            [ 7]  577 	ld	d,(hl)
   74A9 15            [ 4]  578 	dec	d
   74AA 15            [ 4]  579 	dec	d
   74AB 3A D6 69      [13]  580 	ld	a, (#_prota + 0)
   74AE C6 03         [ 7]  581 	add	a, #0x03
   74B0 C5            [11]  582 	push	bc
   74B1 D5            [11]  583 	push	de
   74B2 33            [ 6]  584 	inc	sp
   74B3 F5            [11]  585 	push	af
   74B4 33            [ 6]  586 	inc	sp
   74B5 CD 7E 73      [17]  587 	call	_getTilePtr
   74B8 F1            [10]  588 	pop	af
   74B9 EB            [ 4]  589 	ex	de,hl
   74BA C1            [10]  590 	pop	bc
                            591 ;src/main.c:170: *waistTile = 0;
   74BB 21 00 00      [10]  592 	ld	hl,#0x0000
   74BE 36 00         [10]  593 	ld	(hl),#0x00
                            594 ;src/main.c:171: break;
   74C0 18 31         [12]  595 	jr	00105$
                            596 ;src/main.c:172: case 3:
   74C2                     597 00104$:
                            598 ;src/main.c:173: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
   74C2 3A D7 69      [13]  599 	ld	a, (#(_prota + 0x0001) + 0)
   74C5 C6 16         [ 7]  600 	add	a, #0x16
   74C7 21 D6 69      [10]  601 	ld	hl, #_prota + 0
   74CA 56            [ 7]  602 	ld	d,(hl)
   74CB C5            [11]  603 	push	bc
   74CC F5            [11]  604 	push	af
   74CD 33            [ 6]  605 	inc	sp
   74CE D5            [11]  606 	push	de
   74CF 33            [ 6]  607 	inc	sp
   74D0 CD 7E 73      [17]  608 	call	_getTilePtr
   74D3 F1            [10]  609 	pop	af
   74D4 C1            [10]  610 	pop	bc
   74D5 33            [ 6]  611 	inc	sp
   74D6 33            [ 6]  612 	inc	sp
   74D7 E5            [11]  613 	push	hl
                            614 ;src/main.c:174: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   74D8 3A D7 69      [13]  615 	ld	a, (#(_prota + 0x0001) + 0)
   74DB C6 16         [ 7]  616 	add	a, #0x16
   74DD 57            [ 4]  617 	ld	d,a
   74DE 3A D6 69      [13]  618 	ld	a, (#_prota + 0)
   74E1 C6 03         [ 7]  619 	add	a, #0x03
   74E3 C5            [11]  620 	push	bc
   74E4 D5            [11]  621 	push	de
   74E5 33            [ 6]  622 	inc	sp
   74E6 F5            [11]  623 	push	af
   74E7 33            [ 6]  624 	inc	sp
   74E8 CD 7E 73      [17]  625 	call	_getTilePtr
   74EB F1            [10]  626 	pop	af
   74EC EB            [ 4]  627 	ex	de,hl
   74ED C1            [10]  628 	pop	bc
                            629 ;src/main.c:175: *waistTile = 0;
   74EE 21 00 00      [10]  630 	ld	hl,#0x0000
   74F1 36 00         [10]  631 	ld	(hl),#0x00
                            632 ;src/main.c:177: }
   74F3                     633 00105$:
                            634 ;src/main.c:179: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   74F3 E1            [10]  635 	pop	hl
   74F4 E5            [11]  636 	push	hl
   74F5 6E            [ 7]  637 	ld	l,(hl)
   74F6 3E 02         [ 7]  638 	ld	a,#0x02
   74F8 95            [ 4]  639 	sub	a, l
   74F9 38 0E         [12]  640 	jr	C,00106$
   74FB 1A            [ 7]  641 	ld	a,(de)
   74FC 5F            [ 4]  642 	ld	e,a
   74FD 3E 02         [ 7]  643 	ld	a,#0x02
   74FF 93            [ 4]  644 	sub	a, e
   7500 38 07         [12]  645 	jr	C,00106$
   7502 0A            [ 7]  646 	ld	a,(bc)
   7503 4F            [ 4]  647 	ld	c,a
   7504 3E 02         [ 7]  648 	ld	a,#0x02
   7506 91            [ 4]  649 	sub	a, c
   7507 30 04         [12]  650 	jr	NC,00107$
   7509                     651 00106$:
                            652 ;src/main.c:180: return 1;
   7509 2E 01         [ 7]  653 	ld	l,#0x01
   750B 18 02         [12]  654 	jr	00110$
   750D                     655 00107$:
                            656 ;src/main.c:182: return 0;
   750D 2E 00         [ 7]  657 	ld	l,#0x00
   750F                     658 00110$:
   750F DD F9         [10]  659 	ld	sp, ix
   7511 DD E1         [14]  660 	pop	ix
   7513 C9            [10]  661 	ret
                            662 ;src/main.c:185: void dibujarEnemigo(TEnemy *enemy) {
                            663 ;	---------------------------------
                            664 ; Function dibujarEnemigo
                            665 ; ---------------------------------
   7514                     666 _dibujarEnemigo::
   7514 DD E5         [15]  667 	push	ix
   7516 DD 21 00 00   [14]  668 	ld	ix,#0
   751A DD 39         [15]  669 	add	ix,sp
                            670 ;src/main.c:186: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   751C DD 4E 04      [19]  671 	ld	c,4 (ix)
   751F DD 46 05      [19]  672 	ld	b,5 (ix)
   7522 69            [ 4]  673 	ld	l, c
   7523 60            [ 4]  674 	ld	h, b
   7524 23            [ 6]  675 	inc	hl
   7525 56            [ 7]  676 	ld	d,(hl)
   7526 0A            [ 7]  677 	ld	a,(bc)
   7527 C5            [11]  678 	push	bc
   7528 D5            [11]  679 	push	de
   7529 33            [ 6]  680 	inc	sp
   752A F5            [11]  681 	push	af
   752B 33            [ 6]  682 	inc	sp
   752C 21 00 C0      [10]  683 	ld	hl,#0xC000
   752F E5            [11]  684 	push	hl
   7530 CD 69 64      [17]  685 	call	_cpct_getScreenPtr
   7533 EB            [ 4]  686 	ex	de,hl
                            687 ;src/main.c:187: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   7534 E1            [10]  688 	pop	hl
   7535 01 04 00      [10]  689 	ld	bc, #0x0004
   7538 09            [11]  690 	add	hl, bc
   7539 4E            [ 7]  691 	ld	c,(hl)
   753A 23            [ 6]  692 	inc	hl
   753B 46            [ 7]  693 	ld	b,(hl)
   753C 21 00 0E      [10]  694 	ld	hl,#_g_tablatrans
   753F E5            [11]  695 	push	hl
   7540 21 04 16      [10]  696 	ld	hl,#0x1604
   7543 E5            [11]  697 	push	hl
   7544 D5            [11]  698 	push	de
   7545 C5            [11]  699 	push	bc
   7546 CD 89 64      [17]  700 	call	_cpct_drawSpriteMaskedAlignedTable
   7549 DD E1         [14]  701 	pop	ix
   754B C9            [10]  702 	ret
                            703 ;src/main.c:190: void dibujarExplosion(TEnemy *enemy) {
                            704 ;	---------------------------------
                            705 ; Function dibujarExplosion
                            706 ; ---------------------------------
   754C                     707 _dibujarExplosion::
   754C DD E5         [15]  708 	push	ix
   754E DD 21 00 00   [14]  709 	ld	ix,#0
   7552 DD 39         [15]  710 	add	ix,sp
                            711 ;src/main.c:191: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   7554 DD 4E 04      [19]  712 	ld	c,4 (ix)
   7557 DD 46 05      [19]  713 	ld	b,5 (ix)
   755A 69            [ 4]  714 	ld	l, c
   755B 60            [ 4]  715 	ld	h, b
   755C 23            [ 6]  716 	inc	hl
   755D 56            [ 7]  717 	ld	d,(hl)
   755E 0A            [ 7]  718 	ld	a,(bc)
   755F 47            [ 4]  719 	ld	b,a
   7560 D5            [11]  720 	push	de
   7561 33            [ 6]  721 	inc	sp
   7562 C5            [11]  722 	push	bc
   7563 33            [ 6]  723 	inc	sp
   7564 21 00 C0      [10]  724 	ld	hl,#0xC000
   7567 E5            [11]  725 	push	hl
   7568 CD 69 64      [17]  726 	call	_cpct_getScreenPtr
   756B 4D            [ 4]  727 	ld	c,l
   756C 44            [ 4]  728 	ld	b,h
                            729 ;src/main.c:192: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   756D 11 00 0E      [10]  730 	ld	de,#_g_tablatrans+0
   7570 D5            [11]  731 	push	de
   7571 21 04 16      [10]  732 	ld	hl,#0x1604
   7574 E5            [11]  733 	push	hl
   7575 C5            [11]  734 	push	bc
   7576 21 A8 25      [10]  735 	ld	hl,#_g_explosion
   7579 E5            [11]  736 	push	hl
   757A CD 89 64      [17]  737 	call	_cpct_drawSpriteMaskedAlignedTable
   757D DD E1         [14]  738 	pop	ix
   757F C9            [10]  739 	ret
                            740 ;src/main.c:195: void borrarExplosion() {
                            741 ;	---------------------------------
                            742 ; Function borrarExplosion
                            743 ; ---------------------------------
   7580                     744 _borrarExplosion::
   7580 DD E5         [15]  745 	push	ix
   7582 DD 21 00 00   [14]  746 	ld	ix,#0
   7586 DD 39         [15]  747 	add	ix,sp
   7588 F5            [11]  748 	push	af
   7589 3B            [ 6]  749 	dec	sp
                            750 ;src/main.c:196: u8 w = 4 + (enemy->px & 1);
   758A 21 C8 64      [10]  751 	ld	hl, #_enemy + 2
   758D 4E            [ 7]  752 	ld	c,(hl)
   758E 79            [ 4]  753 	ld	a,c
   758F E6 01         [ 7]  754 	and	a, #0x01
   7591 47            [ 4]  755 	ld	b,a
   7592 04            [ 4]  756 	inc	b
   7593 04            [ 4]  757 	inc	b
   7594 04            [ 4]  758 	inc	b
   7595 04            [ 4]  759 	inc	b
                            760 ;src/main.c:199: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   7596 21 C9 64      [10]  761 	ld	hl, #_enemy + 3
   7599 5E            [ 7]  762 	ld	e,(hl)
   759A CB 4B         [ 8]  763 	bit	1, e
   759C 28 04         [12]  764 	jr	Z,00103$
   759E 3E 01         [ 7]  765 	ld	a,#0x01
   75A0 18 02         [12]  766 	jr	00104$
   75A2                     767 00103$:
   75A2 3E 00         [ 7]  768 	ld	a,#0x00
   75A4                     769 00104$:
   75A4 C6 07         [ 7]  770 	add	a, #0x07
   75A6 DD 77 FD      [19]  771 	ld	-3 (ix),a
                            772 ;src/main.c:201: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   75A9 FD 2A E9 69   [20]  773 	ld	iy,(_mapa)
   75AD 16 00         [ 7]  774 	ld	d,#0x00
   75AF 7B            [ 4]  775 	ld	a,e
   75B0 C6 E8         [ 7]  776 	add	a,#0xE8
   75B2 DD 77 FE      [19]  777 	ld	-2 (ix),a
   75B5 7A            [ 4]  778 	ld	a,d
   75B6 CE FF         [ 7]  779 	adc	a,#0xFF
   75B8 DD 77 FF      [19]  780 	ld	-1 (ix),a
   75BB DD 6E FE      [19]  781 	ld	l,-2 (ix)
   75BE DD 66 FF      [19]  782 	ld	h,-1 (ix)
   75C1 DD CB FF 7E   [20]  783 	bit	7, -1 (ix)
   75C5 28 04         [12]  784 	jr	Z,00105$
   75C7 21 EB FF      [10]  785 	ld	hl,#0xFFEB
   75CA 19            [11]  786 	add	hl,de
   75CB                     787 00105$:
   75CB CB 2C         [ 8]  788 	sra	h
   75CD CB 1D         [ 8]  789 	rr	l
   75CF CB 2C         [ 8]  790 	sra	h
   75D1 CB 1D         [ 8]  791 	rr	l
   75D3 55            [ 4]  792 	ld	d,l
   75D4 CB 39         [ 8]  793 	srl	c
   75D6 FD E5         [15]  794 	push	iy
   75D8 21 F0 C0      [10]  795 	ld	hl,#0xC0F0
   75DB E5            [11]  796 	push	hl
   75DC 3E 28         [ 7]  797 	ld	a,#0x28
   75DE F5            [11]  798 	push	af
   75DF 33            [ 6]  799 	inc	sp
   75E0 DD 7E FD      [19]  800 	ld	a,-3 (ix)
   75E3 F5            [11]  801 	push	af
   75E4 33            [ 6]  802 	inc	sp
   75E5 C5            [11]  803 	push	bc
   75E6 33            [ 6]  804 	inc	sp
   75E7 D5            [11]  805 	push	de
   75E8 33            [ 6]  806 	inc	sp
   75E9 79            [ 4]  807 	ld	a,c
   75EA F5            [11]  808 	push	af
   75EB 33            [ 6]  809 	inc	sp
   75EC CD 62 59      [17]  810 	call	_cpct_etm_drawTileBox2x4
   75EF DD F9         [10]  811 	ld	sp, ix
   75F1 DD E1         [14]  812 	pop	ix
   75F3 C9            [10]  813 	ret
                            814 ;src/main.c:205: void borrarEnemigo(TEnemy *enemy) {
                            815 ;	---------------------------------
                            816 ; Function borrarEnemigo
                            817 ; ---------------------------------
   75F4                     818 _borrarEnemigo::
   75F4 DD E5         [15]  819 	push	ix
   75F6 DD 21 00 00   [14]  820 	ld	ix,#0
   75FA DD 39         [15]  821 	add	ix,sp
   75FC 21 FA FF      [10]  822 	ld	hl,#-6
   75FF 39            [11]  823 	add	hl,sp
   7600 F9            [ 6]  824 	ld	sp,hl
                            825 ;src/main.c:207: u8 w = 4 + (enemy->px & 1);
   7601 DD 4E 04      [19]  826 	ld	c,4 (ix)
   7604 DD 46 05      [19]  827 	ld	b,5 (ix)
   7607 69            [ 4]  828 	ld	l, c
   7608 60            [ 4]  829 	ld	h, b
   7609 23            [ 6]  830 	inc	hl
   760A 23            [ 6]  831 	inc	hl
   760B 5E            [ 7]  832 	ld	e,(hl)
   760C 7B            [ 4]  833 	ld	a,e
   760D E6 01         [ 7]  834 	and	a, #0x01
   760F C6 04         [ 7]  835 	add	a, #0x04
   7611 DD 77 FA      [19]  836 	ld	-6 (ix),a
                            837 ;src/main.c:210: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   7614 69            [ 4]  838 	ld	l, c
   7615 60            [ 4]  839 	ld	h, b
   7616 23            [ 6]  840 	inc	hl
   7617 23            [ 6]  841 	inc	hl
   7618 23            [ 6]  842 	inc	hl
   7619 56            [ 7]  843 	ld	d,(hl)
   761A CB 4A         [ 8]  844 	bit	1, d
   761C 28 04         [12]  845 	jr	Z,00103$
   761E 3E 01         [ 7]  846 	ld	a,#0x01
   7620 18 02         [12]  847 	jr	00104$
   7622                     848 00103$:
   7622 3E 00         [ 7]  849 	ld	a,#0x00
   7624                     850 00104$:
   7624 C6 07         [ 7]  851 	add	a, #0x07
   7626 DD 77 FB      [19]  852 	ld	-5 (ix),a
                            853 ;src/main.c:212: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   7629 FD 2A E9 69   [20]  854 	ld	iy,(_mapa)
   762D DD 72 FE      [19]  855 	ld	-2 (ix),d
   7630 DD 36 FF 00   [19]  856 	ld	-1 (ix),#0x00
   7634 DD 7E FE      [19]  857 	ld	a,-2 (ix)
   7637 C6 E8         [ 7]  858 	add	a,#0xE8
   7639 DD 77 FC      [19]  859 	ld	-4 (ix),a
   763C DD 7E FF      [19]  860 	ld	a,-1 (ix)
   763F CE FF         [ 7]  861 	adc	a,#0xFF
   7641 DD 77 FD      [19]  862 	ld	-3 (ix),a
   7644 DD 56 FC      [19]  863 	ld	d,-4 (ix)
   7647 DD 6E FD      [19]  864 	ld	l,-3 (ix)
   764A DD CB FD 7E   [20]  865 	bit	7, -3 (ix)
   764E 28 0C         [12]  866 	jr	Z,00105$
   7650 DD 7E FE      [19]  867 	ld	a,-2 (ix)
   7653 C6 EB         [ 7]  868 	add	a, #0xEB
   7655 57            [ 4]  869 	ld	d,a
   7656 DD 7E FF      [19]  870 	ld	a,-1 (ix)
   7659 CE FF         [ 7]  871 	adc	a, #0xFF
   765B 6F            [ 4]  872 	ld	l,a
   765C                     873 00105$:
   765C CB 2D         [ 8]  874 	sra	l
   765E CB 1A         [ 8]  875 	rr	d
   7660 CB 2D         [ 8]  876 	sra	l
   7662 CB 1A         [ 8]  877 	rr	d
   7664 CB 3B         [ 8]  878 	srl	e
   7666 C5            [11]  879 	push	bc
   7667 FD E5         [15]  880 	push	iy
   7669 21 F0 C0      [10]  881 	ld	hl,#0xC0F0
   766C E5            [11]  882 	push	hl
   766D 3E 28         [ 7]  883 	ld	a,#0x28
   766F F5            [11]  884 	push	af
   7670 33            [ 6]  885 	inc	sp
   7671 DD 66 FB      [19]  886 	ld	h,-5 (ix)
   7674 DD 6E FA      [19]  887 	ld	l,-6 (ix)
   7677 E5            [11]  888 	push	hl
   7678 D5            [11]  889 	push	de
   7679 CD 62 59      [17]  890 	call	_cpct_etm_drawTileBox2x4
   767C C1            [10]  891 	pop	bc
                            892 ;src/main.c:214: enemy->mover = NO;
   767D 21 06 00      [10]  893 	ld	hl,#0x0006
   7680 09            [11]  894 	add	hl,bc
   7681 36 00         [10]  895 	ld	(hl),#0x00
   7683 DD F9         [10]  896 	ld	sp, ix
   7685 DD E1         [14]  897 	pop	ix
   7687 C9            [10]  898 	ret
                            899 ;src/main.c:217: void redibujarEnemigo(TEnemy *enemy) {
                            900 ;	---------------------------------
                            901 ; Function redibujarEnemigo
                            902 ; ---------------------------------
   7688                     903 _redibujarEnemigo::
   7688 DD E5         [15]  904 	push	ix
   768A DD 21 00 00   [14]  905 	ld	ix,#0
   768E DD 39         [15]  906 	add	ix,sp
                            907 ;src/main.c:218: borrarEnemigo(enemy);
   7690 DD 6E 04      [19]  908 	ld	l,4 (ix)
   7693 DD 66 05      [19]  909 	ld	h,5 (ix)
   7696 E5            [11]  910 	push	hl
   7697 CD F4 75      [17]  911 	call	_borrarEnemigo
   769A F1            [10]  912 	pop	af
                            913 ;src/main.c:219: enemy->px = enemy->x;
   769B DD 4E 04      [19]  914 	ld	c,4 (ix)
   769E DD 46 05      [19]  915 	ld	b,5 (ix)
   76A1 59            [ 4]  916 	ld	e, c
   76A2 50            [ 4]  917 	ld	d, b
   76A3 13            [ 6]  918 	inc	de
   76A4 13            [ 6]  919 	inc	de
   76A5 0A            [ 7]  920 	ld	a,(bc)
   76A6 12            [ 7]  921 	ld	(de),a
                            922 ;src/main.c:220: enemy->py = enemy->y;
   76A7 59            [ 4]  923 	ld	e, c
   76A8 50            [ 4]  924 	ld	d, b
   76A9 13            [ 6]  925 	inc	de
   76AA 13            [ 6]  926 	inc	de
   76AB 13            [ 6]  927 	inc	de
   76AC 69            [ 4]  928 	ld	l, c
   76AD 60            [ 4]  929 	ld	h, b
   76AE 23            [ 6]  930 	inc	hl
   76AF 7E            [ 7]  931 	ld	a,(hl)
   76B0 12            [ 7]  932 	ld	(de),a
                            933 ;src/main.c:221: dibujarEnemigo(enemy);
   76B1 C5            [11]  934 	push	bc
   76B2 CD 14 75      [17]  935 	call	_dibujarEnemigo
   76B5 F1            [10]  936 	pop	af
   76B6 DD E1         [14]  937 	pop	ix
   76B8 C9            [10]  938 	ret
                            939 ;src/main.c:224: u8 checkEnemyCollision(int direction, TEnemy *enemy){
                            940 ;	---------------------------------
                            941 ; Function checkEnemyCollision
                            942 ; ---------------------------------
   76B9                     943 _checkEnemyCollision::
   76B9 DD E5         [15]  944 	push	ix
   76BB DD 21 00 00   [14]  945 	ld	ix,#0
   76BF DD 39         [15]  946 	add	ix,sp
   76C1 21 F7 FF      [10]  947 	ld	hl,#-9
   76C4 39            [11]  948 	add	hl,sp
   76C5 F9            [ 6]  949 	ld	sp,hl
                            950 ;src/main.c:226: u8 colisiona = 1;
   76C6 DD 36 F7 01   [19]  951 	ld	-9 (ix),#0x01
                            952 ;src/main.c:228: switch (direction) {
   76CA DD CB 05 7E   [20]  953 	bit	7, 5 (ix)
   76CE C2 81 7A      [10]  954 	jp	NZ,00165$
   76D1 3E 03         [ 7]  955 	ld	a,#0x03
   76D3 DD BE 04      [19]  956 	cp	a, 4 (ix)
   76D6 3E 00         [ 7]  957 	ld	a,#0x00
   76D8 DD 9E 05      [19]  958 	sbc	a, 5 (ix)
   76DB E2 E0 76      [10]  959 	jp	PO, 00272$
   76DE EE 80         [ 7]  960 	xor	a, #0x80
   76E0                     961 00272$:
   76E0 FA 81 7A      [10]  962 	jp	M,00165$
                            963 ;src/main.c:230: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   76E3 DD 4E 06      [19]  964 	ld	c,6 (ix)
   76E6 DD 46 07      [19]  965 	ld	b,7 (ix)
   76E9 0A            [ 7]  966 	ld	a,(bc)
   76EA 5F            [ 4]  967 	ld	e,a
   76EB 21 01 00      [10]  968 	ld	hl,#0x0001
   76EE 09            [11]  969 	add	hl,bc
   76EF DD 75 F8      [19]  970 	ld	-8 (ix),l
   76F2 DD 74 F9      [19]  971 	ld	-7 (ix),h
   76F5 DD 6E F8      [19]  972 	ld	l,-8 (ix)
   76F8 DD 66 F9      [19]  973 	ld	h,-7 (ix)
   76FB 56            [ 7]  974 	ld	d,(hl)
                            975 ;src/main.c:243: enemy->muerto = SI;
   76FC 21 08 00      [10]  976 	ld	hl,#0x0008
   76FF 09            [11]  977 	add	hl,bc
   7700 DD 75 FA      [19]  978 	ld	-6 (ix),l
   7703 DD 74 FB      [19]  979 	ld	-5 (ix),h
                            980 ;src/main.c:250: enemy->mira = M_izquierda;
   7706 21 07 00      [10]  981 	ld	hl,#0x0007
   7709 09            [11]  982 	add	hl,bc
   770A DD 75 FC      [19]  983 	ld	-4 (ix),l
   770D DD 74 FD      [19]  984 	ld	-3 (ix),h
                            985 ;src/main.c:228: switch (direction) {
   7710 D5            [11]  986 	push	de
   7711 DD 5E 04      [19]  987 	ld	e,4 (ix)
   7714 16 00         [ 7]  988 	ld	d,#0x00
   7716 21 1E 77      [10]  989 	ld	hl,#00273$
   7719 19            [11]  990 	add	hl,de
   771A 19            [11]  991 	add	hl,de
   771B 19            [11]  992 	add	hl,de
   771C D1            [10]  993 	pop	de
   771D E9            [ 4]  994 	jp	(hl)
   771E                     995 00273$:
   771E C3 2A 77      [10]  996 	jp	00101$
   7721 C3 03 78      [10]  997 	jp	00117$
   7724 C3 D8 78      [10]  998 	jp	00133$
   7727 C3 A7 79      [10]  999 	jp	00149$
                           1000 ;src/main.c:229: case 0:
   772A                    1001 00101$:
                           1002 ;src/main.c:230: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   772A 7B            [ 4] 1003 	ld	a,e
   772B C6 05         [ 7] 1004 	add	a, #0x05
   772D C5            [11] 1005 	push	bc
   772E D5            [11] 1006 	push	de
   772F 33            [ 6] 1007 	inc	sp
   7730 F5            [11] 1008 	push	af
   7731 33            [ 6] 1009 	inc	sp
   7732 CD 7E 73      [17] 1010 	call	_getTilePtr
   7735 F1            [10] 1011 	pop	af
   7736 C1            [10] 1012 	pop	bc
   7737 5E            [ 7] 1013 	ld	e,(hl)
   7738 3E 02         [ 7] 1014 	ld	a,#0x02
   773A 93            [ 4] 1015 	sub	a, e
   773B DA F8 77      [10] 1016 	jp	C,00113$
                           1017 ;src/main.c:231: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   773E DD 6E F8      [19] 1018 	ld	l,-8 (ix)
   7741 DD 66 F9      [19] 1019 	ld	h,-7 (ix)
   7744 7E            [ 7] 1020 	ld	a,(hl)
   7745 C6 0B         [ 7] 1021 	add	a, #0x0B
   7747 57            [ 4] 1022 	ld	d,a
   7748 0A            [ 7] 1023 	ld	a,(bc)
   7749 C6 05         [ 7] 1024 	add	a, #0x05
   774B C5            [11] 1025 	push	bc
   774C D5            [11] 1026 	push	de
   774D 33            [ 6] 1027 	inc	sp
   774E F5            [11] 1028 	push	af
   774F 33            [ 6] 1029 	inc	sp
   7750 CD 7E 73      [17] 1030 	call	_getTilePtr
   7753 F1            [10] 1031 	pop	af
   7754 C1            [10] 1032 	pop	bc
   7755 5E            [ 7] 1033 	ld	e,(hl)
   7756 3E 02         [ 7] 1034 	ld	a,#0x02
   7758 93            [ 4] 1035 	sub	a, e
   7759 DA F8 77      [10] 1036 	jp	C,00113$
                           1037 ;src/main.c:232: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   775C DD 6E F8      [19] 1038 	ld	l,-8 (ix)
   775F DD 66 F9      [19] 1039 	ld	h,-7 (ix)
   7762 7E            [ 7] 1040 	ld	a,(hl)
   7763 C6 16         [ 7] 1041 	add	a, #0x16
   7765 57            [ 4] 1042 	ld	d,a
   7766 0A            [ 7] 1043 	ld	a,(bc)
   7767 C6 05         [ 7] 1044 	add	a, #0x05
   7769 C5            [11] 1045 	push	bc
   776A D5            [11] 1046 	push	de
   776B 33            [ 6] 1047 	inc	sp
   776C F5            [11] 1048 	push	af
   776D 33            [ 6] 1049 	inc	sp
   776E CD 7E 73      [17] 1050 	call	_getTilePtr
   7771 F1            [10] 1051 	pop	af
   7772 C1            [10] 1052 	pop	bc
   7773 5E            [ 7] 1053 	ld	e,(hl)
   7774 3E 02         [ 7] 1054 	ld	a,#0x02
   7776 93            [ 4] 1055 	sub	a, e
   7777 DA F8 77      [10] 1056 	jp	C,00113$
                           1057 ;src/main.c:234: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   777A 21 DF 69      [10] 1058 	ld	hl, #_cu + 1
   777D 5E            [ 7] 1059 	ld	e,(hl)
   777E 16 00         [ 7] 1060 	ld	d,#0x00
   7780 21 04 00      [10] 1061 	ld	hl,#0x0004
   7783 19            [11] 1062 	add	hl,de
   7784 DD 75 FE      [19] 1063 	ld	-2 (ix),l
   7787 DD 74 FF      [19] 1064 	ld	-1 (ix),h
   778A DD 6E F8      [19] 1065 	ld	l,-8 (ix)
   778D DD 66 F9      [19] 1066 	ld	h,-7 (ix)
   7790 6E            [ 7] 1067 	ld	l,(hl)
   7791 26 00         [ 7] 1068 	ld	h,#0x00
   7793 DD 7E FE      [19] 1069 	ld	a,-2 (ix)
   7796 95            [ 4] 1070 	sub	a, l
   7797 DD 7E FF      [19] 1071 	ld	a,-1 (ix)
   779A 9C            [ 4] 1072 	sbc	a, h
   779B E2 A0 77      [10] 1073 	jp	PO, 00274$
   779E EE 80         [ 7] 1074 	xor	a, #0x80
   77A0                    1075 00274$:
   77A0 FA B5 77      [10] 1076 	jp	M,00108$
   77A3 D5            [11] 1077 	push	de
   77A4 11 16 00      [10] 1078 	ld	de,#0x0016
   77A7 19            [11] 1079 	add	hl, de
   77A8 D1            [10] 1080 	pop	de
   77A9 7D            [ 4] 1081 	ld	a,l
   77AA 93            [ 4] 1082 	sub	a, e
   77AB 7C            [ 4] 1083 	ld	a,h
   77AC 9A            [ 4] 1084 	sbc	a, d
   77AD E2 B2 77      [10] 1085 	jp	PO, 00275$
   77B0 EE 80         [ 7] 1086 	xor	a, #0x80
   77B2                    1087 00275$:
   77B2 F2 BC 77      [10] 1088 	jp	P,00109$
   77B5                    1089 00108$:
                           1090 ;src/main.c:235: colisiona = 0;
   77B5 DD 36 F7 00   [19] 1091 	ld	-9 (ix),#0x00
   77B9 C3 81 7A      [10] 1092 	jp	00165$
   77BC                    1093 00109$:
                           1094 ;src/main.c:238: if(cu.x > enemy->x){ //si el cu esta abajo
   77BC 21 DE 69      [10] 1095 	ld	hl, #_cu + 0
   77BF 5E            [ 7] 1096 	ld	e,(hl)
   77C0 0A            [ 7] 1097 	ld	a,(bc)
   77C1 4F            [ 4] 1098 	ld	c,a
   77C2 93            [ 4] 1099 	sub	a, e
   77C3 30 2C         [12] 1100 	jr	NC,00106$
                           1101 ;src/main.c:239: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
   77C5 6B            [ 4] 1102 	ld	l,e
   77C6 26 00         [ 7] 1103 	ld	h,#0x00
   77C8 06 00         [ 7] 1104 	ld	b,#0x00
   77CA 03            [ 6] 1105 	inc	bc
   77CB 03            [ 6] 1106 	inc	bc
   77CC 03            [ 6] 1107 	inc	bc
   77CD 03            [ 6] 1108 	inc	bc
   77CE BF            [ 4] 1109 	cp	a, a
   77CF ED 42         [15] 1110 	sbc	hl, bc
   77D1 3E 01         [ 7] 1111 	ld	a,#0x01
   77D3 BD            [ 4] 1112 	cp	a, l
   77D4 3E 00         [ 7] 1113 	ld	a,#0x00
   77D6 9C            [ 4] 1114 	sbc	a, h
   77D7 E2 DC 77      [10] 1115 	jp	PO, 00276$
   77DA EE 80         [ 7] 1116 	xor	a, #0x80
   77DC                    1117 00276$:
   77DC F2 E6 77      [10] 1118 	jp	P,00103$
                           1119 ;src/main.c:240: colisiona = 0;
   77DF DD 36 F7 00   [19] 1120 	ld	-9 (ix),#0x00
   77E3 C3 81 7A      [10] 1121 	jp	00165$
   77E6                    1122 00103$:
                           1123 ;src/main.c:243: enemy->muerto = SI;
   77E6 DD 6E FA      [19] 1124 	ld	l,-6 (ix)
   77E9 DD 66 FB      [19] 1125 	ld	h,-5 (ix)
   77EC 36 01         [10] 1126 	ld	(hl),#0x01
   77EE C3 81 7A      [10] 1127 	jp	00165$
   77F1                    1128 00106$:
                           1129 ;src/main.c:246: colisiona = 0;
   77F1 DD 36 F7 00   [19] 1130 	ld	-9 (ix),#0x00
   77F5 C3 81 7A      [10] 1131 	jp	00165$
   77F8                    1132 00113$:
                           1133 ;src/main.c:250: enemy->mira = M_izquierda;
   77F8 DD 6E FC      [19] 1134 	ld	l,-4 (ix)
   77FB DD 66 FD      [19] 1135 	ld	h,-3 (ix)
   77FE 36 01         [10] 1136 	ld	(hl),#0x01
                           1137 ;src/main.c:252: break;
   7800 C3 81 7A      [10] 1138 	jp	00165$
                           1139 ;src/main.c:253: case 1:
   7803                    1140 00117$:
                           1141 ;src/main.c:254: if( *getTilePtr(enemy->x - 1, enemy->y) <= 2
   7803 1D            [ 4] 1142 	dec	e
   7804 C5            [11] 1143 	push	bc
   7805 D5            [11] 1144 	push	de
   7806 CD 7E 73      [17] 1145 	call	_getTilePtr
   7809 F1            [10] 1146 	pop	af
   780A C1            [10] 1147 	pop	bc
   780B 5E            [ 7] 1148 	ld	e,(hl)
   780C 3E 02         [ 7] 1149 	ld	a,#0x02
   780E 93            [ 4] 1150 	sub	a, e
   780F DA CD 78      [10] 1151 	jp	C,00129$
                           1152 ;src/main.c:255: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   7812 DD 6E F8      [19] 1153 	ld	l,-8 (ix)
   7815 DD 66 F9      [19] 1154 	ld	h,-7 (ix)
   7818 7E            [ 7] 1155 	ld	a,(hl)
   7819 C6 0B         [ 7] 1156 	add	a, #0x0B
   781B 57            [ 4] 1157 	ld	d,a
   781C 0A            [ 7] 1158 	ld	a,(bc)
   781D C6 FF         [ 7] 1159 	add	a,#0xFF
   781F C5            [11] 1160 	push	bc
   7820 D5            [11] 1161 	push	de
   7821 33            [ 6] 1162 	inc	sp
   7822 F5            [11] 1163 	push	af
   7823 33            [ 6] 1164 	inc	sp
   7824 CD 7E 73      [17] 1165 	call	_getTilePtr
   7827 F1            [10] 1166 	pop	af
   7828 C1            [10] 1167 	pop	bc
   7829 5E            [ 7] 1168 	ld	e,(hl)
   782A 3E 02         [ 7] 1169 	ld	a,#0x02
   782C 93            [ 4] 1170 	sub	a, e
   782D DA CD 78      [10] 1171 	jp	C,00129$
                           1172 ;src/main.c:256: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   7830 DD 6E F8      [19] 1173 	ld	l,-8 (ix)
   7833 DD 66 F9      [19] 1174 	ld	h,-7 (ix)
   7836 7E            [ 7] 1175 	ld	a,(hl)
   7837 C6 16         [ 7] 1176 	add	a, #0x16
   7839 57            [ 4] 1177 	ld	d,a
   783A 0A            [ 7] 1178 	ld	a,(bc)
   783B C6 FF         [ 7] 1179 	add	a,#0xFF
   783D C5            [11] 1180 	push	bc
   783E D5            [11] 1181 	push	de
   783F 33            [ 6] 1182 	inc	sp
   7840 F5            [11] 1183 	push	af
   7841 33            [ 6] 1184 	inc	sp
   7842 CD 7E 73      [17] 1185 	call	_getTilePtr
   7845 F1            [10] 1186 	pop	af
   7846 C1            [10] 1187 	pop	bc
   7847 5E            [ 7] 1188 	ld	e,(hl)
   7848 3E 02         [ 7] 1189 	ld	a,#0x02
   784A 93            [ 4] 1190 	sub	a, e
   784B DA CD 78      [10] 1191 	jp	C,00129$
                           1192 ;src/main.c:258: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   784E 21 DF 69      [10] 1193 	ld	hl, #_cu + 1
   7851 5E            [ 7] 1194 	ld	e,(hl)
   7852 16 00         [ 7] 1195 	ld	d,#0x00
   7854 21 04 00      [10] 1196 	ld	hl,#0x0004
   7857 19            [11] 1197 	add	hl,de
   7858 DD 75 FE      [19] 1198 	ld	-2 (ix),l
   785B DD 74 FF      [19] 1199 	ld	-1 (ix),h
   785E DD 6E F8      [19] 1200 	ld	l,-8 (ix)
   7861 DD 66 F9      [19] 1201 	ld	h,-7 (ix)
   7864 6E            [ 7] 1202 	ld	l,(hl)
   7865 26 00         [ 7] 1203 	ld	h,#0x00
   7867 DD 7E FE      [19] 1204 	ld	a,-2 (ix)
   786A 95            [ 4] 1205 	sub	a, l
   786B DD 7E FF      [19] 1206 	ld	a,-1 (ix)
   786E 9C            [ 4] 1207 	sbc	a, h
   786F E2 74 78      [10] 1208 	jp	PO, 00277$
   7872 EE 80         [ 7] 1209 	xor	a, #0x80
   7874                    1210 00277$:
   7874 FA 89 78      [10] 1211 	jp	M,00124$
   7877 D5            [11] 1212 	push	de
   7878 11 16 00      [10] 1213 	ld	de,#0x0016
   787B 19            [11] 1214 	add	hl, de
   787C D1            [10] 1215 	pop	de
   787D 7D            [ 4] 1216 	ld	a,l
   787E 93            [ 4] 1217 	sub	a, e
   787F 7C            [ 4] 1218 	ld	a,h
   7880 9A            [ 4] 1219 	sbc	a, d
   7881 E2 86 78      [10] 1220 	jp	PO, 00278$
   7884 EE 80         [ 7] 1221 	xor	a, #0x80
   7886                    1222 00278$:
   7886 F2 90 78      [10] 1223 	jp	P,00125$
   7889                    1224 00124$:
                           1225 ;src/main.c:259: colisiona = 0;
   7889 DD 36 F7 00   [19] 1226 	ld	-9 (ix),#0x00
   788D C3 81 7A      [10] 1227 	jp	00165$
   7890                    1228 00125$:
                           1229 ;src/main.c:262: if(enemy->x > cu.x){ //si el cu esta abajo
   7890 0A            [ 7] 1230 	ld	a,(bc)
   7891 5F            [ 4] 1231 	ld	e,a
   7892 21 DE 69      [10] 1232 	ld	hl, #_cu + 0
   7895 4E            [ 7] 1233 	ld	c,(hl)
   7896 79            [ 4] 1234 	ld	a,c
   7897 93            [ 4] 1235 	sub	a, e
   7898 30 2C         [12] 1236 	jr	NC,00122$
                           1237 ;src/main.c:263: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
   789A 6B            [ 4] 1238 	ld	l,e
   789B 26 00         [ 7] 1239 	ld	h,#0x00
   789D 06 00         [ 7] 1240 	ld	b,#0x00
   789F 03            [ 6] 1241 	inc	bc
   78A0 03            [ 6] 1242 	inc	bc
   78A1 03            [ 6] 1243 	inc	bc
   78A2 03            [ 6] 1244 	inc	bc
   78A3 BF            [ 4] 1245 	cp	a, a
   78A4 ED 42         [15] 1246 	sbc	hl, bc
   78A6 3E 01         [ 7] 1247 	ld	a,#0x01
   78A8 BD            [ 4] 1248 	cp	a, l
   78A9 3E 00         [ 7] 1249 	ld	a,#0x00
   78AB 9C            [ 4] 1250 	sbc	a, h
   78AC E2 B1 78      [10] 1251 	jp	PO, 00279$
   78AF EE 80         [ 7] 1252 	xor	a, #0x80
   78B1                    1253 00279$:
   78B1 F2 BB 78      [10] 1254 	jp	P,00119$
                           1255 ;src/main.c:264: colisiona = 0;
   78B4 DD 36 F7 00   [19] 1256 	ld	-9 (ix),#0x00
   78B8 C3 81 7A      [10] 1257 	jp	00165$
   78BB                    1258 00119$:
                           1259 ;src/main.c:267: enemy->muerto = SI;
   78BB DD 6E FA      [19] 1260 	ld	l,-6 (ix)
   78BE DD 66 FB      [19] 1261 	ld	h,-5 (ix)
   78C1 36 01         [10] 1262 	ld	(hl),#0x01
   78C3 C3 81 7A      [10] 1263 	jp	00165$
   78C6                    1264 00122$:
                           1265 ;src/main.c:270: colisiona = 0;
   78C6 DD 36 F7 00   [19] 1266 	ld	-9 (ix),#0x00
   78CA C3 81 7A      [10] 1267 	jp	00165$
   78CD                    1268 00129$:
                           1269 ;src/main.c:274: enemy->mira = M_derecha;
   78CD DD 6E FC      [19] 1270 	ld	l,-4 (ix)
   78D0 DD 66 FD      [19] 1271 	ld	h,-3 (ix)
   78D3 36 00         [10] 1272 	ld	(hl),#0x00
                           1273 ;src/main.c:276: break;
   78D5 C3 81 7A      [10] 1274 	jp	00165$
                           1275 ;src/main.c:277: case 2:
   78D8                    1276 00133$:
                           1277 ;src/main.c:278: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   78D8 15            [ 4] 1278 	dec	d
   78D9 15            [ 4] 1279 	dec	d
   78DA C5            [11] 1280 	push	bc
   78DB D5            [11] 1281 	push	de
   78DC CD 7E 73      [17] 1282 	call	_getTilePtr
   78DF F1            [10] 1283 	pop	af
   78E0 C1            [10] 1284 	pop	bc
   78E1 5E            [ 7] 1285 	ld	e,(hl)
   78E2 3E 02         [ 7] 1286 	ld	a,#0x02
   78E4 93            [ 4] 1287 	sub	a, e
   78E5 DA 9F 79      [10] 1288 	jp	C,00145$
                           1289 ;src/main.c:279: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   78E8 DD 6E F8      [19] 1290 	ld	l,-8 (ix)
   78EB DD 66 F9      [19] 1291 	ld	h,-7 (ix)
   78EE 56            [ 7] 1292 	ld	d,(hl)
   78EF 15            [ 4] 1293 	dec	d
   78F0 15            [ 4] 1294 	dec	d
   78F1 0A            [ 7] 1295 	ld	a,(bc)
   78F2 C6 02         [ 7] 1296 	add	a, #0x02
   78F4 C5            [11] 1297 	push	bc
   78F5 D5            [11] 1298 	push	de
   78F6 33            [ 6] 1299 	inc	sp
   78F7 F5            [11] 1300 	push	af
   78F8 33            [ 6] 1301 	inc	sp
   78F9 CD 7E 73      [17] 1302 	call	_getTilePtr
   78FC F1            [10] 1303 	pop	af
   78FD C1            [10] 1304 	pop	bc
   78FE 5E            [ 7] 1305 	ld	e,(hl)
   78FF 3E 02         [ 7] 1306 	ld	a,#0x02
   7901 93            [ 4] 1307 	sub	a, e
   7902 DA 9F 79      [10] 1308 	jp	C,00145$
                           1309 ;src/main.c:280: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   7905 DD 6E F8      [19] 1310 	ld	l,-8 (ix)
   7908 DD 66 F9      [19] 1311 	ld	h,-7 (ix)
   790B 56            [ 7] 1312 	ld	d,(hl)
   790C 15            [ 4] 1313 	dec	d
   790D 15            [ 4] 1314 	dec	d
   790E 0A            [ 7] 1315 	ld	a,(bc)
   790F C6 04         [ 7] 1316 	add	a, #0x04
   7911 C5            [11] 1317 	push	bc
   7912 D5            [11] 1318 	push	de
   7913 33            [ 6] 1319 	inc	sp
   7914 F5            [11] 1320 	push	af
   7915 33            [ 6] 1321 	inc	sp
   7916 CD 7E 73      [17] 1322 	call	_getTilePtr
   7919 F1            [10] 1323 	pop	af
   791A C1            [10] 1324 	pop	bc
   791B 5E            [ 7] 1325 	ld	e,(hl)
   791C 3E 02         [ 7] 1326 	ld	a,#0x02
   791E 93            [ 4] 1327 	sub	a, e
   791F DA 9F 79      [10] 1328 	jp	C,00145$
                           1329 ;src/main.c:282: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   7922 21 DE 69      [10] 1330 	ld	hl, #_cu + 0
   7925 5E            [ 7] 1331 	ld	e,(hl)
   7926 16 00         [ 7] 1332 	ld	d,#0x00
   7928 21 02 00      [10] 1333 	ld	hl,#0x0002
   792B 19            [11] 1334 	add	hl,de
   792C DD 75 FE      [19] 1335 	ld	-2 (ix),l
   792F DD 74 FF      [19] 1336 	ld	-1 (ix),h
   7932 0A            [ 7] 1337 	ld	a,(bc)
   7933 6F            [ 4] 1338 	ld	l,a
   7934 26 00         [ 7] 1339 	ld	h,#0x00
   7936 DD 7E FE      [19] 1340 	ld	a,-2 (ix)
   7939 95            [ 4] 1341 	sub	a, l
   793A DD 7E FF      [19] 1342 	ld	a,-1 (ix)
   793D 9C            [ 4] 1343 	sbc	a, h
   793E E2 43 79      [10] 1344 	jp	PO, 00280$
   7941 EE 80         [ 7] 1345 	xor	a, #0x80
   7943                    1346 00280$:
   7943 FA 56 79      [10] 1347 	jp	M,00140$
   7946 23            [ 6] 1348 	inc	hl
   7947 23            [ 6] 1349 	inc	hl
   7948 23            [ 6] 1350 	inc	hl
   7949 23            [ 6] 1351 	inc	hl
   794A 7D            [ 4] 1352 	ld	a,l
   794B 93            [ 4] 1353 	sub	a, e
   794C 7C            [ 4] 1354 	ld	a,h
   794D 9A            [ 4] 1355 	sbc	a, d
   794E E2 53 79      [10] 1356 	jp	PO, 00281$
   7951 EE 80         [ 7] 1357 	xor	a, #0x80
   7953                    1358 00281$:
   7953 F2 5C 79      [10] 1359 	jp	P,00141$
   7956                    1360 00140$:
                           1361 ;src/main.c:284: colisiona = 0;
   7956 DD 36 F7 00   [19] 1362 	ld	-9 (ix),#0x00
   795A 18 4B         [12] 1363 	jr	00149$
   795C                    1364 00141$:
                           1365 ;src/main.c:287: if(enemy->y>cu.y){
   795C DD 6E F8      [19] 1366 	ld	l,-8 (ix)
   795F DD 66 F9      [19] 1367 	ld	h,-7 (ix)
   7962 5E            [ 7] 1368 	ld	e,(hl)
   7963 21 DF 69      [10] 1369 	ld	hl, #(_cu + 0x0001) + 0
   7966 6E            [ 7] 1370 	ld	l,(hl)
   7967 7D            [ 4] 1371 	ld	a,l
   7968 93            [ 4] 1372 	sub	a, e
   7969 30 2E         [12] 1373 	jr	NC,00138$
                           1374 ;src/main.c:288: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   796B 16 00         [ 7] 1375 	ld	d,#0x00
   796D 26 00         [ 7] 1376 	ld	h,#0x00
   796F D5            [11] 1377 	push	de
   7970 11 08 00      [10] 1378 	ld	de,#0x0008
   7973 19            [11] 1379 	add	hl, de
   7974 D1            [10] 1380 	pop	de
   7975 7B            [ 4] 1381 	ld	a,e
   7976 95            [ 4] 1382 	sub	a, l
   7977 5F            [ 4] 1383 	ld	e,a
   7978 7A            [ 4] 1384 	ld	a,d
   7979 9C            [ 4] 1385 	sbc	a, h
   797A 57            [ 4] 1386 	ld	d,a
   797B 3E 02         [ 7] 1387 	ld	a,#0x02
   797D BB            [ 4] 1388 	cp	a, e
   797E 3E 00         [ 7] 1389 	ld	a,#0x00
   7980 9A            [ 4] 1390 	sbc	a, d
   7981 E2 86 79      [10] 1391 	jp	PO, 00282$
   7984 EE 80         [ 7] 1392 	xor	a, #0x80
   7986                    1393 00282$:
   7986 F2 8F 79      [10] 1394 	jp	P,00135$
                           1395 ;src/main.c:289: colisiona = 0;
   7989 DD 36 F7 00   [19] 1396 	ld	-9 (ix),#0x00
   798D 18 18         [12] 1397 	jr	00149$
   798F                    1398 00135$:
                           1399 ;src/main.c:292: enemy->muerto = SI;
   798F DD 6E FA      [19] 1400 	ld	l,-6 (ix)
   7992 DD 66 FB      [19] 1401 	ld	h,-5 (ix)
   7995 36 01         [10] 1402 	ld	(hl),#0x01
   7997 18 0E         [12] 1403 	jr	00149$
   7999                    1404 00138$:
                           1405 ;src/main.c:296: colisiona = 0;
   7999 DD 36 F7 00   [19] 1406 	ld	-9 (ix),#0x00
   799D 18 08         [12] 1407 	jr	00149$
   799F                    1408 00145$:
                           1409 ;src/main.c:302: enemy->mira = M_abajo;
   799F DD 6E FC      [19] 1410 	ld	l,-4 (ix)
   79A2 DD 66 FD      [19] 1411 	ld	h,-3 (ix)
   79A5 36 03         [10] 1412 	ld	(hl),#0x03
                           1413 ;src/main.c:305: case 3:
   79A7                    1414 00149$:
                           1415 ;src/main.c:308: if( *getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   79A7 DD 6E F8      [19] 1416 	ld	l,-8 (ix)
   79AA DD 66 F9      [19] 1417 	ld	h,-7 (ix)
   79AD 7E            [ 7] 1418 	ld	a,(hl)
   79AE C6 18         [ 7] 1419 	add	a, #0x18
   79B0 57            [ 4] 1420 	ld	d,a
   79B1 0A            [ 7] 1421 	ld	a,(bc)
   79B2 C5            [11] 1422 	push	bc
   79B3 D5            [11] 1423 	push	de
   79B4 33            [ 6] 1424 	inc	sp
   79B5 F5            [11] 1425 	push	af
   79B6 33            [ 6] 1426 	inc	sp
   79B7 CD 7E 73      [17] 1427 	call	_getTilePtr
   79BA F1            [10] 1428 	pop	af
   79BB C1            [10] 1429 	pop	bc
   79BC 5E            [ 7] 1430 	ld	e,(hl)
   79BD 3E 02         [ 7] 1431 	ld	a,#0x02
   79BF 93            [ 4] 1432 	sub	a, e
   79C0 DA 79 7A      [10] 1433 	jp	C,00161$
                           1434 ;src/main.c:309: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   79C3 DD 6E F8      [19] 1435 	ld	l,-8 (ix)
   79C6 DD 66 F9      [19] 1436 	ld	h,-7 (ix)
   79C9 7E            [ 7] 1437 	ld	a,(hl)
   79CA C6 18         [ 7] 1438 	add	a, #0x18
   79CC 57            [ 4] 1439 	ld	d,a
   79CD 0A            [ 7] 1440 	ld	a,(bc)
   79CE C6 02         [ 7] 1441 	add	a, #0x02
   79D0 C5            [11] 1442 	push	bc
   79D1 D5            [11] 1443 	push	de
   79D2 33            [ 6] 1444 	inc	sp
   79D3 F5            [11] 1445 	push	af
   79D4 33            [ 6] 1446 	inc	sp
   79D5 CD 7E 73      [17] 1447 	call	_getTilePtr
   79D8 F1            [10] 1448 	pop	af
   79D9 C1            [10] 1449 	pop	bc
   79DA 5E            [ 7] 1450 	ld	e,(hl)
   79DB 3E 02         [ 7] 1451 	ld	a,#0x02
   79DD 93            [ 4] 1452 	sub	a, e
   79DE DA 79 7A      [10] 1453 	jp	C,00161$
                           1454 ;src/main.c:310: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   79E1 DD 6E F8      [19] 1455 	ld	l,-8 (ix)
   79E4 DD 66 F9      [19] 1456 	ld	h,-7 (ix)
   79E7 7E            [ 7] 1457 	ld	a,(hl)
   79E8 C6 18         [ 7] 1458 	add	a, #0x18
   79EA 57            [ 4] 1459 	ld	d,a
   79EB 0A            [ 7] 1460 	ld	a,(bc)
   79EC C6 04         [ 7] 1461 	add	a, #0x04
   79EE C5            [11] 1462 	push	bc
   79EF D5            [11] 1463 	push	de
   79F0 33            [ 6] 1464 	inc	sp
   79F1 F5            [11] 1465 	push	af
   79F2 33            [ 6] 1466 	inc	sp
   79F3 CD 7E 73      [17] 1467 	call	_getTilePtr
   79F6 F1            [10] 1468 	pop	af
   79F7 C1            [10] 1469 	pop	bc
   79F8 5E            [ 7] 1470 	ld	e,(hl)
   79F9 3E 02         [ 7] 1471 	ld	a,#0x02
   79FB 93            [ 4] 1472 	sub	a, e
   79FC 38 7B         [12] 1473 	jr	C,00161$
                           1474 ;src/main.c:312: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   79FE 21 DE 69      [10] 1475 	ld	hl, #_cu + 0
   7A01 5E            [ 7] 1476 	ld	e,(hl)
   7A02 16 00         [ 7] 1477 	ld	d,#0x00
   7A04 21 02 00      [10] 1478 	ld	hl,#0x0002
   7A07 19            [11] 1479 	add	hl,de
   7A08 DD 75 FE      [19] 1480 	ld	-2 (ix),l
   7A0B DD 74 FF      [19] 1481 	ld	-1 (ix),h
   7A0E 0A            [ 7] 1482 	ld	a,(bc)
   7A0F 4F            [ 4] 1483 	ld	c,a
   7A10 06 00         [ 7] 1484 	ld	b,#0x00
   7A12 DD 7E FE      [19] 1485 	ld	a,-2 (ix)
   7A15 91            [ 4] 1486 	sub	a, c
   7A16 DD 7E FF      [19] 1487 	ld	a,-1 (ix)
   7A19 98            [ 4] 1488 	sbc	a, b
   7A1A E2 1F 7A      [10] 1489 	jp	PO, 00283$
   7A1D EE 80         [ 7] 1490 	xor	a, #0x80
   7A1F                    1491 00283$:
   7A1F FA 32 7A      [10] 1492 	jp	M,00156$
   7A22 03            [ 6] 1493 	inc	bc
   7A23 03            [ 6] 1494 	inc	bc
   7A24 03            [ 6] 1495 	inc	bc
   7A25 03            [ 6] 1496 	inc	bc
   7A26 79            [ 4] 1497 	ld	a,c
   7A27 93            [ 4] 1498 	sub	a, e
   7A28 78            [ 4] 1499 	ld	a,b
   7A29 9A            [ 4] 1500 	sbc	a, d
   7A2A E2 2F 7A      [10] 1501 	jp	PO, 00284$
   7A2D EE 80         [ 7] 1502 	xor	a, #0x80
   7A2F                    1503 00284$:
   7A2F F2 38 7A      [10] 1504 	jp	P,00157$
   7A32                    1505 00156$:
                           1506 ;src/main.c:313: colisiona = 0;
   7A32 DD 36 F7 00   [19] 1507 	ld	-9 (ix),#0x00
   7A36 18 49         [12] 1508 	jr	00165$
   7A38                    1509 00157$:
                           1510 ;src/main.c:316: if(cu.y > enemy->y){ //si el cu esta abajo
   7A38 21 DF 69      [10] 1511 	ld	hl, #(_cu + 0x0001) + 0
   7A3B 4E            [ 7] 1512 	ld	c,(hl)
   7A3C DD 6E F8      [19] 1513 	ld	l,-8 (ix)
   7A3F DD 66 F9      [19] 1514 	ld	h,-7 (ix)
   7A42 5E            [ 7] 1515 	ld	e,(hl)
   7A43 7B            [ 4] 1516 	ld	a,e
   7A44 91            [ 4] 1517 	sub	a, c
   7A45 30 2C         [12] 1518 	jr	NC,00154$
                           1519 ;src/main.c:317: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   7A47 06 00         [ 7] 1520 	ld	b,#0x00
   7A49 16 00         [ 7] 1521 	ld	d,#0x00
   7A4B 21 16 00      [10] 1522 	ld	hl,#0x0016
   7A4E 19            [11] 1523 	add	hl,de
   7A4F 79            [ 4] 1524 	ld	a,c
   7A50 95            [ 4] 1525 	sub	a, l
   7A51 4F            [ 4] 1526 	ld	c,a
   7A52 78            [ 4] 1527 	ld	a,b
   7A53 9C            [ 4] 1528 	sbc	a, h
   7A54 47            [ 4] 1529 	ld	b,a
   7A55 3E 02         [ 7] 1530 	ld	a,#0x02
   7A57 B9            [ 4] 1531 	cp	a, c
   7A58 3E 00         [ 7] 1532 	ld	a,#0x00
   7A5A 98            [ 4] 1533 	sbc	a, b
   7A5B E2 60 7A      [10] 1534 	jp	PO, 00285$
   7A5E EE 80         [ 7] 1535 	xor	a, #0x80
   7A60                    1536 00285$:
   7A60 F2 69 7A      [10] 1537 	jp	P,00151$
                           1538 ;src/main.c:318: colisiona = 0;
   7A63 DD 36 F7 00   [19] 1539 	ld	-9 (ix),#0x00
   7A67 18 18         [12] 1540 	jr	00165$
   7A69                    1541 00151$:
                           1542 ;src/main.c:321: enemy->muerto = SI;
   7A69 DD 6E FA      [19] 1543 	ld	l,-6 (ix)
   7A6C DD 66 FB      [19] 1544 	ld	h,-5 (ix)
   7A6F 36 01         [10] 1545 	ld	(hl),#0x01
   7A71 18 0E         [12] 1546 	jr	00165$
   7A73                    1547 00154$:
                           1548 ;src/main.c:325: colisiona = 0;
   7A73 DD 36 F7 00   [19] 1549 	ld	-9 (ix),#0x00
   7A77 18 08         [12] 1550 	jr	00165$
   7A79                    1551 00161$:
                           1552 ;src/main.c:329: enemy->mira = M_arriba;
   7A79 DD 6E FC      [19] 1553 	ld	l,-4 (ix)
   7A7C DD 66 FD      [19] 1554 	ld	h,-3 (ix)
   7A7F 36 02         [10] 1555 	ld	(hl),#0x02
                           1556 ;src/main.c:332: }
   7A81                    1557 00165$:
                           1558 ;src/main.c:333: return colisiona;
   7A81 DD 6E F7      [19] 1559 	ld	l,-9 (ix)
   7A84 DD F9         [10] 1560 	ld	sp, ix
   7A86 DD E1         [14] 1561 	pop	ix
   7A88 C9            [10] 1562 	ret
                           1563 ;src/main.c:336: void moverEnemigoArriba(TEnemy *enemy){
                           1564 ;	---------------------------------
                           1565 ; Function moverEnemigoArriba
                           1566 ; ---------------------------------
   7A89                    1567 _moverEnemigoArriba::
   7A89 DD E5         [15] 1568 	push	ix
   7A8B DD 21 00 00   [14] 1569 	ld	ix,#0
   7A8F DD 39         [15] 1570 	add	ix,sp
                           1571 ;src/main.c:337: enemy->y--;
   7A91 DD 4E 04      [19] 1572 	ld	c,4 (ix)
   7A94 DD 46 05      [19] 1573 	ld	b,5 (ix)
   7A97 69            [ 4] 1574 	ld	l, c
   7A98 60            [ 4] 1575 	ld	h, b
   7A99 23            [ 6] 1576 	inc	hl
   7A9A 5E            [ 7] 1577 	ld	e,(hl)
   7A9B 1D            [ 4] 1578 	dec	e
   7A9C 73            [ 7] 1579 	ld	(hl),e
                           1580 ;src/main.c:338: enemy->y--;
   7A9D 1D            [ 4] 1581 	dec	e
   7A9E 73            [ 7] 1582 	ld	(hl),e
                           1583 ;src/main.c:339: enemy->mover = SI;
   7A9F 21 06 00      [10] 1584 	ld	hl,#0x0006
   7AA2 09            [11] 1585 	add	hl,bc
   7AA3 36 01         [10] 1586 	ld	(hl),#0x01
   7AA5 DD E1         [14] 1587 	pop	ix
   7AA7 C9            [10] 1588 	ret
                           1589 ;src/main.c:342: void moverEnemigoAbajo(TEnemy *enemy){
                           1590 ;	---------------------------------
                           1591 ; Function moverEnemigoAbajo
                           1592 ; ---------------------------------
   7AA8                    1593 _moverEnemigoAbajo::
   7AA8 DD E5         [15] 1594 	push	ix
   7AAA DD 21 00 00   [14] 1595 	ld	ix,#0
   7AAE DD 39         [15] 1596 	add	ix,sp
                           1597 ;src/main.c:343: enemy->y++;
   7AB0 DD 4E 04      [19] 1598 	ld	c,4 (ix)
   7AB3 DD 46 05      [19] 1599 	ld	b,5 (ix)
   7AB6 59            [ 4] 1600 	ld	e, c
   7AB7 50            [ 4] 1601 	ld	d, b
   7AB8 13            [ 6] 1602 	inc	de
   7AB9 1A            [ 7] 1603 	ld	a,(de)
   7ABA 3C            [ 4] 1604 	inc	a
   7ABB 12            [ 7] 1605 	ld	(de),a
                           1606 ;src/main.c:344: enemy->y++;
   7ABC 3C            [ 4] 1607 	inc	a
   7ABD 12            [ 7] 1608 	ld	(de),a
                           1609 ;src/main.c:345: enemy->mover = SI;
   7ABE 21 06 00      [10] 1610 	ld	hl,#0x0006
   7AC1 09            [11] 1611 	add	hl,bc
   7AC2 36 01         [10] 1612 	ld	(hl),#0x01
   7AC4 DD E1         [14] 1613 	pop	ix
   7AC6 C9            [10] 1614 	ret
                           1615 ;src/main.c:348: void moverEnemigoDerecha(TEnemy *enemy){
                           1616 ;	---------------------------------
                           1617 ; Function moverEnemigoDerecha
                           1618 ; ---------------------------------
   7AC7                    1619 _moverEnemigoDerecha::
                           1620 ;src/main.c:349: enemy->x++;
   7AC7 D1            [10] 1621 	pop	de
   7AC8 C1            [10] 1622 	pop	bc
   7AC9 C5            [11] 1623 	push	bc
   7ACA D5            [11] 1624 	push	de
   7ACB 0A            [ 7] 1625 	ld	a,(bc)
   7ACC 3C            [ 4] 1626 	inc	a
   7ACD 02            [ 7] 1627 	ld	(bc),a
                           1628 ;src/main.c:350: enemy->x++;
   7ACE 3C            [ 4] 1629 	inc	a
   7ACF 02            [ 7] 1630 	ld	(bc),a
                           1631 ;src/main.c:351: enemy->mover = SI;
   7AD0 21 06 00      [10] 1632 	ld	hl,#0x0006
   7AD3 09            [11] 1633 	add	hl,bc
   7AD4 36 01         [10] 1634 	ld	(hl),#0x01
   7AD6 C9            [10] 1635 	ret
                           1636 ;src/main.c:354: void moverEnemigoIzquierda(TEnemy *enemy){
                           1637 ;	---------------------------------
                           1638 ; Function moverEnemigoIzquierda
                           1639 ; ---------------------------------
   7AD7                    1640 _moverEnemigoIzquierda::
                           1641 ;src/main.c:355: enemy->x--;
   7AD7 D1            [10] 1642 	pop	de
   7AD8 C1            [10] 1643 	pop	bc
   7AD9 C5            [11] 1644 	push	bc
   7ADA D5            [11] 1645 	push	de
   7ADB 0A            [ 7] 1646 	ld	a,(bc)
   7ADC C6 FF         [ 7] 1647 	add	a,#0xFF
   7ADE 02            [ 7] 1648 	ld	(bc),a
                           1649 ;src/main.c:356: enemy->x--;
   7ADF C6 FF         [ 7] 1650 	add	a,#0xFF
   7AE1 02            [ 7] 1651 	ld	(bc),a
                           1652 ;src/main.c:357: enemy->mover = SI;
   7AE2 21 06 00      [10] 1653 	ld	hl,#0x0006
   7AE5 09            [11] 1654 	add	hl,bc
   7AE6 36 01         [10] 1655 	ld	(hl),#0x01
   7AE8 C9            [10] 1656 	ret
                           1657 ;src/main.c:360: void moverEnemigoPathfinding(TEnemy *enemy){
                           1658 ;	---------------------------------
                           1659 ; Function moverEnemigoPathfinding
                           1660 ; ---------------------------------
   7AE9                    1661 _moverEnemigoPathfinding::
   7AE9 DD E5         [15] 1662 	push	ix
   7AEB DD 21 00 00   [14] 1663 	ld	ix,#0
   7AEF DD 39         [15] 1664 	add	ix,sp
   7AF1 21 F3 FF      [10] 1665 	ld	hl,#-13
   7AF4 39            [11] 1666 	add	hl,sp
   7AF5 F9            [ 6] 1667 	ld	sp,hl
                           1668 ;src/main.c:361: if(!enemy->muerto){
   7AF6 DD 4E 04      [19] 1669 	ld	c,4 (ix)
   7AF9 DD 46 05      [19] 1670 	ld	b,5 (ix)
   7AFC C5            [11] 1671 	push	bc
   7AFD FD E1         [14] 1672 	pop	iy
   7AFF FD 7E 08      [19] 1673 	ld	a,8 (iy)
   7B02 B7            [ 4] 1674 	or	a, a
   7B03 C2 0F 7C      [10] 1675 	jp	NZ,00112$
                           1676 ;src/main.c:363: if (!enemy->reversePatrol) {
   7B06 21 0D 00      [10] 1677 	ld	hl,#0x000D
   7B09 09            [11] 1678 	add	hl,bc
   7B0A E3            [19] 1679 	ex	(sp), hl
   7B0B E1            [10] 1680 	pop	hl
   7B0C E5            [11] 1681 	push	hl
   7B0D 7E            [ 7] 1682 	ld	a,(hl)
   7B0E DD 77 FF      [19] 1683 	ld	-1 (ix),a
                           1684 ;src/main.c:364: if(enemy->iter < enemy->longitud_camino - 8){
   7B11 21 0F 00      [10] 1685 	ld	hl,#0x000F
   7B14 09            [11] 1686 	add	hl,bc
   7B15 EB            [ 4] 1687 	ex	de,hl
                           1688 ;src/main.c:365: enemy->x = enemy->camino[enemy->iter];
   7B16 21 17 00      [10] 1689 	ld	hl,#0x0017
   7B19 09            [11] 1690 	add	hl,bc
   7B1A DD 75 FD      [19] 1691 	ld	-3 (ix),l
   7B1D DD 74 FE      [19] 1692 	ld	-2 (ix),h
                           1693 ;src/main.c:367: enemy->y = enemy->camino[enemy->iter];
   7B20 21 01 00      [10] 1694 	ld	hl,#0x0001
   7B23 09            [11] 1695 	add	hl,bc
   7B24 DD 75 FB      [19] 1696 	ld	-5 (ix),l
   7B27 DD 74 FC      [19] 1697 	ld	-4 (ix),h
                           1698 ;src/main.c:369: enemy->mover = SI;
   7B2A 21 06 00      [10] 1699 	ld	hl,#0x0006
   7B2D 09            [11] 1700 	add	hl,bc
   7B2E DD 75 F9      [19] 1701 	ld	-7 (ix),l
   7B31 DD 74 FA      [19] 1702 	ld	-6 (ix),h
                           1703 ;src/main.c:372: enemy->lastIter = enemy->iter - 1;
   7B34 21 10 00      [10] 1704 	ld	hl,#0x0010
   7B37 09            [11] 1705 	add	hl,bc
   7B38 DD 75 F7      [19] 1706 	ld	-9 (ix),l
   7B3B DD 74 F8      [19] 1707 	ld	-8 (ix),h
                           1708 ;src/main.c:363: if (!enemy->reversePatrol) {
   7B3E DD 7E FF      [19] 1709 	ld	a,-1 (ix)
   7B41 B7            [ 4] 1710 	or	a, a
   7B42 20 78         [12] 1711 	jr	NZ,00108$
                           1712 ;src/main.c:364: if(enemy->iter < enemy->longitud_camino - 8){
   7B44 1A            [ 7] 1713 	ld	a,(de)
   7B45 DD 77 FF      [19] 1714 	ld	-1 (ix),a
   7B48 69            [ 4] 1715 	ld	l, c
   7B49 60            [ 4] 1716 	ld	h, b
   7B4A C5            [11] 1717 	push	bc
   7B4B 01 43 01      [10] 1718 	ld	bc, #0x0143
   7B4E 09            [11] 1719 	add	hl, bc
   7B4F C1            [10] 1720 	pop	bc
   7B50 6E            [ 7] 1721 	ld	l,(hl)
   7B51 26 00         [ 7] 1722 	ld	h,#0x00
   7B53 7D            [ 4] 1723 	ld	a,l
   7B54 C6 F8         [ 7] 1724 	add	a,#0xF8
   7B56 DD 77 F5      [19] 1725 	ld	-11 (ix),a
   7B59 7C            [ 4] 1726 	ld	a,h
   7B5A CE FF         [ 7] 1727 	adc	a,#0xFF
   7B5C DD 77 F6      [19] 1728 	ld	-10 (ix),a
   7B5F DD 7E FF      [19] 1729 	ld	a, -1 (ix)
   7B62 26 00         [ 7] 1730 	ld	h, #0x00
   7B64 DD 96 F5      [19] 1731 	sub	a, -11 (ix)
   7B67 7C            [ 4] 1732 	ld	a,h
   7B68 DD 9E F6      [19] 1733 	sbc	a, -10 (ix)
   7B6B E2 70 7B      [10] 1734 	jp	PO, 00130$
   7B6E EE 80         [ 7] 1735 	xor	a, #0x80
   7B70                    1736 00130$:
   7B70 F2 AB 7B      [10] 1737 	jp	P,00102$
                           1738 ;src/main.c:365: enemy->x = enemy->camino[enemy->iter];
   7B73 DD 6E FF      [19] 1739 	ld	l,-1 (ix)
   7B76 26 00         [ 7] 1740 	ld	h,#0x00
   7B78 DD 7E FD      [19] 1741 	ld	a,-3 (ix)
   7B7B 85            [ 4] 1742 	add	a, l
   7B7C 6F            [ 4] 1743 	ld	l,a
   7B7D DD 7E FE      [19] 1744 	ld	a,-2 (ix)
   7B80 8C            [ 4] 1745 	adc	a, h
   7B81 67            [ 4] 1746 	ld	h,a
   7B82 7E            [ 7] 1747 	ld	a,(hl)
   7B83 02            [ 7] 1748 	ld	(bc),a
                           1749 ;src/main.c:366: enemy->iter++;
   7B84 1A            [ 7] 1750 	ld	a,(de)
   7B85 4F            [ 4] 1751 	ld	c,a
   7B86 0C            [ 4] 1752 	inc	c
   7B87 79            [ 4] 1753 	ld	a,c
   7B88 12            [ 7] 1754 	ld	(de),a
                           1755 ;src/main.c:367: enemy->y = enemy->camino[enemy->iter];
   7B89 69            [ 4] 1756 	ld	l,c
   7B8A 26 00         [ 7] 1757 	ld	h,#0x00
   7B8C DD 7E FD      [19] 1758 	ld	a,-3 (ix)
   7B8F 85            [ 4] 1759 	add	a, l
   7B90 6F            [ 4] 1760 	ld	l,a
   7B91 DD 7E FE      [19] 1761 	ld	a,-2 (ix)
   7B94 8C            [ 4] 1762 	adc	a, h
   7B95 67            [ 4] 1763 	ld	h,a
   7B96 46            [ 7] 1764 	ld	b,(hl)
   7B97 DD 6E FB      [19] 1765 	ld	l,-5 (ix)
   7B9A DD 66 FC      [19] 1766 	ld	h,-4 (ix)
   7B9D 70            [ 7] 1767 	ld	(hl),b
                           1768 ;src/main.c:368: enemy->iter++;
   7B9E 0C            [ 4] 1769 	inc	c
   7B9F 79            [ 4] 1770 	ld	a,c
   7BA0 12            [ 7] 1771 	ld	(de),a
                           1772 ;src/main.c:369: enemy->mover = SI;
   7BA1 DD 6E F9      [19] 1773 	ld	l,-7 (ix)
   7BA4 DD 66 FA      [19] 1774 	ld	h,-6 (ix)
   7BA7 36 01         [10] 1775 	ld	(hl),#0x01
   7BA9 18 64         [12] 1776 	jr	00112$
   7BAB                    1777 00102$:
                           1778 ;src/main.c:372: enemy->lastIter = enemy->iter - 1;
   7BAB DD 4E FF      [19] 1779 	ld	c,-1 (ix)
   7BAE 0D            [ 4] 1780 	dec	c
   7BAF DD 6E F7      [19] 1781 	ld	l,-9 (ix)
   7BB2 DD 66 F8      [19] 1782 	ld	h,-8 (ix)
   7BB5 71            [ 7] 1783 	ld	(hl),c
                           1784 ;src/main.c:375: enemy->reversePatrol = 1;
   7BB6 E1            [10] 1785 	pop	hl
   7BB7 E5            [11] 1786 	push	hl
   7BB8 36 01         [10] 1787 	ld	(hl),#0x01
   7BBA 18 53         [12] 1788 	jr	00112$
   7BBC                    1789 00108$:
                           1790 ;src/main.c:378: if(enemy->lastIter > 1){
   7BBC DD 6E F7      [19] 1791 	ld	l,-9 (ix)
   7BBF DD 66 F8      [19] 1792 	ld	h,-8 (ix)
   7BC2 6E            [ 7] 1793 	ld	l,(hl)
   7BC3 3E 01         [ 7] 1794 	ld	a,#0x01
   7BC5 95            [ 4] 1795 	sub	a, l
   7BC6 30 41         [12] 1796 	jr	NC,00105$
                           1797 ;src/main.c:379: enemy->y = enemy->camino[enemy->lastIter];
   7BC8 26 00         [ 7] 1798 	ld	h,#0x00
   7BCA DD 5E FD      [19] 1799 	ld	e,-3 (ix)
   7BCD DD 56 FE      [19] 1800 	ld	d,-2 (ix)
   7BD0 19            [11] 1801 	add	hl,de
   7BD1 5E            [ 7] 1802 	ld	e,(hl)
   7BD2 DD 6E FB      [19] 1803 	ld	l,-5 (ix)
   7BD5 DD 66 FC      [19] 1804 	ld	h,-4 (ix)
   7BD8 73            [ 7] 1805 	ld	(hl),e
                           1806 ;src/main.c:380: enemy->lastIter--;
   7BD9 DD 6E F7      [19] 1807 	ld	l,-9 (ix)
   7BDC DD 66 F8      [19] 1808 	ld	h,-8 (ix)
   7BDF 5E            [ 7] 1809 	ld	e,(hl)
   7BE0 1D            [ 4] 1810 	dec	e
   7BE1 DD 6E F7      [19] 1811 	ld	l,-9 (ix)
   7BE4 DD 66 F8      [19] 1812 	ld	h,-8 (ix)
   7BE7 73            [ 7] 1813 	ld	(hl),e
                           1814 ;src/main.c:381: enemy->x = enemy->camino[enemy->lastIter];
   7BE8 6B            [ 4] 1815 	ld	l,e
   7BE9 26 00         [ 7] 1816 	ld	h,#0x00
   7BEB DD 7E FD      [19] 1817 	ld	a,-3 (ix)
   7BEE 85            [ 4] 1818 	add	a, l
   7BEF 6F            [ 4] 1819 	ld	l,a
   7BF0 DD 7E FE      [19] 1820 	ld	a,-2 (ix)
   7BF3 8C            [ 4] 1821 	adc	a, h
   7BF4 67            [ 4] 1822 	ld	h,a
   7BF5 7E            [ 7] 1823 	ld	a,(hl)
   7BF6 02            [ 7] 1824 	ld	(bc),a
                           1825 ;src/main.c:382: enemy->lastIter--;
   7BF7 1D            [ 4] 1826 	dec	e
   7BF8 DD 6E F7      [19] 1827 	ld	l,-9 (ix)
   7BFB DD 66 F8      [19] 1828 	ld	h,-8 (ix)
   7BFE 73            [ 7] 1829 	ld	(hl),e
                           1830 ;src/main.c:383: enemy->mover = SI;
   7BFF DD 6E F9      [19] 1831 	ld	l,-7 (ix)
   7C02 DD 66 FA      [19] 1832 	ld	h,-6 (ix)
   7C05 36 01         [10] 1833 	ld	(hl),#0x01
   7C07 18 06         [12] 1834 	jr	00112$
   7C09                    1835 00105$:
                           1836 ;src/main.c:386: enemy->iter = 0;
   7C09 AF            [ 4] 1837 	xor	a, a
   7C0A 12            [ 7] 1838 	ld	(de),a
                           1839 ;src/main.c:388: enemy->reversePatrol = 0;
   7C0B E1            [10] 1840 	pop	hl
   7C0C E5            [11] 1841 	push	hl
   7C0D 36 00         [10] 1842 	ld	(hl),#0x00
   7C0F                    1843 00112$:
   7C0F DD F9         [10] 1844 	ld	sp, ix
   7C11 DD E1         [14] 1845 	pop	ix
   7C13 C9            [10] 1846 	ret
                           1847 ;src/main.c:395: void moverEnemigo(TEnemy *enemy){
                           1848 ;	---------------------------------
                           1849 ; Function moverEnemigo
                           1850 ; ---------------------------------
   7C14                    1851 _moverEnemigo::
   7C14 DD E5         [15] 1852 	push	ix
   7C16 DD 21 00 00   [14] 1853 	ld	ix,#0
   7C1A DD 39         [15] 1854 	add	ix,sp
                           1855 ;src/main.c:396: if(!enemy->muerto){
   7C1C DD 4E 04      [19] 1856 	ld	c,4 (ix)
   7C1F DD 46 05      [19] 1857 	ld	b,5 (ix)
   7C22 C5            [11] 1858 	push	bc
   7C23 FD E1         [14] 1859 	pop	iy
   7C25 FD 7E 08      [19] 1860 	ld	a,8 (iy)
   7C28 B7            [ 4] 1861 	or	a, a
   7C29 20 46         [12] 1862 	jr	NZ,00110$
                           1863 ;src/main.c:397: if(!checkEnemyCollision(enemy->mira, enemy)){
   7C2B 21 07 00      [10] 1864 	ld	hl,#0x0007
   7C2E 09            [11] 1865 	add	hl,bc
   7C2F 5E            [ 7] 1866 	ld	e,(hl)
   7C30 16 00         [ 7] 1867 	ld	d,#0x00
   7C32 E5            [11] 1868 	push	hl
   7C33 C5            [11] 1869 	push	bc
   7C34 C5            [11] 1870 	push	bc
   7C35 D5            [11] 1871 	push	de
   7C36 CD B9 76      [17] 1872 	call	_checkEnemyCollision
   7C39 F1            [10] 1873 	pop	af
   7C3A F1            [10] 1874 	pop	af
   7C3B 7D            [ 4] 1875 	ld	a,l
   7C3C C1            [10] 1876 	pop	bc
   7C3D E1            [10] 1877 	pop	hl
   7C3E B7            [ 4] 1878 	or	a, a
   7C3F 20 30         [12] 1879 	jr	NZ,00110$
                           1880 ;src/main.c:399: switch (enemy->mira) {
   7C41 5E            [ 7] 1881 	ld	e,(hl)
   7C42 3E 03         [ 7] 1882 	ld	a,#0x03
   7C44 93            [ 4] 1883 	sub	a, e
   7C45 38 2A         [12] 1884 	jr	C,00110$
   7C47 16 00         [ 7] 1885 	ld	d,#0x00
   7C49 21 4F 7C      [10] 1886 	ld	hl,#00124$
   7C4C 19            [11] 1887 	add	hl,de
   7C4D 19            [11] 1888 	add	hl,de
                           1889 ;src/main.c:401: case 0:
   7C4E E9            [ 4] 1890 	jp	(hl)
   7C4F                    1891 00124$:
   7C4F 18 06         [12] 1892 	jr	00101$
   7C51 18 0B         [12] 1893 	jr	00102$
   7C53 18 10         [12] 1894 	jr	00103$
   7C55 18 15         [12] 1895 	jr	00104$
   7C57                    1896 00101$:
                           1897 ;src/main.c:402: moverEnemigoDerecha(enemy);
   7C57 C5            [11] 1898 	push	bc
   7C58 CD C7 7A      [17] 1899 	call	_moverEnemigoDerecha
   7C5B F1            [10] 1900 	pop	af
                           1901 ;src/main.c:403: break;
   7C5C 18 13         [12] 1902 	jr	00110$
                           1903 ;src/main.c:404: case 1:
   7C5E                    1904 00102$:
                           1905 ;src/main.c:405: moverEnemigoIzquierda(enemy);
   7C5E C5            [11] 1906 	push	bc
   7C5F CD D7 7A      [17] 1907 	call	_moverEnemigoIzquierda
   7C62 F1            [10] 1908 	pop	af
                           1909 ;src/main.c:406: break;
   7C63 18 0C         [12] 1910 	jr	00110$
                           1911 ;src/main.c:407: case 2:
   7C65                    1912 00103$:
                           1913 ;src/main.c:408: moverEnemigoArriba(enemy);
   7C65 C5            [11] 1914 	push	bc
   7C66 CD 89 7A      [17] 1915 	call	_moverEnemigoArriba
   7C69 F1            [10] 1916 	pop	af
                           1917 ;src/main.c:409: break;
   7C6A 18 05         [12] 1918 	jr	00110$
                           1919 ;src/main.c:410: case 3:
   7C6C                    1920 00104$:
                           1921 ;src/main.c:411: moverEnemigoAbajo(enemy);
   7C6C C5            [11] 1922 	push	bc
   7C6D CD A8 7A      [17] 1923 	call	_moverEnemigoAbajo
   7C70 F1            [10] 1924 	pop	af
                           1925 ;src/main.c:413: }
   7C71                    1926 00110$:
   7C71 DD E1         [14] 1927 	pop	ix
   7C73 C9            [10] 1928 	ret
                           1929 ;src/main.c:418: void lookFor(TEnemy* enemy){
                           1930 ;	---------------------------------
                           1931 ; Function lookFor
                           1932 ; ---------------------------------
   7C74                    1933 _lookFor::
   7C74 DD E5         [15] 1934 	push	ix
   7C76 DD 21 00 00   [14] 1935 	ld	ix,#0
   7C7A DD 39         [15] 1936 	add	ix,sp
   7C7C 21 F6 FF      [10] 1937 	ld	hl,#-10
   7C7F 39            [11] 1938 	add	hl,sp
   7C80 F9            [ 6] 1939 	ld	sp,hl
                           1940 ;src/main.c:421: u8 interpone = NO;
   7C81 0E 00         [ 7] 1941 	ld	c,#0x00
                           1942 ;src/main.c:425: u8 difx = abs(enemy->x - prota.x);
   7C83 DD 7E 04      [19] 1943 	ld	a,4 (ix)
   7C86 DD 77 FA      [19] 1944 	ld	-6 (ix),a
   7C89 DD 7E 05      [19] 1945 	ld	a,5 (ix)
   7C8C DD 77 FB      [19] 1946 	ld	-5 (ix),a
   7C8F DD 6E FA      [19] 1947 	ld	l,-6 (ix)
   7C92 DD 66 FB      [19] 1948 	ld	h,-5 (ix)
   7C95 46            [ 7] 1949 	ld	b,(hl)
   7C96 16 00         [ 7] 1950 	ld	d,#0x00
   7C98 21 D6 69      [10] 1951 	ld	hl,#_prota+0
   7C9B 6E            [ 7] 1952 	ld	l,(hl)
   7C9C 26 00         [ 7] 1953 	ld	h,#0x00
   7C9E 78            [ 4] 1954 	ld	a,b
   7C9F 95            [ 4] 1955 	sub	a, l
   7CA0 5F            [ 4] 1956 	ld	e,a
   7CA1 7A            [ 4] 1957 	ld	a,d
   7CA2 9C            [ 4] 1958 	sbc	a, h
   7CA3 57            [ 4] 1959 	ld	d,a
   7CA4 C5            [11] 1960 	push	bc
   7CA5 D5            [11] 1961 	push	de
   7CA6 CD E2 4B      [17] 1962 	call	_abs
   7CA9 F1            [10] 1963 	pop	af
   7CAA C1            [10] 1964 	pop	bc
   7CAB 45            [ 4] 1965 	ld	b,l
                           1966 ;src/main.c:426: u8 dify = abs(enemy->y - prota.y);
   7CAC DD 7E FA      [19] 1967 	ld	a,-6 (ix)
   7CAF C6 01         [ 7] 1968 	add	a, #0x01
   7CB1 DD 77 F8      [19] 1969 	ld	-8 (ix),a
   7CB4 DD 7E FB      [19] 1970 	ld	a,-5 (ix)
   7CB7 CE 00         [ 7] 1971 	adc	a, #0x00
   7CB9 DD 77 F9      [19] 1972 	ld	-7 (ix),a
   7CBC DD 6E F8      [19] 1973 	ld	l,-8 (ix)
   7CBF DD 66 F9      [19] 1974 	ld	h,-7 (ix)
   7CC2 5E            [ 7] 1975 	ld	e,(hl)
   7CC3 16 00         [ 7] 1976 	ld	d,#0x00
   7CC5 21 D7 69      [10] 1977 	ld	hl, #(_prota + 0x0001) + 0
   7CC8 6E            [ 7] 1978 	ld	l,(hl)
   7CC9 26 00         [ 7] 1979 	ld	h,#0x00
   7CCB 7B            [ 4] 1980 	ld	a,e
   7CCC 95            [ 4] 1981 	sub	a, l
   7CCD 5F            [ 4] 1982 	ld	e,a
   7CCE 7A            [ 4] 1983 	ld	a,d
   7CCF 9C            [ 4] 1984 	sbc	a, h
   7CD0 57            [ 4] 1985 	ld	d,a
   7CD1 C5            [11] 1986 	push	bc
   7CD2 D5            [11] 1987 	push	de
   7CD3 CD E2 4B      [17] 1988 	call	_abs
   7CD6 F1            [10] 1989 	pop	af
   7CD7 C1            [10] 1990 	pop	bc
                           1991 ;src/main.c:427: dist = difx + dify; // manhattan
   7CD8 78            [ 4] 1992 	ld	a,b
   7CD9 85            [ 4] 1993 	add	a, l
   7CDA 47            [ 4] 1994 	ld	b,a
                           1995 ;src/main.c:429: enemy->seen = NO;
   7CDB DD 7E FA      [19] 1996 	ld	a,-6 (ix)
   7CDE C6 12         [ 7] 1997 	add	a, #0x12
   7CE0 DD 77 F6      [19] 1998 	ld	-10 (ix),a
   7CE3 DD 7E FB      [19] 1999 	ld	a,-5 (ix)
   7CE6 CE 00         [ 7] 2000 	adc	a, #0x00
   7CE8 DD 77 F7      [19] 2001 	ld	-9 (ix),a
   7CEB E1            [10] 2002 	pop	hl
   7CEC E5            [11] 2003 	push	hl
   7CED 36 00         [10] 2004 	ld	(hl),#0x00
                           2005 ;src/main.c:430: enemy->inRange = NO;
   7CEF DD 7E FA      [19] 2006 	ld	a,-6 (ix)
   7CF2 C6 11         [ 7] 2007 	add	a, #0x11
   7CF4 DD 77 FE      [19] 2008 	ld	-2 (ix),a
   7CF7 DD 7E FB      [19] 2009 	ld	a,-5 (ix)
   7CFA CE 00         [ 7] 2010 	adc	a, #0x00
   7CFC DD 77 FF      [19] 2011 	ld	-1 (ix),a
   7CFF DD 6E FE      [19] 2012 	ld	l,-2 (ix)
   7D02 DD 66 FF      [19] 2013 	ld	h,-1 (ix)
   7D05 36 00         [10] 2014 	ld	(hl),#0x00
                           2015 ;src/main.c:432: if (dist <= 10) {// te detectan los sensores de proximidad
   7D07 3E 0A         [ 7] 2016 	ld	a,#0x0A
   7D09 90            [ 4] 2017 	sub	a, b
   7D0A 38 0F         [12] 2018 	jr	C,00123$
                           2019 ;src/main.c:433: enemy->seen = 1;
   7D0C E1            [10] 2020 	pop	hl
   7D0D E5            [11] 2021 	push	hl
   7D0E 36 01         [10] 2022 	ld	(hl),#0x01
                           2023 ;src/main.c:434: enemy->inRange = 1;
   7D10 DD 6E FE      [19] 2024 	ld	l,-2 (ix)
   7D13 DD 66 FF      [19] 2025 	ld	h,-1 (ix)
   7D16 36 01         [10] 2026 	ld	(hl),#0x01
   7D18 C3 12 7E      [10] 2027 	jp	00133$
   7D1B                    2028 00123$:
                           2029 ;src/main.c:435: } else if(enemy->x > prota.x - 50 && enemy->x < prota.x + 50  ){
   7D1B DD 6E FA      [19] 2030 	ld	l,-6 (ix)
   7D1E DD 66 FB      [19] 2031 	ld	h,-5 (ix)
   7D21 7E            [ 7] 2032 	ld	a,(hl)
   7D22 DD 77 FE      [19] 2033 	ld	-2 (ix),a
   7D25 21 D6 69      [10] 2034 	ld	hl, #_prota + 0
   7D28 46            [ 7] 2035 	ld	b,(hl)
   7D29 58            [ 4] 2036 	ld	e,b
   7D2A 16 00         [ 7] 2037 	ld	d,#0x00
   7D2C 7B            [ 4] 2038 	ld	a,e
   7D2D C6 CE         [ 7] 2039 	add	a,#0xCE
   7D2F DD 77 FC      [19] 2040 	ld	-4 (ix),a
   7D32 7A            [ 4] 2041 	ld	a,d
   7D33 CE FF         [ 7] 2042 	adc	a,#0xFF
   7D35 DD 77 FD      [19] 2043 	ld	-3 (ix),a
   7D38 DD 6E FE      [19] 2044 	ld	l,-2 (ix)
   7D3B 26 00         [ 7] 2045 	ld	h,#0x00
   7D3D DD 7E FC      [19] 2046 	ld	a,-4 (ix)
   7D40 95            [ 4] 2047 	sub	a, l
   7D41 DD 7E FD      [19] 2048 	ld	a,-3 (ix)
   7D44 9C            [ 4] 2049 	sbc	a, h
   7D45 E2 4A 7D      [10] 2050 	jp	PO, 00205$
   7D48 EE 80         [ 7] 2051 	xor	a, #0x80
   7D4A                    2052 00205$:
   7D4A F2 12 7E      [10] 2053 	jp	P,00133$
   7D4D 7B            [ 4] 2054 	ld	a,e
   7D4E C6 32         [ 7] 2055 	add	a, #0x32
   7D50 5F            [ 4] 2056 	ld	e,a
   7D51 7A            [ 4] 2057 	ld	a,d
   7D52 CE 00         [ 7] 2058 	adc	a, #0x00
   7D54 57            [ 4] 2059 	ld	d,a
   7D55 7D            [ 4] 2060 	ld	a,l
   7D56 93            [ 4] 2061 	sub	a, e
   7D57 7C            [ 4] 2062 	ld	a,h
   7D58 9A            [ 4] 2063 	sbc	a, d
   7D59 E2 5E 7D      [10] 2064 	jp	PO, 00206$
   7D5C EE 80         [ 7] 2065 	xor	a, #0x80
   7D5E                    2066 00206$:
   7D5E F2 12 7E      [10] 2067 	jp	P,00133$
                           2068 ;src/main.c:436: if(enemy->y > prota.y - 4 && enemy->y < prota.y + 4){
   7D61 DD 6E F8      [19] 2069 	ld	l,-8 (ix)
   7D64 DD 66 F9      [19] 2070 	ld	h,-7 (ix)
   7D67 5E            [ 7] 2071 	ld	e,(hl)
   7D68 21 D7 69      [10] 2072 	ld	hl, #(_prota + 0x0001) + 0
   7D6B 6E            [ 7] 2073 	ld	l,(hl)
   7D6C 26 00         [ 7] 2074 	ld	h,#0x00
   7D6E 7D            [ 4] 2075 	ld	a,l
   7D6F C6 FC         [ 7] 2076 	add	a,#0xFC
   7D71 DD 77 FC      [19] 2077 	ld	-4 (ix),a
   7D74 7C            [ 4] 2078 	ld	a,h
   7D75 CE FF         [ 7] 2079 	adc	a,#0xFF
   7D77 DD 77 FD      [19] 2080 	ld	-3 (ix),a
   7D7A 16 00         [ 7] 2081 	ld	d,#0x00
   7D7C DD 7E FC      [19] 2082 	ld	a,-4 (ix)
   7D7F 93            [ 4] 2083 	sub	a, e
   7D80 DD 7E FD      [19] 2084 	ld	a,-3 (ix)
   7D83 9A            [ 4] 2085 	sbc	a, d
   7D84 E2 89 7D      [10] 2086 	jp	PO, 00207$
   7D87 EE 80         [ 7] 2087 	xor	a, #0x80
   7D89                    2088 00207$:
   7D89 F2 12 7E      [10] 2089 	jp	P,00133$
   7D8C 23            [ 6] 2090 	inc	hl
   7D8D 23            [ 6] 2091 	inc	hl
   7D8E 23            [ 6] 2092 	inc	hl
   7D8F 23            [ 6] 2093 	inc	hl
   7D90 7B            [ 4] 2094 	ld	a,e
   7D91 95            [ 4] 2095 	sub	a, l
   7D92 7A            [ 4] 2096 	ld	a,d
   7D93 9C            [ 4] 2097 	sbc	a, h
   7D94 E2 99 7D      [10] 2098 	jp	PO, 00208$
   7D97 EE 80         [ 7] 2099 	xor	a, #0x80
   7D99                    2100 00208$:
   7D99 F2 12 7E      [10] 2101 	jp	P,00133$
                           2102 ;src/main.c:437: if(enemy->x > prota.x){
   7D9C 78            [ 4] 2103 	ld	a,b
   7D9D DD 96 FE      [19] 2104 	sub	a, -2 (ix)
   7DA0 3E 00         [ 7] 2105 	ld	a,#0x00
   7DA2 17            [ 4] 2106 	rla
   7DA3 B7            [ 4] 2107 	or	a, a
   7DA4 28 36         [12] 2108 	jr	Z,00114$
                           2109 ;src/main.c:438: i = prota.x;
   7DA6 58            [ 4] 2110 	ld	e,b
                           2111 ;src/main.c:439: for (i; i<enemy->x && !interpone; i++){
   7DA7                    2112 00127$:
   7DA7 DD 6E FA      [19] 2113 	ld	l,-6 (ix)
   7DAA DD 66 FB      [19] 2114 	ld	h,-5 (ix)
   7DAD 46            [ 7] 2115 	ld	b,(hl)
   7DAE 7B            [ 4] 2116 	ld	a,e
   7DAF 90            [ 4] 2117 	sub	a, b
   7DB0 30 20         [12] 2118 	jr	NC,00103$
   7DB2 79            [ 4] 2119 	ld	a,c
   7DB3 B7            [ 4] 2120 	or	a, a
   7DB4 20 1C         [12] 2121 	jr	NZ,00103$
                           2122 ;src/main.c:440: if(*getTilePtr(i , prota.y) > 2){
   7DB6 21 D7 69      [10] 2123 	ld	hl, #(_prota + 0x0001) + 0
   7DB9 46            [ 7] 2124 	ld	b,(hl)
   7DBA C5            [11] 2125 	push	bc
   7DBB D5            [11] 2126 	push	de
   7DBC C5            [11] 2127 	push	bc
   7DBD 33            [ 6] 2128 	inc	sp
   7DBE 7B            [ 4] 2129 	ld	a,e
   7DBF F5            [11] 2130 	push	af
   7DC0 33            [ 6] 2131 	inc	sp
   7DC1 CD 7E 73      [17] 2132 	call	_getTilePtr
   7DC4 F1            [10] 2133 	pop	af
   7DC5 D1            [10] 2134 	pop	de
   7DC6 C1            [10] 2135 	pop	bc
   7DC7 46            [ 7] 2136 	ld	b,(hl)
   7DC8 3E 02         [ 7] 2137 	ld	a,#0x02
   7DCA 90            [ 4] 2138 	sub	a, b
   7DCB 30 02         [12] 2139 	jr	NC,00128$
                           2140 ;src/main.c:441: interpone = SI;
   7DCD 0E 01         [ 7] 2141 	ld	c,#0x01
   7DCF                    2142 00128$:
                           2143 ;src/main.c:439: for (i; i<enemy->x && !interpone; i++){
   7DCF 1C            [ 4] 2144 	inc	e
   7DD0 18 D5         [12] 2145 	jr	00127$
   7DD2                    2146 00103$:
                           2147 ;src/main.c:444: if(!interpone){
   7DD2 79            [ 4] 2148 	ld	a,c
   7DD3 B7            [ 4] 2149 	or	a, a
   7DD4 20 3C         [12] 2150 	jr	NZ,00133$
                           2151 ;src/main.c:445: enemy->seen = SI;
   7DD6 E1            [10] 2152 	pop	hl
   7DD7 E5            [11] 2153 	push	hl
   7DD8 36 01         [10] 2154 	ld	(hl),#0x01
   7DDA 18 36         [12] 2155 	jr	00133$
   7DDC                    2156 00114$:
                           2157 ;src/main.c:447: }else if(enemy->x > prota.x){
   7DDC B7            [ 4] 2158 	or	a, a
   7DDD 28 33         [12] 2159 	jr	Z,00133$
                           2160 ;src/main.c:448: i = enemy->x;
   7DDF DD 46 FE      [19] 2161 	ld	b,-2 (ix)
                           2162 ;src/main.c:449: for (i; i<prota.x && !interpone; i++){
   7DE2                    2163 00131$:
   7DE2 21 D6 69      [10] 2164 	ld	hl, #_prota + 0
   7DE5 5E            [ 7] 2165 	ld	e,(hl)
   7DE6 78            [ 4] 2166 	ld	a,b
   7DE7 93            [ 4] 2167 	sub	a, e
   7DE8 30 20         [12] 2168 	jr	NC,00108$
   7DEA 79            [ 4] 2169 	ld	a,c
   7DEB B7            [ 4] 2170 	or	a, a
   7DEC 20 1C         [12] 2171 	jr	NZ,00108$
                           2172 ;src/main.c:450: if(*getTilePtr(i, enemy->y) > 2){
   7DEE DD 6E F8      [19] 2173 	ld	l,-8 (ix)
   7DF1 DD 66 F9      [19] 2174 	ld	h,-7 (ix)
   7DF4 56            [ 7] 2175 	ld	d,(hl)
   7DF5 C5            [11] 2176 	push	bc
   7DF6 D5            [11] 2177 	push	de
   7DF7 33            [ 6] 2178 	inc	sp
   7DF8 C5            [11] 2179 	push	bc
   7DF9 33            [ 6] 2180 	inc	sp
   7DFA CD 7E 73      [17] 2181 	call	_getTilePtr
   7DFD F1            [10] 2182 	pop	af
   7DFE C1            [10] 2183 	pop	bc
   7DFF 5E            [ 7] 2184 	ld	e,(hl)
   7E00 3E 02         [ 7] 2185 	ld	a,#0x02
   7E02 93            [ 4] 2186 	sub	a, e
   7E03 30 02         [12] 2187 	jr	NC,00132$
                           2188 ;src/main.c:451: interpone = SI;
   7E05 0E 01         [ 7] 2189 	ld	c,#0x01
   7E07                    2190 00132$:
                           2191 ;src/main.c:449: for (i; i<prota.x && !interpone; i++){
   7E07 04            [ 4] 2192 	inc	b
   7E08 18 D8         [12] 2193 	jr	00131$
   7E0A                    2194 00108$:
                           2195 ;src/main.c:454: if(!interpone){
   7E0A 79            [ 4] 2196 	ld	a,c
   7E0B B7            [ 4] 2197 	or	a, a
   7E0C 20 04         [12] 2198 	jr	NZ,00133$
                           2199 ;src/main.c:455: enemy->seen = SI;
   7E0E E1            [10] 2200 	pop	hl
   7E0F E5            [11] 2201 	push	hl
   7E10 36 01         [10] 2202 	ld	(hl),#0x01
   7E12                    2203 00133$:
   7E12 DD F9         [10] 2204 	ld	sp, ix
   7E14 DD E1         [14] 2205 	pop	ix
   7E16 C9            [10] 2206 	ret
                           2207 ;src/main.c:462: void patrol(TEnemy *enemy) {
                           2208 ;	---------------------------------
                           2209 ; Function patrol
                           2210 ; ---------------------------------
   7E17                    2211 _patrol::
                           2212 ;src/main.c:463: if (enemy->onPathPatrol) {
   7E17 D1            [10] 2213 	pop	de
   7E18 C1            [10] 2214 	pop	bc
   7E19 C5            [11] 2215 	push	bc
   7E1A D5            [11] 2216 	push	de
   7E1B C5            [11] 2217 	push	bc
   7E1C FD E1         [14] 2218 	pop	iy
   7E1E FD 7E 0C      [19] 2219 	ld	a,12 (iy)
   7E21 B7            [ 4] 2220 	or	a, a
   7E22 C8            [11] 2221 	ret	Z
                           2222 ;src/main.c:464: moverEnemigoPathfinding(enemy);
   7E23 C5            [11] 2223 	push	bc
   7E24 CD E9 7A      [17] 2224 	call	_moverEnemigoPathfinding
   7E27 F1            [10] 2225 	pop	af
   7E28 C9            [10] 2226 	ret
                           2227 ;src/main.c:468: void seek(TEnemy* actual){
                           2228 ;	---------------------------------
                           2229 ; Function seek
                           2230 ; ---------------------------------
   7E29                    2231 _seek::
                           2232 ;src/main.c:470: moverEnemigoPathfinding(enemy);
   7E29 21 C6 64      [10] 2233 	ld	hl,#_enemy
   7E2C E5            [11] 2234 	push	hl
   7E2D CD E9 7A      [17] 2235 	call	_moverEnemigoPathfinding
   7E30 F1            [10] 2236 	pop	af
   7E31 C9            [10] 2237 	ret
                           2238 ;src/main.c:473: void updateEnemies() {
                           2239 ;	---------------------------------
                           2240 ; Function updateEnemies
                           2241 ; ---------------------------------
   7E32                    2242 _updateEnemies::
   7E32 DD E5         [15] 2243 	push	ix
   7E34 DD 21 00 00   [14] 2244 	ld	ix,#0
   7E38 DD 39         [15] 2245 	add	ix,sp
   7E3A 21 F8 FF      [10] 2246 	ld	hl,#-8
   7E3D 39            [11] 2247 	add	hl,sp
   7E3E F9            [ 6] 2248 	ld	sp,hl
                           2249 ;src/main.c:475: u8 i = 1 + 1;
   7E3F DD 36 F8 02   [19] 2250 	ld	-8 (ix),#0x02
                           2251 ;src/main.c:478: actual = enemy;
                           2252 ;src/main.c:480: while (--i) {
   7E43 DD 36 F9 C6   [19] 2253 	ld	-7 (ix),#<(_enemy)
   7E47 DD 36 FA 64   [19] 2254 	ld	-6 (ix),#>(_enemy)
   7E4B DD 36 FB C6   [19] 2255 	ld	-5 (ix),#<(_enemy)
   7E4F DD 36 FC 64   [19] 2256 	ld	-4 (ix),#>(_enemy)
   7E53 DD 36 FD C6   [19] 2257 	ld	-3 (ix),#<(_enemy)
   7E57 DD 36 FE 64   [19] 2258 	ld	-2 (ix),#>(_enemy)
   7E5B                    2259 00120$:
   7E5B DD 35 F8      [23] 2260 	dec	-8 (ix)
   7E5E DD 7E F8      [19] 2261 	ld	a, -8 (ix)
   7E61 B7            [ 4] 2262 	or	a, a
   7E62 CA 16 7F      [10] 2263 	jp	Z,00123$
                           2264 ;src/main.c:481: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   7E65 21 C6 64      [10] 2265 	ld	hl,#_enemy
   7E68 E5            [11] 2266 	push	hl
   7E69 CD 74 7C      [17] 2267 	call	_lookFor
   7E6C F1            [10] 2268 	pop	af
                           2269 ;src/main.c:482: if (actual->patrolling) { // esta patrullando
   7E6D 3A D1 64      [13] 2270 	ld	a, (#(_enemy + 0x000b) + 0)
   7E70 B7            [ 4] 2271 	or	a, a
   7E71 CA F5 7E      [10] 2272 	jp	Z,00118$
                           2273 ;src/main.c:483: if (!actual->seen) {
   7E74 DD 6E F9      [19] 2274 	ld	l,-7 (ix)
   7E77 DD 66 FA      [19] 2275 	ld	h,-6 (ix)
   7E7A 11 12 00      [10] 2276 	ld	de, #0x0012
   7E7D 19            [11] 2277 	add	hl, de
   7E7E 4E            [ 7] 2278 	ld	c,(hl)
   7E7F 79            [ 4] 2279 	ld	a,c
   7E80 B7            [ 4] 2280 	or	a, a
   7E81 20 0A         [12] 2281 	jr	NZ,00107$
                           2282 ;src/main.c:484: patrol(actual);
   7E83 21 C6 64      [10] 2283 	ld	hl,#_enemy
   7E86 E5            [11] 2284 	push	hl
   7E87 CD 17 7E      [17] 2285 	call	_patrol
   7E8A F1            [10] 2286 	pop	af
   7E8B 18 CE         [12] 2287 	jr	00120$
   7E8D                    2288 00107$:
                           2289 ;src/main.c:491: actual->onPathPatrol = 0;
                           2290 ;src/main.c:485: } else if (actual->seen) {
   7E8D 79            [ 4] 2291 	ld	a,c
   7E8E B7            [ 4] 2292 	or	a, a
   7E8F 28 48         [12] 2293 	jr	Z,00104$
                           2294 ;src/main.c:486: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   7E91 21 D7 69      [10] 2295 	ld	hl, #_prota + 1
   7E94 46            [ 7] 2296 	ld	b,(hl)
   7E95 3A D6 69      [13] 2297 	ld	a,(#_prota + 0)
   7E98 DD 77 FF      [19] 2298 	ld	-1 (ix),a
   7E9B 21 C6 64      [10] 2299 	ld	hl,#_enemy
   7E9E 23            [ 6] 2300 	inc	hl
   7E9F 4E            [ 7] 2301 	ld	c,(hl)
   7EA0 21 C6 64      [10] 2302 	ld	hl, #_enemy + 0
   7EA3 5E            [ 7] 2303 	ld	e,(hl)
   7EA4 2A E9 69      [16] 2304 	ld	hl,(_mapa)
   7EA7 E5            [11] 2305 	push	hl
   7EA8 21 C6 64      [10] 2306 	ld	hl,#_enemy
   7EAB E5            [11] 2307 	push	hl
   7EAC C5            [11] 2308 	push	bc
   7EAD 33            [ 6] 2309 	inc	sp
   7EAE DD 7E FF      [19] 2310 	ld	a,-1 (ix)
   7EB1 F5            [11] 2311 	push	af
   7EB2 33            [ 6] 2312 	inc	sp
   7EB3 51            [ 4] 2313 	ld	d, c
   7EB4 D5            [11] 2314 	push	de
   7EB5 CD B2 54      [17] 2315 	call	_pathFinding
   7EB8 21 08 00      [10] 2316 	ld	hl,#8
   7EBB 39            [11] 2317 	add	hl,sp
   7EBC F9            [ 6] 2318 	ld	sp,hl
                           2319 ;src/main.c:487: actual->seek = 1;
   7EBD 21 DA 64      [10] 2320 	ld	hl,#(_enemy + 0x0014)
   7EC0 36 01         [10] 2321 	ld	(hl),#0x01
                           2322 ;src/main.c:488: actual->iter=0;
   7EC2 21 D5 64      [10] 2323 	ld	hl,#(_enemy + 0x000f)
   7EC5 36 00         [10] 2324 	ld	(hl),#0x00
                           2325 ;src/main.c:489: actual->reversePatrol = NO;
   7EC7 21 D3 64      [10] 2326 	ld	hl,#(_enemy + 0x000d)
   7ECA 36 00         [10] 2327 	ld	(hl),#0x00
                           2328 ;src/main.c:490: actual->patrolling = 0;
   7ECC 21 D1 64      [10] 2329 	ld	hl,#(_enemy + 0x000b)
   7ECF 36 00         [10] 2330 	ld	(hl),#0x00
                           2331 ;src/main.c:491: actual->onPathPatrol = 0;
   7ED1 21 D2 64      [10] 2332 	ld	hl,#(_enemy + 0x000c)
   7ED4 36 00         [10] 2333 	ld	(hl),#0x00
   7ED6 C3 5B 7E      [10] 2334 	jp	00120$
   7ED9                    2335 00104$:
                           2336 ;src/main.c:492: } else if (actual->inRange) {
   7ED9 DD 6E FB      [19] 2337 	ld	l,-5 (ix)
   7EDC DD 66 FC      [19] 2338 	ld	h,-4 (ix)
   7EDF 11 11 00      [10] 2339 	ld	de, #0x0011
   7EE2 19            [11] 2340 	add	hl, de
   7EE3 7E            [ 7] 2341 	ld	a,(hl)
   7EE4 B7            [ 4] 2342 	or	a, a
   7EE5 CA 5B 7E      [10] 2343 	jp	Z,00120$
                           2344 ;src/main.c:494: actual->patrolling = 0;
   7EE8 21 D1 64      [10] 2345 	ld	hl,#(_enemy + 0x000b)
   7EEB 36 00         [10] 2346 	ld	(hl),#0x00
                           2347 ;src/main.c:495: actual->onPathPatrol = 0;
   7EED 21 D2 64      [10] 2348 	ld	hl,#(_enemy + 0x000c)
   7EF0 36 00         [10] 2349 	ld	(hl),#0x00
   7EF2 C3 5B 7E      [10] 2350 	jp	00120$
   7EF5                    2351 00118$:
                           2352 ;src/main.c:497: } else if (actual->seek) { // esta buscando
   7EF5 3A DA 64      [13] 2353 	ld	a, (#(_enemy + 0x0014) + 0)
   7EF8 B7            [ 4] 2354 	or	a, a
   7EF9 CA 5B 7E      [10] 2355 	jp	Z,00120$
                           2356 ;src/main.c:498: if (!actual->found /*&& actual->seekTimer <= 5*/) {
   7EFC DD 6E FD      [19] 2357 	ld	l,-3 (ix)
   7EFF DD 66 FE      [19] 2358 	ld	h,-2 (ix)
   7F02 11 13 00      [10] 2359 	ld	de, #0x0013
   7F05 19            [11] 2360 	add	hl, de
   7F06 7E            [ 7] 2361 	ld	a,(hl)
   7F07 B7            [ 4] 2362 	or	a, a
   7F08 C2 5B 7E      [10] 2363 	jp	NZ,00120$
                           2364 ;src/main.c:499: seek(actual); // buscar en posiciones cercanas a la actual
   7F0B 21 C6 64      [10] 2365 	ld	hl,#_enemy
   7F0E E5            [11] 2366 	push	hl
   7F0F CD 29 7E      [17] 2367 	call	_seek
   7F12 F1            [10] 2368 	pop	af
   7F13 C3 5B 7E      [10] 2369 	jp	00120$
                           2370 ;src/main.c:502: } else if (actual->engage) {
   7F16                    2371 00123$:
   7F16 DD F9         [10] 2372 	ld	sp, ix
   7F18 DD E1         [14] 2373 	pop	ix
   7F1A C9            [10] 2374 	ret
                           2375 ;src/main.c:511: void avanzarMapa() {
                           2376 ;	---------------------------------
                           2377 ; Function avanzarMapa
                           2378 ; ---------------------------------
   7F1B                    2379 _avanzarMapa::
                           2380 ;src/main.c:512: if(num_mapa < NUM_MAPAS -1) {
   7F1B 3A EB 69      [13] 2381 	ld	a,(#_num_mapa + 0)
   7F1E D6 02         [ 7] 2382 	sub	a, #0x02
   7F20 D2 33 73      [10] 2383 	jp	NC,_menuFin
                           2384 ;src/main.c:513: mapa = mapas[++num_mapa];
   7F23 21 EB 69      [10] 2385 	ld	hl, #_num_mapa+0
   7F26 34            [11] 2386 	inc	(hl)
   7F27 FD 21 EB 69   [14] 2387 	ld	iy,#_num_mapa
   7F2B FD 6E 00      [19] 2388 	ld	l,0 (iy)
   7F2E 26 00         [ 7] 2389 	ld	h,#0x00
   7F30 29            [11] 2390 	add	hl, hl
   7F31 11 89 72      [10] 2391 	ld	de,#_mapas
   7F34 19            [11] 2392 	add	hl,de
   7F35 7E            [ 7] 2393 	ld	a,(hl)
   7F36 FD 21 E9 69   [14] 2394 	ld	iy,#_mapa
   7F3A FD 77 00      [19] 2395 	ld	0 (iy),a
   7F3D 23            [ 6] 2396 	inc	hl
   7F3E 7E            [ 7] 2397 	ld	a,(hl)
   7F3F 32 EA 69      [13] 2398 	ld	(#_mapa + 1),a
                           2399 ;src/main.c:514: prota.x = prota.px = 2;
   7F42 21 D8 69      [10] 2400 	ld	hl,#(_prota + 0x0002)
   7F45 36 02         [10] 2401 	ld	(hl),#0x02
   7F47 21 D6 69      [10] 2402 	ld	hl,#_prota
   7F4A 36 02         [10] 2403 	ld	(hl),#0x02
                           2404 ;src/main.c:515: prota.mover = SI;
   7F4C 21 DC 69      [10] 2405 	ld	hl,#(_prota + 0x0006)
   7F4F 36 01         [10] 2406 	ld	(hl),#0x01
                           2407 ;src/main.c:516: dibujarMapa();
   7F51 CD 73 72      [17] 2408 	call	_dibujarMapa
                           2409 ;src/main.c:517: inicializarEnemy();
   7F54 C3 3B 85      [10] 2410 	jp  _inicializarEnemy
                           2411 ;src/main.c:521: menuFin();
   7F57 C3 33 73      [10] 2412 	jp  _menuFin
                           2413 ;src/main.c:525: void moverIzquierda() {
                           2414 ;	---------------------------------
                           2415 ; Function moverIzquierda
                           2416 ; ---------------------------------
   7F5A                    2417 _moverIzquierda::
                           2418 ;src/main.c:526: prota.mira = M_izquierda;
   7F5A 01 D6 69      [10] 2419 	ld	bc,#_prota+0
   7F5D 21 DD 69      [10] 2420 	ld	hl,#(_prota + 0x0007)
   7F60 36 01         [10] 2421 	ld	(hl),#0x01
                           2422 ;src/main.c:527: if (!checkCollision(M_izquierda)) {
   7F62 C5            [11] 2423 	push	bc
   7F63 21 01 00      [10] 2424 	ld	hl,#0x0001
   7F66 E5            [11] 2425 	push	hl
   7F67 CD BF 73      [17] 2426 	call	_checkCollision
   7F6A F1            [10] 2427 	pop	af
   7F6B C1            [10] 2428 	pop	bc
   7F6C 7D            [ 4] 2429 	ld	a,l
   7F6D B7            [ 4] 2430 	or	a, a
   7F6E C0            [11] 2431 	ret	NZ
                           2432 ;src/main.c:528: prota.x--;
   7F6F 0A            [ 7] 2433 	ld	a,(bc)
   7F70 C6 FF         [ 7] 2434 	add	a,#0xFF
   7F72 02            [ 7] 2435 	ld	(bc),a
                           2436 ;src/main.c:529: prota.mover = SI;
   7F73 21 DC 69      [10] 2437 	ld	hl,#(_prota + 0x0006)
   7F76 36 01         [10] 2438 	ld	(hl),#0x01
                           2439 ;src/main.c:530: prota.sprite = g_hero_left;
   7F78 21 FE 49      [10] 2440 	ld	hl,#_g_hero_left
   7F7B 22 DA 69      [16] 2441 	ld	((_prota + 0x0004)), hl
   7F7E C9            [10] 2442 	ret
                           2443 ;src/main.c:534: void moverDerecha() {
                           2444 ;	---------------------------------
                           2445 ; Function moverDerecha
                           2446 ; ---------------------------------
   7F7F                    2447 _moverDerecha::
                           2448 ;src/main.c:535: prota.mira = M_derecha;
   7F7F 21 DD 69      [10] 2449 	ld	hl,#(_prota + 0x0007)
   7F82 36 00         [10] 2450 	ld	(hl),#0x00
                           2451 ;src/main.c:536: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7F84 21 00 00      [10] 2452 	ld	hl,#0x0000
   7F87 E5            [11] 2453 	push	hl
   7F88 CD BF 73      [17] 2454 	call	_checkCollision
   7F8B F1            [10] 2455 	pop	af
   7F8C 45            [ 4] 2456 	ld	b,l
   7F8D 21 D6 69      [10] 2457 	ld	hl, #_prota + 0
   7F90 4E            [ 7] 2458 	ld	c,(hl)
   7F91 59            [ 4] 2459 	ld	e,c
   7F92 16 00         [ 7] 2460 	ld	d,#0x00
   7F94 21 07 00      [10] 2461 	ld	hl,#0x0007
   7F97 19            [11] 2462 	add	hl,de
   7F98 11 50 80      [10] 2463 	ld	de, #0x8050
   7F9B 29            [11] 2464 	add	hl, hl
   7F9C 3F            [ 4] 2465 	ccf
   7F9D CB 1C         [ 8] 2466 	rr	h
   7F9F CB 1D         [ 8] 2467 	rr	l
   7FA1 ED 52         [15] 2468 	sbc	hl, de
   7FA3 3E 00         [ 7] 2469 	ld	a,#0x00
   7FA5 17            [ 4] 2470 	rla
   7FA6 5F            [ 4] 2471 	ld	e,a
   7FA7 78            [ 4] 2472 	ld	a,b
   7FA8 B7            [ 4] 2473 	or	a,a
   7FA9 20 14         [12] 2474 	jr	NZ,00104$
   7FAB B3            [ 4] 2475 	or	a,e
   7FAC 28 11         [12] 2476 	jr	Z,00104$
                           2477 ;src/main.c:537: prota.x++;
   7FAE 0C            [ 4] 2478 	inc	c
   7FAF 21 D6 69      [10] 2479 	ld	hl,#_prota
   7FB2 71            [ 7] 2480 	ld	(hl),c
                           2481 ;src/main.c:538: prota.mover = SI;
   7FB3 21 DC 69      [10] 2482 	ld	hl,#(_prota + 0x0006)
   7FB6 36 01         [10] 2483 	ld	(hl),#0x01
                           2484 ;src/main.c:539: prota.sprite = g_hero;
   7FB8 21 A8 4A      [10] 2485 	ld	hl,#_g_hero
   7FBB 22 DA 69      [16] 2486 	ld	((_prota + 0x0004)), hl
   7FBE C9            [10] 2487 	ret
   7FBF                    2488 00104$:
                           2489 ;src/main.c:541: }else if( prota.x + G_HERO_W >= 80){
   7FBF 7B            [ 4] 2490 	ld	a,e
   7FC0 B7            [ 4] 2491 	or	a, a
   7FC1 C0            [11] 2492 	ret	NZ
                           2493 ;src/main.c:542: avanzarMapa();
   7FC2 C3 1B 7F      [10] 2494 	jp  _avanzarMapa
                           2495 ;src/main.c:546: void moverArriba() {
                           2496 ;	---------------------------------
                           2497 ; Function moverArriba
                           2498 ; ---------------------------------
   7FC5                    2499 _moverArriba::
                           2500 ;src/main.c:547: prota.mira = M_arriba;
   7FC5 21 DD 69      [10] 2501 	ld	hl,#(_prota + 0x0007)
   7FC8 36 02         [10] 2502 	ld	(hl),#0x02
                           2503 ;src/main.c:548: if (!checkCollision(M_arriba)) { // TODO: COMPROBAR
   7FCA 21 02 00      [10] 2504 	ld	hl,#0x0002
   7FCD E5            [11] 2505 	push	hl
   7FCE CD BF 73      [17] 2506 	call	_checkCollision
   7FD1 F1            [10] 2507 	pop	af
   7FD2 7D            [ 4] 2508 	ld	a,l
   7FD3 B7            [ 4] 2509 	or	a, a
   7FD4 C0            [11] 2510 	ret	NZ
                           2511 ;src/main.c:549: prota.y--;
   7FD5 21 D7 69      [10] 2512 	ld	hl,#_prota + 1
   7FD8 4E            [ 7] 2513 	ld	c,(hl)
   7FD9 0D            [ 4] 2514 	dec	c
   7FDA 71            [ 7] 2515 	ld	(hl),c
                           2516 ;src/main.c:550: prota.y--;
   7FDB 0D            [ 4] 2517 	dec	c
   7FDC 71            [ 7] 2518 	ld	(hl),c
                           2519 ;src/main.c:551: prota.mover  = SI;
   7FDD 21 DC 69      [10] 2520 	ld	hl,#(_prota + 0x0006)
   7FE0 36 01         [10] 2521 	ld	(hl),#0x01
                           2522 ;src/main.c:552: prota.sprite = g_hero_up;
   7FE2 21 64 49      [10] 2523 	ld	hl,#_g_hero_up
   7FE5 22 DA 69      [16] 2524 	ld	((_prota + 0x0004)), hl
   7FE8 C9            [10] 2525 	ret
                           2526 ;src/main.c:556: void moverAbajo() {
                           2527 ;	---------------------------------
                           2528 ; Function moverAbajo
                           2529 ; ---------------------------------
   7FE9                    2530 _moverAbajo::
                           2531 ;src/main.c:557: prota.mira = M_abajo;
   7FE9 21 DD 69      [10] 2532 	ld	hl,#(_prota + 0x0007)
   7FEC 36 03         [10] 2533 	ld	(hl),#0x03
                           2534 ;src/main.c:558: if (!checkCollision(M_abajo) ) { // TODO: COMPROBAR
   7FEE 21 03 00      [10] 2535 	ld	hl,#0x0003
   7FF1 E5            [11] 2536 	push	hl
   7FF2 CD BF 73      [17] 2537 	call	_checkCollision
   7FF5 F1            [10] 2538 	pop	af
   7FF6 7D            [ 4] 2539 	ld	a,l
   7FF7 B7            [ 4] 2540 	or	a, a
   7FF8 C0            [11] 2541 	ret	NZ
                           2542 ;src/main.c:559: prota.y++;
   7FF9 01 D7 69      [10] 2543 	ld	bc,#_prota + 1
   7FFC 0A            [ 7] 2544 	ld	a,(bc)
   7FFD 3C            [ 4] 2545 	inc	a
   7FFE 02            [ 7] 2546 	ld	(bc),a
                           2547 ;src/main.c:560: prota.y++;
   7FFF 3C            [ 4] 2548 	inc	a
   8000 02            [ 7] 2549 	ld	(bc),a
                           2550 ;src/main.c:561: prota.mover  = SI;
   8001 21 DC 69      [10] 2551 	ld	hl,#(_prota + 0x0006)
   8004 36 01         [10] 2552 	ld	(hl),#0x01
                           2553 ;src/main.c:562: prota.sprite = g_hero_down;
   8006 21 CA 48      [10] 2554 	ld	hl,#_g_hero_down
   8009 22 DA 69      [16] 2555 	ld	((_prota + 0x0004)), hl
   800C C9            [10] 2556 	ret
                           2557 ;src/main.c:566: void dibujarCuchillo() {
                           2558 ;	---------------------------------
                           2559 ; Function dibujarCuchillo
                           2560 ; ---------------------------------
   800D                    2561 _dibujarCuchillo::
   800D DD E5         [15] 2562 	push	ix
   800F DD 21 00 00   [14] 2563 	ld	ix,#0
   8013 DD 39         [15] 2564 	add	ix,sp
   8015 F5            [11] 2565 	push	af
                           2566 ;src/main.c:567: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   8016 21 DF 69      [10] 2567 	ld	hl, #_cu + 1
   8019 56            [ 7] 2568 	ld	d,(hl)
   801A 21 DE 69      [10] 2569 	ld	hl, #_cu + 0
   801D 46            [ 7] 2570 	ld	b,(hl)
   801E D5            [11] 2571 	push	de
   801F 33            [ 6] 2572 	inc	sp
   8020 C5            [11] 2573 	push	bc
   8021 33            [ 6] 2574 	inc	sp
   8022 21 00 C0      [10] 2575 	ld	hl,#0xC000
   8025 E5            [11] 2576 	push	hl
   8026 CD 69 64      [17] 2577 	call	_cpct_getScreenPtr
   8029 45            [ 4] 2578 	ld	b,l
   802A 5C            [ 4] 2579 	ld	e,h
                           2580 ;src/main.c:568: if(cu.eje == E_X){
   802B 21 E6 69      [10] 2581 	ld	hl, #_cu + 8
   802E 4E            [ 7] 2582 	ld	c,(hl)
                           2583 ;src/main.c:569: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   802F DD 70 FE      [19] 2584 	ld	-2 (ix),b
   8032 DD 73 FF      [19] 2585 	ld	-1 (ix),e
                           2586 ;src/main.c:568: if(cu.eje == E_X){
   8035 79            [ 4] 2587 	ld	a,c
   8036 B7            [ 4] 2588 	or	a, a
   8037 20 19         [12] 2589 	jr	NZ,00104$
                           2590 ;src/main.c:569: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   8039 11 00 0E      [10] 2591 	ld	de,#_g_tablatrans+0
   803C ED 4B E2 69   [20] 2592 	ld	bc, (#(_cu + 0x0004) + 0)
   8040 D5            [11] 2593 	push	de
   8041 21 04 04      [10] 2594 	ld	hl,#0x0404
   8044 E5            [11] 2595 	push	hl
   8045 DD 6E FE      [19] 2596 	ld	l,-2 (ix)
   8048 DD 66 FF      [19] 2597 	ld	h,-1 (ix)
   804B E5            [11] 2598 	push	hl
   804C C5            [11] 2599 	push	bc
   804D CD 89 64      [17] 2600 	call	_cpct_drawSpriteMaskedAlignedTable
   8050 18 1A         [12] 2601 	jr	00106$
   8052                    2602 00104$:
                           2603 ;src/main.c:572: else if(cu.eje == E_Y){
   8052 0D            [ 4] 2604 	dec	c
   8053 20 17         [12] 2605 	jr	NZ,00106$
                           2606 ;src/main.c:573: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   8055 11 00 0E      [10] 2607 	ld	de,#_g_tablatrans+0
   8058 ED 4B E2 69   [20] 2608 	ld	bc, (#(_cu + 0x0004) + 0)
   805C D5            [11] 2609 	push	de
   805D 21 02 08      [10] 2610 	ld	hl,#0x0802
   8060 E5            [11] 2611 	push	hl
   8061 DD 6E FE      [19] 2612 	ld	l,-2 (ix)
   8064 DD 66 FF      [19] 2613 	ld	h,-1 (ix)
   8067 E5            [11] 2614 	push	hl
   8068 C5            [11] 2615 	push	bc
   8069 CD 89 64      [17] 2616 	call	_cpct_drawSpriteMaskedAlignedTable
   806C                    2617 00106$:
   806C DD F9         [10] 2618 	ld	sp, ix
   806E DD E1         [14] 2619 	pop	ix
   8070 C9            [10] 2620 	ret
                           2621 ;src/main.c:577: void borrarCuchillo() {
                           2622 ;	---------------------------------
                           2623 ; Function borrarCuchillo
                           2624 ; ---------------------------------
   8071                    2625 _borrarCuchillo::
   8071 DD E5         [15] 2626 	push	ix
   8073 DD 21 00 00   [14] 2627 	ld	ix,#0
   8077 DD 39         [15] 2628 	add	ix,sp
   8079 F5            [11] 2629 	push	af
   807A 3B            [ 6] 2630 	dec	sp
                           2631 ;src/main.c:579: u8 w = 2 + (cu.px & 1);
   807B 21 E0 69      [10] 2632 	ld	hl, #_cu + 2
   807E 4E            [ 7] 2633 	ld	c,(hl)
   807F 79            [ 4] 2634 	ld	a,c
   8080 E6 01         [ 7] 2635 	and	a, #0x01
   8082 47            [ 4] 2636 	ld	b,a
   8083 04            [ 4] 2637 	inc	b
   8084 04            [ 4] 2638 	inc	b
                           2639 ;src/main.c:580: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   8085 21 E1 69      [10] 2640 	ld	hl, #_cu + 3
   8088 5E            [ 7] 2641 	ld	e,(hl)
   8089 7B            [ 4] 2642 	ld	a,e
   808A E6 03         [ 7] 2643 	and	a, #0x03
   808C 28 04         [12] 2644 	jr	Z,00105$
   808E 3E 01         [ 7] 2645 	ld	a,#0x01
   8090 18 02         [12] 2646 	jr	00106$
   8092                    2647 00105$:
   8092 3E 00         [ 7] 2648 	ld	a,#0x00
   8094                    2649 00106$:
   8094 C6 02         [ 7] 2650 	add	a, #0x02
   8096 DD 77 FD      [19] 2651 	ld	-3 (ix),a
                           2652 ;src/main.c:581: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   8099 FD 2A E9 69   [20] 2653 	ld	iy,(_mapa)
   809D 16 00         [ 7] 2654 	ld	d,#0x00
   809F 7B            [ 4] 2655 	ld	a,e
   80A0 C6 E8         [ 7] 2656 	add	a,#0xE8
   80A2 DD 77 FE      [19] 2657 	ld	-2 (ix),a
   80A5 7A            [ 4] 2658 	ld	a,d
   80A6 CE FF         [ 7] 2659 	adc	a,#0xFF
   80A8 DD 77 FF      [19] 2660 	ld	-1 (ix),a
   80AB DD 6E FE      [19] 2661 	ld	l,-2 (ix)
   80AE DD 66 FF      [19] 2662 	ld	h,-1 (ix)
   80B1 DD CB FF 7E   [20] 2663 	bit	7, -1 (ix)
   80B5 28 04         [12] 2664 	jr	Z,00107$
   80B7 21 EB FF      [10] 2665 	ld	hl,#0xFFEB
   80BA 19            [11] 2666 	add	hl,de
   80BB                    2667 00107$:
   80BB CB 2C         [ 8] 2668 	sra	h
   80BD CB 1D         [ 8] 2669 	rr	l
   80BF CB 2C         [ 8] 2670 	sra	h
   80C1 CB 1D         [ 8] 2671 	rr	l
   80C3 55            [ 4] 2672 	ld	d,l
   80C4 CB 39         [ 8] 2673 	srl	c
   80C6 FD E5         [15] 2674 	push	iy
   80C8 21 F0 C0      [10] 2675 	ld	hl,#0xC0F0
   80CB E5            [11] 2676 	push	hl
   80CC 3E 28         [ 7] 2677 	ld	a,#0x28
   80CE F5            [11] 2678 	push	af
   80CF 33            [ 6] 2679 	inc	sp
   80D0 DD 7E FD      [19] 2680 	ld	a,-3 (ix)
   80D3 F5            [11] 2681 	push	af
   80D4 33            [ 6] 2682 	inc	sp
   80D5 C5            [11] 2683 	push	bc
   80D6 33            [ 6] 2684 	inc	sp
   80D7 D5            [11] 2685 	push	de
   80D8 33            [ 6] 2686 	inc	sp
   80D9 79            [ 4] 2687 	ld	a,c
   80DA F5            [11] 2688 	push	af
   80DB 33            [ 6] 2689 	inc	sp
   80DC CD 62 59      [17] 2690 	call	_cpct_etm_drawTileBox2x4
                           2691 ;src/main.c:582: if(!cu.mover){
   80DF 3A E7 69      [13] 2692 	ld	a, (#_cu + 9)
   80E2 B7            [ 4] 2693 	or	a, a
   80E3 20 05         [12] 2694 	jr	NZ,00103$
                           2695 ;src/main.c:583: cu.lanzado = NO;
   80E5 21 E4 69      [10] 2696 	ld	hl,#(_cu + 0x0006)
   80E8 36 00         [10] 2697 	ld	(hl),#0x00
   80EA                    2698 00103$:
   80EA DD F9         [10] 2699 	ld	sp, ix
   80EC DD E1         [14] 2700 	pop	ix
   80EE C9            [10] 2701 	ret
                           2702 ;src/main.c:587: void redibujarCuchillo( ) {
                           2703 ;	---------------------------------
                           2704 ; Function redibujarCuchillo
                           2705 ; ---------------------------------
   80EF                    2706 _redibujarCuchillo::
                           2707 ;src/main.c:588: borrarCuchillo();
   80EF CD 71 80      [17] 2708 	call	_borrarCuchillo
                           2709 ;src/main.c:589: cu.px = cu.x;
   80F2 01 E0 69      [10] 2710 	ld	bc,#_cu + 2
   80F5 3A DE 69      [13] 2711 	ld	a, (#_cu + 0)
   80F8 02            [ 7] 2712 	ld	(bc),a
                           2713 ;src/main.c:590: cu.py = cu.y;
   80F9 01 E1 69      [10] 2714 	ld	bc,#_cu + 3
   80FC 3A DF 69      [13] 2715 	ld	a, (#_cu + 1)
   80FF 02            [ 7] 2716 	ld	(bc),a
                           2717 ;src/main.c:591: dibujarCuchillo();
   8100 C3 0D 80      [10] 2718 	jp  _dibujarCuchillo
                           2719 ;src/main.c:594: void lanzarCuchillo(){
                           2720 ;	---------------------------------
                           2721 ; Function lanzarCuchillo
                           2722 ; ---------------------------------
   8103                    2723 _lanzarCuchillo::
                           2724 ;src/main.c:596: if(!cu.lanzado){
   8103 3A E4 69      [13] 2725 	ld	a, (#(_cu + 0x0006) + 0)
   8106 B7            [ 4] 2726 	or	a, a
   8107 C0            [11] 2727 	ret	NZ
                           2728 ;src/main.c:598: if(prota.mira == M_derecha){
   8108 21 DD 69      [10] 2729 	ld	hl, #_prota + 7
   810B 5E            [ 7] 2730 	ld	e,(hl)
                           2731 ;src/main.c:599: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   810C 01 D7 69      [10] 2732 	ld	bc,#_prota + 1
                           2733 ;src/main.c:601: cu.direccion = M_derecha;
                           2734 ;src/main.c:603: cu.y=prota.y + G_HERO_H /2;
                           2735 ;src/main.c:604: cu.sprite=g_knifeX_0;
                           2736 ;src/main.c:605: cu.eje = E_X;
                           2737 ;src/main.c:598: if(prota.mira == M_derecha){
   810F 7B            [ 4] 2738 	ld	a,e
   8110 B7            [ 4] 2739 	or	a, a
   8111 20 41         [12] 2740 	jr	NZ,00118$
                           2741 ;src/main.c:599: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   8113 0A            [ 7] 2742 	ld	a,(bc)
   8114 C6 0B         [ 7] 2743 	add	a, #0x0B
   8116 5F            [ 4] 2744 	ld	e,a
   8117 3A D6 69      [13] 2745 	ld	a, (#_prota + 0)
   811A C6 0C         [ 7] 2746 	add	a, #0x0C
   811C 6F            [ 4] 2747 	ld	l,a
   811D C5            [11] 2748 	push	bc
   811E 7B            [ 4] 2749 	ld	a,e
   811F F5            [11] 2750 	push	af
   8120 33            [ 6] 2751 	inc	sp
   8121 7D            [ 4] 2752 	ld	a,l
   8122 F5            [11] 2753 	push	af
   8123 33            [ 6] 2754 	inc	sp
   8124 CD 7E 73      [17] 2755 	call	_getTilePtr
   8127 F1            [10] 2756 	pop	af
   8128 C1            [10] 2757 	pop	bc
   8129 5E            [ 7] 2758 	ld	e,(hl)
   812A 3E 02         [ 7] 2759 	ld	a,#0x02
   812C 93            [ 4] 2760 	sub	a, e
   812D D8            [11] 2761 	ret	C
                           2762 ;src/main.c:600: cu.lanzado = SI;
   812E 21 E4 69      [10] 2763 	ld	hl,#(_cu + 0x0006)
   8131 36 01         [10] 2764 	ld	(hl),#0x01
                           2765 ;src/main.c:601: cu.direccion = M_derecha;
   8133 21 E5 69      [10] 2766 	ld	hl,#(_cu + 0x0007)
   8136 36 00         [10] 2767 	ld	(hl),#0x00
                           2768 ;src/main.c:602: cu.x=prota.x + G_HERO_W;
   8138 3A D6 69      [13] 2769 	ld	a, (#_prota + 0)
   813B C6 07         [ 7] 2770 	add	a, #0x07
   813D 32 DE 69      [13] 2771 	ld	(#_cu),a
                           2772 ;src/main.c:603: cu.y=prota.y + G_HERO_H /2;
   8140 0A            [ 7] 2773 	ld	a,(bc)
   8141 C6 0B         [ 7] 2774 	add	a, #0x0B
   8143 32 DF 69      [13] 2775 	ld	(#(_cu + 0x0001)),a
                           2776 ;src/main.c:604: cu.sprite=g_knifeX_0;
   8146 21 C0 24      [10] 2777 	ld	hl,#_g_knifeX_0
   8149 22 E2 69      [16] 2778 	ld	((_cu + 0x0004)), hl
                           2779 ;src/main.c:605: cu.eje = E_X;
   814C 21 E6 69      [10] 2780 	ld	hl,#(_cu + 0x0008)
   814F 36 00         [10] 2781 	ld	(hl),#0x00
                           2782 ;src/main.c:606: dibujarCuchillo();
   8151 C3 0D 80      [10] 2783 	jp  _dibujarCuchillo
   8154                    2784 00118$:
                           2785 ;src/main.c:609: else if(prota.mira == M_izquierda){
   8154 7B            [ 4] 2786 	ld	a,e
   8155 3D            [ 4] 2787 	dec	a
   8156 20 41         [12] 2788 	jr	NZ,00115$
                           2789 ;src/main.c:610: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   8158 0A            [ 7] 2790 	ld	a,(bc)
   8159 C6 0B         [ 7] 2791 	add	a, #0x0B
   815B 5F            [ 4] 2792 	ld	e,a
   815C 3A D6 69      [13] 2793 	ld	a, (#_prota + 0)
   815F C6 F6         [ 7] 2794 	add	a,#0xF6
   8161 6F            [ 4] 2795 	ld	l,a
   8162 C5            [11] 2796 	push	bc
   8163 7B            [ 4] 2797 	ld	a,e
   8164 F5            [11] 2798 	push	af
   8165 33            [ 6] 2799 	inc	sp
   8166 7D            [ 4] 2800 	ld	a,l
   8167 F5            [11] 2801 	push	af
   8168 33            [ 6] 2802 	inc	sp
   8169 CD 7E 73      [17] 2803 	call	_getTilePtr
   816C F1            [10] 2804 	pop	af
   816D C1            [10] 2805 	pop	bc
   816E 5E            [ 7] 2806 	ld	e,(hl)
   816F 3E 02         [ 7] 2807 	ld	a,#0x02
   8171 93            [ 4] 2808 	sub	a, e
   8172 D8            [11] 2809 	ret	C
                           2810 ;src/main.c:611: cu.lanzado = SI;
   8173 21 E4 69      [10] 2811 	ld	hl,#(_cu + 0x0006)
   8176 36 01         [10] 2812 	ld	(hl),#0x01
                           2813 ;src/main.c:612: cu.direccion = M_izquierda;
   8178 21 E5 69      [10] 2814 	ld	hl,#(_cu + 0x0007)
   817B 36 01         [10] 2815 	ld	(hl),#0x01
                           2816 ;src/main.c:613: cu.x = prota.x - G_KNIFEX_0_W;
   817D 3A D6 69      [13] 2817 	ld	a, (#_prota + 0)
   8180 C6 FC         [ 7] 2818 	add	a,#0xFC
   8182 32 DE 69      [13] 2819 	ld	(#_cu),a
                           2820 ;src/main.c:614: cu.y = prota.y + G_HERO_H /2;
   8185 0A            [ 7] 2821 	ld	a,(bc)
   8186 C6 0B         [ 7] 2822 	add	a, #0x0B
   8188 32 DF 69      [13] 2823 	ld	(#(_cu + 0x0001)),a
                           2824 ;src/main.c:615: cu.sprite = g_knifeX_1;
   818B 21 D0 24      [10] 2825 	ld	hl,#_g_knifeX_1
   818E 22 E2 69      [16] 2826 	ld	((_cu + 0x0004)), hl
                           2827 ;src/main.c:616: cu.eje = E_X;
   8191 21 E6 69      [10] 2828 	ld	hl,#(_cu + 0x0008)
   8194 36 00         [10] 2829 	ld	(hl),#0x00
                           2830 ;src/main.c:617: dibujarCuchillo();
   8196 C3 0D 80      [10] 2831 	jp  _dibujarCuchillo
   8199                    2832 00115$:
                           2833 ;src/main.c:620: else if(prota.mira == M_abajo){
   8199 7B            [ 4] 2834 	ld	a,e
   819A D6 03         [ 7] 2835 	sub	a, #0x03
   819C 20 41         [12] 2836 	jr	NZ,00112$
                           2837 ;src/main.c:622: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   819E 0A            [ 7] 2838 	ld	a,(bc)
   819F C6 1F         [ 7] 2839 	add	a, #0x1F
   81A1 5F            [ 4] 2840 	ld	e,a
   81A2 3A D6 69      [13] 2841 	ld	a, (#_prota + 0)
   81A5 57            [ 4] 2842 	ld	d,a
   81A6 14            [ 4] 2843 	inc	d
   81A7 14            [ 4] 2844 	inc	d
   81A8 14            [ 4] 2845 	inc	d
   81A9 C5            [11] 2846 	push	bc
   81AA 7B            [ 4] 2847 	ld	a,e
   81AB F5            [11] 2848 	push	af
   81AC 33            [ 6] 2849 	inc	sp
   81AD D5            [11] 2850 	push	de
   81AE 33            [ 6] 2851 	inc	sp
   81AF CD 7E 73      [17] 2852 	call	_getTilePtr
   81B2 F1            [10] 2853 	pop	af
   81B3 C1            [10] 2854 	pop	bc
   81B4 5E            [ 7] 2855 	ld	e,(hl)
   81B5 3E 02         [ 7] 2856 	ld	a,#0x02
   81B7 93            [ 4] 2857 	sub	a, e
   81B8 D8            [11] 2858 	ret	C
                           2859 ;src/main.c:623: cu.lanzado = SI;
   81B9 21 E4 69      [10] 2860 	ld	hl,#(_cu + 0x0006)
   81BC 36 01         [10] 2861 	ld	(hl),#0x01
                           2862 ;src/main.c:624: cu.direccion = M_abajo;
   81BE 21 E5 69      [10] 2863 	ld	hl,#(_cu + 0x0007)
   81C1 36 03         [10] 2864 	ld	(hl),#0x03
                           2865 ;src/main.c:625: cu.x = prota.x + G_HERO_W / 2;
   81C3 3A D6 69      [13] 2866 	ld	a, (#_prota + 0)
   81C6 C6 03         [ 7] 2867 	add	a, #0x03
   81C8 32 DE 69      [13] 2868 	ld	(#_cu),a
                           2869 ;src/main.c:626: cu.y = prota.y + G_HERO_H;
   81CB 0A            [ 7] 2870 	ld	a,(bc)
   81CC C6 16         [ 7] 2871 	add	a, #0x16
   81CE 32 DF 69      [13] 2872 	ld	(#(_cu + 0x0001)),a
                           2873 ;src/main.c:627: cu.sprite = g_knifeY_0;
   81D1 21 A0 24      [10] 2874 	ld	hl,#_g_knifeY_0
   81D4 22 E2 69      [16] 2875 	ld	((_cu + 0x0004)), hl
                           2876 ;src/main.c:628: cu.eje = E_Y;
   81D7 21 E6 69      [10] 2877 	ld	hl,#(_cu + 0x0008)
   81DA 36 01         [10] 2878 	ld	(hl),#0x01
                           2879 ;src/main.c:629: dibujarCuchillo();
   81DC C3 0D 80      [10] 2880 	jp  _dibujarCuchillo
   81DF                    2881 00112$:
                           2882 ;src/main.c:632: else if(prota.mira == M_arriba){
   81DF 7B            [ 4] 2883 	ld	a,e
   81E0 D6 02         [ 7] 2884 	sub	a, #0x02
   81E2 C0            [11] 2885 	ret	NZ
                           2886 ;src/main.c:633: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   81E3 0A            [ 7] 2887 	ld	a,(bc)
   81E4 C6 F7         [ 7] 2888 	add	a,#0xF7
   81E6 57            [ 4] 2889 	ld	d,a
   81E7 3A D6 69      [13] 2890 	ld	a, (#_prota + 0)
   81EA C6 03         [ 7] 2891 	add	a, #0x03
   81EC C5            [11] 2892 	push	bc
   81ED D5            [11] 2893 	push	de
   81EE 33            [ 6] 2894 	inc	sp
   81EF F5            [11] 2895 	push	af
   81F0 33            [ 6] 2896 	inc	sp
   81F1 CD 7E 73      [17] 2897 	call	_getTilePtr
   81F4 F1            [10] 2898 	pop	af
   81F5 C1            [10] 2899 	pop	bc
   81F6 5E            [ 7] 2900 	ld	e,(hl)
   81F7 3E 02         [ 7] 2901 	ld	a,#0x02
   81F9 93            [ 4] 2902 	sub	a, e
   81FA D8            [11] 2903 	ret	C
                           2904 ;src/main.c:634: cu.lanzado = SI;
   81FB 21 E4 69      [10] 2905 	ld	hl,#(_cu + 0x0006)
   81FE 36 01         [10] 2906 	ld	(hl),#0x01
                           2907 ;src/main.c:635: cu.direccion = M_arriba;
   8200 21 E5 69      [10] 2908 	ld	hl,#(_cu + 0x0007)
   8203 36 02         [10] 2909 	ld	(hl),#0x02
                           2910 ;src/main.c:636: cu.x = prota.x + G_HERO_W / 2;
   8205 3A D6 69      [13] 2911 	ld	a, (#_prota + 0)
   8208 C6 03         [ 7] 2912 	add	a, #0x03
   820A 32 DE 69      [13] 2913 	ld	(#_cu),a
                           2914 ;src/main.c:637: cu.y = prota.y;
   820D 0A            [ 7] 2915 	ld	a,(bc)
   820E 32 DF 69      [13] 2916 	ld	(#(_cu + 0x0001)),a
                           2917 ;src/main.c:638: cu.sprite = g_knifeY_1;
   8211 21 B0 24      [10] 2918 	ld	hl,#_g_knifeY_1
   8214 22 E2 69      [16] 2919 	ld	((_cu + 0x0004)), hl
                           2920 ;src/main.c:639: cu.eje = E_Y;
   8217 21 E6 69      [10] 2921 	ld	hl,#(_cu + 0x0008)
   821A 36 01         [10] 2922 	ld	(hl),#0x01
                           2923 ;src/main.c:640: dibujarCuchillo();
   821C C3 0D 80      [10] 2924 	jp  _dibujarCuchillo
                           2925 ;src/main.c:646: void comprobarTeclado() {
                           2926 ;	---------------------------------
                           2927 ; Function comprobarTeclado
                           2928 ; ---------------------------------
   821F                    2929 _comprobarTeclado::
                           2930 ;src/main.c:647: cpct_scanKeyboard_if();
   821F CD BA 5A      [17] 2931 	call	_cpct_scanKeyboard_if
                           2932 ;src/main.c:649: if (cpct_isAnyKeyPressed()) {
   8222 CD AD 5A      [17] 2933 	call	_cpct_isAnyKeyPressed
   8225 7D            [ 4] 2934 	ld	a,l
   8226 B7            [ 4] 2935 	or	a, a
   8227 C8            [11] 2936 	ret	Z
                           2937 ;src/main.c:650: if (cpct_isKeyPressed(Key_CursorLeft))
   8228 21 01 01      [10] 2938 	ld	hl,#0x0101
   822B CD 17 58      [17] 2939 	call	_cpct_isKeyPressed
   822E 7D            [ 4] 2940 	ld	a,l
   822F B7            [ 4] 2941 	or	a, a
                           2942 ;src/main.c:651: moverIzquierda();
   8230 C2 5A 7F      [10] 2943 	jp	NZ,_moverIzquierda
                           2944 ;src/main.c:652: else if (cpct_isKeyPressed(Key_CursorRight))
   8233 21 00 02      [10] 2945 	ld	hl,#0x0200
   8236 CD 17 58      [17] 2946 	call	_cpct_isKeyPressed
   8239 7D            [ 4] 2947 	ld	a,l
   823A B7            [ 4] 2948 	or	a, a
                           2949 ;src/main.c:653: moverDerecha();
   823B C2 7F 7F      [10] 2950 	jp	NZ,_moverDerecha
                           2951 ;src/main.c:654: else if (cpct_isKeyPressed(Key_CursorUp))
   823E 21 00 01      [10] 2952 	ld	hl,#0x0100
   8241 CD 17 58      [17] 2953 	call	_cpct_isKeyPressed
   8244 7D            [ 4] 2954 	ld	a,l
   8245 B7            [ 4] 2955 	or	a, a
                           2956 ;src/main.c:655: moverArriba();
   8246 C2 C5 7F      [10] 2957 	jp	NZ,_moverArriba
                           2958 ;src/main.c:656: else if (cpct_isKeyPressed(Key_CursorDown))
   8249 21 00 04      [10] 2959 	ld	hl,#0x0400
   824C CD 17 58      [17] 2960 	call	_cpct_isKeyPressed
   824F 7D            [ 4] 2961 	ld	a,l
   8250 B7            [ 4] 2962 	or	a, a
                           2963 ;src/main.c:657: moverAbajo();
   8251 C2 E9 7F      [10] 2964 	jp	NZ,_moverAbajo
                           2965 ;src/main.c:658: else if (cpct_isKeyPressed(Key_Space))
   8254 21 05 80      [10] 2966 	ld	hl,#0x8005
   8257 CD 17 58      [17] 2967 	call	_cpct_isKeyPressed
   825A 7D            [ 4] 2968 	ld	a,l
   825B B7            [ 4] 2969 	or	a, a
   825C C8            [11] 2970 	ret	Z
                           2971 ;src/main.c:659: lanzarCuchillo();
   825D C3 03 81      [10] 2972 	jp  _lanzarCuchillo
                           2973 ;src/main.c:663: u8 checkKnifeCollision(int direction, u8 xoff, u8 yoff){
                           2974 ;	---------------------------------
                           2975 ; Function checkKnifeCollision
                           2976 ; ---------------------------------
   8260                    2977 _checkKnifeCollision::
                           2978 ;src/main.c:665: return *getTilePtr(cu.x + xoff, cu.y + yoff) <= 2;
   8260 3A DF 69      [13] 2979 	ld	a,(#_cu + 1)
   8263 21 05 00      [10] 2980 	ld	hl,#5
   8266 39            [11] 2981 	add	hl,sp
   8267 86            [ 7] 2982 	add	a, (hl)
   8268 47            [ 4] 2983 	ld	b,a
   8269 3A DE 69      [13] 2984 	ld	a,(#_cu + 0)
   826C 21 04 00      [10] 2985 	ld	hl,#4
   826F 39            [11] 2986 	add	hl,sp
   8270 86            [ 7] 2987 	add	a, (hl)
   8271 4F            [ 4] 2988 	ld	c,a
   8272 C5            [11] 2989 	push	bc
   8273 CD 7E 73      [17] 2990 	call	_getTilePtr
   8276 F1            [10] 2991 	pop	af
   8277 4E            [ 7] 2992 	ld	c,(hl)
   8278 3E 02         [ 7] 2993 	ld	a,#0x02
   827A 91            [ 4] 2994 	sub	a, c
   827B 3E 00         [ 7] 2995 	ld	a,#0x00
   827D 17            [ 4] 2996 	rla
   827E EE 01         [ 7] 2997 	xor	a, #0x01
   8280 6F            [ 4] 2998 	ld	l, a
   8281 C9            [10] 2999 	ret
                           3000 ;src/main.c:668: void moverCuchillo(){
                           3001 ;	---------------------------------
                           3002 ; Function moverCuchillo
                           3003 ; ---------------------------------
   8282                    3004 _moverCuchillo::
                           3005 ;src/main.c:669: if(cu.lanzado){
   8282 01 DE 69      [10] 3006 	ld	bc,#_cu+0
   8285 3A E4 69      [13] 3007 	ld	a, (#_cu + 6)
   8288 B7            [ 4] 3008 	or	a, a
   8289 C8            [11] 3009 	ret	Z
                           3010 ;src/main.c:670: cu.mover = SI;
   828A 21 09 00      [10] 3011 	ld	hl,#0x0009
   828D 09            [11] 3012 	add	hl,bc
   828E EB            [ 4] 3013 	ex	de,hl
   828F 3E 01         [ 7] 3014 	ld	a,#0x01
   8291 12            [ 7] 3015 	ld	(de),a
                           3016 ;src/main.c:671: if(cu.direccion == M_derecha){
   8292 21 E5 69      [10] 3017 	ld	hl, #_cu + 7
   8295 6E            [ 7] 3018 	ld	l,(hl)
   8296 7D            [ 4] 3019 	ld	a,l
   8297 B7            [ 4] 3020 	or	a, a
   8298 20 1E         [12] 3021 	jr	NZ,00122$
                           3022 ;src/main.c:673: if(checkKnifeCollision(M_derecha, G_KNIFEX_0_W + 1, 0)){
   829A C5            [11] 3023 	push	bc
   829B D5            [11] 3024 	push	de
   829C 21 05 00      [10] 3025 	ld	hl,#0x0005
   829F E5            [11] 3026 	push	hl
   82A0 2E 00         [ 7] 3027 	ld	l, #0x00
   82A2 E5            [11] 3028 	push	hl
   82A3 CD 60 82      [17] 3029 	call	_checkKnifeCollision
   82A6 F1            [10] 3030 	pop	af
   82A7 F1            [10] 3031 	pop	af
   82A8 D1            [10] 3032 	pop	de
   82A9 C1            [10] 3033 	pop	bc
   82AA 7D            [ 4] 3034 	ld	a,l
   82AB B7            [ 4] 3035 	or	a, a
   82AC 28 07         [12] 3036 	jr	Z,00102$
                           3037 ;src/main.c:674: cu.mover = SI;
   82AE 3E 01         [ 7] 3038 	ld	a,#0x01
   82B0 12            [ 7] 3039 	ld	(de),a
                           3040 ;src/main.c:675: cu.x++;
   82B1 0A            [ 7] 3041 	ld	a,(bc)
   82B2 3C            [ 4] 3042 	inc	a
   82B3 02            [ 7] 3043 	ld	(bc),a
   82B4 C9            [10] 3044 	ret
   82B5                    3045 00102$:
                           3046 ;src/main.c:678: cu.mover=NO;
   82B5 AF            [ 4] 3047 	xor	a, a
   82B6 12            [ 7] 3048 	ld	(de),a
   82B7 C9            [10] 3049 	ret
   82B8                    3050 00122$:
                           3051 ;src/main.c:681: else if(cu.direccion == M_izquierda){
   82B8 7D            [ 4] 3052 	ld	a,l
   82B9 3D            [ 4] 3053 	dec	a
   82BA 20 1F         [12] 3054 	jr	NZ,00119$
                           3055 ;src/main.c:682: if(checkKnifeCollision(M_derecha, -1, 0)){
   82BC C5            [11] 3056 	push	bc
   82BD D5            [11] 3057 	push	de
   82BE 21 FF 00      [10] 3058 	ld	hl,#0x00FF
   82C1 E5            [11] 3059 	push	hl
   82C2 2E 00         [ 7] 3060 	ld	l, #0x00
   82C4 E5            [11] 3061 	push	hl
   82C5 CD 60 82      [17] 3062 	call	_checkKnifeCollision
   82C8 F1            [10] 3063 	pop	af
   82C9 F1            [10] 3064 	pop	af
   82CA D1            [10] 3065 	pop	de
   82CB C1            [10] 3066 	pop	bc
   82CC 7D            [ 4] 3067 	ld	a,l
   82CD B7            [ 4] 3068 	or	a, a
   82CE 28 08         [12] 3069 	jr	Z,00105$
                           3070 ;src/main.c:683: cu.mover = SI;
   82D0 3E 01         [ 7] 3071 	ld	a,#0x01
   82D2 12            [ 7] 3072 	ld	(de),a
                           3073 ;src/main.c:684: cu.x--;
   82D3 0A            [ 7] 3074 	ld	a,(bc)
   82D4 C6 FF         [ 7] 3075 	add	a,#0xFF
   82D6 02            [ 7] 3076 	ld	(bc),a
   82D7 C9            [10] 3077 	ret
   82D8                    3078 00105$:
                           3079 ;src/main.c:686: cu.mover=NO;
   82D8 AF            [ 4] 3080 	xor	a, a
   82D9 12            [ 7] 3081 	ld	(de),a
   82DA C9            [10] 3082 	ret
   82DB                    3083 00119$:
                           3084 ;src/main.c:692: cu.y--;
   82DB 03            [ 6] 3085 	inc	bc
                           3086 ;src/main.c:689: else if(cu.direccion == M_arriba){
   82DC 7D            [ 4] 3087 	ld	a,l
   82DD D6 02         [ 7] 3088 	sub	a, #0x02
   82DF 20 22         [12] 3089 	jr	NZ,00116$
                           3090 ;src/main.c:690: if(checkKnifeCollision(M_derecha, 0, -2)){
   82E1 C5            [11] 3091 	push	bc
   82E2 D5            [11] 3092 	push	de
   82E3 21 00 FE      [10] 3093 	ld	hl,#0xFE00
   82E6 E5            [11] 3094 	push	hl
   82E7 26 00         [ 7] 3095 	ld	h, #0x00
   82E9 E5            [11] 3096 	push	hl
   82EA CD 60 82      [17] 3097 	call	_checkKnifeCollision
   82ED F1            [10] 3098 	pop	af
   82EE F1            [10] 3099 	pop	af
   82EF D1            [10] 3100 	pop	de
   82F0 C1            [10] 3101 	pop	bc
   82F1 7D            [ 4] 3102 	ld	a,l
   82F2 B7            [ 4] 3103 	or	a, a
   82F3 28 0B         [12] 3104 	jr	Z,00108$
                           3105 ;src/main.c:691: cu.mover = SI;
   82F5 3E 01         [ 7] 3106 	ld	a,#0x01
   82F7 12            [ 7] 3107 	ld	(de),a
                           3108 ;src/main.c:692: cu.y--;
   82F8 0A            [ 7] 3109 	ld	a,(bc)
   82F9 C6 FF         [ 7] 3110 	add	a,#0xFF
   82FB 02            [ 7] 3111 	ld	(bc),a
                           3112 ;src/main.c:693: cu.y--;
   82FC C6 FF         [ 7] 3113 	add	a,#0xFF
   82FE 02            [ 7] 3114 	ld	(bc),a
   82FF C9            [10] 3115 	ret
   8300                    3116 00108$:
                           3117 ;src/main.c:696: cu.mover=NO;
   8300 AF            [ 4] 3118 	xor	a, a
   8301 12            [ 7] 3119 	ld	(de),a
   8302 C9            [10] 3120 	ret
   8303                    3121 00116$:
                           3122 ;src/main.c:699: else if(cu.direccion == M_abajo){
   8303 7D            [ 4] 3123 	ld	a,l
   8304 D6 03         [ 7] 3124 	sub	a, #0x03
   8306 C0            [11] 3125 	ret	NZ
                           3126 ;src/main.c:700: if(checkKnifeCollision(M_derecha, 0, G_KNIFEY_0_H + 2)){
   8307 C5            [11] 3127 	push	bc
   8308 D5            [11] 3128 	push	de
   8309 21 00 0A      [10] 3129 	ld	hl,#0x0A00
   830C E5            [11] 3130 	push	hl
   830D 26 00         [ 7] 3131 	ld	h, #0x00
   830F E5            [11] 3132 	push	hl
   8310 CD 60 82      [17] 3133 	call	_checkKnifeCollision
   8313 F1            [10] 3134 	pop	af
   8314 F1            [10] 3135 	pop	af
   8315 D1            [10] 3136 	pop	de
   8316 C1            [10] 3137 	pop	bc
   8317 7D            [ 4] 3138 	ld	a,l
   8318 B7            [ 4] 3139 	or	a, a
   8319 28 09         [12] 3140 	jr	Z,00111$
                           3141 ;src/main.c:701: cu.mover = SI;
   831B 3E 01         [ 7] 3142 	ld	a,#0x01
   831D 12            [ 7] 3143 	ld	(de),a
                           3144 ;src/main.c:702: cu.y++;
   831E 0A            [ 7] 3145 	ld	a,(bc)
   831F 3C            [ 4] 3146 	inc	a
   8320 02            [ 7] 3147 	ld	(bc),a
                           3148 ;src/main.c:703: cu.y++;
   8321 3C            [ 4] 3149 	inc	a
   8322 02            [ 7] 3150 	ld	(bc),a
   8323 C9            [10] 3151 	ret
   8324                    3152 00111$:
                           3153 ;src/main.c:706: cu.mover=NO;
   8324 AF            [ 4] 3154 	xor	a, a
   8325 12            [ 7] 3155 	ld	(de),a
   8326 C9            [10] 3156 	ret
                           3157 ;src/main.c:712: void barraPuntuacionInicial(){
                           3158 ;	---------------------------------
                           3159 ; Function barraPuntuacionInicial
                           3160 ; ---------------------------------
   8327                    3161 _barraPuntuacionInicial::
                           3162 ;src/main.c:717: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   8327 21 00 02      [10] 3163 	ld	hl,#0x0200
   832A E5            [11] 3164 	push	hl
   832B 26 C0         [ 7] 3165 	ld	h, #0xC0
   832D E5            [11] 3166 	push	hl
   832E CD 69 64      [17] 3167 	call	_cpct_getScreenPtr
   8331 4D            [ 4] 3168 	ld	c,l
   8332 44            [ 4] 3169 	ld	b,h
                           3170 ;src/main.c:718: cpct_drawStringM0("SCORE", memptr, 1, 0);
   8333 21 01 00      [10] 3171 	ld	hl,#0x0001
   8336 E5            [11] 3172 	push	hl
   8337 C5            [11] 3173 	push	bc
   8338 21 CF 83      [10] 3174 	ld	hl,#___str_1
   833B E5            [11] 3175 	push	hl
   833C CD 99 58      [17] 3176 	call	_cpct_drawStringM0
   833F 21 06 00      [10] 3177 	ld	hl,#6
   8342 39            [11] 3178 	add	hl,sp
   8343 F9            [ 6] 3179 	ld	sp,hl
                           3180 ;src/main.c:719: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   8344 21 00 0E      [10] 3181 	ld	hl,#0x0E00
   8347 E5            [11] 3182 	push	hl
   8348 26 C0         [ 7] 3183 	ld	h, #0xC0
   834A E5            [11] 3184 	push	hl
   834B CD 69 64      [17] 3185 	call	_cpct_getScreenPtr
   834E 4D            [ 4] 3186 	ld	c,l
   834F 44            [ 4] 3187 	ld	b,h
                           3188 ;src/main.c:720: cpct_drawStringM0("00000", memptr, 15, 0);
   8350 21 0F 00      [10] 3189 	ld	hl,#0x000F
   8353 E5            [11] 3190 	push	hl
   8354 C5            [11] 3191 	push	bc
   8355 21 D5 83      [10] 3192 	ld	hl,#___str_2
   8358 E5            [11] 3193 	push	hl
   8359 CD 99 58      [17] 3194 	call	_cpct_drawStringM0
   835C 21 06 00      [10] 3195 	ld	hl,#6
   835F 39            [11] 3196 	add	hl,sp
   8360 F9            [ 6] 3197 	ld	sp,hl
                           3198 ;src/main.c:723: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 14);
   8361 21 1A 0E      [10] 3199 	ld	hl,#0x0E1A
   8364 E5            [11] 3200 	push	hl
   8365 21 00 C0      [10] 3201 	ld	hl,#0xC000
   8368 E5            [11] 3202 	push	hl
   8369 CD 69 64      [17] 3203 	call	_cpct_getScreenPtr
   836C 4D            [ 4] 3204 	ld	c,l
   836D 44            [ 4] 3205 	ld	b,h
                           3206 ;src/main.c:724: cpct_drawStringM0("ROBOBIT", memptr, 3, 0);
   836E 21 03 00      [10] 3207 	ld	hl,#0x0003
   8371 E5            [11] 3208 	push	hl
   8372 C5            [11] 3209 	push	bc
   8373 21 DB 83      [10] 3210 	ld	hl,#___str_3
   8376 E5            [11] 3211 	push	hl
   8377 CD 99 58      [17] 3212 	call	_cpct_drawStringM0
   837A 21 06 00      [10] 3213 	ld	hl,#6
   837D 39            [11] 3214 	add	hl,sp
   837E F9            [ 6] 3215 	ld	sp,hl
                           3216 ;src/main.c:726: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   837F 21 3C 02      [10] 3217 	ld	hl,#0x023C
   8382 E5            [11] 3218 	push	hl
   8383 21 00 C0      [10] 3219 	ld	hl,#0xC000
   8386 E5            [11] 3220 	push	hl
   8387 CD 69 64      [17] 3221 	call	_cpct_getScreenPtr
   838A 4D            [ 4] 3222 	ld	c,l
   838B 44            [ 4] 3223 	ld	b,h
                           3224 ;src/main.c:727: cpct_drawStringM0("LIVES", memptr, 1, 0);
   838C 21 01 00      [10] 3225 	ld	hl,#0x0001
   838F E5            [11] 3226 	push	hl
   8390 C5            [11] 3227 	push	bc
   8391 21 E3 83      [10] 3228 	ld	hl,#___str_4
   8394 E5            [11] 3229 	push	hl
   8395 CD 99 58      [17] 3230 	call	_cpct_drawStringM0
   8398 21 06 00      [10] 3231 	ld	hl,#6
   839B 39            [11] 3232 	add	hl,sp
   839C F9            [ 6] 3233 	ld	sp,hl
                           3234 ;src/main.c:729: for(i=0; i<5; i++){
   839D 01 00 00      [10] 3235 	ld	bc,#0x0000
   83A0                    3236 00102$:
                           3237 ;src/main.c:730: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   83A0 79            [ 4] 3238 	ld	a,c
   83A1 87            [ 4] 3239 	add	a, a
   83A2 87            [ 4] 3240 	add	a, a
   83A3 C6 3C         [ 7] 3241 	add	a, #0x3C
   83A5 57            [ 4] 3242 	ld	d,a
   83A6 C5            [11] 3243 	push	bc
   83A7 3E 0E         [ 7] 3244 	ld	a,#0x0E
   83A9 F5            [11] 3245 	push	af
   83AA 33            [ 6] 3246 	inc	sp
   83AB D5            [11] 3247 	push	de
   83AC 33            [ 6] 3248 	inc	sp
   83AD 21 00 C0      [10] 3249 	ld	hl,#0xC000
   83B0 E5            [11] 3250 	push	hl
   83B1 CD 69 64      [17] 3251 	call	_cpct_getScreenPtr
   83B4 EB            [ 4] 3252 	ex	de,hl
   83B5 21 03 06      [10] 3253 	ld	hl,#0x0603
   83B8 E5            [11] 3254 	push	hl
   83B9 D5            [11] 3255 	push	de
   83BA 21 60 48      [10] 3256 	ld	hl,#_g_heart
   83BD E5            [11] 3257 	push	hl
   83BE CD BD 58      [17] 3258 	call	_cpct_drawSprite
   83C1 C1            [10] 3259 	pop	bc
                           3260 ;src/main.c:729: for(i=0; i<5; i++){
   83C2 03            [ 6] 3261 	inc	bc
   83C3 79            [ 4] 3262 	ld	a,c
   83C4 D6 05         [ 7] 3263 	sub	a, #0x05
   83C6 78            [ 4] 3264 	ld	a,b
   83C7 17            [ 4] 3265 	rla
   83C8 3F            [ 4] 3266 	ccf
   83C9 1F            [ 4] 3267 	rra
   83CA DE 80         [ 7] 3268 	sbc	a, #0x80
   83CC 38 D2         [12] 3269 	jr	C,00102$
   83CE C9            [10] 3270 	ret
   83CF                    3271 ___str_1:
   83CF 53 43 4F 52 45     3272 	.ascii "SCORE"
   83D4 00                 3273 	.db 0x00
   83D5                    3274 ___str_2:
   83D5 30 30 30 30 30     3275 	.ascii "00000"
   83DA 00                 3276 	.db 0x00
   83DB                    3277 ___str_3:
   83DB 52 4F 42 4F 42 49  3278 	.ascii "ROBOBIT"
        54
   83E2 00                 3279 	.db 0x00
   83E3                    3280 ___str_4:
   83E3 4C 49 56 45 53     3281 	.ascii "LIVES"
   83E8 00                 3282 	.db 0x00
                           3283 ;src/main.c:735: void borrarPantallaArriba(u8 x, u8 y, u8 ancho, u8 alto){
                           3284 ;	---------------------------------
                           3285 ; Function borrarPantallaArriba
                           3286 ; ---------------------------------
   83E9                    3287 _borrarPantallaArriba::
   83E9 DD E5         [15] 3288 	push	ix
   83EB DD 21 00 00   [14] 3289 	ld	ix,#0
   83EF DD 39         [15] 3290 	add	ix,sp
                           3291 ;src/main.c:738: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   83F1 DD 66 05      [19] 3292 	ld	h,5 (ix)
   83F4 DD 6E 04      [19] 3293 	ld	l,4 (ix)
   83F7 E5            [11] 3294 	push	hl
   83F8 21 00 C0      [10] 3295 	ld	hl,#0xC000
   83FB E5            [11] 3296 	push	hl
   83FC CD 69 64      [17] 3297 	call	_cpct_getScreenPtr
   83FF 4D            [ 4] 3298 	ld	c,l
   8400 44            [ 4] 3299 	ld	b,h
                           3300 ;src/main.c:739: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra la mitad derecha
   8401 DD 66 07      [19] 3301 	ld	h,7 (ix)
   8404 DD 6E 06      [19] 3302 	ld	l,6 (ix)
   8407 E5            [11] 3303 	push	hl
   8408 AF            [ 4] 3304 	xor	a, a
   8409 F5            [11] 3305 	push	af
   840A 33            [ 6] 3306 	inc	sp
   840B C5            [11] 3307 	push	bc
   840C CD 8F 63      [17] 3308 	call	_cpct_drawSolidBox
   840F F1            [10] 3309 	pop	af
   8410 F1            [10] 3310 	pop	af
   8411 33            [ 6] 3311 	inc	sp
                           3312 ;src/main.c:740: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   8412 DD 7E 04      [19] 3313 	ld	a,4 (ix)
   8415 C6 28         [ 7] 3314 	add	a, #0x28
   8417 47            [ 4] 3315 	ld	b,a
   8418 DD 7E 05      [19] 3316 	ld	a,5 (ix)
   841B F5            [11] 3317 	push	af
   841C 33            [ 6] 3318 	inc	sp
   841D C5            [11] 3319 	push	bc
   841E 33            [ 6] 3320 	inc	sp
   841F 21 00 C0      [10] 3321 	ld	hl,#0xC000
   8422 E5            [11] 3322 	push	hl
   8423 CD 69 64      [17] 3323 	call	_cpct_getScreenPtr
   8426 4D            [ 4] 3324 	ld	c,l
   8427 44            [ 4] 3325 	ld	b,h
                           3326 ;src/main.c:741: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra la mitad izquierda
   8428 DD 66 07      [19] 3327 	ld	h,7 (ix)
   842B DD 6E 06      [19] 3328 	ld	l,6 (ix)
   842E E5            [11] 3329 	push	hl
   842F AF            [ 4] 3330 	xor	a, a
   8430 F5            [11] 3331 	push	af
   8431 33            [ 6] 3332 	inc	sp
   8432 C5            [11] 3333 	push	bc
   8433 CD 8F 63      [17] 3334 	call	_cpct_drawSolidBox
   8436 F1            [10] 3335 	pop	af
   8437 F1            [10] 3336 	pop	af
   8438 33            [ 6] 3337 	inc	sp
   8439 DD E1         [14] 3338 	pop	ix
   843B C9            [10] 3339 	ret
                           3340 ;src/main.c:744: void menuInicio(){
                           3341 ;	---------------------------------
                           3342 ; Function menuInicio
                           3343 ; ---------------------------------
   843C                    3344 _menuInicio::
                           3345 ;src/main.c:748: cpct_clearScreen(0);
   843C 21 00 40      [10] 3346 	ld	hl,#0x4000
   843F E5            [11] 3347 	push	hl
   8440 AF            [ 4] 3348 	xor	a, a
   8441 F5            [11] 3349 	push	af
   8442 33            [ 6] 3350 	inc	sp
   8443 26 C0         [ 7] 3351 	ld	h, #0xC0
   8445 E5            [11] 3352 	push	hl
   8446 CD 48 5B      [17] 3353 	call	_cpct_memset
                           3354 ;src/main.c:750: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   8449 21 1A 0F      [10] 3355 	ld	hl,#0x0F1A
   844C E5            [11] 3356 	push	hl
   844D 21 00 C0      [10] 3357 	ld	hl,#0xC000
   8450 E5            [11] 3358 	push	hl
   8451 CD 69 64      [17] 3359 	call	_cpct_getScreenPtr
   8454 4D            [ 4] 3360 	ld	c,l
   8455 44            [ 4] 3361 	ld	b,h
                           3362 ;src/main.c:751: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   8456 21 04 00      [10] 3363 	ld	hl,#0x0004
   8459 E5            [11] 3364 	push	hl
   845A C5            [11] 3365 	push	bc
   845B 21 EF 84      [10] 3366 	ld	hl,#___str_5
   845E E5            [11] 3367 	push	hl
   845F CD 99 58      [17] 3368 	call	_cpct_drawStringM0
   8462 21 06 00      [10] 3369 	ld	hl,#6
   8465 39            [11] 3370 	add	hl,sp
   8466 F9            [ 6] 3371 	ld	sp,hl
                           3372 ;src/main.c:753: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   8467 21 28 6E      [10] 3373 	ld	hl,#0x6E28
   846A E5            [11] 3374 	push	hl
   846B 21 F0 F0      [10] 3375 	ld	hl,#0xF0F0
   846E E5            [11] 3376 	push	hl
   846F 21 00 26      [10] 3377 	ld	hl,#_g_text_0
   8472 E5            [11] 3378 	push	hl
   8473 CD BD 58      [17] 3379 	call	_cpct_drawSprite
                           3380 ;src/main.c:754: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   8476 21 28 6E      [10] 3381 	ld	hl,#0x6E28
   8479 E5            [11] 3382 	push	hl
   847A 21 18 F1      [10] 3383 	ld	hl,#0xF118
   847D E5            [11] 3384 	push	hl
   847E 21 30 37      [10] 3385 	ld	hl,#_g_text_1
   8481 E5            [11] 3386 	push	hl
   8482 CD BD 58      [17] 3387 	call	_cpct_drawSprite
                           3388 ;src/main.c:777: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   8485 21 08 A0      [10] 3389 	ld	hl,#0xA008
   8488 E5            [11] 3390 	push	hl
   8489 21 00 C0      [10] 3391 	ld	hl,#0xC000
   848C E5            [11] 3392 	push	hl
   848D CD 69 64      [17] 3393 	call	_cpct_getScreenPtr
   8490 4D            [ 4] 3394 	ld	c,l
   8491 44            [ 4] 3395 	ld	b,h
                           3396 ;src/main.c:778: cpct_drawStringM0("TO START PRESS S", memptr, 4, 0);
   8492 21 04 00      [10] 3397 	ld	hl,#0x0004
   8495 E5            [11] 3398 	push	hl
   8496 C5            [11] 3399 	push	bc
   8497 21 F7 84      [10] 3400 	ld	hl,#___str_6
   849A E5            [11] 3401 	push	hl
   849B CD 99 58      [17] 3402 	call	_cpct_drawStringM0
   849E 21 06 00      [10] 3403 	ld	hl,#6
   84A1 39            [11] 3404 	add	hl,sp
   84A2 F9            [ 6] 3405 	ld	sp,hl
                           3406 ;src/main.c:780: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 170); // centrado en horizontal y abajo en vertical
   84A3 21 0A AA      [10] 3407 	ld	hl,#0xAA0A
   84A6 E5            [11] 3408 	push	hl
   84A7 21 00 C0      [10] 3409 	ld	hl,#0xC000
   84AA E5            [11] 3410 	push	hl
   84AB CD 69 64      [17] 3411 	call	_cpct_getScreenPtr
   84AE 4D            [ 4] 3412 	ld	c,l
   84AF 44            [ 4] 3413 	ld	b,h
                           3414 ;src/main.c:781: cpct_drawStringM0("TO MENU PRESS M", memptr, 4, 0);
   84B0 21 04 00      [10] 3415 	ld	hl,#0x0004
   84B3 E5            [11] 3416 	push	hl
   84B4 C5            [11] 3417 	push	bc
   84B5 21 08 85      [10] 3418 	ld	hl,#___str_7
   84B8 E5            [11] 3419 	push	hl
   84B9 CD 99 58      [17] 3420 	call	_cpct_drawStringM0
   84BC 21 06 00      [10] 3421 	ld	hl,#6
   84BF 39            [11] 3422 	add	hl,sp
   84C0 F9            [ 6] 3423 	ld	sp,hl
                           3424 ;src/main.c:784: do{
   84C1                    3425 00106$:
                           3426 ;src/main.c:785: cpct_scanKeyboard_f();
   84C1 CD 23 58      [17] 3427 	call	_cpct_scanKeyboard_f
                           3428 ;src/main.c:789: if(cpct_isKeyPressed(Key_M)){
   84C4 21 04 40      [10] 3429 	ld	hl,#0x4004
   84C7 CD 17 58      [17] 3430 	call	_cpct_isKeyPressed
   84CA 7D            [ 4] 3431 	ld	a,l
   84CB B7            [ 4] 3432 	or	a, a
   84CC 28 0D         [12] 3433 	jr	Z,00107$
                           3434 ;src/main.c:790: cpct_scanKeyboard_f();
   84CE CD 23 58      [17] 3435 	call	_cpct_scanKeyboard_f
                           3436 ;src/main.c:791: do{
   84D1                    3437 00101$:
                           3438 ;src/main.c:793: } while(!cpct_isKeyPressed(Key_S));
   84D1 21 07 10      [10] 3439 	ld	hl,#0x1007
   84D4 CD 17 58      [17] 3440 	call	_cpct_isKeyPressed
   84D7 7D            [ 4] 3441 	ld	a,l
   84D8 B7            [ 4] 3442 	or	a, a
   84D9 28 F6         [12] 3443 	jr	Z,00101$
   84DB                    3444 00107$:
                           3445 ;src/main.c:795: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   84DB 21 07 10      [10] 3446 	ld	hl,#0x1007
   84DE CD 17 58      [17] 3447 	call	_cpct_isKeyPressed
   84E1 7D            [ 4] 3448 	ld	a,l
   84E2 B7            [ 4] 3449 	or	a, a
   84E3 C0            [11] 3450 	ret	NZ
   84E4 21 04 40      [10] 3451 	ld	hl,#0x4004
   84E7 CD 17 58      [17] 3452 	call	_cpct_isKeyPressed
   84EA 7D            [ 4] 3453 	ld	a,l
   84EB B7            [ 4] 3454 	or	a, a
   84EC 28 D3         [12] 3455 	jr	Z,00106$
   84EE C9            [10] 3456 	ret
   84EF                    3457 ___str_5:
   84EF 52 4F 42 4F 42 49  3458 	.ascii "ROBOBIT"
        54
   84F6 00                 3459 	.db 0x00
   84F7                    3460 ___str_6:
   84F7 54 4F 20 53 54 41  3461 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   8507 00                 3462 	.db 0x00
   8508                    3463 ___str_7:
   8508 54 4F 20 4D 45 4E  3464 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   8517 00                 3465 	.db 0x00
                           3466 ;src/main.c:798: void inicializarCPC() {
                           3467 ;	---------------------------------
                           3468 ; Function inicializarCPC
                           3469 ; ---------------------------------
   8518                    3470 _inicializarCPC::
                           3471 ;src/main.c:799: cpct_disableFirmware();
   8518 CD 7F 63      [17] 3472 	call	_cpct_disableFirmware
                           3473 ;src/main.c:800: cpct_setVideoMode(0);
   851B 2E 00         [ 7] 3474 	ld	l,#0x00
   851D CD 2A 5B      [17] 3475 	call	_cpct_setVideoMode
                           3476 ;src/main.c:801: cpct_setBorder(HW_BLACK);
   8520 21 10 14      [10] 3477 	ld	hl,#0x1410
   8523 E5            [11] 3478 	push	hl
   8524 CD 8D 58      [17] 3479 	call	_cpct_setPALColour
                           3480 ;src/main.c:802: cpct_setPalette(g_palette, 16);
   8527 21 10 00      [10] 3481 	ld	hl,#0x0010
   852A E5            [11] 3482 	push	hl
   852B 21 98 4A      [10] 3483 	ld	hl,#_g_palette
   852E E5            [11] 3484 	push	hl
   852F CD 00 58      [17] 3485 	call	_cpct_setPalette
                           3486 ;src/main.c:803: cpct_akp_musicInit(G_song);
   8532 21 00 0F      [10] 3487 	ld	hl,#_G_song
   8535 E5            [11] 3488 	push	hl
   8536 CD 5B 62      [17] 3489 	call	_cpct_akp_musicInit
   8539 F1            [10] 3490 	pop	af
   853A C9            [10] 3491 	ret
                           3492 ;src/main.c:806: void inicializarEnemy() {
                           3493 ;	---------------------------------
                           3494 ; Function inicializarEnemy
                           3495 ; ---------------------------------
   853B                    3496 _inicializarEnemy::
   853B DD E5         [15] 3497 	push	ix
   853D DD 21 00 00   [14] 3498 	ld	ix,#0
   8541 DD 39         [15] 3499 	add	ix,sp
   8543 21 F9 FF      [10] 3500 	ld	hl,#-7
   8546 39            [11] 3501 	add	hl,sp
   8547 F9            [ 6] 3502 	ld	sp,hl
                           3503 ;src/main.c:817: actual = enemy;
   8548 01 C6 64      [10] 3504 	ld	bc,#_enemy+0
                           3505 ;src/main.c:818: while(--i){
   854B DD 36 F9 02   [19] 3506 	ld	-7 (ix),#0x02
   854F                    3507 00101$:
   854F DD 35 F9      [23] 3508 	dec	-7 (ix)
   8552 DD 7E F9      [19] 3509 	ld	a,-7 (ix)
   8555 B7            [ 4] 3510 	or	a, a
   8556 CA 2C 86      [10] 3511 	jp	Z,00104$
                           3512 ;src/main.c:819: actual->x = actual->px = spawnX[i];
   8559 59            [ 4] 3513 	ld	e, c
   855A 50            [ 4] 3514 	ld	d, b
   855B 13            [ 6] 3515 	inc	de
   855C 13            [ 6] 3516 	inc	de
   855D 3E 8F         [ 7] 3517 	ld	a,#<(_spawnX)
   855F DD 86 F9      [19] 3518 	add	a, -7 (ix)
   8562 DD 77 FC      [19] 3519 	ld	-4 (ix),a
   8565 3E 72         [ 7] 3520 	ld	a,#>(_spawnX)
   8567 CE 00         [ 7] 3521 	adc	a, #0x00
   8569 DD 77 FD      [19] 3522 	ld	-3 (ix),a
   856C DD 6E FC      [19] 3523 	ld	l,-4 (ix)
   856F DD 66 FD      [19] 3524 	ld	h,-3 (ix)
   8572 7E            [ 7] 3525 	ld	a,(hl)
   8573 DD 77 FA      [19] 3526 	ld	-6 (ix), a
   8576 12            [ 7] 3527 	ld	(de),a
   8577 DD 7E FA      [19] 3528 	ld	a,-6 (ix)
   857A 02            [ 7] 3529 	ld	(bc),a
                           3530 ;src/main.c:820: actual->y = actual->py = spawnY[i];
   857B 59            [ 4] 3531 	ld	e, c
   857C 50            [ 4] 3532 	ld	d, b
   857D 13            [ 6] 3533 	inc	de
   857E 21 03 00      [10] 3534 	ld	hl,#0x0003
   8581 09            [11] 3535 	add	hl,bc
   8582 DD 75 FE      [19] 3536 	ld	-2 (ix),l
   8585 DD 74 FF      [19] 3537 	ld	-1 (ix),h
   8588 FD 21 94 72   [14] 3538 	ld	iy,#_spawnY
   858C C5            [11] 3539 	push	bc
   858D DD 4E F9      [19] 3540 	ld	c,-7 (ix)
   8590 06 00         [ 7] 3541 	ld	b,#0x00
   8592 FD 09         [15] 3542 	add	iy, bc
   8594 C1            [10] 3543 	pop	bc
   8595 FD 7E 00      [19] 3544 	ld	a, 0 (iy)
   8598 DD 77 FB      [19] 3545 	ld	-5 (ix),a
   859B DD 6E FE      [19] 3546 	ld	l,-2 (ix)
   859E DD 66 FF      [19] 3547 	ld	h,-1 (ix)
   85A1 DD 7E FB      [19] 3548 	ld	a,-5 (ix)
   85A4 77            [ 7] 3549 	ld	(hl),a
   85A5 DD 7E FB      [19] 3550 	ld	a,-5 (ix)
   85A8 12            [ 7] 3551 	ld	(de),a
                           3552 ;src/main.c:821: actual->mover  = NO;
   85A9 21 06 00      [10] 3553 	ld	hl,#0x0006
   85AC 09            [11] 3554 	add	hl,bc
   85AD 36 00         [10] 3555 	ld	(hl),#0x00
                           3556 ;src/main.c:822: actual->mira   = M_abajo;
   85AF 21 07 00      [10] 3557 	ld	hl,#0x0007
   85B2 09            [11] 3558 	add	hl,bc
   85B3 36 03         [10] 3559 	ld	(hl),#0x03
                           3560 ;src/main.c:823: actual->sprite = g_enemy;
   85B5 21 04 00      [10] 3561 	ld	hl,#0x0004
   85B8 09            [11] 3562 	add	hl,bc
   85B9 36 72         [10] 3563 	ld	(hl),#<(_g_enemy)
   85BB 23            [ 6] 3564 	inc	hl
   85BC 36 48         [10] 3565 	ld	(hl),#>(_g_enemy)
                           3566 ;src/main.c:824: actual->muerto = NO;
   85BE 21 08 00      [10] 3567 	ld	hl,#0x0008
   85C1 09            [11] 3568 	add	hl,bc
   85C2 36 00         [10] 3569 	ld	(hl),#0x00
                           3570 ;src/main.c:825: actual->muertes = 0;
   85C4 21 0A 00      [10] 3571 	ld	hl,#0x000A
   85C7 09            [11] 3572 	add	hl,bc
   85C8 36 00         [10] 3573 	ld	(hl),#0x00
                           3574 ;src/main.c:826: actual->patrolling = SI;
   85CA 21 0B 00      [10] 3575 	ld	hl,#0x000B
   85CD 09            [11] 3576 	add	hl,bc
   85CE 36 01         [10] 3577 	ld	(hl),#0x01
                           3578 ;src/main.c:827: actual->onPathPatrol = SI;
   85D0 21 0C 00      [10] 3579 	ld	hl,#0x000C
   85D3 09            [11] 3580 	add	hl,bc
   85D4 36 01         [10] 3581 	ld	(hl),#0x01
                           3582 ;src/main.c:828: actual->reversePatrol = NO;
   85D6 21 0D 00      [10] 3583 	ld	hl,#0x000D
   85D9 09            [11] 3584 	add	hl,bc
   85DA 36 00         [10] 3585 	ld	(hl),#0x00
                           3586 ;src/main.c:829: actual->iter = 0;
   85DC 21 0F 00      [10] 3587 	ld	hl,#0x000F
   85DF 09            [11] 3588 	add	hl,bc
   85E0 36 00         [10] 3589 	ld	(hl),#0x00
                           3590 ;src/main.c:830: actual->lastIter = 0;
   85E2 21 10 00      [10] 3591 	ld	hl,#0x0010
   85E5 09            [11] 3592 	add	hl,bc
   85E6 36 00         [10] 3593 	ld	(hl),#0x00
                           3594 ;src/main.c:831: actual->seen = 0;
   85E8 21 12 00      [10] 3595 	ld	hl,#0x0012
   85EB 09            [11] 3596 	add	hl,bc
   85EC 36 00         [10] 3597 	ld	(hl),#0x00
                           3598 ;src/main.c:832: actual->found = 0;
   85EE 21 13 00      [10] 3599 	ld	hl,#0x0013
   85F1 09            [11] 3600 	add	hl,bc
   85F2 36 00         [10] 3601 	ld	(hl),#0x00
                           3602 ;src/main.c:833: pathFinding(actual->x, actual->y, spawnX[i] - 20, spawnY[i], actual, mapa); // calculo rutas de patrulla
   85F4 FD 5E 00      [19] 3603 	ld	e, 0 (iy)
   85F7 DD 6E FC      [19] 3604 	ld	l,-4 (ix)
   85FA DD 66 FD      [19] 3605 	ld	h,-3 (ix)
   85FD 7E            [ 7] 3606 	ld	a,(hl)
   85FE C6 EC         [ 7] 3607 	add	a,#0xEC
   8600 57            [ 4] 3608 	ld	d,a
   8601 C5            [11] 3609 	push	bc
   8602 2A E9 69      [16] 3610 	ld	hl,(_mapa)
   8605 E5            [11] 3611 	push	hl
   8606 C5            [11] 3612 	push	bc
   8607 7B            [ 4] 3613 	ld	a,e
   8608 F5            [11] 3614 	push	af
   8609 33            [ 6] 3615 	inc	sp
   860A D5            [11] 3616 	push	de
   860B 33            [ 6] 3617 	inc	sp
   860C DD 66 FB      [19] 3618 	ld	h,-5 (ix)
   860F DD 6E FA      [19] 3619 	ld	l,-6 (ix)
   8612 E5            [11] 3620 	push	hl
   8613 CD B2 54      [17] 3621 	call	_pathFinding
   8616 21 08 00      [10] 3622 	ld	hl,#8
   8619 39            [11] 3623 	add	hl,sp
   861A F9            [ 6] 3624 	ld	sp,hl
   861B C1            [10] 3625 	pop	bc
                           3626 ;src/main.c:856: dibujarEnemigo(actual);
   861C C5            [11] 3627 	push	bc
   861D C5            [11] 3628 	push	bc
   861E CD 14 75      [17] 3629 	call	_dibujarEnemigo
   8621 F1            [10] 3630 	pop	af
   8622 C1            [10] 3631 	pop	bc
                           3632 ;src/main.c:858: ++actual;
   8623 21 44 01      [10] 3633 	ld	hl,#0x0144
   8626 09            [11] 3634 	add	hl,bc
   8627 4D            [ 4] 3635 	ld	c,l
   8628 44            [ 4] 3636 	ld	b,h
   8629 C3 4F 85      [10] 3637 	jp	00101$
   862C                    3638 00104$:
   862C DD F9         [10] 3639 	ld	sp, ix
   862E DD E1         [14] 3640 	pop	ix
   8630 C9            [10] 3641 	ret
                           3642 ;src/main.c:862: void inicializarJuego() {
                           3643 ;	---------------------------------
                           3644 ; Function inicializarJuego
                           3645 ; ---------------------------------
   8631                    3646 _inicializarJuego::
                           3647 ;src/main.c:864: iter = 0;
   8631 21 E8 69      [10] 3648 	ld	hl,#_iter + 0
   8634 36 00         [10] 3649 	ld	(hl), #0x00
                           3650 ;src/main.c:865: num_mapa = 0;
   8636 21 EB 69      [10] 3651 	ld	hl,#_num_mapa + 0
   8639 36 00         [10] 3652 	ld	(hl), #0x00
                           3653 ;src/main.c:866: mapa = mapas[num_mapa];
   863B 21 89 72      [10] 3654 	ld	hl, #_mapas + 0
   863E 7E            [ 7] 3655 	ld	a,(hl)
   863F FD 21 E9 69   [14] 3656 	ld	iy,#_mapa
   8643 FD 77 00      [19] 3657 	ld	0 (iy),a
   8646 23            [ 6] 3658 	inc	hl
   8647 7E            [ 7] 3659 	ld	a,(hl)
   8648 32 EA 69      [13] 3660 	ld	(#_mapa + 1),a
                           3661 ;src/main.c:867: cpct_etm_setTileset2x4(g_tileset);
   864B 21 E0 24      [10] 3662 	ld	hl,#_g_tileset
   864E CD F1 59      [17] 3663 	call	_cpct_etm_setTileset2x4
                           3664 ;src/main.c:869: dibujarMapa();
   8651 CD 73 72      [17] 3665 	call	_dibujarMapa
                           3666 ;src/main.c:871: borrarPantallaArriba(0, 0, 40, 1);
   8654 21 28 01      [10] 3667 	ld	hl,#0x0128
   8657 E5            [11] 3668 	push	hl
   8658 21 00 00      [10] 3669 	ld	hl,#0x0000
   865B E5            [11] 3670 	push	hl
   865C CD E9 83      [17] 3671 	call	_borrarPantallaArriba
   865F F1            [10] 3672 	pop	af
   8660 F1            [10] 3673 	pop	af
                           3674 ;src/main.c:872: barraPuntuacionInicial();
   8661 CD 27 83      [17] 3675 	call	_barraPuntuacionInicial
                           3676 ;src/main.c:875: prota.x = prota.px = 5;
   8664 21 D8 69      [10] 3677 	ld	hl,#(_prota + 0x0002)
   8667 36 05         [10] 3678 	ld	(hl),#0x05
   8669 21 D6 69      [10] 3679 	ld	hl,#_prota
   866C 36 05         [10] 3680 	ld	(hl),#0x05
                           3681 ;src/main.c:876: prota.y = prota.py = 76 + ORIGEN_MAPA_Y;
   866E 21 D9 69      [10] 3682 	ld	hl,#(_prota + 0x0003)
   8671 36 64         [10] 3683 	ld	(hl),#0x64
   8673 21 D7 69      [10] 3684 	ld	hl,#(_prota + 0x0001)
   8676 36 64         [10] 3685 	ld	(hl),#0x64
                           3686 ;src/main.c:877: prota.mover  = NO;
   8678 21 DC 69      [10] 3687 	ld	hl,#(_prota + 0x0006)
   867B 36 00         [10] 3688 	ld	(hl),#0x00
                           3689 ;src/main.c:878: prota.mira=M_derecha;
   867D 21 DD 69      [10] 3690 	ld	hl,#(_prota + 0x0007)
   8680 36 00         [10] 3691 	ld	(hl),#0x00
                           3692 ;src/main.c:879: prota.sprite = g_hero;
   8682 21 A8 4A      [10] 3693 	ld	hl,#_g_hero
   8685 22 DA 69      [16] 3694 	ld	((_prota + 0x0004)), hl
                           3695 ;src/main.c:883: cu.x = cu.px = 0;
   8688 21 E0 69      [10] 3696 	ld	hl,#(_cu + 0x0002)
   868B 36 00         [10] 3697 	ld	(hl),#0x00
   868D 21 DE 69      [10] 3698 	ld	hl,#_cu
   8690 36 00         [10] 3699 	ld	(hl),#0x00
                           3700 ;src/main.c:884: cu.y = cu.py = 0;
   8692 21 E1 69      [10] 3701 	ld	hl,#(_cu + 0x0003)
   8695 36 00         [10] 3702 	ld	(hl),#0x00
   8697 21 DF 69      [10] 3703 	ld	hl,#(_cu + 0x0001)
   869A 36 00         [10] 3704 	ld	(hl),#0x00
                           3705 ;src/main.c:885: cu.lanzado = NO;
   869C 21 E4 69      [10] 3706 	ld	hl,#(_cu + 0x0006)
   869F 36 00         [10] 3707 	ld	(hl),#0x00
                           3708 ;src/main.c:886: cu.mover = NO;
   86A1 21 E7 69      [10] 3709 	ld	hl,#(_cu + 0x0009)
   86A4 36 00         [10] 3710 	ld	(hl),#0x00
                           3711 ;src/main.c:888: inicializarEnemy();
   86A6 CD 3B 85      [17] 3712 	call	_inicializarEnemy
                           3713 ;src/main.c:890: dibujarProta();
   86A9 C3 99 72      [10] 3714 	jp  _dibujarProta
                           3715 ;src/main.c:893: void main(void) {
                           3716 ;	---------------------------------
                           3717 ; Function main
                           3718 ; ---------------------------------
   86AC                    3719 _main::
   86AC DD E5         [15] 3720 	push	ix
   86AE DD 21 00 00   [14] 3721 	ld	ix,#0
   86B2 DD 39         [15] 3722 	add	ix,sp
   86B4 3B            [ 6] 3723 	dec	sp
                           3724 ;src/main.c:898: inicializarCPC();
   86B5 CD 18 85      [17] 3725 	call	_inicializarCPC
                           3726 ;src/main.c:899: menuInicio();
   86B8 CD 3C 84      [17] 3727 	call	_menuInicio
                           3728 ;src/main.c:901: inicializarJuego();
   86BB CD 31 86      [17] 3729 	call	_inicializarJuego
                           3730 ;src/main.c:902: cpct_akp_musicPlay();
   86BE CD 58 5B      [17] 3731 	call	_cpct_akp_musicPlay
                           3732 ;src/main.c:904: while (1) {
   86C1                    3733 00119$:
                           3734 ;src/main.c:907: i = 1 + 1;
   86C1 DD 36 FF 02   [19] 3735 	ld	-1 (ix),#0x02
                           3736 ;src/main.c:910: comprobarTeclado();
   86C5 CD 1F 82      [17] 3737 	call	_comprobarTeclado
                           3738 ;src/main.c:911: moverCuchillo();
   86C8 CD 82 82      [17] 3739 	call	_moverCuchillo
                           3740 ;src/main.c:912: updateEnemies();
   86CB CD 32 7E      [17] 3741 	call	_updateEnemies
                           3742 ;src/main.c:927: actual = enemy;
                           3743 ;src/main.c:929: cpct_waitVSYNC();
   86CE CD 22 5B      [17] 3744 	call	_cpct_waitVSYNC
                           3745 ;src/main.c:931: if (prota.mover) {
   86D1 01 DC 69      [10] 3746 	ld	bc,#_prota+6
   86D4 0A            [ 7] 3747 	ld	a,(bc)
   86D5 B7            [ 4] 3748 	or	a, a
   86D6 28 07         [12] 3749 	jr	Z,00102$
                           3750 ;src/main.c:932: redibujarProta();
   86D8 C5            [11] 3751 	push	bc
   86D9 CD 6A 73      [17] 3752 	call	_redibujarProta
   86DC C1            [10] 3753 	pop	bc
                           3754 ;src/main.c:933: prota.mover = NO;
   86DD AF            [ 4] 3755 	xor	a, a
   86DE 02            [ 7] 3756 	ld	(bc),a
   86DF                    3757 00102$:
                           3758 ;src/main.c:935: if(cu.lanzado && cu.mover){
   86DF 21 E4 69      [10] 3759 	ld	hl,#_cu + 6
   86E2 4E            [ 7] 3760 	ld	c,(hl)
   86E3 11 E7 69      [10] 3761 	ld	de,#_cu + 9
   86E6 79            [ 4] 3762 	ld	a,c
   86E7 B7            [ 4] 3763 	or	a, a
   86E8 28 09         [12] 3764 	jr	Z,00107$
   86EA 1A            [ 7] 3765 	ld	a,(de)
   86EB B7            [ 4] 3766 	or	a, a
   86EC 28 05         [12] 3767 	jr	Z,00107$
                           3768 ;src/main.c:936: redibujarCuchillo();
   86EE CD EF 80      [17] 3769 	call	_redibujarCuchillo
   86F1 18 0B         [12] 3770 	jr	00132$
   86F3                    3771 00107$:
                           3772 ;src/main.c:937: }else if (cu.lanzado && !cu.mover){
   86F3 79            [ 4] 3773 	ld	a,c
   86F4 B7            [ 4] 3774 	or	a, a
   86F5 28 07         [12] 3775 	jr	Z,00132$
   86F7 1A            [ 7] 3776 	ld	a,(de)
   86F8 B7            [ 4] 3777 	or	a, a
   86F9 20 03         [12] 3778 	jr	NZ,00132$
                           3779 ;src/main.c:938: borrarCuchillo();
   86FB CD 71 80      [17] 3780 	call	_borrarCuchillo
                           3781 ;src/main.c:941: while(--i){
   86FE                    3782 00132$:
   86FE 01 C6 64      [10] 3783 	ld	bc,#_enemy
   8701                    3784 00115$:
   8701 DD 35 FF      [23] 3785 	dec	-1 (ix)
   8704 DD 7E FF      [19] 3786 	ld	a, -1 (ix)
   8707 B7            [ 4] 3787 	or	a, a
   8708 28 43         [12] 3788 	jr	Z,00117$
                           3789 ;src/main.c:942: if(actual->mover){
   870A C5            [11] 3790 	push	bc
   870B FD E1         [14] 3791 	pop	iy
   870D FD 7E 06      [19] 3792 	ld	a,6 (iy)
   8710 B7            [ 4] 3793 	or	a, a
   8711 28 07         [12] 3794 	jr	Z,00111$
                           3795 ;src/main.c:943: redibujarEnemigo(actual);
   8713 C5            [11] 3796 	push	bc
   8714 C5            [11] 3797 	push	bc
   8715 CD 88 76      [17] 3798 	call	_redibujarEnemigo
   8718 F1            [10] 3799 	pop	af
   8719 C1            [10] 3800 	pop	bc
   871A                    3801 00111$:
                           3802 ;src/main.c:945: if (actual->muerto && actual->muertes == 0){
   871A C5            [11] 3803 	push	bc
   871B FD E1         [14] 3804 	pop	iy
   871D FD 7E 08      [19] 3805 	ld	a,8 (iy)
   8720 B7            [ 4] 3806 	or	a, a
   8721 28 22         [12] 3807 	jr	Z,00113$
   8723 21 0A 00      [10] 3808 	ld	hl,#0x000A
   8726 09            [11] 3809 	add	hl,bc
   8727 7E            [ 7] 3810 	ld	a,(hl)
   8728 B7            [ 4] 3811 	or	a, a
   8729 20 1A         [12] 3812 	jr	NZ,00113$
                           3813 ;src/main.c:946: borrarEnemigo(actual);
   872B E5            [11] 3814 	push	hl
   872C C5            [11] 3815 	push	bc
   872D C5            [11] 3816 	push	bc
   872E CD F4 75      [17] 3817 	call	_borrarEnemigo
   8731 F1            [10] 3818 	pop	af
   8732 C1            [10] 3819 	pop	bc
   8733 C5            [11] 3820 	push	bc
   8734 C5            [11] 3821 	push	bc
   8735 CD 4C 75      [17] 3822 	call	_dibujarExplosion
   8738 F1            [10] 3823 	pop	af
   8739 C1            [10] 3824 	pop	bc
   873A E1            [10] 3825 	pop	hl
                           3826 ;src/main.c:949: actual->muertes++;
   873B 5E            [ 7] 3827 	ld	e,(hl)
   873C 1C            [ 4] 3828 	inc	e
   873D 73            [ 7] 3829 	ld	(hl),e
                           3830 ;src/main.c:950: actual->x = 0;
   873E AF            [ 4] 3831 	xor	a, a
   873F 02            [ 7] 3832 	ld	(bc),a
                           3833 ;src/main.c:951: actual->y = 0;
   8740 59            [ 4] 3834 	ld	e, c
   8741 50            [ 4] 3835 	ld	d, b
   8742 13            [ 6] 3836 	inc	de
   8743 AF            [ 4] 3837 	xor	a, a
   8744 12            [ 7] 3838 	ld	(de),a
   8745                    3839 00113$:
                           3840 ;src/main.c:953: ++actual;
   8745 21 44 01      [10] 3841 	ld	hl,#0x0144
   8748 09            [11] 3842 	add	hl,bc
   8749 4D            [ 4] 3843 	ld	c,l
   874A 44            [ 4] 3844 	ld	b,h
   874B 18 B4         [12] 3845 	jr	00115$
   874D                    3846 00117$:
                           3847 ;src/main.c:956: cpct_waitVSYNC();
   874D CD 22 5B      [17] 3848 	call	_cpct_waitVSYNC
   8750 C3 C1 86      [10] 3849 	jp	00119$
   8753 33            [ 6] 3850 	inc	sp
   8754 DD E1         [14] 3851 	pop	ix
   8756 C9            [10] 3852 	ret
                           3853 	.area _CODE
                           3854 	.area _INITIALIZER
                           3855 	.area _CABS (ABS)
   0F00                    3856 	.org 0x0F00
   0F00                    3857 _G_song:
   0F00 41                 3858 	.db #0x41	; 65	'A'
   0F01 54                 3859 	.db #0x54	; 84	'T'
   0F02 31                 3860 	.db #0x31	; 49	'1'
   0F03 30                 3861 	.db #0x30	; 48	'0'
   0F04 01                 3862 	.db #0x01	; 1
   0F05 40                 3863 	.db #0x40	; 64
   0F06 42                 3864 	.db #0x42	; 66	'B'
   0F07 0F                 3865 	.db #0x0F	; 15
   0F08 02                 3866 	.db #0x02	; 2
   0F09 06                 3867 	.db #0x06	; 6
   0F0A 1D                 3868 	.db #0x1D	; 29
   0F0B 00                 3869 	.db #0x00	; 0
   0F0C 10                 3870 	.db #0x10	; 16
   0F0D 40                 3871 	.db #0x40	; 64
   0F0E 19                 3872 	.db #0x19	; 25
   0F0F 40                 3873 	.db #0x40	; 64
   0F10 00                 3874 	.db #0x00	; 0
   0F11 00                 3875 	.db #0x00	; 0
   0F12 00                 3876 	.db #0x00	; 0
   0F13 00                 3877 	.db #0x00	; 0
   0F14 00                 3878 	.db #0x00	; 0
   0F15 00                 3879 	.db #0x00	; 0
   0F16 0D                 3880 	.db #0x0D	; 13
   0F17 12                 3881 	.db #0x12	; 18
   0F18 40                 3882 	.db #0x40	; 64
   0F19 01                 3883 	.db #0x01	; 1
   0F1A 00                 3884 	.db #0x00	; 0
   0F1B 7C                 3885 	.db #0x7C	; 124
   0F1C 18                 3886 	.db #0x18	; 24
   0F1D 78                 3887 	.db #0x78	; 120	'x'
   0F1E 0C                 3888 	.db #0x0C	; 12
   0F1F 34                 3889 	.db #0x34	; 52	'4'
   0F20 30                 3890 	.db #0x30	; 48	'0'
   0F21 2C                 3891 	.db #0x2C	; 44
   0F22 28                 3892 	.db #0x28	; 40
   0F23 24                 3893 	.db #0x24	; 36
   0F24 20                 3894 	.db #0x20	; 32
   0F25 1C                 3895 	.db #0x1C	; 28
   0F26 0D                 3896 	.db #0x0D	; 13
   0F27 25                 3897 	.db #0x25	; 37
   0F28 40                 3898 	.db #0x40	; 64
   0F29 20                 3899 	.db #0x20	; 32
   0F2A 00                 3900 	.db #0x00	; 0
   0F2B 00                 3901 	.db #0x00	; 0
   0F2C 00                 3902 	.db #0x00	; 0
   0F2D 39                 3903 	.db #0x39	; 57	'9'
   0F2E 40                 3904 	.db #0x40	; 64
   0F2F 00                 3905 	.db #0x00	; 0
   0F30 57                 3906 	.db #0x57	; 87	'W'
   0F31 40                 3907 	.db #0x40	; 64
   0F32 3B                 3908 	.db #0x3B	; 59
   0F33 40                 3909 	.db #0x40	; 64
   0F34 57                 3910 	.db #0x57	; 87	'W'
   0F35 40                 3911 	.db #0x40	; 64
   0F36 01                 3912 	.db #0x01	; 1
   0F37 2F                 3913 	.db #0x2F	; 47
   0F38 40                 3914 	.db #0x40	; 64
   0F39 19                 3915 	.db #0x19	; 25
   0F3A 00                 3916 	.db #0x00	; 0
   0F3B 76                 3917 	.db #0x76	; 118	'v'
   0F3C E1                 3918 	.db #0xE1	; 225
   0F3D 00                 3919 	.db #0x00	; 0
   0F3E 00                 3920 	.db #0x00	; 0
   0F3F 01                 3921 	.db #0x01	; 1
   0F40 04                 3922 	.db #0x04	; 4
   0F41 51                 3923 	.db #0x51	; 81	'Q'
   0F42 04                 3924 	.db #0x04	; 4
   0F43 37                 3925 	.db #0x37	; 55	'7'
   0F44 04                 3926 	.db #0x04	; 4
   0F45 4F                 3927 	.db #0x4F	; 79	'O'
   0F46 04                 3928 	.db #0x04	; 4
   0F47 37                 3929 	.db #0x37	; 55	'7'
   0F48 02                 3930 	.db #0x02	; 2
   0F49 4B                 3931 	.db #0x4B	; 75	'K'
   0F4A 02                 3932 	.db #0x02	; 2
   0F4B 37                 3933 	.db #0x37	; 55	'7'
   0F4C 04                 3934 	.db #0x04	; 4
   0F4D 4F                 3935 	.db #0x4F	; 79	'O'
   0F4E 04                 3936 	.db #0x04	; 4
   0F4F 37                 3937 	.db #0x37	; 55	'7'
   0F50 04                 3938 	.db #0x04	; 4
   0F51 4F                 3939 	.db #0x4F	; 79	'O'
   0F52 04                 3940 	.db #0x04	; 4
   0F53 37                 3941 	.db #0x37	; 55	'7'
   0F54 02                 3942 	.db #0x02	; 2
   0F55 4B                 3943 	.db #0x4B	; 75	'K'
   0F56 00                 3944 	.db #0x00	; 0
   0F57 42                 3945 	.db #0x42	; 66	'B'
   0F58 60                 3946 	.db #0x60	; 96
   0F59 00                 3947 	.db #0x00	; 0
   0F5A 42                 3948 	.db #0x42	; 66	'B'
   0F5B 80                 3949 	.db #0x80	; 128
   0F5C 00                 3950 	.db #0x00	; 0
   0F5D 00                 3951 	.db #0x00	; 0
   0F5E 42                 3952 	.db #0x42	; 66	'B'
   0F5F 00                 3953 	.db #0x00	; 0
   0F60 00                 3954 	.db #0x00	; 0
