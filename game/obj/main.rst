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
                             24 	.globl _redibujarProta
                             25 	.globl _borrarProta
                             26 	.globl _dibujarProta
                             27 	.globl _dibujarMapa
                             28 	.globl _cpct_etm_setTileset2x4
                             29 	.globl _cpct_etm_drawTileBox2x4
                             30 	.globl _cpct_akp_musicPlay
                             31 	.globl _cpct_akp_musicInit
                             32 	.globl _cpct_getScreenPtr
                             33 	.globl _cpct_setPalette
                             34 	.globl _cpct_waitVSYNC
                             35 	.globl _cpct_setVideoMode
                             36 	.globl _cpct_drawSpriteMaskedAlignedTable
                             37 	.globl _cpct_isAnyKeyPressed
                             38 	.globl _cpct_isKeyPressed
                             39 	.globl _cpct_scanKeyboard_if
                             40 	.globl _cpct_disableFirmware
                             41 	.globl _availableCycles
                             42 	.globl _availableMicroSecs
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
   51D8                      55 _EMirar::
   51D8                      56 	.ds 1
   51D9                      57 _EEje::
   51D9                      58 	.ds 1
   51DA                      59 _prota::
   51DA                      60 	.ds 8
   51E2                      61 _cu::
   51E2                      62 	.ds 9
   51EB                      63 _mapa::
   51EB                      64 	.ds 2
   51ED                      65 _availableMicroSecs::
   51ED                      66 	.ds 1
   51EE                      67 _availableCycles::
   51EE                      68 	.ds 1
                             69 ;--------------------------------------------------------
                             70 ; ram data
                             71 ;--------------------------------------------------------
                             72 	.area _INITIALIZED
                             73 ;--------------------------------------------------------
                             74 ; absolute external ram data
                             75 ;--------------------------------------------------------
                             76 	.area _DABS (ABS)
                             77 ;--------------------------------------------------------
                             78 ; global & static initialisations
                             79 ;--------------------------------------------------------
                             80 	.area _HOME
                             81 	.area _GSINIT
                             82 	.area _GSFINAL
                             83 	.area _GSINIT
                             84 ;--------------------------------------------------------
                             85 ; Home
                             86 ;--------------------------------------------------------
                             87 	.area _HOME
                             88 	.area _HOME
                             89 ;--------------------------------------------------------
                             90 ; code
                             91 ;--------------------------------------------------------
                             92 	.area _CODE
                             93 ;src/main.c:86: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0);
                             94 ;	---------------------------------
                             95 ; Function dummy_cpct_transparentMaskTable0M0_container
                             96 ; ---------------------------------
   47B6                      97 _dummy_cpct_transparentMaskTable0M0_container::
                             98 	.area _g_tablatrans_ (ABS) 
   3E00                      99 	.org 0x3E00 
   3E00                     100 	 _g_tablatrans::
   3E00 FF AA 55 00 AA AA   101 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E08 55 00 55 00 00 00   102 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E10 AA AA 00 00 AA AA   103 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E18 00 00 00 00 00 00   104 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E20 55 00 55 00 00 00   105 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E28 55 00 55 00 00 00   106 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E30 00 00 00 00 00 00   107 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E38 00 00 00 00 00 00   108 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E40 AA AA 00 00 AA AA   109 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E48 00 00 00 00 00 00   110 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E50 AA AA 00 00 AA AA   111 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E58 00 00 00 00 00 00   112 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E60 00 00 00 00 00 00   113 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E68 00 00 00 00 00 00   114 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E70 00 00 00 00 00 00   115 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E78 00 00 00 00 00 00   116 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E80 55 00 55 00 00 00   117 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E88 55 00 55 00 00 00   118 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E90 00 00 00 00 00 00   119 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E98 00 00 00 00 00 00   120 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA0 55 00 55 00 00 00   121 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA8 55 00 55 00 00 00   122 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB0 00 00 00 00 00 00   123 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB8 00 00 00 00 00 00   124 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC0 00 00 00 00 00 00   125 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC8 00 00 00 00 00 00   126 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED0 00 00 00 00 00 00   127 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED8 00 00 00 00 00 00   128 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE0 00 00 00 00 00 00   129 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE8 00 00 00 00 00 00   130 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF0 00 00 00 00 00 00   131 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF8 00 00 00 00 00 00   132 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            133 	.area _CSEG (REL, CON) 
                            134 ;src/main.c:88: void dibujarMapa() {
                            135 ;	---------------------------------
                            136 ; Function dibujarMapa
                            137 ; ---------------------------------
   51EF                     138 _dibujarMapa::
                            139 ;src/main.c:89: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   51EF 2A EB 51      [16]  140 	ld	hl,(_mapa)
   51F2 E5            [11]  141 	push	hl
   51F3 21 00 C0      [10]  142 	ld	hl,#0xC000
   51F6 E5            [11]  143 	push	hl
   51F7 21 28 28      [10]  144 	ld	hl,#0x2828
   51FA E5            [11]  145 	push	hl
   51FB 2E 00         [ 7]  146 	ld	l, #0x00
   51FD E5            [11]  147 	push	hl
   51FE AF            [ 4]  148 	xor	a, a
   51FF F5            [11]  149 	push	af
   5200 33            [ 6]  150 	inc	sp
   5201 CD D9 47      [17]  151 	call	_cpct_etm_drawTileBox2x4
   5204 C9            [10]  152 	ret
                            153 ;src/main.c:94: void dibujarProta() {
                            154 ;	---------------------------------
                            155 ; Function dibujarProta
                            156 ; ---------------------------------
   5205                     157 _dibujarProta::
                            158 ;src/main.c:95: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   5205 21 DB 51      [10]  159 	ld	hl, #_prota + 1
   5208 56            [ 7]  160 	ld	d,(hl)
   5209 21 DA 51      [10]  161 	ld	hl, #_prota + 0
   520C 46            [ 7]  162 	ld	b,(hl)
   520D D5            [11]  163 	push	de
   520E 33            [ 6]  164 	inc	sp
   520F C5            [11]  165 	push	bc
   5210 33            [ 6]  166 	inc	sp
   5211 21 00 C0      [10]  167 	ld	hl,#0xC000
   5214 E5            [11]  168 	push	hl
   5215 CD 7D 51      [17]  169 	call	_cpct_getScreenPtr
   5218 EB            [ 4]  170 	ex	de,hl
                            171 ;src/main.c:96: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   5219 ED 4B DE 51   [20]  172 	ld	bc, (#_prota + 4)
   521D 21 00 3E      [10]  173 	ld	hl,#_g_tablatrans
   5220 E5            [11]  174 	push	hl
   5221 21 08 1B      [10]  175 	ld	hl,#0x1B08
   5224 E5            [11]  176 	push	hl
   5225 D5            [11]  177 	push	de
   5226 C5            [11]  178 	push	bc
   5227 CD 9D 51      [17]  179 	call	_cpct_drawSpriteMaskedAlignedTable
   522A C9            [10]  180 	ret
                            181 ;src/main.c:99: void borrarProta() {
                            182 ;	---------------------------------
                            183 ; Function borrarProta
                            184 ; ---------------------------------
   522B                     185 _borrarProta::
   522B DD E5         [15]  186 	push	ix
   522D DD 21 00 00   [14]  187 	ld	ix,#0
   5231 DD 39         [15]  188 	add	ix,sp
   5233 3B            [ 6]  189 	dec	sp
                            190 ;src/main.c:100: u8 w = 4 + (prota.px & 1);
   5234 21 DC 51      [10]  191 	ld	hl, #_prota + 2
   5237 4E            [ 7]  192 	ld	c,(hl)
   5238 79            [ 4]  193 	ld	a,c
   5239 E6 01         [ 7]  194 	and	a, #0x01
   523B 47            [ 4]  195 	ld	b,a
   523C 04            [ 4]  196 	inc	b
   523D 04            [ 4]  197 	inc	b
   523E 04            [ 4]  198 	inc	b
   523F 04            [ 4]  199 	inc	b
                            200 ;src/main.c:101: u8 h = 7 + (prota.py & 3 ? 1 : 0);
   5240 21 DD 51      [10]  201 	ld	hl, #_prota + 3
   5243 5E            [ 7]  202 	ld	e,(hl)
   5244 7B            [ 4]  203 	ld	a,e
   5245 E6 03         [ 7]  204 	and	a, #0x03
   5247 28 04         [12]  205 	jr	Z,00103$
   5249 3E 01         [ 7]  206 	ld	a,#0x01
   524B 18 02         [12]  207 	jr	00104$
   524D                     208 00103$:
   524D 3E 00         [ 7]  209 	ld	a,#0x00
   524F                     210 00104$:
   524F C6 07         [ 7]  211 	add	a, #0x07
   5251 DD 77 FF      [19]  212 	ld	-1 (ix),a
                            213 ;src/main.c:102: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   5254 FD 2A EB 51   [20]  214 	ld	iy,(_mapa)
   5258 16 00         [ 7]  215 	ld	d,#0x00
   525A 63            [ 4]  216 	ld	h,e
   525B 6A            [ 4]  217 	ld	l,d
   525C CB 7A         [ 8]  218 	bit	7, d
   525E 28 05         [12]  219 	jr	Z,00105$
   5260 13            [ 6]  220 	inc	de
   5261 13            [ 6]  221 	inc	de
   5262 13            [ 6]  222 	inc	de
   5263 63            [ 4]  223 	ld	h,e
   5264 6A            [ 4]  224 	ld	l,d
   5265                     225 00105$:
   5265 5C            [ 4]  226 	ld	e, h
   5266 55            [ 4]  227 	ld	d, l
   5267 CB 2A         [ 8]  228 	sra	d
   5269 CB 1B         [ 8]  229 	rr	e
   526B CB 2A         [ 8]  230 	sra	d
   526D CB 1B         [ 8]  231 	rr	e
   526F 51            [ 4]  232 	ld	d,c
   5270 CB 3A         [ 8]  233 	srl	d
   5272 FD E5         [15]  234 	push	iy
   5274 21 00 C0      [10]  235 	ld	hl,#0xC000
   5277 E5            [11]  236 	push	hl
   5278 3E 28         [ 7]  237 	ld	a,#0x28
   527A F5            [11]  238 	push	af
   527B 33            [ 6]  239 	inc	sp
   527C DD 7E FF      [19]  240 	ld	a,-1 (ix)
   527F F5            [11]  241 	push	af
   5280 33            [ 6]  242 	inc	sp
   5281 C5            [11]  243 	push	bc
   5282 33            [ 6]  244 	inc	sp
   5283 7B            [ 4]  245 	ld	a,e
   5284 F5            [11]  246 	push	af
   5285 33            [ 6]  247 	inc	sp
   5286 D5            [11]  248 	push	de
   5287 33            [ 6]  249 	inc	sp
   5288 CD D9 47      [17]  250 	call	_cpct_etm_drawTileBox2x4
   528B 33            [ 6]  251 	inc	sp
   528C DD E1         [14]  252 	pop	ix
   528E C9            [10]  253 	ret
                            254 ;src/main.c:105: void redibujarProta() {
                            255 ;	---------------------------------
                            256 ; Function redibujarProta
                            257 ; ---------------------------------
   528F                     258 _redibujarProta::
                            259 ;src/main.c:106: borrarProta();
   528F CD 2B 52      [17]  260 	call	_borrarProta
                            261 ;src/main.c:107: prota.px = prota.x;
   5292 01 DC 51      [10]  262 	ld	bc,#_prota + 2
   5295 3A DA 51      [13]  263 	ld	a, (#_prota + 0)
   5298 02            [ 7]  264 	ld	(bc),a
                            265 ;src/main.c:108: prota.py = prota.y;
   5299 01 DD 51      [10]  266 	ld	bc,#_prota + 3
   529C 3A DB 51      [13]  267 	ld	a, (#_prota + 1)
   529F 02            [ 7]  268 	ld	(bc),a
                            269 ;src/main.c:109: dibujarProta();
   52A0 C3 05 52      [10]  270 	jp  _dibujarProta
                            271 ;src/main.c:112: void moverIzquierda() {
                            272 ;	---------------------------------
                            273 ; Function moverIzquierda
                            274 ; ---------------------------------
   52A3                     275 _moverIzquierda::
                            276 ;src/main.c:113: if (prota.x > LIMITE_IZQUIERDO) {
   52A3 01 DA 51      [10]  277 	ld	bc,#_prota+0
   52A6 0A            [ 7]  278 	ld	a,(bc)
   52A7 5F            [ 4]  279 	ld	e,a
   52A8 3E 04         [ 7]  280 	ld	a,#0x04
   52AA 93            [ 4]  281 	sub	a, e
   52AB D0            [11]  282 	ret	NC
                            283 ;src/main.c:114: prota.x--;
   52AC 1D            [ 4]  284 	dec	e
   52AD 7B            [ 4]  285 	ld	a,e
   52AE 02            [ 7]  286 	ld	(bc),a
                            287 ;src/main.c:115: prota.mover  = SI;
   52AF 21 E0 51      [10]  288 	ld	hl,#(_prota + 0x0006)
   52B2 36 01         [10]  289 	ld	(hl),#0x01
                            290 ;src/main.c:116: prota.mira=M_izquierda;
   52B4 21 E1 51      [10]  291 	ld	hl,#(_prota + 0x0007)
   52B7 36 01         [10]  292 	ld	(hl),#0x01
   52B9 C9            [10]  293 	ret
                            294 ;src/main.c:121: void moverDerecha() {
                            295 ;	---------------------------------
                            296 ; Function moverDerecha
                            297 ; ---------------------------------
   52BA                     298 _moverDerecha::
                            299 ;src/main.c:122: if (prota.x < LIMITE_DERECHO - G_HERO_W) {
   52BA 21 DA 51      [10]  300 	ld	hl,#_prota+0
   52BD 4E            [ 7]  301 	ld	c,(hl)
   52BE 79            [ 4]  302 	ld	a,c
   52BF D6 44         [ 7]  303 	sub	a, #0x44
   52C1 D0            [11]  304 	ret	NC
                            305 ;src/main.c:123: prota.x++;
   52C2 0C            [ 4]  306 	inc	c
   52C3 71            [ 7]  307 	ld	(hl),c
                            308 ;src/main.c:124: prota.mover  = SI;
   52C4 21 E0 51      [10]  309 	ld	hl,#(_prota + 0x0006)
   52C7 36 01         [10]  310 	ld	(hl),#0x01
                            311 ;src/main.c:125: prota.mira=M_derecha;
   52C9 21 E1 51      [10]  312 	ld	hl,#(_prota + 0x0007)
   52CC 36 00         [10]  313 	ld	(hl),#0x00
   52CE C9            [10]  314 	ret
                            315 ;src/main.c:129: void moverArriba() {
                            316 ;	---------------------------------
                            317 ; Function moverArriba
                            318 ; ---------------------------------
   52CF                     319 _moverArriba::
                            320 ;src/main.c:130: if (prota.y > LIMITE_SUPERIOR) {
   52CF 21 DB 51      [10]  321 	ld	hl,#_prota + 1
   52D2 4E            [ 7]  322 	ld	c,(hl)
   52D3 3E 08         [ 7]  323 	ld	a,#0x08
   52D5 91            [ 4]  324 	sub	a, c
   52D6 D0            [11]  325 	ret	NC
                            326 ;src/main.c:131: prota.y--;
   52D7 0D            [ 4]  327 	dec	c
   52D8 71            [ 7]  328 	ld	(hl),c
                            329 ;src/main.c:132: prota.mover  = SI;
   52D9 21 E0 51      [10]  330 	ld	hl,#(_prota + 0x0006)
   52DC 36 01         [10]  331 	ld	(hl),#0x01
                            332 ;src/main.c:133: prota.mira = M_arriba;
   52DE 21 E1 51      [10]  333 	ld	hl,#(_prota + 0x0007)
   52E1 36 02         [10]  334 	ld	(hl),#0x02
   52E3 C9            [10]  335 	ret
                            336 ;src/main.c:137: void moverAbajo() {
                            337 ;	---------------------------------
                            338 ; Function moverAbajo
                            339 ; ---------------------------------
   52E4                     340 _moverAbajo::
                            341 ;src/main.c:138: if(prota.y < LIMITE_INFERIOR - G_HERO_H){
   52E4 21 DB 51      [10]  342 	ld	hl,#_prota + 1
   52E7 4E            [ 7]  343 	ld	c,(hl)
   52E8 79            [ 4]  344 	ld	a,c
   52E9 D6 7D         [ 7]  345 	sub	a, #0x7D
   52EB D0            [11]  346 	ret	NC
                            347 ;src/main.c:139: prota.y++;
   52EC 0C            [ 4]  348 	inc	c
   52ED 71            [ 7]  349 	ld	(hl),c
                            350 ;src/main.c:140: prota.mover  = SI;
   52EE 21 E0 51      [10]  351 	ld	hl,#(_prota + 0x0006)
   52F1 36 01         [10]  352 	ld	(hl),#0x01
                            353 ;src/main.c:141: prota.mira = M_abajo;
   52F3 21 E1 51      [10]  354 	ld	hl,#(_prota + 0x0007)
   52F6 36 03         [10]  355 	ld	(hl),#0x03
   52F8 C9            [10]  356 	ret
                            357 ;src/main.c:145: void dibujarCuchillo(u8 eje) {
                            358 ;	---------------------------------
                            359 ; Function dibujarCuchillo
                            360 ; ---------------------------------
   52F9                     361 _dibujarCuchillo::
   52F9 DD E5         [15]  362 	push	ix
   52FB DD 21 00 00   [14]  363 	ld	ix,#0
   52FF DD 39         [15]  364 	add	ix,sp
   5301 F5            [11]  365 	push	af
                            366 ;src/main.c:146: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   5302 21 E3 51      [10]  367 	ld	hl, #_cu + 1
   5305 56            [ 7]  368 	ld	d,(hl)
   5306 21 E2 51      [10]  369 	ld	hl, #_cu + 0
   5309 46            [ 7]  370 	ld	b,(hl)
   530A D5            [11]  371 	push	de
   530B 33            [ 6]  372 	inc	sp
   530C C5            [11]  373 	push	bc
   530D 33            [ 6]  374 	inc	sp
   530E 21 00 C0      [10]  375 	ld	hl,#0xC000
   5311 E5            [11]  376 	push	hl
   5312 CD 7D 51      [17]  377 	call	_cpct_getScreenPtr
                            378 ;src/main.c:148: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   5315 33            [ 6]  379 	inc	sp
   5316 33            [ 6]  380 	inc	sp
   5317 E5            [11]  381 	push	hl
                            382 ;src/main.c:147: if(eje == E_X){
   5318 DD 7E 04      [19]  383 	ld	a,4 (ix)
   531B B7            [ 4]  384 	or	a, a
   531C 20 19         [12]  385 	jr	NZ,00104$
                            386 ;src/main.c:148: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   531E 11 00 3E      [10]  387 	ld	de,#_g_tablatrans+0
   5321 ED 4B E6 51   [20]  388 	ld	bc, (#(_cu + 0x0004) + 0)
   5325 D5            [11]  389 	push	de
   5326 21 03 03      [10]  390 	ld	hl,#0x0303
   5329 E5            [11]  391 	push	hl
   532A DD 6E FE      [19]  392 	ld	l,-2 (ix)
   532D DD 66 FF      [19]  393 	ld	h,-1 (ix)
   5330 E5            [11]  394 	push	hl
   5331 C5            [11]  395 	push	bc
   5332 CD 9D 51      [17]  396 	call	_cpct_drawSpriteMaskedAlignedTable
   5335 18 1D         [12]  397 	jr	00106$
   5337                     398 00104$:
                            399 ;src/main.c:151: else if(eje == E_Y){
   5337 DD 7E 04      [19]  400 	ld	a,4 (ix)
   533A 3D            [ 4]  401 	dec	a
   533B 20 17         [12]  402 	jr	NZ,00106$
                            403 ;src/main.c:152: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   533D 11 00 3E      [10]  404 	ld	de,#_g_tablatrans+0
   5340 ED 4B E6 51   [20]  405 	ld	bc, (#(_cu + 0x0004) + 0)
   5344 D5            [11]  406 	push	de
   5345 21 02 06      [10]  407 	ld	hl,#0x0602
   5348 E5            [11]  408 	push	hl
   5349 DD 6E FE      [19]  409 	ld	l,-2 (ix)
   534C DD 66 FF      [19]  410 	ld	h,-1 (ix)
   534F E5            [11]  411 	push	hl
   5350 C5            [11]  412 	push	bc
   5351 CD 9D 51      [17]  413 	call	_cpct_drawSpriteMaskedAlignedTable
   5354                     414 00106$:
   5354 DD F9         [10]  415 	ld	sp, ix
   5356 DD E1         [14]  416 	pop	ix
   5358 C9            [10]  417 	ret
                            418 ;src/main.c:156: void borrarCuchillo() {
                            419 ;	---------------------------------
                            420 ; Function borrarCuchillo
                            421 ; ---------------------------------
   5359                     422 _borrarCuchillo::
   5359 DD E5         [15]  423 	push	ix
   535B DD 21 00 00   [14]  424 	ld	ix,#0
   535F DD 39         [15]  425 	add	ix,sp
   5361 3B            [ 6]  426 	dec	sp
                            427 ;src/main.c:157: u8 w = 2 + (cu.px & 1);
   5362 21 E4 51      [10]  428 	ld	hl, #_cu + 2
   5365 4E            [ 7]  429 	ld	c,(hl)
   5366 79            [ 4]  430 	ld	a,c
   5367 E6 01         [ 7]  431 	and	a, #0x01
   5369 47            [ 4]  432 	ld	b,a
   536A 04            [ 4]  433 	inc	b
   536B 04            [ 4]  434 	inc	b
                            435 ;src/main.c:158: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   536C 21 E5 51      [10]  436 	ld	hl, #_cu + 3
   536F 5E            [ 7]  437 	ld	e,(hl)
   5370 7B            [ 4]  438 	ld	a,e
   5371 E6 03         [ 7]  439 	and	a, #0x03
   5373 28 04         [12]  440 	jr	Z,00103$
   5375 3E 01         [ 7]  441 	ld	a,#0x01
   5377 18 02         [12]  442 	jr	00104$
   5379                     443 00103$:
   5379 3E 00         [ 7]  444 	ld	a,#0x00
   537B                     445 00104$:
   537B C6 02         [ 7]  446 	add	a, #0x02
   537D DD 77 FF      [19]  447 	ld	-1 (ix),a
                            448 ;src/main.c:159: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   5380 FD 2A EB 51   [20]  449 	ld	iy,(_mapa)
   5384 16 00         [ 7]  450 	ld	d,#0x00
   5386 63            [ 4]  451 	ld	h,e
   5387 6A            [ 4]  452 	ld	l,d
   5388 CB 7A         [ 8]  453 	bit	7, d
   538A 28 05         [12]  454 	jr	Z,00105$
   538C 13            [ 6]  455 	inc	de
   538D 13            [ 6]  456 	inc	de
   538E 13            [ 6]  457 	inc	de
   538F 63            [ 4]  458 	ld	h,e
   5390 6A            [ 4]  459 	ld	l,d
   5391                     460 00105$:
   5391 5C            [ 4]  461 	ld	e, h
   5392 55            [ 4]  462 	ld	d, l
   5393 CB 2A         [ 8]  463 	sra	d
   5395 CB 1B         [ 8]  464 	rr	e
   5397 CB 2A         [ 8]  465 	sra	d
   5399 CB 1B         [ 8]  466 	rr	e
   539B 51            [ 4]  467 	ld	d,c
   539C CB 3A         [ 8]  468 	srl	d
   539E FD E5         [15]  469 	push	iy
   53A0 21 00 C0      [10]  470 	ld	hl,#0xC000
   53A3 E5            [11]  471 	push	hl
   53A4 3E 28         [ 7]  472 	ld	a,#0x28
   53A6 F5            [11]  473 	push	af
   53A7 33            [ 6]  474 	inc	sp
   53A8 DD 7E FF      [19]  475 	ld	a,-1 (ix)
   53AB F5            [11]  476 	push	af
   53AC 33            [ 6]  477 	inc	sp
   53AD C5            [11]  478 	push	bc
   53AE 33            [ 6]  479 	inc	sp
   53AF 7B            [ 4]  480 	ld	a,e
   53B0 F5            [11]  481 	push	af
   53B1 33            [ 6]  482 	inc	sp
   53B2 D5            [11]  483 	push	de
   53B3 33            [ 6]  484 	inc	sp
   53B4 CD D9 47      [17]  485 	call	_cpct_etm_drawTileBox2x4
   53B7 33            [ 6]  486 	inc	sp
   53B8 DD E1         [14]  487 	pop	ix
   53BA C9            [10]  488 	ret
                            489 ;src/main.c:162: void redibujarCuchillo() {
                            490 ;	---------------------------------
                            491 ; Function redibujarCuchillo
                            492 ; ---------------------------------
   53BB                     493 _redibujarCuchillo::
                            494 ;src/main.c:163: borrarCuchillo();
   53BB CD 59 53      [17]  495 	call	_borrarCuchillo
                            496 ;src/main.c:164: cu.px = cu.x;
   53BE 3A E2 51      [13]  497 	ld	a, (#_cu + 0)
   53C1 32 E4 51      [13]  498 	ld	(#(_cu + 0x0002)),a
                            499 ;src/main.c:165: cu.py = cu.y;
   53C4 3A E3 51      [13]  500 	ld	a, (#_cu + 1)
   53C7 32 E5 51      [13]  501 	ld	(#(_cu + 0x0003)),a
                            502 ;src/main.c:166: dibujarCuchillo(cu.eje);
   53CA 21 EA 51      [10]  503 	ld	hl, #_cu + 8
   53CD 46            [ 7]  504 	ld	b,(hl)
   53CE C5            [11]  505 	push	bc
   53CF 33            [ 6]  506 	inc	sp
   53D0 CD F9 52      [17]  507 	call	_dibujarCuchillo
   53D3 33            [ 6]  508 	inc	sp
   53D4 C9            [10]  509 	ret
                            510 ;src/main.c:170: void lanzarCuchillo(){
                            511 ;	---------------------------------
                            512 ; Function lanzarCuchillo
                            513 ; ---------------------------------
   53D5                     514 _lanzarCuchillo::
                            515 ;src/main.c:171: cu.lanzado = SI;
   53D5 11 E2 51      [10]  516 	ld	de,#_cu+0
   53D8 21 E8 51      [10]  517 	ld	hl,#(_cu + 0x0006)
   53DB 36 01         [10]  518 	ld	(hl),#0x01
                            519 ;src/main.c:172: if(prota.mira == M_derecha){
   53DD 21 E1 51      [10]  520 	ld	hl, #_prota + 7
   53E0 4E            [ 7]  521 	ld	c,(hl)
                            522 ;src/main.c:173: cu.direccion = M_derecha;
                            523 ;src/main.c:175: cu.y=prota.y + G_HERO_H /2;	
                            524 ;src/main.c:176: cu.sprite=g_knifeX_0;
                            525 ;src/main.c:177: cu.eje = E_X;
                            526 ;src/main.c:172: if(prota.mira == M_derecha){
   53E1 79            [ 4]  527 	ld	a,c
   53E2 B7            [ 4]  528 	or	a, a
   53E3 20 29         [12]  529 	jr	NZ,00110$
                            530 ;src/main.c:173: cu.direccion = M_derecha;
   53E5 21 E9 51      [10]  531 	ld	hl,#(_cu + 0x0007)
   53E8 36 00         [10]  532 	ld	(hl),#0x00
                            533 ;src/main.c:174: cu.x=prota.x + G_HERO_W;
   53EA 3A DA 51      [13]  534 	ld	a, (#_prota + 0)
   53ED C6 08         [ 7]  535 	add	a, #0x08
   53EF 12            [ 7]  536 	ld	(de),a
                            537 ;src/main.c:175: cu.y=prota.y + G_HERO_H /2;	
   53F0 3A DB 51      [13]  538 	ld	a, (#(_prota + 0x0001) + 0)
   53F3 C6 0D         [ 7]  539 	add	a, #0x0D
   53F5 32 E3 51      [13]  540 	ld	(#(_cu + 0x0001)),a
                            541 ;src/main.c:176: cu.sprite=g_knifeX_0;
   53F8 21 58 46      [10]  542 	ld	hl,#_g_knifeX_0
   53FB 22 E6 51      [16]  543 	ld	((_cu + 0x0004)), hl
                            544 ;src/main.c:177: cu.eje = E_X;
   53FE 21 EA 51      [10]  545 	ld	hl,#(_cu + 0x0008)
   5401 36 00         [10]  546 	ld	(hl),#0x00
                            547 ;src/main.c:178: dibujarCuchillo(cu.eje);
   5403 21 EA 51      [10]  548 	ld	hl, #(_cu + 0x0008) + 0
   5406 46            [ 7]  549 	ld	b,(hl)
   5407 C5            [11]  550 	push	bc
   5408 33            [ 6]  551 	inc	sp
   5409 CD F9 52      [17]  552 	call	_dibujarCuchillo
   540C 33            [ 6]  553 	inc	sp
   540D C9            [10]  554 	ret
   540E                     555 00110$:
                            556 ;src/main.c:180: else if(prota.mira == M_izquierda){
   540E 79            [ 4]  557 	ld	a,c
   540F 3D            [ 4]  558 	dec	a
   5410 20 29         [12]  559 	jr	NZ,00107$
                            560 ;src/main.c:181: cu.direccion = M_izquierda;
   5412 21 E9 51      [10]  561 	ld	hl,#(_cu + 0x0007)
   5415 36 01         [10]  562 	ld	(hl),#0x01
                            563 ;src/main.c:182: cu.x = prota.x - G_KNIFEX_0_W;
   5417 3A DA 51      [13]  564 	ld	a, (#_prota + 0)
   541A C6 FD         [ 7]  565 	add	a,#0xFD
   541C 12            [ 7]  566 	ld	(de),a
                            567 ;src/main.c:183: cu.y = prota.y + G_HERO_H /2;	
   541D 3A DB 51      [13]  568 	ld	a, (#(_prota + 0x0001) + 0)
   5420 C6 0D         [ 7]  569 	add	a, #0x0D
   5422 32 E3 51      [13]  570 	ld	(#(_cu + 0x0001)),a
                            571 ;src/main.c:184: cu.sprite = g_knifeX_1;
   5425 21 61 46      [10]  572 	ld	hl,#_g_knifeX_1
   5428 22 E6 51      [16]  573 	ld	((_cu + 0x0004)), hl
                            574 ;src/main.c:185: cu.eje = E_X;
   542B 21 EA 51      [10]  575 	ld	hl,#(_cu + 0x0008)
   542E 36 00         [10]  576 	ld	(hl),#0x00
                            577 ;src/main.c:186: dibujarCuchillo(cu.eje);
   5430 21 EA 51      [10]  578 	ld	hl, #(_cu + 0x0008) + 0
   5433 46            [ 7]  579 	ld	b,(hl)
   5434 C5            [11]  580 	push	bc
   5435 33            [ 6]  581 	inc	sp
   5436 CD F9 52      [17]  582 	call	_dibujarCuchillo
   5439 33            [ 6]  583 	inc	sp
   543A C9            [10]  584 	ret
   543B                     585 00107$:
                            586 ;src/main.c:188: else if(prota.mira == M_abajo){
   543B 79            [ 4]  587 	ld	a,c
   543C D6 03         [ 7]  588 	sub	a, #0x03
   543E 20 29         [12]  589 	jr	NZ,00104$
                            590 ;src/main.c:189: cu.direccion = M_abajo;
   5440 21 E9 51      [10]  591 	ld	hl,#(_cu + 0x0007)
   5443 36 03         [10]  592 	ld	(hl),#0x03
                            593 ;src/main.c:190: cu.x = prota.x + G_HERO_W / 2;
   5445 3A DA 51      [13]  594 	ld	a, (#_prota + 0)
   5448 C6 04         [ 7]  595 	add	a, #0x04
   544A 12            [ 7]  596 	ld	(de),a
                            597 ;src/main.c:191: cu.y = prota.y + G_HERO_H + 10;	
   544B 3A DB 51      [13]  598 	ld	a, (#(_prota + 0x0001) + 0)
   544E C6 25         [ 7]  599 	add	a, #0x25
   5450 32 E3 51      [13]  600 	ld	(#(_cu + 0x0001)),a
                            601 ;src/main.c:192: cu.sprite = g_knifeY_0;
   5453 21 40 46      [10]  602 	ld	hl,#_g_knifeY_0
   5456 22 E6 51      [16]  603 	ld	((_cu + 0x0004)), hl
                            604 ;src/main.c:193: cu.eje = E_Y;
   5459 21 EA 51      [10]  605 	ld	hl,#(_cu + 0x0008)
   545C 36 01         [10]  606 	ld	(hl),#0x01
                            607 ;src/main.c:194: dibujarCuchillo(cu.eje);
   545E 21 EA 51      [10]  608 	ld	hl, #(_cu + 0x0008) + 0
   5461 46            [ 7]  609 	ld	b,(hl)
   5462 C5            [11]  610 	push	bc
   5463 33            [ 6]  611 	inc	sp
   5464 CD F9 52      [17]  612 	call	_dibujarCuchillo
   5467 33            [ 6]  613 	inc	sp
   5468 C9            [10]  614 	ret
   5469                     615 00104$:
                            616 ;src/main.c:196: else if(prota.mira == M_arriba){
   5469 79            [ 4]  617 	ld	a,c
   546A D6 02         [ 7]  618 	sub	a, #0x02
   546C C0            [11]  619 	ret	NZ
                            620 ;src/main.c:197: cu.direccion = M_arriba;
   546D 21 E9 51      [10]  621 	ld	hl,#(_cu + 0x0007)
   5470 36 02         [10]  622 	ld	(hl),#0x02
                            623 ;src/main.c:198: cu.x = prota.x + G_HERO_W / 2;
   5472 3A DA 51      [13]  624 	ld	a, (#_prota + 0)
   5475 C6 04         [ 7]  625 	add	a, #0x04
   5477 12            [ 7]  626 	ld	(de),a
                            627 ;src/main.c:199: cu.y = prota.y;	
   5478 3A DB 51      [13]  628 	ld	a, (#(_prota + 0x0001) + 0)
   547B 32 E3 51      [13]  629 	ld	(#(_cu + 0x0001)),a
                            630 ;src/main.c:200: cu.sprite = g_knifeY_1;
   547E 21 4C 46      [10]  631 	ld	hl,#_g_knifeY_1
   5481 22 E6 51      [16]  632 	ld	((_cu + 0x0004)), hl
                            633 ;src/main.c:201: cu.eje = E_Y;
   5484 21 EA 51      [10]  634 	ld	hl,#(_cu + 0x0008)
   5487 36 01         [10]  635 	ld	(hl),#0x01
                            636 ;src/main.c:202: dibujarCuchillo(cu.eje);
   5489 21 EA 51      [10]  637 	ld	hl, #(_cu + 0x0008) + 0
   548C 46            [ 7]  638 	ld	b,(hl)
   548D C5            [11]  639 	push	bc
   548E 33            [ 6]  640 	inc	sp
   548F CD F9 52      [17]  641 	call	_dibujarCuchillo
   5492 33            [ 6]  642 	inc	sp
   5493 C9            [10]  643 	ret
                            644 ;src/main.c:206: void comprobarTeclado() {
                            645 ;	---------------------------------
                            646 ; Function comprobarTeclado
                            647 ; ---------------------------------
   5494                     648 _comprobarTeclado::
                            649 ;src/main.c:207: cpct_scanKeyboard_if();
   5494 CD A4 48      [17]  650 	call	_cpct_scanKeyboard_if
                            651 ;src/main.c:209: if (cpct_isAnyKeyPressed()) {
   5497 CD 97 48      [17]  652 	call	_cpct_isAnyKeyPressed
   549A 7D            [ 4]  653 	ld	a,l
   549B B7            [ 4]  654 	or	a, a
   549C C8            [11]  655 	ret	Z
                            656 ;src/main.c:210: if (cpct_isKeyPressed(Key_CursorLeft))
   549D 21 01 01      [10]  657 	ld	hl,#0x0101
   54A0 CD CD 47      [17]  658 	call	_cpct_isKeyPressed
   54A3 7D            [ 4]  659 	ld	a,l
   54A4 B7            [ 4]  660 	or	a, a
                            661 ;src/main.c:211: moverIzquierda();
   54A5 C2 A3 52      [10]  662 	jp	NZ,_moverIzquierda
                            663 ;src/main.c:212: else if (cpct_isKeyPressed(Key_CursorRight))
   54A8 21 00 02      [10]  664 	ld	hl,#0x0200
   54AB CD CD 47      [17]  665 	call	_cpct_isKeyPressed
   54AE 7D            [ 4]  666 	ld	a,l
   54AF B7            [ 4]  667 	or	a, a
                            668 ;src/main.c:213: moverDerecha();
   54B0 C2 BA 52      [10]  669 	jp	NZ,_moverDerecha
                            670 ;src/main.c:214: else if (cpct_isKeyPressed(Key_CursorUp))
   54B3 21 00 01      [10]  671 	ld	hl,#0x0100
   54B6 CD CD 47      [17]  672 	call	_cpct_isKeyPressed
   54B9 7D            [ 4]  673 	ld	a,l
   54BA B7            [ 4]  674 	or	a, a
                            675 ;src/main.c:215: moverArriba();
   54BB C2 CF 52      [10]  676 	jp	NZ,_moverArriba
                            677 ;src/main.c:216: else if (cpct_isKeyPressed(Key_CursorDown))
   54BE 21 00 04      [10]  678 	ld	hl,#0x0400
   54C1 CD CD 47      [17]  679 	call	_cpct_isKeyPressed
   54C4 7D            [ 4]  680 	ld	a,l
   54C5 B7            [ 4]  681 	or	a, a
                            682 ;src/main.c:217: moverAbajo();
   54C6 C2 E4 52      [10]  683 	jp	NZ,_moverAbajo
                            684 ;src/main.c:218: else if (cpct_isKeyPressed(Key_Space))
   54C9 21 05 80      [10]  685 	ld	hl,#0x8005
   54CC CD CD 47      [17]  686 	call	_cpct_isKeyPressed
   54CF 7D            [ 4]  687 	ld	a,l
   54D0 B7            [ 4]  688 	or	a, a
   54D1 C8            [11]  689 	ret	Z
                            690 ;src/main.c:219: lanzarCuchillo();
   54D2 C3 D5 53      [10]  691 	jp  _lanzarCuchillo
                            692 ;src/main.c:225: void moverCuchillo(){
                            693 ;	---------------------------------
                            694 ; Function moverCuchillo
                            695 ; ---------------------------------
   54D5                     696 _moverCuchillo::
                            697 ;src/main.c:227: if(cu.direccion == M_derecha){		
   54D5 01 E2 51      [10]  698 	ld	bc,#_cu+0
   54D8 21 E9 51      [10]  699 	ld	hl, #_cu + 7
   54DB 5E            [ 7]  700 	ld	e,(hl)
                            701 ;src/main.c:234: cu.lanzado = NO;
                            702 ;src/main.c:227: if(cu.direccion == M_derecha){		
   54DC 7B            [ 4]  703 	ld	a,e
   54DD B7            [ 4]  704 	or	a, a
   54DE 20 19         [12]  705 	jr	NZ,00130$
                            706 ;src/main.c:228: if(cu.x< LIMITE_DERECHO - G_KNIFEX_0_W){
   54E0 0A            [ 7]  707 	ld	a,(bc)
   54E1 5F            [ 4]  708 	ld	e,a
   54E2 D6 49         [ 7]  709 	sub	a, #0x49
   54E4 30 06         [12]  710 	jr	NC,00104$
                            711 ;src/main.c:229: cu.x++;
   54E6 1C            [ 4]  712 	inc	e
   54E7 7B            [ 4]  713 	ld	a,e
   54E8 02            [ 7]  714 	ld	(bc),a
                            715 ;src/main.c:230: redibujarCuchillo();
   54E9 C3 BB 53      [10]  716 	jp  _redibujarCuchillo
   54EC                     717 00104$:
                            718 ;src/main.c:232: else if(cu.x == LIMITE_DERECHO  - G_KNIFEX_0_W){
   54EC 7B            [ 4]  719 	ld	a,e
   54ED D6 49         [ 7]  720 	sub	a, #0x49
   54EF C0            [11]  721 	ret	NZ
                            722 ;src/main.c:233: borrarCuchillo();
   54F0 CD 59 53      [17]  723 	call	_borrarCuchillo
                            724 ;src/main.c:234: cu.lanzado = NO;
   54F3 21 E8 51      [10]  725 	ld	hl,#(_cu + 0x0006)
   54F6 36 00         [10]  726 	ld	(hl),#0x00
   54F8 C9            [10]  727 	ret
   54F9                     728 00130$:
                            729 ;src/main.c:237: else if(cu.direccion == M_izquierda){
   54F9 7B            [ 4]  730 	ld	a,e
   54FA 3D            [ 4]  731 	dec	a
   54FB 20 1A         [12]  732 	jr	NZ,00127$
                            733 ;src/main.c:238: if(cu.x > LIMITE_IZQUIERDO){
   54FD 0A            [ 7]  734 	ld	a,(bc)
   54FE 5F            [ 4]  735 	ld	e,a
   54FF 3E 04         [ 7]  736 	ld	a,#0x04
   5501 93            [ 4]  737 	sub	a, e
   5502 30 06         [12]  738 	jr	NC,00109$
                            739 ;src/main.c:239: cu.x--;
   5504 1D            [ 4]  740 	dec	e
   5505 7B            [ 4]  741 	ld	a,e
   5506 02            [ 7]  742 	ld	(bc),a
                            743 ;src/main.c:240: redibujarCuchillo();
   5507 C3 BB 53      [10]  744 	jp  _redibujarCuchillo
   550A                     745 00109$:
                            746 ;src/main.c:241: }else if(cu.x == LIMITE_IZQUIERDO){
   550A 7B            [ 4]  747 	ld	a,e
   550B D6 04         [ 7]  748 	sub	a, #0x04
   550D C0            [11]  749 	ret	NZ
                            750 ;src/main.c:242: borrarCuchillo();
   550E CD 59 53      [17]  751 	call	_borrarCuchillo
                            752 ;src/main.c:243: cu.lanzado = NO;
   5511 21 E8 51      [10]  753 	ld	hl,#(_cu + 0x0006)
   5514 36 00         [10]  754 	ld	(hl),#0x00
   5516 C9            [10]  755 	ret
   5517                     756 00127$:
                            757 ;src/main.c:247: if(cu.y < LIMITE_INFERIOR - G_KNIFEY_0_H){
   5517 69            [ 4]  758 	ld	l, c
   5518 60            [ 4]  759 	ld	h, b
   5519 23            [ 6]  760 	inc	hl
                            761 ;src/main.c:246: else if(cu.direccion == M_abajo){
   551A 7B            [ 4]  762 	ld	a,e
   551B D6 03         [ 7]  763 	sub	a, #0x03
   551D 20 18         [12]  764 	jr	NZ,00124$
                            765 ;src/main.c:247: if(cu.y < LIMITE_INFERIOR - G_KNIFEY_0_H){
   551F 4E            [ 7]  766 	ld	c,(hl)
   5520 79            [ 4]  767 	ld	a,c
   5521 D6 92         [ 7]  768 	sub	a, #0x92
   5523 30 05         [12]  769 	jr	NC,00114$
                            770 ;src/main.c:248: cu.y++;
   5525 0C            [ 4]  771 	inc	c
   5526 71            [ 7]  772 	ld	(hl),c
                            773 ;src/main.c:249: redibujarCuchillo();
   5527 C3 BB 53      [10]  774 	jp  _redibujarCuchillo
   552A                     775 00114$:
                            776 ;src/main.c:250: }else if(cu.y == LIMITE_INFERIOR - G_KNIFEY_0_H){
   552A 79            [ 4]  777 	ld	a,c
   552B D6 92         [ 7]  778 	sub	a, #0x92
   552D C0            [11]  779 	ret	NZ
                            780 ;src/main.c:251: borrarCuchillo();
   552E CD 59 53      [17]  781 	call	_borrarCuchillo
                            782 ;src/main.c:252: cu.lanzado = NO;
   5531 21 E8 51      [10]  783 	ld	hl,#(_cu + 0x0006)
   5534 36 00         [10]  784 	ld	(hl),#0x00
   5536 C9            [10]  785 	ret
   5537                     786 00124$:
                            787 ;src/main.c:255: else if(cu.direccion == M_arriba){
   5537 7B            [ 4]  788 	ld	a,e
   5538 D6 02         [ 7]  789 	sub	a, #0x02
   553A C0            [11]  790 	ret	NZ
                            791 ;src/main.c:256: if(cu.y > LIMITE_SUPERIOR){
   553B 4E            [ 7]  792 	ld	c,(hl)
   553C 3E 08         [ 7]  793 	ld	a,#0x08
   553E 91            [ 4]  794 	sub	a, c
   553F 30 05         [12]  795 	jr	NC,00119$
                            796 ;src/main.c:257: cu.y--;
   5541 0D            [ 4]  797 	dec	c
   5542 71            [ 7]  798 	ld	(hl),c
                            799 ;src/main.c:258: redibujarCuchillo();
   5543 C3 BB 53      [10]  800 	jp  _redibujarCuchillo
   5546                     801 00119$:
                            802 ;src/main.c:259: }else if(cu.y == LIMITE_SUPERIOR){
   5546 79            [ 4]  803 	ld	a,c
   5547 D6 08         [ 7]  804 	sub	a, #0x08
   5549 C0            [11]  805 	ret	NZ
                            806 ;src/main.c:260: borrarCuchillo();
   554A CD 59 53      [17]  807 	call	_borrarCuchillo
                            808 ;src/main.c:261: cu.lanzado = NO;
   554D 21 E8 51      [10]  809 	ld	hl,#(_cu + 0x0006)
   5550 36 00         [10]  810 	ld	(hl),#0x00
   5552 C9            [10]  811 	ret
                            812 ;src/main.c:266: void inicializar() {
                            813 ;	---------------------------------
                            814 ; Function inicializar
                            815 ; ---------------------------------
   5553                     816 _inicializar::
                            817 ;src/main.c:267: cpct_disableFirmware();
   5553 CD 4B 51      [17]  818 	call	_cpct_disableFirmware
                            819 ;src/main.c:268: cpct_setVideoMode(0);
   5556 2E 00         [ 7]  820 	ld	l,#0x00
   5558 CD 14 49      [17]  821 	call	_cpct_setVideoMode
                            822 ;src/main.c:270: cpct_setPalette(g_palette, 16);
   555B 21 10 00      [10]  823 	ld	hl,#0x0010
   555E E5            [11]  824 	push	hl
   555F 21 CE 46      [10]  825 	ld	hl,#_g_palette
   5562 E5            [11]  826 	push	hl
   5563 CD B6 47      [17]  827 	call	_cpct_setPalette
                            828 ;src/main.c:271: cpct_akp_musicInit(G_song);
   5566 21 00 02      [10]  829 	ld	hl,#_G_song
   5569 E5            [11]  830 	push	hl
   556A CD 27 50      [17]  831 	call	_cpct_akp_musicInit
   556D F1            [10]  832 	pop	af
                            833 ;src/main.c:272: mapa = g_map1;
   556E 21 00 40      [10]  834 	ld	hl,#_g_map1+0
   5571 22 EB 51      [16]  835 	ld	(_mapa),hl
                            836 ;src/main.c:273: cpct_etm_setTileset2x4(g_tileset);
   5574 21 6A 46      [10]  837 	ld	hl,#_g_tileset
   5577 CD 68 48      [17]  838 	call	_cpct_etm_setTileset2x4
                            839 ;src/main.c:274: dibujarMapa();
   557A CD EF 51      [17]  840 	call	_dibujarMapa
                            841 ;src/main.c:277: prota.x = prota.px = 0;
   557D 21 DC 51      [10]  842 	ld	hl,#(_prota + 0x0002)
   5580 36 00         [10]  843 	ld	(hl),#0x00
   5582 21 DA 51      [10]  844 	ld	hl,#_prota
   5585 36 00         [10]  845 	ld	(hl),#0x00
                            846 ;src/main.c:278: prota.y = prota.py = 80;
   5587 21 DD 51      [10]  847 	ld	hl,#(_prota + 0x0003)
   558A 36 50         [10]  848 	ld	(hl),#0x50
   558C 21 DB 51      [10]  849 	ld	hl,#(_prota + 0x0001)
   558F 36 50         [10]  850 	ld	(hl),#0x50
                            851 ;src/main.c:279: prota.mover  = NO;
   5591 21 E0 51      [10]  852 	ld	hl,#(_prota + 0x0006)
   5594 36 00         [10]  853 	ld	(hl),#0x00
                            854 ;src/main.c:280: prota.mira=M_derecha;
   5596 21 E1 51      [10]  855 	ld	hl,#(_prota + 0x0007)
   5599 36 00         [10]  856 	ld	(hl),#0x00
                            857 ;src/main.c:281: prota.sprite = g_hero;
   559B 21 DE 46      [10]  858 	ld	hl,#_g_hero
   559E 22 DE 51      [16]  859 	ld	((_prota + 0x0004)), hl
                            860 ;src/main.c:282: cu.x = cu.px =0;
   55A1 11 E2 51      [10]  861 	ld	de,#_cu+0
   55A4 01 E4 51      [10]  862 	ld	bc,#_cu + 2
   55A7 AF            [ 4]  863 	xor	a, a
   55A8 02            [ 7]  864 	ld	(bc),a
   55A9 AF            [ 4]  865 	xor	a, a
   55AA 12            [ 7]  866 	ld	(de),a
                            867 ;src/main.c:283: cu.x = cu.px = 0;
   55AB AF            [ 4]  868 	xor	a, a
   55AC 02            [ 7]  869 	ld	(bc),a
   55AD 21 E2 51      [10]  870 	ld	hl,#_cu
   55B0 36 00         [10]  871 	ld	(hl),#0x00
                            872 ;src/main.c:284: cu.lanzado=0;
   55B2 21 E8 51      [10]  873 	ld	hl,#(_cu + 0x0006)
   55B5 36 00         [10]  874 	ld	(hl),#0x00
                            875 ;src/main.c:286: dibujarProta();
   55B7 CD 05 52      [17]  876 	call	_dibujarProta
   55BA C9            [10]  877 	ret
                            878 ;src/main.c:289: void main(void) {
                            879 ;	---------------------------------
                            880 ; Function main
                            881 ; ---------------------------------
   55BB                     882 _main::
                            883 ;src/main.c:292: inicializar();
   55BB CD 53 55      [17]  884 	call	_inicializar
                            885 ;src/main.c:293: cpct_akp_musicPlay();
   55BE CD 24 49      [17]  886 	call	_cpct_akp_musicPlay
                            887 ;src/main.c:296: while (1) {
   55C1                     888 00106$:
                            889 ;src/main.c:299: comprobarTeclado();
   55C1 CD 94 54      [17]  890 	call	_comprobarTeclado
                            891 ;src/main.c:301: if(cu.lanzado){
   55C4 3A E8 51      [13]  892 	ld	a, (#(_cu + 0x0006) + 0)
   55C7 B7            [ 4]  893 	or	a, a
   55C8 28 06         [12]  894 	jr	Z,00102$
                            895 ;src/main.c:302: cpct_waitVSYNC();
   55CA CD 0C 49      [17]  896 	call	_cpct_waitVSYNC
                            897 ;src/main.c:303: moverCuchillo();
   55CD CD D5 54      [17]  898 	call	_moverCuchillo
   55D0                     899 00102$:
                            900 ;src/main.c:305: if (prota.mover) {
   55D0 3A E0 51      [13]  901 	ld	a, (#(_prota + 0x0006) + 0)
   55D3 B7            [ 4]  902 	or	a, a
   55D4 28 EB         [12]  903 	jr	Z,00106$
                            904 ;src/main.c:306: cpct_waitVSYNC();
   55D6 CD 0C 49      [17]  905 	call	_cpct_waitVSYNC
                            906 ;src/main.c:307: redibujarProta();
   55D9 CD 8F 52      [17]  907 	call	_redibujarProta
                            908 ;src/main.c:308: prota.mover = NO;
   55DC 21 E0 51      [10]  909 	ld	hl,#(_prota + 0x0006)
   55DF 36 00         [10]  910 	ld	(hl),#0x00
   55E1 18 DE         [12]  911 	jr	00106$
                            912 	.area _CODE
                            913 	.area _INITIALIZER
                            914 	.area _CABS (ABS)
   0200                     915 	.org 0x0200
   0200                     916 _G_song:
   0200 41                  917 	.db #0x41	; 65	'A'
   0201 54                  918 	.db #0x54	; 84	'T'
   0202 31                  919 	.db #0x31	; 49	'1'
   0203 30                  920 	.db #0x30	; 48	'0'
   0204 01                  921 	.db #0x01	; 1
   0205 40                  922 	.db #0x40	; 64
   0206 42                  923 	.db #0x42	; 66	'B'
   0207 0F                  924 	.db #0x0F	; 15
   0208 02                  925 	.db #0x02	; 2
   0209 06                  926 	.db #0x06	; 6
   020A 1D                  927 	.db #0x1D	; 29
   020B 00                  928 	.db #0x00	; 0
   020C 10                  929 	.db #0x10	; 16
   020D 40                  930 	.db #0x40	; 64
   020E 19                  931 	.db #0x19	; 25
   020F 40                  932 	.db #0x40	; 64
   0210 00                  933 	.db #0x00	; 0
   0211 00                  934 	.db #0x00	; 0
   0212 00                  935 	.db #0x00	; 0
   0213 00                  936 	.db #0x00	; 0
   0214 00                  937 	.db #0x00	; 0
   0215 00                  938 	.db #0x00	; 0
   0216 0D                  939 	.db #0x0D	; 13
   0217 12                  940 	.db #0x12	; 18
   0218 40                  941 	.db #0x40	; 64
   0219 01                  942 	.db #0x01	; 1
   021A 00                  943 	.db #0x00	; 0
   021B 7C                  944 	.db #0x7C	; 124
   021C 18                  945 	.db #0x18	; 24
   021D 78                  946 	.db #0x78	; 120	'x'
   021E 0C                  947 	.db #0x0C	; 12
   021F 34                  948 	.db #0x34	; 52	'4'
   0220 30                  949 	.db #0x30	; 48	'0'
   0221 2C                  950 	.db #0x2C	; 44
   0222 28                  951 	.db #0x28	; 40
   0223 24                  952 	.db #0x24	; 36
   0224 20                  953 	.db #0x20	; 32
   0225 1C                  954 	.db #0x1C	; 28
   0226 0D                  955 	.db #0x0D	; 13
   0227 25                  956 	.db #0x25	; 37
   0228 40                  957 	.db #0x40	; 64
   0229 20                  958 	.db #0x20	; 32
   022A 00                  959 	.db #0x00	; 0
   022B 00                  960 	.db #0x00	; 0
   022C 00                  961 	.db #0x00	; 0
   022D 39                  962 	.db #0x39	; 57	'9'
   022E 40                  963 	.db #0x40	; 64
   022F 00                  964 	.db #0x00	; 0
   0230 57                  965 	.db #0x57	; 87	'W'
   0231 40                  966 	.db #0x40	; 64
   0232 3B                  967 	.db #0x3B	; 59
   0233 40                  968 	.db #0x40	; 64
   0234 57                  969 	.db #0x57	; 87	'W'
   0235 40                  970 	.db #0x40	; 64
   0236 01                  971 	.db #0x01	; 1
   0237 2F                  972 	.db #0x2F	; 47
   0238 40                  973 	.db #0x40	; 64
   0239 19                  974 	.db #0x19	; 25
   023A 00                  975 	.db #0x00	; 0
   023B 76                  976 	.db #0x76	; 118	'v'
   023C E1                  977 	.db #0xE1	; 225
   023D 00                  978 	.db #0x00	; 0
   023E 00                  979 	.db #0x00	; 0
   023F 01                  980 	.db #0x01	; 1
   0240 04                  981 	.db #0x04	; 4
   0241 51                  982 	.db #0x51	; 81	'Q'
   0242 04                  983 	.db #0x04	; 4
   0243 37                  984 	.db #0x37	; 55	'7'
   0244 04                  985 	.db #0x04	; 4
   0245 4F                  986 	.db #0x4F	; 79	'O'
   0246 04                  987 	.db #0x04	; 4
   0247 37                  988 	.db #0x37	; 55	'7'
   0248 02                  989 	.db #0x02	; 2
   0249 4B                  990 	.db #0x4B	; 75	'K'
   024A 02                  991 	.db #0x02	; 2
   024B 37                  992 	.db #0x37	; 55	'7'
   024C 04                  993 	.db #0x04	; 4
   024D 4F                  994 	.db #0x4F	; 79	'O'
   024E 04                  995 	.db #0x04	; 4
   024F 37                  996 	.db #0x37	; 55	'7'
   0250 04                  997 	.db #0x04	; 4
   0251 4F                  998 	.db #0x4F	; 79	'O'
   0252 04                  999 	.db #0x04	; 4
   0253 37                 1000 	.db #0x37	; 55	'7'
   0254 02                 1001 	.db #0x02	; 2
   0255 4B                 1002 	.db #0x4B	; 75	'K'
   0256 00                 1003 	.db #0x00	; 0
   0257 42                 1004 	.db #0x42	; 66	'B'
   0258 60                 1005 	.db #0x60	; 96
   0259 00                 1006 	.db #0x00	; 0
   025A 42                 1007 	.db #0x42	; 66	'B'
   025B 80                 1008 	.db #0x80	; 128
   025C 00                 1009 	.db #0x00	; 0
   025D 00                 1010 	.db #0x00	; 0
   025E 42                 1011 	.db #0x42	; 66	'B'
   025F 00                 1012 	.db #0x00	; 0
   0260 00                 1013 	.db #0x00	; 0
