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
                             27 	.globl _checkCollision
                             28 	.globl _getTilePtr
                             29 	.globl _redibujarProta
                             30 	.globl _borrarProta
                             31 	.globl _dibujarProta
                             32 	.globl _dibujarMapa
                             33 	.globl _cpct_etm_setTileset2x4
                             34 	.globl _cpct_etm_drawTileBox2x4
                             35 	.globl _cpct_akp_musicPlay
                             36 	.globl _cpct_akp_musicInit
                             37 	.globl _cpct_getScreenPtr
                             38 	.globl _cpct_setPalette
                             39 	.globl _cpct_waitVSYNC
                             40 	.globl _cpct_setVideoMode
                             41 	.globl _cpct_drawStringM0
                             42 	.globl _cpct_drawSpriteMaskedAlignedTable
                             43 	.globl _cpct_isAnyKeyPressed
                             44 	.globl _cpct_isKeyPressed
                             45 	.globl _cpct_scanKeyboard_if
                             46 	.globl _cpct_scanKeyboard_f
                             47 	.globl _cpct_memset
                             48 	.globl _cpct_disableFirmware
                             49 	.globl _num_mapa
                             50 	.globl _mapa
                             51 	.globl _cu
                             52 	.globl _prota
                             53 	.globl _EEje
                             54 	.globl _EMirar
                             55 	.globl _mapas
                             56 ;--------------------------------------------------------
                             57 ; special function registers
                             58 ;--------------------------------------------------------
                             59 ;--------------------------------------------------------
                             60 ; ram data
                             61 ;--------------------------------------------------------
                             62 	.area _DATA
   6237                      63 _EMirar::
   6237                      64 	.ds 1
   6238                      65 _EEje::
   6238                      66 	.ds 1
   6239                      67 _prota::
   6239                      68 	.ds 8
   6241                      69 _cu::
   6241                      70 	.ds 90
   629B                      71 _mapa::
   629B                      72 	.ds 2
   629D                      73 _num_mapa::
   629D                      74 	.ds 1
                             75 ;--------------------------------------------------------
                             76 ; ram data
                             77 ;--------------------------------------------------------
                             78 	.area _INITIALIZED
                             79 ;--------------------------------------------------------
                             80 ; absolute external ram data
                             81 ;--------------------------------------------------------
                             82 	.area _DABS (ABS)
                             83 ;--------------------------------------------------------
                             84 ; global & static initialisations
                             85 ;--------------------------------------------------------
                             86 	.area _HOME
                             87 	.area _GSINIT
                             88 	.area _GSFINAL
                             89 	.area _GSINIT
                             90 ;--------------------------------------------------------
                             91 ; Home
                             92 ;--------------------------------------------------------
                             93 	.area _HOME
                             94 	.area _HOME
                             95 ;--------------------------------------------------------
                             96 ; code
                             97 ;--------------------------------------------------------
                             98 	.area _CODE
                             99 ;src/main.c:96: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
                            100 ;	---------------------------------
                            101 ; Function dummy_cpct_transparentMaskTable0M0_container
                            102 ; ---------------------------------
   568C                     103 _dummy_cpct_transparentMaskTable0M0_container::
                            104 	.area _g_tablatrans_ (ABS) 
   3E00                     105 	.org 0x3E00 
   3E00                     106 	 _g_tablatrans::
   3E00 FF AA 55 00 AA AA   107 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E08 55 00 55 00 00 00   108 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E10 AA AA 00 00 AA AA   109 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E18 00 00 00 00 00 00   110 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E20 55 00 55 00 00 00   111 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E28 55 00 55 00 00 00   112 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E30 00 00 00 00 00 00   113 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E38 00 00 00 00 00 00   114 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E40 AA AA 00 00 AA AA   115 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E48 00 00 00 00 00 00   116 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E50 AA AA 00 00 AA AA   117 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E58 00 00 00 00 00 00   118 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E60 00 00 00 00 00 00   119 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E68 00 00 00 00 00 00   120 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E70 00 00 00 00 00 00   121 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E78 00 00 00 00 00 00   122 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E80 55 00 55 00 00 00   123 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E88 55 00 55 00 00 00   124 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E90 00 00 00 00 00 00   125 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E98 00 00 00 00 00 00   126 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA0 55 00 55 00 00 00   127 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA8 55 00 55 00 00 00   128 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB0 00 00 00 00 00 00   129 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB8 00 00 00 00 00 00   130 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC0 00 00 00 00 00 00   131 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC8 00 00 00 00 00 00   132 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED0 00 00 00 00 00 00   133 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED8 00 00 00 00 00 00   134 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE0 00 00 00 00 00 00   135 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE8 00 00 00 00 00 00   136 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF0 00 00 00 00 00 00   137 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF8 00 00 00 00 00 00   138 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            139 	.area _CSEG (REL, CON) 
                            140 ;src/main.c:99: void dibujarMapa() {
                            141 ;	---------------------------------
                            142 ; Function dibujarMapa
                            143 ; ---------------------------------
   629E                     144 _dibujarMapa::
                            145 ;src/main.c:100: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   629E 2A 9B 62      [16]  146 	ld	hl,(_mapa)
   62A1 E5            [11]  147 	push	hl
   62A2 21 00 C0      [10]  148 	ld	hl,#0xC000
   62A5 E5            [11]  149 	push	hl
   62A6 21 2C 28      [10]  150 	ld	hl,#0x282C
   62A9 E5            [11]  151 	push	hl
   62AA 2E 00         [ 7]  152 	ld	l, #0x00
   62AC E5            [11]  153 	push	hl
   62AD AF            [ 4]  154 	xor	a, a
   62AE F5            [11]  155 	push	af
   62AF 33            [ 6]  156 	inc	sp
   62B0 CD 8D 57      [17]  157 	call	_cpct_etm_drawTileBox2x4
   62B3 C9            [10]  158 	ret
   62B4                     159 _mapas:
   62B4 C0 4D               160 	.dw _g_map1
   62B6 E0 46               161 	.dw _g_map2
   62B8 00 40               162 	.dw _g_map3
                            163 ;src/main.c:105: void dibujarProta() {
                            164 ;	---------------------------------
                            165 ; Function dibujarProta
                            166 ; ---------------------------------
   62BA                     167 _dibujarProta::
                            168 ;src/main.c:106: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   62BA 21 3A 62      [10]  169 	ld	hl, #_prota + 1
   62BD 56            [ 7]  170 	ld	d,(hl)
   62BE 21 39 62      [10]  171 	ld	hl, #_prota + 0
   62C1 46            [ 7]  172 	ld	b,(hl)
   62C2 D5            [11]  173 	push	de
   62C3 33            [ 6]  174 	inc	sp
   62C4 C5            [11]  175 	push	bc
   62C5 33            [ 6]  176 	inc	sp
   62C6 21 00 C0      [10]  177 	ld	hl,#0xC000
   62C9 E5            [11]  178 	push	hl
   62CA CD DC 61      [17]  179 	call	_cpct_getScreenPtr
   62CD EB            [ 4]  180 	ex	de,hl
                            181 ;src/main.c:107: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   62CE ED 4B 3D 62   [20]  182 	ld	bc, (#_prota + 4)
   62D2 21 00 3E      [10]  183 	ld	hl,#_g_tablatrans
   62D5 E5            [11]  184 	push	hl
   62D6 21 07 16      [10]  185 	ld	hl,#0x1607
   62D9 E5            [11]  186 	push	hl
   62DA D5            [11]  187 	push	de
   62DB C5            [11]  188 	push	bc
   62DC CD FC 61      [17]  189 	call	_cpct_drawSpriteMaskedAlignedTable
   62DF C9            [10]  190 	ret
                            191 ;src/main.c:110: void borrarProta() {
                            192 ;	---------------------------------
                            193 ; Function borrarProta
                            194 ; ---------------------------------
   62E0                     195 _borrarProta::
   62E0 DD E5         [15]  196 	push	ix
   62E2 DD 21 00 00   [14]  197 	ld	ix,#0
   62E6 DD 39         [15]  198 	add	ix,sp
   62E8 3B            [ 6]  199 	dec	sp
                            200 ;src/main.c:112: u8 w = 4 + (prota.px & 1);
   62E9 21 3B 62      [10]  201 	ld	hl, #_prota + 2
   62EC 4E            [ 7]  202 	ld	c,(hl)
   62ED 79            [ 4]  203 	ld	a,c
   62EE E6 01         [ 7]  204 	and	a, #0x01
   62F0 47            [ 4]  205 	ld	b,a
   62F1 04            [ 4]  206 	inc	b
   62F2 04            [ 4]  207 	inc	b
   62F3 04            [ 4]  208 	inc	b
   62F4 04            [ 4]  209 	inc	b
                            210 ;src/main.c:115: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   62F5 21 3C 62      [10]  211 	ld	hl, #_prota + 3
   62F8 5E            [ 7]  212 	ld	e,(hl)
   62F9 CB 4B         [ 8]  213 	bit	1, e
   62FB 28 04         [12]  214 	jr	Z,00103$
   62FD 3E 01         [ 7]  215 	ld	a,#0x01
   62FF 18 02         [12]  216 	jr	00104$
   6301                     217 00103$:
   6301 3E 00         [ 7]  218 	ld	a,#0x00
   6303                     219 00104$:
   6303 C6 06         [ 7]  220 	add	a, #0x06
   6305 DD 77 FF      [19]  221 	ld	-1 (ix),a
                            222 ;src/main.c:117: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   6308 FD 2A 9B 62   [20]  223 	ld	iy,(_mapa)
   630C 16 00         [ 7]  224 	ld	d,#0x00
   630E 63            [ 4]  225 	ld	h,e
   630F 6A            [ 4]  226 	ld	l,d
   6310 CB 7A         [ 8]  227 	bit	7, d
   6312 28 05         [12]  228 	jr	Z,00105$
   6314 13            [ 6]  229 	inc	de
   6315 13            [ 6]  230 	inc	de
   6316 13            [ 6]  231 	inc	de
   6317 63            [ 4]  232 	ld	h,e
   6318 6A            [ 4]  233 	ld	l,d
   6319                     234 00105$:
   6319 5C            [ 4]  235 	ld	e, h
   631A 55            [ 4]  236 	ld	d, l
   631B CB 2A         [ 8]  237 	sra	d
   631D CB 1B         [ 8]  238 	rr	e
   631F CB 2A         [ 8]  239 	sra	d
   6321 CB 1B         [ 8]  240 	rr	e
   6323 51            [ 4]  241 	ld	d,c
   6324 CB 3A         [ 8]  242 	srl	d
   6326 FD E5         [15]  243 	push	iy
   6328 21 00 C0      [10]  244 	ld	hl,#0xC000
   632B E5            [11]  245 	push	hl
   632C 3E 28         [ 7]  246 	ld	a,#0x28
   632E F5            [11]  247 	push	af
   632F 33            [ 6]  248 	inc	sp
   6330 DD 7E FF      [19]  249 	ld	a,-1 (ix)
   6333 F5            [11]  250 	push	af
   6334 33            [ 6]  251 	inc	sp
   6335 C5            [11]  252 	push	bc
   6336 33            [ 6]  253 	inc	sp
   6337 7B            [ 4]  254 	ld	a,e
   6338 F5            [11]  255 	push	af
   6339 33            [ 6]  256 	inc	sp
   633A D5            [11]  257 	push	de
   633B 33            [ 6]  258 	inc	sp
   633C CD 8D 57      [17]  259 	call	_cpct_etm_drawTileBox2x4
   633F 33            [ 6]  260 	inc	sp
   6340 DD E1         [14]  261 	pop	ix
   6342 C9            [10]  262 	ret
                            263 ;src/main.c:120: void redibujarProta() {
                            264 ;	---------------------------------
                            265 ; Function redibujarProta
                            266 ; ---------------------------------
   6343                     267 _redibujarProta::
                            268 ;src/main.c:121: borrarProta();
   6343 CD E0 62      [17]  269 	call	_borrarProta
                            270 ;src/main.c:122: prota.px = prota.x;
   6346 01 3B 62      [10]  271 	ld	bc,#_prota + 2
   6349 3A 39 62      [13]  272 	ld	a, (#_prota + 0)
   634C 02            [ 7]  273 	ld	(bc),a
                            274 ;src/main.c:123: prota.py = prota.y;
   634D 01 3C 62      [10]  275 	ld	bc,#_prota + 3
   6350 3A 3A 62      [13]  276 	ld	a, (#_prota + 1)
   6353 02            [ 7]  277 	ld	(bc),a
                            278 ;src/main.c:124: dibujarProta();
   6354 C3 BA 62      [10]  279 	jp  _dibujarProta
                            280 ;src/main.c:127: u8* getTilePtr(u8 x, u8 y) {
                            281 ;	---------------------------------
                            282 ; Function getTilePtr
                            283 ; ---------------------------------
   6357                     284 _getTilePtr::
                            285 ;src/main.c:128: return mapa + (y-ORIGEN_MAPA_Y)/4*g_map1_W + x/2;
   6357 FD 21 03 00   [14]  286 	ld	iy,#3
   635B FD 39         [15]  287 	add	iy,sp
   635D FD 6E 00      [19]  288 	ld	l,0 (iy)
   6360 26 00         [ 7]  289 	ld	h,#0x00
   6362 4D            [ 4]  290 	ld	c,l
   6363 5C            [ 4]  291 	ld	e,h
   6364 CB 7C         [ 8]  292 	bit	7, h
   6366 28 05         [12]  293 	jr	Z,00103$
   6368 23            [ 6]  294 	inc	hl
   6369 23            [ 6]  295 	inc	hl
   636A 23            [ 6]  296 	inc	hl
   636B 4D            [ 4]  297 	ld	c,l
   636C 5C            [ 4]  298 	ld	e,h
   636D                     299 00103$:
   636D 43            [ 4]  300 	ld	b, e
   636E CB 28         [ 8]  301 	sra	b
   6370 CB 19         [ 8]  302 	rr	c
   6372 CB 28         [ 8]  303 	sra	b
   6374 CB 19         [ 8]  304 	rr	c
   6376 69            [ 4]  305 	ld	l, c
   6377 60            [ 4]  306 	ld	h, b
   6378 29            [11]  307 	add	hl, hl
   6379 29            [11]  308 	add	hl, hl
   637A 09            [11]  309 	add	hl, bc
   637B 29            [11]  310 	add	hl, hl
   637C 29            [11]  311 	add	hl, hl
   637D 29            [11]  312 	add	hl, hl
   637E ED 5B 9B 62   [20]  313 	ld	de,(_mapa)
   6382 19            [11]  314 	add	hl,de
   6383 FD 21 02 00   [14]  315 	ld	iy,#2
   6387 FD 39         [15]  316 	add	iy,sp
   6389 FD 4E 00      [19]  317 	ld	c,0 (iy)
   638C CB 39         [ 8]  318 	srl	c
   638E 59            [ 4]  319 	ld	e,c
   638F 16 00         [ 7]  320 	ld	d,#0x00
   6391 19            [11]  321 	add	hl,de
   6392 C9            [10]  322 	ret
                            323 ;src/main.c:131: u8 checkCollision(int direction) { // check optimization
                            324 ;	---------------------------------
                            325 ; Function checkCollision
                            326 ; ---------------------------------
   6393                     327 _checkCollision::
   6393 DD E5         [15]  328 	push	ix
   6395 DD 21 00 00   [14]  329 	ld	ix,#0
   6399 DD 39         [15]  330 	add	ix,sp
   639B 21 F8 FF      [10]  331 	ld	hl,#-8
   639E 39            [11]  332 	add	hl,sp
   639F F9            [ 6]  333 	ld	sp,hl
                            334 ;src/main.c:134: switch (direction) {
   63A0 DD CB 05 7E   [20]  335 	bit	7, 5 (ix)
   63A4 C2 AE 64      [10]  336 	jp	NZ,00105$
   63A7 3E 03         [ 7]  337 	ld	a,#0x03
   63A9 DD BE 04      [19]  338 	cp	a, 4 (ix)
   63AC 3E 00         [ 7]  339 	ld	a,#0x00
   63AE DD 9E 05      [19]  340 	sbc	a, 5 (ix)
   63B1 E2 B6 63      [10]  341 	jp	PO, 00128$
   63B4 EE 80         [ 7]  342 	xor	a, #0x80
   63B6                     343 00128$:
   63B6 FA AE 64      [10]  344 	jp	M,00105$
   63B9 DD 5E 04      [19]  345 	ld	e,4 (ix)
   63BC 16 00         [ 7]  346 	ld	d,#0x00
   63BE 21 C5 63      [10]  347 	ld	hl,#00129$
   63C1 19            [11]  348 	add	hl,de
   63C2 19            [11]  349 	add	hl,de
   63C3 19            [11]  350 	add	hl,de
   63C4 E9            [ 4]  351 	jp	(hl)
   63C5                     352 00129$:
   63C5 C3 D1 63      [10]  353 	jp	00101$
   63C8 C3 16 64      [10]  354 	jp	00102$
   63CB C3 56 64      [10]  355 	jp	00103$
   63CE C3 82 64      [10]  356 	jp	00104$
                            357 ;src/main.c:135: case 0:
   63D1                     358 00101$:
                            359 ;src/main.c:136: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   63D1 21 3A 62      [10]  360 	ld	hl, #(_prota + 0x0001) + 0
   63D4 46            [ 7]  361 	ld	b,(hl)
   63D5 3A 39 62      [13]  362 	ld	a, (#_prota + 0)
   63D8 C6 04         [ 7]  363 	add	a, #0x04
   63DA C5            [11]  364 	push	bc
   63DB 33            [ 6]  365 	inc	sp
   63DC F5            [11]  366 	push	af
   63DD 33            [ 6]  367 	inc	sp
   63DE CD 57 63      [17]  368 	call	_getTilePtr
   63E1 F1            [10]  369 	pop	af
   63E2 DD 75 FE      [19]  370 	ld	-2 (ix),l
   63E5 DD 74 FF      [19]  371 	ld	-1 (ix),h
                            372 ;src/main.c:137: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA);
   63E8 3A 3A 62      [13]  373 	ld	a, (#(_prota + 0x0001) + 0)
   63EB C6 16         [ 7]  374 	add	a, #0x16
   63ED 47            [ 4]  375 	ld	b,a
   63EE 3A 39 62      [13]  376 	ld	a, (#_prota + 0)
   63F1 C6 04         [ 7]  377 	add	a, #0x04
   63F3 C5            [11]  378 	push	bc
   63F4 33            [ 6]  379 	inc	sp
   63F5 F5            [11]  380 	push	af
   63F6 33            [ 6]  381 	inc	sp
   63F7 CD 57 63      [17]  382 	call	_getTilePtr
   63FA F1            [10]  383 	pop	af
   63FB 4D            [ 4]  384 	ld	c,l
   63FC 44            [ 4]  385 	ld	b,h
                            386 ;src/main.c:138: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   63FD 3A 3A 62      [13]  387 	ld	a, (#(_prota + 0x0001) + 0)
   6400 C6 0B         [ 7]  388 	add	a, #0x0B
   6402 57            [ 4]  389 	ld	d,a
   6403 3A 39 62      [13]  390 	ld	a, (#_prota + 0)
   6406 C6 04         [ 7]  391 	add	a, #0x04
   6408 C5            [11]  392 	push	bc
   6409 D5            [11]  393 	push	de
   640A 33            [ 6]  394 	inc	sp
   640B F5            [11]  395 	push	af
   640C 33            [ 6]  396 	inc	sp
   640D CD 57 63      [17]  397 	call	_getTilePtr
   6410 F1            [10]  398 	pop	af
   6411 EB            [ 4]  399 	ex	de,hl
   6412 C1            [10]  400 	pop	bc
                            401 ;src/main.c:139: break;
   6413 C3 AE 64      [10]  402 	jp	00105$
                            403 ;src/main.c:140: case 1:
   6416                     404 00102$:
                            405 ;src/main.c:141: headTile  = getTilePtr(prota.x - 1, prota.y);
   6416 21 3A 62      [10]  406 	ld	hl, #(_prota + 0x0001) + 0
   6419 46            [ 7]  407 	ld	b,(hl)
   641A 21 39 62      [10]  408 	ld	hl, #_prota + 0
   641D 56            [ 7]  409 	ld	d,(hl)
   641E 15            [ 4]  410 	dec	d
   641F 4A            [ 4]  411 	ld	c, d
   6420 C5            [11]  412 	push	bc
   6421 CD 57 63      [17]  413 	call	_getTilePtr
   6424 F1            [10]  414 	pop	af
   6425 DD 75 FE      [19]  415 	ld	-2 (ix),l
   6428 DD 74 FF      [19]  416 	ld	-1 (ix),h
                            417 ;src/main.c:142: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA);
   642B 3A 3A 62      [13]  418 	ld	a, (#(_prota + 0x0001) + 0)
   642E C6 16         [ 7]  419 	add	a, #0x16
   6430 47            [ 4]  420 	ld	b,a
   6431 21 39 62      [10]  421 	ld	hl, #_prota + 0
   6434 56            [ 7]  422 	ld	d,(hl)
   6435 15            [ 4]  423 	dec	d
   6436 4A            [ 4]  424 	ld	c, d
   6437 C5            [11]  425 	push	bc
   6438 CD 57 63      [17]  426 	call	_getTilePtr
   643B F1            [10]  427 	pop	af
   643C 4D            [ 4]  428 	ld	c,l
   643D 44            [ 4]  429 	ld	b,h
                            430 ;src/main.c:143: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
   643E 3A 3A 62      [13]  431 	ld	a, (#(_prota + 0x0001) + 0)
   6441 C6 0B         [ 7]  432 	add	a, #0x0B
   6443 57            [ 4]  433 	ld	d,a
   6444 3A 39 62      [13]  434 	ld	a, (#_prota + 0)
   6447 C6 FF         [ 7]  435 	add	a,#0xFF
   6449 C5            [11]  436 	push	bc
   644A D5            [11]  437 	push	de
   644B 33            [ 6]  438 	inc	sp
   644C F5            [11]  439 	push	af
   644D 33            [ 6]  440 	inc	sp
   644E CD 57 63      [17]  441 	call	_getTilePtr
   6451 F1            [10]  442 	pop	af
   6452 EB            [ 4]  443 	ex	de,hl
   6453 C1            [10]  444 	pop	bc
                            445 ;src/main.c:144: break;
   6454 18 58         [12]  446 	jr	00105$
                            447 ;src/main.c:145: case 2:
   6456                     448 00103$:
                            449 ;src/main.c:146: headTile   = getTilePtr(prota.x, prota.y - 1);
   6456 21 3A 62      [10]  450 	ld	hl, #(_prota + 0x0001) + 0
   6459 46            [ 7]  451 	ld	b,(hl)
   645A 05            [ 4]  452 	dec	b
   645B 21 39 62      [10]  453 	ld	hl, #_prota + 0
   645E 4E            [ 7]  454 	ld	c, (hl)
   645F C5            [11]  455 	push	bc
   6460 CD 57 63      [17]  456 	call	_getTilePtr
   6463 F1            [10]  457 	pop	af
   6464 DD 75 FE      [19]  458 	ld	-2 (ix),l
   6467 DD 74 FF      [19]  459 	ld	-1 (ix),h
                            460 ;src/main.c:147: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 1);
   646A 3A 3A 62      [13]  461 	ld	a, (#(_prota + 0x0001) + 0)
   646D 47            [ 4]  462 	ld	b,a
   646E 05            [ 4]  463 	dec	b
   646F 3A 39 62      [13]  464 	ld	a, (#_prota + 0)
   6472 C6 03         [ 7]  465 	add	a, #0x03
   6474 C5            [11]  466 	push	bc
   6475 33            [ 6]  467 	inc	sp
   6476 F5            [11]  468 	push	af
   6477 33            [ 6]  469 	inc	sp
   6478 CD 57 63      [17]  470 	call	_getTilePtr
   647B F1            [10]  471 	pop	af
   647C 4D            [ 4]  472 	ld	c,l
   647D 44            [ 4]  473 	ld	b,h
                            474 ;src/main.c:148: *waistTile = 0;
   647E AF            [ 4]  475 	xor	a, a
   647F 12            [ 7]  476 	ld	(de),a
                            477 ;src/main.c:149: break;
   6480 18 2C         [12]  478 	jr	00105$
                            479 ;src/main.c:150: case 3:
   6482                     480 00104$:
                            481 ;src/main.c:151: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA + 1);
   6482 3A 3A 62      [13]  482 	ld	a, (#(_prota + 0x0001) + 0)
   6485 C6 17         [ 7]  483 	add	a, #0x17
   6487 47            [ 4]  484 	ld	b,a
   6488 21 39 62      [10]  485 	ld	hl, #_prota + 0
   648B 4E            [ 7]  486 	ld	c, (hl)
   648C C5            [11]  487 	push	bc
   648D CD 57 63      [17]  488 	call	_getTilePtr
   6490 F1            [10]  489 	pop	af
   6491 DD 75 FE      [19]  490 	ld	-2 (ix),l
   6494 DD 74 FF      [19]  491 	ld	-1 (ix),h
                            492 ;src/main.c:152: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA + 1);
   6497 3A 3A 62      [13]  493 	ld	a, (#(_prota + 0x0001) + 0)
   649A C6 17         [ 7]  494 	add	a, #0x17
   649C 47            [ 4]  495 	ld	b,a
   649D 3A 39 62      [13]  496 	ld	a, (#_prota + 0)
   64A0 C6 03         [ 7]  497 	add	a, #0x03
   64A2 C5            [11]  498 	push	bc
   64A3 33            [ 6]  499 	inc	sp
   64A4 F5            [11]  500 	push	af
   64A5 33            [ 6]  501 	inc	sp
   64A6 CD 57 63      [17]  502 	call	_getTilePtr
   64A9 F1            [10]  503 	pop	af
   64AA 4D            [ 4]  504 	ld	c,l
   64AB 44            [ 4]  505 	ld	b,h
                            506 ;src/main.c:153: *waistTile = 0;
   64AC AF            [ 4]  507 	xor	a, a
   64AD 12            [ 7]  508 	ld	(de),a
                            509 ;src/main.c:155: }
   64AE                     510 00105$:
                            511 ;src/main.c:157: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   64AE DD 6E FE      [19]  512 	ld	l,-2 (ix)
   64B1 DD 66 FF      [19]  513 	ld	h,-1 (ix)
   64B4 6E            [ 7]  514 	ld	l,(hl)
   64B5 3E 02         [ 7]  515 	ld	a,#0x02
   64B7 95            [ 4]  516 	sub	a, l
   64B8 38 0E         [12]  517 	jr	C,00106$
   64BA 0A            [ 7]  518 	ld	a,(bc)
   64BB 4F            [ 4]  519 	ld	c,a
   64BC 3E 02         [ 7]  520 	ld	a,#0x02
   64BE 91            [ 4]  521 	sub	a, c
   64BF 38 07         [12]  522 	jr	C,00106$
   64C1 1A            [ 7]  523 	ld	a,(de)
   64C2 4F            [ 4]  524 	ld	c,a
   64C3 3E 02         [ 7]  525 	ld	a,#0x02
   64C5 91            [ 4]  526 	sub	a, c
   64C6 30 04         [12]  527 	jr	NC,00107$
   64C8                     528 00106$:
                            529 ;src/main.c:158: return 1;
   64C8 2E 01         [ 7]  530 	ld	l,#0x01
   64CA 18 02         [12]  531 	jr	00110$
   64CC                     532 00107$:
                            533 ;src/main.c:160: return 0;
   64CC 2E 00         [ 7]  534 	ld	l,#0x00
   64CE                     535 00110$:
   64CE DD F9         [10]  536 	ld	sp, ix
   64D0 DD E1         [14]  537 	pop	ix
   64D2 C9            [10]  538 	ret
                            539 ;src/main.c:163: void avanzarMapa() {
                            540 ;	---------------------------------
                            541 ; Function avanzarMapa
                            542 ; ---------------------------------
   64D3                     543 _avanzarMapa::
                            544 ;src/main.c:164: if(num_mapa < NUM_MAPAS -1) {
   64D3 3A 9D 62      [13]  545 	ld	a,(#_num_mapa + 0)
   64D6 D6 02         [ 7]  546 	sub	a, #0x02
   64D8 D2 8E 69      [10]  547 	jp	NC,_menuFin
                            548 ;src/main.c:165: mapa = mapas[++num_mapa];
   64DB 21 9D 62      [10]  549 	ld	hl, #_num_mapa+0
   64DE 34            [11]  550 	inc	(hl)
   64DF FD 21 9D 62   [14]  551 	ld	iy,#_num_mapa
   64E3 FD 6E 00      [19]  552 	ld	l,0 (iy)
   64E6 26 00         [ 7]  553 	ld	h,#0x00
   64E8 29            [11]  554 	add	hl, hl
   64E9 11 B4 62      [10]  555 	ld	de,#_mapas
   64EC 19            [11]  556 	add	hl,de
   64ED 7E            [ 7]  557 	ld	a,(hl)
   64EE FD 21 9B 62   [14]  558 	ld	iy,#_mapa
   64F2 FD 77 00      [19]  559 	ld	0 (iy),a
   64F5 23            [ 6]  560 	inc	hl
   64F6 7E            [ 7]  561 	ld	a,(hl)
   64F7 32 9C 62      [13]  562 	ld	(#_mapa + 1),a
                            563 ;src/main.c:166: prota.x = prota.px = 2;
   64FA 21 3B 62      [10]  564 	ld	hl,#(_prota + 0x0002)
   64FD 36 02         [10]  565 	ld	(hl),#0x02
   64FF 21 39 62      [10]  566 	ld	hl,#_prota
   6502 36 02         [10]  567 	ld	(hl),#0x02
                            568 ;src/main.c:167: prota.mover = SI;
   6504 21 3F 62      [10]  569 	ld	hl,#(_prota + 0x0006)
                            570 ;src/main.c:168: dibujarMapa();
                            571 ;src/main.c:171: menuFin();
   6507 36 01         [10]  572 	ld	(hl), #0x01
   6509 C3 9E 62      [10]  573 	jp	_dibujarMapa
                            574 ;src/main.c:175: void moverIzquierda() {
                            575 ;	---------------------------------
                            576 ; Function moverIzquierda
                            577 ; ---------------------------------
   650C                     578 _moverIzquierda::
                            579 ;src/main.c:176: prota.mira = M_izquierda;
   650C 01 39 62      [10]  580 	ld	bc,#_prota+0
   650F 21 40 62      [10]  581 	ld	hl,#(_prota + 0x0007)
   6512 36 01         [10]  582 	ld	(hl),#0x01
                            583 ;src/main.c:177: if (!checkCollision(M_izquierda)) {
   6514 C5            [11]  584 	push	bc
   6515 21 01 00      [10]  585 	ld	hl,#0x0001
   6518 E5            [11]  586 	push	hl
   6519 CD 93 63      [17]  587 	call	_checkCollision
   651C F1            [10]  588 	pop	af
   651D C1            [10]  589 	pop	bc
   651E 7D            [ 4]  590 	ld	a,l
   651F B7            [ 4]  591 	or	a, a
   6520 C0            [11]  592 	ret	NZ
                            593 ;src/main.c:178: prota.x--;
   6521 0A            [ 7]  594 	ld	a,(bc)
   6522 C6 FF         [ 7]  595 	add	a,#0xFF
   6524 02            [ 7]  596 	ld	(bc),a
                            597 ;src/main.c:179: prota.mover = SI;
   6525 21 3F 62      [10]  598 	ld	hl,#(_prota + 0x0006)
   6528 36 01         [10]  599 	ld	(hl),#0x01
   652A C9            [10]  600 	ret
                            601 ;src/main.c:183: void moverDerecha() {
                            602 ;	---------------------------------
                            603 ; Function moverDerecha
                            604 ; ---------------------------------
   652B                     605 _moverDerecha::
                            606 ;src/main.c:184: prota.mira = M_derecha;
   652B 21 40 62      [10]  607 	ld	hl,#(_prota + 0x0007)
   652E 36 00         [10]  608 	ld	(hl),#0x00
                            609 ;src/main.c:185: if (!checkCollision(M_derecha)) {
   6530 21 00 00      [10]  610 	ld	hl,#0x0000
   6533 E5            [11]  611 	push	hl
   6534 CD 93 63      [17]  612 	call	_checkCollision
   6537 F1            [10]  613 	pop	af
   6538 7D            [ 4]  614 	ld	a,l
                            615 ;src/main.c:186: prota.x++;
   6539 21 39 62      [10]  616 	ld	hl, #_prota + 0
   653C 5E            [ 7]  617 	ld	e,(hl)
                            618 ;src/main.c:185: if (!checkCollision(M_derecha)) {
   653D B7            [ 4]  619 	or	a, a
   653E 20 0B         [12]  620 	jr	NZ,00106$
                            621 ;src/main.c:186: prota.x++;
   6540 1C            [ 4]  622 	inc	e
   6541 21 39 62      [10]  623 	ld	hl,#_prota
   6544 73            [ 7]  624 	ld	(hl),e
                            625 ;src/main.c:187: prota.mover = SI;
   6545 21 3F 62      [10]  626 	ld	hl,#(_prota + 0x0006)
   6548 36 01         [10]  627 	ld	(hl),#0x01
   654A C9            [10]  628 	ret
   654B                     629 00106$:
                            630 ;src/main.c:188: }else if ( prota.x > 68 && prota.y >72 && prota.y < 80){  //TODO que avance solo si estamos en el centro
   654B 3E 44         [ 7]  631 	ld	a,#0x44
   654D 93            [ 4]  632 	sub	a, e
   654E D0            [11]  633 	ret	NC
   654F 21 3A 62      [10]  634 	ld	hl, #_prota + 1
   6552 4E            [ 7]  635 	ld	c,(hl)
   6553 3E 48         [ 7]  636 	ld	a,#0x48
   6555 91            [ 4]  637 	sub	a, c
   6556 D0            [11]  638 	ret	NC
   6557 79            [ 4]  639 	ld	a,c
   6558 D6 50         [ 7]  640 	sub	a, #0x50
   655A D0            [11]  641 	ret	NC
                            642 ;src/main.c:189: avanzarMapa();
   655B C3 D3 64      [10]  643 	jp  _avanzarMapa
                            644 ;src/main.c:193: void moverArriba() {
                            645 ;	---------------------------------
                            646 ; Function moverArriba
                            647 ; ---------------------------------
   655E                     648 _moverArriba::
                            649 ;src/main.c:194: prota.mira = M_arriba;
   655E 21 40 62      [10]  650 	ld	hl,#(_prota + 0x0007)
   6561 36 02         [10]  651 	ld	(hl),#0x02
                            652 ;src/main.c:195: if (!checkCollision(M_arriba)) {
   6563 21 02 00      [10]  653 	ld	hl,#0x0002
   6566 E5            [11]  654 	push	hl
   6567 CD 93 63      [17]  655 	call	_checkCollision
   656A F1            [10]  656 	pop	af
   656B 7D            [ 4]  657 	ld	a,l
   656C B7            [ 4]  658 	or	a, a
   656D C0            [11]  659 	ret	NZ
                            660 ;src/main.c:196: prota.y--;
   656E 21 3A 62      [10]  661 	ld	hl,#_prota + 1
   6571 4E            [ 7]  662 	ld	c,(hl)
   6572 0D            [ 4]  663 	dec	c
   6573 71            [ 7]  664 	ld	(hl),c
                            665 ;src/main.c:197: prota.mover  = SI;
   6574 21 3F 62      [10]  666 	ld	hl,#(_prota + 0x0006)
   6577 36 01         [10]  667 	ld	(hl),#0x01
   6579 C9            [10]  668 	ret
                            669 ;src/main.c:201: void moverAbajo() {
                            670 ;	---------------------------------
                            671 ; Function moverAbajo
                            672 ; ---------------------------------
   657A                     673 _moverAbajo::
                            674 ;src/main.c:202: prota.mira = M_abajo;
   657A 21 40 62      [10]  675 	ld	hl,#(_prota + 0x0007)
   657D 36 03         [10]  676 	ld	(hl),#0x03
                            677 ;src/main.c:203: if (!checkCollision(M_abajo)) {
   657F 21 03 00      [10]  678 	ld	hl,#0x0003
   6582 E5            [11]  679 	push	hl
   6583 CD 93 63      [17]  680 	call	_checkCollision
   6586 F1            [10]  681 	pop	af
   6587 7D            [ 4]  682 	ld	a,l
   6588 B7            [ 4]  683 	or	a, a
   6589 C0            [11]  684 	ret	NZ
                            685 ;src/main.c:204: prota.y++;
   658A 01 3A 62      [10]  686 	ld	bc,#_prota + 1
   658D 0A            [ 7]  687 	ld	a,(bc)
   658E 3C            [ 4]  688 	inc	a
   658F 02            [ 7]  689 	ld	(bc),a
                            690 ;src/main.c:205: prota.mover  = SI;
   6590 21 3F 62      [10]  691 	ld	hl,#(_prota + 0x0006)
   6593 36 01         [10]  692 	ld	(hl),#0x01
   6595 C9            [10]  693 	ret
                            694 ;src/main.c:209: void dibujarCuchillo(TKnife* actual) {
                            695 ;	---------------------------------
                            696 ; Function dibujarCuchillo
                            697 ; ---------------------------------
   6596                     698 _dibujarCuchillo::
   6596 DD E5         [15]  699 	push	ix
   6598 DD 21 00 00   [14]  700 	ld	ix,#0
   659C DD 39         [15]  701 	add	ix,sp
   659E F5            [11]  702 	push	af
   659F F5            [11]  703 	push	af
                            704 ;src/main.c:210: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, actual->x, actual->y);
   65A0 DD 5E 04      [19]  705 	ld	e,4 (ix)
   65A3 DD 56 05      [19]  706 	ld	d,5 (ix)
   65A6 6B            [ 4]  707 	ld	l, e
   65A7 62            [ 4]  708 	ld	h, d
   65A8 23            [ 6]  709 	inc	hl
   65A9 46            [ 7]  710 	ld	b,(hl)
   65AA 1A            [ 7]  711 	ld	a,(de)
   65AB D5            [11]  712 	push	de
   65AC C5            [11]  713 	push	bc
   65AD 33            [ 6]  714 	inc	sp
   65AE F5            [11]  715 	push	af
   65AF 33            [ 6]  716 	inc	sp
   65B0 21 00 C0      [10]  717 	ld	hl,#0xC000
   65B3 E5            [11]  718 	push	hl
   65B4 CD DC 61      [17]  719 	call	_cpct_getScreenPtr
   65B7 D1            [10]  720 	pop	de
   65B8 E5            [11]  721 	push	hl
   65B9 FD E1         [14]  722 	pop	iy
                            723 ;src/main.c:211: if(actual->eje == E_X){
   65BB 6B            [ 4]  724 	ld	l, e
   65BC 62            [ 4]  725 	ld	h, d
   65BD 01 08 00      [10]  726 	ld	bc, #0x0008
   65C0 09            [11]  727 	add	hl, bc
   65C1 4E            [ 7]  728 	ld	c,(hl)
                            729 ;src/main.c:212: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   65C2 FD E5         [15]  730 	push	iy
   65C4 F1            [10]  731 	pop	af
   65C5 DD 77 FF      [19]  732 	ld	-1 (ix),a
   65C8 FD E5         [15]  733 	push	iy
   65CA 3B            [ 6]  734 	dec	sp
   65CB F1            [10]  735 	pop	af
   65CC 33            [ 6]  736 	inc	sp
   65CD DD 77 FE      [19]  737 	ld	-2 (ix),a
   65D0 21 04 00      [10]  738 	ld	hl,#0x0004
   65D3 19            [11]  739 	add	hl,de
   65D4 E3            [19]  740 	ex	(sp), hl
                            741 ;src/main.c:211: if(actual->eje == E_X){
   65D5 79            [ 4]  742 	ld	a,c
   65D6 B7            [ 4]  743 	or	a, a
   65D7 20 1A         [12]  744 	jr	NZ,00104$
                            745 ;src/main.c:212: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   65D9 11 00 3E      [10]  746 	ld	de,#_g_tablatrans+0
   65DC E1            [10]  747 	pop	hl
   65DD E5            [11]  748 	push	hl
   65DE 4E            [ 7]  749 	ld	c,(hl)
   65DF 23            [ 6]  750 	inc	hl
   65E0 46            [ 7]  751 	ld	b,(hl)
   65E1 D5            [11]  752 	push	de
   65E2 21 03 03      [10]  753 	ld	hl,#0x0303
   65E5 E5            [11]  754 	push	hl
   65E6 DD 6E FE      [19]  755 	ld	l,-2 (ix)
   65E9 DD 66 FF      [19]  756 	ld	h,-1 (ix)
   65EC E5            [11]  757 	push	hl
   65ED C5            [11]  758 	push	bc
   65EE CD FC 61      [17]  759 	call	_cpct_drawSpriteMaskedAlignedTable
   65F1 18 1B         [12]  760 	jr	00106$
   65F3                     761 00104$:
                            762 ;src/main.c:215: else if(actual->eje == E_Y){
   65F3 0D            [ 4]  763 	dec	c
   65F4 20 18         [12]  764 	jr	NZ,00106$
                            765 ;src/main.c:216: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   65F6 11 00 3E      [10]  766 	ld	de,#_g_tablatrans+0
   65F9 E1            [10]  767 	pop	hl
   65FA E5            [11]  768 	push	hl
   65FB 4E            [ 7]  769 	ld	c,(hl)
   65FC 23            [ 6]  770 	inc	hl
   65FD 46            [ 7]  771 	ld	b,(hl)
   65FE D5            [11]  772 	push	de
   65FF 21 02 06      [10]  773 	ld	hl,#0x0602
   6602 E5            [11]  774 	push	hl
   6603 DD 6E FE      [19]  775 	ld	l,-2 (ix)
   6606 DD 66 FF      [19]  776 	ld	h,-1 (ix)
   6609 E5            [11]  777 	push	hl
   660A C5            [11]  778 	push	bc
   660B CD FC 61      [17]  779 	call	_cpct_drawSpriteMaskedAlignedTable
   660E                     780 00106$:
   660E DD F9         [10]  781 	ld	sp, ix
   6610 DD E1         [14]  782 	pop	ix
   6612 C9            [10]  783 	ret
                            784 ;src/main.c:220: void borrarCuchillo(TKnife* actual) {
                            785 ;	---------------------------------
                            786 ; Function borrarCuchillo
                            787 ; ---------------------------------
   6613                     788 _borrarCuchillo::
   6613 DD E5         [15]  789 	push	ix
   6615 DD 21 00 00   [14]  790 	ld	ix,#0
   6619 DD 39         [15]  791 	add	ix,sp
   661B 3B            [ 6]  792 	dec	sp
                            793 ;src/main.c:221: u8 w = 2 + (actual->px & 1);
   661C DD 5E 04      [19]  794 	ld	e,4 (ix)
   661F DD 56 05      [19]  795 	ld	d,5 (ix)
   6622 6B            [ 4]  796 	ld	l, e
   6623 62            [ 4]  797 	ld	h, d
   6624 23            [ 6]  798 	inc	hl
   6625 23            [ 6]  799 	inc	hl
   6626 4E            [ 7]  800 	ld	c,(hl)
   6627 79            [ 4]  801 	ld	a,c
   6628 E6 01         [ 7]  802 	and	a, #0x01
   662A 47            [ 4]  803 	ld	b,a
   662B 04            [ 4]  804 	inc	b
   662C 04            [ 4]  805 	inc	b
                            806 ;src/main.c:222: u8 h = 2 + (actual->py & 3 ? 1 : 0);
   662D EB            [ 4]  807 	ex	de,hl
   662E 23            [ 6]  808 	inc	hl
   662F 23            [ 6]  809 	inc	hl
   6630 23            [ 6]  810 	inc	hl
   6631 5E            [ 7]  811 	ld	e,(hl)
   6632 7B            [ 4]  812 	ld	a,e
   6633 E6 03         [ 7]  813 	and	a, #0x03
   6635 28 04         [12]  814 	jr	Z,00103$
   6637 3E 01         [ 7]  815 	ld	a,#0x01
   6639 18 02         [12]  816 	jr	00104$
   663B                     817 00103$:
   663B 3E 00         [ 7]  818 	ld	a,#0x00
   663D                     819 00104$:
   663D C6 02         [ 7]  820 	add	a, #0x02
   663F DD 77 FF      [19]  821 	ld	-1 (ix),a
                            822 ;src/main.c:223: cpct_etm_drawTileBox2x4 (actual->px / 2, (actual->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   6642 FD 2A 9B 62   [20]  823 	ld	iy,(_mapa)
   6646 16 00         [ 7]  824 	ld	d,#0x00
   6648 63            [ 4]  825 	ld	h,e
   6649 6A            [ 4]  826 	ld	l,d
   664A CB 7A         [ 8]  827 	bit	7, d
   664C 28 05         [12]  828 	jr	Z,00105$
   664E 13            [ 6]  829 	inc	de
   664F 13            [ 6]  830 	inc	de
   6650 13            [ 6]  831 	inc	de
   6651 63            [ 4]  832 	ld	h,e
   6652 6A            [ 4]  833 	ld	l,d
   6653                     834 00105$:
   6653 5C            [ 4]  835 	ld	e, h
   6654 55            [ 4]  836 	ld	d, l
   6655 CB 2A         [ 8]  837 	sra	d
   6657 CB 1B         [ 8]  838 	rr	e
   6659 CB 2A         [ 8]  839 	sra	d
   665B CB 1B         [ 8]  840 	rr	e
   665D 51            [ 4]  841 	ld	d,c
   665E CB 3A         [ 8]  842 	srl	d
   6660 FD E5         [15]  843 	push	iy
   6662 21 00 C0      [10]  844 	ld	hl,#0xC000
   6665 E5            [11]  845 	push	hl
   6666 3E 28         [ 7]  846 	ld	a,#0x28
   6668 F5            [11]  847 	push	af
   6669 33            [ 6]  848 	inc	sp
   666A DD 7E FF      [19]  849 	ld	a,-1 (ix)
   666D F5            [11]  850 	push	af
   666E 33            [ 6]  851 	inc	sp
   666F C5            [11]  852 	push	bc
   6670 33            [ 6]  853 	inc	sp
   6671 7B            [ 4]  854 	ld	a,e
   6672 F5            [11]  855 	push	af
   6673 33            [ 6]  856 	inc	sp
   6674 D5            [11]  857 	push	de
   6675 33            [ 6]  858 	inc	sp
   6676 CD 8D 57      [17]  859 	call	_cpct_etm_drawTileBox2x4
   6679 33            [ 6]  860 	inc	sp
   667A DD E1         [14]  861 	pop	ix
   667C C9            [10]  862 	ret
                            863 ;src/main.c:226: void redibujarCuchillo(TKnife* actual) {
                            864 ;	---------------------------------
                            865 ; Function redibujarCuchillo
                            866 ; ---------------------------------
   667D                     867 _redibujarCuchillo::
   667D DD E5         [15]  868 	push	ix
   667F DD 21 00 00   [14]  869 	ld	ix,#0
   6683 DD 39         [15]  870 	add	ix,sp
                            871 ;src/main.c:227: borrarCuchillo(actual);
   6685 DD 6E 04      [19]  872 	ld	l,4 (ix)
   6688 DD 66 05      [19]  873 	ld	h,5 (ix)
   668B E5            [11]  874 	push	hl
   668C CD 13 66      [17]  875 	call	_borrarCuchillo
   668F F1            [10]  876 	pop	af
                            877 ;src/main.c:228: actual->px = actual->x;
   6690 DD 4E 04      [19]  878 	ld	c,4 (ix)
   6693 DD 46 05      [19]  879 	ld	b,5 (ix)
   6696 59            [ 4]  880 	ld	e, c
   6697 50            [ 4]  881 	ld	d, b
   6698 13            [ 6]  882 	inc	de
   6699 13            [ 6]  883 	inc	de
   669A 0A            [ 7]  884 	ld	a,(bc)
   669B 12            [ 7]  885 	ld	(de),a
                            886 ;src/main.c:229: actual->py = actual->y;
   669C 59            [ 4]  887 	ld	e, c
   669D 50            [ 4]  888 	ld	d, b
   669E 13            [ 6]  889 	inc	de
   669F 13            [ 6]  890 	inc	de
   66A0 13            [ 6]  891 	inc	de
   66A1 69            [ 4]  892 	ld	l, c
   66A2 60            [ 4]  893 	ld	h, b
   66A3 23            [ 6]  894 	inc	hl
   66A4 7E            [ 7]  895 	ld	a,(hl)
   66A5 12            [ 7]  896 	ld	(de),a
                            897 ;src/main.c:230: dibujarCuchillo(actual);
   66A6 C5            [11]  898 	push	bc
   66A7 CD 96 65      [17]  899 	call	_dibujarCuchillo
   66AA F1            [10]  900 	pop	af
   66AB DD E1         [14]  901 	pop	ix
   66AD C9            [10]  902 	ret
                            903 ;src/main.c:234: void lanzarCuchillo(){
                            904 ;	---------------------------------
                            905 ; Function lanzarCuchillo
                            906 ; ---------------------------------
   66AE                     907 _lanzarCuchillo::
   66AE DD E5         [15]  908 	push	ix
   66B0 DD 21 00 00   [14]  909 	ld	ix,#0
   66B4 DD 39         [15]  910 	add	ix,sp
   66B6 21 FA FF      [10]  911 	ld	hl,#-6
   66B9 39            [11]  912 	add	hl,sp
   66BA F9            [ 6]  913 	ld	sp,hl
                            914 ;src/main.c:236: TKnife* actual = cu;
   66BB 01 41 62      [10]  915 	ld	bc,#_cu+0
                            916 ;src/main.c:239: while(i>0 && actual->lanzado){
   66BE 1E 0A         [ 7]  917 	ld	e,#0x0A
   66C0                     918 00102$:
   66C0 21 06 00      [10]  919 	ld	hl,#0x0006
   66C3 09            [11]  920 	add	hl,bc
   66C4 DD 75 FE      [19]  921 	ld	-2 (ix),l
   66C7 DD 74 FF      [19]  922 	ld	-1 (ix),h
   66CA 7B            [ 4]  923 	ld	a,e
   66CB B7            [ 4]  924 	or	a, a
   66CC 28 13         [12]  925 	jr	Z,00104$
   66CE DD 6E FE      [19]  926 	ld	l,-2 (ix)
   66D1 DD 66 FF      [19]  927 	ld	h,-1 (ix)
   66D4 7E            [ 7]  928 	ld	a,(hl)
   66D5 B7            [ 4]  929 	or	a, a
   66D6 28 09         [12]  930 	jr	Z,00104$
                            931 ;src/main.c:240: --i;
   66D8 1D            [ 4]  932 	dec	e
                            933 ;src/main.c:241: actual++;
   66D9 21 09 00      [10]  934 	ld	hl,#0x0009
   66DC 09            [11]  935 	add	hl,bc
   66DD 4D            [ 4]  936 	ld	c,l
   66DE 44            [ 4]  937 	ld	b,h
   66DF 18 DF         [12]  938 	jr	00102$
   66E1                     939 00104$:
                            940 ;src/main.c:244: if(i>0 && !actual->lanzado){
   66E1 7B            [ 4]  941 	ld	a,e
   66E2 B7            [ 4]  942 	or	a, a
   66E3 CA 50 68      [10]  943 	jp	Z,00127$
   66E6 DD 6E FE      [19]  944 	ld	l,-2 (ix)
   66E9 DD 66 FF      [19]  945 	ld	h,-1 (ix)
   66EC 7E            [ 7]  946 	ld	a,(hl)
   66ED B7            [ 4]  947 	or	a, a
   66EE C2 50 68      [10]  948 	jp	NZ,00127$
                            949 ;src/main.c:246: if(prota.mira == M_derecha){
   66F1 21 40 62      [10]  950 	ld	hl, #_prota + 7
   66F4 6E            [ 7]  951 	ld	l,(hl)
                            952 ;src/main.c:249: actual->direccion = M_derecha;
   66F5 FD 21 07 00   [14]  953 	ld	iy,#0x0007
   66F9 FD 09         [15]  954 	add	iy, bc
                            955 ;src/main.c:251: actual->y=prota.y + G_HERO_H /2;
   66FB 59            [ 4]  956 	ld	e, c
   66FC 50            [ 4]  957 	ld	d, b
   66FD 13            [ 6]  958 	inc	de
                            959 ;src/main.c:252: actual->sprite=g_knifeX_0;
   66FE 79            [ 4]  960 	ld	a,c
   66FF C6 04         [ 7]  961 	add	a, #0x04
   6701 DD 77 FC      [19]  962 	ld	-4 (ix),a
   6704 78            [ 4]  963 	ld	a,b
   6705 CE 00         [ 7]  964 	adc	a, #0x00
   6707 DD 77 FD      [19]  965 	ld	-3 (ix),a
                            966 ;src/main.c:253: actual->eje = E_X;
   670A 79            [ 4]  967 	ld	a,c
   670B C6 08         [ 7]  968 	add	a, #0x08
   670D DD 77 FA      [19]  969 	ld	-6 (ix),a
   6710 78            [ 4]  970 	ld	a,b
   6711 CE 00         [ 7]  971 	adc	a, #0x00
   6713 DD 77 FB      [19]  972 	ld	-5 (ix),a
                            973 ;src/main.c:246: if(prota.mira == M_derecha){
   6716 7D            [ 4]  974 	ld	a,l
   6717 B7            [ 4]  975 	or	a, a
   6718 20 4F         [12]  976 	jr	NZ,00122$
                            977 ;src/main.c:247: if( (LIMITE_DERECHO - (prota.x + G_HERO_W) ) >= G_KNIFEX_0_W + 1){
   671A 21 39 62      [10]  978 	ld	hl, #_prota + 0
   671D 6E            [ 7]  979 	ld	l,(hl)
   671E 26 00         [ 7]  980 	ld	h,#0x00
   6720 D5            [11]  981 	push	de
   6721 11 07 00      [10]  982 	ld	de,#0x0007
   6724 19            [11]  983 	add	hl, de
   6725 D1            [10]  984 	pop	de
   6726 3E 4C         [ 7]  985 	ld	a,#0x4C
   6728 95            [ 4]  986 	sub	a, l
   6729 6F            [ 4]  987 	ld	l,a
   672A 3E 00         [ 7]  988 	ld	a,#0x00
   672C 9C            [ 4]  989 	sbc	a, h
   672D 67            [ 4]  990 	ld	h,a
   672E 7D            [ 4]  991 	ld	a,l
   672F D6 04         [ 7]  992 	sub	a, #0x04
   6731 7C            [ 4]  993 	ld	a,h
   6732 17            [ 4]  994 	rla
   6733 3F            [ 4]  995 	ccf
   6734 1F            [ 4]  996 	rra
   6735 DE 80         [ 7]  997 	sbc	a, #0x80
   6737 DA 50 68      [10]  998 	jp	C,00127$
                            999 ;src/main.c:248: actual->lanzado = SI;
   673A DD 6E FE      [19] 1000 	ld	l,-2 (ix)
   673D DD 66 FF      [19] 1001 	ld	h,-1 (ix)
   6740 36 01         [10] 1002 	ld	(hl),#0x01
                           1003 ;src/main.c:249: actual->direccion = M_derecha;
   6742 FD 36 00 00   [19] 1004 	ld	0 (iy), #0x00
                           1005 ;src/main.c:250: actual->x=prota.x + G_HERO_W;
   6746 3A 39 62      [13] 1006 	ld	a, (#_prota + 0)
   6749 C6 07         [ 7] 1007 	add	a, #0x07
   674B 02            [ 7] 1008 	ld	(bc),a
                           1009 ;src/main.c:251: actual->y=prota.y + G_HERO_H /2;
   674C 3A 3A 62      [13] 1010 	ld	a, (#(_prota + 0x0001) + 0)
   674F C6 0B         [ 7] 1011 	add	a, #0x0B
   6751 12            [ 7] 1012 	ld	(de),a
                           1013 ;src/main.c:252: actual->sprite=g_knifeX_0;
   6752 DD 6E FC      [19] 1014 	ld	l,-4 (ix)
   6755 DD 66 FD      [19] 1015 	ld	h,-3 (ix)
   6758 36 B8         [10] 1016 	ld	(hl),#<(_g_knifeX_0)
   675A 23            [ 6] 1017 	inc	hl
   675B 36 54         [10] 1018 	ld	(hl),#>(_g_knifeX_0)
                           1019 ;src/main.c:253: actual->eje = E_X;
   675D E1            [10] 1020 	pop	hl
   675E E5            [11] 1021 	push	hl
   675F 36 00         [10] 1022 	ld	(hl),#0x00
                           1023 ;src/main.c:254: dibujarCuchillo(actual);
   6761 C5            [11] 1024 	push	bc
   6762 CD 96 65      [17] 1025 	call	_dibujarCuchillo
   6765 F1            [10] 1026 	pop	af
   6766 C3 50 68      [10] 1027 	jp	00127$
   6769                    1028 00122$:
                           1029 ;src/main.c:257: else if(prota.mira == M_izquierda){
   6769 7D            [ 4] 1030 	ld	a,l
   676A 3D            [ 4] 1031 	dec	a
   676B 20 49         [12] 1032 	jr	NZ,00119$
                           1033 ;src/main.c:258: if( (prota.x - 4 ) >= G_KNIFEX_1_W + 1){
   676D 21 39 62      [10] 1034 	ld	hl, #_prota + 0
   6770 6E            [ 7] 1035 	ld	l,(hl)
   6771 26 00         [ 7] 1036 	ld	h,#0x00
   6773 7D            [ 4] 1037 	ld	a,l
   6774 C6 FC         [ 7] 1038 	add	a,#0xFC
   6776 6F            [ 4] 1039 	ld	l,a
   6777 7C            [ 4] 1040 	ld	a,h
   6778 CE FF         [ 7] 1041 	adc	a,#0xFF
   677A 67            [ 4] 1042 	ld	h,a
   677B 7D            [ 4] 1043 	ld	a,l
   677C D6 04         [ 7] 1044 	sub	a, #0x04
   677E 7C            [ 4] 1045 	ld	a,h
   677F 17            [ 4] 1046 	rla
   6780 3F            [ 4] 1047 	ccf
   6781 1F            [ 4] 1048 	rra
   6782 DE 80         [ 7] 1049 	sbc	a, #0x80
   6784 DA 50 68      [10] 1050 	jp	C,00127$
                           1051 ;src/main.c:259: actual->lanzado = SI;
   6787 DD 6E FE      [19] 1052 	ld	l,-2 (ix)
   678A DD 66 FF      [19] 1053 	ld	h,-1 (ix)
   678D 36 01         [10] 1054 	ld	(hl),#0x01
                           1055 ;src/main.c:260: actual->direccion = M_izquierda;
   678F FD 36 00 01   [19] 1056 	ld	0 (iy), #0x01
                           1057 ;src/main.c:261: actual->x = prota.x - G_KNIFEX_0_W;
   6793 3A 39 62      [13] 1058 	ld	a, (#_prota + 0)
   6796 C6 FD         [ 7] 1059 	add	a,#0xFD
   6798 02            [ 7] 1060 	ld	(bc),a
                           1061 ;src/main.c:262: actual->y = prota.y + G_HERO_H /2;
   6799 3A 3A 62      [13] 1062 	ld	a, (#(_prota + 0x0001) + 0)
   679C C6 0B         [ 7] 1063 	add	a, #0x0B
   679E 12            [ 7] 1064 	ld	(de),a
                           1065 ;src/main.c:263: actual->sprite = g_knifeX_1;
   679F DD 6E FC      [19] 1066 	ld	l,-4 (ix)
   67A2 DD 66 FD      [19] 1067 	ld	h,-3 (ix)
   67A5 36 C1         [10] 1068 	ld	(hl),#<(_g_knifeX_1)
   67A7 23            [ 6] 1069 	inc	hl
   67A8 36 54         [10] 1070 	ld	(hl),#>(_g_knifeX_1)
                           1071 ;src/main.c:264: actual->eje = E_X;
   67AA E1            [10] 1072 	pop	hl
   67AB E5            [11] 1073 	push	hl
   67AC 36 00         [10] 1074 	ld	(hl),#0x00
                           1075 ;src/main.c:265: dibujarCuchillo(actual);
   67AE C5            [11] 1076 	push	bc
   67AF CD 96 65      [17] 1077 	call	_dibujarCuchillo
   67B2 F1            [10] 1078 	pop	af
   67B3 C3 50 68      [10] 1079 	jp	00127$
   67B6                    1080 00119$:
                           1081 ;src/main.c:268: else if(prota.mira == M_abajo){
   67B6 7D            [ 4] 1082 	ld	a,l
   67B7 D6 03         [ 7] 1083 	sub	a, #0x03
   67B9 20 4D         [12] 1084 	jr	NZ,00116$
                           1085 ;src/main.c:270: if((valor - (prota.y + G_HERO_H)) >= G_KNIFEY_0_H + 1){
   67BB 21 3A 62      [10] 1086 	ld	hl, #(_prota + 0x0001) + 0
   67BE 6E            [ 7] 1087 	ld	l,(hl)
   67BF 26 00         [ 7] 1088 	ld	h,#0x00
   67C1 D5            [11] 1089 	push	de
   67C2 11 16 00      [10] 1090 	ld	de,#0x0016
   67C5 19            [11] 1091 	add	hl, de
   67C6 D1            [10] 1092 	pop	de
   67C7 3E A8         [ 7] 1093 	ld	a,#0xA8
   67C9 95            [ 4] 1094 	sub	a, l
   67CA 6F            [ 4] 1095 	ld	l,a
   67CB 3E 00         [ 7] 1096 	ld	a,#0x00
   67CD 9C            [ 4] 1097 	sbc	a, h
   67CE 67            [ 4] 1098 	ld	h,a
   67CF 7D            [ 4] 1099 	ld	a,l
   67D0 D6 07         [ 7] 1100 	sub	a, #0x07
   67D2 7C            [ 4] 1101 	ld	a,h
   67D3 17            [ 4] 1102 	rla
   67D4 3F            [ 4] 1103 	ccf
   67D5 1F            [ 4] 1104 	rra
   67D6 DE 80         [ 7] 1105 	sbc	a, #0x80
   67D8 38 76         [12] 1106 	jr	C,00127$
                           1107 ;src/main.c:271: actual->lanzado = SI;
   67DA DD 6E FE      [19] 1108 	ld	l,-2 (ix)
   67DD DD 66 FF      [19] 1109 	ld	h,-1 (ix)
   67E0 36 01         [10] 1110 	ld	(hl),#0x01
                           1111 ;src/main.c:272: actual->direccion = M_abajo;
   67E2 FD 36 00 03   [19] 1112 	ld	0 (iy), #0x03
                           1113 ;src/main.c:273: actual->x = prota.x + G_HERO_W / 2;
   67E6 3A 39 62      [13] 1114 	ld	a, (#_prota + 0)
   67E9 C6 03         [ 7] 1115 	add	a, #0x03
   67EB 02            [ 7] 1116 	ld	(bc),a
                           1117 ;src/main.c:274: actual->y = prota.y + G_HERO_H;
   67EC 3A 3A 62      [13] 1118 	ld	a, (#(_prota + 0x0001) + 0)
   67EF C6 16         [ 7] 1119 	add	a, #0x16
   67F1 12            [ 7] 1120 	ld	(de),a
                           1121 ;src/main.c:275: actual->sprite = g_knifeY_0;
   67F2 DD 6E FC      [19] 1122 	ld	l,-4 (ix)
   67F5 DD 66 FD      [19] 1123 	ld	h,-3 (ix)
   67F8 36 A0         [10] 1124 	ld	(hl),#<(_g_knifeY_0)
   67FA 23            [ 6] 1125 	inc	hl
   67FB 36 54         [10] 1126 	ld	(hl),#>(_g_knifeY_0)
                           1127 ;src/main.c:276: actual->eje = E_Y;
   67FD E1            [10] 1128 	pop	hl
   67FE E5            [11] 1129 	push	hl
   67FF 36 01         [10] 1130 	ld	(hl),#0x01
                           1131 ;src/main.c:277: dibujarCuchillo(actual);
   6801 C5            [11] 1132 	push	bc
   6802 CD 96 65      [17] 1133 	call	_dibujarCuchillo
   6805 F1            [10] 1134 	pop	af
   6806 18 48         [12] 1135 	jr	00127$
   6808                    1136 00116$:
                           1137 ;src/main.c:280: else if(prota.mira == M_arriba){
   6808 7D            [ 4] 1138 	ld	a,l
   6809 D6 02         [ 7] 1139 	sub	a, #0x02
   680B 20 43         [12] 1140 	jr	NZ,00127$
                           1141 ;src/main.c:281: if((prota.y - 8)>= G_KNIFEY_0_H +1 ){
   680D 21 3A 62      [10] 1142 	ld	hl, #(_prota + 0x0001) + 0
   6810 6E            [ 7] 1143 	ld	l,(hl)
   6811 26 00         [ 7] 1144 	ld	h,#0x00
   6813 7D            [ 4] 1145 	ld	a,l
   6814 C6 F8         [ 7] 1146 	add	a,#0xF8
   6816 6F            [ 4] 1147 	ld	l,a
   6817 7C            [ 4] 1148 	ld	a,h
   6818 CE FF         [ 7] 1149 	adc	a,#0xFF
   681A 67            [ 4] 1150 	ld	h,a
   681B 7D            [ 4] 1151 	ld	a,l
   681C D6 07         [ 7] 1152 	sub	a, #0x07
   681E 7C            [ 4] 1153 	ld	a,h
   681F 17            [ 4] 1154 	rla
   6820 3F            [ 4] 1155 	ccf
   6821 1F            [ 4] 1156 	rra
   6822 DE 80         [ 7] 1157 	sbc	a, #0x80
   6824 38 2A         [12] 1158 	jr	C,00127$
                           1159 ;src/main.c:282: actual->lanzado = SI;
   6826 DD 6E FE      [19] 1160 	ld	l,-2 (ix)
   6829 DD 66 FF      [19] 1161 	ld	h,-1 (ix)
   682C 36 01         [10] 1162 	ld	(hl),#0x01
                           1163 ;src/main.c:283: actual->direccion = M_arriba;
   682E FD 36 00 02   [19] 1164 	ld	0 (iy), #0x02
                           1165 ;src/main.c:284: actual->x = prota.x + G_HERO_W / 2;
   6832 3A 39 62      [13] 1166 	ld	a, (#_prota + 0)
   6835 C6 03         [ 7] 1167 	add	a, #0x03
   6837 02            [ 7] 1168 	ld	(bc),a
                           1169 ;src/main.c:285: actual->y = prota.y;
   6838 3A 3A 62      [13] 1170 	ld	a, (#(_prota + 0x0001) + 0)
   683B 12            [ 7] 1171 	ld	(de),a
                           1172 ;src/main.c:286: actual->sprite = g_knifeY_1;
   683C DD 6E FC      [19] 1173 	ld	l,-4 (ix)
   683F DD 66 FD      [19] 1174 	ld	h,-3 (ix)
   6842 36 AC         [10] 1175 	ld	(hl),#<(_g_knifeY_1)
   6844 23            [ 6] 1176 	inc	hl
   6845 36 54         [10] 1177 	ld	(hl),#>(_g_knifeY_1)
                           1178 ;src/main.c:287: actual->eje = E_Y;
   6847 E1            [10] 1179 	pop	hl
   6848 E5            [11] 1180 	push	hl
   6849 36 01         [10] 1181 	ld	(hl),#0x01
                           1182 ;src/main.c:288: dibujarCuchillo(actual);
   684B C5            [11] 1183 	push	bc
   684C CD 96 65      [17] 1184 	call	_dibujarCuchillo
   684F F1            [10] 1185 	pop	af
   6850                    1186 00127$:
   6850 DD F9         [10] 1187 	ld	sp, ix
   6852 DD E1         [14] 1188 	pop	ix
   6854 C9            [10] 1189 	ret
                           1190 ;src/main.c:294: void comprobarTeclado() {
                           1191 ;	---------------------------------
                           1192 ; Function comprobarTeclado
                           1193 ; ---------------------------------
   6855                    1194 _comprobarTeclado::
                           1195 ;src/main.c:295: cpct_scanKeyboard_if();
   6855 CD E5 58      [17] 1196 	call	_cpct_scanKeyboard_if
                           1197 ;src/main.c:297: if (cpct_isAnyKeyPressed()) {
   6858 CD D8 58      [17] 1198 	call	_cpct_isAnyKeyPressed
   685B 7D            [ 4] 1199 	ld	a,l
   685C B7            [ 4] 1200 	or	a, a
   685D C8            [11] 1201 	ret	Z
                           1202 ;src/main.c:298: if (cpct_isKeyPressed(Key_CursorLeft))
   685E 21 01 01      [10] 1203 	ld	hl,#0x0101
   6861 CD F3 56      [17] 1204 	call	_cpct_isKeyPressed
   6864 7D            [ 4] 1205 	ld	a,l
   6865 B7            [ 4] 1206 	or	a, a
                           1207 ;src/main.c:299: moverIzquierda();
   6866 C2 0C 65      [10] 1208 	jp	NZ,_moverIzquierda
                           1209 ;src/main.c:300: else if (cpct_isKeyPressed(Key_CursorRight))
   6869 21 00 02      [10] 1210 	ld	hl,#0x0200
   686C CD F3 56      [17] 1211 	call	_cpct_isKeyPressed
   686F 7D            [ 4] 1212 	ld	a,l
   6870 B7            [ 4] 1213 	or	a, a
                           1214 ;src/main.c:301: moverDerecha();
   6871 C2 2B 65      [10] 1215 	jp	NZ,_moverDerecha
                           1216 ;src/main.c:302: else if (cpct_isKeyPressed(Key_CursorUp))
   6874 21 00 01      [10] 1217 	ld	hl,#0x0100
   6877 CD F3 56      [17] 1218 	call	_cpct_isKeyPressed
   687A 7D            [ 4] 1219 	ld	a,l
   687B B7            [ 4] 1220 	or	a, a
                           1221 ;src/main.c:303: moverArriba();
   687C C2 5E 65      [10] 1222 	jp	NZ,_moverArriba
                           1223 ;src/main.c:304: else if (cpct_isKeyPressed(Key_CursorDown))
   687F 21 00 04      [10] 1224 	ld	hl,#0x0400
   6882 CD F3 56      [17] 1225 	call	_cpct_isKeyPressed
   6885 7D            [ 4] 1226 	ld	a,l
   6886 B7            [ 4] 1227 	or	a, a
                           1228 ;src/main.c:305: moverAbajo();
   6887 C2 7A 65      [10] 1229 	jp	NZ,_moverAbajo
                           1230 ;src/main.c:306: else if (cpct_isKeyPressed(Key_Space))
   688A 21 05 80      [10] 1231 	ld	hl,#0x8005
   688D CD F3 56      [17] 1232 	call	_cpct_isKeyPressed
   6890 7D            [ 4] 1233 	ld	a,l
   6891 B7            [ 4] 1234 	or	a, a
   6892 C8            [11] 1235 	ret	Z
                           1236 ;src/main.c:307: lanzarCuchillo();
   6893 C3 AE 66      [10] 1237 	jp  _lanzarCuchillo
                           1238 ;src/main.c:313: void moverCuchillo(){
                           1239 ;	---------------------------------
                           1240 ; Function moverCuchillo
                           1241 ; ---------------------------------
   6896                    1242 _moverCuchillo::
   6896 DD E5         [15] 1243 	push	ix
   6898 DD 21 00 00   [14] 1244 	ld	ix,#0
   689C DD 39         [15] 1245 	add	ix,sp
   689E 3B            [ 6] 1246 	dec	sp
                           1247 ;src/main.c:315: u8 i = 10 + 1;
   689F DD 36 FF 0B   [19] 1248 	ld	-1 (ix),#0x0B
                           1249 ;src/main.c:316: TKnife* actual = cu;
   68A3 11 41 62      [10] 1250 	ld	de,#_cu+0
                           1251 ;src/main.c:318: while(--i){
   68A6                    1252 00134$:
   68A6 DD 35 FF      [23] 1253 	dec	-1 (ix)
   68A9 DD 7E FF      [19] 1254 	ld	a, -1 (ix)
   68AC B7            [ 4] 1255 	or	a, a
   68AD CA 8A 69      [10] 1256 	jp	Z,00137$
                           1257 ;src/main.c:319: if(actual->lanzado){
   68B0 21 06 00      [10] 1258 	ld	hl,#0x0006
   68B3 19            [11] 1259 	add	hl,de
   68B4 4D            [ 4] 1260 	ld	c,l
   68B5 44            [ 4] 1261 	ld	b,h
   68B6 0A            [ 7] 1262 	ld	a,(bc)
   68B7 B7            [ 4] 1263 	or	a, a
   68B8 CA 82 69      [10] 1264 	jp	Z,00133$
                           1265 ;src/main.c:320: if(actual->direccion == M_derecha){
   68BB D5            [11] 1266 	push	de
   68BC FD E1         [14] 1267 	pop	iy
   68BE FD 6E 07      [19] 1268 	ld	l,7 (iy)
   68C1 7D            [ 4] 1269 	ld	a,l
   68C2 B7            [ 4] 1270 	or	a, a
   68C3 20 29         [12] 1271 	jr	NZ,00130$
                           1272 ;src/main.c:321: if(actual->x< LIMITE_DERECHO - G_KNIFEX_0_W){
   68C5 1A            [ 7] 1273 	ld	a,(de)
   68C6 6F            [ 4] 1274 	ld	l,a
   68C7 D6 49         [ 7] 1275 	sub	a, #0x49
   68C9 3E 00         [ 7] 1276 	ld	a,#0x00
   68CB 17            [ 4] 1277 	rla
   68CC B7            [ 4] 1278 	or	a, a
   68CD 28 0D         [12] 1279 	jr	Z,00104$
                           1280 ;src/main.c:322: actual->x++;
   68CF 7D            [ 4] 1281 	ld	a,l
   68D0 3C            [ 4] 1282 	inc	a
   68D1 12            [ 7] 1283 	ld	(de),a
                           1284 ;src/main.c:324: redibujarCuchillo(actual);
   68D2 D5            [11] 1285 	push	de
   68D3 D5            [11] 1286 	push	de
   68D4 CD 7D 66      [17] 1287 	call	_redibujarCuchillo
   68D7 F1            [10] 1288 	pop	af
   68D8 D1            [10] 1289 	pop	de
   68D9 C3 82 69      [10] 1290 	jp	00133$
   68DC                    1291 00104$:
                           1292 ;src/main.c:326: else if(actual->x >= LIMITE_DERECHO  - G_KNIFEX_0_W){
   68DC B7            [ 4] 1293 	or	a, a
   68DD C2 82 69      [10] 1294 	jp	NZ,00133$
                           1295 ;src/main.c:327: borrarCuchillo(actual);
   68E0 C5            [11] 1296 	push	bc
   68E1 D5            [11] 1297 	push	de
   68E2 D5            [11] 1298 	push	de
   68E3 CD 13 66      [17] 1299 	call	_borrarCuchillo
   68E6 F1            [10] 1300 	pop	af
   68E7 D1            [10] 1301 	pop	de
   68E8 C1            [10] 1302 	pop	bc
                           1303 ;src/main.c:328: actual->lanzado = NO;
   68E9 AF            [ 4] 1304 	xor	a, a
   68EA 02            [ 7] 1305 	ld	(bc),a
   68EB C3 82 69      [10] 1306 	jp	00133$
   68EE                    1307 00130$:
                           1308 ;src/main.c:331: else if(actual->direccion == M_izquierda){
   68EE 7D            [ 4] 1309 	ld	a,l
   68EF 3D            [ 4] 1310 	dec	a
   68F0 20 29         [12] 1311 	jr	NZ,00127$
                           1312 ;src/main.c:321: if(actual->x< LIMITE_DERECHO - G_KNIFEX_0_W){
   68F2 1A            [ 7] 1313 	ld	a,(de)
   68F3 6F            [ 4] 1314 	ld	l,a
                           1315 ;src/main.c:332: if(actual->x > LIMITE_IZQUIERDO){
   68F4 3E 04         [ 7] 1316 	ld	a,#0x04
   68F6 95            [ 4] 1317 	sub	a, l
   68F7 3E 00         [ 7] 1318 	ld	a,#0x00
   68F9 17            [ 4] 1319 	rla
   68FA B7            [ 4] 1320 	or	a, a
   68FB 28 0E         [12] 1321 	jr	Z,00109$
                           1322 ;src/main.c:333: actual->x--;
   68FD 4D            [ 4] 1323 	ld	c,l
   68FE 0D            [ 4] 1324 	dec	c
   68FF 79            [ 4] 1325 	ld	a,c
   6900 12            [ 7] 1326 	ld	(de),a
                           1327 ;src/main.c:335: redibujarCuchillo(actual);
   6901 D5            [11] 1328 	push	de
   6902 D5            [11] 1329 	push	de
   6903 CD 7D 66      [17] 1330 	call	_redibujarCuchillo
   6906 F1            [10] 1331 	pop	af
   6907 D1            [10] 1332 	pop	de
   6908 C3 82 69      [10] 1333 	jp	00133$
   690B                    1334 00109$:
                           1335 ;src/main.c:336: }else if(actual->x <= LIMITE_IZQUIERDO){
   690B B7            [ 4] 1336 	or	a, a
   690C 20 74         [12] 1337 	jr	NZ,00133$
                           1338 ;src/main.c:337: borrarCuchillo(actual);
   690E C5            [11] 1339 	push	bc
   690F D5            [11] 1340 	push	de
   6910 D5            [11] 1341 	push	de
   6911 CD 13 66      [17] 1342 	call	_borrarCuchillo
   6914 F1            [10] 1343 	pop	af
   6915 D1            [10] 1344 	pop	de
   6916 C1            [10] 1345 	pop	bc
                           1346 ;src/main.c:338: actual->lanzado = NO;
   6917 AF            [ 4] 1347 	xor	a, a
   6918 02            [ 7] 1348 	ld	(bc),a
   6919 18 67         [12] 1349 	jr	00133$
   691B                    1350 00127$:
                           1351 ;src/main.c:342: if(actual->y < LIMITE_INFERIOR - G_KNIFEY_0_H){
   691B D5            [11] 1352 	push	de
   691C FD E1         [14] 1353 	pop	iy
   691E FD 23         [10] 1354 	inc	iy
                           1355 ;src/main.c:341: else if(actual->direccion == M_abajo){
   6920 7D            [ 4] 1356 	ld	a,l
   6921 D6 03         [ 7] 1357 	sub	a, #0x03
   6923 20 2D         [12] 1358 	jr	NZ,00124$
                           1359 ;src/main.c:342: if(actual->y < LIMITE_INFERIOR - G_KNIFEY_0_H){
   6925 FD 6E 00      [19] 1360 	ld	l, 0 (iy)
   6928 7D            [ 4] 1361 	ld	a,l
   6929 D6 A2         [ 7] 1362 	sub	a, #0xA2
   692B 3E 00         [ 7] 1363 	ld	a,#0x00
   692D 17            [ 4] 1364 	rla
   692E B7            [ 4] 1365 	or	a, a
   692F 28 11         [12] 1366 	jr	Z,00114$
                           1367 ;src/main.c:343: actual->y++;
   6931 2C            [ 4] 1368 	inc	l
   6932 FD 75 00      [19] 1369 	ld	0 (iy), l
                           1370 ;src/main.c:344: actual->y++;
   6935 2C            [ 4] 1371 	inc	l
   6936 FD 75 00      [19] 1372 	ld	0 (iy), l
                           1373 ;src/main.c:345: redibujarCuchillo(actual);
   6939 D5            [11] 1374 	push	de
   693A D5            [11] 1375 	push	de
   693B CD 7D 66      [17] 1376 	call	_redibujarCuchillo
   693E F1            [10] 1377 	pop	af
   693F D1            [10] 1378 	pop	de
   6940 18 40         [12] 1379 	jr	00133$
   6942                    1380 00114$:
                           1381 ;src/main.c:348: }else if(actual->y >= LIMITE_INFERIOR - G_KNIFEY_0_H ){
   6942 B7            [ 4] 1382 	or	a, a
   6943 20 3D         [12] 1383 	jr	NZ,00133$
                           1384 ;src/main.c:349: borrarCuchillo(actual);
   6945 C5            [11] 1385 	push	bc
   6946 D5            [11] 1386 	push	de
   6947 D5            [11] 1387 	push	de
   6948 CD 13 66      [17] 1388 	call	_borrarCuchillo
   694B F1            [10] 1389 	pop	af
   694C D1            [10] 1390 	pop	de
   694D C1            [10] 1391 	pop	bc
                           1392 ;src/main.c:350: actual->lanzado = NO;
   694E AF            [ 4] 1393 	xor	a, a
   694F 02            [ 7] 1394 	ld	(bc),a
   6950 18 30         [12] 1395 	jr	00133$
   6952                    1396 00124$:
                           1397 ;src/main.c:353: else if(actual->direccion == M_arriba){
   6952 7D            [ 4] 1398 	ld	a,l
   6953 D6 02         [ 7] 1399 	sub	a, #0x02
   6955 20 2B         [12] 1400 	jr	NZ,00133$
                           1401 ;src/main.c:342: if(actual->y < LIMITE_INFERIOR - G_KNIFEY_0_H){
   6957 FD 6E 00      [19] 1402 	ld	l, 0 (iy)
                           1403 ;src/main.c:354: if(actual->y > LIMITE_SUPERIOR){
   695A 3E 08         [ 7] 1404 	ld	a,#0x08
   695C 95            [ 4] 1405 	sub	a, l
   695D 3E 00         [ 7] 1406 	ld	a,#0x00
   695F 17            [ 4] 1407 	rla
   6960 B7            [ 4] 1408 	or	a, a
   6961 28 11         [12] 1409 	jr	Z,00119$
                           1410 ;src/main.c:355: actual->y--;
   6963 2D            [ 4] 1411 	dec	l
   6964 FD 75 00      [19] 1412 	ld	0 (iy), l
                           1413 ;src/main.c:356: actual->y--;
   6967 2D            [ 4] 1414 	dec	l
   6968 FD 75 00      [19] 1415 	ld	0 (iy), l
                           1416 ;src/main.c:357: redibujarCuchillo(actual);
   696B D5            [11] 1417 	push	de
   696C D5            [11] 1418 	push	de
   696D CD 7D 66      [17] 1419 	call	_redibujarCuchillo
   6970 F1            [10] 1420 	pop	af
   6971 D1            [10] 1421 	pop	de
   6972 18 0E         [12] 1422 	jr	00133$
   6974                    1423 00119$:
                           1424 ;src/main.c:359: }else if(actual->y <= LIMITE_SUPERIOR){
   6974 B7            [ 4] 1425 	or	a, a
   6975 20 0B         [12] 1426 	jr	NZ,00133$
                           1427 ;src/main.c:360: borrarCuchillo(actual);
   6977 C5            [11] 1428 	push	bc
   6978 D5            [11] 1429 	push	de
   6979 D5            [11] 1430 	push	de
   697A CD 13 66      [17] 1431 	call	_borrarCuchillo
   697D F1            [10] 1432 	pop	af
   697E D1            [10] 1433 	pop	de
   697F C1            [10] 1434 	pop	bc
                           1435 ;src/main.c:361: actual->lanzado = NO;
   6980 AF            [ 4] 1436 	xor	a, a
   6981 02            [ 7] 1437 	ld	(bc),a
   6982                    1438 00133$:
                           1439 ;src/main.c:365: ++actual;
   6982 21 09 00      [10] 1440 	ld	hl,#0x0009
   6985 19            [11] 1441 	add	hl,de
   6986 EB            [ 4] 1442 	ex	de,hl
   6987 C3 A6 68      [10] 1443 	jp	00134$
   698A                    1444 00137$:
   698A 33            [ 6] 1445 	inc	sp
   698B DD E1         [14] 1446 	pop	ix
   698D C9            [10] 1447 	ret
                           1448 ;src/main.c:369: void menuFin(){
                           1449 ;	---------------------------------
                           1450 ; Function menuFin
                           1451 ; ---------------------------------
   698E                    1452 _menuFin::
                           1453 ;src/main.c:372: cpct_clearScreen(0);
   698E 21 00 40      [10] 1454 	ld	hl,#0x4000
   6991 E5            [11] 1455 	push	hl
   6992 AF            [ 4] 1456 	xor	a, a
   6993 F5            [11] 1457 	push	af
   6994 33            [ 6] 1458 	inc	sp
   6995 26 C0         [ 7] 1459 	ld	h, #0xC0
   6997 E5            [11] 1460 	push	hl
   6998 CD 73 59      [17] 1461 	call	_cpct_memset
                           1462 ;src/main.c:374: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 12, 90); // centrado en horizontal y arriba en vertical
   699B 21 0C 5A      [10] 1463 	ld	hl,#0x5A0C
   699E E5            [11] 1464 	push	hl
   699F 21 00 C0      [10] 1465 	ld	hl,#0xC000
   69A2 E5            [11] 1466 	push	hl
   69A3 CD DC 61      [17] 1467 	call	_cpct_getScreenPtr
   69A6 4D            [ 4] 1468 	ld	c,l
   69A7 44            [ 4] 1469 	ld	b,h
                           1470 ;src/main.c:375: cpct_drawStringM0("FIN DE PARTIDA", memptr, 2, 3);
   69A8 21 02 03      [10] 1471 	ld	hl,#0x0302
   69AB E5            [11] 1472 	push	hl
   69AC C5            [11] 1473 	push	bc
   69AD 21 C7 69      [10] 1474 	ld	hl,#___str_0
   69B0 E5            [11] 1475 	push	hl
   69B1 CD 69 57      [17] 1476 	call	_cpct_drawStringM0
   69B4 21 06 00      [10] 1477 	ld	hl,#6
   69B7 39            [11] 1478 	add	hl,sp
   69B8 F9            [ 6] 1479 	ld	sp,hl
                           1480 ;src/main.c:379: do{
   69B9                    1481 00101$:
                           1482 ;src/main.c:380: cpct_scanKeyboard_f();   		
   69B9 CD FF 56      [17] 1483 	call	_cpct_scanKeyboard_f
                           1484 ;src/main.c:381: } while(!cpct_isKeyPressed(Key_I));   		
   69BC 21 04 08      [10] 1485 	ld	hl,#0x0804
   69BF CD F3 56      [17] 1486 	call	_cpct_isKeyPressed
   69C2 7D            [ 4] 1487 	ld	a,l
   69C3 B7            [ 4] 1488 	or	a, a
   69C4 28 F3         [12] 1489 	jr	Z,00101$
   69C6 C9            [10] 1490 	ret
   69C7                    1491 ___str_0:
   69C7 46 49 4E 20 44 45  1492 	.ascii "FIN DE PARTIDA"
        20 50 41 52 54 49
        44 41
   69D5 00                 1493 	.db 0x00
                           1494 ;src/main.c:384: void menu(){
                           1495 ;	---------------------------------
                           1496 ; Function menu
                           1497 ; ---------------------------------
   69D6                    1498 _menu::
                           1499 ;src/main.c:387: cpct_clearScreen(0);
   69D6 21 00 40      [10] 1500 	ld	hl,#0x4000
   69D9 E5            [11] 1501 	push	hl
   69DA AF            [ 4] 1502 	xor	a, a
   69DB F5            [11] 1503 	push	af
   69DC 33            [ 6] 1504 	inc	sp
   69DD 26 C0         [ 7] 1505 	ld	h, #0xC0
   69DF E5            [11] 1506 	push	hl
   69E0 CD 73 59      [17] 1507 	call	_cpct_memset
                           1508 ;src/main.c:389: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 10); // centrado en horizontal y arriba en vertical
   69E3 21 20 0A      [10] 1509 	ld	hl,#0x0A20
   69E6 E5            [11] 1510 	push	hl
   69E7 21 00 C0      [10] 1511 	ld	hl,#0xC000
   69EA E5            [11] 1512 	push	hl
   69EB CD DC 61      [17] 1513 	call	_cpct_getScreenPtr
   69EE 4D            [ 4] 1514 	ld	c,l
   69EF 44            [ 4] 1515 	ld	b,h
                           1516 ;src/main.c:390: cpct_drawStringM0("MENU", memptr, 2, 3);
   69F0 21 02 03      [10] 1517 	ld	hl,#0x0302
   69F3 E5            [11] 1518 	push	hl
   69F4 C5            [11] 1519 	push	bc
   69F5 21 2D 6A      [10] 1520 	ld	hl,#___str_1
   69F8 E5            [11] 1521 	push	hl
   69F9 CD 69 57      [17] 1522 	call	_cpct_drawStringM0
   69FC 21 06 00      [10] 1523 	ld	hl,#6
   69FF 39            [11] 1524 	add	hl,sp
   6A00 F9            [ 6] 1525 	ld	sp,hl
                           1526 ;src/main.c:392: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 180); // centrado en horizontal y abajo en vertical
   6A01 21 20 B4      [10] 1527 	ld	hl,#0xB420
   6A04 E5            [11] 1528 	push	hl
   6A05 21 00 C0      [10] 1529 	ld	hl,#0xC000
   6A08 E5            [11] 1530 	push	hl
   6A09 CD DC 61      [17] 1531 	call	_cpct_getScreenPtr
   6A0C 4D            [ 4] 1532 	ld	c,l
   6A0D 44            [ 4] 1533 	ld	b,h
                           1534 ;src/main.c:393: cpct_drawStringM0("PULSA I", memptr, 1, 0);
   6A0E 21 01 00      [10] 1535 	ld	hl,#0x0001
   6A11 E5            [11] 1536 	push	hl
   6A12 C5            [11] 1537 	push	bc
   6A13 21 32 6A      [10] 1538 	ld	hl,#___str_2
   6A16 E5            [11] 1539 	push	hl
   6A17 CD 69 57      [17] 1540 	call	_cpct_drawStringM0
   6A1A 21 06 00      [10] 1541 	ld	hl,#6
   6A1D 39            [11] 1542 	add	hl,sp
   6A1E F9            [ 6] 1543 	ld	sp,hl
                           1544 ;src/main.c:396: do{
   6A1F                    1545 00101$:
                           1546 ;src/main.c:397: cpct_scanKeyboard_f();   		
   6A1F CD FF 56      [17] 1547 	call	_cpct_scanKeyboard_f
                           1548 ;src/main.c:398: } while(!cpct_isKeyPressed(Key_I));   		
   6A22 21 04 08      [10] 1549 	ld	hl,#0x0804
   6A25 CD F3 56      [17] 1550 	call	_cpct_isKeyPressed
   6A28 7D            [ 4] 1551 	ld	a,l
   6A29 B7            [ 4] 1552 	or	a, a
   6A2A 28 F3         [12] 1553 	jr	Z,00101$
   6A2C C9            [10] 1554 	ret
   6A2D                    1555 ___str_1:
   6A2D 4D 45 4E 55        1556 	.ascii "MENU"
   6A31 00                 1557 	.db 0x00
   6A32                    1558 ___str_2:
   6A32 50 55 4C 53 41 20  1559 	.ascii "PULSA I"
        49
   6A39 00                 1560 	.db 0x00
                           1561 ;src/main.c:402: void inicializar() {
                           1562 ;	---------------------------------
                           1563 ; Function inicializar
                           1564 ; ---------------------------------
   6A3A                    1565 _inicializar::
                           1566 ;src/main.c:405: TKnife* actual = cu;
                           1567 ;src/main.c:407: cpct_disableFirmware();
   6A3A CD AA 61      [17] 1568 	call	_cpct_disableFirmware
                           1569 ;src/main.c:408: cpct_setVideoMode(0);
   6A3D 2E 00         [ 7] 1570 	ld	l,#0x00
   6A3F CD 55 59      [17] 1571 	call	_cpct_setVideoMode
                           1572 ;src/main.c:410: cpct_setPalette(g_palette, 16);
   6A42 21 10 00      [10] 1573 	ld	hl,#0x0010
   6A45 E5            [11] 1574 	push	hl
   6A46 21 92 55      [10] 1575 	ld	hl,#_g_palette
   6A49 E5            [11] 1576 	push	hl
   6A4A CD DC 56      [17] 1577 	call	_cpct_setPalette
                           1578 ;src/main.c:411: cpct_akp_musicInit(G_song);
   6A4D 21 00 3F      [10] 1579 	ld	hl,#_G_song
   6A50 E5            [11] 1580 	push	hl
   6A51 CD 86 60      [17] 1581 	call	_cpct_akp_musicInit
   6A54 F1            [10] 1582 	pop	af
                           1583 ;src/main.c:412: mapa = g_map1;
   6A55 21 C0 4D      [10] 1584 	ld	hl,#_g_map1+0
   6A58 22 9B 62      [16] 1585 	ld	(_mapa),hl
                           1586 ;src/main.c:413: num_mapa = 0;
   6A5B 21 9D 62      [10] 1587 	ld	hl,#_num_mapa + 0
   6A5E 36 00         [10] 1588 	ld	(hl), #0x00
                           1589 ;src/main.c:414: cpct_etm_setTileset2x4(g_tileset);
   6A60 21 CA 54      [10] 1590 	ld	hl,#_g_tileset
   6A63 CD 1C 58      [17] 1591 	call	_cpct_etm_setTileset2x4
                           1592 ;src/main.c:415: dibujarMapa();
   6A66 CD 9E 62      [17] 1593 	call	_dibujarMapa
                           1594 ;src/main.c:418: prota.x = prota.px = 4;
   6A69 21 3B 62      [10] 1595 	ld	hl,#(_prota + 0x0002)
   6A6C 36 04         [10] 1596 	ld	(hl),#0x04
   6A6E 21 39 62      [10] 1597 	ld	hl,#_prota
   6A71 36 04         [10] 1598 	ld	(hl),#0x04
                           1599 ;src/main.c:419: prota.y = prota.py = 80;
   6A73 21 3C 62      [10] 1600 	ld	hl,#(_prota + 0x0003)
   6A76 36 50         [10] 1601 	ld	(hl),#0x50
   6A78 21 3A 62      [10] 1602 	ld	hl,#(_prota + 0x0001)
   6A7B 36 50         [10] 1603 	ld	(hl),#0x50
                           1604 ;src/main.c:420: prota.mover  = NO;
   6A7D 21 3F 62      [10] 1605 	ld	hl,#(_prota + 0x0006)
   6A80 36 00         [10] 1606 	ld	(hl),#0x00
                           1607 ;src/main.c:421: prota.mira=M_derecha;
   6A82 21 40 62      [10] 1608 	ld	hl,#(_prota + 0x0007)
   6A85 36 00         [10] 1609 	ld	(hl),#0x00
                           1610 ;src/main.c:422: prota.sprite = g_hero;
   6A87 21 A2 55      [10] 1611 	ld	hl,#_g_hero
   6A8A 22 3D 62      [16] 1612 	ld	((_prota + 0x0004)), hl
                           1613 ;src/main.c:425: i = 10 + 1;
   6A8D 0E 0B         [ 7] 1614 	ld	c,#0x0B
                           1615 ;src/main.c:428: while(--i){
   6A8F 11 41 62      [10] 1616 	ld	de,#_cu
   6A92                    1617 00101$:
   6A92 41            [ 4] 1618 	ld	b,c
   6A93 05            [ 4] 1619 	dec	b
   6A94 78            [ 4] 1620 	ld	a,b
   6A95 4F            [ 4] 1621 	ld	c,a
   6A96 B7            [ 4] 1622 	or	a, a
   6A97 28 25         [12] 1623 	jr	Z,00103$
                           1624 ;src/main.c:429: actual->x = actual->px = 0;
   6A99 6B            [ 4] 1625 	ld	l, e
   6A9A 62            [ 4] 1626 	ld	h, d
   6A9B 23            [ 6] 1627 	inc	hl
   6A9C 23            [ 6] 1628 	inc	hl
   6A9D 36 00         [10] 1629 	ld	(hl),#0x00
   6A9F AF            [ 4] 1630 	xor	a, a
   6AA0 12            [ 7] 1631 	ld	(de),a
                           1632 ;src/main.c:430: actual->y = actual->py = 0;
   6AA1 D5            [11] 1633 	push	de
   6AA2 FD E1         [14] 1634 	pop	iy
   6AA4 FD 23         [10] 1635 	inc	iy
   6AA6 6B            [ 4] 1636 	ld	l, e
   6AA7 62            [ 4] 1637 	ld	h, d
   6AA8 23            [ 6] 1638 	inc	hl
   6AA9 23            [ 6] 1639 	inc	hl
   6AAA 23            [ 6] 1640 	inc	hl
   6AAB 36 00         [10] 1641 	ld	(hl),#0x00
   6AAD FD 36 00 00   [19] 1642 	ld	0 (iy), #0x00
                           1643 ;src/main.c:431: actual->lanzado = 0;
   6AB1 21 06 00      [10] 1644 	ld	hl,#0x0006
   6AB4 19            [11] 1645 	add	hl,de
   6AB5 36 00         [10] 1646 	ld	(hl),#0x00
                           1647 ;src/main.c:432: ++actual;
   6AB7 21 09 00      [10] 1648 	ld	hl,#0x0009
   6ABA 19            [11] 1649 	add	hl,de
   6ABB EB            [ 4] 1650 	ex	de,hl
   6ABC 18 D4         [12] 1651 	jr	00101$
   6ABE                    1652 00103$:
                           1653 ;src/main.c:436: dibujarProta();
   6ABE CD BA 62      [17] 1654 	call	_dibujarProta
   6AC1 C9            [10] 1655 	ret
                           1656 ;src/main.c:439: void main(void) {
                           1657 ;	---------------------------------
                           1658 ; Function main
                           1659 ; ---------------------------------
   6AC2                    1660 _main::
                           1661 ;src/main.c:441: menu();
   6AC2 CD D6 69      [17] 1662 	call	_menu
                           1663 ;src/main.c:443: inicializar();
   6AC5 CD 3A 6A      [17] 1664 	call	_inicializar
                           1665 ;src/main.c:444: cpct_akp_musicPlay();
   6AC8 CD 83 59      [17] 1666 	call	_cpct_akp_musicPlay
                           1667 ;src/main.c:447: while (1) {
   6ACB                    1668 00104$:
                           1669 ;src/main.c:450: comprobarTeclado();
   6ACB CD 55 68      [17] 1670 	call	_comprobarTeclado
                           1671 ;src/main.c:452: cpct_waitVSYNC();
   6ACE CD 4D 59      [17] 1672 	call	_cpct_waitVSYNC
                           1673 ;src/main.c:453: moverCuchillo();
   6AD1 CD 96 68      [17] 1674 	call	_moverCuchillo
                           1675 ;src/main.c:455: if (prota.mover) {
   6AD4 3A 3F 62      [13] 1676 	ld	a, (#(_prota + 0x0006) + 0)
   6AD7 B7            [ 4] 1677 	or	a, a
   6AD8 28 F1         [12] 1678 	jr	Z,00104$
                           1679 ;src/main.c:457: redibujarProta();
   6ADA CD 43 63      [17] 1680 	call	_redibujarProta
                           1681 ;src/main.c:458: prota.mover = NO;
   6ADD 21 3F 62      [10] 1682 	ld	hl,#(_prota + 0x0006)
   6AE0 36 00         [10] 1683 	ld	(hl),#0x00
   6AE2 18 E7         [12] 1684 	jr	00104$
                           1685 	.area _CODE
                           1686 	.area _INITIALIZER
                           1687 	.area _CABS (ABS)
   3F00                    1688 	.org 0x3F00
   3F00                    1689 _G_song:
   3F00 41                 1690 	.db #0x41	; 65	'A'
   3F01 54                 1691 	.db #0x54	; 84	'T'
   3F02 31                 1692 	.db #0x31	; 49	'1'
   3F03 30                 1693 	.db #0x30	; 48	'0'
   3F04 01                 1694 	.db #0x01	; 1
   3F05 40                 1695 	.db #0x40	; 64
   3F06 42                 1696 	.db #0x42	; 66	'B'
   3F07 0F                 1697 	.db #0x0F	; 15
   3F08 02                 1698 	.db #0x02	; 2
   3F09 06                 1699 	.db #0x06	; 6
   3F0A 1D                 1700 	.db #0x1D	; 29
   3F0B 00                 1701 	.db #0x00	; 0
   3F0C 10                 1702 	.db #0x10	; 16
   3F0D 40                 1703 	.db #0x40	; 64
   3F0E 19                 1704 	.db #0x19	; 25
   3F0F 40                 1705 	.db #0x40	; 64
   3F10 00                 1706 	.db #0x00	; 0
   3F11 00                 1707 	.db #0x00	; 0
   3F12 00                 1708 	.db #0x00	; 0
   3F13 00                 1709 	.db #0x00	; 0
   3F14 00                 1710 	.db #0x00	; 0
   3F15 00                 1711 	.db #0x00	; 0
   3F16 0D                 1712 	.db #0x0D	; 13
   3F17 12                 1713 	.db #0x12	; 18
   3F18 40                 1714 	.db #0x40	; 64
   3F19 01                 1715 	.db #0x01	; 1
   3F1A 00                 1716 	.db #0x00	; 0
   3F1B 7C                 1717 	.db #0x7C	; 124
   3F1C 18                 1718 	.db #0x18	; 24
   3F1D 78                 1719 	.db #0x78	; 120	'x'
   3F1E 0C                 1720 	.db #0x0C	; 12
   3F1F 34                 1721 	.db #0x34	; 52	'4'
   3F20 30                 1722 	.db #0x30	; 48	'0'
   3F21 2C                 1723 	.db #0x2C	; 44
   3F22 28                 1724 	.db #0x28	; 40
   3F23 24                 1725 	.db #0x24	; 36
   3F24 20                 1726 	.db #0x20	; 32
   3F25 1C                 1727 	.db #0x1C	; 28
   3F26 0D                 1728 	.db #0x0D	; 13
   3F27 25                 1729 	.db #0x25	; 37
   3F28 40                 1730 	.db #0x40	; 64
   3F29 20                 1731 	.db #0x20	; 32
   3F2A 00                 1732 	.db #0x00	; 0
   3F2B 00                 1733 	.db #0x00	; 0
   3F2C 00                 1734 	.db #0x00	; 0
   3F2D 39                 1735 	.db #0x39	; 57	'9'
   3F2E 40                 1736 	.db #0x40	; 64
   3F2F 00                 1737 	.db #0x00	; 0
   3F30 57                 1738 	.db #0x57	; 87	'W'
   3F31 40                 1739 	.db #0x40	; 64
   3F32 3B                 1740 	.db #0x3B	; 59
   3F33 40                 1741 	.db #0x40	; 64
   3F34 57                 1742 	.db #0x57	; 87	'W'
   3F35 40                 1743 	.db #0x40	; 64
   3F36 01                 1744 	.db #0x01	; 1
   3F37 2F                 1745 	.db #0x2F	; 47
   3F38 40                 1746 	.db #0x40	; 64
   3F39 19                 1747 	.db #0x19	; 25
   3F3A 00                 1748 	.db #0x00	; 0
   3F3B 76                 1749 	.db #0x76	; 118	'v'
   3F3C E1                 1750 	.db #0xE1	; 225
   3F3D 00                 1751 	.db #0x00	; 0
   3F3E 00                 1752 	.db #0x00	; 0
   3F3F 01                 1753 	.db #0x01	; 1
   3F40 04                 1754 	.db #0x04	; 4
   3F41 51                 1755 	.db #0x51	; 81	'Q'
   3F42 04                 1756 	.db #0x04	; 4
   3F43 37                 1757 	.db #0x37	; 55	'7'
   3F44 04                 1758 	.db #0x04	; 4
   3F45 4F                 1759 	.db #0x4F	; 79	'O'
   3F46 04                 1760 	.db #0x04	; 4
   3F47 37                 1761 	.db #0x37	; 55	'7'
   3F48 02                 1762 	.db #0x02	; 2
   3F49 4B                 1763 	.db #0x4B	; 75	'K'
   3F4A 02                 1764 	.db #0x02	; 2
   3F4B 37                 1765 	.db #0x37	; 55	'7'
   3F4C 04                 1766 	.db #0x04	; 4
   3F4D 4F                 1767 	.db #0x4F	; 79	'O'
   3F4E 04                 1768 	.db #0x04	; 4
   3F4F 37                 1769 	.db #0x37	; 55	'7'
   3F50 04                 1770 	.db #0x04	; 4
   3F51 4F                 1771 	.db #0x4F	; 79	'O'
   3F52 04                 1772 	.db #0x04	; 4
   3F53 37                 1773 	.db #0x37	; 55	'7'
   3F54 02                 1774 	.db #0x02	; 2
   3F55 4B                 1775 	.db #0x4B	; 75	'K'
   3F56 00                 1776 	.db #0x00	; 0
   3F57 42                 1777 	.db #0x42	; 66	'B'
   3F58 60                 1778 	.db #0x60	; 96
   3F59 00                 1779 	.db #0x00	; 0
   3F5A 42                 1780 	.db #0x42	; 66	'B'
   3F5B 80                 1781 	.db #0x80	; 128
   3F5C 00                 1782 	.db #0x00	; 0
   3F5D 00                 1783 	.db #0x00	; 0
   3F5E 42                 1784 	.db #0x42	; 66	'B'
   3F5F 00                 1785 	.db #0x00	; 0
   3F60 00                 1786 	.db #0x00	; 0
