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
                             14 	.globl _moverCuchillo
                             15 	.globl _comprobarTeclado
                             16 	.globl _lanzarCuchillo
                             17 	.globl _redibujarCuchillo
                             18 	.globl _borrarCuchillo
                             19 	.globl _dibujarCuchillo
                             20 	.globl _moverAbajo
                             21 	.globl _moverArriba
                             22 	.globl _moverDerecha
                             23 	.globl _moverIzquierda
                             24 	.globl _checkCollision
                             25 	.globl _getTilePtr
                             26 	.globl _redibujarProta
                             27 	.globl _borrarProta
                             28 	.globl _dibujarProta
                             29 	.globl _dibujarMapa
                             30 	.globl _cpct_etm_setTileset2x4
                             31 	.globl _cpct_etm_drawTileBox2x4
                             32 	.globl _cpct_akp_musicPlay
                             33 	.globl _cpct_akp_musicInit
                             34 	.globl _cpct_getScreenPtr
                             35 	.globl _cpct_setPalette
                             36 	.globl _cpct_waitVSYNC
                             37 	.globl _cpct_setVideoMode
                             38 	.globl _cpct_drawSpriteMaskedAlignedTable
                             39 	.globl _cpct_isAnyKeyPressed
                             40 	.globl _cpct_isKeyPressed
                             41 	.globl _cpct_scanKeyboard_if
                             42 	.globl _cpct_disableFirmware
                             43 	.globl _mapa
                             44 	.globl _cu
                             45 	.globl _prota
                             46 	.globl _EEje
                             47 	.globl _EMirar
                             48 ;--------------------------------------------------------
                             49 ; special function registers
                             50 ;--------------------------------------------------------
                             51 ;--------------------------------------------------------
                             52 ; ram data
                             53 ;--------------------------------------------------------
                             54 	.area _DATA
   523A                      55 _EMirar::
   523A                      56 	.ds 1
   523B                      57 _EEje::
   523B                      58 	.ds 1
   523C                      59 _prota::
   523C                      60 	.ds 8
   5244                      61 _cu::
   5244                      62 	.ds 9
   524D                      63 _mapa::
   524D                      64 	.ds 2
                             65 ;--------------------------------------------------------
                             66 ; ram data
                             67 ;--------------------------------------------------------
                             68 	.area _INITIALIZED
                             69 ;--------------------------------------------------------
                             70 ; absolute external ram data
                             71 ;--------------------------------------------------------
                             72 	.area _DABS (ABS)
                             73 ;--------------------------------------------------------
                             74 ; global & static initialisations
                             75 ;--------------------------------------------------------
                             76 	.area _HOME
                             77 	.area _GSINIT
                             78 	.area _GSFINAL
                             79 	.area _GSINIT
                             80 ;--------------------------------------------------------
                             81 ; Home
                             82 ;--------------------------------------------------------
                             83 	.area _HOME
                             84 	.area _HOME
                             85 ;--------------------------------------------------------
                             86 ; code
                             87 ;--------------------------------------------------------
                             88 	.area _CODE
                             89 ;src/main.c:90: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
                             90 ;	---------------------------------
                             91 ; Function dummy_cpct_transparentMaskTable0M0_container
                             92 ; ---------------------------------
   4818                      93 _dummy_cpct_transparentMaskTable0M0_container::
                             94 	.area _g_tablatrans_ (ABS) 
   3E00                      95 	.org 0x3E00 
   3E00                      96 	 _g_tablatrans::
   3E00 FF AA 55 00 AA AA    97 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E08 55 00 55 00 00 00    98 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E10 AA AA 00 00 AA AA    99 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E18 00 00 00 00 00 00   100 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E20 55 00 55 00 00 00   101 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E28 55 00 55 00 00 00   102 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E30 00 00 00 00 00 00   103 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E38 00 00 00 00 00 00   104 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E40 AA AA 00 00 AA AA   105 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E48 00 00 00 00 00 00   106 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E50 AA AA 00 00 AA AA   107 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E58 00 00 00 00 00 00   108 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E60 00 00 00 00 00 00   109 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E68 00 00 00 00 00 00   110 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E70 00 00 00 00 00 00   111 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E78 00 00 00 00 00 00   112 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E80 55 00 55 00 00 00   113 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E88 55 00 55 00 00 00   114 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E90 00 00 00 00 00 00   115 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E98 00 00 00 00 00 00   116 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA0 55 00 55 00 00 00   117 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA8 55 00 55 00 00 00   118 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB0 00 00 00 00 00 00   119 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB8 00 00 00 00 00 00   120 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC0 00 00 00 00 00 00   121 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC8 00 00 00 00 00 00   122 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED0 00 00 00 00 00 00   123 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED8 00 00 00 00 00 00   124 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE0 00 00 00 00 00 00   125 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE8 00 00 00 00 00 00   126 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF0 00 00 00 00 00 00   127 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF8 00 00 00 00 00 00   128 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            129 	.area _CSEG (REL, CON) 
                            130 ;src/main.c:93: void dibujarMapa() {
                            131 ;	---------------------------------
                            132 ; Function dibujarMapa
                            133 ; ---------------------------------
   524F                     134 _dibujarMapa::
                            135 ;src/main.c:94: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   524F 2A 4D 52      [16]  136 	ld	hl,(_mapa)
   5252 E5            [11]  137 	push	hl
   5253 21 00 C0      [10]  138 	ld	hl,#0xC000
   5256 E5            [11]  139 	push	hl
   5257 21 2C 28      [10]  140 	ld	hl,#0x282C
   525A E5            [11]  141 	push	hl
   525B 2E 00         [ 7]  142 	ld	l, #0x00
   525D E5            [11]  143 	push	hl
   525E AF            [ 4]  144 	xor	a, a
   525F F5            [11]  145 	push	af
   5260 33            [ 6]  146 	inc	sp
   5261 CD 3B 48      [17]  147 	call	_cpct_etm_drawTileBox2x4
   5264 C9            [10]  148 	ret
                            149 ;src/main.c:99: void dibujarProta() {
                            150 ;	---------------------------------
                            151 ; Function dibujarProta
                            152 ; ---------------------------------
   5265                     153 _dibujarProta::
                            154 ;src/main.c:100: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   5265 21 3D 52      [10]  155 	ld	hl, #_prota + 1
   5268 56            [ 7]  156 	ld	d,(hl)
   5269 21 3C 52      [10]  157 	ld	hl, #_prota + 0
   526C 46            [ 7]  158 	ld	b,(hl)
   526D D5            [11]  159 	push	de
   526E 33            [ 6]  160 	inc	sp
   526F C5            [11]  161 	push	bc
   5270 33            [ 6]  162 	inc	sp
   5271 21 00 C0      [10]  163 	ld	hl,#0xC000
   5274 E5            [11]  164 	push	hl
   5275 CD DF 51      [17]  165 	call	_cpct_getScreenPtr
   5278 EB            [ 4]  166 	ex	de,hl
                            167 ;src/main.c:101: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   5279 ED 4B 40 52   [20]  168 	ld	bc, (#_prota + 4)
   527D 21 00 3E      [10]  169 	ld	hl,#_g_tablatrans
   5280 E5            [11]  170 	push	hl
   5281 21 07 16      [10]  171 	ld	hl,#0x1607
   5284 E5            [11]  172 	push	hl
   5285 D5            [11]  173 	push	de
   5286 C5            [11]  174 	push	bc
   5287 CD FF 51      [17]  175 	call	_cpct_drawSpriteMaskedAlignedTable
   528A C9            [10]  176 	ret
                            177 ;src/main.c:104: void borrarProta() {
                            178 ;	---------------------------------
                            179 ; Function borrarProta
                            180 ; ---------------------------------
   528B                     181 _borrarProta::
   528B DD E5         [15]  182 	push	ix
   528D DD 21 00 00   [14]  183 	ld	ix,#0
   5291 DD 39         [15]  184 	add	ix,sp
   5293 3B            [ 6]  185 	dec	sp
                            186 ;src/main.c:106: u8 w = 4 + (prota.px & 1);
   5294 21 3E 52      [10]  187 	ld	hl, #_prota + 2
   5297 4E            [ 7]  188 	ld	c,(hl)
   5298 79            [ 4]  189 	ld	a,c
   5299 E6 01         [ 7]  190 	and	a, #0x01
   529B 47            [ 4]  191 	ld	b,a
   529C 04            [ 4]  192 	inc	b
   529D 04            [ 4]  193 	inc	b
   529E 04            [ 4]  194 	inc	b
   529F 04            [ 4]  195 	inc	b
                            196 ;src/main.c:109: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   52A0 21 3F 52      [10]  197 	ld	hl, #_prota + 3
   52A3 5E            [ 7]  198 	ld	e,(hl)
   52A4 CB 4B         [ 8]  199 	bit	1, e
   52A6 28 04         [12]  200 	jr	Z,00103$
   52A8 3E 01         [ 7]  201 	ld	a,#0x01
   52AA 18 02         [12]  202 	jr	00104$
   52AC                     203 00103$:
   52AC 3E 00         [ 7]  204 	ld	a,#0x00
   52AE                     205 00104$:
   52AE C6 06         [ 7]  206 	add	a, #0x06
   52B0 DD 77 FF      [19]  207 	ld	-1 (ix),a
                            208 ;src/main.c:111: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   52B3 FD 2A 4D 52   [20]  209 	ld	iy,(_mapa)
   52B7 16 00         [ 7]  210 	ld	d,#0x00
   52B9 63            [ 4]  211 	ld	h,e
   52BA 6A            [ 4]  212 	ld	l,d
   52BB CB 7A         [ 8]  213 	bit	7, d
   52BD 28 05         [12]  214 	jr	Z,00105$
   52BF 13            [ 6]  215 	inc	de
   52C0 13            [ 6]  216 	inc	de
   52C1 13            [ 6]  217 	inc	de
   52C2 63            [ 4]  218 	ld	h,e
   52C3 6A            [ 4]  219 	ld	l,d
   52C4                     220 00105$:
   52C4 5C            [ 4]  221 	ld	e, h
   52C5 55            [ 4]  222 	ld	d, l
   52C6 CB 2A         [ 8]  223 	sra	d
   52C8 CB 1B         [ 8]  224 	rr	e
   52CA CB 2A         [ 8]  225 	sra	d
   52CC CB 1B         [ 8]  226 	rr	e
   52CE 51            [ 4]  227 	ld	d,c
   52CF CB 3A         [ 8]  228 	srl	d
   52D1 FD E5         [15]  229 	push	iy
   52D3 21 00 C0      [10]  230 	ld	hl,#0xC000
   52D6 E5            [11]  231 	push	hl
   52D7 3E 28         [ 7]  232 	ld	a,#0x28
   52D9 F5            [11]  233 	push	af
   52DA 33            [ 6]  234 	inc	sp
   52DB DD 7E FF      [19]  235 	ld	a,-1 (ix)
   52DE F5            [11]  236 	push	af
   52DF 33            [ 6]  237 	inc	sp
   52E0 C5            [11]  238 	push	bc
   52E1 33            [ 6]  239 	inc	sp
   52E2 7B            [ 4]  240 	ld	a,e
   52E3 F5            [11]  241 	push	af
   52E4 33            [ 6]  242 	inc	sp
   52E5 D5            [11]  243 	push	de
   52E6 33            [ 6]  244 	inc	sp
   52E7 CD 3B 48      [17]  245 	call	_cpct_etm_drawTileBox2x4
   52EA 33            [ 6]  246 	inc	sp
   52EB DD E1         [14]  247 	pop	ix
   52ED C9            [10]  248 	ret
                            249 ;src/main.c:114: void redibujarProta() {
                            250 ;	---------------------------------
                            251 ; Function redibujarProta
                            252 ; ---------------------------------
   52EE                     253 _redibujarProta::
                            254 ;src/main.c:115: borrarProta();
   52EE CD 8B 52      [17]  255 	call	_borrarProta
                            256 ;src/main.c:116: prota.px = prota.x;
   52F1 01 3E 52      [10]  257 	ld	bc,#_prota + 2
   52F4 3A 3C 52      [13]  258 	ld	a, (#_prota + 0)
   52F7 02            [ 7]  259 	ld	(bc),a
                            260 ;src/main.c:117: prota.py = prota.y;
   52F8 01 3F 52      [10]  261 	ld	bc,#_prota + 3
   52FB 3A 3D 52      [13]  262 	ld	a, (#_prota + 1)
   52FE 02            [ 7]  263 	ld	(bc),a
                            264 ;src/main.c:118: dibujarProta();
   52FF C3 65 52      [10]  265 	jp  _dibujarProta
                            266 ;src/main.c:121: u8* getTilePtr(u8 x, u8 y) {
                            267 ;	---------------------------------
                            268 ; Function getTilePtr
                            269 ; ---------------------------------
   5302                     270 _getTilePtr::
                            271 ;src/main.c:122: return mapa + (y-ORIGEN_MAPA_Y)/4*g_map1_W + x/2;
   5302 FD 21 03 00   [14]  272 	ld	iy,#3
   5306 FD 39         [15]  273 	add	iy,sp
   5308 FD 6E 00      [19]  274 	ld	l,0 (iy)
   530B 26 00         [ 7]  275 	ld	h,#0x00
   530D 4D            [ 4]  276 	ld	c,l
   530E 5C            [ 4]  277 	ld	e,h
   530F CB 7C         [ 8]  278 	bit	7, h
   5311 28 05         [12]  279 	jr	Z,00103$
   5313 23            [ 6]  280 	inc	hl
   5314 23            [ 6]  281 	inc	hl
   5315 23            [ 6]  282 	inc	hl
   5316 4D            [ 4]  283 	ld	c,l
   5317 5C            [ 4]  284 	ld	e,h
   5318                     285 00103$:
   5318 43            [ 4]  286 	ld	b, e
   5319 CB 28         [ 8]  287 	sra	b
   531B CB 19         [ 8]  288 	rr	c
   531D CB 28         [ 8]  289 	sra	b
   531F CB 19         [ 8]  290 	rr	c
   5321 69            [ 4]  291 	ld	l, c
   5322 60            [ 4]  292 	ld	h, b
   5323 29            [11]  293 	add	hl, hl
   5324 29            [11]  294 	add	hl, hl
   5325 09            [11]  295 	add	hl, bc
   5326 29            [11]  296 	add	hl, hl
   5327 29            [11]  297 	add	hl, hl
   5328 29            [11]  298 	add	hl, hl
   5329 ED 5B 4D 52   [20]  299 	ld	de,(_mapa)
   532D 19            [11]  300 	add	hl,de
   532E FD 21 02 00   [14]  301 	ld	iy,#2
   5332 FD 39         [15]  302 	add	iy,sp
   5334 FD 4E 00      [19]  303 	ld	c,0 (iy)
   5337 CB 39         [ 8]  304 	srl	c
   5339 59            [ 4]  305 	ld	e,c
   533A 16 00         [ 7]  306 	ld	d,#0x00
   533C 19            [11]  307 	add	hl,de
   533D C9            [10]  308 	ret
                            309 ;src/main.c:125: u8 checkCollision(int direction) { // check optimization
                            310 ;	---------------------------------
                            311 ; Function checkCollision
                            312 ; ---------------------------------
   533E                     313 _checkCollision::
   533E DD E5         [15]  314 	push	ix
   5340 DD 21 00 00   [14]  315 	ld	ix,#0
   5344 DD 39         [15]  316 	add	ix,sp
   5346 F5            [11]  317 	push	af
   5347 F5            [11]  318 	push	af
                            319 ;src/main.c:128: switch (direction) {
   5348 DD CB 05 7E   [20]  320 	bit	7, 5 (ix)
   534C C2 17 54      [10]  321 	jp	NZ,00105$
   534F 3E 03         [ 7]  322 	ld	a,#0x03
   5351 DD BE 04      [19]  323 	cp	a, 4 (ix)
   5354 3E 00         [ 7]  324 	ld	a,#0x00
   5356 DD 9E 05      [19]  325 	sbc	a, 5 (ix)
   5359 E2 5E 53      [10]  326 	jp	PO, 00123$
   535C EE 80         [ 7]  327 	xor	a, #0x80
   535E                     328 00123$:
   535E FA 17 54      [10]  329 	jp	M,00105$
   5361 DD 5E 04      [19]  330 	ld	e,4 (ix)
   5364 16 00         [ 7]  331 	ld	d,#0x00
   5366 21 6C 53      [10]  332 	ld	hl,#00124$
   5369 19            [11]  333 	add	hl,de
   536A 19            [11]  334 	add	hl,de
                            335 ;src/main.c:129: case 0:
   536B E9            [ 4]  336 	jp	(hl)
   536C                     337 00124$:
   536C 18 06         [12]  338 	jr	00101$
   536E 18 2F         [12]  339 	jr	00102$
   5370 18 56         [12]  340 	jr	00103$
   5372 18 79         [12]  341 	jr	00104$
   5374                     342 00101$:
                            343 ;src/main.c:130: headTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   5374 21 3D 52      [10]  344 	ld	hl, #(_prota + 0x0001) + 0
   5377 46            [ 7]  345 	ld	b,(hl)
   5378 3A 3C 52      [13]  346 	ld	a, (#_prota + 0)
   537B C6 04         [ 7]  347 	add	a, #0x04
   537D C5            [11]  348 	push	bc
   537E 33            [ 6]  349 	inc	sp
   537F F5            [11]  350 	push	af
   5380 33            [ 6]  351 	inc	sp
   5381 CD 02 53      [17]  352 	call	_getTilePtr
   5384 F1            [10]  353 	pop	af
   5385 4D            [ 4]  354 	ld	c,l
   5386 44            [ 4]  355 	ld	b,h
                            356 ;src/main.c:131: feetTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA);
   5387 3A 3D 52      [13]  357 	ld	a, (#(_prota + 0x0001) + 0)
   538A C6 16         [ 7]  358 	add	a, #0x16
   538C 57            [ 4]  359 	ld	d,a
   538D 3A 3C 52      [13]  360 	ld	a, (#_prota + 0)
   5390 C6 04         [ 7]  361 	add	a, #0x04
   5392 C5            [11]  362 	push	bc
   5393 D5            [11]  363 	push	de
   5394 33            [ 6]  364 	inc	sp
   5395 F5            [11]  365 	push	af
   5396 33            [ 6]  366 	inc	sp
   5397 CD 02 53      [17]  367 	call	_getTilePtr
   539A F1            [10]  368 	pop	af
   539B EB            [ 4]  369 	ex	de,hl
   539C C1            [10]  370 	pop	bc
                            371 ;src/main.c:132: break;
   539D 18 78         [12]  372 	jr	00105$
                            373 ;src/main.c:133: case 1:
   539F                     374 00102$:
                            375 ;src/main.c:134: headTile = getTilePtr(prota.x - 1, prota.y);
   539F 21 3D 52      [10]  376 	ld	hl, #(_prota + 0x0001) + 0
   53A2 46            [ 7]  377 	ld	b,(hl)
   53A3 21 3C 52      [10]  378 	ld	hl, #_prota + 0
   53A6 56            [ 7]  379 	ld	d,(hl)
   53A7 15            [ 4]  380 	dec	d
   53A8 4A            [ 4]  381 	ld	c, d
   53A9 C5            [11]  382 	push	bc
   53AA CD 02 53      [17]  383 	call	_getTilePtr
   53AD F1            [10]  384 	pop	af
   53AE 4D            [ 4]  385 	ld	c,l
   53AF 44            [ 4]  386 	ld	b,h
                            387 ;src/main.c:135: feetTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA);
   53B0 3A 3D 52      [13]  388 	ld	a, (#(_prota + 0x0001) + 0)
   53B3 C6 16         [ 7]  389 	add	a, #0x16
   53B5 57            [ 4]  390 	ld	d,a
   53B6 3A 3C 52      [13]  391 	ld	a, (#_prota + 0)
   53B9 C6 FF         [ 7]  392 	add	a,#0xFF
   53BB C5            [11]  393 	push	bc
   53BC D5            [11]  394 	push	de
   53BD 33            [ 6]  395 	inc	sp
   53BE F5            [11]  396 	push	af
   53BF 33            [ 6]  397 	inc	sp
   53C0 CD 02 53      [17]  398 	call	_getTilePtr
   53C3 F1            [10]  399 	pop	af
   53C4 EB            [ 4]  400 	ex	de,hl
   53C5 C1            [10]  401 	pop	bc
                            402 ;src/main.c:136: break;
   53C6 18 4F         [12]  403 	jr	00105$
                            404 ;src/main.c:137: case 2:
   53C8                     405 00103$:
                            406 ;src/main.c:138: headTile = getTilePtr(prota.x, prota.y - 1);
   53C8 21 3D 52      [10]  407 	ld	hl, #(_prota + 0x0001) + 0
   53CB 46            [ 7]  408 	ld	b,(hl)
   53CC 05            [ 4]  409 	dec	b
   53CD 21 3C 52      [10]  410 	ld	hl, #_prota + 0
   53D0 4E            [ 7]  411 	ld	c, (hl)
   53D1 C5            [11]  412 	push	bc
   53D2 CD 02 53      [17]  413 	call	_getTilePtr
   53D5 F1            [10]  414 	pop	af
   53D6 4D            [ 4]  415 	ld	c,l
   53D7 44            [ 4]  416 	ld	b,h
                            417 ;src/main.c:139: feetTile = getTilePtr(prota.x, prota.y - 1);
   53D8 3A 3D 52      [13]  418 	ld	a, (#(_prota + 0x0001) + 0)
   53DB 57            [ 4]  419 	ld	d,a
   53DC 15            [ 4]  420 	dec	d
   53DD 3A 3C 52      [13]  421 	ld	a, (#_prota + 0)
   53E0 C5            [11]  422 	push	bc
   53E1 D5            [11]  423 	push	de
   53E2 33            [ 6]  424 	inc	sp
   53E3 F5            [11]  425 	push	af
   53E4 33            [ 6]  426 	inc	sp
   53E5 CD 02 53      [17]  427 	call	_getTilePtr
   53E8 F1            [10]  428 	pop	af
   53E9 EB            [ 4]  429 	ex	de,hl
   53EA C1            [10]  430 	pop	bc
                            431 ;src/main.c:140: break;
   53EB 18 2A         [12]  432 	jr	00105$
                            433 ;src/main.c:141: case 3:
   53ED                     434 00104$:
                            435 ;src/main.c:142: headTile = getTilePtr(prota.x + 2, prota.y + ALTO_PROTA + 1);
   53ED 3A 3D 52      [13]  436 	ld	a, (#(_prota + 0x0001) + 0)
   53F0 C6 17         [ 7]  437 	add	a, #0x17
   53F2 47            [ 4]  438 	ld	b,a
   53F3 21 3C 52      [10]  439 	ld	hl, #_prota + 0
   53F6 56            [ 7]  440 	ld	d,(hl)
   53F7 14            [ 4]  441 	inc	d
   53F8 14            [ 4]  442 	inc	d
   53F9 4A            [ 4]  443 	ld	c, d
   53FA C5            [11]  444 	push	bc
   53FB CD 02 53      [17]  445 	call	_getTilePtr
   53FE F1            [10]  446 	pop	af
   53FF 4D            [ 4]  447 	ld	c,l
   5400 44            [ 4]  448 	ld	b,h
                            449 ;src/main.c:143: feetTile = getTilePtr(prota.x + 2, prota.y + ALTO_PROTA + 1);
   5401 3A 3D 52      [13]  450 	ld	a, (#(_prota + 0x0001) + 0)
   5404 C6 17         [ 7]  451 	add	a, #0x17
   5406 57            [ 4]  452 	ld	d,a
   5407 3A 3C 52      [13]  453 	ld	a, (#_prota + 0)
   540A C6 02         [ 7]  454 	add	a, #0x02
   540C C5            [11]  455 	push	bc
   540D D5            [11]  456 	push	de
   540E 33            [ 6]  457 	inc	sp
   540F F5            [11]  458 	push	af
   5410 33            [ 6]  459 	inc	sp
   5411 CD 02 53      [17]  460 	call	_getTilePtr
   5414 F1            [10]  461 	pop	af
   5415 EB            [ 4]  462 	ex	de,hl
   5416 C1            [10]  463 	pop	bc
                            464 ;src/main.c:145: }
   5417                     465 00105$:
                            466 ;src/main.c:147: if (*headTile > 0 || *feetTile > 0)
   5417 0A            [ 7]  467 	ld	a,(bc)
   5418 B7            [ 4]  468 	or	a, a
   5419 20 04         [12]  469 	jr	NZ,00106$
   541B 1A            [ 7]  470 	ld	a,(de)
   541C B7            [ 4]  471 	or	a, a
   541D 28 04         [12]  472 	jr	Z,00107$
   541F                     473 00106$:
                            474 ;src/main.c:148: return 1;
   541F 2E 01         [ 7]  475 	ld	l,#0x01
   5421 18 02         [12]  476 	jr	00109$
   5423                     477 00107$:
                            478 ;src/main.c:150: return 0;
   5423 2E 00         [ 7]  479 	ld	l,#0x00
   5425                     480 00109$:
   5425 DD F9         [10]  481 	ld	sp, ix
   5427 DD E1         [14]  482 	pop	ix
   5429 C9            [10]  483 	ret
                            484 ;src/main.c:153: void moverIzquierda() {
                            485 ;	---------------------------------
                            486 ; Function moverIzquierda
                            487 ; ---------------------------------
   542A                     488 _moverIzquierda::
                            489 ;src/main.c:154: if (prota.x > LIMITE_IZQUIERDO) {
   542A 01 3C 52      [10]  490 	ld	bc,#_prota+0
   542D 0A            [ 7]  491 	ld	a,(bc)
   542E 5F            [ 4]  492 	ld	e,a
   542F 3E 04         [ 7]  493 	ld	a,#0x04
   5431 93            [ 4]  494 	sub	a, e
   5432 D0            [11]  495 	ret	NC
                            496 ;src/main.c:155: if (!checkCollision(M_izquierda)) {
   5433 C5            [11]  497 	push	bc
   5434 21 01 00      [10]  498 	ld	hl,#0x0001
   5437 E5            [11]  499 	push	hl
   5438 CD 3E 53      [17]  500 	call	_checkCollision
   543B F1            [10]  501 	pop	af
   543C C1            [10]  502 	pop	bc
   543D 7D            [ 4]  503 	ld	a,l
   543E B7            [ 4]  504 	or	a, a
   543F 20 09         [12]  505 	jr	NZ,00102$
                            506 ;src/main.c:156: prota.x--;
   5441 0A            [ 7]  507 	ld	a,(bc)
   5442 C6 FF         [ 7]  508 	add	a,#0xFF
   5444 02            [ 7]  509 	ld	(bc),a
                            510 ;src/main.c:157: prota.mover = SI;
   5445 21 42 52      [10]  511 	ld	hl,#(_prota + 0x0006)
   5448 36 01         [10]  512 	ld	(hl),#0x01
   544A                     513 00102$:
                            514 ;src/main.c:159: prota.mira = M_izquierda;
   544A 21 43 52      [10]  515 	ld	hl,#(_prota + 0x0007)
   544D 36 01         [10]  516 	ld	(hl),#0x01
   544F C9            [10]  517 	ret
                            518 ;src/main.c:164: void moverDerecha() {
                            519 ;	---------------------------------
                            520 ; Function moverDerecha
                            521 ; ---------------------------------
   5450                     522 _moverDerecha::
                            523 ;src/main.c:165: if (prota.x < LIMITE_DERECHO - G_HERO_W) {
   5450 21 3C 52      [10]  524 	ld	hl,#_prota+0
   5453 7E            [ 7]  525 	ld	a, (hl)
   5454 D6 45         [ 7]  526 	sub	a, #0x45
   5456 D0            [11]  527 	ret	NC
                            528 ;src/main.c:166: if (!checkCollision(M_derecha)) {
   5457 E5            [11]  529 	push	hl
   5458 01 00 00      [10]  530 	ld	bc,#0x0000
   545B C5            [11]  531 	push	bc
   545C CD 3E 53      [17]  532 	call	_checkCollision
   545F F1            [10]  533 	pop	af
   5460 7D            [ 4]  534 	ld	a,l
   5461 E1            [10]  535 	pop	hl
   5462 B7            [ 4]  536 	or	a, a
   5463 20 08         [12]  537 	jr	NZ,00102$
                            538 ;src/main.c:167: prota.x++;
   5465 4E            [ 7]  539 	ld	c,(hl)
   5466 0C            [ 4]  540 	inc	c
   5467 71            [ 7]  541 	ld	(hl),c
                            542 ;src/main.c:168: prota.mover = SI;
   5468 21 42 52      [10]  543 	ld	hl,#(_prota + 0x0006)
   546B 36 01         [10]  544 	ld	(hl),#0x01
   546D                     545 00102$:
                            546 ;src/main.c:170: prota.mira = M_derecha;
   546D 21 43 52      [10]  547 	ld	hl,#(_prota + 0x0007)
   5470 36 00         [10]  548 	ld	(hl),#0x00
   5472 C9            [10]  549 	ret
                            550 ;src/main.c:174: void moverArriba() {
                            551 ;	---------------------------------
                            552 ; Function moverArriba
                            553 ; ---------------------------------
   5473                     554 _moverArriba::
                            555 ;src/main.c:175: if (prota.y > LIMITE_SUPERIOR) {
   5473 21 3D 52      [10]  556 	ld	hl,#_prota + 1
   5476 4E            [ 7]  557 	ld	c,(hl)
   5477 3E 08         [ 7]  558 	ld	a,#0x08
   5479 91            [ 4]  559 	sub	a, c
   547A D0            [11]  560 	ret	NC
                            561 ;src/main.c:176: if (!checkCollision(M_arriba)) {
   547B E5            [11]  562 	push	hl
   547C 01 02 00      [10]  563 	ld	bc,#0x0002
   547F C5            [11]  564 	push	bc
   5480 CD 3E 53      [17]  565 	call	_checkCollision
   5483 F1            [10]  566 	pop	af
   5484 7D            [ 4]  567 	ld	a,l
   5485 E1            [10]  568 	pop	hl
   5486 B7            [ 4]  569 	or	a, a
   5487 20 08         [12]  570 	jr	NZ,00102$
                            571 ;src/main.c:177: prota.y--;
   5489 4E            [ 7]  572 	ld	c,(hl)
   548A 0D            [ 4]  573 	dec	c
   548B 71            [ 7]  574 	ld	(hl),c
                            575 ;src/main.c:178: prota.mover  = SI;
   548C 21 42 52      [10]  576 	ld	hl,#(_prota + 0x0006)
   548F 36 01         [10]  577 	ld	(hl),#0x01
   5491                     578 00102$:
                            579 ;src/main.c:180: prota.mira = M_arriba;
   5491 21 43 52      [10]  580 	ld	hl,#(_prota + 0x0007)
   5494 36 02         [10]  581 	ld	(hl),#0x02
   5496 C9            [10]  582 	ret
                            583 ;src/main.c:184: void moverAbajo() {
                            584 ;	---------------------------------
                            585 ; Function moverAbajo
                            586 ; ---------------------------------
   5497                     587 _moverAbajo::
                            588 ;src/main.c:185: if(prota.y < LIMITE_INFERIOR - G_HERO_H){
   5497 21 3D 52      [10]  589 	ld	hl,#_prota + 1
   549A 7E            [ 7]  590 	ld	a, (hl)
   549B D6 92         [ 7]  591 	sub	a, #0x92
   549D D0            [11]  592 	ret	NC
                            593 ;src/main.c:186: if (!checkCollision(M_abajo)) {
   549E E5            [11]  594 	push	hl
   549F 01 03 00      [10]  595 	ld	bc,#0x0003
   54A2 C5            [11]  596 	push	bc
   54A3 CD 3E 53      [17]  597 	call	_checkCollision
   54A6 F1            [10]  598 	pop	af
   54A7 7D            [ 4]  599 	ld	a,l
   54A8 E1            [10]  600 	pop	hl
   54A9 B7            [ 4]  601 	or	a, a
   54AA 20 08         [12]  602 	jr	NZ,00102$
                            603 ;src/main.c:187: prota.y++;
   54AC 4E            [ 7]  604 	ld	c,(hl)
   54AD 0C            [ 4]  605 	inc	c
   54AE 71            [ 7]  606 	ld	(hl),c
                            607 ;src/main.c:188: prota.mover  = SI;
   54AF 21 42 52      [10]  608 	ld	hl,#(_prota + 0x0006)
   54B2 36 01         [10]  609 	ld	(hl),#0x01
   54B4                     610 00102$:
                            611 ;src/main.c:190: prota.mira = M_abajo;
   54B4 21 43 52      [10]  612 	ld	hl,#(_prota + 0x0007)
   54B7 36 03         [10]  613 	ld	(hl),#0x03
   54B9 C9            [10]  614 	ret
                            615 ;src/main.c:194: void dibujarCuchillo(u8 eje) {
                            616 ;	---------------------------------
                            617 ; Function dibujarCuchillo
                            618 ; ---------------------------------
   54BA                     619 _dibujarCuchillo::
   54BA DD E5         [15]  620 	push	ix
   54BC DD 21 00 00   [14]  621 	ld	ix,#0
   54C0 DD 39         [15]  622 	add	ix,sp
   54C2 F5            [11]  623 	push	af
                            624 ;src/main.c:195: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   54C3 21 45 52      [10]  625 	ld	hl, #_cu + 1
   54C6 56            [ 7]  626 	ld	d,(hl)
   54C7 21 44 52      [10]  627 	ld	hl, #_cu + 0
   54CA 46            [ 7]  628 	ld	b,(hl)
   54CB D5            [11]  629 	push	de
   54CC 33            [ 6]  630 	inc	sp
   54CD C5            [11]  631 	push	bc
   54CE 33            [ 6]  632 	inc	sp
   54CF 21 00 C0      [10]  633 	ld	hl,#0xC000
   54D2 E5            [11]  634 	push	hl
   54D3 CD DF 51      [17]  635 	call	_cpct_getScreenPtr
                            636 ;src/main.c:197: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   54D6 33            [ 6]  637 	inc	sp
   54D7 33            [ 6]  638 	inc	sp
   54D8 E5            [11]  639 	push	hl
                            640 ;src/main.c:196: if(eje == E_X){
   54D9 DD 7E 04      [19]  641 	ld	a,4 (ix)
   54DC B7            [ 4]  642 	or	a, a
   54DD 20 19         [12]  643 	jr	NZ,00104$
                            644 ;src/main.c:197: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   54DF 11 00 3E      [10]  645 	ld	de,#_g_tablatrans+0
   54E2 ED 4B 48 52   [20]  646 	ld	bc, (#(_cu + 0x0004) + 0)
   54E6 D5            [11]  647 	push	de
   54E7 21 03 03      [10]  648 	ld	hl,#0x0303
   54EA E5            [11]  649 	push	hl
   54EB DD 6E FE      [19]  650 	ld	l,-2 (ix)
   54EE DD 66 FF      [19]  651 	ld	h,-1 (ix)
   54F1 E5            [11]  652 	push	hl
   54F2 C5            [11]  653 	push	bc
   54F3 CD FF 51      [17]  654 	call	_cpct_drawSpriteMaskedAlignedTable
   54F6 18 1D         [12]  655 	jr	00106$
   54F8                     656 00104$:
                            657 ;src/main.c:200: else if(eje == E_Y){
   54F8 DD 7E 04      [19]  658 	ld	a,4 (ix)
   54FB 3D            [ 4]  659 	dec	a
   54FC 20 17         [12]  660 	jr	NZ,00106$
                            661 ;src/main.c:201: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   54FE 11 00 3E      [10]  662 	ld	de,#_g_tablatrans+0
   5501 ED 4B 48 52   [20]  663 	ld	bc, (#(_cu + 0x0004) + 0)
   5505 D5            [11]  664 	push	de
   5506 21 02 06      [10]  665 	ld	hl,#0x0602
   5509 E5            [11]  666 	push	hl
   550A DD 6E FE      [19]  667 	ld	l,-2 (ix)
   550D DD 66 FF      [19]  668 	ld	h,-1 (ix)
   5510 E5            [11]  669 	push	hl
   5511 C5            [11]  670 	push	bc
   5512 CD FF 51      [17]  671 	call	_cpct_drawSpriteMaskedAlignedTable
   5515                     672 00106$:
   5515 DD F9         [10]  673 	ld	sp, ix
   5517 DD E1         [14]  674 	pop	ix
   5519 C9            [10]  675 	ret
                            676 ;src/main.c:205: void borrarCuchillo() {
                            677 ;	---------------------------------
                            678 ; Function borrarCuchillo
                            679 ; ---------------------------------
   551A                     680 _borrarCuchillo::
   551A DD E5         [15]  681 	push	ix
   551C DD 21 00 00   [14]  682 	ld	ix,#0
   5520 DD 39         [15]  683 	add	ix,sp
   5522 3B            [ 6]  684 	dec	sp
                            685 ;src/main.c:206: u8 w = 2 + (cu.px & 1);
   5523 21 46 52      [10]  686 	ld	hl, #_cu + 2
   5526 4E            [ 7]  687 	ld	c,(hl)
   5527 79            [ 4]  688 	ld	a,c
   5528 E6 01         [ 7]  689 	and	a, #0x01
   552A 47            [ 4]  690 	ld	b,a
   552B 04            [ 4]  691 	inc	b
   552C 04            [ 4]  692 	inc	b
                            693 ;src/main.c:207: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   552D 21 47 52      [10]  694 	ld	hl, #_cu + 3
   5530 5E            [ 7]  695 	ld	e,(hl)
   5531 7B            [ 4]  696 	ld	a,e
   5532 E6 03         [ 7]  697 	and	a, #0x03
   5534 28 04         [12]  698 	jr	Z,00103$
   5536 3E 01         [ 7]  699 	ld	a,#0x01
   5538 18 02         [12]  700 	jr	00104$
   553A                     701 00103$:
   553A 3E 00         [ 7]  702 	ld	a,#0x00
   553C                     703 00104$:
   553C C6 02         [ 7]  704 	add	a, #0x02
   553E DD 77 FF      [19]  705 	ld	-1 (ix),a
                            706 ;src/main.c:208: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   5541 FD 2A 4D 52   [20]  707 	ld	iy,(_mapa)
   5545 16 00         [ 7]  708 	ld	d,#0x00
   5547 63            [ 4]  709 	ld	h,e
   5548 6A            [ 4]  710 	ld	l,d
   5549 CB 7A         [ 8]  711 	bit	7, d
   554B 28 05         [12]  712 	jr	Z,00105$
   554D 13            [ 6]  713 	inc	de
   554E 13            [ 6]  714 	inc	de
   554F 13            [ 6]  715 	inc	de
   5550 63            [ 4]  716 	ld	h,e
   5551 6A            [ 4]  717 	ld	l,d
   5552                     718 00105$:
   5552 5C            [ 4]  719 	ld	e, h
   5553 55            [ 4]  720 	ld	d, l
   5554 CB 2A         [ 8]  721 	sra	d
   5556 CB 1B         [ 8]  722 	rr	e
   5558 CB 2A         [ 8]  723 	sra	d
   555A CB 1B         [ 8]  724 	rr	e
   555C 51            [ 4]  725 	ld	d,c
   555D CB 3A         [ 8]  726 	srl	d
   555F FD E5         [15]  727 	push	iy
   5561 21 00 C0      [10]  728 	ld	hl,#0xC000
   5564 E5            [11]  729 	push	hl
   5565 3E 28         [ 7]  730 	ld	a,#0x28
   5567 F5            [11]  731 	push	af
   5568 33            [ 6]  732 	inc	sp
   5569 DD 7E FF      [19]  733 	ld	a,-1 (ix)
   556C F5            [11]  734 	push	af
   556D 33            [ 6]  735 	inc	sp
   556E C5            [11]  736 	push	bc
   556F 33            [ 6]  737 	inc	sp
   5570 7B            [ 4]  738 	ld	a,e
   5571 F5            [11]  739 	push	af
   5572 33            [ 6]  740 	inc	sp
   5573 D5            [11]  741 	push	de
   5574 33            [ 6]  742 	inc	sp
   5575 CD 3B 48      [17]  743 	call	_cpct_etm_drawTileBox2x4
   5578 33            [ 6]  744 	inc	sp
   5579 DD E1         [14]  745 	pop	ix
   557B C9            [10]  746 	ret
                            747 ;src/main.c:211: void redibujarCuchillo() {
                            748 ;	---------------------------------
                            749 ; Function redibujarCuchillo
                            750 ; ---------------------------------
   557C                     751 _redibujarCuchillo::
                            752 ;src/main.c:212: borrarCuchillo();
   557C CD 1A 55      [17]  753 	call	_borrarCuchillo
                            754 ;src/main.c:213: cu.px = cu.x;
   557F 3A 44 52      [13]  755 	ld	a, (#_cu + 0)
   5582 32 46 52      [13]  756 	ld	(#(_cu + 0x0002)),a
                            757 ;src/main.c:214: cu.py = cu.y;
   5585 3A 45 52      [13]  758 	ld	a, (#_cu + 1)
   5588 32 47 52      [13]  759 	ld	(#(_cu + 0x0003)),a
                            760 ;src/main.c:215: dibujarCuchillo(cu.eje);
   558B 21 4C 52      [10]  761 	ld	hl, #_cu + 8
   558E 46            [ 7]  762 	ld	b,(hl)
   558F C5            [11]  763 	push	bc
   5590 33            [ 6]  764 	inc	sp
   5591 CD BA 54      [17]  765 	call	_dibujarCuchillo
   5594 33            [ 6]  766 	inc	sp
   5595 C9            [10]  767 	ret
                            768 ;src/main.c:219: void lanzarCuchillo(){
                            769 ;	---------------------------------
                            770 ; Function lanzarCuchillo
                            771 ; ---------------------------------
   5596                     772 _lanzarCuchillo::
                            773 ;src/main.c:220: cu.lanzado = SI;
   5596 11 44 52      [10]  774 	ld	de,#_cu+0
   5599 21 4A 52      [10]  775 	ld	hl,#(_cu + 0x0006)
   559C 36 01         [10]  776 	ld	(hl),#0x01
                            777 ;src/main.c:221: if(prota.mira == M_derecha){
   559E 21 43 52      [10]  778 	ld	hl, #_prota + 7
   55A1 4E            [ 7]  779 	ld	c,(hl)
                            780 ;src/main.c:222: cu.direccion = M_derecha;
                            781 ;src/main.c:224: cu.y=prota.y + G_HERO_H /2;
                            782 ;src/main.c:225: cu.sprite=g_knifeX_0;
                            783 ;src/main.c:226: cu.eje = E_X;
                            784 ;src/main.c:221: if(prota.mira == M_derecha){
   55A2 79            [ 4]  785 	ld	a,c
   55A3 B7            [ 4]  786 	or	a, a
   55A4 20 29         [12]  787 	jr	NZ,00110$
                            788 ;src/main.c:222: cu.direccion = M_derecha;
   55A6 21 4B 52      [10]  789 	ld	hl,#(_cu + 0x0007)
   55A9 36 00         [10]  790 	ld	(hl),#0x00
                            791 ;src/main.c:223: cu.x=prota.x + G_HERO_W;
   55AB 3A 3C 52      [13]  792 	ld	a, (#_prota + 0)
   55AE C6 07         [ 7]  793 	add	a, #0x07
   55B0 12            [ 7]  794 	ld	(de),a
                            795 ;src/main.c:224: cu.y=prota.y + G_HERO_H /2;
   55B1 3A 3D 52      [13]  796 	ld	a, (#(_prota + 0x0001) + 0)
   55B4 C6 0B         [ 7]  797 	add	a, #0x0B
   55B6 32 45 52      [13]  798 	ld	(#(_cu + 0x0001)),a
                            799 ;src/main.c:225: cu.sprite=g_knifeX_0;
   55B9 21 F8 46      [10]  800 	ld	hl,#_g_knifeX_0
   55BC 22 48 52      [16]  801 	ld	((_cu + 0x0004)), hl
                            802 ;src/main.c:226: cu.eje = E_X;
   55BF 21 4C 52      [10]  803 	ld	hl,#(_cu + 0x0008)
   55C2 36 00         [10]  804 	ld	(hl),#0x00
                            805 ;src/main.c:227: dibujarCuchillo(cu.eje);
   55C4 21 4C 52      [10]  806 	ld	hl, #(_cu + 0x0008) + 0
   55C7 46            [ 7]  807 	ld	b,(hl)
   55C8 C5            [11]  808 	push	bc
   55C9 33            [ 6]  809 	inc	sp
   55CA CD BA 54      [17]  810 	call	_dibujarCuchillo
   55CD 33            [ 6]  811 	inc	sp
   55CE C9            [10]  812 	ret
   55CF                     813 00110$:
                            814 ;src/main.c:229: else if(prota.mira == M_izquierda){
   55CF 79            [ 4]  815 	ld	a,c
   55D0 3D            [ 4]  816 	dec	a
   55D1 20 29         [12]  817 	jr	NZ,00107$
                            818 ;src/main.c:230: cu.direccion = M_izquierda;
   55D3 21 4B 52      [10]  819 	ld	hl,#(_cu + 0x0007)
   55D6 36 01         [10]  820 	ld	(hl),#0x01
                            821 ;src/main.c:231: cu.x = prota.x - G_KNIFEX_0_W;
   55D8 3A 3C 52      [13]  822 	ld	a, (#_prota + 0)
   55DB C6 FD         [ 7]  823 	add	a,#0xFD
   55DD 12            [ 7]  824 	ld	(de),a
                            825 ;src/main.c:232: cu.y = prota.y + G_HERO_H /2;
   55DE 3A 3D 52      [13]  826 	ld	a, (#(_prota + 0x0001) + 0)
   55E1 C6 0B         [ 7]  827 	add	a, #0x0B
   55E3 32 45 52      [13]  828 	ld	(#(_cu + 0x0001)),a
                            829 ;src/main.c:233: cu.sprite = g_knifeX_1;
   55E6 21 01 47      [10]  830 	ld	hl,#_g_knifeX_1
   55E9 22 48 52      [16]  831 	ld	((_cu + 0x0004)), hl
                            832 ;src/main.c:234: cu.eje = E_X;
   55EC 21 4C 52      [10]  833 	ld	hl,#(_cu + 0x0008)
   55EF 36 00         [10]  834 	ld	(hl),#0x00
                            835 ;src/main.c:235: dibujarCuchillo(cu.eje);
   55F1 21 4C 52      [10]  836 	ld	hl, #(_cu + 0x0008) + 0
   55F4 46            [ 7]  837 	ld	b,(hl)
   55F5 C5            [11]  838 	push	bc
   55F6 33            [ 6]  839 	inc	sp
   55F7 CD BA 54      [17]  840 	call	_dibujarCuchillo
   55FA 33            [ 6]  841 	inc	sp
   55FB C9            [10]  842 	ret
   55FC                     843 00107$:
                            844 ;src/main.c:237: else if(prota.mira == M_abajo){
   55FC 79            [ 4]  845 	ld	a,c
   55FD D6 03         [ 7]  846 	sub	a, #0x03
   55FF 20 29         [12]  847 	jr	NZ,00104$
                            848 ;src/main.c:238: cu.direccion = M_abajo;
   5601 21 4B 52      [10]  849 	ld	hl,#(_cu + 0x0007)
   5604 36 03         [10]  850 	ld	(hl),#0x03
                            851 ;src/main.c:239: cu.x = prota.x + G_HERO_W / 2;
   5606 3A 3C 52      [13]  852 	ld	a, (#_prota + 0)
   5609 C6 03         [ 7]  853 	add	a, #0x03
   560B 12            [ 7]  854 	ld	(de),a
                            855 ;src/main.c:240: cu.y = prota.y + G_HERO_H + 10;
   560C 3A 3D 52      [13]  856 	ld	a, (#(_prota + 0x0001) + 0)
   560F C6 20         [ 7]  857 	add	a, #0x20
   5611 32 45 52      [13]  858 	ld	(#(_cu + 0x0001)),a
                            859 ;src/main.c:241: cu.sprite = g_knifeY_0;
   5614 21 E0 46      [10]  860 	ld	hl,#_g_knifeY_0
   5617 22 48 52      [16]  861 	ld	((_cu + 0x0004)), hl
                            862 ;src/main.c:242: cu.eje = E_Y;
   561A 21 4C 52      [10]  863 	ld	hl,#(_cu + 0x0008)
   561D 36 01         [10]  864 	ld	(hl),#0x01
                            865 ;src/main.c:243: dibujarCuchillo(cu.eje);
   561F 21 4C 52      [10]  866 	ld	hl, #(_cu + 0x0008) + 0
   5622 46            [ 7]  867 	ld	b,(hl)
   5623 C5            [11]  868 	push	bc
   5624 33            [ 6]  869 	inc	sp
   5625 CD BA 54      [17]  870 	call	_dibujarCuchillo
   5628 33            [ 6]  871 	inc	sp
   5629 C9            [10]  872 	ret
   562A                     873 00104$:
                            874 ;src/main.c:245: else if(prota.mira == M_arriba){
   562A 79            [ 4]  875 	ld	a,c
   562B D6 02         [ 7]  876 	sub	a, #0x02
   562D C0            [11]  877 	ret	NZ
                            878 ;src/main.c:246: cu.direccion = M_arriba;
   562E 21 4B 52      [10]  879 	ld	hl,#(_cu + 0x0007)
   5631 36 02         [10]  880 	ld	(hl),#0x02
                            881 ;src/main.c:247: cu.x = prota.x + G_HERO_W / 2;
   5633 3A 3C 52      [13]  882 	ld	a, (#_prota + 0)
   5636 C6 03         [ 7]  883 	add	a, #0x03
   5638 12            [ 7]  884 	ld	(de),a
                            885 ;src/main.c:248: cu.y = prota.y;
   5639 3A 3D 52      [13]  886 	ld	a, (#(_prota + 0x0001) + 0)
   563C 32 45 52      [13]  887 	ld	(#(_cu + 0x0001)),a
                            888 ;src/main.c:249: cu.sprite = g_knifeY_1;
   563F 21 EC 46      [10]  889 	ld	hl,#_g_knifeY_1
   5642 22 48 52      [16]  890 	ld	((_cu + 0x0004)), hl
                            891 ;src/main.c:250: cu.eje = E_Y;
   5645 21 4C 52      [10]  892 	ld	hl,#(_cu + 0x0008)
   5648 36 01         [10]  893 	ld	(hl),#0x01
                            894 ;src/main.c:251: dibujarCuchillo(cu.eje);
   564A 21 4C 52      [10]  895 	ld	hl, #(_cu + 0x0008) + 0
   564D 46            [ 7]  896 	ld	b,(hl)
   564E C5            [11]  897 	push	bc
   564F 33            [ 6]  898 	inc	sp
   5650 CD BA 54      [17]  899 	call	_dibujarCuchillo
   5653 33            [ 6]  900 	inc	sp
   5654 C9            [10]  901 	ret
                            902 ;src/main.c:255: void comprobarTeclado() {
                            903 ;	---------------------------------
                            904 ; Function comprobarTeclado
                            905 ; ---------------------------------
   5655                     906 _comprobarTeclado::
                            907 ;src/main.c:256: cpct_scanKeyboard_if();
   5655 CD 06 49      [17]  908 	call	_cpct_scanKeyboard_if
                            909 ;src/main.c:258: if (cpct_isAnyKeyPressed()) {
   5658 CD F9 48      [17]  910 	call	_cpct_isAnyKeyPressed
   565B 7D            [ 4]  911 	ld	a,l
   565C B7            [ 4]  912 	or	a, a
   565D C8            [11]  913 	ret	Z
                            914 ;src/main.c:259: if (cpct_isKeyPressed(Key_CursorLeft))
   565E 21 01 01      [10]  915 	ld	hl,#0x0101
   5661 CD 2F 48      [17]  916 	call	_cpct_isKeyPressed
   5664 7D            [ 4]  917 	ld	a,l
   5665 B7            [ 4]  918 	or	a, a
                            919 ;src/main.c:260: moverIzquierda();
   5666 C2 2A 54      [10]  920 	jp	NZ,_moverIzquierda
                            921 ;src/main.c:261: else if (cpct_isKeyPressed(Key_CursorRight))
   5669 21 00 02      [10]  922 	ld	hl,#0x0200
   566C CD 2F 48      [17]  923 	call	_cpct_isKeyPressed
   566F 7D            [ 4]  924 	ld	a,l
   5670 B7            [ 4]  925 	or	a, a
                            926 ;src/main.c:262: moverDerecha();
   5671 C2 50 54      [10]  927 	jp	NZ,_moverDerecha
                            928 ;src/main.c:263: else if (cpct_isKeyPressed(Key_CursorUp))
   5674 21 00 01      [10]  929 	ld	hl,#0x0100
   5677 CD 2F 48      [17]  930 	call	_cpct_isKeyPressed
   567A 7D            [ 4]  931 	ld	a,l
   567B B7            [ 4]  932 	or	a, a
                            933 ;src/main.c:264: moverArriba();
   567C C2 73 54      [10]  934 	jp	NZ,_moverArriba
                            935 ;src/main.c:265: else if (cpct_isKeyPressed(Key_CursorDown))
   567F 21 00 04      [10]  936 	ld	hl,#0x0400
   5682 CD 2F 48      [17]  937 	call	_cpct_isKeyPressed
   5685 7D            [ 4]  938 	ld	a,l
   5686 B7            [ 4]  939 	or	a, a
                            940 ;src/main.c:266: moverAbajo();
   5687 C2 97 54      [10]  941 	jp	NZ,_moverAbajo
                            942 ;src/main.c:267: else if (cpct_isKeyPressed(Key_Space))
   568A 21 05 80      [10]  943 	ld	hl,#0x8005
   568D CD 2F 48      [17]  944 	call	_cpct_isKeyPressed
   5690 7D            [ 4]  945 	ld	a,l
   5691 B7            [ 4]  946 	or	a, a
   5692 C8            [11]  947 	ret	Z
                            948 ;src/main.c:268: lanzarCuchillo();
   5693 C3 96 55      [10]  949 	jp  _lanzarCuchillo
                            950 ;src/main.c:274: void moverCuchillo(){
                            951 ;	---------------------------------
                            952 ; Function moverCuchillo
                            953 ; ---------------------------------
   5696                     954 _moverCuchillo::
                            955 ;src/main.c:276: if(cu.direccion == M_derecha){
   5696 01 44 52      [10]  956 	ld	bc,#_cu+0
   5699 21 4B 52      [10]  957 	ld	hl, #_cu + 7
   569C 5E            [ 7]  958 	ld	e,(hl)
                            959 ;src/main.c:283: cu.lanzado = NO;
                            960 ;src/main.c:276: if(cu.direccion == M_derecha){
   569D 7B            [ 4]  961 	ld	a,e
   569E B7            [ 4]  962 	or	a, a
   569F 20 19         [12]  963 	jr	NZ,00130$
                            964 ;src/main.c:277: if(cu.x< LIMITE_DERECHO - G_KNIFEX_0_W){
   56A1 0A            [ 7]  965 	ld	a,(bc)
   56A2 5F            [ 4]  966 	ld	e,a
   56A3 D6 49         [ 7]  967 	sub	a, #0x49
   56A5 30 06         [12]  968 	jr	NC,00104$
                            969 ;src/main.c:278: cu.x++;
   56A7 1C            [ 4]  970 	inc	e
   56A8 7B            [ 4]  971 	ld	a,e
   56A9 02            [ 7]  972 	ld	(bc),a
                            973 ;src/main.c:279: redibujarCuchillo();
   56AA C3 7C 55      [10]  974 	jp  _redibujarCuchillo
   56AD                     975 00104$:
                            976 ;src/main.c:281: else if(cu.x == LIMITE_DERECHO  - G_KNIFEX_0_W){
   56AD 7B            [ 4]  977 	ld	a,e
   56AE D6 49         [ 7]  978 	sub	a, #0x49
   56B0 C0            [11]  979 	ret	NZ
                            980 ;src/main.c:282: borrarCuchillo();
   56B1 CD 1A 55      [17]  981 	call	_borrarCuchillo
                            982 ;src/main.c:283: cu.lanzado = NO;
   56B4 21 4A 52      [10]  983 	ld	hl,#(_cu + 0x0006)
   56B7 36 00         [10]  984 	ld	(hl),#0x00
   56B9 C9            [10]  985 	ret
   56BA                     986 00130$:
                            987 ;src/main.c:286: else if(cu.direccion == M_izquierda){
   56BA 7B            [ 4]  988 	ld	a,e
   56BB 3D            [ 4]  989 	dec	a
   56BC 20 1A         [12]  990 	jr	NZ,00127$
                            991 ;src/main.c:287: if(cu.x > LIMITE_IZQUIERDO){
   56BE 0A            [ 7]  992 	ld	a,(bc)
   56BF 5F            [ 4]  993 	ld	e,a
   56C0 3E 04         [ 7]  994 	ld	a,#0x04
   56C2 93            [ 4]  995 	sub	a, e
   56C3 30 06         [12]  996 	jr	NC,00109$
                            997 ;src/main.c:288: cu.x--;
   56C5 1D            [ 4]  998 	dec	e
   56C6 7B            [ 4]  999 	ld	a,e
   56C7 02            [ 7] 1000 	ld	(bc),a
                           1001 ;src/main.c:289: redibujarCuchillo();
   56C8 C3 7C 55      [10] 1002 	jp  _redibujarCuchillo
   56CB                    1003 00109$:
                           1004 ;src/main.c:290: }else if(cu.x == LIMITE_IZQUIERDO){
   56CB 7B            [ 4] 1005 	ld	a,e
   56CC D6 04         [ 7] 1006 	sub	a, #0x04
   56CE C0            [11] 1007 	ret	NZ
                           1008 ;src/main.c:291: borrarCuchillo();
   56CF CD 1A 55      [17] 1009 	call	_borrarCuchillo
                           1010 ;src/main.c:292: cu.lanzado = NO;
   56D2 21 4A 52      [10] 1011 	ld	hl,#(_cu + 0x0006)
   56D5 36 00         [10] 1012 	ld	(hl),#0x00
   56D7 C9            [10] 1013 	ret
   56D8                    1014 00127$:
                           1015 ;src/main.c:296: if(cu.y < LIMITE_INFERIOR - G_KNIFEY_0_H){
   56D8 69            [ 4] 1016 	ld	l, c
   56D9 60            [ 4] 1017 	ld	h, b
   56DA 23            [ 6] 1018 	inc	hl
                           1019 ;src/main.c:295: else if(cu.direccion == M_abajo){
   56DB 7B            [ 4] 1020 	ld	a,e
   56DC D6 03         [ 7] 1021 	sub	a, #0x03
   56DE 20 18         [12] 1022 	jr	NZ,00124$
                           1023 ;src/main.c:296: if(cu.y < LIMITE_INFERIOR - G_KNIFEY_0_H){
   56E0 4E            [ 7] 1024 	ld	c,(hl)
   56E1 79            [ 4] 1025 	ld	a,c
   56E2 D6 A2         [ 7] 1026 	sub	a, #0xA2
   56E4 30 05         [12] 1027 	jr	NC,00114$
                           1028 ;src/main.c:297: cu.y++;
   56E6 0C            [ 4] 1029 	inc	c
   56E7 71            [ 7] 1030 	ld	(hl),c
                           1031 ;src/main.c:298: redibujarCuchillo();
   56E8 C3 7C 55      [10] 1032 	jp  _redibujarCuchillo
   56EB                    1033 00114$:
                           1034 ;src/main.c:299: }else if(cu.y == LIMITE_INFERIOR - G_KNIFEY_0_H){
   56EB 79            [ 4] 1035 	ld	a,c
   56EC D6 A2         [ 7] 1036 	sub	a, #0xA2
   56EE C0            [11] 1037 	ret	NZ
                           1038 ;src/main.c:300: borrarCuchillo();
   56EF CD 1A 55      [17] 1039 	call	_borrarCuchillo
                           1040 ;src/main.c:301: cu.lanzado = NO;
   56F2 21 4A 52      [10] 1041 	ld	hl,#(_cu + 0x0006)
   56F5 36 00         [10] 1042 	ld	(hl),#0x00
   56F7 C9            [10] 1043 	ret
   56F8                    1044 00124$:
                           1045 ;src/main.c:304: else if(cu.direccion == M_arriba){
   56F8 7B            [ 4] 1046 	ld	a,e
   56F9 D6 02         [ 7] 1047 	sub	a, #0x02
   56FB C0            [11] 1048 	ret	NZ
                           1049 ;src/main.c:305: if(cu.y > LIMITE_SUPERIOR){
   56FC 4E            [ 7] 1050 	ld	c,(hl)
   56FD 3E 08         [ 7] 1051 	ld	a,#0x08
   56FF 91            [ 4] 1052 	sub	a, c
   5700 30 05         [12] 1053 	jr	NC,00119$
                           1054 ;src/main.c:306: cu.y--;
   5702 0D            [ 4] 1055 	dec	c
   5703 71            [ 7] 1056 	ld	(hl),c
                           1057 ;src/main.c:307: redibujarCuchillo();
   5704 C3 7C 55      [10] 1058 	jp  _redibujarCuchillo
   5707                    1059 00119$:
                           1060 ;src/main.c:308: }else if(cu.y == LIMITE_SUPERIOR){
   5707 79            [ 4] 1061 	ld	a,c
   5708 D6 08         [ 7] 1062 	sub	a, #0x08
   570A C0            [11] 1063 	ret	NZ
                           1064 ;src/main.c:309: borrarCuchillo();
   570B CD 1A 55      [17] 1065 	call	_borrarCuchillo
                           1066 ;src/main.c:310: cu.lanzado = NO;
   570E 21 4A 52      [10] 1067 	ld	hl,#(_cu + 0x0006)
   5711 36 00         [10] 1068 	ld	(hl),#0x00
   5713 C9            [10] 1069 	ret
                           1070 ;src/main.c:315: void inicializar() {
                           1071 ;	---------------------------------
                           1072 ; Function inicializar
                           1073 ; ---------------------------------
   5714                    1074 _inicializar::
                           1075 ;src/main.c:316: cpct_disableFirmware();
   5714 CD AD 51      [17] 1076 	call	_cpct_disableFirmware
                           1077 ;src/main.c:317: cpct_setVideoMode(0);
   5717 2E 00         [ 7] 1078 	ld	l,#0x00
   5719 CD 76 49      [17] 1079 	call	_cpct_setVideoMode
                           1080 ;src/main.c:319: cpct_setPalette(g_palette, 16);
   571C 21 10 00      [10] 1081 	ld	hl,#0x0010
   571F E5            [11] 1082 	push	hl
   5720 21 6E 47      [10] 1083 	ld	hl,#_g_palette
   5723 E5            [11] 1084 	push	hl
   5724 CD 18 48      [17] 1085 	call	_cpct_setPalette
                           1086 ;src/main.c:320: cpct_akp_musicInit(G_song);
   5727 21 00 02      [10] 1087 	ld	hl,#_G_song
   572A E5            [11] 1088 	push	hl
   572B CD 89 50      [17] 1089 	call	_cpct_akp_musicInit
   572E F1            [10] 1090 	pop	af
                           1091 ;src/main.c:321: mapa = g_map1;
   572F 21 00 40      [10] 1092 	ld	hl,#_g_map1+0
   5732 22 4D 52      [16] 1093 	ld	(_mapa),hl
                           1094 ;src/main.c:322: cpct_etm_setTileset2x4(g_tileset);
   5735 21 0A 47      [10] 1095 	ld	hl,#_g_tileset
   5738 CD CA 48      [17] 1096 	call	_cpct_etm_setTileset2x4
                           1097 ;src/main.c:323: dibujarMapa();
   573B CD 4F 52      [17] 1098 	call	_dibujarMapa
                           1099 ;src/main.c:326: prota.x = prota.px = 0;
   573E 21 3E 52      [10] 1100 	ld	hl,#(_prota + 0x0002)
   5741 36 00         [10] 1101 	ld	(hl),#0x00
   5743 21 3C 52      [10] 1102 	ld	hl,#_prota
   5746 36 00         [10] 1103 	ld	(hl),#0x00
                           1104 ;src/main.c:327: prota.y = prota.py = 80;
   5748 21 3F 52      [10] 1105 	ld	hl,#(_prota + 0x0003)
   574B 36 50         [10] 1106 	ld	(hl),#0x50
   574D 21 3D 52      [10] 1107 	ld	hl,#(_prota + 0x0001)
   5750 36 50         [10] 1108 	ld	(hl),#0x50
                           1109 ;src/main.c:328: prota.mover  = NO;
   5752 21 42 52      [10] 1110 	ld	hl,#(_prota + 0x0006)
   5755 36 00         [10] 1111 	ld	(hl),#0x00
                           1112 ;src/main.c:329: prota.mira=M_derecha;
   5757 21 43 52      [10] 1113 	ld	hl,#(_prota + 0x0007)
   575A 36 00         [10] 1114 	ld	(hl),#0x00
                           1115 ;src/main.c:330: prota.sprite = g_hero;
   575C 21 7E 47      [10] 1116 	ld	hl,#_g_hero
   575F 22 40 52      [16] 1117 	ld	((_prota + 0x0004)), hl
                           1118 ;src/main.c:331: cu.x = cu.px =0;
   5762 11 44 52      [10] 1119 	ld	de,#_cu+0
   5765 01 46 52      [10] 1120 	ld	bc,#_cu + 2
   5768 AF            [ 4] 1121 	xor	a, a
   5769 02            [ 7] 1122 	ld	(bc),a
   576A AF            [ 4] 1123 	xor	a, a
   576B 12            [ 7] 1124 	ld	(de),a
                           1125 ;src/main.c:332: cu.x = cu.px = 0;
   576C AF            [ 4] 1126 	xor	a, a
   576D 02            [ 7] 1127 	ld	(bc),a
   576E 21 44 52      [10] 1128 	ld	hl,#_cu
   5771 36 00         [10] 1129 	ld	(hl),#0x00
                           1130 ;src/main.c:333: cu.lanzado=0;
   5773 21 4A 52      [10] 1131 	ld	hl,#(_cu + 0x0006)
   5776 36 00         [10] 1132 	ld	(hl),#0x00
                           1133 ;src/main.c:335: dibujarProta();
   5778 CD 65 52      [17] 1134 	call	_dibujarProta
   577B C9            [10] 1135 	ret
                           1136 ;src/main.c:338: void main(void) {
                           1137 ;	---------------------------------
                           1138 ; Function main
                           1139 ; ---------------------------------
   577C                    1140 _main::
                           1141 ;src/main.c:341: inicializar();
   577C CD 14 57      [17] 1142 	call	_inicializar
                           1143 ;src/main.c:342: cpct_akp_musicPlay();
   577F CD 86 49      [17] 1144 	call	_cpct_akp_musicPlay
                           1145 ;src/main.c:345: while (1) {
   5782                    1146 00106$:
                           1147 ;src/main.c:348: comprobarTeclado();
   5782 CD 55 56      [17] 1148 	call	_comprobarTeclado
                           1149 ;src/main.c:350: if(cu.lanzado){
   5785 3A 4A 52      [13] 1150 	ld	a, (#(_cu + 0x0006) + 0)
   5788 B7            [ 4] 1151 	or	a, a
   5789 28 06         [12] 1152 	jr	Z,00102$
                           1153 ;src/main.c:351: cpct_waitVSYNC();
   578B CD 6E 49      [17] 1154 	call	_cpct_waitVSYNC
                           1155 ;src/main.c:352: moverCuchillo();
   578E CD 96 56      [17] 1156 	call	_moverCuchillo
   5791                    1157 00102$:
                           1158 ;src/main.c:354: if (prota.mover) {
   5791 3A 42 52      [13] 1159 	ld	a, (#(_prota + 0x0006) + 0)
   5794 B7            [ 4] 1160 	or	a, a
   5795 28 0B         [12] 1161 	jr	Z,00104$
                           1162 ;src/main.c:355: cpct_waitVSYNC();
   5797 CD 6E 49      [17] 1163 	call	_cpct_waitVSYNC
                           1164 ;src/main.c:356: redibujarProta();
   579A CD EE 52      [17] 1165 	call	_redibujarProta
                           1166 ;src/main.c:357: prota.mover = NO;
   579D 21 42 52      [10] 1167 	ld	hl,#(_prota + 0x0006)
   57A0 36 00         [10] 1168 	ld	(hl),#0x00
   57A2                    1169 00104$:
                           1170 ;src/main.c:359: cpct_waitVSYNC();
   57A2 CD 6E 49      [17] 1171 	call	_cpct_waitVSYNC
   57A5 18 DB         [12] 1172 	jr	00106$
                           1173 	.area _CODE
                           1174 	.area _INITIALIZER
                           1175 	.area _CABS (ABS)
   0200                    1176 	.org 0x0200
   0200                    1177 _G_song:
   0200 41                 1178 	.db #0x41	; 65	'A'
   0201 54                 1179 	.db #0x54	; 84	'T'
   0202 31                 1180 	.db #0x31	; 49	'1'
   0203 30                 1181 	.db #0x30	; 48	'0'
   0204 01                 1182 	.db #0x01	; 1
   0205 40                 1183 	.db #0x40	; 64
   0206 42                 1184 	.db #0x42	; 66	'B'
   0207 0F                 1185 	.db #0x0F	; 15
   0208 02                 1186 	.db #0x02	; 2
   0209 06                 1187 	.db #0x06	; 6
   020A 1D                 1188 	.db #0x1D	; 29
   020B 00                 1189 	.db #0x00	; 0
   020C 10                 1190 	.db #0x10	; 16
   020D 40                 1191 	.db #0x40	; 64
   020E 19                 1192 	.db #0x19	; 25
   020F 40                 1193 	.db #0x40	; 64
   0210 00                 1194 	.db #0x00	; 0
   0211 00                 1195 	.db #0x00	; 0
   0212 00                 1196 	.db #0x00	; 0
   0213 00                 1197 	.db #0x00	; 0
   0214 00                 1198 	.db #0x00	; 0
   0215 00                 1199 	.db #0x00	; 0
   0216 0D                 1200 	.db #0x0D	; 13
   0217 12                 1201 	.db #0x12	; 18
   0218 40                 1202 	.db #0x40	; 64
   0219 01                 1203 	.db #0x01	; 1
   021A 00                 1204 	.db #0x00	; 0
   021B 7C                 1205 	.db #0x7C	; 124
   021C 18                 1206 	.db #0x18	; 24
   021D 78                 1207 	.db #0x78	; 120	'x'
   021E 0C                 1208 	.db #0x0C	; 12
   021F 34                 1209 	.db #0x34	; 52	'4'
   0220 30                 1210 	.db #0x30	; 48	'0'
   0221 2C                 1211 	.db #0x2C	; 44
   0222 28                 1212 	.db #0x28	; 40
   0223 24                 1213 	.db #0x24	; 36
   0224 20                 1214 	.db #0x20	; 32
   0225 1C                 1215 	.db #0x1C	; 28
   0226 0D                 1216 	.db #0x0D	; 13
   0227 25                 1217 	.db #0x25	; 37
   0228 40                 1218 	.db #0x40	; 64
   0229 20                 1219 	.db #0x20	; 32
   022A 00                 1220 	.db #0x00	; 0
   022B 00                 1221 	.db #0x00	; 0
   022C 00                 1222 	.db #0x00	; 0
   022D 39                 1223 	.db #0x39	; 57	'9'
   022E 40                 1224 	.db #0x40	; 64
   022F 00                 1225 	.db #0x00	; 0
   0230 57                 1226 	.db #0x57	; 87	'W'
   0231 40                 1227 	.db #0x40	; 64
   0232 3B                 1228 	.db #0x3B	; 59
   0233 40                 1229 	.db #0x40	; 64
   0234 57                 1230 	.db #0x57	; 87	'W'
   0235 40                 1231 	.db #0x40	; 64
   0236 01                 1232 	.db #0x01	; 1
   0237 2F                 1233 	.db #0x2F	; 47
   0238 40                 1234 	.db #0x40	; 64
   0239 19                 1235 	.db #0x19	; 25
   023A 00                 1236 	.db #0x00	; 0
   023B 76                 1237 	.db #0x76	; 118	'v'
   023C E1                 1238 	.db #0xE1	; 225
   023D 00                 1239 	.db #0x00	; 0
   023E 00                 1240 	.db #0x00	; 0
   023F 01                 1241 	.db #0x01	; 1
   0240 04                 1242 	.db #0x04	; 4
   0241 51                 1243 	.db #0x51	; 81	'Q'
   0242 04                 1244 	.db #0x04	; 4
   0243 37                 1245 	.db #0x37	; 55	'7'
   0244 04                 1246 	.db #0x04	; 4
   0245 4F                 1247 	.db #0x4F	; 79	'O'
   0246 04                 1248 	.db #0x04	; 4
   0247 37                 1249 	.db #0x37	; 55	'7'
   0248 02                 1250 	.db #0x02	; 2
   0249 4B                 1251 	.db #0x4B	; 75	'K'
   024A 02                 1252 	.db #0x02	; 2
   024B 37                 1253 	.db #0x37	; 55	'7'
   024C 04                 1254 	.db #0x04	; 4
   024D 4F                 1255 	.db #0x4F	; 79	'O'
   024E 04                 1256 	.db #0x04	; 4
   024F 37                 1257 	.db #0x37	; 55	'7'
   0250 04                 1258 	.db #0x04	; 4
   0251 4F                 1259 	.db #0x4F	; 79	'O'
   0252 04                 1260 	.db #0x04	; 4
   0253 37                 1261 	.db #0x37	; 55	'7'
   0254 02                 1262 	.db #0x02	; 2
   0255 4B                 1263 	.db #0x4B	; 75	'K'
   0256 00                 1264 	.db #0x00	; 0
   0257 42                 1265 	.db #0x42	; 66	'B'
   0258 60                 1266 	.db #0x60	; 96
   0259 00                 1267 	.db #0x00	; 0
   025A 42                 1268 	.db #0x42	; 66	'B'
   025B 80                 1269 	.db #0x80	; 128
   025C 00                 1270 	.db #0x00	; 0
   025D 00                 1271 	.db #0x00	; 0
   025E 42                 1272 	.db #0x42	; 66	'B'
   025F 00                 1273 	.db #0x00	; 0
   0260 00                 1274 	.db #0x00	; 0
