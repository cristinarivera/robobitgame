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
                             20 	.globl _comprobarTeclado
                             21 	.globl _lanzarCuchillo
                             22 	.globl _redibujarCuchillo
                             23 	.globl _borrarCuchillo
                             24 	.globl _dibujarCuchillo
                             25 	.globl _moverAbajo
                             26 	.globl _moverArriba
                             27 	.globl _moverDerecha
                             28 	.globl _moverIzquierda
                             29 	.globl _avanzarMapa
                             30 	.globl _moverEnemigoAbajo
                             31 	.globl _moverEnemigoArriba
                             32 	.globl _moverEnemigo
                             33 	.globl _checkEnemyCollision
                             34 	.globl _redibujarEnemigo
                             35 	.globl _borrarEnemigo
                             36 	.globl _dibujarEnemigo
                             37 	.globl _checkCollision
                             38 	.globl _getTilePtr
                             39 	.globl _redibujarProta
                             40 	.globl _borrarProta
                             41 	.globl _dibujarProta
                             42 	.globl _dibujarMapa
                             43 	.globl _cpct_etm_setTileset2x4
                             44 	.globl _cpct_etm_drawTileBox2x4
                             45 	.globl _cpct_akp_musicPlay
                             46 	.globl _cpct_akp_musicInit
                             47 	.globl _cpct_getScreenPtr
                             48 	.globl _cpct_setPALColour
                             49 	.globl _cpct_setPalette
                             50 	.globl _cpct_waitVSYNC
                             51 	.globl _cpct_setVideoMode
                             52 	.globl _cpct_drawStringM0
                             53 	.globl _cpct_drawSpriteMaskedAlignedTable
                             54 	.globl _cpct_drawSolidBox
                             55 	.globl _cpct_drawSprite
                             56 	.globl _cpct_isAnyKeyPressed
                             57 	.globl _cpct_isKeyPressed
                             58 	.globl _cpct_scanKeyboard_if
                             59 	.globl _cpct_scanKeyboard_f
                             60 	.globl _cpct_memset
                             61 	.globl _cpct_disableFirmware
                             62 	.globl _num_mapa
                             63 	.globl _mapa
                             64 	.globl _cu
                             65 	.globl _prota
                             66 	.globl _enemy
                             67 	.globl _EEje
                             68 	.globl _EMirar
                             69 	.globl _mapas
                             70 ;--------------------------------------------------------
                             71 ; special function registers
                             72 ;--------------------------------------------------------
                             73 ;--------------------------------------------------------
                             74 ; ram data
                             75 ;--------------------------------------------------------
                             76 	.area _DATA
   65EE                      77 _EMirar::
   65EE                      78 	.ds 1
   65EF                      79 _EEje::
   65EF                      80 	.ds 1
   65F0                      81 _enemy::
   65F0                      82 	.ds 8
   65F8                      83 _prota::
   65F8                      84 	.ds 8
   6600                      85 _cu::
   6600                      86 	.ds 90
   665A                      87 _mapa::
   665A                      88 	.ds 2
   665C                      89 _num_mapa::
   665C                      90 	.ds 1
                             91 ;--------------------------------------------------------
                             92 ; ram data
                             93 ;--------------------------------------------------------
                             94 	.area _INITIALIZED
                             95 ;--------------------------------------------------------
                             96 ; absolute external ram data
                             97 ;--------------------------------------------------------
                             98 	.area _DABS (ABS)
                             99 ;--------------------------------------------------------
                            100 ; global & static initialisations
                            101 ;--------------------------------------------------------
                            102 	.area _HOME
                            103 	.area _GSINIT
                            104 	.area _GSFINAL
                            105 	.area _GSINIT
                            106 ;--------------------------------------------------------
                            107 ; Home
                            108 ;--------------------------------------------------------
                            109 	.area _HOME
                            110 	.area _HOME
                            111 ;--------------------------------------------------------
                            112 ; code
                            113 ;--------------------------------------------------------
                            114 	.area _CODE
                            115 ;src/main.c:111: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
                            116 ;	---------------------------------
                            117 ; Function dummy_cpct_transparentMaskTable0M0_container
                            118 ; ---------------------------------
   588A                     119 _dummy_cpct_transparentMaskTable0M0_container::
                            120 	.area _g_tablatrans_ (ABS) 
   3E00                     121 	.org 0x3E00 
   3E00                     122 	 _g_tablatrans::
   3E00 FF AA 55 00 AA AA   123 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E08 55 00 55 00 00 00   124 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E10 AA AA 00 00 AA AA   125 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E18 00 00 00 00 00 00   126 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E20 55 00 55 00 00 00   127 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E28 55 00 55 00 00 00   128 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E30 00 00 00 00 00 00   129 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E38 00 00 00 00 00 00   130 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E40 AA AA 00 00 AA AA   131 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E48 00 00 00 00 00 00   132 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E50 AA AA 00 00 AA AA   133 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E58 00 00 00 00 00 00   134 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E60 00 00 00 00 00 00   135 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E68 00 00 00 00 00 00   136 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E70 00 00 00 00 00 00   137 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E78 00 00 00 00 00 00   138 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E80 55 00 55 00 00 00   139 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E88 55 00 55 00 00 00   140 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E90 00 00 00 00 00 00   141 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E98 00 00 00 00 00 00   142 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA0 55 00 55 00 00 00   143 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA8 55 00 55 00 00 00   144 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB0 00 00 00 00 00 00   145 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB8 00 00 00 00 00 00   146 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC0 00 00 00 00 00 00   147 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC8 00 00 00 00 00 00   148 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED0 00 00 00 00 00 00   149 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED8 00 00 00 00 00 00   150 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE0 00 00 00 00 00 00   151 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE8 00 00 00 00 00 00   152 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF0 00 00 00 00 00 00   153 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF8 00 00 00 00 00 00   154 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            155 	.area _CSEG (REL, CON) 
                            156 ;src/main.c:114: void dibujarMapa() {
                            157 ;	---------------------------------
                            158 ; Function dibujarMapa
                            159 ; ---------------------------------
   665D                     160 _dibujarMapa::
                            161 ;src/main.c:115: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   665D 2A 5A 66      [16]  162 	ld	hl,(_mapa)
   6660 E5            [11]  163 	push	hl
   6661 21 00 C0      [10]  164 	ld	hl,#0xC000
   6664 E5            [11]  165 	push	hl
   6665 21 2C 28      [10]  166 	ld	hl,#0x282C
   6668 E5            [11]  167 	push	hl
   6669 2E 00         [ 7]  168 	ld	l, #0x00
   666B E5            [11]  169 	push	hl
   666C AF            [ 4]  170 	xor	a, a
   666D F5            [11]  171 	push	af
   666E 33            [ 6]  172 	inc	sp
   666F CD 8C 5A      [17]  173 	call	_cpct_etm_drawTileBox2x4
   6672 C9            [10]  174 	ret
   6673                     175 _mapas:
   6673 C0 4D               176 	.dw _g_map1
   6675 E0 46               177 	.dw _g_map2
   6677 00 40               178 	.dw _g_map3
                            179 ;src/main.c:120: void dibujarProta() {
                            180 ;	---------------------------------
                            181 ; Function dibujarProta
                            182 ; ---------------------------------
   6679                     183 _dibujarProta::
                            184 ;src/main.c:121: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   6679 21 F9 65      [10]  185 	ld	hl, #_prota + 1
   667C 56            [ 7]  186 	ld	d,(hl)
   667D 21 F8 65      [10]  187 	ld	hl, #_prota + 0
   6680 46            [ 7]  188 	ld	b,(hl)
   6681 D5            [11]  189 	push	de
   6682 33            [ 6]  190 	inc	sp
   6683 C5            [11]  191 	push	bc
   6684 33            [ 6]  192 	inc	sp
   6685 21 00 C0      [10]  193 	ld	hl,#0xC000
   6688 E5            [11]  194 	push	hl
   6689 CD 93 65      [17]  195 	call	_cpct_getScreenPtr
   668C EB            [ 4]  196 	ex	de,hl
                            197 ;src/main.c:122: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   668D ED 4B FC 65   [20]  198 	ld	bc, (#_prota + 4)
   6691 21 00 3E      [10]  199 	ld	hl,#_g_tablatrans
   6694 E5            [11]  200 	push	hl
   6695 21 07 16      [10]  201 	ld	hl,#0x1607
   6698 E5            [11]  202 	push	hl
   6699 D5            [11]  203 	push	de
   669A C5            [11]  204 	push	bc
   669B CD B3 65      [17]  205 	call	_cpct_drawSpriteMaskedAlignedTable
   669E C9            [10]  206 	ret
                            207 ;src/main.c:125: void borrarProta() {
                            208 ;	---------------------------------
                            209 ; Function borrarProta
                            210 ; ---------------------------------
   669F                     211 _borrarProta::
   669F DD E5         [15]  212 	push	ix
   66A1 DD 21 00 00   [14]  213 	ld	ix,#0
   66A5 DD 39         [15]  214 	add	ix,sp
   66A7 3B            [ 6]  215 	dec	sp
                            216 ;src/main.c:127: u8 w = 4 + (prota.px & 1);
   66A8 21 FA 65      [10]  217 	ld	hl, #_prota + 2
   66AB 4E            [ 7]  218 	ld	c,(hl)
   66AC 79            [ 4]  219 	ld	a,c
   66AD E6 01         [ 7]  220 	and	a, #0x01
   66AF 47            [ 4]  221 	ld	b,a
   66B0 04            [ 4]  222 	inc	b
   66B1 04            [ 4]  223 	inc	b
   66B2 04            [ 4]  224 	inc	b
   66B3 04            [ 4]  225 	inc	b
                            226 ;src/main.c:130: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   66B4 21 FB 65      [10]  227 	ld	hl, #_prota + 3
   66B7 5E            [ 7]  228 	ld	e,(hl)
   66B8 CB 4B         [ 8]  229 	bit	1, e
   66BA 28 04         [12]  230 	jr	Z,00103$
   66BC 3E 01         [ 7]  231 	ld	a,#0x01
   66BE 18 02         [12]  232 	jr	00104$
   66C0                     233 00103$:
   66C0 3E 00         [ 7]  234 	ld	a,#0x00
   66C2                     235 00104$:
   66C2 C6 06         [ 7]  236 	add	a, #0x06
   66C4 DD 77 FF      [19]  237 	ld	-1 (ix),a
                            238 ;src/main.c:132: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   66C7 FD 2A 5A 66   [20]  239 	ld	iy,(_mapa)
   66CB 16 00         [ 7]  240 	ld	d,#0x00
   66CD 63            [ 4]  241 	ld	h,e
   66CE 6A            [ 4]  242 	ld	l,d
   66CF CB 7A         [ 8]  243 	bit	7, d
   66D1 28 05         [12]  244 	jr	Z,00105$
   66D3 13            [ 6]  245 	inc	de
   66D4 13            [ 6]  246 	inc	de
   66D5 13            [ 6]  247 	inc	de
   66D6 63            [ 4]  248 	ld	h,e
   66D7 6A            [ 4]  249 	ld	l,d
   66D8                     250 00105$:
   66D8 5C            [ 4]  251 	ld	e, h
   66D9 55            [ 4]  252 	ld	d, l
   66DA CB 2A         [ 8]  253 	sra	d
   66DC CB 1B         [ 8]  254 	rr	e
   66DE CB 2A         [ 8]  255 	sra	d
   66E0 CB 1B         [ 8]  256 	rr	e
   66E2 51            [ 4]  257 	ld	d,c
   66E3 CB 3A         [ 8]  258 	srl	d
   66E5 FD E5         [15]  259 	push	iy
   66E7 21 00 C0      [10]  260 	ld	hl,#0xC000
   66EA E5            [11]  261 	push	hl
   66EB 3E 28         [ 7]  262 	ld	a,#0x28
   66ED F5            [11]  263 	push	af
   66EE 33            [ 6]  264 	inc	sp
   66EF DD 7E FF      [19]  265 	ld	a,-1 (ix)
   66F2 F5            [11]  266 	push	af
   66F3 33            [ 6]  267 	inc	sp
   66F4 C5            [11]  268 	push	bc
   66F5 33            [ 6]  269 	inc	sp
   66F6 7B            [ 4]  270 	ld	a,e
   66F7 F5            [11]  271 	push	af
   66F8 33            [ 6]  272 	inc	sp
   66F9 D5            [11]  273 	push	de
   66FA 33            [ 6]  274 	inc	sp
   66FB CD 8C 5A      [17]  275 	call	_cpct_etm_drawTileBox2x4
   66FE 33            [ 6]  276 	inc	sp
   66FF DD E1         [14]  277 	pop	ix
   6701 C9            [10]  278 	ret
                            279 ;src/main.c:137: void redibujarProta() {
                            280 ;	---------------------------------
                            281 ; Function redibujarProta
                            282 ; ---------------------------------
   6702                     283 _redibujarProta::
                            284 ;src/main.c:138: borrarProta();
   6702 CD 9F 66      [17]  285 	call	_borrarProta
                            286 ;src/main.c:139: prota.px = prota.x;
   6705 01 FA 65      [10]  287 	ld	bc,#_prota + 2
   6708 3A F8 65      [13]  288 	ld	a, (#_prota + 0)
   670B 02            [ 7]  289 	ld	(bc),a
                            290 ;src/main.c:140: prota.py = prota.y;
   670C 01 FB 65      [10]  291 	ld	bc,#_prota + 3
   670F 3A F9 65      [13]  292 	ld	a, (#_prota + 1)
   6712 02            [ 7]  293 	ld	(bc),a
                            294 ;src/main.c:141: dibujarProta();
   6713 C3 79 66      [10]  295 	jp  _dibujarProta
                            296 ;src/main.c:144: u8* getTilePtr(u8 x, u8 y) {
                            297 ;	---------------------------------
                            298 ; Function getTilePtr
                            299 ; ---------------------------------
   6716                     300 _getTilePtr::
                            301 ;src/main.c:145: return mapa + (y/4)*g_map1_W + x/2;
   6716 21 03 00      [10]  302 	ld	hl, #3+0
   6719 39            [11]  303 	add	hl, sp
   671A 4E            [ 7]  304 	ld	c, (hl)
   671B CB 39         [ 8]  305 	srl	c
   671D CB 39         [ 8]  306 	srl	c
   671F 06 00         [ 7]  307 	ld	b,#0x00
   6721 69            [ 4]  308 	ld	l, c
   6722 60            [ 4]  309 	ld	h, b
   6723 29            [11]  310 	add	hl, hl
   6724 29            [11]  311 	add	hl, hl
   6725 09            [11]  312 	add	hl, bc
   6726 29            [11]  313 	add	hl, hl
   6727 29            [11]  314 	add	hl, hl
   6728 29            [11]  315 	add	hl, hl
   6729 ED 5B 5A 66   [20]  316 	ld	de,(_mapa)
   672D 19            [11]  317 	add	hl,de
   672E FD 21 02 00   [14]  318 	ld	iy,#2
   6732 FD 39         [15]  319 	add	iy,sp
   6734 FD 4E 00      [19]  320 	ld	c,0 (iy)
   6737 CB 39         [ 8]  321 	srl	c
   6739 59            [ 4]  322 	ld	e,c
   673A 16 00         [ 7]  323 	ld	d,#0x00
   673C 19            [11]  324 	add	hl,de
   673D C9            [10]  325 	ret
                            326 ;src/main.c:148: u8 checkCollision(int direction) { // check optimization
                            327 ;	---------------------------------
                            328 ; Function checkCollision
                            329 ; ---------------------------------
   673E                     330 _checkCollision::
   673E DD E5         [15]  331 	push	ix
   6740 DD 21 00 00   [14]  332 	ld	ix,#0
   6744 DD 39         [15]  333 	add	ix,sp
   6746 21 F8 FF      [10]  334 	ld	hl,#-8
   6749 39            [11]  335 	add	hl,sp
   674A F9            [ 6]  336 	ld	sp,hl
                            337 ;src/main.c:151: switch (direction) {
   674B DD CB 05 7E   [20]  338 	bit	7, 5 (ix)
   674F C2 5B 68      [10]  339 	jp	NZ,00105$
   6752 3E 03         [ 7]  340 	ld	a,#0x03
   6754 DD BE 04      [19]  341 	cp	a, 4 (ix)
   6757 3E 00         [ 7]  342 	ld	a,#0x00
   6759 DD 9E 05      [19]  343 	sbc	a, 5 (ix)
   675C E2 61 67      [10]  344 	jp	PO, 00128$
   675F EE 80         [ 7]  345 	xor	a, #0x80
   6761                     346 00128$:
   6761 FA 5B 68      [10]  347 	jp	M,00105$
   6764 DD 5E 04      [19]  348 	ld	e,4 (ix)
   6767 16 00         [ 7]  349 	ld	d,#0x00
   6769 21 70 67      [10]  350 	ld	hl,#00129$
   676C 19            [11]  351 	add	hl,de
   676D 19            [11]  352 	add	hl,de
   676E 19            [11]  353 	add	hl,de
   676F E9            [ 4]  354 	jp	(hl)
   6770                     355 00129$:
   6770 C3 7C 67      [10]  356 	jp	00101$
   6773 C3 C1 67      [10]  357 	jp	00102$
   6776 C3 01 68      [10]  358 	jp	00103$
   6779 C3 2F 68      [10]  359 	jp	00104$
                            360 ;src/main.c:152: case 0:
   677C                     361 00101$:
                            362 ;src/main.c:153: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   677C 21 F9 65      [10]  363 	ld	hl, #(_prota + 0x0001) + 0
   677F 46            [ 7]  364 	ld	b,(hl)
   6780 3A F8 65      [13]  365 	ld	a, (#_prota + 0)
   6783 C6 04         [ 7]  366 	add	a, #0x04
   6785 C5            [11]  367 	push	bc
   6786 33            [ 6]  368 	inc	sp
   6787 F5            [11]  369 	push	af
   6788 33            [ 6]  370 	inc	sp
   6789 CD 16 67      [17]  371 	call	_getTilePtr
   678C F1            [10]  372 	pop	af
   678D DD 75 FE      [19]  373 	ld	-2 (ix),l
   6790 DD 74 FF      [19]  374 	ld	-1 (ix),h
                            375 ;src/main.c:154: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   6793 3A F9 65      [13]  376 	ld	a, (#(_prota + 0x0001) + 0)
   6796 C6 14         [ 7]  377 	add	a, #0x14
   6798 47            [ 4]  378 	ld	b,a
   6799 3A F8 65      [13]  379 	ld	a, (#_prota + 0)
   679C C6 04         [ 7]  380 	add	a, #0x04
   679E C5            [11]  381 	push	bc
   679F 33            [ 6]  382 	inc	sp
   67A0 F5            [11]  383 	push	af
   67A1 33            [ 6]  384 	inc	sp
   67A2 CD 16 67      [17]  385 	call	_getTilePtr
   67A5 F1            [10]  386 	pop	af
   67A6 4D            [ 4]  387 	ld	c,l
   67A7 44            [ 4]  388 	ld	b,h
                            389 ;src/main.c:155: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   67A8 3A F9 65      [13]  390 	ld	a, (#(_prota + 0x0001) + 0)
   67AB C6 0B         [ 7]  391 	add	a, #0x0B
   67AD 57            [ 4]  392 	ld	d,a
   67AE 3A F8 65      [13]  393 	ld	a, (#_prota + 0)
   67B1 C6 04         [ 7]  394 	add	a, #0x04
   67B3 C5            [11]  395 	push	bc
   67B4 D5            [11]  396 	push	de
   67B5 33            [ 6]  397 	inc	sp
   67B6 F5            [11]  398 	push	af
   67B7 33            [ 6]  399 	inc	sp
   67B8 CD 16 67      [17]  400 	call	_getTilePtr
   67BB F1            [10]  401 	pop	af
   67BC EB            [ 4]  402 	ex	de,hl
   67BD C1            [10]  403 	pop	bc
                            404 ;src/main.c:156: break;
   67BE C3 5B 68      [10]  405 	jp	00105$
                            406 ;src/main.c:157: case 1:
   67C1                     407 00102$:
                            408 ;src/main.c:158: headTile  = getTilePtr(prota.x - 1, prota.y);
   67C1 21 F9 65      [10]  409 	ld	hl, #(_prota + 0x0001) + 0
   67C4 46            [ 7]  410 	ld	b,(hl)
   67C5 21 F8 65      [10]  411 	ld	hl, #_prota + 0
   67C8 56            [ 7]  412 	ld	d,(hl)
   67C9 15            [ 4]  413 	dec	d
   67CA 4A            [ 4]  414 	ld	c, d
   67CB C5            [11]  415 	push	bc
   67CC CD 16 67      [17]  416 	call	_getTilePtr
   67CF F1            [10]  417 	pop	af
   67D0 DD 75 FE      [19]  418 	ld	-2 (ix),l
   67D3 DD 74 FF      [19]  419 	ld	-1 (ix),h
                            420 ;src/main.c:159: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
   67D6 3A F9 65      [13]  421 	ld	a, (#(_prota + 0x0001) + 0)
   67D9 C6 14         [ 7]  422 	add	a, #0x14
   67DB 47            [ 4]  423 	ld	b,a
   67DC 21 F8 65      [10]  424 	ld	hl, #_prota + 0
   67DF 56            [ 7]  425 	ld	d,(hl)
   67E0 15            [ 4]  426 	dec	d
   67E1 4A            [ 4]  427 	ld	c, d
   67E2 C5            [11]  428 	push	bc
   67E3 CD 16 67      [17]  429 	call	_getTilePtr
   67E6 F1            [10]  430 	pop	af
   67E7 4D            [ 4]  431 	ld	c,l
   67E8 44            [ 4]  432 	ld	b,h
                            433 ;src/main.c:160: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
   67E9 3A F9 65      [13]  434 	ld	a, (#(_prota + 0x0001) + 0)
   67EC C6 0B         [ 7]  435 	add	a, #0x0B
   67EE 57            [ 4]  436 	ld	d,a
   67EF 3A F8 65      [13]  437 	ld	a, (#_prota + 0)
   67F2 C6 FF         [ 7]  438 	add	a,#0xFF
   67F4 C5            [11]  439 	push	bc
   67F5 D5            [11]  440 	push	de
   67F6 33            [ 6]  441 	inc	sp
   67F7 F5            [11]  442 	push	af
   67F8 33            [ 6]  443 	inc	sp
   67F9 CD 16 67      [17]  444 	call	_getTilePtr
   67FC F1            [10]  445 	pop	af
   67FD EB            [ 4]  446 	ex	de,hl
   67FE C1            [10]  447 	pop	bc
                            448 ;src/main.c:161: break;
   67FF 18 5A         [12]  449 	jr	00105$
                            450 ;src/main.c:162: case 2:
   6801                     451 00103$:
                            452 ;src/main.c:163: headTile   = getTilePtr(prota.x, prota.y - 2);
   6801 21 F9 65      [10]  453 	ld	hl, #(_prota + 0x0001) + 0
   6804 46            [ 7]  454 	ld	b,(hl)
   6805 05            [ 4]  455 	dec	b
   6806 05            [ 4]  456 	dec	b
   6807 21 F8 65      [10]  457 	ld	hl, #_prota + 0
   680A 4E            [ 7]  458 	ld	c, (hl)
   680B C5            [11]  459 	push	bc
   680C CD 16 67      [17]  460 	call	_getTilePtr
   680F F1            [10]  461 	pop	af
   6810 DD 75 FE      [19]  462 	ld	-2 (ix),l
   6813 DD 74 FF      [19]  463 	ld	-1 (ix),h
                            464 ;src/main.c:164: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
   6816 3A F9 65      [13]  465 	ld	a, (#(_prota + 0x0001) + 0)
   6819 47            [ 4]  466 	ld	b,a
   681A 05            [ 4]  467 	dec	b
   681B 05            [ 4]  468 	dec	b
   681C 3A F8 65      [13]  469 	ld	a, (#_prota + 0)
   681F C6 03         [ 7]  470 	add	a, #0x03
   6821 C5            [11]  471 	push	bc
   6822 33            [ 6]  472 	inc	sp
   6823 F5            [11]  473 	push	af
   6824 33            [ 6]  474 	inc	sp
   6825 CD 16 67      [17]  475 	call	_getTilePtr
   6828 F1            [10]  476 	pop	af
   6829 4D            [ 4]  477 	ld	c,l
   682A 44            [ 4]  478 	ld	b,h
                            479 ;src/main.c:165: *waistTile = 0;
   682B AF            [ 4]  480 	xor	a, a
   682C 12            [ 7]  481 	ld	(de),a
                            482 ;src/main.c:166: break;
   682D 18 2C         [12]  483 	jr	00105$
                            484 ;src/main.c:167: case 3:
   682F                     485 00104$:
                            486 ;src/main.c:168: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
   682F 3A F9 65      [13]  487 	ld	a, (#(_prota + 0x0001) + 0)
   6832 C6 16         [ 7]  488 	add	a, #0x16
   6834 47            [ 4]  489 	ld	b,a
   6835 21 F8 65      [10]  490 	ld	hl, #_prota + 0
   6838 4E            [ 7]  491 	ld	c, (hl)
   6839 C5            [11]  492 	push	bc
   683A CD 16 67      [17]  493 	call	_getTilePtr
   683D F1            [10]  494 	pop	af
   683E DD 75 FE      [19]  495 	ld	-2 (ix),l
   6841 DD 74 FF      [19]  496 	ld	-1 (ix),h
                            497 ;src/main.c:169: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   6844 3A F9 65      [13]  498 	ld	a, (#(_prota + 0x0001) + 0)
   6847 C6 16         [ 7]  499 	add	a, #0x16
   6849 47            [ 4]  500 	ld	b,a
   684A 3A F8 65      [13]  501 	ld	a, (#_prota + 0)
   684D C6 03         [ 7]  502 	add	a, #0x03
   684F C5            [11]  503 	push	bc
   6850 33            [ 6]  504 	inc	sp
   6851 F5            [11]  505 	push	af
   6852 33            [ 6]  506 	inc	sp
   6853 CD 16 67      [17]  507 	call	_getTilePtr
   6856 F1            [10]  508 	pop	af
   6857 4D            [ 4]  509 	ld	c,l
   6858 44            [ 4]  510 	ld	b,h
                            511 ;src/main.c:170: *waistTile = 0;
   6859 AF            [ 4]  512 	xor	a, a
   685A 12            [ 7]  513 	ld	(de),a
                            514 ;src/main.c:172: }
   685B                     515 00105$:
                            516 ;src/main.c:174: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   685B DD 6E FE      [19]  517 	ld	l,-2 (ix)
   685E DD 66 FF      [19]  518 	ld	h,-1 (ix)
   6861 6E            [ 7]  519 	ld	l,(hl)
   6862 3E 02         [ 7]  520 	ld	a,#0x02
   6864 95            [ 4]  521 	sub	a, l
   6865 38 0E         [12]  522 	jr	C,00106$
   6867 0A            [ 7]  523 	ld	a,(bc)
   6868 4F            [ 4]  524 	ld	c,a
   6869 3E 02         [ 7]  525 	ld	a,#0x02
   686B 91            [ 4]  526 	sub	a, c
   686C 38 07         [12]  527 	jr	C,00106$
   686E 1A            [ 7]  528 	ld	a,(de)
   686F 4F            [ 4]  529 	ld	c,a
   6870 3E 02         [ 7]  530 	ld	a,#0x02
   6872 91            [ 4]  531 	sub	a, c
   6873 30 04         [12]  532 	jr	NC,00107$
   6875                     533 00106$:
                            534 ;src/main.c:175: return 1;
   6875 2E 01         [ 7]  535 	ld	l,#0x01
   6877 18 02         [12]  536 	jr	00110$
   6879                     537 00107$:
                            538 ;src/main.c:177: return 0;
   6879 2E 00         [ 7]  539 	ld	l,#0x00
   687B                     540 00110$:
   687B DD F9         [10]  541 	ld	sp, ix
   687D DD E1         [14]  542 	pop	ix
   687F C9            [10]  543 	ret
                            544 ;src/main.c:181: void dibujarEnemigo() {
                            545 ;	---------------------------------
                            546 ; Function dibujarEnemigo
                            547 ; ---------------------------------
   6880                     548 _dibujarEnemigo::
                            549 ;src/main.c:182: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy.x, enemy.y);
   6880 21 F1 65      [10]  550 	ld	hl, #_enemy + 1
   6883 56            [ 7]  551 	ld	d,(hl)
   6884 21 F0 65      [10]  552 	ld	hl, #_enemy + 0
   6887 46            [ 7]  553 	ld	b,(hl)
   6888 D5            [11]  554 	push	de
   6889 33            [ 6]  555 	inc	sp
   688A C5            [11]  556 	push	bc
   688B 33            [ 6]  557 	inc	sp
   688C 21 00 C0      [10]  558 	ld	hl,#0xC000
   688F E5            [11]  559 	push	hl
   6890 CD 93 65      [17]  560 	call	_cpct_getScreenPtr
   6893 EB            [ 4]  561 	ex	de,hl
                            562 ;src/main.c:183: cpct_drawSpriteMaskedAlignedTable (enemy.sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   6894 ED 4B F4 65   [20]  563 	ld	bc, (#_enemy + 4)
   6898 21 00 3E      [10]  564 	ld	hl,#_g_tablatrans
   689B E5            [11]  565 	push	hl
   689C 21 04 16      [10]  566 	ld	hl,#0x1604
   689F E5            [11]  567 	push	hl
   68A0 D5            [11]  568 	push	de
   68A1 C5            [11]  569 	push	bc
   68A2 CD B3 65      [17]  570 	call	_cpct_drawSpriteMaskedAlignedTable
   68A5 C9            [10]  571 	ret
                            572 ;src/main.c:186: void borrarEnemigo() {
                            573 ;	---------------------------------
                            574 ; Function borrarEnemigo
                            575 ; ---------------------------------
   68A6                     576 _borrarEnemigo::
   68A6 DD E5         [15]  577 	push	ix
   68A8 DD 21 00 00   [14]  578 	ld	ix,#0
   68AC DD 39         [15]  579 	add	ix,sp
   68AE 3B            [ 6]  580 	dec	sp
                            581 ;src/main.c:188: u8 w = 4 + (enemy.px & 1);
   68AF 21 F2 65      [10]  582 	ld	hl, #_enemy + 2
   68B2 4E            [ 7]  583 	ld	c,(hl)
   68B3 79            [ 4]  584 	ld	a,c
   68B4 E6 01         [ 7]  585 	and	a, #0x01
   68B6 47            [ 4]  586 	ld	b,a
   68B7 04            [ 4]  587 	inc	b
   68B8 04            [ 4]  588 	inc	b
   68B9 04            [ 4]  589 	inc	b
   68BA 04            [ 4]  590 	inc	b
                            591 ;src/main.c:191: u8 h = 7 + (enemy.py & 2 ? 1 : 0);
   68BB 21 F3 65      [10]  592 	ld	hl, #_enemy + 3
   68BE 5E            [ 7]  593 	ld	e,(hl)
   68BF CB 4B         [ 8]  594 	bit	1, e
   68C1 28 04         [12]  595 	jr	Z,00103$
   68C3 3E 01         [ 7]  596 	ld	a,#0x01
   68C5 18 02         [12]  597 	jr	00104$
   68C7                     598 00103$:
   68C7 3E 00         [ 7]  599 	ld	a,#0x00
   68C9                     600 00104$:
   68C9 C6 07         [ 7]  601 	add	a, #0x07
   68CB DD 77 FF      [19]  602 	ld	-1 (ix),a
                            603 ;src/main.c:193: cpct_etm_drawTileBox2x4 (enemy.px / 2, (enemy.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   68CE FD 2A 5A 66   [20]  604 	ld	iy,(_mapa)
   68D2 16 00         [ 7]  605 	ld	d,#0x00
   68D4 63            [ 4]  606 	ld	h,e
   68D5 6A            [ 4]  607 	ld	l,d
   68D6 CB 7A         [ 8]  608 	bit	7, d
   68D8 28 05         [12]  609 	jr	Z,00105$
   68DA 13            [ 6]  610 	inc	de
   68DB 13            [ 6]  611 	inc	de
   68DC 13            [ 6]  612 	inc	de
   68DD 63            [ 4]  613 	ld	h,e
   68DE 6A            [ 4]  614 	ld	l,d
   68DF                     615 00105$:
   68DF 5C            [ 4]  616 	ld	e, h
   68E0 55            [ 4]  617 	ld	d, l
   68E1 CB 2A         [ 8]  618 	sra	d
   68E3 CB 1B         [ 8]  619 	rr	e
   68E5 CB 2A         [ 8]  620 	sra	d
   68E7 CB 1B         [ 8]  621 	rr	e
   68E9 51            [ 4]  622 	ld	d,c
   68EA CB 3A         [ 8]  623 	srl	d
   68EC FD E5         [15]  624 	push	iy
   68EE 21 00 C0      [10]  625 	ld	hl,#0xC000
   68F1 E5            [11]  626 	push	hl
   68F2 3E 28         [ 7]  627 	ld	a,#0x28
   68F4 F5            [11]  628 	push	af
   68F5 33            [ 6]  629 	inc	sp
   68F6 DD 7E FF      [19]  630 	ld	a,-1 (ix)
   68F9 F5            [11]  631 	push	af
   68FA 33            [ 6]  632 	inc	sp
   68FB C5            [11]  633 	push	bc
   68FC 33            [ 6]  634 	inc	sp
   68FD 7B            [ 4]  635 	ld	a,e
   68FE F5            [11]  636 	push	af
   68FF 33            [ 6]  637 	inc	sp
   6900 D5            [11]  638 	push	de
   6901 33            [ 6]  639 	inc	sp
   6902 CD 8C 5A      [17]  640 	call	_cpct_etm_drawTileBox2x4
   6905 33            [ 6]  641 	inc	sp
   6906 DD E1         [14]  642 	pop	ix
   6908 C9            [10]  643 	ret
                            644 ;src/main.c:198: void redibujarEnemigo() {
                            645 ;	---------------------------------
                            646 ; Function redibujarEnemigo
                            647 ; ---------------------------------
   6909                     648 _redibujarEnemigo::
                            649 ;src/main.c:199: borrarEnemigo();
   6909 CD A6 68      [17]  650 	call	_borrarEnemigo
                            651 ;src/main.c:200: enemy.px = enemy.x;
   690C 01 F2 65      [10]  652 	ld	bc,#_enemy + 2
   690F 3A F0 65      [13]  653 	ld	a, (#_enemy + 0)
   6912 02            [ 7]  654 	ld	(bc),a
                            655 ;src/main.c:201: enemy.py = enemy.y;
   6913 01 F3 65      [10]  656 	ld	bc,#_enemy + 3
   6916 3A F1 65      [13]  657 	ld	a, (#_enemy + 1)
   6919 02            [ 7]  658 	ld	(bc),a
                            659 ;src/main.c:202: dibujarEnemigo();
   691A C3 80 68      [10]  660 	jp  _dibujarEnemigo
                            661 ;src/main.c:205: u8 checkEnemyCollision(int direction){
                            662 ;	---------------------------------
                            663 ; Function checkEnemyCollision
                            664 ; ---------------------------------
   691D                     665 _checkEnemyCollision::
   691D DD E5         [15]  666 	push	ix
   691F DD 21 00 00   [14]  667 	ld	ix,#0
   6923 DD 39         [15]  668 	add	ix,sp
   6925 F5            [11]  669 	push	af
   6926 F5            [11]  670 	push	af
                            671 ;src/main.c:207: u8 colisiona = 1;
   6927 DD 36 FC 01   [19]  672 	ld	-4 (ix),#0x01
                            673 ;src/main.c:209: switch (direction) {
   692B DD CB 05 7E   [20]  674 	bit	7, 5 (ix)
   692F C2 FF 6A      [10]  675 	jp	NZ,00135$
   6932 3E 03         [ 7]  676 	ld	a,#0x03
   6934 DD BE 04      [19]  677 	cp	a, 4 (ix)
   6937 3E 00         [ 7]  678 	ld	a,#0x00
   6939 DD 9E 05      [19]  679 	sbc	a, 5 (ix)
   693C E2 41 69      [10]  680 	jp	PO, 00194$
   693F EE 80         [ 7]  681 	xor	a, #0x80
   6941                     682 00194$:
   6941 FA FF 6A      [10]  683 	jp	M,00135$
   6944 DD 5E 04      [19]  684 	ld	e,4 (ix)
   6947 16 00         [ 7]  685 	ld	d,#0x00
   6949 21 50 69      [10]  686 	ld	hl,#00195$
   694C 19            [11]  687 	add	hl,de
   694D 19            [11]  688 	add	hl,de
   694E 19            [11]  689 	add	hl,de
   694F E9            [ 4]  690 	jp	(hl)
   6950                     691 00195$:
   6950 C3 FF 6A      [10]  692 	jp	00135$
   6953 C3 FF 6A      [10]  693 	jp	00135$
   6956 C3 29 6A      [10]  694 	jp	00119$
   6959 C3 62 69      [10]  695 	jp	00103$
                            696 ;src/main.c:210: case 0:
                            697 ;src/main.c:212: break;
   695C C3 FF 6A      [10]  698 	jp	00135$
                            699 ;src/main.c:213: case 1:
                            700 ;src/main.c:215: break;
   695F C3 FF 6A      [10]  701 	jp	00135$
                            702 ;src/main.c:216: case 3:
   6962                     703 00103$:
                            704 ;src/main.c:219: if( *getTilePtr(enemy.x, enemy.y + G_ENEMY_H + 2) <= 2
   6962 3A F1 65      [13]  705 	ld	a, (#(_enemy + 0x0001) + 0)
   6965 C6 18         [ 7]  706 	add	a, #0x18
   6967 57            [ 4]  707 	ld	d,a
   6968 21 F0 65      [10]  708 	ld	hl, #_enemy + 0
   696B 46            [ 7]  709 	ld	b,(hl)
   696C D5            [11]  710 	push	de
   696D 33            [ 6]  711 	inc	sp
   696E C5            [11]  712 	push	bc
   696F 33            [ 6]  713 	inc	sp
   6970 CD 16 67      [17]  714 	call	_getTilePtr
   6973 F1            [10]  715 	pop	af
   6974 4E            [ 7]  716 	ld	c,(hl)
                            717 ;src/main.c:232: enemy.mira = M_arriba;
                            718 ;src/main.c:219: if( *getTilePtr(enemy.x, enemy.y + G_ENEMY_H + 2) <= 2
   6975 3E 02         [ 7]  719 	ld	a,#0x02
   6977 91            [ 4]  720 	sub	a, c
   6978 DA 21 6A      [10]  721 	jp	C,00115$
                            722 ;src/main.c:220: && *getTilePtr(enemy.x + G_ENEMY_W / 2, enemy.y + G_ENEMY_H + 2) <= 2
   697B 3A F1 65      [13]  723 	ld	a, (#(_enemy + 0x0001) + 0)
   697E C6 18         [ 7]  724 	add	a, #0x18
   6980 57            [ 4]  725 	ld	d,a
   6981 3A F0 65      [13]  726 	ld	a, (#_enemy + 0)
   6984 47            [ 4]  727 	ld	b,a
   6985 04            [ 4]  728 	inc	b
   6986 04            [ 4]  729 	inc	b
   6987 D5            [11]  730 	push	de
   6988 33            [ 6]  731 	inc	sp
   6989 C5            [11]  732 	push	bc
   698A 33            [ 6]  733 	inc	sp
   698B CD 16 67      [17]  734 	call	_getTilePtr
   698E F1            [10]  735 	pop	af
   698F 4E            [ 7]  736 	ld	c,(hl)
   6990 3E 02         [ 7]  737 	ld	a,#0x02
   6992 91            [ 4]  738 	sub	a, c
   6993 DA 21 6A      [10]  739 	jp	C,00115$
                            740 ;src/main.c:221: && *getTilePtr(enemy.x + G_ENEMY_W, enemy.y + G_ENEMY_H + 2) <= 2)			  
   6996 3A F1 65      [13]  741 	ld	a, (#(_enemy + 0x0001) + 0)
   6999 C6 18         [ 7]  742 	add	a, #0x18
   699B 47            [ 4]  743 	ld	b,a
   699C 3A F0 65      [13]  744 	ld	a, (#_enemy + 0)
   699F C6 04         [ 7]  745 	add	a, #0x04
   69A1 C5            [11]  746 	push	bc
   69A2 33            [ 6]  747 	inc	sp
   69A3 F5            [11]  748 	push	af
   69A4 33            [ 6]  749 	inc	sp
   69A5 CD 16 67      [17]  750 	call	_getTilePtr
   69A8 F1            [10]  751 	pop	af
   69A9 4E            [ 7]  752 	ld	c,(hl)
   69AA 3E 02         [ 7]  753 	ld	a,#0x02
   69AC 91            [ 4]  754 	sub	a, c
   69AD 38 72         [12]  755 	jr	C,00115$
                            756 ;src/main.c:223: if( (prota.x + G_HERO_W -4) < enemy.x || prota.x  > (enemy.x + G_ENEMY_W) ){
   69AF 21 F8 65      [10]  757 	ld	hl,#_prota+0
   69B2 4E            [ 7]  758 	ld	c,(hl)
   69B3 06 00         [ 7]  759 	ld	b,#0x00
   69B5 59            [ 4]  760 	ld	e, c
   69B6 50            [ 4]  761 	ld	d, b
   69B7 13            [ 6]  762 	inc	de
   69B8 13            [ 6]  763 	inc	de
   69B9 13            [ 6]  764 	inc	de
   69BA 21 F0 65      [10]  765 	ld	hl, #_enemy + 0
   69BD 6E            [ 7]  766 	ld	l,(hl)
   69BE 26 00         [ 7]  767 	ld	h,#0x00
   69C0 7B            [ 4]  768 	ld	a,e
   69C1 95            [ 4]  769 	sub	a, l
   69C2 7A            [ 4]  770 	ld	a,d
   69C3 9C            [ 4]  771 	sbc	a, h
   69C4 E2 C9 69      [10]  772 	jp	PO, 00196$
   69C7 EE 80         [ 7]  773 	xor	a, #0x80
   69C9                     774 00196$:
   69C9 FA DC 69      [10]  775 	jp	M,00110$
   69CC 11 04 00      [10]  776 	ld	de,#0x0004
   69CF 19            [11]  777 	add	hl,de
   69D0 7D            [ 4]  778 	ld	a,l
   69D1 91            [ 4]  779 	sub	a, c
   69D2 7C            [ 4]  780 	ld	a,h
   69D3 98            [ 4]  781 	sbc	a, b
   69D4 E2 D9 69      [10]  782 	jp	PO, 00197$
   69D7 EE 80         [ 7]  783 	xor	a, #0x80
   69D9                     784 00197$:
   69D9 F2 E3 69      [10]  785 	jp	P,00111$
   69DC                     786 00110$:
                            787 ;src/main.c:224: colisiona = 0;
   69DC DD 36 FC 00   [19]  788 	ld	-4 (ix),#0x00
   69E0 C3 FF 6A      [10]  789 	jp	00135$
   69E3                     790 00111$:
                            791 ;src/main.c:227: if(prota.y > enemy.y){ //si el prota esta abajo
   69E3 21 F9 65      [10]  792 	ld	hl,#_prota+1
   69E6 4E            [ 7]  793 	ld	c,(hl)
   69E7 21 F1 65      [10]  794 	ld	hl, #(_enemy + 0x0001) + 0
   69EA 5E            [ 7]  795 	ld	e,(hl)
   69EB 7B            [ 4]  796 	ld	a,e
   69EC 91            [ 4]  797 	sub	a, c
   69ED 30 2B         [12]  798 	jr	NC,00108$
                            799 ;src/main.c:228: if( prota.y - (enemy.y + G_ENEMY_H) > 2){ // si hay espacio entre el enemigo y el prota
   69EF 06 00         [ 7]  800 	ld	b,#0x00
   69F1 16 00         [ 7]  801 	ld	d,#0x00
   69F3 21 16 00      [10]  802 	ld	hl,#0x0016
   69F6 19            [11]  803 	add	hl,de
   69F7 79            [ 4]  804 	ld	a,c
   69F8 95            [ 4]  805 	sub	a, l
   69F9 4F            [ 4]  806 	ld	c,a
   69FA 78            [ 4]  807 	ld	a,b
   69FB 9C            [ 4]  808 	sbc	a, h
   69FC 47            [ 4]  809 	ld	b,a
   69FD 3E 02         [ 7]  810 	ld	a,#0x02
   69FF B9            [ 4]  811 	cp	a, c
   6A00 3E 00         [ 7]  812 	ld	a,#0x00
   6A02 98            [ 4]  813 	sbc	a, b
   6A03 E2 08 6A      [10]  814 	jp	PO, 00198$
   6A06 EE 80         [ 7]  815 	xor	a, #0x80
   6A08                     816 00198$:
   6A08 F2 12 6A      [10]  817 	jp	P,00105$
                            818 ;src/main.c:229: colisiona = 0;
   6A0B DD 36 FC 00   [19]  819 	ld	-4 (ix),#0x00
   6A0F C3 FF 6A      [10]  820 	jp	00135$
   6A12                     821 00105$:
                            822 ;src/main.c:232: enemy.mira = M_arriba;
   6A12 21 F7 65      [10]  823 	ld	hl,#(_enemy + 0x0007)
   6A15 36 02         [10]  824 	ld	(hl),#0x02
   6A17 C3 FF 6A      [10]  825 	jp	00135$
   6A1A                     826 00108$:
                            827 ;src/main.c:235: colisiona = 0;
   6A1A DD 36 FC 00   [19]  828 	ld	-4 (ix),#0x00
   6A1E C3 FF 6A      [10]  829 	jp	00135$
   6A21                     830 00115$:
                            831 ;src/main.c:239: enemy.mira = M_arriba;
   6A21 21 F7 65      [10]  832 	ld	hl,#(_enemy + 0x0007)
   6A24 36 02         [10]  833 	ld	(hl),#0x02
                            834 ;src/main.c:241: break;
   6A26 C3 FF 6A      [10]  835 	jp	00135$
                            836 ;src/main.c:242: case 2:
   6A29                     837 00119$:
                            838 ;src/main.c:243: if( *getTilePtr(enemy.x, enemy.y - 2) <= 2
   6A29 21 F1 65      [10]  839 	ld	hl, #(_enemy + 0x0001) + 0
   6A2C 56            [ 7]  840 	ld	d,(hl)
   6A2D 15            [ 4]  841 	dec	d
   6A2E 15            [ 4]  842 	dec	d
   6A2F 21 F0 65      [10]  843 	ld	hl, #_enemy + 0
   6A32 46            [ 7]  844 	ld	b,(hl)
   6A33 D5            [11]  845 	push	de
   6A34 33            [ 6]  846 	inc	sp
   6A35 C5            [11]  847 	push	bc
   6A36 33            [ 6]  848 	inc	sp
   6A37 CD 16 67      [17]  849 	call	_getTilePtr
   6A3A F1            [10]  850 	pop	af
   6A3B 4E            [ 7]  851 	ld	c,(hl)
                            852 ;src/main.c:257: enemy.mira = M_abajo;
                            853 ;src/main.c:243: if( *getTilePtr(enemy.x, enemy.y - 2) <= 2
   6A3C 3E 02         [ 7]  854 	ld	a,#0x02
   6A3E 91            [ 4]  855 	sub	a, c
   6A3F DA FA 6A      [10]  856 	jp	C,00131$
                            857 ;src/main.c:244: && *getTilePtr(enemy.x + G_ENEMY_W / 2, enemy.y - 2) <= 2
   6A42 21 F1 65      [10]  858 	ld	hl, #(_enemy + 0x0001) + 0
   6A45 56            [ 7]  859 	ld	d,(hl)
   6A46 15            [ 4]  860 	dec	d
   6A47 15            [ 4]  861 	dec	d
   6A48 21 F0 65      [10]  862 	ld	hl, #_enemy + 0
   6A4B 46            [ 7]  863 	ld	b,(hl)
   6A4C 04            [ 4]  864 	inc	b
   6A4D 04            [ 4]  865 	inc	b
   6A4E D5            [11]  866 	push	de
   6A4F 33            [ 6]  867 	inc	sp
   6A50 C5            [11]  868 	push	bc
   6A51 33            [ 6]  869 	inc	sp
   6A52 CD 16 67      [17]  870 	call	_getTilePtr
   6A55 F1            [10]  871 	pop	af
   6A56 4E            [ 7]  872 	ld	c,(hl)
   6A57 3E 02         [ 7]  873 	ld	a,#0x02
   6A59 91            [ 4]  874 	sub	a, c
   6A5A DA FA 6A      [10]  875 	jp	C,00131$
                            876 ;src/main.c:245: && *getTilePtr(enemy.x + G_ENEMY_W, enemy.y - 2) <= 2)
   6A5D 21 F1 65      [10]  877 	ld	hl, #(_enemy + 0x0001) + 0
   6A60 46            [ 7]  878 	ld	b,(hl)
   6A61 05            [ 4]  879 	dec	b
   6A62 05            [ 4]  880 	dec	b
   6A63 3A F0 65      [13]  881 	ld	a, (#_enemy + 0)
   6A66 C6 04         [ 7]  882 	add	a, #0x04
   6A68 C5            [11]  883 	push	bc
   6A69 33            [ 6]  884 	inc	sp
   6A6A F5            [11]  885 	push	af
   6A6B 33            [ 6]  886 	inc	sp
   6A6C CD 16 67      [17]  887 	call	_getTilePtr
   6A6F F1            [10]  888 	pop	af
   6A70 4E            [ 7]  889 	ld	c,(hl)
   6A71 3E 02         [ 7]  890 	ld	a,#0x02
   6A73 91            [ 4]  891 	sub	a, c
   6A74 DA FA 6A      [10]  892 	jp	C,00131$
                            893 ;src/main.c:247: if((prota.x + G_HERO_W -4) < enemy.x || prota.x  > (enemy.x + G_ENEMY_W)){
   6A77 21 F8 65      [10]  894 	ld	hl,#_prota+0
   6A7A 4E            [ 7]  895 	ld	c,(hl)
   6A7B 06 00         [ 7]  896 	ld	b,#0x00
   6A7D 21 03 00      [10]  897 	ld	hl,#0x0003
   6A80 09            [11]  898 	add	hl,bc
   6A81 DD 75 FE      [19]  899 	ld	-2 (ix),l
   6A84 DD 74 FF      [19]  900 	ld	-1 (ix),h
   6A87 21 F0 65      [10]  901 	ld	hl, #_enemy + 0
   6A8A 5E            [ 7]  902 	ld	e,(hl)
   6A8B 16 00         [ 7]  903 	ld	d,#0x00
                            904 ;src/main.c:243: if( *getTilePtr(enemy.x, enemy.y - 2) <= 2
   6A8D 3A F1 65      [13]  905 	ld	a,(#(_enemy + 0x0001) + 0)
   6A90 DD 77 FD      [19]  906 	ld	-3 (ix),a
                            907 ;src/main.c:247: if((prota.x + G_HERO_W -4) < enemy.x || prota.x  > (enemy.x + G_ENEMY_W)){
   6A93 DD 7E FE      [19]  908 	ld	a,-2 (ix)
   6A96 93            [ 4]  909 	sub	a, e
   6A97 DD 7E FF      [19]  910 	ld	a,-1 (ix)
   6A9A 9A            [ 4]  911 	sbc	a, d
   6A9B E2 A0 6A      [10]  912 	jp	PO, 00199$
   6A9E EE 80         [ 7]  913 	xor	a, #0x80
   6AA0                     914 00199$:
   6AA0 FA B3 6A      [10]  915 	jp	M,00126$
   6AA3 13            [ 6]  916 	inc	de
   6AA4 13            [ 6]  917 	inc	de
   6AA5 13            [ 6]  918 	inc	de
   6AA6 13            [ 6]  919 	inc	de
   6AA7 7B            [ 4]  920 	ld	a,e
   6AA8 91            [ 4]  921 	sub	a, c
   6AA9 7A            [ 4]  922 	ld	a,d
   6AAA 98            [ 4]  923 	sbc	a, b
   6AAB E2 B0 6A      [10]  924 	jp	PO, 00200$
   6AAE EE 80         [ 7]  925 	xor	a, #0x80
   6AB0                     926 00200$:
   6AB0 F2 C1 6A      [10]  927 	jp	P,00127$
   6AB3                     928 00126$:
                            929 ;src/main.c:248: enemy.y--;
   6AB3 DD 4E FD      [19]  930 	ld	c,-3 (ix)
   6AB6 0D            [ 4]  931 	dec	c
   6AB7 21 F1 65      [10]  932 	ld	hl,#(_enemy + 0x0001)
   6ABA 71            [ 7]  933 	ld	(hl),c
                            934 ;src/main.c:249: colisiona = 0;
   6ABB DD 36 FC 00   [19]  935 	ld	-4 (ix),#0x00
   6ABF 18 3E         [12]  936 	jr	00135$
   6AC1                     937 00127$:
                            938 ;src/main.c:252: if(enemy.y>prota.y){
   6AC1 21 F9 65      [10]  939 	ld	hl,#_prota+1
   6AC4 5E            [ 7]  940 	ld	e,(hl)
   6AC5 7B            [ 4]  941 	ld	a,e
   6AC6 DD 96 FD      [19]  942 	sub	a, -3 (ix)
   6AC9 30 29         [12]  943 	jr	NC,00124$
                            944 ;src/main.c:253: if(enemy.y - (prota.y + G_HERO_H -2) >= 2){
   6ACB DD 4E FD      [19]  945 	ld	c,-3 (ix)
   6ACE 06 00         [ 7]  946 	ld	b,#0x00
   6AD0 16 00         [ 7]  947 	ld	d,#0x00
   6AD2 21 14 00      [10]  948 	ld	hl,#0x0014
   6AD5 19            [11]  949 	add	hl,de
   6AD6 79            [ 4]  950 	ld	a,c
   6AD7 95            [ 4]  951 	sub	a, l
   6AD8 4F            [ 4]  952 	ld	c,a
   6AD9 78            [ 4]  953 	ld	a,b
   6ADA 9C            [ 4]  954 	sbc	a, h
   6ADB 47            [ 4]  955 	ld	b,a
   6ADC 79            [ 4]  956 	ld	a,c
   6ADD D6 02         [ 7]  957 	sub	a, #0x02
   6ADF 78            [ 4]  958 	ld	a,b
   6AE0 17            [ 4]  959 	rla
   6AE1 3F            [ 4]  960 	ccf
   6AE2 1F            [ 4]  961 	rra
   6AE3 DE 80         [ 7]  962 	sbc	a, #0x80
   6AE5 38 06         [12]  963 	jr	C,00121$
                            964 ;src/main.c:254: colisiona = 0;
   6AE7 DD 36 FC 00   [19]  965 	ld	-4 (ix),#0x00
   6AEB 18 12         [12]  966 	jr	00135$
   6AED                     967 00121$:
                            968 ;src/main.c:257: enemy.mira = M_abajo;
   6AED 21 F7 65      [10]  969 	ld	hl,#(_enemy + 0x0007)
   6AF0 36 03         [10]  970 	ld	(hl),#0x03
   6AF2 18 0B         [12]  971 	jr	00135$
   6AF4                     972 00124$:
                            973 ;src/main.c:260: colisiona = 0;
   6AF4 DD 36 FC 00   [19]  974 	ld	-4 (ix),#0x00
   6AF8 18 05         [12]  975 	jr	00135$
   6AFA                     976 00131$:
                            977 ;src/main.c:266: enemy.mira = M_abajo;
   6AFA 21 F7 65      [10]  978 	ld	hl,#(_enemy + 0x0007)
   6AFD 36 03         [10]  979 	ld	(hl),#0x03
                            980 ;src/main.c:268: }
   6AFF                     981 00135$:
                            982 ;src/main.c:269: return colisiona;
   6AFF DD 6E FC      [19]  983 	ld	l,-4 (ix)
   6B02 DD F9         [10]  984 	ld	sp, ix
   6B04 DD E1         [14]  985 	pop	ix
   6B06 C9            [10]  986 	ret
                            987 ;src/main.c:272: void moverEnemigo(){
                            988 ;	---------------------------------
                            989 ; Function moverEnemigo
                            990 ; ---------------------------------
   6B07                     991 _moverEnemigo::
                            992 ;src/main.c:274: if(!checkEnemyCollision(enemy.mira)){
   6B07 21 F7 65      [10]  993 	ld	hl,#_enemy+7
   6B0A 4E            [ 7]  994 	ld	c,(hl)
   6B0B 06 00         [ 7]  995 	ld	b,#0x00
   6B0D E5            [11]  996 	push	hl
   6B0E C5            [11]  997 	push	bc
   6B0F CD 1D 69      [17]  998 	call	_checkEnemyCollision
   6B12 F1            [10]  999 	pop	af
   6B13 7D            [ 4] 1000 	ld	a,l
   6B14 E1            [10] 1001 	pop	hl
   6B15 B7            [ 4] 1002 	or	a, a
   6B16 C0            [11] 1003 	ret	NZ
                           1004 ;src/main.c:276: switch (enemy.mira) {
   6B17 5E            [ 7] 1005 	ld	e,(hl)
   6B18 3E 03         [ 7] 1006 	ld	a,#0x03
   6B1A 93            [ 4] 1007 	sub	a, e
   6B1B D8            [11] 1008 	ret	C
   6B1C 16 00         [ 7] 1009 	ld	d,#0x00
   6B1E 21 24 6B      [10] 1010 	ld	hl,#00118$
   6B21 19            [11] 1011 	add	hl,de
   6B22 19            [11] 1012 	add	hl,de
                           1013 ;src/main.c:277: case 0:
                           1014 ;src/main.c:279: break;
                           1015 ;src/main.c:280: case 1:
                           1016 ;src/main.c:282: break;
                           1017 ;src/main.c:283: case 2:
   6B23 E9            [ 4] 1018 	jp	(hl)
   6B24                    1019 00118$:
   6B24 18 10         [12] 1020 	jr	00108$
   6B26 18 0E         [12] 1021 	jr	00108$
   6B28 18 06         [12] 1022 	jr	00103$
   6B2A 18 07         [12] 1023 	jr	00104$
   6B2C 18 08         [12] 1024 	jr	00108$
   6B2E 18 06         [12] 1025 	jr	00108$
   6B30                    1026 00103$:
                           1027 ;src/main.c:284: moverEnemigoArriba();
                           1028 ;src/main.c:285: break;
   6B30 C3 37 6B      [10] 1029 	jp  _moverEnemigoArriba
                           1030 ;src/main.c:286: case 3:
   6B33                    1031 00104$:
                           1032 ;src/main.c:287: moverEnemigoAbajo();
   6B33 CD 44 6B      [17] 1033 	call	_moverEnemigoAbajo
                           1034 ;src/main.c:289: }
   6B36                    1035 00108$:
   6B36 C9            [10] 1036 	ret
                           1037 ;src/main.c:294: void moverEnemigoArriba(){
                           1038 ;	---------------------------------
                           1039 ; Function moverEnemigoArriba
                           1040 ; ---------------------------------
   6B37                    1041 _moverEnemigoArriba::
                           1042 ;src/main.c:295: enemy.y--;
   6B37 01 F1 65      [10] 1043 	ld	bc,#_enemy+1
   6B3A 0A            [ 7] 1044 	ld	a,(bc)
   6B3B C6 FF         [ 7] 1045 	add	a,#0xFF
   6B3D 02            [ 7] 1046 	ld	(bc),a
                           1047 ;src/main.c:296: enemy.y--;
   6B3E C6 FF         [ 7] 1048 	add	a,#0xFF
   6B40 02            [ 7] 1049 	ld	(bc),a
                           1050 ;src/main.c:297: redibujarEnemigo();
   6B41 C3 09 69      [10] 1051 	jp  _redibujarEnemigo
                           1052 ;src/main.c:300: void moverEnemigoAbajo(){
                           1053 ;	---------------------------------
                           1054 ; Function moverEnemigoAbajo
                           1055 ; ---------------------------------
   6B44                    1056 _moverEnemigoAbajo::
                           1057 ;src/main.c:301: enemy.y++;
   6B44 01 F1 65      [10] 1058 	ld	bc,#_enemy+1
   6B47 0A            [ 7] 1059 	ld	a,(bc)
   6B48 3C            [ 4] 1060 	inc	a
   6B49 02            [ 7] 1061 	ld	(bc),a
                           1062 ;src/main.c:302: enemy.y++;
   6B4A 3C            [ 4] 1063 	inc	a
   6B4B 02            [ 7] 1064 	ld	(bc),a
                           1065 ;src/main.c:303: redibujarEnemigo();
   6B4C C3 09 69      [10] 1066 	jp  _redibujarEnemigo
                           1067 ;src/main.c:306: void avanzarMapa() {
                           1068 ;	---------------------------------
                           1069 ; Function avanzarMapa
                           1070 ; ---------------------------------
   6B4F                    1071 _avanzarMapa::
                           1072 ;src/main.c:307: if(num_mapa < NUM_MAPAS -1) {
   6B4F 3A 5C 66      [13] 1073 	ld	a,(#_num_mapa + 0)
   6B52 D6 02         [ 7] 1074 	sub	a, #0x02
   6B54 D2 96 71      [10] 1075 	jp	NC,_menuFin
                           1076 ;src/main.c:308: mapa = mapas[++num_mapa];
   6B57 21 5C 66      [10] 1077 	ld	hl, #_num_mapa+0
   6B5A 34            [11] 1078 	inc	(hl)
   6B5B FD 21 5C 66   [14] 1079 	ld	iy,#_num_mapa
   6B5F FD 6E 00      [19] 1080 	ld	l,0 (iy)
   6B62 26 00         [ 7] 1081 	ld	h,#0x00
   6B64 29            [11] 1082 	add	hl, hl
   6B65 11 73 66      [10] 1083 	ld	de,#_mapas
   6B68 19            [11] 1084 	add	hl,de
   6B69 7E            [ 7] 1085 	ld	a,(hl)
   6B6A FD 21 5A 66   [14] 1086 	ld	iy,#_mapa
   6B6E FD 77 00      [19] 1087 	ld	0 (iy),a
   6B71 23            [ 6] 1088 	inc	hl
   6B72 7E            [ 7] 1089 	ld	a,(hl)
   6B73 32 5B 66      [13] 1090 	ld	(#_mapa + 1),a
                           1091 ;src/main.c:309: prota.x = prota.px = 2;
   6B76 21 FA 65      [10] 1092 	ld	hl,#(_prota + 0x0002)
   6B79 36 02         [10] 1093 	ld	(hl),#0x02
   6B7B 21 F8 65      [10] 1094 	ld	hl,#_prota
   6B7E 36 02         [10] 1095 	ld	(hl),#0x02
                           1096 ;src/main.c:310: prota.mover = SI;
   6B80 21 FE 65      [10] 1097 	ld	hl,#(_prota + 0x0006)
                           1098 ;src/main.c:311: dibujarMapa();
                           1099 ;src/main.c:315: menuFin();
   6B83 36 01         [10] 1100 	ld	(hl), #0x01
   6B85 C3 5D 66      [10] 1101 	jp	_dibujarMapa
                           1102 ;src/main.c:319: void moverIzquierda() {
                           1103 ;	---------------------------------
                           1104 ; Function moverIzquierda
                           1105 ; ---------------------------------
   6B88                    1106 _moverIzquierda::
                           1107 ;src/main.c:320: prota.mira = M_izquierda;
   6B88 01 F8 65      [10] 1108 	ld	bc,#_prota+0
   6B8B 21 FF 65      [10] 1109 	ld	hl,#(_prota + 0x0007)
   6B8E 36 01         [10] 1110 	ld	(hl),#0x01
                           1111 ;src/main.c:321: if (!checkCollision(M_izquierda)) {
   6B90 C5            [11] 1112 	push	bc
   6B91 21 01 00      [10] 1113 	ld	hl,#0x0001
   6B94 E5            [11] 1114 	push	hl
   6B95 CD 3E 67      [17] 1115 	call	_checkCollision
   6B98 F1            [10] 1116 	pop	af
   6B99 C1            [10] 1117 	pop	bc
   6B9A 7D            [ 4] 1118 	ld	a,l
   6B9B B7            [ 4] 1119 	or	a, a
   6B9C C0            [11] 1120 	ret	NZ
                           1121 ;src/main.c:322: prota.x--;
   6B9D 0A            [ 7] 1122 	ld	a,(bc)
   6B9E C6 FF         [ 7] 1123 	add	a,#0xFF
   6BA0 02            [ 7] 1124 	ld	(bc),a
                           1125 ;src/main.c:323: prota.mover = SI;
   6BA1 21 FE 65      [10] 1126 	ld	hl,#(_prota + 0x0006)
   6BA4 36 01         [10] 1127 	ld	(hl),#0x01
                           1128 ;src/main.c:324: prota.sprite = g_hero_left;
   6BA6 21 46 57      [10] 1129 	ld	hl,#_g_hero_left
   6BA9 22 FC 65      [16] 1130 	ld	((_prota + 0x0004)), hl
   6BAC C9            [10] 1131 	ret
                           1132 ;src/main.c:328: void moverDerecha() {
                           1133 ;	---------------------------------
                           1134 ; Function moverDerecha
                           1135 ; ---------------------------------
   6BAD                    1136 _moverDerecha::
                           1137 ;src/main.c:329: prota.mira = M_derecha;
   6BAD 21 FF 65      [10] 1138 	ld	hl,#(_prota + 0x0007)
   6BB0 36 00         [10] 1139 	ld	(hl),#0x00
                           1140 ;src/main.c:330: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   6BB2 21 00 00      [10] 1141 	ld	hl,#0x0000
   6BB5 E5            [11] 1142 	push	hl
   6BB6 CD 3E 67      [17] 1143 	call	_checkCollision
   6BB9 F1            [10] 1144 	pop	af
   6BBA 45            [ 4] 1145 	ld	b,l
   6BBB 21 F8 65      [10] 1146 	ld	hl, #_prota + 0
   6BBE 4E            [ 7] 1147 	ld	c,(hl)
   6BBF 59            [ 4] 1148 	ld	e,c
   6BC0 16 00         [ 7] 1149 	ld	d,#0x00
   6BC2 21 07 00      [10] 1150 	ld	hl,#0x0007
   6BC5 19            [11] 1151 	add	hl,de
   6BC6 11 50 80      [10] 1152 	ld	de, #0x8050
   6BC9 29            [11] 1153 	add	hl, hl
   6BCA 3F            [ 4] 1154 	ccf
   6BCB CB 1C         [ 8] 1155 	rr	h
   6BCD CB 1D         [ 8] 1156 	rr	l
   6BCF ED 52         [15] 1157 	sbc	hl, de
   6BD1 3E 00         [ 7] 1158 	ld	a,#0x00
   6BD3 17            [ 4] 1159 	rla
   6BD4 5F            [ 4] 1160 	ld	e,a
   6BD5 78            [ 4] 1161 	ld	a,b
   6BD6 B7            [ 4] 1162 	or	a,a
   6BD7 20 14         [12] 1163 	jr	NZ,00104$
   6BD9 B3            [ 4] 1164 	or	a,e
   6BDA 28 11         [12] 1165 	jr	Z,00104$
                           1166 ;src/main.c:331: prota.x++;
   6BDC 0C            [ 4] 1167 	inc	c
   6BDD 21 F8 65      [10] 1168 	ld	hl,#_prota
   6BE0 71            [ 7] 1169 	ld	(hl),c
                           1170 ;src/main.c:332: prota.mover = SI;
   6BE1 21 FE 65      [10] 1171 	ld	hl,#(_prota + 0x0006)
   6BE4 36 01         [10] 1172 	ld	(hl),#0x01
                           1173 ;src/main.c:333: prota.sprite = g_hero;
   6BE6 21 F0 57      [10] 1174 	ld	hl,#_g_hero
   6BE9 22 FC 65      [16] 1175 	ld	((_prota + 0x0004)), hl
   6BEC C9            [10] 1176 	ret
   6BED                    1177 00104$:
                           1178 ;src/main.c:335: }else if( prota.x + G_HERO_W >= 80){
   6BED 7B            [ 4] 1179 	ld	a,e
   6BEE B7            [ 4] 1180 	or	a, a
   6BEF C0            [11] 1181 	ret	NZ
                           1182 ;src/main.c:336: avanzarMapa();	
   6BF0 C3 4F 6B      [10] 1183 	jp  _avanzarMapa
                           1184 ;src/main.c:340: void moverArriba() {
                           1185 ;	---------------------------------
                           1186 ; Function moverArriba
                           1187 ; ---------------------------------
   6BF3                    1188 _moverArriba::
                           1189 ;src/main.c:341: prota.mira = M_arriba;
   6BF3 21 FF 65      [10] 1190 	ld	hl,#(_prota + 0x0007)
   6BF6 36 02         [10] 1191 	ld	(hl),#0x02
                           1192 ;src/main.c:342: if (!checkCollision(M_arriba) && (prota.y >= 0)) { // TODO: COMPROBAR
   6BF8 21 02 00      [10] 1193 	ld	hl,#0x0002
   6BFB E5            [11] 1194 	push	hl
   6BFC CD 3E 67      [17] 1195 	call	_checkCollision
   6BFF F1            [10] 1196 	pop	af
   6C00 7D            [ 4] 1197 	ld	a,l
   6C01 B7            [ 4] 1198 	or	a, a
   6C02 C0            [11] 1199 	ret	NZ
                           1200 ;src/main.c:343: prota.y--;
   6C03 21 F9 65      [10] 1201 	ld	hl,#_prota + 1
   6C06 4E            [ 7] 1202 	ld	c,(hl)
   6C07 0D            [ 4] 1203 	dec	c
   6C08 71            [ 7] 1204 	ld	(hl),c
                           1205 ;src/main.c:344: prota.y--;
   6C09 0D            [ 4] 1206 	dec	c
   6C0A 71            [ 7] 1207 	ld	(hl),c
                           1208 ;src/main.c:345: prota.mover  = SI;
   6C0B 21 FE 65      [10] 1209 	ld	hl,#(_prota + 0x0006)
   6C0E 36 01         [10] 1210 	ld	(hl),#0x01
                           1211 ;src/main.c:346: prota.sprite = g_hero_up;
   6C10 21 AC 56      [10] 1212 	ld	hl,#_g_hero_up
   6C13 22 FC 65      [16] 1213 	ld	((_prota + 0x0004)), hl
   6C16 C9            [10] 1214 	ret
                           1215 ;src/main.c:350: void moverAbajo() {
                           1216 ;	---------------------------------
                           1217 ; Function moverAbajo
                           1218 ; ---------------------------------
   6C17                    1219 _moverAbajo::
                           1220 ;src/main.c:351: prota.mira = M_abajo;
   6C17 21 FF 65      [10] 1221 	ld	hl,#(_prota + 0x0007)
   6C1A 36 03         [10] 1222 	ld	(hl),#0x03
                           1223 ;src/main.c:352: if (!checkCollision(M_abajo) && (prota.y + G_HERO_H < ALTO_MAPA)) { // TODO: COMPROBAR
   6C1C 21 03 00      [10] 1224 	ld	hl,#0x0003
   6C1F E5            [11] 1225 	push	hl
   6C20 CD 3E 67      [17] 1226 	call	_checkCollision
   6C23 F1            [10] 1227 	pop	af
   6C24 7D            [ 4] 1228 	ld	a,l
   6C25 B7            [ 4] 1229 	or	a, a
   6C26 C0            [11] 1230 	ret	NZ
   6C27 01 F9 65      [10] 1231 	ld	bc,#_prota + 1
   6C2A 0A            [ 7] 1232 	ld	a,(bc)
   6C2B 5F            [ 4] 1233 	ld	e,a
   6C2C 6B            [ 4] 1234 	ld	l,e
   6C2D 26 00         [ 7] 1235 	ld	h,#0x00
   6C2F D5            [11] 1236 	push	de
   6C30 11 16 00      [10] 1237 	ld	de,#0x0016
   6C33 19            [11] 1238 	add	hl, de
   6C34 D1            [10] 1239 	pop	de
   6C35 7D            [ 4] 1240 	ld	a,l
   6C36 D6 B0         [ 7] 1241 	sub	a, #0xB0
   6C38 7C            [ 4] 1242 	ld	a,h
   6C39 17            [ 4] 1243 	rla
   6C3A 3F            [ 4] 1244 	ccf
   6C3B 1F            [ 4] 1245 	rra
   6C3C DE 80         [ 7] 1246 	sbc	a, #0x80
   6C3E D0            [11] 1247 	ret	NC
                           1248 ;src/main.c:353: prota.y++;
   6C3F 7B            [ 4] 1249 	ld	a,e
   6C40 3C            [ 4] 1250 	inc	a
   6C41 02            [ 7] 1251 	ld	(bc),a
                           1252 ;src/main.c:354: prota.y++;
   6C42 3C            [ 4] 1253 	inc	a
   6C43 02            [ 7] 1254 	ld	(bc),a
                           1255 ;src/main.c:355: prota.mover  = SI;
   6C44 21 FE 65      [10] 1256 	ld	hl,#(_prota + 0x0006)
   6C47 36 01         [10] 1257 	ld	(hl),#0x01
                           1258 ;src/main.c:356: prota.sprite = g_hero_down;
   6C49 21 12 56      [10] 1259 	ld	hl,#_g_hero_down
   6C4C 22 FC 65      [16] 1260 	ld	((_prota + 0x0004)), hl
   6C4F C9            [10] 1261 	ret
                           1262 ;src/main.c:360: void dibujarCuchillo(TKnife* actual) {
                           1263 ;	---------------------------------
                           1264 ; Function dibujarCuchillo
                           1265 ; ---------------------------------
   6C50                    1266 _dibujarCuchillo::
   6C50 DD E5         [15] 1267 	push	ix
   6C52 DD 21 00 00   [14] 1268 	ld	ix,#0
   6C56 DD 39         [15] 1269 	add	ix,sp
   6C58 F5            [11] 1270 	push	af
   6C59 F5            [11] 1271 	push	af
                           1272 ;src/main.c:361: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, actual->x, actual->y);
   6C5A DD 5E 04      [19] 1273 	ld	e,4 (ix)
   6C5D DD 56 05      [19] 1274 	ld	d,5 (ix)
   6C60 6B            [ 4] 1275 	ld	l, e
   6C61 62            [ 4] 1276 	ld	h, d
   6C62 23            [ 6] 1277 	inc	hl
   6C63 46            [ 7] 1278 	ld	b,(hl)
   6C64 1A            [ 7] 1279 	ld	a,(de)
   6C65 D5            [11] 1280 	push	de
   6C66 C5            [11] 1281 	push	bc
   6C67 33            [ 6] 1282 	inc	sp
   6C68 F5            [11] 1283 	push	af
   6C69 33            [ 6] 1284 	inc	sp
   6C6A 21 00 C0      [10] 1285 	ld	hl,#0xC000
   6C6D E5            [11] 1286 	push	hl
   6C6E CD 93 65      [17] 1287 	call	_cpct_getScreenPtr
   6C71 D1            [10] 1288 	pop	de
   6C72 E5            [11] 1289 	push	hl
   6C73 FD E1         [14] 1290 	pop	iy
                           1291 ;src/main.c:362: if(actual->eje == E_X){
   6C75 6B            [ 4] 1292 	ld	l, e
   6C76 62            [ 4] 1293 	ld	h, d
   6C77 01 08 00      [10] 1294 	ld	bc, #0x0008
   6C7A 09            [11] 1295 	add	hl, bc
   6C7B 4E            [ 7] 1296 	ld	c,(hl)
                           1297 ;src/main.c:363: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   6C7C FD E5         [15] 1298 	push	iy
   6C7E F1            [10] 1299 	pop	af
   6C7F DD 77 FD      [19] 1300 	ld	-3 (ix),a
   6C82 FD E5         [15] 1301 	push	iy
   6C84 3B            [ 6] 1302 	dec	sp
   6C85 F1            [10] 1303 	pop	af
   6C86 33            [ 6] 1304 	inc	sp
   6C87 DD 77 FC      [19] 1305 	ld	-4 (ix),a
   6C8A 21 04 00      [10] 1306 	ld	hl,#0x0004
   6C8D 19            [11] 1307 	add	hl,de
   6C8E DD 75 FE      [19] 1308 	ld	-2 (ix),l
   6C91 DD 74 FF      [19] 1309 	ld	-1 (ix),h
                           1310 ;src/main.c:362: if(actual->eje == E_X){
   6C94 79            [ 4] 1311 	ld	a,c
   6C95 B7            [ 4] 1312 	or	a, a
   6C96 20 1E         [12] 1313 	jr	NZ,00104$
                           1314 ;src/main.c:363: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   6C98 11 00 3E      [10] 1315 	ld	de,#_g_tablatrans+0
   6C9B DD 6E FE      [19] 1316 	ld	l,-2 (ix)
   6C9E DD 66 FF      [19] 1317 	ld	h,-1 (ix)
   6CA1 4E            [ 7] 1318 	ld	c,(hl)
   6CA2 23            [ 6] 1319 	inc	hl
   6CA3 46            [ 7] 1320 	ld	b,(hl)
   6CA4 D5            [11] 1321 	push	de
   6CA5 21 04 04      [10] 1322 	ld	hl,#0x0404
   6CA8 E5            [11] 1323 	push	hl
   6CA9 DD 6E FC      [19] 1324 	ld	l,-4 (ix)
   6CAC DD 66 FD      [19] 1325 	ld	h,-3 (ix)
   6CAF E5            [11] 1326 	push	hl
   6CB0 C5            [11] 1327 	push	bc
   6CB1 CD B3 65      [17] 1328 	call	_cpct_drawSpriteMaskedAlignedTable
   6CB4 18 1F         [12] 1329 	jr	00106$
   6CB6                    1330 00104$:
                           1331 ;src/main.c:366: else if(actual->eje == E_Y){
   6CB6 0D            [ 4] 1332 	dec	c
   6CB7 20 1C         [12] 1333 	jr	NZ,00106$
                           1334 ;src/main.c:367: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   6CB9 11 00 3E      [10] 1335 	ld	de,#_g_tablatrans+0
   6CBC DD 6E FE      [19] 1336 	ld	l,-2 (ix)
   6CBF DD 66 FF      [19] 1337 	ld	h,-1 (ix)
   6CC2 4E            [ 7] 1338 	ld	c,(hl)
   6CC3 23            [ 6] 1339 	inc	hl
   6CC4 46            [ 7] 1340 	ld	b,(hl)
   6CC5 D5            [11] 1341 	push	de
   6CC6 21 02 08      [10] 1342 	ld	hl,#0x0802
   6CC9 E5            [11] 1343 	push	hl
   6CCA DD 6E FC      [19] 1344 	ld	l,-4 (ix)
   6CCD DD 66 FD      [19] 1345 	ld	h,-3 (ix)
   6CD0 E5            [11] 1346 	push	hl
   6CD1 C5            [11] 1347 	push	bc
   6CD2 CD B3 65      [17] 1348 	call	_cpct_drawSpriteMaskedAlignedTable
   6CD5                    1349 00106$:
   6CD5 DD F9         [10] 1350 	ld	sp, ix
   6CD7 DD E1         [14] 1351 	pop	ix
   6CD9 C9            [10] 1352 	ret
                           1353 ;src/main.c:371: void borrarCuchillo(TKnife* actual) {
                           1354 ;	---------------------------------
                           1355 ; Function borrarCuchillo
                           1356 ; ---------------------------------
   6CDA                    1357 _borrarCuchillo::
   6CDA DD E5         [15] 1358 	push	ix
   6CDC DD 21 00 00   [14] 1359 	ld	ix,#0
   6CE0 DD 39         [15] 1360 	add	ix,sp
   6CE2 3B            [ 6] 1361 	dec	sp
                           1362 ;src/main.c:372: u8 w = 2 + (actual->px & 1);
   6CE3 DD 5E 04      [19] 1363 	ld	e,4 (ix)
   6CE6 DD 56 05      [19] 1364 	ld	d,5 (ix)
   6CE9 6B            [ 4] 1365 	ld	l, e
   6CEA 62            [ 4] 1366 	ld	h, d
   6CEB 23            [ 6] 1367 	inc	hl
   6CEC 23            [ 6] 1368 	inc	hl
   6CED 4E            [ 7] 1369 	ld	c,(hl)
   6CEE 79            [ 4] 1370 	ld	a,c
   6CEF E6 01         [ 7] 1371 	and	a, #0x01
   6CF1 47            [ 4] 1372 	ld	b,a
   6CF2 04            [ 4] 1373 	inc	b
   6CF3 04            [ 4] 1374 	inc	b
                           1375 ;src/main.c:373: u8 h = 2 + (actual->py & 3 ? 1 : 0);
   6CF4 EB            [ 4] 1376 	ex	de,hl
   6CF5 23            [ 6] 1377 	inc	hl
   6CF6 23            [ 6] 1378 	inc	hl
   6CF7 23            [ 6] 1379 	inc	hl
   6CF8 5E            [ 7] 1380 	ld	e,(hl)
   6CF9 7B            [ 4] 1381 	ld	a,e
   6CFA E6 03         [ 7] 1382 	and	a, #0x03
   6CFC 28 04         [12] 1383 	jr	Z,00103$
   6CFE 3E 01         [ 7] 1384 	ld	a,#0x01
   6D00 18 02         [12] 1385 	jr	00104$
   6D02                    1386 00103$:
   6D02 3E 00         [ 7] 1387 	ld	a,#0x00
   6D04                    1388 00104$:
   6D04 C6 02         [ 7] 1389 	add	a, #0x02
   6D06 DD 77 FF      [19] 1390 	ld	-1 (ix),a
                           1391 ;src/main.c:374: cpct_etm_drawTileBox2x4 (actual->px / 2, (actual->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   6D09 FD 2A 5A 66   [20] 1392 	ld	iy,(_mapa)
   6D0D 16 00         [ 7] 1393 	ld	d,#0x00
   6D0F 63            [ 4] 1394 	ld	h,e
   6D10 6A            [ 4] 1395 	ld	l,d
   6D11 CB 7A         [ 8] 1396 	bit	7, d
   6D13 28 05         [12] 1397 	jr	Z,00105$
   6D15 13            [ 6] 1398 	inc	de
   6D16 13            [ 6] 1399 	inc	de
   6D17 13            [ 6] 1400 	inc	de
   6D18 63            [ 4] 1401 	ld	h,e
   6D19 6A            [ 4] 1402 	ld	l,d
   6D1A                    1403 00105$:
   6D1A 5C            [ 4] 1404 	ld	e, h
   6D1B 55            [ 4] 1405 	ld	d, l
   6D1C CB 2A         [ 8] 1406 	sra	d
   6D1E CB 1B         [ 8] 1407 	rr	e
   6D20 CB 2A         [ 8] 1408 	sra	d
   6D22 CB 1B         [ 8] 1409 	rr	e
   6D24 51            [ 4] 1410 	ld	d,c
   6D25 CB 3A         [ 8] 1411 	srl	d
   6D27 FD E5         [15] 1412 	push	iy
   6D29 21 00 C0      [10] 1413 	ld	hl,#0xC000
   6D2C E5            [11] 1414 	push	hl
   6D2D 3E 28         [ 7] 1415 	ld	a,#0x28
   6D2F F5            [11] 1416 	push	af
   6D30 33            [ 6] 1417 	inc	sp
   6D31 DD 7E FF      [19] 1418 	ld	a,-1 (ix)
   6D34 F5            [11] 1419 	push	af
   6D35 33            [ 6] 1420 	inc	sp
   6D36 C5            [11] 1421 	push	bc
   6D37 33            [ 6] 1422 	inc	sp
   6D38 7B            [ 4] 1423 	ld	a,e
   6D39 F5            [11] 1424 	push	af
   6D3A 33            [ 6] 1425 	inc	sp
   6D3B D5            [11] 1426 	push	de
   6D3C 33            [ 6] 1427 	inc	sp
   6D3D CD 8C 5A      [17] 1428 	call	_cpct_etm_drawTileBox2x4
   6D40 33            [ 6] 1429 	inc	sp
   6D41 DD E1         [14] 1430 	pop	ix
   6D43 C9            [10] 1431 	ret
                           1432 ;src/main.c:377: void redibujarCuchillo(TKnife* actual) {
                           1433 ;	---------------------------------
                           1434 ; Function redibujarCuchillo
                           1435 ; ---------------------------------
   6D44                    1436 _redibujarCuchillo::
   6D44 DD E5         [15] 1437 	push	ix
   6D46 DD 21 00 00   [14] 1438 	ld	ix,#0
   6D4A DD 39         [15] 1439 	add	ix,sp
                           1440 ;src/main.c:378: borrarCuchillo(actual);
   6D4C DD 6E 04      [19] 1441 	ld	l,4 (ix)
   6D4F DD 66 05      [19] 1442 	ld	h,5 (ix)
   6D52 E5            [11] 1443 	push	hl
   6D53 CD DA 6C      [17] 1444 	call	_borrarCuchillo
   6D56 F1            [10] 1445 	pop	af
                           1446 ;src/main.c:379: actual->px = actual->x;
   6D57 DD 4E 04      [19] 1447 	ld	c,4 (ix)
   6D5A DD 46 05      [19] 1448 	ld	b,5 (ix)
   6D5D 59            [ 4] 1449 	ld	e, c
   6D5E 50            [ 4] 1450 	ld	d, b
   6D5F 13            [ 6] 1451 	inc	de
   6D60 13            [ 6] 1452 	inc	de
   6D61 0A            [ 7] 1453 	ld	a,(bc)
   6D62 12            [ 7] 1454 	ld	(de),a
                           1455 ;src/main.c:380: actual->py = actual->y;
   6D63 59            [ 4] 1456 	ld	e, c
   6D64 50            [ 4] 1457 	ld	d, b
   6D65 13            [ 6] 1458 	inc	de
   6D66 13            [ 6] 1459 	inc	de
   6D67 13            [ 6] 1460 	inc	de
   6D68 69            [ 4] 1461 	ld	l, c
   6D69 60            [ 4] 1462 	ld	h, b
   6D6A 23            [ 6] 1463 	inc	hl
   6D6B 7E            [ 7] 1464 	ld	a,(hl)
   6D6C 12            [ 7] 1465 	ld	(de),a
                           1466 ;src/main.c:381: dibujarCuchillo(actual);
   6D6D C5            [11] 1467 	push	bc
   6D6E CD 50 6C      [17] 1468 	call	_dibujarCuchillo
   6D71 F1            [10] 1469 	pop	af
   6D72 DD E1         [14] 1470 	pop	ix
   6D74 C9            [10] 1471 	ret
                           1472 ;src/main.c:385: void lanzarCuchillo(){
                           1473 ;	---------------------------------
                           1474 ; Function lanzarCuchillo
                           1475 ; ---------------------------------
   6D75                    1476 _lanzarCuchillo::
   6D75 DD E5         [15] 1477 	push	ix
   6D77 DD 21 00 00   [14] 1478 	ld	ix,#0
   6D7B DD 39         [15] 1479 	add	ix,sp
   6D7D 21 F6 FF      [10] 1480 	ld	hl,#-10
   6D80 39            [11] 1481 	add	hl,sp
   6D81 F9            [ 6] 1482 	ld	sp,hl
                           1483 ;src/main.c:387: TKnife* actual = cu;
   6D82 01 00 66      [10] 1484 	ld	bc,#_cu+0
                           1485 ;src/main.c:390: while(i>0 && actual->lanzado){
   6D85 1E 0A         [ 7] 1486 	ld	e,#0x0A
   6D87                    1487 00102$:
   6D87 21 06 00      [10] 1488 	ld	hl,#0x0006
   6D8A 09            [11] 1489 	add	hl,bc
   6D8B E3            [19] 1490 	ex	(sp), hl
   6D8C 7B            [ 4] 1491 	ld	a,e
   6D8D B7            [ 4] 1492 	or	a, a
   6D8E 28 0F         [12] 1493 	jr	Z,00104$
   6D90 E1            [10] 1494 	pop	hl
   6D91 E5            [11] 1495 	push	hl
   6D92 7E            [ 7] 1496 	ld	a,(hl)
   6D93 B7            [ 4] 1497 	or	a, a
   6D94 28 09         [12] 1498 	jr	Z,00104$
                           1499 ;src/main.c:391: --i;
   6D96 1D            [ 4] 1500 	dec	e
                           1501 ;src/main.c:392: actual++;
   6D97 21 09 00      [10] 1502 	ld	hl,#0x0009
   6D9A 09            [11] 1503 	add	hl,bc
   6D9B 4D            [ 4] 1504 	ld	c,l
   6D9C 44            [ 4] 1505 	ld	b,h
   6D9D 18 E8         [12] 1506 	jr	00102$
   6D9F                    1507 00104$:
                           1508 ;src/main.c:395: if(i>0 && !actual->lanzado){
   6D9F 7B            [ 4] 1509 	ld	a,e
   6DA0 B7            [ 4] 1510 	or	a, a
   6DA1 CA 36 6F      [10] 1511 	jp	Z,00127$
   6DA4 E1            [10] 1512 	pop	hl
   6DA5 E5            [11] 1513 	push	hl
   6DA6 7E            [ 7] 1514 	ld	a,(hl)
   6DA7 B7            [ 4] 1515 	or	a, a
   6DA8 C2 36 6F      [10] 1516 	jp	NZ,00127$
                           1517 ;src/main.c:397: if(prota.mira == M_derecha){
   6DAB 21 FF 65      [10] 1518 	ld	hl, #_prota + 7
   6DAE 5E            [ 7] 1519 	ld	e,(hl)
                           1520 ;src/main.c:399: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
                           1521 ;src/main.c:401: actual->direccion = M_derecha;
   6DAF 21 07 00      [10] 1522 	ld	hl,#0x0007
   6DB2 09            [11] 1523 	add	hl,bc
   6DB3 DD 75 FE      [19] 1524 	ld	-2 (ix),l
   6DB6 DD 74 FF      [19] 1525 	ld	-1 (ix),h
                           1526 ;src/main.c:403: actual->y=prota.y + G_HERO_H /2;
   6DB9 21 01 00      [10] 1527 	ld	hl,#0x0001
   6DBC 09            [11] 1528 	add	hl,bc
   6DBD DD 75 FC      [19] 1529 	ld	-4 (ix),l
   6DC0 DD 74 FD      [19] 1530 	ld	-3 (ix),h
                           1531 ;src/main.c:404: actual->sprite=g_knifeX_0;
   6DC3 21 04 00      [10] 1532 	ld	hl,#0x0004
   6DC6 09            [11] 1533 	add	hl,bc
   6DC7 DD 75 F8      [19] 1534 	ld	-8 (ix),l
   6DCA DD 74 F9      [19] 1535 	ld	-7 (ix),h
                           1536 ;src/main.c:405: actual->eje = E_X;
   6DCD 21 08 00      [10] 1537 	ld	hl,#0x0008
   6DD0 09            [11] 1538 	add	hl,bc
   6DD1 DD 75 FA      [19] 1539 	ld	-6 (ix),l
   6DD4 DD 74 FB      [19] 1540 	ld	-5 (ix),h
                           1541 ;src/main.c:397: if(prota.mira == M_derecha){
   6DD7 7B            [ 4] 1542 	ld	a,e
   6DD8 B7            [ 4] 1543 	or	a, a
   6DD9 20 55         [12] 1544 	jr	NZ,00122$
                           1545 ;src/main.c:399: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   6DDB 3A F9 65      [13] 1546 	ld	a, (#(_prota + 0x0001) + 0)
   6DDE C6 0B         [ 7] 1547 	add	a, #0x0B
   6DE0 57            [ 4] 1548 	ld	d,a
   6DE1 3A F8 65      [13] 1549 	ld	a, (#_prota + 0)
   6DE4 C6 0C         [ 7] 1550 	add	a, #0x0C
   6DE6 C5            [11] 1551 	push	bc
   6DE7 D5            [11] 1552 	push	de
   6DE8 33            [ 6] 1553 	inc	sp
   6DE9 F5            [11] 1554 	push	af
   6DEA 33            [ 6] 1555 	inc	sp
   6DEB CD 16 67      [17] 1556 	call	_getTilePtr
   6DEE F1            [10] 1557 	pop	af
   6DEF C1            [10] 1558 	pop	bc
   6DF0 5E            [ 7] 1559 	ld	e,(hl)
   6DF1 3E 02         [ 7] 1560 	ld	a,#0x02
   6DF3 93            [ 4] 1561 	sub	a, e
   6DF4 DA 36 6F      [10] 1562 	jp	C,00127$
                           1563 ;src/main.c:400: actual->lanzado = SI;
   6DF7 E1            [10] 1564 	pop	hl
   6DF8 E5            [11] 1565 	push	hl
   6DF9 36 01         [10] 1566 	ld	(hl),#0x01
                           1567 ;src/main.c:401: actual->direccion = M_derecha;
   6DFB DD 6E FE      [19] 1568 	ld	l,-2 (ix)
   6DFE DD 66 FF      [19] 1569 	ld	h,-1 (ix)
   6E01 36 00         [10] 1570 	ld	(hl),#0x00
                           1571 ;src/main.c:402: actual->x=prota.x + G_HERO_W;
   6E03 3A F8 65      [13] 1572 	ld	a, (#_prota + 0)
   6E06 C6 07         [ 7] 1573 	add	a, #0x07
   6E08 02            [ 7] 1574 	ld	(bc),a
                           1575 ;src/main.c:403: actual->y=prota.y + G_HERO_H /2;
   6E09 3A F9 65      [13] 1576 	ld	a, (#(_prota + 0x0001) + 0)
   6E0C C6 0B         [ 7] 1577 	add	a, #0x0B
   6E0E DD 6E FC      [19] 1578 	ld	l,-4 (ix)
   6E11 DD 66 FD      [19] 1579 	ld	h,-3 (ix)
   6E14 77            [ 7] 1580 	ld	(hl),a
                           1581 ;src/main.c:404: actual->sprite=g_knifeX_0;
   6E15 DD 6E F8      [19] 1582 	ld	l,-8 (ix)
   6E18 DD 66 F9      [19] 1583 	ld	h,-7 (ix)
   6E1B 36 C0         [10] 1584 	ld	(hl),#<(_g_knifeX_0)
   6E1D 23            [ 6] 1585 	inc	hl
   6E1E 36 54         [10] 1586 	ld	(hl),#>(_g_knifeX_0)
                           1587 ;src/main.c:405: actual->eje = E_X;
   6E20 DD 6E FA      [19] 1588 	ld	l,-6 (ix)
   6E23 DD 66 FB      [19] 1589 	ld	h,-5 (ix)
   6E26 36 00         [10] 1590 	ld	(hl),#0x00
                           1591 ;src/main.c:406: dibujarCuchillo(actual);
   6E28 C5            [11] 1592 	push	bc
   6E29 CD 50 6C      [17] 1593 	call	_dibujarCuchillo
   6E2C F1            [10] 1594 	pop	af
   6E2D C3 36 6F      [10] 1595 	jp	00127$
   6E30                    1596 00122$:
                           1597 ;src/main.c:409: else if(prota.mira == M_izquierda){
   6E30 7B            [ 4] 1598 	ld	a,e
   6E31 3D            [ 4] 1599 	dec	a
   6E32 20 55         [12] 1600 	jr	NZ,00119$
                           1601 ;src/main.c:410: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   6E34 3A F9 65      [13] 1602 	ld	a, (#(_prota + 0x0001) + 0)
   6E37 C6 0B         [ 7] 1603 	add	a, #0x0B
   6E39 57            [ 4] 1604 	ld	d,a
   6E3A 3A F8 65      [13] 1605 	ld	a, (#_prota + 0)
   6E3D C6 F6         [ 7] 1606 	add	a,#0xF6
   6E3F C5            [11] 1607 	push	bc
   6E40 D5            [11] 1608 	push	de
   6E41 33            [ 6] 1609 	inc	sp
   6E42 F5            [11] 1610 	push	af
   6E43 33            [ 6] 1611 	inc	sp
   6E44 CD 16 67      [17] 1612 	call	_getTilePtr
   6E47 F1            [10] 1613 	pop	af
   6E48 C1            [10] 1614 	pop	bc
   6E49 5E            [ 7] 1615 	ld	e,(hl)
   6E4A 3E 02         [ 7] 1616 	ld	a,#0x02
   6E4C 93            [ 4] 1617 	sub	a, e
   6E4D DA 36 6F      [10] 1618 	jp	C,00127$
                           1619 ;src/main.c:411: actual->lanzado = SI;
   6E50 E1            [10] 1620 	pop	hl
   6E51 E5            [11] 1621 	push	hl
   6E52 36 01         [10] 1622 	ld	(hl),#0x01
                           1623 ;src/main.c:412: actual->direccion = M_izquierda;
   6E54 DD 6E FE      [19] 1624 	ld	l,-2 (ix)
   6E57 DD 66 FF      [19] 1625 	ld	h,-1 (ix)
   6E5A 36 01         [10] 1626 	ld	(hl),#0x01
                           1627 ;src/main.c:413: actual->x = prota.x - G_KNIFEX_0_W;
   6E5C 3A F8 65      [13] 1628 	ld	a, (#_prota + 0)
   6E5F C6 FC         [ 7] 1629 	add	a,#0xFC
   6E61 02            [ 7] 1630 	ld	(bc),a
                           1631 ;src/main.c:414: actual->y = prota.y + G_HERO_H /2;
   6E62 3A F9 65      [13] 1632 	ld	a, (#(_prota + 0x0001) + 0)
   6E65 C6 0B         [ 7] 1633 	add	a, #0x0B
   6E67 DD 6E FC      [19] 1634 	ld	l,-4 (ix)
   6E6A DD 66 FD      [19] 1635 	ld	h,-3 (ix)
   6E6D 77            [ 7] 1636 	ld	(hl),a
                           1637 ;src/main.c:415: actual->sprite = g_knifeX_1;
   6E6E DD 6E F8      [19] 1638 	ld	l,-8 (ix)
   6E71 DD 66 F9      [19] 1639 	ld	h,-7 (ix)
   6E74 36 D0         [10] 1640 	ld	(hl),#<(_g_knifeX_1)
   6E76 23            [ 6] 1641 	inc	hl
   6E77 36 54         [10] 1642 	ld	(hl),#>(_g_knifeX_1)
                           1643 ;src/main.c:416: actual->eje = E_X;
   6E79 DD 6E FA      [19] 1644 	ld	l,-6 (ix)
   6E7C DD 66 FB      [19] 1645 	ld	h,-5 (ix)
   6E7F 36 00         [10] 1646 	ld	(hl),#0x00
                           1647 ;src/main.c:417: dibujarCuchillo(actual);
   6E81 C5            [11] 1648 	push	bc
   6E82 CD 50 6C      [17] 1649 	call	_dibujarCuchillo
   6E85 F1            [10] 1650 	pop	af
   6E86 C3 36 6F      [10] 1651 	jp	00127$
   6E89                    1652 00119$:
                           1653 ;src/main.c:420: else if(prota.mira == M_abajo){
   6E89 7B            [ 4] 1654 	ld	a,e
   6E8A D6 03         [ 7] 1655 	sub	a, #0x03
   6E8C 20 54         [12] 1656 	jr	NZ,00116$
                           1657 ;src/main.c:422: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   6E8E 3A F9 65      [13] 1658 	ld	a, (#(_prota + 0x0001) + 0)
   6E91 C6 1F         [ 7] 1659 	add	a, #0x1F
   6E93 57            [ 4] 1660 	ld	d,a
   6E94 3A F8 65      [13] 1661 	ld	a, (#_prota + 0)
   6E97 C6 03         [ 7] 1662 	add	a, #0x03
   6E99 C5            [11] 1663 	push	bc
   6E9A D5            [11] 1664 	push	de
   6E9B 33            [ 6] 1665 	inc	sp
   6E9C F5            [11] 1666 	push	af
   6E9D 33            [ 6] 1667 	inc	sp
   6E9E CD 16 67      [17] 1668 	call	_getTilePtr
   6EA1 F1            [10] 1669 	pop	af
   6EA2 C1            [10] 1670 	pop	bc
   6EA3 5E            [ 7] 1671 	ld	e,(hl)
   6EA4 3E 02         [ 7] 1672 	ld	a,#0x02
   6EA6 93            [ 4] 1673 	sub	a, e
   6EA7 DA 36 6F      [10] 1674 	jp	C,00127$
                           1675 ;src/main.c:423: actual->lanzado = SI;
   6EAA E1            [10] 1676 	pop	hl
   6EAB E5            [11] 1677 	push	hl
   6EAC 36 01         [10] 1678 	ld	(hl),#0x01
                           1679 ;src/main.c:424: actual->direccion = M_abajo;
   6EAE DD 6E FE      [19] 1680 	ld	l,-2 (ix)
   6EB1 DD 66 FF      [19] 1681 	ld	h,-1 (ix)
   6EB4 36 03         [10] 1682 	ld	(hl),#0x03
                           1683 ;src/main.c:425: actual->x = prota.x + G_HERO_W / 2;
   6EB6 3A F8 65      [13] 1684 	ld	a, (#_prota + 0)
   6EB9 C6 03         [ 7] 1685 	add	a, #0x03
   6EBB 02            [ 7] 1686 	ld	(bc),a
                           1687 ;src/main.c:426: actual->y = prota.y + G_HERO_H;
   6EBC 3A F9 65      [13] 1688 	ld	a, (#(_prota + 0x0001) + 0)
   6EBF C6 16         [ 7] 1689 	add	a, #0x16
   6EC1 DD 6E FC      [19] 1690 	ld	l,-4 (ix)
   6EC4 DD 66 FD      [19] 1691 	ld	h,-3 (ix)
   6EC7 77            [ 7] 1692 	ld	(hl),a
                           1693 ;src/main.c:427: actual->sprite = g_knifeY_0;
   6EC8 DD 6E F8      [19] 1694 	ld	l,-8 (ix)
   6ECB DD 66 F9      [19] 1695 	ld	h,-7 (ix)
   6ECE 36 A0         [10] 1696 	ld	(hl),#<(_g_knifeY_0)
   6ED0 23            [ 6] 1697 	inc	hl
   6ED1 36 54         [10] 1698 	ld	(hl),#>(_g_knifeY_0)
                           1699 ;src/main.c:428: actual->eje = E_Y;
   6ED3 DD 6E FA      [19] 1700 	ld	l,-6 (ix)
   6ED6 DD 66 FB      [19] 1701 	ld	h,-5 (ix)
   6ED9 36 01         [10] 1702 	ld	(hl),#0x01
                           1703 ;src/main.c:429: dibujarCuchillo(actual);
   6EDB C5            [11] 1704 	push	bc
   6EDC CD 50 6C      [17] 1705 	call	_dibujarCuchillo
   6EDF F1            [10] 1706 	pop	af
   6EE0 18 54         [12] 1707 	jr	00127$
   6EE2                    1708 00116$:
                           1709 ;src/main.c:432: else if(prota.mira == M_arriba){
   6EE2 7B            [ 4] 1710 	ld	a,e
   6EE3 D6 02         [ 7] 1711 	sub	a, #0x02
   6EE5 20 4F         [12] 1712 	jr	NZ,00127$
                           1713 ;src/main.c:433: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   6EE7 3A F9 65      [13] 1714 	ld	a, (#(_prota + 0x0001) + 0)
   6EEA C6 F7         [ 7] 1715 	add	a,#0xF7
   6EEC 57            [ 4] 1716 	ld	d,a
   6EED 3A F8 65      [13] 1717 	ld	a, (#_prota + 0)
   6EF0 C6 03         [ 7] 1718 	add	a, #0x03
   6EF2 C5            [11] 1719 	push	bc
   6EF3 D5            [11] 1720 	push	de
   6EF4 33            [ 6] 1721 	inc	sp
   6EF5 F5            [11] 1722 	push	af
   6EF6 33            [ 6] 1723 	inc	sp
   6EF7 CD 16 67      [17] 1724 	call	_getTilePtr
   6EFA F1            [10] 1725 	pop	af
   6EFB C1            [10] 1726 	pop	bc
   6EFC 5E            [ 7] 1727 	ld	e,(hl)
   6EFD 3E 02         [ 7] 1728 	ld	a,#0x02
   6EFF 93            [ 4] 1729 	sub	a, e
   6F00 38 34         [12] 1730 	jr	C,00127$
                           1731 ;src/main.c:434: actual->lanzado = SI;
   6F02 E1            [10] 1732 	pop	hl
   6F03 E5            [11] 1733 	push	hl
   6F04 36 01         [10] 1734 	ld	(hl),#0x01
                           1735 ;src/main.c:435: actual->direccion = M_arriba;
   6F06 DD 6E FE      [19] 1736 	ld	l,-2 (ix)
   6F09 DD 66 FF      [19] 1737 	ld	h,-1 (ix)
   6F0C 36 02         [10] 1738 	ld	(hl),#0x02
                           1739 ;src/main.c:436: actual->x = prota.x + G_HERO_W / 2;
   6F0E 3A F8 65      [13] 1740 	ld	a, (#_prota + 0)
   6F11 C6 03         [ 7] 1741 	add	a, #0x03
   6F13 02            [ 7] 1742 	ld	(bc),a
                           1743 ;src/main.c:437: actual->y = prota.y;
   6F14 3A F9 65      [13] 1744 	ld	a, (#(_prota + 0x0001) + 0)
   6F17 DD 6E FC      [19] 1745 	ld	l,-4 (ix)
   6F1A DD 66 FD      [19] 1746 	ld	h,-3 (ix)
   6F1D 77            [ 7] 1747 	ld	(hl),a
                           1748 ;src/main.c:438: actual->sprite = g_knifeY_1;
   6F1E DD 6E F8      [19] 1749 	ld	l,-8 (ix)
   6F21 DD 66 F9      [19] 1750 	ld	h,-7 (ix)
   6F24 36 B0         [10] 1751 	ld	(hl),#<(_g_knifeY_1)
   6F26 23            [ 6] 1752 	inc	hl
   6F27 36 54         [10] 1753 	ld	(hl),#>(_g_knifeY_1)
                           1754 ;src/main.c:439: actual->eje = E_Y;
   6F29 DD 6E FA      [19] 1755 	ld	l,-6 (ix)
   6F2C DD 66 FB      [19] 1756 	ld	h,-5 (ix)
   6F2F 36 01         [10] 1757 	ld	(hl),#0x01
                           1758 ;src/main.c:440: dibujarCuchillo(actual);
   6F31 C5            [11] 1759 	push	bc
   6F32 CD 50 6C      [17] 1760 	call	_dibujarCuchillo
   6F35 F1            [10] 1761 	pop	af
   6F36                    1762 00127$:
   6F36 DD F9         [10] 1763 	ld	sp, ix
   6F38 DD E1         [14] 1764 	pop	ix
   6F3A C9            [10] 1765 	ret
                           1766 ;src/main.c:446: void comprobarTeclado() {
                           1767 ;	---------------------------------
                           1768 ; Function comprobarTeclado
                           1769 ; ---------------------------------
   6F3B                    1770 _comprobarTeclado::
                           1771 ;src/main.c:447: cpct_scanKeyboard_if();
   6F3B CD E4 5B      [17] 1772 	call	_cpct_scanKeyboard_if
                           1773 ;src/main.c:449: if (cpct_isAnyKeyPressed()) {
   6F3E CD D7 5B      [17] 1774 	call	_cpct_isAnyKeyPressed
   6F41 7D            [ 4] 1775 	ld	a,l
   6F42 B7            [ 4] 1776 	or	a, a
   6F43 C8            [11] 1777 	ret	Z
                           1778 ;src/main.c:450: if (cpct_isKeyPressed(Key_CursorLeft))
   6F44 21 01 01      [10] 1779 	ld	hl,#0x0101
   6F47 CD 41 59      [17] 1780 	call	_cpct_isKeyPressed
   6F4A 7D            [ 4] 1781 	ld	a,l
   6F4B B7            [ 4] 1782 	or	a, a
                           1783 ;src/main.c:451: moverIzquierda();
   6F4C C2 88 6B      [10] 1784 	jp	NZ,_moverIzquierda
                           1785 ;src/main.c:452: else if (cpct_isKeyPressed(Key_CursorRight))
   6F4F 21 00 02      [10] 1786 	ld	hl,#0x0200
   6F52 CD 41 59      [17] 1787 	call	_cpct_isKeyPressed
   6F55 7D            [ 4] 1788 	ld	a,l
   6F56 B7            [ 4] 1789 	or	a, a
                           1790 ;src/main.c:453: moverDerecha();
   6F57 C2 AD 6B      [10] 1791 	jp	NZ,_moverDerecha
                           1792 ;src/main.c:454: else if (cpct_isKeyPressed(Key_CursorUp))
   6F5A 21 00 01      [10] 1793 	ld	hl,#0x0100
   6F5D CD 41 59      [17] 1794 	call	_cpct_isKeyPressed
   6F60 7D            [ 4] 1795 	ld	a,l
   6F61 B7            [ 4] 1796 	or	a, a
                           1797 ;src/main.c:455: moverArriba();
   6F62 C2 F3 6B      [10] 1798 	jp	NZ,_moverArriba
                           1799 ;src/main.c:456: else if (cpct_isKeyPressed(Key_CursorDown))
   6F65 21 00 04      [10] 1800 	ld	hl,#0x0400
   6F68 CD 41 59      [17] 1801 	call	_cpct_isKeyPressed
   6F6B 7D            [ 4] 1802 	ld	a,l
   6F6C B7            [ 4] 1803 	or	a, a
                           1804 ;src/main.c:457: moverAbajo();
   6F6D C2 17 6C      [10] 1805 	jp	NZ,_moverAbajo
                           1806 ;src/main.c:458: else if (cpct_isKeyPressed(Key_Space))
   6F70 21 05 80      [10] 1807 	ld	hl,#0x8005
   6F73 CD 41 59      [17] 1808 	call	_cpct_isKeyPressed
   6F76 7D            [ 4] 1809 	ld	a,l
   6F77 B7            [ 4] 1810 	or	a, a
   6F78 C8            [11] 1811 	ret	Z
                           1812 ;src/main.c:459: lanzarCuchillo();
   6F79 C3 75 6D      [10] 1813 	jp  _lanzarCuchillo
                           1814 ;src/main.c:465: void moverCuchillo(){
                           1815 ;	---------------------------------
                           1816 ; Function moverCuchillo
                           1817 ; ---------------------------------
   6F7C                    1818 _moverCuchillo::
   6F7C DD E5         [15] 1819 	push	ix
   6F7E DD 21 00 00   [14] 1820 	ld	ix,#0
   6F82 DD 39         [15] 1821 	add	ix,sp
   6F84 F5            [11] 1822 	push	af
   6F85 F5            [11] 1823 	push	af
                           1824 ;src/main.c:467: u8 i = 10 + 1;
   6F86 DD 36 FC 0B   [19] 1825 	ld	-4 (ix),#0x0B
                           1826 ;src/main.c:468: TKnife* actual = cu;
   6F8A 01 00 66      [10] 1827 	ld	bc,#_cu+0
                           1828 ;src/main.c:470: while(--i){
   6F8D                    1829 00126$:
   6F8D DD 35 FC      [23] 1830 	dec	-4 (ix)
   6F90 DD 7E FC      [19] 1831 	ld	a, -4 (ix)
   6F93 B7            [ 4] 1832 	or	a, a
   6F94 CA B3 70      [10] 1833 	jp	Z,00129$
                           1834 ;src/main.c:471: if(actual->lanzado){
   6F97 21 06 00      [10] 1835 	ld	hl,#0x0006
   6F9A 09            [11] 1836 	add	hl,bc
   6F9B DD 75 FD      [19] 1837 	ld	-3 (ix),l
   6F9E DD 74 FE      [19] 1838 	ld	-2 (ix),h
   6FA1 DD 6E FD      [19] 1839 	ld	l,-3 (ix)
   6FA4 DD 66 FE      [19] 1840 	ld	h,-2 (ix)
   6FA7 7E            [ 7] 1841 	ld	a,(hl)
   6FA8 B7            [ 4] 1842 	or	a, a
   6FA9 CA AA 70      [10] 1843 	jp	Z,00125$
                           1844 ;src/main.c:472: if(actual->direccion == M_derecha){
   6FAC C5            [11] 1845 	push	bc
   6FAD FD E1         [14] 1846 	pop	iy
   6FAF FD 6E 07      [19] 1847 	ld	l,7 (iy)
                           1848 ;src/main.c:474: if( *getTilePtr(actual->x + G_KNIFEX_0_W + 1, actual->y) <= 2){
   6FB2 59            [ 4] 1849 	ld	e, c
   6FB3 50            [ 4] 1850 	ld	d, b
   6FB4 13            [ 6] 1851 	inc	de
                           1852 ;src/main.c:472: if(actual->direccion == M_derecha){
   6FB5 7D            [ 4] 1853 	ld	a,l
   6FB6 B7            [ 4] 1854 	or	a, a
   6FB7 20 34         [12] 1855 	jr	NZ,00122$
                           1856 ;src/main.c:474: if( *getTilePtr(actual->x + G_KNIFEX_0_W + 1, actual->y) <= 2){
   6FB9 1A            [ 7] 1857 	ld	a,(de)
   6FBA 57            [ 4] 1858 	ld	d,a
   6FBB 0A            [ 7] 1859 	ld	a,(bc)
   6FBC C6 05         [ 7] 1860 	add	a, #0x05
   6FBE C5            [11] 1861 	push	bc
   6FBF D5            [11] 1862 	push	de
   6FC0 33            [ 6] 1863 	inc	sp
   6FC1 F5            [11] 1864 	push	af
   6FC2 33            [ 6] 1865 	inc	sp
   6FC3 CD 16 67      [17] 1866 	call	_getTilePtr
   6FC6 F1            [10] 1867 	pop	af
   6FC7 C1            [10] 1868 	pop	bc
   6FC8 5E            [ 7] 1869 	ld	e,(hl)
   6FC9 3E 02         [ 7] 1870 	ld	a,#0x02
   6FCB 93            [ 4] 1871 	sub	a, e
   6FCC 38 0D         [12] 1872 	jr	C,00102$
                           1873 ;src/main.c:475: actual->x++;
   6FCE 0A            [ 7] 1874 	ld	a,(bc)
   6FCF 3C            [ 4] 1875 	inc	a
   6FD0 02            [ 7] 1876 	ld	(bc),a
                           1877 ;src/main.c:477: redibujarCuchillo(actual);
   6FD1 C5            [11] 1878 	push	bc
   6FD2 C5            [11] 1879 	push	bc
   6FD3 CD 44 6D      [17] 1880 	call	_redibujarCuchillo
   6FD6 F1            [10] 1881 	pop	af
   6FD7 C1            [10] 1882 	pop	bc
   6FD8 C3 AA 70      [10] 1883 	jp	00125$
   6FDB                    1884 00102$:
                           1885 ;src/main.c:480: borrarCuchillo(actual);
   6FDB C5            [11] 1886 	push	bc
   6FDC C5            [11] 1887 	push	bc
   6FDD CD DA 6C      [17] 1888 	call	_borrarCuchillo
   6FE0 F1            [10] 1889 	pop	af
   6FE1 C1            [10] 1890 	pop	bc
                           1891 ;src/main.c:481: actual->lanzado = NO;
   6FE2 DD 6E FD      [19] 1892 	ld	l,-3 (ix)
   6FE5 DD 66 FE      [19] 1893 	ld	h,-2 (ix)
   6FE8 36 00         [10] 1894 	ld	(hl),#0x00
   6FEA C3 AA 70      [10] 1895 	jp	00125$
   6FED                    1896 00122$:
                           1897 ;src/main.c:484: else if(actual->direccion == M_izquierda){
   6FED 7D            [ 4] 1898 	ld	a,l
   6FEE 3D            [ 4] 1899 	dec	a
   6FEF 20 35         [12] 1900 	jr	NZ,00119$
                           1901 ;src/main.c:485: if(*getTilePtr(actual->x - 1, actual->y) <= 2){
   6FF1 1A            [ 7] 1902 	ld	a,(de)
   6FF2 57            [ 4] 1903 	ld	d,a
   6FF3 0A            [ 7] 1904 	ld	a,(bc)
   6FF4 C6 FF         [ 7] 1905 	add	a,#0xFF
   6FF6 C5            [11] 1906 	push	bc
   6FF7 D5            [11] 1907 	push	de
   6FF8 33            [ 6] 1908 	inc	sp
   6FF9 F5            [11] 1909 	push	af
   6FFA 33            [ 6] 1910 	inc	sp
   6FFB CD 16 67      [17] 1911 	call	_getTilePtr
   6FFE F1            [10] 1912 	pop	af
   6FFF C1            [10] 1913 	pop	bc
   7000 5E            [ 7] 1914 	ld	e,(hl)
   7001 3E 02         [ 7] 1915 	ld	a,#0x02
   7003 93            [ 4] 1916 	sub	a, e
   7004 38 0E         [12] 1917 	jr	C,00105$
                           1918 ;src/main.c:486: actual->x--;
   7006 0A            [ 7] 1919 	ld	a,(bc)
   7007 C6 FF         [ 7] 1920 	add	a,#0xFF
   7009 02            [ 7] 1921 	ld	(bc),a
                           1922 ;src/main.c:488: redibujarCuchillo(actual);
   700A C5            [11] 1923 	push	bc
   700B C5            [11] 1924 	push	bc
   700C CD 44 6D      [17] 1925 	call	_redibujarCuchillo
   700F F1            [10] 1926 	pop	af
   7010 C1            [10] 1927 	pop	bc
   7011 C3 AA 70      [10] 1928 	jp	00125$
   7014                    1929 00105$:
                           1930 ;src/main.c:490: borrarCuchillo(actual);
   7014 C5            [11] 1931 	push	bc
   7015 C5            [11] 1932 	push	bc
   7016 CD DA 6C      [17] 1933 	call	_borrarCuchillo
   7019 F1            [10] 1934 	pop	af
   701A C1            [10] 1935 	pop	bc
                           1936 ;src/main.c:491: actual->lanzado = NO;
   701B DD 6E FD      [19] 1937 	ld	l,-3 (ix)
   701E DD 66 FE      [19] 1938 	ld	h,-2 (ix)
   7021 36 00         [10] 1939 	ld	(hl),#0x00
   7023 C3 AA 70      [10] 1940 	jp	00125$
   7026                    1941 00119$:
                           1942 ;src/main.c:494: else if(actual->direccion == M_abajo){
   7026 7D            [ 4] 1943 	ld	a,l
   7027 D6 03         [ 7] 1944 	sub	a, #0x03
   7029 20 3D         [12] 1945 	jr	NZ,00116$
                           1946 ;src/main.c:495: if(*getTilePtr(actual->x, actual->y + G_KNIFEY_0_H + 2) <= 2){
   702B 1A            [ 7] 1947 	ld	a,(de)
   702C C6 0A         [ 7] 1948 	add	a, #0x0A
   702E F5            [11] 1949 	push	af
   702F 0A            [ 7] 1950 	ld	a,(bc)
   7030 DD 77 FF      [19] 1951 	ld	-1 (ix),a
   7033 F1            [10] 1952 	pop	af
   7034 C5            [11] 1953 	push	bc
   7035 D5            [11] 1954 	push	de
   7036 F5            [11] 1955 	push	af
   7037 33            [ 6] 1956 	inc	sp
   7038 DD 7E FF      [19] 1957 	ld	a,-1 (ix)
   703B F5            [11] 1958 	push	af
   703C 33            [ 6] 1959 	inc	sp
   703D CD 16 67      [17] 1960 	call	_getTilePtr
   7040 F1            [10] 1961 	pop	af
   7041 D1            [10] 1962 	pop	de
   7042 C1            [10] 1963 	pop	bc
   7043 6E            [ 7] 1964 	ld	l,(hl)
   7044 3E 02         [ 7] 1965 	ld	a,#0x02
   7046 95            [ 4] 1966 	sub	a, l
   7047 38 0E         [12] 1967 	jr	C,00108$
                           1968 ;src/main.c:496: actual->y++;
   7049 1A            [ 7] 1969 	ld	a,(de)
   704A 3C            [ 4] 1970 	inc	a
   704B 12            [ 7] 1971 	ld	(de),a
                           1972 ;src/main.c:497: actual->y++;
   704C 3C            [ 4] 1973 	inc	a
   704D 12            [ 7] 1974 	ld	(de),a
                           1975 ;src/main.c:498: redibujarCuchillo(actual);
   704E C5            [11] 1976 	push	bc
   704F C5            [11] 1977 	push	bc
   7050 CD 44 6D      [17] 1978 	call	_redibujarCuchillo
   7053 F1            [10] 1979 	pop	af
   7054 C1            [10] 1980 	pop	bc
   7055 18 53         [12] 1981 	jr	00125$
   7057                    1982 00108$:
                           1983 ;src/main.c:502: borrarCuchillo(actual);
   7057 C5            [11] 1984 	push	bc
   7058 C5            [11] 1985 	push	bc
   7059 CD DA 6C      [17] 1986 	call	_borrarCuchillo
   705C F1            [10] 1987 	pop	af
   705D C1            [10] 1988 	pop	bc
                           1989 ;src/main.c:503: actual->lanzado = NO;
   705E DD 6E FD      [19] 1990 	ld	l,-3 (ix)
   7061 DD 66 FE      [19] 1991 	ld	h,-2 (ix)
   7064 36 00         [10] 1992 	ld	(hl),#0x00
   7066 18 42         [12] 1993 	jr	00125$
   7068                    1994 00116$:
                           1995 ;src/main.c:506: else if(actual->direccion == M_arriba){
   7068 7D            [ 4] 1996 	ld	a,l
   7069 D6 02         [ 7] 1997 	sub	a, #0x02
   706B 20 3D         [12] 1998 	jr	NZ,00125$
                           1999 ;src/main.c:507: if(*getTilePtr(actual->x, actual->y - 2) <= 2){
   706D 1A            [ 7] 2000 	ld	a,(de)
   706E C6 FE         [ 7] 2001 	add	a,#0xFE
   7070 F5            [11] 2002 	push	af
   7071 0A            [ 7] 2003 	ld	a,(bc)
   7072 DD 77 FF      [19] 2004 	ld	-1 (ix),a
   7075 F1            [10] 2005 	pop	af
   7076 C5            [11] 2006 	push	bc
   7077 D5            [11] 2007 	push	de
   7078 F5            [11] 2008 	push	af
   7079 33            [ 6] 2009 	inc	sp
   707A DD 7E FF      [19] 2010 	ld	a,-1 (ix)
   707D F5            [11] 2011 	push	af
   707E 33            [ 6] 2012 	inc	sp
   707F CD 16 67      [17] 2013 	call	_getTilePtr
   7082 F1            [10] 2014 	pop	af
   7083 D1            [10] 2015 	pop	de
   7084 C1            [10] 2016 	pop	bc
   7085 6E            [ 7] 2017 	ld	l,(hl)
   7086 3E 02         [ 7] 2018 	ld	a,#0x02
   7088 95            [ 4] 2019 	sub	a, l
   7089 38 10         [12] 2020 	jr	C,00111$
                           2021 ;src/main.c:508: actual->y--;
   708B 1A            [ 7] 2022 	ld	a,(de)
   708C C6 FF         [ 7] 2023 	add	a,#0xFF
   708E 12            [ 7] 2024 	ld	(de),a
                           2025 ;src/main.c:509: actual->y--;
   708F C6 FF         [ 7] 2026 	add	a,#0xFF
   7091 12            [ 7] 2027 	ld	(de),a
                           2028 ;src/main.c:510: redibujarCuchillo(actual);
   7092 C5            [11] 2029 	push	bc
   7093 C5            [11] 2030 	push	bc
   7094 CD 44 6D      [17] 2031 	call	_redibujarCuchillo
   7097 F1            [10] 2032 	pop	af
   7098 C1            [10] 2033 	pop	bc
   7099 18 0F         [12] 2034 	jr	00125$
   709B                    2035 00111$:
                           2036 ;src/main.c:513: borrarCuchillo(actual);
   709B C5            [11] 2037 	push	bc
   709C C5            [11] 2038 	push	bc
   709D CD DA 6C      [17] 2039 	call	_borrarCuchillo
   70A0 F1            [10] 2040 	pop	af
   70A1 C1            [10] 2041 	pop	bc
                           2042 ;src/main.c:514: actual->lanzado = NO;
   70A2 DD 6E FD      [19] 2043 	ld	l,-3 (ix)
   70A5 DD 66 FE      [19] 2044 	ld	h,-2 (ix)
   70A8 36 00         [10] 2045 	ld	(hl),#0x00
   70AA                    2046 00125$:
                           2047 ;src/main.c:518: ++actual;
   70AA 21 09 00      [10] 2048 	ld	hl,#0x0009
   70AD 09            [11] 2049 	add	hl,bc
   70AE 4D            [ 4] 2050 	ld	c,l
   70AF 44            [ 4] 2051 	ld	b,h
   70B0 C3 8D 6F      [10] 2052 	jp	00126$
   70B3                    2053 00129$:
   70B3 DD F9         [10] 2054 	ld	sp, ix
   70B5 DD E1         [14] 2055 	pop	ix
   70B7 C9            [10] 2056 	ret
                           2057 ;src/main.c:521: void barraPuntuacionInicial(){
                           2058 ;	---------------------------------
                           2059 ; Function barraPuntuacionInicial
                           2060 ; ---------------------------------
   70B8                    2061 _barraPuntuacionInicial::
                           2062 ;src/main.c:526: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 178); // 
   70B8 21 00 B2      [10] 2063 	ld	hl,#0xB200
   70BB E5            [11] 2064 	push	hl
   70BC 26 C0         [ 7] 2065 	ld	h, #0xC0
   70BE E5            [11] 2066 	push	hl
   70BF CD 93 65      [17] 2067 	call	_cpct_getScreenPtr
   70C2 4D            [ 4] 2068 	ld	c,l
   70C3 44            [ 4] 2069 	ld	b,h
                           2070 ;src/main.c:527: cpct_drawStringM0("SCORE", memptr, 1, 0);
   70C4 21 01 00      [10] 2071 	ld	hl,#0x0001
   70C7 E5            [11] 2072 	push	hl
   70C8 C5            [11] 2073 	push	bc
   70C9 21 60 71      [10] 2074 	ld	hl,#___str_0
   70CC E5            [11] 2075 	push	hl
   70CD CD C3 59      [17] 2076 	call	_cpct_drawStringM0
   70D0 21 06 00      [10] 2077 	ld	hl,#6
   70D3 39            [11] 2078 	add	hl,sp
   70D4 F9            [ 6] 2079 	ld	sp,hl
                           2080 ;src/main.c:528: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 190); // puntuación inicial
   70D5 21 00 BE      [10] 2081 	ld	hl,#0xBE00
   70D8 E5            [11] 2082 	push	hl
   70D9 26 C0         [ 7] 2083 	ld	h, #0xC0
   70DB E5            [11] 2084 	push	hl
   70DC CD 93 65      [17] 2085 	call	_cpct_getScreenPtr
   70DF 4D            [ 4] 2086 	ld	c,l
   70E0 44            [ 4] 2087 	ld	b,h
                           2088 ;src/main.c:529: cpct_drawStringM0("00000", memptr, 15, 0);
   70E1 21 0F 00      [10] 2089 	ld	hl,#0x000F
   70E4 E5            [11] 2090 	push	hl
   70E5 C5            [11] 2091 	push	bc
   70E6 21 66 71      [10] 2092 	ld	hl,#___str_1
   70E9 E5            [11] 2093 	push	hl
   70EA CD C3 59      [17] 2094 	call	_cpct_drawStringM0
   70ED 21 06 00      [10] 2095 	ld	hl,#6
   70F0 39            [11] 2096 	add	hl,sp
   70F1 F9            [ 6] 2097 	ld	sp,hl
                           2098 ;src/main.c:532: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 190);
   70F2 21 1A BE      [10] 2099 	ld	hl,#0xBE1A
   70F5 E5            [11] 2100 	push	hl
   70F6 21 00 C0      [10] 2101 	ld	hl,#0xC000
   70F9 E5            [11] 2102 	push	hl
   70FA CD 93 65      [17] 2103 	call	_cpct_getScreenPtr
   70FD 4D            [ 4] 2104 	ld	c,l
   70FE 44            [ 4] 2105 	ld	b,h
                           2106 ;src/main.c:533: cpct_drawStringM0("ROBOBIT", memptr, 3, 0);
   70FF 21 03 00      [10] 2107 	ld	hl,#0x0003
   7102 E5            [11] 2108 	push	hl
   7103 C5            [11] 2109 	push	bc
   7104 21 6C 71      [10] 2110 	ld	hl,#___str_2
   7107 E5            [11] 2111 	push	hl
   7108 CD C3 59      [17] 2112 	call	_cpct_drawStringM0
   710B 21 06 00      [10] 2113 	ld	hl,#6
   710E 39            [11] 2114 	add	hl,sp
   710F F9            [ 6] 2115 	ld	sp,hl
                           2116 ;src/main.c:535: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 178); // 
   7110 21 3C B2      [10] 2117 	ld	hl,#0xB23C
   7113 E5            [11] 2118 	push	hl
   7114 21 00 C0      [10] 2119 	ld	hl,#0xC000
   7117 E5            [11] 2120 	push	hl
   7118 CD 93 65      [17] 2121 	call	_cpct_getScreenPtr
   711B 4D            [ 4] 2122 	ld	c,l
   711C 44            [ 4] 2123 	ld	b,h
                           2124 ;src/main.c:536: cpct_drawStringM0("LIVES", memptr, 1, 0);
   711D 21 01 00      [10] 2125 	ld	hl,#0x0001
   7120 E5            [11] 2126 	push	hl
   7121 C5            [11] 2127 	push	bc
   7122 21 74 71      [10] 2128 	ld	hl,#___str_3
   7125 E5            [11] 2129 	push	hl
   7126 CD C3 59      [17] 2130 	call	_cpct_drawStringM0
   7129 21 06 00      [10] 2131 	ld	hl,#6
   712C 39            [11] 2132 	add	hl,sp
   712D F9            [ 6] 2133 	ld	sp,hl
                           2134 ;src/main.c:538: for(i=0; i<5; i++){
   712E 01 00 00      [10] 2135 	ld	bc,#0x0000
   7131                    2136 00102$:
                           2137 ;src/main.c:539: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 190); // dibuja 5 corazones
   7131 79            [ 4] 2138 	ld	a,c
   7132 87            [ 4] 2139 	add	a, a
   7133 87            [ 4] 2140 	add	a, a
   7134 C6 3C         [ 7] 2141 	add	a, #0x3C
   7136 57            [ 4] 2142 	ld	d,a
   7137 C5            [11] 2143 	push	bc
   7138 3E BE         [ 7] 2144 	ld	a,#0xBE
   713A F5            [11] 2145 	push	af
   713B 33            [ 6] 2146 	inc	sp
   713C D5            [11] 2147 	push	de
   713D 33            [ 6] 2148 	inc	sp
   713E 21 00 C0      [10] 2149 	ld	hl,#0xC000
   7141 E5            [11] 2150 	push	hl
   7142 CD 93 65      [17] 2151 	call	_cpct_getScreenPtr
   7145 EB            [ 4] 2152 	ex	de,hl
   7146 21 03 06      [10] 2153 	ld	hl,#0x0603
   7149 E5            [11] 2154 	push	hl
   714A D5            [11] 2155 	push	de
   714B 21 A8 55      [10] 2156 	ld	hl,#_g_heart
   714E E5            [11] 2157 	push	hl
   714F CD E7 59      [17] 2158 	call	_cpct_drawSprite
   7152 C1            [10] 2159 	pop	bc
                           2160 ;src/main.c:538: for(i=0; i<5; i++){
   7153 03            [ 6] 2161 	inc	bc
   7154 79            [ 4] 2162 	ld	a,c
   7155 D6 05         [ 7] 2163 	sub	a, #0x05
   7157 78            [ 4] 2164 	ld	a,b
   7158 17            [ 4] 2165 	rla
   7159 3F            [ 4] 2166 	ccf
   715A 1F            [ 4] 2167 	rra
   715B DE 80         [ 7] 2168 	sbc	a, #0x80
   715D 38 D2         [12] 2169 	jr	C,00102$
   715F C9            [10] 2170 	ret
   7160                    2171 ___str_0:
   7160 53 43 4F 52 45     2172 	.ascii "SCORE"
   7165 00                 2173 	.db 0x00
   7166                    2174 ___str_1:
   7166 30 30 30 30 30     2175 	.ascii "00000"
   716B 00                 2176 	.db 0x00
   716C                    2177 ___str_2:
   716C 52 4F 42 4F 42 49  2178 	.ascii "ROBOBIT"
        54
   7173 00                 2179 	.db 0x00
   7174                    2180 ___str_3:
   7174 4C 49 56 45 53     2181 	.ascii "LIVES"
   7179 00                 2182 	.db 0x00
                           2183 ;src/main.c:544: void borrarPantallaAbajo(){
                           2184 ;	---------------------------------
                           2185 ; Function borrarPantallaAbajo
                           2186 ; ---------------------------------
   717A                    2187 _borrarPantallaAbajo::
                           2188 ;src/main.c:546: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 180); // posición para borrar 
   717A 21 1A B4      [10] 2189 	ld	hl,#0xB41A
   717D E5            [11] 2190 	push	hl
   717E 21 00 C0      [10] 2191 	ld	hl,#0xC000
   7181 E5            [11] 2192 	push	hl
   7182 CD 93 65      [17] 2193 	call	_cpct_getScreenPtr
   7185 4D            [ 4] 2194 	ld	c,l
   7186 44            [ 4] 2195 	ld	b,h
                           2196 ;src/main.c:548: cpct_drawSolidBox(memptr, 0, 30, 7);  //borra el texto "PULSA I"
   7187 21 1E 07      [10] 2197 	ld	hl,#0x071E
   718A E5            [11] 2198 	push	hl
   718B AF            [ 4] 2199 	xor	a, a
   718C F5            [11] 2200 	push	af
   718D 33            [ 6] 2201 	inc	sp
   718E C5            [11] 2202 	push	bc
   718F CD B9 64      [17] 2203 	call	_cpct_drawSolidBox
   7192 F1            [10] 2204 	pop	af
   7193 F1            [10] 2205 	pop	af
   7194 33            [ 6] 2206 	inc	sp
   7195 C9            [10] 2207 	ret
                           2208 ;src/main.c:551: void menuFin(){
                           2209 ;	---------------------------------
                           2210 ; Function menuFin
                           2211 ; ---------------------------------
   7196                    2212 _menuFin::
                           2213 ;src/main.c:554: cpct_clearScreen(0);
   7196 21 00 40      [10] 2214 	ld	hl,#0x4000
   7199 E5            [11] 2215 	push	hl
   719A AF            [ 4] 2216 	xor	a, a
   719B F5            [11] 2217 	push	af
   719C 33            [ 6] 2218 	inc	sp
   719D 26 C0         [ 7] 2219 	ld	h, #0xC0
   719F E5            [11] 2220 	push	hl
   71A0 CD 72 5C      [17] 2221 	call	_cpct_memset
                           2222 ;src/main.c:556: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 12, 90); // centrado en horizontal y arriba en vertical
   71A3 21 0C 5A      [10] 2223 	ld	hl,#0x5A0C
   71A6 E5            [11] 2224 	push	hl
   71A7 21 00 C0      [10] 2225 	ld	hl,#0xC000
   71AA E5            [11] 2226 	push	hl
   71AB CD 93 65      [17] 2227 	call	_cpct_getScreenPtr
   71AE 4D            [ 4] 2228 	ld	c,l
   71AF 44            [ 4] 2229 	ld	b,h
                           2230 ;src/main.c:557: cpct_drawStringM0("FIN DE PARTIDA", memptr, 2, 0);
   71B0 21 02 00      [10] 2231 	ld	hl,#0x0002
   71B3 E5            [11] 2232 	push	hl
   71B4 C5            [11] 2233 	push	bc
   71B5 21 CF 71      [10] 2234 	ld	hl,#___str_4
   71B8 E5            [11] 2235 	push	hl
   71B9 CD C3 59      [17] 2236 	call	_cpct_drawStringM0
   71BC 21 06 00      [10] 2237 	ld	hl,#6
   71BF 39            [11] 2238 	add	hl,sp
   71C0 F9            [ 6] 2239 	ld	sp,hl
                           2240 ;src/main.c:561: do{
   71C1                    2241 00101$:
                           2242 ;src/main.c:562: cpct_scanKeyboard_f();   		
   71C1 CD 4D 59      [17] 2243 	call	_cpct_scanKeyboard_f
                           2244 ;src/main.c:563: } while(!cpct_isKeyPressed(Key_I));   		
   71C4 21 04 08      [10] 2245 	ld	hl,#0x0804
   71C7 CD 41 59      [17] 2246 	call	_cpct_isKeyPressed
   71CA 7D            [ 4] 2247 	ld	a,l
   71CB B7            [ 4] 2248 	or	a, a
   71CC 28 F3         [12] 2249 	jr	Z,00101$
   71CE C9            [10] 2250 	ret
   71CF                    2251 ___str_4:
   71CF 46 49 4E 20 44 45  2252 	.ascii "FIN DE PARTIDA"
        20 50 41 52 54 49
        44 41
   71DD 00                 2253 	.db 0x00
                           2254 ;src/main.c:566: void menuInicio(){
                           2255 ;	---------------------------------
                           2256 ; Function menuInicio
                           2257 ; ---------------------------------
   71DE                    2258 _menuInicio::
                           2259 ;src/main.c:570: cpct_clearScreen(0);
   71DE 21 00 40      [10] 2260 	ld	hl,#0x4000
   71E1 E5            [11] 2261 	push	hl
   71E2 AF            [ 4] 2262 	xor	a, a
   71E3 F5            [11] 2263 	push	af
   71E4 33            [ 6] 2264 	inc	sp
   71E5 26 C0         [ 7] 2265 	ld	h, #0xC0
   71E7 E5            [11] 2266 	push	hl
   71E8 CD 72 5C      [17] 2267 	call	_cpct_memset
                           2268 ;src/main.c:572: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 15); // centrado en horizontal y arriba en vertical
   71EB 21 20 0F      [10] 2269 	ld	hl,#0x0F20
   71EE E5            [11] 2270 	push	hl
   71EF 21 00 C0      [10] 2271 	ld	hl,#0xC000
   71F2 E5            [11] 2272 	push	hl
   71F3 CD 93 65      [17] 2273 	call	_cpct_getScreenPtr
   71F6 4D            [ 4] 2274 	ld	c,l
   71F7 44            [ 4] 2275 	ld	b,h
                           2276 ;src/main.c:573: cpct_drawStringM0("MENU", memptr, 2, 0);
   71F8 21 02 00      [10] 2277 	ld	hl,#0x0002
   71FB E5            [11] 2278 	push	hl
   71FC C5            [11] 2279 	push	bc
   71FD 21 35 72      [10] 2280 	ld	hl,#___str_5
   7200 E5            [11] 2281 	push	hl
   7201 CD C3 59      [17] 2282 	call	_cpct_drawStringM0
   7204 21 06 00      [10] 2283 	ld	hl,#6
   7207 39            [11] 2284 	add	hl,sp
   7208 F9            [ 6] 2285 	ld	sp,hl
                           2286 ;src/main.c:575: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 160); // centrado en horizontal y abajo en vertical
   7209 21 1A A0      [10] 2287 	ld	hl,#0xA01A
   720C E5            [11] 2288 	push	hl
   720D 21 00 C0      [10] 2289 	ld	hl,#0xC000
   7210 E5            [11] 2290 	push	hl
   7211 CD 93 65      [17] 2291 	call	_cpct_getScreenPtr
   7214 4D            [ 4] 2292 	ld	c,l
   7215 44            [ 4] 2293 	ld	b,h
                           2294 ;src/main.c:576: cpct_drawStringM0("PULSA I", memptr, 1, 0);
   7216 21 01 00      [10] 2295 	ld	hl,#0x0001
   7219 E5            [11] 2296 	push	hl
   721A C5            [11] 2297 	push	bc
   721B 21 3A 72      [10] 2298 	ld	hl,#___str_6
   721E E5            [11] 2299 	push	hl
   721F CD C3 59      [17] 2300 	call	_cpct_drawStringM0
   7222 21 06 00      [10] 2301 	ld	hl,#6
   7225 39            [11] 2302 	add	hl,sp
   7226 F9            [ 6] 2303 	ld	sp,hl
                           2304 ;src/main.c:579: do{
   7227                    2305 00101$:
                           2306 ;src/main.c:580: cpct_scanKeyboard_f();   		
   7227 CD 4D 59      [17] 2307 	call	_cpct_scanKeyboard_f
                           2308 ;src/main.c:581: } while(!cpct_isKeyPressed(Key_I));   		
   722A 21 04 08      [10] 2309 	ld	hl,#0x0804
   722D CD 41 59      [17] 2310 	call	_cpct_isKeyPressed
   7230 7D            [ 4] 2311 	ld	a,l
   7231 B7            [ 4] 2312 	or	a, a
   7232 28 F3         [12] 2313 	jr	Z,00101$
   7234 C9            [10] 2314 	ret
   7235                    2315 ___str_5:
   7235 4D 45 4E 55        2316 	.ascii "MENU"
   7239 00                 2317 	.db 0x00
   723A                    2318 ___str_6:
   723A 50 55 4C 53 41 20  2319 	.ascii "PULSA I"
        49
   7241 00                 2320 	.db 0x00
                           2321 ;src/main.c:584: void inicializarCPC() {
                           2322 ;	---------------------------------
                           2323 ; Function inicializarCPC
                           2324 ; ---------------------------------
   7242                    2325 _inicializarCPC::
                           2326 ;src/main.c:585: cpct_disableFirmware();
   7242 CD A9 64      [17] 2327 	call	_cpct_disableFirmware
                           2328 ;src/main.c:586: cpct_setVideoMode(0);
   7245 2E 00         [ 7] 2329 	ld	l,#0x00
   7247 CD 54 5C      [17] 2330 	call	_cpct_setVideoMode
                           2331 ;src/main.c:587: cpct_setBorder(HW_BLACK);
   724A 21 10 14      [10] 2332 	ld	hl,#0x1410
   724D E5            [11] 2333 	push	hl
   724E CD B7 59      [17] 2334 	call	_cpct_setPALColour
                           2335 ;src/main.c:588: cpct_setPalette(g_palette, 16);
   7251 21 10 00      [10] 2336 	ld	hl,#0x0010
   7254 E5            [11] 2337 	push	hl
   7255 21 E0 57      [10] 2338 	ld	hl,#_g_palette
   7258 E5            [11] 2339 	push	hl
   7259 CD 2A 59      [17] 2340 	call	_cpct_setPalette
                           2341 ;src/main.c:589: cpct_akp_musicInit(G_song);
   725C 21 00 3F      [10] 2342 	ld	hl,#_G_song
   725F E5            [11] 2343 	push	hl
   7260 CD 85 63      [17] 2344 	call	_cpct_akp_musicInit
   7263 F1            [10] 2345 	pop	af
   7264 C9            [10] 2346 	ret
                           2347 ;src/main.c:592: void inicializarJuego() {
                           2348 ;	---------------------------------
                           2349 ; Function inicializarJuego
                           2350 ; ---------------------------------
   7265                    2351 _inicializarJuego::
                           2352 ;src/main.c:595: TKnife* actual = cu;
                           2353 ;src/main.c:597: num_mapa = 0;
   7265 21 5C 66      [10] 2354 	ld	hl,#_num_mapa + 0
   7268 36 00         [10] 2355 	ld	(hl), #0x00
                           2356 ;src/main.c:598: mapa = mapas[num_mapa];
   726A 21 73 66      [10] 2357 	ld	hl, #_mapas + 0
   726D 7E            [ 7] 2358 	ld	a,(hl)
   726E FD 21 5A 66   [14] 2359 	ld	iy,#_mapa
   7272 FD 77 00      [19] 2360 	ld	0 (iy),a
   7275 23            [ 6] 2361 	inc	hl
   7276 7E            [ 7] 2362 	ld	a,(hl)
   7277 32 5B 66      [13] 2363 	ld	(#_mapa + 1),a
                           2364 ;src/main.c:599: cpct_etm_setTileset2x4(g_tileset);
   727A 21 E0 54      [10] 2365 	ld	hl,#_g_tileset
   727D CD 1B 5B      [17] 2366 	call	_cpct_etm_setTileset2x4
                           2367 ;src/main.c:600: dibujarMapa();
   7280 CD 5D 66      [17] 2368 	call	_dibujarMapa
                           2369 ;src/main.c:601: borrarPantallaAbajo();
   7283 CD 7A 71      [17] 2370 	call	_borrarPantallaAbajo
                           2371 ;src/main.c:602: barraPuntuacionInicial();
   7286 CD B8 70      [17] 2372 	call	_barraPuntuacionInicial
                           2373 ;src/main.c:605: prota.x = prota.px = 4;
   7289 21 FA 65      [10] 2374 	ld	hl,#(_prota + 0x0002)
   728C 36 04         [10] 2375 	ld	(hl),#0x04
   728E 21 F8 65      [10] 2376 	ld	hl,#_prota
   7291 36 04         [10] 2377 	ld	(hl),#0x04
                           2378 ;src/main.c:606: prota.y = prota.py = 80;
   7293 21 FB 65      [10] 2379 	ld	hl,#(_prota + 0x0003)
   7296 36 50         [10] 2380 	ld	(hl),#0x50
   7298 21 F9 65      [10] 2381 	ld	hl,#(_prota + 0x0001)
   729B 36 50         [10] 2382 	ld	(hl),#0x50
                           2383 ;src/main.c:607: prota.mover  = NO;
   729D 21 FE 65      [10] 2384 	ld	hl,#(_prota + 0x0006)
   72A0 36 00         [10] 2385 	ld	(hl),#0x00
                           2386 ;src/main.c:608: prota.mira=M_derecha;
   72A2 21 FF 65      [10] 2387 	ld	hl,#(_prota + 0x0007)
   72A5 36 00         [10] 2388 	ld	(hl),#0x00
                           2389 ;src/main.c:609: prota.sprite = g_hero;
   72A7 21 F0 57      [10] 2390 	ld	hl,#_g_hero
   72AA 22 FC 65      [16] 2391 	ld	((_prota + 0x0004)), hl
                           2392 ;src/main.c:611: enemy.x = enemy.px = 67;
   72AD 21 F2 65      [10] 2393 	ld	hl,#(_enemy + 0x0002)
   72B0 36 43         [10] 2394 	ld	(hl),#0x43
   72B2 21 F0 65      [10] 2395 	ld	hl,#_enemy
   72B5 36 43         [10] 2396 	ld	(hl),#0x43
                           2397 ;src/main.c:612: enemy.y = enemy.py = 84;
   72B7 21 F3 65      [10] 2398 	ld	hl,#(_enemy + 0x0003)
   72BA 36 54         [10] 2399 	ld	(hl),#0x54
   72BC 21 F1 65      [10] 2400 	ld	hl,#(_enemy + 0x0001)
   72BF 36 54         [10] 2401 	ld	(hl),#0x54
                           2402 ;src/main.c:613: enemy.mover  = NO;
   72C1 21 F6 65      [10] 2403 	ld	hl,#(_enemy + 0x0006)
   72C4 36 00         [10] 2404 	ld	(hl),#0x00
                           2405 ;src/main.c:614: enemy.mira=M_abajo;
   72C6 21 F7 65      [10] 2406 	ld	hl,#(_enemy + 0x0007)
   72C9 36 03         [10] 2407 	ld	(hl),#0x03
                           2408 ;src/main.c:615: enemy.sprite = g_enemy;
   72CB 21 BA 55      [10] 2409 	ld	hl,#_g_enemy
   72CE 22 F4 65      [16] 2410 	ld	((_enemy + 0x0004)), hl
                           2411 ;src/main.c:617: i = 10 + 1;
   72D1 0E 0B         [ 7] 2412 	ld	c,#0x0B
                           2413 ;src/main.c:619: while(--i){
   72D3 11 00 66      [10] 2414 	ld	de,#_cu
   72D6                    2415 00101$:
   72D6 41            [ 4] 2416 	ld	b,c
   72D7 05            [ 4] 2417 	dec	b
   72D8 78            [ 4] 2418 	ld	a,b
   72D9 4F            [ 4] 2419 	ld	c,a
   72DA B7            [ 4] 2420 	or	a, a
   72DB 28 25         [12] 2421 	jr	Z,00103$
                           2422 ;src/main.c:620: actual->x = actual->px = 0;
   72DD 6B            [ 4] 2423 	ld	l, e
   72DE 62            [ 4] 2424 	ld	h, d
   72DF 23            [ 6] 2425 	inc	hl
   72E0 23            [ 6] 2426 	inc	hl
   72E1 36 00         [10] 2427 	ld	(hl),#0x00
   72E3 AF            [ 4] 2428 	xor	a, a
   72E4 12            [ 7] 2429 	ld	(de),a
                           2430 ;src/main.c:621: actual->y = actual->py = 0;
   72E5 D5            [11] 2431 	push	de
   72E6 FD E1         [14] 2432 	pop	iy
   72E8 FD 23         [10] 2433 	inc	iy
   72EA 6B            [ 4] 2434 	ld	l, e
   72EB 62            [ 4] 2435 	ld	h, d
   72EC 23            [ 6] 2436 	inc	hl
   72ED 23            [ 6] 2437 	inc	hl
   72EE 23            [ 6] 2438 	inc	hl
   72EF 36 00         [10] 2439 	ld	(hl),#0x00
   72F1 FD 36 00 00   [19] 2440 	ld	0 (iy), #0x00
                           2441 ;src/main.c:622: actual->lanzado = 0;
   72F5 21 06 00      [10] 2442 	ld	hl,#0x0006
   72F8 19            [11] 2443 	add	hl,de
   72F9 36 00         [10] 2444 	ld	(hl),#0x00
                           2445 ;src/main.c:623: ++actual;
   72FB 21 09 00      [10] 2446 	ld	hl,#0x0009
   72FE 19            [11] 2447 	add	hl,de
   72FF EB            [ 4] 2448 	ex	de,hl
   7300 18 D4         [12] 2449 	jr	00101$
   7302                    2450 00103$:
                           2451 ;src/main.c:626: dibujarProta();
   7302 CD 79 66      [17] 2452 	call	_dibujarProta
                           2453 ;src/main.c:627: dibujarEnemigo();
   7305 C3 80 68      [10] 2454 	jp  _dibujarEnemigo
                           2455 ;src/main.c:630: void main(void) {
                           2456 ;	---------------------------------
                           2457 ; Function main
                           2458 ; ---------------------------------
   7308                    2459 _main::
                           2460 ;src/main.c:632: inicializarCPC();
   7308 CD 42 72      [17] 2461 	call	_inicializarCPC
                           2462 ;src/main.c:633: menuInicio();
   730B CD DE 71      [17] 2463 	call	_menuInicio
                           2464 ;src/main.c:635: inicializarJuego();
   730E CD 65 72      [17] 2465 	call	_inicializarJuego
                           2466 ;src/main.c:636: cpct_akp_musicPlay();
   7311 CD 82 5C      [17] 2467 	call	_cpct_akp_musicPlay
                           2468 ;src/main.c:638: while (1) {
   7314                    2469 00104$:
                           2470 ;src/main.c:641: comprobarTeclado();
   7314 CD 3B 6F      [17] 2471 	call	_comprobarTeclado
                           2472 ;src/main.c:643: cpct_waitVSYNC();
   7317 CD 4C 5C      [17] 2473 	call	_cpct_waitVSYNC
                           2474 ;src/main.c:644: moverCuchillo();
   731A CD 7C 6F      [17] 2475 	call	_moverCuchillo
                           2476 ;src/main.c:645: moverEnemigo();
   731D CD 07 6B      [17] 2477 	call	_moverEnemigo
                           2478 ;src/main.c:647: if (prota.mover) {
   7320 3A FE 65      [13] 2479 	ld	a, (#(_prota + 0x0006) + 0)
   7323 B7            [ 4] 2480 	or	a, a
   7324 28 EE         [12] 2481 	jr	Z,00104$
                           2482 ;src/main.c:649: redibujarProta();
   7326 CD 02 67      [17] 2483 	call	_redibujarProta
                           2484 ;src/main.c:650: prota.mover = NO;
   7329 21 FE 65      [10] 2485 	ld	hl,#(_prota + 0x0006)
   732C 36 00         [10] 2486 	ld	(hl),#0x00
   732E 18 E4         [12] 2487 	jr	00104$
                           2488 	.area _CODE
                           2489 	.area _INITIALIZER
                           2490 	.area _CABS (ABS)
   3F00                    2491 	.org 0x3F00
   3F00                    2492 _G_song:
   3F00 41                 2493 	.db #0x41	; 65	'A'
   3F01 54                 2494 	.db #0x54	; 84	'T'
   3F02 31                 2495 	.db #0x31	; 49	'1'
   3F03 30                 2496 	.db #0x30	; 48	'0'
   3F04 01                 2497 	.db #0x01	; 1
   3F05 40                 2498 	.db #0x40	; 64
   3F06 42                 2499 	.db #0x42	; 66	'B'
   3F07 0F                 2500 	.db #0x0F	; 15
   3F08 02                 2501 	.db #0x02	; 2
   3F09 06                 2502 	.db #0x06	; 6
   3F0A 1D                 2503 	.db #0x1D	; 29
   3F0B 00                 2504 	.db #0x00	; 0
   3F0C 10                 2505 	.db #0x10	; 16
   3F0D 40                 2506 	.db #0x40	; 64
   3F0E 19                 2507 	.db #0x19	; 25
   3F0F 40                 2508 	.db #0x40	; 64
   3F10 00                 2509 	.db #0x00	; 0
   3F11 00                 2510 	.db #0x00	; 0
   3F12 00                 2511 	.db #0x00	; 0
   3F13 00                 2512 	.db #0x00	; 0
   3F14 00                 2513 	.db #0x00	; 0
   3F15 00                 2514 	.db #0x00	; 0
   3F16 0D                 2515 	.db #0x0D	; 13
   3F17 12                 2516 	.db #0x12	; 18
   3F18 40                 2517 	.db #0x40	; 64
   3F19 01                 2518 	.db #0x01	; 1
   3F1A 00                 2519 	.db #0x00	; 0
   3F1B 7C                 2520 	.db #0x7C	; 124
   3F1C 18                 2521 	.db #0x18	; 24
   3F1D 78                 2522 	.db #0x78	; 120	'x'
   3F1E 0C                 2523 	.db #0x0C	; 12
   3F1F 34                 2524 	.db #0x34	; 52	'4'
   3F20 30                 2525 	.db #0x30	; 48	'0'
   3F21 2C                 2526 	.db #0x2C	; 44
   3F22 28                 2527 	.db #0x28	; 40
   3F23 24                 2528 	.db #0x24	; 36
   3F24 20                 2529 	.db #0x20	; 32
   3F25 1C                 2530 	.db #0x1C	; 28
   3F26 0D                 2531 	.db #0x0D	; 13
   3F27 25                 2532 	.db #0x25	; 37
   3F28 40                 2533 	.db #0x40	; 64
   3F29 20                 2534 	.db #0x20	; 32
   3F2A 00                 2535 	.db #0x00	; 0
   3F2B 00                 2536 	.db #0x00	; 0
   3F2C 00                 2537 	.db #0x00	; 0
   3F2D 39                 2538 	.db #0x39	; 57	'9'
   3F2E 40                 2539 	.db #0x40	; 64
   3F2F 00                 2540 	.db #0x00	; 0
   3F30 57                 2541 	.db #0x57	; 87	'W'
   3F31 40                 2542 	.db #0x40	; 64
   3F32 3B                 2543 	.db #0x3B	; 59
   3F33 40                 2544 	.db #0x40	; 64
   3F34 57                 2545 	.db #0x57	; 87	'W'
   3F35 40                 2546 	.db #0x40	; 64
   3F36 01                 2547 	.db #0x01	; 1
   3F37 2F                 2548 	.db #0x2F	; 47
   3F38 40                 2549 	.db #0x40	; 64
   3F39 19                 2550 	.db #0x19	; 25
   3F3A 00                 2551 	.db #0x00	; 0
   3F3B 76                 2552 	.db #0x76	; 118	'v'
   3F3C E1                 2553 	.db #0xE1	; 225
   3F3D 00                 2554 	.db #0x00	; 0
   3F3E 00                 2555 	.db #0x00	; 0
   3F3F 01                 2556 	.db #0x01	; 1
   3F40 04                 2557 	.db #0x04	; 4
   3F41 51                 2558 	.db #0x51	; 81	'Q'
   3F42 04                 2559 	.db #0x04	; 4
   3F43 37                 2560 	.db #0x37	; 55	'7'
   3F44 04                 2561 	.db #0x04	; 4
   3F45 4F                 2562 	.db #0x4F	; 79	'O'
   3F46 04                 2563 	.db #0x04	; 4
   3F47 37                 2564 	.db #0x37	; 55	'7'
   3F48 02                 2565 	.db #0x02	; 2
   3F49 4B                 2566 	.db #0x4B	; 75	'K'
   3F4A 02                 2567 	.db #0x02	; 2
   3F4B 37                 2568 	.db #0x37	; 55	'7'
   3F4C 04                 2569 	.db #0x04	; 4
   3F4D 4F                 2570 	.db #0x4F	; 79	'O'
   3F4E 04                 2571 	.db #0x04	; 4
   3F4F 37                 2572 	.db #0x37	; 55	'7'
   3F50 04                 2573 	.db #0x04	; 4
   3F51 4F                 2574 	.db #0x4F	; 79	'O'
   3F52 04                 2575 	.db #0x04	; 4
   3F53 37                 2576 	.db #0x37	; 55	'7'
   3F54 02                 2577 	.db #0x02	; 2
   3F55 4B                 2578 	.db #0x4B	; 75	'K'
   3F56 00                 2579 	.db #0x00	; 0
   3F57 42                 2580 	.db #0x42	; 66	'B'
   3F58 60                 2581 	.db #0x60	; 96
   3F59 00                 2582 	.db #0x00	; 0
   3F5A 42                 2583 	.db #0x42	; 66	'B'
   3F5B 80                 2584 	.db #0x80	; 128
   3F5C 00                 2585 	.db #0x00	; 0
   3F5D 00                 2586 	.db #0x00	; 0
   3F5E 42                 2587 	.db #0x42	; 66	'B'
   3F5F 00                 2588 	.db #0x00	; 0
   3F60 00                 2589 	.db #0x00	; 0
