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
   6866 D2 B1 6D      [10]  818 	jp	NC,_menuFin
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
                            834 ;src/main.c:237: enemy.x = prota.px = 2;
   6888 21 7F 64      [10]  835 	ld	hl,#(_prota + 0x0002)
   688B 36 02         [10]  836 	ld	(hl),#0x02
   688D 21 75 64      [10]  837 	ld	hl,#_enemy
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
                            883 ;src/main.c:257: if (!checkCollision(M_derecha)) {
   68C4 21 00 00      [10]  884 	ld	hl,#0x0000
   68C7 E5            [11]  885 	push	hl
   68C8 CD C3 65      [17]  886 	call	_checkCollision
   68CB F1            [10]  887 	pop	af
   68CC 4D            [ 4]  888 	ld	c,l
                            889 ;src/main.c:258: prota.x++;
   68CD 21 7D 64      [10]  890 	ld	hl, #_prota + 0
   68D0 5E            [ 7]  891 	ld	e,(hl)
                            892 ;src/main.c:257: if (!checkCollision(M_derecha)) {
   68D1 79            [ 4]  893 	ld	a,c
   68D2 B7            [ 4]  894 	or	a, a
   68D3 20 11         [12]  895 	jr	NZ,00106$
                            896 ;src/main.c:258: prota.x++;
   68D5 1C            [ 4]  897 	inc	e
   68D6 21 7D 64      [10]  898 	ld	hl,#_prota
   68D9 73            [ 7]  899 	ld	(hl),e
                            900 ;src/main.c:259: prota.mover = SI;
   68DA 21 83 64      [10]  901 	ld	hl,#(_prota + 0x0006)
   68DD 36 01         [10]  902 	ld	(hl),#0x01
                            903 ;src/main.c:260: prota.sprite = g_hero;
   68DF 21 DE 57      [10]  904 	ld	hl,#_g_hero
   68E2 22 81 64      [16]  905 	ld	((_prota + 0x0004)), hl
   68E5 C9            [10]  906 	ret
   68E6                     907 00106$:
                            908 ;src/main.c:261: }else if ( prota.x > 68 && prota.y >72 && prota.y < 80){  //TODO que avance solo si estamos en el centro
   68E6 3E 44         [ 7]  909 	ld	a,#0x44
   68E8 93            [ 4]  910 	sub	a, e
   68E9 D0            [11]  911 	ret	NC
   68EA 21 7E 64      [10]  912 	ld	hl, #_prota + 1
   68ED 4E            [ 7]  913 	ld	c,(hl)
   68EE 3E 48         [ 7]  914 	ld	a,#0x48
   68F0 91            [ 4]  915 	sub	a, c
   68F1 D0            [11]  916 	ret	NC
   68F2 79            [ 4]  917 	ld	a,c
   68F3 D6 50         [ 7]  918 	sub	a, #0x50
   68F5 D0            [11]  919 	ret	NC
                            920 ;src/main.c:262: avanzarMapa();
   68F6 C3 61 68      [10]  921 	jp  _avanzarMapa
                            922 ;src/main.c:266: void moverArriba() {
                            923 ;	---------------------------------
                            924 ; Function moverArriba
                            925 ; ---------------------------------
   68F9                     926 _moverArriba::
                            927 ;src/main.c:267: prota.mira = M_arriba;
   68F9 21 84 64      [10]  928 	ld	hl,#(_prota + 0x0007)
   68FC 36 02         [10]  929 	ld	(hl),#0x02
                            930 ;src/main.c:268: if (!checkCollision(M_arriba)) {
   68FE 21 02 00      [10]  931 	ld	hl,#0x0002
   6901 E5            [11]  932 	push	hl
   6902 CD C3 65      [17]  933 	call	_checkCollision
   6905 F1            [10]  934 	pop	af
   6906 7D            [ 4]  935 	ld	a,l
   6907 B7            [ 4]  936 	or	a, a
   6908 C0            [11]  937 	ret	NZ
                            938 ;src/main.c:269: prota.y--;
   6909 21 7E 64      [10]  939 	ld	hl,#_prota + 1
   690C 4E            [ 7]  940 	ld	c,(hl)
   690D 0D            [ 4]  941 	dec	c
   690E 71            [ 7]  942 	ld	(hl),c
                            943 ;src/main.c:270: prota.y--;
   690F 0D            [ 4]  944 	dec	c
   6910 71            [ 7]  945 	ld	(hl),c
                            946 ;src/main.c:271: prota.mover  = SI;
   6911 21 83 64      [10]  947 	ld	hl,#(_prota + 0x0006)
   6914 36 01         [10]  948 	ld	(hl),#0x01
                            949 ;src/main.c:272: prota.sprite = g_hero_up;
   6916 21 9A 56      [10]  950 	ld	hl,#_g_hero_up
   6919 22 81 64      [16]  951 	ld	((_prota + 0x0004)), hl
   691C C9            [10]  952 	ret
                            953 ;src/main.c:276: void moverAbajo() {
                            954 ;	---------------------------------
                            955 ; Function moverAbajo
                            956 ; ---------------------------------
   691D                     957 _moverAbajo::
                            958 ;src/main.c:277: prota.mira = M_abajo;
   691D 21 84 64      [10]  959 	ld	hl,#(_prota + 0x0007)
   6920 36 03         [10]  960 	ld	(hl),#0x03
                            961 ;src/main.c:278: if (!checkCollision(M_abajo)) {
   6922 21 03 00      [10]  962 	ld	hl,#0x0003
   6925 E5            [11]  963 	push	hl
   6926 CD C3 65      [17]  964 	call	_checkCollision
   6929 F1            [10]  965 	pop	af
   692A 7D            [ 4]  966 	ld	a,l
   692B B7            [ 4]  967 	or	a, a
   692C C0            [11]  968 	ret	NZ
                            969 ;src/main.c:279: prota.y++;
   692D 01 7E 64      [10]  970 	ld	bc,#_prota + 1
   6930 0A            [ 7]  971 	ld	a,(bc)
   6931 3C            [ 4]  972 	inc	a
   6932 02            [ 7]  973 	ld	(bc),a
                            974 ;src/main.c:280: prota.y++;
   6933 3C            [ 4]  975 	inc	a
   6934 02            [ 7]  976 	ld	(bc),a
                            977 ;src/main.c:281: prota.mover  = SI;
   6935 21 83 64      [10]  978 	ld	hl,#(_prota + 0x0006)
   6938 36 01         [10]  979 	ld	(hl),#0x01
                            980 ;src/main.c:282: prota.sprite = g_hero_down;
   693A 21 00 56      [10]  981 	ld	hl,#_g_hero_down
   693D 22 81 64      [16]  982 	ld	((_prota + 0x0004)), hl
   6940 C9            [10]  983 	ret
                            984 ;src/main.c:286: void dibujarCuchillo(TKnife* actual) {
                            985 ;	---------------------------------
                            986 ; Function dibujarCuchillo
                            987 ; ---------------------------------
   6941                     988 _dibujarCuchillo::
   6941 DD E5         [15]  989 	push	ix
   6943 DD 21 00 00   [14]  990 	ld	ix,#0
   6947 DD 39         [15]  991 	add	ix,sp
   6949 F5            [11]  992 	push	af
   694A F5            [11]  993 	push	af
                            994 ;src/main.c:287: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, actual->x, actual->y);
   694B DD 5E 04      [19]  995 	ld	e,4 (ix)
   694E DD 56 05      [19]  996 	ld	d,5 (ix)
   6951 6B            [ 4]  997 	ld	l, e
   6952 62            [ 4]  998 	ld	h, d
   6953 23            [ 6]  999 	inc	hl
   6954 46            [ 7] 1000 	ld	b,(hl)
   6955 1A            [ 7] 1001 	ld	a,(de)
   6956 D5            [11] 1002 	push	de
   6957 C5            [11] 1003 	push	bc
   6958 33            [ 6] 1004 	inc	sp
   6959 F5            [11] 1005 	push	af
   695A 33            [ 6] 1006 	inc	sp
   695B 21 00 C0      [10] 1007 	ld	hl,#0xC000
   695E E5            [11] 1008 	push	hl
   695F CD 18 64      [17] 1009 	call	_cpct_getScreenPtr
   6962 D1            [10] 1010 	pop	de
   6963 E5            [11] 1011 	push	hl
   6964 FD E1         [14] 1012 	pop	iy
                           1013 ;src/main.c:288: if(actual->eje == E_X){
   6966 6B            [ 4] 1014 	ld	l, e
   6967 62            [ 4] 1015 	ld	h, d
   6968 01 08 00      [10] 1016 	ld	bc, #0x0008
   696B 09            [11] 1017 	add	hl, bc
   696C 4E            [ 7] 1018 	ld	c,(hl)
                           1019 ;src/main.c:289: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   696D FD E5         [15] 1020 	push	iy
   696F F1            [10] 1021 	pop	af
   6970 DD 77 FD      [19] 1022 	ld	-3 (ix),a
   6973 FD E5         [15] 1023 	push	iy
   6975 3B            [ 6] 1024 	dec	sp
   6976 F1            [10] 1025 	pop	af
   6977 33            [ 6] 1026 	inc	sp
   6978 DD 77 FC      [19] 1027 	ld	-4 (ix),a
   697B 21 04 00      [10] 1028 	ld	hl,#0x0004
   697E 19            [11] 1029 	add	hl,de
   697F DD 75 FE      [19] 1030 	ld	-2 (ix),l
   6982 DD 74 FF      [19] 1031 	ld	-1 (ix),h
                           1032 ;src/main.c:288: if(actual->eje == E_X){
   6985 79            [ 4] 1033 	ld	a,c
   6986 B7            [ 4] 1034 	or	a, a
   6987 20 1E         [12] 1035 	jr	NZ,00104$
                           1036 ;src/main.c:289: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   6989 11 00 3E      [10] 1037 	ld	de,#_g_tablatrans+0
   698C DD 6E FE      [19] 1038 	ld	l,-2 (ix)
   698F DD 66 FF      [19] 1039 	ld	h,-1 (ix)
   6992 4E            [ 7] 1040 	ld	c,(hl)
   6993 23            [ 6] 1041 	inc	hl
   6994 46            [ 7] 1042 	ld	b,(hl)
   6995 D5            [11] 1043 	push	de
   6996 21 04 04      [10] 1044 	ld	hl,#0x0404
   6999 E5            [11] 1045 	push	hl
   699A DD 6E FC      [19] 1046 	ld	l,-4 (ix)
   699D DD 66 FD      [19] 1047 	ld	h,-3 (ix)
   69A0 E5            [11] 1048 	push	hl
   69A1 C5            [11] 1049 	push	bc
   69A2 CD 38 64      [17] 1050 	call	_cpct_drawSpriteMaskedAlignedTable
   69A5 18 1F         [12] 1051 	jr	00106$
   69A7                    1052 00104$:
                           1053 ;src/main.c:292: else if(actual->eje == E_Y){
   69A7 0D            [ 4] 1054 	dec	c
   69A8 20 1C         [12] 1055 	jr	NZ,00106$
                           1056 ;src/main.c:293: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   69AA 11 00 3E      [10] 1057 	ld	de,#_g_tablatrans+0
   69AD DD 6E FE      [19] 1058 	ld	l,-2 (ix)
   69B0 DD 66 FF      [19] 1059 	ld	h,-1 (ix)
   69B3 4E            [ 7] 1060 	ld	c,(hl)
   69B4 23            [ 6] 1061 	inc	hl
   69B5 46            [ 7] 1062 	ld	b,(hl)
   69B6 D5            [11] 1063 	push	de
   69B7 21 02 08      [10] 1064 	ld	hl,#0x0802
   69BA E5            [11] 1065 	push	hl
   69BB DD 6E FC      [19] 1066 	ld	l,-4 (ix)
   69BE DD 66 FD      [19] 1067 	ld	h,-3 (ix)
   69C1 E5            [11] 1068 	push	hl
   69C2 C5            [11] 1069 	push	bc
   69C3 CD 38 64      [17] 1070 	call	_cpct_drawSpriteMaskedAlignedTable
   69C6                    1071 00106$:
   69C6 DD F9         [10] 1072 	ld	sp, ix
   69C8 DD E1         [14] 1073 	pop	ix
   69CA C9            [10] 1074 	ret
                           1075 ;src/main.c:297: void borrarCuchillo(TKnife* actual) {
                           1076 ;	---------------------------------
                           1077 ; Function borrarCuchillo
                           1078 ; ---------------------------------
   69CB                    1079 _borrarCuchillo::
   69CB DD E5         [15] 1080 	push	ix
   69CD DD 21 00 00   [14] 1081 	ld	ix,#0
   69D1 DD 39         [15] 1082 	add	ix,sp
   69D3 3B            [ 6] 1083 	dec	sp
                           1084 ;src/main.c:298: u8 w = 2 + (actual->px & 1);
   69D4 DD 5E 04      [19] 1085 	ld	e,4 (ix)
   69D7 DD 56 05      [19] 1086 	ld	d,5 (ix)
   69DA 6B            [ 4] 1087 	ld	l, e
   69DB 62            [ 4] 1088 	ld	h, d
   69DC 23            [ 6] 1089 	inc	hl
   69DD 23            [ 6] 1090 	inc	hl
   69DE 4E            [ 7] 1091 	ld	c,(hl)
   69DF 79            [ 4] 1092 	ld	a,c
   69E0 E6 01         [ 7] 1093 	and	a, #0x01
   69E2 47            [ 4] 1094 	ld	b,a
   69E3 04            [ 4] 1095 	inc	b
   69E4 04            [ 4] 1096 	inc	b
                           1097 ;src/main.c:299: u8 h = 2 + (actual->py & 3 ? 1 : 0);
   69E5 EB            [ 4] 1098 	ex	de,hl
   69E6 23            [ 6] 1099 	inc	hl
   69E7 23            [ 6] 1100 	inc	hl
   69E8 23            [ 6] 1101 	inc	hl
   69E9 5E            [ 7] 1102 	ld	e,(hl)
   69EA 7B            [ 4] 1103 	ld	a,e
   69EB E6 03         [ 7] 1104 	and	a, #0x03
   69ED 28 04         [12] 1105 	jr	Z,00103$
   69EF 3E 01         [ 7] 1106 	ld	a,#0x01
   69F1 18 02         [12] 1107 	jr	00104$
   69F3                    1108 00103$:
   69F3 3E 00         [ 7] 1109 	ld	a,#0x00
   69F5                    1110 00104$:
   69F5 C6 02         [ 7] 1111 	add	a, #0x02
   69F7 DD 77 FF      [19] 1112 	ld	-1 (ix),a
                           1113 ;src/main.c:300: cpct_etm_drawTileBox2x4 (actual->px / 2, (actual->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   69FA FD 2A DF 64   [20] 1114 	ld	iy,(_mapa)
   69FE 16 00         [ 7] 1115 	ld	d,#0x00
   6A00 63            [ 4] 1116 	ld	h,e
   6A01 6A            [ 4] 1117 	ld	l,d
   6A02 CB 7A         [ 8] 1118 	bit	7, d
   6A04 28 05         [12] 1119 	jr	Z,00105$
   6A06 13            [ 6] 1120 	inc	de
   6A07 13            [ 6] 1121 	inc	de
   6A08 13            [ 6] 1122 	inc	de
   6A09 63            [ 4] 1123 	ld	h,e
   6A0A 6A            [ 4] 1124 	ld	l,d
   6A0B                    1125 00105$:
   6A0B 5C            [ 4] 1126 	ld	e, h
   6A0C 55            [ 4] 1127 	ld	d, l
   6A0D CB 2A         [ 8] 1128 	sra	d
   6A0F CB 1B         [ 8] 1129 	rr	e
   6A11 CB 2A         [ 8] 1130 	sra	d
   6A13 CB 1B         [ 8] 1131 	rr	e
   6A15 51            [ 4] 1132 	ld	d,c
   6A16 CB 3A         [ 8] 1133 	srl	d
   6A18 FD E5         [15] 1134 	push	iy
   6A1A 21 00 C0      [10] 1135 	ld	hl,#0xC000
   6A1D E5            [11] 1136 	push	hl
   6A1E 3E 28         [ 7] 1137 	ld	a,#0x28
   6A20 F5            [11] 1138 	push	af
   6A21 33            [ 6] 1139 	inc	sp
   6A22 DD 7E FF      [19] 1140 	ld	a,-1 (ix)
   6A25 F5            [11] 1141 	push	af
   6A26 33            [ 6] 1142 	inc	sp
   6A27 C5            [11] 1143 	push	bc
   6A28 33            [ 6] 1144 	inc	sp
   6A29 7B            [ 4] 1145 	ld	a,e
   6A2A F5            [11] 1146 	push	af
   6A2B 33            [ 6] 1147 	inc	sp
   6A2C D5            [11] 1148 	push	de
   6A2D 33            [ 6] 1149 	inc	sp
   6A2E CD C9 59      [17] 1150 	call	_cpct_etm_drawTileBox2x4
   6A31 33            [ 6] 1151 	inc	sp
   6A32 DD E1         [14] 1152 	pop	ix
   6A34 C9            [10] 1153 	ret
                           1154 ;src/main.c:303: void redibujarCuchillo(TKnife* actual) {
                           1155 ;	---------------------------------
                           1156 ; Function redibujarCuchillo
                           1157 ; ---------------------------------
   6A35                    1158 _redibujarCuchillo::
   6A35 DD E5         [15] 1159 	push	ix
   6A37 DD 21 00 00   [14] 1160 	ld	ix,#0
   6A3B DD 39         [15] 1161 	add	ix,sp
                           1162 ;src/main.c:304: borrarCuchillo(actual);
   6A3D DD 6E 04      [19] 1163 	ld	l,4 (ix)
   6A40 DD 66 05      [19] 1164 	ld	h,5 (ix)
   6A43 E5            [11] 1165 	push	hl
   6A44 CD CB 69      [17] 1166 	call	_borrarCuchillo
   6A47 F1            [10] 1167 	pop	af
                           1168 ;src/main.c:305: actual->px = actual->x;
   6A48 DD 4E 04      [19] 1169 	ld	c,4 (ix)
   6A4B DD 46 05      [19] 1170 	ld	b,5 (ix)
   6A4E 59            [ 4] 1171 	ld	e, c
   6A4F 50            [ 4] 1172 	ld	d, b
   6A50 13            [ 6] 1173 	inc	de
   6A51 13            [ 6] 1174 	inc	de
   6A52 0A            [ 7] 1175 	ld	a,(bc)
   6A53 12            [ 7] 1176 	ld	(de),a
                           1177 ;src/main.c:306: actual->py = actual->y;
   6A54 59            [ 4] 1178 	ld	e, c
   6A55 50            [ 4] 1179 	ld	d, b
   6A56 13            [ 6] 1180 	inc	de
   6A57 13            [ 6] 1181 	inc	de
   6A58 13            [ 6] 1182 	inc	de
   6A59 69            [ 4] 1183 	ld	l, c
   6A5A 60            [ 4] 1184 	ld	h, b
   6A5B 23            [ 6] 1185 	inc	hl
   6A5C 7E            [ 7] 1186 	ld	a,(hl)
   6A5D 12            [ 7] 1187 	ld	(de),a
                           1188 ;src/main.c:307: dibujarCuchillo(actual);
   6A5E C5            [11] 1189 	push	bc
   6A5F CD 41 69      [17] 1190 	call	_dibujarCuchillo
   6A62 F1            [10] 1191 	pop	af
   6A63 DD E1         [14] 1192 	pop	ix
   6A65 C9            [10] 1193 	ret
                           1194 ;src/main.c:311: void lanzarCuchillo(){
                           1195 ;	---------------------------------
                           1196 ; Function lanzarCuchillo
                           1197 ; ---------------------------------
   6A66                    1198 _lanzarCuchillo::
   6A66 DD E5         [15] 1199 	push	ix
   6A68 DD 21 00 00   [14] 1200 	ld	ix,#0
   6A6C DD 39         [15] 1201 	add	ix,sp
   6A6E 21 F6 FF      [10] 1202 	ld	hl,#-10
   6A71 39            [11] 1203 	add	hl,sp
   6A72 F9            [ 6] 1204 	ld	sp,hl
                           1205 ;src/main.c:313: TKnife* actual = cu;
   6A73 01 85 64      [10] 1206 	ld	bc,#_cu+0
                           1207 ;src/main.c:316: while(i>0 && actual->lanzado){
   6A76 1E 0A         [ 7] 1208 	ld	e,#0x0A
   6A78                    1209 00102$:
   6A78 21 06 00      [10] 1210 	ld	hl,#0x0006
   6A7B 09            [11] 1211 	add	hl,bc
   6A7C DD 75 FA      [19] 1212 	ld	-6 (ix),l
   6A7F DD 74 FB      [19] 1213 	ld	-5 (ix),h
   6A82 7B            [ 4] 1214 	ld	a,e
   6A83 B7            [ 4] 1215 	or	a, a
   6A84 28 13         [12] 1216 	jr	Z,00104$
   6A86 DD 6E FA      [19] 1217 	ld	l,-6 (ix)
   6A89 DD 66 FB      [19] 1218 	ld	h,-5 (ix)
   6A8C 7E            [ 7] 1219 	ld	a,(hl)
   6A8D B7            [ 4] 1220 	or	a, a
   6A8E 28 09         [12] 1221 	jr	Z,00104$
                           1222 ;src/main.c:317: --i;
   6A90 1D            [ 4] 1223 	dec	e
                           1224 ;src/main.c:318: actual++;
   6A91 21 09 00      [10] 1225 	ld	hl,#0x0009
   6A94 09            [11] 1226 	add	hl,bc
   6A95 4D            [ 4] 1227 	ld	c,l
   6A96 44            [ 4] 1228 	ld	b,h
   6A97 18 DF         [12] 1229 	jr	00102$
   6A99                    1230 00104$:
                           1231 ;src/main.c:321: if(i>0 && !actual->lanzado){
   6A99 7B            [ 4] 1232 	ld	a,e
   6A9A B7            [ 4] 1233 	or	a, a
   6A9B CA 2F 6C      [10] 1234 	jp	Z,00127$
   6A9E DD 6E FA      [19] 1235 	ld	l,-6 (ix)
   6AA1 DD 66 FB      [19] 1236 	ld	h,-5 (ix)
   6AA4 7E            [ 7] 1237 	ld	a,(hl)
   6AA5 B7            [ 4] 1238 	or	a, a
   6AA6 C2 2F 6C      [10] 1239 	jp	NZ,00127$
                           1240 ;src/main.c:323: if(prota.mira == M_derecha){
   6AA9 21 84 64      [10] 1241 	ld	hl, #_prota + 7
   6AAC 5E            [ 7] 1242 	ld	e,(hl)
                           1243 ;src/main.c:325: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
                           1244 ;src/main.c:327: actual->direccion = M_derecha;
   6AAD 21 07 00      [10] 1245 	ld	hl,#0x0007
   6AB0 09            [11] 1246 	add	hl,bc
   6AB1 E3            [19] 1247 	ex	(sp), hl
                           1248 ;src/main.c:329: actual->y=prota.y + G_HERO_H /2;
   6AB2 21 01 00      [10] 1249 	ld	hl,#0x0001
   6AB5 09            [11] 1250 	add	hl,bc
   6AB6 DD 75 FE      [19] 1251 	ld	-2 (ix),l
   6AB9 DD 74 FF      [19] 1252 	ld	-1 (ix),h
                           1253 ;src/main.c:330: actual->sprite=g_knifeX_0;
   6ABC 21 04 00      [10] 1254 	ld	hl,#0x0004
   6ABF 09            [11] 1255 	add	hl,bc
   6AC0 DD 75 F8      [19] 1256 	ld	-8 (ix),l
   6AC3 DD 74 F9      [19] 1257 	ld	-7 (ix),h
                           1258 ;src/main.c:331: actual->eje = E_X;
   6AC6 21 08 00      [10] 1259 	ld	hl,#0x0008
   6AC9 09            [11] 1260 	add	hl,bc
   6ACA DD 75 FC      [19] 1261 	ld	-4 (ix),l
   6ACD DD 74 FD      [19] 1262 	ld	-3 (ix),h
                           1263 ;src/main.c:323: if(prota.mira == M_derecha){
   6AD0 7B            [ 4] 1264 	ld	a,e
   6AD1 B7            [ 4] 1265 	or	a, a
   6AD2 20 55         [12] 1266 	jr	NZ,00122$
                           1267 ;src/main.c:325: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   6AD4 3A 7E 64      [13] 1268 	ld	a, (#(_prota + 0x0001) + 0)
   6AD7 C6 0B         [ 7] 1269 	add	a, #0x0B
   6AD9 57            [ 4] 1270 	ld	d,a
   6ADA 3A 7D 64      [13] 1271 	ld	a, (#_prota + 0)
   6ADD C6 0C         [ 7] 1272 	add	a, #0x0C
   6ADF C5            [11] 1273 	push	bc
   6AE0 D5            [11] 1274 	push	de
   6AE1 33            [ 6] 1275 	inc	sp
   6AE2 F5            [11] 1276 	push	af
   6AE3 33            [ 6] 1277 	inc	sp
   6AE4 CD 9B 65      [17] 1278 	call	_getTilePtr
   6AE7 F1            [10] 1279 	pop	af
   6AE8 C1            [10] 1280 	pop	bc
   6AE9 5E            [ 7] 1281 	ld	e,(hl)
   6AEA 3E 02         [ 7] 1282 	ld	a,#0x02
   6AEC 93            [ 4] 1283 	sub	a, e
   6AED DA 2F 6C      [10] 1284 	jp	C,00127$
                           1285 ;src/main.c:326: actual->lanzado = SI;
   6AF0 DD 6E FA      [19] 1286 	ld	l,-6 (ix)
   6AF3 DD 66 FB      [19] 1287 	ld	h,-5 (ix)
   6AF6 36 01         [10] 1288 	ld	(hl),#0x01
                           1289 ;src/main.c:327: actual->direccion = M_derecha;
   6AF8 E1            [10] 1290 	pop	hl
   6AF9 E5            [11] 1291 	push	hl
   6AFA 36 00         [10] 1292 	ld	(hl),#0x00
                           1293 ;src/main.c:328: actual->x=prota.x + G_HERO_W;
   6AFC 3A 7D 64      [13] 1294 	ld	a, (#_prota + 0)
   6AFF C6 07         [ 7] 1295 	add	a, #0x07
   6B01 02            [ 7] 1296 	ld	(bc),a
                           1297 ;src/main.c:329: actual->y=prota.y + G_HERO_H /2;
   6B02 3A 7E 64      [13] 1298 	ld	a, (#(_prota + 0x0001) + 0)
   6B05 C6 0B         [ 7] 1299 	add	a, #0x0B
   6B07 DD 6E FE      [19] 1300 	ld	l,-2 (ix)
   6B0A DD 66 FF      [19] 1301 	ld	h,-1 (ix)
   6B0D 77            [ 7] 1302 	ld	(hl),a
                           1303 ;src/main.c:330: actual->sprite=g_knifeX_0;
   6B0E DD 6E F8      [19] 1304 	ld	l,-8 (ix)
   6B11 DD 66 F9      [19] 1305 	ld	h,-7 (ix)
   6B14 36 C0         [10] 1306 	ld	(hl),#<(_g_knifeX_0)
   6B16 23            [ 6] 1307 	inc	hl
   6B17 36 54         [10] 1308 	ld	(hl),#>(_g_knifeX_0)
                           1309 ;src/main.c:331: actual->eje = E_X;
   6B19 DD 6E FC      [19] 1310 	ld	l,-4 (ix)
   6B1C DD 66 FD      [19] 1311 	ld	h,-3 (ix)
   6B1F 36 00         [10] 1312 	ld	(hl),#0x00
                           1313 ;src/main.c:332: dibujarCuchillo(actual);
   6B21 C5            [11] 1314 	push	bc
   6B22 CD 41 69      [17] 1315 	call	_dibujarCuchillo
   6B25 F1            [10] 1316 	pop	af
   6B26 C3 2F 6C      [10] 1317 	jp	00127$
   6B29                    1318 00122$:
                           1319 ;src/main.c:335: else if(prota.mira == M_izquierda){
   6B29 7B            [ 4] 1320 	ld	a,e
   6B2A 3D            [ 4] 1321 	dec	a
   6B2B 20 55         [12] 1322 	jr	NZ,00119$
                           1323 ;src/main.c:336: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   6B2D 3A 7E 64      [13] 1324 	ld	a, (#(_prota + 0x0001) + 0)
   6B30 C6 0B         [ 7] 1325 	add	a, #0x0B
   6B32 57            [ 4] 1326 	ld	d,a
   6B33 3A 7D 64      [13] 1327 	ld	a, (#_prota + 0)
   6B36 C6 F6         [ 7] 1328 	add	a,#0xF6
   6B38 C5            [11] 1329 	push	bc
   6B39 D5            [11] 1330 	push	de
   6B3A 33            [ 6] 1331 	inc	sp
   6B3B F5            [11] 1332 	push	af
   6B3C 33            [ 6] 1333 	inc	sp
   6B3D CD 9B 65      [17] 1334 	call	_getTilePtr
   6B40 F1            [10] 1335 	pop	af
   6B41 C1            [10] 1336 	pop	bc
   6B42 5E            [ 7] 1337 	ld	e,(hl)
   6B43 3E 02         [ 7] 1338 	ld	a,#0x02
   6B45 93            [ 4] 1339 	sub	a, e
   6B46 DA 2F 6C      [10] 1340 	jp	C,00127$
                           1341 ;src/main.c:337: actual->lanzado = SI;
   6B49 DD 6E FA      [19] 1342 	ld	l,-6 (ix)
   6B4C DD 66 FB      [19] 1343 	ld	h,-5 (ix)
   6B4F 36 01         [10] 1344 	ld	(hl),#0x01
                           1345 ;src/main.c:338: actual->direccion = M_izquierda;
   6B51 E1            [10] 1346 	pop	hl
   6B52 E5            [11] 1347 	push	hl
   6B53 36 01         [10] 1348 	ld	(hl),#0x01
                           1349 ;src/main.c:339: actual->x = prota.x - G_KNIFEX_0_W;
   6B55 3A 7D 64      [13] 1350 	ld	a, (#_prota + 0)
   6B58 C6 FC         [ 7] 1351 	add	a,#0xFC
   6B5A 02            [ 7] 1352 	ld	(bc),a
                           1353 ;src/main.c:340: actual->y = prota.y + G_HERO_H /2;
   6B5B 3A 7E 64      [13] 1354 	ld	a, (#(_prota + 0x0001) + 0)
   6B5E C6 0B         [ 7] 1355 	add	a, #0x0B
   6B60 DD 6E FE      [19] 1356 	ld	l,-2 (ix)
   6B63 DD 66 FF      [19] 1357 	ld	h,-1 (ix)
   6B66 77            [ 7] 1358 	ld	(hl),a
                           1359 ;src/main.c:341: actual->sprite = g_knifeX_1;
   6B67 DD 6E F8      [19] 1360 	ld	l,-8 (ix)
   6B6A DD 66 F9      [19] 1361 	ld	h,-7 (ix)
   6B6D 36 D0         [10] 1362 	ld	(hl),#<(_g_knifeX_1)
   6B6F 23            [ 6] 1363 	inc	hl
   6B70 36 54         [10] 1364 	ld	(hl),#>(_g_knifeX_1)
                           1365 ;src/main.c:342: actual->eje = E_X;
   6B72 DD 6E FC      [19] 1366 	ld	l,-4 (ix)
   6B75 DD 66 FD      [19] 1367 	ld	h,-3 (ix)
   6B78 36 00         [10] 1368 	ld	(hl),#0x00
                           1369 ;src/main.c:343: dibujarCuchillo(actual);
   6B7A C5            [11] 1370 	push	bc
   6B7B CD 41 69      [17] 1371 	call	_dibujarCuchillo
   6B7E F1            [10] 1372 	pop	af
   6B7F C3 2F 6C      [10] 1373 	jp	00127$
   6B82                    1374 00119$:
                           1375 ;src/main.c:346: else if(prota.mira == M_abajo){
   6B82 7B            [ 4] 1376 	ld	a,e
   6B83 D6 03         [ 7] 1377 	sub	a, #0x03
   6B85 20 54         [12] 1378 	jr	NZ,00116$
                           1379 ;src/main.c:348: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   6B87 3A 7E 64      [13] 1380 	ld	a, (#(_prota + 0x0001) + 0)
   6B8A C6 1F         [ 7] 1381 	add	a, #0x1F
   6B8C 57            [ 4] 1382 	ld	d,a
   6B8D 3A 7D 64      [13] 1383 	ld	a, (#_prota + 0)
   6B90 C6 03         [ 7] 1384 	add	a, #0x03
   6B92 C5            [11] 1385 	push	bc
   6B93 D5            [11] 1386 	push	de
   6B94 33            [ 6] 1387 	inc	sp
   6B95 F5            [11] 1388 	push	af
   6B96 33            [ 6] 1389 	inc	sp
   6B97 CD 9B 65      [17] 1390 	call	_getTilePtr
   6B9A F1            [10] 1391 	pop	af
   6B9B C1            [10] 1392 	pop	bc
   6B9C 5E            [ 7] 1393 	ld	e,(hl)
   6B9D 3E 02         [ 7] 1394 	ld	a,#0x02
   6B9F 93            [ 4] 1395 	sub	a, e
   6BA0 DA 2F 6C      [10] 1396 	jp	C,00127$
                           1397 ;src/main.c:349: actual->lanzado = SI;
   6BA3 DD 6E FA      [19] 1398 	ld	l,-6 (ix)
   6BA6 DD 66 FB      [19] 1399 	ld	h,-5 (ix)
   6BA9 36 01         [10] 1400 	ld	(hl),#0x01
                           1401 ;src/main.c:350: actual->direccion = M_abajo;
   6BAB E1            [10] 1402 	pop	hl
   6BAC E5            [11] 1403 	push	hl
   6BAD 36 03         [10] 1404 	ld	(hl),#0x03
                           1405 ;src/main.c:351: actual->x = prota.x + G_HERO_W / 2;
   6BAF 3A 7D 64      [13] 1406 	ld	a, (#_prota + 0)
   6BB2 C6 03         [ 7] 1407 	add	a, #0x03
   6BB4 02            [ 7] 1408 	ld	(bc),a
                           1409 ;src/main.c:352: actual->y = prota.y + G_HERO_H;
   6BB5 3A 7E 64      [13] 1410 	ld	a, (#(_prota + 0x0001) + 0)
   6BB8 C6 16         [ 7] 1411 	add	a, #0x16
   6BBA DD 6E FE      [19] 1412 	ld	l,-2 (ix)
   6BBD DD 66 FF      [19] 1413 	ld	h,-1 (ix)
   6BC0 77            [ 7] 1414 	ld	(hl),a
                           1415 ;src/main.c:353: actual->sprite = g_knifeY_0;
   6BC1 DD 6E F8      [19] 1416 	ld	l,-8 (ix)
   6BC4 DD 66 F9      [19] 1417 	ld	h,-7 (ix)
   6BC7 36 A0         [10] 1418 	ld	(hl),#<(_g_knifeY_0)
   6BC9 23            [ 6] 1419 	inc	hl
   6BCA 36 54         [10] 1420 	ld	(hl),#>(_g_knifeY_0)
                           1421 ;src/main.c:354: actual->eje = E_Y;
   6BCC DD 6E FC      [19] 1422 	ld	l,-4 (ix)
   6BCF DD 66 FD      [19] 1423 	ld	h,-3 (ix)
   6BD2 36 01         [10] 1424 	ld	(hl),#0x01
                           1425 ;src/main.c:355: dibujarCuchillo(actual);
   6BD4 C5            [11] 1426 	push	bc
   6BD5 CD 41 69      [17] 1427 	call	_dibujarCuchillo
   6BD8 F1            [10] 1428 	pop	af
   6BD9 18 54         [12] 1429 	jr	00127$
   6BDB                    1430 00116$:
                           1431 ;src/main.c:358: else if(prota.mira == M_arriba){
   6BDB 7B            [ 4] 1432 	ld	a,e
   6BDC D6 02         [ 7] 1433 	sub	a, #0x02
   6BDE 20 4F         [12] 1434 	jr	NZ,00127$
                           1435 ;src/main.c:359: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   6BE0 3A 7E 64      [13] 1436 	ld	a, (#(_prota + 0x0001) + 0)
   6BE3 C6 F7         [ 7] 1437 	add	a,#0xF7
   6BE5 57            [ 4] 1438 	ld	d,a
   6BE6 3A 7D 64      [13] 1439 	ld	a, (#_prota + 0)
   6BE9 C6 03         [ 7] 1440 	add	a, #0x03
   6BEB C5            [11] 1441 	push	bc
   6BEC D5            [11] 1442 	push	de
   6BED 33            [ 6] 1443 	inc	sp
   6BEE F5            [11] 1444 	push	af
   6BEF 33            [ 6] 1445 	inc	sp
   6BF0 CD 9B 65      [17] 1446 	call	_getTilePtr
   6BF3 F1            [10] 1447 	pop	af
   6BF4 C1            [10] 1448 	pop	bc
   6BF5 5E            [ 7] 1449 	ld	e,(hl)
   6BF6 3E 02         [ 7] 1450 	ld	a,#0x02
   6BF8 93            [ 4] 1451 	sub	a, e
   6BF9 38 34         [12] 1452 	jr	C,00127$
                           1453 ;src/main.c:360: actual->lanzado = SI;
   6BFB DD 6E FA      [19] 1454 	ld	l,-6 (ix)
   6BFE DD 66 FB      [19] 1455 	ld	h,-5 (ix)
   6C01 36 01         [10] 1456 	ld	(hl),#0x01
                           1457 ;src/main.c:361: actual->direccion = M_arriba;
   6C03 E1            [10] 1458 	pop	hl
   6C04 E5            [11] 1459 	push	hl
   6C05 36 02         [10] 1460 	ld	(hl),#0x02
                           1461 ;src/main.c:362: actual->x = prota.x + G_HERO_W / 2;
   6C07 3A 7D 64      [13] 1462 	ld	a, (#_prota + 0)
   6C0A C6 03         [ 7] 1463 	add	a, #0x03
   6C0C 02            [ 7] 1464 	ld	(bc),a
                           1465 ;src/main.c:363: actual->y = prota.y;
   6C0D 3A 7E 64      [13] 1466 	ld	a, (#(_prota + 0x0001) + 0)
   6C10 DD 6E FE      [19] 1467 	ld	l,-2 (ix)
   6C13 DD 66 FF      [19] 1468 	ld	h,-1 (ix)
   6C16 77            [ 7] 1469 	ld	(hl),a
                           1470 ;src/main.c:364: actual->sprite = g_knifeY_1;
   6C17 DD 6E F8      [19] 1471 	ld	l,-8 (ix)
   6C1A DD 66 F9      [19] 1472 	ld	h,-7 (ix)
   6C1D 36 B0         [10] 1473 	ld	(hl),#<(_g_knifeY_1)
   6C1F 23            [ 6] 1474 	inc	hl
   6C20 36 54         [10] 1475 	ld	(hl),#>(_g_knifeY_1)
                           1476 ;src/main.c:365: actual->eje = E_Y;
   6C22 DD 6E FC      [19] 1477 	ld	l,-4 (ix)
   6C25 DD 66 FD      [19] 1478 	ld	h,-3 (ix)
   6C28 36 01         [10] 1479 	ld	(hl),#0x01
                           1480 ;src/main.c:366: dibujarCuchillo(actual);
   6C2A C5            [11] 1481 	push	bc
   6C2B CD 41 69      [17] 1482 	call	_dibujarCuchillo
   6C2E F1            [10] 1483 	pop	af
   6C2F                    1484 00127$:
   6C2F DD F9         [10] 1485 	ld	sp, ix
   6C31 DD E1         [14] 1486 	pop	ix
   6C33 C9            [10] 1487 	ret
                           1488 ;src/main.c:372: void comprobarTeclado() {
                           1489 ;	---------------------------------
                           1490 ; Function comprobarTeclado
                           1491 ; ---------------------------------
   6C34                    1492 _comprobarTeclado::
                           1493 ;src/main.c:373: cpct_scanKeyboard_if();
   6C34 CD 21 5B      [17] 1494 	call	_cpct_scanKeyboard_if
                           1495 ;src/main.c:375: if (cpct_isAnyKeyPressed()) {
   6C37 CD 14 5B      [17] 1496 	call	_cpct_isAnyKeyPressed
   6C3A 7D            [ 4] 1497 	ld	a,l
   6C3B B7            [ 4] 1498 	or	a, a
   6C3C C8            [11] 1499 	ret	Z
                           1500 ;src/main.c:376: if (cpct_isKeyPressed(Key_CursorLeft))
   6C3D 21 01 01      [10] 1501 	ld	hl,#0x0101
   6C40 CD 2F 59      [17] 1502 	call	_cpct_isKeyPressed
   6C43 7D            [ 4] 1503 	ld	a,l
   6C44 B7            [ 4] 1504 	or	a, a
                           1505 ;src/main.c:377: moverIzquierda();
   6C45 C2 9A 68      [10] 1506 	jp	NZ,_moverIzquierda
                           1507 ;src/main.c:378: else if (cpct_isKeyPressed(Key_CursorRight))
   6C48 21 00 02      [10] 1508 	ld	hl,#0x0200
   6C4B CD 2F 59      [17] 1509 	call	_cpct_isKeyPressed
   6C4E 7D            [ 4] 1510 	ld	a,l
   6C4F B7            [ 4] 1511 	or	a, a
                           1512 ;src/main.c:379: moverDerecha();
   6C50 C2 BF 68      [10] 1513 	jp	NZ,_moverDerecha
                           1514 ;src/main.c:380: else if (cpct_isKeyPressed(Key_CursorUp))
   6C53 21 00 01      [10] 1515 	ld	hl,#0x0100
   6C56 CD 2F 59      [17] 1516 	call	_cpct_isKeyPressed
   6C59 7D            [ 4] 1517 	ld	a,l
   6C5A B7            [ 4] 1518 	or	a, a
                           1519 ;src/main.c:381: moverArriba();
   6C5B C2 F9 68      [10] 1520 	jp	NZ,_moverArriba
                           1521 ;src/main.c:382: else if (cpct_isKeyPressed(Key_CursorDown))
   6C5E 21 00 04      [10] 1522 	ld	hl,#0x0400
   6C61 CD 2F 59      [17] 1523 	call	_cpct_isKeyPressed
   6C64 7D            [ 4] 1524 	ld	a,l
   6C65 B7            [ 4] 1525 	or	a, a
                           1526 ;src/main.c:383: moverAbajo();
   6C66 C2 1D 69      [10] 1527 	jp	NZ,_moverAbajo
                           1528 ;src/main.c:384: else if (cpct_isKeyPressed(Key_Space))
   6C69 21 05 80      [10] 1529 	ld	hl,#0x8005
   6C6C CD 2F 59      [17] 1530 	call	_cpct_isKeyPressed
   6C6F 7D            [ 4] 1531 	ld	a,l
   6C70 B7            [ 4] 1532 	or	a, a
   6C71 C8            [11] 1533 	ret	Z
                           1534 ;src/main.c:385: lanzarCuchillo();
   6C72 C3 66 6A      [10] 1535 	jp  _lanzarCuchillo
                           1536 ;src/main.c:391: void moverCuchillo(){
                           1537 ;	---------------------------------
                           1538 ; Function moverCuchillo
                           1539 ; ---------------------------------
   6C75                    1540 _moverCuchillo::
   6C75 DD E5         [15] 1541 	push	ix
   6C77 DD 21 00 00   [14] 1542 	ld	ix,#0
   6C7B DD 39         [15] 1543 	add	ix,sp
   6C7D F5            [11] 1544 	push	af
   6C7E F5            [11] 1545 	push	af
                           1546 ;src/main.c:393: u8 i = 10 + 1;
   6C7F DD 36 FC 0B   [19] 1547 	ld	-4 (ix),#0x0B
                           1548 ;src/main.c:394: TKnife* actual = cu;
   6C83 01 85 64      [10] 1549 	ld	bc,#_cu+0
                           1550 ;src/main.c:396: while(--i){
   6C86                    1551 00126$:
   6C86 DD 35 FC      [23] 1552 	dec	-4 (ix)
   6C89 DD 7E FC      [19] 1553 	ld	a, -4 (ix)
   6C8C B7            [ 4] 1554 	or	a, a
   6C8D CA AC 6D      [10] 1555 	jp	Z,00129$
                           1556 ;src/main.c:397: if(actual->lanzado){
   6C90 21 06 00      [10] 1557 	ld	hl,#0x0006
   6C93 09            [11] 1558 	add	hl,bc
   6C94 DD 75 FD      [19] 1559 	ld	-3 (ix),l
   6C97 DD 74 FE      [19] 1560 	ld	-2 (ix),h
   6C9A DD 6E FD      [19] 1561 	ld	l,-3 (ix)
   6C9D DD 66 FE      [19] 1562 	ld	h,-2 (ix)
   6CA0 7E            [ 7] 1563 	ld	a,(hl)
   6CA1 B7            [ 4] 1564 	or	a, a
   6CA2 CA A3 6D      [10] 1565 	jp	Z,00125$
                           1566 ;src/main.c:398: if(actual->direccion == M_derecha){
   6CA5 C5            [11] 1567 	push	bc
   6CA6 FD E1         [14] 1568 	pop	iy
   6CA8 FD 6E 07      [19] 1569 	ld	l,7 (iy)
                           1570 ;src/main.c:400: if( *getTilePtr(actual->x + G_KNIFEX_0_W + 1, actual->y) <= 2){
   6CAB 59            [ 4] 1571 	ld	e, c
   6CAC 50            [ 4] 1572 	ld	d, b
   6CAD 13            [ 6] 1573 	inc	de
                           1574 ;src/main.c:398: if(actual->direccion == M_derecha){
   6CAE 7D            [ 4] 1575 	ld	a,l
   6CAF B7            [ 4] 1576 	or	a, a
   6CB0 20 34         [12] 1577 	jr	NZ,00122$
                           1578 ;src/main.c:400: if( *getTilePtr(actual->x + G_KNIFEX_0_W + 1, actual->y) <= 2){
   6CB2 1A            [ 7] 1579 	ld	a,(de)
   6CB3 57            [ 4] 1580 	ld	d,a
   6CB4 0A            [ 7] 1581 	ld	a,(bc)
   6CB5 C6 05         [ 7] 1582 	add	a, #0x05
   6CB7 C5            [11] 1583 	push	bc
   6CB8 D5            [11] 1584 	push	de
   6CB9 33            [ 6] 1585 	inc	sp
   6CBA F5            [11] 1586 	push	af
   6CBB 33            [ 6] 1587 	inc	sp
   6CBC CD 9B 65      [17] 1588 	call	_getTilePtr
   6CBF F1            [10] 1589 	pop	af
   6CC0 C1            [10] 1590 	pop	bc
   6CC1 5E            [ 7] 1591 	ld	e,(hl)
   6CC2 3E 02         [ 7] 1592 	ld	a,#0x02
   6CC4 93            [ 4] 1593 	sub	a, e
   6CC5 38 0D         [12] 1594 	jr	C,00102$
                           1595 ;src/main.c:401: actual->x++;
   6CC7 0A            [ 7] 1596 	ld	a,(bc)
   6CC8 3C            [ 4] 1597 	inc	a
   6CC9 02            [ 7] 1598 	ld	(bc),a
                           1599 ;src/main.c:403: redibujarCuchillo(actual);
   6CCA C5            [11] 1600 	push	bc
   6CCB C5            [11] 1601 	push	bc
   6CCC CD 35 6A      [17] 1602 	call	_redibujarCuchillo
   6CCF F1            [10] 1603 	pop	af
   6CD0 C1            [10] 1604 	pop	bc
   6CD1 C3 A3 6D      [10] 1605 	jp	00125$
   6CD4                    1606 00102$:
                           1607 ;src/main.c:406: borrarCuchillo(actual);
   6CD4 C5            [11] 1608 	push	bc
   6CD5 C5            [11] 1609 	push	bc
   6CD6 CD CB 69      [17] 1610 	call	_borrarCuchillo
   6CD9 F1            [10] 1611 	pop	af
   6CDA C1            [10] 1612 	pop	bc
                           1613 ;src/main.c:407: actual->lanzado = NO;
   6CDB DD 6E FD      [19] 1614 	ld	l,-3 (ix)
   6CDE DD 66 FE      [19] 1615 	ld	h,-2 (ix)
   6CE1 36 00         [10] 1616 	ld	(hl),#0x00
   6CE3 C3 A3 6D      [10] 1617 	jp	00125$
   6CE6                    1618 00122$:
                           1619 ;src/main.c:410: else if(actual->direccion == M_izquierda){
   6CE6 7D            [ 4] 1620 	ld	a,l
   6CE7 3D            [ 4] 1621 	dec	a
   6CE8 20 35         [12] 1622 	jr	NZ,00119$
                           1623 ;src/main.c:411: if(*getTilePtr(actual->x - 1, actual->y) <= 2){
   6CEA 1A            [ 7] 1624 	ld	a,(de)
   6CEB 57            [ 4] 1625 	ld	d,a
   6CEC 0A            [ 7] 1626 	ld	a,(bc)
   6CED C6 FF         [ 7] 1627 	add	a,#0xFF
   6CEF C5            [11] 1628 	push	bc
   6CF0 D5            [11] 1629 	push	de
   6CF1 33            [ 6] 1630 	inc	sp
   6CF2 F5            [11] 1631 	push	af
   6CF3 33            [ 6] 1632 	inc	sp
   6CF4 CD 9B 65      [17] 1633 	call	_getTilePtr
   6CF7 F1            [10] 1634 	pop	af
   6CF8 C1            [10] 1635 	pop	bc
   6CF9 5E            [ 7] 1636 	ld	e,(hl)
   6CFA 3E 02         [ 7] 1637 	ld	a,#0x02
   6CFC 93            [ 4] 1638 	sub	a, e
   6CFD 38 0E         [12] 1639 	jr	C,00105$
                           1640 ;src/main.c:412: actual->x--;
   6CFF 0A            [ 7] 1641 	ld	a,(bc)
   6D00 C6 FF         [ 7] 1642 	add	a,#0xFF
   6D02 02            [ 7] 1643 	ld	(bc),a
                           1644 ;src/main.c:414: redibujarCuchillo(actual);
   6D03 C5            [11] 1645 	push	bc
   6D04 C5            [11] 1646 	push	bc
   6D05 CD 35 6A      [17] 1647 	call	_redibujarCuchillo
   6D08 F1            [10] 1648 	pop	af
   6D09 C1            [10] 1649 	pop	bc
   6D0A C3 A3 6D      [10] 1650 	jp	00125$
   6D0D                    1651 00105$:
                           1652 ;src/main.c:416: borrarCuchillo(actual);
   6D0D C5            [11] 1653 	push	bc
   6D0E C5            [11] 1654 	push	bc
   6D0F CD CB 69      [17] 1655 	call	_borrarCuchillo
   6D12 F1            [10] 1656 	pop	af
   6D13 C1            [10] 1657 	pop	bc
                           1658 ;src/main.c:417: actual->lanzado = NO;
   6D14 DD 6E FD      [19] 1659 	ld	l,-3 (ix)
   6D17 DD 66 FE      [19] 1660 	ld	h,-2 (ix)
   6D1A 36 00         [10] 1661 	ld	(hl),#0x00
   6D1C C3 A3 6D      [10] 1662 	jp	00125$
   6D1F                    1663 00119$:
                           1664 ;src/main.c:420: else if(actual->direccion == M_abajo){
   6D1F 7D            [ 4] 1665 	ld	a,l
   6D20 D6 03         [ 7] 1666 	sub	a, #0x03
   6D22 20 3D         [12] 1667 	jr	NZ,00116$
                           1668 ;src/main.c:421: if(*getTilePtr(actual->x, actual->y + G_KNIFEY_0_H + 2) <= 2){
   6D24 1A            [ 7] 1669 	ld	a,(de)
   6D25 C6 0A         [ 7] 1670 	add	a, #0x0A
   6D27 F5            [11] 1671 	push	af
   6D28 0A            [ 7] 1672 	ld	a,(bc)
   6D29 DD 77 FF      [19] 1673 	ld	-1 (ix),a
   6D2C F1            [10] 1674 	pop	af
   6D2D C5            [11] 1675 	push	bc
   6D2E D5            [11] 1676 	push	de
   6D2F F5            [11] 1677 	push	af
   6D30 33            [ 6] 1678 	inc	sp
   6D31 DD 7E FF      [19] 1679 	ld	a,-1 (ix)
   6D34 F5            [11] 1680 	push	af
   6D35 33            [ 6] 1681 	inc	sp
   6D36 CD 9B 65      [17] 1682 	call	_getTilePtr
   6D39 F1            [10] 1683 	pop	af
   6D3A D1            [10] 1684 	pop	de
   6D3B C1            [10] 1685 	pop	bc
   6D3C 6E            [ 7] 1686 	ld	l,(hl)
   6D3D 3E 02         [ 7] 1687 	ld	a,#0x02
   6D3F 95            [ 4] 1688 	sub	a, l
   6D40 38 0E         [12] 1689 	jr	C,00108$
                           1690 ;src/main.c:422: actual->y++;
   6D42 1A            [ 7] 1691 	ld	a,(de)
   6D43 3C            [ 4] 1692 	inc	a
   6D44 12            [ 7] 1693 	ld	(de),a
                           1694 ;src/main.c:423: actual->y++;
   6D45 3C            [ 4] 1695 	inc	a
   6D46 12            [ 7] 1696 	ld	(de),a
                           1697 ;src/main.c:424: redibujarCuchillo(actual);
   6D47 C5            [11] 1698 	push	bc
   6D48 C5            [11] 1699 	push	bc
   6D49 CD 35 6A      [17] 1700 	call	_redibujarCuchillo
   6D4C F1            [10] 1701 	pop	af
   6D4D C1            [10] 1702 	pop	bc
   6D4E 18 53         [12] 1703 	jr	00125$
   6D50                    1704 00108$:
                           1705 ;src/main.c:428: borrarCuchillo(actual);
   6D50 C5            [11] 1706 	push	bc
   6D51 C5            [11] 1707 	push	bc
   6D52 CD CB 69      [17] 1708 	call	_borrarCuchillo
   6D55 F1            [10] 1709 	pop	af
   6D56 C1            [10] 1710 	pop	bc
                           1711 ;src/main.c:429: actual->lanzado = NO;
   6D57 DD 6E FD      [19] 1712 	ld	l,-3 (ix)
   6D5A DD 66 FE      [19] 1713 	ld	h,-2 (ix)
   6D5D 36 00         [10] 1714 	ld	(hl),#0x00
   6D5F 18 42         [12] 1715 	jr	00125$
   6D61                    1716 00116$:
                           1717 ;src/main.c:432: else if(actual->direccion == M_arriba){
   6D61 7D            [ 4] 1718 	ld	a,l
   6D62 D6 02         [ 7] 1719 	sub	a, #0x02
   6D64 20 3D         [12] 1720 	jr	NZ,00125$
                           1721 ;src/main.c:433: if(*getTilePtr(actual->x, actual->y - 2) <= 2){
   6D66 1A            [ 7] 1722 	ld	a,(de)
   6D67 C6 FE         [ 7] 1723 	add	a,#0xFE
   6D69 F5            [11] 1724 	push	af
   6D6A 0A            [ 7] 1725 	ld	a,(bc)
   6D6B DD 77 FF      [19] 1726 	ld	-1 (ix),a
   6D6E F1            [10] 1727 	pop	af
   6D6F C5            [11] 1728 	push	bc
   6D70 D5            [11] 1729 	push	de
   6D71 F5            [11] 1730 	push	af
   6D72 33            [ 6] 1731 	inc	sp
   6D73 DD 7E FF      [19] 1732 	ld	a,-1 (ix)
   6D76 F5            [11] 1733 	push	af
   6D77 33            [ 6] 1734 	inc	sp
   6D78 CD 9B 65      [17] 1735 	call	_getTilePtr
   6D7B F1            [10] 1736 	pop	af
   6D7C D1            [10] 1737 	pop	de
   6D7D C1            [10] 1738 	pop	bc
   6D7E 6E            [ 7] 1739 	ld	l,(hl)
   6D7F 3E 02         [ 7] 1740 	ld	a,#0x02
   6D81 95            [ 4] 1741 	sub	a, l
   6D82 38 10         [12] 1742 	jr	C,00111$
                           1743 ;src/main.c:434: actual->y--;
   6D84 1A            [ 7] 1744 	ld	a,(de)
   6D85 C6 FF         [ 7] 1745 	add	a,#0xFF
   6D87 12            [ 7] 1746 	ld	(de),a
                           1747 ;src/main.c:435: actual->y--;
   6D88 C6 FF         [ 7] 1748 	add	a,#0xFF
   6D8A 12            [ 7] 1749 	ld	(de),a
                           1750 ;src/main.c:436: redibujarCuchillo(actual);
   6D8B C5            [11] 1751 	push	bc
   6D8C C5            [11] 1752 	push	bc
   6D8D CD 35 6A      [17] 1753 	call	_redibujarCuchillo
   6D90 F1            [10] 1754 	pop	af
   6D91 C1            [10] 1755 	pop	bc
   6D92 18 0F         [12] 1756 	jr	00125$
   6D94                    1757 00111$:
                           1758 ;src/main.c:439: borrarCuchillo(actual);
   6D94 C5            [11] 1759 	push	bc
   6D95 C5            [11] 1760 	push	bc
   6D96 CD CB 69      [17] 1761 	call	_borrarCuchillo
   6D99 F1            [10] 1762 	pop	af
   6D9A C1            [10] 1763 	pop	bc
                           1764 ;src/main.c:440: actual->lanzado = NO;
   6D9B DD 6E FD      [19] 1765 	ld	l,-3 (ix)
   6D9E DD 66 FE      [19] 1766 	ld	h,-2 (ix)
   6DA1 36 00         [10] 1767 	ld	(hl),#0x00
   6DA3                    1768 00125$:
                           1769 ;src/main.c:444: ++actual;
   6DA3 21 09 00      [10] 1770 	ld	hl,#0x0009
   6DA6 09            [11] 1771 	add	hl,bc
   6DA7 4D            [ 4] 1772 	ld	c,l
   6DA8 44            [ 4] 1773 	ld	b,h
   6DA9 C3 86 6C      [10] 1774 	jp	00126$
   6DAC                    1775 00129$:
   6DAC DD F9         [10] 1776 	ld	sp, ix
   6DAE DD E1         [14] 1777 	pop	ix
   6DB0 C9            [10] 1778 	ret
                           1779 ;src/main.c:448: void menuFin(){
                           1780 ;	---------------------------------
                           1781 ; Function menuFin
                           1782 ; ---------------------------------
   6DB1                    1783 _menuFin::
                           1784 ;src/main.c:451: cpct_clearScreen(0);
   6DB1 21 00 40      [10] 1785 	ld	hl,#0x4000
   6DB4 E5            [11] 1786 	push	hl
   6DB5 AF            [ 4] 1787 	xor	a, a
   6DB6 F5            [11] 1788 	push	af
   6DB7 33            [ 6] 1789 	inc	sp
   6DB8 26 C0         [ 7] 1790 	ld	h, #0xC0
   6DBA E5            [11] 1791 	push	hl
   6DBB CD AF 5B      [17] 1792 	call	_cpct_memset
                           1793 ;src/main.c:453: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 12, 90); // centrado en horizontal y arriba en vertical
   6DBE 21 0C 5A      [10] 1794 	ld	hl,#0x5A0C
   6DC1 E5            [11] 1795 	push	hl
   6DC2 21 00 C0      [10] 1796 	ld	hl,#0xC000
   6DC5 E5            [11] 1797 	push	hl
   6DC6 CD 18 64      [17] 1798 	call	_cpct_getScreenPtr
   6DC9 4D            [ 4] 1799 	ld	c,l
   6DCA 44            [ 4] 1800 	ld	b,h
                           1801 ;src/main.c:454: cpct_drawStringM0("FIN DE PARTIDA", memptr, 2, 3);
   6DCB 21 02 03      [10] 1802 	ld	hl,#0x0302
   6DCE E5            [11] 1803 	push	hl
   6DCF C5            [11] 1804 	push	bc
   6DD0 21 EA 6D      [10] 1805 	ld	hl,#___str_0
   6DD3 E5            [11] 1806 	push	hl
   6DD4 CD A5 59      [17] 1807 	call	_cpct_drawStringM0
   6DD7 21 06 00      [10] 1808 	ld	hl,#6
   6DDA 39            [11] 1809 	add	hl,sp
   6DDB F9            [ 6] 1810 	ld	sp,hl
                           1811 ;src/main.c:458: do{
   6DDC                    1812 00101$:
                           1813 ;src/main.c:459: cpct_scanKeyboard_f();   		
   6DDC CD 3B 59      [17] 1814 	call	_cpct_scanKeyboard_f
                           1815 ;src/main.c:460: } while(!cpct_isKeyPressed(Key_I));   		
   6DDF 21 04 08      [10] 1816 	ld	hl,#0x0804
   6DE2 CD 2F 59      [17] 1817 	call	_cpct_isKeyPressed
   6DE5 7D            [ 4] 1818 	ld	a,l
   6DE6 B7            [ 4] 1819 	or	a, a
   6DE7 28 F3         [12] 1820 	jr	Z,00101$
   6DE9 C9            [10] 1821 	ret
   6DEA                    1822 ___str_0:
   6DEA 46 49 4E 20 44 45  1823 	.ascii "FIN DE PARTIDA"
        20 50 41 52 54 49
        44 41
   6DF8 00                 1824 	.db 0x00
                           1825 ;src/main.c:463: void menu(){
                           1826 ;	---------------------------------
                           1827 ; Function menu
                           1828 ; ---------------------------------
   6DF9                    1829 _menu::
                           1830 ;src/main.c:466: cpct_clearScreen(0);
   6DF9 21 00 40      [10] 1831 	ld	hl,#0x4000
   6DFC E5            [11] 1832 	push	hl
   6DFD AF            [ 4] 1833 	xor	a, a
   6DFE F5            [11] 1834 	push	af
   6DFF 33            [ 6] 1835 	inc	sp
   6E00 26 C0         [ 7] 1836 	ld	h, #0xC0
   6E02 E5            [11] 1837 	push	hl
   6E03 CD AF 5B      [17] 1838 	call	_cpct_memset
                           1839 ;src/main.c:468: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 10); // centrado en horizontal y arriba en vertical
   6E06 21 20 0A      [10] 1840 	ld	hl,#0x0A20
   6E09 E5            [11] 1841 	push	hl
   6E0A 21 00 C0      [10] 1842 	ld	hl,#0xC000
   6E0D E5            [11] 1843 	push	hl
   6E0E CD 18 64      [17] 1844 	call	_cpct_getScreenPtr
   6E11 4D            [ 4] 1845 	ld	c,l
   6E12 44            [ 4] 1846 	ld	b,h
                           1847 ;src/main.c:469: cpct_drawStringM0("MENU", memptr, 2, 3);
   6E13 21 02 03      [10] 1848 	ld	hl,#0x0302
   6E16 E5            [11] 1849 	push	hl
   6E17 C5            [11] 1850 	push	bc
   6E18 21 50 6E      [10] 1851 	ld	hl,#___str_1
   6E1B E5            [11] 1852 	push	hl
   6E1C CD A5 59      [17] 1853 	call	_cpct_drawStringM0
   6E1F 21 06 00      [10] 1854 	ld	hl,#6
   6E22 39            [11] 1855 	add	hl,sp
   6E23 F9            [ 6] 1856 	ld	sp,hl
                           1857 ;src/main.c:471: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 180); // centrado en horizontal y abajo en vertical
   6E24 21 1A B4      [10] 1858 	ld	hl,#0xB41A
   6E27 E5            [11] 1859 	push	hl
   6E28 21 00 C0      [10] 1860 	ld	hl,#0xC000
   6E2B E5            [11] 1861 	push	hl
   6E2C CD 18 64      [17] 1862 	call	_cpct_getScreenPtr
   6E2F 4D            [ 4] 1863 	ld	c,l
   6E30 44            [ 4] 1864 	ld	b,h
                           1865 ;src/main.c:472: cpct_drawStringM0("PULSA I", memptr, 1, 0);
   6E31 21 01 00      [10] 1866 	ld	hl,#0x0001
   6E34 E5            [11] 1867 	push	hl
   6E35 C5            [11] 1868 	push	bc
   6E36 21 55 6E      [10] 1869 	ld	hl,#___str_2
   6E39 E5            [11] 1870 	push	hl
   6E3A CD A5 59      [17] 1871 	call	_cpct_drawStringM0
   6E3D 21 06 00      [10] 1872 	ld	hl,#6
   6E40 39            [11] 1873 	add	hl,sp
   6E41 F9            [ 6] 1874 	ld	sp,hl
                           1875 ;src/main.c:475: do{
   6E42                    1876 00101$:
                           1877 ;src/main.c:476: cpct_scanKeyboard_f();   		
   6E42 CD 3B 59      [17] 1878 	call	_cpct_scanKeyboard_f
                           1879 ;src/main.c:477: } while(!cpct_isKeyPressed(Key_I));   		
   6E45 21 04 08      [10] 1880 	ld	hl,#0x0804
   6E48 CD 2F 59      [17] 1881 	call	_cpct_isKeyPressed
   6E4B 7D            [ 4] 1882 	ld	a,l
   6E4C B7            [ 4] 1883 	or	a, a
   6E4D 28 F3         [12] 1884 	jr	Z,00101$
   6E4F C9            [10] 1885 	ret
   6E50                    1886 ___str_1:
   6E50 4D 45 4E 55        1887 	.ascii "MENU"
   6E54 00                 1888 	.db 0x00
   6E55                    1889 ___str_2:
   6E55 50 55 4C 53 41 20  1890 	.ascii "PULSA I"
        49
   6E5C 00                 1891 	.db 0x00
                           1892 ;src/main.c:481: void inicializar() {
                           1893 ;	---------------------------------
                           1894 ; Function inicializar
                           1895 ; ---------------------------------
   6E5D                    1896 _inicializar::
                           1897 ;src/main.c:484: TKnife* actual = cu;
                           1898 ;src/main.c:486: cpct_disableFirmware();
   6E5D CD E6 63      [17] 1899 	call	_cpct_disableFirmware
                           1900 ;src/main.c:487: cpct_setVideoMode(0);
   6E60 2E 00         [ 7] 1901 	ld	l,#0x00
   6E62 CD 91 5B      [17] 1902 	call	_cpct_setVideoMode
                           1903 ;src/main.c:489: cpct_setPalette(g_palette, 16);
   6E65 21 10 00      [10] 1904 	ld	hl,#0x0010
   6E68 E5            [11] 1905 	push	hl
   6E69 21 CE 57      [10] 1906 	ld	hl,#_g_palette
   6E6C E5            [11] 1907 	push	hl
   6E6D CD 18 59      [17] 1908 	call	_cpct_setPalette
                           1909 ;src/main.c:490: cpct_akp_musicInit(G_song);
   6E70 21 00 3F      [10] 1910 	ld	hl,#_G_song
   6E73 E5            [11] 1911 	push	hl
   6E74 CD C2 62      [17] 1912 	call	_cpct_akp_musicInit
   6E77 F1            [10] 1913 	pop	af
                           1914 ;src/main.c:491: mapa = g_map1;
   6E78 21 C0 4D      [10] 1915 	ld	hl,#_g_map1+0
   6E7B 22 DF 64      [16] 1916 	ld	(_mapa),hl
                           1917 ;src/main.c:492: num_mapa = 0;
   6E7E 21 E1 64      [10] 1918 	ld	hl,#_num_mapa + 0
   6E81 36 00         [10] 1919 	ld	(hl), #0x00
                           1920 ;src/main.c:493: cpct_etm_setTileset2x4(g_tileset);
   6E83 21 E0 54      [10] 1921 	ld	hl,#_g_tileset
   6E86 CD 58 5A      [17] 1922 	call	_cpct_etm_setTileset2x4
                           1923 ;src/main.c:494: dibujarMapa();
   6E89 CD E2 64      [17] 1924 	call	_dibujarMapa
                           1925 ;src/main.c:497: prota.x = prota.px = 4;
   6E8C 21 7F 64      [10] 1926 	ld	hl,#(_prota + 0x0002)
   6E8F 36 04         [10] 1927 	ld	(hl),#0x04
   6E91 21 7D 64      [10] 1928 	ld	hl,#_prota
   6E94 36 04         [10] 1929 	ld	(hl),#0x04
                           1930 ;src/main.c:498: prota.y = prota.py = 80;
   6E96 21 80 64      [10] 1931 	ld	hl,#(_prota + 0x0003)
   6E99 36 50         [10] 1932 	ld	(hl),#0x50
   6E9B 21 7E 64      [10] 1933 	ld	hl,#(_prota + 0x0001)
   6E9E 36 50         [10] 1934 	ld	(hl),#0x50
                           1935 ;src/main.c:499: prota.mover  = NO;
   6EA0 21 83 64      [10] 1936 	ld	hl,#(_prota + 0x0006)
   6EA3 36 00         [10] 1937 	ld	(hl),#0x00
                           1938 ;src/main.c:500: prota.mira=M_derecha;
   6EA5 21 84 64      [10] 1939 	ld	hl,#(_prota + 0x0007)
   6EA8 36 00         [10] 1940 	ld	(hl),#0x00
                           1941 ;src/main.c:501: prota.sprite = g_hero;
   6EAA 21 DE 57      [10] 1942 	ld	hl,#_g_hero
   6EAD 22 81 64      [16] 1943 	ld	((_prota + 0x0004)), hl
                           1944 ;src/main.c:503: enemy.x = enemy.px = 67;
   6EB0 21 77 64      [10] 1945 	ld	hl,#(_enemy + 0x0002)
   6EB3 36 43         [10] 1946 	ld	(hl),#0x43
   6EB5 21 75 64      [10] 1947 	ld	hl,#_enemy
   6EB8 36 43         [10] 1948 	ld	(hl),#0x43
                           1949 ;src/main.c:504: enemy.y = enemy.py = 84;
   6EBA 21 78 64      [10] 1950 	ld	hl,#(_enemy + 0x0003)
   6EBD 36 54         [10] 1951 	ld	(hl),#0x54
   6EBF 21 76 64      [10] 1952 	ld	hl,#(_enemy + 0x0001)
   6EC2 36 54         [10] 1953 	ld	(hl),#0x54
                           1954 ;src/main.c:505: enemy.mover  = NO;
   6EC4 21 7B 64      [10] 1955 	ld	hl,#(_enemy + 0x0006)
   6EC7 36 00         [10] 1956 	ld	(hl),#0x00
                           1957 ;src/main.c:506: enemy.mira=M_abajo;
   6EC9 21 7C 64      [10] 1958 	ld	hl,#(_enemy + 0x0007)
   6ECC 36 03         [10] 1959 	ld	(hl),#0x03
                           1960 ;src/main.c:507: enemy.sprite = g_enemy;
   6ECE 21 A8 55      [10] 1961 	ld	hl,#_g_enemy
   6ED1 22 79 64      [16] 1962 	ld	((_enemy + 0x0004)), hl
                           1963 ;src/main.c:510: i = 10 + 1;
   6ED4 0E 0B         [ 7] 1964 	ld	c,#0x0B
                           1965 ;src/main.c:513: while(--i){
   6ED6 11 85 64      [10] 1966 	ld	de,#_cu
   6ED9                    1967 00101$:
   6ED9 41            [ 4] 1968 	ld	b,c
   6EDA 05            [ 4] 1969 	dec	b
   6EDB 78            [ 4] 1970 	ld	a,b
   6EDC 4F            [ 4] 1971 	ld	c,a
   6EDD B7            [ 4] 1972 	or	a, a
   6EDE 28 25         [12] 1973 	jr	Z,00103$
                           1974 ;src/main.c:514: actual->x = actual->px = 0;
   6EE0 6B            [ 4] 1975 	ld	l, e
   6EE1 62            [ 4] 1976 	ld	h, d
   6EE2 23            [ 6] 1977 	inc	hl
   6EE3 23            [ 6] 1978 	inc	hl
   6EE4 36 00         [10] 1979 	ld	(hl),#0x00
   6EE6 AF            [ 4] 1980 	xor	a, a
   6EE7 12            [ 7] 1981 	ld	(de),a
                           1982 ;src/main.c:515: actual->y = actual->py = 0;
   6EE8 D5            [11] 1983 	push	de
   6EE9 FD E1         [14] 1984 	pop	iy
   6EEB FD 23         [10] 1985 	inc	iy
   6EED 6B            [ 4] 1986 	ld	l, e
   6EEE 62            [ 4] 1987 	ld	h, d
   6EEF 23            [ 6] 1988 	inc	hl
   6EF0 23            [ 6] 1989 	inc	hl
   6EF1 23            [ 6] 1990 	inc	hl
   6EF2 36 00         [10] 1991 	ld	(hl),#0x00
   6EF4 FD 36 00 00   [19] 1992 	ld	0 (iy), #0x00
                           1993 ;src/main.c:516: actual->lanzado = 0;
   6EF8 21 06 00      [10] 1994 	ld	hl,#0x0006
   6EFB 19            [11] 1995 	add	hl,de
   6EFC 36 00         [10] 1996 	ld	(hl),#0x00
                           1997 ;src/main.c:517: ++actual;
   6EFE 21 09 00      [10] 1998 	ld	hl,#0x0009
   6F01 19            [11] 1999 	add	hl,de
   6F02 EB            [ 4] 2000 	ex	de,hl
   6F03 18 D4         [12] 2001 	jr	00101$
   6F05                    2002 00103$:
                           2003 ;src/main.c:521: dibujarProta();
   6F05 CD FE 64      [17] 2004 	call	_dibujarProta
                           2005 ;src/main.c:522: dibujarEnemigo();
   6F08 CD 05 67      [17] 2006 	call	_dibujarEnemigo
   6F0B C9            [10] 2007 	ret
                           2008 ;src/main.c:525: void main(void) {
                           2009 ;	---------------------------------
                           2010 ; Function main
                           2011 ; ---------------------------------
   6F0C                    2012 _main::
                           2013 ;src/main.c:527: menu();
   6F0C CD F9 6D      [17] 2014 	call	_menu
                           2015 ;src/main.c:529: inicializar();
   6F0F CD 5D 6E      [17] 2016 	call	_inicializar
                           2017 ;src/main.c:530: cpct_akp_musicPlay();
   6F12 CD BF 5B      [17] 2018 	call	_cpct_akp_musicPlay
                           2019 ;src/main.c:533: while (1) {
   6F15                    2020 00104$:
                           2021 ;src/main.c:536: comprobarTeclado();
   6F15 CD 34 6C      [17] 2022 	call	_comprobarTeclado
                           2023 ;src/main.c:538: cpct_waitVSYNC();
   6F18 CD 89 5B      [17] 2024 	call	_cpct_waitVSYNC
                           2025 ;src/main.c:539: moverCuchillo();
   6F1B CD 75 6C      [17] 2026 	call	_moverCuchillo
                           2027 ;src/main.c:540: moverEnemigo();
   6F1E CD A2 67      [17] 2028 	call	_moverEnemigo
                           2029 ;src/main.c:542: if (prota.mover) {
   6F21 3A 83 64      [13] 2030 	ld	a, (#(_prota + 0x0006) + 0)
   6F24 B7            [ 4] 2031 	or	a, a
   6F25 28 EE         [12] 2032 	jr	Z,00104$
                           2033 ;src/main.c:544: redibujarProta();
   6F27 CD 87 65      [17] 2034 	call	_redibujarProta
                           2035 ;src/main.c:545: prota.mover = NO;
   6F2A 21 83 64      [10] 2036 	ld	hl,#(_prota + 0x0006)
   6F2D 36 00         [10] 2037 	ld	(hl),#0x00
   6F2F 18 E4         [12] 2038 	jr	00104$
                           2039 	.area _CODE
                           2040 	.area _INITIALIZER
                           2041 	.area _CABS (ABS)
   3F00                    2042 	.org 0x3F00
   3F00                    2043 _G_song:
   3F00 41                 2044 	.db #0x41	; 65	'A'
   3F01 54                 2045 	.db #0x54	; 84	'T'
   3F02 31                 2046 	.db #0x31	; 49	'1'
   3F03 30                 2047 	.db #0x30	; 48	'0'
   3F04 01                 2048 	.db #0x01	; 1
   3F05 40                 2049 	.db #0x40	; 64
   3F06 42                 2050 	.db #0x42	; 66	'B'
   3F07 0F                 2051 	.db #0x0F	; 15
   3F08 02                 2052 	.db #0x02	; 2
   3F09 06                 2053 	.db #0x06	; 6
   3F0A 1D                 2054 	.db #0x1D	; 29
   3F0B 00                 2055 	.db #0x00	; 0
   3F0C 10                 2056 	.db #0x10	; 16
   3F0D 40                 2057 	.db #0x40	; 64
   3F0E 19                 2058 	.db #0x19	; 25
   3F0F 40                 2059 	.db #0x40	; 64
   3F10 00                 2060 	.db #0x00	; 0
   3F11 00                 2061 	.db #0x00	; 0
   3F12 00                 2062 	.db #0x00	; 0
   3F13 00                 2063 	.db #0x00	; 0
   3F14 00                 2064 	.db #0x00	; 0
   3F15 00                 2065 	.db #0x00	; 0
   3F16 0D                 2066 	.db #0x0D	; 13
   3F17 12                 2067 	.db #0x12	; 18
   3F18 40                 2068 	.db #0x40	; 64
   3F19 01                 2069 	.db #0x01	; 1
   3F1A 00                 2070 	.db #0x00	; 0
   3F1B 7C                 2071 	.db #0x7C	; 124
   3F1C 18                 2072 	.db #0x18	; 24
   3F1D 78                 2073 	.db #0x78	; 120	'x'
   3F1E 0C                 2074 	.db #0x0C	; 12
   3F1F 34                 2075 	.db #0x34	; 52	'4'
   3F20 30                 2076 	.db #0x30	; 48	'0'
   3F21 2C                 2077 	.db #0x2C	; 44
   3F22 28                 2078 	.db #0x28	; 40
   3F23 24                 2079 	.db #0x24	; 36
   3F24 20                 2080 	.db #0x20	; 32
   3F25 1C                 2081 	.db #0x1C	; 28
   3F26 0D                 2082 	.db #0x0D	; 13
   3F27 25                 2083 	.db #0x25	; 37
   3F28 40                 2084 	.db #0x40	; 64
   3F29 20                 2085 	.db #0x20	; 32
   3F2A 00                 2086 	.db #0x00	; 0
   3F2B 00                 2087 	.db #0x00	; 0
   3F2C 00                 2088 	.db #0x00	; 0
   3F2D 39                 2089 	.db #0x39	; 57	'9'
   3F2E 40                 2090 	.db #0x40	; 64
   3F2F 00                 2091 	.db #0x00	; 0
   3F30 57                 2092 	.db #0x57	; 87	'W'
   3F31 40                 2093 	.db #0x40	; 64
   3F32 3B                 2094 	.db #0x3B	; 59
   3F33 40                 2095 	.db #0x40	; 64
   3F34 57                 2096 	.db #0x57	; 87	'W'
   3F35 40                 2097 	.db #0x40	; 64
   3F36 01                 2098 	.db #0x01	; 1
   3F37 2F                 2099 	.db #0x2F	; 47
   3F38 40                 2100 	.db #0x40	; 64
   3F39 19                 2101 	.db #0x19	; 25
   3F3A 00                 2102 	.db #0x00	; 0
   3F3B 76                 2103 	.db #0x76	; 118	'v'
   3F3C E1                 2104 	.db #0xE1	; 225
   3F3D 00                 2105 	.db #0x00	; 0
   3F3E 00                 2106 	.db #0x00	; 0
   3F3F 01                 2107 	.db #0x01	; 1
   3F40 04                 2108 	.db #0x04	; 4
   3F41 51                 2109 	.db #0x51	; 81	'Q'
   3F42 04                 2110 	.db #0x04	; 4
   3F43 37                 2111 	.db #0x37	; 55	'7'
   3F44 04                 2112 	.db #0x04	; 4
   3F45 4F                 2113 	.db #0x4F	; 79	'O'
   3F46 04                 2114 	.db #0x04	; 4
   3F47 37                 2115 	.db #0x37	; 55	'7'
   3F48 02                 2116 	.db #0x02	; 2
   3F49 4B                 2117 	.db #0x4B	; 75	'K'
   3F4A 02                 2118 	.db #0x02	; 2
   3F4B 37                 2119 	.db #0x37	; 55	'7'
   3F4C 04                 2120 	.db #0x04	; 4
   3F4D 4F                 2121 	.db #0x4F	; 79	'O'
   3F4E 04                 2122 	.db #0x04	; 4
   3F4F 37                 2123 	.db #0x37	; 55	'7'
   3F50 04                 2124 	.db #0x04	; 4
   3F51 4F                 2125 	.db #0x4F	; 79	'O'
   3F52 04                 2126 	.db #0x04	; 4
   3F53 37                 2127 	.db #0x37	; 55	'7'
   3F54 02                 2128 	.db #0x02	; 2
   3F55 4B                 2129 	.db #0x4B	; 75	'K'
   3F56 00                 2130 	.db #0x00	; 0
   3F57 42                 2131 	.db #0x42	; 66	'B'
   3F58 60                 2132 	.db #0x60	; 96
   3F59 00                 2133 	.db #0x00	; 0
   3F5A 42                 2134 	.db #0x42	; 66	'B'
   3F5B 80                 2135 	.db #0x80	; 128
   3F5C 00                 2136 	.db #0x00	; 0
   3F5D 00                 2137 	.db #0x00	; 0
   3F5E 42                 2138 	.db #0x42	; 66	'B'
   3F5F 00                 2139 	.db #0x00	; 0
   3F60 00                 2140 	.db #0x00	; 0
