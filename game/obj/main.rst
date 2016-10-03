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
   53A0 C2 AA 54      [10]  322 	jp	NZ,00105$
   53A3 3E 03         [ 7]  323 	ld	a,#0x03
   53A5 DD BE 04      [19]  324 	cp	a, 4 (ix)
   53A8 3E 00         [ 7]  325 	ld	a,#0x00
   53AA DD 9E 05      [19]  326 	sbc	a, 5 (ix)
   53AD E2 B2 53      [10]  327 	jp	PO, 00128$
   53B0 EE 80         [ 7]  328 	xor	a, #0x80
   53B2                     329 00128$:
   53B2 FA AA 54      [10]  330 	jp	M,00105$
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
   53CA C3 7E 54      [10]  342 	jp	00104$
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
   540F C3 AA 54      [10]  388 	jp	00105$
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
   5450 18 58         [12]  432 	jr	00105$
                            433 ;src/main.c:139: case 2:
   5452                     434 00103$:
                            435 ;src/main.c:140: headTile   = getTilePtr(prota.x, prota.y - 1);
   5452 21 3D 52      [10]  436 	ld	hl, #(_prota + 0x0001) + 0
   5455 46            [ 7]  437 	ld	b,(hl)
   5456 05            [ 4]  438 	dec	b
   5457 21 3C 52      [10]  439 	ld	hl, #_prota + 0
   545A 4E            [ 7]  440 	ld	c, (hl)
   545B C5            [11]  441 	push	bc
   545C CD 53 53      [17]  442 	call	_getTilePtr
   545F F1            [10]  443 	pop	af
   5460 DD 75 FE      [19]  444 	ld	-2 (ix),l
   5463 DD 74 FF      [19]  445 	ld	-1 (ix),h
                            446 ;src/main.c:141: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 1);
   5466 3A 3D 52      [13]  447 	ld	a, (#(_prota + 0x0001) + 0)
   5469 47            [ 4]  448 	ld	b,a
   546A 05            [ 4]  449 	dec	b
   546B 3A 3C 52      [13]  450 	ld	a, (#_prota + 0)
   546E C6 03         [ 7]  451 	add	a, #0x03
   5470 C5            [11]  452 	push	bc
   5471 33            [ 6]  453 	inc	sp
   5472 F5            [11]  454 	push	af
   5473 33            [ 6]  455 	inc	sp
   5474 CD 53 53      [17]  456 	call	_getTilePtr
   5477 F1            [10]  457 	pop	af
   5478 4D            [ 4]  458 	ld	c,l
   5479 44            [ 4]  459 	ld	b,h
                            460 ;src/main.c:142: *waistTile = 0;
   547A AF            [ 4]  461 	xor	a, a
   547B 12            [ 7]  462 	ld	(de),a
                            463 ;src/main.c:143: break;
   547C 18 2C         [12]  464 	jr	00105$
                            465 ;src/main.c:144: case 3:
   547E                     466 00104$:
                            467 ;src/main.c:145: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA + 1);
   547E 3A 3D 52      [13]  468 	ld	a, (#(_prota + 0x0001) + 0)
   5481 C6 17         [ 7]  469 	add	a, #0x17
   5483 47            [ 4]  470 	ld	b,a
   5484 21 3C 52      [10]  471 	ld	hl, #_prota + 0
   5487 4E            [ 7]  472 	ld	c, (hl)
   5488 C5            [11]  473 	push	bc
   5489 CD 53 53      [17]  474 	call	_getTilePtr
   548C F1            [10]  475 	pop	af
   548D DD 75 FE      [19]  476 	ld	-2 (ix),l
   5490 DD 74 FF      [19]  477 	ld	-1 (ix),h
                            478 ;src/main.c:146: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA + 1);
   5493 3A 3D 52      [13]  479 	ld	a, (#(_prota + 0x0001) + 0)
   5496 C6 17         [ 7]  480 	add	a, #0x17
   5498 47            [ 4]  481 	ld	b,a
   5499 3A 3C 52      [13]  482 	ld	a, (#_prota + 0)
   549C C6 03         [ 7]  483 	add	a, #0x03
   549E C5            [11]  484 	push	bc
   549F 33            [ 6]  485 	inc	sp
   54A0 F5            [11]  486 	push	af
   54A1 33            [ 6]  487 	inc	sp
   54A2 CD 53 53      [17]  488 	call	_getTilePtr
   54A5 F1            [10]  489 	pop	af
   54A6 4D            [ 4]  490 	ld	c,l
   54A7 44            [ 4]  491 	ld	b,h
                            492 ;src/main.c:147: *waistTile = 0;
   54A8 AF            [ 4]  493 	xor	a, a
   54A9 12            [ 7]  494 	ld	(de),a
                            495 ;src/main.c:149: }
   54AA                     496 00105$:
                            497 ;src/main.c:151: if (*headTile > 0 || *feetTile > 0 || *waistTile > 0)
   54AA DD 6E FE      [19]  498 	ld	l,-2 (ix)
   54AD DD 66 FF      [19]  499 	ld	h,-1 (ix)
   54B0 7E            [ 7]  500 	ld	a,(hl)
   54B1 B7            [ 4]  501 	or	a, a
   54B2 20 08         [12]  502 	jr	NZ,00106$
   54B4 0A            [ 7]  503 	ld	a,(bc)
   54B5 B7            [ 4]  504 	or	a, a
   54B6 20 04         [12]  505 	jr	NZ,00106$
   54B8 1A            [ 7]  506 	ld	a,(de)
   54B9 B7            [ 4]  507 	or	a, a
   54BA 28 04         [12]  508 	jr	Z,00107$
   54BC                     509 00106$:
                            510 ;src/main.c:152: return 1;
   54BC 2E 01         [ 7]  511 	ld	l,#0x01
   54BE 18 02         [12]  512 	jr	00110$
   54C0                     513 00107$:
                            514 ;src/main.c:154: return 0;
   54C0 2E 00         [ 7]  515 	ld	l,#0x00
   54C2                     516 00110$:
   54C2 DD F9         [10]  517 	ld	sp, ix
   54C4 DD E1         [14]  518 	pop	ix
   54C6 C9            [10]  519 	ret
                            520 ;src/main.c:157: void moverIzquierda() {
                            521 ;	---------------------------------
                            522 ; Function moverIzquierda
                            523 ; ---------------------------------
   54C7                     524 _moverIzquierda::
                            525 ;src/main.c:158: prota.mira = M_izquierda;
   54C7 01 3C 52      [10]  526 	ld	bc,#_prota+0
   54CA 21 43 52      [10]  527 	ld	hl,#(_prota + 0x0007)
   54CD 36 01         [10]  528 	ld	(hl),#0x01
                            529 ;src/main.c:159: if (!checkCollision(M_izquierda)) {
   54CF C5            [11]  530 	push	bc
   54D0 21 01 00      [10]  531 	ld	hl,#0x0001
   54D3 E5            [11]  532 	push	hl
   54D4 CD 8F 53      [17]  533 	call	_checkCollision
   54D7 F1            [10]  534 	pop	af
   54D8 C1            [10]  535 	pop	bc
   54D9 7D            [ 4]  536 	ld	a,l
   54DA B7            [ 4]  537 	or	a, a
   54DB C0            [11]  538 	ret	NZ
                            539 ;src/main.c:160: prota.x--;
   54DC 0A            [ 7]  540 	ld	a,(bc)
   54DD C6 FF         [ 7]  541 	add	a,#0xFF
   54DF 02            [ 7]  542 	ld	(bc),a
                            543 ;src/main.c:161: prota.mover = SI;
   54E0 21 42 52      [10]  544 	ld	hl,#(_prota + 0x0006)
   54E3 36 01         [10]  545 	ld	(hl),#0x01
   54E5 C9            [10]  546 	ret
                            547 ;src/main.c:165: void moverDerecha() {
                            548 ;	---------------------------------
                            549 ; Function moverDerecha
                            550 ; ---------------------------------
   54E6                     551 _moverDerecha::
                            552 ;src/main.c:166: prota.mira = M_derecha;
   54E6 01 3C 52      [10]  553 	ld	bc,#_prota+0
   54E9 21 43 52      [10]  554 	ld	hl,#(_prota + 0x0007)
   54EC 36 00         [10]  555 	ld	(hl),#0x00
                            556 ;src/main.c:167: if (!checkCollision(M_derecha)) {
   54EE C5            [11]  557 	push	bc
   54EF 21 00 00      [10]  558 	ld	hl,#0x0000
   54F2 E5            [11]  559 	push	hl
   54F3 CD 8F 53      [17]  560 	call	_checkCollision
   54F6 F1            [10]  561 	pop	af
   54F7 C1            [10]  562 	pop	bc
   54F8 7D            [ 4]  563 	ld	a,l
   54F9 B7            [ 4]  564 	or	a, a
   54FA C0            [11]  565 	ret	NZ
                            566 ;src/main.c:168: prota.x++;
   54FB 0A            [ 7]  567 	ld	a,(bc)
   54FC 3C            [ 4]  568 	inc	a
   54FD 02            [ 7]  569 	ld	(bc),a
                            570 ;src/main.c:169: prota.mover = SI;
   54FE 21 42 52      [10]  571 	ld	hl,#(_prota + 0x0006)
   5501 36 01         [10]  572 	ld	(hl),#0x01
   5503 C9            [10]  573 	ret
                            574 ;src/main.c:173: void moverArriba() {
                            575 ;	---------------------------------
                            576 ; Function moverArriba
                            577 ; ---------------------------------
   5504                     578 _moverArriba::
                            579 ;src/main.c:174: prota.mira = M_arriba;
   5504 21 43 52      [10]  580 	ld	hl,#(_prota + 0x0007)
   5507 36 02         [10]  581 	ld	(hl),#0x02
                            582 ;src/main.c:175: if (!checkCollision(M_arriba)) {
   5509 21 02 00      [10]  583 	ld	hl,#0x0002
   550C E5            [11]  584 	push	hl
   550D CD 8F 53      [17]  585 	call	_checkCollision
   5510 F1            [10]  586 	pop	af
   5511 7D            [ 4]  587 	ld	a,l
   5512 B7            [ 4]  588 	or	a, a
   5513 C0            [11]  589 	ret	NZ
                            590 ;src/main.c:176: prota.y--;
   5514 21 3D 52      [10]  591 	ld	hl,#_prota + 1
   5517 4E            [ 7]  592 	ld	c,(hl)
   5518 0D            [ 4]  593 	dec	c
   5519 71            [ 7]  594 	ld	(hl),c
                            595 ;src/main.c:177: prota.mover  = SI;
   551A 21 42 52      [10]  596 	ld	hl,#(_prota + 0x0006)
   551D 36 01         [10]  597 	ld	(hl),#0x01
   551F C9            [10]  598 	ret
                            599 ;src/main.c:181: void moverAbajo() {
                            600 ;	---------------------------------
                            601 ; Function moverAbajo
                            602 ; ---------------------------------
   5520                     603 _moverAbajo::
                            604 ;src/main.c:182: prota.mira = M_abajo;
   5520 21 43 52      [10]  605 	ld	hl,#(_prota + 0x0007)
   5523 36 03         [10]  606 	ld	(hl),#0x03
                            607 ;src/main.c:183: if (!checkCollision(M_abajo)) {
   5525 21 03 00      [10]  608 	ld	hl,#0x0003
   5528 E5            [11]  609 	push	hl
   5529 CD 8F 53      [17]  610 	call	_checkCollision
   552C F1            [10]  611 	pop	af
   552D 7D            [ 4]  612 	ld	a,l
   552E B7            [ 4]  613 	or	a, a
   552F C0            [11]  614 	ret	NZ
                            615 ;src/main.c:184: prota.y++;
   5530 01 3D 52      [10]  616 	ld	bc,#_prota + 1
   5533 0A            [ 7]  617 	ld	a,(bc)
   5534 3C            [ 4]  618 	inc	a
   5535 02            [ 7]  619 	ld	(bc),a
                            620 ;src/main.c:185: prota.mover  = SI;
   5536 21 42 52      [10]  621 	ld	hl,#(_prota + 0x0006)
   5539 36 01         [10]  622 	ld	(hl),#0x01
   553B C9            [10]  623 	ret
                            624 ;src/main.c:189: void dibujarCuchillo(TKnife* actual) {
                            625 ;	---------------------------------
                            626 ; Function dibujarCuchillo
                            627 ; ---------------------------------
   553C                     628 _dibujarCuchillo::
   553C DD E5         [15]  629 	push	ix
   553E DD 21 00 00   [14]  630 	ld	ix,#0
   5542 DD 39         [15]  631 	add	ix,sp
   5544 F5            [11]  632 	push	af
   5545 F5            [11]  633 	push	af
                            634 ;src/main.c:190: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, actual->x, actual->y);
   5546 DD 5E 04      [19]  635 	ld	e,4 (ix)
   5549 DD 56 05      [19]  636 	ld	d,5 (ix)
   554C 6B            [ 4]  637 	ld	l, e
   554D 62            [ 4]  638 	ld	h, d
   554E 23            [ 6]  639 	inc	hl
   554F 46            [ 7]  640 	ld	b,(hl)
   5550 1A            [ 7]  641 	ld	a,(de)
   5551 D5            [11]  642 	push	de
   5552 C5            [11]  643 	push	bc
   5553 33            [ 6]  644 	inc	sp
   5554 F5            [11]  645 	push	af
   5555 33            [ 6]  646 	inc	sp
   5556 21 00 C0      [10]  647 	ld	hl,#0xC000
   5559 E5            [11]  648 	push	hl
   555A CD DF 51      [17]  649 	call	_cpct_getScreenPtr
   555D D1            [10]  650 	pop	de
   555E E5            [11]  651 	push	hl
   555F FD E1         [14]  652 	pop	iy
                            653 ;src/main.c:191: if(actual->eje == E_X){
   5561 6B            [ 4]  654 	ld	l, e
   5562 62            [ 4]  655 	ld	h, d
   5563 01 08 00      [10]  656 	ld	bc, #0x0008
   5566 09            [11]  657 	add	hl, bc
   5567 4E            [ 7]  658 	ld	c,(hl)
                            659 ;src/main.c:192: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   5568 FD E5         [15]  660 	push	iy
   556A F1            [10]  661 	pop	af
   556B DD 77 FF      [19]  662 	ld	-1 (ix),a
   556E FD E5         [15]  663 	push	iy
   5570 3B            [ 6]  664 	dec	sp
   5571 F1            [10]  665 	pop	af
   5572 33            [ 6]  666 	inc	sp
   5573 DD 77 FE      [19]  667 	ld	-2 (ix),a
   5576 21 04 00      [10]  668 	ld	hl,#0x0004
   5579 19            [11]  669 	add	hl,de
   557A E3            [19]  670 	ex	(sp), hl
                            671 ;src/main.c:191: if(actual->eje == E_X){
   557B 79            [ 4]  672 	ld	a,c
   557C B7            [ 4]  673 	or	a, a
   557D 20 1A         [12]  674 	jr	NZ,00104$
                            675 ;src/main.c:192: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   557F 11 00 3E      [10]  676 	ld	de,#_g_tablatrans+0
   5582 E1            [10]  677 	pop	hl
   5583 E5            [11]  678 	push	hl
   5584 4E            [ 7]  679 	ld	c,(hl)
   5585 23            [ 6]  680 	inc	hl
   5586 46            [ 7]  681 	ld	b,(hl)
   5587 D5            [11]  682 	push	de
   5588 21 03 03      [10]  683 	ld	hl,#0x0303
   558B E5            [11]  684 	push	hl
   558C DD 6E FE      [19]  685 	ld	l,-2 (ix)
   558F DD 66 FF      [19]  686 	ld	h,-1 (ix)
   5592 E5            [11]  687 	push	hl
   5593 C5            [11]  688 	push	bc
   5594 CD FF 51      [17]  689 	call	_cpct_drawSpriteMaskedAlignedTable
   5597 18 1B         [12]  690 	jr	00106$
   5599                     691 00104$:
                            692 ;src/main.c:195: else if(actual->eje == E_Y){
   5599 0D            [ 4]  693 	dec	c
   559A 20 18         [12]  694 	jr	NZ,00106$
                            695 ;src/main.c:196: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   559C 11 00 3E      [10]  696 	ld	de,#_g_tablatrans+0
   559F E1            [10]  697 	pop	hl
   55A0 E5            [11]  698 	push	hl
   55A1 4E            [ 7]  699 	ld	c,(hl)
   55A2 23            [ 6]  700 	inc	hl
   55A3 46            [ 7]  701 	ld	b,(hl)
   55A4 D5            [11]  702 	push	de
   55A5 21 02 06      [10]  703 	ld	hl,#0x0602
   55A8 E5            [11]  704 	push	hl
   55A9 DD 6E FE      [19]  705 	ld	l,-2 (ix)
   55AC DD 66 FF      [19]  706 	ld	h,-1 (ix)
   55AF E5            [11]  707 	push	hl
   55B0 C5            [11]  708 	push	bc
   55B1 CD FF 51      [17]  709 	call	_cpct_drawSpriteMaskedAlignedTable
   55B4                     710 00106$:
   55B4 DD F9         [10]  711 	ld	sp, ix
   55B6 DD E1         [14]  712 	pop	ix
   55B8 C9            [10]  713 	ret
                            714 ;src/main.c:200: void borrarCuchillo(TKnife* actual) {
                            715 ;	---------------------------------
                            716 ; Function borrarCuchillo
                            717 ; ---------------------------------
   55B9                     718 _borrarCuchillo::
   55B9 DD E5         [15]  719 	push	ix
   55BB DD 21 00 00   [14]  720 	ld	ix,#0
   55BF DD 39         [15]  721 	add	ix,sp
   55C1 3B            [ 6]  722 	dec	sp
                            723 ;src/main.c:201: u8 w = 2 + (actual->px & 1);
   55C2 DD 5E 04      [19]  724 	ld	e,4 (ix)
   55C5 DD 56 05      [19]  725 	ld	d,5 (ix)
   55C8 6B            [ 4]  726 	ld	l, e
   55C9 62            [ 4]  727 	ld	h, d
   55CA 23            [ 6]  728 	inc	hl
   55CB 23            [ 6]  729 	inc	hl
   55CC 4E            [ 7]  730 	ld	c,(hl)
   55CD 79            [ 4]  731 	ld	a,c
   55CE E6 01         [ 7]  732 	and	a, #0x01
   55D0 47            [ 4]  733 	ld	b,a
   55D1 04            [ 4]  734 	inc	b
   55D2 04            [ 4]  735 	inc	b
                            736 ;src/main.c:202: u8 h = 2 + (actual->py & 3 ? 1 : 0);
   55D3 EB            [ 4]  737 	ex	de,hl
   55D4 23            [ 6]  738 	inc	hl
   55D5 23            [ 6]  739 	inc	hl
   55D6 23            [ 6]  740 	inc	hl
   55D7 5E            [ 7]  741 	ld	e,(hl)
   55D8 7B            [ 4]  742 	ld	a,e
   55D9 E6 03         [ 7]  743 	and	a, #0x03
   55DB 28 04         [12]  744 	jr	Z,00103$
   55DD 3E 01         [ 7]  745 	ld	a,#0x01
   55DF 18 02         [12]  746 	jr	00104$
   55E1                     747 00103$:
   55E1 3E 00         [ 7]  748 	ld	a,#0x00
   55E3                     749 00104$:
   55E3 C6 02         [ 7]  750 	add	a, #0x02
   55E5 DD 77 FF      [19]  751 	ld	-1 (ix),a
                            752 ;src/main.c:203: cpct_etm_drawTileBox2x4 (actual->px / 2, (actual->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   55E8 FD 2A 9E 52   [20]  753 	ld	iy,(_mapa)
   55EC 16 00         [ 7]  754 	ld	d,#0x00
   55EE 63            [ 4]  755 	ld	h,e
   55EF 6A            [ 4]  756 	ld	l,d
   55F0 CB 7A         [ 8]  757 	bit	7, d
   55F2 28 05         [12]  758 	jr	Z,00105$
   55F4 13            [ 6]  759 	inc	de
   55F5 13            [ 6]  760 	inc	de
   55F6 13            [ 6]  761 	inc	de
   55F7 63            [ 4]  762 	ld	h,e
   55F8 6A            [ 4]  763 	ld	l,d
   55F9                     764 00105$:
   55F9 5C            [ 4]  765 	ld	e, h
   55FA 55            [ 4]  766 	ld	d, l
   55FB CB 2A         [ 8]  767 	sra	d
   55FD CB 1B         [ 8]  768 	rr	e
   55FF CB 2A         [ 8]  769 	sra	d
   5601 CB 1B         [ 8]  770 	rr	e
   5603 51            [ 4]  771 	ld	d,c
   5604 CB 3A         [ 8]  772 	srl	d
   5606 FD E5         [15]  773 	push	iy
   5608 21 00 C0      [10]  774 	ld	hl,#0xC000
   560B E5            [11]  775 	push	hl
   560C 3E 28         [ 7]  776 	ld	a,#0x28
   560E F5            [11]  777 	push	af
   560F 33            [ 6]  778 	inc	sp
   5610 DD 7E FF      [19]  779 	ld	a,-1 (ix)
   5613 F5            [11]  780 	push	af
   5614 33            [ 6]  781 	inc	sp
   5615 C5            [11]  782 	push	bc
   5616 33            [ 6]  783 	inc	sp
   5617 7B            [ 4]  784 	ld	a,e
   5618 F5            [11]  785 	push	af
   5619 33            [ 6]  786 	inc	sp
   561A D5            [11]  787 	push	de
   561B 33            [ 6]  788 	inc	sp
   561C CD 3B 48      [17]  789 	call	_cpct_etm_drawTileBox2x4
   561F 33            [ 6]  790 	inc	sp
   5620 DD E1         [14]  791 	pop	ix
   5622 C9            [10]  792 	ret
                            793 ;src/main.c:206: void redibujarCuchillo(TKnife* actual) {
                            794 ;	---------------------------------
                            795 ; Function redibujarCuchillo
                            796 ; ---------------------------------
   5623                     797 _redibujarCuchillo::
   5623 DD E5         [15]  798 	push	ix
   5625 DD 21 00 00   [14]  799 	ld	ix,#0
   5629 DD 39         [15]  800 	add	ix,sp
                            801 ;src/main.c:207: borrarCuchillo(actual);
   562B DD 6E 04      [19]  802 	ld	l,4 (ix)
   562E DD 66 05      [19]  803 	ld	h,5 (ix)
   5631 E5            [11]  804 	push	hl
   5632 CD B9 55      [17]  805 	call	_borrarCuchillo
   5635 F1            [10]  806 	pop	af
                            807 ;src/main.c:208: actual->px = actual->x;
   5636 DD 4E 04      [19]  808 	ld	c,4 (ix)
   5639 DD 46 05      [19]  809 	ld	b,5 (ix)
   563C 59            [ 4]  810 	ld	e, c
   563D 50            [ 4]  811 	ld	d, b
   563E 13            [ 6]  812 	inc	de
   563F 13            [ 6]  813 	inc	de
   5640 0A            [ 7]  814 	ld	a,(bc)
   5641 12            [ 7]  815 	ld	(de),a
                            816 ;src/main.c:209: actual->py = actual->y;
   5642 59            [ 4]  817 	ld	e, c
   5643 50            [ 4]  818 	ld	d, b
   5644 13            [ 6]  819 	inc	de
   5645 13            [ 6]  820 	inc	de
   5646 13            [ 6]  821 	inc	de
   5647 69            [ 4]  822 	ld	l, c
   5648 60            [ 4]  823 	ld	h, b
   5649 23            [ 6]  824 	inc	hl
   564A 7E            [ 7]  825 	ld	a,(hl)
   564B 12            [ 7]  826 	ld	(de),a
                            827 ;src/main.c:210: dibujarCuchillo(actual);
   564C C5            [11]  828 	push	bc
   564D CD 3C 55      [17]  829 	call	_dibujarCuchillo
   5650 F1            [10]  830 	pop	af
   5651 DD E1         [14]  831 	pop	ix
   5653 C9            [10]  832 	ret
                            833 ;src/main.c:214: void lanzarCuchillo(){
                            834 ;	---------------------------------
                            835 ; Function lanzarCuchillo
                            836 ; ---------------------------------
   5654                     837 _lanzarCuchillo::
   5654 DD E5         [15]  838 	push	ix
   5656 DD 21 00 00   [14]  839 	ld	ix,#0
   565A DD 39         [15]  840 	add	ix,sp
   565C 21 FA FF      [10]  841 	ld	hl,#-6
   565F 39            [11]  842 	add	hl,sp
   5660 F9            [ 6]  843 	ld	sp,hl
                            844 ;src/main.c:216: TKnife* actual = cu;
   5661 01 44 52      [10]  845 	ld	bc,#_cu+0
                            846 ;src/main.c:219: while(i>0 && actual->lanzado){
   5664 1E 0A         [ 7]  847 	ld	e,#0x0A
   5666                     848 00102$:
   5666 21 06 00      [10]  849 	ld	hl,#0x0006
   5669 09            [11]  850 	add	hl,bc
   566A DD 75 FE      [19]  851 	ld	-2 (ix),l
   566D DD 74 FF      [19]  852 	ld	-1 (ix),h
   5670 7B            [ 4]  853 	ld	a,e
   5671 B7            [ 4]  854 	or	a, a
   5672 28 13         [12]  855 	jr	Z,00104$
   5674 DD 6E FE      [19]  856 	ld	l,-2 (ix)
   5677 DD 66 FF      [19]  857 	ld	h,-1 (ix)
   567A 7E            [ 7]  858 	ld	a,(hl)
   567B B7            [ 4]  859 	or	a, a
   567C 28 09         [12]  860 	jr	Z,00104$
                            861 ;src/main.c:220: --i;
   567E 1D            [ 4]  862 	dec	e
                            863 ;src/main.c:221: actual++;
   567F 21 09 00      [10]  864 	ld	hl,#0x0009
   5682 09            [11]  865 	add	hl,bc
   5683 4D            [ 4]  866 	ld	c,l
   5684 44            [ 4]  867 	ld	b,h
   5685 18 DF         [12]  868 	jr	00102$
   5687                     869 00104$:
                            870 ;src/main.c:224: if(i>0 && !actual->lanzado){
   5687 7B            [ 4]  871 	ld	a,e
   5688 B7            [ 4]  872 	or	a, a
   5689 CA F6 57      [10]  873 	jp	Z,00127$
   568C DD 6E FE      [19]  874 	ld	l,-2 (ix)
   568F DD 66 FF      [19]  875 	ld	h,-1 (ix)
   5692 7E            [ 7]  876 	ld	a,(hl)
   5693 B7            [ 4]  877 	or	a, a
   5694 C2 F6 57      [10]  878 	jp	NZ,00127$
                            879 ;src/main.c:226: if(prota.mira == M_derecha){
   5697 21 43 52      [10]  880 	ld	hl, #_prota + 7
   569A 6E            [ 7]  881 	ld	l,(hl)
                            882 ;src/main.c:229: actual->direccion = M_derecha;
   569B FD 21 07 00   [14]  883 	ld	iy,#0x0007
   569F FD 09         [15]  884 	add	iy, bc
                            885 ;src/main.c:231: actual->y=prota.y + G_HERO_H /2;
   56A1 59            [ 4]  886 	ld	e, c
   56A2 50            [ 4]  887 	ld	d, b
   56A3 13            [ 6]  888 	inc	de
                            889 ;src/main.c:232: actual->sprite=g_knifeX_0;
   56A4 79            [ 4]  890 	ld	a,c
   56A5 C6 04         [ 7]  891 	add	a, #0x04
   56A7 DD 77 FC      [19]  892 	ld	-4 (ix),a
   56AA 78            [ 4]  893 	ld	a,b
   56AB CE 00         [ 7]  894 	adc	a, #0x00
   56AD DD 77 FD      [19]  895 	ld	-3 (ix),a
                            896 ;src/main.c:233: actual->eje = E_X;
   56B0 79            [ 4]  897 	ld	a,c
   56B1 C6 08         [ 7]  898 	add	a, #0x08
   56B3 DD 77 FA      [19]  899 	ld	-6 (ix),a
   56B6 78            [ 4]  900 	ld	a,b
   56B7 CE 00         [ 7]  901 	adc	a, #0x00
   56B9 DD 77 FB      [19]  902 	ld	-5 (ix),a
                            903 ;src/main.c:226: if(prota.mira == M_derecha){
   56BC 7D            [ 4]  904 	ld	a,l
   56BD B7            [ 4]  905 	or	a, a
   56BE 20 4F         [12]  906 	jr	NZ,00122$
                            907 ;src/main.c:227: if( (LIMITE_DERECHO - (prota.x + G_HERO_W) ) >= G_KNIFEX_0_W + 1){
   56C0 21 3C 52      [10]  908 	ld	hl, #_prota + 0
   56C3 6E            [ 7]  909 	ld	l,(hl)
   56C4 26 00         [ 7]  910 	ld	h,#0x00
   56C6 D5            [11]  911 	push	de
   56C7 11 07 00      [10]  912 	ld	de,#0x0007
   56CA 19            [11]  913 	add	hl, de
   56CB D1            [10]  914 	pop	de
   56CC 3E 4C         [ 7]  915 	ld	a,#0x4C
   56CE 95            [ 4]  916 	sub	a, l
   56CF 6F            [ 4]  917 	ld	l,a
   56D0 3E 00         [ 7]  918 	ld	a,#0x00
   56D2 9C            [ 4]  919 	sbc	a, h
   56D3 67            [ 4]  920 	ld	h,a
   56D4 7D            [ 4]  921 	ld	a,l
   56D5 D6 04         [ 7]  922 	sub	a, #0x04
   56D7 7C            [ 4]  923 	ld	a,h
   56D8 17            [ 4]  924 	rla
   56D9 3F            [ 4]  925 	ccf
   56DA 1F            [ 4]  926 	rra
   56DB DE 80         [ 7]  927 	sbc	a, #0x80
   56DD DA F6 57      [10]  928 	jp	C,00127$
                            929 ;src/main.c:228: actual->lanzado = SI;
   56E0 DD 6E FE      [19]  930 	ld	l,-2 (ix)
   56E3 DD 66 FF      [19]  931 	ld	h,-1 (ix)
   56E6 36 01         [10]  932 	ld	(hl),#0x01
                            933 ;src/main.c:229: actual->direccion = M_derecha;
   56E8 FD 36 00 00   [19]  934 	ld	0 (iy), #0x00
                            935 ;src/main.c:230: actual->x=prota.x + G_HERO_W;
   56EC 3A 3C 52      [13]  936 	ld	a, (#_prota + 0)
   56EF C6 07         [ 7]  937 	add	a, #0x07
   56F1 02            [ 7]  938 	ld	(bc),a
                            939 ;src/main.c:231: actual->y=prota.y + G_HERO_H /2;
   56F2 3A 3D 52      [13]  940 	ld	a, (#(_prota + 0x0001) + 0)
   56F5 C6 0B         [ 7]  941 	add	a, #0x0B
   56F7 12            [ 7]  942 	ld	(de),a
                            943 ;src/main.c:232: actual->sprite=g_knifeX_0;
   56F8 DD 6E FC      [19]  944 	ld	l,-4 (ix)
   56FB DD 66 FD      [19]  945 	ld	h,-3 (ix)
   56FE 36 F8         [10]  946 	ld	(hl),#<(_g_knifeX_0)
   5700 23            [ 6]  947 	inc	hl
   5701 36 46         [10]  948 	ld	(hl),#>(_g_knifeX_0)
                            949 ;src/main.c:233: actual->eje = E_X;
   5703 E1            [10]  950 	pop	hl
   5704 E5            [11]  951 	push	hl
   5705 36 00         [10]  952 	ld	(hl),#0x00
                            953 ;src/main.c:234: dibujarCuchillo(actual);
   5707 C5            [11]  954 	push	bc
   5708 CD 3C 55      [17]  955 	call	_dibujarCuchillo
   570B F1            [10]  956 	pop	af
   570C C3 F6 57      [10]  957 	jp	00127$
   570F                     958 00122$:
                            959 ;src/main.c:237: else if(prota.mira == M_izquierda){
   570F 7D            [ 4]  960 	ld	a,l
   5710 3D            [ 4]  961 	dec	a
   5711 20 49         [12]  962 	jr	NZ,00119$
                            963 ;src/main.c:238: if( (prota.x - 4 ) >= G_KNIFEX_1_W + 1){
   5713 21 3C 52      [10]  964 	ld	hl, #_prota + 0
   5716 6E            [ 7]  965 	ld	l,(hl)
   5717 26 00         [ 7]  966 	ld	h,#0x00
   5719 7D            [ 4]  967 	ld	a,l
   571A C6 FC         [ 7]  968 	add	a,#0xFC
   571C 6F            [ 4]  969 	ld	l,a
   571D 7C            [ 4]  970 	ld	a,h
   571E CE FF         [ 7]  971 	adc	a,#0xFF
   5720 67            [ 4]  972 	ld	h,a
   5721 7D            [ 4]  973 	ld	a,l
   5722 D6 04         [ 7]  974 	sub	a, #0x04
   5724 7C            [ 4]  975 	ld	a,h
   5725 17            [ 4]  976 	rla
   5726 3F            [ 4]  977 	ccf
   5727 1F            [ 4]  978 	rra
   5728 DE 80         [ 7]  979 	sbc	a, #0x80
   572A DA F6 57      [10]  980 	jp	C,00127$
                            981 ;src/main.c:239: actual->lanzado = SI;
   572D DD 6E FE      [19]  982 	ld	l,-2 (ix)
   5730 DD 66 FF      [19]  983 	ld	h,-1 (ix)
   5733 36 01         [10]  984 	ld	(hl),#0x01
                            985 ;src/main.c:240: actual->direccion = M_izquierda;
   5735 FD 36 00 01   [19]  986 	ld	0 (iy), #0x01
                            987 ;src/main.c:241: actual->x = prota.x - G_KNIFEX_0_W;
   5739 3A 3C 52      [13]  988 	ld	a, (#_prota + 0)
   573C C6 FD         [ 7]  989 	add	a,#0xFD
   573E 02            [ 7]  990 	ld	(bc),a
                            991 ;src/main.c:242: actual->y = prota.y + G_HERO_H /2;
   573F 3A 3D 52      [13]  992 	ld	a, (#(_prota + 0x0001) + 0)
   5742 C6 0B         [ 7]  993 	add	a, #0x0B
   5744 12            [ 7]  994 	ld	(de),a
                            995 ;src/main.c:243: actual->sprite = g_knifeX_1;
   5745 DD 6E FC      [19]  996 	ld	l,-4 (ix)
   5748 DD 66 FD      [19]  997 	ld	h,-3 (ix)
   574B 36 01         [10]  998 	ld	(hl),#<(_g_knifeX_1)
   574D 23            [ 6]  999 	inc	hl
   574E 36 47         [10] 1000 	ld	(hl),#>(_g_knifeX_1)
                           1001 ;src/main.c:244: actual->eje = E_X;
   5750 E1            [10] 1002 	pop	hl
   5751 E5            [11] 1003 	push	hl
   5752 36 00         [10] 1004 	ld	(hl),#0x00
                           1005 ;src/main.c:245: dibujarCuchillo(actual);
   5754 C5            [11] 1006 	push	bc
   5755 CD 3C 55      [17] 1007 	call	_dibujarCuchillo
   5758 F1            [10] 1008 	pop	af
   5759 C3 F6 57      [10] 1009 	jp	00127$
   575C                    1010 00119$:
                           1011 ;src/main.c:248: else if(prota.mira == M_abajo){
   575C 7D            [ 4] 1012 	ld	a,l
   575D D6 03         [ 7] 1013 	sub	a, #0x03
   575F 20 4D         [12] 1014 	jr	NZ,00116$
                           1015 ;src/main.c:250: if((valor - (prota.y + G_HERO_H)) >= G_KNIFEY_0_H + 1){
   5761 21 3D 52      [10] 1016 	ld	hl, #(_prota + 0x0001) + 0
   5764 6E            [ 7] 1017 	ld	l,(hl)
   5765 26 00         [ 7] 1018 	ld	h,#0x00
   5767 D5            [11] 1019 	push	de
   5768 11 16 00      [10] 1020 	ld	de,#0x0016
   576B 19            [11] 1021 	add	hl, de
   576C D1            [10] 1022 	pop	de
   576D 3E A8         [ 7] 1023 	ld	a,#0xA8
   576F 95            [ 4] 1024 	sub	a, l
   5770 6F            [ 4] 1025 	ld	l,a
   5771 3E 00         [ 7] 1026 	ld	a,#0x00
   5773 9C            [ 4] 1027 	sbc	a, h
   5774 67            [ 4] 1028 	ld	h,a
   5775 7D            [ 4] 1029 	ld	a,l
   5776 D6 07         [ 7] 1030 	sub	a, #0x07
   5778 7C            [ 4] 1031 	ld	a,h
   5779 17            [ 4] 1032 	rla
   577A 3F            [ 4] 1033 	ccf
   577B 1F            [ 4] 1034 	rra
   577C DE 80         [ 7] 1035 	sbc	a, #0x80
   577E 38 76         [12] 1036 	jr	C,00127$
                           1037 ;src/main.c:251: actual->lanzado = SI;
   5780 DD 6E FE      [19] 1038 	ld	l,-2 (ix)
   5783 DD 66 FF      [19] 1039 	ld	h,-1 (ix)
   5786 36 01         [10] 1040 	ld	(hl),#0x01
                           1041 ;src/main.c:252: actual->direccion = M_abajo;
   5788 FD 36 00 03   [19] 1042 	ld	0 (iy), #0x03
                           1043 ;src/main.c:253: actual->x = prota.x + G_HERO_W / 2;
   578C 3A 3C 52      [13] 1044 	ld	a, (#_prota + 0)
   578F C6 03         [ 7] 1045 	add	a, #0x03
   5791 02            [ 7] 1046 	ld	(bc),a
                           1047 ;src/main.c:254: actual->y = prota.y + G_HERO_H;
   5792 3A 3D 52      [13] 1048 	ld	a, (#(_prota + 0x0001) + 0)
   5795 C6 16         [ 7] 1049 	add	a, #0x16
   5797 12            [ 7] 1050 	ld	(de),a
                           1051 ;src/main.c:255: actual->sprite = g_knifeY_0;
   5798 DD 6E FC      [19] 1052 	ld	l,-4 (ix)
   579B DD 66 FD      [19] 1053 	ld	h,-3 (ix)
   579E 36 E0         [10] 1054 	ld	(hl),#<(_g_knifeY_0)
   57A0 23            [ 6] 1055 	inc	hl
   57A1 36 46         [10] 1056 	ld	(hl),#>(_g_knifeY_0)
                           1057 ;src/main.c:256: actual->eje = E_Y;
   57A3 E1            [10] 1058 	pop	hl
   57A4 E5            [11] 1059 	push	hl
   57A5 36 01         [10] 1060 	ld	(hl),#0x01
                           1061 ;src/main.c:257: dibujarCuchillo(actual);
   57A7 C5            [11] 1062 	push	bc
   57A8 CD 3C 55      [17] 1063 	call	_dibujarCuchillo
   57AB F1            [10] 1064 	pop	af
   57AC 18 48         [12] 1065 	jr	00127$
   57AE                    1066 00116$:
                           1067 ;src/main.c:260: else if(prota.mira == M_arriba){
   57AE 7D            [ 4] 1068 	ld	a,l
   57AF D6 02         [ 7] 1069 	sub	a, #0x02
   57B1 20 43         [12] 1070 	jr	NZ,00127$
                           1071 ;src/main.c:261: if((prota.y - 8)>= G_KNIFEY_0_H +1 ){
   57B3 21 3D 52      [10] 1072 	ld	hl, #(_prota + 0x0001) + 0
   57B6 6E            [ 7] 1073 	ld	l,(hl)
   57B7 26 00         [ 7] 1074 	ld	h,#0x00
   57B9 7D            [ 4] 1075 	ld	a,l
   57BA C6 F8         [ 7] 1076 	add	a,#0xF8
   57BC 6F            [ 4] 1077 	ld	l,a
   57BD 7C            [ 4] 1078 	ld	a,h
   57BE CE FF         [ 7] 1079 	adc	a,#0xFF
   57C0 67            [ 4] 1080 	ld	h,a
   57C1 7D            [ 4] 1081 	ld	a,l
   57C2 D6 07         [ 7] 1082 	sub	a, #0x07
   57C4 7C            [ 4] 1083 	ld	a,h
   57C5 17            [ 4] 1084 	rla
   57C6 3F            [ 4] 1085 	ccf
   57C7 1F            [ 4] 1086 	rra
   57C8 DE 80         [ 7] 1087 	sbc	a, #0x80
   57CA 38 2A         [12] 1088 	jr	C,00127$
                           1089 ;src/main.c:262: actual->lanzado = SI;
   57CC DD 6E FE      [19] 1090 	ld	l,-2 (ix)
   57CF DD 66 FF      [19] 1091 	ld	h,-1 (ix)
   57D2 36 01         [10] 1092 	ld	(hl),#0x01
                           1093 ;src/main.c:263: actual->direccion = M_arriba;
   57D4 FD 36 00 02   [19] 1094 	ld	0 (iy), #0x02
                           1095 ;src/main.c:264: actual->x = prota.x + G_HERO_W / 2;
   57D8 3A 3C 52      [13] 1096 	ld	a, (#_prota + 0)
   57DB C6 03         [ 7] 1097 	add	a, #0x03
   57DD 02            [ 7] 1098 	ld	(bc),a
                           1099 ;src/main.c:265: actual->y = prota.y;
   57DE 3A 3D 52      [13] 1100 	ld	a, (#(_prota + 0x0001) + 0)
   57E1 12            [ 7] 1101 	ld	(de),a
                           1102 ;src/main.c:266: actual->sprite = g_knifeY_1;
   57E2 DD 6E FC      [19] 1103 	ld	l,-4 (ix)
   57E5 DD 66 FD      [19] 1104 	ld	h,-3 (ix)
   57E8 36 EC         [10] 1105 	ld	(hl),#<(_g_knifeY_1)
   57EA 23            [ 6] 1106 	inc	hl
   57EB 36 46         [10] 1107 	ld	(hl),#>(_g_knifeY_1)
                           1108 ;src/main.c:267: actual->eje = E_Y;
   57ED E1            [10] 1109 	pop	hl
   57EE E5            [11] 1110 	push	hl
   57EF 36 01         [10] 1111 	ld	(hl),#0x01
                           1112 ;src/main.c:268: dibujarCuchillo(actual);
   57F1 C5            [11] 1113 	push	bc
   57F2 CD 3C 55      [17] 1114 	call	_dibujarCuchillo
   57F5 F1            [10] 1115 	pop	af
   57F6                    1116 00127$:
   57F6 DD F9         [10] 1117 	ld	sp, ix
   57F8 DD E1         [14] 1118 	pop	ix
   57FA C9            [10] 1119 	ret
                           1120 ;src/main.c:274: void comprobarTeclado() {
                           1121 ;	---------------------------------
                           1122 ; Function comprobarTeclado
                           1123 ; ---------------------------------
   57FB                    1124 _comprobarTeclado::
                           1125 ;src/main.c:275: cpct_scanKeyboard_if();
   57FB CD 06 49      [17] 1126 	call	_cpct_scanKeyboard_if
                           1127 ;src/main.c:277: if (cpct_isAnyKeyPressed()) {
   57FE CD F9 48      [17] 1128 	call	_cpct_isAnyKeyPressed
   5801 7D            [ 4] 1129 	ld	a,l
   5802 B7            [ 4] 1130 	or	a, a
   5803 C8            [11] 1131 	ret	Z
                           1132 ;src/main.c:278: if (cpct_isKeyPressed(Key_CursorLeft))
   5804 21 01 01      [10] 1133 	ld	hl,#0x0101
   5807 CD 2F 48      [17] 1134 	call	_cpct_isKeyPressed
   580A 7D            [ 4] 1135 	ld	a,l
   580B B7            [ 4] 1136 	or	a, a
                           1137 ;src/main.c:279: moverIzquierda();
   580C C2 C7 54      [10] 1138 	jp	NZ,_moverIzquierda
                           1139 ;src/main.c:280: else if (cpct_isKeyPressed(Key_CursorRight))
   580F 21 00 02      [10] 1140 	ld	hl,#0x0200
   5812 CD 2F 48      [17] 1141 	call	_cpct_isKeyPressed
   5815 7D            [ 4] 1142 	ld	a,l
   5816 B7            [ 4] 1143 	or	a, a
                           1144 ;src/main.c:281: moverDerecha();
   5817 C2 E6 54      [10] 1145 	jp	NZ,_moverDerecha
                           1146 ;src/main.c:282: else if (cpct_isKeyPressed(Key_CursorUp))
   581A 21 00 01      [10] 1147 	ld	hl,#0x0100
   581D CD 2F 48      [17] 1148 	call	_cpct_isKeyPressed
   5820 7D            [ 4] 1149 	ld	a,l
   5821 B7            [ 4] 1150 	or	a, a
                           1151 ;src/main.c:283: moverArriba();
   5822 C2 04 55      [10] 1152 	jp	NZ,_moverArriba
                           1153 ;src/main.c:284: else if (cpct_isKeyPressed(Key_CursorDown))
   5825 21 00 04      [10] 1154 	ld	hl,#0x0400
   5828 CD 2F 48      [17] 1155 	call	_cpct_isKeyPressed
   582B 7D            [ 4] 1156 	ld	a,l
   582C B7            [ 4] 1157 	or	a, a
                           1158 ;src/main.c:285: moverAbajo();
   582D C2 20 55      [10] 1159 	jp	NZ,_moverAbajo
                           1160 ;src/main.c:286: else if (cpct_isKeyPressed(Key_Space))
   5830 21 05 80      [10] 1161 	ld	hl,#0x8005
   5833 CD 2F 48      [17] 1162 	call	_cpct_isKeyPressed
   5836 7D            [ 4] 1163 	ld	a,l
   5837 B7            [ 4] 1164 	or	a, a
   5838 C8            [11] 1165 	ret	Z
                           1166 ;src/main.c:287: lanzarCuchillo();
   5839 C3 54 56      [10] 1167 	jp  _lanzarCuchillo
                           1168 ;src/main.c:293: void moverCuchillo(){
                           1169 ;	---------------------------------
                           1170 ; Function moverCuchillo
                           1171 ; ---------------------------------
   583C                    1172 _moverCuchillo::
   583C DD E5         [15] 1173 	push	ix
   583E DD 21 00 00   [14] 1174 	ld	ix,#0
   5842 DD 39         [15] 1175 	add	ix,sp
   5844 3B            [ 6] 1176 	dec	sp
                           1177 ;src/main.c:295: u8 i = 10 + 1;
   5845 DD 36 FF 0B   [19] 1178 	ld	-1 (ix),#0x0B
                           1179 ;src/main.c:296: TKnife* actual = cu;
   5849 11 44 52      [10] 1180 	ld	de,#_cu+0
                           1181 ;src/main.c:298: while(--i){
   584C                    1182 00134$:
   584C DD 35 FF      [23] 1183 	dec	-1 (ix)
   584F DD 7E FF      [19] 1184 	ld	a, -1 (ix)
   5852 B7            [ 4] 1185 	or	a, a
   5853 CA 30 59      [10] 1186 	jp	Z,00137$
                           1187 ;src/main.c:299: if(actual->lanzado){
   5856 21 06 00      [10] 1188 	ld	hl,#0x0006
   5859 19            [11] 1189 	add	hl,de
   585A 4D            [ 4] 1190 	ld	c,l
   585B 44            [ 4] 1191 	ld	b,h
   585C 0A            [ 7] 1192 	ld	a,(bc)
   585D B7            [ 4] 1193 	or	a, a
   585E CA 28 59      [10] 1194 	jp	Z,00133$
                           1195 ;src/main.c:300: if(actual->direccion == M_derecha){
   5861 D5            [11] 1196 	push	de
   5862 FD E1         [14] 1197 	pop	iy
   5864 FD 6E 07      [19] 1198 	ld	l,7 (iy)
   5867 7D            [ 4] 1199 	ld	a,l
   5868 B7            [ 4] 1200 	or	a, a
   5869 20 29         [12] 1201 	jr	NZ,00130$
                           1202 ;src/main.c:301: if(actual->x< LIMITE_DERECHO - G_KNIFEX_0_W){
   586B 1A            [ 7] 1203 	ld	a,(de)
   586C 6F            [ 4] 1204 	ld	l,a
   586D D6 49         [ 7] 1205 	sub	a, #0x49
   586F 3E 00         [ 7] 1206 	ld	a,#0x00
   5871 17            [ 4] 1207 	rla
   5872 B7            [ 4] 1208 	or	a, a
   5873 28 0D         [12] 1209 	jr	Z,00104$
                           1210 ;src/main.c:302: actual->x++;
   5875 7D            [ 4] 1211 	ld	a,l
   5876 3C            [ 4] 1212 	inc	a
   5877 12            [ 7] 1213 	ld	(de),a
                           1214 ;src/main.c:304: redibujarCuchillo(actual);
   5878 D5            [11] 1215 	push	de
   5879 D5            [11] 1216 	push	de
   587A CD 23 56      [17] 1217 	call	_redibujarCuchillo
   587D F1            [10] 1218 	pop	af
   587E D1            [10] 1219 	pop	de
   587F C3 28 59      [10] 1220 	jp	00133$
   5882                    1221 00104$:
                           1222 ;src/main.c:306: else if(actual->x >= LIMITE_DERECHO  - G_KNIFEX_0_W){
   5882 B7            [ 4] 1223 	or	a, a
   5883 C2 28 59      [10] 1224 	jp	NZ,00133$
                           1225 ;src/main.c:307: borrarCuchillo(actual);
   5886 C5            [11] 1226 	push	bc
   5887 D5            [11] 1227 	push	de
   5888 D5            [11] 1228 	push	de
   5889 CD B9 55      [17] 1229 	call	_borrarCuchillo
   588C F1            [10] 1230 	pop	af
   588D D1            [10] 1231 	pop	de
   588E C1            [10] 1232 	pop	bc
                           1233 ;src/main.c:308: actual->lanzado = NO;
   588F AF            [ 4] 1234 	xor	a, a
   5890 02            [ 7] 1235 	ld	(bc),a
   5891 C3 28 59      [10] 1236 	jp	00133$
   5894                    1237 00130$:
                           1238 ;src/main.c:311: else if(actual->direccion == M_izquierda){
   5894 7D            [ 4] 1239 	ld	a,l
   5895 3D            [ 4] 1240 	dec	a
   5896 20 29         [12] 1241 	jr	NZ,00127$
                           1242 ;src/main.c:301: if(actual->x< LIMITE_DERECHO - G_KNIFEX_0_W){
   5898 1A            [ 7] 1243 	ld	a,(de)
   5899 6F            [ 4] 1244 	ld	l,a
                           1245 ;src/main.c:312: if(actual->x > LIMITE_IZQUIERDO){
   589A 3E 04         [ 7] 1246 	ld	a,#0x04
   589C 95            [ 4] 1247 	sub	a, l
   589D 3E 00         [ 7] 1248 	ld	a,#0x00
   589F 17            [ 4] 1249 	rla
   58A0 B7            [ 4] 1250 	or	a, a
   58A1 28 0E         [12] 1251 	jr	Z,00109$
                           1252 ;src/main.c:313: actual->x--;
   58A3 4D            [ 4] 1253 	ld	c,l
   58A4 0D            [ 4] 1254 	dec	c
   58A5 79            [ 4] 1255 	ld	a,c
   58A6 12            [ 7] 1256 	ld	(de),a
                           1257 ;src/main.c:315: redibujarCuchillo(actual);
   58A7 D5            [11] 1258 	push	de
   58A8 D5            [11] 1259 	push	de
   58A9 CD 23 56      [17] 1260 	call	_redibujarCuchillo
   58AC F1            [10] 1261 	pop	af
   58AD D1            [10] 1262 	pop	de
   58AE C3 28 59      [10] 1263 	jp	00133$
   58B1                    1264 00109$:
                           1265 ;src/main.c:316: }else if(actual->x <= LIMITE_IZQUIERDO){
   58B1 B7            [ 4] 1266 	or	a, a
   58B2 20 74         [12] 1267 	jr	NZ,00133$
                           1268 ;src/main.c:317: borrarCuchillo(actual);
   58B4 C5            [11] 1269 	push	bc
   58B5 D5            [11] 1270 	push	de
   58B6 D5            [11] 1271 	push	de
   58B7 CD B9 55      [17] 1272 	call	_borrarCuchillo
   58BA F1            [10] 1273 	pop	af
   58BB D1            [10] 1274 	pop	de
   58BC C1            [10] 1275 	pop	bc
                           1276 ;src/main.c:318: actual->lanzado = NO;
   58BD AF            [ 4] 1277 	xor	a, a
   58BE 02            [ 7] 1278 	ld	(bc),a
   58BF 18 67         [12] 1279 	jr	00133$
   58C1                    1280 00127$:
                           1281 ;src/main.c:322: if(actual->y < LIMITE_INFERIOR - G_KNIFEY_0_H){
   58C1 D5            [11] 1282 	push	de
   58C2 FD E1         [14] 1283 	pop	iy
   58C4 FD 23         [10] 1284 	inc	iy
                           1285 ;src/main.c:321: else if(actual->direccion == M_abajo){
   58C6 7D            [ 4] 1286 	ld	a,l
   58C7 D6 03         [ 7] 1287 	sub	a, #0x03
   58C9 20 2D         [12] 1288 	jr	NZ,00124$
                           1289 ;src/main.c:322: if(actual->y < LIMITE_INFERIOR - G_KNIFEY_0_H){
   58CB FD 6E 00      [19] 1290 	ld	l, 0 (iy)
   58CE 7D            [ 4] 1291 	ld	a,l
   58CF D6 A2         [ 7] 1292 	sub	a, #0xA2
   58D1 3E 00         [ 7] 1293 	ld	a,#0x00
   58D3 17            [ 4] 1294 	rla
   58D4 B7            [ 4] 1295 	or	a, a
   58D5 28 11         [12] 1296 	jr	Z,00114$
                           1297 ;src/main.c:323: actual->y++;
   58D7 2C            [ 4] 1298 	inc	l
   58D8 FD 75 00      [19] 1299 	ld	0 (iy), l
                           1300 ;src/main.c:324: actual->y++;
   58DB 2C            [ 4] 1301 	inc	l
   58DC FD 75 00      [19] 1302 	ld	0 (iy), l
                           1303 ;src/main.c:325: redibujarCuchillo(actual);
   58DF D5            [11] 1304 	push	de
   58E0 D5            [11] 1305 	push	de
   58E1 CD 23 56      [17] 1306 	call	_redibujarCuchillo
   58E4 F1            [10] 1307 	pop	af
   58E5 D1            [10] 1308 	pop	de
   58E6 18 40         [12] 1309 	jr	00133$
   58E8                    1310 00114$:
                           1311 ;src/main.c:328: }else if(actual->y >= LIMITE_INFERIOR - G_KNIFEY_0_H ){
   58E8 B7            [ 4] 1312 	or	a, a
   58E9 20 3D         [12] 1313 	jr	NZ,00133$
                           1314 ;src/main.c:329: borrarCuchillo(actual);
   58EB C5            [11] 1315 	push	bc
   58EC D5            [11] 1316 	push	de
   58ED D5            [11] 1317 	push	de
   58EE CD B9 55      [17] 1318 	call	_borrarCuchillo
   58F1 F1            [10] 1319 	pop	af
   58F2 D1            [10] 1320 	pop	de
   58F3 C1            [10] 1321 	pop	bc
                           1322 ;src/main.c:330: actual->lanzado = NO;
   58F4 AF            [ 4] 1323 	xor	a, a
   58F5 02            [ 7] 1324 	ld	(bc),a
   58F6 18 30         [12] 1325 	jr	00133$
   58F8                    1326 00124$:
                           1327 ;src/main.c:333: else if(actual->direccion == M_arriba){
   58F8 7D            [ 4] 1328 	ld	a,l
   58F9 D6 02         [ 7] 1329 	sub	a, #0x02
   58FB 20 2B         [12] 1330 	jr	NZ,00133$
                           1331 ;src/main.c:322: if(actual->y < LIMITE_INFERIOR - G_KNIFEY_0_H){
   58FD FD 6E 00      [19] 1332 	ld	l, 0 (iy)
                           1333 ;src/main.c:334: if(actual->y > LIMITE_SUPERIOR){
   5900 3E 08         [ 7] 1334 	ld	a,#0x08
   5902 95            [ 4] 1335 	sub	a, l
   5903 3E 00         [ 7] 1336 	ld	a,#0x00
   5905 17            [ 4] 1337 	rla
   5906 B7            [ 4] 1338 	or	a, a
   5907 28 11         [12] 1339 	jr	Z,00119$
                           1340 ;src/main.c:335: actual->y--;
   5909 2D            [ 4] 1341 	dec	l
   590A FD 75 00      [19] 1342 	ld	0 (iy), l
                           1343 ;src/main.c:336: actual->y--;
   590D 2D            [ 4] 1344 	dec	l
   590E FD 75 00      [19] 1345 	ld	0 (iy), l
                           1346 ;src/main.c:337: redibujarCuchillo(actual);
   5911 D5            [11] 1347 	push	de
   5912 D5            [11] 1348 	push	de
   5913 CD 23 56      [17] 1349 	call	_redibujarCuchillo
   5916 F1            [10] 1350 	pop	af
   5917 D1            [10] 1351 	pop	de
   5918 18 0E         [12] 1352 	jr	00133$
   591A                    1353 00119$:
                           1354 ;src/main.c:339: }else if(actual->y <= LIMITE_SUPERIOR){
   591A B7            [ 4] 1355 	or	a, a
   591B 20 0B         [12] 1356 	jr	NZ,00133$
                           1357 ;src/main.c:340: borrarCuchillo(actual);
   591D C5            [11] 1358 	push	bc
   591E D5            [11] 1359 	push	de
   591F D5            [11] 1360 	push	de
   5920 CD B9 55      [17] 1361 	call	_borrarCuchillo
   5923 F1            [10] 1362 	pop	af
   5924 D1            [10] 1363 	pop	de
   5925 C1            [10] 1364 	pop	bc
                           1365 ;src/main.c:341: actual->lanzado = NO;
   5926 AF            [ 4] 1366 	xor	a, a
   5927 02            [ 7] 1367 	ld	(bc),a
   5928                    1368 00133$:
                           1369 ;src/main.c:345: ++actual;
   5928 21 09 00      [10] 1370 	ld	hl,#0x0009
   592B 19            [11] 1371 	add	hl,de
   592C EB            [ 4] 1372 	ex	de,hl
   592D C3 4C 58      [10] 1373 	jp	00134$
   5930                    1374 00137$:
   5930 33            [ 6] 1375 	inc	sp
   5931 DD E1         [14] 1376 	pop	ix
   5933 C9            [10] 1377 	ret
                           1378 ;src/main.c:349: void inicializar() {
                           1379 ;	---------------------------------
                           1380 ; Function inicializar
                           1381 ; ---------------------------------
   5934                    1382 _inicializar::
                           1383 ;src/main.c:352: TKnife* actual = cu;
                           1384 ;src/main.c:354: cpct_disableFirmware();
   5934 CD AD 51      [17] 1385 	call	_cpct_disableFirmware
                           1386 ;src/main.c:355: cpct_setVideoMode(0);
   5937 2E 00         [ 7] 1387 	ld	l,#0x00
   5939 CD 76 49      [17] 1388 	call	_cpct_setVideoMode
                           1389 ;src/main.c:357: cpct_setPalette(g_palette, 16);
   593C 21 10 00      [10] 1390 	ld	hl,#0x0010
   593F E5            [11] 1391 	push	hl
   5940 21 6E 47      [10] 1392 	ld	hl,#_g_palette
   5943 E5            [11] 1393 	push	hl
   5944 CD 18 48      [17] 1394 	call	_cpct_setPalette
                           1395 ;src/main.c:358: cpct_akp_musicInit(G_song);
   5947 21 00 3F      [10] 1396 	ld	hl,#_G_song
   594A E5            [11] 1397 	push	hl
   594B CD 89 50      [17] 1398 	call	_cpct_akp_musicInit
   594E F1            [10] 1399 	pop	af
                           1400 ;src/main.c:359: mapa = g_map1;
   594F 21 00 40      [10] 1401 	ld	hl,#_g_map1+0
   5952 22 9E 52      [16] 1402 	ld	(_mapa),hl
                           1403 ;src/main.c:360: cpct_etm_setTileset2x4(g_tileset);
   5955 21 0A 47      [10] 1404 	ld	hl,#_g_tileset
   5958 CD CA 48      [17] 1405 	call	_cpct_etm_setTileset2x4
                           1406 ;src/main.c:361: dibujarMapa();
   595B CD A0 52      [17] 1407 	call	_dibujarMapa
                           1408 ;src/main.c:364: prota.x = prota.px = 4;
   595E 21 3E 52      [10] 1409 	ld	hl,#(_prota + 0x0002)
   5961 36 04         [10] 1410 	ld	(hl),#0x04
   5963 21 3C 52      [10] 1411 	ld	hl,#_prota
   5966 36 04         [10] 1412 	ld	(hl),#0x04
                           1413 ;src/main.c:365: prota.y = prota.py = 80;
   5968 21 3F 52      [10] 1414 	ld	hl,#(_prota + 0x0003)
   596B 36 50         [10] 1415 	ld	(hl),#0x50
   596D 21 3D 52      [10] 1416 	ld	hl,#(_prota + 0x0001)
   5970 36 50         [10] 1417 	ld	(hl),#0x50
                           1418 ;src/main.c:366: prota.mover  = NO;
   5972 21 42 52      [10] 1419 	ld	hl,#(_prota + 0x0006)
   5975 36 00         [10] 1420 	ld	(hl),#0x00
                           1421 ;src/main.c:367: prota.mira=M_derecha;
   5977 21 43 52      [10] 1422 	ld	hl,#(_prota + 0x0007)
   597A 36 00         [10] 1423 	ld	(hl),#0x00
                           1424 ;src/main.c:368: prota.sprite = g_hero;
   597C 21 7E 47      [10] 1425 	ld	hl,#_g_hero
   597F 22 40 52      [16] 1426 	ld	((_prota + 0x0004)), hl
                           1427 ;src/main.c:371: i = 10 + 1;
   5982 0E 0B         [ 7] 1428 	ld	c,#0x0B
                           1429 ;src/main.c:374: while(--i){
   5984 11 44 52      [10] 1430 	ld	de,#_cu
   5987                    1431 00101$:
   5987 41            [ 4] 1432 	ld	b,c
   5988 05            [ 4] 1433 	dec	b
   5989 78            [ 4] 1434 	ld	a,b
   598A 4F            [ 4] 1435 	ld	c,a
   598B B7            [ 4] 1436 	or	a, a
   598C 28 25         [12] 1437 	jr	Z,00103$
                           1438 ;src/main.c:375: actual->x = actual->px = 0;
   598E 6B            [ 4] 1439 	ld	l, e
   598F 62            [ 4] 1440 	ld	h, d
   5990 23            [ 6] 1441 	inc	hl
   5991 23            [ 6] 1442 	inc	hl
   5992 36 00         [10] 1443 	ld	(hl),#0x00
   5994 AF            [ 4] 1444 	xor	a, a
   5995 12            [ 7] 1445 	ld	(de),a
                           1446 ;src/main.c:376: actual->y = actual->py = 0;
   5996 D5            [11] 1447 	push	de
   5997 FD E1         [14] 1448 	pop	iy
   5999 FD 23         [10] 1449 	inc	iy
   599B 6B            [ 4] 1450 	ld	l, e
   599C 62            [ 4] 1451 	ld	h, d
   599D 23            [ 6] 1452 	inc	hl
   599E 23            [ 6] 1453 	inc	hl
   599F 23            [ 6] 1454 	inc	hl
   59A0 36 00         [10] 1455 	ld	(hl),#0x00
   59A2 FD 36 00 00   [19] 1456 	ld	0 (iy), #0x00
                           1457 ;src/main.c:377: actual->lanzado = 0;
   59A6 21 06 00      [10] 1458 	ld	hl,#0x0006
   59A9 19            [11] 1459 	add	hl,de
   59AA 36 00         [10] 1460 	ld	(hl),#0x00
                           1461 ;src/main.c:378: ++actual;
   59AC 21 09 00      [10] 1462 	ld	hl,#0x0009
   59AF 19            [11] 1463 	add	hl,de
   59B0 EB            [ 4] 1464 	ex	de,hl
   59B1 18 D4         [12] 1465 	jr	00101$
   59B3                    1466 00103$:
                           1467 ;src/main.c:382: dibujarProta();
   59B3 CD B6 52      [17] 1468 	call	_dibujarProta
   59B6 C9            [10] 1469 	ret
                           1470 ;src/main.c:385: void main(void) {
                           1471 ;	---------------------------------
                           1472 ; Function main
                           1473 ; ---------------------------------
   59B7                    1474 _main::
                           1475 ;src/main.c:388: inicializar();
   59B7 CD 34 59      [17] 1476 	call	_inicializar
                           1477 ;src/main.c:389: cpct_akp_musicPlay();
   59BA CD 86 49      [17] 1478 	call	_cpct_akp_musicPlay
                           1479 ;src/main.c:392: while (1) {
   59BD                    1480 00104$:
                           1481 ;src/main.c:395: comprobarTeclado();
   59BD CD FB 57      [17] 1482 	call	_comprobarTeclado
                           1483 ;src/main.c:397: cpct_waitVSYNC();
   59C0 CD 6E 49      [17] 1484 	call	_cpct_waitVSYNC
                           1485 ;src/main.c:398: moverCuchillo();
   59C3 CD 3C 58      [17] 1486 	call	_moverCuchillo
                           1487 ;src/main.c:400: if (prota.mover) {
   59C6 3A 42 52      [13] 1488 	ld	a, (#(_prota + 0x0006) + 0)
   59C9 B7            [ 4] 1489 	or	a, a
   59CA 28 F1         [12] 1490 	jr	Z,00104$
                           1491 ;src/main.c:402: redibujarProta();
   59CC CD 3F 53      [17] 1492 	call	_redibujarProta
                           1493 ;src/main.c:403: prota.mover = NO;
   59CF 21 42 52      [10] 1494 	ld	hl,#(_prota + 0x0006)
   59D2 36 00         [10] 1495 	ld	(hl),#0x00
   59D4 18 E7         [12] 1496 	jr	00104$
                           1497 	.area _CODE
                           1498 	.area _INITIALIZER
                           1499 	.area _CABS (ABS)
   3F00                    1500 	.org 0x3F00
   3F00                    1501 _G_song:
   3F00 41                 1502 	.db #0x41	; 65	'A'
   3F01 54                 1503 	.db #0x54	; 84	'T'
   3F02 31                 1504 	.db #0x31	; 49	'1'
   3F03 30                 1505 	.db #0x30	; 48	'0'
   3F04 01                 1506 	.db #0x01	; 1
   3F05 40                 1507 	.db #0x40	; 64
   3F06 42                 1508 	.db #0x42	; 66	'B'
   3F07 0F                 1509 	.db #0x0F	; 15
   3F08 02                 1510 	.db #0x02	; 2
   3F09 06                 1511 	.db #0x06	; 6
   3F0A 1D                 1512 	.db #0x1D	; 29
   3F0B 00                 1513 	.db #0x00	; 0
   3F0C 10                 1514 	.db #0x10	; 16
   3F0D 40                 1515 	.db #0x40	; 64
   3F0E 19                 1516 	.db #0x19	; 25
   3F0F 40                 1517 	.db #0x40	; 64
   3F10 00                 1518 	.db #0x00	; 0
   3F11 00                 1519 	.db #0x00	; 0
   3F12 00                 1520 	.db #0x00	; 0
   3F13 00                 1521 	.db #0x00	; 0
   3F14 00                 1522 	.db #0x00	; 0
   3F15 00                 1523 	.db #0x00	; 0
   3F16 0D                 1524 	.db #0x0D	; 13
   3F17 12                 1525 	.db #0x12	; 18
   3F18 40                 1526 	.db #0x40	; 64
   3F19 01                 1527 	.db #0x01	; 1
   3F1A 00                 1528 	.db #0x00	; 0
   3F1B 7C                 1529 	.db #0x7C	; 124
   3F1C 18                 1530 	.db #0x18	; 24
   3F1D 78                 1531 	.db #0x78	; 120	'x'
   3F1E 0C                 1532 	.db #0x0C	; 12
   3F1F 34                 1533 	.db #0x34	; 52	'4'
   3F20 30                 1534 	.db #0x30	; 48	'0'
   3F21 2C                 1535 	.db #0x2C	; 44
   3F22 28                 1536 	.db #0x28	; 40
   3F23 24                 1537 	.db #0x24	; 36
   3F24 20                 1538 	.db #0x20	; 32
   3F25 1C                 1539 	.db #0x1C	; 28
   3F26 0D                 1540 	.db #0x0D	; 13
   3F27 25                 1541 	.db #0x25	; 37
   3F28 40                 1542 	.db #0x40	; 64
   3F29 20                 1543 	.db #0x20	; 32
   3F2A 00                 1544 	.db #0x00	; 0
   3F2B 00                 1545 	.db #0x00	; 0
   3F2C 00                 1546 	.db #0x00	; 0
   3F2D 39                 1547 	.db #0x39	; 57	'9'
   3F2E 40                 1548 	.db #0x40	; 64
   3F2F 00                 1549 	.db #0x00	; 0
   3F30 57                 1550 	.db #0x57	; 87	'W'
   3F31 40                 1551 	.db #0x40	; 64
   3F32 3B                 1552 	.db #0x3B	; 59
   3F33 40                 1553 	.db #0x40	; 64
   3F34 57                 1554 	.db #0x57	; 87	'W'
   3F35 40                 1555 	.db #0x40	; 64
   3F36 01                 1556 	.db #0x01	; 1
   3F37 2F                 1557 	.db #0x2F	; 47
   3F38 40                 1558 	.db #0x40	; 64
   3F39 19                 1559 	.db #0x19	; 25
   3F3A 00                 1560 	.db #0x00	; 0
   3F3B 76                 1561 	.db #0x76	; 118	'v'
   3F3C E1                 1562 	.db #0xE1	; 225
   3F3D 00                 1563 	.db #0x00	; 0
   3F3E 00                 1564 	.db #0x00	; 0
   3F3F 01                 1565 	.db #0x01	; 1
   3F40 04                 1566 	.db #0x04	; 4
   3F41 51                 1567 	.db #0x51	; 81	'Q'
   3F42 04                 1568 	.db #0x04	; 4
   3F43 37                 1569 	.db #0x37	; 55	'7'
   3F44 04                 1570 	.db #0x04	; 4
   3F45 4F                 1571 	.db #0x4F	; 79	'O'
   3F46 04                 1572 	.db #0x04	; 4
   3F47 37                 1573 	.db #0x37	; 55	'7'
   3F48 02                 1574 	.db #0x02	; 2
   3F49 4B                 1575 	.db #0x4B	; 75	'K'
   3F4A 02                 1576 	.db #0x02	; 2
   3F4B 37                 1577 	.db #0x37	; 55	'7'
   3F4C 04                 1578 	.db #0x04	; 4
   3F4D 4F                 1579 	.db #0x4F	; 79	'O'
   3F4E 04                 1580 	.db #0x04	; 4
   3F4F 37                 1581 	.db #0x37	; 55	'7'
   3F50 04                 1582 	.db #0x04	; 4
   3F51 4F                 1583 	.db #0x4F	; 79	'O'
   3F52 04                 1584 	.db #0x04	; 4
   3F53 37                 1585 	.db #0x37	; 55	'7'
   3F54 02                 1586 	.db #0x02	; 2
   3F55 4B                 1587 	.db #0x4B	; 75	'K'
   3F56 00                 1588 	.db #0x00	; 0
   3F57 42                 1589 	.db #0x42	; 66	'B'
   3F58 60                 1590 	.db #0x60	; 96
   3F59 00                 1591 	.db #0x00	; 0
   3F5A 42                 1592 	.db #0x42	; 66	'B'
   3F5B 80                 1593 	.db #0x80	; 128
   3F5C 00                 1594 	.db #0x00	; 0
   3F5D 00                 1595 	.db #0x00	; 0
   3F5E 42                 1596 	.db #0x42	; 66	'B'
   3F5F 00                 1597 	.db #0x00	; 0
   3F60 00                 1598 	.db #0x00	; 0
