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
                           3215 ;src/main.c:605: void updateEnemies() { // maquina de estados
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
   8480 DD 36 FC C6   [19] 3230 	ld	-4 (ix),#<(_enemy)
   8484 DD 36 FD 64   [19] 3231 	ld	-3 (ix),#>(_enemy)
   8488 DD 36 FE C6   [19] 3232 	ld	-2 (ix),#<(_enemy)
   848C DD 36 FF 64   [19] 3233 	ld	-1 (ix),#>(_enemy)
   8490                    3234 00123$:
   8490 DD 35 FA      [23] 3235 	dec	-6 (ix)
   8493 DD 4E FA      [19] 3236 	ld	c, -6 (ix)
   8496 79            [ 4] 3237 	ld	a,c
   8497 B7            [ 4] 3238 	or	a, a
   8498 CA 6D 85      [10] 3239 	jp	Z,00126$
                           3240 ;src/main.c:613: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   849B 3A DC 64      [13] 3241 	ld	a, (#(_enemy + 0x0016) + 0)
   849E B7            [ 4] 3242 	or	a, a
   849F 28 1C         [12] 3243 	jr	Z,00121$
                           3244 ;src/main.c:614: engage(actual, prota.x, prota.y);
   84A1 3A D7 69      [13] 3245 	ld	a,(#(_prota + 0x0001) + 0)
   84A4 DD 77 FB      [19] 3246 	ld	-5 (ix),a
   84A7 21 D6 69      [10] 3247 	ld	hl, #_prota + 0
   84AA 46            [ 7] 3248 	ld	b,(hl)
   84AB DD 7E FB      [19] 3249 	ld	a,-5 (ix)
   84AE F5            [11] 3250 	push	af
   84AF 33            [ 6] 3251 	inc	sp
   84B0 C5            [11] 3252 	push	bc
   84B1 33            [ 6] 3253 	inc	sp
   84B2 21 C6 64      [10] 3254 	ld	hl,#_enemy
   84B5 E5            [11] 3255 	push	hl
   84B6 CD 33 7E      [17] 3256 	call	_engage
   84B9 F1            [10] 3257 	pop	af
   84BA F1            [10] 3258 	pop	af
   84BB 18 D3         [12] 3259 	jr	00123$
   84BD                    3260 00121$:
                           3261 ;src/main.c:617: if (actual->patrolling) { // esta patrullando
   84BD 3A D1 64      [13] 3262 	ld	a, (#(_enemy + 0x000b) + 0)
   84C0 B7            [ 4] 3263 	or	a, a
   84C1 28 61         [12] 3264 	jr	Z,00118$
                           3265 ;src/main.c:618: if (!actual->seen && !actual->inRange) {
   84C3 21 D8 64      [10] 3266 	ld	hl, #(_enemy + 0x0012) + 0
   84C6 4E            [ 7] 3267 	ld	c,(hl)
   84C7 79            [ 4] 3268 	ld	a,c
   84C8 B7            [ 4] 3269 	or	a, a
   84C9 20 10         [12] 3270 	jr	NZ,00107$
   84CB 3A D7 64      [13] 3271 	ld	a, (#(_enemy + 0x0011) + 0)
   84CE B7            [ 4] 3272 	or	a, a
   84CF 20 0A         [12] 3273 	jr	NZ,00107$
                           3274 ;src/main.c:619: patrol(actual);
   84D1 21 C6 64      [10] 3275 	ld	hl,#_enemy
   84D4 E5            [11] 3276 	push	hl
   84D5 CD 17 7E      [17] 3277 	call	_patrol
   84D8 F1            [10] 3278 	pop	af
   84D9 18 B5         [12] 3279 	jr	00123$
   84DB                    3280 00107$:
                           3281 ;src/main.c:620: }else if (actual->inRange) {
   84DB 21 D7 64      [10] 3282 	ld	hl, #(_enemy + 0x0011) + 0
   84DE 46            [ 7] 3283 	ld	b,(hl)
                           3284 ;src/main.c:623: actual->onPathPatrol = 0;
   84DF 11 D2 64      [10] 3285 	ld	de,#_enemy + 12
                           3286 ;src/main.c:620: }else if (actual->inRange) {
   84E2 78            [ 4] 3287 	ld	a,b
   84E3 B7            [ 4] 3288 	or	a, a
   84E4 28 25         [12] 3289 	jr	Z,00104$
                           3290 ;src/main.c:621: engage(actual, prota.x, prota.y);
   84E6 21 D7 69      [10] 3291 	ld	hl, #(_prota + 0x0001) + 0
   84E9 46            [ 7] 3292 	ld	b,(hl)
   84EA 3A D6 69      [13] 3293 	ld	a, (#_prota + 0)
   84ED D5            [11] 3294 	push	de
   84EE C5            [11] 3295 	push	bc
   84EF 33            [ 6] 3296 	inc	sp
   84F0 F5            [11] 3297 	push	af
   84F1 33            [ 6] 3298 	inc	sp
   84F2 21 C6 64      [10] 3299 	ld	hl,#_enemy
   84F5 E5            [11] 3300 	push	hl
   84F6 CD 33 7E      [17] 3301 	call	_engage
   84F9 F1            [10] 3302 	pop	af
   84FA F1            [10] 3303 	pop	af
   84FB D1            [10] 3304 	pop	de
                           3305 ;src/main.c:622: actual->patrolling = 0;
   84FC 21 D1 64      [10] 3306 	ld	hl,#(_enemy + 0x000b)
   84FF 36 00         [10] 3307 	ld	(hl),#0x00
                           3308 ;src/main.c:623: actual->onPathPatrol = 0;
   8501 AF            [ 4] 3309 	xor	a, a
   8502 12            [ 7] 3310 	ld	(de),a
                           3311 ;src/main.c:624: actual->engage = 1;
   8503 21 DC 64      [10] 3312 	ld	hl,#(_enemy + 0x0016)
   8506 36 01         [10] 3313 	ld	(hl),#0x01
   8508 C3 90 84      [10] 3314 	jp	00123$
   850B                    3315 00104$:
                           3316 ;src/main.c:625: } else if (actual->seen) {
   850B 79            [ 4] 3317 	ld	a,c
   850C B7            [ 4] 3318 	or	a, a
   850D CA 90 84      [10] 3319 	jp	Z,00123$
                           3320 ;src/main.c:628: actual->iter=0;
   8510 21 D5 64      [10] 3321 	ld	hl,#(_enemy + 0x000f)
   8513 36 00         [10] 3322 	ld	(hl),#0x00
                           3323 ;src/main.c:629: actual->reversePatrol = NO;
   8515 21 D3 64      [10] 3324 	ld	hl,#(_enemy + 0x000d)
   8518 36 00         [10] 3325 	ld	(hl),#0x00
                           3326 ;src/main.c:630: actual->patrolling = 0;
   851A 21 D1 64      [10] 3327 	ld	hl,#(_enemy + 0x000b)
   851D 36 00         [10] 3328 	ld	(hl),#0x00
                           3329 ;src/main.c:631: actual->onPathPatrol = 0;
   851F AF            [ 4] 3330 	xor	a, a
   8520 12            [ 7] 3331 	ld	(de),a
   8521 C3 90 84      [10] 3332 	jp	00123$
   8524                    3333 00118$:
                           3334 ;src/main.c:633: } else if (actual->seek) { // esta buscando
   8524 DD 6E FC      [19] 3335 	ld	l,-4 (ix)
   8527 DD 66 FD      [19] 3336 	ld	h,-3 (ix)
   852A 11 14 00      [10] 3337 	ld	de, #0x0014
   852D 19            [11] 3338 	add	hl, de
   852E 7E            [ 7] 3339 	ld	a,(hl)
   852F B7            [ 4] 3340 	or	a, a
   8530 CA 90 84      [10] 3341 	jp	Z,00123$
                           3342 ;src/main.c:634: if (!actual->found /*&& actual->seekTimer <= 5*/) {
   8533 DD 6E FE      [19] 3343 	ld	l,-2 (ix)
   8536 DD 66 FF      [19] 3344 	ld	h,-1 (ix)
   8539 11 13 00      [10] 3345 	ld	de, #0x0013
   853C 19            [11] 3346 	add	hl, de
   853D 7E            [ 7] 3347 	ld	a,(hl)
   853E B7            [ 4] 3348 	or	a, a
   853F 20 0B         [12] 3349 	jr	NZ,00113$
                           3350 ;src/main.c:635: seek(actual); // buscar en posiciones cercanas a la actual
   8541 21 C6 64      [10] 3351 	ld	hl,#_enemy
   8544 E5            [11] 3352 	push	hl
   8545 CD 29 7E      [17] 3353 	call	_seek
   8548 F1            [10] 3354 	pop	af
   8549 C3 90 84      [10] 3355 	jp	00123$
   854C                    3356 00113$:
                           3357 ;src/main.c:636: } else if (actual->inRange) {
   854C 3A D7 64      [13] 3358 	ld	a, (#(_enemy + 0x0011) + 0)
   854F B7            [ 4] 3359 	or	a, a
   8550 CA 90 84      [10] 3360 	jp	Z,00123$
                           3361 ;src/main.c:637: engage(actual, prota.x, prota.y);
   8553 21 D7 69      [10] 3362 	ld	hl, #(_prota + 0x0001) + 0
   8556 46            [ 7] 3363 	ld	b,(hl)
   8557 21 D6 69      [10] 3364 	ld	hl, #_prota + 0
   855A 4E            [ 7] 3365 	ld	c, (hl)
   855B C5            [11] 3366 	push	bc
   855C 21 C6 64      [10] 3367 	ld	hl,#_enemy
   855F E5            [11] 3368 	push	hl
   8560 CD 33 7E      [17] 3369 	call	_engage
   8563 F1            [10] 3370 	pop	af
   8564 F1            [10] 3371 	pop	af
                           3372 ;src/main.c:638: actual->engage = 1;
   8565 21 DC 64      [10] 3373 	ld	hl,#(_enemy + 0x0016)
   8568 36 01         [10] 3374 	ld	(hl),#0x01
   856A C3 90 84      [10] 3375 	jp	00123$
   856D                    3376 00126$:
   856D DD F9         [10] 3377 	ld	sp, ix
   856F DD E1         [14] 3378 	pop	ix
   8571 C9            [10] 3379 	ret
                           3380 ;src/main.c:645: void avanzarMapa() {
                           3381 ;	---------------------------------
                           3382 ; Function avanzarMapa
                           3383 ; ---------------------------------
   8572                    3384 _avanzarMapa::
                           3385 ;src/main.c:646: if(num_mapa < NUM_MAPAS -1) {
   8572 3A EB 69      [13] 3386 	ld	a,(#_num_mapa + 0)
   8575 D6 02         [ 7] 3387 	sub	a, #0x02
   8577 D2 33 73      [10] 3388 	jp	NC,_menuFin
                           3389 ;src/main.c:647: mapa = mapas[++num_mapa];
   857A 21 EB 69      [10] 3390 	ld	hl, #_num_mapa+0
   857D 34            [11] 3391 	inc	(hl)
   857E FD 21 EB 69   [14] 3392 	ld	iy,#_num_mapa
   8582 FD 6E 00      [19] 3393 	ld	l,0 (iy)
   8585 26 00         [ 7] 3394 	ld	h,#0x00
   8587 29            [11] 3395 	add	hl, hl
   8588 11 89 72      [10] 3396 	ld	de,#_mapas
   858B 19            [11] 3397 	add	hl,de
   858C 7E            [ 7] 3398 	ld	a,(hl)
   858D FD 21 E9 69   [14] 3399 	ld	iy,#_mapa
   8591 FD 77 00      [19] 3400 	ld	0 (iy),a
   8594 23            [ 6] 3401 	inc	hl
   8595 7E            [ 7] 3402 	ld	a,(hl)
   8596 32 EA 69      [13] 3403 	ld	(#_mapa + 1),a
                           3404 ;src/main.c:648: prota.x = prota.px = 2;
   8599 21 D8 69      [10] 3405 	ld	hl,#(_prota + 0x0002)
   859C 36 02         [10] 3406 	ld	(hl),#0x02
   859E 21 D6 69      [10] 3407 	ld	hl,#_prota
   85A1 36 02         [10] 3408 	ld	(hl),#0x02
                           3409 ;src/main.c:649: prota.mover = SI;
   85A3 21 DC 69      [10] 3410 	ld	hl,#(_prota + 0x0006)
   85A6 36 01         [10] 3411 	ld	(hl),#0x01
                           3412 ;src/main.c:650: dibujarMapa();
   85A8 CD 73 72      [17] 3413 	call	_dibujarMapa
                           3414 ;src/main.c:651: inicializarEnemy();
   85AB C3 92 8B      [10] 3415 	jp  _inicializarEnemy
                           3416 ;src/main.c:655: menuFin();
   85AE C3 33 73      [10] 3417 	jp  _menuFin
                           3418 ;src/main.c:659: void moverIzquierda() {
                           3419 ;	---------------------------------
                           3420 ; Function moverIzquierda
                           3421 ; ---------------------------------
   85B1                    3422 _moverIzquierda::
                           3423 ;src/main.c:660: prota.mira = M_izquierda;
   85B1 01 D6 69      [10] 3424 	ld	bc,#_prota+0
   85B4 21 DD 69      [10] 3425 	ld	hl,#(_prota + 0x0007)
   85B7 36 01         [10] 3426 	ld	(hl),#0x01
                           3427 ;src/main.c:661: if (!checkCollision(M_izquierda)) {
   85B9 C5            [11] 3428 	push	bc
   85BA 21 01 00      [10] 3429 	ld	hl,#0x0001
   85BD E5            [11] 3430 	push	hl
   85BE CD BF 73      [17] 3431 	call	_checkCollision
   85C1 F1            [10] 3432 	pop	af
   85C2 C1            [10] 3433 	pop	bc
   85C3 7D            [ 4] 3434 	ld	a,l
   85C4 B7            [ 4] 3435 	or	a, a
   85C5 C0            [11] 3436 	ret	NZ
                           3437 ;src/main.c:662: prota.x--;
   85C6 0A            [ 7] 3438 	ld	a,(bc)
   85C7 C6 FF         [ 7] 3439 	add	a,#0xFF
   85C9 02            [ 7] 3440 	ld	(bc),a
                           3441 ;src/main.c:663: prota.mover = SI;
   85CA 21 DC 69      [10] 3442 	ld	hl,#(_prota + 0x0006)
   85CD 36 01         [10] 3443 	ld	(hl),#0x01
                           3444 ;src/main.c:664: prota.sprite = g_hero_left;
   85CF 21 FE 49      [10] 3445 	ld	hl,#_g_hero_left
   85D2 22 DA 69      [16] 3446 	ld	((_prota + 0x0004)), hl
   85D5 C9            [10] 3447 	ret
                           3448 ;src/main.c:668: void moverDerecha() {
                           3449 ;	---------------------------------
                           3450 ; Function moverDerecha
                           3451 ; ---------------------------------
   85D6                    3452 _moverDerecha::
                           3453 ;src/main.c:669: prota.mira = M_derecha;
   85D6 21 DD 69      [10] 3454 	ld	hl,#(_prota + 0x0007)
   85D9 36 00         [10] 3455 	ld	(hl),#0x00
                           3456 ;src/main.c:670: if (!checkCollision(M_derecha) && (prota.x + G_HERO_W < 80)) {
   85DB 21 00 00      [10] 3457 	ld	hl,#0x0000
   85DE E5            [11] 3458 	push	hl
   85DF CD BF 73      [17] 3459 	call	_checkCollision
   85E2 F1            [10] 3460 	pop	af
   85E3 45            [ 4] 3461 	ld	b,l
   85E4 21 D6 69      [10] 3462 	ld	hl, #_prota + 0
   85E7 4E            [ 7] 3463 	ld	c,(hl)
   85E8 59            [ 4] 3464 	ld	e,c
   85E9 16 00         [ 7] 3465 	ld	d,#0x00
   85EB 21 07 00      [10] 3466 	ld	hl,#0x0007
   85EE 19            [11] 3467 	add	hl,de
   85EF 11 50 80      [10] 3468 	ld	de, #0x8050
   85F2 29            [11] 3469 	add	hl, hl
   85F3 3F            [ 4] 3470 	ccf
   85F4 CB 1C         [ 8] 3471 	rr	h
   85F6 CB 1D         [ 8] 3472 	rr	l
   85F8 ED 52         [15] 3473 	sbc	hl, de
   85FA 3E 00         [ 7] 3474 	ld	a,#0x00
   85FC 17            [ 4] 3475 	rla
   85FD 5F            [ 4] 3476 	ld	e,a
   85FE 78            [ 4] 3477 	ld	a,b
   85FF B7            [ 4] 3478 	or	a,a
   8600 20 14         [12] 3479 	jr	NZ,00104$
   8602 B3            [ 4] 3480 	or	a,e
   8603 28 11         [12] 3481 	jr	Z,00104$
                           3482 ;src/main.c:671: prota.x++;
   8605 0C            [ 4] 3483 	inc	c
   8606 21 D6 69      [10] 3484 	ld	hl,#_prota
   8609 71            [ 7] 3485 	ld	(hl),c
                           3486 ;src/main.c:672: prota.mover = SI;
   860A 21 DC 69      [10] 3487 	ld	hl,#(_prota + 0x0006)
   860D 36 01         [10] 3488 	ld	(hl),#0x01
                           3489 ;src/main.c:673: prota.sprite = g_hero;
   860F 21 A8 4A      [10] 3490 	ld	hl,#_g_hero
   8612 22 DA 69      [16] 3491 	ld	((_prota + 0x0004)), hl
   8615 C9            [10] 3492 	ret
   8616                    3493 00104$:
                           3494 ;src/main.c:675: }else if( prota.x + G_HERO_W >= 80){
   8616 7B            [ 4] 3495 	ld	a,e
   8617 B7            [ 4] 3496 	or	a, a
   8618 C0            [11] 3497 	ret	NZ
                           3498 ;src/main.c:676: avanzarMapa();
   8619 C3 72 85      [10] 3499 	jp  _avanzarMapa
                           3500 ;src/main.c:680: void moverArriba() {
                           3501 ;	---------------------------------
                           3502 ; Function moverArriba
                           3503 ; ---------------------------------
   861C                    3504 _moverArriba::
                           3505 ;src/main.c:681: prota.mira = M_arriba;
   861C 21 DD 69      [10] 3506 	ld	hl,#(_prota + 0x0007)
   861F 36 02         [10] 3507 	ld	(hl),#0x02
                           3508 ;src/main.c:682: if (!checkCollision(M_arriba)) { // TODO: COMPROBAR
   8621 21 02 00      [10] 3509 	ld	hl,#0x0002
   8624 E5            [11] 3510 	push	hl
   8625 CD BF 73      [17] 3511 	call	_checkCollision
   8628 F1            [10] 3512 	pop	af
   8629 7D            [ 4] 3513 	ld	a,l
   862A B7            [ 4] 3514 	or	a, a
   862B C0            [11] 3515 	ret	NZ
                           3516 ;src/main.c:683: prota.y--;
   862C 21 D7 69      [10] 3517 	ld	hl,#_prota + 1
   862F 4E            [ 7] 3518 	ld	c,(hl)
   8630 0D            [ 4] 3519 	dec	c
   8631 71            [ 7] 3520 	ld	(hl),c
                           3521 ;src/main.c:684: prota.y--;
   8632 0D            [ 4] 3522 	dec	c
   8633 71            [ 7] 3523 	ld	(hl),c
                           3524 ;src/main.c:685: prota.mover  = SI;
   8634 21 DC 69      [10] 3525 	ld	hl,#(_prota + 0x0006)
   8637 36 01         [10] 3526 	ld	(hl),#0x01
                           3527 ;src/main.c:686: prota.sprite = g_hero_up;
   8639 21 64 49      [10] 3528 	ld	hl,#_g_hero_up
   863C 22 DA 69      [16] 3529 	ld	((_prota + 0x0004)), hl
   863F C9            [10] 3530 	ret
                           3531 ;src/main.c:690: void moverAbajo() {
                           3532 ;	---------------------------------
                           3533 ; Function moverAbajo
                           3534 ; ---------------------------------
   8640                    3535 _moverAbajo::
                           3536 ;src/main.c:691: prota.mira = M_abajo;
   8640 21 DD 69      [10] 3537 	ld	hl,#(_prota + 0x0007)
   8643 36 03         [10] 3538 	ld	(hl),#0x03
                           3539 ;src/main.c:692: if (!checkCollision(M_abajo) ) { // TODO: COMPROBAR
   8645 21 03 00      [10] 3540 	ld	hl,#0x0003
   8648 E5            [11] 3541 	push	hl
   8649 CD BF 73      [17] 3542 	call	_checkCollision
   864C F1            [10] 3543 	pop	af
   864D 7D            [ 4] 3544 	ld	a,l
   864E B7            [ 4] 3545 	or	a, a
   864F C0            [11] 3546 	ret	NZ
                           3547 ;src/main.c:693: prota.y++;
   8650 01 D7 69      [10] 3548 	ld	bc,#_prota + 1
   8653 0A            [ 7] 3549 	ld	a,(bc)
   8654 3C            [ 4] 3550 	inc	a
   8655 02            [ 7] 3551 	ld	(bc),a
                           3552 ;src/main.c:694: prota.y++;
   8656 3C            [ 4] 3553 	inc	a
   8657 02            [ 7] 3554 	ld	(bc),a
                           3555 ;src/main.c:695: prota.mover  = SI;
   8658 21 DC 69      [10] 3556 	ld	hl,#(_prota + 0x0006)
   865B 36 01         [10] 3557 	ld	(hl),#0x01
                           3558 ;src/main.c:696: prota.sprite = g_hero_down;
   865D 21 CA 48      [10] 3559 	ld	hl,#_g_hero_down
   8660 22 DA 69      [16] 3560 	ld	((_prota + 0x0004)), hl
   8663 C9            [10] 3561 	ret
                           3562 ;src/main.c:700: void dibujarCuchillo() {
                           3563 ;	---------------------------------
                           3564 ; Function dibujarCuchillo
                           3565 ; ---------------------------------
   8664                    3566 _dibujarCuchillo::
   8664 DD E5         [15] 3567 	push	ix
   8666 DD 21 00 00   [14] 3568 	ld	ix,#0
   866A DD 39         [15] 3569 	add	ix,sp
   866C F5            [11] 3570 	push	af
                           3571 ;src/main.c:701: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   866D 21 DF 69      [10] 3572 	ld	hl, #_cu + 1
   8670 56            [ 7] 3573 	ld	d,(hl)
   8671 21 DE 69      [10] 3574 	ld	hl, #_cu + 0
   8674 46            [ 7] 3575 	ld	b,(hl)
   8675 D5            [11] 3576 	push	de
   8676 33            [ 6] 3577 	inc	sp
   8677 C5            [11] 3578 	push	bc
   8678 33            [ 6] 3579 	inc	sp
   8679 21 00 C0      [10] 3580 	ld	hl,#0xC000
   867C E5            [11] 3581 	push	hl
   867D CD 69 64      [17] 3582 	call	_cpct_getScreenPtr
   8680 45            [ 4] 3583 	ld	b,l
   8681 5C            [ 4] 3584 	ld	e,h
                           3585 ;src/main.c:702: if(cu.eje == E_X){
   8682 21 E6 69      [10] 3586 	ld	hl, #_cu + 8
   8685 4E            [ 7] 3587 	ld	c,(hl)
                           3588 ;src/main.c:703: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   8686 DD 70 FE      [19] 3589 	ld	-2 (ix),b
   8689 DD 73 FF      [19] 3590 	ld	-1 (ix),e
                           3591 ;src/main.c:702: if(cu.eje == E_X){
   868C 79            [ 4] 3592 	ld	a,c
   868D B7            [ 4] 3593 	or	a, a
   868E 20 19         [12] 3594 	jr	NZ,00104$
                           3595 ;src/main.c:703: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   8690 11 00 0E      [10] 3596 	ld	de,#_g_tablatrans+0
   8693 ED 4B E2 69   [20] 3597 	ld	bc, (#(_cu + 0x0004) + 0)
   8697 D5            [11] 3598 	push	de
   8698 21 04 04      [10] 3599 	ld	hl,#0x0404
   869B E5            [11] 3600 	push	hl
   869C DD 6E FE      [19] 3601 	ld	l,-2 (ix)
   869F DD 66 FF      [19] 3602 	ld	h,-1 (ix)
   86A2 E5            [11] 3603 	push	hl
   86A3 C5            [11] 3604 	push	bc
   86A4 CD 89 64      [17] 3605 	call	_cpct_drawSpriteMaskedAlignedTable
   86A7 18 1A         [12] 3606 	jr	00106$
   86A9                    3607 00104$:
                           3608 ;src/main.c:706: else if(cu.eje == E_Y){
   86A9 0D            [ 4] 3609 	dec	c
   86AA 20 17         [12] 3610 	jr	NZ,00106$
                           3611 ;src/main.c:707: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   86AC 11 00 0E      [10] 3612 	ld	de,#_g_tablatrans+0
   86AF ED 4B E2 69   [20] 3613 	ld	bc, (#(_cu + 0x0004) + 0)
   86B3 D5            [11] 3614 	push	de
   86B4 21 02 08      [10] 3615 	ld	hl,#0x0802
   86B7 E5            [11] 3616 	push	hl
   86B8 DD 6E FE      [19] 3617 	ld	l,-2 (ix)
   86BB DD 66 FF      [19] 3618 	ld	h,-1 (ix)
   86BE E5            [11] 3619 	push	hl
   86BF C5            [11] 3620 	push	bc
   86C0 CD 89 64      [17] 3621 	call	_cpct_drawSpriteMaskedAlignedTable
   86C3                    3622 00106$:
   86C3 DD F9         [10] 3623 	ld	sp, ix
   86C5 DD E1         [14] 3624 	pop	ix
   86C7 C9            [10] 3625 	ret
                           3626 ;src/main.c:711: void borrarCuchillo() {
                           3627 ;	---------------------------------
                           3628 ; Function borrarCuchillo
                           3629 ; ---------------------------------
   86C8                    3630 _borrarCuchillo::
   86C8 DD E5         [15] 3631 	push	ix
   86CA DD 21 00 00   [14] 3632 	ld	ix,#0
   86CE DD 39         [15] 3633 	add	ix,sp
   86D0 F5            [11] 3634 	push	af
   86D1 3B            [ 6] 3635 	dec	sp
                           3636 ;src/main.c:713: u8 w = 2 + (cu.px & 1);
   86D2 21 E0 69      [10] 3637 	ld	hl, #_cu + 2
   86D5 4E            [ 7] 3638 	ld	c,(hl)
   86D6 79            [ 4] 3639 	ld	a,c
   86D7 E6 01         [ 7] 3640 	and	a, #0x01
   86D9 47            [ 4] 3641 	ld	b,a
   86DA 04            [ 4] 3642 	inc	b
   86DB 04            [ 4] 3643 	inc	b
                           3644 ;src/main.c:714: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   86DC 21 E1 69      [10] 3645 	ld	hl, #_cu + 3
   86DF 5E            [ 7] 3646 	ld	e,(hl)
   86E0 7B            [ 4] 3647 	ld	a,e
   86E1 E6 03         [ 7] 3648 	and	a, #0x03
   86E3 28 04         [12] 3649 	jr	Z,00105$
   86E5 3E 01         [ 7] 3650 	ld	a,#0x01
   86E7 18 02         [12] 3651 	jr	00106$
   86E9                    3652 00105$:
   86E9 3E 00         [ 7] 3653 	ld	a,#0x00
   86EB                    3654 00106$:
   86EB C6 02         [ 7] 3655 	add	a, #0x02
   86ED DD 77 FD      [19] 3656 	ld	-3 (ix),a
                           3657 ;src/main.c:715: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   86F0 FD 2A E9 69   [20] 3658 	ld	iy,(_mapa)
   86F4 16 00         [ 7] 3659 	ld	d,#0x00
   86F6 7B            [ 4] 3660 	ld	a,e
   86F7 C6 E8         [ 7] 3661 	add	a,#0xE8
   86F9 DD 77 FE      [19] 3662 	ld	-2 (ix),a
   86FC 7A            [ 4] 3663 	ld	a,d
   86FD CE FF         [ 7] 3664 	adc	a,#0xFF
   86FF DD 77 FF      [19] 3665 	ld	-1 (ix),a
   8702 DD 6E FE      [19] 3666 	ld	l,-2 (ix)
   8705 DD 66 FF      [19] 3667 	ld	h,-1 (ix)
   8708 DD CB FF 7E   [20] 3668 	bit	7, -1 (ix)
   870C 28 04         [12] 3669 	jr	Z,00107$
   870E 21 EB FF      [10] 3670 	ld	hl,#0xFFEB
   8711 19            [11] 3671 	add	hl,de
   8712                    3672 00107$:
   8712 CB 2C         [ 8] 3673 	sra	h
   8714 CB 1D         [ 8] 3674 	rr	l
   8716 CB 2C         [ 8] 3675 	sra	h
   8718 CB 1D         [ 8] 3676 	rr	l
   871A 55            [ 4] 3677 	ld	d,l
   871B CB 39         [ 8] 3678 	srl	c
   871D FD E5         [15] 3679 	push	iy
   871F 21 F0 C0      [10] 3680 	ld	hl,#0xC0F0
   8722 E5            [11] 3681 	push	hl
   8723 3E 28         [ 7] 3682 	ld	a,#0x28
   8725 F5            [11] 3683 	push	af
   8726 33            [ 6] 3684 	inc	sp
   8727 DD 7E FD      [19] 3685 	ld	a,-3 (ix)
   872A F5            [11] 3686 	push	af
   872B 33            [ 6] 3687 	inc	sp
   872C C5            [11] 3688 	push	bc
   872D 33            [ 6] 3689 	inc	sp
   872E D5            [11] 3690 	push	de
   872F 33            [ 6] 3691 	inc	sp
   8730 79            [ 4] 3692 	ld	a,c
   8731 F5            [11] 3693 	push	af
   8732 33            [ 6] 3694 	inc	sp
   8733 CD 62 59      [17] 3695 	call	_cpct_etm_drawTileBox2x4
                           3696 ;src/main.c:716: if(!cu.mover){
   8736 3A E7 69      [13] 3697 	ld	a, (#_cu + 9)
   8739 B7            [ 4] 3698 	or	a, a
   873A 20 05         [12] 3699 	jr	NZ,00103$
                           3700 ;src/main.c:717: cu.lanzado = NO;
   873C 21 E4 69      [10] 3701 	ld	hl,#(_cu + 0x0006)
   873F 36 00         [10] 3702 	ld	(hl),#0x00
   8741                    3703 00103$:
   8741 DD F9         [10] 3704 	ld	sp, ix
   8743 DD E1         [14] 3705 	pop	ix
   8745 C9            [10] 3706 	ret
                           3707 ;src/main.c:721: void redibujarCuchillo( ) {
                           3708 ;	---------------------------------
                           3709 ; Function redibujarCuchillo
                           3710 ; ---------------------------------
   8746                    3711 _redibujarCuchillo::
                           3712 ;src/main.c:722: borrarCuchillo();
   8746 CD C8 86      [17] 3713 	call	_borrarCuchillo
                           3714 ;src/main.c:723: cu.px = cu.x;
   8749 01 E0 69      [10] 3715 	ld	bc,#_cu + 2
   874C 3A DE 69      [13] 3716 	ld	a, (#_cu + 0)
   874F 02            [ 7] 3717 	ld	(bc),a
                           3718 ;src/main.c:724: cu.py = cu.y;
   8750 01 E1 69      [10] 3719 	ld	bc,#_cu + 3
   8753 3A DF 69      [13] 3720 	ld	a, (#_cu + 1)
   8756 02            [ 7] 3721 	ld	(bc),a
                           3722 ;src/main.c:725: dibujarCuchillo();
   8757 C3 64 86      [10] 3723 	jp  _dibujarCuchillo
                           3724 ;src/main.c:728: void lanzarCuchillo(){
                           3725 ;	---------------------------------
                           3726 ; Function lanzarCuchillo
                           3727 ; ---------------------------------
   875A                    3728 _lanzarCuchillo::
                           3729 ;src/main.c:730: if(!cu.lanzado){
   875A 3A E4 69      [13] 3730 	ld	a, (#(_cu + 0x0006) + 0)
   875D B7            [ 4] 3731 	or	a, a
   875E C0            [11] 3732 	ret	NZ
                           3733 ;src/main.c:732: if(prota.mira == M_derecha){
   875F 21 DD 69      [10] 3734 	ld	hl, #_prota + 7
   8762 5E            [ 7] 3735 	ld	e,(hl)
                           3736 ;src/main.c:733: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   8763 01 D7 69      [10] 3737 	ld	bc,#_prota + 1
                           3738 ;src/main.c:735: cu.direccion = M_derecha;
                           3739 ;src/main.c:737: cu.y=prota.y + G_HERO_H /2;
                           3740 ;src/main.c:738: cu.sprite=g_knifeX_0;
                           3741 ;src/main.c:739: cu.eje = E_X;
                           3742 ;src/main.c:732: if(prota.mira == M_derecha){
   8766 7B            [ 4] 3743 	ld	a,e
   8767 B7            [ 4] 3744 	or	a, a
   8768 20 41         [12] 3745 	jr	NZ,00118$
                           3746 ;src/main.c:733: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   876A 0A            [ 7] 3747 	ld	a,(bc)
   876B C6 0B         [ 7] 3748 	add	a, #0x0B
   876D 5F            [ 4] 3749 	ld	e,a
   876E 3A D6 69      [13] 3750 	ld	a, (#_prota + 0)
   8771 C6 0C         [ 7] 3751 	add	a, #0x0C
   8773 6F            [ 4] 3752 	ld	l,a
   8774 C5            [11] 3753 	push	bc
   8775 7B            [ 4] 3754 	ld	a,e
   8776 F5            [11] 3755 	push	af
   8777 33            [ 6] 3756 	inc	sp
   8778 7D            [ 4] 3757 	ld	a,l
   8779 F5            [11] 3758 	push	af
   877A 33            [ 6] 3759 	inc	sp
   877B CD 7E 73      [17] 3760 	call	_getTilePtr
   877E F1            [10] 3761 	pop	af
   877F C1            [10] 3762 	pop	bc
   8780 5E            [ 7] 3763 	ld	e,(hl)
   8781 3E 02         [ 7] 3764 	ld	a,#0x02
   8783 93            [ 4] 3765 	sub	a, e
   8784 D8            [11] 3766 	ret	C
                           3767 ;src/main.c:734: cu.lanzado = SI;
   8785 21 E4 69      [10] 3768 	ld	hl,#(_cu + 0x0006)
   8788 36 01         [10] 3769 	ld	(hl),#0x01
                           3770 ;src/main.c:735: cu.direccion = M_derecha;
   878A 21 E5 69      [10] 3771 	ld	hl,#(_cu + 0x0007)
   878D 36 00         [10] 3772 	ld	(hl),#0x00
                           3773 ;src/main.c:736: cu.x=prota.x + G_HERO_W;
   878F 3A D6 69      [13] 3774 	ld	a, (#_prota + 0)
   8792 C6 07         [ 7] 3775 	add	a, #0x07
   8794 32 DE 69      [13] 3776 	ld	(#_cu),a
                           3777 ;src/main.c:737: cu.y=prota.y + G_HERO_H /2;
   8797 0A            [ 7] 3778 	ld	a,(bc)
   8798 C6 0B         [ 7] 3779 	add	a, #0x0B
   879A 32 DF 69      [13] 3780 	ld	(#(_cu + 0x0001)),a
                           3781 ;src/main.c:738: cu.sprite=g_knifeX_0;
   879D 21 C0 24      [10] 3782 	ld	hl,#_g_knifeX_0
   87A0 22 E2 69      [16] 3783 	ld	((_cu + 0x0004)), hl
                           3784 ;src/main.c:739: cu.eje = E_X;
   87A3 21 E6 69      [10] 3785 	ld	hl,#(_cu + 0x0008)
   87A6 36 00         [10] 3786 	ld	(hl),#0x00
                           3787 ;src/main.c:740: dibujarCuchillo();
   87A8 C3 64 86      [10] 3788 	jp  _dibujarCuchillo
   87AB                    3789 00118$:
                           3790 ;src/main.c:743: else if(prota.mira == M_izquierda){
   87AB 7B            [ 4] 3791 	ld	a,e
   87AC 3D            [ 4] 3792 	dec	a
   87AD 20 41         [12] 3793 	jr	NZ,00115$
                           3794 ;src/main.c:744: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   87AF 0A            [ 7] 3795 	ld	a,(bc)
   87B0 C6 0B         [ 7] 3796 	add	a, #0x0B
   87B2 5F            [ 4] 3797 	ld	e,a
   87B3 3A D6 69      [13] 3798 	ld	a, (#_prota + 0)
   87B6 C6 F6         [ 7] 3799 	add	a,#0xF6
   87B8 6F            [ 4] 3800 	ld	l,a
   87B9 C5            [11] 3801 	push	bc
   87BA 7B            [ 4] 3802 	ld	a,e
   87BB F5            [11] 3803 	push	af
   87BC 33            [ 6] 3804 	inc	sp
   87BD 7D            [ 4] 3805 	ld	a,l
   87BE F5            [11] 3806 	push	af
   87BF 33            [ 6] 3807 	inc	sp
   87C0 CD 7E 73      [17] 3808 	call	_getTilePtr
   87C3 F1            [10] 3809 	pop	af
   87C4 C1            [10] 3810 	pop	bc
   87C5 5E            [ 7] 3811 	ld	e,(hl)
   87C6 3E 02         [ 7] 3812 	ld	a,#0x02
   87C8 93            [ 4] 3813 	sub	a, e
   87C9 D8            [11] 3814 	ret	C
                           3815 ;src/main.c:745: cu.lanzado = SI;
   87CA 21 E4 69      [10] 3816 	ld	hl,#(_cu + 0x0006)
   87CD 36 01         [10] 3817 	ld	(hl),#0x01
                           3818 ;src/main.c:746: cu.direccion = M_izquierda;
   87CF 21 E5 69      [10] 3819 	ld	hl,#(_cu + 0x0007)
   87D2 36 01         [10] 3820 	ld	(hl),#0x01
                           3821 ;src/main.c:747: cu.x = prota.x - G_KNIFEX_0_W;
   87D4 3A D6 69      [13] 3822 	ld	a, (#_prota + 0)
   87D7 C6 FC         [ 7] 3823 	add	a,#0xFC
   87D9 32 DE 69      [13] 3824 	ld	(#_cu),a
                           3825 ;src/main.c:748: cu.y = prota.y + G_HERO_H /2;
   87DC 0A            [ 7] 3826 	ld	a,(bc)
   87DD C6 0B         [ 7] 3827 	add	a, #0x0B
   87DF 32 DF 69      [13] 3828 	ld	(#(_cu + 0x0001)),a
                           3829 ;src/main.c:749: cu.sprite = g_knifeX_1;
   87E2 21 D0 24      [10] 3830 	ld	hl,#_g_knifeX_1
   87E5 22 E2 69      [16] 3831 	ld	((_cu + 0x0004)), hl
                           3832 ;src/main.c:750: cu.eje = E_X;
   87E8 21 E6 69      [10] 3833 	ld	hl,#(_cu + 0x0008)
   87EB 36 00         [10] 3834 	ld	(hl),#0x00
                           3835 ;src/main.c:751: dibujarCuchillo();
   87ED C3 64 86      [10] 3836 	jp  _dibujarCuchillo
   87F0                    3837 00115$:
                           3838 ;src/main.c:754: else if(prota.mira == M_abajo){
   87F0 7B            [ 4] 3839 	ld	a,e
   87F1 D6 03         [ 7] 3840 	sub	a, #0x03
   87F3 20 41         [12] 3841 	jr	NZ,00112$
                           3842 ;src/main.c:756: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   87F5 0A            [ 7] 3843 	ld	a,(bc)
   87F6 C6 1F         [ 7] 3844 	add	a, #0x1F
   87F8 5F            [ 4] 3845 	ld	e,a
   87F9 3A D6 69      [13] 3846 	ld	a, (#_prota + 0)
   87FC 57            [ 4] 3847 	ld	d,a
   87FD 14            [ 4] 3848 	inc	d
   87FE 14            [ 4] 3849 	inc	d
   87FF 14            [ 4] 3850 	inc	d
   8800 C5            [11] 3851 	push	bc
   8801 7B            [ 4] 3852 	ld	a,e
   8802 F5            [11] 3853 	push	af
   8803 33            [ 6] 3854 	inc	sp
   8804 D5            [11] 3855 	push	de
   8805 33            [ 6] 3856 	inc	sp
   8806 CD 7E 73      [17] 3857 	call	_getTilePtr
   8809 F1            [10] 3858 	pop	af
   880A C1            [10] 3859 	pop	bc
   880B 5E            [ 7] 3860 	ld	e,(hl)
   880C 3E 02         [ 7] 3861 	ld	a,#0x02
   880E 93            [ 4] 3862 	sub	a, e
   880F D8            [11] 3863 	ret	C
                           3864 ;src/main.c:757: cu.lanzado = SI;
   8810 21 E4 69      [10] 3865 	ld	hl,#(_cu + 0x0006)
   8813 36 01         [10] 3866 	ld	(hl),#0x01
                           3867 ;src/main.c:758: cu.direccion = M_abajo;
   8815 21 E5 69      [10] 3868 	ld	hl,#(_cu + 0x0007)
   8818 36 03         [10] 3869 	ld	(hl),#0x03
                           3870 ;src/main.c:759: cu.x = prota.x + G_HERO_W / 2;
   881A 3A D6 69      [13] 3871 	ld	a, (#_prota + 0)
   881D C6 03         [ 7] 3872 	add	a, #0x03
   881F 32 DE 69      [13] 3873 	ld	(#_cu),a
                           3874 ;src/main.c:760: cu.y = prota.y + G_HERO_H;
   8822 0A            [ 7] 3875 	ld	a,(bc)
   8823 C6 16         [ 7] 3876 	add	a, #0x16
   8825 32 DF 69      [13] 3877 	ld	(#(_cu + 0x0001)),a
                           3878 ;src/main.c:761: cu.sprite = g_knifeY_0;
   8828 21 A0 24      [10] 3879 	ld	hl,#_g_knifeY_0
   882B 22 E2 69      [16] 3880 	ld	((_cu + 0x0004)), hl
                           3881 ;src/main.c:762: cu.eje = E_Y;
   882E 21 E6 69      [10] 3882 	ld	hl,#(_cu + 0x0008)
   8831 36 01         [10] 3883 	ld	(hl),#0x01
                           3884 ;src/main.c:763: dibujarCuchillo();
   8833 C3 64 86      [10] 3885 	jp  _dibujarCuchillo
   8836                    3886 00112$:
                           3887 ;src/main.c:766: else if(prota.mira == M_arriba){
   8836 7B            [ 4] 3888 	ld	a,e
   8837 D6 02         [ 7] 3889 	sub	a, #0x02
   8839 C0            [11] 3890 	ret	NZ
                           3891 ;src/main.c:767: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   883A 0A            [ 7] 3892 	ld	a,(bc)
   883B C6 F7         [ 7] 3893 	add	a,#0xF7
   883D 57            [ 4] 3894 	ld	d,a
   883E 3A D6 69      [13] 3895 	ld	a, (#_prota + 0)
   8841 C6 03         [ 7] 3896 	add	a, #0x03
   8843 C5            [11] 3897 	push	bc
   8844 D5            [11] 3898 	push	de
   8845 33            [ 6] 3899 	inc	sp
   8846 F5            [11] 3900 	push	af
   8847 33            [ 6] 3901 	inc	sp
   8848 CD 7E 73      [17] 3902 	call	_getTilePtr
   884B F1            [10] 3903 	pop	af
   884C C1            [10] 3904 	pop	bc
   884D 5E            [ 7] 3905 	ld	e,(hl)
   884E 3E 02         [ 7] 3906 	ld	a,#0x02
   8850 93            [ 4] 3907 	sub	a, e
   8851 D8            [11] 3908 	ret	C
                           3909 ;src/main.c:768: cu.lanzado = SI;
   8852 21 E4 69      [10] 3910 	ld	hl,#(_cu + 0x0006)
   8855 36 01         [10] 3911 	ld	(hl),#0x01
                           3912 ;src/main.c:769: cu.direccion = M_arriba;
   8857 21 E5 69      [10] 3913 	ld	hl,#(_cu + 0x0007)
   885A 36 02         [10] 3914 	ld	(hl),#0x02
                           3915 ;src/main.c:770: cu.x = prota.x + G_HERO_W / 2;
   885C 3A D6 69      [13] 3916 	ld	a, (#_prota + 0)
   885F C6 03         [ 7] 3917 	add	a, #0x03
   8861 32 DE 69      [13] 3918 	ld	(#_cu),a
                           3919 ;src/main.c:771: cu.y = prota.y;
   8864 0A            [ 7] 3920 	ld	a,(bc)
   8865 32 DF 69      [13] 3921 	ld	(#(_cu + 0x0001)),a
                           3922 ;src/main.c:772: cu.sprite = g_knifeY_1;
   8868 21 B0 24      [10] 3923 	ld	hl,#_g_knifeY_1
   886B 22 E2 69      [16] 3924 	ld	((_cu + 0x0004)), hl
                           3925 ;src/main.c:773: cu.eje = E_Y;
   886E 21 E6 69      [10] 3926 	ld	hl,#(_cu + 0x0008)
   8871 36 01         [10] 3927 	ld	(hl),#0x01
                           3928 ;src/main.c:774: dibujarCuchillo();
   8873 C3 64 86      [10] 3929 	jp  _dibujarCuchillo
                           3930 ;src/main.c:780: void comprobarTeclado() {
                           3931 ;	---------------------------------
                           3932 ; Function comprobarTeclado
                           3933 ; ---------------------------------
   8876                    3934 _comprobarTeclado::
                           3935 ;src/main.c:781: cpct_scanKeyboard_if();
   8876 CD BA 5A      [17] 3936 	call	_cpct_scanKeyboard_if
                           3937 ;src/main.c:783: if (cpct_isAnyKeyPressed()) {
   8879 CD AD 5A      [17] 3938 	call	_cpct_isAnyKeyPressed
   887C 7D            [ 4] 3939 	ld	a,l
   887D B7            [ 4] 3940 	or	a, a
   887E C8            [11] 3941 	ret	Z
                           3942 ;src/main.c:784: if (cpct_isKeyPressed(Key_CursorLeft))
   887F 21 01 01      [10] 3943 	ld	hl,#0x0101
   8882 CD 17 58      [17] 3944 	call	_cpct_isKeyPressed
   8885 7D            [ 4] 3945 	ld	a,l
   8886 B7            [ 4] 3946 	or	a, a
                           3947 ;src/main.c:785: moverIzquierda();
   8887 C2 B1 85      [10] 3948 	jp	NZ,_moverIzquierda
                           3949 ;src/main.c:786: else if (cpct_isKeyPressed(Key_CursorRight))
   888A 21 00 02      [10] 3950 	ld	hl,#0x0200
   888D CD 17 58      [17] 3951 	call	_cpct_isKeyPressed
   8890 7D            [ 4] 3952 	ld	a,l
   8891 B7            [ 4] 3953 	or	a, a
                           3954 ;src/main.c:787: moverDerecha();
   8892 C2 D6 85      [10] 3955 	jp	NZ,_moverDerecha
                           3956 ;src/main.c:788: else if (cpct_isKeyPressed(Key_CursorUp))
   8895 21 00 01      [10] 3957 	ld	hl,#0x0100
   8898 CD 17 58      [17] 3958 	call	_cpct_isKeyPressed
   889B 7D            [ 4] 3959 	ld	a,l
   889C B7            [ 4] 3960 	or	a, a
                           3961 ;src/main.c:789: moverArriba();
   889D C2 1C 86      [10] 3962 	jp	NZ,_moverArriba
                           3963 ;src/main.c:790: else if (cpct_isKeyPressed(Key_CursorDown))
   88A0 21 00 04      [10] 3964 	ld	hl,#0x0400
   88A3 CD 17 58      [17] 3965 	call	_cpct_isKeyPressed
   88A6 7D            [ 4] 3966 	ld	a,l
   88A7 B7            [ 4] 3967 	or	a, a
                           3968 ;src/main.c:791: moverAbajo();
   88A8 C2 40 86      [10] 3969 	jp	NZ,_moverAbajo
                           3970 ;src/main.c:792: else if (cpct_isKeyPressed(Key_Space))
   88AB 21 05 80      [10] 3971 	ld	hl,#0x8005
   88AE CD 17 58      [17] 3972 	call	_cpct_isKeyPressed
   88B1 7D            [ 4] 3973 	ld	a,l
   88B2 B7            [ 4] 3974 	or	a, a
   88B3 C8            [11] 3975 	ret	Z
                           3976 ;src/main.c:793: lanzarCuchillo();
   88B4 C3 5A 87      [10] 3977 	jp  _lanzarCuchillo
                           3978 ;src/main.c:797: u8 checkKnifeCollision(int direction, u8 xoff, u8 yoff){
                           3979 ;	---------------------------------
                           3980 ; Function checkKnifeCollision
                           3981 ; ---------------------------------
   88B7                    3982 _checkKnifeCollision::
                           3983 ;src/main.c:799: return *getTilePtr(cu.x + xoff, cu.y + yoff) <= 2;
   88B7 3A DF 69      [13] 3984 	ld	a,(#_cu + 1)
   88BA 21 05 00      [10] 3985 	ld	hl,#5
   88BD 39            [11] 3986 	add	hl,sp
   88BE 86            [ 7] 3987 	add	a, (hl)
   88BF 47            [ 4] 3988 	ld	b,a
   88C0 3A DE 69      [13] 3989 	ld	a,(#_cu + 0)
   88C3 21 04 00      [10] 3990 	ld	hl,#4
   88C6 39            [11] 3991 	add	hl,sp
   88C7 86            [ 7] 3992 	add	a, (hl)
   88C8 4F            [ 4] 3993 	ld	c,a
   88C9 C5            [11] 3994 	push	bc
   88CA CD 7E 73      [17] 3995 	call	_getTilePtr
   88CD F1            [10] 3996 	pop	af
   88CE 4E            [ 7] 3997 	ld	c,(hl)
   88CF 3E 02         [ 7] 3998 	ld	a,#0x02
   88D1 91            [ 4] 3999 	sub	a, c
   88D2 3E 00         [ 7] 4000 	ld	a,#0x00
   88D4 17            [ 4] 4001 	rla
   88D5 EE 01         [ 7] 4002 	xor	a, #0x01
   88D7 6F            [ 4] 4003 	ld	l, a
   88D8 C9            [10] 4004 	ret
                           4005 ;src/main.c:802: void moverCuchillo(){
                           4006 ;	---------------------------------
                           4007 ; Function moverCuchillo
                           4008 ; ---------------------------------
   88D9                    4009 _moverCuchillo::
                           4010 ;src/main.c:803: if(cu.lanzado){
   88D9 01 DE 69      [10] 4011 	ld	bc,#_cu+0
   88DC 3A E4 69      [13] 4012 	ld	a, (#_cu + 6)
   88DF B7            [ 4] 4013 	or	a, a
   88E0 C8            [11] 4014 	ret	Z
                           4015 ;src/main.c:804: cu.mover = SI;
   88E1 21 09 00      [10] 4016 	ld	hl,#0x0009
   88E4 09            [11] 4017 	add	hl,bc
   88E5 EB            [ 4] 4018 	ex	de,hl
   88E6 3E 01         [ 7] 4019 	ld	a,#0x01
   88E8 12            [ 7] 4020 	ld	(de),a
                           4021 ;src/main.c:805: if(cu.direccion == M_derecha){
   88E9 21 E5 69      [10] 4022 	ld	hl, #_cu + 7
   88EC 6E            [ 7] 4023 	ld	l,(hl)
   88ED 7D            [ 4] 4024 	ld	a,l
   88EE B7            [ 4] 4025 	or	a, a
   88EF 20 1E         [12] 4026 	jr	NZ,00122$
                           4027 ;src/main.c:807: if(checkKnifeCollision(M_derecha, G_KNIFEX_0_W + 1, 0)){
   88F1 C5            [11] 4028 	push	bc
   88F2 D5            [11] 4029 	push	de
   88F3 21 05 00      [10] 4030 	ld	hl,#0x0005
   88F6 E5            [11] 4031 	push	hl
   88F7 2E 00         [ 7] 4032 	ld	l, #0x00
   88F9 E5            [11] 4033 	push	hl
   88FA CD B7 88      [17] 4034 	call	_checkKnifeCollision
   88FD F1            [10] 4035 	pop	af
   88FE F1            [10] 4036 	pop	af
   88FF D1            [10] 4037 	pop	de
   8900 C1            [10] 4038 	pop	bc
   8901 7D            [ 4] 4039 	ld	a,l
   8902 B7            [ 4] 4040 	or	a, a
   8903 28 07         [12] 4041 	jr	Z,00102$
                           4042 ;src/main.c:808: cu.mover = SI;
   8905 3E 01         [ 7] 4043 	ld	a,#0x01
   8907 12            [ 7] 4044 	ld	(de),a
                           4045 ;src/main.c:809: cu.x++;
   8908 0A            [ 7] 4046 	ld	a,(bc)
   8909 3C            [ 4] 4047 	inc	a
   890A 02            [ 7] 4048 	ld	(bc),a
   890B C9            [10] 4049 	ret
   890C                    4050 00102$:
                           4051 ;src/main.c:812: cu.mover=NO;
   890C AF            [ 4] 4052 	xor	a, a
   890D 12            [ 7] 4053 	ld	(de),a
   890E C9            [10] 4054 	ret
   890F                    4055 00122$:
                           4056 ;src/main.c:815: else if(cu.direccion == M_izquierda){
   890F 7D            [ 4] 4057 	ld	a,l
   8910 3D            [ 4] 4058 	dec	a
   8911 20 1F         [12] 4059 	jr	NZ,00119$
                           4060 ;src/main.c:816: if(checkKnifeCollision(M_derecha, -1, 0)){
   8913 C5            [11] 4061 	push	bc
   8914 D5            [11] 4062 	push	de
   8915 21 FF 00      [10] 4063 	ld	hl,#0x00FF
   8918 E5            [11] 4064 	push	hl
   8919 2E 00         [ 7] 4065 	ld	l, #0x00
   891B E5            [11] 4066 	push	hl
   891C CD B7 88      [17] 4067 	call	_checkKnifeCollision
   891F F1            [10] 4068 	pop	af
   8920 F1            [10] 4069 	pop	af
   8921 D1            [10] 4070 	pop	de
   8922 C1            [10] 4071 	pop	bc
   8923 7D            [ 4] 4072 	ld	a,l
   8924 B7            [ 4] 4073 	or	a, a
   8925 28 08         [12] 4074 	jr	Z,00105$
                           4075 ;src/main.c:817: cu.mover = SI;
   8927 3E 01         [ 7] 4076 	ld	a,#0x01
   8929 12            [ 7] 4077 	ld	(de),a
                           4078 ;src/main.c:818: cu.x--;
   892A 0A            [ 7] 4079 	ld	a,(bc)
   892B C6 FF         [ 7] 4080 	add	a,#0xFF
   892D 02            [ 7] 4081 	ld	(bc),a
   892E C9            [10] 4082 	ret
   892F                    4083 00105$:
                           4084 ;src/main.c:820: cu.mover=NO;
   892F AF            [ 4] 4085 	xor	a, a
   8930 12            [ 7] 4086 	ld	(de),a
   8931 C9            [10] 4087 	ret
   8932                    4088 00119$:
                           4089 ;src/main.c:826: cu.y--;
   8932 03            [ 6] 4090 	inc	bc
                           4091 ;src/main.c:823: else if(cu.direccion == M_arriba){
   8933 7D            [ 4] 4092 	ld	a,l
   8934 D6 02         [ 7] 4093 	sub	a, #0x02
   8936 20 22         [12] 4094 	jr	NZ,00116$
                           4095 ;src/main.c:824: if(checkKnifeCollision(M_derecha, 0, -2)){
   8938 C5            [11] 4096 	push	bc
   8939 D5            [11] 4097 	push	de
   893A 21 00 FE      [10] 4098 	ld	hl,#0xFE00
   893D E5            [11] 4099 	push	hl
   893E 26 00         [ 7] 4100 	ld	h, #0x00
   8940 E5            [11] 4101 	push	hl
   8941 CD B7 88      [17] 4102 	call	_checkKnifeCollision
   8944 F1            [10] 4103 	pop	af
   8945 F1            [10] 4104 	pop	af
   8946 D1            [10] 4105 	pop	de
   8947 C1            [10] 4106 	pop	bc
   8948 7D            [ 4] 4107 	ld	a,l
   8949 B7            [ 4] 4108 	or	a, a
   894A 28 0B         [12] 4109 	jr	Z,00108$
                           4110 ;src/main.c:825: cu.mover = SI;
   894C 3E 01         [ 7] 4111 	ld	a,#0x01
   894E 12            [ 7] 4112 	ld	(de),a
                           4113 ;src/main.c:826: cu.y--;
   894F 0A            [ 7] 4114 	ld	a,(bc)
   8950 C6 FF         [ 7] 4115 	add	a,#0xFF
   8952 02            [ 7] 4116 	ld	(bc),a
                           4117 ;src/main.c:827: cu.y--;
   8953 C6 FF         [ 7] 4118 	add	a,#0xFF
   8955 02            [ 7] 4119 	ld	(bc),a
   8956 C9            [10] 4120 	ret
   8957                    4121 00108$:
                           4122 ;src/main.c:830: cu.mover=NO;
   8957 AF            [ 4] 4123 	xor	a, a
   8958 12            [ 7] 4124 	ld	(de),a
   8959 C9            [10] 4125 	ret
   895A                    4126 00116$:
                           4127 ;src/main.c:833: else if(cu.direccion == M_abajo){
   895A 7D            [ 4] 4128 	ld	a,l
   895B D6 03         [ 7] 4129 	sub	a, #0x03
   895D C0            [11] 4130 	ret	NZ
                           4131 ;src/main.c:834: if(checkKnifeCollision(M_derecha, 0, G_KNIFEY_0_H + 2)){
   895E C5            [11] 4132 	push	bc
   895F D5            [11] 4133 	push	de
   8960 21 00 0A      [10] 4134 	ld	hl,#0x0A00
   8963 E5            [11] 4135 	push	hl
   8964 26 00         [ 7] 4136 	ld	h, #0x00
   8966 E5            [11] 4137 	push	hl
   8967 CD B7 88      [17] 4138 	call	_checkKnifeCollision
   896A F1            [10] 4139 	pop	af
   896B F1            [10] 4140 	pop	af
   896C D1            [10] 4141 	pop	de
   896D C1            [10] 4142 	pop	bc
   896E 7D            [ 4] 4143 	ld	a,l
   896F B7            [ 4] 4144 	or	a, a
   8970 28 09         [12] 4145 	jr	Z,00111$
                           4146 ;src/main.c:835: cu.mover = SI;
   8972 3E 01         [ 7] 4147 	ld	a,#0x01
   8974 12            [ 7] 4148 	ld	(de),a
                           4149 ;src/main.c:836: cu.y++;
   8975 0A            [ 7] 4150 	ld	a,(bc)
   8976 3C            [ 4] 4151 	inc	a
   8977 02            [ 7] 4152 	ld	(bc),a
                           4153 ;src/main.c:837: cu.y++;
   8978 3C            [ 4] 4154 	inc	a
   8979 02            [ 7] 4155 	ld	(bc),a
   897A C9            [10] 4156 	ret
   897B                    4157 00111$:
                           4158 ;src/main.c:840: cu.mover=NO;
   897B AF            [ 4] 4159 	xor	a, a
   897C 12            [ 7] 4160 	ld	(de),a
   897D C9            [10] 4161 	ret
                           4162 ;src/main.c:846: void barraPuntuacionInicial(){
                           4163 ;	---------------------------------
                           4164 ; Function barraPuntuacionInicial
                           4165 ; ---------------------------------
   897E                    4166 _barraPuntuacionInicial::
                           4167 ;src/main.c:851: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   897E 21 00 02      [10] 4168 	ld	hl,#0x0200
   8981 E5            [11] 4169 	push	hl
   8982 26 C0         [ 7] 4170 	ld	h, #0xC0
   8984 E5            [11] 4171 	push	hl
   8985 CD 69 64      [17] 4172 	call	_cpct_getScreenPtr
   8988 4D            [ 4] 4173 	ld	c,l
   8989 44            [ 4] 4174 	ld	b,h
                           4175 ;src/main.c:852: cpct_drawStringM0("SCORE", memptr, 1, 0);
   898A 21 01 00      [10] 4176 	ld	hl,#0x0001
   898D E5            [11] 4177 	push	hl
   898E C5            [11] 4178 	push	bc
   898F 21 26 8A      [10] 4179 	ld	hl,#___str_1
   8992 E5            [11] 4180 	push	hl
   8993 CD 99 58      [17] 4181 	call	_cpct_drawStringM0
   8996 21 06 00      [10] 4182 	ld	hl,#6
   8999 39            [11] 4183 	add	hl,sp
   899A F9            [ 6] 4184 	ld	sp,hl
                           4185 ;src/main.c:853: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   899B 21 00 0E      [10] 4186 	ld	hl,#0x0E00
   899E E5            [11] 4187 	push	hl
   899F 26 C0         [ 7] 4188 	ld	h, #0xC0
   89A1 E5            [11] 4189 	push	hl
   89A2 CD 69 64      [17] 4190 	call	_cpct_getScreenPtr
   89A5 4D            [ 4] 4191 	ld	c,l
   89A6 44            [ 4] 4192 	ld	b,h
                           4193 ;src/main.c:854: cpct_drawStringM0("00000", memptr, 15, 0);
   89A7 21 0F 00      [10] 4194 	ld	hl,#0x000F
   89AA E5            [11] 4195 	push	hl
   89AB C5            [11] 4196 	push	bc
   89AC 21 2C 8A      [10] 4197 	ld	hl,#___str_2
   89AF E5            [11] 4198 	push	hl
   89B0 CD 99 58      [17] 4199 	call	_cpct_drawStringM0
   89B3 21 06 00      [10] 4200 	ld	hl,#6
   89B6 39            [11] 4201 	add	hl,sp
   89B7 F9            [ 6] 4202 	ld	sp,hl
                           4203 ;src/main.c:857: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 14);
   89B8 21 1A 0E      [10] 4204 	ld	hl,#0x0E1A
   89BB E5            [11] 4205 	push	hl
   89BC 21 00 C0      [10] 4206 	ld	hl,#0xC000
   89BF E5            [11] 4207 	push	hl
   89C0 CD 69 64      [17] 4208 	call	_cpct_getScreenPtr
   89C3 4D            [ 4] 4209 	ld	c,l
   89C4 44            [ 4] 4210 	ld	b,h
                           4211 ;src/main.c:858: cpct_drawStringM0("ROBOBIT", memptr, 3, 0);
   89C5 21 03 00      [10] 4212 	ld	hl,#0x0003
   89C8 E5            [11] 4213 	push	hl
   89C9 C5            [11] 4214 	push	bc
   89CA 21 32 8A      [10] 4215 	ld	hl,#___str_3
   89CD E5            [11] 4216 	push	hl
   89CE CD 99 58      [17] 4217 	call	_cpct_drawStringM0
   89D1 21 06 00      [10] 4218 	ld	hl,#6
   89D4 39            [11] 4219 	add	hl,sp
   89D5 F9            [ 6] 4220 	ld	sp,hl
                           4221 ;src/main.c:860: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   89D6 21 3C 02      [10] 4222 	ld	hl,#0x023C
   89D9 E5            [11] 4223 	push	hl
   89DA 21 00 C0      [10] 4224 	ld	hl,#0xC000
   89DD E5            [11] 4225 	push	hl
   89DE CD 69 64      [17] 4226 	call	_cpct_getScreenPtr
   89E1 4D            [ 4] 4227 	ld	c,l
   89E2 44            [ 4] 4228 	ld	b,h
                           4229 ;src/main.c:861: cpct_drawStringM0("LIVES", memptr, 1, 0);
   89E3 21 01 00      [10] 4230 	ld	hl,#0x0001
   89E6 E5            [11] 4231 	push	hl
   89E7 C5            [11] 4232 	push	bc
   89E8 21 3A 8A      [10] 4233 	ld	hl,#___str_4
   89EB E5            [11] 4234 	push	hl
   89EC CD 99 58      [17] 4235 	call	_cpct_drawStringM0
   89EF 21 06 00      [10] 4236 	ld	hl,#6
   89F2 39            [11] 4237 	add	hl,sp
   89F3 F9            [ 6] 4238 	ld	sp,hl
                           4239 ;src/main.c:863: for(i=0; i<5; i++){
   89F4 01 00 00      [10] 4240 	ld	bc,#0x0000
   89F7                    4241 00102$:
                           4242 ;src/main.c:864: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   89F7 79            [ 4] 4243 	ld	a,c
   89F8 87            [ 4] 4244 	add	a, a
   89F9 87            [ 4] 4245 	add	a, a
   89FA C6 3C         [ 7] 4246 	add	a, #0x3C
   89FC 57            [ 4] 4247 	ld	d,a
   89FD C5            [11] 4248 	push	bc
   89FE 3E 0E         [ 7] 4249 	ld	a,#0x0E
   8A00 F5            [11] 4250 	push	af
   8A01 33            [ 6] 4251 	inc	sp
   8A02 D5            [11] 4252 	push	de
   8A03 33            [ 6] 4253 	inc	sp
   8A04 21 00 C0      [10] 4254 	ld	hl,#0xC000
   8A07 E5            [11] 4255 	push	hl
   8A08 CD 69 64      [17] 4256 	call	_cpct_getScreenPtr
   8A0B EB            [ 4] 4257 	ex	de,hl
   8A0C 21 03 06      [10] 4258 	ld	hl,#0x0603
   8A0F E5            [11] 4259 	push	hl
   8A10 D5            [11] 4260 	push	de
   8A11 21 60 48      [10] 4261 	ld	hl,#_g_heart
   8A14 E5            [11] 4262 	push	hl
   8A15 CD BD 58      [17] 4263 	call	_cpct_drawSprite
   8A18 C1            [10] 4264 	pop	bc
                           4265 ;src/main.c:863: for(i=0; i<5; i++){
   8A19 03            [ 6] 4266 	inc	bc
   8A1A 79            [ 4] 4267 	ld	a,c
   8A1B D6 05         [ 7] 4268 	sub	a, #0x05
   8A1D 78            [ 4] 4269 	ld	a,b
   8A1E 17            [ 4] 4270 	rla
   8A1F 3F            [ 4] 4271 	ccf
   8A20 1F            [ 4] 4272 	rra
   8A21 DE 80         [ 7] 4273 	sbc	a, #0x80
   8A23 38 D2         [12] 4274 	jr	C,00102$
   8A25 C9            [10] 4275 	ret
   8A26                    4276 ___str_1:
   8A26 53 43 4F 52 45     4277 	.ascii "SCORE"
   8A2B 00                 4278 	.db 0x00
   8A2C                    4279 ___str_2:
   8A2C 30 30 30 30 30     4280 	.ascii "00000"
   8A31 00                 4281 	.db 0x00
   8A32                    4282 ___str_3:
   8A32 52 4F 42 4F 42 49  4283 	.ascii "ROBOBIT"
        54
   8A39 00                 4284 	.db 0x00
   8A3A                    4285 ___str_4:
   8A3A 4C 49 56 45 53     4286 	.ascii "LIVES"
   8A3F 00                 4287 	.db 0x00
                           4288 ;src/main.c:869: void borrarPantallaArriba(u8 x, u8 y, u8 ancho, u8 alto){
                           4289 ;	---------------------------------
                           4290 ; Function borrarPantallaArriba
                           4291 ; ---------------------------------
   8A40                    4292 _borrarPantallaArriba::
   8A40 DD E5         [15] 4293 	push	ix
   8A42 DD 21 00 00   [14] 4294 	ld	ix,#0
   8A46 DD 39         [15] 4295 	add	ix,sp
                           4296 ;src/main.c:872: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   8A48 DD 66 05      [19] 4297 	ld	h,5 (ix)
   8A4B DD 6E 04      [19] 4298 	ld	l,4 (ix)
   8A4E E5            [11] 4299 	push	hl
   8A4F 21 00 C0      [10] 4300 	ld	hl,#0xC000
   8A52 E5            [11] 4301 	push	hl
   8A53 CD 69 64      [17] 4302 	call	_cpct_getScreenPtr
   8A56 4D            [ 4] 4303 	ld	c,l
   8A57 44            [ 4] 4304 	ld	b,h
                           4305 ;src/main.c:873: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra la mitad derecha
   8A58 DD 66 07      [19] 4306 	ld	h,7 (ix)
   8A5B DD 6E 06      [19] 4307 	ld	l,6 (ix)
   8A5E E5            [11] 4308 	push	hl
   8A5F AF            [ 4] 4309 	xor	a, a
   8A60 F5            [11] 4310 	push	af
   8A61 33            [ 6] 4311 	inc	sp
   8A62 C5            [11] 4312 	push	bc
   8A63 CD 8F 63      [17] 4313 	call	_cpct_drawSolidBox
   8A66 F1            [10] 4314 	pop	af
   8A67 F1            [10] 4315 	pop	af
   8A68 33            [ 6] 4316 	inc	sp
                           4317 ;src/main.c:874: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   8A69 DD 7E 04      [19] 4318 	ld	a,4 (ix)
   8A6C C6 28         [ 7] 4319 	add	a, #0x28
   8A6E 47            [ 4] 4320 	ld	b,a
   8A6F DD 7E 05      [19] 4321 	ld	a,5 (ix)
   8A72 F5            [11] 4322 	push	af
   8A73 33            [ 6] 4323 	inc	sp
   8A74 C5            [11] 4324 	push	bc
   8A75 33            [ 6] 4325 	inc	sp
   8A76 21 00 C0      [10] 4326 	ld	hl,#0xC000
   8A79 E5            [11] 4327 	push	hl
   8A7A CD 69 64      [17] 4328 	call	_cpct_getScreenPtr
   8A7D 4D            [ 4] 4329 	ld	c,l
   8A7E 44            [ 4] 4330 	ld	b,h
                           4331 ;src/main.c:875: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra la mitad izquierda
   8A7F DD 66 07      [19] 4332 	ld	h,7 (ix)
   8A82 DD 6E 06      [19] 4333 	ld	l,6 (ix)
   8A85 E5            [11] 4334 	push	hl
   8A86 AF            [ 4] 4335 	xor	a, a
   8A87 F5            [11] 4336 	push	af
   8A88 33            [ 6] 4337 	inc	sp
   8A89 C5            [11] 4338 	push	bc
   8A8A CD 8F 63      [17] 4339 	call	_cpct_drawSolidBox
   8A8D F1            [10] 4340 	pop	af
   8A8E F1            [10] 4341 	pop	af
   8A8F 33            [ 6] 4342 	inc	sp
   8A90 DD E1         [14] 4343 	pop	ix
   8A92 C9            [10] 4344 	ret
                           4345 ;src/main.c:878: void menuInicio(){
                           4346 ;	---------------------------------
                           4347 ; Function menuInicio
                           4348 ; ---------------------------------
   8A93                    4349 _menuInicio::
                           4350 ;src/main.c:882: cpct_clearScreen(0);
   8A93 21 00 40      [10] 4351 	ld	hl,#0x4000
   8A96 E5            [11] 4352 	push	hl
   8A97 AF            [ 4] 4353 	xor	a, a
   8A98 F5            [11] 4354 	push	af
   8A99 33            [ 6] 4355 	inc	sp
   8A9A 26 C0         [ 7] 4356 	ld	h, #0xC0
   8A9C E5            [11] 4357 	push	hl
   8A9D CD 48 5B      [17] 4358 	call	_cpct_memset
                           4359 ;src/main.c:884: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   8AA0 21 1A 0F      [10] 4360 	ld	hl,#0x0F1A
   8AA3 E5            [11] 4361 	push	hl
   8AA4 21 00 C0      [10] 4362 	ld	hl,#0xC000
   8AA7 E5            [11] 4363 	push	hl
   8AA8 CD 69 64      [17] 4364 	call	_cpct_getScreenPtr
   8AAB 4D            [ 4] 4365 	ld	c,l
   8AAC 44            [ 4] 4366 	ld	b,h
                           4367 ;src/main.c:885: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   8AAD 21 04 00      [10] 4368 	ld	hl,#0x0004
   8AB0 E5            [11] 4369 	push	hl
   8AB1 C5            [11] 4370 	push	bc
   8AB2 21 46 8B      [10] 4371 	ld	hl,#___str_5
   8AB5 E5            [11] 4372 	push	hl
   8AB6 CD 99 58      [17] 4373 	call	_cpct_drawStringM0
   8AB9 21 06 00      [10] 4374 	ld	hl,#6
   8ABC 39            [11] 4375 	add	hl,sp
   8ABD F9            [ 6] 4376 	ld	sp,hl
                           4377 ;src/main.c:887: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   8ABE 21 28 6E      [10] 4378 	ld	hl,#0x6E28
   8AC1 E5            [11] 4379 	push	hl
   8AC2 21 F0 F0      [10] 4380 	ld	hl,#0xF0F0
   8AC5 E5            [11] 4381 	push	hl
   8AC6 21 00 26      [10] 4382 	ld	hl,#_g_text_0
   8AC9 E5            [11] 4383 	push	hl
   8ACA CD BD 58      [17] 4384 	call	_cpct_drawSprite
                           4385 ;src/main.c:888: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   8ACD 21 28 6E      [10] 4386 	ld	hl,#0x6E28
   8AD0 E5            [11] 4387 	push	hl
   8AD1 21 18 F1      [10] 4388 	ld	hl,#0xF118
   8AD4 E5            [11] 4389 	push	hl
   8AD5 21 30 37      [10] 4390 	ld	hl,#_g_text_1
   8AD8 E5            [11] 4391 	push	hl
   8AD9 CD BD 58      [17] 4392 	call	_cpct_drawSprite
                           4393 ;src/main.c:911: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   8ADC 21 08 A0      [10] 4394 	ld	hl,#0xA008
   8ADF E5            [11] 4395 	push	hl
   8AE0 21 00 C0      [10] 4396 	ld	hl,#0xC000
   8AE3 E5            [11] 4397 	push	hl
   8AE4 CD 69 64      [17] 4398 	call	_cpct_getScreenPtr
   8AE7 4D            [ 4] 4399 	ld	c,l
   8AE8 44            [ 4] 4400 	ld	b,h
                           4401 ;src/main.c:912: cpct_drawStringM0("TO START PRESS S", memptr, 4, 0);
   8AE9 21 04 00      [10] 4402 	ld	hl,#0x0004
   8AEC E5            [11] 4403 	push	hl
   8AED C5            [11] 4404 	push	bc
   8AEE 21 4E 8B      [10] 4405 	ld	hl,#___str_6
   8AF1 E5            [11] 4406 	push	hl
   8AF2 CD 99 58      [17] 4407 	call	_cpct_drawStringM0
   8AF5 21 06 00      [10] 4408 	ld	hl,#6
   8AF8 39            [11] 4409 	add	hl,sp
   8AF9 F9            [ 6] 4410 	ld	sp,hl
                           4411 ;src/main.c:914: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 170); // centrado en horizontal y abajo en vertical
   8AFA 21 0A AA      [10] 4412 	ld	hl,#0xAA0A
   8AFD E5            [11] 4413 	push	hl
   8AFE 21 00 C0      [10] 4414 	ld	hl,#0xC000
   8B01 E5            [11] 4415 	push	hl
   8B02 CD 69 64      [17] 4416 	call	_cpct_getScreenPtr
   8B05 4D            [ 4] 4417 	ld	c,l
   8B06 44            [ 4] 4418 	ld	b,h
                           4419 ;src/main.c:915: cpct_drawStringM0("TO MENU PRESS M", memptr, 4, 0);
   8B07 21 04 00      [10] 4420 	ld	hl,#0x0004
   8B0A E5            [11] 4421 	push	hl
   8B0B C5            [11] 4422 	push	bc
   8B0C 21 5F 8B      [10] 4423 	ld	hl,#___str_7
   8B0F E5            [11] 4424 	push	hl
   8B10 CD 99 58      [17] 4425 	call	_cpct_drawStringM0
   8B13 21 06 00      [10] 4426 	ld	hl,#6
   8B16 39            [11] 4427 	add	hl,sp
   8B17 F9            [ 6] 4428 	ld	sp,hl
                           4429 ;src/main.c:918: do{
   8B18                    4430 00106$:
                           4431 ;src/main.c:919: cpct_scanKeyboard_f();
   8B18 CD 23 58      [17] 4432 	call	_cpct_scanKeyboard_f
                           4433 ;src/main.c:923: if(cpct_isKeyPressed(Key_M)){
   8B1B 21 04 40      [10] 4434 	ld	hl,#0x4004
   8B1E CD 17 58      [17] 4435 	call	_cpct_isKeyPressed
   8B21 7D            [ 4] 4436 	ld	a,l
   8B22 B7            [ 4] 4437 	or	a, a
   8B23 28 0D         [12] 4438 	jr	Z,00107$
                           4439 ;src/main.c:924: cpct_scanKeyboard_f();
   8B25 CD 23 58      [17] 4440 	call	_cpct_scanKeyboard_f
                           4441 ;src/main.c:925: do{
   8B28                    4442 00101$:
                           4443 ;src/main.c:927: } while(!cpct_isKeyPressed(Key_S));
   8B28 21 07 10      [10] 4444 	ld	hl,#0x1007
   8B2B CD 17 58      [17] 4445 	call	_cpct_isKeyPressed
   8B2E 7D            [ 4] 4446 	ld	a,l
   8B2F B7            [ 4] 4447 	or	a, a
   8B30 28 F6         [12] 4448 	jr	Z,00101$
   8B32                    4449 00107$:
                           4450 ;src/main.c:929: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   8B32 21 07 10      [10] 4451 	ld	hl,#0x1007
   8B35 CD 17 58      [17] 4452 	call	_cpct_isKeyPressed
   8B38 7D            [ 4] 4453 	ld	a,l
   8B39 B7            [ 4] 4454 	or	a, a
   8B3A C0            [11] 4455 	ret	NZ
   8B3B 21 04 40      [10] 4456 	ld	hl,#0x4004
   8B3E CD 17 58      [17] 4457 	call	_cpct_isKeyPressed
   8B41 7D            [ 4] 4458 	ld	a,l
   8B42 B7            [ 4] 4459 	or	a, a
   8B43 28 D3         [12] 4460 	jr	Z,00106$
   8B45 C9            [10] 4461 	ret
   8B46                    4462 ___str_5:
   8B46 52 4F 42 4F 42 49  4463 	.ascii "ROBOBIT"
        54
   8B4D 00                 4464 	.db 0x00
   8B4E                    4465 ___str_6:
   8B4E 54 4F 20 53 54 41  4466 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   8B5E 00                 4467 	.db 0x00
   8B5F                    4468 ___str_7:
   8B5F 54 4F 20 4D 45 4E  4469 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   8B6E 00                 4470 	.db 0x00
                           4471 ;src/main.c:932: void inicializarCPC() {
                           4472 ;	---------------------------------
                           4473 ; Function inicializarCPC
                           4474 ; ---------------------------------
   8B6F                    4475 _inicializarCPC::
                           4476 ;src/main.c:933: cpct_disableFirmware();
   8B6F CD 7F 63      [17] 4477 	call	_cpct_disableFirmware
                           4478 ;src/main.c:934: cpct_setVideoMode(0);
   8B72 2E 00         [ 7] 4479 	ld	l,#0x00
   8B74 CD 2A 5B      [17] 4480 	call	_cpct_setVideoMode
                           4481 ;src/main.c:935: cpct_setBorder(HW_BLACK);
   8B77 21 10 14      [10] 4482 	ld	hl,#0x1410
   8B7A E5            [11] 4483 	push	hl
   8B7B CD 8D 58      [17] 4484 	call	_cpct_setPALColour
                           4485 ;src/main.c:936: cpct_setPalette(g_palette, 16);
   8B7E 21 10 00      [10] 4486 	ld	hl,#0x0010
   8B81 E5            [11] 4487 	push	hl
   8B82 21 98 4A      [10] 4488 	ld	hl,#_g_palette
   8B85 E5            [11] 4489 	push	hl
   8B86 CD 00 58      [17] 4490 	call	_cpct_setPalette
                           4491 ;src/main.c:937: cpct_akp_musicInit(G_song);
   8B89 21 00 0F      [10] 4492 	ld	hl,#_G_song
   8B8C E5            [11] 4493 	push	hl
   8B8D CD 5B 62      [17] 4494 	call	_cpct_akp_musicInit
   8B90 F1            [10] 4495 	pop	af
   8B91 C9            [10] 4496 	ret
                           4497 ;src/main.c:940: void inicializarEnemy() {
                           4498 ;	---------------------------------
                           4499 ; Function inicializarEnemy
                           4500 ; ---------------------------------
   8B92                    4501 _inicializarEnemy::
   8B92 DD E5         [15] 4502 	push	ix
   8B94 DD 21 00 00   [14] 4503 	ld	ix,#0
   8B98 DD 39         [15] 4504 	add	ix,sp
   8B9A 21 F9 FF      [10] 4505 	ld	hl,#-7
   8B9D 39            [11] 4506 	add	hl,sp
   8B9E F9            [ 6] 4507 	ld	sp,hl
                           4508 ;src/main.c:951: actual = enemy;
   8B9F 01 C6 64      [10] 4509 	ld	bc,#_enemy+0
                           4510 ;src/main.c:952: while(--i){
   8BA2 DD 36 F9 02   [19] 4511 	ld	-7 (ix),#0x02
   8BA6                    4512 00101$:
   8BA6 DD 35 F9      [23] 4513 	dec	-7 (ix)
   8BA9 DD 7E F9      [19] 4514 	ld	a,-7 (ix)
   8BAC B7            [ 4] 4515 	or	a, a
   8BAD CA 83 8C      [10] 4516 	jp	Z,00104$
                           4517 ;src/main.c:953: actual->x = actual->px = spawnX[i];
   8BB0 59            [ 4] 4518 	ld	e, c
   8BB1 50            [ 4] 4519 	ld	d, b
   8BB2 13            [ 6] 4520 	inc	de
   8BB3 13            [ 6] 4521 	inc	de
   8BB4 3E 8F         [ 7] 4522 	ld	a,#<(_spawnX)
   8BB6 DD 86 F9      [19] 4523 	add	a, -7 (ix)
   8BB9 DD 77 FB      [19] 4524 	ld	-5 (ix),a
   8BBC 3E 72         [ 7] 4525 	ld	a,#>(_spawnX)
   8BBE CE 00         [ 7] 4526 	adc	a, #0x00
   8BC0 DD 77 FC      [19] 4527 	ld	-4 (ix),a
   8BC3 DD 6E FB      [19] 4528 	ld	l,-5 (ix)
   8BC6 DD 66 FC      [19] 4529 	ld	h,-4 (ix)
   8BC9 7E            [ 7] 4530 	ld	a,(hl)
   8BCA DD 77 FA      [19] 4531 	ld	-6 (ix), a
   8BCD 12            [ 7] 4532 	ld	(de),a
   8BCE DD 7E FA      [19] 4533 	ld	a,-6 (ix)
   8BD1 02            [ 7] 4534 	ld	(bc),a
                           4535 ;src/main.c:954: actual->y = actual->py = spawnY[i];
   8BD2 59            [ 4] 4536 	ld	e, c
   8BD3 50            [ 4] 4537 	ld	d, b
   8BD4 13            [ 6] 4538 	inc	de
   8BD5 21 03 00      [10] 4539 	ld	hl,#0x0003
   8BD8 09            [11] 4540 	add	hl,bc
   8BD9 DD 75 FE      [19] 4541 	ld	-2 (ix),l
   8BDC DD 74 FF      [19] 4542 	ld	-1 (ix),h
   8BDF FD 21 94 72   [14] 4543 	ld	iy,#_spawnY
   8BE3 C5            [11] 4544 	push	bc
   8BE4 DD 4E F9      [19] 4545 	ld	c,-7 (ix)
   8BE7 06 00         [ 7] 4546 	ld	b,#0x00
   8BE9 FD 09         [15] 4547 	add	iy, bc
   8BEB C1            [10] 4548 	pop	bc
   8BEC FD 7E 00      [19] 4549 	ld	a, 0 (iy)
   8BEF DD 77 FD      [19] 4550 	ld	-3 (ix),a
   8BF2 DD 6E FE      [19] 4551 	ld	l,-2 (ix)
   8BF5 DD 66 FF      [19] 4552 	ld	h,-1 (ix)
   8BF8 DD 7E FD      [19] 4553 	ld	a,-3 (ix)
   8BFB 77            [ 7] 4554 	ld	(hl),a
   8BFC DD 7E FD      [19] 4555 	ld	a,-3 (ix)
   8BFF 12            [ 7] 4556 	ld	(de),a
                           4557 ;src/main.c:955: actual->mover  = NO;
   8C00 21 06 00      [10] 4558 	ld	hl,#0x0006
   8C03 09            [11] 4559 	add	hl,bc
   8C04 36 00         [10] 4560 	ld	(hl),#0x00
                           4561 ;src/main.c:956: actual->mira   = M_abajo;
   8C06 21 07 00      [10] 4562 	ld	hl,#0x0007
   8C09 09            [11] 4563 	add	hl,bc
   8C0A 36 03         [10] 4564 	ld	(hl),#0x03
                           4565 ;src/main.c:957: actual->sprite = g_enemy;
   8C0C 21 04 00      [10] 4566 	ld	hl,#0x0004
   8C0F 09            [11] 4567 	add	hl,bc
   8C10 36 72         [10] 4568 	ld	(hl),#<(_g_enemy)
   8C12 23            [ 6] 4569 	inc	hl
   8C13 36 48         [10] 4570 	ld	(hl),#>(_g_enemy)
                           4571 ;src/main.c:958: actual->muerto = NO;
   8C15 21 08 00      [10] 4572 	ld	hl,#0x0008
   8C18 09            [11] 4573 	add	hl,bc
   8C19 36 00         [10] 4574 	ld	(hl),#0x00
                           4575 ;src/main.c:959: actual->muertes = 0;
   8C1B 21 0A 00      [10] 4576 	ld	hl,#0x000A
   8C1E 09            [11] 4577 	add	hl,bc
   8C1F 36 00         [10] 4578 	ld	(hl),#0x00
                           4579 ;src/main.c:960: actual->patrolling = SI;
   8C21 21 0B 00      [10] 4580 	ld	hl,#0x000B
   8C24 09            [11] 4581 	add	hl,bc
   8C25 36 01         [10] 4582 	ld	(hl),#0x01
                           4583 ;src/main.c:961: actual->onPathPatrol = SI;
   8C27 21 0C 00      [10] 4584 	ld	hl,#0x000C
   8C2A 09            [11] 4585 	add	hl,bc
   8C2B 36 01         [10] 4586 	ld	(hl),#0x01
                           4587 ;src/main.c:962: actual->reversePatrol = NO;
   8C2D 21 0D 00      [10] 4588 	ld	hl,#0x000D
   8C30 09            [11] 4589 	add	hl,bc
   8C31 36 00         [10] 4590 	ld	(hl),#0x00
                           4591 ;src/main.c:963: actual->iter = 0;
   8C33 21 0F 00      [10] 4592 	ld	hl,#0x000F
   8C36 09            [11] 4593 	add	hl,bc
   8C37 36 00         [10] 4594 	ld	(hl),#0x00
                           4595 ;src/main.c:964: actual->lastIter = 0;
   8C39 21 10 00      [10] 4596 	ld	hl,#0x0010
   8C3C 09            [11] 4597 	add	hl,bc
   8C3D 36 00         [10] 4598 	ld	(hl),#0x00
                           4599 ;src/main.c:965: actual->seen = 0;
   8C3F 21 12 00      [10] 4600 	ld	hl,#0x0012
   8C42 09            [11] 4601 	add	hl,bc
   8C43 36 00         [10] 4602 	ld	(hl),#0x00
                           4603 ;src/main.c:966: actual->found = 0;
   8C45 21 13 00      [10] 4604 	ld	hl,#0x0013
   8C48 09            [11] 4605 	add	hl,bc
   8C49 36 00         [10] 4606 	ld	(hl),#0x00
                           4607 ;src/main.c:967: pathFinding(actual->x, actual->y, spawnX[i] - 20, spawnY[i], actual, mapa); // calculo rutas de patrulla
   8C4B FD 5E 00      [19] 4608 	ld	e, 0 (iy)
   8C4E DD 6E FB      [19] 4609 	ld	l,-5 (ix)
   8C51 DD 66 FC      [19] 4610 	ld	h,-4 (ix)
   8C54 7E            [ 7] 4611 	ld	a,(hl)
   8C55 C6 EC         [ 7] 4612 	add	a,#0xEC
   8C57 57            [ 4] 4613 	ld	d,a
   8C58 C5            [11] 4614 	push	bc
   8C59 2A E9 69      [16] 4615 	ld	hl,(_mapa)
   8C5C E5            [11] 4616 	push	hl
   8C5D C5            [11] 4617 	push	bc
   8C5E 7B            [ 4] 4618 	ld	a,e
   8C5F F5            [11] 4619 	push	af
   8C60 33            [ 6] 4620 	inc	sp
   8C61 D5            [11] 4621 	push	de
   8C62 33            [ 6] 4622 	inc	sp
   8C63 DD 66 FD      [19] 4623 	ld	h,-3 (ix)
   8C66 DD 6E FA      [19] 4624 	ld	l,-6 (ix)
   8C69 E5            [11] 4625 	push	hl
   8C6A CD B2 54      [17] 4626 	call	_pathFinding
   8C6D 21 08 00      [10] 4627 	ld	hl,#8
   8C70 39            [11] 4628 	add	hl,sp
   8C71 F9            [ 6] 4629 	ld	sp,hl
   8C72 C1            [10] 4630 	pop	bc
                           4631 ;src/main.c:990: dibujarEnemigo(actual);
   8C73 C5            [11] 4632 	push	bc
   8C74 C5            [11] 4633 	push	bc
   8C75 CD 14 75      [17] 4634 	call	_dibujarEnemigo
   8C78 F1            [10] 4635 	pop	af
   8C79 C1            [10] 4636 	pop	bc
                           4637 ;src/main.c:992: ++actual;
   8C7A 21 44 01      [10] 4638 	ld	hl,#0x0144
   8C7D 09            [11] 4639 	add	hl,bc
   8C7E 4D            [ 4] 4640 	ld	c,l
   8C7F 44            [ 4] 4641 	ld	b,h
   8C80 C3 A6 8B      [10] 4642 	jp	00101$
   8C83                    4643 00104$:
   8C83 DD F9         [10] 4644 	ld	sp, ix
   8C85 DD E1         [14] 4645 	pop	ix
   8C87 C9            [10] 4646 	ret
                           4647 ;src/main.c:996: void inicializarJuego() {
                           4648 ;	---------------------------------
                           4649 ; Function inicializarJuego
                           4650 ; ---------------------------------
   8C88                    4651 _inicializarJuego::
                           4652 ;src/main.c:998: iter = 0;
   8C88 21 E8 69      [10] 4653 	ld	hl,#_iter + 0
   8C8B 36 00         [10] 4654 	ld	(hl), #0x00
                           4655 ;src/main.c:999: num_mapa = 0;
   8C8D 21 EB 69      [10] 4656 	ld	hl,#_num_mapa + 0
   8C90 36 00         [10] 4657 	ld	(hl), #0x00
                           4658 ;src/main.c:1000: mapa = mapas[num_mapa];
   8C92 21 89 72      [10] 4659 	ld	hl, #_mapas + 0
   8C95 7E            [ 7] 4660 	ld	a,(hl)
   8C96 FD 21 E9 69   [14] 4661 	ld	iy,#_mapa
   8C9A FD 77 00      [19] 4662 	ld	0 (iy),a
   8C9D 23            [ 6] 4663 	inc	hl
   8C9E 7E            [ 7] 4664 	ld	a,(hl)
   8C9F 32 EA 69      [13] 4665 	ld	(#_mapa + 1),a
                           4666 ;src/main.c:1001: cpct_etm_setTileset2x4(g_tileset);
   8CA2 21 E0 24      [10] 4667 	ld	hl,#_g_tileset
   8CA5 CD F1 59      [17] 4668 	call	_cpct_etm_setTileset2x4
                           4669 ;src/main.c:1003: dibujarMapa();
   8CA8 CD 73 72      [17] 4670 	call	_dibujarMapa
                           4671 ;src/main.c:1005: borrarPantallaArriba(0, 0, 40, 1);
   8CAB 21 28 01      [10] 4672 	ld	hl,#0x0128
   8CAE E5            [11] 4673 	push	hl
   8CAF 21 00 00      [10] 4674 	ld	hl,#0x0000
   8CB2 E5            [11] 4675 	push	hl
   8CB3 CD 40 8A      [17] 4676 	call	_borrarPantallaArriba
   8CB6 F1            [10] 4677 	pop	af
   8CB7 F1            [10] 4678 	pop	af
                           4679 ;src/main.c:1006: barraPuntuacionInicial();
   8CB8 CD 7E 89      [17] 4680 	call	_barraPuntuacionInicial
                           4681 ;src/main.c:1009: prota.x = prota.px = 5;
   8CBB 21 D8 69      [10] 4682 	ld	hl,#(_prota + 0x0002)
   8CBE 36 05         [10] 4683 	ld	(hl),#0x05
   8CC0 21 D6 69      [10] 4684 	ld	hl,#_prota
   8CC3 36 05         [10] 4685 	ld	(hl),#0x05
                           4686 ;src/main.c:1010: prota.y = prota.py = 76 + ORIGEN_MAPA_Y;
   8CC5 21 D9 69      [10] 4687 	ld	hl,#(_prota + 0x0003)
   8CC8 36 64         [10] 4688 	ld	(hl),#0x64
   8CCA 21 D7 69      [10] 4689 	ld	hl,#(_prota + 0x0001)
   8CCD 36 64         [10] 4690 	ld	(hl),#0x64
                           4691 ;src/main.c:1011: prota.mover  = NO;
   8CCF 21 DC 69      [10] 4692 	ld	hl,#(_prota + 0x0006)
   8CD2 36 00         [10] 4693 	ld	(hl),#0x00
                           4694 ;src/main.c:1012: prota.mira=M_derecha;
   8CD4 21 DD 69      [10] 4695 	ld	hl,#(_prota + 0x0007)
   8CD7 36 00         [10] 4696 	ld	(hl),#0x00
                           4697 ;src/main.c:1013: prota.sprite = g_hero;
   8CD9 21 A8 4A      [10] 4698 	ld	hl,#_g_hero
   8CDC 22 DA 69      [16] 4699 	ld	((_prota + 0x0004)), hl
                           4700 ;src/main.c:1017: cu.x = cu.px = 0;
   8CDF 21 E0 69      [10] 4701 	ld	hl,#(_cu + 0x0002)
   8CE2 36 00         [10] 4702 	ld	(hl),#0x00
   8CE4 21 DE 69      [10] 4703 	ld	hl,#_cu
   8CE7 36 00         [10] 4704 	ld	(hl),#0x00
                           4705 ;src/main.c:1018: cu.y = cu.py = 0;
   8CE9 21 E1 69      [10] 4706 	ld	hl,#(_cu + 0x0003)
   8CEC 36 00         [10] 4707 	ld	(hl),#0x00
   8CEE 21 DF 69      [10] 4708 	ld	hl,#(_cu + 0x0001)
   8CF1 36 00         [10] 4709 	ld	(hl),#0x00
                           4710 ;src/main.c:1019: cu.lanzado = NO;
   8CF3 21 E4 69      [10] 4711 	ld	hl,#(_cu + 0x0006)
   8CF6 36 00         [10] 4712 	ld	(hl),#0x00
                           4713 ;src/main.c:1020: cu.mover = NO;
   8CF8 21 E7 69      [10] 4714 	ld	hl,#(_cu + 0x0009)
   8CFB 36 00         [10] 4715 	ld	(hl),#0x00
                           4716 ;src/main.c:1022: inicializarEnemy();
   8CFD CD 92 8B      [17] 4717 	call	_inicializarEnemy
                           4718 ;src/main.c:1024: dibujarProta();
   8D00 C3 99 72      [10] 4719 	jp  _dibujarProta
                           4720 ;src/main.c:1027: void main(void) {
                           4721 ;	---------------------------------
                           4722 ; Function main
                           4723 ; ---------------------------------
   8D03                    4724 _main::
   8D03 DD E5         [15] 4725 	push	ix
   8D05 DD 21 00 00   [14] 4726 	ld	ix,#0
   8D09 DD 39         [15] 4727 	add	ix,sp
   8D0B 3B            [ 6] 4728 	dec	sp
                           4729 ;src/main.c:1032: inicializarCPC();
   8D0C CD 6F 8B      [17] 4730 	call	_inicializarCPC
                           4731 ;src/main.c:1033: menuInicio();
   8D0F CD 93 8A      [17] 4732 	call	_menuInicio
                           4733 ;src/main.c:1035: inicializarJuego();
   8D12 CD 88 8C      [17] 4734 	call	_inicializarJuego
                           4735 ;src/main.c:1036: cpct_akp_musicPlay();
   8D15 CD 58 5B      [17] 4736 	call	_cpct_akp_musicPlay
                           4737 ;src/main.c:1038: while (1) {
   8D18                    4738 00119$:
                           4739 ;src/main.c:1041: i = 1 + 1;
   8D18 DD 36 FF 02   [19] 4740 	ld	-1 (ix),#0x02
                           4741 ;src/main.c:1044: comprobarTeclado();
   8D1C CD 76 88      [17] 4742 	call	_comprobarTeclado
                           4743 ;src/main.c:1045: moverCuchillo();
   8D1F CD D9 88      [17] 4744 	call	_moverCuchillo
                           4745 ;src/main.c:1046: updateEnemies();
   8D22 CD 6F 84      [17] 4746 	call	_updateEnemies
                           4747 ;src/main.c:1061: actual = enemy;
                           4748 ;src/main.c:1063: cpct_waitVSYNC();
   8D25 CD 22 5B      [17] 4749 	call	_cpct_waitVSYNC
                           4750 ;src/main.c:1065: if (prota.mover) {
   8D28 01 DC 69      [10] 4751 	ld	bc,#_prota+6
   8D2B 0A            [ 7] 4752 	ld	a,(bc)
   8D2C B7            [ 4] 4753 	or	a, a
   8D2D 28 07         [12] 4754 	jr	Z,00102$
                           4755 ;src/main.c:1066: redibujarProta();
   8D2F C5            [11] 4756 	push	bc
   8D30 CD 6A 73      [17] 4757 	call	_redibujarProta
   8D33 C1            [10] 4758 	pop	bc
                           4759 ;src/main.c:1067: prota.mover = NO;
   8D34 AF            [ 4] 4760 	xor	a, a
   8D35 02            [ 7] 4761 	ld	(bc),a
   8D36                    4762 00102$:
                           4763 ;src/main.c:1069: if(cu.lanzado && cu.mover){
   8D36 21 E4 69      [10] 4764 	ld	hl,#_cu + 6
   8D39 4E            [ 7] 4765 	ld	c,(hl)
   8D3A 11 E7 69      [10] 4766 	ld	de,#_cu + 9
   8D3D 79            [ 4] 4767 	ld	a,c
   8D3E B7            [ 4] 4768 	or	a, a
   8D3F 28 09         [12] 4769 	jr	Z,00107$
   8D41 1A            [ 7] 4770 	ld	a,(de)
   8D42 B7            [ 4] 4771 	or	a, a
   8D43 28 05         [12] 4772 	jr	Z,00107$
                           4773 ;src/main.c:1070: redibujarCuchillo();
   8D45 CD 46 87      [17] 4774 	call	_redibujarCuchillo
   8D48 18 0B         [12] 4775 	jr	00132$
   8D4A                    4776 00107$:
                           4777 ;src/main.c:1071: }else if (cu.lanzado && !cu.mover){
   8D4A 79            [ 4] 4778 	ld	a,c
   8D4B B7            [ 4] 4779 	or	a, a
   8D4C 28 07         [12] 4780 	jr	Z,00132$
   8D4E 1A            [ 7] 4781 	ld	a,(de)
   8D4F B7            [ 4] 4782 	or	a, a
   8D50 20 03         [12] 4783 	jr	NZ,00132$
                           4784 ;src/main.c:1072: borrarCuchillo();
   8D52 CD C8 86      [17] 4785 	call	_borrarCuchillo
                           4786 ;src/main.c:1075: while(--i){
   8D55                    4787 00132$:
   8D55 01 C6 64      [10] 4788 	ld	bc,#_enemy
   8D58                    4789 00115$:
   8D58 DD 35 FF      [23] 4790 	dec	-1 (ix)
   8D5B DD 7E FF      [19] 4791 	ld	a, -1 (ix)
   8D5E B7            [ 4] 4792 	or	a, a
   8D5F 28 43         [12] 4793 	jr	Z,00117$
                           4794 ;src/main.c:1076: if(actual->mover){
   8D61 C5            [11] 4795 	push	bc
   8D62 FD E1         [14] 4796 	pop	iy
   8D64 FD 7E 06      [19] 4797 	ld	a,6 (iy)
   8D67 B7            [ 4] 4798 	or	a, a
   8D68 28 07         [12] 4799 	jr	Z,00111$
                           4800 ;src/main.c:1077: redibujarEnemigo(actual);
   8D6A C5            [11] 4801 	push	bc
   8D6B C5            [11] 4802 	push	bc
   8D6C CD 88 76      [17] 4803 	call	_redibujarEnemigo
   8D6F F1            [10] 4804 	pop	af
   8D70 C1            [10] 4805 	pop	bc
   8D71                    4806 00111$:
                           4807 ;src/main.c:1079: if (actual->muerto && actual->muertes == 0){
   8D71 C5            [11] 4808 	push	bc
   8D72 FD E1         [14] 4809 	pop	iy
   8D74 FD 7E 08      [19] 4810 	ld	a,8 (iy)
   8D77 B7            [ 4] 4811 	or	a, a
   8D78 28 22         [12] 4812 	jr	Z,00113$
   8D7A 21 0A 00      [10] 4813 	ld	hl,#0x000A
   8D7D 09            [11] 4814 	add	hl,bc
   8D7E 7E            [ 7] 4815 	ld	a,(hl)
   8D7F B7            [ 4] 4816 	or	a, a
   8D80 20 1A         [12] 4817 	jr	NZ,00113$
                           4818 ;src/main.c:1080: borrarEnemigo(actual);
   8D82 E5            [11] 4819 	push	hl
   8D83 C5            [11] 4820 	push	bc
   8D84 C5            [11] 4821 	push	bc
   8D85 CD F4 75      [17] 4822 	call	_borrarEnemigo
   8D88 F1            [10] 4823 	pop	af
   8D89 C1            [10] 4824 	pop	bc
   8D8A C5            [11] 4825 	push	bc
   8D8B C5            [11] 4826 	push	bc
   8D8C CD 4C 75      [17] 4827 	call	_dibujarExplosion
   8D8F F1            [10] 4828 	pop	af
   8D90 C1            [10] 4829 	pop	bc
   8D91 E1            [10] 4830 	pop	hl
                           4831 ;src/main.c:1083: actual->muertes++;
   8D92 5E            [ 7] 4832 	ld	e,(hl)
   8D93 1C            [ 4] 4833 	inc	e
   8D94 73            [ 7] 4834 	ld	(hl),e
                           4835 ;src/main.c:1084: actual->x = 0;
   8D95 AF            [ 4] 4836 	xor	a, a
   8D96 02            [ 7] 4837 	ld	(bc),a
                           4838 ;src/main.c:1085: actual->y = 0;
   8D97 59            [ 4] 4839 	ld	e, c
   8D98 50            [ 4] 4840 	ld	d, b
   8D99 13            [ 6] 4841 	inc	de
   8D9A AF            [ 4] 4842 	xor	a, a
   8D9B 12            [ 7] 4843 	ld	(de),a
   8D9C                    4844 00113$:
                           4845 ;src/main.c:1087: ++actual;
   8D9C 21 44 01      [10] 4846 	ld	hl,#0x0144
   8D9F 09            [11] 4847 	add	hl,bc
   8DA0 4D            [ 4] 4848 	ld	c,l
   8DA1 44            [ 4] 4849 	ld	b,h
   8DA2 18 B4         [12] 4850 	jr	00115$
   8DA4                    4851 00117$:
                           4852 ;src/main.c:1090: cpct_waitVSYNC();
   8DA4 CD 22 5B      [17] 4853 	call	_cpct_waitVSYNC
   8DA7 C3 18 8D      [10] 4854 	jp	00119$
   8DAA 33            [ 6] 4855 	inc	sp
   8DAB DD E1         [14] 4856 	pop	ix
   8DAD C9            [10] 4857 	ret
                           4858 	.area _CODE
                           4859 	.area _INITIALIZER
                           4860 	.area _CABS (ABS)
   0F00                    4861 	.org 0x0F00
   0F00                    4862 _G_song:
   0F00 41                 4863 	.db #0x41	; 65	'A'
   0F01 54                 4864 	.db #0x54	; 84	'T'
   0F02 31                 4865 	.db #0x31	; 49	'1'
   0F03 30                 4866 	.db #0x30	; 48	'0'
   0F04 01                 4867 	.db #0x01	; 1
   0F05 40                 4868 	.db #0x40	; 64
   0F06 42                 4869 	.db #0x42	; 66	'B'
   0F07 0F                 4870 	.db #0x0F	; 15
   0F08 02                 4871 	.db #0x02	; 2
   0F09 06                 4872 	.db #0x06	; 6
   0F0A 1D                 4873 	.db #0x1D	; 29
   0F0B 00                 4874 	.db #0x00	; 0
   0F0C 10                 4875 	.db #0x10	; 16
   0F0D 40                 4876 	.db #0x40	; 64
   0F0E 19                 4877 	.db #0x19	; 25
   0F0F 40                 4878 	.db #0x40	; 64
   0F10 00                 4879 	.db #0x00	; 0
   0F11 00                 4880 	.db #0x00	; 0
   0F12 00                 4881 	.db #0x00	; 0
   0F13 00                 4882 	.db #0x00	; 0
   0F14 00                 4883 	.db #0x00	; 0
   0F15 00                 4884 	.db #0x00	; 0
   0F16 0D                 4885 	.db #0x0D	; 13
   0F17 12                 4886 	.db #0x12	; 18
   0F18 40                 4887 	.db #0x40	; 64
   0F19 01                 4888 	.db #0x01	; 1
   0F1A 00                 4889 	.db #0x00	; 0
   0F1B 7C                 4890 	.db #0x7C	; 124
   0F1C 18                 4891 	.db #0x18	; 24
   0F1D 78                 4892 	.db #0x78	; 120	'x'
   0F1E 0C                 4893 	.db #0x0C	; 12
   0F1F 34                 4894 	.db #0x34	; 52	'4'
   0F20 30                 4895 	.db #0x30	; 48	'0'
   0F21 2C                 4896 	.db #0x2C	; 44
   0F22 28                 4897 	.db #0x28	; 40
   0F23 24                 4898 	.db #0x24	; 36
   0F24 20                 4899 	.db #0x20	; 32
   0F25 1C                 4900 	.db #0x1C	; 28
   0F26 0D                 4901 	.db #0x0D	; 13
   0F27 25                 4902 	.db #0x25	; 37
   0F28 40                 4903 	.db #0x40	; 64
   0F29 20                 4904 	.db #0x20	; 32
   0F2A 00                 4905 	.db #0x00	; 0
   0F2B 00                 4906 	.db #0x00	; 0
   0F2C 00                 4907 	.db #0x00	; 0
   0F2D 39                 4908 	.db #0x39	; 57	'9'
   0F2E 40                 4909 	.db #0x40	; 64
   0F2F 00                 4910 	.db #0x00	; 0
   0F30 57                 4911 	.db #0x57	; 87	'W'
   0F31 40                 4912 	.db #0x40	; 64
   0F32 3B                 4913 	.db #0x3B	; 59
   0F33 40                 4914 	.db #0x40	; 64
   0F34 57                 4915 	.db #0x57	; 87	'W'
   0F35 40                 4916 	.db #0x40	; 64
   0F36 01                 4917 	.db #0x01	; 1
   0F37 2F                 4918 	.db #0x2F	; 47
   0F38 40                 4919 	.db #0x40	; 64
   0F39 19                 4920 	.db #0x19	; 25
   0F3A 00                 4921 	.db #0x00	; 0
   0F3B 76                 4922 	.db #0x76	; 118	'v'
   0F3C E1                 4923 	.db #0xE1	; 225
   0F3D 00                 4924 	.db #0x00	; 0
   0F3E 00                 4925 	.db #0x00	; 0
   0F3F 01                 4926 	.db #0x01	; 1
   0F40 04                 4927 	.db #0x04	; 4
   0F41 51                 4928 	.db #0x51	; 81	'Q'
   0F42 04                 4929 	.db #0x04	; 4
   0F43 37                 4930 	.db #0x37	; 55	'7'
   0F44 04                 4931 	.db #0x04	; 4
   0F45 4F                 4932 	.db #0x4F	; 79	'O'
   0F46 04                 4933 	.db #0x04	; 4
   0F47 37                 4934 	.db #0x37	; 55	'7'
   0F48 02                 4935 	.db #0x02	; 2
   0F49 4B                 4936 	.db #0x4B	; 75	'K'
   0F4A 02                 4937 	.db #0x02	; 2
   0F4B 37                 4938 	.db #0x37	; 55	'7'
   0F4C 04                 4939 	.db #0x04	; 4
   0F4D 4F                 4940 	.db #0x4F	; 79	'O'
   0F4E 04                 4941 	.db #0x04	; 4
   0F4F 37                 4942 	.db #0x37	; 55	'7'
   0F50 04                 4943 	.db #0x04	; 4
   0F51 4F                 4944 	.db #0x4F	; 79	'O'
   0F52 04                 4945 	.db #0x04	; 4
   0F53 37                 4946 	.db #0x37	; 55	'7'
   0F54 02                 4947 	.db #0x02	; 2
   0F55 4B                 4948 	.db #0x4B	; 75	'K'
   0F56 00                 4949 	.db #0x00	; 0
   0F57 42                 4950 	.db #0x42	; 66	'B'
   0F58 60                 4951 	.db #0x60	; 96
   0F59 00                 4952 	.db #0x00	; 0
   0F5A 42                 4953 	.db #0x42	; 66	'B'
   0F5B 80                 4954 	.db #0x80	; 128
   0F5C 00                 4955 	.db #0x00	; 0
   0F5D 00                 4956 	.db #0x00	; 0
   0F5E 42                 4957 	.db #0x42	; 66	'B'
   0F5F 00                 4958 	.db #0x00	; 0
   0F60 00                 4959 	.db #0x00	; 0
