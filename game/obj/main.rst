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
                             14 	.globl _inicializarCPC
                             15 	.globl _menuInicio
                             16 	.globl _menuFin
                             17 	.globl _borrarPantallaAbajo
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
                             31 	.globl _moverEnemigoAbajo
                             32 	.globl _moverEnemigoArriba
                             33 	.globl _moverEnemigo
                             34 	.globl _checkEnemyCollision
                             35 	.globl _redibujarEnemigo
                             36 	.globl _borrarEnemigo
                             37 	.globl _dibujarEnemigo
                             38 	.globl _checkCollision
                             39 	.globl _getTilePtr
                             40 	.globl _redibujarProta
                             41 	.globl _borrarProta
                             42 	.globl _dibujarProta
                             43 	.globl _dibujarMapa
                             44 	.globl _cpct_etm_setTileset2x4
                             45 	.globl _cpct_etm_drawTileBox2x4
                             46 	.globl _cpct_akp_musicPlay
                             47 	.globl _cpct_akp_musicInit
                             48 	.globl _cpct_getScreenPtr
                             49 	.globl _cpct_setPALColour
                             50 	.globl _cpct_setPalette
                             51 	.globl _cpct_waitVSYNC
                             52 	.globl _cpct_setVideoMode
                             53 	.globl _cpct_drawStringM0
                             54 	.globl _cpct_drawSpriteMaskedAlignedTable
                             55 	.globl _cpct_drawSolidBox
                             56 	.globl _cpct_drawSprite
                             57 	.globl _cpct_isAnyKeyPressed
                             58 	.globl _cpct_isKeyPressed
                             59 	.globl _cpct_scanKeyboard_if
                             60 	.globl _cpct_scanKeyboard_f
                             61 	.globl _cpct_memset
                             62 	.globl _cpct_disableFirmware
                             63 	.globl _num_mapa
                             64 	.globl _mapa
                             65 	.globl _cu
                             66 	.globl _prota
                             67 	.globl _enemy
                             68 	.globl _EEje
                             69 	.globl _EMirar
                             70 	.globl _mapas
                             71 ;--------------------------------------------------------
                             72 ; special function registers
                             73 ;--------------------------------------------------------
                             74 ;--------------------------------------------------------
                             75 ; ram data
                             76 ;--------------------------------------------------------
                             77 	.area _DATA
   65EE                      78 _EMirar::
   65EE                      79 	.ds 1
   65EF                      80 _EEje::
   65EF                      81 	.ds 1
   65F0                      82 _enemy::
   65F0                      83 	.ds 9
   65F9                      84 _prota::
   65F9                      85 	.ds 8
   6601                      86 _cu::
   6601                      87 	.ds 10
   660B                      88 _mapa::
   660B                      89 	.ds 2
   660D                      90 _num_mapa::
   660D                      91 	.ds 1
                             92 ;--------------------------------------------------------
                             93 ; ram data
                             94 ;--------------------------------------------------------
                             95 	.area _INITIALIZED
                             96 ;--------------------------------------------------------
                             97 ; absolute external ram data
                             98 ;--------------------------------------------------------
                             99 	.area _DABS (ABS)
                            100 ;--------------------------------------------------------
                            101 ; global & static initialisations
                            102 ;--------------------------------------------------------
                            103 	.area _HOME
                            104 	.area _GSINIT
                            105 	.area _GSFINAL
                            106 	.area _GSINIT
                            107 ;--------------------------------------------------------
                            108 ; Home
                            109 ;--------------------------------------------------------
                            110 	.area _HOME
                            111 	.area _HOME
                            112 ;--------------------------------------------------------
                            113 ; code
                            114 ;--------------------------------------------------------
                            115 	.area _CODE
                            116 ;src/main.c:113: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
                            117 ;	---------------------------------
                            118 ; Function dummy_cpct_transparentMaskTable0M0_container
                            119 ; ---------------------------------
   588A                     120 _dummy_cpct_transparentMaskTable0M0_container::
                            121 	.area _g_tablatrans_ (ABS) 
   3E00                     122 	.org 0x3E00 
   3E00                     123 	 _g_tablatrans::
   3E00 FF AA 55 00 AA AA   124 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E08 55 00 55 00 00 00   125 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E10 AA AA 00 00 AA AA   126 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E18 00 00 00 00 00 00   127 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E20 55 00 55 00 00 00   128 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E28 55 00 55 00 00 00   129 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E30 00 00 00 00 00 00   130 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E38 00 00 00 00 00 00   131 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E40 AA AA 00 00 AA AA   132 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E48 00 00 00 00 00 00   133 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E50 AA AA 00 00 AA AA   134 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E58 00 00 00 00 00 00   135 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E60 00 00 00 00 00 00   136 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E68 00 00 00 00 00 00   137 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E70 00 00 00 00 00 00   138 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E78 00 00 00 00 00 00   139 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E80 55 00 55 00 00 00   140 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E88 55 00 55 00 00 00   141 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E90 00 00 00 00 00 00   142 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E98 00 00 00 00 00 00   143 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA0 55 00 55 00 00 00   144 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA8 55 00 55 00 00 00   145 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB0 00 00 00 00 00 00   146 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB8 00 00 00 00 00 00   147 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC0 00 00 00 00 00 00   148 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC8 00 00 00 00 00 00   149 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED0 00 00 00 00 00 00   150 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED8 00 00 00 00 00 00   151 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE0 00 00 00 00 00 00   152 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE8 00 00 00 00 00 00   153 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF0 00 00 00 00 00 00   154 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF8 00 00 00 00 00 00   155 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            156 	.area _CSEG (REL, CON) 
                            157 ;src/main.c:116: void dibujarMapa() {
                            158 ;	---------------------------------
                            159 ; Function dibujarMapa
                            160 ; ---------------------------------
   660E                     161 _dibujarMapa::
                            162 ;src/main.c:117: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   660E 2A 0B 66      [16]  163 	ld	hl,(_mapa)
   6611 E5            [11]  164 	push	hl
   6612 21 00 C0      [10]  165 	ld	hl,#0xC000
   6615 E5            [11]  166 	push	hl
   6616 21 2C 28      [10]  167 	ld	hl,#0x282C
   6619 E5            [11]  168 	push	hl
   661A 2E 00         [ 7]  169 	ld	l, #0x00
   661C E5            [11]  170 	push	hl
   661D AF            [ 4]  171 	xor	a, a
   661E F5            [11]  172 	push	af
   661F 33            [ 6]  173 	inc	sp
   6620 CD 8C 5A      [17]  174 	call	_cpct_etm_drawTileBox2x4
   6623 C9            [10]  175 	ret
   6624                     176 _mapas:
   6624 C0 4D               177 	.dw _g_map1
   6626 E0 46               178 	.dw _g_map2
   6628 00 40               179 	.dw _g_map3
                            180 ;src/main.c:122: void dibujarProta() {
                            181 ;	---------------------------------
                            182 ; Function dibujarProta
                            183 ; ---------------------------------
   662A                     184 _dibujarProta::
                            185 ;src/main.c:123: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   662A 21 FA 65      [10]  186 	ld	hl, #_prota + 1
   662D 56            [ 7]  187 	ld	d,(hl)
   662E 21 F9 65      [10]  188 	ld	hl, #_prota + 0
   6631 46            [ 7]  189 	ld	b,(hl)
   6632 D5            [11]  190 	push	de
   6633 33            [ 6]  191 	inc	sp
   6634 C5            [11]  192 	push	bc
   6635 33            [ 6]  193 	inc	sp
   6636 21 00 C0      [10]  194 	ld	hl,#0xC000
   6639 E5            [11]  195 	push	hl
   663A CD 93 65      [17]  196 	call	_cpct_getScreenPtr
   663D EB            [ 4]  197 	ex	de,hl
                            198 ;src/main.c:124: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   663E ED 4B FD 65   [20]  199 	ld	bc, (#_prota + 4)
   6642 21 00 3E      [10]  200 	ld	hl,#_g_tablatrans
   6645 E5            [11]  201 	push	hl
   6646 21 07 16      [10]  202 	ld	hl,#0x1607
   6649 E5            [11]  203 	push	hl
   664A D5            [11]  204 	push	de
   664B C5            [11]  205 	push	bc
   664C CD B3 65      [17]  206 	call	_cpct_drawSpriteMaskedAlignedTable
   664F C9            [10]  207 	ret
                            208 ;src/main.c:127: void borrarProta() {
                            209 ;	---------------------------------
                            210 ; Function borrarProta
                            211 ; ---------------------------------
   6650                     212 _borrarProta::
   6650 DD E5         [15]  213 	push	ix
   6652 DD 21 00 00   [14]  214 	ld	ix,#0
   6656 DD 39         [15]  215 	add	ix,sp
   6658 3B            [ 6]  216 	dec	sp
                            217 ;src/main.c:129: u8 w = 4 + (prota.px & 1);
   6659 21 FB 65      [10]  218 	ld	hl, #_prota + 2
   665C 4E            [ 7]  219 	ld	c,(hl)
   665D 79            [ 4]  220 	ld	a,c
   665E E6 01         [ 7]  221 	and	a, #0x01
   6660 47            [ 4]  222 	ld	b,a
   6661 04            [ 4]  223 	inc	b
   6662 04            [ 4]  224 	inc	b
   6663 04            [ 4]  225 	inc	b
   6664 04            [ 4]  226 	inc	b
                            227 ;src/main.c:132: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   6665 21 FC 65      [10]  228 	ld	hl, #_prota + 3
   6668 5E            [ 7]  229 	ld	e,(hl)
   6669 CB 4B         [ 8]  230 	bit	1, e
   666B 28 04         [12]  231 	jr	Z,00103$
   666D 3E 01         [ 7]  232 	ld	a,#0x01
   666F 18 02         [12]  233 	jr	00104$
   6671                     234 00103$:
   6671 3E 00         [ 7]  235 	ld	a,#0x00
   6673                     236 00104$:
   6673 C6 06         [ 7]  237 	add	a, #0x06
   6675 DD 77 FF      [19]  238 	ld	-1 (ix),a
                            239 ;src/main.c:134: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   6678 FD 2A 0B 66   [20]  240 	ld	iy,(_mapa)
   667C 16 00         [ 7]  241 	ld	d,#0x00
   667E 63            [ 4]  242 	ld	h,e
   667F 6A            [ 4]  243 	ld	l,d
   6680 CB 7A         [ 8]  244 	bit	7, d
   6682 28 05         [12]  245 	jr	Z,00105$
   6684 13            [ 6]  246 	inc	de
   6685 13            [ 6]  247 	inc	de
   6686 13            [ 6]  248 	inc	de
   6687 63            [ 4]  249 	ld	h,e
   6688 6A            [ 4]  250 	ld	l,d
   6689                     251 00105$:
   6689 5C            [ 4]  252 	ld	e, h
   668A 55            [ 4]  253 	ld	d, l
   668B CB 2A         [ 8]  254 	sra	d
   668D CB 1B         [ 8]  255 	rr	e
   668F CB 2A         [ 8]  256 	sra	d
   6691 CB 1B         [ 8]  257 	rr	e
   6693 51            [ 4]  258 	ld	d,c
   6694 CB 3A         [ 8]  259 	srl	d
   6696 FD E5         [15]  260 	push	iy
   6698 21 00 C0      [10]  261 	ld	hl,#0xC000
   669B E5            [11]  262 	push	hl
   669C 3E 28         [ 7]  263 	ld	a,#0x28
   669E F5            [11]  264 	push	af
   669F 33            [ 6]  265 	inc	sp
   66A0 DD 7E FF      [19]  266 	ld	a,-1 (ix)
   66A3 F5            [11]  267 	push	af
   66A4 33            [ 6]  268 	inc	sp
   66A5 C5            [11]  269 	push	bc
   66A6 33            [ 6]  270 	inc	sp
   66A7 7B            [ 4]  271 	ld	a,e
   66A8 F5            [11]  272 	push	af
   66A9 33            [ 6]  273 	inc	sp
   66AA D5            [11]  274 	push	de
   66AB 33            [ 6]  275 	inc	sp
   66AC CD 8C 5A      [17]  276 	call	_cpct_etm_drawTileBox2x4
   66AF 33            [ 6]  277 	inc	sp
   66B0 DD E1         [14]  278 	pop	ix
   66B2 C9            [10]  279 	ret
                            280 ;src/main.c:139: void redibujarProta() {
                            281 ;	---------------------------------
                            282 ; Function redibujarProta
                            283 ; ---------------------------------
   66B3                     284 _redibujarProta::
                            285 ;src/main.c:140: borrarProta();
   66B3 CD 50 66      [17]  286 	call	_borrarProta
                            287 ;src/main.c:141: prota.px = prota.x;
   66B6 01 FB 65      [10]  288 	ld	bc,#_prota + 2
   66B9 3A F9 65      [13]  289 	ld	a, (#_prota + 0)
   66BC 02            [ 7]  290 	ld	(bc),a
                            291 ;src/main.c:142: prota.py = prota.y;
   66BD 01 FC 65      [10]  292 	ld	bc,#_prota + 3
   66C0 3A FA 65      [13]  293 	ld	a, (#_prota + 1)
   66C3 02            [ 7]  294 	ld	(bc),a
                            295 ;src/main.c:143: dibujarProta();
   66C4 C3 2A 66      [10]  296 	jp  _dibujarProta
                            297 ;src/main.c:146: u8* getTilePtr(u8 x, u8 y) {
                            298 ;	---------------------------------
                            299 ; Function getTilePtr
                            300 ; ---------------------------------
   66C7                     301 _getTilePtr::
                            302 ;src/main.c:147: return mapa + (y/4)*g_map1_W + x/2;
   66C7 21 03 00      [10]  303 	ld	hl, #3+0
   66CA 39            [11]  304 	add	hl, sp
   66CB 4E            [ 7]  305 	ld	c, (hl)
   66CC CB 39         [ 8]  306 	srl	c
   66CE CB 39         [ 8]  307 	srl	c
   66D0 06 00         [ 7]  308 	ld	b,#0x00
   66D2 69            [ 4]  309 	ld	l, c
   66D3 60            [ 4]  310 	ld	h, b
   66D4 29            [11]  311 	add	hl, hl
   66D5 29            [11]  312 	add	hl, hl
   66D6 09            [11]  313 	add	hl, bc
   66D7 29            [11]  314 	add	hl, hl
   66D8 29            [11]  315 	add	hl, hl
   66D9 29            [11]  316 	add	hl, hl
   66DA ED 5B 0B 66   [20]  317 	ld	de,(_mapa)
   66DE 19            [11]  318 	add	hl,de
   66DF FD 21 02 00   [14]  319 	ld	iy,#2
   66E3 FD 39         [15]  320 	add	iy,sp
   66E5 FD 4E 00      [19]  321 	ld	c,0 (iy)
   66E8 CB 39         [ 8]  322 	srl	c
   66EA 59            [ 4]  323 	ld	e,c
   66EB 16 00         [ 7]  324 	ld	d,#0x00
   66ED 19            [11]  325 	add	hl,de
   66EE C9            [10]  326 	ret
                            327 ;src/main.c:150: u8 checkCollision(int direction) { // check optimization
                            328 ;	---------------------------------
                            329 ; Function checkCollision
                            330 ; ---------------------------------
   66EF                     331 _checkCollision::
   66EF DD E5         [15]  332 	push	ix
   66F1 DD 21 00 00   [14]  333 	ld	ix,#0
   66F5 DD 39         [15]  334 	add	ix,sp
   66F7 21 F8 FF      [10]  335 	ld	hl,#-8
   66FA 39            [11]  336 	add	hl,sp
   66FB F9            [ 6]  337 	ld	sp,hl
                            338 ;src/main.c:153: switch (direction) {
   66FC DD CB 05 7E   [20]  339 	bit	7, 5 (ix)
   6700 C2 0C 68      [10]  340 	jp	NZ,00105$
   6703 3E 03         [ 7]  341 	ld	a,#0x03
   6705 DD BE 04      [19]  342 	cp	a, 4 (ix)
   6708 3E 00         [ 7]  343 	ld	a,#0x00
   670A DD 9E 05      [19]  344 	sbc	a, 5 (ix)
   670D E2 12 67      [10]  345 	jp	PO, 00128$
   6710 EE 80         [ 7]  346 	xor	a, #0x80
   6712                     347 00128$:
   6712 FA 0C 68      [10]  348 	jp	M,00105$
   6715 DD 5E 04      [19]  349 	ld	e,4 (ix)
   6718 16 00         [ 7]  350 	ld	d,#0x00
   671A 21 21 67      [10]  351 	ld	hl,#00129$
   671D 19            [11]  352 	add	hl,de
   671E 19            [11]  353 	add	hl,de
   671F 19            [11]  354 	add	hl,de
   6720 E9            [ 4]  355 	jp	(hl)
   6721                     356 00129$:
   6721 C3 2D 67      [10]  357 	jp	00101$
   6724 C3 72 67      [10]  358 	jp	00102$
   6727 C3 B2 67      [10]  359 	jp	00103$
   672A C3 E0 67      [10]  360 	jp	00104$
                            361 ;src/main.c:154: case 0:
   672D                     362 00101$:
                            363 ;src/main.c:155: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   672D 21 FA 65      [10]  364 	ld	hl, #(_prota + 0x0001) + 0
   6730 46            [ 7]  365 	ld	b,(hl)
   6731 3A F9 65      [13]  366 	ld	a, (#_prota + 0)
   6734 C6 04         [ 7]  367 	add	a, #0x04
   6736 C5            [11]  368 	push	bc
   6737 33            [ 6]  369 	inc	sp
   6738 F5            [11]  370 	push	af
   6739 33            [ 6]  371 	inc	sp
   673A CD C7 66      [17]  372 	call	_getTilePtr
   673D F1            [10]  373 	pop	af
   673E DD 75 FE      [19]  374 	ld	-2 (ix),l
   6741 DD 74 FF      [19]  375 	ld	-1 (ix),h
                            376 ;src/main.c:156: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   6744 3A FA 65      [13]  377 	ld	a, (#(_prota + 0x0001) + 0)
   6747 C6 14         [ 7]  378 	add	a, #0x14
   6749 47            [ 4]  379 	ld	b,a
   674A 3A F9 65      [13]  380 	ld	a, (#_prota + 0)
   674D C6 04         [ 7]  381 	add	a, #0x04
   674F C5            [11]  382 	push	bc
   6750 33            [ 6]  383 	inc	sp
   6751 F5            [11]  384 	push	af
   6752 33            [ 6]  385 	inc	sp
   6753 CD C7 66      [17]  386 	call	_getTilePtr
   6756 F1            [10]  387 	pop	af
   6757 4D            [ 4]  388 	ld	c,l
   6758 44            [ 4]  389 	ld	b,h
                            390 ;src/main.c:157: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   6759 3A FA 65      [13]  391 	ld	a, (#(_prota + 0x0001) + 0)
   675C C6 0B         [ 7]  392 	add	a, #0x0B
   675E 57            [ 4]  393 	ld	d,a
   675F 3A F9 65      [13]  394 	ld	a, (#_prota + 0)
   6762 C6 04         [ 7]  395 	add	a, #0x04
   6764 C5            [11]  396 	push	bc
   6765 D5            [11]  397 	push	de
   6766 33            [ 6]  398 	inc	sp
   6767 F5            [11]  399 	push	af
   6768 33            [ 6]  400 	inc	sp
   6769 CD C7 66      [17]  401 	call	_getTilePtr
   676C F1            [10]  402 	pop	af
   676D EB            [ 4]  403 	ex	de,hl
   676E C1            [10]  404 	pop	bc
                            405 ;src/main.c:158: break;
   676F C3 0C 68      [10]  406 	jp	00105$
                            407 ;src/main.c:159: case 1:
   6772                     408 00102$:
                            409 ;src/main.c:160: headTile  = getTilePtr(prota.x - 1, prota.y);
   6772 21 FA 65      [10]  410 	ld	hl, #(_prota + 0x0001) + 0
   6775 46            [ 7]  411 	ld	b,(hl)
   6776 21 F9 65      [10]  412 	ld	hl, #_prota + 0
   6779 56            [ 7]  413 	ld	d,(hl)
   677A 15            [ 4]  414 	dec	d
   677B 4A            [ 4]  415 	ld	c, d
   677C C5            [11]  416 	push	bc
   677D CD C7 66      [17]  417 	call	_getTilePtr
   6780 F1            [10]  418 	pop	af
   6781 DD 75 FE      [19]  419 	ld	-2 (ix),l
   6784 DD 74 FF      [19]  420 	ld	-1 (ix),h
                            421 ;src/main.c:161: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
   6787 3A FA 65      [13]  422 	ld	a, (#(_prota + 0x0001) + 0)
   678A C6 14         [ 7]  423 	add	a, #0x14
   678C 47            [ 4]  424 	ld	b,a
   678D 21 F9 65      [10]  425 	ld	hl, #_prota + 0
   6790 56            [ 7]  426 	ld	d,(hl)
   6791 15            [ 4]  427 	dec	d
   6792 4A            [ 4]  428 	ld	c, d
   6793 C5            [11]  429 	push	bc
   6794 CD C7 66      [17]  430 	call	_getTilePtr
   6797 F1            [10]  431 	pop	af
   6798 4D            [ 4]  432 	ld	c,l
   6799 44            [ 4]  433 	ld	b,h
                            434 ;src/main.c:162: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
   679A 3A FA 65      [13]  435 	ld	a, (#(_prota + 0x0001) + 0)
   679D C6 0B         [ 7]  436 	add	a, #0x0B
   679F 57            [ 4]  437 	ld	d,a
   67A0 3A F9 65      [13]  438 	ld	a, (#_prota + 0)
   67A3 C6 FF         [ 7]  439 	add	a,#0xFF
   67A5 C5            [11]  440 	push	bc
   67A6 D5            [11]  441 	push	de
   67A7 33            [ 6]  442 	inc	sp
   67A8 F5            [11]  443 	push	af
   67A9 33            [ 6]  444 	inc	sp
   67AA CD C7 66      [17]  445 	call	_getTilePtr
   67AD F1            [10]  446 	pop	af
   67AE EB            [ 4]  447 	ex	de,hl
   67AF C1            [10]  448 	pop	bc
                            449 ;src/main.c:163: break;
   67B0 18 5A         [12]  450 	jr	00105$
                            451 ;src/main.c:164: case 2:
   67B2                     452 00103$:
                            453 ;src/main.c:165: headTile   = getTilePtr(prota.x, prota.y - 2);
   67B2 21 FA 65      [10]  454 	ld	hl, #(_prota + 0x0001) + 0
   67B5 46            [ 7]  455 	ld	b,(hl)
   67B6 05            [ 4]  456 	dec	b
   67B7 05            [ 4]  457 	dec	b
   67B8 21 F9 65      [10]  458 	ld	hl, #_prota + 0
   67BB 4E            [ 7]  459 	ld	c, (hl)
   67BC C5            [11]  460 	push	bc
   67BD CD C7 66      [17]  461 	call	_getTilePtr
   67C0 F1            [10]  462 	pop	af
   67C1 DD 75 FE      [19]  463 	ld	-2 (ix),l
   67C4 DD 74 FF      [19]  464 	ld	-1 (ix),h
                            465 ;src/main.c:166: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
   67C7 3A FA 65      [13]  466 	ld	a, (#(_prota + 0x0001) + 0)
   67CA 47            [ 4]  467 	ld	b,a
   67CB 05            [ 4]  468 	dec	b
   67CC 05            [ 4]  469 	dec	b
   67CD 3A F9 65      [13]  470 	ld	a, (#_prota + 0)
   67D0 C6 03         [ 7]  471 	add	a, #0x03
   67D2 C5            [11]  472 	push	bc
   67D3 33            [ 6]  473 	inc	sp
   67D4 F5            [11]  474 	push	af
   67D5 33            [ 6]  475 	inc	sp
   67D6 CD C7 66      [17]  476 	call	_getTilePtr
   67D9 F1            [10]  477 	pop	af
   67DA 4D            [ 4]  478 	ld	c,l
   67DB 44            [ 4]  479 	ld	b,h
                            480 ;src/main.c:167: *waistTile = 0;
   67DC AF            [ 4]  481 	xor	a, a
   67DD 12            [ 7]  482 	ld	(de),a
                            483 ;src/main.c:168: break;
   67DE 18 2C         [12]  484 	jr	00105$
                            485 ;src/main.c:169: case 3:
   67E0                     486 00104$:
                            487 ;src/main.c:170: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
   67E0 3A FA 65      [13]  488 	ld	a, (#(_prota + 0x0001) + 0)
   67E3 C6 16         [ 7]  489 	add	a, #0x16
   67E5 47            [ 4]  490 	ld	b,a
   67E6 21 F9 65      [10]  491 	ld	hl, #_prota + 0
   67E9 4E            [ 7]  492 	ld	c, (hl)
   67EA C5            [11]  493 	push	bc
   67EB CD C7 66      [17]  494 	call	_getTilePtr
   67EE F1            [10]  495 	pop	af
   67EF DD 75 FE      [19]  496 	ld	-2 (ix),l
   67F2 DD 74 FF      [19]  497 	ld	-1 (ix),h
                            498 ;src/main.c:171: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   67F5 3A FA 65      [13]  499 	ld	a, (#(_prota + 0x0001) + 0)
   67F8 C6 16         [ 7]  500 	add	a, #0x16
   67FA 47            [ 4]  501 	ld	b,a
   67FB 3A F9 65      [13]  502 	ld	a, (#_prota + 0)
   67FE C6 03         [ 7]  503 	add	a, #0x03
   6800 C5            [11]  504 	push	bc
   6801 33            [ 6]  505 	inc	sp
   6802 F5            [11]  506 	push	af
   6803 33            [ 6]  507 	inc	sp
   6804 CD C7 66      [17]  508 	call	_getTilePtr
   6807 F1            [10]  509 	pop	af
   6808 4D            [ 4]  510 	ld	c,l
   6809 44            [ 4]  511 	ld	b,h
                            512 ;src/main.c:172: *waistTile = 0;
   680A AF            [ 4]  513 	xor	a, a
   680B 12            [ 7]  514 	ld	(de),a
                            515 ;src/main.c:174: }
   680C                     516 00105$:
                            517 ;src/main.c:176: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   680C DD 6E FE      [19]  518 	ld	l,-2 (ix)
   680F DD 66 FF      [19]  519 	ld	h,-1 (ix)
   6812 6E            [ 7]  520 	ld	l,(hl)
   6813 3E 02         [ 7]  521 	ld	a,#0x02
   6815 95            [ 4]  522 	sub	a, l
   6816 38 0E         [12]  523 	jr	C,00106$
   6818 0A            [ 7]  524 	ld	a,(bc)
   6819 4F            [ 4]  525 	ld	c,a
   681A 3E 02         [ 7]  526 	ld	a,#0x02
   681C 91            [ 4]  527 	sub	a, c
   681D 38 07         [12]  528 	jr	C,00106$
   681F 1A            [ 7]  529 	ld	a,(de)
   6820 4F            [ 4]  530 	ld	c,a
   6821 3E 02         [ 7]  531 	ld	a,#0x02
   6823 91            [ 4]  532 	sub	a, c
   6824 30 04         [12]  533 	jr	NC,00107$
   6826                     534 00106$:
                            535 ;src/main.c:177: return 1;
   6826 2E 01         [ 7]  536 	ld	l,#0x01
   6828 18 02         [12]  537 	jr	00110$
   682A                     538 00107$:
                            539 ;src/main.c:179: return 0;
   682A 2E 00         [ 7]  540 	ld	l,#0x00
   682C                     541 00110$:
   682C DD F9         [10]  542 	ld	sp, ix
   682E DD E1         [14]  543 	pop	ix
   6830 C9            [10]  544 	ret
                            545 ;src/main.c:183: void dibujarEnemigo() {
                            546 ;	---------------------------------
                            547 ; Function dibujarEnemigo
                            548 ; ---------------------------------
   6831                     549 _dibujarEnemigo::
                            550 ;src/main.c:184: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy.x, enemy.y);
   6831 21 F1 65      [10]  551 	ld	hl, #_enemy + 1
   6834 56            [ 7]  552 	ld	d,(hl)
   6835 21 F0 65      [10]  553 	ld	hl, #_enemy + 0
   6838 46            [ 7]  554 	ld	b,(hl)
   6839 D5            [11]  555 	push	de
   683A 33            [ 6]  556 	inc	sp
   683B C5            [11]  557 	push	bc
   683C 33            [ 6]  558 	inc	sp
   683D 21 00 C0      [10]  559 	ld	hl,#0xC000
   6840 E5            [11]  560 	push	hl
   6841 CD 93 65      [17]  561 	call	_cpct_getScreenPtr
   6844 EB            [ 4]  562 	ex	de,hl
                            563 ;src/main.c:185: cpct_drawSpriteMaskedAlignedTable (enemy.sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   6845 ED 4B F4 65   [20]  564 	ld	bc, (#_enemy + 4)
   6849 21 00 3E      [10]  565 	ld	hl,#_g_tablatrans
   684C E5            [11]  566 	push	hl
   684D 21 04 16      [10]  567 	ld	hl,#0x1604
   6850 E5            [11]  568 	push	hl
   6851 D5            [11]  569 	push	de
   6852 C5            [11]  570 	push	bc
   6853 CD B3 65      [17]  571 	call	_cpct_drawSpriteMaskedAlignedTable
   6856 C9            [10]  572 	ret
                            573 ;src/main.c:188: void borrarEnemigo() {
                            574 ;	---------------------------------
                            575 ; Function borrarEnemigo
                            576 ; ---------------------------------
   6857                     577 _borrarEnemigo::
   6857 DD E5         [15]  578 	push	ix
   6859 DD 21 00 00   [14]  579 	ld	ix,#0
   685D DD 39         [15]  580 	add	ix,sp
   685F 3B            [ 6]  581 	dec	sp
                            582 ;src/main.c:190: u8 w = 4 + (enemy.px & 1);
   6860 21 F2 65      [10]  583 	ld	hl, #_enemy + 2
   6863 4E            [ 7]  584 	ld	c,(hl)
   6864 79            [ 4]  585 	ld	a,c
   6865 E6 01         [ 7]  586 	and	a, #0x01
   6867 47            [ 4]  587 	ld	b,a
   6868 04            [ 4]  588 	inc	b
   6869 04            [ 4]  589 	inc	b
   686A 04            [ 4]  590 	inc	b
   686B 04            [ 4]  591 	inc	b
                            592 ;src/main.c:193: u8 h = 7 + (enemy.py & 2 ? 1 : 0);
   686C 21 F3 65      [10]  593 	ld	hl, #_enemy + 3
   686F 5E            [ 7]  594 	ld	e,(hl)
   6870 CB 4B         [ 8]  595 	bit	1, e
   6872 28 04         [12]  596 	jr	Z,00103$
   6874 3E 01         [ 7]  597 	ld	a,#0x01
   6876 18 02         [12]  598 	jr	00104$
   6878                     599 00103$:
   6878 3E 00         [ 7]  600 	ld	a,#0x00
   687A                     601 00104$:
   687A C6 07         [ 7]  602 	add	a, #0x07
   687C DD 77 FF      [19]  603 	ld	-1 (ix),a
                            604 ;src/main.c:195: cpct_etm_drawTileBox2x4 (enemy.px / 2, (enemy.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   687F FD 2A 0B 66   [20]  605 	ld	iy,(_mapa)
   6883 16 00         [ 7]  606 	ld	d,#0x00
   6885 63            [ 4]  607 	ld	h,e
   6886 6A            [ 4]  608 	ld	l,d
   6887 CB 7A         [ 8]  609 	bit	7, d
   6889 28 05         [12]  610 	jr	Z,00105$
   688B 13            [ 6]  611 	inc	de
   688C 13            [ 6]  612 	inc	de
   688D 13            [ 6]  613 	inc	de
   688E 63            [ 4]  614 	ld	h,e
   688F 6A            [ 4]  615 	ld	l,d
   6890                     616 00105$:
   6890 5C            [ 4]  617 	ld	e, h
   6891 55            [ 4]  618 	ld	d, l
   6892 CB 2A         [ 8]  619 	sra	d
   6894 CB 1B         [ 8]  620 	rr	e
   6896 CB 2A         [ 8]  621 	sra	d
   6898 CB 1B         [ 8]  622 	rr	e
   689A 51            [ 4]  623 	ld	d,c
   689B CB 3A         [ 8]  624 	srl	d
   689D FD E5         [15]  625 	push	iy
   689F 21 00 C0      [10]  626 	ld	hl,#0xC000
   68A2 E5            [11]  627 	push	hl
   68A3 3E 28         [ 7]  628 	ld	a,#0x28
   68A5 F5            [11]  629 	push	af
   68A6 33            [ 6]  630 	inc	sp
   68A7 DD 7E FF      [19]  631 	ld	a,-1 (ix)
   68AA F5            [11]  632 	push	af
   68AB 33            [ 6]  633 	inc	sp
   68AC C5            [11]  634 	push	bc
   68AD 33            [ 6]  635 	inc	sp
   68AE 7B            [ 4]  636 	ld	a,e
   68AF F5            [11]  637 	push	af
   68B0 33            [ 6]  638 	inc	sp
   68B1 D5            [11]  639 	push	de
   68B2 33            [ 6]  640 	inc	sp
   68B3 CD 8C 5A      [17]  641 	call	_cpct_etm_drawTileBox2x4
                            642 ;src/main.c:197: enemy.mover = NO;
   68B6 21 F6 65      [10]  643 	ld	hl,#(_enemy + 0x0006)
   68B9 36 00         [10]  644 	ld	(hl),#0x00
   68BB 33            [ 6]  645 	inc	sp
   68BC DD E1         [14]  646 	pop	ix
   68BE C9            [10]  647 	ret
                            648 ;src/main.c:202: void redibujarEnemigo() {
                            649 ;	---------------------------------
                            650 ; Function redibujarEnemigo
                            651 ; ---------------------------------
   68BF                     652 _redibujarEnemigo::
                            653 ;src/main.c:203: borrarEnemigo();
   68BF CD 57 68      [17]  654 	call	_borrarEnemigo
                            655 ;src/main.c:204: enemy.px = enemy.x;
   68C2 01 F2 65      [10]  656 	ld	bc,#_enemy + 2
   68C5 3A F0 65      [13]  657 	ld	a, (#_enemy + 0)
   68C8 02            [ 7]  658 	ld	(bc),a
                            659 ;src/main.c:205: enemy.py = enemy.y;
   68C9 01 F3 65      [10]  660 	ld	bc,#_enemy + 3
   68CC 3A F1 65      [13]  661 	ld	a, (#_enemy + 1)
   68CF 02            [ 7]  662 	ld	(bc),a
                            663 ;src/main.c:206: dibujarEnemigo();
   68D0 C3 31 68      [10]  664 	jp  _dibujarEnemigo
                            665 ;src/main.c:209: u8 checkEnemyCollision(int direction){
                            666 ;	---------------------------------
                            667 ; Function checkEnemyCollision
                            668 ; ---------------------------------
   68D3                     669 _checkEnemyCollision::
   68D3 DD E5         [15]  670 	push	ix
   68D5 DD 21 00 00   [14]  671 	ld	ix,#0
   68D9 DD 39         [15]  672 	add	ix,sp
   68DB 3B            [ 6]  673 	dec	sp
                            674 ;src/main.c:211: u8 colisiona = 1;
   68DC DD 36 FF 01   [19]  675 	ld	-1 (ix),#0x01
                            676 ;src/main.c:213: switch (direction) {
   68E0 DD CB 05 7E   [20]  677 	bit	7, 5 (ix)
   68E4 C2 8D 6A      [10]  678 	jp	NZ,00135$
   68E7 3E 03         [ 7]  679 	ld	a,#0x03
   68E9 DD BE 04      [19]  680 	cp	a, 4 (ix)
   68EC 3E 00         [ 7]  681 	ld	a,#0x00
   68EE DD 9E 05      [19]  682 	sbc	a, 5 (ix)
   68F1 E2 F6 68      [10]  683 	jp	PO, 00194$
   68F4 EE 80         [ 7]  684 	xor	a, #0x80
   68F6                     685 00194$:
   68F6 FA 8D 6A      [10]  686 	jp	M,00135$
   68F9 DD 5E 04      [19]  687 	ld	e,4 (ix)
   68FC 16 00         [ 7]  688 	ld	d,#0x00
   68FE 21 05 69      [10]  689 	ld	hl,#00195$
   6901 19            [11]  690 	add	hl,de
   6902 19            [11]  691 	add	hl,de
   6903 19            [11]  692 	add	hl,de
   6904 E9            [ 4]  693 	jp	(hl)
   6905                     694 00195$:
   6905 C3 8D 6A      [10]  695 	jp	00135$
   6908 C3 8D 6A      [10]  696 	jp	00135$
   690B C3 17 69      [10]  697 	jp	00103$
   690E C3 D2 69      [10]  698 	jp	00119$
                            699 ;src/main.c:214: case 0:
                            700 ;src/main.c:216: break;
   6911 C3 8D 6A      [10]  701 	jp	00135$
                            702 ;src/main.c:217: case 1:
                            703 ;src/main.c:219: break;
   6914 C3 8D 6A      [10]  704 	jp	00135$
                            705 ;src/main.c:220: case 2:
   6917                     706 00103$:
                            707 ;src/main.c:221: if( *getTilePtr(enemy.x, enemy.y - 2) <= 2
   6917 3A F1 65      [13]  708 	ld	a, (#(_enemy + 0x0001) + 0)
   691A 57            [ 4]  709 	ld	d,a
   691B 15            [ 4]  710 	dec	d
   691C 15            [ 4]  711 	dec	d
   691D 21 F0 65      [10]  712 	ld	hl, #_enemy + 0
   6920 46            [ 7]  713 	ld	b,(hl)
   6921 D5            [11]  714 	push	de
   6922 33            [ 6]  715 	inc	sp
   6923 C5            [11]  716 	push	bc
   6924 33            [ 6]  717 	inc	sp
   6925 CD C7 66      [17]  718 	call	_getTilePtr
   6928 F1            [10]  719 	pop	af
   6929 4E            [ 7]  720 	ld	c,(hl)
                            721 ;src/main.c:235: enemy.mira = M_abajo;
                            722 ;src/main.c:221: if( *getTilePtr(enemy.x, enemy.y - 2) <= 2
   692A 3E 02         [ 7]  723 	ld	a,#0x02
   692C 91            [ 4]  724 	sub	a, c
   692D DA CD 69      [10]  725 	jp	C,00115$
                            726 ;src/main.c:222: && *getTilePtr(enemy.x + G_ENEMY_W / 2, enemy.y - 2) <= 2
   6930 21 F1 65      [10]  727 	ld	hl, #(_enemy + 0x0001) + 0
   6933 46            [ 7]  728 	ld	b,(hl)
   6934 05            [ 4]  729 	dec	b
   6935 05            [ 4]  730 	dec	b
   6936 21 F0 65      [10]  731 	ld	hl, #_enemy + 0
   6939 56            [ 7]  732 	ld	d,(hl)
   693A 14            [ 4]  733 	inc	d
   693B 14            [ 4]  734 	inc	d
   693C 4A            [ 4]  735 	ld	c, d
   693D C5            [11]  736 	push	bc
   693E CD C7 66      [17]  737 	call	_getTilePtr
   6941 F1            [10]  738 	pop	af
   6942 4E            [ 7]  739 	ld	c,(hl)
   6943 3E 02         [ 7]  740 	ld	a,#0x02
   6945 91            [ 4]  741 	sub	a, c
   6946 DA CD 69      [10]  742 	jp	C,00115$
                            743 ;src/main.c:223: && *getTilePtr(enemy.x + G_ENEMY_W, enemy.y - 2) <= 2)
   6949 21 F1 65      [10]  744 	ld	hl, #(_enemy + 0x0001) + 0
   694C 46            [ 7]  745 	ld	b,(hl)
   694D 05            [ 4]  746 	dec	b
   694E 05            [ 4]  747 	dec	b
   694F 3A F0 65      [13]  748 	ld	a, (#_enemy + 0)
   6952 C6 04         [ 7]  749 	add	a, #0x04
   6954 C5            [11]  750 	push	bc
   6955 33            [ 6]  751 	inc	sp
   6956 F5            [11]  752 	push	af
   6957 33            [ 6]  753 	inc	sp
   6958 CD C7 66      [17]  754 	call	_getTilePtr
   695B F1            [10]  755 	pop	af
   695C 4E            [ 7]  756 	ld	c,(hl)
   695D 3E 02         [ 7]  757 	ld	a,#0x02
   695F 91            [ 4]  758 	sub	a, c
   6960 38 6B         [12]  759 	jr	C,00115$
                            760 ;src/main.c:225: if((prota.x + G_HERO_W -4) < enemy.x || prota.x  > (enemy.x + G_ENEMY_W)){
   6962 21 F9 65      [10]  761 	ld	hl, #_prota + 0
   6965 4E            [ 7]  762 	ld	c,(hl)
   6966 06 00         [ 7]  763 	ld	b,#0x00
   6968 59            [ 4]  764 	ld	e, c
   6969 50            [ 4]  765 	ld	d, b
   696A 13            [ 6]  766 	inc	de
   696B 13            [ 6]  767 	inc	de
   696C 13            [ 6]  768 	inc	de
   696D 21 F0 65      [10]  769 	ld	hl, #_enemy + 0
   6970 6E            [ 7]  770 	ld	l,(hl)
   6971 26 00         [ 7]  771 	ld	h,#0x00
   6973 7B            [ 4]  772 	ld	a,e
   6974 95            [ 4]  773 	sub	a, l
   6975 7A            [ 4]  774 	ld	a,d
   6976 9C            [ 4]  775 	sbc	a, h
   6977 E2 7C 69      [10]  776 	jp	PO, 00196$
   697A EE 80         [ 7]  777 	xor	a, #0x80
   697C                     778 00196$:
   697C FA 8F 69      [10]  779 	jp	M,00110$
   697F 11 04 00      [10]  780 	ld	de,#0x0004
   6982 19            [11]  781 	add	hl,de
   6983 7D            [ 4]  782 	ld	a,l
   6984 91            [ 4]  783 	sub	a, c
   6985 7C            [ 4]  784 	ld	a,h
   6986 98            [ 4]  785 	sbc	a, b
   6987 E2 8C 69      [10]  786 	jp	PO, 00197$
   698A EE 80         [ 7]  787 	xor	a, #0x80
   698C                     788 00197$:
   698C F2 95 69      [10]  789 	jp	P,00111$
   698F                     790 00110$:
                            791 ;src/main.c:227: colisiona = 0;
   698F DD 36 FF 00   [19]  792 	ld	-1 (ix),#0x00
   6993 18 3D         [12]  793 	jr	00119$
   6995                     794 00111$:
                            795 ;src/main.c:230: if(enemy.y>prota.y){
   6995 21 F1 65      [10]  796 	ld	hl, #(_enemy + 0x0001) + 0
   6998 4E            [ 7]  797 	ld	c,(hl)
   6999 21 FA 65      [10]  798 	ld	hl, #(_prota + 0x0001) + 0
   699C 5E            [ 7]  799 	ld	e,(hl)
   699D 7B            [ 4]  800 	ld	a,e
   699E 91            [ 4]  801 	sub	a, c
   699F 30 26         [12]  802 	jr	NC,00108$
                            803 ;src/main.c:231: if(enemy.y - (prota.y + G_HERO_H -2) >= 2){
   69A1 06 00         [ 7]  804 	ld	b,#0x00
   69A3 16 00         [ 7]  805 	ld	d,#0x00
   69A5 21 14 00      [10]  806 	ld	hl,#0x0014
   69A8 19            [11]  807 	add	hl,de
   69A9 79            [ 4]  808 	ld	a,c
   69AA 95            [ 4]  809 	sub	a, l
   69AB 4F            [ 4]  810 	ld	c,a
   69AC 78            [ 4]  811 	ld	a,b
   69AD 9C            [ 4]  812 	sbc	a, h
   69AE 47            [ 4]  813 	ld	b,a
   69AF 79            [ 4]  814 	ld	a,c
   69B0 D6 02         [ 7]  815 	sub	a, #0x02
   69B2 78            [ 4]  816 	ld	a,b
   69B3 17            [ 4]  817 	rla
   69B4 3F            [ 4]  818 	ccf
   69B5 1F            [ 4]  819 	rra
   69B6 DE 80         [ 7]  820 	sbc	a, #0x80
   69B8 38 06         [12]  821 	jr	C,00105$
                            822 ;src/main.c:232: colisiona = 0;
   69BA DD 36 FF 00   [19]  823 	ld	-1 (ix),#0x00
   69BE 18 12         [12]  824 	jr	00119$
   69C0                     825 00105$:
                            826 ;src/main.c:235: enemy.mira = M_abajo;
   69C0 21 F7 65      [10]  827 	ld	hl,#(_enemy + 0x0007)
   69C3 36 03         [10]  828 	ld	(hl),#0x03
   69C5 18 0B         [12]  829 	jr	00119$
   69C7                     830 00108$:
                            831 ;src/main.c:238: colisiona = 0;
   69C7 DD 36 FF 00   [19]  832 	ld	-1 (ix),#0x00
   69CB 18 05         [12]  833 	jr	00119$
   69CD                     834 00115$:
                            835 ;src/main.c:244: enemy.mira = M_abajo;
   69CD 21 F7 65      [10]  836 	ld	hl,#(_enemy + 0x0007)
   69D0 36 03         [10]  837 	ld	(hl),#0x03
                            838 ;src/main.c:247: case 3:
   69D2                     839 00119$:
                            840 ;src/main.c:250: if( *getTilePtr(enemy.x, enemy.y + G_ENEMY_H + 2) <= 2
   69D2 3A F1 65      [13]  841 	ld	a, (#(_enemy + 0x0001) + 0)
   69D5 C6 18         [ 7]  842 	add	a, #0x18
   69D7 47            [ 4]  843 	ld	b,a
   69D8 21 F0 65      [10]  844 	ld	hl, #_enemy + 0
   69DB 4E            [ 7]  845 	ld	c, (hl)
   69DC C5            [11]  846 	push	bc
   69DD CD C7 66      [17]  847 	call	_getTilePtr
   69E0 F1            [10]  848 	pop	af
   69E1 4E            [ 7]  849 	ld	c,(hl)
                            850 ;src/main.c:263: enemy.mira = M_arriba;
                            851 ;src/main.c:250: if( *getTilePtr(enemy.x, enemy.y + G_ENEMY_H + 2) <= 2
   69E2 3E 02         [ 7]  852 	ld	a,#0x02
   69E4 91            [ 4]  853 	sub	a, c
   69E5 DA 88 6A      [10]  854 	jp	C,00131$
                            855 ;src/main.c:251: && *getTilePtr(enemy.x + G_ENEMY_W / 2, enemy.y + G_ENEMY_H + 2) <= 2
   69E8 3A F1 65      [13]  856 	ld	a, (#(_enemy + 0x0001) + 0)
   69EB C6 18         [ 7]  857 	add	a, #0x18
   69ED 47            [ 4]  858 	ld	b,a
   69EE 21 F0 65      [10]  859 	ld	hl, #_enemy + 0
   69F1 56            [ 7]  860 	ld	d,(hl)
   69F2 14            [ 4]  861 	inc	d
   69F3 14            [ 4]  862 	inc	d
   69F4 4A            [ 4]  863 	ld	c, d
   69F5 C5            [11]  864 	push	bc
   69F6 CD C7 66      [17]  865 	call	_getTilePtr
   69F9 F1            [10]  866 	pop	af
   69FA 4E            [ 7]  867 	ld	c,(hl)
   69FB 3E 02         [ 7]  868 	ld	a,#0x02
   69FD 91            [ 4]  869 	sub	a, c
   69FE DA 88 6A      [10]  870 	jp	C,00131$
                            871 ;src/main.c:252: && *getTilePtr(enemy.x + G_ENEMY_W, enemy.y + G_ENEMY_H + 2) <= 2)			  
   6A01 3A F1 65      [13]  872 	ld	a, (#(_enemy + 0x0001) + 0)
   6A04 C6 18         [ 7]  873 	add	a, #0x18
   6A06 47            [ 4]  874 	ld	b,a
   6A07 3A F0 65      [13]  875 	ld	a, (#_enemy + 0)
   6A0A C6 04         [ 7]  876 	add	a, #0x04
   6A0C C5            [11]  877 	push	bc
   6A0D 33            [ 6]  878 	inc	sp
   6A0E F5            [11]  879 	push	af
   6A0F 33            [ 6]  880 	inc	sp
   6A10 CD C7 66      [17]  881 	call	_getTilePtr
   6A13 F1            [10]  882 	pop	af
   6A14 4E            [ 7]  883 	ld	c,(hl)
   6A15 3E 02         [ 7]  884 	ld	a,#0x02
   6A17 91            [ 4]  885 	sub	a, c
   6A18 38 6E         [12]  886 	jr	C,00131$
                            887 ;src/main.c:254: if( (prota.x + G_HERO_W -4) < enemy.x || prota.x  > (enemy.x + G_ENEMY_W) ){
   6A1A 21 F9 65      [10]  888 	ld	hl, #_prota + 0
   6A1D 4E            [ 7]  889 	ld	c,(hl)
   6A1E 06 00         [ 7]  890 	ld	b,#0x00
   6A20 59            [ 4]  891 	ld	e, c
   6A21 50            [ 4]  892 	ld	d, b
   6A22 13            [ 6]  893 	inc	de
   6A23 13            [ 6]  894 	inc	de
   6A24 13            [ 6]  895 	inc	de
   6A25 21 F0 65      [10]  896 	ld	hl, #_enemy + 0
   6A28 6E            [ 7]  897 	ld	l,(hl)
   6A29 26 00         [ 7]  898 	ld	h,#0x00
   6A2B 7B            [ 4]  899 	ld	a,e
   6A2C 95            [ 4]  900 	sub	a, l
   6A2D 7A            [ 4]  901 	ld	a,d
   6A2E 9C            [ 4]  902 	sbc	a, h
   6A2F E2 34 6A      [10]  903 	jp	PO, 00198$
   6A32 EE 80         [ 7]  904 	xor	a, #0x80
   6A34                     905 00198$:
   6A34 FA 47 6A      [10]  906 	jp	M,00126$
   6A37 11 04 00      [10]  907 	ld	de,#0x0004
   6A3A 19            [11]  908 	add	hl,de
   6A3B 7D            [ 4]  909 	ld	a,l
   6A3C 91            [ 4]  910 	sub	a, c
   6A3D 7C            [ 4]  911 	ld	a,h
   6A3E 98            [ 4]  912 	sbc	a, b
   6A3F E2 44 6A      [10]  913 	jp	PO, 00199$
   6A42 EE 80         [ 7]  914 	xor	a, #0x80
   6A44                     915 00199$:
   6A44 F2 4D 6A      [10]  916 	jp	P,00127$
   6A47                     917 00126$:
                            918 ;src/main.c:255: colisiona = 0;
   6A47 DD 36 FF 00   [19]  919 	ld	-1 (ix),#0x00
   6A4B 18 40         [12]  920 	jr	00135$
   6A4D                     921 00127$:
                            922 ;src/main.c:258: if(prota.y > enemy.y){ //si el prota esta abajo
   6A4D 21 FA 65      [10]  923 	ld	hl, #(_prota + 0x0001) + 0
   6A50 4E            [ 7]  924 	ld	c,(hl)
   6A51 21 F1 65      [10]  925 	ld	hl, #(_enemy + 0x0001) + 0
   6A54 5E            [ 7]  926 	ld	e,(hl)
   6A55 7B            [ 4]  927 	ld	a,e
   6A56 91            [ 4]  928 	sub	a, c
   6A57 30 29         [12]  929 	jr	NC,00124$
                            930 ;src/main.c:259: if( prota.y - (enemy.y + G_ENEMY_H) > 2){ // si hay espacio entre el enemigo y el prota
   6A59 06 00         [ 7]  931 	ld	b,#0x00
   6A5B 16 00         [ 7]  932 	ld	d,#0x00
   6A5D 21 16 00      [10]  933 	ld	hl,#0x0016
   6A60 19            [11]  934 	add	hl,de
   6A61 79            [ 4]  935 	ld	a,c
   6A62 95            [ 4]  936 	sub	a, l
   6A63 4F            [ 4]  937 	ld	c,a
   6A64 78            [ 4]  938 	ld	a,b
   6A65 9C            [ 4]  939 	sbc	a, h
   6A66 47            [ 4]  940 	ld	b,a
   6A67 3E 02         [ 7]  941 	ld	a,#0x02
   6A69 B9            [ 4]  942 	cp	a, c
   6A6A 3E 00         [ 7]  943 	ld	a,#0x00
   6A6C 98            [ 4]  944 	sbc	a, b
   6A6D E2 72 6A      [10]  945 	jp	PO, 00200$
   6A70 EE 80         [ 7]  946 	xor	a, #0x80
   6A72                     947 00200$:
   6A72 F2 7B 6A      [10]  948 	jp	P,00121$
                            949 ;src/main.c:260: colisiona = 0;
   6A75 DD 36 FF 00   [19]  950 	ld	-1 (ix),#0x00
   6A79 18 12         [12]  951 	jr	00135$
   6A7B                     952 00121$:
                            953 ;src/main.c:263: enemy.mira = M_arriba;
   6A7B 21 F7 65      [10]  954 	ld	hl,#(_enemy + 0x0007)
   6A7E 36 02         [10]  955 	ld	(hl),#0x02
   6A80 18 0B         [12]  956 	jr	00135$
   6A82                     957 00124$:
                            958 ;src/main.c:266: colisiona = 0;
   6A82 DD 36 FF 00   [19]  959 	ld	-1 (ix),#0x00
   6A86 18 05         [12]  960 	jr	00135$
   6A88                     961 00131$:
                            962 ;src/main.c:270: enemy.mira = M_arriba;
   6A88 21 F7 65      [10]  963 	ld	hl,#(_enemy + 0x0007)
   6A8B 36 02         [10]  964 	ld	(hl),#0x02
                            965 ;src/main.c:273: }
   6A8D                     966 00135$:
                            967 ;src/main.c:274: return colisiona;
   6A8D DD 6E FF      [19]  968 	ld	l,-1 (ix)
   6A90 33            [ 6]  969 	inc	sp
   6A91 DD E1         [14]  970 	pop	ix
   6A93 C9            [10]  971 	ret
                            972 ;src/main.c:277: void moverEnemigo(){
                            973 ;	---------------------------------
                            974 ; Function moverEnemigo
                            975 ; ---------------------------------
   6A94                     976 _moverEnemigo::
                            977 ;src/main.c:278: if(!enemy.muerto){
   6A94 3A F8 65      [13]  978 	ld	a, (#_enemy + 8)
   6A97 B7            [ 4]  979 	or	a, a
   6A98 C0            [11]  980 	ret	NZ
                            981 ;src/main.c:279: if(!checkEnemyCollision(enemy.mira)){
   6A99 21 F7 65      [10]  982 	ld	hl,#_enemy + 7
   6A9C 4E            [ 7]  983 	ld	c,(hl)
   6A9D 06 00         [ 7]  984 	ld	b,#0x00
   6A9F E5            [11]  985 	push	hl
   6AA0 C5            [11]  986 	push	bc
   6AA1 CD D3 68      [17]  987 	call	_checkEnemyCollision
   6AA4 F1            [10]  988 	pop	af
   6AA5 7D            [ 4]  989 	ld	a,l
   6AA6 E1            [10]  990 	pop	hl
   6AA7 B7            [ 4]  991 	or	a, a
   6AA8 C0            [11]  992 	ret	NZ
                            993 ;src/main.c:281: switch (enemy.mira) {
   6AA9 5E            [ 7]  994 	ld	e,(hl)
   6AAA 3E 03         [ 7]  995 	ld	a,#0x03
   6AAC 93            [ 4]  996 	sub	a, e
   6AAD D8            [11]  997 	ret	C
   6AAE 16 00         [ 7]  998 	ld	d,#0x00
   6AB0 21 B6 6A      [10]  999 	ld	hl,#00124$
   6AB3 19            [11] 1000 	add	hl,de
   6AB4 19            [11] 1001 	add	hl,de
                           1002 ;src/main.c:282: case 0:
                           1003 ;src/main.c:284: break;
                           1004 ;src/main.c:285: case 1:
                           1005 ;src/main.c:287: break;
                           1006 ;src/main.c:288: case 2:
   6AB5 E9            [ 4] 1007 	jp	(hl)
   6AB6                    1008 00124$:
   6AB6 18 10         [12] 1009 	jr	00110$
   6AB8 18 0E         [12] 1010 	jr	00110$
   6ABA 18 06         [12] 1011 	jr	00103$
   6ABC 18 07         [12] 1012 	jr	00104$
   6ABE 18 08         [12] 1013 	jr	00110$
   6AC0 18 06         [12] 1014 	jr	00110$
   6AC2                    1015 00103$:
                           1016 ;src/main.c:289: moverEnemigoArriba();
                           1017 ;src/main.c:290: break;
   6AC2 C3 C9 6A      [10] 1018 	jp  _moverEnemigoArriba
                           1019 ;src/main.c:291: case 3:
   6AC5                    1020 00104$:
                           1021 ;src/main.c:292: moverEnemigoAbajo();
   6AC5 CD D7 6A      [17] 1022 	call	_moverEnemigoAbajo
                           1023 ;src/main.c:294: }
   6AC8                    1024 00110$:
   6AC8 C9            [10] 1025 	ret
                           1026 ;src/main.c:299: void moverEnemigoArriba(){
                           1027 ;	---------------------------------
                           1028 ; Function moverEnemigoArriba
                           1029 ; ---------------------------------
   6AC9                    1030 _moverEnemigoArriba::
                           1031 ;src/main.c:300: enemy.y--;
   6AC9 21 F1 65      [10] 1032 	ld	hl,#_enemy + 1
   6ACC 4E            [ 7] 1033 	ld	c,(hl)
   6ACD 0D            [ 4] 1034 	dec	c
   6ACE 71            [ 7] 1035 	ld	(hl),c
                           1036 ;src/main.c:301: enemy.y--;
   6ACF 0D            [ 4] 1037 	dec	c
   6AD0 71            [ 7] 1038 	ld	(hl),c
                           1039 ;src/main.c:302: enemy.mover = SI;
   6AD1 21 F6 65      [10] 1040 	ld	hl,#(_enemy + 0x0006)
   6AD4 36 01         [10] 1041 	ld	(hl),#0x01
   6AD6 C9            [10] 1042 	ret
                           1043 ;src/main.c:305: void moverEnemigoAbajo(){
                           1044 ;	---------------------------------
                           1045 ; Function moverEnemigoAbajo
                           1046 ; ---------------------------------
   6AD7                    1047 _moverEnemigoAbajo::
                           1048 ;src/main.c:306: enemy.y++;
   6AD7 01 F1 65      [10] 1049 	ld	bc,#_enemy + 1
   6ADA 0A            [ 7] 1050 	ld	a,(bc)
   6ADB 3C            [ 4] 1051 	inc	a
   6ADC 02            [ 7] 1052 	ld	(bc),a
                           1053 ;src/main.c:307: enemy.y++;
   6ADD 3C            [ 4] 1054 	inc	a
   6ADE 02            [ 7] 1055 	ld	(bc),a
                           1056 ;src/main.c:308: enemy.mover = SI;
   6ADF 21 F6 65      [10] 1057 	ld	hl,#(_enemy + 0x0006)
   6AE2 36 01         [10] 1058 	ld	(hl),#0x01
   6AE4 C9            [10] 1059 	ret
                           1060 ;src/main.c:311: void avanzarMapa() {
                           1061 ;	---------------------------------
                           1062 ; Function avanzarMapa
                           1063 ; ---------------------------------
   6AE5                    1064 _avanzarMapa::
                           1065 ;src/main.c:312: if(num_mapa < NUM_MAPAS -1) {
   6AE5 3A 0D 66      [13] 1066 	ld	a,(#_num_mapa + 0)
   6AE8 D6 02         [ 7] 1067 	sub	a, #0x02
   6AEA D2 F0 70      [10] 1068 	jp	NC,_menuFin
                           1069 ;src/main.c:313: mapa = mapas[++num_mapa];
   6AED 21 0D 66      [10] 1070 	ld	hl, #_num_mapa+0
   6AF0 34            [11] 1071 	inc	(hl)
   6AF1 FD 21 0D 66   [14] 1072 	ld	iy,#_num_mapa
   6AF5 FD 6E 00      [19] 1073 	ld	l,0 (iy)
   6AF8 26 00         [ 7] 1074 	ld	h,#0x00
   6AFA 29            [11] 1075 	add	hl, hl
   6AFB 11 24 66      [10] 1076 	ld	de,#_mapas
   6AFE 19            [11] 1077 	add	hl,de
   6AFF 7E            [ 7] 1078 	ld	a,(hl)
   6B00 FD 21 0B 66   [14] 1079 	ld	iy,#_mapa
   6B04 FD 77 00      [19] 1080 	ld	0 (iy),a
   6B07 23            [ 6] 1081 	inc	hl
   6B08 7E            [ 7] 1082 	ld	a,(hl)
   6B09 32 0C 66      [13] 1083 	ld	(#_mapa + 1),a
                           1084 ;src/main.c:314: prota.x = prota.px = 2;
   6B0C 21 FB 65      [10] 1085 	ld	hl,#(_prota + 0x0002)
   6B0F 36 02         [10] 1086 	ld	(hl),#0x02
   6B11 21 F9 65      [10] 1087 	ld	hl,#_prota
   6B14 36 02         [10] 1088 	ld	(hl),#0x02
                           1089 ;src/main.c:315: prota.mover = SI;
   6B16 21 FF 65      [10] 1090 	ld	hl,#(_prota + 0x0006)
                           1091 ;src/main.c:316: dibujarMapa();
                           1092 ;src/main.c:320: menuFin();
   6B19 36 01         [10] 1093 	ld	(hl), #0x01
   6B1B C3 0E 66      [10] 1094 	jp	_dibujarMapa
                           1095 ;src/main.c:324: void moverIzquierda() {
                           1096 ;	---------------------------------
                           1097 ; Function moverIzquierda
                           1098 ; ---------------------------------
   6B1E                    1099 _moverIzquierda::
                           1100 ;src/main.c:325: prota.mira = M_izquierda;
   6B1E 01 F9 65      [10] 1101 	ld	bc,#_prota+0
   6B21 21 00 66      [10] 1102 	ld	hl,#(_prota + 0x0007)
   6B24 36 01         [10] 1103 	ld	(hl),#0x01
                           1104 ;src/main.c:326: if (!checkCollision(M_izquierda)) {
   6B26 C5            [11] 1105 	push	bc
   6B27 21 01 00      [10] 1106 	ld	hl,#0x0001
   6B2A E5            [11] 1107 	push	hl
   6B2B CD EF 66      [17] 1108 	call	_checkCollision
   6B2E F1            [10] 1109 	pop	af
   6B2F C1            [10] 1110 	pop	bc
   6B30 7D            [ 4] 1111 	ld	a,l
   6B31 B7            [ 4] 1112 	or	a, a
   6B32 C0            [11] 1113 	ret	NZ
                           1114 ;src/main.c:327: prota.x--;
   6B33 0A            [ 7] 1115 	ld	a,(bc)
   6B34 C6 FF         [ 7] 1116 	add	a,#0xFF
   6B36 02            [ 7] 1117 	ld	(bc),a
                           1118 ;src/main.c:328: prota.mover = SI;
   6B37 21 FF 65      [10] 1119 	ld	hl,#(_prota + 0x0006)
   6B3A 36 01         [10] 1120 	ld	(hl),#0x01
                           1121 ;src/main.c:329: prota.sprite = g_hero_left;
   6B3C 21 46 57      [10] 1122 	ld	hl,#_g_hero_left
   6B3F 22 FD 65      [16] 1123 	ld	((_prota + 0x0004)), hl
   6B42 C9            [10] 1124 	ret
                           1125 ;src/main.c:333: void moverDerecha() {
                           1126 ;	---------------------------------
                           1127 ; Function moverDerecha
                           1128 ; ---------------------------------
   6B43                    1129 _moverDerecha::
                           1130 ;src/main.c:334: prota.mira = M_derecha;
   6B43 21 00 66      [10] 1131 	ld	hl,#(_prota + 0x0007)
   6B46 36 00         [10] 1132 	ld	(hl),#0x00
                           1133 ;src/main.c:335: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   6B48 21 00 00      [10] 1134 	ld	hl,#0x0000
   6B4B E5            [11] 1135 	push	hl
   6B4C CD EF 66      [17] 1136 	call	_checkCollision
   6B4F F1            [10] 1137 	pop	af
   6B50 45            [ 4] 1138 	ld	b,l
   6B51 21 F9 65      [10] 1139 	ld	hl, #_prota + 0
   6B54 4E            [ 7] 1140 	ld	c,(hl)
   6B55 59            [ 4] 1141 	ld	e,c
   6B56 16 00         [ 7] 1142 	ld	d,#0x00
   6B58 21 07 00      [10] 1143 	ld	hl,#0x0007
   6B5B 19            [11] 1144 	add	hl,de
   6B5C 11 50 80      [10] 1145 	ld	de, #0x8050
   6B5F 29            [11] 1146 	add	hl, hl
   6B60 3F            [ 4] 1147 	ccf
   6B61 CB 1C         [ 8] 1148 	rr	h
   6B63 CB 1D         [ 8] 1149 	rr	l
   6B65 ED 52         [15] 1150 	sbc	hl, de
   6B67 3E 00         [ 7] 1151 	ld	a,#0x00
   6B69 17            [ 4] 1152 	rla
   6B6A 5F            [ 4] 1153 	ld	e,a
   6B6B 78            [ 4] 1154 	ld	a,b
   6B6C B7            [ 4] 1155 	or	a,a
   6B6D 20 14         [12] 1156 	jr	NZ,00104$
   6B6F B3            [ 4] 1157 	or	a,e
   6B70 28 11         [12] 1158 	jr	Z,00104$
                           1159 ;src/main.c:336: prota.x++;
   6B72 0C            [ 4] 1160 	inc	c
   6B73 21 F9 65      [10] 1161 	ld	hl,#_prota
   6B76 71            [ 7] 1162 	ld	(hl),c
                           1163 ;src/main.c:337: prota.mover = SI;
   6B77 21 FF 65      [10] 1164 	ld	hl,#(_prota + 0x0006)
   6B7A 36 01         [10] 1165 	ld	(hl),#0x01
                           1166 ;src/main.c:338: prota.sprite = g_hero;
   6B7C 21 F0 57      [10] 1167 	ld	hl,#_g_hero
   6B7F 22 FD 65      [16] 1168 	ld	((_prota + 0x0004)), hl
   6B82 C9            [10] 1169 	ret
   6B83                    1170 00104$:
                           1171 ;src/main.c:340: }else if( prota.x + G_HERO_W >= 80){
   6B83 7B            [ 4] 1172 	ld	a,e
   6B84 B7            [ 4] 1173 	or	a, a
   6B85 C0            [11] 1174 	ret	NZ
                           1175 ;src/main.c:341: avanzarMapa();	
   6B86 C3 E5 6A      [10] 1176 	jp  _avanzarMapa
                           1177 ;src/main.c:345: void moverArriba() {
                           1178 ;	---------------------------------
                           1179 ; Function moverArriba
                           1180 ; ---------------------------------
   6B89                    1181 _moverArriba::
                           1182 ;src/main.c:346: prota.mira = M_arriba;
   6B89 21 00 66      [10] 1183 	ld	hl,#(_prota + 0x0007)
   6B8C 36 02         [10] 1184 	ld	(hl),#0x02
                           1185 ;src/main.c:347: if (!checkCollision(M_arriba) && (prota.y >= 0)) { // TODO: COMPROBAR
   6B8E 21 02 00      [10] 1186 	ld	hl,#0x0002
   6B91 E5            [11] 1187 	push	hl
   6B92 CD EF 66      [17] 1188 	call	_checkCollision
   6B95 F1            [10] 1189 	pop	af
   6B96 7D            [ 4] 1190 	ld	a,l
   6B97 B7            [ 4] 1191 	or	a, a
   6B98 C0            [11] 1192 	ret	NZ
                           1193 ;src/main.c:348: prota.y--;
   6B99 21 FA 65      [10] 1194 	ld	hl,#_prota + 1
   6B9C 4E            [ 7] 1195 	ld	c,(hl)
   6B9D 0D            [ 4] 1196 	dec	c
   6B9E 71            [ 7] 1197 	ld	(hl),c
                           1198 ;src/main.c:349: prota.y--;
   6B9F 0D            [ 4] 1199 	dec	c
   6BA0 71            [ 7] 1200 	ld	(hl),c
                           1201 ;src/main.c:350: prota.mover  = SI;
   6BA1 21 FF 65      [10] 1202 	ld	hl,#(_prota + 0x0006)
   6BA4 36 01         [10] 1203 	ld	(hl),#0x01
                           1204 ;src/main.c:351: prota.sprite = g_hero_up;
   6BA6 21 AC 56      [10] 1205 	ld	hl,#_g_hero_up
   6BA9 22 FD 65      [16] 1206 	ld	((_prota + 0x0004)), hl
   6BAC C9            [10] 1207 	ret
                           1208 ;src/main.c:355: void moverAbajo() {
                           1209 ;	---------------------------------
                           1210 ; Function moverAbajo
                           1211 ; ---------------------------------
   6BAD                    1212 _moverAbajo::
                           1213 ;src/main.c:356: prota.mira = M_abajo;
   6BAD 21 00 66      [10] 1214 	ld	hl,#(_prota + 0x0007)
   6BB0 36 03         [10] 1215 	ld	(hl),#0x03
                           1216 ;src/main.c:357: if (!checkCollision(M_abajo) && (prota.y + G_HERO_H < ALTO_MAPA)) { // TODO: COMPROBAR
   6BB2 21 03 00      [10] 1217 	ld	hl,#0x0003
   6BB5 E5            [11] 1218 	push	hl
   6BB6 CD EF 66      [17] 1219 	call	_checkCollision
   6BB9 F1            [10] 1220 	pop	af
   6BBA 7D            [ 4] 1221 	ld	a,l
   6BBB B7            [ 4] 1222 	or	a, a
   6BBC C0            [11] 1223 	ret	NZ
   6BBD 01 FA 65      [10] 1224 	ld	bc,#_prota + 1
   6BC0 0A            [ 7] 1225 	ld	a,(bc)
   6BC1 5F            [ 4] 1226 	ld	e,a
   6BC2 6B            [ 4] 1227 	ld	l,e
   6BC3 26 00         [ 7] 1228 	ld	h,#0x00
   6BC5 D5            [11] 1229 	push	de
   6BC6 11 16 00      [10] 1230 	ld	de,#0x0016
   6BC9 19            [11] 1231 	add	hl, de
   6BCA D1            [10] 1232 	pop	de
   6BCB 7D            [ 4] 1233 	ld	a,l
   6BCC D6 B0         [ 7] 1234 	sub	a, #0xB0
   6BCE 7C            [ 4] 1235 	ld	a,h
   6BCF 17            [ 4] 1236 	rla
   6BD0 3F            [ 4] 1237 	ccf
   6BD1 1F            [ 4] 1238 	rra
   6BD2 DE 80         [ 7] 1239 	sbc	a, #0x80
   6BD4 D0            [11] 1240 	ret	NC
                           1241 ;src/main.c:358: prota.y++;
   6BD5 7B            [ 4] 1242 	ld	a,e
   6BD6 3C            [ 4] 1243 	inc	a
   6BD7 02            [ 7] 1244 	ld	(bc),a
                           1245 ;src/main.c:359: prota.y++;
   6BD8 3C            [ 4] 1246 	inc	a
   6BD9 02            [ 7] 1247 	ld	(bc),a
                           1248 ;src/main.c:360: prota.mover  = SI;
   6BDA 21 FF 65      [10] 1249 	ld	hl,#(_prota + 0x0006)
   6BDD 36 01         [10] 1250 	ld	(hl),#0x01
                           1251 ;src/main.c:361: prota.sprite = g_hero_down;
   6BDF 21 12 56      [10] 1252 	ld	hl,#_g_hero_down
   6BE2 22 FD 65      [16] 1253 	ld	((_prota + 0x0004)), hl
   6BE5 C9            [10] 1254 	ret
                           1255 ;src/main.c:365: void dibujarCuchillo() {
                           1256 ;	---------------------------------
                           1257 ; Function dibujarCuchillo
                           1258 ; ---------------------------------
   6BE6                    1259 _dibujarCuchillo::
   6BE6 DD E5         [15] 1260 	push	ix
   6BE8 DD 21 00 00   [14] 1261 	ld	ix,#0
   6BEC DD 39         [15] 1262 	add	ix,sp
   6BEE F5            [11] 1263 	push	af
                           1264 ;src/main.c:366: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   6BEF 21 02 66      [10] 1265 	ld	hl, #_cu + 1
   6BF2 56            [ 7] 1266 	ld	d,(hl)
   6BF3 21 01 66      [10] 1267 	ld	hl, #_cu + 0
   6BF6 46            [ 7] 1268 	ld	b,(hl)
   6BF7 D5            [11] 1269 	push	de
   6BF8 33            [ 6] 1270 	inc	sp
   6BF9 C5            [11] 1271 	push	bc
   6BFA 33            [ 6] 1272 	inc	sp
   6BFB 21 00 C0      [10] 1273 	ld	hl,#0xC000
   6BFE E5            [11] 1274 	push	hl
   6BFF CD 93 65      [17] 1275 	call	_cpct_getScreenPtr
   6C02 45            [ 4] 1276 	ld	b,l
   6C03 5C            [ 4] 1277 	ld	e,h
                           1278 ;src/main.c:367: if(cu.eje == E_X){
   6C04 21 09 66      [10] 1279 	ld	hl, #_cu + 8
   6C07 4E            [ 7] 1280 	ld	c,(hl)
                           1281 ;src/main.c:368: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   6C08 DD 70 FE      [19] 1282 	ld	-2 (ix),b
   6C0B DD 73 FF      [19] 1283 	ld	-1 (ix),e
                           1284 ;src/main.c:367: if(cu.eje == E_X){
   6C0E 79            [ 4] 1285 	ld	a,c
   6C0F B7            [ 4] 1286 	or	a, a
   6C10 20 19         [12] 1287 	jr	NZ,00104$
                           1288 ;src/main.c:368: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   6C12 11 00 3E      [10] 1289 	ld	de,#_g_tablatrans+0
   6C15 ED 4B 05 66   [20] 1290 	ld	bc, (#(_cu + 0x0004) + 0)
   6C19 D5            [11] 1291 	push	de
   6C1A 21 04 04      [10] 1292 	ld	hl,#0x0404
   6C1D E5            [11] 1293 	push	hl
   6C1E DD 6E FE      [19] 1294 	ld	l,-2 (ix)
   6C21 DD 66 FF      [19] 1295 	ld	h,-1 (ix)
   6C24 E5            [11] 1296 	push	hl
   6C25 C5            [11] 1297 	push	bc
   6C26 CD B3 65      [17] 1298 	call	_cpct_drawSpriteMaskedAlignedTable
   6C29 18 1A         [12] 1299 	jr	00106$
   6C2B                    1300 00104$:
                           1301 ;src/main.c:371: else if(cu.eje == E_Y){
   6C2B 0D            [ 4] 1302 	dec	c
   6C2C 20 17         [12] 1303 	jr	NZ,00106$
                           1304 ;src/main.c:372: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   6C2E 11 00 3E      [10] 1305 	ld	de,#_g_tablatrans+0
   6C31 ED 4B 05 66   [20] 1306 	ld	bc, (#(_cu + 0x0004) + 0)
   6C35 D5            [11] 1307 	push	de
   6C36 21 02 08      [10] 1308 	ld	hl,#0x0802
   6C39 E5            [11] 1309 	push	hl
   6C3A DD 6E FE      [19] 1310 	ld	l,-2 (ix)
   6C3D DD 66 FF      [19] 1311 	ld	h,-1 (ix)
   6C40 E5            [11] 1312 	push	hl
   6C41 C5            [11] 1313 	push	bc
   6C42 CD B3 65      [17] 1314 	call	_cpct_drawSpriteMaskedAlignedTable
   6C45                    1315 00106$:
   6C45 DD F9         [10] 1316 	ld	sp, ix
   6C47 DD E1         [14] 1317 	pop	ix
   6C49 C9            [10] 1318 	ret
                           1319 ;src/main.c:376: void borrarCuchillo() {
                           1320 ;	---------------------------------
                           1321 ; Function borrarCuchillo
                           1322 ; ---------------------------------
   6C4A                    1323 _borrarCuchillo::
   6C4A DD E5         [15] 1324 	push	ix
   6C4C DD 21 00 00   [14] 1325 	ld	ix,#0
   6C50 DD 39         [15] 1326 	add	ix,sp
   6C52 3B            [ 6] 1327 	dec	sp
                           1328 ;src/main.c:378: u8 w = 2 + (cu.px & 1);
   6C53 21 03 66      [10] 1329 	ld	hl, #_cu + 2
   6C56 4E            [ 7] 1330 	ld	c,(hl)
   6C57 79            [ 4] 1331 	ld	a,c
   6C58 E6 01         [ 7] 1332 	and	a, #0x01
   6C5A 47            [ 4] 1333 	ld	b,a
   6C5B 04            [ 4] 1334 	inc	b
   6C5C 04            [ 4] 1335 	inc	b
                           1336 ;src/main.c:379: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   6C5D 21 04 66      [10] 1337 	ld	hl, #_cu + 3
   6C60 5E            [ 7] 1338 	ld	e,(hl)
   6C61 7B            [ 4] 1339 	ld	a,e
   6C62 E6 03         [ 7] 1340 	and	a, #0x03
   6C64 28 04         [12] 1341 	jr	Z,00105$
   6C66 3E 01         [ 7] 1342 	ld	a,#0x01
   6C68 18 02         [12] 1343 	jr	00106$
   6C6A                    1344 00105$:
   6C6A 3E 00         [ 7] 1345 	ld	a,#0x00
   6C6C                    1346 00106$:
   6C6C C6 02         [ 7] 1347 	add	a, #0x02
   6C6E DD 77 FF      [19] 1348 	ld	-1 (ix),a
                           1349 ;src/main.c:380: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   6C71 FD 2A 0B 66   [20] 1350 	ld	iy,(_mapa)
   6C75 16 00         [ 7] 1351 	ld	d,#0x00
   6C77 63            [ 4] 1352 	ld	h,e
   6C78 6A            [ 4] 1353 	ld	l,d
   6C79 CB 7A         [ 8] 1354 	bit	7, d
   6C7B 28 05         [12] 1355 	jr	Z,00107$
   6C7D 13            [ 6] 1356 	inc	de
   6C7E 13            [ 6] 1357 	inc	de
   6C7F 13            [ 6] 1358 	inc	de
   6C80 63            [ 4] 1359 	ld	h,e
   6C81 6A            [ 4] 1360 	ld	l,d
   6C82                    1361 00107$:
   6C82 5C            [ 4] 1362 	ld	e, h
   6C83 55            [ 4] 1363 	ld	d, l
   6C84 CB 2A         [ 8] 1364 	sra	d
   6C86 CB 1B         [ 8] 1365 	rr	e
   6C88 CB 2A         [ 8] 1366 	sra	d
   6C8A CB 1B         [ 8] 1367 	rr	e
   6C8C 51            [ 4] 1368 	ld	d,c
   6C8D CB 3A         [ 8] 1369 	srl	d
   6C8F FD E5         [15] 1370 	push	iy
   6C91 21 00 C0      [10] 1371 	ld	hl,#0xC000
   6C94 E5            [11] 1372 	push	hl
   6C95 3E 28         [ 7] 1373 	ld	a,#0x28
   6C97 F5            [11] 1374 	push	af
   6C98 33            [ 6] 1375 	inc	sp
   6C99 DD 7E FF      [19] 1376 	ld	a,-1 (ix)
   6C9C F5            [11] 1377 	push	af
   6C9D 33            [ 6] 1378 	inc	sp
   6C9E C5            [11] 1379 	push	bc
   6C9F 33            [ 6] 1380 	inc	sp
   6CA0 7B            [ 4] 1381 	ld	a,e
   6CA1 F5            [11] 1382 	push	af
   6CA2 33            [ 6] 1383 	inc	sp
   6CA3 D5            [11] 1384 	push	de
   6CA4 33            [ 6] 1385 	inc	sp
   6CA5 CD 8C 5A      [17] 1386 	call	_cpct_etm_drawTileBox2x4
                           1387 ;src/main.c:381: if(!cu.mover){
   6CA8 3A 0A 66      [13] 1388 	ld	a, (#_cu + 9)
   6CAB B7            [ 4] 1389 	or	a, a
   6CAC 20 05         [12] 1390 	jr	NZ,00103$
                           1391 ;src/main.c:382: cu.lanzado = NO;
   6CAE 21 07 66      [10] 1392 	ld	hl,#(_cu + 0x0006)
   6CB1 36 00         [10] 1393 	ld	(hl),#0x00
   6CB3                    1394 00103$:
   6CB3 33            [ 6] 1395 	inc	sp
   6CB4 DD E1         [14] 1396 	pop	ix
   6CB6 C9            [10] 1397 	ret
                           1398 ;src/main.c:386: void redibujarCuchillo( ) {
                           1399 ;	---------------------------------
                           1400 ; Function redibujarCuchillo
                           1401 ; ---------------------------------
   6CB7                    1402 _redibujarCuchillo::
                           1403 ;src/main.c:387: borrarCuchillo();
   6CB7 CD 4A 6C      [17] 1404 	call	_borrarCuchillo
                           1405 ;src/main.c:388: cu.px = cu.x;
   6CBA 01 03 66      [10] 1406 	ld	bc,#_cu + 2
   6CBD 3A 01 66      [13] 1407 	ld	a, (#_cu + 0)
   6CC0 02            [ 7] 1408 	ld	(bc),a
                           1409 ;src/main.c:389: cu.py = cu.y;
   6CC1 01 04 66      [10] 1410 	ld	bc,#_cu + 3
   6CC4 3A 02 66      [13] 1411 	ld	a, (#_cu + 1)
   6CC7 02            [ 7] 1412 	ld	(bc),a
                           1413 ;src/main.c:390: dibujarCuchillo();
   6CC8 C3 E6 6B      [10] 1414 	jp  _dibujarCuchillo
                           1415 ;src/main.c:394: void lanzarCuchillo(){
                           1416 ;	---------------------------------
                           1417 ; Function lanzarCuchillo
                           1418 ; ---------------------------------
   6CCB                    1419 _lanzarCuchillo::
                           1420 ;src/main.c:396: if(!cu.lanzado){
   6CCB 3A 07 66      [13] 1421 	ld	a, (#(_cu + 0x0006) + 0)
   6CCE B7            [ 4] 1422 	or	a, a
   6CCF C0            [11] 1423 	ret	NZ
                           1424 ;src/main.c:398: if(prota.mira == M_derecha){
   6CD0 21 00 66      [10] 1425 	ld	hl, #_prota + 7
   6CD3 5E            [ 7] 1426 	ld	e,(hl)
                           1427 ;src/main.c:399: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   6CD4 01 FA 65      [10] 1428 	ld	bc,#_prota + 1
                           1429 ;src/main.c:401: cu.direccion = M_derecha;
                           1430 ;src/main.c:403: cu.y=prota.y + G_HERO_H /2;
                           1431 ;src/main.c:404: cu.sprite=g_knifeX_0;
                           1432 ;src/main.c:405: cu.eje = E_X;
                           1433 ;src/main.c:398: if(prota.mira == M_derecha){
   6CD7 7B            [ 4] 1434 	ld	a,e
   6CD8 B7            [ 4] 1435 	or	a, a
   6CD9 20 41         [12] 1436 	jr	NZ,00118$
                           1437 ;src/main.c:399: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   6CDB 0A            [ 7] 1438 	ld	a,(bc)
   6CDC C6 0B         [ 7] 1439 	add	a, #0x0B
   6CDE 5F            [ 4] 1440 	ld	e,a
   6CDF 3A F9 65      [13] 1441 	ld	a, (#_prota + 0)
   6CE2 C6 0C         [ 7] 1442 	add	a, #0x0C
   6CE4 6F            [ 4] 1443 	ld	l,a
   6CE5 C5            [11] 1444 	push	bc
   6CE6 7B            [ 4] 1445 	ld	a,e
   6CE7 F5            [11] 1446 	push	af
   6CE8 33            [ 6] 1447 	inc	sp
   6CE9 7D            [ 4] 1448 	ld	a,l
   6CEA F5            [11] 1449 	push	af
   6CEB 33            [ 6] 1450 	inc	sp
   6CEC CD C7 66      [17] 1451 	call	_getTilePtr
   6CEF F1            [10] 1452 	pop	af
   6CF0 C1            [10] 1453 	pop	bc
   6CF1 5E            [ 7] 1454 	ld	e,(hl)
   6CF2 3E 02         [ 7] 1455 	ld	a,#0x02
   6CF4 93            [ 4] 1456 	sub	a, e
   6CF5 D8            [11] 1457 	ret	C
                           1458 ;src/main.c:400: cu.lanzado = SI;
   6CF6 21 07 66      [10] 1459 	ld	hl,#(_cu + 0x0006)
   6CF9 36 01         [10] 1460 	ld	(hl),#0x01
                           1461 ;src/main.c:401: cu.direccion = M_derecha;
   6CFB 21 08 66      [10] 1462 	ld	hl,#(_cu + 0x0007)
   6CFE 36 00         [10] 1463 	ld	(hl),#0x00
                           1464 ;src/main.c:402: cu.x=prota.x + G_HERO_W;
   6D00 3A F9 65      [13] 1465 	ld	a, (#_prota + 0)
   6D03 C6 07         [ 7] 1466 	add	a, #0x07
   6D05 32 01 66      [13] 1467 	ld	(#_cu),a
                           1468 ;src/main.c:403: cu.y=prota.y + G_HERO_H /2;
   6D08 0A            [ 7] 1469 	ld	a,(bc)
   6D09 C6 0B         [ 7] 1470 	add	a, #0x0B
   6D0B 32 02 66      [13] 1471 	ld	(#(_cu + 0x0001)),a
                           1472 ;src/main.c:404: cu.sprite=g_knifeX_0;
   6D0E 21 C0 54      [10] 1473 	ld	hl,#_g_knifeX_0
   6D11 22 05 66      [16] 1474 	ld	((_cu + 0x0004)), hl
                           1475 ;src/main.c:405: cu.eje = E_X;
   6D14 21 09 66      [10] 1476 	ld	hl,#(_cu + 0x0008)
   6D17 36 00         [10] 1477 	ld	(hl),#0x00
                           1478 ;src/main.c:406: dibujarCuchillo();
   6D19 C3 E6 6B      [10] 1479 	jp  _dibujarCuchillo
   6D1C                    1480 00118$:
                           1481 ;src/main.c:409: else if(prota.mira == M_izquierda){
   6D1C 7B            [ 4] 1482 	ld	a,e
   6D1D 3D            [ 4] 1483 	dec	a
   6D1E 20 41         [12] 1484 	jr	NZ,00115$
                           1485 ;src/main.c:410: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   6D20 0A            [ 7] 1486 	ld	a,(bc)
   6D21 C6 0B         [ 7] 1487 	add	a, #0x0B
   6D23 5F            [ 4] 1488 	ld	e,a
   6D24 3A F9 65      [13] 1489 	ld	a, (#_prota + 0)
   6D27 C6 F6         [ 7] 1490 	add	a,#0xF6
   6D29 6F            [ 4] 1491 	ld	l,a
   6D2A C5            [11] 1492 	push	bc
   6D2B 7B            [ 4] 1493 	ld	a,e
   6D2C F5            [11] 1494 	push	af
   6D2D 33            [ 6] 1495 	inc	sp
   6D2E 7D            [ 4] 1496 	ld	a,l
   6D2F F5            [11] 1497 	push	af
   6D30 33            [ 6] 1498 	inc	sp
   6D31 CD C7 66      [17] 1499 	call	_getTilePtr
   6D34 F1            [10] 1500 	pop	af
   6D35 C1            [10] 1501 	pop	bc
   6D36 5E            [ 7] 1502 	ld	e,(hl)
   6D37 3E 02         [ 7] 1503 	ld	a,#0x02
   6D39 93            [ 4] 1504 	sub	a, e
   6D3A D8            [11] 1505 	ret	C
                           1506 ;src/main.c:411: cu.lanzado = SI;
   6D3B 21 07 66      [10] 1507 	ld	hl,#(_cu + 0x0006)
   6D3E 36 01         [10] 1508 	ld	(hl),#0x01
                           1509 ;src/main.c:412: cu.direccion = M_izquierda;
   6D40 21 08 66      [10] 1510 	ld	hl,#(_cu + 0x0007)
   6D43 36 01         [10] 1511 	ld	(hl),#0x01
                           1512 ;src/main.c:413: cu.x = prota.x - G_KNIFEX_0_W;
   6D45 3A F9 65      [13] 1513 	ld	a, (#_prota + 0)
   6D48 C6 FC         [ 7] 1514 	add	a,#0xFC
   6D4A 32 01 66      [13] 1515 	ld	(#_cu),a
                           1516 ;src/main.c:414: cu.y = prota.y + G_HERO_H /2;
   6D4D 0A            [ 7] 1517 	ld	a,(bc)
   6D4E C6 0B         [ 7] 1518 	add	a, #0x0B
   6D50 32 02 66      [13] 1519 	ld	(#(_cu + 0x0001)),a
                           1520 ;src/main.c:415: cu.sprite = g_knifeX_1;
   6D53 21 D0 54      [10] 1521 	ld	hl,#_g_knifeX_1
   6D56 22 05 66      [16] 1522 	ld	((_cu + 0x0004)), hl
                           1523 ;src/main.c:416: cu.eje = E_X;
   6D59 21 09 66      [10] 1524 	ld	hl,#(_cu + 0x0008)
   6D5C 36 00         [10] 1525 	ld	(hl),#0x00
                           1526 ;src/main.c:417: dibujarCuchillo();
   6D5E C3 E6 6B      [10] 1527 	jp  _dibujarCuchillo
   6D61                    1528 00115$:
                           1529 ;src/main.c:420: else if(prota.mira == M_abajo){
   6D61 7B            [ 4] 1530 	ld	a,e
   6D62 D6 03         [ 7] 1531 	sub	a, #0x03
   6D64 20 41         [12] 1532 	jr	NZ,00112$
                           1533 ;src/main.c:422: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   6D66 0A            [ 7] 1534 	ld	a,(bc)
   6D67 C6 1F         [ 7] 1535 	add	a, #0x1F
   6D69 5F            [ 4] 1536 	ld	e,a
   6D6A 3A F9 65      [13] 1537 	ld	a, (#_prota + 0)
   6D6D 57            [ 4] 1538 	ld	d,a
   6D6E 14            [ 4] 1539 	inc	d
   6D6F 14            [ 4] 1540 	inc	d
   6D70 14            [ 4] 1541 	inc	d
   6D71 C5            [11] 1542 	push	bc
   6D72 7B            [ 4] 1543 	ld	a,e
   6D73 F5            [11] 1544 	push	af
   6D74 33            [ 6] 1545 	inc	sp
   6D75 D5            [11] 1546 	push	de
   6D76 33            [ 6] 1547 	inc	sp
   6D77 CD C7 66      [17] 1548 	call	_getTilePtr
   6D7A F1            [10] 1549 	pop	af
   6D7B C1            [10] 1550 	pop	bc
   6D7C 5E            [ 7] 1551 	ld	e,(hl)
   6D7D 3E 02         [ 7] 1552 	ld	a,#0x02
   6D7F 93            [ 4] 1553 	sub	a, e
   6D80 D8            [11] 1554 	ret	C
                           1555 ;src/main.c:423: cu.lanzado = SI;
   6D81 21 07 66      [10] 1556 	ld	hl,#(_cu + 0x0006)
   6D84 36 01         [10] 1557 	ld	(hl),#0x01
                           1558 ;src/main.c:424: cu.direccion = M_abajo;
   6D86 21 08 66      [10] 1559 	ld	hl,#(_cu + 0x0007)
   6D89 36 03         [10] 1560 	ld	(hl),#0x03
                           1561 ;src/main.c:425: cu.x = prota.x + G_HERO_W / 2;
   6D8B 3A F9 65      [13] 1562 	ld	a, (#_prota + 0)
   6D8E C6 03         [ 7] 1563 	add	a, #0x03
   6D90 32 01 66      [13] 1564 	ld	(#_cu),a
                           1565 ;src/main.c:426: cu.y = prota.y + G_HERO_H;
   6D93 0A            [ 7] 1566 	ld	a,(bc)
   6D94 C6 16         [ 7] 1567 	add	a, #0x16
   6D96 32 02 66      [13] 1568 	ld	(#(_cu + 0x0001)),a
                           1569 ;src/main.c:427: cu.sprite = g_knifeY_0;
   6D99 21 A0 54      [10] 1570 	ld	hl,#_g_knifeY_0
   6D9C 22 05 66      [16] 1571 	ld	((_cu + 0x0004)), hl
                           1572 ;src/main.c:428: cu.eje = E_Y;
   6D9F 21 09 66      [10] 1573 	ld	hl,#(_cu + 0x0008)
   6DA2 36 01         [10] 1574 	ld	(hl),#0x01
                           1575 ;src/main.c:429: dibujarCuchillo();
   6DA4 C3 E6 6B      [10] 1576 	jp  _dibujarCuchillo
   6DA7                    1577 00112$:
                           1578 ;src/main.c:432: else if(prota.mira == M_arriba){
   6DA7 7B            [ 4] 1579 	ld	a,e
   6DA8 D6 02         [ 7] 1580 	sub	a, #0x02
   6DAA C0            [11] 1581 	ret	NZ
                           1582 ;src/main.c:433: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   6DAB 0A            [ 7] 1583 	ld	a,(bc)
   6DAC C6 F7         [ 7] 1584 	add	a,#0xF7
   6DAE 57            [ 4] 1585 	ld	d,a
   6DAF 3A F9 65      [13] 1586 	ld	a, (#_prota + 0)
   6DB2 C6 03         [ 7] 1587 	add	a, #0x03
   6DB4 C5            [11] 1588 	push	bc
   6DB5 D5            [11] 1589 	push	de
   6DB6 33            [ 6] 1590 	inc	sp
   6DB7 F5            [11] 1591 	push	af
   6DB8 33            [ 6] 1592 	inc	sp
   6DB9 CD C7 66      [17] 1593 	call	_getTilePtr
   6DBC F1            [10] 1594 	pop	af
   6DBD C1            [10] 1595 	pop	bc
   6DBE 5E            [ 7] 1596 	ld	e,(hl)
   6DBF 3E 02         [ 7] 1597 	ld	a,#0x02
   6DC1 93            [ 4] 1598 	sub	a, e
   6DC2 D8            [11] 1599 	ret	C
                           1600 ;src/main.c:434: cu.lanzado = SI;
   6DC3 21 07 66      [10] 1601 	ld	hl,#(_cu + 0x0006)
   6DC6 36 01         [10] 1602 	ld	(hl),#0x01
                           1603 ;src/main.c:435: cu.direccion = M_arriba;
   6DC8 21 08 66      [10] 1604 	ld	hl,#(_cu + 0x0007)
   6DCB 36 02         [10] 1605 	ld	(hl),#0x02
                           1606 ;src/main.c:436: cu.x = prota.x + G_HERO_W / 2;
   6DCD 3A F9 65      [13] 1607 	ld	a, (#_prota + 0)
   6DD0 C6 03         [ 7] 1608 	add	a, #0x03
   6DD2 32 01 66      [13] 1609 	ld	(#_cu),a
                           1610 ;src/main.c:437: cu.y = prota.y;
   6DD5 0A            [ 7] 1611 	ld	a,(bc)
   6DD6 32 02 66      [13] 1612 	ld	(#(_cu + 0x0001)),a
                           1613 ;src/main.c:438: cu.sprite = g_knifeY_1;
   6DD9 21 B0 54      [10] 1614 	ld	hl,#_g_knifeY_1
   6DDC 22 05 66      [16] 1615 	ld	((_cu + 0x0004)), hl
                           1616 ;src/main.c:439: cu.eje = E_Y;
   6DDF 21 09 66      [10] 1617 	ld	hl,#(_cu + 0x0008)
   6DE2 36 01         [10] 1618 	ld	(hl),#0x01
                           1619 ;src/main.c:440: dibujarCuchillo();
   6DE4 C3 E6 6B      [10] 1620 	jp  _dibujarCuchillo
                           1621 ;src/main.c:446: void comprobarTeclado() {
                           1622 ;	---------------------------------
                           1623 ; Function comprobarTeclado
                           1624 ; ---------------------------------
   6DE7                    1625 _comprobarTeclado::
                           1626 ;src/main.c:447: cpct_scanKeyboard_if();
   6DE7 CD E4 5B      [17] 1627 	call	_cpct_scanKeyboard_if
                           1628 ;src/main.c:449: if (cpct_isAnyKeyPressed()) {
   6DEA CD D7 5B      [17] 1629 	call	_cpct_isAnyKeyPressed
   6DED 7D            [ 4] 1630 	ld	a,l
   6DEE B7            [ 4] 1631 	or	a, a
   6DEF C8            [11] 1632 	ret	Z
                           1633 ;src/main.c:450: if (cpct_isKeyPressed(Key_CursorLeft))
   6DF0 21 01 01      [10] 1634 	ld	hl,#0x0101
   6DF3 CD 41 59      [17] 1635 	call	_cpct_isKeyPressed
   6DF6 7D            [ 4] 1636 	ld	a,l
   6DF7 B7            [ 4] 1637 	or	a, a
                           1638 ;src/main.c:451: moverIzquierda();
   6DF8 C2 1E 6B      [10] 1639 	jp	NZ,_moverIzquierda
                           1640 ;src/main.c:452: else if (cpct_isKeyPressed(Key_CursorRight))
   6DFB 21 00 02      [10] 1641 	ld	hl,#0x0200
   6DFE CD 41 59      [17] 1642 	call	_cpct_isKeyPressed
   6E01 7D            [ 4] 1643 	ld	a,l
   6E02 B7            [ 4] 1644 	or	a, a
                           1645 ;src/main.c:453: moverDerecha();
   6E03 C2 43 6B      [10] 1646 	jp	NZ,_moverDerecha
                           1647 ;src/main.c:454: else if (cpct_isKeyPressed(Key_CursorUp))
   6E06 21 00 01      [10] 1648 	ld	hl,#0x0100
   6E09 CD 41 59      [17] 1649 	call	_cpct_isKeyPressed
   6E0C 7D            [ 4] 1650 	ld	a,l
   6E0D B7            [ 4] 1651 	or	a, a
                           1652 ;src/main.c:455: moverArriba();
   6E0E C2 89 6B      [10] 1653 	jp	NZ,_moverArriba
                           1654 ;src/main.c:456: else if (cpct_isKeyPressed(Key_CursorDown))
   6E11 21 00 04      [10] 1655 	ld	hl,#0x0400
   6E14 CD 41 59      [17] 1656 	call	_cpct_isKeyPressed
   6E17 7D            [ 4] 1657 	ld	a,l
   6E18 B7            [ 4] 1658 	or	a, a
                           1659 ;src/main.c:457: moverAbajo();
   6E19 C2 AD 6B      [10] 1660 	jp	NZ,_moverAbajo
                           1661 ;src/main.c:458: else if (cpct_isKeyPressed(Key_Space))
   6E1C 21 05 80      [10] 1662 	ld	hl,#0x8005
   6E1F CD 41 59      [17] 1663 	call	_cpct_isKeyPressed
   6E22 7D            [ 4] 1664 	ld	a,l
   6E23 B7            [ 4] 1665 	or	a, a
   6E24 C8            [11] 1666 	ret	Z
                           1667 ;src/main.c:459: lanzarCuchillo();
   6E25 C3 CB 6C      [10] 1668 	jp  _lanzarCuchillo
                           1669 ;src/main.c:463: u8 checkKnifeCollision(int direction){
                           1670 ;	---------------------------------
                           1671 ; Function checkKnifeCollision
                           1672 ; ---------------------------------
   6E28                    1673 _checkKnifeCollision::
   6E28 DD E5         [15] 1674 	push	ix
   6E2A DD 21 00 00   [14] 1675 	ld	ix,#0
   6E2E DD 39         [15] 1676 	add	ix,sp
                           1677 ;src/main.c:465: u8 colisiona = 1;
   6E30 0E 01         [ 7] 1678 	ld	c,#0x01
                           1679 ;src/main.c:467: switch (direction) {
   6E32 DD CB 05 7E   [20] 1680 	bit	7, 5 (ix)
   6E36 C2 22 6F      [10] 1681 	jp	NZ,00125$
   6E39 3E 03         [ 7] 1682 	ld	a,#0x03
   6E3B DD BE 04      [19] 1683 	cp	a, 4 (ix)
   6E3E 3E 00         [ 7] 1684 	ld	a,#0x00
   6E40 DD 9E 05      [19] 1685 	sbc	a, 5 (ix)
   6E43 E2 48 6E      [10] 1686 	jp	PO, 00163$
   6E46 EE 80         [ 7] 1687 	xor	a, #0x80
   6E48                    1688 00163$:
   6E48 FA 22 6F      [10] 1689 	jp	M,00125$
   6E4B DD 5E 04      [19] 1690 	ld	e,4 (ix)
   6E4E 16 00         [ 7] 1691 	ld	d,#0x00
   6E50 21 57 6E      [10] 1692 	ld	hl,#00164$
   6E53 19            [11] 1693 	add	hl,de
   6E54 19            [11] 1694 	add	hl,de
   6E55 19            [11] 1695 	add	hl,de
   6E56 E9            [ 4] 1696 	jp	(hl)
   6E57                    1697 00164$:
   6E57 C3 22 6F      [10] 1698 	jp	00125$
   6E5A C3 22 6F      [10] 1699 	jp	00125$
   6E5D C3 69 6E      [10] 1700 	jp	00103$
   6E60 C3 C0 6E      [10] 1701 	jp	00114$
                           1702 ;src/main.c:468: case 0:
                           1703 ;src/main.c:470: break;
   6E63 C3 22 6F      [10] 1704 	jp	00125$
                           1705 ;src/main.c:471: case 1:
                           1706 ;src/main.c:473: break;
   6E66 C3 22 6F      [10] 1707 	jp	00125$
                           1708 ;src/main.c:474: case 2:
   6E69                    1709 00103$:
                           1710 ;src/main.c:476: if((enemy.x + G_ENEMY_W) < cu.x || enemy.x  > (cu.x + G_KNIFEX_0_W)){
   6E69 21 F0 65      [10] 1711 	ld	hl,#_enemy+0
   6E6C 4E            [ 7] 1712 	ld	c,(hl)
   6E6D 06 00         [ 7] 1713 	ld	b,#0x00
   6E6F 21 04 00      [10] 1714 	ld	hl,#0x0004
   6E72 09            [11] 1715 	add	hl,bc
   6E73 EB            [ 4] 1716 	ex	de,hl
   6E74 21 01 66      [10] 1717 	ld	hl,#_cu+0
   6E77 6E            [ 7] 1718 	ld	l,(hl)
   6E78 26 00         [ 7] 1719 	ld	h,#0x00
   6E7A 7B            [ 4] 1720 	ld	a,e
   6E7B 95            [ 4] 1721 	sub	a, l
   6E7C 7A            [ 4] 1722 	ld	a,d
   6E7D 9C            [ 4] 1723 	sbc	a, h
   6E7E E2 83 6E      [10] 1724 	jp	PO, 00165$
   6E81 EE 80         [ 7] 1725 	xor	a, #0x80
   6E83                    1726 00165$:
   6E83 FA C0 6E      [10] 1727 	jp	M,00114$
   6E86 11 04 00      [10] 1728 	ld	de,#0x0004
   6E89 19            [11] 1729 	add	hl,de
   6E8A 7D            [ 4] 1730 	ld	a,l
   6E8B 91            [ 4] 1731 	sub	a, c
   6E8C 7C            [ 4] 1732 	ld	a,h
   6E8D 98            [ 4] 1733 	sbc	a, b
   6E8E E2 93 6E      [10] 1734 	jp	PO, 00166$
   6E91 EE 80         [ 7] 1735 	xor	a, #0x80
   6E93                    1736 00166$:
   6E93 FA C0 6E      [10] 1737 	jp	M,00114$
                           1738 ;src/main.c:479: if(cu.y>enemy.y){
   6E96 21 02 66      [10] 1739 	ld	hl, #(_cu + 0x0001) + 0
   6E99 4E            [ 7] 1740 	ld	c,(hl)
   6E9A 21 F1 65      [10] 1741 	ld	hl, #_enemy + 1
   6E9D 5E            [ 7] 1742 	ld	e,(hl)
   6E9E 7B            [ 4] 1743 	ld	a,e
   6E9F 91            [ 4] 1744 	sub	a, c
   6EA0 30 1E         [12] 1745 	jr	NC,00114$
                           1746 ;src/main.c:480: if(cu.y - (enemy.y + G_ENEMY_H) >= 2){
   6EA2 06 00         [ 7] 1747 	ld	b,#0x00
   6EA4 16 00         [ 7] 1748 	ld	d,#0x00
   6EA6 21 16 00      [10] 1749 	ld	hl,#0x0016
   6EA9 19            [11] 1750 	add	hl,de
   6EAA 79            [ 4] 1751 	ld	a,c
   6EAB 95            [ 4] 1752 	sub	a, l
   6EAC 4F            [ 4] 1753 	ld	c,a
   6EAD 78            [ 4] 1754 	ld	a,b
   6EAE 9C            [ 4] 1755 	sbc	a, h
   6EAF 47            [ 4] 1756 	ld	b,a
   6EB0 79            [ 4] 1757 	ld	a,c
   6EB1 D6 02         [ 7] 1758 	sub	a, #0x02
   6EB3 78            [ 4] 1759 	ld	a,b
   6EB4 17            [ 4] 1760 	rla
   6EB5 3F            [ 4] 1761 	ccf
   6EB6 1F            [ 4] 1762 	rra
   6EB7 DE 80         [ 7] 1763 	sbc	a, #0x80
   6EB9 30 05         [12] 1764 	jr	NC,00114$
                           1765 ;src/main.c:485: enemy.muerto = SI;
   6EBB 21 F8 65      [10] 1766 	ld	hl,#(_enemy + 0x0008)
   6EBE 36 01         [10] 1767 	ld	(hl),#0x01
                           1768 ;src/main.c:492: case 3:
   6EC0                    1769 00114$:
                           1770 ;src/main.c:494: if((enemy.x + G_ENEMY_W) < cu.x || enemy.x  > (cu.x + G_KNIFEX_0_W)){
   6EC0 21 F0 65      [10] 1771 	ld	hl, #_enemy + 0
   6EC3 4E            [ 7] 1772 	ld	c,(hl)
   6EC4 06 00         [ 7] 1773 	ld	b,#0x00
   6EC6 21 04 00      [10] 1774 	ld	hl,#0x0004
   6EC9 09            [11] 1775 	add	hl,bc
   6ECA EB            [ 4] 1776 	ex	de,hl
   6ECB 21 01 66      [10] 1777 	ld	hl, #_cu + 0
   6ECE 6E            [ 7] 1778 	ld	l,(hl)
   6ECF 26 00         [ 7] 1779 	ld	h,#0x00
   6ED1 7B            [ 4] 1780 	ld	a,e
   6ED2 95            [ 4] 1781 	sub	a, l
   6ED3 7A            [ 4] 1782 	ld	a,d
   6ED4 9C            [ 4] 1783 	sbc	a, h
   6ED5 E2 DA 6E      [10] 1784 	jp	PO, 00167$
   6ED8 EE 80         [ 7] 1785 	xor	a, #0x80
   6EDA                    1786 00167$:
   6EDA FA ED 6E      [10] 1787 	jp	M,00121$
   6EDD 11 04 00      [10] 1788 	ld	de,#0x0004
   6EE0 19            [11] 1789 	add	hl,de
   6EE1 7D            [ 4] 1790 	ld	a,l
   6EE2 91            [ 4] 1791 	sub	a, c
   6EE3 7C            [ 4] 1792 	ld	a,h
   6EE4 98            [ 4] 1793 	sbc	a, b
   6EE5 E2 EA 6E      [10] 1794 	jp	PO, 00168$
   6EE8 EE 80         [ 7] 1795 	xor	a, #0x80
   6EEA                    1796 00168$:
   6EEA F2 F1 6E      [10] 1797 	jp	P,00122$
   6EED                    1798 00121$:
                           1799 ;src/main.c:495: colisiona = 0;
   6EED 0E 00         [ 7] 1800 	ld	c,#0x00
   6EEF 18 31         [12] 1801 	jr	00125$
   6EF1                    1802 00122$:
                           1803 ;src/main.c:497: if(cu.y<enemy.y){
   6EF1 21 02 66      [10] 1804 	ld	hl, #(_cu + 0x0001) + 0
   6EF4 4E            [ 7] 1805 	ld	c,(hl)
   6EF5 21 F1 65      [10] 1806 	ld	hl, #_enemy + 1
   6EF8 6E            [ 7] 1807 	ld	l,(hl)
   6EF9 79            [ 4] 1808 	ld	a,c
   6EFA 95            [ 4] 1809 	sub	a, l
   6EFB 30 23         [12] 1810 	jr	NC,00119$
                           1811 ;src/main.c:498: if(enemy.y - (cu.y + G_KNIFEX_0_H - 2) >= 2){
   6EFD 26 00         [ 7] 1812 	ld	h,#0x00
   6EFF 06 00         [ 7] 1813 	ld	b,#0x00
   6F01 03            [ 6] 1814 	inc	bc
   6F02 03            [ 6] 1815 	inc	bc
   6F03 BF            [ 4] 1816 	cp	a, a
   6F04 ED 42         [15] 1817 	sbc	hl, bc
   6F06 11 02 80      [10] 1818 	ld	de, #0x8002
   6F09 29            [11] 1819 	add	hl, hl
   6F0A 3F            [ 4] 1820 	ccf
   6F0B CB 1C         [ 8] 1821 	rr	h
   6F0D CB 1D         [ 8] 1822 	rr	l
   6F0F ED 52         [15] 1823 	sbc	hl, de
   6F11 38 04         [12] 1824 	jr	C,00116$
                           1825 ;src/main.c:499: colisiona = 0;
   6F13 0E 00         [ 7] 1826 	ld	c,#0x00
   6F15 18 0B         [12] 1827 	jr	00125$
   6F17                    1828 00116$:
                           1829 ;src/main.c:501: colisiona = 1;
   6F17 0E 01         [ 7] 1830 	ld	c,#0x01
                           1831 ;src/main.c:502: enemy.muerto = SI;
   6F19 21 F8 65      [10] 1832 	ld	hl,#(_enemy + 0x0008)
   6F1C 36 01         [10] 1833 	ld	(hl),#0x01
   6F1E 18 02         [12] 1834 	jr	00125$
   6F20                    1835 00119$:
                           1836 ;src/main.c:505: colisiona = 0;	
   6F20 0E 00         [ 7] 1837 	ld	c,#0x00
                           1838 ;src/main.c:508: }
   6F22                    1839 00125$:
                           1840 ;src/main.c:509: return colisiona;
   6F22 69            [ 4] 1841 	ld	l,c
   6F23 DD E1         [14] 1842 	pop	ix
   6F25 C9            [10] 1843 	ret
                           1844 ;src/main.c:512: void moverCuchillo(){
                           1845 ;	---------------------------------
                           1846 ; Function moverCuchillo
                           1847 ; ---------------------------------
   6F26                    1848 _moverCuchillo::
                           1849 ;src/main.c:514: if(cu.lanzado){
   6F26 01 01 66      [10] 1850 	ld	bc,#_cu+0
   6F29 3A 07 66      [13] 1851 	ld	a, (#_cu + 6)
   6F2C B7            [ 4] 1852 	or	a, a
   6F2D C8            [11] 1853 	ret	Z
                           1854 ;src/main.c:515: cu.mover = 1;
   6F2E 21 0A 66      [10] 1855 	ld	hl,#(_cu + 0x0009)
   6F31 36 01         [10] 1856 	ld	(hl),#0x01
                           1857 ;src/main.c:516: if(cu.direccion == M_derecha){
   6F33 21 08 66      [10] 1858 	ld	hl, #_cu + 7
   6F36 6E            [ 7] 1859 	ld	l,(hl)
                           1860 ;src/main.c:518: if( *getTilePtr(cu.x + G_KNIFEX_0_W + 1, cu.y) <= 2){
   6F37 59            [ 4] 1861 	ld	e, c
   6F38 50            [ 4] 1862 	ld	d, b
   6F39 13            [ 6] 1863 	inc	de
                           1864 ;src/main.c:516: if(cu.direccion == M_derecha){
   6F3A 7D            [ 4] 1865 	ld	a,l
   6F3B B7            [ 4] 1866 	or	a, a
   6F3C 20 27         [12] 1867 	jr	NZ,00128$
                           1868 ;src/main.c:518: if( *getTilePtr(cu.x + G_KNIFEX_0_W + 1, cu.y) <= 2){
   6F3E 1A            [ 7] 1869 	ld	a,(de)
   6F3F 5F            [ 4] 1870 	ld	e,a
   6F40 0A            [ 7] 1871 	ld	a,(bc)
   6F41 C6 05         [ 7] 1872 	add	a, #0x05
   6F43 6F            [ 4] 1873 	ld	l,a
   6F44 C5            [11] 1874 	push	bc
   6F45 7B            [ 4] 1875 	ld	a,e
   6F46 F5            [11] 1876 	push	af
   6F47 33            [ 6] 1877 	inc	sp
   6F48 7D            [ 4] 1878 	ld	a,l
   6F49 F5            [11] 1879 	push	af
   6F4A 33            [ 6] 1880 	inc	sp
   6F4B CD C7 66      [17] 1881 	call	_getTilePtr
   6F4E F1            [10] 1882 	pop	af
   6F4F C1            [10] 1883 	pop	bc
   6F50 5E            [ 7] 1884 	ld	e,(hl)
   6F51 3E 02         [ 7] 1885 	ld	a,#0x02
   6F53 93            [ 4] 1886 	sub	a, e
   6F54 38 09         [12] 1887 	jr	C,00102$
                           1888 ;src/main.c:519: cu.x++;
   6F56 0A            [ 7] 1889 	ld	a,(bc)
   6F57 3C            [ 4] 1890 	inc	a
   6F58 02            [ 7] 1891 	ld	(bc),a
                           1892 ;src/main.c:520: cu.mover = SI;
   6F59 21 0A 66      [10] 1893 	ld	hl,#(_cu + 0x0009)
   6F5C 36 01         [10] 1894 	ld	(hl),#0x01
   6F5E C9            [10] 1895 	ret
   6F5F                    1896 00102$:
                           1897 ;src/main.c:524: cu.mover=NO;
   6F5F 21 0A 66      [10] 1898 	ld	hl,#(_cu + 0x0009)
   6F62 36 00         [10] 1899 	ld	(hl),#0x00
   6F64 C9            [10] 1900 	ret
   6F65                    1901 00128$:
                           1902 ;src/main.c:527: else if(cu.direccion == M_izquierda){
   6F65 7D            [ 4] 1903 	ld	a,l
   6F66 3D            [ 4] 1904 	dec	a
   6F67 20 26         [12] 1905 	jr	NZ,00125$
                           1906 ;src/main.c:528: if(*getTilePtr(cu.x - 1, cu.y) <= 2){
   6F69 1A            [ 7] 1907 	ld	a,(de)
   6F6A 5F            [ 4] 1908 	ld	e,a
   6F6B 0A            [ 7] 1909 	ld	a,(bc)
   6F6C 57            [ 4] 1910 	ld	d,a
   6F6D 15            [ 4] 1911 	dec	d
   6F6E C5            [11] 1912 	push	bc
   6F6F 7B            [ 4] 1913 	ld	a,e
   6F70 F5            [11] 1914 	push	af
   6F71 33            [ 6] 1915 	inc	sp
   6F72 D5            [11] 1916 	push	de
   6F73 33            [ 6] 1917 	inc	sp
   6F74 CD C7 66      [17] 1918 	call	_getTilePtr
   6F77 F1            [10] 1919 	pop	af
   6F78 C1            [10] 1920 	pop	bc
   6F79 5E            [ 7] 1921 	ld	e,(hl)
   6F7A 3E 02         [ 7] 1922 	ld	a,#0x02
   6F7C 93            [ 4] 1923 	sub	a, e
   6F7D 38 0A         [12] 1924 	jr	C,00105$
                           1925 ;src/main.c:529: cu.x--;
   6F7F 0A            [ 7] 1926 	ld	a,(bc)
   6F80 C6 FF         [ 7] 1927 	add	a,#0xFF
   6F82 02            [ 7] 1928 	ld	(bc),a
                           1929 ;src/main.c:530: cu.mover = SI;
   6F83 21 0A 66      [10] 1930 	ld	hl,#(_cu + 0x0009)
   6F86 36 01         [10] 1931 	ld	(hl),#0x01
   6F88 C9            [10] 1932 	ret
   6F89                    1933 00105$:
                           1934 ;src/main.c:533: cu.mover=NO;
   6F89 21 0A 66      [10] 1935 	ld	hl,#(_cu + 0x0009)
   6F8C 36 00         [10] 1936 	ld	(hl),#0x00
   6F8E C9            [10] 1937 	ret
   6F8F                    1938 00125$:
                           1939 ;src/main.c:536: else if(cu.direccion == M_arriba){
   6F8F 7D            [ 4] 1940 	ld	a,l
   6F90 D6 02         [ 7] 1941 	sub	a, #0x02
   6F92 20 3E         [12] 1942 	jr	NZ,00122$
                           1943 ;src/main.c:537: if(*getTilePtr(cu.x, cu.y - 2) <= 2){
   6F94 1A            [ 7] 1944 	ld	a,(de)
   6F95 C6 FE         [ 7] 1945 	add	a,#0xFE
   6F97 F5            [11] 1946 	push	af
   6F98 0A            [ 7] 1947 	ld	a,(bc)
   6F99 47            [ 4] 1948 	ld	b,a
   6F9A F1            [10] 1949 	pop	af
   6F9B D5            [11] 1950 	push	de
   6F9C F5            [11] 1951 	push	af
   6F9D 33            [ 6] 1952 	inc	sp
   6F9E C5            [11] 1953 	push	bc
   6F9F 33            [ 6] 1954 	inc	sp
   6FA0 CD C7 66      [17] 1955 	call	_getTilePtr
   6FA3 F1            [10] 1956 	pop	af
   6FA4 D1            [10] 1957 	pop	de
   6FA5 4E            [ 7] 1958 	ld	c,(hl)
   6FA6 3E 02         [ 7] 1959 	ld	a,#0x02
   6FA8 91            [ 4] 1960 	sub	a, c
   6FA9 38 21         [12] 1961 	jr	C,00111$
                           1962 ;src/main.c:538: if(!checkKnifeCollision(M_arriba)){
   6FAB D5            [11] 1963 	push	de
   6FAC 21 02 00      [10] 1964 	ld	hl,#0x0002
   6FAF E5            [11] 1965 	push	hl
   6FB0 CD 28 6E      [17] 1966 	call	_checkKnifeCollision
   6FB3 F1            [10] 1967 	pop	af
   6FB4 D1            [10] 1968 	pop	de
   6FB5 7D            [ 4] 1969 	ld	a,l
   6FB6 B7            [ 4] 1970 	or	a, a
   6FB7 20 0D         [12] 1971 	jr	NZ,00108$
                           1972 ;src/main.c:539: cu.y--;
   6FB9 1A            [ 7] 1973 	ld	a,(de)
   6FBA C6 FF         [ 7] 1974 	add	a,#0xFF
   6FBC 12            [ 7] 1975 	ld	(de),a
                           1976 ;src/main.c:540: cu.y--;
   6FBD C6 FF         [ 7] 1977 	add	a,#0xFF
   6FBF 12            [ 7] 1978 	ld	(de),a
                           1979 ;src/main.c:541: cu.mover = SI;
   6FC0 21 0A 66      [10] 1980 	ld	hl,#(_cu + 0x0009)
   6FC3 36 01         [10] 1981 	ld	(hl),#0x01
   6FC5 C9            [10] 1982 	ret
   6FC6                    1983 00108$:
                           1984 ;src/main.c:544: cu.mover=NO;
   6FC6 21 0A 66      [10] 1985 	ld	hl,#(_cu + 0x0009)
   6FC9 36 00         [10] 1986 	ld	(hl),#0x00
   6FCB C9            [10] 1987 	ret
   6FCC                    1988 00111$:
                           1989 ;src/main.c:547: cu.mover=NO;
   6FCC 21 0A 66      [10] 1990 	ld	hl,#(_cu + 0x0009)
   6FCF 36 00         [10] 1991 	ld	(hl),#0x00
   6FD1 C9            [10] 1992 	ret
   6FD2                    1993 00122$:
                           1994 ;src/main.c:552: else if(cu.direccion == M_abajo){
   6FD2 7D            [ 4] 1995 	ld	a,l
   6FD3 D6 03         [ 7] 1996 	sub	a, #0x03
   6FD5 C0            [11] 1997 	ret	NZ
                           1998 ;src/main.c:553: if(*getTilePtr(cu.x, cu.y + G_KNIFEY_0_H + 2) <= 2){
   6FD6 1A            [ 7] 1999 	ld	a,(de)
   6FD7 C6 0A         [ 7] 2000 	add	a, #0x0A
   6FD9 F5            [11] 2001 	push	af
   6FDA 0A            [ 7] 2002 	ld	a,(bc)
   6FDB 47            [ 4] 2003 	ld	b,a
   6FDC F1            [10] 2004 	pop	af
   6FDD D5            [11] 2005 	push	de
   6FDE F5            [11] 2006 	push	af
   6FDF 33            [ 6] 2007 	inc	sp
   6FE0 C5            [11] 2008 	push	bc
   6FE1 33            [ 6] 2009 	inc	sp
   6FE2 CD C7 66      [17] 2010 	call	_getTilePtr
   6FE5 F1            [10] 2011 	pop	af
   6FE6 D1            [10] 2012 	pop	de
   6FE7 4E            [ 7] 2013 	ld	c,(hl)
   6FE8 3E 02         [ 7] 2014 	ld	a,#0x02
   6FEA 91            [ 4] 2015 	sub	a, c
   6FEB 38 1F         [12] 2016 	jr	C,00117$
                           2017 ;src/main.c:554: if(!checkKnifeCollision(M_abajo)){
   6FED D5            [11] 2018 	push	de
   6FEE 21 03 00      [10] 2019 	ld	hl,#0x0003
   6FF1 E5            [11] 2020 	push	hl
   6FF2 CD 28 6E      [17] 2021 	call	_checkKnifeCollision
   6FF5 F1            [10] 2022 	pop	af
   6FF6 D1            [10] 2023 	pop	de
   6FF7 7D            [ 4] 2024 	ld	a,l
   6FF8 B7            [ 4] 2025 	or	a, a
   6FF9 20 0B         [12] 2026 	jr	NZ,00114$
                           2027 ;src/main.c:555: cu.y++;
   6FFB 1A            [ 7] 2028 	ld	a,(de)
   6FFC 3C            [ 4] 2029 	inc	a
   6FFD 12            [ 7] 2030 	ld	(de),a
                           2031 ;src/main.c:556: cu.y++;
   6FFE 3C            [ 4] 2032 	inc	a
   6FFF 12            [ 7] 2033 	ld	(de),a
                           2034 ;src/main.c:557: cu.mover = SI;
   7000 21 0A 66      [10] 2035 	ld	hl,#(_cu + 0x0009)
   7003 36 01         [10] 2036 	ld	(hl),#0x01
   7005 C9            [10] 2037 	ret
   7006                    2038 00114$:
                           2039 ;src/main.c:560: cu.mover=NO;					
   7006 21 0A 66      [10] 2040 	ld	hl,#(_cu + 0x0009)
   7009 36 00         [10] 2041 	ld	(hl),#0x00
   700B C9            [10] 2042 	ret
   700C                    2043 00117$:
                           2044 ;src/main.c:563: cu.mover=NO;
   700C 21 0A 66      [10] 2045 	ld	hl,#(_cu + 0x0009)
   700F 36 00         [10] 2046 	ld	(hl),#0x00
   7011 C9            [10] 2047 	ret
                           2048 ;src/main.c:568: void barraPuntuacionInicial(){
                           2049 ;	---------------------------------
                           2050 ; Function barraPuntuacionInicial
                           2051 ; ---------------------------------
   7012                    2052 _barraPuntuacionInicial::
                           2053 ;src/main.c:573: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 178); // 
   7012 21 00 B2      [10] 2054 	ld	hl,#0xB200
   7015 E5            [11] 2055 	push	hl
   7016 26 C0         [ 7] 2056 	ld	h, #0xC0
   7018 E5            [11] 2057 	push	hl
   7019 CD 93 65      [17] 2058 	call	_cpct_getScreenPtr
   701C 4D            [ 4] 2059 	ld	c,l
   701D 44            [ 4] 2060 	ld	b,h
                           2061 ;src/main.c:574: cpct_drawStringM0("SCORE", memptr, 1, 0);
   701E 21 01 00      [10] 2062 	ld	hl,#0x0001
   7021 E5            [11] 2063 	push	hl
   7022 C5            [11] 2064 	push	bc
   7023 21 BA 70      [10] 2065 	ld	hl,#___str_0
   7026 E5            [11] 2066 	push	hl
   7027 CD C3 59      [17] 2067 	call	_cpct_drawStringM0
   702A 21 06 00      [10] 2068 	ld	hl,#6
   702D 39            [11] 2069 	add	hl,sp
   702E F9            [ 6] 2070 	ld	sp,hl
                           2071 ;src/main.c:575: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 190); // puntuación inicial
   702F 21 00 BE      [10] 2072 	ld	hl,#0xBE00
   7032 E5            [11] 2073 	push	hl
   7033 26 C0         [ 7] 2074 	ld	h, #0xC0
   7035 E5            [11] 2075 	push	hl
   7036 CD 93 65      [17] 2076 	call	_cpct_getScreenPtr
   7039 4D            [ 4] 2077 	ld	c,l
   703A 44            [ 4] 2078 	ld	b,h
                           2079 ;src/main.c:576: cpct_drawStringM0("00000", memptr, 15, 0);
   703B 21 0F 00      [10] 2080 	ld	hl,#0x000F
   703E E5            [11] 2081 	push	hl
   703F C5            [11] 2082 	push	bc
   7040 21 C0 70      [10] 2083 	ld	hl,#___str_1
   7043 E5            [11] 2084 	push	hl
   7044 CD C3 59      [17] 2085 	call	_cpct_drawStringM0
   7047 21 06 00      [10] 2086 	ld	hl,#6
   704A 39            [11] 2087 	add	hl,sp
   704B F9            [ 6] 2088 	ld	sp,hl
                           2089 ;src/main.c:579: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 190);
   704C 21 1A BE      [10] 2090 	ld	hl,#0xBE1A
   704F E5            [11] 2091 	push	hl
   7050 21 00 C0      [10] 2092 	ld	hl,#0xC000
   7053 E5            [11] 2093 	push	hl
   7054 CD 93 65      [17] 2094 	call	_cpct_getScreenPtr
   7057 4D            [ 4] 2095 	ld	c,l
   7058 44            [ 4] 2096 	ld	b,h
                           2097 ;src/main.c:580: cpct_drawStringM0("ROBOBIT", memptr, 3, 0);
   7059 21 03 00      [10] 2098 	ld	hl,#0x0003
   705C E5            [11] 2099 	push	hl
   705D C5            [11] 2100 	push	bc
   705E 21 C6 70      [10] 2101 	ld	hl,#___str_2
   7061 E5            [11] 2102 	push	hl
   7062 CD C3 59      [17] 2103 	call	_cpct_drawStringM0
   7065 21 06 00      [10] 2104 	ld	hl,#6
   7068 39            [11] 2105 	add	hl,sp
   7069 F9            [ 6] 2106 	ld	sp,hl
                           2107 ;src/main.c:582: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 178); // 
   706A 21 3C B2      [10] 2108 	ld	hl,#0xB23C
   706D E5            [11] 2109 	push	hl
   706E 21 00 C0      [10] 2110 	ld	hl,#0xC000
   7071 E5            [11] 2111 	push	hl
   7072 CD 93 65      [17] 2112 	call	_cpct_getScreenPtr
   7075 4D            [ 4] 2113 	ld	c,l
   7076 44            [ 4] 2114 	ld	b,h
                           2115 ;src/main.c:583: cpct_drawStringM0("LIVES", memptr, 1, 0);
   7077 21 01 00      [10] 2116 	ld	hl,#0x0001
   707A E5            [11] 2117 	push	hl
   707B C5            [11] 2118 	push	bc
   707C 21 CE 70      [10] 2119 	ld	hl,#___str_3
   707F E5            [11] 2120 	push	hl
   7080 CD C3 59      [17] 2121 	call	_cpct_drawStringM0
   7083 21 06 00      [10] 2122 	ld	hl,#6
   7086 39            [11] 2123 	add	hl,sp
   7087 F9            [ 6] 2124 	ld	sp,hl
                           2125 ;src/main.c:585: for(i=0; i<5; i++){
   7088 01 00 00      [10] 2126 	ld	bc,#0x0000
   708B                    2127 00102$:
                           2128 ;src/main.c:586: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 190); // dibuja 5 corazones
   708B 79            [ 4] 2129 	ld	a,c
   708C 87            [ 4] 2130 	add	a, a
   708D 87            [ 4] 2131 	add	a, a
   708E C6 3C         [ 7] 2132 	add	a, #0x3C
   7090 57            [ 4] 2133 	ld	d,a
   7091 C5            [11] 2134 	push	bc
   7092 3E BE         [ 7] 2135 	ld	a,#0xBE
   7094 F5            [11] 2136 	push	af
   7095 33            [ 6] 2137 	inc	sp
   7096 D5            [11] 2138 	push	de
   7097 33            [ 6] 2139 	inc	sp
   7098 21 00 C0      [10] 2140 	ld	hl,#0xC000
   709B E5            [11] 2141 	push	hl
   709C CD 93 65      [17] 2142 	call	_cpct_getScreenPtr
   709F EB            [ 4] 2143 	ex	de,hl
   70A0 21 03 06      [10] 2144 	ld	hl,#0x0603
   70A3 E5            [11] 2145 	push	hl
   70A4 D5            [11] 2146 	push	de
   70A5 21 A8 55      [10] 2147 	ld	hl,#_g_heart
   70A8 E5            [11] 2148 	push	hl
   70A9 CD E7 59      [17] 2149 	call	_cpct_drawSprite
   70AC C1            [10] 2150 	pop	bc
                           2151 ;src/main.c:585: for(i=0; i<5; i++){
   70AD 03            [ 6] 2152 	inc	bc
   70AE 79            [ 4] 2153 	ld	a,c
   70AF D6 05         [ 7] 2154 	sub	a, #0x05
   70B1 78            [ 4] 2155 	ld	a,b
   70B2 17            [ 4] 2156 	rla
   70B3 3F            [ 4] 2157 	ccf
   70B4 1F            [ 4] 2158 	rra
   70B5 DE 80         [ 7] 2159 	sbc	a, #0x80
   70B7 38 D2         [12] 2160 	jr	C,00102$
   70B9 C9            [10] 2161 	ret
   70BA                    2162 ___str_0:
   70BA 53 43 4F 52 45     2163 	.ascii "SCORE"
   70BF 00                 2164 	.db 0x00
   70C0                    2165 ___str_1:
   70C0 30 30 30 30 30     2166 	.ascii "00000"
   70C5 00                 2167 	.db 0x00
   70C6                    2168 ___str_2:
   70C6 52 4F 42 4F 42 49  2169 	.ascii "ROBOBIT"
        54
   70CD 00                 2170 	.db 0x00
   70CE                    2171 ___str_3:
   70CE 4C 49 56 45 53     2172 	.ascii "LIVES"
   70D3 00                 2173 	.db 0x00
                           2174 ;src/main.c:591: void borrarPantallaAbajo(){
                           2175 ;	---------------------------------
                           2176 ; Function borrarPantallaAbajo
                           2177 ; ---------------------------------
   70D4                    2178 _borrarPantallaAbajo::
                           2179 ;src/main.c:593: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 180); // posición para borrar 
   70D4 21 1A B4      [10] 2180 	ld	hl,#0xB41A
   70D7 E5            [11] 2181 	push	hl
   70D8 21 00 C0      [10] 2182 	ld	hl,#0xC000
   70DB E5            [11] 2183 	push	hl
   70DC CD 93 65      [17] 2184 	call	_cpct_getScreenPtr
   70DF 4D            [ 4] 2185 	ld	c,l
   70E0 44            [ 4] 2186 	ld	b,h
                           2187 ;src/main.c:595: cpct_drawSolidBox(memptr, 0, 30, 7);  //borra el texto "PULSA I"
   70E1 21 1E 07      [10] 2188 	ld	hl,#0x071E
   70E4 E5            [11] 2189 	push	hl
   70E5 AF            [ 4] 2190 	xor	a, a
   70E6 F5            [11] 2191 	push	af
   70E7 33            [ 6] 2192 	inc	sp
   70E8 C5            [11] 2193 	push	bc
   70E9 CD B9 64      [17] 2194 	call	_cpct_drawSolidBox
   70EC F1            [10] 2195 	pop	af
   70ED F1            [10] 2196 	pop	af
   70EE 33            [ 6] 2197 	inc	sp
   70EF C9            [10] 2198 	ret
                           2199 ;src/main.c:598: void menuFin(){
                           2200 ;	---------------------------------
                           2201 ; Function menuFin
                           2202 ; ---------------------------------
   70F0                    2203 _menuFin::
                           2204 ;src/main.c:601: cpct_clearScreen(0);
   70F0 21 00 40      [10] 2205 	ld	hl,#0x4000
   70F3 E5            [11] 2206 	push	hl
   70F4 AF            [ 4] 2207 	xor	a, a
   70F5 F5            [11] 2208 	push	af
   70F6 33            [ 6] 2209 	inc	sp
   70F7 26 C0         [ 7] 2210 	ld	h, #0xC0
   70F9 E5            [11] 2211 	push	hl
   70FA CD 72 5C      [17] 2212 	call	_cpct_memset
                           2213 ;src/main.c:603: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 12, 90); // centrado en horizontal y arriba en vertical
   70FD 21 0C 5A      [10] 2214 	ld	hl,#0x5A0C
   7100 E5            [11] 2215 	push	hl
   7101 21 00 C0      [10] 2216 	ld	hl,#0xC000
   7104 E5            [11] 2217 	push	hl
   7105 CD 93 65      [17] 2218 	call	_cpct_getScreenPtr
   7108 4D            [ 4] 2219 	ld	c,l
   7109 44            [ 4] 2220 	ld	b,h
                           2221 ;src/main.c:604: cpct_drawStringM0("FIN DE PARTIDA", memptr, 2, 0);
   710A 21 02 00      [10] 2222 	ld	hl,#0x0002
   710D E5            [11] 2223 	push	hl
   710E C5            [11] 2224 	push	bc
   710F 21 29 71      [10] 2225 	ld	hl,#___str_4
   7112 E5            [11] 2226 	push	hl
   7113 CD C3 59      [17] 2227 	call	_cpct_drawStringM0
   7116 21 06 00      [10] 2228 	ld	hl,#6
   7119 39            [11] 2229 	add	hl,sp
   711A F9            [ 6] 2230 	ld	sp,hl
                           2231 ;src/main.c:608: do{
   711B                    2232 00101$:
                           2233 ;src/main.c:609: cpct_scanKeyboard_f();   		
   711B CD 4D 59      [17] 2234 	call	_cpct_scanKeyboard_f
                           2235 ;src/main.c:610: } while(!cpct_isKeyPressed(Key_I));   		
   711E 21 04 08      [10] 2236 	ld	hl,#0x0804
   7121 CD 41 59      [17] 2237 	call	_cpct_isKeyPressed
   7124 7D            [ 4] 2238 	ld	a,l
   7125 B7            [ 4] 2239 	or	a, a
   7126 28 F3         [12] 2240 	jr	Z,00101$
   7128 C9            [10] 2241 	ret
   7129                    2242 ___str_4:
   7129 46 49 4E 20 44 45  2243 	.ascii "FIN DE PARTIDA"
        20 50 41 52 54 49
        44 41
   7137 00                 2244 	.db 0x00
                           2245 ;src/main.c:613: void menuInicio(){
                           2246 ;	---------------------------------
                           2247 ; Function menuInicio
                           2248 ; ---------------------------------
   7138                    2249 _menuInicio::
                           2250 ;src/main.c:617: cpct_clearScreen(0);
   7138 21 00 40      [10] 2251 	ld	hl,#0x4000
   713B E5            [11] 2252 	push	hl
   713C AF            [ 4] 2253 	xor	a, a
   713D F5            [11] 2254 	push	af
   713E 33            [ 6] 2255 	inc	sp
   713F 26 C0         [ 7] 2256 	ld	h, #0xC0
   7141 E5            [11] 2257 	push	hl
   7142 CD 72 5C      [17] 2258 	call	_cpct_memset
                           2259 ;src/main.c:619: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 15); // centrado en horizontal y arriba en vertical
   7145 21 20 0F      [10] 2260 	ld	hl,#0x0F20
   7148 E5            [11] 2261 	push	hl
   7149 21 00 C0      [10] 2262 	ld	hl,#0xC000
   714C E5            [11] 2263 	push	hl
   714D CD 93 65      [17] 2264 	call	_cpct_getScreenPtr
   7150 4D            [ 4] 2265 	ld	c,l
   7151 44            [ 4] 2266 	ld	b,h
                           2267 ;src/main.c:620: cpct_drawStringM0("MENU", memptr, 2, 0);
   7152 21 02 00      [10] 2268 	ld	hl,#0x0002
   7155 E5            [11] 2269 	push	hl
   7156 C5            [11] 2270 	push	bc
   7157 21 8F 71      [10] 2271 	ld	hl,#___str_5
   715A E5            [11] 2272 	push	hl
   715B CD C3 59      [17] 2273 	call	_cpct_drawStringM0
   715E 21 06 00      [10] 2274 	ld	hl,#6
   7161 39            [11] 2275 	add	hl,sp
   7162 F9            [ 6] 2276 	ld	sp,hl
                           2277 ;src/main.c:622: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 160); // centrado en horizontal y abajo en vertical
   7163 21 1A A0      [10] 2278 	ld	hl,#0xA01A
   7166 E5            [11] 2279 	push	hl
   7167 21 00 C0      [10] 2280 	ld	hl,#0xC000
   716A E5            [11] 2281 	push	hl
   716B CD 93 65      [17] 2282 	call	_cpct_getScreenPtr
   716E 4D            [ 4] 2283 	ld	c,l
   716F 44            [ 4] 2284 	ld	b,h
                           2285 ;src/main.c:623: cpct_drawStringM0("PULSA I", memptr, 1, 0);
   7170 21 01 00      [10] 2286 	ld	hl,#0x0001
   7173 E5            [11] 2287 	push	hl
   7174 C5            [11] 2288 	push	bc
   7175 21 94 71      [10] 2289 	ld	hl,#___str_6
   7178 E5            [11] 2290 	push	hl
   7179 CD C3 59      [17] 2291 	call	_cpct_drawStringM0
   717C 21 06 00      [10] 2292 	ld	hl,#6
   717F 39            [11] 2293 	add	hl,sp
   7180 F9            [ 6] 2294 	ld	sp,hl
                           2295 ;src/main.c:626: do{
   7181                    2296 00101$:
                           2297 ;src/main.c:627: cpct_scanKeyboard_f();   		
   7181 CD 4D 59      [17] 2298 	call	_cpct_scanKeyboard_f
                           2299 ;src/main.c:628: } while(!cpct_isKeyPressed(Key_I));   		
   7184 21 04 08      [10] 2300 	ld	hl,#0x0804
   7187 CD 41 59      [17] 2301 	call	_cpct_isKeyPressed
   718A 7D            [ 4] 2302 	ld	a,l
   718B B7            [ 4] 2303 	or	a, a
   718C 28 F3         [12] 2304 	jr	Z,00101$
   718E C9            [10] 2305 	ret
   718F                    2306 ___str_5:
   718F 4D 45 4E 55        2307 	.ascii "MENU"
   7193 00                 2308 	.db 0x00
   7194                    2309 ___str_6:
   7194 50 55 4C 53 41 20  2310 	.ascii "PULSA I"
        49
   719B 00                 2311 	.db 0x00
                           2312 ;src/main.c:631: void inicializarCPC() {
                           2313 ;	---------------------------------
                           2314 ; Function inicializarCPC
                           2315 ; ---------------------------------
   719C                    2316 _inicializarCPC::
                           2317 ;src/main.c:632: cpct_disableFirmware();
   719C CD A9 64      [17] 2318 	call	_cpct_disableFirmware
                           2319 ;src/main.c:633: cpct_setVideoMode(0);
   719F 2E 00         [ 7] 2320 	ld	l,#0x00
   71A1 CD 54 5C      [17] 2321 	call	_cpct_setVideoMode
                           2322 ;src/main.c:634: cpct_setBorder(HW_BLACK);
   71A4 21 10 14      [10] 2323 	ld	hl,#0x1410
   71A7 E5            [11] 2324 	push	hl
   71A8 CD B7 59      [17] 2325 	call	_cpct_setPALColour
                           2326 ;src/main.c:635: cpct_setPalette(g_palette, 16);
   71AB 21 10 00      [10] 2327 	ld	hl,#0x0010
   71AE E5            [11] 2328 	push	hl
   71AF 21 E0 57      [10] 2329 	ld	hl,#_g_palette
   71B2 E5            [11] 2330 	push	hl
   71B3 CD 2A 59      [17] 2331 	call	_cpct_setPalette
                           2332 ;src/main.c:636: cpct_akp_musicInit(G_song);
   71B6 21 00 3F      [10] 2333 	ld	hl,#_G_song
   71B9 E5            [11] 2334 	push	hl
   71BA CD 85 63      [17] 2335 	call	_cpct_akp_musicInit
   71BD F1            [10] 2336 	pop	af
   71BE C9            [10] 2337 	ret
                           2338 ;src/main.c:639: void inicializarJuego() {
                           2339 ;	---------------------------------
                           2340 ; Function inicializarJuego
                           2341 ; ---------------------------------
   71BF                    2342 _inicializarJuego::
                           2343 ;src/main.c:641: num_mapa = 0;
   71BF 21 0D 66      [10] 2344 	ld	hl,#_num_mapa + 0
   71C2 36 00         [10] 2345 	ld	(hl), #0x00
                           2346 ;src/main.c:642: mapa = mapas[num_mapa];
   71C4 21 24 66      [10] 2347 	ld	hl, #_mapas + 0
   71C7 7E            [ 7] 2348 	ld	a,(hl)
   71C8 FD 21 0B 66   [14] 2349 	ld	iy,#_mapa
   71CC FD 77 00      [19] 2350 	ld	0 (iy),a
   71CF 23            [ 6] 2351 	inc	hl
   71D0 7E            [ 7] 2352 	ld	a,(hl)
   71D1 32 0C 66      [13] 2353 	ld	(#_mapa + 1),a
                           2354 ;src/main.c:643: cpct_etm_setTileset2x4(g_tileset);
   71D4 21 E0 54      [10] 2355 	ld	hl,#_g_tileset
   71D7 CD 1B 5B      [17] 2356 	call	_cpct_etm_setTileset2x4
                           2357 ;src/main.c:644: dibujarMapa();
   71DA CD 0E 66      [17] 2358 	call	_dibujarMapa
                           2359 ;src/main.c:645: borrarPantallaAbajo();
   71DD CD D4 70      [17] 2360 	call	_borrarPantallaAbajo
                           2361 ;src/main.c:646: barraPuntuacionInicial();
   71E0 CD 12 70      [17] 2362 	call	_barraPuntuacionInicial
                           2363 ;src/main.c:649: prota.x = prota.px = 4;
   71E3 21 FB 65      [10] 2364 	ld	hl,#(_prota + 0x0002)
   71E6 36 04         [10] 2365 	ld	(hl),#0x04
   71E8 21 F9 65      [10] 2366 	ld	hl,#_prota
   71EB 36 04         [10] 2367 	ld	(hl),#0x04
                           2368 ;src/main.c:650: prota.y = prota.py = 80;
   71ED 21 FC 65      [10] 2369 	ld	hl,#(_prota + 0x0003)
   71F0 36 50         [10] 2370 	ld	(hl),#0x50
   71F2 21 FA 65      [10] 2371 	ld	hl,#(_prota + 0x0001)
   71F5 36 50         [10] 2372 	ld	(hl),#0x50
                           2373 ;src/main.c:651: prota.mover  = NO;
   71F7 21 FF 65      [10] 2374 	ld	hl,#(_prota + 0x0006)
   71FA 36 00         [10] 2375 	ld	(hl),#0x00
                           2376 ;src/main.c:652: prota.mira=M_derecha;
   71FC 21 00 66      [10] 2377 	ld	hl,#(_prota + 0x0007)
   71FF 36 00         [10] 2378 	ld	(hl),#0x00
                           2379 ;src/main.c:653: prota.sprite = g_hero;
   7201 21 F0 57      [10] 2380 	ld	hl,#_g_hero
   7204 22 FD 65      [16] 2381 	ld	((_prota + 0x0004)), hl
                           2382 ;src/main.c:655: enemy.x = enemy.px = 71;
   7207 21 F2 65      [10] 2383 	ld	hl,#(_enemy + 0x0002)
   720A 36 47         [10] 2384 	ld	(hl),#0x47
   720C 21 F0 65      [10] 2385 	ld	hl,#_enemy
   720F 36 47         [10] 2386 	ld	(hl),#0x47
                           2387 ;src/main.c:656: enemy.y = enemy.py = 84;
   7211 21 F3 65      [10] 2388 	ld	hl,#(_enemy + 0x0003)
   7214 36 54         [10] 2389 	ld	(hl),#0x54
   7216 21 F1 65      [10] 2390 	ld	hl,#(_enemy + 0x0001)
   7219 36 54         [10] 2391 	ld	(hl),#0x54
                           2392 ;src/main.c:657: enemy.mover  = NO;
   721B 21 F6 65      [10] 2393 	ld	hl,#(_enemy + 0x0006)
   721E 36 00         [10] 2394 	ld	(hl),#0x00
                           2395 ;src/main.c:658: enemy.mira=M_abajo;
   7220 21 F7 65      [10] 2396 	ld	hl,#(_enemy + 0x0007)
   7223 36 03         [10] 2397 	ld	(hl),#0x03
                           2398 ;src/main.c:659: enemy.sprite = g_enemy;
   7225 21 BA 55      [10] 2399 	ld	hl,#_g_enemy
   7228 22 F4 65      [16] 2400 	ld	((_enemy + 0x0004)), hl
                           2401 ;src/main.c:660: enemy.muerto = NO;
   722B 21 F8 65      [10] 2402 	ld	hl,#(_enemy + 0x0008)
   722E 36 00         [10] 2403 	ld	(hl),#0x00
                           2404 ;src/main.c:662: cu.x = cu.px = 0;
   7230 21 03 66      [10] 2405 	ld	hl,#(_cu + 0x0002)
   7233 36 00         [10] 2406 	ld	(hl),#0x00
   7235 21 01 66      [10] 2407 	ld	hl,#_cu
   7238 36 00         [10] 2408 	ld	(hl),#0x00
                           2409 ;src/main.c:663: cu.y = cu.py = 0;
   723A 21 04 66      [10] 2410 	ld	hl,#(_cu + 0x0003)
   723D 36 00         [10] 2411 	ld	(hl),#0x00
   723F 21 02 66      [10] 2412 	ld	hl,#(_cu + 0x0001)
   7242 36 00         [10] 2413 	ld	(hl),#0x00
                           2414 ;src/main.c:664: cu.lanzado = NO;
   7244 21 07 66      [10] 2415 	ld	hl,#(_cu + 0x0006)
   7247 36 00         [10] 2416 	ld	(hl),#0x00
                           2417 ;src/main.c:665: cu.mover = NO;
   7249 21 0A 66      [10] 2418 	ld	hl,#(_cu + 0x0009)
   724C 36 00         [10] 2419 	ld	(hl),#0x00
                           2420 ;src/main.c:669: dibujarProta();
   724E CD 2A 66      [17] 2421 	call	_dibujarProta
                           2422 ;src/main.c:670: dibujarEnemigo();
   7251 C3 31 68      [10] 2423 	jp  _dibujarEnemigo
                           2424 ;src/main.c:673: void main(void) {
                           2425 ;	---------------------------------
                           2426 ; Function main
                           2427 ; ---------------------------------
   7254                    2428 _main::
                           2429 ;src/main.c:675: inicializarCPC();
   7254 CD 9C 71      [17] 2430 	call	_inicializarCPC
                           2431 ;src/main.c:676: menuInicio();
   7257 CD 38 71      [17] 2432 	call	_menuInicio
                           2433 ;src/main.c:678: inicializarJuego();
   725A CD BF 71      [17] 2434 	call	_inicializarJuego
                           2435 ;src/main.c:679: cpct_akp_musicPlay();
   725D CD 82 5C      [17] 2436 	call	_cpct_akp_musicPlay
                           2437 ;src/main.c:681: while (1) {
   7260                    2438 00115$:
                           2439 ;src/main.c:683: comprobarTeclado();
   7260 CD E7 6D      [17] 2440 	call	_comprobarTeclado
                           2441 ;src/main.c:684: moverCuchillo();
   7263 CD 26 6F      [17] 2442 	call	_moverCuchillo
                           2443 ;src/main.c:685: moverEnemigo();
   7266 CD 94 6A      [17] 2444 	call	_moverEnemigo
                           2445 ;src/main.c:687: cpct_waitVSYNC();
   7269 CD 4C 5C      [17] 2446 	call	_cpct_waitVSYNC
                           2447 ;src/main.c:689: if (prota.mover) {
   726C 01 FF 65      [10] 2448 	ld	bc,#_prota+6
   726F 0A            [ 7] 2449 	ld	a,(bc)
   7270 B7            [ 4] 2450 	or	a, a
   7271 28 07         [12] 2451 	jr	Z,00102$
                           2452 ;src/main.c:690: redibujarProta();
   7273 C5            [11] 2453 	push	bc
   7274 CD B3 66      [17] 2454 	call	_redibujarProta
   7277 C1            [10] 2455 	pop	bc
                           2456 ;src/main.c:691: prota.mover = NO;
   7278 AF            [ 4] 2457 	xor	a, a
   7279 02            [ 7] 2458 	ld	(bc),a
   727A                    2459 00102$:
                           2460 ;src/main.c:693: if(cu.lanzado && cu.mover){
   727A 21 07 66      [10] 2461 	ld	hl,#_cu + 6
   727D 4E            [ 7] 2462 	ld	c,(hl)
   727E 11 0A 66      [10] 2463 	ld	de,#_cu + 9
   7281 79            [ 4] 2464 	ld	a,c
   7282 B7            [ 4] 2465 	or	a, a
   7283 28 09         [12] 2466 	jr	Z,00107$
   7285 1A            [ 7] 2467 	ld	a,(de)
   7286 B7            [ 4] 2468 	or	a, a
   7287 28 05         [12] 2469 	jr	Z,00107$
                           2470 ;src/main.c:694: redibujarCuchillo();
   7289 CD B7 6C      [17] 2471 	call	_redibujarCuchillo
   728C 18 0B         [12] 2472 	jr	00108$
   728E                    2473 00107$:
                           2474 ;src/main.c:695: }else if (cu.lanzado && !cu.mover){
   728E 79            [ 4] 2475 	ld	a,c
   728F B7            [ 4] 2476 	or	a, a
   7290 28 07         [12] 2477 	jr	Z,00108$
   7292 1A            [ 7] 2478 	ld	a,(de)
   7293 B7            [ 4] 2479 	or	a, a
   7294 20 03         [12] 2480 	jr	NZ,00108$
                           2481 ;src/main.c:696: borrarCuchillo();
   7296 CD 4A 6C      [17] 2482 	call	_borrarCuchillo
   7299                    2483 00108$:
                           2484 ;src/main.c:699: if(enemy.mover){
   7299 3A F6 65      [13] 2485 	ld	a, (#_enemy + 6)
   729C B7            [ 4] 2486 	or	a, a
   729D 28 03         [12] 2487 	jr	Z,00111$
                           2488 ;src/main.c:700: redibujarEnemigo();
   729F CD BF 68      [17] 2489 	call	_redibujarEnemigo
   72A2                    2490 00111$:
                           2491 ;src/main.c:702: if (enemy.muerto){
   72A2 3A F8 65      [13] 2492 	ld	a, (#_enemy + 8)
   72A5 B7            [ 4] 2493 	or	a, a
   72A6 28 B8         [12] 2494 	jr	Z,00115$
                           2495 ;src/main.c:703: borrarEnemigo();
   72A8 CD 57 68      [17] 2496 	call	_borrarEnemigo
   72AB 18 B3         [12] 2497 	jr	00115$
                           2498 	.area _CODE
                           2499 	.area _INITIALIZER
                           2500 	.area _CABS (ABS)
   3F00                    2501 	.org 0x3F00
   3F00                    2502 _G_song:
   3F00 41                 2503 	.db #0x41	; 65	'A'
   3F01 54                 2504 	.db #0x54	; 84	'T'
   3F02 31                 2505 	.db #0x31	; 49	'1'
   3F03 30                 2506 	.db #0x30	; 48	'0'
   3F04 01                 2507 	.db #0x01	; 1
   3F05 40                 2508 	.db #0x40	; 64
   3F06 42                 2509 	.db #0x42	; 66	'B'
   3F07 0F                 2510 	.db #0x0F	; 15
   3F08 02                 2511 	.db #0x02	; 2
   3F09 06                 2512 	.db #0x06	; 6
   3F0A 1D                 2513 	.db #0x1D	; 29
   3F0B 00                 2514 	.db #0x00	; 0
   3F0C 10                 2515 	.db #0x10	; 16
   3F0D 40                 2516 	.db #0x40	; 64
   3F0E 19                 2517 	.db #0x19	; 25
   3F0F 40                 2518 	.db #0x40	; 64
   3F10 00                 2519 	.db #0x00	; 0
   3F11 00                 2520 	.db #0x00	; 0
   3F12 00                 2521 	.db #0x00	; 0
   3F13 00                 2522 	.db #0x00	; 0
   3F14 00                 2523 	.db #0x00	; 0
   3F15 00                 2524 	.db #0x00	; 0
   3F16 0D                 2525 	.db #0x0D	; 13
   3F17 12                 2526 	.db #0x12	; 18
   3F18 40                 2527 	.db #0x40	; 64
   3F19 01                 2528 	.db #0x01	; 1
   3F1A 00                 2529 	.db #0x00	; 0
   3F1B 7C                 2530 	.db #0x7C	; 124
   3F1C 18                 2531 	.db #0x18	; 24
   3F1D 78                 2532 	.db #0x78	; 120	'x'
   3F1E 0C                 2533 	.db #0x0C	; 12
   3F1F 34                 2534 	.db #0x34	; 52	'4'
   3F20 30                 2535 	.db #0x30	; 48	'0'
   3F21 2C                 2536 	.db #0x2C	; 44
   3F22 28                 2537 	.db #0x28	; 40
   3F23 24                 2538 	.db #0x24	; 36
   3F24 20                 2539 	.db #0x20	; 32
   3F25 1C                 2540 	.db #0x1C	; 28
   3F26 0D                 2541 	.db #0x0D	; 13
   3F27 25                 2542 	.db #0x25	; 37
   3F28 40                 2543 	.db #0x40	; 64
   3F29 20                 2544 	.db #0x20	; 32
   3F2A 00                 2545 	.db #0x00	; 0
   3F2B 00                 2546 	.db #0x00	; 0
   3F2C 00                 2547 	.db #0x00	; 0
   3F2D 39                 2548 	.db #0x39	; 57	'9'
   3F2E 40                 2549 	.db #0x40	; 64
   3F2F 00                 2550 	.db #0x00	; 0
   3F30 57                 2551 	.db #0x57	; 87	'W'
   3F31 40                 2552 	.db #0x40	; 64
   3F32 3B                 2553 	.db #0x3B	; 59
   3F33 40                 2554 	.db #0x40	; 64
   3F34 57                 2555 	.db #0x57	; 87	'W'
   3F35 40                 2556 	.db #0x40	; 64
   3F36 01                 2557 	.db #0x01	; 1
   3F37 2F                 2558 	.db #0x2F	; 47
   3F38 40                 2559 	.db #0x40	; 64
   3F39 19                 2560 	.db #0x19	; 25
   3F3A 00                 2561 	.db #0x00	; 0
   3F3B 76                 2562 	.db #0x76	; 118	'v'
   3F3C E1                 2563 	.db #0xE1	; 225
   3F3D 00                 2564 	.db #0x00	; 0
   3F3E 00                 2565 	.db #0x00	; 0
   3F3F 01                 2566 	.db #0x01	; 1
   3F40 04                 2567 	.db #0x04	; 4
   3F41 51                 2568 	.db #0x51	; 81	'Q'
   3F42 04                 2569 	.db #0x04	; 4
   3F43 37                 2570 	.db #0x37	; 55	'7'
   3F44 04                 2571 	.db #0x04	; 4
   3F45 4F                 2572 	.db #0x4F	; 79	'O'
   3F46 04                 2573 	.db #0x04	; 4
   3F47 37                 2574 	.db #0x37	; 55	'7'
   3F48 02                 2575 	.db #0x02	; 2
   3F49 4B                 2576 	.db #0x4B	; 75	'K'
   3F4A 02                 2577 	.db #0x02	; 2
   3F4B 37                 2578 	.db #0x37	; 55	'7'
   3F4C 04                 2579 	.db #0x04	; 4
   3F4D 4F                 2580 	.db #0x4F	; 79	'O'
   3F4E 04                 2581 	.db #0x04	; 4
   3F4F 37                 2582 	.db #0x37	; 55	'7'
   3F50 04                 2583 	.db #0x04	; 4
   3F51 4F                 2584 	.db #0x4F	; 79	'O'
   3F52 04                 2585 	.db #0x04	; 4
   3F53 37                 2586 	.db #0x37	; 55	'7'
   3F54 02                 2587 	.db #0x02	; 2
   3F55 4B                 2588 	.db #0x4B	; 75	'K'
   3F56 00                 2589 	.db #0x00	; 0
   3F57 42                 2590 	.db #0x42	; 66	'B'
   3F58 60                 2591 	.db #0x60	; 96
   3F59 00                 2592 	.db #0x00	; 0
   3F5A 42                 2593 	.db #0x42	; 66	'B'
   3F5B 80                 2594 	.db #0x80	; 128
   3F5C 00                 2595 	.db #0x00	; 0
   3F5D 00                 2596 	.db #0x00	; 0
   3F5E 42                 2597 	.db #0x42	; 66	'B'
   3F5F 00                 2598 	.db #0x00	; 0
   3F60 00                 2599 	.db #0x00	; 0
