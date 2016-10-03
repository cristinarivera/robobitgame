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
   5244                      62 	.ds 90
   529E                      63 _mapa::
   529E                      64 	.ds 2
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
   52A0                     134 _dibujarMapa::
                            135 ;src/main.c:94: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   52A0 2A 9E 52      [16]  136 	ld	hl,(_mapa)
   52A3 E5            [11]  137 	push	hl
   52A4 21 00 C0      [10]  138 	ld	hl,#0xC000
   52A7 E5            [11]  139 	push	hl
   52A8 21 2C 28      [10]  140 	ld	hl,#0x282C
   52AB E5            [11]  141 	push	hl
   52AC 2E 00         [ 7]  142 	ld	l, #0x00
   52AE E5            [11]  143 	push	hl
   52AF AF            [ 4]  144 	xor	a, a
   52B0 F5            [11]  145 	push	af
   52B1 33            [ 6]  146 	inc	sp
   52B2 CD 3B 48      [17]  147 	call	_cpct_etm_drawTileBox2x4
   52B5 C9            [10]  148 	ret
                            149 ;src/main.c:99: void dibujarProta() {
                            150 ;	---------------------------------
                            151 ; Function dibujarProta
                            152 ; ---------------------------------
   52B6                     153 _dibujarProta::
                            154 ;src/main.c:100: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   52B6 21 3D 52      [10]  155 	ld	hl, #_prota + 1
   52B9 56            [ 7]  156 	ld	d,(hl)
   52BA 21 3C 52      [10]  157 	ld	hl, #_prota + 0
   52BD 46            [ 7]  158 	ld	b,(hl)
   52BE D5            [11]  159 	push	de
   52BF 33            [ 6]  160 	inc	sp
   52C0 C5            [11]  161 	push	bc
   52C1 33            [ 6]  162 	inc	sp
   52C2 21 00 C0      [10]  163 	ld	hl,#0xC000
   52C5 E5            [11]  164 	push	hl
   52C6 CD DF 51      [17]  165 	call	_cpct_getScreenPtr
   52C9 EB            [ 4]  166 	ex	de,hl
                            167 ;src/main.c:101: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   52CA ED 4B 40 52   [20]  168 	ld	bc, (#_prota + 4)
   52CE 21 00 3E      [10]  169 	ld	hl,#_g_tablatrans
   52D1 E5            [11]  170 	push	hl
   52D2 21 07 16      [10]  171 	ld	hl,#0x1607
   52D5 E5            [11]  172 	push	hl
   52D6 D5            [11]  173 	push	de
   52D7 C5            [11]  174 	push	bc
   52D8 CD FF 51      [17]  175 	call	_cpct_drawSpriteMaskedAlignedTable
   52DB C9            [10]  176 	ret
                            177 ;src/main.c:104: void borrarProta() {
                            178 ;	---------------------------------
                            179 ; Function borrarProta
                            180 ; ---------------------------------
   52DC                     181 _borrarProta::
   52DC DD E5         [15]  182 	push	ix
   52DE DD 21 00 00   [14]  183 	ld	ix,#0
   52E2 DD 39         [15]  184 	add	ix,sp
   52E4 3B            [ 6]  185 	dec	sp
                            186 ;src/main.c:106: u8 w = 4 + (prota.px & 1);
   52E5 21 3E 52      [10]  187 	ld	hl, #_prota + 2
   52E8 4E            [ 7]  188 	ld	c,(hl)
   52E9 79            [ 4]  189 	ld	a,c
   52EA E6 01         [ 7]  190 	and	a, #0x01
   52EC 47            [ 4]  191 	ld	b,a
   52ED 04            [ 4]  192 	inc	b
   52EE 04            [ 4]  193 	inc	b
   52EF 04            [ 4]  194 	inc	b
   52F0 04            [ 4]  195 	inc	b
                            196 ;src/main.c:109: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   52F1 21 3F 52      [10]  197 	ld	hl, #_prota + 3
   52F4 5E            [ 7]  198 	ld	e,(hl)
   52F5 CB 4B         [ 8]  199 	bit	1, e
   52F7 28 04         [12]  200 	jr	Z,00103$
   52F9 3E 01         [ 7]  201 	ld	a,#0x01
   52FB 18 02         [12]  202 	jr	00104$
   52FD                     203 00103$:
   52FD 3E 00         [ 7]  204 	ld	a,#0x00
   52FF                     205 00104$:
   52FF C6 06         [ 7]  206 	add	a, #0x06
   5301 DD 77 FF      [19]  207 	ld	-1 (ix),a
                            208 ;src/main.c:111: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   5304 FD 2A 9E 52   [20]  209 	ld	iy,(_mapa)
   5308 16 00         [ 7]  210 	ld	d,#0x00
   530A 63            [ 4]  211 	ld	h,e
   530B 6A            [ 4]  212 	ld	l,d
   530C CB 7A         [ 8]  213 	bit	7, d
   530E 28 05         [12]  214 	jr	Z,00105$
   5310 13            [ 6]  215 	inc	de
   5311 13            [ 6]  216 	inc	de
   5312 13            [ 6]  217 	inc	de
   5313 63            [ 4]  218 	ld	h,e
   5314 6A            [ 4]  219 	ld	l,d
   5315                     220 00105$:
   5315 5C            [ 4]  221 	ld	e, h
   5316 55            [ 4]  222 	ld	d, l
   5317 CB 2A         [ 8]  223 	sra	d
   5319 CB 1B         [ 8]  224 	rr	e
   531B CB 2A         [ 8]  225 	sra	d
   531D CB 1B         [ 8]  226 	rr	e
   531F 51            [ 4]  227 	ld	d,c
   5320 CB 3A         [ 8]  228 	srl	d
   5322 FD E5         [15]  229 	push	iy
   5324 21 00 C0      [10]  230 	ld	hl,#0xC000
   5327 E5            [11]  231 	push	hl
   5328 3E 28         [ 7]  232 	ld	a,#0x28
   532A F5            [11]  233 	push	af
   532B 33            [ 6]  234 	inc	sp
   532C DD 7E FF      [19]  235 	ld	a,-1 (ix)
   532F F5            [11]  236 	push	af
   5330 33            [ 6]  237 	inc	sp
   5331 C5            [11]  238 	push	bc
   5332 33            [ 6]  239 	inc	sp
   5333 7B            [ 4]  240 	ld	a,e
   5334 F5            [11]  241 	push	af
   5335 33            [ 6]  242 	inc	sp
   5336 D5            [11]  243 	push	de
   5337 33            [ 6]  244 	inc	sp
   5338 CD 3B 48      [17]  245 	call	_cpct_etm_drawTileBox2x4
   533B 33            [ 6]  246 	inc	sp
   533C DD E1         [14]  247 	pop	ix
   533E C9            [10]  248 	ret
                            249 ;src/main.c:114: void redibujarProta() {
                            250 ;	---------------------------------
                            251 ; Function redibujarProta
                            252 ; ---------------------------------
   533F                     253 _redibujarProta::
                            254 ;src/main.c:115: borrarProta();
   533F CD DC 52      [17]  255 	call	_borrarProta
                            256 ;src/main.c:116: prota.px = prota.x;
   5342 01 3E 52      [10]  257 	ld	bc,#_prota + 2
   5345 3A 3C 52      [13]  258 	ld	a, (#_prota + 0)
   5348 02            [ 7]  259 	ld	(bc),a
                            260 ;src/main.c:117: prota.py = prota.y;
   5349 01 3F 52      [10]  261 	ld	bc,#_prota + 3
   534C 3A 3D 52      [13]  262 	ld	a, (#_prota + 1)
   534F 02            [ 7]  263 	ld	(bc),a
                            264 ;src/main.c:118: dibujarProta();
   5350 C3 B6 52      [10]  265 	jp  _dibujarProta
                            266 ;src/main.c:121: u8* getTilePtr(u8 x, u8 y) {
                            267 ;	---------------------------------
                            268 ; Function getTilePtr
                            269 ; ---------------------------------
   5353                     270 _getTilePtr::
                            271 ;src/main.c:122: return mapa + (y-ORIGEN_MAPA_Y)/4*g_map1_W + x/2;
   5353 FD 21 03 00   [14]  272 	ld	iy,#3
   5357 FD 39         [15]  273 	add	iy,sp
   5359 FD 6E 00      [19]  274 	ld	l,0 (iy)
   535C 26 00         [ 7]  275 	ld	h,#0x00
   535E 4D            [ 4]  276 	ld	c,l
   535F 5C            [ 4]  277 	ld	e,h
   5360 CB 7C         [ 8]  278 	bit	7, h
   5362 28 05         [12]  279 	jr	Z,00103$
   5364 23            [ 6]  280 	inc	hl
   5365 23            [ 6]  281 	inc	hl
   5366 23            [ 6]  282 	inc	hl
   5367 4D            [ 4]  283 	ld	c,l
   5368 5C            [ 4]  284 	ld	e,h
   5369                     285 00103$:
   5369 43            [ 4]  286 	ld	b, e
   536A CB 28         [ 8]  287 	sra	b
   536C CB 19         [ 8]  288 	rr	c
   536E CB 28         [ 8]  289 	sra	b
   5370 CB 19         [ 8]  290 	rr	c
   5372 69            [ 4]  291 	ld	l, c
   5373 60            [ 4]  292 	ld	h, b
   5374 29            [11]  293 	add	hl, hl
   5375 29            [11]  294 	add	hl, hl
   5376 09            [11]  295 	add	hl, bc
   5377 29            [11]  296 	add	hl, hl
   5378 29            [11]  297 	add	hl, hl
   5379 29            [11]  298 	add	hl, hl
   537A ED 5B 9E 52   [20]  299 	ld	de,(_mapa)
   537E 19            [11]  300 	add	hl,de
   537F FD 21 02 00   [14]  301 	ld	iy,#2
   5383 FD 39         [15]  302 	add	iy,sp
   5385 FD 4E 00      [19]  303 	ld	c,0 (iy)
   5388 CB 39         [ 8]  304 	srl	c
   538A 59            [ 4]  305 	ld	e,c
   538B 16 00         [ 7]  306 	ld	d,#0x00
   538D 19            [11]  307 	add	hl,de
   538E C9            [10]  308 	ret
                            309 ;src/main.c:125: u8 checkCollision(int direction) { // check optimization
                            310 ;	---------------------------------
                            311 ; Function checkCollision
                            312 ; ---------------------------------
   538F                     313 _checkCollision::
   538F DD E5         [15]  314 	push	ix
   5391 DD 21 00 00   [14]  315 	ld	ix,#0
   5395 DD 39         [15]  316 	add	ix,sp
   5397 F5            [11]  317 	push	af
   5398 F5            [11]  318 	push	af
                            319 ;src/main.c:128: switch (direction) {
   5399 DD CB 05 7E   [20]  320 	bit	7, 5 (ix)
   539D C2 68 54      [10]  321 	jp	NZ,00105$
   53A0 3E 03         [ 7]  322 	ld	a,#0x03
   53A2 DD BE 04      [19]  323 	cp	a, 4 (ix)
   53A5 3E 00         [ 7]  324 	ld	a,#0x00
   53A7 DD 9E 05      [19]  325 	sbc	a, 5 (ix)
   53AA E2 AF 53      [10]  326 	jp	PO, 00123$
   53AD EE 80         [ 7]  327 	xor	a, #0x80
   53AF                     328 00123$:
   53AF FA 68 54      [10]  329 	jp	M,00105$
   53B2 DD 5E 04      [19]  330 	ld	e,4 (ix)
   53B5 16 00         [ 7]  331 	ld	d,#0x00
   53B7 21 BD 53      [10]  332 	ld	hl,#00124$
   53BA 19            [11]  333 	add	hl,de
   53BB 19            [11]  334 	add	hl,de
                            335 ;src/main.c:129: case 0:
   53BC E9            [ 4]  336 	jp	(hl)
   53BD                     337 00124$:
   53BD 18 06         [12]  338 	jr	00101$
   53BF 18 2F         [12]  339 	jr	00102$
   53C1 18 56         [12]  340 	jr	00103$
   53C3 18 79         [12]  341 	jr	00104$
   53C5                     342 00101$:
                            343 ;src/main.c:130: headTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   53C5 21 3D 52      [10]  344 	ld	hl, #(_prota + 0x0001) + 0
   53C8 46            [ 7]  345 	ld	b,(hl)
   53C9 3A 3C 52      [13]  346 	ld	a, (#_prota + 0)
   53CC C6 04         [ 7]  347 	add	a, #0x04
   53CE C5            [11]  348 	push	bc
   53CF 33            [ 6]  349 	inc	sp
   53D0 F5            [11]  350 	push	af
   53D1 33            [ 6]  351 	inc	sp
   53D2 CD 53 53      [17]  352 	call	_getTilePtr
   53D5 F1            [10]  353 	pop	af
   53D6 4D            [ 4]  354 	ld	c,l
   53D7 44            [ 4]  355 	ld	b,h
                            356 ;src/main.c:131: feetTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA);
   53D8 3A 3D 52      [13]  357 	ld	a, (#(_prota + 0x0001) + 0)
   53DB C6 16         [ 7]  358 	add	a, #0x16
   53DD 57            [ 4]  359 	ld	d,a
   53DE 3A 3C 52      [13]  360 	ld	a, (#_prota + 0)
   53E1 C6 04         [ 7]  361 	add	a, #0x04
   53E3 C5            [11]  362 	push	bc
   53E4 D5            [11]  363 	push	de
   53E5 33            [ 6]  364 	inc	sp
   53E6 F5            [11]  365 	push	af
   53E7 33            [ 6]  366 	inc	sp
   53E8 CD 53 53      [17]  367 	call	_getTilePtr
   53EB F1            [10]  368 	pop	af
   53EC EB            [ 4]  369 	ex	de,hl
   53ED C1            [10]  370 	pop	bc
                            371 ;src/main.c:132: break;
   53EE 18 78         [12]  372 	jr	00105$
                            373 ;src/main.c:133: case 1:
   53F0                     374 00102$:
                            375 ;src/main.c:134: headTile = getTilePtr(prota.x - 1, prota.y);
   53F0 21 3D 52      [10]  376 	ld	hl, #(_prota + 0x0001) + 0
   53F3 46            [ 7]  377 	ld	b,(hl)
   53F4 21 3C 52      [10]  378 	ld	hl, #_prota + 0
   53F7 56            [ 7]  379 	ld	d,(hl)
   53F8 15            [ 4]  380 	dec	d
   53F9 4A            [ 4]  381 	ld	c, d
   53FA C5            [11]  382 	push	bc
   53FB CD 53 53      [17]  383 	call	_getTilePtr
   53FE F1            [10]  384 	pop	af
   53FF 4D            [ 4]  385 	ld	c,l
   5400 44            [ 4]  386 	ld	b,h
                            387 ;src/main.c:135: feetTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA);
   5401 3A 3D 52      [13]  388 	ld	a, (#(_prota + 0x0001) + 0)
   5404 C6 16         [ 7]  389 	add	a, #0x16
   5406 57            [ 4]  390 	ld	d,a
   5407 3A 3C 52      [13]  391 	ld	a, (#_prota + 0)
   540A C6 FF         [ 7]  392 	add	a,#0xFF
   540C C5            [11]  393 	push	bc
   540D D5            [11]  394 	push	de
   540E 33            [ 6]  395 	inc	sp
   540F F5            [11]  396 	push	af
   5410 33            [ 6]  397 	inc	sp
   5411 CD 53 53      [17]  398 	call	_getTilePtr
   5414 F1            [10]  399 	pop	af
   5415 EB            [ 4]  400 	ex	de,hl
   5416 C1            [10]  401 	pop	bc
                            402 ;src/main.c:136: break;
   5417 18 4F         [12]  403 	jr	00105$
                            404 ;src/main.c:137: case 2:
   5419                     405 00103$:
                            406 ;src/main.c:138: headTile = getTilePtr(prota.x, prota.y - 1);
   5419 21 3D 52      [10]  407 	ld	hl, #(_prota + 0x0001) + 0
   541C 46            [ 7]  408 	ld	b,(hl)
   541D 05            [ 4]  409 	dec	b
   541E 21 3C 52      [10]  410 	ld	hl, #_prota + 0
   5421 4E            [ 7]  411 	ld	c, (hl)
   5422 C5            [11]  412 	push	bc
   5423 CD 53 53      [17]  413 	call	_getTilePtr
   5426 F1            [10]  414 	pop	af
   5427 4D            [ 4]  415 	ld	c,l
   5428 44            [ 4]  416 	ld	b,h
                            417 ;src/main.c:139: feetTile = getTilePtr(prota.x, prota.y - 1);
   5429 3A 3D 52      [13]  418 	ld	a, (#(_prota + 0x0001) + 0)
   542C 57            [ 4]  419 	ld	d,a
   542D 15            [ 4]  420 	dec	d
   542E 3A 3C 52      [13]  421 	ld	a, (#_prota + 0)
   5431 C5            [11]  422 	push	bc
   5432 D5            [11]  423 	push	de
   5433 33            [ 6]  424 	inc	sp
   5434 F5            [11]  425 	push	af
   5435 33            [ 6]  426 	inc	sp
   5436 CD 53 53      [17]  427 	call	_getTilePtr
   5439 F1            [10]  428 	pop	af
   543A EB            [ 4]  429 	ex	de,hl
   543B C1            [10]  430 	pop	bc
                            431 ;src/main.c:140: break;
   543C 18 2A         [12]  432 	jr	00105$
                            433 ;src/main.c:141: case 3:
   543E                     434 00104$:
                            435 ;src/main.c:142: headTile = getTilePtr(prota.x + 2, prota.y + ALTO_PROTA + 1);
   543E 3A 3D 52      [13]  436 	ld	a, (#(_prota + 0x0001) + 0)
   5441 C6 17         [ 7]  437 	add	a, #0x17
   5443 47            [ 4]  438 	ld	b,a
   5444 21 3C 52      [10]  439 	ld	hl, #_prota + 0
   5447 56            [ 7]  440 	ld	d,(hl)
   5448 14            [ 4]  441 	inc	d
   5449 14            [ 4]  442 	inc	d
   544A 4A            [ 4]  443 	ld	c, d
   544B C5            [11]  444 	push	bc
   544C CD 53 53      [17]  445 	call	_getTilePtr
   544F F1            [10]  446 	pop	af
   5450 4D            [ 4]  447 	ld	c,l
   5451 44            [ 4]  448 	ld	b,h
                            449 ;src/main.c:143: feetTile = getTilePtr(prota.x + 2, prota.y + ALTO_PROTA + 1);
   5452 3A 3D 52      [13]  450 	ld	a, (#(_prota + 0x0001) + 0)
   5455 C6 17         [ 7]  451 	add	a, #0x17
   5457 57            [ 4]  452 	ld	d,a
   5458 3A 3C 52      [13]  453 	ld	a, (#_prota + 0)
   545B C6 02         [ 7]  454 	add	a, #0x02
   545D C5            [11]  455 	push	bc
   545E D5            [11]  456 	push	de
   545F 33            [ 6]  457 	inc	sp
   5460 F5            [11]  458 	push	af
   5461 33            [ 6]  459 	inc	sp
   5462 CD 53 53      [17]  460 	call	_getTilePtr
   5465 F1            [10]  461 	pop	af
   5466 EB            [ 4]  462 	ex	de,hl
   5467 C1            [10]  463 	pop	bc
                            464 ;src/main.c:145: }
   5468                     465 00105$:
                            466 ;src/main.c:147: if (*headTile > 0 || *feetTile > 0)
   5468 0A            [ 7]  467 	ld	a,(bc)
   5469 B7            [ 4]  468 	or	a, a
   546A 20 04         [12]  469 	jr	NZ,00106$
   546C 1A            [ 7]  470 	ld	a,(de)
   546D B7            [ 4]  471 	or	a, a
   546E 28 04         [12]  472 	jr	Z,00107$
   5470                     473 00106$:
                            474 ;src/main.c:148: return 1;
   5470 2E 01         [ 7]  475 	ld	l,#0x01
   5472 18 02         [12]  476 	jr	00109$
   5474                     477 00107$:
                            478 ;src/main.c:150: return 0;
   5474 2E 00         [ 7]  479 	ld	l,#0x00
   5476                     480 00109$:
   5476 DD F9         [10]  481 	ld	sp, ix
   5478 DD E1         [14]  482 	pop	ix
   547A C9            [10]  483 	ret
                            484 ;src/main.c:153: void moverIzquierda() {
                            485 ;	---------------------------------
                            486 ; Function moverIzquierda
                            487 ; ---------------------------------
   547B                     488 _moverIzquierda::
                            489 ;src/main.c:155: prota.mira = M_izquierda;
   547B 01 3C 52      [10]  490 	ld	bc,#_prota+0
   547E 21 43 52      [10]  491 	ld	hl,#(_prota + 0x0007)
   5481 36 01         [10]  492 	ld	(hl),#0x01
                            493 ;src/main.c:157: if (!checkCollision(M_izquierda)) {
   5483 C5            [11]  494 	push	bc
   5484 21 01 00      [10]  495 	ld	hl,#0x0001
   5487 E5            [11]  496 	push	hl
   5488 CD 8F 53      [17]  497 	call	_checkCollision
   548B F1            [10]  498 	pop	af
   548C C1            [10]  499 	pop	bc
   548D 7D            [ 4]  500 	ld	a,l
   548E B7            [ 4]  501 	or	a, a
   548F C0            [11]  502 	ret	NZ
                            503 ;src/main.c:158: prota.x--;
   5490 0A            [ 7]  504 	ld	a,(bc)
   5491 C6 FF         [ 7]  505 	add	a,#0xFF
   5493 02            [ 7]  506 	ld	(bc),a
                            507 ;src/main.c:159: prota.mover = SI;
   5494 21 42 52      [10]  508 	ld	hl,#(_prota + 0x0006)
   5497 36 01         [10]  509 	ld	(hl),#0x01
   5499 C9            [10]  510 	ret
                            511 ;src/main.c:166: void moverDerecha() {
                            512 ;	---------------------------------
                            513 ; Function moverDerecha
                            514 ; ---------------------------------
   549A                     515 _moverDerecha::
                            516 ;src/main.c:167: prota.mira = M_derecha;
   549A 01 3C 52      [10]  517 	ld	bc,#_prota+0
   549D 21 43 52      [10]  518 	ld	hl,#(_prota + 0x0007)
   54A0 36 00         [10]  519 	ld	(hl),#0x00
                            520 ;src/main.c:169: if (!checkCollision(M_derecha)) {
   54A2 C5            [11]  521 	push	bc
   54A3 21 00 00      [10]  522 	ld	hl,#0x0000
   54A6 E5            [11]  523 	push	hl
   54A7 CD 8F 53      [17]  524 	call	_checkCollision
   54AA F1            [10]  525 	pop	af
   54AB C1            [10]  526 	pop	bc
   54AC 7D            [ 4]  527 	ld	a,l
   54AD B7            [ 4]  528 	or	a, a
   54AE C0            [11]  529 	ret	NZ
                            530 ;src/main.c:170: prota.x++;
   54AF 0A            [ 7]  531 	ld	a,(bc)
   54B0 3C            [ 4]  532 	inc	a
   54B1 02            [ 7]  533 	ld	(bc),a
                            534 ;src/main.c:171: prota.mover = SI;
   54B2 21 42 52      [10]  535 	ld	hl,#(_prota + 0x0006)
   54B5 36 01         [10]  536 	ld	(hl),#0x01
   54B7 C9            [10]  537 	ret
                            538 ;src/main.c:177: void moverArriba() {
                            539 ;	---------------------------------
                            540 ; Function moverArriba
                            541 ; ---------------------------------
   54B8                     542 _moverArriba::
                            543 ;src/main.c:178: prota.mira = M_arriba;
   54B8 21 43 52      [10]  544 	ld	hl,#(_prota + 0x0007)
   54BB 36 02         [10]  545 	ld	(hl),#0x02
                            546 ;src/main.c:180: if (!checkCollision(M_arriba)) {
   54BD 21 02 00      [10]  547 	ld	hl,#0x0002
   54C0 E5            [11]  548 	push	hl
   54C1 CD 8F 53      [17]  549 	call	_checkCollision
   54C4 F1            [10]  550 	pop	af
   54C5 7D            [ 4]  551 	ld	a,l
   54C6 B7            [ 4]  552 	or	a, a
   54C7 C0            [11]  553 	ret	NZ
                            554 ;src/main.c:181: prota.y--;
   54C8 21 3D 52      [10]  555 	ld	hl,#_prota + 1
   54CB 4E            [ 7]  556 	ld	c,(hl)
   54CC 0D            [ 4]  557 	dec	c
   54CD 71            [ 7]  558 	ld	(hl),c
                            559 ;src/main.c:182: prota.mover  = SI;
   54CE 21 42 52      [10]  560 	ld	hl,#(_prota + 0x0006)
   54D1 36 01         [10]  561 	ld	(hl),#0x01
   54D3 C9            [10]  562 	ret
                            563 ;src/main.c:187: void moverAbajo() {
                            564 ;	---------------------------------
                            565 ; Function moverAbajo
                            566 ; ---------------------------------
   54D4                     567 _moverAbajo::
                            568 ;src/main.c:188: prota.mira = M_abajo;
   54D4 21 43 52      [10]  569 	ld	hl,#(_prota + 0x0007)
   54D7 36 03         [10]  570 	ld	(hl),#0x03
                            571 ;src/main.c:190: if (!checkCollision(M_abajo)) {
   54D9 21 03 00      [10]  572 	ld	hl,#0x0003
   54DC E5            [11]  573 	push	hl
   54DD CD 8F 53      [17]  574 	call	_checkCollision
   54E0 F1            [10]  575 	pop	af
   54E1 7D            [ 4]  576 	ld	a,l
   54E2 B7            [ 4]  577 	or	a, a
   54E3 C0            [11]  578 	ret	NZ
                            579 ;src/main.c:191: prota.y++;
   54E4 01 3D 52      [10]  580 	ld	bc,#_prota + 1
   54E7 0A            [ 7]  581 	ld	a,(bc)
   54E8 3C            [ 4]  582 	inc	a
   54E9 02            [ 7]  583 	ld	(bc),a
                            584 ;src/main.c:192: prota.mover  = SI;
   54EA 21 42 52      [10]  585 	ld	hl,#(_prota + 0x0006)
   54ED 36 01         [10]  586 	ld	(hl),#0x01
   54EF C9            [10]  587 	ret
                            588 ;src/main.c:197: void dibujarCuchillo(TKnife* actual) {
                            589 ;	---------------------------------
                            590 ; Function dibujarCuchillo
                            591 ; ---------------------------------
   54F0                     592 _dibujarCuchillo::
   54F0 DD E5         [15]  593 	push	ix
   54F2 DD 21 00 00   [14]  594 	ld	ix,#0
   54F6 DD 39         [15]  595 	add	ix,sp
   54F8 F5            [11]  596 	push	af
   54F9 F5            [11]  597 	push	af
                            598 ;src/main.c:198: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, actual->x, actual->y);
   54FA DD 5E 04      [19]  599 	ld	e,4 (ix)
   54FD DD 56 05      [19]  600 	ld	d,5 (ix)
   5500 6B            [ 4]  601 	ld	l, e
   5501 62            [ 4]  602 	ld	h, d
   5502 23            [ 6]  603 	inc	hl
   5503 46            [ 7]  604 	ld	b,(hl)
   5504 1A            [ 7]  605 	ld	a,(de)
   5505 D5            [11]  606 	push	de
   5506 C5            [11]  607 	push	bc
   5507 33            [ 6]  608 	inc	sp
   5508 F5            [11]  609 	push	af
   5509 33            [ 6]  610 	inc	sp
   550A 21 00 C0      [10]  611 	ld	hl,#0xC000
   550D E5            [11]  612 	push	hl
   550E CD DF 51      [17]  613 	call	_cpct_getScreenPtr
   5511 D1            [10]  614 	pop	de
   5512 E5            [11]  615 	push	hl
   5513 FD E1         [14]  616 	pop	iy
                            617 ;src/main.c:199: if(actual->eje == E_X){
   5515 6B            [ 4]  618 	ld	l, e
   5516 62            [ 4]  619 	ld	h, d
   5517 01 08 00      [10]  620 	ld	bc, #0x0008
   551A 09            [11]  621 	add	hl, bc
   551B 4E            [ 7]  622 	ld	c,(hl)
                            623 ;src/main.c:200: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   551C FD E5         [15]  624 	push	iy
   551E F1            [10]  625 	pop	af
   551F DD 77 FF      [19]  626 	ld	-1 (ix),a
   5522 FD E5         [15]  627 	push	iy
   5524 3B            [ 6]  628 	dec	sp
   5525 F1            [10]  629 	pop	af
   5526 33            [ 6]  630 	inc	sp
   5527 DD 77 FE      [19]  631 	ld	-2 (ix),a
   552A 21 04 00      [10]  632 	ld	hl,#0x0004
   552D 19            [11]  633 	add	hl,de
   552E E3            [19]  634 	ex	(sp), hl
                            635 ;src/main.c:199: if(actual->eje == E_X){
   552F 79            [ 4]  636 	ld	a,c
   5530 B7            [ 4]  637 	or	a, a
   5531 20 1A         [12]  638 	jr	NZ,00104$
                            639 ;src/main.c:200: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   5533 11 00 3E      [10]  640 	ld	de,#_g_tablatrans+0
   5536 E1            [10]  641 	pop	hl
   5537 E5            [11]  642 	push	hl
   5538 4E            [ 7]  643 	ld	c,(hl)
   5539 23            [ 6]  644 	inc	hl
   553A 46            [ 7]  645 	ld	b,(hl)
   553B D5            [11]  646 	push	de
   553C 21 03 03      [10]  647 	ld	hl,#0x0303
   553F E5            [11]  648 	push	hl
   5540 DD 6E FE      [19]  649 	ld	l,-2 (ix)
   5543 DD 66 FF      [19]  650 	ld	h,-1 (ix)
   5546 E5            [11]  651 	push	hl
   5547 C5            [11]  652 	push	bc
   5548 CD FF 51      [17]  653 	call	_cpct_drawSpriteMaskedAlignedTable
   554B 18 1B         [12]  654 	jr	00106$
   554D                     655 00104$:
                            656 ;src/main.c:203: else if(actual->eje == E_Y){
   554D 0D            [ 4]  657 	dec	c
   554E 20 18         [12]  658 	jr	NZ,00106$
                            659 ;src/main.c:204: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   5550 11 00 3E      [10]  660 	ld	de,#_g_tablatrans+0
   5553 E1            [10]  661 	pop	hl
   5554 E5            [11]  662 	push	hl
   5555 4E            [ 7]  663 	ld	c,(hl)
   5556 23            [ 6]  664 	inc	hl
   5557 46            [ 7]  665 	ld	b,(hl)
   5558 D5            [11]  666 	push	de
   5559 21 02 06      [10]  667 	ld	hl,#0x0602
   555C E5            [11]  668 	push	hl
   555D DD 6E FE      [19]  669 	ld	l,-2 (ix)
   5560 DD 66 FF      [19]  670 	ld	h,-1 (ix)
   5563 E5            [11]  671 	push	hl
   5564 C5            [11]  672 	push	bc
   5565 CD FF 51      [17]  673 	call	_cpct_drawSpriteMaskedAlignedTable
   5568                     674 00106$:
   5568 DD F9         [10]  675 	ld	sp, ix
   556A DD E1         [14]  676 	pop	ix
   556C C9            [10]  677 	ret
                            678 ;src/main.c:208: void borrarCuchillo(TKnife* actual) {
                            679 ;	---------------------------------
                            680 ; Function borrarCuchillo
                            681 ; ---------------------------------
   556D                     682 _borrarCuchillo::
   556D DD E5         [15]  683 	push	ix
   556F DD 21 00 00   [14]  684 	ld	ix,#0
   5573 DD 39         [15]  685 	add	ix,sp
   5575 3B            [ 6]  686 	dec	sp
                            687 ;src/main.c:209: u8 w = 2 + (actual->px & 1);
   5576 DD 5E 04      [19]  688 	ld	e,4 (ix)
   5579 DD 56 05      [19]  689 	ld	d,5 (ix)
   557C 6B            [ 4]  690 	ld	l, e
   557D 62            [ 4]  691 	ld	h, d
   557E 23            [ 6]  692 	inc	hl
   557F 23            [ 6]  693 	inc	hl
   5580 4E            [ 7]  694 	ld	c,(hl)
   5581 79            [ 4]  695 	ld	a,c
   5582 E6 01         [ 7]  696 	and	a, #0x01
   5584 47            [ 4]  697 	ld	b,a
   5585 04            [ 4]  698 	inc	b
   5586 04            [ 4]  699 	inc	b
                            700 ;src/main.c:210: u8 h = 2 + (actual->py & 3 ? 1 : 0);
   5587 EB            [ 4]  701 	ex	de,hl
   5588 23            [ 6]  702 	inc	hl
   5589 23            [ 6]  703 	inc	hl
   558A 23            [ 6]  704 	inc	hl
   558B 5E            [ 7]  705 	ld	e,(hl)
   558C 7B            [ 4]  706 	ld	a,e
   558D E6 03         [ 7]  707 	and	a, #0x03
   558F 28 04         [12]  708 	jr	Z,00103$
   5591 3E 01         [ 7]  709 	ld	a,#0x01
   5593 18 02         [12]  710 	jr	00104$
   5595                     711 00103$:
   5595 3E 00         [ 7]  712 	ld	a,#0x00
   5597                     713 00104$:
   5597 C6 02         [ 7]  714 	add	a, #0x02
   5599 DD 77 FF      [19]  715 	ld	-1 (ix),a
                            716 ;src/main.c:211: cpct_etm_drawTileBox2x4 (actual->px / 2, (actual->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   559C FD 2A 9E 52   [20]  717 	ld	iy,(_mapa)
   55A0 16 00         [ 7]  718 	ld	d,#0x00
   55A2 63            [ 4]  719 	ld	h,e
   55A3 6A            [ 4]  720 	ld	l,d
   55A4 CB 7A         [ 8]  721 	bit	7, d
   55A6 28 05         [12]  722 	jr	Z,00105$
   55A8 13            [ 6]  723 	inc	de
   55A9 13            [ 6]  724 	inc	de
   55AA 13            [ 6]  725 	inc	de
   55AB 63            [ 4]  726 	ld	h,e
   55AC 6A            [ 4]  727 	ld	l,d
   55AD                     728 00105$:
   55AD 5C            [ 4]  729 	ld	e, h
   55AE 55            [ 4]  730 	ld	d, l
   55AF CB 2A         [ 8]  731 	sra	d
   55B1 CB 1B         [ 8]  732 	rr	e
   55B3 CB 2A         [ 8]  733 	sra	d
   55B5 CB 1B         [ 8]  734 	rr	e
   55B7 51            [ 4]  735 	ld	d,c
   55B8 CB 3A         [ 8]  736 	srl	d
   55BA FD E5         [15]  737 	push	iy
   55BC 21 00 C0      [10]  738 	ld	hl,#0xC000
   55BF E5            [11]  739 	push	hl
   55C0 3E 28         [ 7]  740 	ld	a,#0x28
   55C2 F5            [11]  741 	push	af
   55C3 33            [ 6]  742 	inc	sp
   55C4 DD 7E FF      [19]  743 	ld	a,-1 (ix)
   55C7 F5            [11]  744 	push	af
   55C8 33            [ 6]  745 	inc	sp
   55C9 C5            [11]  746 	push	bc
   55CA 33            [ 6]  747 	inc	sp
   55CB 7B            [ 4]  748 	ld	a,e
   55CC F5            [11]  749 	push	af
   55CD 33            [ 6]  750 	inc	sp
   55CE D5            [11]  751 	push	de
   55CF 33            [ 6]  752 	inc	sp
   55D0 CD 3B 48      [17]  753 	call	_cpct_etm_drawTileBox2x4
   55D3 33            [ 6]  754 	inc	sp
   55D4 DD E1         [14]  755 	pop	ix
   55D6 C9            [10]  756 	ret
                            757 ;src/main.c:214: void redibujarCuchillo(TKnife* actual) {
                            758 ;	---------------------------------
                            759 ; Function redibujarCuchillo
                            760 ; ---------------------------------
   55D7                     761 _redibujarCuchillo::
   55D7 DD E5         [15]  762 	push	ix
   55D9 DD 21 00 00   [14]  763 	ld	ix,#0
   55DD DD 39         [15]  764 	add	ix,sp
                            765 ;src/main.c:215: borrarCuchillo(actual);
   55DF DD 6E 04      [19]  766 	ld	l,4 (ix)
   55E2 DD 66 05      [19]  767 	ld	h,5 (ix)
   55E5 E5            [11]  768 	push	hl
   55E6 CD 6D 55      [17]  769 	call	_borrarCuchillo
   55E9 F1            [10]  770 	pop	af
                            771 ;src/main.c:216: actual->px = actual->x;
   55EA DD 4E 04      [19]  772 	ld	c,4 (ix)
   55ED DD 46 05      [19]  773 	ld	b,5 (ix)
   55F0 59            [ 4]  774 	ld	e, c
   55F1 50            [ 4]  775 	ld	d, b
   55F2 13            [ 6]  776 	inc	de
   55F3 13            [ 6]  777 	inc	de
   55F4 0A            [ 7]  778 	ld	a,(bc)
   55F5 12            [ 7]  779 	ld	(de),a
                            780 ;src/main.c:217: actual->py = actual->y;
   55F6 59            [ 4]  781 	ld	e, c
   55F7 50            [ 4]  782 	ld	d, b
   55F8 13            [ 6]  783 	inc	de
   55F9 13            [ 6]  784 	inc	de
   55FA 13            [ 6]  785 	inc	de
   55FB 69            [ 4]  786 	ld	l, c
   55FC 60            [ 4]  787 	ld	h, b
   55FD 23            [ 6]  788 	inc	hl
   55FE 7E            [ 7]  789 	ld	a,(hl)
   55FF 12            [ 7]  790 	ld	(de),a
                            791 ;src/main.c:218: dibujarCuchillo(actual);
   5600 C5            [11]  792 	push	bc
   5601 CD F0 54      [17]  793 	call	_dibujarCuchillo
   5604 F1            [10]  794 	pop	af
   5605 DD E1         [14]  795 	pop	ix
   5607 C9            [10]  796 	ret
                            797 ;src/main.c:222: void lanzarCuchillo(){
                            798 ;	---------------------------------
                            799 ; Function lanzarCuchillo
                            800 ; ---------------------------------
   5608                     801 _lanzarCuchillo::
   5608 DD E5         [15]  802 	push	ix
   560A DD 21 00 00   [14]  803 	ld	ix,#0
   560E DD 39         [15]  804 	add	ix,sp
   5610 21 FA FF      [10]  805 	ld	hl,#-6
   5613 39            [11]  806 	add	hl,sp
   5614 F9            [ 6]  807 	ld	sp,hl
                            808 ;src/main.c:224: TKnife* actual = cu;
   5615 01 44 52      [10]  809 	ld	bc,#_cu+0
                            810 ;src/main.c:227: while(i>0 && actual->lanzado){
   5618 1E 0A         [ 7]  811 	ld	e,#0x0A
   561A                     812 00102$:
   561A 21 06 00      [10]  813 	ld	hl,#0x0006
   561D 09            [11]  814 	add	hl,bc
   561E DD 75 FE      [19]  815 	ld	-2 (ix),l
   5621 DD 74 FF      [19]  816 	ld	-1 (ix),h
   5624 7B            [ 4]  817 	ld	a,e
   5625 B7            [ 4]  818 	or	a, a
   5626 28 13         [12]  819 	jr	Z,00104$
   5628 DD 6E FE      [19]  820 	ld	l,-2 (ix)
   562B DD 66 FF      [19]  821 	ld	h,-1 (ix)
   562E 7E            [ 7]  822 	ld	a,(hl)
   562F B7            [ 4]  823 	or	a, a
   5630 28 09         [12]  824 	jr	Z,00104$
                            825 ;src/main.c:228: --i;
   5632 1D            [ 4]  826 	dec	e
                            827 ;src/main.c:229: actual++;
   5633 21 09 00      [10]  828 	ld	hl,#0x0009
   5636 09            [11]  829 	add	hl,bc
   5637 4D            [ 4]  830 	ld	c,l
   5638 44            [ 4]  831 	ld	b,h
   5639 18 DF         [12]  832 	jr	00102$
   563B                     833 00104$:
                            834 ;src/main.c:232: if(i>0 && !actual->lanzado){
   563B 7B            [ 4]  835 	ld	a,e
   563C B7            [ 4]  836 	or	a, a
   563D CA AA 57      [10]  837 	jp	Z,00127$
   5640 DD 6E FE      [19]  838 	ld	l,-2 (ix)
   5643 DD 66 FF      [19]  839 	ld	h,-1 (ix)
   5646 7E            [ 7]  840 	ld	a,(hl)
   5647 B7            [ 4]  841 	or	a, a
   5648 C2 AA 57      [10]  842 	jp	NZ,00127$
                            843 ;src/main.c:234: if(prota.mira == M_derecha){
   564B 21 43 52      [10]  844 	ld	hl, #_prota + 7
   564E 6E            [ 7]  845 	ld	l,(hl)
                            846 ;src/main.c:237: actual->direccion = M_derecha;
   564F FD 21 07 00   [14]  847 	ld	iy,#0x0007
   5653 FD 09         [15]  848 	add	iy, bc
                            849 ;src/main.c:239: actual->y=prota.y + G_HERO_H /2;	
   5655 59            [ 4]  850 	ld	e, c
   5656 50            [ 4]  851 	ld	d, b
   5657 13            [ 6]  852 	inc	de
                            853 ;src/main.c:240: actual->sprite=g_knifeX_0;
   5658 79            [ 4]  854 	ld	a,c
   5659 C6 04         [ 7]  855 	add	a, #0x04
   565B DD 77 FC      [19]  856 	ld	-4 (ix),a
   565E 78            [ 4]  857 	ld	a,b
   565F CE 00         [ 7]  858 	adc	a, #0x00
   5661 DD 77 FD      [19]  859 	ld	-3 (ix),a
                            860 ;src/main.c:241: actual->eje = E_X;
   5664 79            [ 4]  861 	ld	a,c
   5665 C6 08         [ 7]  862 	add	a, #0x08
   5667 DD 77 FA      [19]  863 	ld	-6 (ix),a
   566A 78            [ 4]  864 	ld	a,b
   566B CE 00         [ 7]  865 	adc	a, #0x00
   566D DD 77 FB      [19]  866 	ld	-5 (ix),a
                            867 ;src/main.c:234: if(prota.mira == M_derecha){
   5670 7D            [ 4]  868 	ld	a,l
   5671 B7            [ 4]  869 	or	a, a
   5672 20 4F         [12]  870 	jr	NZ,00122$
                            871 ;src/main.c:235: if( (LIMITE_DERECHO - (prota.x + G_HERO_W) ) >= G_KNIFEX_0_W + 1){
   5674 21 3C 52      [10]  872 	ld	hl, #_prota + 0
   5677 6E            [ 7]  873 	ld	l,(hl)
   5678 26 00         [ 7]  874 	ld	h,#0x00
   567A D5            [11]  875 	push	de
   567B 11 07 00      [10]  876 	ld	de,#0x0007
   567E 19            [11]  877 	add	hl, de
   567F D1            [10]  878 	pop	de
   5680 3E 4C         [ 7]  879 	ld	a,#0x4C
   5682 95            [ 4]  880 	sub	a, l
   5683 6F            [ 4]  881 	ld	l,a
   5684 3E 00         [ 7]  882 	ld	a,#0x00
   5686 9C            [ 4]  883 	sbc	a, h
   5687 67            [ 4]  884 	ld	h,a
   5688 7D            [ 4]  885 	ld	a,l
   5689 D6 04         [ 7]  886 	sub	a, #0x04
   568B 7C            [ 4]  887 	ld	a,h
   568C 17            [ 4]  888 	rla
   568D 3F            [ 4]  889 	ccf
   568E 1F            [ 4]  890 	rra
   568F DE 80         [ 7]  891 	sbc	a, #0x80
   5691 DA AA 57      [10]  892 	jp	C,00127$
                            893 ;src/main.c:236: actual->lanzado = SI;
   5694 DD 6E FE      [19]  894 	ld	l,-2 (ix)
   5697 DD 66 FF      [19]  895 	ld	h,-1 (ix)
   569A 36 01         [10]  896 	ld	(hl),#0x01
                            897 ;src/main.c:237: actual->direccion = M_derecha;
   569C FD 36 00 00   [19]  898 	ld	0 (iy), #0x00
                            899 ;src/main.c:238: actual->x=prota.x + G_HERO_W;
   56A0 3A 3C 52      [13]  900 	ld	a, (#_prota + 0)
   56A3 C6 07         [ 7]  901 	add	a, #0x07
   56A5 02            [ 7]  902 	ld	(bc),a
                            903 ;src/main.c:239: actual->y=prota.y + G_HERO_H /2;	
   56A6 3A 3D 52      [13]  904 	ld	a, (#(_prota + 0x0001) + 0)
   56A9 C6 0B         [ 7]  905 	add	a, #0x0B
   56AB 12            [ 7]  906 	ld	(de),a
                            907 ;src/main.c:240: actual->sprite=g_knifeX_0;
   56AC DD 6E FC      [19]  908 	ld	l,-4 (ix)
   56AF DD 66 FD      [19]  909 	ld	h,-3 (ix)
   56B2 36 F8         [10]  910 	ld	(hl),#<(_g_knifeX_0)
   56B4 23            [ 6]  911 	inc	hl
   56B5 36 46         [10]  912 	ld	(hl),#>(_g_knifeX_0)
                            913 ;src/main.c:241: actual->eje = E_X;
   56B7 E1            [10]  914 	pop	hl
   56B8 E5            [11]  915 	push	hl
   56B9 36 00         [10]  916 	ld	(hl),#0x00
                            917 ;src/main.c:242: dibujarCuchillo(actual);
   56BB C5            [11]  918 	push	bc
   56BC CD F0 54      [17]  919 	call	_dibujarCuchillo
   56BF F1            [10]  920 	pop	af
   56C0 C3 AA 57      [10]  921 	jp	00127$
   56C3                     922 00122$:
                            923 ;src/main.c:245: else if(prota.mira == M_izquierda){
   56C3 7D            [ 4]  924 	ld	a,l
   56C4 3D            [ 4]  925 	dec	a
   56C5 20 49         [12]  926 	jr	NZ,00119$
                            927 ;src/main.c:246: if( (prota.x - 4 ) >= G_KNIFEX_1_W + 1){
   56C7 21 3C 52      [10]  928 	ld	hl, #_prota + 0
   56CA 6E            [ 7]  929 	ld	l,(hl)
   56CB 26 00         [ 7]  930 	ld	h,#0x00
   56CD 7D            [ 4]  931 	ld	a,l
   56CE C6 FC         [ 7]  932 	add	a,#0xFC
   56D0 6F            [ 4]  933 	ld	l,a
   56D1 7C            [ 4]  934 	ld	a,h
   56D2 CE FF         [ 7]  935 	adc	a,#0xFF
   56D4 67            [ 4]  936 	ld	h,a
   56D5 7D            [ 4]  937 	ld	a,l
   56D6 D6 04         [ 7]  938 	sub	a, #0x04
   56D8 7C            [ 4]  939 	ld	a,h
   56D9 17            [ 4]  940 	rla
   56DA 3F            [ 4]  941 	ccf
   56DB 1F            [ 4]  942 	rra
   56DC DE 80         [ 7]  943 	sbc	a, #0x80
   56DE DA AA 57      [10]  944 	jp	C,00127$
                            945 ;src/main.c:247: actual->lanzado = SI;
   56E1 DD 6E FE      [19]  946 	ld	l,-2 (ix)
   56E4 DD 66 FF      [19]  947 	ld	h,-1 (ix)
   56E7 36 01         [10]  948 	ld	(hl),#0x01
                            949 ;src/main.c:248: actual->direccion = M_izquierda;
   56E9 FD 36 00 01   [19]  950 	ld	0 (iy), #0x01
                            951 ;src/main.c:249: actual->x = prota.x - G_KNIFEX_0_W;
   56ED 3A 3C 52      [13]  952 	ld	a, (#_prota + 0)
   56F0 C6 FD         [ 7]  953 	add	a,#0xFD
   56F2 02            [ 7]  954 	ld	(bc),a
                            955 ;src/main.c:250: actual->y = prota.y + G_HERO_H /2;	
   56F3 3A 3D 52      [13]  956 	ld	a, (#(_prota + 0x0001) + 0)
   56F6 C6 0B         [ 7]  957 	add	a, #0x0B
   56F8 12            [ 7]  958 	ld	(de),a
                            959 ;src/main.c:251: actual->sprite = g_knifeX_1;
   56F9 DD 6E FC      [19]  960 	ld	l,-4 (ix)
   56FC DD 66 FD      [19]  961 	ld	h,-3 (ix)
   56FF 36 01         [10]  962 	ld	(hl),#<(_g_knifeX_1)
   5701 23            [ 6]  963 	inc	hl
   5702 36 47         [10]  964 	ld	(hl),#>(_g_knifeX_1)
                            965 ;src/main.c:252: actual->eje = E_X;
   5704 E1            [10]  966 	pop	hl
   5705 E5            [11]  967 	push	hl
   5706 36 00         [10]  968 	ld	(hl),#0x00
                            969 ;src/main.c:253: dibujarCuchillo(actual);
   5708 C5            [11]  970 	push	bc
   5709 CD F0 54      [17]  971 	call	_dibujarCuchillo
   570C F1            [10]  972 	pop	af
   570D C3 AA 57      [10]  973 	jp	00127$
   5710                     974 00119$:
                            975 ;src/main.c:256: else if(prota.mira == M_abajo){
   5710 7D            [ 4]  976 	ld	a,l
   5711 D6 03         [ 7]  977 	sub	a, #0x03
   5713 20 4D         [12]  978 	jr	NZ,00116$
                            979 ;src/main.c:258: if((valor - (prota.y + G_HERO_H)) >= G_KNIFEY_0_H + 1){
   5715 21 3D 52      [10]  980 	ld	hl, #(_prota + 0x0001) + 0
   5718 6E            [ 7]  981 	ld	l,(hl)
   5719 26 00         [ 7]  982 	ld	h,#0x00
   571B D5            [11]  983 	push	de
   571C 11 16 00      [10]  984 	ld	de,#0x0016
   571F 19            [11]  985 	add	hl, de
   5720 D1            [10]  986 	pop	de
   5721 3E A8         [ 7]  987 	ld	a,#0xA8
   5723 95            [ 4]  988 	sub	a, l
   5724 6F            [ 4]  989 	ld	l,a
   5725 3E 00         [ 7]  990 	ld	a,#0x00
   5727 9C            [ 4]  991 	sbc	a, h
   5728 67            [ 4]  992 	ld	h,a
   5729 7D            [ 4]  993 	ld	a,l
   572A D6 07         [ 7]  994 	sub	a, #0x07
   572C 7C            [ 4]  995 	ld	a,h
   572D 17            [ 4]  996 	rla
   572E 3F            [ 4]  997 	ccf
   572F 1F            [ 4]  998 	rra
   5730 DE 80         [ 7]  999 	sbc	a, #0x80
   5732 38 76         [12] 1000 	jr	C,00127$
                           1001 ;src/main.c:259: actual->lanzado = SI;
   5734 DD 6E FE      [19] 1002 	ld	l,-2 (ix)
   5737 DD 66 FF      [19] 1003 	ld	h,-1 (ix)
   573A 36 01         [10] 1004 	ld	(hl),#0x01
                           1005 ;src/main.c:260: actual->direccion = M_abajo;
   573C FD 36 00 03   [19] 1006 	ld	0 (iy), #0x03
                           1007 ;src/main.c:261: actual->x = prota.x + G_HERO_W / 2;
   5740 3A 3C 52      [13] 1008 	ld	a, (#_prota + 0)
   5743 C6 03         [ 7] 1009 	add	a, #0x03
   5745 02            [ 7] 1010 	ld	(bc),a
                           1011 ;src/main.c:262: actual->y = prota.y + G_HERO_H;	
   5746 3A 3D 52      [13] 1012 	ld	a, (#(_prota + 0x0001) + 0)
   5749 C6 16         [ 7] 1013 	add	a, #0x16
   574B 12            [ 7] 1014 	ld	(de),a
                           1015 ;src/main.c:263: actual->sprite = g_knifeY_0;
   574C DD 6E FC      [19] 1016 	ld	l,-4 (ix)
   574F DD 66 FD      [19] 1017 	ld	h,-3 (ix)
   5752 36 E0         [10] 1018 	ld	(hl),#<(_g_knifeY_0)
   5754 23            [ 6] 1019 	inc	hl
   5755 36 46         [10] 1020 	ld	(hl),#>(_g_knifeY_0)
                           1021 ;src/main.c:264: actual->eje = E_Y;
   5757 E1            [10] 1022 	pop	hl
   5758 E5            [11] 1023 	push	hl
   5759 36 01         [10] 1024 	ld	(hl),#0x01
                           1025 ;src/main.c:265: dibujarCuchillo(actual);
   575B C5            [11] 1026 	push	bc
   575C CD F0 54      [17] 1027 	call	_dibujarCuchillo
   575F F1            [10] 1028 	pop	af
   5760 18 48         [12] 1029 	jr	00127$
   5762                    1030 00116$:
                           1031 ;src/main.c:268: else if(prota.mira == M_arriba){
   5762 7D            [ 4] 1032 	ld	a,l
   5763 D6 02         [ 7] 1033 	sub	a, #0x02
   5765 20 43         [12] 1034 	jr	NZ,00127$
                           1035 ;src/main.c:269: if((prota.y - 8)>= G_KNIFEY_0_H +1 ){
   5767 21 3D 52      [10] 1036 	ld	hl, #(_prota + 0x0001) + 0
   576A 6E            [ 7] 1037 	ld	l,(hl)
   576B 26 00         [ 7] 1038 	ld	h,#0x00
   576D 7D            [ 4] 1039 	ld	a,l
   576E C6 F8         [ 7] 1040 	add	a,#0xF8
   5770 6F            [ 4] 1041 	ld	l,a
   5771 7C            [ 4] 1042 	ld	a,h
   5772 CE FF         [ 7] 1043 	adc	a,#0xFF
   5774 67            [ 4] 1044 	ld	h,a
   5775 7D            [ 4] 1045 	ld	a,l
   5776 D6 07         [ 7] 1046 	sub	a, #0x07
   5778 7C            [ 4] 1047 	ld	a,h
   5779 17            [ 4] 1048 	rla
   577A 3F            [ 4] 1049 	ccf
   577B 1F            [ 4] 1050 	rra
   577C DE 80         [ 7] 1051 	sbc	a, #0x80
   577E 38 2A         [12] 1052 	jr	C,00127$
                           1053 ;src/main.c:270: actual->lanzado = SI;
   5780 DD 6E FE      [19] 1054 	ld	l,-2 (ix)
   5783 DD 66 FF      [19] 1055 	ld	h,-1 (ix)
   5786 36 01         [10] 1056 	ld	(hl),#0x01
                           1057 ;src/main.c:271: actual->direccion = M_arriba;
   5788 FD 36 00 02   [19] 1058 	ld	0 (iy), #0x02
                           1059 ;src/main.c:272: actual->x = prota.x + G_HERO_W / 2;
   578C 3A 3C 52      [13] 1060 	ld	a, (#_prota + 0)
   578F C6 03         [ 7] 1061 	add	a, #0x03
   5791 02            [ 7] 1062 	ld	(bc),a
                           1063 ;src/main.c:273: actual->y = prota.y;	
   5792 3A 3D 52      [13] 1064 	ld	a, (#(_prota + 0x0001) + 0)
   5795 12            [ 7] 1065 	ld	(de),a
                           1066 ;src/main.c:274: actual->sprite = g_knifeY_1;
   5796 DD 6E FC      [19] 1067 	ld	l,-4 (ix)
   5799 DD 66 FD      [19] 1068 	ld	h,-3 (ix)
   579C 36 EC         [10] 1069 	ld	(hl),#<(_g_knifeY_1)
   579E 23            [ 6] 1070 	inc	hl
   579F 36 46         [10] 1071 	ld	(hl),#>(_g_knifeY_1)
                           1072 ;src/main.c:275: actual->eje = E_Y;
   57A1 E1            [10] 1073 	pop	hl
   57A2 E5            [11] 1074 	push	hl
   57A3 36 01         [10] 1075 	ld	(hl),#0x01
                           1076 ;src/main.c:276: dibujarCuchillo(actual);
   57A5 C5            [11] 1077 	push	bc
   57A6 CD F0 54      [17] 1078 	call	_dibujarCuchillo
   57A9 F1            [10] 1079 	pop	af
   57AA                    1080 00127$:
   57AA DD F9         [10] 1081 	ld	sp, ix
   57AC DD E1         [14] 1082 	pop	ix
   57AE C9            [10] 1083 	ret
                           1084 ;src/main.c:282: void comprobarTeclado() {
                           1085 ;	---------------------------------
                           1086 ; Function comprobarTeclado
                           1087 ; ---------------------------------
   57AF                    1088 _comprobarTeclado::
                           1089 ;src/main.c:283: cpct_scanKeyboard_if();
   57AF CD 06 49      [17] 1090 	call	_cpct_scanKeyboard_if
                           1091 ;src/main.c:285: if (cpct_isAnyKeyPressed()) {
   57B2 CD F9 48      [17] 1092 	call	_cpct_isAnyKeyPressed
   57B5 7D            [ 4] 1093 	ld	a,l
   57B6 B7            [ 4] 1094 	or	a, a
   57B7 C8            [11] 1095 	ret	Z
                           1096 ;src/main.c:286: if (cpct_isKeyPressed(Key_CursorLeft))
   57B8 21 01 01      [10] 1097 	ld	hl,#0x0101
   57BB CD 2F 48      [17] 1098 	call	_cpct_isKeyPressed
   57BE 7D            [ 4] 1099 	ld	a,l
   57BF B7            [ 4] 1100 	or	a, a
                           1101 ;src/main.c:287: moverIzquierda();
   57C0 C2 7B 54      [10] 1102 	jp	NZ,_moverIzquierda
                           1103 ;src/main.c:288: else if (cpct_isKeyPressed(Key_CursorRight))
   57C3 21 00 02      [10] 1104 	ld	hl,#0x0200
   57C6 CD 2F 48      [17] 1105 	call	_cpct_isKeyPressed
   57C9 7D            [ 4] 1106 	ld	a,l
   57CA B7            [ 4] 1107 	or	a, a
                           1108 ;src/main.c:289: moverDerecha();
   57CB C2 9A 54      [10] 1109 	jp	NZ,_moverDerecha
                           1110 ;src/main.c:290: else if (cpct_isKeyPressed(Key_CursorUp))
   57CE 21 00 01      [10] 1111 	ld	hl,#0x0100
   57D1 CD 2F 48      [17] 1112 	call	_cpct_isKeyPressed
   57D4 7D            [ 4] 1113 	ld	a,l
   57D5 B7            [ 4] 1114 	or	a, a
                           1115 ;src/main.c:291: moverArriba();
   57D6 C2 B8 54      [10] 1116 	jp	NZ,_moverArriba
                           1117 ;src/main.c:292: else if (cpct_isKeyPressed(Key_CursorDown))
   57D9 21 00 04      [10] 1118 	ld	hl,#0x0400
   57DC CD 2F 48      [17] 1119 	call	_cpct_isKeyPressed
   57DF 7D            [ 4] 1120 	ld	a,l
   57E0 B7            [ 4] 1121 	or	a, a
                           1122 ;src/main.c:293: moverAbajo();
   57E1 C2 D4 54      [10] 1123 	jp	NZ,_moverAbajo
                           1124 ;src/main.c:294: else if (cpct_isKeyPressed(Key_Space))
   57E4 21 05 80      [10] 1125 	ld	hl,#0x8005
   57E7 CD 2F 48      [17] 1126 	call	_cpct_isKeyPressed
   57EA 7D            [ 4] 1127 	ld	a,l
   57EB B7            [ 4] 1128 	or	a, a
   57EC C8            [11] 1129 	ret	Z
                           1130 ;src/main.c:295: lanzarCuchillo();
   57ED C3 08 56      [10] 1131 	jp  _lanzarCuchillo
                           1132 ;src/main.c:301: void moverCuchillo(){
                           1133 ;	---------------------------------
                           1134 ; Function moverCuchillo
                           1135 ; ---------------------------------
   57F0                    1136 _moverCuchillo::
   57F0 DD E5         [15] 1137 	push	ix
   57F2 DD 21 00 00   [14] 1138 	ld	ix,#0
   57F6 DD 39         [15] 1139 	add	ix,sp
   57F8 3B            [ 6] 1140 	dec	sp
                           1141 ;src/main.c:303: u8 i = 10 + 1;
   57F9 DD 36 FF 0B   [19] 1142 	ld	-1 (ix),#0x0B
                           1143 ;src/main.c:304: TKnife* actual = cu;
   57FD 11 44 52      [10] 1144 	ld	de,#_cu+0
                           1145 ;src/main.c:306: while(--i){
   5800                    1146 00134$:
   5800 DD 35 FF      [23] 1147 	dec	-1 (ix)
   5803 DD 7E FF      [19] 1148 	ld	a, -1 (ix)
   5806 B7            [ 4] 1149 	or	a, a
   5807 CA E4 58      [10] 1150 	jp	Z,00137$
                           1151 ;src/main.c:307: if(actual->lanzado){
   580A 21 06 00      [10] 1152 	ld	hl,#0x0006
   580D 19            [11] 1153 	add	hl,de
   580E 4D            [ 4] 1154 	ld	c,l
   580F 44            [ 4] 1155 	ld	b,h
   5810 0A            [ 7] 1156 	ld	a,(bc)
   5811 B7            [ 4] 1157 	or	a, a
   5812 CA DC 58      [10] 1158 	jp	Z,00133$
                           1159 ;src/main.c:308: if(actual->direccion == M_derecha){		
   5815 D5            [11] 1160 	push	de
   5816 FD E1         [14] 1161 	pop	iy
   5818 FD 6E 07      [19] 1162 	ld	l,7 (iy)
   581B 7D            [ 4] 1163 	ld	a,l
   581C B7            [ 4] 1164 	or	a, a
   581D 20 29         [12] 1165 	jr	NZ,00130$
                           1166 ;src/main.c:309: if(actual->x< LIMITE_DERECHO - G_KNIFEX_0_W){
   581F 1A            [ 7] 1167 	ld	a,(de)
   5820 6F            [ 4] 1168 	ld	l,a
   5821 D6 49         [ 7] 1169 	sub	a, #0x49
   5823 3E 00         [ 7] 1170 	ld	a,#0x00
   5825 17            [ 4] 1171 	rla
   5826 B7            [ 4] 1172 	or	a, a
   5827 28 0D         [12] 1173 	jr	Z,00104$
                           1174 ;src/main.c:310: actual->x++;
   5829 7D            [ 4] 1175 	ld	a,l
   582A 3C            [ 4] 1176 	inc	a
   582B 12            [ 7] 1177 	ld	(de),a
                           1178 ;src/main.c:312: redibujarCuchillo(actual);
   582C D5            [11] 1179 	push	de
   582D D5            [11] 1180 	push	de
   582E CD D7 55      [17] 1181 	call	_redibujarCuchillo
   5831 F1            [10] 1182 	pop	af
   5832 D1            [10] 1183 	pop	de
   5833 C3 DC 58      [10] 1184 	jp	00133$
   5836                    1185 00104$:
                           1186 ;src/main.c:314: else if(actual->x >= LIMITE_DERECHO  - G_KNIFEX_0_W){
   5836 B7            [ 4] 1187 	or	a, a
   5837 C2 DC 58      [10] 1188 	jp	NZ,00133$
                           1189 ;src/main.c:315: borrarCuchillo(actual);
   583A C5            [11] 1190 	push	bc
   583B D5            [11] 1191 	push	de
   583C D5            [11] 1192 	push	de
   583D CD 6D 55      [17] 1193 	call	_borrarCuchillo
   5840 F1            [10] 1194 	pop	af
   5841 D1            [10] 1195 	pop	de
   5842 C1            [10] 1196 	pop	bc
                           1197 ;src/main.c:316: actual->lanzado = NO;
   5843 AF            [ 4] 1198 	xor	a, a
   5844 02            [ 7] 1199 	ld	(bc),a
   5845 C3 DC 58      [10] 1200 	jp	00133$
   5848                    1201 00130$:
                           1202 ;src/main.c:319: else if(actual->direccion == M_izquierda){
   5848 7D            [ 4] 1203 	ld	a,l
   5849 3D            [ 4] 1204 	dec	a
   584A 20 29         [12] 1205 	jr	NZ,00127$
                           1206 ;src/main.c:309: if(actual->x< LIMITE_DERECHO - G_KNIFEX_0_W){
   584C 1A            [ 7] 1207 	ld	a,(de)
   584D 6F            [ 4] 1208 	ld	l,a
                           1209 ;src/main.c:320: if(actual->x > LIMITE_IZQUIERDO){
   584E 3E 04         [ 7] 1210 	ld	a,#0x04
   5850 95            [ 4] 1211 	sub	a, l
   5851 3E 00         [ 7] 1212 	ld	a,#0x00
   5853 17            [ 4] 1213 	rla
   5854 B7            [ 4] 1214 	or	a, a
   5855 28 0E         [12] 1215 	jr	Z,00109$
                           1216 ;src/main.c:321: actual->x--;
   5857 4D            [ 4] 1217 	ld	c,l
   5858 0D            [ 4] 1218 	dec	c
   5859 79            [ 4] 1219 	ld	a,c
   585A 12            [ 7] 1220 	ld	(de),a
                           1221 ;src/main.c:323: redibujarCuchillo(actual);
   585B D5            [11] 1222 	push	de
   585C D5            [11] 1223 	push	de
   585D CD D7 55      [17] 1224 	call	_redibujarCuchillo
   5860 F1            [10] 1225 	pop	af
   5861 D1            [10] 1226 	pop	de
   5862 C3 DC 58      [10] 1227 	jp	00133$
   5865                    1228 00109$:
                           1229 ;src/main.c:324: }else if(actual->x <= LIMITE_IZQUIERDO){
   5865 B7            [ 4] 1230 	or	a, a
   5866 20 74         [12] 1231 	jr	NZ,00133$
                           1232 ;src/main.c:325: borrarCuchillo(actual);
   5868 C5            [11] 1233 	push	bc
   5869 D5            [11] 1234 	push	de
   586A D5            [11] 1235 	push	de
   586B CD 6D 55      [17] 1236 	call	_borrarCuchillo
   586E F1            [10] 1237 	pop	af
   586F D1            [10] 1238 	pop	de
   5870 C1            [10] 1239 	pop	bc
                           1240 ;src/main.c:326: actual->lanzado = NO;
   5871 AF            [ 4] 1241 	xor	a, a
   5872 02            [ 7] 1242 	ld	(bc),a
   5873 18 67         [12] 1243 	jr	00133$
   5875                    1244 00127$:
                           1245 ;src/main.c:330: if(actual->y < LIMITE_INFERIOR - G_KNIFEY_0_H){
   5875 D5            [11] 1246 	push	de
   5876 FD E1         [14] 1247 	pop	iy
   5878 FD 23         [10] 1248 	inc	iy
                           1249 ;src/main.c:329: else if(actual->direccion == M_abajo){
   587A 7D            [ 4] 1250 	ld	a,l
   587B D6 03         [ 7] 1251 	sub	a, #0x03
   587D 20 2D         [12] 1252 	jr	NZ,00124$
                           1253 ;src/main.c:330: if(actual->y < LIMITE_INFERIOR - G_KNIFEY_0_H){
   587F FD 6E 00      [19] 1254 	ld	l, 0 (iy)
   5882 7D            [ 4] 1255 	ld	a,l
   5883 D6 A2         [ 7] 1256 	sub	a, #0xA2
   5885 3E 00         [ 7] 1257 	ld	a,#0x00
   5887 17            [ 4] 1258 	rla
   5888 B7            [ 4] 1259 	or	a, a
   5889 28 11         [12] 1260 	jr	Z,00114$
                           1261 ;src/main.c:331: actual->y++;
   588B 2C            [ 4] 1262 	inc	l
   588C FD 75 00      [19] 1263 	ld	0 (iy), l
                           1264 ;src/main.c:332: actual->y++;
   588F 2C            [ 4] 1265 	inc	l
   5890 FD 75 00      [19] 1266 	ld	0 (iy), l
                           1267 ;src/main.c:333: redibujarCuchillo(actual);
   5893 D5            [11] 1268 	push	de
   5894 D5            [11] 1269 	push	de
   5895 CD D7 55      [17] 1270 	call	_redibujarCuchillo
   5898 F1            [10] 1271 	pop	af
   5899 D1            [10] 1272 	pop	de
   589A 18 40         [12] 1273 	jr	00133$
   589C                    1274 00114$:
                           1275 ;src/main.c:336: }else if(actual->y >= LIMITE_INFERIOR - G_KNIFEY_0_H ){
   589C B7            [ 4] 1276 	or	a, a
   589D 20 3D         [12] 1277 	jr	NZ,00133$
                           1278 ;src/main.c:337: borrarCuchillo(actual);
   589F C5            [11] 1279 	push	bc
   58A0 D5            [11] 1280 	push	de
   58A1 D5            [11] 1281 	push	de
   58A2 CD 6D 55      [17] 1282 	call	_borrarCuchillo
   58A5 F1            [10] 1283 	pop	af
   58A6 D1            [10] 1284 	pop	de
   58A7 C1            [10] 1285 	pop	bc
                           1286 ;src/main.c:338: actual->lanzado = NO;
   58A8 AF            [ 4] 1287 	xor	a, a
   58A9 02            [ 7] 1288 	ld	(bc),a
   58AA 18 30         [12] 1289 	jr	00133$
   58AC                    1290 00124$:
                           1291 ;src/main.c:341: else if(actual->direccion == M_arriba){
   58AC 7D            [ 4] 1292 	ld	a,l
   58AD D6 02         [ 7] 1293 	sub	a, #0x02
   58AF 20 2B         [12] 1294 	jr	NZ,00133$
                           1295 ;src/main.c:330: if(actual->y < LIMITE_INFERIOR - G_KNIFEY_0_H){
   58B1 FD 6E 00      [19] 1296 	ld	l, 0 (iy)
                           1297 ;src/main.c:342: if(actual->y > LIMITE_SUPERIOR){
   58B4 3E 08         [ 7] 1298 	ld	a,#0x08
   58B6 95            [ 4] 1299 	sub	a, l
   58B7 3E 00         [ 7] 1300 	ld	a,#0x00
   58B9 17            [ 4] 1301 	rla
   58BA B7            [ 4] 1302 	or	a, a
   58BB 28 11         [12] 1303 	jr	Z,00119$
                           1304 ;src/main.c:343: actual->y--;
   58BD 2D            [ 4] 1305 	dec	l
   58BE FD 75 00      [19] 1306 	ld	0 (iy), l
                           1307 ;src/main.c:344: actual->y--;
   58C1 2D            [ 4] 1308 	dec	l
   58C2 FD 75 00      [19] 1309 	ld	0 (iy), l
                           1310 ;src/main.c:345: redibujarCuchillo(actual);
   58C5 D5            [11] 1311 	push	de
   58C6 D5            [11] 1312 	push	de
   58C7 CD D7 55      [17] 1313 	call	_redibujarCuchillo
   58CA F1            [10] 1314 	pop	af
   58CB D1            [10] 1315 	pop	de
   58CC 18 0E         [12] 1316 	jr	00133$
   58CE                    1317 00119$:
                           1318 ;src/main.c:347: }else if(actual->y <= LIMITE_SUPERIOR){
   58CE B7            [ 4] 1319 	or	a, a
   58CF 20 0B         [12] 1320 	jr	NZ,00133$
                           1321 ;src/main.c:348: borrarCuchillo(actual);
   58D1 C5            [11] 1322 	push	bc
   58D2 D5            [11] 1323 	push	de
   58D3 D5            [11] 1324 	push	de
   58D4 CD 6D 55      [17] 1325 	call	_borrarCuchillo
   58D7 F1            [10] 1326 	pop	af
   58D8 D1            [10] 1327 	pop	de
   58D9 C1            [10] 1328 	pop	bc
                           1329 ;src/main.c:349: actual->lanzado = NO;
   58DA AF            [ 4] 1330 	xor	a, a
   58DB 02            [ 7] 1331 	ld	(bc),a
   58DC                    1332 00133$:
                           1333 ;src/main.c:353: ++actual;
   58DC 21 09 00      [10] 1334 	ld	hl,#0x0009
   58DF 19            [11] 1335 	add	hl,de
   58E0 EB            [ 4] 1336 	ex	de,hl
   58E1 C3 00 58      [10] 1337 	jp	00134$
   58E4                    1338 00137$:
   58E4 33            [ 6] 1339 	inc	sp
   58E5 DD E1         [14] 1340 	pop	ix
   58E7 C9            [10] 1341 	ret
                           1342 ;src/main.c:357: void inicializar() {
                           1343 ;	---------------------------------
                           1344 ; Function inicializar
                           1345 ; ---------------------------------
   58E8                    1346 _inicializar::
                           1347 ;src/main.c:360: TKnife* actual = cu;
                           1348 ;src/main.c:362: cpct_disableFirmware();
   58E8 CD AD 51      [17] 1349 	call	_cpct_disableFirmware
                           1350 ;src/main.c:363: cpct_setVideoMode(0);
   58EB 2E 00         [ 7] 1351 	ld	l,#0x00
   58ED CD 76 49      [17] 1352 	call	_cpct_setVideoMode
                           1353 ;src/main.c:365: cpct_setPalette(g_palette, 16);
   58F0 21 10 00      [10] 1354 	ld	hl,#0x0010
   58F3 E5            [11] 1355 	push	hl
   58F4 21 6E 47      [10] 1356 	ld	hl,#_g_palette
   58F7 E5            [11] 1357 	push	hl
   58F8 CD 18 48      [17] 1358 	call	_cpct_setPalette
                           1359 ;src/main.c:366: cpct_akp_musicInit(G_song);
   58FB 21 00 3F      [10] 1360 	ld	hl,#_G_song
   58FE E5            [11] 1361 	push	hl
   58FF CD 89 50      [17] 1362 	call	_cpct_akp_musicInit
   5902 F1            [10] 1363 	pop	af
                           1364 ;src/main.c:367: mapa = g_map1;
   5903 21 00 40      [10] 1365 	ld	hl,#_g_map1+0
   5906 22 9E 52      [16] 1366 	ld	(_mapa),hl
                           1367 ;src/main.c:368: cpct_etm_setTileset2x4(g_tileset);
   5909 21 0A 47      [10] 1368 	ld	hl,#_g_tileset
   590C CD CA 48      [17] 1369 	call	_cpct_etm_setTileset2x4
                           1370 ;src/main.c:369: dibujarMapa();
   590F CD A0 52      [17] 1371 	call	_dibujarMapa
                           1372 ;src/main.c:372: prota.x = prota.px = 4;
   5912 21 3E 52      [10] 1373 	ld	hl,#(_prota + 0x0002)
   5915 36 04         [10] 1374 	ld	(hl),#0x04
   5917 21 3C 52      [10] 1375 	ld	hl,#_prota
   591A 36 04         [10] 1376 	ld	(hl),#0x04
                           1377 ;src/main.c:373: prota.y = prota.py = 80;
   591C 21 3F 52      [10] 1378 	ld	hl,#(_prota + 0x0003)
   591F 36 50         [10] 1379 	ld	(hl),#0x50
   5921 21 3D 52      [10] 1380 	ld	hl,#(_prota + 0x0001)
   5924 36 50         [10] 1381 	ld	(hl),#0x50
                           1382 ;src/main.c:374: prota.mover  = NO;
   5926 21 42 52      [10] 1383 	ld	hl,#(_prota + 0x0006)
   5929 36 00         [10] 1384 	ld	(hl),#0x00
                           1385 ;src/main.c:375: prota.mira=M_derecha;
   592B 21 43 52      [10] 1386 	ld	hl,#(_prota + 0x0007)
   592E 36 00         [10] 1387 	ld	(hl),#0x00
                           1388 ;src/main.c:376: prota.sprite = g_hero;
   5930 21 7E 47      [10] 1389 	ld	hl,#_g_hero
   5933 22 40 52      [16] 1390 	ld	((_prota + 0x0004)), hl
                           1391 ;src/main.c:379: i = 10 + 1;
   5936 0E 0B         [ 7] 1392 	ld	c,#0x0B
                           1393 ;src/main.c:382: while(--i){
   5938 11 44 52      [10] 1394 	ld	de,#_cu
   593B                    1395 00101$:
   593B 41            [ 4] 1396 	ld	b,c
   593C 05            [ 4] 1397 	dec	b
   593D 78            [ 4] 1398 	ld	a,b
   593E 4F            [ 4] 1399 	ld	c,a
   593F B7            [ 4] 1400 	or	a, a
   5940 28 25         [12] 1401 	jr	Z,00103$
                           1402 ;src/main.c:383: actual->x = actual->px = 0;
   5942 6B            [ 4] 1403 	ld	l, e
   5943 62            [ 4] 1404 	ld	h, d
   5944 23            [ 6] 1405 	inc	hl
   5945 23            [ 6] 1406 	inc	hl
   5946 36 00         [10] 1407 	ld	(hl),#0x00
   5948 AF            [ 4] 1408 	xor	a, a
   5949 12            [ 7] 1409 	ld	(de),a
                           1410 ;src/main.c:384: actual->y = actual->py = 0;
   594A D5            [11] 1411 	push	de
   594B FD E1         [14] 1412 	pop	iy
   594D FD 23         [10] 1413 	inc	iy
   594F 6B            [ 4] 1414 	ld	l, e
   5950 62            [ 4] 1415 	ld	h, d
   5951 23            [ 6] 1416 	inc	hl
   5952 23            [ 6] 1417 	inc	hl
   5953 23            [ 6] 1418 	inc	hl
   5954 36 00         [10] 1419 	ld	(hl),#0x00
   5956 FD 36 00 00   [19] 1420 	ld	0 (iy), #0x00
                           1421 ;src/main.c:385: actual->lanzado = 0;
   595A 21 06 00      [10] 1422 	ld	hl,#0x0006
   595D 19            [11] 1423 	add	hl,de
   595E 36 00         [10] 1424 	ld	(hl),#0x00
                           1425 ;src/main.c:386: ++actual;
   5960 21 09 00      [10] 1426 	ld	hl,#0x0009
   5963 19            [11] 1427 	add	hl,de
   5964 EB            [ 4] 1428 	ex	de,hl
   5965 18 D4         [12] 1429 	jr	00101$
   5967                    1430 00103$:
                           1431 ;src/main.c:390: dibujarProta();
   5967 CD B6 52      [17] 1432 	call	_dibujarProta
   596A C9            [10] 1433 	ret
                           1434 ;src/main.c:393: void main(void) {
                           1435 ;	---------------------------------
                           1436 ; Function main
                           1437 ; ---------------------------------
   596B                    1438 _main::
                           1439 ;src/main.c:396: inicializar();
   596B CD E8 58      [17] 1440 	call	_inicializar
                           1441 ;src/main.c:397: cpct_akp_musicPlay();
   596E CD 86 49      [17] 1442 	call	_cpct_akp_musicPlay
                           1443 ;src/main.c:400: while (1) {
   5971                    1444 00104$:
                           1445 ;src/main.c:403: comprobarTeclado();
   5971 CD AF 57      [17] 1446 	call	_comprobarTeclado
                           1447 ;src/main.c:405: cpct_waitVSYNC();
   5974 CD 6E 49      [17] 1448 	call	_cpct_waitVSYNC
                           1449 ;src/main.c:406: moverCuchillo();
   5977 CD F0 57      [17] 1450 	call	_moverCuchillo
                           1451 ;src/main.c:408: if (prota.mover) {
   597A 3A 42 52      [13] 1452 	ld	a, (#(_prota + 0x0006) + 0)
   597D B7            [ 4] 1453 	or	a, a
   597E 28 F1         [12] 1454 	jr	Z,00104$
                           1455 ;src/main.c:410: redibujarProta();
   5980 CD 3F 53      [17] 1456 	call	_redibujarProta
                           1457 ;src/main.c:411: prota.mover = NO;
   5983 21 42 52      [10] 1458 	ld	hl,#(_prota + 0x0006)
   5986 36 00         [10] 1459 	ld	(hl),#0x00
   5988 18 E7         [12] 1460 	jr	00104$
                           1461 	.area _CODE
                           1462 	.area _INITIALIZER
                           1463 	.area _CABS (ABS)
   3F00                    1464 	.org 0x3F00
   3F00                    1465 _G_song:
   3F00 41                 1466 	.db #0x41	; 65	'A'
   3F01 54                 1467 	.db #0x54	; 84	'T'
   3F02 31                 1468 	.db #0x31	; 49	'1'
   3F03 30                 1469 	.db #0x30	; 48	'0'
   3F04 01                 1470 	.db #0x01	; 1
   3F05 40                 1471 	.db #0x40	; 64
   3F06 42                 1472 	.db #0x42	; 66	'B'
   3F07 0F                 1473 	.db #0x0F	; 15
   3F08 02                 1474 	.db #0x02	; 2
   3F09 06                 1475 	.db #0x06	; 6
   3F0A 1D                 1476 	.db #0x1D	; 29
   3F0B 00                 1477 	.db #0x00	; 0
   3F0C 10                 1478 	.db #0x10	; 16
   3F0D 40                 1479 	.db #0x40	; 64
   3F0E 19                 1480 	.db #0x19	; 25
   3F0F 40                 1481 	.db #0x40	; 64
   3F10 00                 1482 	.db #0x00	; 0
   3F11 00                 1483 	.db #0x00	; 0
   3F12 00                 1484 	.db #0x00	; 0
   3F13 00                 1485 	.db #0x00	; 0
   3F14 00                 1486 	.db #0x00	; 0
   3F15 00                 1487 	.db #0x00	; 0
   3F16 0D                 1488 	.db #0x0D	; 13
   3F17 12                 1489 	.db #0x12	; 18
   3F18 40                 1490 	.db #0x40	; 64
   3F19 01                 1491 	.db #0x01	; 1
   3F1A 00                 1492 	.db #0x00	; 0
   3F1B 7C                 1493 	.db #0x7C	; 124
   3F1C 18                 1494 	.db #0x18	; 24
   3F1D 78                 1495 	.db #0x78	; 120	'x'
   3F1E 0C                 1496 	.db #0x0C	; 12
   3F1F 34                 1497 	.db #0x34	; 52	'4'
   3F20 30                 1498 	.db #0x30	; 48	'0'
   3F21 2C                 1499 	.db #0x2C	; 44
   3F22 28                 1500 	.db #0x28	; 40
   3F23 24                 1501 	.db #0x24	; 36
   3F24 20                 1502 	.db #0x20	; 32
   3F25 1C                 1503 	.db #0x1C	; 28
   3F26 0D                 1504 	.db #0x0D	; 13
   3F27 25                 1505 	.db #0x25	; 37
   3F28 40                 1506 	.db #0x40	; 64
   3F29 20                 1507 	.db #0x20	; 32
   3F2A 00                 1508 	.db #0x00	; 0
   3F2B 00                 1509 	.db #0x00	; 0
   3F2C 00                 1510 	.db #0x00	; 0
   3F2D 39                 1511 	.db #0x39	; 57	'9'
   3F2E 40                 1512 	.db #0x40	; 64
   3F2F 00                 1513 	.db #0x00	; 0
   3F30 57                 1514 	.db #0x57	; 87	'W'
   3F31 40                 1515 	.db #0x40	; 64
   3F32 3B                 1516 	.db #0x3B	; 59
   3F33 40                 1517 	.db #0x40	; 64
   3F34 57                 1518 	.db #0x57	; 87	'W'
   3F35 40                 1519 	.db #0x40	; 64
   3F36 01                 1520 	.db #0x01	; 1
   3F37 2F                 1521 	.db #0x2F	; 47
   3F38 40                 1522 	.db #0x40	; 64
   3F39 19                 1523 	.db #0x19	; 25
   3F3A 00                 1524 	.db #0x00	; 0
   3F3B 76                 1525 	.db #0x76	; 118	'v'
   3F3C E1                 1526 	.db #0xE1	; 225
   3F3D 00                 1527 	.db #0x00	; 0
   3F3E 00                 1528 	.db #0x00	; 0
   3F3F 01                 1529 	.db #0x01	; 1
   3F40 04                 1530 	.db #0x04	; 4
   3F41 51                 1531 	.db #0x51	; 81	'Q'
   3F42 04                 1532 	.db #0x04	; 4
   3F43 37                 1533 	.db #0x37	; 55	'7'
   3F44 04                 1534 	.db #0x04	; 4
   3F45 4F                 1535 	.db #0x4F	; 79	'O'
   3F46 04                 1536 	.db #0x04	; 4
   3F47 37                 1537 	.db #0x37	; 55	'7'
   3F48 02                 1538 	.db #0x02	; 2
   3F49 4B                 1539 	.db #0x4B	; 75	'K'
   3F4A 02                 1540 	.db #0x02	; 2
   3F4B 37                 1541 	.db #0x37	; 55	'7'
   3F4C 04                 1542 	.db #0x04	; 4
   3F4D 4F                 1543 	.db #0x4F	; 79	'O'
   3F4E 04                 1544 	.db #0x04	; 4
   3F4F 37                 1545 	.db #0x37	; 55	'7'
   3F50 04                 1546 	.db #0x04	; 4
   3F51 4F                 1547 	.db #0x4F	; 79	'O'
   3F52 04                 1548 	.db #0x04	; 4
   3F53 37                 1549 	.db #0x37	; 55	'7'
   3F54 02                 1550 	.db #0x02	; 2
   3F55 4B                 1551 	.db #0x4B	; 75	'K'
   3F56 00                 1552 	.db #0x00	; 0
   3F57 42                 1553 	.db #0x42	; 66	'B'
   3F58 60                 1554 	.db #0x60	; 96
   3F59 00                 1555 	.db #0x00	; 0
   3F5A 42                 1556 	.db #0x42	; 66	'B'
   3F5B 80                 1557 	.db #0x80	; 128
   3F5C 00                 1558 	.db #0x00	; 0
   3F5D 00                 1559 	.db #0x00	; 0
   3F5E 42                 1560 	.db #0x42	; 66	'B'
   3F5F 00                 1561 	.db #0x00	; 0
   3F60 00                 1562 	.db #0x00	; 0
