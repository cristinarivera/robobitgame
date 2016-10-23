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
   64BF                      97 	.ds 1296
   69CF                      98 _prota::
   69CF                      99 	.ds 8
   69D7                     100 _cu::
   69D7                     101 	.ds 10
   69E1                     102 _iter::
   69E1                     103 	.ds 1
   69E2                     104 _mapa::
   69E2                     105 	.ds 2
   69E4                     106 _num_mapa::
   69E4                     107 	.ds 1
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
   726C                     177 _dibujarMapa::
                            178 ;src/main.c:113: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   726C 2A E2 69      [16]  179 	ld	hl,(_mapa)
   726F E5            [11]  180 	push	hl
   7270 21 F0 C0      [10]  181 	ld	hl,#0xC0F0
   7273 E5            [11]  182 	push	hl
   7274 21 2C 28      [10]  183 	ld	hl,#0x282C
   7277 E5            [11]  184 	push	hl
   7278 2E 00         [ 7]  185 	ld	l, #0x00
   727A E5            [11]  186 	push	hl
   727B AF            [ 4]  187 	xor	a, a
   727C F5            [11]  188 	push	af
   727D 33            [ 6]  189 	inc	sp
   727E CD 5B 59      [17]  190 	call	_cpct_etm_drawTileBox2x4
   7281 C9            [10]  191 	ret
   7282                     192 _mapas:
   7282 C0 1D               193 	.dw _g_map1
   7284 E0 16               194 	.dw _g_map2
   7286 00 10               195 	.dw _g_map3
   7288                     196 _spawnX:
   7288 00                  197 	.db #0x00	; 0
   7289 3C                  198 	.db #0x3C	; 60
   728A 47                  199 	.db #0x47	; 71	'G'
   728B 14                  200 	.db #0x14	; 20
   728C 3C                  201 	.db #0x3C	; 60
   728D                     202 _spawnY:
   728D 00                  203 	.db #0x00	; 0
   728E 2C                  204 	.db #0x2C	; 44
   728F 72                  205 	.db #0x72	; 114	'r'
   7290 8A                  206 	.db #0x8A	; 138
   7291 8A                  207 	.db #0x8A	; 138
                            208 ;src/main.c:116: void dibujarProta() {
                            209 ;	---------------------------------
                            210 ; Function dibujarProta
                            211 ; ---------------------------------
   7292                     212 _dibujarProta::
                            213 ;src/main.c:117: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   7292 21 D0 69      [10]  214 	ld	hl, #_prota + 1
   7295 56            [ 7]  215 	ld	d,(hl)
   7296 21 CF 69      [10]  216 	ld	hl, #_prota + 0
   7299 46            [ 7]  217 	ld	b,(hl)
   729A D5            [11]  218 	push	de
   729B 33            [ 6]  219 	inc	sp
   729C C5            [11]  220 	push	bc
   729D 33            [ 6]  221 	inc	sp
   729E 21 00 C0      [10]  222 	ld	hl,#0xC000
   72A1 E5            [11]  223 	push	hl
   72A2 CD 62 64      [17]  224 	call	_cpct_getScreenPtr
   72A5 EB            [ 4]  225 	ex	de,hl
                            226 ;src/main.c:118: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   72A6 ED 4B D3 69   [20]  227 	ld	bc, (#_prota + 4)
   72AA 21 00 0E      [10]  228 	ld	hl,#_g_tablatrans
   72AD E5            [11]  229 	push	hl
   72AE 21 07 16      [10]  230 	ld	hl,#0x1607
   72B1 E5            [11]  231 	push	hl
   72B2 D5            [11]  232 	push	de
   72B3 C5            [11]  233 	push	bc
   72B4 CD 82 64      [17]  234 	call	_cpct_drawSpriteMaskedAlignedTable
   72B7 C9            [10]  235 	ret
                            236 ;src/main.c:121: void borrarProta() {
                            237 ;	---------------------------------
                            238 ; Function borrarProta
                            239 ; ---------------------------------
   72B8                     240 _borrarProta::
   72B8 DD E5         [15]  241 	push	ix
   72BA DD 21 00 00   [14]  242 	ld	ix,#0
   72BE DD 39         [15]  243 	add	ix,sp
   72C0 F5            [11]  244 	push	af
   72C1 3B            [ 6]  245 	dec	sp
                            246 ;src/main.c:123: u8 w = 4 + (prota.px & 1);
   72C2 21 D1 69      [10]  247 	ld	hl, #_prota + 2
   72C5 4E            [ 7]  248 	ld	c,(hl)
   72C6 79            [ 4]  249 	ld	a,c
   72C7 E6 01         [ 7]  250 	and	a, #0x01
   72C9 47            [ 4]  251 	ld	b,a
   72CA 04            [ 4]  252 	inc	b
   72CB 04            [ 4]  253 	inc	b
   72CC 04            [ 4]  254 	inc	b
   72CD 04            [ 4]  255 	inc	b
                            256 ;src/main.c:126: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   72CE 21 D2 69      [10]  257 	ld	hl, #_prota + 3
   72D1 5E            [ 7]  258 	ld	e,(hl)
   72D2 CB 4B         [ 8]  259 	bit	1, e
   72D4 28 04         [12]  260 	jr	Z,00103$
   72D6 3E 01         [ 7]  261 	ld	a,#0x01
   72D8 18 02         [12]  262 	jr	00104$
   72DA                     263 00103$:
   72DA 3E 00         [ 7]  264 	ld	a,#0x00
   72DC                     265 00104$:
   72DC C6 06         [ 7]  266 	add	a, #0x06
   72DE DD 77 FD      [19]  267 	ld	-3 (ix),a
                            268 ;src/main.c:128: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   72E1 FD 2A E2 69   [20]  269 	ld	iy,(_mapa)
   72E5 16 00         [ 7]  270 	ld	d,#0x00
   72E7 7B            [ 4]  271 	ld	a,e
   72E8 C6 E8         [ 7]  272 	add	a,#0xE8
   72EA DD 77 FE      [19]  273 	ld	-2 (ix),a
   72ED 7A            [ 4]  274 	ld	a,d
   72EE CE FF         [ 7]  275 	adc	a,#0xFF
   72F0 DD 77 FF      [19]  276 	ld	-1 (ix),a
   72F3 DD 6E FE      [19]  277 	ld	l,-2 (ix)
   72F6 DD 66 FF      [19]  278 	ld	h,-1 (ix)
   72F9 DD CB FF 7E   [20]  279 	bit	7, -1 (ix)
   72FD 28 04         [12]  280 	jr	Z,00105$
   72FF 21 EB FF      [10]  281 	ld	hl,#0xFFEB
   7302 19            [11]  282 	add	hl,de
   7303                     283 00105$:
   7303 CB 2C         [ 8]  284 	sra	h
   7305 CB 1D         [ 8]  285 	rr	l
   7307 CB 2C         [ 8]  286 	sra	h
   7309 CB 1D         [ 8]  287 	rr	l
   730B 55            [ 4]  288 	ld	d,l
   730C CB 39         [ 8]  289 	srl	c
   730E FD E5         [15]  290 	push	iy
   7310 21 F0 C0      [10]  291 	ld	hl,#0xC0F0
   7313 E5            [11]  292 	push	hl
   7314 3E 28         [ 7]  293 	ld	a,#0x28
   7316 F5            [11]  294 	push	af
   7317 33            [ 6]  295 	inc	sp
   7318 DD 7E FD      [19]  296 	ld	a,-3 (ix)
   731B F5            [11]  297 	push	af
   731C 33            [ 6]  298 	inc	sp
   731D C5            [11]  299 	push	bc
   731E 33            [ 6]  300 	inc	sp
   731F D5            [11]  301 	push	de
   7320 33            [ 6]  302 	inc	sp
   7321 79            [ 4]  303 	ld	a,c
   7322 F5            [11]  304 	push	af
   7323 33            [ 6]  305 	inc	sp
   7324 CD 5B 59      [17]  306 	call	_cpct_etm_drawTileBox2x4
   7327 DD F9         [10]  307 	ld	sp, ix
   7329 DD E1         [14]  308 	pop	ix
   732B C9            [10]  309 	ret
                            310 ;src/main.c:131: void menuFin(){
                            311 ;	---------------------------------
                            312 ; Function menuFin
                            313 ; ---------------------------------
   732C                     314 _menuFin::
                            315 ;src/main.c:134: cpct_clearScreen(0);
   732C 21 00 40      [10]  316 	ld	hl,#0x4000
   732F E5            [11]  317 	push	hl
   7330 AF            [ 4]  318 	xor	a, a
   7331 F5            [11]  319 	push	af
   7332 33            [ 6]  320 	inc	sp
   7333 26 C0         [ 7]  321 	ld	h, #0xC0
   7335 E5            [11]  322 	push	hl
   7336 CD 41 5B      [17]  323 	call	_cpct_memset
                            324 ;src/main.c:136: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   7339 21 18 5A      [10]  325 	ld	hl,#0x5A18
   733C E5            [11]  326 	push	hl
   733D 21 00 C0      [10]  327 	ld	hl,#0xC000
   7340 E5            [11]  328 	push	hl
   7341 CD 62 64      [17]  329 	call	_cpct_getScreenPtr
   7344 4D            [ 4]  330 	ld	c,l
   7345 44            [ 4]  331 	ld	b,h
                            332 ;src/main.c:137: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   7346 21 02 00      [10]  333 	ld	hl,#0x0002
   7349 E5            [11]  334 	push	hl
   734A C5            [11]  335 	push	bc
   734B 21 59 73      [10]  336 	ld	hl,#___str_0
   734E E5            [11]  337 	push	hl
   734F CD 92 58      [17]  338 	call	_cpct_drawStringM0
   7352 21 06 00      [10]  339 	ld	hl,#6
   7355 39            [11]  340 	add	hl,sp
   7356 F9            [ 6]  341 	ld	sp,hl
                            342 ;src/main.c:139: while(1){}
   7357                     343 00102$:
   7357 18 FE         [12]  344 	jr	00102$
   7359                     345 ___str_0:
   7359 47 41 4D 45 20 4F   346 	.ascii "GAME OVER"
        56 45 52
   7362 00                  347 	.db 0x00
                            348 ;src/main.c:142: void redibujarProta() {
                            349 ;	---------------------------------
                            350 ; Function redibujarProta
                            351 ; ---------------------------------
   7363                     352 _redibujarProta::
                            353 ;src/main.c:143: borrarProta();
   7363 CD B8 72      [17]  354 	call	_borrarProta
                            355 ;src/main.c:144: prota.px = prota.x;
   7366 01 D1 69      [10]  356 	ld	bc,#_prota + 2
   7369 3A CF 69      [13]  357 	ld	a, (#_prota + 0)
   736C 02            [ 7]  358 	ld	(bc),a
                            359 ;src/main.c:145: prota.py = prota.y;
   736D 01 D2 69      [10]  360 	ld	bc,#_prota + 3
   7370 3A D0 69      [13]  361 	ld	a, (#_prota + 1)
   7373 02            [ 7]  362 	ld	(bc),a
                            363 ;src/main.c:146: dibujarProta();
   7374 C3 92 72      [10]  364 	jp  _dibujarProta
                            365 ;src/main.c:149: u8* getTilePtr(u8 x, u8 y) {
                            366 ;	---------------------------------
                            367 ; Function getTilePtr
                            368 ; ---------------------------------
   7377                     369 _getTilePtr::
   7377 DD E5         [15]  370 	push	ix
   7379 DD 21 00 00   [14]  371 	ld	ix,#0
   737D DD 39         [15]  372 	add	ix,sp
                            373 ;src/main.c:150: return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
   737F DD 4E 05      [19]  374 	ld	c,5 (ix)
   7382 06 00         [ 7]  375 	ld	b,#0x00
   7384 79            [ 4]  376 	ld	a,c
   7385 C6 E8         [ 7]  377 	add	a,#0xE8
   7387 5F            [ 4]  378 	ld	e,a
   7388 78            [ 4]  379 	ld	a,b
   7389 CE FF         [ 7]  380 	adc	a,#0xFF
   738B 57            [ 4]  381 	ld	d,a
   738C 6B            [ 4]  382 	ld	l, e
   738D 62            [ 4]  383 	ld	h, d
   738E CB 7A         [ 8]  384 	bit	7, d
   7390 28 04         [12]  385 	jr	Z,00103$
   7392 21 EB FF      [10]  386 	ld	hl,#0xFFEB
   7395 09            [11]  387 	add	hl,bc
   7396                     388 00103$:
   7396 CB 2C         [ 8]  389 	sra	h
   7398 CB 1D         [ 8]  390 	rr	l
   739A CB 2C         [ 8]  391 	sra	h
   739C CB 1D         [ 8]  392 	rr	l
   739E 4D            [ 4]  393 	ld	c, l
   739F 44            [ 4]  394 	ld	b, h
   73A0 29            [11]  395 	add	hl, hl
   73A1 29            [11]  396 	add	hl, hl
   73A2 09            [11]  397 	add	hl, bc
   73A3 29            [11]  398 	add	hl, hl
   73A4 29            [11]  399 	add	hl, hl
   73A5 29            [11]  400 	add	hl, hl
   73A6 4D            [ 4]  401 	ld	c,l
   73A7 44            [ 4]  402 	ld	b,h
   73A8 2A E2 69      [16]  403 	ld	hl,(_mapa)
   73AB 09            [11]  404 	add	hl,bc
   73AC DD 4E 04      [19]  405 	ld	c,4 (ix)
   73AF CB 39         [ 8]  406 	srl	c
   73B1 59            [ 4]  407 	ld	e,c
   73B2 16 00         [ 7]  408 	ld	d,#0x00
   73B4 19            [11]  409 	add	hl,de
   73B5 DD E1         [14]  410 	pop	ix
   73B7 C9            [10]  411 	ret
                            412 ;src/main.c:153: u8 checkCollision(int direction) { // check optimization
                            413 ;	---------------------------------
                            414 ; Function checkCollision
                            415 ; ---------------------------------
   73B8                     416 _checkCollision::
   73B8 DD E5         [15]  417 	push	ix
   73BA DD 21 00 00   [14]  418 	ld	ix,#0
   73BE DD 39         [15]  419 	add	ix,sp
   73C0 F5            [11]  420 	push	af
                            421 ;src/main.c:154: u8 *headTile=0, *feetTile=0, *waistTile=0;
   73C1 21 00 00      [10]  422 	ld	hl,#0x0000
   73C4 E3            [19]  423 	ex	(sp), hl
   73C5 11 00 00      [10]  424 	ld	de,#0x0000
   73C8 01 00 00      [10]  425 	ld	bc,#0x0000
                            426 ;src/main.c:156: switch (direction) {
   73CB DD CB 05 7E   [20]  427 	bit	7, 5 (ix)
   73CF C2 EC 74      [10]  428 	jp	NZ,00105$
   73D2 3E 03         [ 7]  429 	ld	a,#0x03
   73D4 DD BE 04      [19]  430 	cp	a, 4 (ix)
   73D7 3E 00         [ 7]  431 	ld	a,#0x00
   73D9 DD 9E 05      [19]  432 	sbc	a, 5 (ix)
   73DC E2 E1 73      [10]  433 	jp	PO, 00128$
   73DF EE 80         [ 7]  434 	xor	a, #0x80
   73E1                     435 00128$:
   73E1 FA EC 74      [10]  436 	jp	M,00105$
   73E4 DD 5E 04      [19]  437 	ld	e,4 (ix)
   73E7 16 00         [ 7]  438 	ld	d,#0x00
   73E9 21 F0 73      [10]  439 	ld	hl,#00129$
   73EC 19            [11]  440 	add	hl,de
   73ED 19            [11]  441 	add	hl,de
   73EE 19            [11]  442 	add	hl,de
   73EF E9            [ 4]  443 	jp	(hl)
   73F0                     444 00129$:
   73F0 C3 FC 73      [10]  445 	jp	00101$
   73F3 C3 47 74      [10]  446 	jp	00102$
   73F6 C3 88 74      [10]  447 	jp	00103$
   73F9 C3 BB 74      [10]  448 	jp	00104$
                            449 ;src/main.c:157: case 0:
   73FC                     450 00101$:
                            451 ;src/main.c:158: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   73FC 21 D0 69      [10]  452 	ld	hl, #(_prota + 0x0001) + 0
   73FF 5E            [ 7]  453 	ld	e,(hl)
   7400 21 CF 69      [10]  454 	ld	hl, #_prota + 0
   7403 4E            [ 7]  455 	ld	c,(hl)
   7404 0C            [ 4]  456 	inc	c
   7405 0C            [ 4]  457 	inc	c
   7406 0C            [ 4]  458 	inc	c
   7407 0C            [ 4]  459 	inc	c
   7408 7B            [ 4]  460 	ld	a,e
   7409 F5            [11]  461 	push	af
   740A 33            [ 6]  462 	inc	sp
   740B 79            [ 4]  463 	ld	a,c
   740C F5            [11]  464 	push	af
   740D 33            [ 6]  465 	inc	sp
   740E CD 77 73      [17]  466 	call	_getTilePtr
   7411 F1            [10]  467 	pop	af
   7412 33            [ 6]  468 	inc	sp
   7413 33            [ 6]  469 	inc	sp
   7414 E5            [11]  470 	push	hl
                            471 ;src/main.c:159: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   7415 3A D0 69      [13]  472 	ld	a, (#(_prota + 0x0001) + 0)
   7418 C6 14         [ 7]  473 	add	a, #0x14
   741A 4F            [ 4]  474 	ld	c,a
   741B 21 CF 69      [10]  475 	ld	hl, #_prota + 0
   741E 46            [ 7]  476 	ld	b,(hl)
   741F 04            [ 4]  477 	inc	b
   7420 04            [ 4]  478 	inc	b
   7421 04            [ 4]  479 	inc	b
   7422 04            [ 4]  480 	inc	b
   7423 79            [ 4]  481 	ld	a,c
   7424 F5            [11]  482 	push	af
   7425 33            [ 6]  483 	inc	sp
   7426 C5            [11]  484 	push	bc
   7427 33            [ 6]  485 	inc	sp
   7428 CD 77 73      [17]  486 	call	_getTilePtr
   742B F1            [10]  487 	pop	af
   742C EB            [ 4]  488 	ex	de,hl
                            489 ;src/main.c:160: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   742D 3A D0 69      [13]  490 	ld	a, (#(_prota + 0x0001) + 0)
   7430 C6 0B         [ 7]  491 	add	a, #0x0B
   7432 47            [ 4]  492 	ld	b,a
   7433 3A CF 69      [13]  493 	ld	a, (#_prota + 0)
   7436 C6 04         [ 7]  494 	add	a, #0x04
   7438 D5            [11]  495 	push	de
   7439 C5            [11]  496 	push	bc
   743A 33            [ 6]  497 	inc	sp
   743B F5            [11]  498 	push	af
   743C 33            [ 6]  499 	inc	sp
   743D CD 77 73      [17]  500 	call	_getTilePtr
   7440 F1            [10]  501 	pop	af
   7441 4D            [ 4]  502 	ld	c,l
   7442 44            [ 4]  503 	ld	b,h
   7443 D1            [10]  504 	pop	de
                            505 ;src/main.c:161: break;
   7444 C3 EC 74      [10]  506 	jp	00105$
                            507 ;src/main.c:162: case 1:
   7447                     508 00102$:
                            509 ;src/main.c:163: headTile  = getTilePtr(prota.x - 1, prota.y);
   7447 21 D0 69      [10]  510 	ld	hl, #(_prota + 0x0001) + 0
   744A 56            [ 7]  511 	ld	d,(hl)
   744B 21 CF 69      [10]  512 	ld	hl, #_prota + 0
   744E 46            [ 7]  513 	ld	b,(hl)
   744F 05            [ 4]  514 	dec	b
   7450 D5            [11]  515 	push	de
   7451 33            [ 6]  516 	inc	sp
   7452 C5            [11]  517 	push	bc
   7453 33            [ 6]  518 	inc	sp
   7454 CD 77 73      [17]  519 	call	_getTilePtr
   7457 F1            [10]  520 	pop	af
   7458 33            [ 6]  521 	inc	sp
   7459 33            [ 6]  522 	inc	sp
   745A E5            [11]  523 	push	hl
                            524 ;src/main.c:164: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
   745B 3A D0 69      [13]  525 	ld	a, (#(_prota + 0x0001) + 0)
   745E C6 14         [ 7]  526 	add	a, #0x14
   7460 57            [ 4]  527 	ld	d,a
   7461 21 CF 69      [10]  528 	ld	hl, #_prota + 0
   7464 46            [ 7]  529 	ld	b,(hl)
   7465 05            [ 4]  530 	dec	b
   7466 D5            [11]  531 	push	de
   7467 33            [ 6]  532 	inc	sp
   7468 C5            [11]  533 	push	bc
   7469 33            [ 6]  534 	inc	sp
   746A CD 77 73      [17]  535 	call	_getTilePtr
   746D F1            [10]  536 	pop	af
   746E EB            [ 4]  537 	ex	de,hl
                            538 ;src/main.c:165: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
   746F 3A D0 69      [13]  539 	ld	a, (#(_prota + 0x0001) + 0)
   7472 C6 0B         [ 7]  540 	add	a, #0x0B
   7474 47            [ 4]  541 	ld	b,a
   7475 3A CF 69      [13]  542 	ld	a, (#_prota + 0)
   7478 C6 FF         [ 7]  543 	add	a,#0xFF
   747A D5            [11]  544 	push	de
   747B C5            [11]  545 	push	bc
   747C 33            [ 6]  546 	inc	sp
   747D F5            [11]  547 	push	af
   747E 33            [ 6]  548 	inc	sp
   747F CD 77 73      [17]  549 	call	_getTilePtr
   7482 F1            [10]  550 	pop	af
   7483 4D            [ 4]  551 	ld	c,l
   7484 44            [ 4]  552 	ld	b,h
   7485 D1            [10]  553 	pop	de
                            554 ;src/main.c:166: break;
   7486 18 64         [12]  555 	jr	00105$
                            556 ;src/main.c:167: case 2:
   7488                     557 00103$:
                            558 ;src/main.c:168: headTile   = getTilePtr(prota.x, prota.y - 2);
   7488 3A D0 69      [13]  559 	ld	a, (#(_prota + 0x0001) + 0)
   748B C6 FE         [ 7]  560 	add	a,#0xFE
   748D 21 CF 69      [10]  561 	ld	hl, #_prota + 0
   7490 56            [ 7]  562 	ld	d,(hl)
   7491 C5            [11]  563 	push	bc
   7492 F5            [11]  564 	push	af
   7493 33            [ 6]  565 	inc	sp
   7494 D5            [11]  566 	push	de
   7495 33            [ 6]  567 	inc	sp
   7496 CD 77 73      [17]  568 	call	_getTilePtr
   7499 F1            [10]  569 	pop	af
   749A C1            [10]  570 	pop	bc
   749B 33            [ 6]  571 	inc	sp
   749C 33            [ 6]  572 	inc	sp
   749D E5            [11]  573 	push	hl
                            574 ;src/main.c:169: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
   749E 21 D0 69      [10]  575 	ld	hl, #(_prota + 0x0001) + 0
   74A1 56            [ 7]  576 	ld	d,(hl)
   74A2 15            [ 4]  577 	dec	d
   74A3 15            [ 4]  578 	dec	d
   74A4 3A CF 69      [13]  579 	ld	a, (#_prota + 0)
   74A7 C6 03         [ 7]  580 	add	a, #0x03
   74A9 C5            [11]  581 	push	bc
   74AA D5            [11]  582 	push	de
   74AB 33            [ 6]  583 	inc	sp
   74AC F5            [11]  584 	push	af
   74AD 33            [ 6]  585 	inc	sp
   74AE CD 77 73      [17]  586 	call	_getTilePtr
   74B1 F1            [10]  587 	pop	af
   74B2 EB            [ 4]  588 	ex	de,hl
   74B3 C1            [10]  589 	pop	bc
                            590 ;src/main.c:170: *waistTile = 0;
   74B4 21 00 00      [10]  591 	ld	hl,#0x0000
   74B7 36 00         [10]  592 	ld	(hl),#0x00
                            593 ;src/main.c:171: break;
   74B9 18 31         [12]  594 	jr	00105$
                            595 ;src/main.c:172: case 3:
   74BB                     596 00104$:
                            597 ;src/main.c:173: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
   74BB 3A D0 69      [13]  598 	ld	a, (#(_prota + 0x0001) + 0)
   74BE C6 16         [ 7]  599 	add	a, #0x16
   74C0 21 CF 69      [10]  600 	ld	hl, #_prota + 0
   74C3 56            [ 7]  601 	ld	d,(hl)
   74C4 C5            [11]  602 	push	bc
   74C5 F5            [11]  603 	push	af
   74C6 33            [ 6]  604 	inc	sp
   74C7 D5            [11]  605 	push	de
   74C8 33            [ 6]  606 	inc	sp
   74C9 CD 77 73      [17]  607 	call	_getTilePtr
   74CC F1            [10]  608 	pop	af
   74CD C1            [10]  609 	pop	bc
   74CE 33            [ 6]  610 	inc	sp
   74CF 33            [ 6]  611 	inc	sp
   74D0 E5            [11]  612 	push	hl
                            613 ;src/main.c:174: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   74D1 3A D0 69      [13]  614 	ld	a, (#(_prota + 0x0001) + 0)
   74D4 C6 16         [ 7]  615 	add	a, #0x16
   74D6 57            [ 4]  616 	ld	d,a
   74D7 3A CF 69      [13]  617 	ld	a, (#_prota + 0)
   74DA C6 03         [ 7]  618 	add	a, #0x03
   74DC C5            [11]  619 	push	bc
   74DD D5            [11]  620 	push	de
   74DE 33            [ 6]  621 	inc	sp
   74DF F5            [11]  622 	push	af
   74E0 33            [ 6]  623 	inc	sp
   74E1 CD 77 73      [17]  624 	call	_getTilePtr
   74E4 F1            [10]  625 	pop	af
   74E5 EB            [ 4]  626 	ex	de,hl
   74E6 C1            [10]  627 	pop	bc
                            628 ;src/main.c:175: *waistTile = 0;
   74E7 21 00 00      [10]  629 	ld	hl,#0x0000
   74EA 36 00         [10]  630 	ld	(hl),#0x00
                            631 ;src/main.c:177: }
   74EC                     632 00105$:
                            633 ;src/main.c:179: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   74EC E1            [10]  634 	pop	hl
   74ED E5            [11]  635 	push	hl
   74EE 6E            [ 7]  636 	ld	l,(hl)
   74EF 3E 02         [ 7]  637 	ld	a,#0x02
   74F1 95            [ 4]  638 	sub	a, l
   74F2 38 0E         [12]  639 	jr	C,00106$
   74F4 1A            [ 7]  640 	ld	a,(de)
   74F5 5F            [ 4]  641 	ld	e,a
   74F6 3E 02         [ 7]  642 	ld	a,#0x02
   74F8 93            [ 4]  643 	sub	a, e
   74F9 38 07         [12]  644 	jr	C,00106$
   74FB 0A            [ 7]  645 	ld	a,(bc)
   74FC 4F            [ 4]  646 	ld	c,a
   74FD 3E 02         [ 7]  647 	ld	a,#0x02
   74FF 91            [ 4]  648 	sub	a, c
   7500 30 04         [12]  649 	jr	NC,00107$
   7502                     650 00106$:
                            651 ;src/main.c:180: return 1;
   7502 2E 01         [ 7]  652 	ld	l,#0x01
   7504 18 02         [12]  653 	jr	00110$
   7506                     654 00107$:
                            655 ;src/main.c:182: return 0;
   7506 2E 00         [ 7]  656 	ld	l,#0x00
   7508                     657 00110$:
   7508 DD F9         [10]  658 	ld	sp, ix
   750A DD E1         [14]  659 	pop	ix
   750C C9            [10]  660 	ret
                            661 ;src/main.c:185: void dibujarEnemigo(TEnemy *enemy) {
                            662 ;	---------------------------------
                            663 ; Function dibujarEnemigo
                            664 ; ---------------------------------
   750D                     665 _dibujarEnemigo::
   750D DD E5         [15]  666 	push	ix
   750F DD 21 00 00   [14]  667 	ld	ix,#0
   7513 DD 39         [15]  668 	add	ix,sp
                            669 ;src/main.c:186: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   7515 DD 4E 04      [19]  670 	ld	c,4 (ix)
   7518 DD 46 05      [19]  671 	ld	b,5 (ix)
   751B 69            [ 4]  672 	ld	l, c
   751C 60            [ 4]  673 	ld	h, b
   751D 23            [ 6]  674 	inc	hl
   751E 56            [ 7]  675 	ld	d,(hl)
   751F 0A            [ 7]  676 	ld	a,(bc)
   7520 C5            [11]  677 	push	bc
   7521 D5            [11]  678 	push	de
   7522 33            [ 6]  679 	inc	sp
   7523 F5            [11]  680 	push	af
   7524 33            [ 6]  681 	inc	sp
   7525 21 00 C0      [10]  682 	ld	hl,#0xC000
   7528 E5            [11]  683 	push	hl
   7529 CD 62 64      [17]  684 	call	_cpct_getScreenPtr
   752C EB            [ 4]  685 	ex	de,hl
                            686 ;src/main.c:187: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   752D E1            [10]  687 	pop	hl
   752E 01 04 00      [10]  688 	ld	bc, #0x0004
   7531 09            [11]  689 	add	hl, bc
   7532 4E            [ 7]  690 	ld	c,(hl)
   7533 23            [ 6]  691 	inc	hl
   7534 46            [ 7]  692 	ld	b,(hl)
   7535 21 00 0E      [10]  693 	ld	hl,#_g_tablatrans
   7538 E5            [11]  694 	push	hl
   7539 21 04 16      [10]  695 	ld	hl,#0x1604
   753C E5            [11]  696 	push	hl
   753D D5            [11]  697 	push	de
   753E C5            [11]  698 	push	bc
   753F CD 82 64      [17]  699 	call	_cpct_drawSpriteMaskedAlignedTable
   7542 DD E1         [14]  700 	pop	ix
   7544 C9            [10]  701 	ret
                            702 ;src/main.c:190: void dibujarExplosion(TEnemy *enemy) {
                            703 ;	---------------------------------
                            704 ; Function dibujarExplosion
                            705 ; ---------------------------------
   7545                     706 _dibujarExplosion::
   7545 DD E5         [15]  707 	push	ix
   7547 DD 21 00 00   [14]  708 	ld	ix,#0
   754B DD 39         [15]  709 	add	ix,sp
                            710 ;src/main.c:191: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   754D DD 4E 04      [19]  711 	ld	c,4 (ix)
   7550 DD 46 05      [19]  712 	ld	b,5 (ix)
   7553 69            [ 4]  713 	ld	l, c
   7554 60            [ 4]  714 	ld	h, b
   7555 23            [ 6]  715 	inc	hl
   7556 56            [ 7]  716 	ld	d,(hl)
   7557 0A            [ 7]  717 	ld	a,(bc)
   7558 47            [ 4]  718 	ld	b,a
   7559 D5            [11]  719 	push	de
   755A 33            [ 6]  720 	inc	sp
   755B C5            [11]  721 	push	bc
   755C 33            [ 6]  722 	inc	sp
   755D 21 00 C0      [10]  723 	ld	hl,#0xC000
   7560 E5            [11]  724 	push	hl
   7561 CD 62 64      [17]  725 	call	_cpct_getScreenPtr
   7564 4D            [ 4]  726 	ld	c,l
   7565 44            [ 4]  727 	ld	b,h
                            728 ;src/main.c:192: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   7566 11 00 0E      [10]  729 	ld	de,#_g_tablatrans+0
   7569 D5            [11]  730 	push	de
   756A 21 04 16      [10]  731 	ld	hl,#0x1604
   756D E5            [11]  732 	push	hl
   756E C5            [11]  733 	push	bc
   756F 21 A8 25      [10]  734 	ld	hl,#_g_explosion
   7572 E5            [11]  735 	push	hl
   7573 CD 82 64      [17]  736 	call	_cpct_drawSpriteMaskedAlignedTable
   7576 DD E1         [14]  737 	pop	ix
   7578 C9            [10]  738 	ret
                            739 ;src/main.c:195: void borrarExplosion() {
                            740 ;	---------------------------------
                            741 ; Function borrarExplosion
                            742 ; ---------------------------------
   7579                     743 _borrarExplosion::
   7579 DD E5         [15]  744 	push	ix
   757B DD 21 00 00   [14]  745 	ld	ix,#0
   757F DD 39         [15]  746 	add	ix,sp
   7581 F5            [11]  747 	push	af
   7582 3B            [ 6]  748 	dec	sp
                            749 ;src/main.c:196: u8 w = 4 + (enemy->px & 1);
   7583 21 C1 64      [10]  750 	ld	hl, #_enemy + 2
   7586 4E            [ 7]  751 	ld	c,(hl)
   7587 79            [ 4]  752 	ld	a,c
   7588 E6 01         [ 7]  753 	and	a, #0x01
   758A 47            [ 4]  754 	ld	b,a
   758B 04            [ 4]  755 	inc	b
   758C 04            [ 4]  756 	inc	b
   758D 04            [ 4]  757 	inc	b
   758E 04            [ 4]  758 	inc	b
                            759 ;src/main.c:199: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   758F 21 C2 64      [10]  760 	ld	hl, #_enemy + 3
   7592 5E            [ 7]  761 	ld	e,(hl)
   7593 CB 4B         [ 8]  762 	bit	1, e
   7595 28 04         [12]  763 	jr	Z,00103$
   7597 3E 01         [ 7]  764 	ld	a,#0x01
   7599 18 02         [12]  765 	jr	00104$
   759B                     766 00103$:
   759B 3E 00         [ 7]  767 	ld	a,#0x00
   759D                     768 00104$:
   759D C6 07         [ 7]  769 	add	a, #0x07
   759F DD 77 FD      [19]  770 	ld	-3 (ix),a
                            771 ;src/main.c:201: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   75A2 FD 2A E2 69   [20]  772 	ld	iy,(_mapa)
   75A6 16 00         [ 7]  773 	ld	d,#0x00
   75A8 7B            [ 4]  774 	ld	a,e
   75A9 C6 E8         [ 7]  775 	add	a,#0xE8
   75AB DD 77 FE      [19]  776 	ld	-2 (ix),a
   75AE 7A            [ 4]  777 	ld	a,d
   75AF CE FF         [ 7]  778 	adc	a,#0xFF
   75B1 DD 77 FF      [19]  779 	ld	-1 (ix),a
   75B4 DD 6E FE      [19]  780 	ld	l,-2 (ix)
   75B7 DD 66 FF      [19]  781 	ld	h,-1 (ix)
   75BA DD CB FF 7E   [20]  782 	bit	7, -1 (ix)
   75BE 28 04         [12]  783 	jr	Z,00105$
   75C0 21 EB FF      [10]  784 	ld	hl,#0xFFEB
   75C3 19            [11]  785 	add	hl,de
   75C4                     786 00105$:
   75C4 CB 2C         [ 8]  787 	sra	h
   75C6 CB 1D         [ 8]  788 	rr	l
   75C8 CB 2C         [ 8]  789 	sra	h
   75CA CB 1D         [ 8]  790 	rr	l
   75CC 55            [ 4]  791 	ld	d,l
   75CD CB 39         [ 8]  792 	srl	c
   75CF FD E5         [15]  793 	push	iy
   75D1 21 F0 C0      [10]  794 	ld	hl,#0xC0F0
   75D4 E5            [11]  795 	push	hl
   75D5 3E 28         [ 7]  796 	ld	a,#0x28
   75D7 F5            [11]  797 	push	af
   75D8 33            [ 6]  798 	inc	sp
   75D9 DD 7E FD      [19]  799 	ld	a,-3 (ix)
   75DC F5            [11]  800 	push	af
   75DD 33            [ 6]  801 	inc	sp
   75DE C5            [11]  802 	push	bc
   75DF 33            [ 6]  803 	inc	sp
   75E0 D5            [11]  804 	push	de
   75E1 33            [ 6]  805 	inc	sp
   75E2 79            [ 4]  806 	ld	a,c
   75E3 F5            [11]  807 	push	af
   75E4 33            [ 6]  808 	inc	sp
   75E5 CD 5B 59      [17]  809 	call	_cpct_etm_drawTileBox2x4
   75E8 DD F9         [10]  810 	ld	sp, ix
   75EA DD E1         [14]  811 	pop	ix
   75EC C9            [10]  812 	ret
                            813 ;src/main.c:205: void borrarEnemigo(TEnemy *enemy) {
                            814 ;	---------------------------------
                            815 ; Function borrarEnemigo
                            816 ; ---------------------------------
   75ED                     817 _borrarEnemigo::
   75ED DD E5         [15]  818 	push	ix
   75EF DD 21 00 00   [14]  819 	ld	ix,#0
   75F3 DD 39         [15]  820 	add	ix,sp
   75F5 21 FA FF      [10]  821 	ld	hl,#-6
   75F8 39            [11]  822 	add	hl,sp
   75F9 F9            [ 6]  823 	ld	sp,hl
                            824 ;src/main.c:207: u8 w = 4 + (enemy->px & 1);
   75FA DD 4E 04      [19]  825 	ld	c,4 (ix)
   75FD DD 46 05      [19]  826 	ld	b,5 (ix)
   7600 69            [ 4]  827 	ld	l, c
   7601 60            [ 4]  828 	ld	h, b
   7602 23            [ 6]  829 	inc	hl
   7603 23            [ 6]  830 	inc	hl
   7604 5E            [ 7]  831 	ld	e,(hl)
   7605 7B            [ 4]  832 	ld	a,e
   7606 E6 01         [ 7]  833 	and	a, #0x01
   7608 C6 04         [ 7]  834 	add	a, #0x04
   760A DD 77 FA      [19]  835 	ld	-6 (ix),a
                            836 ;src/main.c:210: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   760D 69            [ 4]  837 	ld	l, c
   760E 60            [ 4]  838 	ld	h, b
   760F 23            [ 6]  839 	inc	hl
   7610 23            [ 6]  840 	inc	hl
   7611 23            [ 6]  841 	inc	hl
   7612 56            [ 7]  842 	ld	d,(hl)
   7613 CB 4A         [ 8]  843 	bit	1, d
   7615 28 04         [12]  844 	jr	Z,00103$
   7617 3E 01         [ 7]  845 	ld	a,#0x01
   7619 18 02         [12]  846 	jr	00104$
   761B                     847 00103$:
   761B 3E 00         [ 7]  848 	ld	a,#0x00
   761D                     849 00104$:
   761D C6 07         [ 7]  850 	add	a, #0x07
   761F DD 77 FB      [19]  851 	ld	-5 (ix),a
                            852 ;src/main.c:212: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   7622 FD 2A E2 69   [20]  853 	ld	iy,(_mapa)
   7626 DD 72 FE      [19]  854 	ld	-2 (ix),d
   7629 DD 36 FF 00   [19]  855 	ld	-1 (ix),#0x00
   762D DD 7E FE      [19]  856 	ld	a,-2 (ix)
   7630 C6 E8         [ 7]  857 	add	a,#0xE8
   7632 DD 77 FC      [19]  858 	ld	-4 (ix),a
   7635 DD 7E FF      [19]  859 	ld	a,-1 (ix)
   7638 CE FF         [ 7]  860 	adc	a,#0xFF
   763A DD 77 FD      [19]  861 	ld	-3 (ix),a
   763D DD 56 FC      [19]  862 	ld	d,-4 (ix)
   7640 DD 6E FD      [19]  863 	ld	l,-3 (ix)
   7643 DD CB FD 7E   [20]  864 	bit	7, -3 (ix)
   7647 28 0C         [12]  865 	jr	Z,00105$
   7649 DD 7E FE      [19]  866 	ld	a,-2 (ix)
   764C C6 EB         [ 7]  867 	add	a, #0xEB
   764E 57            [ 4]  868 	ld	d,a
   764F DD 7E FF      [19]  869 	ld	a,-1 (ix)
   7652 CE FF         [ 7]  870 	adc	a, #0xFF
   7654 6F            [ 4]  871 	ld	l,a
   7655                     872 00105$:
   7655 CB 2D         [ 8]  873 	sra	l
   7657 CB 1A         [ 8]  874 	rr	d
   7659 CB 2D         [ 8]  875 	sra	l
   765B CB 1A         [ 8]  876 	rr	d
   765D CB 3B         [ 8]  877 	srl	e
   765F C5            [11]  878 	push	bc
   7660 FD E5         [15]  879 	push	iy
   7662 21 F0 C0      [10]  880 	ld	hl,#0xC0F0
   7665 E5            [11]  881 	push	hl
   7666 3E 28         [ 7]  882 	ld	a,#0x28
   7668 F5            [11]  883 	push	af
   7669 33            [ 6]  884 	inc	sp
   766A DD 66 FB      [19]  885 	ld	h,-5 (ix)
   766D DD 6E FA      [19]  886 	ld	l,-6 (ix)
   7670 E5            [11]  887 	push	hl
   7671 D5            [11]  888 	push	de
   7672 CD 5B 59      [17]  889 	call	_cpct_etm_drawTileBox2x4
   7675 C1            [10]  890 	pop	bc
                            891 ;src/main.c:214: enemy->mover = NO;
   7676 21 06 00      [10]  892 	ld	hl,#0x0006
   7679 09            [11]  893 	add	hl,bc
   767A 36 00         [10]  894 	ld	(hl),#0x00
   767C DD F9         [10]  895 	ld	sp, ix
   767E DD E1         [14]  896 	pop	ix
   7680 C9            [10]  897 	ret
                            898 ;src/main.c:217: void redibujarEnemigo(TEnemy *enemy) {
                            899 ;	---------------------------------
                            900 ; Function redibujarEnemigo
                            901 ; ---------------------------------
   7681                     902 _redibujarEnemigo::
   7681 DD E5         [15]  903 	push	ix
   7683 DD 21 00 00   [14]  904 	ld	ix,#0
   7687 DD 39         [15]  905 	add	ix,sp
                            906 ;src/main.c:218: borrarEnemigo(enemy);
   7689 DD 6E 04      [19]  907 	ld	l,4 (ix)
   768C DD 66 05      [19]  908 	ld	h,5 (ix)
   768F E5            [11]  909 	push	hl
   7690 CD ED 75      [17]  910 	call	_borrarEnemigo
   7693 F1            [10]  911 	pop	af
                            912 ;src/main.c:219: enemy->px = enemy->x;
   7694 DD 4E 04      [19]  913 	ld	c,4 (ix)
   7697 DD 46 05      [19]  914 	ld	b,5 (ix)
   769A 59            [ 4]  915 	ld	e, c
   769B 50            [ 4]  916 	ld	d, b
   769C 13            [ 6]  917 	inc	de
   769D 13            [ 6]  918 	inc	de
   769E 0A            [ 7]  919 	ld	a,(bc)
   769F 12            [ 7]  920 	ld	(de),a
                            921 ;src/main.c:220: enemy->py = enemy->y;
   76A0 59            [ 4]  922 	ld	e, c
   76A1 50            [ 4]  923 	ld	d, b
   76A2 13            [ 6]  924 	inc	de
   76A3 13            [ 6]  925 	inc	de
   76A4 13            [ 6]  926 	inc	de
   76A5 69            [ 4]  927 	ld	l, c
   76A6 60            [ 4]  928 	ld	h, b
   76A7 23            [ 6]  929 	inc	hl
   76A8 7E            [ 7]  930 	ld	a,(hl)
   76A9 12            [ 7]  931 	ld	(de),a
                            932 ;src/main.c:221: dibujarEnemigo(enemy);
   76AA C5            [11]  933 	push	bc
   76AB CD 0D 75      [17]  934 	call	_dibujarEnemigo
   76AE F1            [10]  935 	pop	af
   76AF DD E1         [14]  936 	pop	ix
   76B1 C9            [10]  937 	ret
                            938 ;src/main.c:224: u8 checkEnemyCollision(int direction, TEnemy *enemy){
                            939 ;	---------------------------------
                            940 ; Function checkEnemyCollision
                            941 ; ---------------------------------
   76B2                     942 _checkEnemyCollision::
   76B2 DD E5         [15]  943 	push	ix
   76B4 DD 21 00 00   [14]  944 	ld	ix,#0
   76B8 DD 39         [15]  945 	add	ix,sp
   76BA 21 F7 FF      [10]  946 	ld	hl,#-9
   76BD 39            [11]  947 	add	hl,sp
   76BE F9            [ 6]  948 	ld	sp,hl
                            949 ;src/main.c:226: u8 colisiona = 1;
   76BF DD 36 F7 01   [19]  950 	ld	-9 (ix),#0x01
                            951 ;src/main.c:228: switch (direction) {
   76C3 DD CB 05 7E   [20]  952 	bit	7, 5 (ix)
   76C7 C2 7A 7A      [10]  953 	jp	NZ,00165$
   76CA 3E 03         [ 7]  954 	ld	a,#0x03
   76CC DD BE 04      [19]  955 	cp	a, 4 (ix)
   76CF 3E 00         [ 7]  956 	ld	a,#0x00
   76D1 DD 9E 05      [19]  957 	sbc	a, 5 (ix)
   76D4 E2 D9 76      [10]  958 	jp	PO, 00272$
   76D7 EE 80         [ 7]  959 	xor	a, #0x80
   76D9                     960 00272$:
   76D9 FA 7A 7A      [10]  961 	jp	M,00165$
                            962 ;src/main.c:230: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   76DC DD 4E 06      [19]  963 	ld	c,6 (ix)
   76DF DD 46 07      [19]  964 	ld	b,7 (ix)
   76E2 0A            [ 7]  965 	ld	a,(bc)
   76E3 5F            [ 4]  966 	ld	e,a
   76E4 21 01 00      [10]  967 	ld	hl,#0x0001
   76E7 09            [11]  968 	add	hl,bc
   76E8 DD 75 F8      [19]  969 	ld	-8 (ix),l
   76EB DD 74 F9      [19]  970 	ld	-7 (ix),h
   76EE DD 6E F8      [19]  971 	ld	l,-8 (ix)
   76F1 DD 66 F9      [19]  972 	ld	h,-7 (ix)
   76F4 56            [ 7]  973 	ld	d,(hl)
                            974 ;src/main.c:243: enemy->muerto = SI;
   76F5 21 08 00      [10]  975 	ld	hl,#0x0008
   76F8 09            [11]  976 	add	hl,bc
   76F9 DD 75 FA      [19]  977 	ld	-6 (ix),l
   76FC DD 74 FB      [19]  978 	ld	-5 (ix),h
                            979 ;src/main.c:250: enemy->mira = M_izquierda;
   76FF 21 07 00      [10]  980 	ld	hl,#0x0007
   7702 09            [11]  981 	add	hl,bc
   7703 DD 75 FC      [19]  982 	ld	-4 (ix),l
   7706 DD 74 FD      [19]  983 	ld	-3 (ix),h
                            984 ;src/main.c:228: switch (direction) {
   7709 D5            [11]  985 	push	de
   770A DD 5E 04      [19]  986 	ld	e,4 (ix)
   770D 16 00         [ 7]  987 	ld	d,#0x00
   770F 21 17 77      [10]  988 	ld	hl,#00273$
   7712 19            [11]  989 	add	hl,de
   7713 19            [11]  990 	add	hl,de
   7714 19            [11]  991 	add	hl,de
   7715 D1            [10]  992 	pop	de
   7716 E9            [ 4]  993 	jp	(hl)
   7717                     994 00273$:
   7717 C3 23 77      [10]  995 	jp	00101$
   771A C3 FC 77      [10]  996 	jp	00117$
   771D C3 D1 78      [10]  997 	jp	00133$
   7720 C3 A0 79      [10]  998 	jp	00149$
                            999 ;src/main.c:229: case 0:
   7723                    1000 00101$:
                           1001 ;src/main.c:230: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   7723 7B            [ 4] 1002 	ld	a,e
   7724 C6 05         [ 7] 1003 	add	a, #0x05
   7726 C5            [11] 1004 	push	bc
   7727 D5            [11] 1005 	push	de
   7728 33            [ 6] 1006 	inc	sp
   7729 F5            [11] 1007 	push	af
   772A 33            [ 6] 1008 	inc	sp
   772B CD 77 73      [17] 1009 	call	_getTilePtr
   772E F1            [10] 1010 	pop	af
   772F C1            [10] 1011 	pop	bc
   7730 5E            [ 7] 1012 	ld	e,(hl)
   7731 3E 02         [ 7] 1013 	ld	a,#0x02
   7733 93            [ 4] 1014 	sub	a, e
   7734 DA F1 77      [10] 1015 	jp	C,00113$
                           1016 ;src/main.c:231: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   7737 DD 6E F8      [19] 1017 	ld	l,-8 (ix)
   773A DD 66 F9      [19] 1018 	ld	h,-7 (ix)
   773D 7E            [ 7] 1019 	ld	a,(hl)
   773E C6 0B         [ 7] 1020 	add	a, #0x0B
   7740 57            [ 4] 1021 	ld	d,a
   7741 0A            [ 7] 1022 	ld	a,(bc)
   7742 C6 05         [ 7] 1023 	add	a, #0x05
   7744 C5            [11] 1024 	push	bc
   7745 D5            [11] 1025 	push	de
   7746 33            [ 6] 1026 	inc	sp
   7747 F5            [11] 1027 	push	af
   7748 33            [ 6] 1028 	inc	sp
   7749 CD 77 73      [17] 1029 	call	_getTilePtr
   774C F1            [10] 1030 	pop	af
   774D C1            [10] 1031 	pop	bc
   774E 5E            [ 7] 1032 	ld	e,(hl)
   774F 3E 02         [ 7] 1033 	ld	a,#0x02
   7751 93            [ 4] 1034 	sub	a, e
   7752 DA F1 77      [10] 1035 	jp	C,00113$
                           1036 ;src/main.c:232: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   7755 DD 6E F8      [19] 1037 	ld	l,-8 (ix)
   7758 DD 66 F9      [19] 1038 	ld	h,-7 (ix)
   775B 7E            [ 7] 1039 	ld	a,(hl)
   775C C6 16         [ 7] 1040 	add	a, #0x16
   775E 57            [ 4] 1041 	ld	d,a
   775F 0A            [ 7] 1042 	ld	a,(bc)
   7760 C6 05         [ 7] 1043 	add	a, #0x05
   7762 C5            [11] 1044 	push	bc
   7763 D5            [11] 1045 	push	de
   7764 33            [ 6] 1046 	inc	sp
   7765 F5            [11] 1047 	push	af
   7766 33            [ 6] 1048 	inc	sp
   7767 CD 77 73      [17] 1049 	call	_getTilePtr
   776A F1            [10] 1050 	pop	af
   776B C1            [10] 1051 	pop	bc
   776C 5E            [ 7] 1052 	ld	e,(hl)
   776D 3E 02         [ 7] 1053 	ld	a,#0x02
   776F 93            [ 4] 1054 	sub	a, e
   7770 DA F1 77      [10] 1055 	jp	C,00113$
                           1056 ;src/main.c:234: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   7773 21 D8 69      [10] 1057 	ld	hl, #_cu + 1
   7776 5E            [ 7] 1058 	ld	e,(hl)
   7777 16 00         [ 7] 1059 	ld	d,#0x00
   7779 21 04 00      [10] 1060 	ld	hl,#0x0004
   777C 19            [11] 1061 	add	hl,de
   777D DD 75 FE      [19] 1062 	ld	-2 (ix),l
   7780 DD 74 FF      [19] 1063 	ld	-1 (ix),h
   7783 DD 6E F8      [19] 1064 	ld	l,-8 (ix)
   7786 DD 66 F9      [19] 1065 	ld	h,-7 (ix)
   7789 6E            [ 7] 1066 	ld	l,(hl)
   778A 26 00         [ 7] 1067 	ld	h,#0x00
   778C DD 7E FE      [19] 1068 	ld	a,-2 (ix)
   778F 95            [ 4] 1069 	sub	a, l
   7790 DD 7E FF      [19] 1070 	ld	a,-1 (ix)
   7793 9C            [ 4] 1071 	sbc	a, h
   7794 E2 99 77      [10] 1072 	jp	PO, 00274$
   7797 EE 80         [ 7] 1073 	xor	a, #0x80
   7799                    1074 00274$:
   7799 FA AE 77      [10] 1075 	jp	M,00108$
   779C D5            [11] 1076 	push	de
   779D 11 16 00      [10] 1077 	ld	de,#0x0016
   77A0 19            [11] 1078 	add	hl, de
   77A1 D1            [10] 1079 	pop	de
   77A2 7D            [ 4] 1080 	ld	a,l
   77A3 93            [ 4] 1081 	sub	a, e
   77A4 7C            [ 4] 1082 	ld	a,h
   77A5 9A            [ 4] 1083 	sbc	a, d
   77A6 E2 AB 77      [10] 1084 	jp	PO, 00275$
   77A9 EE 80         [ 7] 1085 	xor	a, #0x80
   77AB                    1086 00275$:
   77AB F2 B5 77      [10] 1087 	jp	P,00109$
   77AE                    1088 00108$:
                           1089 ;src/main.c:235: colisiona = 0;
   77AE DD 36 F7 00   [19] 1090 	ld	-9 (ix),#0x00
   77B2 C3 7A 7A      [10] 1091 	jp	00165$
   77B5                    1092 00109$:
                           1093 ;src/main.c:238: if(cu.x > enemy->x){ //si el cu esta abajo
   77B5 21 D7 69      [10] 1094 	ld	hl, #_cu + 0
   77B8 5E            [ 7] 1095 	ld	e,(hl)
   77B9 0A            [ 7] 1096 	ld	a,(bc)
   77BA 4F            [ 4] 1097 	ld	c,a
   77BB 93            [ 4] 1098 	sub	a, e
   77BC 30 2C         [12] 1099 	jr	NC,00106$
                           1100 ;src/main.c:239: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
   77BE 6B            [ 4] 1101 	ld	l,e
   77BF 26 00         [ 7] 1102 	ld	h,#0x00
   77C1 06 00         [ 7] 1103 	ld	b,#0x00
   77C3 03            [ 6] 1104 	inc	bc
   77C4 03            [ 6] 1105 	inc	bc
   77C5 03            [ 6] 1106 	inc	bc
   77C6 03            [ 6] 1107 	inc	bc
   77C7 BF            [ 4] 1108 	cp	a, a
   77C8 ED 42         [15] 1109 	sbc	hl, bc
   77CA 3E 01         [ 7] 1110 	ld	a,#0x01
   77CC BD            [ 4] 1111 	cp	a, l
   77CD 3E 00         [ 7] 1112 	ld	a,#0x00
   77CF 9C            [ 4] 1113 	sbc	a, h
   77D0 E2 D5 77      [10] 1114 	jp	PO, 00276$
   77D3 EE 80         [ 7] 1115 	xor	a, #0x80
   77D5                    1116 00276$:
   77D5 F2 DF 77      [10] 1117 	jp	P,00103$
                           1118 ;src/main.c:240: colisiona = 0;
   77D8 DD 36 F7 00   [19] 1119 	ld	-9 (ix),#0x00
   77DC C3 7A 7A      [10] 1120 	jp	00165$
   77DF                    1121 00103$:
                           1122 ;src/main.c:243: enemy->muerto = SI;
   77DF DD 6E FA      [19] 1123 	ld	l,-6 (ix)
   77E2 DD 66 FB      [19] 1124 	ld	h,-5 (ix)
   77E5 36 01         [10] 1125 	ld	(hl),#0x01
   77E7 C3 7A 7A      [10] 1126 	jp	00165$
   77EA                    1127 00106$:
                           1128 ;src/main.c:246: colisiona = 0;
   77EA DD 36 F7 00   [19] 1129 	ld	-9 (ix),#0x00
   77EE C3 7A 7A      [10] 1130 	jp	00165$
   77F1                    1131 00113$:
                           1132 ;src/main.c:250: enemy->mira = M_izquierda;
   77F1 DD 6E FC      [19] 1133 	ld	l,-4 (ix)
   77F4 DD 66 FD      [19] 1134 	ld	h,-3 (ix)
   77F7 36 01         [10] 1135 	ld	(hl),#0x01
                           1136 ;src/main.c:252: break;
   77F9 C3 7A 7A      [10] 1137 	jp	00165$
                           1138 ;src/main.c:253: case 1:
   77FC                    1139 00117$:
                           1140 ;src/main.c:254: if( *getTilePtr(enemy->x - 1, enemy->y) <= 2
   77FC 1D            [ 4] 1141 	dec	e
   77FD C5            [11] 1142 	push	bc
   77FE D5            [11] 1143 	push	de
   77FF CD 77 73      [17] 1144 	call	_getTilePtr
   7802 F1            [10] 1145 	pop	af
   7803 C1            [10] 1146 	pop	bc
   7804 5E            [ 7] 1147 	ld	e,(hl)
   7805 3E 02         [ 7] 1148 	ld	a,#0x02
   7807 93            [ 4] 1149 	sub	a, e
   7808 DA C6 78      [10] 1150 	jp	C,00129$
                           1151 ;src/main.c:255: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   780B DD 6E F8      [19] 1152 	ld	l,-8 (ix)
   780E DD 66 F9      [19] 1153 	ld	h,-7 (ix)
   7811 7E            [ 7] 1154 	ld	a,(hl)
   7812 C6 0B         [ 7] 1155 	add	a, #0x0B
   7814 57            [ 4] 1156 	ld	d,a
   7815 0A            [ 7] 1157 	ld	a,(bc)
   7816 C6 FF         [ 7] 1158 	add	a,#0xFF
   7818 C5            [11] 1159 	push	bc
   7819 D5            [11] 1160 	push	de
   781A 33            [ 6] 1161 	inc	sp
   781B F5            [11] 1162 	push	af
   781C 33            [ 6] 1163 	inc	sp
   781D CD 77 73      [17] 1164 	call	_getTilePtr
   7820 F1            [10] 1165 	pop	af
   7821 C1            [10] 1166 	pop	bc
   7822 5E            [ 7] 1167 	ld	e,(hl)
   7823 3E 02         [ 7] 1168 	ld	a,#0x02
   7825 93            [ 4] 1169 	sub	a, e
   7826 DA C6 78      [10] 1170 	jp	C,00129$
                           1171 ;src/main.c:256: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   7829 DD 6E F8      [19] 1172 	ld	l,-8 (ix)
   782C DD 66 F9      [19] 1173 	ld	h,-7 (ix)
   782F 7E            [ 7] 1174 	ld	a,(hl)
   7830 C6 16         [ 7] 1175 	add	a, #0x16
   7832 57            [ 4] 1176 	ld	d,a
   7833 0A            [ 7] 1177 	ld	a,(bc)
   7834 C6 FF         [ 7] 1178 	add	a,#0xFF
   7836 C5            [11] 1179 	push	bc
   7837 D5            [11] 1180 	push	de
   7838 33            [ 6] 1181 	inc	sp
   7839 F5            [11] 1182 	push	af
   783A 33            [ 6] 1183 	inc	sp
   783B CD 77 73      [17] 1184 	call	_getTilePtr
   783E F1            [10] 1185 	pop	af
   783F C1            [10] 1186 	pop	bc
   7840 5E            [ 7] 1187 	ld	e,(hl)
   7841 3E 02         [ 7] 1188 	ld	a,#0x02
   7843 93            [ 4] 1189 	sub	a, e
   7844 DA C6 78      [10] 1190 	jp	C,00129$
                           1191 ;src/main.c:258: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   7847 21 D8 69      [10] 1192 	ld	hl, #_cu + 1
   784A 5E            [ 7] 1193 	ld	e,(hl)
   784B 16 00         [ 7] 1194 	ld	d,#0x00
   784D 21 04 00      [10] 1195 	ld	hl,#0x0004
   7850 19            [11] 1196 	add	hl,de
   7851 DD 75 FE      [19] 1197 	ld	-2 (ix),l
   7854 DD 74 FF      [19] 1198 	ld	-1 (ix),h
   7857 DD 6E F8      [19] 1199 	ld	l,-8 (ix)
   785A DD 66 F9      [19] 1200 	ld	h,-7 (ix)
   785D 6E            [ 7] 1201 	ld	l,(hl)
   785E 26 00         [ 7] 1202 	ld	h,#0x00
   7860 DD 7E FE      [19] 1203 	ld	a,-2 (ix)
   7863 95            [ 4] 1204 	sub	a, l
   7864 DD 7E FF      [19] 1205 	ld	a,-1 (ix)
   7867 9C            [ 4] 1206 	sbc	a, h
   7868 E2 6D 78      [10] 1207 	jp	PO, 00277$
   786B EE 80         [ 7] 1208 	xor	a, #0x80
   786D                    1209 00277$:
   786D FA 82 78      [10] 1210 	jp	M,00124$
   7870 D5            [11] 1211 	push	de
   7871 11 16 00      [10] 1212 	ld	de,#0x0016
   7874 19            [11] 1213 	add	hl, de
   7875 D1            [10] 1214 	pop	de
   7876 7D            [ 4] 1215 	ld	a,l
   7877 93            [ 4] 1216 	sub	a, e
   7878 7C            [ 4] 1217 	ld	a,h
   7879 9A            [ 4] 1218 	sbc	a, d
   787A E2 7F 78      [10] 1219 	jp	PO, 00278$
   787D EE 80         [ 7] 1220 	xor	a, #0x80
   787F                    1221 00278$:
   787F F2 89 78      [10] 1222 	jp	P,00125$
   7882                    1223 00124$:
                           1224 ;src/main.c:259: colisiona = 0;
   7882 DD 36 F7 00   [19] 1225 	ld	-9 (ix),#0x00
   7886 C3 7A 7A      [10] 1226 	jp	00165$
   7889                    1227 00125$:
                           1228 ;src/main.c:262: if(enemy->x > cu.x){ //si el cu esta abajo
   7889 0A            [ 7] 1229 	ld	a,(bc)
   788A 5F            [ 4] 1230 	ld	e,a
   788B 21 D7 69      [10] 1231 	ld	hl, #_cu + 0
   788E 4E            [ 7] 1232 	ld	c,(hl)
   788F 79            [ 4] 1233 	ld	a,c
   7890 93            [ 4] 1234 	sub	a, e
   7891 30 2C         [12] 1235 	jr	NC,00122$
                           1236 ;src/main.c:263: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
   7893 6B            [ 4] 1237 	ld	l,e
   7894 26 00         [ 7] 1238 	ld	h,#0x00
   7896 06 00         [ 7] 1239 	ld	b,#0x00
   7898 03            [ 6] 1240 	inc	bc
   7899 03            [ 6] 1241 	inc	bc
   789A 03            [ 6] 1242 	inc	bc
   789B 03            [ 6] 1243 	inc	bc
   789C BF            [ 4] 1244 	cp	a, a
   789D ED 42         [15] 1245 	sbc	hl, bc
   789F 3E 01         [ 7] 1246 	ld	a,#0x01
   78A1 BD            [ 4] 1247 	cp	a, l
   78A2 3E 00         [ 7] 1248 	ld	a,#0x00
   78A4 9C            [ 4] 1249 	sbc	a, h
   78A5 E2 AA 78      [10] 1250 	jp	PO, 00279$
   78A8 EE 80         [ 7] 1251 	xor	a, #0x80
   78AA                    1252 00279$:
   78AA F2 B4 78      [10] 1253 	jp	P,00119$
                           1254 ;src/main.c:264: colisiona = 0;
   78AD DD 36 F7 00   [19] 1255 	ld	-9 (ix),#0x00
   78B1 C3 7A 7A      [10] 1256 	jp	00165$
   78B4                    1257 00119$:
                           1258 ;src/main.c:267: enemy->muerto = SI;
   78B4 DD 6E FA      [19] 1259 	ld	l,-6 (ix)
   78B7 DD 66 FB      [19] 1260 	ld	h,-5 (ix)
   78BA 36 01         [10] 1261 	ld	(hl),#0x01
   78BC C3 7A 7A      [10] 1262 	jp	00165$
   78BF                    1263 00122$:
                           1264 ;src/main.c:270: colisiona = 0;
   78BF DD 36 F7 00   [19] 1265 	ld	-9 (ix),#0x00
   78C3 C3 7A 7A      [10] 1266 	jp	00165$
   78C6                    1267 00129$:
                           1268 ;src/main.c:274: enemy->mira = M_derecha;
   78C6 DD 6E FC      [19] 1269 	ld	l,-4 (ix)
   78C9 DD 66 FD      [19] 1270 	ld	h,-3 (ix)
   78CC 36 00         [10] 1271 	ld	(hl),#0x00
                           1272 ;src/main.c:276: break;
   78CE C3 7A 7A      [10] 1273 	jp	00165$
                           1274 ;src/main.c:277: case 2:
   78D1                    1275 00133$:
                           1276 ;src/main.c:278: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   78D1 15            [ 4] 1277 	dec	d
   78D2 15            [ 4] 1278 	dec	d
   78D3 C5            [11] 1279 	push	bc
   78D4 D5            [11] 1280 	push	de
   78D5 CD 77 73      [17] 1281 	call	_getTilePtr
   78D8 F1            [10] 1282 	pop	af
   78D9 C1            [10] 1283 	pop	bc
   78DA 5E            [ 7] 1284 	ld	e,(hl)
   78DB 3E 02         [ 7] 1285 	ld	a,#0x02
   78DD 93            [ 4] 1286 	sub	a, e
   78DE DA 98 79      [10] 1287 	jp	C,00145$
                           1288 ;src/main.c:279: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   78E1 DD 6E F8      [19] 1289 	ld	l,-8 (ix)
   78E4 DD 66 F9      [19] 1290 	ld	h,-7 (ix)
   78E7 56            [ 7] 1291 	ld	d,(hl)
   78E8 15            [ 4] 1292 	dec	d
   78E9 15            [ 4] 1293 	dec	d
   78EA 0A            [ 7] 1294 	ld	a,(bc)
   78EB C6 02         [ 7] 1295 	add	a, #0x02
   78ED C5            [11] 1296 	push	bc
   78EE D5            [11] 1297 	push	de
   78EF 33            [ 6] 1298 	inc	sp
   78F0 F5            [11] 1299 	push	af
   78F1 33            [ 6] 1300 	inc	sp
   78F2 CD 77 73      [17] 1301 	call	_getTilePtr
   78F5 F1            [10] 1302 	pop	af
   78F6 C1            [10] 1303 	pop	bc
   78F7 5E            [ 7] 1304 	ld	e,(hl)
   78F8 3E 02         [ 7] 1305 	ld	a,#0x02
   78FA 93            [ 4] 1306 	sub	a, e
   78FB DA 98 79      [10] 1307 	jp	C,00145$
                           1308 ;src/main.c:280: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   78FE DD 6E F8      [19] 1309 	ld	l,-8 (ix)
   7901 DD 66 F9      [19] 1310 	ld	h,-7 (ix)
   7904 56            [ 7] 1311 	ld	d,(hl)
   7905 15            [ 4] 1312 	dec	d
   7906 15            [ 4] 1313 	dec	d
   7907 0A            [ 7] 1314 	ld	a,(bc)
   7908 C6 04         [ 7] 1315 	add	a, #0x04
   790A C5            [11] 1316 	push	bc
   790B D5            [11] 1317 	push	de
   790C 33            [ 6] 1318 	inc	sp
   790D F5            [11] 1319 	push	af
   790E 33            [ 6] 1320 	inc	sp
   790F CD 77 73      [17] 1321 	call	_getTilePtr
   7912 F1            [10] 1322 	pop	af
   7913 C1            [10] 1323 	pop	bc
   7914 5E            [ 7] 1324 	ld	e,(hl)
   7915 3E 02         [ 7] 1325 	ld	a,#0x02
   7917 93            [ 4] 1326 	sub	a, e
   7918 DA 98 79      [10] 1327 	jp	C,00145$
                           1328 ;src/main.c:282: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   791B 21 D7 69      [10] 1329 	ld	hl, #_cu + 0
   791E 5E            [ 7] 1330 	ld	e,(hl)
   791F 16 00         [ 7] 1331 	ld	d,#0x00
   7921 21 02 00      [10] 1332 	ld	hl,#0x0002
   7924 19            [11] 1333 	add	hl,de
   7925 DD 75 FE      [19] 1334 	ld	-2 (ix),l
   7928 DD 74 FF      [19] 1335 	ld	-1 (ix),h
   792B 0A            [ 7] 1336 	ld	a,(bc)
   792C 6F            [ 4] 1337 	ld	l,a
   792D 26 00         [ 7] 1338 	ld	h,#0x00
   792F DD 7E FE      [19] 1339 	ld	a,-2 (ix)
   7932 95            [ 4] 1340 	sub	a, l
   7933 DD 7E FF      [19] 1341 	ld	a,-1 (ix)
   7936 9C            [ 4] 1342 	sbc	a, h
   7937 E2 3C 79      [10] 1343 	jp	PO, 00280$
   793A EE 80         [ 7] 1344 	xor	a, #0x80
   793C                    1345 00280$:
   793C FA 4F 79      [10] 1346 	jp	M,00140$
   793F 23            [ 6] 1347 	inc	hl
   7940 23            [ 6] 1348 	inc	hl
   7941 23            [ 6] 1349 	inc	hl
   7942 23            [ 6] 1350 	inc	hl
   7943 7D            [ 4] 1351 	ld	a,l
   7944 93            [ 4] 1352 	sub	a, e
   7945 7C            [ 4] 1353 	ld	a,h
   7946 9A            [ 4] 1354 	sbc	a, d
   7947 E2 4C 79      [10] 1355 	jp	PO, 00281$
   794A EE 80         [ 7] 1356 	xor	a, #0x80
   794C                    1357 00281$:
   794C F2 55 79      [10] 1358 	jp	P,00141$
   794F                    1359 00140$:
                           1360 ;src/main.c:284: colisiona = 0;
   794F DD 36 F7 00   [19] 1361 	ld	-9 (ix),#0x00
   7953 18 4B         [12] 1362 	jr	00149$
   7955                    1363 00141$:
                           1364 ;src/main.c:287: if(enemy->y>cu.y){
   7955 DD 6E F8      [19] 1365 	ld	l,-8 (ix)
   7958 DD 66 F9      [19] 1366 	ld	h,-7 (ix)
   795B 5E            [ 7] 1367 	ld	e,(hl)
   795C 21 D8 69      [10] 1368 	ld	hl, #(_cu + 0x0001) + 0
   795F 6E            [ 7] 1369 	ld	l,(hl)
   7960 7D            [ 4] 1370 	ld	a,l
   7961 93            [ 4] 1371 	sub	a, e
   7962 30 2E         [12] 1372 	jr	NC,00138$
                           1373 ;src/main.c:288: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   7964 16 00         [ 7] 1374 	ld	d,#0x00
   7966 26 00         [ 7] 1375 	ld	h,#0x00
   7968 D5            [11] 1376 	push	de
   7969 11 08 00      [10] 1377 	ld	de,#0x0008
   796C 19            [11] 1378 	add	hl, de
   796D D1            [10] 1379 	pop	de
   796E 7B            [ 4] 1380 	ld	a,e
   796F 95            [ 4] 1381 	sub	a, l
   7970 5F            [ 4] 1382 	ld	e,a
   7971 7A            [ 4] 1383 	ld	a,d
   7972 9C            [ 4] 1384 	sbc	a, h
   7973 57            [ 4] 1385 	ld	d,a
   7974 3E 02         [ 7] 1386 	ld	a,#0x02
   7976 BB            [ 4] 1387 	cp	a, e
   7977 3E 00         [ 7] 1388 	ld	a,#0x00
   7979 9A            [ 4] 1389 	sbc	a, d
   797A E2 7F 79      [10] 1390 	jp	PO, 00282$
   797D EE 80         [ 7] 1391 	xor	a, #0x80
   797F                    1392 00282$:
   797F F2 88 79      [10] 1393 	jp	P,00135$
                           1394 ;src/main.c:289: colisiona = 0;
   7982 DD 36 F7 00   [19] 1395 	ld	-9 (ix),#0x00
   7986 18 18         [12] 1396 	jr	00149$
   7988                    1397 00135$:
                           1398 ;src/main.c:292: enemy->muerto = SI;
   7988 DD 6E FA      [19] 1399 	ld	l,-6 (ix)
   798B DD 66 FB      [19] 1400 	ld	h,-5 (ix)
   798E 36 01         [10] 1401 	ld	(hl),#0x01
   7990 18 0E         [12] 1402 	jr	00149$
   7992                    1403 00138$:
                           1404 ;src/main.c:296: colisiona = 0;
   7992 DD 36 F7 00   [19] 1405 	ld	-9 (ix),#0x00
   7996 18 08         [12] 1406 	jr	00149$
   7998                    1407 00145$:
                           1408 ;src/main.c:302: enemy->mira = M_abajo;
   7998 DD 6E FC      [19] 1409 	ld	l,-4 (ix)
   799B DD 66 FD      [19] 1410 	ld	h,-3 (ix)
   799E 36 03         [10] 1411 	ld	(hl),#0x03
                           1412 ;src/main.c:305: case 3:
   79A0                    1413 00149$:
                           1414 ;src/main.c:308: if( *getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   79A0 DD 6E F8      [19] 1415 	ld	l,-8 (ix)
   79A3 DD 66 F9      [19] 1416 	ld	h,-7 (ix)
   79A6 7E            [ 7] 1417 	ld	a,(hl)
   79A7 C6 18         [ 7] 1418 	add	a, #0x18
   79A9 57            [ 4] 1419 	ld	d,a
   79AA 0A            [ 7] 1420 	ld	a,(bc)
   79AB C5            [11] 1421 	push	bc
   79AC D5            [11] 1422 	push	de
   79AD 33            [ 6] 1423 	inc	sp
   79AE F5            [11] 1424 	push	af
   79AF 33            [ 6] 1425 	inc	sp
   79B0 CD 77 73      [17] 1426 	call	_getTilePtr
   79B3 F1            [10] 1427 	pop	af
   79B4 C1            [10] 1428 	pop	bc
   79B5 5E            [ 7] 1429 	ld	e,(hl)
   79B6 3E 02         [ 7] 1430 	ld	a,#0x02
   79B8 93            [ 4] 1431 	sub	a, e
   79B9 DA 72 7A      [10] 1432 	jp	C,00161$
                           1433 ;src/main.c:309: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   79BC DD 6E F8      [19] 1434 	ld	l,-8 (ix)
   79BF DD 66 F9      [19] 1435 	ld	h,-7 (ix)
   79C2 7E            [ 7] 1436 	ld	a,(hl)
   79C3 C6 18         [ 7] 1437 	add	a, #0x18
   79C5 57            [ 4] 1438 	ld	d,a
   79C6 0A            [ 7] 1439 	ld	a,(bc)
   79C7 C6 02         [ 7] 1440 	add	a, #0x02
   79C9 C5            [11] 1441 	push	bc
   79CA D5            [11] 1442 	push	de
   79CB 33            [ 6] 1443 	inc	sp
   79CC F5            [11] 1444 	push	af
   79CD 33            [ 6] 1445 	inc	sp
   79CE CD 77 73      [17] 1446 	call	_getTilePtr
   79D1 F1            [10] 1447 	pop	af
   79D2 C1            [10] 1448 	pop	bc
   79D3 5E            [ 7] 1449 	ld	e,(hl)
   79D4 3E 02         [ 7] 1450 	ld	a,#0x02
   79D6 93            [ 4] 1451 	sub	a, e
   79D7 DA 72 7A      [10] 1452 	jp	C,00161$
                           1453 ;src/main.c:310: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   79DA DD 6E F8      [19] 1454 	ld	l,-8 (ix)
   79DD DD 66 F9      [19] 1455 	ld	h,-7 (ix)
   79E0 7E            [ 7] 1456 	ld	a,(hl)
   79E1 C6 18         [ 7] 1457 	add	a, #0x18
   79E3 57            [ 4] 1458 	ld	d,a
   79E4 0A            [ 7] 1459 	ld	a,(bc)
   79E5 C6 04         [ 7] 1460 	add	a, #0x04
   79E7 C5            [11] 1461 	push	bc
   79E8 D5            [11] 1462 	push	de
   79E9 33            [ 6] 1463 	inc	sp
   79EA F5            [11] 1464 	push	af
   79EB 33            [ 6] 1465 	inc	sp
   79EC CD 77 73      [17] 1466 	call	_getTilePtr
   79EF F1            [10] 1467 	pop	af
   79F0 C1            [10] 1468 	pop	bc
   79F1 5E            [ 7] 1469 	ld	e,(hl)
   79F2 3E 02         [ 7] 1470 	ld	a,#0x02
   79F4 93            [ 4] 1471 	sub	a, e
   79F5 38 7B         [12] 1472 	jr	C,00161$
                           1473 ;src/main.c:312: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   79F7 21 D7 69      [10] 1474 	ld	hl, #_cu + 0
   79FA 5E            [ 7] 1475 	ld	e,(hl)
   79FB 16 00         [ 7] 1476 	ld	d,#0x00
   79FD 21 02 00      [10] 1477 	ld	hl,#0x0002
   7A00 19            [11] 1478 	add	hl,de
   7A01 DD 75 FE      [19] 1479 	ld	-2 (ix),l
   7A04 DD 74 FF      [19] 1480 	ld	-1 (ix),h
   7A07 0A            [ 7] 1481 	ld	a,(bc)
   7A08 4F            [ 4] 1482 	ld	c,a
   7A09 06 00         [ 7] 1483 	ld	b,#0x00
   7A0B DD 7E FE      [19] 1484 	ld	a,-2 (ix)
   7A0E 91            [ 4] 1485 	sub	a, c
   7A0F DD 7E FF      [19] 1486 	ld	a,-1 (ix)
   7A12 98            [ 4] 1487 	sbc	a, b
   7A13 E2 18 7A      [10] 1488 	jp	PO, 00283$
   7A16 EE 80         [ 7] 1489 	xor	a, #0x80
   7A18                    1490 00283$:
   7A18 FA 2B 7A      [10] 1491 	jp	M,00156$
   7A1B 03            [ 6] 1492 	inc	bc
   7A1C 03            [ 6] 1493 	inc	bc
   7A1D 03            [ 6] 1494 	inc	bc
   7A1E 03            [ 6] 1495 	inc	bc
   7A1F 79            [ 4] 1496 	ld	a,c
   7A20 93            [ 4] 1497 	sub	a, e
   7A21 78            [ 4] 1498 	ld	a,b
   7A22 9A            [ 4] 1499 	sbc	a, d
   7A23 E2 28 7A      [10] 1500 	jp	PO, 00284$
   7A26 EE 80         [ 7] 1501 	xor	a, #0x80
   7A28                    1502 00284$:
   7A28 F2 31 7A      [10] 1503 	jp	P,00157$
   7A2B                    1504 00156$:
                           1505 ;src/main.c:313: colisiona = 0;
   7A2B DD 36 F7 00   [19] 1506 	ld	-9 (ix),#0x00
   7A2F 18 49         [12] 1507 	jr	00165$
   7A31                    1508 00157$:
                           1509 ;src/main.c:316: if(cu.y > enemy->y){ //si el cu esta abajo
   7A31 21 D8 69      [10] 1510 	ld	hl, #(_cu + 0x0001) + 0
   7A34 4E            [ 7] 1511 	ld	c,(hl)
   7A35 DD 6E F8      [19] 1512 	ld	l,-8 (ix)
   7A38 DD 66 F9      [19] 1513 	ld	h,-7 (ix)
   7A3B 5E            [ 7] 1514 	ld	e,(hl)
   7A3C 7B            [ 4] 1515 	ld	a,e
   7A3D 91            [ 4] 1516 	sub	a, c
   7A3E 30 2C         [12] 1517 	jr	NC,00154$
                           1518 ;src/main.c:317: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   7A40 06 00         [ 7] 1519 	ld	b,#0x00
   7A42 16 00         [ 7] 1520 	ld	d,#0x00
   7A44 21 16 00      [10] 1521 	ld	hl,#0x0016
   7A47 19            [11] 1522 	add	hl,de
   7A48 79            [ 4] 1523 	ld	a,c
   7A49 95            [ 4] 1524 	sub	a, l
   7A4A 4F            [ 4] 1525 	ld	c,a
   7A4B 78            [ 4] 1526 	ld	a,b
   7A4C 9C            [ 4] 1527 	sbc	a, h
   7A4D 47            [ 4] 1528 	ld	b,a
   7A4E 3E 02         [ 7] 1529 	ld	a,#0x02
   7A50 B9            [ 4] 1530 	cp	a, c
   7A51 3E 00         [ 7] 1531 	ld	a,#0x00
   7A53 98            [ 4] 1532 	sbc	a, b
   7A54 E2 59 7A      [10] 1533 	jp	PO, 00285$
   7A57 EE 80         [ 7] 1534 	xor	a, #0x80
   7A59                    1535 00285$:
   7A59 F2 62 7A      [10] 1536 	jp	P,00151$
                           1537 ;src/main.c:318: colisiona = 0;
   7A5C DD 36 F7 00   [19] 1538 	ld	-9 (ix),#0x00
   7A60 18 18         [12] 1539 	jr	00165$
   7A62                    1540 00151$:
                           1541 ;src/main.c:321: enemy->muerto = SI;
   7A62 DD 6E FA      [19] 1542 	ld	l,-6 (ix)
   7A65 DD 66 FB      [19] 1543 	ld	h,-5 (ix)
   7A68 36 01         [10] 1544 	ld	(hl),#0x01
   7A6A 18 0E         [12] 1545 	jr	00165$
   7A6C                    1546 00154$:
                           1547 ;src/main.c:325: colisiona = 0;
   7A6C DD 36 F7 00   [19] 1548 	ld	-9 (ix),#0x00
   7A70 18 08         [12] 1549 	jr	00165$
   7A72                    1550 00161$:
                           1551 ;src/main.c:329: enemy->mira = M_arriba;
   7A72 DD 6E FC      [19] 1552 	ld	l,-4 (ix)
   7A75 DD 66 FD      [19] 1553 	ld	h,-3 (ix)
   7A78 36 02         [10] 1554 	ld	(hl),#0x02
                           1555 ;src/main.c:332: }
   7A7A                    1556 00165$:
                           1557 ;src/main.c:333: return colisiona;
   7A7A DD 6E F7      [19] 1558 	ld	l,-9 (ix)
   7A7D DD F9         [10] 1559 	ld	sp, ix
   7A7F DD E1         [14] 1560 	pop	ix
   7A81 C9            [10] 1561 	ret
                           1562 ;src/main.c:336: void moverEnemigoArriba(TEnemy *enemy){
                           1563 ;	---------------------------------
                           1564 ; Function moverEnemigoArriba
                           1565 ; ---------------------------------
   7A82                    1566 _moverEnemigoArriba::
   7A82 DD E5         [15] 1567 	push	ix
   7A84 DD 21 00 00   [14] 1568 	ld	ix,#0
   7A88 DD 39         [15] 1569 	add	ix,sp
                           1570 ;src/main.c:337: enemy->y--;
   7A8A DD 4E 04      [19] 1571 	ld	c,4 (ix)
   7A8D DD 46 05      [19] 1572 	ld	b,5 (ix)
   7A90 69            [ 4] 1573 	ld	l, c
   7A91 60            [ 4] 1574 	ld	h, b
   7A92 23            [ 6] 1575 	inc	hl
   7A93 5E            [ 7] 1576 	ld	e,(hl)
   7A94 1D            [ 4] 1577 	dec	e
   7A95 73            [ 7] 1578 	ld	(hl),e
                           1579 ;src/main.c:338: enemy->y--;
   7A96 1D            [ 4] 1580 	dec	e
   7A97 73            [ 7] 1581 	ld	(hl),e
                           1582 ;src/main.c:339: enemy->mover = SI;
   7A98 21 06 00      [10] 1583 	ld	hl,#0x0006
   7A9B 09            [11] 1584 	add	hl,bc
   7A9C 36 01         [10] 1585 	ld	(hl),#0x01
   7A9E DD E1         [14] 1586 	pop	ix
   7AA0 C9            [10] 1587 	ret
                           1588 ;src/main.c:342: void moverEnemigoAbajo(TEnemy *enemy){
                           1589 ;	---------------------------------
                           1590 ; Function moverEnemigoAbajo
                           1591 ; ---------------------------------
   7AA1                    1592 _moverEnemigoAbajo::
   7AA1 DD E5         [15] 1593 	push	ix
   7AA3 DD 21 00 00   [14] 1594 	ld	ix,#0
   7AA7 DD 39         [15] 1595 	add	ix,sp
                           1596 ;src/main.c:343: enemy->y++;
   7AA9 DD 4E 04      [19] 1597 	ld	c,4 (ix)
   7AAC DD 46 05      [19] 1598 	ld	b,5 (ix)
   7AAF 59            [ 4] 1599 	ld	e, c
   7AB0 50            [ 4] 1600 	ld	d, b
   7AB1 13            [ 6] 1601 	inc	de
   7AB2 1A            [ 7] 1602 	ld	a,(de)
   7AB3 3C            [ 4] 1603 	inc	a
   7AB4 12            [ 7] 1604 	ld	(de),a
                           1605 ;src/main.c:344: enemy->y++;
   7AB5 3C            [ 4] 1606 	inc	a
   7AB6 12            [ 7] 1607 	ld	(de),a
                           1608 ;src/main.c:345: enemy->mover = SI;
   7AB7 21 06 00      [10] 1609 	ld	hl,#0x0006
   7ABA 09            [11] 1610 	add	hl,bc
   7ABB 36 01         [10] 1611 	ld	(hl),#0x01
   7ABD DD E1         [14] 1612 	pop	ix
   7ABF C9            [10] 1613 	ret
                           1614 ;src/main.c:348: void moverEnemigoDerecha(TEnemy *enemy){
                           1615 ;	---------------------------------
                           1616 ; Function moverEnemigoDerecha
                           1617 ; ---------------------------------
   7AC0                    1618 _moverEnemigoDerecha::
                           1619 ;src/main.c:349: enemy->x++;
   7AC0 D1            [10] 1620 	pop	de
   7AC1 C1            [10] 1621 	pop	bc
   7AC2 C5            [11] 1622 	push	bc
   7AC3 D5            [11] 1623 	push	de
   7AC4 0A            [ 7] 1624 	ld	a,(bc)
   7AC5 3C            [ 4] 1625 	inc	a
   7AC6 02            [ 7] 1626 	ld	(bc),a
                           1627 ;src/main.c:350: enemy->x++;
   7AC7 3C            [ 4] 1628 	inc	a
   7AC8 02            [ 7] 1629 	ld	(bc),a
                           1630 ;src/main.c:351: enemy->mover = SI;
   7AC9 21 06 00      [10] 1631 	ld	hl,#0x0006
   7ACC 09            [11] 1632 	add	hl,bc
   7ACD 36 01         [10] 1633 	ld	(hl),#0x01
   7ACF C9            [10] 1634 	ret
                           1635 ;src/main.c:354: void moverEnemigoIzquierda(TEnemy *enemy){
                           1636 ;	---------------------------------
                           1637 ; Function moverEnemigoIzquierda
                           1638 ; ---------------------------------
   7AD0                    1639 _moverEnemigoIzquierda::
                           1640 ;src/main.c:355: enemy->x--;
   7AD0 D1            [10] 1641 	pop	de
   7AD1 C1            [10] 1642 	pop	bc
   7AD2 C5            [11] 1643 	push	bc
   7AD3 D5            [11] 1644 	push	de
   7AD4 0A            [ 7] 1645 	ld	a,(bc)
   7AD5 C6 FF         [ 7] 1646 	add	a,#0xFF
   7AD7 02            [ 7] 1647 	ld	(bc),a
                           1648 ;src/main.c:356: enemy->x--;
   7AD8 C6 FF         [ 7] 1649 	add	a,#0xFF
   7ADA 02            [ 7] 1650 	ld	(bc),a
                           1651 ;src/main.c:357: enemy->mover = SI;
   7ADB 21 06 00      [10] 1652 	ld	hl,#0x0006
   7ADE 09            [11] 1653 	add	hl,bc
   7ADF 36 01         [10] 1654 	ld	(hl),#0x01
   7AE1 C9            [10] 1655 	ret
                           1656 ;src/main.c:360: void moverEnemigoPathfinding(TEnemy *enemy){
                           1657 ;	---------------------------------
                           1658 ; Function moverEnemigoPathfinding
                           1659 ; ---------------------------------
   7AE2                    1660 _moverEnemigoPathfinding::
   7AE2 DD E5         [15] 1661 	push	ix
   7AE4 DD 21 00 00   [14] 1662 	ld	ix,#0
   7AE8 DD 39         [15] 1663 	add	ix,sp
   7AEA 21 F3 FF      [10] 1664 	ld	hl,#-13
   7AED 39            [11] 1665 	add	hl,sp
   7AEE F9            [ 6] 1666 	ld	sp,hl
                           1667 ;src/main.c:361: if(!enemy->muerto){
   7AEF DD 4E 04      [19] 1668 	ld	c,4 (ix)
   7AF2 DD 46 05      [19] 1669 	ld	b,5 (ix)
   7AF5 C5            [11] 1670 	push	bc
   7AF6 FD E1         [14] 1671 	pop	iy
   7AF8 FD 7E 08      [19] 1672 	ld	a,8 (iy)
   7AFB B7            [ 4] 1673 	or	a, a
   7AFC C2 08 7C      [10] 1674 	jp	NZ,00112$
                           1675 ;src/main.c:363: if (!enemy->reversePatrol) {
   7AFF 21 0D 00      [10] 1676 	ld	hl,#0x000D
   7B02 09            [11] 1677 	add	hl,bc
   7B03 E3            [19] 1678 	ex	(sp), hl
   7B04 E1            [10] 1679 	pop	hl
   7B05 E5            [11] 1680 	push	hl
   7B06 7E            [ 7] 1681 	ld	a,(hl)
   7B07 DD 77 FF      [19] 1682 	ld	-1 (ix),a
                           1683 ;src/main.c:364: if(enemy->iter < enemy->longitud_camino - 8){
   7B0A 21 0F 00      [10] 1684 	ld	hl,#0x000F
   7B0D 09            [11] 1685 	add	hl,bc
   7B0E EB            [ 4] 1686 	ex	de,hl
                           1687 ;src/main.c:365: enemy->x = enemy->camino[enemy->iter];
   7B0F 21 17 00      [10] 1688 	ld	hl,#0x0017
   7B12 09            [11] 1689 	add	hl,bc
   7B13 DD 75 FD      [19] 1690 	ld	-3 (ix),l
   7B16 DD 74 FE      [19] 1691 	ld	-2 (ix),h
                           1692 ;src/main.c:367: enemy->y = enemy->camino[enemy->iter];
   7B19 21 01 00      [10] 1693 	ld	hl,#0x0001
   7B1C 09            [11] 1694 	add	hl,bc
   7B1D DD 75 FB      [19] 1695 	ld	-5 (ix),l
   7B20 DD 74 FC      [19] 1696 	ld	-4 (ix),h
                           1697 ;src/main.c:369: enemy->mover = SI;
   7B23 21 06 00      [10] 1698 	ld	hl,#0x0006
   7B26 09            [11] 1699 	add	hl,bc
   7B27 DD 75 F9      [19] 1700 	ld	-7 (ix),l
   7B2A DD 74 FA      [19] 1701 	ld	-6 (ix),h
                           1702 ;src/main.c:372: enemy->lastIter = enemy->iter - 1;
   7B2D 21 10 00      [10] 1703 	ld	hl,#0x0010
   7B30 09            [11] 1704 	add	hl,bc
   7B31 DD 75 F7      [19] 1705 	ld	-9 (ix),l
   7B34 DD 74 F8      [19] 1706 	ld	-8 (ix),h
                           1707 ;src/main.c:363: if (!enemy->reversePatrol) {
   7B37 DD 7E FF      [19] 1708 	ld	a,-1 (ix)
   7B3A B7            [ 4] 1709 	or	a, a
   7B3B 20 78         [12] 1710 	jr	NZ,00108$
                           1711 ;src/main.c:364: if(enemy->iter < enemy->longitud_camino - 8){
   7B3D 1A            [ 7] 1712 	ld	a,(de)
   7B3E DD 77 FF      [19] 1713 	ld	-1 (ix),a
   7B41 69            [ 4] 1714 	ld	l, c
   7B42 60            [ 4] 1715 	ld	h, b
   7B43 C5            [11] 1716 	push	bc
   7B44 01 43 01      [10] 1717 	ld	bc, #0x0143
   7B47 09            [11] 1718 	add	hl, bc
   7B48 C1            [10] 1719 	pop	bc
   7B49 6E            [ 7] 1720 	ld	l,(hl)
   7B4A 26 00         [ 7] 1721 	ld	h,#0x00
   7B4C 7D            [ 4] 1722 	ld	a,l
   7B4D C6 F8         [ 7] 1723 	add	a,#0xF8
   7B4F DD 77 F5      [19] 1724 	ld	-11 (ix),a
   7B52 7C            [ 4] 1725 	ld	a,h
   7B53 CE FF         [ 7] 1726 	adc	a,#0xFF
   7B55 DD 77 F6      [19] 1727 	ld	-10 (ix),a
   7B58 DD 7E FF      [19] 1728 	ld	a, -1 (ix)
   7B5B 26 00         [ 7] 1729 	ld	h, #0x00
   7B5D DD 96 F5      [19] 1730 	sub	a, -11 (ix)
   7B60 7C            [ 4] 1731 	ld	a,h
   7B61 DD 9E F6      [19] 1732 	sbc	a, -10 (ix)
   7B64 E2 69 7B      [10] 1733 	jp	PO, 00130$
   7B67 EE 80         [ 7] 1734 	xor	a, #0x80
   7B69                    1735 00130$:
   7B69 F2 A4 7B      [10] 1736 	jp	P,00102$
                           1737 ;src/main.c:365: enemy->x = enemy->camino[enemy->iter];
   7B6C DD 6E FF      [19] 1738 	ld	l,-1 (ix)
   7B6F 26 00         [ 7] 1739 	ld	h,#0x00
   7B71 DD 7E FD      [19] 1740 	ld	a,-3 (ix)
   7B74 85            [ 4] 1741 	add	a, l
   7B75 6F            [ 4] 1742 	ld	l,a
   7B76 DD 7E FE      [19] 1743 	ld	a,-2 (ix)
   7B79 8C            [ 4] 1744 	adc	a, h
   7B7A 67            [ 4] 1745 	ld	h,a
   7B7B 7E            [ 7] 1746 	ld	a,(hl)
   7B7C 02            [ 7] 1747 	ld	(bc),a
                           1748 ;src/main.c:366: enemy->iter++;
   7B7D 1A            [ 7] 1749 	ld	a,(de)
   7B7E 4F            [ 4] 1750 	ld	c,a
   7B7F 0C            [ 4] 1751 	inc	c
   7B80 79            [ 4] 1752 	ld	a,c
   7B81 12            [ 7] 1753 	ld	(de),a
                           1754 ;src/main.c:367: enemy->y = enemy->camino[enemy->iter];
   7B82 69            [ 4] 1755 	ld	l,c
   7B83 26 00         [ 7] 1756 	ld	h,#0x00
   7B85 DD 7E FD      [19] 1757 	ld	a,-3 (ix)
   7B88 85            [ 4] 1758 	add	a, l
   7B89 6F            [ 4] 1759 	ld	l,a
   7B8A DD 7E FE      [19] 1760 	ld	a,-2 (ix)
   7B8D 8C            [ 4] 1761 	adc	a, h
   7B8E 67            [ 4] 1762 	ld	h,a
   7B8F 46            [ 7] 1763 	ld	b,(hl)
   7B90 DD 6E FB      [19] 1764 	ld	l,-5 (ix)
   7B93 DD 66 FC      [19] 1765 	ld	h,-4 (ix)
   7B96 70            [ 7] 1766 	ld	(hl),b
                           1767 ;src/main.c:368: enemy->iter++;
   7B97 0C            [ 4] 1768 	inc	c
   7B98 79            [ 4] 1769 	ld	a,c
   7B99 12            [ 7] 1770 	ld	(de),a
                           1771 ;src/main.c:369: enemy->mover = SI;
   7B9A DD 6E F9      [19] 1772 	ld	l,-7 (ix)
   7B9D DD 66 FA      [19] 1773 	ld	h,-6 (ix)
   7BA0 36 01         [10] 1774 	ld	(hl),#0x01
   7BA2 18 64         [12] 1775 	jr	00112$
   7BA4                    1776 00102$:
                           1777 ;src/main.c:372: enemy->lastIter = enemy->iter - 1;
   7BA4 DD 4E FF      [19] 1778 	ld	c,-1 (ix)
   7BA7 0D            [ 4] 1779 	dec	c
   7BA8 DD 6E F7      [19] 1780 	ld	l,-9 (ix)
   7BAB DD 66 F8      [19] 1781 	ld	h,-8 (ix)
   7BAE 71            [ 7] 1782 	ld	(hl),c
                           1783 ;src/main.c:375: enemy->reversePatrol = 1;
   7BAF E1            [10] 1784 	pop	hl
   7BB0 E5            [11] 1785 	push	hl
   7BB1 36 01         [10] 1786 	ld	(hl),#0x01
   7BB3 18 53         [12] 1787 	jr	00112$
   7BB5                    1788 00108$:
                           1789 ;src/main.c:378: if(enemy->lastIter > 1){
   7BB5 DD 6E F7      [19] 1790 	ld	l,-9 (ix)
   7BB8 DD 66 F8      [19] 1791 	ld	h,-8 (ix)
   7BBB 6E            [ 7] 1792 	ld	l,(hl)
   7BBC 3E 01         [ 7] 1793 	ld	a,#0x01
   7BBE 95            [ 4] 1794 	sub	a, l
   7BBF 30 41         [12] 1795 	jr	NC,00105$
                           1796 ;src/main.c:379: enemy->y = enemy->camino[enemy->lastIter];
   7BC1 26 00         [ 7] 1797 	ld	h,#0x00
   7BC3 DD 5E FD      [19] 1798 	ld	e,-3 (ix)
   7BC6 DD 56 FE      [19] 1799 	ld	d,-2 (ix)
   7BC9 19            [11] 1800 	add	hl,de
   7BCA 5E            [ 7] 1801 	ld	e,(hl)
   7BCB DD 6E FB      [19] 1802 	ld	l,-5 (ix)
   7BCE DD 66 FC      [19] 1803 	ld	h,-4 (ix)
   7BD1 73            [ 7] 1804 	ld	(hl),e
                           1805 ;src/main.c:380: enemy->lastIter--;
   7BD2 DD 6E F7      [19] 1806 	ld	l,-9 (ix)
   7BD5 DD 66 F8      [19] 1807 	ld	h,-8 (ix)
   7BD8 5E            [ 7] 1808 	ld	e,(hl)
   7BD9 1D            [ 4] 1809 	dec	e
   7BDA DD 6E F7      [19] 1810 	ld	l,-9 (ix)
   7BDD DD 66 F8      [19] 1811 	ld	h,-8 (ix)
   7BE0 73            [ 7] 1812 	ld	(hl),e
                           1813 ;src/main.c:381: enemy->x = enemy->camino[enemy->lastIter];
   7BE1 6B            [ 4] 1814 	ld	l,e
   7BE2 26 00         [ 7] 1815 	ld	h,#0x00
   7BE4 DD 7E FD      [19] 1816 	ld	a,-3 (ix)
   7BE7 85            [ 4] 1817 	add	a, l
   7BE8 6F            [ 4] 1818 	ld	l,a
   7BE9 DD 7E FE      [19] 1819 	ld	a,-2 (ix)
   7BEC 8C            [ 4] 1820 	adc	a, h
   7BED 67            [ 4] 1821 	ld	h,a
   7BEE 7E            [ 7] 1822 	ld	a,(hl)
   7BEF 02            [ 7] 1823 	ld	(bc),a
                           1824 ;src/main.c:382: enemy->lastIter--;
   7BF0 1D            [ 4] 1825 	dec	e
   7BF1 DD 6E F7      [19] 1826 	ld	l,-9 (ix)
   7BF4 DD 66 F8      [19] 1827 	ld	h,-8 (ix)
   7BF7 73            [ 7] 1828 	ld	(hl),e
                           1829 ;src/main.c:383: enemy->mover = SI;
   7BF8 DD 6E F9      [19] 1830 	ld	l,-7 (ix)
   7BFB DD 66 FA      [19] 1831 	ld	h,-6 (ix)
   7BFE 36 01         [10] 1832 	ld	(hl),#0x01
   7C00 18 06         [12] 1833 	jr	00112$
   7C02                    1834 00105$:
                           1835 ;src/main.c:386: enemy->iter = 0;
   7C02 AF            [ 4] 1836 	xor	a, a
   7C03 12            [ 7] 1837 	ld	(de),a
                           1838 ;src/main.c:388: enemy->reversePatrol = 0;
   7C04 E1            [10] 1839 	pop	hl
   7C05 E5            [11] 1840 	push	hl
   7C06 36 00         [10] 1841 	ld	(hl),#0x00
   7C08                    1842 00112$:
   7C08 DD F9         [10] 1843 	ld	sp, ix
   7C0A DD E1         [14] 1844 	pop	ix
   7C0C C9            [10] 1845 	ret
                           1846 ;src/main.c:395: void moverEnemigo(TEnemy *enemy){
                           1847 ;	---------------------------------
                           1848 ; Function moverEnemigo
                           1849 ; ---------------------------------
   7C0D                    1850 _moverEnemigo::
   7C0D DD E5         [15] 1851 	push	ix
   7C0F DD 21 00 00   [14] 1852 	ld	ix,#0
   7C13 DD 39         [15] 1853 	add	ix,sp
                           1854 ;src/main.c:396: if(!enemy->muerto){
   7C15 DD 4E 04      [19] 1855 	ld	c,4 (ix)
   7C18 DD 46 05      [19] 1856 	ld	b,5 (ix)
   7C1B C5            [11] 1857 	push	bc
   7C1C FD E1         [14] 1858 	pop	iy
   7C1E FD 7E 08      [19] 1859 	ld	a,8 (iy)
   7C21 B7            [ 4] 1860 	or	a, a
   7C22 20 46         [12] 1861 	jr	NZ,00110$
                           1862 ;src/main.c:397: if(!checkEnemyCollision(enemy->mira, enemy)){
   7C24 21 07 00      [10] 1863 	ld	hl,#0x0007
   7C27 09            [11] 1864 	add	hl,bc
   7C28 5E            [ 7] 1865 	ld	e,(hl)
   7C29 16 00         [ 7] 1866 	ld	d,#0x00
   7C2B E5            [11] 1867 	push	hl
   7C2C C5            [11] 1868 	push	bc
   7C2D C5            [11] 1869 	push	bc
   7C2E D5            [11] 1870 	push	de
   7C2F CD B2 76      [17] 1871 	call	_checkEnemyCollision
   7C32 F1            [10] 1872 	pop	af
   7C33 F1            [10] 1873 	pop	af
   7C34 7D            [ 4] 1874 	ld	a,l
   7C35 C1            [10] 1875 	pop	bc
   7C36 E1            [10] 1876 	pop	hl
   7C37 B7            [ 4] 1877 	or	a, a
   7C38 20 30         [12] 1878 	jr	NZ,00110$
                           1879 ;src/main.c:399: switch (enemy->mira) {
   7C3A 5E            [ 7] 1880 	ld	e,(hl)
   7C3B 3E 03         [ 7] 1881 	ld	a,#0x03
   7C3D 93            [ 4] 1882 	sub	a, e
   7C3E 38 2A         [12] 1883 	jr	C,00110$
   7C40 16 00         [ 7] 1884 	ld	d,#0x00
   7C42 21 48 7C      [10] 1885 	ld	hl,#00124$
   7C45 19            [11] 1886 	add	hl,de
   7C46 19            [11] 1887 	add	hl,de
                           1888 ;src/main.c:401: case 0:
   7C47 E9            [ 4] 1889 	jp	(hl)
   7C48                    1890 00124$:
   7C48 18 06         [12] 1891 	jr	00101$
   7C4A 18 0B         [12] 1892 	jr	00102$
   7C4C 18 10         [12] 1893 	jr	00103$
   7C4E 18 15         [12] 1894 	jr	00104$
   7C50                    1895 00101$:
                           1896 ;src/main.c:402: moverEnemigoDerecha(enemy);
   7C50 C5            [11] 1897 	push	bc
   7C51 CD C0 7A      [17] 1898 	call	_moverEnemigoDerecha
   7C54 F1            [10] 1899 	pop	af
                           1900 ;src/main.c:403: break;
   7C55 18 13         [12] 1901 	jr	00110$
                           1902 ;src/main.c:404: case 1:
   7C57                    1903 00102$:
                           1904 ;src/main.c:405: moverEnemigoIzquierda(enemy);
   7C57 C5            [11] 1905 	push	bc
   7C58 CD D0 7A      [17] 1906 	call	_moverEnemigoIzquierda
   7C5B F1            [10] 1907 	pop	af
                           1908 ;src/main.c:406: break;
   7C5C 18 0C         [12] 1909 	jr	00110$
                           1910 ;src/main.c:407: case 2:
   7C5E                    1911 00103$:
                           1912 ;src/main.c:408: moverEnemigoArriba(enemy);
   7C5E C5            [11] 1913 	push	bc
   7C5F CD 82 7A      [17] 1914 	call	_moverEnemigoArriba
   7C62 F1            [10] 1915 	pop	af
                           1916 ;src/main.c:409: break;
   7C63 18 05         [12] 1917 	jr	00110$
                           1918 ;src/main.c:410: case 3:
   7C65                    1919 00104$:
                           1920 ;src/main.c:411: moverEnemigoAbajo(enemy);
   7C65 C5            [11] 1921 	push	bc
   7C66 CD A1 7A      [17] 1922 	call	_moverEnemigoAbajo
   7C69 F1            [10] 1923 	pop	af
                           1924 ;src/main.c:413: }
   7C6A                    1925 00110$:
   7C6A DD E1         [14] 1926 	pop	ix
   7C6C C9            [10] 1927 	ret
                           1928 ;src/main.c:418: void lookFor(TEnemy* enemy){
                           1929 ;	---------------------------------
                           1930 ; Function lookFor
                           1931 ; ---------------------------------
   7C6D                    1932 _lookFor::
   7C6D DD E5         [15] 1933 	push	ix
   7C6F DD 21 00 00   [14] 1934 	ld	ix,#0
   7C73 DD 39         [15] 1935 	add	ix,sp
   7C75 21 F6 FF      [10] 1936 	ld	hl,#-10
   7C78 39            [11] 1937 	add	hl,sp
   7C79 F9            [ 6] 1938 	ld	sp,hl
                           1939 ;src/main.c:421: u8 interpone = NO;
   7C7A 0E 00         [ 7] 1940 	ld	c,#0x00
                           1941 ;src/main.c:425: u8 difx = abs(enemy->x - prota.x);
   7C7C DD 7E 04      [19] 1942 	ld	a,4 (ix)
   7C7F DD 77 FA      [19] 1943 	ld	-6 (ix),a
   7C82 DD 7E 05      [19] 1944 	ld	a,5 (ix)
   7C85 DD 77 FB      [19] 1945 	ld	-5 (ix),a
   7C88 DD 6E FA      [19] 1946 	ld	l,-6 (ix)
   7C8B DD 66 FB      [19] 1947 	ld	h,-5 (ix)
   7C8E 46            [ 7] 1948 	ld	b,(hl)
   7C8F 16 00         [ 7] 1949 	ld	d,#0x00
   7C91 21 CF 69      [10] 1950 	ld	hl,#_prota+0
   7C94 6E            [ 7] 1951 	ld	l,(hl)
   7C95 26 00         [ 7] 1952 	ld	h,#0x00
   7C97 78            [ 4] 1953 	ld	a,b
   7C98 95            [ 4] 1954 	sub	a, l
   7C99 5F            [ 4] 1955 	ld	e,a
   7C9A 7A            [ 4] 1956 	ld	a,d
   7C9B 9C            [ 4] 1957 	sbc	a, h
   7C9C 57            [ 4] 1958 	ld	d,a
   7C9D C5            [11] 1959 	push	bc
   7C9E D5            [11] 1960 	push	de
   7C9F CD E2 4B      [17] 1961 	call	_abs
   7CA2 F1            [10] 1962 	pop	af
   7CA3 C1            [10] 1963 	pop	bc
   7CA4 45            [ 4] 1964 	ld	b,l
                           1965 ;src/main.c:426: u8 dify = abs(enemy->y - prota.y);
   7CA5 DD 7E FA      [19] 1966 	ld	a,-6 (ix)
   7CA8 C6 01         [ 7] 1967 	add	a, #0x01
   7CAA DD 77 F8      [19] 1968 	ld	-8 (ix),a
   7CAD DD 7E FB      [19] 1969 	ld	a,-5 (ix)
   7CB0 CE 00         [ 7] 1970 	adc	a, #0x00
   7CB2 DD 77 F9      [19] 1971 	ld	-7 (ix),a
   7CB5 DD 6E F8      [19] 1972 	ld	l,-8 (ix)
   7CB8 DD 66 F9      [19] 1973 	ld	h,-7 (ix)
   7CBB 5E            [ 7] 1974 	ld	e,(hl)
   7CBC 16 00         [ 7] 1975 	ld	d,#0x00
   7CBE 21 D0 69      [10] 1976 	ld	hl, #(_prota + 0x0001) + 0
   7CC1 6E            [ 7] 1977 	ld	l,(hl)
   7CC2 26 00         [ 7] 1978 	ld	h,#0x00
   7CC4 7B            [ 4] 1979 	ld	a,e
   7CC5 95            [ 4] 1980 	sub	a, l
   7CC6 5F            [ 4] 1981 	ld	e,a
   7CC7 7A            [ 4] 1982 	ld	a,d
   7CC8 9C            [ 4] 1983 	sbc	a, h
   7CC9 57            [ 4] 1984 	ld	d,a
   7CCA C5            [11] 1985 	push	bc
   7CCB D5            [11] 1986 	push	de
   7CCC CD E2 4B      [17] 1987 	call	_abs
   7CCF F1            [10] 1988 	pop	af
   7CD0 C1            [10] 1989 	pop	bc
                           1990 ;src/main.c:427: dist = difx + dify; // manhattan
   7CD1 78            [ 4] 1991 	ld	a,b
   7CD2 85            [ 4] 1992 	add	a, l
   7CD3 47            [ 4] 1993 	ld	b,a
                           1994 ;src/main.c:429: enemy->seen = NO;
   7CD4 DD 7E FA      [19] 1995 	ld	a,-6 (ix)
   7CD7 C6 12         [ 7] 1996 	add	a, #0x12
   7CD9 DD 77 F6      [19] 1997 	ld	-10 (ix),a
   7CDC DD 7E FB      [19] 1998 	ld	a,-5 (ix)
   7CDF CE 00         [ 7] 1999 	adc	a, #0x00
   7CE1 DD 77 F7      [19] 2000 	ld	-9 (ix),a
   7CE4 E1            [10] 2001 	pop	hl
   7CE5 E5            [11] 2002 	push	hl
   7CE6 36 00         [10] 2003 	ld	(hl),#0x00
                           2004 ;src/main.c:430: enemy->inRange = NO;
   7CE8 DD 7E FA      [19] 2005 	ld	a,-6 (ix)
   7CEB C6 11         [ 7] 2006 	add	a, #0x11
   7CED DD 77 FE      [19] 2007 	ld	-2 (ix),a
   7CF0 DD 7E FB      [19] 2008 	ld	a,-5 (ix)
   7CF3 CE 00         [ 7] 2009 	adc	a, #0x00
   7CF5 DD 77 FF      [19] 2010 	ld	-1 (ix),a
   7CF8 DD 6E FE      [19] 2011 	ld	l,-2 (ix)
   7CFB DD 66 FF      [19] 2012 	ld	h,-1 (ix)
   7CFE 36 00         [10] 2013 	ld	(hl),#0x00
                           2014 ;src/main.c:432: if (dist <= 10) {// te detectan los sensores de proximidad
   7D00 3E 0A         [ 7] 2015 	ld	a,#0x0A
   7D02 90            [ 4] 2016 	sub	a, b
   7D03 38 0F         [12] 2017 	jr	C,00123$
                           2018 ;src/main.c:433: enemy->seen = 1;
   7D05 E1            [10] 2019 	pop	hl
   7D06 E5            [11] 2020 	push	hl
   7D07 36 01         [10] 2021 	ld	(hl),#0x01
                           2022 ;src/main.c:434: enemy->inRange = 1;
   7D09 DD 6E FE      [19] 2023 	ld	l,-2 (ix)
   7D0C DD 66 FF      [19] 2024 	ld	h,-1 (ix)
   7D0F 36 01         [10] 2025 	ld	(hl),#0x01
   7D11 C3 0B 7E      [10] 2026 	jp	00133$
   7D14                    2027 00123$:
                           2028 ;src/main.c:435: } else if(enemy->x > prota.x - 50 && enemy->x < prota.x + 50  ){
   7D14 DD 6E FA      [19] 2029 	ld	l,-6 (ix)
   7D17 DD 66 FB      [19] 2030 	ld	h,-5 (ix)
   7D1A 7E            [ 7] 2031 	ld	a,(hl)
   7D1B DD 77 FE      [19] 2032 	ld	-2 (ix),a
   7D1E 21 CF 69      [10] 2033 	ld	hl, #_prota + 0
   7D21 46            [ 7] 2034 	ld	b,(hl)
   7D22 58            [ 4] 2035 	ld	e,b
   7D23 16 00         [ 7] 2036 	ld	d,#0x00
   7D25 7B            [ 4] 2037 	ld	a,e
   7D26 C6 CE         [ 7] 2038 	add	a,#0xCE
   7D28 DD 77 FC      [19] 2039 	ld	-4 (ix),a
   7D2B 7A            [ 4] 2040 	ld	a,d
   7D2C CE FF         [ 7] 2041 	adc	a,#0xFF
   7D2E DD 77 FD      [19] 2042 	ld	-3 (ix),a
   7D31 DD 6E FE      [19] 2043 	ld	l,-2 (ix)
   7D34 26 00         [ 7] 2044 	ld	h,#0x00
   7D36 DD 7E FC      [19] 2045 	ld	a,-4 (ix)
   7D39 95            [ 4] 2046 	sub	a, l
   7D3A DD 7E FD      [19] 2047 	ld	a,-3 (ix)
   7D3D 9C            [ 4] 2048 	sbc	a, h
   7D3E E2 43 7D      [10] 2049 	jp	PO, 00205$
   7D41 EE 80         [ 7] 2050 	xor	a, #0x80
   7D43                    2051 00205$:
   7D43 F2 0B 7E      [10] 2052 	jp	P,00133$
   7D46 7B            [ 4] 2053 	ld	a,e
   7D47 C6 32         [ 7] 2054 	add	a, #0x32
   7D49 5F            [ 4] 2055 	ld	e,a
   7D4A 7A            [ 4] 2056 	ld	a,d
   7D4B CE 00         [ 7] 2057 	adc	a, #0x00
   7D4D 57            [ 4] 2058 	ld	d,a
   7D4E 7D            [ 4] 2059 	ld	a,l
   7D4F 93            [ 4] 2060 	sub	a, e
   7D50 7C            [ 4] 2061 	ld	a,h
   7D51 9A            [ 4] 2062 	sbc	a, d
   7D52 E2 57 7D      [10] 2063 	jp	PO, 00206$
   7D55 EE 80         [ 7] 2064 	xor	a, #0x80
   7D57                    2065 00206$:
   7D57 F2 0B 7E      [10] 2066 	jp	P,00133$
                           2067 ;src/main.c:436: if(enemy->y > prota.y - 4 && enemy->y < prota.y + 4){
   7D5A DD 6E F8      [19] 2068 	ld	l,-8 (ix)
   7D5D DD 66 F9      [19] 2069 	ld	h,-7 (ix)
   7D60 5E            [ 7] 2070 	ld	e,(hl)
   7D61 21 D0 69      [10] 2071 	ld	hl, #(_prota + 0x0001) + 0
   7D64 6E            [ 7] 2072 	ld	l,(hl)
   7D65 26 00         [ 7] 2073 	ld	h,#0x00
   7D67 7D            [ 4] 2074 	ld	a,l
   7D68 C6 FC         [ 7] 2075 	add	a,#0xFC
   7D6A DD 77 FC      [19] 2076 	ld	-4 (ix),a
   7D6D 7C            [ 4] 2077 	ld	a,h
   7D6E CE FF         [ 7] 2078 	adc	a,#0xFF
   7D70 DD 77 FD      [19] 2079 	ld	-3 (ix),a
   7D73 16 00         [ 7] 2080 	ld	d,#0x00
   7D75 DD 7E FC      [19] 2081 	ld	a,-4 (ix)
   7D78 93            [ 4] 2082 	sub	a, e
   7D79 DD 7E FD      [19] 2083 	ld	a,-3 (ix)
   7D7C 9A            [ 4] 2084 	sbc	a, d
   7D7D E2 82 7D      [10] 2085 	jp	PO, 00207$
   7D80 EE 80         [ 7] 2086 	xor	a, #0x80
   7D82                    2087 00207$:
   7D82 F2 0B 7E      [10] 2088 	jp	P,00133$
   7D85 23            [ 6] 2089 	inc	hl
   7D86 23            [ 6] 2090 	inc	hl
   7D87 23            [ 6] 2091 	inc	hl
   7D88 23            [ 6] 2092 	inc	hl
   7D89 7B            [ 4] 2093 	ld	a,e
   7D8A 95            [ 4] 2094 	sub	a, l
   7D8B 7A            [ 4] 2095 	ld	a,d
   7D8C 9C            [ 4] 2096 	sbc	a, h
   7D8D E2 92 7D      [10] 2097 	jp	PO, 00208$
   7D90 EE 80         [ 7] 2098 	xor	a, #0x80
   7D92                    2099 00208$:
   7D92 F2 0B 7E      [10] 2100 	jp	P,00133$
                           2101 ;src/main.c:437: if(enemy->x > prota.x){
   7D95 78            [ 4] 2102 	ld	a,b
   7D96 DD 96 FE      [19] 2103 	sub	a, -2 (ix)
   7D99 3E 00         [ 7] 2104 	ld	a,#0x00
   7D9B 17            [ 4] 2105 	rla
   7D9C B7            [ 4] 2106 	or	a, a
   7D9D 28 36         [12] 2107 	jr	Z,00114$
                           2108 ;src/main.c:438: i = prota.x;
   7D9F 58            [ 4] 2109 	ld	e,b
                           2110 ;src/main.c:439: for (i; i<enemy->x && !interpone; i++){
   7DA0                    2111 00127$:
   7DA0 DD 6E FA      [19] 2112 	ld	l,-6 (ix)
   7DA3 DD 66 FB      [19] 2113 	ld	h,-5 (ix)
   7DA6 46            [ 7] 2114 	ld	b,(hl)
   7DA7 7B            [ 4] 2115 	ld	a,e
   7DA8 90            [ 4] 2116 	sub	a, b
   7DA9 30 20         [12] 2117 	jr	NC,00103$
   7DAB 79            [ 4] 2118 	ld	a,c
   7DAC B7            [ 4] 2119 	or	a, a
   7DAD 20 1C         [12] 2120 	jr	NZ,00103$
                           2121 ;src/main.c:440: if(*getTilePtr(i , prota.y) > 2){
   7DAF 21 D0 69      [10] 2122 	ld	hl, #(_prota + 0x0001) + 0
   7DB2 46            [ 7] 2123 	ld	b,(hl)
   7DB3 C5            [11] 2124 	push	bc
   7DB4 D5            [11] 2125 	push	de
   7DB5 C5            [11] 2126 	push	bc
   7DB6 33            [ 6] 2127 	inc	sp
   7DB7 7B            [ 4] 2128 	ld	a,e
   7DB8 F5            [11] 2129 	push	af
   7DB9 33            [ 6] 2130 	inc	sp
   7DBA CD 77 73      [17] 2131 	call	_getTilePtr
   7DBD F1            [10] 2132 	pop	af
   7DBE D1            [10] 2133 	pop	de
   7DBF C1            [10] 2134 	pop	bc
   7DC0 46            [ 7] 2135 	ld	b,(hl)
   7DC1 3E 02         [ 7] 2136 	ld	a,#0x02
   7DC3 90            [ 4] 2137 	sub	a, b
   7DC4 30 02         [12] 2138 	jr	NC,00128$
                           2139 ;src/main.c:441: interpone = SI;
   7DC6 0E 01         [ 7] 2140 	ld	c,#0x01
   7DC8                    2141 00128$:
                           2142 ;src/main.c:439: for (i; i<enemy->x && !interpone; i++){
   7DC8 1C            [ 4] 2143 	inc	e
   7DC9 18 D5         [12] 2144 	jr	00127$
   7DCB                    2145 00103$:
                           2146 ;src/main.c:444: if(!interpone){
   7DCB 79            [ 4] 2147 	ld	a,c
   7DCC B7            [ 4] 2148 	or	a, a
   7DCD 20 3C         [12] 2149 	jr	NZ,00133$
                           2150 ;src/main.c:445: enemy->seen = SI;
   7DCF E1            [10] 2151 	pop	hl
   7DD0 E5            [11] 2152 	push	hl
   7DD1 36 01         [10] 2153 	ld	(hl),#0x01
   7DD3 18 36         [12] 2154 	jr	00133$
   7DD5                    2155 00114$:
                           2156 ;src/main.c:447: }else if(enemy->x > prota.x){
   7DD5 B7            [ 4] 2157 	or	a, a
   7DD6 28 33         [12] 2158 	jr	Z,00133$
                           2159 ;src/main.c:448: i = enemy->x;
   7DD8 DD 46 FE      [19] 2160 	ld	b,-2 (ix)
                           2161 ;src/main.c:449: for (i; i<prota.x && !interpone; i++){
   7DDB                    2162 00131$:
   7DDB 21 CF 69      [10] 2163 	ld	hl, #_prota + 0
   7DDE 5E            [ 7] 2164 	ld	e,(hl)
   7DDF 78            [ 4] 2165 	ld	a,b
   7DE0 93            [ 4] 2166 	sub	a, e
   7DE1 30 20         [12] 2167 	jr	NC,00108$
   7DE3 79            [ 4] 2168 	ld	a,c
   7DE4 B7            [ 4] 2169 	or	a, a
   7DE5 20 1C         [12] 2170 	jr	NZ,00108$
                           2171 ;src/main.c:450: if(*getTilePtr(i, enemy->y) > 2){
   7DE7 DD 6E F8      [19] 2172 	ld	l,-8 (ix)
   7DEA DD 66 F9      [19] 2173 	ld	h,-7 (ix)
   7DED 56            [ 7] 2174 	ld	d,(hl)
   7DEE C5            [11] 2175 	push	bc
   7DEF D5            [11] 2176 	push	de
   7DF0 33            [ 6] 2177 	inc	sp
   7DF1 C5            [11] 2178 	push	bc
   7DF2 33            [ 6] 2179 	inc	sp
   7DF3 CD 77 73      [17] 2180 	call	_getTilePtr
   7DF6 F1            [10] 2181 	pop	af
   7DF7 C1            [10] 2182 	pop	bc
   7DF8 5E            [ 7] 2183 	ld	e,(hl)
   7DF9 3E 02         [ 7] 2184 	ld	a,#0x02
   7DFB 93            [ 4] 2185 	sub	a, e
   7DFC 30 02         [12] 2186 	jr	NC,00132$
                           2187 ;src/main.c:451: interpone = SI;
   7DFE 0E 01         [ 7] 2188 	ld	c,#0x01
   7E00                    2189 00132$:
                           2190 ;src/main.c:449: for (i; i<prota.x && !interpone; i++){
   7E00 04            [ 4] 2191 	inc	b
   7E01 18 D8         [12] 2192 	jr	00131$
   7E03                    2193 00108$:
                           2194 ;src/main.c:454: if(!interpone){
   7E03 79            [ 4] 2195 	ld	a,c
   7E04 B7            [ 4] 2196 	or	a, a
   7E05 20 04         [12] 2197 	jr	NZ,00133$
                           2198 ;src/main.c:455: enemy->seen = SI;
   7E07 E1            [10] 2199 	pop	hl
   7E08 E5            [11] 2200 	push	hl
   7E09 36 01         [10] 2201 	ld	(hl),#0x01
   7E0B                    2202 00133$:
   7E0B DD F9         [10] 2203 	ld	sp, ix
   7E0D DD E1         [14] 2204 	pop	ix
   7E0F C9            [10] 2205 	ret
                           2206 ;src/main.c:463: void patrol(TEnemy *enemy) {
                           2207 ;	---------------------------------
                           2208 ; Function patrol
                           2209 ; ---------------------------------
   7E10                    2210 _patrol::
                           2211 ;src/main.c:464: if (enemy->onPathPatrol) {
   7E10 D1            [10] 2212 	pop	de
   7E11 C1            [10] 2213 	pop	bc
   7E12 C5            [11] 2214 	push	bc
   7E13 D5            [11] 2215 	push	de
   7E14 C5            [11] 2216 	push	bc
   7E15 FD E1         [14] 2217 	pop	iy
   7E17 FD 7E 0C      [19] 2218 	ld	a,12 (iy)
   7E1A B7            [ 4] 2219 	or	a, a
   7E1B C8            [11] 2220 	ret	Z
                           2221 ;src/main.c:465: moverEnemigoPathfinding(enemy);
   7E1C C5            [11] 2222 	push	bc
   7E1D CD E2 7A      [17] 2223 	call	_moverEnemigoPathfinding
   7E20 F1            [10] 2224 	pop	af
   7E21 C9            [10] 2225 	ret
                           2226 ;src/main.c:469: void updateEnemies() {
                           2227 ;	---------------------------------
                           2228 ; Function updateEnemies
                           2229 ; ---------------------------------
   7E22                    2230 _updateEnemies::
   7E22 DD E5         [15] 2231 	push	ix
   7E24 DD 21 00 00   [14] 2232 	ld	ix,#0
   7E28 DD 39         [15] 2233 	add	ix,sp
   7E2A 21 F4 FF      [10] 2234 	ld	hl,#-12
   7E2D 39            [11] 2235 	add	hl,sp
   7E2E F9            [ 6] 2236 	ld	sp,hl
                           2237 ;src/main.c:471: u8 i = 1 + 1;
   7E2F DD 36 F4 02   [19] 2238 	ld	-12 (ix),#0x02
                           2239 ;src/main.c:474: actual = enemy;
                           2240 ;src/main.c:476: while (--i) {
   7E33 DD 36 FE BF   [19] 2241 	ld	-2 (ix),#<(_enemy)
   7E37 DD 36 FF 64   [19] 2242 	ld	-1 (ix),#>(_enemy)
   7E3B DD 36 F5 BF   [19] 2243 	ld	-11 (ix),#<(_enemy)
   7E3F DD 36 F6 64   [19] 2244 	ld	-10 (ix),#>(_enemy)
   7E43 DD 36 FC BF   [19] 2245 	ld	-4 (ix),#<(_enemy)
   7E47 DD 36 FD 64   [19] 2246 	ld	-3 (ix),#>(_enemy)
   7E4B DD 36 FA BF   [19] 2247 	ld	-6 (ix),#<(_enemy)
   7E4F DD 36 FB 64   [19] 2248 	ld	-5 (ix),#>(_enemy)
   7E53 DD 36 F7 BF   [19] 2249 	ld	-9 (ix),#<(_enemy)
   7E57 DD 36 F8 64   [19] 2250 	ld	-8 (ix),#>(_enemy)
   7E5B                    2251 00121$:
   7E5B DD 7E F4      [19] 2252 	ld	a,-12 (ix)
   7E5E C6 FF         [ 7] 2253 	add	a,#0xFF
   7E60 DD 77 F9      [19] 2254 	ld	-7 (ix), a
   7E63 DD 77 F4      [19] 2255 	ld	-12 (ix),a
   7E66 DD 7E F9      [19] 2256 	ld	a,-7 (ix)
   7E69 B7            [ 4] 2257 	or	a, a
   7E6A CA EB 7E      [10] 2258 	jp	Z,00124$
                           2259 ;src/main.c:477: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   7E6D 21 BF 64      [10] 2260 	ld	hl,#_enemy
   7E70 E5            [11] 2261 	push	hl
   7E71 CD 6D 7C      [17] 2262 	call	_lookFor
   7E74 F1            [10] 2263 	pop	af
                           2264 ;src/main.c:478: if (actual->patrolling) { // esta patrullando
   7E75 3A CA 64      [13] 2265 	ld	a, (#(_enemy + 0x000b) + 0)
   7E78 B7            [ 4] 2266 	or	a, a
   7E79 28 40         [12] 2267 	jr	Z,00119$
                           2268 ;src/main.c:479: if (!actual->seen) {
   7E7B DD 6E FE      [19] 2269 	ld	l,-2 (ix)
   7E7E DD 66 FF      [19] 2270 	ld	h,-1 (ix)
   7E81 11 12 00      [10] 2271 	ld	de, #0x0012
   7E84 19            [11] 2272 	add	hl, de
   7E85 4E            [ 7] 2273 	ld	c,(hl)
   7E86 79            [ 4] 2274 	ld	a,c
   7E87 B7            [ 4] 2275 	or	a, a
   7E88 20 0A         [12] 2276 	jr	NZ,00107$
                           2277 ;src/main.c:480: patrol(actual);
   7E8A 21 BF 64      [10] 2278 	ld	hl,#_enemy
   7E8D E5            [11] 2279 	push	hl
   7E8E CD 10 7E      [17] 2280 	call	_patrol
   7E91 F1            [10] 2281 	pop	af
   7E92 18 C7         [12] 2282 	jr	00121$
   7E94                    2283 00107$:
                           2284 ;src/main.c:484: actual->onPathPatrol = 0;
   7E94 11 CB 64      [10] 2285 	ld	de,#_enemy + 12
                           2286 ;src/main.c:481: } else if (actual->seen) {
   7E97 79            [ 4] 2287 	ld	a,c
   7E98 B7            [ 4] 2288 	or	a, a
   7E99 28 09         [12] 2289 	jr	Z,00104$
                           2290 ;src/main.c:483: actual->patrolling = 0;
   7E9B 21 CA 64      [10] 2291 	ld	hl,#(_enemy + 0x000b)
   7E9E 36 00         [10] 2292 	ld	(hl),#0x00
                           2293 ;src/main.c:484: actual->onPathPatrol = 0;
   7EA0 AF            [ 4] 2294 	xor	a, a
   7EA1 12            [ 7] 2295 	ld	(de),a
   7EA2 18 B7         [12] 2296 	jr	00121$
   7EA4                    2297 00104$:
                           2298 ;src/main.c:485: } else if (actual->inRange) {
   7EA4 DD 6E F5      [19] 2299 	ld	l,-11 (ix)
   7EA7 DD 66 F6      [19] 2300 	ld	h,-10 (ix)
   7EAA 01 11 00      [10] 2301 	ld	bc, #0x0011
   7EAD 09            [11] 2302 	add	hl, bc
   7EAE 7E            [ 7] 2303 	ld	a,(hl)
   7EAF B7            [ 4] 2304 	or	a, a
   7EB0 28 A9         [12] 2305 	jr	Z,00121$
                           2306 ;src/main.c:487: actual->patrolling = 0;
   7EB2 21 CA 64      [10] 2307 	ld	hl,#(_enemy + 0x000b)
   7EB5 36 00         [10] 2308 	ld	(hl),#0x00
                           2309 ;src/main.c:488: actual->onPathPatrol = 0;
   7EB7 AF            [ 4] 2310 	xor	a, a
   7EB8 12            [ 7] 2311 	ld	(de),a
   7EB9 18 A0         [12] 2312 	jr	00121$
   7EBB                    2313 00119$:
                           2314 ;src/main.c:490: } else if (actual->seek) { // esta buscando
   7EBB DD 6E FC      [19] 2315 	ld	l,-4 (ix)
   7EBE DD 66 FD      [19] 2316 	ld	h,-3 (ix)
   7EC1 11 14 00      [10] 2317 	ld	de, #0x0014
   7EC4 19            [11] 2318 	add	hl, de
   7EC5 7E            [ 7] 2319 	ld	a,(hl)
   7EC6 B7            [ 4] 2320 	or	a, a
   7EC7 28 92         [12] 2321 	jr	Z,00121$
                           2322 ;src/main.c:491: if (!actual->found && actual->seekTimer <= 5) {
   7EC9 DD 6E FA      [19] 2323 	ld	l,-6 (ix)
   7ECC DD 66 FB      [19] 2324 	ld	h,-5 (ix)
   7ECF 11 13 00      [10] 2325 	ld	de, #0x0013
   7ED2 19            [11] 2326 	add	hl, de
   7ED3 7E            [ 7] 2327 	ld	a,(hl)
   7ED4 B7            [ 4] 2328 	or	a, a
   7ED5 20 84         [12] 2329 	jr	NZ,00121$
   7ED7 DD 6E F7      [19] 2330 	ld	l,-9 (ix)
   7EDA DD 66 F8      [19] 2331 	ld	h,-8 (ix)
   7EDD 11 15 00      [10] 2332 	ld	de, #0x0015
   7EE0 19            [11] 2333 	add	hl, de
   7EE1 4E            [ 7] 2334 	ld	c,(hl)
   7EE2 3E 05         [ 7] 2335 	ld	a,#0x05
   7EE4 91            [ 4] 2336 	sub	a, c
   7EE5 3E 00         [ 7] 2337 	ld	a,#0x00
   7EE7 17            [ 4] 2338 	rla
                           2339 ;src/main.c:495: } else if (actual->engage) {
   7EE8 C3 5B 7E      [10] 2340 	jp	00121$
   7EEB                    2341 00124$:
   7EEB DD F9         [10] 2342 	ld	sp, ix
   7EED DD E1         [14] 2343 	pop	ix
   7EEF C9            [10] 2344 	ret
                           2345 ;src/main.c:504: void avanzarMapa() {
                           2346 ;	---------------------------------
                           2347 ; Function avanzarMapa
                           2348 ; ---------------------------------
   7EF0                    2349 _avanzarMapa::
                           2350 ;src/main.c:505: if(num_mapa < NUM_MAPAS -1) {
   7EF0 3A E4 69      [13] 2351 	ld	a,(#_num_mapa + 0)
   7EF3 D6 02         [ 7] 2352 	sub	a, #0x02
   7EF5 D2 2C 73      [10] 2353 	jp	NC,_menuFin
                           2354 ;src/main.c:506: mapa = mapas[++num_mapa];
   7EF8 21 E4 69      [10] 2355 	ld	hl, #_num_mapa+0
   7EFB 34            [11] 2356 	inc	(hl)
   7EFC FD 21 E4 69   [14] 2357 	ld	iy,#_num_mapa
   7F00 FD 6E 00      [19] 2358 	ld	l,0 (iy)
   7F03 26 00         [ 7] 2359 	ld	h,#0x00
   7F05 29            [11] 2360 	add	hl, hl
   7F06 11 82 72      [10] 2361 	ld	de,#_mapas
   7F09 19            [11] 2362 	add	hl,de
   7F0A 7E            [ 7] 2363 	ld	a,(hl)
   7F0B FD 21 E2 69   [14] 2364 	ld	iy,#_mapa
   7F0F FD 77 00      [19] 2365 	ld	0 (iy),a
   7F12 23            [ 6] 2366 	inc	hl
   7F13 7E            [ 7] 2367 	ld	a,(hl)
   7F14 32 E3 69      [13] 2368 	ld	(#_mapa + 1),a
                           2369 ;src/main.c:507: prota.x = prota.px = 2;
   7F17 21 D1 69      [10] 2370 	ld	hl,#(_prota + 0x0002)
   7F1A 36 02         [10] 2371 	ld	(hl),#0x02
   7F1C 21 CF 69      [10] 2372 	ld	hl,#_prota
   7F1F 36 02         [10] 2373 	ld	(hl),#0x02
                           2374 ;src/main.c:508: prota.mover = SI;
   7F21 21 D5 69      [10] 2375 	ld	hl,#(_prota + 0x0006)
   7F24 36 01         [10] 2376 	ld	(hl),#0x01
                           2377 ;src/main.c:509: dibujarMapa();
   7F26 CD 6C 72      [17] 2378 	call	_dibujarMapa
                           2379 ;src/main.c:510: inicializarEnemy();
   7F29 C3 10 85      [10] 2380 	jp  _inicializarEnemy
                           2381 ;src/main.c:514: menuFin();
   7F2C C3 2C 73      [10] 2382 	jp  _menuFin
                           2383 ;src/main.c:518: void moverIzquierda() {
                           2384 ;	---------------------------------
                           2385 ; Function moverIzquierda
                           2386 ; ---------------------------------
   7F2F                    2387 _moverIzquierda::
                           2388 ;src/main.c:519: prota.mira = M_izquierda;
   7F2F 01 CF 69      [10] 2389 	ld	bc,#_prota+0
   7F32 21 D6 69      [10] 2390 	ld	hl,#(_prota + 0x0007)
   7F35 36 01         [10] 2391 	ld	(hl),#0x01
                           2392 ;src/main.c:520: if (!checkCollision(M_izquierda)) {
   7F37 C5            [11] 2393 	push	bc
   7F38 21 01 00      [10] 2394 	ld	hl,#0x0001
   7F3B E5            [11] 2395 	push	hl
   7F3C CD B8 73      [17] 2396 	call	_checkCollision
   7F3F F1            [10] 2397 	pop	af
   7F40 C1            [10] 2398 	pop	bc
   7F41 7D            [ 4] 2399 	ld	a,l
   7F42 B7            [ 4] 2400 	or	a, a
   7F43 C0            [11] 2401 	ret	NZ
                           2402 ;src/main.c:521: prota.x--;
   7F44 0A            [ 7] 2403 	ld	a,(bc)
   7F45 C6 FF         [ 7] 2404 	add	a,#0xFF
   7F47 02            [ 7] 2405 	ld	(bc),a
                           2406 ;src/main.c:522: prota.mover = SI;
   7F48 21 D5 69      [10] 2407 	ld	hl,#(_prota + 0x0006)
   7F4B 36 01         [10] 2408 	ld	(hl),#0x01
                           2409 ;src/main.c:523: prota.sprite = g_hero_left;
   7F4D 21 FE 49      [10] 2410 	ld	hl,#_g_hero_left
   7F50 22 D3 69      [16] 2411 	ld	((_prota + 0x0004)), hl
   7F53 C9            [10] 2412 	ret
                           2413 ;src/main.c:527: void moverDerecha() {
                           2414 ;	---------------------------------
                           2415 ; Function moverDerecha
                           2416 ; ---------------------------------
   7F54                    2417 _moverDerecha::
                           2418 ;src/main.c:528: prota.mira = M_derecha;
   7F54 21 D6 69      [10] 2419 	ld	hl,#(_prota + 0x0007)
   7F57 36 00         [10] 2420 	ld	(hl),#0x00
                           2421 ;src/main.c:529: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7F59 21 00 00      [10] 2422 	ld	hl,#0x0000
   7F5C E5            [11] 2423 	push	hl
   7F5D CD B8 73      [17] 2424 	call	_checkCollision
   7F60 F1            [10] 2425 	pop	af
   7F61 45            [ 4] 2426 	ld	b,l
   7F62 21 CF 69      [10] 2427 	ld	hl, #_prota + 0
   7F65 4E            [ 7] 2428 	ld	c,(hl)
   7F66 59            [ 4] 2429 	ld	e,c
   7F67 16 00         [ 7] 2430 	ld	d,#0x00
   7F69 21 07 00      [10] 2431 	ld	hl,#0x0007
   7F6C 19            [11] 2432 	add	hl,de
   7F6D 11 50 80      [10] 2433 	ld	de, #0x8050
   7F70 29            [11] 2434 	add	hl, hl
   7F71 3F            [ 4] 2435 	ccf
   7F72 CB 1C         [ 8] 2436 	rr	h
   7F74 CB 1D         [ 8] 2437 	rr	l
   7F76 ED 52         [15] 2438 	sbc	hl, de
   7F78 3E 00         [ 7] 2439 	ld	a,#0x00
   7F7A 17            [ 4] 2440 	rla
   7F7B 5F            [ 4] 2441 	ld	e,a
   7F7C 78            [ 4] 2442 	ld	a,b
   7F7D B7            [ 4] 2443 	or	a,a
   7F7E 20 14         [12] 2444 	jr	NZ,00104$
   7F80 B3            [ 4] 2445 	or	a,e
   7F81 28 11         [12] 2446 	jr	Z,00104$
                           2447 ;src/main.c:530: prota.x++;
   7F83 0C            [ 4] 2448 	inc	c
   7F84 21 CF 69      [10] 2449 	ld	hl,#_prota
   7F87 71            [ 7] 2450 	ld	(hl),c
                           2451 ;src/main.c:531: prota.mover = SI;
   7F88 21 D5 69      [10] 2452 	ld	hl,#(_prota + 0x0006)
   7F8B 36 01         [10] 2453 	ld	(hl),#0x01
                           2454 ;src/main.c:532: prota.sprite = g_hero;
   7F8D 21 A8 4A      [10] 2455 	ld	hl,#_g_hero
   7F90 22 D3 69      [16] 2456 	ld	((_prota + 0x0004)), hl
   7F93 C9            [10] 2457 	ret
   7F94                    2458 00104$:
                           2459 ;src/main.c:534: }else if( prota.x + G_HERO_W >= 80){
   7F94 7B            [ 4] 2460 	ld	a,e
   7F95 B7            [ 4] 2461 	or	a, a
   7F96 C0            [11] 2462 	ret	NZ
                           2463 ;src/main.c:535: avanzarMapa();
   7F97 C3 F0 7E      [10] 2464 	jp  _avanzarMapa
                           2465 ;src/main.c:539: void moverArriba() {
                           2466 ;	---------------------------------
                           2467 ; Function moverArriba
                           2468 ; ---------------------------------
   7F9A                    2469 _moverArriba::
                           2470 ;src/main.c:540: prota.mira = M_arriba;
   7F9A 21 D6 69      [10] 2471 	ld	hl,#(_prota + 0x0007)
   7F9D 36 02         [10] 2472 	ld	(hl),#0x02
                           2473 ;src/main.c:541: if (!checkCollision(M_arriba)) { // TODO: COMPROBAR
   7F9F 21 02 00      [10] 2474 	ld	hl,#0x0002
   7FA2 E5            [11] 2475 	push	hl
   7FA3 CD B8 73      [17] 2476 	call	_checkCollision
   7FA6 F1            [10] 2477 	pop	af
   7FA7 7D            [ 4] 2478 	ld	a,l
   7FA8 B7            [ 4] 2479 	or	a, a
   7FA9 C0            [11] 2480 	ret	NZ
                           2481 ;src/main.c:542: prota.y--;
   7FAA 21 D0 69      [10] 2482 	ld	hl,#_prota + 1
   7FAD 4E            [ 7] 2483 	ld	c,(hl)
   7FAE 0D            [ 4] 2484 	dec	c
   7FAF 71            [ 7] 2485 	ld	(hl),c
                           2486 ;src/main.c:543: prota.y--;
   7FB0 0D            [ 4] 2487 	dec	c
   7FB1 71            [ 7] 2488 	ld	(hl),c
                           2489 ;src/main.c:544: prota.mover  = SI;
   7FB2 21 D5 69      [10] 2490 	ld	hl,#(_prota + 0x0006)
   7FB5 36 01         [10] 2491 	ld	(hl),#0x01
                           2492 ;src/main.c:545: prota.sprite = g_hero_up;
   7FB7 21 64 49      [10] 2493 	ld	hl,#_g_hero_up
   7FBA 22 D3 69      [16] 2494 	ld	((_prota + 0x0004)), hl
   7FBD C9            [10] 2495 	ret
                           2496 ;src/main.c:549: void moverAbajo() {
                           2497 ;	---------------------------------
                           2498 ; Function moverAbajo
                           2499 ; ---------------------------------
   7FBE                    2500 _moverAbajo::
                           2501 ;src/main.c:550: prota.mira = M_abajo;
   7FBE 21 D6 69      [10] 2502 	ld	hl,#(_prota + 0x0007)
   7FC1 36 03         [10] 2503 	ld	(hl),#0x03
                           2504 ;src/main.c:551: if (!checkCollision(M_abajo) ) { // TODO: COMPROBAR
   7FC3 21 03 00      [10] 2505 	ld	hl,#0x0003
   7FC6 E5            [11] 2506 	push	hl
   7FC7 CD B8 73      [17] 2507 	call	_checkCollision
   7FCA F1            [10] 2508 	pop	af
   7FCB 7D            [ 4] 2509 	ld	a,l
   7FCC B7            [ 4] 2510 	or	a, a
   7FCD C0            [11] 2511 	ret	NZ
                           2512 ;src/main.c:552: prota.y++;
   7FCE 01 D0 69      [10] 2513 	ld	bc,#_prota + 1
   7FD1 0A            [ 7] 2514 	ld	a,(bc)
   7FD2 3C            [ 4] 2515 	inc	a
   7FD3 02            [ 7] 2516 	ld	(bc),a
                           2517 ;src/main.c:553: prota.y++;
   7FD4 3C            [ 4] 2518 	inc	a
   7FD5 02            [ 7] 2519 	ld	(bc),a
                           2520 ;src/main.c:554: prota.mover  = SI;
   7FD6 21 D5 69      [10] 2521 	ld	hl,#(_prota + 0x0006)
   7FD9 36 01         [10] 2522 	ld	(hl),#0x01
                           2523 ;src/main.c:555: prota.sprite = g_hero_down;
   7FDB 21 CA 48      [10] 2524 	ld	hl,#_g_hero_down
   7FDE 22 D3 69      [16] 2525 	ld	((_prota + 0x0004)), hl
   7FE1 C9            [10] 2526 	ret
                           2527 ;src/main.c:559: void dibujarCuchillo() {
                           2528 ;	---------------------------------
                           2529 ; Function dibujarCuchillo
                           2530 ; ---------------------------------
   7FE2                    2531 _dibujarCuchillo::
   7FE2 DD E5         [15] 2532 	push	ix
   7FE4 DD 21 00 00   [14] 2533 	ld	ix,#0
   7FE8 DD 39         [15] 2534 	add	ix,sp
   7FEA F5            [11] 2535 	push	af
                           2536 ;src/main.c:560: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   7FEB 21 D8 69      [10] 2537 	ld	hl, #_cu + 1
   7FEE 56            [ 7] 2538 	ld	d,(hl)
   7FEF 21 D7 69      [10] 2539 	ld	hl, #_cu + 0
   7FF2 46            [ 7] 2540 	ld	b,(hl)
   7FF3 D5            [11] 2541 	push	de
   7FF4 33            [ 6] 2542 	inc	sp
   7FF5 C5            [11] 2543 	push	bc
   7FF6 33            [ 6] 2544 	inc	sp
   7FF7 21 00 C0      [10] 2545 	ld	hl,#0xC000
   7FFA E5            [11] 2546 	push	hl
   7FFB CD 62 64      [17] 2547 	call	_cpct_getScreenPtr
   7FFE 45            [ 4] 2548 	ld	b,l
   7FFF 5C            [ 4] 2549 	ld	e,h
                           2550 ;src/main.c:561: if(cu.eje == E_X){
   8000 21 DF 69      [10] 2551 	ld	hl, #_cu + 8
   8003 4E            [ 7] 2552 	ld	c,(hl)
                           2553 ;src/main.c:562: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   8004 DD 70 FE      [19] 2554 	ld	-2 (ix),b
   8007 DD 73 FF      [19] 2555 	ld	-1 (ix),e
                           2556 ;src/main.c:561: if(cu.eje == E_X){
   800A 79            [ 4] 2557 	ld	a,c
   800B B7            [ 4] 2558 	or	a, a
   800C 20 19         [12] 2559 	jr	NZ,00104$
                           2560 ;src/main.c:562: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   800E 11 00 0E      [10] 2561 	ld	de,#_g_tablatrans+0
   8011 ED 4B DB 69   [20] 2562 	ld	bc, (#(_cu + 0x0004) + 0)
   8015 D5            [11] 2563 	push	de
   8016 21 04 04      [10] 2564 	ld	hl,#0x0404
   8019 E5            [11] 2565 	push	hl
   801A DD 6E FE      [19] 2566 	ld	l,-2 (ix)
   801D DD 66 FF      [19] 2567 	ld	h,-1 (ix)
   8020 E5            [11] 2568 	push	hl
   8021 C5            [11] 2569 	push	bc
   8022 CD 82 64      [17] 2570 	call	_cpct_drawSpriteMaskedAlignedTable
   8025 18 1A         [12] 2571 	jr	00106$
   8027                    2572 00104$:
                           2573 ;src/main.c:565: else if(cu.eje == E_Y){
   8027 0D            [ 4] 2574 	dec	c
   8028 20 17         [12] 2575 	jr	NZ,00106$
                           2576 ;src/main.c:566: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   802A 11 00 0E      [10] 2577 	ld	de,#_g_tablatrans+0
   802D ED 4B DB 69   [20] 2578 	ld	bc, (#(_cu + 0x0004) + 0)
   8031 D5            [11] 2579 	push	de
   8032 21 02 08      [10] 2580 	ld	hl,#0x0802
   8035 E5            [11] 2581 	push	hl
   8036 DD 6E FE      [19] 2582 	ld	l,-2 (ix)
   8039 DD 66 FF      [19] 2583 	ld	h,-1 (ix)
   803C E5            [11] 2584 	push	hl
   803D C5            [11] 2585 	push	bc
   803E CD 82 64      [17] 2586 	call	_cpct_drawSpriteMaskedAlignedTable
   8041                    2587 00106$:
   8041 DD F9         [10] 2588 	ld	sp, ix
   8043 DD E1         [14] 2589 	pop	ix
   8045 C9            [10] 2590 	ret
                           2591 ;src/main.c:570: void borrarCuchillo() {
                           2592 ;	---------------------------------
                           2593 ; Function borrarCuchillo
                           2594 ; ---------------------------------
   8046                    2595 _borrarCuchillo::
   8046 DD E5         [15] 2596 	push	ix
   8048 DD 21 00 00   [14] 2597 	ld	ix,#0
   804C DD 39         [15] 2598 	add	ix,sp
   804E F5            [11] 2599 	push	af
   804F 3B            [ 6] 2600 	dec	sp
                           2601 ;src/main.c:572: u8 w = 2 + (cu.px & 1);
   8050 21 D9 69      [10] 2602 	ld	hl, #_cu + 2
   8053 4E            [ 7] 2603 	ld	c,(hl)
   8054 79            [ 4] 2604 	ld	a,c
   8055 E6 01         [ 7] 2605 	and	a, #0x01
   8057 47            [ 4] 2606 	ld	b,a
   8058 04            [ 4] 2607 	inc	b
   8059 04            [ 4] 2608 	inc	b
                           2609 ;src/main.c:573: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   805A 21 DA 69      [10] 2610 	ld	hl, #_cu + 3
   805D 5E            [ 7] 2611 	ld	e,(hl)
   805E 7B            [ 4] 2612 	ld	a,e
   805F E6 03         [ 7] 2613 	and	a, #0x03
   8061 28 04         [12] 2614 	jr	Z,00105$
   8063 3E 01         [ 7] 2615 	ld	a,#0x01
   8065 18 02         [12] 2616 	jr	00106$
   8067                    2617 00105$:
   8067 3E 00         [ 7] 2618 	ld	a,#0x00
   8069                    2619 00106$:
   8069 C6 02         [ 7] 2620 	add	a, #0x02
   806B DD 77 FD      [19] 2621 	ld	-3 (ix),a
                           2622 ;src/main.c:574: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   806E FD 2A E2 69   [20] 2623 	ld	iy,(_mapa)
   8072 16 00         [ 7] 2624 	ld	d,#0x00
   8074 7B            [ 4] 2625 	ld	a,e
   8075 C6 E8         [ 7] 2626 	add	a,#0xE8
   8077 DD 77 FE      [19] 2627 	ld	-2 (ix),a
   807A 7A            [ 4] 2628 	ld	a,d
   807B CE FF         [ 7] 2629 	adc	a,#0xFF
   807D DD 77 FF      [19] 2630 	ld	-1 (ix),a
   8080 DD 6E FE      [19] 2631 	ld	l,-2 (ix)
   8083 DD 66 FF      [19] 2632 	ld	h,-1 (ix)
   8086 DD CB FF 7E   [20] 2633 	bit	7, -1 (ix)
   808A 28 04         [12] 2634 	jr	Z,00107$
   808C 21 EB FF      [10] 2635 	ld	hl,#0xFFEB
   808F 19            [11] 2636 	add	hl,de
   8090                    2637 00107$:
   8090 CB 2C         [ 8] 2638 	sra	h
   8092 CB 1D         [ 8] 2639 	rr	l
   8094 CB 2C         [ 8] 2640 	sra	h
   8096 CB 1D         [ 8] 2641 	rr	l
   8098 55            [ 4] 2642 	ld	d,l
   8099 CB 39         [ 8] 2643 	srl	c
   809B FD E5         [15] 2644 	push	iy
   809D 21 F0 C0      [10] 2645 	ld	hl,#0xC0F0
   80A0 E5            [11] 2646 	push	hl
   80A1 3E 28         [ 7] 2647 	ld	a,#0x28
   80A3 F5            [11] 2648 	push	af
   80A4 33            [ 6] 2649 	inc	sp
   80A5 DD 7E FD      [19] 2650 	ld	a,-3 (ix)
   80A8 F5            [11] 2651 	push	af
   80A9 33            [ 6] 2652 	inc	sp
   80AA C5            [11] 2653 	push	bc
   80AB 33            [ 6] 2654 	inc	sp
   80AC D5            [11] 2655 	push	de
   80AD 33            [ 6] 2656 	inc	sp
   80AE 79            [ 4] 2657 	ld	a,c
   80AF F5            [11] 2658 	push	af
   80B0 33            [ 6] 2659 	inc	sp
   80B1 CD 5B 59      [17] 2660 	call	_cpct_etm_drawTileBox2x4
                           2661 ;src/main.c:575: if(!cu.mover){
   80B4 3A E0 69      [13] 2662 	ld	a, (#_cu + 9)
   80B7 B7            [ 4] 2663 	or	a, a
   80B8 20 05         [12] 2664 	jr	NZ,00103$
                           2665 ;src/main.c:576: cu.lanzado = NO;
   80BA 21 DD 69      [10] 2666 	ld	hl,#(_cu + 0x0006)
   80BD 36 00         [10] 2667 	ld	(hl),#0x00
   80BF                    2668 00103$:
   80BF DD F9         [10] 2669 	ld	sp, ix
   80C1 DD E1         [14] 2670 	pop	ix
   80C3 C9            [10] 2671 	ret
                           2672 ;src/main.c:580: void redibujarCuchillo( ) {
                           2673 ;	---------------------------------
                           2674 ; Function redibujarCuchillo
                           2675 ; ---------------------------------
   80C4                    2676 _redibujarCuchillo::
                           2677 ;src/main.c:581: borrarCuchillo();
   80C4 CD 46 80      [17] 2678 	call	_borrarCuchillo
                           2679 ;src/main.c:582: cu.px = cu.x;
   80C7 01 D9 69      [10] 2680 	ld	bc,#_cu + 2
   80CA 3A D7 69      [13] 2681 	ld	a, (#_cu + 0)
   80CD 02            [ 7] 2682 	ld	(bc),a
                           2683 ;src/main.c:583: cu.py = cu.y;
   80CE 01 DA 69      [10] 2684 	ld	bc,#_cu + 3
   80D1 3A D8 69      [13] 2685 	ld	a, (#_cu + 1)
   80D4 02            [ 7] 2686 	ld	(bc),a
                           2687 ;src/main.c:584: dibujarCuchillo();
   80D5 C3 E2 7F      [10] 2688 	jp  _dibujarCuchillo
                           2689 ;src/main.c:587: void lanzarCuchillo(){
                           2690 ;	---------------------------------
                           2691 ; Function lanzarCuchillo
                           2692 ; ---------------------------------
   80D8                    2693 _lanzarCuchillo::
                           2694 ;src/main.c:589: if(!cu.lanzado){
   80D8 3A DD 69      [13] 2695 	ld	a, (#(_cu + 0x0006) + 0)
   80DB B7            [ 4] 2696 	or	a, a
   80DC C0            [11] 2697 	ret	NZ
                           2698 ;src/main.c:591: if(prota.mira == M_derecha){
   80DD 21 D6 69      [10] 2699 	ld	hl, #_prota + 7
   80E0 5E            [ 7] 2700 	ld	e,(hl)
                           2701 ;src/main.c:592: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   80E1 01 D0 69      [10] 2702 	ld	bc,#_prota + 1
                           2703 ;src/main.c:594: cu.direccion = M_derecha;
                           2704 ;src/main.c:596: cu.y=prota.y + G_HERO_H /2;
                           2705 ;src/main.c:597: cu.sprite=g_knifeX_0;
                           2706 ;src/main.c:598: cu.eje = E_X;
                           2707 ;src/main.c:591: if(prota.mira == M_derecha){
   80E4 7B            [ 4] 2708 	ld	a,e
   80E5 B7            [ 4] 2709 	or	a, a
   80E6 20 41         [12] 2710 	jr	NZ,00118$
                           2711 ;src/main.c:592: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   80E8 0A            [ 7] 2712 	ld	a,(bc)
   80E9 C6 0B         [ 7] 2713 	add	a, #0x0B
   80EB 5F            [ 4] 2714 	ld	e,a
   80EC 3A CF 69      [13] 2715 	ld	a, (#_prota + 0)
   80EF C6 0C         [ 7] 2716 	add	a, #0x0C
   80F1 6F            [ 4] 2717 	ld	l,a
   80F2 C5            [11] 2718 	push	bc
   80F3 7B            [ 4] 2719 	ld	a,e
   80F4 F5            [11] 2720 	push	af
   80F5 33            [ 6] 2721 	inc	sp
   80F6 7D            [ 4] 2722 	ld	a,l
   80F7 F5            [11] 2723 	push	af
   80F8 33            [ 6] 2724 	inc	sp
   80F9 CD 77 73      [17] 2725 	call	_getTilePtr
   80FC F1            [10] 2726 	pop	af
   80FD C1            [10] 2727 	pop	bc
   80FE 5E            [ 7] 2728 	ld	e,(hl)
   80FF 3E 02         [ 7] 2729 	ld	a,#0x02
   8101 93            [ 4] 2730 	sub	a, e
   8102 D8            [11] 2731 	ret	C
                           2732 ;src/main.c:593: cu.lanzado = SI;
   8103 21 DD 69      [10] 2733 	ld	hl,#(_cu + 0x0006)
   8106 36 01         [10] 2734 	ld	(hl),#0x01
                           2735 ;src/main.c:594: cu.direccion = M_derecha;
   8108 21 DE 69      [10] 2736 	ld	hl,#(_cu + 0x0007)
   810B 36 00         [10] 2737 	ld	(hl),#0x00
                           2738 ;src/main.c:595: cu.x=prota.x + G_HERO_W;
   810D 3A CF 69      [13] 2739 	ld	a, (#_prota + 0)
   8110 C6 07         [ 7] 2740 	add	a, #0x07
   8112 32 D7 69      [13] 2741 	ld	(#_cu),a
                           2742 ;src/main.c:596: cu.y=prota.y + G_HERO_H /2;
   8115 0A            [ 7] 2743 	ld	a,(bc)
   8116 C6 0B         [ 7] 2744 	add	a, #0x0B
   8118 32 D8 69      [13] 2745 	ld	(#(_cu + 0x0001)),a
                           2746 ;src/main.c:597: cu.sprite=g_knifeX_0;
   811B 21 C0 24      [10] 2747 	ld	hl,#_g_knifeX_0
   811E 22 DB 69      [16] 2748 	ld	((_cu + 0x0004)), hl
                           2749 ;src/main.c:598: cu.eje = E_X;
   8121 21 DF 69      [10] 2750 	ld	hl,#(_cu + 0x0008)
   8124 36 00         [10] 2751 	ld	(hl),#0x00
                           2752 ;src/main.c:599: dibujarCuchillo();
   8126 C3 E2 7F      [10] 2753 	jp  _dibujarCuchillo
   8129                    2754 00118$:
                           2755 ;src/main.c:602: else if(prota.mira == M_izquierda){
   8129 7B            [ 4] 2756 	ld	a,e
   812A 3D            [ 4] 2757 	dec	a
   812B 20 41         [12] 2758 	jr	NZ,00115$
                           2759 ;src/main.c:603: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   812D 0A            [ 7] 2760 	ld	a,(bc)
   812E C6 0B         [ 7] 2761 	add	a, #0x0B
   8130 5F            [ 4] 2762 	ld	e,a
   8131 3A CF 69      [13] 2763 	ld	a, (#_prota + 0)
   8134 C6 F6         [ 7] 2764 	add	a,#0xF6
   8136 6F            [ 4] 2765 	ld	l,a
   8137 C5            [11] 2766 	push	bc
   8138 7B            [ 4] 2767 	ld	a,e
   8139 F5            [11] 2768 	push	af
   813A 33            [ 6] 2769 	inc	sp
   813B 7D            [ 4] 2770 	ld	a,l
   813C F5            [11] 2771 	push	af
   813D 33            [ 6] 2772 	inc	sp
   813E CD 77 73      [17] 2773 	call	_getTilePtr
   8141 F1            [10] 2774 	pop	af
   8142 C1            [10] 2775 	pop	bc
   8143 5E            [ 7] 2776 	ld	e,(hl)
   8144 3E 02         [ 7] 2777 	ld	a,#0x02
   8146 93            [ 4] 2778 	sub	a, e
   8147 D8            [11] 2779 	ret	C
                           2780 ;src/main.c:604: cu.lanzado = SI;
   8148 21 DD 69      [10] 2781 	ld	hl,#(_cu + 0x0006)
   814B 36 01         [10] 2782 	ld	(hl),#0x01
                           2783 ;src/main.c:605: cu.direccion = M_izquierda;
   814D 21 DE 69      [10] 2784 	ld	hl,#(_cu + 0x0007)
   8150 36 01         [10] 2785 	ld	(hl),#0x01
                           2786 ;src/main.c:606: cu.x = prota.x - G_KNIFEX_0_W;
   8152 3A CF 69      [13] 2787 	ld	a, (#_prota + 0)
   8155 C6 FC         [ 7] 2788 	add	a,#0xFC
   8157 32 D7 69      [13] 2789 	ld	(#_cu),a
                           2790 ;src/main.c:607: cu.y = prota.y + G_HERO_H /2;
   815A 0A            [ 7] 2791 	ld	a,(bc)
   815B C6 0B         [ 7] 2792 	add	a, #0x0B
   815D 32 D8 69      [13] 2793 	ld	(#(_cu + 0x0001)),a
                           2794 ;src/main.c:608: cu.sprite = g_knifeX_1;
   8160 21 D0 24      [10] 2795 	ld	hl,#_g_knifeX_1
   8163 22 DB 69      [16] 2796 	ld	((_cu + 0x0004)), hl
                           2797 ;src/main.c:609: cu.eje = E_X;
   8166 21 DF 69      [10] 2798 	ld	hl,#(_cu + 0x0008)
   8169 36 00         [10] 2799 	ld	(hl),#0x00
                           2800 ;src/main.c:610: dibujarCuchillo();
   816B C3 E2 7F      [10] 2801 	jp  _dibujarCuchillo
   816E                    2802 00115$:
                           2803 ;src/main.c:613: else if(prota.mira == M_abajo){
   816E 7B            [ 4] 2804 	ld	a,e
   816F D6 03         [ 7] 2805 	sub	a, #0x03
   8171 20 41         [12] 2806 	jr	NZ,00112$
                           2807 ;src/main.c:615: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   8173 0A            [ 7] 2808 	ld	a,(bc)
   8174 C6 1F         [ 7] 2809 	add	a, #0x1F
   8176 5F            [ 4] 2810 	ld	e,a
   8177 3A CF 69      [13] 2811 	ld	a, (#_prota + 0)
   817A 57            [ 4] 2812 	ld	d,a
   817B 14            [ 4] 2813 	inc	d
   817C 14            [ 4] 2814 	inc	d
   817D 14            [ 4] 2815 	inc	d
   817E C5            [11] 2816 	push	bc
   817F 7B            [ 4] 2817 	ld	a,e
   8180 F5            [11] 2818 	push	af
   8181 33            [ 6] 2819 	inc	sp
   8182 D5            [11] 2820 	push	de
   8183 33            [ 6] 2821 	inc	sp
   8184 CD 77 73      [17] 2822 	call	_getTilePtr
   8187 F1            [10] 2823 	pop	af
   8188 C1            [10] 2824 	pop	bc
   8189 5E            [ 7] 2825 	ld	e,(hl)
   818A 3E 02         [ 7] 2826 	ld	a,#0x02
   818C 93            [ 4] 2827 	sub	a, e
   818D D8            [11] 2828 	ret	C
                           2829 ;src/main.c:616: cu.lanzado = SI;
   818E 21 DD 69      [10] 2830 	ld	hl,#(_cu + 0x0006)
   8191 36 01         [10] 2831 	ld	(hl),#0x01
                           2832 ;src/main.c:617: cu.direccion = M_abajo;
   8193 21 DE 69      [10] 2833 	ld	hl,#(_cu + 0x0007)
   8196 36 03         [10] 2834 	ld	(hl),#0x03
                           2835 ;src/main.c:618: cu.x = prota.x + G_HERO_W / 2;
   8198 3A CF 69      [13] 2836 	ld	a, (#_prota + 0)
   819B C6 03         [ 7] 2837 	add	a, #0x03
   819D 32 D7 69      [13] 2838 	ld	(#_cu),a
                           2839 ;src/main.c:619: cu.y = prota.y + G_HERO_H;
   81A0 0A            [ 7] 2840 	ld	a,(bc)
   81A1 C6 16         [ 7] 2841 	add	a, #0x16
   81A3 32 D8 69      [13] 2842 	ld	(#(_cu + 0x0001)),a
                           2843 ;src/main.c:620: cu.sprite = g_knifeY_0;
   81A6 21 A0 24      [10] 2844 	ld	hl,#_g_knifeY_0
   81A9 22 DB 69      [16] 2845 	ld	((_cu + 0x0004)), hl
                           2846 ;src/main.c:621: cu.eje = E_Y;
   81AC 21 DF 69      [10] 2847 	ld	hl,#(_cu + 0x0008)
   81AF 36 01         [10] 2848 	ld	(hl),#0x01
                           2849 ;src/main.c:622: dibujarCuchillo();
   81B1 C3 E2 7F      [10] 2850 	jp  _dibujarCuchillo
   81B4                    2851 00112$:
                           2852 ;src/main.c:625: else if(prota.mira == M_arriba){
   81B4 7B            [ 4] 2853 	ld	a,e
   81B5 D6 02         [ 7] 2854 	sub	a, #0x02
   81B7 C0            [11] 2855 	ret	NZ
                           2856 ;src/main.c:626: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   81B8 0A            [ 7] 2857 	ld	a,(bc)
   81B9 C6 F7         [ 7] 2858 	add	a,#0xF7
   81BB 57            [ 4] 2859 	ld	d,a
   81BC 3A CF 69      [13] 2860 	ld	a, (#_prota + 0)
   81BF C6 03         [ 7] 2861 	add	a, #0x03
   81C1 C5            [11] 2862 	push	bc
   81C2 D5            [11] 2863 	push	de
   81C3 33            [ 6] 2864 	inc	sp
   81C4 F5            [11] 2865 	push	af
   81C5 33            [ 6] 2866 	inc	sp
   81C6 CD 77 73      [17] 2867 	call	_getTilePtr
   81C9 F1            [10] 2868 	pop	af
   81CA C1            [10] 2869 	pop	bc
   81CB 5E            [ 7] 2870 	ld	e,(hl)
   81CC 3E 02         [ 7] 2871 	ld	a,#0x02
   81CE 93            [ 4] 2872 	sub	a, e
   81CF D8            [11] 2873 	ret	C
                           2874 ;src/main.c:627: cu.lanzado = SI;
   81D0 21 DD 69      [10] 2875 	ld	hl,#(_cu + 0x0006)
   81D3 36 01         [10] 2876 	ld	(hl),#0x01
                           2877 ;src/main.c:628: cu.direccion = M_arriba;
   81D5 21 DE 69      [10] 2878 	ld	hl,#(_cu + 0x0007)
   81D8 36 02         [10] 2879 	ld	(hl),#0x02
                           2880 ;src/main.c:629: cu.x = prota.x + G_HERO_W / 2;
   81DA 3A CF 69      [13] 2881 	ld	a, (#_prota + 0)
   81DD C6 03         [ 7] 2882 	add	a, #0x03
   81DF 32 D7 69      [13] 2883 	ld	(#_cu),a
                           2884 ;src/main.c:630: cu.y = prota.y;
   81E2 0A            [ 7] 2885 	ld	a,(bc)
   81E3 32 D8 69      [13] 2886 	ld	(#(_cu + 0x0001)),a
                           2887 ;src/main.c:631: cu.sprite = g_knifeY_1;
   81E6 21 B0 24      [10] 2888 	ld	hl,#_g_knifeY_1
   81E9 22 DB 69      [16] 2889 	ld	((_cu + 0x0004)), hl
                           2890 ;src/main.c:632: cu.eje = E_Y;
   81EC 21 DF 69      [10] 2891 	ld	hl,#(_cu + 0x0008)
   81EF 36 01         [10] 2892 	ld	(hl),#0x01
                           2893 ;src/main.c:633: dibujarCuchillo();
   81F1 C3 E2 7F      [10] 2894 	jp  _dibujarCuchillo
                           2895 ;src/main.c:639: void comprobarTeclado() {
                           2896 ;	---------------------------------
                           2897 ; Function comprobarTeclado
                           2898 ; ---------------------------------
   81F4                    2899 _comprobarTeclado::
                           2900 ;src/main.c:640: cpct_scanKeyboard_if();
   81F4 CD B3 5A      [17] 2901 	call	_cpct_scanKeyboard_if
                           2902 ;src/main.c:642: if (cpct_isAnyKeyPressed()) {
   81F7 CD A6 5A      [17] 2903 	call	_cpct_isAnyKeyPressed
   81FA 7D            [ 4] 2904 	ld	a,l
   81FB B7            [ 4] 2905 	or	a, a
   81FC C8            [11] 2906 	ret	Z
                           2907 ;src/main.c:643: if (cpct_isKeyPressed(Key_CursorLeft))
   81FD 21 01 01      [10] 2908 	ld	hl,#0x0101
   8200 CD 10 58      [17] 2909 	call	_cpct_isKeyPressed
   8203 7D            [ 4] 2910 	ld	a,l
   8204 B7            [ 4] 2911 	or	a, a
                           2912 ;src/main.c:644: moverIzquierda();
   8205 C2 2F 7F      [10] 2913 	jp	NZ,_moverIzquierda
                           2914 ;src/main.c:645: else if (cpct_isKeyPressed(Key_CursorRight))
   8208 21 00 02      [10] 2915 	ld	hl,#0x0200
   820B CD 10 58      [17] 2916 	call	_cpct_isKeyPressed
   820E 7D            [ 4] 2917 	ld	a,l
   820F B7            [ 4] 2918 	or	a, a
                           2919 ;src/main.c:646: moverDerecha();
   8210 C2 54 7F      [10] 2920 	jp	NZ,_moverDerecha
                           2921 ;src/main.c:647: else if (cpct_isKeyPressed(Key_CursorUp))
   8213 21 00 01      [10] 2922 	ld	hl,#0x0100
   8216 CD 10 58      [17] 2923 	call	_cpct_isKeyPressed
   8219 7D            [ 4] 2924 	ld	a,l
   821A B7            [ 4] 2925 	or	a, a
                           2926 ;src/main.c:648: moverArriba();
   821B C2 9A 7F      [10] 2927 	jp	NZ,_moverArriba
                           2928 ;src/main.c:649: else if (cpct_isKeyPressed(Key_CursorDown))
   821E 21 00 04      [10] 2929 	ld	hl,#0x0400
   8221 CD 10 58      [17] 2930 	call	_cpct_isKeyPressed
   8224 7D            [ 4] 2931 	ld	a,l
   8225 B7            [ 4] 2932 	or	a, a
                           2933 ;src/main.c:650: moverAbajo();
   8226 C2 BE 7F      [10] 2934 	jp	NZ,_moverAbajo
                           2935 ;src/main.c:651: else if (cpct_isKeyPressed(Key_Space))
   8229 21 05 80      [10] 2936 	ld	hl,#0x8005
   822C CD 10 58      [17] 2937 	call	_cpct_isKeyPressed
   822F 7D            [ 4] 2938 	ld	a,l
   8230 B7            [ 4] 2939 	or	a, a
   8231 C8            [11] 2940 	ret	Z
                           2941 ;src/main.c:652: lanzarCuchillo();
   8232 C3 D8 80      [10] 2942 	jp  _lanzarCuchillo
                           2943 ;src/main.c:656: u8 checkKnifeCollision(int direction, u8 xoff, u8 yoff){
                           2944 ;	---------------------------------
                           2945 ; Function checkKnifeCollision
                           2946 ; ---------------------------------
   8235                    2947 _checkKnifeCollision::
                           2948 ;src/main.c:658: return *getTilePtr(cu.x + xoff, cu.y + yoff) <= 2;
   8235 3A D8 69      [13] 2949 	ld	a,(#_cu + 1)
   8238 21 05 00      [10] 2950 	ld	hl,#5
   823B 39            [11] 2951 	add	hl,sp
   823C 86            [ 7] 2952 	add	a, (hl)
   823D 47            [ 4] 2953 	ld	b,a
   823E 3A D7 69      [13] 2954 	ld	a,(#_cu + 0)
   8241 21 04 00      [10] 2955 	ld	hl,#4
   8244 39            [11] 2956 	add	hl,sp
   8245 86            [ 7] 2957 	add	a, (hl)
   8246 4F            [ 4] 2958 	ld	c,a
   8247 C5            [11] 2959 	push	bc
   8248 CD 77 73      [17] 2960 	call	_getTilePtr
   824B F1            [10] 2961 	pop	af
   824C 4E            [ 7] 2962 	ld	c,(hl)
   824D 3E 02         [ 7] 2963 	ld	a,#0x02
   824F 91            [ 4] 2964 	sub	a, c
   8250 3E 00         [ 7] 2965 	ld	a,#0x00
   8252 17            [ 4] 2966 	rla
   8253 EE 01         [ 7] 2967 	xor	a, #0x01
   8255 6F            [ 4] 2968 	ld	l, a
   8256 C9            [10] 2969 	ret
                           2970 ;src/main.c:661: void moverCuchillo(){
                           2971 ;	---------------------------------
                           2972 ; Function moverCuchillo
                           2973 ; ---------------------------------
   8257                    2974 _moverCuchillo::
                           2975 ;src/main.c:662: if(cu.lanzado){
   8257 01 D7 69      [10] 2976 	ld	bc,#_cu+0
   825A 3A DD 69      [13] 2977 	ld	a, (#_cu + 6)
   825D B7            [ 4] 2978 	or	a, a
   825E C8            [11] 2979 	ret	Z
                           2980 ;src/main.c:663: cu.mover = SI;
   825F 21 09 00      [10] 2981 	ld	hl,#0x0009
   8262 09            [11] 2982 	add	hl,bc
   8263 EB            [ 4] 2983 	ex	de,hl
   8264 3E 01         [ 7] 2984 	ld	a,#0x01
   8266 12            [ 7] 2985 	ld	(de),a
                           2986 ;src/main.c:664: if(cu.direccion == M_derecha){
   8267 21 DE 69      [10] 2987 	ld	hl, #_cu + 7
   826A 6E            [ 7] 2988 	ld	l,(hl)
   826B 7D            [ 4] 2989 	ld	a,l
   826C B7            [ 4] 2990 	or	a, a
   826D 20 1E         [12] 2991 	jr	NZ,00122$
                           2992 ;src/main.c:666: if(checkKnifeCollision(M_derecha, G_KNIFEX_0_W + 1, 0)){
   826F C5            [11] 2993 	push	bc
   8270 D5            [11] 2994 	push	de
   8271 21 05 00      [10] 2995 	ld	hl,#0x0005
   8274 E5            [11] 2996 	push	hl
   8275 2E 00         [ 7] 2997 	ld	l, #0x00
   8277 E5            [11] 2998 	push	hl
   8278 CD 35 82      [17] 2999 	call	_checkKnifeCollision
   827B F1            [10] 3000 	pop	af
   827C F1            [10] 3001 	pop	af
   827D D1            [10] 3002 	pop	de
   827E C1            [10] 3003 	pop	bc
   827F 7D            [ 4] 3004 	ld	a,l
   8280 B7            [ 4] 3005 	or	a, a
   8281 28 07         [12] 3006 	jr	Z,00102$
                           3007 ;src/main.c:667: cu.mover = SI;
   8283 3E 01         [ 7] 3008 	ld	a,#0x01
   8285 12            [ 7] 3009 	ld	(de),a
                           3010 ;src/main.c:668: cu.x++;
   8286 0A            [ 7] 3011 	ld	a,(bc)
   8287 3C            [ 4] 3012 	inc	a
   8288 02            [ 7] 3013 	ld	(bc),a
   8289 C9            [10] 3014 	ret
   828A                    3015 00102$:
                           3016 ;src/main.c:671: cu.mover=NO;
   828A AF            [ 4] 3017 	xor	a, a
   828B 12            [ 7] 3018 	ld	(de),a
   828C C9            [10] 3019 	ret
   828D                    3020 00122$:
                           3021 ;src/main.c:674: else if(cu.direccion == M_izquierda){
   828D 7D            [ 4] 3022 	ld	a,l
   828E 3D            [ 4] 3023 	dec	a
   828F 20 1F         [12] 3024 	jr	NZ,00119$
                           3025 ;src/main.c:675: if(checkKnifeCollision(M_derecha, -1, 0)){
   8291 C5            [11] 3026 	push	bc
   8292 D5            [11] 3027 	push	de
   8293 21 FF 00      [10] 3028 	ld	hl,#0x00FF
   8296 E5            [11] 3029 	push	hl
   8297 2E 00         [ 7] 3030 	ld	l, #0x00
   8299 E5            [11] 3031 	push	hl
   829A CD 35 82      [17] 3032 	call	_checkKnifeCollision
   829D F1            [10] 3033 	pop	af
   829E F1            [10] 3034 	pop	af
   829F D1            [10] 3035 	pop	de
   82A0 C1            [10] 3036 	pop	bc
   82A1 7D            [ 4] 3037 	ld	a,l
   82A2 B7            [ 4] 3038 	or	a, a
   82A3 28 08         [12] 3039 	jr	Z,00105$
                           3040 ;src/main.c:676: cu.mover = SI;
   82A5 3E 01         [ 7] 3041 	ld	a,#0x01
   82A7 12            [ 7] 3042 	ld	(de),a
                           3043 ;src/main.c:677: cu.x--;
   82A8 0A            [ 7] 3044 	ld	a,(bc)
   82A9 C6 FF         [ 7] 3045 	add	a,#0xFF
   82AB 02            [ 7] 3046 	ld	(bc),a
   82AC C9            [10] 3047 	ret
   82AD                    3048 00105$:
                           3049 ;src/main.c:679: cu.mover=NO;
   82AD AF            [ 4] 3050 	xor	a, a
   82AE 12            [ 7] 3051 	ld	(de),a
   82AF C9            [10] 3052 	ret
   82B0                    3053 00119$:
                           3054 ;src/main.c:685: cu.y--;
   82B0 03            [ 6] 3055 	inc	bc
                           3056 ;src/main.c:682: else if(cu.direccion == M_arriba){
   82B1 7D            [ 4] 3057 	ld	a,l
   82B2 D6 02         [ 7] 3058 	sub	a, #0x02
   82B4 20 22         [12] 3059 	jr	NZ,00116$
                           3060 ;src/main.c:683: if(checkKnifeCollision(M_derecha, 0, -2)){
   82B6 C5            [11] 3061 	push	bc
   82B7 D5            [11] 3062 	push	de
   82B8 21 00 FE      [10] 3063 	ld	hl,#0xFE00
   82BB E5            [11] 3064 	push	hl
   82BC 26 00         [ 7] 3065 	ld	h, #0x00
   82BE E5            [11] 3066 	push	hl
   82BF CD 35 82      [17] 3067 	call	_checkKnifeCollision
   82C2 F1            [10] 3068 	pop	af
   82C3 F1            [10] 3069 	pop	af
   82C4 D1            [10] 3070 	pop	de
   82C5 C1            [10] 3071 	pop	bc
   82C6 7D            [ 4] 3072 	ld	a,l
   82C7 B7            [ 4] 3073 	or	a, a
   82C8 28 0B         [12] 3074 	jr	Z,00108$
                           3075 ;src/main.c:684: cu.mover = SI;
   82CA 3E 01         [ 7] 3076 	ld	a,#0x01
   82CC 12            [ 7] 3077 	ld	(de),a
                           3078 ;src/main.c:685: cu.y--;
   82CD 0A            [ 7] 3079 	ld	a,(bc)
   82CE C6 FF         [ 7] 3080 	add	a,#0xFF
   82D0 02            [ 7] 3081 	ld	(bc),a
                           3082 ;src/main.c:686: cu.y--;
   82D1 C6 FF         [ 7] 3083 	add	a,#0xFF
   82D3 02            [ 7] 3084 	ld	(bc),a
   82D4 C9            [10] 3085 	ret
   82D5                    3086 00108$:
                           3087 ;src/main.c:689: cu.mover=NO;
   82D5 AF            [ 4] 3088 	xor	a, a
   82D6 12            [ 7] 3089 	ld	(de),a
   82D7 C9            [10] 3090 	ret
   82D8                    3091 00116$:
                           3092 ;src/main.c:692: else if(cu.direccion == M_abajo){
   82D8 7D            [ 4] 3093 	ld	a,l
   82D9 D6 03         [ 7] 3094 	sub	a, #0x03
   82DB C0            [11] 3095 	ret	NZ
                           3096 ;src/main.c:693: if(checkKnifeCollision(M_derecha, 0, G_KNIFEY_0_H + 2)){
   82DC C5            [11] 3097 	push	bc
   82DD D5            [11] 3098 	push	de
   82DE 21 00 0A      [10] 3099 	ld	hl,#0x0A00
   82E1 E5            [11] 3100 	push	hl
   82E2 26 00         [ 7] 3101 	ld	h, #0x00
   82E4 E5            [11] 3102 	push	hl
   82E5 CD 35 82      [17] 3103 	call	_checkKnifeCollision
   82E8 F1            [10] 3104 	pop	af
   82E9 F1            [10] 3105 	pop	af
   82EA D1            [10] 3106 	pop	de
   82EB C1            [10] 3107 	pop	bc
   82EC 7D            [ 4] 3108 	ld	a,l
   82ED B7            [ 4] 3109 	or	a, a
   82EE 28 09         [12] 3110 	jr	Z,00111$
                           3111 ;src/main.c:694: cu.mover = SI;
   82F0 3E 01         [ 7] 3112 	ld	a,#0x01
   82F2 12            [ 7] 3113 	ld	(de),a
                           3114 ;src/main.c:695: cu.y++;
   82F3 0A            [ 7] 3115 	ld	a,(bc)
   82F4 3C            [ 4] 3116 	inc	a
   82F5 02            [ 7] 3117 	ld	(bc),a
                           3118 ;src/main.c:696: cu.y++;
   82F6 3C            [ 4] 3119 	inc	a
   82F7 02            [ 7] 3120 	ld	(bc),a
   82F8 C9            [10] 3121 	ret
   82F9                    3122 00111$:
                           3123 ;src/main.c:699: cu.mover=NO;
   82F9 AF            [ 4] 3124 	xor	a, a
   82FA 12            [ 7] 3125 	ld	(de),a
   82FB C9            [10] 3126 	ret
                           3127 ;src/main.c:705: void barraPuntuacionInicial(){
                           3128 ;	---------------------------------
                           3129 ; Function barraPuntuacionInicial
                           3130 ; ---------------------------------
   82FC                    3131 _barraPuntuacionInicial::
                           3132 ;src/main.c:710: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   82FC 21 00 02      [10] 3133 	ld	hl,#0x0200
   82FF E5            [11] 3134 	push	hl
   8300 26 C0         [ 7] 3135 	ld	h, #0xC0
   8302 E5            [11] 3136 	push	hl
   8303 CD 62 64      [17] 3137 	call	_cpct_getScreenPtr
   8306 4D            [ 4] 3138 	ld	c,l
   8307 44            [ 4] 3139 	ld	b,h
                           3140 ;src/main.c:711: cpct_drawStringM0("SCORE", memptr, 1, 0);
   8308 21 01 00      [10] 3141 	ld	hl,#0x0001
   830B E5            [11] 3142 	push	hl
   830C C5            [11] 3143 	push	bc
   830D 21 A4 83      [10] 3144 	ld	hl,#___str_1
   8310 E5            [11] 3145 	push	hl
   8311 CD 92 58      [17] 3146 	call	_cpct_drawStringM0
   8314 21 06 00      [10] 3147 	ld	hl,#6
   8317 39            [11] 3148 	add	hl,sp
   8318 F9            [ 6] 3149 	ld	sp,hl
                           3150 ;src/main.c:712: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   8319 21 00 0E      [10] 3151 	ld	hl,#0x0E00
   831C E5            [11] 3152 	push	hl
   831D 26 C0         [ 7] 3153 	ld	h, #0xC0
   831F E5            [11] 3154 	push	hl
   8320 CD 62 64      [17] 3155 	call	_cpct_getScreenPtr
   8323 4D            [ 4] 3156 	ld	c,l
   8324 44            [ 4] 3157 	ld	b,h
                           3158 ;src/main.c:713: cpct_drawStringM0("00000", memptr, 15, 0);
   8325 21 0F 00      [10] 3159 	ld	hl,#0x000F
   8328 E5            [11] 3160 	push	hl
   8329 C5            [11] 3161 	push	bc
   832A 21 AA 83      [10] 3162 	ld	hl,#___str_2
   832D E5            [11] 3163 	push	hl
   832E CD 92 58      [17] 3164 	call	_cpct_drawStringM0
   8331 21 06 00      [10] 3165 	ld	hl,#6
   8334 39            [11] 3166 	add	hl,sp
   8335 F9            [ 6] 3167 	ld	sp,hl
                           3168 ;src/main.c:716: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 14);
   8336 21 1A 0E      [10] 3169 	ld	hl,#0x0E1A
   8339 E5            [11] 3170 	push	hl
   833A 21 00 C0      [10] 3171 	ld	hl,#0xC000
   833D E5            [11] 3172 	push	hl
   833E CD 62 64      [17] 3173 	call	_cpct_getScreenPtr
   8341 4D            [ 4] 3174 	ld	c,l
   8342 44            [ 4] 3175 	ld	b,h
                           3176 ;src/main.c:717: cpct_drawStringM0("ROBOBIT", memptr, 3, 0);
   8343 21 03 00      [10] 3177 	ld	hl,#0x0003
   8346 E5            [11] 3178 	push	hl
   8347 C5            [11] 3179 	push	bc
   8348 21 B0 83      [10] 3180 	ld	hl,#___str_3
   834B E5            [11] 3181 	push	hl
   834C CD 92 58      [17] 3182 	call	_cpct_drawStringM0
   834F 21 06 00      [10] 3183 	ld	hl,#6
   8352 39            [11] 3184 	add	hl,sp
   8353 F9            [ 6] 3185 	ld	sp,hl
                           3186 ;src/main.c:719: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   8354 21 3C 02      [10] 3187 	ld	hl,#0x023C
   8357 E5            [11] 3188 	push	hl
   8358 21 00 C0      [10] 3189 	ld	hl,#0xC000
   835B E5            [11] 3190 	push	hl
   835C CD 62 64      [17] 3191 	call	_cpct_getScreenPtr
   835F 4D            [ 4] 3192 	ld	c,l
   8360 44            [ 4] 3193 	ld	b,h
                           3194 ;src/main.c:720: cpct_drawStringM0("LIVES", memptr, 1, 0);
   8361 21 01 00      [10] 3195 	ld	hl,#0x0001
   8364 E5            [11] 3196 	push	hl
   8365 C5            [11] 3197 	push	bc
   8366 21 B8 83      [10] 3198 	ld	hl,#___str_4
   8369 E5            [11] 3199 	push	hl
   836A CD 92 58      [17] 3200 	call	_cpct_drawStringM0
   836D 21 06 00      [10] 3201 	ld	hl,#6
   8370 39            [11] 3202 	add	hl,sp
   8371 F9            [ 6] 3203 	ld	sp,hl
                           3204 ;src/main.c:722: for(i=0; i<5; i++){
   8372 01 00 00      [10] 3205 	ld	bc,#0x0000
   8375                    3206 00102$:
                           3207 ;src/main.c:723: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   8375 79            [ 4] 3208 	ld	a,c
   8376 87            [ 4] 3209 	add	a, a
   8377 87            [ 4] 3210 	add	a, a
   8378 C6 3C         [ 7] 3211 	add	a, #0x3C
   837A 57            [ 4] 3212 	ld	d,a
   837B C5            [11] 3213 	push	bc
   837C 3E 0E         [ 7] 3214 	ld	a,#0x0E
   837E F5            [11] 3215 	push	af
   837F 33            [ 6] 3216 	inc	sp
   8380 D5            [11] 3217 	push	de
   8381 33            [ 6] 3218 	inc	sp
   8382 21 00 C0      [10] 3219 	ld	hl,#0xC000
   8385 E5            [11] 3220 	push	hl
   8386 CD 62 64      [17] 3221 	call	_cpct_getScreenPtr
   8389 EB            [ 4] 3222 	ex	de,hl
   838A 21 03 06      [10] 3223 	ld	hl,#0x0603
   838D E5            [11] 3224 	push	hl
   838E D5            [11] 3225 	push	de
   838F 21 60 48      [10] 3226 	ld	hl,#_g_heart
   8392 E5            [11] 3227 	push	hl
   8393 CD B6 58      [17] 3228 	call	_cpct_drawSprite
   8396 C1            [10] 3229 	pop	bc
                           3230 ;src/main.c:722: for(i=0; i<5; i++){
   8397 03            [ 6] 3231 	inc	bc
   8398 79            [ 4] 3232 	ld	a,c
   8399 D6 05         [ 7] 3233 	sub	a, #0x05
   839B 78            [ 4] 3234 	ld	a,b
   839C 17            [ 4] 3235 	rla
   839D 3F            [ 4] 3236 	ccf
   839E 1F            [ 4] 3237 	rra
   839F DE 80         [ 7] 3238 	sbc	a, #0x80
   83A1 38 D2         [12] 3239 	jr	C,00102$
   83A3 C9            [10] 3240 	ret
   83A4                    3241 ___str_1:
   83A4 53 43 4F 52 45     3242 	.ascii "SCORE"
   83A9 00                 3243 	.db 0x00
   83AA                    3244 ___str_2:
   83AA 30 30 30 30 30     3245 	.ascii "00000"
   83AF 00                 3246 	.db 0x00
   83B0                    3247 ___str_3:
   83B0 52 4F 42 4F 42 49  3248 	.ascii "ROBOBIT"
        54
   83B7 00                 3249 	.db 0x00
   83B8                    3250 ___str_4:
   83B8 4C 49 56 45 53     3251 	.ascii "LIVES"
   83BD 00                 3252 	.db 0x00
                           3253 ;src/main.c:728: void borrarPantallaArriba(u8 x, u8 y, u8 ancho, u8 alto){
                           3254 ;	---------------------------------
                           3255 ; Function borrarPantallaArriba
                           3256 ; ---------------------------------
   83BE                    3257 _borrarPantallaArriba::
   83BE DD E5         [15] 3258 	push	ix
   83C0 DD 21 00 00   [14] 3259 	ld	ix,#0
   83C4 DD 39         [15] 3260 	add	ix,sp
                           3261 ;src/main.c:731: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   83C6 DD 66 05      [19] 3262 	ld	h,5 (ix)
   83C9 DD 6E 04      [19] 3263 	ld	l,4 (ix)
   83CC E5            [11] 3264 	push	hl
   83CD 21 00 C0      [10] 3265 	ld	hl,#0xC000
   83D0 E5            [11] 3266 	push	hl
   83D1 CD 62 64      [17] 3267 	call	_cpct_getScreenPtr
   83D4 4D            [ 4] 3268 	ld	c,l
   83D5 44            [ 4] 3269 	ld	b,h
                           3270 ;src/main.c:732: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra la mitad derecha
   83D6 DD 66 07      [19] 3271 	ld	h,7 (ix)
   83D9 DD 6E 06      [19] 3272 	ld	l,6 (ix)
   83DC E5            [11] 3273 	push	hl
   83DD AF            [ 4] 3274 	xor	a, a
   83DE F5            [11] 3275 	push	af
   83DF 33            [ 6] 3276 	inc	sp
   83E0 C5            [11] 3277 	push	bc
   83E1 CD 88 63      [17] 3278 	call	_cpct_drawSolidBox
   83E4 F1            [10] 3279 	pop	af
   83E5 F1            [10] 3280 	pop	af
   83E6 33            [ 6] 3281 	inc	sp
                           3282 ;src/main.c:733: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   83E7 DD 7E 04      [19] 3283 	ld	a,4 (ix)
   83EA C6 28         [ 7] 3284 	add	a, #0x28
   83EC 47            [ 4] 3285 	ld	b,a
   83ED DD 7E 05      [19] 3286 	ld	a,5 (ix)
   83F0 F5            [11] 3287 	push	af
   83F1 33            [ 6] 3288 	inc	sp
   83F2 C5            [11] 3289 	push	bc
   83F3 33            [ 6] 3290 	inc	sp
   83F4 21 00 C0      [10] 3291 	ld	hl,#0xC000
   83F7 E5            [11] 3292 	push	hl
   83F8 CD 62 64      [17] 3293 	call	_cpct_getScreenPtr
   83FB 4D            [ 4] 3294 	ld	c,l
   83FC 44            [ 4] 3295 	ld	b,h
                           3296 ;src/main.c:734: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra la mitad izquierda
   83FD DD 66 07      [19] 3297 	ld	h,7 (ix)
   8400 DD 6E 06      [19] 3298 	ld	l,6 (ix)
   8403 E5            [11] 3299 	push	hl
   8404 AF            [ 4] 3300 	xor	a, a
   8405 F5            [11] 3301 	push	af
   8406 33            [ 6] 3302 	inc	sp
   8407 C5            [11] 3303 	push	bc
   8408 CD 88 63      [17] 3304 	call	_cpct_drawSolidBox
   840B F1            [10] 3305 	pop	af
   840C F1            [10] 3306 	pop	af
   840D 33            [ 6] 3307 	inc	sp
   840E DD E1         [14] 3308 	pop	ix
   8410 C9            [10] 3309 	ret
                           3310 ;src/main.c:737: void menuInicio(){
                           3311 ;	---------------------------------
                           3312 ; Function menuInicio
                           3313 ; ---------------------------------
   8411                    3314 _menuInicio::
                           3315 ;src/main.c:741: cpct_clearScreen(0);
   8411 21 00 40      [10] 3316 	ld	hl,#0x4000
   8414 E5            [11] 3317 	push	hl
   8415 AF            [ 4] 3318 	xor	a, a
   8416 F5            [11] 3319 	push	af
   8417 33            [ 6] 3320 	inc	sp
   8418 26 C0         [ 7] 3321 	ld	h, #0xC0
   841A E5            [11] 3322 	push	hl
   841B CD 41 5B      [17] 3323 	call	_cpct_memset
                           3324 ;src/main.c:743: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   841E 21 1A 0F      [10] 3325 	ld	hl,#0x0F1A
   8421 E5            [11] 3326 	push	hl
   8422 21 00 C0      [10] 3327 	ld	hl,#0xC000
   8425 E5            [11] 3328 	push	hl
   8426 CD 62 64      [17] 3329 	call	_cpct_getScreenPtr
   8429 4D            [ 4] 3330 	ld	c,l
   842A 44            [ 4] 3331 	ld	b,h
                           3332 ;src/main.c:744: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   842B 21 04 00      [10] 3333 	ld	hl,#0x0004
   842E E5            [11] 3334 	push	hl
   842F C5            [11] 3335 	push	bc
   8430 21 C4 84      [10] 3336 	ld	hl,#___str_5
   8433 E5            [11] 3337 	push	hl
   8434 CD 92 58      [17] 3338 	call	_cpct_drawStringM0
   8437 21 06 00      [10] 3339 	ld	hl,#6
   843A 39            [11] 3340 	add	hl,sp
   843B F9            [ 6] 3341 	ld	sp,hl
                           3342 ;src/main.c:746: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   843C 21 28 6E      [10] 3343 	ld	hl,#0x6E28
   843F E5            [11] 3344 	push	hl
   8440 21 F0 F0      [10] 3345 	ld	hl,#0xF0F0
   8443 E5            [11] 3346 	push	hl
   8444 21 00 26      [10] 3347 	ld	hl,#_g_text_0
   8447 E5            [11] 3348 	push	hl
   8448 CD B6 58      [17] 3349 	call	_cpct_drawSprite
                           3350 ;src/main.c:747: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   844B 21 28 6E      [10] 3351 	ld	hl,#0x6E28
   844E E5            [11] 3352 	push	hl
   844F 21 18 F1      [10] 3353 	ld	hl,#0xF118
   8452 E5            [11] 3354 	push	hl
   8453 21 30 37      [10] 3355 	ld	hl,#_g_text_1
   8456 E5            [11] 3356 	push	hl
   8457 CD B6 58      [17] 3357 	call	_cpct_drawSprite
                           3358 ;src/main.c:770: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   845A 21 08 A0      [10] 3359 	ld	hl,#0xA008
   845D E5            [11] 3360 	push	hl
   845E 21 00 C0      [10] 3361 	ld	hl,#0xC000
   8461 E5            [11] 3362 	push	hl
   8462 CD 62 64      [17] 3363 	call	_cpct_getScreenPtr
   8465 4D            [ 4] 3364 	ld	c,l
   8466 44            [ 4] 3365 	ld	b,h
                           3366 ;src/main.c:771: cpct_drawStringM0("TO START PRESS S", memptr, 4, 0);
   8467 21 04 00      [10] 3367 	ld	hl,#0x0004
   846A E5            [11] 3368 	push	hl
   846B C5            [11] 3369 	push	bc
   846C 21 CC 84      [10] 3370 	ld	hl,#___str_6
   846F E5            [11] 3371 	push	hl
   8470 CD 92 58      [17] 3372 	call	_cpct_drawStringM0
   8473 21 06 00      [10] 3373 	ld	hl,#6
   8476 39            [11] 3374 	add	hl,sp
   8477 F9            [ 6] 3375 	ld	sp,hl
                           3376 ;src/main.c:773: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 170); // centrado en horizontal y abajo en vertical
   8478 21 0A AA      [10] 3377 	ld	hl,#0xAA0A
   847B E5            [11] 3378 	push	hl
   847C 21 00 C0      [10] 3379 	ld	hl,#0xC000
   847F E5            [11] 3380 	push	hl
   8480 CD 62 64      [17] 3381 	call	_cpct_getScreenPtr
   8483 4D            [ 4] 3382 	ld	c,l
   8484 44            [ 4] 3383 	ld	b,h
                           3384 ;src/main.c:774: cpct_drawStringM0("TO MENU PRESS M", memptr, 4, 0);
   8485 21 04 00      [10] 3385 	ld	hl,#0x0004
   8488 E5            [11] 3386 	push	hl
   8489 C5            [11] 3387 	push	bc
   848A 21 DD 84      [10] 3388 	ld	hl,#___str_7
   848D E5            [11] 3389 	push	hl
   848E CD 92 58      [17] 3390 	call	_cpct_drawStringM0
   8491 21 06 00      [10] 3391 	ld	hl,#6
   8494 39            [11] 3392 	add	hl,sp
   8495 F9            [ 6] 3393 	ld	sp,hl
                           3394 ;src/main.c:777: do{
   8496                    3395 00106$:
                           3396 ;src/main.c:778: cpct_scanKeyboard_f();
   8496 CD 1C 58      [17] 3397 	call	_cpct_scanKeyboard_f
                           3398 ;src/main.c:782: if(cpct_isKeyPressed(Key_M)){
   8499 21 04 40      [10] 3399 	ld	hl,#0x4004
   849C CD 10 58      [17] 3400 	call	_cpct_isKeyPressed
   849F 7D            [ 4] 3401 	ld	a,l
   84A0 B7            [ 4] 3402 	or	a, a
   84A1 28 0D         [12] 3403 	jr	Z,00107$
                           3404 ;src/main.c:783: cpct_scanKeyboard_f();
   84A3 CD 1C 58      [17] 3405 	call	_cpct_scanKeyboard_f
                           3406 ;src/main.c:784: do{
   84A6                    3407 00101$:
                           3408 ;src/main.c:786: } while(!cpct_isKeyPressed(Key_S));
   84A6 21 07 10      [10] 3409 	ld	hl,#0x1007
   84A9 CD 10 58      [17] 3410 	call	_cpct_isKeyPressed
   84AC 7D            [ 4] 3411 	ld	a,l
   84AD B7            [ 4] 3412 	or	a, a
   84AE 28 F6         [12] 3413 	jr	Z,00101$
   84B0                    3414 00107$:
                           3415 ;src/main.c:788: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   84B0 21 07 10      [10] 3416 	ld	hl,#0x1007
   84B3 CD 10 58      [17] 3417 	call	_cpct_isKeyPressed
   84B6 7D            [ 4] 3418 	ld	a,l
   84B7 B7            [ 4] 3419 	or	a, a
   84B8 C0            [11] 3420 	ret	NZ
   84B9 21 04 40      [10] 3421 	ld	hl,#0x4004
   84BC CD 10 58      [17] 3422 	call	_cpct_isKeyPressed
   84BF 7D            [ 4] 3423 	ld	a,l
   84C0 B7            [ 4] 3424 	or	a, a
   84C1 28 D3         [12] 3425 	jr	Z,00106$
   84C3 C9            [10] 3426 	ret
   84C4                    3427 ___str_5:
   84C4 52 4F 42 4F 42 49  3428 	.ascii "ROBOBIT"
        54
   84CB 00                 3429 	.db 0x00
   84CC                    3430 ___str_6:
   84CC 54 4F 20 53 54 41  3431 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   84DC 00                 3432 	.db 0x00
   84DD                    3433 ___str_7:
   84DD 54 4F 20 4D 45 4E  3434 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   84EC 00                 3435 	.db 0x00
                           3436 ;src/main.c:791: void inicializarCPC() {
                           3437 ;	---------------------------------
                           3438 ; Function inicializarCPC
                           3439 ; ---------------------------------
   84ED                    3440 _inicializarCPC::
                           3441 ;src/main.c:792: cpct_disableFirmware();
   84ED CD 78 63      [17] 3442 	call	_cpct_disableFirmware
                           3443 ;src/main.c:793: cpct_setVideoMode(0);
   84F0 2E 00         [ 7] 3444 	ld	l,#0x00
   84F2 CD 23 5B      [17] 3445 	call	_cpct_setVideoMode
                           3446 ;src/main.c:794: cpct_setBorder(HW_BLACK);
   84F5 21 10 14      [10] 3447 	ld	hl,#0x1410
   84F8 E5            [11] 3448 	push	hl
   84F9 CD 86 58      [17] 3449 	call	_cpct_setPALColour
                           3450 ;src/main.c:795: cpct_setPalette(g_palette, 16);
   84FC 21 10 00      [10] 3451 	ld	hl,#0x0010
   84FF E5            [11] 3452 	push	hl
   8500 21 98 4A      [10] 3453 	ld	hl,#_g_palette
   8503 E5            [11] 3454 	push	hl
   8504 CD F9 57      [17] 3455 	call	_cpct_setPalette
                           3456 ;src/main.c:796: cpct_akp_musicInit(G_song);
   8507 21 00 0F      [10] 3457 	ld	hl,#_G_song
   850A E5            [11] 3458 	push	hl
   850B CD 54 62      [17] 3459 	call	_cpct_akp_musicInit
   850E F1            [10] 3460 	pop	af
   850F C9            [10] 3461 	ret
                           3462 ;src/main.c:799: void inicializarEnemy() {
                           3463 ;	---------------------------------
                           3464 ; Function inicializarEnemy
                           3465 ; ---------------------------------
   8510                    3466 _inicializarEnemy::
   8510 DD E5         [15] 3467 	push	ix
   8512 DD 21 00 00   [14] 3468 	ld	ix,#0
   8516 DD 39         [15] 3469 	add	ix,sp
   8518 21 F9 FF      [10] 3470 	ld	hl,#-7
   851B 39            [11] 3471 	add	hl,sp
   851C F9            [ 6] 3472 	ld	sp,hl
                           3473 ;src/main.c:810: actual = enemy;
   851D 01 BF 64      [10] 3474 	ld	bc,#_enemy+0
                           3475 ;src/main.c:811: while(--i){
   8520 DD 36 F9 02   [19] 3476 	ld	-7 (ix),#0x02
   8524                    3477 00101$:
   8524 DD 35 F9      [23] 3478 	dec	-7 (ix)
   8527 DD 7E F9      [19] 3479 	ld	a,-7 (ix)
   852A B7            [ 4] 3480 	or	a, a
   852B CA 01 86      [10] 3481 	jp	Z,00104$
                           3482 ;src/main.c:812: actual->x = actual->px = spawnX[i];
   852E 59            [ 4] 3483 	ld	e, c
   852F 50            [ 4] 3484 	ld	d, b
   8530 13            [ 6] 3485 	inc	de
   8531 13            [ 6] 3486 	inc	de
   8532 3E 88         [ 7] 3487 	ld	a,#<(_spawnX)
   8534 DD 86 F9      [19] 3488 	add	a, -7 (ix)
   8537 DD 77 FB      [19] 3489 	ld	-5 (ix),a
   853A 3E 72         [ 7] 3490 	ld	a,#>(_spawnX)
   853C CE 00         [ 7] 3491 	adc	a, #0x00
   853E DD 77 FC      [19] 3492 	ld	-4 (ix),a
   8541 DD 6E FB      [19] 3493 	ld	l,-5 (ix)
   8544 DD 66 FC      [19] 3494 	ld	h,-4 (ix)
   8547 7E            [ 7] 3495 	ld	a,(hl)
   8548 DD 77 FA      [19] 3496 	ld	-6 (ix), a
   854B 12            [ 7] 3497 	ld	(de),a
   854C DD 7E FA      [19] 3498 	ld	a,-6 (ix)
   854F 02            [ 7] 3499 	ld	(bc),a
                           3500 ;src/main.c:813: actual->y = actual->py = spawnY[i];
   8550 59            [ 4] 3501 	ld	e, c
   8551 50            [ 4] 3502 	ld	d, b
   8552 13            [ 6] 3503 	inc	de
   8553 21 03 00      [10] 3504 	ld	hl,#0x0003
   8556 09            [11] 3505 	add	hl,bc
   8557 DD 75 FE      [19] 3506 	ld	-2 (ix),l
   855A DD 74 FF      [19] 3507 	ld	-1 (ix),h
   855D FD 21 8D 72   [14] 3508 	ld	iy,#_spawnY
   8561 C5            [11] 3509 	push	bc
   8562 DD 4E F9      [19] 3510 	ld	c,-7 (ix)
   8565 06 00         [ 7] 3511 	ld	b,#0x00
   8567 FD 09         [15] 3512 	add	iy, bc
   8569 C1            [10] 3513 	pop	bc
   856A FD 7E 00      [19] 3514 	ld	a, 0 (iy)
   856D DD 77 FD      [19] 3515 	ld	-3 (ix),a
   8570 DD 6E FE      [19] 3516 	ld	l,-2 (ix)
   8573 DD 66 FF      [19] 3517 	ld	h,-1 (ix)
   8576 DD 7E FD      [19] 3518 	ld	a,-3 (ix)
   8579 77            [ 7] 3519 	ld	(hl),a
   857A DD 7E FD      [19] 3520 	ld	a,-3 (ix)
   857D 12            [ 7] 3521 	ld	(de),a
                           3522 ;src/main.c:814: actual->mover  = NO;
   857E 21 06 00      [10] 3523 	ld	hl,#0x0006
   8581 09            [11] 3524 	add	hl,bc
   8582 36 00         [10] 3525 	ld	(hl),#0x00
                           3526 ;src/main.c:815: actual->mira   = M_abajo;
   8584 21 07 00      [10] 3527 	ld	hl,#0x0007
   8587 09            [11] 3528 	add	hl,bc
   8588 36 03         [10] 3529 	ld	(hl),#0x03
                           3530 ;src/main.c:816: actual->sprite = g_enemy;
   858A 21 04 00      [10] 3531 	ld	hl,#0x0004
   858D 09            [11] 3532 	add	hl,bc
   858E 36 72         [10] 3533 	ld	(hl),#<(_g_enemy)
   8590 23            [ 6] 3534 	inc	hl
   8591 36 48         [10] 3535 	ld	(hl),#>(_g_enemy)
                           3536 ;src/main.c:817: actual->muerto = NO;
   8593 21 08 00      [10] 3537 	ld	hl,#0x0008
   8596 09            [11] 3538 	add	hl,bc
   8597 36 00         [10] 3539 	ld	(hl),#0x00
                           3540 ;src/main.c:818: actual->muertes = 0;
   8599 21 0A 00      [10] 3541 	ld	hl,#0x000A
   859C 09            [11] 3542 	add	hl,bc
   859D 36 00         [10] 3543 	ld	(hl),#0x00
                           3544 ;src/main.c:819: actual->patrolling = SI;
   859F 21 0B 00      [10] 3545 	ld	hl,#0x000B
   85A2 09            [11] 3546 	add	hl,bc
   85A3 36 01         [10] 3547 	ld	(hl),#0x01
                           3548 ;src/main.c:820: actual->onPathPatrol = SI;
   85A5 21 0C 00      [10] 3549 	ld	hl,#0x000C
   85A8 09            [11] 3550 	add	hl,bc
   85A9 36 01         [10] 3551 	ld	(hl),#0x01
                           3552 ;src/main.c:821: actual->reversePatrol = NO;
   85AB 21 0D 00      [10] 3553 	ld	hl,#0x000D
   85AE 09            [11] 3554 	add	hl,bc
   85AF 36 00         [10] 3555 	ld	(hl),#0x00
                           3556 ;src/main.c:822: actual->iter = 0;
   85B1 21 0F 00      [10] 3557 	ld	hl,#0x000F
   85B4 09            [11] 3558 	add	hl,bc
   85B5 36 00         [10] 3559 	ld	(hl),#0x00
                           3560 ;src/main.c:823: actual->lastIter = 0;
   85B7 21 10 00      [10] 3561 	ld	hl,#0x0010
   85BA 09            [11] 3562 	add	hl,bc
   85BB 36 00         [10] 3563 	ld	(hl),#0x00
                           3564 ;src/main.c:824: actual->seen = 0;
   85BD 21 12 00      [10] 3565 	ld	hl,#0x0012
   85C0 09            [11] 3566 	add	hl,bc
   85C1 36 00         [10] 3567 	ld	(hl),#0x00
                           3568 ;src/main.c:825: actual->found = 0;
   85C3 21 13 00      [10] 3569 	ld	hl,#0x0013
   85C6 09            [11] 3570 	add	hl,bc
   85C7 36 00         [10] 3571 	ld	(hl),#0x00
                           3572 ;src/main.c:826: pathFinding(actual->x, actual->y, spawnX[i] - 20, spawnY[i], actual, mapa); // calculo rutas de patrulla
   85C9 FD 5E 00      [19] 3573 	ld	e, 0 (iy)
   85CC DD 6E FB      [19] 3574 	ld	l,-5 (ix)
   85CF DD 66 FC      [19] 3575 	ld	h,-4 (ix)
   85D2 7E            [ 7] 3576 	ld	a,(hl)
   85D3 C6 EC         [ 7] 3577 	add	a,#0xEC
   85D5 57            [ 4] 3578 	ld	d,a
   85D6 C5            [11] 3579 	push	bc
   85D7 2A E2 69      [16] 3580 	ld	hl,(_mapa)
   85DA E5            [11] 3581 	push	hl
   85DB C5            [11] 3582 	push	bc
   85DC 7B            [ 4] 3583 	ld	a,e
   85DD F5            [11] 3584 	push	af
   85DE 33            [ 6] 3585 	inc	sp
   85DF D5            [11] 3586 	push	de
   85E0 33            [ 6] 3587 	inc	sp
   85E1 DD 66 FD      [19] 3588 	ld	h,-3 (ix)
   85E4 DD 6E FA      [19] 3589 	ld	l,-6 (ix)
   85E7 E5            [11] 3590 	push	hl
   85E8 CD AE 54      [17] 3591 	call	_pathFinding
   85EB 21 08 00      [10] 3592 	ld	hl,#8
   85EE 39            [11] 3593 	add	hl,sp
   85EF F9            [ 6] 3594 	ld	sp,hl
   85F0 C1            [10] 3595 	pop	bc
                           3596 ;src/main.c:849: dibujarEnemigo(actual);
   85F1 C5            [11] 3597 	push	bc
   85F2 C5            [11] 3598 	push	bc
   85F3 CD 0D 75      [17] 3599 	call	_dibujarEnemigo
   85F6 F1            [10] 3600 	pop	af
   85F7 C1            [10] 3601 	pop	bc
                           3602 ;src/main.c:851: ++actual;
   85F8 21 44 01      [10] 3603 	ld	hl,#0x0144
   85FB 09            [11] 3604 	add	hl,bc
   85FC 4D            [ 4] 3605 	ld	c,l
   85FD 44            [ 4] 3606 	ld	b,h
   85FE C3 24 85      [10] 3607 	jp	00101$
   8601                    3608 00104$:
   8601 DD F9         [10] 3609 	ld	sp, ix
   8603 DD E1         [14] 3610 	pop	ix
   8605 C9            [10] 3611 	ret
                           3612 ;src/main.c:855: void inicializarJuego() {
                           3613 ;	---------------------------------
                           3614 ; Function inicializarJuego
                           3615 ; ---------------------------------
   8606                    3616 _inicializarJuego::
                           3617 ;src/main.c:857: iter = 0;
   8606 21 E1 69      [10] 3618 	ld	hl,#_iter + 0
   8609 36 00         [10] 3619 	ld	(hl), #0x00
                           3620 ;src/main.c:858: num_mapa = 0;
   860B 21 E4 69      [10] 3621 	ld	hl,#_num_mapa + 0
   860E 36 00         [10] 3622 	ld	(hl), #0x00
                           3623 ;src/main.c:859: mapa = mapas[num_mapa];
   8610 21 82 72      [10] 3624 	ld	hl, #_mapas + 0
   8613 7E            [ 7] 3625 	ld	a,(hl)
   8614 FD 21 E2 69   [14] 3626 	ld	iy,#_mapa
   8618 FD 77 00      [19] 3627 	ld	0 (iy),a
   861B 23            [ 6] 3628 	inc	hl
   861C 7E            [ 7] 3629 	ld	a,(hl)
   861D 32 E3 69      [13] 3630 	ld	(#_mapa + 1),a
                           3631 ;src/main.c:860: cpct_etm_setTileset2x4(g_tileset);
   8620 21 E0 24      [10] 3632 	ld	hl,#_g_tileset
   8623 CD EA 59      [17] 3633 	call	_cpct_etm_setTileset2x4
                           3634 ;src/main.c:862: dibujarMapa();
   8626 CD 6C 72      [17] 3635 	call	_dibujarMapa
                           3636 ;src/main.c:864: borrarPantallaArriba(0, 0, 40, 1);
   8629 21 28 01      [10] 3637 	ld	hl,#0x0128
   862C E5            [11] 3638 	push	hl
   862D 21 00 00      [10] 3639 	ld	hl,#0x0000
   8630 E5            [11] 3640 	push	hl
   8631 CD BE 83      [17] 3641 	call	_borrarPantallaArriba
   8634 F1            [10] 3642 	pop	af
   8635 F1            [10] 3643 	pop	af
                           3644 ;src/main.c:865: barraPuntuacionInicial();
   8636 CD FC 82      [17] 3645 	call	_barraPuntuacionInicial
                           3646 ;src/main.c:868: prota.x = prota.px = 5;
   8639 21 D1 69      [10] 3647 	ld	hl,#(_prota + 0x0002)
   863C 36 05         [10] 3648 	ld	(hl),#0x05
   863E 21 CF 69      [10] 3649 	ld	hl,#_prota
   8641 36 05         [10] 3650 	ld	(hl),#0x05
                           3651 ;src/main.c:869: prota.y = prota.py = 76 + ORIGEN_MAPA_Y;
   8643 21 D2 69      [10] 3652 	ld	hl,#(_prota + 0x0003)
   8646 36 64         [10] 3653 	ld	(hl),#0x64
   8648 21 D0 69      [10] 3654 	ld	hl,#(_prota + 0x0001)
   864B 36 64         [10] 3655 	ld	(hl),#0x64
                           3656 ;src/main.c:870: prota.mover  = NO;
   864D 21 D5 69      [10] 3657 	ld	hl,#(_prota + 0x0006)
   8650 36 00         [10] 3658 	ld	(hl),#0x00
                           3659 ;src/main.c:871: prota.mira=M_derecha;
   8652 21 D6 69      [10] 3660 	ld	hl,#(_prota + 0x0007)
   8655 36 00         [10] 3661 	ld	(hl),#0x00
                           3662 ;src/main.c:872: prota.sprite = g_hero;
   8657 21 A8 4A      [10] 3663 	ld	hl,#_g_hero
   865A 22 D3 69      [16] 3664 	ld	((_prota + 0x0004)), hl
                           3665 ;src/main.c:876: cu.x = cu.px = 0;
   865D 21 D9 69      [10] 3666 	ld	hl,#(_cu + 0x0002)
   8660 36 00         [10] 3667 	ld	(hl),#0x00
   8662 21 D7 69      [10] 3668 	ld	hl,#_cu
   8665 36 00         [10] 3669 	ld	(hl),#0x00
                           3670 ;src/main.c:877: cu.y = cu.py = 0;
   8667 21 DA 69      [10] 3671 	ld	hl,#(_cu + 0x0003)
   866A 36 00         [10] 3672 	ld	(hl),#0x00
   866C 21 D8 69      [10] 3673 	ld	hl,#(_cu + 0x0001)
   866F 36 00         [10] 3674 	ld	(hl),#0x00
                           3675 ;src/main.c:878: cu.lanzado = NO;
   8671 21 DD 69      [10] 3676 	ld	hl,#(_cu + 0x0006)
   8674 36 00         [10] 3677 	ld	(hl),#0x00
                           3678 ;src/main.c:879: cu.mover = NO;
   8676 21 E0 69      [10] 3679 	ld	hl,#(_cu + 0x0009)
   8679 36 00         [10] 3680 	ld	(hl),#0x00
                           3681 ;src/main.c:881: inicializarEnemy();
   867B CD 10 85      [17] 3682 	call	_inicializarEnemy
                           3683 ;src/main.c:883: dibujarProta();
   867E C3 92 72      [10] 3684 	jp  _dibujarProta
                           3685 ;src/main.c:886: void main(void) {
                           3686 ;	---------------------------------
                           3687 ; Function main
                           3688 ; ---------------------------------
   8681                    3689 _main::
   8681 DD E5         [15] 3690 	push	ix
   8683 DD 21 00 00   [14] 3691 	ld	ix,#0
   8687 DD 39         [15] 3692 	add	ix,sp
   8689 3B            [ 6] 3693 	dec	sp
                           3694 ;src/main.c:891: inicializarCPC();
   868A CD ED 84      [17] 3695 	call	_inicializarCPC
                           3696 ;src/main.c:892: menuInicio();
   868D CD 11 84      [17] 3697 	call	_menuInicio
                           3698 ;src/main.c:894: inicializarJuego();
   8690 CD 06 86      [17] 3699 	call	_inicializarJuego
                           3700 ;src/main.c:895: cpct_akp_musicPlay();
   8693 CD 51 5B      [17] 3701 	call	_cpct_akp_musicPlay
                           3702 ;src/main.c:897: while (1) {
   8696                    3703 00119$:
                           3704 ;src/main.c:900: i = 1 + 1;
   8696 DD 36 FF 02   [19] 3705 	ld	-1 (ix),#0x02
                           3706 ;src/main.c:903: comprobarTeclado();
   869A CD F4 81      [17] 3707 	call	_comprobarTeclado
                           3708 ;src/main.c:904: moverCuchillo();
   869D CD 57 82      [17] 3709 	call	_moverCuchillo
                           3710 ;src/main.c:905: updateEnemies();
   86A0 CD 22 7E      [17] 3711 	call	_updateEnemies
                           3712 ;src/main.c:920: actual = enemy;
                           3713 ;src/main.c:922: cpct_waitVSYNC();
   86A3 CD 1B 5B      [17] 3714 	call	_cpct_waitVSYNC
                           3715 ;src/main.c:924: if (prota.mover) {
   86A6 01 D5 69      [10] 3716 	ld	bc,#_prota+6
   86A9 0A            [ 7] 3717 	ld	a,(bc)
   86AA B7            [ 4] 3718 	or	a, a
   86AB 28 07         [12] 3719 	jr	Z,00102$
                           3720 ;src/main.c:925: redibujarProta();
   86AD C5            [11] 3721 	push	bc
   86AE CD 63 73      [17] 3722 	call	_redibujarProta
   86B1 C1            [10] 3723 	pop	bc
                           3724 ;src/main.c:926: prota.mover = NO;
   86B2 AF            [ 4] 3725 	xor	a, a
   86B3 02            [ 7] 3726 	ld	(bc),a
   86B4                    3727 00102$:
                           3728 ;src/main.c:928: if(cu.lanzado && cu.mover){
   86B4 21 DD 69      [10] 3729 	ld	hl,#_cu + 6
   86B7 4E            [ 7] 3730 	ld	c,(hl)
   86B8 11 E0 69      [10] 3731 	ld	de,#_cu + 9
   86BB 79            [ 4] 3732 	ld	a,c
   86BC B7            [ 4] 3733 	or	a, a
   86BD 28 09         [12] 3734 	jr	Z,00107$
   86BF 1A            [ 7] 3735 	ld	a,(de)
   86C0 B7            [ 4] 3736 	or	a, a
   86C1 28 05         [12] 3737 	jr	Z,00107$
                           3738 ;src/main.c:929: redibujarCuchillo();
   86C3 CD C4 80      [17] 3739 	call	_redibujarCuchillo
   86C6 18 0B         [12] 3740 	jr	00132$
   86C8                    3741 00107$:
                           3742 ;src/main.c:930: }else if (cu.lanzado && !cu.mover){
   86C8 79            [ 4] 3743 	ld	a,c
   86C9 B7            [ 4] 3744 	or	a, a
   86CA 28 07         [12] 3745 	jr	Z,00132$
   86CC 1A            [ 7] 3746 	ld	a,(de)
   86CD B7            [ 4] 3747 	or	a, a
   86CE 20 03         [12] 3748 	jr	NZ,00132$
                           3749 ;src/main.c:931: borrarCuchillo();
   86D0 CD 46 80      [17] 3750 	call	_borrarCuchillo
                           3751 ;src/main.c:934: while(--i){
   86D3                    3752 00132$:
   86D3 01 BF 64      [10] 3753 	ld	bc,#_enemy
   86D6                    3754 00115$:
   86D6 DD 35 FF      [23] 3755 	dec	-1 (ix)
   86D9 DD 7E FF      [19] 3756 	ld	a, -1 (ix)
   86DC B7            [ 4] 3757 	or	a, a
   86DD 28 43         [12] 3758 	jr	Z,00117$
                           3759 ;src/main.c:935: if(actual->mover){
   86DF C5            [11] 3760 	push	bc
   86E0 FD E1         [14] 3761 	pop	iy
   86E2 FD 7E 06      [19] 3762 	ld	a,6 (iy)
   86E5 B7            [ 4] 3763 	or	a, a
   86E6 28 07         [12] 3764 	jr	Z,00111$
                           3765 ;src/main.c:936: redibujarEnemigo(actual);
   86E8 C5            [11] 3766 	push	bc
   86E9 C5            [11] 3767 	push	bc
   86EA CD 81 76      [17] 3768 	call	_redibujarEnemigo
   86ED F1            [10] 3769 	pop	af
   86EE C1            [10] 3770 	pop	bc
   86EF                    3771 00111$:
                           3772 ;src/main.c:938: if (actual->muerto && actual->muertes == 0){
   86EF C5            [11] 3773 	push	bc
   86F0 FD E1         [14] 3774 	pop	iy
   86F2 FD 7E 08      [19] 3775 	ld	a,8 (iy)
   86F5 B7            [ 4] 3776 	or	a, a
   86F6 28 22         [12] 3777 	jr	Z,00113$
   86F8 21 0A 00      [10] 3778 	ld	hl,#0x000A
   86FB 09            [11] 3779 	add	hl,bc
   86FC 7E            [ 7] 3780 	ld	a,(hl)
   86FD B7            [ 4] 3781 	or	a, a
   86FE 20 1A         [12] 3782 	jr	NZ,00113$
                           3783 ;src/main.c:939: borrarEnemigo(actual);
   8700 E5            [11] 3784 	push	hl
   8701 C5            [11] 3785 	push	bc
   8702 C5            [11] 3786 	push	bc
   8703 CD ED 75      [17] 3787 	call	_borrarEnemigo
   8706 F1            [10] 3788 	pop	af
   8707 C1            [10] 3789 	pop	bc
   8708 C5            [11] 3790 	push	bc
   8709 C5            [11] 3791 	push	bc
   870A CD 45 75      [17] 3792 	call	_dibujarExplosion
   870D F1            [10] 3793 	pop	af
   870E C1            [10] 3794 	pop	bc
   870F E1            [10] 3795 	pop	hl
                           3796 ;src/main.c:942: actual->muertes++;
   8710 5E            [ 7] 3797 	ld	e,(hl)
   8711 1C            [ 4] 3798 	inc	e
   8712 73            [ 7] 3799 	ld	(hl),e
                           3800 ;src/main.c:943: actual->x = 0;
   8713 AF            [ 4] 3801 	xor	a, a
   8714 02            [ 7] 3802 	ld	(bc),a
                           3803 ;src/main.c:944: actual->y = 0;
   8715 59            [ 4] 3804 	ld	e, c
   8716 50            [ 4] 3805 	ld	d, b
   8717 13            [ 6] 3806 	inc	de
   8718 AF            [ 4] 3807 	xor	a, a
   8719 12            [ 7] 3808 	ld	(de),a
   871A                    3809 00113$:
                           3810 ;src/main.c:946: ++actual;
   871A 21 44 01      [10] 3811 	ld	hl,#0x0144
   871D 09            [11] 3812 	add	hl,bc
   871E 4D            [ 4] 3813 	ld	c,l
   871F 44            [ 4] 3814 	ld	b,h
   8720 18 B4         [12] 3815 	jr	00115$
   8722                    3816 00117$:
                           3817 ;src/main.c:949: cpct_waitVSYNC();
   8722 CD 1B 5B      [17] 3818 	call	_cpct_waitVSYNC
   8725 C3 96 86      [10] 3819 	jp	00119$
   8728 33            [ 6] 3820 	inc	sp
   8729 DD E1         [14] 3821 	pop	ix
   872B C9            [10] 3822 	ret
                           3823 	.area _CODE
                           3824 	.area _INITIALIZER
                           3825 	.area _CABS (ABS)
   0F00                    3826 	.org 0x0F00
   0F00                    3827 _G_song:
   0F00 41                 3828 	.db #0x41	; 65	'A'
   0F01 54                 3829 	.db #0x54	; 84	'T'
   0F02 31                 3830 	.db #0x31	; 49	'1'
   0F03 30                 3831 	.db #0x30	; 48	'0'
   0F04 01                 3832 	.db #0x01	; 1
   0F05 40                 3833 	.db #0x40	; 64
   0F06 42                 3834 	.db #0x42	; 66	'B'
   0F07 0F                 3835 	.db #0x0F	; 15
   0F08 02                 3836 	.db #0x02	; 2
   0F09 06                 3837 	.db #0x06	; 6
   0F0A 1D                 3838 	.db #0x1D	; 29
   0F0B 00                 3839 	.db #0x00	; 0
   0F0C 10                 3840 	.db #0x10	; 16
   0F0D 40                 3841 	.db #0x40	; 64
   0F0E 19                 3842 	.db #0x19	; 25
   0F0F 40                 3843 	.db #0x40	; 64
   0F10 00                 3844 	.db #0x00	; 0
   0F11 00                 3845 	.db #0x00	; 0
   0F12 00                 3846 	.db #0x00	; 0
   0F13 00                 3847 	.db #0x00	; 0
   0F14 00                 3848 	.db #0x00	; 0
   0F15 00                 3849 	.db #0x00	; 0
   0F16 0D                 3850 	.db #0x0D	; 13
   0F17 12                 3851 	.db #0x12	; 18
   0F18 40                 3852 	.db #0x40	; 64
   0F19 01                 3853 	.db #0x01	; 1
   0F1A 00                 3854 	.db #0x00	; 0
   0F1B 7C                 3855 	.db #0x7C	; 124
   0F1C 18                 3856 	.db #0x18	; 24
   0F1D 78                 3857 	.db #0x78	; 120	'x'
   0F1E 0C                 3858 	.db #0x0C	; 12
   0F1F 34                 3859 	.db #0x34	; 52	'4'
   0F20 30                 3860 	.db #0x30	; 48	'0'
   0F21 2C                 3861 	.db #0x2C	; 44
   0F22 28                 3862 	.db #0x28	; 40
   0F23 24                 3863 	.db #0x24	; 36
   0F24 20                 3864 	.db #0x20	; 32
   0F25 1C                 3865 	.db #0x1C	; 28
   0F26 0D                 3866 	.db #0x0D	; 13
   0F27 25                 3867 	.db #0x25	; 37
   0F28 40                 3868 	.db #0x40	; 64
   0F29 20                 3869 	.db #0x20	; 32
   0F2A 00                 3870 	.db #0x00	; 0
   0F2B 00                 3871 	.db #0x00	; 0
   0F2C 00                 3872 	.db #0x00	; 0
   0F2D 39                 3873 	.db #0x39	; 57	'9'
   0F2E 40                 3874 	.db #0x40	; 64
   0F2F 00                 3875 	.db #0x00	; 0
   0F30 57                 3876 	.db #0x57	; 87	'W'
   0F31 40                 3877 	.db #0x40	; 64
   0F32 3B                 3878 	.db #0x3B	; 59
   0F33 40                 3879 	.db #0x40	; 64
   0F34 57                 3880 	.db #0x57	; 87	'W'
   0F35 40                 3881 	.db #0x40	; 64
   0F36 01                 3882 	.db #0x01	; 1
   0F37 2F                 3883 	.db #0x2F	; 47
   0F38 40                 3884 	.db #0x40	; 64
   0F39 19                 3885 	.db #0x19	; 25
   0F3A 00                 3886 	.db #0x00	; 0
   0F3B 76                 3887 	.db #0x76	; 118	'v'
   0F3C E1                 3888 	.db #0xE1	; 225
   0F3D 00                 3889 	.db #0x00	; 0
   0F3E 00                 3890 	.db #0x00	; 0
   0F3F 01                 3891 	.db #0x01	; 1
   0F40 04                 3892 	.db #0x04	; 4
   0F41 51                 3893 	.db #0x51	; 81	'Q'
   0F42 04                 3894 	.db #0x04	; 4
   0F43 37                 3895 	.db #0x37	; 55	'7'
   0F44 04                 3896 	.db #0x04	; 4
   0F45 4F                 3897 	.db #0x4F	; 79	'O'
   0F46 04                 3898 	.db #0x04	; 4
   0F47 37                 3899 	.db #0x37	; 55	'7'
   0F48 02                 3900 	.db #0x02	; 2
   0F49 4B                 3901 	.db #0x4B	; 75	'K'
   0F4A 02                 3902 	.db #0x02	; 2
   0F4B 37                 3903 	.db #0x37	; 55	'7'
   0F4C 04                 3904 	.db #0x04	; 4
   0F4D 4F                 3905 	.db #0x4F	; 79	'O'
   0F4E 04                 3906 	.db #0x04	; 4
   0F4F 37                 3907 	.db #0x37	; 55	'7'
   0F50 04                 3908 	.db #0x04	; 4
   0F51 4F                 3909 	.db #0x4F	; 79	'O'
   0F52 04                 3910 	.db #0x04	; 4
   0F53 37                 3911 	.db #0x37	; 55	'7'
   0F54 02                 3912 	.db #0x02	; 2
   0F55 4B                 3913 	.db #0x4B	; 75	'K'
   0F56 00                 3914 	.db #0x00	; 0
   0F57 42                 3915 	.db #0x42	; 66	'B'
   0F58 60                 3916 	.db #0x60	; 96
   0F59 00                 3917 	.db #0x00	; 0
   0F5A 42                 3918 	.db #0x42	; 66	'B'
   0F5B 80                 3919 	.db #0x80	; 128
   0F5C 00                 3920 	.db #0x00	; 0
   0F5D 00                 3921 	.db #0x00	; 0
   0F5E 42                 3922 	.db #0x42	; 66	'B'
   0F5F 00                 3923 	.db #0x00	; 0
   0F60 00                 3924 	.db #0x00	; 0
