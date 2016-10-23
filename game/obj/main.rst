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
                             32 	.globl _patrol
                             33 	.globl _lookFor
                             34 	.globl _moverEnemigo
                             35 	.globl _moverEnemigoPathfinding
                             36 	.globl _moverEnemigoIzquierda
                             37 	.globl _moverEnemigoDerecha
                             38 	.globl _moverEnemigoAbajo
                             39 	.globl _moverEnemigoArriba
                             40 	.globl _checkEnemyCollision
                             41 	.globl _redibujarEnemigo
                             42 	.globl _borrarEnemigo
                             43 	.globl _borrarExplosion
                             44 	.globl _dibujarExplosion
                             45 	.globl _dibujarEnemigo
                             46 	.globl _checkCollision
                             47 	.globl _getTilePtr
                             48 	.globl _redibujarProta
                             49 	.globl _menuFin
                             50 	.globl _borrarProta
                             51 	.globl _dibujarProta
                             52 	.globl _dibujarMapa
                             53 	.globl _pathFinding
                             54 	.globl _abs
                             55 	.globl _cpct_etm_setTileset2x4
                             56 	.globl _cpct_etm_drawTileBox2x4
                             57 	.globl _cpct_akp_musicPlay
                             58 	.globl _cpct_akp_musicInit
                             59 	.globl _cpct_getScreenPtr
                             60 	.globl _cpct_setPALColour
                             61 	.globl _cpct_setPalette
                             62 	.globl _cpct_waitVSYNC
                             63 	.globl _cpct_setVideoMode
                             64 	.globl _cpct_drawStringM0
                             65 	.globl _cpct_drawSpriteMaskedAlignedTable
                             66 	.globl _cpct_drawSolidBox
                             67 	.globl _cpct_drawSprite
                             68 	.globl _cpct_isAnyKeyPressed
                             69 	.globl _cpct_isKeyPressed
                             70 	.globl _cpct_scanKeyboard_if
                             71 	.globl _cpct_scanKeyboard_f
                             72 	.globl _cpct_memset
                             73 	.globl _cpct_disableFirmware
                             74 	.globl _num_mapa
                             75 	.globl _mapa
                             76 	.globl _iter
                             77 	.globl _cu
                             78 	.globl _prota
                             79 	.globl _enemy
                             80 	.globl _EEje
                             81 	.globl _EMirar
                             82 	.globl _spawnY
                             83 	.globl _spawnX
                             84 	.globl _mapas
                             85 ;--------------------------------------------------------
                             86 ; special function registers
                             87 ;--------------------------------------------------------
                             88 ;--------------------------------------------------------
                             89 ; ram data
                             90 ;--------------------------------------------------------
                             91 	.area _DATA
   64BD                      92 _EMirar::
   64BD                      93 	.ds 1
   64BE                      94 _EEje::
   64BE                      95 	.ds 1
   64BF                      96 _enemy::
   64BF                      97 	.ds 1292
   69CB                      98 _prota::
   69CB                      99 	.ds 8
   69D3                     100 _cu::
   69D3                     101 	.ds 10
   69DD                     102 _iter::
   69DD                     103 	.ds 1
   69DE                     104 _mapa::
   69DE                     105 	.ds 2
   69E0                     106 _num_mapa::
   69E0                     107 	.ds 1
                            108 ;--------------------------------------------------------
                            109 ; ram data
                            110 ;--------------------------------------------------------
                            111 	.area _INITIALIZED
                            112 ;--------------------------------------------------------
                            113 ; absolute external ram data
                            114 ;--------------------------------------------------------
                            115 	.area _DABS (ABS)
                            116 ;--------------------------------------------------------
                            117 ; global & static initialisations
                            118 ;--------------------------------------------------------
                            119 	.area _HOME
                            120 	.area _GSINIT
                            121 	.area _GSFINAL
                            122 	.area _GSINIT
                            123 ;--------------------------------------------------------
                            124 ; Home
                            125 ;--------------------------------------------------------
                            126 	.area _HOME
                            127 	.area _HOME
                            128 ;--------------------------------------------------------
                            129 ; code
                            130 ;--------------------------------------------------------
                            131 	.area _CODE
                            132 ;src/main.c:109: cpctm_createTransparentMaskTable(g_tablatrans, 0x0E00, M0, 0); // es el color 8 - 4D - FF00FF
                            133 ;	---------------------------------
                            134 ; Function dummy_cpct_transparentMaskTable0M0_container
                            135 ; ---------------------------------
   4B92                     136 _dummy_cpct_transparentMaskTable0M0_container::
                            137 	.area _g_tablatrans_ (ABS) 
   0E00                     138 	.org 0x0E00 
   0E00                     139 	 _g_tablatrans::
   0E00 FF AA 55 00 AA AA   140 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0E08 55 00 55 00 00 00   141 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E10 AA AA 00 00 AA AA   142 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0E18 00 00 00 00 00 00   143 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E20 55 00 55 00 00 00   144 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E28 55 00 55 00 00 00   145 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E30 00 00 00 00 00 00   146 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E38 00 00 00 00 00 00   147 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E40 AA AA 00 00 AA AA   148 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0E48 00 00 00 00 00 00   149 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E50 AA AA 00 00 AA AA   150 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0E58 00 00 00 00 00 00   151 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E60 00 00 00 00 00 00   152 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E68 00 00 00 00 00 00   153 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E70 00 00 00 00 00 00   154 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E78 00 00 00 00 00 00   155 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E80 55 00 55 00 00 00   156 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E88 55 00 55 00 00 00   157 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E90 00 00 00 00 00 00   158 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E98 00 00 00 00 00 00   159 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EA0 55 00 55 00 00 00   160 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EA8 55 00 55 00 00 00   161 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EB0 00 00 00 00 00 00   162 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EB8 00 00 00 00 00 00   163 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EC0 00 00 00 00 00 00   164 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EC8 00 00 00 00 00 00   165 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0ED0 00 00 00 00 00 00   166 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0ED8 00 00 00 00 00 00   167 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EE0 00 00 00 00 00 00   168 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EE8 00 00 00 00 00 00   169 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EF0 00 00 00 00 00 00   170 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EF8 00 00 00 00 00 00   171 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            172 	.area _CSEG (REL, CON) 
                            173 ;src/main.c:112: void dibujarMapa() {
                            174 ;	---------------------------------
                            175 ; Function dibujarMapa
                            176 ; ---------------------------------
   7268                     177 _dibujarMapa::
                            178 ;src/main.c:113: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   7268 2A DE 69      [16]  179 	ld	hl,(_mapa)
   726B E5            [11]  180 	push	hl
   726C 21 F0 C0      [10]  181 	ld	hl,#0xC0F0
   726F E5            [11]  182 	push	hl
   7270 21 2C 28      [10]  183 	ld	hl,#0x282C
   7273 E5            [11]  184 	push	hl
   7274 2E 00         [ 7]  185 	ld	l, #0x00
   7276 E5            [11]  186 	push	hl
   7277 AF            [ 4]  187 	xor	a, a
   7278 F5            [11]  188 	push	af
   7279 33            [ 6]  189 	inc	sp
   727A CD 5B 59      [17]  190 	call	_cpct_etm_drawTileBox2x4
   727D C9            [10]  191 	ret
   727E                     192 _mapas:
   727E C0 1D               193 	.dw _g_map1
   7280 E0 16               194 	.dw _g_map2
   7282 00 10               195 	.dw _g_map3
   7284                     196 _spawnX:
   7284 00                  197 	.db #0x00	; 0
   7285 3C                  198 	.db #0x3C	; 60
   7286 47                  199 	.db #0x47	; 71	'G'
   7287 14                  200 	.db #0x14	; 20
   7288 3C                  201 	.db #0x3C	; 60
   7289                     202 _spawnY:
   7289 00                  203 	.db #0x00	; 0
   728A 2C                  204 	.db #0x2C	; 44
   728B 72                  205 	.db #0x72	; 114	'r'
   728C 8A                  206 	.db #0x8A	; 138
   728D 8A                  207 	.db #0x8A	; 138
                            208 ;src/main.c:116: void dibujarProta() {
                            209 ;	---------------------------------
                            210 ; Function dibujarProta
                            211 ; ---------------------------------
   728E                     212 _dibujarProta::
                            213 ;src/main.c:117: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   728E 21 CC 69      [10]  214 	ld	hl, #_prota + 1
   7291 56            [ 7]  215 	ld	d,(hl)
   7292 21 CB 69      [10]  216 	ld	hl, #_prota + 0
   7295 46            [ 7]  217 	ld	b,(hl)
   7296 D5            [11]  218 	push	de
   7297 33            [ 6]  219 	inc	sp
   7298 C5            [11]  220 	push	bc
   7299 33            [ 6]  221 	inc	sp
   729A 21 00 C0      [10]  222 	ld	hl,#0xC000
   729D E5            [11]  223 	push	hl
   729E CD 62 64      [17]  224 	call	_cpct_getScreenPtr
   72A1 EB            [ 4]  225 	ex	de,hl
                            226 ;src/main.c:118: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   72A2 ED 4B CF 69   [20]  227 	ld	bc, (#_prota + 4)
   72A6 21 00 0E      [10]  228 	ld	hl,#_g_tablatrans
   72A9 E5            [11]  229 	push	hl
   72AA 21 07 16      [10]  230 	ld	hl,#0x1607
   72AD E5            [11]  231 	push	hl
   72AE D5            [11]  232 	push	de
   72AF C5            [11]  233 	push	bc
   72B0 CD 82 64      [17]  234 	call	_cpct_drawSpriteMaskedAlignedTable
   72B3 C9            [10]  235 	ret
                            236 ;src/main.c:121: void borrarProta() {
                            237 ;	---------------------------------
                            238 ; Function borrarProta
                            239 ; ---------------------------------
   72B4                     240 _borrarProta::
   72B4 DD E5         [15]  241 	push	ix
   72B6 DD 21 00 00   [14]  242 	ld	ix,#0
   72BA DD 39         [15]  243 	add	ix,sp
   72BC F5            [11]  244 	push	af
   72BD 3B            [ 6]  245 	dec	sp
                            246 ;src/main.c:123: u8 w = 4 + (prota.px & 1);
   72BE 21 CD 69      [10]  247 	ld	hl, #_prota + 2
   72C1 4E            [ 7]  248 	ld	c,(hl)
   72C2 79            [ 4]  249 	ld	a,c
   72C3 E6 01         [ 7]  250 	and	a, #0x01
   72C5 47            [ 4]  251 	ld	b,a
   72C6 04            [ 4]  252 	inc	b
   72C7 04            [ 4]  253 	inc	b
   72C8 04            [ 4]  254 	inc	b
   72C9 04            [ 4]  255 	inc	b
                            256 ;src/main.c:126: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   72CA 21 CE 69      [10]  257 	ld	hl, #_prota + 3
   72CD 5E            [ 7]  258 	ld	e,(hl)
   72CE CB 4B         [ 8]  259 	bit	1, e
   72D0 28 04         [12]  260 	jr	Z,00103$
   72D2 3E 01         [ 7]  261 	ld	a,#0x01
   72D4 18 02         [12]  262 	jr	00104$
   72D6                     263 00103$:
   72D6 3E 00         [ 7]  264 	ld	a,#0x00
   72D8                     265 00104$:
   72D8 C6 06         [ 7]  266 	add	a, #0x06
   72DA DD 77 FD      [19]  267 	ld	-3 (ix),a
                            268 ;src/main.c:128: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   72DD FD 2A DE 69   [20]  269 	ld	iy,(_mapa)
   72E1 16 00         [ 7]  270 	ld	d,#0x00
   72E3 7B            [ 4]  271 	ld	a,e
   72E4 C6 E8         [ 7]  272 	add	a,#0xE8
   72E6 DD 77 FE      [19]  273 	ld	-2 (ix),a
   72E9 7A            [ 4]  274 	ld	a,d
   72EA CE FF         [ 7]  275 	adc	a,#0xFF
   72EC DD 77 FF      [19]  276 	ld	-1 (ix),a
   72EF DD 6E FE      [19]  277 	ld	l,-2 (ix)
   72F2 DD 66 FF      [19]  278 	ld	h,-1 (ix)
   72F5 DD CB FF 7E   [20]  279 	bit	7, -1 (ix)
   72F9 28 04         [12]  280 	jr	Z,00105$
   72FB 21 EB FF      [10]  281 	ld	hl,#0xFFEB
   72FE 19            [11]  282 	add	hl,de
   72FF                     283 00105$:
   72FF CB 2C         [ 8]  284 	sra	h
   7301 CB 1D         [ 8]  285 	rr	l
   7303 CB 2C         [ 8]  286 	sra	h
   7305 CB 1D         [ 8]  287 	rr	l
   7307 55            [ 4]  288 	ld	d,l
   7308 CB 39         [ 8]  289 	srl	c
   730A FD E5         [15]  290 	push	iy
   730C 21 F0 C0      [10]  291 	ld	hl,#0xC0F0
   730F E5            [11]  292 	push	hl
   7310 3E 28         [ 7]  293 	ld	a,#0x28
   7312 F5            [11]  294 	push	af
   7313 33            [ 6]  295 	inc	sp
   7314 DD 7E FD      [19]  296 	ld	a,-3 (ix)
   7317 F5            [11]  297 	push	af
   7318 33            [ 6]  298 	inc	sp
   7319 C5            [11]  299 	push	bc
   731A 33            [ 6]  300 	inc	sp
   731B D5            [11]  301 	push	de
   731C 33            [ 6]  302 	inc	sp
   731D 79            [ 4]  303 	ld	a,c
   731E F5            [11]  304 	push	af
   731F 33            [ 6]  305 	inc	sp
   7320 CD 5B 59      [17]  306 	call	_cpct_etm_drawTileBox2x4
   7323 DD F9         [10]  307 	ld	sp, ix
   7325 DD E1         [14]  308 	pop	ix
   7327 C9            [10]  309 	ret
                            310 ;src/main.c:131: void menuFin(){
                            311 ;	---------------------------------
                            312 ; Function menuFin
                            313 ; ---------------------------------
   7328                     314 _menuFin::
                            315 ;src/main.c:134: cpct_clearScreen(0);
   7328 21 00 40      [10]  316 	ld	hl,#0x4000
   732B E5            [11]  317 	push	hl
   732C AF            [ 4]  318 	xor	a, a
   732D F5            [11]  319 	push	af
   732E 33            [ 6]  320 	inc	sp
   732F 26 C0         [ 7]  321 	ld	h, #0xC0
   7331 E5            [11]  322 	push	hl
   7332 CD 41 5B      [17]  323 	call	_cpct_memset
                            324 ;src/main.c:136: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   7335 21 18 5A      [10]  325 	ld	hl,#0x5A18
   7338 E5            [11]  326 	push	hl
   7339 21 00 C0      [10]  327 	ld	hl,#0xC000
   733C E5            [11]  328 	push	hl
   733D CD 62 64      [17]  329 	call	_cpct_getScreenPtr
   7340 4D            [ 4]  330 	ld	c,l
   7341 44            [ 4]  331 	ld	b,h
                            332 ;src/main.c:137: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   7342 21 02 00      [10]  333 	ld	hl,#0x0002
   7345 E5            [11]  334 	push	hl
   7346 C5            [11]  335 	push	bc
   7347 21 55 73      [10]  336 	ld	hl,#___str_0
   734A E5            [11]  337 	push	hl
   734B CD 92 58      [17]  338 	call	_cpct_drawStringM0
   734E 21 06 00      [10]  339 	ld	hl,#6
   7351 39            [11]  340 	add	hl,sp
   7352 F9            [ 6]  341 	ld	sp,hl
                            342 ;src/main.c:139: while(1){}
   7353                     343 00102$:
   7353 18 FE         [12]  344 	jr	00102$
   7355                     345 ___str_0:
   7355 47 41 4D 45 20 4F   346 	.ascii "GAME OVER"
        56 45 52
   735E 00                  347 	.db 0x00
                            348 ;src/main.c:142: void redibujarProta() {
                            349 ;	---------------------------------
                            350 ; Function redibujarProta
                            351 ; ---------------------------------
   735F                     352 _redibujarProta::
                            353 ;src/main.c:143: borrarProta();
   735F CD B4 72      [17]  354 	call	_borrarProta
                            355 ;src/main.c:144: prota.px = prota.x;
   7362 01 CD 69      [10]  356 	ld	bc,#_prota + 2
   7365 3A CB 69      [13]  357 	ld	a, (#_prota + 0)
   7368 02            [ 7]  358 	ld	(bc),a
                            359 ;src/main.c:145: prota.py = prota.y;
   7369 01 CE 69      [10]  360 	ld	bc,#_prota + 3
   736C 3A CC 69      [13]  361 	ld	a, (#_prota + 1)
   736F 02            [ 7]  362 	ld	(bc),a
                            363 ;src/main.c:146: dibujarProta();
   7370 C3 8E 72      [10]  364 	jp  _dibujarProta
                            365 ;src/main.c:149: u8* getTilePtr(u8 x, u8 y) {
                            366 ;	---------------------------------
                            367 ; Function getTilePtr
                            368 ; ---------------------------------
   7373                     369 _getTilePtr::
   7373 DD E5         [15]  370 	push	ix
   7375 DD 21 00 00   [14]  371 	ld	ix,#0
   7379 DD 39         [15]  372 	add	ix,sp
                            373 ;src/main.c:150: return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
   737B DD 4E 05      [19]  374 	ld	c,5 (ix)
   737E 06 00         [ 7]  375 	ld	b,#0x00
   7380 79            [ 4]  376 	ld	a,c
   7381 C6 E8         [ 7]  377 	add	a,#0xE8
   7383 5F            [ 4]  378 	ld	e,a
   7384 78            [ 4]  379 	ld	a,b
   7385 CE FF         [ 7]  380 	adc	a,#0xFF
   7387 57            [ 4]  381 	ld	d,a
   7388 6B            [ 4]  382 	ld	l, e
   7389 62            [ 4]  383 	ld	h, d
   738A CB 7A         [ 8]  384 	bit	7, d
   738C 28 04         [12]  385 	jr	Z,00103$
   738E 21 EB FF      [10]  386 	ld	hl,#0xFFEB
   7391 09            [11]  387 	add	hl,bc
   7392                     388 00103$:
   7392 CB 2C         [ 8]  389 	sra	h
   7394 CB 1D         [ 8]  390 	rr	l
   7396 CB 2C         [ 8]  391 	sra	h
   7398 CB 1D         [ 8]  392 	rr	l
   739A 4D            [ 4]  393 	ld	c, l
   739B 44            [ 4]  394 	ld	b, h
   739C 29            [11]  395 	add	hl, hl
   739D 29            [11]  396 	add	hl, hl
   739E 09            [11]  397 	add	hl, bc
   739F 29            [11]  398 	add	hl, hl
   73A0 29            [11]  399 	add	hl, hl
   73A1 29            [11]  400 	add	hl, hl
   73A2 4D            [ 4]  401 	ld	c,l
   73A3 44            [ 4]  402 	ld	b,h
   73A4 2A DE 69      [16]  403 	ld	hl,(_mapa)
   73A7 09            [11]  404 	add	hl,bc
   73A8 DD 4E 04      [19]  405 	ld	c,4 (ix)
   73AB CB 39         [ 8]  406 	srl	c
   73AD 59            [ 4]  407 	ld	e,c
   73AE 16 00         [ 7]  408 	ld	d,#0x00
   73B0 19            [11]  409 	add	hl,de
   73B1 DD E1         [14]  410 	pop	ix
   73B3 C9            [10]  411 	ret
                            412 ;src/main.c:153: u8 checkCollision(int direction) { // check optimization
                            413 ;	---------------------------------
                            414 ; Function checkCollision
                            415 ; ---------------------------------
   73B4                     416 _checkCollision::
   73B4 DD E5         [15]  417 	push	ix
   73B6 DD 21 00 00   [14]  418 	ld	ix,#0
   73BA DD 39         [15]  419 	add	ix,sp
   73BC F5            [11]  420 	push	af
                            421 ;src/main.c:154: u8 *headTile=0, *feetTile=0, *waistTile=0;
   73BD 21 00 00      [10]  422 	ld	hl,#0x0000
   73C0 E3            [19]  423 	ex	(sp), hl
   73C1 11 00 00      [10]  424 	ld	de,#0x0000
   73C4 01 00 00      [10]  425 	ld	bc,#0x0000
                            426 ;src/main.c:156: switch (direction) {
   73C7 DD CB 05 7E   [20]  427 	bit	7, 5 (ix)
   73CB C2 E8 74      [10]  428 	jp	NZ,00105$
   73CE 3E 03         [ 7]  429 	ld	a,#0x03
   73D0 DD BE 04      [19]  430 	cp	a, 4 (ix)
   73D3 3E 00         [ 7]  431 	ld	a,#0x00
   73D5 DD 9E 05      [19]  432 	sbc	a, 5 (ix)
   73D8 E2 DD 73      [10]  433 	jp	PO, 00128$
   73DB EE 80         [ 7]  434 	xor	a, #0x80
   73DD                     435 00128$:
   73DD FA E8 74      [10]  436 	jp	M,00105$
   73E0 DD 5E 04      [19]  437 	ld	e,4 (ix)
   73E3 16 00         [ 7]  438 	ld	d,#0x00
   73E5 21 EC 73      [10]  439 	ld	hl,#00129$
   73E8 19            [11]  440 	add	hl,de
   73E9 19            [11]  441 	add	hl,de
   73EA 19            [11]  442 	add	hl,de
   73EB E9            [ 4]  443 	jp	(hl)
   73EC                     444 00129$:
   73EC C3 F8 73      [10]  445 	jp	00101$
   73EF C3 43 74      [10]  446 	jp	00102$
   73F2 C3 84 74      [10]  447 	jp	00103$
   73F5 C3 B7 74      [10]  448 	jp	00104$
                            449 ;src/main.c:157: case 0:
   73F8                     450 00101$:
                            451 ;src/main.c:158: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   73F8 21 CC 69      [10]  452 	ld	hl, #(_prota + 0x0001) + 0
   73FB 5E            [ 7]  453 	ld	e,(hl)
   73FC 21 CB 69      [10]  454 	ld	hl, #_prota + 0
   73FF 4E            [ 7]  455 	ld	c,(hl)
   7400 0C            [ 4]  456 	inc	c
   7401 0C            [ 4]  457 	inc	c
   7402 0C            [ 4]  458 	inc	c
   7403 0C            [ 4]  459 	inc	c
   7404 7B            [ 4]  460 	ld	a,e
   7405 F5            [11]  461 	push	af
   7406 33            [ 6]  462 	inc	sp
   7407 79            [ 4]  463 	ld	a,c
   7408 F5            [11]  464 	push	af
   7409 33            [ 6]  465 	inc	sp
   740A CD 73 73      [17]  466 	call	_getTilePtr
   740D F1            [10]  467 	pop	af
   740E 33            [ 6]  468 	inc	sp
   740F 33            [ 6]  469 	inc	sp
   7410 E5            [11]  470 	push	hl
                            471 ;src/main.c:159: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   7411 3A CC 69      [13]  472 	ld	a, (#(_prota + 0x0001) + 0)
   7414 C6 14         [ 7]  473 	add	a, #0x14
   7416 4F            [ 4]  474 	ld	c,a
   7417 21 CB 69      [10]  475 	ld	hl, #_prota + 0
   741A 46            [ 7]  476 	ld	b,(hl)
   741B 04            [ 4]  477 	inc	b
   741C 04            [ 4]  478 	inc	b
   741D 04            [ 4]  479 	inc	b
   741E 04            [ 4]  480 	inc	b
   741F 79            [ 4]  481 	ld	a,c
   7420 F5            [11]  482 	push	af
   7421 33            [ 6]  483 	inc	sp
   7422 C5            [11]  484 	push	bc
   7423 33            [ 6]  485 	inc	sp
   7424 CD 73 73      [17]  486 	call	_getTilePtr
   7427 F1            [10]  487 	pop	af
   7428 EB            [ 4]  488 	ex	de,hl
                            489 ;src/main.c:160: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   7429 3A CC 69      [13]  490 	ld	a, (#(_prota + 0x0001) + 0)
   742C C6 0B         [ 7]  491 	add	a, #0x0B
   742E 47            [ 4]  492 	ld	b,a
   742F 3A CB 69      [13]  493 	ld	a, (#_prota + 0)
   7432 C6 04         [ 7]  494 	add	a, #0x04
   7434 D5            [11]  495 	push	de
   7435 C5            [11]  496 	push	bc
   7436 33            [ 6]  497 	inc	sp
   7437 F5            [11]  498 	push	af
   7438 33            [ 6]  499 	inc	sp
   7439 CD 73 73      [17]  500 	call	_getTilePtr
   743C F1            [10]  501 	pop	af
   743D 4D            [ 4]  502 	ld	c,l
   743E 44            [ 4]  503 	ld	b,h
   743F D1            [10]  504 	pop	de
                            505 ;src/main.c:161: break;
   7440 C3 E8 74      [10]  506 	jp	00105$
                            507 ;src/main.c:162: case 1:
   7443                     508 00102$:
                            509 ;src/main.c:163: headTile  = getTilePtr(prota.x - 1, prota.y);
   7443 21 CC 69      [10]  510 	ld	hl, #(_prota + 0x0001) + 0
   7446 56            [ 7]  511 	ld	d,(hl)
   7447 21 CB 69      [10]  512 	ld	hl, #_prota + 0
   744A 46            [ 7]  513 	ld	b,(hl)
   744B 05            [ 4]  514 	dec	b
   744C D5            [11]  515 	push	de
   744D 33            [ 6]  516 	inc	sp
   744E C5            [11]  517 	push	bc
   744F 33            [ 6]  518 	inc	sp
   7450 CD 73 73      [17]  519 	call	_getTilePtr
   7453 F1            [10]  520 	pop	af
   7454 33            [ 6]  521 	inc	sp
   7455 33            [ 6]  522 	inc	sp
   7456 E5            [11]  523 	push	hl
                            524 ;src/main.c:164: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
   7457 3A CC 69      [13]  525 	ld	a, (#(_prota + 0x0001) + 0)
   745A C6 14         [ 7]  526 	add	a, #0x14
   745C 57            [ 4]  527 	ld	d,a
   745D 21 CB 69      [10]  528 	ld	hl, #_prota + 0
   7460 46            [ 7]  529 	ld	b,(hl)
   7461 05            [ 4]  530 	dec	b
   7462 D5            [11]  531 	push	de
   7463 33            [ 6]  532 	inc	sp
   7464 C5            [11]  533 	push	bc
   7465 33            [ 6]  534 	inc	sp
   7466 CD 73 73      [17]  535 	call	_getTilePtr
   7469 F1            [10]  536 	pop	af
   746A EB            [ 4]  537 	ex	de,hl
                            538 ;src/main.c:165: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
   746B 3A CC 69      [13]  539 	ld	a, (#(_prota + 0x0001) + 0)
   746E C6 0B         [ 7]  540 	add	a, #0x0B
   7470 47            [ 4]  541 	ld	b,a
   7471 3A CB 69      [13]  542 	ld	a, (#_prota + 0)
   7474 C6 FF         [ 7]  543 	add	a,#0xFF
   7476 D5            [11]  544 	push	de
   7477 C5            [11]  545 	push	bc
   7478 33            [ 6]  546 	inc	sp
   7479 F5            [11]  547 	push	af
   747A 33            [ 6]  548 	inc	sp
   747B CD 73 73      [17]  549 	call	_getTilePtr
   747E F1            [10]  550 	pop	af
   747F 4D            [ 4]  551 	ld	c,l
   7480 44            [ 4]  552 	ld	b,h
   7481 D1            [10]  553 	pop	de
                            554 ;src/main.c:166: break;
   7482 18 64         [12]  555 	jr	00105$
                            556 ;src/main.c:167: case 2:
   7484                     557 00103$:
                            558 ;src/main.c:168: headTile   = getTilePtr(prota.x, prota.y - 2);
   7484 3A CC 69      [13]  559 	ld	a, (#(_prota + 0x0001) + 0)
   7487 C6 FE         [ 7]  560 	add	a,#0xFE
   7489 21 CB 69      [10]  561 	ld	hl, #_prota + 0
   748C 56            [ 7]  562 	ld	d,(hl)
   748D C5            [11]  563 	push	bc
   748E F5            [11]  564 	push	af
   748F 33            [ 6]  565 	inc	sp
   7490 D5            [11]  566 	push	de
   7491 33            [ 6]  567 	inc	sp
   7492 CD 73 73      [17]  568 	call	_getTilePtr
   7495 F1            [10]  569 	pop	af
   7496 C1            [10]  570 	pop	bc
   7497 33            [ 6]  571 	inc	sp
   7498 33            [ 6]  572 	inc	sp
   7499 E5            [11]  573 	push	hl
                            574 ;src/main.c:169: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
   749A 21 CC 69      [10]  575 	ld	hl, #(_prota + 0x0001) + 0
   749D 56            [ 7]  576 	ld	d,(hl)
   749E 15            [ 4]  577 	dec	d
   749F 15            [ 4]  578 	dec	d
   74A0 3A CB 69      [13]  579 	ld	a, (#_prota + 0)
   74A3 C6 03         [ 7]  580 	add	a, #0x03
   74A5 C5            [11]  581 	push	bc
   74A6 D5            [11]  582 	push	de
   74A7 33            [ 6]  583 	inc	sp
   74A8 F5            [11]  584 	push	af
   74A9 33            [ 6]  585 	inc	sp
   74AA CD 73 73      [17]  586 	call	_getTilePtr
   74AD F1            [10]  587 	pop	af
   74AE EB            [ 4]  588 	ex	de,hl
   74AF C1            [10]  589 	pop	bc
                            590 ;src/main.c:170: *waistTile = 0;
   74B0 21 00 00      [10]  591 	ld	hl,#0x0000
   74B3 36 00         [10]  592 	ld	(hl),#0x00
                            593 ;src/main.c:171: break;
   74B5 18 31         [12]  594 	jr	00105$
                            595 ;src/main.c:172: case 3:
   74B7                     596 00104$:
                            597 ;src/main.c:173: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
   74B7 3A CC 69      [13]  598 	ld	a, (#(_prota + 0x0001) + 0)
   74BA C6 16         [ 7]  599 	add	a, #0x16
   74BC 21 CB 69      [10]  600 	ld	hl, #_prota + 0
   74BF 56            [ 7]  601 	ld	d,(hl)
   74C0 C5            [11]  602 	push	bc
   74C1 F5            [11]  603 	push	af
   74C2 33            [ 6]  604 	inc	sp
   74C3 D5            [11]  605 	push	de
   74C4 33            [ 6]  606 	inc	sp
   74C5 CD 73 73      [17]  607 	call	_getTilePtr
   74C8 F1            [10]  608 	pop	af
   74C9 C1            [10]  609 	pop	bc
   74CA 33            [ 6]  610 	inc	sp
   74CB 33            [ 6]  611 	inc	sp
   74CC E5            [11]  612 	push	hl
                            613 ;src/main.c:174: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   74CD 3A CC 69      [13]  614 	ld	a, (#(_prota + 0x0001) + 0)
   74D0 C6 16         [ 7]  615 	add	a, #0x16
   74D2 57            [ 4]  616 	ld	d,a
   74D3 3A CB 69      [13]  617 	ld	a, (#_prota + 0)
   74D6 C6 03         [ 7]  618 	add	a, #0x03
   74D8 C5            [11]  619 	push	bc
   74D9 D5            [11]  620 	push	de
   74DA 33            [ 6]  621 	inc	sp
   74DB F5            [11]  622 	push	af
   74DC 33            [ 6]  623 	inc	sp
   74DD CD 73 73      [17]  624 	call	_getTilePtr
   74E0 F1            [10]  625 	pop	af
   74E1 EB            [ 4]  626 	ex	de,hl
   74E2 C1            [10]  627 	pop	bc
                            628 ;src/main.c:175: *waistTile = 0;
   74E3 21 00 00      [10]  629 	ld	hl,#0x0000
   74E6 36 00         [10]  630 	ld	(hl),#0x00
                            631 ;src/main.c:177: }
   74E8                     632 00105$:
                            633 ;src/main.c:179: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   74E8 E1            [10]  634 	pop	hl
   74E9 E5            [11]  635 	push	hl
   74EA 6E            [ 7]  636 	ld	l,(hl)
   74EB 3E 02         [ 7]  637 	ld	a,#0x02
   74ED 95            [ 4]  638 	sub	a, l
   74EE 38 0E         [12]  639 	jr	C,00106$
   74F0 1A            [ 7]  640 	ld	a,(de)
   74F1 5F            [ 4]  641 	ld	e,a
   74F2 3E 02         [ 7]  642 	ld	a,#0x02
   74F4 93            [ 4]  643 	sub	a, e
   74F5 38 07         [12]  644 	jr	C,00106$
   74F7 0A            [ 7]  645 	ld	a,(bc)
   74F8 4F            [ 4]  646 	ld	c,a
   74F9 3E 02         [ 7]  647 	ld	a,#0x02
   74FB 91            [ 4]  648 	sub	a, c
   74FC 30 04         [12]  649 	jr	NC,00107$
   74FE                     650 00106$:
                            651 ;src/main.c:180: return 1;
   74FE 2E 01         [ 7]  652 	ld	l,#0x01
   7500 18 02         [12]  653 	jr	00110$
   7502                     654 00107$:
                            655 ;src/main.c:182: return 0;
   7502 2E 00         [ 7]  656 	ld	l,#0x00
   7504                     657 00110$:
   7504 DD F9         [10]  658 	ld	sp, ix
   7506 DD E1         [14]  659 	pop	ix
   7508 C9            [10]  660 	ret
                            661 ;src/main.c:185: void dibujarEnemigo(TEnemy *enemy) {
                            662 ;	---------------------------------
                            663 ; Function dibujarEnemigo
                            664 ; ---------------------------------
   7509                     665 _dibujarEnemigo::
   7509 DD E5         [15]  666 	push	ix
   750B DD 21 00 00   [14]  667 	ld	ix,#0
   750F DD 39         [15]  668 	add	ix,sp
                            669 ;src/main.c:186: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   7511 DD 4E 04      [19]  670 	ld	c,4 (ix)
   7514 DD 46 05      [19]  671 	ld	b,5 (ix)
   7517 69            [ 4]  672 	ld	l, c
   7518 60            [ 4]  673 	ld	h, b
   7519 23            [ 6]  674 	inc	hl
   751A 56            [ 7]  675 	ld	d,(hl)
   751B 0A            [ 7]  676 	ld	a,(bc)
   751C C5            [11]  677 	push	bc
   751D D5            [11]  678 	push	de
   751E 33            [ 6]  679 	inc	sp
   751F F5            [11]  680 	push	af
   7520 33            [ 6]  681 	inc	sp
   7521 21 00 C0      [10]  682 	ld	hl,#0xC000
   7524 E5            [11]  683 	push	hl
   7525 CD 62 64      [17]  684 	call	_cpct_getScreenPtr
   7528 EB            [ 4]  685 	ex	de,hl
                            686 ;src/main.c:187: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   7529 E1            [10]  687 	pop	hl
   752A 01 04 00      [10]  688 	ld	bc, #0x0004
   752D 09            [11]  689 	add	hl, bc
   752E 4E            [ 7]  690 	ld	c,(hl)
   752F 23            [ 6]  691 	inc	hl
   7530 46            [ 7]  692 	ld	b,(hl)
   7531 21 00 0E      [10]  693 	ld	hl,#_g_tablatrans
   7534 E5            [11]  694 	push	hl
   7535 21 04 16      [10]  695 	ld	hl,#0x1604
   7538 E5            [11]  696 	push	hl
   7539 D5            [11]  697 	push	de
   753A C5            [11]  698 	push	bc
   753B CD 82 64      [17]  699 	call	_cpct_drawSpriteMaskedAlignedTable
   753E DD E1         [14]  700 	pop	ix
   7540 C9            [10]  701 	ret
                            702 ;src/main.c:190: void dibujarExplosion(TEnemy *enemy) {
                            703 ;	---------------------------------
                            704 ; Function dibujarExplosion
                            705 ; ---------------------------------
   7541                     706 _dibujarExplosion::
   7541 DD E5         [15]  707 	push	ix
   7543 DD 21 00 00   [14]  708 	ld	ix,#0
   7547 DD 39         [15]  709 	add	ix,sp
                            710 ;src/main.c:191: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   7549 DD 4E 04      [19]  711 	ld	c,4 (ix)
   754C DD 46 05      [19]  712 	ld	b,5 (ix)
   754F 69            [ 4]  713 	ld	l, c
   7550 60            [ 4]  714 	ld	h, b
   7551 23            [ 6]  715 	inc	hl
   7552 56            [ 7]  716 	ld	d,(hl)
   7553 0A            [ 7]  717 	ld	a,(bc)
   7554 47            [ 4]  718 	ld	b,a
   7555 D5            [11]  719 	push	de
   7556 33            [ 6]  720 	inc	sp
   7557 C5            [11]  721 	push	bc
   7558 33            [ 6]  722 	inc	sp
   7559 21 00 C0      [10]  723 	ld	hl,#0xC000
   755C E5            [11]  724 	push	hl
   755D CD 62 64      [17]  725 	call	_cpct_getScreenPtr
   7560 4D            [ 4]  726 	ld	c,l
   7561 44            [ 4]  727 	ld	b,h
                            728 ;src/main.c:192: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   7562 11 00 0E      [10]  729 	ld	de,#_g_tablatrans+0
   7565 D5            [11]  730 	push	de
   7566 21 04 16      [10]  731 	ld	hl,#0x1604
   7569 E5            [11]  732 	push	hl
   756A C5            [11]  733 	push	bc
   756B 21 A8 25      [10]  734 	ld	hl,#_g_explosion
   756E E5            [11]  735 	push	hl
   756F CD 82 64      [17]  736 	call	_cpct_drawSpriteMaskedAlignedTable
   7572 DD E1         [14]  737 	pop	ix
   7574 C9            [10]  738 	ret
                            739 ;src/main.c:195: void borrarExplosion() {
                            740 ;	---------------------------------
                            741 ; Function borrarExplosion
                            742 ; ---------------------------------
   7575                     743 _borrarExplosion::
   7575 DD E5         [15]  744 	push	ix
   7577 DD 21 00 00   [14]  745 	ld	ix,#0
   757B DD 39         [15]  746 	add	ix,sp
   757D F5            [11]  747 	push	af
   757E 3B            [ 6]  748 	dec	sp
                            749 ;src/main.c:196: u8 w = 4 + (enemy->px & 1);
   757F 21 C1 64      [10]  750 	ld	hl, #_enemy + 2
   7582 4E            [ 7]  751 	ld	c,(hl)
   7583 79            [ 4]  752 	ld	a,c
   7584 E6 01         [ 7]  753 	and	a, #0x01
   7586 47            [ 4]  754 	ld	b,a
   7587 04            [ 4]  755 	inc	b
   7588 04            [ 4]  756 	inc	b
   7589 04            [ 4]  757 	inc	b
   758A 04            [ 4]  758 	inc	b
                            759 ;src/main.c:199: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   758B 21 C2 64      [10]  760 	ld	hl, #_enemy + 3
   758E 5E            [ 7]  761 	ld	e,(hl)
   758F CB 4B         [ 8]  762 	bit	1, e
   7591 28 04         [12]  763 	jr	Z,00103$
   7593 3E 01         [ 7]  764 	ld	a,#0x01
   7595 18 02         [12]  765 	jr	00104$
   7597                     766 00103$:
   7597 3E 00         [ 7]  767 	ld	a,#0x00
   7599                     768 00104$:
   7599 C6 07         [ 7]  769 	add	a, #0x07
   759B DD 77 FD      [19]  770 	ld	-3 (ix),a
                            771 ;src/main.c:201: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   759E FD 2A DE 69   [20]  772 	ld	iy,(_mapa)
   75A2 16 00         [ 7]  773 	ld	d,#0x00
   75A4 7B            [ 4]  774 	ld	a,e
   75A5 C6 E8         [ 7]  775 	add	a,#0xE8
   75A7 DD 77 FE      [19]  776 	ld	-2 (ix),a
   75AA 7A            [ 4]  777 	ld	a,d
   75AB CE FF         [ 7]  778 	adc	a,#0xFF
   75AD DD 77 FF      [19]  779 	ld	-1 (ix),a
   75B0 DD 6E FE      [19]  780 	ld	l,-2 (ix)
   75B3 DD 66 FF      [19]  781 	ld	h,-1 (ix)
   75B6 DD CB FF 7E   [20]  782 	bit	7, -1 (ix)
   75BA 28 04         [12]  783 	jr	Z,00105$
   75BC 21 EB FF      [10]  784 	ld	hl,#0xFFEB
   75BF 19            [11]  785 	add	hl,de
   75C0                     786 00105$:
   75C0 CB 2C         [ 8]  787 	sra	h
   75C2 CB 1D         [ 8]  788 	rr	l
   75C4 CB 2C         [ 8]  789 	sra	h
   75C6 CB 1D         [ 8]  790 	rr	l
   75C8 55            [ 4]  791 	ld	d,l
   75C9 CB 39         [ 8]  792 	srl	c
   75CB FD E5         [15]  793 	push	iy
   75CD 21 F0 C0      [10]  794 	ld	hl,#0xC0F0
   75D0 E5            [11]  795 	push	hl
   75D1 3E 28         [ 7]  796 	ld	a,#0x28
   75D3 F5            [11]  797 	push	af
   75D4 33            [ 6]  798 	inc	sp
   75D5 DD 7E FD      [19]  799 	ld	a,-3 (ix)
   75D8 F5            [11]  800 	push	af
   75D9 33            [ 6]  801 	inc	sp
   75DA C5            [11]  802 	push	bc
   75DB 33            [ 6]  803 	inc	sp
   75DC D5            [11]  804 	push	de
   75DD 33            [ 6]  805 	inc	sp
   75DE 79            [ 4]  806 	ld	a,c
   75DF F5            [11]  807 	push	af
   75E0 33            [ 6]  808 	inc	sp
   75E1 CD 5B 59      [17]  809 	call	_cpct_etm_drawTileBox2x4
   75E4 DD F9         [10]  810 	ld	sp, ix
   75E6 DD E1         [14]  811 	pop	ix
   75E8 C9            [10]  812 	ret
                            813 ;src/main.c:205: void borrarEnemigo(TEnemy *enemy) {
                            814 ;	---------------------------------
                            815 ; Function borrarEnemigo
                            816 ; ---------------------------------
   75E9                     817 _borrarEnemigo::
   75E9 DD E5         [15]  818 	push	ix
   75EB DD 21 00 00   [14]  819 	ld	ix,#0
   75EF DD 39         [15]  820 	add	ix,sp
   75F1 21 FA FF      [10]  821 	ld	hl,#-6
   75F4 39            [11]  822 	add	hl,sp
   75F5 F9            [ 6]  823 	ld	sp,hl
                            824 ;src/main.c:207: u8 w = 4 + (enemy->px & 1);
   75F6 DD 4E 04      [19]  825 	ld	c,4 (ix)
   75F9 DD 46 05      [19]  826 	ld	b,5 (ix)
   75FC 69            [ 4]  827 	ld	l, c
   75FD 60            [ 4]  828 	ld	h, b
   75FE 23            [ 6]  829 	inc	hl
   75FF 23            [ 6]  830 	inc	hl
   7600 5E            [ 7]  831 	ld	e,(hl)
   7601 7B            [ 4]  832 	ld	a,e
   7602 E6 01         [ 7]  833 	and	a, #0x01
   7604 C6 04         [ 7]  834 	add	a, #0x04
   7606 DD 77 FB      [19]  835 	ld	-5 (ix),a
                            836 ;src/main.c:210: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   7609 69            [ 4]  837 	ld	l, c
   760A 60            [ 4]  838 	ld	h, b
   760B 23            [ 6]  839 	inc	hl
   760C 23            [ 6]  840 	inc	hl
   760D 23            [ 6]  841 	inc	hl
   760E 56            [ 7]  842 	ld	d,(hl)
   760F CB 4A         [ 8]  843 	bit	1, d
   7611 28 04         [12]  844 	jr	Z,00103$
   7613 3E 01         [ 7]  845 	ld	a,#0x01
   7615 18 02         [12]  846 	jr	00104$
   7617                     847 00103$:
   7617 3E 00         [ 7]  848 	ld	a,#0x00
   7619                     849 00104$:
   7619 C6 07         [ 7]  850 	add	a, #0x07
   761B DD 77 FA      [19]  851 	ld	-6 (ix),a
                            852 ;src/main.c:212: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   761E FD 2A DE 69   [20]  853 	ld	iy,(_mapa)
   7622 DD 72 FE      [19]  854 	ld	-2 (ix),d
   7625 DD 36 FF 00   [19]  855 	ld	-1 (ix),#0x00
   7629 DD 7E FE      [19]  856 	ld	a,-2 (ix)
   762C C6 E8         [ 7]  857 	add	a,#0xE8
   762E DD 77 FC      [19]  858 	ld	-4 (ix),a
   7631 DD 7E FF      [19]  859 	ld	a,-1 (ix)
   7634 CE FF         [ 7]  860 	adc	a,#0xFF
   7636 DD 77 FD      [19]  861 	ld	-3 (ix),a
   7639 DD 56 FC      [19]  862 	ld	d,-4 (ix)
   763C DD 6E FD      [19]  863 	ld	l,-3 (ix)
   763F DD CB FD 7E   [20]  864 	bit	7, -3 (ix)
   7643 28 0C         [12]  865 	jr	Z,00105$
   7645 DD 7E FE      [19]  866 	ld	a,-2 (ix)
   7648 C6 EB         [ 7]  867 	add	a, #0xEB
   764A 57            [ 4]  868 	ld	d,a
   764B DD 7E FF      [19]  869 	ld	a,-1 (ix)
   764E CE FF         [ 7]  870 	adc	a, #0xFF
   7650 6F            [ 4]  871 	ld	l,a
   7651                     872 00105$:
   7651 CB 2D         [ 8]  873 	sra	l
   7653 CB 1A         [ 8]  874 	rr	d
   7655 CB 2D         [ 8]  875 	sra	l
   7657 CB 1A         [ 8]  876 	rr	d
   7659 CB 3B         [ 8]  877 	srl	e
   765B C5            [11]  878 	push	bc
   765C FD E5         [15]  879 	push	iy
   765E 21 F0 C0      [10]  880 	ld	hl,#0xC0F0
   7661 E5            [11]  881 	push	hl
   7662 3E 28         [ 7]  882 	ld	a,#0x28
   7664 F5            [11]  883 	push	af
   7665 33            [ 6]  884 	inc	sp
   7666 DD 66 FA      [19]  885 	ld	h,-6 (ix)
   7669 DD 6E FB      [19]  886 	ld	l,-5 (ix)
   766C E5            [11]  887 	push	hl
   766D D5            [11]  888 	push	de
   766E CD 5B 59      [17]  889 	call	_cpct_etm_drawTileBox2x4
   7671 C1            [10]  890 	pop	bc
                            891 ;src/main.c:214: enemy->mover = NO;
   7672 21 06 00      [10]  892 	ld	hl,#0x0006
   7675 09            [11]  893 	add	hl,bc
   7676 36 00         [10]  894 	ld	(hl),#0x00
   7678 DD F9         [10]  895 	ld	sp, ix
   767A DD E1         [14]  896 	pop	ix
   767C C9            [10]  897 	ret
                            898 ;src/main.c:217: void redibujarEnemigo(TEnemy *enemy) {
                            899 ;	---------------------------------
                            900 ; Function redibujarEnemigo
                            901 ; ---------------------------------
   767D                     902 _redibujarEnemigo::
   767D DD E5         [15]  903 	push	ix
   767F DD 21 00 00   [14]  904 	ld	ix,#0
   7683 DD 39         [15]  905 	add	ix,sp
                            906 ;src/main.c:218: borrarEnemigo(enemy);
   7685 DD 6E 04      [19]  907 	ld	l,4 (ix)
   7688 DD 66 05      [19]  908 	ld	h,5 (ix)
   768B E5            [11]  909 	push	hl
   768C CD E9 75      [17]  910 	call	_borrarEnemigo
   768F F1            [10]  911 	pop	af
                            912 ;src/main.c:219: enemy->px = enemy->x;
   7690 DD 4E 04      [19]  913 	ld	c,4 (ix)
   7693 DD 46 05      [19]  914 	ld	b,5 (ix)
   7696 59            [ 4]  915 	ld	e, c
   7697 50            [ 4]  916 	ld	d, b
   7698 13            [ 6]  917 	inc	de
   7699 13            [ 6]  918 	inc	de
   769A 0A            [ 7]  919 	ld	a,(bc)
   769B 12            [ 7]  920 	ld	(de),a
                            921 ;src/main.c:220: enemy->py = enemy->y;
   769C 59            [ 4]  922 	ld	e, c
   769D 50            [ 4]  923 	ld	d, b
   769E 13            [ 6]  924 	inc	de
   769F 13            [ 6]  925 	inc	de
   76A0 13            [ 6]  926 	inc	de
   76A1 69            [ 4]  927 	ld	l, c
   76A2 60            [ 4]  928 	ld	h, b
   76A3 23            [ 6]  929 	inc	hl
   76A4 7E            [ 7]  930 	ld	a,(hl)
   76A5 12            [ 7]  931 	ld	(de),a
                            932 ;src/main.c:221: dibujarEnemigo(enemy);
   76A6 C5            [11]  933 	push	bc
   76A7 CD 09 75      [17]  934 	call	_dibujarEnemigo
   76AA F1            [10]  935 	pop	af
   76AB DD E1         [14]  936 	pop	ix
   76AD C9            [10]  937 	ret
                            938 ;src/main.c:224: u8 checkEnemyCollision(int direction, TEnemy *enemy){
                            939 ;	---------------------------------
                            940 ; Function checkEnemyCollision
                            941 ; ---------------------------------
   76AE                     942 _checkEnemyCollision::
   76AE DD E5         [15]  943 	push	ix
   76B0 DD 21 00 00   [14]  944 	ld	ix,#0
   76B4 DD 39         [15]  945 	add	ix,sp
   76B6 21 F7 FF      [10]  946 	ld	hl,#-9
   76B9 39            [11]  947 	add	hl,sp
   76BA F9            [ 6]  948 	ld	sp,hl
                            949 ;src/main.c:226: u8 colisiona = 1;
   76BB DD 36 F7 01   [19]  950 	ld	-9 (ix),#0x01
                            951 ;src/main.c:228: switch (direction) {
   76BF DD CB 05 7E   [20]  952 	bit	7, 5 (ix)
   76C3 C2 76 7A      [10]  953 	jp	NZ,00165$
   76C6 3E 03         [ 7]  954 	ld	a,#0x03
   76C8 DD BE 04      [19]  955 	cp	a, 4 (ix)
   76CB 3E 00         [ 7]  956 	ld	a,#0x00
   76CD DD 9E 05      [19]  957 	sbc	a, 5 (ix)
   76D0 E2 D5 76      [10]  958 	jp	PO, 00272$
   76D3 EE 80         [ 7]  959 	xor	a, #0x80
   76D5                     960 00272$:
   76D5 FA 76 7A      [10]  961 	jp	M,00165$
                            962 ;src/main.c:230: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   76D8 DD 4E 06      [19]  963 	ld	c,6 (ix)
   76DB DD 46 07      [19]  964 	ld	b,7 (ix)
   76DE 0A            [ 7]  965 	ld	a,(bc)
   76DF 5F            [ 4]  966 	ld	e,a
   76E0 21 01 00      [10]  967 	ld	hl,#0x0001
   76E3 09            [11]  968 	add	hl,bc
   76E4 DD 75 F8      [19]  969 	ld	-8 (ix),l
   76E7 DD 74 F9      [19]  970 	ld	-7 (ix),h
   76EA DD 6E F8      [19]  971 	ld	l,-8 (ix)
   76ED DD 66 F9      [19]  972 	ld	h,-7 (ix)
   76F0 56            [ 7]  973 	ld	d,(hl)
                            974 ;src/main.c:243: enemy->muerto = SI;
   76F1 21 08 00      [10]  975 	ld	hl,#0x0008
   76F4 09            [11]  976 	add	hl,bc
   76F5 DD 75 FA      [19]  977 	ld	-6 (ix),l
   76F8 DD 74 FB      [19]  978 	ld	-5 (ix),h
                            979 ;src/main.c:250: enemy->mira = M_izquierda;
   76FB 21 07 00      [10]  980 	ld	hl,#0x0007
   76FE 09            [11]  981 	add	hl,bc
   76FF DD 75 FC      [19]  982 	ld	-4 (ix),l
   7702 DD 74 FD      [19]  983 	ld	-3 (ix),h
                            984 ;src/main.c:228: switch (direction) {
   7705 D5            [11]  985 	push	de
   7706 DD 5E 04      [19]  986 	ld	e,4 (ix)
   7709 16 00         [ 7]  987 	ld	d,#0x00
   770B 21 13 77      [10]  988 	ld	hl,#00273$
   770E 19            [11]  989 	add	hl,de
   770F 19            [11]  990 	add	hl,de
   7710 19            [11]  991 	add	hl,de
   7711 D1            [10]  992 	pop	de
   7712 E9            [ 4]  993 	jp	(hl)
   7713                     994 00273$:
   7713 C3 1F 77      [10]  995 	jp	00101$
   7716 C3 F8 77      [10]  996 	jp	00117$
   7719 C3 CD 78      [10]  997 	jp	00133$
   771C C3 9C 79      [10]  998 	jp	00149$
                            999 ;src/main.c:229: case 0:
   771F                    1000 00101$:
                           1001 ;src/main.c:230: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   771F 7B            [ 4] 1002 	ld	a,e
   7720 C6 05         [ 7] 1003 	add	a, #0x05
   7722 C5            [11] 1004 	push	bc
   7723 D5            [11] 1005 	push	de
   7724 33            [ 6] 1006 	inc	sp
   7725 F5            [11] 1007 	push	af
   7726 33            [ 6] 1008 	inc	sp
   7727 CD 73 73      [17] 1009 	call	_getTilePtr
   772A F1            [10] 1010 	pop	af
   772B C1            [10] 1011 	pop	bc
   772C 5E            [ 7] 1012 	ld	e,(hl)
   772D 3E 02         [ 7] 1013 	ld	a,#0x02
   772F 93            [ 4] 1014 	sub	a, e
   7730 DA ED 77      [10] 1015 	jp	C,00113$
                           1016 ;src/main.c:231: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   7733 DD 6E F8      [19] 1017 	ld	l,-8 (ix)
   7736 DD 66 F9      [19] 1018 	ld	h,-7 (ix)
   7739 7E            [ 7] 1019 	ld	a,(hl)
   773A C6 0B         [ 7] 1020 	add	a, #0x0B
   773C 57            [ 4] 1021 	ld	d,a
   773D 0A            [ 7] 1022 	ld	a,(bc)
   773E C6 05         [ 7] 1023 	add	a, #0x05
   7740 C5            [11] 1024 	push	bc
   7741 D5            [11] 1025 	push	de
   7742 33            [ 6] 1026 	inc	sp
   7743 F5            [11] 1027 	push	af
   7744 33            [ 6] 1028 	inc	sp
   7745 CD 73 73      [17] 1029 	call	_getTilePtr
   7748 F1            [10] 1030 	pop	af
   7749 C1            [10] 1031 	pop	bc
   774A 5E            [ 7] 1032 	ld	e,(hl)
   774B 3E 02         [ 7] 1033 	ld	a,#0x02
   774D 93            [ 4] 1034 	sub	a, e
   774E DA ED 77      [10] 1035 	jp	C,00113$
                           1036 ;src/main.c:232: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   7751 DD 6E F8      [19] 1037 	ld	l,-8 (ix)
   7754 DD 66 F9      [19] 1038 	ld	h,-7 (ix)
   7757 7E            [ 7] 1039 	ld	a,(hl)
   7758 C6 16         [ 7] 1040 	add	a, #0x16
   775A 57            [ 4] 1041 	ld	d,a
   775B 0A            [ 7] 1042 	ld	a,(bc)
   775C C6 05         [ 7] 1043 	add	a, #0x05
   775E C5            [11] 1044 	push	bc
   775F D5            [11] 1045 	push	de
   7760 33            [ 6] 1046 	inc	sp
   7761 F5            [11] 1047 	push	af
   7762 33            [ 6] 1048 	inc	sp
   7763 CD 73 73      [17] 1049 	call	_getTilePtr
   7766 F1            [10] 1050 	pop	af
   7767 C1            [10] 1051 	pop	bc
   7768 5E            [ 7] 1052 	ld	e,(hl)
   7769 3E 02         [ 7] 1053 	ld	a,#0x02
   776B 93            [ 4] 1054 	sub	a, e
   776C DA ED 77      [10] 1055 	jp	C,00113$
                           1056 ;src/main.c:234: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   776F 21 D4 69      [10] 1057 	ld	hl, #_cu + 1
   7772 5E            [ 7] 1058 	ld	e,(hl)
   7773 16 00         [ 7] 1059 	ld	d,#0x00
   7775 21 04 00      [10] 1060 	ld	hl,#0x0004
   7778 19            [11] 1061 	add	hl,de
   7779 DD 75 FE      [19] 1062 	ld	-2 (ix),l
   777C DD 74 FF      [19] 1063 	ld	-1 (ix),h
   777F DD 6E F8      [19] 1064 	ld	l,-8 (ix)
   7782 DD 66 F9      [19] 1065 	ld	h,-7 (ix)
   7785 6E            [ 7] 1066 	ld	l,(hl)
   7786 26 00         [ 7] 1067 	ld	h,#0x00
   7788 DD 7E FE      [19] 1068 	ld	a,-2 (ix)
   778B 95            [ 4] 1069 	sub	a, l
   778C DD 7E FF      [19] 1070 	ld	a,-1 (ix)
   778F 9C            [ 4] 1071 	sbc	a, h
   7790 E2 95 77      [10] 1072 	jp	PO, 00274$
   7793 EE 80         [ 7] 1073 	xor	a, #0x80
   7795                    1074 00274$:
   7795 FA AA 77      [10] 1075 	jp	M,00108$
   7798 D5            [11] 1076 	push	de
   7799 11 16 00      [10] 1077 	ld	de,#0x0016
   779C 19            [11] 1078 	add	hl, de
   779D D1            [10] 1079 	pop	de
   779E 7D            [ 4] 1080 	ld	a,l
   779F 93            [ 4] 1081 	sub	a, e
   77A0 7C            [ 4] 1082 	ld	a,h
   77A1 9A            [ 4] 1083 	sbc	a, d
   77A2 E2 A7 77      [10] 1084 	jp	PO, 00275$
   77A5 EE 80         [ 7] 1085 	xor	a, #0x80
   77A7                    1086 00275$:
   77A7 F2 B1 77      [10] 1087 	jp	P,00109$
   77AA                    1088 00108$:
                           1089 ;src/main.c:235: colisiona = 0;
   77AA DD 36 F7 00   [19] 1090 	ld	-9 (ix),#0x00
   77AE C3 76 7A      [10] 1091 	jp	00165$
   77B1                    1092 00109$:
                           1093 ;src/main.c:238: if(cu.x > enemy->x){ //si el cu esta abajo
   77B1 21 D3 69      [10] 1094 	ld	hl, #_cu + 0
   77B4 5E            [ 7] 1095 	ld	e,(hl)
   77B5 0A            [ 7] 1096 	ld	a,(bc)
   77B6 4F            [ 4] 1097 	ld	c,a
   77B7 93            [ 4] 1098 	sub	a, e
   77B8 30 2C         [12] 1099 	jr	NC,00106$
                           1100 ;src/main.c:239: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
   77BA 6B            [ 4] 1101 	ld	l,e
   77BB 26 00         [ 7] 1102 	ld	h,#0x00
   77BD 06 00         [ 7] 1103 	ld	b,#0x00
   77BF 03            [ 6] 1104 	inc	bc
   77C0 03            [ 6] 1105 	inc	bc
   77C1 03            [ 6] 1106 	inc	bc
   77C2 03            [ 6] 1107 	inc	bc
   77C3 BF            [ 4] 1108 	cp	a, a
   77C4 ED 42         [15] 1109 	sbc	hl, bc
   77C6 3E 01         [ 7] 1110 	ld	a,#0x01
   77C8 BD            [ 4] 1111 	cp	a, l
   77C9 3E 00         [ 7] 1112 	ld	a,#0x00
   77CB 9C            [ 4] 1113 	sbc	a, h
   77CC E2 D1 77      [10] 1114 	jp	PO, 00276$
   77CF EE 80         [ 7] 1115 	xor	a, #0x80
   77D1                    1116 00276$:
   77D1 F2 DB 77      [10] 1117 	jp	P,00103$
                           1118 ;src/main.c:240: colisiona = 0;
   77D4 DD 36 F7 00   [19] 1119 	ld	-9 (ix),#0x00
   77D8 C3 76 7A      [10] 1120 	jp	00165$
   77DB                    1121 00103$:
                           1122 ;src/main.c:243: enemy->muerto = SI;
   77DB DD 6E FA      [19] 1123 	ld	l,-6 (ix)
   77DE DD 66 FB      [19] 1124 	ld	h,-5 (ix)
   77E1 36 01         [10] 1125 	ld	(hl),#0x01
   77E3 C3 76 7A      [10] 1126 	jp	00165$
   77E6                    1127 00106$:
                           1128 ;src/main.c:246: colisiona = 0;
   77E6 DD 36 F7 00   [19] 1129 	ld	-9 (ix),#0x00
   77EA C3 76 7A      [10] 1130 	jp	00165$
   77ED                    1131 00113$:
                           1132 ;src/main.c:250: enemy->mira = M_izquierda;
   77ED DD 6E FC      [19] 1133 	ld	l,-4 (ix)
   77F0 DD 66 FD      [19] 1134 	ld	h,-3 (ix)
   77F3 36 01         [10] 1135 	ld	(hl),#0x01
                           1136 ;src/main.c:252: break;
   77F5 C3 76 7A      [10] 1137 	jp	00165$
                           1138 ;src/main.c:253: case 1:
   77F8                    1139 00117$:
                           1140 ;src/main.c:254: if( *getTilePtr(enemy->x - 1, enemy->y) <= 2
   77F8 1D            [ 4] 1141 	dec	e
   77F9 C5            [11] 1142 	push	bc
   77FA D5            [11] 1143 	push	de
   77FB CD 73 73      [17] 1144 	call	_getTilePtr
   77FE F1            [10] 1145 	pop	af
   77FF C1            [10] 1146 	pop	bc
   7800 5E            [ 7] 1147 	ld	e,(hl)
   7801 3E 02         [ 7] 1148 	ld	a,#0x02
   7803 93            [ 4] 1149 	sub	a, e
   7804 DA C2 78      [10] 1150 	jp	C,00129$
                           1151 ;src/main.c:255: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   7807 DD 6E F8      [19] 1152 	ld	l,-8 (ix)
   780A DD 66 F9      [19] 1153 	ld	h,-7 (ix)
   780D 7E            [ 7] 1154 	ld	a,(hl)
   780E C6 0B         [ 7] 1155 	add	a, #0x0B
   7810 57            [ 4] 1156 	ld	d,a
   7811 0A            [ 7] 1157 	ld	a,(bc)
   7812 C6 FF         [ 7] 1158 	add	a,#0xFF
   7814 C5            [11] 1159 	push	bc
   7815 D5            [11] 1160 	push	de
   7816 33            [ 6] 1161 	inc	sp
   7817 F5            [11] 1162 	push	af
   7818 33            [ 6] 1163 	inc	sp
   7819 CD 73 73      [17] 1164 	call	_getTilePtr
   781C F1            [10] 1165 	pop	af
   781D C1            [10] 1166 	pop	bc
   781E 5E            [ 7] 1167 	ld	e,(hl)
   781F 3E 02         [ 7] 1168 	ld	a,#0x02
   7821 93            [ 4] 1169 	sub	a, e
   7822 DA C2 78      [10] 1170 	jp	C,00129$
                           1171 ;src/main.c:256: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   7825 DD 6E F8      [19] 1172 	ld	l,-8 (ix)
   7828 DD 66 F9      [19] 1173 	ld	h,-7 (ix)
   782B 7E            [ 7] 1174 	ld	a,(hl)
   782C C6 16         [ 7] 1175 	add	a, #0x16
   782E 57            [ 4] 1176 	ld	d,a
   782F 0A            [ 7] 1177 	ld	a,(bc)
   7830 C6 FF         [ 7] 1178 	add	a,#0xFF
   7832 C5            [11] 1179 	push	bc
   7833 D5            [11] 1180 	push	de
   7834 33            [ 6] 1181 	inc	sp
   7835 F5            [11] 1182 	push	af
   7836 33            [ 6] 1183 	inc	sp
   7837 CD 73 73      [17] 1184 	call	_getTilePtr
   783A F1            [10] 1185 	pop	af
   783B C1            [10] 1186 	pop	bc
   783C 5E            [ 7] 1187 	ld	e,(hl)
   783D 3E 02         [ 7] 1188 	ld	a,#0x02
   783F 93            [ 4] 1189 	sub	a, e
   7840 DA C2 78      [10] 1190 	jp	C,00129$
                           1191 ;src/main.c:258: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   7843 21 D4 69      [10] 1192 	ld	hl, #_cu + 1
   7846 5E            [ 7] 1193 	ld	e,(hl)
   7847 16 00         [ 7] 1194 	ld	d,#0x00
   7849 21 04 00      [10] 1195 	ld	hl,#0x0004
   784C 19            [11] 1196 	add	hl,de
   784D DD 75 FE      [19] 1197 	ld	-2 (ix),l
   7850 DD 74 FF      [19] 1198 	ld	-1 (ix),h
   7853 DD 6E F8      [19] 1199 	ld	l,-8 (ix)
   7856 DD 66 F9      [19] 1200 	ld	h,-7 (ix)
   7859 6E            [ 7] 1201 	ld	l,(hl)
   785A 26 00         [ 7] 1202 	ld	h,#0x00
   785C DD 7E FE      [19] 1203 	ld	a,-2 (ix)
   785F 95            [ 4] 1204 	sub	a, l
   7860 DD 7E FF      [19] 1205 	ld	a,-1 (ix)
   7863 9C            [ 4] 1206 	sbc	a, h
   7864 E2 69 78      [10] 1207 	jp	PO, 00277$
   7867 EE 80         [ 7] 1208 	xor	a, #0x80
   7869                    1209 00277$:
   7869 FA 7E 78      [10] 1210 	jp	M,00124$
   786C D5            [11] 1211 	push	de
   786D 11 16 00      [10] 1212 	ld	de,#0x0016
   7870 19            [11] 1213 	add	hl, de
   7871 D1            [10] 1214 	pop	de
   7872 7D            [ 4] 1215 	ld	a,l
   7873 93            [ 4] 1216 	sub	a, e
   7874 7C            [ 4] 1217 	ld	a,h
   7875 9A            [ 4] 1218 	sbc	a, d
   7876 E2 7B 78      [10] 1219 	jp	PO, 00278$
   7879 EE 80         [ 7] 1220 	xor	a, #0x80
   787B                    1221 00278$:
   787B F2 85 78      [10] 1222 	jp	P,00125$
   787E                    1223 00124$:
                           1224 ;src/main.c:259: colisiona = 0;
   787E DD 36 F7 00   [19] 1225 	ld	-9 (ix),#0x00
   7882 C3 76 7A      [10] 1226 	jp	00165$
   7885                    1227 00125$:
                           1228 ;src/main.c:262: if(enemy->x > cu.x){ //si el cu esta abajo
   7885 0A            [ 7] 1229 	ld	a,(bc)
   7886 5F            [ 4] 1230 	ld	e,a
   7887 21 D3 69      [10] 1231 	ld	hl, #_cu + 0
   788A 4E            [ 7] 1232 	ld	c,(hl)
   788B 79            [ 4] 1233 	ld	a,c
   788C 93            [ 4] 1234 	sub	a, e
   788D 30 2C         [12] 1235 	jr	NC,00122$
                           1236 ;src/main.c:263: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
   788F 6B            [ 4] 1237 	ld	l,e
   7890 26 00         [ 7] 1238 	ld	h,#0x00
   7892 06 00         [ 7] 1239 	ld	b,#0x00
   7894 03            [ 6] 1240 	inc	bc
   7895 03            [ 6] 1241 	inc	bc
   7896 03            [ 6] 1242 	inc	bc
   7897 03            [ 6] 1243 	inc	bc
   7898 BF            [ 4] 1244 	cp	a, a
   7899 ED 42         [15] 1245 	sbc	hl, bc
   789B 3E 01         [ 7] 1246 	ld	a,#0x01
   789D BD            [ 4] 1247 	cp	a, l
   789E 3E 00         [ 7] 1248 	ld	a,#0x00
   78A0 9C            [ 4] 1249 	sbc	a, h
   78A1 E2 A6 78      [10] 1250 	jp	PO, 00279$
   78A4 EE 80         [ 7] 1251 	xor	a, #0x80
   78A6                    1252 00279$:
   78A6 F2 B0 78      [10] 1253 	jp	P,00119$
                           1254 ;src/main.c:264: colisiona = 0;
   78A9 DD 36 F7 00   [19] 1255 	ld	-9 (ix),#0x00
   78AD C3 76 7A      [10] 1256 	jp	00165$
   78B0                    1257 00119$:
                           1258 ;src/main.c:267: enemy->muerto = SI;
   78B0 DD 6E FA      [19] 1259 	ld	l,-6 (ix)
   78B3 DD 66 FB      [19] 1260 	ld	h,-5 (ix)
   78B6 36 01         [10] 1261 	ld	(hl),#0x01
   78B8 C3 76 7A      [10] 1262 	jp	00165$
   78BB                    1263 00122$:
                           1264 ;src/main.c:270: colisiona = 0;
   78BB DD 36 F7 00   [19] 1265 	ld	-9 (ix),#0x00
   78BF C3 76 7A      [10] 1266 	jp	00165$
   78C2                    1267 00129$:
                           1268 ;src/main.c:274: enemy->mira = M_derecha;
   78C2 DD 6E FC      [19] 1269 	ld	l,-4 (ix)
   78C5 DD 66 FD      [19] 1270 	ld	h,-3 (ix)
   78C8 36 00         [10] 1271 	ld	(hl),#0x00
                           1272 ;src/main.c:276: break;
   78CA C3 76 7A      [10] 1273 	jp	00165$
                           1274 ;src/main.c:277: case 2:
   78CD                    1275 00133$:
                           1276 ;src/main.c:278: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   78CD 15            [ 4] 1277 	dec	d
   78CE 15            [ 4] 1278 	dec	d
   78CF C5            [11] 1279 	push	bc
   78D0 D5            [11] 1280 	push	de
   78D1 CD 73 73      [17] 1281 	call	_getTilePtr
   78D4 F1            [10] 1282 	pop	af
   78D5 C1            [10] 1283 	pop	bc
   78D6 5E            [ 7] 1284 	ld	e,(hl)
   78D7 3E 02         [ 7] 1285 	ld	a,#0x02
   78D9 93            [ 4] 1286 	sub	a, e
   78DA DA 94 79      [10] 1287 	jp	C,00145$
                           1288 ;src/main.c:279: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   78DD DD 6E F8      [19] 1289 	ld	l,-8 (ix)
   78E0 DD 66 F9      [19] 1290 	ld	h,-7 (ix)
   78E3 56            [ 7] 1291 	ld	d,(hl)
   78E4 15            [ 4] 1292 	dec	d
   78E5 15            [ 4] 1293 	dec	d
   78E6 0A            [ 7] 1294 	ld	a,(bc)
   78E7 C6 02         [ 7] 1295 	add	a, #0x02
   78E9 C5            [11] 1296 	push	bc
   78EA D5            [11] 1297 	push	de
   78EB 33            [ 6] 1298 	inc	sp
   78EC F5            [11] 1299 	push	af
   78ED 33            [ 6] 1300 	inc	sp
   78EE CD 73 73      [17] 1301 	call	_getTilePtr
   78F1 F1            [10] 1302 	pop	af
   78F2 C1            [10] 1303 	pop	bc
   78F3 5E            [ 7] 1304 	ld	e,(hl)
   78F4 3E 02         [ 7] 1305 	ld	a,#0x02
   78F6 93            [ 4] 1306 	sub	a, e
   78F7 DA 94 79      [10] 1307 	jp	C,00145$
                           1308 ;src/main.c:280: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   78FA DD 6E F8      [19] 1309 	ld	l,-8 (ix)
   78FD DD 66 F9      [19] 1310 	ld	h,-7 (ix)
   7900 56            [ 7] 1311 	ld	d,(hl)
   7901 15            [ 4] 1312 	dec	d
   7902 15            [ 4] 1313 	dec	d
   7903 0A            [ 7] 1314 	ld	a,(bc)
   7904 C6 04         [ 7] 1315 	add	a, #0x04
   7906 C5            [11] 1316 	push	bc
   7907 D5            [11] 1317 	push	de
   7908 33            [ 6] 1318 	inc	sp
   7909 F5            [11] 1319 	push	af
   790A 33            [ 6] 1320 	inc	sp
   790B CD 73 73      [17] 1321 	call	_getTilePtr
   790E F1            [10] 1322 	pop	af
   790F C1            [10] 1323 	pop	bc
   7910 5E            [ 7] 1324 	ld	e,(hl)
   7911 3E 02         [ 7] 1325 	ld	a,#0x02
   7913 93            [ 4] 1326 	sub	a, e
   7914 DA 94 79      [10] 1327 	jp	C,00145$
                           1328 ;src/main.c:282: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   7917 21 D3 69      [10] 1329 	ld	hl, #_cu + 0
   791A 5E            [ 7] 1330 	ld	e,(hl)
   791B 16 00         [ 7] 1331 	ld	d,#0x00
   791D 21 02 00      [10] 1332 	ld	hl,#0x0002
   7920 19            [11] 1333 	add	hl,de
   7921 DD 75 FE      [19] 1334 	ld	-2 (ix),l
   7924 DD 74 FF      [19] 1335 	ld	-1 (ix),h
   7927 0A            [ 7] 1336 	ld	a,(bc)
   7928 6F            [ 4] 1337 	ld	l,a
   7929 26 00         [ 7] 1338 	ld	h,#0x00
   792B DD 7E FE      [19] 1339 	ld	a,-2 (ix)
   792E 95            [ 4] 1340 	sub	a, l
   792F DD 7E FF      [19] 1341 	ld	a,-1 (ix)
   7932 9C            [ 4] 1342 	sbc	a, h
   7933 E2 38 79      [10] 1343 	jp	PO, 00280$
   7936 EE 80         [ 7] 1344 	xor	a, #0x80
   7938                    1345 00280$:
   7938 FA 4B 79      [10] 1346 	jp	M,00140$
   793B 23            [ 6] 1347 	inc	hl
   793C 23            [ 6] 1348 	inc	hl
   793D 23            [ 6] 1349 	inc	hl
   793E 23            [ 6] 1350 	inc	hl
   793F 7D            [ 4] 1351 	ld	a,l
   7940 93            [ 4] 1352 	sub	a, e
   7941 7C            [ 4] 1353 	ld	a,h
   7942 9A            [ 4] 1354 	sbc	a, d
   7943 E2 48 79      [10] 1355 	jp	PO, 00281$
   7946 EE 80         [ 7] 1356 	xor	a, #0x80
   7948                    1357 00281$:
   7948 F2 51 79      [10] 1358 	jp	P,00141$
   794B                    1359 00140$:
                           1360 ;src/main.c:284: colisiona = 0;
   794B DD 36 F7 00   [19] 1361 	ld	-9 (ix),#0x00
   794F 18 4B         [12] 1362 	jr	00149$
   7951                    1363 00141$:
                           1364 ;src/main.c:287: if(enemy->y>cu.y){
   7951 DD 6E F8      [19] 1365 	ld	l,-8 (ix)
   7954 DD 66 F9      [19] 1366 	ld	h,-7 (ix)
   7957 5E            [ 7] 1367 	ld	e,(hl)
   7958 21 D4 69      [10] 1368 	ld	hl, #(_cu + 0x0001) + 0
   795B 6E            [ 7] 1369 	ld	l,(hl)
   795C 7D            [ 4] 1370 	ld	a,l
   795D 93            [ 4] 1371 	sub	a, e
   795E 30 2E         [12] 1372 	jr	NC,00138$
                           1373 ;src/main.c:288: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   7960 16 00         [ 7] 1374 	ld	d,#0x00
   7962 26 00         [ 7] 1375 	ld	h,#0x00
   7964 D5            [11] 1376 	push	de
   7965 11 08 00      [10] 1377 	ld	de,#0x0008
   7968 19            [11] 1378 	add	hl, de
   7969 D1            [10] 1379 	pop	de
   796A 7B            [ 4] 1380 	ld	a,e
   796B 95            [ 4] 1381 	sub	a, l
   796C 5F            [ 4] 1382 	ld	e,a
   796D 7A            [ 4] 1383 	ld	a,d
   796E 9C            [ 4] 1384 	sbc	a, h
   796F 57            [ 4] 1385 	ld	d,a
   7970 3E 02         [ 7] 1386 	ld	a,#0x02
   7972 BB            [ 4] 1387 	cp	a, e
   7973 3E 00         [ 7] 1388 	ld	a,#0x00
   7975 9A            [ 4] 1389 	sbc	a, d
   7976 E2 7B 79      [10] 1390 	jp	PO, 00282$
   7979 EE 80         [ 7] 1391 	xor	a, #0x80
   797B                    1392 00282$:
   797B F2 84 79      [10] 1393 	jp	P,00135$
                           1394 ;src/main.c:289: colisiona = 0;
   797E DD 36 F7 00   [19] 1395 	ld	-9 (ix),#0x00
   7982 18 18         [12] 1396 	jr	00149$
   7984                    1397 00135$:
                           1398 ;src/main.c:292: enemy->muerto = SI;
   7984 DD 6E FA      [19] 1399 	ld	l,-6 (ix)
   7987 DD 66 FB      [19] 1400 	ld	h,-5 (ix)
   798A 36 01         [10] 1401 	ld	(hl),#0x01
   798C 18 0E         [12] 1402 	jr	00149$
   798E                    1403 00138$:
                           1404 ;src/main.c:296: colisiona = 0;
   798E DD 36 F7 00   [19] 1405 	ld	-9 (ix),#0x00
   7992 18 08         [12] 1406 	jr	00149$
   7994                    1407 00145$:
                           1408 ;src/main.c:302: enemy->mira = M_abajo;
   7994 DD 6E FC      [19] 1409 	ld	l,-4 (ix)
   7997 DD 66 FD      [19] 1410 	ld	h,-3 (ix)
   799A 36 03         [10] 1411 	ld	(hl),#0x03
                           1412 ;src/main.c:305: case 3:
   799C                    1413 00149$:
                           1414 ;src/main.c:308: if( *getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   799C DD 6E F8      [19] 1415 	ld	l,-8 (ix)
   799F DD 66 F9      [19] 1416 	ld	h,-7 (ix)
   79A2 7E            [ 7] 1417 	ld	a,(hl)
   79A3 C6 18         [ 7] 1418 	add	a, #0x18
   79A5 57            [ 4] 1419 	ld	d,a
   79A6 0A            [ 7] 1420 	ld	a,(bc)
   79A7 C5            [11] 1421 	push	bc
   79A8 D5            [11] 1422 	push	de
   79A9 33            [ 6] 1423 	inc	sp
   79AA F5            [11] 1424 	push	af
   79AB 33            [ 6] 1425 	inc	sp
   79AC CD 73 73      [17] 1426 	call	_getTilePtr
   79AF F1            [10] 1427 	pop	af
   79B0 C1            [10] 1428 	pop	bc
   79B1 5E            [ 7] 1429 	ld	e,(hl)
   79B2 3E 02         [ 7] 1430 	ld	a,#0x02
   79B4 93            [ 4] 1431 	sub	a, e
   79B5 DA 6E 7A      [10] 1432 	jp	C,00161$
                           1433 ;src/main.c:309: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   79B8 DD 6E F8      [19] 1434 	ld	l,-8 (ix)
   79BB DD 66 F9      [19] 1435 	ld	h,-7 (ix)
   79BE 7E            [ 7] 1436 	ld	a,(hl)
   79BF C6 18         [ 7] 1437 	add	a, #0x18
   79C1 57            [ 4] 1438 	ld	d,a
   79C2 0A            [ 7] 1439 	ld	a,(bc)
   79C3 C6 02         [ 7] 1440 	add	a, #0x02
   79C5 C5            [11] 1441 	push	bc
   79C6 D5            [11] 1442 	push	de
   79C7 33            [ 6] 1443 	inc	sp
   79C8 F5            [11] 1444 	push	af
   79C9 33            [ 6] 1445 	inc	sp
   79CA CD 73 73      [17] 1446 	call	_getTilePtr
   79CD F1            [10] 1447 	pop	af
   79CE C1            [10] 1448 	pop	bc
   79CF 5E            [ 7] 1449 	ld	e,(hl)
   79D0 3E 02         [ 7] 1450 	ld	a,#0x02
   79D2 93            [ 4] 1451 	sub	a, e
   79D3 DA 6E 7A      [10] 1452 	jp	C,00161$
                           1453 ;src/main.c:310: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   79D6 DD 6E F8      [19] 1454 	ld	l,-8 (ix)
   79D9 DD 66 F9      [19] 1455 	ld	h,-7 (ix)
   79DC 7E            [ 7] 1456 	ld	a,(hl)
   79DD C6 18         [ 7] 1457 	add	a, #0x18
   79DF 57            [ 4] 1458 	ld	d,a
   79E0 0A            [ 7] 1459 	ld	a,(bc)
   79E1 C6 04         [ 7] 1460 	add	a, #0x04
   79E3 C5            [11] 1461 	push	bc
   79E4 D5            [11] 1462 	push	de
   79E5 33            [ 6] 1463 	inc	sp
   79E6 F5            [11] 1464 	push	af
   79E7 33            [ 6] 1465 	inc	sp
   79E8 CD 73 73      [17] 1466 	call	_getTilePtr
   79EB F1            [10] 1467 	pop	af
   79EC C1            [10] 1468 	pop	bc
   79ED 5E            [ 7] 1469 	ld	e,(hl)
   79EE 3E 02         [ 7] 1470 	ld	a,#0x02
   79F0 93            [ 4] 1471 	sub	a, e
   79F1 38 7B         [12] 1472 	jr	C,00161$
                           1473 ;src/main.c:312: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   79F3 21 D3 69      [10] 1474 	ld	hl, #_cu + 0
   79F6 5E            [ 7] 1475 	ld	e,(hl)
   79F7 16 00         [ 7] 1476 	ld	d,#0x00
   79F9 21 02 00      [10] 1477 	ld	hl,#0x0002
   79FC 19            [11] 1478 	add	hl,de
   79FD DD 75 FE      [19] 1479 	ld	-2 (ix),l
   7A00 DD 74 FF      [19] 1480 	ld	-1 (ix),h
   7A03 0A            [ 7] 1481 	ld	a,(bc)
   7A04 4F            [ 4] 1482 	ld	c,a
   7A05 06 00         [ 7] 1483 	ld	b,#0x00
   7A07 DD 7E FE      [19] 1484 	ld	a,-2 (ix)
   7A0A 91            [ 4] 1485 	sub	a, c
   7A0B DD 7E FF      [19] 1486 	ld	a,-1 (ix)
   7A0E 98            [ 4] 1487 	sbc	a, b
   7A0F E2 14 7A      [10] 1488 	jp	PO, 00283$
   7A12 EE 80         [ 7] 1489 	xor	a, #0x80
   7A14                    1490 00283$:
   7A14 FA 27 7A      [10] 1491 	jp	M,00156$
   7A17 03            [ 6] 1492 	inc	bc
   7A18 03            [ 6] 1493 	inc	bc
   7A19 03            [ 6] 1494 	inc	bc
   7A1A 03            [ 6] 1495 	inc	bc
   7A1B 79            [ 4] 1496 	ld	a,c
   7A1C 93            [ 4] 1497 	sub	a, e
   7A1D 78            [ 4] 1498 	ld	a,b
   7A1E 9A            [ 4] 1499 	sbc	a, d
   7A1F E2 24 7A      [10] 1500 	jp	PO, 00284$
   7A22 EE 80         [ 7] 1501 	xor	a, #0x80
   7A24                    1502 00284$:
   7A24 F2 2D 7A      [10] 1503 	jp	P,00157$
   7A27                    1504 00156$:
                           1505 ;src/main.c:313: colisiona = 0;
   7A27 DD 36 F7 00   [19] 1506 	ld	-9 (ix),#0x00
   7A2B 18 49         [12] 1507 	jr	00165$
   7A2D                    1508 00157$:
                           1509 ;src/main.c:316: if(cu.y > enemy->y){ //si el cu esta abajo
   7A2D 21 D4 69      [10] 1510 	ld	hl, #(_cu + 0x0001) + 0
   7A30 4E            [ 7] 1511 	ld	c,(hl)
   7A31 DD 6E F8      [19] 1512 	ld	l,-8 (ix)
   7A34 DD 66 F9      [19] 1513 	ld	h,-7 (ix)
   7A37 5E            [ 7] 1514 	ld	e,(hl)
   7A38 7B            [ 4] 1515 	ld	a,e
   7A39 91            [ 4] 1516 	sub	a, c
   7A3A 30 2C         [12] 1517 	jr	NC,00154$
                           1518 ;src/main.c:317: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   7A3C 06 00         [ 7] 1519 	ld	b,#0x00
   7A3E 16 00         [ 7] 1520 	ld	d,#0x00
   7A40 21 16 00      [10] 1521 	ld	hl,#0x0016
   7A43 19            [11] 1522 	add	hl,de
   7A44 79            [ 4] 1523 	ld	a,c
   7A45 95            [ 4] 1524 	sub	a, l
   7A46 4F            [ 4] 1525 	ld	c,a
   7A47 78            [ 4] 1526 	ld	a,b
   7A48 9C            [ 4] 1527 	sbc	a, h
   7A49 47            [ 4] 1528 	ld	b,a
   7A4A 3E 02         [ 7] 1529 	ld	a,#0x02
   7A4C B9            [ 4] 1530 	cp	a, c
   7A4D 3E 00         [ 7] 1531 	ld	a,#0x00
   7A4F 98            [ 4] 1532 	sbc	a, b
   7A50 E2 55 7A      [10] 1533 	jp	PO, 00285$
   7A53 EE 80         [ 7] 1534 	xor	a, #0x80
   7A55                    1535 00285$:
   7A55 F2 5E 7A      [10] 1536 	jp	P,00151$
                           1537 ;src/main.c:318: colisiona = 0;
   7A58 DD 36 F7 00   [19] 1538 	ld	-9 (ix),#0x00
   7A5C 18 18         [12] 1539 	jr	00165$
   7A5E                    1540 00151$:
                           1541 ;src/main.c:321: enemy->muerto = SI;
   7A5E DD 6E FA      [19] 1542 	ld	l,-6 (ix)
   7A61 DD 66 FB      [19] 1543 	ld	h,-5 (ix)
   7A64 36 01         [10] 1544 	ld	(hl),#0x01
   7A66 18 0E         [12] 1545 	jr	00165$
   7A68                    1546 00154$:
                           1547 ;src/main.c:325: colisiona = 0;
   7A68 DD 36 F7 00   [19] 1548 	ld	-9 (ix),#0x00
   7A6C 18 08         [12] 1549 	jr	00165$
   7A6E                    1550 00161$:
                           1551 ;src/main.c:329: enemy->mira = M_arriba;
   7A6E DD 6E FC      [19] 1552 	ld	l,-4 (ix)
   7A71 DD 66 FD      [19] 1553 	ld	h,-3 (ix)
   7A74 36 02         [10] 1554 	ld	(hl),#0x02
                           1555 ;src/main.c:332: }
   7A76                    1556 00165$:
                           1557 ;src/main.c:333: return colisiona;
   7A76 DD 6E F7      [19] 1558 	ld	l,-9 (ix)
   7A79 DD F9         [10] 1559 	ld	sp, ix
   7A7B DD E1         [14] 1560 	pop	ix
   7A7D C9            [10] 1561 	ret
                           1562 ;src/main.c:336: void moverEnemigoArriba(TEnemy *enemy){
                           1563 ;	---------------------------------
                           1564 ; Function moverEnemigoArriba
                           1565 ; ---------------------------------
   7A7E                    1566 _moverEnemigoArriba::
   7A7E DD E5         [15] 1567 	push	ix
   7A80 DD 21 00 00   [14] 1568 	ld	ix,#0
   7A84 DD 39         [15] 1569 	add	ix,sp
                           1570 ;src/main.c:337: enemy->y--;
   7A86 DD 4E 04      [19] 1571 	ld	c,4 (ix)
   7A89 DD 46 05      [19] 1572 	ld	b,5 (ix)
   7A8C 69            [ 4] 1573 	ld	l, c
   7A8D 60            [ 4] 1574 	ld	h, b
   7A8E 23            [ 6] 1575 	inc	hl
   7A8F 5E            [ 7] 1576 	ld	e,(hl)
   7A90 1D            [ 4] 1577 	dec	e
   7A91 73            [ 7] 1578 	ld	(hl),e
                           1579 ;src/main.c:338: enemy->y--;
   7A92 1D            [ 4] 1580 	dec	e
   7A93 73            [ 7] 1581 	ld	(hl),e
                           1582 ;src/main.c:339: enemy->mover = SI;
   7A94 21 06 00      [10] 1583 	ld	hl,#0x0006
   7A97 09            [11] 1584 	add	hl,bc
   7A98 36 01         [10] 1585 	ld	(hl),#0x01
   7A9A DD E1         [14] 1586 	pop	ix
   7A9C C9            [10] 1587 	ret
                           1588 ;src/main.c:342: void moverEnemigoAbajo(TEnemy *enemy){
                           1589 ;	---------------------------------
                           1590 ; Function moverEnemigoAbajo
                           1591 ; ---------------------------------
   7A9D                    1592 _moverEnemigoAbajo::
   7A9D DD E5         [15] 1593 	push	ix
   7A9F DD 21 00 00   [14] 1594 	ld	ix,#0
   7AA3 DD 39         [15] 1595 	add	ix,sp
                           1596 ;src/main.c:343: enemy->y++;
   7AA5 DD 4E 04      [19] 1597 	ld	c,4 (ix)
   7AA8 DD 46 05      [19] 1598 	ld	b,5 (ix)
   7AAB 59            [ 4] 1599 	ld	e, c
   7AAC 50            [ 4] 1600 	ld	d, b
   7AAD 13            [ 6] 1601 	inc	de
   7AAE 1A            [ 7] 1602 	ld	a,(de)
   7AAF 3C            [ 4] 1603 	inc	a
   7AB0 12            [ 7] 1604 	ld	(de),a
                           1605 ;src/main.c:344: enemy->y++;
   7AB1 3C            [ 4] 1606 	inc	a
   7AB2 12            [ 7] 1607 	ld	(de),a
                           1608 ;src/main.c:345: enemy->mover = SI;
   7AB3 21 06 00      [10] 1609 	ld	hl,#0x0006
   7AB6 09            [11] 1610 	add	hl,bc
   7AB7 36 01         [10] 1611 	ld	(hl),#0x01
   7AB9 DD E1         [14] 1612 	pop	ix
   7ABB C9            [10] 1613 	ret
                           1614 ;src/main.c:348: void moverEnemigoDerecha(TEnemy *enemy){
                           1615 ;	---------------------------------
                           1616 ; Function moverEnemigoDerecha
                           1617 ; ---------------------------------
   7ABC                    1618 _moverEnemigoDerecha::
                           1619 ;src/main.c:349: enemy->x++;
   7ABC D1            [10] 1620 	pop	de
   7ABD C1            [10] 1621 	pop	bc
   7ABE C5            [11] 1622 	push	bc
   7ABF D5            [11] 1623 	push	de
   7AC0 0A            [ 7] 1624 	ld	a,(bc)
   7AC1 3C            [ 4] 1625 	inc	a
   7AC2 02            [ 7] 1626 	ld	(bc),a
                           1627 ;src/main.c:350: enemy->x++;
   7AC3 3C            [ 4] 1628 	inc	a
   7AC4 02            [ 7] 1629 	ld	(bc),a
                           1630 ;src/main.c:351: enemy->mover = SI;
   7AC5 21 06 00      [10] 1631 	ld	hl,#0x0006
   7AC8 09            [11] 1632 	add	hl,bc
   7AC9 36 01         [10] 1633 	ld	(hl),#0x01
   7ACB C9            [10] 1634 	ret
                           1635 ;src/main.c:354: void moverEnemigoIzquierda(TEnemy *enemy){
                           1636 ;	---------------------------------
                           1637 ; Function moverEnemigoIzquierda
                           1638 ; ---------------------------------
   7ACC                    1639 _moverEnemigoIzquierda::
                           1640 ;src/main.c:355: enemy->x--;
   7ACC D1            [10] 1641 	pop	de
   7ACD C1            [10] 1642 	pop	bc
   7ACE C5            [11] 1643 	push	bc
   7ACF D5            [11] 1644 	push	de
   7AD0 0A            [ 7] 1645 	ld	a,(bc)
   7AD1 C6 FF         [ 7] 1646 	add	a,#0xFF
   7AD3 02            [ 7] 1647 	ld	(bc),a
                           1648 ;src/main.c:356: enemy->x--;
   7AD4 C6 FF         [ 7] 1649 	add	a,#0xFF
   7AD6 02            [ 7] 1650 	ld	(bc),a
                           1651 ;src/main.c:357: enemy->mover = SI;
   7AD7 21 06 00      [10] 1652 	ld	hl,#0x0006
   7ADA 09            [11] 1653 	add	hl,bc
   7ADB 36 01         [10] 1654 	ld	(hl),#0x01
   7ADD C9            [10] 1655 	ret
                           1656 ;src/main.c:360: void moverEnemigoPathfinding(TEnemy *enemy){
                           1657 ;	---------------------------------
                           1658 ; Function moverEnemigoPathfinding
                           1659 ; ---------------------------------
   7ADE                    1660 _moverEnemigoPathfinding::
   7ADE DD E5         [15] 1661 	push	ix
   7AE0 DD 21 00 00   [14] 1662 	ld	ix,#0
   7AE4 DD 39         [15] 1663 	add	ix,sp
   7AE6 21 F3 FF      [10] 1664 	ld	hl,#-13
   7AE9 39            [11] 1665 	add	hl,sp
   7AEA F9            [ 6] 1666 	ld	sp,hl
                           1667 ;src/main.c:361: if(!enemy->muerto){
   7AEB DD 4E 04      [19] 1668 	ld	c,4 (ix)
   7AEE DD 46 05      [19] 1669 	ld	b,5 (ix)
   7AF1 C5            [11] 1670 	push	bc
   7AF2 FD E1         [14] 1671 	pop	iy
   7AF4 FD 7E 08      [19] 1672 	ld	a,8 (iy)
   7AF7 B7            [ 4] 1673 	or	a, a
   7AF8 C2 15 7C      [10] 1674 	jp	NZ,00112$
                           1675 ;src/main.c:363: if (!enemy->reversePatrol) {
   7AFB 21 0D 00      [10] 1676 	ld	hl,#0x000D
   7AFE 09            [11] 1677 	add	hl,bc
   7AFF DD 75 F4      [19] 1678 	ld	-12 (ix),l
   7B02 DD 74 F5      [19] 1679 	ld	-11 (ix),h
   7B05 DD 6E F4      [19] 1680 	ld	l,-12 (ix)
   7B08 DD 66 F5      [19] 1681 	ld	h,-11 (ix)
   7B0B 7E            [ 7] 1682 	ld	a,(hl)
   7B0C DD 77 F3      [19] 1683 	ld	-13 (ix),a
                           1684 ;src/main.c:364: if(enemy->iter < enemy->longitud_camino - 8){
   7B0F 21 0E 00      [10] 1685 	ld	hl,#0x000E
   7B12 09            [11] 1686 	add	hl,bc
   7B13 EB            [ 4] 1687 	ex	de,hl
                           1688 ;src/main.c:365: enemy->x = enemy->camino[enemy->iter];
   7B14 21 16 00      [10] 1689 	ld	hl,#0x0016
   7B17 09            [11] 1690 	add	hl,bc
   7B18 DD 75 FE      [19] 1691 	ld	-2 (ix),l
   7B1B DD 74 FF      [19] 1692 	ld	-1 (ix),h
                           1693 ;src/main.c:367: enemy->y = enemy->camino[enemy->iter];
   7B1E 21 01 00      [10] 1694 	ld	hl,#0x0001
   7B21 09            [11] 1695 	add	hl,bc
   7B22 DD 75 FC      [19] 1696 	ld	-4 (ix),l
   7B25 DD 74 FD      [19] 1697 	ld	-3 (ix),h
                           1698 ;src/main.c:369: enemy->mover = SI;
   7B28 21 06 00      [10] 1699 	ld	hl,#0x0006
   7B2B 09            [11] 1700 	add	hl,bc
   7B2C DD 75 FA      [19] 1701 	ld	-6 (ix),l
   7B2F DD 74 FB      [19] 1702 	ld	-5 (ix),h
                           1703 ;src/main.c:372: enemy->lastIter = enemy->iter - 1;
   7B32 21 0F 00      [10] 1704 	ld	hl,#0x000F
   7B35 09            [11] 1705 	add	hl,bc
   7B36 DD 75 F8      [19] 1706 	ld	-8 (ix),l
   7B39 DD 74 F9      [19] 1707 	ld	-7 (ix),h
                           1708 ;src/main.c:363: if (!enemy->reversePatrol) {
   7B3C DD 7E F3      [19] 1709 	ld	a,-13 (ix)
   7B3F B7            [ 4] 1710 	or	a, a
   7B40 20 7C         [12] 1711 	jr	NZ,00108$
                           1712 ;src/main.c:364: if(enemy->iter < enemy->longitud_camino - 8){
   7B42 1A            [ 7] 1713 	ld	a,(de)
   7B43 DD 77 F3      [19] 1714 	ld	-13 (ix),a
   7B46 69            [ 4] 1715 	ld	l, c
   7B47 60            [ 4] 1716 	ld	h, b
   7B48 C5            [11] 1717 	push	bc
   7B49 01 42 01      [10] 1718 	ld	bc, #0x0142
   7B4C 09            [11] 1719 	add	hl, bc
   7B4D C1            [10] 1720 	pop	bc
   7B4E 6E            [ 7] 1721 	ld	l,(hl)
   7B4F 26 00         [ 7] 1722 	ld	h,#0x00
   7B51 7D            [ 4] 1723 	ld	a,l
   7B52 C6 F8         [ 7] 1724 	add	a,#0xF8
   7B54 DD 77 F6      [19] 1725 	ld	-10 (ix),a
   7B57 7C            [ 4] 1726 	ld	a,h
   7B58 CE FF         [ 7] 1727 	adc	a,#0xFF
   7B5A DD 77 F7      [19] 1728 	ld	-9 (ix),a
   7B5D DD 7E F3      [19] 1729 	ld	a, -13 (ix)
   7B60 26 00         [ 7] 1730 	ld	h, #0x00
   7B62 DD 96 F6      [19] 1731 	sub	a, -10 (ix)
   7B65 7C            [ 4] 1732 	ld	a,h
   7B66 DD 9E F7      [19] 1733 	sbc	a, -9 (ix)
   7B69 E2 6E 7B      [10] 1734 	jp	PO, 00130$
   7B6C EE 80         [ 7] 1735 	xor	a, #0x80
   7B6E                    1736 00130$:
   7B6E F2 A9 7B      [10] 1737 	jp	P,00102$
                           1738 ;src/main.c:365: enemy->x = enemy->camino[enemy->iter];
   7B71 DD 6E F3      [19] 1739 	ld	l,-13 (ix)
   7B74 26 00         [ 7] 1740 	ld	h,#0x00
   7B76 DD 7E FE      [19] 1741 	ld	a,-2 (ix)
   7B79 85            [ 4] 1742 	add	a, l
   7B7A 6F            [ 4] 1743 	ld	l,a
   7B7B DD 7E FF      [19] 1744 	ld	a,-1 (ix)
   7B7E 8C            [ 4] 1745 	adc	a, h
   7B7F 67            [ 4] 1746 	ld	h,a
   7B80 7E            [ 7] 1747 	ld	a,(hl)
   7B81 02            [ 7] 1748 	ld	(bc),a
                           1749 ;src/main.c:366: enemy->iter++;
   7B82 1A            [ 7] 1750 	ld	a,(de)
   7B83 4F            [ 4] 1751 	ld	c,a
   7B84 0C            [ 4] 1752 	inc	c
   7B85 79            [ 4] 1753 	ld	a,c
   7B86 12            [ 7] 1754 	ld	(de),a
                           1755 ;src/main.c:367: enemy->y = enemy->camino[enemy->iter];
   7B87 69            [ 4] 1756 	ld	l,c
   7B88 26 00         [ 7] 1757 	ld	h,#0x00
   7B8A DD 7E FE      [19] 1758 	ld	a,-2 (ix)
   7B8D 85            [ 4] 1759 	add	a, l
   7B8E 6F            [ 4] 1760 	ld	l,a
   7B8F DD 7E FF      [19] 1761 	ld	a,-1 (ix)
   7B92 8C            [ 4] 1762 	adc	a, h
   7B93 67            [ 4] 1763 	ld	h,a
   7B94 46            [ 7] 1764 	ld	b,(hl)
   7B95 DD 6E FC      [19] 1765 	ld	l,-4 (ix)
   7B98 DD 66 FD      [19] 1766 	ld	h,-3 (ix)
   7B9B 70            [ 7] 1767 	ld	(hl),b
                           1768 ;src/main.c:368: enemy->iter++;
   7B9C 0C            [ 4] 1769 	inc	c
   7B9D 79            [ 4] 1770 	ld	a,c
   7B9E 12            [ 7] 1771 	ld	(de),a
                           1772 ;src/main.c:369: enemy->mover = SI;
   7B9F DD 6E FA      [19] 1773 	ld	l,-6 (ix)
   7BA2 DD 66 FB      [19] 1774 	ld	h,-5 (ix)
   7BA5 36 01         [10] 1775 	ld	(hl),#0x01
   7BA7 18 6C         [12] 1776 	jr	00112$
   7BA9                    1777 00102$:
                           1778 ;src/main.c:372: enemy->lastIter = enemy->iter - 1;
   7BA9 DD 4E F3      [19] 1779 	ld	c,-13 (ix)
   7BAC 0D            [ 4] 1780 	dec	c
   7BAD DD 6E F8      [19] 1781 	ld	l,-8 (ix)
   7BB0 DD 66 F9      [19] 1782 	ld	h,-7 (ix)
   7BB3 71            [ 7] 1783 	ld	(hl),c
                           1784 ;src/main.c:375: enemy->reversePatrol = 1;
   7BB4 DD 6E F4      [19] 1785 	ld	l,-12 (ix)
   7BB7 DD 66 F5      [19] 1786 	ld	h,-11 (ix)
   7BBA 36 01         [10] 1787 	ld	(hl),#0x01
   7BBC 18 57         [12] 1788 	jr	00112$
   7BBE                    1789 00108$:
                           1790 ;src/main.c:378: if(enemy->lastIter > 1){
   7BBE DD 6E F8      [19] 1791 	ld	l,-8 (ix)
   7BC1 DD 66 F9      [19] 1792 	ld	h,-7 (ix)
   7BC4 6E            [ 7] 1793 	ld	l,(hl)
   7BC5 3E 01         [ 7] 1794 	ld	a,#0x01
   7BC7 95            [ 4] 1795 	sub	a, l
   7BC8 30 41         [12] 1796 	jr	NC,00105$
                           1797 ;src/main.c:379: enemy->y = enemy->camino[enemy->lastIter];
   7BCA 26 00         [ 7] 1798 	ld	h,#0x00
   7BCC DD 5E FE      [19] 1799 	ld	e,-2 (ix)
   7BCF DD 56 FF      [19] 1800 	ld	d,-1 (ix)
   7BD2 19            [11] 1801 	add	hl,de
   7BD3 5E            [ 7] 1802 	ld	e,(hl)
   7BD4 DD 6E FC      [19] 1803 	ld	l,-4 (ix)
   7BD7 DD 66 FD      [19] 1804 	ld	h,-3 (ix)
   7BDA 73            [ 7] 1805 	ld	(hl),e
                           1806 ;src/main.c:380: enemy->lastIter--;
   7BDB DD 6E F8      [19] 1807 	ld	l,-8 (ix)
   7BDE DD 66 F9      [19] 1808 	ld	h,-7 (ix)
   7BE1 5E            [ 7] 1809 	ld	e,(hl)
   7BE2 1D            [ 4] 1810 	dec	e
   7BE3 DD 6E F8      [19] 1811 	ld	l,-8 (ix)
   7BE6 DD 66 F9      [19] 1812 	ld	h,-7 (ix)
   7BE9 73            [ 7] 1813 	ld	(hl),e
                           1814 ;src/main.c:381: enemy->x = enemy->camino[enemy->lastIter];
   7BEA 6B            [ 4] 1815 	ld	l,e
   7BEB 26 00         [ 7] 1816 	ld	h,#0x00
   7BED DD 7E FE      [19] 1817 	ld	a,-2 (ix)
   7BF0 85            [ 4] 1818 	add	a, l
   7BF1 6F            [ 4] 1819 	ld	l,a
   7BF2 DD 7E FF      [19] 1820 	ld	a,-1 (ix)
   7BF5 8C            [ 4] 1821 	adc	a, h
   7BF6 67            [ 4] 1822 	ld	h,a
   7BF7 7E            [ 7] 1823 	ld	a,(hl)
   7BF8 02            [ 7] 1824 	ld	(bc),a
                           1825 ;src/main.c:382: enemy->lastIter--;
   7BF9 1D            [ 4] 1826 	dec	e
   7BFA DD 6E F8      [19] 1827 	ld	l,-8 (ix)
   7BFD DD 66 F9      [19] 1828 	ld	h,-7 (ix)
   7C00 73            [ 7] 1829 	ld	(hl),e
                           1830 ;src/main.c:383: enemy->mover = SI;
   7C01 DD 6E FA      [19] 1831 	ld	l,-6 (ix)
   7C04 DD 66 FB      [19] 1832 	ld	h,-5 (ix)
   7C07 36 01         [10] 1833 	ld	(hl),#0x01
   7C09 18 0A         [12] 1834 	jr	00112$
   7C0B                    1835 00105$:
                           1836 ;src/main.c:386: enemy->iter = 0;
   7C0B AF            [ 4] 1837 	xor	a, a
   7C0C 12            [ 7] 1838 	ld	(de),a
                           1839 ;src/main.c:388: enemy->reversePatrol = 0;
   7C0D DD 6E F4      [19] 1840 	ld	l,-12 (ix)
   7C10 DD 66 F5      [19] 1841 	ld	h,-11 (ix)
   7C13 36 00         [10] 1842 	ld	(hl),#0x00
   7C15                    1843 00112$:
   7C15 DD F9         [10] 1844 	ld	sp, ix
   7C17 DD E1         [14] 1845 	pop	ix
   7C19 C9            [10] 1846 	ret
                           1847 ;src/main.c:395: void moverEnemigo(TEnemy *enemy){
                           1848 ;	---------------------------------
                           1849 ; Function moverEnemigo
                           1850 ; ---------------------------------
   7C1A                    1851 _moverEnemigo::
   7C1A DD E5         [15] 1852 	push	ix
   7C1C DD 21 00 00   [14] 1853 	ld	ix,#0
   7C20 DD 39         [15] 1854 	add	ix,sp
                           1855 ;src/main.c:396: if(!enemy->muerto){
   7C22 DD 4E 04      [19] 1856 	ld	c,4 (ix)
   7C25 DD 46 05      [19] 1857 	ld	b,5 (ix)
   7C28 C5            [11] 1858 	push	bc
   7C29 FD E1         [14] 1859 	pop	iy
   7C2B FD 7E 08      [19] 1860 	ld	a,8 (iy)
   7C2E B7            [ 4] 1861 	or	a, a
   7C2F 20 46         [12] 1862 	jr	NZ,00110$
                           1863 ;src/main.c:397: if(!checkEnemyCollision(enemy->mira, enemy)){
   7C31 21 07 00      [10] 1864 	ld	hl,#0x0007
   7C34 09            [11] 1865 	add	hl,bc
   7C35 5E            [ 7] 1866 	ld	e,(hl)
   7C36 16 00         [ 7] 1867 	ld	d,#0x00
   7C38 E5            [11] 1868 	push	hl
   7C39 C5            [11] 1869 	push	bc
   7C3A C5            [11] 1870 	push	bc
   7C3B D5            [11] 1871 	push	de
   7C3C CD AE 76      [17] 1872 	call	_checkEnemyCollision
   7C3F F1            [10] 1873 	pop	af
   7C40 F1            [10] 1874 	pop	af
   7C41 7D            [ 4] 1875 	ld	a,l
   7C42 C1            [10] 1876 	pop	bc
   7C43 E1            [10] 1877 	pop	hl
   7C44 B7            [ 4] 1878 	or	a, a
   7C45 20 30         [12] 1879 	jr	NZ,00110$
                           1880 ;src/main.c:399: switch (enemy->mira) {
   7C47 5E            [ 7] 1881 	ld	e,(hl)
   7C48 3E 03         [ 7] 1882 	ld	a,#0x03
   7C4A 93            [ 4] 1883 	sub	a, e
   7C4B 38 2A         [12] 1884 	jr	C,00110$
   7C4D 16 00         [ 7] 1885 	ld	d,#0x00
   7C4F 21 55 7C      [10] 1886 	ld	hl,#00124$
   7C52 19            [11] 1887 	add	hl,de
   7C53 19            [11] 1888 	add	hl,de
                           1889 ;src/main.c:401: case 0:
   7C54 E9            [ 4] 1890 	jp	(hl)
   7C55                    1891 00124$:
   7C55 18 06         [12] 1892 	jr	00101$
   7C57 18 0B         [12] 1893 	jr	00102$
   7C59 18 10         [12] 1894 	jr	00103$
   7C5B 18 15         [12] 1895 	jr	00104$
   7C5D                    1896 00101$:
                           1897 ;src/main.c:402: moverEnemigoDerecha(enemy);
   7C5D C5            [11] 1898 	push	bc
   7C5E CD BC 7A      [17] 1899 	call	_moverEnemigoDerecha
   7C61 F1            [10] 1900 	pop	af
                           1901 ;src/main.c:403: break;
   7C62 18 13         [12] 1902 	jr	00110$
                           1903 ;src/main.c:404: case 1:
   7C64                    1904 00102$:
                           1905 ;src/main.c:405: moverEnemigoIzquierda(enemy);
   7C64 C5            [11] 1906 	push	bc
   7C65 CD CC 7A      [17] 1907 	call	_moverEnemigoIzquierda
   7C68 F1            [10] 1908 	pop	af
                           1909 ;src/main.c:406: break;
   7C69 18 0C         [12] 1910 	jr	00110$
                           1911 ;src/main.c:407: case 2:
   7C6B                    1912 00103$:
                           1913 ;src/main.c:408: moverEnemigoArriba(enemy);
   7C6B C5            [11] 1914 	push	bc
   7C6C CD 7E 7A      [17] 1915 	call	_moverEnemigoArriba
   7C6F F1            [10] 1916 	pop	af
                           1917 ;src/main.c:409: break;
   7C70 18 05         [12] 1918 	jr	00110$
                           1919 ;src/main.c:410: case 3:
   7C72                    1920 00104$:
                           1921 ;src/main.c:411: moverEnemigoAbajo(enemy);
   7C72 C5            [11] 1922 	push	bc
   7C73 CD 9D 7A      [17] 1923 	call	_moverEnemigoAbajo
   7C76 F1            [10] 1924 	pop	af
                           1925 ;src/main.c:413: }
   7C77                    1926 00110$:
   7C77 DD E1         [14] 1927 	pop	ix
   7C79 C9            [10] 1928 	ret
                           1929 ;src/main.c:418: void lookFor(TEnemy *enemy) {
                           1930 ;	---------------------------------
                           1931 ; Function lookFor
                           1932 ; ---------------------------------
   7C7A                    1933 _lookFor::
   7C7A DD E5         [15] 1934 	push	ix
   7C7C DD 21 00 00   [14] 1935 	ld	ix,#0
   7C80 DD 39         [15] 1936 	add	ix,sp
   7C82 3B            [ 6] 1937 	dec	sp
                           1938 ;src/main.c:421: u8 difx = abs(enemy->x - prota.x);
   7C83 DD 5E 04      [19] 1939 	ld	e,4 (ix)
   7C86 DD 56 05      [19] 1940 	ld	d,5 (ix)
   7C89 1A            [ 7] 1941 	ld	a,(de)
   7C8A 4F            [ 4] 1942 	ld	c,a
   7C8B 06 00         [ 7] 1943 	ld	b,#0x00
   7C8D 21 CB 69      [10] 1944 	ld	hl,#_prota+0
   7C90 6E            [ 7] 1945 	ld	l,(hl)
   7C91 26 00         [ 7] 1946 	ld	h,#0x00
   7C93 79            [ 4] 1947 	ld	a,c
   7C94 95            [ 4] 1948 	sub	a, l
   7C95 4F            [ 4] 1949 	ld	c,a
   7C96 78            [ 4] 1950 	ld	a,b
   7C97 9C            [ 4] 1951 	sbc	a, h
   7C98 47            [ 4] 1952 	ld	b,a
   7C99 D5            [11] 1953 	push	de
   7C9A C5            [11] 1954 	push	bc
   7C9B CD E2 4B      [17] 1955 	call	_abs
   7C9E F1            [10] 1956 	pop	af
   7C9F D1            [10] 1957 	pop	de
   7CA0 DD 75 FF      [19] 1958 	ld	-1 (ix),l
                           1959 ;src/main.c:422: u8 dify = abs(enemy->y - prota.y);
   7CA3 6B            [ 4] 1960 	ld	l, e
   7CA4 62            [ 4] 1961 	ld	h, d
   7CA5 23            [ 6] 1962 	inc	hl
   7CA6 4E            [ 7] 1963 	ld	c,(hl)
   7CA7 06 00         [ 7] 1964 	ld	b,#0x00
   7CA9 21 CC 69      [10] 1965 	ld	hl,#_prota+1
   7CAC 6E            [ 7] 1966 	ld	l,(hl)
   7CAD 26 00         [ 7] 1967 	ld	h,#0x00
   7CAF 79            [ 4] 1968 	ld	a,c
   7CB0 95            [ 4] 1969 	sub	a, l
   7CB1 4F            [ 4] 1970 	ld	c,a
   7CB2 78            [ 4] 1971 	ld	a,b
   7CB3 9C            [ 4] 1972 	sbc	a, h
   7CB4 47            [ 4] 1973 	ld	b,a
   7CB5 D5            [11] 1974 	push	de
   7CB6 C5            [11] 1975 	push	bc
   7CB7 CD E2 4B      [17] 1976 	call	_abs
   7CBA F1            [10] 1977 	pop	af
   7CBB D1            [10] 1978 	pop	de
                           1979 ;src/main.c:423: dist = difx + dify; // manhattan
   7CBC DD 7E FF      [19] 1980 	ld	a,-1 (ix)
   7CBF 85            [ 4] 1981 	add	a, l
   7CC0 4F            [ 4] 1982 	ld	c,a
                           1983 ;src/main.c:426: enemy->seen = 1;
   7CC1 21 11 00      [10] 1984 	ld	hl,#0x0011
   7CC4 19            [11] 1985 	add	hl,de
                           1986 ;src/main.c:427: enemy->inRange = 1;
   7CC5 7B            [ 4] 1987 	ld	a,e
   7CC6 C6 10         [ 7] 1988 	add	a, #0x10
   7CC8 5F            [ 4] 1989 	ld	e,a
   7CC9 7A            [ 4] 1990 	ld	a,d
   7CCA CE 00         [ 7] 1991 	adc	a, #0x00
   7CCC 57            [ 4] 1992 	ld	d,a
                           1993 ;src/main.c:425: if (dist <= 5) {// te tiene en rango
   7CCD 3E 05         [ 7] 1994 	ld	a,#0x05
   7CCF 91            [ 4] 1995 	sub	a, c
   7CD0 38 07         [12] 1996 	jr	C,00105$
                           1997 ;src/main.c:426: enemy->seen = 1;
   7CD2 36 01         [10] 1998 	ld	(hl),#0x01
                           1999 ;src/main.c:427: enemy->inRange = 1;
   7CD4 3E 01         [ 7] 2000 	ld	a,#0x01
   7CD6 12            [ 7] 2001 	ld	(de),a
   7CD7 18 0F         [12] 2002 	jr	00107$
   7CD9                    2003 00105$:
                           2004 ;src/main.c:428: } else if(dist < 10) { // te ve pero no estas en rango (hay que arreglar la vision)
   7CD9 79            [ 4] 2005 	ld	a,c
   7CDA D6 0A         [ 7] 2006 	sub	a, #0x0A
   7CDC 30 06         [12] 2007 	jr	NC,00102$
                           2008 ;src/main.c:429: enemy->seen = 1;
   7CDE 36 01         [10] 2009 	ld	(hl),#0x01
                           2010 ;src/main.c:430: enemy->inRange = 0;
   7CE0 AF            [ 4] 2011 	xor	a, a
   7CE1 12            [ 7] 2012 	ld	(de),a
   7CE2 18 04         [12] 2013 	jr	00107$
   7CE4                    2014 00102$:
                           2015 ;src/main.c:432: enemy->seen = 0;
   7CE4 36 00         [10] 2016 	ld	(hl),#0x00
                           2017 ;src/main.c:433: enemy->inRange = 0;
   7CE6 AF            [ 4] 2018 	xor	a, a
   7CE7 12            [ 7] 2019 	ld	(de),a
   7CE8                    2020 00107$:
   7CE8 33            [ 6] 2021 	inc	sp
   7CE9 DD E1         [14] 2022 	pop	ix
   7CEB C9            [10] 2023 	ret
                           2024 ;src/main.c:437: void patrol(TEnemy *enemy) {
                           2025 ;	---------------------------------
                           2026 ; Function patrol
                           2027 ; ---------------------------------
   7CEC                    2028 _patrol::
                           2029 ;src/main.c:438: if (enemy->onPathPatrol) {
   7CEC D1            [10] 2030 	pop	de
   7CED C1            [10] 2031 	pop	bc
   7CEE C5            [11] 2032 	push	bc
   7CEF D5            [11] 2033 	push	de
   7CF0 C5            [11] 2034 	push	bc
   7CF1 FD E1         [14] 2035 	pop	iy
   7CF3 FD 7E 0C      [19] 2036 	ld	a,12 (iy)
   7CF6 B7            [ 4] 2037 	or	a, a
   7CF7 C8            [11] 2038 	ret	Z
                           2039 ;src/main.c:439: moverEnemigoPathfinding(enemy);
   7CF8 C5            [11] 2040 	push	bc
   7CF9 CD DE 7A      [17] 2041 	call	_moverEnemigoPathfinding
   7CFC F1            [10] 2042 	pop	af
   7CFD C9            [10] 2043 	ret
                           2044 ;src/main.c:443: void updateEnemies() {
                           2045 ;	---------------------------------
                           2046 ; Function updateEnemies
                           2047 ; ---------------------------------
   7CFE                    2048 _updateEnemies::
   7CFE DD E5         [15] 2049 	push	ix
   7D00 DD 21 00 00   [14] 2050 	ld	ix,#0
   7D04 DD 39         [15] 2051 	add	ix,sp
   7D06 21 F4 FF      [10] 2052 	ld	hl,#-12
   7D09 39            [11] 2053 	add	hl,sp
   7D0A F9            [ 6] 2054 	ld	sp,hl
                           2055 ;src/main.c:445: u8 i = 1 + 1;
   7D0B DD 36 F4 02   [19] 2056 	ld	-12 (ix),#0x02
                           2057 ;src/main.c:448: actual = enemy;
                           2058 ;src/main.c:450: while (--i) {
   7D0F DD 36 F9 BF   [19] 2059 	ld	-7 (ix),#<(_enemy)
   7D13 DD 36 FA 64   [19] 2060 	ld	-6 (ix),#>(_enemy)
   7D17 DD 36 F7 BF   [19] 2061 	ld	-9 (ix),#<(_enemy)
   7D1B DD 36 F8 64   [19] 2062 	ld	-8 (ix),#>(_enemy)
   7D1F DD 36 FB BF   [19] 2063 	ld	-5 (ix),#<(_enemy)
   7D23 DD 36 FC 64   [19] 2064 	ld	-4 (ix),#>(_enemy)
   7D27 DD 36 F5 BF   [19] 2065 	ld	-11 (ix),#<(_enemy)
   7D2B DD 36 F6 64   [19] 2066 	ld	-10 (ix),#>(_enemy)
   7D2F DD 36 FE BF   [19] 2067 	ld	-2 (ix),#<(_enemy)
   7D33 DD 36 FF 64   [19] 2068 	ld	-1 (ix),#>(_enemy)
   7D37                    2069 00121$:
   7D37 DD 7E F4      [19] 2070 	ld	a,-12 (ix)
   7D3A C6 FF         [ 7] 2071 	add	a,#0xFF
   7D3C DD 77 FD      [19] 2072 	ld	-3 (ix), a
   7D3F DD 77 F4      [19] 2073 	ld	-12 (ix),a
   7D42 DD 7E FD      [19] 2074 	ld	a,-3 (ix)
   7D45 B7            [ 4] 2075 	or	a, a
   7D46 28 76         [12] 2076 	jr	Z,00124$
                           2077 ;src/main.c:452: if (actual->patrolling) { // esta patrullando
   7D48 3A CA 64      [13] 2078 	ld	a, (#(_enemy + 0x000b) + 0)
   7D4B B7            [ 4] 2079 	or	a, a
   7D4C 28 40         [12] 2080 	jr	Z,00119$
                           2081 ;src/main.c:453: if (!actual->seen) {
   7D4E DD 6E F9      [19] 2082 	ld	l,-7 (ix)
   7D51 DD 66 FA      [19] 2083 	ld	h,-6 (ix)
   7D54 11 11 00      [10] 2084 	ld	de, #0x0011
   7D57 19            [11] 2085 	add	hl, de
   7D58 4E            [ 7] 2086 	ld	c,(hl)
   7D59 79            [ 4] 2087 	ld	a,c
   7D5A B7            [ 4] 2088 	or	a, a
   7D5B 20 0A         [12] 2089 	jr	NZ,00107$
                           2090 ;src/main.c:454: patrol(actual);
   7D5D 21 BF 64      [10] 2091 	ld	hl,#_enemy
   7D60 E5            [11] 2092 	push	hl
   7D61 CD EC 7C      [17] 2093 	call	_patrol
   7D64 F1            [10] 2094 	pop	af
   7D65 18 D0         [12] 2095 	jr	00121$
   7D67                    2096 00107$:
                           2097 ;src/main.c:458: actual->onPathPatrol = 0;
   7D67 11 CB 64      [10] 2098 	ld	de,#_enemy + 12
                           2099 ;src/main.c:455: } else if (actual->seen) {
   7D6A 79            [ 4] 2100 	ld	a,c
   7D6B B7            [ 4] 2101 	or	a, a
   7D6C 28 09         [12] 2102 	jr	Z,00104$
                           2103 ;src/main.c:457: actual->patrolling = 0;
   7D6E 21 CA 64      [10] 2104 	ld	hl,#(_enemy + 0x000b)
   7D71 36 00         [10] 2105 	ld	(hl),#0x00
                           2106 ;src/main.c:458: actual->onPathPatrol = 0;
   7D73 AF            [ 4] 2107 	xor	a, a
   7D74 12            [ 7] 2108 	ld	(de),a
   7D75 18 C0         [12] 2109 	jr	00121$
   7D77                    2110 00104$:
                           2111 ;src/main.c:459: } else if (actual->inRange) {
   7D77 DD 6E F7      [19] 2112 	ld	l,-9 (ix)
   7D7A DD 66 F8      [19] 2113 	ld	h,-8 (ix)
   7D7D 01 10 00      [10] 2114 	ld	bc, #0x0010
   7D80 09            [11] 2115 	add	hl, bc
   7D81 7E            [ 7] 2116 	ld	a,(hl)
   7D82 B7            [ 4] 2117 	or	a, a
   7D83 28 B2         [12] 2118 	jr	Z,00121$
                           2119 ;src/main.c:461: actual->patrolling = 0;
   7D85 21 CA 64      [10] 2120 	ld	hl,#(_enemy + 0x000b)
   7D88 36 00         [10] 2121 	ld	(hl),#0x00
                           2122 ;src/main.c:462: actual->onPathPatrol = 0;
   7D8A AF            [ 4] 2123 	xor	a, a
   7D8B 12            [ 7] 2124 	ld	(de),a
   7D8C 18 A9         [12] 2125 	jr	00121$
   7D8E                    2126 00119$:
                           2127 ;src/main.c:464: } else if (actual->seek) { // esta buscando
   7D8E DD 6E FB      [19] 2128 	ld	l,-5 (ix)
   7D91 DD 66 FC      [19] 2129 	ld	h,-4 (ix)
   7D94 11 13 00      [10] 2130 	ld	de, #0x0013
   7D97 19            [11] 2131 	add	hl, de
   7D98 7E            [ 7] 2132 	ld	a,(hl)
   7D99 B7            [ 4] 2133 	or	a, a
   7D9A 28 9B         [12] 2134 	jr	Z,00121$
                           2135 ;src/main.c:465: if (!actual->found && actual->seekTimer <= 5) {
   7D9C DD 6E F5      [19] 2136 	ld	l,-11 (ix)
   7D9F DD 66 F6      [19] 2137 	ld	h,-10 (ix)
   7DA2 11 12 00      [10] 2138 	ld	de, #0x0012
   7DA5 19            [11] 2139 	add	hl, de
   7DA6 7E            [ 7] 2140 	ld	a,(hl)
   7DA7 B7            [ 4] 2141 	or	a, a
   7DA8 20 8D         [12] 2142 	jr	NZ,00121$
   7DAA DD 6E FE      [19] 2143 	ld	l,-2 (ix)
   7DAD DD 66 FF      [19] 2144 	ld	h,-1 (ix)
   7DB0 11 14 00      [10] 2145 	ld	de, #0x0014
   7DB3 19            [11] 2146 	add	hl, de
   7DB4 4E            [ 7] 2147 	ld	c,(hl)
   7DB5 3E 05         [ 7] 2148 	ld	a,#0x05
   7DB7 91            [ 4] 2149 	sub	a, c
   7DB8 3E 00         [ 7] 2150 	ld	a,#0x00
   7DBA 17            [ 4] 2151 	rla
                           2152 ;src/main.c:469: } else if (actual->engage) {
   7DBB C3 37 7D      [10] 2153 	jp	00121$
   7DBE                    2154 00124$:
   7DBE DD F9         [10] 2155 	ld	sp, ix
   7DC0 DD E1         [14] 2156 	pop	ix
   7DC2 C9            [10] 2157 	ret
                           2158 ;src/main.c:478: void avanzarMapa() {
                           2159 ;	---------------------------------
                           2160 ; Function avanzarMapa
                           2161 ; ---------------------------------
   7DC3                    2162 _avanzarMapa::
                           2163 ;src/main.c:479: if(num_mapa < NUM_MAPAS -1) {
   7DC3 3A E0 69      [13] 2164 	ld	a,(#_num_mapa + 0)
   7DC6 D6 02         [ 7] 2165 	sub	a, #0x02
   7DC8 D2 28 73      [10] 2166 	jp	NC,_menuFin
                           2167 ;src/main.c:480: mapa = mapas[++num_mapa];
   7DCB 21 E0 69      [10] 2168 	ld	hl, #_num_mapa+0
   7DCE 34            [11] 2169 	inc	(hl)
   7DCF FD 21 E0 69   [14] 2170 	ld	iy,#_num_mapa
   7DD3 FD 6E 00      [19] 2171 	ld	l,0 (iy)
   7DD6 26 00         [ 7] 2172 	ld	h,#0x00
   7DD8 29            [11] 2173 	add	hl, hl
   7DD9 11 7E 72      [10] 2174 	ld	de,#_mapas
   7DDC 19            [11] 2175 	add	hl,de
   7DDD 7E            [ 7] 2176 	ld	a,(hl)
   7DDE FD 21 DE 69   [14] 2177 	ld	iy,#_mapa
   7DE2 FD 77 00      [19] 2178 	ld	0 (iy),a
   7DE5 23            [ 6] 2179 	inc	hl
   7DE6 7E            [ 7] 2180 	ld	a,(hl)
   7DE7 32 DF 69      [13] 2181 	ld	(#_mapa + 1),a
                           2182 ;src/main.c:481: prota.x = prota.px = 2;
   7DEA 21 CD 69      [10] 2183 	ld	hl,#(_prota + 0x0002)
   7DED 36 02         [10] 2184 	ld	(hl),#0x02
   7DEF 21 CB 69      [10] 2185 	ld	hl,#_prota
   7DF2 36 02         [10] 2186 	ld	(hl),#0x02
                           2187 ;src/main.c:482: prota.mover = SI;
   7DF4 21 D1 69      [10] 2188 	ld	hl,#(_prota + 0x0006)
   7DF7 36 01         [10] 2189 	ld	(hl),#0x01
                           2190 ;src/main.c:483: dibujarMapa();
   7DF9 CD 68 72      [17] 2191 	call	_dibujarMapa
                           2192 ;src/main.c:484: inicializarEnemy();
   7DFC C3 E3 83      [10] 2193 	jp  _inicializarEnemy
                           2194 ;src/main.c:488: menuFin();
   7DFF C3 28 73      [10] 2195 	jp  _menuFin
                           2196 ;src/main.c:492: void moverIzquierda() {
                           2197 ;	---------------------------------
                           2198 ; Function moverIzquierda
                           2199 ; ---------------------------------
   7E02                    2200 _moverIzquierda::
                           2201 ;src/main.c:493: prota.mira = M_izquierda;
   7E02 01 CB 69      [10] 2202 	ld	bc,#_prota+0
   7E05 21 D2 69      [10] 2203 	ld	hl,#(_prota + 0x0007)
   7E08 36 01         [10] 2204 	ld	(hl),#0x01
                           2205 ;src/main.c:494: if (!checkCollision(M_izquierda)) {
   7E0A C5            [11] 2206 	push	bc
   7E0B 21 01 00      [10] 2207 	ld	hl,#0x0001
   7E0E E5            [11] 2208 	push	hl
   7E0F CD B4 73      [17] 2209 	call	_checkCollision
   7E12 F1            [10] 2210 	pop	af
   7E13 C1            [10] 2211 	pop	bc
   7E14 7D            [ 4] 2212 	ld	a,l
   7E15 B7            [ 4] 2213 	or	a, a
   7E16 C0            [11] 2214 	ret	NZ
                           2215 ;src/main.c:495: prota.x--;
   7E17 0A            [ 7] 2216 	ld	a,(bc)
   7E18 C6 FF         [ 7] 2217 	add	a,#0xFF
   7E1A 02            [ 7] 2218 	ld	(bc),a
                           2219 ;src/main.c:496: prota.mover = SI;
   7E1B 21 D1 69      [10] 2220 	ld	hl,#(_prota + 0x0006)
   7E1E 36 01         [10] 2221 	ld	(hl),#0x01
                           2222 ;src/main.c:497: prota.sprite = g_hero_left;
   7E20 21 FE 49      [10] 2223 	ld	hl,#_g_hero_left
   7E23 22 CF 69      [16] 2224 	ld	((_prota + 0x0004)), hl
   7E26 C9            [10] 2225 	ret
                           2226 ;src/main.c:501: void moverDerecha() {
                           2227 ;	---------------------------------
                           2228 ; Function moverDerecha
                           2229 ; ---------------------------------
   7E27                    2230 _moverDerecha::
                           2231 ;src/main.c:502: prota.mira = M_derecha;
   7E27 21 D2 69      [10] 2232 	ld	hl,#(_prota + 0x0007)
   7E2A 36 00         [10] 2233 	ld	(hl),#0x00
                           2234 ;src/main.c:503: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7E2C 21 00 00      [10] 2235 	ld	hl,#0x0000
   7E2F E5            [11] 2236 	push	hl
   7E30 CD B4 73      [17] 2237 	call	_checkCollision
   7E33 F1            [10] 2238 	pop	af
   7E34 45            [ 4] 2239 	ld	b,l
   7E35 21 CB 69      [10] 2240 	ld	hl, #_prota + 0
   7E38 4E            [ 7] 2241 	ld	c,(hl)
   7E39 59            [ 4] 2242 	ld	e,c
   7E3A 16 00         [ 7] 2243 	ld	d,#0x00
   7E3C 21 07 00      [10] 2244 	ld	hl,#0x0007
   7E3F 19            [11] 2245 	add	hl,de
   7E40 11 50 80      [10] 2246 	ld	de, #0x8050
   7E43 29            [11] 2247 	add	hl, hl
   7E44 3F            [ 4] 2248 	ccf
   7E45 CB 1C         [ 8] 2249 	rr	h
   7E47 CB 1D         [ 8] 2250 	rr	l
   7E49 ED 52         [15] 2251 	sbc	hl, de
   7E4B 3E 00         [ 7] 2252 	ld	a,#0x00
   7E4D 17            [ 4] 2253 	rla
   7E4E 5F            [ 4] 2254 	ld	e,a
   7E4F 78            [ 4] 2255 	ld	a,b
   7E50 B7            [ 4] 2256 	or	a,a
   7E51 20 14         [12] 2257 	jr	NZ,00104$
   7E53 B3            [ 4] 2258 	or	a,e
   7E54 28 11         [12] 2259 	jr	Z,00104$
                           2260 ;src/main.c:504: prota.x++;
   7E56 0C            [ 4] 2261 	inc	c
   7E57 21 CB 69      [10] 2262 	ld	hl,#_prota
   7E5A 71            [ 7] 2263 	ld	(hl),c
                           2264 ;src/main.c:505: prota.mover = SI;
   7E5B 21 D1 69      [10] 2265 	ld	hl,#(_prota + 0x0006)
   7E5E 36 01         [10] 2266 	ld	(hl),#0x01
                           2267 ;src/main.c:506: prota.sprite = g_hero;
   7E60 21 A8 4A      [10] 2268 	ld	hl,#_g_hero
   7E63 22 CF 69      [16] 2269 	ld	((_prota + 0x0004)), hl
   7E66 C9            [10] 2270 	ret
   7E67                    2271 00104$:
                           2272 ;src/main.c:508: }else if( prota.x + G_HERO_W >= 80){
   7E67 7B            [ 4] 2273 	ld	a,e
   7E68 B7            [ 4] 2274 	or	a, a
   7E69 C0            [11] 2275 	ret	NZ
                           2276 ;src/main.c:509: avanzarMapa();
   7E6A C3 C3 7D      [10] 2277 	jp  _avanzarMapa
                           2278 ;src/main.c:513: void moverArriba() {
                           2279 ;	---------------------------------
                           2280 ; Function moverArriba
                           2281 ; ---------------------------------
   7E6D                    2282 _moverArriba::
                           2283 ;src/main.c:514: prota.mira = M_arriba;
   7E6D 21 D2 69      [10] 2284 	ld	hl,#(_prota + 0x0007)
   7E70 36 02         [10] 2285 	ld	(hl),#0x02
                           2286 ;src/main.c:515: if (!checkCollision(M_arriba)) { // TODO: COMPROBAR
   7E72 21 02 00      [10] 2287 	ld	hl,#0x0002
   7E75 E5            [11] 2288 	push	hl
   7E76 CD B4 73      [17] 2289 	call	_checkCollision
   7E79 F1            [10] 2290 	pop	af
   7E7A 7D            [ 4] 2291 	ld	a,l
   7E7B B7            [ 4] 2292 	or	a, a
   7E7C C0            [11] 2293 	ret	NZ
                           2294 ;src/main.c:516: prota.y--;
   7E7D 21 CC 69      [10] 2295 	ld	hl,#_prota + 1
   7E80 4E            [ 7] 2296 	ld	c,(hl)
   7E81 0D            [ 4] 2297 	dec	c
   7E82 71            [ 7] 2298 	ld	(hl),c
                           2299 ;src/main.c:517: prota.y--;
   7E83 0D            [ 4] 2300 	dec	c
   7E84 71            [ 7] 2301 	ld	(hl),c
                           2302 ;src/main.c:518: prota.mover  = SI;
   7E85 21 D1 69      [10] 2303 	ld	hl,#(_prota + 0x0006)
   7E88 36 01         [10] 2304 	ld	(hl),#0x01
                           2305 ;src/main.c:519: prota.sprite = g_hero_up;
   7E8A 21 64 49      [10] 2306 	ld	hl,#_g_hero_up
   7E8D 22 CF 69      [16] 2307 	ld	((_prota + 0x0004)), hl
   7E90 C9            [10] 2308 	ret
                           2309 ;src/main.c:523: void moverAbajo() {
                           2310 ;	---------------------------------
                           2311 ; Function moverAbajo
                           2312 ; ---------------------------------
   7E91                    2313 _moverAbajo::
                           2314 ;src/main.c:524: prota.mira = M_abajo;
   7E91 21 D2 69      [10] 2315 	ld	hl,#(_prota + 0x0007)
   7E94 36 03         [10] 2316 	ld	(hl),#0x03
                           2317 ;src/main.c:525: if (!checkCollision(M_abajo) ) { // TODO: COMPROBAR
   7E96 21 03 00      [10] 2318 	ld	hl,#0x0003
   7E99 E5            [11] 2319 	push	hl
   7E9A CD B4 73      [17] 2320 	call	_checkCollision
   7E9D F1            [10] 2321 	pop	af
   7E9E 7D            [ 4] 2322 	ld	a,l
   7E9F B7            [ 4] 2323 	or	a, a
   7EA0 C0            [11] 2324 	ret	NZ
                           2325 ;src/main.c:526: prota.y++;
   7EA1 01 CC 69      [10] 2326 	ld	bc,#_prota + 1
   7EA4 0A            [ 7] 2327 	ld	a,(bc)
   7EA5 3C            [ 4] 2328 	inc	a
   7EA6 02            [ 7] 2329 	ld	(bc),a
                           2330 ;src/main.c:527: prota.y++;
   7EA7 3C            [ 4] 2331 	inc	a
   7EA8 02            [ 7] 2332 	ld	(bc),a
                           2333 ;src/main.c:528: prota.mover  = SI;
   7EA9 21 D1 69      [10] 2334 	ld	hl,#(_prota + 0x0006)
   7EAC 36 01         [10] 2335 	ld	(hl),#0x01
                           2336 ;src/main.c:529: prota.sprite = g_hero_down;
   7EAE 21 CA 48      [10] 2337 	ld	hl,#_g_hero_down
   7EB1 22 CF 69      [16] 2338 	ld	((_prota + 0x0004)), hl
   7EB4 C9            [10] 2339 	ret
                           2340 ;src/main.c:533: void dibujarCuchillo() {
                           2341 ;	---------------------------------
                           2342 ; Function dibujarCuchillo
                           2343 ; ---------------------------------
   7EB5                    2344 _dibujarCuchillo::
   7EB5 DD E5         [15] 2345 	push	ix
   7EB7 DD 21 00 00   [14] 2346 	ld	ix,#0
   7EBB DD 39         [15] 2347 	add	ix,sp
   7EBD F5            [11] 2348 	push	af
                           2349 ;src/main.c:534: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   7EBE 21 D4 69      [10] 2350 	ld	hl, #_cu + 1
   7EC1 56            [ 7] 2351 	ld	d,(hl)
   7EC2 21 D3 69      [10] 2352 	ld	hl, #_cu + 0
   7EC5 46            [ 7] 2353 	ld	b,(hl)
   7EC6 D5            [11] 2354 	push	de
   7EC7 33            [ 6] 2355 	inc	sp
   7EC8 C5            [11] 2356 	push	bc
   7EC9 33            [ 6] 2357 	inc	sp
   7ECA 21 00 C0      [10] 2358 	ld	hl,#0xC000
   7ECD E5            [11] 2359 	push	hl
   7ECE CD 62 64      [17] 2360 	call	_cpct_getScreenPtr
   7ED1 45            [ 4] 2361 	ld	b,l
   7ED2 5C            [ 4] 2362 	ld	e,h
                           2363 ;src/main.c:535: if(cu.eje == E_X){
   7ED3 21 DB 69      [10] 2364 	ld	hl, #_cu + 8
   7ED6 4E            [ 7] 2365 	ld	c,(hl)
                           2366 ;src/main.c:536: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   7ED7 DD 70 FE      [19] 2367 	ld	-2 (ix),b
   7EDA DD 73 FF      [19] 2368 	ld	-1 (ix),e
                           2369 ;src/main.c:535: if(cu.eje == E_X){
   7EDD 79            [ 4] 2370 	ld	a,c
   7EDE B7            [ 4] 2371 	or	a, a
   7EDF 20 19         [12] 2372 	jr	NZ,00104$
                           2373 ;src/main.c:536: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   7EE1 11 00 0E      [10] 2374 	ld	de,#_g_tablatrans+0
   7EE4 ED 4B D7 69   [20] 2375 	ld	bc, (#(_cu + 0x0004) + 0)
   7EE8 D5            [11] 2376 	push	de
   7EE9 21 04 04      [10] 2377 	ld	hl,#0x0404
   7EEC E5            [11] 2378 	push	hl
   7EED DD 6E FE      [19] 2379 	ld	l,-2 (ix)
   7EF0 DD 66 FF      [19] 2380 	ld	h,-1 (ix)
   7EF3 E5            [11] 2381 	push	hl
   7EF4 C5            [11] 2382 	push	bc
   7EF5 CD 82 64      [17] 2383 	call	_cpct_drawSpriteMaskedAlignedTable
   7EF8 18 1A         [12] 2384 	jr	00106$
   7EFA                    2385 00104$:
                           2386 ;src/main.c:539: else if(cu.eje == E_Y){
   7EFA 0D            [ 4] 2387 	dec	c
   7EFB 20 17         [12] 2388 	jr	NZ,00106$
                           2389 ;src/main.c:540: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   7EFD 11 00 0E      [10] 2390 	ld	de,#_g_tablatrans+0
   7F00 ED 4B D7 69   [20] 2391 	ld	bc, (#(_cu + 0x0004) + 0)
   7F04 D5            [11] 2392 	push	de
   7F05 21 02 08      [10] 2393 	ld	hl,#0x0802
   7F08 E5            [11] 2394 	push	hl
   7F09 DD 6E FE      [19] 2395 	ld	l,-2 (ix)
   7F0C DD 66 FF      [19] 2396 	ld	h,-1 (ix)
   7F0F E5            [11] 2397 	push	hl
   7F10 C5            [11] 2398 	push	bc
   7F11 CD 82 64      [17] 2399 	call	_cpct_drawSpriteMaskedAlignedTable
   7F14                    2400 00106$:
   7F14 DD F9         [10] 2401 	ld	sp, ix
   7F16 DD E1         [14] 2402 	pop	ix
   7F18 C9            [10] 2403 	ret
                           2404 ;src/main.c:544: void borrarCuchillo() {
                           2405 ;	---------------------------------
                           2406 ; Function borrarCuchillo
                           2407 ; ---------------------------------
   7F19                    2408 _borrarCuchillo::
   7F19 DD E5         [15] 2409 	push	ix
   7F1B DD 21 00 00   [14] 2410 	ld	ix,#0
   7F1F DD 39         [15] 2411 	add	ix,sp
   7F21 F5            [11] 2412 	push	af
   7F22 3B            [ 6] 2413 	dec	sp
                           2414 ;src/main.c:546: u8 w = 2 + (cu.px & 1);
   7F23 21 D5 69      [10] 2415 	ld	hl, #_cu + 2
   7F26 4E            [ 7] 2416 	ld	c,(hl)
   7F27 79            [ 4] 2417 	ld	a,c
   7F28 E6 01         [ 7] 2418 	and	a, #0x01
   7F2A 47            [ 4] 2419 	ld	b,a
   7F2B 04            [ 4] 2420 	inc	b
   7F2C 04            [ 4] 2421 	inc	b
                           2422 ;src/main.c:547: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   7F2D 21 D6 69      [10] 2423 	ld	hl, #_cu + 3
   7F30 5E            [ 7] 2424 	ld	e,(hl)
   7F31 7B            [ 4] 2425 	ld	a,e
   7F32 E6 03         [ 7] 2426 	and	a, #0x03
   7F34 28 04         [12] 2427 	jr	Z,00105$
   7F36 3E 01         [ 7] 2428 	ld	a,#0x01
   7F38 18 02         [12] 2429 	jr	00106$
   7F3A                    2430 00105$:
   7F3A 3E 00         [ 7] 2431 	ld	a,#0x00
   7F3C                    2432 00106$:
   7F3C C6 02         [ 7] 2433 	add	a, #0x02
   7F3E DD 77 FD      [19] 2434 	ld	-3 (ix),a
                           2435 ;src/main.c:548: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   7F41 FD 2A DE 69   [20] 2436 	ld	iy,(_mapa)
   7F45 16 00         [ 7] 2437 	ld	d,#0x00
   7F47 7B            [ 4] 2438 	ld	a,e
   7F48 C6 E8         [ 7] 2439 	add	a,#0xE8
   7F4A DD 77 FE      [19] 2440 	ld	-2 (ix),a
   7F4D 7A            [ 4] 2441 	ld	a,d
   7F4E CE FF         [ 7] 2442 	adc	a,#0xFF
   7F50 DD 77 FF      [19] 2443 	ld	-1 (ix),a
   7F53 DD 6E FE      [19] 2444 	ld	l,-2 (ix)
   7F56 DD 66 FF      [19] 2445 	ld	h,-1 (ix)
   7F59 DD CB FF 7E   [20] 2446 	bit	7, -1 (ix)
   7F5D 28 04         [12] 2447 	jr	Z,00107$
   7F5F 21 EB FF      [10] 2448 	ld	hl,#0xFFEB
   7F62 19            [11] 2449 	add	hl,de
   7F63                    2450 00107$:
   7F63 CB 2C         [ 8] 2451 	sra	h
   7F65 CB 1D         [ 8] 2452 	rr	l
   7F67 CB 2C         [ 8] 2453 	sra	h
   7F69 CB 1D         [ 8] 2454 	rr	l
   7F6B 55            [ 4] 2455 	ld	d,l
   7F6C CB 39         [ 8] 2456 	srl	c
   7F6E FD E5         [15] 2457 	push	iy
   7F70 21 F0 C0      [10] 2458 	ld	hl,#0xC0F0
   7F73 E5            [11] 2459 	push	hl
   7F74 3E 28         [ 7] 2460 	ld	a,#0x28
   7F76 F5            [11] 2461 	push	af
   7F77 33            [ 6] 2462 	inc	sp
   7F78 DD 7E FD      [19] 2463 	ld	a,-3 (ix)
   7F7B F5            [11] 2464 	push	af
   7F7C 33            [ 6] 2465 	inc	sp
   7F7D C5            [11] 2466 	push	bc
   7F7E 33            [ 6] 2467 	inc	sp
   7F7F D5            [11] 2468 	push	de
   7F80 33            [ 6] 2469 	inc	sp
   7F81 79            [ 4] 2470 	ld	a,c
   7F82 F5            [11] 2471 	push	af
   7F83 33            [ 6] 2472 	inc	sp
   7F84 CD 5B 59      [17] 2473 	call	_cpct_etm_drawTileBox2x4
                           2474 ;src/main.c:549: if(!cu.mover){
   7F87 3A DC 69      [13] 2475 	ld	a, (#_cu + 9)
   7F8A B7            [ 4] 2476 	or	a, a
   7F8B 20 05         [12] 2477 	jr	NZ,00103$
                           2478 ;src/main.c:550: cu.lanzado = NO;
   7F8D 21 D9 69      [10] 2479 	ld	hl,#(_cu + 0x0006)
   7F90 36 00         [10] 2480 	ld	(hl),#0x00
   7F92                    2481 00103$:
   7F92 DD F9         [10] 2482 	ld	sp, ix
   7F94 DD E1         [14] 2483 	pop	ix
   7F96 C9            [10] 2484 	ret
                           2485 ;src/main.c:554: void redibujarCuchillo( ) {
                           2486 ;	---------------------------------
                           2487 ; Function redibujarCuchillo
                           2488 ; ---------------------------------
   7F97                    2489 _redibujarCuchillo::
                           2490 ;src/main.c:555: borrarCuchillo();
   7F97 CD 19 7F      [17] 2491 	call	_borrarCuchillo
                           2492 ;src/main.c:556: cu.px = cu.x;
   7F9A 01 D5 69      [10] 2493 	ld	bc,#_cu + 2
   7F9D 3A D3 69      [13] 2494 	ld	a, (#_cu + 0)
   7FA0 02            [ 7] 2495 	ld	(bc),a
                           2496 ;src/main.c:557: cu.py = cu.y;
   7FA1 01 D6 69      [10] 2497 	ld	bc,#_cu + 3
   7FA4 3A D4 69      [13] 2498 	ld	a, (#_cu + 1)
   7FA7 02            [ 7] 2499 	ld	(bc),a
                           2500 ;src/main.c:558: dibujarCuchillo();
   7FA8 C3 B5 7E      [10] 2501 	jp  _dibujarCuchillo
                           2502 ;src/main.c:561: void lanzarCuchillo(){
                           2503 ;	---------------------------------
                           2504 ; Function lanzarCuchillo
                           2505 ; ---------------------------------
   7FAB                    2506 _lanzarCuchillo::
                           2507 ;src/main.c:563: if(!cu.lanzado){
   7FAB 3A D9 69      [13] 2508 	ld	a, (#(_cu + 0x0006) + 0)
   7FAE B7            [ 4] 2509 	or	a, a
   7FAF C0            [11] 2510 	ret	NZ
                           2511 ;src/main.c:565: if(prota.mira == M_derecha){
   7FB0 21 D2 69      [10] 2512 	ld	hl, #_prota + 7
   7FB3 5E            [ 7] 2513 	ld	e,(hl)
                           2514 ;src/main.c:566: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   7FB4 01 CC 69      [10] 2515 	ld	bc,#_prota + 1
                           2516 ;src/main.c:568: cu.direccion = M_derecha;
                           2517 ;src/main.c:570: cu.y=prota.y + G_HERO_H /2;
                           2518 ;src/main.c:571: cu.sprite=g_knifeX_0;
                           2519 ;src/main.c:572: cu.eje = E_X;
                           2520 ;src/main.c:565: if(prota.mira == M_derecha){
   7FB7 7B            [ 4] 2521 	ld	a,e
   7FB8 B7            [ 4] 2522 	or	a, a
   7FB9 20 41         [12] 2523 	jr	NZ,00118$
                           2524 ;src/main.c:566: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   7FBB 0A            [ 7] 2525 	ld	a,(bc)
   7FBC C6 0B         [ 7] 2526 	add	a, #0x0B
   7FBE 5F            [ 4] 2527 	ld	e,a
   7FBF 3A CB 69      [13] 2528 	ld	a, (#_prota + 0)
   7FC2 C6 0C         [ 7] 2529 	add	a, #0x0C
   7FC4 6F            [ 4] 2530 	ld	l,a
   7FC5 C5            [11] 2531 	push	bc
   7FC6 7B            [ 4] 2532 	ld	a,e
   7FC7 F5            [11] 2533 	push	af
   7FC8 33            [ 6] 2534 	inc	sp
   7FC9 7D            [ 4] 2535 	ld	a,l
   7FCA F5            [11] 2536 	push	af
   7FCB 33            [ 6] 2537 	inc	sp
   7FCC CD 73 73      [17] 2538 	call	_getTilePtr
   7FCF F1            [10] 2539 	pop	af
   7FD0 C1            [10] 2540 	pop	bc
   7FD1 5E            [ 7] 2541 	ld	e,(hl)
   7FD2 3E 02         [ 7] 2542 	ld	a,#0x02
   7FD4 93            [ 4] 2543 	sub	a, e
   7FD5 D8            [11] 2544 	ret	C
                           2545 ;src/main.c:567: cu.lanzado = SI;
   7FD6 21 D9 69      [10] 2546 	ld	hl,#(_cu + 0x0006)
   7FD9 36 01         [10] 2547 	ld	(hl),#0x01
                           2548 ;src/main.c:568: cu.direccion = M_derecha;
   7FDB 21 DA 69      [10] 2549 	ld	hl,#(_cu + 0x0007)
   7FDE 36 00         [10] 2550 	ld	(hl),#0x00
                           2551 ;src/main.c:569: cu.x=prota.x + G_HERO_W;
   7FE0 3A CB 69      [13] 2552 	ld	a, (#_prota + 0)
   7FE3 C6 07         [ 7] 2553 	add	a, #0x07
   7FE5 32 D3 69      [13] 2554 	ld	(#_cu),a
                           2555 ;src/main.c:570: cu.y=prota.y + G_HERO_H /2;
   7FE8 0A            [ 7] 2556 	ld	a,(bc)
   7FE9 C6 0B         [ 7] 2557 	add	a, #0x0B
   7FEB 32 D4 69      [13] 2558 	ld	(#(_cu + 0x0001)),a
                           2559 ;src/main.c:571: cu.sprite=g_knifeX_0;
   7FEE 21 C0 24      [10] 2560 	ld	hl,#_g_knifeX_0
   7FF1 22 D7 69      [16] 2561 	ld	((_cu + 0x0004)), hl
                           2562 ;src/main.c:572: cu.eje = E_X;
   7FF4 21 DB 69      [10] 2563 	ld	hl,#(_cu + 0x0008)
   7FF7 36 00         [10] 2564 	ld	(hl),#0x00
                           2565 ;src/main.c:573: dibujarCuchillo();
   7FF9 C3 B5 7E      [10] 2566 	jp  _dibujarCuchillo
   7FFC                    2567 00118$:
                           2568 ;src/main.c:576: else if(prota.mira == M_izquierda){
   7FFC 7B            [ 4] 2569 	ld	a,e
   7FFD 3D            [ 4] 2570 	dec	a
   7FFE 20 41         [12] 2571 	jr	NZ,00115$
                           2572 ;src/main.c:577: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   8000 0A            [ 7] 2573 	ld	a,(bc)
   8001 C6 0B         [ 7] 2574 	add	a, #0x0B
   8003 5F            [ 4] 2575 	ld	e,a
   8004 3A CB 69      [13] 2576 	ld	a, (#_prota + 0)
   8007 C6 F6         [ 7] 2577 	add	a,#0xF6
   8009 6F            [ 4] 2578 	ld	l,a
   800A C5            [11] 2579 	push	bc
   800B 7B            [ 4] 2580 	ld	a,e
   800C F5            [11] 2581 	push	af
   800D 33            [ 6] 2582 	inc	sp
   800E 7D            [ 4] 2583 	ld	a,l
   800F F5            [11] 2584 	push	af
   8010 33            [ 6] 2585 	inc	sp
   8011 CD 73 73      [17] 2586 	call	_getTilePtr
   8014 F1            [10] 2587 	pop	af
   8015 C1            [10] 2588 	pop	bc
   8016 5E            [ 7] 2589 	ld	e,(hl)
   8017 3E 02         [ 7] 2590 	ld	a,#0x02
   8019 93            [ 4] 2591 	sub	a, e
   801A D8            [11] 2592 	ret	C
                           2593 ;src/main.c:578: cu.lanzado = SI;
   801B 21 D9 69      [10] 2594 	ld	hl,#(_cu + 0x0006)
   801E 36 01         [10] 2595 	ld	(hl),#0x01
                           2596 ;src/main.c:579: cu.direccion = M_izquierda;
   8020 21 DA 69      [10] 2597 	ld	hl,#(_cu + 0x0007)
   8023 36 01         [10] 2598 	ld	(hl),#0x01
                           2599 ;src/main.c:580: cu.x = prota.x - G_KNIFEX_0_W;
   8025 3A CB 69      [13] 2600 	ld	a, (#_prota + 0)
   8028 C6 FC         [ 7] 2601 	add	a,#0xFC
   802A 32 D3 69      [13] 2602 	ld	(#_cu),a
                           2603 ;src/main.c:581: cu.y = prota.y + G_HERO_H /2;
   802D 0A            [ 7] 2604 	ld	a,(bc)
   802E C6 0B         [ 7] 2605 	add	a, #0x0B
   8030 32 D4 69      [13] 2606 	ld	(#(_cu + 0x0001)),a
                           2607 ;src/main.c:582: cu.sprite = g_knifeX_1;
   8033 21 D0 24      [10] 2608 	ld	hl,#_g_knifeX_1
   8036 22 D7 69      [16] 2609 	ld	((_cu + 0x0004)), hl
                           2610 ;src/main.c:583: cu.eje = E_X;
   8039 21 DB 69      [10] 2611 	ld	hl,#(_cu + 0x0008)
   803C 36 00         [10] 2612 	ld	(hl),#0x00
                           2613 ;src/main.c:584: dibujarCuchillo();
   803E C3 B5 7E      [10] 2614 	jp  _dibujarCuchillo
   8041                    2615 00115$:
                           2616 ;src/main.c:587: else if(prota.mira == M_abajo){
   8041 7B            [ 4] 2617 	ld	a,e
   8042 D6 03         [ 7] 2618 	sub	a, #0x03
   8044 20 41         [12] 2619 	jr	NZ,00112$
                           2620 ;src/main.c:589: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   8046 0A            [ 7] 2621 	ld	a,(bc)
   8047 C6 1F         [ 7] 2622 	add	a, #0x1F
   8049 5F            [ 4] 2623 	ld	e,a
   804A 3A CB 69      [13] 2624 	ld	a, (#_prota + 0)
   804D 57            [ 4] 2625 	ld	d,a
   804E 14            [ 4] 2626 	inc	d
   804F 14            [ 4] 2627 	inc	d
   8050 14            [ 4] 2628 	inc	d
   8051 C5            [11] 2629 	push	bc
   8052 7B            [ 4] 2630 	ld	a,e
   8053 F5            [11] 2631 	push	af
   8054 33            [ 6] 2632 	inc	sp
   8055 D5            [11] 2633 	push	de
   8056 33            [ 6] 2634 	inc	sp
   8057 CD 73 73      [17] 2635 	call	_getTilePtr
   805A F1            [10] 2636 	pop	af
   805B C1            [10] 2637 	pop	bc
   805C 5E            [ 7] 2638 	ld	e,(hl)
   805D 3E 02         [ 7] 2639 	ld	a,#0x02
   805F 93            [ 4] 2640 	sub	a, e
   8060 D8            [11] 2641 	ret	C
                           2642 ;src/main.c:590: cu.lanzado = SI;
   8061 21 D9 69      [10] 2643 	ld	hl,#(_cu + 0x0006)
   8064 36 01         [10] 2644 	ld	(hl),#0x01
                           2645 ;src/main.c:591: cu.direccion = M_abajo;
   8066 21 DA 69      [10] 2646 	ld	hl,#(_cu + 0x0007)
   8069 36 03         [10] 2647 	ld	(hl),#0x03
                           2648 ;src/main.c:592: cu.x = prota.x + G_HERO_W / 2;
   806B 3A CB 69      [13] 2649 	ld	a, (#_prota + 0)
   806E C6 03         [ 7] 2650 	add	a, #0x03
   8070 32 D3 69      [13] 2651 	ld	(#_cu),a
                           2652 ;src/main.c:593: cu.y = prota.y + G_HERO_H;
   8073 0A            [ 7] 2653 	ld	a,(bc)
   8074 C6 16         [ 7] 2654 	add	a, #0x16
   8076 32 D4 69      [13] 2655 	ld	(#(_cu + 0x0001)),a
                           2656 ;src/main.c:594: cu.sprite = g_knifeY_0;
   8079 21 A0 24      [10] 2657 	ld	hl,#_g_knifeY_0
   807C 22 D7 69      [16] 2658 	ld	((_cu + 0x0004)), hl
                           2659 ;src/main.c:595: cu.eje = E_Y;
   807F 21 DB 69      [10] 2660 	ld	hl,#(_cu + 0x0008)
   8082 36 01         [10] 2661 	ld	(hl),#0x01
                           2662 ;src/main.c:596: dibujarCuchillo();
   8084 C3 B5 7E      [10] 2663 	jp  _dibujarCuchillo
   8087                    2664 00112$:
                           2665 ;src/main.c:599: else if(prota.mira == M_arriba){
   8087 7B            [ 4] 2666 	ld	a,e
   8088 D6 02         [ 7] 2667 	sub	a, #0x02
   808A C0            [11] 2668 	ret	NZ
                           2669 ;src/main.c:600: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   808B 0A            [ 7] 2670 	ld	a,(bc)
   808C C6 F7         [ 7] 2671 	add	a,#0xF7
   808E 57            [ 4] 2672 	ld	d,a
   808F 3A CB 69      [13] 2673 	ld	a, (#_prota + 0)
   8092 C6 03         [ 7] 2674 	add	a, #0x03
   8094 C5            [11] 2675 	push	bc
   8095 D5            [11] 2676 	push	de
   8096 33            [ 6] 2677 	inc	sp
   8097 F5            [11] 2678 	push	af
   8098 33            [ 6] 2679 	inc	sp
   8099 CD 73 73      [17] 2680 	call	_getTilePtr
   809C F1            [10] 2681 	pop	af
   809D C1            [10] 2682 	pop	bc
   809E 5E            [ 7] 2683 	ld	e,(hl)
   809F 3E 02         [ 7] 2684 	ld	a,#0x02
   80A1 93            [ 4] 2685 	sub	a, e
   80A2 D8            [11] 2686 	ret	C
                           2687 ;src/main.c:601: cu.lanzado = SI;
   80A3 21 D9 69      [10] 2688 	ld	hl,#(_cu + 0x0006)
   80A6 36 01         [10] 2689 	ld	(hl),#0x01
                           2690 ;src/main.c:602: cu.direccion = M_arriba;
   80A8 21 DA 69      [10] 2691 	ld	hl,#(_cu + 0x0007)
   80AB 36 02         [10] 2692 	ld	(hl),#0x02
                           2693 ;src/main.c:603: cu.x = prota.x + G_HERO_W / 2;
   80AD 3A CB 69      [13] 2694 	ld	a, (#_prota + 0)
   80B0 C6 03         [ 7] 2695 	add	a, #0x03
   80B2 32 D3 69      [13] 2696 	ld	(#_cu),a
                           2697 ;src/main.c:604: cu.y = prota.y;
   80B5 0A            [ 7] 2698 	ld	a,(bc)
   80B6 32 D4 69      [13] 2699 	ld	(#(_cu + 0x0001)),a
                           2700 ;src/main.c:605: cu.sprite = g_knifeY_1;
   80B9 21 B0 24      [10] 2701 	ld	hl,#_g_knifeY_1
   80BC 22 D7 69      [16] 2702 	ld	((_cu + 0x0004)), hl
                           2703 ;src/main.c:606: cu.eje = E_Y;
   80BF 21 DB 69      [10] 2704 	ld	hl,#(_cu + 0x0008)
   80C2 36 01         [10] 2705 	ld	(hl),#0x01
                           2706 ;src/main.c:607: dibujarCuchillo();
   80C4 C3 B5 7E      [10] 2707 	jp  _dibujarCuchillo
                           2708 ;src/main.c:613: void comprobarTeclado() {
                           2709 ;	---------------------------------
                           2710 ; Function comprobarTeclado
                           2711 ; ---------------------------------
   80C7                    2712 _comprobarTeclado::
                           2713 ;src/main.c:614: cpct_scanKeyboard_if();
   80C7 CD B3 5A      [17] 2714 	call	_cpct_scanKeyboard_if
                           2715 ;src/main.c:616: if (cpct_isAnyKeyPressed()) {
   80CA CD A6 5A      [17] 2716 	call	_cpct_isAnyKeyPressed
   80CD 7D            [ 4] 2717 	ld	a,l
   80CE B7            [ 4] 2718 	or	a, a
   80CF C8            [11] 2719 	ret	Z
                           2720 ;src/main.c:617: if (cpct_isKeyPressed(Key_CursorLeft))
   80D0 21 01 01      [10] 2721 	ld	hl,#0x0101
   80D3 CD 10 58      [17] 2722 	call	_cpct_isKeyPressed
   80D6 7D            [ 4] 2723 	ld	a,l
   80D7 B7            [ 4] 2724 	or	a, a
                           2725 ;src/main.c:618: moverIzquierda();
   80D8 C2 02 7E      [10] 2726 	jp	NZ,_moverIzquierda
                           2727 ;src/main.c:619: else if (cpct_isKeyPressed(Key_CursorRight))
   80DB 21 00 02      [10] 2728 	ld	hl,#0x0200
   80DE CD 10 58      [17] 2729 	call	_cpct_isKeyPressed
   80E1 7D            [ 4] 2730 	ld	a,l
   80E2 B7            [ 4] 2731 	or	a, a
                           2732 ;src/main.c:620: moverDerecha();
   80E3 C2 27 7E      [10] 2733 	jp	NZ,_moverDerecha
                           2734 ;src/main.c:621: else if (cpct_isKeyPressed(Key_CursorUp))
   80E6 21 00 01      [10] 2735 	ld	hl,#0x0100
   80E9 CD 10 58      [17] 2736 	call	_cpct_isKeyPressed
   80EC 7D            [ 4] 2737 	ld	a,l
   80ED B7            [ 4] 2738 	or	a, a
                           2739 ;src/main.c:622: moverArriba();
   80EE C2 6D 7E      [10] 2740 	jp	NZ,_moverArriba
                           2741 ;src/main.c:623: else if (cpct_isKeyPressed(Key_CursorDown))
   80F1 21 00 04      [10] 2742 	ld	hl,#0x0400
   80F4 CD 10 58      [17] 2743 	call	_cpct_isKeyPressed
   80F7 7D            [ 4] 2744 	ld	a,l
   80F8 B7            [ 4] 2745 	or	a, a
                           2746 ;src/main.c:624: moverAbajo();
   80F9 C2 91 7E      [10] 2747 	jp	NZ,_moverAbajo
                           2748 ;src/main.c:625: else if (cpct_isKeyPressed(Key_Space))
   80FC 21 05 80      [10] 2749 	ld	hl,#0x8005
   80FF CD 10 58      [17] 2750 	call	_cpct_isKeyPressed
   8102 7D            [ 4] 2751 	ld	a,l
   8103 B7            [ 4] 2752 	or	a, a
   8104 C8            [11] 2753 	ret	Z
                           2754 ;src/main.c:626: lanzarCuchillo();
   8105 C3 AB 7F      [10] 2755 	jp  _lanzarCuchillo
                           2756 ;src/main.c:630: u8 checkKnifeCollision(int direction, u8 xoff, u8 yoff){
                           2757 ;	---------------------------------
                           2758 ; Function checkKnifeCollision
                           2759 ; ---------------------------------
   8108                    2760 _checkKnifeCollision::
                           2761 ;src/main.c:632: return *getTilePtr(cu.x + xoff, cu.y + yoff) <= 2;
   8108 3A D4 69      [13] 2762 	ld	a,(#_cu + 1)
   810B 21 05 00      [10] 2763 	ld	hl,#5
   810E 39            [11] 2764 	add	hl,sp
   810F 86            [ 7] 2765 	add	a, (hl)
   8110 47            [ 4] 2766 	ld	b,a
   8111 3A D3 69      [13] 2767 	ld	a,(#_cu + 0)
   8114 21 04 00      [10] 2768 	ld	hl,#4
   8117 39            [11] 2769 	add	hl,sp
   8118 86            [ 7] 2770 	add	a, (hl)
   8119 4F            [ 4] 2771 	ld	c,a
   811A C5            [11] 2772 	push	bc
   811B CD 73 73      [17] 2773 	call	_getTilePtr
   811E F1            [10] 2774 	pop	af
   811F 4E            [ 7] 2775 	ld	c,(hl)
   8120 3E 02         [ 7] 2776 	ld	a,#0x02
   8122 91            [ 4] 2777 	sub	a, c
   8123 3E 00         [ 7] 2778 	ld	a,#0x00
   8125 17            [ 4] 2779 	rla
   8126 EE 01         [ 7] 2780 	xor	a, #0x01
   8128 6F            [ 4] 2781 	ld	l, a
   8129 C9            [10] 2782 	ret
                           2783 ;src/main.c:635: void moverCuchillo(){
                           2784 ;	---------------------------------
                           2785 ; Function moverCuchillo
                           2786 ; ---------------------------------
   812A                    2787 _moverCuchillo::
                           2788 ;src/main.c:636: if(cu.lanzado){
   812A 01 D3 69      [10] 2789 	ld	bc,#_cu+0
   812D 3A D9 69      [13] 2790 	ld	a, (#_cu + 6)
   8130 B7            [ 4] 2791 	or	a, a
   8131 C8            [11] 2792 	ret	Z
                           2793 ;src/main.c:637: cu.mover = SI;
   8132 21 09 00      [10] 2794 	ld	hl,#0x0009
   8135 09            [11] 2795 	add	hl,bc
   8136 EB            [ 4] 2796 	ex	de,hl
   8137 3E 01         [ 7] 2797 	ld	a,#0x01
   8139 12            [ 7] 2798 	ld	(de),a
                           2799 ;src/main.c:638: if(cu.direccion == M_derecha){
   813A 21 DA 69      [10] 2800 	ld	hl, #_cu + 7
   813D 6E            [ 7] 2801 	ld	l,(hl)
   813E 7D            [ 4] 2802 	ld	a,l
   813F B7            [ 4] 2803 	or	a, a
   8140 20 1E         [12] 2804 	jr	NZ,00122$
                           2805 ;src/main.c:640: if(checkKnifeCollision(M_derecha, G_KNIFEX_0_W + 1, 0)){
   8142 C5            [11] 2806 	push	bc
   8143 D5            [11] 2807 	push	de
   8144 21 05 00      [10] 2808 	ld	hl,#0x0005
   8147 E5            [11] 2809 	push	hl
   8148 2E 00         [ 7] 2810 	ld	l, #0x00
   814A E5            [11] 2811 	push	hl
   814B CD 08 81      [17] 2812 	call	_checkKnifeCollision
   814E F1            [10] 2813 	pop	af
   814F F1            [10] 2814 	pop	af
   8150 D1            [10] 2815 	pop	de
   8151 C1            [10] 2816 	pop	bc
   8152 7D            [ 4] 2817 	ld	a,l
   8153 B7            [ 4] 2818 	or	a, a
   8154 28 07         [12] 2819 	jr	Z,00102$
                           2820 ;src/main.c:641: cu.mover = SI;
   8156 3E 01         [ 7] 2821 	ld	a,#0x01
   8158 12            [ 7] 2822 	ld	(de),a
                           2823 ;src/main.c:642: cu.x++;
   8159 0A            [ 7] 2824 	ld	a,(bc)
   815A 3C            [ 4] 2825 	inc	a
   815B 02            [ 7] 2826 	ld	(bc),a
   815C C9            [10] 2827 	ret
   815D                    2828 00102$:
                           2829 ;src/main.c:645: cu.mover=NO;
   815D AF            [ 4] 2830 	xor	a, a
   815E 12            [ 7] 2831 	ld	(de),a
   815F C9            [10] 2832 	ret
   8160                    2833 00122$:
                           2834 ;src/main.c:648: else if(cu.direccion == M_izquierda){
   8160 7D            [ 4] 2835 	ld	a,l
   8161 3D            [ 4] 2836 	dec	a
   8162 20 1F         [12] 2837 	jr	NZ,00119$
                           2838 ;src/main.c:649: if(checkKnifeCollision(M_derecha, -1, 0)){
   8164 C5            [11] 2839 	push	bc
   8165 D5            [11] 2840 	push	de
   8166 21 FF 00      [10] 2841 	ld	hl,#0x00FF
   8169 E5            [11] 2842 	push	hl
   816A 2E 00         [ 7] 2843 	ld	l, #0x00
   816C E5            [11] 2844 	push	hl
   816D CD 08 81      [17] 2845 	call	_checkKnifeCollision
   8170 F1            [10] 2846 	pop	af
   8171 F1            [10] 2847 	pop	af
   8172 D1            [10] 2848 	pop	de
   8173 C1            [10] 2849 	pop	bc
   8174 7D            [ 4] 2850 	ld	a,l
   8175 B7            [ 4] 2851 	or	a, a
   8176 28 08         [12] 2852 	jr	Z,00105$
                           2853 ;src/main.c:650: cu.mover = SI;
   8178 3E 01         [ 7] 2854 	ld	a,#0x01
   817A 12            [ 7] 2855 	ld	(de),a
                           2856 ;src/main.c:651: cu.x--;
   817B 0A            [ 7] 2857 	ld	a,(bc)
   817C C6 FF         [ 7] 2858 	add	a,#0xFF
   817E 02            [ 7] 2859 	ld	(bc),a
   817F C9            [10] 2860 	ret
   8180                    2861 00105$:
                           2862 ;src/main.c:653: cu.mover=NO;
   8180 AF            [ 4] 2863 	xor	a, a
   8181 12            [ 7] 2864 	ld	(de),a
   8182 C9            [10] 2865 	ret
   8183                    2866 00119$:
                           2867 ;src/main.c:659: cu.y--;
   8183 03            [ 6] 2868 	inc	bc
                           2869 ;src/main.c:656: else if(cu.direccion == M_arriba){
   8184 7D            [ 4] 2870 	ld	a,l
   8185 D6 02         [ 7] 2871 	sub	a, #0x02
   8187 20 22         [12] 2872 	jr	NZ,00116$
                           2873 ;src/main.c:657: if(checkKnifeCollision(M_derecha, 0, -2)){
   8189 C5            [11] 2874 	push	bc
   818A D5            [11] 2875 	push	de
   818B 21 00 FE      [10] 2876 	ld	hl,#0xFE00
   818E E5            [11] 2877 	push	hl
   818F 26 00         [ 7] 2878 	ld	h, #0x00
   8191 E5            [11] 2879 	push	hl
   8192 CD 08 81      [17] 2880 	call	_checkKnifeCollision
   8195 F1            [10] 2881 	pop	af
   8196 F1            [10] 2882 	pop	af
   8197 D1            [10] 2883 	pop	de
   8198 C1            [10] 2884 	pop	bc
   8199 7D            [ 4] 2885 	ld	a,l
   819A B7            [ 4] 2886 	or	a, a
   819B 28 0B         [12] 2887 	jr	Z,00108$
                           2888 ;src/main.c:658: cu.mover = SI;
   819D 3E 01         [ 7] 2889 	ld	a,#0x01
   819F 12            [ 7] 2890 	ld	(de),a
                           2891 ;src/main.c:659: cu.y--;
   81A0 0A            [ 7] 2892 	ld	a,(bc)
   81A1 C6 FF         [ 7] 2893 	add	a,#0xFF
   81A3 02            [ 7] 2894 	ld	(bc),a
                           2895 ;src/main.c:660: cu.y--;
   81A4 C6 FF         [ 7] 2896 	add	a,#0xFF
   81A6 02            [ 7] 2897 	ld	(bc),a
   81A7 C9            [10] 2898 	ret
   81A8                    2899 00108$:
                           2900 ;src/main.c:663: cu.mover=NO;
   81A8 AF            [ 4] 2901 	xor	a, a
   81A9 12            [ 7] 2902 	ld	(de),a
   81AA C9            [10] 2903 	ret
   81AB                    2904 00116$:
                           2905 ;src/main.c:666: else if(cu.direccion == M_abajo){
   81AB 7D            [ 4] 2906 	ld	a,l
   81AC D6 03         [ 7] 2907 	sub	a, #0x03
   81AE C0            [11] 2908 	ret	NZ
                           2909 ;src/main.c:667: if(checkKnifeCollision(M_derecha, 0, G_KNIFEY_0_H + 2)){
   81AF C5            [11] 2910 	push	bc
   81B0 D5            [11] 2911 	push	de
   81B1 21 00 0A      [10] 2912 	ld	hl,#0x0A00
   81B4 E5            [11] 2913 	push	hl
   81B5 26 00         [ 7] 2914 	ld	h, #0x00
   81B7 E5            [11] 2915 	push	hl
   81B8 CD 08 81      [17] 2916 	call	_checkKnifeCollision
   81BB F1            [10] 2917 	pop	af
   81BC F1            [10] 2918 	pop	af
   81BD D1            [10] 2919 	pop	de
   81BE C1            [10] 2920 	pop	bc
   81BF 7D            [ 4] 2921 	ld	a,l
   81C0 B7            [ 4] 2922 	or	a, a
   81C1 28 09         [12] 2923 	jr	Z,00111$
                           2924 ;src/main.c:668: cu.mover = SI;
   81C3 3E 01         [ 7] 2925 	ld	a,#0x01
   81C5 12            [ 7] 2926 	ld	(de),a
                           2927 ;src/main.c:669: cu.y++;
   81C6 0A            [ 7] 2928 	ld	a,(bc)
   81C7 3C            [ 4] 2929 	inc	a
   81C8 02            [ 7] 2930 	ld	(bc),a
                           2931 ;src/main.c:670: cu.y++;
   81C9 3C            [ 4] 2932 	inc	a
   81CA 02            [ 7] 2933 	ld	(bc),a
   81CB C9            [10] 2934 	ret
   81CC                    2935 00111$:
                           2936 ;src/main.c:673: cu.mover=NO;
   81CC AF            [ 4] 2937 	xor	a, a
   81CD 12            [ 7] 2938 	ld	(de),a
   81CE C9            [10] 2939 	ret
                           2940 ;src/main.c:679: void barraPuntuacionInicial(){
                           2941 ;	---------------------------------
                           2942 ; Function barraPuntuacionInicial
                           2943 ; ---------------------------------
   81CF                    2944 _barraPuntuacionInicial::
                           2945 ;src/main.c:684: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   81CF 21 00 02      [10] 2946 	ld	hl,#0x0200
   81D2 E5            [11] 2947 	push	hl
   81D3 26 C0         [ 7] 2948 	ld	h, #0xC0
   81D5 E5            [11] 2949 	push	hl
   81D6 CD 62 64      [17] 2950 	call	_cpct_getScreenPtr
   81D9 4D            [ 4] 2951 	ld	c,l
   81DA 44            [ 4] 2952 	ld	b,h
                           2953 ;src/main.c:685: cpct_drawStringM0("SCORE", memptr, 1, 0);
   81DB 21 01 00      [10] 2954 	ld	hl,#0x0001
   81DE E5            [11] 2955 	push	hl
   81DF C5            [11] 2956 	push	bc
   81E0 21 77 82      [10] 2957 	ld	hl,#___str_1
   81E3 E5            [11] 2958 	push	hl
   81E4 CD 92 58      [17] 2959 	call	_cpct_drawStringM0
   81E7 21 06 00      [10] 2960 	ld	hl,#6
   81EA 39            [11] 2961 	add	hl,sp
   81EB F9            [ 6] 2962 	ld	sp,hl
                           2963 ;src/main.c:686: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   81EC 21 00 0E      [10] 2964 	ld	hl,#0x0E00
   81EF E5            [11] 2965 	push	hl
   81F0 26 C0         [ 7] 2966 	ld	h, #0xC0
   81F2 E5            [11] 2967 	push	hl
   81F3 CD 62 64      [17] 2968 	call	_cpct_getScreenPtr
   81F6 4D            [ 4] 2969 	ld	c,l
   81F7 44            [ 4] 2970 	ld	b,h
                           2971 ;src/main.c:687: cpct_drawStringM0("00000", memptr, 15, 0);
   81F8 21 0F 00      [10] 2972 	ld	hl,#0x000F
   81FB E5            [11] 2973 	push	hl
   81FC C5            [11] 2974 	push	bc
   81FD 21 7D 82      [10] 2975 	ld	hl,#___str_2
   8200 E5            [11] 2976 	push	hl
   8201 CD 92 58      [17] 2977 	call	_cpct_drawStringM0
   8204 21 06 00      [10] 2978 	ld	hl,#6
   8207 39            [11] 2979 	add	hl,sp
   8208 F9            [ 6] 2980 	ld	sp,hl
                           2981 ;src/main.c:690: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 14);
   8209 21 1A 0E      [10] 2982 	ld	hl,#0x0E1A
   820C E5            [11] 2983 	push	hl
   820D 21 00 C0      [10] 2984 	ld	hl,#0xC000
   8210 E5            [11] 2985 	push	hl
   8211 CD 62 64      [17] 2986 	call	_cpct_getScreenPtr
   8214 4D            [ 4] 2987 	ld	c,l
   8215 44            [ 4] 2988 	ld	b,h
                           2989 ;src/main.c:691: cpct_drawStringM0("ROBOBIT", memptr, 3, 0);
   8216 21 03 00      [10] 2990 	ld	hl,#0x0003
   8219 E5            [11] 2991 	push	hl
   821A C5            [11] 2992 	push	bc
   821B 21 83 82      [10] 2993 	ld	hl,#___str_3
   821E E5            [11] 2994 	push	hl
   821F CD 92 58      [17] 2995 	call	_cpct_drawStringM0
   8222 21 06 00      [10] 2996 	ld	hl,#6
   8225 39            [11] 2997 	add	hl,sp
   8226 F9            [ 6] 2998 	ld	sp,hl
                           2999 ;src/main.c:693: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   8227 21 3C 02      [10] 3000 	ld	hl,#0x023C
   822A E5            [11] 3001 	push	hl
   822B 21 00 C0      [10] 3002 	ld	hl,#0xC000
   822E E5            [11] 3003 	push	hl
   822F CD 62 64      [17] 3004 	call	_cpct_getScreenPtr
   8232 4D            [ 4] 3005 	ld	c,l
   8233 44            [ 4] 3006 	ld	b,h
                           3007 ;src/main.c:694: cpct_drawStringM0("LIVES", memptr, 1, 0);
   8234 21 01 00      [10] 3008 	ld	hl,#0x0001
   8237 E5            [11] 3009 	push	hl
   8238 C5            [11] 3010 	push	bc
   8239 21 8B 82      [10] 3011 	ld	hl,#___str_4
   823C E5            [11] 3012 	push	hl
   823D CD 92 58      [17] 3013 	call	_cpct_drawStringM0
   8240 21 06 00      [10] 3014 	ld	hl,#6
   8243 39            [11] 3015 	add	hl,sp
   8244 F9            [ 6] 3016 	ld	sp,hl
                           3017 ;src/main.c:696: for(i=0; i<5; i++){
   8245 01 00 00      [10] 3018 	ld	bc,#0x0000
   8248                    3019 00102$:
                           3020 ;src/main.c:697: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   8248 79            [ 4] 3021 	ld	a,c
   8249 87            [ 4] 3022 	add	a, a
   824A 87            [ 4] 3023 	add	a, a
   824B C6 3C         [ 7] 3024 	add	a, #0x3C
   824D 57            [ 4] 3025 	ld	d,a
   824E C5            [11] 3026 	push	bc
   824F 3E 0E         [ 7] 3027 	ld	a,#0x0E
   8251 F5            [11] 3028 	push	af
   8252 33            [ 6] 3029 	inc	sp
   8253 D5            [11] 3030 	push	de
   8254 33            [ 6] 3031 	inc	sp
   8255 21 00 C0      [10] 3032 	ld	hl,#0xC000
   8258 E5            [11] 3033 	push	hl
   8259 CD 62 64      [17] 3034 	call	_cpct_getScreenPtr
   825C EB            [ 4] 3035 	ex	de,hl
   825D 21 03 06      [10] 3036 	ld	hl,#0x0603
   8260 E5            [11] 3037 	push	hl
   8261 D5            [11] 3038 	push	de
   8262 21 60 48      [10] 3039 	ld	hl,#_g_heart
   8265 E5            [11] 3040 	push	hl
   8266 CD B6 58      [17] 3041 	call	_cpct_drawSprite
   8269 C1            [10] 3042 	pop	bc
                           3043 ;src/main.c:696: for(i=0; i<5; i++){
   826A 03            [ 6] 3044 	inc	bc
   826B 79            [ 4] 3045 	ld	a,c
   826C D6 05         [ 7] 3046 	sub	a, #0x05
   826E 78            [ 4] 3047 	ld	a,b
   826F 17            [ 4] 3048 	rla
   8270 3F            [ 4] 3049 	ccf
   8271 1F            [ 4] 3050 	rra
   8272 DE 80         [ 7] 3051 	sbc	a, #0x80
   8274 38 D2         [12] 3052 	jr	C,00102$
   8276 C9            [10] 3053 	ret
   8277                    3054 ___str_1:
   8277 53 43 4F 52 45     3055 	.ascii "SCORE"
   827C 00                 3056 	.db 0x00
   827D                    3057 ___str_2:
   827D 30 30 30 30 30     3058 	.ascii "00000"
   8282 00                 3059 	.db 0x00
   8283                    3060 ___str_3:
   8283 52 4F 42 4F 42 49  3061 	.ascii "ROBOBIT"
        54
   828A 00                 3062 	.db 0x00
   828B                    3063 ___str_4:
   828B 4C 49 56 45 53     3064 	.ascii "LIVES"
   8290 00                 3065 	.db 0x00
                           3066 ;src/main.c:702: void borrarPantallaArriba(u8 x, u8 y, u8 ancho, u8 alto){
                           3067 ;	---------------------------------
                           3068 ; Function borrarPantallaArriba
                           3069 ; ---------------------------------
   8291                    3070 _borrarPantallaArriba::
   8291 DD E5         [15] 3071 	push	ix
   8293 DD 21 00 00   [14] 3072 	ld	ix,#0
   8297 DD 39         [15] 3073 	add	ix,sp
                           3074 ;src/main.c:705: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   8299 DD 66 05      [19] 3075 	ld	h,5 (ix)
   829C DD 6E 04      [19] 3076 	ld	l,4 (ix)
   829F E5            [11] 3077 	push	hl
   82A0 21 00 C0      [10] 3078 	ld	hl,#0xC000
   82A3 E5            [11] 3079 	push	hl
   82A4 CD 62 64      [17] 3080 	call	_cpct_getScreenPtr
   82A7 4D            [ 4] 3081 	ld	c,l
   82A8 44            [ 4] 3082 	ld	b,h
                           3083 ;src/main.c:706: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra la mitad derecha
   82A9 DD 66 07      [19] 3084 	ld	h,7 (ix)
   82AC DD 6E 06      [19] 3085 	ld	l,6 (ix)
   82AF E5            [11] 3086 	push	hl
   82B0 AF            [ 4] 3087 	xor	a, a
   82B1 F5            [11] 3088 	push	af
   82B2 33            [ 6] 3089 	inc	sp
   82B3 C5            [11] 3090 	push	bc
   82B4 CD 88 63      [17] 3091 	call	_cpct_drawSolidBox
   82B7 F1            [10] 3092 	pop	af
   82B8 F1            [10] 3093 	pop	af
   82B9 33            [ 6] 3094 	inc	sp
                           3095 ;src/main.c:707: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   82BA DD 7E 04      [19] 3096 	ld	a,4 (ix)
   82BD C6 28         [ 7] 3097 	add	a, #0x28
   82BF 47            [ 4] 3098 	ld	b,a
   82C0 DD 7E 05      [19] 3099 	ld	a,5 (ix)
   82C3 F5            [11] 3100 	push	af
   82C4 33            [ 6] 3101 	inc	sp
   82C5 C5            [11] 3102 	push	bc
   82C6 33            [ 6] 3103 	inc	sp
   82C7 21 00 C0      [10] 3104 	ld	hl,#0xC000
   82CA E5            [11] 3105 	push	hl
   82CB CD 62 64      [17] 3106 	call	_cpct_getScreenPtr
   82CE 4D            [ 4] 3107 	ld	c,l
   82CF 44            [ 4] 3108 	ld	b,h
                           3109 ;src/main.c:708: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra la mitad izquierda
   82D0 DD 66 07      [19] 3110 	ld	h,7 (ix)
   82D3 DD 6E 06      [19] 3111 	ld	l,6 (ix)
   82D6 E5            [11] 3112 	push	hl
   82D7 AF            [ 4] 3113 	xor	a, a
   82D8 F5            [11] 3114 	push	af
   82D9 33            [ 6] 3115 	inc	sp
   82DA C5            [11] 3116 	push	bc
   82DB CD 88 63      [17] 3117 	call	_cpct_drawSolidBox
   82DE F1            [10] 3118 	pop	af
   82DF F1            [10] 3119 	pop	af
   82E0 33            [ 6] 3120 	inc	sp
   82E1 DD E1         [14] 3121 	pop	ix
   82E3 C9            [10] 3122 	ret
                           3123 ;src/main.c:711: void menuInicio(){
                           3124 ;	---------------------------------
                           3125 ; Function menuInicio
                           3126 ; ---------------------------------
   82E4                    3127 _menuInicio::
                           3128 ;src/main.c:715: cpct_clearScreen(0);
   82E4 21 00 40      [10] 3129 	ld	hl,#0x4000
   82E7 E5            [11] 3130 	push	hl
   82E8 AF            [ 4] 3131 	xor	a, a
   82E9 F5            [11] 3132 	push	af
   82EA 33            [ 6] 3133 	inc	sp
   82EB 26 C0         [ 7] 3134 	ld	h, #0xC0
   82ED E5            [11] 3135 	push	hl
   82EE CD 41 5B      [17] 3136 	call	_cpct_memset
                           3137 ;src/main.c:717: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   82F1 21 1A 0F      [10] 3138 	ld	hl,#0x0F1A
   82F4 E5            [11] 3139 	push	hl
   82F5 21 00 C0      [10] 3140 	ld	hl,#0xC000
   82F8 E5            [11] 3141 	push	hl
   82F9 CD 62 64      [17] 3142 	call	_cpct_getScreenPtr
   82FC 4D            [ 4] 3143 	ld	c,l
   82FD 44            [ 4] 3144 	ld	b,h
                           3145 ;src/main.c:718: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   82FE 21 04 00      [10] 3146 	ld	hl,#0x0004
   8301 E5            [11] 3147 	push	hl
   8302 C5            [11] 3148 	push	bc
   8303 21 97 83      [10] 3149 	ld	hl,#___str_5
   8306 E5            [11] 3150 	push	hl
   8307 CD 92 58      [17] 3151 	call	_cpct_drawStringM0
   830A 21 06 00      [10] 3152 	ld	hl,#6
   830D 39            [11] 3153 	add	hl,sp
   830E F9            [ 6] 3154 	ld	sp,hl
                           3155 ;src/main.c:720: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   830F 21 28 6E      [10] 3156 	ld	hl,#0x6E28
   8312 E5            [11] 3157 	push	hl
   8313 21 F0 F0      [10] 3158 	ld	hl,#0xF0F0
   8316 E5            [11] 3159 	push	hl
   8317 21 00 26      [10] 3160 	ld	hl,#_g_text_0
   831A E5            [11] 3161 	push	hl
   831B CD B6 58      [17] 3162 	call	_cpct_drawSprite
                           3163 ;src/main.c:721: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   831E 21 28 6E      [10] 3164 	ld	hl,#0x6E28
   8321 E5            [11] 3165 	push	hl
   8322 21 18 F1      [10] 3166 	ld	hl,#0xF118
   8325 E5            [11] 3167 	push	hl
   8326 21 30 37      [10] 3168 	ld	hl,#_g_text_1
   8329 E5            [11] 3169 	push	hl
   832A CD B6 58      [17] 3170 	call	_cpct_drawSprite
                           3171 ;src/main.c:744: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   832D 21 08 A0      [10] 3172 	ld	hl,#0xA008
   8330 E5            [11] 3173 	push	hl
   8331 21 00 C0      [10] 3174 	ld	hl,#0xC000
   8334 E5            [11] 3175 	push	hl
   8335 CD 62 64      [17] 3176 	call	_cpct_getScreenPtr
   8338 4D            [ 4] 3177 	ld	c,l
   8339 44            [ 4] 3178 	ld	b,h
                           3179 ;src/main.c:745: cpct_drawStringM0("TO START PRESS S", memptr, 4, 0);
   833A 21 04 00      [10] 3180 	ld	hl,#0x0004
   833D E5            [11] 3181 	push	hl
   833E C5            [11] 3182 	push	bc
   833F 21 9F 83      [10] 3183 	ld	hl,#___str_6
   8342 E5            [11] 3184 	push	hl
   8343 CD 92 58      [17] 3185 	call	_cpct_drawStringM0
   8346 21 06 00      [10] 3186 	ld	hl,#6
   8349 39            [11] 3187 	add	hl,sp
   834A F9            [ 6] 3188 	ld	sp,hl
                           3189 ;src/main.c:747: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 170); // centrado en horizontal y abajo en vertical
   834B 21 0A AA      [10] 3190 	ld	hl,#0xAA0A
   834E E5            [11] 3191 	push	hl
   834F 21 00 C0      [10] 3192 	ld	hl,#0xC000
   8352 E5            [11] 3193 	push	hl
   8353 CD 62 64      [17] 3194 	call	_cpct_getScreenPtr
   8356 4D            [ 4] 3195 	ld	c,l
   8357 44            [ 4] 3196 	ld	b,h
                           3197 ;src/main.c:748: cpct_drawStringM0("TO MENU PRESS M", memptr, 4, 0);
   8358 21 04 00      [10] 3198 	ld	hl,#0x0004
   835B E5            [11] 3199 	push	hl
   835C C5            [11] 3200 	push	bc
   835D 21 B0 83      [10] 3201 	ld	hl,#___str_7
   8360 E5            [11] 3202 	push	hl
   8361 CD 92 58      [17] 3203 	call	_cpct_drawStringM0
   8364 21 06 00      [10] 3204 	ld	hl,#6
   8367 39            [11] 3205 	add	hl,sp
   8368 F9            [ 6] 3206 	ld	sp,hl
                           3207 ;src/main.c:751: do{
   8369                    3208 00106$:
                           3209 ;src/main.c:752: cpct_scanKeyboard_f();
   8369 CD 1C 58      [17] 3210 	call	_cpct_scanKeyboard_f
                           3211 ;src/main.c:756: if(cpct_isKeyPressed(Key_M)){
   836C 21 04 40      [10] 3212 	ld	hl,#0x4004
   836F CD 10 58      [17] 3213 	call	_cpct_isKeyPressed
   8372 7D            [ 4] 3214 	ld	a,l
   8373 B7            [ 4] 3215 	or	a, a
   8374 28 0D         [12] 3216 	jr	Z,00107$
                           3217 ;src/main.c:757: cpct_scanKeyboard_f();
   8376 CD 1C 58      [17] 3218 	call	_cpct_scanKeyboard_f
                           3219 ;src/main.c:758: do{
   8379                    3220 00101$:
                           3221 ;src/main.c:760: } while(!cpct_isKeyPressed(Key_S));
   8379 21 07 10      [10] 3222 	ld	hl,#0x1007
   837C CD 10 58      [17] 3223 	call	_cpct_isKeyPressed
   837F 7D            [ 4] 3224 	ld	a,l
   8380 B7            [ 4] 3225 	or	a, a
   8381 28 F6         [12] 3226 	jr	Z,00101$
   8383                    3227 00107$:
                           3228 ;src/main.c:762: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   8383 21 07 10      [10] 3229 	ld	hl,#0x1007
   8386 CD 10 58      [17] 3230 	call	_cpct_isKeyPressed
   8389 7D            [ 4] 3231 	ld	a,l
   838A B7            [ 4] 3232 	or	a, a
   838B C0            [11] 3233 	ret	NZ
   838C 21 04 40      [10] 3234 	ld	hl,#0x4004
   838F CD 10 58      [17] 3235 	call	_cpct_isKeyPressed
   8392 7D            [ 4] 3236 	ld	a,l
   8393 B7            [ 4] 3237 	or	a, a
   8394 28 D3         [12] 3238 	jr	Z,00106$
   8396 C9            [10] 3239 	ret
   8397                    3240 ___str_5:
   8397 52 4F 42 4F 42 49  3241 	.ascii "ROBOBIT"
        54
   839E 00                 3242 	.db 0x00
   839F                    3243 ___str_6:
   839F 54 4F 20 53 54 41  3244 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   83AF 00                 3245 	.db 0x00
   83B0                    3246 ___str_7:
   83B0 54 4F 20 4D 45 4E  3247 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   83BF 00                 3248 	.db 0x00
                           3249 ;src/main.c:765: void inicializarCPC() {
                           3250 ;	---------------------------------
                           3251 ; Function inicializarCPC
                           3252 ; ---------------------------------
   83C0                    3253 _inicializarCPC::
                           3254 ;src/main.c:766: cpct_disableFirmware();
   83C0 CD 78 63      [17] 3255 	call	_cpct_disableFirmware
                           3256 ;src/main.c:767: cpct_setVideoMode(0);
   83C3 2E 00         [ 7] 3257 	ld	l,#0x00
   83C5 CD 23 5B      [17] 3258 	call	_cpct_setVideoMode
                           3259 ;src/main.c:768: cpct_setBorder(HW_BLACK);
   83C8 21 10 14      [10] 3260 	ld	hl,#0x1410
   83CB E5            [11] 3261 	push	hl
   83CC CD 86 58      [17] 3262 	call	_cpct_setPALColour
                           3263 ;src/main.c:769: cpct_setPalette(g_palette, 16);
   83CF 21 10 00      [10] 3264 	ld	hl,#0x0010
   83D2 E5            [11] 3265 	push	hl
   83D3 21 98 4A      [10] 3266 	ld	hl,#_g_palette
   83D6 E5            [11] 3267 	push	hl
   83D7 CD F9 57      [17] 3268 	call	_cpct_setPalette
                           3269 ;src/main.c:770: cpct_akp_musicInit(G_song);
   83DA 21 00 0F      [10] 3270 	ld	hl,#_G_song
   83DD E5            [11] 3271 	push	hl
   83DE CD 54 62      [17] 3272 	call	_cpct_akp_musicInit
   83E1 F1            [10] 3273 	pop	af
   83E2 C9            [10] 3274 	ret
                           3275 ;src/main.c:773: void inicializarEnemy() {
                           3276 ;	---------------------------------
                           3277 ; Function inicializarEnemy
                           3278 ; ---------------------------------
   83E3                    3279 _inicializarEnemy::
   83E3 DD E5         [15] 3280 	push	ix
   83E5 DD 21 00 00   [14] 3281 	ld	ix,#0
   83E9 DD 39         [15] 3282 	add	ix,sp
   83EB F5            [11] 3283 	push	af
   83EC 3B            [ 6] 3284 	dec	sp
                           3285 ;src/main.c:784: actual = enemy;
   83ED 01 BF 64      [10] 3286 	ld	bc,#_enemy+0
                           3287 ;src/main.c:785: while(--i){
   83F0 1E 02         [ 7] 3288 	ld	e,#0x02
   83F2                    3289 00101$:
   83F2 1D            [ 4] 3290 	dec e
   83F3 CA A7 84      [10] 3291 	jp	Z,00104$
                           3292 ;src/main.c:786: actual->x = actual->px = spawnX[i];
   83F6 C5            [11] 3293 	push	bc
   83F7 FD E1         [14] 3294 	pop	iy
   83F9 FD 23         [10] 3295 	inc	iy
   83FB FD 23         [10] 3296 	inc	iy
   83FD 21 84 72      [10] 3297 	ld	hl,#_spawnX
   8400 16 00         [ 7] 3298 	ld	d,#0x00
   8402 19            [11] 3299 	add	hl, de
   8403 7E            [ 7] 3300 	ld	a,(hl)
   8404 DD 77 FD      [19] 3301 	ld	-3 (ix), a
   8407 FD 77 00      [19] 3302 	ld	0 (iy), a
   840A DD 7E FD      [19] 3303 	ld	a,-3 (ix)
   840D 02            [ 7] 3304 	ld	(bc),a
                           3305 ;src/main.c:787: actual->y = actual->py = spawnY[i];
   840E C5            [11] 3306 	push	bc
   840F FD E1         [14] 3307 	pop	iy
   8411 FD 23         [10] 3308 	inc	iy
   8413 21 03 00      [10] 3309 	ld	hl,#0x0003
   8416 09            [11] 3310 	add	hl,bc
   8417 DD 75 FE      [19] 3311 	ld	-2 (ix),l
   841A DD 74 FF      [19] 3312 	ld	-1 (ix),h
   841D 21 89 72      [10] 3313 	ld	hl,#_spawnY
   8420 16 00         [ 7] 3314 	ld	d,#0x00
   8422 19            [11] 3315 	add	hl, de
   8423 56            [ 7] 3316 	ld	d,(hl)
   8424 DD 6E FE      [19] 3317 	ld	l,-2 (ix)
   8427 DD 66 FF      [19] 3318 	ld	h,-1 (ix)
   842A 72            [ 7] 3319 	ld	(hl),d
   842B FD 72 00      [19] 3320 	ld	0 (iy), d
                           3321 ;src/main.c:788: actual->mover  = NO;
   842E 21 06 00      [10] 3322 	ld	hl,#0x0006
   8431 09            [11] 3323 	add	hl,bc
   8432 36 00         [10] 3324 	ld	(hl),#0x00
                           3325 ;src/main.c:789: actual->mira   = M_abajo;
   8434 21 07 00      [10] 3326 	ld	hl,#0x0007
   8437 09            [11] 3327 	add	hl,bc
   8438 36 03         [10] 3328 	ld	(hl),#0x03
                           3329 ;src/main.c:790: actual->sprite = g_enemy;
   843A 21 04 00      [10] 3330 	ld	hl,#0x0004
   843D 09            [11] 3331 	add	hl,bc
   843E 36 72         [10] 3332 	ld	(hl),#<(_g_enemy)
   8440 23            [ 6] 3333 	inc	hl
   8441 36 48         [10] 3334 	ld	(hl),#>(_g_enemy)
                           3335 ;src/main.c:791: actual->muerto = NO;
   8443 21 08 00      [10] 3336 	ld	hl,#0x0008
   8446 09            [11] 3337 	add	hl,bc
   8447 36 00         [10] 3338 	ld	(hl),#0x00
                           3339 ;src/main.c:792: actual->muertes = 0;
   8449 21 0A 00      [10] 3340 	ld	hl,#0x000A
   844C 09            [11] 3341 	add	hl,bc
   844D 36 00         [10] 3342 	ld	(hl),#0x00
                           3343 ;src/main.c:793: actual->patrolling = SI;
   844F 21 0B 00      [10] 3344 	ld	hl,#0x000B
   8452 09            [11] 3345 	add	hl,bc
   8453 36 01         [10] 3346 	ld	(hl),#0x01
                           3347 ;src/main.c:794: actual->onPathPatrol = SI;
   8455 21 0C 00      [10] 3348 	ld	hl,#0x000C
   8458 09            [11] 3349 	add	hl,bc
   8459 36 01         [10] 3350 	ld	(hl),#0x01
                           3351 ;src/main.c:795: actual->reversePatrol = NO;
   845B 21 0D 00      [10] 3352 	ld	hl,#0x000D
   845E 09            [11] 3353 	add	hl,bc
   845F 36 00         [10] 3354 	ld	(hl),#0x00
                           3355 ;src/main.c:796: actual->iter = 0;
   8461 21 0E 00      [10] 3356 	ld	hl,#0x000E
   8464 09            [11] 3357 	add	hl,bc
   8465 36 00         [10] 3358 	ld	(hl),#0x00
                           3359 ;src/main.c:797: actual->lastIter = 0;
   8467 21 0F 00      [10] 3360 	ld	hl,#0x000F
   846A 09            [11] 3361 	add	hl,bc
   846B 36 00         [10] 3362 	ld	(hl),#0x00
                           3363 ;src/main.c:798: actual->seen = 0;
   846D 21 11 00      [10] 3364 	ld	hl,#0x0011
   8470 09            [11] 3365 	add	hl,bc
   8471 36 00         [10] 3366 	ld	(hl),#0x00
                           3367 ;src/main.c:799: actual->found = 0;
   8473 21 12 00      [10] 3368 	ld	hl,#0x0012
   8476 09            [11] 3369 	add	hl,bc
   8477 36 00         [10] 3370 	ld	(hl),#0x00
                           3371 ;src/main.c:800: pathFinding(actual->x, actual->y, 40, 54, actual, mapa); // calculo rutas de patrulla
   8479 C5            [11] 3372 	push	bc
   847A D5            [11] 3373 	push	de
   847B 2A DE 69      [16] 3374 	ld	hl,(_mapa)
   847E E5            [11] 3375 	push	hl
   847F C5            [11] 3376 	push	bc
   8480 21 28 36      [10] 3377 	ld	hl,#0x3628
   8483 E5            [11] 3378 	push	hl
   8484 D5            [11] 3379 	push	de
   8485 33            [ 6] 3380 	inc	sp
   8486 DD 7E FD      [19] 3381 	ld	a,-3 (ix)
   8489 F5            [11] 3382 	push	af
   848A 33            [ 6] 3383 	inc	sp
   848B CD AE 54      [17] 3384 	call	_pathFinding
   848E 21 08 00      [10] 3385 	ld	hl,#8
   8491 39            [11] 3386 	add	hl,sp
   8492 F9            [ 6] 3387 	ld	sp,hl
   8493 D1            [10] 3388 	pop	de
   8494 C1            [10] 3389 	pop	bc
                           3390 ;src/main.c:823: dibujarEnemigo(actual);
   8495 C5            [11] 3391 	push	bc
   8496 D5            [11] 3392 	push	de
   8497 C5            [11] 3393 	push	bc
   8498 CD 09 75      [17] 3394 	call	_dibujarEnemigo
   849B F1            [10] 3395 	pop	af
   849C D1            [10] 3396 	pop	de
   849D C1            [10] 3397 	pop	bc
                           3398 ;src/main.c:825: ++actual;
   849E 21 43 01      [10] 3399 	ld	hl,#0x0143
   84A1 09            [11] 3400 	add	hl,bc
   84A2 4D            [ 4] 3401 	ld	c,l
   84A3 44            [ 4] 3402 	ld	b,h
   84A4 C3 F2 83      [10] 3403 	jp	00101$
   84A7                    3404 00104$:
   84A7 DD F9         [10] 3405 	ld	sp, ix
   84A9 DD E1         [14] 3406 	pop	ix
   84AB C9            [10] 3407 	ret
                           3408 ;src/main.c:829: void inicializarJuego() {
                           3409 ;	---------------------------------
                           3410 ; Function inicializarJuego
                           3411 ; ---------------------------------
   84AC                    3412 _inicializarJuego::
                           3413 ;src/main.c:831: iter = 0;
   84AC 21 DD 69      [10] 3414 	ld	hl,#_iter + 0
   84AF 36 00         [10] 3415 	ld	(hl), #0x00
                           3416 ;src/main.c:832: num_mapa = 0;
   84B1 21 E0 69      [10] 3417 	ld	hl,#_num_mapa + 0
   84B4 36 00         [10] 3418 	ld	(hl), #0x00
                           3419 ;src/main.c:833: mapa = mapas[num_mapa];
   84B6 21 7E 72      [10] 3420 	ld	hl, #_mapas + 0
   84B9 7E            [ 7] 3421 	ld	a,(hl)
   84BA FD 21 DE 69   [14] 3422 	ld	iy,#_mapa
   84BE FD 77 00      [19] 3423 	ld	0 (iy),a
   84C1 23            [ 6] 3424 	inc	hl
   84C2 7E            [ 7] 3425 	ld	a,(hl)
   84C3 32 DF 69      [13] 3426 	ld	(#_mapa + 1),a
                           3427 ;src/main.c:834: cpct_etm_setTileset2x4(g_tileset);
   84C6 21 E0 24      [10] 3428 	ld	hl,#_g_tileset
   84C9 CD EA 59      [17] 3429 	call	_cpct_etm_setTileset2x4
                           3430 ;src/main.c:836: dibujarMapa();
   84CC CD 68 72      [17] 3431 	call	_dibujarMapa
                           3432 ;src/main.c:838: borrarPantallaArriba(0, 0, 40, 1);
   84CF 21 28 01      [10] 3433 	ld	hl,#0x0128
   84D2 E5            [11] 3434 	push	hl
   84D3 21 00 00      [10] 3435 	ld	hl,#0x0000
   84D6 E5            [11] 3436 	push	hl
   84D7 CD 91 82      [17] 3437 	call	_borrarPantallaArriba
   84DA F1            [10] 3438 	pop	af
   84DB F1            [10] 3439 	pop	af
                           3440 ;src/main.c:839: barraPuntuacionInicial();
   84DC CD CF 81      [17] 3441 	call	_barraPuntuacionInicial
                           3442 ;src/main.c:842: prota.x = prota.px = 50;
   84DF 21 CD 69      [10] 3443 	ld	hl,#(_prota + 0x0002)
   84E2 36 32         [10] 3444 	ld	(hl),#0x32
   84E4 21 CB 69      [10] 3445 	ld	hl,#_prota
   84E7 36 32         [10] 3446 	ld	(hl),#0x32
                           3447 ;src/main.c:843: prota.y = prota.py = 76 + ORIGEN_MAPA_Y;
   84E9 21 CE 69      [10] 3448 	ld	hl,#(_prota + 0x0003)
   84EC 36 64         [10] 3449 	ld	(hl),#0x64
   84EE 21 CC 69      [10] 3450 	ld	hl,#(_prota + 0x0001)
   84F1 36 64         [10] 3451 	ld	(hl),#0x64
                           3452 ;src/main.c:844: prota.mover  = NO;
   84F3 21 D1 69      [10] 3453 	ld	hl,#(_prota + 0x0006)
   84F6 36 00         [10] 3454 	ld	(hl),#0x00
                           3455 ;src/main.c:845: prota.mira=M_derecha;
   84F8 21 D2 69      [10] 3456 	ld	hl,#(_prota + 0x0007)
   84FB 36 00         [10] 3457 	ld	(hl),#0x00
                           3458 ;src/main.c:846: prota.sprite = g_hero;
   84FD 21 A8 4A      [10] 3459 	ld	hl,#_g_hero
   8500 22 CF 69      [16] 3460 	ld	((_prota + 0x0004)), hl
                           3461 ;src/main.c:850: cu.x = cu.px = 0;
   8503 21 D5 69      [10] 3462 	ld	hl,#(_cu + 0x0002)
   8506 36 00         [10] 3463 	ld	(hl),#0x00
   8508 21 D3 69      [10] 3464 	ld	hl,#_cu
   850B 36 00         [10] 3465 	ld	(hl),#0x00
                           3466 ;src/main.c:851: cu.y = cu.py = 0;
   850D 21 D6 69      [10] 3467 	ld	hl,#(_cu + 0x0003)
   8510 36 00         [10] 3468 	ld	(hl),#0x00
   8512 21 D4 69      [10] 3469 	ld	hl,#(_cu + 0x0001)
   8515 36 00         [10] 3470 	ld	(hl),#0x00
                           3471 ;src/main.c:852: cu.lanzado = NO;
   8517 21 D9 69      [10] 3472 	ld	hl,#(_cu + 0x0006)
   851A 36 00         [10] 3473 	ld	(hl),#0x00
                           3474 ;src/main.c:853: cu.mover = NO;
   851C 21 DC 69      [10] 3475 	ld	hl,#(_cu + 0x0009)
   851F 36 00         [10] 3476 	ld	(hl),#0x00
                           3477 ;src/main.c:855: inicializarEnemy();
   8521 CD E3 83      [17] 3478 	call	_inicializarEnemy
                           3479 ;src/main.c:857: dibujarProta();
   8524 C3 8E 72      [10] 3480 	jp  _dibujarProta
                           3481 ;src/main.c:860: void main(void) {
                           3482 ;	---------------------------------
                           3483 ; Function main
                           3484 ; ---------------------------------
   8527                    3485 _main::
   8527 DD E5         [15] 3486 	push	ix
   8529 DD 21 00 00   [14] 3487 	ld	ix,#0
   852D DD 39         [15] 3488 	add	ix,sp
   852F 3B            [ 6] 3489 	dec	sp
                           3490 ;src/main.c:865: inicializarCPC();
   8530 CD C0 83      [17] 3491 	call	_inicializarCPC
                           3492 ;src/main.c:866: menuInicio();
   8533 CD E4 82      [17] 3493 	call	_menuInicio
                           3494 ;src/main.c:868: inicializarJuego();
   8536 CD AC 84      [17] 3495 	call	_inicializarJuego
                           3496 ;src/main.c:869: cpct_akp_musicPlay();
   8539 CD 51 5B      [17] 3497 	call	_cpct_akp_musicPlay
                           3498 ;src/main.c:871: while (1) {
   853C                    3499 00119$:
                           3500 ;src/main.c:874: i = 1 + 1;
   853C DD 36 FF 02   [19] 3501 	ld	-1 (ix),#0x02
                           3502 ;src/main.c:877: comprobarTeclado();
   8540 CD C7 80      [17] 3503 	call	_comprobarTeclado
                           3504 ;src/main.c:878: moverCuchillo();
   8543 CD 2A 81      [17] 3505 	call	_moverCuchillo
                           3506 ;src/main.c:879: updateEnemies();
   8546 CD FE 7C      [17] 3507 	call	_updateEnemies
                           3508 ;src/main.c:894: actual = enemy;
                           3509 ;src/main.c:896: cpct_waitVSYNC();
   8549 CD 1B 5B      [17] 3510 	call	_cpct_waitVSYNC
                           3511 ;src/main.c:898: if (prota.mover) {
   854C 01 D1 69      [10] 3512 	ld	bc,#_prota+6
   854F 0A            [ 7] 3513 	ld	a,(bc)
   8550 B7            [ 4] 3514 	or	a, a
   8551 28 07         [12] 3515 	jr	Z,00102$
                           3516 ;src/main.c:899: redibujarProta();
   8553 C5            [11] 3517 	push	bc
   8554 CD 5F 73      [17] 3518 	call	_redibujarProta
   8557 C1            [10] 3519 	pop	bc
                           3520 ;src/main.c:900: prota.mover = NO;
   8558 AF            [ 4] 3521 	xor	a, a
   8559 02            [ 7] 3522 	ld	(bc),a
   855A                    3523 00102$:
                           3524 ;src/main.c:902: if(cu.lanzado && cu.mover){
   855A 21 D9 69      [10] 3525 	ld	hl,#_cu + 6
   855D 4E            [ 7] 3526 	ld	c,(hl)
   855E 11 DC 69      [10] 3527 	ld	de,#_cu + 9
   8561 79            [ 4] 3528 	ld	a,c
   8562 B7            [ 4] 3529 	or	a, a
   8563 28 09         [12] 3530 	jr	Z,00107$
   8565 1A            [ 7] 3531 	ld	a,(de)
   8566 B7            [ 4] 3532 	or	a, a
   8567 28 05         [12] 3533 	jr	Z,00107$
                           3534 ;src/main.c:903: redibujarCuchillo();
   8569 CD 97 7F      [17] 3535 	call	_redibujarCuchillo
   856C 18 0B         [12] 3536 	jr	00132$
   856E                    3537 00107$:
                           3538 ;src/main.c:904: }else if (cu.lanzado && !cu.mover){
   856E 79            [ 4] 3539 	ld	a,c
   856F B7            [ 4] 3540 	or	a, a
   8570 28 07         [12] 3541 	jr	Z,00132$
   8572 1A            [ 7] 3542 	ld	a,(de)
   8573 B7            [ 4] 3543 	or	a, a
   8574 20 03         [12] 3544 	jr	NZ,00132$
                           3545 ;src/main.c:905: borrarCuchillo();
   8576 CD 19 7F      [17] 3546 	call	_borrarCuchillo
                           3547 ;src/main.c:908: while(--i){
   8579                    3548 00132$:
   8579 01 BF 64      [10] 3549 	ld	bc,#_enemy
   857C                    3550 00115$:
   857C DD 35 FF      [23] 3551 	dec	-1 (ix)
   857F DD 7E FF      [19] 3552 	ld	a, -1 (ix)
   8582 B7            [ 4] 3553 	or	a, a
   8583 28 43         [12] 3554 	jr	Z,00117$
                           3555 ;src/main.c:909: if(actual->mover){
   8585 C5            [11] 3556 	push	bc
   8586 FD E1         [14] 3557 	pop	iy
   8588 FD 7E 06      [19] 3558 	ld	a,6 (iy)
   858B B7            [ 4] 3559 	or	a, a
   858C 28 07         [12] 3560 	jr	Z,00111$
                           3561 ;src/main.c:910: redibujarEnemigo(actual);
   858E C5            [11] 3562 	push	bc
   858F C5            [11] 3563 	push	bc
   8590 CD 7D 76      [17] 3564 	call	_redibujarEnemigo
   8593 F1            [10] 3565 	pop	af
   8594 C1            [10] 3566 	pop	bc
   8595                    3567 00111$:
                           3568 ;src/main.c:912: if (actual->muerto && actual->muertes == 0){
   8595 C5            [11] 3569 	push	bc
   8596 FD E1         [14] 3570 	pop	iy
   8598 FD 7E 08      [19] 3571 	ld	a,8 (iy)
   859B B7            [ 4] 3572 	or	a, a
   859C 28 22         [12] 3573 	jr	Z,00113$
   859E 21 0A 00      [10] 3574 	ld	hl,#0x000A
   85A1 09            [11] 3575 	add	hl,bc
   85A2 7E            [ 7] 3576 	ld	a,(hl)
   85A3 B7            [ 4] 3577 	or	a, a
   85A4 20 1A         [12] 3578 	jr	NZ,00113$
                           3579 ;src/main.c:913: borrarEnemigo(actual);
   85A6 E5            [11] 3580 	push	hl
   85A7 C5            [11] 3581 	push	bc
   85A8 C5            [11] 3582 	push	bc
   85A9 CD E9 75      [17] 3583 	call	_borrarEnemigo
   85AC F1            [10] 3584 	pop	af
   85AD C1            [10] 3585 	pop	bc
   85AE C5            [11] 3586 	push	bc
   85AF C5            [11] 3587 	push	bc
   85B0 CD 41 75      [17] 3588 	call	_dibujarExplosion
   85B3 F1            [10] 3589 	pop	af
   85B4 C1            [10] 3590 	pop	bc
   85B5 E1            [10] 3591 	pop	hl
                           3592 ;src/main.c:916: actual->muertes++;
   85B6 5E            [ 7] 3593 	ld	e,(hl)
   85B7 1C            [ 4] 3594 	inc	e
   85B8 73            [ 7] 3595 	ld	(hl),e
                           3596 ;src/main.c:917: actual->x = 0;
   85B9 AF            [ 4] 3597 	xor	a, a
   85BA 02            [ 7] 3598 	ld	(bc),a
                           3599 ;src/main.c:918: actual->y = 0;
   85BB 59            [ 4] 3600 	ld	e, c
   85BC 50            [ 4] 3601 	ld	d, b
   85BD 13            [ 6] 3602 	inc	de
   85BE AF            [ 4] 3603 	xor	a, a
   85BF 12            [ 7] 3604 	ld	(de),a
   85C0                    3605 00113$:
                           3606 ;src/main.c:920: ++actual;
   85C0 21 43 01      [10] 3607 	ld	hl,#0x0143
   85C3 09            [11] 3608 	add	hl,bc
   85C4 4D            [ 4] 3609 	ld	c,l
   85C5 44            [ 4] 3610 	ld	b,h
   85C6 18 B4         [12] 3611 	jr	00115$
   85C8                    3612 00117$:
                           3613 ;src/main.c:923: cpct_waitVSYNC();
   85C8 CD 1B 5B      [17] 3614 	call	_cpct_waitVSYNC
   85CB C3 3C 85      [10] 3615 	jp	00119$
   85CE 33            [ 6] 3616 	inc	sp
   85CF DD E1         [14] 3617 	pop	ix
   85D1 C9            [10] 3618 	ret
                           3619 	.area _CODE
                           3620 	.area _INITIALIZER
                           3621 	.area _CABS (ABS)
   0F00                    3622 	.org 0x0F00
   0F00                    3623 _G_song:
   0F00 41                 3624 	.db #0x41	; 65	'A'
   0F01 54                 3625 	.db #0x54	; 84	'T'
   0F02 31                 3626 	.db #0x31	; 49	'1'
   0F03 30                 3627 	.db #0x30	; 48	'0'
   0F04 01                 3628 	.db #0x01	; 1
   0F05 40                 3629 	.db #0x40	; 64
   0F06 42                 3630 	.db #0x42	; 66	'B'
   0F07 0F                 3631 	.db #0x0F	; 15
   0F08 02                 3632 	.db #0x02	; 2
   0F09 06                 3633 	.db #0x06	; 6
   0F0A 1D                 3634 	.db #0x1D	; 29
   0F0B 00                 3635 	.db #0x00	; 0
   0F0C 10                 3636 	.db #0x10	; 16
   0F0D 40                 3637 	.db #0x40	; 64
   0F0E 19                 3638 	.db #0x19	; 25
   0F0F 40                 3639 	.db #0x40	; 64
   0F10 00                 3640 	.db #0x00	; 0
   0F11 00                 3641 	.db #0x00	; 0
   0F12 00                 3642 	.db #0x00	; 0
   0F13 00                 3643 	.db #0x00	; 0
   0F14 00                 3644 	.db #0x00	; 0
   0F15 00                 3645 	.db #0x00	; 0
   0F16 0D                 3646 	.db #0x0D	; 13
   0F17 12                 3647 	.db #0x12	; 18
   0F18 40                 3648 	.db #0x40	; 64
   0F19 01                 3649 	.db #0x01	; 1
   0F1A 00                 3650 	.db #0x00	; 0
   0F1B 7C                 3651 	.db #0x7C	; 124
   0F1C 18                 3652 	.db #0x18	; 24
   0F1D 78                 3653 	.db #0x78	; 120	'x'
   0F1E 0C                 3654 	.db #0x0C	; 12
   0F1F 34                 3655 	.db #0x34	; 52	'4'
   0F20 30                 3656 	.db #0x30	; 48	'0'
   0F21 2C                 3657 	.db #0x2C	; 44
   0F22 28                 3658 	.db #0x28	; 40
   0F23 24                 3659 	.db #0x24	; 36
   0F24 20                 3660 	.db #0x20	; 32
   0F25 1C                 3661 	.db #0x1C	; 28
   0F26 0D                 3662 	.db #0x0D	; 13
   0F27 25                 3663 	.db #0x25	; 37
   0F28 40                 3664 	.db #0x40	; 64
   0F29 20                 3665 	.db #0x20	; 32
   0F2A 00                 3666 	.db #0x00	; 0
   0F2B 00                 3667 	.db #0x00	; 0
   0F2C 00                 3668 	.db #0x00	; 0
   0F2D 39                 3669 	.db #0x39	; 57	'9'
   0F2E 40                 3670 	.db #0x40	; 64
   0F2F 00                 3671 	.db #0x00	; 0
   0F30 57                 3672 	.db #0x57	; 87	'W'
   0F31 40                 3673 	.db #0x40	; 64
   0F32 3B                 3674 	.db #0x3B	; 59
   0F33 40                 3675 	.db #0x40	; 64
   0F34 57                 3676 	.db #0x57	; 87	'W'
   0F35 40                 3677 	.db #0x40	; 64
   0F36 01                 3678 	.db #0x01	; 1
   0F37 2F                 3679 	.db #0x2F	; 47
   0F38 40                 3680 	.db #0x40	; 64
   0F39 19                 3681 	.db #0x19	; 25
   0F3A 00                 3682 	.db #0x00	; 0
   0F3B 76                 3683 	.db #0x76	; 118	'v'
   0F3C E1                 3684 	.db #0xE1	; 225
   0F3D 00                 3685 	.db #0x00	; 0
   0F3E 00                 3686 	.db #0x00	; 0
   0F3F 01                 3687 	.db #0x01	; 1
   0F40 04                 3688 	.db #0x04	; 4
   0F41 51                 3689 	.db #0x51	; 81	'Q'
   0F42 04                 3690 	.db #0x04	; 4
   0F43 37                 3691 	.db #0x37	; 55	'7'
   0F44 04                 3692 	.db #0x04	; 4
   0F45 4F                 3693 	.db #0x4F	; 79	'O'
   0F46 04                 3694 	.db #0x04	; 4
   0F47 37                 3695 	.db #0x37	; 55	'7'
   0F48 02                 3696 	.db #0x02	; 2
   0F49 4B                 3697 	.db #0x4B	; 75	'K'
   0F4A 02                 3698 	.db #0x02	; 2
   0F4B 37                 3699 	.db #0x37	; 55	'7'
   0F4C 04                 3700 	.db #0x04	; 4
   0F4D 4F                 3701 	.db #0x4F	; 79	'O'
   0F4E 04                 3702 	.db #0x04	; 4
   0F4F 37                 3703 	.db #0x37	; 55	'7'
   0F50 04                 3704 	.db #0x04	; 4
   0F51 4F                 3705 	.db #0x4F	; 79	'O'
   0F52 04                 3706 	.db #0x04	; 4
   0F53 37                 3707 	.db #0x37	; 55	'7'
   0F54 02                 3708 	.db #0x02	; 2
   0F55 4B                 3709 	.db #0x4B	; 75	'K'
   0F56 00                 3710 	.db #0x00	; 0
   0F57 42                 3711 	.db #0x42	; 66	'B'
   0F58 60                 3712 	.db #0x60	; 96
   0F59 00                 3713 	.db #0x00	; 0
   0F5A 42                 3714 	.db #0x42	; 66	'B'
   0F5B 80                 3715 	.db #0x80	; 128
   0F5C 00                 3716 	.db #0x00	; 0
   0F5D 00                 3717 	.db #0x00	; 0
   0F5E 42                 3718 	.db #0x42	; 66	'B'
   0F5F 00                 3719 	.db #0x00	; 0
   0F60 00                 3720 	.db #0x00	; 0
