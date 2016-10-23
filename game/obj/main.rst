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
                             21 	.globl _moverEnemigo
                             22 	.globl _moverEnemigoIzquierda
                             23 	.globl _moverEnemigoDerecha
                             24 	.globl _moverEnemigoAbajo
                             25 	.globl _moverEnemigoArriba
                             26 	.globl _checkEnemyCollision
                             27 	.globl _redibujarEnemigo
                             28 	.globl _borrarEnemigo
                             29 	.globl _borrarExplosion
                             30 	.globl _dibujarExplosion
                             31 	.globl _dibujarEnemigo
                             32 	.globl _checkCollision
                             33 	.globl _comprobarTeclado
                             34 	.globl _redibujarProta
                             35 	.globl _borrarProta
                             36 	.globl _dibujarProta
                             37 	.globl _dibujarMapa
                             38 	.globl _play
                             39 	.globl _moverCuchillo
                             40 	.globl _lanzarCuchillo
                             41 	.globl _redibujarCuchillo
                             42 	.globl _borrarCuchillo
                             43 	.globl _getTilePtr
                             44 	.globl _aumentarPuntuacion
                             45 	.globl _modificarPuntuacion
                             46 	.globl _barraPuntuacionInicial
                             47 	.globl _menuInicio
                             48 	.globl _menuFin
                             49 	.globl _cpct_etm_setTileset2x4
                             50 	.globl _cpct_etm_drawTileBox2x4
                             51 	.globl _cpct_getScreenPtr
                             52 	.globl _cpct_setPALColour
                             53 	.globl _cpct_setPalette
                             54 	.globl _cpct_waitVSYNC
                             55 	.globl _cpct_setVideoMode
                             56 	.globl _cpct_drawSpriteMaskedAlignedTable
                             57 	.globl _cpct_isAnyKeyPressed
                             58 	.globl _cpct_isKeyPressed
                             59 	.globl _cpct_scanKeyboard_if
                             60 	.globl _cpct_disableFirmware
                             61 	.globl _vidas
                             62 	.globl _puntuacion
                             63 	.globl _num_mapa
                             64 	.globl _mapa
                             65 	.globl _i
                             66 	.globl _cu
                             67 	.globl _prota
                             68 	.globl _enemy
                             69 	.globl _spawnY
                             70 	.globl _spawnX
                             71 	.globl _mapas
                             72 ;--------------------------------------------------------
                             73 ; special function registers
                             74 ;--------------------------------------------------------
                             75 ;--------------------------------------------------------
                             76 ; ram data
                             77 ;--------------------------------------------------------
                             78 	.area _DATA
   85EC                      79 _enemy::
   85EC                      80 	.ds 52
   8620                      81 _prota::
   8620                      82 	.ds 8
   8628                      83 _cu::
   8628                      84 	.ds 10
   8632                      85 _i::
   8632                      86 	.ds 1
                             87 ;--------------------------------------------------------
                             88 ; ram data
                             89 ;--------------------------------------------------------
                             90 	.area _INITIALIZED
   8633                      91 _mapa::
   8633                      92 	.ds 2
   8635                      93 _num_mapa::
   8635                      94 	.ds 1
   8636                      95 _puntuacion::
   8636                      96 	.ds 1
   8637                      97 _vidas::
   8637                      98 	.ds 1
                             99 ;--------------------------------------------------------
                            100 ; absolute external ram data
                            101 ;--------------------------------------------------------
                            102 	.area _DABS (ABS)
                            103 ;--------------------------------------------------------
                            104 ; global & static initialisations
                            105 ;--------------------------------------------------------
                            106 	.area _HOME
                            107 	.area _GSINIT
                            108 	.area _GSFINAL
                            109 	.area _GSINIT
                            110 ;--------------------------------------------------------
                            111 ; Home
                            112 ;--------------------------------------------------------
                            113 	.area _HOME
                            114 	.area _HOME
                            115 ;--------------------------------------------------------
                            116 ; code
                            117 ;--------------------------------------------------------
                            118 	.area _CODE
                            119 ;src/main.c:92: cpctm_createTransparentMaskTable(g_tablatrans, 0x2E00, M0, 0); 
                            120 ;	---------------------------------
                            121 ; Function dummy_cpct_transparentMaskTable0M0_container
                            122 ; ---------------------------------
   70E8                     123 _dummy_cpct_transparentMaskTable0M0_container::
                            124 	.area _g_tablatrans_ (ABS) 
   2E00                     125 	.org 0x2E00 
   2E00                     126 	 _g_tablatrans::
   2E00 FF AA 55 00 AA AA   127 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   2E08 55 00 55 00 00 00   128 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E10 AA AA 00 00 AA AA   129 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   2E18 00 00 00 00 00 00   130 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E20 55 00 55 00 00 00   131 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E28 55 00 55 00 00 00   132 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E30 00 00 00 00 00 00   133 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E38 00 00 00 00 00 00   134 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E40 AA AA 00 00 AA AA   135 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   2E48 00 00 00 00 00 00   136 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E50 AA AA 00 00 AA AA   137 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   2E58 00 00 00 00 00 00   138 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E60 00 00 00 00 00 00   139 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E68 00 00 00 00 00 00   140 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E70 00 00 00 00 00 00   141 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E78 00 00 00 00 00 00   142 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E80 55 00 55 00 00 00   143 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E88 55 00 55 00 00 00   144 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E90 00 00 00 00 00 00   145 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E98 00 00 00 00 00 00   146 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2EA0 55 00 55 00 00 00   147 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2EA8 55 00 55 00 00 00   148 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2EB0 00 00 00 00 00 00   149 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2EB8 00 00 00 00 00 00   150 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2EC0 00 00 00 00 00 00   151 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2EC8 00 00 00 00 00 00   152 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2ED0 00 00 00 00 00 00   153 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2ED8 00 00 00 00 00 00   154 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2EE0 00 00 00 00 00 00   155 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2EE8 00 00 00 00 00 00   156 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2EF0 00 00 00 00 00 00   157 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2EF8 00 00 00 00 00 00   158 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            159 	.area _CSEG (REL, CON) 
                            160 ;src/main.c:95: void dibujarMapa() {
                            161 ;	---------------------------------
                            162 ; Function dibujarMapa
                            163 ; ---------------------------------
   863D                     164 _dibujarMapa::
                            165 ;src/main.c:98: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, p, mapa);
   863D 2A 33 86      [16]  166 	ld	hl,(_mapa)
   8640 E5            [11]  167 	push	hl
   8641 21 F0 C0      [10]  168 	ld	hl,#0xC0F0
   8644 E5            [11]  169 	push	hl
   8645 21 2C 28      [10]  170 	ld	hl,#0x282C
   8648 E5            [11]  171 	push	hl
   8649 2E 00         [ 7]  172 	ld	l, #0x00
   864B E5            [11]  173 	push	hl
   864C AF            [ 4]  174 	xor	a, a
   864D F5            [11]  175 	push	af
   864E 33            [ 6]  176 	inc	sp
   864F CD 73 7A      [17]  177 	call	_cpct_etm_drawTileBox2x4
   8652 C9            [10]  178 	ret
   8653                     179 _mapas:
   8653 C0 3D               180 	.dw _g_map1
   8655 E0 36               181 	.dw _g_map2
   8657 00 30               182 	.dw _g_map3
   8659                     183 _spawnX:
   8659 00                  184 	.db #0x00	; 0
   865A 28                  185 	.db #0x28	; 40
   865B 47                  186 	.db #0x47	; 71	'G'
   865C 14                  187 	.db #0x14	; 20
   865D 3C                  188 	.db #0x3C	; 60
   865E                     189 _spawnY:
   865E 00                  190 	.db #0x00	; 0
   865F 2C                  191 	.db #0x2C	; 44
   8660 72                  192 	.db #0x72	; 114	'r'
   8661 8A                  193 	.db #0x8A	; 138
   8662 8A                  194 	.db #0x8A	; 138
                            195 ;src/main.c:101: void dibujarProta() {
                            196 ;	---------------------------------
                            197 ; Function dibujarProta
                            198 ; ---------------------------------
   8663                     199 _dibujarProta::
                            200 ;src/main.c:102: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   8663 21 21 86      [10]  201 	ld	hl, #_prota + 1
   8666 56            [ 7]  202 	ld	d,(hl)
   8667 21 20 86      [10]  203 	ld	hl, #_prota + 0
   866A 46            [ 7]  204 	ld	b,(hl)
   866B D5            [11]  205 	push	de
   866C 33            [ 6]  206 	inc	sp
   866D C5            [11]  207 	push	bc
   866E 33            [ 6]  208 	inc	sp
   866F 21 00 C0      [10]  209 	ld	hl,#0xC000
   8672 E5            [11]  210 	push	hl
   8673 CD 91 85      [17]  211 	call	_cpct_getScreenPtr
   8676 EB            [ 4]  212 	ex	de,hl
                            213 ;src/main.c:103: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   8677 ED 4B 24 86   [20]  214 	ld	bc, (#_prota + 4)
   867B 21 00 2E      [10]  215 	ld	hl,#_g_tablatrans
   867E E5            [11]  216 	push	hl
   867F 21 07 16      [10]  217 	ld	hl,#0x1607
   8682 E5            [11]  218 	push	hl
   8683 D5            [11]  219 	push	de
   8684 C5            [11]  220 	push	bc
   8685 CD B1 85      [17]  221 	call	_cpct_drawSpriteMaskedAlignedTable
   8688 C9            [10]  222 	ret
                            223 ;src/main.c:106: void borrarProta() {
                            224 ;	---------------------------------
                            225 ; Function borrarProta
                            226 ; ---------------------------------
   8689                     227 _borrarProta::
   8689 DD E5         [15]  228 	push	ix
   868B DD 21 00 00   [14]  229 	ld	ix,#0
   868F DD 39         [15]  230 	add	ix,sp
   8691 F5            [11]  231 	push	af
   8692 3B            [ 6]  232 	dec	sp
                            233 ;src/main.c:110: u8 w = 4 + (prota.px & 1);
   8693 21 22 86      [10]  234 	ld	hl, #_prota + 2
   8696 4E            [ 7]  235 	ld	c,(hl)
   8697 79            [ 4]  236 	ld	a,c
   8698 E6 01         [ 7]  237 	and	a, #0x01
   869A 47            [ 4]  238 	ld	b,a
   869B 04            [ 4]  239 	inc	b
   869C 04            [ 4]  240 	inc	b
   869D 04            [ 4]  241 	inc	b
   869E 04            [ 4]  242 	inc	b
                            243 ;src/main.c:113: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   869F 21 23 86      [10]  244 	ld	hl, #_prota + 3
   86A2 5E            [ 7]  245 	ld	e,(hl)
   86A3 CB 4B         [ 8]  246 	bit	1, e
   86A5 28 04         [12]  247 	jr	Z,00103$
   86A7 3E 01         [ 7]  248 	ld	a,#0x01
   86A9 18 02         [12]  249 	jr	00104$
   86AB                     250 00103$:
   86AB 3E 00         [ 7]  251 	ld	a,#0x00
   86AD                     252 00104$:
   86AD C6 06         [ 7]  253 	add	a, #0x06
   86AF DD 77 FD      [19]  254 	ld	-3 (ix),a
                            255 ;src/main.c:115: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   86B2 FD 2A 33 86   [20]  256 	ld	iy,(_mapa)
   86B6 16 00         [ 7]  257 	ld	d,#0x00
   86B8 7B            [ 4]  258 	ld	a,e
   86B9 C6 E8         [ 7]  259 	add	a,#0xE8
   86BB DD 77 FE      [19]  260 	ld	-2 (ix),a
   86BE 7A            [ 4]  261 	ld	a,d
   86BF CE FF         [ 7]  262 	adc	a,#0xFF
   86C1 DD 77 FF      [19]  263 	ld	-1 (ix),a
   86C4 DD 6E FE      [19]  264 	ld	l,-2 (ix)
   86C7 DD 66 FF      [19]  265 	ld	h,-1 (ix)
   86CA DD CB FF 7E   [20]  266 	bit	7, -1 (ix)
   86CE 28 04         [12]  267 	jr	Z,00105$
   86D0 21 EB FF      [10]  268 	ld	hl,#0xFFEB
   86D3 19            [11]  269 	add	hl,de
   86D4                     270 00105$:
   86D4 CB 2C         [ 8]  271 	sra	h
   86D6 CB 1D         [ 8]  272 	rr	l
   86D8 CB 2C         [ 8]  273 	sra	h
   86DA CB 1D         [ 8]  274 	rr	l
   86DC 55            [ 4]  275 	ld	d,l
   86DD CB 39         [ 8]  276 	srl	c
   86DF FD E5         [15]  277 	push	iy
   86E1 21 F0 C0      [10]  278 	ld	hl,#0xC0F0
   86E4 E5            [11]  279 	push	hl
   86E5 3E 28         [ 7]  280 	ld	a,#0x28
   86E7 F5            [11]  281 	push	af
   86E8 33            [ 6]  282 	inc	sp
   86E9 DD 7E FD      [19]  283 	ld	a,-3 (ix)
   86EC F5            [11]  284 	push	af
   86ED 33            [ 6]  285 	inc	sp
   86EE C5            [11]  286 	push	bc
   86EF 33            [ 6]  287 	inc	sp
   86F0 D5            [11]  288 	push	de
   86F1 33            [ 6]  289 	inc	sp
   86F2 79            [ 4]  290 	ld	a,c
   86F3 F5            [11]  291 	push	af
   86F4 33            [ 6]  292 	inc	sp
   86F5 CD 73 7A      [17]  293 	call	_cpct_etm_drawTileBox2x4
   86F8 DD F9         [10]  294 	ld	sp, ix
   86FA DD E1         [14]  295 	pop	ix
   86FC C9            [10]  296 	ret
                            297 ;src/main.c:118: void redibujarProta() {
                            298 ;	---------------------------------
                            299 ; Function redibujarProta
                            300 ; ---------------------------------
   86FD                     301 _redibujarProta::
                            302 ;src/main.c:119: borrarProta();
   86FD CD 89 86      [17]  303 	call	_borrarProta
                            304 ;src/main.c:120: prota.px = prota.x;
   8700 01 22 86      [10]  305 	ld	bc,#_prota + 2
   8703 3A 20 86      [13]  306 	ld	a, (#_prota + 0)
   8706 02            [ 7]  307 	ld	(bc),a
                            308 ;src/main.c:121: prota.py = prota.y;
   8707 01 23 86      [10]  309 	ld	bc,#_prota + 3
   870A 3A 21 86      [13]  310 	ld	a, (#_prota + 1)
   870D 02            [ 7]  311 	ld	(bc),a
                            312 ;src/main.c:122: dibujarProta();
   870E C3 63 86      [10]  313 	jp  _dibujarProta
                            314 ;src/main.c:125: void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
                            315 ;	---------------------------------
                            316 ; Function comprobarTeclado
                            317 ; ---------------------------------
   8711                     318 _comprobarTeclado::
                            319 ;src/main.c:126: cpct_scanKeyboard_if();
   8711 CD CB 7B      [17]  320 	call	_cpct_scanKeyboard_if
                            321 ;src/main.c:128: if (cpct_isAnyKeyPressed()) {
   8714 CD BE 7B      [17]  322 	call	_cpct_isAnyKeyPressed
   8717 7D            [ 4]  323 	ld	a,l
   8718 B7            [ 4]  324 	or	a, a
   8719 C8            [11]  325 	ret	Z
                            326 ;src/main.c:129: if (cpct_isKeyPressed(Key_CursorLeft))
   871A 21 01 01      [10]  327 	ld	hl,#0x0101
   871D CD 92 79      [17]  328 	call	_cpct_isKeyPressed
   8720 7D            [ 4]  329 	ld	a,l
   8721 B7            [ 4]  330 	or	a, a
                            331 ;src/main.c:130: moverIzquierda();
   8722 C2 03 90      [10]  332 	jp	NZ,_moverIzquierda
                            333 ;src/main.c:131: else if (cpct_isKeyPressed(Key_CursorRight))
   8725 21 00 02      [10]  334 	ld	hl,#0x0200
   8728 CD 92 79      [17]  335 	call	_cpct_isKeyPressed
   872B 7D            [ 4]  336 	ld	a,l
   872C B7            [ 4]  337 	or	a, a
                            338 ;src/main.c:132: moverDerecha();
   872D C2 28 90      [10]  339 	jp	NZ,_moverDerecha
                            340 ;src/main.c:133: else if (cpct_isKeyPressed(Key_CursorUp))
   8730 21 00 01      [10]  341 	ld	hl,#0x0100
   8733 CD 92 79      [17]  342 	call	_cpct_isKeyPressed
   8736 7D            [ 4]  343 	ld	a,l
   8737 B7            [ 4]  344 	or	a, a
                            345 ;src/main.c:134: moverArriba();
   8738 C2 6D 90      [10]  346 	jp	NZ,_moverArriba
                            347 ;src/main.c:135: else if (cpct_isKeyPressed(Key_CursorDown))
   873B 21 00 04      [10]  348 	ld	hl,#0x0400
   873E CD 92 79      [17]  349 	call	_cpct_isKeyPressed
   8741 7D            [ 4]  350 	ld	a,l
   8742 B7            [ 4]  351 	or	a, a
                            352 ;src/main.c:136: moverAbajo();
   8743 C2 91 90      [10]  353 	jp	NZ,_moverAbajo
                            354 ;src/main.c:137: else if (cpct_isKeyPressed(Key_Space))
   8746 21 05 80      [10]  355 	ld	hl,#0x8005
   8749 CD 92 79      [17]  356 	call	_cpct_isKeyPressed
   874C 7D            [ 4]  357 	ld	a,l
   874D B7            [ 4]  358 	or	a, a
   874E C8            [11]  359 	ret	Z
                            360 ;src/main.c:138: lanzarCuchillo(cu, prota, mapa, g_tablatrans);
   874F 21 08 00      [10]  361 	ld	hl, #8
   8752 39            [11]  362 	add	hl, sp
   8753 4E            [ 7]  363 	ld	c, (hl)
   8754 23            [ 6]  364 	inc	hl
   8755 46            [ 7]  365 	ld	b, (hl)
   8756 C5            [11]  366 	push	bc
   8757 21 08 00      [10]  367 	ld	hl, #8
   875A 39            [11]  368 	add	hl, sp
   875B 4E            [ 7]  369 	ld	c, (hl)
   875C 23            [ 6]  370 	inc	hl
   875D 46            [ 7]  371 	ld	b, (hl)
   875E C5            [11]  372 	push	bc
   875F 21 08 00      [10]  373 	ld	hl, #8
   8762 39            [11]  374 	add	hl, sp
   8763 4E            [ 7]  375 	ld	c, (hl)
   8764 23            [ 6]  376 	inc	hl
   8765 46            [ 7]  377 	ld	b, (hl)
   8766 C5            [11]  378 	push	bc
   8767 21 08 00      [10]  379 	ld	hl, #8
   876A 39            [11]  380 	add	hl, sp
   876B 4E            [ 7]  381 	ld	c, (hl)
   876C 23            [ 6]  382 	inc	hl
   876D 46            [ 7]  383 	ld	b, (hl)
   876E C5            [11]  384 	push	bc
   876F CD 77 6D      [17]  385 	call	_lanzarCuchillo
   8772 21 08 00      [10]  386 	ld	hl,#8
   8775 39            [11]  387 	add	hl,sp
   8776 F9            [ 6]  388 	ld	sp,hl
   8777 C9            [10]  389 	ret
                            390 ;src/main.c:142: u8 checkCollision(u8 direction) { // check optimization
                            391 ;	---------------------------------
                            392 ; Function checkCollision
                            393 ; ---------------------------------
   8778                     394 _checkCollision::
   8778 DD E5         [15]  395 	push	ix
   877A DD 21 00 00   [14]  396 	ld	ix,#0
   877E DD 39         [15]  397 	add	ix,sp
   8780 F5            [11]  398 	push	af
                            399 ;src/main.c:143: u8 *headTile=0, *feetTile=0, *waistTile=0;
   8781 21 00 00      [10]  400 	ld	hl,#0x0000
   8784 E3            [19]  401 	ex	(sp), hl
   8785 11 00 00      [10]  402 	ld	de,#0x0000
   8788 01 00 00      [10]  403 	ld	bc,#0x0000
                            404 ;src/main.c:145: switch (direction) {
   878B 3E 03         [ 7]  405 	ld	a,#0x03
   878D DD 96 04      [19]  406 	sub	a, 4 (ix)
   8790 DA CC 88      [10]  407 	jp	C,00105$
   8793 DD 5E 04      [19]  408 	ld	e,4 (ix)
   8796 16 00         [ 7]  409 	ld	d,#0x00
   8798 21 9F 87      [10]  410 	ld	hl,#00124$
   879B 19            [11]  411 	add	hl,de
   879C 19            [11]  412 	add	hl,de
   879D 19            [11]  413 	add	hl,de
   879E E9            [ 4]  414 	jp	(hl)
   879F                     415 00124$:
   879F C3 AB 87      [10]  416 	jp	00101$
   87A2 C3 04 88      [10]  417 	jp	00102$
   87A5 C3 54 88      [10]  418 	jp	00103$
   87A8 C3 91 88      [10]  419 	jp	00104$
                            420 ;src/main.c:146: case 0:
   87AB                     421 00101$:
                            422 ;src/main.c:147: headTile  = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y);
   87AB 21 21 86      [10]  423 	ld	hl, #(_prota + 0x0001) + 0
   87AE 4E            [ 7]  424 	ld	c,(hl)
   87AF 3A 20 86      [13]  425 	ld	a, (#_prota + 0)
   87B2 47            [ 4]  426 	ld	b,a
   87B3 04            [ 4]  427 	inc	b
   87B4 04            [ 4]  428 	inc	b
   87B5 04            [ 4]  429 	inc	b
   87B6 04            [ 4]  430 	inc	b
   87B7 79            [ 4]  431 	ld	a,c
   87B8 F5            [11]  432 	push	af
   87B9 33            [ 6]  433 	inc	sp
   87BA C5            [11]  434 	push	bc
   87BB 33            [ 6]  435 	inc	sp
   87BC 2A 33 86      [16]  436 	ld	hl,(_mapa)
   87BF E5            [11]  437 	push	hl
   87C0 CD E8 70      [17]  438 	call	_getTilePtr
   87C3 F1            [10]  439 	pop	af
   87C4 F1            [10]  440 	pop	af
   87C5 33            [ 6]  441 	inc	sp
   87C6 33            [ 6]  442 	inc	sp
   87C7 E5            [11]  443 	push	hl
                            444 ;src/main.c:148: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   87C8 3A 21 86      [13]  445 	ld	a, (#(_prota + 0x0001) + 0)
   87CB C6 14         [ 7]  446 	add	a, #0x14
   87CD 4F            [ 4]  447 	ld	c,a
   87CE 21 20 86      [10]  448 	ld	hl, #_prota + 0
   87D1 46            [ 7]  449 	ld	b,(hl)
   87D2 04            [ 4]  450 	inc	b
   87D3 04            [ 4]  451 	inc	b
   87D4 04            [ 4]  452 	inc	b
   87D5 04            [ 4]  453 	inc	b
   87D6 79            [ 4]  454 	ld	a,c
   87D7 F5            [11]  455 	push	af
   87D8 33            [ 6]  456 	inc	sp
   87D9 C5            [11]  457 	push	bc
   87DA 33            [ 6]  458 	inc	sp
   87DB 2A 33 86      [16]  459 	ld	hl,(_mapa)
   87DE E5            [11]  460 	push	hl
   87DF CD E8 70      [17]  461 	call	_getTilePtr
   87E2 F1            [10]  462 	pop	af
   87E3 F1            [10]  463 	pop	af
   87E4 EB            [ 4]  464 	ex	de,hl
                            465 ;src/main.c:149: waistTile = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   87E5 3A 21 86      [13]  466 	ld	a, (#(_prota + 0x0001) + 0)
   87E8 C6 0B         [ 7]  467 	add	a, #0x0B
   87EA 47            [ 4]  468 	ld	b,a
   87EB 3A 20 86      [13]  469 	ld	a, (#_prota + 0)
   87EE C6 04         [ 7]  470 	add	a, #0x04
   87F0 D5            [11]  471 	push	de
   87F1 C5            [11]  472 	push	bc
   87F2 33            [ 6]  473 	inc	sp
   87F3 F5            [11]  474 	push	af
   87F4 33            [ 6]  475 	inc	sp
   87F5 2A 33 86      [16]  476 	ld	hl,(_mapa)
   87F8 E5            [11]  477 	push	hl
   87F9 CD E8 70      [17]  478 	call	_getTilePtr
   87FC F1            [10]  479 	pop	af
   87FD F1            [10]  480 	pop	af
   87FE 4D            [ 4]  481 	ld	c,l
   87FF 44            [ 4]  482 	ld	b,h
   8800 D1            [10]  483 	pop	de
                            484 ;src/main.c:150: break;
   8801 C3 CC 88      [10]  485 	jp	00105$
                            486 ;src/main.c:151: case 1:
   8804                     487 00102$:
                            488 ;src/main.c:152: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
   8804 21 21 86      [10]  489 	ld	hl, #(_prota + 0x0001) + 0
   8807 56            [ 7]  490 	ld	d,(hl)
   8808 21 20 86      [10]  491 	ld	hl, #_prota + 0
   880B 46            [ 7]  492 	ld	b,(hl)
   880C 05            [ 4]  493 	dec	b
   880D D5            [11]  494 	push	de
   880E 33            [ 6]  495 	inc	sp
   880F C5            [11]  496 	push	bc
   8810 33            [ 6]  497 	inc	sp
   8811 2A 33 86      [16]  498 	ld	hl,(_mapa)
   8814 E5            [11]  499 	push	hl
   8815 CD E8 70      [17]  500 	call	_getTilePtr
   8818 F1            [10]  501 	pop	af
   8819 F1            [10]  502 	pop	af
   881A 33            [ 6]  503 	inc	sp
   881B 33            [ 6]  504 	inc	sp
   881C E5            [11]  505 	push	hl
                            506 ;src/main.c:153: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
   881D 3A 21 86      [13]  507 	ld	a, (#(_prota + 0x0001) + 0)
   8820 C6 14         [ 7]  508 	add	a, #0x14
   8822 57            [ 4]  509 	ld	d,a
   8823 21 20 86      [10]  510 	ld	hl, #_prota + 0
   8826 46            [ 7]  511 	ld	b,(hl)
   8827 05            [ 4]  512 	dec	b
   8828 D5            [11]  513 	push	de
   8829 33            [ 6]  514 	inc	sp
   882A C5            [11]  515 	push	bc
   882B 33            [ 6]  516 	inc	sp
   882C 2A 33 86      [16]  517 	ld	hl,(_mapa)
   882F E5            [11]  518 	push	hl
   8830 CD E8 70      [17]  519 	call	_getTilePtr
   8833 F1            [10]  520 	pop	af
   8834 F1            [10]  521 	pop	af
   8835 EB            [ 4]  522 	ex	de,hl
                            523 ;src/main.c:154: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
   8836 3A 21 86      [13]  524 	ld	a, (#(_prota + 0x0001) + 0)
   8839 C6 0B         [ 7]  525 	add	a, #0x0B
   883B 47            [ 4]  526 	ld	b,a
   883C 3A 20 86      [13]  527 	ld	a, (#_prota + 0)
   883F C6 FF         [ 7]  528 	add	a,#0xFF
   8841 D5            [11]  529 	push	de
   8842 C5            [11]  530 	push	bc
   8843 33            [ 6]  531 	inc	sp
   8844 F5            [11]  532 	push	af
   8845 33            [ 6]  533 	inc	sp
   8846 2A 33 86      [16]  534 	ld	hl,(_mapa)
   8849 E5            [11]  535 	push	hl
   884A CD E8 70      [17]  536 	call	_getTilePtr
   884D F1            [10]  537 	pop	af
   884E F1            [10]  538 	pop	af
   884F 4D            [ 4]  539 	ld	c,l
   8850 44            [ 4]  540 	ld	b,h
   8851 D1            [10]  541 	pop	de
                            542 ;src/main.c:155: break;
   8852 18 78         [12]  543 	jr	00105$
                            544 ;src/main.c:156: case 2:
   8854                     545 00103$:
                            546 ;src/main.c:157: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
   8854 3A 21 86      [13]  547 	ld	a, (#(_prota + 0x0001) + 0)
   8857 C6 FE         [ 7]  548 	add	a,#0xFE
   8859 21 20 86      [10]  549 	ld	hl, #_prota + 0
   885C 56            [ 7]  550 	ld	d,(hl)
   885D C5            [11]  551 	push	bc
   885E F5            [11]  552 	push	af
   885F 33            [ 6]  553 	inc	sp
   8860 D5            [11]  554 	push	de
   8861 33            [ 6]  555 	inc	sp
   8862 2A 33 86      [16]  556 	ld	hl,(_mapa)
   8865 E5            [11]  557 	push	hl
   8866 CD E8 70      [17]  558 	call	_getTilePtr
   8869 F1            [10]  559 	pop	af
   886A F1            [10]  560 	pop	af
   886B C1            [10]  561 	pop	bc
   886C 33            [ 6]  562 	inc	sp
   886D 33            [ 6]  563 	inc	sp
   886E E5            [11]  564 	push	hl
                            565 ;src/main.c:158: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
   886F 21 21 86      [10]  566 	ld	hl, #(_prota + 0x0001) + 0
   8872 56            [ 7]  567 	ld	d,(hl)
   8873 15            [ 4]  568 	dec	d
   8874 15            [ 4]  569 	dec	d
   8875 3A 20 86      [13]  570 	ld	a, (#_prota + 0)
   8878 C6 03         [ 7]  571 	add	a, #0x03
   887A C5            [11]  572 	push	bc
   887B D5            [11]  573 	push	de
   887C 33            [ 6]  574 	inc	sp
   887D F5            [11]  575 	push	af
   887E 33            [ 6]  576 	inc	sp
   887F 2A 33 86      [16]  577 	ld	hl,(_mapa)
   8882 E5            [11]  578 	push	hl
   8883 CD E8 70      [17]  579 	call	_getTilePtr
   8886 F1            [10]  580 	pop	af
   8887 F1            [10]  581 	pop	af
   8888 EB            [ 4]  582 	ex	de,hl
   8889 C1            [10]  583 	pop	bc
                            584 ;src/main.c:159: *waistTile = 0;
   888A 21 00 00      [10]  585 	ld	hl,#0x0000
   888D 36 00         [10]  586 	ld	(hl),#0x00
                            587 ;src/main.c:160: break;
   888F 18 3B         [12]  588 	jr	00105$
                            589 ;src/main.c:161: case 3:
   8891                     590 00104$:
                            591 ;src/main.c:162: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
   8891 3A 21 86      [13]  592 	ld	a, (#(_prota + 0x0001) + 0)
   8894 C6 16         [ 7]  593 	add	a, #0x16
   8896 21 20 86      [10]  594 	ld	hl, #_prota + 0
   8899 56            [ 7]  595 	ld	d,(hl)
   889A C5            [11]  596 	push	bc
   889B F5            [11]  597 	push	af
   889C 33            [ 6]  598 	inc	sp
   889D D5            [11]  599 	push	de
   889E 33            [ 6]  600 	inc	sp
   889F 2A 33 86      [16]  601 	ld	hl,(_mapa)
   88A2 E5            [11]  602 	push	hl
   88A3 CD E8 70      [17]  603 	call	_getTilePtr
   88A6 F1            [10]  604 	pop	af
   88A7 F1            [10]  605 	pop	af
   88A8 C1            [10]  606 	pop	bc
   88A9 33            [ 6]  607 	inc	sp
   88AA 33            [ 6]  608 	inc	sp
   88AB E5            [11]  609 	push	hl
                            610 ;src/main.c:163: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   88AC 3A 21 86      [13]  611 	ld	a, (#(_prota + 0x0001) + 0)
   88AF C6 16         [ 7]  612 	add	a, #0x16
   88B1 57            [ 4]  613 	ld	d,a
   88B2 3A 20 86      [13]  614 	ld	a, (#_prota + 0)
   88B5 C6 03         [ 7]  615 	add	a, #0x03
   88B7 C5            [11]  616 	push	bc
   88B8 D5            [11]  617 	push	de
   88B9 33            [ 6]  618 	inc	sp
   88BA F5            [11]  619 	push	af
   88BB 33            [ 6]  620 	inc	sp
   88BC 2A 33 86      [16]  621 	ld	hl,(_mapa)
   88BF E5            [11]  622 	push	hl
   88C0 CD E8 70      [17]  623 	call	_getTilePtr
   88C3 F1            [10]  624 	pop	af
   88C4 F1            [10]  625 	pop	af
   88C5 EB            [ 4]  626 	ex	de,hl
   88C6 C1            [10]  627 	pop	bc
                            628 ;src/main.c:164: *waistTile = 0;
   88C7 21 00 00      [10]  629 	ld	hl,#0x0000
   88CA 36 00         [10]  630 	ld	(hl),#0x00
                            631 ;src/main.c:166: }
   88CC                     632 00105$:
                            633 ;src/main.c:168: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   88CC E1            [10]  634 	pop	hl
   88CD E5            [11]  635 	push	hl
   88CE 6E            [ 7]  636 	ld	l,(hl)
   88CF 3E 02         [ 7]  637 	ld	a,#0x02
   88D1 95            [ 4]  638 	sub	a, l
   88D2 38 0E         [12]  639 	jr	C,00106$
   88D4 1A            [ 7]  640 	ld	a,(de)
   88D5 5F            [ 4]  641 	ld	e,a
   88D6 3E 02         [ 7]  642 	ld	a,#0x02
   88D8 93            [ 4]  643 	sub	a, e
   88D9 38 07         [12]  644 	jr	C,00106$
   88DB 0A            [ 7]  645 	ld	a,(bc)
   88DC 4F            [ 4]  646 	ld	c,a
   88DD 3E 02         [ 7]  647 	ld	a,#0x02
   88DF 91            [ 4]  648 	sub	a, c
   88E0 30 04         [12]  649 	jr	NC,00107$
   88E2                     650 00106$:
                            651 ;src/main.c:169: return 1;
   88E2 2E 01         [ 7]  652 	ld	l,#0x01
   88E4 18 02         [12]  653 	jr	00110$
   88E6                     654 00107$:
                            655 ;src/main.c:171: return 0;
   88E6 2E 00         [ 7]  656 	ld	l,#0x00
   88E8                     657 00110$:
   88E8 DD F9         [10]  658 	ld	sp, ix
   88EA DD E1         [14]  659 	pop	ix
   88EC C9            [10]  660 	ret
                            661 ;src/main.c:174: void dibujarEnemigo(TEnemy *enemy) {
                            662 ;	---------------------------------
                            663 ; Function dibujarEnemigo
                            664 ; ---------------------------------
   88ED                     665 _dibujarEnemigo::
   88ED DD E5         [15]  666 	push	ix
   88EF DD 21 00 00   [14]  667 	ld	ix,#0
   88F3 DD 39         [15]  668 	add	ix,sp
                            669 ;src/main.c:175: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   88F5 DD 4E 04      [19]  670 	ld	c,4 (ix)
   88F8 DD 46 05      [19]  671 	ld	b,5 (ix)
   88FB 69            [ 4]  672 	ld	l, c
   88FC 60            [ 4]  673 	ld	h, b
   88FD 23            [ 6]  674 	inc	hl
   88FE 56            [ 7]  675 	ld	d,(hl)
   88FF 0A            [ 7]  676 	ld	a,(bc)
   8900 C5            [11]  677 	push	bc
   8901 D5            [11]  678 	push	de
   8902 33            [ 6]  679 	inc	sp
   8903 F5            [11]  680 	push	af
   8904 33            [ 6]  681 	inc	sp
   8905 21 00 C0      [10]  682 	ld	hl,#0xC000
   8908 E5            [11]  683 	push	hl
   8909 CD 91 85      [17]  684 	call	_cpct_getScreenPtr
   890C EB            [ 4]  685 	ex	de,hl
                            686 ;src/main.c:176: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   890D E1            [10]  687 	pop	hl
   890E 01 04 00      [10]  688 	ld	bc, #0x0004
   8911 09            [11]  689 	add	hl, bc
   8912 4E            [ 7]  690 	ld	c,(hl)
   8913 23            [ 6]  691 	inc	hl
   8914 46            [ 7]  692 	ld	b,(hl)
   8915 21 00 2E      [10]  693 	ld	hl,#_g_tablatrans
   8918 E5            [11]  694 	push	hl
   8919 21 04 16      [10]  695 	ld	hl,#0x1604
   891C E5            [11]  696 	push	hl
   891D D5            [11]  697 	push	de
   891E C5            [11]  698 	push	bc
   891F CD B1 85      [17]  699 	call	_cpct_drawSpriteMaskedAlignedTable
   8922 DD E1         [14]  700 	pop	ix
   8924 C9            [10]  701 	ret
                            702 ;src/main.c:179: void dibujarExplosion(TEnemy *enemy) {
                            703 ;	---------------------------------
                            704 ; Function dibujarExplosion
                            705 ; ---------------------------------
   8925                     706 _dibujarExplosion::
   8925 DD E5         [15]  707 	push	ix
   8927 DD 21 00 00   [14]  708 	ld	ix,#0
   892B DD 39         [15]  709 	add	ix,sp
                            710 ;src/main.c:180: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   892D DD 4E 04      [19]  711 	ld	c,4 (ix)
   8930 DD 46 05      [19]  712 	ld	b,5 (ix)
   8933 69            [ 4]  713 	ld	l, c
   8934 60            [ 4]  714 	ld	h, b
   8935 23            [ 6]  715 	inc	hl
   8936 56            [ 7]  716 	ld	d,(hl)
   8937 0A            [ 7]  717 	ld	a,(bc)
   8938 47            [ 4]  718 	ld	b,a
   8939 D5            [11]  719 	push	de
   893A 33            [ 6]  720 	inc	sp
   893B C5            [11]  721 	push	bc
   893C 33            [ 6]  722 	inc	sp
   893D 21 00 C0      [10]  723 	ld	hl,#0xC000
   8940 E5            [11]  724 	push	hl
   8941 CD 91 85      [17]  725 	call	_cpct_getScreenPtr
   8944 4D            [ 4]  726 	ld	c,l
   8945 44            [ 4]  727 	ld	b,h
                            728 ;src/main.c:181: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   8946 11 00 2E      [10]  729 	ld	de,#_g_tablatrans+0
   8949 D5            [11]  730 	push	de
   894A 21 04 16      [10]  731 	ld	hl,#0x1604
   894D E5            [11]  732 	push	hl
   894E C5            [11]  733 	push	bc
   894F 21 70 46      [10]  734 	ld	hl,#_g_explosion
   8952 E5            [11]  735 	push	hl
   8953 CD B1 85      [17]  736 	call	_cpct_drawSpriteMaskedAlignedTable
   8956 DD E1         [14]  737 	pop	ix
   8958 C9            [10]  738 	ret
                            739 ;src/main.c:184: void borrarExplosion() {
                            740 ;	---------------------------------
                            741 ; Function borrarExplosion
                            742 ; ---------------------------------
   8959                     743 _borrarExplosion::
   8959 DD E5         [15]  744 	push	ix
   895B DD 21 00 00   [14]  745 	ld	ix,#0
   895F DD 39         [15]  746 	add	ix,sp
   8961 F5            [11]  747 	push	af
   8962 3B            [ 6]  748 	dec	sp
                            749 ;src/main.c:187: u8 w = 4 + (enemy->px & 1);
   8963 21 EE 85      [10]  750 	ld	hl, #_enemy + 2
   8966 4E            [ 7]  751 	ld	c,(hl)
   8967 79            [ 4]  752 	ld	a,c
   8968 E6 01         [ 7]  753 	and	a, #0x01
   896A 47            [ 4]  754 	ld	b,a
   896B 04            [ 4]  755 	inc	b
   896C 04            [ 4]  756 	inc	b
   896D 04            [ 4]  757 	inc	b
   896E 04            [ 4]  758 	inc	b
                            759 ;src/main.c:190: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   896F 21 EF 85      [10]  760 	ld	hl, #_enemy + 3
   8972 5E            [ 7]  761 	ld	e,(hl)
   8973 CB 4B         [ 8]  762 	bit	1, e
   8975 28 04         [12]  763 	jr	Z,00103$
   8977 3E 01         [ 7]  764 	ld	a,#0x01
   8979 18 02         [12]  765 	jr	00104$
   897B                     766 00103$:
   897B 3E 00         [ 7]  767 	ld	a,#0x00
   897D                     768 00104$:
   897D C6 07         [ 7]  769 	add	a, #0x07
   897F DD 77 FD      [19]  770 	ld	-3 (ix),a
                            771 ;src/main.c:192: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   8982 FD 2A 33 86   [20]  772 	ld	iy,(_mapa)
   8986 16 00         [ 7]  773 	ld	d,#0x00
   8988 7B            [ 4]  774 	ld	a,e
   8989 C6 E8         [ 7]  775 	add	a,#0xE8
   898B DD 77 FE      [19]  776 	ld	-2 (ix),a
   898E 7A            [ 4]  777 	ld	a,d
   898F CE FF         [ 7]  778 	adc	a,#0xFF
   8991 DD 77 FF      [19]  779 	ld	-1 (ix),a
   8994 DD 6E FE      [19]  780 	ld	l,-2 (ix)
   8997 DD 66 FF      [19]  781 	ld	h,-1 (ix)
   899A DD CB FF 7E   [20]  782 	bit	7, -1 (ix)
   899E 28 04         [12]  783 	jr	Z,00105$
   89A0 21 EB FF      [10]  784 	ld	hl,#0xFFEB
   89A3 19            [11]  785 	add	hl,de
   89A4                     786 00105$:
   89A4 CB 2C         [ 8]  787 	sra	h
   89A6 CB 1D         [ 8]  788 	rr	l
   89A8 CB 2C         [ 8]  789 	sra	h
   89AA CB 1D         [ 8]  790 	rr	l
   89AC 55            [ 4]  791 	ld	d,l
   89AD CB 39         [ 8]  792 	srl	c
   89AF FD E5         [15]  793 	push	iy
   89B1 21 F0 C0      [10]  794 	ld	hl,#0xC0F0
   89B4 E5            [11]  795 	push	hl
   89B5 3E 28         [ 7]  796 	ld	a,#0x28
   89B7 F5            [11]  797 	push	af
   89B8 33            [ 6]  798 	inc	sp
   89B9 DD 7E FD      [19]  799 	ld	a,-3 (ix)
   89BC F5            [11]  800 	push	af
   89BD 33            [ 6]  801 	inc	sp
   89BE C5            [11]  802 	push	bc
   89BF 33            [ 6]  803 	inc	sp
   89C0 D5            [11]  804 	push	de
   89C1 33            [ 6]  805 	inc	sp
   89C2 79            [ 4]  806 	ld	a,c
   89C3 F5            [11]  807 	push	af
   89C4 33            [ 6]  808 	inc	sp
   89C5 CD 73 7A      [17]  809 	call	_cpct_etm_drawTileBox2x4
   89C8 DD F9         [10]  810 	ld	sp, ix
   89CA DD E1         [14]  811 	pop	ix
   89CC C9            [10]  812 	ret
                            813 ;src/main.c:196: void borrarEnemigo(TEnemy *enemy) {
                            814 ;	---------------------------------
                            815 ; Function borrarEnemigo
                            816 ; ---------------------------------
   89CD                     817 _borrarEnemigo::
   89CD DD E5         [15]  818 	push	ix
   89CF DD 21 00 00   [14]  819 	ld	ix,#0
   89D3 DD 39         [15]  820 	add	ix,sp
   89D5 21 FA FF      [10]  821 	ld	hl,#-6
   89D8 39            [11]  822 	add	hl,sp
   89D9 F9            [ 6]  823 	ld	sp,hl
                            824 ;src/main.c:200: u8 w = 4 + (enemy->px & 1);
   89DA DD 4E 04      [19]  825 	ld	c,4 (ix)
   89DD DD 46 05      [19]  826 	ld	b,5 (ix)
   89E0 69            [ 4]  827 	ld	l, c
   89E1 60            [ 4]  828 	ld	h, b
   89E2 23            [ 6]  829 	inc	hl
   89E3 23            [ 6]  830 	inc	hl
   89E4 5E            [ 7]  831 	ld	e,(hl)
   89E5 7B            [ 4]  832 	ld	a,e
   89E6 E6 01         [ 7]  833 	and	a, #0x01
   89E8 C6 04         [ 7]  834 	add	a, #0x04
   89EA DD 77 FB      [19]  835 	ld	-5 (ix),a
                            836 ;src/main.c:203: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   89ED 69            [ 4]  837 	ld	l, c
   89EE 60            [ 4]  838 	ld	h, b
   89EF 23            [ 6]  839 	inc	hl
   89F0 23            [ 6]  840 	inc	hl
   89F1 23            [ 6]  841 	inc	hl
   89F2 56            [ 7]  842 	ld	d,(hl)
   89F3 CB 4A         [ 8]  843 	bit	1, d
   89F5 28 04         [12]  844 	jr	Z,00103$
   89F7 3E 01         [ 7]  845 	ld	a,#0x01
   89F9 18 02         [12]  846 	jr	00104$
   89FB                     847 00103$:
   89FB 3E 00         [ 7]  848 	ld	a,#0x00
   89FD                     849 00104$:
   89FD C6 07         [ 7]  850 	add	a, #0x07
   89FF DD 77 FA      [19]  851 	ld	-6 (ix),a
                            852 ;src/main.c:205: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   8A02 FD 2A 33 86   [20]  853 	ld	iy,(_mapa)
   8A06 DD 72 FE      [19]  854 	ld	-2 (ix),d
   8A09 DD 36 FF 00   [19]  855 	ld	-1 (ix),#0x00
   8A0D DD 7E FE      [19]  856 	ld	a,-2 (ix)
   8A10 C6 E8         [ 7]  857 	add	a,#0xE8
   8A12 DD 77 FC      [19]  858 	ld	-4 (ix),a
   8A15 DD 7E FF      [19]  859 	ld	a,-1 (ix)
   8A18 CE FF         [ 7]  860 	adc	a,#0xFF
   8A1A DD 77 FD      [19]  861 	ld	-3 (ix),a
   8A1D DD 56 FC      [19]  862 	ld	d,-4 (ix)
   8A20 DD 6E FD      [19]  863 	ld	l,-3 (ix)
   8A23 DD CB FD 7E   [20]  864 	bit	7, -3 (ix)
   8A27 28 0C         [12]  865 	jr	Z,00105$
   8A29 DD 7E FE      [19]  866 	ld	a,-2 (ix)
   8A2C C6 EB         [ 7]  867 	add	a, #0xEB
   8A2E 57            [ 4]  868 	ld	d,a
   8A2F DD 7E FF      [19]  869 	ld	a,-1 (ix)
   8A32 CE FF         [ 7]  870 	adc	a, #0xFF
   8A34 6F            [ 4]  871 	ld	l,a
   8A35                     872 00105$:
   8A35 CB 2D         [ 8]  873 	sra	l
   8A37 CB 1A         [ 8]  874 	rr	d
   8A39 CB 2D         [ 8]  875 	sra	l
   8A3B CB 1A         [ 8]  876 	rr	d
   8A3D CB 3B         [ 8]  877 	srl	e
   8A3F C5            [11]  878 	push	bc
   8A40 FD E5         [15]  879 	push	iy
   8A42 21 F0 C0      [10]  880 	ld	hl,#0xC0F0
   8A45 E5            [11]  881 	push	hl
   8A46 3E 28         [ 7]  882 	ld	a,#0x28
   8A48 F5            [11]  883 	push	af
   8A49 33            [ 6]  884 	inc	sp
   8A4A DD 66 FA      [19]  885 	ld	h,-6 (ix)
   8A4D DD 6E FB      [19]  886 	ld	l,-5 (ix)
   8A50 E5            [11]  887 	push	hl
   8A51 D5            [11]  888 	push	de
   8A52 CD 73 7A      [17]  889 	call	_cpct_etm_drawTileBox2x4
   8A55 C1            [10]  890 	pop	bc
                            891 ;src/main.c:207: enemy->mover = NO;
   8A56 21 06 00      [10]  892 	ld	hl,#0x0006
   8A59 09            [11]  893 	add	hl,bc
   8A5A 36 00         [10]  894 	ld	(hl),#0x00
   8A5C DD F9         [10]  895 	ld	sp, ix
   8A5E DD E1         [14]  896 	pop	ix
   8A60 C9            [10]  897 	ret
                            898 ;src/main.c:210: void redibujarEnemigo(TEnemy *enemy) {
                            899 ;	---------------------------------
                            900 ; Function redibujarEnemigo
                            901 ; ---------------------------------
   8A61                     902 _redibujarEnemigo::
   8A61 DD E5         [15]  903 	push	ix
   8A63 DD 21 00 00   [14]  904 	ld	ix,#0
   8A67 DD 39         [15]  905 	add	ix,sp
                            906 ;src/main.c:211: borrarEnemigo(enemy);
   8A69 DD 6E 04      [19]  907 	ld	l,4 (ix)
   8A6C DD 66 05      [19]  908 	ld	h,5 (ix)
   8A6F E5            [11]  909 	push	hl
   8A70 CD CD 89      [17]  910 	call	_borrarEnemigo
   8A73 F1            [10]  911 	pop	af
                            912 ;src/main.c:212: enemy->px = enemy->x;
   8A74 DD 4E 04      [19]  913 	ld	c,4 (ix)
   8A77 DD 46 05      [19]  914 	ld	b,5 (ix)
   8A7A 59            [ 4]  915 	ld	e, c
   8A7B 50            [ 4]  916 	ld	d, b
   8A7C 13            [ 6]  917 	inc	de
   8A7D 13            [ 6]  918 	inc	de
   8A7E 0A            [ 7]  919 	ld	a,(bc)
   8A7F 12            [ 7]  920 	ld	(de),a
                            921 ;src/main.c:213: enemy->py = enemy->y;
   8A80 59            [ 4]  922 	ld	e, c
   8A81 50            [ 4]  923 	ld	d, b
   8A82 13            [ 6]  924 	inc	de
   8A83 13            [ 6]  925 	inc	de
   8A84 13            [ 6]  926 	inc	de
   8A85 69            [ 4]  927 	ld	l, c
   8A86 60            [ 4]  928 	ld	h, b
   8A87 23            [ 6]  929 	inc	hl
   8A88 7E            [ 7]  930 	ld	a,(hl)
   8A89 12            [ 7]  931 	ld	(de),a
                            932 ;src/main.c:214: dibujarEnemigo(enemy);
   8A8A C5            [11]  933 	push	bc
   8A8B CD ED 88      [17]  934 	call	_dibujarEnemigo
   8A8E F1            [10]  935 	pop	af
   8A8F DD E1         [14]  936 	pop	ix
   8A91 C9            [10]  937 	ret
                            938 ;src/main.c:217: u8 checkEnemyCollision(u8 direction, TEnemy *enemy){
                            939 ;	---------------------------------
                            940 ; Function checkEnemyCollision
                            941 ; ---------------------------------
   8A92                     942 _checkEnemyCollision::
   8A92 DD E5         [15]  943 	push	ix
   8A94 DD 21 00 00   [14]  944 	ld	ix,#0
   8A98 DD 39         [15]  945 	add	ix,sp
   8A9A 21 F7 FF      [10]  946 	ld	hl,#-9
   8A9D 39            [11]  947 	add	hl,sp
   8A9E F9            [ 6]  948 	ld	sp,hl
                            949 ;src/main.c:219: u8 colisiona = 1;
   8A9F DD 36 F7 01   [19]  950 	ld	-9 (ix),#0x01
                            951 ;src/main.c:221: switch (direction) {
   8AA3 3E 03         [ 7]  952 	ld	a,#0x03
   8AA5 DD 96 04      [19]  953 	sub	a, 4 (ix)
   8AA8 DA 85 8E      [10]  954 	jp	C,00165$
                            955 ;src/main.c:223: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   8AAB DD 4E 05      [19]  956 	ld	c,5 (ix)
   8AAE DD 46 06      [19]  957 	ld	b,6 (ix)
   8AB1 0A            [ 7]  958 	ld	a,(bc)
   8AB2 5F            [ 4]  959 	ld	e,a
   8AB3 21 01 00      [10]  960 	ld	hl,#0x0001
   8AB6 09            [11]  961 	add	hl,bc
   8AB7 DD 75 F8      [19]  962 	ld	-8 (ix),l
   8ABA DD 74 F9      [19]  963 	ld	-7 (ix),h
   8ABD DD 6E F8      [19]  964 	ld	l,-8 (ix)
   8AC0 DD 66 F9      [19]  965 	ld	h,-7 (ix)
   8AC3 56            [ 7]  966 	ld	d,(hl)
                            967 ;src/main.c:236: enemy->muerto = SI;
   8AC4 21 08 00      [10]  968 	ld	hl,#0x0008
   8AC7 09            [11]  969 	add	hl,bc
   8AC8 DD 75 FA      [19]  970 	ld	-6 (ix),l
   8ACB DD 74 FB      [19]  971 	ld	-5 (ix),h
                            972 ;src/main.c:243: enemy->mira = M_izquierda;
   8ACE 21 07 00      [10]  973 	ld	hl,#0x0007
   8AD1 09            [11]  974 	add	hl,bc
   8AD2 DD 75 FC      [19]  975 	ld	-4 (ix),l
   8AD5 DD 74 FD      [19]  976 	ld	-3 (ix),h
                            977 ;src/main.c:221: switch (direction) {
   8AD8 D5            [11]  978 	push	de
   8AD9 DD 5E 04      [19]  979 	ld	e,4 (ix)
   8ADC 16 00         [ 7]  980 	ld	d,#0x00
   8ADE 21 E6 8A      [10]  981 	ld	hl,#00268$
   8AE1 19            [11]  982 	add	hl,de
   8AE2 19            [11]  983 	add	hl,de
   8AE3 19            [11]  984 	add	hl,de
   8AE4 D1            [10]  985 	pop	de
   8AE5 E9            [ 4]  986 	jp	(hl)
   8AE6                     987 00268$:
   8AE6 C3 F2 8A      [10]  988 	jp	00101$
   8AE9 C3 DA 8B      [10]  989 	jp	00117$
   8AEC C3 BE 8C      [10]  990 	jp	00133$
   8AEF C3 9C 8D      [10]  991 	jp	00149$
                            992 ;src/main.c:222: case 0:
   8AF2                     993 00101$:
                            994 ;src/main.c:223: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   8AF2 7B            [ 4]  995 	ld	a,e
   8AF3 C6 05         [ 7]  996 	add	a, #0x05
   8AF5 C5            [11]  997 	push	bc
   8AF6 D5            [11]  998 	push	de
   8AF7 33            [ 6]  999 	inc	sp
   8AF8 F5            [11] 1000 	push	af
   8AF9 33            [ 6] 1001 	inc	sp
   8AFA 2A 33 86      [16] 1002 	ld	hl,(_mapa)
   8AFD E5            [11] 1003 	push	hl
   8AFE CD E8 70      [17] 1004 	call	_getTilePtr
   8B01 F1            [10] 1005 	pop	af
   8B02 F1            [10] 1006 	pop	af
   8B03 C1            [10] 1007 	pop	bc
   8B04 5E            [ 7] 1008 	ld	e,(hl)
   8B05 3E 02         [ 7] 1009 	ld	a,#0x02
   8B07 93            [ 4] 1010 	sub	a, e
   8B08 DA CF 8B      [10] 1011 	jp	C,00113$
                           1012 ;src/main.c:224: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   8B0B DD 6E F8      [19] 1013 	ld	l,-8 (ix)
   8B0E DD 66 F9      [19] 1014 	ld	h,-7 (ix)
   8B11 7E            [ 7] 1015 	ld	a,(hl)
   8B12 C6 0B         [ 7] 1016 	add	a, #0x0B
   8B14 57            [ 4] 1017 	ld	d,a
   8B15 0A            [ 7] 1018 	ld	a,(bc)
   8B16 C6 05         [ 7] 1019 	add	a, #0x05
   8B18 C5            [11] 1020 	push	bc
   8B19 D5            [11] 1021 	push	de
   8B1A 33            [ 6] 1022 	inc	sp
   8B1B F5            [11] 1023 	push	af
   8B1C 33            [ 6] 1024 	inc	sp
   8B1D 2A 33 86      [16] 1025 	ld	hl,(_mapa)
   8B20 E5            [11] 1026 	push	hl
   8B21 CD E8 70      [17] 1027 	call	_getTilePtr
   8B24 F1            [10] 1028 	pop	af
   8B25 F1            [10] 1029 	pop	af
   8B26 C1            [10] 1030 	pop	bc
   8B27 5E            [ 7] 1031 	ld	e,(hl)
   8B28 3E 02         [ 7] 1032 	ld	a,#0x02
   8B2A 93            [ 4] 1033 	sub	a, e
   8B2B DA CF 8B      [10] 1034 	jp	C,00113$
                           1035 ;src/main.c:225: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   8B2E DD 6E F8      [19] 1036 	ld	l,-8 (ix)
   8B31 DD 66 F9      [19] 1037 	ld	h,-7 (ix)
   8B34 7E            [ 7] 1038 	ld	a,(hl)
   8B35 C6 16         [ 7] 1039 	add	a, #0x16
   8B37 57            [ 4] 1040 	ld	d,a
   8B38 0A            [ 7] 1041 	ld	a,(bc)
   8B39 C6 05         [ 7] 1042 	add	a, #0x05
   8B3B C5            [11] 1043 	push	bc
   8B3C D5            [11] 1044 	push	de
   8B3D 33            [ 6] 1045 	inc	sp
   8B3E F5            [11] 1046 	push	af
   8B3F 33            [ 6] 1047 	inc	sp
   8B40 2A 33 86      [16] 1048 	ld	hl,(_mapa)
   8B43 E5            [11] 1049 	push	hl
   8B44 CD E8 70      [17] 1050 	call	_getTilePtr
   8B47 F1            [10] 1051 	pop	af
   8B48 F1            [10] 1052 	pop	af
   8B49 C1            [10] 1053 	pop	bc
   8B4A 5E            [ 7] 1054 	ld	e,(hl)
   8B4B 3E 02         [ 7] 1055 	ld	a,#0x02
   8B4D 93            [ 4] 1056 	sub	a, e
   8B4E DA CF 8B      [10] 1057 	jp	C,00113$
                           1058 ;src/main.c:227: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   8B51 21 29 86      [10] 1059 	ld	hl, #_cu + 1
   8B54 5E            [ 7] 1060 	ld	e,(hl)
   8B55 16 00         [ 7] 1061 	ld	d,#0x00
   8B57 21 04 00      [10] 1062 	ld	hl,#0x0004
   8B5A 19            [11] 1063 	add	hl,de
   8B5B DD 75 FE      [19] 1064 	ld	-2 (ix),l
   8B5E DD 74 FF      [19] 1065 	ld	-1 (ix),h
   8B61 DD 6E F8      [19] 1066 	ld	l,-8 (ix)
   8B64 DD 66 F9      [19] 1067 	ld	h,-7 (ix)
   8B67 6E            [ 7] 1068 	ld	l,(hl)
   8B68 26 00         [ 7] 1069 	ld	h,#0x00
   8B6A DD 7E FE      [19] 1070 	ld	a,-2 (ix)
   8B6D 95            [ 4] 1071 	sub	a, l
   8B6E DD 7E FF      [19] 1072 	ld	a,-1 (ix)
   8B71 9C            [ 4] 1073 	sbc	a, h
   8B72 E2 77 8B      [10] 1074 	jp	PO, 00269$
   8B75 EE 80         [ 7] 1075 	xor	a, #0x80
   8B77                    1076 00269$:
   8B77 FA 8C 8B      [10] 1077 	jp	M,00108$
   8B7A D5            [11] 1078 	push	de
   8B7B 11 16 00      [10] 1079 	ld	de,#0x0016
   8B7E 19            [11] 1080 	add	hl, de
   8B7F D1            [10] 1081 	pop	de
   8B80 7D            [ 4] 1082 	ld	a,l
   8B81 93            [ 4] 1083 	sub	a, e
   8B82 7C            [ 4] 1084 	ld	a,h
   8B83 9A            [ 4] 1085 	sbc	a, d
   8B84 E2 89 8B      [10] 1086 	jp	PO, 00270$
   8B87 EE 80         [ 7] 1087 	xor	a, #0x80
   8B89                    1088 00270$:
   8B89 F2 93 8B      [10] 1089 	jp	P,00109$
   8B8C                    1090 00108$:
                           1091 ;src/main.c:228: colisiona = 0;
   8B8C DD 36 F7 00   [19] 1092 	ld	-9 (ix),#0x00
   8B90 C3 85 8E      [10] 1093 	jp	00165$
   8B93                    1094 00109$:
                           1095 ;src/main.c:231: if(cu.x > enemy->x){ //si el cu esta abajo
   8B93 21 28 86      [10] 1096 	ld	hl, #_cu + 0
   8B96 5E            [ 7] 1097 	ld	e,(hl)
   8B97 0A            [ 7] 1098 	ld	a,(bc)
   8B98 4F            [ 4] 1099 	ld	c,a
   8B99 93            [ 4] 1100 	sub	a, e
   8B9A 30 2C         [12] 1101 	jr	NC,00106$
                           1102 ;src/main.c:232: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
   8B9C 6B            [ 4] 1103 	ld	l,e
   8B9D 26 00         [ 7] 1104 	ld	h,#0x00
   8B9F 06 00         [ 7] 1105 	ld	b,#0x00
   8BA1 03            [ 6] 1106 	inc	bc
   8BA2 03            [ 6] 1107 	inc	bc
   8BA3 03            [ 6] 1108 	inc	bc
   8BA4 03            [ 6] 1109 	inc	bc
   8BA5 BF            [ 4] 1110 	cp	a, a
   8BA6 ED 42         [15] 1111 	sbc	hl, bc
   8BA8 3E 01         [ 7] 1112 	ld	a,#0x01
   8BAA BD            [ 4] 1113 	cp	a, l
   8BAB 3E 00         [ 7] 1114 	ld	a,#0x00
   8BAD 9C            [ 4] 1115 	sbc	a, h
   8BAE E2 B3 8B      [10] 1116 	jp	PO, 00271$
   8BB1 EE 80         [ 7] 1117 	xor	a, #0x80
   8BB3                    1118 00271$:
   8BB3 F2 BD 8B      [10] 1119 	jp	P,00103$
                           1120 ;src/main.c:233: colisiona = 0;
   8BB6 DD 36 F7 00   [19] 1121 	ld	-9 (ix),#0x00
   8BBA C3 85 8E      [10] 1122 	jp	00165$
   8BBD                    1123 00103$:
                           1124 ;src/main.c:236: enemy->muerto = SI;
   8BBD DD 6E FA      [19] 1125 	ld	l,-6 (ix)
   8BC0 DD 66 FB      [19] 1126 	ld	h,-5 (ix)
   8BC3 36 01         [10] 1127 	ld	(hl),#0x01
   8BC5 C3 85 8E      [10] 1128 	jp	00165$
   8BC8                    1129 00106$:
                           1130 ;src/main.c:239: colisiona = 0;
   8BC8 DD 36 F7 00   [19] 1131 	ld	-9 (ix),#0x00
   8BCC C3 85 8E      [10] 1132 	jp	00165$
   8BCF                    1133 00113$:
                           1134 ;src/main.c:243: enemy->mira = M_izquierda;
   8BCF DD 6E FC      [19] 1135 	ld	l,-4 (ix)
   8BD2 DD 66 FD      [19] 1136 	ld	h,-3 (ix)
   8BD5 36 01         [10] 1137 	ld	(hl),#0x01
                           1138 ;src/main.c:245: break;
   8BD7 C3 85 8E      [10] 1139 	jp	00165$
                           1140 ;src/main.c:246: case 1:
   8BDA                    1141 00117$:
                           1142 ;src/main.c:247: if( *getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   8BDA 1D            [ 4] 1143 	dec	e
   8BDB C5            [11] 1144 	push	bc
   8BDC D5            [11] 1145 	push	de
   8BDD 2A 33 86      [16] 1146 	ld	hl,(_mapa)
   8BE0 E5            [11] 1147 	push	hl
   8BE1 CD E8 70      [17] 1148 	call	_getTilePtr
   8BE4 F1            [10] 1149 	pop	af
   8BE5 F1            [10] 1150 	pop	af
   8BE6 C1            [10] 1151 	pop	bc
   8BE7 5E            [ 7] 1152 	ld	e,(hl)
   8BE8 3E 02         [ 7] 1153 	ld	a,#0x02
   8BEA 93            [ 4] 1154 	sub	a, e
   8BEB DA B3 8C      [10] 1155 	jp	C,00129$
                           1156 ;src/main.c:248: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   8BEE DD 6E F8      [19] 1157 	ld	l,-8 (ix)
   8BF1 DD 66 F9      [19] 1158 	ld	h,-7 (ix)
   8BF4 7E            [ 7] 1159 	ld	a,(hl)
   8BF5 C6 0B         [ 7] 1160 	add	a, #0x0B
   8BF7 57            [ 4] 1161 	ld	d,a
   8BF8 0A            [ 7] 1162 	ld	a,(bc)
   8BF9 C6 FF         [ 7] 1163 	add	a,#0xFF
   8BFB C5            [11] 1164 	push	bc
   8BFC D5            [11] 1165 	push	de
   8BFD 33            [ 6] 1166 	inc	sp
   8BFE F5            [11] 1167 	push	af
   8BFF 33            [ 6] 1168 	inc	sp
   8C00 2A 33 86      [16] 1169 	ld	hl,(_mapa)
   8C03 E5            [11] 1170 	push	hl
   8C04 CD E8 70      [17] 1171 	call	_getTilePtr
   8C07 F1            [10] 1172 	pop	af
   8C08 F1            [10] 1173 	pop	af
   8C09 C1            [10] 1174 	pop	bc
   8C0A 5E            [ 7] 1175 	ld	e,(hl)
   8C0B 3E 02         [ 7] 1176 	ld	a,#0x02
   8C0D 93            [ 4] 1177 	sub	a, e
   8C0E DA B3 8C      [10] 1178 	jp	C,00129$
                           1179 ;src/main.c:249: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   8C11 DD 6E F8      [19] 1180 	ld	l,-8 (ix)
   8C14 DD 66 F9      [19] 1181 	ld	h,-7 (ix)
   8C17 7E            [ 7] 1182 	ld	a,(hl)
   8C18 C6 16         [ 7] 1183 	add	a, #0x16
   8C1A 57            [ 4] 1184 	ld	d,a
   8C1B 0A            [ 7] 1185 	ld	a,(bc)
   8C1C C6 FF         [ 7] 1186 	add	a,#0xFF
   8C1E C5            [11] 1187 	push	bc
   8C1F D5            [11] 1188 	push	de
   8C20 33            [ 6] 1189 	inc	sp
   8C21 F5            [11] 1190 	push	af
   8C22 33            [ 6] 1191 	inc	sp
   8C23 2A 33 86      [16] 1192 	ld	hl,(_mapa)
   8C26 E5            [11] 1193 	push	hl
   8C27 CD E8 70      [17] 1194 	call	_getTilePtr
   8C2A F1            [10] 1195 	pop	af
   8C2B F1            [10] 1196 	pop	af
   8C2C C1            [10] 1197 	pop	bc
   8C2D 5E            [ 7] 1198 	ld	e,(hl)
   8C2E 3E 02         [ 7] 1199 	ld	a,#0x02
   8C30 93            [ 4] 1200 	sub	a, e
   8C31 DA B3 8C      [10] 1201 	jp	C,00129$
                           1202 ;src/main.c:251: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   8C34 21 29 86      [10] 1203 	ld	hl, #_cu + 1
   8C37 5E            [ 7] 1204 	ld	e,(hl)
   8C38 16 00         [ 7] 1205 	ld	d,#0x00
   8C3A 21 04 00      [10] 1206 	ld	hl,#0x0004
   8C3D 19            [11] 1207 	add	hl,de
   8C3E DD 75 FE      [19] 1208 	ld	-2 (ix),l
   8C41 DD 74 FF      [19] 1209 	ld	-1 (ix),h
   8C44 DD 6E F8      [19] 1210 	ld	l,-8 (ix)
   8C47 DD 66 F9      [19] 1211 	ld	h,-7 (ix)
   8C4A 6E            [ 7] 1212 	ld	l,(hl)
   8C4B 26 00         [ 7] 1213 	ld	h,#0x00
   8C4D DD 7E FE      [19] 1214 	ld	a,-2 (ix)
   8C50 95            [ 4] 1215 	sub	a, l
   8C51 DD 7E FF      [19] 1216 	ld	a,-1 (ix)
   8C54 9C            [ 4] 1217 	sbc	a, h
   8C55 E2 5A 8C      [10] 1218 	jp	PO, 00272$
   8C58 EE 80         [ 7] 1219 	xor	a, #0x80
   8C5A                    1220 00272$:
   8C5A FA 6F 8C      [10] 1221 	jp	M,00124$
   8C5D D5            [11] 1222 	push	de
   8C5E 11 16 00      [10] 1223 	ld	de,#0x0016
   8C61 19            [11] 1224 	add	hl, de
   8C62 D1            [10] 1225 	pop	de
   8C63 7D            [ 4] 1226 	ld	a,l
   8C64 93            [ 4] 1227 	sub	a, e
   8C65 7C            [ 4] 1228 	ld	a,h
   8C66 9A            [ 4] 1229 	sbc	a, d
   8C67 E2 6C 8C      [10] 1230 	jp	PO, 00273$
   8C6A EE 80         [ 7] 1231 	xor	a, #0x80
   8C6C                    1232 00273$:
   8C6C F2 76 8C      [10] 1233 	jp	P,00125$
   8C6F                    1234 00124$:
                           1235 ;src/main.c:252: colisiona = 0;
   8C6F DD 36 F7 00   [19] 1236 	ld	-9 (ix),#0x00
   8C73 C3 85 8E      [10] 1237 	jp	00165$
   8C76                    1238 00125$:
                           1239 ;src/main.c:255: if(enemy->x > cu.x){ //si el cu esta abajo
   8C76 0A            [ 7] 1240 	ld	a,(bc)
   8C77 5F            [ 4] 1241 	ld	e,a
   8C78 21 28 86      [10] 1242 	ld	hl, #_cu + 0
   8C7B 4E            [ 7] 1243 	ld	c,(hl)
   8C7C 79            [ 4] 1244 	ld	a,c
   8C7D 93            [ 4] 1245 	sub	a, e
   8C7E 30 2C         [12] 1246 	jr	NC,00122$
                           1247 ;src/main.c:256: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
   8C80 6B            [ 4] 1248 	ld	l,e
   8C81 26 00         [ 7] 1249 	ld	h,#0x00
   8C83 06 00         [ 7] 1250 	ld	b,#0x00
   8C85 03            [ 6] 1251 	inc	bc
   8C86 03            [ 6] 1252 	inc	bc
   8C87 03            [ 6] 1253 	inc	bc
   8C88 03            [ 6] 1254 	inc	bc
   8C89 BF            [ 4] 1255 	cp	a, a
   8C8A ED 42         [15] 1256 	sbc	hl, bc
   8C8C 3E 01         [ 7] 1257 	ld	a,#0x01
   8C8E BD            [ 4] 1258 	cp	a, l
   8C8F 3E 00         [ 7] 1259 	ld	a,#0x00
   8C91 9C            [ 4] 1260 	sbc	a, h
   8C92 E2 97 8C      [10] 1261 	jp	PO, 00274$
   8C95 EE 80         [ 7] 1262 	xor	a, #0x80
   8C97                    1263 00274$:
   8C97 F2 A1 8C      [10] 1264 	jp	P,00119$
                           1265 ;src/main.c:257: colisiona = 0;
   8C9A DD 36 F7 00   [19] 1266 	ld	-9 (ix),#0x00
   8C9E C3 85 8E      [10] 1267 	jp	00165$
   8CA1                    1268 00119$:
                           1269 ;src/main.c:260: enemy->muerto = SI;
   8CA1 DD 6E FA      [19] 1270 	ld	l,-6 (ix)
   8CA4 DD 66 FB      [19] 1271 	ld	h,-5 (ix)
   8CA7 36 01         [10] 1272 	ld	(hl),#0x01
   8CA9 C3 85 8E      [10] 1273 	jp	00165$
   8CAC                    1274 00122$:
                           1275 ;src/main.c:263: colisiona = 0;
   8CAC DD 36 F7 00   [19] 1276 	ld	-9 (ix),#0x00
   8CB0 C3 85 8E      [10] 1277 	jp	00165$
   8CB3                    1278 00129$:
                           1279 ;src/main.c:267: enemy->mira = M_derecha;
   8CB3 DD 6E FC      [19] 1280 	ld	l,-4 (ix)
   8CB6 DD 66 FD      [19] 1281 	ld	h,-3 (ix)
   8CB9 36 00         [10] 1282 	ld	(hl),#0x00
                           1283 ;src/main.c:269: break;
   8CBB C3 85 8E      [10] 1284 	jp	00165$
                           1285 ;src/main.c:270: case 2:
   8CBE                    1286 00133$:
                           1287 ;src/main.c:271: if( *getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   8CBE 15            [ 4] 1288 	dec	d
   8CBF 15            [ 4] 1289 	dec	d
   8CC0 C5            [11] 1290 	push	bc
   8CC1 D5            [11] 1291 	push	de
   8CC2 2A 33 86      [16] 1292 	ld	hl,(_mapa)
   8CC5 E5            [11] 1293 	push	hl
   8CC6 CD E8 70      [17] 1294 	call	_getTilePtr
   8CC9 F1            [10] 1295 	pop	af
   8CCA F1            [10] 1296 	pop	af
   8CCB C1            [10] 1297 	pop	bc
   8CCC 5E            [ 7] 1298 	ld	e,(hl)
   8CCD 3E 02         [ 7] 1299 	ld	a,#0x02
   8CCF 93            [ 4] 1300 	sub	a, e
   8CD0 DA 94 8D      [10] 1301 	jp	C,00145$
                           1302 ;src/main.c:272: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   8CD3 DD 6E F8      [19] 1303 	ld	l,-8 (ix)
   8CD6 DD 66 F9      [19] 1304 	ld	h,-7 (ix)
   8CD9 56            [ 7] 1305 	ld	d,(hl)
   8CDA 15            [ 4] 1306 	dec	d
   8CDB 15            [ 4] 1307 	dec	d
   8CDC 0A            [ 7] 1308 	ld	a,(bc)
   8CDD C6 02         [ 7] 1309 	add	a, #0x02
   8CDF C5            [11] 1310 	push	bc
   8CE0 D5            [11] 1311 	push	de
   8CE1 33            [ 6] 1312 	inc	sp
   8CE2 F5            [11] 1313 	push	af
   8CE3 33            [ 6] 1314 	inc	sp
   8CE4 2A 33 86      [16] 1315 	ld	hl,(_mapa)
   8CE7 E5            [11] 1316 	push	hl
   8CE8 CD E8 70      [17] 1317 	call	_getTilePtr
   8CEB F1            [10] 1318 	pop	af
   8CEC F1            [10] 1319 	pop	af
   8CED C1            [10] 1320 	pop	bc
   8CEE 5E            [ 7] 1321 	ld	e,(hl)
   8CEF 3E 02         [ 7] 1322 	ld	a,#0x02
   8CF1 93            [ 4] 1323 	sub	a, e
   8CF2 DA 94 8D      [10] 1324 	jp	C,00145$
                           1325 ;src/main.c:273: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   8CF5 DD 6E F8      [19] 1326 	ld	l,-8 (ix)
   8CF8 DD 66 F9      [19] 1327 	ld	h,-7 (ix)
   8CFB 56            [ 7] 1328 	ld	d,(hl)
   8CFC 15            [ 4] 1329 	dec	d
   8CFD 15            [ 4] 1330 	dec	d
   8CFE 0A            [ 7] 1331 	ld	a,(bc)
   8CFF C6 04         [ 7] 1332 	add	a, #0x04
   8D01 C5            [11] 1333 	push	bc
   8D02 D5            [11] 1334 	push	de
   8D03 33            [ 6] 1335 	inc	sp
   8D04 F5            [11] 1336 	push	af
   8D05 33            [ 6] 1337 	inc	sp
   8D06 2A 33 86      [16] 1338 	ld	hl,(_mapa)
   8D09 E5            [11] 1339 	push	hl
   8D0A CD E8 70      [17] 1340 	call	_getTilePtr
   8D0D F1            [10] 1341 	pop	af
   8D0E F1            [10] 1342 	pop	af
   8D0F C1            [10] 1343 	pop	bc
   8D10 5E            [ 7] 1344 	ld	e,(hl)
   8D11 3E 02         [ 7] 1345 	ld	a,#0x02
   8D13 93            [ 4] 1346 	sub	a, e
   8D14 DA 94 8D      [10] 1347 	jp	C,00145$
                           1348 ;src/main.c:275: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   8D17 21 28 86      [10] 1349 	ld	hl, #_cu + 0
   8D1A 5E            [ 7] 1350 	ld	e,(hl)
   8D1B 16 00         [ 7] 1351 	ld	d,#0x00
   8D1D 21 02 00      [10] 1352 	ld	hl,#0x0002
   8D20 19            [11] 1353 	add	hl,de
   8D21 DD 75 FE      [19] 1354 	ld	-2 (ix),l
   8D24 DD 74 FF      [19] 1355 	ld	-1 (ix),h
   8D27 0A            [ 7] 1356 	ld	a,(bc)
   8D28 6F            [ 4] 1357 	ld	l,a
   8D29 26 00         [ 7] 1358 	ld	h,#0x00
   8D2B DD 7E FE      [19] 1359 	ld	a,-2 (ix)
   8D2E 95            [ 4] 1360 	sub	a, l
   8D2F DD 7E FF      [19] 1361 	ld	a,-1 (ix)
   8D32 9C            [ 4] 1362 	sbc	a, h
   8D33 E2 38 8D      [10] 1363 	jp	PO, 00275$
   8D36 EE 80         [ 7] 1364 	xor	a, #0x80
   8D38                    1365 00275$:
   8D38 FA 4B 8D      [10] 1366 	jp	M,00140$
   8D3B 23            [ 6] 1367 	inc	hl
   8D3C 23            [ 6] 1368 	inc	hl
   8D3D 23            [ 6] 1369 	inc	hl
   8D3E 23            [ 6] 1370 	inc	hl
   8D3F 7D            [ 4] 1371 	ld	a,l
   8D40 93            [ 4] 1372 	sub	a, e
   8D41 7C            [ 4] 1373 	ld	a,h
   8D42 9A            [ 4] 1374 	sbc	a, d
   8D43 E2 48 8D      [10] 1375 	jp	PO, 00276$
   8D46 EE 80         [ 7] 1376 	xor	a, #0x80
   8D48                    1377 00276$:
   8D48 F2 51 8D      [10] 1378 	jp	P,00141$
   8D4B                    1379 00140$:
                           1380 ;src/main.c:277: colisiona = 0;
   8D4B DD 36 F7 00   [19] 1381 	ld	-9 (ix),#0x00
   8D4F 18 4B         [12] 1382 	jr	00149$
   8D51                    1383 00141$:
                           1384 ;src/main.c:280: if(enemy->y>cu.y){
   8D51 DD 6E F8      [19] 1385 	ld	l,-8 (ix)
   8D54 DD 66 F9      [19] 1386 	ld	h,-7 (ix)
   8D57 5E            [ 7] 1387 	ld	e,(hl)
   8D58 21 29 86      [10] 1388 	ld	hl, #(_cu + 0x0001) + 0
   8D5B 6E            [ 7] 1389 	ld	l,(hl)
   8D5C 7D            [ 4] 1390 	ld	a,l
   8D5D 93            [ 4] 1391 	sub	a, e
   8D5E 30 2E         [12] 1392 	jr	NC,00138$
                           1393 ;src/main.c:281: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   8D60 16 00         [ 7] 1394 	ld	d,#0x00
   8D62 26 00         [ 7] 1395 	ld	h,#0x00
   8D64 D5            [11] 1396 	push	de
   8D65 11 08 00      [10] 1397 	ld	de,#0x0008
   8D68 19            [11] 1398 	add	hl, de
   8D69 D1            [10] 1399 	pop	de
   8D6A 7B            [ 4] 1400 	ld	a,e
   8D6B 95            [ 4] 1401 	sub	a, l
   8D6C 5F            [ 4] 1402 	ld	e,a
   8D6D 7A            [ 4] 1403 	ld	a,d
   8D6E 9C            [ 4] 1404 	sbc	a, h
   8D6F 57            [ 4] 1405 	ld	d,a
   8D70 3E 02         [ 7] 1406 	ld	a,#0x02
   8D72 BB            [ 4] 1407 	cp	a, e
   8D73 3E 00         [ 7] 1408 	ld	a,#0x00
   8D75 9A            [ 4] 1409 	sbc	a, d
   8D76 E2 7B 8D      [10] 1410 	jp	PO, 00277$
   8D79 EE 80         [ 7] 1411 	xor	a, #0x80
   8D7B                    1412 00277$:
   8D7B F2 84 8D      [10] 1413 	jp	P,00135$
                           1414 ;src/main.c:282: colisiona = 0;
   8D7E DD 36 F7 00   [19] 1415 	ld	-9 (ix),#0x00
   8D82 18 18         [12] 1416 	jr	00149$
   8D84                    1417 00135$:
                           1418 ;src/main.c:285: enemy->muerto = SI;
   8D84 DD 6E FA      [19] 1419 	ld	l,-6 (ix)
   8D87 DD 66 FB      [19] 1420 	ld	h,-5 (ix)
   8D8A 36 01         [10] 1421 	ld	(hl),#0x01
   8D8C 18 0E         [12] 1422 	jr	00149$
   8D8E                    1423 00138$:
                           1424 ;src/main.c:289: colisiona = 0;
   8D8E DD 36 F7 00   [19] 1425 	ld	-9 (ix),#0x00
   8D92 18 08         [12] 1426 	jr	00149$
   8D94                    1427 00145$:
                           1428 ;src/main.c:295: enemy->mira = M_abajo;
   8D94 DD 6E FC      [19] 1429 	ld	l,-4 (ix)
   8D97 DD 66 FD      [19] 1430 	ld	h,-3 (ix)
   8D9A 36 03         [10] 1431 	ld	(hl),#0x03
                           1432 ;src/main.c:298: case 3:
   8D9C                    1433 00149$:
                           1434 ;src/main.c:301: if( *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   8D9C DD 6E F8      [19] 1435 	ld	l,-8 (ix)
   8D9F DD 66 F9      [19] 1436 	ld	h,-7 (ix)
   8DA2 7E            [ 7] 1437 	ld	a,(hl)
   8DA3 C6 18         [ 7] 1438 	add	a, #0x18
   8DA5 57            [ 4] 1439 	ld	d,a
   8DA6 0A            [ 7] 1440 	ld	a,(bc)
   8DA7 C5            [11] 1441 	push	bc
   8DA8 D5            [11] 1442 	push	de
   8DA9 33            [ 6] 1443 	inc	sp
   8DAA F5            [11] 1444 	push	af
   8DAB 33            [ 6] 1445 	inc	sp
   8DAC 2A 33 86      [16] 1446 	ld	hl,(_mapa)
   8DAF E5            [11] 1447 	push	hl
   8DB0 CD E8 70      [17] 1448 	call	_getTilePtr
   8DB3 F1            [10] 1449 	pop	af
   8DB4 F1            [10] 1450 	pop	af
   8DB5 C1            [10] 1451 	pop	bc
   8DB6 5E            [ 7] 1452 	ld	e,(hl)
   8DB7 3E 02         [ 7] 1453 	ld	a,#0x02
   8DB9 93            [ 4] 1454 	sub	a, e
   8DBA DA 7D 8E      [10] 1455 	jp	C,00161$
                           1456 ;src/main.c:302: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   8DBD DD 6E F8      [19] 1457 	ld	l,-8 (ix)
   8DC0 DD 66 F9      [19] 1458 	ld	h,-7 (ix)
   8DC3 7E            [ 7] 1459 	ld	a,(hl)
   8DC4 C6 18         [ 7] 1460 	add	a, #0x18
   8DC6 57            [ 4] 1461 	ld	d,a
   8DC7 0A            [ 7] 1462 	ld	a,(bc)
   8DC8 C6 02         [ 7] 1463 	add	a, #0x02
   8DCA C5            [11] 1464 	push	bc
   8DCB D5            [11] 1465 	push	de
   8DCC 33            [ 6] 1466 	inc	sp
   8DCD F5            [11] 1467 	push	af
   8DCE 33            [ 6] 1468 	inc	sp
   8DCF 2A 33 86      [16] 1469 	ld	hl,(_mapa)
   8DD2 E5            [11] 1470 	push	hl
   8DD3 CD E8 70      [17] 1471 	call	_getTilePtr
   8DD6 F1            [10] 1472 	pop	af
   8DD7 F1            [10] 1473 	pop	af
   8DD8 C1            [10] 1474 	pop	bc
   8DD9 5E            [ 7] 1475 	ld	e,(hl)
   8DDA 3E 02         [ 7] 1476 	ld	a,#0x02
   8DDC 93            [ 4] 1477 	sub	a, e
   8DDD DA 7D 8E      [10] 1478 	jp	C,00161$
                           1479 ;src/main.c:303: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   8DE0 DD 6E F8      [19] 1480 	ld	l,-8 (ix)
   8DE3 DD 66 F9      [19] 1481 	ld	h,-7 (ix)
   8DE6 7E            [ 7] 1482 	ld	a,(hl)
   8DE7 C6 18         [ 7] 1483 	add	a, #0x18
   8DE9 57            [ 4] 1484 	ld	d,a
   8DEA 0A            [ 7] 1485 	ld	a,(bc)
   8DEB C6 04         [ 7] 1486 	add	a, #0x04
   8DED C5            [11] 1487 	push	bc
   8DEE D5            [11] 1488 	push	de
   8DEF 33            [ 6] 1489 	inc	sp
   8DF0 F5            [11] 1490 	push	af
   8DF1 33            [ 6] 1491 	inc	sp
   8DF2 2A 33 86      [16] 1492 	ld	hl,(_mapa)
   8DF5 E5            [11] 1493 	push	hl
   8DF6 CD E8 70      [17] 1494 	call	_getTilePtr
   8DF9 F1            [10] 1495 	pop	af
   8DFA F1            [10] 1496 	pop	af
   8DFB C1            [10] 1497 	pop	bc
   8DFC 5E            [ 7] 1498 	ld	e,(hl)
   8DFD 3E 02         [ 7] 1499 	ld	a,#0x02
   8DFF 93            [ 4] 1500 	sub	a, e
   8E00 38 7B         [12] 1501 	jr	C,00161$
                           1502 ;src/main.c:305: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   8E02 21 28 86      [10] 1503 	ld	hl, #_cu + 0
   8E05 5E            [ 7] 1504 	ld	e,(hl)
   8E06 16 00         [ 7] 1505 	ld	d,#0x00
   8E08 21 02 00      [10] 1506 	ld	hl,#0x0002
   8E0B 19            [11] 1507 	add	hl,de
   8E0C DD 75 FE      [19] 1508 	ld	-2 (ix),l
   8E0F DD 74 FF      [19] 1509 	ld	-1 (ix),h
   8E12 0A            [ 7] 1510 	ld	a,(bc)
   8E13 4F            [ 4] 1511 	ld	c,a
   8E14 06 00         [ 7] 1512 	ld	b,#0x00
   8E16 DD 7E FE      [19] 1513 	ld	a,-2 (ix)
   8E19 91            [ 4] 1514 	sub	a, c
   8E1A DD 7E FF      [19] 1515 	ld	a,-1 (ix)
   8E1D 98            [ 4] 1516 	sbc	a, b
   8E1E E2 23 8E      [10] 1517 	jp	PO, 00278$
   8E21 EE 80         [ 7] 1518 	xor	a, #0x80
   8E23                    1519 00278$:
   8E23 FA 36 8E      [10] 1520 	jp	M,00156$
   8E26 03            [ 6] 1521 	inc	bc
   8E27 03            [ 6] 1522 	inc	bc
   8E28 03            [ 6] 1523 	inc	bc
   8E29 03            [ 6] 1524 	inc	bc
   8E2A 79            [ 4] 1525 	ld	a,c
   8E2B 93            [ 4] 1526 	sub	a, e
   8E2C 78            [ 4] 1527 	ld	a,b
   8E2D 9A            [ 4] 1528 	sbc	a, d
   8E2E E2 33 8E      [10] 1529 	jp	PO, 00279$
   8E31 EE 80         [ 7] 1530 	xor	a, #0x80
   8E33                    1531 00279$:
   8E33 F2 3C 8E      [10] 1532 	jp	P,00157$
   8E36                    1533 00156$:
                           1534 ;src/main.c:306: colisiona = 0;
   8E36 DD 36 F7 00   [19] 1535 	ld	-9 (ix),#0x00
   8E3A 18 49         [12] 1536 	jr	00165$
   8E3C                    1537 00157$:
                           1538 ;src/main.c:309: if(cu.y > enemy->y){ //si el cu esta abajo
   8E3C 21 29 86      [10] 1539 	ld	hl, #(_cu + 0x0001) + 0
   8E3F 4E            [ 7] 1540 	ld	c,(hl)
   8E40 DD 6E F8      [19] 1541 	ld	l,-8 (ix)
   8E43 DD 66 F9      [19] 1542 	ld	h,-7 (ix)
   8E46 5E            [ 7] 1543 	ld	e,(hl)
   8E47 7B            [ 4] 1544 	ld	a,e
   8E48 91            [ 4] 1545 	sub	a, c
   8E49 30 2C         [12] 1546 	jr	NC,00154$
                           1547 ;src/main.c:310: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   8E4B 06 00         [ 7] 1548 	ld	b,#0x00
   8E4D 16 00         [ 7] 1549 	ld	d,#0x00
   8E4F 21 16 00      [10] 1550 	ld	hl,#0x0016
   8E52 19            [11] 1551 	add	hl,de
   8E53 79            [ 4] 1552 	ld	a,c
   8E54 95            [ 4] 1553 	sub	a, l
   8E55 4F            [ 4] 1554 	ld	c,a
   8E56 78            [ 4] 1555 	ld	a,b
   8E57 9C            [ 4] 1556 	sbc	a, h
   8E58 47            [ 4] 1557 	ld	b,a
   8E59 3E 02         [ 7] 1558 	ld	a,#0x02
   8E5B B9            [ 4] 1559 	cp	a, c
   8E5C 3E 00         [ 7] 1560 	ld	a,#0x00
   8E5E 98            [ 4] 1561 	sbc	a, b
   8E5F E2 64 8E      [10] 1562 	jp	PO, 00280$
   8E62 EE 80         [ 7] 1563 	xor	a, #0x80
   8E64                    1564 00280$:
   8E64 F2 6D 8E      [10] 1565 	jp	P,00151$
                           1566 ;src/main.c:311: colisiona = 0;
   8E67 DD 36 F7 00   [19] 1567 	ld	-9 (ix),#0x00
   8E6B 18 18         [12] 1568 	jr	00165$
   8E6D                    1569 00151$:
                           1570 ;src/main.c:314: enemy->muerto = SI;
   8E6D DD 6E FA      [19] 1571 	ld	l,-6 (ix)
   8E70 DD 66 FB      [19] 1572 	ld	h,-5 (ix)
   8E73 36 01         [10] 1573 	ld	(hl),#0x01
   8E75 18 0E         [12] 1574 	jr	00165$
   8E77                    1575 00154$:
                           1576 ;src/main.c:318: colisiona = 0;
   8E77 DD 36 F7 00   [19] 1577 	ld	-9 (ix),#0x00
   8E7B 18 08         [12] 1578 	jr	00165$
   8E7D                    1579 00161$:
                           1580 ;src/main.c:322: enemy->mira = M_arriba;
   8E7D DD 6E FC      [19] 1581 	ld	l,-4 (ix)
   8E80 DD 66 FD      [19] 1582 	ld	h,-3 (ix)
   8E83 36 02         [10] 1583 	ld	(hl),#0x02
                           1584 ;src/main.c:325: }
   8E85                    1585 00165$:
                           1586 ;src/main.c:326: return colisiona;
   8E85 DD 6E F7      [19] 1587 	ld	l,-9 (ix)
   8E88 DD F9         [10] 1588 	ld	sp, ix
   8E8A DD E1         [14] 1589 	pop	ix
   8E8C C9            [10] 1590 	ret
                           1591 ;src/main.c:329: void moverEnemigoArriba(TEnemy *enemy){
                           1592 ;	---------------------------------
                           1593 ; Function moverEnemigoArriba
                           1594 ; ---------------------------------
   8E8D                    1595 _moverEnemigoArriba::
   8E8D DD E5         [15] 1596 	push	ix
   8E8F DD 21 00 00   [14] 1597 	ld	ix,#0
   8E93 DD 39         [15] 1598 	add	ix,sp
                           1599 ;src/main.c:330: enemy->y--;
   8E95 DD 4E 04      [19] 1600 	ld	c,4 (ix)
   8E98 DD 46 05      [19] 1601 	ld	b,5 (ix)
   8E9B 69            [ 4] 1602 	ld	l, c
   8E9C 60            [ 4] 1603 	ld	h, b
   8E9D 23            [ 6] 1604 	inc	hl
   8E9E 5E            [ 7] 1605 	ld	e,(hl)
   8E9F 1D            [ 4] 1606 	dec	e
   8EA0 73            [ 7] 1607 	ld	(hl),e
                           1608 ;src/main.c:331: enemy->y--;
   8EA1 1D            [ 4] 1609 	dec	e
   8EA2 73            [ 7] 1610 	ld	(hl),e
                           1611 ;src/main.c:332: enemy->mover = SI;
   8EA3 21 06 00      [10] 1612 	ld	hl,#0x0006
   8EA6 09            [11] 1613 	add	hl,bc
   8EA7 36 01         [10] 1614 	ld	(hl),#0x01
   8EA9 DD E1         [14] 1615 	pop	ix
   8EAB C9            [10] 1616 	ret
                           1617 ;src/main.c:335: void moverEnemigoAbajo(TEnemy *enemy){
                           1618 ;	---------------------------------
                           1619 ; Function moverEnemigoAbajo
                           1620 ; ---------------------------------
   8EAC                    1621 _moverEnemigoAbajo::
   8EAC DD E5         [15] 1622 	push	ix
   8EAE DD 21 00 00   [14] 1623 	ld	ix,#0
   8EB2 DD 39         [15] 1624 	add	ix,sp
                           1625 ;src/main.c:336: enemy->y++;
   8EB4 DD 4E 04      [19] 1626 	ld	c,4 (ix)
   8EB7 DD 46 05      [19] 1627 	ld	b,5 (ix)
   8EBA 59            [ 4] 1628 	ld	e, c
   8EBB 50            [ 4] 1629 	ld	d, b
   8EBC 13            [ 6] 1630 	inc	de
   8EBD 1A            [ 7] 1631 	ld	a,(de)
   8EBE 3C            [ 4] 1632 	inc	a
   8EBF 12            [ 7] 1633 	ld	(de),a
                           1634 ;src/main.c:337: enemy->y++;
   8EC0 3C            [ 4] 1635 	inc	a
   8EC1 12            [ 7] 1636 	ld	(de),a
                           1637 ;src/main.c:338: enemy->mover = SI;
   8EC2 21 06 00      [10] 1638 	ld	hl,#0x0006
   8EC5 09            [11] 1639 	add	hl,bc
   8EC6 36 01         [10] 1640 	ld	(hl),#0x01
   8EC8 DD E1         [14] 1641 	pop	ix
   8ECA C9            [10] 1642 	ret
                           1643 ;src/main.c:341: void moverEnemigoDerecha(TEnemy *enemy){
                           1644 ;	---------------------------------
                           1645 ; Function moverEnemigoDerecha
                           1646 ; ---------------------------------
   8ECB                    1647 _moverEnemigoDerecha::
                           1648 ;src/main.c:342: enemy->x++;
   8ECB D1            [10] 1649 	pop	de
   8ECC C1            [10] 1650 	pop	bc
   8ECD C5            [11] 1651 	push	bc
   8ECE D5            [11] 1652 	push	de
   8ECF 0A            [ 7] 1653 	ld	a,(bc)
   8ED0 3C            [ 4] 1654 	inc	a
   8ED1 02            [ 7] 1655 	ld	(bc),a
                           1656 ;src/main.c:343: enemy->x++;
   8ED2 3C            [ 4] 1657 	inc	a
   8ED3 02            [ 7] 1658 	ld	(bc),a
                           1659 ;src/main.c:344: enemy->mover = SI;
   8ED4 21 06 00      [10] 1660 	ld	hl,#0x0006
   8ED7 09            [11] 1661 	add	hl,bc
   8ED8 36 01         [10] 1662 	ld	(hl),#0x01
   8EDA C9            [10] 1663 	ret
                           1664 ;src/main.c:347: void moverEnemigoIzquierda(TEnemy *enemy){
                           1665 ;	---------------------------------
                           1666 ; Function moverEnemigoIzquierda
                           1667 ; ---------------------------------
   8EDB                    1668 _moverEnemigoIzquierda::
                           1669 ;src/main.c:348: enemy->x--;
   8EDB D1            [10] 1670 	pop	de
   8EDC C1            [10] 1671 	pop	bc
   8EDD C5            [11] 1672 	push	bc
   8EDE D5            [11] 1673 	push	de
   8EDF 0A            [ 7] 1674 	ld	a,(bc)
   8EE0 C6 FF         [ 7] 1675 	add	a,#0xFF
   8EE2 02            [ 7] 1676 	ld	(bc),a
                           1677 ;src/main.c:349: enemy->x--;
   8EE3 C6 FF         [ 7] 1678 	add	a,#0xFF
   8EE5 02            [ 7] 1679 	ld	(bc),a
                           1680 ;src/main.c:350: enemy->mover = SI;
   8EE6 21 06 00      [10] 1681 	ld	hl,#0x0006
   8EE9 09            [11] 1682 	add	hl,bc
   8EEA 36 01         [10] 1683 	ld	(hl),#0x01
   8EEC C9            [10] 1684 	ret
                           1685 ;src/main.c:353: void moverEnemigo(TEnemy *enemy){
                           1686 ;	---------------------------------
                           1687 ; Function moverEnemigo
                           1688 ; ---------------------------------
   8EED                    1689 _moverEnemigo::
                           1690 ;src/main.c:354: if(!enemy->muerto){
   8EED D1            [10] 1691 	pop	de
   8EEE C1            [10] 1692 	pop	bc
   8EEF C5            [11] 1693 	push	bc
   8EF0 D5            [11] 1694 	push	de
   8EF1 C5            [11] 1695 	push	bc
   8EF2 FD E1         [14] 1696 	pop	iy
   8EF4 FD 7E 08      [19] 1697 	ld	a,8 (iy)
   8EF7 B7            [ 4] 1698 	or	a, a
   8EF8 C0            [11] 1699 	ret	NZ
                           1700 ;src/main.c:355: if(!checkEnemyCollision(enemy->mira, enemy)){
   8EF9 21 07 00      [10] 1701 	ld	hl,#0x0007
   8EFC 09            [11] 1702 	add	hl,bc
   8EFD 56            [ 7] 1703 	ld	d,(hl)
   8EFE E5            [11] 1704 	push	hl
   8EFF C5            [11] 1705 	push	bc
   8F00 C5            [11] 1706 	push	bc
   8F01 D5            [11] 1707 	push	de
   8F02 33            [ 6] 1708 	inc	sp
   8F03 CD 92 8A      [17] 1709 	call	_checkEnemyCollision
   8F06 F1            [10] 1710 	pop	af
   8F07 33            [ 6] 1711 	inc	sp
   8F08 7D            [ 4] 1712 	ld	a,l
   8F09 C1            [10] 1713 	pop	bc
   8F0A E1            [10] 1714 	pop	hl
   8F0B B7            [ 4] 1715 	or	a, a
   8F0C C0            [11] 1716 	ret	NZ
                           1717 ;src/main.c:357: switch (enemy->mira) {
   8F0D 5E            [ 7] 1718 	ld	e,(hl)
   8F0E 3E 03         [ 7] 1719 	ld	a,#0x03
   8F10 93            [ 4] 1720 	sub	a, e
   8F11 D8            [11] 1721 	ret	C
   8F12 16 00         [ 7] 1722 	ld	d,#0x00
   8F14 21 1A 8F      [10] 1723 	ld	hl,#00124$
   8F17 19            [11] 1724 	add	hl,de
   8F18 19            [11] 1725 	add	hl,de
                           1726 ;src/main.c:359: case 0:
   8F19 E9            [ 4] 1727 	jp	(hl)
   8F1A                    1728 00124$:
   8F1A 18 06         [12] 1729 	jr	00101$
   8F1C 18 0A         [12] 1730 	jr	00102$
   8F1E 18 0E         [12] 1731 	jr	00103$
   8F20 18 12         [12] 1732 	jr	00104$
   8F22                    1733 00101$:
                           1734 ;src/main.c:360: moverEnemigoDerecha(enemy);
   8F22 C5            [11] 1735 	push	bc
   8F23 CD CB 8E      [17] 1736 	call	_moverEnemigoDerecha
   8F26 F1            [10] 1737 	pop	af
                           1738 ;src/main.c:361: break;
   8F27 C9            [10] 1739 	ret
                           1740 ;src/main.c:362: case 1:
   8F28                    1741 00102$:
                           1742 ;src/main.c:363: moverEnemigoIzquierda(enemy);
   8F28 C5            [11] 1743 	push	bc
   8F29 CD DB 8E      [17] 1744 	call	_moverEnemigoIzquierda
   8F2C F1            [10] 1745 	pop	af
                           1746 ;src/main.c:364: break;
   8F2D C9            [10] 1747 	ret
                           1748 ;src/main.c:365: case 2:
   8F2E                    1749 00103$:
                           1750 ;src/main.c:366: moverEnemigoArriba(enemy);
   8F2E C5            [11] 1751 	push	bc
   8F2F CD 8D 8E      [17] 1752 	call	_moverEnemigoArriba
   8F32 F1            [10] 1753 	pop	af
                           1754 ;src/main.c:367: break;
   8F33 C9            [10] 1755 	ret
                           1756 ;src/main.c:368: case 3:
   8F34                    1757 00104$:
                           1758 ;src/main.c:369: moverEnemigoAbajo(enemy);
   8F34 C5            [11] 1759 	push	bc
   8F35 CD AC 8E      [17] 1760 	call	_moverEnemigoAbajo
   8F38 F1            [10] 1761 	pop	af
                           1762 ;src/main.c:371: }
   8F39 C9            [10] 1763 	ret
                           1764 ;src/main.c:376: void inicializarEnemy() {
                           1765 ;	---------------------------------
                           1766 ; Function inicializarEnemy
                           1767 ; ---------------------------------
   8F3A                    1768 _inicializarEnemy::
   8F3A DD E5         [15] 1769 	push	ix
   8F3C DD 21 00 00   [14] 1770 	ld	ix,#0
   8F40 DD 39         [15] 1771 	add	ix,sp
   8F42 3B            [ 6] 1772 	dec	sp
                           1773 ;src/main.c:377: u8 i = (2 + num_mapa) + 1; //sacar distinto numero dependiendo del mapa
   8F43 3A 35 86      [13] 1774 	ld	a,(#_num_mapa + 0)
   8F46 C6 03         [ 7] 1775 	add	a, #0x03
   8F48 DD 77 FF      [19] 1776 	ld	-1 (ix),a
                           1777 ;src/main.c:382: actual = enemy;
   8F4B 11 EC 85      [10] 1778 	ld	de,#_enemy+0
                           1779 ;src/main.c:383: while(--i){
   8F4E                    1780 00101$:
   8F4E DD 35 FF      [23] 1781 	dec	-1 (ix)
   8F51 DD 7E FF      [19] 1782 	ld	a,-1 (ix)
   8F54 B7            [ 4] 1783 	or	a, a
   8F55 28 61         [12] 1784 	jr	Z,00104$
                           1785 ;src/main.c:384: actual->x = actual->px = spawnX[i];
   8F57 4B            [ 4] 1786 	ld	c, e
   8F58 42            [ 4] 1787 	ld	b, d
   8F59 03            [ 6] 1788 	inc	bc
   8F5A 03            [ 6] 1789 	inc	bc
   8F5B 3E 59         [ 7] 1790 	ld	a,#<(_spawnX)
   8F5D DD 86 FF      [19] 1791 	add	a, -1 (ix)
   8F60 6F            [ 4] 1792 	ld	l,a
   8F61 3E 86         [ 7] 1793 	ld	a,#>(_spawnX)
   8F63 CE 00         [ 7] 1794 	adc	a, #0x00
   8F65 67            [ 4] 1795 	ld	h,a
   8F66 7E            [ 7] 1796 	ld	a,(hl)
   8F67 02            [ 7] 1797 	ld	(bc),a
   8F68 12            [ 7] 1798 	ld	(de),a
                           1799 ;src/main.c:385: actual->y = actual->py = spawnY[i];
   8F69 D5            [11] 1800 	push	de
   8F6A FD E1         [14] 1801 	pop	iy
   8F6C FD 23         [10] 1802 	inc	iy
   8F6E 4B            [ 4] 1803 	ld	c, e
   8F6F 42            [ 4] 1804 	ld	b, d
   8F70 03            [ 6] 1805 	inc	bc
   8F71 03            [ 6] 1806 	inc	bc
   8F72 03            [ 6] 1807 	inc	bc
   8F73 3E 5E         [ 7] 1808 	ld	a,#<(_spawnY)
   8F75 DD 86 FF      [19] 1809 	add	a, -1 (ix)
   8F78 6F            [ 4] 1810 	ld	l,a
   8F79 3E 86         [ 7] 1811 	ld	a,#>(_spawnY)
   8F7B CE 00         [ 7] 1812 	adc	a, #0x00
   8F7D 67            [ 4] 1813 	ld	h,a
   8F7E 7E            [ 7] 1814 	ld	a,(hl)
   8F7F 02            [ 7] 1815 	ld	(bc),a
   8F80 FD 77 00      [19] 1816 	ld	0 (iy), a
                           1817 ;src/main.c:386: actual->mover  = NO;
   8F83 21 06 00      [10] 1818 	ld	hl,#0x0006
   8F86 19            [11] 1819 	add	hl,de
   8F87 36 00         [10] 1820 	ld	(hl),#0x00
                           1821 ;src/main.c:387: actual->mira   = M_abajo;
   8F89 21 07 00      [10] 1822 	ld	hl,#0x0007
   8F8C 19            [11] 1823 	add	hl,de
   8F8D 36 03         [10] 1824 	ld	(hl),#0x03
                           1825 ;src/main.c:388: actual->sprite = g_enemy;
   8F8F 21 04 00      [10] 1826 	ld	hl,#0x0004
   8F92 19            [11] 1827 	add	hl,de
   8F93 36 3A         [10] 1828 	ld	(hl),#<(_g_enemy)
   8F95 23            [ 6] 1829 	inc	hl
   8F96 36 69         [10] 1830 	ld	(hl),#>(_g_enemy)
                           1831 ;src/main.c:389: actual->muerto = NO;
   8F98 21 08 00      [10] 1832 	ld	hl,#0x0008
   8F9B 19            [11] 1833 	add	hl,de
   8F9C 36 00         [10] 1834 	ld	(hl),#0x00
                           1835 ;src/main.c:390: actual->muertes = 0;
   8F9E 21 0C 00      [10] 1836 	ld	hl,#0x000C
   8FA1 19            [11] 1837 	add	hl,de
   8FA2 36 00         [10] 1838 	ld	(hl),#0x00
                           1839 ;src/main.c:391: actual->patroling = SI;
   8FA4 21 09 00      [10] 1840 	ld	hl,#0x0009
   8FA7 19            [11] 1841 	add	hl,de
   8FA8 36 01         [10] 1842 	ld	(hl),#0x01
                           1843 ;src/main.c:393: dibujarEnemigo(actual);
   8FAA D5            [11] 1844 	push	de
   8FAB D5            [11] 1845 	push	de
   8FAC CD ED 88      [17] 1846 	call	_dibujarEnemigo
   8FAF F1            [10] 1847 	pop	af
   8FB0 D1            [10] 1848 	pop	de
                           1849 ;src/main.c:395: ++actual;
   8FB1 21 0D 00      [10] 1850 	ld	hl,#0x000D
   8FB4 19            [11] 1851 	add	hl,de
   8FB5 EB            [ 4] 1852 	ex	de,hl
   8FB6 18 96         [12] 1853 	jr	00101$
   8FB8                    1854 00104$:
   8FB8 33            [ 6] 1855 	inc	sp
   8FB9 DD E1         [14] 1856 	pop	ix
   8FBB C9            [10] 1857 	ret
                           1858 ;src/main.c:399: void avanzarMapa() {
                           1859 ;	---------------------------------
                           1860 ; Function avanzarMapa
                           1861 ; ---------------------------------
   8FBC                    1862 _avanzarMapa::
                           1863 ;src/main.c:400: if(num_mapa < NUM_MAPAS -1) {
   8FBC 3A 35 86      [13] 1864 	ld	a,(#_num_mapa + 0)
   8FBF D6 02         [ 7] 1865 	sub	a, #0x02
   8FC1 30 34         [12] 1866 	jr	NC,00102$
                           1867 ;src/main.c:401: mapa = mapas[++num_mapa];
   8FC3 01 53 86      [10] 1868 	ld	bc,#_mapas+0
   8FC6 21 35 86      [10] 1869 	ld	hl, #_num_mapa+0
   8FC9 34            [11] 1870 	inc	(hl)
   8FCA FD 21 35 86   [14] 1871 	ld	iy,#_num_mapa
   8FCE FD 6E 00      [19] 1872 	ld	l,0 (iy)
   8FD1 26 00         [ 7] 1873 	ld	h,#0x00
   8FD3 29            [11] 1874 	add	hl, hl
   8FD4 09            [11] 1875 	add	hl,bc
   8FD5 7E            [ 7] 1876 	ld	a,(hl)
   8FD6 FD 21 33 86   [14] 1877 	ld	iy,#_mapa
   8FDA FD 77 00      [19] 1878 	ld	0 (iy),a
   8FDD 23            [ 6] 1879 	inc	hl
   8FDE 7E            [ 7] 1880 	ld	a,(hl)
   8FDF 32 34 86      [13] 1881 	ld	(#_mapa + 1),a
                           1882 ;src/main.c:402: prota.x = prota.px = 2;
   8FE2 21 22 86      [10] 1883 	ld	hl,#(_prota + 0x0002)
   8FE5 36 02         [10] 1884 	ld	(hl),#0x02
   8FE7 21 20 86      [10] 1885 	ld	hl,#_prota
   8FEA 36 02         [10] 1886 	ld	(hl),#0x02
                           1887 ;src/main.c:403: prota.mover = SI;
   8FEC 21 26 86      [10] 1888 	ld	hl,#(_prota + 0x0006)
   8FEF 36 01         [10] 1889 	ld	(hl),#0x01
                           1890 ;src/main.c:404: dibujarMapa();
   8FF1 CD 3D 86      [17] 1891 	call	_dibujarMapa
                           1892 ;src/main.c:405: inicializarEnemy();
   8FF4 C3 3A 8F      [10] 1893 	jp  _inicializarEnemy
   8FF7                    1894 00102$:
                           1895 ;src/main.c:408: menuFin(puntuacion);
   8FF7 FD 21 36 86   [14] 1896 	ld	iy,#_puntuacion
   8FFB FD 6E 00      [19] 1897 	ld	l,0 (iy)
   8FFE 26 00         [ 7] 1898 	ld	h,#0x00
   9000 C3 2C 71      [10] 1899 	jp  _menuFin
                           1900 ;src/main.c:412: void moverIzquierda() {
                           1901 ;	---------------------------------
                           1902 ; Function moverIzquierda
                           1903 ; ---------------------------------
   9003                    1904 _moverIzquierda::
                           1905 ;src/main.c:413: prota.mira = M_izquierda;
   9003 01 20 86      [10] 1906 	ld	bc,#_prota+0
   9006 21 27 86      [10] 1907 	ld	hl,#(_prota + 0x0007)
   9009 36 01         [10] 1908 	ld	(hl),#0x01
                           1909 ;src/main.c:414: if (!checkCollision(M_izquierda)) {
   900B C5            [11] 1910 	push	bc
   900C 3E 01         [ 7] 1911 	ld	a,#0x01
   900E F5            [11] 1912 	push	af
   900F 33            [ 6] 1913 	inc	sp
   9010 CD 78 87      [17] 1914 	call	_checkCollision
   9013 33            [ 6] 1915 	inc	sp
   9014 C1            [10] 1916 	pop	bc
   9015 7D            [ 4] 1917 	ld	a,l
   9016 B7            [ 4] 1918 	or	a, a
   9017 C0            [11] 1919 	ret	NZ
                           1920 ;src/main.c:415: prota.x--;
   9018 0A            [ 7] 1921 	ld	a,(bc)
   9019 C6 FF         [ 7] 1922 	add	a,#0xFF
   901B 02            [ 7] 1923 	ld	(bc),a
                           1924 ;src/main.c:416: prota.mover = SI;
   901C 21 26 86      [10] 1925 	ld	hl,#(_prota + 0x0006)
   901F 36 01         [10] 1926 	ld	(hl),#0x01
                           1927 ;src/main.c:417: prota.sprite = g_hero_left;
   9021 21 C6 6A      [10] 1928 	ld	hl,#_g_hero_left
   9024 22 24 86      [16] 1929 	ld	((_prota + 0x0004)), hl
   9027 C9            [10] 1930 	ret
                           1931 ;src/main.c:421: void moverDerecha() {
                           1932 ;	---------------------------------
                           1933 ; Function moverDerecha
                           1934 ; ---------------------------------
   9028                    1935 _moverDerecha::
                           1936 ;src/main.c:422: prota.mira = M_derecha;
   9028 21 27 86      [10] 1937 	ld	hl,#(_prota + 0x0007)
   902B 36 00         [10] 1938 	ld	(hl),#0x00
                           1939 ;src/main.c:423: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   902D AF            [ 4] 1940 	xor	a, a
   902E F5            [11] 1941 	push	af
   902F 33            [ 6] 1942 	inc	sp
   9030 CD 78 87      [17] 1943 	call	_checkCollision
   9033 33            [ 6] 1944 	inc	sp
   9034 45            [ 4] 1945 	ld	b,l
   9035 21 20 86      [10] 1946 	ld	hl, #_prota + 0
   9038 4E            [ 7] 1947 	ld	c,(hl)
   9039 59            [ 4] 1948 	ld	e,c
   903A 16 00         [ 7] 1949 	ld	d,#0x00
   903C 21 07 00      [10] 1950 	ld	hl,#0x0007
   903F 19            [11] 1951 	add	hl,de
   9040 11 50 80      [10] 1952 	ld	de, #0x8050
   9043 29            [11] 1953 	add	hl, hl
   9044 3F            [ 4] 1954 	ccf
   9045 CB 1C         [ 8] 1955 	rr	h
   9047 CB 1D         [ 8] 1956 	rr	l
   9049 ED 52         [15] 1957 	sbc	hl, de
   904B 3E 00         [ 7] 1958 	ld	a,#0x00
   904D 17            [ 4] 1959 	rla
   904E 5F            [ 4] 1960 	ld	e,a
   904F 78            [ 4] 1961 	ld	a,b
   9050 B7            [ 4] 1962 	or	a,a
   9051 20 14         [12] 1963 	jr	NZ,00104$
   9053 B3            [ 4] 1964 	or	a,e
   9054 28 11         [12] 1965 	jr	Z,00104$
                           1966 ;src/main.c:424: prota.x++;
   9056 0C            [ 4] 1967 	inc	c
   9057 21 20 86      [10] 1968 	ld	hl,#_prota
   905A 71            [ 7] 1969 	ld	(hl),c
                           1970 ;src/main.c:425: prota.mover = SI;
   905B 21 26 86      [10] 1971 	ld	hl,#(_prota + 0x0006)
   905E 36 01         [10] 1972 	ld	(hl),#0x01
                           1973 ;src/main.c:426: prota.sprite = g_hero;
   9060 21 70 6B      [10] 1974 	ld	hl,#_g_hero
   9063 22 24 86      [16] 1975 	ld	((_prota + 0x0004)), hl
   9066 C9            [10] 1976 	ret
   9067                    1977 00104$:
                           1978 ;src/main.c:428: }else if( prota.x + G_HERO_W >= 80){
   9067 7B            [ 4] 1979 	ld	a,e
   9068 B7            [ 4] 1980 	or	a, a
   9069 C0            [11] 1981 	ret	NZ
                           1982 ;src/main.c:429: avanzarMapa();
   906A C3 BC 8F      [10] 1983 	jp  _avanzarMapa
                           1984 ;src/main.c:433: void moverArriba() {
                           1985 ;	---------------------------------
                           1986 ; Function moverArriba
                           1987 ; ---------------------------------
   906D                    1988 _moverArriba::
                           1989 ;src/main.c:434: prota.mira = M_arriba;
   906D 21 27 86      [10] 1990 	ld	hl,#(_prota + 0x0007)
   9070 36 02         [10] 1991 	ld	(hl),#0x02
                           1992 ;src/main.c:435: if (!checkCollision(M_arriba)) { 
   9072 3E 02         [ 7] 1993 	ld	a,#0x02
   9074 F5            [11] 1994 	push	af
   9075 33            [ 6] 1995 	inc	sp
   9076 CD 78 87      [17] 1996 	call	_checkCollision
   9079 33            [ 6] 1997 	inc	sp
   907A 7D            [ 4] 1998 	ld	a,l
   907B B7            [ 4] 1999 	or	a, a
   907C C0            [11] 2000 	ret	NZ
                           2001 ;src/main.c:436: prota.y--;
   907D 21 21 86      [10] 2002 	ld	hl,#_prota + 1
   9080 4E            [ 7] 2003 	ld	c,(hl)
   9081 0D            [ 4] 2004 	dec	c
   9082 71            [ 7] 2005 	ld	(hl),c
                           2006 ;src/main.c:437: prota.y--;
   9083 0D            [ 4] 2007 	dec	c
   9084 71            [ 7] 2008 	ld	(hl),c
                           2009 ;src/main.c:438: prota.mover  = SI;
   9085 21 26 86      [10] 2010 	ld	hl,#(_prota + 0x0006)
   9088 36 01         [10] 2011 	ld	(hl),#0x01
                           2012 ;src/main.c:439: prota.sprite = g_hero_up;
   908A 21 2C 6A      [10] 2013 	ld	hl,#_g_hero_up
   908D 22 24 86      [16] 2014 	ld	((_prota + 0x0004)), hl
   9090 C9            [10] 2015 	ret
                           2016 ;src/main.c:443: void moverAbajo() {
                           2017 ;	---------------------------------
                           2018 ; Function moverAbajo
                           2019 ; ---------------------------------
   9091                    2020 _moverAbajo::
                           2021 ;src/main.c:444: prota.mira = M_abajo;
   9091 21 27 86      [10] 2022 	ld	hl,#(_prota + 0x0007)
   9094 36 03         [10] 2023 	ld	(hl),#0x03
                           2024 ;src/main.c:445: if (!checkCollision(M_abajo) ) { 
   9096 3E 03         [ 7] 2025 	ld	a,#0x03
   9098 F5            [11] 2026 	push	af
   9099 33            [ 6] 2027 	inc	sp
   909A CD 78 87      [17] 2028 	call	_checkCollision
   909D 33            [ 6] 2029 	inc	sp
   909E 7D            [ 4] 2030 	ld	a,l
   909F B7            [ 4] 2031 	or	a, a
   90A0 C0            [11] 2032 	ret	NZ
                           2033 ;src/main.c:446: prota.y++;
   90A1 01 21 86      [10] 2034 	ld	bc,#_prota + 1
   90A4 0A            [ 7] 2035 	ld	a,(bc)
   90A5 3C            [ 4] 2036 	inc	a
   90A6 02            [ 7] 2037 	ld	(bc),a
                           2038 ;src/main.c:447: prota.y++;
   90A7 3C            [ 4] 2039 	inc	a
   90A8 02            [ 7] 2040 	ld	(bc),a
                           2041 ;src/main.c:448: prota.mover  = SI;
   90A9 21 26 86      [10] 2042 	ld	hl,#(_prota + 0x0006)
   90AC 36 01         [10] 2043 	ld	(hl),#0x01
                           2044 ;src/main.c:449: prota.sprite = g_hero_down;
   90AE 21 92 69      [10] 2045 	ld	hl,#_g_hero_down
   90B1 22 24 86      [16] 2046 	ld	((_prota + 0x0004)), hl
   90B4 C9            [10] 2047 	ret
                           2048 ;src/main.c:456: void intHandler() {
                           2049 ;	---------------------------------
                           2050 ; Function intHandler
                           2051 ; ---------------------------------
   90B5                    2052 _intHandler::
                           2053 ;src/main.c:457: if (++i == 6) {
   90B5 21 32 86      [10] 2054 	ld	hl, #_i+0
   90B8 34            [11] 2055 	inc	(hl)
   90B9 3A 32 86      [13] 2056 	ld	a,(#_i + 0)
   90BC D6 06         [ 7] 2057 	sub	a, #0x06
   90BE C0            [11] 2058 	ret	NZ
                           2059 ;src/main.c:458: play();
   90BF CD C0 78      [17] 2060 	call	_play
                           2061 ;src/main.c:459: i=0;
   90C2 21 32 86      [10] 2062 	ld	hl,#_i + 0
   90C5 36 00         [10] 2063 	ld	(hl), #0x00
   90C7 C9            [10] 2064 	ret
                           2065 ;src/main.c:463: void inicializarCPC() {
                           2066 ;	---------------------------------
                           2067 ; Function inicializarCPC
                           2068 ; ---------------------------------
   90C8                    2069 _inicializarCPC::
                           2070 ;src/main.c:464: cpct_disableFirmware();
   90C8 CD 67 7C      [17] 2071 	call	_cpct_disableFirmware
                           2072 ;src/main.c:465: cpct_setVideoMode(0);
   90CB 2E 00         [ 7] 2073 	ld	l,#0x00
   90CD CD 3B 7C      [17] 2074 	call	_cpct_setVideoMode
                           2075 ;src/main.c:466: cpct_setBorder(HW_BLACK);
   90D0 21 10 14      [10] 2076 	ld	hl,#0x1410
   90D3 E5            [11] 2077 	push	hl
   90D4 CD 9E 79      [17] 2078 	call	_cpct_setPALColour
                           2079 ;src/main.c:467: cpct_setPalette(g_palette, 16);
   90D7 21 10 00      [10] 2080 	ld	hl,#0x0010
   90DA E5            [11] 2081 	push	hl
   90DB 21 60 6B      [10] 2082 	ld	hl,#_g_palette
   90DE E5            [11] 2083 	push	hl
   90DF CD 7B 79      [17] 2084 	call	_cpct_setPalette
   90E2 C9            [10] 2085 	ret
                           2086 ;src/main.c:472: void inicializarJuego() {
                           2087 ;	---------------------------------
                           2088 ; Function inicializarJuego
                           2089 ; ---------------------------------
   90E3                    2090 _inicializarJuego::
                           2091 ;src/main.c:474: num_mapa = 0;
   90E3 21 35 86      [10] 2092 	ld	hl,#_num_mapa + 0
   90E6 36 00         [10] 2093 	ld	(hl), #0x00
                           2094 ;src/main.c:475: mapa = mapas[num_mapa];
   90E8 21 53 86      [10] 2095 	ld	hl, #_mapas + 0
   90EB 7E            [ 7] 2096 	ld	a,(hl)
   90EC FD 21 33 86   [14] 2097 	ld	iy,#_mapa
   90F0 FD 77 00      [19] 2098 	ld	0 (iy),a
   90F3 23            [ 6] 2099 	inc	hl
   90F4 7E            [ 7] 2100 	ld	a,(hl)
   90F5 32 34 86      [13] 2101 	ld	(#_mapa + 1),a
                           2102 ;src/main.c:476: cpct_etm_setTileset2x4(g_tileset);
   90F8 21 E0 44      [10] 2103 	ld	hl,#_g_tileset
   90FB CD 8F 7B      [17] 2104 	call	_cpct_etm_setTileset2x4
                           2105 ;src/main.c:478: dibujarMapa();
   90FE CD 3D 86      [17] 2106 	call	_dibujarMapa
                           2107 ;src/main.c:481: barraPuntuacionInicial();
   9101 CD CC 76      [17] 2108 	call	_barraPuntuacionInicial
                           2109 ;src/main.c:484: prota.x = prota.px = 4;
   9104 21 22 86      [10] 2110 	ld	hl,#(_prota + 0x0002)
   9107 36 04         [10] 2111 	ld	(hl),#0x04
   9109 21 20 86      [10] 2112 	ld	hl,#_prota
   910C 36 04         [10] 2113 	ld	(hl),#0x04
                           2114 ;src/main.c:485: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   910E 21 23 86      [10] 2115 	ld	hl,#(_prota + 0x0003)
   9111 36 68         [10] 2116 	ld	(hl),#0x68
   9113 21 21 86      [10] 2117 	ld	hl,#(_prota + 0x0001)
   9116 36 68         [10] 2118 	ld	(hl),#0x68
                           2119 ;src/main.c:486: prota.mover  = NO;
   9118 21 26 86      [10] 2120 	ld	hl,#(_prota + 0x0006)
   911B 36 00         [10] 2121 	ld	(hl),#0x00
                           2122 ;src/main.c:487: prota.mira=M_derecha;
   911D 21 27 86      [10] 2123 	ld	hl,#(_prota + 0x0007)
   9120 36 00         [10] 2124 	ld	(hl),#0x00
                           2125 ;src/main.c:488: prota.sprite = g_hero;
   9122 21 70 6B      [10] 2126 	ld	hl,#_g_hero
   9125 22 24 86      [16] 2127 	ld	((_prota + 0x0004)), hl
                           2128 ;src/main.c:492: cu.x = cu.px = 0;
   9128 21 2A 86      [10] 2129 	ld	hl,#(_cu + 0x0002)
   912B 36 00         [10] 2130 	ld	(hl),#0x00
   912D 21 28 86      [10] 2131 	ld	hl,#_cu
   9130 36 00         [10] 2132 	ld	(hl),#0x00
                           2133 ;src/main.c:493: cu.y = cu.py = 0;
   9132 21 2B 86      [10] 2134 	ld	hl,#(_cu + 0x0003)
   9135 36 00         [10] 2135 	ld	(hl),#0x00
   9137 21 29 86      [10] 2136 	ld	hl,#(_cu + 0x0001)
   913A 36 00         [10] 2137 	ld	(hl),#0x00
                           2138 ;src/main.c:494: cu.lanzado = NO;
   913C 21 2E 86      [10] 2139 	ld	hl,#(_cu + 0x0006)
   913F 36 00         [10] 2140 	ld	(hl),#0x00
                           2141 ;src/main.c:495: cu.mover = NO;
   9141 21 31 86      [10] 2142 	ld	hl,#(_cu + 0x0009)
   9144 36 00         [10] 2143 	ld	(hl),#0x00
                           2144 ;src/main.c:497: inicializarEnemy();
   9146 CD 3A 8F      [17] 2145 	call	_inicializarEnemy
                           2146 ;src/main.c:499: dibujarProta();
   9149 C3 63 86      [10] 2147 	jp  _dibujarProta
                           2148 ;src/main.c:502: void main(void) {
                           2149 ;	---------------------------------
                           2150 ; Function main
                           2151 ; ---------------------------------
   914C                    2152 _main::
   914C DD E5         [15] 2153 	push	ix
   914E DD 21 00 00   [14] 2154 	ld	ix,#0
   9152 DD 39         [15] 2155 	add	ix,sp
   9154 3B            [ 6] 2156 	dec	sp
                           2157 ;src/main.c:507: inicializarCPC();
   9155 CD C8 90      [17] 2158 	call	_inicializarCPC
                           2159 ;src/main.c:509: menuInicio();
   9158 CD ED 75      [17] 2160 	call	_menuInicio
                           2161 ;src/main.c:511: inicializarJuego();
   915B CD E3 90      [17] 2162 	call	_inicializarJuego
                           2163 ;src/main.c:515: while (1) {
   915E                    2164 00122$:
                           2165 ;src/main.c:517: i = (2 + num_mapa) + 1;
   915E 3A 35 86      [13] 2166 	ld	a,(#_num_mapa + 0)
   9161 C6 03         [ 7] 2167 	add	a, #0x03
   9163 DD 77 FF      [19] 2168 	ld	-1 (ix),a
                           2169 ;src/main.c:518: actual = enemy;
                           2170 ;src/main.c:520: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   9166 21 00 2E      [10] 2171 	ld	hl,#_g_tablatrans
   9169 E5            [11] 2172 	push	hl
   916A 2A 33 86      [16] 2173 	ld	hl,(_mapa)
   916D E5            [11] 2174 	push	hl
   916E 21 20 86      [10] 2175 	ld	hl,#_prota
   9171 E5            [11] 2176 	push	hl
   9172 21 28 86      [10] 2177 	ld	hl,#_cu
   9175 E5            [11] 2178 	push	hl
   9176 CD 11 87      [17] 2179 	call	_comprobarTeclado
   9179 21 08 00      [10] 2180 	ld	hl,#8
   917C 39            [11] 2181 	add	hl,sp
   917D F9            [ 6] 2182 	ld	sp,hl
                           2183 ;src/main.c:521: moverCuchillo(&cu, mapa);
   917E 2A 33 86      [16] 2184 	ld	hl,(_mapa)
   9181 E5            [11] 2185 	push	hl
   9182 21 28 86      [10] 2186 	ld	hl,#_cu
   9185 E5            [11] 2187 	push	hl
   9186 CD F9 6F      [17] 2188 	call	_moverCuchillo
   9189 F1            [10] 2189 	pop	af
   918A F1            [10] 2190 	pop	af
                           2191 ;src/main.c:523: while(--i){
   918B 21 EC 85      [10] 2192 	ld	hl,#_enemy
   918E DD 4E FF      [19] 2193 	ld	c,-1 (ix)
   9191                    2194 00101$:
   9191 0D            [ 4] 2195 	dec	c
   9192 79            [ 4] 2196 	ld	a,c
   9193 B7            [ 4] 2197 	or	a, a
   9194 28 0F         [12] 2198 	jr	Z,00103$
                           2199 ;src/main.c:524: moverEnemigo(actual);
   9196 E5            [11] 2200 	push	hl
   9197 C5            [11] 2201 	push	bc
   9198 E5            [11] 2202 	push	hl
   9199 CD ED 8E      [17] 2203 	call	_moverEnemigo
   919C F1            [10] 2204 	pop	af
   919D C1            [10] 2205 	pop	bc
   919E E1            [10] 2206 	pop	hl
                           2207 ;src/main.c:525: ++actual;
   919F 11 0D 00      [10] 2208 	ld	de,#0x000D
   91A2 19            [11] 2209 	add	hl,de
   91A3 18 EC         [12] 2210 	jr	00101$
   91A5                    2211 00103$:
                           2212 ;src/main.c:528: actual = enemy;
   91A5 01 EC 85      [10] 2213 	ld	bc,#_enemy
                           2214 ;src/main.c:530: cpct_waitVSYNC();
   91A8 C5            [11] 2215 	push	bc
   91A9 CD 33 7C      [17] 2216 	call	_cpct_waitVSYNC
   91AC C1            [10] 2217 	pop	bc
                           2218 ;src/main.c:533: if (prota.mover) {
   91AD 3A 26 86      [13] 2219 	ld	a, (#(_prota + 0x0006) + 0)
   91B0 B7            [ 4] 2220 	or	a, a
   91B1 28 0A         [12] 2221 	jr	Z,00105$
                           2222 ;src/main.c:534: redibujarProta();
   91B3 C5            [11] 2223 	push	bc
   91B4 CD FD 86      [17] 2224 	call	_redibujarProta
   91B7 C1            [10] 2225 	pop	bc
                           2226 ;src/main.c:535: prota.mover = NO;
   91B8 21 26 86      [10] 2227 	ld	hl,#(_prota + 0x0006)
   91BB 36 00         [10] 2228 	ld	(hl),#0x00
   91BD                    2229 00105$:
                           2230 ;src/main.c:537: if(cu.lanzado && cu.mover){
   91BD 21 2E 86      [10] 2231 	ld	hl, #(_cu + 0x0006) + 0
   91C0 5E            [ 7] 2232 	ld	e,(hl)
   91C1 7B            [ 4] 2233 	ld	a,e
   91C2 B7            [ 4] 2234 	or	a, a
   91C3 28 1E         [12] 2235 	jr	Z,00110$
   91C5 3A 31 86      [13] 2236 	ld	a, (#(_cu + 0x0009) + 0)
   91C8 B7            [ 4] 2237 	or	a, a
   91C9 28 18         [12] 2238 	jr	Z,00110$
                           2239 ;src/main.c:538: redibujarCuchillo(&cu, g_tablatrans, mapa);
   91CB C5            [11] 2240 	push	bc
   91CC 2A 33 86      [16] 2241 	ld	hl,(_mapa)
   91CF E5            [11] 2242 	push	hl
   91D0 21 00 2E      [10] 2243 	ld	hl,#_g_tablatrans
   91D3 E5            [11] 2244 	push	hl
   91D4 21 28 86      [10] 2245 	ld	hl,#_cu
   91D7 E5            [11] 2246 	push	hl
   91D8 CD 36 6D      [17] 2247 	call	_redibujarCuchillo
   91DB 21 06 00      [10] 2248 	ld	hl,#6
   91DE 39            [11] 2249 	add	hl,sp
   91DF F9            [ 6] 2250 	ld	sp,hl
   91E0 C1            [10] 2251 	pop	bc
   91E1 18 23         [12] 2252 	jr	00137$
   91E3                    2253 00110$:
                           2254 ;src/main.c:539: }else if (cu.lanzado && !cu.mover){
   91E3 7B            [ 4] 2255 	ld	a,e
   91E4 B7            [ 4] 2256 	or	a, a
   91E5 28 1F         [12] 2257 	jr	Z,00137$
   91E7 3A 31 86      [13] 2258 	ld	a, (#(_cu + 0x0009) + 0)
   91EA B7            [ 4] 2259 	or	a, a
   91EB 20 19         [12] 2260 	jr	NZ,00137$
                           2261 ;src/main.c:540: borrarCuchillo(&cu, mapa);
   91ED C5            [11] 2262 	push	bc
   91EE 2A 33 86      [16] 2263 	ld	hl,(_mapa)
   91F1 E5            [11] 2264 	push	hl
   91F2 21 28 86      [10] 2265 	ld	hl,#_cu
   91F5 E5            [11] 2266 	push	hl
   91F6 CD 92 6C      [17] 2267 	call	_borrarCuchillo
   91F9 F1            [10] 2268 	pop	af
   91FA F1            [10] 2269 	pop	af
   91FB C1            [10] 2270 	pop	bc
                           2271 ;src/main.c:541: cu.x = 0;
   91FC 21 28 86      [10] 2272 	ld	hl,#_cu
   91FF 36 00         [10] 2273 	ld	(hl),#0x00
                           2274 ;src/main.c:542: cu.y = 0;
   9201 21 29 86      [10] 2275 	ld	hl,#(_cu + 0x0001)
   9204 36 00         [10] 2276 	ld	(hl),#0x00
                           2277 ;src/main.c:545: while(--i){
   9206                    2278 00137$:
   9206 DD 36 FF 05   [19] 2279 	ld	-1 (ix),#0x05
   920A                    2280 00118$:
   920A DD 35 FF      [23] 2281 	dec	-1 (ix)
   920D DD 7E FF      [19] 2282 	ld	a,-1 (ix)
   9210 B7            [ 4] 2283 	or	a, a
   9211 28 71         [12] 2284 	jr	Z,00120$
                           2285 ;src/main.c:546: if(actual->mover){
   9213 C5            [11] 2286 	push	bc
   9214 FD E1         [14] 2287 	pop	iy
   9216 FD 7E 06      [19] 2288 	ld	a,6 (iy)
   9219 B7            [ 4] 2289 	or	a, a
   921A 28 07         [12] 2290 	jr	Z,00114$
                           2291 ;src/main.c:547: redibujarEnemigo(actual);
   921C C5            [11] 2292 	push	bc
   921D C5            [11] 2293 	push	bc
   921E CD 61 8A      [17] 2294 	call	_redibujarEnemigo
   9221 F1            [10] 2295 	pop	af
   9222 C1            [10] 2296 	pop	bc
   9223                    2297 00114$:
                           2298 ;src/main.c:549: if (actual->muerto && actual->muertes == 0){
   9223 C5            [11] 2299 	push	bc
   9224 FD E1         [14] 2300 	pop	iy
   9226 FD 7E 08      [19] 2301 	ld	a,8 (iy)
   9229 B7            [ 4] 2302 	or	a, a
   922A 28 50         [12] 2303 	jr	Z,00116$
   922C 21 0C 00      [10] 2304 	ld	hl,#0x000C
   922F 09            [11] 2305 	add	hl,bc
   9230 EB            [ 4] 2306 	ex	de,hl
   9231 1A            [ 7] 2307 	ld	a,(de)
   9232 B7            [ 4] 2308 	or	a, a
   9233 20 47         [12] 2309 	jr	NZ,00116$
                           2310 ;src/main.c:550: borrarEnemigo(actual);
   9235 C5            [11] 2311 	push	bc
   9236 D5            [11] 2312 	push	de
   9237 C5            [11] 2313 	push	bc
   9238 CD CD 89      [17] 2314 	call	_borrarEnemigo
   923B F1            [10] 2315 	pop	af
   923C D1            [10] 2316 	pop	de
   923D C1            [10] 2317 	pop	bc
                           2318 ;src/main.c:551: dibujarExplosion(actual);
   923E C5            [11] 2319 	push	bc
   923F D5            [11] 2320 	push	de
   9240 C5            [11] 2321 	push	bc
   9241 CD 25 89      [17] 2322 	call	_dibujarExplosion
   9244 F1            [10] 2323 	pop	af
   9245 D1            [10] 2324 	pop	de
   9246 C1            [10] 2325 	pop	bc
                           2326 ;src/main.c:552: puntuacion_aux = puntuacion;
   9247 FD 21 36 86   [14] 2327 	ld	iy,#_puntuacion
   924B FD 6E 00      [19] 2328 	ld	l,0 (iy)
   924E 26 00         [ 7] 2329 	ld	h,#0x00
                           2330 ;src/main.c:553: puntuacion = aumentarPuntuacion(puntuacion_aux);
   9250 C5            [11] 2331 	push	bc
   9251 D5            [11] 2332 	push	de
   9252 E5            [11] 2333 	push	hl
   9253 CD A5 78      [17] 2334 	call	_aumentarPuntuacion
   9256 F1            [10] 2335 	pop	af
   9257 D1            [10] 2336 	pop	de
   9258 C1            [10] 2337 	pop	bc
   9259 FD 21 36 86   [14] 2338 	ld	iy,#_puntuacion
   925D FD 75 00      [19] 2339 	ld	0 (iy),l
                           2340 ;src/main.c:554: modificarPuntuacion(puntuacion);
   9260 FD 21 36 86   [14] 2341 	ld	iy,#_puntuacion
   9264 FD 6E 00      [19] 2342 	ld	l,0 (iy)
   9267 26 00         [ 7] 2343 	ld	h,#0x00
   9269 C5            [11] 2344 	push	bc
   926A D5            [11] 2345 	push	de
   926B E5            [11] 2346 	push	hl
   926C CD 68 77      [17] 2347 	call	_modificarPuntuacion
   926F F1            [10] 2348 	pop	af
   9270 D1            [10] 2349 	pop	de
   9271 C1            [10] 2350 	pop	bc
                           2351 ;src/main.c:556: actual->muertes++;
   9272 1A            [ 7] 2352 	ld	a,(de)
   9273 3C            [ 4] 2353 	inc	a
   9274 12            [ 7] 2354 	ld	(de),a
                           2355 ;src/main.c:557: actual->x = 0;
   9275 AF            [ 4] 2356 	xor	a, a
   9276 02            [ 7] 2357 	ld	(bc),a
                           2358 ;src/main.c:558: actual->y = 0;
   9277 59            [ 4] 2359 	ld	e, c
   9278 50            [ 4] 2360 	ld	d, b
   9279 13            [ 6] 2361 	inc	de
   927A AF            [ 4] 2362 	xor	a, a
   927B 12            [ 7] 2363 	ld	(de),a
   927C                    2364 00116$:
                           2365 ;src/main.c:560: ++actual;
   927C 21 0D 00      [10] 2366 	ld	hl,#0x000D
   927F 09            [11] 2367 	add	hl,bc
   9280 4D            [ 4] 2368 	ld	c,l
   9281 44            [ 4] 2369 	ld	b,h
   9282 18 86         [12] 2370 	jr	00118$
   9284                    2371 00120$:
                           2372 ;src/main.c:562: cpct_waitVSYNC();
   9284 CD 33 7C      [17] 2373 	call	_cpct_waitVSYNC
   9287 C3 5E 91      [10] 2374 	jp	00122$
   928A 33            [ 6] 2375 	inc	sp
   928B DD E1         [14] 2376 	pop	ix
   928D C9            [10] 2377 	ret
                           2378 	.area _CODE
                           2379 	.area _INITIALIZER
   8638                    2380 __xinit__mapa:
   8638 00 00              2381 	.dw #0x0000
   863A                    2382 __xinit__num_mapa:
   863A 00                 2383 	.db #0x00	; 0
   863B                    2384 __xinit__puntuacion:
   863B 00                 2385 	.db #0x00	; 0
   863C                    2386 __xinit__vidas:
   863C 05                 2387 	.db #0x05	; 5
                           2388 	.area _CABS (ABS)
