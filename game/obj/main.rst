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
   7CA6 CD 92 4B      [17] 1963 	call	_abs
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
   7CD3 CD 92 4B      [17] 1989 	call	_abs
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
   7E3B F5            [11] 2250 	push	af
   7E3C F5            [11] 2251 	push	af
                           2252 ;src/main.c:473: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7E3D DD 4E 04      [19] 2253 	ld	c,4 (ix)
   7E40 DD 46 05      [19] 2254 	ld	b,5 (ix)
   7E43 0A            [ 7] 2255 	ld	a,(bc)
   7E44 5F            [ 4] 2256 	ld	e,a
   7E45 16 00         [ 7] 2257 	ld	d,#0x00
   7E47 21 D6 69      [10] 2258 	ld	hl,#_prota+0
   7E4A 6E            [ 7] 2259 	ld	l,(hl)
   7E4B 26 00         [ 7] 2260 	ld	h,#0x00
   7E4D 7B            [ 4] 2261 	ld	a,e
   7E4E 95            [ 4] 2262 	sub	a, l
   7E4F 5F            [ 4] 2263 	ld	e,a
   7E50 7A            [ 4] 2264 	ld	a,d
   7E51 9C            [ 4] 2265 	sbc	a, h
   7E52 57            [ 4] 2266 	ld	d,a
   7E53 C5            [11] 2267 	push	bc
   7E54 D5            [11] 2268 	push	de
   7E55 CD 92 4B      [17] 2269 	call	_abs
   7E58 F1            [10] 2270 	pop	af
   7E59 C1            [10] 2271 	pop	bc
   7E5A DD 75 FC      [19] 2272 	ld	-4 (ix),l
                           2273 ;src/main.c:474: u8 dify = abs(enemy->y - prota.y);
   7E5D 21 01 00      [10] 2274 	ld	hl,#0x0001
   7E60 09            [11] 2275 	add	hl,bc
   7E61 DD 75 FD      [19] 2276 	ld	-3 (ix),l
   7E64 DD 74 FE      [19] 2277 	ld	-2 (ix),h
   7E67 DD 6E FD      [19] 2278 	ld	l,-3 (ix)
   7E6A DD 66 FE      [19] 2279 	ld	h,-2 (ix)
   7E6D 5E            [ 7] 2280 	ld	e,(hl)
   7E6E 16 00         [ 7] 2281 	ld	d,#0x00
   7E70 21 D7 69      [10] 2282 	ld	hl,#_prota+1
   7E73 6E            [ 7] 2283 	ld	l,(hl)
   7E74 26 00         [ 7] 2284 	ld	h,#0x00
   7E76 7B            [ 4] 2285 	ld	a,e
   7E77 95            [ 4] 2286 	sub	a, l
   7E78 5F            [ 4] 2287 	ld	e,a
   7E79 7A            [ 4] 2288 	ld	a,d
   7E7A 9C            [ 4] 2289 	sbc	a, h
   7E7B 57            [ 4] 2290 	ld	d,a
   7E7C C5            [11] 2291 	push	bc
   7E7D D5            [11] 2292 	push	de
   7E7E CD 92 4B      [17] 2293 	call	_abs
   7E81 F1            [10] 2294 	pop	af
   7E82 C1            [10] 2295 	pop	bc
                           2296 ;src/main.c:475: u8 dist = difx + dify; // manhattan
   7E83 DD 7E FC      [19] 2297 	ld	a,-4 (ix)
   7E86 85            [ 4] 2298 	add	a, l
   7E87 57            [ 4] 2299 	ld	d,a
                           2300 ;src/main.c:477: if (enemy->y == dy) { // alineado en el eje y
   7E88 DD 6E FD      [19] 2301 	ld	l,-3 (ix)
   7E8B DD 66 FE      [19] 2302 	ld	h,-2 (ix)
   7E8E 5E            [ 7] 2303 	ld	e,(hl)
                           2304 ;src/main.c:479: if (dist > 20) {
   7E8F 3E 14         [ 7] 2305 	ld	a,#0x14
   7E91 92            [ 4] 2306 	sub	a, d
   7E92 3E 00         [ 7] 2307 	ld	a,#0x00
   7E94 17            [ 4] 2308 	rla
   7E95 DD 77 FF      [19] 2309 	ld	-1 (ix),a
                           2310 ;src/main.c:477: if (enemy->y == dy) { // alineado en el eje y
   7E98 DD 7E 07      [19] 2311 	ld	a,7 (ix)
   7E9B 93            [ 4] 2312 	sub	a, e
   7E9C C2 CA 7F      [10] 2313 	jp	NZ,00173$
                           2314 ;src/main.c:479: if (dist > 20) {
   7E9F DD 7E FF      [19] 2315 	ld	a,-1 (ix)
   7EA2 B7            [ 4] 2316 	or	a, a
   7EA3 CA 6B 82      [10] 2317 	jp	Z,00175$
                           2318 ;src/main.c:480: if (dx < enemy->x) {
   7EA6 0A            [ 7] 2319 	ld	a,(bc)
   7EA7 57            [ 4] 2320 	ld	d,a
   7EA8 DD 7E 06      [19] 2321 	ld	a,6 (ix)
   7EAB 92            [ 4] 2322 	sub	a, d
   7EAC D2 6B 82      [10] 2323 	jp	NC,00175$
                           2324 ;src/main.c:481: if(*getTilePtr(enemy->x - 1, enemy->y) <= 2
   7EAF 15            [ 4] 2325 	dec	d
   7EB0 C5            [11] 2326 	push	bc
   7EB1 7B            [ 4] 2327 	ld	a,e
   7EB2 F5            [11] 2328 	push	af
   7EB3 33            [ 6] 2329 	inc	sp
   7EB4 D5            [11] 2330 	push	de
   7EB5 33            [ 6] 2331 	inc	sp
   7EB6 CD 7E 73      [17] 2332 	call	_getTilePtr
   7EB9 F1            [10] 2333 	pop	af
   7EBA C1            [10] 2334 	pop	bc
   7EBB 5E            [ 7] 2335 	ld	e,(hl)
   7EBC 3E 02         [ 7] 2336 	ld	a,#0x02
   7EBE 93            [ 4] 2337 	sub	a, e
   7EBF 38 42         [12] 2338 	jr	C,00115$
                           2339 ;src/main.c:482: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   7EC1 DD 6E FD      [19] 2340 	ld	l,-3 (ix)
   7EC4 DD 66 FE      [19] 2341 	ld	h,-2 (ix)
   7EC7 7E            [ 7] 2342 	ld	a,(hl)
   7EC8 C6 0B         [ 7] 2343 	add	a, #0x0B
   7ECA 57            [ 4] 2344 	ld	d,a
   7ECB 0A            [ 7] 2345 	ld	a,(bc)
   7ECC C6 FF         [ 7] 2346 	add	a,#0xFF
   7ECE C5            [11] 2347 	push	bc
   7ECF D5            [11] 2348 	push	de
   7ED0 33            [ 6] 2349 	inc	sp
   7ED1 F5            [11] 2350 	push	af
   7ED2 33            [ 6] 2351 	inc	sp
   7ED3 CD 7E 73      [17] 2352 	call	_getTilePtr
   7ED6 F1            [10] 2353 	pop	af
   7ED7 C1            [10] 2354 	pop	bc
   7ED8 5E            [ 7] 2355 	ld	e,(hl)
   7ED9 3E 02         [ 7] 2356 	ld	a,#0x02
   7EDB 93            [ 4] 2357 	sub	a, e
   7EDC 38 25         [12] 2358 	jr	C,00115$
                           2359 ;src/main.c:483: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   7EDE DD 6E FD      [19] 2360 	ld	l,-3 (ix)
   7EE1 DD 66 FE      [19] 2361 	ld	h,-2 (ix)
   7EE4 7E            [ 7] 2362 	ld	a,(hl)
   7EE5 C6 16         [ 7] 2363 	add	a, #0x16
   7EE7 57            [ 4] 2364 	ld	d,a
   7EE8 0A            [ 7] 2365 	ld	a,(bc)
   7EE9 C6 FF         [ 7] 2366 	add	a,#0xFF
   7EEB C5            [11] 2367 	push	bc
   7EEC D5            [11] 2368 	push	de
   7EED 33            [ 6] 2369 	inc	sp
   7EEE F5            [11] 2370 	push	af
   7EEF 33            [ 6] 2371 	inc	sp
   7EF0 CD 7E 73      [17] 2372 	call	_getTilePtr
   7EF3 F1            [10] 2373 	pop	af
   7EF4 C1            [10] 2374 	pop	bc
   7EF5 5E            [ 7] 2375 	ld	e,(hl)
   7EF6 3E 02         [ 7] 2376 	ld	a,#0x02
   7EF8 93            [ 4] 2377 	sub	a, e
   7EF9 38 08         [12] 2378 	jr	C,00115$
                           2379 ;src/main.c:484: moverEnemigoIzquierda(enemy);
   7EFB C5            [11] 2380 	push	bc
   7EFC CD D7 7A      [17] 2381 	call	_moverEnemigoIzquierda
   7EFF F1            [10] 2382 	pop	af
   7F00 C3 6B 82      [10] 2383 	jp	00175$
   7F03                    2384 00115$:
                           2385 ;src/main.c:486: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   7F03 DD 6E FD      [19] 2386 	ld	l,-3 (ix)
   7F06 DD 66 FE      [19] 2387 	ld	h,-2 (ix)
   7F09 5E            [ 7] 2388 	ld	e,(hl)
                           2389 ;src/main.c:473: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7F0A 0A            [ 7] 2390 	ld	a,(bc)
   7F0B 57            [ 4] 2391 	ld	d,a
                           2392 ;src/main.c:486: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   7F0C 3E 70         [ 7] 2393 	ld	a,#0x70
   7F0E 93            [ 4] 2394 	sub	a, e
   7F0F 30 5E         [12] 2395 	jr	NC,00112$
                           2396 ;src/main.c:487: if(*getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7F11 7B            [ 4] 2397 	ld	a,e
   7F12 C6 18         [ 7] 2398 	add	a, #0x18
   7F14 67            [ 4] 2399 	ld	h,a
   7F15 C5            [11] 2400 	push	bc
   7F16 E5            [11] 2401 	push	hl
   7F17 33            [ 6] 2402 	inc	sp
   7F18 D5            [11] 2403 	push	de
   7F19 33            [ 6] 2404 	inc	sp
   7F1A CD 7E 73      [17] 2405 	call	_getTilePtr
   7F1D F1            [10] 2406 	pop	af
   7F1E C1            [10] 2407 	pop	bc
   7F1F 5E            [ 7] 2408 	ld	e,(hl)
   7F20 3E 02         [ 7] 2409 	ld	a,#0x02
   7F22 93            [ 4] 2410 	sub	a, e
   7F23 38 42         [12] 2411 	jr	C,00102$
                           2412 ;src/main.c:488: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7F25 DD 6E FD      [19] 2413 	ld	l,-3 (ix)
   7F28 DD 66 FE      [19] 2414 	ld	h,-2 (ix)
   7F2B 7E            [ 7] 2415 	ld	a,(hl)
   7F2C C6 18         [ 7] 2416 	add	a, #0x18
   7F2E 57            [ 4] 2417 	ld	d,a
   7F2F 0A            [ 7] 2418 	ld	a,(bc)
   7F30 C6 02         [ 7] 2419 	add	a, #0x02
   7F32 C5            [11] 2420 	push	bc
   7F33 D5            [11] 2421 	push	de
   7F34 33            [ 6] 2422 	inc	sp
   7F35 F5            [11] 2423 	push	af
   7F36 33            [ 6] 2424 	inc	sp
   7F37 CD 7E 73      [17] 2425 	call	_getTilePtr
   7F3A F1            [10] 2426 	pop	af
   7F3B C1            [10] 2427 	pop	bc
   7F3C 5E            [ 7] 2428 	ld	e,(hl)
   7F3D 3E 02         [ 7] 2429 	ld	a,#0x02
   7F3F 93            [ 4] 2430 	sub	a, e
   7F40 38 25         [12] 2431 	jr	C,00102$
                           2432 ;src/main.c:489: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   7F42 DD 6E FD      [19] 2433 	ld	l,-3 (ix)
   7F45 DD 66 FE      [19] 2434 	ld	h,-2 (ix)
   7F48 7E            [ 7] 2435 	ld	a,(hl)
   7F49 C6 18         [ 7] 2436 	add	a, #0x18
   7F4B 57            [ 4] 2437 	ld	d,a
   7F4C 0A            [ 7] 2438 	ld	a,(bc)
   7F4D C6 04         [ 7] 2439 	add	a, #0x04
   7F4F C5            [11] 2440 	push	bc
   7F50 D5            [11] 2441 	push	de
   7F51 33            [ 6] 2442 	inc	sp
   7F52 F5            [11] 2443 	push	af
   7F53 33            [ 6] 2444 	inc	sp
   7F54 CD 7E 73      [17] 2445 	call	_getTilePtr
   7F57 F1            [10] 2446 	pop	af
   7F58 C1            [10] 2447 	pop	bc
   7F59 5E            [ 7] 2448 	ld	e,(hl)
   7F5A 3E 02         [ 7] 2449 	ld	a,#0x02
   7F5C 93            [ 4] 2450 	sub	a, e
   7F5D 38 08         [12] 2451 	jr	C,00102$
                           2452 ;src/main.c:490: moverEnemigoAbajo(enemy);
   7F5F C5            [11] 2453 	push	bc
   7F60 CD A8 7A      [17] 2454 	call	_moverEnemigoAbajo
   7F63 F1            [10] 2455 	pop	af
   7F64 C3 6B 82      [10] 2456 	jp	00175$
   7F67                    2457 00102$:
                           2458 ;src/main.c:492: moverEnemigoArriba(enemy);
   7F67 C5            [11] 2459 	push	bc
   7F68 CD 89 7A      [17] 2460 	call	_moverEnemigoArriba
   7F6B F1            [10] 2461 	pop	af
   7F6C C3 6B 82      [10] 2462 	jp	00175$
   7F6F                    2463 00112$:
                           2464 ;src/main.c:494: if(*getTilePtr(enemy->x, enemy->y - 2) <= 2
   7F6F 63            [ 4] 2465 	ld	h,e
   7F70 25            [ 4] 2466 	dec	h
   7F71 25            [ 4] 2467 	dec	h
   7F72 C5            [11] 2468 	push	bc
   7F73 E5            [11] 2469 	push	hl
   7F74 33            [ 6] 2470 	inc	sp
   7F75 D5            [11] 2471 	push	de
   7F76 33            [ 6] 2472 	inc	sp
   7F77 CD 7E 73      [17] 2473 	call	_getTilePtr
   7F7A F1            [10] 2474 	pop	af
   7F7B C1            [10] 2475 	pop	bc
   7F7C 5E            [ 7] 2476 	ld	e,(hl)
   7F7D 3E 02         [ 7] 2477 	ld	a,#0x02
   7F7F 93            [ 4] 2478 	sub	a, e
   7F80 38 40         [12] 2479 	jr	C,00107$
                           2480 ;src/main.c:495: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7F82 DD 6E FD      [19] 2481 	ld	l,-3 (ix)
   7F85 DD 66 FE      [19] 2482 	ld	h,-2 (ix)
   7F88 56            [ 7] 2483 	ld	d,(hl)
   7F89 15            [ 4] 2484 	dec	d
   7F8A 15            [ 4] 2485 	dec	d
   7F8B 0A            [ 7] 2486 	ld	a,(bc)
   7F8C C6 02         [ 7] 2487 	add	a, #0x02
   7F8E C5            [11] 2488 	push	bc
   7F8F D5            [11] 2489 	push	de
   7F90 33            [ 6] 2490 	inc	sp
   7F91 F5            [11] 2491 	push	af
   7F92 33            [ 6] 2492 	inc	sp
   7F93 CD 7E 73      [17] 2493 	call	_getTilePtr
   7F96 F1            [10] 2494 	pop	af
   7F97 C1            [10] 2495 	pop	bc
   7F98 5E            [ 7] 2496 	ld	e,(hl)
   7F99 3E 02         [ 7] 2497 	ld	a,#0x02
   7F9B 93            [ 4] 2498 	sub	a, e
   7F9C 38 24         [12] 2499 	jr	C,00107$
                           2500 ;src/main.c:496: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   7F9E DD 6E FD      [19] 2501 	ld	l,-3 (ix)
   7FA1 DD 66 FE      [19] 2502 	ld	h,-2 (ix)
   7FA4 56            [ 7] 2503 	ld	d,(hl)
   7FA5 15            [ 4] 2504 	dec	d
   7FA6 15            [ 4] 2505 	dec	d
   7FA7 0A            [ 7] 2506 	ld	a,(bc)
   7FA8 C6 04         [ 7] 2507 	add	a, #0x04
   7FAA C5            [11] 2508 	push	bc
   7FAB D5            [11] 2509 	push	de
   7FAC 33            [ 6] 2510 	inc	sp
   7FAD F5            [11] 2511 	push	af
   7FAE 33            [ 6] 2512 	inc	sp
   7FAF CD 7E 73      [17] 2513 	call	_getTilePtr
   7FB2 F1            [10] 2514 	pop	af
   7FB3 C1            [10] 2515 	pop	bc
   7FB4 5E            [ 7] 2516 	ld	e,(hl)
   7FB5 3E 02         [ 7] 2517 	ld	a,#0x02
   7FB7 93            [ 4] 2518 	sub	a, e
   7FB8 38 08         [12] 2519 	jr	C,00107$
                           2520 ;src/main.c:497: moverEnemigoArriba(enemy);
   7FBA C5            [11] 2521 	push	bc
   7FBB CD 89 7A      [17] 2522 	call	_moverEnemigoArriba
   7FBE F1            [10] 2523 	pop	af
   7FBF C3 6B 82      [10] 2524 	jp	00175$
   7FC2                    2525 00107$:
                           2526 ;src/main.c:499: moverEnemigoAbajo(enemy);
   7FC2 C5            [11] 2527 	push	bc
   7FC3 CD A8 7A      [17] 2528 	call	_moverEnemigoAbajo
   7FC6 F1            [10] 2529 	pop	af
   7FC7 C3 6B 82      [10] 2530 	jp	00175$
   7FCA                    2531 00173$:
                           2532 ;src/main.c:505: else if (enemy->x == dx) {
   7FCA 0A            [ 7] 2533 	ld	a,(bc)
   7FCB 57            [ 4] 2534 	ld	d,a
   7FCC DD 7E 06      [19] 2535 	ld	a,6 (ix)
   7FCF 92            [ 4] 2536 	sub	a, d
   7FD0 C2 FC 80      [10] 2537 	jp	NZ,00170$
                           2538 ;src/main.c:507: if (dist > 20) {
   7FD3 DD 7E FF      [19] 2539 	ld	a,-1 (ix)
   7FD6 B7            [ 4] 2540 	or	a, a
   7FD7 CA 6B 82      [10] 2541 	jp	Z,00175$
                           2542 ;src/main.c:508: if (dy < enemy->y) {
   7FDA DD 7E 07      [19] 2543 	ld	a,7 (ix)
   7FDD 93            [ 4] 2544 	sub	a, e
   7FDE D2 6B 82      [10] 2545 	jp	NC,00175$
                           2546 ;src/main.c:509: if(*getTilePtr(enemy->x, enemy->y - 2) <= 2
   7FE1 63            [ 4] 2547 	ld	h,e
   7FE2 25            [ 4] 2548 	dec	h
   7FE3 25            [ 4] 2549 	dec	h
   7FE4 C5            [11] 2550 	push	bc
   7FE5 E5            [11] 2551 	push	hl
   7FE6 33            [ 6] 2552 	inc	sp
   7FE7 D5            [11] 2553 	push	de
   7FE8 33            [ 6] 2554 	inc	sp
   7FE9 CD 7E 73      [17] 2555 	call	_getTilePtr
   7FEC F1            [10] 2556 	pop	af
   7FED C1            [10] 2557 	pop	bc
   7FEE 5E            [ 7] 2558 	ld	e,(hl)
   7FEF 3E 02         [ 7] 2559 	ld	a,#0x02
   7FF1 93            [ 4] 2560 	sub	a, e
   7FF2 38 40         [12] 2561 	jr	C,00137$
                           2562 ;src/main.c:510: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7FF4 DD 6E FD      [19] 2563 	ld	l,-3 (ix)
   7FF7 DD 66 FE      [19] 2564 	ld	h,-2 (ix)
   7FFA 56            [ 7] 2565 	ld	d,(hl)
   7FFB 15            [ 4] 2566 	dec	d
   7FFC 15            [ 4] 2567 	dec	d
   7FFD 0A            [ 7] 2568 	ld	a,(bc)
   7FFE C6 02         [ 7] 2569 	add	a, #0x02
   8000 C5            [11] 2570 	push	bc
   8001 D5            [11] 2571 	push	de
   8002 33            [ 6] 2572 	inc	sp
   8003 F5            [11] 2573 	push	af
   8004 33            [ 6] 2574 	inc	sp
   8005 CD 7E 73      [17] 2575 	call	_getTilePtr
   8008 F1            [10] 2576 	pop	af
   8009 C1            [10] 2577 	pop	bc
   800A 5E            [ 7] 2578 	ld	e,(hl)
   800B 3E 02         [ 7] 2579 	ld	a,#0x02
   800D 93            [ 4] 2580 	sub	a, e
   800E 38 24         [12] 2581 	jr	C,00137$
                           2582 ;src/main.c:511: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   8010 DD 6E FD      [19] 2583 	ld	l,-3 (ix)
   8013 DD 66 FE      [19] 2584 	ld	h,-2 (ix)
   8016 56            [ 7] 2585 	ld	d,(hl)
   8017 15            [ 4] 2586 	dec	d
   8018 15            [ 4] 2587 	dec	d
   8019 0A            [ 7] 2588 	ld	a,(bc)
   801A C6 04         [ 7] 2589 	add	a, #0x04
   801C C5            [11] 2590 	push	bc
   801D D5            [11] 2591 	push	de
   801E 33            [ 6] 2592 	inc	sp
   801F F5            [11] 2593 	push	af
   8020 33            [ 6] 2594 	inc	sp
   8021 CD 7E 73      [17] 2595 	call	_getTilePtr
   8024 F1            [10] 2596 	pop	af
   8025 C1            [10] 2597 	pop	bc
   8026 5E            [ 7] 2598 	ld	e,(hl)
   8027 3E 02         [ 7] 2599 	ld	a,#0x02
   8029 93            [ 4] 2600 	sub	a, e
   802A 38 08         [12] 2601 	jr	C,00137$
                           2602 ;src/main.c:512: moverEnemigoArriba(enemy);
   802C C5            [11] 2603 	push	bc
   802D CD 89 7A      [17] 2604 	call	_moverEnemigoArriba
   8030 F1            [10] 2605 	pop	af
   8031 C3 6B 82      [10] 2606 	jp	00175$
   8034                    2607 00137$:
                           2608 ;src/main.c:514: if (enemy->x < ANCHO_PANTALLA/2) {
   8034 0A            [ 7] 2609 	ld	a,(bc)
   8035 5F            [ 4] 2610 	ld	e,a
                           2611 ;src/main.c:474: u8 dify = abs(enemy->y - prota.y);
   8036 DD 6E FD      [19] 2612 	ld	l,-3 (ix)
   8039 DD 66 FE      [19] 2613 	ld	h,-2 (ix)
   803C 66            [ 7] 2614 	ld	h,(hl)
                           2615 ;src/main.c:514: if (enemy->x < ANCHO_PANTALLA/2) {
   803D 7B            [ 4] 2616 	ld	a,e
   803E D6 28         [ 7] 2617 	sub	a, #0x28
   8040 30 5C         [12] 2618 	jr	NC,00134$
                           2619 ;src/main.c:515: if(*getTilePtr(enemy->x - 1, enemy->y) <= 2
   8042 53            [ 4] 2620 	ld	d,e
   8043 15            [ 4] 2621 	dec	d
   8044 C5            [11] 2622 	push	bc
   8045 E5            [11] 2623 	push	hl
   8046 33            [ 6] 2624 	inc	sp
   8047 D5            [11] 2625 	push	de
   8048 33            [ 6] 2626 	inc	sp
   8049 CD 7E 73      [17] 2627 	call	_getTilePtr
   804C F1            [10] 2628 	pop	af
   804D C1            [10] 2629 	pop	bc
   804E 5E            [ 7] 2630 	ld	e,(hl)
   804F 3E 02         [ 7] 2631 	ld	a,#0x02
   8051 93            [ 4] 2632 	sub	a, e
   8052 38 42         [12] 2633 	jr	C,00124$
                           2634 ;src/main.c:516: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   8054 DD 6E FD      [19] 2635 	ld	l,-3 (ix)
   8057 DD 66 FE      [19] 2636 	ld	h,-2 (ix)
   805A 7E            [ 7] 2637 	ld	a,(hl)
   805B C6 0B         [ 7] 2638 	add	a, #0x0B
   805D 57            [ 4] 2639 	ld	d,a
   805E 0A            [ 7] 2640 	ld	a,(bc)
   805F C6 FF         [ 7] 2641 	add	a,#0xFF
   8061 C5            [11] 2642 	push	bc
   8062 D5            [11] 2643 	push	de
   8063 33            [ 6] 2644 	inc	sp
   8064 F5            [11] 2645 	push	af
   8065 33            [ 6] 2646 	inc	sp
   8066 CD 7E 73      [17] 2647 	call	_getTilePtr
   8069 F1            [10] 2648 	pop	af
   806A C1            [10] 2649 	pop	bc
   806B 5E            [ 7] 2650 	ld	e,(hl)
   806C 3E 02         [ 7] 2651 	ld	a,#0x02
   806E 93            [ 4] 2652 	sub	a, e
   806F 38 25         [12] 2653 	jr	C,00124$
                           2654 ;src/main.c:517: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   8071 DD 6E FD      [19] 2655 	ld	l,-3 (ix)
   8074 DD 66 FE      [19] 2656 	ld	h,-2 (ix)
   8077 7E            [ 7] 2657 	ld	a,(hl)
   8078 C6 16         [ 7] 2658 	add	a, #0x16
   807A 57            [ 4] 2659 	ld	d,a
   807B 0A            [ 7] 2660 	ld	a,(bc)
   807C C6 FF         [ 7] 2661 	add	a,#0xFF
   807E C5            [11] 2662 	push	bc
   807F D5            [11] 2663 	push	de
   8080 33            [ 6] 2664 	inc	sp
   8081 F5            [11] 2665 	push	af
   8082 33            [ 6] 2666 	inc	sp
   8083 CD 7E 73      [17] 2667 	call	_getTilePtr
   8086 F1            [10] 2668 	pop	af
   8087 C1            [10] 2669 	pop	bc
   8088 5E            [ 7] 2670 	ld	e,(hl)
   8089 3E 02         [ 7] 2671 	ld	a,#0x02
   808B 93            [ 4] 2672 	sub	a, e
   808C 38 08         [12] 2673 	jr	C,00124$
                           2674 ;src/main.c:518: moverEnemigoIzquierda(enemy);
   808E C5            [11] 2675 	push	bc
   808F CD D7 7A      [17] 2676 	call	_moverEnemigoIzquierda
   8092 F1            [10] 2677 	pop	af
   8093 C3 6B 82      [10] 2678 	jp	00175$
   8096                    2679 00124$:
                           2680 ;src/main.c:520: moverEnemigoDerecha(enemy);
   8096 C5            [11] 2681 	push	bc
   8097 CD C7 7A      [17] 2682 	call	_moverEnemigoDerecha
   809A F1            [10] 2683 	pop	af
   809B C3 6B 82      [10] 2684 	jp	00175$
   809E                    2685 00134$:
                           2686 ;src/main.c:522: if(*getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   809E 7B            [ 4] 2687 	ld	a,e
   809F C6 05         [ 7] 2688 	add	a, #0x05
   80A1 57            [ 4] 2689 	ld	d,a
   80A2 C5            [11] 2690 	push	bc
   80A3 E5            [11] 2691 	push	hl
   80A4 33            [ 6] 2692 	inc	sp
   80A5 D5            [11] 2693 	push	de
   80A6 33            [ 6] 2694 	inc	sp
   80A7 CD 7E 73      [17] 2695 	call	_getTilePtr
   80AA F1            [10] 2696 	pop	af
   80AB C1            [10] 2697 	pop	bc
   80AC 5E            [ 7] 2698 	ld	e,(hl)
   80AD 3E 02         [ 7] 2699 	ld	a,#0x02
   80AF 93            [ 4] 2700 	sub	a, e
   80B0 38 42         [12] 2701 	jr	C,00129$
                           2702 ;src/main.c:523: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   80B2 DD 6E FD      [19] 2703 	ld	l,-3 (ix)
   80B5 DD 66 FE      [19] 2704 	ld	h,-2 (ix)
   80B8 7E            [ 7] 2705 	ld	a,(hl)
   80B9 C6 0B         [ 7] 2706 	add	a, #0x0B
   80BB 57            [ 4] 2707 	ld	d,a
   80BC 0A            [ 7] 2708 	ld	a,(bc)
   80BD C6 05         [ 7] 2709 	add	a, #0x05
   80BF C5            [11] 2710 	push	bc
   80C0 D5            [11] 2711 	push	de
   80C1 33            [ 6] 2712 	inc	sp
   80C2 F5            [11] 2713 	push	af
   80C3 33            [ 6] 2714 	inc	sp
   80C4 CD 7E 73      [17] 2715 	call	_getTilePtr
   80C7 F1            [10] 2716 	pop	af
   80C8 C1            [10] 2717 	pop	bc
   80C9 5E            [ 7] 2718 	ld	e,(hl)
   80CA 3E 02         [ 7] 2719 	ld	a,#0x02
   80CC 93            [ 4] 2720 	sub	a, e
   80CD 38 25         [12] 2721 	jr	C,00129$
                           2722 ;src/main.c:524: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   80CF DD 6E FD      [19] 2723 	ld	l,-3 (ix)
   80D2 DD 66 FE      [19] 2724 	ld	h,-2 (ix)
   80D5 7E            [ 7] 2725 	ld	a,(hl)
   80D6 C6 16         [ 7] 2726 	add	a, #0x16
   80D8 57            [ 4] 2727 	ld	d,a
   80D9 0A            [ 7] 2728 	ld	a,(bc)
   80DA C6 05         [ 7] 2729 	add	a, #0x05
   80DC C5            [11] 2730 	push	bc
   80DD D5            [11] 2731 	push	de
   80DE 33            [ 6] 2732 	inc	sp
   80DF F5            [11] 2733 	push	af
   80E0 33            [ 6] 2734 	inc	sp
   80E1 CD 7E 73      [17] 2735 	call	_getTilePtr
   80E4 F1            [10] 2736 	pop	af
   80E5 C1            [10] 2737 	pop	bc
   80E6 5E            [ 7] 2738 	ld	e,(hl)
   80E7 3E 02         [ 7] 2739 	ld	a,#0x02
   80E9 93            [ 4] 2740 	sub	a, e
   80EA 38 08         [12] 2741 	jr	C,00129$
                           2742 ;src/main.c:525: moverEnemigoDerecha(enemy);
   80EC C5            [11] 2743 	push	bc
   80ED CD C7 7A      [17] 2744 	call	_moverEnemigoDerecha
   80F0 F1            [10] 2745 	pop	af
   80F1 C3 6B 82      [10] 2746 	jp	00175$
   80F4                    2747 00129$:
                           2748 ;src/main.c:527: moverEnemigoIzquierda(enemy);
   80F4 C5            [11] 2749 	push	bc
   80F5 CD D7 7A      [17] 2750 	call	_moverEnemigoIzquierda
   80F8 F1            [10] 2751 	pop	af
   80F9 C3 6B 82      [10] 2752 	jp	00175$
   80FC                    2753 00170$:
                           2754 ;src/main.c:534: if (dist > 20) {
   80FC DD 7E FF      [19] 2755 	ld	a,-1 (ix)
   80FF B7            [ 4] 2756 	or	a, a
   8100 CA 6B 82      [10] 2757 	jp	Z,00175$
                           2758 ;src/main.c:535: if (dx < enemy->x) {
   8103 DD 7E 06      [19] 2759 	ld	a,6 (ix)
   8106 92            [ 4] 2760 	sub	a, d
   8107 30 57         [12] 2761 	jr	NC,00154$
                           2762 ;src/main.c:536: if(*getTilePtr(enemy->x - 1, enemy->y) <= 2
   8109 15            [ 4] 2763 	dec	d
   810A C5            [11] 2764 	push	bc
   810B 7B            [ 4] 2765 	ld	a,e
   810C F5            [11] 2766 	push	af
   810D 33            [ 6] 2767 	inc	sp
   810E D5            [11] 2768 	push	de
   810F 33            [ 6] 2769 	inc	sp
   8110 CD 7E 73      [17] 2770 	call	_getTilePtr
   8113 F1            [10] 2771 	pop	af
   8114 C1            [10] 2772 	pop	bc
   8115 5E            [ 7] 2773 	ld	e,(hl)
   8116 3E 02         [ 7] 2774 	ld	a,#0x02
   8118 93            [ 4] 2775 	sub	a, e
   8119 DA B6 81      [10] 2776 	jp	C,00155$
                           2777 ;src/main.c:537: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   811C DD 6E FD      [19] 2778 	ld	l,-3 (ix)
   811F DD 66 FE      [19] 2779 	ld	h,-2 (ix)
   8122 7E            [ 7] 2780 	ld	a,(hl)
   8123 C6 0B         [ 7] 2781 	add	a, #0x0B
   8125 57            [ 4] 2782 	ld	d,a
   8126 0A            [ 7] 2783 	ld	a,(bc)
   8127 C6 FF         [ 7] 2784 	add	a,#0xFF
   8129 C5            [11] 2785 	push	bc
   812A D5            [11] 2786 	push	de
   812B 33            [ 6] 2787 	inc	sp
   812C F5            [11] 2788 	push	af
   812D 33            [ 6] 2789 	inc	sp
   812E CD 7E 73      [17] 2790 	call	_getTilePtr
   8131 F1            [10] 2791 	pop	af
   8132 C1            [10] 2792 	pop	bc
   8133 5E            [ 7] 2793 	ld	e,(hl)
   8134 3E 02         [ 7] 2794 	ld	a,#0x02
   8136 93            [ 4] 2795 	sub	a, e
   8137 DA B6 81      [10] 2796 	jp	C,00155$
                           2797 ;src/main.c:538: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   813A DD 6E FD      [19] 2798 	ld	l,-3 (ix)
   813D DD 66 FE      [19] 2799 	ld	h,-2 (ix)
   8140 7E            [ 7] 2800 	ld	a,(hl)
   8141 C6 16         [ 7] 2801 	add	a, #0x16
   8143 57            [ 4] 2802 	ld	d,a
   8144 0A            [ 7] 2803 	ld	a,(bc)
   8145 C6 FF         [ 7] 2804 	add	a,#0xFF
   8147 C5            [11] 2805 	push	bc
   8148 D5            [11] 2806 	push	de
   8149 33            [ 6] 2807 	inc	sp
   814A F5            [11] 2808 	push	af
   814B 33            [ 6] 2809 	inc	sp
   814C CD 7E 73      [17] 2810 	call	_getTilePtr
   814F F1            [10] 2811 	pop	af
   8150 C1            [10] 2812 	pop	bc
   8151 5E            [ 7] 2813 	ld	e,(hl)
   8152 3E 02         [ 7] 2814 	ld	a,#0x02
   8154 93            [ 4] 2815 	sub	a, e
   8155 38 5F         [12] 2816 	jr	C,00155$
                           2817 ;src/main.c:539: moverEnemigoIzquierda(enemy);
   8157 C5            [11] 2818 	push	bc
   8158 C5            [11] 2819 	push	bc
   8159 CD D7 7A      [17] 2820 	call	_moverEnemigoIzquierda
   815C F1            [10] 2821 	pop	af
   815D C1            [10] 2822 	pop	bc
   815E 18 56         [12] 2823 	jr	00155$
   8160                    2824 00154$:
                           2825 ;src/main.c:542: if(*getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   8160 7A            [ 4] 2826 	ld	a,d
   8161 C6 05         [ 7] 2827 	add	a, #0x05
   8163 57            [ 4] 2828 	ld	d,a
   8164 C5            [11] 2829 	push	bc
   8165 7B            [ 4] 2830 	ld	a,e
   8166 F5            [11] 2831 	push	af
   8167 33            [ 6] 2832 	inc	sp
   8168 D5            [11] 2833 	push	de
   8169 33            [ 6] 2834 	inc	sp
   816A CD 7E 73      [17] 2835 	call	_getTilePtr
   816D F1            [10] 2836 	pop	af
   816E C1            [10] 2837 	pop	bc
   816F 5E            [ 7] 2838 	ld	e,(hl)
   8170 3E 02         [ 7] 2839 	ld	a,#0x02
   8172 93            [ 4] 2840 	sub	a, e
   8173 38 41         [12] 2841 	jr	C,00155$
                           2842 ;src/main.c:543: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   8175 DD 6E FD      [19] 2843 	ld	l,-3 (ix)
   8178 DD 66 FE      [19] 2844 	ld	h,-2 (ix)
   817B 7E            [ 7] 2845 	ld	a,(hl)
   817C C6 0B         [ 7] 2846 	add	a, #0x0B
   817E 57            [ 4] 2847 	ld	d,a
   817F 0A            [ 7] 2848 	ld	a,(bc)
   8180 C6 05         [ 7] 2849 	add	a, #0x05
   8182 C5            [11] 2850 	push	bc
   8183 D5            [11] 2851 	push	de
   8184 33            [ 6] 2852 	inc	sp
   8185 F5            [11] 2853 	push	af
   8186 33            [ 6] 2854 	inc	sp
   8187 CD 7E 73      [17] 2855 	call	_getTilePtr
   818A F1            [10] 2856 	pop	af
   818B C1            [10] 2857 	pop	bc
   818C 5E            [ 7] 2858 	ld	e,(hl)
   818D 3E 02         [ 7] 2859 	ld	a,#0x02
   818F 93            [ 4] 2860 	sub	a, e
   8190 38 24         [12] 2861 	jr	C,00155$
                           2862 ;src/main.c:544: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   8192 DD 6E FD      [19] 2863 	ld	l,-3 (ix)
   8195 DD 66 FE      [19] 2864 	ld	h,-2 (ix)
   8198 7E            [ 7] 2865 	ld	a,(hl)
   8199 C6 16         [ 7] 2866 	add	a, #0x16
   819B 57            [ 4] 2867 	ld	d,a
   819C 0A            [ 7] 2868 	ld	a,(bc)
   819D C6 05         [ 7] 2869 	add	a, #0x05
   819F C5            [11] 2870 	push	bc
   81A0 D5            [11] 2871 	push	de
   81A1 33            [ 6] 2872 	inc	sp
   81A2 F5            [11] 2873 	push	af
   81A3 33            [ 6] 2874 	inc	sp
   81A4 CD 7E 73      [17] 2875 	call	_getTilePtr
   81A7 F1            [10] 2876 	pop	af
   81A8 C1            [10] 2877 	pop	bc
   81A9 5E            [ 7] 2878 	ld	e,(hl)
   81AA 3E 02         [ 7] 2879 	ld	a,#0x02
   81AC 93            [ 4] 2880 	sub	a, e
   81AD 38 07         [12] 2881 	jr	C,00155$
                           2882 ;src/main.c:545: moverEnemigoDerecha(enemy);
   81AF C5            [11] 2883 	push	bc
   81B0 C5            [11] 2884 	push	bc
   81B1 CD C7 7A      [17] 2885 	call	_moverEnemigoDerecha
   81B4 F1            [10] 2886 	pop	af
   81B5 C1            [10] 2887 	pop	bc
   81B6                    2888 00155$:
                           2889 ;src/main.c:548: if (dy < enemy->y) {
   81B6 DD 6E FD      [19] 2890 	ld	l,-3 (ix)
   81B9 DD 66 FE      [19] 2891 	ld	h,-2 (ix)
   81BC 5E            [ 7] 2892 	ld	e,(hl)
                           2893 ;src/main.c:473: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   81BD 0A            [ 7] 2894 	ld	a,(bc)
   81BE 57            [ 4] 2895 	ld	d,a
                           2896 ;src/main.c:548: if (dy < enemy->y) {
   81BF DD 7E 07      [19] 2897 	ld	a,7 (ix)
   81C2 93            [ 4] 2898 	sub	a, e
   81C3 30 53         [12] 2899 	jr	NC,00165$
                           2900 ;src/main.c:549: if(*getTilePtr(enemy->x, enemy->y - 2) <= 2
   81C5 63            [ 4] 2901 	ld	h,e
   81C6 25            [ 4] 2902 	dec	h
   81C7 25            [ 4] 2903 	dec	h
   81C8 C5            [11] 2904 	push	bc
   81C9 E5            [11] 2905 	push	hl
   81CA 33            [ 6] 2906 	inc	sp
   81CB D5            [11] 2907 	push	de
   81CC 33            [ 6] 2908 	inc	sp
   81CD CD 7E 73      [17] 2909 	call	_getTilePtr
   81D0 F1            [10] 2910 	pop	af
   81D1 C1            [10] 2911 	pop	bc
   81D2 5E            [ 7] 2912 	ld	e,(hl)
   81D3 3E 02         [ 7] 2913 	ld	a,#0x02
   81D5 93            [ 4] 2914 	sub	a, e
   81D6 DA 6B 82      [10] 2915 	jp	C,00175$
                           2916 ;src/main.c:550: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   81D9 DD 6E FD      [19] 2917 	ld	l,-3 (ix)
   81DC DD 66 FE      [19] 2918 	ld	h,-2 (ix)
   81DF 56            [ 7] 2919 	ld	d,(hl)
   81E0 15            [ 4] 2920 	dec	d
   81E1 15            [ 4] 2921 	dec	d
   81E2 0A            [ 7] 2922 	ld	a,(bc)
   81E3 C6 02         [ 7] 2923 	add	a, #0x02
   81E5 C5            [11] 2924 	push	bc
   81E6 D5            [11] 2925 	push	de
   81E7 33            [ 6] 2926 	inc	sp
   81E8 F5            [11] 2927 	push	af
   81E9 33            [ 6] 2928 	inc	sp
   81EA CD 7E 73      [17] 2929 	call	_getTilePtr
   81ED F1            [10] 2930 	pop	af
   81EE C1            [10] 2931 	pop	bc
   81EF 5E            [ 7] 2932 	ld	e,(hl)
   81F0 3E 02         [ 7] 2933 	ld	a,#0x02
   81F2 93            [ 4] 2934 	sub	a, e
   81F3 38 76         [12] 2935 	jr	C,00175$
                           2936 ;src/main.c:551: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   81F5 DD 6E FD      [19] 2937 	ld	l,-3 (ix)
   81F8 DD 66 FE      [19] 2938 	ld	h,-2 (ix)
   81FB 56            [ 7] 2939 	ld	d,(hl)
   81FC 15            [ 4] 2940 	dec	d
   81FD 15            [ 4] 2941 	dec	d
   81FE 0A            [ 7] 2942 	ld	a,(bc)
   81FF C6 04         [ 7] 2943 	add	a, #0x04
   8201 C5            [11] 2944 	push	bc
   8202 D5            [11] 2945 	push	de
   8203 33            [ 6] 2946 	inc	sp
   8204 F5            [11] 2947 	push	af
   8205 33            [ 6] 2948 	inc	sp
   8206 CD 7E 73      [17] 2949 	call	_getTilePtr
   8209 F1            [10] 2950 	pop	af
   820A C1            [10] 2951 	pop	bc
   820B 5E            [ 7] 2952 	ld	e,(hl)
   820C 3E 02         [ 7] 2953 	ld	a,#0x02
   820E 93            [ 4] 2954 	sub	a, e
   820F 38 5A         [12] 2955 	jr	C,00175$
                           2956 ;src/main.c:552: moverEnemigoArriba(enemy);
   8211 C5            [11] 2957 	push	bc
   8212 CD 89 7A      [17] 2958 	call	_moverEnemigoArriba
   8215 F1            [10] 2959 	pop	af
   8216 18 53         [12] 2960 	jr	00175$
   8218                    2961 00165$:
                           2962 ;src/main.c:555: if(*getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   8218 7B            [ 4] 2963 	ld	a,e
   8219 C6 18         [ 7] 2964 	add	a, #0x18
   821B 67            [ 4] 2965 	ld	h,a
   821C C5            [11] 2966 	push	bc
   821D E5            [11] 2967 	push	hl
   821E 33            [ 6] 2968 	inc	sp
   821F D5            [11] 2969 	push	de
   8220 33            [ 6] 2970 	inc	sp
   8221 CD 7E 73      [17] 2971 	call	_getTilePtr
   8224 F1            [10] 2972 	pop	af
   8225 C1            [10] 2973 	pop	bc
   8226 5E            [ 7] 2974 	ld	e,(hl)
   8227 3E 02         [ 7] 2975 	ld	a,#0x02
   8229 93            [ 4] 2976 	sub	a, e
   822A 38 3F         [12] 2977 	jr	C,00175$
                           2978 ;src/main.c:556: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   822C DD 6E FD      [19] 2979 	ld	l,-3 (ix)
   822F DD 66 FE      [19] 2980 	ld	h,-2 (ix)
   8232 7E            [ 7] 2981 	ld	a,(hl)
   8233 C6 18         [ 7] 2982 	add	a, #0x18
   8235 57            [ 4] 2983 	ld	d,a
   8236 0A            [ 7] 2984 	ld	a,(bc)
   8237 C6 02         [ 7] 2985 	add	a, #0x02
   8239 C5            [11] 2986 	push	bc
   823A D5            [11] 2987 	push	de
   823B 33            [ 6] 2988 	inc	sp
   823C F5            [11] 2989 	push	af
   823D 33            [ 6] 2990 	inc	sp
   823E CD 7E 73      [17] 2991 	call	_getTilePtr
   8241 F1            [10] 2992 	pop	af
   8242 C1            [10] 2993 	pop	bc
   8243 5E            [ 7] 2994 	ld	e,(hl)
   8244 3E 02         [ 7] 2995 	ld	a,#0x02
   8246 93            [ 4] 2996 	sub	a, e
   8247 38 22         [12] 2997 	jr	C,00175$
                           2998 ;src/main.c:557: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   8249 DD 6E FD      [19] 2999 	ld	l,-3 (ix)
   824C DD 66 FE      [19] 3000 	ld	h,-2 (ix)
   824F 7E            [ 7] 3001 	ld	a,(hl)
   8250 C6 18         [ 7] 3002 	add	a, #0x18
   8252 57            [ 4] 3003 	ld	d,a
   8253 0A            [ 7] 3004 	ld	a,(bc)
   8254 C6 04         [ 7] 3005 	add	a, #0x04
   8256 C5            [11] 3006 	push	bc
   8257 D5            [11] 3007 	push	de
   8258 33            [ 6] 3008 	inc	sp
   8259 F5            [11] 3009 	push	af
   825A 33            [ 6] 3010 	inc	sp
   825B CD 7E 73      [17] 3011 	call	_getTilePtr
   825E F1            [10] 3012 	pop	af
   825F C1            [10] 3013 	pop	bc
   8260 5E            [ 7] 3014 	ld	e,(hl)
   8261 3E 02         [ 7] 3015 	ld	a,#0x02
   8263 93            [ 4] 3016 	sub	a, e
   8264 38 05         [12] 3017 	jr	C,00175$
                           3018 ;src/main.c:558: moverEnemigoAbajo(enemy);
   8266 C5            [11] 3019 	push	bc
   8267 CD A8 7A      [17] 3020 	call	_moverEnemigoAbajo
   826A F1            [10] 3021 	pop	af
   826B                    3022 00175$:
   826B DD F9         [10] 3023 	ld	sp, ix
   826D DD E1         [14] 3024 	pop	ix
   826F C9            [10] 3025 	ret
                           3026 ;src/main.c:565: void updateEnemies() {
                           3027 ;	---------------------------------
                           3028 ; Function updateEnemies
                           3029 ; ---------------------------------
   8270                    3030 _updateEnemies::
   8270 DD E5         [15] 3031 	push	ix
   8272 DD 21 00 00   [14] 3032 	ld	ix,#0
   8276 DD 39         [15] 3033 	add	ix,sp
   8278 21 FA FF      [10] 3034 	ld	hl,#-6
   827B 39            [11] 3035 	add	hl,sp
   827C F9            [ 6] 3036 	ld	sp,hl
                           3037 ;src/main.c:567: u8 i = 1 + 1;
   827D DD 36 FA 02   [19] 3038 	ld	-6 (ix),#0x02
                           3039 ;src/main.c:570: actual = enemy;
                           3040 ;src/main.c:572: while (--i) {
   8281 DD 36 FC C6   [19] 3041 	ld	-4 (ix),#<(_enemy)
   8285 DD 36 FD 64   [19] 3042 	ld	-3 (ix),#>(_enemy)
   8289 DD 36 FE C6   [19] 3043 	ld	-2 (ix),#<(_enemy)
   828D DD 36 FF 64   [19] 3044 	ld	-1 (ix),#>(_enemy)
   8291                    3045 00121$:
   8291 DD 7E FA      [19] 3046 	ld	a,-6 (ix)
   8294 C6 FF         [ 7] 3047 	add	a,#0xFF
   8296 DD 77 FB      [19] 3048 	ld	-5 (ix), a
   8299 DD 77 FA      [19] 3049 	ld	-6 (ix),a
   829C DD 7E FB      [19] 3050 	ld	a,-5 (ix)
   829F B7            [ 4] 3051 	or	a, a
   82A0 CA 2D 83      [10] 3052 	jp	Z,00124$
                           3053 ;src/main.c:574: actual->inRange = 1;
   82A3 21 D7 64      [10] 3054 	ld	hl,#(_enemy + 0x0011)
   82A6 36 01         [10] 3055 	ld	(hl),#0x01
                           3056 ;src/main.c:575: actual->seen = 1;
   82A8 21 D8 64      [10] 3057 	ld	hl,#(_enemy + 0x0012)
   82AB 36 01         [10] 3058 	ld	(hl),#0x01
                           3059 ;src/main.c:576: if (actual->patrolling) { // esta patrullando
   82AD 3A D1 64      [13] 3060 	ld	a, (#(_enemy + 0x000b) + 0)
   82B0 B7            [ 4] 3061 	or	a, a
   82B1 28 51         [12] 3062 	jr	Z,00119$
                           3063 ;src/main.c:577: if (!actual->seen && !actual->inRange) {
   82B3 21 D8 64      [10] 3064 	ld	hl, #(_enemy + 0x0012) + 0
   82B6 4E            [ 7] 3065 	ld	c,(hl)
   82B7 21 D7 64      [10] 3066 	ld	hl, #(_enemy + 0x0011) + 0
   82BA 46            [ 7] 3067 	ld	b,(hl)
   82BB 79            [ 4] 3068 	ld	a,c
   82BC B7            [ 4] 3069 	or	a,a
   82BD 20 0D         [12] 3070 	jr	NZ,00107$
   82BF B0            [ 4] 3071 	or	a,b
   82C0 20 0A         [12] 3072 	jr	NZ,00107$
                           3073 ;src/main.c:578: patrol(actual);
   82C2 21 C6 64      [10] 3074 	ld	hl,#_enemy
   82C5 E5            [11] 3075 	push	hl
   82C6 CD 17 7E      [17] 3076 	call	_patrol
   82C9 F1            [10] 3077 	pop	af
   82CA 18 C5         [12] 3078 	jr	00121$
   82CC                    3079 00107$:
                           3080 ;src/main.c:582: actual->onPathPatrol = 0;
   82CC 11 D2 64      [10] 3081 	ld	de,#_enemy + 12
                           3082 ;src/main.c:579: }else if (actual->inRange) {
   82CF 78            [ 4] 3083 	ld	a,b
   82D0 B7            [ 4] 3084 	or	a, a
   82D1 28 1A         [12] 3085 	jr	Z,00104$
                           3086 ;src/main.c:580: engage(actual, prota.x, prota.y);
   82D3 3A D7 69      [13] 3087 	ld	a, (#_prota + 1)
   82D6 21 D6 69      [10] 3088 	ld	hl, #_prota + 0
   82D9 46            [ 7] 3089 	ld	b,(hl)
   82DA D5            [11] 3090 	push	de
   82DB F5            [11] 3091 	push	af
   82DC 33            [ 6] 3092 	inc	sp
   82DD C5            [11] 3093 	push	bc
   82DE 33            [ 6] 3094 	inc	sp
   82DF 21 C6 64      [10] 3095 	ld	hl,#_enemy
   82E2 E5            [11] 3096 	push	hl
   82E3 CD 33 7E      [17] 3097 	call	_engage
   82E6 F1            [10] 3098 	pop	af
   82E7 F1            [10] 3099 	pop	af
   82E8 D1            [10] 3100 	pop	de
                           3101 ;src/main.c:582: actual->onPathPatrol = 0;
   82E9 AF            [ 4] 3102 	xor	a, a
   82EA 12            [ 7] 3103 	ld	(de),a
   82EB 18 A4         [12] 3104 	jr	00121$
   82ED                    3105 00104$:
                           3106 ;src/main.c:583: } else if (actual->seen) {
   82ED 79            [ 4] 3107 	ld	a,c
   82EE B7            [ 4] 3108 	or	a, a
   82EF 28 A0         [12] 3109 	jr	Z,00121$
                           3110 ;src/main.c:586: actual->iter=0;
   82F1 21 D5 64      [10] 3111 	ld	hl,#(_enemy + 0x000f)
   82F4 36 00         [10] 3112 	ld	(hl),#0x00
                           3113 ;src/main.c:587: actual->reversePatrol = NO;
   82F6 21 D3 64      [10] 3114 	ld	hl,#(_enemy + 0x000d)
   82F9 36 00         [10] 3115 	ld	(hl),#0x00
                           3116 ;src/main.c:588: actual->patrolling = 0;
   82FB 21 D1 64      [10] 3117 	ld	hl,#(_enemy + 0x000b)
   82FE 36 00         [10] 3118 	ld	(hl),#0x00
                           3119 ;src/main.c:589: actual->onPathPatrol = 0;
   8300 AF            [ 4] 3120 	xor	a, a
   8301 12            [ 7] 3121 	ld	(de),a
   8302 18 8D         [12] 3122 	jr	00121$
   8304                    3123 00119$:
                           3124 ;src/main.c:591: } else if (actual->seek) { // esta buscando
   8304 DD 6E FC      [19] 3125 	ld	l,-4 (ix)
   8307 DD 66 FD      [19] 3126 	ld	h,-3 (ix)
   830A 11 14 00      [10] 3127 	ld	de, #0x0014
   830D 19            [11] 3128 	add	hl, de
   830E 7E            [ 7] 3129 	ld	a,(hl)
   830F B7            [ 4] 3130 	or	a, a
   8310 CA 91 82      [10] 3131 	jp	Z,00121$
                           3132 ;src/main.c:592: if (!actual->found /*&& actual->seekTimer <= 5*/) {
   8313 DD 6E FE      [19] 3133 	ld	l,-2 (ix)
   8316 DD 66 FF      [19] 3134 	ld	h,-1 (ix)
   8319 11 13 00      [10] 3135 	ld	de, #0x0013
   831C 19            [11] 3136 	add	hl, de
   831D 7E            [ 7] 3137 	ld	a,(hl)
   831E B7            [ 4] 3138 	or	a, a
   831F C2 91 82      [10] 3139 	jp	NZ,00121$
                           3140 ;src/main.c:593: seek(actual); // buscar en posiciones cercanas a la actual
   8322 21 C6 64      [10] 3141 	ld	hl,#_enemy
   8325 E5            [11] 3142 	push	hl
   8326 CD 29 7E      [17] 3143 	call	_seek
   8329 F1            [10] 3144 	pop	af
   832A C3 91 82      [10] 3145 	jp	00121$
                           3146 ;src/main.c:596: } else if (actual->engage) {
   832D                    3147 00124$:
   832D DD F9         [10] 3148 	ld	sp, ix
   832F DD E1         [14] 3149 	pop	ix
   8331 C9            [10] 3150 	ret
                           3151 ;src/main.c:605: void avanzarMapa() {
                           3152 ;	---------------------------------
                           3153 ; Function avanzarMapa
                           3154 ; ---------------------------------
   8332                    3155 _avanzarMapa::
                           3156 ;src/main.c:606: if(num_mapa < NUM_MAPAS -1) {
   8332 3A EB 69      [13] 3157 	ld	a,(#_num_mapa + 0)
   8335 D6 02         [ 7] 3158 	sub	a, #0x02
   8337 D2 33 73      [10] 3159 	jp	NC,_menuFin
                           3160 ;src/main.c:607: mapa = mapas[++num_mapa];
   833A 21 EB 69      [10] 3161 	ld	hl, #_num_mapa+0
   833D 34            [11] 3162 	inc	(hl)
   833E FD 21 EB 69   [14] 3163 	ld	iy,#_num_mapa
   8342 FD 6E 00      [19] 3164 	ld	l,0 (iy)
   8345 26 00         [ 7] 3165 	ld	h,#0x00
   8347 29            [11] 3166 	add	hl, hl
   8348 11 89 72      [10] 3167 	ld	de,#_mapas
   834B 19            [11] 3168 	add	hl,de
   834C 7E            [ 7] 3169 	ld	a,(hl)
   834D FD 21 E9 69   [14] 3170 	ld	iy,#_mapa
   8351 FD 77 00      [19] 3171 	ld	0 (iy),a
   8354 23            [ 6] 3172 	inc	hl
   8355 7E            [ 7] 3173 	ld	a,(hl)
   8356 32 EA 69      [13] 3174 	ld	(#_mapa + 1),a
                           3175 ;src/main.c:608: prota.x = prota.px = 2;
   8359 21 D8 69      [10] 3176 	ld	hl,#(_prota + 0x0002)
   835C 36 02         [10] 3177 	ld	(hl),#0x02
   835E 21 D6 69      [10] 3178 	ld	hl,#_prota
   8361 36 02         [10] 3179 	ld	(hl),#0x02
                           3180 ;src/main.c:609: prota.mover = SI;
   8363 21 DC 69      [10] 3181 	ld	hl,#(_prota + 0x0006)
   8366 36 01         [10] 3182 	ld	(hl),#0x01
                           3183 ;src/main.c:610: dibujarMapa();
   8368 CD 73 72      [17] 3184 	call	_dibujarMapa
                           3185 ;src/main.c:611: inicializarEnemy();
   836B C3 52 89      [10] 3186 	jp  _inicializarEnemy
                           3187 ;src/main.c:615: menuFin();
   836E C3 33 73      [10] 3188 	jp  _menuFin
                           3189 ;src/main.c:619: void moverIzquierda() {
                           3190 ;	---------------------------------
                           3191 ; Function moverIzquierda
                           3192 ; ---------------------------------
   8371                    3193 _moverIzquierda::
                           3194 ;src/main.c:620: prota.mira = M_izquierda;
   8371 01 D6 69      [10] 3195 	ld	bc,#_prota+0
   8374 21 DD 69      [10] 3196 	ld	hl,#(_prota + 0x0007)
   8377 36 01         [10] 3197 	ld	(hl),#0x01
                           3198 ;src/main.c:621: if (!checkCollision(M_izquierda)) {
   8379 C5            [11] 3199 	push	bc
   837A 21 01 00      [10] 3200 	ld	hl,#0x0001
   837D E5            [11] 3201 	push	hl
   837E CD BF 73      [17] 3202 	call	_checkCollision
   8381 F1            [10] 3203 	pop	af
   8382 C1            [10] 3204 	pop	bc
   8383 7D            [ 4] 3205 	ld	a,l
   8384 B7            [ 4] 3206 	or	a, a
   8385 C0            [11] 3207 	ret	NZ
                           3208 ;src/main.c:622: prota.x--;
   8386 0A            [ 7] 3209 	ld	a,(bc)
   8387 C6 FF         [ 7] 3210 	add	a,#0xFF
   8389 02            [ 7] 3211 	ld	(bc),a
                           3212 ;src/main.c:623: prota.mover = SI;
   838A 21 DC 69      [10] 3213 	ld	hl,#(_prota + 0x0006)
   838D 36 01         [10] 3214 	ld	(hl),#0x01
                           3215 ;src/main.c:624: prota.sprite = g_hero_left;
   838F 21 FE 49      [10] 3216 	ld	hl,#_g_hero_left
   8392 22 DA 69      [16] 3217 	ld	((_prota + 0x0004)), hl
   8395 C9            [10] 3218 	ret
                           3219 ;src/main.c:628: void moverDerecha() {
                           3220 ;	---------------------------------
                           3221 ; Function moverDerecha
                           3222 ; ---------------------------------
   8396                    3223 _moverDerecha::
                           3224 ;src/main.c:629: prota.mira = M_derecha;
   8396 21 DD 69      [10] 3225 	ld	hl,#(_prota + 0x0007)
   8399 36 00         [10] 3226 	ld	(hl),#0x00
                           3227 ;src/main.c:630: if (!checkCollision(M_derecha) && (prota.x + G_HERO_W < 80)) {
   839B 21 00 00      [10] 3228 	ld	hl,#0x0000
   839E E5            [11] 3229 	push	hl
   839F CD BF 73      [17] 3230 	call	_checkCollision
   83A2 F1            [10] 3231 	pop	af
   83A3 45            [ 4] 3232 	ld	b,l
   83A4 21 D6 69      [10] 3233 	ld	hl, #_prota + 0
   83A7 4E            [ 7] 3234 	ld	c,(hl)
   83A8 59            [ 4] 3235 	ld	e,c
   83A9 16 00         [ 7] 3236 	ld	d,#0x00
   83AB 21 07 00      [10] 3237 	ld	hl,#0x0007
   83AE 19            [11] 3238 	add	hl,de
   83AF 11 50 80      [10] 3239 	ld	de, #0x8050
   83B2 29            [11] 3240 	add	hl, hl
   83B3 3F            [ 4] 3241 	ccf
   83B4 CB 1C         [ 8] 3242 	rr	h
   83B6 CB 1D         [ 8] 3243 	rr	l
   83B8 ED 52         [15] 3244 	sbc	hl, de
   83BA 3E 00         [ 7] 3245 	ld	a,#0x00
   83BC 17            [ 4] 3246 	rla
   83BD 5F            [ 4] 3247 	ld	e,a
   83BE 78            [ 4] 3248 	ld	a,b
   83BF B7            [ 4] 3249 	or	a,a
   83C0 20 14         [12] 3250 	jr	NZ,00104$
   83C2 B3            [ 4] 3251 	or	a,e
   83C3 28 11         [12] 3252 	jr	Z,00104$
                           3253 ;src/main.c:631: prota.x++;
   83C5 0C            [ 4] 3254 	inc	c
   83C6 21 D6 69      [10] 3255 	ld	hl,#_prota
   83C9 71            [ 7] 3256 	ld	(hl),c
                           3257 ;src/main.c:632: prota.mover = SI;
   83CA 21 DC 69      [10] 3258 	ld	hl,#(_prota + 0x0006)
   83CD 36 01         [10] 3259 	ld	(hl),#0x01
                           3260 ;src/main.c:633: prota.sprite = g_hero;
   83CF 21 A8 4A      [10] 3261 	ld	hl,#_g_hero
   83D2 22 DA 69      [16] 3262 	ld	((_prota + 0x0004)), hl
   83D5 C9            [10] 3263 	ret
   83D6                    3264 00104$:
                           3265 ;src/main.c:635: }else if( prota.x + G_HERO_W >= 80){
   83D6 7B            [ 4] 3266 	ld	a,e
   83D7 B7            [ 4] 3267 	or	a, a
   83D8 C0            [11] 3268 	ret	NZ
                           3269 ;src/main.c:636: avanzarMapa();
   83D9 C3 32 83      [10] 3270 	jp  _avanzarMapa
                           3271 ;src/main.c:640: void moverArriba() {
                           3272 ;	---------------------------------
                           3273 ; Function moverArriba
                           3274 ; ---------------------------------
   83DC                    3275 _moverArriba::
                           3276 ;src/main.c:641: prota.mira = M_arriba;
   83DC 21 DD 69      [10] 3277 	ld	hl,#(_prota + 0x0007)
   83DF 36 02         [10] 3278 	ld	(hl),#0x02
                           3279 ;src/main.c:642: if (!checkCollision(M_arriba)) { // TODO: COMPROBAR
   83E1 21 02 00      [10] 3280 	ld	hl,#0x0002
   83E4 E5            [11] 3281 	push	hl
   83E5 CD BF 73      [17] 3282 	call	_checkCollision
   83E8 F1            [10] 3283 	pop	af
   83E9 7D            [ 4] 3284 	ld	a,l
   83EA B7            [ 4] 3285 	or	a, a
   83EB C0            [11] 3286 	ret	NZ
                           3287 ;src/main.c:643: prota.y--;
   83EC 21 D7 69      [10] 3288 	ld	hl,#_prota + 1
   83EF 4E            [ 7] 3289 	ld	c,(hl)
   83F0 0D            [ 4] 3290 	dec	c
   83F1 71            [ 7] 3291 	ld	(hl),c
                           3292 ;src/main.c:644: prota.y--;
   83F2 0D            [ 4] 3293 	dec	c
   83F3 71            [ 7] 3294 	ld	(hl),c
                           3295 ;src/main.c:645: prota.mover  = SI;
   83F4 21 DC 69      [10] 3296 	ld	hl,#(_prota + 0x0006)
   83F7 36 01         [10] 3297 	ld	(hl),#0x01
                           3298 ;src/main.c:646: prota.sprite = g_hero_up;
   83F9 21 64 49      [10] 3299 	ld	hl,#_g_hero_up
   83FC 22 DA 69      [16] 3300 	ld	((_prota + 0x0004)), hl
   83FF C9            [10] 3301 	ret
                           3302 ;src/main.c:650: void moverAbajo() {
                           3303 ;	---------------------------------
                           3304 ; Function moverAbajo
                           3305 ; ---------------------------------
   8400                    3306 _moverAbajo::
                           3307 ;src/main.c:651: prota.mira = M_abajo;
   8400 21 DD 69      [10] 3308 	ld	hl,#(_prota + 0x0007)
   8403 36 03         [10] 3309 	ld	(hl),#0x03
                           3310 ;src/main.c:652: if (!checkCollision(M_abajo) ) { // TODO: COMPROBAR
   8405 21 03 00      [10] 3311 	ld	hl,#0x0003
   8408 E5            [11] 3312 	push	hl
   8409 CD BF 73      [17] 3313 	call	_checkCollision
   840C F1            [10] 3314 	pop	af
   840D 7D            [ 4] 3315 	ld	a,l
   840E B7            [ 4] 3316 	or	a, a
   840F C0            [11] 3317 	ret	NZ
                           3318 ;src/main.c:653: prota.y++;
   8410 01 D7 69      [10] 3319 	ld	bc,#_prota + 1
   8413 0A            [ 7] 3320 	ld	a,(bc)
   8414 3C            [ 4] 3321 	inc	a
   8415 02            [ 7] 3322 	ld	(bc),a
                           3323 ;src/main.c:654: prota.y++;
   8416 3C            [ 4] 3324 	inc	a
   8417 02            [ 7] 3325 	ld	(bc),a
                           3326 ;src/main.c:655: prota.mover  = SI;
   8418 21 DC 69      [10] 3327 	ld	hl,#(_prota + 0x0006)
   841B 36 01         [10] 3328 	ld	(hl),#0x01
                           3329 ;src/main.c:656: prota.sprite = g_hero_down;
   841D 21 CA 48      [10] 3330 	ld	hl,#_g_hero_down
   8420 22 DA 69      [16] 3331 	ld	((_prota + 0x0004)), hl
   8423 C9            [10] 3332 	ret
                           3333 ;src/main.c:660: void dibujarCuchillo() {
                           3334 ;	---------------------------------
                           3335 ; Function dibujarCuchillo
                           3336 ; ---------------------------------
   8424                    3337 _dibujarCuchillo::
   8424 DD E5         [15] 3338 	push	ix
   8426 DD 21 00 00   [14] 3339 	ld	ix,#0
   842A DD 39         [15] 3340 	add	ix,sp
   842C F5            [11] 3341 	push	af
                           3342 ;src/main.c:661: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   842D 21 DF 69      [10] 3343 	ld	hl, #_cu + 1
   8430 56            [ 7] 3344 	ld	d,(hl)
   8431 21 DE 69      [10] 3345 	ld	hl, #_cu + 0
   8434 46            [ 7] 3346 	ld	b,(hl)
   8435 D5            [11] 3347 	push	de
   8436 33            [ 6] 3348 	inc	sp
   8437 C5            [11] 3349 	push	bc
   8438 33            [ 6] 3350 	inc	sp
   8439 21 00 C0      [10] 3351 	ld	hl,#0xC000
   843C E5            [11] 3352 	push	hl
   843D CD 69 64      [17] 3353 	call	_cpct_getScreenPtr
   8440 45            [ 4] 3354 	ld	b,l
   8441 5C            [ 4] 3355 	ld	e,h
                           3356 ;src/main.c:662: if(cu.eje == E_X){
   8442 21 E6 69      [10] 3357 	ld	hl, #_cu + 8
   8445 4E            [ 7] 3358 	ld	c,(hl)
                           3359 ;src/main.c:663: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   8446 DD 70 FE      [19] 3360 	ld	-2 (ix),b
   8449 DD 73 FF      [19] 3361 	ld	-1 (ix),e
                           3362 ;src/main.c:662: if(cu.eje == E_X){
   844C 79            [ 4] 3363 	ld	a,c
   844D B7            [ 4] 3364 	or	a, a
   844E 20 19         [12] 3365 	jr	NZ,00104$
                           3366 ;src/main.c:663: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   8450 11 00 0E      [10] 3367 	ld	de,#_g_tablatrans+0
   8453 ED 4B E2 69   [20] 3368 	ld	bc, (#(_cu + 0x0004) + 0)
   8457 D5            [11] 3369 	push	de
   8458 21 04 04      [10] 3370 	ld	hl,#0x0404
   845B E5            [11] 3371 	push	hl
   845C DD 6E FE      [19] 3372 	ld	l,-2 (ix)
   845F DD 66 FF      [19] 3373 	ld	h,-1 (ix)
   8462 E5            [11] 3374 	push	hl
   8463 C5            [11] 3375 	push	bc
   8464 CD 89 64      [17] 3376 	call	_cpct_drawSpriteMaskedAlignedTable
   8467 18 1A         [12] 3377 	jr	00106$
   8469                    3378 00104$:
                           3379 ;src/main.c:666: else if(cu.eje == E_Y){
   8469 0D            [ 4] 3380 	dec	c
   846A 20 17         [12] 3381 	jr	NZ,00106$
                           3382 ;src/main.c:667: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   846C 11 00 0E      [10] 3383 	ld	de,#_g_tablatrans+0
   846F ED 4B E2 69   [20] 3384 	ld	bc, (#(_cu + 0x0004) + 0)
   8473 D5            [11] 3385 	push	de
   8474 21 02 08      [10] 3386 	ld	hl,#0x0802
   8477 E5            [11] 3387 	push	hl
   8478 DD 6E FE      [19] 3388 	ld	l,-2 (ix)
   847B DD 66 FF      [19] 3389 	ld	h,-1 (ix)
   847E E5            [11] 3390 	push	hl
   847F C5            [11] 3391 	push	bc
   8480 CD 89 64      [17] 3392 	call	_cpct_drawSpriteMaskedAlignedTable
   8483                    3393 00106$:
   8483 DD F9         [10] 3394 	ld	sp, ix
   8485 DD E1         [14] 3395 	pop	ix
   8487 C9            [10] 3396 	ret
                           3397 ;src/main.c:671: void borrarCuchillo() {
                           3398 ;	---------------------------------
                           3399 ; Function borrarCuchillo
                           3400 ; ---------------------------------
   8488                    3401 _borrarCuchillo::
   8488 DD E5         [15] 3402 	push	ix
   848A DD 21 00 00   [14] 3403 	ld	ix,#0
   848E DD 39         [15] 3404 	add	ix,sp
   8490 F5            [11] 3405 	push	af
   8491 3B            [ 6] 3406 	dec	sp
                           3407 ;src/main.c:673: u8 w = 2 + (cu.px & 1);
   8492 21 E0 69      [10] 3408 	ld	hl, #_cu + 2
   8495 4E            [ 7] 3409 	ld	c,(hl)
   8496 79            [ 4] 3410 	ld	a,c
   8497 E6 01         [ 7] 3411 	and	a, #0x01
   8499 47            [ 4] 3412 	ld	b,a
   849A 04            [ 4] 3413 	inc	b
   849B 04            [ 4] 3414 	inc	b
                           3415 ;src/main.c:674: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   849C 21 E1 69      [10] 3416 	ld	hl, #_cu + 3
   849F 5E            [ 7] 3417 	ld	e,(hl)
   84A0 7B            [ 4] 3418 	ld	a,e
   84A1 E6 03         [ 7] 3419 	and	a, #0x03
   84A3 28 04         [12] 3420 	jr	Z,00105$
   84A5 3E 01         [ 7] 3421 	ld	a,#0x01
   84A7 18 02         [12] 3422 	jr	00106$
   84A9                    3423 00105$:
   84A9 3E 00         [ 7] 3424 	ld	a,#0x00
   84AB                    3425 00106$:
   84AB C6 02         [ 7] 3426 	add	a, #0x02
   84AD DD 77 FD      [19] 3427 	ld	-3 (ix),a
                           3428 ;src/main.c:675: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   84B0 FD 2A E9 69   [20] 3429 	ld	iy,(_mapa)
   84B4 16 00         [ 7] 3430 	ld	d,#0x00
   84B6 7B            [ 4] 3431 	ld	a,e
   84B7 C6 E8         [ 7] 3432 	add	a,#0xE8
   84B9 DD 77 FE      [19] 3433 	ld	-2 (ix),a
   84BC 7A            [ 4] 3434 	ld	a,d
   84BD CE FF         [ 7] 3435 	adc	a,#0xFF
   84BF DD 77 FF      [19] 3436 	ld	-1 (ix),a
   84C2 DD 6E FE      [19] 3437 	ld	l,-2 (ix)
   84C5 DD 66 FF      [19] 3438 	ld	h,-1 (ix)
   84C8 DD CB FF 7E   [20] 3439 	bit	7, -1 (ix)
   84CC 28 04         [12] 3440 	jr	Z,00107$
   84CE 21 EB FF      [10] 3441 	ld	hl,#0xFFEB
   84D1 19            [11] 3442 	add	hl,de
   84D2                    3443 00107$:
   84D2 CB 2C         [ 8] 3444 	sra	h
   84D4 CB 1D         [ 8] 3445 	rr	l
   84D6 CB 2C         [ 8] 3446 	sra	h
   84D8 CB 1D         [ 8] 3447 	rr	l
   84DA 55            [ 4] 3448 	ld	d,l
   84DB CB 39         [ 8] 3449 	srl	c
   84DD FD E5         [15] 3450 	push	iy
   84DF 21 F0 C0      [10] 3451 	ld	hl,#0xC0F0
   84E2 E5            [11] 3452 	push	hl
   84E3 3E 28         [ 7] 3453 	ld	a,#0x28
   84E5 F5            [11] 3454 	push	af
   84E6 33            [ 6] 3455 	inc	sp
   84E7 DD 7E FD      [19] 3456 	ld	a,-3 (ix)
   84EA F5            [11] 3457 	push	af
   84EB 33            [ 6] 3458 	inc	sp
   84EC C5            [11] 3459 	push	bc
   84ED 33            [ 6] 3460 	inc	sp
   84EE D5            [11] 3461 	push	de
   84EF 33            [ 6] 3462 	inc	sp
   84F0 79            [ 4] 3463 	ld	a,c
   84F1 F5            [11] 3464 	push	af
   84F2 33            [ 6] 3465 	inc	sp
   84F3 CD 62 59      [17] 3466 	call	_cpct_etm_drawTileBox2x4
                           3467 ;src/main.c:676: if(!cu.mover){
   84F6 3A E7 69      [13] 3468 	ld	a, (#_cu + 9)
   84F9 B7            [ 4] 3469 	or	a, a
   84FA 20 05         [12] 3470 	jr	NZ,00103$
                           3471 ;src/main.c:677: cu.lanzado = NO;
   84FC 21 E4 69      [10] 3472 	ld	hl,#(_cu + 0x0006)
   84FF 36 00         [10] 3473 	ld	(hl),#0x00
   8501                    3474 00103$:
   8501 DD F9         [10] 3475 	ld	sp, ix
   8503 DD E1         [14] 3476 	pop	ix
   8505 C9            [10] 3477 	ret
                           3478 ;src/main.c:681: void redibujarCuchillo( ) {
                           3479 ;	---------------------------------
                           3480 ; Function redibujarCuchillo
                           3481 ; ---------------------------------
   8506                    3482 _redibujarCuchillo::
                           3483 ;src/main.c:682: borrarCuchillo();
   8506 CD 88 84      [17] 3484 	call	_borrarCuchillo
                           3485 ;src/main.c:683: cu.px = cu.x;
   8509 01 E0 69      [10] 3486 	ld	bc,#_cu + 2
   850C 3A DE 69      [13] 3487 	ld	a, (#_cu + 0)
   850F 02            [ 7] 3488 	ld	(bc),a
                           3489 ;src/main.c:684: cu.py = cu.y;
   8510 01 E1 69      [10] 3490 	ld	bc,#_cu + 3
   8513 3A DF 69      [13] 3491 	ld	a, (#_cu + 1)
   8516 02            [ 7] 3492 	ld	(bc),a
                           3493 ;src/main.c:685: dibujarCuchillo();
   8517 C3 24 84      [10] 3494 	jp  _dibujarCuchillo
                           3495 ;src/main.c:688: void lanzarCuchillo(){
                           3496 ;	---------------------------------
                           3497 ; Function lanzarCuchillo
                           3498 ; ---------------------------------
   851A                    3499 _lanzarCuchillo::
                           3500 ;src/main.c:690: if(!cu.lanzado){
   851A 3A E4 69      [13] 3501 	ld	a, (#(_cu + 0x0006) + 0)
   851D B7            [ 4] 3502 	or	a, a
   851E C0            [11] 3503 	ret	NZ
                           3504 ;src/main.c:692: if(prota.mira == M_derecha){
   851F 21 DD 69      [10] 3505 	ld	hl, #_prota + 7
   8522 5E            [ 7] 3506 	ld	e,(hl)
                           3507 ;src/main.c:693: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   8523 01 D7 69      [10] 3508 	ld	bc,#_prota + 1
                           3509 ;src/main.c:695: cu.direccion = M_derecha;
                           3510 ;src/main.c:697: cu.y=prota.y + G_HERO_H /2;
                           3511 ;src/main.c:698: cu.sprite=g_knifeX_0;
                           3512 ;src/main.c:699: cu.eje = E_X;
                           3513 ;src/main.c:692: if(prota.mira == M_derecha){
   8526 7B            [ 4] 3514 	ld	a,e
   8527 B7            [ 4] 3515 	or	a, a
   8528 20 41         [12] 3516 	jr	NZ,00118$
                           3517 ;src/main.c:693: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   852A 0A            [ 7] 3518 	ld	a,(bc)
   852B C6 0B         [ 7] 3519 	add	a, #0x0B
   852D 5F            [ 4] 3520 	ld	e,a
   852E 3A D6 69      [13] 3521 	ld	a, (#_prota + 0)
   8531 C6 0C         [ 7] 3522 	add	a, #0x0C
   8533 6F            [ 4] 3523 	ld	l,a
   8534 C5            [11] 3524 	push	bc
   8535 7B            [ 4] 3525 	ld	a,e
   8536 F5            [11] 3526 	push	af
   8537 33            [ 6] 3527 	inc	sp
   8538 7D            [ 4] 3528 	ld	a,l
   8539 F5            [11] 3529 	push	af
   853A 33            [ 6] 3530 	inc	sp
   853B CD 7E 73      [17] 3531 	call	_getTilePtr
   853E F1            [10] 3532 	pop	af
   853F C1            [10] 3533 	pop	bc
   8540 5E            [ 7] 3534 	ld	e,(hl)
   8541 3E 02         [ 7] 3535 	ld	a,#0x02
   8543 93            [ 4] 3536 	sub	a, e
   8544 D8            [11] 3537 	ret	C
                           3538 ;src/main.c:694: cu.lanzado = SI;
   8545 21 E4 69      [10] 3539 	ld	hl,#(_cu + 0x0006)
   8548 36 01         [10] 3540 	ld	(hl),#0x01
                           3541 ;src/main.c:695: cu.direccion = M_derecha;
   854A 21 E5 69      [10] 3542 	ld	hl,#(_cu + 0x0007)
   854D 36 00         [10] 3543 	ld	(hl),#0x00
                           3544 ;src/main.c:696: cu.x=prota.x + G_HERO_W;
   854F 3A D6 69      [13] 3545 	ld	a, (#_prota + 0)
   8552 C6 07         [ 7] 3546 	add	a, #0x07
   8554 32 DE 69      [13] 3547 	ld	(#_cu),a
                           3548 ;src/main.c:697: cu.y=prota.y + G_HERO_H /2;
   8557 0A            [ 7] 3549 	ld	a,(bc)
   8558 C6 0B         [ 7] 3550 	add	a, #0x0B
   855A 32 DF 69      [13] 3551 	ld	(#(_cu + 0x0001)),a
                           3552 ;src/main.c:698: cu.sprite=g_knifeX_0;
   855D 21 C0 24      [10] 3553 	ld	hl,#_g_knifeX_0
   8560 22 E2 69      [16] 3554 	ld	((_cu + 0x0004)), hl
                           3555 ;src/main.c:699: cu.eje = E_X;
   8563 21 E6 69      [10] 3556 	ld	hl,#(_cu + 0x0008)
   8566 36 00         [10] 3557 	ld	(hl),#0x00
                           3558 ;src/main.c:700: dibujarCuchillo();
   8568 C3 24 84      [10] 3559 	jp  _dibujarCuchillo
   856B                    3560 00118$:
                           3561 ;src/main.c:703: else if(prota.mira == M_izquierda){
   856B 7B            [ 4] 3562 	ld	a,e
   856C 3D            [ 4] 3563 	dec	a
   856D 20 41         [12] 3564 	jr	NZ,00115$
                           3565 ;src/main.c:704: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   856F 0A            [ 7] 3566 	ld	a,(bc)
   8570 C6 0B         [ 7] 3567 	add	a, #0x0B
   8572 5F            [ 4] 3568 	ld	e,a
   8573 3A D6 69      [13] 3569 	ld	a, (#_prota + 0)
   8576 C6 F6         [ 7] 3570 	add	a,#0xF6
   8578 6F            [ 4] 3571 	ld	l,a
   8579 C5            [11] 3572 	push	bc
   857A 7B            [ 4] 3573 	ld	a,e
   857B F5            [11] 3574 	push	af
   857C 33            [ 6] 3575 	inc	sp
   857D 7D            [ 4] 3576 	ld	a,l
   857E F5            [11] 3577 	push	af
   857F 33            [ 6] 3578 	inc	sp
   8580 CD 7E 73      [17] 3579 	call	_getTilePtr
   8583 F1            [10] 3580 	pop	af
   8584 C1            [10] 3581 	pop	bc
   8585 5E            [ 7] 3582 	ld	e,(hl)
   8586 3E 02         [ 7] 3583 	ld	a,#0x02
   8588 93            [ 4] 3584 	sub	a, e
   8589 D8            [11] 3585 	ret	C
                           3586 ;src/main.c:705: cu.lanzado = SI;
   858A 21 E4 69      [10] 3587 	ld	hl,#(_cu + 0x0006)
   858D 36 01         [10] 3588 	ld	(hl),#0x01
                           3589 ;src/main.c:706: cu.direccion = M_izquierda;
   858F 21 E5 69      [10] 3590 	ld	hl,#(_cu + 0x0007)
   8592 36 01         [10] 3591 	ld	(hl),#0x01
                           3592 ;src/main.c:707: cu.x = prota.x - G_KNIFEX_0_W;
   8594 3A D6 69      [13] 3593 	ld	a, (#_prota + 0)
   8597 C6 FC         [ 7] 3594 	add	a,#0xFC
   8599 32 DE 69      [13] 3595 	ld	(#_cu),a
                           3596 ;src/main.c:708: cu.y = prota.y + G_HERO_H /2;
   859C 0A            [ 7] 3597 	ld	a,(bc)
   859D C6 0B         [ 7] 3598 	add	a, #0x0B
   859F 32 DF 69      [13] 3599 	ld	(#(_cu + 0x0001)),a
                           3600 ;src/main.c:709: cu.sprite = g_knifeX_1;
   85A2 21 D0 24      [10] 3601 	ld	hl,#_g_knifeX_1
   85A5 22 E2 69      [16] 3602 	ld	((_cu + 0x0004)), hl
                           3603 ;src/main.c:710: cu.eje = E_X;
   85A8 21 E6 69      [10] 3604 	ld	hl,#(_cu + 0x0008)
   85AB 36 00         [10] 3605 	ld	(hl),#0x00
                           3606 ;src/main.c:711: dibujarCuchillo();
   85AD C3 24 84      [10] 3607 	jp  _dibujarCuchillo
   85B0                    3608 00115$:
                           3609 ;src/main.c:714: else if(prota.mira == M_abajo){
   85B0 7B            [ 4] 3610 	ld	a,e
   85B1 D6 03         [ 7] 3611 	sub	a, #0x03
   85B3 20 41         [12] 3612 	jr	NZ,00112$
                           3613 ;src/main.c:716: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   85B5 0A            [ 7] 3614 	ld	a,(bc)
   85B6 C6 1F         [ 7] 3615 	add	a, #0x1F
   85B8 5F            [ 4] 3616 	ld	e,a
   85B9 3A D6 69      [13] 3617 	ld	a, (#_prota + 0)
   85BC 57            [ 4] 3618 	ld	d,a
   85BD 14            [ 4] 3619 	inc	d
   85BE 14            [ 4] 3620 	inc	d
   85BF 14            [ 4] 3621 	inc	d
   85C0 C5            [11] 3622 	push	bc
   85C1 7B            [ 4] 3623 	ld	a,e
   85C2 F5            [11] 3624 	push	af
   85C3 33            [ 6] 3625 	inc	sp
   85C4 D5            [11] 3626 	push	de
   85C5 33            [ 6] 3627 	inc	sp
   85C6 CD 7E 73      [17] 3628 	call	_getTilePtr
   85C9 F1            [10] 3629 	pop	af
   85CA C1            [10] 3630 	pop	bc
   85CB 5E            [ 7] 3631 	ld	e,(hl)
   85CC 3E 02         [ 7] 3632 	ld	a,#0x02
   85CE 93            [ 4] 3633 	sub	a, e
   85CF D8            [11] 3634 	ret	C
                           3635 ;src/main.c:717: cu.lanzado = SI;
   85D0 21 E4 69      [10] 3636 	ld	hl,#(_cu + 0x0006)
   85D3 36 01         [10] 3637 	ld	(hl),#0x01
                           3638 ;src/main.c:718: cu.direccion = M_abajo;
   85D5 21 E5 69      [10] 3639 	ld	hl,#(_cu + 0x0007)
   85D8 36 03         [10] 3640 	ld	(hl),#0x03
                           3641 ;src/main.c:719: cu.x = prota.x + G_HERO_W / 2;
   85DA 3A D6 69      [13] 3642 	ld	a, (#_prota + 0)
   85DD C6 03         [ 7] 3643 	add	a, #0x03
   85DF 32 DE 69      [13] 3644 	ld	(#_cu),a
                           3645 ;src/main.c:720: cu.y = prota.y + G_HERO_H;
   85E2 0A            [ 7] 3646 	ld	a,(bc)
   85E3 C6 16         [ 7] 3647 	add	a, #0x16
   85E5 32 DF 69      [13] 3648 	ld	(#(_cu + 0x0001)),a
                           3649 ;src/main.c:721: cu.sprite = g_knifeY_0;
   85E8 21 A0 24      [10] 3650 	ld	hl,#_g_knifeY_0
   85EB 22 E2 69      [16] 3651 	ld	((_cu + 0x0004)), hl
                           3652 ;src/main.c:722: cu.eje = E_Y;
   85EE 21 E6 69      [10] 3653 	ld	hl,#(_cu + 0x0008)
   85F1 36 01         [10] 3654 	ld	(hl),#0x01
                           3655 ;src/main.c:723: dibujarCuchillo();
   85F3 C3 24 84      [10] 3656 	jp  _dibujarCuchillo
   85F6                    3657 00112$:
                           3658 ;src/main.c:726: else if(prota.mira == M_arriba){
   85F6 7B            [ 4] 3659 	ld	a,e
   85F7 D6 02         [ 7] 3660 	sub	a, #0x02
   85F9 C0            [11] 3661 	ret	NZ
                           3662 ;src/main.c:727: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   85FA 0A            [ 7] 3663 	ld	a,(bc)
   85FB C6 F7         [ 7] 3664 	add	a,#0xF7
   85FD 57            [ 4] 3665 	ld	d,a
   85FE 3A D6 69      [13] 3666 	ld	a, (#_prota + 0)
   8601 C6 03         [ 7] 3667 	add	a, #0x03
   8603 C5            [11] 3668 	push	bc
   8604 D5            [11] 3669 	push	de
   8605 33            [ 6] 3670 	inc	sp
   8606 F5            [11] 3671 	push	af
   8607 33            [ 6] 3672 	inc	sp
   8608 CD 7E 73      [17] 3673 	call	_getTilePtr
   860B F1            [10] 3674 	pop	af
   860C C1            [10] 3675 	pop	bc
   860D 5E            [ 7] 3676 	ld	e,(hl)
   860E 3E 02         [ 7] 3677 	ld	a,#0x02
   8610 93            [ 4] 3678 	sub	a, e
   8611 D8            [11] 3679 	ret	C
                           3680 ;src/main.c:728: cu.lanzado = SI;
   8612 21 E4 69      [10] 3681 	ld	hl,#(_cu + 0x0006)
   8615 36 01         [10] 3682 	ld	(hl),#0x01
                           3683 ;src/main.c:729: cu.direccion = M_arriba;
   8617 21 E5 69      [10] 3684 	ld	hl,#(_cu + 0x0007)
   861A 36 02         [10] 3685 	ld	(hl),#0x02
                           3686 ;src/main.c:730: cu.x = prota.x + G_HERO_W / 2;
   861C 3A D6 69      [13] 3687 	ld	a, (#_prota + 0)
   861F C6 03         [ 7] 3688 	add	a, #0x03
   8621 32 DE 69      [13] 3689 	ld	(#_cu),a
                           3690 ;src/main.c:731: cu.y = prota.y;
   8624 0A            [ 7] 3691 	ld	a,(bc)
   8625 32 DF 69      [13] 3692 	ld	(#(_cu + 0x0001)),a
                           3693 ;src/main.c:732: cu.sprite = g_knifeY_1;
   8628 21 B0 24      [10] 3694 	ld	hl,#_g_knifeY_1
   862B 22 E2 69      [16] 3695 	ld	((_cu + 0x0004)), hl
                           3696 ;src/main.c:733: cu.eje = E_Y;
   862E 21 E6 69      [10] 3697 	ld	hl,#(_cu + 0x0008)
   8631 36 01         [10] 3698 	ld	(hl),#0x01
                           3699 ;src/main.c:734: dibujarCuchillo();
   8633 C3 24 84      [10] 3700 	jp  _dibujarCuchillo
                           3701 ;src/main.c:740: void comprobarTeclado() {
                           3702 ;	---------------------------------
                           3703 ; Function comprobarTeclado
                           3704 ; ---------------------------------
   8636                    3705 _comprobarTeclado::
                           3706 ;src/main.c:741: cpct_scanKeyboard_if();
   8636 CD BA 5A      [17] 3707 	call	_cpct_scanKeyboard_if
                           3708 ;src/main.c:743: if (cpct_isAnyKeyPressed()) {
   8639 CD AD 5A      [17] 3709 	call	_cpct_isAnyKeyPressed
   863C 7D            [ 4] 3710 	ld	a,l
   863D B7            [ 4] 3711 	or	a, a
   863E C8            [11] 3712 	ret	Z
                           3713 ;src/main.c:744: if (cpct_isKeyPressed(Key_CursorLeft))
   863F 21 01 01      [10] 3714 	ld	hl,#0x0101
   8642 CD 17 58      [17] 3715 	call	_cpct_isKeyPressed
   8645 7D            [ 4] 3716 	ld	a,l
   8646 B7            [ 4] 3717 	or	a, a
                           3718 ;src/main.c:745: moverIzquierda();
   8647 C2 71 83      [10] 3719 	jp	NZ,_moverIzquierda
                           3720 ;src/main.c:746: else if (cpct_isKeyPressed(Key_CursorRight))
   864A 21 00 02      [10] 3721 	ld	hl,#0x0200
   864D CD 17 58      [17] 3722 	call	_cpct_isKeyPressed
   8650 7D            [ 4] 3723 	ld	a,l
   8651 B7            [ 4] 3724 	or	a, a
                           3725 ;src/main.c:747: moverDerecha();
   8652 C2 96 83      [10] 3726 	jp	NZ,_moverDerecha
                           3727 ;src/main.c:748: else if (cpct_isKeyPressed(Key_CursorUp))
   8655 21 00 01      [10] 3728 	ld	hl,#0x0100
   8658 CD 17 58      [17] 3729 	call	_cpct_isKeyPressed
   865B 7D            [ 4] 3730 	ld	a,l
   865C B7            [ 4] 3731 	or	a, a
                           3732 ;src/main.c:749: moverArriba();
   865D C2 DC 83      [10] 3733 	jp	NZ,_moverArriba
                           3734 ;src/main.c:750: else if (cpct_isKeyPressed(Key_CursorDown))
   8660 21 00 04      [10] 3735 	ld	hl,#0x0400
   8663 CD 17 58      [17] 3736 	call	_cpct_isKeyPressed
   8666 7D            [ 4] 3737 	ld	a,l
   8667 B7            [ 4] 3738 	or	a, a
                           3739 ;src/main.c:751: moverAbajo();
   8668 C2 00 84      [10] 3740 	jp	NZ,_moverAbajo
                           3741 ;src/main.c:752: else if (cpct_isKeyPressed(Key_Space))
   866B 21 05 80      [10] 3742 	ld	hl,#0x8005
   866E CD 17 58      [17] 3743 	call	_cpct_isKeyPressed
   8671 7D            [ 4] 3744 	ld	a,l
   8672 B7            [ 4] 3745 	or	a, a
   8673 C8            [11] 3746 	ret	Z
                           3747 ;src/main.c:753: lanzarCuchillo();
   8674 C3 1A 85      [10] 3748 	jp  _lanzarCuchillo
                           3749 ;src/main.c:757: u8 checkKnifeCollision(int direction, u8 xoff, u8 yoff){
                           3750 ;	---------------------------------
                           3751 ; Function checkKnifeCollision
                           3752 ; ---------------------------------
   8677                    3753 _checkKnifeCollision::
                           3754 ;src/main.c:759: return *getTilePtr(cu.x + xoff, cu.y + yoff) <= 2;
   8677 3A DF 69      [13] 3755 	ld	a,(#_cu + 1)
   867A 21 05 00      [10] 3756 	ld	hl,#5
   867D 39            [11] 3757 	add	hl,sp
   867E 86            [ 7] 3758 	add	a, (hl)
   867F 47            [ 4] 3759 	ld	b,a
   8680 3A DE 69      [13] 3760 	ld	a,(#_cu + 0)
   8683 21 04 00      [10] 3761 	ld	hl,#4
   8686 39            [11] 3762 	add	hl,sp
   8687 86            [ 7] 3763 	add	a, (hl)
   8688 4F            [ 4] 3764 	ld	c,a
   8689 C5            [11] 3765 	push	bc
   868A CD 7E 73      [17] 3766 	call	_getTilePtr
   868D F1            [10] 3767 	pop	af
   868E 4E            [ 7] 3768 	ld	c,(hl)
   868F 3E 02         [ 7] 3769 	ld	a,#0x02
   8691 91            [ 4] 3770 	sub	a, c
   8692 3E 00         [ 7] 3771 	ld	a,#0x00
   8694 17            [ 4] 3772 	rla
   8695 EE 01         [ 7] 3773 	xor	a, #0x01
   8697 6F            [ 4] 3774 	ld	l, a
   8698 C9            [10] 3775 	ret
                           3776 ;src/main.c:762: void moverCuchillo(){
                           3777 ;	---------------------------------
                           3778 ; Function moverCuchillo
                           3779 ; ---------------------------------
   8699                    3780 _moverCuchillo::
                           3781 ;src/main.c:763: if(cu.lanzado){
   8699 01 DE 69      [10] 3782 	ld	bc,#_cu+0
   869C 3A E4 69      [13] 3783 	ld	a, (#_cu + 6)
   869F B7            [ 4] 3784 	or	a, a
   86A0 C8            [11] 3785 	ret	Z
                           3786 ;src/main.c:764: cu.mover = SI;
   86A1 21 09 00      [10] 3787 	ld	hl,#0x0009
   86A4 09            [11] 3788 	add	hl,bc
   86A5 EB            [ 4] 3789 	ex	de,hl
   86A6 3E 01         [ 7] 3790 	ld	a,#0x01
   86A8 12            [ 7] 3791 	ld	(de),a
                           3792 ;src/main.c:765: if(cu.direccion == M_derecha){
   86A9 21 E5 69      [10] 3793 	ld	hl, #_cu + 7
   86AC 6E            [ 7] 3794 	ld	l,(hl)
   86AD 7D            [ 4] 3795 	ld	a,l
   86AE B7            [ 4] 3796 	or	a, a
   86AF 20 1E         [12] 3797 	jr	NZ,00122$
                           3798 ;src/main.c:767: if(checkKnifeCollision(M_derecha, G_KNIFEX_0_W + 1, 0)){
   86B1 C5            [11] 3799 	push	bc
   86B2 D5            [11] 3800 	push	de
   86B3 21 05 00      [10] 3801 	ld	hl,#0x0005
   86B6 E5            [11] 3802 	push	hl
   86B7 2E 00         [ 7] 3803 	ld	l, #0x00
   86B9 E5            [11] 3804 	push	hl
   86BA CD 77 86      [17] 3805 	call	_checkKnifeCollision
   86BD F1            [10] 3806 	pop	af
   86BE F1            [10] 3807 	pop	af
   86BF D1            [10] 3808 	pop	de
   86C0 C1            [10] 3809 	pop	bc
   86C1 7D            [ 4] 3810 	ld	a,l
   86C2 B7            [ 4] 3811 	or	a, a
   86C3 28 07         [12] 3812 	jr	Z,00102$
                           3813 ;src/main.c:768: cu.mover = SI;
   86C5 3E 01         [ 7] 3814 	ld	a,#0x01
   86C7 12            [ 7] 3815 	ld	(de),a
                           3816 ;src/main.c:769: cu.x++;
   86C8 0A            [ 7] 3817 	ld	a,(bc)
   86C9 3C            [ 4] 3818 	inc	a
   86CA 02            [ 7] 3819 	ld	(bc),a
   86CB C9            [10] 3820 	ret
   86CC                    3821 00102$:
                           3822 ;src/main.c:772: cu.mover=NO;
   86CC AF            [ 4] 3823 	xor	a, a
   86CD 12            [ 7] 3824 	ld	(de),a
   86CE C9            [10] 3825 	ret
   86CF                    3826 00122$:
                           3827 ;src/main.c:775: else if(cu.direccion == M_izquierda){
   86CF 7D            [ 4] 3828 	ld	a,l
   86D0 3D            [ 4] 3829 	dec	a
   86D1 20 1F         [12] 3830 	jr	NZ,00119$
                           3831 ;src/main.c:776: if(checkKnifeCollision(M_derecha, -1, 0)){
   86D3 C5            [11] 3832 	push	bc
   86D4 D5            [11] 3833 	push	de
   86D5 21 FF 00      [10] 3834 	ld	hl,#0x00FF
   86D8 E5            [11] 3835 	push	hl
   86D9 2E 00         [ 7] 3836 	ld	l, #0x00
   86DB E5            [11] 3837 	push	hl
   86DC CD 77 86      [17] 3838 	call	_checkKnifeCollision
   86DF F1            [10] 3839 	pop	af
   86E0 F1            [10] 3840 	pop	af
   86E1 D1            [10] 3841 	pop	de
   86E2 C1            [10] 3842 	pop	bc
   86E3 7D            [ 4] 3843 	ld	a,l
   86E4 B7            [ 4] 3844 	or	a, a
   86E5 28 08         [12] 3845 	jr	Z,00105$
                           3846 ;src/main.c:777: cu.mover = SI;
   86E7 3E 01         [ 7] 3847 	ld	a,#0x01
   86E9 12            [ 7] 3848 	ld	(de),a
                           3849 ;src/main.c:778: cu.x--;
   86EA 0A            [ 7] 3850 	ld	a,(bc)
   86EB C6 FF         [ 7] 3851 	add	a,#0xFF
   86ED 02            [ 7] 3852 	ld	(bc),a
   86EE C9            [10] 3853 	ret
   86EF                    3854 00105$:
                           3855 ;src/main.c:780: cu.mover=NO;
   86EF AF            [ 4] 3856 	xor	a, a
   86F0 12            [ 7] 3857 	ld	(de),a
   86F1 C9            [10] 3858 	ret
   86F2                    3859 00119$:
                           3860 ;src/main.c:786: cu.y--;
   86F2 03            [ 6] 3861 	inc	bc
                           3862 ;src/main.c:783: else if(cu.direccion == M_arriba){
   86F3 7D            [ 4] 3863 	ld	a,l
   86F4 D6 02         [ 7] 3864 	sub	a, #0x02
   86F6 20 22         [12] 3865 	jr	NZ,00116$
                           3866 ;src/main.c:784: if(checkKnifeCollision(M_derecha, 0, -2)){
   86F8 C5            [11] 3867 	push	bc
   86F9 D5            [11] 3868 	push	de
   86FA 21 00 FE      [10] 3869 	ld	hl,#0xFE00
   86FD E5            [11] 3870 	push	hl
   86FE 26 00         [ 7] 3871 	ld	h, #0x00
   8700 E5            [11] 3872 	push	hl
   8701 CD 77 86      [17] 3873 	call	_checkKnifeCollision
   8704 F1            [10] 3874 	pop	af
   8705 F1            [10] 3875 	pop	af
   8706 D1            [10] 3876 	pop	de
   8707 C1            [10] 3877 	pop	bc
   8708 7D            [ 4] 3878 	ld	a,l
   8709 B7            [ 4] 3879 	or	a, a
   870A 28 0B         [12] 3880 	jr	Z,00108$
                           3881 ;src/main.c:785: cu.mover = SI;
   870C 3E 01         [ 7] 3882 	ld	a,#0x01
   870E 12            [ 7] 3883 	ld	(de),a
                           3884 ;src/main.c:786: cu.y--;
   870F 0A            [ 7] 3885 	ld	a,(bc)
   8710 C6 FF         [ 7] 3886 	add	a,#0xFF
   8712 02            [ 7] 3887 	ld	(bc),a
                           3888 ;src/main.c:787: cu.y--;
   8713 C6 FF         [ 7] 3889 	add	a,#0xFF
   8715 02            [ 7] 3890 	ld	(bc),a
   8716 C9            [10] 3891 	ret
   8717                    3892 00108$:
                           3893 ;src/main.c:790: cu.mover=NO;
   8717 AF            [ 4] 3894 	xor	a, a
   8718 12            [ 7] 3895 	ld	(de),a
   8719 C9            [10] 3896 	ret
   871A                    3897 00116$:
                           3898 ;src/main.c:793: else if(cu.direccion == M_abajo){
   871A 7D            [ 4] 3899 	ld	a,l
   871B D6 03         [ 7] 3900 	sub	a, #0x03
   871D C0            [11] 3901 	ret	NZ
                           3902 ;src/main.c:794: if(checkKnifeCollision(M_derecha, 0, G_KNIFEY_0_H + 2)){
   871E C5            [11] 3903 	push	bc
   871F D5            [11] 3904 	push	de
   8720 21 00 0A      [10] 3905 	ld	hl,#0x0A00
   8723 E5            [11] 3906 	push	hl
   8724 26 00         [ 7] 3907 	ld	h, #0x00
   8726 E5            [11] 3908 	push	hl
   8727 CD 77 86      [17] 3909 	call	_checkKnifeCollision
   872A F1            [10] 3910 	pop	af
   872B F1            [10] 3911 	pop	af
   872C D1            [10] 3912 	pop	de
   872D C1            [10] 3913 	pop	bc
   872E 7D            [ 4] 3914 	ld	a,l
   872F B7            [ 4] 3915 	or	a, a
   8730 28 09         [12] 3916 	jr	Z,00111$
                           3917 ;src/main.c:795: cu.mover = SI;
   8732 3E 01         [ 7] 3918 	ld	a,#0x01
   8734 12            [ 7] 3919 	ld	(de),a
                           3920 ;src/main.c:796: cu.y++;
   8735 0A            [ 7] 3921 	ld	a,(bc)
   8736 3C            [ 4] 3922 	inc	a
   8737 02            [ 7] 3923 	ld	(bc),a
                           3924 ;src/main.c:797: cu.y++;
   8738 3C            [ 4] 3925 	inc	a
   8739 02            [ 7] 3926 	ld	(bc),a
   873A C9            [10] 3927 	ret
   873B                    3928 00111$:
                           3929 ;src/main.c:800: cu.mover=NO;
   873B AF            [ 4] 3930 	xor	a, a
   873C 12            [ 7] 3931 	ld	(de),a
   873D C9            [10] 3932 	ret
                           3933 ;src/main.c:806: void barraPuntuacionInicial(){
                           3934 ;	---------------------------------
                           3935 ; Function barraPuntuacionInicial
                           3936 ; ---------------------------------
   873E                    3937 _barraPuntuacionInicial::
                           3938 ;src/main.c:811: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   873E 21 00 02      [10] 3939 	ld	hl,#0x0200
   8741 E5            [11] 3940 	push	hl
   8742 26 C0         [ 7] 3941 	ld	h, #0xC0
   8744 E5            [11] 3942 	push	hl
   8745 CD 69 64      [17] 3943 	call	_cpct_getScreenPtr
   8748 4D            [ 4] 3944 	ld	c,l
   8749 44            [ 4] 3945 	ld	b,h
                           3946 ;src/main.c:812: cpct_drawStringM0("SCORE", memptr, 1, 0);
   874A 21 01 00      [10] 3947 	ld	hl,#0x0001
   874D E5            [11] 3948 	push	hl
   874E C5            [11] 3949 	push	bc
   874F 21 E6 87      [10] 3950 	ld	hl,#___str_1
   8752 E5            [11] 3951 	push	hl
   8753 CD 99 58      [17] 3952 	call	_cpct_drawStringM0
   8756 21 06 00      [10] 3953 	ld	hl,#6
   8759 39            [11] 3954 	add	hl,sp
   875A F9            [ 6] 3955 	ld	sp,hl
                           3956 ;src/main.c:813: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   875B 21 00 0E      [10] 3957 	ld	hl,#0x0E00
   875E E5            [11] 3958 	push	hl
   875F 26 C0         [ 7] 3959 	ld	h, #0xC0
   8761 E5            [11] 3960 	push	hl
   8762 CD 69 64      [17] 3961 	call	_cpct_getScreenPtr
   8765 4D            [ 4] 3962 	ld	c,l
   8766 44            [ 4] 3963 	ld	b,h
                           3964 ;src/main.c:814: cpct_drawStringM0("00000", memptr, 15, 0);
   8767 21 0F 00      [10] 3965 	ld	hl,#0x000F
   876A E5            [11] 3966 	push	hl
   876B C5            [11] 3967 	push	bc
   876C 21 EC 87      [10] 3968 	ld	hl,#___str_2
   876F E5            [11] 3969 	push	hl
   8770 CD 99 58      [17] 3970 	call	_cpct_drawStringM0
   8773 21 06 00      [10] 3971 	ld	hl,#6
   8776 39            [11] 3972 	add	hl,sp
   8777 F9            [ 6] 3973 	ld	sp,hl
                           3974 ;src/main.c:817: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 14);
   8778 21 1A 0E      [10] 3975 	ld	hl,#0x0E1A
   877B E5            [11] 3976 	push	hl
   877C 21 00 C0      [10] 3977 	ld	hl,#0xC000
   877F E5            [11] 3978 	push	hl
   8780 CD 69 64      [17] 3979 	call	_cpct_getScreenPtr
   8783 4D            [ 4] 3980 	ld	c,l
   8784 44            [ 4] 3981 	ld	b,h
                           3982 ;src/main.c:818: cpct_drawStringM0("ROBOBIT", memptr, 3, 0);
   8785 21 03 00      [10] 3983 	ld	hl,#0x0003
   8788 E5            [11] 3984 	push	hl
   8789 C5            [11] 3985 	push	bc
   878A 21 F2 87      [10] 3986 	ld	hl,#___str_3
   878D E5            [11] 3987 	push	hl
   878E CD 99 58      [17] 3988 	call	_cpct_drawStringM0
   8791 21 06 00      [10] 3989 	ld	hl,#6
   8794 39            [11] 3990 	add	hl,sp
   8795 F9            [ 6] 3991 	ld	sp,hl
                           3992 ;src/main.c:820: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   8796 21 3C 02      [10] 3993 	ld	hl,#0x023C
   8799 E5            [11] 3994 	push	hl
   879A 21 00 C0      [10] 3995 	ld	hl,#0xC000
   879D E5            [11] 3996 	push	hl
   879E CD 69 64      [17] 3997 	call	_cpct_getScreenPtr
   87A1 4D            [ 4] 3998 	ld	c,l
   87A2 44            [ 4] 3999 	ld	b,h
                           4000 ;src/main.c:821: cpct_drawStringM0("LIVES", memptr, 1, 0);
   87A3 21 01 00      [10] 4001 	ld	hl,#0x0001
   87A6 E5            [11] 4002 	push	hl
   87A7 C5            [11] 4003 	push	bc
   87A8 21 FA 87      [10] 4004 	ld	hl,#___str_4
   87AB E5            [11] 4005 	push	hl
   87AC CD 99 58      [17] 4006 	call	_cpct_drawStringM0
   87AF 21 06 00      [10] 4007 	ld	hl,#6
   87B2 39            [11] 4008 	add	hl,sp
   87B3 F9            [ 6] 4009 	ld	sp,hl
                           4010 ;src/main.c:823: for(i=0; i<5; i++){
   87B4 01 00 00      [10] 4011 	ld	bc,#0x0000
   87B7                    4012 00102$:
                           4013 ;src/main.c:824: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   87B7 79            [ 4] 4014 	ld	a,c
   87B8 87            [ 4] 4015 	add	a, a
   87B9 87            [ 4] 4016 	add	a, a
   87BA C6 3C         [ 7] 4017 	add	a, #0x3C
   87BC 57            [ 4] 4018 	ld	d,a
   87BD C5            [11] 4019 	push	bc
   87BE 3E 0E         [ 7] 4020 	ld	a,#0x0E
   87C0 F5            [11] 4021 	push	af
   87C1 33            [ 6] 4022 	inc	sp
   87C2 D5            [11] 4023 	push	de
   87C3 33            [ 6] 4024 	inc	sp
   87C4 21 00 C0      [10] 4025 	ld	hl,#0xC000
   87C7 E5            [11] 4026 	push	hl
   87C8 CD 69 64      [17] 4027 	call	_cpct_getScreenPtr
   87CB EB            [ 4] 4028 	ex	de,hl
   87CC 21 03 06      [10] 4029 	ld	hl,#0x0603
   87CF E5            [11] 4030 	push	hl
   87D0 D5            [11] 4031 	push	de
   87D1 21 60 48      [10] 4032 	ld	hl,#_g_heart
   87D4 E5            [11] 4033 	push	hl
   87D5 CD BD 58      [17] 4034 	call	_cpct_drawSprite
   87D8 C1            [10] 4035 	pop	bc
                           4036 ;src/main.c:823: for(i=0; i<5; i++){
   87D9 03            [ 6] 4037 	inc	bc
   87DA 79            [ 4] 4038 	ld	a,c
   87DB D6 05         [ 7] 4039 	sub	a, #0x05
   87DD 78            [ 4] 4040 	ld	a,b
   87DE 17            [ 4] 4041 	rla
   87DF 3F            [ 4] 4042 	ccf
   87E0 1F            [ 4] 4043 	rra
   87E1 DE 80         [ 7] 4044 	sbc	a, #0x80
   87E3 38 D2         [12] 4045 	jr	C,00102$
   87E5 C9            [10] 4046 	ret
   87E6                    4047 ___str_1:
   87E6 53 43 4F 52 45     4048 	.ascii "SCORE"
   87EB 00                 4049 	.db 0x00
   87EC                    4050 ___str_2:
   87EC 30 30 30 30 30     4051 	.ascii "00000"
   87F1 00                 4052 	.db 0x00
   87F2                    4053 ___str_3:
   87F2 52 4F 42 4F 42 49  4054 	.ascii "ROBOBIT"
        54
   87F9 00                 4055 	.db 0x00
   87FA                    4056 ___str_4:
   87FA 4C 49 56 45 53     4057 	.ascii "LIVES"
   87FF 00                 4058 	.db 0x00
                           4059 ;src/main.c:829: void borrarPantallaArriba(u8 x, u8 y, u8 ancho, u8 alto){
                           4060 ;	---------------------------------
                           4061 ; Function borrarPantallaArriba
                           4062 ; ---------------------------------
   8800                    4063 _borrarPantallaArriba::
   8800 DD E5         [15] 4064 	push	ix
   8802 DD 21 00 00   [14] 4065 	ld	ix,#0
   8806 DD 39         [15] 4066 	add	ix,sp
                           4067 ;src/main.c:832: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   8808 DD 66 05      [19] 4068 	ld	h,5 (ix)
   880B DD 6E 04      [19] 4069 	ld	l,4 (ix)
   880E E5            [11] 4070 	push	hl
   880F 21 00 C0      [10] 4071 	ld	hl,#0xC000
   8812 E5            [11] 4072 	push	hl
   8813 CD 69 64      [17] 4073 	call	_cpct_getScreenPtr
   8816 4D            [ 4] 4074 	ld	c,l
   8817 44            [ 4] 4075 	ld	b,h
                           4076 ;src/main.c:833: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra la mitad derecha
   8818 DD 66 07      [19] 4077 	ld	h,7 (ix)
   881B DD 6E 06      [19] 4078 	ld	l,6 (ix)
   881E E5            [11] 4079 	push	hl
   881F AF            [ 4] 4080 	xor	a, a
   8820 F5            [11] 4081 	push	af
   8821 33            [ 6] 4082 	inc	sp
   8822 C5            [11] 4083 	push	bc
   8823 CD 8F 63      [17] 4084 	call	_cpct_drawSolidBox
   8826 F1            [10] 4085 	pop	af
   8827 F1            [10] 4086 	pop	af
   8828 33            [ 6] 4087 	inc	sp
                           4088 ;src/main.c:834: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   8829 DD 7E 04      [19] 4089 	ld	a,4 (ix)
   882C C6 28         [ 7] 4090 	add	a, #0x28
   882E 47            [ 4] 4091 	ld	b,a
   882F DD 7E 05      [19] 4092 	ld	a,5 (ix)
   8832 F5            [11] 4093 	push	af
   8833 33            [ 6] 4094 	inc	sp
   8834 C5            [11] 4095 	push	bc
   8835 33            [ 6] 4096 	inc	sp
   8836 21 00 C0      [10] 4097 	ld	hl,#0xC000
   8839 E5            [11] 4098 	push	hl
   883A CD 69 64      [17] 4099 	call	_cpct_getScreenPtr
   883D 4D            [ 4] 4100 	ld	c,l
   883E 44            [ 4] 4101 	ld	b,h
                           4102 ;src/main.c:835: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra la mitad izquierda
   883F DD 66 07      [19] 4103 	ld	h,7 (ix)
   8842 DD 6E 06      [19] 4104 	ld	l,6 (ix)
   8845 E5            [11] 4105 	push	hl
   8846 AF            [ 4] 4106 	xor	a, a
   8847 F5            [11] 4107 	push	af
   8848 33            [ 6] 4108 	inc	sp
   8849 C5            [11] 4109 	push	bc
   884A CD 8F 63      [17] 4110 	call	_cpct_drawSolidBox
   884D F1            [10] 4111 	pop	af
   884E F1            [10] 4112 	pop	af
   884F 33            [ 6] 4113 	inc	sp
   8850 DD E1         [14] 4114 	pop	ix
   8852 C9            [10] 4115 	ret
                           4116 ;src/main.c:838: void menuInicio(){
                           4117 ;	---------------------------------
                           4118 ; Function menuInicio
                           4119 ; ---------------------------------
   8853                    4120 _menuInicio::
                           4121 ;src/main.c:842: cpct_clearScreen(0);
   8853 21 00 40      [10] 4122 	ld	hl,#0x4000
   8856 E5            [11] 4123 	push	hl
   8857 AF            [ 4] 4124 	xor	a, a
   8858 F5            [11] 4125 	push	af
   8859 33            [ 6] 4126 	inc	sp
   885A 26 C0         [ 7] 4127 	ld	h, #0xC0
   885C E5            [11] 4128 	push	hl
   885D CD 48 5B      [17] 4129 	call	_cpct_memset
                           4130 ;src/main.c:844: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   8860 21 1A 0F      [10] 4131 	ld	hl,#0x0F1A
   8863 E5            [11] 4132 	push	hl
   8864 21 00 C0      [10] 4133 	ld	hl,#0xC000
   8867 E5            [11] 4134 	push	hl
   8868 CD 69 64      [17] 4135 	call	_cpct_getScreenPtr
   886B 4D            [ 4] 4136 	ld	c,l
   886C 44            [ 4] 4137 	ld	b,h
                           4138 ;src/main.c:845: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   886D 21 04 00      [10] 4139 	ld	hl,#0x0004
   8870 E5            [11] 4140 	push	hl
   8871 C5            [11] 4141 	push	bc
   8872 21 06 89      [10] 4142 	ld	hl,#___str_5
   8875 E5            [11] 4143 	push	hl
   8876 CD 99 58      [17] 4144 	call	_cpct_drawStringM0
   8879 21 06 00      [10] 4145 	ld	hl,#6
   887C 39            [11] 4146 	add	hl,sp
   887D F9            [ 6] 4147 	ld	sp,hl
                           4148 ;src/main.c:847: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   887E 21 28 6E      [10] 4149 	ld	hl,#0x6E28
   8881 E5            [11] 4150 	push	hl
   8882 21 F0 F0      [10] 4151 	ld	hl,#0xF0F0
   8885 E5            [11] 4152 	push	hl
   8886 21 00 26      [10] 4153 	ld	hl,#_g_text_0
   8889 E5            [11] 4154 	push	hl
   888A CD BD 58      [17] 4155 	call	_cpct_drawSprite
                           4156 ;src/main.c:848: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   888D 21 28 6E      [10] 4157 	ld	hl,#0x6E28
   8890 E5            [11] 4158 	push	hl
   8891 21 18 F1      [10] 4159 	ld	hl,#0xF118
   8894 E5            [11] 4160 	push	hl
   8895 21 30 37      [10] 4161 	ld	hl,#_g_text_1
   8898 E5            [11] 4162 	push	hl
   8899 CD BD 58      [17] 4163 	call	_cpct_drawSprite
                           4164 ;src/main.c:871: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   889C 21 08 A0      [10] 4165 	ld	hl,#0xA008
   889F E5            [11] 4166 	push	hl
   88A0 21 00 C0      [10] 4167 	ld	hl,#0xC000
   88A3 E5            [11] 4168 	push	hl
   88A4 CD 69 64      [17] 4169 	call	_cpct_getScreenPtr
   88A7 4D            [ 4] 4170 	ld	c,l
   88A8 44            [ 4] 4171 	ld	b,h
                           4172 ;src/main.c:872: cpct_drawStringM0("TO START PRESS S", memptr, 4, 0);
   88A9 21 04 00      [10] 4173 	ld	hl,#0x0004
   88AC E5            [11] 4174 	push	hl
   88AD C5            [11] 4175 	push	bc
   88AE 21 0E 89      [10] 4176 	ld	hl,#___str_6
   88B1 E5            [11] 4177 	push	hl
   88B2 CD 99 58      [17] 4178 	call	_cpct_drawStringM0
   88B5 21 06 00      [10] 4179 	ld	hl,#6
   88B8 39            [11] 4180 	add	hl,sp
   88B9 F9            [ 6] 4181 	ld	sp,hl
                           4182 ;src/main.c:874: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 170); // centrado en horizontal y abajo en vertical
   88BA 21 0A AA      [10] 4183 	ld	hl,#0xAA0A
   88BD E5            [11] 4184 	push	hl
   88BE 21 00 C0      [10] 4185 	ld	hl,#0xC000
   88C1 E5            [11] 4186 	push	hl
   88C2 CD 69 64      [17] 4187 	call	_cpct_getScreenPtr
   88C5 4D            [ 4] 4188 	ld	c,l
   88C6 44            [ 4] 4189 	ld	b,h
                           4190 ;src/main.c:875: cpct_drawStringM0("TO MENU PRESS M", memptr, 4, 0);
   88C7 21 04 00      [10] 4191 	ld	hl,#0x0004
   88CA E5            [11] 4192 	push	hl
   88CB C5            [11] 4193 	push	bc
   88CC 21 1F 89      [10] 4194 	ld	hl,#___str_7
   88CF E5            [11] 4195 	push	hl
   88D0 CD 99 58      [17] 4196 	call	_cpct_drawStringM0
   88D3 21 06 00      [10] 4197 	ld	hl,#6
   88D6 39            [11] 4198 	add	hl,sp
   88D7 F9            [ 6] 4199 	ld	sp,hl
                           4200 ;src/main.c:878: do{
   88D8                    4201 00106$:
                           4202 ;src/main.c:879: cpct_scanKeyboard_f();
   88D8 CD 23 58      [17] 4203 	call	_cpct_scanKeyboard_f
                           4204 ;src/main.c:883: if(cpct_isKeyPressed(Key_M)){
   88DB 21 04 40      [10] 4205 	ld	hl,#0x4004
   88DE CD 17 58      [17] 4206 	call	_cpct_isKeyPressed
   88E1 7D            [ 4] 4207 	ld	a,l
   88E2 B7            [ 4] 4208 	or	a, a
   88E3 28 0D         [12] 4209 	jr	Z,00107$
                           4210 ;src/main.c:884: cpct_scanKeyboard_f();
   88E5 CD 23 58      [17] 4211 	call	_cpct_scanKeyboard_f
                           4212 ;src/main.c:885: do{
   88E8                    4213 00101$:
                           4214 ;src/main.c:887: } while(!cpct_isKeyPressed(Key_S));
   88E8 21 07 10      [10] 4215 	ld	hl,#0x1007
   88EB CD 17 58      [17] 4216 	call	_cpct_isKeyPressed
   88EE 7D            [ 4] 4217 	ld	a,l
   88EF B7            [ 4] 4218 	or	a, a
   88F0 28 F6         [12] 4219 	jr	Z,00101$
   88F2                    4220 00107$:
                           4221 ;src/main.c:889: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   88F2 21 07 10      [10] 4222 	ld	hl,#0x1007
   88F5 CD 17 58      [17] 4223 	call	_cpct_isKeyPressed
   88F8 7D            [ 4] 4224 	ld	a,l
   88F9 B7            [ 4] 4225 	or	a, a
   88FA C0            [11] 4226 	ret	NZ
   88FB 21 04 40      [10] 4227 	ld	hl,#0x4004
   88FE CD 17 58      [17] 4228 	call	_cpct_isKeyPressed
   8901 7D            [ 4] 4229 	ld	a,l
   8902 B7            [ 4] 4230 	or	a, a
   8903 28 D3         [12] 4231 	jr	Z,00106$
   8905 C9            [10] 4232 	ret
   8906                    4233 ___str_5:
   8906 52 4F 42 4F 42 49  4234 	.ascii "ROBOBIT"
        54
   890D 00                 4235 	.db 0x00
   890E                    4236 ___str_6:
   890E 54 4F 20 53 54 41  4237 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   891E 00                 4238 	.db 0x00
   891F                    4239 ___str_7:
   891F 54 4F 20 4D 45 4E  4240 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   892E 00                 4241 	.db 0x00
                           4242 ;src/main.c:892: void inicializarCPC() {
                           4243 ;	---------------------------------
                           4244 ; Function inicializarCPC
                           4245 ; ---------------------------------
   892F                    4246 _inicializarCPC::
                           4247 ;src/main.c:893: cpct_disableFirmware();
   892F CD 7F 63      [17] 4248 	call	_cpct_disableFirmware
                           4249 ;src/main.c:894: cpct_setVideoMode(0);
   8932 2E 00         [ 7] 4250 	ld	l,#0x00
   8934 CD 2A 5B      [17] 4251 	call	_cpct_setVideoMode
                           4252 ;src/main.c:895: cpct_setBorder(HW_BLACK);
   8937 21 10 14      [10] 4253 	ld	hl,#0x1410
   893A E5            [11] 4254 	push	hl
   893B CD 8D 58      [17] 4255 	call	_cpct_setPALColour
                           4256 ;src/main.c:896: cpct_setPalette(g_palette, 16);
   893E 21 10 00      [10] 4257 	ld	hl,#0x0010
   8941 E5            [11] 4258 	push	hl
   8942 21 98 4A      [10] 4259 	ld	hl,#_g_palette
   8945 E5            [11] 4260 	push	hl
   8946 CD 00 58      [17] 4261 	call	_cpct_setPalette
                           4262 ;src/main.c:897: cpct_akp_musicInit(G_song);
   8949 21 00 0F      [10] 4263 	ld	hl,#_G_song
   894C E5            [11] 4264 	push	hl
   894D CD 5B 62      [17] 4265 	call	_cpct_akp_musicInit
   8950 F1            [10] 4266 	pop	af
   8951 C9            [10] 4267 	ret
                           4268 ;src/main.c:900: void inicializarEnemy() {
                           4269 ;	---------------------------------
                           4270 ; Function inicializarEnemy
                           4271 ; ---------------------------------
   8952                    4272 _inicializarEnemy::
   8952 DD E5         [15] 4273 	push	ix
   8954 DD 21 00 00   [14] 4274 	ld	ix,#0
   8958 DD 39         [15] 4275 	add	ix,sp
   895A 21 F9 FF      [10] 4276 	ld	hl,#-7
   895D 39            [11] 4277 	add	hl,sp
   895E F9            [ 6] 4278 	ld	sp,hl
                           4279 ;src/main.c:911: actual = enemy;
   895F 01 C6 64      [10] 4280 	ld	bc,#_enemy+0
                           4281 ;src/main.c:912: while(--i){
   8962 DD 36 F9 02   [19] 4282 	ld	-7 (ix),#0x02
   8966                    4283 00101$:
   8966 DD 35 F9      [23] 4284 	dec	-7 (ix)
   8969 DD 7E F9      [19] 4285 	ld	a,-7 (ix)
   896C B7            [ 4] 4286 	or	a, a
   896D CA 43 8A      [10] 4287 	jp	Z,00104$
                           4288 ;src/main.c:913: actual->x = actual->px = spawnX[i];
   8970 59            [ 4] 4289 	ld	e, c
   8971 50            [ 4] 4290 	ld	d, b
   8972 13            [ 6] 4291 	inc	de
   8973 13            [ 6] 4292 	inc	de
   8974 3E 8F         [ 7] 4293 	ld	a,#<(_spawnX)
   8976 DD 86 F9      [19] 4294 	add	a, -7 (ix)
   8979 DD 77 FE      [19] 4295 	ld	-2 (ix),a
   897C 3E 72         [ 7] 4296 	ld	a,#>(_spawnX)
   897E CE 00         [ 7] 4297 	adc	a, #0x00
   8980 DD 77 FF      [19] 4298 	ld	-1 (ix),a
   8983 DD 6E FE      [19] 4299 	ld	l,-2 (ix)
   8986 DD 66 FF      [19] 4300 	ld	h,-1 (ix)
   8989 7E            [ 7] 4301 	ld	a,(hl)
   898A DD 77 FD      [19] 4302 	ld	-3 (ix), a
   898D 12            [ 7] 4303 	ld	(de),a
   898E DD 7E FD      [19] 4304 	ld	a,-3 (ix)
   8991 02            [ 7] 4305 	ld	(bc),a
                           4306 ;src/main.c:914: actual->y = actual->py = spawnY[i];
   8992 59            [ 4] 4307 	ld	e, c
   8993 50            [ 4] 4308 	ld	d, b
   8994 13            [ 6] 4309 	inc	de
   8995 21 03 00      [10] 4310 	ld	hl,#0x0003
   8998 09            [11] 4311 	add	hl,bc
   8999 DD 75 FB      [19] 4312 	ld	-5 (ix),l
   899C DD 74 FC      [19] 4313 	ld	-4 (ix),h
   899F FD 21 94 72   [14] 4314 	ld	iy,#_spawnY
   89A3 C5            [11] 4315 	push	bc
   89A4 DD 4E F9      [19] 4316 	ld	c,-7 (ix)
   89A7 06 00         [ 7] 4317 	ld	b,#0x00
   89A9 FD 09         [15] 4318 	add	iy, bc
   89AB C1            [10] 4319 	pop	bc
   89AC FD 7E 00      [19] 4320 	ld	a, 0 (iy)
   89AF DD 77 FA      [19] 4321 	ld	-6 (ix),a
   89B2 DD 6E FB      [19] 4322 	ld	l,-5 (ix)
   89B5 DD 66 FC      [19] 4323 	ld	h,-4 (ix)
   89B8 DD 7E FA      [19] 4324 	ld	a,-6 (ix)
   89BB 77            [ 7] 4325 	ld	(hl),a
   89BC DD 7E FA      [19] 4326 	ld	a,-6 (ix)
   89BF 12            [ 7] 4327 	ld	(de),a
                           4328 ;src/main.c:915: actual->mover  = NO;
   89C0 21 06 00      [10] 4329 	ld	hl,#0x0006
   89C3 09            [11] 4330 	add	hl,bc
   89C4 36 00         [10] 4331 	ld	(hl),#0x00
                           4332 ;src/main.c:916: actual->mira   = M_abajo;
   89C6 21 07 00      [10] 4333 	ld	hl,#0x0007
   89C9 09            [11] 4334 	add	hl,bc
   89CA 36 03         [10] 4335 	ld	(hl),#0x03
                           4336 ;src/main.c:917: actual->sprite = g_enemy;
   89CC 21 04 00      [10] 4337 	ld	hl,#0x0004
   89CF 09            [11] 4338 	add	hl,bc
   89D0 36 72         [10] 4339 	ld	(hl),#<(_g_enemy)
   89D2 23            [ 6] 4340 	inc	hl
   89D3 36 48         [10] 4341 	ld	(hl),#>(_g_enemy)
                           4342 ;src/main.c:918: actual->muerto = NO;
   89D5 21 08 00      [10] 4343 	ld	hl,#0x0008
   89D8 09            [11] 4344 	add	hl,bc
   89D9 36 00         [10] 4345 	ld	(hl),#0x00
                           4346 ;src/main.c:919: actual->muertes = 0;
   89DB 21 0A 00      [10] 4347 	ld	hl,#0x000A
   89DE 09            [11] 4348 	add	hl,bc
   89DF 36 00         [10] 4349 	ld	(hl),#0x00
                           4350 ;src/main.c:920: actual->patrolling = SI;
   89E1 21 0B 00      [10] 4351 	ld	hl,#0x000B
   89E4 09            [11] 4352 	add	hl,bc
   89E5 36 01         [10] 4353 	ld	(hl),#0x01
                           4354 ;src/main.c:921: actual->onPathPatrol = SI;
   89E7 21 0C 00      [10] 4355 	ld	hl,#0x000C
   89EA 09            [11] 4356 	add	hl,bc
   89EB 36 01         [10] 4357 	ld	(hl),#0x01
                           4358 ;src/main.c:922: actual->reversePatrol = NO;
   89ED 21 0D 00      [10] 4359 	ld	hl,#0x000D
   89F0 09            [11] 4360 	add	hl,bc
   89F1 36 00         [10] 4361 	ld	(hl),#0x00
                           4362 ;src/main.c:923: actual->iter = 0;
   89F3 21 0F 00      [10] 4363 	ld	hl,#0x000F
   89F6 09            [11] 4364 	add	hl,bc
   89F7 36 00         [10] 4365 	ld	(hl),#0x00
                           4366 ;src/main.c:924: actual->lastIter = 0;
   89F9 21 10 00      [10] 4367 	ld	hl,#0x0010
   89FC 09            [11] 4368 	add	hl,bc
   89FD 36 00         [10] 4369 	ld	(hl),#0x00
                           4370 ;src/main.c:925: actual->seen = 0;
   89FF 21 12 00      [10] 4371 	ld	hl,#0x0012
   8A02 09            [11] 4372 	add	hl,bc
   8A03 36 00         [10] 4373 	ld	(hl),#0x00
                           4374 ;src/main.c:926: actual->found = 0;
   8A05 21 13 00      [10] 4375 	ld	hl,#0x0013
   8A08 09            [11] 4376 	add	hl,bc
   8A09 36 00         [10] 4377 	ld	(hl),#0x00
                           4378 ;src/main.c:927: pathFinding(actual->x, actual->y, spawnX[i] - 20, spawnY[i], actual, mapa); // calculo rutas de patrulla
   8A0B FD 5E 00      [19] 4379 	ld	e, 0 (iy)
   8A0E DD 6E FE      [19] 4380 	ld	l,-2 (ix)
   8A11 DD 66 FF      [19] 4381 	ld	h,-1 (ix)
   8A14 7E            [ 7] 4382 	ld	a,(hl)
   8A15 C6 EC         [ 7] 4383 	add	a,#0xEC
   8A17 57            [ 4] 4384 	ld	d,a
   8A18 C5            [11] 4385 	push	bc
   8A19 2A E9 69      [16] 4386 	ld	hl,(_mapa)
   8A1C E5            [11] 4387 	push	hl
   8A1D C5            [11] 4388 	push	bc
   8A1E 7B            [ 4] 4389 	ld	a,e
   8A1F F5            [11] 4390 	push	af
   8A20 33            [ 6] 4391 	inc	sp
   8A21 D5            [11] 4392 	push	de
   8A22 33            [ 6] 4393 	inc	sp
   8A23 DD 66 FA      [19] 4394 	ld	h,-6 (ix)
   8A26 DD 6E FD      [19] 4395 	ld	l,-3 (ix)
   8A29 E5            [11] 4396 	push	hl
   8A2A CD 62 54      [17] 4397 	call	_pathFinding
   8A2D 21 08 00      [10] 4398 	ld	hl,#8
   8A30 39            [11] 4399 	add	hl,sp
   8A31 F9            [ 6] 4400 	ld	sp,hl
   8A32 C1            [10] 4401 	pop	bc
                           4402 ;src/main.c:950: dibujarEnemigo(actual);
   8A33 C5            [11] 4403 	push	bc
   8A34 C5            [11] 4404 	push	bc
   8A35 CD 14 75      [17] 4405 	call	_dibujarEnemigo
   8A38 F1            [10] 4406 	pop	af
   8A39 C1            [10] 4407 	pop	bc
                           4408 ;src/main.c:952: ++actual;
   8A3A 21 44 01      [10] 4409 	ld	hl,#0x0144
   8A3D 09            [11] 4410 	add	hl,bc
   8A3E 4D            [ 4] 4411 	ld	c,l
   8A3F 44            [ 4] 4412 	ld	b,h
   8A40 C3 66 89      [10] 4413 	jp	00101$
   8A43                    4414 00104$:
   8A43 DD F9         [10] 4415 	ld	sp, ix
   8A45 DD E1         [14] 4416 	pop	ix
   8A47 C9            [10] 4417 	ret
                           4418 ;src/main.c:956: void inicializarJuego() {
                           4419 ;	---------------------------------
                           4420 ; Function inicializarJuego
                           4421 ; ---------------------------------
   8A48                    4422 _inicializarJuego::
                           4423 ;src/main.c:958: iter = 0;
   8A48 21 E8 69      [10] 4424 	ld	hl,#_iter + 0
   8A4B 36 00         [10] 4425 	ld	(hl), #0x00
                           4426 ;src/main.c:959: num_mapa = 0;
   8A4D 21 EB 69      [10] 4427 	ld	hl,#_num_mapa + 0
   8A50 36 00         [10] 4428 	ld	(hl), #0x00
                           4429 ;src/main.c:960: mapa = mapas[num_mapa];
   8A52 21 89 72      [10] 4430 	ld	hl, #_mapas + 0
   8A55 7E            [ 7] 4431 	ld	a,(hl)
   8A56 FD 21 E9 69   [14] 4432 	ld	iy,#_mapa
   8A5A FD 77 00      [19] 4433 	ld	0 (iy),a
   8A5D 23            [ 6] 4434 	inc	hl
   8A5E 7E            [ 7] 4435 	ld	a,(hl)
   8A5F 32 EA 69      [13] 4436 	ld	(#_mapa + 1),a
                           4437 ;src/main.c:961: cpct_etm_setTileset2x4(g_tileset);
   8A62 21 E0 24      [10] 4438 	ld	hl,#_g_tileset
   8A65 CD F1 59      [17] 4439 	call	_cpct_etm_setTileset2x4
                           4440 ;src/main.c:963: dibujarMapa();
   8A68 CD 73 72      [17] 4441 	call	_dibujarMapa
                           4442 ;src/main.c:965: borrarPantallaArriba(0, 0, 40, 1);
   8A6B 21 28 01      [10] 4443 	ld	hl,#0x0128
   8A6E E5            [11] 4444 	push	hl
   8A6F 21 00 00      [10] 4445 	ld	hl,#0x0000
   8A72 E5            [11] 4446 	push	hl
   8A73 CD 00 88      [17] 4447 	call	_borrarPantallaArriba
   8A76 F1            [10] 4448 	pop	af
   8A77 F1            [10] 4449 	pop	af
                           4450 ;src/main.c:966: barraPuntuacionInicial();
   8A78 CD 3E 87      [17] 4451 	call	_barraPuntuacionInicial
                           4452 ;src/main.c:969: prota.x = prota.px = 5;
   8A7B 21 D8 69      [10] 4453 	ld	hl,#(_prota + 0x0002)
   8A7E 36 05         [10] 4454 	ld	(hl),#0x05
   8A80 21 D6 69      [10] 4455 	ld	hl,#_prota
   8A83 36 05         [10] 4456 	ld	(hl),#0x05
                           4457 ;src/main.c:970: prota.y = prota.py = 76 + ORIGEN_MAPA_Y;
   8A85 21 D9 69      [10] 4458 	ld	hl,#(_prota + 0x0003)
   8A88 36 64         [10] 4459 	ld	(hl),#0x64
   8A8A 21 D7 69      [10] 4460 	ld	hl,#(_prota + 0x0001)
   8A8D 36 64         [10] 4461 	ld	(hl),#0x64
                           4462 ;src/main.c:971: prota.mover  = NO;
   8A8F 21 DC 69      [10] 4463 	ld	hl,#(_prota + 0x0006)
   8A92 36 00         [10] 4464 	ld	(hl),#0x00
                           4465 ;src/main.c:972: prota.mira=M_derecha;
   8A94 21 DD 69      [10] 4466 	ld	hl,#(_prota + 0x0007)
   8A97 36 00         [10] 4467 	ld	(hl),#0x00
                           4468 ;src/main.c:973: prota.sprite = g_hero;
   8A99 21 A8 4A      [10] 4469 	ld	hl,#_g_hero
   8A9C 22 DA 69      [16] 4470 	ld	((_prota + 0x0004)), hl
                           4471 ;src/main.c:977: cu.x = cu.px = 0;
   8A9F 21 E0 69      [10] 4472 	ld	hl,#(_cu + 0x0002)
   8AA2 36 00         [10] 4473 	ld	(hl),#0x00
   8AA4 21 DE 69      [10] 4474 	ld	hl,#_cu
   8AA7 36 00         [10] 4475 	ld	(hl),#0x00
                           4476 ;src/main.c:978: cu.y = cu.py = 0;
   8AA9 21 E1 69      [10] 4477 	ld	hl,#(_cu + 0x0003)
   8AAC 36 00         [10] 4478 	ld	(hl),#0x00
   8AAE 21 DF 69      [10] 4479 	ld	hl,#(_cu + 0x0001)
   8AB1 36 00         [10] 4480 	ld	(hl),#0x00
                           4481 ;src/main.c:979: cu.lanzado = NO;
   8AB3 21 E4 69      [10] 4482 	ld	hl,#(_cu + 0x0006)
   8AB6 36 00         [10] 4483 	ld	(hl),#0x00
                           4484 ;src/main.c:980: cu.mover = NO;
   8AB8 21 E7 69      [10] 4485 	ld	hl,#(_cu + 0x0009)
   8ABB 36 00         [10] 4486 	ld	(hl),#0x00
                           4487 ;src/main.c:982: inicializarEnemy();
   8ABD CD 52 89      [17] 4488 	call	_inicializarEnemy
                           4489 ;src/main.c:984: dibujarProta();
   8AC0 C3 99 72      [10] 4490 	jp  _dibujarProta
                           4491 ;src/main.c:987: void main(void) {
                           4492 ;	---------------------------------
                           4493 ; Function main
                           4494 ; ---------------------------------
   8AC3                    4495 _main::
   8AC3 DD E5         [15] 4496 	push	ix
   8AC5 DD 21 00 00   [14] 4497 	ld	ix,#0
   8AC9 DD 39         [15] 4498 	add	ix,sp
   8ACB 3B            [ 6] 4499 	dec	sp
                           4500 ;src/main.c:992: inicializarCPC();
   8ACC CD 2F 89      [17] 4501 	call	_inicializarCPC
                           4502 ;src/main.c:993: menuInicio();
   8ACF CD 53 88      [17] 4503 	call	_menuInicio
                           4504 ;src/main.c:995: inicializarJuego();
   8AD2 CD 48 8A      [17] 4505 	call	_inicializarJuego
                           4506 ;src/main.c:996: cpct_akp_musicPlay();
   8AD5 CD 58 5B      [17] 4507 	call	_cpct_akp_musicPlay
                           4508 ;src/main.c:998: while (1) {
   8AD8                    4509 00119$:
                           4510 ;src/main.c:1001: i = 1 + 1;
   8AD8 DD 36 FF 02   [19] 4511 	ld	-1 (ix),#0x02
                           4512 ;src/main.c:1004: comprobarTeclado();
   8ADC CD 36 86      [17] 4513 	call	_comprobarTeclado
                           4514 ;src/main.c:1005: moverCuchillo();
   8ADF CD 99 86      [17] 4515 	call	_moverCuchillo
                           4516 ;src/main.c:1006: updateEnemies();
   8AE2 CD 70 82      [17] 4517 	call	_updateEnemies
                           4518 ;src/main.c:1021: actual = enemy;
                           4519 ;src/main.c:1023: cpct_waitVSYNC();
   8AE5 CD 22 5B      [17] 4520 	call	_cpct_waitVSYNC
                           4521 ;src/main.c:1025: if (prota.mover) {
   8AE8 01 DC 69      [10] 4522 	ld	bc,#_prota+6
   8AEB 0A            [ 7] 4523 	ld	a,(bc)
   8AEC B7            [ 4] 4524 	or	a, a
   8AED 28 07         [12] 4525 	jr	Z,00102$
                           4526 ;src/main.c:1026: redibujarProta();
   8AEF C5            [11] 4527 	push	bc
   8AF0 CD 6A 73      [17] 4528 	call	_redibujarProta
   8AF3 C1            [10] 4529 	pop	bc
                           4530 ;src/main.c:1027: prota.mover = NO;
   8AF4 AF            [ 4] 4531 	xor	a, a
   8AF5 02            [ 7] 4532 	ld	(bc),a
   8AF6                    4533 00102$:
                           4534 ;src/main.c:1029: if(cu.lanzado && cu.mover){
   8AF6 21 E4 69      [10] 4535 	ld	hl,#_cu + 6
   8AF9 4E            [ 7] 4536 	ld	c,(hl)
   8AFA 11 E7 69      [10] 4537 	ld	de,#_cu + 9
   8AFD 79            [ 4] 4538 	ld	a,c
   8AFE B7            [ 4] 4539 	or	a, a
   8AFF 28 09         [12] 4540 	jr	Z,00107$
   8B01 1A            [ 7] 4541 	ld	a,(de)
   8B02 B7            [ 4] 4542 	or	a, a
   8B03 28 05         [12] 4543 	jr	Z,00107$
                           4544 ;src/main.c:1030: redibujarCuchillo();
   8B05 CD 06 85      [17] 4545 	call	_redibujarCuchillo
   8B08 18 0B         [12] 4546 	jr	00132$
   8B0A                    4547 00107$:
                           4548 ;src/main.c:1031: }else if (cu.lanzado && !cu.mover){
   8B0A 79            [ 4] 4549 	ld	a,c
   8B0B B7            [ 4] 4550 	or	a, a
   8B0C 28 07         [12] 4551 	jr	Z,00132$
   8B0E 1A            [ 7] 4552 	ld	a,(de)
   8B0F B7            [ 4] 4553 	or	a, a
   8B10 20 03         [12] 4554 	jr	NZ,00132$
                           4555 ;src/main.c:1032: borrarCuchillo();
   8B12 CD 88 84      [17] 4556 	call	_borrarCuchillo
                           4557 ;src/main.c:1035: while(--i){
   8B15                    4558 00132$:
   8B15 01 C6 64      [10] 4559 	ld	bc,#_enemy
   8B18                    4560 00115$:
   8B18 DD 35 FF      [23] 4561 	dec	-1 (ix)
   8B1B DD 7E FF      [19] 4562 	ld	a, -1 (ix)
   8B1E B7            [ 4] 4563 	or	a, a
   8B1F 28 43         [12] 4564 	jr	Z,00117$
                           4565 ;src/main.c:1036: if(actual->mover){
   8B21 C5            [11] 4566 	push	bc
   8B22 FD E1         [14] 4567 	pop	iy
   8B24 FD 7E 06      [19] 4568 	ld	a,6 (iy)
   8B27 B7            [ 4] 4569 	or	a, a
   8B28 28 07         [12] 4570 	jr	Z,00111$
                           4571 ;src/main.c:1037: redibujarEnemigo(actual);
   8B2A C5            [11] 4572 	push	bc
   8B2B C5            [11] 4573 	push	bc
   8B2C CD 88 76      [17] 4574 	call	_redibujarEnemigo
   8B2F F1            [10] 4575 	pop	af
   8B30 C1            [10] 4576 	pop	bc
   8B31                    4577 00111$:
                           4578 ;src/main.c:1039: if (actual->muerto && actual->muertes == 0){
   8B31 C5            [11] 4579 	push	bc
   8B32 FD E1         [14] 4580 	pop	iy
   8B34 FD 7E 08      [19] 4581 	ld	a,8 (iy)
   8B37 B7            [ 4] 4582 	or	a, a
   8B38 28 22         [12] 4583 	jr	Z,00113$
   8B3A 21 0A 00      [10] 4584 	ld	hl,#0x000A
   8B3D 09            [11] 4585 	add	hl,bc
   8B3E 7E            [ 7] 4586 	ld	a,(hl)
   8B3F B7            [ 4] 4587 	or	a, a
   8B40 20 1A         [12] 4588 	jr	NZ,00113$
                           4589 ;src/main.c:1040: borrarEnemigo(actual);
   8B42 E5            [11] 4590 	push	hl
   8B43 C5            [11] 4591 	push	bc
   8B44 C5            [11] 4592 	push	bc
   8B45 CD F4 75      [17] 4593 	call	_borrarEnemigo
   8B48 F1            [10] 4594 	pop	af
   8B49 C1            [10] 4595 	pop	bc
   8B4A C5            [11] 4596 	push	bc
   8B4B C5            [11] 4597 	push	bc
   8B4C CD 4C 75      [17] 4598 	call	_dibujarExplosion
   8B4F F1            [10] 4599 	pop	af
   8B50 C1            [10] 4600 	pop	bc
   8B51 E1            [10] 4601 	pop	hl
                           4602 ;src/main.c:1043: actual->muertes++;
   8B52 5E            [ 7] 4603 	ld	e,(hl)
   8B53 1C            [ 4] 4604 	inc	e
   8B54 73            [ 7] 4605 	ld	(hl),e
                           4606 ;src/main.c:1044: actual->x = 0;
   8B55 AF            [ 4] 4607 	xor	a, a
   8B56 02            [ 7] 4608 	ld	(bc),a
                           4609 ;src/main.c:1045: actual->y = 0;
   8B57 59            [ 4] 4610 	ld	e, c
   8B58 50            [ 4] 4611 	ld	d, b
   8B59 13            [ 6] 4612 	inc	de
   8B5A AF            [ 4] 4613 	xor	a, a
   8B5B 12            [ 7] 4614 	ld	(de),a
   8B5C                    4615 00113$:
                           4616 ;src/main.c:1047: ++actual;
   8B5C 21 44 01      [10] 4617 	ld	hl,#0x0144
   8B5F 09            [11] 4618 	add	hl,bc
   8B60 4D            [ 4] 4619 	ld	c,l
   8B61 44            [ 4] 4620 	ld	b,h
   8B62 18 B4         [12] 4621 	jr	00115$
   8B64                    4622 00117$:
                           4623 ;src/main.c:1050: cpct_waitVSYNC();
   8B64 CD 22 5B      [17] 4624 	call	_cpct_waitVSYNC
   8B67 C3 D8 8A      [10] 4625 	jp	00119$
   8B6A 33            [ 6] 4626 	inc	sp
   8B6B DD E1         [14] 4627 	pop	ix
   8B6D C9            [10] 4628 	ret
                           4629 	.area _CODE
                           4630 	.area _INITIALIZER
                           4631 	.area _CABS (ABS)
   0F00                    4632 	.org 0x0F00
   0F00                    4633 _G_song:
   0F00 41                 4634 	.db #0x41	; 65	'A'
   0F01 54                 4635 	.db #0x54	; 84	'T'
   0F02 31                 4636 	.db #0x31	; 49	'1'
   0F03 30                 4637 	.db #0x30	; 48	'0'
   0F04 01                 4638 	.db #0x01	; 1
   0F05 40                 4639 	.db #0x40	; 64
   0F06 42                 4640 	.db #0x42	; 66	'B'
   0F07 0F                 4641 	.db #0x0F	; 15
   0F08 02                 4642 	.db #0x02	; 2
   0F09 06                 4643 	.db #0x06	; 6
   0F0A 1D                 4644 	.db #0x1D	; 29
   0F0B 00                 4645 	.db #0x00	; 0
   0F0C 10                 4646 	.db #0x10	; 16
   0F0D 40                 4647 	.db #0x40	; 64
   0F0E 19                 4648 	.db #0x19	; 25
   0F0F 40                 4649 	.db #0x40	; 64
   0F10 00                 4650 	.db #0x00	; 0
   0F11 00                 4651 	.db #0x00	; 0
   0F12 00                 4652 	.db #0x00	; 0
   0F13 00                 4653 	.db #0x00	; 0
   0F14 00                 4654 	.db #0x00	; 0
   0F15 00                 4655 	.db #0x00	; 0
   0F16 0D                 4656 	.db #0x0D	; 13
   0F17 12                 4657 	.db #0x12	; 18
   0F18 40                 4658 	.db #0x40	; 64
   0F19 01                 4659 	.db #0x01	; 1
   0F1A 00                 4660 	.db #0x00	; 0
   0F1B 7C                 4661 	.db #0x7C	; 124
   0F1C 18                 4662 	.db #0x18	; 24
   0F1D 78                 4663 	.db #0x78	; 120	'x'
   0F1E 0C                 4664 	.db #0x0C	; 12
   0F1F 34                 4665 	.db #0x34	; 52	'4'
   0F20 30                 4666 	.db #0x30	; 48	'0'
   0F21 2C                 4667 	.db #0x2C	; 44
   0F22 28                 4668 	.db #0x28	; 40
   0F23 24                 4669 	.db #0x24	; 36
   0F24 20                 4670 	.db #0x20	; 32
   0F25 1C                 4671 	.db #0x1C	; 28
   0F26 0D                 4672 	.db #0x0D	; 13
   0F27 25                 4673 	.db #0x25	; 37
   0F28 40                 4674 	.db #0x40	; 64
   0F29 20                 4675 	.db #0x20	; 32
   0F2A 00                 4676 	.db #0x00	; 0
   0F2B 00                 4677 	.db #0x00	; 0
   0F2C 00                 4678 	.db #0x00	; 0
   0F2D 39                 4679 	.db #0x39	; 57	'9'
   0F2E 40                 4680 	.db #0x40	; 64
   0F2F 00                 4681 	.db #0x00	; 0
   0F30 57                 4682 	.db #0x57	; 87	'W'
   0F31 40                 4683 	.db #0x40	; 64
   0F32 3B                 4684 	.db #0x3B	; 59
   0F33 40                 4685 	.db #0x40	; 64
   0F34 57                 4686 	.db #0x57	; 87	'W'
   0F35 40                 4687 	.db #0x40	; 64
   0F36 01                 4688 	.db #0x01	; 1
   0F37 2F                 4689 	.db #0x2F	; 47
   0F38 40                 4690 	.db #0x40	; 64
   0F39 19                 4691 	.db #0x19	; 25
   0F3A 00                 4692 	.db #0x00	; 0
   0F3B 76                 4693 	.db #0x76	; 118	'v'
   0F3C E1                 4694 	.db #0xE1	; 225
   0F3D 00                 4695 	.db #0x00	; 0
   0F3E 00                 4696 	.db #0x00	; 0
   0F3F 01                 4697 	.db #0x01	; 1
   0F40 04                 4698 	.db #0x04	; 4
   0F41 51                 4699 	.db #0x51	; 81	'Q'
   0F42 04                 4700 	.db #0x04	; 4
   0F43 37                 4701 	.db #0x37	; 55	'7'
   0F44 04                 4702 	.db #0x04	; 4
   0F45 4F                 4703 	.db #0x4F	; 79	'O'
   0F46 04                 4704 	.db #0x04	; 4
   0F47 37                 4705 	.db #0x37	; 55	'7'
   0F48 02                 4706 	.db #0x02	; 2
   0F49 4B                 4707 	.db #0x4B	; 75	'K'
   0F4A 02                 4708 	.db #0x02	; 2
   0F4B 37                 4709 	.db #0x37	; 55	'7'
   0F4C 04                 4710 	.db #0x04	; 4
   0F4D 4F                 4711 	.db #0x4F	; 79	'O'
   0F4E 04                 4712 	.db #0x04	; 4
   0F4F 37                 4713 	.db #0x37	; 55	'7'
   0F50 04                 4714 	.db #0x04	; 4
   0F51 4F                 4715 	.db #0x4F	; 79	'O'
   0F52 04                 4716 	.db #0x04	; 4
   0F53 37                 4717 	.db #0x37	; 55	'7'
   0F54 02                 4718 	.db #0x02	; 2
   0F55 4B                 4719 	.db #0x4B	; 75	'K'
   0F56 00                 4720 	.db #0x00	; 0
   0F57 42                 4721 	.db #0x42	; 66	'B'
   0F58 60                 4722 	.db #0x60	; 96
   0F59 00                 4723 	.db #0x00	; 0
   0F5A 42                 4724 	.db #0x42	; 66	'B'
   0F5B 80                 4725 	.db #0x80	; 128
   0F5C 00                 4726 	.db #0x00	; 0
   0F5D 00                 4727 	.db #0x00	; 0
   0F5E 42                 4728 	.db #0x42	; 66	'B'
   0F5F 00                 4729 	.db #0x00	; 0
   0F60 00                 4730 	.db #0x00	; 0
