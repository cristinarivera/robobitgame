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
                             13 	.globl _inicializar
                             14 	.globl _menu
                             15 	.globl _menuFin
                             16 	.globl _moverCuchillo
                             17 	.globl _comprobarTeclado
                             18 	.globl _lanzarCuchillo
                             19 	.globl _redibujarCuchillo
                             20 	.globl _borrarCuchillo
                             21 	.globl _dibujarCuchillo
                             22 	.globl _moverAbajo
                             23 	.globl _moverArriba
                             24 	.globl _moverDerecha
                             25 	.globl _moverIzquierda
                             26 	.globl _avanzarMapa
                             27 	.globl _moverEnemigo
                             28 	.globl _redibujarEnemigo
                             29 	.globl _borrarEnemigo
                             30 	.globl _dibujarEnemigo
                             31 	.globl _checkCollision
                             32 	.globl _getTilePtr
                             33 	.globl _redibujarProta
                             34 	.globl _borrarProta
                             35 	.globl _dibujarProta
                             36 	.globl _dibujarMapa
                             37 	.globl _cpct_etm_setTileset2x4
                             38 	.globl _cpct_etm_drawTileBox2x4
                             39 	.globl _cpct_akp_musicPlay
                             40 	.globl _cpct_akp_musicInit
                             41 	.globl _cpct_getScreenPtr
                             42 	.globl _cpct_setPalette
                             43 	.globl _cpct_waitVSYNC
                             44 	.globl _cpct_setVideoMode
                             45 	.globl _cpct_drawStringM0
                             46 	.globl _cpct_drawSpriteMaskedAlignedTable
                             47 	.globl _cpct_isAnyKeyPressed
                             48 	.globl _cpct_isKeyPressed
                             49 	.globl _cpct_scanKeyboard_if
                             50 	.globl _cpct_scanKeyboard_f
                             51 	.globl _cpct_memset
                             52 	.globl _cpct_disableFirmware
                             53 	.globl _num_mapa
                             54 	.globl _mapa
                             55 	.globl _cu
                             56 	.globl _prota
                             57 	.globl _enemy
                             58 	.globl _EEje
                             59 	.globl _EMirar
                             60 	.globl _mapas
                             61 ;--------------------------------------------------------
                             62 ; special function registers
                             63 ;--------------------------------------------------------
                             64 ;--------------------------------------------------------
                             65 ; ram data
                             66 ;--------------------------------------------------------
                             67 	.area _DATA
   6473                      68 _EMirar::
   6473                      69 	.ds 1
   6474                      70 _EEje::
   6474                      71 	.ds 1
   6475                      72 _enemy::
   6475                      73 	.ds 8
   647D                      74 _prota::
   647D                      75 	.ds 8
   6485                      76 _cu::
   6485                      77 	.ds 90
   64DF                      78 _mapa::
   64DF                      79 	.ds 2
   64E1                      80 _num_mapa::
   64E1                      81 	.ds 1
                             82 ;--------------------------------------------------------
                             83 ; ram data
                             84 ;--------------------------------------------------------
                             85 	.area _INITIALIZED
                             86 ;--------------------------------------------------------
                             87 ; absolute external ram data
                             88 ;--------------------------------------------------------
                             89 	.area _DABS (ABS)
                             90 ;--------------------------------------------------------
                             91 ; global & static initialisations
                             92 ;--------------------------------------------------------
                             93 	.area _HOME
                             94 	.area _GSINIT
                             95 	.area _GSFINAL
                             96 	.area _GSINIT
                             97 ;--------------------------------------------------------
                             98 ; Home
                             99 ;--------------------------------------------------------
                            100 	.area _HOME
                            101 	.area _HOME
                            102 ;--------------------------------------------------------
                            103 ; code
                            104 ;--------------------------------------------------------
                            105 	.area _CODE
                            106 ;src/main.c:110: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
                            107 ;	---------------------------------
                            108 ; Function dummy_cpct_transparentMaskTable0M0_container
                            109 ; ---------------------------------
   58C8                     110 _dummy_cpct_transparentMaskTable0M0_container::
                            111 	.area _g_tablatrans_ (ABS) 
   3E00                     112 	.org 0x3E00 
   3E00                     113 	 _g_tablatrans::
   3E00 FF AA 55 00 AA AA   114 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E08 55 00 55 00 00 00   115 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E10 AA AA 00 00 AA AA   116 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E18 00 00 00 00 00 00   117 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E20 55 00 55 00 00 00   118 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E28 55 00 55 00 00 00   119 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E30 00 00 00 00 00 00   120 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E38 00 00 00 00 00 00   121 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E40 AA AA 00 00 AA AA   122 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E48 00 00 00 00 00 00   123 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E50 AA AA 00 00 AA AA   124 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E58 00 00 00 00 00 00   125 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E60 00 00 00 00 00 00   126 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E68 00 00 00 00 00 00   127 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E70 00 00 00 00 00 00   128 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E78 00 00 00 00 00 00   129 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E80 55 00 55 00 00 00   130 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E88 55 00 55 00 00 00   131 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E90 00 00 00 00 00 00   132 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E98 00 00 00 00 00 00   133 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA0 55 00 55 00 00 00   134 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA8 55 00 55 00 00 00   135 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB0 00 00 00 00 00 00   136 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB8 00 00 00 00 00 00   137 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC0 00 00 00 00 00 00   138 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC8 00 00 00 00 00 00   139 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED0 00 00 00 00 00 00   140 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED8 00 00 00 00 00 00   141 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE0 00 00 00 00 00 00   142 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE8 00 00 00 00 00 00   143 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF0 00 00 00 00 00 00   144 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF8 00 00 00 00 00 00   145 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            146 	.area _CSEG (REL, CON) 
                            147 ;src/main.c:113: void dibujarMapa() {
                            148 ;	---------------------------------
                            149 ; Function dibujarMapa
                            150 ; ---------------------------------
   64E2                     151 _dibujarMapa::
                            152 ;src/main.c:114: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   64E2 2A DF 64      [16]  153 	ld	hl,(_mapa)
   64E5 E5            [11]  154 	push	hl
   64E6 21 00 C0      [10]  155 	ld	hl,#0xC000
   64E9 E5            [11]  156 	push	hl
   64EA 21 2C 28      [10]  157 	ld	hl,#0x282C
   64ED E5            [11]  158 	push	hl
   64EE 2E 00         [ 7]  159 	ld	l, #0x00
   64F0 E5            [11]  160 	push	hl
   64F1 AF            [ 4]  161 	xor	a, a
   64F2 F5            [11]  162 	push	af
   64F3 33            [ 6]  163 	inc	sp
   64F4 CD C9 59      [17]  164 	call	_cpct_etm_drawTileBox2x4
   64F7 C9            [10]  165 	ret
   64F8                     166 _mapas:
   64F8 C0 4D               167 	.dw _g_map1
   64FA E0 46               168 	.dw _g_map2
   64FC 00 40               169 	.dw _g_map3
                            170 ;src/main.c:119: void dibujarProta() {
                            171 ;	---------------------------------
                            172 ; Function dibujarProta
                            173 ; ---------------------------------
   64FE                     174 _dibujarProta::
                            175 ;src/main.c:120: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   64FE 21 7E 64      [10]  176 	ld	hl, #_prota + 1
   6501 56            [ 7]  177 	ld	d,(hl)
   6502 21 7D 64      [10]  178 	ld	hl, #_prota + 0
   6505 46            [ 7]  179 	ld	b,(hl)
   6506 D5            [11]  180 	push	de
   6507 33            [ 6]  181 	inc	sp
   6508 C5            [11]  182 	push	bc
   6509 33            [ 6]  183 	inc	sp
   650A 21 00 C0      [10]  184 	ld	hl,#0xC000
   650D E5            [11]  185 	push	hl
   650E CD 18 64      [17]  186 	call	_cpct_getScreenPtr
   6511 EB            [ 4]  187 	ex	de,hl
                            188 ;src/main.c:121: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   6512 ED 4B 81 64   [20]  189 	ld	bc, (#_prota + 4)
   6516 21 00 3E      [10]  190 	ld	hl,#_g_tablatrans
   6519 E5            [11]  191 	push	hl
   651A 21 07 16      [10]  192 	ld	hl,#0x1607
   651D E5            [11]  193 	push	hl
   651E D5            [11]  194 	push	de
   651F C5            [11]  195 	push	bc
   6520 CD 38 64      [17]  196 	call	_cpct_drawSpriteMaskedAlignedTable
   6523 C9            [10]  197 	ret
                            198 ;src/main.c:124: void borrarProta() {
                            199 ;	---------------------------------
                            200 ; Function borrarProta
                            201 ; ---------------------------------
   6524                     202 _borrarProta::
   6524 DD E5         [15]  203 	push	ix
   6526 DD 21 00 00   [14]  204 	ld	ix,#0
   652A DD 39         [15]  205 	add	ix,sp
   652C 3B            [ 6]  206 	dec	sp
                            207 ;src/main.c:126: u8 w = 4 + (prota.px & 1);
   652D 21 7F 64      [10]  208 	ld	hl, #_prota + 2
   6530 4E            [ 7]  209 	ld	c,(hl)
   6531 79            [ 4]  210 	ld	a,c
   6532 E6 01         [ 7]  211 	and	a, #0x01
   6534 47            [ 4]  212 	ld	b,a
   6535 04            [ 4]  213 	inc	b
   6536 04            [ 4]  214 	inc	b
   6537 04            [ 4]  215 	inc	b
   6538 04            [ 4]  216 	inc	b
                            217 ;src/main.c:129: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   6539 21 80 64      [10]  218 	ld	hl, #_prota + 3
   653C 5E            [ 7]  219 	ld	e,(hl)
   653D CB 4B         [ 8]  220 	bit	1, e
   653F 28 04         [12]  221 	jr	Z,00103$
   6541 3E 01         [ 7]  222 	ld	a,#0x01
   6543 18 02         [12]  223 	jr	00104$
   6545                     224 00103$:
   6545 3E 00         [ 7]  225 	ld	a,#0x00
   6547                     226 00104$:
   6547 C6 06         [ 7]  227 	add	a, #0x06
   6549 DD 77 FF      [19]  228 	ld	-1 (ix),a
                            229 ;src/main.c:131: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   654C FD 2A DF 64   [20]  230 	ld	iy,(_mapa)
   6550 16 00         [ 7]  231 	ld	d,#0x00
   6552 63            [ 4]  232 	ld	h,e
   6553 6A            [ 4]  233 	ld	l,d
   6554 CB 7A         [ 8]  234 	bit	7, d
   6556 28 05         [12]  235 	jr	Z,00105$
   6558 13            [ 6]  236 	inc	de
   6559 13            [ 6]  237 	inc	de
   655A 13            [ 6]  238 	inc	de
   655B 63            [ 4]  239 	ld	h,e
   655C 6A            [ 4]  240 	ld	l,d
   655D                     241 00105$:
   655D 5C            [ 4]  242 	ld	e, h
   655E 55            [ 4]  243 	ld	d, l
   655F CB 2A         [ 8]  244 	sra	d
   6561 CB 1B         [ 8]  245 	rr	e
   6563 CB 2A         [ 8]  246 	sra	d
   6565 CB 1B         [ 8]  247 	rr	e
   6567 51            [ 4]  248 	ld	d,c
   6568 CB 3A         [ 8]  249 	srl	d
   656A FD E5         [15]  250 	push	iy
   656C 21 00 C0      [10]  251 	ld	hl,#0xC000
   656F E5            [11]  252 	push	hl
   6570 3E 28         [ 7]  253 	ld	a,#0x28
   6572 F5            [11]  254 	push	af
   6573 33            [ 6]  255 	inc	sp
   6574 DD 7E FF      [19]  256 	ld	a,-1 (ix)
   6577 F5            [11]  257 	push	af
   6578 33            [ 6]  258 	inc	sp
   6579 C5            [11]  259 	push	bc
   657A 33            [ 6]  260 	inc	sp
   657B 7B            [ 4]  261 	ld	a,e
   657C F5            [11]  262 	push	af
   657D 33            [ 6]  263 	inc	sp
   657E D5            [11]  264 	push	de
   657F 33            [ 6]  265 	inc	sp
   6580 CD C9 59      [17]  266 	call	_cpct_etm_drawTileBox2x4
   6583 33            [ 6]  267 	inc	sp
   6584 DD E1         [14]  268 	pop	ix
   6586 C9            [10]  269 	ret
                            270 ;src/main.c:136: void redibujarProta() {
                            271 ;	---------------------------------
                            272 ; Function redibujarProta
                            273 ; ---------------------------------
   6587                     274 _redibujarProta::
                            275 ;src/main.c:137: borrarProta();
   6587 CD 24 65      [17]  276 	call	_borrarProta
                            277 ;src/main.c:138: prota.px = prota.x;
   658A 01 7F 64      [10]  278 	ld	bc,#_prota + 2
   658D 3A 7D 64      [13]  279 	ld	a, (#_prota + 0)
   6590 02            [ 7]  280 	ld	(bc),a
                            281 ;src/main.c:139: prota.py = prota.y;
   6591 01 80 64      [10]  282 	ld	bc,#_prota + 3
   6594 3A 7E 64      [13]  283 	ld	a, (#_prota + 1)
   6597 02            [ 7]  284 	ld	(bc),a
                            285 ;src/main.c:140: dibujarProta();
   6598 C3 FE 64      [10]  286 	jp  _dibujarProta
                            287 ;src/main.c:143: u8* getTilePtr(u8 x, u8 y) {
                            288 ;	---------------------------------
                            289 ; Function getTilePtr
                            290 ; ---------------------------------
   659B                     291 _getTilePtr::
                            292 ;src/main.c:144: return mapa + (y/4)*g_map1_W + x/2;
   659B 21 03 00      [10]  293 	ld	hl, #3+0
   659E 39            [11]  294 	add	hl, sp
   659F 4E            [ 7]  295 	ld	c, (hl)
   65A0 CB 39         [ 8]  296 	srl	c
   65A2 CB 39         [ 8]  297 	srl	c
   65A4 06 00         [ 7]  298 	ld	b,#0x00
   65A6 69            [ 4]  299 	ld	l, c
   65A7 60            [ 4]  300 	ld	h, b
   65A8 29            [11]  301 	add	hl, hl
   65A9 29            [11]  302 	add	hl, hl
   65AA 09            [11]  303 	add	hl, bc
   65AB 29            [11]  304 	add	hl, hl
   65AC 29            [11]  305 	add	hl, hl
   65AD 29            [11]  306 	add	hl, hl
   65AE ED 5B DF 64   [20]  307 	ld	de,(_mapa)
   65B2 19            [11]  308 	add	hl,de
   65B3 FD 21 02 00   [14]  309 	ld	iy,#2
   65B7 FD 39         [15]  310 	add	iy,sp
   65B9 FD 4E 00      [19]  311 	ld	c,0 (iy)
   65BC CB 39         [ 8]  312 	srl	c
   65BE 59            [ 4]  313 	ld	e,c
   65BF 16 00         [ 7]  314 	ld	d,#0x00
   65C1 19            [11]  315 	add	hl,de
   65C2 C9            [10]  316 	ret
                            317 ;src/main.c:147: u8 checkCollision(int direction) { // check optimization
                            318 ;	---------------------------------
                            319 ; Function checkCollision
                            320 ; ---------------------------------
   65C3                     321 _checkCollision::
   65C3 DD E5         [15]  322 	push	ix
   65C5 DD 21 00 00   [14]  323 	ld	ix,#0
   65C9 DD 39         [15]  324 	add	ix,sp
   65CB 21 F8 FF      [10]  325 	ld	hl,#-8
   65CE 39            [11]  326 	add	hl,sp
   65CF F9            [ 6]  327 	ld	sp,hl
                            328 ;src/main.c:150: switch (direction) {
   65D0 DD CB 05 7E   [20]  329 	bit	7, 5 (ix)
   65D4 C2 E0 66      [10]  330 	jp	NZ,00105$
   65D7 3E 03         [ 7]  331 	ld	a,#0x03
   65D9 DD BE 04      [19]  332 	cp	a, 4 (ix)
   65DC 3E 00         [ 7]  333 	ld	a,#0x00
   65DE DD 9E 05      [19]  334 	sbc	a, 5 (ix)
   65E1 E2 E6 65      [10]  335 	jp	PO, 00128$
   65E4 EE 80         [ 7]  336 	xor	a, #0x80
   65E6                     337 00128$:
   65E6 FA E0 66      [10]  338 	jp	M,00105$
   65E9 DD 5E 04      [19]  339 	ld	e,4 (ix)
   65EC 16 00         [ 7]  340 	ld	d,#0x00
   65EE 21 F5 65      [10]  341 	ld	hl,#00129$
   65F1 19            [11]  342 	add	hl,de
   65F2 19            [11]  343 	add	hl,de
   65F3 19            [11]  344 	add	hl,de
   65F4 E9            [ 4]  345 	jp	(hl)
   65F5                     346 00129$:
   65F5 C3 01 66      [10]  347 	jp	00101$
   65F8 C3 46 66      [10]  348 	jp	00102$
   65FB C3 86 66      [10]  349 	jp	00103$
   65FE C3 B4 66      [10]  350 	jp	00104$
                            351 ;src/main.c:151: case 0:
   6601                     352 00101$:
                            353 ;src/main.c:152: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   6601 21 7E 64      [10]  354 	ld	hl, #(_prota + 0x0001) + 0
   6604 46            [ 7]  355 	ld	b,(hl)
   6605 3A 7D 64      [13]  356 	ld	a, (#_prota + 0)
   6608 C6 04         [ 7]  357 	add	a, #0x04
   660A C5            [11]  358 	push	bc
   660B 33            [ 6]  359 	inc	sp
   660C F5            [11]  360 	push	af
   660D 33            [ 6]  361 	inc	sp
   660E CD 9B 65      [17]  362 	call	_getTilePtr
   6611 F1            [10]  363 	pop	af
   6612 DD 75 FE      [19]  364 	ld	-2 (ix),l
   6615 DD 74 FF      [19]  365 	ld	-1 (ix),h
                            366 ;src/main.c:153: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   6618 3A 7E 64      [13]  367 	ld	a, (#(_prota + 0x0001) + 0)
   661B C6 14         [ 7]  368 	add	a, #0x14
   661D 47            [ 4]  369 	ld	b,a
   661E 3A 7D 64      [13]  370 	ld	a, (#_prota + 0)
   6621 C6 04         [ 7]  371 	add	a, #0x04
   6623 C5            [11]  372 	push	bc
   6624 33            [ 6]  373 	inc	sp
   6625 F5            [11]  374 	push	af
   6626 33            [ 6]  375 	inc	sp
   6627 CD 9B 65      [17]  376 	call	_getTilePtr
   662A F1            [10]  377 	pop	af
   662B 4D            [ 4]  378 	ld	c,l
   662C 44            [ 4]  379 	ld	b,h
                            380 ;src/main.c:154: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   662D 3A 7E 64      [13]  381 	ld	a, (#(_prota + 0x0001) + 0)
   6630 C6 0B         [ 7]  382 	add	a, #0x0B
   6632 57            [ 4]  383 	ld	d,a
   6633 3A 7D 64      [13]  384 	ld	a, (#_prota + 0)
   6636 C6 04         [ 7]  385 	add	a, #0x04
   6638 C5            [11]  386 	push	bc
   6639 D5            [11]  387 	push	de
   663A 33            [ 6]  388 	inc	sp
   663B F5            [11]  389 	push	af
   663C 33            [ 6]  390 	inc	sp
   663D CD 9B 65      [17]  391 	call	_getTilePtr
   6640 F1            [10]  392 	pop	af
   6641 EB            [ 4]  393 	ex	de,hl
   6642 C1            [10]  394 	pop	bc
                            395 ;src/main.c:155: break;
   6643 C3 E0 66      [10]  396 	jp	00105$
                            397 ;src/main.c:156: case 1:
   6646                     398 00102$:
                            399 ;src/main.c:157: headTile  = getTilePtr(prota.x - 1, prota.y);
   6646 21 7E 64      [10]  400 	ld	hl, #(_prota + 0x0001) + 0
   6649 46            [ 7]  401 	ld	b,(hl)
   664A 21 7D 64      [10]  402 	ld	hl, #_prota + 0
   664D 56            [ 7]  403 	ld	d,(hl)
   664E 15            [ 4]  404 	dec	d
   664F 4A            [ 4]  405 	ld	c, d
   6650 C5            [11]  406 	push	bc
   6651 CD 9B 65      [17]  407 	call	_getTilePtr
   6654 F1            [10]  408 	pop	af
   6655 DD 75 FE      [19]  409 	ld	-2 (ix),l
   6658 DD 74 FF      [19]  410 	ld	-1 (ix),h
                            411 ;src/main.c:158: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
   665B 3A 7E 64      [13]  412 	ld	a, (#(_prota + 0x0001) + 0)
   665E C6 14         [ 7]  413 	add	a, #0x14
   6660 47            [ 4]  414 	ld	b,a
   6661 21 7D 64      [10]  415 	ld	hl, #_prota + 0
   6664 56            [ 7]  416 	ld	d,(hl)
   6665 15            [ 4]  417 	dec	d
   6666 4A            [ 4]  418 	ld	c, d
   6667 C5            [11]  419 	push	bc
   6668 CD 9B 65      [17]  420 	call	_getTilePtr
   666B F1            [10]  421 	pop	af
   666C 4D            [ 4]  422 	ld	c,l
   666D 44            [ 4]  423 	ld	b,h
                            424 ;src/main.c:159: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
   666E 3A 7E 64      [13]  425 	ld	a, (#(_prota + 0x0001) + 0)
   6671 C6 0B         [ 7]  426 	add	a, #0x0B
   6673 57            [ 4]  427 	ld	d,a
   6674 3A 7D 64      [13]  428 	ld	a, (#_prota + 0)
   6677 C6 FF         [ 7]  429 	add	a,#0xFF
   6679 C5            [11]  430 	push	bc
   667A D5            [11]  431 	push	de
   667B 33            [ 6]  432 	inc	sp
   667C F5            [11]  433 	push	af
   667D 33            [ 6]  434 	inc	sp
   667E CD 9B 65      [17]  435 	call	_getTilePtr
   6681 F1            [10]  436 	pop	af
   6682 EB            [ 4]  437 	ex	de,hl
   6683 C1            [10]  438 	pop	bc
                            439 ;src/main.c:160: break;
   6684 18 5A         [12]  440 	jr	00105$
                            441 ;src/main.c:161: case 2:
   6686                     442 00103$:
                            443 ;src/main.c:162: headTile   = getTilePtr(prota.x, prota.y - 2);
   6686 21 7E 64      [10]  444 	ld	hl, #(_prota + 0x0001) + 0
   6689 46            [ 7]  445 	ld	b,(hl)
   668A 05            [ 4]  446 	dec	b
   668B 05            [ 4]  447 	dec	b
   668C 21 7D 64      [10]  448 	ld	hl, #_prota + 0
   668F 4E            [ 7]  449 	ld	c, (hl)
   6690 C5            [11]  450 	push	bc
   6691 CD 9B 65      [17]  451 	call	_getTilePtr
   6694 F1            [10]  452 	pop	af
   6695 DD 75 FE      [19]  453 	ld	-2 (ix),l
   6698 DD 74 FF      [19]  454 	ld	-1 (ix),h
                            455 ;src/main.c:163: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
   669B 3A 7E 64      [13]  456 	ld	a, (#(_prota + 0x0001) + 0)
   669E 47            [ 4]  457 	ld	b,a
   669F 05            [ 4]  458 	dec	b
   66A0 05            [ 4]  459 	dec	b
   66A1 3A 7D 64      [13]  460 	ld	a, (#_prota + 0)
   66A4 C6 03         [ 7]  461 	add	a, #0x03
   66A6 C5            [11]  462 	push	bc
   66A7 33            [ 6]  463 	inc	sp
   66A8 F5            [11]  464 	push	af
   66A9 33            [ 6]  465 	inc	sp
   66AA CD 9B 65      [17]  466 	call	_getTilePtr
   66AD F1            [10]  467 	pop	af
   66AE 4D            [ 4]  468 	ld	c,l
   66AF 44            [ 4]  469 	ld	b,h
                            470 ;src/main.c:164: *waistTile = 0;
   66B0 AF            [ 4]  471 	xor	a, a
   66B1 12            [ 7]  472 	ld	(de),a
                            473 ;src/main.c:165: break;
   66B2 18 2C         [12]  474 	jr	00105$
                            475 ;src/main.c:166: case 3:
   66B4                     476 00104$:
                            477 ;src/main.c:167: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
   66B4 3A 7E 64      [13]  478 	ld	a, (#(_prota + 0x0001) + 0)
   66B7 C6 16         [ 7]  479 	add	a, #0x16
   66B9 47            [ 4]  480 	ld	b,a
   66BA 21 7D 64      [10]  481 	ld	hl, #_prota + 0
   66BD 4E            [ 7]  482 	ld	c, (hl)
   66BE C5            [11]  483 	push	bc
   66BF CD 9B 65      [17]  484 	call	_getTilePtr
   66C2 F1            [10]  485 	pop	af
   66C3 DD 75 FE      [19]  486 	ld	-2 (ix),l
   66C6 DD 74 FF      [19]  487 	ld	-1 (ix),h
                            488 ;src/main.c:168: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   66C9 3A 7E 64      [13]  489 	ld	a, (#(_prota + 0x0001) + 0)
   66CC C6 16         [ 7]  490 	add	a, #0x16
   66CE 47            [ 4]  491 	ld	b,a
   66CF 3A 7D 64      [13]  492 	ld	a, (#_prota + 0)
   66D2 C6 03         [ 7]  493 	add	a, #0x03
   66D4 C5            [11]  494 	push	bc
   66D5 33            [ 6]  495 	inc	sp
   66D6 F5            [11]  496 	push	af
   66D7 33            [ 6]  497 	inc	sp
   66D8 CD 9B 65      [17]  498 	call	_getTilePtr
   66DB F1            [10]  499 	pop	af
   66DC 4D            [ 4]  500 	ld	c,l
   66DD 44            [ 4]  501 	ld	b,h
                            502 ;src/main.c:169: *waistTile = 0;
   66DE AF            [ 4]  503 	xor	a, a
   66DF 12            [ 7]  504 	ld	(de),a
                            505 ;src/main.c:171: }
   66E0                     506 00105$:
                            507 ;src/main.c:173: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   66E0 DD 6E FE      [19]  508 	ld	l,-2 (ix)
   66E3 DD 66 FF      [19]  509 	ld	h,-1 (ix)
   66E6 6E            [ 7]  510 	ld	l,(hl)
   66E7 3E 02         [ 7]  511 	ld	a,#0x02
   66E9 95            [ 4]  512 	sub	a, l
   66EA 38 0E         [12]  513 	jr	C,00106$
   66EC 0A            [ 7]  514 	ld	a,(bc)
   66ED 4F            [ 4]  515 	ld	c,a
   66EE 3E 02         [ 7]  516 	ld	a,#0x02
   66F0 91            [ 4]  517 	sub	a, c
   66F1 38 07         [12]  518 	jr	C,00106$
   66F3 1A            [ 7]  519 	ld	a,(de)
   66F4 4F            [ 4]  520 	ld	c,a
   66F5 3E 02         [ 7]  521 	ld	a,#0x02
   66F7 91            [ 4]  522 	sub	a, c
   66F8 30 04         [12]  523 	jr	NC,00107$
   66FA                     524 00106$:
                            525 ;src/main.c:174: return 1;
   66FA 2E 01         [ 7]  526 	ld	l,#0x01
   66FC 18 02         [12]  527 	jr	00110$
   66FE                     528 00107$:
                            529 ;src/main.c:176: return 0;
   66FE 2E 00         [ 7]  530 	ld	l,#0x00
   6700                     531 00110$:
   6700 DD F9         [10]  532 	ld	sp, ix
   6702 DD E1         [14]  533 	pop	ix
   6704 C9            [10]  534 	ret
                            535 ;src/main.c:180: void dibujarEnemigo() {
                            536 ;	---------------------------------
                            537 ; Function dibujarEnemigo
                            538 ; ---------------------------------
   6705                     539 _dibujarEnemigo::
                            540 ;src/main.c:181: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy.x, enemy.y);
   6705 21 76 64      [10]  541 	ld	hl, #_enemy + 1
   6708 56            [ 7]  542 	ld	d,(hl)
   6709 21 75 64      [10]  543 	ld	hl, #_enemy + 0
   670C 46            [ 7]  544 	ld	b,(hl)
   670D D5            [11]  545 	push	de
   670E 33            [ 6]  546 	inc	sp
   670F C5            [11]  547 	push	bc
   6710 33            [ 6]  548 	inc	sp
   6711 21 00 C0      [10]  549 	ld	hl,#0xC000
   6714 E5            [11]  550 	push	hl
   6715 CD 18 64      [17]  551 	call	_cpct_getScreenPtr
   6718 EB            [ 4]  552 	ex	de,hl
                            553 ;src/main.c:182: cpct_drawSpriteMaskedAlignedTable (enemy.sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   6719 ED 4B 79 64   [20]  554 	ld	bc, (#_enemy + 4)
   671D 21 00 3E      [10]  555 	ld	hl,#_g_tablatrans
   6720 E5            [11]  556 	push	hl
   6721 21 04 16      [10]  557 	ld	hl,#0x1604
   6724 E5            [11]  558 	push	hl
   6725 D5            [11]  559 	push	de
   6726 C5            [11]  560 	push	bc
   6727 CD 38 64      [17]  561 	call	_cpct_drawSpriteMaskedAlignedTable
   672A C9            [10]  562 	ret
                            563 ;src/main.c:185: void borrarEnemigo() {
                            564 ;	---------------------------------
                            565 ; Function borrarEnemigo
                            566 ; ---------------------------------
   672B                     567 _borrarEnemigo::
   672B DD E5         [15]  568 	push	ix
   672D DD 21 00 00   [14]  569 	ld	ix,#0
   6731 DD 39         [15]  570 	add	ix,sp
   6733 3B            [ 6]  571 	dec	sp
                            572 ;src/main.c:187: u8 w = 4 + (enemy.px & 1);
   6734 21 77 64      [10]  573 	ld	hl, #_enemy + 2
   6737 4E            [ 7]  574 	ld	c,(hl)
   6738 79            [ 4]  575 	ld	a,c
   6739 E6 01         [ 7]  576 	and	a, #0x01
   673B 47            [ 4]  577 	ld	b,a
   673C 04            [ 4]  578 	inc	b
   673D 04            [ 4]  579 	inc	b
   673E 04            [ 4]  580 	inc	b
   673F 04            [ 4]  581 	inc	b
                            582 ;src/main.c:190: u8 h = 7 + (enemy.py & 2 ? 1 : 0);
   6740 21 78 64      [10]  583 	ld	hl, #_enemy + 3
   6743 5E            [ 7]  584 	ld	e,(hl)
   6744 CB 4B         [ 8]  585 	bit	1, e
   6746 28 04         [12]  586 	jr	Z,00103$
   6748 3E 01         [ 7]  587 	ld	a,#0x01
   674A 18 02         [12]  588 	jr	00104$
   674C                     589 00103$:
   674C 3E 00         [ 7]  590 	ld	a,#0x00
   674E                     591 00104$:
   674E C6 07         [ 7]  592 	add	a, #0x07
   6750 DD 77 FF      [19]  593 	ld	-1 (ix),a
                            594 ;src/main.c:192: cpct_etm_drawTileBox2x4 (enemy.px / 2, (enemy.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   6753 FD 2A DF 64   [20]  595 	ld	iy,(_mapa)
   6757 16 00         [ 7]  596 	ld	d,#0x00
   6759 63            [ 4]  597 	ld	h,e
   675A 6A            [ 4]  598 	ld	l,d
   675B CB 7A         [ 8]  599 	bit	7, d
   675D 28 05         [12]  600 	jr	Z,00105$
   675F 13            [ 6]  601 	inc	de
   6760 13            [ 6]  602 	inc	de
   6761 13            [ 6]  603 	inc	de
   6762 63            [ 4]  604 	ld	h,e
   6763 6A            [ 4]  605 	ld	l,d
   6764                     606 00105$:
   6764 5C            [ 4]  607 	ld	e, h
   6765 55            [ 4]  608 	ld	d, l
   6766 CB 2A         [ 8]  609 	sra	d
   6768 CB 1B         [ 8]  610 	rr	e
   676A CB 2A         [ 8]  611 	sra	d
   676C CB 1B         [ 8]  612 	rr	e
   676E 51            [ 4]  613 	ld	d,c
   676F CB 3A         [ 8]  614 	srl	d
   6771 FD E5         [15]  615 	push	iy
   6773 21 00 C0      [10]  616 	ld	hl,#0xC000
   6776 E5            [11]  617 	push	hl
   6777 3E 28         [ 7]  618 	ld	a,#0x28
   6779 F5            [11]  619 	push	af
   677A 33            [ 6]  620 	inc	sp
   677B DD 7E FF      [19]  621 	ld	a,-1 (ix)
   677E F5            [11]  622 	push	af
   677F 33            [ 6]  623 	inc	sp
   6780 C5            [11]  624 	push	bc
   6781 33            [ 6]  625 	inc	sp
   6782 7B            [ 4]  626 	ld	a,e
   6783 F5            [11]  627 	push	af
   6784 33            [ 6]  628 	inc	sp
   6785 D5            [11]  629 	push	de
   6786 33            [ 6]  630 	inc	sp
   6787 CD C9 59      [17]  631 	call	_cpct_etm_drawTileBox2x4
   678A 33            [ 6]  632 	inc	sp
   678B DD E1         [14]  633 	pop	ix
   678D C9            [10]  634 	ret
                            635 ;src/main.c:197: void redibujarEnemigo() {
                            636 ;	---------------------------------
                            637 ; Function redibujarEnemigo
                            638 ; ---------------------------------
   678E                     639 _redibujarEnemigo::
                            640 ;src/main.c:198: borrarEnemigo();
   678E CD 2B 67      [17]  641 	call	_borrarEnemigo
                            642 ;src/main.c:199: enemy.px = enemy.x;
   6791 01 77 64      [10]  643 	ld	bc,#_enemy + 2
   6794 3A 75 64      [13]  644 	ld	a, (#_enemy + 0)
   6797 02            [ 7]  645 	ld	(bc),a
                            646 ;src/main.c:200: enemy.py = enemy.y;
   6798 01 78 64      [10]  647 	ld	bc,#_enemy + 3
   679B 3A 76 64      [13]  648 	ld	a, (#_enemy + 1)
   679E 02            [ 7]  649 	ld	(bc),a
                            650 ;src/main.c:201: dibujarEnemigo();
   679F C3 05 67      [10]  651 	jp  _dibujarEnemigo
                            652 ;src/main.c:204: void moverEnemigo(){
                            653 ;	---------------------------------
                            654 ; Function moverEnemigo
                            655 ; ---------------------------------
   67A2                     656 _moverEnemigo::
                            657 ;src/main.c:206: if(enemy.mira == M_abajo){
   67A2 21 7C 64      [10]  658 	ld	hl, #(_enemy + 0x0007) + 0
   67A5 46            [ 7]  659 	ld	b,(hl)
                            660 ;src/main.c:207: if( *getTilePtr(enemy.x, enemy.y + G_ENEMY_H + 2) <= 2
   67A6 11 76 64      [10]  661 	ld	de,#_enemy + 1
   67A9 1A            [ 7]  662 	ld	a,(de)
   67AA 4F            [ 4]  663 	ld	c,a
   67AB 21 75 64      [10]  664 	ld	hl, #_enemy + 0
   67AE 6E            [ 7]  665 	ld	l,(hl)
                            666 ;src/main.c:206: if(enemy.mira == M_abajo){
   67AF 78            [ 4]  667 	ld	a,b
   67B0 D6 03         [ 7]  668 	sub	a, #0x03
   67B2 20 57         [12]  669 	jr	NZ,00112$
                            670 ;src/main.c:207: if( *getTilePtr(enemy.x, enemy.y + G_ENEMY_H + 2) <= 2
   67B4 79            [ 4]  671 	ld	a,c
   67B5 C6 18         [ 7]  672 	add	a, #0x18
   67B7 67            [ 4]  673 	ld	h,a
   67B8 D5            [11]  674 	push	de
   67B9 E5            [11]  675 	push	hl
   67BA 33            [ 6]  676 	inc	sp
   67BB 7D            [ 4]  677 	ld	a,l
   67BC F5            [11]  678 	push	af
   67BD 33            [ 6]  679 	inc	sp
   67BE CD 9B 65      [17]  680 	call	_getTilePtr
   67C1 F1            [10]  681 	pop	af
   67C2 D1            [10]  682 	pop	de
   67C3 4E            [ 7]  683 	ld	c,(hl)
   67C4 3E 02         [ 7]  684 	ld	a,#0x02
   67C6 91            [ 4]  685 	sub	a, c
   67C7 38 3C         [12]  686 	jr	C,00102$
                            687 ;src/main.c:208: && *getTilePtr(enemy.x + G_ENEMY_W / 2, enemy.y + G_ENEMY_H + 2) <= 2
   67C9 1A            [ 7]  688 	ld	a,(de)
   67CA C6 18         [ 7]  689 	add	a, #0x18
   67CC 4F            [ 4]  690 	ld	c,a
   67CD 3A 75 64      [13]  691 	ld	a, (#_enemy + 0)
   67D0 47            [ 4]  692 	ld	b,a
   67D1 04            [ 4]  693 	inc	b
   67D2 04            [ 4]  694 	inc	b
   67D3 D5            [11]  695 	push	de
   67D4 79            [ 4]  696 	ld	a,c
   67D5 F5            [11]  697 	push	af
   67D6 33            [ 6]  698 	inc	sp
   67D7 C5            [11]  699 	push	bc
   67D8 33            [ 6]  700 	inc	sp
   67D9 CD 9B 65      [17]  701 	call	_getTilePtr
   67DC F1            [10]  702 	pop	af
   67DD D1            [10]  703 	pop	de
   67DE 4E            [ 7]  704 	ld	c,(hl)
   67DF 3E 02         [ 7]  705 	ld	a,#0x02
   67E1 91            [ 4]  706 	sub	a, c
   67E2 38 21         [12]  707 	jr	C,00102$
                            708 ;src/main.c:209: && *getTilePtr(enemy.x + G_ENEMY_W, enemy.y + G_ENEMY_H + 2) <= 2)
   67E4 1A            [ 7]  709 	ld	a,(de)
   67E5 C6 18         [ 7]  710 	add	a, #0x18
   67E7 47            [ 4]  711 	ld	b,a
   67E8 3A 75 64      [13]  712 	ld	a, (#_enemy + 0)
   67EB C6 04         [ 7]  713 	add	a, #0x04
   67ED D5            [11]  714 	push	de
   67EE C5            [11]  715 	push	bc
   67EF 33            [ 6]  716 	inc	sp
   67F0 F5            [11]  717 	push	af
   67F1 33            [ 6]  718 	inc	sp
   67F2 CD 9B 65      [17]  719 	call	_getTilePtr
   67F5 F1            [10]  720 	pop	af
   67F6 D1            [10]  721 	pop	de
   67F7 4E            [ 7]  722 	ld	c,(hl)
   67F8 3E 02         [ 7]  723 	ld	a,#0x02
   67FA 91            [ 4]  724 	sub	a, c
   67FB 38 08         [12]  725 	jr	C,00102$
                            726 ;src/main.c:212: enemy.y++;
   67FD 1A            [ 7]  727 	ld	a,(de)
   67FE 3C            [ 4]  728 	inc	a
   67FF 12            [ 7]  729 	ld	(de),a
                            730 ;src/main.c:213: enemy.y++;
   6800 3C            [ 4]  731 	inc	a
   6801 12            [ 7]  732 	ld	(de),a
                            733 ;src/main.c:214: redibujarEnemigo();
   6802 C3 8E 67      [10]  734 	jp  _redibujarEnemigo
   6805                     735 00102$:
                            736 ;src/main.c:216: enemy.mira = M_arriba;
   6805 21 7C 64      [10]  737 	ld	hl,#(_enemy + 0x0007)
   6808 36 02         [10]  738 	ld	(hl),#0x02
   680A C9            [10]  739 	ret
   680B                     740 00112$:
                            741 ;src/main.c:220: if( *getTilePtr(enemy.x, enemy.y - 2) <= 2
   680B 61            [ 4]  742 	ld	h,c
   680C 25            [ 4]  743 	dec	h
   680D 25            [ 4]  744 	dec	h
   680E D5            [11]  745 	push	de
   680F E5            [11]  746 	push	hl
   6810 33            [ 6]  747 	inc	sp
   6811 7D            [ 4]  748 	ld	a,l
   6812 F5            [11]  749 	push	af
   6813 33            [ 6]  750 	inc	sp
   6814 CD 9B 65      [17]  751 	call	_getTilePtr
   6817 F1            [10]  752 	pop	af
   6818 D1            [10]  753 	pop	de
   6819 4E            [ 7]  754 	ld	c,(hl)
   681A 3E 02         [ 7]  755 	ld	a,#0x02
   681C 91            [ 4]  756 	sub	a, c
   681D 38 3C         [12]  757 	jr	C,00107$
                            758 ;src/main.c:221: && *getTilePtr(enemy.x + G_ENEMY_W / 2, enemy.y - 2) <= 2
   681F 1A            [ 7]  759 	ld	a,(de)
   6820 47            [ 4]  760 	ld	b,a
   6821 05            [ 4]  761 	dec	b
   6822 05            [ 4]  762 	dec	b
   6823 3A 75 64      [13]  763 	ld	a, (#_enemy + 0)
   6826 C6 02         [ 7]  764 	add	a, #0x02
   6828 D5            [11]  765 	push	de
   6829 C5            [11]  766 	push	bc
   682A 33            [ 6]  767 	inc	sp
   682B F5            [11]  768 	push	af
   682C 33            [ 6]  769 	inc	sp
   682D CD 9B 65      [17]  770 	call	_getTilePtr
   6830 F1            [10]  771 	pop	af
   6831 D1            [10]  772 	pop	de
   6832 4E            [ 7]  773 	ld	c,(hl)
   6833 3E 02         [ 7]  774 	ld	a,#0x02
   6835 91            [ 4]  775 	sub	a, c
   6836 38 23         [12]  776 	jr	C,00107$
                            777 ;src/main.c:222: && *getTilePtr(enemy.x + G_ENEMY_W, enemy.y - 2) <= 2)
   6838 1A            [ 7]  778 	ld	a,(de)
   6839 47            [ 4]  779 	ld	b,a
   683A 05            [ 4]  780 	dec	b
   683B 05            [ 4]  781 	dec	b
   683C 3A 75 64      [13]  782 	ld	a, (#_enemy + 0)
   683F C6 04         [ 7]  783 	add	a, #0x04
   6841 D5            [11]  784 	push	de
   6842 C5            [11]  785 	push	bc
   6843 33            [ 6]  786 	inc	sp
   6844 F5            [11]  787 	push	af
   6845 33            [ 6]  788 	inc	sp
   6846 CD 9B 65      [17]  789 	call	_getTilePtr
   6849 F1            [10]  790 	pop	af
   684A D1            [10]  791 	pop	de
   684B 4E            [ 7]  792 	ld	c,(hl)
   684C 3E 02         [ 7]  793 	ld	a,#0x02
   684E 91            [ 4]  794 	sub	a, c
   684F 38 0A         [12]  795 	jr	C,00107$
                            796 ;src/main.c:225: enemy.y--;
   6851 1A            [ 7]  797 	ld	a,(de)
   6852 C6 FF         [ 7]  798 	add	a,#0xFF
   6854 12            [ 7]  799 	ld	(de),a
                            800 ;src/main.c:226: enemy.y--;
   6855 C6 FF         [ 7]  801 	add	a,#0xFF
   6857 12            [ 7]  802 	ld	(de),a
                            803 ;src/main.c:227: redibujarEnemigo();
   6858 C3 8E 67      [10]  804 	jp  _redibujarEnemigo
   685B                     805 00107$:
                            806 ;src/main.c:229: enemy.mira = M_abajo;
   685B 21 7C 64      [10]  807 	ld	hl,#(_enemy + 0x0007)
   685E 36 03         [10]  808 	ld	(hl),#0x03
   6860 C9            [10]  809 	ret
                            810 ;src/main.c:234: void avanzarMapa() {
                            811 ;	---------------------------------
                            812 ; Function avanzarMapa
                            813 ; ---------------------------------
   6861                     814 _avanzarMapa::
                            815 ;src/main.c:235: if(num_mapa < NUM_MAPAS -1) {
   6861 3A E1 64      [13]  816 	ld	a,(#_num_mapa + 0)
   6864 D6 02         [ 7]  817 	sub	a, #0x02
   6866 D2 BD 6D      [10]  818 	jp	NC,_menuFin
                            819 ;src/main.c:236: mapa = mapas[++num_mapa];
   6869 21 E1 64      [10]  820 	ld	hl, #_num_mapa+0
   686C 34            [11]  821 	inc	(hl)
   686D FD 21 E1 64   [14]  822 	ld	iy,#_num_mapa
   6871 FD 6E 00      [19]  823 	ld	l,0 (iy)
   6874 26 00         [ 7]  824 	ld	h,#0x00
   6876 29            [11]  825 	add	hl, hl
   6877 11 F8 64      [10]  826 	ld	de,#_mapas
   687A 19            [11]  827 	add	hl,de
   687B 7E            [ 7]  828 	ld	a,(hl)
   687C FD 21 DF 64   [14]  829 	ld	iy,#_mapa
   6880 FD 77 00      [19]  830 	ld	0 (iy),a
   6883 23            [ 6]  831 	inc	hl
   6884 7E            [ 7]  832 	ld	a,(hl)
   6885 32 E0 64      [13]  833 	ld	(#_mapa + 1),a
                            834 ;src/main.c:237: prota.x = prota.px = 2;
   6888 21 7F 64      [10]  835 	ld	hl,#(_prota + 0x0002)
   688B 36 02         [10]  836 	ld	(hl),#0x02
   688D 21 7D 64      [10]  837 	ld	hl,#_prota
   6890 36 02         [10]  838 	ld	(hl),#0x02
                            839 ;src/main.c:238: prota.mover = SI;
   6892 21 83 64      [10]  840 	ld	hl,#(_prota + 0x0006)
                            841 ;src/main.c:239: dibujarMapa();
                            842 ;src/main.c:242: menuFin();
   6895 36 01         [10]  843 	ld	(hl), #0x01
   6897 C3 E2 64      [10]  844 	jp	_dibujarMapa
                            845 ;src/main.c:246: void moverIzquierda() {
                            846 ;	---------------------------------
                            847 ; Function moverIzquierda
                            848 ; ---------------------------------
   689A                     849 _moverIzquierda::
                            850 ;src/main.c:247: prota.mira = M_izquierda;
   689A 01 7D 64      [10]  851 	ld	bc,#_prota+0
   689D 21 84 64      [10]  852 	ld	hl,#(_prota + 0x0007)
   68A0 36 01         [10]  853 	ld	(hl),#0x01
                            854 ;src/main.c:248: if (!checkCollision(M_izquierda)) {
   68A2 C5            [11]  855 	push	bc
   68A3 21 01 00      [10]  856 	ld	hl,#0x0001
   68A6 E5            [11]  857 	push	hl
   68A7 CD C3 65      [17]  858 	call	_checkCollision
   68AA F1            [10]  859 	pop	af
   68AB C1            [10]  860 	pop	bc
   68AC 7D            [ 4]  861 	ld	a,l
   68AD B7            [ 4]  862 	or	a, a
   68AE C0            [11]  863 	ret	NZ
                            864 ;src/main.c:249: prota.x--;
   68AF 0A            [ 7]  865 	ld	a,(bc)
   68B0 C6 FF         [ 7]  866 	add	a,#0xFF
   68B2 02            [ 7]  867 	ld	(bc),a
                            868 ;src/main.c:250: prota.mover = SI;
   68B3 21 83 64      [10]  869 	ld	hl,#(_prota + 0x0006)
   68B6 36 01         [10]  870 	ld	(hl),#0x01
                            871 ;src/main.c:251: prota.sprite = g_hero_left;
   68B8 21 34 57      [10]  872 	ld	hl,#_g_hero_left
   68BB 22 81 64      [16]  873 	ld	((_prota + 0x0004)), hl
   68BE C9            [10]  874 	ret
                            875 ;src/main.c:255: void moverDerecha() {
                            876 ;	---------------------------------
                            877 ; Function moverDerecha
                            878 ; ---------------------------------
   68BF                     879 _moverDerecha::
                            880 ;src/main.c:256: prota.mira = M_derecha;
   68BF 21 84 64      [10]  881 	ld	hl,#(_prota + 0x0007)
   68C2 36 00         [10]  882 	ld	(hl),#0x00
                            883 ;src/main.c:257: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   68C4 21 00 00      [10]  884 	ld	hl,#0x0000
   68C7 E5            [11]  885 	push	hl
   68C8 CD C3 65      [17]  886 	call	_checkCollision
   68CB F1            [10]  887 	pop	af
   68CC 45            [ 4]  888 	ld	b,l
   68CD 21 7D 64      [10]  889 	ld	hl, #_prota + 0
   68D0 4E            [ 7]  890 	ld	c,(hl)
   68D1 59            [ 4]  891 	ld	e,c
   68D2 16 00         [ 7]  892 	ld	d,#0x00
   68D4 21 07 00      [10]  893 	ld	hl,#0x0007
   68D7 19            [11]  894 	add	hl,de
   68D8 11 50 80      [10]  895 	ld	de, #0x8050
   68DB 29            [11]  896 	add	hl, hl
   68DC 3F            [ 4]  897 	ccf
   68DD CB 1C         [ 8]  898 	rr	h
   68DF CB 1D         [ 8]  899 	rr	l
   68E1 ED 52         [15]  900 	sbc	hl, de
   68E3 3E 00         [ 7]  901 	ld	a,#0x00
   68E5 17            [ 4]  902 	rla
   68E6 5F            [ 4]  903 	ld	e,a
   68E7 78            [ 4]  904 	ld	a,b
   68E8 B7            [ 4]  905 	or	a,a
   68E9 20 14         [12]  906 	jr	NZ,00104$
   68EB B3            [ 4]  907 	or	a,e
   68EC 28 11         [12]  908 	jr	Z,00104$
                            909 ;src/main.c:258: prota.x++;
   68EE 0C            [ 4]  910 	inc	c
   68EF 21 7D 64      [10]  911 	ld	hl,#_prota
   68F2 71            [ 7]  912 	ld	(hl),c
                            913 ;src/main.c:259: prota.mover = SI;
   68F3 21 83 64      [10]  914 	ld	hl,#(_prota + 0x0006)
   68F6 36 01         [10]  915 	ld	(hl),#0x01
                            916 ;src/main.c:260: prota.sprite = g_hero;
   68F8 21 DE 57      [10]  917 	ld	hl,#_g_hero
   68FB 22 81 64      [16]  918 	ld	((_prota + 0x0004)), hl
   68FE C9            [10]  919 	ret
   68FF                     920 00104$:
                            921 ;src/main.c:262: }else if( prota.x + G_HERO_W >= 80){
   68FF 7B            [ 4]  922 	ld	a,e
   6900 B7            [ 4]  923 	or	a, a
   6901 C0            [11]  924 	ret	NZ
                            925 ;src/main.c:263: avanzarMapa();
   6902 C3 61 68      [10]  926 	jp  _avanzarMapa
                            927 ;src/main.c:268: void moverArriba() {
                            928 ;	---------------------------------
                            929 ; Function moverArriba
                            930 ; ---------------------------------
   6905                     931 _moverArriba::
                            932 ;src/main.c:269: prota.mira = M_arriba;
   6905 21 84 64      [10]  933 	ld	hl,#(_prota + 0x0007)
   6908 36 02         [10]  934 	ld	(hl),#0x02
                            935 ;src/main.c:270: if (!checkCollision(M_arriba)) {
   690A 21 02 00      [10]  936 	ld	hl,#0x0002
   690D E5            [11]  937 	push	hl
   690E CD C3 65      [17]  938 	call	_checkCollision
   6911 F1            [10]  939 	pop	af
   6912 7D            [ 4]  940 	ld	a,l
   6913 B7            [ 4]  941 	or	a, a
   6914 C0            [11]  942 	ret	NZ
                            943 ;src/main.c:271: prota.y--;
   6915 21 7E 64      [10]  944 	ld	hl,#_prota + 1
   6918 4E            [ 7]  945 	ld	c,(hl)
   6919 0D            [ 4]  946 	dec	c
   691A 71            [ 7]  947 	ld	(hl),c
                            948 ;src/main.c:272: prota.y--;
   691B 0D            [ 4]  949 	dec	c
   691C 71            [ 7]  950 	ld	(hl),c
                            951 ;src/main.c:273: prota.mover  = SI;
   691D 21 83 64      [10]  952 	ld	hl,#(_prota + 0x0006)
   6920 36 01         [10]  953 	ld	(hl),#0x01
                            954 ;src/main.c:274: prota.sprite = g_hero_up;
   6922 21 9A 56      [10]  955 	ld	hl,#_g_hero_up
   6925 22 81 64      [16]  956 	ld	((_prota + 0x0004)), hl
   6928 C9            [10]  957 	ret
                            958 ;src/main.c:278: void moverAbajo() {
                            959 ;	---------------------------------
                            960 ; Function moverAbajo
                            961 ; ---------------------------------
   6929                     962 _moverAbajo::
                            963 ;src/main.c:279: prota.mira = M_abajo;
   6929 21 84 64      [10]  964 	ld	hl,#(_prota + 0x0007)
   692C 36 03         [10]  965 	ld	(hl),#0x03
                            966 ;src/main.c:280: if (!checkCollision(M_abajo)) {
   692E 21 03 00      [10]  967 	ld	hl,#0x0003
   6931 E5            [11]  968 	push	hl
   6932 CD C3 65      [17]  969 	call	_checkCollision
   6935 F1            [10]  970 	pop	af
   6936 7D            [ 4]  971 	ld	a,l
   6937 B7            [ 4]  972 	or	a, a
   6938 C0            [11]  973 	ret	NZ
                            974 ;src/main.c:281: prota.y++;
   6939 01 7E 64      [10]  975 	ld	bc,#_prota + 1
   693C 0A            [ 7]  976 	ld	a,(bc)
   693D 3C            [ 4]  977 	inc	a
   693E 02            [ 7]  978 	ld	(bc),a
                            979 ;src/main.c:282: prota.y++;
   693F 3C            [ 4]  980 	inc	a
   6940 02            [ 7]  981 	ld	(bc),a
                            982 ;src/main.c:283: prota.mover  = SI;
   6941 21 83 64      [10]  983 	ld	hl,#(_prota + 0x0006)
   6944 36 01         [10]  984 	ld	(hl),#0x01
                            985 ;src/main.c:284: prota.sprite = g_hero_down;
   6946 21 00 56      [10]  986 	ld	hl,#_g_hero_down
   6949 22 81 64      [16]  987 	ld	((_prota + 0x0004)), hl
   694C C9            [10]  988 	ret
                            989 ;src/main.c:288: void dibujarCuchillo(TKnife* actual) {
                            990 ;	---------------------------------
                            991 ; Function dibujarCuchillo
                            992 ; ---------------------------------
   694D                     993 _dibujarCuchillo::
   694D DD E5         [15]  994 	push	ix
   694F DD 21 00 00   [14]  995 	ld	ix,#0
   6953 DD 39         [15]  996 	add	ix,sp
   6955 F5            [11]  997 	push	af
   6956 F5            [11]  998 	push	af
                            999 ;src/main.c:289: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, actual->x, actual->y);
   6957 DD 5E 04      [19] 1000 	ld	e,4 (ix)
   695A DD 56 05      [19] 1001 	ld	d,5 (ix)
   695D 6B            [ 4] 1002 	ld	l, e
   695E 62            [ 4] 1003 	ld	h, d
   695F 23            [ 6] 1004 	inc	hl
   6960 46            [ 7] 1005 	ld	b,(hl)
   6961 1A            [ 7] 1006 	ld	a,(de)
   6962 D5            [11] 1007 	push	de
   6963 C5            [11] 1008 	push	bc
   6964 33            [ 6] 1009 	inc	sp
   6965 F5            [11] 1010 	push	af
   6966 33            [ 6] 1011 	inc	sp
   6967 21 00 C0      [10] 1012 	ld	hl,#0xC000
   696A E5            [11] 1013 	push	hl
   696B CD 18 64      [17] 1014 	call	_cpct_getScreenPtr
   696E D1            [10] 1015 	pop	de
   696F E5            [11] 1016 	push	hl
   6970 FD E1         [14] 1017 	pop	iy
                           1018 ;src/main.c:290: if(actual->eje == E_X){
   6972 6B            [ 4] 1019 	ld	l, e
   6973 62            [ 4] 1020 	ld	h, d
   6974 01 08 00      [10] 1021 	ld	bc, #0x0008
   6977 09            [11] 1022 	add	hl, bc
   6978 4E            [ 7] 1023 	ld	c,(hl)
                           1024 ;src/main.c:291: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   6979 FD E5         [15] 1025 	push	iy
   697B F1            [10] 1026 	pop	af
   697C DD 77 FD      [19] 1027 	ld	-3 (ix),a
   697F FD E5         [15] 1028 	push	iy
   6981 3B            [ 6] 1029 	dec	sp
   6982 F1            [10] 1030 	pop	af
   6983 33            [ 6] 1031 	inc	sp
   6984 DD 77 FC      [19] 1032 	ld	-4 (ix),a
   6987 21 04 00      [10] 1033 	ld	hl,#0x0004
   698A 19            [11] 1034 	add	hl,de
   698B DD 75 FE      [19] 1035 	ld	-2 (ix),l
   698E DD 74 FF      [19] 1036 	ld	-1 (ix),h
                           1037 ;src/main.c:290: if(actual->eje == E_X){
   6991 79            [ 4] 1038 	ld	a,c
   6992 B7            [ 4] 1039 	or	a, a
   6993 20 1E         [12] 1040 	jr	NZ,00104$
                           1041 ;src/main.c:291: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   6995 11 00 3E      [10] 1042 	ld	de,#_g_tablatrans+0
   6998 DD 6E FE      [19] 1043 	ld	l,-2 (ix)
   699B DD 66 FF      [19] 1044 	ld	h,-1 (ix)
   699E 4E            [ 7] 1045 	ld	c,(hl)
   699F 23            [ 6] 1046 	inc	hl
   69A0 46            [ 7] 1047 	ld	b,(hl)
   69A1 D5            [11] 1048 	push	de
   69A2 21 04 04      [10] 1049 	ld	hl,#0x0404
   69A5 E5            [11] 1050 	push	hl
   69A6 DD 6E FC      [19] 1051 	ld	l,-4 (ix)
   69A9 DD 66 FD      [19] 1052 	ld	h,-3 (ix)
   69AC E5            [11] 1053 	push	hl
   69AD C5            [11] 1054 	push	bc
   69AE CD 38 64      [17] 1055 	call	_cpct_drawSpriteMaskedAlignedTable
   69B1 18 1F         [12] 1056 	jr	00106$
   69B3                    1057 00104$:
                           1058 ;src/main.c:294: else if(actual->eje == E_Y){
   69B3 0D            [ 4] 1059 	dec	c
   69B4 20 1C         [12] 1060 	jr	NZ,00106$
                           1061 ;src/main.c:295: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   69B6 11 00 3E      [10] 1062 	ld	de,#_g_tablatrans+0
   69B9 DD 6E FE      [19] 1063 	ld	l,-2 (ix)
   69BC DD 66 FF      [19] 1064 	ld	h,-1 (ix)
   69BF 4E            [ 7] 1065 	ld	c,(hl)
   69C0 23            [ 6] 1066 	inc	hl
   69C1 46            [ 7] 1067 	ld	b,(hl)
   69C2 D5            [11] 1068 	push	de
   69C3 21 02 08      [10] 1069 	ld	hl,#0x0802
   69C6 E5            [11] 1070 	push	hl
   69C7 DD 6E FC      [19] 1071 	ld	l,-4 (ix)
   69CA DD 66 FD      [19] 1072 	ld	h,-3 (ix)
   69CD E5            [11] 1073 	push	hl
   69CE C5            [11] 1074 	push	bc
   69CF CD 38 64      [17] 1075 	call	_cpct_drawSpriteMaskedAlignedTable
   69D2                    1076 00106$:
   69D2 DD F9         [10] 1077 	ld	sp, ix
   69D4 DD E1         [14] 1078 	pop	ix
   69D6 C9            [10] 1079 	ret
                           1080 ;src/main.c:299: void borrarCuchillo(TKnife* actual) {
                           1081 ;	---------------------------------
                           1082 ; Function borrarCuchillo
                           1083 ; ---------------------------------
   69D7                    1084 _borrarCuchillo::
   69D7 DD E5         [15] 1085 	push	ix
   69D9 DD 21 00 00   [14] 1086 	ld	ix,#0
   69DD DD 39         [15] 1087 	add	ix,sp
   69DF 3B            [ 6] 1088 	dec	sp
                           1089 ;src/main.c:300: u8 w = 2 + (actual->px & 1);
   69E0 DD 5E 04      [19] 1090 	ld	e,4 (ix)
   69E3 DD 56 05      [19] 1091 	ld	d,5 (ix)
   69E6 6B            [ 4] 1092 	ld	l, e
   69E7 62            [ 4] 1093 	ld	h, d
   69E8 23            [ 6] 1094 	inc	hl
   69E9 23            [ 6] 1095 	inc	hl
   69EA 4E            [ 7] 1096 	ld	c,(hl)
   69EB 79            [ 4] 1097 	ld	a,c
   69EC E6 01         [ 7] 1098 	and	a, #0x01
   69EE 47            [ 4] 1099 	ld	b,a
   69EF 04            [ 4] 1100 	inc	b
   69F0 04            [ 4] 1101 	inc	b
                           1102 ;src/main.c:301: u8 h = 2 + (actual->py & 3 ? 1 : 0);
   69F1 EB            [ 4] 1103 	ex	de,hl
   69F2 23            [ 6] 1104 	inc	hl
   69F3 23            [ 6] 1105 	inc	hl
   69F4 23            [ 6] 1106 	inc	hl
   69F5 5E            [ 7] 1107 	ld	e,(hl)
   69F6 7B            [ 4] 1108 	ld	a,e
   69F7 E6 03         [ 7] 1109 	and	a, #0x03
   69F9 28 04         [12] 1110 	jr	Z,00103$
   69FB 3E 01         [ 7] 1111 	ld	a,#0x01
   69FD 18 02         [12] 1112 	jr	00104$
   69FF                    1113 00103$:
   69FF 3E 00         [ 7] 1114 	ld	a,#0x00
   6A01                    1115 00104$:
   6A01 C6 02         [ 7] 1116 	add	a, #0x02
   6A03 DD 77 FF      [19] 1117 	ld	-1 (ix),a
                           1118 ;src/main.c:302: cpct_etm_drawTileBox2x4 (actual->px / 2, (actual->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   6A06 FD 2A DF 64   [20] 1119 	ld	iy,(_mapa)
   6A0A 16 00         [ 7] 1120 	ld	d,#0x00
   6A0C 63            [ 4] 1121 	ld	h,e
   6A0D 6A            [ 4] 1122 	ld	l,d
   6A0E CB 7A         [ 8] 1123 	bit	7, d
   6A10 28 05         [12] 1124 	jr	Z,00105$
   6A12 13            [ 6] 1125 	inc	de
   6A13 13            [ 6] 1126 	inc	de
   6A14 13            [ 6] 1127 	inc	de
   6A15 63            [ 4] 1128 	ld	h,e
   6A16 6A            [ 4] 1129 	ld	l,d
   6A17                    1130 00105$:
   6A17 5C            [ 4] 1131 	ld	e, h
   6A18 55            [ 4] 1132 	ld	d, l
   6A19 CB 2A         [ 8] 1133 	sra	d
   6A1B CB 1B         [ 8] 1134 	rr	e
   6A1D CB 2A         [ 8] 1135 	sra	d
   6A1F CB 1B         [ 8] 1136 	rr	e
   6A21 51            [ 4] 1137 	ld	d,c
   6A22 CB 3A         [ 8] 1138 	srl	d
   6A24 FD E5         [15] 1139 	push	iy
   6A26 21 00 C0      [10] 1140 	ld	hl,#0xC000
   6A29 E5            [11] 1141 	push	hl
   6A2A 3E 28         [ 7] 1142 	ld	a,#0x28
   6A2C F5            [11] 1143 	push	af
   6A2D 33            [ 6] 1144 	inc	sp
   6A2E DD 7E FF      [19] 1145 	ld	a,-1 (ix)
   6A31 F5            [11] 1146 	push	af
   6A32 33            [ 6] 1147 	inc	sp
   6A33 C5            [11] 1148 	push	bc
   6A34 33            [ 6] 1149 	inc	sp
   6A35 7B            [ 4] 1150 	ld	a,e
   6A36 F5            [11] 1151 	push	af
   6A37 33            [ 6] 1152 	inc	sp
   6A38 D5            [11] 1153 	push	de
   6A39 33            [ 6] 1154 	inc	sp
   6A3A CD C9 59      [17] 1155 	call	_cpct_etm_drawTileBox2x4
   6A3D 33            [ 6] 1156 	inc	sp
   6A3E DD E1         [14] 1157 	pop	ix
   6A40 C9            [10] 1158 	ret
                           1159 ;src/main.c:305: void redibujarCuchillo(TKnife* actual) {
                           1160 ;	---------------------------------
                           1161 ; Function redibujarCuchillo
                           1162 ; ---------------------------------
   6A41                    1163 _redibujarCuchillo::
   6A41 DD E5         [15] 1164 	push	ix
   6A43 DD 21 00 00   [14] 1165 	ld	ix,#0
   6A47 DD 39         [15] 1166 	add	ix,sp
                           1167 ;src/main.c:306: borrarCuchillo(actual);
   6A49 DD 6E 04      [19] 1168 	ld	l,4 (ix)
   6A4C DD 66 05      [19] 1169 	ld	h,5 (ix)
   6A4F E5            [11] 1170 	push	hl
   6A50 CD D7 69      [17] 1171 	call	_borrarCuchillo
   6A53 F1            [10] 1172 	pop	af
                           1173 ;src/main.c:307: actual->px = actual->x;
   6A54 DD 4E 04      [19] 1174 	ld	c,4 (ix)
   6A57 DD 46 05      [19] 1175 	ld	b,5 (ix)
   6A5A 59            [ 4] 1176 	ld	e, c
   6A5B 50            [ 4] 1177 	ld	d, b
   6A5C 13            [ 6] 1178 	inc	de
   6A5D 13            [ 6] 1179 	inc	de
   6A5E 0A            [ 7] 1180 	ld	a,(bc)
   6A5F 12            [ 7] 1181 	ld	(de),a
                           1182 ;src/main.c:308: actual->py = actual->y;
   6A60 59            [ 4] 1183 	ld	e, c
   6A61 50            [ 4] 1184 	ld	d, b
   6A62 13            [ 6] 1185 	inc	de
   6A63 13            [ 6] 1186 	inc	de
   6A64 13            [ 6] 1187 	inc	de
   6A65 69            [ 4] 1188 	ld	l, c
   6A66 60            [ 4] 1189 	ld	h, b
   6A67 23            [ 6] 1190 	inc	hl
   6A68 7E            [ 7] 1191 	ld	a,(hl)
   6A69 12            [ 7] 1192 	ld	(de),a
                           1193 ;src/main.c:309: dibujarCuchillo(actual);
   6A6A C5            [11] 1194 	push	bc
   6A6B CD 4D 69      [17] 1195 	call	_dibujarCuchillo
   6A6E F1            [10] 1196 	pop	af
   6A6F DD E1         [14] 1197 	pop	ix
   6A71 C9            [10] 1198 	ret
                           1199 ;src/main.c:313: void lanzarCuchillo(){
                           1200 ;	---------------------------------
                           1201 ; Function lanzarCuchillo
                           1202 ; ---------------------------------
   6A72                    1203 _lanzarCuchillo::
   6A72 DD E5         [15] 1204 	push	ix
   6A74 DD 21 00 00   [14] 1205 	ld	ix,#0
   6A78 DD 39         [15] 1206 	add	ix,sp
   6A7A 21 F6 FF      [10] 1207 	ld	hl,#-10
   6A7D 39            [11] 1208 	add	hl,sp
   6A7E F9            [ 6] 1209 	ld	sp,hl
                           1210 ;src/main.c:315: TKnife* actual = cu;
   6A7F 01 85 64      [10] 1211 	ld	bc,#_cu+0
                           1212 ;src/main.c:318: while(i>0 && actual->lanzado){
   6A82 1E 0A         [ 7] 1213 	ld	e,#0x0A
   6A84                    1214 00102$:
   6A84 21 06 00      [10] 1215 	ld	hl,#0x0006
   6A87 09            [11] 1216 	add	hl,bc
   6A88 DD 75 FA      [19] 1217 	ld	-6 (ix),l
   6A8B DD 74 FB      [19] 1218 	ld	-5 (ix),h
   6A8E 7B            [ 4] 1219 	ld	a,e
   6A8F B7            [ 4] 1220 	or	a, a
   6A90 28 13         [12] 1221 	jr	Z,00104$
   6A92 DD 6E FA      [19] 1222 	ld	l,-6 (ix)
   6A95 DD 66 FB      [19] 1223 	ld	h,-5 (ix)
   6A98 7E            [ 7] 1224 	ld	a,(hl)
   6A99 B7            [ 4] 1225 	or	a, a
   6A9A 28 09         [12] 1226 	jr	Z,00104$
                           1227 ;src/main.c:319: --i;
   6A9C 1D            [ 4] 1228 	dec	e
                           1229 ;src/main.c:320: actual++;
   6A9D 21 09 00      [10] 1230 	ld	hl,#0x0009
   6AA0 09            [11] 1231 	add	hl,bc
   6AA1 4D            [ 4] 1232 	ld	c,l
   6AA2 44            [ 4] 1233 	ld	b,h
   6AA3 18 DF         [12] 1234 	jr	00102$
   6AA5                    1235 00104$:
                           1236 ;src/main.c:323: if(i>0 && !actual->lanzado){
   6AA5 7B            [ 4] 1237 	ld	a,e
   6AA6 B7            [ 4] 1238 	or	a, a
   6AA7 CA 3B 6C      [10] 1239 	jp	Z,00127$
   6AAA DD 6E FA      [19] 1240 	ld	l,-6 (ix)
   6AAD DD 66 FB      [19] 1241 	ld	h,-5 (ix)
   6AB0 7E            [ 7] 1242 	ld	a,(hl)
   6AB1 B7            [ 4] 1243 	or	a, a
   6AB2 C2 3B 6C      [10] 1244 	jp	NZ,00127$
                           1245 ;src/main.c:325: if(prota.mira == M_derecha){
   6AB5 21 84 64      [10] 1246 	ld	hl, #_prota + 7
   6AB8 5E            [ 7] 1247 	ld	e,(hl)
                           1248 ;src/main.c:327: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
                           1249 ;src/main.c:329: actual->direccion = M_derecha;
   6AB9 21 07 00      [10] 1250 	ld	hl,#0x0007
   6ABC 09            [11] 1251 	add	hl,bc
   6ABD E3            [19] 1252 	ex	(sp), hl
                           1253 ;src/main.c:331: actual->y=prota.y + G_HERO_H /2;
   6ABE 21 01 00      [10] 1254 	ld	hl,#0x0001
   6AC1 09            [11] 1255 	add	hl,bc
   6AC2 DD 75 FE      [19] 1256 	ld	-2 (ix),l
   6AC5 DD 74 FF      [19] 1257 	ld	-1 (ix),h
                           1258 ;src/main.c:332: actual->sprite=g_knifeX_0;
   6AC8 21 04 00      [10] 1259 	ld	hl,#0x0004
   6ACB 09            [11] 1260 	add	hl,bc
   6ACC DD 75 F8      [19] 1261 	ld	-8 (ix),l
   6ACF DD 74 F9      [19] 1262 	ld	-7 (ix),h
                           1263 ;src/main.c:333: actual->eje = E_X;
   6AD2 21 08 00      [10] 1264 	ld	hl,#0x0008
   6AD5 09            [11] 1265 	add	hl,bc
   6AD6 DD 75 FC      [19] 1266 	ld	-4 (ix),l
   6AD9 DD 74 FD      [19] 1267 	ld	-3 (ix),h
                           1268 ;src/main.c:325: if(prota.mira == M_derecha){
   6ADC 7B            [ 4] 1269 	ld	a,e
   6ADD B7            [ 4] 1270 	or	a, a
   6ADE 20 55         [12] 1271 	jr	NZ,00122$
                           1272 ;src/main.c:327: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   6AE0 3A 7E 64      [13] 1273 	ld	a, (#(_prota + 0x0001) + 0)
   6AE3 C6 0B         [ 7] 1274 	add	a, #0x0B
   6AE5 57            [ 4] 1275 	ld	d,a
   6AE6 3A 7D 64      [13] 1276 	ld	a, (#_prota + 0)
   6AE9 C6 0C         [ 7] 1277 	add	a, #0x0C
   6AEB C5            [11] 1278 	push	bc
   6AEC D5            [11] 1279 	push	de
   6AED 33            [ 6] 1280 	inc	sp
   6AEE F5            [11] 1281 	push	af
   6AEF 33            [ 6] 1282 	inc	sp
   6AF0 CD 9B 65      [17] 1283 	call	_getTilePtr
   6AF3 F1            [10] 1284 	pop	af
   6AF4 C1            [10] 1285 	pop	bc
   6AF5 5E            [ 7] 1286 	ld	e,(hl)
   6AF6 3E 02         [ 7] 1287 	ld	a,#0x02
   6AF8 93            [ 4] 1288 	sub	a, e
   6AF9 DA 3B 6C      [10] 1289 	jp	C,00127$
                           1290 ;src/main.c:328: actual->lanzado = SI;
   6AFC DD 6E FA      [19] 1291 	ld	l,-6 (ix)
   6AFF DD 66 FB      [19] 1292 	ld	h,-5 (ix)
   6B02 36 01         [10] 1293 	ld	(hl),#0x01
                           1294 ;src/main.c:329: actual->direccion = M_derecha;
   6B04 E1            [10] 1295 	pop	hl
   6B05 E5            [11] 1296 	push	hl
   6B06 36 00         [10] 1297 	ld	(hl),#0x00
                           1298 ;src/main.c:330: actual->x=prota.x + G_HERO_W;
   6B08 3A 7D 64      [13] 1299 	ld	a, (#_prota + 0)
   6B0B C6 07         [ 7] 1300 	add	a, #0x07
   6B0D 02            [ 7] 1301 	ld	(bc),a
                           1302 ;src/main.c:331: actual->y=prota.y + G_HERO_H /2;
   6B0E 3A 7E 64      [13] 1303 	ld	a, (#(_prota + 0x0001) + 0)
   6B11 C6 0B         [ 7] 1304 	add	a, #0x0B
   6B13 DD 6E FE      [19] 1305 	ld	l,-2 (ix)
   6B16 DD 66 FF      [19] 1306 	ld	h,-1 (ix)
   6B19 77            [ 7] 1307 	ld	(hl),a
                           1308 ;src/main.c:332: actual->sprite=g_knifeX_0;
   6B1A DD 6E F8      [19] 1309 	ld	l,-8 (ix)
   6B1D DD 66 F9      [19] 1310 	ld	h,-7 (ix)
   6B20 36 C0         [10] 1311 	ld	(hl),#<(_g_knifeX_0)
   6B22 23            [ 6] 1312 	inc	hl
   6B23 36 54         [10] 1313 	ld	(hl),#>(_g_knifeX_0)
                           1314 ;src/main.c:333: actual->eje = E_X;
   6B25 DD 6E FC      [19] 1315 	ld	l,-4 (ix)
   6B28 DD 66 FD      [19] 1316 	ld	h,-3 (ix)
   6B2B 36 00         [10] 1317 	ld	(hl),#0x00
                           1318 ;src/main.c:334: dibujarCuchillo(actual);
   6B2D C5            [11] 1319 	push	bc
   6B2E CD 4D 69      [17] 1320 	call	_dibujarCuchillo
   6B31 F1            [10] 1321 	pop	af
   6B32 C3 3B 6C      [10] 1322 	jp	00127$
   6B35                    1323 00122$:
                           1324 ;src/main.c:337: else if(prota.mira == M_izquierda){
   6B35 7B            [ 4] 1325 	ld	a,e
   6B36 3D            [ 4] 1326 	dec	a
   6B37 20 55         [12] 1327 	jr	NZ,00119$
                           1328 ;src/main.c:338: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   6B39 3A 7E 64      [13] 1329 	ld	a, (#(_prota + 0x0001) + 0)
   6B3C C6 0B         [ 7] 1330 	add	a, #0x0B
   6B3E 57            [ 4] 1331 	ld	d,a
   6B3F 3A 7D 64      [13] 1332 	ld	a, (#_prota + 0)
   6B42 C6 F6         [ 7] 1333 	add	a,#0xF6
   6B44 C5            [11] 1334 	push	bc
   6B45 D5            [11] 1335 	push	de
   6B46 33            [ 6] 1336 	inc	sp
   6B47 F5            [11] 1337 	push	af
   6B48 33            [ 6] 1338 	inc	sp
   6B49 CD 9B 65      [17] 1339 	call	_getTilePtr
   6B4C F1            [10] 1340 	pop	af
   6B4D C1            [10] 1341 	pop	bc
   6B4E 5E            [ 7] 1342 	ld	e,(hl)
   6B4F 3E 02         [ 7] 1343 	ld	a,#0x02
   6B51 93            [ 4] 1344 	sub	a, e
   6B52 DA 3B 6C      [10] 1345 	jp	C,00127$
                           1346 ;src/main.c:339: actual->lanzado = SI;
   6B55 DD 6E FA      [19] 1347 	ld	l,-6 (ix)
   6B58 DD 66 FB      [19] 1348 	ld	h,-5 (ix)
   6B5B 36 01         [10] 1349 	ld	(hl),#0x01
                           1350 ;src/main.c:340: actual->direccion = M_izquierda;
   6B5D E1            [10] 1351 	pop	hl
   6B5E E5            [11] 1352 	push	hl
   6B5F 36 01         [10] 1353 	ld	(hl),#0x01
                           1354 ;src/main.c:341: actual->x = prota.x - G_KNIFEX_0_W;
   6B61 3A 7D 64      [13] 1355 	ld	a, (#_prota + 0)
   6B64 C6 FC         [ 7] 1356 	add	a,#0xFC
   6B66 02            [ 7] 1357 	ld	(bc),a
                           1358 ;src/main.c:342: actual->y = prota.y + G_HERO_H /2;
   6B67 3A 7E 64      [13] 1359 	ld	a, (#(_prota + 0x0001) + 0)
   6B6A C6 0B         [ 7] 1360 	add	a, #0x0B
   6B6C DD 6E FE      [19] 1361 	ld	l,-2 (ix)
   6B6F DD 66 FF      [19] 1362 	ld	h,-1 (ix)
   6B72 77            [ 7] 1363 	ld	(hl),a
                           1364 ;src/main.c:343: actual->sprite = g_knifeX_1;
   6B73 DD 6E F8      [19] 1365 	ld	l,-8 (ix)
   6B76 DD 66 F9      [19] 1366 	ld	h,-7 (ix)
   6B79 36 D0         [10] 1367 	ld	(hl),#<(_g_knifeX_1)
   6B7B 23            [ 6] 1368 	inc	hl
   6B7C 36 54         [10] 1369 	ld	(hl),#>(_g_knifeX_1)
                           1370 ;src/main.c:344: actual->eje = E_X;
   6B7E DD 6E FC      [19] 1371 	ld	l,-4 (ix)
   6B81 DD 66 FD      [19] 1372 	ld	h,-3 (ix)
   6B84 36 00         [10] 1373 	ld	(hl),#0x00
                           1374 ;src/main.c:345: dibujarCuchillo(actual);
   6B86 C5            [11] 1375 	push	bc
   6B87 CD 4D 69      [17] 1376 	call	_dibujarCuchillo
   6B8A F1            [10] 1377 	pop	af
   6B8B C3 3B 6C      [10] 1378 	jp	00127$
   6B8E                    1379 00119$:
                           1380 ;src/main.c:348: else if(prota.mira == M_abajo){
   6B8E 7B            [ 4] 1381 	ld	a,e
   6B8F D6 03         [ 7] 1382 	sub	a, #0x03
   6B91 20 54         [12] 1383 	jr	NZ,00116$
                           1384 ;src/main.c:350: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   6B93 3A 7E 64      [13] 1385 	ld	a, (#(_prota + 0x0001) + 0)
   6B96 C6 1F         [ 7] 1386 	add	a, #0x1F
   6B98 57            [ 4] 1387 	ld	d,a
   6B99 3A 7D 64      [13] 1388 	ld	a, (#_prota + 0)
   6B9C C6 03         [ 7] 1389 	add	a, #0x03
   6B9E C5            [11] 1390 	push	bc
   6B9F D5            [11] 1391 	push	de
   6BA0 33            [ 6] 1392 	inc	sp
   6BA1 F5            [11] 1393 	push	af
   6BA2 33            [ 6] 1394 	inc	sp
   6BA3 CD 9B 65      [17] 1395 	call	_getTilePtr
   6BA6 F1            [10] 1396 	pop	af
   6BA7 C1            [10] 1397 	pop	bc
   6BA8 5E            [ 7] 1398 	ld	e,(hl)
   6BA9 3E 02         [ 7] 1399 	ld	a,#0x02
   6BAB 93            [ 4] 1400 	sub	a, e
   6BAC DA 3B 6C      [10] 1401 	jp	C,00127$
                           1402 ;src/main.c:351: actual->lanzado = SI;
   6BAF DD 6E FA      [19] 1403 	ld	l,-6 (ix)
   6BB2 DD 66 FB      [19] 1404 	ld	h,-5 (ix)
   6BB5 36 01         [10] 1405 	ld	(hl),#0x01
                           1406 ;src/main.c:352: actual->direccion = M_abajo;
   6BB7 E1            [10] 1407 	pop	hl
   6BB8 E5            [11] 1408 	push	hl
   6BB9 36 03         [10] 1409 	ld	(hl),#0x03
                           1410 ;src/main.c:353: actual->x = prota.x + G_HERO_W / 2;
   6BBB 3A 7D 64      [13] 1411 	ld	a, (#_prota + 0)
   6BBE C6 03         [ 7] 1412 	add	a, #0x03
   6BC0 02            [ 7] 1413 	ld	(bc),a
                           1414 ;src/main.c:354: actual->y = prota.y + G_HERO_H;
   6BC1 3A 7E 64      [13] 1415 	ld	a, (#(_prota + 0x0001) + 0)
   6BC4 C6 16         [ 7] 1416 	add	a, #0x16
   6BC6 DD 6E FE      [19] 1417 	ld	l,-2 (ix)
   6BC9 DD 66 FF      [19] 1418 	ld	h,-1 (ix)
   6BCC 77            [ 7] 1419 	ld	(hl),a
                           1420 ;src/main.c:355: actual->sprite = g_knifeY_0;
   6BCD DD 6E F8      [19] 1421 	ld	l,-8 (ix)
   6BD0 DD 66 F9      [19] 1422 	ld	h,-7 (ix)
   6BD3 36 A0         [10] 1423 	ld	(hl),#<(_g_knifeY_0)
   6BD5 23            [ 6] 1424 	inc	hl
   6BD6 36 54         [10] 1425 	ld	(hl),#>(_g_knifeY_0)
                           1426 ;src/main.c:356: actual->eje = E_Y;
   6BD8 DD 6E FC      [19] 1427 	ld	l,-4 (ix)
   6BDB DD 66 FD      [19] 1428 	ld	h,-3 (ix)
   6BDE 36 01         [10] 1429 	ld	(hl),#0x01
                           1430 ;src/main.c:357: dibujarCuchillo(actual);
   6BE0 C5            [11] 1431 	push	bc
   6BE1 CD 4D 69      [17] 1432 	call	_dibujarCuchillo
   6BE4 F1            [10] 1433 	pop	af
   6BE5 18 54         [12] 1434 	jr	00127$
   6BE7                    1435 00116$:
                           1436 ;src/main.c:360: else if(prota.mira == M_arriba){
   6BE7 7B            [ 4] 1437 	ld	a,e
   6BE8 D6 02         [ 7] 1438 	sub	a, #0x02
   6BEA 20 4F         [12] 1439 	jr	NZ,00127$
                           1440 ;src/main.c:361: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   6BEC 3A 7E 64      [13] 1441 	ld	a, (#(_prota + 0x0001) + 0)
   6BEF C6 F7         [ 7] 1442 	add	a,#0xF7
   6BF1 57            [ 4] 1443 	ld	d,a
   6BF2 3A 7D 64      [13] 1444 	ld	a, (#_prota + 0)
   6BF5 C6 03         [ 7] 1445 	add	a, #0x03
   6BF7 C5            [11] 1446 	push	bc
   6BF8 D5            [11] 1447 	push	de
   6BF9 33            [ 6] 1448 	inc	sp
   6BFA F5            [11] 1449 	push	af
   6BFB 33            [ 6] 1450 	inc	sp
   6BFC CD 9B 65      [17] 1451 	call	_getTilePtr
   6BFF F1            [10] 1452 	pop	af
   6C00 C1            [10] 1453 	pop	bc
   6C01 5E            [ 7] 1454 	ld	e,(hl)
   6C02 3E 02         [ 7] 1455 	ld	a,#0x02
   6C04 93            [ 4] 1456 	sub	a, e
   6C05 38 34         [12] 1457 	jr	C,00127$
                           1458 ;src/main.c:362: actual->lanzado = SI;
   6C07 DD 6E FA      [19] 1459 	ld	l,-6 (ix)
   6C0A DD 66 FB      [19] 1460 	ld	h,-5 (ix)
   6C0D 36 01         [10] 1461 	ld	(hl),#0x01
                           1462 ;src/main.c:363: actual->direccion = M_arriba;
   6C0F E1            [10] 1463 	pop	hl
   6C10 E5            [11] 1464 	push	hl
   6C11 36 02         [10] 1465 	ld	(hl),#0x02
                           1466 ;src/main.c:364: actual->x = prota.x + G_HERO_W / 2;
   6C13 3A 7D 64      [13] 1467 	ld	a, (#_prota + 0)
   6C16 C6 03         [ 7] 1468 	add	a, #0x03
   6C18 02            [ 7] 1469 	ld	(bc),a
                           1470 ;src/main.c:365: actual->y = prota.y;
   6C19 3A 7E 64      [13] 1471 	ld	a, (#(_prota + 0x0001) + 0)
   6C1C DD 6E FE      [19] 1472 	ld	l,-2 (ix)
   6C1F DD 66 FF      [19] 1473 	ld	h,-1 (ix)
   6C22 77            [ 7] 1474 	ld	(hl),a
                           1475 ;src/main.c:366: actual->sprite = g_knifeY_1;
   6C23 DD 6E F8      [19] 1476 	ld	l,-8 (ix)
   6C26 DD 66 F9      [19] 1477 	ld	h,-7 (ix)
   6C29 36 B0         [10] 1478 	ld	(hl),#<(_g_knifeY_1)
   6C2B 23            [ 6] 1479 	inc	hl
   6C2C 36 54         [10] 1480 	ld	(hl),#>(_g_knifeY_1)
                           1481 ;src/main.c:367: actual->eje = E_Y;
   6C2E DD 6E FC      [19] 1482 	ld	l,-4 (ix)
   6C31 DD 66 FD      [19] 1483 	ld	h,-3 (ix)
   6C34 36 01         [10] 1484 	ld	(hl),#0x01
                           1485 ;src/main.c:368: dibujarCuchillo(actual);
   6C36 C5            [11] 1486 	push	bc
   6C37 CD 4D 69      [17] 1487 	call	_dibujarCuchillo
   6C3A F1            [10] 1488 	pop	af
   6C3B                    1489 00127$:
   6C3B DD F9         [10] 1490 	ld	sp, ix
   6C3D DD E1         [14] 1491 	pop	ix
   6C3F C9            [10] 1492 	ret
                           1493 ;src/main.c:374: void comprobarTeclado() {
                           1494 ;	---------------------------------
                           1495 ; Function comprobarTeclado
                           1496 ; ---------------------------------
   6C40                    1497 _comprobarTeclado::
                           1498 ;src/main.c:375: cpct_scanKeyboard_if();
   6C40 CD 21 5B      [17] 1499 	call	_cpct_scanKeyboard_if
                           1500 ;src/main.c:377: if (cpct_isAnyKeyPressed()) {
   6C43 CD 14 5B      [17] 1501 	call	_cpct_isAnyKeyPressed
   6C46 7D            [ 4] 1502 	ld	a,l
   6C47 B7            [ 4] 1503 	or	a, a
   6C48 C8            [11] 1504 	ret	Z
                           1505 ;src/main.c:378: if (cpct_isKeyPressed(Key_CursorLeft))
   6C49 21 01 01      [10] 1506 	ld	hl,#0x0101
   6C4C CD 2F 59      [17] 1507 	call	_cpct_isKeyPressed
   6C4F 7D            [ 4] 1508 	ld	a,l
   6C50 B7            [ 4] 1509 	or	a, a
                           1510 ;src/main.c:379: moverIzquierda();
   6C51 C2 9A 68      [10] 1511 	jp	NZ,_moverIzquierda
                           1512 ;src/main.c:380: else if (cpct_isKeyPressed(Key_CursorRight))
   6C54 21 00 02      [10] 1513 	ld	hl,#0x0200
   6C57 CD 2F 59      [17] 1514 	call	_cpct_isKeyPressed
   6C5A 7D            [ 4] 1515 	ld	a,l
   6C5B B7            [ 4] 1516 	or	a, a
                           1517 ;src/main.c:381: moverDerecha();
   6C5C C2 BF 68      [10] 1518 	jp	NZ,_moverDerecha
                           1519 ;src/main.c:382: else if (cpct_isKeyPressed(Key_CursorUp))
   6C5F 21 00 01      [10] 1520 	ld	hl,#0x0100
   6C62 CD 2F 59      [17] 1521 	call	_cpct_isKeyPressed
   6C65 7D            [ 4] 1522 	ld	a,l
   6C66 B7            [ 4] 1523 	or	a, a
                           1524 ;src/main.c:383: moverArriba();
   6C67 C2 05 69      [10] 1525 	jp	NZ,_moverArriba
                           1526 ;src/main.c:384: else if (cpct_isKeyPressed(Key_CursorDown))
   6C6A 21 00 04      [10] 1527 	ld	hl,#0x0400
   6C6D CD 2F 59      [17] 1528 	call	_cpct_isKeyPressed
   6C70 7D            [ 4] 1529 	ld	a,l
   6C71 B7            [ 4] 1530 	or	a, a
                           1531 ;src/main.c:385: moverAbajo();
   6C72 C2 29 69      [10] 1532 	jp	NZ,_moverAbajo
                           1533 ;src/main.c:386: else if (cpct_isKeyPressed(Key_Space))
   6C75 21 05 80      [10] 1534 	ld	hl,#0x8005
   6C78 CD 2F 59      [17] 1535 	call	_cpct_isKeyPressed
   6C7B 7D            [ 4] 1536 	ld	a,l
   6C7C B7            [ 4] 1537 	or	a, a
   6C7D C8            [11] 1538 	ret	Z
                           1539 ;src/main.c:387: lanzarCuchillo();
   6C7E C3 72 6A      [10] 1540 	jp  _lanzarCuchillo
                           1541 ;src/main.c:393: void moverCuchillo(){
                           1542 ;	---------------------------------
                           1543 ; Function moverCuchillo
                           1544 ; ---------------------------------
   6C81                    1545 _moverCuchillo::
   6C81 DD E5         [15] 1546 	push	ix
   6C83 DD 21 00 00   [14] 1547 	ld	ix,#0
   6C87 DD 39         [15] 1548 	add	ix,sp
   6C89 F5            [11] 1549 	push	af
   6C8A F5            [11] 1550 	push	af
                           1551 ;src/main.c:395: u8 i = 10 + 1;
   6C8B DD 36 FC 0B   [19] 1552 	ld	-4 (ix),#0x0B
                           1553 ;src/main.c:396: TKnife* actual = cu;
   6C8F 01 85 64      [10] 1554 	ld	bc,#_cu+0
                           1555 ;src/main.c:398: while(--i){
   6C92                    1556 00126$:
   6C92 DD 35 FC      [23] 1557 	dec	-4 (ix)
   6C95 DD 7E FC      [19] 1558 	ld	a, -4 (ix)
   6C98 B7            [ 4] 1559 	or	a, a
   6C99 CA B8 6D      [10] 1560 	jp	Z,00129$
                           1561 ;src/main.c:399: if(actual->lanzado){
   6C9C 21 06 00      [10] 1562 	ld	hl,#0x0006
   6C9F 09            [11] 1563 	add	hl,bc
   6CA0 DD 75 FD      [19] 1564 	ld	-3 (ix),l
   6CA3 DD 74 FE      [19] 1565 	ld	-2 (ix),h
   6CA6 DD 6E FD      [19] 1566 	ld	l,-3 (ix)
   6CA9 DD 66 FE      [19] 1567 	ld	h,-2 (ix)
   6CAC 7E            [ 7] 1568 	ld	a,(hl)
   6CAD B7            [ 4] 1569 	or	a, a
   6CAE CA AF 6D      [10] 1570 	jp	Z,00125$
                           1571 ;src/main.c:400: if(actual->direccion == M_derecha){
   6CB1 C5            [11] 1572 	push	bc
   6CB2 FD E1         [14] 1573 	pop	iy
   6CB4 FD 6E 07      [19] 1574 	ld	l,7 (iy)
                           1575 ;src/main.c:402: if( *getTilePtr(actual->x + G_KNIFEX_0_W + 1, actual->y) <= 2){
   6CB7 59            [ 4] 1576 	ld	e, c
   6CB8 50            [ 4] 1577 	ld	d, b
   6CB9 13            [ 6] 1578 	inc	de
                           1579 ;src/main.c:400: if(actual->direccion == M_derecha){
   6CBA 7D            [ 4] 1580 	ld	a,l
   6CBB B7            [ 4] 1581 	or	a, a
   6CBC 20 34         [12] 1582 	jr	NZ,00122$
                           1583 ;src/main.c:402: if( *getTilePtr(actual->x + G_KNIFEX_0_W + 1, actual->y) <= 2){
   6CBE 1A            [ 7] 1584 	ld	a,(de)
   6CBF 57            [ 4] 1585 	ld	d,a
   6CC0 0A            [ 7] 1586 	ld	a,(bc)
   6CC1 C6 05         [ 7] 1587 	add	a, #0x05
   6CC3 C5            [11] 1588 	push	bc
   6CC4 D5            [11] 1589 	push	de
   6CC5 33            [ 6] 1590 	inc	sp
   6CC6 F5            [11] 1591 	push	af
   6CC7 33            [ 6] 1592 	inc	sp
   6CC8 CD 9B 65      [17] 1593 	call	_getTilePtr
   6CCB F1            [10] 1594 	pop	af
   6CCC C1            [10] 1595 	pop	bc
   6CCD 5E            [ 7] 1596 	ld	e,(hl)
   6CCE 3E 02         [ 7] 1597 	ld	a,#0x02
   6CD0 93            [ 4] 1598 	sub	a, e
   6CD1 38 0D         [12] 1599 	jr	C,00102$
                           1600 ;src/main.c:403: actual->x++;
   6CD3 0A            [ 7] 1601 	ld	a,(bc)
   6CD4 3C            [ 4] 1602 	inc	a
   6CD5 02            [ 7] 1603 	ld	(bc),a
                           1604 ;src/main.c:405: redibujarCuchillo(actual);
   6CD6 C5            [11] 1605 	push	bc
   6CD7 C5            [11] 1606 	push	bc
   6CD8 CD 41 6A      [17] 1607 	call	_redibujarCuchillo
   6CDB F1            [10] 1608 	pop	af
   6CDC C1            [10] 1609 	pop	bc
   6CDD C3 AF 6D      [10] 1610 	jp	00125$
   6CE0                    1611 00102$:
                           1612 ;src/main.c:408: borrarCuchillo(actual);
   6CE0 C5            [11] 1613 	push	bc
   6CE1 C5            [11] 1614 	push	bc
   6CE2 CD D7 69      [17] 1615 	call	_borrarCuchillo
   6CE5 F1            [10] 1616 	pop	af
   6CE6 C1            [10] 1617 	pop	bc
                           1618 ;src/main.c:409: actual->lanzado = NO;
   6CE7 DD 6E FD      [19] 1619 	ld	l,-3 (ix)
   6CEA DD 66 FE      [19] 1620 	ld	h,-2 (ix)
   6CED 36 00         [10] 1621 	ld	(hl),#0x00
   6CEF C3 AF 6D      [10] 1622 	jp	00125$
   6CF2                    1623 00122$:
                           1624 ;src/main.c:412: else if(actual->direccion == M_izquierda){
   6CF2 7D            [ 4] 1625 	ld	a,l
   6CF3 3D            [ 4] 1626 	dec	a
   6CF4 20 35         [12] 1627 	jr	NZ,00119$
                           1628 ;src/main.c:413: if(*getTilePtr(actual->x - 1, actual->y) <= 2){
   6CF6 1A            [ 7] 1629 	ld	a,(de)
   6CF7 57            [ 4] 1630 	ld	d,a
   6CF8 0A            [ 7] 1631 	ld	a,(bc)
   6CF9 C6 FF         [ 7] 1632 	add	a,#0xFF
   6CFB C5            [11] 1633 	push	bc
   6CFC D5            [11] 1634 	push	de
   6CFD 33            [ 6] 1635 	inc	sp
   6CFE F5            [11] 1636 	push	af
   6CFF 33            [ 6] 1637 	inc	sp
   6D00 CD 9B 65      [17] 1638 	call	_getTilePtr
   6D03 F1            [10] 1639 	pop	af
   6D04 C1            [10] 1640 	pop	bc
   6D05 5E            [ 7] 1641 	ld	e,(hl)
   6D06 3E 02         [ 7] 1642 	ld	a,#0x02
   6D08 93            [ 4] 1643 	sub	a, e
   6D09 38 0E         [12] 1644 	jr	C,00105$
                           1645 ;src/main.c:414: actual->x--;
   6D0B 0A            [ 7] 1646 	ld	a,(bc)
   6D0C C6 FF         [ 7] 1647 	add	a,#0xFF
   6D0E 02            [ 7] 1648 	ld	(bc),a
                           1649 ;src/main.c:416: redibujarCuchillo(actual);
   6D0F C5            [11] 1650 	push	bc
   6D10 C5            [11] 1651 	push	bc
   6D11 CD 41 6A      [17] 1652 	call	_redibujarCuchillo
   6D14 F1            [10] 1653 	pop	af
   6D15 C1            [10] 1654 	pop	bc
   6D16 C3 AF 6D      [10] 1655 	jp	00125$
   6D19                    1656 00105$:
                           1657 ;src/main.c:418: borrarCuchillo(actual);
   6D19 C5            [11] 1658 	push	bc
   6D1A C5            [11] 1659 	push	bc
   6D1B CD D7 69      [17] 1660 	call	_borrarCuchillo
   6D1E F1            [10] 1661 	pop	af
   6D1F C1            [10] 1662 	pop	bc
                           1663 ;src/main.c:419: actual->lanzado = NO;
   6D20 DD 6E FD      [19] 1664 	ld	l,-3 (ix)
   6D23 DD 66 FE      [19] 1665 	ld	h,-2 (ix)
   6D26 36 00         [10] 1666 	ld	(hl),#0x00
   6D28 C3 AF 6D      [10] 1667 	jp	00125$
   6D2B                    1668 00119$:
                           1669 ;src/main.c:422: else if(actual->direccion == M_abajo){
   6D2B 7D            [ 4] 1670 	ld	a,l
   6D2C D6 03         [ 7] 1671 	sub	a, #0x03
   6D2E 20 3D         [12] 1672 	jr	NZ,00116$
                           1673 ;src/main.c:423: if(*getTilePtr(actual->x, actual->y + G_KNIFEY_0_H + 2) <= 2){
   6D30 1A            [ 7] 1674 	ld	a,(de)
   6D31 C6 0A         [ 7] 1675 	add	a, #0x0A
   6D33 F5            [11] 1676 	push	af
   6D34 0A            [ 7] 1677 	ld	a,(bc)
   6D35 DD 77 FF      [19] 1678 	ld	-1 (ix),a
   6D38 F1            [10] 1679 	pop	af
   6D39 C5            [11] 1680 	push	bc
   6D3A D5            [11] 1681 	push	de
   6D3B F5            [11] 1682 	push	af
   6D3C 33            [ 6] 1683 	inc	sp
   6D3D DD 7E FF      [19] 1684 	ld	a,-1 (ix)
   6D40 F5            [11] 1685 	push	af
   6D41 33            [ 6] 1686 	inc	sp
   6D42 CD 9B 65      [17] 1687 	call	_getTilePtr
   6D45 F1            [10] 1688 	pop	af
   6D46 D1            [10] 1689 	pop	de
   6D47 C1            [10] 1690 	pop	bc
   6D48 6E            [ 7] 1691 	ld	l,(hl)
   6D49 3E 02         [ 7] 1692 	ld	a,#0x02
   6D4B 95            [ 4] 1693 	sub	a, l
   6D4C 38 0E         [12] 1694 	jr	C,00108$
                           1695 ;src/main.c:424: actual->y++;
   6D4E 1A            [ 7] 1696 	ld	a,(de)
   6D4F 3C            [ 4] 1697 	inc	a
   6D50 12            [ 7] 1698 	ld	(de),a
                           1699 ;src/main.c:425: actual->y++;
   6D51 3C            [ 4] 1700 	inc	a
   6D52 12            [ 7] 1701 	ld	(de),a
                           1702 ;src/main.c:426: redibujarCuchillo(actual);
   6D53 C5            [11] 1703 	push	bc
   6D54 C5            [11] 1704 	push	bc
   6D55 CD 41 6A      [17] 1705 	call	_redibujarCuchillo
   6D58 F1            [10] 1706 	pop	af
   6D59 C1            [10] 1707 	pop	bc
   6D5A 18 53         [12] 1708 	jr	00125$
   6D5C                    1709 00108$:
                           1710 ;src/main.c:430: borrarCuchillo(actual);
   6D5C C5            [11] 1711 	push	bc
   6D5D C5            [11] 1712 	push	bc
   6D5E CD D7 69      [17] 1713 	call	_borrarCuchillo
   6D61 F1            [10] 1714 	pop	af
   6D62 C1            [10] 1715 	pop	bc
                           1716 ;src/main.c:431: actual->lanzado = NO;
   6D63 DD 6E FD      [19] 1717 	ld	l,-3 (ix)
   6D66 DD 66 FE      [19] 1718 	ld	h,-2 (ix)
   6D69 36 00         [10] 1719 	ld	(hl),#0x00
   6D6B 18 42         [12] 1720 	jr	00125$
   6D6D                    1721 00116$:
                           1722 ;src/main.c:434: else if(actual->direccion == M_arriba){
   6D6D 7D            [ 4] 1723 	ld	a,l
   6D6E D6 02         [ 7] 1724 	sub	a, #0x02
   6D70 20 3D         [12] 1725 	jr	NZ,00125$
                           1726 ;src/main.c:435: if(*getTilePtr(actual->x, actual->y - 2) <= 2){
   6D72 1A            [ 7] 1727 	ld	a,(de)
   6D73 C6 FE         [ 7] 1728 	add	a,#0xFE
   6D75 F5            [11] 1729 	push	af
   6D76 0A            [ 7] 1730 	ld	a,(bc)
   6D77 DD 77 FF      [19] 1731 	ld	-1 (ix),a
   6D7A F1            [10] 1732 	pop	af
   6D7B C5            [11] 1733 	push	bc
   6D7C D5            [11] 1734 	push	de
   6D7D F5            [11] 1735 	push	af
   6D7E 33            [ 6] 1736 	inc	sp
   6D7F DD 7E FF      [19] 1737 	ld	a,-1 (ix)
   6D82 F5            [11] 1738 	push	af
   6D83 33            [ 6] 1739 	inc	sp
   6D84 CD 9B 65      [17] 1740 	call	_getTilePtr
   6D87 F1            [10] 1741 	pop	af
   6D88 D1            [10] 1742 	pop	de
   6D89 C1            [10] 1743 	pop	bc
   6D8A 6E            [ 7] 1744 	ld	l,(hl)
   6D8B 3E 02         [ 7] 1745 	ld	a,#0x02
   6D8D 95            [ 4] 1746 	sub	a, l
   6D8E 38 10         [12] 1747 	jr	C,00111$
                           1748 ;src/main.c:436: actual->y--;
   6D90 1A            [ 7] 1749 	ld	a,(de)
   6D91 C6 FF         [ 7] 1750 	add	a,#0xFF
   6D93 12            [ 7] 1751 	ld	(de),a
                           1752 ;src/main.c:437: actual->y--;
   6D94 C6 FF         [ 7] 1753 	add	a,#0xFF
   6D96 12            [ 7] 1754 	ld	(de),a
                           1755 ;src/main.c:438: redibujarCuchillo(actual);
   6D97 C5            [11] 1756 	push	bc
   6D98 C5            [11] 1757 	push	bc
   6D99 CD 41 6A      [17] 1758 	call	_redibujarCuchillo
   6D9C F1            [10] 1759 	pop	af
   6D9D C1            [10] 1760 	pop	bc
   6D9E 18 0F         [12] 1761 	jr	00125$
   6DA0                    1762 00111$:
                           1763 ;src/main.c:441: borrarCuchillo(actual);
   6DA0 C5            [11] 1764 	push	bc
   6DA1 C5            [11] 1765 	push	bc
   6DA2 CD D7 69      [17] 1766 	call	_borrarCuchillo
   6DA5 F1            [10] 1767 	pop	af
   6DA6 C1            [10] 1768 	pop	bc
                           1769 ;src/main.c:442: actual->lanzado = NO;
   6DA7 DD 6E FD      [19] 1770 	ld	l,-3 (ix)
   6DAA DD 66 FE      [19] 1771 	ld	h,-2 (ix)
   6DAD 36 00         [10] 1772 	ld	(hl),#0x00
   6DAF                    1773 00125$:
                           1774 ;src/main.c:446: ++actual;
   6DAF 21 09 00      [10] 1775 	ld	hl,#0x0009
   6DB2 09            [11] 1776 	add	hl,bc
   6DB3 4D            [ 4] 1777 	ld	c,l
   6DB4 44            [ 4] 1778 	ld	b,h
   6DB5 C3 92 6C      [10] 1779 	jp	00126$
   6DB8                    1780 00129$:
   6DB8 DD F9         [10] 1781 	ld	sp, ix
   6DBA DD E1         [14] 1782 	pop	ix
   6DBC C9            [10] 1783 	ret
                           1784 ;src/main.c:450: void menuFin(){
                           1785 ;	---------------------------------
                           1786 ; Function menuFin
                           1787 ; ---------------------------------
   6DBD                    1788 _menuFin::
                           1789 ;src/main.c:453: cpct_clearScreen(0);
   6DBD 21 00 40      [10] 1790 	ld	hl,#0x4000
   6DC0 E5            [11] 1791 	push	hl
   6DC1 AF            [ 4] 1792 	xor	a, a
   6DC2 F5            [11] 1793 	push	af
   6DC3 33            [ 6] 1794 	inc	sp
   6DC4 26 C0         [ 7] 1795 	ld	h, #0xC0
   6DC6 E5            [11] 1796 	push	hl
   6DC7 CD AF 5B      [17] 1797 	call	_cpct_memset
                           1798 ;src/main.c:455: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 12, 90); // centrado en horizontal y arriba en vertical
   6DCA 21 0C 5A      [10] 1799 	ld	hl,#0x5A0C
   6DCD E5            [11] 1800 	push	hl
   6DCE 21 00 C0      [10] 1801 	ld	hl,#0xC000
   6DD1 E5            [11] 1802 	push	hl
   6DD2 CD 18 64      [17] 1803 	call	_cpct_getScreenPtr
   6DD5 4D            [ 4] 1804 	ld	c,l
   6DD6 44            [ 4] 1805 	ld	b,h
                           1806 ;src/main.c:456: cpct_drawStringM0("FIN DE PARTIDA", memptr, 2, 3);
   6DD7 21 02 03      [10] 1807 	ld	hl,#0x0302
   6DDA E5            [11] 1808 	push	hl
   6DDB C5            [11] 1809 	push	bc
   6DDC 21 F6 6D      [10] 1810 	ld	hl,#___str_0
   6DDF E5            [11] 1811 	push	hl
   6DE0 CD A5 59      [17] 1812 	call	_cpct_drawStringM0
   6DE3 21 06 00      [10] 1813 	ld	hl,#6
   6DE6 39            [11] 1814 	add	hl,sp
   6DE7 F9            [ 6] 1815 	ld	sp,hl
                           1816 ;src/main.c:460: do{
   6DE8                    1817 00101$:
                           1818 ;src/main.c:461: cpct_scanKeyboard_f();   		
   6DE8 CD 3B 59      [17] 1819 	call	_cpct_scanKeyboard_f
                           1820 ;src/main.c:462: } while(!cpct_isKeyPressed(Key_I));   		
   6DEB 21 04 08      [10] 1821 	ld	hl,#0x0804
   6DEE CD 2F 59      [17] 1822 	call	_cpct_isKeyPressed
   6DF1 7D            [ 4] 1823 	ld	a,l
   6DF2 B7            [ 4] 1824 	or	a, a
   6DF3 28 F3         [12] 1825 	jr	Z,00101$
   6DF5 C9            [10] 1826 	ret
   6DF6                    1827 ___str_0:
   6DF6 46 49 4E 20 44 45  1828 	.ascii "FIN DE PARTIDA"
        20 50 41 52 54 49
        44 41
   6E04 00                 1829 	.db 0x00
                           1830 ;src/main.c:465: void menu(){
                           1831 ;	---------------------------------
                           1832 ; Function menu
                           1833 ; ---------------------------------
   6E05                    1834 _menu::
                           1835 ;src/main.c:468: cpct_clearScreen(0);
   6E05 21 00 40      [10] 1836 	ld	hl,#0x4000
   6E08 E5            [11] 1837 	push	hl
   6E09 AF            [ 4] 1838 	xor	a, a
   6E0A F5            [11] 1839 	push	af
   6E0B 33            [ 6] 1840 	inc	sp
   6E0C 26 C0         [ 7] 1841 	ld	h, #0xC0
   6E0E E5            [11] 1842 	push	hl
   6E0F CD AF 5B      [17] 1843 	call	_cpct_memset
                           1844 ;src/main.c:470: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 10); // centrado en horizontal y arriba en vertical
   6E12 21 20 0A      [10] 1845 	ld	hl,#0x0A20
   6E15 E5            [11] 1846 	push	hl
   6E16 21 00 C0      [10] 1847 	ld	hl,#0xC000
   6E19 E5            [11] 1848 	push	hl
   6E1A CD 18 64      [17] 1849 	call	_cpct_getScreenPtr
   6E1D 4D            [ 4] 1850 	ld	c,l
   6E1E 44            [ 4] 1851 	ld	b,h
                           1852 ;src/main.c:471: cpct_drawStringM0("MENU", memptr, 2, 3);
   6E1F 21 02 03      [10] 1853 	ld	hl,#0x0302
   6E22 E5            [11] 1854 	push	hl
   6E23 C5            [11] 1855 	push	bc
   6E24 21 5C 6E      [10] 1856 	ld	hl,#___str_1
   6E27 E5            [11] 1857 	push	hl
   6E28 CD A5 59      [17] 1858 	call	_cpct_drawStringM0
   6E2B 21 06 00      [10] 1859 	ld	hl,#6
   6E2E 39            [11] 1860 	add	hl,sp
   6E2F F9            [ 6] 1861 	ld	sp,hl
                           1862 ;src/main.c:473: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 180); // centrado en horizontal y abajo en vertical
   6E30 21 1A B4      [10] 1863 	ld	hl,#0xB41A
   6E33 E5            [11] 1864 	push	hl
   6E34 21 00 C0      [10] 1865 	ld	hl,#0xC000
   6E37 E5            [11] 1866 	push	hl
   6E38 CD 18 64      [17] 1867 	call	_cpct_getScreenPtr
   6E3B 4D            [ 4] 1868 	ld	c,l
   6E3C 44            [ 4] 1869 	ld	b,h
                           1870 ;src/main.c:474: cpct_drawStringM0("PULSA I", memptr, 1, 0);
   6E3D 21 01 00      [10] 1871 	ld	hl,#0x0001
   6E40 E5            [11] 1872 	push	hl
   6E41 C5            [11] 1873 	push	bc
   6E42 21 61 6E      [10] 1874 	ld	hl,#___str_2
   6E45 E5            [11] 1875 	push	hl
   6E46 CD A5 59      [17] 1876 	call	_cpct_drawStringM0
   6E49 21 06 00      [10] 1877 	ld	hl,#6
   6E4C 39            [11] 1878 	add	hl,sp
   6E4D F9            [ 6] 1879 	ld	sp,hl
                           1880 ;src/main.c:477: do{
   6E4E                    1881 00101$:
                           1882 ;src/main.c:478: cpct_scanKeyboard_f();   		
   6E4E CD 3B 59      [17] 1883 	call	_cpct_scanKeyboard_f
                           1884 ;src/main.c:479: } while(!cpct_isKeyPressed(Key_I));   		
   6E51 21 04 08      [10] 1885 	ld	hl,#0x0804
   6E54 CD 2F 59      [17] 1886 	call	_cpct_isKeyPressed
   6E57 7D            [ 4] 1887 	ld	a,l
   6E58 B7            [ 4] 1888 	or	a, a
   6E59 28 F3         [12] 1889 	jr	Z,00101$
   6E5B C9            [10] 1890 	ret
   6E5C                    1891 ___str_1:
   6E5C 4D 45 4E 55        1892 	.ascii "MENU"
   6E60 00                 1893 	.db 0x00
   6E61                    1894 ___str_2:
   6E61 50 55 4C 53 41 20  1895 	.ascii "PULSA I"
        49
   6E68 00                 1896 	.db 0x00
                           1897 ;src/main.c:483: void inicializar() {
                           1898 ;	---------------------------------
                           1899 ; Function inicializar
                           1900 ; ---------------------------------
   6E69                    1901 _inicializar::
                           1902 ;src/main.c:486: TKnife* actual = cu;
                           1903 ;src/main.c:488: cpct_disableFirmware();
   6E69 CD E6 63      [17] 1904 	call	_cpct_disableFirmware
                           1905 ;src/main.c:489: cpct_setVideoMode(0);
   6E6C 2E 00         [ 7] 1906 	ld	l,#0x00
   6E6E CD 91 5B      [17] 1907 	call	_cpct_setVideoMode
                           1908 ;src/main.c:491: cpct_setPalette(g_palette, 16);
   6E71 21 10 00      [10] 1909 	ld	hl,#0x0010
   6E74 E5            [11] 1910 	push	hl
   6E75 21 CE 57      [10] 1911 	ld	hl,#_g_palette
   6E78 E5            [11] 1912 	push	hl
   6E79 CD 18 59      [17] 1913 	call	_cpct_setPalette
                           1914 ;src/main.c:492: cpct_akp_musicInit(G_song);
   6E7C 21 00 3F      [10] 1915 	ld	hl,#_G_song
   6E7F E5            [11] 1916 	push	hl
   6E80 CD C2 62      [17] 1917 	call	_cpct_akp_musicInit
   6E83 F1            [10] 1918 	pop	af
                           1919 ;src/main.c:493: num_mapa = 0;
   6E84 21 E1 64      [10] 1920 	ld	hl,#_num_mapa + 0
   6E87 36 00         [10] 1921 	ld	(hl), #0x00
                           1922 ;src/main.c:494: mapa = mapas[num_mapa];
   6E89 21 F8 64      [10] 1923 	ld	hl, #_mapas + 0
   6E8C 7E            [ 7] 1924 	ld	a,(hl)
   6E8D FD 21 DF 64   [14] 1925 	ld	iy,#_mapa
   6E91 FD 77 00      [19] 1926 	ld	0 (iy),a
   6E94 23            [ 6] 1927 	inc	hl
   6E95 7E            [ 7] 1928 	ld	a,(hl)
   6E96 32 E0 64      [13] 1929 	ld	(#_mapa + 1),a
                           1930 ;src/main.c:495: cpct_etm_setTileset2x4(g_tileset);
   6E99 21 E0 54      [10] 1931 	ld	hl,#_g_tileset
   6E9C CD 58 5A      [17] 1932 	call	_cpct_etm_setTileset2x4
                           1933 ;src/main.c:496: dibujarMapa();
   6E9F CD E2 64      [17] 1934 	call	_dibujarMapa
                           1935 ;src/main.c:499: prota.x = prota.px = 4;
   6EA2 21 7F 64      [10] 1936 	ld	hl,#(_prota + 0x0002)
   6EA5 36 04         [10] 1937 	ld	(hl),#0x04
   6EA7 21 7D 64      [10] 1938 	ld	hl,#_prota
   6EAA 36 04         [10] 1939 	ld	(hl),#0x04
                           1940 ;src/main.c:500: prota.y = prota.py = 80;
   6EAC 21 80 64      [10] 1941 	ld	hl,#(_prota + 0x0003)
   6EAF 36 50         [10] 1942 	ld	(hl),#0x50
   6EB1 21 7E 64      [10] 1943 	ld	hl,#(_prota + 0x0001)
   6EB4 36 50         [10] 1944 	ld	(hl),#0x50
                           1945 ;src/main.c:501: prota.mover  = NO;
   6EB6 21 83 64      [10] 1946 	ld	hl,#(_prota + 0x0006)
   6EB9 36 00         [10] 1947 	ld	(hl),#0x00
                           1948 ;src/main.c:502: prota.mira=M_derecha;
   6EBB 21 84 64      [10] 1949 	ld	hl,#(_prota + 0x0007)
   6EBE 36 00         [10] 1950 	ld	(hl),#0x00
                           1951 ;src/main.c:503: prota.sprite = g_hero;
   6EC0 21 DE 57      [10] 1952 	ld	hl,#_g_hero
   6EC3 22 81 64      [16] 1953 	ld	((_prota + 0x0004)), hl
                           1954 ;src/main.c:505: enemy.x = enemy.px = 67;
   6EC6 21 77 64      [10] 1955 	ld	hl,#(_enemy + 0x0002)
   6EC9 36 43         [10] 1956 	ld	(hl),#0x43
   6ECB 21 75 64      [10] 1957 	ld	hl,#_enemy
   6ECE 36 43         [10] 1958 	ld	(hl),#0x43
                           1959 ;src/main.c:506: enemy.y = enemy.py = 84;
   6ED0 21 78 64      [10] 1960 	ld	hl,#(_enemy + 0x0003)
   6ED3 36 54         [10] 1961 	ld	(hl),#0x54
   6ED5 21 76 64      [10] 1962 	ld	hl,#(_enemy + 0x0001)
   6ED8 36 54         [10] 1963 	ld	(hl),#0x54
                           1964 ;src/main.c:507: enemy.mover  = NO;
   6EDA 21 7B 64      [10] 1965 	ld	hl,#(_enemy + 0x0006)
   6EDD 36 00         [10] 1966 	ld	(hl),#0x00
                           1967 ;src/main.c:508: enemy.mira=M_abajo;
   6EDF 21 7C 64      [10] 1968 	ld	hl,#(_enemy + 0x0007)
   6EE2 36 03         [10] 1969 	ld	(hl),#0x03
                           1970 ;src/main.c:509: enemy.sprite = g_enemy;
   6EE4 21 A8 55      [10] 1971 	ld	hl,#_g_enemy
   6EE7 22 79 64      [16] 1972 	ld	((_enemy + 0x0004)), hl
                           1973 ;src/main.c:512: i = 10 + 1;
   6EEA 0E 0B         [ 7] 1974 	ld	c,#0x0B
                           1975 ;src/main.c:515: while(--i){
   6EEC 11 85 64      [10] 1976 	ld	de,#_cu
   6EEF                    1977 00101$:
   6EEF 41            [ 4] 1978 	ld	b,c
   6EF0 05            [ 4] 1979 	dec	b
   6EF1 78            [ 4] 1980 	ld	a,b
   6EF2 4F            [ 4] 1981 	ld	c,a
   6EF3 B7            [ 4] 1982 	or	a, a
   6EF4 28 25         [12] 1983 	jr	Z,00103$
                           1984 ;src/main.c:516: actual->x = actual->px = 0;
   6EF6 6B            [ 4] 1985 	ld	l, e
   6EF7 62            [ 4] 1986 	ld	h, d
   6EF8 23            [ 6] 1987 	inc	hl
   6EF9 23            [ 6] 1988 	inc	hl
   6EFA 36 00         [10] 1989 	ld	(hl),#0x00
   6EFC AF            [ 4] 1990 	xor	a, a
   6EFD 12            [ 7] 1991 	ld	(de),a
                           1992 ;src/main.c:517: actual->y = actual->py = 0;
   6EFE D5            [11] 1993 	push	de
   6EFF FD E1         [14] 1994 	pop	iy
   6F01 FD 23         [10] 1995 	inc	iy
   6F03 6B            [ 4] 1996 	ld	l, e
   6F04 62            [ 4] 1997 	ld	h, d
   6F05 23            [ 6] 1998 	inc	hl
   6F06 23            [ 6] 1999 	inc	hl
   6F07 23            [ 6] 2000 	inc	hl
   6F08 36 00         [10] 2001 	ld	(hl),#0x00
   6F0A FD 36 00 00   [19] 2002 	ld	0 (iy), #0x00
                           2003 ;src/main.c:518: actual->lanzado = 0;
   6F0E 21 06 00      [10] 2004 	ld	hl,#0x0006
   6F11 19            [11] 2005 	add	hl,de
   6F12 36 00         [10] 2006 	ld	(hl),#0x00
                           2007 ;src/main.c:519: ++actual;
   6F14 21 09 00      [10] 2008 	ld	hl,#0x0009
   6F17 19            [11] 2009 	add	hl,de
   6F18 EB            [ 4] 2010 	ex	de,hl
   6F19 18 D4         [12] 2011 	jr	00101$
   6F1B                    2012 00103$:
                           2013 ;src/main.c:523: dibujarProta();
   6F1B CD FE 64      [17] 2014 	call	_dibujarProta
                           2015 ;src/main.c:524: dibujarEnemigo();
   6F1E CD 05 67      [17] 2016 	call	_dibujarEnemigo
   6F21 C9            [10] 2017 	ret
                           2018 ;src/main.c:527: void main(void) {
                           2019 ;	---------------------------------
                           2020 ; Function main
                           2021 ; ---------------------------------
   6F22                    2022 _main::
                           2023 ;src/main.c:529: menu();
   6F22 CD 05 6E      [17] 2024 	call	_menu
                           2025 ;src/main.c:531: inicializar();
   6F25 CD 69 6E      [17] 2026 	call	_inicializar
                           2027 ;src/main.c:532: cpct_akp_musicPlay();
   6F28 CD BF 5B      [17] 2028 	call	_cpct_akp_musicPlay
                           2029 ;src/main.c:535: while (1) {
   6F2B                    2030 00104$:
                           2031 ;src/main.c:538: comprobarTeclado();
   6F2B CD 40 6C      [17] 2032 	call	_comprobarTeclado
                           2033 ;src/main.c:540: cpct_waitVSYNC();
   6F2E CD 89 5B      [17] 2034 	call	_cpct_waitVSYNC
                           2035 ;src/main.c:541: moverCuchillo();
   6F31 CD 81 6C      [17] 2036 	call	_moverCuchillo
                           2037 ;src/main.c:542: moverEnemigo();
   6F34 CD A2 67      [17] 2038 	call	_moverEnemigo
                           2039 ;src/main.c:544: if (prota.mover) {
   6F37 3A 83 64      [13] 2040 	ld	a, (#(_prota + 0x0006) + 0)
   6F3A B7            [ 4] 2041 	or	a, a
   6F3B 28 EE         [12] 2042 	jr	Z,00104$
                           2043 ;src/main.c:546: redibujarProta();
   6F3D CD 87 65      [17] 2044 	call	_redibujarProta
                           2045 ;src/main.c:547: prota.mover = NO;
   6F40 21 83 64      [10] 2046 	ld	hl,#(_prota + 0x0006)
   6F43 36 00         [10] 2047 	ld	(hl),#0x00
   6F45 18 E4         [12] 2048 	jr	00104$
                           2049 	.area _CODE
                           2050 	.area _INITIALIZER
                           2051 	.area _CABS (ABS)
   3F00                    2052 	.org 0x3F00
   3F00                    2053 _G_song:
   3F00 41                 2054 	.db #0x41	; 65	'A'
   3F01 54                 2055 	.db #0x54	; 84	'T'
   3F02 31                 2056 	.db #0x31	; 49	'1'
   3F03 30                 2057 	.db #0x30	; 48	'0'
   3F04 01                 2058 	.db #0x01	; 1
   3F05 40                 2059 	.db #0x40	; 64
   3F06 42                 2060 	.db #0x42	; 66	'B'
   3F07 0F                 2061 	.db #0x0F	; 15
   3F08 02                 2062 	.db #0x02	; 2
   3F09 06                 2063 	.db #0x06	; 6
   3F0A 1D                 2064 	.db #0x1D	; 29
   3F0B 00                 2065 	.db #0x00	; 0
   3F0C 10                 2066 	.db #0x10	; 16
   3F0D 40                 2067 	.db #0x40	; 64
   3F0E 19                 2068 	.db #0x19	; 25
   3F0F 40                 2069 	.db #0x40	; 64
   3F10 00                 2070 	.db #0x00	; 0
   3F11 00                 2071 	.db #0x00	; 0
   3F12 00                 2072 	.db #0x00	; 0
   3F13 00                 2073 	.db #0x00	; 0
   3F14 00                 2074 	.db #0x00	; 0
   3F15 00                 2075 	.db #0x00	; 0
   3F16 0D                 2076 	.db #0x0D	; 13
   3F17 12                 2077 	.db #0x12	; 18
   3F18 40                 2078 	.db #0x40	; 64
   3F19 01                 2079 	.db #0x01	; 1
   3F1A 00                 2080 	.db #0x00	; 0
   3F1B 7C                 2081 	.db #0x7C	; 124
   3F1C 18                 2082 	.db #0x18	; 24
   3F1D 78                 2083 	.db #0x78	; 120	'x'
   3F1E 0C                 2084 	.db #0x0C	; 12
   3F1F 34                 2085 	.db #0x34	; 52	'4'
   3F20 30                 2086 	.db #0x30	; 48	'0'
   3F21 2C                 2087 	.db #0x2C	; 44
   3F22 28                 2088 	.db #0x28	; 40
   3F23 24                 2089 	.db #0x24	; 36
   3F24 20                 2090 	.db #0x20	; 32
   3F25 1C                 2091 	.db #0x1C	; 28
   3F26 0D                 2092 	.db #0x0D	; 13
   3F27 25                 2093 	.db #0x25	; 37
   3F28 40                 2094 	.db #0x40	; 64
   3F29 20                 2095 	.db #0x20	; 32
   3F2A 00                 2096 	.db #0x00	; 0
   3F2B 00                 2097 	.db #0x00	; 0
   3F2C 00                 2098 	.db #0x00	; 0
   3F2D 39                 2099 	.db #0x39	; 57	'9'
   3F2E 40                 2100 	.db #0x40	; 64
   3F2F 00                 2101 	.db #0x00	; 0
   3F30 57                 2102 	.db #0x57	; 87	'W'
   3F31 40                 2103 	.db #0x40	; 64
   3F32 3B                 2104 	.db #0x3B	; 59
   3F33 40                 2105 	.db #0x40	; 64
   3F34 57                 2106 	.db #0x57	; 87	'W'
   3F35 40                 2107 	.db #0x40	; 64
   3F36 01                 2108 	.db #0x01	; 1
   3F37 2F                 2109 	.db #0x2F	; 47
   3F38 40                 2110 	.db #0x40	; 64
   3F39 19                 2111 	.db #0x19	; 25
   3F3A 00                 2112 	.db #0x00	; 0
   3F3B 76                 2113 	.db #0x76	; 118	'v'
   3F3C E1                 2114 	.db #0xE1	; 225
   3F3D 00                 2115 	.db #0x00	; 0
   3F3E 00                 2116 	.db #0x00	; 0
   3F3F 01                 2117 	.db #0x01	; 1
   3F40 04                 2118 	.db #0x04	; 4
   3F41 51                 2119 	.db #0x51	; 81	'Q'
   3F42 04                 2120 	.db #0x04	; 4
   3F43 37                 2121 	.db #0x37	; 55	'7'
   3F44 04                 2122 	.db #0x04	; 4
   3F45 4F                 2123 	.db #0x4F	; 79	'O'
   3F46 04                 2124 	.db #0x04	; 4
   3F47 37                 2125 	.db #0x37	; 55	'7'
   3F48 02                 2126 	.db #0x02	; 2
   3F49 4B                 2127 	.db #0x4B	; 75	'K'
   3F4A 02                 2128 	.db #0x02	; 2
   3F4B 37                 2129 	.db #0x37	; 55	'7'
   3F4C 04                 2130 	.db #0x04	; 4
   3F4D 4F                 2131 	.db #0x4F	; 79	'O'
   3F4E 04                 2132 	.db #0x04	; 4
   3F4F 37                 2133 	.db #0x37	; 55	'7'
   3F50 04                 2134 	.db #0x04	; 4
   3F51 4F                 2135 	.db #0x4F	; 79	'O'
   3F52 04                 2136 	.db #0x04	; 4
   3F53 37                 2137 	.db #0x37	; 55	'7'
   3F54 02                 2138 	.db #0x02	; 2
   3F55 4B                 2139 	.db #0x4B	; 75	'K'
   3F56 00                 2140 	.db #0x00	; 0
   3F57 42                 2141 	.db #0x42	; 66	'B'
   3F58 60                 2142 	.db #0x60	; 96
   3F59 00                 2143 	.db #0x00	; 0
   3F5A 42                 2144 	.db #0x42	; 66	'B'
   3F5B 80                 2145 	.db #0x80	; 128
   3F5C 00                 2146 	.db #0x00	; 0
   3F5D 00                 2147 	.db #0x00	; 0
   3F5E 42                 2148 	.db #0x42	; 66	'B'
   3F5F 00                 2149 	.db #0x00	; 0
   3F60 00                 2150 	.db #0x00	; 0
