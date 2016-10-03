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
   5397 21 F8 FF      [10]  317 	ld	hl,#-8
   539A 39            [11]  318 	add	hl,sp
   539B F9            [ 6]  319 	ld	sp,hl
                            320 ;src/main.c:128: switch (direction) {
   539C DD CB 05 7E   [20]  321 	bit	7, 5 (ix)
   53A0 C2 9B 54      [10]  322 	jp	NZ,00105$
   53A3 3E 03         [ 7]  323 	ld	a,#0x03
   53A5 DD BE 04      [19]  324 	cp	a, 4 (ix)
   53A8 3E 00         [ 7]  325 	ld	a,#0x00
   53AA DD 9E 05      [19]  326 	sbc	a, 5 (ix)
   53AD E2 B2 53      [10]  327 	jp	PO, 00128$
   53B0 EE 80         [ 7]  328 	xor	a, #0x80
   53B2                     329 00128$:
   53B2 FA 9B 54      [10]  330 	jp	M,00105$
   53B5 DD 5E 04      [19]  331 	ld	e,4 (ix)
   53B8 16 00         [ 7]  332 	ld	d,#0x00
   53BA 21 C1 53      [10]  333 	ld	hl,#00129$
   53BD 19            [11]  334 	add	hl,de
   53BE 19            [11]  335 	add	hl,de
   53BF 19            [11]  336 	add	hl,de
   53C0 E9            [ 4]  337 	jp	(hl)
   53C1                     338 00129$:
   53C1 C3 CD 53      [10]  339 	jp	00101$
   53C4 C3 12 54      [10]  340 	jp	00102$
   53C7 C3 52 54      [10]  341 	jp	00103$
   53CA C3 6F 54      [10]  342 	jp	00104$
                            343 ;src/main.c:129: case 0:
   53CD                     344 00101$:
                            345 ;src/main.c:130: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   53CD 21 3D 52      [10]  346 	ld	hl, #(_prota + 0x0001) + 0
   53D0 46            [ 7]  347 	ld	b,(hl)
   53D1 3A 3C 52      [13]  348 	ld	a, (#_prota + 0)
   53D4 C6 04         [ 7]  349 	add	a, #0x04
   53D6 C5            [11]  350 	push	bc
   53D7 33            [ 6]  351 	inc	sp
   53D8 F5            [11]  352 	push	af
   53D9 33            [ 6]  353 	inc	sp
   53DA CD 53 53      [17]  354 	call	_getTilePtr
   53DD F1            [10]  355 	pop	af
   53DE DD 75 FE      [19]  356 	ld	-2 (ix),l
   53E1 DD 74 FF      [19]  357 	ld	-1 (ix),h
                            358 ;src/main.c:131: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA);
   53E4 3A 3D 52      [13]  359 	ld	a, (#(_prota + 0x0001) + 0)
   53E7 C6 16         [ 7]  360 	add	a, #0x16
   53E9 47            [ 4]  361 	ld	b,a
   53EA 3A 3C 52      [13]  362 	ld	a, (#_prota + 0)
   53ED C6 04         [ 7]  363 	add	a, #0x04
   53EF C5            [11]  364 	push	bc
   53F0 33            [ 6]  365 	inc	sp
   53F1 F5            [11]  366 	push	af
   53F2 33            [ 6]  367 	inc	sp
   53F3 CD 53 53      [17]  368 	call	_getTilePtr
   53F6 F1            [10]  369 	pop	af
   53F7 4D            [ 4]  370 	ld	c,l
   53F8 44            [ 4]  371 	ld	b,h
                            372 ;src/main.c:132: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   53F9 3A 3D 52      [13]  373 	ld	a, (#(_prota + 0x0001) + 0)
   53FC C6 0B         [ 7]  374 	add	a, #0x0B
   53FE 57            [ 4]  375 	ld	d,a
   53FF 3A 3C 52      [13]  376 	ld	a, (#_prota + 0)
   5402 C6 04         [ 7]  377 	add	a, #0x04
   5404 C5            [11]  378 	push	bc
   5405 D5            [11]  379 	push	de
   5406 33            [ 6]  380 	inc	sp
   5407 F5            [11]  381 	push	af
   5408 33            [ 6]  382 	inc	sp
   5409 CD 53 53      [17]  383 	call	_getTilePtr
   540C F1            [10]  384 	pop	af
   540D EB            [ 4]  385 	ex	de,hl
   540E C1            [10]  386 	pop	bc
                            387 ;src/main.c:133: break;
   540F C3 9B 54      [10]  388 	jp	00105$
                            389 ;src/main.c:134: case 1:
   5412                     390 00102$:
                            391 ;src/main.c:135: headTile  = getTilePtr(prota.x - 1, prota.y);
   5412 21 3D 52      [10]  392 	ld	hl, #(_prota + 0x0001) + 0
   5415 46            [ 7]  393 	ld	b,(hl)
   5416 21 3C 52      [10]  394 	ld	hl, #_prota + 0
   5419 56            [ 7]  395 	ld	d,(hl)
   541A 15            [ 4]  396 	dec	d
   541B 4A            [ 4]  397 	ld	c, d
   541C C5            [11]  398 	push	bc
   541D CD 53 53      [17]  399 	call	_getTilePtr
   5420 F1            [10]  400 	pop	af
   5421 DD 75 FE      [19]  401 	ld	-2 (ix),l
   5424 DD 74 FF      [19]  402 	ld	-1 (ix),h
                            403 ;src/main.c:136: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA);
   5427 3A 3D 52      [13]  404 	ld	a, (#(_prota + 0x0001) + 0)
   542A C6 16         [ 7]  405 	add	a, #0x16
   542C 47            [ 4]  406 	ld	b,a
   542D 21 3C 52      [10]  407 	ld	hl, #_prota + 0
   5430 56            [ 7]  408 	ld	d,(hl)
   5431 15            [ 4]  409 	dec	d
   5432 4A            [ 4]  410 	ld	c, d
   5433 C5            [11]  411 	push	bc
   5434 CD 53 53      [17]  412 	call	_getTilePtr
   5437 F1            [10]  413 	pop	af
   5438 4D            [ 4]  414 	ld	c,l
   5439 44            [ 4]  415 	ld	b,h
                            416 ;src/main.c:137: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
   543A 3A 3D 52      [13]  417 	ld	a, (#(_prota + 0x0001) + 0)
   543D C6 0B         [ 7]  418 	add	a, #0x0B
   543F 57            [ 4]  419 	ld	d,a
   5440 3A 3C 52      [13]  420 	ld	a, (#_prota + 0)
   5443 C6 FF         [ 7]  421 	add	a,#0xFF
   5445 C5            [11]  422 	push	bc
   5446 D5            [11]  423 	push	de
   5447 33            [ 6]  424 	inc	sp
   5448 F5            [11]  425 	push	af
   5449 33            [ 6]  426 	inc	sp
   544A CD 53 53      [17]  427 	call	_getTilePtr
   544D F1            [10]  428 	pop	af
   544E EB            [ 4]  429 	ex	de,hl
   544F C1            [10]  430 	pop	bc
                            431 ;src/main.c:138: break;
   5450 18 49         [12]  432 	jr	00105$
                            433 ;src/main.c:139: case 2:
   5452                     434 00103$:
                            435 ;src/main.c:140: headTile   = getTilePtr(prota.x, prota.y - 1);
   5452 3A 3D 52      [13]  436 	ld	a, (#_prota + 1)
   5455 C6 FF         [ 7]  437 	add	a,#0xFF
   5457 21 3C 52      [10]  438 	ld	hl, #_prota + 0
   545A 46            [ 7]  439 	ld	b,(hl)
   545B F5            [11]  440 	push	af
   545C 33            [ 6]  441 	inc	sp
   545D C5            [11]  442 	push	bc
   545E 33            [ 6]  443 	inc	sp
   545F CD 53 53      [17]  444 	call	_getTilePtr
   5462 F1            [10]  445 	pop	af
   5463 DD 75 FE      [19]  446 	ld	-2 (ix),l
   5466 DD 74 FF      [19]  447 	ld	-1 (ix),h
                            448 ;src/main.c:141: *feetTile  = 0;
   5469 AF            [ 4]  449 	xor	a, a
   546A 02            [ 7]  450 	ld	(bc),a
                            451 ;src/main.c:142: *waistTile = 0;
   546B AF            [ 4]  452 	xor	a, a
   546C 12            [ 7]  453 	ld	(de),a
                            454 ;src/main.c:143: break;
   546D 18 2C         [12]  455 	jr	00105$
                            456 ;src/main.c:144: case 3:
   546F                     457 00104$:
                            458 ;src/main.c:145: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA + 1);
   546F 3A 3D 52      [13]  459 	ld	a, (#(_prota + 0x0001) + 0)
   5472 C6 17         [ 7]  460 	add	a, #0x17
   5474 47            [ 4]  461 	ld	b,a
   5475 21 3C 52      [10]  462 	ld	hl, #_prota + 0
   5478 4E            [ 7]  463 	ld	c, (hl)
   5479 C5            [11]  464 	push	bc
   547A CD 53 53      [17]  465 	call	_getTilePtr
   547D F1            [10]  466 	pop	af
   547E DD 75 FE      [19]  467 	ld	-2 (ix),l
   5481 DD 74 FF      [19]  468 	ld	-1 (ix),h
                            469 ;src/main.c:146: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA + 1);
   5484 3A 3D 52      [13]  470 	ld	a, (#(_prota + 0x0001) + 0)
   5487 C6 17         [ 7]  471 	add	a, #0x17
   5489 47            [ 4]  472 	ld	b,a
   548A 3A 3C 52      [13]  473 	ld	a, (#_prota + 0)
   548D C6 03         [ 7]  474 	add	a, #0x03
   548F C5            [11]  475 	push	bc
   5490 33            [ 6]  476 	inc	sp
   5491 F5            [11]  477 	push	af
   5492 33            [ 6]  478 	inc	sp
   5493 CD 53 53      [17]  479 	call	_getTilePtr
   5496 F1            [10]  480 	pop	af
   5497 4D            [ 4]  481 	ld	c,l
   5498 44            [ 4]  482 	ld	b,h
                            483 ;src/main.c:147: *waistTile = 0;
   5499 AF            [ 4]  484 	xor	a, a
   549A 12            [ 7]  485 	ld	(de),a
                            486 ;src/main.c:149: }
   549B                     487 00105$:
                            488 ;src/main.c:151: if (*headTile > 0 || *feetTile > 0 || *waistTile > 0)
   549B DD 6E FE      [19]  489 	ld	l,-2 (ix)
   549E DD 66 FF      [19]  490 	ld	h,-1 (ix)
   54A1 7E            [ 7]  491 	ld	a,(hl)
   54A2 B7            [ 4]  492 	or	a, a
   54A3 20 08         [12]  493 	jr	NZ,00106$
   54A5 0A            [ 7]  494 	ld	a,(bc)
   54A6 B7            [ 4]  495 	or	a, a
   54A7 20 04         [12]  496 	jr	NZ,00106$
   54A9 1A            [ 7]  497 	ld	a,(de)
   54AA B7            [ 4]  498 	or	a, a
   54AB 28 04         [12]  499 	jr	Z,00107$
   54AD                     500 00106$:
                            501 ;src/main.c:152: return 1;
   54AD 2E 01         [ 7]  502 	ld	l,#0x01
   54AF 18 02         [12]  503 	jr	00110$
   54B1                     504 00107$:
                            505 ;src/main.c:154: return 0;
   54B1 2E 00         [ 7]  506 	ld	l,#0x00
   54B3                     507 00110$:
   54B3 DD F9         [10]  508 	ld	sp, ix
   54B5 DD E1         [14]  509 	pop	ix
   54B7 C9            [10]  510 	ret
                            511 ;src/main.c:157: void moverIzquierda() {
                            512 ;	---------------------------------
                            513 ; Function moverIzquierda
                            514 ; ---------------------------------
   54B8                     515 _moverIzquierda::
                            516 ;src/main.c:158: prota.mira = M_izquierda;
   54B8 01 3C 52      [10]  517 	ld	bc,#_prota+0
   54BB 21 43 52      [10]  518 	ld	hl,#(_prota + 0x0007)
   54BE 36 01         [10]  519 	ld	(hl),#0x01
                            520 ;src/main.c:159: if (!checkCollision(M_izquierda)) {
   54C0 C5            [11]  521 	push	bc
   54C1 21 01 00      [10]  522 	ld	hl,#0x0001
   54C4 E5            [11]  523 	push	hl
   54C5 CD 8F 53      [17]  524 	call	_checkCollision
   54C8 F1            [10]  525 	pop	af
   54C9 C1            [10]  526 	pop	bc
   54CA 7D            [ 4]  527 	ld	a,l
   54CB B7            [ 4]  528 	or	a, a
   54CC C0            [11]  529 	ret	NZ
                            530 ;src/main.c:160: prota.x--;
   54CD 0A            [ 7]  531 	ld	a,(bc)
   54CE C6 FF         [ 7]  532 	add	a,#0xFF
   54D0 02            [ 7]  533 	ld	(bc),a
                            534 ;src/main.c:161: prota.mover = SI;
   54D1 21 42 52      [10]  535 	ld	hl,#(_prota + 0x0006)
   54D4 36 01         [10]  536 	ld	(hl),#0x01
   54D6 C9            [10]  537 	ret
                            538 ;src/main.c:165: void moverDerecha() {
                            539 ;	---------------------------------
                            540 ; Function moverDerecha
                            541 ; ---------------------------------
   54D7                     542 _moverDerecha::
                            543 ;src/main.c:166: prota.mira = M_derecha;
   54D7 01 3C 52      [10]  544 	ld	bc,#_prota+0
   54DA 21 43 52      [10]  545 	ld	hl,#(_prota + 0x0007)
   54DD 36 00         [10]  546 	ld	(hl),#0x00
                            547 ;src/main.c:167: if (!checkCollision(M_derecha)) {
   54DF C5            [11]  548 	push	bc
   54E0 21 00 00      [10]  549 	ld	hl,#0x0000
   54E3 E5            [11]  550 	push	hl
   54E4 CD 8F 53      [17]  551 	call	_checkCollision
   54E7 F1            [10]  552 	pop	af
   54E8 C1            [10]  553 	pop	bc
   54E9 7D            [ 4]  554 	ld	a,l
   54EA B7            [ 4]  555 	or	a, a
   54EB C0            [11]  556 	ret	NZ
                            557 ;src/main.c:168: prota.x++;
   54EC 0A            [ 7]  558 	ld	a,(bc)
   54ED 3C            [ 4]  559 	inc	a
   54EE 02            [ 7]  560 	ld	(bc),a
                            561 ;src/main.c:169: prota.mover = SI;
   54EF 21 42 52      [10]  562 	ld	hl,#(_prota + 0x0006)
   54F2 36 01         [10]  563 	ld	(hl),#0x01
   54F4 C9            [10]  564 	ret
                            565 ;src/main.c:173: void moverArriba() {
                            566 ;	---------------------------------
                            567 ; Function moverArriba
                            568 ; ---------------------------------
   54F5                     569 _moverArriba::
                            570 ;src/main.c:174: prota.mira = M_arriba;
   54F5 21 43 52      [10]  571 	ld	hl,#(_prota + 0x0007)
   54F8 36 02         [10]  572 	ld	(hl),#0x02
                            573 ;src/main.c:175: if (!checkCollision(M_arriba)) {
   54FA 21 02 00      [10]  574 	ld	hl,#0x0002
   54FD E5            [11]  575 	push	hl
   54FE CD 8F 53      [17]  576 	call	_checkCollision
   5501 F1            [10]  577 	pop	af
   5502 7D            [ 4]  578 	ld	a,l
   5503 B7            [ 4]  579 	or	a, a
   5504 C0            [11]  580 	ret	NZ
                            581 ;src/main.c:176: prota.y--;
   5505 21 3D 52      [10]  582 	ld	hl,#_prota + 1
   5508 4E            [ 7]  583 	ld	c,(hl)
   5509 0D            [ 4]  584 	dec	c
   550A 71            [ 7]  585 	ld	(hl),c
                            586 ;src/main.c:177: prota.mover  = SI;
   550B 21 42 52      [10]  587 	ld	hl,#(_prota + 0x0006)
   550E 36 01         [10]  588 	ld	(hl),#0x01
   5510 C9            [10]  589 	ret
                            590 ;src/main.c:181: void moverAbajo() {
                            591 ;	---------------------------------
                            592 ; Function moverAbajo
                            593 ; ---------------------------------
   5511                     594 _moverAbajo::
                            595 ;src/main.c:182: prota.mira = M_abajo;
   5511 21 43 52      [10]  596 	ld	hl,#(_prota + 0x0007)
   5514 36 03         [10]  597 	ld	(hl),#0x03
                            598 ;src/main.c:183: if (!checkCollision(M_abajo)) {
   5516 21 03 00      [10]  599 	ld	hl,#0x0003
   5519 E5            [11]  600 	push	hl
   551A CD 8F 53      [17]  601 	call	_checkCollision
   551D F1            [10]  602 	pop	af
   551E 7D            [ 4]  603 	ld	a,l
   551F B7            [ 4]  604 	or	a, a
   5520 C0            [11]  605 	ret	NZ
                            606 ;src/main.c:184: prota.y++;
   5521 01 3D 52      [10]  607 	ld	bc,#_prota + 1
   5524 0A            [ 7]  608 	ld	a,(bc)
   5525 3C            [ 4]  609 	inc	a
   5526 02            [ 7]  610 	ld	(bc),a
                            611 ;src/main.c:185: prota.mover  = SI;
   5527 21 42 52      [10]  612 	ld	hl,#(_prota + 0x0006)
   552A 36 01         [10]  613 	ld	(hl),#0x01
   552C C9            [10]  614 	ret
                            615 ;src/main.c:189: void dibujarCuchillo(TKnife* actual) {
                            616 ;	---------------------------------
                            617 ; Function dibujarCuchillo
                            618 ; ---------------------------------
   552D                     619 _dibujarCuchillo::
   552D DD E5         [15]  620 	push	ix
   552F DD 21 00 00   [14]  621 	ld	ix,#0
   5533 DD 39         [15]  622 	add	ix,sp
   5535 F5            [11]  623 	push	af
   5536 F5            [11]  624 	push	af
                            625 ;src/main.c:190: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, actual->x, actual->y);
   5537 DD 5E 04      [19]  626 	ld	e,4 (ix)
   553A DD 56 05      [19]  627 	ld	d,5 (ix)
   553D 6B            [ 4]  628 	ld	l, e
   553E 62            [ 4]  629 	ld	h, d
   553F 23            [ 6]  630 	inc	hl
   5540 46            [ 7]  631 	ld	b,(hl)
   5541 1A            [ 7]  632 	ld	a,(de)
   5542 D5            [11]  633 	push	de
   5543 C5            [11]  634 	push	bc
   5544 33            [ 6]  635 	inc	sp
   5545 F5            [11]  636 	push	af
   5546 33            [ 6]  637 	inc	sp
   5547 21 00 C0      [10]  638 	ld	hl,#0xC000
   554A E5            [11]  639 	push	hl
   554B CD DF 51      [17]  640 	call	_cpct_getScreenPtr
   554E D1            [10]  641 	pop	de
   554F E5            [11]  642 	push	hl
   5550 FD E1         [14]  643 	pop	iy
                            644 ;src/main.c:191: if(actual->eje == E_X){
   5552 6B            [ 4]  645 	ld	l, e
   5553 62            [ 4]  646 	ld	h, d
   5554 01 08 00      [10]  647 	ld	bc, #0x0008
   5557 09            [11]  648 	add	hl, bc
   5558 4E            [ 7]  649 	ld	c,(hl)
                            650 ;src/main.c:192: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   5559 FD E5         [15]  651 	push	iy
   555B F1            [10]  652 	pop	af
   555C DD 77 FF      [19]  653 	ld	-1 (ix),a
   555F FD E5         [15]  654 	push	iy
   5561 3B            [ 6]  655 	dec	sp
   5562 F1            [10]  656 	pop	af
   5563 33            [ 6]  657 	inc	sp
   5564 DD 77 FE      [19]  658 	ld	-2 (ix),a
   5567 21 04 00      [10]  659 	ld	hl,#0x0004
   556A 19            [11]  660 	add	hl,de
   556B E3            [19]  661 	ex	(sp), hl
                            662 ;src/main.c:191: if(actual->eje == E_X){
   556C 79            [ 4]  663 	ld	a,c
   556D B7            [ 4]  664 	or	a, a
   556E 20 1A         [12]  665 	jr	NZ,00104$
                            666 ;src/main.c:192: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   5570 11 00 3E      [10]  667 	ld	de,#_g_tablatrans+0
   5573 E1            [10]  668 	pop	hl
   5574 E5            [11]  669 	push	hl
   5575 4E            [ 7]  670 	ld	c,(hl)
   5576 23            [ 6]  671 	inc	hl
   5577 46            [ 7]  672 	ld	b,(hl)
   5578 D5            [11]  673 	push	de
   5579 21 03 03      [10]  674 	ld	hl,#0x0303
   557C E5            [11]  675 	push	hl
   557D DD 6E FE      [19]  676 	ld	l,-2 (ix)
   5580 DD 66 FF      [19]  677 	ld	h,-1 (ix)
   5583 E5            [11]  678 	push	hl
   5584 C5            [11]  679 	push	bc
   5585 CD FF 51      [17]  680 	call	_cpct_drawSpriteMaskedAlignedTable
   5588 18 1B         [12]  681 	jr	00106$
   558A                     682 00104$:
                            683 ;src/main.c:195: else if(actual->eje == E_Y){
   558A 0D            [ 4]  684 	dec	c
   558B 20 18         [12]  685 	jr	NZ,00106$
                            686 ;src/main.c:196: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   558D 11 00 3E      [10]  687 	ld	de,#_g_tablatrans+0
   5590 E1            [10]  688 	pop	hl
   5591 E5            [11]  689 	push	hl
   5592 4E            [ 7]  690 	ld	c,(hl)
   5593 23            [ 6]  691 	inc	hl
   5594 46            [ 7]  692 	ld	b,(hl)
   5595 D5            [11]  693 	push	de
   5596 21 02 06      [10]  694 	ld	hl,#0x0602
   5599 E5            [11]  695 	push	hl
   559A DD 6E FE      [19]  696 	ld	l,-2 (ix)
   559D DD 66 FF      [19]  697 	ld	h,-1 (ix)
   55A0 E5            [11]  698 	push	hl
   55A1 C5            [11]  699 	push	bc
   55A2 CD FF 51      [17]  700 	call	_cpct_drawSpriteMaskedAlignedTable
   55A5                     701 00106$:
   55A5 DD F9         [10]  702 	ld	sp, ix
   55A7 DD E1         [14]  703 	pop	ix
   55A9 C9            [10]  704 	ret
                            705 ;src/main.c:200: void borrarCuchillo(TKnife* actual) {
                            706 ;	---------------------------------
                            707 ; Function borrarCuchillo
                            708 ; ---------------------------------
   55AA                     709 _borrarCuchillo::
   55AA DD E5         [15]  710 	push	ix
   55AC DD 21 00 00   [14]  711 	ld	ix,#0
   55B0 DD 39         [15]  712 	add	ix,sp
   55B2 3B            [ 6]  713 	dec	sp
                            714 ;src/main.c:201: u8 w = 2 + (actual->px & 1);
   55B3 DD 5E 04      [19]  715 	ld	e,4 (ix)
   55B6 DD 56 05      [19]  716 	ld	d,5 (ix)
   55B9 6B            [ 4]  717 	ld	l, e
   55BA 62            [ 4]  718 	ld	h, d
   55BB 23            [ 6]  719 	inc	hl
   55BC 23            [ 6]  720 	inc	hl
   55BD 4E            [ 7]  721 	ld	c,(hl)
   55BE 79            [ 4]  722 	ld	a,c
   55BF E6 01         [ 7]  723 	and	a, #0x01
   55C1 47            [ 4]  724 	ld	b,a
   55C2 04            [ 4]  725 	inc	b
   55C3 04            [ 4]  726 	inc	b
                            727 ;src/main.c:202: u8 h = 2 + (actual->py & 3 ? 1 : 0);
   55C4 EB            [ 4]  728 	ex	de,hl
   55C5 23            [ 6]  729 	inc	hl
   55C6 23            [ 6]  730 	inc	hl
   55C7 23            [ 6]  731 	inc	hl
   55C8 5E            [ 7]  732 	ld	e,(hl)
   55C9 7B            [ 4]  733 	ld	a,e
   55CA E6 03         [ 7]  734 	and	a, #0x03
   55CC 28 04         [12]  735 	jr	Z,00103$
   55CE 3E 01         [ 7]  736 	ld	a,#0x01
   55D0 18 02         [12]  737 	jr	00104$
   55D2                     738 00103$:
   55D2 3E 00         [ 7]  739 	ld	a,#0x00
   55D4                     740 00104$:
   55D4 C6 02         [ 7]  741 	add	a, #0x02
   55D6 DD 77 FF      [19]  742 	ld	-1 (ix),a
                            743 ;src/main.c:203: cpct_etm_drawTileBox2x4 (actual->px / 2, (actual->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   55D9 FD 2A 9E 52   [20]  744 	ld	iy,(_mapa)
   55DD 16 00         [ 7]  745 	ld	d,#0x00
   55DF 63            [ 4]  746 	ld	h,e
   55E0 6A            [ 4]  747 	ld	l,d
   55E1 CB 7A         [ 8]  748 	bit	7, d
   55E3 28 05         [12]  749 	jr	Z,00105$
   55E5 13            [ 6]  750 	inc	de
   55E6 13            [ 6]  751 	inc	de
   55E7 13            [ 6]  752 	inc	de
   55E8 63            [ 4]  753 	ld	h,e
   55E9 6A            [ 4]  754 	ld	l,d
   55EA                     755 00105$:
   55EA 5C            [ 4]  756 	ld	e, h
   55EB 55            [ 4]  757 	ld	d, l
   55EC CB 2A         [ 8]  758 	sra	d
   55EE CB 1B         [ 8]  759 	rr	e
   55F0 CB 2A         [ 8]  760 	sra	d
   55F2 CB 1B         [ 8]  761 	rr	e
   55F4 51            [ 4]  762 	ld	d,c
   55F5 CB 3A         [ 8]  763 	srl	d
   55F7 FD E5         [15]  764 	push	iy
   55F9 21 00 C0      [10]  765 	ld	hl,#0xC000
   55FC E5            [11]  766 	push	hl
   55FD 3E 28         [ 7]  767 	ld	a,#0x28
   55FF F5            [11]  768 	push	af
   5600 33            [ 6]  769 	inc	sp
   5601 DD 7E FF      [19]  770 	ld	a,-1 (ix)
   5604 F5            [11]  771 	push	af
   5605 33            [ 6]  772 	inc	sp
   5606 C5            [11]  773 	push	bc
   5607 33            [ 6]  774 	inc	sp
   5608 7B            [ 4]  775 	ld	a,e
   5609 F5            [11]  776 	push	af
   560A 33            [ 6]  777 	inc	sp
   560B D5            [11]  778 	push	de
   560C 33            [ 6]  779 	inc	sp
   560D CD 3B 48      [17]  780 	call	_cpct_etm_drawTileBox2x4
   5610 33            [ 6]  781 	inc	sp
   5611 DD E1         [14]  782 	pop	ix
   5613 C9            [10]  783 	ret
                            784 ;src/main.c:206: void redibujarCuchillo(TKnife* actual) {
                            785 ;	---------------------------------
                            786 ; Function redibujarCuchillo
                            787 ; ---------------------------------
   5614                     788 _redibujarCuchillo::
   5614 DD E5         [15]  789 	push	ix
   5616 DD 21 00 00   [14]  790 	ld	ix,#0
   561A DD 39         [15]  791 	add	ix,sp
                            792 ;src/main.c:207: borrarCuchillo(actual);
   561C DD 6E 04      [19]  793 	ld	l,4 (ix)
   561F DD 66 05      [19]  794 	ld	h,5 (ix)
   5622 E5            [11]  795 	push	hl
   5623 CD AA 55      [17]  796 	call	_borrarCuchillo
   5626 F1            [10]  797 	pop	af
                            798 ;src/main.c:208: actual->px = actual->x;
   5627 DD 4E 04      [19]  799 	ld	c,4 (ix)
   562A DD 46 05      [19]  800 	ld	b,5 (ix)
   562D 59            [ 4]  801 	ld	e, c
   562E 50            [ 4]  802 	ld	d, b
   562F 13            [ 6]  803 	inc	de
   5630 13            [ 6]  804 	inc	de
   5631 0A            [ 7]  805 	ld	a,(bc)
   5632 12            [ 7]  806 	ld	(de),a
                            807 ;src/main.c:209: actual->py = actual->y;
   5633 59            [ 4]  808 	ld	e, c
   5634 50            [ 4]  809 	ld	d, b
   5635 13            [ 6]  810 	inc	de
   5636 13            [ 6]  811 	inc	de
   5637 13            [ 6]  812 	inc	de
   5638 69            [ 4]  813 	ld	l, c
   5639 60            [ 4]  814 	ld	h, b
   563A 23            [ 6]  815 	inc	hl
   563B 7E            [ 7]  816 	ld	a,(hl)
   563C 12            [ 7]  817 	ld	(de),a
                            818 ;src/main.c:210: dibujarCuchillo(actual);
   563D C5            [11]  819 	push	bc
   563E CD 2D 55      [17]  820 	call	_dibujarCuchillo
   5641 F1            [10]  821 	pop	af
   5642 DD E1         [14]  822 	pop	ix
   5644 C9            [10]  823 	ret
                            824 ;src/main.c:214: void lanzarCuchillo(){
                            825 ;	---------------------------------
                            826 ; Function lanzarCuchillo
                            827 ; ---------------------------------
   5645                     828 _lanzarCuchillo::
   5645 DD E5         [15]  829 	push	ix
   5647 DD 21 00 00   [14]  830 	ld	ix,#0
   564B DD 39         [15]  831 	add	ix,sp
   564D 21 FA FF      [10]  832 	ld	hl,#-6
   5650 39            [11]  833 	add	hl,sp
   5651 F9            [ 6]  834 	ld	sp,hl
                            835 ;src/main.c:216: TKnife* actual = cu;
   5652 01 44 52      [10]  836 	ld	bc,#_cu+0
                            837 ;src/main.c:219: while(i>0 && actual->lanzado){
   5655 1E 0A         [ 7]  838 	ld	e,#0x0A
   5657                     839 00102$:
   5657 21 06 00      [10]  840 	ld	hl,#0x0006
   565A 09            [11]  841 	add	hl,bc
   565B DD 75 FE      [19]  842 	ld	-2 (ix),l
   565E DD 74 FF      [19]  843 	ld	-1 (ix),h
   5661 7B            [ 4]  844 	ld	a,e
   5662 B7            [ 4]  845 	or	a, a
   5663 28 13         [12]  846 	jr	Z,00104$
   5665 DD 6E FE      [19]  847 	ld	l,-2 (ix)
   5668 DD 66 FF      [19]  848 	ld	h,-1 (ix)
   566B 7E            [ 7]  849 	ld	a,(hl)
   566C B7            [ 4]  850 	or	a, a
   566D 28 09         [12]  851 	jr	Z,00104$
                            852 ;src/main.c:220: --i;
   566F 1D            [ 4]  853 	dec	e
                            854 ;src/main.c:221: actual++;
   5670 21 09 00      [10]  855 	ld	hl,#0x0009
   5673 09            [11]  856 	add	hl,bc
   5674 4D            [ 4]  857 	ld	c,l
   5675 44            [ 4]  858 	ld	b,h
   5676 18 DF         [12]  859 	jr	00102$
   5678                     860 00104$:
                            861 ;src/main.c:224: if(i>0 && !actual->lanzado){
   5678 7B            [ 4]  862 	ld	a,e
   5679 B7            [ 4]  863 	or	a, a
   567A CA E7 57      [10]  864 	jp	Z,00127$
   567D DD 6E FE      [19]  865 	ld	l,-2 (ix)
   5680 DD 66 FF      [19]  866 	ld	h,-1 (ix)
   5683 7E            [ 7]  867 	ld	a,(hl)
   5684 B7            [ 4]  868 	or	a, a
   5685 C2 E7 57      [10]  869 	jp	NZ,00127$
                            870 ;src/main.c:226: if(prota.mira == M_derecha){
   5688 21 43 52      [10]  871 	ld	hl, #_prota + 7
   568B 6E            [ 7]  872 	ld	l,(hl)
                            873 ;src/main.c:229: actual->direccion = M_derecha;
   568C FD 21 07 00   [14]  874 	ld	iy,#0x0007
   5690 FD 09         [15]  875 	add	iy, bc
                            876 ;src/main.c:231: actual->y=prota.y + G_HERO_H /2;
   5692 59            [ 4]  877 	ld	e, c
   5693 50            [ 4]  878 	ld	d, b
   5694 13            [ 6]  879 	inc	de
                            880 ;src/main.c:232: actual->sprite=g_knifeX_0;
   5695 79            [ 4]  881 	ld	a,c
   5696 C6 04         [ 7]  882 	add	a, #0x04
   5698 DD 77 FC      [19]  883 	ld	-4 (ix),a
   569B 78            [ 4]  884 	ld	a,b
   569C CE 00         [ 7]  885 	adc	a, #0x00
   569E DD 77 FD      [19]  886 	ld	-3 (ix),a
                            887 ;src/main.c:233: actual->eje = E_X;
   56A1 79            [ 4]  888 	ld	a,c
   56A2 C6 08         [ 7]  889 	add	a, #0x08
   56A4 DD 77 FA      [19]  890 	ld	-6 (ix),a
   56A7 78            [ 4]  891 	ld	a,b
   56A8 CE 00         [ 7]  892 	adc	a, #0x00
   56AA DD 77 FB      [19]  893 	ld	-5 (ix),a
                            894 ;src/main.c:226: if(prota.mira == M_derecha){
   56AD 7D            [ 4]  895 	ld	a,l
   56AE B7            [ 4]  896 	or	a, a
   56AF 20 4F         [12]  897 	jr	NZ,00122$
                            898 ;src/main.c:227: if( (LIMITE_DERECHO - (prota.x + G_HERO_W) ) >= G_KNIFEX_0_W + 1){
   56B1 21 3C 52      [10]  899 	ld	hl, #_prota + 0
   56B4 6E            [ 7]  900 	ld	l,(hl)
   56B5 26 00         [ 7]  901 	ld	h,#0x00
   56B7 D5            [11]  902 	push	de
   56B8 11 07 00      [10]  903 	ld	de,#0x0007
   56BB 19            [11]  904 	add	hl, de
   56BC D1            [10]  905 	pop	de
   56BD 3E 4C         [ 7]  906 	ld	a,#0x4C
   56BF 95            [ 4]  907 	sub	a, l
   56C0 6F            [ 4]  908 	ld	l,a
   56C1 3E 00         [ 7]  909 	ld	a,#0x00
   56C3 9C            [ 4]  910 	sbc	a, h
   56C4 67            [ 4]  911 	ld	h,a
   56C5 7D            [ 4]  912 	ld	a,l
   56C6 D6 04         [ 7]  913 	sub	a, #0x04
   56C8 7C            [ 4]  914 	ld	a,h
   56C9 17            [ 4]  915 	rla
   56CA 3F            [ 4]  916 	ccf
   56CB 1F            [ 4]  917 	rra
   56CC DE 80         [ 7]  918 	sbc	a, #0x80
   56CE DA E7 57      [10]  919 	jp	C,00127$
                            920 ;src/main.c:228: actual->lanzado = SI;
   56D1 DD 6E FE      [19]  921 	ld	l,-2 (ix)
   56D4 DD 66 FF      [19]  922 	ld	h,-1 (ix)
   56D7 36 01         [10]  923 	ld	(hl),#0x01
                            924 ;src/main.c:229: actual->direccion = M_derecha;
   56D9 FD 36 00 00   [19]  925 	ld	0 (iy), #0x00
                            926 ;src/main.c:230: actual->x=prota.x + G_HERO_W;
   56DD 3A 3C 52      [13]  927 	ld	a, (#_prota + 0)
   56E0 C6 07         [ 7]  928 	add	a, #0x07
   56E2 02            [ 7]  929 	ld	(bc),a
                            930 ;src/main.c:231: actual->y=prota.y + G_HERO_H /2;
   56E3 3A 3D 52      [13]  931 	ld	a, (#(_prota + 0x0001) + 0)
   56E6 C6 0B         [ 7]  932 	add	a, #0x0B
   56E8 12            [ 7]  933 	ld	(de),a
                            934 ;src/main.c:232: actual->sprite=g_knifeX_0;
   56E9 DD 6E FC      [19]  935 	ld	l,-4 (ix)
   56EC DD 66 FD      [19]  936 	ld	h,-3 (ix)
   56EF 36 F8         [10]  937 	ld	(hl),#<(_g_knifeX_0)
   56F1 23            [ 6]  938 	inc	hl
   56F2 36 46         [10]  939 	ld	(hl),#>(_g_knifeX_0)
                            940 ;src/main.c:233: actual->eje = E_X;
   56F4 E1            [10]  941 	pop	hl
   56F5 E5            [11]  942 	push	hl
   56F6 36 00         [10]  943 	ld	(hl),#0x00
                            944 ;src/main.c:234: dibujarCuchillo(actual);
   56F8 C5            [11]  945 	push	bc
   56F9 CD 2D 55      [17]  946 	call	_dibujarCuchillo
   56FC F1            [10]  947 	pop	af
   56FD C3 E7 57      [10]  948 	jp	00127$
   5700                     949 00122$:
                            950 ;src/main.c:237: else if(prota.mira == M_izquierda){
   5700 7D            [ 4]  951 	ld	a,l
   5701 3D            [ 4]  952 	dec	a
   5702 20 49         [12]  953 	jr	NZ,00119$
                            954 ;src/main.c:238: if( (prota.x - 4 ) >= G_KNIFEX_1_W + 1){
   5704 21 3C 52      [10]  955 	ld	hl, #_prota + 0
   5707 6E            [ 7]  956 	ld	l,(hl)
   5708 26 00         [ 7]  957 	ld	h,#0x00
   570A 7D            [ 4]  958 	ld	a,l
   570B C6 FC         [ 7]  959 	add	a,#0xFC
   570D 6F            [ 4]  960 	ld	l,a
   570E 7C            [ 4]  961 	ld	a,h
   570F CE FF         [ 7]  962 	adc	a,#0xFF
   5711 67            [ 4]  963 	ld	h,a
   5712 7D            [ 4]  964 	ld	a,l
   5713 D6 04         [ 7]  965 	sub	a, #0x04
   5715 7C            [ 4]  966 	ld	a,h
   5716 17            [ 4]  967 	rla
   5717 3F            [ 4]  968 	ccf
   5718 1F            [ 4]  969 	rra
   5719 DE 80         [ 7]  970 	sbc	a, #0x80
   571B DA E7 57      [10]  971 	jp	C,00127$
                            972 ;src/main.c:239: actual->lanzado = SI;
   571E DD 6E FE      [19]  973 	ld	l,-2 (ix)
   5721 DD 66 FF      [19]  974 	ld	h,-1 (ix)
   5724 36 01         [10]  975 	ld	(hl),#0x01
                            976 ;src/main.c:240: actual->direccion = M_izquierda;
   5726 FD 36 00 01   [19]  977 	ld	0 (iy), #0x01
                            978 ;src/main.c:241: actual->x = prota.x - G_KNIFEX_0_W;
   572A 3A 3C 52      [13]  979 	ld	a, (#_prota + 0)
   572D C6 FD         [ 7]  980 	add	a,#0xFD
   572F 02            [ 7]  981 	ld	(bc),a
                            982 ;src/main.c:242: actual->y = prota.y + G_HERO_H /2;
   5730 3A 3D 52      [13]  983 	ld	a, (#(_prota + 0x0001) + 0)
   5733 C6 0B         [ 7]  984 	add	a, #0x0B
   5735 12            [ 7]  985 	ld	(de),a
                            986 ;src/main.c:243: actual->sprite = g_knifeX_1;
   5736 DD 6E FC      [19]  987 	ld	l,-4 (ix)
   5739 DD 66 FD      [19]  988 	ld	h,-3 (ix)
   573C 36 01         [10]  989 	ld	(hl),#<(_g_knifeX_1)
   573E 23            [ 6]  990 	inc	hl
   573F 36 47         [10]  991 	ld	(hl),#>(_g_knifeX_1)
                            992 ;src/main.c:244: actual->eje = E_X;
   5741 E1            [10]  993 	pop	hl
   5742 E5            [11]  994 	push	hl
   5743 36 00         [10]  995 	ld	(hl),#0x00
                            996 ;src/main.c:245: dibujarCuchillo(actual);
   5745 C5            [11]  997 	push	bc
   5746 CD 2D 55      [17]  998 	call	_dibujarCuchillo
   5749 F1            [10]  999 	pop	af
   574A C3 E7 57      [10] 1000 	jp	00127$
   574D                    1001 00119$:
                           1002 ;src/main.c:248: else if(prota.mira == M_abajo){
   574D 7D            [ 4] 1003 	ld	a,l
   574E D6 03         [ 7] 1004 	sub	a, #0x03
   5750 20 4D         [12] 1005 	jr	NZ,00116$
                           1006 ;src/main.c:250: if((valor - (prota.y + G_HERO_H)) >= G_KNIFEY_0_H + 1){
   5752 21 3D 52      [10] 1007 	ld	hl, #(_prota + 0x0001) + 0
   5755 6E            [ 7] 1008 	ld	l,(hl)
   5756 26 00         [ 7] 1009 	ld	h,#0x00
   5758 D5            [11] 1010 	push	de
   5759 11 16 00      [10] 1011 	ld	de,#0x0016
   575C 19            [11] 1012 	add	hl, de
   575D D1            [10] 1013 	pop	de
   575E 3E A8         [ 7] 1014 	ld	a,#0xA8
   5760 95            [ 4] 1015 	sub	a, l
   5761 6F            [ 4] 1016 	ld	l,a
   5762 3E 00         [ 7] 1017 	ld	a,#0x00
   5764 9C            [ 4] 1018 	sbc	a, h
   5765 67            [ 4] 1019 	ld	h,a
   5766 7D            [ 4] 1020 	ld	a,l
   5767 D6 07         [ 7] 1021 	sub	a, #0x07
   5769 7C            [ 4] 1022 	ld	a,h
   576A 17            [ 4] 1023 	rla
   576B 3F            [ 4] 1024 	ccf
   576C 1F            [ 4] 1025 	rra
   576D DE 80         [ 7] 1026 	sbc	a, #0x80
   576F 38 76         [12] 1027 	jr	C,00127$
                           1028 ;src/main.c:251: actual->lanzado = SI;
   5771 DD 6E FE      [19] 1029 	ld	l,-2 (ix)
   5774 DD 66 FF      [19] 1030 	ld	h,-1 (ix)
   5777 36 01         [10] 1031 	ld	(hl),#0x01
                           1032 ;src/main.c:252: actual->direccion = M_abajo;
   5779 FD 36 00 03   [19] 1033 	ld	0 (iy), #0x03
                           1034 ;src/main.c:253: actual->x = prota.x + G_HERO_W / 2;
   577D 3A 3C 52      [13] 1035 	ld	a, (#_prota + 0)
   5780 C6 03         [ 7] 1036 	add	a, #0x03
   5782 02            [ 7] 1037 	ld	(bc),a
                           1038 ;src/main.c:254: actual->y = prota.y + G_HERO_H;
   5783 3A 3D 52      [13] 1039 	ld	a, (#(_prota + 0x0001) + 0)
   5786 C6 16         [ 7] 1040 	add	a, #0x16
   5788 12            [ 7] 1041 	ld	(de),a
                           1042 ;src/main.c:255: actual->sprite = g_knifeY_0;
   5789 DD 6E FC      [19] 1043 	ld	l,-4 (ix)
   578C DD 66 FD      [19] 1044 	ld	h,-3 (ix)
   578F 36 E0         [10] 1045 	ld	(hl),#<(_g_knifeY_0)
   5791 23            [ 6] 1046 	inc	hl
   5792 36 46         [10] 1047 	ld	(hl),#>(_g_knifeY_0)
                           1048 ;src/main.c:256: actual->eje = E_Y;
   5794 E1            [10] 1049 	pop	hl
   5795 E5            [11] 1050 	push	hl
   5796 36 01         [10] 1051 	ld	(hl),#0x01
                           1052 ;src/main.c:257: dibujarCuchillo(actual);
   5798 C5            [11] 1053 	push	bc
   5799 CD 2D 55      [17] 1054 	call	_dibujarCuchillo
   579C F1            [10] 1055 	pop	af
   579D 18 48         [12] 1056 	jr	00127$
   579F                    1057 00116$:
                           1058 ;src/main.c:260: else if(prota.mira == M_arriba){
   579F 7D            [ 4] 1059 	ld	a,l
   57A0 D6 02         [ 7] 1060 	sub	a, #0x02
   57A2 20 43         [12] 1061 	jr	NZ,00127$
                           1062 ;src/main.c:261: if((prota.y - 8)>= G_KNIFEY_0_H +1 ){
   57A4 21 3D 52      [10] 1063 	ld	hl, #(_prota + 0x0001) + 0
   57A7 6E            [ 7] 1064 	ld	l,(hl)
   57A8 26 00         [ 7] 1065 	ld	h,#0x00
   57AA 7D            [ 4] 1066 	ld	a,l
   57AB C6 F8         [ 7] 1067 	add	a,#0xF8
   57AD 6F            [ 4] 1068 	ld	l,a
   57AE 7C            [ 4] 1069 	ld	a,h
   57AF CE FF         [ 7] 1070 	adc	a,#0xFF
   57B1 67            [ 4] 1071 	ld	h,a
   57B2 7D            [ 4] 1072 	ld	a,l
   57B3 D6 07         [ 7] 1073 	sub	a, #0x07
   57B5 7C            [ 4] 1074 	ld	a,h
   57B6 17            [ 4] 1075 	rla
   57B7 3F            [ 4] 1076 	ccf
   57B8 1F            [ 4] 1077 	rra
   57B9 DE 80         [ 7] 1078 	sbc	a, #0x80
   57BB 38 2A         [12] 1079 	jr	C,00127$
                           1080 ;src/main.c:262: actual->lanzado = SI;
   57BD DD 6E FE      [19] 1081 	ld	l,-2 (ix)
   57C0 DD 66 FF      [19] 1082 	ld	h,-1 (ix)
   57C3 36 01         [10] 1083 	ld	(hl),#0x01
                           1084 ;src/main.c:263: actual->direccion = M_arriba;
   57C5 FD 36 00 02   [19] 1085 	ld	0 (iy), #0x02
                           1086 ;src/main.c:264: actual->x = prota.x + G_HERO_W / 2;
   57C9 3A 3C 52      [13] 1087 	ld	a, (#_prota + 0)
   57CC C6 03         [ 7] 1088 	add	a, #0x03
   57CE 02            [ 7] 1089 	ld	(bc),a
                           1090 ;src/main.c:265: actual->y = prota.y;
   57CF 3A 3D 52      [13] 1091 	ld	a, (#(_prota + 0x0001) + 0)
   57D2 12            [ 7] 1092 	ld	(de),a
                           1093 ;src/main.c:266: actual->sprite = g_knifeY_1;
   57D3 DD 6E FC      [19] 1094 	ld	l,-4 (ix)
   57D6 DD 66 FD      [19] 1095 	ld	h,-3 (ix)
   57D9 36 EC         [10] 1096 	ld	(hl),#<(_g_knifeY_1)
   57DB 23            [ 6] 1097 	inc	hl
   57DC 36 46         [10] 1098 	ld	(hl),#>(_g_knifeY_1)
                           1099 ;src/main.c:267: actual->eje = E_Y;
   57DE E1            [10] 1100 	pop	hl
   57DF E5            [11] 1101 	push	hl
   57E0 36 01         [10] 1102 	ld	(hl),#0x01
                           1103 ;src/main.c:268: dibujarCuchillo(actual);
   57E2 C5            [11] 1104 	push	bc
   57E3 CD 2D 55      [17] 1105 	call	_dibujarCuchillo
   57E6 F1            [10] 1106 	pop	af
   57E7                    1107 00127$:
   57E7 DD F9         [10] 1108 	ld	sp, ix
   57E9 DD E1         [14] 1109 	pop	ix
   57EB C9            [10] 1110 	ret
                           1111 ;src/main.c:274: void comprobarTeclado() {
                           1112 ;	---------------------------------
                           1113 ; Function comprobarTeclado
                           1114 ; ---------------------------------
   57EC                    1115 _comprobarTeclado::
                           1116 ;src/main.c:275: cpct_scanKeyboard_if();
   57EC CD 06 49      [17] 1117 	call	_cpct_scanKeyboard_if
                           1118 ;src/main.c:277: if (cpct_isAnyKeyPressed()) {
   57EF CD F9 48      [17] 1119 	call	_cpct_isAnyKeyPressed
   57F2 7D            [ 4] 1120 	ld	a,l
   57F3 B7            [ 4] 1121 	or	a, a
   57F4 C8            [11] 1122 	ret	Z
                           1123 ;src/main.c:278: if (cpct_isKeyPressed(Key_CursorLeft))
   57F5 21 01 01      [10] 1124 	ld	hl,#0x0101
   57F8 CD 2F 48      [17] 1125 	call	_cpct_isKeyPressed
   57FB 7D            [ 4] 1126 	ld	a,l
   57FC B7            [ 4] 1127 	or	a, a
                           1128 ;src/main.c:279: moverIzquierda();
   57FD C2 B8 54      [10] 1129 	jp	NZ,_moverIzquierda
                           1130 ;src/main.c:280: else if (cpct_isKeyPressed(Key_CursorRight))
   5800 21 00 02      [10] 1131 	ld	hl,#0x0200
   5803 CD 2F 48      [17] 1132 	call	_cpct_isKeyPressed
   5806 7D            [ 4] 1133 	ld	a,l
   5807 B7            [ 4] 1134 	or	a, a
                           1135 ;src/main.c:281: moverDerecha();
   5808 C2 D7 54      [10] 1136 	jp	NZ,_moverDerecha
                           1137 ;src/main.c:282: else if (cpct_isKeyPressed(Key_CursorUp))
   580B 21 00 01      [10] 1138 	ld	hl,#0x0100
   580E CD 2F 48      [17] 1139 	call	_cpct_isKeyPressed
   5811 7D            [ 4] 1140 	ld	a,l
   5812 B7            [ 4] 1141 	or	a, a
                           1142 ;src/main.c:283: moverArriba();
   5813 C2 F5 54      [10] 1143 	jp	NZ,_moverArriba
                           1144 ;src/main.c:284: else if (cpct_isKeyPressed(Key_CursorDown))
   5816 21 00 04      [10] 1145 	ld	hl,#0x0400
   5819 CD 2F 48      [17] 1146 	call	_cpct_isKeyPressed
   581C 7D            [ 4] 1147 	ld	a,l
   581D B7            [ 4] 1148 	or	a, a
                           1149 ;src/main.c:285: moverAbajo();
   581E C2 11 55      [10] 1150 	jp	NZ,_moverAbajo
                           1151 ;src/main.c:286: else if (cpct_isKeyPressed(Key_Space))
   5821 21 05 80      [10] 1152 	ld	hl,#0x8005
   5824 CD 2F 48      [17] 1153 	call	_cpct_isKeyPressed
   5827 7D            [ 4] 1154 	ld	a,l
   5828 B7            [ 4] 1155 	or	a, a
   5829 C8            [11] 1156 	ret	Z
                           1157 ;src/main.c:287: lanzarCuchillo();
   582A C3 45 56      [10] 1158 	jp  _lanzarCuchillo
                           1159 ;src/main.c:293: void moverCuchillo(){
                           1160 ;	---------------------------------
                           1161 ; Function moverCuchillo
                           1162 ; ---------------------------------
   582D                    1163 _moverCuchillo::
   582D DD E5         [15] 1164 	push	ix
   582F DD 21 00 00   [14] 1165 	ld	ix,#0
   5833 DD 39         [15] 1166 	add	ix,sp
   5835 3B            [ 6] 1167 	dec	sp
                           1168 ;src/main.c:295: u8 i = 10 + 1;
   5836 DD 36 FF 0B   [19] 1169 	ld	-1 (ix),#0x0B
                           1170 ;src/main.c:296: TKnife* actual = cu;
   583A 11 44 52      [10] 1171 	ld	de,#_cu+0
                           1172 ;src/main.c:298: while(--i){
   583D                    1173 00134$:
   583D DD 35 FF      [23] 1174 	dec	-1 (ix)
   5840 DD 7E FF      [19] 1175 	ld	a, -1 (ix)
   5843 B7            [ 4] 1176 	or	a, a
   5844 CA 21 59      [10] 1177 	jp	Z,00137$
                           1178 ;src/main.c:299: if(actual->lanzado){
   5847 21 06 00      [10] 1179 	ld	hl,#0x0006
   584A 19            [11] 1180 	add	hl,de
   584B 4D            [ 4] 1181 	ld	c,l
   584C 44            [ 4] 1182 	ld	b,h
   584D 0A            [ 7] 1183 	ld	a,(bc)
   584E B7            [ 4] 1184 	or	a, a
   584F CA 19 59      [10] 1185 	jp	Z,00133$
                           1186 ;src/main.c:300: if(actual->direccion == M_derecha){
   5852 D5            [11] 1187 	push	de
   5853 FD E1         [14] 1188 	pop	iy
   5855 FD 6E 07      [19] 1189 	ld	l,7 (iy)
   5858 7D            [ 4] 1190 	ld	a,l
   5859 B7            [ 4] 1191 	or	a, a
   585A 20 29         [12] 1192 	jr	NZ,00130$
                           1193 ;src/main.c:301: if(actual->x< LIMITE_DERECHO - G_KNIFEX_0_W){
   585C 1A            [ 7] 1194 	ld	a,(de)
   585D 6F            [ 4] 1195 	ld	l,a
   585E D6 49         [ 7] 1196 	sub	a, #0x49
   5860 3E 00         [ 7] 1197 	ld	a,#0x00
   5862 17            [ 4] 1198 	rla
   5863 B7            [ 4] 1199 	or	a, a
   5864 28 0D         [12] 1200 	jr	Z,00104$
                           1201 ;src/main.c:302: actual->x++;
   5866 7D            [ 4] 1202 	ld	a,l
   5867 3C            [ 4] 1203 	inc	a
   5868 12            [ 7] 1204 	ld	(de),a
                           1205 ;src/main.c:304: redibujarCuchillo(actual);
   5869 D5            [11] 1206 	push	de
   586A D5            [11] 1207 	push	de
   586B CD 14 56      [17] 1208 	call	_redibujarCuchillo
   586E F1            [10] 1209 	pop	af
   586F D1            [10] 1210 	pop	de
   5870 C3 19 59      [10] 1211 	jp	00133$
   5873                    1212 00104$:
                           1213 ;src/main.c:306: else if(actual->x >= LIMITE_DERECHO  - G_KNIFEX_0_W){
   5873 B7            [ 4] 1214 	or	a, a
   5874 C2 19 59      [10] 1215 	jp	NZ,00133$
                           1216 ;src/main.c:307: borrarCuchillo(actual);
   5877 C5            [11] 1217 	push	bc
   5878 D5            [11] 1218 	push	de
   5879 D5            [11] 1219 	push	de
   587A CD AA 55      [17] 1220 	call	_borrarCuchillo
   587D F1            [10] 1221 	pop	af
   587E D1            [10] 1222 	pop	de
   587F C1            [10] 1223 	pop	bc
                           1224 ;src/main.c:308: actual->lanzado = NO;
   5880 AF            [ 4] 1225 	xor	a, a
   5881 02            [ 7] 1226 	ld	(bc),a
   5882 C3 19 59      [10] 1227 	jp	00133$
   5885                    1228 00130$:
                           1229 ;src/main.c:311: else if(actual->direccion == M_izquierda){
   5885 7D            [ 4] 1230 	ld	a,l
   5886 3D            [ 4] 1231 	dec	a
   5887 20 29         [12] 1232 	jr	NZ,00127$
                           1233 ;src/main.c:301: if(actual->x< LIMITE_DERECHO - G_KNIFEX_0_W){
   5889 1A            [ 7] 1234 	ld	a,(de)
   588A 6F            [ 4] 1235 	ld	l,a
                           1236 ;src/main.c:312: if(actual->x > LIMITE_IZQUIERDO){
   588B 3E 04         [ 7] 1237 	ld	a,#0x04
   588D 95            [ 4] 1238 	sub	a, l
   588E 3E 00         [ 7] 1239 	ld	a,#0x00
   5890 17            [ 4] 1240 	rla
   5891 B7            [ 4] 1241 	or	a, a
   5892 28 0E         [12] 1242 	jr	Z,00109$
                           1243 ;src/main.c:313: actual->x--;
   5894 4D            [ 4] 1244 	ld	c,l
   5895 0D            [ 4] 1245 	dec	c
   5896 79            [ 4] 1246 	ld	a,c
   5897 12            [ 7] 1247 	ld	(de),a
                           1248 ;src/main.c:315: redibujarCuchillo(actual);
   5898 D5            [11] 1249 	push	de
   5899 D5            [11] 1250 	push	de
   589A CD 14 56      [17] 1251 	call	_redibujarCuchillo
   589D F1            [10] 1252 	pop	af
   589E D1            [10] 1253 	pop	de
   589F C3 19 59      [10] 1254 	jp	00133$
   58A2                    1255 00109$:
                           1256 ;src/main.c:316: }else if(actual->x <= LIMITE_IZQUIERDO){
   58A2 B7            [ 4] 1257 	or	a, a
   58A3 20 74         [12] 1258 	jr	NZ,00133$
                           1259 ;src/main.c:317: borrarCuchillo(actual);
   58A5 C5            [11] 1260 	push	bc
   58A6 D5            [11] 1261 	push	de
   58A7 D5            [11] 1262 	push	de
   58A8 CD AA 55      [17] 1263 	call	_borrarCuchillo
   58AB F1            [10] 1264 	pop	af
   58AC D1            [10] 1265 	pop	de
   58AD C1            [10] 1266 	pop	bc
                           1267 ;src/main.c:318: actual->lanzado = NO;
   58AE AF            [ 4] 1268 	xor	a, a
   58AF 02            [ 7] 1269 	ld	(bc),a
   58B0 18 67         [12] 1270 	jr	00133$
   58B2                    1271 00127$:
                           1272 ;src/main.c:322: if(actual->y < LIMITE_INFERIOR - G_KNIFEY_0_H){
   58B2 D5            [11] 1273 	push	de
   58B3 FD E1         [14] 1274 	pop	iy
   58B5 FD 23         [10] 1275 	inc	iy
                           1276 ;src/main.c:321: else if(actual->direccion == M_abajo){
   58B7 7D            [ 4] 1277 	ld	a,l
   58B8 D6 03         [ 7] 1278 	sub	a, #0x03
   58BA 20 2D         [12] 1279 	jr	NZ,00124$
                           1280 ;src/main.c:322: if(actual->y < LIMITE_INFERIOR - G_KNIFEY_0_H){
   58BC FD 6E 00      [19] 1281 	ld	l, 0 (iy)
   58BF 7D            [ 4] 1282 	ld	a,l
   58C0 D6 A2         [ 7] 1283 	sub	a, #0xA2
   58C2 3E 00         [ 7] 1284 	ld	a,#0x00
   58C4 17            [ 4] 1285 	rla
   58C5 B7            [ 4] 1286 	or	a, a
   58C6 28 11         [12] 1287 	jr	Z,00114$
                           1288 ;src/main.c:323: actual->y++;
   58C8 2C            [ 4] 1289 	inc	l
   58C9 FD 75 00      [19] 1290 	ld	0 (iy), l
                           1291 ;src/main.c:324: actual->y++;
   58CC 2C            [ 4] 1292 	inc	l
   58CD FD 75 00      [19] 1293 	ld	0 (iy), l
                           1294 ;src/main.c:325: redibujarCuchillo(actual);
   58D0 D5            [11] 1295 	push	de
   58D1 D5            [11] 1296 	push	de
   58D2 CD 14 56      [17] 1297 	call	_redibujarCuchillo
   58D5 F1            [10] 1298 	pop	af
   58D6 D1            [10] 1299 	pop	de
   58D7 18 40         [12] 1300 	jr	00133$
   58D9                    1301 00114$:
                           1302 ;src/main.c:328: }else if(actual->y >= LIMITE_INFERIOR - G_KNIFEY_0_H ){
   58D9 B7            [ 4] 1303 	or	a, a
   58DA 20 3D         [12] 1304 	jr	NZ,00133$
                           1305 ;src/main.c:329: borrarCuchillo(actual);
   58DC C5            [11] 1306 	push	bc
   58DD D5            [11] 1307 	push	de
   58DE D5            [11] 1308 	push	de
   58DF CD AA 55      [17] 1309 	call	_borrarCuchillo
   58E2 F1            [10] 1310 	pop	af
   58E3 D1            [10] 1311 	pop	de
   58E4 C1            [10] 1312 	pop	bc
                           1313 ;src/main.c:330: actual->lanzado = NO;
   58E5 AF            [ 4] 1314 	xor	a, a
   58E6 02            [ 7] 1315 	ld	(bc),a
   58E7 18 30         [12] 1316 	jr	00133$
   58E9                    1317 00124$:
                           1318 ;src/main.c:333: else if(actual->direccion == M_arriba){
   58E9 7D            [ 4] 1319 	ld	a,l
   58EA D6 02         [ 7] 1320 	sub	a, #0x02
   58EC 20 2B         [12] 1321 	jr	NZ,00133$
                           1322 ;src/main.c:322: if(actual->y < LIMITE_INFERIOR - G_KNIFEY_0_H){
   58EE FD 6E 00      [19] 1323 	ld	l, 0 (iy)
                           1324 ;src/main.c:334: if(actual->y > LIMITE_SUPERIOR){
   58F1 3E 08         [ 7] 1325 	ld	a,#0x08
   58F3 95            [ 4] 1326 	sub	a, l
   58F4 3E 00         [ 7] 1327 	ld	a,#0x00
   58F6 17            [ 4] 1328 	rla
   58F7 B7            [ 4] 1329 	or	a, a
   58F8 28 11         [12] 1330 	jr	Z,00119$
                           1331 ;src/main.c:335: actual->y--;
   58FA 2D            [ 4] 1332 	dec	l
   58FB FD 75 00      [19] 1333 	ld	0 (iy), l
                           1334 ;src/main.c:336: actual->y--;
   58FE 2D            [ 4] 1335 	dec	l
   58FF FD 75 00      [19] 1336 	ld	0 (iy), l
                           1337 ;src/main.c:337: redibujarCuchillo(actual);
   5902 D5            [11] 1338 	push	de
   5903 D5            [11] 1339 	push	de
   5904 CD 14 56      [17] 1340 	call	_redibujarCuchillo
   5907 F1            [10] 1341 	pop	af
   5908 D1            [10] 1342 	pop	de
   5909 18 0E         [12] 1343 	jr	00133$
   590B                    1344 00119$:
                           1345 ;src/main.c:339: }else if(actual->y <= LIMITE_SUPERIOR){
   590B B7            [ 4] 1346 	or	a, a
   590C 20 0B         [12] 1347 	jr	NZ,00133$
                           1348 ;src/main.c:340: borrarCuchillo(actual);
   590E C5            [11] 1349 	push	bc
   590F D5            [11] 1350 	push	de
   5910 D5            [11] 1351 	push	de
   5911 CD AA 55      [17] 1352 	call	_borrarCuchillo
   5914 F1            [10] 1353 	pop	af
   5915 D1            [10] 1354 	pop	de
   5916 C1            [10] 1355 	pop	bc
                           1356 ;src/main.c:341: actual->lanzado = NO;
   5917 AF            [ 4] 1357 	xor	a, a
   5918 02            [ 7] 1358 	ld	(bc),a
   5919                    1359 00133$:
                           1360 ;src/main.c:345: ++actual;
   5919 21 09 00      [10] 1361 	ld	hl,#0x0009
   591C 19            [11] 1362 	add	hl,de
   591D EB            [ 4] 1363 	ex	de,hl
   591E C3 3D 58      [10] 1364 	jp	00134$
   5921                    1365 00137$:
   5921 33            [ 6] 1366 	inc	sp
   5922 DD E1         [14] 1367 	pop	ix
   5924 C9            [10] 1368 	ret
                           1369 ;src/main.c:349: void inicializar() {
                           1370 ;	---------------------------------
                           1371 ; Function inicializar
                           1372 ; ---------------------------------
   5925                    1373 _inicializar::
                           1374 ;src/main.c:352: TKnife* actual = cu;
                           1375 ;src/main.c:354: cpct_disableFirmware();
   5925 CD AD 51      [17] 1376 	call	_cpct_disableFirmware
                           1377 ;src/main.c:355: cpct_setVideoMode(0);
   5928 2E 00         [ 7] 1378 	ld	l,#0x00
   592A CD 76 49      [17] 1379 	call	_cpct_setVideoMode
                           1380 ;src/main.c:357: cpct_setPalette(g_palette, 16);
   592D 21 10 00      [10] 1381 	ld	hl,#0x0010
   5930 E5            [11] 1382 	push	hl
   5931 21 6E 47      [10] 1383 	ld	hl,#_g_palette
   5934 E5            [11] 1384 	push	hl
   5935 CD 18 48      [17] 1385 	call	_cpct_setPalette
                           1386 ;src/main.c:358: cpct_akp_musicInit(G_song);
   5938 21 00 3F      [10] 1387 	ld	hl,#_G_song
   593B E5            [11] 1388 	push	hl
   593C CD 89 50      [17] 1389 	call	_cpct_akp_musicInit
   593F F1            [10] 1390 	pop	af
                           1391 ;src/main.c:359: mapa = g_map1;
   5940 21 00 40      [10] 1392 	ld	hl,#_g_map1+0
   5943 22 9E 52      [16] 1393 	ld	(_mapa),hl
                           1394 ;src/main.c:360: cpct_etm_setTileset2x4(g_tileset);
   5946 21 0A 47      [10] 1395 	ld	hl,#_g_tileset
   5949 CD CA 48      [17] 1396 	call	_cpct_etm_setTileset2x4
                           1397 ;src/main.c:361: dibujarMapa();
   594C CD A0 52      [17] 1398 	call	_dibujarMapa
                           1399 ;src/main.c:364: prota.x = prota.px = 4;
   594F 21 3E 52      [10] 1400 	ld	hl,#(_prota + 0x0002)
   5952 36 04         [10] 1401 	ld	(hl),#0x04
   5954 21 3C 52      [10] 1402 	ld	hl,#_prota
   5957 36 04         [10] 1403 	ld	(hl),#0x04
                           1404 ;src/main.c:365: prota.y = prota.py = 80;
   5959 21 3F 52      [10] 1405 	ld	hl,#(_prota + 0x0003)
   595C 36 50         [10] 1406 	ld	(hl),#0x50
   595E 21 3D 52      [10] 1407 	ld	hl,#(_prota + 0x0001)
   5961 36 50         [10] 1408 	ld	(hl),#0x50
                           1409 ;src/main.c:366: prota.mover  = NO;
   5963 21 42 52      [10] 1410 	ld	hl,#(_prota + 0x0006)
   5966 36 00         [10] 1411 	ld	(hl),#0x00
                           1412 ;src/main.c:367: prota.mira=M_derecha;
   5968 21 43 52      [10] 1413 	ld	hl,#(_prota + 0x0007)
   596B 36 00         [10] 1414 	ld	(hl),#0x00
                           1415 ;src/main.c:368: prota.sprite = g_hero;
   596D 21 7E 47      [10] 1416 	ld	hl,#_g_hero
   5970 22 40 52      [16] 1417 	ld	((_prota + 0x0004)), hl
                           1418 ;src/main.c:371: i = 10 + 1;
   5973 0E 0B         [ 7] 1419 	ld	c,#0x0B
                           1420 ;src/main.c:374: while(--i){
   5975 11 44 52      [10] 1421 	ld	de,#_cu
   5978                    1422 00101$:
   5978 41            [ 4] 1423 	ld	b,c
   5979 05            [ 4] 1424 	dec	b
   597A 78            [ 4] 1425 	ld	a,b
   597B 4F            [ 4] 1426 	ld	c,a
   597C B7            [ 4] 1427 	or	a, a
   597D 28 25         [12] 1428 	jr	Z,00103$
                           1429 ;src/main.c:375: actual->x = actual->px = 0;
   597F 6B            [ 4] 1430 	ld	l, e
   5980 62            [ 4] 1431 	ld	h, d
   5981 23            [ 6] 1432 	inc	hl
   5982 23            [ 6] 1433 	inc	hl
   5983 36 00         [10] 1434 	ld	(hl),#0x00
   5985 AF            [ 4] 1435 	xor	a, a
   5986 12            [ 7] 1436 	ld	(de),a
                           1437 ;src/main.c:376: actual->y = actual->py = 0;
   5987 D5            [11] 1438 	push	de
   5988 FD E1         [14] 1439 	pop	iy
   598A FD 23         [10] 1440 	inc	iy
   598C 6B            [ 4] 1441 	ld	l, e
   598D 62            [ 4] 1442 	ld	h, d
   598E 23            [ 6] 1443 	inc	hl
   598F 23            [ 6] 1444 	inc	hl
   5990 23            [ 6] 1445 	inc	hl
   5991 36 00         [10] 1446 	ld	(hl),#0x00
   5993 FD 36 00 00   [19] 1447 	ld	0 (iy), #0x00
                           1448 ;src/main.c:377: actual->lanzado = 0;
   5997 21 06 00      [10] 1449 	ld	hl,#0x0006
   599A 19            [11] 1450 	add	hl,de
   599B 36 00         [10] 1451 	ld	(hl),#0x00
                           1452 ;src/main.c:378: ++actual;
   599D 21 09 00      [10] 1453 	ld	hl,#0x0009
   59A0 19            [11] 1454 	add	hl,de
   59A1 EB            [ 4] 1455 	ex	de,hl
   59A2 18 D4         [12] 1456 	jr	00101$
   59A4                    1457 00103$:
                           1458 ;src/main.c:382: dibujarProta();
   59A4 CD B6 52      [17] 1459 	call	_dibujarProta
   59A7 C9            [10] 1460 	ret
                           1461 ;src/main.c:385: void main(void) {
                           1462 ;	---------------------------------
                           1463 ; Function main
                           1464 ; ---------------------------------
   59A8                    1465 _main::
                           1466 ;src/main.c:388: inicializar();
   59A8 CD 25 59      [17] 1467 	call	_inicializar
                           1468 ;src/main.c:389: cpct_akp_musicPlay();
   59AB CD 86 49      [17] 1469 	call	_cpct_akp_musicPlay
                           1470 ;src/main.c:392: while (1) {
   59AE                    1471 00104$:
                           1472 ;src/main.c:395: comprobarTeclado();
   59AE CD EC 57      [17] 1473 	call	_comprobarTeclado
                           1474 ;src/main.c:397: cpct_waitVSYNC();
   59B1 CD 6E 49      [17] 1475 	call	_cpct_waitVSYNC
                           1476 ;src/main.c:398: moverCuchillo();
   59B4 CD 2D 58      [17] 1477 	call	_moverCuchillo
                           1478 ;src/main.c:400: if (prota.mover) {
   59B7 3A 42 52      [13] 1479 	ld	a, (#(_prota + 0x0006) + 0)
   59BA B7            [ 4] 1480 	or	a, a
   59BB 28 F1         [12] 1481 	jr	Z,00104$
                           1482 ;src/main.c:402: redibujarProta();
   59BD CD 3F 53      [17] 1483 	call	_redibujarProta
                           1484 ;src/main.c:403: prota.mover = NO;
   59C0 21 42 52      [10] 1485 	ld	hl,#(_prota + 0x0006)
   59C3 36 00         [10] 1486 	ld	(hl),#0x00
   59C5 18 E7         [12] 1487 	jr	00104$
                           1488 	.area _CODE
                           1489 	.area _INITIALIZER
                           1490 	.area _CABS (ABS)
   3F00                    1491 	.org 0x3F00
   3F00                    1492 _G_song:
   3F00 41                 1493 	.db #0x41	; 65	'A'
   3F01 54                 1494 	.db #0x54	; 84	'T'
   3F02 31                 1495 	.db #0x31	; 49	'1'
   3F03 30                 1496 	.db #0x30	; 48	'0'
   3F04 01                 1497 	.db #0x01	; 1
   3F05 40                 1498 	.db #0x40	; 64
   3F06 42                 1499 	.db #0x42	; 66	'B'
   3F07 0F                 1500 	.db #0x0F	; 15
   3F08 02                 1501 	.db #0x02	; 2
   3F09 06                 1502 	.db #0x06	; 6
   3F0A 1D                 1503 	.db #0x1D	; 29
   3F0B 00                 1504 	.db #0x00	; 0
   3F0C 10                 1505 	.db #0x10	; 16
   3F0D 40                 1506 	.db #0x40	; 64
   3F0E 19                 1507 	.db #0x19	; 25
   3F0F 40                 1508 	.db #0x40	; 64
   3F10 00                 1509 	.db #0x00	; 0
   3F11 00                 1510 	.db #0x00	; 0
   3F12 00                 1511 	.db #0x00	; 0
   3F13 00                 1512 	.db #0x00	; 0
   3F14 00                 1513 	.db #0x00	; 0
   3F15 00                 1514 	.db #0x00	; 0
   3F16 0D                 1515 	.db #0x0D	; 13
   3F17 12                 1516 	.db #0x12	; 18
   3F18 40                 1517 	.db #0x40	; 64
   3F19 01                 1518 	.db #0x01	; 1
   3F1A 00                 1519 	.db #0x00	; 0
   3F1B 7C                 1520 	.db #0x7C	; 124
   3F1C 18                 1521 	.db #0x18	; 24
   3F1D 78                 1522 	.db #0x78	; 120	'x'
   3F1E 0C                 1523 	.db #0x0C	; 12
   3F1F 34                 1524 	.db #0x34	; 52	'4'
   3F20 30                 1525 	.db #0x30	; 48	'0'
   3F21 2C                 1526 	.db #0x2C	; 44
   3F22 28                 1527 	.db #0x28	; 40
   3F23 24                 1528 	.db #0x24	; 36
   3F24 20                 1529 	.db #0x20	; 32
   3F25 1C                 1530 	.db #0x1C	; 28
   3F26 0D                 1531 	.db #0x0D	; 13
   3F27 25                 1532 	.db #0x25	; 37
   3F28 40                 1533 	.db #0x40	; 64
   3F29 20                 1534 	.db #0x20	; 32
   3F2A 00                 1535 	.db #0x00	; 0
   3F2B 00                 1536 	.db #0x00	; 0
   3F2C 00                 1537 	.db #0x00	; 0
   3F2D 39                 1538 	.db #0x39	; 57	'9'
   3F2E 40                 1539 	.db #0x40	; 64
   3F2F 00                 1540 	.db #0x00	; 0
   3F30 57                 1541 	.db #0x57	; 87	'W'
   3F31 40                 1542 	.db #0x40	; 64
   3F32 3B                 1543 	.db #0x3B	; 59
   3F33 40                 1544 	.db #0x40	; 64
   3F34 57                 1545 	.db #0x57	; 87	'W'
   3F35 40                 1546 	.db #0x40	; 64
   3F36 01                 1547 	.db #0x01	; 1
   3F37 2F                 1548 	.db #0x2F	; 47
   3F38 40                 1549 	.db #0x40	; 64
   3F39 19                 1550 	.db #0x19	; 25
   3F3A 00                 1551 	.db #0x00	; 0
   3F3B 76                 1552 	.db #0x76	; 118	'v'
   3F3C E1                 1553 	.db #0xE1	; 225
   3F3D 00                 1554 	.db #0x00	; 0
   3F3E 00                 1555 	.db #0x00	; 0
   3F3F 01                 1556 	.db #0x01	; 1
   3F40 04                 1557 	.db #0x04	; 4
   3F41 51                 1558 	.db #0x51	; 81	'Q'
   3F42 04                 1559 	.db #0x04	; 4
   3F43 37                 1560 	.db #0x37	; 55	'7'
   3F44 04                 1561 	.db #0x04	; 4
   3F45 4F                 1562 	.db #0x4F	; 79	'O'
   3F46 04                 1563 	.db #0x04	; 4
   3F47 37                 1564 	.db #0x37	; 55	'7'
   3F48 02                 1565 	.db #0x02	; 2
   3F49 4B                 1566 	.db #0x4B	; 75	'K'
   3F4A 02                 1567 	.db #0x02	; 2
   3F4B 37                 1568 	.db #0x37	; 55	'7'
   3F4C 04                 1569 	.db #0x04	; 4
   3F4D 4F                 1570 	.db #0x4F	; 79	'O'
   3F4E 04                 1571 	.db #0x04	; 4
   3F4F 37                 1572 	.db #0x37	; 55	'7'
   3F50 04                 1573 	.db #0x04	; 4
   3F51 4F                 1574 	.db #0x4F	; 79	'O'
   3F52 04                 1575 	.db #0x04	; 4
   3F53 37                 1576 	.db #0x37	; 55	'7'
   3F54 02                 1577 	.db #0x02	; 2
   3F55 4B                 1578 	.db #0x4B	; 75	'K'
   3F56 00                 1579 	.db #0x00	; 0
   3F57 42                 1580 	.db #0x42	; 66	'B'
   3F58 60                 1581 	.db #0x60	; 96
   3F59 00                 1582 	.db #0x00	; 0
   3F5A 42                 1583 	.db #0x42	; 66	'B'
   3F5B 80                 1584 	.db #0x80	; 128
   3F5C 00                 1585 	.db #0x00	; 0
   3F5D 00                 1586 	.db #0x00	; 0
   3F5E 42                 1587 	.db #0x42	; 66	'B'
   3F5F 00                 1588 	.db #0x00	; 0
   3F60 00                 1589 	.db #0x00	; 0
