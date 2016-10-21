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
   72B7                      87 _EMirar::
   72B7                      88 	.ds 1
   72B8                      89 _EEje::
   72B8                      90 	.ds 1
   72B9                      91 _enemy::
   72B9                      92 	.ds 1256
   77A1                      93 _prota::
   77A1                      94 	.ds 8
   77A9                      95 _cu::
   77A9                      96 	.ds 10
   77B3                      97 _iter::
   77B3                      98 	.ds 1
   77B4                      99 _mapa::
   77B4                     100 	.ds 2
   77B6                     101 _num_mapa::
   77B6                     102 	.ds 1
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
                            127 ;src/main.c:109: cpctm_createTransparentMaskTable(g_tablatrans, 0x1E00, M0, 0); // es el color 8 - 4D - FF00FF
                            128 ;	---------------------------------
                            129 ; Function dummy_cpct_transparentMaskTable0M0_container
                            130 ; ---------------------------------
   5B42                     131 _dummy_cpct_transparentMaskTable0M0_container::
                            132 	.area _g_tablatrans_ (ABS) 
   1E00                     133 	.org 0x1E00 
   1E00                     134 	 _g_tablatrans::
   1E00 FF AA 55 00 AA AA   135 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   1E08 55 00 55 00 00 00   136 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   1E10 AA AA 00 00 AA AA   137 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   1E18 00 00 00 00 00 00   138 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   1E20 55 00 55 00 00 00   139 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   1E28 55 00 55 00 00 00   140 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   1E30 00 00 00 00 00 00   141 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   1E38 00 00 00 00 00 00   142 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   1E40 AA AA 00 00 AA AA   143 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   1E48 00 00 00 00 00 00   144 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   1E50 AA AA 00 00 AA AA   145 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   1E58 00 00 00 00 00 00   146 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   1E60 00 00 00 00 00 00   147 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   1E68 00 00 00 00 00 00   148 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   1E70 00 00 00 00 00 00   149 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   1E78 00 00 00 00 00 00   150 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   1E80 55 00 55 00 00 00   151 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   1E88 55 00 55 00 00 00   152 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   1E90 00 00 00 00 00 00   153 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   1E98 00 00 00 00 00 00   154 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   1EA0 55 00 55 00 00 00   155 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   1EA8 55 00 55 00 00 00   156 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   1EB0 00 00 00 00 00 00   157 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   1EB8 00 00 00 00 00 00   158 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   1EC0 00 00 00 00 00 00   159 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   1EC8 00 00 00 00 00 00   160 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   1ED0 00 00 00 00 00 00   161 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   1ED8 00 00 00 00 00 00   162 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   1EE0 00 00 00 00 00 00   163 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   1EE8 00 00 00 00 00 00   164 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   1EF0 00 00 00 00 00 00   165 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   1EF8 00 00 00 00 00 00   166 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            167 	.area _CSEG (REL, CON) 
                            168 ;src/main.c:112: void dibujarMapa() {
                            169 ;	---------------------------------
                            170 ; Function dibujarMapa
                            171 ; ---------------------------------
   7EDE                     172 _dibujarMapa::
                            173 ;src/main.c:113: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   7EDE 2A B4 77      [16]  174 	ld	hl,(_mapa)
   7EE1 E5            [11]  175 	push	hl
   7EE2 21 F0 C0      [10]  176 	ld	hl,#0xC0F0
   7EE5 E5            [11]  177 	push	hl
   7EE6 21 2C 28      [10]  178 	ld	hl,#0x282C
   7EE9 E5            [11]  179 	push	hl
   7EEA 2E 00         [ 7]  180 	ld	l, #0x00
   7EEC E5            [11]  181 	push	hl
   7EED AF            [ 4]  182 	xor	a, a
   7EEE F5            [11]  183 	push	af
   7EEF 33            [ 6]  184 	inc	sp
   7EF0 CD FD 66      [17]  185 	call	_cpct_etm_drawTileBox2x4
   7EF3 C9            [10]  186 	ret
   7EF4                     187 _mapas:
   7EF4 C0 2D               188 	.dw _g_map1
   7EF6 E0 26               189 	.dw _g_map2
   7EF8 00 20               190 	.dw _g_map3
   7EFA                     191 _spawnX:
   7EFA 00                  192 	.db #0x00	; 0
   7EFB 3C                  193 	.db #0x3C	; 60
   7EFC 47                  194 	.db #0x47	; 71	'G'
   7EFD 14                  195 	.db #0x14	; 20
   7EFE 3C                  196 	.db #0x3C	; 60
   7EFF                     197 _spawnY:
   7EFF 00                  198 	.db #0x00	; 0
   7F00 2C                  199 	.db #0x2C	; 44
   7F01 72                  200 	.db #0x72	; 114	'r'
   7F02 8A                  201 	.db #0x8A	; 138
   7F03 8A                  202 	.db #0x8A	; 138
                            203 ;src/main.c:116: void dibujarProta() {
                            204 ;	---------------------------------
                            205 ; Function dibujarProta
                            206 ; ---------------------------------
   7F04                     207 _dibujarProta::
                            208 ;src/main.c:117: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   7F04 21 A2 77      [10]  209 	ld	hl, #_prota + 1
   7F07 56            [ 7]  210 	ld	d,(hl)
   7F08 21 A1 77      [10]  211 	ld	hl, #_prota + 0
   7F0B 46            [ 7]  212 	ld	b,(hl)
   7F0C D5            [11]  213 	push	de
   7F0D 33            [ 6]  214 	inc	sp
   7F0E C5            [11]  215 	push	bc
   7F0F 33            [ 6]  216 	inc	sp
   7F10 21 00 C0      [10]  217 	ld	hl,#0xC000
   7F13 E5            [11]  218 	push	hl
   7F14 CD 5C 72      [17]  219 	call	_cpct_getScreenPtr
   7F17 EB            [ 4]  220 	ex	de,hl
                            221 ;src/main.c:118: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   7F18 ED 4B A5 77   [20]  222 	ld	bc, (#_prota + 4)
   7F1C 21 00 1E      [10]  223 	ld	hl,#_g_tablatrans
   7F1F E5            [11]  224 	push	hl
   7F20 21 07 16      [10]  225 	ld	hl,#0x1607
   7F23 E5            [11]  226 	push	hl
   7F24 D5            [11]  227 	push	de
   7F25 C5            [11]  228 	push	bc
   7F26 CD 7C 72      [17]  229 	call	_cpct_drawSpriteMaskedAlignedTable
   7F29 C9            [10]  230 	ret
                            231 ;src/main.c:121: void borrarProta() {
                            232 ;	---------------------------------
                            233 ; Function borrarProta
                            234 ; ---------------------------------
   7F2A                     235 _borrarProta::
   7F2A DD E5         [15]  236 	push	ix
   7F2C DD 21 00 00   [14]  237 	ld	ix,#0
   7F30 DD 39         [15]  238 	add	ix,sp
   7F32 F5            [11]  239 	push	af
   7F33 3B            [ 6]  240 	dec	sp
                            241 ;src/main.c:123: u8 w = 4 + (prota.px & 1);
   7F34 21 A3 77      [10]  242 	ld	hl, #_prota + 2
   7F37 4E            [ 7]  243 	ld	c,(hl)
   7F38 79            [ 4]  244 	ld	a,c
   7F39 E6 01         [ 7]  245 	and	a, #0x01
   7F3B 47            [ 4]  246 	ld	b,a
   7F3C 04            [ 4]  247 	inc	b
   7F3D 04            [ 4]  248 	inc	b
   7F3E 04            [ 4]  249 	inc	b
   7F3F 04            [ 4]  250 	inc	b
                            251 ;src/main.c:126: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   7F40 21 A4 77      [10]  252 	ld	hl, #_prota + 3
   7F43 5E            [ 7]  253 	ld	e,(hl)
   7F44 CB 4B         [ 8]  254 	bit	1, e
   7F46 28 04         [12]  255 	jr	Z,00103$
   7F48 3E 01         [ 7]  256 	ld	a,#0x01
   7F4A 18 02         [12]  257 	jr	00104$
   7F4C                     258 00103$:
   7F4C 3E 00         [ 7]  259 	ld	a,#0x00
   7F4E                     260 00104$:
   7F4E C6 06         [ 7]  261 	add	a, #0x06
   7F50 DD 77 FD      [19]  262 	ld	-3 (ix),a
                            263 ;src/main.c:128: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   7F53 FD 2A B4 77   [20]  264 	ld	iy,(_mapa)
   7F57 16 00         [ 7]  265 	ld	d,#0x00
   7F59 7B            [ 4]  266 	ld	a,e
   7F5A C6 E8         [ 7]  267 	add	a,#0xE8
   7F5C DD 77 FE      [19]  268 	ld	-2 (ix),a
   7F5F 7A            [ 4]  269 	ld	a,d
   7F60 CE FF         [ 7]  270 	adc	a,#0xFF
   7F62 DD 77 FF      [19]  271 	ld	-1 (ix),a
   7F65 DD 6E FE      [19]  272 	ld	l,-2 (ix)
   7F68 DD 66 FF      [19]  273 	ld	h,-1 (ix)
   7F6B DD CB FF 7E   [20]  274 	bit	7, -1 (ix)
   7F6F 28 04         [12]  275 	jr	Z,00105$
   7F71 21 EB FF      [10]  276 	ld	hl,#0xFFEB
   7F74 19            [11]  277 	add	hl,de
   7F75                     278 00105$:
   7F75 CB 2C         [ 8]  279 	sra	h
   7F77 CB 1D         [ 8]  280 	rr	l
   7F79 CB 2C         [ 8]  281 	sra	h
   7F7B CB 1D         [ 8]  282 	rr	l
   7F7D 55            [ 4]  283 	ld	d,l
   7F7E CB 39         [ 8]  284 	srl	c
   7F80 FD E5         [15]  285 	push	iy
   7F82 21 F0 C0      [10]  286 	ld	hl,#0xC0F0
   7F85 E5            [11]  287 	push	hl
   7F86 3E 28         [ 7]  288 	ld	a,#0x28
   7F88 F5            [11]  289 	push	af
   7F89 33            [ 6]  290 	inc	sp
   7F8A DD 7E FD      [19]  291 	ld	a,-3 (ix)
   7F8D F5            [11]  292 	push	af
   7F8E 33            [ 6]  293 	inc	sp
   7F8F C5            [11]  294 	push	bc
   7F90 33            [ 6]  295 	inc	sp
   7F91 D5            [11]  296 	push	de
   7F92 33            [ 6]  297 	inc	sp
   7F93 79            [ 4]  298 	ld	a,c
   7F94 F5            [11]  299 	push	af
   7F95 33            [ 6]  300 	inc	sp
   7F96 CD FD 66      [17]  301 	call	_cpct_etm_drawTileBox2x4
   7F99 DD F9         [10]  302 	ld	sp, ix
   7F9B DD E1         [14]  303 	pop	ix
   7F9D C9            [10]  304 	ret
                            305 ;src/main.c:131: void menuFin(){
                            306 ;	---------------------------------
                            307 ; Function menuFin
                            308 ; ---------------------------------
   7F9E                     309 _menuFin::
                            310 ;src/main.c:134: cpct_clearScreen(0);
   7F9E 21 00 40      [10]  311 	ld	hl,#0x4000
   7FA1 E5            [11]  312 	push	hl
   7FA2 AF            [ 4]  313 	xor	a, a
   7FA3 F5            [11]  314 	push	af
   7FA4 33            [ 6]  315 	inc	sp
   7FA5 26 C0         [ 7]  316 	ld	h, #0xC0
   7FA7 E5            [11]  317 	push	hl
   7FA8 CD 3B 69      [17]  318 	call	_cpct_memset
                            319 ;src/main.c:136: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   7FAB 21 18 5A      [10]  320 	ld	hl,#0x5A18
   7FAE E5            [11]  321 	push	hl
   7FAF 21 00 C0      [10]  322 	ld	hl,#0xC000
   7FB2 E5            [11]  323 	push	hl
   7FB3 CD 5C 72      [17]  324 	call	_cpct_getScreenPtr
   7FB6 4D            [ 4]  325 	ld	c,l
   7FB7 44            [ 4]  326 	ld	b,h
                            327 ;src/main.c:137: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   7FB8 21 02 00      [10]  328 	ld	hl,#0x0002
   7FBB E5            [11]  329 	push	hl
   7FBC C5            [11]  330 	push	bc
   7FBD 21 CB 7F      [10]  331 	ld	hl,#___str_0
   7FC0 E5            [11]  332 	push	hl
   7FC1 CD 34 66      [17]  333 	call	_cpct_drawStringM0
   7FC4 21 06 00      [10]  334 	ld	hl,#6
   7FC7 39            [11]  335 	add	hl,sp
   7FC8 F9            [ 6]  336 	ld	sp,hl
                            337 ;src/main.c:139: while(1){}
   7FC9                     338 00102$:
   7FC9 18 FE         [12]  339 	jr	00102$
   7FCB                     340 ___str_0:
   7FCB 47 41 4D 45 20 4F   341 	.ascii "GAME OVER"
        56 45 52
   7FD4 00                  342 	.db 0x00
                            343 ;src/main.c:142: void redibujarProta() {
                            344 ;	---------------------------------
                            345 ; Function redibujarProta
                            346 ; ---------------------------------
   7FD5                     347 _redibujarProta::
                            348 ;src/main.c:143: borrarProta();
   7FD5 CD 2A 7F      [17]  349 	call	_borrarProta
                            350 ;src/main.c:144: prota.px = prota.x;
   7FD8 01 A3 77      [10]  351 	ld	bc,#_prota + 2
   7FDB 3A A1 77      [13]  352 	ld	a, (#_prota + 0)
   7FDE 02            [ 7]  353 	ld	(bc),a
                            354 ;src/main.c:145: prota.py = prota.y;
   7FDF 01 A4 77      [10]  355 	ld	bc,#_prota + 3
   7FE2 3A A2 77      [13]  356 	ld	a, (#_prota + 1)
   7FE5 02            [ 7]  357 	ld	(bc),a
                            358 ;src/main.c:146: dibujarProta();
   7FE6 C3 04 7F      [10]  359 	jp  _dibujarProta
                            360 ;src/main.c:149: u8* getTilePtr(u8 x, u8 y) {
                            361 ;	---------------------------------
                            362 ; Function getTilePtr
                            363 ; ---------------------------------
   7FE9                     364 _getTilePtr::
   7FE9 DD E5         [15]  365 	push	ix
   7FEB DD 21 00 00   [14]  366 	ld	ix,#0
   7FEF DD 39         [15]  367 	add	ix,sp
                            368 ;src/main.c:150: return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
   7FF1 DD 4E 05      [19]  369 	ld	c,5 (ix)
   7FF4 06 00         [ 7]  370 	ld	b,#0x00
   7FF6 79            [ 4]  371 	ld	a,c
   7FF7 C6 E8         [ 7]  372 	add	a,#0xE8
   7FF9 5F            [ 4]  373 	ld	e,a
   7FFA 78            [ 4]  374 	ld	a,b
   7FFB CE FF         [ 7]  375 	adc	a,#0xFF
   7FFD 57            [ 4]  376 	ld	d,a
   7FFE 6B            [ 4]  377 	ld	l, e
   7FFF 62            [ 4]  378 	ld	h, d
   8000 CB 7A         [ 8]  379 	bit	7, d
   8002 28 04         [12]  380 	jr	Z,00103$
   8004 21 EB FF      [10]  381 	ld	hl,#0xFFEB
   8007 09            [11]  382 	add	hl,bc
   8008                     383 00103$:
   8008 CB 2C         [ 8]  384 	sra	h
   800A CB 1D         [ 8]  385 	rr	l
   800C CB 2C         [ 8]  386 	sra	h
   800E CB 1D         [ 8]  387 	rr	l
   8010 4D            [ 4]  388 	ld	c, l
   8011 44            [ 4]  389 	ld	b, h
   8012 29            [11]  390 	add	hl, hl
   8013 29            [11]  391 	add	hl, hl
   8014 09            [11]  392 	add	hl, bc
   8015 29            [11]  393 	add	hl, hl
   8016 29            [11]  394 	add	hl, hl
   8017 29            [11]  395 	add	hl, hl
   8018 4D            [ 4]  396 	ld	c,l
   8019 44            [ 4]  397 	ld	b,h
   801A 2A B4 77      [16]  398 	ld	hl,(_mapa)
   801D 09            [11]  399 	add	hl,bc
   801E DD 4E 04      [19]  400 	ld	c,4 (ix)
   8021 CB 39         [ 8]  401 	srl	c
   8023 59            [ 4]  402 	ld	e,c
   8024 16 00         [ 7]  403 	ld	d,#0x00
   8026 19            [11]  404 	add	hl,de
   8027 DD E1         [14]  405 	pop	ix
   8029 C9            [10]  406 	ret
                            407 ;src/main.c:153: u8 checkCollision(int direction) { // check optimization
                            408 ;	---------------------------------
                            409 ; Function checkCollision
                            410 ; ---------------------------------
   802A                     411 _checkCollision::
   802A DD E5         [15]  412 	push	ix
   802C DD 21 00 00   [14]  413 	ld	ix,#0
   8030 DD 39         [15]  414 	add	ix,sp
   8032 F5            [11]  415 	push	af
                            416 ;src/main.c:154: u8 *headTile=0, *feetTile=0, *waistTile=0;
   8033 21 00 00      [10]  417 	ld	hl,#0x0000
   8036 E3            [19]  418 	ex	(sp), hl
   8037 11 00 00      [10]  419 	ld	de,#0x0000
   803A 01 00 00      [10]  420 	ld	bc,#0x0000
                            421 ;src/main.c:156: switch (direction) {
   803D DD CB 05 7E   [20]  422 	bit	7, 5 (ix)
   8041 C2 5E 81      [10]  423 	jp	NZ,00105$
   8044 3E 03         [ 7]  424 	ld	a,#0x03
   8046 DD BE 04      [19]  425 	cp	a, 4 (ix)
   8049 3E 00         [ 7]  426 	ld	a,#0x00
   804B DD 9E 05      [19]  427 	sbc	a, 5 (ix)
   804E E2 53 80      [10]  428 	jp	PO, 00128$
   8051 EE 80         [ 7]  429 	xor	a, #0x80
   8053                     430 00128$:
   8053 FA 5E 81      [10]  431 	jp	M,00105$
   8056 DD 5E 04      [19]  432 	ld	e,4 (ix)
   8059 16 00         [ 7]  433 	ld	d,#0x00
   805B 21 62 80      [10]  434 	ld	hl,#00129$
   805E 19            [11]  435 	add	hl,de
   805F 19            [11]  436 	add	hl,de
   8060 19            [11]  437 	add	hl,de
   8061 E9            [ 4]  438 	jp	(hl)
   8062                     439 00129$:
   8062 C3 6E 80      [10]  440 	jp	00101$
   8065 C3 B9 80      [10]  441 	jp	00102$
   8068 C3 FA 80      [10]  442 	jp	00103$
   806B C3 2D 81      [10]  443 	jp	00104$
                            444 ;src/main.c:157: case 0:
   806E                     445 00101$:
                            446 ;src/main.c:158: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   806E 21 A2 77      [10]  447 	ld	hl, #(_prota + 0x0001) + 0
   8071 5E            [ 7]  448 	ld	e,(hl)
   8072 21 A1 77      [10]  449 	ld	hl, #_prota + 0
   8075 4E            [ 7]  450 	ld	c,(hl)
   8076 0C            [ 4]  451 	inc	c
   8077 0C            [ 4]  452 	inc	c
   8078 0C            [ 4]  453 	inc	c
   8079 0C            [ 4]  454 	inc	c
   807A 7B            [ 4]  455 	ld	a,e
   807B F5            [11]  456 	push	af
   807C 33            [ 6]  457 	inc	sp
   807D 79            [ 4]  458 	ld	a,c
   807E F5            [11]  459 	push	af
   807F 33            [ 6]  460 	inc	sp
   8080 CD E9 7F      [17]  461 	call	_getTilePtr
   8083 F1            [10]  462 	pop	af
   8084 33            [ 6]  463 	inc	sp
   8085 33            [ 6]  464 	inc	sp
   8086 E5            [11]  465 	push	hl
                            466 ;src/main.c:159: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   8087 3A A2 77      [13]  467 	ld	a, (#(_prota + 0x0001) + 0)
   808A C6 14         [ 7]  468 	add	a, #0x14
   808C 4F            [ 4]  469 	ld	c,a
   808D 21 A1 77      [10]  470 	ld	hl, #_prota + 0
   8090 46            [ 7]  471 	ld	b,(hl)
   8091 04            [ 4]  472 	inc	b
   8092 04            [ 4]  473 	inc	b
   8093 04            [ 4]  474 	inc	b
   8094 04            [ 4]  475 	inc	b
   8095 79            [ 4]  476 	ld	a,c
   8096 F5            [11]  477 	push	af
   8097 33            [ 6]  478 	inc	sp
   8098 C5            [11]  479 	push	bc
   8099 33            [ 6]  480 	inc	sp
   809A CD E9 7F      [17]  481 	call	_getTilePtr
   809D F1            [10]  482 	pop	af
   809E EB            [ 4]  483 	ex	de,hl
                            484 ;src/main.c:160: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   809F 3A A2 77      [13]  485 	ld	a, (#(_prota + 0x0001) + 0)
   80A2 C6 0B         [ 7]  486 	add	a, #0x0B
   80A4 47            [ 4]  487 	ld	b,a
   80A5 3A A1 77      [13]  488 	ld	a, (#_prota + 0)
   80A8 C6 04         [ 7]  489 	add	a, #0x04
   80AA D5            [11]  490 	push	de
   80AB C5            [11]  491 	push	bc
   80AC 33            [ 6]  492 	inc	sp
   80AD F5            [11]  493 	push	af
   80AE 33            [ 6]  494 	inc	sp
   80AF CD E9 7F      [17]  495 	call	_getTilePtr
   80B2 F1            [10]  496 	pop	af
   80B3 4D            [ 4]  497 	ld	c,l
   80B4 44            [ 4]  498 	ld	b,h
   80B5 D1            [10]  499 	pop	de
                            500 ;src/main.c:161: break;
   80B6 C3 5E 81      [10]  501 	jp	00105$
                            502 ;src/main.c:162: case 1:
   80B9                     503 00102$:
                            504 ;src/main.c:163: headTile  = getTilePtr(prota.x - 1, prota.y);
   80B9 21 A2 77      [10]  505 	ld	hl, #(_prota + 0x0001) + 0
   80BC 56            [ 7]  506 	ld	d,(hl)
   80BD 21 A1 77      [10]  507 	ld	hl, #_prota + 0
   80C0 46            [ 7]  508 	ld	b,(hl)
   80C1 05            [ 4]  509 	dec	b
   80C2 D5            [11]  510 	push	de
   80C3 33            [ 6]  511 	inc	sp
   80C4 C5            [11]  512 	push	bc
   80C5 33            [ 6]  513 	inc	sp
   80C6 CD E9 7F      [17]  514 	call	_getTilePtr
   80C9 F1            [10]  515 	pop	af
   80CA 33            [ 6]  516 	inc	sp
   80CB 33            [ 6]  517 	inc	sp
   80CC E5            [11]  518 	push	hl
                            519 ;src/main.c:164: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
   80CD 3A A2 77      [13]  520 	ld	a, (#(_prota + 0x0001) + 0)
   80D0 C6 14         [ 7]  521 	add	a, #0x14
   80D2 57            [ 4]  522 	ld	d,a
   80D3 21 A1 77      [10]  523 	ld	hl, #_prota + 0
   80D6 46            [ 7]  524 	ld	b,(hl)
   80D7 05            [ 4]  525 	dec	b
   80D8 D5            [11]  526 	push	de
   80D9 33            [ 6]  527 	inc	sp
   80DA C5            [11]  528 	push	bc
   80DB 33            [ 6]  529 	inc	sp
   80DC CD E9 7F      [17]  530 	call	_getTilePtr
   80DF F1            [10]  531 	pop	af
   80E0 EB            [ 4]  532 	ex	de,hl
                            533 ;src/main.c:165: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
   80E1 3A A2 77      [13]  534 	ld	a, (#(_prota + 0x0001) + 0)
   80E4 C6 0B         [ 7]  535 	add	a, #0x0B
   80E6 47            [ 4]  536 	ld	b,a
   80E7 3A A1 77      [13]  537 	ld	a, (#_prota + 0)
   80EA C6 FF         [ 7]  538 	add	a,#0xFF
   80EC D5            [11]  539 	push	de
   80ED C5            [11]  540 	push	bc
   80EE 33            [ 6]  541 	inc	sp
   80EF F5            [11]  542 	push	af
   80F0 33            [ 6]  543 	inc	sp
   80F1 CD E9 7F      [17]  544 	call	_getTilePtr
   80F4 F1            [10]  545 	pop	af
   80F5 4D            [ 4]  546 	ld	c,l
   80F6 44            [ 4]  547 	ld	b,h
   80F7 D1            [10]  548 	pop	de
                            549 ;src/main.c:166: break;
   80F8 18 64         [12]  550 	jr	00105$
                            551 ;src/main.c:167: case 2:
   80FA                     552 00103$:
                            553 ;src/main.c:168: headTile   = getTilePtr(prota.x, prota.y - 2);
   80FA 3A A2 77      [13]  554 	ld	a, (#(_prota + 0x0001) + 0)
   80FD C6 FE         [ 7]  555 	add	a,#0xFE
   80FF 21 A1 77      [10]  556 	ld	hl, #_prota + 0
   8102 56            [ 7]  557 	ld	d,(hl)
   8103 C5            [11]  558 	push	bc
   8104 F5            [11]  559 	push	af
   8105 33            [ 6]  560 	inc	sp
   8106 D5            [11]  561 	push	de
   8107 33            [ 6]  562 	inc	sp
   8108 CD E9 7F      [17]  563 	call	_getTilePtr
   810B F1            [10]  564 	pop	af
   810C C1            [10]  565 	pop	bc
   810D 33            [ 6]  566 	inc	sp
   810E 33            [ 6]  567 	inc	sp
   810F E5            [11]  568 	push	hl
                            569 ;src/main.c:169: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
   8110 21 A2 77      [10]  570 	ld	hl, #(_prota + 0x0001) + 0
   8113 56            [ 7]  571 	ld	d,(hl)
   8114 15            [ 4]  572 	dec	d
   8115 15            [ 4]  573 	dec	d
   8116 3A A1 77      [13]  574 	ld	a, (#_prota + 0)
   8119 C6 03         [ 7]  575 	add	a, #0x03
   811B C5            [11]  576 	push	bc
   811C D5            [11]  577 	push	de
   811D 33            [ 6]  578 	inc	sp
   811E F5            [11]  579 	push	af
   811F 33            [ 6]  580 	inc	sp
   8120 CD E9 7F      [17]  581 	call	_getTilePtr
   8123 F1            [10]  582 	pop	af
   8124 EB            [ 4]  583 	ex	de,hl
   8125 C1            [10]  584 	pop	bc
                            585 ;src/main.c:170: *waistTile = 0;
   8126 21 00 00      [10]  586 	ld	hl,#0x0000
   8129 36 00         [10]  587 	ld	(hl),#0x00
                            588 ;src/main.c:171: break;
   812B 18 31         [12]  589 	jr	00105$
                            590 ;src/main.c:172: case 3:
   812D                     591 00104$:
                            592 ;src/main.c:173: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
   812D 3A A2 77      [13]  593 	ld	a, (#(_prota + 0x0001) + 0)
   8130 C6 16         [ 7]  594 	add	a, #0x16
   8132 21 A1 77      [10]  595 	ld	hl, #_prota + 0
   8135 56            [ 7]  596 	ld	d,(hl)
   8136 C5            [11]  597 	push	bc
   8137 F5            [11]  598 	push	af
   8138 33            [ 6]  599 	inc	sp
   8139 D5            [11]  600 	push	de
   813A 33            [ 6]  601 	inc	sp
   813B CD E9 7F      [17]  602 	call	_getTilePtr
   813E F1            [10]  603 	pop	af
   813F C1            [10]  604 	pop	bc
   8140 33            [ 6]  605 	inc	sp
   8141 33            [ 6]  606 	inc	sp
   8142 E5            [11]  607 	push	hl
                            608 ;src/main.c:174: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   8143 3A A2 77      [13]  609 	ld	a, (#(_prota + 0x0001) + 0)
   8146 C6 16         [ 7]  610 	add	a, #0x16
   8148 57            [ 4]  611 	ld	d,a
   8149 3A A1 77      [13]  612 	ld	a, (#_prota + 0)
   814C C6 03         [ 7]  613 	add	a, #0x03
   814E C5            [11]  614 	push	bc
   814F D5            [11]  615 	push	de
   8150 33            [ 6]  616 	inc	sp
   8151 F5            [11]  617 	push	af
   8152 33            [ 6]  618 	inc	sp
   8153 CD E9 7F      [17]  619 	call	_getTilePtr
   8156 F1            [10]  620 	pop	af
   8157 EB            [ 4]  621 	ex	de,hl
   8158 C1            [10]  622 	pop	bc
                            623 ;src/main.c:175: *waistTile = 0;
   8159 21 00 00      [10]  624 	ld	hl,#0x0000
   815C 36 00         [10]  625 	ld	(hl),#0x00
                            626 ;src/main.c:177: }
   815E                     627 00105$:
                            628 ;src/main.c:179: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   815E E1            [10]  629 	pop	hl
   815F E5            [11]  630 	push	hl
   8160 6E            [ 7]  631 	ld	l,(hl)
   8161 3E 02         [ 7]  632 	ld	a,#0x02
   8163 95            [ 4]  633 	sub	a, l
   8164 38 0E         [12]  634 	jr	C,00106$
   8166 1A            [ 7]  635 	ld	a,(de)
   8167 5F            [ 4]  636 	ld	e,a
   8168 3E 02         [ 7]  637 	ld	a,#0x02
   816A 93            [ 4]  638 	sub	a, e
   816B 38 07         [12]  639 	jr	C,00106$
   816D 0A            [ 7]  640 	ld	a,(bc)
   816E 4F            [ 4]  641 	ld	c,a
   816F 3E 02         [ 7]  642 	ld	a,#0x02
   8171 91            [ 4]  643 	sub	a, c
   8172 30 04         [12]  644 	jr	NC,00107$
   8174                     645 00106$:
                            646 ;src/main.c:180: return 1;
   8174 2E 01         [ 7]  647 	ld	l,#0x01
   8176 18 02         [12]  648 	jr	00110$
   8178                     649 00107$:
                            650 ;src/main.c:182: return 0;
   8178 2E 00         [ 7]  651 	ld	l,#0x00
   817A                     652 00110$:
   817A DD F9         [10]  653 	ld	sp, ix
   817C DD E1         [14]  654 	pop	ix
   817E C9            [10]  655 	ret
                            656 ;src/main.c:185: void dibujarEnemigo(TEnemy *enemy) {
                            657 ;	---------------------------------
                            658 ; Function dibujarEnemigo
                            659 ; ---------------------------------
   817F                     660 _dibujarEnemigo::
   817F DD E5         [15]  661 	push	ix
   8181 DD 21 00 00   [14]  662 	ld	ix,#0
   8185 DD 39         [15]  663 	add	ix,sp
                            664 ;src/main.c:186: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   8187 DD 4E 04      [19]  665 	ld	c,4 (ix)
   818A DD 46 05      [19]  666 	ld	b,5 (ix)
   818D 69            [ 4]  667 	ld	l, c
   818E 60            [ 4]  668 	ld	h, b
   818F 23            [ 6]  669 	inc	hl
   8190 56            [ 7]  670 	ld	d,(hl)
   8191 0A            [ 7]  671 	ld	a,(bc)
   8192 C5            [11]  672 	push	bc
   8193 D5            [11]  673 	push	de
   8194 33            [ 6]  674 	inc	sp
   8195 F5            [11]  675 	push	af
   8196 33            [ 6]  676 	inc	sp
   8197 21 00 C0      [10]  677 	ld	hl,#0xC000
   819A E5            [11]  678 	push	hl
   819B CD 5C 72      [17]  679 	call	_cpct_getScreenPtr
   819E EB            [ 4]  680 	ex	de,hl
                            681 ;src/main.c:187: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   819F E1            [10]  682 	pop	hl
   81A0 01 04 00      [10]  683 	ld	bc, #0x0004
   81A3 09            [11]  684 	add	hl, bc
   81A4 4E            [ 7]  685 	ld	c,(hl)
   81A5 23            [ 6]  686 	inc	hl
   81A6 46            [ 7]  687 	ld	b,(hl)
   81A7 21 00 1E      [10]  688 	ld	hl,#_g_tablatrans
   81AA E5            [11]  689 	push	hl
   81AB 21 04 16      [10]  690 	ld	hl,#0x1604
   81AE E5            [11]  691 	push	hl
   81AF D5            [11]  692 	push	de
   81B0 C5            [11]  693 	push	bc
   81B1 CD 7C 72      [17]  694 	call	_cpct_drawSpriteMaskedAlignedTable
   81B4 DD E1         [14]  695 	pop	ix
   81B6 C9            [10]  696 	ret
                            697 ;src/main.c:190: void dibujarExplosion(TEnemy *enemy) {
                            698 ;	---------------------------------
                            699 ; Function dibujarExplosion
                            700 ; ---------------------------------
   81B7                     701 _dibujarExplosion::
   81B7 DD E5         [15]  702 	push	ix
   81B9 DD 21 00 00   [14]  703 	ld	ix,#0
   81BD DD 39         [15]  704 	add	ix,sp
                            705 ;src/main.c:191: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   81BF DD 4E 04      [19]  706 	ld	c,4 (ix)
   81C2 DD 46 05      [19]  707 	ld	b,5 (ix)
   81C5 69            [ 4]  708 	ld	l, c
   81C6 60            [ 4]  709 	ld	h, b
   81C7 23            [ 6]  710 	inc	hl
   81C8 56            [ 7]  711 	ld	d,(hl)
   81C9 0A            [ 7]  712 	ld	a,(bc)
   81CA 47            [ 4]  713 	ld	b,a
   81CB D5            [11]  714 	push	de
   81CC 33            [ 6]  715 	inc	sp
   81CD C5            [11]  716 	push	bc
   81CE 33            [ 6]  717 	inc	sp
   81CF 21 00 C0      [10]  718 	ld	hl,#0xC000
   81D2 E5            [11]  719 	push	hl
   81D3 CD 5C 72      [17]  720 	call	_cpct_getScreenPtr
   81D6 4D            [ 4]  721 	ld	c,l
   81D7 44            [ 4]  722 	ld	b,h
                            723 ;src/main.c:192: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   81D8 11 00 1E      [10]  724 	ld	de,#_g_tablatrans+0
   81DB D5            [11]  725 	push	de
   81DC 21 04 16      [10]  726 	ld	hl,#0x1604
   81DF E5            [11]  727 	push	hl
   81E0 C5            [11]  728 	push	bc
   81E1 21 A8 35      [10]  729 	ld	hl,#_g_explosion
   81E4 E5            [11]  730 	push	hl
   81E5 CD 7C 72      [17]  731 	call	_cpct_drawSpriteMaskedAlignedTable
   81E8 DD E1         [14]  732 	pop	ix
   81EA C9            [10]  733 	ret
                            734 ;src/main.c:195: void borrarExplosion() {
                            735 ;	---------------------------------
                            736 ; Function borrarExplosion
                            737 ; ---------------------------------
   81EB                     738 _borrarExplosion::
   81EB DD E5         [15]  739 	push	ix
   81ED DD 21 00 00   [14]  740 	ld	ix,#0
   81F1 DD 39         [15]  741 	add	ix,sp
   81F3 F5            [11]  742 	push	af
   81F4 3B            [ 6]  743 	dec	sp
                            744 ;src/main.c:196: u8 w = 4 + (enemy->px & 1);
   81F5 21 BB 72      [10]  745 	ld	hl, #_enemy + 2
   81F8 4E            [ 7]  746 	ld	c,(hl)
   81F9 79            [ 4]  747 	ld	a,c
   81FA E6 01         [ 7]  748 	and	a, #0x01
   81FC 47            [ 4]  749 	ld	b,a
   81FD 04            [ 4]  750 	inc	b
   81FE 04            [ 4]  751 	inc	b
   81FF 04            [ 4]  752 	inc	b
   8200 04            [ 4]  753 	inc	b
                            754 ;src/main.c:199: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   8201 21 BC 72      [10]  755 	ld	hl, #_enemy + 3
   8204 5E            [ 7]  756 	ld	e,(hl)
   8205 CB 4B         [ 8]  757 	bit	1, e
   8207 28 04         [12]  758 	jr	Z,00103$
   8209 3E 01         [ 7]  759 	ld	a,#0x01
   820B 18 02         [12]  760 	jr	00104$
   820D                     761 00103$:
   820D 3E 00         [ 7]  762 	ld	a,#0x00
   820F                     763 00104$:
   820F C6 07         [ 7]  764 	add	a, #0x07
   8211 DD 77 FD      [19]  765 	ld	-3 (ix),a
                            766 ;src/main.c:201: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   8214 FD 2A B4 77   [20]  767 	ld	iy,(_mapa)
   8218 16 00         [ 7]  768 	ld	d,#0x00
   821A 7B            [ 4]  769 	ld	a,e
   821B C6 E8         [ 7]  770 	add	a,#0xE8
   821D DD 77 FE      [19]  771 	ld	-2 (ix),a
   8220 7A            [ 4]  772 	ld	a,d
   8221 CE FF         [ 7]  773 	adc	a,#0xFF
   8223 DD 77 FF      [19]  774 	ld	-1 (ix),a
   8226 DD 6E FE      [19]  775 	ld	l,-2 (ix)
   8229 DD 66 FF      [19]  776 	ld	h,-1 (ix)
   822C DD CB FF 7E   [20]  777 	bit	7, -1 (ix)
   8230 28 04         [12]  778 	jr	Z,00105$
   8232 21 EB FF      [10]  779 	ld	hl,#0xFFEB
   8235 19            [11]  780 	add	hl,de
   8236                     781 00105$:
   8236 CB 2C         [ 8]  782 	sra	h
   8238 CB 1D         [ 8]  783 	rr	l
   823A CB 2C         [ 8]  784 	sra	h
   823C CB 1D         [ 8]  785 	rr	l
   823E 55            [ 4]  786 	ld	d,l
   823F CB 39         [ 8]  787 	srl	c
   8241 FD E5         [15]  788 	push	iy
   8243 21 F0 C0      [10]  789 	ld	hl,#0xC0F0
   8246 E5            [11]  790 	push	hl
   8247 3E 28         [ 7]  791 	ld	a,#0x28
   8249 F5            [11]  792 	push	af
   824A 33            [ 6]  793 	inc	sp
   824B DD 7E FD      [19]  794 	ld	a,-3 (ix)
   824E F5            [11]  795 	push	af
   824F 33            [ 6]  796 	inc	sp
   8250 C5            [11]  797 	push	bc
   8251 33            [ 6]  798 	inc	sp
   8252 D5            [11]  799 	push	de
   8253 33            [ 6]  800 	inc	sp
   8254 79            [ 4]  801 	ld	a,c
   8255 F5            [11]  802 	push	af
   8256 33            [ 6]  803 	inc	sp
   8257 CD FD 66      [17]  804 	call	_cpct_etm_drawTileBox2x4
   825A DD F9         [10]  805 	ld	sp, ix
   825C DD E1         [14]  806 	pop	ix
   825E C9            [10]  807 	ret
                            808 ;src/main.c:205: void borrarEnemigo(TEnemy *enemy) {
                            809 ;	---------------------------------
                            810 ; Function borrarEnemigo
                            811 ; ---------------------------------
   825F                     812 _borrarEnemigo::
   825F DD E5         [15]  813 	push	ix
   8261 DD 21 00 00   [14]  814 	ld	ix,#0
   8265 DD 39         [15]  815 	add	ix,sp
   8267 21 FA FF      [10]  816 	ld	hl,#-6
   826A 39            [11]  817 	add	hl,sp
   826B F9            [ 6]  818 	ld	sp,hl
                            819 ;src/main.c:207: u8 w = 4 + (enemy->px & 1);
   826C DD 4E 04      [19]  820 	ld	c,4 (ix)
   826F DD 46 05      [19]  821 	ld	b,5 (ix)
   8272 69            [ 4]  822 	ld	l, c
   8273 60            [ 4]  823 	ld	h, b
   8274 23            [ 6]  824 	inc	hl
   8275 23            [ 6]  825 	inc	hl
   8276 5E            [ 7]  826 	ld	e,(hl)
   8277 7B            [ 4]  827 	ld	a,e
   8278 E6 01         [ 7]  828 	and	a, #0x01
   827A C6 04         [ 7]  829 	add	a, #0x04
   827C DD 77 FA      [19]  830 	ld	-6 (ix),a
                            831 ;src/main.c:210: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   827F 69            [ 4]  832 	ld	l, c
   8280 60            [ 4]  833 	ld	h, b
   8281 23            [ 6]  834 	inc	hl
   8282 23            [ 6]  835 	inc	hl
   8283 23            [ 6]  836 	inc	hl
   8284 56            [ 7]  837 	ld	d,(hl)
   8285 CB 4A         [ 8]  838 	bit	1, d
   8287 28 04         [12]  839 	jr	Z,00103$
   8289 3E 01         [ 7]  840 	ld	a,#0x01
   828B 18 02         [12]  841 	jr	00104$
   828D                     842 00103$:
   828D 3E 00         [ 7]  843 	ld	a,#0x00
   828F                     844 00104$:
   828F C6 07         [ 7]  845 	add	a, #0x07
   8291 DD 77 FB      [19]  846 	ld	-5 (ix),a
                            847 ;src/main.c:212: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   8294 FD 2A B4 77   [20]  848 	ld	iy,(_mapa)
   8298 DD 72 FC      [19]  849 	ld	-4 (ix),d
   829B DD 36 FD 00   [19]  850 	ld	-3 (ix),#0x00
   829F DD 7E FC      [19]  851 	ld	a,-4 (ix)
   82A2 C6 E8         [ 7]  852 	add	a,#0xE8
   82A4 DD 77 FE      [19]  853 	ld	-2 (ix),a
   82A7 DD 7E FD      [19]  854 	ld	a,-3 (ix)
   82AA CE FF         [ 7]  855 	adc	a,#0xFF
   82AC DD 77 FF      [19]  856 	ld	-1 (ix),a
   82AF DD 56 FE      [19]  857 	ld	d,-2 (ix)
   82B2 DD 6E FF      [19]  858 	ld	l,-1 (ix)
   82B5 DD CB FF 7E   [20]  859 	bit	7, -1 (ix)
   82B9 28 0C         [12]  860 	jr	Z,00105$
   82BB DD 7E FC      [19]  861 	ld	a,-4 (ix)
   82BE C6 EB         [ 7]  862 	add	a, #0xEB
   82C0 57            [ 4]  863 	ld	d,a
   82C1 DD 7E FD      [19]  864 	ld	a,-3 (ix)
   82C4 CE FF         [ 7]  865 	adc	a, #0xFF
   82C6 6F            [ 4]  866 	ld	l,a
   82C7                     867 00105$:
   82C7 CB 2D         [ 8]  868 	sra	l
   82C9 CB 1A         [ 8]  869 	rr	d
   82CB CB 2D         [ 8]  870 	sra	l
   82CD CB 1A         [ 8]  871 	rr	d
   82CF CB 3B         [ 8]  872 	srl	e
   82D1 C5            [11]  873 	push	bc
   82D2 FD E5         [15]  874 	push	iy
   82D4 21 F0 C0      [10]  875 	ld	hl,#0xC0F0
   82D7 E5            [11]  876 	push	hl
   82D8 3E 28         [ 7]  877 	ld	a,#0x28
   82DA F5            [11]  878 	push	af
   82DB 33            [ 6]  879 	inc	sp
   82DC DD 66 FB      [19]  880 	ld	h,-5 (ix)
   82DF DD 6E FA      [19]  881 	ld	l,-6 (ix)
   82E2 E5            [11]  882 	push	hl
   82E3 D5            [11]  883 	push	de
   82E4 CD FD 66      [17]  884 	call	_cpct_etm_drawTileBox2x4
   82E7 C1            [10]  885 	pop	bc
                            886 ;src/main.c:214: enemy->mover = NO;
   82E8 21 06 00      [10]  887 	ld	hl,#0x0006
   82EB 09            [11]  888 	add	hl,bc
   82EC 36 00         [10]  889 	ld	(hl),#0x00
   82EE DD F9         [10]  890 	ld	sp, ix
   82F0 DD E1         [14]  891 	pop	ix
   82F2 C9            [10]  892 	ret
                            893 ;src/main.c:217: void redibujarEnemigo(TEnemy *enemy) {
                            894 ;	---------------------------------
                            895 ; Function redibujarEnemigo
                            896 ; ---------------------------------
   82F3                     897 _redibujarEnemigo::
   82F3 DD E5         [15]  898 	push	ix
   82F5 DD 21 00 00   [14]  899 	ld	ix,#0
   82F9 DD 39         [15]  900 	add	ix,sp
                            901 ;src/main.c:218: borrarEnemigo(enemy);
   82FB DD 6E 04      [19]  902 	ld	l,4 (ix)
   82FE DD 66 05      [19]  903 	ld	h,5 (ix)
   8301 E5            [11]  904 	push	hl
   8302 CD 5F 82      [17]  905 	call	_borrarEnemigo
   8305 F1            [10]  906 	pop	af
                            907 ;src/main.c:219: enemy->px = enemy->x;
   8306 DD 4E 04      [19]  908 	ld	c,4 (ix)
   8309 DD 46 05      [19]  909 	ld	b,5 (ix)
   830C 59            [ 4]  910 	ld	e, c
   830D 50            [ 4]  911 	ld	d, b
   830E 13            [ 6]  912 	inc	de
   830F 13            [ 6]  913 	inc	de
   8310 0A            [ 7]  914 	ld	a,(bc)
   8311 12            [ 7]  915 	ld	(de),a
                            916 ;src/main.c:220: enemy->py = enemy->y;
   8312 59            [ 4]  917 	ld	e, c
   8313 50            [ 4]  918 	ld	d, b
   8314 13            [ 6]  919 	inc	de
   8315 13            [ 6]  920 	inc	de
   8316 13            [ 6]  921 	inc	de
   8317 69            [ 4]  922 	ld	l, c
   8318 60            [ 4]  923 	ld	h, b
   8319 23            [ 6]  924 	inc	hl
   831A 7E            [ 7]  925 	ld	a,(hl)
   831B 12            [ 7]  926 	ld	(de),a
                            927 ;src/main.c:221: dibujarEnemigo(enemy);
   831C C5            [11]  928 	push	bc
   831D CD 7F 81      [17]  929 	call	_dibujarEnemigo
   8320 F1            [10]  930 	pop	af
   8321 DD E1         [14]  931 	pop	ix
   8323 C9            [10]  932 	ret
                            933 ;src/main.c:224: u8 checkEnemyCollision(int direction, TEnemy *enemy){
                            934 ;	---------------------------------
                            935 ; Function checkEnemyCollision
                            936 ; ---------------------------------
   8324                     937 _checkEnemyCollision::
   8324 DD E5         [15]  938 	push	ix
   8326 DD 21 00 00   [14]  939 	ld	ix,#0
   832A DD 39         [15]  940 	add	ix,sp
   832C 21 F7 FF      [10]  941 	ld	hl,#-9
   832F 39            [11]  942 	add	hl,sp
   8330 F9            [ 6]  943 	ld	sp,hl
                            944 ;src/main.c:226: u8 colisiona = 1;
   8331 DD 36 F7 01   [19]  945 	ld	-9 (ix),#0x01
                            946 ;src/main.c:228: switch (direction) {
   8335 DD CB 05 7E   [20]  947 	bit	7, 5 (ix)
   8339 C2 EC 86      [10]  948 	jp	NZ,00165$
   833C 3E 03         [ 7]  949 	ld	a,#0x03
   833E DD BE 04      [19]  950 	cp	a, 4 (ix)
   8341 3E 00         [ 7]  951 	ld	a,#0x00
   8343 DD 9E 05      [19]  952 	sbc	a, 5 (ix)
   8346 E2 4B 83      [10]  953 	jp	PO, 00272$
   8349 EE 80         [ 7]  954 	xor	a, #0x80
   834B                     955 00272$:
   834B FA EC 86      [10]  956 	jp	M,00165$
                            957 ;src/main.c:230: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   834E DD 4E 06      [19]  958 	ld	c,6 (ix)
   8351 DD 46 07      [19]  959 	ld	b,7 (ix)
   8354 0A            [ 7]  960 	ld	a,(bc)
   8355 5F            [ 4]  961 	ld	e,a
   8356 21 01 00      [10]  962 	ld	hl,#0x0001
   8359 09            [11]  963 	add	hl,bc
   835A DD 75 F8      [19]  964 	ld	-8 (ix),l
   835D DD 74 F9      [19]  965 	ld	-7 (ix),h
   8360 DD 6E F8      [19]  966 	ld	l,-8 (ix)
   8363 DD 66 F9      [19]  967 	ld	h,-7 (ix)
   8366 56            [ 7]  968 	ld	d,(hl)
                            969 ;src/main.c:243: enemy->muerto = SI;
   8367 21 08 00      [10]  970 	ld	hl,#0x0008
   836A 09            [11]  971 	add	hl,bc
   836B DD 75 FA      [19]  972 	ld	-6 (ix),l
   836E DD 74 FB      [19]  973 	ld	-5 (ix),h
                            974 ;src/main.c:250: enemy->mira = M_izquierda;
   8371 21 07 00      [10]  975 	ld	hl,#0x0007
   8374 09            [11]  976 	add	hl,bc
   8375 DD 75 FC      [19]  977 	ld	-4 (ix),l
   8378 DD 74 FD      [19]  978 	ld	-3 (ix),h
                            979 ;src/main.c:228: switch (direction) {
   837B D5            [11]  980 	push	de
   837C DD 5E 04      [19]  981 	ld	e,4 (ix)
   837F 16 00         [ 7]  982 	ld	d,#0x00
   8381 21 89 83      [10]  983 	ld	hl,#00273$
   8384 19            [11]  984 	add	hl,de
   8385 19            [11]  985 	add	hl,de
   8386 19            [11]  986 	add	hl,de
   8387 D1            [10]  987 	pop	de
   8388 E9            [ 4]  988 	jp	(hl)
   8389                     989 00273$:
   8389 C3 95 83      [10]  990 	jp	00101$
   838C C3 6E 84      [10]  991 	jp	00117$
   838F C3 43 85      [10]  992 	jp	00133$
   8392 C3 12 86      [10]  993 	jp	00149$
                            994 ;src/main.c:229: case 0:
   8395                     995 00101$:
                            996 ;src/main.c:230: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   8395 7B            [ 4]  997 	ld	a,e
   8396 C6 05         [ 7]  998 	add	a, #0x05
   8398 C5            [11]  999 	push	bc
   8399 D5            [11] 1000 	push	de
   839A 33            [ 6] 1001 	inc	sp
   839B F5            [11] 1002 	push	af
   839C 33            [ 6] 1003 	inc	sp
   839D CD E9 7F      [17] 1004 	call	_getTilePtr
   83A0 F1            [10] 1005 	pop	af
   83A1 C1            [10] 1006 	pop	bc
   83A2 5E            [ 7] 1007 	ld	e,(hl)
   83A3 3E 02         [ 7] 1008 	ld	a,#0x02
   83A5 93            [ 4] 1009 	sub	a, e
   83A6 DA 63 84      [10] 1010 	jp	C,00113$
                           1011 ;src/main.c:231: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   83A9 DD 6E F8      [19] 1012 	ld	l,-8 (ix)
   83AC DD 66 F9      [19] 1013 	ld	h,-7 (ix)
   83AF 7E            [ 7] 1014 	ld	a,(hl)
   83B0 C6 0B         [ 7] 1015 	add	a, #0x0B
   83B2 57            [ 4] 1016 	ld	d,a
   83B3 0A            [ 7] 1017 	ld	a,(bc)
   83B4 C6 05         [ 7] 1018 	add	a, #0x05
   83B6 C5            [11] 1019 	push	bc
   83B7 D5            [11] 1020 	push	de
   83B8 33            [ 6] 1021 	inc	sp
   83B9 F5            [11] 1022 	push	af
   83BA 33            [ 6] 1023 	inc	sp
   83BB CD E9 7F      [17] 1024 	call	_getTilePtr
   83BE F1            [10] 1025 	pop	af
   83BF C1            [10] 1026 	pop	bc
   83C0 5E            [ 7] 1027 	ld	e,(hl)
   83C1 3E 02         [ 7] 1028 	ld	a,#0x02
   83C3 93            [ 4] 1029 	sub	a, e
   83C4 DA 63 84      [10] 1030 	jp	C,00113$
                           1031 ;src/main.c:232: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   83C7 DD 6E F8      [19] 1032 	ld	l,-8 (ix)
   83CA DD 66 F9      [19] 1033 	ld	h,-7 (ix)
   83CD 7E            [ 7] 1034 	ld	a,(hl)
   83CE C6 16         [ 7] 1035 	add	a, #0x16
   83D0 57            [ 4] 1036 	ld	d,a
   83D1 0A            [ 7] 1037 	ld	a,(bc)
   83D2 C6 05         [ 7] 1038 	add	a, #0x05
   83D4 C5            [11] 1039 	push	bc
   83D5 D5            [11] 1040 	push	de
   83D6 33            [ 6] 1041 	inc	sp
   83D7 F5            [11] 1042 	push	af
   83D8 33            [ 6] 1043 	inc	sp
   83D9 CD E9 7F      [17] 1044 	call	_getTilePtr
   83DC F1            [10] 1045 	pop	af
   83DD C1            [10] 1046 	pop	bc
   83DE 5E            [ 7] 1047 	ld	e,(hl)
   83DF 3E 02         [ 7] 1048 	ld	a,#0x02
   83E1 93            [ 4] 1049 	sub	a, e
   83E2 DA 63 84      [10] 1050 	jp	C,00113$
                           1051 ;src/main.c:234: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   83E5 21 AA 77      [10] 1052 	ld	hl, #_cu + 1
   83E8 5E            [ 7] 1053 	ld	e,(hl)
   83E9 16 00         [ 7] 1054 	ld	d,#0x00
   83EB 21 04 00      [10] 1055 	ld	hl,#0x0004
   83EE 19            [11] 1056 	add	hl,de
   83EF DD 75 FE      [19] 1057 	ld	-2 (ix),l
   83F2 DD 74 FF      [19] 1058 	ld	-1 (ix),h
   83F5 DD 6E F8      [19] 1059 	ld	l,-8 (ix)
   83F8 DD 66 F9      [19] 1060 	ld	h,-7 (ix)
   83FB 6E            [ 7] 1061 	ld	l,(hl)
   83FC 26 00         [ 7] 1062 	ld	h,#0x00
   83FE DD 7E FE      [19] 1063 	ld	a,-2 (ix)
   8401 95            [ 4] 1064 	sub	a, l
   8402 DD 7E FF      [19] 1065 	ld	a,-1 (ix)
   8405 9C            [ 4] 1066 	sbc	a, h
   8406 E2 0B 84      [10] 1067 	jp	PO, 00274$
   8409 EE 80         [ 7] 1068 	xor	a, #0x80
   840B                    1069 00274$:
   840B FA 20 84      [10] 1070 	jp	M,00108$
   840E D5            [11] 1071 	push	de
   840F 11 16 00      [10] 1072 	ld	de,#0x0016
   8412 19            [11] 1073 	add	hl, de
   8413 D1            [10] 1074 	pop	de
   8414 7D            [ 4] 1075 	ld	a,l
   8415 93            [ 4] 1076 	sub	a, e
   8416 7C            [ 4] 1077 	ld	a,h
   8417 9A            [ 4] 1078 	sbc	a, d
   8418 E2 1D 84      [10] 1079 	jp	PO, 00275$
   841B EE 80         [ 7] 1080 	xor	a, #0x80
   841D                    1081 00275$:
   841D F2 27 84      [10] 1082 	jp	P,00109$
   8420                    1083 00108$:
                           1084 ;src/main.c:235: colisiona = 0;
   8420 DD 36 F7 00   [19] 1085 	ld	-9 (ix),#0x00
   8424 C3 EC 86      [10] 1086 	jp	00165$
   8427                    1087 00109$:
                           1088 ;src/main.c:238: if(cu.x > enemy->x){ //si el cu esta abajo
   8427 21 A9 77      [10] 1089 	ld	hl, #_cu + 0
   842A 5E            [ 7] 1090 	ld	e,(hl)
   842B 0A            [ 7] 1091 	ld	a,(bc)
   842C 4F            [ 4] 1092 	ld	c,a
   842D 93            [ 4] 1093 	sub	a, e
   842E 30 2C         [12] 1094 	jr	NC,00106$
                           1095 ;src/main.c:239: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
   8430 6B            [ 4] 1096 	ld	l,e
   8431 26 00         [ 7] 1097 	ld	h,#0x00
   8433 06 00         [ 7] 1098 	ld	b,#0x00
   8435 03            [ 6] 1099 	inc	bc
   8436 03            [ 6] 1100 	inc	bc
   8437 03            [ 6] 1101 	inc	bc
   8438 03            [ 6] 1102 	inc	bc
   8439 BF            [ 4] 1103 	cp	a, a
   843A ED 42         [15] 1104 	sbc	hl, bc
   843C 3E 01         [ 7] 1105 	ld	a,#0x01
   843E BD            [ 4] 1106 	cp	a, l
   843F 3E 00         [ 7] 1107 	ld	a,#0x00
   8441 9C            [ 4] 1108 	sbc	a, h
   8442 E2 47 84      [10] 1109 	jp	PO, 00276$
   8445 EE 80         [ 7] 1110 	xor	a, #0x80
   8447                    1111 00276$:
   8447 F2 51 84      [10] 1112 	jp	P,00103$
                           1113 ;src/main.c:240: colisiona = 0;
   844A DD 36 F7 00   [19] 1114 	ld	-9 (ix),#0x00
   844E C3 EC 86      [10] 1115 	jp	00165$
   8451                    1116 00103$:
                           1117 ;src/main.c:243: enemy->muerto = SI;
   8451 DD 6E FA      [19] 1118 	ld	l,-6 (ix)
   8454 DD 66 FB      [19] 1119 	ld	h,-5 (ix)
   8457 36 01         [10] 1120 	ld	(hl),#0x01
   8459 C3 EC 86      [10] 1121 	jp	00165$
   845C                    1122 00106$:
                           1123 ;src/main.c:246: colisiona = 0;
   845C DD 36 F7 00   [19] 1124 	ld	-9 (ix),#0x00
   8460 C3 EC 86      [10] 1125 	jp	00165$
   8463                    1126 00113$:
                           1127 ;src/main.c:250: enemy->mira = M_izquierda;
   8463 DD 6E FC      [19] 1128 	ld	l,-4 (ix)
   8466 DD 66 FD      [19] 1129 	ld	h,-3 (ix)
   8469 36 01         [10] 1130 	ld	(hl),#0x01
                           1131 ;src/main.c:252: break;
   846B C3 EC 86      [10] 1132 	jp	00165$
                           1133 ;src/main.c:253: case 1:
   846E                    1134 00117$:
                           1135 ;src/main.c:254: if( *getTilePtr(enemy->x - 1, enemy->y) <= 2
   846E 1D            [ 4] 1136 	dec	e
   846F C5            [11] 1137 	push	bc
   8470 D5            [11] 1138 	push	de
   8471 CD E9 7F      [17] 1139 	call	_getTilePtr
   8474 F1            [10] 1140 	pop	af
   8475 C1            [10] 1141 	pop	bc
   8476 5E            [ 7] 1142 	ld	e,(hl)
   8477 3E 02         [ 7] 1143 	ld	a,#0x02
   8479 93            [ 4] 1144 	sub	a, e
   847A DA 38 85      [10] 1145 	jp	C,00129$
                           1146 ;src/main.c:255: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   847D DD 6E F8      [19] 1147 	ld	l,-8 (ix)
   8480 DD 66 F9      [19] 1148 	ld	h,-7 (ix)
   8483 7E            [ 7] 1149 	ld	a,(hl)
   8484 C6 0B         [ 7] 1150 	add	a, #0x0B
   8486 57            [ 4] 1151 	ld	d,a
   8487 0A            [ 7] 1152 	ld	a,(bc)
   8488 C6 FF         [ 7] 1153 	add	a,#0xFF
   848A C5            [11] 1154 	push	bc
   848B D5            [11] 1155 	push	de
   848C 33            [ 6] 1156 	inc	sp
   848D F5            [11] 1157 	push	af
   848E 33            [ 6] 1158 	inc	sp
   848F CD E9 7F      [17] 1159 	call	_getTilePtr
   8492 F1            [10] 1160 	pop	af
   8493 C1            [10] 1161 	pop	bc
   8494 5E            [ 7] 1162 	ld	e,(hl)
   8495 3E 02         [ 7] 1163 	ld	a,#0x02
   8497 93            [ 4] 1164 	sub	a, e
   8498 DA 38 85      [10] 1165 	jp	C,00129$
                           1166 ;src/main.c:256: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   849B DD 6E F8      [19] 1167 	ld	l,-8 (ix)
   849E DD 66 F9      [19] 1168 	ld	h,-7 (ix)
   84A1 7E            [ 7] 1169 	ld	a,(hl)
   84A2 C6 16         [ 7] 1170 	add	a, #0x16
   84A4 57            [ 4] 1171 	ld	d,a
   84A5 0A            [ 7] 1172 	ld	a,(bc)
   84A6 C6 FF         [ 7] 1173 	add	a,#0xFF
   84A8 C5            [11] 1174 	push	bc
   84A9 D5            [11] 1175 	push	de
   84AA 33            [ 6] 1176 	inc	sp
   84AB F5            [11] 1177 	push	af
   84AC 33            [ 6] 1178 	inc	sp
   84AD CD E9 7F      [17] 1179 	call	_getTilePtr
   84B0 F1            [10] 1180 	pop	af
   84B1 C1            [10] 1181 	pop	bc
   84B2 5E            [ 7] 1182 	ld	e,(hl)
   84B3 3E 02         [ 7] 1183 	ld	a,#0x02
   84B5 93            [ 4] 1184 	sub	a, e
   84B6 DA 38 85      [10] 1185 	jp	C,00129$
                           1186 ;src/main.c:258: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   84B9 21 AA 77      [10] 1187 	ld	hl, #_cu + 1
   84BC 5E            [ 7] 1188 	ld	e,(hl)
   84BD 16 00         [ 7] 1189 	ld	d,#0x00
   84BF 21 04 00      [10] 1190 	ld	hl,#0x0004
   84C2 19            [11] 1191 	add	hl,de
   84C3 DD 75 FE      [19] 1192 	ld	-2 (ix),l
   84C6 DD 74 FF      [19] 1193 	ld	-1 (ix),h
   84C9 DD 6E F8      [19] 1194 	ld	l,-8 (ix)
   84CC DD 66 F9      [19] 1195 	ld	h,-7 (ix)
   84CF 6E            [ 7] 1196 	ld	l,(hl)
   84D0 26 00         [ 7] 1197 	ld	h,#0x00
   84D2 DD 7E FE      [19] 1198 	ld	a,-2 (ix)
   84D5 95            [ 4] 1199 	sub	a, l
   84D6 DD 7E FF      [19] 1200 	ld	a,-1 (ix)
   84D9 9C            [ 4] 1201 	sbc	a, h
   84DA E2 DF 84      [10] 1202 	jp	PO, 00277$
   84DD EE 80         [ 7] 1203 	xor	a, #0x80
   84DF                    1204 00277$:
   84DF FA F4 84      [10] 1205 	jp	M,00124$
   84E2 D5            [11] 1206 	push	de
   84E3 11 16 00      [10] 1207 	ld	de,#0x0016
   84E6 19            [11] 1208 	add	hl, de
   84E7 D1            [10] 1209 	pop	de
   84E8 7D            [ 4] 1210 	ld	a,l
   84E9 93            [ 4] 1211 	sub	a, e
   84EA 7C            [ 4] 1212 	ld	a,h
   84EB 9A            [ 4] 1213 	sbc	a, d
   84EC E2 F1 84      [10] 1214 	jp	PO, 00278$
   84EF EE 80         [ 7] 1215 	xor	a, #0x80
   84F1                    1216 00278$:
   84F1 F2 FB 84      [10] 1217 	jp	P,00125$
   84F4                    1218 00124$:
                           1219 ;src/main.c:259: colisiona = 0;
   84F4 DD 36 F7 00   [19] 1220 	ld	-9 (ix),#0x00
   84F8 C3 EC 86      [10] 1221 	jp	00165$
   84FB                    1222 00125$:
                           1223 ;src/main.c:262: if(enemy->x > cu.x){ //si el cu esta abajo
   84FB 0A            [ 7] 1224 	ld	a,(bc)
   84FC 5F            [ 4] 1225 	ld	e,a
   84FD 21 A9 77      [10] 1226 	ld	hl, #_cu + 0
   8500 4E            [ 7] 1227 	ld	c,(hl)
   8501 79            [ 4] 1228 	ld	a,c
   8502 93            [ 4] 1229 	sub	a, e
   8503 30 2C         [12] 1230 	jr	NC,00122$
                           1231 ;src/main.c:263: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
   8505 6B            [ 4] 1232 	ld	l,e
   8506 26 00         [ 7] 1233 	ld	h,#0x00
   8508 06 00         [ 7] 1234 	ld	b,#0x00
   850A 03            [ 6] 1235 	inc	bc
   850B 03            [ 6] 1236 	inc	bc
   850C 03            [ 6] 1237 	inc	bc
   850D 03            [ 6] 1238 	inc	bc
   850E BF            [ 4] 1239 	cp	a, a
   850F ED 42         [15] 1240 	sbc	hl, bc
   8511 3E 01         [ 7] 1241 	ld	a,#0x01
   8513 BD            [ 4] 1242 	cp	a, l
   8514 3E 00         [ 7] 1243 	ld	a,#0x00
   8516 9C            [ 4] 1244 	sbc	a, h
   8517 E2 1C 85      [10] 1245 	jp	PO, 00279$
   851A EE 80         [ 7] 1246 	xor	a, #0x80
   851C                    1247 00279$:
   851C F2 26 85      [10] 1248 	jp	P,00119$
                           1249 ;src/main.c:264: colisiona = 0;
   851F DD 36 F7 00   [19] 1250 	ld	-9 (ix),#0x00
   8523 C3 EC 86      [10] 1251 	jp	00165$
   8526                    1252 00119$:
                           1253 ;src/main.c:267: enemy->muerto = SI;
   8526 DD 6E FA      [19] 1254 	ld	l,-6 (ix)
   8529 DD 66 FB      [19] 1255 	ld	h,-5 (ix)
   852C 36 01         [10] 1256 	ld	(hl),#0x01
   852E C3 EC 86      [10] 1257 	jp	00165$
   8531                    1258 00122$:
                           1259 ;src/main.c:270: colisiona = 0;
   8531 DD 36 F7 00   [19] 1260 	ld	-9 (ix),#0x00
   8535 C3 EC 86      [10] 1261 	jp	00165$
   8538                    1262 00129$:
                           1263 ;src/main.c:274: enemy->mira = M_derecha;
   8538 DD 6E FC      [19] 1264 	ld	l,-4 (ix)
   853B DD 66 FD      [19] 1265 	ld	h,-3 (ix)
   853E 36 00         [10] 1266 	ld	(hl),#0x00
                           1267 ;src/main.c:276: break;
   8540 C3 EC 86      [10] 1268 	jp	00165$
                           1269 ;src/main.c:277: case 2:
   8543                    1270 00133$:
                           1271 ;src/main.c:278: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   8543 15            [ 4] 1272 	dec	d
   8544 15            [ 4] 1273 	dec	d
   8545 C5            [11] 1274 	push	bc
   8546 D5            [11] 1275 	push	de
   8547 CD E9 7F      [17] 1276 	call	_getTilePtr
   854A F1            [10] 1277 	pop	af
   854B C1            [10] 1278 	pop	bc
   854C 5E            [ 7] 1279 	ld	e,(hl)
   854D 3E 02         [ 7] 1280 	ld	a,#0x02
   854F 93            [ 4] 1281 	sub	a, e
   8550 DA 0A 86      [10] 1282 	jp	C,00145$
                           1283 ;src/main.c:279: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   8553 DD 6E F8      [19] 1284 	ld	l,-8 (ix)
   8556 DD 66 F9      [19] 1285 	ld	h,-7 (ix)
   8559 56            [ 7] 1286 	ld	d,(hl)
   855A 15            [ 4] 1287 	dec	d
   855B 15            [ 4] 1288 	dec	d
   855C 0A            [ 7] 1289 	ld	a,(bc)
   855D C6 02         [ 7] 1290 	add	a, #0x02
   855F C5            [11] 1291 	push	bc
   8560 D5            [11] 1292 	push	de
   8561 33            [ 6] 1293 	inc	sp
   8562 F5            [11] 1294 	push	af
   8563 33            [ 6] 1295 	inc	sp
   8564 CD E9 7F      [17] 1296 	call	_getTilePtr
   8567 F1            [10] 1297 	pop	af
   8568 C1            [10] 1298 	pop	bc
   8569 5E            [ 7] 1299 	ld	e,(hl)
   856A 3E 02         [ 7] 1300 	ld	a,#0x02
   856C 93            [ 4] 1301 	sub	a, e
   856D DA 0A 86      [10] 1302 	jp	C,00145$
                           1303 ;src/main.c:280: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   8570 DD 6E F8      [19] 1304 	ld	l,-8 (ix)
   8573 DD 66 F9      [19] 1305 	ld	h,-7 (ix)
   8576 56            [ 7] 1306 	ld	d,(hl)
   8577 15            [ 4] 1307 	dec	d
   8578 15            [ 4] 1308 	dec	d
   8579 0A            [ 7] 1309 	ld	a,(bc)
   857A C6 04         [ 7] 1310 	add	a, #0x04
   857C C5            [11] 1311 	push	bc
   857D D5            [11] 1312 	push	de
   857E 33            [ 6] 1313 	inc	sp
   857F F5            [11] 1314 	push	af
   8580 33            [ 6] 1315 	inc	sp
   8581 CD E9 7F      [17] 1316 	call	_getTilePtr
   8584 F1            [10] 1317 	pop	af
   8585 C1            [10] 1318 	pop	bc
   8586 5E            [ 7] 1319 	ld	e,(hl)
   8587 3E 02         [ 7] 1320 	ld	a,#0x02
   8589 93            [ 4] 1321 	sub	a, e
   858A DA 0A 86      [10] 1322 	jp	C,00145$
                           1323 ;src/main.c:282: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   858D 21 A9 77      [10] 1324 	ld	hl, #_cu + 0
   8590 5E            [ 7] 1325 	ld	e,(hl)
   8591 16 00         [ 7] 1326 	ld	d,#0x00
   8593 21 02 00      [10] 1327 	ld	hl,#0x0002
   8596 19            [11] 1328 	add	hl,de
   8597 DD 75 FE      [19] 1329 	ld	-2 (ix),l
   859A DD 74 FF      [19] 1330 	ld	-1 (ix),h
   859D 0A            [ 7] 1331 	ld	a,(bc)
   859E 6F            [ 4] 1332 	ld	l,a
   859F 26 00         [ 7] 1333 	ld	h,#0x00
   85A1 DD 7E FE      [19] 1334 	ld	a,-2 (ix)
   85A4 95            [ 4] 1335 	sub	a, l
   85A5 DD 7E FF      [19] 1336 	ld	a,-1 (ix)
   85A8 9C            [ 4] 1337 	sbc	a, h
   85A9 E2 AE 85      [10] 1338 	jp	PO, 00280$
   85AC EE 80         [ 7] 1339 	xor	a, #0x80
   85AE                    1340 00280$:
   85AE FA C1 85      [10] 1341 	jp	M,00140$
   85B1 23            [ 6] 1342 	inc	hl
   85B2 23            [ 6] 1343 	inc	hl
   85B3 23            [ 6] 1344 	inc	hl
   85B4 23            [ 6] 1345 	inc	hl
   85B5 7D            [ 4] 1346 	ld	a,l
   85B6 93            [ 4] 1347 	sub	a, e
   85B7 7C            [ 4] 1348 	ld	a,h
   85B8 9A            [ 4] 1349 	sbc	a, d
   85B9 E2 BE 85      [10] 1350 	jp	PO, 00281$
   85BC EE 80         [ 7] 1351 	xor	a, #0x80
   85BE                    1352 00281$:
   85BE F2 C7 85      [10] 1353 	jp	P,00141$
   85C1                    1354 00140$:
                           1355 ;src/main.c:284: colisiona = 0;
   85C1 DD 36 F7 00   [19] 1356 	ld	-9 (ix),#0x00
   85C5 18 4B         [12] 1357 	jr	00149$
   85C7                    1358 00141$:
                           1359 ;src/main.c:287: if(enemy->y>cu.y){
   85C7 DD 6E F8      [19] 1360 	ld	l,-8 (ix)
   85CA DD 66 F9      [19] 1361 	ld	h,-7 (ix)
   85CD 5E            [ 7] 1362 	ld	e,(hl)
   85CE 21 AA 77      [10] 1363 	ld	hl, #(_cu + 0x0001) + 0
   85D1 6E            [ 7] 1364 	ld	l,(hl)
   85D2 7D            [ 4] 1365 	ld	a,l
   85D3 93            [ 4] 1366 	sub	a, e
   85D4 30 2E         [12] 1367 	jr	NC,00138$
                           1368 ;src/main.c:288: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   85D6 16 00         [ 7] 1369 	ld	d,#0x00
   85D8 26 00         [ 7] 1370 	ld	h,#0x00
   85DA D5            [11] 1371 	push	de
   85DB 11 08 00      [10] 1372 	ld	de,#0x0008
   85DE 19            [11] 1373 	add	hl, de
   85DF D1            [10] 1374 	pop	de
   85E0 7B            [ 4] 1375 	ld	a,e
   85E1 95            [ 4] 1376 	sub	a, l
   85E2 5F            [ 4] 1377 	ld	e,a
   85E3 7A            [ 4] 1378 	ld	a,d
   85E4 9C            [ 4] 1379 	sbc	a, h
   85E5 57            [ 4] 1380 	ld	d,a
   85E6 3E 02         [ 7] 1381 	ld	a,#0x02
   85E8 BB            [ 4] 1382 	cp	a, e
   85E9 3E 00         [ 7] 1383 	ld	a,#0x00
   85EB 9A            [ 4] 1384 	sbc	a, d
   85EC E2 F1 85      [10] 1385 	jp	PO, 00282$
   85EF EE 80         [ 7] 1386 	xor	a, #0x80
   85F1                    1387 00282$:
   85F1 F2 FA 85      [10] 1388 	jp	P,00135$
                           1389 ;src/main.c:289: colisiona = 0;
   85F4 DD 36 F7 00   [19] 1390 	ld	-9 (ix),#0x00
   85F8 18 18         [12] 1391 	jr	00149$
   85FA                    1392 00135$:
                           1393 ;src/main.c:292: enemy->muerto = SI;
   85FA DD 6E FA      [19] 1394 	ld	l,-6 (ix)
   85FD DD 66 FB      [19] 1395 	ld	h,-5 (ix)
   8600 36 01         [10] 1396 	ld	(hl),#0x01
   8602 18 0E         [12] 1397 	jr	00149$
   8604                    1398 00138$:
                           1399 ;src/main.c:296: colisiona = 0;
   8604 DD 36 F7 00   [19] 1400 	ld	-9 (ix),#0x00
   8608 18 08         [12] 1401 	jr	00149$
   860A                    1402 00145$:
                           1403 ;src/main.c:302: enemy->mira = M_abajo;
   860A DD 6E FC      [19] 1404 	ld	l,-4 (ix)
   860D DD 66 FD      [19] 1405 	ld	h,-3 (ix)
   8610 36 03         [10] 1406 	ld	(hl),#0x03
                           1407 ;src/main.c:305: case 3:
   8612                    1408 00149$:
                           1409 ;src/main.c:308: if( *getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   8612 DD 6E F8      [19] 1410 	ld	l,-8 (ix)
   8615 DD 66 F9      [19] 1411 	ld	h,-7 (ix)
   8618 7E            [ 7] 1412 	ld	a,(hl)
   8619 C6 18         [ 7] 1413 	add	a, #0x18
   861B 57            [ 4] 1414 	ld	d,a
   861C 0A            [ 7] 1415 	ld	a,(bc)
   861D C5            [11] 1416 	push	bc
   861E D5            [11] 1417 	push	de
   861F 33            [ 6] 1418 	inc	sp
   8620 F5            [11] 1419 	push	af
   8621 33            [ 6] 1420 	inc	sp
   8622 CD E9 7F      [17] 1421 	call	_getTilePtr
   8625 F1            [10] 1422 	pop	af
   8626 C1            [10] 1423 	pop	bc
   8627 5E            [ 7] 1424 	ld	e,(hl)
   8628 3E 02         [ 7] 1425 	ld	a,#0x02
   862A 93            [ 4] 1426 	sub	a, e
   862B DA E4 86      [10] 1427 	jp	C,00161$
                           1428 ;src/main.c:309: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   862E DD 6E F8      [19] 1429 	ld	l,-8 (ix)
   8631 DD 66 F9      [19] 1430 	ld	h,-7 (ix)
   8634 7E            [ 7] 1431 	ld	a,(hl)
   8635 C6 18         [ 7] 1432 	add	a, #0x18
   8637 57            [ 4] 1433 	ld	d,a
   8638 0A            [ 7] 1434 	ld	a,(bc)
   8639 C6 02         [ 7] 1435 	add	a, #0x02
   863B C5            [11] 1436 	push	bc
   863C D5            [11] 1437 	push	de
   863D 33            [ 6] 1438 	inc	sp
   863E F5            [11] 1439 	push	af
   863F 33            [ 6] 1440 	inc	sp
   8640 CD E9 7F      [17] 1441 	call	_getTilePtr
   8643 F1            [10] 1442 	pop	af
   8644 C1            [10] 1443 	pop	bc
   8645 5E            [ 7] 1444 	ld	e,(hl)
   8646 3E 02         [ 7] 1445 	ld	a,#0x02
   8648 93            [ 4] 1446 	sub	a, e
   8649 DA E4 86      [10] 1447 	jp	C,00161$
                           1448 ;src/main.c:310: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   864C DD 6E F8      [19] 1449 	ld	l,-8 (ix)
   864F DD 66 F9      [19] 1450 	ld	h,-7 (ix)
   8652 7E            [ 7] 1451 	ld	a,(hl)
   8653 C6 18         [ 7] 1452 	add	a, #0x18
   8655 57            [ 4] 1453 	ld	d,a
   8656 0A            [ 7] 1454 	ld	a,(bc)
   8657 C6 04         [ 7] 1455 	add	a, #0x04
   8659 C5            [11] 1456 	push	bc
   865A D5            [11] 1457 	push	de
   865B 33            [ 6] 1458 	inc	sp
   865C F5            [11] 1459 	push	af
   865D 33            [ 6] 1460 	inc	sp
   865E CD E9 7F      [17] 1461 	call	_getTilePtr
   8661 F1            [10] 1462 	pop	af
   8662 C1            [10] 1463 	pop	bc
   8663 5E            [ 7] 1464 	ld	e,(hl)
   8664 3E 02         [ 7] 1465 	ld	a,#0x02
   8666 93            [ 4] 1466 	sub	a, e
   8667 38 7B         [12] 1467 	jr	C,00161$
                           1468 ;src/main.c:312: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   8669 21 A9 77      [10] 1469 	ld	hl, #_cu + 0
   866C 5E            [ 7] 1470 	ld	e,(hl)
   866D 16 00         [ 7] 1471 	ld	d,#0x00
   866F 21 02 00      [10] 1472 	ld	hl,#0x0002
   8672 19            [11] 1473 	add	hl,de
   8673 DD 75 FE      [19] 1474 	ld	-2 (ix),l
   8676 DD 74 FF      [19] 1475 	ld	-1 (ix),h
   8679 0A            [ 7] 1476 	ld	a,(bc)
   867A 4F            [ 4] 1477 	ld	c,a
   867B 06 00         [ 7] 1478 	ld	b,#0x00
   867D DD 7E FE      [19] 1479 	ld	a,-2 (ix)
   8680 91            [ 4] 1480 	sub	a, c
   8681 DD 7E FF      [19] 1481 	ld	a,-1 (ix)
   8684 98            [ 4] 1482 	sbc	a, b
   8685 E2 8A 86      [10] 1483 	jp	PO, 00283$
   8688 EE 80         [ 7] 1484 	xor	a, #0x80
   868A                    1485 00283$:
   868A FA 9D 86      [10] 1486 	jp	M,00156$
   868D 03            [ 6] 1487 	inc	bc
   868E 03            [ 6] 1488 	inc	bc
   868F 03            [ 6] 1489 	inc	bc
   8690 03            [ 6] 1490 	inc	bc
   8691 79            [ 4] 1491 	ld	a,c
   8692 93            [ 4] 1492 	sub	a, e
   8693 78            [ 4] 1493 	ld	a,b
   8694 9A            [ 4] 1494 	sbc	a, d
   8695 E2 9A 86      [10] 1495 	jp	PO, 00284$
   8698 EE 80         [ 7] 1496 	xor	a, #0x80
   869A                    1497 00284$:
   869A F2 A3 86      [10] 1498 	jp	P,00157$
   869D                    1499 00156$:
                           1500 ;src/main.c:313: colisiona = 0;
   869D DD 36 F7 00   [19] 1501 	ld	-9 (ix),#0x00
   86A1 18 49         [12] 1502 	jr	00165$
   86A3                    1503 00157$:
                           1504 ;src/main.c:316: if(cu.y > enemy->y){ //si el cu esta abajo
   86A3 21 AA 77      [10] 1505 	ld	hl, #(_cu + 0x0001) + 0
   86A6 4E            [ 7] 1506 	ld	c,(hl)
   86A7 DD 6E F8      [19] 1507 	ld	l,-8 (ix)
   86AA DD 66 F9      [19] 1508 	ld	h,-7 (ix)
   86AD 5E            [ 7] 1509 	ld	e,(hl)
   86AE 7B            [ 4] 1510 	ld	a,e
   86AF 91            [ 4] 1511 	sub	a, c
   86B0 30 2C         [12] 1512 	jr	NC,00154$
                           1513 ;src/main.c:317: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   86B2 06 00         [ 7] 1514 	ld	b,#0x00
   86B4 16 00         [ 7] 1515 	ld	d,#0x00
   86B6 21 16 00      [10] 1516 	ld	hl,#0x0016
   86B9 19            [11] 1517 	add	hl,de
   86BA 79            [ 4] 1518 	ld	a,c
   86BB 95            [ 4] 1519 	sub	a, l
   86BC 4F            [ 4] 1520 	ld	c,a
   86BD 78            [ 4] 1521 	ld	a,b
   86BE 9C            [ 4] 1522 	sbc	a, h
   86BF 47            [ 4] 1523 	ld	b,a
   86C0 3E 02         [ 7] 1524 	ld	a,#0x02
   86C2 B9            [ 4] 1525 	cp	a, c
   86C3 3E 00         [ 7] 1526 	ld	a,#0x00
   86C5 98            [ 4] 1527 	sbc	a, b
   86C6 E2 CB 86      [10] 1528 	jp	PO, 00285$
   86C9 EE 80         [ 7] 1529 	xor	a, #0x80
   86CB                    1530 00285$:
   86CB F2 D4 86      [10] 1531 	jp	P,00151$
                           1532 ;src/main.c:318: colisiona = 0;
   86CE DD 36 F7 00   [19] 1533 	ld	-9 (ix),#0x00
   86D2 18 18         [12] 1534 	jr	00165$
   86D4                    1535 00151$:
                           1536 ;src/main.c:321: enemy->muerto = SI;
   86D4 DD 6E FA      [19] 1537 	ld	l,-6 (ix)
   86D7 DD 66 FB      [19] 1538 	ld	h,-5 (ix)
   86DA 36 01         [10] 1539 	ld	(hl),#0x01
   86DC 18 0E         [12] 1540 	jr	00165$
   86DE                    1541 00154$:
                           1542 ;src/main.c:325: colisiona = 0;
   86DE DD 36 F7 00   [19] 1543 	ld	-9 (ix),#0x00
   86E2 18 08         [12] 1544 	jr	00165$
   86E4                    1545 00161$:
                           1546 ;src/main.c:329: enemy->mira = M_arriba;
   86E4 DD 6E FC      [19] 1547 	ld	l,-4 (ix)
   86E7 DD 66 FD      [19] 1548 	ld	h,-3 (ix)
   86EA 36 02         [10] 1549 	ld	(hl),#0x02
                           1550 ;src/main.c:332: }
   86EC                    1551 00165$:
                           1552 ;src/main.c:333: return colisiona;
   86EC DD 6E F7      [19] 1553 	ld	l,-9 (ix)
   86EF DD F9         [10] 1554 	ld	sp, ix
   86F1 DD E1         [14] 1555 	pop	ix
   86F3 C9            [10] 1556 	ret
                           1557 ;src/main.c:336: void moverEnemigoArriba(TEnemy *enemy){
                           1558 ;	---------------------------------
                           1559 ; Function moverEnemigoArriba
                           1560 ; ---------------------------------
   86F4                    1561 _moverEnemigoArriba::
   86F4 DD E5         [15] 1562 	push	ix
   86F6 DD 21 00 00   [14] 1563 	ld	ix,#0
   86FA DD 39         [15] 1564 	add	ix,sp
                           1565 ;src/main.c:337: enemy->y--;
   86FC DD 4E 04      [19] 1566 	ld	c,4 (ix)
   86FF DD 46 05      [19] 1567 	ld	b,5 (ix)
   8702 69            [ 4] 1568 	ld	l, c
   8703 60            [ 4] 1569 	ld	h, b
   8704 23            [ 6] 1570 	inc	hl
   8705 5E            [ 7] 1571 	ld	e,(hl)
   8706 1D            [ 4] 1572 	dec	e
   8707 73            [ 7] 1573 	ld	(hl),e
                           1574 ;src/main.c:338: enemy->y--;
   8708 1D            [ 4] 1575 	dec	e
   8709 73            [ 7] 1576 	ld	(hl),e
                           1577 ;src/main.c:339: enemy->mover = SI;
   870A 21 06 00      [10] 1578 	ld	hl,#0x0006
   870D 09            [11] 1579 	add	hl,bc
   870E 36 01         [10] 1580 	ld	(hl),#0x01
   8710 DD E1         [14] 1581 	pop	ix
   8712 C9            [10] 1582 	ret
                           1583 ;src/main.c:342: void moverEnemigoAbajo(TEnemy *enemy){
                           1584 ;	---------------------------------
                           1585 ; Function moverEnemigoAbajo
                           1586 ; ---------------------------------
   8713                    1587 _moverEnemigoAbajo::
   8713 DD E5         [15] 1588 	push	ix
   8715 DD 21 00 00   [14] 1589 	ld	ix,#0
   8719 DD 39         [15] 1590 	add	ix,sp
                           1591 ;src/main.c:343: enemy->y++;
   871B DD 4E 04      [19] 1592 	ld	c,4 (ix)
   871E DD 46 05      [19] 1593 	ld	b,5 (ix)
   8721 59            [ 4] 1594 	ld	e, c
   8722 50            [ 4] 1595 	ld	d, b
   8723 13            [ 6] 1596 	inc	de
   8724 1A            [ 7] 1597 	ld	a,(de)
   8725 3C            [ 4] 1598 	inc	a
   8726 12            [ 7] 1599 	ld	(de),a
                           1600 ;src/main.c:344: enemy->y++;
   8727 3C            [ 4] 1601 	inc	a
   8728 12            [ 7] 1602 	ld	(de),a
                           1603 ;src/main.c:345: enemy->mover = SI;
   8729 21 06 00      [10] 1604 	ld	hl,#0x0006
   872C 09            [11] 1605 	add	hl,bc
   872D 36 01         [10] 1606 	ld	(hl),#0x01
   872F DD E1         [14] 1607 	pop	ix
   8731 C9            [10] 1608 	ret
                           1609 ;src/main.c:348: void moverEnemigoDerecha(TEnemy *enemy){
                           1610 ;	---------------------------------
                           1611 ; Function moverEnemigoDerecha
                           1612 ; ---------------------------------
   8732                    1613 _moverEnemigoDerecha::
                           1614 ;src/main.c:349: enemy->x++;
   8732 D1            [10] 1615 	pop	de
   8733 C1            [10] 1616 	pop	bc
   8734 C5            [11] 1617 	push	bc
   8735 D5            [11] 1618 	push	de
   8736 0A            [ 7] 1619 	ld	a,(bc)
   8737 3C            [ 4] 1620 	inc	a
   8738 02            [ 7] 1621 	ld	(bc),a
                           1622 ;src/main.c:350: enemy->x++;
   8739 3C            [ 4] 1623 	inc	a
   873A 02            [ 7] 1624 	ld	(bc),a
                           1625 ;src/main.c:351: enemy->mover = SI;
   873B 21 06 00      [10] 1626 	ld	hl,#0x0006
   873E 09            [11] 1627 	add	hl,bc
   873F 36 01         [10] 1628 	ld	(hl),#0x01
   8741 C9            [10] 1629 	ret
                           1630 ;src/main.c:354: void moverEnemigoIzquierda(TEnemy *enemy){
                           1631 ;	---------------------------------
                           1632 ; Function moverEnemigoIzquierda
                           1633 ; ---------------------------------
   8742                    1634 _moverEnemigoIzquierda::
                           1635 ;src/main.c:355: enemy->x--;
   8742 D1            [10] 1636 	pop	de
   8743 C1            [10] 1637 	pop	bc
   8744 C5            [11] 1638 	push	bc
   8745 D5            [11] 1639 	push	de
   8746 0A            [ 7] 1640 	ld	a,(bc)
   8747 C6 FF         [ 7] 1641 	add	a,#0xFF
   8749 02            [ 7] 1642 	ld	(bc),a
                           1643 ;src/main.c:356: enemy->x--;
   874A C6 FF         [ 7] 1644 	add	a,#0xFF
   874C 02            [ 7] 1645 	ld	(bc),a
                           1646 ;src/main.c:357: enemy->mover = SI;
   874D 21 06 00      [10] 1647 	ld	hl,#0x0006
   8750 09            [11] 1648 	add	hl,bc
   8751 36 01         [10] 1649 	ld	(hl),#0x01
   8753 C9            [10] 1650 	ret
                           1651 ;src/main.c:360: void moverEnemigo(TEnemy *enemy){
                           1652 ;	---------------------------------
                           1653 ; Function moverEnemigo
                           1654 ; ---------------------------------
   8754                    1655 _moverEnemigo::
   8754 DD E5         [15] 1656 	push	ix
   8756 DD 21 00 00   [14] 1657 	ld	ix,#0
   875A DD 39         [15] 1658 	add	ix,sp
   875C F5            [11] 1659 	push	af
                           1660 ;src/main.c:363: if(!enemy->muerto){
   875D DD 4E 04      [19] 1661 	ld	c,4 (ix)
   8760 DD 46 05      [19] 1662 	ld	b,5 (ix)
   8763 C5            [11] 1663 	push	bc
   8764 FD E1         [14] 1664 	pop	iy
   8766 FD 7E 08      [19] 1665 	ld	a,8 (iy)
   8769 B7            [ 4] 1666 	or	a, a
   876A 20 64         [12] 1667 	jr	NZ,00106$
                           1668 ;src/main.c:365: if(iter < enemy->longitud_camino - 8){
   876C 21 39 01      [10] 1669 	ld	hl,#0x0139
   876F 09            [11] 1670 	add	hl,bc
   8770 EB            [ 4] 1671 	ex	de,hl
   8771 1A            [ 7] 1672 	ld	a,(de)
   8772 6F            [ 4] 1673 	ld	l,a
   8773 26 00         [ 7] 1674 	ld	h,#0x00
   8775 7D            [ 4] 1675 	ld	a,l
   8776 C6 F8         [ 7] 1676 	add	a,#0xF8
   8778 DD 77 FE      [19] 1677 	ld	-2 (ix),a
   877B 7C            [ 4] 1678 	ld	a,h
   877C CE FF         [ 7] 1679 	adc	a,#0xFF
   877E DD 77 FF      [19] 1680 	ld	-1 (ix),a
   8781 3A B3 77      [13] 1681 	ld	a,(#_iter + 0)
   8784 26 00         [ 7] 1682 	ld	h, #0x00
   8786 DD 96 FE      [19] 1683 	sub	a, -2 (ix)
   8789 7C            [ 4] 1684 	ld	a,h
   878A DD 9E FF      [19] 1685 	sbc	a, -1 (ix)
   878D E2 92 87      [10] 1686 	jp	PO, 00116$
   8790 EE 80         [ 7] 1687 	xor	a, #0x80
   8792                    1688 00116$:
   8792 F2 C9 87      [10] 1689 	jp	P,00102$
                           1690 ;src/main.c:366: enemy->x = enemy->camino[iter];
   8795 21 0D 00      [10] 1691 	ld	hl,#0x000D
   8798 09            [11] 1692 	add	hl,bc
   8799 EB            [ 4] 1693 	ex	de,hl
   879A FD 21 B3 77   [14] 1694 	ld	iy,#_iter
   879E FD 6E 00      [19] 1695 	ld	l,0 (iy)
   87A1 26 00         [ 7] 1696 	ld	h,#0x00
   87A3 19            [11] 1697 	add	hl,de
   87A4 7E            [ 7] 1698 	ld	a,(hl)
   87A5 02            [ 7] 1699 	ld	(bc),a
                           1700 ;src/main.c:367: iter++;
   87A6 21 B3 77      [10] 1701 	ld	hl, #_iter+0
   87A9 34            [11] 1702 	inc	(hl)
                           1703 ;src/main.c:368: enemy->y = enemy->camino[iter];
   87AA 21 01 00      [10] 1704 	ld	hl,#0x0001
   87AD 09            [11] 1705 	add	hl,bc
   87AE E3            [19] 1706 	ex	(sp), hl
   87AF FD 21 B3 77   [14] 1707 	ld	iy,#_iter
   87B3 FD 6E 00      [19] 1708 	ld	l,0 (iy)
   87B6 26 00         [ 7] 1709 	ld	h,#0x00
   87B8 19            [11] 1710 	add	hl,de
   87B9 5E            [ 7] 1711 	ld	e,(hl)
   87BA E1            [10] 1712 	pop	hl
   87BB E5            [11] 1713 	push	hl
   87BC 73            [ 7] 1714 	ld	(hl),e
                           1715 ;src/main.c:369: iter++;
   87BD 21 B3 77      [10] 1716 	ld	hl, #_iter+0
   87C0 34            [11] 1717 	inc	(hl)
                           1718 ;src/main.c:370: enemy->mover = SI;
   87C1 21 06 00      [10] 1719 	ld	hl,#0x0006
   87C4 09            [11] 1720 	add	hl,bc
   87C5 36 01         [10] 1721 	ld	(hl),#0x01
   87C7 18 07         [12] 1722 	jr	00106$
   87C9                    1723 00102$:
                           1724 ;src/main.c:373: iter = 0;
   87C9 21 B3 77      [10] 1725 	ld	hl,#_iter + 0
   87CC 36 00         [10] 1726 	ld	(hl), #0x00
                           1727 ;src/main.c:374: enemy->longitud_camino = 0;
   87CE AF            [ 4] 1728 	xor	a, a
   87CF 12            [ 7] 1729 	ld	(de),a
   87D0                    1730 00106$:
   87D0 DD F9         [10] 1731 	ld	sp, ix
   87D2 DD E1         [14] 1732 	pop	ix
   87D4 C9            [10] 1733 	ret
                           1734 ;src/main.c:380: void avanzarMapa() {
                           1735 ;	---------------------------------
                           1736 ; Function avanzarMapa
                           1737 ; ---------------------------------
   87D5                    1738 _avanzarMapa::
                           1739 ;src/main.c:381: if(num_mapa < NUM_MAPAS -1) {
   87D5 3A B6 77      [13] 1740 	ld	a,(#_num_mapa + 0)
   87D8 D6 02         [ 7] 1741 	sub	a, #0x02
   87DA D2 9E 7F      [10] 1742 	jp	NC,_menuFin
                           1743 ;src/main.c:382: mapa = mapas[++num_mapa];
   87DD 21 B6 77      [10] 1744 	ld	hl, #_num_mapa+0
   87E0 34            [11] 1745 	inc	(hl)
   87E1 FD 21 B6 77   [14] 1746 	ld	iy,#_num_mapa
   87E5 FD 6E 00      [19] 1747 	ld	l,0 (iy)
   87E8 26 00         [ 7] 1748 	ld	h,#0x00
   87EA 29            [11] 1749 	add	hl, hl
   87EB 11 F4 7E      [10] 1750 	ld	de,#_mapas
   87EE 19            [11] 1751 	add	hl,de
   87EF 7E            [ 7] 1752 	ld	a,(hl)
   87F0 FD 21 B4 77   [14] 1753 	ld	iy,#_mapa
   87F4 FD 77 00      [19] 1754 	ld	0 (iy),a
   87F7 23            [ 6] 1755 	inc	hl
   87F8 7E            [ 7] 1756 	ld	a,(hl)
   87F9 32 B5 77      [13] 1757 	ld	(#_mapa + 1),a
                           1758 ;src/main.c:383: prota.x = prota.px = 2;
   87FC 21 A3 77      [10] 1759 	ld	hl,#(_prota + 0x0002)
   87FF 36 02         [10] 1760 	ld	(hl),#0x02
   8801 21 A1 77      [10] 1761 	ld	hl,#_prota
   8804 36 02         [10] 1762 	ld	(hl),#0x02
                           1763 ;src/main.c:384: prota.mover = SI;
   8806 21 A7 77      [10] 1764 	ld	hl,#(_prota + 0x0006)
   8809 36 01         [10] 1765 	ld	(hl),#0x01
                           1766 ;src/main.c:385: dibujarMapa();
   880B CD DE 7E      [17] 1767 	call	_dibujarMapa
                           1768 ;src/main.c:386: inicializarEnemy();
   880E C3 F5 8D      [10] 1769 	jp  _inicializarEnemy
                           1770 ;src/main.c:390: menuFin();
   8811 C3 9E 7F      [10] 1771 	jp  _menuFin
                           1772 ;src/main.c:394: void moverIzquierda() {
                           1773 ;	---------------------------------
                           1774 ; Function moverIzquierda
                           1775 ; ---------------------------------
   8814                    1776 _moverIzquierda::
                           1777 ;src/main.c:395: prota.mira = M_izquierda;
   8814 01 A1 77      [10] 1778 	ld	bc,#_prota+0
   8817 21 A8 77      [10] 1779 	ld	hl,#(_prota + 0x0007)
   881A 36 01         [10] 1780 	ld	(hl),#0x01
                           1781 ;src/main.c:396: if (!checkCollision(M_izquierda)) {
   881C C5            [11] 1782 	push	bc
   881D 21 01 00      [10] 1783 	ld	hl,#0x0001
   8820 E5            [11] 1784 	push	hl
   8821 CD 2A 80      [17] 1785 	call	_checkCollision
   8824 F1            [10] 1786 	pop	af
   8825 C1            [10] 1787 	pop	bc
   8826 7D            [ 4] 1788 	ld	a,l
   8827 B7            [ 4] 1789 	or	a, a
   8828 C0            [11] 1790 	ret	NZ
                           1791 ;src/main.c:397: prota.x--;
   8829 0A            [ 7] 1792 	ld	a,(bc)
   882A C6 FF         [ 7] 1793 	add	a,#0xFF
   882C 02            [ 7] 1794 	ld	(bc),a
                           1795 ;src/main.c:398: prota.mover = SI;
   882D 21 A7 77      [10] 1796 	ld	hl,#(_prota + 0x0006)
   8830 36 01         [10] 1797 	ld	(hl),#0x01
                           1798 ;src/main.c:399: prota.sprite = g_hero_left;
   8832 21 FE 59      [10] 1799 	ld	hl,#_g_hero_left
   8835 22 A5 77      [16] 1800 	ld	((_prota + 0x0004)), hl
   8838 C9            [10] 1801 	ret
                           1802 ;src/main.c:403: void moverDerecha() {
                           1803 ;	---------------------------------
                           1804 ; Function moverDerecha
                           1805 ; ---------------------------------
   8839                    1806 _moverDerecha::
                           1807 ;src/main.c:404: prota.mira = M_derecha;
   8839 21 A8 77      [10] 1808 	ld	hl,#(_prota + 0x0007)
   883C 36 00         [10] 1809 	ld	(hl),#0x00
                           1810 ;src/main.c:405: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   883E 21 00 00      [10] 1811 	ld	hl,#0x0000
   8841 E5            [11] 1812 	push	hl
   8842 CD 2A 80      [17] 1813 	call	_checkCollision
   8845 F1            [10] 1814 	pop	af
   8846 45            [ 4] 1815 	ld	b,l
   8847 21 A1 77      [10] 1816 	ld	hl, #_prota + 0
   884A 4E            [ 7] 1817 	ld	c,(hl)
   884B 59            [ 4] 1818 	ld	e,c
   884C 16 00         [ 7] 1819 	ld	d,#0x00
   884E 21 07 00      [10] 1820 	ld	hl,#0x0007
   8851 19            [11] 1821 	add	hl,de
   8852 11 50 80      [10] 1822 	ld	de, #0x8050
   8855 29            [11] 1823 	add	hl, hl
   8856 3F            [ 4] 1824 	ccf
   8857 CB 1C         [ 8] 1825 	rr	h
   8859 CB 1D         [ 8] 1826 	rr	l
   885B ED 52         [15] 1827 	sbc	hl, de
   885D 3E 00         [ 7] 1828 	ld	a,#0x00
   885F 17            [ 4] 1829 	rla
   8860 5F            [ 4] 1830 	ld	e,a
   8861 78            [ 4] 1831 	ld	a,b
   8862 B7            [ 4] 1832 	or	a,a
   8863 20 14         [12] 1833 	jr	NZ,00104$
   8865 B3            [ 4] 1834 	or	a,e
   8866 28 11         [12] 1835 	jr	Z,00104$
                           1836 ;src/main.c:406: prota.x++;
   8868 0C            [ 4] 1837 	inc	c
   8869 21 A1 77      [10] 1838 	ld	hl,#_prota
   886C 71            [ 7] 1839 	ld	(hl),c
                           1840 ;src/main.c:407: prota.mover = SI;
   886D 21 A7 77      [10] 1841 	ld	hl,#(_prota + 0x0006)
   8870 36 01         [10] 1842 	ld	(hl),#0x01
                           1843 ;src/main.c:408: prota.sprite = g_hero;
   8872 21 A8 5A      [10] 1844 	ld	hl,#_g_hero
   8875 22 A5 77      [16] 1845 	ld	((_prota + 0x0004)), hl
   8878 C9            [10] 1846 	ret
   8879                    1847 00104$:
                           1848 ;src/main.c:410: }else if( prota.x + G_HERO_W >= 80){
   8879 7B            [ 4] 1849 	ld	a,e
   887A B7            [ 4] 1850 	or	a, a
   887B C0            [11] 1851 	ret	NZ
                           1852 ;src/main.c:411: avanzarMapa();
   887C C3 D5 87      [10] 1853 	jp  _avanzarMapa
                           1854 ;src/main.c:415: void moverArriba() {
                           1855 ;	---------------------------------
                           1856 ; Function moverArriba
                           1857 ; ---------------------------------
   887F                    1858 _moverArriba::
                           1859 ;src/main.c:416: prota.mira = M_arriba;
   887F 21 A8 77      [10] 1860 	ld	hl,#(_prota + 0x0007)
   8882 36 02         [10] 1861 	ld	(hl),#0x02
                           1862 ;src/main.c:417: if (!checkCollision(M_arriba)) { // TODO: COMPROBAR
   8884 21 02 00      [10] 1863 	ld	hl,#0x0002
   8887 E5            [11] 1864 	push	hl
   8888 CD 2A 80      [17] 1865 	call	_checkCollision
   888B F1            [10] 1866 	pop	af
   888C 7D            [ 4] 1867 	ld	a,l
   888D B7            [ 4] 1868 	or	a, a
   888E C0            [11] 1869 	ret	NZ
                           1870 ;src/main.c:418: prota.y--;
   888F 21 A2 77      [10] 1871 	ld	hl,#_prota + 1
   8892 4E            [ 7] 1872 	ld	c,(hl)
   8893 0D            [ 4] 1873 	dec	c
   8894 71            [ 7] 1874 	ld	(hl),c
                           1875 ;src/main.c:419: prota.y--;
   8895 0D            [ 4] 1876 	dec	c
   8896 71            [ 7] 1877 	ld	(hl),c
                           1878 ;src/main.c:420: prota.mover  = SI;
   8897 21 A7 77      [10] 1879 	ld	hl,#(_prota + 0x0006)
   889A 36 01         [10] 1880 	ld	(hl),#0x01
                           1881 ;src/main.c:421: prota.sprite = g_hero_up;
   889C 21 64 59      [10] 1882 	ld	hl,#_g_hero_up
   889F 22 A5 77      [16] 1883 	ld	((_prota + 0x0004)), hl
   88A2 C9            [10] 1884 	ret
                           1885 ;src/main.c:425: void moverAbajo() {
                           1886 ;	---------------------------------
                           1887 ; Function moverAbajo
                           1888 ; ---------------------------------
   88A3                    1889 _moverAbajo::
                           1890 ;src/main.c:426: prota.mira = M_abajo;
   88A3 21 A8 77      [10] 1891 	ld	hl,#(_prota + 0x0007)
   88A6 36 03         [10] 1892 	ld	(hl),#0x03
                           1893 ;src/main.c:427: if (!checkCollision(M_abajo) ) { // TODO: COMPROBAR
   88A8 21 03 00      [10] 1894 	ld	hl,#0x0003
   88AB E5            [11] 1895 	push	hl
   88AC CD 2A 80      [17] 1896 	call	_checkCollision
   88AF F1            [10] 1897 	pop	af
   88B0 7D            [ 4] 1898 	ld	a,l
   88B1 B7            [ 4] 1899 	or	a, a
   88B2 C0            [11] 1900 	ret	NZ
                           1901 ;src/main.c:428: prota.y++;
   88B3 01 A2 77      [10] 1902 	ld	bc,#_prota + 1
   88B6 0A            [ 7] 1903 	ld	a,(bc)
   88B7 3C            [ 4] 1904 	inc	a
   88B8 02            [ 7] 1905 	ld	(bc),a
                           1906 ;src/main.c:429: prota.y++;
   88B9 3C            [ 4] 1907 	inc	a
   88BA 02            [ 7] 1908 	ld	(bc),a
                           1909 ;src/main.c:430: prota.mover  = SI;
   88BB 21 A7 77      [10] 1910 	ld	hl,#(_prota + 0x0006)
   88BE 36 01         [10] 1911 	ld	(hl),#0x01
                           1912 ;src/main.c:431: prota.sprite = g_hero_down;
   88C0 21 CA 58      [10] 1913 	ld	hl,#_g_hero_down
   88C3 22 A5 77      [16] 1914 	ld	((_prota + 0x0004)), hl
   88C6 C9            [10] 1915 	ret
                           1916 ;src/main.c:435: void dibujarCuchillo() {
                           1917 ;	---------------------------------
                           1918 ; Function dibujarCuchillo
                           1919 ; ---------------------------------
   88C7                    1920 _dibujarCuchillo::
   88C7 DD E5         [15] 1921 	push	ix
   88C9 DD 21 00 00   [14] 1922 	ld	ix,#0
   88CD DD 39         [15] 1923 	add	ix,sp
   88CF F5            [11] 1924 	push	af
                           1925 ;src/main.c:436: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   88D0 21 AA 77      [10] 1926 	ld	hl, #_cu + 1
   88D3 56            [ 7] 1927 	ld	d,(hl)
   88D4 21 A9 77      [10] 1928 	ld	hl, #_cu + 0
   88D7 46            [ 7] 1929 	ld	b,(hl)
   88D8 D5            [11] 1930 	push	de
   88D9 33            [ 6] 1931 	inc	sp
   88DA C5            [11] 1932 	push	bc
   88DB 33            [ 6] 1933 	inc	sp
   88DC 21 00 C0      [10] 1934 	ld	hl,#0xC000
   88DF E5            [11] 1935 	push	hl
   88E0 CD 5C 72      [17] 1936 	call	_cpct_getScreenPtr
   88E3 45            [ 4] 1937 	ld	b,l
   88E4 5C            [ 4] 1938 	ld	e,h
                           1939 ;src/main.c:437: if(cu.eje == E_X){
   88E5 21 B1 77      [10] 1940 	ld	hl, #_cu + 8
   88E8 4E            [ 7] 1941 	ld	c,(hl)
                           1942 ;src/main.c:438: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   88E9 DD 70 FE      [19] 1943 	ld	-2 (ix),b
   88EC DD 73 FF      [19] 1944 	ld	-1 (ix),e
                           1945 ;src/main.c:437: if(cu.eje == E_X){
   88EF 79            [ 4] 1946 	ld	a,c
   88F0 B7            [ 4] 1947 	or	a, a
   88F1 20 19         [12] 1948 	jr	NZ,00104$
                           1949 ;src/main.c:438: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   88F3 11 00 1E      [10] 1950 	ld	de,#_g_tablatrans+0
   88F6 ED 4B AD 77   [20] 1951 	ld	bc, (#(_cu + 0x0004) + 0)
   88FA D5            [11] 1952 	push	de
   88FB 21 04 04      [10] 1953 	ld	hl,#0x0404
   88FE E5            [11] 1954 	push	hl
   88FF DD 6E FE      [19] 1955 	ld	l,-2 (ix)
   8902 DD 66 FF      [19] 1956 	ld	h,-1 (ix)
   8905 E5            [11] 1957 	push	hl
   8906 C5            [11] 1958 	push	bc
   8907 CD 7C 72      [17] 1959 	call	_cpct_drawSpriteMaskedAlignedTable
   890A 18 1A         [12] 1960 	jr	00106$
   890C                    1961 00104$:
                           1962 ;src/main.c:441: else if(cu.eje == E_Y){
   890C 0D            [ 4] 1963 	dec	c
   890D 20 17         [12] 1964 	jr	NZ,00106$
                           1965 ;src/main.c:442: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   890F 11 00 1E      [10] 1966 	ld	de,#_g_tablatrans+0
   8912 ED 4B AD 77   [20] 1967 	ld	bc, (#(_cu + 0x0004) + 0)
   8916 D5            [11] 1968 	push	de
   8917 21 02 08      [10] 1969 	ld	hl,#0x0802
   891A E5            [11] 1970 	push	hl
   891B DD 6E FE      [19] 1971 	ld	l,-2 (ix)
   891E DD 66 FF      [19] 1972 	ld	h,-1 (ix)
   8921 E5            [11] 1973 	push	hl
   8922 C5            [11] 1974 	push	bc
   8923 CD 7C 72      [17] 1975 	call	_cpct_drawSpriteMaskedAlignedTable
   8926                    1976 00106$:
   8926 DD F9         [10] 1977 	ld	sp, ix
   8928 DD E1         [14] 1978 	pop	ix
   892A C9            [10] 1979 	ret
                           1980 ;src/main.c:446: void borrarCuchillo() {
                           1981 ;	---------------------------------
                           1982 ; Function borrarCuchillo
                           1983 ; ---------------------------------
   892B                    1984 _borrarCuchillo::
   892B DD E5         [15] 1985 	push	ix
   892D DD 21 00 00   [14] 1986 	ld	ix,#0
   8931 DD 39         [15] 1987 	add	ix,sp
   8933 F5            [11] 1988 	push	af
   8934 3B            [ 6] 1989 	dec	sp
                           1990 ;src/main.c:448: u8 w = 2 + (cu.px & 1);
   8935 21 AB 77      [10] 1991 	ld	hl, #_cu + 2
   8938 4E            [ 7] 1992 	ld	c,(hl)
   8939 79            [ 4] 1993 	ld	a,c
   893A E6 01         [ 7] 1994 	and	a, #0x01
   893C 47            [ 4] 1995 	ld	b,a
   893D 04            [ 4] 1996 	inc	b
   893E 04            [ 4] 1997 	inc	b
                           1998 ;src/main.c:449: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   893F 21 AC 77      [10] 1999 	ld	hl, #_cu + 3
   8942 5E            [ 7] 2000 	ld	e,(hl)
   8943 7B            [ 4] 2001 	ld	a,e
   8944 E6 03         [ 7] 2002 	and	a, #0x03
   8946 28 04         [12] 2003 	jr	Z,00105$
   8948 3E 01         [ 7] 2004 	ld	a,#0x01
   894A 18 02         [12] 2005 	jr	00106$
   894C                    2006 00105$:
   894C 3E 00         [ 7] 2007 	ld	a,#0x00
   894E                    2008 00106$:
   894E C6 02         [ 7] 2009 	add	a, #0x02
   8950 DD 77 FD      [19] 2010 	ld	-3 (ix),a
                           2011 ;src/main.c:450: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   8953 FD 2A B4 77   [20] 2012 	ld	iy,(_mapa)
   8957 16 00         [ 7] 2013 	ld	d,#0x00
   8959 7B            [ 4] 2014 	ld	a,e
   895A C6 E8         [ 7] 2015 	add	a,#0xE8
   895C DD 77 FE      [19] 2016 	ld	-2 (ix),a
   895F 7A            [ 4] 2017 	ld	a,d
   8960 CE FF         [ 7] 2018 	adc	a,#0xFF
   8962 DD 77 FF      [19] 2019 	ld	-1 (ix),a
   8965 DD 6E FE      [19] 2020 	ld	l,-2 (ix)
   8968 DD 66 FF      [19] 2021 	ld	h,-1 (ix)
   896B DD CB FF 7E   [20] 2022 	bit	7, -1 (ix)
   896F 28 04         [12] 2023 	jr	Z,00107$
   8971 21 EB FF      [10] 2024 	ld	hl,#0xFFEB
   8974 19            [11] 2025 	add	hl,de
   8975                    2026 00107$:
   8975 CB 2C         [ 8] 2027 	sra	h
   8977 CB 1D         [ 8] 2028 	rr	l
   8979 CB 2C         [ 8] 2029 	sra	h
   897B CB 1D         [ 8] 2030 	rr	l
   897D 55            [ 4] 2031 	ld	d,l
   897E CB 39         [ 8] 2032 	srl	c
   8980 FD E5         [15] 2033 	push	iy
   8982 21 F0 C0      [10] 2034 	ld	hl,#0xC0F0
   8985 E5            [11] 2035 	push	hl
   8986 3E 28         [ 7] 2036 	ld	a,#0x28
   8988 F5            [11] 2037 	push	af
   8989 33            [ 6] 2038 	inc	sp
   898A DD 7E FD      [19] 2039 	ld	a,-3 (ix)
   898D F5            [11] 2040 	push	af
   898E 33            [ 6] 2041 	inc	sp
   898F C5            [11] 2042 	push	bc
   8990 33            [ 6] 2043 	inc	sp
   8991 D5            [11] 2044 	push	de
   8992 33            [ 6] 2045 	inc	sp
   8993 79            [ 4] 2046 	ld	a,c
   8994 F5            [11] 2047 	push	af
   8995 33            [ 6] 2048 	inc	sp
   8996 CD FD 66      [17] 2049 	call	_cpct_etm_drawTileBox2x4
                           2050 ;src/main.c:451: if(!cu.mover){
   8999 3A B2 77      [13] 2051 	ld	a, (#_cu + 9)
   899C B7            [ 4] 2052 	or	a, a
   899D 20 05         [12] 2053 	jr	NZ,00103$
                           2054 ;src/main.c:452: cu.lanzado = NO;
   899F 21 AF 77      [10] 2055 	ld	hl,#(_cu + 0x0006)
   89A2 36 00         [10] 2056 	ld	(hl),#0x00
   89A4                    2057 00103$:
   89A4 DD F9         [10] 2058 	ld	sp, ix
   89A6 DD E1         [14] 2059 	pop	ix
   89A8 C9            [10] 2060 	ret
                           2061 ;src/main.c:456: void redibujarCuchillo( ) {
                           2062 ;	---------------------------------
                           2063 ; Function redibujarCuchillo
                           2064 ; ---------------------------------
   89A9                    2065 _redibujarCuchillo::
                           2066 ;src/main.c:457: borrarCuchillo();
   89A9 CD 2B 89      [17] 2067 	call	_borrarCuchillo
                           2068 ;src/main.c:458: cu.px = cu.x;
   89AC 01 AB 77      [10] 2069 	ld	bc,#_cu + 2
   89AF 3A A9 77      [13] 2070 	ld	a, (#_cu + 0)
   89B2 02            [ 7] 2071 	ld	(bc),a
                           2072 ;src/main.c:459: cu.py = cu.y;
   89B3 01 AC 77      [10] 2073 	ld	bc,#_cu + 3
   89B6 3A AA 77      [13] 2074 	ld	a, (#_cu + 1)
   89B9 02            [ 7] 2075 	ld	(bc),a
                           2076 ;src/main.c:460: dibujarCuchillo();
   89BA C3 C7 88      [10] 2077 	jp  _dibujarCuchillo
                           2078 ;src/main.c:463: void lanzarCuchillo(){
                           2079 ;	---------------------------------
                           2080 ; Function lanzarCuchillo
                           2081 ; ---------------------------------
   89BD                    2082 _lanzarCuchillo::
                           2083 ;src/main.c:465: if(!cu.lanzado){
   89BD 3A AF 77      [13] 2084 	ld	a, (#(_cu + 0x0006) + 0)
   89C0 B7            [ 4] 2085 	or	a, a
   89C1 C0            [11] 2086 	ret	NZ
                           2087 ;src/main.c:467: if(prota.mira == M_derecha){
   89C2 21 A8 77      [10] 2088 	ld	hl, #_prota + 7
   89C5 5E            [ 7] 2089 	ld	e,(hl)
                           2090 ;src/main.c:468: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   89C6 01 A2 77      [10] 2091 	ld	bc,#_prota + 1
                           2092 ;src/main.c:470: cu.direccion = M_derecha;
                           2093 ;src/main.c:472: cu.y=prota.y + G_HERO_H /2;
                           2094 ;src/main.c:473: cu.sprite=g_knifeX_0;
                           2095 ;src/main.c:474: cu.eje = E_X;
                           2096 ;src/main.c:467: if(prota.mira == M_derecha){
   89C9 7B            [ 4] 2097 	ld	a,e
   89CA B7            [ 4] 2098 	or	a, a
   89CB 20 41         [12] 2099 	jr	NZ,00118$
                           2100 ;src/main.c:468: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   89CD 0A            [ 7] 2101 	ld	a,(bc)
   89CE C6 0B         [ 7] 2102 	add	a, #0x0B
   89D0 5F            [ 4] 2103 	ld	e,a
   89D1 3A A1 77      [13] 2104 	ld	a, (#_prota + 0)
   89D4 C6 0C         [ 7] 2105 	add	a, #0x0C
   89D6 6F            [ 4] 2106 	ld	l,a
   89D7 C5            [11] 2107 	push	bc
   89D8 7B            [ 4] 2108 	ld	a,e
   89D9 F5            [11] 2109 	push	af
   89DA 33            [ 6] 2110 	inc	sp
   89DB 7D            [ 4] 2111 	ld	a,l
   89DC F5            [11] 2112 	push	af
   89DD 33            [ 6] 2113 	inc	sp
   89DE CD E9 7F      [17] 2114 	call	_getTilePtr
   89E1 F1            [10] 2115 	pop	af
   89E2 C1            [10] 2116 	pop	bc
   89E3 5E            [ 7] 2117 	ld	e,(hl)
   89E4 3E 02         [ 7] 2118 	ld	a,#0x02
   89E6 93            [ 4] 2119 	sub	a, e
   89E7 D8            [11] 2120 	ret	C
                           2121 ;src/main.c:469: cu.lanzado = SI;
   89E8 21 AF 77      [10] 2122 	ld	hl,#(_cu + 0x0006)
   89EB 36 01         [10] 2123 	ld	(hl),#0x01
                           2124 ;src/main.c:470: cu.direccion = M_derecha;
   89ED 21 B0 77      [10] 2125 	ld	hl,#(_cu + 0x0007)
   89F0 36 00         [10] 2126 	ld	(hl),#0x00
                           2127 ;src/main.c:471: cu.x=prota.x + G_HERO_W;
   89F2 3A A1 77      [13] 2128 	ld	a, (#_prota + 0)
   89F5 C6 07         [ 7] 2129 	add	a, #0x07
   89F7 32 A9 77      [13] 2130 	ld	(#_cu),a
                           2131 ;src/main.c:472: cu.y=prota.y + G_HERO_H /2;
   89FA 0A            [ 7] 2132 	ld	a,(bc)
   89FB C6 0B         [ 7] 2133 	add	a, #0x0B
   89FD 32 AA 77      [13] 2134 	ld	(#(_cu + 0x0001)),a
                           2135 ;src/main.c:473: cu.sprite=g_knifeX_0;
   8A00 21 C0 34      [10] 2136 	ld	hl,#_g_knifeX_0
   8A03 22 AD 77      [16] 2137 	ld	((_cu + 0x0004)), hl
                           2138 ;src/main.c:474: cu.eje = E_X;
   8A06 21 B1 77      [10] 2139 	ld	hl,#(_cu + 0x0008)
   8A09 36 00         [10] 2140 	ld	(hl),#0x00
                           2141 ;src/main.c:475: dibujarCuchillo();
   8A0B C3 C7 88      [10] 2142 	jp  _dibujarCuchillo
   8A0E                    2143 00118$:
                           2144 ;src/main.c:478: else if(prota.mira == M_izquierda){
   8A0E 7B            [ 4] 2145 	ld	a,e
   8A0F 3D            [ 4] 2146 	dec	a
   8A10 20 41         [12] 2147 	jr	NZ,00115$
                           2148 ;src/main.c:479: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   8A12 0A            [ 7] 2149 	ld	a,(bc)
   8A13 C6 0B         [ 7] 2150 	add	a, #0x0B
   8A15 5F            [ 4] 2151 	ld	e,a
   8A16 3A A1 77      [13] 2152 	ld	a, (#_prota + 0)
   8A19 C6 F6         [ 7] 2153 	add	a,#0xF6
   8A1B 6F            [ 4] 2154 	ld	l,a
   8A1C C5            [11] 2155 	push	bc
   8A1D 7B            [ 4] 2156 	ld	a,e
   8A1E F5            [11] 2157 	push	af
   8A1F 33            [ 6] 2158 	inc	sp
   8A20 7D            [ 4] 2159 	ld	a,l
   8A21 F5            [11] 2160 	push	af
   8A22 33            [ 6] 2161 	inc	sp
   8A23 CD E9 7F      [17] 2162 	call	_getTilePtr
   8A26 F1            [10] 2163 	pop	af
   8A27 C1            [10] 2164 	pop	bc
   8A28 5E            [ 7] 2165 	ld	e,(hl)
   8A29 3E 02         [ 7] 2166 	ld	a,#0x02
   8A2B 93            [ 4] 2167 	sub	a, e
   8A2C D8            [11] 2168 	ret	C
                           2169 ;src/main.c:480: cu.lanzado = SI;
   8A2D 21 AF 77      [10] 2170 	ld	hl,#(_cu + 0x0006)
   8A30 36 01         [10] 2171 	ld	(hl),#0x01
                           2172 ;src/main.c:481: cu.direccion = M_izquierda;
   8A32 21 B0 77      [10] 2173 	ld	hl,#(_cu + 0x0007)
   8A35 36 01         [10] 2174 	ld	(hl),#0x01
                           2175 ;src/main.c:482: cu.x = prota.x - G_KNIFEX_0_W;
   8A37 3A A1 77      [13] 2176 	ld	a, (#_prota + 0)
   8A3A C6 FC         [ 7] 2177 	add	a,#0xFC
   8A3C 32 A9 77      [13] 2178 	ld	(#_cu),a
                           2179 ;src/main.c:483: cu.y = prota.y + G_HERO_H /2;
   8A3F 0A            [ 7] 2180 	ld	a,(bc)
   8A40 C6 0B         [ 7] 2181 	add	a, #0x0B
   8A42 32 AA 77      [13] 2182 	ld	(#(_cu + 0x0001)),a
                           2183 ;src/main.c:484: cu.sprite = g_knifeX_1;
   8A45 21 D0 34      [10] 2184 	ld	hl,#_g_knifeX_1
   8A48 22 AD 77      [16] 2185 	ld	((_cu + 0x0004)), hl
                           2186 ;src/main.c:485: cu.eje = E_X;
   8A4B 21 B1 77      [10] 2187 	ld	hl,#(_cu + 0x0008)
   8A4E 36 00         [10] 2188 	ld	(hl),#0x00
                           2189 ;src/main.c:486: dibujarCuchillo();
   8A50 C3 C7 88      [10] 2190 	jp  _dibujarCuchillo
   8A53                    2191 00115$:
                           2192 ;src/main.c:489: else if(prota.mira == M_abajo){
   8A53 7B            [ 4] 2193 	ld	a,e
   8A54 D6 03         [ 7] 2194 	sub	a, #0x03
   8A56 20 41         [12] 2195 	jr	NZ,00112$
                           2196 ;src/main.c:491: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   8A58 0A            [ 7] 2197 	ld	a,(bc)
   8A59 C6 1F         [ 7] 2198 	add	a, #0x1F
   8A5B 5F            [ 4] 2199 	ld	e,a
   8A5C 3A A1 77      [13] 2200 	ld	a, (#_prota + 0)
   8A5F 57            [ 4] 2201 	ld	d,a
   8A60 14            [ 4] 2202 	inc	d
   8A61 14            [ 4] 2203 	inc	d
   8A62 14            [ 4] 2204 	inc	d
   8A63 C5            [11] 2205 	push	bc
   8A64 7B            [ 4] 2206 	ld	a,e
   8A65 F5            [11] 2207 	push	af
   8A66 33            [ 6] 2208 	inc	sp
   8A67 D5            [11] 2209 	push	de
   8A68 33            [ 6] 2210 	inc	sp
   8A69 CD E9 7F      [17] 2211 	call	_getTilePtr
   8A6C F1            [10] 2212 	pop	af
   8A6D C1            [10] 2213 	pop	bc
   8A6E 5E            [ 7] 2214 	ld	e,(hl)
   8A6F 3E 02         [ 7] 2215 	ld	a,#0x02
   8A71 93            [ 4] 2216 	sub	a, e
   8A72 D8            [11] 2217 	ret	C
                           2218 ;src/main.c:492: cu.lanzado = SI;
   8A73 21 AF 77      [10] 2219 	ld	hl,#(_cu + 0x0006)
   8A76 36 01         [10] 2220 	ld	(hl),#0x01
                           2221 ;src/main.c:493: cu.direccion = M_abajo;
   8A78 21 B0 77      [10] 2222 	ld	hl,#(_cu + 0x0007)
   8A7B 36 03         [10] 2223 	ld	(hl),#0x03
                           2224 ;src/main.c:494: cu.x = prota.x + G_HERO_W / 2;
   8A7D 3A A1 77      [13] 2225 	ld	a, (#_prota + 0)
   8A80 C6 03         [ 7] 2226 	add	a, #0x03
   8A82 32 A9 77      [13] 2227 	ld	(#_cu),a
                           2228 ;src/main.c:495: cu.y = prota.y + G_HERO_H;
   8A85 0A            [ 7] 2229 	ld	a,(bc)
   8A86 C6 16         [ 7] 2230 	add	a, #0x16
   8A88 32 AA 77      [13] 2231 	ld	(#(_cu + 0x0001)),a
                           2232 ;src/main.c:496: cu.sprite = g_knifeY_0;
   8A8B 21 A0 34      [10] 2233 	ld	hl,#_g_knifeY_0
   8A8E 22 AD 77      [16] 2234 	ld	((_cu + 0x0004)), hl
                           2235 ;src/main.c:497: cu.eje = E_Y;
   8A91 21 B1 77      [10] 2236 	ld	hl,#(_cu + 0x0008)
   8A94 36 01         [10] 2237 	ld	(hl),#0x01
                           2238 ;src/main.c:498: dibujarCuchillo();
   8A96 C3 C7 88      [10] 2239 	jp  _dibujarCuchillo
   8A99                    2240 00112$:
                           2241 ;src/main.c:501: else if(prota.mira == M_arriba){
   8A99 7B            [ 4] 2242 	ld	a,e
   8A9A D6 02         [ 7] 2243 	sub	a, #0x02
   8A9C C0            [11] 2244 	ret	NZ
                           2245 ;src/main.c:502: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   8A9D 0A            [ 7] 2246 	ld	a,(bc)
   8A9E C6 F7         [ 7] 2247 	add	a,#0xF7
   8AA0 57            [ 4] 2248 	ld	d,a
   8AA1 3A A1 77      [13] 2249 	ld	a, (#_prota + 0)
   8AA4 C6 03         [ 7] 2250 	add	a, #0x03
   8AA6 C5            [11] 2251 	push	bc
   8AA7 D5            [11] 2252 	push	de
   8AA8 33            [ 6] 2253 	inc	sp
   8AA9 F5            [11] 2254 	push	af
   8AAA 33            [ 6] 2255 	inc	sp
   8AAB CD E9 7F      [17] 2256 	call	_getTilePtr
   8AAE F1            [10] 2257 	pop	af
   8AAF C1            [10] 2258 	pop	bc
   8AB0 5E            [ 7] 2259 	ld	e,(hl)
   8AB1 3E 02         [ 7] 2260 	ld	a,#0x02
   8AB3 93            [ 4] 2261 	sub	a, e
   8AB4 D8            [11] 2262 	ret	C
                           2263 ;src/main.c:503: cu.lanzado = SI;
   8AB5 21 AF 77      [10] 2264 	ld	hl,#(_cu + 0x0006)
   8AB8 36 01         [10] 2265 	ld	(hl),#0x01
                           2266 ;src/main.c:504: cu.direccion = M_arriba;
   8ABA 21 B0 77      [10] 2267 	ld	hl,#(_cu + 0x0007)
   8ABD 36 02         [10] 2268 	ld	(hl),#0x02
                           2269 ;src/main.c:505: cu.x = prota.x + G_HERO_W / 2;
   8ABF 3A A1 77      [13] 2270 	ld	a, (#_prota + 0)
   8AC2 C6 03         [ 7] 2271 	add	a, #0x03
   8AC4 32 A9 77      [13] 2272 	ld	(#_cu),a
                           2273 ;src/main.c:506: cu.y = prota.y;
   8AC7 0A            [ 7] 2274 	ld	a,(bc)
   8AC8 32 AA 77      [13] 2275 	ld	(#(_cu + 0x0001)),a
                           2276 ;src/main.c:507: cu.sprite = g_knifeY_1;
   8ACB 21 B0 34      [10] 2277 	ld	hl,#_g_knifeY_1
   8ACE 22 AD 77      [16] 2278 	ld	((_cu + 0x0004)), hl
                           2279 ;src/main.c:508: cu.eje = E_Y;
   8AD1 21 B1 77      [10] 2280 	ld	hl,#(_cu + 0x0008)
   8AD4 36 01         [10] 2281 	ld	(hl),#0x01
                           2282 ;src/main.c:509: dibujarCuchillo();
   8AD6 C3 C7 88      [10] 2283 	jp  _dibujarCuchillo
                           2284 ;src/main.c:515: void comprobarTeclado() {
                           2285 ;	---------------------------------
                           2286 ; Function comprobarTeclado
                           2287 ; ---------------------------------
   8AD9                    2288 _comprobarTeclado::
                           2289 ;src/main.c:516: cpct_scanKeyboard_if();
   8AD9 CD AD 68      [17] 2290 	call	_cpct_scanKeyboard_if
                           2291 ;src/main.c:518: if (cpct_isAnyKeyPressed()) {
   8ADC CD A0 68      [17] 2292 	call	_cpct_isAnyKeyPressed
   8ADF 7D            [ 4] 2293 	ld	a,l
   8AE0 B7            [ 4] 2294 	or	a, a
   8AE1 C8            [11] 2295 	ret	Z
                           2296 ;src/main.c:519: if (cpct_isKeyPressed(Key_CursorLeft))
   8AE2 21 01 01      [10] 2297 	ld	hl,#0x0101
   8AE5 CD B2 65      [17] 2298 	call	_cpct_isKeyPressed
   8AE8 7D            [ 4] 2299 	ld	a,l
   8AE9 B7            [ 4] 2300 	or	a, a
                           2301 ;src/main.c:520: moverIzquierda();
   8AEA C2 14 88      [10] 2302 	jp	NZ,_moverIzquierda
                           2303 ;src/main.c:521: else if (cpct_isKeyPressed(Key_CursorRight))
   8AED 21 00 02      [10] 2304 	ld	hl,#0x0200
   8AF0 CD B2 65      [17] 2305 	call	_cpct_isKeyPressed
   8AF3 7D            [ 4] 2306 	ld	a,l
   8AF4 B7            [ 4] 2307 	or	a, a
                           2308 ;src/main.c:522: moverDerecha();
   8AF5 C2 39 88      [10] 2309 	jp	NZ,_moverDerecha
                           2310 ;src/main.c:523: else if (cpct_isKeyPressed(Key_CursorUp))
   8AF8 21 00 01      [10] 2311 	ld	hl,#0x0100
   8AFB CD B2 65      [17] 2312 	call	_cpct_isKeyPressed
   8AFE 7D            [ 4] 2313 	ld	a,l
   8AFF B7            [ 4] 2314 	or	a, a
                           2315 ;src/main.c:524: moverArriba();
   8B00 C2 7F 88      [10] 2316 	jp	NZ,_moverArriba
                           2317 ;src/main.c:525: else if (cpct_isKeyPressed(Key_CursorDown))
   8B03 21 00 04      [10] 2318 	ld	hl,#0x0400
   8B06 CD B2 65      [17] 2319 	call	_cpct_isKeyPressed
   8B09 7D            [ 4] 2320 	ld	a,l
   8B0A B7            [ 4] 2321 	or	a, a
                           2322 ;src/main.c:526: moverAbajo();
   8B0B C2 A3 88      [10] 2323 	jp	NZ,_moverAbajo
                           2324 ;src/main.c:527: else if (cpct_isKeyPressed(Key_Space))
   8B0E 21 05 80      [10] 2325 	ld	hl,#0x8005
   8B11 CD B2 65      [17] 2326 	call	_cpct_isKeyPressed
   8B14 7D            [ 4] 2327 	ld	a,l
   8B15 B7            [ 4] 2328 	or	a, a
   8B16 C8            [11] 2329 	ret	Z
                           2330 ;src/main.c:528: lanzarCuchillo();
   8B17 C3 BD 89      [10] 2331 	jp  _lanzarCuchillo
                           2332 ;src/main.c:532: u8 checkKnifeCollision(int direction, u8 xoff, u8 yoff){
                           2333 ;	---------------------------------
                           2334 ; Function checkKnifeCollision
                           2335 ; ---------------------------------
   8B1A                    2336 _checkKnifeCollision::
                           2337 ;src/main.c:534: return *getTilePtr(cu.x + xoff, cu.y + yoff) <= 2;
   8B1A 3A AA 77      [13] 2338 	ld	a,(#_cu + 1)
   8B1D 21 05 00      [10] 2339 	ld	hl,#5
   8B20 39            [11] 2340 	add	hl,sp
   8B21 86            [ 7] 2341 	add	a, (hl)
   8B22 47            [ 4] 2342 	ld	b,a
   8B23 3A A9 77      [13] 2343 	ld	a,(#_cu + 0)
   8B26 21 04 00      [10] 2344 	ld	hl,#4
   8B29 39            [11] 2345 	add	hl,sp
   8B2A 86            [ 7] 2346 	add	a, (hl)
   8B2B 4F            [ 4] 2347 	ld	c,a
   8B2C C5            [11] 2348 	push	bc
   8B2D CD E9 7F      [17] 2349 	call	_getTilePtr
   8B30 F1            [10] 2350 	pop	af
   8B31 4E            [ 7] 2351 	ld	c,(hl)
   8B32 3E 02         [ 7] 2352 	ld	a,#0x02
   8B34 91            [ 4] 2353 	sub	a, c
   8B35 3E 00         [ 7] 2354 	ld	a,#0x00
   8B37 17            [ 4] 2355 	rla
   8B38 EE 01         [ 7] 2356 	xor	a, #0x01
   8B3A 6F            [ 4] 2357 	ld	l, a
   8B3B C9            [10] 2358 	ret
                           2359 ;src/main.c:537: void moverCuchillo(){
                           2360 ;	---------------------------------
                           2361 ; Function moverCuchillo
                           2362 ; ---------------------------------
   8B3C                    2363 _moverCuchillo::
                           2364 ;src/main.c:538: if(cu.lanzado){
   8B3C 01 A9 77      [10] 2365 	ld	bc,#_cu+0
   8B3F 3A AF 77      [13] 2366 	ld	a, (#_cu + 6)
   8B42 B7            [ 4] 2367 	or	a, a
   8B43 C8            [11] 2368 	ret	Z
                           2369 ;src/main.c:539: cu.mover = SI;
   8B44 21 09 00      [10] 2370 	ld	hl,#0x0009
   8B47 09            [11] 2371 	add	hl,bc
   8B48 EB            [ 4] 2372 	ex	de,hl
   8B49 3E 01         [ 7] 2373 	ld	a,#0x01
   8B4B 12            [ 7] 2374 	ld	(de),a
                           2375 ;src/main.c:540: if(cu.direccion == M_derecha){
   8B4C 21 B0 77      [10] 2376 	ld	hl, #_cu + 7
   8B4F 6E            [ 7] 2377 	ld	l,(hl)
   8B50 7D            [ 4] 2378 	ld	a,l
   8B51 B7            [ 4] 2379 	or	a, a
   8B52 20 1E         [12] 2380 	jr	NZ,00122$
                           2381 ;src/main.c:542: if(checkKnifeCollision(M_derecha, G_KNIFEX_0_W + 1, 0)){
   8B54 C5            [11] 2382 	push	bc
   8B55 D5            [11] 2383 	push	de
   8B56 21 05 00      [10] 2384 	ld	hl,#0x0005
   8B59 E5            [11] 2385 	push	hl
   8B5A 2E 00         [ 7] 2386 	ld	l, #0x00
   8B5C E5            [11] 2387 	push	hl
   8B5D CD 1A 8B      [17] 2388 	call	_checkKnifeCollision
   8B60 F1            [10] 2389 	pop	af
   8B61 F1            [10] 2390 	pop	af
   8B62 D1            [10] 2391 	pop	de
   8B63 C1            [10] 2392 	pop	bc
   8B64 7D            [ 4] 2393 	ld	a,l
   8B65 B7            [ 4] 2394 	or	a, a
   8B66 28 07         [12] 2395 	jr	Z,00102$
                           2396 ;src/main.c:543: cu.mover = SI;
   8B68 3E 01         [ 7] 2397 	ld	a,#0x01
   8B6A 12            [ 7] 2398 	ld	(de),a
                           2399 ;src/main.c:544: cu.x++;
   8B6B 0A            [ 7] 2400 	ld	a,(bc)
   8B6C 3C            [ 4] 2401 	inc	a
   8B6D 02            [ 7] 2402 	ld	(bc),a
   8B6E C9            [10] 2403 	ret
   8B6F                    2404 00102$:
                           2405 ;src/main.c:547: cu.mover=NO;
   8B6F AF            [ 4] 2406 	xor	a, a
   8B70 12            [ 7] 2407 	ld	(de),a
   8B71 C9            [10] 2408 	ret
   8B72                    2409 00122$:
                           2410 ;src/main.c:550: else if(cu.direccion == M_izquierda){
   8B72 7D            [ 4] 2411 	ld	a,l
   8B73 3D            [ 4] 2412 	dec	a
   8B74 20 1F         [12] 2413 	jr	NZ,00119$
                           2414 ;src/main.c:551: if(checkKnifeCollision(M_derecha, -1, 0)){
   8B76 C5            [11] 2415 	push	bc
   8B77 D5            [11] 2416 	push	de
   8B78 21 FF 00      [10] 2417 	ld	hl,#0x00FF
   8B7B E5            [11] 2418 	push	hl
   8B7C 2E 00         [ 7] 2419 	ld	l, #0x00
   8B7E E5            [11] 2420 	push	hl
   8B7F CD 1A 8B      [17] 2421 	call	_checkKnifeCollision
   8B82 F1            [10] 2422 	pop	af
   8B83 F1            [10] 2423 	pop	af
   8B84 D1            [10] 2424 	pop	de
   8B85 C1            [10] 2425 	pop	bc
   8B86 7D            [ 4] 2426 	ld	a,l
   8B87 B7            [ 4] 2427 	or	a, a
   8B88 28 08         [12] 2428 	jr	Z,00105$
                           2429 ;src/main.c:552: cu.mover = SI;
   8B8A 3E 01         [ 7] 2430 	ld	a,#0x01
   8B8C 12            [ 7] 2431 	ld	(de),a
                           2432 ;src/main.c:553: cu.x--;
   8B8D 0A            [ 7] 2433 	ld	a,(bc)
   8B8E C6 FF         [ 7] 2434 	add	a,#0xFF
   8B90 02            [ 7] 2435 	ld	(bc),a
   8B91 C9            [10] 2436 	ret
   8B92                    2437 00105$:
                           2438 ;src/main.c:555: cu.mover=NO;
   8B92 AF            [ 4] 2439 	xor	a, a
   8B93 12            [ 7] 2440 	ld	(de),a
   8B94 C9            [10] 2441 	ret
   8B95                    2442 00119$:
                           2443 ;src/main.c:561: cu.y--;
   8B95 03            [ 6] 2444 	inc	bc
                           2445 ;src/main.c:558: else if(cu.direccion == M_arriba){
   8B96 7D            [ 4] 2446 	ld	a,l
   8B97 D6 02         [ 7] 2447 	sub	a, #0x02
   8B99 20 22         [12] 2448 	jr	NZ,00116$
                           2449 ;src/main.c:559: if(checkKnifeCollision(M_derecha, 0, -2)){
   8B9B C5            [11] 2450 	push	bc
   8B9C D5            [11] 2451 	push	de
   8B9D 21 00 FE      [10] 2452 	ld	hl,#0xFE00
   8BA0 E5            [11] 2453 	push	hl
   8BA1 26 00         [ 7] 2454 	ld	h, #0x00
   8BA3 E5            [11] 2455 	push	hl
   8BA4 CD 1A 8B      [17] 2456 	call	_checkKnifeCollision
   8BA7 F1            [10] 2457 	pop	af
   8BA8 F1            [10] 2458 	pop	af
   8BA9 D1            [10] 2459 	pop	de
   8BAA C1            [10] 2460 	pop	bc
   8BAB 7D            [ 4] 2461 	ld	a,l
   8BAC B7            [ 4] 2462 	or	a, a
   8BAD 28 0B         [12] 2463 	jr	Z,00108$
                           2464 ;src/main.c:560: cu.mover = SI;
   8BAF 3E 01         [ 7] 2465 	ld	a,#0x01
   8BB1 12            [ 7] 2466 	ld	(de),a
                           2467 ;src/main.c:561: cu.y--;
   8BB2 0A            [ 7] 2468 	ld	a,(bc)
   8BB3 C6 FF         [ 7] 2469 	add	a,#0xFF
   8BB5 02            [ 7] 2470 	ld	(bc),a
                           2471 ;src/main.c:562: cu.y--;
   8BB6 C6 FF         [ 7] 2472 	add	a,#0xFF
   8BB8 02            [ 7] 2473 	ld	(bc),a
   8BB9 C9            [10] 2474 	ret
   8BBA                    2475 00108$:
                           2476 ;src/main.c:565: cu.mover=NO;
   8BBA AF            [ 4] 2477 	xor	a, a
   8BBB 12            [ 7] 2478 	ld	(de),a
   8BBC C9            [10] 2479 	ret
   8BBD                    2480 00116$:
                           2481 ;src/main.c:568: else if(cu.direccion == M_abajo){
   8BBD 7D            [ 4] 2482 	ld	a,l
   8BBE D6 03         [ 7] 2483 	sub	a, #0x03
   8BC0 C0            [11] 2484 	ret	NZ
                           2485 ;src/main.c:569: if(checkKnifeCollision(M_derecha, 0, G_KNIFEY_0_H + 2)){
   8BC1 C5            [11] 2486 	push	bc
   8BC2 D5            [11] 2487 	push	de
   8BC3 21 00 0A      [10] 2488 	ld	hl,#0x0A00
   8BC6 E5            [11] 2489 	push	hl
   8BC7 26 00         [ 7] 2490 	ld	h, #0x00
   8BC9 E5            [11] 2491 	push	hl
   8BCA CD 1A 8B      [17] 2492 	call	_checkKnifeCollision
   8BCD F1            [10] 2493 	pop	af
   8BCE F1            [10] 2494 	pop	af
   8BCF D1            [10] 2495 	pop	de
   8BD0 C1            [10] 2496 	pop	bc
   8BD1 7D            [ 4] 2497 	ld	a,l
   8BD2 B7            [ 4] 2498 	or	a, a
   8BD3 28 09         [12] 2499 	jr	Z,00111$
                           2500 ;src/main.c:570: cu.mover = SI;
   8BD5 3E 01         [ 7] 2501 	ld	a,#0x01
   8BD7 12            [ 7] 2502 	ld	(de),a
                           2503 ;src/main.c:571: cu.y++;
   8BD8 0A            [ 7] 2504 	ld	a,(bc)
   8BD9 3C            [ 4] 2505 	inc	a
   8BDA 02            [ 7] 2506 	ld	(bc),a
                           2507 ;src/main.c:572: cu.y++;
   8BDB 3C            [ 4] 2508 	inc	a
   8BDC 02            [ 7] 2509 	ld	(bc),a
   8BDD C9            [10] 2510 	ret
   8BDE                    2511 00111$:
                           2512 ;src/main.c:575: cu.mover=NO;
   8BDE AF            [ 4] 2513 	xor	a, a
   8BDF 12            [ 7] 2514 	ld	(de),a
   8BE0 C9            [10] 2515 	ret
                           2516 ;src/main.c:581: void barraPuntuacionInicial(){
                           2517 ;	---------------------------------
                           2518 ; Function barraPuntuacionInicial
                           2519 ; ---------------------------------
   8BE1                    2520 _barraPuntuacionInicial::
                           2521 ;src/main.c:586: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   8BE1 21 00 02      [10] 2522 	ld	hl,#0x0200
   8BE4 E5            [11] 2523 	push	hl
   8BE5 26 C0         [ 7] 2524 	ld	h, #0xC0
   8BE7 E5            [11] 2525 	push	hl
   8BE8 CD 5C 72      [17] 2526 	call	_cpct_getScreenPtr
   8BEB 4D            [ 4] 2527 	ld	c,l
   8BEC 44            [ 4] 2528 	ld	b,h
                           2529 ;src/main.c:587: cpct_drawStringM0("SCORE", memptr, 1, 0);
   8BED 21 01 00      [10] 2530 	ld	hl,#0x0001
   8BF0 E5            [11] 2531 	push	hl
   8BF1 C5            [11] 2532 	push	bc
   8BF2 21 89 8C      [10] 2533 	ld	hl,#___str_1
   8BF5 E5            [11] 2534 	push	hl
   8BF6 CD 34 66      [17] 2535 	call	_cpct_drawStringM0
   8BF9 21 06 00      [10] 2536 	ld	hl,#6
   8BFC 39            [11] 2537 	add	hl,sp
   8BFD F9            [ 6] 2538 	ld	sp,hl
                           2539 ;src/main.c:588: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   8BFE 21 00 0E      [10] 2540 	ld	hl,#0x0E00
   8C01 E5            [11] 2541 	push	hl
   8C02 26 C0         [ 7] 2542 	ld	h, #0xC0
   8C04 E5            [11] 2543 	push	hl
   8C05 CD 5C 72      [17] 2544 	call	_cpct_getScreenPtr
   8C08 4D            [ 4] 2545 	ld	c,l
   8C09 44            [ 4] 2546 	ld	b,h
                           2547 ;src/main.c:589: cpct_drawStringM0("00000", memptr, 15, 0);
   8C0A 21 0F 00      [10] 2548 	ld	hl,#0x000F
   8C0D E5            [11] 2549 	push	hl
   8C0E C5            [11] 2550 	push	bc
   8C0F 21 8F 8C      [10] 2551 	ld	hl,#___str_2
   8C12 E5            [11] 2552 	push	hl
   8C13 CD 34 66      [17] 2553 	call	_cpct_drawStringM0
   8C16 21 06 00      [10] 2554 	ld	hl,#6
   8C19 39            [11] 2555 	add	hl,sp
   8C1A F9            [ 6] 2556 	ld	sp,hl
                           2557 ;src/main.c:592: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 14);
   8C1B 21 1A 0E      [10] 2558 	ld	hl,#0x0E1A
   8C1E E5            [11] 2559 	push	hl
   8C1F 21 00 C0      [10] 2560 	ld	hl,#0xC000
   8C22 E5            [11] 2561 	push	hl
   8C23 CD 5C 72      [17] 2562 	call	_cpct_getScreenPtr
   8C26 4D            [ 4] 2563 	ld	c,l
   8C27 44            [ 4] 2564 	ld	b,h
                           2565 ;src/main.c:593: cpct_drawStringM0("ROBOBIT", memptr, 3, 0);
   8C28 21 03 00      [10] 2566 	ld	hl,#0x0003
   8C2B E5            [11] 2567 	push	hl
   8C2C C5            [11] 2568 	push	bc
   8C2D 21 95 8C      [10] 2569 	ld	hl,#___str_3
   8C30 E5            [11] 2570 	push	hl
   8C31 CD 34 66      [17] 2571 	call	_cpct_drawStringM0
   8C34 21 06 00      [10] 2572 	ld	hl,#6
   8C37 39            [11] 2573 	add	hl,sp
   8C38 F9            [ 6] 2574 	ld	sp,hl
                           2575 ;src/main.c:595: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   8C39 21 3C 02      [10] 2576 	ld	hl,#0x023C
   8C3C E5            [11] 2577 	push	hl
   8C3D 21 00 C0      [10] 2578 	ld	hl,#0xC000
   8C40 E5            [11] 2579 	push	hl
   8C41 CD 5C 72      [17] 2580 	call	_cpct_getScreenPtr
   8C44 4D            [ 4] 2581 	ld	c,l
   8C45 44            [ 4] 2582 	ld	b,h
                           2583 ;src/main.c:596: cpct_drawStringM0("LIVES", memptr, 1, 0);
   8C46 21 01 00      [10] 2584 	ld	hl,#0x0001
   8C49 E5            [11] 2585 	push	hl
   8C4A C5            [11] 2586 	push	bc
   8C4B 21 9D 8C      [10] 2587 	ld	hl,#___str_4
   8C4E E5            [11] 2588 	push	hl
   8C4F CD 34 66      [17] 2589 	call	_cpct_drawStringM0
   8C52 21 06 00      [10] 2590 	ld	hl,#6
   8C55 39            [11] 2591 	add	hl,sp
   8C56 F9            [ 6] 2592 	ld	sp,hl
                           2593 ;src/main.c:598: for(i=0; i<5; i++){
   8C57 01 00 00      [10] 2594 	ld	bc,#0x0000
   8C5A                    2595 00102$:
                           2596 ;src/main.c:599: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   8C5A 79            [ 4] 2597 	ld	a,c
   8C5B 87            [ 4] 2598 	add	a, a
   8C5C 87            [ 4] 2599 	add	a, a
   8C5D C6 3C         [ 7] 2600 	add	a, #0x3C
   8C5F 57            [ 4] 2601 	ld	d,a
   8C60 C5            [11] 2602 	push	bc
   8C61 3E 0E         [ 7] 2603 	ld	a,#0x0E
   8C63 F5            [11] 2604 	push	af
   8C64 33            [ 6] 2605 	inc	sp
   8C65 D5            [11] 2606 	push	de
   8C66 33            [ 6] 2607 	inc	sp
   8C67 21 00 C0      [10] 2608 	ld	hl,#0xC000
   8C6A E5            [11] 2609 	push	hl
   8C6B CD 5C 72      [17] 2610 	call	_cpct_getScreenPtr
   8C6E EB            [ 4] 2611 	ex	de,hl
   8C6F 21 03 06      [10] 2612 	ld	hl,#0x0603
   8C72 E5            [11] 2613 	push	hl
   8C73 D5            [11] 2614 	push	de
   8C74 21 60 58      [10] 2615 	ld	hl,#_g_heart
   8C77 E5            [11] 2616 	push	hl
   8C78 CD 58 66      [17] 2617 	call	_cpct_drawSprite
   8C7B C1            [10] 2618 	pop	bc
                           2619 ;src/main.c:598: for(i=0; i<5; i++){
   8C7C 03            [ 6] 2620 	inc	bc
   8C7D 79            [ 4] 2621 	ld	a,c
   8C7E D6 05         [ 7] 2622 	sub	a, #0x05
   8C80 78            [ 4] 2623 	ld	a,b
   8C81 17            [ 4] 2624 	rla
   8C82 3F            [ 4] 2625 	ccf
   8C83 1F            [ 4] 2626 	rra
   8C84 DE 80         [ 7] 2627 	sbc	a, #0x80
   8C86 38 D2         [12] 2628 	jr	C,00102$
   8C88 C9            [10] 2629 	ret
   8C89                    2630 ___str_1:
   8C89 53 43 4F 52 45     2631 	.ascii "SCORE"
   8C8E 00                 2632 	.db 0x00
   8C8F                    2633 ___str_2:
   8C8F 30 30 30 30 30     2634 	.ascii "00000"
   8C94 00                 2635 	.db 0x00
   8C95                    2636 ___str_3:
   8C95 52 4F 42 4F 42 49  2637 	.ascii "ROBOBIT"
        54
   8C9C 00                 2638 	.db 0x00
   8C9D                    2639 ___str_4:
   8C9D 4C 49 56 45 53     2640 	.ascii "LIVES"
   8CA2 00                 2641 	.db 0x00
                           2642 ;src/main.c:604: void borrarPantallaArriba(u8 x, u8 y, u8 ancho, u8 alto){
                           2643 ;	---------------------------------
                           2644 ; Function borrarPantallaArriba
                           2645 ; ---------------------------------
   8CA3                    2646 _borrarPantallaArriba::
   8CA3 DD E5         [15] 2647 	push	ix
   8CA5 DD 21 00 00   [14] 2648 	ld	ix,#0
   8CA9 DD 39         [15] 2649 	add	ix,sp
                           2650 ;src/main.c:607: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   8CAB DD 66 05      [19] 2651 	ld	h,5 (ix)
   8CAE DD 6E 04      [19] 2652 	ld	l,4 (ix)
   8CB1 E5            [11] 2653 	push	hl
   8CB2 21 00 C0      [10] 2654 	ld	hl,#0xC000
   8CB5 E5            [11] 2655 	push	hl
   8CB6 CD 5C 72      [17] 2656 	call	_cpct_getScreenPtr
   8CB9 4D            [ 4] 2657 	ld	c,l
   8CBA 44            [ 4] 2658 	ld	b,h
                           2659 ;src/main.c:608: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra la mitad derecha
   8CBB DD 66 07      [19] 2660 	ld	h,7 (ix)
   8CBE DD 6E 06      [19] 2661 	ld	l,6 (ix)
   8CC1 E5            [11] 2662 	push	hl
   8CC2 AF            [ 4] 2663 	xor	a, a
   8CC3 F5            [11] 2664 	push	af
   8CC4 33            [ 6] 2665 	inc	sp
   8CC5 C5            [11] 2666 	push	bc
   8CC6 CD 82 71      [17] 2667 	call	_cpct_drawSolidBox
   8CC9 F1            [10] 2668 	pop	af
   8CCA F1            [10] 2669 	pop	af
   8CCB 33            [ 6] 2670 	inc	sp
                           2671 ;src/main.c:609: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   8CCC DD 7E 04      [19] 2672 	ld	a,4 (ix)
   8CCF C6 28         [ 7] 2673 	add	a, #0x28
   8CD1 47            [ 4] 2674 	ld	b,a
   8CD2 DD 7E 05      [19] 2675 	ld	a,5 (ix)
   8CD5 F5            [11] 2676 	push	af
   8CD6 33            [ 6] 2677 	inc	sp
   8CD7 C5            [11] 2678 	push	bc
   8CD8 33            [ 6] 2679 	inc	sp
   8CD9 21 00 C0      [10] 2680 	ld	hl,#0xC000
   8CDC E5            [11] 2681 	push	hl
   8CDD CD 5C 72      [17] 2682 	call	_cpct_getScreenPtr
   8CE0 4D            [ 4] 2683 	ld	c,l
   8CE1 44            [ 4] 2684 	ld	b,h
                           2685 ;src/main.c:610: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra la mitad izquierda
   8CE2 DD 66 07      [19] 2686 	ld	h,7 (ix)
   8CE5 DD 6E 06      [19] 2687 	ld	l,6 (ix)
   8CE8 E5            [11] 2688 	push	hl
   8CE9 AF            [ 4] 2689 	xor	a, a
   8CEA F5            [11] 2690 	push	af
   8CEB 33            [ 6] 2691 	inc	sp
   8CEC C5            [11] 2692 	push	bc
   8CED CD 82 71      [17] 2693 	call	_cpct_drawSolidBox
   8CF0 F1            [10] 2694 	pop	af
   8CF1 F1            [10] 2695 	pop	af
   8CF2 33            [ 6] 2696 	inc	sp
   8CF3 DD E1         [14] 2697 	pop	ix
   8CF5 C9            [10] 2698 	ret
                           2699 ;src/main.c:613: void menuInicio(){
                           2700 ;	---------------------------------
                           2701 ; Function menuInicio
                           2702 ; ---------------------------------
   8CF6                    2703 _menuInicio::
                           2704 ;src/main.c:617: cpct_clearScreen(0);
   8CF6 21 00 40      [10] 2705 	ld	hl,#0x4000
   8CF9 E5            [11] 2706 	push	hl
   8CFA AF            [ 4] 2707 	xor	a, a
   8CFB F5            [11] 2708 	push	af
   8CFC 33            [ 6] 2709 	inc	sp
   8CFD 26 C0         [ 7] 2710 	ld	h, #0xC0
   8CFF E5            [11] 2711 	push	hl
   8D00 CD 3B 69      [17] 2712 	call	_cpct_memset
                           2713 ;src/main.c:619: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   8D03 21 1A 0F      [10] 2714 	ld	hl,#0x0F1A
   8D06 E5            [11] 2715 	push	hl
   8D07 21 00 C0      [10] 2716 	ld	hl,#0xC000
   8D0A E5            [11] 2717 	push	hl
   8D0B CD 5C 72      [17] 2718 	call	_cpct_getScreenPtr
   8D0E 4D            [ 4] 2719 	ld	c,l
   8D0F 44            [ 4] 2720 	ld	b,h
                           2721 ;src/main.c:620: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   8D10 21 04 00      [10] 2722 	ld	hl,#0x0004
   8D13 E5            [11] 2723 	push	hl
   8D14 C5            [11] 2724 	push	bc
   8D15 21 A9 8D      [10] 2725 	ld	hl,#___str_5
   8D18 E5            [11] 2726 	push	hl
   8D19 CD 34 66      [17] 2727 	call	_cpct_drawStringM0
   8D1C 21 06 00      [10] 2728 	ld	hl,#6
   8D1F 39            [11] 2729 	add	hl,sp
   8D20 F9            [ 6] 2730 	ld	sp,hl
                           2731 ;src/main.c:622: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   8D21 21 28 6E      [10] 2732 	ld	hl,#0x6E28
   8D24 E5            [11] 2733 	push	hl
   8D25 21 F0 F0      [10] 2734 	ld	hl,#0xF0F0
   8D28 E5            [11] 2735 	push	hl
   8D29 21 00 36      [10] 2736 	ld	hl,#_g_text_0
   8D2C E5            [11] 2737 	push	hl
   8D2D CD 58 66      [17] 2738 	call	_cpct_drawSprite
                           2739 ;src/main.c:623: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   8D30 21 28 6E      [10] 2740 	ld	hl,#0x6E28
   8D33 E5            [11] 2741 	push	hl
   8D34 21 18 F1      [10] 2742 	ld	hl,#0xF118
   8D37 E5            [11] 2743 	push	hl
   8D38 21 30 47      [10] 2744 	ld	hl,#_g_text_1
   8D3B E5            [11] 2745 	push	hl
   8D3C CD 58 66      [17] 2746 	call	_cpct_drawSprite
                           2747 ;src/main.c:646: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   8D3F 21 08 A0      [10] 2748 	ld	hl,#0xA008
   8D42 E5            [11] 2749 	push	hl
   8D43 21 00 C0      [10] 2750 	ld	hl,#0xC000
   8D46 E5            [11] 2751 	push	hl
   8D47 CD 5C 72      [17] 2752 	call	_cpct_getScreenPtr
   8D4A 4D            [ 4] 2753 	ld	c,l
   8D4B 44            [ 4] 2754 	ld	b,h
                           2755 ;src/main.c:647: cpct_drawStringM0("TO START PRESS S", memptr, 4, 0);
   8D4C 21 04 00      [10] 2756 	ld	hl,#0x0004
   8D4F E5            [11] 2757 	push	hl
   8D50 C5            [11] 2758 	push	bc
   8D51 21 B1 8D      [10] 2759 	ld	hl,#___str_6
   8D54 E5            [11] 2760 	push	hl
   8D55 CD 34 66      [17] 2761 	call	_cpct_drawStringM0
   8D58 21 06 00      [10] 2762 	ld	hl,#6
   8D5B 39            [11] 2763 	add	hl,sp
   8D5C F9            [ 6] 2764 	ld	sp,hl
                           2765 ;src/main.c:649: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 170); // centrado en horizontal y abajo en vertical
   8D5D 21 0A AA      [10] 2766 	ld	hl,#0xAA0A
   8D60 E5            [11] 2767 	push	hl
   8D61 21 00 C0      [10] 2768 	ld	hl,#0xC000
   8D64 E5            [11] 2769 	push	hl
   8D65 CD 5C 72      [17] 2770 	call	_cpct_getScreenPtr
   8D68 4D            [ 4] 2771 	ld	c,l
   8D69 44            [ 4] 2772 	ld	b,h
                           2773 ;src/main.c:650: cpct_drawStringM0("TO MENU PRESS M", memptr, 4, 0);
   8D6A 21 04 00      [10] 2774 	ld	hl,#0x0004
   8D6D E5            [11] 2775 	push	hl
   8D6E C5            [11] 2776 	push	bc
   8D6F 21 C2 8D      [10] 2777 	ld	hl,#___str_7
   8D72 E5            [11] 2778 	push	hl
   8D73 CD 34 66      [17] 2779 	call	_cpct_drawStringM0
   8D76 21 06 00      [10] 2780 	ld	hl,#6
   8D79 39            [11] 2781 	add	hl,sp
   8D7A F9            [ 6] 2782 	ld	sp,hl
                           2783 ;src/main.c:653: do{
   8D7B                    2784 00106$:
                           2785 ;src/main.c:654: cpct_scanKeyboard_f();
   8D7B CD BE 65      [17] 2786 	call	_cpct_scanKeyboard_f
                           2787 ;src/main.c:658: if(cpct_isKeyPressed(Key_M)){
   8D7E 21 04 40      [10] 2788 	ld	hl,#0x4004
   8D81 CD B2 65      [17] 2789 	call	_cpct_isKeyPressed
   8D84 7D            [ 4] 2790 	ld	a,l
   8D85 B7            [ 4] 2791 	or	a, a
   8D86 28 0D         [12] 2792 	jr	Z,00107$
                           2793 ;src/main.c:659: cpct_scanKeyboard_f();
   8D88 CD BE 65      [17] 2794 	call	_cpct_scanKeyboard_f
                           2795 ;src/main.c:660: do{
   8D8B                    2796 00101$:
                           2797 ;src/main.c:662: } while(!cpct_isKeyPressed(Key_S));
   8D8B 21 07 10      [10] 2798 	ld	hl,#0x1007
   8D8E CD B2 65      [17] 2799 	call	_cpct_isKeyPressed
   8D91 7D            [ 4] 2800 	ld	a,l
   8D92 B7            [ 4] 2801 	or	a, a
   8D93 28 F6         [12] 2802 	jr	Z,00101$
   8D95                    2803 00107$:
                           2804 ;src/main.c:664: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   8D95 21 07 10      [10] 2805 	ld	hl,#0x1007
   8D98 CD B2 65      [17] 2806 	call	_cpct_isKeyPressed
   8D9B 7D            [ 4] 2807 	ld	a,l
   8D9C B7            [ 4] 2808 	or	a, a
   8D9D C0            [11] 2809 	ret	NZ
   8D9E 21 04 40      [10] 2810 	ld	hl,#0x4004
   8DA1 CD B2 65      [17] 2811 	call	_cpct_isKeyPressed
   8DA4 7D            [ 4] 2812 	ld	a,l
   8DA5 B7            [ 4] 2813 	or	a, a
   8DA6 28 D3         [12] 2814 	jr	Z,00106$
   8DA8 C9            [10] 2815 	ret
   8DA9                    2816 ___str_5:
   8DA9 52 4F 42 4F 42 49  2817 	.ascii "ROBOBIT"
        54
   8DB0 00                 2818 	.db 0x00
   8DB1                    2819 ___str_6:
   8DB1 54 4F 20 53 54 41  2820 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   8DC1 00                 2821 	.db 0x00
   8DC2                    2822 ___str_7:
   8DC2 54 4F 20 4D 45 4E  2823 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   8DD1 00                 2824 	.db 0x00
                           2825 ;src/main.c:667: void inicializarCPC() {
                           2826 ;	---------------------------------
                           2827 ; Function inicializarCPC
                           2828 ; ---------------------------------
   8DD2                    2829 _inicializarCPC::
                           2830 ;src/main.c:668: cpct_disableFirmware();
   8DD2 CD 72 71      [17] 2831 	call	_cpct_disableFirmware
                           2832 ;src/main.c:669: cpct_setVideoMode(0);
   8DD5 2E 00         [ 7] 2833 	ld	l,#0x00
   8DD7 CD 1D 69      [17] 2834 	call	_cpct_setVideoMode
                           2835 ;src/main.c:670: cpct_setBorder(HW_BLACK);
   8DDA 21 10 14      [10] 2836 	ld	hl,#0x1410
   8DDD E5            [11] 2837 	push	hl
   8DDE CD 28 66      [17] 2838 	call	_cpct_setPALColour
                           2839 ;src/main.c:671: cpct_setPalette(g_palette, 16);
   8DE1 21 10 00      [10] 2840 	ld	hl,#0x0010
   8DE4 E5            [11] 2841 	push	hl
   8DE5 21 98 5A      [10] 2842 	ld	hl,#_g_palette
   8DE8 E5            [11] 2843 	push	hl
   8DE9 CD 9B 65      [17] 2844 	call	_cpct_setPalette
                           2845 ;src/main.c:672: cpct_akp_musicInit(G_song);
   8DEC 21 00 1F      [10] 2846 	ld	hl,#_G_song
   8DEF E5            [11] 2847 	push	hl
   8DF0 CD 4E 70      [17] 2848 	call	_cpct_akp_musicInit
   8DF3 F1            [10] 2849 	pop	af
   8DF4 C9            [10] 2850 	ret
                           2851 ;src/main.c:675: void inicializarEnemy() {
                           2852 ;	---------------------------------
                           2853 ; Function inicializarEnemy
                           2854 ; ---------------------------------
   8DF5                    2855 _inicializarEnemy::
   8DF5 DD E5         [15] 2856 	push	ix
   8DF7 DD 21 00 00   [14] 2857 	ld	ix,#0
   8DFB DD 39         [15] 2858 	add	ix,sp
   8DFD F5            [11] 2859 	push	af
   8DFE 3B            [ 6] 2860 	dec	sp
                           2861 ;src/main.c:686: actual = enemy;
   8DFF 01 B9 72      [10] 2862 	ld	bc,#_enemy+0
                           2863 ;src/main.c:687: while(--i){
   8E02 DD 36 FD 02   [19] 2864 	ld	-3 (ix),#0x02
   8E06                    2865 00101$:
   8E06 DD 35 FD      [23] 2866 	dec	-3 (ix)
   8E09 DD 7E FD      [19] 2867 	ld	a,-3 (ix)
   8E0C B7            [ 4] 2868 	or	a, a
   8E0D CA A2 8E      [10] 2869 	jp	Z,00104$
                           2870 ;src/main.c:688: actual->x = actual->px = spawnX[i];
   8E10 59            [ 4] 2871 	ld	e, c
   8E11 50            [ 4] 2872 	ld	d, b
   8E12 13            [ 6] 2873 	inc	de
   8E13 13            [ 6] 2874 	inc	de
   8E14 3E FA         [ 7] 2875 	ld	a,#<(_spawnX)
   8E16 DD 86 FD      [19] 2876 	add	a, -3 (ix)
   8E19 6F            [ 4] 2877 	ld	l,a
   8E1A 3E 7E         [ 7] 2878 	ld	a,#>(_spawnX)
   8E1C CE 00         [ 7] 2879 	adc	a, #0x00
   8E1E 67            [ 4] 2880 	ld	h,a
   8E1F 7E            [ 7] 2881 	ld	a,(hl)
   8E20 DD 77 FF      [19] 2882 	ld	-1 (ix), a
   8E23 12            [ 7] 2883 	ld	(de),a
   8E24 DD 7E FF      [19] 2884 	ld	a,-1 (ix)
   8E27 02            [ 7] 2885 	ld	(bc),a
                           2886 ;src/main.c:689: actual->y = actual->py = spawnY[i];
   8E28 C5            [11] 2887 	push	bc
   8E29 FD E1         [14] 2888 	pop	iy
   8E2B FD 23         [10] 2889 	inc	iy
   8E2D 59            [ 4] 2890 	ld	e, c
   8E2E 50            [ 4] 2891 	ld	d, b
   8E2F 13            [ 6] 2892 	inc	de
   8E30 13            [ 6] 2893 	inc	de
   8E31 13            [ 6] 2894 	inc	de
   8E32 3E FF         [ 7] 2895 	ld	a,#<(_spawnY)
   8E34 DD 86 FD      [19] 2896 	add	a, -3 (ix)
   8E37 6F            [ 4] 2897 	ld	l,a
   8E38 3E 7E         [ 7] 2898 	ld	a,#>(_spawnY)
   8E3A CE 00         [ 7] 2899 	adc	a, #0x00
   8E3C 67            [ 4] 2900 	ld	h,a
   8E3D 7E            [ 7] 2901 	ld	a,(hl)
   8E3E DD 77 FE      [19] 2902 	ld	-2 (ix), a
   8E41 12            [ 7] 2903 	ld	(de),a
   8E42 DD 7E FE      [19] 2904 	ld	a,-2 (ix)
   8E45 FD 77 00      [19] 2905 	ld	0 (iy), a
                           2906 ;src/main.c:690: actual->mover  = NO;
   8E48 21 06 00      [10] 2907 	ld	hl,#0x0006
   8E4B 09            [11] 2908 	add	hl,bc
   8E4C 36 00         [10] 2909 	ld	(hl),#0x00
                           2910 ;src/main.c:691: actual->mira   = M_abajo;
   8E4E 21 07 00      [10] 2911 	ld	hl,#0x0007
   8E51 09            [11] 2912 	add	hl,bc
   8E52 36 03         [10] 2913 	ld	(hl),#0x03
                           2914 ;src/main.c:692: actual->sprite = g_enemy;
   8E54 21 04 00      [10] 2915 	ld	hl,#0x0004
   8E57 09            [11] 2916 	add	hl,bc
   8E58 36 72         [10] 2917 	ld	(hl),#<(_g_enemy)
   8E5A 23            [ 6] 2918 	inc	hl
   8E5B 36 58         [10] 2919 	ld	(hl),#>(_g_enemy)
                           2920 ;src/main.c:693: actual->muerto = NO;
   8E5D 21 08 00      [10] 2921 	ld	hl,#0x0008
   8E60 09            [11] 2922 	add	hl,bc
   8E61 36 00         [10] 2923 	ld	(hl),#0x00
                           2924 ;src/main.c:694: actual->muertes = 0;
   8E63 21 0C 00      [10] 2925 	ld	hl,#0x000C
   8E66 09            [11] 2926 	add	hl,bc
   8E67 36 00         [10] 2927 	ld	(hl),#0x00
                           2928 ;src/main.c:695: actual->patroling = SI;
   8E69 21 09 00      [10] 2929 	ld	hl,#0x0009
   8E6C 09            [11] 2930 	add	hl,bc
   8E6D 36 01         [10] 2931 	ld	(hl),#0x01
                           2932 ;src/main.c:696: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   8E6F 21 A2 77      [10] 2933 	ld	hl, #_prota + 1
   8E72 5E            [ 7] 2934 	ld	e,(hl)
   8E73 21 A1 77      [10] 2935 	ld	hl, #_prota + 0
   8E76 56            [ 7] 2936 	ld	d,(hl)
   8E77 C5            [11] 2937 	push	bc
   8E78 2A B4 77      [16] 2938 	ld	hl,(_mapa)
   8E7B E5            [11] 2939 	push	hl
   8E7C C5            [11] 2940 	push	bc
   8E7D 7B            [ 4] 2941 	ld	a,e
   8E7E F5            [11] 2942 	push	af
   8E7F 33            [ 6] 2943 	inc	sp
   8E80 D5            [11] 2944 	push	de
   8E81 33            [ 6] 2945 	inc	sp
   8E82 DD 66 FE      [19] 2946 	ld	h,-2 (ix)
   8E85 DD 6E FF      [19] 2947 	ld	l,-1 (ix)
   8E88 E5            [11] 2948 	push	hl
   8E89 CD A6 61      [17] 2949 	call	_pathFinding
   8E8C 21 08 00      [10] 2950 	ld	hl,#8
   8E8F 39            [11] 2951 	add	hl,sp
   8E90 F9            [ 6] 2952 	ld	sp,hl
   8E91 C1            [10] 2953 	pop	bc
                           2954 ;src/main.c:719: dibujarEnemigo(actual);
   8E92 C5            [11] 2955 	push	bc
   8E93 C5            [11] 2956 	push	bc
   8E94 CD 7F 81      [17] 2957 	call	_dibujarEnemigo
   8E97 F1            [10] 2958 	pop	af
   8E98 C1            [10] 2959 	pop	bc
                           2960 ;src/main.c:721: ++actual;
   8E99 21 3A 01      [10] 2961 	ld	hl,#0x013A
   8E9C 09            [11] 2962 	add	hl,bc
   8E9D 4D            [ 4] 2963 	ld	c,l
   8E9E 44            [ 4] 2964 	ld	b,h
   8E9F C3 06 8E      [10] 2965 	jp	00101$
   8EA2                    2966 00104$:
   8EA2 DD F9         [10] 2967 	ld	sp, ix
   8EA4 DD E1         [14] 2968 	pop	ix
   8EA6 C9            [10] 2969 	ret
                           2970 ;src/main.c:725: void inicializarJuego() {
                           2971 ;	---------------------------------
                           2972 ; Function inicializarJuego
                           2973 ; ---------------------------------
   8EA7                    2974 _inicializarJuego::
                           2975 ;src/main.c:727: iter = 0;
   8EA7 21 B3 77      [10] 2976 	ld	hl,#_iter + 0
   8EAA 36 00         [10] 2977 	ld	(hl), #0x00
                           2978 ;src/main.c:728: num_mapa = 0;
   8EAC 21 B6 77      [10] 2979 	ld	hl,#_num_mapa + 0
   8EAF 36 00         [10] 2980 	ld	(hl), #0x00
                           2981 ;src/main.c:729: mapa = mapas[num_mapa];
   8EB1 21 F4 7E      [10] 2982 	ld	hl, #_mapas + 0
   8EB4 7E            [ 7] 2983 	ld	a,(hl)
   8EB5 FD 21 B4 77   [14] 2984 	ld	iy,#_mapa
   8EB9 FD 77 00      [19] 2985 	ld	0 (iy),a
   8EBC 23            [ 6] 2986 	inc	hl
   8EBD 7E            [ 7] 2987 	ld	a,(hl)
   8EBE 32 B5 77      [13] 2988 	ld	(#_mapa + 1),a
                           2989 ;src/main.c:730: cpct_etm_setTileset2x4(g_tileset);
   8EC1 21 E0 34      [10] 2990 	ld	hl,#_g_tileset
   8EC4 CD 8C 67      [17] 2991 	call	_cpct_etm_setTileset2x4
                           2992 ;src/main.c:732: dibujarMapa();
   8EC7 CD DE 7E      [17] 2993 	call	_dibujarMapa
                           2994 ;src/main.c:734: borrarPantallaArriba(0, 0, 40, 1);
   8ECA 21 28 01      [10] 2995 	ld	hl,#0x0128
   8ECD E5            [11] 2996 	push	hl
   8ECE 21 00 00      [10] 2997 	ld	hl,#0x0000
   8ED1 E5            [11] 2998 	push	hl
   8ED2 CD A3 8C      [17] 2999 	call	_borrarPantallaArriba
   8ED5 F1            [10] 3000 	pop	af
   8ED6 F1            [10] 3001 	pop	af
                           3002 ;src/main.c:735: barraPuntuacionInicial();
   8ED7 CD E1 8B      [17] 3003 	call	_barraPuntuacionInicial
                           3004 ;src/main.c:738: prota.x = prota.px = 50;
   8EDA 21 A3 77      [10] 3005 	ld	hl,#(_prota + 0x0002)
   8EDD 36 32         [10] 3006 	ld	(hl),#0x32
   8EDF 21 A1 77      [10] 3007 	ld	hl,#_prota
   8EE2 36 32         [10] 3008 	ld	(hl),#0x32
                           3009 ;src/main.c:739: prota.y = prota.py = 76 + ORIGEN_MAPA_Y;
   8EE4 21 A4 77      [10] 3010 	ld	hl,#(_prota + 0x0003)
   8EE7 36 64         [10] 3011 	ld	(hl),#0x64
   8EE9 21 A2 77      [10] 3012 	ld	hl,#(_prota + 0x0001)
   8EEC 36 64         [10] 3013 	ld	(hl),#0x64
                           3014 ;src/main.c:740: prota.mover  = NO;
   8EEE 21 A7 77      [10] 3015 	ld	hl,#(_prota + 0x0006)
   8EF1 36 00         [10] 3016 	ld	(hl),#0x00
                           3017 ;src/main.c:741: prota.mira=M_derecha;
   8EF3 21 A8 77      [10] 3018 	ld	hl,#(_prota + 0x0007)
   8EF6 36 00         [10] 3019 	ld	(hl),#0x00
                           3020 ;src/main.c:742: prota.sprite = g_hero;
   8EF8 21 A8 5A      [10] 3021 	ld	hl,#_g_hero
   8EFB 22 A5 77      [16] 3022 	ld	((_prota + 0x0004)), hl
                           3023 ;src/main.c:746: cu.x = cu.px = 0;
   8EFE 21 AB 77      [10] 3024 	ld	hl,#(_cu + 0x0002)
   8F01 36 00         [10] 3025 	ld	(hl),#0x00
   8F03 21 A9 77      [10] 3026 	ld	hl,#_cu
   8F06 36 00         [10] 3027 	ld	(hl),#0x00
                           3028 ;src/main.c:747: cu.y = cu.py = 0;
   8F08 21 AC 77      [10] 3029 	ld	hl,#(_cu + 0x0003)
   8F0B 36 00         [10] 3030 	ld	(hl),#0x00
   8F0D 21 AA 77      [10] 3031 	ld	hl,#(_cu + 0x0001)
   8F10 36 00         [10] 3032 	ld	(hl),#0x00
                           3033 ;src/main.c:748: cu.lanzado = NO;
   8F12 21 AF 77      [10] 3034 	ld	hl,#(_cu + 0x0006)
   8F15 36 00         [10] 3035 	ld	(hl),#0x00
                           3036 ;src/main.c:749: cu.mover = NO;
   8F17 21 B2 77      [10] 3037 	ld	hl,#(_cu + 0x0009)
   8F1A 36 00         [10] 3038 	ld	(hl),#0x00
                           3039 ;src/main.c:751: inicializarEnemy();
   8F1C CD F5 8D      [17] 3040 	call	_inicializarEnemy
                           3041 ;src/main.c:753: dibujarProta();
   8F1F C3 04 7F      [10] 3042 	jp  _dibujarProta
                           3043 ;src/main.c:756: void main(void) {
                           3044 ;	---------------------------------
                           3045 ; Function main
                           3046 ; ---------------------------------
   8F22                    3047 _main::
   8F22 DD E5         [15] 3048 	push	ix
   8F24 DD 21 00 00   [14] 3049 	ld	ix,#0
   8F28 DD 39         [15] 3050 	add	ix,sp
   8F2A F5            [11] 3051 	push	af
   8F2B F5            [11] 3052 	push	af
                           3053 ;src/main.c:761: inicializarCPC();
   8F2C CD D2 8D      [17] 3054 	call	_inicializarCPC
                           3055 ;src/main.c:762: menuInicio();
   8F2F CD F6 8C      [17] 3056 	call	_menuInicio
                           3057 ;src/main.c:764: inicializarJuego();
   8F32 CD A7 8E      [17] 3058 	call	_inicializarJuego
                           3059 ;src/main.c:765: cpct_akp_musicPlay();
   8F35 CD 4B 69      [17] 3060 	call	_cpct_akp_musicPlay
                           3061 ;src/main.c:766: j=0;
   8F38 DD 36 FD 00   [19] 3062 	ld	-3 (ix),#0x00
                           3063 ;src/main.c:767: while (1) {
   8F3C                    3064 00126$:
                           3065 ;src/main.c:768: j++;
   8F3C DD 34 FD      [23] 3066 	inc	-3 (ix)
                           3067 ;src/main.c:771: actual = enemy;
                           3068 ;src/main.c:773: comprobarTeclado();
   8F3F CD D9 8A      [17] 3069 	call	_comprobarTeclado
                           3070 ;src/main.c:774: moverCuchillo();
   8F42 CD 3C 8B      [17] 3071 	call	_moverCuchillo
                           3072 ;src/main.c:776: while(--i){
   8F45 01 B9 72      [10] 3073 	ld	bc,#_enemy
   8F48 DD 36 FC 02   [19] 3074 	ld	-4 (ix),#0x02
   8F4C                    3075 00105$:
   8F4C DD 35 FC      [23] 3076 	dec	-4 (ix)
   8F4F DD 7E FC      [19] 3077 	ld	a,-4 (ix)
   8F52 B7            [ 4] 3078 	or	a, a
   8F53 28 62         [12] 3079 	jr	Z,00107$
                           3080 ;src/main.c:777: if(j % 50 == 0 && actual->longitud_camino == 0){
   8F55 C5            [11] 3081 	push	bc
   8F56 3E 32         [ 7] 3082 	ld	a,#0x32
   8F58 F5            [11] 3083 	push	af
   8F59 33            [ 6] 3084 	inc	sp
   8F5A DD 7E FD      [19] 3085 	ld	a,-3 (ix)
   8F5D F5            [11] 3086 	push	af
   8F5E 33            [ 6] 3087 	inc	sp
   8F5F CD 90 67      [17] 3088 	call	__moduchar
   8F62 F1            [10] 3089 	pop	af
   8F63 C1            [10] 3090 	pop	bc
   8F64 7D            [ 4] 3091 	ld	a,l
   8F65 B7            [ 4] 3092 	or	a, a
   8F66 20 40         [12] 3093 	jr	NZ,00102$
   8F68 69            [ 4] 3094 	ld	l, c
   8F69 60            [ 4] 3095 	ld	h, b
   8F6A 11 39 01      [10] 3096 	ld	de, #0x0139
   8F6D 19            [11] 3097 	add	hl, de
   8F6E 7E            [ 7] 3098 	ld	a,(hl)
   8F6F B7            [ 4] 3099 	or	a, a
   8F70 20 36         [12] 3100 	jr	NZ,00102$
                           3101 ;src/main.c:778: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   8F72 3A A2 77      [13] 3102 	ld	a,(#_prota + 1)
   8F75 DD 77 FE      [19] 3103 	ld	-2 (ix),a
   8F78 21 A1 77      [10] 3104 	ld	hl, #_prota + 0
   8F7B 5E            [ 7] 3105 	ld	e,(hl)
   8F7C 69            [ 4] 3106 	ld	l, c
   8F7D 60            [ 4] 3107 	ld	h, b
   8F7E 23            [ 6] 3108 	inc	hl
   8F7F 56            [ 7] 3109 	ld	d,(hl)
   8F80 0A            [ 7] 3110 	ld	a,(bc)
   8F81 DD 77 FF      [19] 3111 	ld	-1 (ix),a
   8F84 C5            [11] 3112 	push	bc
   8F85 2A B4 77      [16] 3113 	ld	hl,(_mapa)
   8F88 E5            [11] 3114 	push	hl
   8F89 C5            [11] 3115 	push	bc
   8F8A DD 7E FE      [19] 3116 	ld	a,-2 (ix)
   8F8D F5            [11] 3117 	push	af
   8F8E 33            [ 6] 3118 	inc	sp
   8F8F 7B            [ 4] 3119 	ld	a,e
   8F90 F5            [11] 3120 	push	af
   8F91 33            [ 6] 3121 	inc	sp
   8F92 D5            [11] 3122 	push	de
   8F93 33            [ 6] 3123 	inc	sp
   8F94 DD 7E FF      [19] 3124 	ld	a,-1 (ix)
   8F97 F5            [11] 3125 	push	af
   8F98 33            [ 6] 3126 	inc	sp
   8F99 CD A6 61      [17] 3127 	call	_pathFinding
   8F9C 21 08 00      [10] 3128 	ld	hl,#8
   8F9F 39            [11] 3129 	add	hl,sp
   8FA0 F9            [ 6] 3130 	ld	sp,hl
   8FA1 C1            [10] 3131 	pop	bc
                           3132 ;src/main.c:779: j = 0;
   8FA2 DD 36 FD 00   [19] 3133 	ld	-3 (ix),#0x00
   8FA6 18 07         [12] 3134 	jr	00103$
   8FA8                    3135 00102$:
                           3136 ;src/main.c:781: moverEnemigo(actual);  
   8FA8 C5            [11] 3137 	push	bc
   8FA9 C5            [11] 3138 	push	bc
   8FAA CD 54 87      [17] 3139 	call	_moverEnemigo
   8FAD F1            [10] 3140 	pop	af
   8FAE C1            [10] 3141 	pop	bc
   8FAF                    3142 00103$:
                           3143 ;src/main.c:784: ++actual;
   8FAF 21 3A 01      [10] 3144 	ld	hl,#0x013A
   8FB2 09            [11] 3145 	add	hl,bc
   8FB3 4D            [ 4] 3146 	ld	c,l
   8FB4 44            [ 4] 3147 	ld	b,h
   8FB5 18 95         [12] 3148 	jr	00105$
   8FB7                    3149 00107$:
                           3150 ;src/main.c:788: actual = enemy;
   8FB7 01 B9 72      [10] 3151 	ld	bc,#_enemy
                           3152 ;src/main.c:790: cpct_waitVSYNC();
   8FBA C5            [11] 3153 	push	bc
   8FBB CD 15 69      [17] 3154 	call	_cpct_waitVSYNC
   8FBE C1            [10] 3155 	pop	bc
                           3156 ;src/main.c:792: if (prota.mover) {
   8FBF 3A A7 77      [13] 3157 	ld	a, (#(_prota + 0x0006) + 0)
   8FC2 B7            [ 4] 3158 	or	a, a
   8FC3 28 0A         [12] 3159 	jr	Z,00109$
                           3160 ;src/main.c:793: redibujarProta();
   8FC5 C5            [11] 3161 	push	bc
   8FC6 CD D5 7F      [17] 3162 	call	_redibujarProta
   8FC9 C1            [10] 3163 	pop	bc
                           3164 ;src/main.c:794: prota.mover = NO;
   8FCA 21 A7 77      [10] 3165 	ld	hl,#(_prota + 0x0006)
   8FCD 36 00         [10] 3166 	ld	(hl),#0x00
   8FCF                    3167 00109$:
                           3168 ;src/main.c:796: if(cu.lanzado && cu.mover){
   8FCF 21 AF 77      [10] 3169 	ld	hl, #(_cu + 0x0006) + 0
   8FD2 5E            [ 7] 3170 	ld	e,(hl)
   8FD3 21 B2 77      [10] 3171 	ld	hl,#_cu + 9
   8FD6 7B            [ 4] 3172 	ld	a,e
   8FD7 B7            [ 4] 3173 	or	a, a
   8FD8 28 0B         [12] 3174 	jr	Z,00114$
   8FDA 7E            [ 7] 3175 	ld	a,(hl)
   8FDB B7            [ 4] 3176 	or	a, a
   8FDC 28 07         [12] 3177 	jr	Z,00114$
                           3178 ;src/main.c:797: redibujarCuchillo();
   8FDE C5            [11] 3179 	push	bc
   8FDF CD A9 89      [17] 3180 	call	_redibujarCuchillo
   8FE2 C1            [10] 3181 	pop	bc
   8FE3 18 0D         [12] 3182 	jr	00143$
   8FE5                    3183 00114$:
                           3184 ;src/main.c:798: }else if (cu.lanzado && !cu.mover){
   8FE5 7B            [ 4] 3185 	ld	a,e
   8FE6 B7            [ 4] 3186 	or	a, a
   8FE7 28 09         [12] 3187 	jr	Z,00143$
   8FE9 7E            [ 7] 3188 	ld	a,(hl)
   8FEA B7            [ 4] 3189 	or	a, a
   8FEB 20 05         [12] 3190 	jr	NZ,00143$
                           3191 ;src/main.c:799: borrarCuchillo();
   8FED C5            [11] 3192 	push	bc
   8FEE CD 2B 89      [17] 3193 	call	_borrarCuchillo
   8FF1 C1            [10] 3194 	pop	bc
                           3195 ;src/main.c:802: while(--i){
   8FF2                    3196 00143$:
   8FF2 DD 36 FC 02   [19] 3197 	ld	-4 (ix),#0x02
   8FF6                    3198 00122$:
   8FF6 DD 35 FC      [23] 3199 	dec	-4 (ix)
   8FF9 DD 7E FC      [19] 3200 	ld	a,-4 (ix)
   8FFC B7            [ 4] 3201 	or	a, a
   8FFD 28 43         [12] 3202 	jr	Z,00124$
                           3203 ;src/main.c:803: if(actual->mover){
   8FFF C5            [11] 3204 	push	bc
   9000 FD E1         [14] 3205 	pop	iy
   9002 FD 7E 06      [19] 3206 	ld	a,6 (iy)
   9005 B7            [ 4] 3207 	or	a, a
   9006 28 07         [12] 3208 	jr	Z,00118$
                           3209 ;src/main.c:804: redibujarEnemigo(actual);
   9008 C5            [11] 3210 	push	bc
   9009 C5            [11] 3211 	push	bc
   900A CD F3 82      [17] 3212 	call	_redibujarEnemigo
   900D F1            [10] 3213 	pop	af
   900E C1            [10] 3214 	pop	bc
   900F                    3215 00118$:
                           3216 ;src/main.c:806: if (actual->muerto && actual->muertes == 0){
   900F C5            [11] 3217 	push	bc
   9010 FD E1         [14] 3218 	pop	iy
   9012 FD 7E 08      [19] 3219 	ld	a,8 (iy)
   9015 B7            [ 4] 3220 	or	a, a
   9016 28 22         [12] 3221 	jr	Z,00120$
   9018 21 0C 00      [10] 3222 	ld	hl,#0x000C
   901B 09            [11] 3223 	add	hl,bc
   901C 7E            [ 7] 3224 	ld	a,(hl)
   901D B7            [ 4] 3225 	or	a, a
   901E 20 1A         [12] 3226 	jr	NZ,00120$
                           3227 ;src/main.c:807: borrarEnemigo(actual);
   9020 E5            [11] 3228 	push	hl
   9021 C5            [11] 3229 	push	bc
   9022 C5            [11] 3230 	push	bc
   9023 CD 5F 82      [17] 3231 	call	_borrarEnemigo
   9026 F1            [10] 3232 	pop	af
   9027 C1            [10] 3233 	pop	bc
   9028 C5            [11] 3234 	push	bc
   9029 C5            [11] 3235 	push	bc
   902A CD B7 81      [17] 3236 	call	_dibujarExplosion
   902D F1            [10] 3237 	pop	af
   902E C1            [10] 3238 	pop	bc
   902F E1            [10] 3239 	pop	hl
                           3240 ;src/main.c:810: actual->muertes++;
   9030 5E            [ 7] 3241 	ld	e,(hl)
   9031 1C            [ 4] 3242 	inc	e
   9032 73            [ 7] 3243 	ld	(hl),e
                           3244 ;src/main.c:811: actual->x = 0;
   9033 AF            [ 4] 3245 	xor	a, a
   9034 02            [ 7] 3246 	ld	(bc),a
                           3247 ;src/main.c:812: actual->y = 0;
   9035 59            [ 4] 3248 	ld	e, c
   9036 50            [ 4] 3249 	ld	d, b
   9037 13            [ 6] 3250 	inc	de
   9038 AF            [ 4] 3251 	xor	a, a
   9039 12            [ 7] 3252 	ld	(de),a
   903A                    3253 00120$:
                           3254 ;src/main.c:814: ++actual;
   903A 21 3A 01      [10] 3255 	ld	hl,#0x013A
   903D 09            [11] 3256 	add	hl,bc
   903E 4D            [ 4] 3257 	ld	c,l
   903F 44            [ 4] 3258 	ld	b,h
   9040 18 B4         [12] 3259 	jr	00122$
   9042                    3260 00124$:
                           3261 ;src/main.c:817: cpct_waitVSYNC();
   9042 CD 15 69      [17] 3262 	call	_cpct_waitVSYNC
   9045 C3 3C 8F      [10] 3263 	jp	00126$
                           3264 	.area _CODE
                           3265 	.area _INITIALIZER
                           3266 	.area _CABS (ABS)
   1F00                    3267 	.org 0x1F00
   1F00                    3268 _G_song:
   1F00 41                 3269 	.db #0x41	; 65	'A'
   1F01 54                 3270 	.db #0x54	; 84	'T'
   1F02 31                 3271 	.db #0x31	; 49	'1'
   1F03 30                 3272 	.db #0x30	; 48	'0'
   1F04 01                 3273 	.db #0x01	; 1
   1F05 40                 3274 	.db #0x40	; 64
   1F06 42                 3275 	.db #0x42	; 66	'B'
   1F07 0F                 3276 	.db #0x0F	; 15
   1F08 02                 3277 	.db #0x02	; 2
   1F09 06                 3278 	.db #0x06	; 6
   1F0A 1D                 3279 	.db #0x1D	; 29
   1F0B 00                 3280 	.db #0x00	; 0
   1F0C 10                 3281 	.db #0x10	; 16
   1F0D 40                 3282 	.db #0x40	; 64
   1F0E 19                 3283 	.db #0x19	; 25
   1F0F 40                 3284 	.db #0x40	; 64
   1F10 00                 3285 	.db #0x00	; 0
   1F11 00                 3286 	.db #0x00	; 0
   1F12 00                 3287 	.db #0x00	; 0
   1F13 00                 3288 	.db #0x00	; 0
   1F14 00                 3289 	.db #0x00	; 0
   1F15 00                 3290 	.db #0x00	; 0
   1F16 0D                 3291 	.db #0x0D	; 13
   1F17 12                 3292 	.db #0x12	; 18
   1F18 40                 3293 	.db #0x40	; 64
   1F19 01                 3294 	.db #0x01	; 1
   1F1A 00                 3295 	.db #0x00	; 0
   1F1B 7C                 3296 	.db #0x7C	; 124
   1F1C 18                 3297 	.db #0x18	; 24
   1F1D 78                 3298 	.db #0x78	; 120	'x'
   1F1E 0C                 3299 	.db #0x0C	; 12
   1F1F 34                 3300 	.db #0x34	; 52	'4'
   1F20 30                 3301 	.db #0x30	; 48	'0'
   1F21 2C                 3302 	.db #0x2C	; 44
   1F22 28                 3303 	.db #0x28	; 40
   1F23 24                 3304 	.db #0x24	; 36
   1F24 20                 3305 	.db #0x20	; 32
   1F25 1C                 3306 	.db #0x1C	; 28
   1F26 0D                 3307 	.db #0x0D	; 13
   1F27 25                 3308 	.db #0x25	; 37
   1F28 40                 3309 	.db #0x40	; 64
   1F29 20                 3310 	.db #0x20	; 32
   1F2A 00                 3311 	.db #0x00	; 0
   1F2B 00                 3312 	.db #0x00	; 0
   1F2C 00                 3313 	.db #0x00	; 0
   1F2D 39                 3314 	.db #0x39	; 57	'9'
   1F2E 40                 3315 	.db #0x40	; 64
   1F2F 00                 3316 	.db #0x00	; 0
   1F30 57                 3317 	.db #0x57	; 87	'W'
   1F31 40                 3318 	.db #0x40	; 64
   1F32 3B                 3319 	.db #0x3B	; 59
   1F33 40                 3320 	.db #0x40	; 64
   1F34 57                 3321 	.db #0x57	; 87	'W'
   1F35 40                 3322 	.db #0x40	; 64
   1F36 01                 3323 	.db #0x01	; 1
   1F37 2F                 3324 	.db #0x2F	; 47
   1F38 40                 3325 	.db #0x40	; 64
   1F39 19                 3326 	.db #0x19	; 25
   1F3A 00                 3327 	.db #0x00	; 0
   1F3B 76                 3328 	.db #0x76	; 118	'v'
   1F3C E1                 3329 	.db #0xE1	; 225
   1F3D 00                 3330 	.db #0x00	; 0
   1F3E 00                 3331 	.db #0x00	; 0
   1F3F 01                 3332 	.db #0x01	; 1
   1F40 04                 3333 	.db #0x04	; 4
   1F41 51                 3334 	.db #0x51	; 81	'Q'
   1F42 04                 3335 	.db #0x04	; 4
   1F43 37                 3336 	.db #0x37	; 55	'7'
   1F44 04                 3337 	.db #0x04	; 4
   1F45 4F                 3338 	.db #0x4F	; 79	'O'
   1F46 04                 3339 	.db #0x04	; 4
   1F47 37                 3340 	.db #0x37	; 55	'7'
   1F48 02                 3341 	.db #0x02	; 2
   1F49 4B                 3342 	.db #0x4B	; 75	'K'
   1F4A 02                 3343 	.db #0x02	; 2
   1F4B 37                 3344 	.db #0x37	; 55	'7'
   1F4C 04                 3345 	.db #0x04	; 4
   1F4D 4F                 3346 	.db #0x4F	; 79	'O'
   1F4E 04                 3347 	.db #0x04	; 4
   1F4F 37                 3348 	.db #0x37	; 55	'7'
   1F50 04                 3349 	.db #0x04	; 4
   1F51 4F                 3350 	.db #0x4F	; 79	'O'
   1F52 04                 3351 	.db #0x04	; 4
   1F53 37                 3352 	.db #0x37	; 55	'7'
   1F54 02                 3353 	.db #0x02	; 2
   1F55 4B                 3354 	.db #0x4B	; 75	'K'
   1F56 00                 3355 	.db #0x00	; 0
   1F57 42                 3356 	.db #0x42	; 66	'B'
   1F58 60                 3357 	.db #0x60	; 96
   1F59 00                 3358 	.db #0x00	; 0
   1F5A 42                 3359 	.db #0x42	; 66	'B'
   1F5B 80                 3360 	.db #0x80	; 128
   1F5C 00                 3361 	.db #0x00	; 0
   1F5D 00                 3362 	.db #0x00	; 0
   1F5E 42                 3363 	.db #0x42	; 66	'B'
   1F5F 00                 3364 	.db #0x00	; 0
   1F60 00                 3365 	.db #0x00	; 0
