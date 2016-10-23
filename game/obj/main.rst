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
                             32 	.globl _engage
                             33 	.globl _seek
                             34 	.globl _patrol
                             35 	.globl _lookFor
                             36 	.globl _moverEnemigo
                             37 	.globl _moverEnemigoPathfinding
                             38 	.globl _moverEnemigoIzquierda
                             39 	.globl _moverEnemigoDerecha
                             40 	.globl _moverEnemigoAbajo
                             41 	.globl _moverEnemigoArriba
                             42 	.globl _checkEnemyCollision
                             43 	.globl _redibujarEnemigo
                             44 	.globl _borrarEnemigo
                             45 	.globl _borrarExplosion
                             46 	.globl _dibujarExplosion
                             47 	.globl _dibujarEnemigo
                             48 	.globl _checkCollision
                             49 	.globl _getTilePtr
                             50 	.globl _redibujarProta
                             51 	.globl _menuFin
                             52 	.globl _borrarProta
                             53 	.globl _dibujarProta
                             54 	.globl _dibujarMapa
                             55 	.globl _pathFinding
                             56 	.globl _abs
                             57 	.globl _cpct_etm_setTileset2x4
                             58 	.globl _cpct_etm_drawTileBox2x4
                             59 	.globl _cpct_akp_musicPlay
                             60 	.globl _cpct_akp_musicInit
                             61 	.globl _cpct_getScreenPtr
                             62 	.globl _cpct_setPALColour
                             63 	.globl _cpct_setPalette
                             64 	.globl _cpct_waitVSYNC
                             65 	.globl _cpct_setVideoMode
                             66 	.globl _cpct_drawStringM0
                             67 	.globl _cpct_drawSpriteMaskedAlignedTable
                             68 	.globl _cpct_drawSolidBox
                             69 	.globl _cpct_drawSprite
                             70 	.globl _cpct_isAnyKeyPressed
                             71 	.globl _cpct_isKeyPressed
                             72 	.globl _cpct_scanKeyboard_if
                             73 	.globl _cpct_scanKeyboard_f
                             74 	.globl _cpct_memset
                             75 	.globl _cpct_disableFirmware
                             76 	.globl _num_mapa
                             77 	.globl _mapa
                             78 	.globl _iter
                             79 	.globl _cu
                             80 	.globl _prota
                             81 	.globl _enemy
                             82 	.globl _EEje
                             83 	.globl _EMirar
                             84 	.globl _spawnY
                             85 	.globl _spawnX
                             86 	.globl _mapas
                             87 ;--------------------------------------------------------
                             88 ; special function registers
                             89 ;--------------------------------------------------------
                             90 ;--------------------------------------------------------
                             91 ; ram data
                             92 ;--------------------------------------------------------
                             93 	.area _DATA
   64C4                      94 _EMirar::
   64C4                      95 	.ds 1
   64C5                      96 _EEje::
   64C5                      97 	.ds 1
   64C6                      98 _enemy::
   64C6                      99 	.ds 1296
   69D6                     100 _prota::
   69D6                     101 	.ds 8
   69DE                     102 _cu::
   69DE                     103 	.ds 10
   69E8                     104 _iter::
   69E8                     105 	.ds 1
   69E9                     106 _mapa::
   69E9                     107 	.ds 2
   69EB                     108 _num_mapa::
   69EB                     109 	.ds 1
                            110 ;--------------------------------------------------------
                            111 ; ram data
                            112 ;--------------------------------------------------------
                            113 	.area _INITIALIZED
                            114 ;--------------------------------------------------------
                            115 ; absolute external ram data
                            116 ;--------------------------------------------------------
                            117 	.area _DABS (ABS)
                            118 ;--------------------------------------------------------
                            119 ; global & static initialisations
                            120 ;--------------------------------------------------------
                            121 	.area _HOME
                            122 	.area _GSINIT
                            123 	.area _GSFINAL
                            124 	.area _GSINIT
                            125 ;--------------------------------------------------------
                            126 ; Home
                            127 ;--------------------------------------------------------
                            128 	.area _HOME
                            129 	.area _HOME
                            130 ;--------------------------------------------------------
                            131 ; code
                            132 ;--------------------------------------------------------
                            133 	.area _CODE
                            134 ;src/main.c:109: cpctm_createTransparentMaskTable(g_tablatrans, 0x0E00, M0, 0); // es el color 8 - 4D - FF00FF
                            135 ;	---------------------------------
                            136 ; Function dummy_cpct_transparentMaskTable0M0_container
                            137 ; ---------------------------------
   4B92                     138 _dummy_cpct_transparentMaskTable0M0_container::
                            139 	.area _g_tablatrans_ (ABS) 
   0E00                     140 	.org 0x0E00 
   0E00                     141 	 _g_tablatrans::
   0E00 FF AA 55 00 AA AA   142 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0E08 55 00 55 00 00 00   143 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E10 AA AA 00 00 AA AA   144 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0E18 00 00 00 00 00 00   145 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E20 55 00 55 00 00 00   146 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E28 55 00 55 00 00 00   147 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E30 00 00 00 00 00 00   148 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E38 00 00 00 00 00 00   149 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E40 AA AA 00 00 AA AA   150 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0E48 00 00 00 00 00 00   151 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E50 AA AA 00 00 AA AA   152 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0E58 00 00 00 00 00 00   153 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E60 00 00 00 00 00 00   154 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E68 00 00 00 00 00 00   155 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E70 00 00 00 00 00 00   156 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E78 00 00 00 00 00 00   157 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E80 55 00 55 00 00 00   158 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E88 55 00 55 00 00 00   159 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E90 00 00 00 00 00 00   160 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E98 00 00 00 00 00 00   161 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EA0 55 00 55 00 00 00   162 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EA8 55 00 55 00 00 00   163 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EB0 00 00 00 00 00 00   164 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EB8 00 00 00 00 00 00   165 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EC0 00 00 00 00 00 00   166 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EC8 00 00 00 00 00 00   167 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0ED0 00 00 00 00 00 00   168 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0ED8 00 00 00 00 00 00   169 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EE0 00 00 00 00 00 00   170 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EE8 00 00 00 00 00 00   171 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EF0 00 00 00 00 00 00   172 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EF8 00 00 00 00 00 00   173 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            174 	.area _CSEG (REL, CON) 
                            175 ;src/main.c:112: void dibujarMapa() {
                            176 ;	---------------------------------
                            177 ; Function dibujarMapa
                            178 ; ---------------------------------
   7273                     179 _dibujarMapa::
                            180 ;src/main.c:113: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   7273 2A E9 69      [16]  181 	ld	hl,(_mapa)
   7276 E5            [11]  182 	push	hl
   7277 21 F0 C0      [10]  183 	ld	hl,#0xC0F0
   727A E5            [11]  184 	push	hl
   727B 21 2C 28      [10]  185 	ld	hl,#0x282C
   727E E5            [11]  186 	push	hl
   727F 2E 00         [ 7]  187 	ld	l, #0x00
   7281 E5            [11]  188 	push	hl
   7282 AF            [ 4]  189 	xor	a, a
   7283 F5            [11]  190 	push	af
   7284 33            [ 6]  191 	inc	sp
   7285 CD 62 59      [17]  192 	call	_cpct_etm_drawTileBox2x4
   7288 C9            [10]  193 	ret
   7289                     194 _mapas:
   7289 C0 1D               195 	.dw _g_map1
   728B E0 16               196 	.dw _g_map2
   728D 00 10               197 	.dw _g_map3
   728F                     198 _spawnX:
   728F 00                  199 	.db #0x00	; 0
   7290 3C                  200 	.db #0x3C	; 60
   7291 47                  201 	.db #0x47	; 71	'G'
   7292 14                  202 	.db #0x14	; 20
   7293 3C                  203 	.db #0x3C	; 60
   7294                     204 _spawnY:
   7294 00                  205 	.db #0x00	; 0
   7295 2C                  206 	.db #0x2C	; 44
   7296 72                  207 	.db #0x72	; 114	'r'
   7297 8A                  208 	.db #0x8A	; 138
   7298 8A                  209 	.db #0x8A	; 138
                            210 ;src/main.c:116: void dibujarProta() {
                            211 ;	---------------------------------
                            212 ; Function dibujarProta
                            213 ; ---------------------------------
   7299                     214 _dibujarProta::
                            215 ;src/main.c:117: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   7299 21 D7 69      [10]  216 	ld	hl, #_prota + 1
   729C 56            [ 7]  217 	ld	d,(hl)
   729D 21 D6 69      [10]  218 	ld	hl, #_prota + 0
   72A0 46            [ 7]  219 	ld	b,(hl)
   72A1 D5            [11]  220 	push	de
   72A2 33            [ 6]  221 	inc	sp
   72A3 C5            [11]  222 	push	bc
   72A4 33            [ 6]  223 	inc	sp
   72A5 21 00 C0      [10]  224 	ld	hl,#0xC000
   72A8 E5            [11]  225 	push	hl
   72A9 CD 69 64      [17]  226 	call	_cpct_getScreenPtr
   72AC EB            [ 4]  227 	ex	de,hl
                            228 ;src/main.c:118: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   72AD ED 4B DA 69   [20]  229 	ld	bc, (#_prota + 4)
   72B1 21 00 0E      [10]  230 	ld	hl,#_g_tablatrans
   72B4 E5            [11]  231 	push	hl
   72B5 21 07 16      [10]  232 	ld	hl,#0x1607
   72B8 E5            [11]  233 	push	hl
   72B9 D5            [11]  234 	push	de
   72BA C5            [11]  235 	push	bc
   72BB CD 89 64      [17]  236 	call	_cpct_drawSpriteMaskedAlignedTable
   72BE C9            [10]  237 	ret
                            238 ;src/main.c:121: void borrarProta() {
                            239 ;	---------------------------------
                            240 ; Function borrarProta
                            241 ; ---------------------------------
   72BF                     242 _borrarProta::
   72BF DD E5         [15]  243 	push	ix
   72C1 DD 21 00 00   [14]  244 	ld	ix,#0
   72C5 DD 39         [15]  245 	add	ix,sp
   72C7 F5            [11]  246 	push	af
   72C8 3B            [ 6]  247 	dec	sp
                            248 ;src/main.c:123: u8 w = 4 + (prota.px & 1);
   72C9 21 D8 69      [10]  249 	ld	hl, #_prota + 2
   72CC 4E            [ 7]  250 	ld	c,(hl)
   72CD 79            [ 4]  251 	ld	a,c
   72CE E6 01         [ 7]  252 	and	a, #0x01
   72D0 47            [ 4]  253 	ld	b,a
   72D1 04            [ 4]  254 	inc	b
   72D2 04            [ 4]  255 	inc	b
   72D3 04            [ 4]  256 	inc	b
   72D4 04            [ 4]  257 	inc	b
                            258 ;src/main.c:126: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   72D5 21 D9 69      [10]  259 	ld	hl, #_prota + 3
   72D8 5E            [ 7]  260 	ld	e,(hl)
   72D9 CB 4B         [ 8]  261 	bit	1, e
   72DB 28 04         [12]  262 	jr	Z,00103$
   72DD 3E 01         [ 7]  263 	ld	a,#0x01
   72DF 18 02         [12]  264 	jr	00104$
   72E1                     265 00103$:
   72E1 3E 00         [ 7]  266 	ld	a,#0x00
   72E3                     267 00104$:
   72E3 C6 06         [ 7]  268 	add	a, #0x06
   72E5 DD 77 FD      [19]  269 	ld	-3 (ix),a
                            270 ;src/main.c:128: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   72E8 FD 2A E9 69   [20]  271 	ld	iy,(_mapa)
   72EC 16 00         [ 7]  272 	ld	d,#0x00
   72EE 7B            [ 4]  273 	ld	a,e
   72EF C6 E8         [ 7]  274 	add	a,#0xE8
   72F1 DD 77 FE      [19]  275 	ld	-2 (ix),a
   72F4 7A            [ 4]  276 	ld	a,d
   72F5 CE FF         [ 7]  277 	adc	a,#0xFF
   72F7 DD 77 FF      [19]  278 	ld	-1 (ix),a
   72FA DD 6E FE      [19]  279 	ld	l,-2 (ix)
   72FD DD 66 FF      [19]  280 	ld	h,-1 (ix)
   7300 DD CB FF 7E   [20]  281 	bit	7, -1 (ix)
   7304 28 04         [12]  282 	jr	Z,00105$
   7306 21 EB FF      [10]  283 	ld	hl,#0xFFEB
   7309 19            [11]  284 	add	hl,de
   730A                     285 00105$:
   730A CB 2C         [ 8]  286 	sra	h
   730C CB 1D         [ 8]  287 	rr	l
   730E CB 2C         [ 8]  288 	sra	h
   7310 CB 1D         [ 8]  289 	rr	l
   7312 55            [ 4]  290 	ld	d,l
   7313 CB 39         [ 8]  291 	srl	c
   7315 FD E5         [15]  292 	push	iy
   7317 21 F0 C0      [10]  293 	ld	hl,#0xC0F0
   731A E5            [11]  294 	push	hl
   731B 3E 28         [ 7]  295 	ld	a,#0x28
   731D F5            [11]  296 	push	af
   731E 33            [ 6]  297 	inc	sp
   731F DD 7E FD      [19]  298 	ld	a,-3 (ix)
   7322 F5            [11]  299 	push	af
   7323 33            [ 6]  300 	inc	sp
   7324 C5            [11]  301 	push	bc
   7325 33            [ 6]  302 	inc	sp
   7326 D5            [11]  303 	push	de
   7327 33            [ 6]  304 	inc	sp
   7328 79            [ 4]  305 	ld	a,c
   7329 F5            [11]  306 	push	af
   732A 33            [ 6]  307 	inc	sp
   732B CD 62 59      [17]  308 	call	_cpct_etm_drawTileBox2x4
   732E DD F9         [10]  309 	ld	sp, ix
   7330 DD E1         [14]  310 	pop	ix
   7332 C9            [10]  311 	ret
                            312 ;src/main.c:131: void menuFin(){
                            313 ;	---------------------------------
                            314 ; Function menuFin
                            315 ; ---------------------------------
   7333                     316 _menuFin::
                            317 ;src/main.c:134: cpct_clearScreen(0);
   7333 21 00 40      [10]  318 	ld	hl,#0x4000
   7336 E5            [11]  319 	push	hl
   7337 AF            [ 4]  320 	xor	a, a
   7338 F5            [11]  321 	push	af
   7339 33            [ 6]  322 	inc	sp
   733A 26 C0         [ 7]  323 	ld	h, #0xC0
   733C E5            [11]  324 	push	hl
   733D CD 48 5B      [17]  325 	call	_cpct_memset
                            326 ;src/main.c:136: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   7340 21 18 5A      [10]  327 	ld	hl,#0x5A18
   7343 E5            [11]  328 	push	hl
   7344 21 00 C0      [10]  329 	ld	hl,#0xC000
   7347 E5            [11]  330 	push	hl
   7348 CD 69 64      [17]  331 	call	_cpct_getScreenPtr
   734B 4D            [ 4]  332 	ld	c,l
   734C 44            [ 4]  333 	ld	b,h
                            334 ;src/main.c:137: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   734D 21 02 00      [10]  335 	ld	hl,#0x0002
   7350 E5            [11]  336 	push	hl
   7351 C5            [11]  337 	push	bc
   7352 21 60 73      [10]  338 	ld	hl,#___str_0
   7355 E5            [11]  339 	push	hl
   7356 CD 99 58      [17]  340 	call	_cpct_drawStringM0
   7359 21 06 00      [10]  341 	ld	hl,#6
   735C 39            [11]  342 	add	hl,sp
   735D F9            [ 6]  343 	ld	sp,hl
                            344 ;src/main.c:139: while(1){}
   735E                     345 00102$:
   735E 18 FE         [12]  346 	jr	00102$
   7360                     347 ___str_0:
   7360 47 41 4D 45 20 4F   348 	.ascii "GAME OVER"
        56 45 52
   7369 00                  349 	.db 0x00
                            350 ;src/main.c:142: void redibujarProta() {
                            351 ;	---------------------------------
                            352 ; Function redibujarProta
                            353 ; ---------------------------------
   736A                     354 _redibujarProta::
                            355 ;src/main.c:143: borrarProta();
   736A CD BF 72      [17]  356 	call	_borrarProta
                            357 ;src/main.c:144: prota.px = prota.x;
   736D 01 D8 69      [10]  358 	ld	bc,#_prota + 2
   7370 3A D6 69      [13]  359 	ld	a, (#_prota + 0)
   7373 02            [ 7]  360 	ld	(bc),a
                            361 ;src/main.c:145: prota.py = prota.y;
   7374 01 D9 69      [10]  362 	ld	bc,#_prota + 3
   7377 3A D7 69      [13]  363 	ld	a, (#_prota + 1)
   737A 02            [ 7]  364 	ld	(bc),a
                            365 ;src/main.c:146: dibujarProta();
   737B C3 99 72      [10]  366 	jp  _dibujarProta
                            367 ;src/main.c:149: u8* getTilePtr(u8 x, u8 y) {
                            368 ;	---------------------------------
                            369 ; Function getTilePtr
                            370 ; ---------------------------------
   737E                     371 _getTilePtr::
   737E DD E5         [15]  372 	push	ix
   7380 DD 21 00 00   [14]  373 	ld	ix,#0
   7384 DD 39         [15]  374 	add	ix,sp
                            375 ;src/main.c:150: return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
   7386 DD 4E 05      [19]  376 	ld	c,5 (ix)
   7389 06 00         [ 7]  377 	ld	b,#0x00
   738B 79            [ 4]  378 	ld	a,c
   738C C6 E8         [ 7]  379 	add	a,#0xE8
   738E 5F            [ 4]  380 	ld	e,a
   738F 78            [ 4]  381 	ld	a,b
   7390 CE FF         [ 7]  382 	adc	a,#0xFF
   7392 57            [ 4]  383 	ld	d,a
   7393 6B            [ 4]  384 	ld	l, e
   7394 62            [ 4]  385 	ld	h, d
   7395 CB 7A         [ 8]  386 	bit	7, d
   7397 28 04         [12]  387 	jr	Z,00103$
   7399 21 EB FF      [10]  388 	ld	hl,#0xFFEB
   739C 09            [11]  389 	add	hl,bc
   739D                     390 00103$:
   739D CB 2C         [ 8]  391 	sra	h
   739F CB 1D         [ 8]  392 	rr	l
   73A1 CB 2C         [ 8]  393 	sra	h
   73A3 CB 1D         [ 8]  394 	rr	l
   73A5 4D            [ 4]  395 	ld	c, l
   73A6 44            [ 4]  396 	ld	b, h
   73A7 29            [11]  397 	add	hl, hl
   73A8 29            [11]  398 	add	hl, hl
   73A9 09            [11]  399 	add	hl, bc
   73AA 29            [11]  400 	add	hl, hl
   73AB 29            [11]  401 	add	hl, hl
   73AC 29            [11]  402 	add	hl, hl
   73AD 4D            [ 4]  403 	ld	c,l
   73AE 44            [ 4]  404 	ld	b,h
   73AF 2A E9 69      [16]  405 	ld	hl,(_mapa)
   73B2 09            [11]  406 	add	hl,bc
   73B3 DD 4E 04      [19]  407 	ld	c,4 (ix)
   73B6 CB 39         [ 8]  408 	srl	c
   73B8 59            [ 4]  409 	ld	e,c
   73B9 16 00         [ 7]  410 	ld	d,#0x00
   73BB 19            [11]  411 	add	hl,de
   73BC DD E1         [14]  412 	pop	ix
   73BE C9            [10]  413 	ret
                            414 ;src/main.c:153: u8 checkCollision(int direction) { // check optimization
                            415 ;	---------------------------------
                            416 ; Function checkCollision
                            417 ; ---------------------------------
   73BF                     418 _checkCollision::
   73BF DD E5         [15]  419 	push	ix
   73C1 DD 21 00 00   [14]  420 	ld	ix,#0
   73C5 DD 39         [15]  421 	add	ix,sp
   73C7 F5            [11]  422 	push	af
                            423 ;src/main.c:154: u8 *headTile=0, *feetTile=0, *waistTile=0;
   73C8 21 00 00      [10]  424 	ld	hl,#0x0000
   73CB E3            [19]  425 	ex	(sp), hl
   73CC 11 00 00      [10]  426 	ld	de,#0x0000
   73CF 01 00 00      [10]  427 	ld	bc,#0x0000
                            428 ;src/main.c:156: switch (direction) {
   73D2 DD CB 05 7E   [20]  429 	bit	7, 5 (ix)
   73D6 C2 F3 74      [10]  430 	jp	NZ,00105$
   73D9 3E 03         [ 7]  431 	ld	a,#0x03
   73DB DD BE 04      [19]  432 	cp	a, 4 (ix)
   73DE 3E 00         [ 7]  433 	ld	a,#0x00
   73E0 DD 9E 05      [19]  434 	sbc	a, 5 (ix)
   73E3 E2 E8 73      [10]  435 	jp	PO, 00128$
   73E6 EE 80         [ 7]  436 	xor	a, #0x80
   73E8                     437 00128$:
   73E8 FA F3 74      [10]  438 	jp	M,00105$
   73EB DD 5E 04      [19]  439 	ld	e,4 (ix)
   73EE 16 00         [ 7]  440 	ld	d,#0x00
   73F0 21 F7 73      [10]  441 	ld	hl,#00129$
   73F3 19            [11]  442 	add	hl,de
   73F4 19            [11]  443 	add	hl,de
   73F5 19            [11]  444 	add	hl,de
   73F6 E9            [ 4]  445 	jp	(hl)
   73F7                     446 00129$:
   73F7 C3 03 74      [10]  447 	jp	00101$
   73FA C3 4E 74      [10]  448 	jp	00102$
   73FD C3 8F 74      [10]  449 	jp	00103$
   7400 C3 C2 74      [10]  450 	jp	00104$
                            451 ;src/main.c:157: case 0:
   7403                     452 00101$:
                            453 ;src/main.c:158: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   7403 21 D7 69      [10]  454 	ld	hl, #(_prota + 0x0001) + 0
   7406 5E            [ 7]  455 	ld	e,(hl)
   7407 21 D6 69      [10]  456 	ld	hl, #_prota + 0
   740A 4E            [ 7]  457 	ld	c,(hl)
   740B 0C            [ 4]  458 	inc	c
   740C 0C            [ 4]  459 	inc	c
   740D 0C            [ 4]  460 	inc	c
   740E 0C            [ 4]  461 	inc	c
   740F 7B            [ 4]  462 	ld	a,e
   7410 F5            [11]  463 	push	af
   7411 33            [ 6]  464 	inc	sp
   7412 79            [ 4]  465 	ld	a,c
   7413 F5            [11]  466 	push	af
   7414 33            [ 6]  467 	inc	sp
   7415 CD 7E 73      [17]  468 	call	_getTilePtr
   7418 F1            [10]  469 	pop	af
   7419 33            [ 6]  470 	inc	sp
   741A 33            [ 6]  471 	inc	sp
   741B E5            [11]  472 	push	hl
                            473 ;src/main.c:159: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   741C 3A D7 69      [13]  474 	ld	a, (#(_prota + 0x0001) + 0)
   741F C6 14         [ 7]  475 	add	a, #0x14
   7421 4F            [ 4]  476 	ld	c,a
   7422 21 D6 69      [10]  477 	ld	hl, #_prota + 0
   7425 46            [ 7]  478 	ld	b,(hl)
   7426 04            [ 4]  479 	inc	b
   7427 04            [ 4]  480 	inc	b
   7428 04            [ 4]  481 	inc	b
   7429 04            [ 4]  482 	inc	b
   742A 79            [ 4]  483 	ld	a,c
   742B F5            [11]  484 	push	af
   742C 33            [ 6]  485 	inc	sp
   742D C5            [11]  486 	push	bc
   742E 33            [ 6]  487 	inc	sp
   742F CD 7E 73      [17]  488 	call	_getTilePtr
   7432 F1            [10]  489 	pop	af
   7433 EB            [ 4]  490 	ex	de,hl
                            491 ;src/main.c:160: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   7434 3A D7 69      [13]  492 	ld	a, (#(_prota + 0x0001) + 0)
   7437 C6 0B         [ 7]  493 	add	a, #0x0B
   7439 47            [ 4]  494 	ld	b,a
   743A 3A D6 69      [13]  495 	ld	a, (#_prota + 0)
   743D C6 04         [ 7]  496 	add	a, #0x04
   743F D5            [11]  497 	push	de
   7440 C5            [11]  498 	push	bc
   7441 33            [ 6]  499 	inc	sp
   7442 F5            [11]  500 	push	af
   7443 33            [ 6]  501 	inc	sp
   7444 CD 7E 73      [17]  502 	call	_getTilePtr
   7447 F1            [10]  503 	pop	af
   7448 4D            [ 4]  504 	ld	c,l
   7449 44            [ 4]  505 	ld	b,h
   744A D1            [10]  506 	pop	de
                            507 ;src/main.c:161: break;
   744B C3 F3 74      [10]  508 	jp	00105$
                            509 ;src/main.c:162: case 1:
   744E                     510 00102$:
                            511 ;src/main.c:163: headTile  = getTilePtr(prota.x - 1, prota.y);
   744E 21 D7 69      [10]  512 	ld	hl, #(_prota + 0x0001) + 0
   7451 56            [ 7]  513 	ld	d,(hl)
   7452 21 D6 69      [10]  514 	ld	hl, #_prota + 0
   7455 46            [ 7]  515 	ld	b,(hl)
   7456 05            [ 4]  516 	dec	b
   7457 D5            [11]  517 	push	de
   7458 33            [ 6]  518 	inc	sp
   7459 C5            [11]  519 	push	bc
   745A 33            [ 6]  520 	inc	sp
   745B CD 7E 73      [17]  521 	call	_getTilePtr
   745E F1            [10]  522 	pop	af
   745F 33            [ 6]  523 	inc	sp
   7460 33            [ 6]  524 	inc	sp
   7461 E5            [11]  525 	push	hl
                            526 ;src/main.c:164: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
   7462 3A D7 69      [13]  527 	ld	a, (#(_prota + 0x0001) + 0)
   7465 C6 14         [ 7]  528 	add	a, #0x14
   7467 57            [ 4]  529 	ld	d,a
   7468 21 D6 69      [10]  530 	ld	hl, #_prota + 0
   746B 46            [ 7]  531 	ld	b,(hl)
   746C 05            [ 4]  532 	dec	b
   746D D5            [11]  533 	push	de
   746E 33            [ 6]  534 	inc	sp
   746F C5            [11]  535 	push	bc
   7470 33            [ 6]  536 	inc	sp
   7471 CD 7E 73      [17]  537 	call	_getTilePtr
   7474 F1            [10]  538 	pop	af
   7475 EB            [ 4]  539 	ex	de,hl
                            540 ;src/main.c:165: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
   7476 3A D7 69      [13]  541 	ld	a, (#(_prota + 0x0001) + 0)
   7479 C6 0B         [ 7]  542 	add	a, #0x0B
   747B 47            [ 4]  543 	ld	b,a
   747C 3A D6 69      [13]  544 	ld	a, (#_prota + 0)
   747F C6 FF         [ 7]  545 	add	a,#0xFF
   7481 D5            [11]  546 	push	de
   7482 C5            [11]  547 	push	bc
   7483 33            [ 6]  548 	inc	sp
   7484 F5            [11]  549 	push	af
   7485 33            [ 6]  550 	inc	sp
   7486 CD 7E 73      [17]  551 	call	_getTilePtr
   7489 F1            [10]  552 	pop	af
   748A 4D            [ 4]  553 	ld	c,l
   748B 44            [ 4]  554 	ld	b,h
   748C D1            [10]  555 	pop	de
                            556 ;src/main.c:166: break;
   748D 18 64         [12]  557 	jr	00105$
                            558 ;src/main.c:167: case 2:
   748F                     559 00103$:
                            560 ;src/main.c:168: headTile   = getTilePtr(prota.x, prota.y - 2);
   748F 3A D7 69      [13]  561 	ld	a, (#(_prota + 0x0001) + 0)
   7492 C6 FE         [ 7]  562 	add	a,#0xFE
   7494 21 D6 69      [10]  563 	ld	hl, #_prota + 0
   7497 56            [ 7]  564 	ld	d,(hl)
   7498 C5            [11]  565 	push	bc
   7499 F5            [11]  566 	push	af
   749A 33            [ 6]  567 	inc	sp
   749B D5            [11]  568 	push	de
   749C 33            [ 6]  569 	inc	sp
   749D CD 7E 73      [17]  570 	call	_getTilePtr
   74A0 F1            [10]  571 	pop	af
   74A1 C1            [10]  572 	pop	bc
   74A2 33            [ 6]  573 	inc	sp
   74A3 33            [ 6]  574 	inc	sp
   74A4 E5            [11]  575 	push	hl
                            576 ;src/main.c:169: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
   74A5 21 D7 69      [10]  577 	ld	hl, #(_prota + 0x0001) + 0
   74A8 56            [ 7]  578 	ld	d,(hl)
   74A9 15            [ 4]  579 	dec	d
   74AA 15            [ 4]  580 	dec	d
   74AB 3A D6 69      [13]  581 	ld	a, (#_prota + 0)
   74AE C6 03         [ 7]  582 	add	a, #0x03
   74B0 C5            [11]  583 	push	bc
   74B1 D5            [11]  584 	push	de
   74B2 33            [ 6]  585 	inc	sp
   74B3 F5            [11]  586 	push	af
   74B4 33            [ 6]  587 	inc	sp
   74B5 CD 7E 73      [17]  588 	call	_getTilePtr
   74B8 F1            [10]  589 	pop	af
   74B9 EB            [ 4]  590 	ex	de,hl
   74BA C1            [10]  591 	pop	bc
                            592 ;src/main.c:170: *waistTile = 0;
   74BB 21 00 00      [10]  593 	ld	hl,#0x0000
   74BE 36 00         [10]  594 	ld	(hl),#0x00
                            595 ;src/main.c:171: break;
   74C0 18 31         [12]  596 	jr	00105$
                            597 ;src/main.c:172: case 3:
   74C2                     598 00104$:
                            599 ;src/main.c:173: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
   74C2 3A D7 69      [13]  600 	ld	a, (#(_prota + 0x0001) + 0)
   74C5 C6 16         [ 7]  601 	add	a, #0x16
   74C7 21 D6 69      [10]  602 	ld	hl, #_prota + 0
   74CA 56            [ 7]  603 	ld	d,(hl)
   74CB C5            [11]  604 	push	bc
   74CC F5            [11]  605 	push	af
   74CD 33            [ 6]  606 	inc	sp
   74CE D5            [11]  607 	push	de
   74CF 33            [ 6]  608 	inc	sp
   74D0 CD 7E 73      [17]  609 	call	_getTilePtr
   74D3 F1            [10]  610 	pop	af
   74D4 C1            [10]  611 	pop	bc
   74D5 33            [ 6]  612 	inc	sp
   74D6 33            [ 6]  613 	inc	sp
   74D7 E5            [11]  614 	push	hl
                            615 ;src/main.c:174: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   74D8 3A D7 69      [13]  616 	ld	a, (#(_prota + 0x0001) + 0)
   74DB C6 16         [ 7]  617 	add	a, #0x16
   74DD 57            [ 4]  618 	ld	d,a
   74DE 3A D6 69      [13]  619 	ld	a, (#_prota + 0)
   74E1 C6 03         [ 7]  620 	add	a, #0x03
   74E3 C5            [11]  621 	push	bc
   74E4 D5            [11]  622 	push	de
   74E5 33            [ 6]  623 	inc	sp
   74E6 F5            [11]  624 	push	af
   74E7 33            [ 6]  625 	inc	sp
   74E8 CD 7E 73      [17]  626 	call	_getTilePtr
   74EB F1            [10]  627 	pop	af
   74EC EB            [ 4]  628 	ex	de,hl
   74ED C1            [10]  629 	pop	bc
                            630 ;src/main.c:175: *waistTile = 0;
   74EE 21 00 00      [10]  631 	ld	hl,#0x0000
   74F1 36 00         [10]  632 	ld	(hl),#0x00
                            633 ;src/main.c:177: }
   74F3                     634 00105$:
                            635 ;src/main.c:179: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   74F3 E1            [10]  636 	pop	hl
   74F4 E5            [11]  637 	push	hl
   74F5 6E            [ 7]  638 	ld	l,(hl)
   74F6 3E 02         [ 7]  639 	ld	a,#0x02
   74F8 95            [ 4]  640 	sub	a, l
   74F9 38 0E         [12]  641 	jr	C,00106$
   74FB 1A            [ 7]  642 	ld	a,(de)
   74FC 5F            [ 4]  643 	ld	e,a
   74FD 3E 02         [ 7]  644 	ld	a,#0x02
   74FF 93            [ 4]  645 	sub	a, e
   7500 38 07         [12]  646 	jr	C,00106$
   7502 0A            [ 7]  647 	ld	a,(bc)
   7503 4F            [ 4]  648 	ld	c,a
   7504 3E 02         [ 7]  649 	ld	a,#0x02
   7506 91            [ 4]  650 	sub	a, c
   7507 30 04         [12]  651 	jr	NC,00107$
   7509                     652 00106$:
                            653 ;src/main.c:180: return 1;
   7509 2E 01         [ 7]  654 	ld	l,#0x01
   750B 18 02         [12]  655 	jr	00110$
   750D                     656 00107$:
                            657 ;src/main.c:182: return 0;
   750D 2E 00         [ 7]  658 	ld	l,#0x00
   750F                     659 00110$:
   750F DD F9         [10]  660 	ld	sp, ix
   7511 DD E1         [14]  661 	pop	ix
   7513 C9            [10]  662 	ret
                            663 ;src/main.c:185: void dibujarEnemigo(TEnemy *enemy) {
                            664 ;	---------------------------------
                            665 ; Function dibujarEnemigo
                            666 ; ---------------------------------
   7514                     667 _dibujarEnemigo::
   7514 DD E5         [15]  668 	push	ix
   7516 DD 21 00 00   [14]  669 	ld	ix,#0
   751A DD 39         [15]  670 	add	ix,sp
                            671 ;src/main.c:186: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   751C DD 4E 04      [19]  672 	ld	c,4 (ix)
   751F DD 46 05      [19]  673 	ld	b,5 (ix)
   7522 69            [ 4]  674 	ld	l, c
   7523 60            [ 4]  675 	ld	h, b
   7524 23            [ 6]  676 	inc	hl
   7525 56            [ 7]  677 	ld	d,(hl)
   7526 0A            [ 7]  678 	ld	a,(bc)
   7527 C5            [11]  679 	push	bc
   7528 D5            [11]  680 	push	de
   7529 33            [ 6]  681 	inc	sp
   752A F5            [11]  682 	push	af
   752B 33            [ 6]  683 	inc	sp
   752C 21 00 C0      [10]  684 	ld	hl,#0xC000
   752F E5            [11]  685 	push	hl
   7530 CD 69 64      [17]  686 	call	_cpct_getScreenPtr
   7533 EB            [ 4]  687 	ex	de,hl
                            688 ;src/main.c:187: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   7534 E1            [10]  689 	pop	hl
   7535 01 04 00      [10]  690 	ld	bc, #0x0004
   7538 09            [11]  691 	add	hl, bc
   7539 4E            [ 7]  692 	ld	c,(hl)
   753A 23            [ 6]  693 	inc	hl
   753B 46            [ 7]  694 	ld	b,(hl)
   753C 21 00 0E      [10]  695 	ld	hl,#_g_tablatrans
   753F E5            [11]  696 	push	hl
   7540 21 04 16      [10]  697 	ld	hl,#0x1604
   7543 E5            [11]  698 	push	hl
   7544 D5            [11]  699 	push	de
   7545 C5            [11]  700 	push	bc
   7546 CD 89 64      [17]  701 	call	_cpct_drawSpriteMaskedAlignedTable
   7549 DD E1         [14]  702 	pop	ix
   754B C9            [10]  703 	ret
                            704 ;src/main.c:190: void dibujarExplosion(TEnemy *enemy) {
                            705 ;	---------------------------------
                            706 ; Function dibujarExplosion
                            707 ; ---------------------------------
   754C                     708 _dibujarExplosion::
   754C DD E5         [15]  709 	push	ix
   754E DD 21 00 00   [14]  710 	ld	ix,#0
   7552 DD 39         [15]  711 	add	ix,sp
                            712 ;src/main.c:191: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   7554 DD 4E 04      [19]  713 	ld	c,4 (ix)
   7557 DD 46 05      [19]  714 	ld	b,5 (ix)
   755A 69            [ 4]  715 	ld	l, c
   755B 60            [ 4]  716 	ld	h, b
   755C 23            [ 6]  717 	inc	hl
   755D 56            [ 7]  718 	ld	d,(hl)
   755E 0A            [ 7]  719 	ld	a,(bc)
   755F 47            [ 4]  720 	ld	b,a
   7560 D5            [11]  721 	push	de
   7561 33            [ 6]  722 	inc	sp
   7562 C5            [11]  723 	push	bc
   7563 33            [ 6]  724 	inc	sp
   7564 21 00 C0      [10]  725 	ld	hl,#0xC000
   7567 E5            [11]  726 	push	hl
   7568 CD 69 64      [17]  727 	call	_cpct_getScreenPtr
   756B 4D            [ 4]  728 	ld	c,l
   756C 44            [ 4]  729 	ld	b,h
                            730 ;src/main.c:192: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   756D 11 00 0E      [10]  731 	ld	de,#_g_tablatrans+0
   7570 D5            [11]  732 	push	de
   7571 21 04 16      [10]  733 	ld	hl,#0x1604
   7574 E5            [11]  734 	push	hl
   7575 C5            [11]  735 	push	bc
   7576 21 A8 25      [10]  736 	ld	hl,#_g_explosion
   7579 E5            [11]  737 	push	hl
   757A CD 89 64      [17]  738 	call	_cpct_drawSpriteMaskedAlignedTable
   757D DD E1         [14]  739 	pop	ix
   757F C9            [10]  740 	ret
                            741 ;src/main.c:195: void borrarExplosion() {
                            742 ;	---------------------------------
                            743 ; Function borrarExplosion
                            744 ; ---------------------------------
   7580                     745 _borrarExplosion::
   7580 DD E5         [15]  746 	push	ix
   7582 DD 21 00 00   [14]  747 	ld	ix,#0
   7586 DD 39         [15]  748 	add	ix,sp
   7588 F5            [11]  749 	push	af
   7589 3B            [ 6]  750 	dec	sp
                            751 ;src/main.c:196: u8 w = 4 + (enemy->px & 1);
   758A 21 C8 64      [10]  752 	ld	hl, #_enemy + 2
   758D 4E            [ 7]  753 	ld	c,(hl)
   758E 79            [ 4]  754 	ld	a,c
   758F E6 01         [ 7]  755 	and	a, #0x01
   7591 47            [ 4]  756 	ld	b,a
   7592 04            [ 4]  757 	inc	b
   7593 04            [ 4]  758 	inc	b
   7594 04            [ 4]  759 	inc	b
   7595 04            [ 4]  760 	inc	b
                            761 ;src/main.c:199: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   7596 21 C9 64      [10]  762 	ld	hl, #_enemy + 3
   7599 5E            [ 7]  763 	ld	e,(hl)
   759A CB 4B         [ 8]  764 	bit	1, e
   759C 28 04         [12]  765 	jr	Z,00103$
   759E 3E 01         [ 7]  766 	ld	a,#0x01
   75A0 18 02         [12]  767 	jr	00104$
   75A2                     768 00103$:
   75A2 3E 00         [ 7]  769 	ld	a,#0x00
   75A4                     770 00104$:
   75A4 C6 07         [ 7]  771 	add	a, #0x07
   75A6 DD 77 FD      [19]  772 	ld	-3 (ix),a
                            773 ;src/main.c:201: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   75A9 FD 2A E9 69   [20]  774 	ld	iy,(_mapa)
   75AD 16 00         [ 7]  775 	ld	d,#0x00
   75AF 7B            [ 4]  776 	ld	a,e
   75B0 C6 E8         [ 7]  777 	add	a,#0xE8
   75B2 DD 77 FE      [19]  778 	ld	-2 (ix),a
   75B5 7A            [ 4]  779 	ld	a,d
   75B6 CE FF         [ 7]  780 	adc	a,#0xFF
   75B8 DD 77 FF      [19]  781 	ld	-1 (ix),a
   75BB DD 6E FE      [19]  782 	ld	l,-2 (ix)
   75BE DD 66 FF      [19]  783 	ld	h,-1 (ix)
   75C1 DD CB FF 7E   [20]  784 	bit	7, -1 (ix)
   75C5 28 04         [12]  785 	jr	Z,00105$
   75C7 21 EB FF      [10]  786 	ld	hl,#0xFFEB
   75CA 19            [11]  787 	add	hl,de
   75CB                     788 00105$:
   75CB CB 2C         [ 8]  789 	sra	h
   75CD CB 1D         [ 8]  790 	rr	l
   75CF CB 2C         [ 8]  791 	sra	h
   75D1 CB 1D         [ 8]  792 	rr	l
   75D3 55            [ 4]  793 	ld	d,l
   75D4 CB 39         [ 8]  794 	srl	c
   75D6 FD E5         [15]  795 	push	iy
   75D8 21 F0 C0      [10]  796 	ld	hl,#0xC0F0
   75DB E5            [11]  797 	push	hl
   75DC 3E 28         [ 7]  798 	ld	a,#0x28
   75DE F5            [11]  799 	push	af
   75DF 33            [ 6]  800 	inc	sp
   75E0 DD 7E FD      [19]  801 	ld	a,-3 (ix)
   75E3 F5            [11]  802 	push	af
   75E4 33            [ 6]  803 	inc	sp
   75E5 C5            [11]  804 	push	bc
   75E6 33            [ 6]  805 	inc	sp
   75E7 D5            [11]  806 	push	de
   75E8 33            [ 6]  807 	inc	sp
   75E9 79            [ 4]  808 	ld	a,c
   75EA F5            [11]  809 	push	af
   75EB 33            [ 6]  810 	inc	sp
   75EC CD 62 59      [17]  811 	call	_cpct_etm_drawTileBox2x4
   75EF DD F9         [10]  812 	ld	sp, ix
   75F1 DD E1         [14]  813 	pop	ix
   75F3 C9            [10]  814 	ret
                            815 ;src/main.c:205: void borrarEnemigo(TEnemy *enemy) {
                            816 ;	---------------------------------
                            817 ; Function borrarEnemigo
                            818 ; ---------------------------------
   75F4                     819 _borrarEnemigo::
   75F4 DD E5         [15]  820 	push	ix
   75F6 DD 21 00 00   [14]  821 	ld	ix,#0
   75FA DD 39         [15]  822 	add	ix,sp
   75FC 21 FA FF      [10]  823 	ld	hl,#-6
   75FF 39            [11]  824 	add	hl,sp
   7600 F9            [ 6]  825 	ld	sp,hl
                            826 ;src/main.c:207: u8 w = 4 + (enemy->px & 1);
   7601 DD 4E 04      [19]  827 	ld	c,4 (ix)
   7604 DD 46 05      [19]  828 	ld	b,5 (ix)
   7607 69            [ 4]  829 	ld	l, c
   7608 60            [ 4]  830 	ld	h, b
   7609 23            [ 6]  831 	inc	hl
   760A 23            [ 6]  832 	inc	hl
   760B 5E            [ 7]  833 	ld	e,(hl)
   760C 7B            [ 4]  834 	ld	a,e
   760D E6 01         [ 7]  835 	and	a, #0x01
   760F C6 04         [ 7]  836 	add	a, #0x04
   7611 DD 77 FA      [19]  837 	ld	-6 (ix),a
                            838 ;src/main.c:210: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   7614 69            [ 4]  839 	ld	l, c
   7615 60            [ 4]  840 	ld	h, b
   7616 23            [ 6]  841 	inc	hl
   7617 23            [ 6]  842 	inc	hl
   7618 23            [ 6]  843 	inc	hl
   7619 56            [ 7]  844 	ld	d,(hl)
   761A CB 4A         [ 8]  845 	bit	1, d
   761C 28 04         [12]  846 	jr	Z,00103$
   761E 3E 01         [ 7]  847 	ld	a,#0x01
   7620 18 02         [12]  848 	jr	00104$
   7622                     849 00103$:
   7622 3E 00         [ 7]  850 	ld	a,#0x00
   7624                     851 00104$:
   7624 C6 07         [ 7]  852 	add	a, #0x07
   7626 DD 77 FB      [19]  853 	ld	-5 (ix),a
                            854 ;src/main.c:212: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   7629 FD 2A E9 69   [20]  855 	ld	iy,(_mapa)
   762D DD 72 FE      [19]  856 	ld	-2 (ix),d
   7630 DD 36 FF 00   [19]  857 	ld	-1 (ix),#0x00
   7634 DD 7E FE      [19]  858 	ld	a,-2 (ix)
   7637 C6 E8         [ 7]  859 	add	a,#0xE8
   7639 DD 77 FC      [19]  860 	ld	-4 (ix),a
   763C DD 7E FF      [19]  861 	ld	a,-1 (ix)
   763F CE FF         [ 7]  862 	adc	a,#0xFF
   7641 DD 77 FD      [19]  863 	ld	-3 (ix),a
   7644 DD 56 FC      [19]  864 	ld	d,-4 (ix)
   7647 DD 6E FD      [19]  865 	ld	l,-3 (ix)
   764A DD CB FD 7E   [20]  866 	bit	7, -3 (ix)
   764E 28 0C         [12]  867 	jr	Z,00105$
   7650 DD 7E FE      [19]  868 	ld	a,-2 (ix)
   7653 C6 EB         [ 7]  869 	add	a, #0xEB
   7655 57            [ 4]  870 	ld	d,a
   7656 DD 7E FF      [19]  871 	ld	a,-1 (ix)
   7659 CE FF         [ 7]  872 	adc	a, #0xFF
   765B 6F            [ 4]  873 	ld	l,a
   765C                     874 00105$:
   765C CB 2D         [ 8]  875 	sra	l
   765E CB 1A         [ 8]  876 	rr	d
   7660 CB 2D         [ 8]  877 	sra	l
   7662 CB 1A         [ 8]  878 	rr	d
   7664 CB 3B         [ 8]  879 	srl	e
   7666 C5            [11]  880 	push	bc
   7667 FD E5         [15]  881 	push	iy
   7669 21 F0 C0      [10]  882 	ld	hl,#0xC0F0
   766C E5            [11]  883 	push	hl
   766D 3E 28         [ 7]  884 	ld	a,#0x28
   766F F5            [11]  885 	push	af
   7670 33            [ 6]  886 	inc	sp
   7671 DD 66 FB      [19]  887 	ld	h,-5 (ix)
   7674 DD 6E FA      [19]  888 	ld	l,-6 (ix)
   7677 E5            [11]  889 	push	hl
   7678 D5            [11]  890 	push	de
   7679 CD 62 59      [17]  891 	call	_cpct_etm_drawTileBox2x4
   767C C1            [10]  892 	pop	bc
                            893 ;src/main.c:214: enemy->mover = NO;
   767D 21 06 00      [10]  894 	ld	hl,#0x0006
   7680 09            [11]  895 	add	hl,bc
   7681 36 00         [10]  896 	ld	(hl),#0x00
   7683 DD F9         [10]  897 	ld	sp, ix
   7685 DD E1         [14]  898 	pop	ix
   7687 C9            [10]  899 	ret
                            900 ;src/main.c:217: void redibujarEnemigo(TEnemy *enemy) {
                            901 ;	---------------------------------
                            902 ; Function redibujarEnemigo
                            903 ; ---------------------------------
   7688                     904 _redibujarEnemigo::
   7688 DD E5         [15]  905 	push	ix
   768A DD 21 00 00   [14]  906 	ld	ix,#0
   768E DD 39         [15]  907 	add	ix,sp
                            908 ;src/main.c:218: borrarEnemigo(enemy);
   7690 DD 6E 04      [19]  909 	ld	l,4 (ix)
   7693 DD 66 05      [19]  910 	ld	h,5 (ix)
   7696 E5            [11]  911 	push	hl
   7697 CD F4 75      [17]  912 	call	_borrarEnemigo
   769A F1            [10]  913 	pop	af
                            914 ;src/main.c:219: enemy->px = enemy->x;
   769B DD 4E 04      [19]  915 	ld	c,4 (ix)
   769E DD 46 05      [19]  916 	ld	b,5 (ix)
   76A1 59            [ 4]  917 	ld	e, c
   76A2 50            [ 4]  918 	ld	d, b
   76A3 13            [ 6]  919 	inc	de
   76A4 13            [ 6]  920 	inc	de
   76A5 0A            [ 7]  921 	ld	a,(bc)
   76A6 12            [ 7]  922 	ld	(de),a
                            923 ;src/main.c:220: enemy->py = enemy->y;
   76A7 59            [ 4]  924 	ld	e, c
   76A8 50            [ 4]  925 	ld	d, b
   76A9 13            [ 6]  926 	inc	de
   76AA 13            [ 6]  927 	inc	de
   76AB 13            [ 6]  928 	inc	de
   76AC 69            [ 4]  929 	ld	l, c
   76AD 60            [ 4]  930 	ld	h, b
   76AE 23            [ 6]  931 	inc	hl
   76AF 7E            [ 7]  932 	ld	a,(hl)
   76B0 12            [ 7]  933 	ld	(de),a
                            934 ;src/main.c:221: dibujarEnemigo(enemy);
   76B1 C5            [11]  935 	push	bc
   76B2 CD 14 75      [17]  936 	call	_dibujarEnemigo
   76B5 F1            [10]  937 	pop	af
   76B6 DD E1         [14]  938 	pop	ix
   76B8 C9            [10]  939 	ret
                            940 ;src/main.c:224: u8 checkEnemyCollision(int direction, TEnemy *enemy){
                            941 ;	---------------------------------
                            942 ; Function checkEnemyCollision
                            943 ; ---------------------------------
   76B9                     944 _checkEnemyCollision::
   76B9 DD E5         [15]  945 	push	ix
   76BB DD 21 00 00   [14]  946 	ld	ix,#0
   76BF DD 39         [15]  947 	add	ix,sp
   76C1 21 F7 FF      [10]  948 	ld	hl,#-9
   76C4 39            [11]  949 	add	hl,sp
   76C5 F9            [ 6]  950 	ld	sp,hl
                            951 ;src/main.c:226: u8 colisiona = 1;
   76C6 DD 36 F7 01   [19]  952 	ld	-9 (ix),#0x01
                            953 ;src/main.c:228: switch (direction) {
   76CA DD CB 05 7E   [20]  954 	bit	7, 5 (ix)
   76CE C2 81 7A      [10]  955 	jp	NZ,00165$
   76D1 3E 03         [ 7]  956 	ld	a,#0x03
   76D3 DD BE 04      [19]  957 	cp	a, 4 (ix)
   76D6 3E 00         [ 7]  958 	ld	a,#0x00
   76D8 DD 9E 05      [19]  959 	sbc	a, 5 (ix)
   76DB E2 E0 76      [10]  960 	jp	PO, 00272$
   76DE EE 80         [ 7]  961 	xor	a, #0x80
   76E0                     962 00272$:
   76E0 FA 81 7A      [10]  963 	jp	M,00165$
                            964 ;src/main.c:230: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   76E3 DD 4E 06      [19]  965 	ld	c,6 (ix)
   76E6 DD 46 07      [19]  966 	ld	b,7 (ix)
   76E9 0A            [ 7]  967 	ld	a,(bc)
   76EA 5F            [ 4]  968 	ld	e,a
   76EB 21 01 00      [10]  969 	ld	hl,#0x0001
   76EE 09            [11]  970 	add	hl,bc
   76EF DD 75 F8      [19]  971 	ld	-8 (ix),l
   76F2 DD 74 F9      [19]  972 	ld	-7 (ix),h
   76F5 DD 6E F8      [19]  973 	ld	l,-8 (ix)
   76F8 DD 66 F9      [19]  974 	ld	h,-7 (ix)
   76FB 56            [ 7]  975 	ld	d,(hl)
                            976 ;src/main.c:243: enemy->muerto = SI;
   76FC 21 08 00      [10]  977 	ld	hl,#0x0008
   76FF 09            [11]  978 	add	hl,bc
   7700 DD 75 FA      [19]  979 	ld	-6 (ix),l
   7703 DD 74 FB      [19]  980 	ld	-5 (ix),h
                            981 ;src/main.c:250: enemy->mira = M_izquierda;
   7706 21 07 00      [10]  982 	ld	hl,#0x0007
   7709 09            [11]  983 	add	hl,bc
   770A DD 75 FC      [19]  984 	ld	-4 (ix),l
   770D DD 74 FD      [19]  985 	ld	-3 (ix),h
                            986 ;src/main.c:228: switch (direction) {
   7710 D5            [11]  987 	push	de
   7711 DD 5E 04      [19]  988 	ld	e,4 (ix)
   7714 16 00         [ 7]  989 	ld	d,#0x00
   7716 21 1E 77      [10]  990 	ld	hl,#00273$
   7719 19            [11]  991 	add	hl,de
   771A 19            [11]  992 	add	hl,de
   771B 19            [11]  993 	add	hl,de
   771C D1            [10]  994 	pop	de
   771D E9            [ 4]  995 	jp	(hl)
   771E                     996 00273$:
   771E C3 2A 77      [10]  997 	jp	00101$
   7721 C3 03 78      [10]  998 	jp	00117$
   7724 C3 D8 78      [10]  999 	jp	00133$
   7727 C3 A7 79      [10] 1000 	jp	00149$
                           1001 ;src/main.c:229: case 0:
   772A                    1002 00101$:
                           1003 ;src/main.c:230: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   772A 7B            [ 4] 1004 	ld	a,e
   772B C6 05         [ 7] 1005 	add	a, #0x05
   772D C5            [11] 1006 	push	bc
   772E D5            [11] 1007 	push	de
   772F 33            [ 6] 1008 	inc	sp
   7730 F5            [11] 1009 	push	af
   7731 33            [ 6] 1010 	inc	sp
   7732 CD 7E 73      [17] 1011 	call	_getTilePtr
   7735 F1            [10] 1012 	pop	af
   7736 C1            [10] 1013 	pop	bc
   7737 5E            [ 7] 1014 	ld	e,(hl)
   7738 3E 02         [ 7] 1015 	ld	a,#0x02
   773A 93            [ 4] 1016 	sub	a, e
   773B DA F8 77      [10] 1017 	jp	C,00113$
                           1018 ;src/main.c:231: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   773E DD 6E F8      [19] 1019 	ld	l,-8 (ix)
   7741 DD 66 F9      [19] 1020 	ld	h,-7 (ix)
   7744 7E            [ 7] 1021 	ld	a,(hl)
   7745 C6 0B         [ 7] 1022 	add	a, #0x0B
   7747 57            [ 4] 1023 	ld	d,a
   7748 0A            [ 7] 1024 	ld	a,(bc)
   7749 C6 05         [ 7] 1025 	add	a, #0x05
   774B C5            [11] 1026 	push	bc
   774C D5            [11] 1027 	push	de
   774D 33            [ 6] 1028 	inc	sp
   774E F5            [11] 1029 	push	af
   774F 33            [ 6] 1030 	inc	sp
   7750 CD 7E 73      [17] 1031 	call	_getTilePtr
   7753 F1            [10] 1032 	pop	af
   7754 C1            [10] 1033 	pop	bc
   7755 5E            [ 7] 1034 	ld	e,(hl)
   7756 3E 02         [ 7] 1035 	ld	a,#0x02
   7758 93            [ 4] 1036 	sub	a, e
   7759 DA F8 77      [10] 1037 	jp	C,00113$
                           1038 ;src/main.c:232: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   775C DD 6E F8      [19] 1039 	ld	l,-8 (ix)
   775F DD 66 F9      [19] 1040 	ld	h,-7 (ix)
   7762 7E            [ 7] 1041 	ld	a,(hl)
   7763 C6 16         [ 7] 1042 	add	a, #0x16
   7765 57            [ 4] 1043 	ld	d,a
   7766 0A            [ 7] 1044 	ld	a,(bc)
   7767 C6 05         [ 7] 1045 	add	a, #0x05
   7769 C5            [11] 1046 	push	bc
   776A D5            [11] 1047 	push	de
   776B 33            [ 6] 1048 	inc	sp
   776C F5            [11] 1049 	push	af
   776D 33            [ 6] 1050 	inc	sp
   776E CD 7E 73      [17] 1051 	call	_getTilePtr
   7771 F1            [10] 1052 	pop	af
   7772 C1            [10] 1053 	pop	bc
   7773 5E            [ 7] 1054 	ld	e,(hl)
   7774 3E 02         [ 7] 1055 	ld	a,#0x02
   7776 93            [ 4] 1056 	sub	a, e
   7777 DA F8 77      [10] 1057 	jp	C,00113$
                           1058 ;src/main.c:234: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   777A 21 DF 69      [10] 1059 	ld	hl, #_cu + 1
   777D 5E            [ 7] 1060 	ld	e,(hl)
   777E 16 00         [ 7] 1061 	ld	d,#0x00
   7780 21 04 00      [10] 1062 	ld	hl,#0x0004
   7783 19            [11] 1063 	add	hl,de
   7784 DD 75 FE      [19] 1064 	ld	-2 (ix),l
   7787 DD 74 FF      [19] 1065 	ld	-1 (ix),h
   778A DD 6E F8      [19] 1066 	ld	l,-8 (ix)
   778D DD 66 F9      [19] 1067 	ld	h,-7 (ix)
   7790 6E            [ 7] 1068 	ld	l,(hl)
   7791 26 00         [ 7] 1069 	ld	h,#0x00
   7793 DD 7E FE      [19] 1070 	ld	a,-2 (ix)
   7796 95            [ 4] 1071 	sub	a, l
   7797 DD 7E FF      [19] 1072 	ld	a,-1 (ix)
   779A 9C            [ 4] 1073 	sbc	a, h
   779B E2 A0 77      [10] 1074 	jp	PO, 00274$
   779E EE 80         [ 7] 1075 	xor	a, #0x80
   77A0                    1076 00274$:
   77A0 FA B5 77      [10] 1077 	jp	M,00108$
   77A3 D5            [11] 1078 	push	de
   77A4 11 16 00      [10] 1079 	ld	de,#0x0016
   77A7 19            [11] 1080 	add	hl, de
   77A8 D1            [10] 1081 	pop	de
   77A9 7D            [ 4] 1082 	ld	a,l
   77AA 93            [ 4] 1083 	sub	a, e
   77AB 7C            [ 4] 1084 	ld	a,h
   77AC 9A            [ 4] 1085 	sbc	a, d
   77AD E2 B2 77      [10] 1086 	jp	PO, 00275$
   77B0 EE 80         [ 7] 1087 	xor	a, #0x80
   77B2                    1088 00275$:
   77B2 F2 BC 77      [10] 1089 	jp	P,00109$
   77B5                    1090 00108$:
                           1091 ;src/main.c:235: colisiona = 0;
   77B5 DD 36 F7 00   [19] 1092 	ld	-9 (ix),#0x00
   77B9 C3 81 7A      [10] 1093 	jp	00165$
   77BC                    1094 00109$:
                           1095 ;src/main.c:238: if(cu.x > enemy->x){ //si el cu esta abajo
   77BC 21 DE 69      [10] 1096 	ld	hl, #_cu + 0
   77BF 5E            [ 7] 1097 	ld	e,(hl)
   77C0 0A            [ 7] 1098 	ld	a,(bc)
   77C1 4F            [ 4] 1099 	ld	c,a
   77C2 93            [ 4] 1100 	sub	a, e
   77C3 30 2C         [12] 1101 	jr	NC,00106$
                           1102 ;src/main.c:239: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
   77C5 6B            [ 4] 1103 	ld	l,e
   77C6 26 00         [ 7] 1104 	ld	h,#0x00
   77C8 06 00         [ 7] 1105 	ld	b,#0x00
   77CA 03            [ 6] 1106 	inc	bc
   77CB 03            [ 6] 1107 	inc	bc
   77CC 03            [ 6] 1108 	inc	bc
   77CD 03            [ 6] 1109 	inc	bc
   77CE BF            [ 4] 1110 	cp	a, a
   77CF ED 42         [15] 1111 	sbc	hl, bc
   77D1 3E 01         [ 7] 1112 	ld	a,#0x01
   77D3 BD            [ 4] 1113 	cp	a, l
   77D4 3E 00         [ 7] 1114 	ld	a,#0x00
   77D6 9C            [ 4] 1115 	sbc	a, h
   77D7 E2 DC 77      [10] 1116 	jp	PO, 00276$
   77DA EE 80         [ 7] 1117 	xor	a, #0x80
   77DC                    1118 00276$:
   77DC F2 E6 77      [10] 1119 	jp	P,00103$
                           1120 ;src/main.c:240: colisiona = 0;
   77DF DD 36 F7 00   [19] 1121 	ld	-9 (ix),#0x00
   77E3 C3 81 7A      [10] 1122 	jp	00165$
   77E6                    1123 00103$:
                           1124 ;src/main.c:243: enemy->muerto = SI;
   77E6 DD 6E FA      [19] 1125 	ld	l,-6 (ix)
   77E9 DD 66 FB      [19] 1126 	ld	h,-5 (ix)
   77EC 36 01         [10] 1127 	ld	(hl),#0x01
   77EE C3 81 7A      [10] 1128 	jp	00165$
   77F1                    1129 00106$:
                           1130 ;src/main.c:246: colisiona = 0;
   77F1 DD 36 F7 00   [19] 1131 	ld	-9 (ix),#0x00
   77F5 C3 81 7A      [10] 1132 	jp	00165$
   77F8                    1133 00113$:
                           1134 ;src/main.c:250: enemy->mira = M_izquierda;
   77F8 DD 6E FC      [19] 1135 	ld	l,-4 (ix)
   77FB DD 66 FD      [19] 1136 	ld	h,-3 (ix)
   77FE 36 01         [10] 1137 	ld	(hl),#0x01
                           1138 ;src/main.c:252: break;
   7800 C3 81 7A      [10] 1139 	jp	00165$
                           1140 ;src/main.c:253: case 1:
   7803                    1141 00117$:
                           1142 ;src/main.c:254: if( *getTilePtr(enemy->x - 1, enemy->y) <= 2
   7803 1D            [ 4] 1143 	dec	e
   7804 C5            [11] 1144 	push	bc
   7805 D5            [11] 1145 	push	de
   7806 CD 7E 73      [17] 1146 	call	_getTilePtr
   7809 F1            [10] 1147 	pop	af
   780A C1            [10] 1148 	pop	bc
   780B 5E            [ 7] 1149 	ld	e,(hl)
   780C 3E 02         [ 7] 1150 	ld	a,#0x02
   780E 93            [ 4] 1151 	sub	a, e
   780F DA CD 78      [10] 1152 	jp	C,00129$
                           1153 ;src/main.c:255: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   7812 DD 6E F8      [19] 1154 	ld	l,-8 (ix)
   7815 DD 66 F9      [19] 1155 	ld	h,-7 (ix)
   7818 7E            [ 7] 1156 	ld	a,(hl)
   7819 C6 0B         [ 7] 1157 	add	a, #0x0B
   781B 57            [ 4] 1158 	ld	d,a
   781C 0A            [ 7] 1159 	ld	a,(bc)
   781D C6 FF         [ 7] 1160 	add	a,#0xFF
   781F C5            [11] 1161 	push	bc
   7820 D5            [11] 1162 	push	de
   7821 33            [ 6] 1163 	inc	sp
   7822 F5            [11] 1164 	push	af
   7823 33            [ 6] 1165 	inc	sp
   7824 CD 7E 73      [17] 1166 	call	_getTilePtr
   7827 F1            [10] 1167 	pop	af
   7828 C1            [10] 1168 	pop	bc
   7829 5E            [ 7] 1169 	ld	e,(hl)
   782A 3E 02         [ 7] 1170 	ld	a,#0x02
   782C 93            [ 4] 1171 	sub	a, e
   782D DA CD 78      [10] 1172 	jp	C,00129$
                           1173 ;src/main.c:256: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   7830 DD 6E F8      [19] 1174 	ld	l,-8 (ix)
   7833 DD 66 F9      [19] 1175 	ld	h,-7 (ix)
   7836 7E            [ 7] 1176 	ld	a,(hl)
   7837 C6 16         [ 7] 1177 	add	a, #0x16
   7839 57            [ 4] 1178 	ld	d,a
   783A 0A            [ 7] 1179 	ld	a,(bc)
   783B C6 FF         [ 7] 1180 	add	a,#0xFF
   783D C5            [11] 1181 	push	bc
   783E D5            [11] 1182 	push	de
   783F 33            [ 6] 1183 	inc	sp
   7840 F5            [11] 1184 	push	af
   7841 33            [ 6] 1185 	inc	sp
   7842 CD 7E 73      [17] 1186 	call	_getTilePtr
   7845 F1            [10] 1187 	pop	af
   7846 C1            [10] 1188 	pop	bc
   7847 5E            [ 7] 1189 	ld	e,(hl)
   7848 3E 02         [ 7] 1190 	ld	a,#0x02
   784A 93            [ 4] 1191 	sub	a, e
   784B DA CD 78      [10] 1192 	jp	C,00129$
                           1193 ;src/main.c:258: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   784E 21 DF 69      [10] 1194 	ld	hl, #_cu + 1
   7851 5E            [ 7] 1195 	ld	e,(hl)
   7852 16 00         [ 7] 1196 	ld	d,#0x00
   7854 21 04 00      [10] 1197 	ld	hl,#0x0004
   7857 19            [11] 1198 	add	hl,de
   7858 DD 75 FE      [19] 1199 	ld	-2 (ix),l
   785B DD 74 FF      [19] 1200 	ld	-1 (ix),h
   785E DD 6E F8      [19] 1201 	ld	l,-8 (ix)
   7861 DD 66 F9      [19] 1202 	ld	h,-7 (ix)
   7864 6E            [ 7] 1203 	ld	l,(hl)
   7865 26 00         [ 7] 1204 	ld	h,#0x00
   7867 DD 7E FE      [19] 1205 	ld	a,-2 (ix)
   786A 95            [ 4] 1206 	sub	a, l
   786B DD 7E FF      [19] 1207 	ld	a,-1 (ix)
   786E 9C            [ 4] 1208 	sbc	a, h
   786F E2 74 78      [10] 1209 	jp	PO, 00277$
   7872 EE 80         [ 7] 1210 	xor	a, #0x80
   7874                    1211 00277$:
   7874 FA 89 78      [10] 1212 	jp	M,00124$
   7877 D5            [11] 1213 	push	de
   7878 11 16 00      [10] 1214 	ld	de,#0x0016
   787B 19            [11] 1215 	add	hl, de
   787C D1            [10] 1216 	pop	de
   787D 7D            [ 4] 1217 	ld	a,l
   787E 93            [ 4] 1218 	sub	a, e
   787F 7C            [ 4] 1219 	ld	a,h
   7880 9A            [ 4] 1220 	sbc	a, d
   7881 E2 86 78      [10] 1221 	jp	PO, 00278$
   7884 EE 80         [ 7] 1222 	xor	a, #0x80
   7886                    1223 00278$:
   7886 F2 90 78      [10] 1224 	jp	P,00125$
   7889                    1225 00124$:
                           1226 ;src/main.c:259: colisiona = 0;
   7889 DD 36 F7 00   [19] 1227 	ld	-9 (ix),#0x00
   788D C3 81 7A      [10] 1228 	jp	00165$
   7890                    1229 00125$:
                           1230 ;src/main.c:262: if(enemy->x > cu.x){ //si el cu esta abajo
   7890 0A            [ 7] 1231 	ld	a,(bc)
   7891 5F            [ 4] 1232 	ld	e,a
   7892 21 DE 69      [10] 1233 	ld	hl, #_cu + 0
   7895 4E            [ 7] 1234 	ld	c,(hl)
   7896 79            [ 4] 1235 	ld	a,c
   7897 93            [ 4] 1236 	sub	a, e
   7898 30 2C         [12] 1237 	jr	NC,00122$
                           1238 ;src/main.c:263: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
   789A 6B            [ 4] 1239 	ld	l,e
   789B 26 00         [ 7] 1240 	ld	h,#0x00
   789D 06 00         [ 7] 1241 	ld	b,#0x00
   789F 03            [ 6] 1242 	inc	bc
   78A0 03            [ 6] 1243 	inc	bc
   78A1 03            [ 6] 1244 	inc	bc
   78A2 03            [ 6] 1245 	inc	bc
   78A3 BF            [ 4] 1246 	cp	a, a
   78A4 ED 42         [15] 1247 	sbc	hl, bc
   78A6 3E 01         [ 7] 1248 	ld	a,#0x01
   78A8 BD            [ 4] 1249 	cp	a, l
   78A9 3E 00         [ 7] 1250 	ld	a,#0x00
   78AB 9C            [ 4] 1251 	sbc	a, h
   78AC E2 B1 78      [10] 1252 	jp	PO, 00279$
   78AF EE 80         [ 7] 1253 	xor	a, #0x80
   78B1                    1254 00279$:
   78B1 F2 BB 78      [10] 1255 	jp	P,00119$
                           1256 ;src/main.c:264: colisiona = 0;
   78B4 DD 36 F7 00   [19] 1257 	ld	-9 (ix),#0x00
   78B8 C3 81 7A      [10] 1258 	jp	00165$
   78BB                    1259 00119$:
                           1260 ;src/main.c:267: enemy->muerto = SI;
   78BB DD 6E FA      [19] 1261 	ld	l,-6 (ix)
   78BE DD 66 FB      [19] 1262 	ld	h,-5 (ix)
   78C1 36 01         [10] 1263 	ld	(hl),#0x01
   78C3 C3 81 7A      [10] 1264 	jp	00165$
   78C6                    1265 00122$:
                           1266 ;src/main.c:270: colisiona = 0;
   78C6 DD 36 F7 00   [19] 1267 	ld	-9 (ix),#0x00
   78CA C3 81 7A      [10] 1268 	jp	00165$
   78CD                    1269 00129$:
                           1270 ;src/main.c:274: enemy->mira = M_derecha;
   78CD DD 6E FC      [19] 1271 	ld	l,-4 (ix)
   78D0 DD 66 FD      [19] 1272 	ld	h,-3 (ix)
   78D3 36 00         [10] 1273 	ld	(hl),#0x00
                           1274 ;src/main.c:276: break;
   78D5 C3 81 7A      [10] 1275 	jp	00165$
                           1276 ;src/main.c:277: case 2:
   78D8                    1277 00133$:
                           1278 ;src/main.c:278: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   78D8 15            [ 4] 1279 	dec	d
   78D9 15            [ 4] 1280 	dec	d
   78DA C5            [11] 1281 	push	bc
   78DB D5            [11] 1282 	push	de
   78DC CD 7E 73      [17] 1283 	call	_getTilePtr
   78DF F1            [10] 1284 	pop	af
   78E0 C1            [10] 1285 	pop	bc
   78E1 5E            [ 7] 1286 	ld	e,(hl)
   78E2 3E 02         [ 7] 1287 	ld	a,#0x02
   78E4 93            [ 4] 1288 	sub	a, e
   78E5 DA 9F 79      [10] 1289 	jp	C,00145$
                           1290 ;src/main.c:279: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   78E8 DD 6E F8      [19] 1291 	ld	l,-8 (ix)
   78EB DD 66 F9      [19] 1292 	ld	h,-7 (ix)
   78EE 56            [ 7] 1293 	ld	d,(hl)
   78EF 15            [ 4] 1294 	dec	d
   78F0 15            [ 4] 1295 	dec	d
   78F1 0A            [ 7] 1296 	ld	a,(bc)
   78F2 C6 02         [ 7] 1297 	add	a, #0x02
   78F4 C5            [11] 1298 	push	bc
   78F5 D5            [11] 1299 	push	de
   78F6 33            [ 6] 1300 	inc	sp
   78F7 F5            [11] 1301 	push	af
   78F8 33            [ 6] 1302 	inc	sp
   78F9 CD 7E 73      [17] 1303 	call	_getTilePtr
   78FC F1            [10] 1304 	pop	af
   78FD C1            [10] 1305 	pop	bc
   78FE 5E            [ 7] 1306 	ld	e,(hl)
   78FF 3E 02         [ 7] 1307 	ld	a,#0x02
   7901 93            [ 4] 1308 	sub	a, e
   7902 DA 9F 79      [10] 1309 	jp	C,00145$
                           1310 ;src/main.c:280: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   7905 DD 6E F8      [19] 1311 	ld	l,-8 (ix)
   7908 DD 66 F9      [19] 1312 	ld	h,-7 (ix)
   790B 56            [ 7] 1313 	ld	d,(hl)
   790C 15            [ 4] 1314 	dec	d
   790D 15            [ 4] 1315 	dec	d
   790E 0A            [ 7] 1316 	ld	a,(bc)
   790F C6 04         [ 7] 1317 	add	a, #0x04
   7911 C5            [11] 1318 	push	bc
   7912 D5            [11] 1319 	push	de
   7913 33            [ 6] 1320 	inc	sp
   7914 F5            [11] 1321 	push	af
   7915 33            [ 6] 1322 	inc	sp
   7916 CD 7E 73      [17] 1323 	call	_getTilePtr
   7919 F1            [10] 1324 	pop	af
   791A C1            [10] 1325 	pop	bc
   791B 5E            [ 7] 1326 	ld	e,(hl)
   791C 3E 02         [ 7] 1327 	ld	a,#0x02
   791E 93            [ 4] 1328 	sub	a, e
   791F DA 9F 79      [10] 1329 	jp	C,00145$
                           1330 ;src/main.c:282: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   7922 21 DE 69      [10] 1331 	ld	hl, #_cu + 0
   7925 5E            [ 7] 1332 	ld	e,(hl)
   7926 16 00         [ 7] 1333 	ld	d,#0x00
   7928 21 02 00      [10] 1334 	ld	hl,#0x0002
   792B 19            [11] 1335 	add	hl,de
   792C DD 75 FE      [19] 1336 	ld	-2 (ix),l
   792F DD 74 FF      [19] 1337 	ld	-1 (ix),h
   7932 0A            [ 7] 1338 	ld	a,(bc)
   7933 6F            [ 4] 1339 	ld	l,a
   7934 26 00         [ 7] 1340 	ld	h,#0x00
   7936 DD 7E FE      [19] 1341 	ld	a,-2 (ix)
   7939 95            [ 4] 1342 	sub	a, l
   793A DD 7E FF      [19] 1343 	ld	a,-1 (ix)
   793D 9C            [ 4] 1344 	sbc	a, h
   793E E2 43 79      [10] 1345 	jp	PO, 00280$
   7941 EE 80         [ 7] 1346 	xor	a, #0x80
   7943                    1347 00280$:
   7943 FA 56 79      [10] 1348 	jp	M,00140$
   7946 23            [ 6] 1349 	inc	hl
   7947 23            [ 6] 1350 	inc	hl
   7948 23            [ 6] 1351 	inc	hl
   7949 23            [ 6] 1352 	inc	hl
   794A 7D            [ 4] 1353 	ld	a,l
   794B 93            [ 4] 1354 	sub	a, e
   794C 7C            [ 4] 1355 	ld	a,h
   794D 9A            [ 4] 1356 	sbc	a, d
   794E E2 53 79      [10] 1357 	jp	PO, 00281$
   7951 EE 80         [ 7] 1358 	xor	a, #0x80
   7953                    1359 00281$:
   7953 F2 5C 79      [10] 1360 	jp	P,00141$
   7956                    1361 00140$:
                           1362 ;src/main.c:284: colisiona = 0;
   7956 DD 36 F7 00   [19] 1363 	ld	-9 (ix),#0x00
   795A 18 4B         [12] 1364 	jr	00149$
   795C                    1365 00141$:
                           1366 ;src/main.c:287: if(enemy->y>cu.y){
   795C DD 6E F8      [19] 1367 	ld	l,-8 (ix)
   795F DD 66 F9      [19] 1368 	ld	h,-7 (ix)
   7962 5E            [ 7] 1369 	ld	e,(hl)
   7963 21 DF 69      [10] 1370 	ld	hl, #(_cu + 0x0001) + 0
   7966 6E            [ 7] 1371 	ld	l,(hl)
   7967 7D            [ 4] 1372 	ld	a,l
   7968 93            [ 4] 1373 	sub	a, e
   7969 30 2E         [12] 1374 	jr	NC,00138$
                           1375 ;src/main.c:288: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   796B 16 00         [ 7] 1376 	ld	d,#0x00
   796D 26 00         [ 7] 1377 	ld	h,#0x00
   796F D5            [11] 1378 	push	de
   7970 11 08 00      [10] 1379 	ld	de,#0x0008
   7973 19            [11] 1380 	add	hl, de
   7974 D1            [10] 1381 	pop	de
   7975 7B            [ 4] 1382 	ld	a,e
   7976 95            [ 4] 1383 	sub	a, l
   7977 5F            [ 4] 1384 	ld	e,a
   7978 7A            [ 4] 1385 	ld	a,d
   7979 9C            [ 4] 1386 	sbc	a, h
   797A 57            [ 4] 1387 	ld	d,a
   797B 3E 02         [ 7] 1388 	ld	a,#0x02
   797D BB            [ 4] 1389 	cp	a, e
   797E 3E 00         [ 7] 1390 	ld	a,#0x00
   7980 9A            [ 4] 1391 	sbc	a, d
   7981 E2 86 79      [10] 1392 	jp	PO, 00282$
   7984 EE 80         [ 7] 1393 	xor	a, #0x80
   7986                    1394 00282$:
   7986 F2 8F 79      [10] 1395 	jp	P,00135$
                           1396 ;src/main.c:289: colisiona = 0;
   7989 DD 36 F7 00   [19] 1397 	ld	-9 (ix),#0x00
   798D 18 18         [12] 1398 	jr	00149$
   798F                    1399 00135$:
                           1400 ;src/main.c:292: enemy->muerto = SI;
   798F DD 6E FA      [19] 1401 	ld	l,-6 (ix)
   7992 DD 66 FB      [19] 1402 	ld	h,-5 (ix)
   7995 36 01         [10] 1403 	ld	(hl),#0x01
   7997 18 0E         [12] 1404 	jr	00149$
   7999                    1405 00138$:
                           1406 ;src/main.c:296: colisiona = 0;
   7999 DD 36 F7 00   [19] 1407 	ld	-9 (ix),#0x00
   799D 18 08         [12] 1408 	jr	00149$
   799F                    1409 00145$:
                           1410 ;src/main.c:302: enemy->mira = M_abajo;
   799F DD 6E FC      [19] 1411 	ld	l,-4 (ix)
   79A2 DD 66 FD      [19] 1412 	ld	h,-3 (ix)
   79A5 36 03         [10] 1413 	ld	(hl),#0x03
                           1414 ;src/main.c:305: case 3:
   79A7                    1415 00149$:
                           1416 ;src/main.c:308: if( *getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   79A7 DD 6E F8      [19] 1417 	ld	l,-8 (ix)
   79AA DD 66 F9      [19] 1418 	ld	h,-7 (ix)
   79AD 7E            [ 7] 1419 	ld	a,(hl)
   79AE C6 18         [ 7] 1420 	add	a, #0x18
   79B0 57            [ 4] 1421 	ld	d,a
   79B1 0A            [ 7] 1422 	ld	a,(bc)
   79B2 C5            [11] 1423 	push	bc
   79B3 D5            [11] 1424 	push	de
   79B4 33            [ 6] 1425 	inc	sp
   79B5 F5            [11] 1426 	push	af
   79B6 33            [ 6] 1427 	inc	sp
   79B7 CD 7E 73      [17] 1428 	call	_getTilePtr
   79BA F1            [10] 1429 	pop	af
   79BB C1            [10] 1430 	pop	bc
   79BC 5E            [ 7] 1431 	ld	e,(hl)
   79BD 3E 02         [ 7] 1432 	ld	a,#0x02
   79BF 93            [ 4] 1433 	sub	a, e
   79C0 DA 79 7A      [10] 1434 	jp	C,00161$
                           1435 ;src/main.c:309: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   79C3 DD 6E F8      [19] 1436 	ld	l,-8 (ix)
   79C6 DD 66 F9      [19] 1437 	ld	h,-7 (ix)
   79C9 7E            [ 7] 1438 	ld	a,(hl)
   79CA C6 18         [ 7] 1439 	add	a, #0x18
   79CC 57            [ 4] 1440 	ld	d,a
   79CD 0A            [ 7] 1441 	ld	a,(bc)
   79CE C6 02         [ 7] 1442 	add	a, #0x02
   79D0 C5            [11] 1443 	push	bc
   79D1 D5            [11] 1444 	push	de
   79D2 33            [ 6] 1445 	inc	sp
   79D3 F5            [11] 1446 	push	af
   79D4 33            [ 6] 1447 	inc	sp
   79D5 CD 7E 73      [17] 1448 	call	_getTilePtr
   79D8 F1            [10] 1449 	pop	af
   79D9 C1            [10] 1450 	pop	bc
   79DA 5E            [ 7] 1451 	ld	e,(hl)
   79DB 3E 02         [ 7] 1452 	ld	a,#0x02
   79DD 93            [ 4] 1453 	sub	a, e
   79DE DA 79 7A      [10] 1454 	jp	C,00161$
                           1455 ;src/main.c:310: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   79E1 DD 6E F8      [19] 1456 	ld	l,-8 (ix)
   79E4 DD 66 F9      [19] 1457 	ld	h,-7 (ix)
   79E7 7E            [ 7] 1458 	ld	a,(hl)
   79E8 C6 18         [ 7] 1459 	add	a, #0x18
   79EA 57            [ 4] 1460 	ld	d,a
   79EB 0A            [ 7] 1461 	ld	a,(bc)
   79EC C6 04         [ 7] 1462 	add	a, #0x04
   79EE C5            [11] 1463 	push	bc
   79EF D5            [11] 1464 	push	de
   79F0 33            [ 6] 1465 	inc	sp
   79F1 F5            [11] 1466 	push	af
   79F2 33            [ 6] 1467 	inc	sp
   79F3 CD 7E 73      [17] 1468 	call	_getTilePtr
   79F6 F1            [10] 1469 	pop	af
   79F7 C1            [10] 1470 	pop	bc
   79F8 5E            [ 7] 1471 	ld	e,(hl)
   79F9 3E 02         [ 7] 1472 	ld	a,#0x02
   79FB 93            [ 4] 1473 	sub	a, e
   79FC 38 7B         [12] 1474 	jr	C,00161$
                           1475 ;src/main.c:312: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   79FE 21 DE 69      [10] 1476 	ld	hl, #_cu + 0
   7A01 5E            [ 7] 1477 	ld	e,(hl)
   7A02 16 00         [ 7] 1478 	ld	d,#0x00
   7A04 21 02 00      [10] 1479 	ld	hl,#0x0002
   7A07 19            [11] 1480 	add	hl,de
   7A08 DD 75 FE      [19] 1481 	ld	-2 (ix),l
   7A0B DD 74 FF      [19] 1482 	ld	-1 (ix),h
   7A0E 0A            [ 7] 1483 	ld	a,(bc)
   7A0F 4F            [ 4] 1484 	ld	c,a
   7A10 06 00         [ 7] 1485 	ld	b,#0x00
   7A12 DD 7E FE      [19] 1486 	ld	a,-2 (ix)
   7A15 91            [ 4] 1487 	sub	a, c
   7A16 DD 7E FF      [19] 1488 	ld	a,-1 (ix)
   7A19 98            [ 4] 1489 	sbc	a, b
   7A1A E2 1F 7A      [10] 1490 	jp	PO, 00283$
   7A1D EE 80         [ 7] 1491 	xor	a, #0x80
   7A1F                    1492 00283$:
   7A1F FA 32 7A      [10] 1493 	jp	M,00156$
   7A22 03            [ 6] 1494 	inc	bc
   7A23 03            [ 6] 1495 	inc	bc
   7A24 03            [ 6] 1496 	inc	bc
   7A25 03            [ 6] 1497 	inc	bc
   7A26 79            [ 4] 1498 	ld	a,c
   7A27 93            [ 4] 1499 	sub	a, e
   7A28 78            [ 4] 1500 	ld	a,b
   7A29 9A            [ 4] 1501 	sbc	a, d
   7A2A E2 2F 7A      [10] 1502 	jp	PO, 00284$
   7A2D EE 80         [ 7] 1503 	xor	a, #0x80
   7A2F                    1504 00284$:
   7A2F F2 38 7A      [10] 1505 	jp	P,00157$
   7A32                    1506 00156$:
                           1507 ;src/main.c:313: colisiona = 0;
   7A32 DD 36 F7 00   [19] 1508 	ld	-9 (ix),#0x00
   7A36 18 49         [12] 1509 	jr	00165$
   7A38                    1510 00157$:
                           1511 ;src/main.c:316: if(cu.y > enemy->y){ //si el cu esta abajo
   7A38 21 DF 69      [10] 1512 	ld	hl, #(_cu + 0x0001) + 0
   7A3B 4E            [ 7] 1513 	ld	c,(hl)
   7A3C DD 6E F8      [19] 1514 	ld	l,-8 (ix)
   7A3F DD 66 F9      [19] 1515 	ld	h,-7 (ix)
   7A42 5E            [ 7] 1516 	ld	e,(hl)
   7A43 7B            [ 4] 1517 	ld	a,e
   7A44 91            [ 4] 1518 	sub	a, c
   7A45 30 2C         [12] 1519 	jr	NC,00154$
                           1520 ;src/main.c:317: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   7A47 06 00         [ 7] 1521 	ld	b,#0x00
   7A49 16 00         [ 7] 1522 	ld	d,#0x00
   7A4B 21 16 00      [10] 1523 	ld	hl,#0x0016
   7A4E 19            [11] 1524 	add	hl,de
   7A4F 79            [ 4] 1525 	ld	a,c
   7A50 95            [ 4] 1526 	sub	a, l
   7A51 4F            [ 4] 1527 	ld	c,a
   7A52 78            [ 4] 1528 	ld	a,b
   7A53 9C            [ 4] 1529 	sbc	a, h
   7A54 47            [ 4] 1530 	ld	b,a
   7A55 3E 02         [ 7] 1531 	ld	a,#0x02
   7A57 B9            [ 4] 1532 	cp	a, c
   7A58 3E 00         [ 7] 1533 	ld	a,#0x00
   7A5A 98            [ 4] 1534 	sbc	a, b
   7A5B E2 60 7A      [10] 1535 	jp	PO, 00285$
   7A5E EE 80         [ 7] 1536 	xor	a, #0x80
   7A60                    1537 00285$:
   7A60 F2 69 7A      [10] 1538 	jp	P,00151$
                           1539 ;src/main.c:318: colisiona = 0;
   7A63 DD 36 F7 00   [19] 1540 	ld	-9 (ix),#0x00
   7A67 18 18         [12] 1541 	jr	00165$
   7A69                    1542 00151$:
                           1543 ;src/main.c:321: enemy->muerto = SI;
   7A69 DD 6E FA      [19] 1544 	ld	l,-6 (ix)
   7A6C DD 66 FB      [19] 1545 	ld	h,-5 (ix)
   7A6F 36 01         [10] 1546 	ld	(hl),#0x01
   7A71 18 0E         [12] 1547 	jr	00165$
   7A73                    1548 00154$:
                           1549 ;src/main.c:325: colisiona = 0;
   7A73 DD 36 F7 00   [19] 1550 	ld	-9 (ix),#0x00
   7A77 18 08         [12] 1551 	jr	00165$
   7A79                    1552 00161$:
                           1553 ;src/main.c:329: enemy->mira = M_arriba;
   7A79 DD 6E FC      [19] 1554 	ld	l,-4 (ix)
   7A7C DD 66 FD      [19] 1555 	ld	h,-3 (ix)
   7A7F 36 02         [10] 1556 	ld	(hl),#0x02
                           1557 ;src/main.c:332: }
   7A81                    1558 00165$:
                           1559 ;src/main.c:333: return colisiona;
   7A81 DD 6E F7      [19] 1560 	ld	l,-9 (ix)
   7A84 DD F9         [10] 1561 	ld	sp, ix
   7A86 DD E1         [14] 1562 	pop	ix
   7A88 C9            [10] 1563 	ret
                           1564 ;src/main.c:336: void moverEnemigoArriba(TEnemy *enemy){
                           1565 ;	---------------------------------
                           1566 ; Function moverEnemigoArriba
                           1567 ; ---------------------------------
   7A89                    1568 _moverEnemigoArriba::
   7A89 DD E5         [15] 1569 	push	ix
   7A8B DD 21 00 00   [14] 1570 	ld	ix,#0
   7A8F DD 39         [15] 1571 	add	ix,sp
                           1572 ;src/main.c:337: enemy->y--;
   7A91 DD 4E 04      [19] 1573 	ld	c,4 (ix)
   7A94 DD 46 05      [19] 1574 	ld	b,5 (ix)
   7A97 69            [ 4] 1575 	ld	l, c
   7A98 60            [ 4] 1576 	ld	h, b
   7A99 23            [ 6] 1577 	inc	hl
   7A9A 5E            [ 7] 1578 	ld	e,(hl)
   7A9B 1D            [ 4] 1579 	dec	e
   7A9C 73            [ 7] 1580 	ld	(hl),e
                           1581 ;src/main.c:338: enemy->y--;
   7A9D 1D            [ 4] 1582 	dec	e
   7A9E 73            [ 7] 1583 	ld	(hl),e
                           1584 ;src/main.c:339: enemy->mover = SI;
   7A9F 21 06 00      [10] 1585 	ld	hl,#0x0006
   7AA2 09            [11] 1586 	add	hl,bc
   7AA3 36 01         [10] 1587 	ld	(hl),#0x01
   7AA5 DD E1         [14] 1588 	pop	ix
   7AA7 C9            [10] 1589 	ret
                           1590 ;src/main.c:342: void moverEnemigoAbajo(TEnemy *enemy){
                           1591 ;	---------------------------------
                           1592 ; Function moverEnemigoAbajo
                           1593 ; ---------------------------------
   7AA8                    1594 _moverEnemigoAbajo::
   7AA8 DD E5         [15] 1595 	push	ix
   7AAA DD 21 00 00   [14] 1596 	ld	ix,#0
   7AAE DD 39         [15] 1597 	add	ix,sp
                           1598 ;src/main.c:343: enemy->y++;
   7AB0 DD 4E 04      [19] 1599 	ld	c,4 (ix)
   7AB3 DD 46 05      [19] 1600 	ld	b,5 (ix)
   7AB6 59            [ 4] 1601 	ld	e, c
   7AB7 50            [ 4] 1602 	ld	d, b
   7AB8 13            [ 6] 1603 	inc	de
   7AB9 1A            [ 7] 1604 	ld	a,(de)
   7ABA 3C            [ 4] 1605 	inc	a
   7ABB 12            [ 7] 1606 	ld	(de),a
                           1607 ;src/main.c:344: enemy->y++;
   7ABC 3C            [ 4] 1608 	inc	a
   7ABD 12            [ 7] 1609 	ld	(de),a
                           1610 ;src/main.c:345: enemy->mover = SI;
   7ABE 21 06 00      [10] 1611 	ld	hl,#0x0006
   7AC1 09            [11] 1612 	add	hl,bc
   7AC2 36 01         [10] 1613 	ld	(hl),#0x01
   7AC4 DD E1         [14] 1614 	pop	ix
   7AC6 C9            [10] 1615 	ret
                           1616 ;src/main.c:348: void moverEnemigoDerecha(TEnemy *enemy){
                           1617 ;	---------------------------------
                           1618 ; Function moverEnemigoDerecha
                           1619 ; ---------------------------------
   7AC7                    1620 _moverEnemigoDerecha::
                           1621 ;src/main.c:349: enemy->x++;
   7AC7 D1            [10] 1622 	pop	de
   7AC8 C1            [10] 1623 	pop	bc
   7AC9 C5            [11] 1624 	push	bc
   7ACA D5            [11] 1625 	push	de
   7ACB 0A            [ 7] 1626 	ld	a,(bc)
   7ACC 3C            [ 4] 1627 	inc	a
   7ACD 02            [ 7] 1628 	ld	(bc),a
                           1629 ;src/main.c:350: enemy->x++;
   7ACE 3C            [ 4] 1630 	inc	a
   7ACF 02            [ 7] 1631 	ld	(bc),a
                           1632 ;src/main.c:351: enemy->mover = SI;
   7AD0 21 06 00      [10] 1633 	ld	hl,#0x0006
   7AD3 09            [11] 1634 	add	hl,bc
   7AD4 36 01         [10] 1635 	ld	(hl),#0x01
   7AD6 C9            [10] 1636 	ret
                           1637 ;src/main.c:354: void moverEnemigoIzquierda(TEnemy *enemy){
                           1638 ;	---------------------------------
                           1639 ; Function moverEnemigoIzquierda
                           1640 ; ---------------------------------
   7AD7                    1641 _moverEnemigoIzquierda::
                           1642 ;src/main.c:355: enemy->x--;
   7AD7 D1            [10] 1643 	pop	de
   7AD8 C1            [10] 1644 	pop	bc
   7AD9 C5            [11] 1645 	push	bc
   7ADA D5            [11] 1646 	push	de
   7ADB 0A            [ 7] 1647 	ld	a,(bc)
   7ADC C6 FF         [ 7] 1648 	add	a,#0xFF
   7ADE 02            [ 7] 1649 	ld	(bc),a
                           1650 ;src/main.c:356: enemy->x--;
   7ADF C6 FF         [ 7] 1651 	add	a,#0xFF
   7AE1 02            [ 7] 1652 	ld	(bc),a
                           1653 ;src/main.c:357: enemy->mover = SI;
   7AE2 21 06 00      [10] 1654 	ld	hl,#0x0006
   7AE5 09            [11] 1655 	add	hl,bc
   7AE6 36 01         [10] 1656 	ld	(hl),#0x01
   7AE8 C9            [10] 1657 	ret
                           1658 ;src/main.c:360: void moverEnemigoPathfinding(TEnemy *enemy){
                           1659 ;	---------------------------------
                           1660 ; Function moverEnemigoPathfinding
                           1661 ; ---------------------------------
   7AE9                    1662 _moverEnemigoPathfinding::
   7AE9 DD E5         [15] 1663 	push	ix
   7AEB DD 21 00 00   [14] 1664 	ld	ix,#0
   7AEF DD 39         [15] 1665 	add	ix,sp
   7AF1 21 F3 FF      [10] 1666 	ld	hl,#-13
   7AF4 39            [11] 1667 	add	hl,sp
   7AF5 F9            [ 6] 1668 	ld	sp,hl
                           1669 ;src/main.c:361: if(!enemy->muerto){
   7AF6 DD 4E 04      [19] 1670 	ld	c,4 (ix)
   7AF9 DD 46 05      [19] 1671 	ld	b,5 (ix)
   7AFC C5            [11] 1672 	push	bc
   7AFD FD E1         [14] 1673 	pop	iy
   7AFF FD 7E 08      [19] 1674 	ld	a,8 (iy)
   7B02 B7            [ 4] 1675 	or	a, a
   7B03 C2 0F 7C      [10] 1676 	jp	NZ,00112$
                           1677 ;src/main.c:363: if (!enemy->reversePatrol) {
   7B06 21 0D 00      [10] 1678 	ld	hl,#0x000D
   7B09 09            [11] 1679 	add	hl,bc
   7B0A E3            [19] 1680 	ex	(sp), hl
   7B0B E1            [10] 1681 	pop	hl
   7B0C E5            [11] 1682 	push	hl
   7B0D 7E            [ 7] 1683 	ld	a,(hl)
   7B0E DD 77 FF      [19] 1684 	ld	-1 (ix),a
                           1685 ;src/main.c:364: if(enemy->iter < enemy->longitud_camino - 8){
   7B11 21 0F 00      [10] 1686 	ld	hl,#0x000F
   7B14 09            [11] 1687 	add	hl,bc
   7B15 EB            [ 4] 1688 	ex	de,hl
                           1689 ;src/main.c:365: enemy->x = enemy->camino[enemy->iter];
   7B16 21 17 00      [10] 1690 	ld	hl,#0x0017
   7B19 09            [11] 1691 	add	hl,bc
   7B1A DD 75 FD      [19] 1692 	ld	-3 (ix),l
   7B1D DD 74 FE      [19] 1693 	ld	-2 (ix),h
                           1694 ;src/main.c:367: enemy->y = enemy->camino[enemy->iter];
   7B20 21 01 00      [10] 1695 	ld	hl,#0x0001
   7B23 09            [11] 1696 	add	hl,bc
   7B24 DD 75 FB      [19] 1697 	ld	-5 (ix),l
   7B27 DD 74 FC      [19] 1698 	ld	-4 (ix),h
                           1699 ;src/main.c:369: enemy->mover = SI;
   7B2A 21 06 00      [10] 1700 	ld	hl,#0x0006
   7B2D 09            [11] 1701 	add	hl,bc
   7B2E DD 75 F9      [19] 1702 	ld	-7 (ix),l
   7B31 DD 74 FA      [19] 1703 	ld	-6 (ix),h
                           1704 ;src/main.c:372: enemy->lastIter = enemy->iter - 1;
   7B34 21 10 00      [10] 1705 	ld	hl,#0x0010
   7B37 09            [11] 1706 	add	hl,bc
   7B38 DD 75 F7      [19] 1707 	ld	-9 (ix),l
   7B3B DD 74 F8      [19] 1708 	ld	-8 (ix),h
                           1709 ;src/main.c:363: if (!enemy->reversePatrol) {
   7B3E DD 7E FF      [19] 1710 	ld	a,-1 (ix)
   7B41 B7            [ 4] 1711 	or	a, a
   7B42 20 78         [12] 1712 	jr	NZ,00108$
                           1713 ;src/main.c:364: if(enemy->iter < enemy->longitud_camino - 8){
   7B44 1A            [ 7] 1714 	ld	a,(de)
   7B45 DD 77 FF      [19] 1715 	ld	-1 (ix),a
   7B48 69            [ 4] 1716 	ld	l, c
   7B49 60            [ 4] 1717 	ld	h, b
   7B4A C5            [11] 1718 	push	bc
   7B4B 01 43 01      [10] 1719 	ld	bc, #0x0143
   7B4E 09            [11] 1720 	add	hl, bc
   7B4F C1            [10] 1721 	pop	bc
   7B50 6E            [ 7] 1722 	ld	l,(hl)
   7B51 26 00         [ 7] 1723 	ld	h,#0x00
   7B53 7D            [ 4] 1724 	ld	a,l
   7B54 C6 F8         [ 7] 1725 	add	a,#0xF8
   7B56 DD 77 F5      [19] 1726 	ld	-11 (ix),a
   7B59 7C            [ 4] 1727 	ld	a,h
   7B5A CE FF         [ 7] 1728 	adc	a,#0xFF
   7B5C DD 77 F6      [19] 1729 	ld	-10 (ix),a
   7B5F DD 7E FF      [19] 1730 	ld	a, -1 (ix)
   7B62 26 00         [ 7] 1731 	ld	h, #0x00
   7B64 DD 96 F5      [19] 1732 	sub	a, -11 (ix)
   7B67 7C            [ 4] 1733 	ld	a,h
   7B68 DD 9E F6      [19] 1734 	sbc	a, -10 (ix)
   7B6B E2 70 7B      [10] 1735 	jp	PO, 00130$
   7B6E EE 80         [ 7] 1736 	xor	a, #0x80
   7B70                    1737 00130$:
   7B70 F2 AB 7B      [10] 1738 	jp	P,00102$
                           1739 ;src/main.c:365: enemy->x = enemy->camino[enemy->iter];
   7B73 DD 6E FF      [19] 1740 	ld	l,-1 (ix)
   7B76 26 00         [ 7] 1741 	ld	h,#0x00
   7B78 DD 7E FD      [19] 1742 	ld	a,-3 (ix)
   7B7B 85            [ 4] 1743 	add	a, l
   7B7C 6F            [ 4] 1744 	ld	l,a
   7B7D DD 7E FE      [19] 1745 	ld	a,-2 (ix)
   7B80 8C            [ 4] 1746 	adc	a, h
   7B81 67            [ 4] 1747 	ld	h,a
   7B82 7E            [ 7] 1748 	ld	a,(hl)
   7B83 02            [ 7] 1749 	ld	(bc),a
                           1750 ;src/main.c:366: enemy->iter++;
   7B84 1A            [ 7] 1751 	ld	a,(de)
   7B85 4F            [ 4] 1752 	ld	c,a
   7B86 0C            [ 4] 1753 	inc	c
   7B87 79            [ 4] 1754 	ld	a,c
   7B88 12            [ 7] 1755 	ld	(de),a
                           1756 ;src/main.c:367: enemy->y = enemy->camino[enemy->iter];
   7B89 69            [ 4] 1757 	ld	l,c
   7B8A 26 00         [ 7] 1758 	ld	h,#0x00
   7B8C DD 7E FD      [19] 1759 	ld	a,-3 (ix)
   7B8F 85            [ 4] 1760 	add	a, l
   7B90 6F            [ 4] 1761 	ld	l,a
   7B91 DD 7E FE      [19] 1762 	ld	a,-2 (ix)
   7B94 8C            [ 4] 1763 	adc	a, h
   7B95 67            [ 4] 1764 	ld	h,a
   7B96 46            [ 7] 1765 	ld	b,(hl)
   7B97 DD 6E FB      [19] 1766 	ld	l,-5 (ix)
   7B9A DD 66 FC      [19] 1767 	ld	h,-4 (ix)
   7B9D 70            [ 7] 1768 	ld	(hl),b
                           1769 ;src/main.c:368: enemy->iter++;
   7B9E 0C            [ 4] 1770 	inc	c
   7B9F 79            [ 4] 1771 	ld	a,c
   7BA0 12            [ 7] 1772 	ld	(de),a
                           1773 ;src/main.c:369: enemy->mover = SI;
   7BA1 DD 6E F9      [19] 1774 	ld	l,-7 (ix)
   7BA4 DD 66 FA      [19] 1775 	ld	h,-6 (ix)
   7BA7 36 01         [10] 1776 	ld	(hl),#0x01
   7BA9 18 64         [12] 1777 	jr	00112$
   7BAB                    1778 00102$:
                           1779 ;src/main.c:372: enemy->lastIter = enemy->iter - 1;
   7BAB DD 4E FF      [19] 1780 	ld	c,-1 (ix)
   7BAE 0D            [ 4] 1781 	dec	c
   7BAF DD 6E F7      [19] 1782 	ld	l,-9 (ix)
   7BB2 DD 66 F8      [19] 1783 	ld	h,-8 (ix)
   7BB5 71            [ 7] 1784 	ld	(hl),c
                           1785 ;src/main.c:375: enemy->reversePatrol = 1;
   7BB6 E1            [10] 1786 	pop	hl
   7BB7 E5            [11] 1787 	push	hl
   7BB8 36 01         [10] 1788 	ld	(hl),#0x01
   7BBA 18 53         [12] 1789 	jr	00112$
   7BBC                    1790 00108$:
                           1791 ;src/main.c:378: if(enemy->lastIter > 1){
   7BBC DD 6E F7      [19] 1792 	ld	l,-9 (ix)
   7BBF DD 66 F8      [19] 1793 	ld	h,-8 (ix)
   7BC2 6E            [ 7] 1794 	ld	l,(hl)
   7BC3 3E 01         [ 7] 1795 	ld	a,#0x01
   7BC5 95            [ 4] 1796 	sub	a, l
   7BC6 30 41         [12] 1797 	jr	NC,00105$
                           1798 ;src/main.c:379: enemy->y = enemy->camino[enemy->lastIter];
   7BC8 26 00         [ 7] 1799 	ld	h,#0x00
   7BCA DD 5E FD      [19] 1800 	ld	e,-3 (ix)
   7BCD DD 56 FE      [19] 1801 	ld	d,-2 (ix)
   7BD0 19            [11] 1802 	add	hl,de
   7BD1 5E            [ 7] 1803 	ld	e,(hl)
   7BD2 DD 6E FB      [19] 1804 	ld	l,-5 (ix)
   7BD5 DD 66 FC      [19] 1805 	ld	h,-4 (ix)
   7BD8 73            [ 7] 1806 	ld	(hl),e
                           1807 ;src/main.c:380: enemy->lastIter--;
   7BD9 DD 6E F7      [19] 1808 	ld	l,-9 (ix)
   7BDC DD 66 F8      [19] 1809 	ld	h,-8 (ix)
   7BDF 5E            [ 7] 1810 	ld	e,(hl)
   7BE0 1D            [ 4] 1811 	dec	e
   7BE1 DD 6E F7      [19] 1812 	ld	l,-9 (ix)
   7BE4 DD 66 F8      [19] 1813 	ld	h,-8 (ix)
   7BE7 73            [ 7] 1814 	ld	(hl),e
                           1815 ;src/main.c:381: enemy->x = enemy->camino[enemy->lastIter];
   7BE8 6B            [ 4] 1816 	ld	l,e
   7BE9 26 00         [ 7] 1817 	ld	h,#0x00
   7BEB DD 7E FD      [19] 1818 	ld	a,-3 (ix)
   7BEE 85            [ 4] 1819 	add	a, l
   7BEF 6F            [ 4] 1820 	ld	l,a
   7BF0 DD 7E FE      [19] 1821 	ld	a,-2 (ix)
   7BF3 8C            [ 4] 1822 	adc	a, h
   7BF4 67            [ 4] 1823 	ld	h,a
   7BF5 7E            [ 7] 1824 	ld	a,(hl)
   7BF6 02            [ 7] 1825 	ld	(bc),a
                           1826 ;src/main.c:382: enemy->lastIter--;
   7BF7 1D            [ 4] 1827 	dec	e
   7BF8 DD 6E F7      [19] 1828 	ld	l,-9 (ix)
   7BFB DD 66 F8      [19] 1829 	ld	h,-8 (ix)
   7BFE 73            [ 7] 1830 	ld	(hl),e
                           1831 ;src/main.c:383: enemy->mover = SI;
   7BFF DD 6E F9      [19] 1832 	ld	l,-7 (ix)
   7C02 DD 66 FA      [19] 1833 	ld	h,-6 (ix)
   7C05 36 01         [10] 1834 	ld	(hl),#0x01
   7C07 18 06         [12] 1835 	jr	00112$
   7C09                    1836 00105$:
                           1837 ;src/main.c:386: enemy->iter = 0;
   7C09 AF            [ 4] 1838 	xor	a, a
   7C0A 12            [ 7] 1839 	ld	(de),a
                           1840 ;src/main.c:388: enemy->reversePatrol = 0;
   7C0B E1            [10] 1841 	pop	hl
   7C0C E5            [11] 1842 	push	hl
   7C0D 36 00         [10] 1843 	ld	(hl),#0x00
   7C0F                    1844 00112$:
   7C0F DD F9         [10] 1845 	ld	sp, ix
   7C11 DD E1         [14] 1846 	pop	ix
   7C13 C9            [10] 1847 	ret
                           1848 ;src/main.c:395: void moverEnemigo(TEnemy *enemy){
                           1849 ;	---------------------------------
                           1850 ; Function moverEnemigo
                           1851 ; ---------------------------------
   7C14                    1852 _moverEnemigo::
   7C14 DD E5         [15] 1853 	push	ix
   7C16 DD 21 00 00   [14] 1854 	ld	ix,#0
   7C1A DD 39         [15] 1855 	add	ix,sp
                           1856 ;src/main.c:396: if(!enemy->muerto){
   7C1C DD 4E 04      [19] 1857 	ld	c,4 (ix)
   7C1F DD 46 05      [19] 1858 	ld	b,5 (ix)
   7C22 C5            [11] 1859 	push	bc
   7C23 FD E1         [14] 1860 	pop	iy
   7C25 FD 7E 08      [19] 1861 	ld	a,8 (iy)
   7C28 B7            [ 4] 1862 	or	a, a
   7C29 20 46         [12] 1863 	jr	NZ,00110$
                           1864 ;src/main.c:397: if(!checkEnemyCollision(enemy->mira, enemy)){
   7C2B 21 07 00      [10] 1865 	ld	hl,#0x0007
   7C2E 09            [11] 1866 	add	hl,bc
   7C2F 5E            [ 7] 1867 	ld	e,(hl)
   7C30 16 00         [ 7] 1868 	ld	d,#0x00
   7C32 E5            [11] 1869 	push	hl
   7C33 C5            [11] 1870 	push	bc
   7C34 C5            [11] 1871 	push	bc
   7C35 D5            [11] 1872 	push	de
   7C36 CD B9 76      [17] 1873 	call	_checkEnemyCollision
   7C39 F1            [10] 1874 	pop	af
   7C3A F1            [10] 1875 	pop	af
   7C3B 7D            [ 4] 1876 	ld	a,l
   7C3C C1            [10] 1877 	pop	bc
   7C3D E1            [10] 1878 	pop	hl
   7C3E B7            [ 4] 1879 	or	a, a
   7C3F 20 30         [12] 1880 	jr	NZ,00110$
                           1881 ;src/main.c:399: switch (enemy->mira) {
   7C41 5E            [ 7] 1882 	ld	e,(hl)
   7C42 3E 03         [ 7] 1883 	ld	a,#0x03
   7C44 93            [ 4] 1884 	sub	a, e
   7C45 38 2A         [12] 1885 	jr	C,00110$
   7C47 16 00         [ 7] 1886 	ld	d,#0x00
   7C49 21 4F 7C      [10] 1887 	ld	hl,#00124$
   7C4C 19            [11] 1888 	add	hl,de
   7C4D 19            [11] 1889 	add	hl,de
                           1890 ;src/main.c:401: case 0:
   7C4E E9            [ 4] 1891 	jp	(hl)
   7C4F                    1892 00124$:
   7C4F 18 06         [12] 1893 	jr	00101$
   7C51 18 0B         [12] 1894 	jr	00102$
   7C53 18 10         [12] 1895 	jr	00103$
   7C55 18 15         [12] 1896 	jr	00104$
   7C57                    1897 00101$:
                           1898 ;src/main.c:402: moverEnemigoDerecha(enemy);
   7C57 C5            [11] 1899 	push	bc
   7C58 CD C7 7A      [17] 1900 	call	_moverEnemigoDerecha
   7C5B F1            [10] 1901 	pop	af
                           1902 ;src/main.c:403: break;
   7C5C 18 13         [12] 1903 	jr	00110$
                           1904 ;src/main.c:404: case 1:
   7C5E                    1905 00102$:
                           1906 ;src/main.c:405: moverEnemigoIzquierda(enemy);
   7C5E C5            [11] 1907 	push	bc
   7C5F CD D7 7A      [17] 1908 	call	_moverEnemigoIzquierda
   7C62 F1            [10] 1909 	pop	af
                           1910 ;src/main.c:406: break;
   7C63 18 0C         [12] 1911 	jr	00110$
                           1912 ;src/main.c:407: case 2:
   7C65                    1913 00103$:
                           1914 ;src/main.c:408: moverEnemigoArriba(enemy);
   7C65 C5            [11] 1915 	push	bc
   7C66 CD 89 7A      [17] 1916 	call	_moverEnemigoArriba
   7C69 F1            [10] 1917 	pop	af
                           1918 ;src/main.c:409: break;
   7C6A 18 05         [12] 1919 	jr	00110$
                           1920 ;src/main.c:410: case 3:
   7C6C                    1921 00104$:
                           1922 ;src/main.c:411: moverEnemigoAbajo(enemy);
   7C6C C5            [11] 1923 	push	bc
   7C6D CD A8 7A      [17] 1924 	call	_moverEnemigoAbajo
   7C70 F1            [10] 1925 	pop	af
                           1926 ;src/main.c:413: }
   7C71                    1927 00110$:
   7C71 DD E1         [14] 1928 	pop	ix
   7C73 C9            [10] 1929 	ret
                           1930 ;src/main.c:418: void lookFor(TEnemy* enemy){
                           1931 ;	---------------------------------
                           1932 ; Function lookFor
                           1933 ; ---------------------------------
   7C74                    1934 _lookFor::
   7C74 DD E5         [15] 1935 	push	ix
   7C76 DD 21 00 00   [14] 1936 	ld	ix,#0
   7C7A DD 39         [15] 1937 	add	ix,sp
   7C7C 21 F6 FF      [10] 1938 	ld	hl,#-10
   7C7F 39            [11] 1939 	add	hl,sp
   7C80 F9            [ 6] 1940 	ld	sp,hl
                           1941 ;src/main.c:421: u8 interpone = NO;
   7C81 0E 00         [ 7] 1942 	ld	c,#0x00
                           1943 ;src/main.c:425: u8 difx = abs(enemy->x - prota.x);
   7C83 DD 7E 04      [19] 1944 	ld	a,4 (ix)
   7C86 DD 77 FA      [19] 1945 	ld	-6 (ix),a
   7C89 DD 7E 05      [19] 1946 	ld	a,5 (ix)
   7C8C DD 77 FB      [19] 1947 	ld	-5 (ix),a
   7C8F DD 6E FA      [19] 1948 	ld	l,-6 (ix)
   7C92 DD 66 FB      [19] 1949 	ld	h,-5 (ix)
   7C95 46            [ 7] 1950 	ld	b,(hl)
   7C96 16 00         [ 7] 1951 	ld	d,#0x00
   7C98 21 D6 69      [10] 1952 	ld	hl,#_prota+0
   7C9B 6E            [ 7] 1953 	ld	l,(hl)
   7C9C 26 00         [ 7] 1954 	ld	h,#0x00
   7C9E 78            [ 4] 1955 	ld	a,b
   7C9F 95            [ 4] 1956 	sub	a, l
   7CA0 5F            [ 4] 1957 	ld	e,a
   7CA1 7A            [ 4] 1958 	ld	a,d
   7CA2 9C            [ 4] 1959 	sbc	a, h
   7CA3 57            [ 4] 1960 	ld	d,a
   7CA4 C5            [11] 1961 	push	bc
   7CA5 D5            [11] 1962 	push	de
   7CA6 CD E2 4B      [17] 1963 	call	_abs
   7CA9 F1            [10] 1964 	pop	af
   7CAA C1            [10] 1965 	pop	bc
   7CAB 45            [ 4] 1966 	ld	b,l
                           1967 ;src/main.c:426: u8 dify = abs(enemy->y - prota.y);
   7CAC DD 7E FA      [19] 1968 	ld	a,-6 (ix)
   7CAF C6 01         [ 7] 1969 	add	a, #0x01
   7CB1 DD 77 F8      [19] 1970 	ld	-8 (ix),a
   7CB4 DD 7E FB      [19] 1971 	ld	a,-5 (ix)
   7CB7 CE 00         [ 7] 1972 	adc	a, #0x00
   7CB9 DD 77 F9      [19] 1973 	ld	-7 (ix),a
   7CBC DD 6E F8      [19] 1974 	ld	l,-8 (ix)
   7CBF DD 66 F9      [19] 1975 	ld	h,-7 (ix)
   7CC2 5E            [ 7] 1976 	ld	e,(hl)
   7CC3 16 00         [ 7] 1977 	ld	d,#0x00
   7CC5 21 D7 69      [10] 1978 	ld	hl, #(_prota + 0x0001) + 0
   7CC8 6E            [ 7] 1979 	ld	l,(hl)
   7CC9 26 00         [ 7] 1980 	ld	h,#0x00
   7CCB 7B            [ 4] 1981 	ld	a,e
   7CCC 95            [ 4] 1982 	sub	a, l
   7CCD 5F            [ 4] 1983 	ld	e,a
   7CCE 7A            [ 4] 1984 	ld	a,d
   7CCF 9C            [ 4] 1985 	sbc	a, h
   7CD0 57            [ 4] 1986 	ld	d,a
   7CD1 C5            [11] 1987 	push	bc
   7CD2 D5            [11] 1988 	push	de
   7CD3 CD E2 4B      [17] 1989 	call	_abs
   7CD6 F1            [10] 1990 	pop	af
   7CD7 C1            [10] 1991 	pop	bc
                           1992 ;src/main.c:427: dist = difx + dify; // manhattan
   7CD8 78            [ 4] 1993 	ld	a,b
   7CD9 85            [ 4] 1994 	add	a, l
   7CDA 47            [ 4] 1995 	ld	b,a
                           1996 ;src/main.c:429: enemy->seen = NO;
   7CDB DD 7E FA      [19] 1997 	ld	a,-6 (ix)
   7CDE C6 12         [ 7] 1998 	add	a, #0x12
   7CE0 DD 77 F6      [19] 1999 	ld	-10 (ix),a
   7CE3 DD 7E FB      [19] 2000 	ld	a,-5 (ix)
   7CE6 CE 00         [ 7] 2001 	adc	a, #0x00
   7CE8 DD 77 F7      [19] 2002 	ld	-9 (ix),a
   7CEB E1            [10] 2003 	pop	hl
   7CEC E5            [11] 2004 	push	hl
   7CED 36 00         [10] 2005 	ld	(hl),#0x00
                           2006 ;src/main.c:430: enemy->inRange = NO;
   7CEF DD 7E FA      [19] 2007 	ld	a,-6 (ix)
   7CF2 C6 11         [ 7] 2008 	add	a, #0x11
   7CF4 DD 77 FE      [19] 2009 	ld	-2 (ix),a
   7CF7 DD 7E FB      [19] 2010 	ld	a,-5 (ix)
   7CFA CE 00         [ 7] 2011 	adc	a, #0x00
   7CFC DD 77 FF      [19] 2012 	ld	-1 (ix),a
   7CFF DD 6E FE      [19] 2013 	ld	l,-2 (ix)
   7D02 DD 66 FF      [19] 2014 	ld	h,-1 (ix)
   7D05 36 00         [10] 2015 	ld	(hl),#0x00
                           2016 ;src/main.c:432: if (dist <= 10) {// te detectan los sensores de proximidad
   7D07 3E 0A         [ 7] 2017 	ld	a,#0x0A
   7D09 90            [ 4] 2018 	sub	a, b
   7D0A 38 0F         [12] 2019 	jr	C,00123$
                           2020 ;src/main.c:433: enemy->seen = 1;
   7D0C E1            [10] 2021 	pop	hl
   7D0D E5            [11] 2022 	push	hl
   7D0E 36 01         [10] 2023 	ld	(hl),#0x01
                           2024 ;src/main.c:434: enemy->inRange = 1;
   7D10 DD 6E FE      [19] 2025 	ld	l,-2 (ix)
   7D13 DD 66 FF      [19] 2026 	ld	h,-1 (ix)
   7D16 36 01         [10] 2027 	ld	(hl),#0x01
   7D18 C3 12 7E      [10] 2028 	jp	00133$
   7D1B                    2029 00123$:
                           2030 ;src/main.c:435: } else if(enemy->x > prota.x - 50 && enemy->x < prota.x + 50  ){
   7D1B DD 6E FA      [19] 2031 	ld	l,-6 (ix)
   7D1E DD 66 FB      [19] 2032 	ld	h,-5 (ix)
   7D21 7E            [ 7] 2033 	ld	a,(hl)
   7D22 DD 77 FE      [19] 2034 	ld	-2 (ix),a
   7D25 21 D6 69      [10] 2035 	ld	hl, #_prota + 0
   7D28 46            [ 7] 2036 	ld	b,(hl)
   7D29 58            [ 4] 2037 	ld	e,b
   7D2A 16 00         [ 7] 2038 	ld	d,#0x00
   7D2C 7B            [ 4] 2039 	ld	a,e
   7D2D C6 CE         [ 7] 2040 	add	a,#0xCE
   7D2F DD 77 FC      [19] 2041 	ld	-4 (ix),a
   7D32 7A            [ 4] 2042 	ld	a,d
   7D33 CE FF         [ 7] 2043 	adc	a,#0xFF
   7D35 DD 77 FD      [19] 2044 	ld	-3 (ix),a
   7D38 DD 6E FE      [19] 2045 	ld	l,-2 (ix)
   7D3B 26 00         [ 7] 2046 	ld	h,#0x00
   7D3D DD 7E FC      [19] 2047 	ld	a,-4 (ix)
   7D40 95            [ 4] 2048 	sub	a, l
   7D41 DD 7E FD      [19] 2049 	ld	a,-3 (ix)
   7D44 9C            [ 4] 2050 	sbc	a, h
   7D45 E2 4A 7D      [10] 2051 	jp	PO, 00205$
   7D48 EE 80         [ 7] 2052 	xor	a, #0x80
   7D4A                    2053 00205$:
   7D4A F2 12 7E      [10] 2054 	jp	P,00133$
   7D4D 7B            [ 4] 2055 	ld	a,e
   7D4E C6 32         [ 7] 2056 	add	a, #0x32
   7D50 5F            [ 4] 2057 	ld	e,a
   7D51 7A            [ 4] 2058 	ld	a,d
   7D52 CE 00         [ 7] 2059 	adc	a, #0x00
   7D54 57            [ 4] 2060 	ld	d,a
   7D55 7D            [ 4] 2061 	ld	a,l
   7D56 93            [ 4] 2062 	sub	a, e
   7D57 7C            [ 4] 2063 	ld	a,h
   7D58 9A            [ 4] 2064 	sbc	a, d
   7D59 E2 5E 7D      [10] 2065 	jp	PO, 00206$
   7D5C EE 80         [ 7] 2066 	xor	a, #0x80
   7D5E                    2067 00206$:
   7D5E F2 12 7E      [10] 2068 	jp	P,00133$
                           2069 ;src/main.c:436: if(enemy->y > prota.y - 4 && enemy->y < prota.y + 4){
   7D61 DD 6E F8      [19] 2070 	ld	l,-8 (ix)
   7D64 DD 66 F9      [19] 2071 	ld	h,-7 (ix)
   7D67 5E            [ 7] 2072 	ld	e,(hl)
   7D68 21 D7 69      [10] 2073 	ld	hl, #(_prota + 0x0001) + 0
   7D6B 6E            [ 7] 2074 	ld	l,(hl)
   7D6C 26 00         [ 7] 2075 	ld	h,#0x00
   7D6E 7D            [ 4] 2076 	ld	a,l
   7D6F C6 FC         [ 7] 2077 	add	a,#0xFC
   7D71 DD 77 FC      [19] 2078 	ld	-4 (ix),a
   7D74 7C            [ 4] 2079 	ld	a,h
   7D75 CE FF         [ 7] 2080 	adc	a,#0xFF
   7D77 DD 77 FD      [19] 2081 	ld	-3 (ix),a
   7D7A 16 00         [ 7] 2082 	ld	d,#0x00
   7D7C DD 7E FC      [19] 2083 	ld	a,-4 (ix)
   7D7F 93            [ 4] 2084 	sub	a, e
   7D80 DD 7E FD      [19] 2085 	ld	a,-3 (ix)
   7D83 9A            [ 4] 2086 	sbc	a, d
   7D84 E2 89 7D      [10] 2087 	jp	PO, 00207$
   7D87 EE 80         [ 7] 2088 	xor	a, #0x80
   7D89                    2089 00207$:
   7D89 F2 12 7E      [10] 2090 	jp	P,00133$
   7D8C 23            [ 6] 2091 	inc	hl
   7D8D 23            [ 6] 2092 	inc	hl
   7D8E 23            [ 6] 2093 	inc	hl
   7D8F 23            [ 6] 2094 	inc	hl
   7D90 7B            [ 4] 2095 	ld	a,e
   7D91 95            [ 4] 2096 	sub	a, l
   7D92 7A            [ 4] 2097 	ld	a,d
   7D93 9C            [ 4] 2098 	sbc	a, h
   7D94 E2 99 7D      [10] 2099 	jp	PO, 00208$
   7D97 EE 80         [ 7] 2100 	xor	a, #0x80
   7D99                    2101 00208$:
   7D99 F2 12 7E      [10] 2102 	jp	P,00133$
                           2103 ;src/main.c:437: if(enemy->x > prota.x){
   7D9C 78            [ 4] 2104 	ld	a,b
   7D9D DD 96 FE      [19] 2105 	sub	a, -2 (ix)
   7DA0 3E 00         [ 7] 2106 	ld	a,#0x00
   7DA2 17            [ 4] 2107 	rla
   7DA3 B7            [ 4] 2108 	or	a, a
   7DA4 28 36         [12] 2109 	jr	Z,00114$
                           2110 ;src/main.c:438: i = prota.x;
   7DA6 58            [ 4] 2111 	ld	e,b
                           2112 ;src/main.c:439: for (i; i<enemy->x && !interpone; i++){
   7DA7                    2113 00127$:
   7DA7 DD 6E FA      [19] 2114 	ld	l,-6 (ix)
   7DAA DD 66 FB      [19] 2115 	ld	h,-5 (ix)
   7DAD 46            [ 7] 2116 	ld	b,(hl)
   7DAE 7B            [ 4] 2117 	ld	a,e
   7DAF 90            [ 4] 2118 	sub	a, b
   7DB0 30 20         [12] 2119 	jr	NC,00103$
   7DB2 79            [ 4] 2120 	ld	a,c
   7DB3 B7            [ 4] 2121 	or	a, a
   7DB4 20 1C         [12] 2122 	jr	NZ,00103$
                           2123 ;src/main.c:440: if(*getTilePtr(i , prota.y) > 2){
   7DB6 21 D7 69      [10] 2124 	ld	hl, #(_prota + 0x0001) + 0
   7DB9 46            [ 7] 2125 	ld	b,(hl)
   7DBA C5            [11] 2126 	push	bc
   7DBB D5            [11] 2127 	push	de
   7DBC C5            [11] 2128 	push	bc
   7DBD 33            [ 6] 2129 	inc	sp
   7DBE 7B            [ 4] 2130 	ld	a,e
   7DBF F5            [11] 2131 	push	af
   7DC0 33            [ 6] 2132 	inc	sp
   7DC1 CD 7E 73      [17] 2133 	call	_getTilePtr
   7DC4 F1            [10] 2134 	pop	af
   7DC5 D1            [10] 2135 	pop	de
   7DC6 C1            [10] 2136 	pop	bc
   7DC7 46            [ 7] 2137 	ld	b,(hl)
   7DC8 3E 02         [ 7] 2138 	ld	a,#0x02
   7DCA 90            [ 4] 2139 	sub	a, b
   7DCB 30 02         [12] 2140 	jr	NC,00128$
                           2141 ;src/main.c:441: interpone = SI;
   7DCD 0E 01         [ 7] 2142 	ld	c,#0x01
   7DCF                    2143 00128$:
                           2144 ;src/main.c:439: for (i; i<enemy->x && !interpone; i++){
   7DCF 1C            [ 4] 2145 	inc	e
   7DD0 18 D5         [12] 2146 	jr	00127$
   7DD2                    2147 00103$:
                           2148 ;src/main.c:444: if(!interpone){
   7DD2 79            [ 4] 2149 	ld	a,c
   7DD3 B7            [ 4] 2150 	or	a, a
   7DD4 20 3C         [12] 2151 	jr	NZ,00133$
                           2152 ;src/main.c:445: enemy->seen = SI;
   7DD6 E1            [10] 2153 	pop	hl
   7DD7 E5            [11] 2154 	push	hl
   7DD8 36 01         [10] 2155 	ld	(hl),#0x01
   7DDA 18 36         [12] 2156 	jr	00133$
   7DDC                    2157 00114$:
                           2158 ;src/main.c:447: }else if(enemy->x > prota.x){
   7DDC B7            [ 4] 2159 	or	a, a
   7DDD 28 33         [12] 2160 	jr	Z,00133$
                           2161 ;src/main.c:448: i = enemy->x;
   7DDF DD 46 FE      [19] 2162 	ld	b,-2 (ix)
                           2163 ;src/main.c:449: for (i; i<prota.x && !interpone; i++){
   7DE2                    2164 00131$:
   7DE2 21 D6 69      [10] 2165 	ld	hl, #_prota + 0
   7DE5 5E            [ 7] 2166 	ld	e,(hl)
   7DE6 78            [ 4] 2167 	ld	a,b
   7DE7 93            [ 4] 2168 	sub	a, e
   7DE8 30 20         [12] 2169 	jr	NC,00108$
   7DEA 79            [ 4] 2170 	ld	a,c
   7DEB B7            [ 4] 2171 	or	a, a
   7DEC 20 1C         [12] 2172 	jr	NZ,00108$
                           2173 ;src/main.c:450: if(*getTilePtr(i, enemy->y) > 2){
   7DEE DD 6E F8      [19] 2174 	ld	l,-8 (ix)
   7DF1 DD 66 F9      [19] 2175 	ld	h,-7 (ix)
   7DF4 56            [ 7] 2176 	ld	d,(hl)
   7DF5 C5            [11] 2177 	push	bc
   7DF6 D5            [11] 2178 	push	de
   7DF7 33            [ 6] 2179 	inc	sp
   7DF8 C5            [11] 2180 	push	bc
   7DF9 33            [ 6] 2181 	inc	sp
   7DFA CD 7E 73      [17] 2182 	call	_getTilePtr
   7DFD F1            [10] 2183 	pop	af
   7DFE C1            [10] 2184 	pop	bc
   7DFF 5E            [ 7] 2185 	ld	e,(hl)
   7E00 3E 02         [ 7] 2186 	ld	a,#0x02
   7E02 93            [ 4] 2187 	sub	a, e
   7E03 30 02         [12] 2188 	jr	NC,00132$
                           2189 ;src/main.c:451: interpone = SI;
   7E05 0E 01         [ 7] 2190 	ld	c,#0x01
   7E07                    2191 00132$:
                           2192 ;src/main.c:449: for (i; i<prota.x && !interpone; i++){
   7E07 04            [ 4] 2193 	inc	b
   7E08 18 D8         [12] 2194 	jr	00131$
   7E0A                    2195 00108$:
                           2196 ;src/main.c:454: if(!interpone){
   7E0A 79            [ 4] 2197 	ld	a,c
   7E0B B7            [ 4] 2198 	or	a, a
   7E0C 20 04         [12] 2199 	jr	NZ,00133$
                           2200 ;src/main.c:455: enemy->seen = SI;
   7E0E E1            [10] 2201 	pop	hl
   7E0F E5            [11] 2202 	push	hl
   7E10 36 01         [10] 2203 	ld	(hl),#0x01
   7E12                    2204 00133$:
   7E12 DD F9         [10] 2205 	ld	sp, ix
   7E14 DD E1         [14] 2206 	pop	ix
   7E16 C9            [10] 2207 	ret
                           2208 ;src/main.c:462: void patrol(TEnemy *enemy) {
                           2209 ;	---------------------------------
                           2210 ; Function patrol
                           2211 ; ---------------------------------
   7E17                    2212 _patrol::
                           2213 ;src/main.c:463: if (enemy->onPathPatrol) {
   7E17 D1            [10] 2214 	pop	de
   7E18 C1            [10] 2215 	pop	bc
   7E19 C5            [11] 2216 	push	bc
   7E1A D5            [11] 2217 	push	de
   7E1B C5            [11] 2218 	push	bc
   7E1C FD E1         [14] 2219 	pop	iy
   7E1E FD 7E 0C      [19] 2220 	ld	a,12 (iy)
   7E21 B7            [ 4] 2221 	or	a, a
   7E22 C8            [11] 2222 	ret	Z
                           2223 ;src/main.c:464: moverEnemigoPathfinding(enemy);
   7E23 C5            [11] 2224 	push	bc
   7E24 CD E9 7A      [17] 2225 	call	_moverEnemigoPathfinding
   7E27 F1            [10] 2226 	pop	af
   7E28 C9            [10] 2227 	ret
                           2228 ;src/main.c:468: void seek(TEnemy* actual){
                           2229 ;	---------------------------------
                           2230 ; Function seek
                           2231 ; ---------------------------------
   7E29                    2232 _seek::
                           2233 ;src/main.c:469: moverEnemigoPathfinding(actual);
   7E29 C1            [10] 2234 	pop	bc
   7E2A E1            [10] 2235 	pop	hl
   7E2B E5            [11] 2236 	push	hl
   7E2C C5            [11] 2237 	push	bc
   7E2D E5            [11] 2238 	push	hl
   7E2E CD E9 7A      [17] 2239 	call	_moverEnemigoPathfinding
   7E31 F1            [10] 2240 	pop	af
   7E32 C9            [10] 2241 	ret
                           2242 ;src/main.c:472: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2243 ;	---------------------------------
                           2244 ; Function engage
                           2245 ; ---------------------------------
   7E33                    2246 _engage::
   7E33 DD E5         [15] 2247 	push	ix
   7E35 DD 21 00 00   [14] 2248 	ld	ix,#0
   7E39 DD 39         [15] 2249 	add	ix,sp
   7E3B 21 F3 FF      [10] 2250 	ld	hl,#-13
   7E3E 39            [11] 2251 	add	hl,sp
   7E3F F9            [ 6] 2252 	ld	sp,hl
                           2253 ;src/main.c:473: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7E40 DD 7E 04      [19] 2254 	ld	a,4 (ix)
   7E43 DD 77 F7      [19] 2255 	ld	-9 (ix),a
   7E46 DD 7E 05      [19] 2256 	ld	a,5 (ix)
   7E49 DD 77 F8      [19] 2257 	ld	-8 (ix),a
   7E4C DD 6E F7      [19] 2258 	ld	l,-9 (ix)
   7E4F DD 66 F8      [19] 2259 	ld	h,-8 (ix)
   7E52 4E            [ 7] 2260 	ld	c,(hl)
   7E53 06 00         [ 7] 2261 	ld	b,#0x00
   7E55 21 D6 69      [10] 2262 	ld	hl,#_prota+0
   7E58 5E            [ 7] 2263 	ld	e,(hl)
   7E59 16 00         [ 7] 2264 	ld	d,#0x00
   7E5B 79            [ 4] 2265 	ld	a,c
   7E5C 93            [ 4] 2266 	sub	a, e
   7E5D 4F            [ 4] 2267 	ld	c,a
   7E5E 78            [ 4] 2268 	ld	a,b
   7E5F 9A            [ 4] 2269 	sbc	a, d
   7E60 47            [ 4] 2270 	ld	b,a
   7E61 C5            [11] 2271 	push	bc
   7E62 CD E2 4B      [17] 2272 	call	_abs
   7E65 F1            [10] 2273 	pop	af
   7E66 4D            [ 4] 2274 	ld	c,l
                           2275 ;src/main.c:474: u8 dify = abs(enemy->y - prota.y);
   7E67 DD 7E F7      [19] 2276 	ld	a,-9 (ix)
   7E6A C6 01         [ 7] 2277 	add	a, #0x01
   7E6C DD 77 F9      [19] 2278 	ld	-7 (ix),a
   7E6F DD 7E F8      [19] 2279 	ld	a,-8 (ix)
   7E72 CE 00         [ 7] 2280 	adc	a, #0x00
   7E74 DD 77 FA      [19] 2281 	ld	-6 (ix),a
   7E77 DD 6E F9      [19] 2282 	ld	l,-7 (ix)
   7E7A DD 66 FA      [19] 2283 	ld	h,-6 (ix)
   7E7D 5E            [ 7] 2284 	ld	e,(hl)
   7E7E 16 00         [ 7] 2285 	ld	d,#0x00
   7E80 21 D7 69      [10] 2286 	ld	hl,#_prota+1
   7E83 6E            [ 7] 2287 	ld	l,(hl)
   7E84 26 00         [ 7] 2288 	ld	h,#0x00
   7E86 7B            [ 4] 2289 	ld	a,e
   7E87 95            [ 4] 2290 	sub	a, l
   7E88 5F            [ 4] 2291 	ld	e,a
   7E89 7A            [ 4] 2292 	ld	a,d
   7E8A 9C            [ 4] 2293 	sbc	a, h
   7E8B 57            [ 4] 2294 	ld	d,a
   7E8C C5            [11] 2295 	push	bc
   7E8D D5            [11] 2296 	push	de
   7E8E CD E2 4B      [17] 2297 	call	_abs
   7E91 F1            [10] 2298 	pop	af
   7E92 C1            [10] 2299 	pop	bc
                           2300 ;src/main.c:475: u8 dist = difx + dify; // manhattan
   7E93 09            [11] 2301 	add	hl, bc
   7E94 DD 75 F5      [19] 2302 	ld	-11 (ix),l
                           2303 ;src/main.c:477: u8 movX = 0;
   7E97 DD 36 F4 00   [19] 2304 	ld	-12 (ix),#0x00
                           2305 ;src/main.c:478: u8 movY = 0;
   7E9B DD 36 F6 00   [19] 2306 	ld	-10 (ix),#0x00
                           2307 ;src/main.c:479: u8 mov = 0;
   7E9F DD 36 F3 00   [19] 2308 	ld	-13 (ix),#0x00
                           2309 ;src/main.c:481: if (enemy->y == dy) { // alineado en el eje x
   7EA3 DD 6E F9      [19] 2310 	ld	l,-7 (ix)
   7EA6 DD 66 FA      [19] 2311 	ld	h,-6 (ix)
   7EA9 7E            [ 7] 2312 	ld	a,(hl)
   7EAA DD 77 FB      [19] 2313 	ld	-5 (ix),a
                           2314 ;src/main.c:483: if (dist > 10) {
   7EAD 3E 0A         [ 7] 2315 	ld	a,#0x0A
   7EAF DD 96 F5      [19] 2316 	sub	a, -11 (ix)
   7EB2 3E 00         [ 7] 2317 	ld	a,#0x00
   7EB4 17            [ 4] 2318 	rla
   7EB5 DD 77 FC      [19] 2319 	ld	-4 (ix),a
                           2320 ;src/main.c:481: if (enemy->y == dy) { // alineado en el eje x
   7EB8 DD 7E 07      [19] 2321 	ld	a,7 (ix)
   7EBB DD 96 FB      [19] 2322 	sub	a, -5 (ix)
   7EBE C2 A2 7F      [10] 2323 	jp	NZ,00187$
                           2324 ;src/main.c:483: if (dist > 10) {
   7EC1 DD 7E FC      [19] 2325 	ld	a,-4 (ix)
   7EC4 B7            [ 4] 2326 	or	a, a
   7EC5 CA 6A 84      [10] 2327 	jp	Z,00189$
                           2328 ;src/main.c:484: if (dx < enemy->x) { // izquierda
   7EC8 DD 6E F7      [19] 2329 	ld	l,-9 (ix)
   7ECB DD 66 F8      [19] 2330 	ld	h,-8 (ix)
   7ECE 46            [ 7] 2331 	ld	b,(hl)
   7ECF DD 7E 06      [19] 2332 	ld	a,6 (ix)
   7ED2 90            [ 4] 2333 	sub	a, b
   7ED3 30 63         [12] 2334 	jr	NC,00110$
                           2335 ;src/main.c:485: if(*getTilePtr(enemy->x - 1, enemy->y) <= 2
   7ED5 05            [ 4] 2336 	dec	b
   7ED6 DD 7E FB      [19] 2337 	ld	a,-5 (ix)
   7ED9 F5            [11] 2338 	push	af
   7EDA 33            [ 6] 2339 	inc	sp
   7EDB C5            [11] 2340 	push	bc
   7EDC 33            [ 6] 2341 	inc	sp
   7EDD CD 7E 73      [17] 2342 	call	_getTilePtr
   7EE0 F1            [10] 2343 	pop	af
   7EE1 4E            [ 7] 2344 	ld	c,(hl)
   7EE2 3E 02         [ 7] 2345 	ld	a,#0x02
   7EE4 91            [ 4] 2346 	sub	a, c
   7EE5 DA 6A 84      [10] 2347 	jp	C,00189$
                           2348 ;src/main.c:486: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   7EE8 DD 6E F9      [19] 2349 	ld	l,-7 (ix)
   7EEB DD 66 FA      [19] 2350 	ld	h,-6 (ix)
   7EEE 7E            [ 7] 2351 	ld	a,(hl)
   7EEF C6 0B         [ 7] 2352 	add	a, #0x0B
   7EF1 57            [ 4] 2353 	ld	d,a
   7EF2 DD 6E F7      [19] 2354 	ld	l,-9 (ix)
   7EF5 DD 66 F8      [19] 2355 	ld	h,-8 (ix)
   7EF8 46            [ 7] 2356 	ld	b,(hl)
   7EF9 05            [ 4] 2357 	dec	b
   7EFA D5            [11] 2358 	push	de
   7EFB 33            [ 6] 2359 	inc	sp
   7EFC C5            [11] 2360 	push	bc
   7EFD 33            [ 6] 2361 	inc	sp
   7EFE CD 7E 73      [17] 2362 	call	_getTilePtr
   7F01 F1            [10] 2363 	pop	af
   7F02 4E            [ 7] 2364 	ld	c,(hl)
   7F03 3E 02         [ 7] 2365 	ld	a,#0x02
   7F05 91            [ 4] 2366 	sub	a, c
   7F06 DA 6A 84      [10] 2367 	jp	C,00189$
                           2368 ;src/main.c:487: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   7F09 DD 6E F9      [19] 2369 	ld	l,-7 (ix)
   7F0C DD 66 FA      [19] 2370 	ld	h,-6 (ix)
   7F0F 7E            [ 7] 2371 	ld	a,(hl)
   7F10 C6 16         [ 7] 2372 	add	a, #0x16
   7F12 57            [ 4] 2373 	ld	d,a
   7F13 DD 6E F7      [19] 2374 	ld	l,-9 (ix)
   7F16 DD 66 F8      [19] 2375 	ld	h,-8 (ix)
   7F19 46            [ 7] 2376 	ld	b,(hl)
   7F1A 05            [ 4] 2377 	dec	b
   7F1B D5            [11] 2378 	push	de
   7F1C 33            [ 6] 2379 	inc	sp
   7F1D C5            [11] 2380 	push	bc
   7F1E 33            [ 6] 2381 	inc	sp
   7F1F CD 7E 73      [17] 2382 	call	_getTilePtr
   7F22 F1            [10] 2383 	pop	af
   7F23 4E            [ 7] 2384 	ld	c,(hl)
   7F24 3E 02         [ 7] 2385 	ld	a,#0x02
   7F26 91            [ 4] 2386 	sub	a, c
   7F27 DA 6A 84      [10] 2387 	jp	C,00189$
                           2388 ;src/main.c:488: moverEnemigoIzquierda(enemy);
   7F2A DD 6E F7      [19] 2389 	ld	l,-9 (ix)
   7F2D DD 66 F8      [19] 2390 	ld	h,-8 (ix)
   7F30 E5            [11] 2391 	push	hl
   7F31 CD D7 7A      [17] 2392 	call	_moverEnemigoIzquierda
   7F34 F1            [10] 2393 	pop	af
                           2394 ;src/main.c:490: mov = 1;
   7F35 C3 6A 84      [10] 2395 	jp	00189$
   7F38                    2396 00110$:
                           2397 ;src/main.c:493: if(*getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   7F38 78            [ 4] 2398 	ld	a,b
   7F39 C6 05         [ 7] 2399 	add	a, #0x05
   7F3B 47            [ 4] 2400 	ld	b,a
   7F3C DD 7E FB      [19] 2401 	ld	a,-5 (ix)
   7F3F F5            [11] 2402 	push	af
   7F40 33            [ 6] 2403 	inc	sp
   7F41 C5            [11] 2404 	push	bc
   7F42 33            [ 6] 2405 	inc	sp
   7F43 CD 7E 73      [17] 2406 	call	_getTilePtr
   7F46 F1            [10] 2407 	pop	af
   7F47 4E            [ 7] 2408 	ld	c,(hl)
   7F48 3E 02         [ 7] 2409 	ld	a,#0x02
   7F4A 91            [ 4] 2410 	sub	a, c
   7F4B DA 6A 84      [10] 2411 	jp	C,00189$
                           2412 ;src/main.c:494: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   7F4E DD 6E F9      [19] 2413 	ld	l,-7 (ix)
   7F51 DD 66 FA      [19] 2414 	ld	h,-6 (ix)
   7F54 7E            [ 7] 2415 	ld	a,(hl)
   7F55 C6 0B         [ 7] 2416 	add	a, #0x0B
   7F57 57            [ 4] 2417 	ld	d,a
   7F58 DD 6E F7      [19] 2418 	ld	l,-9 (ix)
   7F5B DD 66 F8      [19] 2419 	ld	h,-8 (ix)
   7F5E 7E            [ 7] 2420 	ld	a,(hl)
   7F5F C6 05         [ 7] 2421 	add	a, #0x05
   7F61 47            [ 4] 2422 	ld	b,a
   7F62 D5            [11] 2423 	push	de
   7F63 33            [ 6] 2424 	inc	sp
   7F64 C5            [11] 2425 	push	bc
   7F65 33            [ 6] 2426 	inc	sp
   7F66 CD 7E 73      [17] 2427 	call	_getTilePtr
   7F69 F1            [10] 2428 	pop	af
   7F6A 4E            [ 7] 2429 	ld	c,(hl)
   7F6B 3E 02         [ 7] 2430 	ld	a,#0x02
   7F6D 91            [ 4] 2431 	sub	a, c
   7F6E DA 6A 84      [10] 2432 	jp	C,00189$
                           2433 ;src/main.c:495: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   7F71 DD 6E F9      [19] 2434 	ld	l,-7 (ix)
   7F74 DD 66 FA      [19] 2435 	ld	h,-6 (ix)
   7F77 7E            [ 7] 2436 	ld	a,(hl)
   7F78 C6 16         [ 7] 2437 	add	a, #0x16
   7F7A 57            [ 4] 2438 	ld	d,a
   7F7B DD 6E F7      [19] 2439 	ld	l,-9 (ix)
   7F7E DD 66 F8      [19] 2440 	ld	h,-8 (ix)
   7F81 7E            [ 7] 2441 	ld	a,(hl)
   7F82 C6 05         [ 7] 2442 	add	a, #0x05
   7F84 47            [ 4] 2443 	ld	b,a
   7F85 D5            [11] 2444 	push	de
   7F86 33            [ 6] 2445 	inc	sp
   7F87 C5            [11] 2446 	push	bc
   7F88 33            [ 6] 2447 	inc	sp
   7F89 CD 7E 73      [17] 2448 	call	_getTilePtr
   7F8C F1            [10] 2449 	pop	af
   7F8D 4E            [ 7] 2450 	ld	c,(hl)
   7F8E 3E 02         [ 7] 2451 	ld	a,#0x02
   7F90 91            [ 4] 2452 	sub	a, c
   7F91 DA 6A 84      [10] 2453 	jp	C,00189$
                           2454 ;src/main.c:496: moverEnemigoDerecha(enemy);
   7F94 DD 6E F7      [19] 2455 	ld	l,-9 (ix)
   7F97 DD 66 F8      [19] 2456 	ld	h,-8 (ix)
   7F9A E5            [11] 2457 	push	hl
   7F9B CD C7 7A      [17] 2458 	call	_moverEnemigoDerecha
   7F9E F1            [10] 2459 	pop	af
                           2460 ;src/main.c:498: mov = 1;
   7F9F C3 6A 84      [10] 2461 	jp	00189$
   7FA2                    2462 00187$:
                           2463 ;src/main.c:503: else if (enemy->x == dx) {
   7FA2 DD 6E F7      [19] 2464 	ld	l,-9 (ix)
   7FA5 DD 66 F8      [19] 2465 	ld	h,-8 (ix)
   7FA8 7E            [ 7] 2466 	ld	a,(hl)
   7FA9 DD 77 FD      [19] 2467 	ld	-3 (ix), a
   7FAC DD 96 06      [19] 2468 	sub	a, 6 (ix)
   7FAF C2 8E 80      [10] 2469 	jp	NZ,00184$
                           2470 ;src/main.c:505: if (dist > 10) {
   7FB2 DD 7E FC      [19] 2471 	ld	a,-4 (ix)
   7FB5 B7            [ 4] 2472 	or	a, a
   7FB6 CA 6A 84      [10] 2473 	jp	Z,00189$
                           2474 ;src/main.c:506: if (dy < enemy->y) {
   7FB9 DD 7E 07      [19] 2475 	ld	a,7 (ix)
   7FBC DD 96 FB      [19] 2476 	sub	a, -5 (ix)
   7FBF 30 65         [12] 2477 	jr	NC,00123$
                           2478 ;src/main.c:507: if(*getTilePtr(enemy->x, enemy->y - 2) <= 2
   7FC1 DD 46 FB      [19] 2479 	ld	b,-5 (ix)
   7FC4 05            [ 4] 2480 	dec	b
   7FC5 05            [ 4] 2481 	dec	b
   7FC6 C5            [11] 2482 	push	bc
   7FC7 33            [ 6] 2483 	inc	sp
   7FC8 DD 7E FD      [19] 2484 	ld	a,-3 (ix)
   7FCB F5            [11] 2485 	push	af
   7FCC 33            [ 6] 2486 	inc	sp
   7FCD CD 7E 73      [17] 2487 	call	_getTilePtr
   7FD0 F1            [10] 2488 	pop	af
   7FD1 4E            [ 7] 2489 	ld	c,(hl)
   7FD2 3E 02         [ 7] 2490 	ld	a,#0x02
   7FD4 91            [ 4] 2491 	sub	a, c
   7FD5 DA 6A 84      [10] 2492 	jp	C,00189$
                           2493 ;src/main.c:508: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7FD8 DD 6E F9      [19] 2494 	ld	l,-7 (ix)
   7FDB DD 66 FA      [19] 2495 	ld	h,-6 (ix)
   7FDE 46            [ 7] 2496 	ld	b,(hl)
   7FDF 05            [ 4] 2497 	dec	b
   7FE0 05            [ 4] 2498 	dec	b
   7FE1 DD 6E F7      [19] 2499 	ld	l,-9 (ix)
   7FE4 DD 66 F8      [19] 2500 	ld	h,-8 (ix)
   7FE7 56            [ 7] 2501 	ld	d,(hl)
   7FE8 14            [ 4] 2502 	inc	d
   7FE9 14            [ 4] 2503 	inc	d
   7FEA 4A            [ 4] 2504 	ld	c, d
   7FEB C5            [11] 2505 	push	bc
   7FEC CD 7E 73      [17] 2506 	call	_getTilePtr
   7FEF F1            [10] 2507 	pop	af
   7FF0 4E            [ 7] 2508 	ld	c,(hl)
   7FF1 3E 02         [ 7] 2509 	ld	a,#0x02
   7FF3 91            [ 4] 2510 	sub	a, c
   7FF4 DA 6A 84      [10] 2511 	jp	C,00189$
                           2512 ;src/main.c:509: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   7FF7 DD 6E F9      [19] 2513 	ld	l,-7 (ix)
   7FFA DD 66 FA      [19] 2514 	ld	h,-6 (ix)
   7FFD 46            [ 7] 2515 	ld	b,(hl)
   7FFE 05            [ 4] 2516 	dec	b
   7FFF 05            [ 4] 2517 	dec	b
   8000 DD 6E F7      [19] 2518 	ld	l,-9 (ix)
   8003 DD 66 F8      [19] 2519 	ld	h,-8 (ix)
   8006 7E            [ 7] 2520 	ld	a,(hl)
   8007 C6 04         [ 7] 2521 	add	a, #0x04
   8009 C5            [11] 2522 	push	bc
   800A 33            [ 6] 2523 	inc	sp
   800B F5            [11] 2524 	push	af
   800C 33            [ 6] 2525 	inc	sp
   800D CD 7E 73      [17] 2526 	call	_getTilePtr
   8010 F1            [10] 2527 	pop	af
   8011 4E            [ 7] 2528 	ld	c,(hl)
   8012 3E 02         [ 7] 2529 	ld	a,#0x02
   8014 91            [ 4] 2530 	sub	a, c
   8015 DA 6A 84      [10] 2531 	jp	C,00189$
                           2532 ;src/main.c:510: moverEnemigoArriba(enemy);
   8018 DD 6E F7      [19] 2533 	ld	l,-9 (ix)
   801B DD 66 F8      [19] 2534 	ld	h,-8 (ix)
   801E E5            [11] 2535 	push	hl
   801F CD 89 7A      [17] 2536 	call	_moverEnemigoArriba
   8022 F1            [10] 2537 	pop	af
                           2538 ;src/main.c:512: mov = 1;
   8023 C3 6A 84      [10] 2539 	jp	00189$
   8026                    2540 00123$:
                           2541 ;src/main.c:515: if(*getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   8026 DD 7E FB      [19] 2542 	ld	a,-5 (ix)
   8029 C6 18         [ 7] 2543 	add	a, #0x18
   802B 47            [ 4] 2544 	ld	b,a
   802C C5            [11] 2545 	push	bc
   802D 33            [ 6] 2546 	inc	sp
   802E DD 7E FD      [19] 2547 	ld	a,-3 (ix)
   8031 F5            [11] 2548 	push	af
   8032 33            [ 6] 2549 	inc	sp
   8033 CD 7E 73      [17] 2550 	call	_getTilePtr
   8036 F1            [10] 2551 	pop	af
   8037 4E            [ 7] 2552 	ld	c,(hl)
   8038 3E 02         [ 7] 2553 	ld	a,#0x02
   803A 91            [ 4] 2554 	sub	a, c
   803B DA 6A 84      [10] 2555 	jp	C,00189$
                           2556 ;src/main.c:516: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   803E DD 6E F9      [19] 2557 	ld	l,-7 (ix)
   8041 DD 66 FA      [19] 2558 	ld	h,-6 (ix)
   8044 7E            [ 7] 2559 	ld	a,(hl)
   8045 C6 18         [ 7] 2560 	add	a, #0x18
   8047 47            [ 4] 2561 	ld	b,a
   8048 DD 6E F7      [19] 2562 	ld	l,-9 (ix)
   804B DD 66 F8      [19] 2563 	ld	h,-8 (ix)
   804E 56            [ 7] 2564 	ld	d,(hl)
   804F 14            [ 4] 2565 	inc	d
   8050 14            [ 4] 2566 	inc	d
   8051 4A            [ 4] 2567 	ld	c, d
   8052 C5            [11] 2568 	push	bc
   8053 CD 7E 73      [17] 2569 	call	_getTilePtr
   8056 F1            [10] 2570 	pop	af
   8057 4E            [ 7] 2571 	ld	c,(hl)
   8058 3E 02         [ 7] 2572 	ld	a,#0x02
   805A 91            [ 4] 2573 	sub	a, c
   805B DA 6A 84      [10] 2574 	jp	C,00189$
                           2575 ;src/main.c:517: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   805E DD 6E F9      [19] 2576 	ld	l,-7 (ix)
   8061 DD 66 FA      [19] 2577 	ld	h,-6 (ix)
   8064 7E            [ 7] 2578 	ld	a,(hl)
   8065 C6 18         [ 7] 2579 	add	a, #0x18
   8067 47            [ 4] 2580 	ld	b,a
   8068 DD 6E F7      [19] 2581 	ld	l,-9 (ix)
   806B DD 66 F8      [19] 2582 	ld	h,-8 (ix)
   806E 7E            [ 7] 2583 	ld	a,(hl)
   806F C6 04         [ 7] 2584 	add	a, #0x04
   8071 C5            [11] 2585 	push	bc
   8072 33            [ 6] 2586 	inc	sp
   8073 F5            [11] 2587 	push	af
   8074 33            [ 6] 2588 	inc	sp
   8075 CD 7E 73      [17] 2589 	call	_getTilePtr
   8078 F1            [10] 2590 	pop	af
   8079 4E            [ 7] 2591 	ld	c,(hl)
   807A 3E 02         [ 7] 2592 	ld	a,#0x02
   807C 91            [ 4] 2593 	sub	a, c
   807D DA 6A 84      [10] 2594 	jp	C,00189$
                           2595 ;src/main.c:518: moverEnemigoAbajo(enemy);
   8080 DD 6E F7      [19] 2596 	ld	l,-9 (ix)
   8083 DD 66 F8      [19] 2597 	ld	h,-8 (ix)
   8086 E5            [11] 2598 	push	hl
   8087 CD A8 7A      [17] 2599 	call	_moverEnemigoAbajo
   808A F1            [10] 2600 	pop	af
                           2601 ;src/main.c:520: mov = 1;
   808B C3 6A 84      [10] 2602 	jp	00189$
   808E                    2603 00184$:
                           2604 ;src/main.c:526: if (dist > 20) {
   808E 3E 14         [ 7] 2605 	ld	a,#0x14
   8090 DD 96 F5      [19] 2606 	sub	a, -11 (ix)
   8093 D2 6A 84      [10] 2607 	jp	NC,00189$
                           2608 ;src/main.c:527: if (dx < enemy->x) {
   8096 DD 7E 06      [19] 2609 	ld	a,6 (ix)
   8099 DD 96 FD      [19] 2610 	sub	a, -3 (ix)
   809C 30 6F         [12] 2611 	jr	NC,00136$
                           2612 ;src/main.c:528: if(*getTilePtr(enemy->x - 1, enemy->y) <= 2
   809E DD 46 FD      [19] 2613 	ld	b,-3 (ix)
   80A1 05            [ 4] 2614 	dec	b
   80A2 DD 7E FB      [19] 2615 	ld	a,-5 (ix)
   80A5 F5            [11] 2616 	push	af
   80A6 33            [ 6] 2617 	inc	sp
   80A7 C5            [11] 2618 	push	bc
   80A8 33            [ 6] 2619 	inc	sp
   80A9 CD 7E 73      [17] 2620 	call	_getTilePtr
   80AC F1            [10] 2621 	pop	af
   80AD 4E            [ 7] 2622 	ld	c,(hl)
   80AE 3E 02         [ 7] 2623 	ld	a,#0x02
   80B0 91            [ 4] 2624 	sub	a, c
   80B1 DA 7B 81      [10] 2625 	jp	C,00137$
                           2626 ;src/main.c:529: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   80B4 DD 6E F9      [19] 2627 	ld	l,-7 (ix)
   80B7 DD 66 FA      [19] 2628 	ld	h,-6 (ix)
   80BA 7E            [ 7] 2629 	ld	a,(hl)
   80BB C6 0B         [ 7] 2630 	add	a, #0x0B
   80BD 4F            [ 4] 2631 	ld	c,a
   80BE DD 6E F7      [19] 2632 	ld	l,-9 (ix)
   80C1 DD 66 F8      [19] 2633 	ld	h,-8 (ix)
   80C4 46            [ 7] 2634 	ld	b,(hl)
   80C5 05            [ 4] 2635 	dec	b
   80C6 79            [ 4] 2636 	ld	a,c
   80C7 F5            [11] 2637 	push	af
   80C8 33            [ 6] 2638 	inc	sp
   80C9 C5            [11] 2639 	push	bc
   80CA 33            [ 6] 2640 	inc	sp
   80CB CD 7E 73      [17] 2641 	call	_getTilePtr
   80CE F1            [10] 2642 	pop	af
   80CF 4E            [ 7] 2643 	ld	c,(hl)
   80D0 3E 02         [ 7] 2644 	ld	a,#0x02
   80D2 91            [ 4] 2645 	sub	a, c
   80D3 DA 7B 81      [10] 2646 	jp	C,00137$
                           2647 ;src/main.c:530: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   80D6 DD 6E F9      [19] 2648 	ld	l,-7 (ix)
   80D9 DD 66 FA      [19] 2649 	ld	h,-6 (ix)
   80DC 7E            [ 7] 2650 	ld	a,(hl)
   80DD C6 16         [ 7] 2651 	add	a, #0x16
   80DF 4F            [ 4] 2652 	ld	c,a
   80E0 DD 6E F7      [19] 2653 	ld	l,-9 (ix)
   80E3 DD 66 F8      [19] 2654 	ld	h,-8 (ix)
   80E6 46            [ 7] 2655 	ld	b,(hl)
   80E7 05            [ 4] 2656 	dec	b
   80E8 79            [ 4] 2657 	ld	a,c
   80E9 F5            [11] 2658 	push	af
   80EA 33            [ 6] 2659 	inc	sp
   80EB C5            [11] 2660 	push	bc
   80EC 33            [ 6] 2661 	inc	sp
   80ED CD 7E 73      [17] 2662 	call	_getTilePtr
   80F0 F1            [10] 2663 	pop	af
   80F1 4E            [ 7] 2664 	ld	c,(hl)
   80F2 3E 02         [ 7] 2665 	ld	a,#0x02
   80F4 91            [ 4] 2666 	sub	a, c
   80F5 DA 7B 81      [10] 2667 	jp	C,00137$
                           2668 ;src/main.c:531: moverEnemigoIzquierda(enemy);
   80F8 DD 6E F7      [19] 2669 	ld	l,-9 (ix)
   80FB DD 66 F8      [19] 2670 	ld	h,-8 (ix)
   80FE E5            [11] 2671 	push	hl
   80FF CD D7 7A      [17] 2672 	call	_moverEnemigoIzquierda
   8102 F1            [10] 2673 	pop	af
                           2674 ;src/main.c:532: movX = 1;
   8103 DD 36 F4 01   [19] 2675 	ld	-12 (ix),#0x01
                           2676 ;src/main.c:533: mov = 1;
   8107 DD 36 F3 01   [19] 2677 	ld	-13 (ix),#0x01
   810B 18 6E         [12] 2678 	jr	00137$
   810D                    2679 00136$:
                           2680 ;src/main.c:536: if(*getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   810D DD 7E FD      [19] 2681 	ld	a,-3 (ix)
   8110 C6 05         [ 7] 2682 	add	a, #0x05
   8112 47            [ 4] 2683 	ld	b,a
   8113 DD 7E FB      [19] 2684 	ld	a,-5 (ix)
   8116 F5            [11] 2685 	push	af
   8117 33            [ 6] 2686 	inc	sp
   8118 C5            [11] 2687 	push	bc
   8119 33            [ 6] 2688 	inc	sp
   811A CD 7E 73      [17] 2689 	call	_getTilePtr
   811D F1            [10] 2690 	pop	af
   811E 4E            [ 7] 2691 	ld	c,(hl)
   811F 3E 02         [ 7] 2692 	ld	a,#0x02
   8121 91            [ 4] 2693 	sub	a, c
   8122 38 57         [12] 2694 	jr	C,00137$
                           2695 ;src/main.c:537: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   8124 DD 6E F9      [19] 2696 	ld	l,-7 (ix)
   8127 DD 66 FA      [19] 2697 	ld	h,-6 (ix)
   812A 7E            [ 7] 2698 	ld	a,(hl)
   812B C6 0B         [ 7] 2699 	add	a, #0x0B
   812D 57            [ 4] 2700 	ld	d,a
   812E DD 6E F7      [19] 2701 	ld	l,-9 (ix)
   8131 DD 66 F8      [19] 2702 	ld	h,-8 (ix)
   8134 7E            [ 7] 2703 	ld	a,(hl)
   8135 C6 05         [ 7] 2704 	add	a, #0x05
   8137 47            [ 4] 2705 	ld	b,a
   8138 D5            [11] 2706 	push	de
   8139 33            [ 6] 2707 	inc	sp
   813A C5            [11] 2708 	push	bc
   813B 33            [ 6] 2709 	inc	sp
   813C CD 7E 73      [17] 2710 	call	_getTilePtr
   813F F1            [10] 2711 	pop	af
   8140 4E            [ 7] 2712 	ld	c,(hl)
   8141 3E 02         [ 7] 2713 	ld	a,#0x02
   8143 91            [ 4] 2714 	sub	a, c
   8144 38 35         [12] 2715 	jr	C,00137$
                           2716 ;src/main.c:538: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   8146 DD 6E F9      [19] 2717 	ld	l,-7 (ix)
   8149 DD 66 FA      [19] 2718 	ld	h,-6 (ix)
   814C 7E            [ 7] 2719 	ld	a,(hl)
   814D C6 16         [ 7] 2720 	add	a, #0x16
   814F 57            [ 4] 2721 	ld	d,a
   8150 DD 6E F7      [19] 2722 	ld	l,-9 (ix)
   8153 DD 66 F8      [19] 2723 	ld	h,-8 (ix)
   8156 7E            [ 7] 2724 	ld	a,(hl)
   8157 C6 05         [ 7] 2725 	add	a, #0x05
   8159 47            [ 4] 2726 	ld	b,a
   815A D5            [11] 2727 	push	de
   815B 33            [ 6] 2728 	inc	sp
   815C C5            [11] 2729 	push	bc
   815D 33            [ 6] 2730 	inc	sp
   815E CD 7E 73      [17] 2731 	call	_getTilePtr
   8161 F1            [10] 2732 	pop	af
   8162 4E            [ 7] 2733 	ld	c,(hl)
   8163 3E 02         [ 7] 2734 	ld	a,#0x02
   8165 91            [ 4] 2735 	sub	a, c
   8166 38 13         [12] 2736 	jr	C,00137$
                           2737 ;src/main.c:539: moverEnemigoDerecha(enemy);
   8168 DD 6E F7      [19] 2738 	ld	l,-9 (ix)
   816B DD 66 F8      [19] 2739 	ld	h,-8 (ix)
   816E E5            [11] 2740 	push	hl
   816F CD C7 7A      [17] 2741 	call	_moverEnemigoDerecha
   8172 F1            [10] 2742 	pop	af
                           2743 ;src/main.c:540: movX = 1;
   8173 DD 36 F4 01   [19] 2744 	ld	-12 (ix),#0x01
                           2745 ;src/main.c:541: mov = 1;
   8177 DD 36 F3 01   [19] 2746 	ld	-13 (ix),#0x01
   817B                    2747 00137$:
                           2748 ;src/main.c:544: if (dy < enemy->y) {
   817B DD 6E F9      [19] 2749 	ld	l,-7 (ix)
   817E DD 66 FA      [19] 2750 	ld	h,-6 (ix)
   8181 7E            [ 7] 2751 	ld	a,(hl)
   8182 DD 77 FD      [19] 2752 	ld	-3 (ix),a
                           2753 ;src/main.c:473: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   8185 DD 6E F7      [19] 2754 	ld	l,-9 (ix)
   8188 DD 66 F8      [19] 2755 	ld	h,-8 (ix)
   818B 7E            [ 7] 2756 	ld	a,(hl)
   818C DD 77 FC      [19] 2757 	ld	-4 (ix),a
                           2758 ;src/main.c:544: if (dy < enemy->y) {
   818F DD 7E 07      [19] 2759 	ld	a,7 (ix)
   8192 DD 96 FD      [19] 2760 	sub	a, -3 (ix)
   8195 D2 1B 82      [10] 2761 	jp	NC,00147$
                           2762 ;src/main.c:545: if(*getTilePtr(enemy->x, enemy->y - 2) <= 2
   8198 DD 7E FD      [19] 2763 	ld	a,-3 (ix)
   819B C6 FE         [ 7] 2764 	add	a,#0xFE
   819D DD 77 FB      [19] 2765 	ld	-5 (ix), a
   81A0 F5            [11] 2766 	push	af
   81A1 33            [ 6] 2767 	inc	sp
   81A2 DD 7E FC      [19] 2768 	ld	a,-4 (ix)
   81A5 F5            [11] 2769 	push	af
   81A6 33            [ 6] 2770 	inc	sp
   81A7 CD 7E 73      [17] 2771 	call	_getTilePtr
   81AA F1            [10] 2772 	pop	af
   81AB DD 74 FF      [19] 2773 	ld	-1 (ix),h
   81AE DD 75 FE      [19] 2774 	ld	-2 (ix), l
   81B1 DD 66 FF      [19] 2775 	ld	h,-1 (ix)
   81B4 4E            [ 7] 2776 	ld	c,(hl)
   81B5 3E 02         [ 7] 2777 	ld	a,#0x02
   81B7 91            [ 4] 2778 	sub	a, c
   81B8 DA 87 82      [10] 2779 	jp	C,00148$
                           2780 ;src/main.c:546: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   81BB DD 6E F9      [19] 2781 	ld	l,-7 (ix)
   81BE DD 66 FA      [19] 2782 	ld	h,-6 (ix)
   81C1 7E            [ 7] 2783 	ld	a,(hl)
   81C2 DD 77 FE      [19] 2784 	ld	-2 (ix), a
   81C5 C6 FE         [ 7] 2785 	add	a,#0xFE
   81C7 DD 77 FE      [19] 2786 	ld	-2 (ix),a
   81CA DD 6E F7      [19] 2787 	ld	l,-9 (ix)
   81CD DD 66 F8      [19] 2788 	ld	h,-8 (ix)
   81D0 46            [ 7] 2789 	ld	b,(hl)
   81D1 04            [ 4] 2790 	inc	b
   81D2 04            [ 4] 2791 	inc	b
   81D3 DD 7E FE      [19] 2792 	ld	a,-2 (ix)
   81D6 F5            [11] 2793 	push	af
   81D7 33            [ 6] 2794 	inc	sp
   81D8 C5            [11] 2795 	push	bc
   81D9 33            [ 6] 2796 	inc	sp
   81DA CD 7E 73      [17] 2797 	call	_getTilePtr
   81DD F1            [10] 2798 	pop	af
   81DE 4E            [ 7] 2799 	ld	c,(hl)
   81DF 3E 02         [ 7] 2800 	ld	a,#0x02
   81E1 91            [ 4] 2801 	sub	a, c
   81E2 DA 87 82      [10] 2802 	jp	C,00148$
                           2803 ;src/main.c:547: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   81E5 DD 6E F9      [19] 2804 	ld	l,-7 (ix)
   81E8 DD 66 FA      [19] 2805 	ld	h,-6 (ix)
   81EB 46            [ 7] 2806 	ld	b,(hl)
   81EC 05            [ 4] 2807 	dec	b
   81ED 05            [ 4] 2808 	dec	b
   81EE DD 6E F7      [19] 2809 	ld	l,-9 (ix)
   81F1 DD 66 F8      [19] 2810 	ld	h,-8 (ix)
   81F4 7E            [ 7] 2811 	ld	a,(hl)
   81F5 C6 04         [ 7] 2812 	add	a, #0x04
   81F7 C5            [11] 2813 	push	bc
   81F8 33            [ 6] 2814 	inc	sp
   81F9 F5            [11] 2815 	push	af
   81FA 33            [ 6] 2816 	inc	sp
   81FB CD 7E 73      [17] 2817 	call	_getTilePtr
   81FE F1            [10] 2818 	pop	af
   81FF 4E            [ 7] 2819 	ld	c,(hl)
   8200 3E 02         [ 7] 2820 	ld	a,#0x02
   8202 91            [ 4] 2821 	sub	a, c
   8203 DA 87 82      [10] 2822 	jp	C,00148$
                           2823 ;src/main.c:548: moverEnemigoArriba(enemy);
   8206 DD 6E F7      [19] 2824 	ld	l,-9 (ix)
   8209 DD 66 F8      [19] 2825 	ld	h,-8 (ix)
   820C E5            [11] 2826 	push	hl
   820D CD 89 7A      [17] 2827 	call	_moverEnemigoArriba
   8210 F1            [10] 2828 	pop	af
                           2829 ;src/main.c:549: movY = 1;
   8211 DD 36 F6 01   [19] 2830 	ld	-10 (ix),#0x01
                           2831 ;src/main.c:550: mov = 1;
   8215 DD 36 F3 01   [19] 2832 	ld	-13 (ix),#0x01
   8219 18 6C         [12] 2833 	jr	00148$
   821B                    2834 00147$:
                           2835 ;src/main.c:553: if(*getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   821B DD 7E FD      [19] 2836 	ld	a,-3 (ix)
   821E C6 18         [ 7] 2837 	add	a, #0x18
   8220 47            [ 4] 2838 	ld	b,a
   8221 C5            [11] 2839 	push	bc
   8222 33            [ 6] 2840 	inc	sp
   8223 DD 7E FC      [19] 2841 	ld	a,-4 (ix)
   8226 F5            [11] 2842 	push	af
   8227 33            [ 6] 2843 	inc	sp
   8228 CD 7E 73      [17] 2844 	call	_getTilePtr
   822B F1            [10] 2845 	pop	af
   822C 4E            [ 7] 2846 	ld	c,(hl)
   822D 3E 02         [ 7] 2847 	ld	a,#0x02
   822F 91            [ 4] 2848 	sub	a, c
   8230 38 55         [12] 2849 	jr	C,00148$
                           2850 ;src/main.c:554: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   8232 DD 6E F9      [19] 2851 	ld	l,-7 (ix)
   8235 DD 66 FA      [19] 2852 	ld	h,-6 (ix)
   8238 7E            [ 7] 2853 	ld	a,(hl)
   8239 C6 18         [ 7] 2854 	add	a, #0x18
   823B 57            [ 4] 2855 	ld	d,a
   823C DD 6E F7      [19] 2856 	ld	l,-9 (ix)
   823F DD 66 F8      [19] 2857 	ld	h,-8 (ix)
   8242 46            [ 7] 2858 	ld	b,(hl)
   8243 04            [ 4] 2859 	inc	b
   8244 04            [ 4] 2860 	inc	b
   8245 D5            [11] 2861 	push	de
   8246 33            [ 6] 2862 	inc	sp
   8247 C5            [11] 2863 	push	bc
   8248 33            [ 6] 2864 	inc	sp
   8249 CD 7E 73      [17] 2865 	call	_getTilePtr
   824C F1            [10] 2866 	pop	af
   824D 4E            [ 7] 2867 	ld	c,(hl)
   824E 3E 02         [ 7] 2868 	ld	a,#0x02
   8250 91            [ 4] 2869 	sub	a, c
   8251 38 34         [12] 2870 	jr	C,00148$
                           2871 ;src/main.c:555: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   8253 DD 6E F9      [19] 2872 	ld	l,-7 (ix)
   8256 DD 66 FA      [19] 2873 	ld	h,-6 (ix)
   8259 7E            [ 7] 2874 	ld	a,(hl)
   825A C6 18         [ 7] 2875 	add	a, #0x18
   825C 47            [ 4] 2876 	ld	b,a
   825D DD 6E F7      [19] 2877 	ld	l,-9 (ix)
   8260 DD 66 F8      [19] 2878 	ld	h,-8 (ix)
   8263 7E            [ 7] 2879 	ld	a,(hl)
   8264 C6 04         [ 7] 2880 	add	a, #0x04
   8266 C5            [11] 2881 	push	bc
   8267 33            [ 6] 2882 	inc	sp
   8268 F5            [11] 2883 	push	af
   8269 33            [ 6] 2884 	inc	sp
   826A CD 7E 73      [17] 2885 	call	_getTilePtr
   826D F1            [10] 2886 	pop	af
   826E 4E            [ 7] 2887 	ld	c,(hl)
   826F 3E 02         [ 7] 2888 	ld	a,#0x02
   8271 91            [ 4] 2889 	sub	a, c
   8272 38 13         [12] 2890 	jr	C,00148$
                           2891 ;src/main.c:556: moverEnemigoAbajo(enemy);
   8274 DD 6E F7      [19] 2892 	ld	l,-9 (ix)
   8277 DD 66 F8      [19] 2893 	ld	h,-8 (ix)
   827A E5            [11] 2894 	push	hl
   827B CD A8 7A      [17] 2895 	call	_moverEnemigoAbajo
   827E F1            [10] 2896 	pop	af
                           2897 ;src/main.c:557: movY = 1;
   827F DD 36 F6 01   [19] 2898 	ld	-10 (ix),#0x01
                           2899 ;src/main.c:558: mov = 1;
   8283 DD 36 F3 01   [19] 2900 	ld	-13 (ix),#0x01
   8287                    2901 00148$:
                           2902 ;src/main.c:561: if (!mov) {
   8287 DD 7E F3      [19] 2903 	ld	a,-13 (ix)
   828A B7            [ 4] 2904 	or	a, a
   828B C2 6A 84      [10] 2905 	jp	NZ,00189$
                           2906 ;src/main.c:562: if (!movX) {
   828E DD 7E F4      [19] 2907 	ld	a,-12 (ix)
   8291 B7            [ 4] 2908 	or	a, a
   8292 C2 7A 83      [10] 2909 	jp	NZ,00163$
                           2910 ;src/main.c:563: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   8295 DD 6E F9      [19] 2911 	ld	l,-7 (ix)
   8298 DD 66 FA      [19] 2912 	ld	h,-6 (ix)
   829B 5E            [ 7] 2913 	ld	e,(hl)
                           2914 ;src/main.c:473: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   829C DD 6E F7      [19] 2915 	ld	l,-9 (ix)
   829F DD 66 F8      [19] 2916 	ld	h,-8 (ix)
   82A2 4E            [ 7] 2917 	ld	c,(hl)
                           2918 ;src/main.c:563: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   82A3 3E 70         [ 7] 2919 	ld	a,#0x70
   82A5 93            [ 4] 2920 	sub	a, e
   82A6 30 6C         [12] 2921 	jr	NC,00160$
                           2922 ;src/main.c:564: if(*getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   82A8 7B            [ 4] 2923 	ld	a,e
   82A9 C6 18         [ 7] 2924 	add	a, #0x18
   82AB 47            [ 4] 2925 	ld	b,a
   82AC C5            [11] 2926 	push	bc
   82AD CD 7E 73      [17] 2927 	call	_getTilePtr
   82B0 F1            [10] 2928 	pop	af
   82B1 4E            [ 7] 2929 	ld	c,(hl)
   82B2 3E 02         [ 7] 2930 	ld	a,#0x02
   82B4 91            [ 4] 2931 	sub	a, c
   82B5 38 50         [12] 2932 	jr	C,00150$
                           2933 ;src/main.c:565: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   82B7 DD 6E F9      [19] 2934 	ld	l,-7 (ix)
   82BA DD 66 FA      [19] 2935 	ld	h,-6 (ix)
   82BD 7E            [ 7] 2936 	ld	a,(hl)
   82BE C6 18         [ 7] 2937 	add	a, #0x18
   82C0 57            [ 4] 2938 	ld	d,a
   82C1 DD 6E F7      [19] 2939 	ld	l,-9 (ix)
   82C4 DD 66 F8      [19] 2940 	ld	h,-8 (ix)
   82C7 4E            [ 7] 2941 	ld	c,(hl)
   82C8 41            [ 4] 2942 	ld	b,c
   82C9 04            [ 4] 2943 	inc	b
   82CA 04            [ 4] 2944 	inc	b
   82CB D5            [11] 2945 	push	de
   82CC 33            [ 6] 2946 	inc	sp
   82CD C5            [11] 2947 	push	bc
   82CE 33            [ 6] 2948 	inc	sp
   82CF CD 7E 73      [17] 2949 	call	_getTilePtr
   82D2 F1            [10] 2950 	pop	af
   82D3 4E            [ 7] 2951 	ld	c,(hl)
   82D4 3E 02         [ 7] 2952 	ld	a,#0x02
   82D6 91            [ 4] 2953 	sub	a, c
   82D7 38 2E         [12] 2954 	jr	C,00150$
                           2955 ;src/main.c:566: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   82D9 DD 6E F9      [19] 2956 	ld	l,-7 (ix)
   82DC DD 66 FA      [19] 2957 	ld	h,-6 (ix)
   82DF 7E            [ 7] 2958 	ld	a,(hl)
   82E0 C6 18         [ 7] 2959 	add	a, #0x18
   82E2 47            [ 4] 2960 	ld	b,a
   82E3 DD 6E F7      [19] 2961 	ld	l,-9 (ix)
   82E6 DD 66 F8      [19] 2962 	ld	h,-8 (ix)
   82E9 7E            [ 7] 2963 	ld	a,(hl)
   82EA C6 04         [ 7] 2964 	add	a, #0x04
   82EC C5            [11] 2965 	push	bc
   82ED 33            [ 6] 2966 	inc	sp
   82EE F5            [11] 2967 	push	af
   82EF 33            [ 6] 2968 	inc	sp
   82F0 CD 7E 73      [17] 2969 	call	_getTilePtr
   82F3 F1            [10] 2970 	pop	af
   82F4 4E            [ 7] 2971 	ld	c,(hl)
   82F5 3E 02         [ 7] 2972 	ld	a,#0x02
   82F7 91            [ 4] 2973 	sub	a, c
   82F8 38 0D         [12] 2974 	jr	C,00150$
                           2975 ;src/main.c:567: moverEnemigoAbajo(enemy);
   82FA DD 6E F7      [19] 2976 	ld	l,-9 (ix)
   82FD DD 66 F8      [19] 2977 	ld	h,-8 (ix)
   8300 E5            [11] 2978 	push	hl
   8301 CD A8 7A      [17] 2979 	call	_moverEnemigoAbajo
   8304 F1            [10] 2980 	pop	af
   8305 18 73         [12] 2981 	jr	00163$
   8307                    2982 00150$:
                           2983 ;src/main.c:569: moverEnemigoArriba(enemy);
   8307 DD 6E F7      [19] 2984 	ld	l,-9 (ix)
   830A DD 66 F8      [19] 2985 	ld	h,-8 (ix)
   830D E5            [11] 2986 	push	hl
   830E CD 89 7A      [17] 2987 	call	_moverEnemigoArriba
   8311 F1            [10] 2988 	pop	af
   8312 18 66         [12] 2989 	jr	00163$
   8314                    2990 00160$:
                           2991 ;src/main.c:571: if(*getTilePtr(enemy->x, enemy->y - 2) <= 2
   8314 43            [ 4] 2992 	ld	b,e
   8315 05            [ 4] 2993 	dec	b
   8316 05            [ 4] 2994 	dec	b
   8317 C5            [11] 2995 	push	bc
   8318 CD 7E 73      [17] 2996 	call	_getTilePtr
   831B F1            [10] 2997 	pop	af
   831C 4E            [ 7] 2998 	ld	c,(hl)
   831D 3E 02         [ 7] 2999 	ld	a,#0x02
   831F 91            [ 4] 3000 	sub	a, c
   8320 38 4D         [12] 3001 	jr	C,00155$
                           3002 ;src/main.c:572: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   8322 DD 6E F9      [19] 3003 	ld	l,-7 (ix)
   8325 DD 66 FA      [19] 3004 	ld	h,-6 (ix)
   8328 56            [ 7] 3005 	ld	d,(hl)
   8329 15            [ 4] 3006 	dec	d
   832A 15            [ 4] 3007 	dec	d
   832B DD 6E F7      [19] 3008 	ld	l,-9 (ix)
   832E DD 66 F8      [19] 3009 	ld	h,-8 (ix)
   8331 46            [ 7] 3010 	ld	b,(hl)
   8332 04            [ 4] 3011 	inc	b
   8333 04            [ 4] 3012 	inc	b
   8334 D5            [11] 3013 	push	de
   8335 33            [ 6] 3014 	inc	sp
   8336 C5            [11] 3015 	push	bc
   8337 33            [ 6] 3016 	inc	sp
   8338 CD 7E 73      [17] 3017 	call	_getTilePtr
   833B F1            [10] 3018 	pop	af
   833C 4E            [ 7] 3019 	ld	c,(hl)
   833D 3E 02         [ 7] 3020 	ld	a,#0x02
   833F 91            [ 4] 3021 	sub	a, c
   8340 38 2D         [12] 3022 	jr	C,00155$
                           3023 ;src/main.c:573: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   8342 DD 6E F9      [19] 3024 	ld	l,-7 (ix)
   8345 DD 66 FA      [19] 3025 	ld	h,-6 (ix)
   8348 46            [ 7] 3026 	ld	b,(hl)
   8349 05            [ 4] 3027 	dec	b
   834A 05            [ 4] 3028 	dec	b
   834B DD 6E F7      [19] 3029 	ld	l,-9 (ix)
   834E DD 66 F8      [19] 3030 	ld	h,-8 (ix)
   8351 7E            [ 7] 3031 	ld	a,(hl)
   8352 C6 04         [ 7] 3032 	add	a, #0x04
   8354 C5            [11] 3033 	push	bc
   8355 33            [ 6] 3034 	inc	sp
   8356 F5            [11] 3035 	push	af
   8357 33            [ 6] 3036 	inc	sp
   8358 CD 7E 73      [17] 3037 	call	_getTilePtr
   835B F1            [10] 3038 	pop	af
   835C 4E            [ 7] 3039 	ld	c,(hl)
   835D 3E 02         [ 7] 3040 	ld	a,#0x02
   835F 91            [ 4] 3041 	sub	a, c
   8360 38 0D         [12] 3042 	jr	C,00155$
                           3043 ;src/main.c:574: moverEnemigoArriba(enemy);
   8362 DD 6E F7      [19] 3044 	ld	l,-9 (ix)
   8365 DD 66 F8      [19] 3045 	ld	h,-8 (ix)
   8368 E5            [11] 3046 	push	hl
   8369 CD 89 7A      [17] 3047 	call	_moverEnemigoArriba
   836C F1            [10] 3048 	pop	af
   836D 18 0B         [12] 3049 	jr	00163$
   836F                    3050 00155$:
                           3051 ;src/main.c:576: moverEnemigoAbajo(enemy);
   836F DD 6E F7      [19] 3052 	ld	l,-9 (ix)
   8372 DD 66 F8      [19] 3053 	ld	h,-8 (ix)
   8375 E5            [11] 3054 	push	hl
   8376 CD A8 7A      [17] 3055 	call	_moverEnemigoAbajo
   8379 F1            [10] 3056 	pop	af
   837A                    3057 00163$:
                           3058 ;src/main.c:580: if (!movY) {
   837A DD 7E F6      [19] 3059 	ld	a,-10 (ix)
   837D B7            [ 4] 3060 	or	a, a
   837E C2 6A 84      [10] 3061 	jp	NZ,00189$
                           3062 ;src/main.c:581: if (enemy->x < ANCHO_PANTALLA/2) {
   8381 DD 6E F7      [19] 3063 	ld	l,-9 (ix)
   8384 DD 66 F8      [19] 3064 	ld	h,-8 (ix)
   8387 4E            [ 7] 3065 	ld	c,(hl)
                           3066 ;src/main.c:474: u8 dify = abs(enemy->y - prota.y);
   8388 DD 6E F9      [19] 3067 	ld	l,-7 (ix)
   838B DD 66 FA      [19] 3068 	ld	h,-6 (ix)
   838E 5E            [ 7] 3069 	ld	e,(hl)
                           3070 ;src/main.c:581: if (enemy->x < ANCHO_PANTALLA/2) {
   838F 79            [ 4] 3071 	ld	a,c
   8390 D6 28         [ 7] 3072 	sub	a, #0x28
   8392 30 6D         [12] 3073 	jr	NC,00175$
                           3074 ;src/main.c:582: if(*getTilePtr(enemy->x - 1, enemy->y) <= 2
   8394 41            [ 4] 3075 	ld	b,c
   8395 05            [ 4] 3076 	dec	b
   8396 7B            [ 4] 3077 	ld	a,e
   8397 F5            [11] 3078 	push	af
   8398 33            [ 6] 3079 	inc	sp
   8399 C5            [11] 3080 	push	bc
   839A 33            [ 6] 3081 	inc	sp
   839B CD 7E 73      [17] 3082 	call	_getTilePtr
   839E F1            [10] 3083 	pop	af
   839F 4E            [ 7] 3084 	ld	c,(hl)
   83A0 3E 02         [ 7] 3085 	ld	a,#0x02
   83A2 91            [ 4] 3086 	sub	a, c
   83A3 38 4F         [12] 3087 	jr	C,00165$
                           3088 ;src/main.c:583: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   83A5 DD 6E F9      [19] 3089 	ld	l,-7 (ix)
   83A8 DD 66 FA      [19] 3090 	ld	h,-6 (ix)
   83AB 7E            [ 7] 3091 	ld	a,(hl)
   83AC C6 0B         [ 7] 3092 	add	a, #0x0B
   83AE 4F            [ 4] 3093 	ld	c,a
   83AF DD 6E F7      [19] 3094 	ld	l,-9 (ix)
   83B2 DD 66 F8      [19] 3095 	ld	h,-8 (ix)
   83B5 46            [ 7] 3096 	ld	b,(hl)
   83B6 05            [ 4] 3097 	dec	b
   83B7 79            [ 4] 3098 	ld	a,c
   83B8 F5            [11] 3099 	push	af
   83B9 33            [ 6] 3100 	inc	sp
   83BA C5            [11] 3101 	push	bc
   83BB 33            [ 6] 3102 	inc	sp
   83BC CD 7E 73      [17] 3103 	call	_getTilePtr
   83BF F1            [10] 3104 	pop	af
   83C0 4E            [ 7] 3105 	ld	c,(hl)
   83C1 3E 02         [ 7] 3106 	ld	a,#0x02
   83C3 91            [ 4] 3107 	sub	a, c
   83C4 38 2E         [12] 3108 	jr	C,00165$
                           3109 ;src/main.c:584: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   83C6 DD 6E F9      [19] 3110 	ld	l,-7 (ix)
   83C9 DD 66 FA      [19] 3111 	ld	h,-6 (ix)
   83CC 7E            [ 7] 3112 	ld	a,(hl)
   83CD C6 16         [ 7] 3113 	add	a, #0x16
   83CF 4F            [ 4] 3114 	ld	c,a
   83D0 DD 6E F7      [19] 3115 	ld	l,-9 (ix)
   83D3 DD 66 F8      [19] 3116 	ld	h,-8 (ix)
   83D6 46            [ 7] 3117 	ld	b,(hl)
   83D7 05            [ 4] 3118 	dec	b
   83D8 79            [ 4] 3119 	ld	a,c
   83D9 F5            [11] 3120 	push	af
   83DA 33            [ 6] 3121 	inc	sp
   83DB C5            [11] 3122 	push	bc
   83DC 33            [ 6] 3123 	inc	sp
   83DD CD 7E 73      [17] 3124 	call	_getTilePtr
   83E0 F1            [10] 3125 	pop	af
   83E1 4E            [ 7] 3126 	ld	c,(hl)
   83E2 3E 02         [ 7] 3127 	ld	a,#0x02
   83E4 91            [ 4] 3128 	sub	a, c
   83E5 38 0D         [12] 3129 	jr	C,00165$
                           3130 ;src/main.c:585: moverEnemigoIzquierda(enemy);
   83E7 DD 6E F7      [19] 3131 	ld	l,-9 (ix)
   83EA DD 66 F8      [19] 3132 	ld	h,-8 (ix)
   83ED E5            [11] 3133 	push	hl
   83EE CD D7 7A      [17] 3134 	call	_moverEnemigoIzquierda
   83F1 F1            [10] 3135 	pop	af
   83F2 18 76         [12] 3136 	jr	00189$
   83F4                    3137 00165$:
                           3138 ;src/main.c:587: moverEnemigoDerecha(enemy);
   83F4 DD 6E F7      [19] 3139 	ld	l,-9 (ix)
   83F7 DD 66 F8      [19] 3140 	ld	h,-8 (ix)
   83FA E5            [11] 3141 	push	hl
   83FB CD C7 7A      [17] 3142 	call	_moverEnemigoDerecha
   83FE F1            [10] 3143 	pop	af
   83FF 18 69         [12] 3144 	jr	00189$
   8401                    3145 00175$:
                           3146 ;src/main.c:590: if(*getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   8401 79            [ 4] 3147 	ld	a,c
   8402 C6 05         [ 7] 3148 	add	a, #0x05
   8404 47            [ 4] 3149 	ld	b,a
   8405 7B            [ 4] 3150 	ld	a,e
   8406 F5            [11] 3151 	push	af
   8407 33            [ 6] 3152 	inc	sp
   8408 C5            [11] 3153 	push	bc
   8409 33            [ 6] 3154 	inc	sp
   840A CD 7E 73      [17] 3155 	call	_getTilePtr
   840D F1            [10] 3156 	pop	af
   840E 4E            [ 7] 3157 	ld	c,(hl)
   840F 3E 02         [ 7] 3158 	ld	a,#0x02
   8411 91            [ 4] 3159 	sub	a, c
   8412 38 4B         [12] 3160 	jr	C,00170$
                           3161 ;src/main.c:591: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   8414 DD 6E F9      [19] 3162 	ld	l,-7 (ix)
   8417 DD 66 FA      [19] 3163 	ld	h,-6 (ix)
   841A 7E            [ 7] 3164 	ld	a,(hl)
   841B C6 0B         [ 7] 3165 	add	a, #0x0B
   841D 47            [ 4] 3166 	ld	b,a
   841E DD 6E F7      [19] 3167 	ld	l,-9 (ix)
   8421 DD 66 F8      [19] 3168 	ld	h,-8 (ix)
   8424 7E            [ 7] 3169 	ld	a,(hl)
   8425 C6 05         [ 7] 3170 	add	a, #0x05
   8427 4F            [ 4] 3171 	ld	c,a
   8428 C5            [11] 3172 	push	bc
   8429 CD 7E 73      [17] 3173 	call	_getTilePtr
   842C F1            [10] 3174 	pop	af
   842D 4E            [ 7] 3175 	ld	c,(hl)
   842E 3E 02         [ 7] 3176 	ld	a,#0x02
   8430 91            [ 4] 3177 	sub	a, c
   8431 38 2C         [12] 3178 	jr	C,00170$
                           3179 ;src/main.c:592: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   8433 DD 6E F9      [19] 3180 	ld	l,-7 (ix)
   8436 DD 66 FA      [19] 3181 	ld	h,-6 (ix)
   8439 7E            [ 7] 3182 	ld	a,(hl)
   843A C6 16         [ 7] 3183 	add	a, #0x16
   843C 47            [ 4] 3184 	ld	b,a
   843D DD 6E F7      [19] 3185 	ld	l,-9 (ix)
   8440 DD 66 F8      [19] 3186 	ld	h,-8 (ix)
   8443 7E            [ 7] 3187 	ld	a,(hl)
   8444 C6 05         [ 7] 3188 	add	a, #0x05
   8446 4F            [ 4] 3189 	ld	c,a
   8447 C5            [11] 3190 	push	bc
   8448 CD 7E 73      [17] 3191 	call	_getTilePtr
   844B F1            [10] 3192 	pop	af
   844C 4E            [ 7] 3193 	ld	c,(hl)
   844D 3E 02         [ 7] 3194 	ld	a,#0x02
   844F 91            [ 4] 3195 	sub	a, c
   8450 38 0D         [12] 3196 	jr	C,00170$
                           3197 ;src/main.c:593: moverEnemigoDerecha(enemy);
   8452 DD 6E F7      [19] 3198 	ld	l,-9 (ix)
   8455 DD 66 F8      [19] 3199 	ld	h,-8 (ix)
   8458 E5            [11] 3200 	push	hl
   8459 CD C7 7A      [17] 3201 	call	_moverEnemigoDerecha
   845C F1            [10] 3202 	pop	af
   845D 18 0B         [12] 3203 	jr	00189$
   845F                    3204 00170$:
                           3205 ;src/main.c:596: moverEnemigoIzquierda(enemy);
   845F DD 6E F7      [19] 3206 	ld	l,-9 (ix)
   8462 DD 66 F8      [19] 3207 	ld	h,-8 (ix)
   8465 E5            [11] 3208 	push	hl
   8466 CD D7 7A      [17] 3209 	call	_moverEnemigoIzquierda
   8469 F1            [10] 3210 	pop	af
   846A                    3211 00189$:
   846A DD F9         [10] 3212 	ld	sp, ix
   846C DD E1         [14] 3213 	pop	ix
   846E C9            [10] 3214 	ret
                           3215 ;src/main.c:605: void updateEnemies() {
                           3216 ;	---------------------------------
                           3217 ; Function updateEnemies
                           3218 ; ---------------------------------
   846F                    3219 _updateEnemies::
   846F DD E5         [15] 3220 	push	ix
   8471 DD 21 00 00   [14] 3221 	ld	ix,#0
   8475 DD 39         [15] 3222 	add	ix,sp
   8477 21 FA FF      [10] 3223 	ld	hl,#-6
   847A 39            [11] 3224 	add	hl,sp
   847B F9            [ 6] 3225 	ld	sp,hl
                           3226 ;src/main.c:607: u8 i = 1 + 1;
   847C DD 36 FA 02   [19] 3227 	ld	-6 (ix),#0x02
                           3228 ;src/main.c:610: actual = enemy;
                           3229 ;src/main.c:612: while (--i) {
   8480 DD 36 FD C6   [19] 3230 	ld	-3 (ix),#<(_enemy)
   8484 DD 36 FE 64   [19] 3231 	ld	-2 (ix),#>(_enemy)
   8488 DD 36 FB C6   [19] 3232 	ld	-5 (ix),#<(_enemy)
   848C DD 36 FC 64   [19] 3233 	ld	-4 (ix),#>(_enemy)
   8490                    3234 00121$:
   8490 DD 7E FA      [19] 3235 	ld	a,-6 (ix)
   8493 C6 FF         [ 7] 3236 	add	a,#0xFF
   8495 DD 77 FF      [19] 3237 	ld	-1 (ix), a
   8498 DD 77 FA      [19] 3238 	ld	-6 (ix),a
   849B DD 7E FF      [19] 3239 	ld	a,-1 (ix)
   849E B7            [ 4] 3240 	or	a, a
   849F CA 2C 85      [10] 3241 	jp	Z,00124$
                           3242 ;src/main.c:614: actual->inRange = 1;
   84A2 21 D7 64      [10] 3243 	ld	hl,#(_enemy + 0x0011)
   84A5 36 01         [10] 3244 	ld	(hl),#0x01
                           3245 ;src/main.c:615: actual->seen = 1;
   84A7 21 D8 64      [10] 3246 	ld	hl,#(_enemy + 0x0012)
   84AA 36 01         [10] 3247 	ld	(hl),#0x01
                           3248 ;src/main.c:616: if (actual->patrolling) { // esta patrullando
   84AC 3A D1 64      [13] 3249 	ld	a, (#(_enemy + 0x000b) + 0)
   84AF B7            [ 4] 3250 	or	a, a
   84B0 28 51         [12] 3251 	jr	Z,00119$
                           3252 ;src/main.c:617: if (!actual->seen && !actual->inRange) {
   84B2 21 D8 64      [10] 3253 	ld	hl, #(_enemy + 0x0012) + 0
   84B5 4E            [ 7] 3254 	ld	c,(hl)
   84B6 21 D7 64      [10] 3255 	ld	hl, #(_enemy + 0x0011) + 0
   84B9 46            [ 7] 3256 	ld	b,(hl)
   84BA 79            [ 4] 3257 	ld	a,c
   84BB B7            [ 4] 3258 	or	a,a
   84BC 20 0D         [12] 3259 	jr	NZ,00107$
   84BE B0            [ 4] 3260 	or	a,b
   84BF 20 0A         [12] 3261 	jr	NZ,00107$
                           3262 ;src/main.c:618: patrol(actual);
   84C1 21 C6 64      [10] 3263 	ld	hl,#_enemy
   84C4 E5            [11] 3264 	push	hl
   84C5 CD 17 7E      [17] 3265 	call	_patrol
   84C8 F1            [10] 3266 	pop	af
   84C9 18 C5         [12] 3267 	jr	00121$
   84CB                    3268 00107$:
                           3269 ;src/main.c:622: actual->onPathPatrol = 0;
   84CB 11 D2 64      [10] 3270 	ld	de,#_enemy + 12
                           3271 ;src/main.c:619: }else if (actual->inRange) {
   84CE 78            [ 4] 3272 	ld	a,b
   84CF B7            [ 4] 3273 	or	a, a
   84D0 28 1A         [12] 3274 	jr	Z,00104$
                           3275 ;src/main.c:620: engage(actual, prota.x, prota.y);
   84D2 3A D7 69      [13] 3276 	ld	a, (#_prota + 1)
   84D5 21 D6 69      [10] 3277 	ld	hl, #_prota + 0
   84D8 46            [ 7] 3278 	ld	b,(hl)
   84D9 D5            [11] 3279 	push	de
   84DA F5            [11] 3280 	push	af
   84DB 33            [ 6] 3281 	inc	sp
   84DC C5            [11] 3282 	push	bc
   84DD 33            [ 6] 3283 	inc	sp
   84DE 21 C6 64      [10] 3284 	ld	hl,#_enemy
   84E1 E5            [11] 3285 	push	hl
   84E2 CD 33 7E      [17] 3286 	call	_engage
   84E5 F1            [10] 3287 	pop	af
   84E6 F1            [10] 3288 	pop	af
   84E7 D1            [10] 3289 	pop	de
                           3290 ;src/main.c:622: actual->onPathPatrol = 0;
   84E8 AF            [ 4] 3291 	xor	a, a
   84E9 12            [ 7] 3292 	ld	(de),a
   84EA 18 A4         [12] 3293 	jr	00121$
   84EC                    3294 00104$:
                           3295 ;src/main.c:623: } else if (actual->seen) {
   84EC 79            [ 4] 3296 	ld	a,c
   84ED B7            [ 4] 3297 	or	a, a
   84EE 28 A0         [12] 3298 	jr	Z,00121$
                           3299 ;src/main.c:626: actual->iter=0;
   84F0 21 D5 64      [10] 3300 	ld	hl,#(_enemy + 0x000f)
   84F3 36 00         [10] 3301 	ld	(hl),#0x00
                           3302 ;src/main.c:627: actual->reversePatrol = NO;
   84F5 21 D3 64      [10] 3303 	ld	hl,#(_enemy + 0x000d)
   84F8 36 00         [10] 3304 	ld	(hl),#0x00
                           3305 ;src/main.c:628: actual->patrolling = 0;
   84FA 21 D1 64      [10] 3306 	ld	hl,#(_enemy + 0x000b)
   84FD 36 00         [10] 3307 	ld	(hl),#0x00
                           3308 ;src/main.c:629: actual->onPathPatrol = 0;
   84FF AF            [ 4] 3309 	xor	a, a
   8500 12            [ 7] 3310 	ld	(de),a
   8501 18 8D         [12] 3311 	jr	00121$
   8503                    3312 00119$:
                           3313 ;src/main.c:631: } else if (actual->seek) { // esta buscando
   8503 DD 6E FD      [19] 3314 	ld	l,-3 (ix)
   8506 DD 66 FE      [19] 3315 	ld	h,-2 (ix)
   8509 11 14 00      [10] 3316 	ld	de, #0x0014
   850C 19            [11] 3317 	add	hl, de
   850D 7E            [ 7] 3318 	ld	a,(hl)
   850E B7            [ 4] 3319 	or	a, a
   850F CA 90 84      [10] 3320 	jp	Z,00121$
                           3321 ;src/main.c:632: if (!actual->found /*&& actual->seekTimer <= 5*/) {
   8512 DD 6E FB      [19] 3322 	ld	l,-5 (ix)
   8515 DD 66 FC      [19] 3323 	ld	h,-4 (ix)
   8518 11 13 00      [10] 3324 	ld	de, #0x0013
   851B 19            [11] 3325 	add	hl, de
   851C 7E            [ 7] 3326 	ld	a,(hl)
   851D B7            [ 4] 3327 	or	a, a
   851E C2 90 84      [10] 3328 	jp	NZ,00121$
                           3329 ;src/main.c:633: seek(actual); // buscar en posiciones cercanas a la actual
   8521 21 C6 64      [10] 3330 	ld	hl,#_enemy
   8524 E5            [11] 3331 	push	hl
   8525 CD 29 7E      [17] 3332 	call	_seek
   8528 F1            [10] 3333 	pop	af
   8529 C3 90 84      [10] 3334 	jp	00121$
                           3335 ;src/main.c:636: } else if (actual->engage) {
   852C                    3336 00124$:
   852C DD F9         [10] 3337 	ld	sp, ix
   852E DD E1         [14] 3338 	pop	ix
   8530 C9            [10] 3339 	ret
                           3340 ;src/main.c:645: void avanzarMapa() {
                           3341 ;	---------------------------------
                           3342 ; Function avanzarMapa
                           3343 ; ---------------------------------
   8531                    3344 _avanzarMapa::
                           3345 ;src/main.c:646: if(num_mapa < NUM_MAPAS -1) {
   8531 3A EB 69      [13] 3346 	ld	a,(#_num_mapa + 0)
   8534 D6 02         [ 7] 3347 	sub	a, #0x02
   8536 D2 33 73      [10] 3348 	jp	NC,_menuFin
                           3349 ;src/main.c:647: mapa = mapas[++num_mapa];
   8539 21 EB 69      [10] 3350 	ld	hl, #_num_mapa+0
   853C 34            [11] 3351 	inc	(hl)
   853D FD 21 EB 69   [14] 3352 	ld	iy,#_num_mapa
   8541 FD 6E 00      [19] 3353 	ld	l,0 (iy)
   8544 26 00         [ 7] 3354 	ld	h,#0x00
   8546 29            [11] 3355 	add	hl, hl
   8547 11 89 72      [10] 3356 	ld	de,#_mapas
   854A 19            [11] 3357 	add	hl,de
   854B 7E            [ 7] 3358 	ld	a,(hl)
   854C FD 21 E9 69   [14] 3359 	ld	iy,#_mapa
   8550 FD 77 00      [19] 3360 	ld	0 (iy),a
   8553 23            [ 6] 3361 	inc	hl
   8554 7E            [ 7] 3362 	ld	a,(hl)
   8555 32 EA 69      [13] 3363 	ld	(#_mapa + 1),a
                           3364 ;src/main.c:648: prota.x = prota.px = 2;
   8558 21 D8 69      [10] 3365 	ld	hl,#(_prota + 0x0002)
   855B 36 02         [10] 3366 	ld	(hl),#0x02
   855D 21 D6 69      [10] 3367 	ld	hl,#_prota
   8560 36 02         [10] 3368 	ld	(hl),#0x02
                           3369 ;src/main.c:649: prota.mover = SI;
   8562 21 DC 69      [10] 3370 	ld	hl,#(_prota + 0x0006)
   8565 36 01         [10] 3371 	ld	(hl),#0x01
                           3372 ;src/main.c:650: dibujarMapa();
   8567 CD 73 72      [17] 3373 	call	_dibujarMapa
                           3374 ;src/main.c:651: inicializarEnemy();
   856A C3 51 8B      [10] 3375 	jp  _inicializarEnemy
                           3376 ;src/main.c:655: menuFin();
   856D C3 33 73      [10] 3377 	jp  _menuFin
                           3378 ;src/main.c:659: void moverIzquierda() {
                           3379 ;	---------------------------------
                           3380 ; Function moverIzquierda
                           3381 ; ---------------------------------
   8570                    3382 _moverIzquierda::
                           3383 ;src/main.c:660: prota.mira = M_izquierda;
   8570 01 D6 69      [10] 3384 	ld	bc,#_prota+0
   8573 21 DD 69      [10] 3385 	ld	hl,#(_prota + 0x0007)
   8576 36 01         [10] 3386 	ld	(hl),#0x01
                           3387 ;src/main.c:661: if (!checkCollision(M_izquierda)) {
   8578 C5            [11] 3388 	push	bc
   8579 21 01 00      [10] 3389 	ld	hl,#0x0001
   857C E5            [11] 3390 	push	hl
   857D CD BF 73      [17] 3391 	call	_checkCollision
   8580 F1            [10] 3392 	pop	af
   8581 C1            [10] 3393 	pop	bc
   8582 7D            [ 4] 3394 	ld	a,l
   8583 B7            [ 4] 3395 	or	a, a
   8584 C0            [11] 3396 	ret	NZ
                           3397 ;src/main.c:662: prota.x--;
   8585 0A            [ 7] 3398 	ld	a,(bc)
   8586 C6 FF         [ 7] 3399 	add	a,#0xFF
   8588 02            [ 7] 3400 	ld	(bc),a
                           3401 ;src/main.c:663: prota.mover = SI;
   8589 21 DC 69      [10] 3402 	ld	hl,#(_prota + 0x0006)
   858C 36 01         [10] 3403 	ld	(hl),#0x01
                           3404 ;src/main.c:664: prota.sprite = g_hero_left;
   858E 21 FE 49      [10] 3405 	ld	hl,#_g_hero_left
   8591 22 DA 69      [16] 3406 	ld	((_prota + 0x0004)), hl
   8594 C9            [10] 3407 	ret
                           3408 ;src/main.c:668: void moverDerecha() {
                           3409 ;	---------------------------------
                           3410 ; Function moverDerecha
                           3411 ; ---------------------------------
   8595                    3412 _moverDerecha::
                           3413 ;src/main.c:669: prota.mira = M_derecha;
   8595 21 DD 69      [10] 3414 	ld	hl,#(_prota + 0x0007)
   8598 36 00         [10] 3415 	ld	(hl),#0x00
                           3416 ;src/main.c:670: if (!checkCollision(M_derecha) && (prota.x + G_HERO_W < 80)) {
   859A 21 00 00      [10] 3417 	ld	hl,#0x0000
   859D E5            [11] 3418 	push	hl
   859E CD BF 73      [17] 3419 	call	_checkCollision
   85A1 F1            [10] 3420 	pop	af
   85A2 45            [ 4] 3421 	ld	b,l
   85A3 21 D6 69      [10] 3422 	ld	hl, #_prota + 0
   85A6 4E            [ 7] 3423 	ld	c,(hl)
   85A7 59            [ 4] 3424 	ld	e,c
   85A8 16 00         [ 7] 3425 	ld	d,#0x00
   85AA 21 07 00      [10] 3426 	ld	hl,#0x0007
   85AD 19            [11] 3427 	add	hl,de
   85AE 11 50 80      [10] 3428 	ld	de, #0x8050
   85B1 29            [11] 3429 	add	hl, hl
   85B2 3F            [ 4] 3430 	ccf
   85B3 CB 1C         [ 8] 3431 	rr	h
   85B5 CB 1D         [ 8] 3432 	rr	l
   85B7 ED 52         [15] 3433 	sbc	hl, de
   85B9 3E 00         [ 7] 3434 	ld	a,#0x00
   85BB 17            [ 4] 3435 	rla
   85BC 5F            [ 4] 3436 	ld	e,a
   85BD 78            [ 4] 3437 	ld	a,b
   85BE B7            [ 4] 3438 	or	a,a
   85BF 20 14         [12] 3439 	jr	NZ,00104$
   85C1 B3            [ 4] 3440 	or	a,e
   85C2 28 11         [12] 3441 	jr	Z,00104$
                           3442 ;src/main.c:671: prota.x++;
   85C4 0C            [ 4] 3443 	inc	c
   85C5 21 D6 69      [10] 3444 	ld	hl,#_prota
   85C8 71            [ 7] 3445 	ld	(hl),c
                           3446 ;src/main.c:672: prota.mover = SI;
   85C9 21 DC 69      [10] 3447 	ld	hl,#(_prota + 0x0006)
   85CC 36 01         [10] 3448 	ld	(hl),#0x01
                           3449 ;src/main.c:673: prota.sprite = g_hero;
   85CE 21 A8 4A      [10] 3450 	ld	hl,#_g_hero
   85D1 22 DA 69      [16] 3451 	ld	((_prota + 0x0004)), hl
   85D4 C9            [10] 3452 	ret
   85D5                    3453 00104$:
                           3454 ;src/main.c:675: }else if( prota.x + G_HERO_W >= 80){
   85D5 7B            [ 4] 3455 	ld	a,e
   85D6 B7            [ 4] 3456 	or	a, a
   85D7 C0            [11] 3457 	ret	NZ
                           3458 ;src/main.c:676: avanzarMapa();
   85D8 C3 31 85      [10] 3459 	jp  _avanzarMapa
                           3460 ;src/main.c:680: void moverArriba() {
                           3461 ;	---------------------------------
                           3462 ; Function moverArriba
                           3463 ; ---------------------------------
   85DB                    3464 _moverArriba::
                           3465 ;src/main.c:681: prota.mira = M_arriba;
   85DB 21 DD 69      [10] 3466 	ld	hl,#(_prota + 0x0007)
   85DE 36 02         [10] 3467 	ld	(hl),#0x02
                           3468 ;src/main.c:682: if (!checkCollision(M_arriba)) { // TODO: COMPROBAR
   85E0 21 02 00      [10] 3469 	ld	hl,#0x0002
   85E3 E5            [11] 3470 	push	hl
   85E4 CD BF 73      [17] 3471 	call	_checkCollision
   85E7 F1            [10] 3472 	pop	af
   85E8 7D            [ 4] 3473 	ld	a,l
   85E9 B7            [ 4] 3474 	or	a, a
   85EA C0            [11] 3475 	ret	NZ
                           3476 ;src/main.c:683: prota.y--;
   85EB 21 D7 69      [10] 3477 	ld	hl,#_prota + 1
   85EE 4E            [ 7] 3478 	ld	c,(hl)
   85EF 0D            [ 4] 3479 	dec	c
   85F0 71            [ 7] 3480 	ld	(hl),c
                           3481 ;src/main.c:684: prota.y--;
   85F1 0D            [ 4] 3482 	dec	c
   85F2 71            [ 7] 3483 	ld	(hl),c
                           3484 ;src/main.c:685: prota.mover  = SI;
   85F3 21 DC 69      [10] 3485 	ld	hl,#(_prota + 0x0006)
   85F6 36 01         [10] 3486 	ld	(hl),#0x01
                           3487 ;src/main.c:686: prota.sprite = g_hero_up;
   85F8 21 64 49      [10] 3488 	ld	hl,#_g_hero_up
   85FB 22 DA 69      [16] 3489 	ld	((_prota + 0x0004)), hl
   85FE C9            [10] 3490 	ret
                           3491 ;src/main.c:690: void moverAbajo() {
                           3492 ;	---------------------------------
                           3493 ; Function moverAbajo
                           3494 ; ---------------------------------
   85FF                    3495 _moverAbajo::
                           3496 ;src/main.c:691: prota.mira = M_abajo;
   85FF 21 DD 69      [10] 3497 	ld	hl,#(_prota + 0x0007)
   8602 36 03         [10] 3498 	ld	(hl),#0x03
                           3499 ;src/main.c:692: if (!checkCollision(M_abajo) ) { // TODO: COMPROBAR
   8604 21 03 00      [10] 3500 	ld	hl,#0x0003
   8607 E5            [11] 3501 	push	hl
   8608 CD BF 73      [17] 3502 	call	_checkCollision
   860B F1            [10] 3503 	pop	af
   860C 7D            [ 4] 3504 	ld	a,l
   860D B7            [ 4] 3505 	or	a, a
   860E C0            [11] 3506 	ret	NZ
                           3507 ;src/main.c:693: prota.y++;
   860F 01 D7 69      [10] 3508 	ld	bc,#_prota + 1
   8612 0A            [ 7] 3509 	ld	a,(bc)
   8613 3C            [ 4] 3510 	inc	a
   8614 02            [ 7] 3511 	ld	(bc),a
                           3512 ;src/main.c:694: prota.y++;
   8615 3C            [ 4] 3513 	inc	a
   8616 02            [ 7] 3514 	ld	(bc),a
                           3515 ;src/main.c:695: prota.mover  = SI;
   8617 21 DC 69      [10] 3516 	ld	hl,#(_prota + 0x0006)
   861A 36 01         [10] 3517 	ld	(hl),#0x01
                           3518 ;src/main.c:696: prota.sprite = g_hero_down;
   861C 21 CA 48      [10] 3519 	ld	hl,#_g_hero_down
   861F 22 DA 69      [16] 3520 	ld	((_prota + 0x0004)), hl
   8622 C9            [10] 3521 	ret
                           3522 ;src/main.c:700: void dibujarCuchillo() {
                           3523 ;	---------------------------------
                           3524 ; Function dibujarCuchillo
                           3525 ; ---------------------------------
   8623                    3526 _dibujarCuchillo::
   8623 DD E5         [15] 3527 	push	ix
   8625 DD 21 00 00   [14] 3528 	ld	ix,#0
   8629 DD 39         [15] 3529 	add	ix,sp
   862B F5            [11] 3530 	push	af
                           3531 ;src/main.c:701: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   862C 21 DF 69      [10] 3532 	ld	hl, #_cu + 1
   862F 56            [ 7] 3533 	ld	d,(hl)
   8630 21 DE 69      [10] 3534 	ld	hl, #_cu + 0
   8633 46            [ 7] 3535 	ld	b,(hl)
   8634 D5            [11] 3536 	push	de
   8635 33            [ 6] 3537 	inc	sp
   8636 C5            [11] 3538 	push	bc
   8637 33            [ 6] 3539 	inc	sp
   8638 21 00 C0      [10] 3540 	ld	hl,#0xC000
   863B E5            [11] 3541 	push	hl
   863C CD 69 64      [17] 3542 	call	_cpct_getScreenPtr
   863F 45            [ 4] 3543 	ld	b,l
   8640 5C            [ 4] 3544 	ld	e,h
                           3545 ;src/main.c:702: if(cu.eje == E_X){
   8641 21 E6 69      [10] 3546 	ld	hl, #_cu + 8
   8644 4E            [ 7] 3547 	ld	c,(hl)
                           3548 ;src/main.c:703: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   8645 DD 70 FE      [19] 3549 	ld	-2 (ix),b
   8648 DD 73 FF      [19] 3550 	ld	-1 (ix),e
                           3551 ;src/main.c:702: if(cu.eje == E_X){
   864B 79            [ 4] 3552 	ld	a,c
   864C B7            [ 4] 3553 	or	a, a
   864D 20 19         [12] 3554 	jr	NZ,00104$
                           3555 ;src/main.c:703: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   864F 11 00 0E      [10] 3556 	ld	de,#_g_tablatrans+0
   8652 ED 4B E2 69   [20] 3557 	ld	bc, (#(_cu + 0x0004) + 0)
   8656 D5            [11] 3558 	push	de
   8657 21 04 04      [10] 3559 	ld	hl,#0x0404
   865A E5            [11] 3560 	push	hl
   865B DD 6E FE      [19] 3561 	ld	l,-2 (ix)
   865E DD 66 FF      [19] 3562 	ld	h,-1 (ix)
   8661 E5            [11] 3563 	push	hl
   8662 C5            [11] 3564 	push	bc
   8663 CD 89 64      [17] 3565 	call	_cpct_drawSpriteMaskedAlignedTable
   8666 18 1A         [12] 3566 	jr	00106$
   8668                    3567 00104$:
                           3568 ;src/main.c:706: else if(cu.eje == E_Y){
   8668 0D            [ 4] 3569 	dec	c
   8669 20 17         [12] 3570 	jr	NZ,00106$
                           3571 ;src/main.c:707: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   866B 11 00 0E      [10] 3572 	ld	de,#_g_tablatrans+0
   866E ED 4B E2 69   [20] 3573 	ld	bc, (#(_cu + 0x0004) + 0)
   8672 D5            [11] 3574 	push	de
   8673 21 02 08      [10] 3575 	ld	hl,#0x0802
   8676 E5            [11] 3576 	push	hl
   8677 DD 6E FE      [19] 3577 	ld	l,-2 (ix)
   867A DD 66 FF      [19] 3578 	ld	h,-1 (ix)
   867D E5            [11] 3579 	push	hl
   867E C5            [11] 3580 	push	bc
   867F CD 89 64      [17] 3581 	call	_cpct_drawSpriteMaskedAlignedTable
   8682                    3582 00106$:
   8682 DD F9         [10] 3583 	ld	sp, ix
   8684 DD E1         [14] 3584 	pop	ix
   8686 C9            [10] 3585 	ret
                           3586 ;src/main.c:711: void borrarCuchillo() {
                           3587 ;	---------------------------------
                           3588 ; Function borrarCuchillo
                           3589 ; ---------------------------------
   8687                    3590 _borrarCuchillo::
   8687 DD E5         [15] 3591 	push	ix
   8689 DD 21 00 00   [14] 3592 	ld	ix,#0
   868D DD 39         [15] 3593 	add	ix,sp
   868F F5            [11] 3594 	push	af
   8690 3B            [ 6] 3595 	dec	sp
                           3596 ;src/main.c:713: u8 w = 2 + (cu.px & 1);
   8691 21 E0 69      [10] 3597 	ld	hl, #_cu + 2
   8694 4E            [ 7] 3598 	ld	c,(hl)
   8695 79            [ 4] 3599 	ld	a,c
   8696 E6 01         [ 7] 3600 	and	a, #0x01
   8698 47            [ 4] 3601 	ld	b,a
   8699 04            [ 4] 3602 	inc	b
   869A 04            [ 4] 3603 	inc	b
                           3604 ;src/main.c:714: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   869B 21 E1 69      [10] 3605 	ld	hl, #_cu + 3
   869E 5E            [ 7] 3606 	ld	e,(hl)
   869F 7B            [ 4] 3607 	ld	a,e
   86A0 E6 03         [ 7] 3608 	and	a, #0x03
   86A2 28 04         [12] 3609 	jr	Z,00105$
   86A4 3E 01         [ 7] 3610 	ld	a,#0x01
   86A6 18 02         [12] 3611 	jr	00106$
   86A8                    3612 00105$:
   86A8 3E 00         [ 7] 3613 	ld	a,#0x00
   86AA                    3614 00106$:
   86AA C6 02         [ 7] 3615 	add	a, #0x02
   86AC DD 77 FD      [19] 3616 	ld	-3 (ix),a
                           3617 ;src/main.c:715: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   86AF FD 2A E9 69   [20] 3618 	ld	iy,(_mapa)
   86B3 16 00         [ 7] 3619 	ld	d,#0x00
   86B5 7B            [ 4] 3620 	ld	a,e
   86B6 C6 E8         [ 7] 3621 	add	a,#0xE8
   86B8 DD 77 FE      [19] 3622 	ld	-2 (ix),a
   86BB 7A            [ 4] 3623 	ld	a,d
   86BC CE FF         [ 7] 3624 	adc	a,#0xFF
   86BE DD 77 FF      [19] 3625 	ld	-1 (ix),a
   86C1 DD 6E FE      [19] 3626 	ld	l,-2 (ix)
   86C4 DD 66 FF      [19] 3627 	ld	h,-1 (ix)
   86C7 DD CB FF 7E   [20] 3628 	bit	7, -1 (ix)
   86CB 28 04         [12] 3629 	jr	Z,00107$
   86CD 21 EB FF      [10] 3630 	ld	hl,#0xFFEB
   86D0 19            [11] 3631 	add	hl,de
   86D1                    3632 00107$:
   86D1 CB 2C         [ 8] 3633 	sra	h
   86D3 CB 1D         [ 8] 3634 	rr	l
   86D5 CB 2C         [ 8] 3635 	sra	h
   86D7 CB 1D         [ 8] 3636 	rr	l
   86D9 55            [ 4] 3637 	ld	d,l
   86DA CB 39         [ 8] 3638 	srl	c
   86DC FD E5         [15] 3639 	push	iy
   86DE 21 F0 C0      [10] 3640 	ld	hl,#0xC0F0
   86E1 E5            [11] 3641 	push	hl
   86E2 3E 28         [ 7] 3642 	ld	a,#0x28
   86E4 F5            [11] 3643 	push	af
   86E5 33            [ 6] 3644 	inc	sp
   86E6 DD 7E FD      [19] 3645 	ld	a,-3 (ix)
   86E9 F5            [11] 3646 	push	af
   86EA 33            [ 6] 3647 	inc	sp
   86EB C5            [11] 3648 	push	bc
   86EC 33            [ 6] 3649 	inc	sp
   86ED D5            [11] 3650 	push	de
   86EE 33            [ 6] 3651 	inc	sp
   86EF 79            [ 4] 3652 	ld	a,c
   86F0 F5            [11] 3653 	push	af
   86F1 33            [ 6] 3654 	inc	sp
   86F2 CD 62 59      [17] 3655 	call	_cpct_etm_drawTileBox2x4
                           3656 ;src/main.c:716: if(!cu.mover){
   86F5 3A E7 69      [13] 3657 	ld	a, (#_cu + 9)
   86F8 B7            [ 4] 3658 	or	a, a
   86F9 20 05         [12] 3659 	jr	NZ,00103$
                           3660 ;src/main.c:717: cu.lanzado = NO;
   86FB 21 E4 69      [10] 3661 	ld	hl,#(_cu + 0x0006)
   86FE 36 00         [10] 3662 	ld	(hl),#0x00
   8700                    3663 00103$:
   8700 DD F9         [10] 3664 	ld	sp, ix
   8702 DD E1         [14] 3665 	pop	ix
   8704 C9            [10] 3666 	ret
                           3667 ;src/main.c:721: void redibujarCuchillo( ) {
                           3668 ;	---------------------------------
                           3669 ; Function redibujarCuchillo
                           3670 ; ---------------------------------
   8705                    3671 _redibujarCuchillo::
                           3672 ;src/main.c:722: borrarCuchillo();
   8705 CD 87 86      [17] 3673 	call	_borrarCuchillo
                           3674 ;src/main.c:723: cu.px = cu.x;
   8708 01 E0 69      [10] 3675 	ld	bc,#_cu + 2
   870B 3A DE 69      [13] 3676 	ld	a, (#_cu + 0)
   870E 02            [ 7] 3677 	ld	(bc),a
                           3678 ;src/main.c:724: cu.py = cu.y;
   870F 01 E1 69      [10] 3679 	ld	bc,#_cu + 3
   8712 3A DF 69      [13] 3680 	ld	a, (#_cu + 1)
   8715 02            [ 7] 3681 	ld	(bc),a
                           3682 ;src/main.c:725: dibujarCuchillo();
   8716 C3 23 86      [10] 3683 	jp  _dibujarCuchillo
                           3684 ;src/main.c:728: void lanzarCuchillo(){
                           3685 ;	---------------------------------
                           3686 ; Function lanzarCuchillo
                           3687 ; ---------------------------------
   8719                    3688 _lanzarCuchillo::
                           3689 ;src/main.c:730: if(!cu.lanzado){
   8719 3A E4 69      [13] 3690 	ld	a, (#(_cu + 0x0006) + 0)
   871C B7            [ 4] 3691 	or	a, a
   871D C0            [11] 3692 	ret	NZ
                           3693 ;src/main.c:732: if(prota.mira == M_derecha){
   871E 21 DD 69      [10] 3694 	ld	hl, #_prota + 7
   8721 5E            [ 7] 3695 	ld	e,(hl)
                           3696 ;src/main.c:733: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   8722 01 D7 69      [10] 3697 	ld	bc,#_prota + 1
                           3698 ;src/main.c:735: cu.direccion = M_derecha;
                           3699 ;src/main.c:737: cu.y=prota.y + G_HERO_H /2;
                           3700 ;src/main.c:738: cu.sprite=g_knifeX_0;
                           3701 ;src/main.c:739: cu.eje = E_X;
                           3702 ;src/main.c:732: if(prota.mira == M_derecha){
   8725 7B            [ 4] 3703 	ld	a,e
   8726 B7            [ 4] 3704 	or	a, a
   8727 20 41         [12] 3705 	jr	NZ,00118$
                           3706 ;src/main.c:733: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   8729 0A            [ 7] 3707 	ld	a,(bc)
   872A C6 0B         [ 7] 3708 	add	a, #0x0B
   872C 5F            [ 4] 3709 	ld	e,a
   872D 3A D6 69      [13] 3710 	ld	a, (#_prota + 0)
   8730 C6 0C         [ 7] 3711 	add	a, #0x0C
   8732 6F            [ 4] 3712 	ld	l,a
   8733 C5            [11] 3713 	push	bc
   8734 7B            [ 4] 3714 	ld	a,e
   8735 F5            [11] 3715 	push	af
   8736 33            [ 6] 3716 	inc	sp
   8737 7D            [ 4] 3717 	ld	a,l
   8738 F5            [11] 3718 	push	af
   8739 33            [ 6] 3719 	inc	sp
   873A CD 7E 73      [17] 3720 	call	_getTilePtr
   873D F1            [10] 3721 	pop	af
   873E C1            [10] 3722 	pop	bc
   873F 5E            [ 7] 3723 	ld	e,(hl)
   8740 3E 02         [ 7] 3724 	ld	a,#0x02
   8742 93            [ 4] 3725 	sub	a, e
   8743 D8            [11] 3726 	ret	C
                           3727 ;src/main.c:734: cu.lanzado = SI;
   8744 21 E4 69      [10] 3728 	ld	hl,#(_cu + 0x0006)
   8747 36 01         [10] 3729 	ld	(hl),#0x01
                           3730 ;src/main.c:735: cu.direccion = M_derecha;
   8749 21 E5 69      [10] 3731 	ld	hl,#(_cu + 0x0007)
   874C 36 00         [10] 3732 	ld	(hl),#0x00
                           3733 ;src/main.c:736: cu.x=prota.x + G_HERO_W;
   874E 3A D6 69      [13] 3734 	ld	a, (#_prota + 0)
   8751 C6 07         [ 7] 3735 	add	a, #0x07
   8753 32 DE 69      [13] 3736 	ld	(#_cu),a
                           3737 ;src/main.c:737: cu.y=prota.y + G_HERO_H /2;
   8756 0A            [ 7] 3738 	ld	a,(bc)
   8757 C6 0B         [ 7] 3739 	add	a, #0x0B
   8759 32 DF 69      [13] 3740 	ld	(#(_cu + 0x0001)),a
                           3741 ;src/main.c:738: cu.sprite=g_knifeX_0;
   875C 21 C0 24      [10] 3742 	ld	hl,#_g_knifeX_0
   875F 22 E2 69      [16] 3743 	ld	((_cu + 0x0004)), hl
                           3744 ;src/main.c:739: cu.eje = E_X;
   8762 21 E6 69      [10] 3745 	ld	hl,#(_cu + 0x0008)
   8765 36 00         [10] 3746 	ld	(hl),#0x00
                           3747 ;src/main.c:740: dibujarCuchillo();
   8767 C3 23 86      [10] 3748 	jp  _dibujarCuchillo
   876A                    3749 00118$:
                           3750 ;src/main.c:743: else if(prota.mira == M_izquierda){
   876A 7B            [ 4] 3751 	ld	a,e
   876B 3D            [ 4] 3752 	dec	a
   876C 20 41         [12] 3753 	jr	NZ,00115$
                           3754 ;src/main.c:744: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   876E 0A            [ 7] 3755 	ld	a,(bc)
   876F C6 0B         [ 7] 3756 	add	a, #0x0B
   8771 5F            [ 4] 3757 	ld	e,a
   8772 3A D6 69      [13] 3758 	ld	a, (#_prota + 0)
   8775 C6 F6         [ 7] 3759 	add	a,#0xF6
   8777 6F            [ 4] 3760 	ld	l,a
   8778 C5            [11] 3761 	push	bc
   8779 7B            [ 4] 3762 	ld	a,e
   877A F5            [11] 3763 	push	af
   877B 33            [ 6] 3764 	inc	sp
   877C 7D            [ 4] 3765 	ld	a,l
   877D F5            [11] 3766 	push	af
   877E 33            [ 6] 3767 	inc	sp
   877F CD 7E 73      [17] 3768 	call	_getTilePtr
   8782 F1            [10] 3769 	pop	af
   8783 C1            [10] 3770 	pop	bc
   8784 5E            [ 7] 3771 	ld	e,(hl)
   8785 3E 02         [ 7] 3772 	ld	a,#0x02
   8787 93            [ 4] 3773 	sub	a, e
   8788 D8            [11] 3774 	ret	C
                           3775 ;src/main.c:745: cu.lanzado = SI;
   8789 21 E4 69      [10] 3776 	ld	hl,#(_cu + 0x0006)
   878C 36 01         [10] 3777 	ld	(hl),#0x01
                           3778 ;src/main.c:746: cu.direccion = M_izquierda;
   878E 21 E5 69      [10] 3779 	ld	hl,#(_cu + 0x0007)
   8791 36 01         [10] 3780 	ld	(hl),#0x01
                           3781 ;src/main.c:747: cu.x = prota.x - G_KNIFEX_0_W;
   8793 3A D6 69      [13] 3782 	ld	a, (#_prota + 0)
   8796 C6 FC         [ 7] 3783 	add	a,#0xFC
   8798 32 DE 69      [13] 3784 	ld	(#_cu),a
                           3785 ;src/main.c:748: cu.y = prota.y + G_HERO_H /2;
   879B 0A            [ 7] 3786 	ld	a,(bc)
   879C C6 0B         [ 7] 3787 	add	a, #0x0B
   879E 32 DF 69      [13] 3788 	ld	(#(_cu + 0x0001)),a
                           3789 ;src/main.c:749: cu.sprite = g_knifeX_1;
   87A1 21 D0 24      [10] 3790 	ld	hl,#_g_knifeX_1
   87A4 22 E2 69      [16] 3791 	ld	((_cu + 0x0004)), hl
                           3792 ;src/main.c:750: cu.eje = E_X;
   87A7 21 E6 69      [10] 3793 	ld	hl,#(_cu + 0x0008)
   87AA 36 00         [10] 3794 	ld	(hl),#0x00
                           3795 ;src/main.c:751: dibujarCuchillo();
   87AC C3 23 86      [10] 3796 	jp  _dibujarCuchillo
   87AF                    3797 00115$:
                           3798 ;src/main.c:754: else if(prota.mira == M_abajo){
   87AF 7B            [ 4] 3799 	ld	a,e
   87B0 D6 03         [ 7] 3800 	sub	a, #0x03
   87B2 20 41         [12] 3801 	jr	NZ,00112$
                           3802 ;src/main.c:756: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   87B4 0A            [ 7] 3803 	ld	a,(bc)
   87B5 C6 1F         [ 7] 3804 	add	a, #0x1F
   87B7 5F            [ 4] 3805 	ld	e,a
   87B8 3A D6 69      [13] 3806 	ld	a, (#_prota + 0)
   87BB 57            [ 4] 3807 	ld	d,a
   87BC 14            [ 4] 3808 	inc	d
   87BD 14            [ 4] 3809 	inc	d
   87BE 14            [ 4] 3810 	inc	d
   87BF C5            [11] 3811 	push	bc
   87C0 7B            [ 4] 3812 	ld	a,e
   87C1 F5            [11] 3813 	push	af
   87C2 33            [ 6] 3814 	inc	sp
   87C3 D5            [11] 3815 	push	de
   87C4 33            [ 6] 3816 	inc	sp
   87C5 CD 7E 73      [17] 3817 	call	_getTilePtr
   87C8 F1            [10] 3818 	pop	af
   87C9 C1            [10] 3819 	pop	bc
   87CA 5E            [ 7] 3820 	ld	e,(hl)
   87CB 3E 02         [ 7] 3821 	ld	a,#0x02
   87CD 93            [ 4] 3822 	sub	a, e
   87CE D8            [11] 3823 	ret	C
                           3824 ;src/main.c:757: cu.lanzado = SI;
   87CF 21 E4 69      [10] 3825 	ld	hl,#(_cu + 0x0006)
   87D2 36 01         [10] 3826 	ld	(hl),#0x01
                           3827 ;src/main.c:758: cu.direccion = M_abajo;
   87D4 21 E5 69      [10] 3828 	ld	hl,#(_cu + 0x0007)
   87D7 36 03         [10] 3829 	ld	(hl),#0x03
                           3830 ;src/main.c:759: cu.x = prota.x + G_HERO_W / 2;
   87D9 3A D6 69      [13] 3831 	ld	a, (#_prota + 0)
   87DC C6 03         [ 7] 3832 	add	a, #0x03
   87DE 32 DE 69      [13] 3833 	ld	(#_cu),a
                           3834 ;src/main.c:760: cu.y = prota.y + G_HERO_H;
   87E1 0A            [ 7] 3835 	ld	a,(bc)
   87E2 C6 16         [ 7] 3836 	add	a, #0x16
   87E4 32 DF 69      [13] 3837 	ld	(#(_cu + 0x0001)),a
                           3838 ;src/main.c:761: cu.sprite = g_knifeY_0;
   87E7 21 A0 24      [10] 3839 	ld	hl,#_g_knifeY_0
   87EA 22 E2 69      [16] 3840 	ld	((_cu + 0x0004)), hl
                           3841 ;src/main.c:762: cu.eje = E_Y;
   87ED 21 E6 69      [10] 3842 	ld	hl,#(_cu + 0x0008)
   87F0 36 01         [10] 3843 	ld	(hl),#0x01
                           3844 ;src/main.c:763: dibujarCuchillo();
   87F2 C3 23 86      [10] 3845 	jp  _dibujarCuchillo
   87F5                    3846 00112$:
                           3847 ;src/main.c:766: else if(prota.mira == M_arriba){
   87F5 7B            [ 4] 3848 	ld	a,e
   87F6 D6 02         [ 7] 3849 	sub	a, #0x02
   87F8 C0            [11] 3850 	ret	NZ
                           3851 ;src/main.c:767: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   87F9 0A            [ 7] 3852 	ld	a,(bc)
   87FA C6 F7         [ 7] 3853 	add	a,#0xF7
   87FC 57            [ 4] 3854 	ld	d,a
   87FD 3A D6 69      [13] 3855 	ld	a, (#_prota + 0)
   8800 C6 03         [ 7] 3856 	add	a, #0x03
   8802 C5            [11] 3857 	push	bc
   8803 D5            [11] 3858 	push	de
   8804 33            [ 6] 3859 	inc	sp
   8805 F5            [11] 3860 	push	af
   8806 33            [ 6] 3861 	inc	sp
   8807 CD 7E 73      [17] 3862 	call	_getTilePtr
   880A F1            [10] 3863 	pop	af
   880B C1            [10] 3864 	pop	bc
   880C 5E            [ 7] 3865 	ld	e,(hl)
   880D 3E 02         [ 7] 3866 	ld	a,#0x02
   880F 93            [ 4] 3867 	sub	a, e
   8810 D8            [11] 3868 	ret	C
                           3869 ;src/main.c:768: cu.lanzado = SI;
   8811 21 E4 69      [10] 3870 	ld	hl,#(_cu + 0x0006)
   8814 36 01         [10] 3871 	ld	(hl),#0x01
                           3872 ;src/main.c:769: cu.direccion = M_arriba;
   8816 21 E5 69      [10] 3873 	ld	hl,#(_cu + 0x0007)
   8819 36 02         [10] 3874 	ld	(hl),#0x02
                           3875 ;src/main.c:770: cu.x = prota.x + G_HERO_W / 2;
   881B 3A D6 69      [13] 3876 	ld	a, (#_prota + 0)
   881E C6 03         [ 7] 3877 	add	a, #0x03
   8820 32 DE 69      [13] 3878 	ld	(#_cu),a
                           3879 ;src/main.c:771: cu.y = prota.y;
   8823 0A            [ 7] 3880 	ld	a,(bc)
   8824 32 DF 69      [13] 3881 	ld	(#(_cu + 0x0001)),a
                           3882 ;src/main.c:772: cu.sprite = g_knifeY_1;
   8827 21 B0 24      [10] 3883 	ld	hl,#_g_knifeY_1
   882A 22 E2 69      [16] 3884 	ld	((_cu + 0x0004)), hl
                           3885 ;src/main.c:773: cu.eje = E_Y;
   882D 21 E6 69      [10] 3886 	ld	hl,#(_cu + 0x0008)
   8830 36 01         [10] 3887 	ld	(hl),#0x01
                           3888 ;src/main.c:774: dibujarCuchillo();
   8832 C3 23 86      [10] 3889 	jp  _dibujarCuchillo
                           3890 ;src/main.c:780: void comprobarTeclado() {
                           3891 ;	---------------------------------
                           3892 ; Function comprobarTeclado
                           3893 ; ---------------------------------
   8835                    3894 _comprobarTeclado::
                           3895 ;src/main.c:781: cpct_scanKeyboard_if();
   8835 CD BA 5A      [17] 3896 	call	_cpct_scanKeyboard_if
                           3897 ;src/main.c:783: if (cpct_isAnyKeyPressed()) {
   8838 CD AD 5A      [17] 3898 	call	_cpct_isAnyKeyPressed
   883B 7D            [ 4] 3899 	ld	a,l
   883C B7            [ 4] 3900 	or	a, a
   883D C8            [11] 3901 	ret	Z
                           3902 ;src/main.c:784: if (cpct_isKeyPressed(Key_CursorLeft))
   883E 21 01 01      [10] 3903 	ld	hl,#0x0101
   8841 CD 17 58      [17] 3904 	call	_cpct_isKeyPressed
   8844 7D            [ 4] 3905 	ld	a,l
   8845 B7            [ 4] 3906 	or	a, a
                           3907 ;src/main.c:785: moverIzquierda();
   8846 C2 70 85      [10] 3908 	jp	NZ,_moverIzquierda
                           3909 ;src/main.c:786: else if (cpct_isKeyPressed(Key_CursorRight))
   8849 21 00 02      [10] 3910 	ld	hl,#0x0200
   884C CD 17 58      [17] 3911 	call	_cpct_isKeyPressed
   884F 7D            [ 4] 3912 	ld	a,l
   8850 B7            [ 4] 3913 	or	a, a
                           3914 ;src/main.c:787: moverDerecha();
   8851 C2 95 85      [10] 3915 	jp	NZ,_moverDerecha
                           3916 ;src/main.c:788: else if (cpct_isKeyPressed(Key_CursorUp))
   8854 21 00 01      [10] 3917 	ld	hl,#0x0100
   8857 CD 17 58      [17] 3918 	call	_cpct_isKeyPressed
   885A 7D            [ 4] 3919 	ld	a,l
   885B B7            [ 4] 3920 	or	a, a
                           3921 ;src/main.c:789: moverArriba();
   885C C2 DB 85      [10] 3922 	jp	NZ,_moverArriba
                           3923 ;src/main.c:790: else if (cpct_isKeyPressed(Key_CursorDown))
   885F 21 00 04      [10] 3924 	ld	hl,#0x0400
   8862 CD 17 58      [17] 3925 	call	_cpct_isKeyPressed
   8865 7D            [ 4] 3926 	ld	a,l
   8866 B7            [ 4] 3927 	or	a, a
                           3928 ;src/main.c:791: moverAbajo();
   8867 C2 FF 85      [10] 3929 	jp	NZ,_moverAbajo
                           3930 ;src/main.c:792: else if (cpct_isKeyPressed(Key_Space))
   886A 21 05 80      [10] 3931 	ld	hl,#0x8005
   886D CD 17 58      [17] 3932 	call	_cpct_isKeyPressed
   8870 7D            [ 4] 3933 	ld	a,l
   8871 B7            [ 4] 3934 	or	a, a
   8872 C8            [11] 3935 	ret	Z
                           3936 ;src/main.c:793: lanzarCuchillo();
   8873 C3 19 87      [10] 3937 	jp  _lanzarCuchillo
                           3938 ;src/main.c:797: u8 checkKnifeCollision(int direction, u8 xoff, u8 yoff){
                           3939 ;	---------------------------------
                           3940 ; Function checkKnifeCollision
                           3941 ; ---------------------------------
   8876                    3942 _checkKnifeCollision::
                           3943 ;src/main.c:799: return *getTilePtr(cu.x + xoff, cu.y + yoff) <= 2;
   8876 3A DF 69      [13] 3944 	ld	a,(#_cu + 1)
   8879 21 05 00      [10] 3945 	ld	hl,#5
   887C 39            [11] 3946 	add	hl,sp
   887D 86            [ 7] 3947 	add	a, (hl)
   887E 47            [ 4] 3948 	ld	b,a
   887F 3A DE 69      [13] 3949 	ld	a,(#_cu + 0)
   8882 21 04 00      [10] 3950 	ld	hl,#4
   8885 39            [11] 3951 	add	hl,sp
   8886 86            [ 7] 3952 	add	a, (hl)
   8887 4F            [ 4] 3953 	ld	c,a
   8888 C5            [11] 3954 	push	bc
   8889 CD 7E 73      [17] 3955 	call	_getTilePtr
   888C F1            [10] 3956 	pop	af
   888D 4E            [ 7] 3957 	ld	c,(hl)
   888E 3E 02         [ 7] 3958 	ld	a,#0x02
   8890 91            [ 4] 3959 	sub	a, c
   8891 3E 00         [ 7] 3960 	ld	a,#0x00
   8893 17            [ 4] 3961 	rla
   8894 EE 01         [ 7] 3962 	xor	a, #0x01
   8896 6F            [ 4] 3963 	ld	l, a
   8897 C9            [10] 3964 	ret
                           3965 ;src/main.c:802: void moverCuchillo(){
                           3966 ;	---------------------------------
                           3967 ; Function moverCuchillo
                           3968 ; ---------------------------------
   8898                    3969 _moverCuchillo::
                           3970 ;src/main.c:803: if(cu.lanzado){
   8898 01 DE 69      [10] 3971 	ld	bc,#_cu+0
   889B 3A E4 69      [13] 3972 	ld	a, (#_cu + 6)
   889E B7            [ 4] 3973 	or	a, a
   889F C8            [11] 3974 	ret	Z
                           3975 ;src/main.c:804: cu.mover = SI;
   88A0 21 09 00      [10] 3976 	ld	hl,#0x0009
   88A3 09            [11] 3977 	add	hl,bc
   88A4 EB            [ 4] 3978 	ex	de,hl
   88A5 3E 01         [ 7] 3979 	ld	a,#0x01
   88A7 12            [ 7] 3980 	ld	(de),a
                           3981 ;src/main.c:805: if(cu.direccion == M_derecha){
   88A8 21 E5 69      [10] 3982 	ld	hl, #_cu + 7
   88AB 6E            [ 7] 3983 	ld	l,(hl)
   88AC 7D            [ 4] 3984 	ld	a,l
   88AD B7            [ 4] 3985 	or	a, a
   88AE 20 1E         [12] 3986 	jr	NZ,00122$
                           3987 ;src/main.c:807: if(checkKnifeCollision(M_derecha, G_KNIFEX_0_W + 1, 0)){
   88B0 C5            [11] 3988 	push	bc
   88B1 D5            [11] 3989 	push	de
   88B2 21 05 00      [10] 3990 	ld	hl,#0x0005
   88B5 E5            [11] 3991 	push	hl
   88B6 2E 00         [ 7] 3992 	ld	l, #0x00
   88B8 E5            [11] 3993 	push	hl
   88B9 CD 76 88      [17] 3994 	call	_checkKnifeCollision
   88BC F1            [10] 3995 	pop	af
   88BD F1            [10] 3996 	pop	af
   88BE D1            [10] 3997 	pop	de
   88BF C1            [10] 3998 	pop	bc
   88C0 7D            [ 4] 3999 	ld	a,l
   88C1 B7            [ 4] 4000 	or	a, a
   88C2 28 07         [12] 4001 	jr	Z,00102$
                           4002 ;src/main.c:808: cu.mover = SI;
   88C4 3E 01         [ 7] 4003 	ld	a,#0x01
   88C6 12            [ 7] 4004 	ld	(de),a
                           4005 ;src/main.c:809: cu.x++;
   88C7 0A            [ 7] 4006 	ld	a,(bc)
   88C8 3C            [ 4] 4007 	inc	a
   88C9 02            [ 7] 4008 	ld	(bc),a
   88CA C9            [10] 4009 	ret
   88CB                    4010 00102$:
                           4011 ;src/main.c:812: cu.mover=NO;
   88CB AF            [ 4] 4012 	xor	a, a
   88CC 12            [ 7] 4013 	ld	(de),a
   88CD C9            [10] 4014 	ret
   88CE                    4015 00122$:
                           4016 ;src/main.c:815: else if(cu.direccion == M_izquierda){
   88CE 7D            [ 4] 4017 	ld	a,l
   88CF 3D            [ 4] 4018 	dec	a
   88D0 20 1F         [12] 4019 	jr	NZ,00119$
                           4020 ;src/main.c:816: if(checkKnifeCollision(M_derecha, -1, 0)){
   88D2 C5            [11] 4021 	push	bc
   88D3 D5            [11] 4022 	push	de
   88D4 21 FF 00      [10] 4023 	ld	hl,#0x00FF
   88D7 E5            [11] 4024 	push	hl
   88D8 2E 00         [ 7] 4025 	ld	l, #0x00
   88DA E5            [11] 4026 	push	hl
   88DB CD 76 88      [17] 4027 	call	_checkKnifeCollision
   88DE F1            [10] 4028 	pop	af
   88DF F1            [10] 4029 	pop	af
   88E0 D1            [10] 4030 	pop	de
   88E1 C1            [10] 4031 	pop	bc
   88E2 7D            [ 4] 4032 	ld	a,l
   88E3 B7            [ 4] 4033 	or	a, a
   88E4 28 08         [12] 4034 	jr	Z,00105$
                           4035 ;src/main.c:817: cu.mover = SI;
   88E6 3E 01         [ 7] 4036 	ld	a,#0x01
   88E8 12            [ 7] 4037 	ld	(de),a
                           4038 ;src/main.c:818: cu.x--;
   88E9 0A            [ 7] 4039 	ld	a,(bc)
   88EA C6 FF         [ 7] 4040 	add	a,#0xFF
   88EC 02            [ 7] 4041 	ld	(bc),a
   88ED C9            [10] 4042 	ret
   88EE                    4043 00105$:
                           4044 ;src/main.c:820: cu.mover=NO;
   88EE AF            [ 4] 4045 	xor	a, a
   88EF 12            [ 7] 4046 	ld	(de),a
   88F0 C9            [10] 4047 	ret
   88F1                    4048 00119$:
                           4049 ;src/main.c:826: cu.y--;
   88F1 03            [ 6] 4050 	inc	bc
                           4051 ;src/main.c:823: else if(cu.direccion == M_arriba){
   88F2 7D            [ 4] 4052 	ld	a,l
   88F3 D6 02         [ 7] 4053 	sub	a, #0x02
   88F5 20 22         [12] 4054 	jr	NZ,00116$
                           4055 ;src/main.c:824: if(checkKnifeCollision(M_derecha, 0, -2)){
   88F7 C5            [11] 4056 	push	bc
   88F8 D5            [11] 4057 	push	de
   88F9 21 00 FE      [10] 4058 	ld	hl,#0xFE00
   88FC E5            [11] 4059 	push	hl
   88FD 26 00         [ 7] 4060 	ld	h, #0x00
   88FF E5            [11] 4061 	push	hl
   8900 CD 76 88      [17] 4062 	call	_checkKnifeCollision
   8903 F1            [10] 4063 	pop	af
   8904 F1            [10] 4064 	pop	af
   8905 D1            [10] 4065 	pop	de
   8906 C1            [10] 4066 	pop	bc
   8907 7D            [ 4] 4067 	ld	a,l
   8908 B7            [ 4] 4068 	or	a, a
   8909 28 0B         [12] 4069 	jr	Z,00108$
                           4070 ;src/main.c:825: cu.mover = SI;
   890B 3E 01         [ 7] 4071 	ld	a,#0x01
   890D 12            [ 7] 4072 	ld	(de),a
                           4073 ;src/main.c:826: cu.y--;
   890E 0A            [ 7] 4074 	ld	a,(bc)
   890F C6 FF         [ 7] 4075 	add	a,#0xFF
   8911 02            [ 7] 4076 	ld	(bc),a
                           4077 ;src/main.c:827: cu.y--;
   8912 C6 FF         [ 7] 4078 	add	a,#0xFF
   8914 02            [ 7] 4079 	ld	(bc),a
   8915 C9            [10] 4080 	ret
   8916                    4081 00108$:
                           4082 ;src/main.c:830: cu.mover=NO;
   8916 AF            [ 4] 4083 	xor	a, a
   8917 12            [ 7] 4084 	ld	(de),a
   8918 C9            [10] 4085 	ret
   8919                    4086 00116$:
                           4087 ;src/main.c:833: else if(cu.direccion == M_abajo){
   8919 7D            [ 4] 4088 	ld	a,l
   891A D6 03         [ 7] 4089 	sub	a, #0x03
   891C C0            [11] 4090 	ret	NZ
                           4091 ;src/main.c:834: if(checkKnifeCollision(M_derecha, 0, G_KNIFEY_0_H + 2)){
   891D C5            [11] 4092 	push	bc
   891E D5            [11] 4093 	push	de
   891F 21 00 0A      [10] 4094 	ld	hl,#0x0A00
   8922 E5            [11] 4095 	push	hl
   8923 26 00         [ 7] 4096 	ld	h, #0x00
   8925 E5            [11] 4097 	push	hl
   8926 CD 76 88      [17] 4098 	call	_checkKnifeCollision
   8929 F1            [10] 4099 	pop	af
   892A F1            [10] 4100 	pop	af
   892B D1            [10] 4101 	pop	de
   892C C1            [10] 4102 	pop	bc
   892D 7D            [ 4] 4103 	ld	a,l
   892E B7            [ 4] 4104 	or	a, a
   892F 28 09         [12] 4105 	jr	Z,00111$
                           4106 ;src/main.c:835: cu.mover = SI;
   8931 3E 01         [ 7] 4107 	ld	a,#0x01
   8933 12            [ 7] 4108 	ld	(de),a
                           4109 ;src/main.c:836: cu.y++;
   8934 0A            [ 7] 4110 	ld	a,(bc)
   8935 3C            [ 4] 4111 	inc	a
   8936 02            [ 7] 4112 	ld	(bc),a
                           4113 ;src/main.c:837: cu.y++;
   8937 3C            [ 4] 4114 	inc	a
   8938 02            [ 7] 4115 	ld	(bc),a
   8939 C9            [10] 4116 	ret
   893A                    4117 00111$:
                           4118 ;src/main.c:840: cu.mover=NO;
   893A AF            [ 4] 4119 	xor	a, a
   893B 12            [ 7] 4120 	ld	(de),a
   893C C9            [10] 4121 	ret
                           4122 ;src/main.c:846: void barraPuntuacionInicial(){
                           4123 ;	---------------------------------
                           4124 ; Function barraPuntuacionInicial
                           4125 ; ---------------------------------
   893D                    4126 _barraPuntuacionInicial::
                           4127 ;src/main.c:851: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   893D 21 00 02      [10] 4128 	ld	hl,#0x0200
   8940 E5            [11] 4129 	push	hl
   8941 26 C0         [ 7] 4130 	ld	h, #0xC0
   8943 E5            [11] 4131 	push	hl
   8944 CD 69 64      [17] 4132 	call	_cpct_getScreenPtr
   8947 4D            [ 4] 4133 	ld	c,l
   8948 44            [ 4] 4134 	ld	b,h
                           4135 ;src/main.c:852: cpct_drawStringM0("SCORE", memptr, 1, 0);
   8949 21 01 00      [10] 4136 	ld	hl,#0x0001
   894C E5            [11] 4137 	push	hl
   894D C5            [11] 4138 	push	bc
   894E 21 E5 89      [10] 4139 	ld	hl,#___str_1
   8951 E5            [11] 4140 	push	hl
   8952 CD 99 58      [17] 4141 	call	_cpct_drawStringM0
   8955 21 06 00      [10] 4142 	ld	hl,#6
   8958 39            [11] 4143 	add	hl,sp
   8959 F9            [ 6] 4144 	ld	sp,hl
                           4145 ;src/main.c:853: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   895A 21 00 0E      [10] 4146 	ld	hl,#0x0E00
   895D E5            [11] 4147 	push	hl
   895E 26 C0         [ 7] 4148 	ld	h, #0xC0
   8960 E5            [11] 4149 	push	hl
   8961 CD 69 64      [17] 4150 	call	_cpct_getScreenPtr
   8964 4D            [ 4] 4151 	ld	c,l
   8965 44            [ 4] 4152 	ld	b,h
                           4153 ;src/main.c:854: cpct_drawStringM0("00000", memptr, 15, 0);
   8966 21 0F 00      [10] 4154 	ld	hl,#0x000F
   8969 E5            [11] 4155 	push	hl
   896A C5            [11] 4156 	push	bc
   896B 21 EB 89      [10] 4157 	ld	hl,#___str_2
   896E E5            [11] 4158 	push	hl
   896F CD 99 58      [17] 4159 	call	_cpct_drawStringM0
   8972 21 06 00      [10] 4160 	ld	hl,#6
   8975 39            [11] 4161 	add	hl,sp
   8976 F9            [ 6] 4162 	ld	sp,hl
                           4163 ;src/main.c:857: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 14);
   8977 21 1A 0E      [10] 4164 	ld	hl,#0x0E1A
   897A E5            [11] 4165 	push	hl
   897B 21 00 C0      [10] 4166 	ld	hl,#0xC000
   897E E5            [11] 4167 	push	hl
   897F CD 69 64      [17] 4168 	call	_cpct_getScreenPtr
   8982 4D            [ 4] 4169 	ld	c,l
   8983 44            [ 4] 4170 	ld	b,h
                           4171 ;src/main.c:858: cpct_drawStringM0("ROBOBIT", memptr, 3, 0);
   8984 21 03 00      [10] 4172 	ld	hl,#0x0003
   8987 E5            [11] 4173 	push	hl
   8988 C5            [11] 4174 	push	bc
   8989 21 F1 89      [10] 4175 	ld	hl,#___str_3
   898C E5            [11] 4176 	push	hl
   898D CD 99 58      [17] 4177 	call	_cpct_drawStringM0
   8990 21 06 00      [10] 4178 	ld	hl,#6
   8993 39            [11] 4179 	add	hl,sp
   8994 F9            [ 6] 4180 	ld	sp,hl
                           4181 ;src/main.c:860: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   8995 21 3C 02      [10] 4182 	ld	hl,#0x023C
   8998 E5            [11] 4183 	push	hl
   8999 21 00 C0      [10] 4184 	ld	hl,#0xC000
   899C E5            [11] 4185 	push	hl
   899D CD 69 64      [17] 4186 	call	_cpct_getScreenPtr
   89A0 4D            [ 4] 4187 	ld	c,l
   89A1 44            [ 4] 4188 	ld	b,h
                           4189 ;src/main.c:861: cpct_drawStringM0("LIVES", memptr, 1, 0);
   89A2 21 01 00      [10] 4190 	ld	hl,#0x0001
   89A5 E5            [11] 4191 	push	hl
   89A6 C5            [11] 4192 	push	bc
   89A7 21 F9 89      [10] 4193 	ld	hl,#___str_4
   89AA E5            [11] 4194 	push	hl
   89AB CD 99 58      [17] 4195 	call	_cpct_drawStringM0
   89AE 21 06 00      [10] 4196 	ld	hl,#6
   89B1 39            [11] 4197 	add	hl,sp
   89B2 F9            [ 6] 4198 	ld	sp,hl
                           4199 ;src/main.c:863: for(i=0; i<5; i++){
   89B3 01 00 00      [10] 4200 	ld	bc,#0x0000
   89B6                    4201 00102$:
                           4202 ;src/main.c:864: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   89B6 79            [ 4] 4203 	ld	a,c
   89B7 87            [ 4] 4204 	add	a, a
   89B8 87            [ 4] 4205 	add	a, a
   89B9 C6 3C         [ 7] 4206 	add	a, #0x3C
   89BB 57            [ 4] 4207 	ld	d,a
   89BC C5            [11] 4208 	push	bc
   89BD 3E 0E         [ 7] 4209 	ld	a,#0x0E
   89BF F5            [11] 4210 	push	af
   89C0 33            [ 6] 4211 	inc	sp
   89C1 D5            [11] 4212 	push	de
   89C2 33            [ 6] 4213 	inc	sp
   89C3 21 00 C0      [10] 4214 	ld	hl,#0xC000
   89C6 E5            [11] 4215 	push	hl
   89C7 CD 69 64      [17] 4216 	call	_cpct_getScreenPtr
   89CA EB            [ 4] 4217 	ex	de,hl
   89CB 21 03 06      [10] 4218 	ld	hl,#0x0603
   89CE E5            [11] 4219 	push	hl
   89CF D5            [11] 4220 	push	de
   89D0 21 60 48      [10] 4221 	ld	hl,#_g_heart
   89D3 E5            [11] 4222 	push	hl
   89D4 CD BD 58      [17] 4223 	call	_cpct_drawSprite
   89D7 C1            [10] 4224 	pop	bc
                           4225 ;src/main.c:863: for(i=0; i<5; i++){
   89D8 03            [ 6] 4226 	inc	bc
   89D9 79            [ 4] 4227 	ld	a,c
   89DA D6 05         [ 7] 4228 	sub	a, #0x05
   89DC 78            [ 4] 4229 	ld	a,b
   89DD 17            [ 4] 4230 	rla
   89DE 3F            [ 4] 4231 	ccf
   89DF 1F            [ 4] 4232 	rra
   89E0 DE 80         [ 7] 4233 	sbc	a, #0x80
   89E2 38 D2         [12] 4234 	jr	C,00102$
   89E4 C9            [10] 4235 	ret
   89E5                    4236 ___str_1:
   89E5 53 43 4F 52 45     4237 	.ascii "SCORE"
   89EA 00                 4238 	.db 0x00
   89EB                    4239 ___str_2:
   89EB 30 30 30 30 30     4240 	.ascii "00000"
   89F0 00                 4241 	.db 0x00
   89F1                    4242 ___str_3:
   89F1 52 4F 42 4F 42 49  4243 	.ascii "ROBOBIT"
        54
   89F8 00                 4244 	.db 0x00
   89F9                    4245 ___str_4:
   89F9 4C 49 56 45 53     4246 	.ascii "LIVES"
   89FE 00                 4247 	.db 0x00
                           4248 ;src/main.c:869: void borrarPantallaArriba(u8 x, u8 y, u8 ancho, u8 alto){
                           4249 ;	---------------------------------
                           4250 ; Function borrarPantallaArriba
                           4251 ; ---------------------------------
   89FF                    4252 _borrarPantallaArriba::
   89FF DD E5         [15] 4253 	push	ix
   8A01 DD 21 00 00   [14] 4254 	ld	ix,#0
   8A05 DD 39         [15] 4255 	add	ix,sp
                           4256 ;src/main.c:872: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   8A07 DD 66 05      [19] 4257 	ld	h,5 (ix)
   8A0A DD 6E 04      [19] 4258 	ld	l,4 (ix)
   8A0D E5            [11] 4259 	push	hl
   8A0E 21 00 C0      [10] 4260 	ld	hl,#0xC000
   8A11 E5            [11] 4261 	push	hl
   8A12 CD 69 64      [17] 4262 	call	_cpct_getScreenPtr
   8A15 4D            [ 4] 4263 	ld	c,l
   8A16 44            [ 4] 4264 	ld	b,h
                           4265 ;src/main.c:873: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra la mitad derecha
   8A17 DD 66 07      [19] 4266 	ld	h,7 (ix)
   8A1A DD 6E 06      [19] 4267 	ld	l,6 (ix)
   8A1D E5            [11] 4268 	push	hl
   8A1E AF            [ 4] 4269 	xor	a, a
   8A1F F5            [11] 4270 	push	af
   8A20 33            [ 6] 4271 	inc	sp
   8A21 C5            [11] 4272 	push	bc
   8A22 CD 8F 63      [17] 4273 	call	_cpct_drawSolidBox
   8A25 F1            [10] 4274 	pop	af
   8A26 F1            [10] 4275 	pop	af
   8A27 33            [ 6] 4276 	inc	sp
                           4277 ;src/main.c:874: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   8A28 DD 7E 04      [19] 4278 	ld	a,4 (ix)
   8A2B C6 28         [ 7] 4279 	add	a, #0x28
   8A2D 47            [ 4] 4280 	ld	b,a
   8A2E DD 7E 05      [19] 4281 	ld	a,5 (ix)
   8A31 F5            [11] 4282 	push	af
   8A32 33            [ 6] 4283 	inc	sp
   8A33 C5            [11] 4284 	push	bc
   8A34 33            [ 6] 4285 	inc	sp
   8A35 21 00 C0      [10] 4286 	ld	hl,#0xC000
   8A38 E5            [11] 4287 	push	hl
   8A39 CD 69 64      [17] 4288 	call	_cpct_getScreenPtr
   8A3C 4D            [ 4] 4289 	ld	c,l
   8A3D 44            [ 4] 4290 	ld	b,h
                           4291 ;src/main.c:875: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra la mitad izquierda
   8A3E DD 66 07      [19] 4292 	ld	h,7 (ix)
   8A41 DD 6E 06      [19] 4293 	ld	l,6 (ix)
   8A44 E5            [11] 4294 	push	hl
   8A45 AF            [ 4] 4295 	xor	a, a
   8A46 F5            [11] 4296 	push	af
   8A47 33            [ 6] 4297 	inc	sp
   8A48 C5            [11] 4298 	push	bc
   8A49 CD 8F 63      [17] 4299 	call	_cpct_drawSolidBox
   8A4C F1            [10] 4300 	pop	af
   8A4D F1            [10] 4301 	pop	af
   8A4E 33            [ 6] 4302 	inc	sp
   8A4F DD E1         [14] 4303 	pop	ix
   8A51 C9            [10] 4304 	ret
                           4305 ;src/main.c:878: void menuInicio(){
                           4306 ;	---------------------------------
                           4307 ; Function menuInicio
                           4308 ; ---------------------------------
   8A52                    4309 _menuInicio::
                           4310 ;src/main.c:882: cpct_clearScreen(0);
   8A52 21 00 40      [10] 4311 	ld	hl,#0x4000
   8A55 E5            [11] 4312 	push	hl
   8A56 AF            [ 4] 4313 	xor	a, a
   8A57 F5            [11] 4314 	push	af
   8A58 33            [ 6] 4315 	inc	sp
   8A59 26 C0         [ 7] 4316 	ld	h, #0xC0
   8A5B E5            [11] 4317 	push	hl
   8A5C CD 48 5B      [17] 4318 	call	_cpct_memset
                           4319 ;src/main.c:884: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   8A5F 21 1A 0F      [10] 4320 	ld	hl,#0x0F1A
   8A62 E5            [11] 4321 	push	hl
   8A63 21 00 C0      [10] 4322 	ld	hl,#0xC000
   8A66 E5            [11] 4323 	push	hl
   8A67 CD 69 64      [17] 4324 	call	_cpct_getScreenPtr
   8A6A 4D            [ 4] 4325 	ld	c,l
   8A6B 44            [ 4] 4326 	ld	b,h
                           4327 ;src/main.c:885: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   8A6C 21 04 00      [10] 4328 	ld	hl,#0x0004
   8A6F E5            [11] 4329 	push	hl
   8A70 C5            [11] 4330 	push	bc
   8A71 21 05 8B      [10] 4331 	ld	hl,#___str_5
   8A74 E5            [11] 4332 	push	hl
   8A75 CD 99 58      [17] 4333 	call	_cpct_drawStringM0
   8A78 21 06 00      [10] 4334 	ld	hl,#6
   8A7B 39            [11] 4335 	add	hl,sp
   8A7C F9            [ 6] 4336 	ld	sp,hl
                           4337 ;src/main.c:887: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   8A7D 21 28 6E      [10] 4338 	ld	hl,#0x6E28
   8A80 E5            [11] 4339 	push	hl
   8A81 21 F0 F0      [10] 4340 	ld	hl,#0xF0F0
   8A84 E5            [11] 4341 	push	hl
   8A85 21 00 26      [10] 4342 	ld	hl,#_g_text_0
   8A88 E5            [11] 4343 	push	hl
   8A89 CD BD 58      [17] 4344 	call	_cpct_drawSprite
                           4345 ;src/main.c:888: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   8A8C 21 28 6E      [10] 4346 	ld	hl,#0x6E28
   8A8F E5            [11] 4347 	push	hl
   8A90 21 18 F1      [10] 4348 	ld	hl,#0xF118
   8A93 E5            [11] 4349 	push	hl
   8A94 21 30 37      [10] 4350 	ld	hl,#_g_text_1
   8A97 E5            [11] 4351 	push	hl
   8A98 CD BD 58      [17] 4352 	call	_cpct_drawSprite
                           4353 ;src/main.c:911: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   8A9B 21 08 A0      [10] 4354 	ld	hl,#0xA008
   8A9E E5            [11] 4355 	push	hl
   8A9F 21 00 C0      [10] 4356 	ld	hl,#0xC000
   8AA2 E5            [11] 4357 	push	hl
   8AA3 CD 69 64      [17] 4358 	call	_cpct_getScreenPtr
   8AA6 4D            [ 4] 4359 	ld	c,l
   8AA7 44            [ 4] 4360 	ld	b,h
                           4361 ;src/main.c:912: cpct_drawStringM0("TO START PRESS S", memptr, 4, 0);
   8AA8 21 04 00      [10] 4362 	ld	hl,#0x0004
   8AAB E5            [11] 4363 	push	hl
   8AAC C5            [11] 4364 	push	bc
   8AAD 21 0D 8B      [10] 4365 	ld	hl,#___str_6
   8AB0 E5            [11] 4366 	push	hl
   8AB1 CD 99 58      [17] 4367 	call	_cpct_drawStringM0
   8AB4 21 06 00      [10] 4368 	ld	hl,#6
   8AB7 39            [11] 4369 	add	hl,sp
   8AB8 F9            [ 6] 4370 	ld	sp,hl
                           4371 ;src/main.c:914: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 170); // centrado en horizontal y abajo en vertical
   8AB9 21 0A AA      [10] 4372 	ld	hl,#0xAA0A
   8ABC E5            [11] 4373 	push	hl
   8ABD 21 00 C0      [10] 4374 	ld	hl,#0xC000
   8AC0 E5            [11] 4375 	push	hl
   8AC1 CD 69 64      [17] 4376 	call	_cpct_getScreenPtr
   8AC4 4D            [ 4] 4377 	ld	c,l
   8AC5 44            [ 4] 4378 	ld	b,h
                           4379 ;src/main.c:915: cpct_drawStringM0("TO MENU PRESS M", memptr, 4, 0);
   8AC6 21 04 00      [10] 4380 	ld	hl,#0x0004
   8AC9 E5            [11] 4381 	push	hl
   8ACA C5            [11] 4382 	push	bc
   8ACB 21 1E 8B      [10] 4383 	ld	hl,#___str_7
   8ACE E5            [11] 4384 	push	hl
   8ACF CD 99 58      [17] 4385 	call	_cpct_drawStringM0
   8AD2 21 06 00      [10] 4386 	ld	hl,#6
   8AD5 39            [11] 4387 	add	hl,sp
   8AD6 F9            [ 6] 4388 	ld	sp,hl
                           4389 ;src/main.c:918: do{
   8AD7                    4390 00106$:
                           4391 ;src/main.c:919: cpct_scanKeyboard_f();
   8AD7 CD 23 58      [17] 4392 	call	_cpct_scanKeyboard_f
                           4393 ;src/main.c:923: if(cpct_isKeyPressed(Key_M)){
   8ADA 21 04 40      [10] 4394 	ld	hl,#0x4004
   8ADD CD 17 58      [17] 4395 	call	_cpct_isKeyPressed
   8AE0 7D            [ 4] 4396 	ld	a,l
   8AE1 B7            [ 4] 4397 	or	a, a
   8AE2 28 0D         [12] 4398 	jr	Z,00107$
                           4399 ;src/main.c:924: cpct_scanKeyboard_f();
   8AE4 CD 23 58      [17] 4400 	call	_cpct_scanKeyboard_f
                           4401 ;src/main.c:925: do{
   8AE7                    4402 00101$:
                           4403 ;src/main.c:927: } while(!cpct_isKeyPressed(Key_S));
   8AE7 21 07 10      [10] 4404 	ld	hl,#0x1007
   8AEA CD 17 58      [17] 4405 	call	_cpct_isKeyPressed
   8AED 7D            [ 4] 4406 	ld	a,l
   8AEE B7            [ 4] 4407 	or	a, a
   8AEF 28 F6         [12] 4408 	jr	Z,00101$
   8AF1                    4409 00107$:
                           4410 ;src/main.c:929: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   8AF1 21 07 10      [10] 4411 	ld	hl,#0x1007
   8AF4 CD 17 58      [17] 4412 	call	_cpct_isKeyPressed
   8AF7 7D            [ 4] 4413 	ld	a,l
   8AF8 B7            [ 4] 4414 	or	a, a
   8AF9 C0            [11] 4415 	ret	NZ
   8AFA 21 04 40      [10] 4416 	ld	hl,#0x4004
   8AFD CD 17 58      [17] 4417 	call	_cpct_isKeyPressed
   8B00 7D            [ 4] 4418 	ld	a,l
   8B01 B7            [ 4] 4419 	or	a, a
   8B02 28 D3         [12] 4420 	jr	Z,00106$
   8B04 C9            [10] 4421 	ret
   8B05                    4422 ___str_5:
   8B05 52 4F 42 4F 42 49  4423 	.ascii "ROBOBIT"
        54
   8B0C 00                 4424 	.db 0x00
   8B0D                    4425 ___str_6:
   8B0D 54 4F 20 53 54 41  4426 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   8B1D 00                 4427 	.db 0x00
   8B1E                    4428 ___str_7:
   8B1E 54 4F 20 4D 45 4E  4429 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   8B2D 00                 4430 	.db 0x00
                           4431 ;src/main.c:932: void inicializarCPC() {
                           4432 ;	---------------------------------
                           4433 ; Function inicializarCPC
                           4434 ; ---------------------------------
   8B2E                    4435 _inicializarCPC::
                           4436 ;src/main.c:933: cpct_disableFirmware();
   8B2E CD 7F 63      [17] 4437 	call	_cpct_disableFirmware
                           4438 ;src/main.c:934: cpct_setVideoMode(0);
   8B31 2E 00         [ 7] 4439 	ld	l,#0x00
   8B33 CD 2A 5B      [17] 4440 	call	_cpct_setVideoMode
                           4441 ;src/main.c:935: cpct_setBorder(HW_BLACK);
   8B36 21 10 14      [10] 4442 	ld	hl,#0x1410
   8B39 E5            [11] 4443 	push	hl
   8B3A CD 8D 58      [17] 4444 	call	_cpct_setPALColour
                           4445 ;src/main.c:936: cpct_setPalette(g_palette, 16);
   8B3D 21 10 00      [10] 4446 	ld	hl,#0x0010
   8B40 E5            [11] 4447 	push	hl
   8B41 21 98 4A      [10] 4448 	ld	hl,#_g_palette
   8B44 E5            [11] 4449 	push	hl
   8B45 CD 00 58      [17] 4450 	call	_cpct_setPalette
                           4451 ;src/main.c:937: cpct_akp_musicInit(G_song);
   8B48 21 00 0F      [10] 4452 	ld	hl,#_G_song
   8B4B E5            [11] 4453 	push	hl
   8B4C CD 5B 62      [17] 4454 	call	_cpct_akp_musicInit
   8B4F F1            [10] 4455 	pop	af
   8B50 C9            [10] 4456 	ret
                           4457 ;src/main.c:940: void inicializarEnemy() {
                           4458 ;	---------------------------------
                           4459 ; Function inicializarEnemy
                           4460 ; ---------------------------------
   8B51                    4461 _inicializarEnemy::
   8B51 DD E5         [15] 4462 	push	ix
   8B53 DD 21 00 00   [14] 4463 	ld	ix,#0
   8B57 DD 39         [15] 4464 	add	ix,sp
   8B59 21 F9 FF      [10] 4465 	ld	hl,#-7
   8B5C 39            [11] 4466 	add	hl,sp
   8B5D F9            [ 6] 4467 	ld	sp,hl
                           4468 ;src/main.c:951: actual = enemy;
   8B5E 01 C6 64      [10] 4469 	ld	bc,#_enemy+0
                           4470 ;src/main.c:952: while(--i){
   8B61 DD 36 F9 02   [19] 4471 	ld	-7 (ix),#0x02
   8B65                    4472 00101$:
   8B65 DD 35 F9      [23] 4473 	dec	-7 (ix)
   8B68 DD 7E F9      [19] 4474 	ld	a,-7 (ix)
   8B6B B7            [ 4] 4475 	or	a, a
   8B6C CA 42 8C      [10] 4476 	jp	Z,00104$
                           4477 ;src/main.c:953: actual->x = actual->px = spawnX[i];
   8B6F 59            [ 4] 4478 	ld	e, c
   8B70 50            [ 4] 4479 	ld	d, b
   8B71 13            [ 6] 4480 	inc	de
   8B72 13            [ 6] 4481 	inc	de
   8B73 3E 8F         [ 7] 4482 	ld	a,#<(_spawnX)
   8B75 DD 86 F9      [19] 4483 	add	a, -7 (ix)
   8B78 DD 77 FE      [19] 4484 	ld	-2 (ix),a
   8B7B 3E 72         [ 7] 4485 	ld	a,#>(_spawnX)
   8B7D CE 00         [ 7] 4486 	adc	a, #0x00
   8B7F DD 77 FF      [19] 4487 	ld	-1 (ix),a
   8B82 DD 6E FE      [19] 4488 	ld	l,-2 (ix)
   8B85 DD 66 FF      [19] 4489 	ld	h,-1 (ix)
   8B88 7E            [ 7] 4490 	ld	a,(hl)
   8B89 DD 77 FD      [19] 4491 	ld	-3 (ix), a
   8B8C 12            [ 7] 4492 	ld	(de),a
   8B8D DD 7E FD      [19] 4493 	ld	a,-3 (ix)
   8B90 02            [ 7] 4494 	ld	(bc),a
                           4495 ;src/main.c:954: actual->y = actual->py = spawnY[i];
   8B91 59            [ 4] 4496 	ld	e, c
   8B92 50            [ 4] 4497 	ld	d, b
   8B93 13            [ 6] 4498 	inc	de
   8B94 21 03 00      [10] 4499 	ld	hl,#0x0003
   8B97 09            [11] 4500 	add	hl,bc
   8B98 DD 75 FB      [19] 4501 	ld	-5 (ix),l
   8B9B DD 74 FC      [19] 4502 	ld	-4 (ix),h
   8B9E FD 21 94 72   [14] 4503 	ld	iy,#_spawnY
   8BA2 C5            [11] 4504 	push	bc
   8BA3 DD 4E F9      [19] 4505 	ld	c,-7 (ix)
   8BA6 06 00         [ 7] 4506 	ld	b,#0x00
   8BA8 FD 09         [15] 4507 	add	iy, bc
   8BAA C1            [10] 4508 	pop	bc
   8BAB FD 7E 00      [19] 4509 	ld	a, 0 (iy)
   8BAE DD 77 FA      [19] 4510 	ld	-6 (ix),a
   8BB1 DD 6E FB      [19] 4511 	ld	l,-5 (ix)
   8BB4 DD 66 FC      [19] 4512 	ld	h,-4 (ix)
   8BB7 DD 7E FA      [19] 4513 	ld	a,-6 (ix)
   8BBA 77            [ 7] 4514 	ld	(hl),a
   8BBB DD 7E FA      [19] 4515 	ld	a,-6 (ix)
   8BBE 12            [ 7] 4516 	ld	(de),a
                           4517 ;src/main.c:955: actual->mover  = NO;
   8BBF 21 06 00      [10] 4518 	ld	hl,#0x0006
   8BC2 09            [11] 4519 	add	hl,bc
   8BC3 36 00         [10] 4520 	ld	(hl),#0x00
                           4521 ;src/main.c:956: actual->mira   = M_abajo;
   8BC5 21 07 00      [10] 4522 	ld	hl,#0x0007
   8BC8 09            [11] 4523 	add	hl,bc
   8BC9 36 03         [10] 4524 	ld	(hl),#0x03
                           4525 ;src/main.c:957: actual->sprite = g_enemy;
   8BCB 21 04 00      [10] 4526 	ld	hl,#0x0004
   8BCE 09            [11] 4527 	add	hl,bc
   8BCF 36 72         [10] 4528 	ld	(hl),#<(_g_enemy)
   8BD1 23            [ 6] 4529 	inc	hl
   8BD2 36 48         [10] 4530 	ld	(hl),#>(_g_enemy)
                           4531 ;src/main.c:958: actual->muerto = NO;
   8BD4 21 08 00      [10] 4532 	ld	hl,#0x0008
   8BD7 09            [11] 4533 	add	hl,bc
   8BD8 36 00         [10] 4534 	ld	(hl),#0x00
                           4535 ;src/main.c:959: actual->muertes = 0;
   8BDA 21 0A 00      [10] 4536 	ld	hl,#0x000A
   8BDD 09            [11] 4537 	add	hl,bc
   8BDE 36 00         [10] 4538 	ld	(hl),#0x00
                           4539 ;src/main.c:960: actual->patrolling = SI;
   8BE0 21 0B 00      [10] 4540 	ld	hl,#0x000B
   8BE3 09            [11] 4541 	add	hl,bc
   8BE4 36 01         [10] 4542 	ld	(hl),#0x01
                           4543 ;src/main.c:961: actual->onPathPatrol = SI;
   8BE6 21 0C 00      [10] 4544 	ld	hl,#0x000C
   8BE9 09            [11] 4545 	add	hl,bc
   8BEA 36 01         [10] 4546 	ld	(hl),#0x01
                           4547 ;src/main.c:962: actual->reversePatrol = NO;
   8BEC 21 0D 00      [10] 4548 	ld	hl,#0x000D
   8BEF 09            [11] 4549 	add	hl,bc
   8BF0 36 00         [10] 4550 	ld	(hl),#0x00
                           4551 ;src/main.c:963: actual->iter = 0;
   8BF2 21 0F 00      [10] 4552 	ld	hl,#0x000F
   8BF5 09            [11] 4553 	add	hl,bc
   8BF6 36 00         [10] 4554 	ld	(hl),#0x00
                           4555 ;src/main.c:964: actual->lastIter = 0;
   8BF8 21 10 00      [10] 4556 	ld	hl,#0x0010
   8BFB 09            [11] 4557 	add	hl,bc
   8BFC 36 00         [10] 4558 	ld	(hl),#0x00
                           4559 ;src/main.c:965: actual->seen = 0;
   8BFE 21 12 00      [10] 4560 	ld	hl,#0x0012
   8C01 09            [11] 4561 	add	hl,bc
   8C02 36 00         [10] 4562 	ld	(hl),#0x00
                           4563 ;src/main.c:966: actual->found = 0;
   8C04 21 13 00      [10] 4564 	ld	hl,#0x0013
   8C07 09            [11] 4565 	add	hl,bc
   8C08 36 00         [10] 4566 	ld	(hl),#0x00
                           4567 ;src/main.c:967: pathFinding(actual->x, actual->y, spawnX[i] - 20, spawnY[i], actual, mapa); // calculo rutas de patrulla
   8C0A FD 5E 00      [19] 4568 	ld	e, 0 (iy)
   8C0D DD 6E FE      [19] 4569 	ld	l,-2 (ix)
   8C10 DD 66 FF      [19] 4570 	ld	h,-1 (ix)
   8C13 7E            [ 7] 4571 	ld	a,(hl)
   8C14 C6 EC         [ 7] 4572 	add	a,#0xEC
   8C16 57            [ 4] 4573 	ld	d,a
   8C17 C5            [11] 4574 	push	bc
   8C18 2A E9 69      [16] 4575 	ld	hl,(_mapa)
   8C1B E5            [11] 4576 	push	hl
   8C1C C5            [11] 4577 	push	bc
   8C1D 7B            [ 4] 4578 	ld	a,e
   8C1E F5            [11] 4579 	push	af
   8C1F 33            [ 6] 4580 	inc	sp
   8C20 D5            [11] 4581 	push	de
   8C21 33            [ 6] 4582 	inc	sp
   8C22 DD 66 FA      [19] 4583 	ld	h,-6 (ix)
   8C25 DD 6E FD      [19] 4584 	ld	l,-3 (ix)
   8C28 E5            [11] 4585 	push	hl
   8C29 CD B2 54      [17] 4586 	call	_pathFinding
   8C2C 21 08 00      [10] 4587 	ld	hl,#8
   8C2F 39            [11] 4588 	add	hl,sp
   8C30 F9            [ 6] 4589 	ld	sp,hl
   8C31 C1            [10] 4590 	pop	bc
                           4591 ;src/main.c:990: dibujarEnemigo(actual);
   8C32 C5            [11] 4592 	push	bc
   8C33 C5            [11] 4593 	push	bc
   8C34 CD 14 75      [17] 4594 	call	_dibujarEnemigo
   8C37 F1            [10] 4595 	pop	af
   8C38 C1            [10] 4596 	pop	bc
                           4597 ;src/main.c:992: ++actual;
   8C39 21 44 01      [10] 4598 	ld	hl,#0x0144
   8C3C 09            [11] 4599 	add	hl,bc
   8C3D 4D            [ 4] 4600 	ld	c,l
   8C3E 44            [ 4] 4601 	ld	b,h
   8C3F C3 65 8B      [10] 4602 	jp	00101$
   8C42                    4603 00104$:
   8C42 DD F9         [10] 4604 	ld	sp, ix
   8C44 DD E1         [14] 4605 	pop	ix
   8C46 C9            [10] 4606 	ret
                           4607 ;src/main.c:996: void inicializarJuego() {
                           4608 ;	---------------------------------
                           4609 ; Function inicializarJuego
                           4610 ; ---------------------------------
   8C47                    4611 _inicializarJuego::
                           4612 ;src/main.c:998: iter = 0;
   8C47 21 E8 69      [10] 4613 	ld	hl,#_iter + 0
   8C4A 36 00         [10] 4614 	ld	(hl), #0x00
                           4615 ;src/main.c:999: num_mapa = 0;
   8C4C 21 EB 69      [10] 4616 	ld	hl,#_num_mapa + 0
   8C4F 36 00         [10] 4617 	ld	(hl), #0x00
                           4618 ;src/main.c:1000: mapa = mapas[num_mapa];
   8C51 21 89 72      [10] 4619 	ld	hl, #_mapas + 0
   8C54 7E            [ 7] 4620 	ld	a,(hl)
   8C55 FD 21 E9 69   [14] 4621 	ld	iy,#_mapa
   8C59 FD 77 00      [19] 4622 	ld	0 (iy),a
   8C5C 23            [ 6] 4623 	inc	hl
   8C5D 7E            [ 7] 4624 	ld	a,(hl)
   8C5E 32 EA 69      [13] 4625 	ld	(#_mapa + 1),a
                           4626 ;src/main.c:1001: cpct_etm_setTileset2x4(g_tileset);
   8C61 21 E0 24      [10] 4627 	ld	hl,#_g_tileset
   8C64 CD F1 59      [17] 4628 	call	_cpct_etm_setTileset2x4
                           4629 ;src/main.c:1003: dibujarMapa();
   8C67 CD 73 72      [17] 4630 	call	_dibujarMapa
                           4631 ;src/main.c:1005: borrarPantallaArriba(0, 0, 40, 1);
   8C6A 21 28 01      [10] 4632 	ld	hl,#0x0128
   8C6D E5            [11] 4633 	push	hl
   8C6E 21 00 00      [10] 4634 	ld	hl,#0x0000
   8C71 E5            [11] 4635 	push	hl
   8C72 CD FF 89      [17] 4636 	call	_borrarPantallaArriba
   8C75 F1            [10] 4637 	pop	af
   8C76 F1            [10] 4638 	pop	af
                           4639 ;src/main.c:1006: barraPuntuacionInicial();
   8C77 CD 3D 89      [17] 4640 	call	_barraPuntuacionInicial
                           4641 ;src/main.c:1009: prota.x = prota.px = 5;
   8C7A 21 D8 69      [10] 4642 	ld	hl,#(_prota + 0x0002)
   8C7D 36 05         [10] 4643 	ld	(hl),#0x05
   8C7F 21 D6 69      [10] 4644 	ld	hl,#_prota
   8C82 36 05         [10] 4645 	ld	(hl),#0x05
                           4646 ;src/main.c:1010: prota.y = prota.py = 76 + ORIGEN_MAPA_Y;
   8C84 21 D9 69      [10] 4647 	ld	hl,#(_prota + 0x0003)
   8C87 36 64         [10] 4648 	ld	(hl),#0x64
   8C89 21 D7 69      [10] 4649 	ld	hl,#(_prota + 0x0001)
   8C8C 36 64         [10] 4650 	ld	(hl),#0x64
                           4651 ;src/main.c:1011: prota.mover  = NO;
   8C8E 21 DC 69      [10] 4652 	ld	hl,#(_prota + 0x0006)
   8C91 36 00         [10] 4653 	ld	(hl),#0x00
                           4654 ;src/main.c:1012: prota.mira=M_derecha;
   8C93 21 DD 69      [10] 4655 	ld	hl,#(_prota + 0x0007)
   8C96 36 00         [10] 4656 	ld	(hl),#0x00
                           4657 ;src/main.c:1013: prota.sprite = g_hero;
   8C98 21 A8 4A      [10] 4658 	ld	hl,#_g_hero
   8C9B 22 DA 69      [16] 4659 	ld	((_prota + 0x0004)), hl
                           4660 ;src/main.c:1017: cu.x = cu.px = 0;
   8C9E 21 E0 69      [10] 4661 	ld	hl,#(_cu + 0x0002)
   8CA1 36 00         [10] 4662 	ld	(hl),#0x00
   8CA3 21 DE 69      [10] 4663 	ld	hl,#_cu
   8CA6 36 00         [10] 4664 	ld	(hl),#0x00
                           4665 ;src/main.c:1018: cu.y = cu.py = 0;
   8CA8 21 E1 69      [10] 4666 	ld	hl,#(_cu + 0x0003)
   8CAB 36 00         [10] 4667 	ld	(hl),#0x00
   8CAD 21 DF 69      [10] 4668 	ld	hl,#(_cu + 0x0001)
   8CB0 36 00         [10] 4669 	ld	(hl),#0x00
                           4670 ;src/main.c:1019: cu.lanzado = NO;
   8CB2 21 E4 69      [10] 4671 	ld	hl,#(_cu + 0x0006)
   8CB5 36 00         [10] 4672 	ld	(hl),#0x00
                           4673 ;src/main.c:1020: cu.mover = NO;
   8CB7 21 E7 69      [10] 4674 	ld	hl,#(_cu + 0x0009)
   8CBA 36 00         [10] 4675 	ld	(hl),#0x00
                           4676 ;src/main.c:1022: inicializarEnemy();
   8CBC CD 51 8B      [17] 4677 	call	_inicializarEnemy
                           4678 ;src/main.c:1024: dibujarProta();
   8CBF C3 99 72      [10] 4679 	jp  _dibujarProta
                           4680 ;src/main.c:1027: void main(void) {
                           4681 ;	---------------------------------
                           4682 ; Function main
                           4683 ; ---------------------------------
   8CC2                    4684 _main::
   8CC2 DD E5         [15] 4685 	push	ix
   8CC4 DD 21 00 00   [14] 4686 	ld	ix,#0
   8CC8 DD 39         [15] 4687 	add	ix,sp
   8CCA 3B            [ 6] 4688 	dec	sp
                           4689 ;src/main.c:1032: inicializarCPC();
   8CCB CD 2E 8B      [17] 4690 	call	_inicializarCPC
                           4691 ;src/main.c:1033: menuInicio();
   8CCE CD 52 8A      [17] 4692 	call	_menuInicio
                           4693 ;src/main.c:1035: inicializarJuego();
   8CD1 CD 47 8C      [17] 4694 	call	_inicializarJuego
                           4695 ;src/main.c:1036: cpct_akp_musicPlay();
   8CD4 CD 58 5B      [17] 4696 	call	_cpct_akp_musicPlay
                           4697 ;src/main.c:1038: while (1) {
   8CD7                    4698 00119$:
                           4699 ;src/main.c:1041: i = 1 + 1;
   8CD7 DD 36 FF 02   [19] 4700 	ld	-1 (ix),#0x02
                           4701 ;src/main.c:1044: comprobarTeclado();
   8CDB CD 35 88      [17] 4702 	call	_comprobarTeclado
                           4703 ;src/main.c:1045: moverCuchillo();
   8CDE CD 98 88      [17] 4704 	call	_moverCuchillo
                           4705 ;src/main.c:1046: updateEnemies();
   8CE1 CD 6F 84      [17] 4706 	call	_updateEnemies
                           4707 ;src/main.c:1061: actual = enemy;
                           4708 ;src/main.c:1063: cpct_waitVSYNC();
   8CE4 CD 22 5B      [17] 4709 	call	_cpct_waitVSYNC
                           4710 ;src/main.c:1065: if (prota.mover) {
   8CE7 01 DC 69      [10] 4711 	ld	bc,#_prota+6
   8CEA 0A            [ 7] 4712 	ld	a,(bc)
   8CEB B7            [ 4] 4713 	or	a, a
   8CEC 28 07         [12] 4714 	jr	Z,00102$
                           4715 ;src/main.c:1066: redibujarProta();
   8CEE C5            [11] 4716 	push	bc
   8CEF CD 6A 73      [17] 4717 	call	_redibujarProta
   8CF2 C1            [10] 4718 	pop	bc
                           4719 ;src/main.c:1067: prota.mover = NO;
   8CF3 AF            [ 4] 4720 	xor	a, a
   8CF4 02            [ 7] 4721 	ld	(bc),a
   8CF5                    4722 00102$:
                           4723 ;src/main.c:1069: if(cu.lanzado && cu.mover){
   8CF5 21 E4 69      [10] 4724 	ld	hl,#_cu + 6
   8CF8 4E            [ 7] 4725 	ld	c,(hl)
   8CF9 11 E7 69      [10] 4726 	ld	de,#_cu + 9
   8CFC 79            [ 4] 4727 	ld	a,c
   8CFD B7            [ 4] 4728 	or	a, a
   8CFE 28 09         [12] 4729 	jr	Z,00107$
   8D00 1A            [ 7] 4730 	ld	a,(de)
   8D01 B7            [ 4] 4731 	or	a, a
   8D02 28 05         [12] 4732 	jr	Z,00107$
                           4733 ;src/main.c:1070: redibujarCuchillo();
   8D04 CD 05 87      [17] 4734 	call	_redibujarCuchillo
   8D07 18 0B         [12] 4735 	jr	00132$
   8D09                    4736 00107$:
                           4737 ;src/main.c:1071: }else if (cu.lanzado && !cu.mover){
   8D09 79            [ 4] 4738 	ld	a,c
   8D0A B7            [ 4] 4739 	or	a, a
   8D0B 28 07         [12] 4740 	jr	Z,00132$
   8D0D 1A            [ 7] 4741 	ld	a,(de)
   8D0E B7            [ 4] 4742 	or	a, a
   8D0F 20 03         [12] 4743 	jr	NZ,00132$
                           4744 ;src/main.c:1072: borrarCuchillo();
   8D11 CD 87 86      [17] 4745 	call	_borrarCuchillo
                           4746 ;src/main.c:1075: while(--i){
   8D14                    4747 00132$:
   8D14 01 C6 64      [10] 4748 	ld	bc,#_enemy
   8D17                    4749 00115$:
   8D17 DD 35 FF      [23] 4750 	dec	-1 (ix)
   8D1A DD 7E FF      [19] 4751 	ld	a, -1 (ix)
   8D1D B7            [ 4] 4752 	or	a, a
   8D1E 28 43         [12] 4753 	jr	Z,00117$
                           4754 ;src/main.c:1076: if(actual->mover){
   8D20 C5            [11] 4755 	push	bc
   8D21 FD E1         [14] 4756 	pop	iy
   8D23 FD 7E 06      [19] 4757 	ld	a,6 (iy)
   8D26 B7            [ 4] 4758 	or	a, a
   8D27 28 07         [12] 4759 	jr	Z,00111$
                           4760 ;src/main.c:1077: redibujarEnemigo(actual);
   8D29 C5            [11] 4761 	push	bc
   8D2A C5            [11] 4762 	push	bc
   8D2B CD 88 76      [17] 4763 	call	_redibujarEnemigo
   8D2E F1            [10] 4764 	pop	af
   8D2F C1            [10] 4765 	pop	bc
   8D30                    4766 00111$:
                           4767 ;src/main.c:1079: if (actual->muerto && actual->muertes == 0){
   8D30 C5            [11] 4768 	push	bc
   8D31 FD E1         [14] 4769 	pop	iy
   8D33 FD 7E 08      [19] 4770 	ld	a,8 (iy)
   8D36 B7            [ 4] 4771 	or	a, a
   8D37 28 22         [12] 4772 	jr	Z,00113$
   8D39 21 0A 00      [10] 4773 	ld	hl,#0x000A
   8D3C 09            [11] 4774 	add	hl,bc
   8D3D 7E            [ 7] 4775 	ld	a,(hl)
   8D3E B7            [ 4] 4776 	or	a, a
   8D3F 20 1A         [12] 4777 	jr	NZ,00113$
                           4778 ;src/main.c:1080: borrarEnemigo(actual);
   8D41 E5            [11] 4779 	push	hl
   8D42 C5            [11] 4780 	push	bc
   8D43 C5            [11] 4781 	push	bc
   8D44 CD F4 75      [17] 4782 	call	_borrarEnemigo
   8D47 F1            [10] 4783 	pop	af
   8D48 C1            [10] 4784 	pop	bc
   8D49 C5            [11] 4785 	push	bc
   8D4A C5            [11] 4786 	push	bc
   8D4B CD 4C 75      [17] 4787 	call	_dibujarExplosion
   8D4E F1            [10] 4788 	pop	af
   8D4F C1            [10] 4789 	pop	bc
   8D50 E1            [10] 4790 	pop	hl
                           4791 ;src/main.c:1083: actual->muertes++;
   8D51 5E            [ 7] 4792 	ld	e,(hl)
   8D52 1C            [ 4] 4793 	inc	e
   8D53 73            [ 7] 4794 	ld	(hl),e
                           4795 ;src/main.c:1084: actual->x = 0;
   8D54 AF            [ 4] 4796 	xor	a, a
   8D55 02            [ 7] 4797 	ld	(bc),a
                           4798 ;src/main.c:1085: actual->y = 0;
   8D56 59            [ 4] 4799 	ld	e, c
   8D57 50            [ 4] 4800 	ld	d, b
   8D58 13            [ 6] 4801 	inc	de
   8D59 AF            [ 4] 4802 	xor	a, a
   8D5A 12            [ 7] 4803 	ld	(de),a
   8D5B                    4804 00113$:
                           4805 ;src/main.c:1087: ++actual;
   8D5B 21 44 01      [10] 4806 	ld	hl,#0x0144
   8D5E 09            [11] 4807 	add	hl,bc
   8D5F 4D            [ 4] 4808 	ld	c,l
   8D60 44            [ 4] 4809 	ld	b,h
   8D61 18 B4         [12] 4810 	jr	00115$
   8D63                    4811 00117$:
                           4812 ;src/main.c:1090: cpct_waitVSYNC();
   8D63 CD 22 5B      [17] 4813 	call	_cpct_waitVSYNC
   8D66 C3 D7 8C      [10] 4814 	jp	00119$
   8D69 33            [ 6] 4815 	inc	sp
   8D6A DD E1         [14] 4816 	pop	ix
   8D6C C9            [10] 4817 	ret
                           4818 	.area _CODE
                           4819 	.area _INITIALIZER
                           4820 	.area _CABS (ABS)
   0F00                    4821 	.org 0x0F00
   0F00                    4822 _G_song:
   0F00 41                 4823 	.db #0x41	; 65	'A'
   0F01 54                 4824 	.db #0x54	; 84	'T'
   0F02 31                 4825 	.db #0x31	; 49	'1'
   0F03 30                 4826 	.db #0x30	; 48	'0'
   0F04 01                 4827 	.db #0x01	; 1
   0F05 40                 4828 	.db #0x40	; 64
   0F06 42                 4829 	.db #0x42	; 66	'B'
   0F07 0F                 4830 	.db #0x0F	; 15
   0F08 02                 4831 	.db #0x02	; 2
   0F09 06                 4832 	.db #0x06	; 6
   0F0A 1D                 4833 	.db #0x1D	; 29
   0F0B 00                 4834 	.db #0x00	; 0
   0F0C 10                 4835 	.db #0x10	; 16
   0F0D 40                 4836 	.db #0x40	; 64
   0F0E 19                 4837 	.db #0x19	; 25
   0F0F 40                 4838 	.db #0x40	; 64
   0F10 00                 4839 	.db #0x00	; 0
   0F11 00                 4840 	.db #0x00	; 0
   0F12 00                 4841 	.db #0x00	; 0
   0F13 00                 4842 	.db #0x00	; 0
   0F14 00                 4843 	.db #0x00	; 0
   0F15 00                 4844 	.db #0x00	; 0
   0F16 0D                 4845 	.db #0x0D	; 13
   0F17 12                 4846 	.db #0x12	; 18
   0F18 40                 4847 	.db #0x40	; 64
   0F19 01                 4848 	.db #0x01	; 1
   0F1A 00                 4849 	.db #0x00	; 0
   0F1B 7C                 4850 	.db #0x7C	; 124
   0F1C 18                 4851 	.db #0x18	; 24
   0F1D 78                 4852 	.db #0x78	; 120	'x'
   0F1E 0C                 4853 	.db #0x0C	; 12
   0F1F 34                 4854 	.db #0x34	; 52	'4'
   0F20 30                 4855 	.db #0x30	; 48	'0'
   0F21 2C                 4856 	.db #0x2C	; 44
   0F22 28                 4857 	.db #0x28	; 40
   0F23 24                 4858 	.db #0x24	; 36
   0F24 20                 4859 	.db #0x20	; 32
   0F25 1C                 4860 	.db #0x1C	; 28
   0F26 0D                 4861 	.db #0x0D	; 13
   0F27 25                 4862 	.db #0x25	; 37
   0F28 40                 4863 	.db #0x40	; 64
   0F29 20                 4864 	.db #0x20	; 32
   0F2A 00                 4865 	.db #0x00	; 0
   0F2B 00                 4866 	.db #0x00	; 0
   0F2C 00                 4867 	.db #0x00	; 0
   0F2D 39                 4868 	.db #0x39	; 57	'9'
   0F2E 40                 4869 	.db #0x40	; 64
   0F2F 00                 4870 	.db #0x00	; 0
   0F30 57                 4871 	.db #0x57	; 87	'W'
   0F31 40                 4872 	.db #0x40	; 64
   0F32 3B                 4873 	.db #0x3B	; 59
   0F33 40                 4874 	.db #0x40	; 64
   0F34 57                 4875 	.db #0x57	; 87	'W'
   0F35 40                 4876 	.db #0x40	; 64
   0F36 01                 4877 	.db #0x01	; 1
   0F37 2F                 4878 	.db #0x2F	; 47
   0F38 40                 4879 	.db #0x40	; 64
   0F39 19                 4880 	.db #0x19	; 25
   0F3A 00                 4881 	.db #0x00	; 0
   0F3B 76                 4882 	.db #0x76	; 118	'v'
   0F3C E1                 4883 	.db #0xE1	; 225
   0F3D 00                 4884 	.db #0x00	; 0
   0F3E 00                 4885 	.db #0x00	; 0
   0F3F 01                 4886 	.db #0x01	; 1
   0F40 04                 4887 	.db #0x04	; 4
   0F41 51                 4888 	.db #0x51	; 81	'Q'
   0F42 04                 4889 	.db #0x04	; 4
   0F43 37                 4890 	.db #0x37	; 55	'7'
   0F44 04                 4891 	.db #0x04	; 4
   0F45 4F                 4892 	.db #0x4F	; 79	'O'
   0F46 04                 4893 	.db #0x04	; 4
   0F47 37                 4894 	.db #0x37	; 55	'7'
   0F48 02                 4895 	.db #0x02	; 2
   0F49 4B                 4896 	.db #0x4B	; 75	'K'
   0F4A 02                 4897 	.db #0x02	; 2
   0F4B 37                 4898 	.db #0x37	; 55	'7'
   0F4C 04                 4899 	.db #0x04	; 4
   0F4D 4F                 4900 	.db #0x4F	; 79	'O'
   0F4E 04                 4901 	.db #0x04	; 4
   0F4F 37                 4902 	.db #0x37	; 55	'7'
   0F50 04                 4903 	.db #0x04	; 4
   0F51 4F                 4904 	.db #0x4F	; 79	'O'
   0F52 04                 4905 	.db #0x04	; 4
   0F53 37                 4906 	.db #0x37	; 55	'7'
   0F54 02                 4907 	.db #0x02	; 2
   0F55 4B                 4908 	.db #0x4B	; 75	'K'
   0F56 00                 4909 	.db #0x00	; 0
   0F57 42                 4910 	.db #0x42	; 66	'B'
   0F58 60                 4911 	.db #0x60	; 96
   0F59 00                 4912 	.db #0x00	; 0
   0F5A 42                 4913 	.db #0x42	; 66	'B'
   0F5B 80                 4914 	.db #0x80	; 128
   0F5C 00                 4915 	.db #0x00	; 0
   0F5D 00                 4916 	.db #0x00	; 0
   0F5E 42                 4917 	.db #0x42	; 66	'B'
   0F5F 00                 4918 	.db #0x00	; 0
   0F60 00                 4919 	.db #0x00	; 0
