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
   6325                      68 _EMirar::
   6325                      69 	.ds 1
   6326                      70 _EEje::
   6326                      71 	.ds 1
   6327                      72 _enemy::
   6327                      73 	.ds 8
   632F                      74 _prota::
   632F                      75 	.ds 8
   6337                      76 _cu::
   6337                      77 	.ds 90
   6391                      78 _mapa::
   6391                      79 	.ds 2
   6393                      80 _num_mapa::
   6393                      81 	.ds 1
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
                            106 ;src/main.c:107: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
                            107 ;	---------------------------------
                            108 ; Function dummy_cpct_transparentMaskTable0M0_container
                            109 ; ---------------------------------
   57CA                     110 _dummy_cpct_transparentMaskTable0M0_container::
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
                            147 ;src/main.c:110: void dibujarMapa() {
                            148 ;	---------------------------------
                            149 ; Function dibujarMapa
                            150 ; ---------------------------------
   6394                     151 _dibujarMapa::
                            152 ;src/main.c:111: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   6394 2A 91 63      [16]  153 	ld	hl,(_mapa)
   6397 E5            [11]  154 	push	hl
   6398 21 00 C0      [10]  155 	ld	hl,#0xC000
   639B E5            [11]  156 	push	hl
   639C 21 2C 28      [10]  157 	ld	hl,#0x282C
   639F E5            [11]  158 	push	hl
   63A0 2E 00         [ 7]  159 	ld	l, #0x00
   63A2 E5            [11]  160 	push	hl
   63A3 AF            [ 4]  161 	xor	a, a
   63A4 F5            [11]  162 	push	af
   63A5 33            [ 6]  163 	inc	sp
   63A6 CD 7B 58      [17]  164 	call	_cpct_etm_drawTileBox2x4
   63A9 C9            [10]  165 	ret
   63AA                     166 _mapas:
   63AA C0 4D               167 	.dw _g_map1
   63AC E0 46               168 	.dw _g_map2
   63AE 00 40               169 	.dw _g_map3
                            170 ;src/main.c:116: void dibujarProta() {
                            171 ;	---------------------------------
                            172 ; Function dibujarProta
                            173 ; ---------------------------------
   63B0                     174 _dibujarProta::
                            175 ;src/main.c:117: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   63B0 21 30 63      [10]  176 	ld	hl, #_prota + 1
   63B3 56            [ 7]  177 	ld	d,(hl)
   63B4 21 2F 63      [10]  178 	ld	hl, #_prota + 0
   63B7 46            [ 7]  179 	ld	b,(hl)
   63B8 D5            [11]  180 	push	de
   63B9 33            [ 6]  181 	inc	sp
   63BA C5            [11]  182 	push	bc
   63BB 33            [ 6]  183 	inc	sp
   63BC 21 00 C0      [10]  184 	ld	hl,#0xC000
   63BF E5            [11]  185 	push	hl
   63C0 CD CA 62      [17]  186 	call	_cpct_getScreenPtr
   63C3 EB            [ 4]  187 	ex	de,hl
                            188 ;src/main.c:118: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   63C4 ED 4B 33 63   [20]  189 	ld	bc, (#_prota + 4)
   63C8 21 00 3E      [10]  190 	ld	hl,#_g_tablatrans
   63CB E5            [11]  191 	push	hl
   63CC 21 07 16      [10]  192 	ld	hl,#0x1607
   63CF E5            [11]  193 	push	hl
   63D0 D5            [11]  194 	push	de
   63D1 C5            [11]  195 	push	bc
   63D2 CD EA 62      [17]  196 	call	_cpct_drawSpriteMaskedAlignedTable
   63D5 C9            [10]  197 	ret
                            198 ;src/main.c:121: void borrarProta() {
                            199 ;	---------------------------------
                            200 ; Function borrarProta
                            201 ; ---------------------------------
   63D6                     202 _borrarProta::
   63D6 DD E5         [15]  203 	push	ix
   63D8 DD 21 00 00   [14]  204 	ld	ix,#0
   63DC DD 39         [15]  205 	add	ix,sp
   63DE 3B            [ 6]  206 	dec	sp
                            207 ;src/main.c:123: u8 w = 4 + (prota.px & 1);
   63DF 21 31 63      [10]  208 	ld	hl, #_prota + 2
   63E2 4E            [ 7]  209 	ld	c,(hl)
   63E3 79            [ 4]  210 	ld	a,c
   63E4 E6 01         [ 7]  211 	and	a, #0x01
   63E6 47            [ 4]  212 	ld	b,a
   63E7 04            [ 4]  213 	inc	b
   63E8 04            [ 4]  214 	inc	b
   63E9 04            [ 4]  215 	inc	b
   63EA 04            [ 4]  216 	inc	b
                            217 ;src/main.c:126: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   63EB 21 32 63      [10]  218 	ld	hl, #_prota + 3
   63EE 5E            [ 7]  219 	ld	e,(hl)
   63EF CB 4B         [ 8]  220 	bit	1, e
   63F1 28 04         [12]  221 	jr	Z,00103$
   63F3 3E 01         [ 7]  222 	ld	a,#0x01
   63F5 18 02         [12]  223 	jr	00104$
   63F7                     224 00103$:
   63F7 3E 00         [ 7]  225 	ld	a,#0x00
   63F9                     226 00104$:
   63F9 C6 06         [ 7]  227 	add	a, #0x06
   63FB DD 77 FF      [19]  228 	ld	-1 (ix),a
                            229 ;src/main.c:128: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   63FE FD 2A 91 63   [20]  230 	ld	iy,(_mapa)
   6402 16 00         [ 7]  231 	ld	d,#0x00
   6404 63            [ 4]  232 	ld	h,e
   6405 6A            [ 4]  233 	ld	l,d
   6406 CB 7A         [ 8]  234 	bit	7, d
   6408 28 05         [12]  235 	jr	Z,00105$
   640A 13            [ 6]  236 	inc	de
   640B 13            [ 6]  237 	inc	de
   640C 13            [ 6]  238 	inc	de
   640D 63            [ 4]  239 	ld	h,e
   640E 6A            [ 4]  240 	ld	l,d
   640F                     241 00105$:
   640F 5C            [ 4]  242 	ld	e, h
   6410 55            [ 4]  243 	ld	d, l
   6411 CB 2A         [ 8]  244 	sra	d
   6413 CB 1B         [ 8]  245 	rr	e
   6415 CB 2A         [ 8]  246 	sra	d
   6417 CB 1B         [ 8]  247 	rr	e
   6419 51            [ 4]  248 	ld	d,c
   641A CB 3A         [ 8]  249 	srl	d
   641C FD E5         [15]  250 	push	iy
   641E 21 00 C0      [10]  251 	ld	hl,#0xC000
   6421 E5            [11]  252 	push	hl
   6422 3E 28         [ 7]  253 	ld	a,#0x28
   6424 F5            [11]  254 	push	af
   6425 33            [ 6]  255 	inc	sp
   6426 DD 7E FF      [19]  256 	ld	a,-1 (ix)
   6429 F5            [11]  257 	push	af
   642A 33            [ 6]  258 	inc	sp
   642B C5            [11]  259 	push	bc
   642C 33            [ 6]  260 	inc	sp
   642D 7B            [ 4]  261 	ld	a,e
   642E F5            [11]  262 	push	af
   642F 33            [ 6]  263 	inc	sp
   6430 D5            [11]  264 	push	de
   6431 33            [ 6]  265 	inc	sp
   6432 CD 7B 58      [17]  266 	call	_cpct_etm_drawTileBox2x4
   6435 33            [ 6]  267 	inc	sp
   6436 DD E1         [14]  268 	pop	ix
   6438 C9            [10]  269 	ret
                            270 ;src/main.c:133: void redibujarProta() {
                            271 ;	---------------------------------
                            272 ; Function redibujarProta
                            273 ; ---------------------------------
   6439                     274 _redibujarProta::
                            275 ;src/main.c:134: borrarProta();
   6439 CD D6 63      [17]  276 	call	_borrarProta
                            277 ;src/main.c:135: prota.px = prota.x;
   643C 01 31 63      [10]  278 	ld	bc,#_prota + 2
   643F 3A 2F 63      [13]  279 	ld	a, (#_prota + 0)
   6442 02            [ 7]  280 	ld	(bc),a
                            281 ;src/main.c:136: prota.py = prota.y;
   6443 01 32 63      [10]  282 	ld	bc,#_prota + 3
   6446 3A 30 63      [13]  283 	ld	a, (#_prota + 1)
   6449 02            [ 7]  284 	ld	(bc),a
                            285 ;src/main.c:137: dibujarProta();
   644A C3 B0 63      [10]  286 	jp  _dibujarProta
                            287 ;src/main.c:140: u8* getTilePtr(u8 x, u8 y) {
                            288 ;	---------------------------------
                            289 ; Function getTilePtr
                            290 ; ---------------------------------
   644D                     291 _getTilePtr::
                            292 ;src/main.c:141: return mapa + (y/4)*g_map1_W + x/2;
   644D 21 03 00      [10]  293 	ld	hl, #3+0
   6450 39            [11]  294 	add	hl, sp
   6451 4E            [ 7]  295 	ld	c, (hl)
   6452 CB 39         [ 8]  296 	srl	c
   6454 CB 39         [ 8]  297 	srl	c
   6456 06 00         [ 7]  298 	ld	b,#0x00
   6458 69            [ 4]  299 	ld	l, c
   6459 60            [ 4]  300 	ld	h, b
   645A 29            [11]  301 	add	hl, hl
   645B 29            [11]  302 	add	hl, hl
   645C 09            [11]  303 	add	hl, bc
   645D 29            [11]  304 	add	hl, hl
   645E 29            [11]  305 	add	hl, hl
   645F 29            [11]  306 	add	hl, hl
   6460 ED 5B 91 63   [20]  307 	ld	de,(_mapa)
   6464 19            [11]  308 	add	hl,de
   6465 FD 21 02 00   [14]  309 	ld	iy,#2
   6469 FD 39         [15]  310 	add	iy,sp
   646B FD 4E 00      [19]  311 	ld	c,0 (iy)
   646E CB 39         [ 8]  312 	srl	c
   6470 59            [ 4]  313 	ld	e,c
   6471 16 00         [ 7]  314 	ld	d,#0x00
   6473 19            [11]  315 	add	hl,de
   6474 C9            [10]  316 	ret
                            317 ;src/main.c:144: u8 checkCollision(int direction) { // check optimization
                            318 ;	---------------------------------
                            319 ; Function checkCollision
                            320 ; ---------------------------------
   6475                     321 _checkCollision::
   6475 DD E5         [15]  322 	push	ix
   6477 DD 21 00 00   [14]  323 	ld	ix,#0
   647B DD 39         [15]  324 	add	ix,sp
   647D 21 F8 FF      [10]  325 	ld	hl,#-8
   6480 39            [11]  326 	add	hl,sp
   6481 F9            [ 6]  327 	ld	sp,hl
                            328 ;src/main.c:147: switch (direction) {
   6482 DD CB 05 7E   [20]  329 	bit	7, 5 (ix)
   6486 C2 92 65      [10]  330 	jp	NZ,00105$
   6489 3E 03         [ 7]  331 	ld	a,#0x03
   648B DD BE 04      [19]  332 	cp	a, 4 (ix)
   648E 3E 00         [ 7]  333 	ld	a,#0x00
   6490 DD 9E 05      [19]  334 	sbc	a, 5 (ix)
   6493 E2 98 64      [10]  335 	jp	PO, 00128$
   6496 EE 80         [ 7]  336 	xor	a, #0x80
   6498                     337 00128$:
   6498 FA 92 65      [10]  338 	jp	M,00105$
   649B DD 5E 04      [19]  339 	ld	e,4 (ix)
   649E 16 00         [ 7]  340 	ld	d,#0x00
   64A0 21 A7 64      [10]  341 	ld	hl,#00129$
   64A3 19            [11]  342 	add	hl,de
   64A4 19            [11]  343 	add	hl,de
   64A5 19            [11]  344 	add	hl,de
   64A6 E9            [ 4]  345 	jp	(hl)
   64A7                     346 00129$:
   64A7 C3 B3 64      [10]  347 	jp	00101$
   64AA C3 F8 64      [10]  348 	jp	00102$
   64AD C3 38 65      [10]  349 	jp	00103$
   64B0 C3 66 65      [10]  350 	jp	00104$
                            351 ;src/main.c:148: case 0:
   64B3                     352 00101$:
                            353 ;src/main.c:149: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   64B3 21 30 63      [10]  354 	ld	hl, #(_prota + 0x0001) + 0
   64B6 46            [ 7]  355 	ld	b,(hl)
   64B7 3A 2F 63      [13]  356 	ld	a, (#_prota + 0)
   64BA C6 04         [ 7]  357 	add	a, #0x04
   64BC C5            [11]  358 	push	bc
   64BD 33            [ 6]  359 	inc	sp
   64BE F5            [11]  360 	push	af
   64BF 33            [ 6]  361 	inc	sp
   64C0 CD 4D 64      [17]  362 	call	_getTilePtr
   64C3 F1            [10]  363 	pop	af
   64C4 DD 75 FE      [19]  364 	ld	-2 (ix),l
   64C7 DD 74 FF      [19]  365 	ld	-1 (ix),h
                            366 ;src/main.c:150: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   64CA 3A 30 63      [13]  367 	ld	a, (#(_prota + 0x0001) + 0)
   64CD C6 14         [ 7]  368 	add	a, #0x14
   64CF 47            [ 4]  369 	ld	b,a
   64D0 3A 2F 63      [13]  370 	ld	a, (#_prota + 0)
   64D3 C6 04         [ 7]  371 	add	a, #0x04
   64D5 C5            [11]  372 	push	bc
   64D6 33            [ 6]  373 	inc	sp
   64D7 F5            [11]  374 	push	af
   64D8 33            [ 6]  375 	inc	sp
   64D9 CD 4D 64      [17]  376 	call	_getTilePtr
   64DC F1            [10]  377 	pop	af
   64DD 4D            [ 4]  378 	ld	c,l
   64DE 44            [ 4]  379 	ld	b,h
                            380 ;src/main.c:151: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   64DF 3A 30 63      [13]  381 	ld	a, (#(_prota + 0x0001) + 0)
   64E2 C6 0B         [ 7]  382 	add	a, #0x0B
   64E4 57            [ 4]  383 	ld	d,a
   64E5 3A 2F 63      [13]  384 	ld	a, (#_prota + 0)
   64E8 C6 04         [ 7]  385 	add	a, #0x04
   64EA C5            [11]  386 	push	bc
   64EB D5            [11]  387 	push	de
   64EC 33            [ 6]  388 	inc	sp
   64ED F5            [11]  389 	push	af
   64EE 33            [ 6]  390 	inc	sp
   64EF CD 4D 64      [17]  391 	call	_getTilePtr
   64F2 F1            [10]  392 	pop	af
   64F3 EB            [ 4]  393 	ex	de,hl
   64F4 C1            [10]  394 	pop	bc
                            395 ;src/main.c:152: break;
   64F5 C3 92 65      [10]  396 	jp	00105$
                            397 ;src/main.c:153: case 1:
   64F8                     398 00102$:
                            399 ;src/main.c:154: headTile  = getTilePtr(prota.x - 1, prota.y);
   64F8 21 30 63      [10]  400 	ld	hl, #(_prota + 0x0001) + 0
   64FB 46            [ 7]  401 	ld	b,(hl)
   64FC 21 2F 63      [10]  402 	ld	hl, #_prota + 0
   64FF 56            [ 7]  403 	ld	d,(hl)
   6500 15            [ 4]  404 	dec	d
   6501 4A            [ 4]  405 	ld	c, d
   6502 C5            [11]  406 	push	bc
   6503 CD 4D 64      [17]  407 	call	_getTilePtr
   6506 F1            [10]  408 	pop	af
   6507 DD 75 FE      [19]  409 	ld	-2 (ix),l
   650A DD 74 FF      [19]  410 	ld	-1 (ix),h
                            411 ;src/main.c:155: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
   650D 3A 30 63      [13]  412 	ld	a, (#(_prota + 0x0001) + 0)
   6510 C6 14         [ 7]  413 	add	a, #0x14
   6512 47            [ 4]  414 	ld	b,a
   6513 21 2F 63      [10]  415 	ld	hl, #_prota + 0
   6516 56            [ 7]  416 	ld	d,(hl)
   6517 15            [ 4]  417 	dec	d
   6518 4A            [ 4]  418 	ld	c, d
   6519 C5            [11]  419 	push	bc
   651A CD 4D 64      [17]  420 	call	_getTilePtr
   651D F1            [10]  421 	pop	af
   651E 4D            [ 4]  422 	ld	c,l
   651F 44            [ 4]  423 	ld	b,h
                            424 ;src/main.c:156: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
   6520 3A 30 63      [13]  425 	ld	a, (#(_prota + 0x0001) + 0)
   6523 C6 0B         [ 7]  426 	add	a, #0x0B
   6525 57            [ 4]  427 	ld	d,a
   6526 3A 2F 63      [13]  428 	ld	a, (#_prota + 0)
   6529 C6 FF         [ 7]  429 	add	a,#0xFF
   652B C5            [11]  430 	push	bc
   652C D5            [11]  431 	push	de
   652D 33            [ 6]  432 	inc	sp
   652E F5            [11]  433 	push	af
   652F 33            [ 6]  434 	inc	sp
   6530 CD 4D 64      [17]  435 	call	_getTilePtr
   6533 F1            [10]  436 	pop	af
   6534 EB            [ 4]  437 	ex	de,hl
   6535 C1            [10]  438 	pop	bc
                            439 ;src/main.c:157: break;
   6536 18 5A         [12]  440 	jr	00105$
                            441 ;src/main.c:158: case 2:
   6538                     442 00103$:
                            443 ;src/main.c:159: headTile   = getTilePtr(prota.x, prota.y - 2);
   6538 21 30 63      [10]  444 	ld	hl, #(_prota + 0x0001) + 0
   653B 46            [ 7]  445 	ld	b,(hl)
   653C 05            [ 4]  446 	dec	b
   653D 05            [ 4]  447 	dec	b
   653E 21 2F 63      [10]  448 	ld	hl, #_prota + 0
   6541 4E            [ 7]  449 	ld	c, (hl)
   6542 C5            [11]  450 	push	bc
   6543 CD 4D 64      [17]  451 	call	_getTilePtr
   6546 F1            [10]  452 	pop	af
   6547 DD 75 FE      [19]  453 	ld	-2 (ix),l
   654A DD 74 FF      [19]  454 	ld	-1 (ix),h
                            455 ;src/main.c:160: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
   654D 3A 30 63      [13]  456 	ld	a, (#(_prota + 0x0001) + 0)
   6550 47            [ 4]  457 	ld	b,a
   6551 05            [ 4]  458 	dec	b
   6552 05            [ 4]  459 	dec	b
   6553 3A 2F 63      [13]  460 	ld	a, (#_prota + 0)
   6556 C6 03         [ 7]  461 	add	a, #0x03
   6558 C5            [11]  462 	push	bc
   6559 33            [ 6]  463 	inc	sp
   655A F5            [11]  464 	push	af
   655B 33            [ 6]  465 	inc	sp
   655C CD 4D 64      [17]  466 	call	_getTilePtr
   655F F1            [10]  467 	pop	af
   6560 4D            [ 4]  468 	ld	c,l
   6561 44            [ 4]  469 	ld	b,h
                            470 ;src/main.c:161: *waistTile = 0;
   6562 AF            [ 4]  471 	xor	a, a
   6563 12            [ 7]  472 	ld	(de),a
                            473 ;src/main.c:162: break;
   6564 18 2C         [12]  474 	jr	00105$
                            475 ;src/main.c:163: case 3:
   6566                     476 00104$:
                            477 ;src/main.c:164: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
   6566 3A 30 63      [13]  478 	ld	a, (#(_prota + 0x0001) + 0)
   6569 C6 16         [ 7]  479 	add	a, #0x16
   656B 47            [ 4]  480 	ld	b,a
   656C 21 2F 63      [10]  481 	ld	hl, #_prota + 0
   656F 4E            [ 7]  482 	ld	c, (hl)
   6570 C5            [11]  483 	push	bc
   6571 CD 4D 64      [17]  484 	call	_getTilePtr
   6574 F1            [10]  485 	pop	af
   6575 DD 75 FE      [19]  486 	ld	-2 (ix),l
   6578 DD 74 FF      [19]  487 	ld	-1 (ix),h
                            488 ;src/main.c:165: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   657B 3A 30 63      [13]  489 	ld	a, (#(_prota + 0x0001) + 0)
   657E C6 16         [ 7]  490 	add	a, #0x16
   6580 47            [ 4]  491 	ld	b,a
   6581 3A 2F 63      [13]  492 	ld	a, (#_prota + 0)
   6584 C6 03         [ 7]  493 	add	a, #0x03
   6586 C5            [11]  494 	push	bc
   6587 33            [ 6]  495 	inc	sp
   6588 F5            [11]  496 	push	af
   6589 33            [ 6]  497 	inc	sp
   658A CD 4D 64      [17]  498 	call	_getTilePtr
   658D F1            [10]  499 	pop	af
   658E 4D            [ 4]  500 	ld	c,l
   658F 44            [ 4]  501 	ld	b,h
                            502 ;src/main.c:166: *waistTile = 0;
   6590 AF            [ 4]  503 	xor	a, a
   6591 12            [ 7]  504 	ld	(de),a
                            505 ;src/main.c:168: }
   6592                     506 00105$:
                            507 ;src/main.c:170: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   6592 DD 6E FE      [19]  508 	ld	l,-2 (ix)
   6595 DD 66 FF      [19]  509 	ld	h,-1 (ix)
   6598 6E            [ 7]  510 	ld	l,(hl)
   6599 3E 02         [ 7]  511 	ld	a,#0x02
   659B 95            [ 4]  512 	sub	a, l
   659C 38 0E         [12]  513 	jr	C,00106$
   659E 0A            [ 7]  514 	ld	a,(bc)
   659F 4F            [ 4]  515 	ld	c,a
   65A0 3E 02         [ 7]  516 	ld	a,#0x02
   65A2 91            [ 4]  517 	sub	a, c
   65A3 38 07         [12]  518 	jr	C,00106$
   65A5 1A            [ 7]  519 	ld	a,(de)
   65A6 4F            [ 4]  520 	ld	c,a
   65A7 3E 02         [ 7]  521 	ld	a,#0x02
   65A9 91            [ 4]  522 	sub	a, c
   65AA 30 04         [12]  523 	jr	NC,00107$
   65AC                     524 00106$:
                            525 ;src/main.c:171: return 1;
   65AC 2E 01         [ 7]  526 	ld	l,#0x01
   65AE 18 02         [12]  527 	jr	00110$
   65B0                     528 00107$:
                            529 ;src/main.c:173: return 0;
   65B0 2E 00         [ 7]  530 	ld	l,#0x00
   65B2                     531 00110$:
   65B2 DD F9         [10]  532 	ld	sp, ix
   65B4 DD E1         [14]  533 	pop	ix
   65B6 C9            [10]  534 	ret
                            535 ;src/main.c:177: void dibujarEnemigo() {
                            536 ;	---------------------------------
                            537 ; Function dibujarEnemigo
                            538 ; ---------------------------------
   65B7                     539 _dibujarEnemigo::
                            540 ;src/main.c:178: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy.x, enemy.y);
   65B7 21 28 63      [10]  541 	ld	hl, #_enemy + 1
   65BA 56            [ 7]  542 	ld	d,(hl)
   65BB 21 27 63      [10]  543 	ld	hl, #_enemy + 0
   65BE 46            [ 7]  544 	ld	b,(hl)
   65BF D5            [11]  545 	push	de
   65C0 33            [ 6]  546 	inc	sp
   65C1 C5            [11]  547 	push	bc
   65C2 33            [ 6]  548 	inc	sp
   65C3 21 00 C0      [10]  549 	ld	hl,#0xC000
   65C6 E5            [11]  550 	push	hl
   65C7 CD CA 62      [17]  551 	call	_cpct_getScreenPtr
   65CA EB            [ 4]  552 	ex	de,hl
                            553 ;src/main.c:179: cpct_drawSpriteMaskedAlignedTable (enemy.sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   65CB ED 4B 2B 63   [20]  554 	ld	bc, (#_enemy + 4)
   65CF 21 00 3E      [10]  555 	ld	hl,#_g_tablatrans
   65D2 E5            [11]  556 	push	hl
   65D3 21 08 1B      [10]  557 	ld	hl,#0x1B08
   65D6 E5            [11]  558 	push	hl
   65D7 D5            [11]  559 	push	de
   65D8 C5            [11]  560 	push	bc
   65D9 CD EA 62      [17]  561 	call	_cpct_drawSpriteMaskedAlignedTable
   65DC C9            [10]  562 	ret
                            563 ;src/main.c:182: void borrarEnemigo() {
                            564 ;	---------------------------------
                            565 ; Function borrarEnemigo
                            566 ; ---------------------------------
   65DD                     567 _borrarEnemigo::
   65DD DD E5         [15]  568 	push	ix
   65DF DD 21 00 00   [14]  569 	ld	ix,#0
   65E3 DD 39         [15]  570 	add	ix,sp
   65E5 3B            [ 6]  571 	dec	sp
                            572 ;src/main.c:184: u8 w = 4 + (enemy.px & 1);
   65E6 21 29 63      [10]  573 	ld	hl, #_enemy + 2
   65E9 4E            [ 7]  574 	ld	c,(hl)
   65EA 79            [ 4]  575 	ld	a,c
   65EB E6 01         [ 7]  576 	and	a, #0x01
   65ED 47            [ 4]  577 	ld	b,a
   65EE 04            [ 4]  578 	inc	b
   65EF 04            [ 4]  579 	inc	b
   65F0 04            [ 4]  580 	inc	b
   65F1 04            [ 4]  581 	inc	b
                            582 ;src/main.c:187: u8 h = 7 + (enemy.py & 2 ? 1 : 0);
   65F2 21 2A 63      [10]  583 	ld	hl, #_enemy + 3
   65F5 5E            [ 7]  584 	ld	e,(hl)
   65F6 CB 4B         [ 8]  585 	bit	1, e
   65F8 28 04         [12]  586 	jr	Z,00103$
   65FA 3E 01         [ 7]  587 	ld	a,#0x01
   65FC 18 02         [12]  588 	jr	00104$
   65FE                     589 00103$:
   65FE 3E 00         [ 7]  590 	ld	a,#0x00
   6600                     591 00104$:
   6600 C6 07         [ 7]  592 	add	a, #0x07
   6602 DD 77 FF      [19]  593 	ld	-1 (ix),a
                            594 ;src/main.c:189: cpct_etm_drawTileBox2x4 (enemy.px / 2, (enemy.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   6605 FD 2A 91 63   [20]  595 	ld	iy,(_mapa)
   6609 16 00         [ 7]  596 	ld	d,#0x00
   660B 63            [ 4]  597 	ld	h,e
   660C 6A            [ 4]  598 	ld	l,d
   660D CB 7A         [ 8]  599 	bit	7, d
   660F 28 05         [12]  600 	jr	Z,00105$
   6611 13            [ 6]  601 	inc	de
   6612 13            [ 6]  602 	inc	de
   6613 13            [ 6]  603 	inc	de
   6614 63            [ 4]  604 	ld	h,e
   6615 6A            [ 4]  605 	ld	l,d
   6616                     606 00105$:
   6616 5C            [ 4]  607 	ld	e, h
   6617 55            [ 4]  608 	ld	d, l
   6618 CB 2A         [ 8]  609 	sra	d
   661A CB 1B         [ 8]  610 	rr	e
   661C CB 2A         [ 8]  611 	sra	d
   661E CB 1B         [ 8]  612 	rr	e
   6620 51            [ 4]  613 	ld	d,c
   6621 CB 3A         [ 8]  614 	srl	d
   6623 FD E5         [15]  615 	push	iy
   6625 21 00 C0      [10]  616 	ld	hl,#0xC000
   6628 E5            [11]  617 	push	hl
   6629 3E 28         [ 7]  618 	ld	a,#0x28
   662B F5            [11]  619 	push	af
   662C 33            [ 6]  620 	inc	sp
   662D DD 7E FF      [19]  621 	ld	a,-1 (ix)
   6630 F5            [11]  622 	push	af
   6631 33            [ 6]  623 	inc	sp
   6632 C5            [11]  624 	push	bc
   6633 33            [ 6]  625 	inc	sp
   6634 7B            [ 4]  626 	ld	a,e
   6635 F5            [11]  627 	push	af
   6636 33            [ 6]  628 	inc	sp
   6637 D5            [11]  629 	push	de
   6638 33            [ 6]  630 	inc	sp
   6639 CD 7B 58      [17]  631 	call	_cpct_etm_drawTileBox2x4
   663C 33            [ 6]  632 	inc	sp
   663D DD E1         [14]  633 	pop	ix
   663F C9            [10]  634 	ret
                            635 ;src/main.c:194: void redibujarEnemigo() {
                            636 ;	---------------------------------
                            637 ; Function redibujarEnemigo
                            638 ; ---------------------------------
   6640                     639 _redibujarEnemigo::
                            640 ;src/main.c:195: borrarEnemigo();
   6640 CD DD 65      [17]  641 	call	_borrarEnemigo
                            642 ;src/main.c:196: enemy.px = enemy.x;
   6643 01 29 63      [10]  643 	ld	bc,#_enemy + 2
   6646 3A 27 63      [13]  644 	ld	a, (#_enemy + 0)
   6649 02            [ 7]  645 	ld	(bc),a
                            646 ;src/main.c:197: enemy.py = enemy.y;
   664A 01 2A 63      [10]  647 	ld	bc,#_enemy + 3
   664D 3A 28 63      [13]  648 	ld	a, (#_enemy + 1)
   6650 02            [ 7]  649 	ld	(bc),a
                            650 ;src/main.c:198: dibujarEnemigo();
   6651 C3 B7 65      [10]  651 	jp  _dibujarEnemigo
                            652 ;src/main.c:201: void moverEnemigo(){
                            653 ;	---------------------------------
                            654 ; Function moverEnemigo
                            655 ; ---------------------------------
   6654                     656 _moverEnemigo::
                            657 ;src/main.c:203: if(enemy.mira == M_abajo){
   6654 21 2E 63      [10]  658 	ld	hl, #(_enemy + 0x0007) + 0
   6657 46            [ 7]  659 	ld	b,(hl)
                            660 ;src/main.c:204: if( *getTilePtr(enemy.x, enemy.y + G_ENEMY_H + 2) <= 2
   6658 11 28 63      [10]  661 	ld	de,#_enemy + 1
   665B 1A            [ 7]  662 	ld	a,(de)
   665C 4F            [ 4]  663 	ld	c,a
   665D 21 27 63      [10]  664 	ld	hl, #_enemy + 0
   6660 6E            [ 7]  665 	ld	l,(hl)
                            666 ;src/main.c:203: if(enemy.mira == M_abajo){
   6661 78            [ 4]  667 	ld	a,b
   6662 D6 03         [ 7]  668 	sub	a, #0x03
   6664 20 59         [12]  669 	jr	NZ,00112$
                            670 ;src/main.c:204: if( *getTilePtr(enemy.x, enemy.y + G_ENEMY_H + 2) <= 2
   6666 79            [ 4]  671 	ld	a,c
   6667 C6 1D         [ 7]  672 	add	a, #0x1D
   6669 67            [ 4]  673 	ld	h,a
   666A D5            [11]  674 	push	de
   666B E5            [11]  675 	push	hl
   666C 33            [ 6]  676 	inc	sp
   666D 7D            [ 4]  677 	ld	a,l
   666E F5            [11]  678 	push	af
   666F 33            [ 6]  679 	inc	sp
   6670 CD 4D 64      [17]  680 	call	_getTilePtr
   6673 F1            [10]  681 	pop	af
   6674 D1            [10]  682 	pop	de
   6675 4E            [ 7]  683 	ld	c,(hl)
   6676 3E 02         [ 7]  684 	ld	a,#0x02
   6678 91            [ 4]  685 	sub	a, c
   6679 38 3E         [12]  686 	jr	C,00102$
                            687 ;src/main.c:205: && *getTilePtr(enemy.x + G_ENEMY_W / 2, enemy.y + G_ENEMY_H + 2) <= 2
   667B 1A            [ 7]  688 	ld	a,(de)
   667C C6 1D         [ 7]  689 	add	a, #0x1D
   667E 4F            [ 4]  690 	ld	c,a
   667F 3A 27 63      [13]  691 	ld	a, (#_enemy + 0)
   6682 47            [ 4]  692 	ld	b,a
   6683 04            [ 4]  693 	inc	b
   6684 04            [ 4]  694 	inc	b
   6685 04            [ 4]  695 	inc	b
   6686 04            [ 4]  696 	inc	b
   6687 D5            [11]  697 	push	de
   6688 79            [ 4]  698 	ld	a,c
   6689 F5            [11]  699 	push	af
   668A 33            [ 6]  700 	inc	sp
   668B C5            [11]  701 	push	bc
   668C 33            [ 6]  702 	inc	sp
   668D CD 4D 64      [17]  703 	call	_getTilePtr
   6690 F1            [10]  704 	pop	af
   6691 D1            [10]  705 	pop	de
   6692 4E            [ 7]  706 	ld	c,(hl)
   6693 3E 02         [ 7]  707 	ld	a,#0x02
   6695 91            [ 4]  708 	sub	a, c
   6696 38 21         [12]  709 	jr	C,00102$
                            710 ;src/main.c:206: && *getTilePtr(enemy.x + G_ENEMY_W, enemy.y + G_ENEMY_H + 2) <= 2)
   6698 1A            [ 7]  711 	ld	a,(de)
   6699 C6 1D         [ 7]  712 	add	a, #0x1D
   669B 47            [ 4]  713 	ld	b,a
   669C 3A 27 63      [13]  714 	ld	a, (#_enemy + 0)
   669F C6 08         [ 7]  715 	add	a, #0x08
   66A1 D5            [11]  716 	push	de
   66A2 C5            [11]  717 	push	bc
   66A3 33            [ 6]  718 	inc	sp
   66A4 F5            [11]  719 	push	af
   66A5 33            [ 6]  720 	inc	sp
   66A6 CD 4D 64      [17]  721 	call	_getTilePtr
   66A9 F1            [10]  722 	pop	af
   66AA D1            [10]  723 	pop	de
   66AB 4E            [ 7]  724 	ld	c,(hl)
   66AC 3E 02         [ 7]  725 	ld	a,#0x02
   66AE 91            [ 4]  726 	sub	a, c
   66AF 38 08         [12]  727 	jr	C,00102$
                            728 ;src/main.c:209: enemy.y++;
   66B1 1A            [ 7]  729 	ld	a,(de)
   66B2 3C            [ 4]  730 	inc	a
   66B3 12            [ 7]  731 	ld	(de),a
                            732 ;src/main.c:210: enemy.y++;
   66B4 3C            [ 4]  733 	inc	a
   66B5 12            [ 7]  734 	ld	(de),a
                            735 ;src/main.c:211: redibujarEnemigo();
   66B6 C3 40 66      [10]  736 	jp  _redibujarEnemigo
   66B9                     737 00102$:
                            738 ;src/main.c:213: enemy.mira = M_arriba;
   66B9 21 2E 63      [10]  739 	ld	hl,#(_enemy + 0x0007)
   66BC 36 02         [10]  740 	ld	(hl),#0x02
   66BE C9            [10]  741 	ret
   66BF                     742 00112$:
                            743 ;src/main.c:217: if( *getTilePtr(enemy.x, enemy.y - 2) <= 2
   66BF 61            [ 4]  744 	ld	h,c
   66C0 25            [ 4]  745 	dec	h
   66C1 25            [ 4]  746 	dec	h
   66C2 D5            [11]  747 	push	de
   66C3 E5            [11]  748 	push	hl
   66C4 33            [ 6]  749 	inc	sp
   66C5 7D            [ 4]  750 	ld	a,l
   66C6 F5            [11]  751 	push	af
   66C7 33            [ 6]  752 	inc	sp
   66C8 CD 4D 64      [17]  753 	call	_getTilePtr
   66CB F1            [10]  754 	pop	af
   66CC D1            [10]  755 	pop	de
   66CD 4E            [ 7]  756 	ld	c,(hl)
   66CE 3E 02         [ 7]  757 	ld	a,#0x02
   66D0 91            [ 4]  758 	sub	a, c
   66D1 38 3C         [12]  759 	jr	C,00107$
                            760 ;src/main.c:218: && *getTilePtr(enemy.x + G_ENEMY_W / 2, enemy.y - 2) <= 2
   66D3 1A            [ 7]  761 	ld	a,(de)
   66D4 47            [ 4]  762 	ld	b,a
   66D5 05            [ 4]  763 	dec	b
   66D6 05            [ 4]  764 	dec	b
   66D7 3A 27 63      [13]  765 	ld	a, (#_enemy + 0)
   66DA C6 04         [ 7]  766 	add	a, #0x04
   66DC D5            [11]  767 	push	de
   66DD C5            [11]  768 	push	bc
   66DE 33            [ 6]  769 	inc	sp
   66DF F5            [11]  770 	push	af
   66E0 33            [ 6]  771 	inc	sp
   66E1 CD 4D 64      [17]  772 	call	_getTilePtr
   66E4 F1            [10]  773 	pop	af
   66E5 D1            [10]  774 	pop	de
   66E6 4E            [ 7]  775 	ld	c,(hl)
   66E7 3E 02         [ 7]  776 	ld	a,#0x02
   66E9 91            [ 4]  777 	sub	a, c
   66EA 38 23         [12]  778 	jr	C,00107$
                            779 ;src/main.c:219: && *getTilePtr(enemy.x + G_ENEMY_W, enemy.y - 2) <= 2)
   66EC 1A            [ 7]  780 	ld	a,(de)
   66ED 47            [ 4]  781 	ld	b,a
   66EE 05            [ 4]  782 	dec	b
   66EF 05            [ 4]  783 	dec	b
   66F0 3A 27 63      [13]  784 	ld	a, (#_enemy + 0)
   66F3 C6 08         [ 7]  785 	add	a, #0x08
   66F5 D5            [11]  786 	push	de
   66F6 C5            [11]  787 	push	bc
   66F7 33            [ 6]  788 	inc	sp
   66F8 F5            [11]  789 	push	af
   66F9 33            [ 6]  790 	inc	sp
   66FA CD 4D 64      [17]  791 	call	_getTilePtr
   66FD F1            [10]  792 	pop	af
   66FE D1            [10]  793 	pop	de
   66FF 4E            [ 7]  794 	ld	c,(hl)
   6700 3E 02         [ 7]  795 	ld	a,#0x02
   6702 91            [ 4]  796 	sub	a, c
   6703 38 0A         [12]  797 	jr	C,00107$
                            798 ;src/main.c:222: enemy.y--;
   6705 1A            [ 7]  799 	ld	a,(de)
   6706 C6 FF         [ 7]  800 	add	a,#0xFF
   6708 12            [ 7]  801 	ld	(de),a
                            802 ;src/main.c:223: enemy.y--;
   6709 C6 FF         [ 7]  803 	add	a,#0xFF
   670B 12            [ 7]  804 	ld	(de),a
                            805 ;src/main.c:224: redibujarEnemigo();
   670C C3 40 66      [10]  806 	jp  _redibujarEnemigo
   670F                     807 00107$:
                            808 ;src/main.c:226: enemy.mira = M_abajo;
   670F 21 2E 63      [10]  809 	ld	hl,#(_enemy + 0x0007)
   6712 36 03         [10]  810 	ld	(hl),#0x03
   6714 C9            [10]  811 	ret
                            812 ;src/main.c:231: void avanzarMapa() {
                            813 ;	---------------------------------
                            814 ; Function avanzarMapa
                            815 ; ---------------------------------
   6715                     816 _avanzarMapa::
                            817 ;src/main.c:232: if(num_mapa < NUM_MAPAS -1) {
   6715 3A 93 63      [13]  818 	ld	a,(#_num_mapa + 0)
   6718 D6 02         [ 7]  819 	sub	a, #0x02
   671A D2 3F 6C      [10]  820 	jp	NC,_menuFin
                            821 ;src/main.c:233: mapa = mapas[++num_mapa];
   671D 21 93 63      [10]  822 	ld	hl, #_num_mapa+0
   6720 34            [11]  823 	inc	(hl)
   6721 FD 21 93 63   [14]  824 	ld	iy,#_num_mapa
   6725 FD 6E 00      [19]  825 	ld	l,0 (iy)
   6728 26 00         [ 7]  826 	ld	h,#0x00
   672A 29            [11]  827 	add	hl, hl
   672B 11 AA 63      [10]  828 	ld	de,#_mapas
   672E 19            [11]  829 	add	hl,de
   672F 7E            [ 7]  830 	ld	a,(hl)
   6730 FD 21 91 63   [14]  831 	ld	iy,#_mapa
   6734 FD 77 00      [19]  832 	ld	0 (iy),a
   6737 23            [ 6]  833 	inc	hl
   6738 7E            [ 7]  834 	ld	a,(hl)
   6739 32 92 63      [13]  835 	ld	(#_mapa + 1),a
                            836 ;src/main.c:234: enemy.x = prota.px = 2;
   673C 21 31 63      [10]  837 	ld	hl,#(_prota + 0x0002)
   673F 36 02         [10]  838 	ld	(hl),#0x02
   6741 21 27 63      [10]  839 	ld	hl,#_enemy
   6744 36 02         [10]  840 	ld	(hl),#0x02
                            841 ;src/main.c:235: prota.mover = SI;
   6746 21 35 63      [10]  842 	ld	hl,#(_prota + 0x0006)
                            843 ;src/main.c:236: dibujarMapa();
                            844 ;src/main.c:239: menuFin();
   6749 36 01         [10]  845 	ld	(hl), #0x01
   674B C3 94 63      [10]  846 	jp	_dibujarMapa
                            847 ;src/main.c:243: void moverIzquierda() {
                            848 ;	---------------------------------
                            849 ; Function moverIzquierda
                            850 ; ---------------------------------
   674E                     851 _moverIzquierda::
                            852 ;src/main.c:244: prota.mira = M_izquierda;
   674E 01 2F 63      [10]  853 	ld	bc,#_prota+0
   6751 21 36 63      [10]  854 	ld	hl,#(_prota + 0x0007)
   6754 36 01         [10]  855 	ld	(hl),#0x01
                            856 ;src/main.c:245: if (!checkCollision(M_izquierda)) {
   6756 C5            [11]  857 	push	bc
   6757 21 01 00      [10]  858 	ld	hl,#0x0001
   675A E5            [11]  859 	push	hl
   675B CD 75 64      [17]  860 	call	_checkCollision
   675E F1            [10]  861 	pop	af
   675F C1            [10]  862 	pop	bc
   6760 7D            [ 4]  863 	ld	a,l
   6761 B7            [ 4]  864 	or	a, a
   6762 C0            [11]  865 	ret	NZ
                            866 ;src/main.c:246: prota.x--;
   6763 0A            [ 7]  867 	ld	a,(bc)
   6764 C6 FF         [ 7]  868 	add	a,#0xFF
   6766 02            [ 7]  869 	ld	(bc),a
                            870 ;src/main.c:247: prota.mover = SI;
   6767 21 35 63      [10]  871 	ld	hl,#(_prota + 0x0006)
   676A 36 01         [10]  872 	ld	(hl),#0x01
   676C C9            [10]  873 	ret
                            874 ;src/main.c:251: void moverDerecha() {
                            875 ;	---------------------------------
                            876 ; Function moverDerecha
                            877 ; ---------------------------------
   676D                     878 _moverDerecha::
                            879 ;src/main.c:252: prota.mira = M_derecha;
   676D 21 36 63      [10]  880 	ld	hl,#(_prota + 0x0007)
   6770 36 00         [10]  881 	ld	(hl),#0x00
                            882 ;src/main.c:253: if (!checkCollision(M_derecha)) {
   6772 21 00 00      [10]  883 	ld	hl,#0x0000
   6775 E5            [11]  884 	push	hl
   6776 CD 75 64      [17]  885 	call	_checkCollision
   6779 F1            [10]  886 	pop	af
   677A 7D            [ 4]  887 	ld	a,l
                            888 ;src/main.c:254: prota.x++;
   677B 21 2F 63      [10]  889 	ld	hl, #_prota + 0
   677E 5E            [ 7]  890 	ld	e,(hl)
                            891 ;src/main.c:253: if (!checkCollision(M_derecha)) {
   677F B7            [ 4]  892 	or	a, a
   6780 20 0B         [12]  893 	jr	NZ,00106$
                            894 ;src/main.c:254: prota.x++;
   6782 1C            [ 4]  895 	inc	e
   6783 21 2F 63      [10]  896 	ld	hl,#_prota
   6786 73            [ 7]  897 	ld	(hl),e
                            898 ;src/main.c:255: prota.mover = SI;
   6787 21 35 63      [10]  899 	ld	hl,#(_prota + 0x0006)
   678A 36 01         [10]  900 	ld	(hl),#0x01
   678C C9            [10]  901 	ret
   678D                     902 00106$:
                            903 ;src/main.c:256: }else if ( prota.x > 68 && prota.y >72 && prota.y < 80){  //TODO que avance solo si estamos en el centro
   678D 3E 44         [ 7]  904 	ld	a,#0x44
   678F 93            [ 4]  905 	sub	a, e
   6790 D0            [11]  906 	ret	NC
   6791 21 30 63      [10]  907 	ld	hl, #_prota + 1
   6794 4E            [ 7]  908 	ld	c,(hl)
   6795 3E 48         [ 7]  909 	ld	a,#0x48
   6797 91            [ 4]  910 	sub	a, c
   6798 D0            [11]  911 	ret	NC
   6799 79            [ 4]  912 	ld	a,c
   679A D6 50         [ 7]  913 	sub	a, #0x50
   679C D0            [11]  914 	ret	NC
                            915 ;src/main.c:257: avanzarMapa();
   679D C3 15 67      [10]  916 	jp  _avanzarMapa
                            917 ;src/main.c:261: void moverArriba() {
                            918 ;	---------------------------------
                            919 ; Function moverArriba
                            920 ; ---------------------------------
   67A0                     921 _moverArriba::
                            922 ;src/main.c:262: prota.mira = M_arriba;
   67A0 21 36 63      [10]  923 	ld	hl,#(_prota + 0x0007)
   67A3 36 02         [10]  924 	ld	(hl),#0x02
                            925 ;src/main.c:263: if (!checkCollision(M_arriba)) {
   67A5 21 02 00      [10]  926 	ld	hl,#0x0002
   67A8 E5            [11]  927 	push	hl
   67A9 CD 75 64      [17]  928 	call	_checkCollision
   67AC F1            [10]  929 	pop	af
   67AD 7D            [ 4]  930 	ld	a,l
   67AE B7            [ 4]  931 	or	a, a
   67AF C0            [11]  932 	ret	NZ
                            933 ;src/main.c:264: prota.y--;
   67B0 21 30 63      [10]  934 	ld	hl,#_prota + 1
   67B3 4E            [ 7]  935 	ld	c,(hl)
   67B4 0D            [ 4]  936 	dec	c
   67B5 71            [ 7]  937 	ld	(hl),c
                            938 ;src/main.c:265: prota.y--;
   67B6 0D            [ 4]  939 	dec	c
   67B7 71            [ 7]  940 	ld	(hl),c
                            941 ;src/main.c:266: prota.mover  = SI;
   67B8 21 35 63      [10]  942 	ld	hl,#(_prota + 0x0006)
   67BB 36 01         [10]  943 	ld	(hl),#0x01
   67BD C9            [10]  944 	ret
                            945 ;src/main.c:270: void moverAbajo() {
                            946 ;	---------------------------------
                            947 ; Function moverAbajo
                            948 ; ---------------------------------
   67BE                     949 _moverAbajo::
                            950 ;src/main.c:271: prota.mira = M_abajo;
   67BE 21 36 63      [10]  951 	ld	hl,#(_prota + 0x0007)
   67C1 36 03         [10]  952 	ld	(hl),#0x03
                            953 ;src/main.c:272: if (!checkCollision(M_abajo)) {
   67C3 21 03 00      [10]  954 	ld	hl,#0x0003
   67C6 E5            [11]  955 	push	hl
   67C7 CD 75 64      [17]  956 	call	_checkCollision
   67CA F1            [10]  957 	pop	af
   67CB 7D            [ 4]  958 	ld	a,l
   67CC B7            [ 4]  959 	or	a, a
   67CD C0            [11]  960 	ret	NZ
                            961 ;src/main.c:273: prota.y++;
   67CE 01 30 63      [10]  962 	ld	bc,#_prota + 1
   67D1 0A            [ 7]  963 	ld	a,(bc)
   67D2 3C            [ 4]  964 	inc	a
   67D3 02            [ 7]  965 	ld	(bc),a
                            966 ;src/main.c:274: prota.y++;
   67D4 3C            [ 4]  967 	inc	a
   67D5 02            [ 7]  968 	ld	(bc),a
                            969 ;src/main.c:275: prota.mover  = SI;
   67D6 21 35 63      [10]  970 	ld	hl,#(_prota + 0x0006)
   67D9 36 01         [10]  971 	ld	(hl),#0x01
   67DB C9            [10]  972 	ret
                            973 ;src/main.c:279: void dibujarCuchillo(TKnife* actual) {
                            974 ;	---------------------------------
                            975 ; Function dibujarCuchillo
                            976 ; ---------------------------------
   67DC                     977 _dibujarCuchillo::
   67DC DD E5         [15]  978 	push	ix
   67DE DD 21 00 00   [14]  979 	ld	ix,#0
   67E2 DD 39         [15]  980 	add	ix,sp
   67E4 F5            [11]  981 	push	af
   67E5 F5            [11]  982 	push	af
                            983 ;src/main.c:280: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, actual->x, actual->y);
   67E6 DD 5E 04      [19]  984 	ld	e,4 (ix)
   67E9 DD 56 05      [19]  985 	ld	d,5 (ix)
   67EC 6B            [ 4]  986 	ld	l, e
   67ED 62            [ 4]  987 	ld	h, d
   67EE 23            [ 6]  988 	inc	hl
   67EF 46            [ 7]  989 	ld	b,(hl)
   67F0 1A            [ 7]  990 	ld	a,(de)
   67F1 D5            [11]  991 	push	de
   67F2 C5            [11]  992 	push	bc
   67F3 33            [ 6]  993 	inc	sp
   67F4 F5            [11]  994 	push	af
   67F5 33            [ 6]  995 	inc	sp
   67F6 21 00 C0      [10]  996 	ld	hl,#0xC000
   67F9 E5            [11]  997 	push	hl
   67FA CD CA 62      [17]  998 	call	_cpct_getScreenPtr
   67FD D1            [10]  999 	pop	de
   67FE E5            [11] 1000 	push	hl
   67FF FD E1         [14] 1001 	pop	iy
                           1002 ;src/main.c:281: if(actual->eje == E_X){
   6801 6B            [ 4] 1003 	ld	l, e
   6802 62            [ 4] 1004 	ld	h, d
   6803 01 08 00      [10] 1005 	ld	bc, #0x0008
   6806 09            [11] 1006 	add	hl, bc
   6807 4E            [ 7] 1007 	ld	c,(hl)
                           1008 ;src/main.c:282: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   6808 FD E5         [15] 1009 	push	iy
   680A F1            [10] 1010 	pop	af
   680B DD 77 FF      [19] 1011 	ld	-1 (ix),a
   680E FD E5         [15] 1012 	push	iy
   6810 3B            [ 6] 1013 	dec	sp
   6811 F1            [10] 1014 	pop	af
   6812 33            [ 6] 1015 	inc	sp
   6813 DD 77 FE      [19] 1016 	ld	-2 (ix),a
   6816 21 04 00      [10] 1017 	ld	hl,#0x0004
   6819 19            [11] 1018 	add	hl,de
   681A E3            [19] 1019 	ex	(sp), hl
                           1020 ;src/main.c:281: if(actual->eje == E_X){
   681B 79            [ 4] 1021 	ld	a,c
   681C B7            [ 4] 1022 	or	a, a
   681D 20 1A         [12] 1023 	jr	NZ,00104$
                           1024 ;src/main.c:282: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   681F 11 00 3E      [10] 1025 	ld	de,#_g_tablatrans+0
   6822 E1            [10] 1026 	pop	hl
   6823 E5            [11] 1027 	push	hl
   6824 4E            [ 7] 1028 	ld	c,(hl)
   6825 23            [ 6] 1029 	inc	hl
   6826 46            [ 7] 1030 	ld	b,(hl)
   6827 D5            [11] 1031 	push	de
   6828 21 04 04      [10] 1032 	ld	hl,#0x0404
   682B E5            [11] 1033 	push	hl
   682C DD 6E FE      [19] 1034 	ld	l,-2 (ix)
   682F DD 66 FF      [19] 1035 	ld	h,-1 (ix)
   6832 E5            [11] 1036 	push	hl
   6833 C5            [11] 1037 	push	bc
   6834 CD EA 62      [17] 1038 	call	_cpct_drawSpriteMaskedAlignedTable
   6837 18 1B         [12] 1039 	jr	00106$
   6839                    1040 00104$:
                           1041 ;src/main.c:285: else if(actual->eje == E_Y){
   6839 0D            [ 4] 1042 	dec	c
   683A 20 18         [12] 1043 	jr	NZ,00106$
                           1044 ;src/main.c:286: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   683C 11 00 3E      [10] 1045 	ld	de,#_g_tablatrans+0
   683F E1            [10] 1046 	pop	hl
   6840 E5            [11] 1047 	push	hl
   6841 4E            [ 7] 1048 	ld	c,(hl)
   6842 23            [ 6] 1049 	inc	hl
   6843 46            [ 7] 1050 	ld	b,(hl)
   6844 D5            [11] 1051 	push	de
   6845 21 02 08      [10] 1052 	ld	hl,#0x0802
   6848 E5            [11] 1053 	push	hl
   6849 DD 6E FE      [19] 1054 	ld	l,-2 (ix)
   684C DD 66 FF      [19] 1055 	ld	h,-1 (ix)
   684F E5            [11] 1056 	push	hl
   6850 C5            [11] 1057 	push	bc
   6851 CD EA 62      [17] 1058 	call	_cpct_drawSpriteMaskedAlignedTable
   6854                    1059 00106$:
   6854 DD F9         [10] 1060 	ld	sp, ix
   6856 DD E1         [14] 1061 	pop	ix
   6858 C9            [10] 1062 	ret
                           1063 ;src/main.c:290: void borrarCuchillo(TKnife* actual) {
                           1064 ;	---------------------------------
                           1065 ; Function borrarCuchillo
                           1066 ; ---------------------------------
   6859                    1067 _borrarCuchillo::
   6859 DD E5         [15] 1068 	push	ix
   685B DD 21 00 00   [14] 1069 	ld	ix,#0
   685F DD 39         [15] 1070 	add	ix,sp
   6861 3B            [ 6] 1071 	dec	sp
                           1072 ;src/main.c:291: u8 w = 2 + (actual->px & 1);
   6862 DD 5E 04      [19] 1073 	ld	e,4 (ix)
   6865 DD 56 05      [19] 1074 	ld	d,5 (ix)
   6868 6B            [ 4] 1075 	ld	l, e
   6869 62            [ 4] 1076 	ld	h, d
   686A 23            [ 6] 1077 	inc	hl
   686B 23            [ 6] 1078 	inc	hl
   686C 4E            [ 7] 1079 	ld	c,(hl)
   686D 79            [ 4] 1080 	ld	a,c
   686E E6 01         [ 7] 1081 	and	a, #0x01
   6870 47            [ 4] 1082 	ld	b,a
   6871 04            [ 4] 1083 	inc	b
   6872 04            [ 4] 1084 	inc	b
                           1085 ;src/main.c:292: u8 h = 2 + (actual->py & 3 ? 1 : 0);
   6873 EB            [ 4] 1086 	ex	de,hl
   6874 23            [ 6] 1087 	inc	hl
   6875 23            [ 6] 1088 	inc	hl
   6876 23            [ 6] 1089 	inc	hl
   6877 5E            [ 7] 1090 	ld	e,(hl)
   6878 7B            [ 4] 1091 	ld	a,e
   6879 E6 03         [ 7] 1092 	and	a, #0x03
   687B 28 04         [12] 1093 	jr	Z,00103$
   687D 3E 01         [ 7] 1094 	ld	a,#0x01
   687F 18 02         [12] 1095 	jr	00104$
   6881                    1096 00103$:
   6881 3E 00         [ 7] 1097 	ld	a,#0x00
   6883                    1098 00104$:
   6883 C6 02         [ 7] 1099 	add	a, #0x02
   6885 DD 77 FF      [19] 1100 	ld	-1 (ix),a
                           1101 ;src/main.c:293: cpct_etm_drawTileBox2x4 (actual->px / 2, (actual->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   6888 FD 2A 91 63   [20] 1102 	ld	iy,(_mapa)
   688C 16 00         [ 7] 1103 	ld	d,#0x00
   688E 63            [ 4] 1104 	ld	h,e
   688F 6A            [ 4] 1105 	ld	l,d
   6890 CB 7A         [ 8] 1106 	bit	7, d
   6892 28 05         [12] 1107 	jr	Z,00105$
   6894 13            [ 6] 1108 	inc	de
   6895 13            [ 6] 1109 	inc	de
   6896 13            [ 6] 1110 	inc	de
   6897 63            [ 4] 1111 	ld	h,e
   6898 6A            [ 4] 1112 	ld	l,d
   6899                    1113 00105$:
   6899 5C            [ 4] 1114 	ld	e, h
   689A 55            [ 4] 1115 	ld	d, l
   689B CB 2A         [ 8] 1116 	sra	d
   689D CB 1B         [ 8] 1117 	rr	e
   689F CB 2A         [ 8] 1118 	sra	d
   68A1 CB 1B         [ 8] 1119 	rr	e
   68A3 51            [ 4] 1120 	ld	d,c
   68A4 CB 3A         [ 8] 1121 	srl	d
   68A6 FD E5         [15] 1122 	push	iy
   68A8 21 00 C0      [10] 1123 	ld	hl,#0xC000
   68AB E5            [11] 1124 	push	hl
   68AC 3E 28         [ 7] 1125 	ld	a,#0x28
   68AE F5            [11] 1126 	push	af
   68AF 33            [ 6] 1127 	inc	sp
   68B0 DD 7E FF      [19] 1128 	ld	a,-1 (ix)
   68B3 F5            [11] 1129 	push	af
   68B4 33            [ 6] 1130 	inc	sp
   68B5 C5            [11] 1131 	push	bc
   68B6 33            [ 6] 1132 	inc	sp
   68B7 7B            [ 4] 1133 	ld	a,e
   68B8 F5            [11] 1134 	push	af
   68B9 33            [ 6] 1135 	inc	sp
   68BA D5            [11] 1136 	push	de
   68BB 33            [ 6] 1137 	inc	sp
   68BC CD 7B 58      [17] 1138 	call	_cpct_etm_drawTileBox2x4
   68BF 33            [ 6] 1139 	inc	sp
   68C0 DD E1         [14] 1140 	pop	ix
   68C2 C9            [10] 1141 	ret
                           1142 ;src/main.c:296: void redibujarCuchillo(TKnife* actual) {
                           1143 ;	---------------------------------
                           1144 ; Function redibujarCuchillo
                           1145 ; ---------------------------------
   68C3                    1146 _redibujarCuchillo::
   68C3 DD E5         [15] 1147 	push	ix
   68C5 DD 21 00 00   [14] 1148 	ld	ix,#0
   68C9 DD 39         [15] 1149 	add	ix,sp
                           1150 ;src/main.c:297: borrarCuchillo(actual);
   68CB DD 6E 04      [19] 1151 	ld	l,4 (ix)
   68CE DD 66 05      [19] 1152 	ld	h,5 (ix)
   68D1 E5            [11] 1153 	push	hl
   68D2 CD 59 68      [17] 1154 	call	_borrarCuchillo
   68D5 F1            [10] 1155 	pop	af
                           1156 ;src/main.c:298: actual->px = actual->x;
   68D6 DD 4E 04      [19] 1157 	ld	c,4 (ix)
   68D9 DD 46 05      [19] 1158 	ld	b,5 (ix)
   68DC 59            [ 4] 1159 	ld	e, c
   68DD 50            [ 4] 1160 	ld	d, b
   68DE 13            [ 6] 1161 	inc	de
   68DF 13            [ 6] 1162 	inc	de
   68E0 0A            [ 7] 1163 	ld	a,(bc)
   68E1 12            [ 7] 1164 	ld	(de),a
                           1165 ;src/main.c:299: actual->py = actual->y;
   68E2 59            [ 4] 1166 	ld	e, c
   68E3 50            [ 4] 1167 	ld	d, b
   68E4 13            [ 6] 1168 	inc	de
   68E5 13            [ 6] 1169 	inc	de
   68E6 13            [ 6] 1170 	inc	de
   68E7 69            [ 4] 1171 	ld	l, c
   68E8 60            [ 4] 1172 	ld	h, b
   68E9 23            [ 6] 1173 	inc	hl
   68EA 7E            [ 7] 1174 	ld	a,(hl)
   68EB 12            [ 7] 1175 	ld	(de),a
                           1176 ;src/main.c:300: dibujarCuchillo(actual);
   68EC C5            [11] 1177 	push	bc
   68ED CD DC 67      [17] 1178 	call	_dibujarCuchillo
   68F0 F1            [10] 1179 	pop	af
   68F1 DD E1         [14] 1180 	pop	ix
   68F3 C9            [10] 1181 	ret
                           1182 ;src/main.c:304: void lanzarCuchillo(){
                           1183 ;	---------------------------------
                           1184 ; Function lanzarCuchillo
                           1185 ; ---------------------------------
   68F4                    1186 _lanzarCuchillo::
   68F4 DD E5         [15] 1187 	push	ix
   68F6 DD 21 00 00   [14] 1188 	ld	ix,#0
   68FA DD 39         [15] 1189 	add	ix,sp
   68FC 21 F6 FF      [10] 1190 	ld	hl,#-10
   68FF 39            [11] 1191 	add	hl,sp
   6900 F9            [ 6] 1192 	ld	sp,hl
                           1193 ;src/main.c:306: TKnife* actual = cu;
   6901 01 37 63      [10] 1194 	ld	bc,#_cu+0
                           1195 ;src/main.c:309: while(i>0 && actual->lanzado){
   6904 1E 0A         [ 7] 1196 	ld	e,#0x0A
   6906                    1197 00102$:
   6906 21 06 00      [10] 1198 	ld	hl,#0x0006
   6909 09            [11] 1199 	add	hl,bc
   690A DD 75 FA      [19] 1200 	ld	-6 (ix),l
   690D DD 74 FB      [19] 1201 	ld	-5 (ix),h
   6910 7B            [ 4] 1202 	ld	a,e
   6911 B7            [ 4] 1203 	or	a, a
   6912 28 13         [12] 1204 	jr	Z,00104$
   6914 DD 6E FA      [19] 1205 	ld	l,-6 (ix)
   6917 DD 66 FB      [19] 1206 	ld	h,-5 (ix)
   691A 7E            [ 7] 1207 	ld	a,(hl)
   691B B7            [ 4] 1208 	or	a, a
   691C 28 09         [12] 1209 	jr	Z,00104$
                           1210 ;src/main.c:310: --i;
   691E 1D            [ 4] 1211 	dec	e
                           1212 ;src/main.c:311: actual++;
   691F 21 09 00      [10] 1213 	ld	hl,#0x0009
   6922 09            [11] 1214 	add	hl,bc
   6923 4D            [ 4] 1215 	ld	c,l
   6924 44            [ 4] 1216 	ld	b,h
   6925 18 DF         [12] 1217 	jr	00102$
   6927                    1218 00104$:
                           1219 ;src/main.c:314: if(i>0 && !actual->lanzado){
   6927 7B            [ 4] 1220 	ld	a,e
   6928 B7            [ 4] 1221 	or	a, a
   6929 CA BD 6A      [10] 1222 	jp	Z,00127$
   692C DD 6E FA      [19] 1223 	ld	l,-6 (ix)
   692F DD 66 FB      [19] 1224 	ld	h,-5 (ix)
   6932 7E            [ 7] 1225 	ld	a,(hl)
   6933 B7            [ 4] 1226 	or	a, a
   6934 C2 BD 6A      [10] 1227 	jp	NZ,00127$
                           1228 ;src/main.c:316: if(prota.mira == M_derecha){
   6937 21 36 63      [10] 1229 	ld	hl, #_prota + 7
   693A 5E            [ 7] 1230 	ld	e,(hl)
                           1231 ;src/main.c:318: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
                           1232 ;src/main.c:320: actual->direccion = M_derecha;
   693B 21 07 00      [10] 1233 	ld	hl,#0x0007
   693E 09            [11] 1234 	add	hl,bc
   693F E3            [19] 1235 	ex	(sp), hl
                           1236 ;src/main.c:322: actual->y=prota.y + G_HERO_H /2;
   6940 21 01 00      [10] 1237 	ld	hl,#0x0001
   6943 09            [11] 1238 	add	hl,bc
   6944 DD 75 FE      [19] 1239 	ld	-2 (ix),l
   6947 DD 74 FF      [19] 1240 	ld	-1 (ix),h
                           1241 ;src/main.c:323: actual->sprite=g_knifeX_0;
   694A 21 04 00      [10] 1242 	ld	hl,#0x0004
   694D 09            [11] 1243 	add	hl,bc
   694E DD 75 F8      [19] 1244 	ld	-8 (ix),l
   6951 DD 74 F9      [19] 1245 	ld	-7 (ix),h
                           1246 ;src/main.c:324: actual->eje = E_X;
   6954 21 08 00      [10] 1247 	ld	hl,#0x0008
   6957 09            [11] 1248 	add	hl,bc
   6958 DD 75 FC      [19] 1249 	ld	-4 (ix),l
   695B DD 74 FD      [19] 1250 	ld	-3 (ix),h
                           1251 ;src/main.c:316: if(prota.mira == M_derecha){
   695E 7B            [ 4] 1252 	ld	a,e
   695F B7            [ 4] 1253 	or	a, a
   6960 20 55         [12] 1254 	jr	NZ,00122$
                           1255 ;src/main.c:318: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   6962 3A 30 63      [13] 1256 	ld	a, (#(_prota + 0x0001) + 0)
   6965 C6 0B         [ 7] 1257 	add	a, #0x0B
   6967 57            [ 4] 1258 	ld	d,a
   6968 3A 2F 63      [13] 1259 	ld	a, (#_prota + 0)
   696B C6 0C         [ 7] 1260 	add	a, #0x0C
   696D C5            [11] 1261 	push	bc
   696E D5            [11] 1262 	push	de
   696F 33            [ 6] 1263 	inc	sp
   6970 F5            [11] 1264 	push	af
   6971 33            [ 6] 1265 	inc	sp
   6972 CD 4D 64      [17] 1266 	call	_getTilePtr
   6975 F1            [10] 1267 	pop	af
   6976 C1            [10] 1268 	pop	bc
   6977 5E            [ 7] 1269 	ld	e,(hl)
   6978 3E 02         [ 7] 1270 	ld	a,#0x02
   697A 93            [ 4] 1271 	sub	a, e
   697B DA BD 6A      [10] 1272 	jp	C,00127$
                           1273 ;src/main.c:319: actual->lanzado = SI;
   697E DD 6E FA      [19] 1274 	ld	l,-6 (ix)
   6981 DD 66 FB      [19] 1275 	ld	h,-5 (ix)
   6984 36 01         [10] 1276 	ld	(hl),#0x01
                           1277 ;src/main.c:320: actual->direccion = M_derecha;
   6986 E1            [10] 1278 	pop	hl
   6987 E5            [11] 1279 	push	hl
   6988 36 00         [10] 1280 	ld	(hl),#0x00
                           1281 ;src/main.c:321: actual->x=prota.x + G_HERO_W;
   698A 3A 2F 63      [13] 1282 	ld	a, (#_prota + 0)
   698D C6 07         [ 7] 1283 	add	a, #0x07
   698F 02            [ 7] 1284 	ld	(bc),a
                           1285 ;src/main.c:322: actual->y=prota.y + G_HERO_H /2;
   6990 3A 30 63      [13] 1286 	ld	a, (#(_prota + 0x0001) + 0)
   6993 C6 0B         [ 7] 1287 	add	a, #0x0B
   6995 DD 6E FE      [19] 1288 	ld	l,-2 (ix)
   6998 DD 66 FF      [19] 1289 	ld	h,-1 (ix)
   699B 77            [ 7] 1290 	ld	(hl),a
                           1291 ;src/main.c:323: actual->sprite=g_knifeX_0;
   699C DD 6E F8      [19] 1292 	ld	l,-8 (ix)
   699F DD 66 F9      [19] 1293 	ld	h,-7 (ix)
   69A2 36 C0         [10] 1294 	ld	(hl),#<(_g_knifeX_0)
   69A4 23            [ 6] 1295 	inc	hl
   69A5 36 54         [10] 1296 	ld	(hl),#>(_g_knifeX_0)
                           1297 ;src/main.c:324: actual->eje = E_X;
   69A7 DD 6E FC      [19] 1298 	ld	l,-4 (ix)
   69AA DD 66 FD      [19] 1299 	ld	h,-3 (ix)
   69AD 36 00         [10] 1300 	ld	(hl),#0x00
                           1301 ;src/main.c:325: dibujarCuchillo(actual);
   69AF C5            [11] 1302 	push	bc
   69B0 CD DC 67      [17] 1303 	call	_dibujarCuchillo
   69B3 F1            [10] 1304 	pop	af
   69B4 C3 BD 6A      [10] 1305 	jp	00127$
   69B7                    1306 00122$:
                           1307 ;src/main.c:328: else if(prota.mira == M_izquierda){
   69B7 7B            [ 4] 1308 	ld	a,e
   69B8 3D            [ 4] 1309 	dec	a
   69B9 20 55         [12] 1310 	jr	NZ,00119$
                           1311 ;src/main.c:329: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   69BB 3A 30 63      [13] 1312 	ld	a, (#(_prota + 0x0001) + 0)
   69BE C6 0B         [ 7] 1313 	add	a, #0x0B
   69C0 57            [ 4] 1314 	ld	d,a
   69C1 3A 2F 63      [13] 1315 	ld	a, (#_prota + 0)
   69C4 C6 F6         [ 7] 1316 	add	a,#0xF6
   69C6 C5            [11] 1317 	push	bc
   69C7 D5            [11] 1318 	push	de
   69C8 33            [ 6] 1319 	inc	sp
   69C9 F5            [11] 1320 	push	af
   69CA 33            [ 6] 1321 	inc	sp
   69CB CD 4D 64      [17] 1322 	call	_getTilePtr
   69CE F1            [10] 1323 	pop	af
   69CF C1            [10] 1324 	pop	bc
   69D0 5E            [ 7] 1325 	ld	e,(hl)
   69D1 3E 02         [ 7] 1326 	ld	a,#0x02
   69D3 93            [ 4] 1327 	sub	a, e
   69D4 DA BD 6A      [10] 1328 	jp	C,00127$
                           1329 ;src/main.c:330: actual->lanzado = SI;
   69D7 DD 6E FA      [19] 1330 	ld	l,-6 (ix)
   69DA DD 66 FB      [19] 1331 	ld	h,-5 (ix)
   69DD 36 01         [10] 1332 	ld	(hl),#0x01
                           1333 ;src/main.c:331: actual->direccion = M_izquierda;
   69DF E1            [10] 1334 	pop	hl
   69E0 E5            [11] 1335 	push	hl
   69E1 36 01         [10] 1336 	ld	(hl),#0x01
                           1337 ;src/main.c:332: actual->x = prota.x - G_KNIFEX_0_W;
   69E3 3A 2F 63      [13] 1338 	ld	a, (#_prota + 0)
   69E6 C6 FC         [ 7] 1339 	add	a,#0xFC
   69E8 02            [ 7] 1340 	ld	(bc),a
                           1341 ;src/main.c:333: actual->y = prota.y + G_HERO_H /2;
   69E9 3A 30 63      [13] 1342 	ld	a, (#(_prota + 0x0001) + 0)
   69EC C6 0B         [ 7] 1343 	add	a, #0x0B
   69EE DD 6E FE      [19] 1344 	ld	l,-2 (ix)
   69F1 DD 66 FF      [19] 1345 	ld	h,-1 (ix)
   69F4 77            [ 7] 1346 	ld	(hl),a
                           1347 ;src/main.c:334: actual->sprite = g_knifeX_1;
   69F5 DD 6E F8      [19] 1348 	ld	l,-8 (ix)
   69F8 DD 66 F9      [19] 1349 	ld	h,-7 (ix)
   69FB 36 D0         [10] 1350 	ld	(hl),#<(_g_knifeX_1)
   69FD 23            [ 6] 1351 	inc	hl
   69FE 36 54         [10] 1352 	ld	(hl),#>(_g_knifeX_1)
                           1353 ;src/main.c:335: actual->eje = E_X;
   6A00 DD 6E FC      [19] 1354 	ld	l,-4 (ix)
   6A03 DD 66 FD      [19] 1355 	ld	h,-3 (ix)
   6A06 36 00         [10] 1356 	ld	(hl),#0x00
                           1357 ;src/main.c:336: dibujarCuchillo(actual);
   6A08 C5            [11] 1358 	push	bc
   6A09 CD DC 67      [17] 1359 	call	_dibujarCuchillo
   6A0C F1            [10] 1360 	pop	af
   6A0D C3 BD 6A      [10] 1361 	jp	00127$
   6A10                    1362 00119$:
                           1363 ;src/main.c:339: else if(prota.mira == M_abajo){
   6A10 7B            [ 4] 1364 	ld	a,e
   6A11 D6 03         [ 7] 1365 	sub	a, #0x03
   6A13 20 54         [12] 1366 	jr	NZ,00116$
                           1367 ;src/main.c:341: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   6A15 3A 30 63      [13] 1368 	ld	a, (#(_prota + 0x0001) + 0)
   6A18 C6 1F         [ 7] 1369 	add	a, #0x1F
   6A1A 57            [ 4] 1370 	ld	d,a
   6A1B 3A 2F 63      [13] 1371 	ld	a, (#_prota + 0)
   6A1E C6 03         [ 7] 1372 	add	a, #0x03
   6A20 C5            [11] 1373 	push	bc
   6A21 D5            [11] 1374 	push	de
   6A22 33            [ 6] 1375 	inc	sp
   6A23 F5            [11] 1376 	push	af
   6A24 33            [ 6] 1377 	inc	sp
   6A25 CD 4D 64      [17] 1378 	call	_getTilePtr
   6A28 F1            [10] 1379 	pop	af
   6A29 C1            [10] 1380 	pop	bc
   6A2A 5E            [ 7] 1381 	ld	e,(hl)
   6A2B 3E 02         [ 7] 1382 	ld	a,#0x02
   6A2D 93            [ 4] 1383 	sub	a, e
   6A2E DA BD 6A      [10] 1384 	jp	C,00127$
                           1385 ;src/main.c:342: actual->lanzado = SI;
   6A31 DD 6E FA      [19] 1386 	ld	l,-6 (ix)
   6A34 DD 66 FB      [19] 1387 	ld	h,-5 (ix)
   6A37 36 01         [10] 1388 	ld	(hl),#0x01
                           1389 ;src/main.c:343: actual->direccion = M_abajo;
   6A39 E1            [10] 1390 	pop	hl
   6A3A E5            [11] 1391 	push	hl
   6A3B 36 03         [10] 1392 	ld	(hl),#0x03
                           1393 ;src/main.c:344: actual->x = prota.x + G_HERO_W / 2;
   6A3D 3A 2F 63      [13] 1394 	ld	a, (#_prota + 0)
   6A40 C6 03         [ 7] 1395 	add	a, #0x03
   6A42 02            [ 7] 1396 	ld	(bc),a
                           1397 ;src/main.c:345: actual->y = prota.y + G_HERO_H;
   6A43 3A 30 63      [13] 1398 	ld	a, (#(_prota + 0x0001) + 0)
   6A46 C6 16         [ 7] 1399 	add	a, #0x16
   6A48 DD 6E FE      [19] 1400 	ld	l,-2 (ix)
   6A4B DD 66 FF      [19] 1401 	ld	h,-1 (ix)
   6A4E 77            [ 7] 1402 	ld	(hl),a
                           1403 ;src/main.c:346: actual->sprite = g_knifeY_0;
   6A4F DD 6E F8      [19] 1404 	ld	l,-8 (ix)
   6A52 DD 66 F9      [19] 1405 	ld	h,-7 (ix)
   6A55 36 A0         [10] 1406 	ld	(hl),#<(_g_knifeY_0)
   6A57 23            [ 6] 1407 	inc	hl
   6A58 36 54         [10] 1408 	ld	(hl),#>(_g_knifeY_0)
                           1409 ;src/main.c:347: actual->eje = E_Y;
   6A5A DD 6E FC      [19] 1410 	ld	l,-4 (ix)
   6A5D DD 66 FD      [19] 1411 	ld	h,-3 (ix)
   6A60 36 01         [10] 1412 	ld	(hl),#0x01
                           1413 ;src/main.c:348: dibujarCuchillo(actual);
   6A62 C5            [11] 1414 	push	bc
   6A63 CD DC 67      [17] 1415 	call	_dibujarCuchillo
   6A66 F1            [10] 1416 	pop	af
   6A67 18 54         [12] 1417 	jr	00127$
   6A69                    1418 00116$:
                           1419 ;src/main.c:351: else if(prota.mira == M_arriba){
   6A69 7B            [ 4] 1420 	ld	a,e
   6A6A D6 02         [ 7] 1421 	sub	a, #0x02
   6A6C 20 4F         [12] 1422 	jr	NZ,00127$
                           1423 ;src/main.c:352: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   6A6E 3A 30 63      [13] 1424 	ld	a, (#(_prota + 0x0001) + 0)
   6A71 C6 F7         [ 7] 1425 	add	a,#0xF7
   6A73 57            [ 4] 1426 	ld	d,a
   6A74 3A 2F 63      [13] 1427 	ld	a, (#_prota + 0)
   6A77 C6 03         [ 7] 1428 	add	a, #0x03
   6A79 C5            [11] 1429 	push	bc
   6A7A D5            [11] 1430 	push	de
   6A7B 33            [ 6] 1431 	inc	sp
   6A7C F5            [11] 1432 	push	af
   6A7D 33            [ 6] 1433 	inc	sp
   6A7E CD 4D 64      [17] 1434 	call	_getTilePtr
   6A81 F1            [10] 1435 	pop	af
   6A82 C1            [10] 1436 	pop	bc
   6A83 5E            [ 7] 1437 	ld	e,(hl)
   6A84 3E 02         [ 7] 1438 	ld	a,#0x02
   6A86 93            [ 4] 1439 	sub	a, e
   6A87 38 34         [12] 1440 	jr	C,00127$
                           1441 ;src/main.c:353: actual->lanzado = SI;
   6A89 DD 6E FA      [19] 1442 	ld	l,-6 (ix)
   6A8C DD 66 FB      [19] 1443 	ld	h,-5 (ix)
   6A8F 36 01         [10] 1444 	ld	(hl),#0x01
                           1445 ;src/main.c:354: actual->direccion = M_arriba;
   6A91 E1            [10] 1446 	pop	hl
   6A92 E5            [11] 1447 	push	hl
   6A93 36 02         [10] 1448 	ld	(hl),#0x02
                           1449 ;src/main.c:355: actual->x = prota.x + G_HERO_W / 2;
   6A95 3A 2F 63      [13] 1450 	ld	a, (#_prota + 0)
   6A98 C6 03         [ 7] 1451 	add	a, #0x03
   6A9A 02            [ 7] 1452 	ld	(bc),a
                           1453 ;src/main.c:356: actual->y = prota.y;
   6A9B 3A 30 63      [13] 1454 	ld	a, (#(_prota + 0x0001) + 0)
   6A9E DD 6E FE      [19] 1455 	ld	l,-2 (ix)
   6AA1 DD 66 FF      [19] 1456 	ld	h,-1 (ix)
   6AA4 77            [ 7] 1457 	ld	(hl),a
                           1458 ;src/main.c:357: actual->sprite = g_knifeY_1;
   6AA5 DD 6E F8      [19] 1459 	ld	l,-8 (ix)
   6AA8 DD 66 F9      [19] 1460 	ld	h,-7 (ix)
   6AAB 36 B0         [10] 1461 	ld	(hl),#<(_g_knifeY_1)
   6AAD 23            [ 6] 1462 	inc	hl
   6AAE 36 54         [10] 1463 	ld	(hl),#>(_g_knifeY_1)
                           1464 ;src/main.c:358: actual->eje = E_Y;
   6AB0 DD 6E FC      [19] 1465 	ld	l,-4 (ix)
   6AB3 DD 66 FD      [19] 1466 	ld	h,-3 (ix)
   6AB6 36 01         [10] 1467 	ld	(hl),#0x01
                           1468 ;src/main.c:359: dibujarCuchillo(actual);
   6AB8 C5            [11] 1469 	push	bc
   6AB9 CD DC 67      [17] 1470 	call	_dibujarCuchillo
   6ABC F1            [10] 1471 	pop	af
   6ABD                    1472 00127$:
   6ABD DD F9         [10] 1473 	ld	sp, ix
   6ABF DD E1         [14] 1474 	pop	ix
   6AC1 C9            [10] 1475 	ret
                           1476 ;src/main.c:365: void comprobarTeclado() {
                           1477 ;	---------------------------------
                           1478 ; Function comprobarTeclado
                           1479 ; ---------------------------------
   6AC2                    1480 _comprobarTeclado::
                           1481 ;src/main.c:366: cpct_scanKeyboard_if();
   6AC2 CD D3 59      [17] 1482 	call	_cpct_scanKeyboard_if
                           1483 ;src/main.c:368: if (cpct_isAnyKeyPressed()) {
   6AC5 CD C6 59      [17] 1484 	call	_cpct_isAnyKeyPressed
   6AC8 7D            [ 4] 1485 	ld	a,l
   6AC9 B7            [ 4] 1486 	or	a, a
   6ACA C8            [11] 1487 	ret	Z
                           1488 ;src/main.c:369: if (cpct_isKeyPressed(Key_CursorLeft))
   6ACB 21 01 01      [10] 1489 	ld	hl,#0x0101
   6ACE CD E1 57      [17] 1490 	call	_cpct_isKeyPressed
   6AD1 7D            [ 4] 1491 	ld	a,l
   6AD2 B7            [ 4] 1492 	or	a, a
                           1493 ;src/main.c:370: moverIzquierda();
   6AD3 C2 4E 67      [10] 1494 	jp	NZ,_moverIzquierda
                           1495 ;src/main.c:371: else if (cpct_isKeyPressed(Key_CursorRight))
   6AD6 21 00 02      [10] 1496 	ld	hl,#0x0200
   6AD9 CD E1 57      [17] 1497 	call	_cpct_isKeyPressed
   6ADC 7D            [ 4] 1498 	ld	a,l
   6ADD B7            [ 4] 1499 	or	a, a
                           1500 ;src/main.c:372: moverDerecha();
   6ADE C2 6D 67      [10] 1501 	jp	NZ,_moverDerecha
                           1502 ;src/main.c:373: else if (cpct_isKeyPressed(Key_CursorUp))
   6AE1 21 00 01      [10] 1503 	ld	hl,#0x0100
   6AE4 CD E1 57      [17] 1504 	call	_cpct_isKeyPressed
   6AE7 7D            [ 4] 1505 	ld	a,l
   6AE8 B7            [ 4] 1506 	or	a, a
                           1507 ;src/main.c:374: moverArriba();
   6AE9 C2 A0 67      [10] 1508 	jp	NZ,_moverArriba
                           1509 ;src/main.c:375: else if (cpct_isKeyPressed(Key_CursorDown))
   6AEC 21 00 04      [10] 1510 	ld	hl,#0x0400
   6AEF CD E1 57      [17] 1511 	call	_cpct_isKeyPressed
   6AF2 7D            [ 4] 1512 	ld	a,l
   6AF3 B7            [ 4] 1513 	or	a, a
                           1514 ;src/main.c:376: moverAbajo();
   6AF4 C2 BE 67      [10] 1515 	jp	NZ,_moverAbajo
                           1516 ;src/main.c:377: else if (cpct_isKeyPressed(Key_Space))
   6AF7 21 05 80      [10] 1517 	ld	hl,#0x8005
   6AFA CD E1 57      [17] 1518 	call	_cpct_isKeyPressed
   6AFD 7D            [ 4] 1519 	ld	a,l
   6AFE B7            [ 4] 1520 	or	a, a
   6AFF C8            [11] 1521 	ret	Z
                           1522 ;src/main.c:378: lanzarCuchillo();
   6B00 C3 F4 68      [10] 1523 	jp  _lanzarCuchillo
                           1524 ;src/main.c:384: void moverCuchillo(){
                           1525 ;	---------------------------------
                           1526 ; Function moverCuchillo
                           1527 ; ---------------------------------
   6B03                    1528 _moverCuchillo::
   6B03 DD E5         [15] 1529 	push	ix
   6B05 DD 21 00 00   [14] 1530 	ld	ix,#0
   6B09 DD 39         [15] 1531 	add	ix,sp
   6B0B F5            [11] 1532 	push	af
   6B0C F5            [11] 1533 	push	af
                           1534 ;src/main.c:386: u8 i = 10 + 1;
   6B0D DD 36 FC 0B   [19] 1535 	ld	-4 (ix),#0x0B
                           1536 ;src/main.c:387: TKnife* actual = cu;
   6B11 01 37 63      [10] 1537 	ld	bc,#_cu+0
                           1538 ;src/main.c:389: while(--i){
   6B14                    1539 00126$:
   6B14 DD 35 FC      [23] 1540 	dec	-4 (ix)
   6B17 DD 7E FC      [19] 1541 	ld	a, -4 (ix)
   6B1A B7            [ 4] 1542 	or	a, a
   6B1B CA 3A 6C      [10] 1543 	jp	Z,00129$
                           1544 ;src/main.c:390: if(actual->lanzado){
   6B1E 21 06 00      [10] 1545 	ld	hl,#0x0006
   6B21 09            [11] 1546 	add	hl,bc
   6B22 DD 75 FD      [19] 1547 	ld	-3 (ix),l
   6B25 DD 74 FE      [19] 1548 	ld	-2 (ix),h
   6B28 DD 6E FD      [19] 1549 	ld	l,-3 (ix)
   6B2B DD 66 FE      [19] 1550 	ld	h,-2 (ix)
   6B2E 7E            [ 7] 1551 	ld	a,(hl)
   6B2F B7            [ 4] 1552 	or	a, a
   6B30 CA 31 6C      [10] 1553 	jp	Z,00125$
                           1554 ;src/main.c:391: if(actual->direccion == M_derecha){
   6B33 C5            [11] 1555 	push	bc
   6B34 FD E1         [14] 1556 	pop	iy
   6B36 FD 6E 07      [19] 1557 	ld	l,7 (iy)
                           1558 ;src/main.c:393: if( *getTilePtr(actual->x + G_KNIFEX_0_W + 1, actual->y) <= 2){
   6B39 59            [ 4] 1559 	ld	e, c
   6B3A 50            [ 4] 1560 	ld	d, b
   6B3B 13            [ 6] 1561 	inc	de
                           1562 ;src/main.c:391: if(actual->direccion == M_derecha){
   6B3C 7D            [ 4] 1563 	ld	a,l
   6B3D B7            [ 4] 1564 	or	a, a
   6B3E 20 34         [12] 1565 	jr	NZ,00122$
                           1566 ;src/main.c:393: if( *getTilePtr(actual->x + G_KNIFEX_0_W + 1, actual->y) <= 2){
   6B40 1A            [ 7] 1567 	ld	a,(de)
   6B41 57            [ 4] 1568 	ld	d,a
   6B42 0A            [ 7] 1569 	ld	a,(bc)
   6B43 C6 05         [ 7] 1570 	add	a, #0x05
   6B45 C5            [11] 1571 	push	bc
   6B46 D5            [11] 1572 	push	de
   6B47 33            [ 6] 1573 	inc	sp
   6B48 F5            [11] 1574 	push	af
   6B49 33            [ 6] 1575 	inc	sp
   6B4A CD 4D 64      [17] 1576 	call	_getTilePtr
   6B4D F1            [10] 1577 	pop	af
   6B4E C1            [10] 1578 	pop	bc
   6B4F 5E            [ 7] 1579 	ld	e,(hl)
   6B50 3E 02         [ 7] 1580 	ld	a,#0x02
   6B52 93            [ 4] 1581 	sub	a, e
   6B53 38 0D         [12] 1582 	jr	C,00102$
                           1583 ;src/main.c:394: actual->x++;
   6B55 0A            [ 7] 1584 	ld	a,(bc)
   6B56 3C            [ 4] 1585 	inc	a
   6B57 02            [ 7] 1586 	ld	(bc),a
                           1587 ;src/main.c:396: redibujarCuchillo(actual);
   6B58 C5            [11] 1588 	push	bc
   6B59 C5            [11] 1589 	push	bc
   6B5A CD C3 68      [17] 1590 	call	_redibujarCuchillo
   6B5D F1            [10] 1591 	pop	af
   6B5E C1            [10] 1592 	pop	bc
   6B5F C3 31 6C      [10] 1593 	jp	00125$
   6B62                    1594 00102$:
                           1595 ;src/main.c:399: borrarCuchillo(actual);
   6B62 C5            [11] 1596 	push	bc
   6B63 C5            [11] 1597 	push	bc
   6B64 CD 59 68      [17] 1598 	call	_borrarCuchillo
   6B67 F1            [10] 1599 	pop	af
   6B68 C1            [10] 1600 	pop	bc
                           1601 ;src/main.c:400: actual->lanzado = NO;
   6B69 DD 6E FD      [19] 1602 	ld	l,-3 (ix)
   6B6C DD 66 FE      [19] 1603 	ld	h,-2 (ix)
   6B6F 36 00         [10] 1604 	ld	(hl),#0x00
   6B71 C3 31 6C      [10] 1605 	jp	00125$
   6B74                    1606 00122$:
                           1607 ;src/main.c:403: else if(actual->direccion == M_izquierda){
   6B74 7D            [ 4] 1608 	ld	a,l
   6B75 3D            [ 4] 1609 	dec	a
   6B76 20 35         [12] 1610 	jr	NZ,00119$
                           1611 ;src/main.c:404: if(*getTilePtr(actual->x - 1, actual->y) <= 2){
   6B78 1A            [ 7] 1612 	ld	a,(de)
   6B79 57            [ 4] 1613 	ld	d,a
   6B7A 0A            [ 7] 1614 	ld	a,(bc)
   6B7B C6 FF         [ 7] 1615 	add	a,#0xFF
   6B7D C5            [11] 1616 	push	bc
   6B7E D5            [11] 1617 	push	de
   6B7F 33            [ 6] 1618 	inc	sp
   6B80 F5            [11] 1619 	push	af
   6B81 33            [ 6] 1620 	inc	sp
   6B82 CD 4D 64      [17] 1621 	call	_getTilePtr
   6B85 F1            [10] 1622 	pop	af
   6B86 C1            [10] 1623 	pop	bc
   6B87 5E            [ 7] 1624 	ld	e,(hl)
   6B88 3E 02         [ 7] 1625 	ld	a,#0x02
   6B8A 93            [ 4] 1626 	sub	a, e
   6B8B 38 0E         [12] 1627 	jr	C,00105$
                           1628 ;src/main.c:405: actual->x--;
   6B8D 0A            [ 7] 1629 	ld	a,(bc)
   6B8E C6 FF         [ 7] 1630 	add	a,#0xFF
   6B90 02            [ 7] 1631 	ld	(bc),a
                           1632 ;src/main.c:407: redibujarCuchillo(actual);
   6B91 C5            [11] 1633 	push	bc
   6B92 C5            [11] 1634 	push	bc
   6B93 CD C3 68      [17] 1635 	call	_redibujarCuchillo
   6B96 F1            [10] 1636 	pop	af
   6B97 C1            [10] 1637 	pop	bc
   6B98 C3 31 6C      [10] 1638 	jp	00125$
   6B9B                    1639 00105$:
                           1640 ;src/main.c:409: borrarCuchillo(actual);
   6B9B C5            [11] 1641 	push	bc
   6B9C C5            [11] 1642 	push	bc
   6B9D CD 59 68      [17] 1643 	call	_borrarCuchillo
   6BA0 F1            [10] 1644 	pop	af
   6BA1 C1            [10] 1645 	pop	bc
                           1646 ;src/main.c:410: actual->lanzado = NO;
   6BA2 DD 6E FD      [19] 1647 	ld	l,-3 (ix)
   6BA5 DD 66 FE      [19] 1648 	ld	h,-2 (ix)
   6BA8 36 00         [10] 1649 	ld	(hl),#0x00
   6BAA C3 31 6C      [10] 1650 	jp	00125$
   6BAD                    1651 00119$:
                           1652 ;src/main.c:413: else if(actual->direccion == M_abajo){
   6BAD 7D            [ 4] 1653 	ld	a,l
   6BAE D6 03         [ 7] 1654 	sub	a, #0x03
   6BB0 20 3D         [12] 1655 	jr	NZ,00116$
                           1656 ;src/main.c:414: if(*getTilePtr(actual->x, actual->y + G_KNIFEY_0_H + 2) <= 2){
   6BB2 1A            [ 7] 1657 	ld	a,(de)
   6BB3 C6 0A         [ 7] 1658 	add	a, #0x0A
   6BB5 F5            [11] 1659 	push	af
   6BB6 0A            [ 7] 1660 	ld	a,(bc)
   6BB7 DD 77 FF      [19] 1661 	ld	-1 (ix),a
   6BBA F1            [10] 1662 	pop	af
   6BBB C5            [11] 1663 	push	bc
   6BBC D5            [11] 1664 	push	de
   6BBD F5            [11] 1665 	push	af
   6BBE 33            [ 6] 1666 	inc	sp
   6BBF DD 7E FF      [19] 1667 	ld	a,-1 (ix)
   6BC2 F5            [11] 1668 	push	af
   6BC3 33            [ 6] 1669 	inc	sp
   6BC4 CD 4D 64      [17] 1670 	call	_getTilePtr
   6BC7 F1            [10] 1671 	pop	af
   6BC8 D1            [10] 1672 	pop	de
   6BC9 C1            [10] 1673 	pop	bc
   6BCA 6E            [ 7] 1674 	ld	l,(hl)
   6BCB 3E 02         [ 7] 1675 	ld	a,#0x02
   6BCD 95            [ 4] 1676 	sub	a, l
   6BCE 38 0E         [12] 1677 	jr	C,00108$
                           1678 ;src/main.c:415: actual->y++;
   6BD0 1A            [ 7] 1679 	ld	a,(de)
   6BD1 3C            [ 4] 1680 	inc	a
   6BD2 12            [ 7] 1681 	ld	(de),a
                           1682 ;src/main.c:416: actual->y++;
   6BD3 3C            [ 4] 1683 	inc	a
   6BD4 12            [ 7] 1684 	ld	(de),a
                           1685 ;src/main.c:417: redibujarCuchillo(actual);
   6BD5 C5            [11] 1686 	push	bc
   6BD6 C5            [11] 1687 	push	bc
   6BD7 CD C3 68      [17] 1688 	call	_redibujarCuchillo
   6BDA F1            [10] 1689 	pop	af
   6BDB C1            [10] 1690 	pop	bc
   6BDC 18 53         [12] 1691 	jr	00125$
   6BDE                    1692 00108$:
                           1693 ;src/main.c:421: borrarCuchillo(actual);
   6BDE C5            [11] 1694 	push	bc
   6BDF C5            [11] 1695 	push	bc
   6BE0 CD 59 68      [17] 1696 	call	_borrarCuchillo
   6BE3 F1            [10] 1697 	pop	af
   6BE4 C1            [10] 1698 	pop	bc
                           1699 ;src/main.c:422: actual->lanzado = NO;
   6BE5 DD 6E FD      [19] 1700 	ld	l,-3 (ix)
   6BE8 DD 66 FE      [19] 1701 	ld	h,-2 (ix)
   6BEB 36 00         [10] 1702 	ld	(hl),#0x00
   6BED 18 42         [12] 1703 	jr	00125$
   6BEF                    1704 00116$:
                           1705 ;src/main.c:425: else if(actual->direccion == M_arriba){
   6BEF 7D            [ 4] 1706 	ld	a,l
   6BF0 D6 02         [ 7] 1707 	sub	a, #0x02
   6BF2 20 3D         [12] 1708 	jr	NZ,00125$
                           1709 ;src/main.c:426: if(*getTilePtr(actual->x, actual->y - 2) <= 2){
   6BF4 1A            [ 7] 1710 	ld	a,(de)
   6BF5 C6 FE         [ 7] 1711 	add	a,#0xFE
   6BF7 F5            [11] 1712 	push	af
   6BF8 0A            [ 7] 1713 	ld	a,(bc)
   6BF9 DD 77 FF      [19] 1714 	ld	-1 (ix),a
   6BFC F1            [10] 1715 	pop	af
   6BFD C5            [11] 1716 	push	bc
   6BFE D5            [11] 1717 	push	de
   6BFF F5            [11] 1718 	push	af
   6C00 33            [ 6] 1719 	inc	sp
   6C01 DD 7E FF      [19] 1720 	ld	a,-1 (ix)
   6C04 F5            [11] 1721 	push	af
   6C05 33            [ 6] 1722 	inc	sp
   6C06 CD 4D 64      [17] 1723 	call	_getTilePtr
   6C09 F1            [10] 1724 	pop	af
   6C0A D1            [10] 1725 	pop	de
   6C0B C1            [10] 1726 	pop	bc
   6C0C 6E            [ 7] 1727 	ld	l,(hl)
   6C0D 3E 02         [ 7] 1728 	ld	a,#0x02
   6C0F 95            [ 4] 1729 	sub	a, l
   6C10 38 10         [12] 1730 	jr	C,00111$
                           1731 ;src/main.c:427: actual->y--;
   6C12 1A            [ 7] 1732 	ld	a,(de)
   6C13 C6 FF         [ 7] 1733 	add	a,#0xFF
   6C15 12            [ 7] 1734 	ld	(de),a
                           1735 ;src/main.c:428: actual->y--;
   6C16 C6 FF         [ 7] 1736 	add	a,#0xFF
   6C18 12            [ 7] 1737 	ld	(de),a
                           1738 ;src/main.c:429: redibujarCuchillo(actual);
   6C19 C5            [11] 1739 	push	bc
   6C1A C5            [11] 1740 	push	bc
   6C1B CD C3 68      [17] 1741 	call	_redibujarCuchillo
   6C1E F1            [10] 1742 	pop	af
   6C1F C1            [10] 1743 	pop	bc
   6C20 18 0F         [12] 1744 	jr	00125$
   6C22                    1745 00111$:
                           1746 ;src/main.c:432: borrarCuchillo(actual);
   6C22 C5            [11] 1747 	push	bc
   6C23 C5            [11] 1748 	push	bc
   6C24 CD 59 68      [17] 1749 	call	_borrarCuchillo
   6C27 F1            [10] 1750 	pop	af
   6C28 C1            [10] 1751 	pop	bc
                           1752 ;src/main.c:433: actual->lanzado = NO;
   6C29 DD 6E FD      [19] 1753 	ld	l,-3 (ix)
   6C2C DD 66 FE      [19] 1754 	ld	h,-2 (ix)
   6C2F 36 00         [10] 1755 	ld	(hl),#0x00
   6C31                    1756 00125$:
                           1757 ;src/main.c:437: ++actual;
   6C31 21 09 00      [10] 1758 	ld	hl,#0x0009
   6C34 09            [11] 1759 	add	hl,bc
   6C35 4D            [ 4] 1760 	ld	c,l
   6C36 44            [ 4] 1761 	ld	b,h
   6C37 C3 14 6B      [10] 1762 	jp	00126$
   6C3A                    1763 00129$:
   6C3A DD F9         [10] 1764 	ld	sp, ix
   6C3C DD E1         [14] 1765 	pop	ix
   6C3E C9            [10] 1766 	ret
                           1767 ;src/main.c:441: void menuFin(){
                           1768 ;	---------------------------------
                           1769 ; Function menuFin
                           1770 ; ---------------------------------
   6C3F                    1771 _menuFin::
                           1772 ;src/main.c:444: cpct_clearScreen(0);
   6C3F 21 00 40      [10] 1773 	ld	hl,#0x4000
   6C42 E5            [11] 1774 	push	hl
   6C43 AF            [ 4] 1775 	xor	a, a
   6C44 F5            [11] 1776 	push	af
   6C45 33            [ 6] 1777 	inc	sp
   6C46 26 C0         [ 7] 1778 	ld	h, #0xC0
   6C48 E5            [11] 1779 	push	hl
   6C49 CD 61 5A      [17] 1780 	call	_cpct_memset
                           1781 ;src/main.c:446: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 12, 90); // centrado en horizontal y arriba en vertical
   6C4C 21 0C 5A      [10] 1782 	ld	hl,#0x5A0C
   6C4F E5            [11] 1783 	push	hl
   6C50 21 00 C0      [10] 1784 	ld	hl,#0xC000
   6C53 E5            [11] 1785 	push	hl
   6C54 CD CA 62      [17] 1786 	call	_cpct_getScreenPtr
   6C57 4D            [ 4] 1787 	ld	c,l
   6C58 44            [ 4] 1788 	ld	b,h
                           1789 ;src/main.c:447: cpct_drawStringM0("FIN DE PARTIDA", memptr, 2, 3);
   6C59 21 02 03      [10] 1790 	ld	hl,#0x0302
   6C5C E5            [11] 1791 	push	hl
   6C5D C5            [11] 1792 	push	bc
   6C5E 21 78 6C      [10] 1793 	ld	hl,#___str_0
   6C61 E5            [11] 1794 	push	hl
   6C62 CD 57 58      [17] 1795 	call	_cpct_drawStringM0
   6C65 21 06 00      [10] 1796 	ld	hl,#6
   6C68 39            [11] 1797 	add	hl,sp
   6C69 F9            [ 6] 1798 	ld	sp,hl
                           1799 ;src/main.c:451: do{
   6C6A                    1800 00101$:
                           1801 ;src/main.c:452: cpct_scanKeyboard_f();   		
   6C6A CD ED 57      [17] 1802 	call	_cpct_scanKeyboard_f
                           1803 ;src/main.c:453: } while(!cpct_isKeyPressed(Key_I));   		
   6C6D 21 04 08      [10] 1804 	ld	hl,#0x0804
   6C70 CD E1 57      [17] 1805 	call	_cpct_isKeyPressed
   6C73 7D            [ 4] 1806 	ld	a,l
   6C74 B7            [ 4] 1807 	or	a, a
   6C75 28 F3         [12] 1808 	jr	Z,00101$
   6C77 C9            [10] 1809 	ret
   6C78                    1810 ___str_0:
   6C78 46 49 4E 20 44 45  1811 	.ascii "FIN DE PARTIDA"
        20 50 41 52 54 49
        44 41
   6C86 00                 1812 	.db 0x00
                           1813 ;src/main.c:456: void menu(){
                           1814 ;	---------------------------------
                           1815 ; Function menu
                           1816 ; ---------------------------------
   6C87                    1817 _menu::
                           1818 ;src/main.c:459: cpct_clearScreen(0);
   6C87 21 00 40      [10] 1819 	ld	hl,#0x4000
   6C8A E5            [11] 1820 	push	hl
   6C8B AF            [ 4] 1821 	xor	a, a
   6C8C F5            [11] 1822 	push	af
   6C8D 33            [ 6] 1823 	inc	sp
   6C8E 26 C0         [ 7] 1824 	ld	h, #0xC0
   6C90 E5            [11] 1825 	push	hl
   6C91 CD 61 5A      [17] 1826 	call	_cpct_memset
                           1827 ;src/main.c:461: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 10); // centrado en horizontal y arriba en vertical
   6C94 21 20 0A      [10] 1828 	ld	hl,#0x0A20
   6C97 E5            [11] 1829 	push	hl
   6C98 21 00 C0      [10] 1830 	ld	hl,#0xC000
   6C9B E5            [11] 1831 	push	hl
   6C9C CD CA 62      [17] 1832 	call	_cpct_getScreenPtr
   6C9F 4D            [ 4] 1833 	ld	c,l
   6CA0 44            [ 4] 1834 	ld	b,h
                           1835 ;src/main.c:462: cpct_drawStringM0("MENU", memptr, 2, 3);
   6CA1 21 02 03      [10] 1836 	ld	hl,#0x0302
   6CA4 E5            [11] 1837 	push	hl
   6CA5 C5            [11] 1838 	push	bc
   6CA6 21 DE 6C      [10] 1839 	ld	hl,#___str_1
   6CA9 E5            [11] 1840 	push	hl
   6CAA CD 57 58      [17] 1841 	call	_cpct_drawStringM0
   6CAD 21 06 00      [10] 1842 	ld	hl,#6
   6CB0 39            [11] 1843 	add	hl,sp
   6CB1 F9            [ 6] 1844 	ld	sp,hl
                           1845 ;src/main.c:464: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 180); // centrado en horizontal y abajo en vertical
   6CB2 21 1A B4      [10] 1846 	ld	hl,#0xB41A
   6CB5 E5            [11] 1847 	push	hl
   6CB6 21 00 C0      [10] 1848 	ld	hl,#0xC000
   6CB9 E5            [11] 1849 	push	hl
   6CBA CD CA 62      [17] 1850 	call	_cpct_getScreenPtr
   6CBD 4D            [ 4] 1851 	ld	c,l
   6CBE 44            [ 4] 1852 	ld	b,h
                           1853 ;src/main.c:465: cpct_drawStringM0("PULSA I", memptr, 1, 0);
   6CBF 21 01 00      [10] 1854 	ld	hl,#0x0001
   6CC2 E5            [11] 1855 	push	hl
   6CC3 C5            [11] 1856 	push	bc
   6CC4 21 E3 6C      [10] 1857 	ld	hl,#___str_2
   6CC7 E5            [11] 1858 	push	hl
   6CC8 CD 57 58      [17] 1859 	call	_cpct_drawStringM0
   6CCB 21 06 00      [10] 1860 	ld	hl,#6
   6CCE 39            [11] 1861 	add	hl,sp
   6CCF F9            [ 6] 1862 	ld	sp,hl
                           1863 ;src/main.c:468: do{
   6CD0                    1864 00101$:
                           1865 ;src/main.c:469: cpct_scanKeyboard_f();   		
   6CD0 CD ED 57      [17] 1866 	call	_cpct_scanKeyboard_f
                           1867 ;src/main.c:470: } while(!cpct_isKeyPressed(Key_I));   		
   6CD3 21 04 08      [10] 1868 	ld	hl,#0x0804
   6CD6 CD E1 57      [17] 1869 	call	_cpct_isKeyPressed
   6CD9 7D            [ 4] 1870 	ld	a,l
   6CDA B7            [ 4] 1871 	or	a, a
   6CDB 28 F3         [12] 1872 	jr	Z,00101$
   6CDD C9            [10] 1873 	ret
   6CDE                    1874 ___str_1:
   6CDE 4D 45 4E 55        1875 	.ascii "MENU"
   6CE2 00                 1876 	.db 0x00
   6CE3                    1877 ___str_2:
   6CE3 50 55 4C 53 41 20  1878 	.ascii "PULSA I"
        49
   6CEA 00                 1879 	.db 0x00
                           1880 ;src/main.c:474: void inicializar() {
                           1881 ;	---------------------------------
                           1882 ; Function inicializar
                           1883 ; ---------------------------------
   6CEB                    1884 _inicializar::
                           1885 ;src/main.c:477: TKnife* actual = cu;
                           1886 ;src/main.c:479: cpct_disableFirmware();
   6CEB CD 98 62      [17] 1887 	call	_cpct_disableFirmware
                           1888 ;src/main.c:480: cpct_setVideoMode(0);
   6CEE 2E 00         [ 7] 1889 	ld	l,#0x00
   6CF0 CD 43 5A      [17] 1890 	call	_cpct_setVideoMode
                           1891 ;src/main.c:482: cpct_setPalette(g_palette, 16);
   6CF3 21 10 00      [10] 1892 	ld	hl,#0x0010
   6CF6 E5            [11] 1893 	push	hl
   6CF7 21 80 56      [10] 1894 	ld	hl,#_g_palette
   6CFA E5            [11] 1895 	push	hl
   6CFB CD CA 57      [17] 1896 	call	_cpct_setPalette
                           1897 ;src/main.c:483: cpct_akp_musicInit(G_song);
   6CFE 21 00 3F      [10] 1898 	ld	hl,#_G_song
   6D01 E5            [11] 1899 	push	hl
   6D02 CD 74 61      [17] 1900 	call	_cpct_akp_musicInit
   6D05 F1            [10] 1901 	pop	af
                           1902 ;src/main.c:484: mapa = g_map1;
   6D06 21 C0 4D      [10] 1903 	ld	hl,#_g_map1+0
   6D09 22 91 63      [16] 1904 	ld	(_mapa),hl
                           1905 ;src/main.c:485: num_mapa = 0;
   6D0C 21 93 63      [10] 1906 	ld	hl,#_num_mapa + 0
   6D0F 36 00         [10] 1907 	ld	(hl), #0x00
                           1908 ;src/main.c:486: cpct_etm_setTileset2x4(g_tileset);
   6D11 21 E0 54      [10] 1909 	ld	hl,#_g_tileset
   6D14 CD 0A 59      [17] 1910 	call	_cpct_etm_setTileset2x4
                           1911 ;src/main.c:487: dibujarMapa();
   6D17 CD 94 63      [17] 1912 	call	_dibujarMapa
                           1913 ;src/main.c:490: prota.x = prota.px = 4;
   6D1A 21 31 63      [10] 1914 	ld	hl,#(_prota + 0x0002)
   6D1D 36 04         [10] 1915 	ld	(hl),#0x04
   6D1F 21 2F 63      [10] 1916 	ld	hl,#_prota
   6D22 36 04         [10] 1917 	ld	(hl),#0x04
                           1918 ;src/main.c:491: prota.y = prota.py = 80;
   6D24 21 32 63      [10] 1919 	ld	hl,#(_prota + 0x0003)
   6D27 36 50         [10] 1920 	ld	(hl),#0x50
   6D29 21 30 63      [10] 1921 	ld	hl,#(_prota + 0x0001)
   6D2C 36 50         [10] 1922 	ld	(hl),#0x50
                           1923 ;src/main.c:492: prota.mover  = NO;
   6D2E 21 35 63      [10] 1924 	ld	hl,#(_prota + 0x0006)
   6D31 36 00         [10] 1925 	ld	(hl),#0x00
                           1926 ;src/main.c:493: prota.mira=M_derecha;
   6D33 21 36 63      [10] 1927 	ld	hl,#(_prota + 0x0007)
   6D36 36 00         [10] 1928 	ld	(hl),#0x00
                           1929 ;src/main.c:494: prota.sprite = g_hero;
   6D38 21 90 56      [10] 1930 	ld	hl,#_g_hero
   6D3B 22 33 63      [16] 1931 	ld	((_prota + 0x0004)), hl
                           1932 ;src/main.c:496: enemy.x = enemy.px = 67;
   6D3E 21 29 63      [10] 1933 	ld	hl,#(_enemy + 0x0002)
   6D41 36 43         [10] 1934 	ld	(hl),#0x43
   6D43 21 27 63      [10] 1935 	ld	hl,#_enemy
   6D46 36 43         [10] 1936 	ld	(hl),#0x43
                           1937 ;src/main.c:497: enemy.y = enemy.py = 84;
   6D48 21 2A 63      [10] 1938 	ld	hl,#(_enemy + 0x0003)
   6D4B 36 54         [10] 1939 	ld	(hl),#0x54
   6D4D 21 28 63      [10] 1940 	ld	hl,#(_enemy + 0x0001)
   6D50 36 54         [10] 1941 	ld	(hl),#0x54
                           1942 ;src/main.c:498: enemy.mover  = NO;
   6D52 21 2D 63      [10] 1943 	ld	hl,#(_enemy + 0x0006)
   6D55 36 00         [10] 1944 	ld	(hl),#0x00
                           1945 ;src/main.c:499: enemy.mira=M_abajo;
   6D57 21 2E 63      [10] 1946 	ld	hl,#(_enemy + 0x0007)
   6D5A 36 03         [10] 1947 	ld	(hl),#0x03
                           1948 ;src/main.c:500: enemy.sprite = g_enemy;
   6D5C 21 A8 55      [10] 1949 	ld	hl,#_g_enemy
   6D5F 22 2B 63      [16] 1950 	ld	((_enemy + 0x0004)), hl
                           1951 ;src/main.c:503: i = 10 + 1;
   6D62 0E 0B         [ 7] 1952 	ld	c,#0x0B
                           1953 ;src/main.c:506: while(--i){
   6D64 11 37 63      [10] 1954 	ld	de,#_cu
   6D67                    1955 00101$:
   6D67 41            [ 4] 1956 	ld	b,c
   6D68 05            [ 4] 1957 	dec	b
   6D69 78            [ 4] 1958 	ld	a,b
   6D6A 4F            [ 4] 1959 	ld	c,a
   6D6B B7            [ 4] 1960 	or	a, a
   6D6C 28 25         [12] 1961 	jr	Z,00103$
                           1962 ;src/main.c:507: actual->x = actual->px = 0;
   6D6E 6B            [ 4] 1963 	ld	l, e
   6D6F 62            [ 4] 1964 	ld	h, d
   6D70 23            [ 6] 1965 	inc	hl
   6D71 23            [ 6] 1966 	inc	hl
   6D72 36 00         [10] 1967 	ld	(hl),#0x00
   6D74 AF            [ 4] 1968 	xor	a, a
   6D75 12            [ 7] 1969 	ld	(de),a
                           1970 ;src/main.c:508: actual->y = actual->py = 0;
   6D76 D5            [11] 1971 	push	de
   6D77 FD E1         [14] 1972 	pop	iy
   6D79 FD 23         [10] 1973 	inc	iy
   6D7B 6B            [ 4] 1974 	ld	l, e
   6D7C 62            [ 4] 1975 	ld	h, d
   6D7D 23            [ 6] 1976 	inc	hl
   6D7E 23            [ 6] 1977 	inc	hl
   6D7F 23            [ 6] 1978 	inc	hl
   6D80 36 00         [10] 1979 	ld	(hl),#0x00
   6D82 FD 36 00 00   [19] 1980 	ld	0 (iy), #0x00
                           1981 ;src/main.c:509: actual->lanzado = 0;
   6D86 21 06 00      [10] 1982 	ld	hl,#0x0006
   6D89 19            [11] 1983 	add	hl,de
   6D8A 36 00         [10] 1984 	ld	(hl),#0x00
                           1985 ;src/main.c:510: ++actual;
   6D8C 21 09 00      [10] 1986 	ld	hl,#0x0009
   6D8F 19            [11] 1987 	add	hl,de
   6D90 EB            [ 4] 1988 	ex	de,hl
   6D91 18 D4         [12] 1989 	jr	00101$
   6D93                    1990 00103$:
                           1991 ;src/main.c:514: dibujarProta();
   6D93 CD B0 63      [17] 1992 	call	_dibujarProta
                           1993 ;src/main.c:515: dibujarEnemigo();
   6D96 CD B7 65      [17] 1994 	call	_dibujarEnemigo
   6D99 C9            [10] 1995 	ret
                           1996 ;src/main.c:518: void main(void) {
                           1997 ;	---------------------------------
                           1998 ; Function main
                           1999 ; ---------------------------------
   6D9A                    2000 _main::
                           2001 ;src/main.c:520: menu();
   6D9A CD 87 6C      [17] 2002 	call	_menu
                           2003 ;src/main.c:522: inicializar();
   6D9D CD EB 6C      [17] 2004 	call	_inicializar
                           2005 ;src/main.c:523: cpct_akp_musicPlay();
   6DA0 CD 71 5A      [17] 2006 	call	_cpct_akp_musicPlay
                           2007 ;src/main.c:526: while (1) {
   6DA3                    2008 00104$:
                           2009 ;src/main.c:529: comprobarTeclado();
   6DA3 CD C2 6A      [17] 2010 	call	_comprobarTeclado
                           2011 ;src/main.c:531: cpct_waitVSYNC();
   6DA6 CD 3B 5A      [17] 2012 	call	_cpct_waitVSYNC
                           2013 ;src/main.c:532: moverCuchillo();
   6DA9 CD 03 6B      [17] 2014 	call	_moverCuchillo
                           2015 ;src/main.c:533: moverEnemigo();
   6DAC CD 54 66      [17] 2016 	call	_moverEnemigo
                           2017 ;src/main.c:535: if (prota.mover) {
   6DAF 3A 35 63      [13] 2018 	ld	a, (#(_prota + 0x0006) + 0)
   6DB2 B7            [ 4] 2019 	or	a, a
   6DB3 28 EE         [12] 2020 	jr	Z,00104$
                           2021 ;src/main.c:537: redibujarProta();
   6DB5 CD 39 64      [17] 2022 	call	_redibujarProta
                           2023 ;src/main.c:538: prota.mover = NO;
   6DB8 21 35 63      [10] 2024 	ld	hl,#(_prota + 0x0006)
   6DBB 36 00         [10] 2025 	ld	(hl),#0x00
   6DBD 18 E4         [12] 2026 	jr	00104$
                           2027 	.area _CODE
                           2028 	.area _INITIALIZER
                           2029 	.area _CABS (ABS)
   3F00                    2030 	.org 0x3F00
   3F00                    2031 _G_song:
   3F00 41                 2032 	.db #0x41	; 65	'A'
   3F01 54                 2033 	.db #0x54	; 84	'T'
   3F02 31                 2034 	.db #0x31	; 49	'1'
   3F03 30                 2035 	.db #0x30	; 48	'0'
   3F04 01                 2036 	.db #0x01	; 1
   3F05 40                 2037 	.db #0x40	; 64
   3F06 42                 2038 	.db #0x42	; 66	'B'
   3F07 0F                 2039 	.db #0x0F	; 15
   3F08 02                 2040 	.db #0x02	; 2
   3F09 06                 2041 	.db #0x06	; 6
   3F0A 1D                 2042 	.db #0x1D	; 29
   3F0B 00                 2043 	.db #0x00	; 0
   3F0C 10                 2044 	.db #0x10	; 16
   3F0D 40                 2045 	.db #0x40	; 64
   3F0E 19                 2046 	.db #0x19	; 25
   3F0F 40                 2047 	.db #0x40	; 64
   3F10 00                 2048 	.db #0x00	; 0
   3F11 00                 2049 	.db #0x00	; 0
   3F12 00                 2050 	.db #0x00	; 0
   3F13 00                 2051 	.db #0x00	; 0
   3F14 00                 2052 	.db #0x00	; 0
   3F15 00                 2053 	.db #0x00	; 0
   3F16 0D                 2054 	.db #0x0D	; 13
   3F17 12                 2055 	.db #0x12	; 18
   3F18 40                 2056 	.db #0x40	; 64
   3F19 01                 2057 	.db #0x01	; 1
   3F1A 00                 2058 	.db #0x00	; 0
   3F1B 7C                 2059 	.db #0x7C	; 124
   3F1C 18                 2060 	.db #0x18	; 24
   3F1D 78                 2061 	.db #0x78	; 120	'x'
   3F1E 0C                 2062 	.db #0x0C	; 12
   3F1F 34                 2063 	.db #0x34	; 52	'4'
   3F20 30                 2064 	.db #0x30	; 48	'0'
   3F21 2C                 2065 	.db #0x2C	; 44
   3F22 28                 2066 	.db #0x28	; 40
   3F23 24                 2067 	.db #0x24	; 36
   3F24 20                 2068 	.db #0x20	; 32
   3F25 1C                 2069 	.db #0x1C	; 28
   3F26 0D                 2070 	.db #0x0D	; 13
   3F27 25                 2071 	.db #0x25	; 37
   3F28 40                 2072 	.db #0x40	; 64
   3F29 20                 2073 	.db #0x20	; 32
   3F2A 00                 2074 	.db #0x00	; 0
   3F2B 00                 2075 	.db #0x00	; 0
   3F2C 00                 2076 	.db #0x00	; 0
   3F2D 39                 2077 	.db #0x39	; 57	'9'
   3F2E 40                 2078 	.db #0x40	; 64
   3F2F 00                 2079 	.db #0x00	; 0
   3F30 57                 2080 	.db #0x57	; 87	'W'
   3F31 40                 2081 	.db #0x40	; 64
   3F32 3B                 2082 	.db #0x3B	; 59
   3F33 40                 2083 	.db #0x40	; 64
   3F34 57                 2084 	.db #0x57	; 87	'W'
   3F35 40                 2085 	.db #0x40	; 64
   3F36 01                 2086 	.db #0x01	; 1
   3F37 2F                 2087 	.db #0x2F	; 47
   3F38 40                 2088 	.db #0x40	; 64
   3F39 19                 2089 	.db #0x19	; 25
   3F3A 00                 2090 	.db #0x00	; 0
   3F3B 76                 2091 	.db #0x76	; 118	'v'
   3F3C E1                 2092 	.db #0xE1	; 225
   3F3D 00                 2093 	.db #0x00	; 0
   3F3E 00                 2094 	.db #0x00	; 0
   3F3F 01                 2095 	.db #0x01	; 1
   3F40 04                 2096 	.db #0x04	; 4
   3F41 51                 2097 	.db #0x51	; 81	'Q'
   3F42 04                 2098 	.db #0x04	; 4
   3F43 37                 2099 	.db #0x37	; 55	'7'
   3F44 04                 2100 	.db #0x04	; 4
   3F45 4F                 2101 	.db #0x4F	; 79	'O'
   3F46 04                 2102 	.db #0x04	; 4
   3F47 37                 2103 	.db #0x37	; 55	'7'
   3F48 02                 2104 	.db #0x02	; 2
   3F49 4B                 2105 	.db #0x4B	; 75	'K'
   3F4A 02                 2106 	.db #0x02	; 2
   3F4B 37                 2107 	.db #0x37	; 55	'7'
   3F4C 04                 2108 	.db #0x04	; 4
   3F4D 4F                 2109 	.db #0x4F	; 79	'O'
   3F4E 04                 2110 	.db #0x04	; 4
   3F4F 37                 2111 	.db #0x37	; 55	'7'
   3F50 04                 2112 	.db #0x04	; 4
   3F51 4F                 2113 	.db #0x4F	; 79	'O'
   3F52 04                 2114 	.db #0x04	; 4
   3F53 37                 2115 	.db #0x37	; 55	'7'
   3F54 02                 2116 	.db #0x02	; 2
   3F55 4B                 2117 	.db #0x4B	; 75	'K'
   3F56 00                 2118 	.db #0x00	; 0
   3F57 42                 2119 	.db #0x42	; 66	'B'
   3F58 60                 2120 	.db #0x60	; 96
   3F59 00                 2121 	.db #0x00	; 0
   3F5A 42                 2122 	.db #0x42	; 66	'B'
   3F5B 80                 2123 	.db #0x80	; 128
   3F5C 00                 2124 	.db #0x00	; 0
   3F5D 00                 2125 	.db #0x00	; 0
   3F5E 42                 2126 	.db #0x42	; 66	'B'
   3F5F 00                 2127 	.db #0x00	; 0
   3F60 00                 2128 	.db #0x00	; 0
