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
                             31 	.globl _moverEnemigo
                             32 	.globl _moverEnemigoIzquierda
                             33 	.globl _moverEnemigoDerecha
                             34 	.globl _moverEnemigoAbajo
                             35 	.globl _moverEnemigoArriba
                             36 	.globl _checkEnemyCollision
                             37 	.globl _redibujarEnemigo
                             38 	.globl _borrarEnemigo
                             39 	.globl _borrarExplosion
                             40 	.globl _dibujarExplosion
                             41 	.globl _dibujarEnemigo
                             42 	.globl _checkCollision
                             43 	.globl _getTilePtr
                             44 	.globl _redibujarProta
                             45 	.globl _menuFin
                             46 	.globl _borrarProta
                             47 	.globl _dibujarProta
                             48 	.globl _dibujarMapa
                             49 	.globl _pathFinding
                             50 	.globl _cpct_etm_setTileset2x4
                             51 	.globl _cpct_etm_drawTileBox2x4
                             52 	.globl _cpct_akp_musicPlay
                             53 	.globl _cpct_akp_musicInit
                             54 	.globl _cpct_getScreenPtr
                             55 	.globl _cpct_setPALColour
                             56 	.globl _cpct_setPalette
                             57 	.globl _cpct_waitVSYNC
                             58 	.globl _cpct_setVideoMode
                             59 	.globl _cpct_drawStringM0
                             60 	.globl _cpct_drawSpriteMaskedAlignedTable
                             61 	.globl _cpct_drawSolidBox
                             62 	.globl _cpct_drawSprite
                             63 	.globl _cpct_isAnyKeyPressed
                             64 	.globl _cpct_isKeyPressed
                             65 	.globl _cpct_scanKeyboard_if
                             66 	.globl _cpct_scanKeyboard_f
                             67 	.globl _cpct_memset
                             68 	.globl _cpct_disableFirmware
                             69 	.globl _num_mapa
                             70 	.globl _mapa
                             71 	.globl _iter
                             72 	.globl _cu
                             73 	.globl _prota
                             74 	.globl _enemy
                             75 	.globl _EEje
                             76 	.globl _EMirar
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
   64F6                      87 _EMirar::
   64F6                      88 	.ds 1
   64F7                      89 _EEje::
   64F7                      90 	.ds 1
   64F8                      91 _enemy::
   64F8                      92 	.ds 1256
   69E0                      93 _prota::
   69E0                      94 	.ds 8
   69E8                      95 _cu::
   69E8                      96 	.ds 10
   69F2                      97 _iter::
   69F2                      98 	.ds 1
   69F3                      99 _mapa::
   69F3                     100 	.ds 2
   69F5                     101 _num_mapa::
   69F5                     102 	.ds 1
                            103 ;--------------------------------------------------------
                            104 ; ram data
                            105 ;--------------------------------------------------------
                            106 	.area _INITIALIZED
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
                            127 ;src/main.c:109: cpctm_createTransparentMaskTable(g_tablatrans, 0x0E00, M0, 0); // es el color 8 - 4D - FF00FF
                            128 ;	---------------------------------
                            129 ; Function dummy_cpct_transparentMaskTable0M0_container
                            130 ; ---------------------------------
   4B42                     131 _dummy_cpct_transparentMaskTable0M0_container::
                            132 	.area _g_tablatrans_ (ABS) 
   0E00                     133 	.org 0x0E00 
   0E00                     134 	 _g_tablatrans::
   0E00 FF AA 55 00 AA AA   135 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0E08 55 00 55 00 00 00   136 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E10 AA AA 00 00 AA AA   137 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0E18 00 00 00 00 00 00   138 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E20 55 00 55 00 00 00   139 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E28 55 00 55 00 00 00   140 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E30 00 00 00 00 00 00   141 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E38 00 00 00 00 00 00   142 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E40 AA AA 00 00 AA AA   143 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0E48 00 00 00 00 00 00   144 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E50 AA AA 00 00 AA AA   145 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0E58 00 00 00 00 00 00   146 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E60 00 00 00 00 00 00   147 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E68 00 00 00 00 00 00   148 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E70 00 00 00 00 00 00   149 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E78 00 00 00 00 00 00   150 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E80 55 00 55 00 00 00   151 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E88 55 00 55 00 00 00   152 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E90 00 00 00 00 00 00   153 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0E98 00 00 00 00 00 00   154 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EA0 55 00 55 00 00 00   155 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EA8 55 00 55 00 00 00   156 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EB0 00 00 00 00 00 00   157 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EB8 00 00 00 00 00 00   158 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EC0 00 00 00 00 00 00   159 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EC8 00 00 00 00 00 00   160 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0ED0 00 00 00 00 00 00   161 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0ED8 00 00 00 00 00 00   162 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EE0 00 00 00 00 00 00   163 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EE8 00 00 00 00 00 00   164 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EF0 00 00 00 00 00 00   165 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0EF8 00 00 00 00 00 00   166 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            167 	.area _CSEG (REL, CON) 
                            168 ;src/main.c:112: void dibujarMapa() {
                            169 ;	---------------------------------
                            170 ; Function dibujarMapa
                            171 ; ---------------------------------
   727D                     172 _dibujarMapa::
                            173 ;src/main.c:113: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   727D 2A F3 69      [16]  174 	ld	hl,(_mapa)
   7280 E5            [11]  175 	push	hl
   7281 21 F0 C0      [10]  176 	ld	hl,#0xC0F0
   7284 E5            [11]  177 	push	hl
   7285 21 2C 28      [10]  178 	ld	hl,#0x282C
   7288 E5            [11]  179 	push	hl
   7289 2E 00         [ 7]  180 	ld	l, #0x00
   728B E5            [11]  181 	push	hl
   728C AF            [ 4]  182 	xor	a, a
   728D F5            [11]  183 	push	af
   728E 33            [ 6]  184 	inc	sp
   728F CD 3C 59      [17]  185 	call	_cpct_etm_drawTileBox2x4
   7292 C9            [10]  186 	ret
   7293                     187 _mapas:
   7293 C0 1D               188 	.dw _g_map1
   7295 E0 16               189 	.dw _g_map2
   7297 00 10               190 	.dw _g_map3
   7299                     191 _spawnX:
   7299 00                  192 	.db #0x00	; 0
   729A 3C                  193 	.db #0x3C	; 60
   729B 47                  194 	.db #0x47	; 71	'G'
   729C 14                  195 	.db #0x14	; 20
   729D 3C                  196 	.db #0x3C	; 60
   729E                     197 _spawnY:
   729E 00                  198 	.db #0x00	; 0
   729F 2C                  199 	.db #0x2C	; 44
   72A0 72                  200 	.db #0x72	; 114	'r'
   72A1 8A                  201 	.db #0x8A	; 138
   72A2 8A                  202 	.db #0x8A	; 138
                            203 ;src/main.c:116: void dibujarProta() {
                            204 ;	---------------------------------
                            205 ; Function dibujarProta
                            206 ; ---------------------------------
   72A3                     207 _dibujarProta::
                            208 ;src/main.c:117: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   72A3 21 E1 69      [10]  209 	ld	hl, #_prota + 1
   72A6 56            [ 7]  210 	ld	d,(hl)
   72A7 21 E0 69      [10]  211 	ld	hl, #_prota + 0
   72AA 46            [ 7]  212 	ld	b,(hl)
   72AB D5            [11]  213 	push	de
   72AC 33            [ 6]  214 	inc	sp
   72AD C5            [11]  215 	push	bc
   72AE 33            [ 6]  216 	inc	sp
   72AF 21 00 C0      [10]  217 	ld	hl,#0xC000
   72B2 E5            [11]  218 	push	hl
   72B3 CD 9B 64      [17]  219 	call	_cpct_getScreenPtr
   72B6 EB            [ 4]  220 	ex	de,hl
                            221 ;src/main.c:118: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   72B7 ED 4B E4 69   [20]  222 	ld	bc, (#_prota + 4)
   72BB 21 00 0E      [10]  223 	ld	hl,#_g_tablatrans
   72BE E5            [11]  224 	push	hl
   72BF 21 07 16      [10]  225 	ld	hl,#0x1607
   72C2 E5            [11]  226 	push	hl
   72C3 D5            [11]  227 	push	de
   72C4 C5            [11]  228 	push	bc
   72C5 CD BB 64      [17]  229 	call	_cpct_drawSpriteMaskedAlignedTable
   72C8 C9            [10]  230 	ret
                            231 ;src/main.c:121: void borrarProta() {
                            232 ;	---------------------------------
                            233 ; Function borrarProta
                            234 ; ---------------------------------
   72C9                     235 _borrarProta::
   72C9 DD E5         [15]  236 	push	ix
   72CB DD 21 00 00   [14]  237 	ld	ix,#0
   72CF DD 39         [15]  238 	add	ix,sp
   72D1 F5            [11]  239 	push	af
   72D2 3B            [ 6]  240 	dec	sp
                            241 ;src/main.c:123: u8 w = 4 + (prota.px & 1);
   72D3 21 E2 69      [10]  242 	ld	hl, #_prota + 2
   72D6 4E            [ 7]  243 	ld	c,(hl)
   72D7 79            [ 4]  244 	ld	a,c
   72D8 E6 01         [ 7]  245 	and	a, #0x01
   72DA 47            [ 4]  246 	ld	b,a
   72DB 04            [ 4]  247 	inc	b
   72DC 04            [ 4]  248 	inc	b
   72DD 04            [ 4]  249 	inc	b
   72DE 04            [ 4]  250 	inc	b
                            251 ;src/main.c:126: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   72DF 21 E3 69      [10]  252 	ld	hl, #_prota + 3
   72E2 5E            [ 7]  253 	ld	e,(hl)
   72E3 CB 4B         [ 8]  254 	bit	1, e
   72E5 28 04         [12]  255 	jr	Z,00103$
   72E7 3E 01         [ 7]  256 	ld	a,#0x01
   72E9 18 02         [12]  257 	jr	00104$
   72EB                     258 00103$:
   72EB 3E 00         [ 7]  259 	ld	a,#0x00
   72ED                     260 00104$:
   72ED C6 06         [ 7]  261 	add	a, #0x06
   72EF DD 77 FD      [19]  262 	ld	-3 (ix),a
                            263 ;src/main.c:128: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   72F2 FD 2A F3 69   [20]  264 	ld	iy,(_mapa)
   72F6 16 00         [ 7]  265 	ld	d,#0x00
   72F8 7B            [ 4]  266 	ld	a,e
   72F9 C6 E8         [ 7]  267 	add	a,#0xE8
   72FB DD 77 FE      [19]  268 	ld	-2 (ix),a
   72FE 7A            [ 4]  269 	ld	a,d
   72FF CE FF         [ 7]  270 	adc	a,#0xFF
   7301 DD 77 FF      [19]  271 	ld	-1 (ix),a
   7304 DD 6E FE      [19]  272 	ld	l,-2 (ix)
   7307 DD 66 FF      [19]  273 	ld	h,-1 (ix)
   730A DD CB FF 7E   [20]  274 	bit	7, -1 (ix)
   730E 28 04         [12]  275 	jr	Z,00105$
   7310 21 EB FF      [10]  276 	ld	hl,#0xFFEB
   7313 19            [11]  277 	add	hl,de
   7314                     278 00105$:
   7314 CB 2C         [ 8]  279 	sra	h
   7316 CB 1D         [ 8]  280 	rr	l
   7318 CB 2C         [ 8]  281 	sra	h
   731A CB 1D         [ 8]  282 	rr	l
   731C 55            [ 4]  283 	ld	d,l
   731D CB 39         [ 8]  284 	srl	c
   731F FD E5         [15]  285 	push	iy
   7321 21 F0 C0      [10]  286 	ld	hl,#0xC0F0
   7324 E5            [11]  287 	push	hl
   7325 3E 28         [ 7]  288 	ld	a,#0x28
   7327 F5            [11]  289 	push	af
   7328 33            [ 6]  290 	inc	sp
   7329 DD 7E FD      [19]  291 	ld	a,-3 (ix)
   732C F5            [11]  292 	push	af
   732D 33            [ 6]  293 	inc	sp
   732E C5            [11]  294 	push	bc
   732F 33            [ 6]  295 	inc	sp
   7330 D5            [11]  296 	push	de
   7331 33            [ 6]  297 	inc	sp
   7332 79            [ 4]  298 	ld	a,c
   7333 F5            [11]  299 	push	af
   7334 33            [ 6]  300 	inc	sp
   7335 CD 3C 59      [17]  301 	call	_cpct_etm_drawTileBox2x4
   7338 DD F9         [10]  302 	ld	sp, ix
   733A DD E1         [14]  303 	pop	ix
   733C C9            [10]  304 	ret
                            305 ;src/main.c:131: void menuFin(){
                            306 ;	---------------------------------
                            307 ; Function menuFin
                            308 ; ---------------------------------
   733D                     309 _menuFin::
                            310 ;src/main.c:134: cpct_clearScreen(0);
   733D 21 00 40      [10]  311 	ld	hl,#0x4000
   7340 E5            [11]  312 	push	hl
   7341 AF            [ 4]  313 	xor	a, a
   7342 F5            [11]  314 	push	af
   7343 33            [ 6]  315 	inc	sp
   7344 26 C0         [ 7]  316 	ld	h, #0xC0
   7346 E5            [11]  317 	push	hl
   7347 CD 7A 5B      [17]  318 	call	_cpct_memset
                            319 ;src/main.c:136: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   734A 21 18 5A      [10]  320 	ld	hl,#0x5A18
   734D E5            [11]  321 	push	hl
   734E 21 00 C0      [10]  322 	ld	hl,#0xC000
   7351 E5            [11]  323 	push	hl
   7352 CD 9B 64      [17]  324 	call	_cpct_getScreenPtr
   7355 4D            [ 4]  325 	ld	c,l
   7356 44            [ 4]  326 	ld	b,h
                            327 ;src/main.c:137: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   7357 21 02 00      [10]  328 	ld	hl,#0x0002
   735A E5            [11]  329 	push	hl
   735B C5            [11]  330 	push	bc
   735C 21 6A 73      [10]  331 	ld	hl,#___str_0
   735F E5            [11]  332 	push	hl
   7360 CD 73 58      [17]  333 	call	_cpct_drawStringM0
   7363 21 06 00      [10]  334 	ld	hl,#6
   7366 39            [11]  335 	add	hl,sp
   7367 F9            [ 6]  336 	ld	sp,hl
                            337 ;src/main.c:139: while(1){}
   7368                     338 00102$:
   7368 18 FE         [12]  339 	jr	00102$
   736A                     340 ___str_0:
   736A 47 41 4D 45 20 4F   341 	.ascii "GAME OVER"
        56 45 52
   7373 00                  342 	.db 0x00
                            343 ;src/main.c:142: void redibujarProta() {
                            344 ;	---------------------------------
                            345 ; Function redibujarProta
                            346 ; ---------------------------------
   7374                     347 _redibujarProta::
                            348 ;src/main.c:143: borrarProta();
   7374 CD C9 72      [17]  349 	call	_borrarProta
                            350 ;src/main.c:144: prota.px = prota.x;
   7377 01 E2 69      [10]  351 	ld	bc,#_prota + 2
   737A 3A E0 69      [13]  352 	ld	a, (#_prota + 0)
   737D 02            [ 7]  353 	ld	(bc),a
                            354 ;src/main.c:145: prota.py = prota.y;
   737E 01 E3 69      [10]  355 	ld	bc,#_prota + 3
   7381 3A E1 69      [13]  356 	ld	a, (#_prota + 1)
   7384 02            [ 7]  357 	ld	(bc),a
                            358 ;src/main.c:146: dibujarProta();
   7385 C3 A3 72      [10]  359 	jp  _dibujarProta
                            360 ;src/main.c:149: u8* getTilePtr(u8 x, u8 y) {
                            361 ;	---------------------------------
                            362 ; Function getTilePtr
                            363 ; ---------------------------------
   7388                     364 _getTilePtr::
   7388 DD E5         [15]  365 	push	ix
   738A DD 21 00 00   [14]  366 	ld	ix,#0
   738E DD 39         [15]  367 	add	ix,sp
                            368 ;src/main.c:150: return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
   7390 DD 4E 05      [19]  369 	ld	c,5 (ix)
   7393 06 00         [ 7]  370 	ld	b,#0x00
   7395 79            [ 4]  371 	ld	a,c
   7396 C6 E8         [ 7]  372 	add	a,#0xE8
   7398 5F            [ 4]  373 	ld	e,a
   7399 78            [ 4]  374 	ld	a,b
   739A CE FF         [ 7]  375 	adc	a,#0xFF
   739C 57            [ 4]  376 	ld	d,a
   739D 6B            [ 4]  377 	ld	l, e
   739E 62            [ 4]  378 	ld	h, d
   739F CB 7A         [ 8]  379 	bit	7, d
   73A1 28 04         [12]  380 	jr	Z,00103$
   73A3 21 EB FF      [10]  381 	ld	hl,#0xFFEB
   73A6 09            [11]  382 	add	hl,bc
   73A7                     383 00103$:
   73A7 CB 2C         [ 8]  384 	sra	h
   73A9 CB 1D         [ 8]  385 	rr	l
   73AB CB 2C         [ 8]  386 	sra	h
   73AD CB 1D         [ 8]  387 	rr	l
   73AF 4D            [ 4]  388 	ld	c, l
   73B0 44            [ 4]  389 	ld	b, h
   73B1 29            [11]  390 	add	hl, hl
   73B2 29            [11]  391 	add	hl, hl
   73B3 09            [11]  392 	add	hl, bc
   73B4 29            [11]  393 	add	hl, hl
   73B5 29            [11]  394 	add	hl, hl
   73B6 29            [11]  395 	add	hl, hl
   73B7 4D            [ 4]  396 	ld	c,l
   73B8 44            [ 4]  397 	ld	b,h
   73B9 2A F3 69      [16]  398 	ld	hl,(_mapa)
   73BC 09            [11]  399 	add	hl,bc
   73BD DD 4E 04      [19]  400 	ld	c,4 (ix)
   73C0 CB 39         [ 8]  401 	srl	c
   73C2 59            [ 4]  402 	ld	e,c
   73C3 16 00         [ 7]  403 	ld	d,#0x00
   73C5 19            [11]  404 	add	hl,de
   73C6 DD E1         [14]  405 	pop	ix
   73C8 C9            [10]  406 	ret
                            407 ;src/main.c:153: u8 checkCollision(int direction) { // check optimization
                            408 ;	---------------------------------
                            409 ; Function checkCollision
                            410 ; ---------------------------------
   73C9                     411 _checkCollision::
   73C9 DD E5         [15]  412 	push	ix
   73CB DD 21 00 00   [14]  413 	ld	ix,#0
   73CF DD 39         [15]  414 	add	ix,sp
   73D1 F5            [11]  415 	push	af
                            416 ;src/main.c:154: u8 *headTile=0, *feetTile=0, *waistTile=0;
   73D2 21 00 00      [10]  417 	ld	hl,#0x0000
   73D5 E3            [19]  418 	ex	(sp), hl
   73D6 11 00 00      [10]  419 	ld	de,#0x0000
   73D9 01 00 00      [10]  420 	ld	bc,#0x0000
                            421 ;src/main.c:156: switch (direction) {
   73DC DD CB 05 7E   [20]  422 	bit	7, 5 (ix)
   73E0 C2 FD 74      [10]  423 	jp	NZ,00105$
   73E3 3E 03         [ 7]  424 	ld	a,#0x03
   73E5 DD BE 04      [19]  425 	cp	a, 4 (ix)
   73E8 3E 00         [ 7]  426 	ld	a,#0x00
   73EA DD 9E 05      [19]  427 	sbc	a, 5 (ix)
   73ED E2 F2 73      [10]  428 	jp	PO, 00128$
   73F0 EE 80         [ 7]  429 	xor	a, #0x80
   73F2                     430 00128$:
   73F2 FA FD 74      [10]  431 	jp	M,00105$
   73F5 DD 5E 04      [19]  432 	ld	e,4 (ix)
   73F8 16 00         [ 7]  433 	ld	d,#0x00
   73FA 21 01 74      [10]  434 	ld	hl,#00129$
   73FD 19            [11]  435 	add	hl,de
   73FE 19            [11]  436 	add	hl,de
   73FF 19            [11]  437 	add	hl,de
   7400 E9            [ 4]  438 	jp	(hl)
   7401                     439 00129$:
   7401 C3 0D 74      [10]  440 	jp	00101$
   7404 C3 58 74      [10]  441 	jp	00102$
   7407 C3 99 74      [10]  442 	jp	00103$
   740A C3 CC 74      [10]  443 	jp	00104$
                            444 ;src/main.c:157: case 0:
   740D                     445 00101$:
                            446 ;src/main.c:158: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   740D 21 E1 69      [10]  447 	ld	hl, #(_prota + 0x0001) + 0
   7410 5E            [ 7]  448 	ld	e,(hl)
   7411 21 E0 69      [10]  449 	ld	hl, #_prota + 0
   7414 4E            [ 7]  450 	ld	c,(hl)
   7415 0C            [ 4]  451 	inc	c
   7416 0C            [ 4]  452 	inc	c
   7417 0C            [ 4]  453 	inc	c
   7418 0C            [ 4]  454 	inc	c
   7419 7B            [ 4]  455 	ld	a,e
   741A F5            [11]  456 	push	af
   741B 33            [ 6]  457 	inc	sp
   741C 79            [ 4]  458 	ld	a,c
   741D F5            [11]  459 	push	af
   741E 33            [ 6]  460 	inc	sp
   741F CD 88 73      [17]  461 	call	_getTilePtr
   7422 F1            [10]  462 	pop	af
   7423 33            [ 6]  463 	inc	sp
   7424 33            [ 6]  464 	inc	sp
   7425 E5            [11]  465 	push	hl
                            466 ;src/main.c:159: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   7426 3A E1 69      [13]  467 	ld	a, (#(_prota + 0x0001) + 0)
   7429 C6 14         [ 7]  468 	add	a, #0x14
   742B 4F            [ 4]  469 	ld	c,a
   742C 21 E0 69      [10]  470 	ld	hl, #_prota + 0
   742F 46            [ 7]  471 	ld	b,(hl)
   7430 04            [ 4]  472 	inc	b
   7431 04            [ 4]  473 	inc	b
   7432 04            [ 4]  474 	inc	b
   7433 04            [ 4]  475 	inc	b
   7434 79            [ 4]  476 	ld	a,c
   7435 F5            [11]  477 	push	af
   7436 33            [ 6]  478 	inc	sp
   7437 C5            [11]  479 	push	bc
   7438 33            [ 6]  480 	inc	sp
   7439 CD 88 73      [17]  481 	call	_getTilePtr
   743C F1            [10]  482 	pop	af
   743D EB            [ 4]  483 	ex	de,hl
                            484 ;src/main.c:160: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   743E 3A E1 69      [13]  485 	ld	a, (#(_prota + 0x0001) + 0)
   7441 C6 0B         [ 7]  486 	add	a, #0x0B
   7443 47            [ 4]  487 	ld	b,a
   7444 3A E0 69      [13]  488 	ld	a, (#_prota + 0)
   7447 C6 04         [ 7]  489 	add	a, #0x04
   7449 D5            [11]  490 	push	de
   744A C5            [11]  491 	push	bc
   744B 33            [ 6]  492 	inc	sp
   744C F5            [11]  493 	push	af
   744D 33            [ 6]  494 	inc	sp
   744E CD 88 73      [17]  495 	call	_getTilePtr
   7451 F1            [10]  496 	pop	af
   7452 4D            [ 4]  497 	ld	c,l
   7453 44            [ 4]  498 	ld	b,h
   7454 D1            [10]  499 	pop	de
                            500 ;src/main.c:161: break;
   7455 C3 FD 74      [10]  501 	jp	00105$
                            502 ;src/main.c:162: case 1:
   7458                     503 00102$:
                            504 ;src/main.c:163: headTile  = getTilePtr(prota.x - 1, prota.y);
   7458 21 E1 69      [10]  505 	ld	hl, #(_prota + 0x0001) + 0
   745B 56            [ 7]  506 	ld	d,(hl)
   745C 21 E0 69      [10]  507 	ld	hl, #_prota + 0
   745F 46            [ 7]  508 	ld	b,(hl)
   7460 05            [ 4]  509 	dec	b
   7461 D5            [11]  510 	push	de
   7462 33            [ 6]  511 	inc	sp
   7463 C5            [11]  512 	push	bc
   7464 33            [ 6]  513 	inc	sp
   7465 CD 88 73      [17]  514 	call	_getTilePtr
   7468 F1            [10]  515 	pop	af
   7469 33            [ 6]  516 	inc	sp
   746A 33            [ 6]  517 	inc	sp
   746B E5            [11]  518 	push	hl
                            519 ;src/main.c:164: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
   746C 3A E1 69      [13]  520 	ld	a, (#(_prota + 0x0001) + 0)
   746F C6 14         [ 7]  521 	add	a, #0x14
   7471 57            [ 4]  522 	ld	d,a
   7472 21 E0 69      [10]  523 	ld	hl, #_prota + 0
   7475 46            [ 7]  524 	ld	b,(hl)
   7476 05            [ 4]  525 	dec	b
   7477 D5            [11]  526 	push	de
   7478 33            [ 6]  527 	inc	sp
   7479 C5            [11]  528 	push	bc
   747A 33            [ 6]  529 	inc	sp
   747B CD 88 73      [17]  530 	call	_getTilePtr
   747E F1            [10]  531 	pop	af
   747F EB            [ 4]  532 	ex	de,hl
                            533 ;src/main.c:165: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
   7480 3A E1 69      [13]  534 	ld	a, (#(_prota + 0x0001) + 0)
   7483 C6 0B         [ 7]  535 	add	a, #0x0B
   7485 47            [ 4]  536 	ld	b,a
   7486 3A E0 69      [13]  537 	ld	a, (#_prota + 0)
   7489 C6 FF         [ 7]  538 	add	a,#0xFF
   748B D5            [11]  539 	push	de
   748C C5            [11]  540 	push	bc
   748D 33            [ 6]  541 	inc	sp
   748E F5            [11]  542 	push	af
   748F 33            [ 6]  543 	inc	sp
   7490 CD 88 73      [17]  544 	call	_getTilePtr
   7493 F1            [10]  545 	pop	af
   7494 4D            [ 4]  546 	ld	c,l
   7495 44            [ 4]  547 	ld	b,h
   7496 D1            [10]  548 	pop	de
                            549 ;src/main.c:166: break;
   7497 18 64         [12]  550 	jr	00105$
                            551 ;src/main.c:167: case 2:
   7499                     552 00103$:
                            553 ;src/main.c:168: headTile   = getTilePtr(prota.x, prota.y - 2);
   7499 3A E1 69      [13]  554 	ld	a, (#(_prota + 0x0001) + 0)
   749C C6 FE         [ 7]  555 	add	a,#0xFE
   749E 21 E0 69      [10]  556 	ld	hl, #_prota + 0
   74A1 56            [ 7]  557 	ld	d,(hl)
   74A2 C5            [11]  558 	push	bc
   74A3 F5            [11]  559 	push	af
   74A4 33            [ 6]  560 	inc	sp
   74A5 D5            [11]  561 	push	de
   74A6 33            [ 6]  562 	inc	sp
   74A7 CD 88 73      [17]  563 	call	_getTilePtr
   74AA F1            [10]  564 	pop	af
   74AB C1            [10]  565 	pop	bc
   74AC 33            [ 6]  566 	inc	sp
   74AD 33            [ 6]  567 	inc	sp
   74AE E5            [11]  568 	push	hl
                            569 ;src/main.c:169: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
   74AF 21 E1 69      [10]  570 	ld	hl, #(_prota + 0x0001) + 0
   74B2 56            [ 7]  571 	ld	d,(hl)
   74B3 15            [ 4]  572 	dec	d
   74B4 15            [ 4]  573 	dec	d
   74B5 3A E0 69      [13]  574 	ld	a, (#_prota + 0)
   74B8 C6 03         [ 7]  575 	add	a, #0x03
   74BA C5            [11]  576 	push	bc
   74BB D5            [11]  577 	push	de
   74BC 33            [ 6]  578 	inc	sp
   74BD F5            [11]  579 	push	af
   74BE 33            [ 6]  580 	inc	sp
   74BF CD 88 73      [17]  581 	call	_getTilePtr
   74C2 F1            [10]  582 	pop	af
   74C3 EB            [ 4]  583 	ex	de,hl
   74C4 C1            [10]  584 	pop	bc
                            585 ;src/main.c:170: *waistTile = 0;
   74C5 21 00 00      [10]  586 	ld	hl,#0x0000
   74C8 36 00         [10]  587 	ld	(hl),#0x00
                            588 ;src/main.c:171: break;
   74CA 18 31         [12]  589 	jr	00105$
                            590 ;src/main.c:172: case 3:
   74CC                     591 00104$:
                            592 ;src/main.c:173: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
   74CC 3A E1 69      [13]  593 	ld	a, (#(_prota + 0x0001) + 0)
   74CF C6 16         [ 7]  594 	add	a, #0x16
   74D1 21 E0 69      [10]  595 	ld	hl, #_prota + 0
   74D4 56            [ 7]  596 	ld	d,(hl)
   74D5 C5            [11]  597 	push	bc
   74D6 F5            [11]  598 	push	af
   74D7 33            [ 6]  599 	inc	sp
   74D8 D5            [11]  600 	push	de
   74D9 33            [ 6]  601 	inc	sp
   74DA CD 88 73      [17]  602 	call	_getTilePtr
   74DD F1            [10]  603 	pop	af
   74DE C1            [10]  604 	pop	bc
   74DF 33            [ 6]  605 	inc	sp
   74E0 33            [ 6]  606 	inc	sp
   74E1 E5            [11]  607 	push	hl
                            608 ;src/main.c:174: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   74E2 3A E1 69      [13]  609 	ld	a, (#(_prota + 0x0001) + 0)
   74E5 C6 16         [ 7]  610 	add	a, #0x16
   74E7 57            [ 4]  611 	ld	d,a
   74E8 3A E0 69      [13]  612 	ld	a, (#_prota + 0)
   74EB C6 03         [ 7]  613 	add	a, #0x03
   74ED C5            [11]  614 	push	bc
   74EE D5            [11]  615 	push	de
   74EF 33            [ 6]  616 	inc	sp
   74F0 F5            [11]  617 	push	af
   74F1 33            [ 6]  618 	inc	sp
   74F2 CD 88 73      [17]  619 	call	_getTilePtr
   74F5 F1            [10]  620 	pop	af
   74F6 EB            [ 4]  621 	ex	de,hl
   74F7 C1            [10]  622 	pop	bc
                            623 ;src/main.c:175: *waistTile = 0;
   74F8 21 00 00      [10]  624 	ld	hl,#0x0000
   74FB 36 00         [10]  625 	ld	(hl),#0x00
                            626 ;src/main.c:177: }
   74FD                     627 00105$:
                            628 ;src/main.c:179: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   74FD E1            [10]  629 	pop	hl
   74FE E5            [11]  630 	push	hl
   74FF 6E            [ 7]  631 	ld	l,(hl)
   7500 3E 02         [ 7]  632 	ld	a,#0x02
   7502 95            [ 4]  633 	sub	a, l
   7503 38 0E         [12]  634 	jr	C,00106$
   7505 1A            [ 7]  635 	ld	a,(de)
   7506 5F            [ 4]  636 	ld	e,a
   7507 3E 02         [ 7]  637 	ld	a,#0x02
   7509 93            [ 4]  638 	sub	a, e
   750A 38 07         [12]  639 	jr	C,00106$
   750C 0A            [ 7]  640 	ld	a,(bc)
   750D 4F            [ 4]  641 	ld	c,a
   750E 3E 02         [ 7]  642 	ld	a,#0x02
   7510 91            [ 4]  643 	sub	a, c
   7511 30 04         [12]  644 	jr	NC,00107$
   7513                     645 00106$:
                            646 ;src/main.c:180: return 1;
   7513 2E 01         [ 7]  647 	ld	l,#0x01
   7515 18 02         [12]  648 	jr	00110$
   7517                     649 00107$:
                            650 ;src/main.c:182: return 0;
   7517 2E 00         [ 7]  651 	ld	l,#0x00
   7519                     652 00110$:
   7519 DD F9         [10]  653 	ld	sp, ix
   751B DD E1         [14]  654 	pop	ix
   751D C9            [10]  655 	ret
                            656 ;src/main.c:185: void dibujarEnemigo(TEnemy *enemy) {
                            657 ;	---------------------------------
                            658 ; Function dibujarEnemigo
                            659 ; ---------------------------------
   751E                     660 _dibujarEnemigo::
   751E DD E5         [15]  661 	push	ix
   7520 DD 21 00 00   [14]  662 	ld	ix,#0
   7524 DD 39         [15]  663 	add	ix,sp
                            664 ;src/main.c:186: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   7526 DD 4E 04      [19]  665 	ld	c,4 (ix)
   7529 DD 46 05      [19]  666 	ld	b,5 (ix)
   752C 69            [ 4]  667 	ld	l, c
   752D 60            [ 4]  668 	ld	h, b
   752E 23            [ 6]  669 	inc	hl
   752F 56            [ 7]  670 	ld	d,(hl)
   7530 0A            [ 7]  671 	ld	a,(bc)
   7531 C5            [11]  672 	push	bc
   7532 D5            [11]  673 	push	de
   7533 33            [ 6]  674 	inc	sp
   7534 F5            [11]  675 	push	af
   7535 33            [ 6]  676 	inc	sp
   7536 21 00 C0      [10]  677 	ld	hl,#0xC000
   7539 E5            [11]  678 	push	hl
   753A CD 9B 64      [17]  679 	call	_cpct_getScreenPtr
   753D EB            [ 4]  680 	ex	de,hl
                            681 ;src/main.c:187: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   753E E1            [10]  682 	pop	hl
   753F 01 04 00      [10]  683 	ld	bc, #0x0004
   7542 09            [11]  684 	add	hl, bc
   7543 4E            [ 7]  685 	ld	c,(hl)
   7544 23            [ 6]  686 	inc	hl
   7545 46            [ 7]  687 	ld	b,(hl)
   7546 21 00 0E      [10]  688 	ld	hl,#_g_tablatrans
   7549 E5            [11]  689 	push	hl
   754A 21 04 16      [10]  690 	ld	hl,#0x1604
   754D E5            [11]  691 	push	hl
   754E D5            [11]  692 	push	de
   754F C5            [11]  693 	push	bc
   7550 CD BB 64      [17]  694 	call	_cpct_drawSpriteMaskedAlignedTable
   7553 DD E1         [14]  695 	pop	ix
   7555 C9            [10]  696 	ret
                            697 ;src/main.c:190: void dibujarExplosion(TEnemy *enemy) {
                            698 ;	---------------------------------
                            699 ; Function dibujarExplosion
                            700 ; ---------------------------------
   7556                     701 _dibujarExplosion::
   7556 DD E5         [15]  702 	push	ix
   7558 DD 21 00 00   [14]  703 	ld	ix,#0
   755C DD 39         [15]  704 	add	ix,sp
                            705 ;src/main.c:191: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   755E DD 4E 04      [19]  706 	ld	c,4 (ix)
   7561 DD 46 05      [19]  707 	ld	b,5 (ix)
   7564 69            [ 4]  708 	ld	l, c
   7565 60            [ 4]  709 	ld	h, b
   7566 23            [ 6]  710 	inc	hl
   7567 56            [ 7]  711 	ld	d,(hl)
   7568 0A            [ 7]  712 	ld	a,(bc)
   7569 47            [ 4]  713 	ld	b,a
   756A D5            [11]  714 	push	de
   756B 33            [ 6]  715 	inc	sp
   756C C5            [11]  716 	push	bc
   756D 33            [ 6]  717 	inc	sp
   756E 21 00 C0      [10]  718 	ld	hl,#0xC000
   7571 E5            [11]  719 	push	hl
   7572 CD 9B 64      [17]  720 	call	_cpct_getScreenPtr
   7575 4D            [ 4]  721 	ld	c,l
   7576 44            [ 4]  722 	ld	b,h
                            723 ;src/main.c:192: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   7577 11 00 0E      [10]  724 	ld	de,#_g_tablatrans+0
   757A D5            [11]  725 	push	de
   757B 21 04 16      [10]  726 	ld	hl,#0x1604
   757E E5            [11]  727 	push	hl
   757F C5            [11]  728 	push	bc
   7580 21 A8 25      [10]  729 	ld	hl,#_g_explosion
   7583 E5            [11]  730 	push	hl
   7584 CD BB 64      [17]  731 	call	_cpct_drawSpriteMaskedAlignedTable
   7587 DD E1         [14]  732 	pop	ix
   7589 C9            [10]  733 	ret
                            734 ;src/main.c:195: void borrarExplosion() {
                            735 ;	---------------------------------
                            736 ; Function borrarExplosion
                            737 ; ---------------------------------
   758A                     738 _borrarExplosion::
   758A DD E5         [15]  739 	push	ix
   758C DD 21 00 00   [14]  740 	ld	ix,#0
   7590 DD 39         [15]  741 	add	ix,sp
   7592 F5            [11]  742 	push	af
   7593 3B            [ 6]  743 	dec	sp
                            744 ;src/main.c:196: u8 w = 4 + (enemy->px & 1);
   7594 21 FA 64      [10]  745 	ld	hl, #_enemy + 2
   7597 4E            [ 7]  746 	ld	c,(hl)
   7598 79            [ 4]  747 	ld	a,c
   7599 E6 01         [ 7]  748 	and	a, #0x01
   759B 47            [ 4]  749 	ld	b,a
   759C 04            [ 4]  750 	inc	b
   759D 04            [ 4]  751 	inc	b
   759E 04            [ 4]  752 	inc	b
   759F 04            [ 4]  753 	inc	b
                            754 ;src/main.c:199: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   75A0 21 FB 64      [10]  755 	ld	hl, #_enemy + 3
   75A3 5E            [ 7]  756 	ld	e,(hl)
   75A4 CB 4B         [ 8]  757 	bit	1, e
   75A6 28 04         [12]  758 	jr	Z,00103$
   75A8 3E 01         [ 7]  759 	ld	a,#0x01
   75AA 18 02         [12]  760 	jr	00104$
   75AC                     761 00103$:
   75AC 3E 00         [ 7]  762 	ld	a,#0x00
   75AE                     763 00104$:
   75AE C6 07         [ 7]  764 	add	a, #0x07
   75B0 DD 77 FD      [19]  765 	ld	-3 (ix),a
                            766 ;src/main.c:201: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   75B3 FD 2A F3 69   [20]  767 	ld	iy,(_mapa)
   75B7 16 00         [ 7]  768 	ld	d,#0x00
   75B9 7B            [ 4]  769 	ld	a,e
   75BA C6 E8         [ 7]  770 	add	a,#0xE8
   75BC DD 77 FE      [19]  771 	ld	-2 (ix),a
   75BF 7A            [ 4]  772 	ld	a,d
   75C0 CE FF         [ 7]  773 	adc	a,#0xFF
   75C2 DD 77 FF      [19]  774 	ld	-1 (ix),a
   75C5 DD 6E FE      [19]  775 	ld	l,-2 (ix)
   75C8 DD 66 FF      [19]  776 	ld	h,-1 (ix)
   75CB DD CB FF 7E   [20]  777 	bit	7, -1 (ix)
   75CF 28 04         [12]  778 	jr	Z,00105$
   75D1 21 EB FF      [10]  779 	ld	hl,#0xFFEB
   75D4 19            [11]  780 	add	hl,de
   75D5                     781 00105$:
   75D5 CB 2C         [ 8]  782 	sra	h
   75D7 CB 1D         [ 8]  783 	rr	l
   75D9 CB 2C         [ 8]  784 	sra	h
   75DB CB 1D         [ 8]  785 	rr	l
   75DD 55            [ 4]  786 	ld	d,l
   75DE CB 39         [ 8]  787 	srl	c
   75E0 FD E5         [15]  788 	push	iy
   75E2 21 F0 C0      [10]  789 	ld	hl,#0xC0F0
   75E5 E5            [11]  790 	push	hl
   75E6 3E 28         [ 7]  791 	ld	a,#0x28
   75E8 F5            [11]  792 	push	af
   75E9 33            [ 6]  793 	inc	sp
   75EA DD 7E FD      [19]  794 	ld	a,-3 (ix)
   75ED F5            [11]  795 	push	af
   75EE 33            [ 6]  796 	inc	sp
   75EF C5            [11]  797 	push	bc
   75F0 33            [ 6]  798 	inc	sp
   75F1 D5            [11]  799 	push	de
   75F2 33            [ 6]  800 	inc	sp
   75F3 79            [ 4]  801 	ld	a,c
   75F4 F5            [11]  802 	push	af
   75F5 33            [ 6]  803 	inc	sp
   75F6 CD 3C 59      [17]  804 	call	_cpct_etm_drawTileBox2x4
   75F9 DD F9         [10]  805 	ld	sp, ix
   75FB DD E1         [14]  806 	pop	ix
   75FD C9            [10]  807 	ret
                            808 ;src/main.c:205: void borrarEnemigo(TEnemy *enemy) {
                            809 ;	---------------------------------
                            810 ; Function borrarEnemigo
                            811 ; ---------------------------------
   75FE                     812 _borrarEnemigo::
   75FE DD E5         [15]  813 	push	ix
   7600 DD 21 00 00   [14]  814 	ld	ix,#0
   7604 DD 39         [15]  815 	add	ix,sp
   7606 21 FA FF      [10]  816 	ld	hl,#-6
   7609 39            [11]  817 	add	hl,sp
   760A F9            [ 6]  818 	ld	sp,hl
                            819 ;src/main.c:207: u8 w = 4 + (enemy->px & 1);
   760B DD 4E 04      [19]  820 	ld	c,4 (ix)
   760E DD 46 05      [19]  821 	ld	b,5 (ix)
   7611 69            [ 4]  822 	ld	l, c
   7612 60            [ 4]  823 	ld	h, b
   7613 23            [ 6]  824 	inc	hl
   7614 23            [ 6]  825 	inc	hl
   7615 5E            [ 7]  826 	ld	e,(hl)
   7616 7B            [ 4]  827 	ld	a,e
   7617 E6 01         [ 7]  828 	and	a, #0x01
   7619 C6 04         [ 7]  829 	add	a, #0x04
   761B DD 77 FA      [19]  830 	ld	-6 (ix),a
                            831 ;src/main.c:210: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   761E 69            [ 4]  832 	ld	l, c
   761F 60            [ 4]  833 	ld	h, b
   7620 23            [ 6]  834 	inc	hl
   7621 23            [ 6]  835 	inc	hl
   7622 23            [ 6]  836 	inc	hl
   7623 56            [ 7]  837 	ld	d,(hl)
   7624 CB 4A         [ 8]  838 	bit	1, d
   7626 28 04         [12]  839 	jr	Z,00103$
   7628 3E 01         [ 7]  840 	ld	a,#0x01
   762A 18 02         [12]  841 	jr	00104$
   762C                     842 00103$:
   762C 3E 00         [ 7]  843 	ld	a,#0x00
   762E                     844 00104$:
   762E C6 07         [ 7]  845 	add	a, #0x07
   7630 DD 77 FB      [19]  846 	ld	-5 (ix),a
                            847 ;src/main.c:212: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   7633 FD 2A F3 69   [20]  848 	ld	iy,(_mapa)
   7637 DD 72 FC      [19]  849 	ld	-4 (ix),d
   763A DD 36 FD 00   [19]  850 	ld	-3 (ix),#0x00
   763E DD 7E FC      [19]  851 	ld	a,-4 (ix)
   7641 C6 E8         [ 7]  852 	add	a,#0xE8
   7643 DD 77 FE      [19]  853 	ld	-2 (ix),a
   7646 DD 7E FD      [19]  854 	ld	a,-3 (ix)
   7649 CE FF         [ 7]  855 	adc	a,#0xFF
   764B DD 77 FF      [19]  856 	ld	-1 (ix),a
   764E DD 56 FE      [19]  857 	ld	d,-2 (ix)
   7651 DD 6E FF      [19]  858 	ld	l,-1 (ix)
   7654 DD CB FF 7E   [20]  859 	bit	7, -1 (ix)
   7658 28 0C         [12]  860 	jr	Z,00105$
   765A DD 7E FC      [19]  861 	ld	a,-4 (ix)
   765D C6 EB         [ 7]  862 	add	a, #0xEB
   765F 57            [ 4]  863 	ld	d,a
   7660 DD 7E FD      [19]  864 	ld	a,-3 (ix)
   7663 CE FF         [ 7]  865 	adc	a, #0xFF
   7665 6F            [ 4]  866 	ld	l,a
   7666                     867 00105$:
   7666 CB 2D         [ 8]  868 	sra	l
   7668 CB 1A         [ 8]  869 	rr	d
   766A CB 2D         [ 8]  870 	sra	l
   766C CB 1A         [ 8]  871 	rr	d
   766E CB 3B         [ 8]  872 	srl	e
   7670 C5            [11]  873 	push	bc
   7671 FD E5         [15]  874 	push	iy
   7673 21 F0 C0      [10]  875 	ld	hl,#0xC0F0
   7676 E5            [11]  876 	push	hl
   7677 3E 28         [ 7]  877 	ld	a,#0x28
   7679 F5            [11]  878 	push	af
   767A 33            [ 6]  879 	inc	sp
   767B DD 66 FB      [19]  880 	ld	h,-5 (ix)
   767E DD 6E FA      [19]  881 	ld	l,-6 (ix)
   7681 E5            [11]  882 	push	hl
   7682 D5            [11]  883 	push	de
   7683 CD 3C 59      [17]  884 	call	_cpct_etm_drawTileBox2x4
   7686 C1            [10]  885 	pop	bc
                            886 ;src/main.c:214: enemy->mover = NO;
   7687 21 06 00      [10]  887 	ld	hl,#0x0006
   768A 09            [11]  888 	add	hl,bc
   768B 36 00         [10]  889 	ld	(hl),#0x00
   768D DD F9         [10]  890 	ld	sp, ix
   768F DD E1         [14]  891 	pop	ix
   7691 C9            [10]  892 	ret
                            893 ;src/main.c:217: void redibujarEnemigo(TEnemy *enemy) {
                            894 ;	---------------------------------
                            895 ; Function redibujarEnemigo
                            896 ; ---------------------------------
   7692                     897 _redibujarEnemigo::
   7692 DD E5         [15]  898 	push	ix
   7694 DD 21 00 00   [14]  899 	ld	ix,#0
   7698 DD 39         [15]  900 	add	ix,sp
                            901 ;src/main.c:218: borrarEnemigo(enemy);
   769A DD 6E 04      [19]  902 	ld	l,4 (ix)
   769D DD 66 05      [19]  903 	ld	h,5 (ix)
   76A0 E5            [11]  904 	push	hl
   76A1 CD FE 75      [17]  905 	call	_borrarEnemigo
   76A4 F1            [10]  906 	pop	af
                            907 ;src/main.c:219: enemy->px = enemy->x;
   76A5 DD 4E 04      [19]  908 	ld	c,4 (ix)
   76A8 DD 46 05      [19]  909 	ld	b,5 (ix)
   76AB 59            [ 4]  910 	ld	e, c
   76AC 50            [ 4]  911 	ld	d, b
   76AD 13            [ 6]  912 	inc	de
   76AE 13            [ 6]  913 	inc	de
   76AF 0A            [ 7]  914 	ld	a,(bc)
   76B0 12            [ 7]  915 	ld	(de),a
                            916 ;src/main.c:220: enemy->py = enemy->y;
   76B1 59            [ 4]  917 	ld	e, c
   76B2 50            [ 4]  918 	ld	d, b
   76B3 13            [ 6]  919 	inc	de
   76B4 13            [ 6]  920 	inc	de
   76B5 13            [ 6]  921 	inc	de
   76B6 69            [ 4]  922 	ld	l, c
   76B7 60            [ 4]  923 	ld	h, b
   76B8 23            [ 6]  924 	inc	hl
   76B9 7E            [ 7]  925 	ld	a,(hl)
   76BA 12            [ 7]  926 	ld	(de),a
                            927 ;src/main.c:221: dibujarEnemigo(enemy);
   76BB C5            [11]  928 	push	bc
   76BC CD 1E 75      [17]  929 	call	_dibujarEnemigo
   76BF F1            [10]  930 	pop	af
   76C0 DD E1         [14]  931 	pop	ix
   76C2 C9            [10]  932 	ret
                            933 ;src/main.c:224: u8 checkEnemyCollision(int direction, TEnemy *enemy){
                            934 ;	---------------------------------
                            935 ; Function checkEnemyCollision
                            936 ; ---------------------------------
   76C3                     937 _checkEnemyCollision::
   76C3 DD E5         [15]  938 	push	ix
   76C5 DD 21 00 00   [14]  939 	ld	ix,#0
   76C9 DD 39         [15]  940 	add	ix,sp
   76CB 21 F7 FF      [10]  941 	ld	hl,#-9
   76CE 39            [11]  942 	add	hl,sp
   76CF F9            [ 6]  943 	ld	sp,hl
                            944 ;src/main.c:226: u8 colisiona = 1;
   76D0 DD 36 F7 01   [19]  945 	ld	-9 (ix),#0x01
                            946 ;src/main.c:228: switch (direction) {
   76D4 DD CB 05 7E   [20]  947 	bit	7, 5 (ix)
   76D8 C2 8B 7A      [10]  948 	jp	NZ,00165$
   76DB 3E 03         [ 7]  949 	ld	a,#0x03
   76DD DD BE 04      [19]  950 	cp	a, 4 (ix)
   76E0 3E 00         [ 7]  951 	ld	a,#0x00
   76E2 DD 9E 05      [19]  952 	sbc	a, 5 (ix)
   76E5 E2 EA 76      [10]  953 	jp	PO, 00272$
   76E8 EE 80         [ 7]  954 	xor	a, #0x80
   76EA                     955 00272$:
   76EA FA 8B 7A      [10]  956 	jp	M,00165$
                            957 ;src/main.c:230: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   76ED DD 4E 06      [19]  958 	ld	c,6 (ix)
   76F0 DD 46 07      [19]  959 	ld	b,7 (ix)
   76F3 0A            [ 7]  960 	ld	a,(bc)
   76F4 5F            [ 4]  961 	ld	e,a
   76F5 21 01 00      [10]  962 	ld	hl,#0x0001
   76F8 09            [11]  963 	add	hl,bc
   76F9 DD 75 F8      [19]  964 	ld	-8 (ix),l
   76FC DD 74 F9      [19]  965 	ld	-7 (ix),h
   76FF DD 6E F8      [19]  966 	ld	l,-8 (ix)
   7702 DD 66 F9      [19]  967 	ld	h,-7 (ix)
   7705 56            [ 7]  968 	ld	d,(hl)
                            969 ;src/main.c:243: enemy->muerto = SI;
   7706 21 08 00      [10]  970 	ld	hl,#0x0008
   7709 09            [11]  971 	add	hl,bc
   770A DD 75 FA      [19]  972 	ld	-6 (ix),l
   770D DD 74 FB      [19]  973 	ld	-5 (ix),h
                            974 ;src/main.c:250: enemy->mira = M_izquierda;
   7710 21 07 00      [10]  975 	ld	hl,#0x0007
   7713 09            [11]  976 	add	hl,bc
   7714 DD 75 FC      [19]  977 	ld	-4 (ix),l
   7717 DD 74 FD      [19]  978 	ld	-3 (ix),h
                            979 ;src/main.c:228: switch (direction) {
   771A D5            [11]  980 	push	de
   771B DD 5E 04      [19]  981 	ld	e,4 (ix)
   771E 16 00         [ 7]  982 	ld	d,#0x00
   7720 21 28 77      [10]  983 	ld	hl,#00273$
   7723 19            [11]  984 	add	hl,de
   7724 19            [11]  985 	add	hl,de
   7725 19            [11]  986 	add	hl,de
   7726 D1            [10]  987 	pop	de
   7727 E9            [ 4]  988 	jp	(hl)
   7728                     989 00273$:
   7728 C3 34 77      [10]  990 	jp	00101$
   772B C3 0D 78      [10]  991 	jp	00117$
   772E C3 E2 78      [10]  992 	jp	00133$
   7731 C3 B1 79      [10]  993 	jp	00149$
                            994 ;src/main.c:229: case 0:
   7734                     995 00101$:
                            996 ;src/main.c:230: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   7734 7B            [ 4]  997 	ld	a,e
   7735 C6 05         [ 7]  998 	add	a, #0x05
   7737 C5            [11]  999 	push	bc
   7738 D5            [11] 1000 	push	de
   7739 33            [ 6] 1001 	inc	sp
   773A F5            [11] 1002 	push	af
   773B 33            [ 6] 1003 	inc	sp
   773C CD 88 73      [17] 1004 	call	_getTilePtr
   773F F1            [10] 1005 	pop	af
   7740 C1            [10] 1006 	pop	bc
   7741 5E            [ 7] 1007 	ld	e,(hl)
   7742 3E 02         [ 7] 1008 	ld	a,#0x02
   7744 93            [ 4] 1009 	sub	a, e
   7745 DA 02 78      [10] 1010 	jp	C,00113$
                           1011 ;src/main.c:231: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   7748 DD 6E F8      [19] 1012 	ld	l,-8 (ix)
   774B DD 66 F9      [19] 1013 	ld	h,-7 (ix)
   774E 7E            [ 7] 1014 	ld	a,(hl)
   774F C6 0B         [ 7] 1015 	add	a, #0x0B
   7751 57            [ 4] 1016 	ld	d,a
   7752 0A            [ 7] 1017 	ld	a,(bc)
   7753 C6 05         [ 7] 1018 	add	a, #0x05
   7755 C5            [11] 1019 	push	bc
   7756 D5            [11] 1020 	push	de
   7757 33            [ 6] 1021 	inc	sp
   7758 F5            [11] 1022 	push	af
   7759 33            [ 6] 1023 	inc	sp
   775A CD 88 73      [17] 1024 	call	_getTilePtr
   775D F1            [10] 1025 	pop	af
   775E C1            [10] 1026 	pop	bc
   775F 5E            [ 7] 1027 	ld	e,(hl)
   7760 3E 02         [ 7] 1028 	ld	a,#0x02
   7762 93            [ 4] 1029 	sub	a, e
   7763 DA 02 78      [10] 1030 	jp	C,00113$
                           1031 ;src/main.c:232: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   7766 DD 6E F8      [19] 1032 	ld	l,-8 (ix)
   7769 DD 66 F9      [19] 1033 	ld	h,-7 (ix)
   776C 7E            [ 7] 1034 	ld	a,(hl)
   776D C6 16         [ 7] 1035 	add	a, #0x16
   776F 57            [ 4] 1036 	ld	d,a
   7770 0A            [ 7] 1037 	ld	a,(bc)
   7771 C6 05         [ 7] 1038 	add	a, #0x05
   7773 C5            [11] 1039 	push	bc
   7774 D5            [11] 1040 	push	de
   7775 33            [ 6] 1041 	inc	sp
   7776 F5            [11] 1042 	push	af
   7777 33            [ 6] 1043 	inc	sp
   7778 CD 88 73      [17] 1044 	call	_getTilePtr
   777B F1            [10] 1045 	pop	af
   777C C1            [10] 1046 	pop	bc
   777D 5E            [ 7] 1047 	ld	e,(hl)
   777E 3E 02         [ 7] 1048 	ld	a,#0x02
   7780 93            [ 4] 1049 	sub	a, e
   7781 DA 02 78      [10] 1050 	jp	C,00113$
                           1051 ;src/main.c:234: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   7784 21 E9 69      [10] 1052 	ld	hl, #_cu + 1
   7787 5E            [ 7] 1053 	ld	e,(hl)
   7788 16 00         [ 7] 1054 	ld	d,#0x00
   778A 21 04 00      [10] 1055 	ld	hl,#0x0004
   778D 19            [11] 1056 	add	hl,de
   778E DD 75 FE      [19] 1057 	ld	-2 (ix),l
   7791 DD 74 FF      [19] 1058 	ld	-1 (ix),h
   7794 DD 6E F8      [19] 1059 	ld	l,-8 (ix)
   7797 DD 66 F9      [19] 1060 	ld	h,-7 (ix)
   779A 6E            [ 7] 1061 	ld	l,(hl)
   779B 26 00         [ 7] 1062 	ld	h,#0x00
   779D DD 7E FE      [19] 1063 	ld	a,-2 (ix)
   77A0 95            [ 4] 1064 	sub	a, l
   77A1 DD 7E FF      [19] 1065 	ld	a,-1 (ix)
   77A4 9C            [ 4] 1066 	sbc	a, h
   77A5 E2 AA 77      [10] 1067 	jp	PO, 00274$
   77A8 EE 80         [ 7] 1068 	xor	a, #0x80
   77AA                    1069 00274$:
   77AA FA BF 77      [10] 1070 	jp	M,00108$
   77AD D5            [11] 1071 	push	de
   77AE 11 16 00      [10] 1072 	ld	de,#0x0016
   77B1 19            [11] 1073 	add	hl, de
   77B2 D1            [10] 1074 	pop	de
   77B3 7D            [ 4] 1075 	ld	a,l
   77B4 93            [ 4] 1076 	sub	a, e
   77B5 7C            [ 4] 1077 	ld	a,h
   77B6 9A            [ 4] 1078 	sbc	a, d
   77B7 E2 BC 77      [10] 1079 	jp	PO, 00275$
   77BA EE 80         [ 7] 1080 	xor	a, #0x80
   77BC                    1081 00275$:
   77BC F2 C6 77      [10] 1082 	jp	P,00109$
   77BF                    1083 00108$:
                           1084 ;src/main.c:235: colisiona = 0;
   77BF DD 36 F7 00   [19] 1085 	ld	-9 (ix),#0x00
   77C3 C3 8B 7A      [10] 1086 	jp	00165$
   77C6                    1087 00109$:
                           1088 ;src/main.c:238: if(cu.x > enemy->x){ //si el cu esta abajo
   77C6 21 E8 69      [10] 1089 	ld	hl, #_cu + 0
   77C9 5E            [ 7] 1090 	ld	e,(hl)
   77CA 0A            [ 7] 1091 	ld	a,(bc)
   77CB 4F            [ 4] 1092 	ld	c,a
   77CC 93            [ 4] 1093 	sub	a, e
   77CD 30 2C         [12] 1094 	jr	NC,00106$
                           1095 ;src/main.c:239: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
   77CF 6B            [ 4] 1096 	ld	l,e
   77D0 26 00         [ 7] 1097 	ld	h,#0x00
   77D2 06 00         [ 7] 1098 	ld	b,#0x00
   77D4 03            [ 6] 1099 	inc	bc
   77D5 03            [ 6] 1100 	inc	bc
   77D6 03            [ 6] 1101 	inc	bc
   77D7 03            [ 6] 1102 	inc	bc
   77D8 BF            [ 4] 1103 	cp	a, a
   77D9 ED 42         [15] 1104 	sbc	hl, bc
   77DB 3E 01         [ 7] 1105 	ld	a,#0x01
   77DD BD            [ 4] 1106 	cp	a, l
   77DE 3E 00         [ 7] 1107 	ld	a,#0x00
   77E0 9C            [ 4] 1108 	sbc	a, h
   77E1 E2 E6 77      [10] 1109 	jp	PO, 00276$
   77E4 EE 80         [ 7] 1110 	xor	a, #0x80
   77E6                    1111 00276$:
   77E6 F2 F0 77      [10] 1112 	jp	P,00103$
                           1113 ;src/main.c:240: colisiona = 0;
   77E9 DD 36 F7 00   [19] 1114 	ld	-9 (ix),#0x00
   77ED C3 8B 7A      [10] 1115 	jp	00165$
   77F0                    1116 00103$:
                           1117 ;src/main.c:243: enemy->muerto = SI;
   77F0 DD 6E FA      [19] 1118 	ld	l,-6 (ix)
   77F3 DD 66 FB      [19] 1119 	ld	h,-5 (ix)
   77F6 36 01         [10] 1120 	ld	(hl),#0x01
   77F8 C3 8B 7A      [10] 1121 	jp	00165$
   77FB                    1122 00106$:
                           1123 ;src/main.c:246: colisiona = 0;
   77FB DD 36 F7 00   [19] 1124 	ld	-9 (ix),#0x00
   77FF C3 8B 7A      [10] 1125 	jp	00165$
   7802                    1126 00113$:
                           1127 ;src/main.c:250: enemy->mira = M_izquierda;
   7802 DD 6E FC      [19] 1128 	ld	l,-4 (ix)
   7805 DD 66 FD      [19] 1129 	ld	h,-3 (ix)
   7808 36 01         [10] 1130 	ld	(hl),#0x01
                           1131 ;src/main.c:252: break;
   780A C3 8B 7A      [10] 1132 	jp	00165$
                           1133 ;src/main.c:253: case 1:
   780D                    1134 00117$:
                           1135 ;src/main.c:254: if( *getTilePtr(enemy->x - 1, enemy->y) <= 2
   780D 1D            [ 4] 1136 	dec	e
   780E C5            [11] 1137 	push	bc
   780F D5            [11] 1138 	push	de
   7810 CD 88 73      [17] 1139 	call	_getTilePtr
   7813 F1            [10] 1140 	pop	af
   7814 C1            [10] 1141 	pop	bc
   7815 5E            [ 7] 1142 	ld	e,(hl)
   7816 3E 02         [ 7] 1143 	ld	a,#0x02
   7818 93            [ 4] 1144 	sub	a, e
   7819 DA D7 78      [10] 1145 	jp	C,00129$
                           1146 ;src/main.c:255: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   781C DD 6E F8      [19] 1147 	ld	l,-8 (ix)
   781F DD 66 F9      [19] 1148 	ld	h,-7 (ix)
   7822 7E            [ 7] 1149 	ld	a,(hl)
   7823 C6 0B         [ 7] 1150 	add	a, #0x0B
   7825 57            [ 4] 1151 	ld	d,a
   7826 0A            [ 7] 1152 	ld	a,(bc)
   7827 C6 FF         [ 7] 1153 	add	a,#0xFF
   7829 C5            [11] 1154 	push	bc
   782A D5            [11] 1155 	push	de
   782B 33            [ 6] 1156 	inc	sp
   782C F5            [11] 1157 	push	af
   782D 33            [ 6] 1158 	inc	sp
   782E CD 88 73      [17] 1159 	call	_getTilePtr
   7831 F1            [10] 1160 	pop	af
   7832 C1            [10] 1161 	pop	bc
   7833 5E            [ 7] 1162 	ld	e,(hl)
   7834 3E 02         [ 7] 1163 	ld	a,#0x02
   7836 93            [ 4] 1164 	sub	a, e
   7837 DA D7 78      [10] 1165 	jp	C,00129$
                           1166 ;src/main.c:256: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   783A DD 6E F8      [19] 1167 	ld	l,-8 (ix)
   783D DD 66 F9      [19] 1168 	ld	h,-7 (ix)
   7840 7E            [ 7] 1169 	ld	a,(hl)
   7841 C6 16         [ 7] 1170 	add	a, #0x16
   7843 57            [ 4] 1171 	ld	d,a
   7844 0A            [ 7] 1172 	ld	a,(bc)
   7845 C6 FF         [ 7] 1173 	add	a,#0xFF
   7847 C5            [11] 1174 	push	bc
   7848 D5            [11] 1175 	push	de
   7849 33            [ 6] 1176 	inc	sp
   784A F5            [11] 1177 	push	af
   784B 33            [ 6] 1178 	inc	sp
   784C CD 88 73      [17] 1179 	call	_getTilePtr
   784F F1            [10] 1180 	pop	af
   7850 C1            [10] 1181 	pop	bc
   7851 5E            [ 7] 1182 	ld	e,(hl)
   7852 3E 02         [ 7] 1183 	ld	a,#0x02
   7854 93            [ 4] 1184 	sub	a, e
   7855 DA D7 78      [10] 1185 	jp	C,00129$
                           1186 ;src/main.c:258: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   7858 21 E9 69      [10] 1187 	ld	hl, #_cu + 1
   785B 5E            [ 7] 1188 	ld	e,(hl)
   785C 16 00         [ 7] 1189 	ld	d,#0x00
   785E 21 04 00      [10] 1190 	ld	hl,#0x0004
   7861 19            [11] 1191 	add	hl,de
   7862 DD 75 FE      [19] 1192 	ld	-2 (ix),l
   7865 DD 74 FF      [19] 1193 	ld	-1 (ix),h
   7868 DD 6E F8      [19] 1194 	ld	l,-8 (ix)
   786B DD 66 F9      [19] 1195 	ld	h,-7 (ix)
   786E 6E            [ 7] 1196 	ld	l,(hl)
   786F 26 00         [ 7] 1197 	ld	h,#0x00
   7871 DD 7E FE      [19] 1198 	ld	a,-2 (ix)
   7874 95            [ 4] 1199 	sub	a, l
   7875 DD 7E FF      [19] 1200 	ld	a,-1 (ix)
   7878 9C            [ 4] 1201 	sbc	a, h
   7879 E2 7E 78      [10] 1202 	jp	PO, 00277$
   787C EE 80         [ 7] 1203 	xor	a, #0x80
   787E                    1204 00277$:
   787E FA 93 78      [10] 1205 	jp	M,00124$
   7881 D5            [11] 1206 	push	de
   7882 11 16 00      [10] 1207 	ld	de,#0x0016
   7885 19            [11] 1208 	add	hl, de
   7886 D1            [10] 1209 	pop	de
   7887 7D            [ 4] 1210 	ld	a,l
   7888 93            [ 4] 1211 	sub	a, e
   7889 7C            [ 4] 1212 	ld	a,h
   788A 9A            [ 4] 1213 	sbc	a, d
   788B E2 90 78      [10] 1214 	jp	PO, 00278$
   788E EE 80         [ 7] 1215 	xor	a, #0x80
   7890                    1216 00278$:
   7890 F2 9A 78      [10] 1217 	jp	P,00125$
   7893                    1218 00124$:
                           1219 ;src/main.c:259: colisiona = 0;
   7893 DD 36 F7 00   [19] 1220 	ld	-9 (ix),#0x00
   7897 C3 8B 7A      [10] 1221 	jp	00165$
   789A                    1222 00125$:
                           1223 ;src/main.c:262: if(enemy->x > cu.x){ //si el cu esta abajo
   789A 0A            [ 7] 1224 	ld	a,(bc)
   789B 5F            [ 4] 1225 	ld	e,a
   789C 21 E8 69      [10] 1226 	ld	hl, #_cu + 0
   789F 4E            [ 7] 1227 	ld	c,(hl)
   78A0 79            [ 4] 1228 	ld	a,c
   78A1 93            [ 4] 1229 	sub	a, e
   78A2 30 2C         [12] 1230 	jr	NC,00122$
                           1231 ;src/main.c:263: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
   78A4 6B            [ 4] 1232 	ld	l,e
   78A5 26 00         [ 7] 1233 	ld	h,#0x00
   78A7 06 00         [ 7] 1234 	ld	b,#0x00
   78A9 03            [ 6] 1235 	inc	bc
   78AA 03            [ 6] 1236 	inc	bc
   78AB 03            [ 6] 1237 	inc	bc
   78AC 03            [ 6] 1238 	inc	bc
   78AD BF            [ 4] 1239 	cp	a, a
   78AE ED 42         [15] 1240 	sbc	hl, bc
   78B0 3E 01         [ 7] 1241 	ld	a,#0x01
   78B2 BD            [ 4] 1242 	cp	a, l
   78B3 3E 00         [ 7] 1243 	ld	a,#0x00
   78B5 9C            [ 4] 1244 	sbc	a, h
   78B6 E2 BB 78      [10] 1245 	jp	PO, 00279$
   78B9 EE 80         [ 7] 1246 	xor	a, #0x80
   78BB                    1247 00279$:
   78BB F2 C5 78      [10] 1248 	jp	P,00119$
                           1249 ;src/main.c:264: colisiona = 0;
   78BE DD 36 F7 00   [19] 1250 	ld	-9 (ix),#0x00
   78C2 C3 8B 7A      [10] 1251 	jp	00165$
   78C5                    1252 00119$:
                           1253 ;src/main.c:267: enemy->muerto = SI;
   78C5 DD 6E FA      [19] 1254 	ld	l,-6 (ix)
   78C8 DD 66 FB      [19] 1255 	ld	h,-5 (ix)
   78CB 36 01         [10] 1256 	ld	(hl),#0x01
   78CD C3 8B 7A      [10] 1257 	jp	00165$
   78D0                    1258 00122$:
                           1259 ;src/main.c:270: colisiona = 0;
   78D0 DD 36 F7 00   [19] 1260 	ld	-9 (ix),#0x00
   78D4 C3 8B 7A      [10] 1261 	jp	00165$
   78D7                    1262 00129$:
                           1263 ;src/main.c:274: enemy->mira = M_derecha;
   78D7 DD 6E FC      [19] 1264 	ld	l,-4 (ix)
   78DA DD 66 FD      [19] 1265 	ld	h,-3 (ix)
   78DD 36 00         [10] 1266 	ld	(hl),#0x00
                           1267 ;src/main.c:276: break;
   78DF C3 8B 7A      [10] 1268 	jp	00165$
                           1269 ;src/main.c:277: case 2:
   78E2                    1270 00133$:
                           1271 ;src/main.c:278: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   78E2 15            [ 4] 1272 	dec	d
   78E3 15            [ 4] 1273 	dec	d
   78E4 C5            [11] 1274 	push	bc
   78E5 D5            [11] 1275 	push	de
   78E6 CD 88 73      [17] 1276 	call	_getTilePtr
   78E9 F1            [10] 1277 	pop	af
   78EA C1            [10] 1278 	pop	bc
   78EB 5E            [ 7] 1279 	ld	e,(hl)
   78EC 3E 02         [ 7] 1280 	ld	a,#0x02
   78EE 93            [ 4] 1281 	sub	a, e
   78EF DA A9 79      [10] 1282 	jp	C,00145$
                           1283 ;src/main.c:279: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   78F2 DD 6E F8      [19] 1284 	ld	l,-8 (ix)
   78F5 DD 66 F9      [19] 1285 	ld	h,-7 (ix)
   78F8 56            [ 7] 1286 	ld	d,(hl)
   78F9 15            [ 4] 1287 	dec	d
   78FA 15            [ 4] 1288 	dec	d
   78FB 0A            [ 7] 1289 	ld	a,(bc)
   78FC C6 02         [ 7] 1290 	add	a, #0x02
   78FE C5            [11] 1291 	push	bc
   78FF D5            [11] 1292 	push	de
   7900 33            [ 6] 1293 	inc	sp
   7901 F5            [11] 1294 	push	af
   7902 33            [ 6] 1295 	inc	sp
   7903 CD 88 73      [17] 1296 	call	_getTilePtr
   7906 F1            [10] 1297 	pop	af
   7907 C1            [10] 1298 	pop	bc
   7908 5E            [ 7] 1299 	ld	e,(hl)
   7909 3E 02         [ 7] 1300 	ld	a,#0x02
   790B 93            [ 4] 1301 	sub	a, e
   790C DA A9 79      [10] 1302 	jp	C,00145$
                           1303 ;src/main.c:280: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   790F DD 6E F8      [19] 1304 	ld	l,-8 (ix)
   7912 DD 66 F9      [19] 1305 	ld	h,-7 (ix)
   7915 56            [ 7] 1306 	ld	d,(hl)
   7916 15            [ 4] 1307 	dec	d
   7917 15            [ 4] 1308 	dec	d
   7918 0A            [ 7] 1309 	ld	a,(bc)
   7919 C6 04         [ 7] 1310 	add	a, #0x04
   791B C5            [11] 1311 	push	bc
   791C D5            [11] 1312 	push	de
   791D 33            [ 6] 1313 	inc	sp
   791E F5            [11] 1314 	push	af
   791F 33            [ 6] 1315 	inc	sp
   7920 CD 88 73      [17] 1316 	call	_getTilePtr
   7923 F1            [10] 1317 	pop	af
   7924 C1            [10] 1318 	pop	bc
   7925 5E            [ 7] 1319 	ld	e,(hl)
   7926 3E 02         [ 7] 1320 	ld	a,#0x02
   7928 93            [ 4] 1321 	sub	a, e
   7929 DA A9 79      [10] 1322 	jp	C,00145$
                           1323 ;src/main.c:282: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   792C 21 E8 69      [10] 1324 	ld	hl, #_cu + 0
   792F 5E            [ 7] 1325 	ld	e,(hl)
   7930 16 00         [ 7] 1326 	ld	d,#0x00
   7932 21 02 00      [10] 1327 	ld	hl,#0x0002
   7935 19            [11] 1328 	add	hl,de
   7936 DD 75 FE      [19] 1329 	ld	-2 (ix),l
   7939 DD 74 FF      [19] 1330 	ld	-1 (ix),h
   793C 0A            [ 7] 1331 	ld	a,(bc)
   793D 6F            [ 4] 1332 	ld	l,a
   793E 26 00         [ 7] 1333 	ld	h,#0x00
   7940 DD 7E FE      [19] 1334 	ld	a,-2 (ix)
   7943 95            [ 4] 1335 	sub	a, l
   7944 DD 7E FF      [19] 1336 	ld	a,-1 (ix)
   7947 9C            [ 4] 1337 	sbc	a, h
   7948 E2 4D 79      [10] 1338 	jp	PO, 00280$
   794B EE 80         [ 7] 1339 	xor	a, #0x80
   794D                    1340 00280$:
   794D FA 60 79      [10] 1341 	jp	M,00140$
   7950 23            [ 6] 1342 	inc	hl
   7951 23            [ 6] 1343 	inc	hl
   7952 23            [ 6] 1344 	inc	hl
   7953 23            [ 6] 1345 	inc	hl
   7954 7D            [ 4] 1346 	ld	a,l
   7955 93            [ 4] 1347 	sub	a, e
   7956 7C            [ 4] 1348 	ld	a,h
   7957 9A            [ 4] 1349 	sbc	a, d
   7958 E2 5D 79      [10] 1350 	jp	PO, 00281$
   795B EE 80         [ 7] 1351 	xor	a, #0x80
   795D                    1352 00281$:
   795D F2 66 79      [10] 1353 	jp	P,00141$
   7960                    1354 00140$:
                           1355 ;src/main.c:284: colisiona = 0;
   7960 DD 36 F7 00   [19] 1356 	ld	-9 (ix),#0x00
   7964 18 4B         [12] 1357 	jr	00149$
   7966                    1358 00141$:
                           1359 ;src/main.c:287: if(enemy->y>cu.y){
   7966 DD 6E F8      [19] 1360 	ld	l,-8 (ix)
   7969 DD 66 F9      [19] 1361 	ld	h,-7 (ix)
   796C 5E            [ 7] 1362 	ld	e,(hl)
   796D 21 E9 69      [10] 1363 	ld	hl, #(_cu + 0x0001) + 0
   7970 6E            [ 7] 1364 	ld	l,(hl)
   7971 7D            [ 4] 1365 	ld	a,l
   7972 93            [ 4] 1366 	sub	a, e
   7973 30 2E         [12] 1367 	jr	NC,00138$
                           1368 ;src/main.c:288: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   7975 16 00         [ 7] 1369 	ld	d,#0x00
   7977 26 00         [ 7] 1370 	ld	h,#0x00
   7979 D5            [11] 1371 	push	de
   797A 11 08 00      [10] 1372 	ld	de,#0x0008
   797D 19            [11] 1373 	add	hl, de
   797E D1            [10] 1374 	pop	de
   797F 7B            [ 4] 1375 	ld	a,e
   7980 95            [ 4] 1376 	sub	a, l
   7981 5F            [ 4] 1377 	ld	e,a
   7982 7A            [ 4] 1378 	ld	a,d
   7983 9C            [ 4] 1379 	sbc	a, h
   7984 57            [ 4] 1380 	ld	d,a
   7985 3E 02         [ 7] 1381 	ld	a,#0x02
   7987 BB            [ 4] 1382 	cp	a, e
   7988 3E 00         [ 7] 1383 	ld	a,#0x00
   798A 9A            [ 4] 1384 	sbc	a, d
   798B E2 90 79      [10] 1385 	jp	PO, 00282$
   798E EE 80         [ 7] 1386 	xor	a, #0x80
   7990                    1387 00282$:
   7990 F2 99 79      [10] 1388 	jp	P,00135$
                           1389 ;src/main.c:289: colisiona = 0;
   7993 DD 36 F7 00   [19] 1390 	ld	-9 (ix),#0x00
   7997 18 18         [12] 1391 	jr	00149$
   7999                    1392 00135$:
                           1393 ;src/main.c:292: enemy->muerto = SI;
   7999 DD 6E FA      [19] 1394 	ld	l,-6 (ix)
   799C DD 66 FB      [19] 1395 	ld	h,-5 (ix)
   799F 36 01         [10] 1396 	ld	(hl),#0x01
   79A1 18 0E         [12] 1397 	jr	00149$
   79A3                    1398 00138$:
                           1399 ;src/main.c:296: colisiona = 0;
   79A3 DD 36 F7 00   [19] 1400 	ld	-9 (ix),#0x00
   79A7 18 08         [12] 1401 	jr	00149$
   79A9                    1402 00145$:
                           1403 ;src/main.c:302: enemy->mira = M_abajo;
   79A9 DD 6E FC      [19] 1404 	ld	l,-4 (ix)
   79AC DD 66 FD      [19] 1405 	ld	h,-3 (ix)
   79AF 36 03         [10] 1406 	ld	(hl),#0x03
                           1407 ;src/main.c:305: case 3:
   79B1                    1408 00149$:
                           1409 ;src/main.c:308: if( *getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   79B1 DD 6E F8      [19] 1410 	ld	l,-8 (ix)
   79B4 DD 66 F9      [19] 1411 	ld	h,-7 (ix)
   79B7 7E            [ 7] 1412 	ld	a,(hl)
   79B8 C6 18         [ 7] 1413 	add	a, #0x18
   79BA 57            [ 4] 1414 	ld	d,a
   79BB 0A            [ 7] 1415 	ld	a,(bc)
   79BC C5            [11] 1416 	push	bc
   79BD D5            [11] 1417 	push	de
   79BE 33            [ 6] 1418 	inc	sp
   79BF F5            [11] 1419 	push	af
   79C0 33            [ 6] 1420 	inc	sp
   79C1 CD 88 73      [17] 1421 	call	_getTilePtr
   79C4 F1            [10] 1422 	pop	af
   79C5 C1            [10] 1423 	pop	bc
   79C6 5E            [ 7] 1424 	ld	e,(hl)
   79C7 3E 02         [ 7] 1425 	ld	a,#0x02
   79C9 93            [ 4] 1426 	sub	a, e
   79CA DA 83 7A      [10] 1427 	jp	C,00161$
                           1428 ;src/main.c:309: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   79CD DD 6E F8      [19] 1429 	ld	l,-8 (ix)
   79D0 DD 66 F9      [19] 1430 	ld	h,-7 (ix)
   79D3 7E            [ 7] 1431 	ld	a,(hl)
   79D4 C6 18         [ 7] 1432 	add	a, #0x18
   79D6 57            [ 4] 1433 	ld	d,a
   79D7 0A            [ 7] 1434 	ld	a,(bc)
   79D8 C6 02         [ 7] 1435 	add	a, #0x02
   79DA C5            [11] 1436 	push	bc
   79DB D5            [11] 1437 	push	de
   79DC 33            [ 6] 1438 	inc	sp
   79DD F5            [11] 1439 	push	af
   79DE 33            [ 6] 1440 	inc	sp
   79DF CD 88 73      [17] 1441 	call	_getTilePtr
   79E2 F1            [10] 1442 	pop	af
   79E3 C1            [10] 1443 	pop	bc
   79E4 5E            [ 7] 1444 	ld	e,(hl)
   79E5 3E 02         [ 7] 1445 	ld	a,#0x02
   79E7 93            [ 4] 1446 	sub	a, e
   79E8 DA 83 7A      [10] 1447 	jp	C,00161$
                           1448 ;src/main.c:310: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   79EB DD 6E F8      [19] 1449 	ld	l,-8 (ix)
   79EE DD 66 F9      [19] 1450 	ld	h,-7 (ix)
   79F1 7E            [ 7] 1451 	ld	a,(hl)
   79F2 C6 18         [ 7] 1452 	add	a, #0x18
   79F4 57            [ 4] 1453 	ld	d,a
   79F5 0A            [ 7] 1454 	ld	a,(bc)
   79F6 C6 04         [ 7] 1455 	add	a, #0x04
   79F8 C5            [11] 1456 	push	bc
   79F9 D5            [11] 1457 	push	de
   79FA 33            [ 6] 1458 	inc	sp
   79FB F5            [11] 1459 	push	af
   79FC 33            [ 6] 1460 	inc	sp
   79FD CD 88 73      [17] 1461 	call	_getTilePtr
   7A00 F1            [10] 1462 	pop	af
   7A01 C1            [10] 1463 	pop	bc
   7A02 5E            [ 7] 1464 	ld	e,(hl)
   7A03 3E 02         [ 7] 1465 	ld	a,#0x02
   7A05 93            [ 4] 1466 	sub	a, e
   7A06 38 7B         [12] 1467 	jr	C,00161$
                           1468 ;src/main.c:312: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   7A08 21 E8 69      [10] 1469 	ld	hl, #_cu + 0
   7A0B 5E            [ 7] 1470 	ld	e,(hl)
   7A0C 16 00         [ 7] 1471 	ld	d,#0x00
   7A0E 21 02 00      [10] 1472 	ld	hl,#0x0002
   7A11 19            [11] 1473 	add	hl,de
   7A12 DD 75 FE      [19] 1474 	ld	-2 (ix),l
   7A15 DD 74 FF      [19] 1475 	ld	-1 (ix),h
   7A18 0A            [ 7] 1476 	ld	a,(bc)
   7A19 4F            [ 4] 1477 	ld	c,a
   7A1A 06 00         [ 7] 1478 	ld	b,#0x00
   7A1C DD 7E FE      [19] 1479 	ld	a,-2 (ix)
   7A1F 91            [ 4] 1480 	sub	a, c
   7A20 DD 7E FF      [19] 1481 	ld	a,-1 (ix)
   7A23 98            [ 4] 1482 	sbc	a, b
   7A24 E2 29 7A      [10] 1483 	jp	PO, 00283$
   7A27 EE 80         [ 7] 1484 	xor	a, #0x80
   7A29                    1485 00283$:
   7A29 FA 3C 7A      [10] 1486 	jp	M,00156$
   7A2C 03            [ 6] 1487 	inc	bc
   7A2D 03            [ 6] 1488 	inc	bc
   7A2E 03            [ 6] 1489 	inc	bc
   7A2F 03            [ 6] 1490 	inc	bc
   7A30 79            [ 4] 1491 	ld	a,c
   7A31 93            [ 4] 1492 	sub	a, e
   7A32 78            [ 4] 1493 	ld	a,b
   7A33 9A            [ 4] 1494 	sbc	a, d
   7A34 E2 39 7A      [10] 1495 	jp	PO, 00284$
   7A37 EE 80         [ 7] 1496 	xor	a, #0x80
   7A39                    1497 00284$:
   7A39 F2 42 7A      [10] 1498 	jp	P,00157$
   7A3C                    1499 00156$:
                           1500 ;src/main.c:313: colisiona = 0;
   7A3C DD 36 F7 00   [19] 1501 	ld	-9 (ix),#0x00
   7A40 18 49         [12] 1502 	jr	00165$
   7A42                    1503 00157$:
                           1504 ;src/main.c:316: if(cu.y > enemy->y){ //si el cu esta abajo
   7A42 21 E9 69      [10] 1505 	ld	hl, #(_cu + 0x0001) + 0
   7A45 4E            [ 7] 1506 	ld	c,(hl)
   7A46 DD 6E F8      [19] 1507 	ld	l,-8 (ix)
   7A49 DD 66 F9      [19] 1508 	ld	h,-7 (ix)
   7A4C 5E            [ 7] 1509 	ld	e,(hl)
   7A4D 7B            [ 4] 1510 	ld	a,e
   7A4E 91            [ 4] 1511 	sub	a, c
   7A4F 30 2C         [12] 1512 	jr	NC,00154$
                           1513 ;src/main.c:317: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   7A51 06 00         [ 7] 1514 	ld	b,#0x00
   7A53 16 00         [ 7] 1515 	ld	d,#0x00
   7A55 21 16 00      [10] 1516 	ld	hl,#0x0016
   7A58 19            [11] 1517 	add	hl,de
   7A59 79            [ 4] 1518 	ld	a,c
   7A5A 95            [ 4] 1519 	sub	a, l
   7A5B 4F            [ 4] 1520 	ld	c,a
   7A5C 78            [ 4] 1521 	ld	a,b
   7A5D 9C            [ 4] 1522 	sbc	a, h
   7A5E 47            [ 4] 1523 	ld	b,a
   7A5F 3E 02         [ 7] 1524 	ld	a,#0x02
   7A61 B9            [ 4] 1525 	cp	a, c
   7A62 3E 00         [ 7] 1526 	ld	a,#0x00
   7A64 98            [ 4] 1527 	sbc	a, b
   7A65 E2 6A 7A      [10] 1528 	jp	PO, 00285$
   7A68 EE 80         [ 7] 1529 	xor	a, #0x80
   7A6A                    1530 00285$:
   7A6A F2 73 7A      [10] 1531 	jp	P,00151$
                           1532 ;src/main.c:318: colisiona = 0;
   7A6D DD 36 F7 00   [19] 1533 	ld	-9 (ix),#0x00
   7A71 18 18         [12] 1534 	jr	00165$
   7A73                    1535 00151$:
                           1536 ;src/main.c:321: enemy->muerto = SI;
   7A73 DD 6E FA      [19] 1537 	ld	l,-6 (ix)
   7A76 DD 66 FB      [19] 1538 	ld	h,-5 (ix)
   7A79 36 01         [10] 1539 	ld	(hl),#0x01
   7A7B 18 0E         [12] 1540 	jr	00165$
   7A7D                    1541 00154$:
                           1542 ;src/main.c:325: colisiona = 0;
   7A7D DD 36 F7 00   [19] 1543 	ld	-9 (ix),#0x00
   7A81 18 08         [12] 1544 	jr	00165$
   7A83                    1545 00161$:
                           1546 ;src/main.c:329: enemy->mira = M_arriba;
   7A83 DD 6E FC      [19] 1547 	ld	l,-4 (ix)
   7A86 DD 66 FD      [19] 1548 	ld	h,-3 (ix)
   7A89 36 02         [10] 1549 	ld	(hl),#0x02
                           1550 ;src/main.c:332: }
   7A8B                    1551 00165$:
                           1552 ;src/main.c:333: return colisiona;
   7A8B DD 6E F7      [19] 1553 	ld	l,-9 (ix)
   7A8E DD F9         [10] 1554 	ld	sp, ix
   7A90 DD E1         [14] 1555 	pop	ix
   7A92 C9            [10] 1556 	ret
                           1557 ;src/main.c:336: void moverEnemigoArriba(TEnemy *enemy){
                           1558 ;	---------------------------------
                           1559 ; Function moverEnemigoArriba
                           1560 ; ---------------------------------
   7A93                    1561 _moverEnemigoArriba::
   7A93 DD E5         [15] 1562 	push	ix
   7A95 DD 21 00 00   [14] 1563 	ld	ix,#0
   7A99 DD 39         [15] 1564 	add	ix,sp
                           1565 ;src/main.c:337: enemy->y--;
   7A9B DD 4E 04      [19] 1566 	ld	c,4 (ix)
   7A9E DD 46 05      [19] 1567 	ld	b,5 (ix)
   7AA1 69            [ 4] 1568 	ld	l, c
   7AA2 60            [ 4] 1569 	ld	h, b
   7AA3 23            [ 6] 1570 	inc	hl
   7AA4 5E            [ 7] 1571 	ld	e,(hl)
   7AA5 1D            [ 4] 1572 	dec	e
   7AA6 73            [ 7] 1573 	ld	(hl),e
                           1574 ;src/main.c:338: enemy->y--;
   7AA7 1D            [ 4] 1575 	dec	e
   7AA8 73            [ 7] 1576 	ld	(hl),e
                           1577 ;src/main.c:339: enemy->mover = SI;
   7AA9 21 06 00      [10] 1578 	ld	hl,#0x0006
   7AAC 09            [11] 1579 	add	hl,bc
   7AAD 36 01         [10] 1580 	ld	(hl),#0x01
   7AAF DD E1         [14] 1581 	pop	ix
   7AB1 C9            [10] 1582 	ret
                           1583 ;src/main.c:342: void moverEnemigoAbajo(TEnemy *enemy){
                           1584 ;	---------------------------------
                           1585 ; Function moverEnemigoAbajo
                           1586 ; ---------------------------------
   7AB2                    1587 _moverEnemigoAbajo::
   7AB2 DD E5         [15] 1588 	push	ix
   7AB4 DD 21 00 00   [14] 1589 	ld	ix,#0
   7AB8 DD 39         [15] 1590 	add	ix,sp
                           1591 ;src/main.c:343: enemy->y++;
   7ABA DD 4E 04      [19] 1592 	ld	c,4 (ix)
   7ABD DD 46 05      [19] 1593 	ld	b,5 (ix)
   7AC0 59            [ 4] 1594 	ld	e, c
   7AC1 50            [ 4] 1595 	ld	d, b
   7AC2 13            [ 6] 1596 	inc	de
   7AC3 1A            [ 7] 1597 	ld	a,(de)
   7AC4 3C            [ 4] 1598 	inc	a
   7AC5 12            [ 7] 1599 	ld	(de),a
                           1600 ;src/main.c:344: enemy->y++;
   7AC6 3C            [ 4] 1601 	inc	a
   7AC7 12            [ 7] 1602 	ld	(de),a
                           1603 ;src/main.c:345: enemy->mover = SI;
   7AC8 21 06 00      [10] 1604 	ld	hl,#0x0006
   7ACB 09            [11] 1605 	add	hl,bc
   7ACC 36 01         [10] 1606 	ld	(hl),#0x01
   7ACE DD E1         [14] 1607 	pop	ix
   7AD0 C9            [10] 1608 	ret
                           1609 ;src/main.c:348: void moverEnemigoDerecha(TEnemy *enemy){
                           1610 ;	---------------------------------
                           1611 ; Function moverEnemigoDerecha
                           1612 ; ---------------------------------
   7AD1                    1613 _moverEnemigoDerecha::
                           1614 ;src/main.c:349: enemy->x++;
   7AD1 D1            [10] 1615 	pop	de
   7AD2 C1            [10] 1616 	pop	bc
   7AD3 C5            [11] 1617 	push	bc
   7AD4 D5            [11] 1618 	push	de
   7AD5 0A            [ 7] 1619 	ld	a,(bc)
   7AD6 3C            [ 4] 1620 	inc	a
   7AD7 02            [ 7] 1621 	ld	(bc),a
                           1622 ;src/main.c:350: enemy->x++;
   7AD8 3C            [ 4] 1623 	inc	a
   7AD9 02            [ 7] 1624 	ld	(bc),a
                           1625 ;src/main.c:351: enemy->mover = SI;
   7ADA 21 06 00      [10] 1626 	ld	hl,#0x0006
   7ADD 09            [11] 1627 	add	hl,bc
   7ADE 36 01         [10] 1628 	ld	(hl),#0x01
   7AE0 C9            [10] 1629 	ret
                           1630 ;src/main.c:354: void moverEnemigoIzquierda(TEnemy *enemy){
                           1631 ;	---------------------------------
                           1632 ; Function moverEnemigoIzquierda
                           1633 ; ---------------------------------
   7AE1                    1634 _moverEnemigoIzquierda::
                           1635 ;src/main.c:355: enemy->x--;
   7AE1 D1            [10] 1636 	pop	de
   7AE2 C1            [10] 1637 	pop	bc
   7AE3 C5            [11] 1638 	push	bc
   7AE4 D5            [11] 1639 	push	de
   7AE5 0A            [ 7] 1640 	ld	a,(bc)
   7AE6 C6 FF         [ 7] 1641 	add	a,#0xFF
   7AE8 02            [ 7] 1642 	ld	(bc),a
                           1643 ;src/main.c:356: enemy->x--;
   7AE9 C6 FF         [ 7] 1644 	add	a,#0xFF
   7AEB 02            [ 7] 1645 	ld	(bc),a
                           1646 ;src/main.c:357: enemy->mover = SI;
   7AEC 21 06 00      [10] 1647 	ld	hl,#0x0006
   7AEF 09            [11] 1648 	add	hl,bc
   7AF0 36 01         [10] 1649 	ld	(hl),#0x01
   7AF2 C9            [10] 1650 	ret
                           1651 ;src/main.c:360: void moverEnemigo(TEnemy *enemy){
                           1652 ;	---------------------------------
                           1653 ; Function moverEnemigo
                           1654 ; ---------------------------------
   7AF3                    1655 _moverEnemigo::
   7AF3 DD E5         [15] 1656 	push	ix
   7AF5 DD 21 00 00   [14] 1657 	ld	ix,#0
   7AF9 DD 39         [15] 1658 	add	ix,sp
   7AFB F5            [11] 1659 	push	af
                           1660 ;src/main.c:363: if(!enemy->muerto){
   7AFC DD 4E 04      [19] 1661 	ld	c,4 (ix)
   7AFF DD 46 05      [19] 1662 	ld	b,5 (ix)
   7B02 C5            [11] 1663 	push	bc
   7B03 FD E1         [14] 1664 	pop	iy
   7B05 FD 7E 08      [19] 1665 	ld	a,8 (iy)
   7B08 B7            [ 4] 1666 	or	a, a
   7B09 20 64         [12] 1667 	jr	NZ,00106$
                           1668 ;src/main.c:365: if(iter < enemy->longitud_camino - 8){
   7B0B 21 39 01      [10] 1669 	ld	hl,#0x0139
   7B0E 09            [11] 1670 	add	hl,bc
   7B0F EB            [ 4] 1671 	ex	de,hl
   7B10 1A            [ 7] 1672 	ld	a,(de)
   7B11 6F            [ 4] 1673 	ld	l,a
   7B12 26 00         [ 7] 1674 	ld	h,#0x00
   7B14 7D            [ 4] 1675 	ld	a,l
   7B15 C6 F8         [ 7] 1676 	add	a,#0xF8
   7B17 DD 77 FE      [19] 1677 	ld	-2 (ix),a
   7B1A 7C            [ 4] 1678 	ld	a,h
   7B1B CE FF         [ 7] 1679 	adc	a,#0xFF
   7B1D DD 77 FF      [19] 1680 	ld	-1 (ix),a
   7B20 3A F2 69      [13] 1681 	ld	a,(#_iter + 0)
   7B23 26 00         [ 7] 1682 	ld	h, #0x00
   7B25 DD 96 FE      [19] 1683 	sub	a, -2 (ix)
   7B28 7C            [ 4] 1684 	ld	a,h
   7B29 DD 9E FF      [19] 1685 	sbc	a, -1 (ix)
   7B2C E2 31 7B      [10] 1686 	jp	PO, 00116$
   7B2F EE 80         [ 7] 1687 	xor	a, #0x80
   7B31                    1688 00116$:
   7B31 F2 68 7B      [10] 1689 	jp	P,00102$
                           1690 ;src/main.c:366: enemy->x = enemy->camino[iter];
   7B34 21 0D 00      [10] 1691 	ld	hl,#0x000D
   7B37 09            [11] 1692 	add	hl,bc
   7B38 EB            [ 4] 1693 	ex	de,hl
   7B39 FD 21 F2 69   [14] 1694 	ld	iy,#_iter
   7B3D FD 6E 00      [19] 1695 	ld	l,0 (iy)
   7B40 26 00         [ 7] 1696 	ld	h,#0x00
   7B42 19            [11] 1697 	add	hl,de
   7B43 7E            [ 7] 1698 	ld	a,(hl)
   7B44 02            [ 7] 1699 	ld	(bc),a
                           1700 ;src/main.c:367: iter++;
   7B45 21 F2 69      [10] 1701 	ld	hl, #_iter+0
   7B48 34            [11] 1702 	inc	(hl)
                           1703 ;src/main.c:368: enemy->y = enemy->camino[iter];
   7B49 21 01 00      [10] 1704 	ld	hl,#0x0001
   7B4C 09            [11] 1705 	add	hl,bc
   7B4D E3            [19] 1706 	ex	(sp), hl
   7B4E FD 21 F2 69   [14] 1707 	ld	iy,#_iter
   7B52 FD 6E 00      [19] 1708 	ld	l,0 (iy)
   7B55 26 00         [ 7] 1709 	ld	h,#0x00
   7B57 19            [11] 1710 	add	hl,de
   7B58 5E            [ 7] 1711 	ld	e,(hl)
   7B59 E1            [10] 1712 	pop	hl
   7B5A E5            [11] 1713 	push	hl
   7B5B 73            [ 7] 1714 	ld	(hl),e
                           1715 ;src/main.c:369: iter++;
   7B5C 21 F2 69      [10] 1716 	ld	hl, #_iter+0
   7B5F 34            [11] 1717 	inc	(hl)
                           1718 ;src/main.c:370: enemy->mover = SI;
   7B60 21 06 00      [10] 1719 	ld	hl,#0x0006
   7B63 09            [11] 1720 	add	hl,bc
   7B64 36 01         [10] 1721 	ld	(hl),#0x01
   7B66 18 07         [12] 1722 	jr	00106$
   7B68                    1723 00102$:
                           1724 ;src/main.c:373: iter = 0;
   7B68 21 F2 69      [10] 1725 	ld	hl,#_iter + 0
   7B6B 36 00         [10] 1726 	ld	(hl), #0x00
                           1727 ;src/main.c:374: enemy->longitud_camino = 0;
   7B6D AF            [ 4] 1728 	xor	a, a
   7B6E 12            [ 7] 1729 	ld	(de),a
   7B6F                    1730 00106$:
   7B6F DD F9         [10] 1731 	ld	sp, ix
   7B71 DD E1         [14] 1732 	pop	ix
   7B73 C9            [10] 1733 	ret
                           1734 ;src/main.c:380: void avanzarMapa() {
                           1735 ;	---------------------------------
                           1736 ; Function avanzarMapa
                           1737 ; ---------------------------------
   7B74                    1738 _avanzarMapa::
                           1739 ;src/main.c:381: if(num_mapa < NUM_MAPAS -1) {
   7B74 3A F5 69      [13] 1740 	ld	a,(#_num_mapa + 0)
   7B77 D6 02         [ 7] 1741 	sub	a, #0x02
   7B79 D2 3D 73      [10] 1742 	jp	NC,_menuFin
                           1743 ;src/main.c:382: mapa = mapas[++num_mapa];
   7B7C 21 F5 69      [10] 1744 	ld	hl, #_num_mapa+0
   7B7F 34            [11] 1745 	inc	(hl)
   7B80 FD 21 F5 69   [14] 1746 	ld	iy,#_num_mapa
   7B84 FD 6E 00      [19] 1747 	ld	l,0 (iy)
   7B87 26 00         [ 7] 1748 	ld	h,#0x00
   7B89 29            [11] 1749 	add	hl, hl
   7B8A 11 93 72      [10] 1750 	ld	de,#_mapas
   7B8D 19            [11] 1751 	add	hl,de
   7B8E 7E            [ 7] 1752 	ld	a,(hl)
   7B8F FD 21 F3 69   [14] 1753 	ld	iy,#_mapa
   7B93 FD 77 00      [19] 1754 	ld	0 (iy),a
   7B96 23            [ 6] 1755 	inc	hl
   7B97 7E            [ 7] 1756 	ld	a,(hl)
   7B98 32 F4 69      [13] 1757 	ld	(#_mapa + 1),a
                           1758 ;src/main.c:383: prota.x = prota.px = 2;
   7B9B 21 E2 69      [10] 1759 	ld	hl,#(_prota + 0x0002)
   7B9E 36 02         [10] 1760 	ld	(hl),#0x02
   7BA0 21 E0 69      [10] 1761 	ld	hl,#_prota
   7BA3 36 02         [10] 1762 	ld	(hl),#0x02
                           1763 ;src/main.c:384: prota.mover = SI;
   7BA5 21 E6 69      [10] 1764 	ld	hl,#(_prota + 0x0006)
   7BA8 36 01         [10] 1765 	ld	(hl),#0x01
                           1766 ;src/main.c:385: dibujarMapa();
   7BAA CD 7D 72      [17] 1767 	call	_dibujarMapa
                           1768 ;src/main.c:386: inicializarEnemy();
   7BAD C3 94 81      [10] 1769 	jp  _inicializarEnemy
                           1770 ;src/main.c:390: menuFin();
   7BB0 C3 3D 73      [10] 1771 	jp  _menuFin
                           1772 ;src/main.c:394: void moverIzquierda() {
                           1773 ;	---------------------------------
                           1774 ; Function moverIzquierda
                           1775 ; ---------------------------------
   7BB3                    1776 _moverIzquierda::
                           1777 ;src/main.c:395: prota.mira = M_izquierda;
   7BB3 01 E0 69      [10] 1778 	ld	bc,#_prota+0
   7BB6 21 E7 69      [10] 1779 	ld	hl,#(_prota + 0x0007)
   7BB9 36 01         [10] 1780 	ld	(hl),#0x01
                           1781 ;src/main.c:396: if (!checkCollision(M_izquierda)) {
   7BBB C5            [11] 1782 	push	bc
   7BBC 21 01 00      [10] 1783 	ld	hl,#0x0001
   7BBF E5            [11] 1784 	push	hl
   7BC0 CD C9 73      [17] 1785 	call	_checkCollision
   7BC3 F1            [10] 1786 	pop	af
   7BC4 C1            [10] 1787 	pop	bc
   7BC5 7D            [ 4] 1788 	ld	a,l
   7BC6 B7            [ 4] 1789 	or	a, a
   7BC7 C0            [11] 1790 	ret	NZ
                           1791 ;src/main.c:397: prota.x--;
   7BC8 0A            [ 7] 1792 	ld	a,(bc)
   7BC9 C6 FF         [ 7] 1793 	add	a,#0xFF
   7BCB 02            [ 7] 1794 	ld	(bc),a
                           1795 ;src/main.c:398: prota.mover = SI;
   7BCC 21 E6 69      [10] 1796 	ld	hl,#(_prota + 0x0006)
   7BCF 36 01         [10] 1797 	ld	(hl),#0x01
                           1798 ;src/main.c:399: prota.sprite = g_hero_left;
   7BD1 21 FE 49      [10] 1799 	ld	hl,#_g_hero_left
   7BD4 22 E4 69      [16] 1800 	ld	((_prota + 0x0004)), hl
   7BD7 C9            [10] 1801 	ret
                           1802 ;src/main.c:403: void moverDerecha() {
                           1803 ;	---------------------------------
                           1804 ; Function moverDerecha
                           1805 ; ---------------------------------
   7BD8                    1806 _moverDerecha::
                           1807 ;src/main.c:404: prota.mira = M_derecha;
   7BD8 21 E7 69      [10] 1808 	ld	hl,#(_prota + 0x0007)
   7BDB 36 00         [10] 1809 	ld	(hl),#0x00
                           1810 ;src/main.c:405: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7BDD 21 00 00      [10] 1811 	ld	hl,#0x0000
   7BE0 E5            [11] 1812 	push	hl
   7BE1 CD C9 73      [17] 1813 	call	_checkCollision
   7BE4 F1            [10] 1814 	pop	af
   7BE5 45            [ 4] 1815 	ld	b,l
   7BE6 21 E0 69      [10] 1816 	ld	hl, #_prota + 0
   7BE9 4E            [ 7] 1817 	ld	c,(hl)
   7BEA 59            [ 4] 1818 	ld	e,c
   7BEB 16 00         [ 7] 1819 	ld	d,#0x00
   7BED 21 07 00      [10] 1820 	ld	hl,#0x0007
   7BF0 19            [11] 1821 	add	hl,de
   7BF1 11 50 80      [10] 1822 	ld	de, #0x8050
   7BF4 29            [11] 1823 	add	hl, hl
   7BF5 3F            [ 4] 1824 	ccf
   7BF6 CB 1C         [ 8] 1825 	rr	h
   7BF8 CB 1D         [ 8] 1826 	rr	l
   7BFA ED 52         [15] 1827 	sbc	hl, de
   7BFC 3E 00         [ 7] 1828 	ld	a,#0x00
   7BFE 17            [ 4] 1829 	rla
   7BFF 5F            [ 4] 1830 	ld	e,a
   7C00 78            [ 4] 1831 	ld	a,b
   7C01 B7            [ 4] 1832 	or	a,a
   7C02 20 14         [12] 1833 	jr	NZ,00104$
   7C04 B3            [ 4] 1834 	or	a,e
   7C05 28 11         [12] 1835 	jr	Z,00104$
                           1836 ;src/main.c:406: prota.x++;
   7C07 0C            [ 4] 1837 	inc	c
   7C08 21 E0 69      [10] 1838 	ld	hl,#_prota
   7C0B 71            [ 7] 1839 	ld	(hl),c
                           1840 ;src/main.c:407: prota.mover = SI;
   7C0C 21 E6 69      [10] 1841 	ld	hl,#(_prota + 0x0006)
   7C0F 36 01         [10] 1842 	ld	(hl),#0x01
                           1843 ;src/main.c:408: prota.sprite = g_hero;
   7C11 21 A8 4A      [10] 1844 	ld	hl,#_g_hero
   7C14 22 E4 69      [16] 1845 	ld	((_prota + 0x0004)), hl
   7C17 C9            [10] 1846 	ret
   7C18                    1847 00104$:
                           1848 ;src/main.c:410: }else if( prota.x + G_HERO_W >= 80){
   7C18 7B            [ 4] 1849 	ld	a,e
   7C19 B7            [ 4] 1850 	or	a, a
   7C1A C0            [11] 1851 	ret	NZ
                           1852 ;src/main.c:411: avanzarMapa();
   7C1B C3 74 7B      [10] 1853 	jp  _avanzarMapa
                           1854 ;src/main.c:415: void moverArriba() {
                           1855 ;	---------------------------------
                           1856 ; Function moverArriba
                           1857 ; ---------------------------------
   7C1E                    1858 _moverArriba::
                           1859 ;src/main.c:416: prota.mira = M_arriba;
   7C1E 21 E7 69      [10] 1860 	ld	hl,#(_prota + 0x0007)
   7C21 36 02         [10] 1861 	ld	(hl),#0x02
                           1862 ;src/main.c:417: if (!checkCollision(M_arriba)) { // TODO: COMPROBAR
   7C23 21 02 00      [10] 1863 	ld	hl,#0x0002
   7C26 E5            [11] 1864 	push	hl
   7C27 CD C9 73      [17] 1865 	call	_checkCollision
   7C2A F1            [10] 1866 	pop	af
   7C2B 7D            [ 4] 1867 	ld	a,l
   7C2C B7            [ 4] 1868 	or	a, a
   7C2D C0            [11] 1869 	ret	NZ
                           1870 ;src/main.c:418: prota.y--;
   7C2E 21 E1 69      [10] 1871 	ld	hl,#_prota + 1
   7C31 4E            [ 7] 1872 	ld	c,(hl)
   7C32 0D            [ 4] 1873 	dec	c
   7C33 71            [ 7] 1874 	ld	(hl),c
                           1875 ;src/main.c:419: prota.y--;
   7C34 0D            [ 4] 1876 	dec	c
   7C35 71            [ 7] 1877 	ld	(hl),c
                           1878 ;src/main.c:420: prota.mover  = SI;
   7C36 21 E6 69      [10] 1879 	ld	hl,#(_prota + 0x0006)
   7C39 36 01         [10] 1880 	ld	(hl),#0x01
                           1881 ;src/main.c:421: prota.sprite = g_hero_up;
   7C3B 21 64 49      [10] 1882 	ld	hl,#_g_hero_up
   7C3E 22 E4 69      [16] 1883 	ld	((_prota + 0x0004)), hl
   7C41 C9            [10] 1884 	ret
                           1885 ;src/main.c:425: void moverAbajo() {
                           1886 ;	---------------------------------
                           1887 ; Function moverAbajo
                           1888 ; ---------------------------------
   7C42                    1889 _moverAbajo::
                           1890 ;src/main.c:426: prota.mira = M_abajo;
   7C42 21 E7 69      [10] 1891 	ld	hl,#(_prota + 0x0007)
   7C45 36 03         [10] 1892 	ld	(hl),#0x03
                           1893 ;src/main.c:427: if (!checkCollision(M_abajo) ) { // TODO: COMPROBAR
   7C47 21 03 00      [10] 1894 	ld	hl,#0x0003
   7C4A E5            [11] 1895 	push	hl
   7C4B CD C9 73      [17] 1896 	call	_checkCollision
   7C4E F1            [10] 1897 	pop	af
   7C4F 7D            [ 4] 1898 	ld	a,l
   7C50 B7            [ 4] 1899 	or	a, a
   7C51 C0            [11] 1900 	ret	NZ
                           1901 ;src/main.c:428: prota.y++;
   7C52 01 E1 69      [10] 1902 	ld	bc,#_prota + 1
   7C55 0A            [ 7] 1903 	ld	a,(bc)
   7C56 3C            [ 4] 1904 	inc	a
   7C57 02            [ 7] 1905 	ld	(bc),a
                           1906 ;src/main.c:429: prota.y++;
   7C58 3C            [ 4] 1907 	inc	a
   7C59 02            [ 7] 1908 	ld	(bc),a
                           1909 ;src/main.c:430: prota.mover  = SI;
   7C5A 21 E6 69      [10] 1910 	ld	hl,#(_prota + 0x0006)
   7C5D 36 01         [10] 1911 	ld	(hl),#0x01
                           1912 ;src/main.c:431: prota.sprite = g_hero_down;
   7C5F 21 CA 48      [10] 1913 	ld	hl,#_g_hero_down
   7C62 22 E4 69      [16] 1914 	ld	((_prota + 0x0004)), hl
   7C65 C9            [10] 1915 	ret
                           1916 ;src/main.c:435: void dibujarCuchillo() {
                           1917 ;	---------------------------------
                           1918 ; Function dibujarCuchillo
                           1919 ; ---------------------------------
   7C66                    1920 _dibujarCuchillo::
   7C66 DD E5         [15] 1921 	push	ix
   7C68 DD 21 00 00   [14] 1922 	ld	ix,#0
   7C6C DD 39         [15] 1923 	add	ix,sp
   7C6E F5            [11] 1924 	push	af
                           1925 ;src/main.c:436: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   7C6F 21 E9 69      [10] 1926 	ld	hl, #_cu + 1
   7C72 56            [ 7] 1927 	ld	d,(hl)
   7C73 21 E8 69      [10] 1928 	ld	hl, #_cu + 0
   7C76 46            [ 7] 1929 	ld	b,(hl)
   7C77 D5            [11] 1930 	push	de
   7C78 33            [ 6] 1931 	inc	sp
   7C79 C5            [11] 1932 	push	bc
   7C7A 33            [ 6] 1933 	inc	sp
   7C7B 21 00 C0      [10] 1934 	ld	hl,#0xC000
   7C7E E5            [11] 1935 	push	hl
   7C7F CD 9B 64      [17] 1936 	call	_cpct_getScreenPtr
   7C82 45            [ 4] 1937 	ld	b,l
   7C83 5C            [ 4] 1938 	ld	e,h
                           1939 ;src/main.c:437: if(cu.eje == E_X){
   7C84 21 F0 69      [10] 1940 	ld	hl, #_cu + 8
   7C87 4E            [ 7] 1941 	ld	c,(hl)
                           1942 ;src/main.c:438: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   7C88 DD 70 FE      [19] 1943 	ld	-2 (ix),b
   7C8B DD 73 FF      [19] 1944 	ld	-1 (ix),e
                           1945 ;src/main.c:437: if(cu.eje == E_X){
   7C8E 79            [ 4] 1946 	ld	a,c
   7C8F B7            [ 4] 1947 	or	a, a
   7C90 20 19         [12] 1948 	jr	NZ,00104$
                           1949 ;src/main.c:438: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   7C92 11 00 0E      [10] 1950 	ld	de,#_g_tablatrans+0
   7C95 ED 4B EC 69   [20] 1951 	ld	bc, (#(_cu + 0x0004) + 0)
   7C99 D5            [11] 1952 	push	de
   7C9A 21 04 04      [10] 1953 	ld	hl,#0x0404
   7C9D E5            [11] 1954 	push	hl
   7C9E DD 6E FE      [19] 1955 	ld	l,-2 (ix)
   7CA1 DD 66 FF      [19] 1956 	ld	h,-1 (ix)
   7CA4 E5            [11] 1957 	push	hl
   7CA5 C5            [11] 1958 	push	bc
   7CA6 CD BB 64      [17] 1959 	call	_cpct_drawSpriteMaskedAlignedTable
   7CA9 18 1A         [12] 1960 	jr	00106$
   7CAB                    1961 00104$:
                           1962 ;src/main.c:441: else if(cu.eje == E_Y){
   7CAB 0D            [ 4] 1963 	dec	c
   7CAC 20 17         [12] 1964 	jr	NZ,00106$
                           1965 ;src/main.c:442: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   7CAE 11 00 0E      [10] 1966 	ld	de,#_g_tablatrans+0
   7CB1 ED 4B EC 69   [20] 1967 	ld	bc, (#(_cu + 0x0004) + 0)
   7CB5 D5            [11] 1968 	push	de
   7CB6 21 02 08      [10] 1969 	ld	hl,#0x0802
   7CB9 E5            [11] 1970 	push	hl
   7CBA DD 6E FE      [19] 1971 	ld	l,-2 (ix)
   7CBD DD 66 FF      [19] 1972 	ld	h,-1 (ix)
   7CC0 E5            [11] 1973 	push	hl
   7CC1 C5            [11] 1974 	push	bc
   7CC2 CD BB 64      [17] 1975 	call	_cpct_drawSpriteMaskedAlignedTable
   7CC5                    1976 00106$:
   7CC5 DD F9         [10] 1977 	ld	sp, ix
   7CC7 DD E1         [14] 1978 	pop	ix
   7CC9 C9            [10] 1979 	ret
                           1980 ;src/main.c:446: void borrarCuchillo() {
                           1981 ;	---------------------------------
                           1982 ; Function borrarCuchillo
                           1983 ; ---------------------------------
   7CCA                    1984 _borrarCuchillo::
   7CCA DD E5         [15] 1985 	push	ix
   7CCC DD 21 00 00   [14] 1986 	ld	ix,#0
   7CD0 DD 39         [15] 1987 	add	ix,sp
   7CD2 F5            [11] 1988 	push	af
   7CD3 3B            [ 6] 1989 	dec	sp
                           1990 ;src/main.c:448: u8 w = 2 + (cu.px & 1);
   7CD4 21 EA 69      [10] 1991 	ld	hl, #_cu + 2
   7CD7 4E            [ 7] 1992 	ld	c,(hl)
   7CD8 79            [ 4] 1993 	ld	a,c
   7CD9 E6 01         [ 7] 1994 	and	a, #0x01
   7CDB 47            [ 4] 1995 	ld	b,a
   7CDC 04            [ 4] 1996 	inc	b
   7CDD 04            [ 4] 1997 	inc	b
                           1998 ;src/main.c:449: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   7CDE 21 EB 69      [10] 1999 	ld	hl, #_cu + 3
   7CE1 5E            [ 7] 2000 	ld	e,(hl)
   7CE2 7B            [ 4] 2001 	ld	a,e
   7CE3 E6 03         [ 7] 2002 	and	a, #0x03
   7CE5 28 04         [12] 2003 	jr	Z,00105$
   7CE7 3E 01         [ 7] 2004 	ld	a,#0x01
   7CE9 18 02         [12] 2005 	jr	00106$
   7CEB                    2006 00105$:
   7CEB 3E 00         [ 7] 2007 	ld	a,#0x00
   7CED                    2008 00106$:
   7CED C6 02         [ 7] 2009 	add	a, #0x02
   7CEF DD 77 FD      [19] 2010 	ld	-3 (ix),a
                           2011 ;src/main.c:450: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   7CF2 FD 2A F3 69   [20] 2012 	ld	iy,(_mapa)
   7CF6 16 00         [ 7] 2013 	ld	d,#0x00
   7CF8 7B            [ 4] 2014 	ld	a,e
   7CF9 C6 E8         [ 7] 2015 	add	a,#0xE8
   7CFB DD 77 FE      [19] 2016 	ld	-2 (ix),a
   7CFE 7A            [ 4] 2017 	ld	a,d
   7CFF CE FF         [ 7] 2018 	adc	a,#0xFF
   7D01 DD 77 FF      [19] 2019 	ld	-1 (ix),a
   7D04 DD 6E FE      [19] 2020 	ld	l,-2 (ix)
   7D07 DD 66 FF      [19] 2021 	ld	h,-1 (ix)
   7D0A DD CB FF 7E   [20] 2022 	bit	7, -1 (ix)
   7D0E 28 04         [12] 2023 	jr	Z,00107$
   7D10 21 EB FF      [10] 2024 	ld	hl,#0xFFEB
   7D13 19            [11] 2025 	add	hl,de
   7D14                    2026 00107$:
   7D14 CB 2C         [ 8] 2027 	sra	h
   7D16 CB 1D         [ 8] 2028 	rr	l
   7D18 CB 2C         [ 8] 2029 	sra	h
   7D1A CB 1D         [ 8] 2030 	rr	l
   7D1C 55            [ 4] 2031 	ld	d,l
   7D1D CB 39         [ 8] 2032 	srl	c
   7D1F FD E5         [15] 2033 	push	iy
   7D21 21 F0 C0      [10] 2034 	ld	hl,#0xC0F0
   7D24 E5            [11] 2035 	push	hl
   7D25 3E 28         [ 7] 2036 	ld	a,#0x28
   7D27 F5            [11] 2037 	push	af
   7D28 33            [ 6] 2038 	inc	sp
   7D29 DD 7E FD      [19] 2039 	ld	a,-3 (ix)
   7D2C F5            [11] 2040 	push	af
   7D2D 33            [ 6] 2041 	inc	sp
   7D2E C5            [11] 2042 	push	bc
   7D2F 33            [ 6] 2043 	inc	sp
   7D30 D5            [11] 2044 	push	de
   7D31 33            [ 6] 2045 	inc	sp
   7D32 79            [ 4] 2046 	ld	a,c
   7D33 F5            [11] 2047 	push	af
   7D34 33            [ 6] 2048 	inc	sp
   7D35 CD 3C 59      [17] 2049 	call	_cpct_etm_drawTileBox2x4
                           2050 ;src/main.c:451: if(!cu.mover){
   7D38 3A F1 69      [13] 2051 	ld	a, (#_cu + 9)
   7D3B B7            [ 4] 2052 	or	a, a
   7D3C 20 05         [12] 2053 	jr	NZ,00103$
                           2054 ;src/main.c:452: cu.lanzado = NO;
   7D3E 21 EE 69      [10] 2055 	ld	hl,#(_cu + 0x0006)
   7D41 36 00         [10] 2056 	ld	(hl),#0x00
   7D43                    2057 00103$:
   7D43 DD F9         [10] 2058 	ld	sp, ix
   7D45 DD E1         [14] 2059 	pop	ix
   7D47 C9            [10] 2060 	ret
                           2061 ;src/main.c:456: void redibujarCuchillo( ) {
                           2062 ;	---------------------------------
                           2063 ; Function redibujarCuchillo
                           2064 ; ---------------------------------
   7D48                    2065 _redibujarCuchillo::
                           2066 ;src/main.c:457: borrarCuchillo();
   7D48 CD CA 7C      [17] 2067 	call	_borrarCuchillo
                           2068 ;src/main.c:458: cu.px = cu.x;
   7D4B 01 EA 69      [10] 2069 	ld	bc,#_cu + 2
   7D4E 3A E8 69      [13] 2070 	ld	a, (#_cu + 0)
   7D51 02            [ 7] 2071 	ld	(bc),a
                           2072 ;src/main.c:459: cu.py = cu.y;
   7D52 01 EB 69      [10] 2073 	ld	bc,#_cu + 3
   7D55 3A E9 69      [13] 2074 	ld	a, (#_cu + 1)
   7D58 02            [ 7] 2075 	ld	(bc),a
                           2076 ;src/main.c:460: dibujarCuchillo();
   7D59 C3 66 7C      [10] 2077 	jp  _dibujarCuchillo
                           2078 ;src/main.c:463: void lanzarCuchillo(){
                           2079 ;	---------------------------------
                           2080 ; Function lanzarCuchillo
                           2081 ; ---------------------------------
   7D5C                    2082 _lanzarCuchillo::
                           2083 ;src/main.c:465: if(!cu.lanzado){
   7D5C 3A EE 69      [13] 2084 	ld	a, (#(_cu + 0x0006) + 0)
   7D5F B7            [ 4] 2085 	or	a, a
   7D60 C0            [11] 2086 	ret	NZ
                           2087 ;src/main.c:467: if(prota.mira == M_derecha){
   7D61 21 E7 69      [10] 2088 	ld	hl, #_prota + 7
   7D64 5E            [ 7] 2089 	ld	e,(hl)
                           2090 ;src/main.c:468: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   7D65 01 E1 69      [10] 2091 	ld	bc,#_prota + 1
                           2092 ;src/main.c:470: cu.direccion = M_derecha;
                           2093 ;src/main.c:472: cu.y=prota.y + G_HERO_H /2;
                           2094 ;src/main.c:473: cu.sprite=g_knifeX_0;
                           2095 ;src/main.c:474: cu.eje = E_X;
                           2096 ;src/main.c:467: if(prota.mira == M_derecha){
   7D68 7B            [ 4] 2097 	ld	a,e
   7D69 B7            [ 4] 2098 	or	a, a
   7D6A 20 41         [12] 2099 	jr	NZ,00118$
                           2100 ;src/main.c:468: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   7D6C 0A            [ 7] 2101 	ld	a,(bc)
   7D6D C6 0B         [ 7] 2102 	add	a, #0x0B
   7D6F 5F            [ 4] 2103 	ld	e,a
   7D70 3A E0 69      [13] 2104 	ld	a, (#_prota + 0)
   7D73 C6 0C         [ 7] 2105 	add	a, #0x0C
   7D75 6F            [ 4] 2106 	ld	l,a
   7D76 C5            [11] 2107 	push	bc
   7D77 7B            [ 4] 2108 	ld	a,e
   7D78 F5            [11] 2109 	push	af
   7D79 33            [ 6] 2110 	inc	sp
   7D7A 7D            [ 4] 2111 	ld	a,l
   7D7B F5            [11] 2112 	push	af
   7D7C 33            [ 6] 2113 	inc	sp
   7D7D CD 88 73      [17] 2114 	call	_getTilePtr
   7D80 F1            [10] 2115 	pop	af
   7D81 C1            [10] 2116 	pop	bc
   7D82 5E            [ 7] 2117 	ld	e,(hl)
   7D83 3E 02         [ 7] 2118 	ld	a,#0x02
   7D85 93            [ 4] 2119 	sub	a, e
   7D86 D8            [11] 2120 	ret	C
                           2121 ;src/main.c:469: cu.lanzado = SI;
   7D87 21 EE 69      [10] 2122 	ld	hl,#(_cu + 0x0006)
   7D8A 36 01         [10] 2123 	ld	(hl),#0x01
                           2124 ;src/main.c:470: cu.direccion = M_derecha;
   7D8C 21 EF 69      [10] 2125 	ld	hl,#(_cu + 0x0007)
   7D8F 36 00         [10] 2126 	ld	(hl),#0x00
                           2127 ;src/main.c:471: cu.x=prota.x + G_HERO_W;
   7D91 3A E0 69      [13] 2128 	ld	a, (#_prota + 0)
   7D94 C6 07         [ 7] 2129 	add	a, #0x07
   7D96 32 E8 69      [13] 2130 	ld	(#_cu),a
                           2131 ;src/main.c:472: cu.y=prota.y + G_HERO_H /2;
   7D99 0A            [ 7] 2132 	ld	a,(bc)
   7D9A C6 0B         [ 7] 2133 	add	a, #0x0B
   7D9C 32 E9 69      [13] 2134 	ld	(#(_cu + 0x0001)),a
                           2135 ;src/main.c:473: cu.sprite=g_knifeX_0;
   7D9F 21 C0 24      [10] 2136 	ld	hl,#_g_knifeX_0
   7DA2 22 EC 69      [16] 2137 	ld	((_cu + 0x0004)), hl
                           2138 ;src/main.c:474: cu.eje = E_X;
   7DA5 21 F0 69      [10] 2139 	ld	hl,#(_cu + 0x0008)
   7DA8 36 00         [10] 2140 	ld	(hl),#0x00
                           2141 ;src/main.c:475: dibujarCuchillo();
   7DAA C3 66 7C      [10] 2142 	jp  _dibujarCuchillo
   7DAD                    2143 00118$:
                           2144 ;src/main.c:478: else if(prota.mira == M_izquierda){
   7DAD 7B            [ 4] 2145 	ld	a,e
   7DAE 3D            [ 4] 2146 	dec	a
   7DAF 20 41         [12] 2147 	jr	NZ,00115$
                           2148 ;src/main.c:479: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   7DB1 0A            [ 7] 2149 	ld	a,(bc)
   7DB2 C6 0B         [ 7] 2150 	add	a, #0x0B
   7DB4 5F            [ 4] 2151 	ld	e,a
   7DB5 3A E0 69      [13] 2152 	ld	a, (#_prota + 0)
   7DB8 C6 F6         [ 7] 2153 	add	a,#0xF6
   7DBA 6F            [ 4] 2154 	ld	l,a
   7DBB C5            [11] 2155 	push	bc
   7DBC 7B            [ 4] 2156 	ld	a,e
   7DBD F5            [11] 2157 	push	af
   7DBE 33            [ 6] 2158 	inc	sp
   7DBF 7D            [ 4] 2159 	ld	a,l
   7DC0 F5            [11] 2160 	push	af
   7DC1 33            [ 6] 2161 	inc	sp
   7DC2 CD 88 73      [17] 2162 	call	_getTilePtr
   7DC5 F1            [10] 2163 	pop	af
   7DC6 C1            [10] 2164 	pop	bc
   7DC7 5E            [ 7] 2165 	ld	e,(hl)
   7DC8 3E 02         [ 7] 2166 	ld	a,#0x02
   7DCA 93            [ 4] 2167 	sub	a, e
   7DCB D8            [11] 2168 	ret	C
                           2169 ;src/main.c:480: cu.lanzado = SI;
   7DCC 21 EE 69      [10] 2170 	ld	hl,#(_cu + 0x0006)
   7DCF 36 01         [10] 2171 	ld	(hl),#0x01
                           2172 ;src/main.c:481: cu.direccion = M_izquierda;
   7DD1 21 EF 69      [10] 2173 	ld	hl,#(_cu + 0x0007)
   7DD4 36 01         [10] 2174 	ld	(hl),#0x01
                           2175 ;src/main.c:482: cu.x = prota.x - G_KNIFEX_0_W;
   7DD6 3A E0 69      [13] 2176 	ld	a, (#_prota + 0)
   7DD9 C6 FC         [ 7] 2177 	add	a,#0xFC
   7DDB 32 E8 69      [13] 2178 	ld	(#_cu),a
                           2179 ;src/main.c:483: cu.y = prota.y + G_HERO_H /2;
   7DDE 0A            [ 7] 2180 	ld	a,(bc)
   7DDF C6 0B         [ 7] 2181 	add	a, #0x0B
   7DE1 32 E9 69      [13] 2182 	ld	(#(_cu + 0x0001)),a
                           2183 ;src/main.c:484: cu.sprite = g_knifeX_1;
   7DE4 21 D0 24      [10] 2184 	ld	hl,#_g_knifeX_1
   7DE7 22 EC 69      [16] 2185 	ld	((_cu + 0x0004)), hl
                           2186 ;src/main.c:485: cu.eje = E_X;
   7DEA 21 F0 69      [10] 2187 	ld	hl,#(_cu + 0x0008)
   7DED 36 00         [10] 2188 	ld	(hl),#0x00
                           2189 ;src/main.c:486: dibujarCuchillo();
   7DEF C3 66 7C      [10] 2190 	jp  _dibujarCuchillo
   7DF2                    2191 00115$:
                           2192 ;src/main.c:489: else if(prota.mira == M_abajo){
   7DF2 7B            [ 4] 2193 	ld	a,e
   7DF3 D6 03         [ 7] 2194 	sub	a, #0x03
   7DF5 20 41         [12] 2195 	jr	NZ,00112$
                           2196 ;src/main.c:491: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   7DF7 0A            [ 7] 2197 	ld	a,(bc)
   7DF8 C6 1F         [ 7] 2198 	add	a, #0x1F
   7DFA 5F            [ 4] 2199 	ld	e,a
   7DFB 3A E0 69      [13] 2200 	ld	a, (#_prota + 0)
   7DFE 57            [ 4] 2201 	ld	d,a
   7DFF 14            [ 4] 2202 	inc	d
   7E00 14            [ 4] 2203 	inc	d
   7E01 14            [ 4] 2204 	inc	d
   7E02 C5            [11] 2205 	push	bc
   7E03 7B            [ 4] 2206 	ld	a,e
   7E04 F5            [11] 2207 	push	af
   7E05 33            [ 6] 2208 	inc	sp
   7E06 D5            [11] 2209 	push	de
   7E07 33            [ 6] 2210 	inc	sp
   7E08 CD 88 73      [17] 2211 	call	_getTilePtr
   7E0B F1            [10] 2212 	pop	af
   7E0C C1            [10] 2213 	pop	bc
   7E0D 5E            [ 7] 2214 	ld	e,(hl)
   7E0E 3E 02         [ 7] 2215 	ld	a,#0x02
   7E10 93            [ 4] 2216 	sub	a, e
   7E11 D8            [11] 2217 	ret	C
                           2218 ;src/main.c:492: cu.lanzado = SI;
   7E12 21 EE 69      [10] 2219 	ld	hl,#(_cu + 0x0006)
   7E15 36 01         [10] 2220 	ld	(hl),#0x01
                           2221 ;src/main.c:493: cu.direccion = M_abajo;
   7E17 21 EF 69      [10] 2222 	ld	hl,#(_cu + 0x0007)
   7E1A 36 03         [10] 2223 	ld	(hl),#0x03
                           2224 ;src/main.c:494: cu.x = prota.x + G_HERO_W / 2;
   7E1C 3A E0 69      [13] 2225 	ld	a, (#_prota + 0)
   7E1F C6 03         [ 7] 2226 	add	a, #0x03
   7E21 32 E8 69      [13] 2227 	ld	(#_cu),a
                           2228 ;src/main.c:495: cu.y = prota.y + G_HERO_H;
   7E24 0A            [ 7] 2229 	ld	a,(bc)
   7E25 C6 16         [ 7] 2230 	add	a, #0x16
   7E27 32 E9 69      [13] 2231 	ld	(#(_cu + 0x0001)),a
                           2232 ;src/main.c:496: cu.sprite = g_knifeY_0;
   7E2A 21 A0 24      [10] 2233 	ld	hl,#_g_knifeY_0
   7E2D 22 EC 69      [16] 2234 	ld	((_cu + 0x0004)), hl
                           2235 ;src/main.c:497: cu.eje = E_Y;
   7E30 21 F0 69      [10] 2236 	ld	hl,#(_cu + 0x0008)
   7E33 36 01         [10] 2237 	ld	(hl),#0x01
                           2238 ;src/main.c:498: dibujarCuchillo();
   7E35 C3 66 7C      [10] 2239 	jp  _dibujarCuchillo
   7E38                    2240 00112$:
                           2241 ;src/main.c:501: else if(prota.mira == M_arriba){
   7E38 7B            [ 4] 2242 	ld	a,e
   7E39 D6 02         [ 7] 2243 	sub	a, #0x02
   7E3B C0            [11] 2244 	ret	NZ
                           2245 ;src/main.c:502: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   7E3C 0A            [ 7] 2246 	ld	a,(bc)
   7E3D C6 F7         [ 7] 2247 	add	a,#0xF7
   7E3F 57            [ 4] 2248 	ld	d,a
   7E40 3A E0 69      [13] 2249 	ld	a, (#_prota + 0)
   7E43 C6 03         [ 7] 2250 	add	a, #0x03
   7E45 C5            [11] 2251 	push	bc
   7E46 D5            [11] 2252 	push	de
   7E47 33            [ 6] 2253 	inc	sp
   7E48 F5            [11] 2254 	push	af
   7E49 33            [ 6] 2255 	inc	sp
   7E4A CD 88 73      [17] 2256 	call	_getTilePtr
   7E4D F1            [10] 2257 	pop	af
   7E4E C1            [10] 2258 	pop	bc
   7E4F 5E            [ 7] 2259 	ld	e,(hl)
   7E50 3E 02         [ 7] 2260 	ld	a,#0x02
   7E52 93            [ 4] 2261 	sub	a, e
   7E53 D8            [11] 2262 	ret	C
                           2263 ;src/main.c:503: cu.lanzado = SI;
   7E54 21 EE 69      [10] 2264 	ld	hl,#(_cu + 0x0006)
   7E57 36 01         [10] 2265 	ld	(hl),#0x01
                           2266 ;src/main.c:504: cu.direccion = M_arriba;
   7E59 21 EF 69      [10] 2267 	ld	hl,#(_cu + 0x0007)
   7E5C 36 02         [10] 2268 	ld	(hl),#0x02
                           2269 ;src/main.c:505: cu.x = prota.x + G_HERO_W / 2;
   7E5E 3A E0 69      [13] 2270 	ld	a, (#_prota + 0)
   7E61 C6 03         [ 7] 2271 	add	a, #0x03
   7E63 32 E8 69      [13] 2272 	ld	(#_cu),a
                           2273 ;src/main.c:506: cu.y = prota.y;
   7E66 0A            [ 7] 2274 	ld	a,(bc)
   7E67 32 E9 69      [13] 2275 	ld	(#(_cu + 0x0001)),a
                           2276 ;src/main.c:507: cu.sprite = g_knifeY_1;
   7E6A 21 B0 24      [10] 2277 	ld	hl,#_g_knifeY_1
   7E6D 22 EC 69      [16] 2278 	ld	((_cu + 0x0004)), hl
                           2279 ;src/main.c:508: cu.eje = E_Y;
   7E70 21 F0 69      [10] 2280 	ld	hl,#(_cu + 0x0008)
   7E73 36 01         [10] 2281 	ld	(hl),#0x01
                           2282 ;src/main.c:509: dibujarCuchillo();
   7E75 C3 66 7C      [10] 2283 	jp  _dibujarCuchillo
                           2284 ;src/main.c:515: void comprobarTeclado() {
                           2285 ;	---------------------------------
                           2286 ; Function comprobarTeclado
                           2287 ; ---------------------------------
   7E78                    2288 _comprobarTeclado::
                           2289 ;src/main.c:516: cpct_scanKeyboard_if();
   7E78 CD EC 5A      [17] 2290 	call	_cpct_scanKeyboard_if
                           2291 ;src/main.c:518: if (cpct_isAnyKeyPressed()) {
   7E7B CD DF 5A      [17] 2292 	call	_cpct_isAnyKeyPressed
   7E7E 7D            [ 4] 2293 	ld	a,l
   7E7F B7            [ 4] 2294 	or	a, a
   7E80 C8            [11] 2295 	ret	Z
                           2296 ;src/main.c:519: if (cpct_isKeyPressed(Key_CursorLeft))
   7E81 21 01 01      [10] 2297 	ld	hl,#0x0101
   7E84 CD F1 57      [17] 2298 	call	_cpct_isKeyPressed
   7E87 7D            [ 4] 2299 	ld	a,l
   7E88 B7            [ 4] 2300 	or	a, a
                           2301 ;src/main.c:520: moverIzquierda();
   7E89 C2 B3 7B      [10] 2302 	jp	NZ,_moverIzquierda
                           2303 ;src/main.c:521: else if (cpct_isKeyPressed(Key_CursorRight))
   7E8C 21 00 02      [10] 2304 	ld	hl,#0x0200
   7E8F CD F1 57      [17] 2305 	call	_cpct_isKeyPressed
   7E92 7D            [ 4] 2306 	ld	a,l
   7E93 B7            [ 4] 2307 	or	a, a
                           2308 ;src/main.c:522: moverDerecha();
   7E94 C2 D8 7B      [10] 2309 	jp	NZ,_moverDerecha
                           2310 ;src/main.c:523: else if (cpct_isKeyPressed(Key_CursorUp))
   7E97 21 00 01      [10] 2311 	ld	hl,#0x0100
   7E9A CD F1 57      [17] 2312 	call	_cpct_isKeyPressed
   7E9D 7D            [ 4] 2313 	ld	a,l
   7E9E B7            [ 4] 2314 	or	a, a
                           2315 ;src/main.c:524: moverArriba();
   7E9F C2 1E 7C      [10] 2316 	jp	NZ,_moverArriba
                           2317 ;src/main.c:525: else if (cpct_isKeyPressed(Key_CursorDown))
   7EA2 21 00 04      [10] 2318 	ld	hl,#0x0400
   7EA5 CD F1 57      [17] 2319 	call	_cpct_isKeyPressed
   7EA8 7D            [ 4] 2320 	ld	a,l
   7EA9 B7            [ 4] 2321 	or	a, a
                           2322 ;src/main.c:526: moverAbajo();
   7EAA C2 42 7C      [10] 2323 	jp	NZ,_moverAbajo
                           2324 ;src/main.c:527: else if (cpct_isKeyPressed(Key_Space))
   7EAD 21 05 80      [10] 2325 	ld	hl,#0x8005
   7EB0 CD F1 57      [17] 2326 	call	_cpct_isKeyPressed
   7EB3 7D            [ 4] 2327 	ld	a,l
   7EB4 B7            [ 4] 2328 	or	a, a
   7EB5 C8            [11] 2329 	ret	Z
                           2330 ;src/main.c:528: lanzarCuchillo();
   7EB6 C3 5C 7D      [10] 2331 	jp  _lanzarCuchillo
                           2332 ;src/main.c:532: u8 checkKnifeCollision(int direction, u8 xoff, u8 yoff){
                           2333 ;	---------------------------------
                           2334 ; Function checkKnifeCollision
                           2335 ; ---------------------------------
   7EB9                    2336 _checkKnifeCollision::
                           2337 ;src/main.c:534: return *getTilePtr(cu.x + xoff, cu.y + yoff) <= 2;
   7EB9 3A E9 69      [13] 2338 	ld	a,(#_cu + 1)
   7EBC 21 05 00      [10] 2339 	ld	hl,#5
   7EBF 39            [11] 2340 	add	hl,sp
   7EC0 86            [ 7] 2341 	add	a, (hl)
   7EC1 47            [ 4] 2342 	ld	b,a
   7EC2 3A E8 69      [13] 2343 	ld	a,(#_cu + 0)
   7EC5 21 04 00      [10] 2344 	ld	hl,#4
   7EC8 39            [11] 2345 	add	hl,sp
   7EC9 86            [ 7] 2346 	add	a, (hl)
   7ECA 4F            [ 4] 2347 	ld	c,a
   7ECB C5            [11] 2348 	push	bc
   7ECC CD 88 73      [17] 2349 	call	_getTilePtr
   7ECF F1            [10] 2350 	pop	af
   7ED0 4E            [ 7] 2351 	ld	c,(hl)
   7ED1 3E 02         [ 7] 2352 	ld	a,#0x02
   7ED3 91            [ 4] 2353 	sub	a, c
   7ED4 3E 00         [ 7] 2354 	ld	a,#0x00
   7ED6 17            [ 4] 2355 	rla
   7ED7 EE 01         [ 7] 2356 	xor	a, #0x01
   7ED9 6F            [ 4] 2357 	ld	l, a
   7EDA C9            [10] 2358 	ret
                           2359 ;src/main.c:537: void moverCuchillo(){
                           2360 ;	---------------------------------
                           2361 ; Function moverCuchillo
                           2362 ; ---------------------------------
   7EDB                    2363 _moverCuchillo::
                           2364 ;src/main.c:538: if(cu.lanzado){
   7EDB 01 E8 69      [10] 2365 	ld	bc,#_cu+0
   7EDE 3A EE 69      [13] 2366 	ld	a, (#_cu + 6)
   7EE1 B7            [ 4] 2367 	or	a, a
   7EE2 C8            [11] 2368 	ret	Z
                           2369 ;src/main.c:539: cu.mover = SI;
   7EE3 21 09 00      [10] 2370 	ld	hl,#0x0009
   7EE6 09            [11] 2371 	add	hl,bc
   7EE7 EB            [ 4] 2372 	ex	de,hl
   7EE8 3E 01         [ 7] 2373 	ld	a,#0x01
   7EEA 12            [ 7] 2374 	ld	(de),a
                           2375 ;src/main.c:540: if(cu.direccion == M_derecha){
   7EEB 21 EF 69      [10] 2376 	ld	hl, #_cu + 7
   7EEE 6E            [ 7] 2377 	ld	l,(hl)
   7EEF 7D            [ 4] 2378 	ld	a,l
   7EF0 B7            [ 4] 2379 	or	a, a
   7EF1 20 1E         [12] 2380 	jr	NZ,00122$
                           2381 ;src/main.c:542: if(checkKnifeCollision(M_derecha, G_KNIFEX_0_W + 1, 0)){
   7EF3 C5            [11] 2382 	push	bc
   7EF4 D5            [11] 2383 	push	de
   7EF5 21 05 00      [10] 2384 	ld	hl,#0x0005
   7EF8 E5            [11] 2385 	push	hl
   7EF9 2E 00         [ 7] 2386 	ld	l, #0x00
   7EFB E5            [11] 2387 	push	hl
   7EFC CD B9 7E      [17] 2388 	call	_checkKnifeCollision
   7EFF F1            [10] 2389 	pop	af
   7F00 F1            [10] 2390 	pop	af
   7F01 D1            [10] 2391 	pop	de
   7F02 C1            [10] 2392 	pop	bc
   7F03 7D            [ 4] 2393 	ld	a,l
   7F04 B7            [ 4] 2394 	or	a, a
   7F05 28 07         [12] 2395 	jr	Z,00102$
                           2396 ;src/main.c:543: cu.mover = SI;
   7F07 3E 01         [ 7] 2397 	ld	a,#0x01
   7F09 12            [ 7] 2398 	ld	(de),a
                           2399 ;src/main.c:544: cu.x++;
   7F0A 0A            [ 7] 2400 	ld	a,(bc)
   7F0B 3C            [ 4] 2401 	inc	a
   7F0C 02            [ 7] 2402 	ld	(bc),a
   7F0D C9            [10] 2403 	ret
   7F0E                    2404 00102$:
                           2405 ;src/main.c:547: cu.mover=NO;
   7F0E AF            [ 4] 2406 	xor	a, a
   7F0F 12            [ 7] 2407 	ld	(de),a
   7F10 C9            [10] 2408 	ret
   7F11                    2409 00122$:
                           2410 ;src/main.c:550: else if(cu.direccion == M_izquierda){
   7F11 7D            [ 4] 2411 	ld	a,l
   7F12 3D            [ 4] 2412 	dec	a
   7F13 20 1F         [12] 2413 	jr	NZ,00119$
                           2414 ;src/main.c:551: if(checkKnifeCollision(M_derecha, -1, 0)){
   7F15 C5            [11] 2415 	push	bc
   7F16 D5            [11] 2416 	push	de
   7F17 21 FF 00      [10] 2417 	ld	hl,#0x00FF
   7F1A E5            [11] 2418 	push	hl
   7F1B 2E 00         [ 7] 2419 	ld	l, #0x00
   7F1D E5            [11] 2420 	push	hl
   7F1E CD B9 7E      [17] 2421 	call	_checkKnifeCollision
   7F21 F1            [10] 2422 	pop	af
   7F22 F1            [10] 2423 	pop	af
   7F23 D1            [10] 2424 	pop	de
   7F24 C1            [10] 2425 	pop	bc
   7F25 7D            [ 4] 2426 	ld	a,l
   7F26 B7            [ 4] 2427 	or	a, a
   7F27 28 08         [12] 2428 	jr	Z,00105$
                           2429 ;src/main.c:552: cu.mover = SI;
   7F29 3E 01         [ 7] 2430 	ld	a,#0x01
   7F2B 12            [ 7] 2431 	ld	(de),a
                           2432 ;src/main.c:553: cu.x--;
   7F2C 0A            [ 7] 2433 	ld	a,(bc)
   7F2D C6 FF         [ 7] 2434 	add	a,#0xFF
   7F2F 02            [ 7] 2435 	ld	(bc),a
   7F30 C9            [10] 2436 	ret
   7F31                    2437 00105$:
                           2438 ;src/main.c:555: cu.mover=NO;
   7F31 AF            [ 4] 2439 	xor	a, a
   7F32 12            [ 7] 2440 	ld	(de),a
   7F33 C9            [10] 2441 	ret
   7F34                    2442 00119$:
                           2443 ;src/main.c:561: cu.y--;
   7F34 03            [ 6] 2444 	inc	bc
                           2445 ;src/main.c:558: else if(cu.direccion == M_arriba){
   7F35 7D            [ 4] 2446 	ld	a,l
   7F36 D6 02         [ 7] 2447 	sub	a, #0x02
   7F38 20 22         [12] 2448 	jr	NZ,00116$
                           2449 ;src/main.c:559: if(checkKnifeCollision(M_derecha, 0, -2)){
   7F3A C5            [11] 2450 	push	bc
   7F3B D5            [11] 2451 	push	de
   7F3C 21 00 FE      [10] 2452 	ld	hl,#0xFE00
   7F3F E5            [11] 2453 	push	hl
   7F40 26 00         [ 7] 2454 	ld	h, #0x00
   7F42 E5            [11] 2455 	push	hl
   7F43 CD B9 7E      [17] 2456 	call	_checkKnifeCollision
   7F46 F1            [10] 2457 	pop	af
   7F47 F1            [10] 2458 	pop	af
   7F48 D1            [10] 2459 	pop	de
   7F49 C1            [10] 2460 	pop	bc
   7F4A 7D            [ 4] 2461 	ld	a,l
   7F4B B7            [ 4] 2462 	or	a, a
   7F4C 28 0B         [12] 2463 	jr	Z,00108$
                           2464 ;src/main.c:560: cu.mover = SI;
   7F4E 3E 01         [ 7] 2465 	ld	a,#0x01
   7F50 12            [ 7] 2466 	ld	(de),a
                           2467 ;src/main.c:561: cu.y--;
   7F51 0A            [ 7] 2468 	ld	a,(bc)
   7F52 C6 FF         [ 7] 2469 	add	a,#0xFF
   7F54 02            [ 7] 2470 	ld	(bc),a
                           2471 ;src/main.c:562: cu.y--;
   7F55 C6 FF         [ 7] 2472 	add	a,#0xFF
   7F57 02            [ 7] 2473 	ld	(bc),a
   7F58 C9            [10] 2474 	ret
   7F59                    2475 00108$:
                           2476 ;src/main.c:565: cu.mover=NO;
   7F59 AF            [ 4] 2477 	xor	a, a
   7F5A 12            [ 7] 2478 	ld	(de),a
   7F5B C9            [10] 2479 	ret
   7F5C                    2480 00116$:
                           2481 ;src/main.c:568: else if(cu.direccion == M_abajo){
   7F5C 7D            [ 4] 2482 	ld	a,l
   7F5D D6 03         [ 7] 2483 	sub	a, #0x03
   7F5F C0            [11] 2484 	ret	NZ
                           2485 ;src/main.c:569: if(checkKnifeCollision(M_derecha, 0, G_KNIFEY_0_H + 2)){
   7F60 C5            [11] 2486 	push	bc
   7F61 D5            [11] 2487 	push	de
   7F62 21 00 0A      [10] 2488 	ld	hl,#0x0A00
   7F65 E5            [11] 2489 	push	hl
   7F66 26 00         [ 7] 2490 	ld	h, #0x00
   7F68 E5            [11] 2491 	push	hl
   7F69 CD B9 7E      [17] 2492 	call	_checkKnifeCollision
   7F6C F1            [10] 2493 	pop	af
   7F6D F1            [10] 2494 	pop	af
   7F6E D1            [10] 2495 	pop	de
   7F6F C1            [10] 2496 	pop	bc
   7F70 7D            [ 4] 2497 	ld	a,l
   7F71 B7            [ 4] 2498 	or	a, a
   7F72 28 09         [12] 2499 	jr	Z,00111$
                           2500 ;src/main.c:570: cu.mover = SI;
   7F74 3E 01         [ 7] 2501 	ld	a,#0x01
   7F76 12            [ 7] 2502 	ld	(de),a
                           2503 ;src/main.c:571: cu.y++;
   7F77 0A            [ 7] 2504 	ld	a,(bc)
   7F78 3C            [ 4] 2505 	inc	a
   7F79 02            [ 7] 2506 	ld	(bc),a
                           2507 ;src/main.c:572: cu.y++;
   7F7A 3C            [ 4] 2508 	inc	a
   7F7B 02            [ 7] 2509 	ld	(bc),a
   7F7C C9            [10] 2510 	ret
   7F7D                    2511 00111$:
                           2512 ;src/main.c:575: cu.mover=NO;
   7F7D AF            [ 4] 2513 	xor	a, a
   7F7E 12            [ 7] 2514 	ld	(de),a
   7F7F C9            [10] 2515 	ret
                           2516 ;src/main.c:581: void barraPuntuacionInicial(){
                           2517 ;	---------------------------------
                           2518 ; Function barraPuntuacionInicial
                           2519 ; ---------------------------------
   7F80                    2520 _barraPuntuacionInicial::
                           2521 ;src/main.c:586: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   7F80 21 00 02      [10] 2522 	ld	hl,#0x0200
   7F83 E5            [11] 2523 	push	hl
   7F84 26 C0         [ 7] 2524 	ld	h, #0xC0
   7F86 E5            [11] 2525 	push	hl
   7F87 CD 9B 64      [17] 2526 	call	_cpct_getScreenPtr
   7F8A 4D            [ 4] 2527 	ld	c,l
   7F8B 44            [ 4] 2528 	ld	b,h
                           2529 ;src/main.c:587: cpct_drawStringM0("SCORE", memptr, 1, 0);
   7F8C 21 01 00      [10] 2530 	ld	hl,#0x0001
   7F8F E5            [11] 2531 	push	hl
   7F90 C5            [11] 2532 	push	bc
   7F91 21 28 80      [10] 2533 	ld	hl,#___str_1
   7F94 E5            [11] 2534 	push	hl
   7F95 CD 73 58      [17] 2535 	call	_cpct_drawStringM0
   7F98 21 06 00      [10] 2536 	ld	hl,#6
   7F9B 39            [11] 2537 	add	hl,sp
   7F9C F9            [ 6] 2538 	ld	sp,hl
                           2539 ;src/main.c:588: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   7F9D 21 00 0E      [10] 2540 	ld	hl,#0x0E00
   7FA0 E5            [11] 2541 	push	hl
   7FA1 26 C0         [ 7] 2542 	ld	h, #0xC0
   7FA3 E5            [11] 2543 	push	hl
   7FA4 CD 9B 64      [17] 2544 	call	_cpct_getScreenPtr
   7FA7 4D            [ 4] 2545 	ld	c,l
   7FA8 44            [ 4] 2546 	ld	b,h
                           2547 ;src/main.c:589: cpct_drawStringM0("00000", memptr, 15, 0);
   7FA9 21 0F 00      [10] 2548 	ld	hl,#0x000F
   7FAC E5            [11] 2549 	push	hl
   7FAD C5            [11] 2550 	push	bc
   7FAE 21 2E 80      [10] 2551 	ld	hl,#___str_2
   7FB1 E5            [11] 2552 	push	hl
   7FB2 CD 73 58      [17] 2553 	call	_cpct_drawStringM0
   7FB5 21 06 00      [10] 2554 	ld	hl,#6
   7FB8 39            [11] 2555 	add	hl,sp
   7FB9 F9            [ 6] 2556 	ld	sp,hl
                           2557 ;src/main.c:592: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 14);
   7FBA 21 1A 0E      [10] 2558 	ld	hl,#0x0E1A
   7FBD E5            [11] 2559 	push	hl
   7FBE 21 00 C0      [10] 2560 	ld	hl,#0xC000
   7FC1 E5            [11] 2561 	push	hl
   7FC2 CD 9B 64      [17] 2562 	call	_cpct_getScreenPtr
   7FC5 4D            [ 4] 2563 	ld	c,l
   7FC6 44            [ 4] 2564 	ld	b,h
                           2565 ;src/main.c:593: cpct_drawStringM0("ROBOBIT", memptr, 3, 0);
   7FC7 21 03 00      [10] 2566 	ld	hl,#0x0003
   7FCA E5            [11] 2567 	push	hl
   7FCB C5            [11] 2568 	push	bc
   7FCC 21 34 80      [10] 2569 	ld	hl,#___str_3
   7FCF E5            [11] 2570 	push	hl
   7FD0 CD 73 58      [17] 2571 	call	_cpct_drawStringM0
   7FD3 21 06 00      [10] 2572 	ld	hl,#6
   7FD6 39            [11] 2573 	add	hl,sp
   7FD7 F9            [ 6] 2574 	ld	sp,hl
                           2575 ;src/main.c:595: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   7FD8 21 3C 02      [10] 2576 	ld	hl,#0x023C
   7FDB E5            [11] 2577 	push	hl
   7FDC 21 00 C0      [10] 2578 	ld	hl,#0xC000
   7FDF E5            [11] 2579 	push	hl
   7FE0 CD 9B 64      [17] 2580 	call	_cpct_getScreenPtr
   7FE3 4D            [ 4] 2581 	ld	c,l
   7FE4 44            [ 4] 2582 	ld	b,h
                           2583 ;src/main.c:596: cpct_drawStringM0("LIVES", memptr, 1, 0);
   7FE5 21 01 00      [10] 2584 	ld	hl,#0x0001
   7FE8 E5            [11] 2585 	push	hl
   7FE9 C5            [11] 2586 	push	bc
   7FEA 21 3C 80      [10] 2587 	ld	hl,#___str_4
   7FED E5            [11] 2588 	push	hl
   7FEE CD 73 58      [17] 2589 	call	_cpct_drawStringM0
   7FF1 21 06 00      [10] 2590 	ld	hl,#6
   7FF4 39            [11] 2591 	add	hl,sp
   7FF5 F9            [ 6] 2592 	ld	sp,hl
                           2593 ;src/main.c:598: for(i=0; i<5; i++){
   7FF6 01 00 00      [10] 2594 	ld	bc,#0x0000
   7FF9                    2595 00102$:
                           2596 ;src/main.c:599: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   7FF9 79            [ 4] 2597 	ld	a,c
   7FFA 87            [ 4] 2598 	add	a, a
   7FFB 87            [ 4] 2599 	add	a, a
   7FFC C6 3C         [ 7] 2600 	add	a, #0x3C
   7FFE 57            [ 4] 2601 	ld	d,a
   7FFF C5            [11] 2602 	push	bc
   8000 3E 0E         [ 7] 2603 	ld	a,#0x0E
   8002 F5            [11] 2604 	push	af
   8003 33            [ 6] 2605 	inc	sp
   8004 D5            [11] 2606 	push	de
   8005 33            [ 6] 2607 	inc	sp
   8006 21 00 C0      [10] 2608 	ld	hl,#0xC000
   8009 E5            [11] 2609 	push	hl
   800A CD 9B 64      [17] 2610 	call	_cpct_getScreenPtr
   800D EB            [ 4] 2611 	ex	de,hl
   800E 21 03 06      [10] 2612 	ld	hl,#0x0603
   8011 E5            [11] 2613 	push	hl
   8012 D5            [11] 2614 	push	de
   8013 21 60 48      [10] 2615 	ld	hl,#_g_heart
   8016 E5            [11] 2616 	push	hl
   8017 CD 97 58      [17] 2617 	call	_cpct_drawSprite
   801A C1            [10] 2618 	pop	bc
                           2619 ;src/main.c:598: for(i=0; i<5; i++){
   801B 03            [ 6] 2620 	inc	bc
   801C 79            [ 4] 2621 	ld	a,c
   801D D6 05         [ 7] 2622 	sub	a, #0x05
   801F 78            [ 4] 2623 	ld	a,b
   8020 17            [ 4] 2624 	rla
   8021 3F            [ 4] 2625 	ccf
   8022 1F            [ 4] 2626 	rra
   8023 DE 80         [ 7] 2627 	sbc	a, #0x80
   8025 38 D2         [12] 2628 	jr	C,00102$
   8027 C9            [10] 2629 	ret
   8028                    2630 ___str_1:
   8028 53 43 4F 52 45     2631 	.ascii "SCORE"
   802D 00                 2632 	.db 0x00
   802E                    2633 ___str_2:
   802E 30 30 30 30 30     2634 	.ascii "00000"
   8033 00                 2635 	.db 0x00
   8034                    2636 ___str_3:
   8034 52 4F 42 4F 42 49  2637 	.ascii "ROBOBIT"
        54
   803B 00                 2638 	.db 0x00
   803C                    2639 ___str_4:
   803C 4C 49 56 45 53     2640 	.ascii "LIVES"
   8041 00                 2641 	.db 0x00
                           2642 ;src/main.c:604: void borrarPantallaArriba(u8 x, u8 y, u8 ancho, u8 alto){
                           2643 ;	---------------------------------
                           2644 ; Function borrarPantallaArriba
                           2645 ; ---------------------------------
   8042                    2646 _borrarPantallaArriba::
   8042 DD E5         [15] 2647 	push	ix
   8044 DD 21 00 00   [14] 2648 	ld	ix,#0
   8048 DD 39         [15] 2649 	add	ix,sp
                           2650 ;src/main.c:607: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   804A DD 66 05      [19] 2651 	ld	h,5 (ix)
   804D DD 6E 04      [19] 2652 	ld	l,4 (ix)
   8050 E5            [11] 2653 	push	hl
   8051 21 00 C0      [10] 2654 	ld	hl,#0xC000
   8054 E5            [11] 2655 	push	hl
   8055 CD 9B 64      [17] 2656 	call	_cpct_getScreenPtr
   8058 4D            [ 4] 2657 	ld	c,l
   8059 44            [ 4] 2658 	ld	b,h
                           2659 ;src/main.c:608: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra la mitad derecha
   805A DD 66 07      [19] 2660 	ld	h,7 (ix)
   805D DD 6E 06      [19] 2661 	ld	l,6 (ix)
   8060 E5            [11] 2662 	push	hl
   8061 AF            [ 4] 2663 	xor	a, a
   8062 F5            [11] 2664 	push	af
   8063 33            [ 6] 2665 	inc	sp
   8064 C5            [11] 2666 	push	bc
   8065 CD C1 63      [17] 2667 	call	_cpct_drawSolidBox
   8068 F1            [10] 2668 	pop	af
   8069 F1            [10] 2669 	pop	af
   806A 33            [ 6] 2670 	inc	sp
                           2671 ;src/main.c:609: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   806B DD 7E 04      [19] 2672 	ld	a,4 (ix)
   806E C6 28         [ 7] 2673 	add	a, #0x28
   8070 47            [ 4] 2674 	ld	b,a
   8071 DD 7E 05      [19] 2675 	ld	a,5 (ix)
   8074 F5            [11] 2676 	push	af
   8075 33            [ 6] 2677 	inc	sp
   8076 C5            [11] 2678 	push	bc
   8077 33            [ 6] 2679 	inc	sp
   8078 21 00 C0      [10] 2680 	ld	hl,#0xC000
   807B E5            [11] 2681 	push	hl
   807C CD 9B 64      [17] 2682 	call	_cpct_getScreenPtr
   807F 4D            [ 4] 2683 	ld	c,l
   8080 44            [ 4] 2684 	ld	b,h
                           2685 ;src/main.c:610: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra la mitad izquierda
   8081 DD 66 07      [19] 2686 	ld	h,7 (ix)
   8084 DD 6E 06      [19] 2687 	ld	l,6 (ix)
   8087 E5            [11] 2688 	push	hl
   8088 AF            [ 4] 2689 	xor	a, a
   8089 F5            [11] 2690 	push	af
   808A 33            [ 6] 2691 	inc	sp
   808B C5            [11] 2692 	push	bc
   808C CD C1 63      [17] 2693 	call	_cpct_drawSolidBox
   808F F1            [10] 2694 	pop	af
   8090 F1            [10] 2695 	pop	af
   8091 33            [ 6] 2696 	inc	sp
   8092 DD E1         [14] 2697 	pop	ix
   8094 C9            [10] 2698 	ret
                           2699 ;src/main.c:613: void menuInicio(){
                           2700 ;	---------------------------------
                           2701 ; Function menuInicio
                           2702 ; ---------------------------------
   8095                    2703 _menuInicio::
                           2704 ;src/main.c:617: cpct_clearScreen(0);
   8095 21 00 40      [10] 2705 	ld	hl,#0x4000
   8098 E5            [11] 2706 	push	hl
   8099 AF            [ 4] 2707 	xor	a, a
   809A F5            [11] 2708 	push	af
   809B 33            [ 6] 2709 	inc	sp
   809C 26 C0         [ 7] 2710 	ld	h, #0xC0
   809E E5            [11] 2711 	push	hl
   809F CD 7A 5B      [17] 2712 	call	_cpct_memset
                           2713 ;src/main.c:619: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   80A2 21 1A 0F      [10] 2714 	ld	hl,#0x0F1A
   80A5 E5            [11] 2715 	push	hl
   80A6 21 00 C0      [10] 2716 	ld	hl,#0xC000
   80A9 E5            [11] 2717 	push	hl
   80AA CD 9B 64      [17] 2718 	call	_cpct_getScreenPtr
   80AD 4D            [ 4] 2719 	ld	c,l
   80AE 44            [ 4] 2720 	ld	b,h
                           2721 ;src/main.c:620: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   80AF 21 04 00      [10] 2722 	ld	hl,#0x0004
   80B2 E5            [11] 2723 	push	hl
   80B3 C5            [11] 2724 	push	bc
   80B4 21 48 81      [10] 2725 	ld	hl,#___str_5
   80B7 E5            [11] 2726 	push	hl
   80B8 CD 73 58      [17] 2727 	call	_cpct_drawStringM0
   80BB 21 06 00      [10] 2728 	ld	hl,#6
   80BE 39            [11] 2729 	add	hl,sp
   80BF F9            [ 6] 2730 	ld	sp,hl
                           2731 ;src/main.c:622: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   80C0 21 28 6E      [10] 2732 	ld	hl,#0x6E28
   80C3 E5            [11] 2733 	push	hl
   80C4 21 F0 F0      [10] 2734 	ld	hl,#0xF0F0
   80C7 E5            [11] 2735 	push	hl
   80C8 21 00 26      [10] 2736 	ld	hl,#_g_text_0
   80CB E5            [11] 2737 	push	hl
   80CC CD 97 58      [17] 2738 	call	_cpct_drawSprite
                           2739 ;src/main.c:623: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   80CF 21 28 6E      [10] 2740 	ld	hl,#0x6E28
   80D2 E5            [11] 2741 	push	hl
   80D3 21 18 F1      [10] 2742 	ld	hl,#0xF118
   80D6 E5            [11] 2743 	push	hl
   80D7 21 30 37      [10] 2744 	ld	hl,#_g_text_1
   80DA E5            [11] 2745 	push	hl
   80DB CD 97 58      [17] 2746 	call	_cpct_drawSprite
                           2747 ;src/main.c:646: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   80DE 21 08 A0      [10] 2748 	ld	hl,#0xA008
   80E1 E5            [11] 2749 	push	hl
   80E2 21 00 C0      [10] 2750 	ld	hl,#0xC000
   80E5 E5            [11] 2751 	push	hl
   80E6 CD 9B 64      [17] 2752 	call	_cpct_getScreenPtr
   80E9 4D            [ 4] 2753 	ld	c,l
   80EA 44            [ 4] 2754 	ld	b,h
                           2755 ;src/main.c:647: cpct_drawStringM0("TO START PRESS S", memptr, 4, 0);
   80EB 21 04 00      [10] 2756 	ld	hl,#0x0004
   80EE E5            [11] 2757 	push	hl
   80EF C5            [11] 2758 	push	bc
   80F0 21 50 81      [10] 2759 	ld	hl,#___str_6
   80F3 E5            [11] 2760 	push	hl
   80F4 CD 73 58      [17] 2761 	call	_cpct_drawStringM0
   80F7 21 06 00      [10] 2762 	ld	hl,#6
   80FA 39            [11] 2763 	add	hl,sp
   80FB F9            [ 6] 2764 	ld	sp,hl
                           2765 ;src/main.c:649: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 170); // centrado en horizontal y abajo en vertical
   80FC 21 0A AA      [10] 2766 	ld	hl,#0xAA0A
   80FF E5            [11] 2767 	push	hl
   8100 21 00 C0      [10] 2768 	ld	hl,#0xC000
   8103 E5            [11] 2769 	push	hl
   8104 CD 9B 64      [17] 2770 	call	_cpct_getScreenPtr
   8107 4D            [ 4] 2771 	ld	c,l
   8108 44            [ 4] 2772 	ld	b,h
                           2773 ;src/main.c:650: cpct_drawStringM0("TO MENU PRESS M", memptr, 4, 0);
   8109 21 04 00      [10] 2774 	ld	hl,#0x0004
   810C E5            [11] 2775 	push	hl
   810D C5            [11] 2776 	push	bc
   810E 21 61 81      [10] 2777 	ld	hl,#___str_7
   8111 E5            [11] 2778 	push	hl
   8112 CD 73 58      [17] 2779 	call	_cpct_drawStringM0
   8115 21 06 00      [10] 2780 	ld	hl,#6
   8118 39            [11] 2781 	add	hl,sp
   8119 F9            [ 6] 2782 	ld	sp,hl
                           2783 ;src/main.c:653: do{
   811A                    2784 00106$:
                           2785 ;src/main.c:654: cpct_scanKeyboard_f();
   811A CD FD 57      [17] 2786 	call	_cpct_scanKeyboard_f
                           2787 ;src/main.c:658: if(cpct_isKeyPressed(Key_M)){
   811D 21 04 40      [10] 2788 	ld	hl,#0x4004
   8120 CD F1 57      [17] 2789 	call	_cpct_isKeyPressed
   8123 7D            [ 4] 2790 	ld	a,l
   8124 B7            [ 4] 2791 	or	a, a
   8125 28 0D         [12] 2792 	jr	Z,00107$
                           2793 ;src/main.c:659: cpct_scanKeyboard_f();
   8127 CD FD 57      [17] 2794 	call	_cpct_scanKeyboard_f
                           2795 ;src/main.c:660: do{
   812A                    2796 00101$:
                           2797 ;src/main.c:662: } while(!cpct_isKeyPressed(Key_S));
   812A 21 07 10      [10] 2798 	ld	hl,#0x1007
   812D CD F1 57      [17] 2799 	call	_cpct_isKeyPressed
   8130 7D            [ 4] 2800 	ld	a,l
   8131 B7            [ 4] 2801 	or	a, a
   8132 28 F6         [12] 2802 	jr	Z,00101$
   8134                    2803 00107$:
                           2804 ;src/main.c:664: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   8134 21 07 10      [10] 2805 	ld	hl,#0x1007
   8137 CD F1 57      [17] 2806 	call	_cpct_isKeyPressed
   813A 7D            [ 4] 2807 	ld	a,l
   813B B7            [ 4] 2808 	or	a, a
   813C C0            [11] 2809 	ret	NZ
   813D 21 04 40      [10] 2810 	ld	hl,#0x4004
   8140 CD F1 57      [17] 2811 	call	_cpct_isKeyPressed
   8143 7D            [ 4] 2812 	ld	a,l
   8144 B7            [ 4] 2813 	or	a, a
   8145 28 D3         [12] 2814 	jr	Z,00106$
   8147 C9            [10] 2815 	ret
   8148                    2816 ___str_5:
   8148 52 4F 42 4F 42 49  2817 	.ascii "ROBOBIT"
        54
   814F 00                 2818 	.db 0x00
   8150                    2819 ___str_6:
   8150 54 4F 20 53 54 41  2820 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   8160 00                 2821 	.db 0x00
   8161                    2822 ___str_7:
   8161 54 4F 20 4D 45 4E  2823 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   8170 00                 2824 	.db 0x00
                           2825 ;src/main.c:667: void inicializarCPC() {
                           2826 ;	---------------------------------
                           2827 ; Function inicializarCPC
                           2828 ; ---------------------------------
   8171                    2829 _inicializarCPC::
                           2830 ;src/main.c:668: cpct_disableFirmware();
   8171 CD B1 63      [17] 2831 	call	_cpct_disableFirmware
                           2832 ;src/main.c:669: cpct_setVideoMode(0);
   8174 2E 00         [ 7] 2833 	ld	l,#0x00
   8176 CD 5C 5B      [17] 2834 	call	_cpct_setVideoMode
                           2835 ;src/main.c:670: cpct_setBorder(HW_BLACK);
   8179 21 10 14      [10] 2836 	ld	hl,#0x1410
   817C E5            [11] 2837 	push	hl
   817D CD 67 58      [17] 2838 	call	_cpct_setPALColour
                           2839 ;src/main.c:671: cpct_setPalette(g_palette, 16);
   8180 21 10 00      [10] 2840 	ld	hl,#0x0010
   8183 E5            [11] 2841 	push	hl
   8184 21 98 4A      [10] 2842 	ld	hl,#_g_palette
   8187 E5            [11] 2843 	push	hl
   8188 CD DA 57      [17] 2844 	call	_cpct_setPalette
                           2845 ;src/main.c:672: cpct_akp_musicInit(G_song);
   818B 21 00 0F      [10] 2846 	ld	hl,#_G_song
   818E E5            [11] 2847 	push	hl
   818F CD 8D 62      [17] 2848 	call	_cpct_akp_musicInit
   8192 F1            [10] 2849 	pop	af
   8193 C9            [10] 2850 	ret
                           2851 ;src/main.c:675: void inicializarEnemy() {
                           2852 ;	---------------------------------
                           2853 ; Function inicializarEnemy
                           2854 ; ---------------------------------
   8194                    2855 _inicializarEnemy::
   8194 DD E5         [15] 2856 	push	ix
   8196 DD 21 00 00   [14] 2857 	ld	ix,#0
   819A DD 39         [15] 2858 	add	ix,sp
   819C F5            [11] 2859 	push	af
   819D 3B            [ 6] 2860 	dec	sp
                           2861 ;src/main.c:686: actual = enemy;
   819E 01 F8 64      [10] 2862 	ld	bc,#_enemy+0
                           2863 ;src/main.c:687: while(--i){
   81A1 DD 36 FD 02   [19] 2864 	ld	-3 (ix),#0x02
   81A5                    2865 00101$:
   81A5 DD 35 FD      [23] 2866 	dec	-3 (ix)
   81A8 DD 7E FD      [19] 2867 	ld	a,-3 (ix)
   81AB B7            [ 4] 2868 	or	a, a
   81AC CA 41 82      [10] 2869 	jp	Z,00104$
                           2870 ;src/main.c:688: actual->x = actual->px = spawnX[i];
   81AF 59            [ 4] 2871 	ld	e, c
   81B0 50            [ 4] 2872 	ld	d, b
   81B1 13            [ 6] 2873 	inc	de
   81B2 13            [ 6] 2874 	inc	de
   81B3 3E 99         [ 7] 2875 	ld	a,#<(_spawnX)
   81B5 DD 86 FD      [19] 2876 	add	a, -3 (ix)
   81B8 6F            [ 4] 2877 	ld	l,a
   81B9 3E 72         [ 7] 2878 	ld	a,#>(_spawnX)
   81BB CE 00         [ 7] 2879 	adc	a, #0x00
   81BD 67            [ 4] 2880 	ld	h,a
   81BE 7E            [ 7] 2881 	ld	a,(hl)
   81BF DD 77 FF      [19] 2882 	ld	-1 (ix), a
   81C2 12            [ 7] 2883 	ld	(de),a
   81C3 DD 7E FF      [19] 2884 	ld	a,-1 (ix)
   81C6 02            [ 7] 2885 	ld	(bc),a
                           2886 ;src/main.c:689: actual->y = actual->py = spawnY[i];
   81C7 C5            [11] 2887 	push	bc
   81C8 FD E1         [14] 2888 	pop	iy
   81CA FD 23         [10] 2889 	inc	iy
   81CC 59            [ 4] 2890 	ld	e, c
   81CD 50            [ 4] 2891 	ld	d, b
   81CE 13            [ 6] 2892 	inc	de
   81CF 13            [ 6] 2893 	inc	de
   81D0 13            [ 6] 2894 	inc	de
   81D1 3E 9E         [ 7] 2895 	ld	a,#<(_spawnY)
   81D3 DD 86 FD      [19] 2896 	add	a, -3 (ix)
   81D6 6F            [ 4] 2897 	ld	l,a
   81D7 3E 72         [ 7] 2898 	ld	a,#>(_spawnY)
   81D9 CE 00         [ 7] 2899 	adc	a, #0x00
   81DB 67            [ 4] 2900 	ld	h,a
   81DC 7E            [ 7] 2901 	ld	a,(hl)
   81DD DD 77 FE      [19] 2902 	ld	-2 (ix), a
   81E0 12            [ 7] 2903 	ld	(de),a
   81E1 DD 7E FE      [19] 2904 	ld	a,-2 (ix)
   81E4 FD 77 00      [19] 2905 	ld	0 (iy), a
                           2906 ;src/main.c:690: actual->mover  = NO;
   81E7 21 06 00      [10] 2907 	ld	hl,#0x0006
   81EA 09            [11] 2908 	add	hl,bc
   81EB 36 00         [10] 2909 	ld	(hl),#0x00
                           2910 ;src/main.c:691: actual->mira   = M_abajo;
   81ED 21 07 00      [10] 2911 	ld	hl,#0x0007
   81F0 09            [11] 2912 	add	hl,bc
   81F1 36 03         [10] 2913 	ld	(hl),#0x03
                           2914 ;src/main.c:692: actual->sprite = g_enemy;
   81F3 21 04 00      [10] 2915 	ld	hl,#0x0004
   81F6 09            [11] 2916 	add	hl,bc
   81F7 36 72         [10] 2917 	ld	(hl),#<(_g_enemy)
   81F9 23            [ 6] 2918 	inc	hl
   81FA 36 48         [10] 2919 	ld	(hl),#>(_g_enemy)
                           2920 ;src/main.c:693: actual->muerto = NO;
   81FC 21 08 00      [10] 2921 	ld	hl,#0x0008
   81FF 09            [11] 2922 	add	hl,bc
   8200 36 00         [10] 2923 	ld	(hl),#0x00
                           2924 ;src/main.c:694: actual->muertes = 0;
   8202 21 0C 00      [10] 2925 	ld	hl,#0x000C
   8205 09            [11] 2926 	add	hl,bc
   8206 36 00         [10] 2927 	ld	(hl),#0x00
                           2928 ;src/main.c:695: actual->patroling = SI;
   8208 21 09 00      [10] 2929 	ld	hl,#0x0009
   820B 09            [11] 2930 	add	hl,bc
   820C 36 01         [10] 2931 	ld	(hl),#0x01
                           2932 ;src/main.c:696: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   820E 21 E1 69      [10] 2933 	ld	hl, #_prota + 1
   8211 5E            [ 7] 2934 	ld	e,(hl)
   8212 21 E0 69      [10] 2935 	ld	hl, #_prota + 0
   8215 56            [ 7] 2936 	ld	d,(hl)
   8216 C5            [11] 2937 	push	bc
   8217 2A F3 69      [16] 2938 	ld	hl,(_mapa)
   821A E5            [11] 2939 	push	hl
   821B C5            [11] 2940 	push	bc
   821C 7B            [ 4] 2941 	ld	a,e
   821D F5            [11] 2942 	push	af
   821E 33            [ 6] 2943 	inc	sp
   821F D5            [11] 2944 	push	de
   8220 33            [ 6] 2945 	inc	sp
   8221 DD 66 FE      [19] 2946 	ld	h,-2 (ix)
   8224 DD 6E FF      [19] 2947 	ld	l,-1 (ix)
   8227 E5            [11] 2948 	push	hl
   8228 CD 06 54      [17] 2949 	call	_pathFinding
   822B 21 08 00      [10] 2950 	ld	hl,#8
   822E 39            [11] 2951 	add	hl,sp
   822F F9            [ 6] 2952 	ld	sp,hl
   8230 C1            [10] 2953 	pop	bc
                           2954 ;src/main.c:719: dibujarEnemigo(actual);
   8231 C5            [11] 2955 	push	bc
   8232 C5            [11] 2956 	push	bc
   8233 CD 1E 75      [17] 2957 	call	_dibujarEnemigo
   8236 F1            [10] 2958 	pop	af
   8237 C1            [10] 2959 	pop	bc
                           2960 ;src/main.c:721: ++actual;
   8238 21 3A 01      [10] 2961 	ld	hl,#0x013A
   823B 09            [11] 2962 	add	hl,bc
   823C 4D            [ 4] 2963 	ld	c,l
   823D 44            [ 4] 2964 	ld	b,h
   823E C3 A5 81      [10] 2965 	jp	00101$
   8241                    2966 00104$:
   8241 DD F9         [10] 2967 	ld	sp, ix
   8243 DD E1         [14] 2968 	pop	ix
   8245 C9            [10] 2969 	ret
                           2970 ;src/main.c:725: void inicializarJuego() {
                           2971 ;	---------------------------------
                           2972 ; Function inicializarJuego
                           2973 ; ---------------------------------
   8246                    2974 _inicializarJuego::
                           2975 ;src/main.c:727: iter = 0;
   8246 21 F2 69      [10] 2976 	ld	hl,#_iter + 0
   8249 36 00         [10] 2977 	ld	(hl), #0x00
                           2978 ;src/main.c:728: num_mapa = 0;
   824B 21 F5 69      [10] 2979 	ld	hl,#_num_mapa + 0
   824E 36 00         [10] 2980 	ld	(hl), #0x00
                           2981 ;src/main.c:729: mapa = mapas[num_mapa];
   8250 21 93 72      [10] 2982 	ld	hl, #_mapas + 0
   8253 7E            [ 7] 2983 	ld	a,(hl)
   8254 FD 21 F3 69   [14] 2984 	ld	iy,#_mapa
   8258 FD 77 00      [19] 2985 	ld	0 (iy),a
   825B 23            [ 6] 2986 	inc	hl
   825C 7E            [ 7] 2987 	ld	a,(hl)
   825D 32 F4 69      [13] 2988 	ld	(#_mapa + 1),a
                           2989 ;src/main.c:730: cpct_etm_setTileset2x4(g_tileset);
   8260 21 E0 24      [10] 2990 	ld	hl,#_g_tileset
   8263 CD CB 59      [17] 2991 	call	_cpct_etm_setTileset2x4
                           2992 ;src/main.c:732: dibujarMapa();
   8266 CD 7D 72      [17] 2993 	call	_dibujarMapa
                           2994 ;src/main.c:734: borrarPantallaArriba(0, 0, 40, 1);
   8269 21 28 01      [10] 2995 	ld	hl,#0x0128
   826C E5            [11] 2996 	push	hl
   826D 21 00 00      [10] 2997 	ld	hl,#0x0000
   8270 E5            [11] 2998 	push	hl
   8271 CD 42 80      [17] 2999 	call	_borrarPantallaArriba
   8274 F1            [10] 3000 	pop	af
   8275 F1            [10] 3001 	pop	af
                           3002 ;src/main.c:735: barraPuntuacionInicial();
   8276 CD 80 7F      [17] 3003 	call	_barraPuntuacionInicial
                           3004 ;src/main.c:738: prota.x = prota.px = 50;
   8279 21 E2 69      [10] 3005 	ld	hl,#(_prota + 0x0002)
   827C 36 32         [10] 3006 	ld	(hl),#0x32
   827E 21 E0 69      [10] 3007 	ld	hl,#_prota
   8281 36 32         [10] 3008 	ld	(hl),#0x32
                           3009 ;src/main.c:739: prota.y = prota.py = 76 + ORIGEN_MAPA_Y;
   8283 21 E3 69      [10] 3010 	ld	hl,#(_prota + 0x0003)
   8286 36 64         [10] 3011 	ld	(hl),#0x64
   8288 21 E1 69      [10] 3012 	ld	hl,#(_prota + 0x0001)
   828B 36 64         [10] 3013 	ld	(hl),#0x64
                           3014 ;src/main.c:740: prota.mover  = NO;
   828D 21 E6 69      [10] 3015 	ld	hl,#(_prota + 0x0006)
   8290 36 00         [10] 3016 	ld	(hl),#0x00
                           3017 ;src/main.c:741: prota.mira=M_derecha;
   8292 21 E7 69      [10] 3018 	ld	hl,#(_prota + 0x0007)
   8295 36 00         [10] 3019 	ld	(hl),#0x00
                           3020 ;src/main.c:742: prota.sprite = g_hero;
   8297 21 A8 4A      [10] 3021 	ld	hl,#_g_hero
   829A 22 E4 69      [16] 3022 	ld	((_prota + 0x0004)), hl
                           3023 ;src/main.c:746: cu.x = cu.px = 0;
   829D 21 EA 69      [10] 3024 	ld	hl,#(_cu + 0x0002)
   82A0 36 00         [10] 3025 	ld	(hl),#0x00
   82A2 21 E8 69      [10] 3026 	ld	hl,#_cu
   82A5 36 00         [10] 3027 	ld	(hl),#0x00
                           3028 ;src/main.c:747: cu.y = cu.py = 0;
   82A7 21 EB 69      [10] 3029 	ld	hl,#(_cu + 0x0003)
   82AA 36 00         [10] 3030 	ld	(hl),#0x00
   82AC 21 E9 69      [10] 3031 	ld	hl,#(_cu + 0x0001)
   82AF 36 00         [10] 3032 	ld	(hl),#0x00
                           3033 ;src/main.c:748: cu.lanzado = NO;
   82B1 21 EE 69      [10] 3034 	ld	hl,#(_cu + 0x0006)
   82B4 36 00         [10] 3035 	ld	(hl),#0x00
                           3036 ;src/main.c:749: cu.mover = NO;
   82B6 21 F1 69      [10] 3037 	ld	hl,#(_cu + 0x0009)
   82B9 36 00         [10] 3038 	ld	(hl),#0x00
                           3039 ;src/main.c:751: inicializarEnemy();
   82BB CD 94 81      [17] 3040 	call	_inicializarEnemy
                           3041 ;src/main.c:753: dibujarProta();
   82BE C3 A3 72      [10] 3042 	jp  _dibujarProta
                           3043 ;src/main.c:756: void main(void) {
                           3044 ;	---------------------------------
                           3045 ; Function main
                           3046 ; ---------------------------------
   82C1                    3047 _main::
   82C1 DD E5         [15] 3048 	push	ix
   82C3 DD 21 00 00   [14] 3049 	ld	ix,#0
   82C7 DD 39         [15] 3050 	add	ix,sp
   82C9 F5            [11] 3051 	push	af
   82CA F5            [11] 3052 	push	af
                           3053 ;src/main.c:761: inicializarCPC();
   82CB CD 71 81      [17] 3054 	call	_inicializarCPC
                           3055 ;src/main.c:762: menuInicio();
   82CE CD 95 80      [17] 3056 	call	_menuInicio
                           3057 ;src/main.c:764: inicializarJuego();
   82D1 CD 46 82      [17] 3058 	call	_inicializarJuego
                           3059 ;src/main.c:765: cpct_akp_musicPlay();
   82D4 CD 8A 5B      [17] 3060 	call	_cpct_akp_musicPlay
                           3061 ;src/main.c:766: j=0;
   82D7 DD 36 FD 00   [19] 3062 	ld	-3 (ix),#0x00
                           3063 ;src/main.c:767: while (1) {
   82DB                    3064 00126$:
                           3065 ;src/main.c:768: j++;
   82DB DD 34 FD      [23] 3066 	inc	-3 (ix)
                           3067 ;src/main.c:771: actual = enemy;
                           3068 ;src/main.c:773: comprobarTeclado();
   82DE CD 78 7E      [17] 3069 	call	_comprobarTeclado
                           3070 ;src/main.c:774: moverCuchillo();
   82E1 CD DB 7E      [17] 3071 	call	_moverCuchillo
                           3072 ;src/main.c:776: while(--i){
   82E4 01 F8 64      [10] 3073 	ld	bc,#_enemy
   82E7 DD 36 FC 02   [19] 3074 	ld	-4 (ix),#0x02
   82EB                    3075 00105$:
   82EB DD 35 FC      [23] 3076 	dec	-4 (ix)
   82EE DD 7E FC      [19] 3077 	ld	a,-4 (ix)
   82F1 B7            [ 4] 3078 	or	a, a
   82F2 28 62         [12] 3079 	jr	Z,00107$
                           3080 ;src/main.c:777: if(j % 100 == 0 && actual->longitud_camino == 0){
   82F4 C5            [11] 3081 	push	bc
   82F5 3E 64         [ 7] 3082 	ld	a,#0x64
   82F7 F5            [11] 3083 	push	af
   82F8 33            [ 6] 3084 	inc	sp
   82F9 DD 7E FD      [19] 3085 	ld	a,-3 (ix)
   82FC F5            [11] 3086 	push	af
   82FD 33            [ 6] 3087 	inc	sp
   82FE CD CF 59      [17] 3088 	call	__moduchar
   8301 F1            [10] 3089 	pop	af
   8302 C1            [10] 3090 	pop	bc
   8303 7D            [ 4] 3091 	ld	a,l
   8304 B7            [ 4] 3092 	or	a, a
   8305 20 40         [12] 3093 	jr	NZ,00102$
   8307 69            [ 4] 3094 	ld	l, c
   8308 60            [ 4] 3095 	ld	h, b
   8309 11 39 01      [10] 3096 	ld	de, #0x0139
   830C 19            [11] 3097 	add	hl, de
   830D 7E            [ 7] 3098 	ld	a,(hl)
   830E B7            [ 4] 3099 	or	a, a
   830F 20 36         [12] 3100 	jr	NZ,00102$
                           3101 ;src/main.c:778: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   8311 3A E1 69      [13] 3102 	ld	a,(#_prota + 1)
   8314 DD 77 FE      [19] 3103 	ld	-2 (ix),a
   8317 21 E0 69      [10] 3104 	ld	hl, #_prota + 0
   831A 5E            [ 7] 3105 	ld	e,(hl)
   831B 69            [ 4] 3106 	ld	l, c
   831C 60            [ 4] 3107 	ld	h, b
   831D 23            [ 6] 3108 	inc	hl
   831E 56            [ 7] 3109 	ld	d,(hl)
   831F 0A            [ 7] 3110 	ld	a,(bc)
   8320 DD 77 FF      [19] 3111 	ld	-1 (ix),a
   8323 C5            [11] 3112 	push	bc
   8324 2A F3 69      [16] 3113 	ld	hl,(_mapa)
   8327 E5            [11] 3114 	push	hl
   8328 C5            [11] 3115 	push	bc
   8329 DD 7E FE      [19] 3116 	ld	a,-2 (ix)
   832C F5            [11] 3117 	push	af
   832D 33            [ 6] 3118 	inc	sp
   832E 7B            [ 4] 3119 	ld	a,e
   832F F5            [11] 3120 	push	af
   8330 33            [ 6] 3121 	inc	sp
   8331 D5            [11] 3122 	push	de
   8332 33            [ 6] 3123 	inc	sp
   8333 DD 7E FF      [19] 3124 	ld	a,-1 (ix)
   8336 F5            [11] 3125 	push	af
   8337 33            [ 6] 3126 	inc	sp
   8338 CD 06 54      [17] 3127 	call	_pathFinding
   833B 21 08 00      [10] 3128 	ld	hl,#8
   833E 39            [11] 3129 	add	hl,sp
   833F F9            [ 6] 3130 	ld	sp,hl
   8340 C1            [10] 3131 	pop	bc
                           3132 ;src/main.c:779: j = 0;
   8341 DD 36 FD 00   [19] 3133 	ld	-3 (ix),#0x00
   8345 18 07         [12] 3134 	jr	00103$
   8347                    3135 00102$:
                           3136 ;src/main.c:781: moverEnemigo(actual);  
   8347 C5            [11] 3137 	push	bc
   8348 C5            [11] 3138 	push	bc
   8349 CD F3 7A      [17] 3139 	call	_moverEnemigo
   834C F1            [10] 3140 	pop	af
   834D C1            [10] 3141 	pop	bc
   834E                    3142 00103$:
                           3143 ;src/main.c:784: ++actual;
   834E 21 3A 01      [10] 3144 	ld	hl,#0x013A
   8351 09            [11] 3145 	add	hl,bc
   8352 4D            [ 4] 3146 	ld	c,l
   8353 44            [ 4] 3147 	ld	b,h
   8354 18 95         [12] 3148 	jr	00105$
   8356                    3149 00107$:
                           3150 ;src/main.c:788: actual = enemy;
   8356 01 F8 64      [10] 3151 	ld	bc,#_enemy
                           3152 ;src/main.c:790: cpct_waitVSYNC();
   8359 C5            [11] 3153 	push	bc
   835A CD 54 5B      [17] 3154 	call	_cpct_waitVSYNC
   835D C1            [10] 3155 	pop	bc
                           3156 ;src/main.c:792: if (prota.mover) {
   835E 3A E6 69      [13] 3157 	ld	a, (#(_prota + 0x0006) + 0)
   8361 B7            [ 4] 3158 	or	a, a
   8362 28 0A         [12] 3159 	jr	Z,00109$
                           3160 ;src/main.c:793: redibujarProta();
   8364 C5            [11] 3161 	push	bc
   8365 CD 74 73      [17] 3162 	call	_redibujarProta
   8368 C1            [10] 3163 	pop	bc
                           3164 ;src/main.c:794: prota.mover = NO;
   8369 21 E6 69      [10] 3165 	ld	hl,#(_prota + 0x0006)
   836C 36 00         [10] 3166 	ld	(hl),#0x00
   836E                    3167 00109$:
                           3168 ;src/main.c:796: if(cu.lanzado && cu.mover){
   836E 21 EE 69      [10] 3169 	ld	hl, #(_cu + 0x0006) + 0
   8371 5E            [ 7] 3170 	ld	e,(hl)
   8372 21 F1 69      [10] 3171 	ld	hl,#_cu + 9
   8375 7B            [ 4] 3172 	ld	a,e
   8376 B7            [ 4] 3173 	or	a, a
   8377 28 0B         [12] 3174 	jr	Z,00114$
   8379 7E            [ 7] 3175 	ld	a,(hl)
   837A B7            [ 4] 3176 	or	a, a
   837B 28 07         [12] 3177 	jr	Z,00114$
                           3178 ;src/main.c:797: redibujarCuchillo();
   837D C5            [11] 3179 	push	bc
   837E CD 48 7D      [17] 3180 	call	_redibujarCuchillo
   8381 C1            [10] 3181 	pop	bc
   8382 18 0D         [12] 3182 	jr	00143$
   8384                    3183 00114$:
                           3184 ;src/main.c:798: }else if (cu.lanzado && !cu.mover){
   8384 7B            [ 4] 3185 	ld	a,e
   8385 B7            [ 4] 3186 	or	a, a
   8386 28 09         [12] 3187 	jr	Z,00143$
   8388 7E            [ 7] 3188 	ld	a,(hl)
   8389 B7            [ 4] 3189 	or	a, a
   838A 20 05         [12] 3190 	jr	NZ,00143$
                           3191 ;src/main.c:799: borrarCuchillo();
   838C C5            [11] 3192 	push	bc
   838D CD CA 7C      [17] 3193 	call	_borrarCuchillo
   8390 C1            [10] 3194 	pop	bc
                           3195 ;src/main.c:802: while(--i){
   8391                    3196 00143$:
   8391 DD 36 FC 02   [19] 3197 	ld	-4 (ix),#0x02
   8395                    3198 00122$:
   8395 DD 35 FC      [23] 3199 	dec	-4 (ix)
   8398 DD 7E FC      [19] 3200 	ld	a,-4 (ix)
   839B B7            [ 4] 3201 	or	a, a
   839C 28 43         [12] 3202 	jr	Z,00124$
                           3203 ;src/main.c:803: if(actual->mover){
   839E C5            [11] 3204 	push	bc
   839F FD E1         [14] 3205 	pop	iy
   83A1 FD 7E 06      [19] 3206 	ld	a,6 (iy)
   83A4 B7            [ 4] 3207 	or	a, a
   83A5 28 07         [12] 3208 	jr	Z,00118$
                           3209 ;src/main.c:804: redibujarEnemigo(actual);
   83A7 C5            [11] 3210 	push	bc
   83A8 C5            [11] 3211 	push	bc
   83A9 CD 92 76      [17] 3212 	call	_redibujarEnemigo
   83AC F1            [10] 3213 	pop	af
   83AD C1            [10] 3214 	pop	bc
   83AE                    3215 00118$:
                           3216 ;src/main.c:806: if (actual->muerto && actual->muertes == 0){
   83AE C5            [11] 3217 	push	bc
   83AF FD E1         [14] 3218 	pop	iy
   83B1 FD 7E 08      [19] 3219 	ld	a,8 (iy)
   83B4 B7            [ 4] 3220 	or	a, a
   83B5 28 22         [12] 3221 	jr	Z,00120$
   83B7 21 0C 00      [10] 3222 	ld	hl,#0x000C
   83BA 09            [11] 3223 	add	hl,bc
   83BB 7E            [ 7] 3224 	ld	a,(hl)
   83BC B7            [ 4] 3225 	or	a, a
   83BD 20 1A         [12] 3226 	jr	NZ,00120$
                           3227 ;src/main.c:807: borrarEnemigo(actual);
   83BF E5            [11] 3228 	push	hl
   83C0 C5            [11] 3229 	push	bc
   83C1 C5            [11] 3230 	push	bc
   83C2 CD FE 75      [17] 3231 	call	_borrarEnemigo
   83C5 F1            [10] 3232 	pop	af
   83C6 C1            [10] 3233 	pop	bc
   83C7 C5            [11] 3234 	push	bc
   83C8 C5            [11] 3235 	push	bc
   83C9 CD 56 75      [17] 3236 	call	_dibujarExplosion
   83CC F1            [10] 3237 	pop	af
   83CD C1            [10] 3238 	pop	bc
   83CE E1            [10] 3239 	pop	hl
                           3240 ;src/main.c:810: actual->muertes++;
   83CF 5E            [ 7] 3241 	ld	e,(hl)
   83D0 1C            [ 4] 3242 	inc	e
   83D1 73            [ 7] 3243 	ld	(hl),e
                           3244 ;src/main.c:811: actual->x = 0;
   83D2 AF            [ 4] 3245 	xor	a, a
   83D3 02            [ 7] 3246 	ld	(bc),a
                           3247 ;src/main.c:812: actual->y = 0;
   83D4 59            [ 4] 3248 	ld	e, c
   83D5 50            [ 4] 3249 	ld	d, b
   83D6 13            [ 6] 3250 	inc	de
   83D7 AF            [ 4] 3251 	xor	a, a
   83D8 12            [ 7] 3252 	ld	(de),a
   83D9                    3253 00120$:
                           3254 ;src/main.c:814: ++actual;
   83D9 21 3A 01      [10] 3255 	ld	hl,#0x013A
   83DC 09            [11] 3256 	add	hl,bc
   83DD 4D            [ 4] 3257 	ld	c,l
   83DE 44            [ 4] 3258 	ld	b,h
   83DF 18 B4         [12] 3259 	jr	00122$
   83E1                    3260 00124$:
                           3261 ;src/main.c:817: cpct_waitVSYNC();
   83E1 CD 54 5B      [17] 3262 	call	_cpct_waitVSYNC
   83E4 C3 DB 82      [10] 3263 	jp	00126$
                           3264 	.area _CODE
                           3265 	.area _INITIALIZER
                           3266 	.area _CABS (ABS)
   0F00                    3267 	.org 0x0F00
   0F00                    3268 _G_song:
   0F00 41                 3269 	.db #0x41	; 65	'A'
   0F01 54                 3270 	.db #0x54	; 84	'T'
   0F02 31                 3271 	.db #0x31	; 49	'1'
   0F03 30                 3272 	.db #0x30	; 48	'0'
   0F04 01                 3273 	.db #0x01	; 1
   0F05 40                 3274 	.db #0x40	; 64
   0F06 42                 3275 	.db #0x42	; 66	'B'
   0F07 0F                 3276 	.db #0x0F	; 15
   0F08 02                 3277 	.db #0x02	; 2
   0F09 06                 3278 	.db #0x06	; 6
   0F0A 1D                 3279 	.db #0x1D	; 29
   0F0B 00                 3280 	.db #0x00	; 0
   0F0C 10                 3281 	.db #0x10	; 16
   0F0D 40                 3282 	.db #0x40	; 64
   0F0E 19                 3283 	.db #0x19	; 25
   0F0F 40                 3284 	.db #0x40	; 64
   0F10 00                 3285 	.db #0x00	; 0
   0F11 00                 3286 	.db #0x00	; 0
   0F12 00                 3287 	.db #0x00	; 0
   0F13 00                 3288 	.db #0x00	; 0
   0F14 00                 3289 	.db #0x00	; 0
   0F15 00                 3290 	.db #0x00	; 0
   0F16 0D                 3291 	.db #0x0D	; 13
   0F17 12                 3292 	.db #0x12	; 18
   0F18 40                 3293 	.db #0x40	; 64
   0F19 01                 3294 	.db #0x01	; 1
   0F1A 00                 3295 	.db #0x00	; 0
   0F1B 7C                 3296 	.db #0x7C	; 124
   0F1C 18                 3297 	.db #0x18	; 24
   0F1D 78                 3298 	.db #0x78	; 120	'x'
   0F1E 0C                 3299 	.db #0x0C	; 12
   0F1F 34                 3300 	.db #0x34	; 52	'4'
   0F20 30                 3301 	.db #0x30	; 48	'0'
   0F21 2C                 3302 	.db #0x2C	; 44
   0F22 28                 3303 	.db #0x28	; 40
   0F23 24                 3304 	.db #0x24	; 36
   0F24 20                 3305 	.db #0x20	; 32
   0F25 1C                 3306 	.db #0x1C	; 28
   0F26 0D                 3307 	.db #0x0D	; 13
   0F27 25                 3308 	.db #0x25	; 37
   0F28 40                 3309 	.db #0x40	; 64
   0F29 20                 3310 	.db #0x20	; 32
   0F2A 00                 3311 	.db #0x00	; 0
   0F2B 00                 3312 	.db #0x00	; 0
   0F2C 00                 3313 	.db #0x00	; 0
   0F2D 39                 3314 	.db #0x39	; 57	'9'
   0F2E 40                 3315 	.db #0x40	; 64
   0F2F 00                 3316 	.db #0x00	; 0
   0F30 57                 3317 	.db #0x57	; 87	'W'
   0F31 40                 3318 	.db #0x40	; 64
   0F32 3B                 3319 	.db #0x3B	; 59
   0F33 40                 3320 	.db #0x40	; 64
   0F34 57                 3321 	.db #0x57	; 87	'W'
   0F35 40                 3322 	.db #0x40	; 64
   0F36 01                 3323 	.db #0x01	; 1
   0F37 2F                 3324 	.db #0x2F	; 47
   0F38 40                 3325 	.db #0x40	; 64
   0F39 19                 3326 	.db #0x19	; 25
   0F3A 00                 3327 	.db #0x00	; 0
   0F3B 76                 3328 	.db #0x76	; 118	'v'
   0F3C E1                 3329 	.db #0xE1	; 225
   0F3D 00                 3330 	.db #0x00	; 0
   0F3E 00                 3331 	.db #0x00	; 0
   0F3F 01                 3332 	.db #0x01	; 1
   0F40 04                 3333 	.db #0x04	; 4
   0F41 51                 3334 	.db #0x51	; 81	'Q'
   0F42 04                 3335 	.db #0x04	; 4
   0F43 37                 3336 	.db #0x37	; 55	'7'
   0F44 04                 3337 	.db #0x04	; 4
   0F45 4F                 3338 	.db #0x4F	; 79	'O'
   0F46 04                 3339 	.db #0x04	; 4
   0F47 37                 3340 	.db #0x37	; 55	'7'
   0F48 02                 3341 	.db #0x02	; 2
   0F49 4B                 3342 	.db #0x4B	; 75	'K'
   0F4A 02                 3343 	.db #0x02	; 2
   0F4B 37                 3344 	.db #0x37	; 55	'7'
   0F4C 04                 3345 	.db #0x04	; 4
   0F4D 4F                 3346 	.db #0x4F	; 79	'O'
   0F4E 04                 3347 	.db #0x04	; 4
   0F4F 37                 3348 	.db #0x37	; 55	'7'
   0F50 04                 3349 	.db #0x04	; 4
   0F51 4F                 3350 	.db #0x4F	; 79	'O'
   0F52 04                 3351 	.db #0x04	; 4
   0F53 37                 3352 	.db #0x37	; 55	'7'
   0F54 02                 3353 	.db #0x02	; 2
   0F55 4B                 3354 	.db #0x4B	; 75	'K'
   0F56 00                 3355 	.db #0x00	; 0
   0F57 42                 3356 	.db #0x42	; 66	'B'
   0F58 60                 3357 	.db #0x60	; 96
   0F59 00                 3358 	.db #0x00	; 0
   0F5A 42                 3359 	.db #0x42	; 66	'B'
   0F5B 80                 3360 	.db #0x80	; 128
   0F5C 00                 3361 	.db #0x00	; 0
   0F5D 00                 3362 	.db #0x00	; 0
   0F5E 42                 3363 	.db #0x42	; 66	'B'
   0F5F 00                 3364 	.db #0x00	; 0
   0F60 00                 3365 	.db #0x00	; 0
