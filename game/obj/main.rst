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
                             33 	.globl _lookFor
                             34 	.globl _patrol
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
   64B5                      92 _EMirar::
   64B5                      93 	.ds 1
   64B6                      94 _EEje::
   64B6                      95 	.ds 1
   64B7                      96 _enemy::
   64B7                      97 	.ds 1292
   69C3                      98 _prota::
   69C3                      99 	.ds 8
   69CB                     100 _cu::
   69CB                     101 	.ds 10
   69D5                     102 _iter::
   69D5                     103 	.ds 1
   69D6                     104 _mapa::
   69D6                     105 	.ds 2
   69D8                     106 _num_mapa::
   69D8                     107 	.ds 1
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
   4B42                     136 _dummy_cpct_transparentMaskTable0M0_container::
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
   7260                     177 _dibujarMapa::
                            178 ;src/main.c:113: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   7260 2A D6 69      [16]  179 	ld	hl,(_mapa)
   7263 E5            [11]  180 	push	hl
   7264 21 F0 C0      [10]  181 	ld	hl,#0xC0F0
   7267 E5            [11]  182 	push	hl
   7268 21 2C 28      [10]  183 	ld	hl,#0x282C
   726B E5            [11]  184 	push	hl
   726C 2E 00         [ 7]  185 	ld	l, #0x00
   726E E5            [11]  186 	push	hl
   726F AF            [ 4]  187 	xor	a, a
   7270 F5            [11]  188 	push	af
   7271 33            [ 6]  189 	inc	sp
   7272 CD 53 59      [17]  190 	call	_cpct_etm_drawTileBox2x4
   7275 C9            [10]  191 	ret
   7276                     192 _mapas:
   7276 C0 1D               193 	.dw _g_map1
   7278 E0 16               194 	.dw _g_map2
   727A 00 10               195 	.dw _g_map3
   727C                     196 _spawnX:
   727C 00                  197 	.db #0x00	; 0
   727D 3C                  198 	.db #0x3C	; 60
   727E 47                  199 	.db #0x47	; 71	'G'
   727F 14                  200 	.db #0x14	; 20
   7280 3C                  201 	.db #0x3C	; 60
   7281                     202 _spawnY:
   7281 00                  203 	.db #0x00	; 0
   7282 2C                  204 	.db #0x2C	; 44
   7283 72                  205 	.db #0x72	; 114	'r'
   7284 8A                  206 	.db #0x8A	; 138
   7285 8A                  207 	.db #0x8A	; 138
                            208 ;src/main.c:116: void dibujarProta() {
                            209 ;	---------------------------------
                            210 ; Function dibujarProta
                            211 ; ---------------------------------
   7286                     212 _dibujarProta::
                            213 ;src/main.c:117: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   7286 21 C4 69      [10]  214 	ld	hl, #_prota + 1
   7289 56            [ 7]  215 	ld	d,(hl)
   728A 21 C3 69      [10]  216 	ld	hl, #_prota + 0
   728D 46            [ 7]  217 	ld	b,(hl)
   728E D5            [11]  218 	push	de
   728F 33            [ 6]  219 	inc	sp
   7290 C5            [11]  220 	push	bc
   7291 33            [ 6]  221 	inc	sp
   7292 21 00 C0      [10]  222 	ld	hl,#0xC000
   7295 E5            [11]  223 	push	hl
   7296 CD 5A 64      [17]  224 	call	_cpct_getScreenPtr
   7299 EB            [ 4]  225 	ex	de,hl
                            226 ;src/main.c:118: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   729A ED 4B C7 69   [20]  227 	ld	bc, (#_prota + 4)
   729E 21 00 0E      [10]  228 	ld	hl,#_g_tablatrans
   72A1 E5            [11]  229 	push	hl
   72A2 21 07 16      [10]  230 	ld	hl,#0x1607
   72A5 E5            [11]  231 	push	hl
   72A6 D5            [11]  232 	push	de
   72A7 C5            [11]  233 	push	bc
   72A8 CD 7A 64      [17]  234 	call	_cpct_drawSpriteMaskedAlignedTable
   72AB C9            [10]  235 	ret
                            236 ;src/main.c:121: void borrarProta() {
                            237 ;	---------------------------------
                            238 ; Function borrarProta
                            239 ; ---------------------------------
   72AC                     240 _borrarProta::
   72AC DD E5         [15]  241 	push	ix
   72AE DD 21 00 00   [14]  242 	ld	ix,#0
   72B2 DD 39         [15]  243 	add	ix,sp
   72B4 F5            [11]  244 	push	af
   72B5 3B            [ 6]  245 	dec	sp
                            246 ;src/main.c:123: u8 w = 4 + (prota.px & 1);
   72B6 21 C5 69      [10]  247 	ld	hl, #_prota + 2
   72B9 4E            [ 7]  248 	ld	c,(hl)
   72BA 79            [ 4]  249 	ld	a,c
   72BB E6 01         [ 7]  250 	and	a, #0x01
   72BD 47            [ 4]  251 	ld	b,a
   72BE 04            [ 4]  252 	inc	b
   72BF 04            [ 4]  253 	inc	b
   72C0 04            [ 4]  254 	inc	b
   72C1 04            [ 4]  255 	inc	b
                            256 ;src/main.c:126: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   72C2 21 C6 69      [10]  257 	ld	hl, #_prota + 3
   72C5 5E            [ 7]  258 	ld	e,(hl)
   72C6 CB 4B         [ 8]  259 	bit	1, e
   72C8 28 04         [12]  260 	jr	Z,00103$
   72CA 3E 01         [ 7]  261 	ld	a,#0x01
   72CC 18 02         [12]  262 	jr	00104$
   72CE                     263 00103$:
   72CE 3E 00         [ 7]  264 	ld	a,#0x00
   72D0                     265 00104$:
   72D0 C6 06         [ 7]  266 	add	a, #0x06
   72D2 DD 77 FD      [19]  267 	ld	-3 (ix),a
                            268 ;src/main.c:128: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   72D5 FD 2A D6 69   [20]  269 	ld	iy,(_mapa)
   72D9 16 00         [ 7]  270 	ld	d,#0x00
   72DB 7B            [ 4]  271 	ld	a,e
   72DC C6 E8         [ 7]  272 	add	a,#0xE8
   72DE DD 77 FE      [19]  273 	ld	-2 (ix),a
   72E1 7A            [ 4]  274 	ld	a,d
   72E2 CE FF         [ 7]  275 	adc	a,#0xFF
   72E4 DD 77 FF      [19]  276 	ld	-1 (ix),a
   72E7 DD 6E FE      [19]  277 	ld	l,-2 (ix)
   72EA DD 66 FF      [19]  278 	ld	h,-1 (ix)
   72ED DD CB FF 7E   [20]  279 	bit	7, -1 (ix)
   72F1 28 04         [12]  280 	jr	Z,00105$
   72F3 21 EB FF      [10]  281 	ld	hl,#0xFFEB
   72F6 19            [11]  282 	add	hl,de
   72F7                     283 00105$:
   72F7 CB 2C         [ 8]  284 	sra	h
   72F9 CB 1D         [ 8]  285 	rr	l
   72FB CB 2C         [ 8]  286 	sra	h
   72FD CB 1D         [ 8]  287 	rr	l
   72FF 55            [ 4]  288 	ld	d,l
   7300 CB 39         [ 8]  289 	srl	c
   7302 FD E5         [15]  290 	push	iy
   7304 21 F0 C0      [10]  291 	ld	hl,#0xC0F0
   7307 E5            [11]  292 	push	hl
   7308 3E 28         [ 7]  293 	ld	a,#0x28
   730A F5            [11]  294 	push	af
   730B 33            [ 6]  295 	inc	sp
   730C DD 7E FD      [19]  296 	ld	a,-3 (ix)
   730F F5            [11]  297 	push	af
   7310 33            [ 6]  298 	inc	sp
   7311 C5            [11]  299 	push	bc
   7312 33            [ 6]  300 	inc	sp
   7313 D5            [11]  301 	push	de
   7314 33            [ 6]  302 	inc	sp
   7315 79            [ 4]  303 	ld	a,c
   7316 F5            [11]  304 	push	af
   7317 33            [ 6]  305 	inc	sp
   7318 CD 53 59      [17]  306 	call	_cpct_etm_drawTileBox2x4
   731B DD F9         [10]  307 	ld	sp, ix
   731D DD E1         [14]  308 	pop	ix
   731F C9            [10]  309 	ret
                            310 ;src/main.c:131: void menuFin(){
                            311 ;	---------------------------------
                            312 ; Function menuFin
                            313 ; ---------------------------------
   7320                     314 _menuFin::
                            315 ;src/main.c:134: cpct_clearScreen(0);
   7320 21 00 40      [10]  316 	ld	hl,#0x4000
   7323 E5            [11]  317 	push	hl
   7324 AF            [ 4]  318 	xor	a, a
   7325 F5            [11]  319 	push	af
   7326 33            [ 6]  320 	inc	sp
   7327 26 C0         [ 7]  321 	ld	h, #0xC0
   7329 E5            [11]  322 	push	hl
   732A CD 39 5B      [17]  323 	call	_cpct_memset
                            324 ;src/main.c:136: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   732D 21 18 5A      [10]  325 	ld	hl,#0x5A18
   7330 E5            [11]  326 	push	hl
   7331 21 00 C0      [10]  327 	ld	hl,#0xC000
   7334 E5            [11]  328 	push	hl
   7335 CD 5A 64      [17]  329 	call	_cpct_getScreenPtr
   7338 4D            [ 4]  330 	ld	c,l
   7339 44            [ 4]  331 	ld	b,h
                            332 ;src/main.c:137: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   733A 21 02 00      [10]  333 	ld	hl,#0x0002
   733D E5            [11]  334 	push	hl
   733E C5            [11]  335 	push	bc
   733F 21 4D 73      [10]  336 	ld	hl,#___str_0
   7342 E5            [11]  337 	push	hl
   7343 CD 8A 58      [17]  338 	call	_cpct_drawStringM0
   7346 21 06 00      [10]  339 	ld	hl,#6
   7349 39            [11]  340 	add	hl,sp
   734A F9            [ 6]  341 	ld	sp,hl
                            342 ;src/main.c:139: while(1){}
   734B                     343 00102$:
   734B 18 FE         [12]  344 	jr	00102$
   734D                     345 ___str_0:
   734D 47 41 4D 45 20 4F   346 	.ascii "GAME OVER"
        56 45 52
   7356 00                  347 	.db 0x00
                            348 ;src/main.c:142: void redibujarProta() {
                            349 ;	---------------------------------
                            350 ; Function redibujarProta
                            351 ; ---------------------------------
   7357                     352 _redibujarProta::
                            353 ;src/main.c:143: borrarProta();
   7357 CD AC 72      [17]  354 	call	_borrarProta
                            355 ;src/main.c:144: prota.px = prota.x;
   735A 01 C5 69      [10]  356 	ld	bc,#_prota + 2
   735D 3A C3 69      [13]  357 	ld	a, (#_prota + 0)
   7360 02            [ 7]  358 	ld	(bc),a
                            359 ;src/main.c:145: prota.py = prota.y;
   7361 01 C6 69      [10]  360 	ld	bc,#_prota + 3
   7364 3A C4 69      [13]  361 	ld	a, (#_prota + 1)
   7367 02            [ 7]  362 	ld	(bc),a
                            363 ;src/main.c:146: dibujarProta();
   7368 C3 86 72      [10]  364 	jp  _dibujarProta
                            365 ;src/main.c:149: u8* getTilePtr(u8 x, u8 y) {
                            366 ;	---------------------------------
                            367 ; Function getTilePtr
                            368 ; ---------------------------------
   736B                     369 _getTilePtr::
   736B DD E5         [15]  370 	push	ix
   736D DD 21 00 00   [14]  371 	ld	ix,#0
   7371 DD 39         [15]  372 	add	ix,sp
                            373 ;src/main.c:150: return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
   7373 DD 4E 05      [19]  374 	ld	c,5 (ix)
   7376 06 00         [ 7]  375 	ld	b,#0x00
   7378 79            [ 4]  376 	ld	a,c
   7379 C6 E8         [ 7]  377 	add	a,#0xE8
   737B 5F            [ 4]  378 	ld	e,a
   737C 78            [ 4]  379 	ld	a,b
   737D CE FF         [ 7]  380 	adc	a,#0xFF
   737F 57            [ 4]  381 	ld	d,a
   7380 6B            [ 4]  382 	ld	l, e
   7381 62            [ 4]  383 	ld	h, d
   7382 CB 7A         [ 8]  384 	bit	7, d
   7384 28 04         [12]  385 	jr	Z,00103$
   7386 21 EB FF      [10]  386 	ld	hl,#0xFFEB
   7389 09            [11]  387 	add	hl,bc
   738A                     388 00103$:
   738A CB 2C         [ 8]  389 	sra	h
   738C CB 1D         [ 8]  390 	rr	l
   738E CB 2C         [ 8]  391 	sra	h
   7390 CB 1D         [ 8]  392 	rr	l
   7392 4D            [ 4]  393 	ld	c, l
   7393 44            [ 4]  394 	ld	b, h
   7394 29            [11]  395 	add	hl, hl
   7395 29            [11]  396 	add	hl, hl
   7396 09            [11]  397 	add	hl, bc
   7397 29            [11]  398 	add	hl, hl
   7398 29            [11]  399 	add	hl, hl
   7399 29            [11]  400 	add	hl, hl
   739A 4D            [ 4]  401 	ld	c,l
   739B 44            [ 4]  402 	ld	b,h
   739C 2A D6 69      [16]  403 	ld	hl,(_mapa)
   739F 09            [11]  404 	add	hl,bc
   73A0 DD 4E 04      [19]  405 	ld	c,4 (ix)
   73A3 CB 39         [ 8]  406 	srl	c
   73A5 59            [ 4]  407 	ld	e,c
   73A6 16 00         [ 7]  408 	ld	d,#0x00
   73A8 19            [11]  409 	add	hl,de
   73A9 DD E1         [14]  410 	pop	ix
   73AB C9            [10]  411 	ret
                            412 ;src/main.c:153: u8 checkCollision(int direction) { // check optimization
                            413 ;	---------------------------------
                            414 ; Function checkCollision
                            415 ; ---------------------------------
   73AC                     416 _checkCollision::
   73AC DD E5         [15]  417 	push	ix
   73AE DD 21 00 00   [14]  418 	ld	ix,#0
   73B2 DD 39         [15]  419 	add	ix,sp
   73B4 F5            [11]  420 	push	af
                            421 ;src/main.c:154: u8 *headTile=0, *feetTile=0, *waistTile=0;
   73B5 21 00 00      [10]  422 	ld	hl,#0x0000
   73B8 E3            [19]  423 	ex	(sp), hl
   73B9 11 00 00      [10]  424 	ld	de,#0x0000
   73BC 01 00 00      [10]  425 	ld	bc,#0x0000
                            426 ;src/main.c:156: switch (direction) {
   73BF DD CB 05 7E   [20]  427 	bit	7, 5 (ix)
   73C3 C2 E0 74      [10]  428 	jp	NZ,00105$
   73C6 3E 03         [ 7]  429 	ld	a,#0x03
   73C8 DD BE 04      [19]  430 	cp	a, 4 (ix)
   73CB 3E 00         [ 7]  431 	ld	a,#0x00
   73CD DD 9E 05      [19]  432 	sbc	a, 5 (ix)
   73D0 E2 D5 73      [10]  433 	jp	PO, 00128$
   73D3 EE 80         [ 7]  434 	xor	a, #0x80
   73D5                     435 00128$:
   73D5 FA E0 74      [10]  436 	jp	M,00105$
   73D8 DD 5E 04      [19]  437 	ld	e,4 (ix)
   73DB 16 00         [ 7]  438 	ld	d,#0x00
   73DD 21 E4 73      [10]  439 	ld	hl,#00129$
   73E0 19            [11]  440 	add	hl,de
   73E1 19            [11]  441 	add	hl,de
   73E2 19            [11]  442 	add	hl,de
   73E3 E9            [ 4]  443 	jp	(hl)
   73E4                     444 00129$:
   73E4 C3 F0 73      [10]  445 	jp	00101$
   73E7 C3 3B 74      [10]  446 	jp	00102$
   73EA C3 7C 74      [10]  447 	jp	00103$
   73ED C3 AF 74      [10]  448 	jp	00104$
                            449 ;src/main.c:157: case 0:
   73F0                     450 00101$:
                            451 ;src/main.c:158: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   73F0 21 C4 69      [10]  452 	ld	hl, #(_prota + 0x0001) + 0
   73F3 5E            [ 7]  453 	ld	e,(hl)
   73F4 21 C3 69      [10]  454 	ld	hl, #_prota + 0
   73F7 4E            [ 7]  455 	ld	c,(hl)
   73F8 0C            [ 4]  456 	inc	c
   73F9 0C            [ 4]  457 	inc	c
   73FA 0C            [ 4]  458 	inc	c
   73FB 0C            [ 4]  459 	inc	c
   73FC 7B            [ 4]  460 	ld	a,e
   73FD F5            [11]  461 	push	af
   73FE 33            [ 6]  462 	inc	sp
   73FF 79            [ 4]  463 	ld	a,c
   7400 F5            [11]  464 	push	af
   7401 33            [ 6]  465 	inc	sp
   7402 CD 6B 73      [17]  466 	call	_getTilePtr
   7405 F1            [10]  467 	pop	af
   7406 33            [ 6]  468 	inc	sp
   7407 33            [ 6]  469 	inc	sp
   7408 E5            [11]  470 	push	hl
                            471 ;src/main.c:159: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   7409 3A C4 69      [13]  472 	ld	a, (#(_prota + 0x0001) + 0)
   740C C6 14         [ 7]  473 	add	a, #0x14
   740E 4F            [ 4]  474 	ld	c,a
   740F 21 C3 69      [10]  475 	ld	hl, #_prota + 0
   7412 46            [ 7]  476 	ld	b,(hl)
   7413 04            [ 4]  477 	inc	b
   7414 04            [ 4]  478 	inc	b
   7415 04            [ 4]  479 	inc	b
   7416 04            [ 4]  480 	inc	b
   7417 79            [ 4]  481 	ld	a,c
   7418 F5            [11]  482 	push	af
   7419 33            [ 6]  483 	inc	sp
   741A C5            [11]  484 	push	bc
   741B 33            [ 6]  485 	inc	sp
   741C CD 6B 73      [17]  486 	call	_getTilePtr
   741F F1            [10]  487 	pop	af
   7420 EB            [ 4]  488 	ex	de,hl
                            489 ;src/main.c:160: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   7421 3A C4 69      [13]  490 	ld	a, (#(_prota + 0x0001) + 0)
   7424 C6 0B         [ 7]  491 	add	a, #0x0B
   7426 47            [ 4]  492 	ld	b,a
   7427 3A C3 69      [13]  493 	ld	a, (#_prota + 0)
   742A C6 04         [ 7]  494 	add	a, #0x04
   742C D5            [11]  495 	push	de
   742D C5            [11]  496 	push	bc
   742E 33            [ 6]  497 	inc	sp
   742F F5            [11]  498 	push	af
   7430 33            [ 6]  499 	inc	sp
   7431 CD 6B 73      [17]  500 	call	_getTilePtr
   7434 F1            [10]  501 	pop	af
   7435 4D            [ 4]  502 	ld	c,l
   7436 44            [ 4]  503 	ld	b,h
   7437 D1            [10]  504 	pop	de
                            505 ;src/main.c:161: break;
   7438 C3 E0 74      [10]  506 	jp	00105$
                            507 ;src/main.c:162: case 1:
   743B                     508 00102$:
                            509 ;src/main.c:163: headTile  = getTilePtr(prota.x - 1, prota.y);
   743B 21 C4 69      [10]  510 	ld	hl, #(_prota + 0x0001) + 0
   743E 56            [ 7]  511 	ld	d,(hl)
   743F 21 C3 69      [10]  512 	ld	hl, #_prota + 0
   7442 46            [ 7]  513 	ld	b,(hl)
   7443 05            [ 4]  514 	dec	b
   7444 D5            [11]  515 	push	de
   7445 33            [ 6]  516 	inc	sp
   7446 C5            [11]  517 	push	bc
   7447 33            [ 6]  518 	inc	sp
   7448 CD 6B 73      [17]  519 	call	_getTilePtr
   744B F1            [10]  520 	pop	af
   744C 33            [ 6]  521 	inc	sp
   744D 33            [ 6]  522 	inc	sp
   744E E5            [11]  523 	push	hl
                            524 ;src/main.c:164: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
   744F 3A C4 69      [13]  525 	ld	a, (#(_prota + 0x0001) + 0)
   7452 C6 14         [ 7]  526 	add	a, #0x14
   7454 57            [ 4]  527 	ld	d,a
   7455 21 C3 69      [10]  528 	ld	hl, #_prota + 0
   7458 46            [ 7]  529 	ld	b,(hl)
   7459 05            [ 4]  530 	dec	b
   745A D5            [11]  531 	push	de
   745B 33            [ 6]  532 	inc	sp
   745C C5            [11]  533 	push	bc
   745D 33            [ 6]  534 	inc	sp
   745E CD 6B 73      [17]  535 	call	_getTilePtr
   7461 F1            [10]  536 	pop	af
   7462 EB            [ 4]  537 	ex	de,hl
                            538 ;src/main.c:165: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
   7463 3A C4 69      [13]  539 	ld	a, (#(_prota + 0x0001) + 0)
   7466 C6 0B         [ 7]  540 	add	a, #0x0B
   7468 47            [ 4]  541 	ld	b,a
   7469 3A C3 69      [13]  542 	ld	a, (#_prota + 0)
   746C C6 FF         [ 7]  543 	add	a,#0xFF
   746E D5            [11]  544 	push	de
   746F C5            [11]  545 	push	bc
   7470 33            [ 6]  546 	inc	sp
   7471 F5            [11]  547 	push	af
   7472 33            [ 6]  548 	inc	sp
   7473 CD 6B 73      [17]  549 	call	_getTilePtr
   7476 F1            [10]  550 	pop	af
   7477 4D            [ 4]  551 	ld	c,l
   7478 44            [ 4]  552 	ld	b,h
   7479 D1            [10]  553 	pop	de
                            554 ;src/main.c:166: break;
   747A 18 64         [12]  555 	jr	00105$
                            556 ;src/main.c:167: case 2:
   747C                     557 00103$:
                            558 ;src/main.c:168: headTile   = getTilePtr(prota.x, prota.y - 2);
   747C 3A C4 69      [13]  559 	ld	a, (#(_prota + 0x0001) + 0)
   747F C6 FE         [ 7]  560 	add	a,#0xFE
   7481 21 C3 69      [10]  561 	ld	hl, #_prota + 0
   7484 56            [ 7]  562 	ld	d,(hl)
   7485 C5            [11]  563 	push	bc
   7486 F5            [11]  564 	push	af
   7487 33            [ 6]  565 	inc	sp
   7488 D5            [11]  566 	push	de
   7489 33            [ 6]  567 	inc	sp
   748A CD 6B 73      [17]  568 	call	_getTilePtr
   748D F1            [10]  569 	pop	af
   748E C1            [10]  570 	pop	bc
   748F 33            [ 6]  571 	inc	sp
   7490 33            [ 6]  572 	inc	sp
   7491 E5            [11]  573 	push	hl
                            574 ;src/main.c:169: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
   7492 21 C4 69      [10]  575 	ld	hl, #(_prota + 0x0001) + 0
   7495 56            [ 7]  576 	ld	d,(hl)
   7496 15            [ 4]  577 	dec	d
   7497 15            [ 4]  578 	dec	d
   7498 3A C3 69      [13]  579 	ld	a, (#_prota + 0)
   749B C6 03         [ 7]  580 	add	a, #0x03
   749D C5            [11]  581 	push	bc
   749E D5            [11]  582 	push	de
   749F 33            [ 6]  583 	inc	sp
   74A0 F5            [11]  584 	push	af
   74A1 33            [ 6]  585 	inc	sp
   74A2 CD 6B 73      [17]  586 	call	_getTilePtr
   74A5 F1            [10]  587 	pop	af
   74A6 EB            [ 4]  588 	ex	de,hl
   74A7 C1            [10]  589 	pop	bc
                            590 ;src/main.c:170: *waistTile = 0;
   74A8 21 00 00      [10]  591 	ld	hl,#0x0000
   74AB 36 00         [10]  592 	ld	(hl),#0x00
                            593 ;src/main.c:171: break;
   74AD 18 31         [12]  594 	jr	00105$
                            595 ;src/main.c:172: case 3:
   74AF                     596 00104$:
                            597 ;src/main.c:173: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
   74AF 3A C4 69      [13]  598 	ld	a, (#(_prota + 0x0001) + 0)
   74B2 C6 16         [ 7]  599 	add	a, #0x16
   74B4 21 C3 69      [10]  600 	ld	hl, #_prota + 0
   74B7 56            [ 7]  601 	ld	d,(hl)
   74B8 C5            [11]  602 	push	bc
   74B9 F5            [11]  603 	push	af
   74BA 33            [ 6]  604 	inc	sp
   74BB D5            [11]  605 	push	de
   74BC 33            [ 6]  606 	inc	sp
   74BD CD 6B 73      [17]  607 	call	_getTilePtr
   74C0 F1            [10]  608 	pop	af
   74C1 C1            [10]  609 	pop	bc
   74C2 33            [ 6]  610 	inc	sp
   74C3 33            [ 6]  611 	inc	sp
   74C4 E5            [11]  612 	push	hl
                            613 ;src/main.c:174: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   74C5 3A C4 69      [13]  614 	ld	a, (#(_prota + 0x0001) + 0)
   74C8 C6 16         [ 7]  615 	add	a, #0x16
   74CA 57            [ 4]  616 	ld	d,a
   74CB 3A C3 69      [13]  617 	ld	a, (#_prota + 0)
   74CE C6 03         [ 7]  618 	add	a, #0x03
   74D0 C5            [11]  619 	push	bc
   74D1 D5            [11]  620 	push	de
   74D2 33            [ 6]  621 	inc	sp
   74D3 F5            [11]  622 	push	af
   74D4 33            [ 6]  623 	inc	sp
   74D5 CD 6B 73      [17]  624 	call	_getTilePtr
   74D8 F1            [10]  625 	pop	af
   74D9 EB            [ 4]  626 	ex	de,hl
   74DA C1            [10]  627 	pop	bc
                            628 ;src/main.c:175: *waistTile = 0;
   74DB 21 00 00      [10]  629 	ld	hl,#0x0000
   74DE 36 00         [10]  630 	ld	(hl),#0x00
                            631 ;src/main.c:177: }
   74E0                     632 00105$:
                            633 ;src/main.c:179: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   74E0 E1            [10]  634 	pop	hl
   74E1 E5            [11]  635 	push	hl
   74E2 6E            [ 7]  636 	ld	l,(hl)
   74E3 3E 02         [ 7]  637 	ld	a,#0x02
   74E5 95            [ 4]  638 	sub	a, l
   74E6 38 0E         [12]  639 	jr	C,00106$
   74E8 1A            [ 7]  640 	ld	a,(de)
   74E9 5F            [ 4]  641 	ld	e,a
   74EA 3E 02         [ 7]  642 	ld	a,#0x02
   74EC 93            [ 4]  643 	sub	a, e
   74ED 38 07         [12]  644 	jr	C,00106$
   74EF 0A            [ 7]  645 	ld	a,(bc)
   74F0 4F            [ 4]  646 	ld	c,a
   74F1 3E 02         [ 7]  647 	ld	a,#0x02
   74F3 91            [ 4]  648 	sub	a, c
   74F4 30 04         [12]  649 	jr	NC,00107$
   74F6                     650 00106$:
                            651 ;src/main.c:180: return 1;
   74F6 2E 01         [ 7]  652 	ld	l,#0x01
   74F8 18 02         [12]  653 	jr	00110$
   74FA                     654 00107$:
                            655 ;src/main.c:182: return 0;
   74FA 2E 00         [ 7]  656 	ld	l,#0x00
   74FC                     657 00110$:
   74FC DD F9         [10]  658 	ld	sp, ix
   74FE DD E1         [14]  659 	pop	ix
   7500 C9            [10]  660 	ret
                            661 ;src/main.c:185: void dibujarEnemigo(TEnemy *enemy) {
                            662 ;	---------------------------------
                            663 ; Function dibujarEnemigo
                            664 ; ---------------------------------
   7501                     665 _dibujarEnemigo::
   7501 DD E5         [15]  666 	push	ix
   7503 DD 21 00 00   [14]  667 	ld	ix,#0
   7507 DD 39         [15]  668 	add	ix,sp
                            669 ;src/main.c:186: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   7509 DD 4E 04      [19]  670 	ld	c,4 (ix)
   750C DD 46 05      [19]  671 	ld	b,5 (ix)
   750F 69            [ 4]  672 	ld	l, c
   7510 60            [ 4]  673 	ld	h, b
   7511 23            [ 6]  674 	inc	hl
   7512 56            [ 7]  675 	ld	d,(hl)
   7513 0A            [ 7]  676 	ld	a,(bc)
   7514 C5            [11]  677 	push	bc
   7515 D5            [11]  678 	push	de
   7516 33            [ 6]  679 	inc	sp
   7517 F5            [11]  680 	push	af
   7518 33            [ 6]  681 	inc	sp
   7519 21 00 C0      [10]  682 	ld	hl,#0xC000
   751C E5            [11]  683 	push	hl
   751D CD 5A 64      [17]  684 	call	_cpct_getScreenPtr
   7520 EB            [ 4]  685 	ex	de,hl
                            686 ;src/main.c:187: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   7521 E1            [10]  687 	pop	hl
   7522 01 04 00      [10]  688 	ld	bc, #0x0004
   7525 09            [11]  689 	add	hl, bc
   7526 4E            [ 7]  690 	ld	c,(hl)
   7527 23            [ 6]  691 	inc	hl
   7528 46            [ 7]  692 	ld	b,(hl)
   7529 21 00 0E      [10]  693 	ld	hl,#_g_tablatrans
   752C E5            [11]  694 	push	hl
   752D 21 04 16      [10]  695 	ld	hl,#0x1604
   7530 E5            [11]  696 	push	hl
   7531 D5            [11]  697 	push	de
   7532 C5            [11]  698 	push	bc
   7533 CD 7A 64      [17]  699 	call	_cpct_drawSpriteMaskedAlignedTable
   7536 DD E1         [14]  700 	pop	ix
   7538 C9            [10]  701 	ret
                            702 ;src/main.c:190: void dibujarExplosion(TEnemy *enemy) {
                            703 ;	---------------------------------
                            704 ; Function dibujarExplosion
                            705 ; ---------------------------------
   7539                     706 _dibujarExplosion::
   7539 DD E5         [15]  707 	push	ix
   753B DD 21 00 00   [14]  708 	ld	ix,#0
   753F DD 39         [15]  709 	add	ix,sp
                            710 ;src/main.c:191: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   7541 DD 4E 04      [19]  711 	ld	c,4 (ix)
   7544 DD 46 05      [19]  712 	ld	b,5 (ix)
   7547 69            [ 4]  713 	ld	l, c
   7548 60            [ 4]  714 	ld	h, b
   7549 23            [ 6]  715 	inc	hl
   754A 56            [ 7]  716 	ld	d,(hl)
   754B 0A            [ 7]  717 	ld	a,(bc)
   754C 47            [ 4]  718 	ld	b,a
   754D D5            [11]  719 	push	de
   754E 33            [ 6]  720 	inc	sp
   754F C5            [11]  721 	push	bc
   7550 33            [ 6]  722 	inc	sp
   7551 21 00 C0      [10]  723 	ld	hl,#0xC000
   7554 E5            [11]  724 	push	hl
   7555 CD 5A 64      [17]  725 	call	_cpct_getScreenPtr
   7558 4D            [ 4]  726 	ld	c,l
   7559 44            [ 4]  727 	ld	b,h
                            728 ;src/main.c:192: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   755A 11 00 0E      [10]  729 	ld	de,#_g_tablatrans+0
   755D D5            [11]  730 	push	de
   755E 21 04 16      [10]  731 	ld	hl,#0x1604
   7561 E5            [11]  732 	push	hl
   7562 C5            [11]  733 	push	bc
   7563 21 A8 25      [10]  734 	ld	hl,#_g_explosion
   7566 E5            [11]  735 	push	hl
   7567 CD 7A 64      [17]  736 	call	_cpct_drawSpriteMaskedAlignedTable
   756A DD E1         [14]  737 	pop	ix
   756C C9            [10]  738 	ret
                            739 ;src/main.c:195: void borrarExplosion() {
                            740 ;	---------------------------------
                            741 ; Function borrarExplosion
                            742 ; ---------------------------------
   756D                     743 _borrarExplosion::
   756D DD E5         [15]  744 	push	ix
   756F DD 21 00 00   [14]  745 	ld	ix,#0
   7573 DD 39         [15]  746 	add	ix,sp
   7575 F5            [11]  747 	push	af
   7576 3B            [ 6]  748 	dec	sp
                            749 ;src/main.c:196: u8 w = 4 + (enemy->px & 1);
   7577 21 B9 64      [10]  750 	ld	hl, #_enemy + 2
   757A 4E            [ 7]  751 	ld	c,(hl)
   757B 79            [ 4]  752 	ld	a,c
   757C E6 01         [ 7]  753 	and	a, #0x01
   757E 47            [ 4]  754 	ld	b,a
   757F 04            [ 4]  755 	inc	b
   7580 04            [ 4]  756 	inc	b
   7581 04            [ 4]  757 	inc	b
   7582 04            [ 4]  758 	inc	b
                            759 ;src/main.c:199: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   7583 21 BA 64      [10]  760 	ld	hl, #_enemy + 3
   7586 5E            [ 7]  761 	ld	e,(hl)
   7587 CB 4B         [ 8]  762 	bit	1, e
   7589 28 04         [12]  763 	jr	Z,00103$
   758B 3E 01         [ 7]  764 	ld	a,#0x01
   758D 18 02         [12]  765 	jr	00104$
   758F                     766 00103$:
   758F 3E 00         [ 7]  767 	ld	a,#0x00
   7591                     768 00104$:
   7591 C6 07         [ 7]  769 	add	a, #0x07
   7593 DD 77 FD      [19]  770 	ld	-3 (ix),a
                            771 ;src/main.c:201: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   7596 FD 2A D6 69   [20]  772 	ld	iy,(_mapa)
   759A 16 00         [ 7]  773 	ld	d,#0x00
   759C 7B            [ 4]  774 	ld	a,e
   759D C6 E8         [ 7]  775 	add	a,#0xE8
   759F DD 77 FE      [19]  776 	ld	-2 (ix),a
   75A2 7A            [ 4]  777 	ld	a,d
   75A3 CE FF         [ 7]  778 	adc	a,#0xFF
   75A5 DD 77 FF      [19]  779 	ld	-1 (ix),a
   75A8 DD 6E FE      [19]  780 	ld	l,-2 (ix)
   75AB DD 66 FF      [19]  781 	ld	h,-1 (ix)
   75AE DD CB FF 7E   [20]  782 	bit	7, -1 (ix)
   75B2 28 04         [12]  783 	jr	Z,00105$
   75B4 21 EB FF      [10]  784 	ld	hl,#0xFFEB
   75B7 19            [11]  785 	add	hl,de
   75B8                     786 00105$:
   75B8 CB 2C         [ 8]  787 	sra	h
   75BA CB 1D         [ 8]  788 	rr	l
   75BC CB 2C         [ 8]  789 	sra	h
   75BE CB 1D         [ 8]  790 	rr	l
   75C0 55            [ 4]  791 	ld	d,l
   75C1 CB 39         [ 8]  792 	srl	c
   75C3 FD E5         [15]  793 	push	iy
   75C5 21 F0 C0      [10]  794 	ld	hl,#0xC0F0
   75C8 E5            [11]  795 	push	hl
   75C9 3E 28         [ 7]  796 	ld	a,#0x28
   75CB F5            [11]  797 	push	af
   75CC 33            [ 6]  798 	inc	sp
   75CD DD 7E FD      [19]  799 	ld	a,-3 (ix)
   75D0 F5            [11]  800 	push	af
   75D1 33            [ 6]  801 	inc	sp
   75D2 C5            [11]  802 	push	bc
   75D3 33            [ 6]  803 	inc	sp
   75D4 D5            [11]  804 	push	de
   75D5 33            [ 6]  805 	inc	sp
   75D6 79            [ 4]  806 	ld	a,c
   75D7 F5            [11]  807 	push	af
   75D8 33            [ 6]  808 	inc	sp
   75D9 CD 53 59      [17]  809 	call	_cpct_etm_drawTileBox2x4
   75DC DD F9         [10]  810 	ld	sp, ix
   75DE DD E1         [14]  811 	pop	ix
   75E0 C9            [10]  812 	ret
                            813 ;src/main.c:205: void borrarEnemigo(TEnemy *enemy) {
                            814 ;	---------------------------------
                            815 ; Function borrarEnemigo
                            816 ; ---------------------------------
   75E1                     817 _borrarEnemigo::
   75E1 DD E5         [15]  818 	push	ix
   75E3 DD 21 00 00   [14]  819 	ld	ix,#0
   75E7 DD 39         [15]  820 	add	ix,sp
   75E9 21 FA FF      [10]  821 	ld	hl,#-6
   75EC 39            [11]  822 	add	hl,sp
   75ED F9            [ 6]  823 	ld	sp,hl
                            824 ;src/main.c:207: u8 w = 4 + (enemy->px & 1);
   75EE DD 4E 04      [19]  825 	ld	c,4 (ix)
   75F1 DD 46 05      [19]  826 	ld	b,5 (ix)
   75F4 69            [ 4]  827 	ld	l, c
   75F5 60            [ 4]  828 	ld	h, b
   75F6 23            [ 6]  829 	inc	hl
   75F7 23            [ 6]  830 	inc	hl
   75F8 5E            [ 7]  831 	ld	e,(hl)
   75F9 7B            [ 4]  832 	ld	a,e
   75FA E6 01         [ 7]  833 	and	a, #0x01
   75FC C6 04         [ 7]  834 	add	a, #0x04
   75FE DD 77 FB      [19]  835 	ld	-5 (ix),a
                            836 ;src/main.c:210: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   7601 69            [ 4]  837 	ld	l, c
   7602 60            [ 4]  838 	ld	h, b
   7603 23            [ 6]  839 	inc	hl
   7604 23            [ 6]  840 	inc	hl
   7605 23            [ 6]  841 	inc	hl
   7606 56            [ 7]  842 	ld	d,(hl)
   7607 CB 4A         [ 8]  843 	bit	1, d
   7609 28 04         [12]  844 	jr	Z,00103$
   760B 3E 01         [ 7]  845 	ld	a,#0x01
   760D 18 02         [12]  846 	jr	00104$
   760F                     847 00103$:
   760F 3E 00         [ 7]  848 	ld	a,#0x00
   7611                     849 00104$:
   7611 C6 07         [ 7]  850 	add	a, #0x07
   7613 DD 77 FA      [19]  851 	ld	-6 (ix),a
                            852 ;src/main.c:212: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   7616 FD 2A D6 69   [20]  853 	ld	iy,(_mapa)
   761A DD 72 FC      [19]  854 	ld	-4 (ix),d
   761D DD 36 FD 00   [19]  855 	ld	-3 (ix),#0x00
   7621 DD 7E FC      [19]  856 	ld	a,-4 (ix)
   7624 C6 E8         [ 7]  857 	add	a,#0xE8
   7626 DD 77 FE      [19]  858 	ld	-2 (ix),a
   7629 DD 7E FD      [19]  859 	ld	a,-3 (ix)
   762C CE FF         [ 7]  860 	adc	a,#0xFF
   762E DD 77 FF      [19]  861 	ld	-1 (ix),a
   7631 DD 56 FE      [19]  862 	ld	d,-2 (ix)
   7634 DD 6E FF      [19]  863 	ld	l,-1 (ix)
   7637 DD CB FF 7E   [20]  864 	bit	7, -1 (ix)
   763B 28 0C         [12]  865 	jr	Z,00105$
   763D DD 7E FC      [19]  866 	ld	a,-4 (ix)
   7640 C6 EB         [ 7]  867 	add	a, #0xEB
   7642 57            [ 4]  868 	ld	d,a
   7643 DD 7E FD      [19]  869 	ld	a,-3 (ix)
   7646 CE FF         [ 7]  870 	adc	a, #0xFF
   7648 6F            [ 4]  871 	ld	l,a
   7649                     872 00105$:
   7649 CB 2D         [ 8]  873 	sra	l
   764B CB 1A         [ 8]  874 	rr	d
   764D CB 2D         [ 8]  875 	sra	l
   764F CB 1A         [ 8]  876 	rr	d
   7651 CB 3B         [ 8]  877 	srl	e
   7653 C5            [11]  878 	push	bc
   7654 FD E5         [15]  879 	push	iy
   7656 21 F0 C0      [10]  880 	ld	hl,#0xC0F0
   7659 E5            [11]  881 	push	hl
   765A 3E 28         [ 7]  882 	ld	a,#0x28
   765C F5            [11]  883 	push	af
   765D 33            [ 6]  884 	inc	sp
   765E DD 66 FA      [19]  885 	ld	h,-6 (ix)
   7661 DD 6E FB      [19]  886 	ld	l,-5 (ix)
   7664 E5            [11]  887 	push	hl
   7665 D5            [11]  888 	push	de
   7666 CD 53 59      [17]  889 	call	_cpct_etm_drawTileBox2x4
   7669 C1            [10]  890 	pop	bc
                            891 ;src/main.c:214: enemy->mover = NO;
   766A 21 06 00      [10]  892 	ld	hl,#0x0006
   766D 09            [11]  893 	add	hl,bc
   766E 36 00         [10]  894 	ld	(hl),#0x00
   7670 DD F9         [10]  895 	ld	sp, ix
   7672 DD E1         [14]  896 	pop	ix
   7674 C9            [10]  897 	ret
                            898 ;src/main.c:217: void redibujarEnemigo(TEnemy *enemy) {
                            899 ;	---------------------------------
                            900 ; Function redibujarEnemigo
                            901 ; ---------------------------------
   7675                     902 _redibujarEnemigo::
   7675 DD E5         [15]  903 	push	ix
   7677 DD 21 00 00   [14]  904 	ld	ix,#0
   767B DD 39         [15]  905 	add	ix,sp
                            906 ;src/main.c:218: borrarEnemigo(enemy);
   767D DD 6E 04      [19]  907 	ld	l,4 (ix)
   7680 DD 66 05      [19]  908 	ld	h,5 (ix)
   7683 E5            [11]  909 	push	hl
   7684 CD E1 75      [17]  910 	call	_borrarEnemigo
   7687 F1            [10]  911 	pop	af
                            912 ;src/main.c:219: enemy->px = enemy->x;
   7688 DD 4E 04      [19]  913 	ld	c,4 (ix)
   768B DD 46 05      [19]  914 	ld	b,5 (ix)
   768E 59            [ 4]  915 	ld	e, c
   768F 50            [ 4]  916 	ld	d, b
   7690 13            [ 6]  917 	inc	de
   7691 13            [ 6]  918 	inc	de
   7692 0A            [ 7]  919 	ld	a,(bc)
   7693 12            [ 7]  920 	ld	(de),a
                            921 ;src/main.c:220: enemy->py = enemy->y;
   7694 59            [ 4]  922 	ld	e, c
   7695 50            [ 4]  923 	ld	d, b
   7696 13            [ 6]  924 	inc	de
   7697 13            [ 6]  925 	inc	de
   7698 13            [ 6]  926 	inc	de
   7699 69            [ 4]  927 	ld	l, c
   769A 60            [ 4]  928 	ld	h, b
   769B 23            [ 6]  929 	inc	hl
   769C 7E            [ 7]  930 	ld	a,(hl)
   769D 12            [ 7]  931 	ld	(de),a
                            932 ;src/main.c:221: dibujarEnemigo(enemy);
   769E C5            [11]  933 	push	bc
   769F CD 01 75      [17]  934 	call	_dibujarEnemigo
   76A2 F1            [10]  935 	pop	af
   76A3 DD E1         [14]  936 	pop	ix
   76A5 C9            [10]  937 	ret
                            938 ;src/main.c:224: u8 checkEnemyCollision(int direction, TEnemy *enemy){
                            939 ;	---------------------------------
                            940 ; Function checkEnemyCollision
                            941 ; ---------------------------------
   76A6                     942 _checkEnemyCollision::
   76A6 DD E5         [15]  943 	push	ix
   76A8 DD 21 00 00   [14]  944 	ld	ix,#0
   76AC DD 39         [15]  945 	add	ix,sp
   76AE 21 F7 FF      [10]  946 	ld	hl,#-9
   76B1 39            [11]  947 	add	hl,sp
   76B2 F9            [ 6]  948 	ld	sp,hl
                            949 ;src/main.c:226: u8 colisiona = 1;
   76B3 DD 36 F7 01   [19]  950 	ld	-9 (ix),#0x01
                            951 ;src/main.c:228: switch (direction) {
   76B7 DD CB 05 7E   [20]  952 	bit	7, 5 (ix)
   76BB C2 6E 7A      [10]  953 	jp	NZ,00165$
   76BE 3E 03         [ 7]  954 	ld	a,#0x03
   76C0 DD BE 04      [19]  955 	cp	a, 4 (ix)
   76C3 3E 00         [ 7]  956 	ld	a,#0x00
   76C5 DD 9E 05      [19]  957 	sbc	a, 5 (ix)
   76C8 E2 CD 76      [10]  958 	jp	PO, 00272$
   76CB EE 80         [ 7]  959 	xor	a, #0x80
   76CD                     960 00272$:
   76CD FA 6E 7A      [10]  961 	jp	M,00165$
                            962 ;src/main.c:230: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   76D0 DD 4E 06      [19]  963 	ld	c,6 (ix)
   76D3 DD 46 07      [19]  964 	ld	b,7 (ix)
   76D6 0A            [ 7]  965 	ld	a,(bc)
   76D7 5F            [ 4]  966 	ld	e,a
   76D8 21 01 00      [10]  967 	ld	hl,#0x0001
   76DB 09            [11]  968 	add	hl,bc
   76DC DD 75 F8      [19]  969 	ld	-8 (ix),l
   76DF DD 74 F9      [19]  970 	ld	-7 (ix),h
   76E2 DD 6E F8      [19]  971 	ld	l,-8 (ix)
   76E5 DD 66 F9      [19]  972 	ld	h,-7 (ix)
   76E8 56            [ 7]  973 	ld	d,(hl)
                            974 ;src/main.c:243: enemy->muerto = SI;
   76E9 21 08 00      [10]  975 	ld	hl,#0x0008
   76EC 09            [11]  976 	add	hl,bc
   76ED DD 75 FA      [19]  977 	ld	-6 (ix),l
   76F0 DD 74 FB      [19]  978 	ld	-5 (ix),h
                            979 ;src/main.c:250: enemy->mira = M_izquierda;
   76F3 21 07 00      [10]  980 	ld	hl,#0x0007
   76F6 09            [11]  981 	add	hl,bc
   76F7 DD 75 FC      [19]  982 	ld	-4 (ix),l
   76FA DD 74 FD      [19]  983 	ld	-3 (ix),h
                            984 ;src/main.c:228: switch (direction) {
   76FD D5            [11]  985 	push	de
   76FE DD 5E 04      [19]  986 	ld	e,4 (ix)
   7701 16 00         [ 7]  987 	ld	d,#0x00
   7703 21 0B 77      [10]  988 	ld	hl,#00273$
   7706 19            [11]  989 	add	hl,de
   7707 19            [11]  990 	add	hl,de
   7708 19            [11]  991 	add	hl,de
   7709 D1            [10]  992 	pop	de
   770A E9            [ 4]  993 	jp	(hl)
   770B                     994 00273$:
   770B C3 17 77      [10]  995 	jp	00101$
   770E C3 F0 77      [10]  996 	jp	00117$
   7711 C3 C5 78      [10]  997 	jp	00133$
   7714 C3 94 79      [10]  998 	jp	00149$
                            999 ;src/main.c:229: case 0:
   7717                    1000 00101$:
                           1001 ;src/main.c:230: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   7717 7B            [ 4] 1002 	ld	a,e
   7718 C6 05         [ 7] 1003 	add	a, #0x05
   771A C5            [11] 1004 	push	bc
   771B D5            [11] 1005 	push	de
   771C 33            [ 6] 1006 	inc	sp
   771D F5            [11] 1007 	push	af
   771E 33            [ 6] 1008 	inc	sp
   771F CD 6B 73      [17] 1009 	call	_getTilePtr
   7722 F1            [10] 1010 	pop	af
   7723 C1            [10] 1011 	pop	bc
   7724 5E            [ 7] 1012 	ld	e,(hl)
   7725 3E 02         [ 7] 1013 	ld	a,#0x02
   7727 93            [ 4] 1014 	sub	a, e
   7728 DA E5 77      [10] 1015 	jp	C,00113$
                           1016 ;src/main.c:231: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   772B DD 6E F8      [19] 1017 	ld	l,-8 (ix)
   772E DD 66 F9      [19] 1018 	ld	h,-7 (ix)
   7731 7E            [ 7] 1019 	ld	a,(hl)
   7732 C6 0B         [ 7] 1020 	add	a, #0x0B
   7734 57            [ 4] 1021 	ld	d,a
   7735 0A            [ 7] 1022 	ld	a,(bc)
   7736 C6 05         [ 7] 1023 	add	a, #0x05
   7738 C5            [11] 1024 	push	bc
   7739 D5            [11] 1025 	push	de
   773A 33            [ 6] 1026 	inc	sp
   773B F5            [11] 1027 	push	af
   773C 33            [ 6] 1028 	inc	sp
   773D CD 6B 73      [17] 1029 	call	_getTilePtr
   7740 F1            [10] 1030 	pop	af
   7741 C1            [10] 1031 	pop	bc
   7742 5E            [ 7] 1032 	ld	e,(hl)
   7743 3E 02         [ 7] 1033 	ld	a,#0x02
   7745 93            [ 4] 1034 	sub	a, e
   7746 DA E5 77      [10] 1035 	jp	C,00113$
                           1036 ;src/main.c:232: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   7749 DD 6E F8      [19] 1037 	ld	l,-8 (ix)
   774C DD 66 F9      [19] 1038 	ld	h,-7 (ix)
   774F 7E            [ 7] 1039 	ld	a,(hl)
   7750 C6 16         [ 7] 1040 	add	a, #0x16
   7752 57            [ 4] 1041 	ld	d,a
   7753 0A            [ 7] 1042 	ld	a,(bc)
   7754 C6 05         [ 7] 1043 	add	a, #0x05
   7756 C5            [11] 1044 	push	bc
   7757 D5            [11] 1045 	push	de
   7758 33            [ 6] 1046 	inc	sp
   7759 F5            [11] 1047 	push	af
   775A 33            [ 6] 1048 	inc	sp
   775B CD 6B 73      [17] 1049 	call	_getTilePtr
   775E F1            [10] 1050 	pop	af
   775F C1            [10] 1051 	pop	bc
   7760 5E            [ 7] 1052 	ld	e,(hl)
   7761 3E 02         [ 7] 1053 	ld	a,#0x02
   7763 93            [ 4] 1054 	sub	a, e
   7764 DA E5 77      [10] 1055 	jp	C,00113$
                           1056 ;src/main.c:234: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   7767 21 CC 69      [10] 1057 	ld	hl, #_cu + 1
   776A 5E            [ 7] 1058 	ld	e,(hl)
   776B 16 00         [ 7] 1059 	ld	d,#0x00
   776D 21 04 00      [10] 1060 	ld	hl,#0x0004
   7770 19            [11] 1061 	add	hl,de
   7771 DD 75 FE      [19] 1062 	ld	-2 (ix),l
   7774 DD 74 FF      [19] 1063 	ld	-1 (ix),h
   7777 DD 6E F8      [19] 1064 	ld	l,-8 (ix)
   777A DD 66 F9      [19] 1065 	ld	h,-7 (ix)
   777D 6E            [ 7] 1066 	ld	l,(hl)
   777E 26 00         [ 7] 1067 	ld	h,#0x00
   7780 DD 7E FE      [19] 1068 	ld	a,-2 (ix)
   7783 95            [ 4] 1069 	sub	a, l
   7784 DD 7E FF      [19] 1070 	ld	a,-1 (ix)
   7787 9C            [ 4] 1071 	sbc	a, h
   7788 E2 8D 77      [10] 1072 	jp	PO, 00274$
   778B EE 80         [ 7] 1073 	xor	a, #0x80
   778D                    1074 00274$:
   778D FA A2 77      [10] 1075 	jp	M,00108$
   7790 D5            [11] 1076 	push	de
   7791 11 16 00      [10] 1077 	ld	de,#0x0016
   7794 19            [11] 1078 	add	hl, de
   7795 D1            [10] 1079 	pop	de
   7796 7D            [ 4] 1080 	ld	a,l
   7797 93            [ 4] 1081 	sub	a, e
   7798 7C            [ 4] 1082 	ld	a,h
   7799 9A            [ 4] 1083 	sbc	a, d
   779A E2 9F 77      [10] 1084 	jp	PO, 00275$
   779D EE 80         [ 7] 1085 	xor	a, #0x80
   779F                    1086 00275$:
   779F F2 A9 77      [10] 1087 	jp	P,00109$
   77A2                    1088 00108$:
                           1089 ;src/main.c:235: colisiona = 0;
   77A2 DD 36 F7 00   [19] 1090 	ld	-9 (ix),#0x00
   77A6 C3 6E 7A      [10] 1091 	jp	00165$
   77A9                    1092 00109$:
                           1093 ;src/main.c:238: if(cu.x > enemy->x){ //si el cu esta abajo
   77A9 21 CB 69      [10] 1094 	ld	hl, #_cu + 0
   77AC 5E            [ 7] 1095 	ld	e,(hl)
   77AD 0A            [ 7] 1096 	ld	a,(bc)
   77AE 4F            [ 4] 1097 	ld	c,a
   77AF 93            [ 4] 1098 	sub	a, e
   77B0 30 2C         [12] 1099 	jr	NC,00106$
                           1100 ;src/main.c:239: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
   77B2 6B            [ 4] 1101 	ld	l,e
   77B3 26 00         [ 7] 1102 	ld	h,#0x00
   77B5 06 00         [ 7] 1103 	ld	b,#0x00
   77B7 03            [ 6] 1104 	inc	bc
   77B8 03            [ 6] 1105 	inc	bc
   77B9 03            [ 6] 1106 	inc	bc
   77BA 03            [ 6] 1107 	inc	bc
   77BB BF            [ 4] 1108 	cp	a, a
   77BC ED 42         [15] 1109 	sbc	hl, bc
   77BE 3E 01         [ 7] 1110 	ld	a,#0x01
   77C0 BD            [ 4] 1111 	cp	a, l
   77C1 3E 00         [ 7] 1112 	ld	a,#0x00
   77C3 9C            [ 4] 1113 	sbc	a, h
   77C4 E2 C9 77      [10] 1114 	jp	PO, 00276$
   77C7 EE 80         [ 7] 1115 	xor	a, #0x80
   77C9                    1116 00276$:
   77C9 F2 D3 77      [10] 1117 	jp	P,00103$
                           1118 ;src/main.c:240: colisiona = 0;
   77CC DD 36 F7 00   [19] 1119 	ld	-9 (ix),#0x00
   77D0 C3 6E 7A      [10] 1120 	jp	00165$
   77D3                    1121 00103$:
                           1122 ;src/main.c:243: enemy->muerto = SI;
   77D3 DD 6E FA      [19] 1123 	ld	l,-6 (ix)
   77D6 DD 66 FB      [19] 1124 	ld	h,-5 (ix)
   77D9 36 01         [10] 1125 	ld	(hl),#0x01
   77DB C3 6E 7A      [10] 1126 	jp	00165$
   77DE                    1127 00106$:
                           1128 ;src/main.c:246: colisiona = 0;
   77DE DD 36 F7 00   [19] 1129 	ld	-9 (ix),#0x00
   77E2 C3 6E 7A      [10] 1130 	jp	00165$
   77E5                    1131 00113$:
                           1132 ;src/main.c:250: enemy->mira = M_izquierda;
   77E5 DD 6E FC      [19] 1133 	ld	l,-4 (ix)
   77E8 DD 66 FD      [19] 1134 	ld	h,-3 (ix)
   77EB 36 01         [10] 1135 	ld	(hl),#0x01
                           1136 ;src/main.c:252: break;
   77ED C3 6E 7A      [10] 1137 	jp	00165$
                           1138 ;src/main.c:253: case 1:
   77F0                    1139 00117$:
                           1140 ;src/main.c:254: if( *getTilePtr(enemy->x - 1, enemy->y) <= 2
   77F0 1D            [ 4] 1141 	dec	e
   77F1 C5            [11] 1142 	push	bc
   77F2 D5            [11] 1143 	push	de
   77F3 CD 6B 73      [17] 1144 	call	_getTilePtr
   77F6 F1            [10] 1145 	pop	af
   77F7 C1            [10] 1146 	pop	bc
   77F8 5E            [ 7] 1147 	ld	e,(hl)
   77F9 3E 02         [ 7] 1148 	ld	a,#0x02
   77FB 93            [ 4] 1149 	sub	a, e
   77FC DA BA 78      [10] 1150 	jp	C,00129$
                           1151 ;src/main.c:255: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   77FF DD 6E F8      [19] 1152 	ld	l,-8 (ix)
   7802 DD 66 F9      [19] 1153 	ld	h,-7 (ix)
   7805 7E            [ 7] 1154 	ld	a,(hl)
   7806 C6 0B         [ 7] 1155 	add	a, #0x0B
   7808 57            [ 4] 1156 	ld	d,a
   7809 0A            [ 7] 1157 	ld	a,(bc)
   780A C6 FF         [ 7] 1158 	add	a,#0xFF
   780C C5            [11] 1159 	push	bc
   780D D5            [11] 1160 	push	de
   780E 33            [ 6] 1161 	inc	sp
   780F F5            [11] 1162 	push	af
   7810 33            [ 6] 1163 	inc	sp
   7811 CD 6B 73      [17] 1164 	call	_getTilePtr
   7814 F1            [10] 1165 	pop	af
   7815 C1            [10] 1166 	pop	bc
   7816 5E            [ 7] 1167 	ld	e,(hl)
   7817 3E 02         [ 7] 1168 	ld	a,#0x02
   7819 93            [ 4] 1169 	sub	a, e
   781A DA BA 78      [10] 1170 	jp	C,00129$
                           1171 ;src/main.c:256: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   781D DD 6E F8      [19] 1172 	ld	l,-8 (ix)
   7820 DD 66 F9      [19] 1173 	ld	h,-7 (ix)
   7823 7E            [ 7] 1174 	ld	a,(hl)
   7824 C6 16         [ 7] 1175 	add	a, #0x16
   7826 57            [ 4] 1176 	ld	d,a
   7827 0A            [ 7] 1177 	ld	a,(bc)
   7828 C6 FF         [ 7] 1178 	add	a,#0xFF
   782A C5            [11] 1179 	push	bc
   782B D5            [11] 1180 	push	de
   782C 33            [ 6] 1181 	inc	sp
   782D F5            [11] 1182 	push	af
   782E 33            [ 6] 1183 	inc	sp
   782F CD 6B 73      [17] 1184 	call	_getTilePtr
   7832 F1            [10] 1185 	pop	af
   7833 C1            [10] 1186 	pop	bc
   7834 5E            [ 7] 1187 	ld	e,(hl)
   7835 3E 02         [ 7] 1188 	ld	a,#0x02
   7837 93            [ 4] 1189 	sub	a, e
   7838 DA BA 78      [10] 1190 	jp	C,00129$
                           1191 ;src/main.c:258: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   783B 21 CC 69      [10] 1192 	ld	hl, #_cu + 1
   783E 5E            [ 7] 1193 	ld	e,(hl)
   783F 16 00         [ 7] 1194 	ld	d,#0x00
   7841 21 04 00      [10] 1195 	ld	hl,#0x0004
   7844 19            [11] 1196 	add	hl,de
   7845 DD 75 FE      [19] 1197 	ld	-2 (ix),l
   7848 DD 74 FF      [19] 1198 	ld	-1 (ix),h
   784B DD 6E F8      [19] 1199 	ld	l,-8 (ix)
   784E DD 66 F9      [19] 1200 	ld	h,-7 (ix)
   7851 6E            [ 7] 1201 	ld	l,(hl)
   7852 26 00         [ 7] 1202 	ld	h,#0x00
   7854 DD 7E FE      [19] 1203 	ld	a,-2 (ix)
   7857 95            [ 4] 1204 	sub	a, l
   7858 DD 7E FF      [19] 1205 	ld	a,-1 (ix)
   785B 9C            [ 4] 1206 	sbc	a, h
   785C E2 61 78      [10] 1207 	jp	PO, 00277$
   785F EE 80         [ 7] 1208 	xor	a, #0x80
   7861                    1209 00277$:
   7861 FA 76 78      [10] 1210 	jp	M,00124$
   7864 D5            [11] 1211 	push	de
   7865 11 16 00      [10] 1212 	ld	de,#0x0016
   7868 19            [11] 1213 	add	hl, de
   7869 D1            [10] 1214 	pop	de
   786A 7D            [ 4] 1215 	ld	a,l
   786B 93            [ 4] 1216 	sub	a, e
   786C 7C            [ 4] 1217 	ld	a,h
   786D 9A            [ 4] 1218 	sbc	a, d
   786E E2 73 78      [10] 1219 	jp	PO, 00278$
   7871 EE 80         [ 7] 1220 	xor	a, #0x80
   7873                    1221 00278$:
   7873 F2 7D 78      [10] 1222 	jp	P,00125$
   7876                    1223 00124$:
                           1224 ;src/main.c:259: colisiona = 0;
   7876 DD 36 F7 00   [19] 1225 	ld	-9 (ix),#0x00
   787A C3 6E 7A      [10] 1226 	jp	00165$
   787D                    1227 00125$:
                           1228 ;src/main.c:262: if(enemy->x > cu.x){ //si el cu esta abajo
   787D 0A            [ 7] 1229 	ld	a,(bc)
   787E 5F            [ 4] 1230 	ld	e,a
   787F 21 CB 69      [10] 1231 	ld	hl, #_cu + 0
   7882 4E            [ 7] 1232 	ld	c,(hl)
   7883 79            [ 4] 1233 	ld	a,c
   7884 93            [ 4] 1234 	sub	a, e
   7885 30 2C         [12] 1235 	jr	NC,00122$
                           1236 ;src/main.c:263: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
   7887 6B            [ 4] 1237 	ld	l,e
   7888 26 00         [ 7] 1238 	ld	h,#0x00
   788A 06 00         [ 7] 1239 	ld	b,#0x00
   788C 03            [ 6] 1240 	inc	bc
   788D 03            [ 6] 1241 	inc	bc
   788E 03            [ 6] 1242 	inc	bc
   788F 03            [ 6] 1243 	inc	bc
   7890 BF            [ 4] 1244 	cp	a, a
   7891 ED 42         [15] 1245 	sbc	hl, bc
   7893 3E 01         [ 7] 1246 	ld	a,#0x01
   7895 BD            [ 4] 1247 	cp	a, l
   7896 3E 00         [ 7] 1248 	ld	a,#0x00
   7898 9C            [ 4] 1249 	sbc	a, h
   7899 E2 9E 78      [10] 1250 	jp	PO, 00279$
   789C EE 80         [ 7] 1251 	xor	a, #0x80
   789E                    1252 00279$:
   789E F2 A8 78      [10] 1253 	jp	P,00119$
                           1254 ;src/main.c:264: colisiona = 0;
   78A1 DD 36 F7 00   [19] 1255 	ld	-9 (ix),#0x00
   78A5 C3 6E 7A      [10] 1256 	jp	00165$
   78A8                    1257 00119$:
                           1258 ;src/main.c:267: enemy->muerto = SI;
   78A8 DD 6E FA      [19] 1259 	ld	l,-6 (ix)
   78AB DD 66 FB      [19] 1260 	ld	h,-5 (ix)
   78AE 36 01         [10] 1261 	ld	(hl),#0x01
   78B0 C3 6E 7A      [10] 1262 	jp	00165$
   78B3                    1263 00122$:
                           1264 ;src/main.c:270: colisiona = 0;
   78B3 DD 36 F7 00   [19] 1265 	ld	-9 (ix),#0x00
   78B7 C3 6E 7A      [10] 1266 	jp	00165$
   78BA                    1267 00129$:
                           1268 ;src/main.c:274: enemy->mira = M_derecha;
   78BA DD 6E FC      [19] 1269 	ld	l,-4 (ix)
   78BD DD 66 FD      [19] 1270 	ld	h,-3 (ix)
   78C0 36 00         [10] 1271 	ld	(hl),#0x00
                           1272 ;src/main.c:276: break;
   78C2 C3 6E 7A      [10] 1273 	jp	00165$
                           1274 ;src/main.c:277: case 2:
   78C5                    1275 00133$:
                           1276 ;src/main.c:278: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   78C5 15            [ 4] 1277 	dec	d
   78C6 15            [ 4] 1278 	dec	d
   78C7 C5            [11] 1279 	push	bc
   78C8 D5            [11] 1280 	push	de
   78C9 CD 6B 73      [17] 1281 	call	_getTilePtr
   78CC F1            [10] 1282 	pop	af
   78CD C1            [10] 1283 	pop	bc
   78CE 5E            [ 7] 1284 	ld	e,(hl)
   78CF 3E 02         [ 7] 1285 	ld	a,#0x02
   78D1 93            [ 4] 1286 	sub	a, e
   78D2 DA 8C 79      [10] 1287 	jp	C,00145$
                           1288 ;src/main.c:279: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   78D5 DD 6E F8      [19] 1289 	ld	l,-8 (ix)
   78D8 DD 66 F9      [19] 1290 	ld	h,-7 (ix)
   78DB 56            [ 7] 1291 	ld	d,(hl)
   78DC 15            [ 4] 1292 	dec	d
   78DD 15            [ 4] 1293 	dec	d
   78DE 0A            [ 7] 1294 	ld	a,(bc)
   78DF C6 02         [ 7] 1295 	add	a, #0x02
   78E1 C5            [11] 1296 	push	bc
   78E2 D5            [11] 1297 	push	de
   78E3 33            [ 6] 1298 	inc	sp
   78E4 F5            [11] 1299 	push	af
   78E5 33            [ 6] 1300 	inc	sp
   78E6 CD 6B 73      [17] 1301 	call	_getTilePtr
   78E9 F1            [10] 1302 	pop	af
   78EA C1            [10] 1303 	pop	bc
   78EB 5E            [ 7] 1304 	ld	e,(hl)
   78EC 3E 02         [ 7] 1305 	ld	a,#0x02
   78EE 93            [ 4] 1306 	sub	a, e
   78EF DA 8C 79      [10] 1307 	jp	C,00145$
                           1308 ;src/main.c:280: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   78F2 DD 6E F8      [19] 1309 	ld	l,-8 (ix)
   78F5 DD 66 F9      [19] 1310 	ld	h,-7 (ix)
   78F8 56            [ 7] 1311 	ld	d,(hl)
   78F9 15            [ 4] 1312 	dec	d
   78FA 15            [ 4] 1313 	dec	d
   78FB 0A            [ 7] 1314 	ld	a,(bc)
   78FC C6 04         [ 7] 1315 	add	a, #0x04
   78FE C5            [11] 1316 	push	bc
   78FF D5            [11] 1317 	push	de
   7900 33            [ 6] 1318 	inc	sp
   7901 F5            [11] 1319 	push	af
   7902 33            [ 6] 1320 	inc	sp
   7903 CD 6B 73      [17] 1321 	call	_getTilePtr
   7906 F1            [10] 1322 	pop	af
   7907 C1            [10] 1323 	pop	bc
   7908 5E            [ 7] 1324 	ld	e,(hl)
   7909 3E 02         [ 7] 1325 	ld	a,#0x02
   790B 93            [ 4] 1326 	sub	a, e
   790C DA 8C 79      [10] 1327 	jp	C,00145$
                           1328 ;src/main.c:282: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   790F 21 CB 69      [10] 1329 	ld	hl, #_cu + 0
   7912 5E            [ 7] 1330 	ld	e,(hl)
   7913 16 00         [ 7] 1331 	ld	d,#0x00
   7915 21 02 00      [10] 1332 	ld	hl,#0x0002
   7918 19            [11] 1333 	add	hl,de
   7919 DD 75 FE      [19] 1334 	ld	-2 (ix),l
   791C DD 74 FF      [19] 1335 	ld	-1 (ix),h
   791F 0A            [ 7] 1336 	ld	a,(bc)
   7920 6F            [ 4] 1337 	ld	l,a
   7921 26 00         [ 7] 1338 	ld	h,#0x00
   7923 DD 7E FE      [19] 1339 	ld	a,-2 (ix)
   7926 95            [ 4] 1340 	sub	a, l
   7927 DD 7E FF      [19] 1341 	ld	a,-1 (ix)
   792A 9C            [ 4] 1342 	sbc	a, h
   792B E2 30 79      [10] 1343 	jp	PO, 00280$
   792E EE 80         [ 7] 1344 	xor	a, #0x80
   7930                    1345 00280$:
   7930 FA 43 79      [10] 1346 	jp	M,00140$
   7933 23            [ 6] 1347 	inc	hl
   7934 23            [ 6] 1348 	inc	hl
   7935 23            [ 6] 1349 	inc	hl
   7936 23            [ 6] 1350 	inc	hl
   7937 7D            [ 4] 1351 	ld	a,l
   7938 93            [ 4] 1352 	sub	a, e
   7939 7C            [ 4] 1353 	ld	a,h
   793A 9A            [ 4] 1354 	sbc	a, d
   793B E2 40 79      [10] 1355 	jp	PO, 00281$
   793E EE 80         [ 7] 1356 	xor	a, #0x80
   7940                    1357 00281$:
   7940 F2 49 79      [10] 1358 	jp	P,00141$
   7943                    1359 00140$:
                           1360 ;src/main.c:284: colisiona = 0;
   7943 DD 36 F7 00   [19] 1361 	ld	-9 (ix),#0x00
   7947 18 4B         [12] 1362 	jr	00149$
   7949                    1363 00141$:
                           1364 ;src/main.c:287: if(enemy->y>cu.y){
   7949 DD 6E F8      [19] 1365 	ld	l,-8 (ix)
   794C DD 66 F9      [19] 1366 	ld	h,-7 (ix)
   794F 5E            [ 7] 1367 	ld	e,(hl)
   7950 21 CC 69      [10] 1368 	ld	hl, #(_cu + 0x0001) + 0
   7953 6E            [ 7] 1369 	ld	l,(hl)
   7954 7D            [ 4] 1370 	ld	a,l
   7955 93            [ 4] 1371 	sub	a, e
   7956 30 2E         [12] 1372 	jr	NC,00138$
                           1373 ;src/main.c:288: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   7958 16 00         [ 7] 1374 	ld	d,#0x00
   795A 26 00         [ 7] 1375 	ld	h,#0x00
   795C D5            [11] 1376 	push	de
   795D 11 08 00      [10] 1377 	ld	de,#0x0008
   7960 19            [11] 1378 	add	hl, de
   7961 D1            [10] 1379 	pop	de
   7962 7B            [ 4] 1380 	ld	a,e
   7963 95            [ 4] 1381 	sub	a, l
   7964 5F            [ 4] 1382 	ld	e,a
   7965 7A            [ 4] 1383 	ld	a,d
   7966 9C            [ 4] 1384 	sbc	a, h
   7967 57            [ 4] 1385 	ld	d,a
   7968 3E 02         [ 7] 1386 	ld	a,#0x02
   796A BB            [ 4] 1387 	cp	a, e
   796B 3E 00         [ 7] 1388 	ld	a,#0x00
   796D 9A            [ 4] 1389 	sbc	a, d
   796E E2 73 79      [10] 1390 	jp	PO, 00282$
   7971 EE 80         [ 7] 1391 	xor	a, #0x80
   7973                    1392 00282$:
   7973 F2 7C 79      [10] 1393 	jp	P,00135$
                           1394 ;src/main.c:289: colisiona = 0;
   7976 DD 36 F7 00   [19] 1395 	ld	-9 (ix),#0x00
   797A 18 18         [12] 1396 	jr	00149$
   797C                    1397 00135$:
                           1398 ;src/main.c:292: enemy->muerto = SI;
   797C DD 6E FA      [19] 1399 	ld	l,-6 (ix)
   797F DD 66 FB      [19] 1400 	ld	h,-5 (ix)
   7982 36 01         [10] 1401 	ld	(hl),#0x01
   7984 18 0E         [12] 1402 	jr	00149$
   7986                    1403 00138$:
                           1404 ;src/main.c:296: colisiona = 0;
   7986 DD 36 F7 00   [19] 1405 	ld	-9 (ix),#0x00
   798A 18 08         [12] 1406 	jr	00149$
   798C                    1407 00145$:
                           1408 ;src/main.c:302: enemy->mira = M_abajo;
   798C DD 6E FC      [19] 1409 	ld	l,-4 (ix)
   798F DD 66 FD      [19] 1410 	ld	h,-3 (ix)
   7992 36 03         [10] 1411 	ld	(hl),#0x03
                           1412 ;src/main.c:305: case 3:
   7994                    1413 00149$:
                           1414 ;src/main.c:308: if( *getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7994 DD 6E F8      [19] 1415 	ld	l,-8 (ix)
   7997 DD 66 F9      [19] 1416 	ld	h,-7 (ix)
   799A 7E            [ 7] 1417 	ld	a,(hl)
   799B C6 18         [ 7] 1418 	add	a, #0x18
   799D 57            [ 4] 1419 	ld	d,a
   799E 0A            [ 7] 1420 	ld	a,(bc)
   799F C5            [11] 1421 	push	bc
   79A0 D5            [11] 1422 	push	de
   79A1 33            [ 6] 1423 	inc	sp
   79A2 F5            [11] 1424 	push	af
   79A3 33            [ 6] 1425 	inc	sp
   79A4 CD 6B 73      [17] 1426 	call	_getTilePtr
   79A7 F1            [10] 1427 	pop	af
   79A8 C1            [10] 1428 	pop	bc
   79A9 5E            [ 7] 1429 	ld	e,(hl)
   79AA 3E 02         [ 7] 1430 	ld	a,#0x02
   79AC 93            [ 4] 1431 	sub	a, e
   79AD DA 66 7A      [10] 1432 	jp	C,00161$
                           1433 ;src/main.c:309: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   79B0 DD 6E F8      [19] 1434 	ld	l,-8 (ix)
   79B3 DD 66 F9      [19] 1435 	ld	h,-7 (ix)
   79B6 7E            [ 7] 1436 	ld	a,(hl)
   79B7 C6 18         [ 7] 1437 	add	a, #0x18
   79B9 57            [ 4] 1438 	ld	d,a
   79BA 0A            [ 7] 1439 	ld	a,(bc)
   79BB C6 02         [ 7] 1440 	add	a, #0x02
   79BD C5            [11] 1441 	push	bc
   79BE D5            [11] 1442 	push	de
   79BF 33            [ 6] 1443 	inc	sp
   79C0 F5            [11] 1444 	push	af
   79C1 33            [ 6] 1445 	inc	sp
   79C2 CD 6B 73      [17] 1446 	call	_getTilePtr
   79C5 F1            [10] 1447 	pop	af
   79C6 C1            [10] 1448 	pop	bc
   79C7 5E            [ 7] 1449 	ld	e,(hl)
   79C8 3E 02         [ 7] 1450 	ld	a,#0x02
   79CA 93            [ 4] 1451 	sub	a, e
   79CB DA 66 7A      [10] 1452 	jp	C,00161$
                           1453 ;src/main.c:310: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   79CE DD 6E F8      [19] 1454 	ld	l,-8 (ix)
   79D1 DD 66 F9      [19] 1455 	ld	h,-7 (ix)
   79D4 7E            [ 7] 1456 	ld	a,(hl)
   79D5 C6 18         [ 7] 1457 	add	a, #0x18
   79D7 57            [ 4] 1458 	ld	d,a
   79D8 0A            [ 7] 1459 	ld	a,(bc)
   79D9 C6 04         [ 7] 1460 	add	a, #0x04
   79DB C5            [11] 1461 	push	bc
   79DC D5            [11] 1462 	push	de
   79DD 33            [ 6] 1463 	inc	sp
   79DE F5            [11] 1464 	push	af
   79DF 33            [ 6] 1465 	inc	sp
   79E0 CD 6B 73      [17] 1466 	call	_getTilePtr
   79E3 F1            [10] 1467 	pop	af
   79E4 C1            [10] 1468 	pop	bc
   79E5 5E            [ 7] 1469 	ld	e,(hl)
   79E6 3E 02         [ 7] 1470 	ld	a,#0x02
   79E8 93            [ 4] 1471 	sub	a, e
   79E9 38 7B         [12] 1472 	jr	C,00161$
                           1473 ;src/main.c:312: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   79EB 21 CB 69      [10] 1474 	ld	hl, #_cu + 0
   79EE 5E            [ 7] 1475 	ld	e,(hl)
   79EF 16 00         [ 7] 1476 	ld	d,#0x00
   79F1 21 02 00      [10] 1477 	ld	hl,#0x0002
   79F4 19            [11] 1478 	add	hl,de
   79F5 DD 75 FE      [19] 1479 	ld	-2 (ix),l
   79F8 DD 74 FF      [19] 1480 	ld	-1 (ix),h
   79FB 0A            [ 7] 1481 	ld	a,(bc)
   79FC 4F            [ 4] 1482 	ld	c,a
   79FD 06 00         [ 7] 1483 	ld	b,#0x00
   79FF DD 7E FE      [19] 1484 	ld	a,-2 (ix)
   7A02 91            [ 4] 1485 	sub	a, c
   7A03 DD 7E FF      [19] 1486 	ld	a,-1 (ix)
   7A06 98            [ 4] 1487 	sbc	a, b
   7A07 E2 0C 7A      [10] 1488 	jp	PO, 00283$
   7A0A EE 80         [ 7] 1489 	xor	a, #0x80
   7A0C                    1490 00283$:
   7A0C FA 1F 7A      [10] 1491 	jp	M,00156$
   7A0F 03            [ 6] 1492 	inc	bc
   7A10 03            [ 6] 1493 	inc	bc
   7A11 03            [ 6] 1494 	inc	bc
   7A12 03            [ 6] 1495 	inc	bc
   7A13 79            [ 4] 1496 	ld	a,c
   7A14 93            [ 4] 1497 	sub	a, e
   7A15 78            [ 4] 1498 	ld	a,b
   7A16 9A            [ 4] 1499 	sbc	a, d
   7A17 E2 1C 7A      [10] 1500 	jp	PO, 00284$
   7A1A EE 80         [ 7] 1501 	xor	a, #0x80
   7A1C                    1502 00284$:
   7A1C F2 25 7A      [10] 1503 	jp	P,00157$
   7A1F                    1504 00156$:
                           1505 ;src/main.c:313: colisiona = 0;
   7A1F DD 36 F7 00   [19] 1506 	ld	-9 (ix),#0x00
   7A23 18 49         [12] 1507 	jr	00165$
   7A25                    1508 00157$:
                           1509 ;src/main.c:316: if(cu.y > enemy->y){ //si el cu esta abajo
   7A25 21 CC 69      [10] 1510 	ld	hl, #(_cu + 0x0001) + 0
   7A28 4E            [ 7] 1511 	ld	c,(hl)
   7A29 DD 6E F8      [19] 1512 	ld	l,-8 (ix)
   7A2C DD 66 F9      [19] 1513 	ld	h,-7 (ix)
   7A2F 5E            [ 7] 1514 	ld	e,(hl)
   7A30 7B            [ 4] 1515 	ld	a,e
   7A31 91            [ 4] 1516 	sub	a, c
   7A32 30 2C         [12] 1517 	jr	NC,00154$
                           1518 ;src/main.c:317: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   7A34 06 00         [ 7] 1519 	ld	b,#0x00
   7A36 16 00         [ 7] 1520 	ld	d,#0x00
   7A38 21 16 00      [10] 1521 	ld	hl,#0x0016
   7A3B 19            [11] 1522 	add	hl,de
   7A3C 79            [ 4] 1523 	ld	a,c
   7A3D 95            [ 4] 1524 	sub	a, l
   7A3E 4F            [ 4] 1525 	ld	c,a
   7A3F 78            [ 4] 1526 	ld	a,b
   7A40 9C            [ 4] 1527 	sbc	a, h
   7A41 47            [ 4] 1528 	ld	b,a
   7A42 3E 02         [ 7] 1529 	ld	a,#0x02
   7A44 B9            [ 4] 1530 	cp	a, c
   7A45 3E 00         [ 7] 1531 	ld	a,#0x00
   7A47 98            [ 4] 1532 	sbc	a, b
   7A48 E2 4D 7A      [10] 1533 	jp	PO, 00285$
   7A4B EE 80         [ 7] 1534 	xor	a, #0x80
   7A4D                    1535 00285$:
   7A4D F2 56 7A      [10] 1536 	jp	P,00151$
                           1537 ;src/main.c:318: colisiona = 0;
   7A50 DD 36 F7 00   [19] 1538 	ld	-9 (ix),#0x00
   7A54 18 18         [12] 1539 	jr	00165$
   7A56                    1540 00151$:
                           1541 ;src/main.c:321: enemy->muerto = SI;
   7A56 DD 6E FA      [19] 1542 	ld	l,-6 (ix)
   7A59 DD 66 FB      [19] 1543 	ld	h,-5 (ix)
   7A5C 36 01         [10] 1544 	ld	(hl),#0x01
   7A5E 18 0E         [12] 1545 	jr	00165$
   7A60                    1546 00154$:
                           1547 ;src/main.c:325: colisiona = 0;
   7A60 DD 36 F7 00   [19] 1548 	ld	-9 (ix),#0x00
   7A64 18 08         [12] 1549 	jr	00165$
   7A66                    1550 00161$:
                           1551 ;src/main.c:329: enemy->mira = M_arriba;
   7A66 DD 6E FC      [19] 1552 	ld	l,-4 (ix)
   7A69 DD 66 FD      [19] 1553 	ld	h,-3 (ix)
   7A6C 36 02         [10] 1554 	ld	(hl),#0x02
                           1555 ;src/main.c:332: }
   7A6E                    1556 00165$:
                           1557 ;src/main.c:333: return colisiona;
   7A6E DD 6E F7      [19] 1558 	ld	l,-9 (ix)
   7A71 DD F9         [10] 1559 	ld	sp, ix
   7A73 DD E1         [14] 1560 	pop	ix
   7A75 C9            [10] 1561 	ret
                           1562 ;src/main.c:336: void moverEnemigoArriba(TEnemy *enemy){
                           1563 ;	---------------------------------
                           1564 ; Function moverEnemigoArriba
                           1565 ; ---------------------------------
   7A76                    1566 _moverEnemigoArriba::
   7A76 DD E5         [15] 1567 	push	ix
   7A78 DD 21 00 00   [14] 1568 	ld	ix,#0
   7A7C DD 39         [15] 1569 	add	ix,sp
                           1570 ;src/main.c:337: enemy->y--;
   7A7E DD 4E 04      [19] 1571 	ld	c,4 (ix)
   7A81 DD 46 05      [19] 1572 	ld	b,5 (ix)
   7A84 69            [ 4] 1573 	ld	l, c
   7A85 60            [ 4] 1574 	ld	h, b
   7A86 23            [ 6] 1575 	inc	hl
   7A87 5E            [ 7] 1576 	ld	e,(hl)
   7A88 1D            [ 4] 1577 	dec	e
   7A89 73            [ 7] 1578 	ld	(hl),e
                           1579 ;src/main.c:338: enemy->y--;
   7A8A 1D            [ 4] 1580 	dec	e
   7A8B 73            [ 7] 1581 	ld	(hl),e
                           1582 ;src/main.c:339: enemy->mover = SI;
   7A8C 21 06 00      [10] 1583 	ld	hl,#0x0006
   7A8F 09            [11] 1584 	add	hl,bc
   7A90 36 01         [10] 1585 	ld	(hl),#0x01
   7A92 DD E1         [14] 1586 	pop	ix
   7A94 C9            [10] 1587 	ret
                           1588 ;src/main.c:342: void moverEnemigoAbajo(TEnemy *enemy){
                           1589 ;	---------------------------------
                           1590 ; Function moverEnemigoAbajo
                           1591 ; ---------------------------------
   7A95                    1592 _moverEnemigoAbajo::
   7A95 DD E5         [15] 1593 	push	ix
   7A97 DD 21 00 00   [14] 1594 	ld	ix,#0
   7A9B DD 39         [15] 1595 	add	ix,sp
                           1596 ;src/main.c:343: enemy->y++;
   7A9D DD 4E 04      [19] 1597 	ld	c,4 (ix)
   7AA0 DD 46 05      [19] 1598 	ld	b,5 (ix)
   7AA3 59            [ 4] 1599 	ld	e, c
   7AA4 50            [ 4] 1600 	ld	d, b
   7AA5 13            [ 6] 1601 	inc	de
   7AA6 1A            [ 7] 1602 	ld	a,(de)
   7AA7 3C            [ 4] 1603 	inc	a
   7AA8 12            [ 7] 1604 	ld	(de),a
                           1605 ;src/main.c:344: enemy->y++;
   7AA9 3C            [ 4] 1606 	inc	a
   7AAA 12            [ 7] 1607 	ld	(de),a
                           1608 ;src/main.c:345: enemy->mover = SI;
   7AAB 21 06 00      [10] 1609 	ld	hl,#0x0006
   7AAE 09            [11] 1610 	add	hl,bc
   7AAF 36 01         [10] 1611 	ld	(hl),#0x01
   7AB1 DD E1         [14] 1612 	pop	ix
   7AB3 C9            [10] 1613 	ret
                           1614 ;src/main.c:348: void moverEnemigoDerecha(TEnemy *enemy){
                           1615 ;	---------------------------------
                           1616 ; Function moverEnemigoDerecha
                           1617 ; ---------------------------------
   7AB4                    1618 _moverEnemigoDerecha::
                           1619 ;src/main.c:349: enemy->x++;
   7AB4 D1            [10] 1620 	pop	de
   7AB5 C1            [10] 1621 	pop	bc
   7AB6 C5            [11] 1622 	push	bc
   7AB7 D5            [11] 1623 	push	de
   7AB8 0A            [ 7] 1624 	ld	a,(bc)
   7AB9 3C            [ 4] 1625 	inc	a
   7ABA 02            [ 7] 1626 	ld	(bc),a
                           1627 ;src/main.c:350: enemy->x++;
   7ABB 3C            [ 4] 1628 	inc	a
   7ABC 02            [ 7] 1629 	ld	(bc),a
                           1630 ;src/main.c:351: enemy->mover = SI;
   7ABD 21 06 00      [10] 1631 	ld	hl,#0x0006
   7AC0 09            [11] 1632 	add	hl,bc
   7AC1 36 01         [10] 1633 	ld	(hl),#0x01
   7AC3 C9            [10] 1634 	ret
                           1635 ;src/main.c:354: void moverEnemigoIzquierda(TEnemy *enemy){
                           1636 ;	---------------------------------
                           1637 ; Function moverEnemigoIzquierda
                           1638 ; ---------------------------------
   7AC4                    1639 _moverEnemigoIzquierda::
                           1640 ;src/main.c:355: enemy->x--;
   7AC4 D1            [10] 1641 	pop	de
   7AC5 C1            [10] 1642 	pop	bc
   7AC6 C5            [11] 1643 	push	bc
   7AC7 D5            [11] 1644 	push	de
   7AC8 0A            [ 7] 1645 	ld	a,(bc)
   7AC9 C6 FF         [ 7] 1646 	add	a,#0xFF
   7ACB 02            [ 7] 1647 	ld	(bc),a
                           1648 ;src/main.c:356: enemy->x--;
   7ACC C6 FF         [ 7] 1649 	add	a,#0xFF
   7ACE 02            [ 7] 1650 	ld	(bc),a
                           1651 ;src/main.c:357: enemy->mover = SI;
   7ACF 21 06 00      [10] 1652 	ld	hl,#0x0006
   7AD2 09            [11] 1653 	add	hl,bc
   7AD3 36 01         [10] 1654 	ld	(hl),#0x01
   7AD5 C9            [10] 1655 	ret
                           1656 ;src/main.c:360: void moverEnemigoPathfinding(TEnemy *enemy){
                           1657 ;	---------------------------------
                           1658 ; Function moverEnemigoPathfinding
                           1659 ; ---------------------------------
   7AD6                    1660 _moverEnemigoPathfinding::
   7AD6 DD E5         [15] 1661 	push	ix
   7AD8 DD 21 00 00   [14] 1662 	ld	ix,#0
   7ADC DD 39         [15] 1663 	add	ix,sp
   7ADE 21 F3 FF      [10] 1664 	ld	hl,#-13
   7AE1 39            [11] 1665 	add	hl,sp
   7AE2 F9            [ 6] 1666 	ld	sp,hl
                           1667 ;src/main.c:361: if(!enemy->muerto){
   7AE3 DD 4E 04      [19] 1668 	ld	c,4 (ix)
   7AE6 DD 46 05      [19] 1669 	ld	b,5 (ix)
   7AE9 C5            [11] 1670 	push	bc
   7AEA FD E1         [14] 1671 	pop	iy
   7AEC FD 7E 08      [19] 1672 	ld	a,8 (iy)
   7AEF B7            [ 4] 1673 	or	a, a
   7AF0 C2 04 7C      [10] 1674 	jp	NZ,00112$
                           1675 ;src/main.c:363: if (!enemy->reversePatrol) {
   7AF3 21 0D 00      [10] 1676 	ld	hl,#0x000D
   7AF6 09            [11] 1677 	add	hl,bc
   7AF7 DD 75 FA      [19] 1678 	ld	-6 (ix),l
   7AFA DD 74 FB      [19] 1679 	ld	-5 (ix),h
   7AFD DD 6E FA      [19] 1680 	ld	l,-6 (ix)
   7B00 DD 66 FB      [19] 1681 	ld	h,-5 (ix)
   7B03 7E            [ 7] 1682 	ld	a,(hl)
   7B04 DD 77 F5      [19] 1683 	ld	-11 (ix),a
                           1684 ;src/main.c:364: if(enemy->iter < enemy->longitud_camino - 8){
   7B07 21 0E 00      [10] 1685 	ld	hl,#0x000E
   7B0A 09            [11] 1686 	add	hl,bc
   7B0B EB            [ 4] 1687 	ex	de,hl
                           1688 ;src/main.c:365: enemy->x = enemy->camino[enemy->iter];
   7B0C 21 16 00      [10] 1689 	ld	hl,#0x0016
   7B0F 09            [11] 1690 	add	hl,bc
   7B10 E3            [19] 1691 	ex	(sp), hl
                           1692 ;src/main.c:367: enemy->y = enemy->camino[enemy->iter];
   7B11 21 01 00      [10] 1693 	ld	hl,#0x0001
   7B14 09            [11] 1694 	add	hl,bc
   7B15 DD 75 F6      [19] 1695 	ld	-10 (ix),l
   7B18 DD 74 F7      [19] 1696 	ld	-9 (ix),h
                           1697 ;src/main.c:369: enemy->mover = SI;
   7B1B 21 06 00      [10] 1698 	ld	hl,#0x0006
   7B1E 09            [11] 1699 	add	hl,bc
   7B1F DD 75 F8      [19] 1700 	ld	-8 (ix),l
   7B22 DD 74 F9      [19] 1701 	ld	-7 (ix),h
                           1702 ;src/main.c:372: enemy->lastIter = enemy->iter - 1;
   7B25 21 0F 00      [10] 1703 	ld	hl,#0x000F
   7B28 09            [11] 1704 	add	hl,bc
   7B29 DD 75 FE      [19] 1705 	ld	-2 (ix),l
   7B2C DD 74 FF      [19] 1706 	ld	-1 (ix),h
                           1707 ;src/main.c:363: if (!enemy->reversePatrol) {
   7B2F DD 7E F5      [19] 1708 	ld	a,-11 (ix)
   7B32 B7            [ 4] 1709 	or	a, a
   7B33 20 7C         [12] 1710 	jr	NZ,00108$
                           1711 ;src/main.c:364: if(enemy->iter < enemy->longitud_camino - 8){
   7B35 1A            [ 7] 1712 	ld	a,(de)
   7B36 DD 77 F5      [19] 1713 	ld	-11 (ix),a
   7B39 69            [ 4] 1714 	ld	l, c
   7B3A 60            [ 4] 1715 	ld	h, b
   7B3B C5            [11] 1716 	push	bc
   7B3C 01 42 01      [10] 1717 	ld	bc, #0x0142
   7B3F 09            [11] 1718 	add	hl, bc
   7B40 C1            [10] 1719 	pop	bc
   7B41 6E            [ 7] 1720 	ld	l,(hl)
   7B42 26 00         [ 7] 1721 	ld	h,#0x00
   7B44 7D            [ 4] 1722 	ld	a,l
   7B45 C6 F8         [ 7] 1723 	add	a,#0xF8
   7B47 DD 77 FC      [19] 1724 	ld	-4 (ix),a
   7B4A 7C            [ 4] 1725 	ld	a,h
   7B4B CE FF         [ 7] 1726 	adc	a,#0xFF
   7B4D DD 77 FD      [19] 1727 	ld	-3 (ix),a
   7B50 DD 7E F5      [19] 1728 	ld	a, -11 (ix)
   7B53 26 00         [ 7] 1729 	ld	h, #0x00
   7B55 DD 96 FC      [19] 1730 	sub	a, -4 (ix)
   7B58 7C            [ 4] 1731 	ld	a,h
   7B59 DD 9E FD      [19] 1732 	sbc	a, -3 (ix)
   7B5C E2 61 7B      [10] 1733 	jp	PO, 00130$
   7B5F EE 80         [ 7] 1734 	xor	a, #0x80
   7B61                    1735 00130$:
   7B61 F2 9C 7B      [10] 1736 	jp	P,00102$
                           1737 ;src/main.c:365: enemy->x = enemy->camino[enemy->iter];
   7B64 DD 6E F5      [19] 1738 	ld	l,-11 (ix)
   7B67 26 00         [ 7] 1739 	ld	h,#0x00
   7B69 DD 7E F3      [19] 1740 	ld	a,-13 (ix)
   7B6C 85            [ 4] 1741 	add	a, l
   7B6D 6F            [ 4] 1742 	ld	l,a
   7B6E DD 7E F4      [19] 1743 	ld	a,-12 (ix)
   7B71 8C            [ 4] 1744 	adc	a, h
   7B72 67            [ 4] 1745 	ld	h,a
   7B73 7E            [ 7] 1746 	ld	a,(hl)
   7B74 02            [ 7] 1747 	ld	(bc),a
                           1748 ;src/main.c:366: enemy->iter++;
   7B75 1A            [ 7] 1749 	ld	a,(de)
   7B76 4F            [ 4] 1750 	ld	c,a
   7B77 0C            [ 4] 1751 	inc	c
   7B78 79            [ 4] 1752 	ld	a,c
   7B79 12            [ 7] 1753 	ld	(de),a
                           1754 ;src/main.c:367: enemy->y = enemy->camino[enemy->iter];
   7B7A 69            [ 4] 1755 	ld	l,c
   7B7B 26 00         [ 7] 1756 	ld	h,#0x00
   7B7D DD 7E F3      [19] 1757 	ld	a,-13 (ix)
   7B80 85            [ 4] 1758 	add	a, l
   7B81 6F            [ 4] 1759 	ld	l,a
   7B82 DD 7E F4      [19] 1760 	ld	a,-12 (ix)
   7B85 8C            [ 4] 1761 	adc	a, h
   7B86 67            [ 4] 1762 	ld	h,a
   7B87 46            [ 7] 1763 	ld	b,(hl)
   7B88 DD 6E F6      [19] 1764 	ld	l,-10 (ix)
   7B8B DD 66 F7      [19] 1765 	ld	h,-9 (ix)
   7B8E 70            [ 7] 1766 	ld	(hl),b
                           1767 ;src/main.c:368: enemy->iter++;
   7B8F 0C            [ 4] 1768 	inc	c
   7B90 79            [ 4] 1769 	ld	a,c
   7B91 12            [ 7] 1770 	ld	(de),a
                           1771 ;src/main.c:369: enemy->mover = SI;
   7B92 DD 6E F8      [19] 1772 	ld	l,-8 (ix)
   7B95 DD 66 F9      [19] 1773 	ld	h,-7 (ix)
   7B98 36 01         [10] 1774 	ld	(hl),#0x01
   7B9A 18 68         [12] 1775 	jr	00112$
   7B9C                    1776 00102$:
                           1777 ;src/main.c:372: enemy->lastIter = enemy->iter - 1;
   7B9C DD 4E F5      [19] 1778 	ld	c,-11 (ix)
   7B9F 0D            [ 4] 1779 	dec	c
   7BA0 DD 6E FE      [19] 1780 	ld	l,-2 (ix)
   7BA3 DD 66 FF      [19] 1781 	ld	h,-1 (ix)
   7BA6 71            [ 7] 1782 	ld	(hl),c
                           1783 ;src/main.c:375: enemy->reversePatrol = 1;
   7BA7 DD 6E FA      [19] 1784 	ld	l,-6 (ix)
   7BAA DD 66 FB      [19] 1785 	ld	h,-5 (ix)
   7BAD 36 01         [10] 1786 	ld	(hl),#0x01
   7BAF 18 53         [12] 1787 	jr	00112$
   7BB1                    1788 00108$:
                           1789 ;src/main.c:378: if(enemy->lastIter > 1){
   7BB1 DD 6E FE      [19] 1790 	ld	l,-2 (ix)
   7BB4 DD 66 FF      [19] 1791 	ld	h,-1 (ix)
   7BB7 6E            [ 7] 1792 	ld	l,(hl)
   7BB8 3E 01         [ 7] 1793 	ld	a,#0x01
   7BBA 95            [ 4] 1794 	sub	a, l
   7BBB 30 3D         [12] 1795 	jr	NC,00105$
                           1796 ;src/main.c:379: enemy->y = enemy->camino[enemy->lastIter];
   7BBD 26 00         [ 7] 1797 	ld	h,#0x00
   7BBF D1            [10] 1798 	pop	de
   7BC0 D5            [11] 1799 	push	de
   7BC1 19            [11] 1800 	add	hl,de
   7BC2 5E            [ 7] 1801 	ld	e,(hl)
   7BC3 DD 6E F6      [19] 1802 	ld	l,-10 (ix)
   7BC6 DD 66 F7      [19] 1803 	ld	h,-9 (ix)
   7BC9 73            [ 7] 1804 	ld	(hl),e
                           1805 ;src/main.c:380: enemy->lastIter--;
   7BCA DD 6E FE      [19] 1806 	ld	l,-2 (ix)
   7BCD DD 66 FF      [19] 1807 	ld	h,-1 (ix)
   7BD0 5E            [ 7] 1808 	ld	e,(hl)
   7BD1 1D            [ 4] 1809 	dec	e
   7BD2 DD 6E FE      [19] 1810 	ld	l,-2 (ix)
   7BD5 DD 66 FF      [19] 1811 	ld	h,-1 (ix)
   7BD8 73            [ 7] 1812 	ld	(hl),e
                           1813 ;src/main.c:381: enemy->x = enemy->camino[enemy->lastIter];
   7BD9 6B            [ 4] 1814 	ld	l,e
   7BDA 26 00         [ 7] 1815 	ld	h,#0x00
   7BDC DD 7E F3      [19] 1816 	ld	a,-13 (ix)
   7BDF 85            [ 4] 1817 	add	a, l
   7BE0 6F            [ 4] 1818 	ld	l,a
   7BE1 DD 7E F4      [19] 1819 	ld	a,-12 (ix)
   7BE4 8C            [ 4] 1820 	adc	a, h
   7BE5 67            [ 4] 1821 	ld	h,a
   7BE6 7E            [ 7] 1822 	ld	a,(hl)
   7BE7 02            [ 7] 1823 	ld	(bc),a
                           1824 ;src/main.c:382: enemy->lastIter--;
   7BE8 1D            [ 4] 1825 	dec	e
   7BE9 DD 6E FE      [19] 1826 	ld	l,-2 (ix)
   7BEC DD 66 FF      [19] 1827 	ld	h,-1 (ix)
   7BEF 73            [ 7] 1828 	ld	(hl),e
                           1829 ;src/main.c:383: enemy->mover = SI;
   7BF0 DD 6E F8      [19] 1830 	ld	l,-8 (ix)
   7BF3 DD 66 F9      [19] 1831 	ld	h,-7 (ix)
   7BF6 36 01         [10] 1832 	ld	(hl),#0x01
   7BF8 18 0A         [12] 1833 	jr	00112$
   7BFA                    1834 00105$:
                           1835 ;src/main.c:386: enemy->iter = 0;
   7BFA AF            [ 4] 1836 	xor	a, a
   7BFB 12            [ 7] 1837 	ld	(de),a
                           1838 ;src/main.c:388: enemy->reversePatrol = 0;
   7BFC DD 6E FA      [19] 1839 	ld	l,-6 (ix)
   7BFF DD 66 FB      [19] 1840 	ld	h,-5 (ix)
   7C02 36 00         [10] 1841 	ld	(hl),#0x00
   7C04                    1842 00112$:
   7C04 DD F9         [10] 1843 	ld	sp, ix
   7C06 DD E1         [14] 1844 	pop	ix
   7C08 C9            [10] 1845 	ret
                           1846 ;src/main.c:395: void moverEnemigo(TEnemy *enemy){
                           1847 ;	---------------------------------
                           1848 ; Function moverEnemigo
                           1849 ; ---------------------------------
   7C09                    1850 _moverEnemigo::
   7C09 DD E5         [15] 1851 	push	ix
   7C0B DD 21 00 00   [14] 1852 	ld	ix,#0
   7C0F DD 39         [15] 1853 	add	ix,sp
                           1854 ;src/main.c:396: if(!enemy->muerto){
   7C11 DD 4E 04      [19] 1855 	ld	c,4 (ix)
   7C14 DD 46 05      [19] 1856 	ld	b,5 (ix)
   7C17 C5            [11] 1857 	push	bc
   7C18 FD E1         [14] 1858 	pop	iy
   7C1A FD 7E 08      [19] 1859 	ld	a,8 (iy)
   7C1D B7            [ 4] 1860 	or	a, a
   7C1E 20 46         [12] 1861 	jr	NZ,00110$
                           1862 ;src/main.c:397: if(!checkEnemyCollision(enemy->mira, enemy)){
   7C20 21 07 00      [10] 1863 	ld	hl,#0x0007
   7C23 09            [11] 1864 	add	hl,bc
   7C24 5E            [ 7] 1865 	ld	e,(hl)
   7C25 16 00         [ 7] 1866 	ld	d,#0x00
   7C27 E5            [11] 1867 	push	hl
   7C28 C5            [11] 1868 	push	bc
   7C29 C5            [11] 1869 	push	bc
   7C2A D5            [11] 1870 	push	de
   7C2B CD A6 76      [17] 1871 	call	_checkEnemyCollision
   7C2E F1            [10] 1872 	pop	af
   7C2F F1            [10] 1873 	pop	af
   7C30 7D            [ 4] 1874 	ld	a,l
   7C31 C1            [10] 1875 	pop	bc
   7C32 E1            [10] 1876 	pop	hl
   7C33 B7            [ 4] 1877 	or	a, a
   7C34 20 30         [12] 1878 	jr	NZ,00110$
                           1879 ;src/main.c:399: switch (enemy->mira) {
   7C36 5E            [ 7] 1880 	ld	e,(hl)
   7C37 3E 03         [ 7] 1881 	ld	a,#0x03
   7C39 93            [ 4] 1882 	sub	a, e
   7C3A 38 2A         [12] 1883 	jr	C,00110$
   7C3C 16 00         [ 7] 1884 	ld	d,#0x00
   7C3E 21 44 7C      [10] 1885 	ld	hl,#00124$
   7C41 19            [11] 1886 	add	hl,de
   7C42 19            [11] 1887 	add	hl,de
                           1888 ;src/main.c:401: case 0:
   7C43 E9            [ 4] 1889 	jp	(hl)
   7C44                    1890 00124$:
   7C44 18 06         [12] 1891 	jr	00101$
   7C46 18 0B         [12] 1892 	jr	00102$
   7C48 18 10         [12] 1893 	jr	00103$
   7C4A 18 15         [12] 1894 	jr	00104$
   7C4C                    1895 00101$:
                           1896 ;src/main.c:402: moverEnemigoDerecha(enemy);
   7C4C C5            [11] 1897 	push	bc
   7C4D CD B4 7A      [17] 1898 	call	_moverEnemigoDerecha
   7C50 F1            [10] 1899 	pop	af
                           1900 ;src/main.c:403: break;
   7C51 18 13         [12] 1901 	jr	00110$
                           1902 ;src/main.c:404: case 1:
   7C53                    1903 00102$:
                           1904 ;src/main.c:405: moverEnemigoIzquierda(enemy);
   7C53 C5            [11] 1905 	push	bc
   7C54 CD C4 7A      [17] 1906 	call	_moverEnemigoIzquierda
   7C57 F1            [10] 1907 	pop	af
                           1908 ;src/main.c:406: break;
   7C58 18 0C         [12] 1909 	jr	00110$
                           1910 ;src/main.c:407: case 2:
   7C5A                    1911 00103$:
                           1912 ;src/main.c:408: moverEnemigoArriba(enemy);
   7C5A C5            [11] 1913 	push	bc
   7C5B CD 76 7A      [17] 1914 	call	_moverEnemigoArriba
   7C5E F1            [10] 1915 	pop	af
                           1916 ;src/main.c:409: break;
   7C5F 18 05         [12] 1917 	jr	00110$
                           1918 ;src/main.c:410: case 3:
   7C61                    1919 00104$:
                           1920 ;src/main.c:411: moverEnemigoAbajo(enemy);
   7C61 C5            [11] 1921 	push	bc
   7C62 CD 95 7A      [17] 1922 	call	_moverEnemigoAbajo
   7C65 F1            [10] 1923 	pop	af
                           1924 ;src/main.c:413: }
   7C66                    1925 00110$:
   7C66 DD E1         [14] 1926 	pop	ix
   7C68 C9            [10] 1927 	ret
                           1928 ;src/main.c:418: void patrol(TEnemy *enemy) {
                           1929 ;	---------------------------------
                           1930 ; Function patrol
                           1931 ; ---------------------------------
   7C69                    1932 _patrol::
                           1933 ;src/main.c:419: if (enemy->onPathPatrol) {
   7C69 D1            [10] 1934 	pop	de
   7C6A C1            [10] 1935 	pop	bc
   7C6B C5            [11] 1936 	push	bc
   7C6C D5            [11] 1937 	push	de
   7C6D C5            [11] 1938 	push	bc
   7C6E FD E1         [14] 1939 	pop	iy
   7C70 FD 7E 0C      [19] 1940 	ld	a,12 (iy)
   7C73 B7            [ 4] 1941 	or	a, a
   7C74 C8            [11] 1942 	ret	Z
                           1943 ;src/main.c:420: moverEnemigoPathfinding(enemy);
   7C75 C5            [11] 1944 	push	bc
   7C76 CD D6 7A      [17] 1945 	call	_moverEnemigoPathfinding
   7C79 F1            [10] 1946 	pop	af
   7C7A C9            [10] 1947 	ret
                           1948 ;src/main.c:424: void lookFor(TEnemy* actual){
                           1949 ;	---------------------------------
                           1950 ; Function lookFor
                           1951 ; ---------------------------------
   7C7B                    1952 _lookFor::
   7C7B DD E5         [15] 1953 	push	ix
   7C7D DD 21 00 00   [14] 1954 	ld	ix,#0
   7C81 DD 39         [15] 1955 	add	ix,sp
   7C83 21 F7 FF      [10] 1956 	ld	hl,#-9
   7C86 39            [11] 1957 	add	hl,sp
   7C87 F9            [ 6] 1958 	ld	sp,hl
                           1959 ;src/main.c:427: u8 interpone = NO;
   7C88 0E 00         [ 7] 1960 	ld	c,#0x00
                           1961 ;src/main.c:429: actual->seen = NO;
   7C8A DD 7E 04      [19] 1962 	ld	a,4 (ix)
   7C8D DD 77 FC      [19] 1963 	ld	-4 (ix),a
   7C90 DD 7E 05      [19] 1964 	ld	a,5 (ix)
   7C93 DD 77 FD      [19] 1965 	ld	-3 (ix),a
   7C96 DD 7E FC      [19] 1966 	ld	a,-4 (ix)
   7C99 C6 11         [ 7] 1967 	add	a, #0x11
   7C9B DD 77 F7      [19] 1968 	ld	-9 (ix),a
   7C9E DD 7E FD      [19] 1969 	ld	a,-3 (ix)
   7CA1 CE 00         [ 7] 1970 	adc	a, #0x00
   7CA3 DD 77 F8      [19] 1971 	ld	-8 (ix),a
   7CA6 E1            [10] 1972 	pop	hl
   7CA7 E5            [11] 1973 	push	hl
   7CA8 36 00         [10] 1974 	ld	(hl),#0x00
                           1975 ;src/main.c:431: if(actual->x > prota.x - 50 && actual->x < prota.x + 50  ){
   7CAA DD 6E FC      [19] 1976 	ld	l,-4 (ix)
   7CAD DD 66 FD      [19] 1977 	ld	h,-3 (ix)
   7CB0 7E            [ 7] 1978 	ld	a,(hl)
   7CB1 DD 77 F9      [19] 1979 	ld	-7 (ix),a
   7CB4 3A C3 69      [13] 1980 	ld	a, (#_prota + 0)
   7CB7 DD 77 FA      [19] 1981 	ld	-6 (ix),a
   7CBA DD 36 FB 00   [19] 1982 	ld	-5 (ix),#0x00
   7CBE DD 7E FA      [19] 1983 	ld	a,-6 (ix)
   7CC1 C6 CE         [ 7] 1984 	add	a,#0xCE
   7CC3 47            [ 4] 1985 	ld	b,a
   7CC4 DD 7E FB      [19] 1986 	ld	a,-5 (ix)
   7CC7 CE FF         [ 7] 1987 	adc	a,#0xFF
   7CC9 5F            [ 4] 1988 	ld	e,a
   7CCA DD 7E F9      [19] 1989 	ld	a,-7 (ix)
   7CCD DD 77 FE      [19] 1990 	ld	-2 (ix),a
   7CD0 DD 36 FF 00   [19] 1991 	ld	-1 (ix),#0x00
   7CD4 78            [ 4] 1992 	ld	a,b
   7CD5 DD 96 FE      [19] 1993 	sub	a, -2 (ix)
   7CD8 7B            [ 4] 1994 	ld	a,e
   7CD9 DD 9E FF      [19] 1995 	sbc	a, -1 (ix)
   7CDC E2 E1 7C      [10] 1996 	jp	PO, 00198$
   7CDF EE 80         [ 7] 1997 	xor	a, #0x80
   7CE1                    1998 00198$:
   7CE1 F2 C4 7D      [10] 1999 	jp	P,00130$
   7CE4 DD 7E FA      [19] 2000 	ld	a,-6 (ix)
   7CE7 C6 32         [ 7] 2001 	add	a, #0x32
   7CE9 47            [ 4] 2002 	ld	b,a
   7CEA DD 7E FB      [19] 2003 	ld	a,-5 (ix)
   7CED CE 00         [ 7] 2004 	adc	a, #0x00
   7CEF 5F            [ 4] 2005 	ld	e,a
   7CF0 DD 7E FE      [19] 2006 	ld	a,-2 (ix)
   7CF3 90            [ 4] 2007 	sub	a, b
   7CF4 DD 7E FF      [19] 2008 	ld	a,-1 (ix)
   7CF7 9B            [ 4] 2009 	sbc	a, e
   7CF8 E2 FD 7C      [10] 2010 	jp	PO, 00199$
   7CFB EE 80         [ 7] 2011 	xor	a, #0x80
   7CFD                    2012 00199$:
   7CFD F2 C4 7D      [10] 2013 	jp	P,00130$
                           2014 ;src/main.c:432: if(actual->y > prota.y - 4 && actual->y < prota.y + 4){
   7D00 DD 7E FC      [19] 2015 	ld	a,-4 (ix)
   7D03 C6 01         [ 7] 2016 	add	a, #0x01
   7D05 DD 77 FE      [19] 2017 	ld	-2 (ix),a
   7D08 DD 7E FD      [19] 2018 	ld	a,-3 (ix)
   7D0B CE 00         [ 7] 2019 	adc	a, #0x00
   7D0D DD 77 FF      [19] 2020 	ld	-1 (ix),a
   7D10 DD 6E FE      [19] 2021 	ld	l,-2 (ix)
   7D13 DD 66 FF      [19] 2022 	ld	h,-1 (ix)
   7D16 46            [ 7] 2023 	ld	b,(hl)
   7D17 21 C4 69      [10] 2024 	ld	hl, #(_prota + 0x0001) + 0
   7D1A 6E            [ 7] 2025 	ld	l,(hl)
   7D1B 26 00         [ 7] 2026 	ld	h,#0x00
   7D1D 7D            [ 4] 2027 	ld	a,l
   7D1E C6 FC         [ 7] 2028 	add	a,#0xFC
   7D20 DD 77 FA      [19] 2029 	ld	-6 (ix),a
   7D23 7C            [ 4] 2030 	ld	a,h
   7D24 CE FF         [ 7] 2031 	adc	a,#0xFF
   7D26 DD 77 FB      [19] 2032 	ld	-5 (ix),a
   7D29 1E 00         [ 7] 2033 	ld	e,#0x00
   7D2B DD 7E FA      [19] 2034 	ld	a,-6 (ix)
   7D2E 90            [ 4] 2035 	sub	a, b
   7D2F DD 7E FB      [19] 2036 	ld	a,-5 (ix)
   7D32 9B            [ 4] 2037 	sbc	a, e
   7D33 E2 38 7D      [10] 2038 	jp	PO, 00200$
   7D36 EE 80         [ 7] 2039 	xor	a, #0x80
   7D38                    2040 00200$:
   7D38 F2 C4 7D      [10] 2041 	jp	P,00130$
   7D3B 23            [ 6] 2042 	inc	hl
   7D3C 23            [ 6] 2043 	inc	hl
   7D3D 23            [ 6] 2044 	inc	hl
   7D3E 23            [ 6] 2045 	inc	hl
   7D3F 78            [ 4] 2046 	ld	a,b
   7D40 95            [ 4] 2047 	sub	a, l
   7D41 7B            [ 4] 2048 	ld	a,e
   7D42 9C            [ 4] 2049 	sbc	a, h
   7D43 E2 48 7D      [10] 2050 	jp	PO, 00201$
   7D46 EE 80         [ 7] 2051 	xor	a, #0x80
   7D48                    2052 00201$:
   7D48 F2 C4 7D      [10] 2053 	jp	P,00130$
                           2054 ;src/main.c:433: if(actual->x > prota.x){
   7D4B 21 C3 69      [10] 2055 	ld	hl, #_prota + 0
   7D4E 46            [ 7] 2056 	ld	b,(hl)
   7D4F 78            [ 4] 2057 	ld	a,b
   7D50 DD 96 F9      [19] 2058 	sub	a, -7 (ix)
   7D53 3E 00         [ 7] 2059 	ld	a,#0x00
   7D55 17            [ 4] 2060 	rla
   7D56 B7            [ 4] 2061 	or	a, a
   7D57 28 32         [12] 2062 	jr	Z,00114$
                           2063 ;src/main.c:434: i = prota.x;
                           2064 ;src/main.c:435: for (i; i<actual->x && !interpone; i++){
   7D59                    2065 00124$:
   7D59 DD 6E FC      [19] 2066 	ld	l,-4 (ix)
   7D5C DD 66 FD      [19] 2067 	ld	h,-3 (ix)
   7D5F 5E            [ 7] 2068 	ld	e,(hl)
   7D60 78            [ 4] 2069 	ld	a,b
   7D61 93            [ 4] 2070 	sub	a, e
   7D62 30 1D         [12] 2071 	jr	NC,00103$
   7D64 79            [ 4] 2072 	ld	a,c
   7D65 B7            [ 4] 2073 	or	a, a
   7D66 20 19         [12] 2074 	jr	NZ,00103$
                           2075 ;src/main.c:436: if(*getTilePtr(i , prota.y) > 2){
   7D68 21 C4 69      [10] 2076 	ld	hl, #(_prota + 0x0001) + 0
   7D6B 56            [ 7] 2077 	ld	d,(hl)
   7D6C C5            [11] 2078 	push	bc
   7D6D D5            [11] 2079 	push	de
   7D6E 33            [ 6] 2080 	inc	sp
   7D6F C5            [11] 2081 	push	bc
   7D70 33            [ 6] 2082 	inc	sp
   7D71 CD 6B 73      [17] 2083 	call	_getTilePtr
   7D74 F1            [10] 2084 	pop	af
   7D75 C1            [10] 2085 	pop	bc
   7D76 5E            [ 7] 2086 	ld	e,(hl)
   7D77 3E 02         [ 7] 2087 	ld	a,#0x02
   7D79 93            [ 4] 2088 	sub	a, e
   7D7A 30 02         [12] 2089 	jr	NC,00125$
                           2090 ;src/main.c:437: interpone = SI;
   7D7C 0E 01         [ 7] 2091 	ld	c,#0x01
   7D7E                    2092 00125$:
                           2093 ;src/main.c:435: for (i; i<actual->x && !interpone; i++){
   7D7E 04            [ 4] 2094 	inc	b
   7D7F 18 D8         [12] 2095 	jr	00124$
   7D81                    2096 00103$:
                           2097 ;src/main.c:440: if(!interpone){
   7D81 79            [ 4] 2098 	ld	a,c
   7D82 B7            [ 4] 2099 	or	a, a
   7D83 20 3F         [12] 2100 	jr	NZ,00130$
                           2101 ;src/main.c:441: actual->seen = SI;
   7D85 E1            [10] 2102 	pop	hl
   7D86 E5            [11] 2103 	push	hl
   7D87 36 01         [10] 2104 	ld	(hl),#0x01
   7D89 18 39         [12] 2105 	jr	00130$
   7D8B                    2106 00114$:
                           2107 ;src/main.c:443: }else if(actual->x > prota.x){
   7D8B B7            [ 4] 2108 	or	a, a
   7D8C 28 36         [12] 2109 	jr	Z,00130$
                           2110 ;src/main.c:444: i = actual->x;
   7D8E DD 5E F9      [19] 2111 	ld	e,-7 (ix)
                           2112 ;src/main.c:445: for (i; i<prota.x && !interpone; i++){
   7D91                    2113 00128$:
   7D91 21 C3 69      [10] 2114 	ld	hl, #_prota + 0
   7D94 46            [ 7] 2115 	ld	b,(hl)
   7D95 7B            [ 4] 2116 	ld	a,e
   7D96 90            [ 4] 2117 	sub	a, b
   7D97 30 23         [12] 2118 	jr	NC,00108$
   7D99 79            [ 4] 2119 	ld	a,c
   7D9A B7            [ 4] 2120 	or	a, a
   7D9B 20 1F         [12] 2121 	jr	NZ,00108$
                           2122 ;src/main.c:446: if(*getTilePtr(i, actual->y) > 2){
   7D9D DD 6E FE      [19] 2123 	ld	l,-2 (ix)
   7DA0 DD 66 FF      [19] 2124 	ld	h,-1 (ix)
   7DA3 46            [ 7] 2125 	ld	b,(hl)
   7DA4 C5            [11] 2126 	push	bc
   7DA5 D5            [11] 2127 	push	de
   7DA6 C5            [11] 2128 	push	bc
   7DA7 33            [ 6] 2129 	inc	sp
   7DA8 7B            [ 4] 2130 	ld	a,e
   7DA9 F5            [11] 2131 	push	af
   7DAA 33            [ 6] 2132 	inc	sp
   7DAB CD 6B 73      [17] 2133 	call	_getTilePtr
   7DAE F1            [10] 2134 	pop	af
   7DAF D1            [10] 2135 	pop	de
   7DB0 C1            [10] 2136 	pop	bc
   7DB1 46            [ 7] 2137 	ld	b,(hl)
   7DB2 3E 02         [ 7] 2138 	ld	a,#0x02
   7DB4 90            [ 4] 2139 	sub	a, b
   7DB5 30 02         [12] 2140 	jr	NC,00129$
                           2141 ;src/main.c:447: interpone = SI;
   7DB7 0E 01         [ 7] 2142 	ld	c,#0x01
   7DB9                    2143 00129$:
                           2144 ;src/main.c:445: for (i; i<prota.x && !interpone; i++){
   7DB9 1C            [ 4] 2145 	inc	e
   7DBA 18 D5         [12] 2146 	jr	00128$
   7DBC                    2147 00108$:
                           2148 ;src/main.c:450: if(!interpone){
   7DBC 79            [ 4] 2149 	ld	a,c
   7DBD B7            [ 4] 2150 	or	a, a
   7DBE 20 04         [12] 2151 	jr	NZ,00130$
                           2152 ;src/main.c:451: actual->seen = SI;
   7DC0 E1            [10] 2153 	pop	hl
   7DC1 E5            [11] 2154 	push	hl
   7DC2 36 01         [10] 2155 	ld	(hl),#0x01
   7DC4                    2156 00130$:
   7DC4 DD F9         [10] 2157 	ld	sp, ix
   7DC6 DD E1         [14] 2158 	pop	ix
   7DC8 C9            [10] 2159 	ret
                           2160 ;src/main.c:458: void seek(TEnemy* actual){
                           2161 ;	---------------------------------
                           2162 ; Function seek
                           2163 ; ---------------------------------
   7DC9                    2164 _seek::
                           2165 ;src/main.c:460: moverEnemigoPathfinding(enemy);
   7DC9 21 B7 64      [10] 2166 	ld	hl,#_enemy
   7DCC E5            [11] 2167 	push	hl
   7DCD CD D6 7A      [17] 2168 	call	_moverEnemigoPathfinding
   7DD0 F1            [10] 2169 	pop	af
   7DD1 C9            [10] 2170 	ret
                           2171 ;src/main.c:463: void updateEnemies() {
                           2172 ;	---------------------------------
                           2173 ; Function updateEnemies
                           2174 ; ---------------------------------
   7DD2                    2175 _updateEnemies::
   7DD2 DD E5         [15] 2176 	push	ix
   7DD4 DD 21 00 00   [14] 2177 	ld	ix,#0
   7DD8 DD 39         [15] 2178 	add	ix,sp
   7DDA 21 F8 FF      [10] 2179 	ld	hl,#-8
   7DDD 39            [11] 2180 	add	hl,sp
   7DDE F9            [ 6] 2181 	ld	sp,hl
                           2182 ;src/main.c:465: u8 i = 1 + 1;
   7DDF DD 36 F8 02   [19] 2183 	ld	-8 (ix),#0x02
                           2184 ;src/main.c:468: actual = enemy;
                           2185 ;src/main.c:470: while (--i) {
   7DE3 DD 36 FA B7   [19] 2186 	ld	-6 (ix),#<(_enemy)
   7DE7 DD 36 FB 64   [19] 2187 	ld	-5 (ix),#>(_enemy)
   7DEB DD 36 FE B7   [19] 2188 	ld	-2 (ix),#<(_enemy)
   7DEF DD 36 FF 64   [19] 2189 	ld	-1 (ix),#>(_enemy)
   7DF3 DD 36 FC B7   [19] 2190 	ld	-4 (ix),#<(_enemy)
   7DF7 DD 36 FD 64   [19] 2191 	ld	-3 (ix),#>(_enemy)
   7DFB                    2192 00120$:
   7DFB DD 35 F8      [23] 2193 	dec	-8 (ix)
   7DFE DD 7E F8      [19] 2194 	ld	a, -8 (ix)
   7E01 B7            [ 4] 2195 	or	a, a
   7E02 CA B6 7E      [10] 2196 	jp	Z,00123$
                           2197 ;src/main.c:471: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   7E05 21 B7 64      [10] 2198 	ld	hl,#_enemy
   7E08 E5            [11] 2199 	push	hl
   7E09 CD 7B 7C      [17] 2200 	call	_lookFor
   7E0C F1            [10] 2201 	pop	af
                           2202 ;src/main.c:472: if (actual->patrolling) { // esta patrullando
   7E0D 3A C2 64      [13] 2203 	ld	a, (#(_enemy + 0x000b) + 0)
   7E10 B7            [ 4] 2204 	or	a, a
   7E11 CA 95 7E      [10] 2205 	jp	Z,00118$
                           2206 ;src/main.c:473: if (!actual->seen) {
   7E14 DD 6E FA      [19] 2207 	ld	l,-6 (ix)
   7E17 DD 66 FB      [19] 2208 	ld	h,-5 (ix)
   7E1A 11 11 00      [10] 2209 	ld	de, #0x0011
   7E1D 19            [11] 2210 	add	hl, de
   7E1E 4E            [ 7] 2211 	ld	c,(hl)
   7E1F 79            [ 4] 2212 	ld	a,c
   7E20 B7            [ 4] 2213 	or	a, a
   7E21 20 0A         [12] 2214 	jr	NZ,00107$
                           2215 ;src/main.c:474: patrol(actual);
   7E23 21 B7 64      [10] 2216 	ld	hl,#_enemy
   7E26 E5            [11] 2217 	push	hl
   7E27 CD 69 7C      [17] 2218 	call	_patrol
   7E2A F1            [10] 2219 	pop	af
   7E2B 18 CE         [12] 2220 	jr	00120$
   7E2D                    2221 00107$:
                           2222 ;src/main.c:481: actual->onPathPatrol = 0;
                           2223 ;src/main.c:475: } else if (actual->seen) {
   7E2D 79            [ 4] 2224 	ld	a,c
   7E2E B7            [ 4] 2225 	or	a, a
   7E2F 28 48         [12] 2226 	jr	Z,00104$
                           2227 ;src/main.c:476: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   7E31 21 C4 69      [10] 2228 	ld	hl, #_prota + 1
   7E34 46            [ 7] 2229 	ld	b,(hl)
   7E35 3A C3 69      [13] 2230 	ld	a,(#_prota + 0)
   7E38 DD 77 F9      [19] 2231 	ld	-7 (ix),a
   7E3B 21 B7 64      [10] 2232 	ld	hl,#_enemy
   7E3E 23            [ 6] 2233 	inc	hl
   7E3F 4E            [ 7] 2234 	ld	c,(hl)
   7E40 21 B7 64      [10] 2235 	ld	hl, #_enemy + 0
   7E43 5E            [ 7] 2236 	ld	e,(hl)
   7E44 2A D6 69      [16] 2237 	ld	hl,(_mapa)
   7E47 E5            [11] 2238 	push	hl
   7E48 21 B7 64      [10] 2239 	ld	hl,#_enemy
   7E4B E5            [11] 2240 	push	hl
   7E4C C5            [11] 2241 	push	bc
   7E4D 33            [ 6] 2242 	inc	sp
   7E4E DD 7E F9      [19] 2243 	ld	a,-7 (ix)
   7E51 F5            [11] 2244 	push	af
   7E52 33            [ 6] 2245 	inc	sp
   7E53 51            [ 4] 2246 	ld	d, c
   7E54 D5            [11] 2247 	push	de
   7E55 CD 06 54      [17] 2248 	call	_pathFinding
   7E58 21 08 00      [10] 2249 	ld	hl,#8
   7E5B 39            [11] 2250 	add	hl,sp
   7E5C F9            [ 6] 2251 	ld	sp,hl
                           2252 ;src/main.c:477: actual->seek = 1;
   7E5D 21 CA 64      [10] 2253 	ld	hl,#(_enemy + 0x0013)
   7E60 36 01         [10] 2254 	ld	(hl),#0x01
                           2255 ;src/main.c:478: actual->iter=0;
   7E62 21 C5 64      [10] 2256 	ld	hl,#(_enemy + 0x000e)
   7E65 36 00         [10] 2257 	ld	(hl),#0x00
                           2258 ;src/main.c:479: actual->reversePatrol = NO;
   7E67 21 C4 64      [10] 2259 	ld	hl,#(_enemy + 0x000d)
   7E6A 36 00         [10] 2260 	ld	(hl),#0x00
                           2261 ;src/main.c:480: actual->patrolling = 0;
   7E6C 21 C2 64      [10] 2262 	ld	hl,#(_enemy + 0x000b)
   7E6F 36 00         [10] 2263 	ld	(hl),#0x00
                           2264 ;src/main.c:481: actual->onPathPatrol = 0;
   7E71 21 C3 64      [10] 2265 	ld	hl,#(_enemy + 0x000c)
   7E74 36 00         [10] 2266 	ld	(hl),#0x00
   7E76 C3 FB 7D      [10] 2267 	jp	00120$
   7E79                    2268 00104$:
                           2269 ;src/main.c:482: } else if (actual->inRange) {
   7E79 DD 6E FE      [19] 2270 	ld	l,-2 (ix)
   7E7C DD 66 FF      [19] 2271 	ld	h,-1 (ix)
   7E7F 11 10 00      [10] 2272 	ld	de, #0x0010
   7E82 19            [11] 2273 	add	hl, de
   7E83 7E            [ 7] 2274 	ld	a,(hl)
   7E84 B7            [ 4] 2275 	or	a, a
   7E85 CA FB 7D      [10] 2276 	jp	Z,00120$
                           2277 ;src/main.c:484: actual->patrolling = 0;
   7E88 21 C2 64      [10] 2278 	ld	hl,#(_enemy + 0x000b)
   7E8B 36 00         [10] 2279 	ld	(hl),#0x00
                           2280 ;src/main.c:485: actual->onPathPatrol = 0;
   7E8D 21 C3 64      [10] 2281 	ld	hl,#(_enemy + 0x000c)
   7E90 36 00         [10] 2282 	ld	(hl),#0x00
   7E92 C3 FB 7D      [10] 2283 	jp	00120$
   7E95                    2284 00118$:
                           2285 ;src/main.c:487: } else if (actual->seek) { // esta buscando
   7E95 3A CA 64      [13] 2286 	ld	a, (#(_enemy + 0x0013) + 0)
   7E98 B7            [ 4] 2287 	or	a, a
   7E99 CA FB 7D      [10] 2288 	jp	Z,00120$
                           2289 ;src/main.c:488: if (!actual->found /*&& actual->seekTimer <= 5*/) {
   7E9C DD 6E FC      [19] 2290 	ld	l,-4 (ix)
   7E9F DD 66 FD      [19] 2291 	ld	h,-3 (ix)
   7EA2 11 12 00      [10] 2292 	ld	de, #0x0012
   7EA5 19            [11] 2293 	add	hl, de
   7EA6 7E            [ 7] 2294 	ld	a,(hl)
   7EA7 B7            [ 4] 2295 	or	a, a
   7EA8 C2 FB 7D      [10] 2296 	jp	NZ,00120$
                           2297 ;src/main.c:489: seek(actual); // buscar en posiciones cercanas a la actual
   7EAB 21 B7 64      [10] 2298 	ld	hl,#_enemy
   7EAE E5            [11] 2299 	push	hl
   7EAF CD C9 7D      [17] 2300 	call	_seek
   7EB2 F1            [10] 2301 	pop	af
   7EB3 C3 FB 7D      [10] 2302 	jp	00120$
                           2303 ;src/main.c:492: } else if (actual->engage) {
   7EB6                    2304 00123$:
   7EB6 DD F9         [10] 2305 	ld	sp, ix
   7EB8 DD E1         [14] 2306 	pop	ix
   7EBA C9            [10] 2307 	ret
                           2308 ;src/main.c:501: void avanzarMapa() {
                           2309 ;	---------------------------------
                           2310 ; Function avanzarMapa
                           2311 ; ---------------------------------
   7EBB                    2312 _avanzarMapa::
                           2313 ;src/main.c:502: if(num_mapa < NUM_MAPAS -1) {
   7EBB 3A D8 69      [13] 2314 	ld	a,(#_num_mapa + 0)
   7EBE D6 02         [ 7] 2315 	sub	a, #0x02
   7EC0 D2 20 73      [10] 2316 	jp	NC,_menuFin
                           2317 ;src/main.c:503: mapa = mapas[++num_mapa];
   7EC3 21 D8 69      [10] 2318 	ld	hl, #_num_mapa+0
   7EC6 34            [11] 2319 	inc	(hl)
   7EC7 FD 21 D8 69   [14] 2320 	ld	iy,#_num_mapa
   7ECB FD 6E 00      [19] 2321 	ld	l,0 (iy)
   7ECE 26 00         [ 7] 2322 	ld	h,#0x00
   7ED0 29            [11] 2323 	add	hl, hl
   7ED1 11 76 72      [10] 2324 	ld	de,#_mapas
   7ED4 19            [11] 2325 	add	hl,de
   7ED5 7E            [ 7] 2326 	ld	a,(hl)
   7ED6 FD 21 D6 69   [14] 2327 	ld	iy,#_mapa
   7EDA FD 77 00      [19] 2328 	ld	0 (iy),a
   7EDD 23            [ 6] 2329 	inc	hl
   7EDE 7E            [ 7] 2330 	ld	a,(hl)
   7EDF 32 D7 69      [13] 2331 	ld	(#_mapa + 1),a
                           2332 ;src/main.c:504: prota.x = prota.px = 2;
   7EE2 21 C5 69      [10] 2333 	ld	hl,#(_prota + 0x0002)
   7EE5 36 02         [10] 2334 	ld	(hl),#0x02
   7EE7 21 C3 69      [10] 2335 	ld	hl,#_prota
   7EEA 36 02         [10] 2336 	ld	(hl),#0x02
                           2337 ;src/main.c:505: prota.mover = SI;
   7EEC 21 C9 69      [10] 2338 	ld	hl,#(_prota + 0x0006)
   7EEF 36 01         [10] 2339 	ld	(hl),#0x01
                           2340 ;src/main.c:506: dibujarMapa();
   7EF1 CD 60 72      [17] 2341 	call	_dibujarMapa
                           2342 ;src/main.c:507: inicializarEnemy();
   7EF4 C3 DB 84      [10] 2343 	jp  _inicializarEnemy
                           2344 ;src/main.c:511: menuFin();
   7EF7 C3 20 73      [10] 2345 	jp  _menuFin
                           2346 ;src/main.c:515: void moverIzquierda() {
                           2347 ;	---------------------------------
                           2348 ; Function moverIzquierda
                           2349 ; ---------------------------------
   7EFA                    2350 _moverIzquierda::
                           2351 ;src/main.c:516: prota.mira = M_izquierda;
   7EFA 01 C3 69      [10] 2352 	ld	bc,#_prota+0
   7EFD 21 CA 69      [10] 2353 	ld	hl,#(_prota + 0x0007)
   7F00 36 01         [10] 2354 	ld	(hl),#0x01
                           2355 ;src/main.c:517: if (!checkCollision(M_izquierda)) {
   7F02 C5            [11] 2356 	push	bc
   7F03 21 01 00      [10] 2357 	ld	hl,#0x0001
   7F06 E5            [11] 2358 	push	hl
   7F07 CD AC 73      [17] 2359 	call	_checkCollision
   7F0A F1            [10] 2360 	pop	af
   7F0B C1            [10] 2361 	pop	bc
   7F0C 7D            [ 4] 2362 	ld	a,l
   7F0D B7            [ 4] 2363 	or	a, a
   7F0E C0            [11] 2364 	ret	NZ
                           2365 ;src/main.c:518: prota.x--;
   7F0F 0A            [ 7] 2366 	ld	a,(bc)
   7F10 C6 FF         [ 7] 2367 	add	a,#0xFF
   7F12 02            [ 7] 2368 	ld	(bc),a
                           2369 ;src/main.c:519: prota.mover = SI;
   7F13 21 C9 69      [10] 2370 	ld	hl,#(_prota + 0x0006)
   7F16 36 01         [10] 2371 	ld	(hl),#0x01
                           2372 ;src/main.c:520: prota.sprite = g_hero_left;
   7F18 21 FE 49      [10] 2373 	ld	hl,#_g_hero_left
   7F1B 22 C7 69      [16] 2374 	ld	((_prota + 0x0004)), hl
   7F1E C9            [10] 2375 	ret
                           2376 ;src/main.c:524: void moverDerecha() {
                           2377 ;	---------------------------------
                           2378 ; Function moverDerecha
                           2379 ; ---------------------------------
   7F1F                    2380 _moverDerecha::
                           2381 ;src/main.c:525: prota.mira = M_derecha;
   7F1F 21 CA 69      [10] 2382 	ld	hl,#(_prota + 0x0007)
   7F22 36 00         [10] 2383 	ld	(hl),#0x00
                           2384 ;src/main.c:526: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7F24 21 00 00      [10] 2385 	ld	hl,#0x0000
   7F27 E5            [11] 2386 	push	hl
   7F28 CD AC 73      [17] 2387 	call	_checkCollision
   7F2B F1            [10] 2388 	pop	af
   7F2C 45            [ 4] 2389 	ld	b,l
   7F2D 21 C3 69      [10] 2390 	ld	hl, #_prota + 0
   7F30 4E            [ 7] 2391 	ld	c,(hl)
   7F31 59            [ 4] 2392 	ld	e,c
   7F32 16 00         [ 7] 2393 	ld	d,#0x00
   7F34 21 07 00      [10] 2394 	ld	hl,#0x0007
   7F37 19            [11] 2395 	add	hl,de
   7F38 11 50 80      [10] 2396 	ld	de, #0x8050
   7F3B 29            [11] 2397 	add	hl, hl
   7F3C 3F            [ 4] 2398 	ccf
   7F3D CB 1C         [ 8] 2399 	rr	h
   7F3F CB 1D         [ 8] 2400 	rr	l
   7F41 ED 52         [15] 2401 	sbc	hl, de
   7F43 3E 00         [ 7] 2402 	ld	a,#0x00
   7F45 17            [ 4] 2403 	rla
   7F46 5F            [ 4] 2404 	ld	e,a
   7F47 78            [ 4] 2405 	ld	a,b
   7F48 B7            [ 4] 2406 	or	a,a
   7F49 20 14         [12] 2407 	jr	NZ,00104$
   7F4B B3            [ 4] 2408 	or	a,e
   7F4C 28 11         [12] 2409 	jr	Z,00104$
                           2410 ;src/main.c:527: prota.x++;
   7F4E 0C            [ 4] 2411 	inc	c
   7F4F 21 C3 69      [10] 2412 	ld	hl,#_prota
   7F52 71            [ 7] 2413 	ld	(hl),c
                           2414 ;src/main.c:528: prota.mover = SI;
   7F53 21 C9 69      [10] 2415 	ld	hl,#(_prota + 0x0006)
   7F56 36 01         [10] 2416 	ld	(hl),#0x01
                           2417 ;src/main.c:529: prota.sprite = g_hero;
   7F58 21 A8 4A      [10] 2418 	ld	hl,#_g_hero
   7F5B 22 C7 69      [16] 2419 	ld	((_prota + 0x0004)), hl
   7F5E C9            [10] 2420 	ret
   7F5F                    2421 00104$:
                           2422 ;src/main.c:531: }else if( prota.x + G_HERO_W >= 80){
   7F5F 7B            [ 4] 2423 	ld	a,e
   7F60 B7            [ 4] 2424 	or	a, a
   7F61 C0            [11] 2425 	ret	NZ
                           2426 ;src/main.c:532: avanzarMapa();
   7F62 C3 BB 7E      [10] 2427 	jp  _avanzarMapa
                           2428 ;src/main.c:536: void moverArriba() {
                           2429 ;	---------------------------------
                           2430 ; Function moverArriba
                           2431 ; ---------------------------------
   7F65                    2432 _moverArriba::
                           2433 ;src/main.c:537: prota.mira = M_arriba;
   7F65 21 CA 69      [10] 2434 	ld	hl,#(_prota + 0x0007)
   7F68 36 02         [10] 2435 	ld	(hl),#0x02
                           2436 ;src/main.c:538: if (!checkCollision(M_arriba)) { // TODO: COMPROBAR
   7F6A 21 02 00      [10] 2437 	ld	hl,#0x0002
   7F6D E5            [11] 2438 	push	hl
   7F6E CD AC 73      [17] 2439 	call	_checkCollision
   7F71 F1            [10] 2440 	pop	af
   7F72 7D            [ 4] 2441 	ld	a,l
   7F73 B7            [ 4] 2442 	or	a, a
   7F74 C0            [11] 2443 	ret	NZ
                           2444 ;src/main.c:539: prota.y--;
   7F75 21 C4 69      [10] 2445 	ld	hl,#_prota + 1
   7F78 4E            [ 7] 2446 	ld	c,(hl)
   7F79 0D            [ 4] 2447 	dec	c
   7F7A 71            [ 7] 2448 	ld	(hl),c
                           2449 ;src/main.c:540: prota.y--;
   7F7B 0D            [ 4] 2450 	dec	c
   7F7C 71            [ 7] 2451 	ld	(hl),c
                           2452 ;src/main.c:541: prota.mover  = SI;
   7F7D 21 C9 69      [10] 2453 	ld	hl,#(_prota + 0x0006)
   7F80 36 01         [10] 2454 	ld	(hl),#0x01
                           2455 ;src/main.c:542: prota.sprite = g_hero_up;
   7F82 21 64 49      [10] 2456 	ld	hl,#_g_hero_up
   7F85 22 C7 69      [16] 2457 	ld	((_prota + 0x0004)), hl
   7F88 C9            [10] 2458 	ret
                           2459 ;src/main.c:546: void moverAbajo() {
                           2460 ;	---------------------------------
                           2461 ; Function moverAbajo
                           2462 ; ---------------------------------
   7F89                    2463 _moverAbajo::
                           2464 ;src/main.c:547: prota.mira = M_abajo;
   7F89 21 CA 69      [10] 2465 	ld	hl,#(_prota + 0x0007)
   7F8C 36 03         [10] 2466 	ld	(hl),#0x03
                           2467 ;src/main.c:548: if (!checkCollision(M_abajo) ) { // TODO: COMPROBAR
   7F8E 21 03 00      [10] 2468 	ld	hl,#0x0003
   7F91 E5            [11] 2469 	push	hl
   7F92 CD AC 73      [17] 2470 	call	_checkCollision
   7F95 F1            [10] 2471 	pop	af
   7F96 7D            [ 4] 2472 	ld	a,l
   7F97 B7            [ 4] 2473 	or	a, a
   7F98 C0            [11] 2474 	ret	NZ
                           2475 ;src/main.c:549: prota.y++;
   7F99 01 C4 69      [10] 2476 	ld	bc,#_prota + 1
   7F9C 0A            [ 7] 2477 	ld	a,(bc)
   7F9D 3C            [ 4] 2478 	inc	a
   7F9E 02            [ 7] 2479 	ld	(bc),a
                           2480 ;src/main.c:550: prota.y++;
   7F9F 3C            [ 4] 2481 	inc	a
   7FA0 02            [ 7] 2482 	ld	(bc),a
                           2483 ;src/main.c:551: prota.mover  = SI;
   7FA1 21 C9 69      [10] 2484 	ld	hl,#(_prota + 0x0006)
   7FA4 36 01         [10] 2485 	ld	(hl),#0x01
                           2486 ;src/main.c:552: prota.sprite = g_hero_down;
   7FA6 21 CA 48      [10] 2487 	ld	hl,#_g_hero_down
   7FA9 22 C7 69      [16] 2488 	ld	((_prota + 0x0004)), hl
   7FAC C9            [10] 2489 	ret
                           2490 ;src/main.c:556: void dibujarCuchillo() {
                           2491 ;	---------------------------------
                           2492 ; Function dibujarCuchillo
                           2493 ; ---------------------------------
   7FAD                    2494 _dibujarCuchillo::
   7FAD DD E5         [15] 2495 	push	ix
   7FAF DD 21 00 00   [14] 2496 	ld	ix,#0
   7FB3 DD 39         [15] 2497 	add	ix,sp
   7FB5 F5            [11] 2498 	push	af
                           2499 ;src/main.c:557: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   7FB6 21 CC 69      [10] 2500 	ld	hl, #_cu + 1
   7FB9 56            [ 7] 2501 	ld	d,(hl)
   7FBA 21 CB 69      [10] 2502 	ld	hl, #_cu + 0
   7FBD 46            [ 7] 2503 	ld	b,(hl)
   7FBE D5            [11] 2504 	push	de
   7FBF 33            [ 6] 2505 	inc	sp
   7FC0 C5            [11] 2506 	push	bc
   7FC1 33            [ 6] 2507 	inc	sp
   7FC2 21 00 C0      [10] 2508 	ld	hl,#0xC000
   7FC5 E5            [11] 2509 	push	hl
   7FC6 CD 5A 64      [17] 2510 	call	_cpct_getScreenPtr
   7FC9 45            [ 4] 2511 	ld	b,l
   7FCA 5C            [ 4] 2512 	ld	e,h
                           2513 ;src/main.c:558: if(cu.eje == E_X){
   7FCB 21 D3 69      [10] 2514 	ld	hl, #_cu + 8
   7FCE 4E            [ 7] 2515 	ld	c,(hl)
                           2516 ;src/main.c:559: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   7FCF DD 70 FE      [19] 2517 	ld	-2 (ix),b
   7FD2 DD 73 FF      [19] 2518 	ld	-1 (ix),e
                           2519 ;src/main.c:558: if(cu.eje == E_X){
   7FD5 79            [ 4] 2520 	ld	a,c
   7FD6 B7            [ 4] 2521 	or	a, a
   7FD7 20 19         [12] 2522 	jr	NZ,00104$
                           2523 ;src/main.c:559: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   7FD9 11 00 0E      [10] 2524 	ld	de,#_g_tablatrans+0
   7FDC ED 4B CF 69   [20] 2525 	ld	bc, (#(_cu + 0x0004) + 0)
   7FE0 D5            [11] 2526 	push	de
   7FE1 21 04 04      [10] 2527 	ld	hl,#0x0404
   7FE4 E5            [11] 2528 	push	hl
   7FE5 DD 6E FE      [19] 2529 	ld	l,-2 (ix)
   7FE8 DD 66 FF      [19] 2530 	ld	h,-1 (ix)
   7FEB E5            [11] 2531 	push	hl
   7FEC C5            [11] 2532 	push	bc
   7FED CD 7A 64      [17] 2533 	call	_cpct_drawSpriteMaskedAlignedTable
   7FF0 18 1A         [12] 2534 	jr	00106$
   7FF2                    2535 00104$:
                           2536 ;src/main.c:562: else if(cu.eje == E_Y){
   7FF2 0D            [ 4] 2537 	dec	c
   7FF3 20 17         [12] 2538 	jr	NZ,00106$
                           2539 ;src/main.c:563: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   7FF5 11 00 0E      [10] 2540 	ld	de,#_g_tablatrans+0
   7FF8 ED 4B CF 69   [20] 2541 	ld	bc, (#(_cu + 0x0004) + 0)
   7FFC D5            [11] 2542 	push	de
   7FFD 21 02 08      [10] 2543 	ld	hl,#0x0802
   8000 E5            [11] 2544 	push	hl
   8001 DD 6E FE      [19] 2545 	ld	l,-2 (ix)
   8004 DD 66 FF      [19] 2546 	ld	h,-1 (ix)
   8007 E5            [11] 2547 	push	hl
   8008 C5            [11] 2548 	push	bc
   8009 CD 7A 64      [17] 2549 	call	_cpct_drawSpriteMaskedAlignedTable
   800C                    2550 00106$:
   800C DD F9         [10] 2551 	ld	sp, ix
   800E DD E1         [14] 2552 	pop	ix
   8010 C9            [10] 2553 	ret
                           2554 ;src/main.c:567: void borrarCuchillo() {
                           2555 ;	---------------------------------
                           2556 ; Function borrarCuchillo
                           2557 ; ---------------------------------
   8011                    2558 _borrarCuchillo::
   8011 DD E5         [15] 2559 	push	ix
   8013 DD 21 00 00   [14] 2560 	ld	ix,#0
   8017 DD 39         [15] 2561 	add	ix,sp
   8019 F5            [11] 2562 	push	af
   801A 3B            [ 6] 2563 	dec	sp
                           2564 ;src/main.c:569: u8 w = 2 + (cu.px & 1);
   801B 21 CD 69      [10] 2565 	ld	hl, #_cu + 2
   801E 4E            [ 7] 2566 	ld	c,(hl)
   801F 79            [ 4] 2567 	ld	a,c
   8020 E6 01         [ 7] 2568 	and	a, #0x01
   8022 47            [ 4] 2569 	ld	b,a
   8023 04            [ 4] 2570 	inc	b
   8024 04            [ 4] 2571 	inc	b
                           2572 ;src/main.c:570: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   8025 21 CE 69      [10] 2573 	ld	hl, #_cu + 3
   8028 5E            [ 7] 2574 	ld	e,(hl)
   8029 7B            [ 4] 2575 	ld	a,e
   802A E6 03         [ 7] 2576 	and	a, #0x03
   802C 28 04         [12] 2577 	jr	Z,00105$
   802E 3E 01         [ 7] 2578 	ld	a,#0x01
   8030 18 02         [12] 2579 	jr	00106$
   8032                    2580 00105$:
   8032 3E 00         [ 7] 2581 	ld	a,#0x00
   8034                    2582 00106$:
   8034 C6 02         [ 7] 2583 	add	a, #0x02
   8036 DD 77 FD      [19] 2584 	ld	-3 (ix),a
                           2585 ;src/main.c:571: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   8039 FD 2A D6 69   [20] 2586 	ld	iy,(_mapa)
   803D 16 00         [ 7] 2587 	ld	d,#0x00
   803F 7B            [ 4] 2588 	ld	a,e
   8040 C6 E8         [ 7] 2589 	add	a,#0xE8
   8042 DD 77 FE      [19] 2590 	ld	-2 (ix),a
   8045 7A            [ 4] 2591 	ld	a,d
   8046 CE FF         [ 7] 2592 	adc	a,#0xFF
   8048 DD 77 FF      [19] 2593 	ld	-1 (ix),a
   804B DD 6E FE      [19] 2594 	ld	l,-2 (ix)
   804E DD 66 FF      [19] 2595 	ld	h,-1 (ix)
   8051 DD CB FF 7E   [20] 2596 	bit	7, -1 (ix)
   8055 28 04         [12] 2597 	jr	Z,00107$
   8057 21 EB FF      [10] 2598 	ld	hl,#0xFFEB
   805A 19            [11] 2599 	add	hl,de
   805B                    2600 00107$:
   805B CB 2C         [ 8] 2601 	sra	h
   805D CB 1D         [ 8] 2602 	rr	l
   805F CB 2C         [ 8] 2603 	sra	h
   8061 CB 1D         [ 8] 2604 	rr	l
   8063 55            [ 4] 2605 	ld	d,l
   8064 CB 39         [ 8] 2606 	srl	c
   8066 FD E5         [15] 2607 	push	iy
   8068 21 F0 C0      [10] 2608 	ld	hl,#0xC0F0
   806B E5            [11] 2609 	push	hl
   806C 3E 28         [ 7] 2610 	ld	a,#0x28
   806E F5            [11] 2611 	push	af
   806F 33            [ 6] 2612 	inc	sp
   8070 DD 7E FD      [19] 2613 	ld	a,-3 (ix)
   8073 F5            [11] 2614 	push	af
   8074 33            [ 6] 2615 	inc	sp
   8075 C5            [11] 2616 	push	bc
   8076 33            [ 6] 2617 	inc	sp
   8077 D5            [11] 2618 	push	de
   8078 33            [ 6] 2619 	inc	sp
   8079 79            [ 4] 2620 	ld	a,c
   807A F5            [11] 2621 	push	af
   807B 33            [ 6] 2622 	inc	sp
   807C CD 53 59      [17] 2623 	call	_cpct_etm_drawTileBox2x4
                           2624 ;src/main.c:572: if(!cu.mover){
   807F 3A D4 69      [13] 2625 	ld	a, (#_cu + 9)
   8082 B7            [ 4] 2626 	or	a, a
   8083 20 05         [12] 2627 	jr	NZ,00103$
                           2628 ;src/main.c:573: cu.lanzado = NO;
   8085 21 D1 69      [10] 2629 	ld	hl,#(_cu + 0x0006)
   8088 36 00         [10] 2630 	ld	(hl),#0x00
   808A                    2631 00103$:
   808A DD F9         [10] 2632 	ld	sp, ix
   808C DD E1         [14] 2633 	pop	ix
   808E C9            [10] 2634 	ret
                           2635 ;src/main.c:577: void redibujarCuchillo( ) {
                           2636 ;	---------------------------------
                           2637 ; Function redibujarCuchillo
                           2638 ; ---------------------------------
   808F                    2639 _redibujarCuchillo::
                           2640 ;src/main.c:578: borrarCuchillo();
   808F CD 11 80      [17] 2641 	call	_borrarCuchillo
                           2642 ;src/main.c:579: cu.px = cu.x;
   8092 01 CD 69      [10] 2643 	ld	bc,#_cu + 2
   8095 3A CB 69      [13] 2644 	ld	a, (#_cu + 0)
   8098 02            [ 7] 2645 	ld	(bc),a
                           2646 ;src/main.c:580: cu.py = cu.y;
   8099 01 CE 69      [10] 2647 	ld	bc,#_cu + 3
   809C 3A CC 69      [13] 2648 	ld	a, (#_cu + 1)
   809F 02            [ 7] 2649 	ld	(bc),a
                           2650 ;src/main.c:581: dibujarCuchillo();
   80A0 C3 AD 7F      [10] 2651 	jp  _dibujarCuchillo
                           2652 ;src/main.c:584: void lanzarCuchillo(){
                           2653 ;	---------------------------------
                           2654 ; Function lanzarCuchillo
                           2655 ; ---------------------------------
   80A3                    2656 _lanzarCuchillo::
                           2657 ;src/main.c:586: if(!cu.lanzado){
   80A3 3A D1 69      [13] 2658 	ld	a, (#(_cu + 0x0006) + 0)
   80A6 B7            [ 4] 2659 	or	a, a
   80A7 C0            [11] 2660 	ret	NZ
                           2661 ;src/main.c:588: if(prota.mira == M_derecha){
   80A8 21 CA 69      [10] 2662 	ld	hl, #_prota + 7
   80AB 5E            [ 7] 2663 	ld	e,(hl)
                           2664 ;src/main.c:589: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   80AC 01 C4 69      [10] 2665 	ld	bc,#_prota + 1
                           2666 ;src/main.c:591: cu.direccion = M_derecha;
                           2667 ;src/main.c:593: cu.y=prota.y + G_HERO_H /2;
                           2668 ;src/main.c:594: cu.sprite=g_knifeX_0;
                           2669 ;src/main.c:595: cu.eje = E_X;
                           2670 ;src/main.c:588: if(prota.mira == M_derecha){
   80AF 7B            [ 4] 2671 	ld	a,e
   80B0 B7            [ 4] 2672 	or	a, a
   80B1 20 41         [12] 2673 	jr	NZ,00118$
                           2674 ;src/main.c:589: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   80B3 0A            [ 7] 2675 	ld	a,(bc)
   80B4 C6 0B         [ 7] 2676 	add	a, #0x0B
   80B6 5F            [ 4] 2677 	ld	e,a
   80B7 3A C3 69      [13] 2678 	ld	a, (#_prota + 0)
   80BA C6 0C         [ 7] 2679 	add	a, #0x0C
   80BC 6F            [ 4] 2680 	ld	l,a
   80BD C5            [11] 2681 	push	bc
   80BE 7B            [ 4] 2682 	ld	a,e
   80BF F5            [11] 2683 	push	af
   80C0 33            [ 6] 2684 	inc	sp
   80C1 7D            [ 4] 2685 	ld	a,l
   80C2 F5            [11] 2686 	push	af
   80C3 33            [ 6] 2687 	inc	sp
   80C4 CD 6B 73      [17] 2688 	call	_getTilePtr
   80C7 F1            [10] 2689 	pop	af
   80C8 C1            [10] 2690 	pop	bc
   80C9 5E            [ 7] 2691 	ld	e,(hl)
   80CA 3E 02         [ 7] 2692 	ld	a,#0x02
   80CC 93            [ 4] 2693 	sub	a, e
   80CD D8            [11] 2694 	ret	C
                           2695 ;src/main.c:590: cu.lanzado = SI;
   80CE 21 D1 69      [10] 2696 	ld	hl,#(_cu + 0x0006)
   80D1 36 01         [10] 2697 	ld	(hl),#0x01
                           2698 ;src/main.c:591: cu.direccion = M_derecha;
   80D3 21 D2 69      [10] 2699 	ld	hl,#(_cu + 0x0007)
   80D6 36 00         [10] 2700 	ld	(hl),#0x00
                           2701 ;src/main.c:592: cu.x=prota.x + G_HERO_W;
   80D8 3A C3 69      [13] 2702 	ld	a, (#_prota + 0)
   80DB C6 07         [ 7] 2703 	add	a, #0x07
   80DD 32 CB 69      [13] 2704 	ld	(#_cu),a
                           2705 ;src/main.c:593: cu.y=prota.y + G_HERO_H /2;
   80E0 0A            [ 7] 2706 	ld	a,(bc)
   80E1 C6 0B         [ 7] 2707 	add	a, #0x0B
   80E3 32 CC 69      [13] 2708 	ld	(#(_cu + 0x0001)),a
                           2709 ;src/main.c:594: cu.sprite=g_knifeX_0;
   80E6 21 C0 24      [10] 2710 	ld	hl,#_g_knifeX_0
   80E9 22 CF 69      [16] 2711 	ld	((_cu + 0x0004)), hl
                           2712 ;src/main.c:595: cu.eje = E_X;
   80EC 21 D3 69      [10] 2713 	ld	hl,#(_cu + 0x0008)
   80EF 36 00         [10] 2714 	ld	(hl),#0x00
                           2715 ;src/main.c:596: dibujarCuchillo();
   80F1 C3 AD 7F      [10] 2716 	jp  _dibujarCuchillo
   80F4                    2717 00118$:
                           2718 ;src/main.c:599: else if(prota.mira == M_izquierda){
   80F4 7B            [ 4] 2719 	ld	a,e
   80F5 3D            [ 4] 2720 	dec	a
   80F6 20 41         [12] 2721 	jr	NZ,00115$
                           2722 ;src/main.c:600: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   80F8 0A            [ 7] 2723 	ld	a,(bc)
   80F9 C6 0B         [ 7] 2724 	add	a, #0x0B
   80FB 5F            [ 4] 2725 	ld	e,a
   80FC 3A C3 69      [13] 2726 	ld	a, (#_prota + 0)
   80FF C6 F6         [ 7] 2727 	add	a,#0xF6
   8101 6F            [ 4] 2728 	ld	l,a
   8102 C5            [11] 2729 	push	bc
   8103 7B            [ 4] 2730 	ld	a,e
   8104 F5            [11] 2731 	push	af
   8105 33            [ 6] 2732 	inc	sp
   8106 7D            [ 4] 2733 	ld	a,l
   8107 F5            [11] 2734 	push	af
   8108 33            [ 6] 2735 	inc	sp
   8109 CD 6B 73      [17] 2736 	call	_getTilePtr
   810C F1            [10] 2737 	pop	af
   810D C1            [10] 2738 	pop	bc
   810E 5E            [ 7] 2739 	ld	e,(hl)
   810F 3E 02         [ 7] 2740 	ld	a,#0x02
   8111 93            [ 4] 2741 	sub	a, e
   8112 D8            [11] 2742 	ret	C
                           2743 ;src/main.c:601: cu.lanzado = SI;
   8113 21 D1 69      [10] 2744 	ld	hl,#(_cu + 0x0006)
   8116 36 01         [10] 2745 	ld	(hl),#0x01
                           2746 ;src/main.c:602: cu.direccion = M_izquierda;
   8118 21 D2 69      [10] 2747 	ld	hl,#(_cu + 0x0007)
   811B 36 01         [10] 2748 	ld	(hl),#0x01
                           2749 ;src/main.c:603: cu.x = prota.x - G_KNIFEX_0_W;
   811D 3A C3 69      [13] 2750 	ld	a, (#_prota + 0)
   8120 C6 FC         [ 7] 2751 	add	a,#0xFC
   8122 32 CB 69      [13] 2752 	ld	(#_cu),a
                           2753 ;src/main.c:604: cu.y = prota.y + G_HERO_H /2;
   8125 0A            [ 7] 2754 	ld	a,(bc)
   8126 C6 0B         [ 7] 2755 	add	a, #0x0B
   8128 32 CC 69      [13] 2756 	ld	(#(_cu + 0x0001)),a
                           2757 ;src/main.c:605: cu.sprite = g_knifeX_1;
   812B 21 D0 24      [10] 2758 	ld	hl,#_g_knifeX_1
   812E 22 CF 69      [16] 2759 	ld	((_cu + 0x0004)), hl
                           2760 ;src/main.c:606: cu.eje = E_X;
   8131 21 D3 69      [10] 2761 	ld	hl,#(_cu + 0x0008)
   8134 36 00         [10] 2762 	ld	(hl),#0x00
                           2763 ;src/main.c:607: dibujarCuchillo();
   8136 C3 AD 7F      [10] 2764 	jp  _dibujarCuchillo
   8139                    2765 00115$:
                           2766 ;src/main.c:610: else if(prota.mira == M_abajo){
   8139 7B            [ 4] 2767 	ld	a,e
   813A D6 03         [ 7] 2768 	sub	a, #0x03
   813C 20 41         [12] 2769 	jr	NZ,00112$
                           2770 ;src/main.c:612: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   813E 0A            [ 7] 2771 	ld	a,(bc)
   813F C6 1F         [ 7] 2772 	add	a, #0x1F
   8141 5F            [ 4] 2773 	ld	e,a
   8142 3A C3 69      [13] 2774 	ld	a, (#_prota + 0)
   8145 57            [ 4] 2775 	ld	d,a
   8146 14            [ 4] 2776 	inc	d
   8147 14            [ 4] 2777 	inc	d
   8148 14            [ 4] 2778 	inc	d
   8149 C5            [11] 2779 	push	bc
   814A 7B            [ 4] 2780 	ld	a,e
   814B F5            [11] 2781 	push	af
   814C 33            [ 6] 2782 	inc	sp
   814D D5            [11] 2783 	push	de
   814E 33            [ 6] 2784 	inc	sp
   814F CD 6B 73      [17] 2785 	call	_getTilePtr
   8152 F1            [10] 2786 	pop	af
   8153 C1            [10] 2787 	pop	bc
   8154 5E            [ 7] 2788 	ld	e,(hl)
   8155 3E 02         [ 7] 2789 	ld	a,#0x02
   8157 93            [ 4] 2790 	sub	a, e
   8158 D8            [11] 2791 	ret	C
                           2792 ;src/main.c:613: cu.lanzado = SI;
   8159 21 D1 69      [10] 2793 	ld	hl,#(_cu + 0x0006)
   815C 36 01         [10] 2794 	ld	(hl),#0x01
                           2795 ;src/main.c:614: cu.direccion = M_abajo;
   815E 21 D2 69      [10] 2796 	ld	hl,#(_cu + 0x0007)
   8161 36 03         [10] 2797 	ld	(hl),#0x03
                           2798 ;src/main.c:615: cu.x = prota.x + G_HERO_W / 2;
   8163 3A C3 69      [13] 2799 	ld	a, (#_prota + 0)
   8166 C6 03         [ 7] 2800 	add	a, #0x03
   8168 32 CB 69      [13] 2801 	ld	(#_cu),a
                           2802 ;src/main.c:616: cu.y = prota.y + G_HERO_H;
   816B 0A            [ 7] 2803 	ld	a,(bc)
   816C C6 16         [ 7] 2804 	add	a, #0x16
   816E 32 CC 69      [13] 2805 	ld	(#(_cu + 0x0001)),a
                           2806 ;src/main.c:617: cu.sprite = g_knifeY_0;
   8171 21 A0 24      [10] 2807 	ld	hl,#_g_knifeY_0
   8174 22 CF 69      [16] 2808 	ld	((_cu + 0x0004)), hl
                           2809 ;src/main.c:618: cu.eje = E_Y;
   8177 21 D3 69      [10] 2810 	ld	hl,#(_cu + 0x0008)
   817A 36 01         [10] 2811 	ld	(hl),#0x01
                           2812 ;src/main.c:619: dibujarCuchillo();
   817C C3 AD 7F      [10] 2813 	jp  _dibujarCuchillo
   817F                    2814 00112$:
                           2815 ;src/main.c:622: else if(prota.mira == M_arriba){
   817F 7B            [ 4] 2816 	ld	a,e
   8180 D6 02         [ 7] 2817 	sub	a, #0x02
   8182 C0            [11] 2818 	ret	NZ
                           2819 ;src/main.c:623: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   8183 0A            [ 7] 2820 	ld	a,(bc)
   8184 C6 F7         [ 7] 2821 	add	a,#0xF7
   8186 57            [ 4] 2822 	ld	d,a
   8187 3A C3 69      [13] 2823 	ld	a, (#_prota + 0)
   818A C6 03         [ 7] 2824 	add	a, #0x03
   818C C5            [11] 2825 	push	bc
   818D D5            [11] 2826 	push	de
   818E 33            [ 6] 2827 	inc	sp
   818F F5            [11] 2828 	push	af
   8190 33            [ 6] 2829 	inc	sp
   8191 CD 6B 73      [17] 2830 	call	_getTilePtr
   8194 F1            [10] 2831 	pop	af
   8195 C1            [10] 2832 	pop	bc
   8196 5E            [ 7] 2833 	ld	e,(hl)
   8197 3E 02         [ 7] 2834 	ld	a,#0x02
   8199 93            [ 4] 2835 	sub	a, e
   819A D8            [11] 2836 	ret	C
                           2837 ;src/main.c:624: cu.lanzado = SI;
   819B 21 D1 69      [10] 2838 	ld	hl,#(_cu + 0x0006)
   819E 36 01         [10] 2839 	ld	(hl),#0x01
                           2840 ;src/main.c:625: cu.direccion = M_arriba;
   81A0 21 D2 69      [10] 2841 	ld	hl,#(_cu + 0x0007)
   81A3 36 02         [10] 2842 	ld	(hl),#0x02
                           2843 ;src/main.c:626: cu.x = prota.x + G_HERO_W / 2;
   81A5 3A C3 69      [13] 2844 	ld	a, (#_prota + 0)
   81A8 C6 03         [ 7] 2845 	add	a, #0x03
   81AA 32 CB 69      [13] 2846 	ld	(#_cu),a
                           2847 ;src/main.c:627: cu.y = prota.y;
   81AD 0A            [ 7] 2848 	ld	a,(bc)
   81AE 32 CC 69      [13] 2849 	ld	(#(_cu + 0x0001)),a
                           2850 ;src/main.c:628: cu.sprite = g_knifeY_1;
   81B1 21 B0 24      [10] 2851 	ld	hl,#_g_knifeY_1
   81B4 22 CF 69      [16] 2852 	ld	((_cu + 0x0004)), hl
                           2853 ;src/main.c:629: cu.eje = E_Y;
   81B7 21 D3 69      [10] 2854 	ld	hl,#(_cu + 0x0008)
   81BA 36 01         [10] 2855 	ld	(hl),#0x01
                           2856 ;src/main.c:630: dibujarCuchillo();
   81BC C3 AD 7F      [10] 2857 	jp  _dibujarCuchillo
                           2858 ;src/main.c:636: void comprobarTeclado() {
                           2859 ;	---------------------------------
                           2860 ; Function comprobarTeclado
                           2861 ; ---------------------------------
   81BF                    2862 _comprobarTeclado::
                           2863 ;src/main.c:637: cpct_scanKeyboard_if();
   81BF CD AB 5A      [17] 2864 	call	_cpct_scanKeyboard_if
                           2865 ;src/main.c:639: if (cpct_isAnyKeyPressed()) {
   81C2 CD 9E 5A      [17] 2866 	call	_cpct_isAnyKeyPressed
   81C5 7D            [ 4] 2867 	ld	a,l
   81C6 B7            [ 4] 2868 	or	a, a
   81C7 C8            [11] 2869 	ret	Z
                           2870 ;src/main.c:640: if (cpct_isKeyPressed(Key_CursorLeft))
   81C8 21 01 01      [10] 2871 	ld	hl,#0x0101
   81CB CD 08 58      [17] 2872 	call	_cpct_isKeyPressed
   81CE 7D            [ 4] 2873 	ld	a,l
   81CF B7            [ 4] 2874 	or	a, a
                           2875 ;src/main.c:641: moverIzquierda();
   81D0 C2 FA 7E      [10] 2876 	jp	NZ,_moverIzquierda
                           2877 ;src/main.c:642: else if (cpct_isKeyPressed(Key_CursorRight))
   81D3 21 00 02      [10] 2878 	ld	hl,#0x0200
   81D6 CD 08 58      [17] 2879 	call	_cpct_isKeyPressed
   81D9 7D            [ 4] 2880 	ld	a,l
   81DA B7            [ 4] 2881 	or	a, a
                           2882 ;src/main.c:643: moverDerecha();
   81DB C2 1F 7F      [10] 2883 	jp	NZ,_moverDerecha
                           2884 ;src/main.c:644: else if (cpct_isKeyPressed(Key_CursorUp))
   81DE 21 00 01      [10] 2885 	ld	hl,#0x0100
   81E1 CD 08 58      [17] 2886 	call	_cpct_isKeyPressed
   81E4 7D            [ 4] 2887 	ld	a,l
   81E5 B7            [ 4] 2888 	or	a, a
                           2889 ;src/main.c:645: moverArriba();
   81E6 C2 65 7F      [10] 2890 	jp	NZ,_moverArriba
                           2891 ;src/main.c:646: else if (cpct_isKeyPressed(Key_CursorDown))
   81E9 21 00 04      [10] 2892 	ld	hl,#0x0400
   81EC CD 08 58      [17] 2893 	call	_cpct_isKeyPressed
   81EF 7D            [ 4] 2894 	ld	a,l
   81F0 B7            [ 4] 2895 	or	a, a
                           2896 ;src/main.c:647: moverAbajo();
   81F1 C2 89 7F      [10] 2897 	jp	NZ,_moverAbajo
                           2898 ;src/main.c:648: else if (cpct_isKeyPressed(Key_Space))
   81F4 21 05 80      [10] 2899 	ld	hl,#0x8005
   81F7 CD 08 58      [17] 2900 	call	_cpct_isKeyPressed
   81FA 7D            [ 4] 2901 	ld	a,l
   81FB B7            [ 4] 2902 	or	a, a
   81FC C8            [11] 2903 	ret	Z
                           2904 ;src/main.c:649: lanzarCuchillo();
   81FD C3 A3 80      [10] 2905 	jp  _lanzarCuchillo
                           2906 ;src/main.c:653: u8 checkKnifeCollision(int direction, u8 xoff, u8 yoff){
                           2907 ;	---------------------------------
                           2908 ; Function checkKnifeCollision
                           2909 ; ---------------------------------
   8200                    2910 _checkKnifeCollision::
                           2911 ;src/main.c:655: return *getTilePtr(cu.x + xoff, cu.y + yoff) <= 2;
   8200 3A CC 69      [13] 2912 	ld	a,(#_cu + 1)
   8203 21 05 00      [10] 2913 	ld	hl,#5
   8206 39            [11] 2914 	add	hl,sp
   8207 86            [ 7] 2915 	add	a, (hl)
   8208 47            [ 4] 2916 	ld	b,a
   8209 3A CB 69      [13] 2917 	ld	a,(#_cu + 0)
   820C 21 04 00      [10] 2918 	ld	hl,#4
   820F 39            [11] 2919 	add	hl,sp
   8210 86            [ 7] 2920 	add	a, (hl)
   8211 4F            [ 4] 2921 	ld	c,a
   8212 C5            [11] 2922 	push	bc
   8213 CD 6B 73      [17] 2923 	call	_getTilePtr
   8216 F1            [10] 2924 	pop	af
   8217 4E            [ 7] 2925 	ld	c,(hl)
   8218 3E 02         [ 7] 2926 	ld	a,#0x02
   821A 91            [ 4] 2927 	sub	a, c
   821B 3E 00         [ 7] 2928 	ld	a,#0x00
   821D 17            [ 4] 2929 	rla
   821E EE 01         [ 7] 2930 	xor	a, #0x01
   8220 6F            [ 4] 2931 	ld	l, a
   8221 C9            [10] 2932 	ret
                           2933 ;src/main.c:658: void moverCuchillo(){
                           2934 ;	---------------------------------
                           2935 ; Function moverCuchillo
                           2936 ; ---------------------------------
   8222                    2937 _moverCuchillo::
                           2938 ;src/main.c:659: if(cu.lanzado){
   8222 01 CB 69      [10] 2939 	ld	bc,#_cu+0
   8225 3A D1 69      [13] 2940 	ld	a, (#_cu + 6)
   8228 B7            [ 4] 2941 	or	a, a
   8229 C8            [11] 2942 	ret	Z
                           2943 ;src/main.c:660: cu.mover = SI;
   822A 21 09 00      [10] 2944 	ld	hl,#0x0009
   822D 09            [11] 2945 	add	hl,bc
   822E EB            [ 4] 2946 	ex	de,hl
   822F 3E 01         [ 7] 2947 	ld	a,#0x01
   8231 12            [ 7] 2948 	ld	(de),a
                           2949 ;src/main.c:661: if(cu.direccion == M_derecha){
   8232 21 D2 69      [10] 2950 	ld	hl, #_cu + 7
   8235 6E            [ 7] 2951 	ld	l,(hl)
   8236 7D            [ 4] 2952 	ld	a,l
   8237 B7            [ 4] 2953 	or	a, a
   8238 20 1E         [12] 2954 	jr	NZ,00122$
                           2955 ;src/main.c:663: if(checkKnifeCollision(M_derecha, G_KNIFEX_0_W + 1, 0)){
   823A C5            [11] 2956 	push	bc
   823B D5            [11] 2957 	push	de
   823C 21 05 00      [10] 2958 	ld	hl,#0x0005
   823F E5            [11] 2959 	push	hl
   8240 2E 00         [ 7] 2960 	ld	l, #0x00
   8242 E5            [11] 2961 	push	hl
   8243 CD 00 82      [17] 2962 	call	_checkKnifeCollision
   8246 F1            [10] 2963 	pop	af
   8247 F1            [10] 2964 	pop	af
   8248 D1            [10] 2965 	pop	de
   8249 C1            [10] 2966 	pop	bc
   824A 7D            [ 4] 2967 	ld	a,l
   824B B7            [ 4] 2968 	or	a, a
   824C 28 07         [12] 2969 	jr	Z,00102$
                           2970 ;src/main.c:664: cu.mover = SI;
   824E 3E 01         [ 7] 2971 	ld	a,#0x01
   8250 12            [ 7] 2972 	ld	(de),a
                           2973 ;src/main.c:665: cu.x++;
   8251 0A            [ 7] 2974 	ld	a,(bc)
   8252 3C            [ 4] 2975 	inc	a
   8253 02            [ 7] 2976 	ld	(bc),a
   8254 C9            [10] 2977 	ret
   8255                    2978 00102$:
                           2979 ;src/main.c:668: cu.mover=NO;
   8255 AF            [ 4] 2980 	xor	a, a
   8256 12            [ 7] 2981 	ld	(de),a
   8257 C9            [10] 2982 	ret
   8258                    2983 00122$:
                           2984 ;src/main.c:671: else if(cu.direccion == M_izquierda){
   8258 7D            [ 4] 2985 	ld	a,l
   8259 3D            [ 4] 2986 	dec	a
   825A 20 1F         [12] 2987 	jr	NZ,00119$
                           2988 ;src/main.c:672: if(checkKnifeCollision(M_derecha, -1, 0)){
   825C C5            [11] 2989 	push	bc
   825D D5            [11] 2990 	push	de
   825E 21 FF 00      [10] 2991 	ld	hl,#0x00FF
   8261 E5            [11] 2992 	push	hl
   8262 2E 00         [ 7] 2993 	ld	l, #0x00
   8264 E5            [11] 2994 	push	hl
   8265 CD 00 82      [17] 2995 	call	_checkKnifeCollision
   8268 F1            [10] 2996 	pop	af
   8269 F1            [10] 2997 	pop	af
   826A D1            [10] 2998 	pop	de
   826B C1            [10] 2999 	pop	bc
   826C 7D            [ 4] 3000 	ld	a,l
   826D B7            [ 4] 3001 	or	a, a
   826E 28 08         [12] 3002 	jr	Z,00105$
                           3003 ;src/main.c:673: cu.mover = SI;
   8270 3E 01         [ 7] 3004 	ld	a,#0x01
   8272 12            [ 7] 3005 	ld	(de),a
                           3006 ;src/main.c:674: cu.x--;
   8273 0A            [ 7] 3007 	ld	a,(bc)
   8274 C6 FF         [ 7] 3008 	add	a,#0xFF
   8276 02            [ 7] 3009 	ld	(bc),a
   8277 C9            [10] 3010 	ret
   8278                    3011 00105$:
                           3012 ;src/main.c:676: cu.mover=NO;
   8278 AF            [ 4] 3013 	xor	a, a
   8279 12            [ 7] 3014 	ld	(de),a
   827A C9            [10] 3015 	ret
   827B                    3016 00119$:
                           3017 ;src/main.c:682: cu.y--;
   827B 03            [ 6] 3018 	inc	bc
                           3019 ;src/main.c:679: else if(cu.direccion == M_arriba){
   827C 7D            [ 4] 3020 	ld	a,l
   827D D6 02         [ 7] 3021 	sub	a, #0x02
   827F 20 22         [12] 3022 	jr	NZ,00116$
                           3023 ;src/main.c:680: if(checkKnifeCollision(M_derecha, 0, -2)){
   8281 C5            [11] 3024 	push	bc
   8282 D5            [11] 3025 	push	de
   8283 21 00 FE      [10] 3026 	ld	hl,#0xFE00
   8286 E5            [11] 3027 	push	hl
   8287 26 00         [ 7] 3028 	ld	h, #0x00
   8289 E5            [11] 3029 	push	hl
   828A CD 00 82      [17] 3030 	call	_checkKnifeCollision
   828D F1            [10] 3031 	pop	af
   828E F1            [10] 3032 	pop	af
   828F D1            [10] 3033 	pop	de
   8290 C1            [10] 3034 	pop	bc
   8291 7D            [ 4] 3035 	ld	a,l
   8292 B7            [ 4] 3036 	or	a, a
   8293 28 0B         [12] 3037 	jr	Z,00108$
                           3038 ;src/main.c:681: cu.mover = SI;
   8295 3E 01         [ 7] 3039 	ld	a,#0x01
   8297 12            [ 7] 3040 	ld	(de),a
                           3041 ;src/main.c:682: cu.y--;
   8298 0A            [ 7] 3042 	ld	a,(bc)
   8299 C6 FF         [ 7] 3043 	add	a,#0xFF
   829B 02            [ 7] 3044 	ld	(bc),a
                           3045 ;src/main.c:683: cu.y--;
   829C C6 FF         [ 7] 3046 	add	a,#0xFF
   829E 02            [ 7] 3047 	ld	(bc),a
   829F C9            [10] 3048 	ret
   82A0                    3049 00108$:
                           3050 ;src/main.c:686: cu.mover=NO;
   82A0 AF            [ 4] 3051 	xor	a, a
   82A1 12            [ 7] 3052 	ld	(de),a
   82A2 C9            [10] 3053 	ret
   82A3                    3054 00116$:
                           3055 ;src/main.c:689: else if(cu.direccion == M_abajo){
   82A3 7D            [ 4] 3056 	ld	a,l
   82A4 D6 03         [ 7] 3057 	sub	a, #0x03
   82A6 C0            [11] 3058 	ret	NZ
                           3059 ;src/main.c:690: if(checkKnifeCollision(M_derecha, 0, G_KNIFEY_0_H + 2)){
   82A7 C5            [11] 3060 	push	bc
   82A8 D5            [11] 3061 	push	de
   82A9 21 00 0A      [10] 3062 	ld	hl,#0x0A00
   82AC E5            [11] 3063 	push	hl
   82AD 26 00         [ 7] 3064 	ld	h, #0x00
   82AF E5            [11] 3065 	push	hl
   82B0 CD 00 82      [17] 3066 	call	_checkKnifeCollision
   82B3 F1            [10] 3067 	pop	af
   82B4 F1            [10] 3068 	pop	af
   82B5 D1            [10] 3069 	pop	de
   82B6 C1            [10] 3070 	pop	bc
   82B7 7D            [ 4] 3071 	ld	a,l
   82B8 B7            [ 4] 3072 	or	a, a
   82B9 28 09         [12] 3073 	jr	Z,00111$
                           3074 ;src/main.c:691: cu.mover = SI;
   82BB 3E 01         [ 7] 3075 	ld	a,#0x01
   82BD 12            [ 7] 3076 	ld	(de),a
                           3077 ;src/main.c:692: cu.y++;
   82BE 0A            [ 7] 3078 	ld	a,(bc)
   82BF 3C            [ 4] 3079 	inc	a
   82C0 02            [ 7] 3080 	ld	(bc),a
                           3081 ;src/main.c:693: cu.y++;
   82C1 3C            [ 4] 3082 	inc	a
   82C2 02            [ 7] 3083 	ld	(bc),a
   82C3 C9            [10] 3084 	ret
   82C4                    3085 00111$:
                           3086 ;src/main.c:696: cu.mover=NO;
   82C4 AF            [ 4] 3087 	xor	a, a
   82C5 12            [ 7] 3088 	ld	(de),a
   82C6 C9            [10] 3089 	ret
                           3090 ;src/main.c:702: void barraPuntuacionInicial(){
                           3091 ;	---------------------------------
                           3092 ; Function barraPuntuacionInicial
                           3093 ; ---------------------------------
   82C7                    3094 _barraPuntuacionInicial::
                           3095 ;src/main.c:707: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   82C7 21 00 02      [10] 3096 	ld	hl,#0x0200
   82CA E5            [11] 3097 	push	hl
   82CB 26 C0         [ 7] 3098 	ld	h, #0xC0
   82CD E5            [11] 3099 	push	hl
   82CE CD 5A 64      [17] 3100 	call	_cpct_getScreenPtr
   82D1 4D            [ 4] 3101 	ld	c,l
   82D2 44            [ 4] 3102 	ld	b,h
                           3103 ;src/main.c:708: cpct_drawStringM0("SCORE", memptr, 1, 0);
   82D3 21 01 00      [10] 3104 	ld	hl,#0x0001
   82D6 E5            [11] 3105 	push	hl
   82D7 C5            [11] 3106 	push	bc
   82D8 21 6F 83      [10] 3107 	ld	hl,#___str_1
   82DB E5            [11] 3108 	push	hl
   82DC CD 8A 58      [17] 3109 	call	_cpct_drawStringM0
   82DF 21 06 00      [10] 3110 	ld	hl,#6
   82E2 39            [11] 3111 	add	hl,sp
   82E3 F9            [ 6] 3112 	ld	sp,hl
                           3113 ;src/main.c:709: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   82E4 21 00 0E      [10] 3114 	ld	hl,#0x0E00
   82E7 E5            [11] 3115 	push	hl
   82E8 26 C0         [ 7] 3116 	ld	h, #0xC0
   82EA E5            [11] 3117 	push	hl
   82EB CD 5A 64      [17] 3118 	call	_cpct_getScreenPtr
   82EE 4D            [ 4] 3119 	ld	c,l
   82EF 44            [ 4] 3120 	ld	b,h
                           3121 ;src/main.c:710: cpct_drawStringM0("00000", memptr, 15, 0);
   82F0 21 0F 00      [10] 3122 	ld	hl,#0x000F
   82F3 E5            [11] 3123 	push	hl
   82F4 C5            [11] 3124 	push	bc
   82F5 21 75 83      [10] 3125 	ld	hl,#___str_2
   82F8 E5            [11] 3126 	push	hl
   82F9 CD 8A 58      [17] 3127 	call	_cpct_drawStringM0
   82FC 21 06 00      [10] 3128 	ld	hl,#6
   82FF 39            [11] 3129 	add	hl,sp
   8300 F9            [ 6] 3130 	ld	sp,hl
                           3131 ;src/main.c:713: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 14);
   8301 21 1A 0E      [10] 3132 	ld	hl,#0x0E1A
   8304 E5            [11] 3133 	push	hl
   8305 21 00 C0      [10] 3134 	ld	hl,#0xC000
   8308 E5            [11] 3135 	push	hl
   8309 CD 5A 64      [17] 3136 	call	_cpct_getScreenPtr
   830C 4D            [ 4] 3137 	ld	c,l
   830D 44            [ 4] 3138 	ld	b,h
                           3139 ;src/main.c:714: cpct_drawStringM0("ROBOBIT", memptr, 3, 0);
   830E 21 03 00      [10] 3140 	ld	hl,#0x0003
   8311 E5            [11] 3141 	push	hl
   8312 C5            [11] 3142 	push	bc
   8313 21 7B 83      [10] 3143 	ld	hl,#___str_3
   8316 E5            [11] 3144 	push	hl
   8317 CD 8A 58      [17] 3145 	call	_cpct_drawStringM0
   831A 21 06 00      [10] 3146 	ld	hl,#6
   831D 39            [11] 3147 	add	hl,sp
   831E F9            [ 6] 3148 	ld	sp,hl
                           3149 ;src/main.c:716: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   831F 21 3C 02      [10] 3150 	ld	hl,#0x023C
   8322 E5            [11] 3151 	push	hl
   8323 21 00 C0      [10] 3152 	ld	hl,#0xC000
   8326 E5            [11] 3153 	push	hl
   8327 CD 5A 64      [17] 3154 	call	_cpct_getScreenPtr
   832A 4D            [ 4] 3155 	ld	c,l
   832B 44            [ 4] 3156 	ld	b,h
                           3157 ;src/main.c:717: cpct_drawStringM0("LIVES", memptr, 1, 0);
   832C 21 01 00      [10] 3158 	ld	hl,#0x0001
   832F E5            [11] 3159 	push	hl
   8330 C5            [11] 3160 	push	bc
   8331 21 83 83      [10] 3161 	ld	hl,#___str_4
   8334 E5            [11] 3162 	push	hl
   8335 CD 8A 58      [17] 3163 	call	_cpct_drawStringM0
   8338 21 06 00      [10] 3164 	ld	hl,#6
   833B 39            [11] 3165 	add	hl,sp
   833C F9            [ 6] 3166 	ld	sp,hl
                           3167 ;src/main.c:719: for(i=0; i<5; i++){
   833D 01 00 00      [10] 3168 	ld	bc,#0x0000
   8340                    3169 00102$:
                           3170 ;src/main.c:720: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   8340 79            [ 4] 3171 	ld	a,c
   8341 87            [ 4] 3172 	add	a, a
   8342 87            [ 4] 3173 	add	a, a
   8343 C6 3C         [ 7] 3174 	add	a, #0x3C
   8345 57            [ 4] 3175 	ld	d,a
   8346 C5            [11] 3176 	push	bc
   8347 3E 0E         [ 7] 3177 	ld	a,#0x0E
   8349 F5            [11] 3178 	push	af
   834A 33            [ 6] 3179 	inc	sp
   834B D5            [11] 3180 	push	de
   834C 33            [ 6] 3181 	inc	sp
   834D 21 00 C0      [10] 3182 	ld	hl,#0xC000
   8350 E5            [11] 3183 	push	hl
   8351 CD 5A 64      [17] 3184 	call	_cpct_getScreenPtr
   8354 EB            [ 4] 3185 	ex	de,hl
   8355 21 03 06      [10] 3186 	ld	hl,#0x0603
   8358 E5            [11] 3187 	push	hl
   8359 D5            [11] 3188 	push	de
   835A 21 60 48      [10] 3189 	ld	hl,#_g_heart
   835D E5            [11] 3190 	push	hl
   835E CD AE 58      [17] 3191 	call	_cpct_drawSprite
   8361 C1            [10] 3192 	pop	bc
                           3193 ;src/main.c:719: for(i=0; i<5; i++){
   8362 03            [ 6] 3194 	inc	bc
   8363 79            [ 4] 3195 	ld	a,c
   8364 D6 05         [ 7] 3196 	sub	a, #0x05
   8366 78            [ 4] 3197 	ld	a,b
   8367 17            [ 4] 3198 	rla
   8368 3F            [ 4] 3199 	ccf
   8369 1F            [ 4] 3200 	rra
   836A DE 80         [ 7] 3201 	sbc	a, #0x80
   836C 38 D2         [12] 3202 	jr	C,00102$
   836E C9            [10] 3203 	ret
   836F                    3204 ___str_1:
   836F 53 43 4F 52 45     3205 	.ascii "SCORE"
   8374 00                 3206 	.db 0x00
   8375                    3207 ___str_2:
   8375 30 30 30 30 30     3208 	.ascii "00000"
   837A 00                 3209 	.db 0x00
   837B                    3210 ___str_3:
   837B 52 4F 42 4F 42 49  3211 	.ascii "ROBOBIT"
        54
   8382 00                 3212 	.db 0x00
   8383                    3213 ___str_4:
   8383 4C 49 56 45 53     3214 	.ascii "LIVES"
   8388 00                 3215 	.db 0x00
                           3216 ;src/main.c:725: void borrarPantallaArriba(u8 x, u8 y, u8 ancho, u8 alto){
                           3217 ;	---------------------------------
                           3218 ; Function borrarPantallaArriba
                           3219 ; ---------------------------------
   8389                    3220 _borrarPantallaArriba::
   8389 DD E5         [15] 3221 	push	ix
   838B DD 21 00 00   [14] 3222 	ld	ix,#0
   838F DD 39         [15] 3223 	add	ix,sp
                           3224 ;src/main.c:728: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   8391 DD 66 05      [19] 3225 	ld	h,5 (ix)
   8394 DD 6E 04      [19] 3226 	ld	l,4 (ix)
   8397 E5            [11] 3227 	push	hl
   8398 21 00 C0      [10] 3228 	ld	hl,#0xC000
   839B E5            [11] 3229 	push	hl
   839C CD 5A 64      [17] 3230 	call	_cpct_getScreenPtr
   839F 4D            [ 4] 3231 	ld	c,l
   83A0 44            [ 4] 3232 	ld	b,h
                           3233 ;src/main.c:729: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra la mitad derecha
   83A1 DD 66 07      [19] 3234 	ld	h,7 (ix)
   83A4 DD 6E 06      [19] 3235 	ld	l,6 (ix)
   83A7 E5            [11] 3236 	push	hl
   83A8 AF            [ 4] 3237 	xor	a, a
   83A9 F5            [11] 3238 	push	af
   83AA 33            [ 6] 3239 	inc	sp
   83AB C5            [11] 3240 	push	bc
   83AC CD 80 63      [17] 3241 	call	_cpct_drawSolidBox
   83AF F1            [10] 3242 	pop	af
   83B0 F1            [10] 3243 	pop	af
   83B1 33            [ 6] 3244 	inc	sp
                           3245 ;src/main.c:730: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   83B2 DD 7E 04      [19] 3246 	ld	a,4 (ix)
   83B5 C6 28         [ 7] 3247 	add	a, #0x28
   83B7 47            [ 4] 3248 	ld	b,a
   83B8 DD 7E 05      [19] 3249 	ld	a,5 (ix)
   83BB F5            [11] 3250 	push	af
   83BC 33            [ 6] 3251 	inc	sp
   83BD C5            [11] 3252 	push	bc
   83BE 33            [ 6] 3253 	inc	sp
   83BF 21 00 C0      [10] 3254 	ld	hl,#0xC000
   83C2 E5            [11] 3255 	push	hl
   83C3 CD 5A 64      [17] 3256 	call	_cpct_getScreenPtr
   83C6 4D            [ 4] 3257 	ld	c,l
   83C7 44            [ 4] 3258 	ld	b,h
                           3259 ;src/main.c:731: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra la mitad izquierda
   83C8 DD 66 07      [19] 3260 	ld	h,7 (ix)
   83CB DD 6E 06      [19] 3261 	ld	l,6 (ix)
   83CE E5            [11] 3262 	push	hl
   83CF AF            [ 4] 3263 	xor	a, a
   83D0 F5            [11] 3264 	push	af
   83D1 33            [ 6] 3265 	inc	sp
   83D2 C5            [11] 3266 	push	bc
   83D3 CD 80 63      [17] 3267 	call	_cpct_drawSolidBox
   83D6 F1            [10] 3268 	pop	af
   83D7 F1            [10] 3269 	pop	af
   83D8 33            [ 6] 3270 	inc	sp
   83D9 DD E1         [14] 3271 	pop	ix
   83DB C9            [10] 3272 	ret
                           3273 ;src/main.c:734: void menuInicio(){
                           3274 ;	---------------------------------
                           3275 ; Function menuInicio
                           3276 ; ---------------------------------
   83DC                    3277 _menuInicio::
                           3278 ;src/main.c:738: cpct_clearScreen(0);
   83DC 21 00 40      [10] 3279 	ld	hl,#0x4000
   83DF E5            [11] 3280 	push	hl
   83E0 AF            [ 4] 3281 	xor	a, a
   83E1 F5            [11] 3282 	push	af
   83E2 33            [ 6] 3283 	inc	sp
   83E3 26 C0         [ 7] 3284 	ld	h, #0xC0
   83E5 E5            [11] 3285 	push	hl
   83E6 CD 39 5B      [17] 3286 	call	_cpct_memset
                           3287 ;src/main.c:740: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   83E9 21 1A 0F      [10] 3288 	ld	hl,#0x0F1A
   83EC E5            [11] 3289 	push	hl
   83ED 21 00 C0      [10] 3290 	ld	hl,#0xC000
   83F0 E5            [11] 3291 	push	hl
   83F1 CD 5A 64      [17] 3292 	call	_cpct_getScreenPtr
   83F4 4D            [ 4] 3293 	ld	c,l
   83F5 44            [ 4] 3294 	ld	b,h
                           3295 ;src/main.c:741: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   83F6 21 04 00      [10] 3296 	ld	hl,#0x0004
   83F9 E5            [11] 3297 	push	hl
   83FA C5            [11] 3298 	push	bc
   83FB 21 8F 84      [10] 3299 	ld	hl,#___str_5
   83FE E5            [11] 3300 	push	hl
   83FF CD 8A 58      [17] 3301 	call	_cpct_drawStringM0
   8402 21 06 00      [10] 3302 	ld	hl,#6
   8405 39            [11] 3303 	add	hl,sp
   8406 F9            [ 6] 3304 	ld	sp,hl
                           3305 ;src/main.c:743: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   8407 21 28 6E      [10] 3306 	ld	hl,#0x6E28
   840A E5            [11] 3307 	push	hl
   840B 21 F0 F0      [10] 3308 	ld	hl,#0xF0F0
   840E E5            [11] 3309 	push	hl
   840F 21 00 26      [10] 3310 	ld	hl,#_g_text_0
   8412 E5            [11] 3311 	push	hl
   8413 CD AE 58      [17] 3312 	call	_cpct_drawSprite
                           3313 ;src/main.c:744: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   8416 21 28 6E      [10] 3314 	ld	hl,#0x6E28
   8419 E5            [11] 3315 	push	hl
   841A 21 18 F1      [10] 3316 	ld	hl,#0xF118
   841D E5            [11] 3317 	push	hl
   841E 21 30 37      [10] 3318 	ld	hl,#_g_text_1
   8421 E5            [11] 3319 	push	hl
   8422 CD AE 58      [17] 3320 	call	_cpct_drawSprite
                           3321 ;src/main.c:767: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   8425 21 08 A0      [10] 3322 	ld	hl,#0xA008
   8428 E5            [11] 3323 	push	hl
   8429 21 00 C0      [10] 3324 	ld	hl,#0xC000
   842C E5            [11] 3325 	push	hl
   842D CD 5A 64      [17] 3326 	call	_cpct_getScreenPtr
   8430 4D            [ 4] 3327 	ld	c,l
   8431 44            [ 4] 3328 	ld	b,h
                           3329 ;src/main.c:768: cpct_drawStringM0("TO START PRESS S", memptr, 4, 0);
   8432 21 04 00      [10] 3330 	ld	hl,#0x0004
   8435 E5            [11] 3331 	push	hl
   8436 C5            [11] 3332 	push	bc
   8437 21 97 84      [10] 3333 	ld	hl,#___str_6
   843A E5            [11] 3334 	push	hl
   843B CD 8A 58      [17] 3335 	call	_cpct_drawStringM0
   843E 21 06 00      [10] 3336 	ld	hl,#6
   8441 39            [11] 3337 	add	hl,sp
   8442 F9            [ 6] 3338 	ld	sp,hl
                           3339 ;src/main.c:770: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 170); // centrado en horizontal y abajo en vertical
   8443 21 0A AA      [10] 3340 	ld	hl,#0xAA0A
   8446 E5            [11] 3341 	push	hl
   8447 21 00 C0      [10] 3342 	ld	hl,#0xC000
   844A E5            [11] 3343 	push	hl
   844B CD 5A 64      [17] 3344 	call	_cpct_getScreenPtr
   844E 4D            [ 4] 3345 	ld	c,l
   844F 44            [ 4] 3346 	ld	b,h
                           3347 ;src/main.c:771: cpct_drawStringM0("TO MENU PRESS M", memptr, 4, 0);
   8450 21 04 00      [10] 3348 	ld	hl,#0x0004
   8453 E5            [11] 3349 	push	hl
   8454 C5            [11] 3350 	push	bc
   8455 21 A8 84      [10] 3351 	ld	hl,#___str_7
   8458 E5            [11] 3352 	push	hl
   8459 CD 8A 58      [17] 3353 	call	_cpct_drawStringM0
   845C 21 06 00      [10] 3354 	ld	hl,#6
   845F 39            [11] 3355 	add	hl,sp
   8460 F9            [ 6] 3356 	ld	sp,hl
                           3357 ;src/main.c:774: do{
   8461                    3358 00106$:
                           3359 ;src/main.c:775: cpct_scanKeyboard_f();
   8461 CD 14 58      [17] 3360 	call	_cpct_scanKeyboard_f
                           3361 ;src/main.c:779: if(cpct_isKeyPressed(Key_M)){
   8464 21 04 40      [10] 3362 	ld	hl,#0x4004
   8467 CD 08 58      [17] 3363 	call	_cpct_isKeyPressed
   846A 7D            [ 4] 3364 	ld	a,l
   846B B7            [ 4] 3365 	or	a, a
   846C 28 0D         [12] 3366 	jr	Z,00107$
                           3367 ;src/main.c:780: cpct_scanKeyboard_f();
   846E CD 14 58      [17] 3368 	call	_cpct_scanKeyboard_f
                           3369 ;src/main.c:781: do{
   8471                    3370 00101$:
                           3371 ;src/main.c:783: } while(!cpct_isKeyPressed(Key_S));
   8471 21 07 10      [10] 3372 	ld	hl,#0x1007
   8474 CD 08 58      [17] 3373 	call	_cpct_isKeyPressed
   8477 7D            [ 4] 3374 	ld	a,l
   8478 B7            [ 4] 3375 	or	a, a
   8479 28 F6         [12] 3376 	jr	Z,00101$
   847B                    3377 00107$:
                           3378 ;src/main.c:785: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   847B 21 07 10      [10] 3379 	ld	hl,#0x1007
   847E CD 08 58      [17] 3380 	call	_cpct_isKeyPressed
   8481 7D            [ 4] 3381 	ld	a,l
   8482 B7            [ 4] 3382 	or	a, a
   8483 C0            [11] 3383 	ret	NZ
   8484 21 04 40      [10] 3384 	ld	hl,#0x4004
   8487 CD 08 58      [17] 3385 	call	_cpct_isKeyPressed
   848A 7D            [ 4] 3386 	ld	a,l
   848B B7            [ 4] 3387 	or	a, a
   848C 28 D3         [12] 3388 	jr	Z,00106$
   848E C9            [10] 3389 	ret
   848F                    3390 ___str_5:
   848F 52 4F 42 4F 42 49  3391 	.ascii "ROBOBIT"
        54
   8496 00                 3392 	.db 0x00
   8497                    3393 ___str_6:
   8497 54 4F 20 53 54 41  3394 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   84A7 00                 3395 	.db 0x00
   84A8                    3396 ___str_7:
   84A8 54 4F 20 4D 45 4E  3397 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   84B7 00                 3398 	.db 0x00
                           3399 ;src/main.c:788: void inicializarCPC() {
                           3400 ;	---------------------------------
                           3401 ; Function inicializarCPC
                           3402 ; ---------------------------------
   84B8                    3403 _inicializarCPC::
                           3404 ;src/main.c:789: cpct_disableFirmware();
   84B8 CD 70 63      [17] 3405 	call	_cpct_disableFirmware
                           3406 ;src/main.c:790: cpct_setVideoMode(0);
   84BB 2E 00         [ 7] 3407 	ld	l,#0x00
   84BD CD 1B 5B      [17] 3408 	call	_cpct_setVideoMode
                           3409 ;src/main.c:791: cpct_setBorder(HW_BLACK);
   84C0 21 10 14      [10] 3410 	ld	hl,#0x1410
   84C3 E5            [11] 3411 	push	hl
   84C4 CD 7E 58      [17] 3412 	call	_cpct_setPALColour
                           3413 ;src/main.c:792: cpct_setPalette(g_palette, 16);
   84C7 21 10 00      [10] 3414 	ld	hl,#0x0010
   84CA E5            [11] 3415 	push	hl
   84CB 21 98 4A      [10] 3416 	ld	hl,#_g_palette
   84CE E5            [11] 3417 	push	hl
   84CF CD F1 57      [17] 3418 	call	_cpct_setPalette
                           3419 ;src/main.c:793: cpct_akp_musicInit(G_song);
   84D2 21 00 0F      [10] 3420 	ld	hl,#_G_song
   84D5 E5            [11] 3421 	push	hl
   84D6 CD 4C 62      [17] 3422 	call	_cpct_akp_musicInit
   84D9 F1            [10] 3423 	pop	af
   84DA C9            [10] 3424 	ret
                           3425 ;src/main.c:796: void inicializarEnemy() {
                           3426 ;	---------------------------------
                           3427 ; Function inicializarEnemy
                           3428 ; ---------------------------------
   84DB                    3429 _inicializarEnemy::
   84DB DD E5         [15] 3430 	push	ix
   84DD DD 21 00 00   [14] 3431 	ld	ix,#0
   84E1 DD 39         [15] 3432 	add	ix,sp
   84E3 F5            [11] 3433 	push	af
   84E4 3B            [ 6] 3434 	dec	sp
                           3435 ;src/main.c:807: actual = enemy;
   84E5 01 B7 64      [10] 3436 	ld	bc,#_enemy+0
                           3437 ;src/main.c:808: while(--i){
   84E8 1E 02         [ 7] 3438 	ld	e,#0x02
   84EA                    3439 00101$:
   84EA 1D            [ 4] 3440 	dec e
   84EB CA 96 85      [10] 3441 	jp	Z,00104$
                           3442 ;src/main.c:809: actual->x = actual->px = spawnX[i];
   84EE C5            [11] 3443 	push	bc
   84EF FD E1         [14] 3444 	pop	iy
   84F1 FD 23         [10] 3445 	inc	iy
   84F3 FD 23         [10] 3446 	inc	iy
   84F5 21 7C 72      [10] 3447 	ld	hl,#_spawnX
   84F8 16 00         [ 7] 3448 	ld	d,#0x00
   84FA 19            [11] 3449 	add	hl, de
   84FB 7E            [ 7] 3450 	ld	a,(hl)
   84FC DD 77 FF      [19] 3451 	ld	-1 (ix), a
   84FF FD 77 00      [19] 3452 	ld	0 (iy), a
   8502 DD 7E FF      [19] 3453 	ld	a,-1 (ix)
   8505 02            [ 7] 3454 	ld	(bc),a
                           3455 ;src/main.c:810: actual->y = actual->py = spawnY[i];
   8506 C5            [11] 3456 	push	bc
   8507 FD E1         [14] 3457 	pop	iy
   8509 FD 23         [10] 3458 	inc	iy
   850B 21 03 00      [10] 3459 	ld	hl,#0x0003
   850E 09            [11] 3460 	add	hl,bc
   850F E3            [19] 3461 	ex	(sp), hl
   8510 21 81 72      [10] 3462 	ld	hl,#_spawnY
   8513 16 00         [ 7] 3463 	ld	d,#0x00
   8515 19            [11] 3464 	add	hl, de
   8516 56            [ 7] 3465 	ld	d,(hl)
   8517 E1            [10] 3466 	pop	hl
   8518 E5            [11] 3467 	push	hl
   8519 72            [ 7] 3468 	ld	(hl),d
   851A FD 72 00      [19] 3469 	ld	0 (iy), d
                           3470 ;src/main.c:811: actual->mover  = NO;
   851D 21 06 00      [10] 3471 	ld	hl,#0x0006
   8520 09            [11] 3472 	add	hl,bc
   8521 36 00         [10] 3473 	ld	(hl),#0x00
                           3474 ;src/main.c:812: actual->mira   = M_abajo;
   8523 21 07 00      [10] 3475 	ld	hl,#0x0007
   8526 09            [11] 3476 	add	hl,bc
   8527 36 03         [10] 3477 	ld	(hl),#0x03
                           3478 ;src/main.c:813: actual->sprite = g_enemy;
   8529 21 04 00      [10] 3479 	ld	hl,#0x0004
   852C 09            [11] 3480 	add	hl,bc
   852D 36 72         [10] 3481 	ld	(hl),#<(_g_enemy)
   852F 23            [ 6] 3482 	inc	hl
   8530 36 48         [10] 3483 	ld	(hl),#>(_g_enemy)
                           3484 ;src/main.c:814: actual->muerto = NO;
   8532 21 08 00      [10] 3485 	ld	hl,#0x0008
   8535 09            [11] 3486 	add	hl,bc
   8536 36 00         [10] 3487 	ld	(hl),#0x00
                           3488 ;src/main.c:815: actual->muertes = 0;
   8538 21 0A 00      [10] 3489 	ld	hl,#0x000A
   853B 09            [11] 3490 	add	hl,bc
   853C 36 00         [10] 3491 	ld	(hl),#0x00
                           3492 ;src/main.c:816: actual->patrolling = SI;
   853E 21 0B 00      [10] 3493 	ld	hl,#0x000B
   8541 09            [11] 3494 	add	hl,bc
   8542 36 01         [10] 3495 	ld	(hl),#0x01
                           3496 ;src/main.c:817: actual->onPathPatrol = SI;
   8544 21 0C 00      [10] 3497 	ld	hl,#0x000C
   8547 09            [11] 3498 	add	hl,bc
   8548 36 01         [10] 3499 	ld	(hl),#0x01
                           3500 ;src/main.c:818: actual->reversePatrol = NO;
   854A 21 0D 00      [10] 3501 	ld	hl,#0x000D
   854D 09            [11] 3502 	add	hl,bc
   854E 36 00         [10] 3503 	ld	(hl),#0x00
                           3504 ;src/main.c:819: actual->iter = 0;
   8550 21 0E 00      [10] 3505 	ld	hl,#0x000E
   8553 09            [11] 3506 	add	hl,bc
   8554 36 00         [10] 3507 	ld	(hl),#0x00
                           3508 ;src/main.c:820: actual->lastIter = 0;
   8556 21 0F 00      [10] 3509 	ld	hl,#0x000F
   8559 09            [11] 3510 	add	hl,bc
   855A 36 00         [10] 3511 	ld	(hl),#0x00
                           3512 ;src/main.c:821: actual->seen = 0;
   855C 21 11 00      [10] 3513 	ld	hl,#0x0011
   855F 09            [11] 3514 	add	hl,bc
   8560 36 00         [10] 3515 	ld	(hl),#0x00
                           3516 ;src/main.c:822: actual->found = 0;
   8562 21 12 00      [10] 3517 	ld	hl,#0x0012
   8565 09            [11] 3518 	add	hl,bc
   8566 36 00         [10] 3519 	ld	(hl),#0x00
                           3520 ;src/main.c:823: pathFinding(actual->x, actual->y, 40, 44, actual, mapa); // calculo rutas de patrulla
   8568 C5            [11] 3521 	push	bc
   8569 D5            [11] 3522 	push	de
   856A 2A D6 69      [16] 3523 	ld	hl,(_mapa)
   856D E5            [11] 3524 	push	hl
   856E C5            [11] 3525 	push	bc
   856F 21 28 2C      [10] 3526 	ld	hl,#0x2C28
   8572 E5            [11] 3527 	push	hl
   8573 D5            [11] 3528 	push	de
   8574 33            [ 6] 3529 	inc	sp
   8575 DD 7E FF      [19] 3530 	ld	a,-1 (ix)
   8578 F5            [11] 3531 	push	af
   8579 33            [ 6] 3532 	inc	sp
   857A CD 06 54      [17] 3533 	call	_pathFinding
   857D 21 08 00      [10] 3534 	ld	hl,#8
   8580 39            [11] 3535 	add	hl,sp
   8581 F9            [ 6] 3536 	ld	sp,hl
   8582 D1            [10] 3537 	pop	de
   8583 C1            [10] 3538 	pop	bc
                           3539 ;src/main.c:846: dibujarEnemigo(actual);
   8584 C5            [11] 3540 	push	bc
   8585 D5            [11] 3541 	push	de
   8586 C5            [11] 3542 	push	bc
   8587 CD 01 75      [17] 3543 	call	_dibujarEnemigo
   858A F1            [10] 3544 	pop	af
   858B D1            [10] 3545 	pop	de
   858C C1            [10] 3546 	pop	bc
                           3547 ;src/main.c:848: ++actual;
   858D 21 43 01      [10] 3548 	ld	hl,#0x0143
   8590 09            [11] 3549 	add	hl,bc
   8591 4D            [ 4] 3550 	ld	c,l
   8592 44            [ 4] 3551 	ld	b,h
   8593 C3 EA 84      [10] 3552 	jp	00101$
   8596                    3553 00104$:
   8596 DD F9         [10] 3554 	ld	sp, ix
   8598 DD E1         [14] 3555 	pop	ix
   859A C9            [10] 3556 	ret
                           3557 ;src/main.c:852: void inicializarJuego() {
                           3558 ;	---------------------------------
                           3559 ; Function inicializarJuego
                           3560 ; ---------------------------------
   859B                    3561 _inicializarJuego::
                           3562 ;src/main.c:854: iter = 0;
   859B 21 D5 69      [10] 3563 	ld	hl,#_iter + 0
   859E 36 00         [10] 3564 	ld	(hl), #0x00
                           3565 ;src/main.c:855: num_mapa = 0;
   85A0 21 D8 69      [10] 3566 	ld	hl,#_num_mapa + 0
   85A3 36 00         [10] 3567 	ld	(hl), #0x00
                           3568 ;src/main.c:856: mapa = mapas[num_mapa];
   85A5 21 76 72      [10] 3569 	ld	hl, #_mapas + 0
   85A8 7E            [ 7] 3570 	ld	a,(hl)
   85A9 FD 21 D6 69   [14] 3571 	ld	iy,#_mapa
   85AD FD 77 00      [19] 3572 	ld	0 (iy),a
   85B0 23            [ 6] 3573 	inc	hl
   85B1 7E            [ 7] 3574 	ld	a,(hl)
   85B2 32 D7 69      [13] 3575 	ld	(#_mapa + 1),a
                           3576 ;src/main.c:857: cpct_etm_setTileset2x4(g_tileset);
   85B5 21 E0 24      [10] 3577 	ld	hl,#_g_tileset
   85B8 CD E2 59      [17] 3578 	call	_cpct_etm_setTileset2x4
                           3579 ;src/main.c:859: dibujarMapa();
   85BB CD 60 72      [17] 3580 	call	_dibujarMapa
                           3581 ;src/main.c:861: borrarPantallaArriba(0, 0, 40, 1);
   85BE 21 28 01      [10] 3582 	ld	hl,#0x0128
   85C1 E5            [11] 3583 	push	hl
   85C2 21 00 00      [10] 3584 	ld	hl,#0x0000
   85C5 E5            [11] 3585 	push	hl
   85C6 CD 89 83      [17] 3586 	call	_borrarPantallaArriba
   85C9 F1            [10] 3587 	pop	af
   85CA F1            [10] 3588 	pop	af
                           3589 ;src/main.c:862: barraPuntuacionInicial();
   85CB CD C7 82      [17] 3590 	call	_barraPuntuacionInicial
                           3591 ;src/main.c:865: prota.x = prota.px = 50;
   85CE 21 C5 69      [10] 3592 	ld	hl,#(_prota + 0x0002)
   85D1 36 32         [10] 3593 	ld	(hl),#0x32
   85D3 21 C3 69      [10] 3594 	ld	hl,#_prota
   85D6 36 32         [10] 3595 	ld	(hl),#0x32
                           3596 ;src/main.c:866: prota.y = prota.py = 76 + ORIGEN_MAPA_Y;
   85D8 21 C6 69      [10] 3597 	ld	hl,#(_prota + 0x0003)
   85DB 36 64         [10] 3598 	ld	(hl),#0x64
   85DD 21 C4 69      [10] 3599 	ld	hl,#(_prota + 0x0001)
   85E0 36 64         [10] 3600 	ld	(hl),#0x64
                           3601 ;src/main.c:867: prota.mover  = NO;
   85E2 21 C9 69      [10] 3602 	ld	hl,#(_prota + 0x0006)
   85E5 36 00         [10] 3603 	ld	(hl),#0x00
                           3604 ;src/main.c:868: prota.mira=M_derecha;
   85E7 21 CA 69      [10] 3605 	ld	hl,#(_prota + 0x0007)
   85EA 36 00         [10] 3606 	ld	(hl),#0x00
                           3607 ;src/main.c:869: prota.sprite = g_hero;
   85EC 21 A8 4A      [10] 3608 	ld	hl,#_g_hero
   85EF 22 C7 69      [16] 3609 	ld	((_prota + 0x0004)), hl
                           3610 ;src/main.c:873: cu.x = cu.px = 0;
   85F2 21 CD 69      [10] 3611 	ld	hl,#(_cu + 0x0002)
   85F5 36 00         [10] 3612 	ld	(hl),#0x00
   85F7 21 CB 69      [10] 3613 	ld	hl,#_cu
   85FA 36 00         [10] 3614 	ld	(hl),#0x00
                           3615 ;src/main.c:874: cu.y = cu.py = 0;
   85FC 21 CE 69      [10] 3616 	ld	hl,#(_cu + 0x0003)
   85FF 36 00         [10] 3617 	ld	(hl),#0x00
   8601 21 CC 69      [10] 3618 	ld	hl,#(_cu + 0x0001)
   8604 36 00         [10] 3619 	ld	(hl),#0x00
                           3620 ;src/main.c:875: cu.lanzado = NO;
   8606 21 D1 69      [10] 3621 	ld	hl,#(_cu + 0x0006)
   8609 36 00         [10] 3622 	ld	(hl),#0x00
                           3623 ;src/main.c:876: cu.mover = NO;
   860B 21 D4 69      [10] 3624 	ld	hl,#(_cu + 0x0009)
   860E 36 00         [10] 3625 	ld	(hl),#0x00
                           3626 ;src/main.c:878: inicializarEnemy();
   8610 CD DB 84      [17] 3627 	call	_inicializarEnemy
                           3628 ;src/main.c:880: dibujarProta();
   8613 C3 86 72      [10] 3629 	jp  _dibujarProta
                           3630 ;src/main.c:883: void main(void) {
                           3631 ;	---------------------------------
                           3632 ; Function main
                           3633 ; ---------------------------------
   8616                    3634 _main::
   8616 DD E5         [15] 3635 	push	ix
   8618 DD 21 00 00   [14] 3636 	ld	ix,#0
   861C DD 39         [15] 3637 	add	ix,sp
   861E 3B            [ 6] 3638 	dec	sp
                           3639 ;src/main.c:888: inicializarCPC();
   861F CD B8 84      [17] 3640 	call	_inicializarCPC
                           3641 ;src/main.c:889: menuInicio();
   8622 CD DC 83      [17] 3642 	call	_menuInicio
                           3643 ;src/main.c:891: inicializarJuego();
   8625 CD 9B 85      [17] 3644 	call	_inicializarJuego
                           3645 ;src/main.c:892: cpct_akp_musicPlay();
   8628 CD 49 5B      [17] 3646 	call	_cpct_akp_musicPlay
                           3647 ;src/main.c:894: while (1) {
   862B                    3648 00119$:
                           3649 ;src/main.c:897: i = 1 + 1;
   862B DD 36 FF 02   [19] 3650 	ld	-1 (ix),#0x02
                           3651 ;src/main.c:900: comprobarTeclado();
   862F CD BF 81      [17] 3652 	call	_comprobarTeclado
                           3653 ;src/main.c:901: moverCuchillo();
   8632 CD 22 82      [17] 3654 	call	_moverCuchillo
                           3655 ;src/main.c:902: updateEnemies();
   8635 CD D2 7D      [17] 3656 	call	_updateEnemies
                           3657 ;src/main.c:917: actual = enemy;
                           3658 ;src/main.c:919: cpct_waitVSYNC();
   8638 CD 13 5B      [17] 3659 	call	_cpct_waitVSYNC
                           3660 ;src/main.c:921: if (prota.mover) {
   863B 01 C9 69      [10] 3661 	ld	bc,#_prota+6
   863E 0A            [ 7] 3662 	ld	a,(bc)
   863F B7            [ 4] 3663 	or	a, a
   8640 28 07         [12] 3664 	jr	Z,00102$
                           3665 ;src/main.c:922: redibujarProta();
   8642 C5            [11] 3666 	push	bc
   8643 CD 57 73      [17] 3667 	call	_redibujarProta
   8646 C1            [10] 3668 	pop	bc
                           3669 ;src/main.c:923: prota.mover = NO;
   8647 AF            [ 4] 3670 	xor	a, a
   8648 02            [ 7] 3671 	ld	(bc),a
   8649                    3672 00102$:
                           3673 ;src/main.c:925: if(cu.lanzado && cu.mover){
   8649 21 D1 69      [10] 3674 	ld	hl,#_cu + 6
   864C 4E            [ 7] 3675 	ld	c,(hl)
   864D 11 D4 69      [10] 3676 	ld	de,#_cu + 9
   8650 79            [ 4] 3677 	ld	a,c
   8651 B7            [ 4] 3678 	or	a, a
   8652 28 09         [12] 3679 	jr	Z,00107$
   8654 1A            [ 7] 3680 	ld	a,(de)
   8655 B7            [ 4] 3681 	or	a, a
   8656 28 05         [12] 3682 	jr	Z,00107$
                           3683 ;src/main.c:926: redibujarCuchillo();
   8658 CD 8F 80      [17] 3684 	call	_redibujarCuchillo
   865B 18 0B         [12] 3685 	jr	00132$
   865D                    3686 00107$:
                           3687 ;src/main.c:927: }else if (cu.lanzado && !cu.mover){
   865D 79            [ 4] 3688 	ld	a,c
   865E B7            [ 4] 3689 	or	a, a
   865F 28 07         [12] 3690 	jr	Z,00132$
   8661 1A            [ 7] 3691 	ld	a,(de)
   8662 B7            [ 4] 3692 	or	a, a
   8663 20 03         [12] 3693 	jr	NZ,00132$
                           3694 ;src/main.c:928: borrarCuchillo();
   8665 CD 11 80      [17] 3695 	call	_borrarCuchillo
                           3696 ;src/main.c:931: while(--i){
   8668                    3697 00132$:
   8668 01 B7 64      [10] 3698 	ld	bc,#_enemy
   866B                    3699 00115$:
   866B DD 35 FF      [23] 3700 	dec	-1 (ix)
   866E DD 7E FF      [19] 3701 	ld	a, -1 (ix)
   8671 B7            [ 4] 3702 	or	a, a
   8672 28 43         [12] 3703 	jr	Z,00117$
                           3704 ;src/main.c:932: if(actual->mover){
   8674 C5            [11] 3705 	push	bc
   8675 FD E1         [14] 3706 	pop	iy
   8677 FD 7E 06      [19] 3707 	ld	a,6 (iy)
   867A B7            [ 4] 3708 	or	a, a
   867B 28 07         [12] 3709 	jr	Z,00111$
                           3710 ;src/main.c:933: redibujarEnemigo(actual);
   867D C5            [11] 3711 	push	bc
   867E C5            [11] 3712 	push	bc
   867F CD 75 76      [17] 3713 	call	_redibujarEnemigo
   8682 F1            [10] 3714 	pop	af
   8683 C1            [10] 3715 	pop	bc
   8684                    3716 00111$:
                           3717 ;src/main.c:935: if (actual->muerto && actual->muertes == 0){
   8684 C5            [11] 3718 	push	bc
   8685 FD E1         [14] 3719 	pop	iy
   8687 FD 7E 08      [19] 3720 	ld	a,8 (iy)
   868A B7            [ 4] 3721 	or	a, a
   868B 28 22         [12] 3722 	jr	Z,00113$
   868D 21 0A 00      [10] 3723 	ld	hl,#0x000A
   8690 09            [11] 3724 	add	hl,bc
   8691 7E            [ 7] 3725 	ld	a,(hl)
   8692 B7            [ 4] 3726 	or	a, a
   8693 20 1A         [12] 3727 	jr	NZ,00113$
                           3728 ;src/main.c:936: borrarEnemigo(actual);
   8695 E5            [11] 3729 	push	hl
   8696 C5            [11] 3730 	push	bc
   8697 C5            [11] 3731 	push	bc
   8698 CD E1 75      [17] 3732 	call	_borrarEnemigo
   869B F1            [10] 3733 	pop	af
   869C C1            [10] 3734 	pop	bc
   869D C5            [11] 3735 	push	bc
   869E C5            [11] 3736 	push	bc
   869F CD 39 75      [17] 3737 	call	_dibujarExplosion
   86A2 F1            [10] 3738 	pop	af
   86A3 C1            [10] 3739 	pop	bc
   86A4 E1            [10] 3740 	pop	hl
                           3741 ;src/main.c:939: actual->muertes++;
   86A5 5E            [ 7] 3742 	ld	e,(hl)
   86A6 1C            [ 4] 3743 	inc	e
   86A7 73            [ 7] 3744 	ld	(hl),e
                           3745 ;src/main.c:940: actual->x = 0;
   86A8 AF            [ 4] 3746 	xor	a, a
   86A9 02            [ 7] 3747 	ld	(bc),a
                           3748 ;src/main.c:941: actual->y = 0;
   86AA 59            [ 4] 3749 	ld	e, c
   86AB 50            [ 4] 3750 	ld	d, b
   86AC 13            [ 6] 3751 	inc	de
   86AD AF            [ 4] 3752 	xor	a, a
   86AE 12            [ 7] 3753 	ld	(de),a
   86AF                    3754 00113$:
                           3755 ;src/main.c:943: ++actual;
   86AF 21 43 01      [10] 3756 	ld	hl,#0x0143
   86B2 09            [11] 3757 	add	hl,bc
   86B3 4D            [ 4] 3758 	ld	c,l
   86B4 44            [ 4] 3759 	ld	b,h
   86B5 18 B4         [12] 3760 	jr	00115$
   86B7                    3761 00117$:
                           3762 ;src/main.c:946: cpct_waitVSYNC();
   86B7 CD 13 5B      [17] 3763 	call	_cpct_waitVSYNC
   86BA C3 2B 86      [10] 3764 	jp	00119$
   86BD 33            [ 6] 3765 	inc	sp
   86BE DD E1         [14] 3766 	pop	ix
   86C0 C9            [10] 3767 	ret
                           3768 	.area _CODE
                           3769 	.area _INITIALIZER
                           3770 	.area _CABS (ABS)
   0F00                    3771 	.org 0x0F00
   0F00                    3772 _G_song:
   0F00 41                 3773 	.db #0x41	; 65	'A'
   0F01 54                 3774 	.db #0x54	; 84	'T'
   0F02 31                 3775 	.db #0x31	; 49	'1'
   0F03 30                 3776 	.db #0x30	; 48	'0'
   0F04 01                 3777 	.db #0x01	; 1
   0F05 40                 3778 	.db #0x40	; 64
   0F06 42                 3779 	.db #0x42	; 66	'B'
   0F07 0F                 3780 	.db #0x0F	; 15
   0F08 02                 3781 	.db #0x02	; 2
   0F09 06                 3782 	.db #0x06	; 6
   0F0A 1D                 3783 	.db #0x1D	; 29
   0F0B 00                 3784 	.db #0x00	; 0
   0F0C 10                 3785 	.db #0x10	; 16
   0F0D 40                 3786 	.db #0x40	; 64
   0F0E 19                 3787 	.db #0x19	; 25
   0F0F 40                 3788 	.db #0x40	; 64
   0F10 00                 3789 	.db #0x00	; 0
   0F11 00                 3790 	.db #0x00	; 0
   0F12 00                 3791 	.db #0x00	; 0
   0F13 00                 3792 	.db #0x00	; 0
   0F14 00                 3793 	.db #0x00	; 0
   0F15 00                 3794 	.db #0x00	; 0
   0F16 0D                 3795 	.db #0x0D	; 13
   0F17 12                 3796 	.db #0x12	; 18
   0F18 40                 3797 	.db #0x40	; 64
   0F19 01                 3798 	.db #0x01	; 1
   0F1A 00                 3799 	.db #0x00	; 0
   0F1B 7C                 3800 	.db #0x7C	; 124
   0F1C 18                 3801 	.db #0x18	; 24
   0F1D 78                 3802 	.db #0x78	; 120	'x'
   0F1E 0C                 3803 	.db #0x0C	; 12
   0F1F 34                 3804 	.db #0x34	; 52	'4'
   0F20 30                 3805 	.db #0x30	; 48	'0'
   0F21 2C                 3806 	.db #0x2C	; 44
   0F22 28                 3807 	.db #0x28	; 40
   0F23 24                 3808 	.db #0x24	; 36
   0F24 20                 3809 	.db #0x20	; 32
   0F25 1C                 3810 	.db #0x1C	; 28
   0F26 0D                 3811 	.db #0x0D	; 13
   0F27 25                 3812 	.db #0x25	; 37
   0F28 40                 3813 	.db #0x40	; 64
   0F29 20                 3814 	.db #0x20	; 32
   0F2A 00                 3815 	.db #0x00	; 0
   0F2B 00                 3816 	.db #0x00	; 0
   0F2C 00                 3817 	.db #0x00	; 0
   0F2D 39                 3818 	.db #0x39	; 57	'9'
   0F2E 40                 3819 	.db #0x40	; 64
   0F2F 00                 3820 	.db #0x00	; 0
   0F30 57                 3821 	.db #0x57	; 87	'W'
   0F31 40                 3822 	.db #0x40	; 64
   0F32 3B                 3823 	.db #0x3B	; 59
   0F33 40                 3824 	.db #0x40	; 64
   0F34 57                 3825 	.db #0x57	; 87	'W'
   0F35 40                 3826 	.db #0x40	; 64
   0F36 01                 3827 	.db #0x01	; 1
   0F37 2F                 3828 	.db #0x2F	; 47
   0F38 40                 3829 	.db #0x40	; 64
   0F39 19                 3830 	.db #0x19	; 25
   0F3A 00                 3831 	.db #0x00	; 0
   0F3B 76                 3832 	.db #0x76	; 118	'v'
   0F3C E1                 3833 	.db #0xE1	; 225
   0F3D 00                 3834 	.db #0x00	; 0
   0F3E 00                 3835 	.db #0x00	; 0
   0F3F 01                 3836 	.db #0x01	; 1
   0F40 04                 3837 	.db #0x04	; 4
   0F41 51                 3838 	.db #0x51	; 81	'Q'
   0F42 04                 3839 	.db #0x04	; 4
   0F43 37                 3840 	.db #0x37	; 55	'7'
   0F44 04                 3841 	.db #0x04	; 4
   0F45 4F                 3842 	.db #0x4F	; 79	'O'
   0F46 04                 3843 	.db #0x04	; 4
   0F47 37                 3844 	.db #0x37	; 55	'7'
   0F48 02                 3845 	.db #0x02	; 2
   0F49 4B                 3846 	.db #0x4B	; 75	'K'
   0F4A 02                 3847 	.db #0x02	; 2
   0F4B 37                 3848 	.db #0x37	; 55	'7'
   0F4C 04                 3849 	.db #0x04	; 4
   0F4D 4F                 3850 	.db #0x4F	; 79	'O'
   0F4E 04                 3851 	.db #0x04	; 4
   0F4F 37                 3852 	.db #0x37	; 55	'7'
   0F50 04                 3853 	.db #0x04	; 4
   0F51 4F                 3854 	.db #0x4F	; 79	'O'
   0F52 04                 3855 	.db #0x04	; 4
   0F53 37                 3856 	.db #0x37	; 55	'7'
   0F54 02                 3857 	.db #0x02	; 2
   0F55 4B                 3858 	.db #0x4B	; 75	'K'
   0F56 00                 3859 	.db #0x00	; 0
   0F57 42                 3860 	.db #0x42	; 66	'B'
   0F58 60                 3861 	.db #0x60	; 96
   0F59 00                 3862 	.db #0x00	; 0
   0F5A 42                 3863 	.db #0x42	; 66	'B'
   0F5B 80                 3864 	.db #0x80	; 128
   0F5C 00                 3865 	.db #0x00	; 0
   0F5D 00                 3866 	.db #0x00	; 0
   0F5E 42                 3867 	.db #0x42	; 66	'B'
   0F5F 00                 3868 	.db #0x00	; 0
   0F60 00                 3869 	.db #0x00	; 0
