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
                             41 	.globl _mapa
                             42 	.globl _cu
                             43 	.globl _prota
                             44 	.globl _EEje
                             45 	.globl _EMirar
                             46 ;--------------------------------------------------------
                             47 ; special function registers
                             48 ;--------------------------------------------------------
                             49 ;--------------------------------------------------------
                             50 ; ram data
                             51 ;--------------------------------------------------------
                             52 	.area _DATA
   523A                      53 _EMirar::
   523A                      54 	.ds 1
   523B                      55 _EEje::
   523B                      56 	.ds 1
   523C                      57 _prota::
   523C                      58 	.ds 8
   5244                      59 _cu::
   5244                      60 	.ds 9
   524D                      61 _mapa::
   524D                      62 	.ds 2
                             63 ;--------------------------------------------------------
                             64 ; ram data
                             65 ;--------------------------------------------------------
                             66 	.area _INITIALIZED
                             67 ;--------------------------------------------------------
                             68 ; absolute external ram data
                             69 ;--------------------------------------------------------
                             70 	.area _DABS (ABS)
                             71 ;--------------------------------------------------------
                             72 ; global & static initialisations
                             73 ;--------------------------------------------------------
                             74 	.area _HOME
                             75 	.area _GSINIT
                             76 	.area _GSFINAL
                             77 	.area _GSINIT
                             78 ;--------------------------------------------------------
                             79 ; Home
                             80 ;--------------------------------------------------------
                             81 	.area _HOME
                             82 	.area _HOME
                             83 ;--------------------------------------------------------
                             84 ; code
                             85 ;--------------------------------------------------------
                             86 	.area _CODE
                             87 ;src/main.c:88: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
                             88 ;	---------------------------------
                             89 ; Function dummy_cpct_transparentMaskTable0M0_container
                             90 ; ---------------------------------
   4818                      91 _dummy_cpct_transparentMaskTable0M0_container::
                             92 	.area _g_tablatrans_ (ABS) 
   3E00                      93 	.org 0x3E00 
   3E00                      94 	 _g_tablatrans::
   3E00 FF AA 55 00 AA AA    95 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E08 55 00 55 00 00 00    96 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E10 AA AA 00 00 AA AA    97 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E18 00 00 00 00 00 00    98 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E20 55 00 55 00 00 00    99 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E28 55 00 55 00 00 00   100 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E30 00 00 00 00 00 00   101 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E38 00 00 00 00 00 00   102 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E40 AA AA 00 00 AA AA   103 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E48 00 00 00 00 00 00   104 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E50 AA AA 00 00 AA AA   105 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E58 00 00 00 00 00 00   106 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E60 00 00 00 00 00 00   107 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E68 00 00 00 00 00 00   108 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E70 00 00 00 00 00 00   109 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E78 00 00 00 00 00 00   110 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E80 55 00 55 00 00 00   111 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E88 55 00 55 00 00 00   112 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E90 00 00 00 00 00 00   113 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E98 00 00 00 00 00 00   114 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA0 55 00 55 00 00 00   115 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA8 55 00 55 00 00 00   116 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB0 00 00 00 00 00 00   117 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB8 00 00 00 00 00 00   118 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC0 00 00 00 00 00 00   119 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC8 00 00 00 00 00 00   120 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED0 00 00 00 00 00 00   121 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED8 00 00 00 00 00 00   122 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE0 00 00 00 00 00 00   123 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE8 00 00 00 00 00 00   124 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF0 00 00 00 00 00 00   125 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF8 00 00 00 00 00 00   126 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            127 	.area _CSEG (REL, CON) 
                            128 ;src/main.c:91: void dibujarMapa() {
                            129 ;	---------------------------------
                            130 ; Function dibujarMapa
                            131 ; ---------------------------------
   524F                     132 _dibujarMapa::
                            133 ;src/main.c:92: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   524F 2A 4D 52      [16]  134 	ld	hl,(_mapa)
   5252 E5            [11]  135 	push	hl
   5253 21 00 C0      [10]  136 	ld	hl,#0xC000
   5256 E5            [11]  137 	push	hl
   5257 21 2C 28      [10]  138 	ld	hl,#0x282C
   525A E5            [11]  139 	push	hl
   525B 2E 00         [ 7]  140 	ld	l, #0x00
   525D E5            [11]  141 	push	hl
   525E AF            [ 4]  142 	xor	a, a
   525F F5            [11]  143 	push	af
   5260 33            [ 6]  144 	inc	sp
   5261 CD 3B 48      [17]  145 	call	_cpct_etm_drawTileBox2x4
   5264 C9            [10]  146 	ret
                            147 ;src/main.c:97: void dibujarProta() {
                            148 ;	---------------------------------
                            149 ; Function dibujarProta
                            150 ; ---------------------------------
   5265                     151 _dibujarProta::
                            152 ;src/main.c:98: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   5265 21 3D 52      [10]  153 	ld	hl, #_prota + 1
   5268 56            [ 7]  154 	ld	d,(hl)
   5269 21 3C 52      [10]  155 	ld	hl, #_prota + 0
   526C 46            [ 7]  156 	ld	b,(hl)
   526D D5            [11]  157 	push	de
   526E 33            [ 6]  158 	inc	sp
   526F C5            [11]  159 	push	bc
   5270 33            [ 6]  160 	inc	sp
   5271 21 00 C0      [10]  161 	ld	hl,#0xC000
   5274 E5            [11]  162 	push	hl
   5275 CD DF 51      [17]  163 	call	_cpct_getScreenPtr
   5278 EB            [ 4]  164 	ex	de,hl
                            165 ;src/main.c:99: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   5279 ED 4B 40 52   [20]  166 	ld	bc, (#_prota + 4)
   527D 21 00 3E      [10]  167 	ld	hl,#_g_tablatrans
   5280 E5            [11]  168 	push	hl
   5281 21 07 16      [10]  169 	ld	hl,#0x1607
   5284 E5            [11]  170 	push	hl
   5285 D5            [11]  171 	push	de
   5286 C5            [11]  172 	push	bc
   5287 CD FF 51      [17]  173 	call	_cpct_drawSpriteMaskedAlignedTable
   528A C9            [10]  174 	ret
                            175 ;src/main.c:102: void borrarProta() {
                            176 ;	---------------------------------
                            177 ; Function borrarProta
                            178 ; ---------------------------------
   528B                     179 _borrarProta::
   528B DD E5         [15]  180 	push	ix
   528D DD 21 00 00   [14]  181 	ld	ix,#0
   5291 DD 39         [15]  182 	add	ix,sp
   5293 3B            [ 6]  183 	dec	sp
                            184 ;src/main.c:104: u8 w = 4 + (prota.px & 1);
   5294 21 3E 52      [10]  185 	ld	hl, #_prota + 2
   5297 4E            [ 7]  186 	ld	c,(hl)
   5298 79            [ 4]  187 	ld	a,c
   5299 E6 01         [ 7]  188 	and	a, #0x01
   529B 47            [ 4]  189 	ld	b,a
   529C 04            [ 4]  190 	inc	b
   529D 04            [ 4]  191 	inc	b
   529E 04            [ 4]  192 	inc	b
   529F 04            [ 4]  193 	inc	b
                            194 ;src/main.c:107: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   52A0 21 3F 52      [10]  195 	ld	hl, #_prota + 3
   52A3 5E            [ 7]  196 	ld	e,(hl)
   52A4 CB 4B         [ 8]  197 	bit	1, e
   52A6 28 04         [12]  198 	jr	Z,00103$
   52A8 3E 01         [ 7]  199 	ld	a,#0x01
   52AA 18 02         [12]  200 	jr	00104$
   52AC                     201 00103$:
   52AC 3E 00         [ 7]  202 	ld	a,#0x00
   52AE                     203 00104$:
   52AE C6 06         [ 7]  204 	add	a, #0x06
   52B0 DD 77 FF      [19]  205 	ld	-1 (ix),a
                            206 ;src/main.c:109: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   52B3 FD 2A 4D 52   [20]  207 	ld	iy,(_mapa)
   52B7 16 00         [ 7]  208 	ld	d,#0x00
   52B9 63            [ 4]  209 	ld	h,e
   52BA 6A            [ 4]  210 	ld	l,d
   52BB CB 7A         [ 8]  211 	bit	7, d
   52BD 28 05         [12]  212 	jr	Z,00105$
   52BF 13            [ 6]  213 	inc	de
   52C0 13            [ 6]  214 	inc	de
   52C1 13            [ 6]  215 	inc	de
   52C2 63            [ 4]  216 	ld	h,e
   52C3 6A            [ 4]  217 	ld	l,d
   52C4                     218 00105$:
   52C4 5C            [ 4]  219 	ld	e, h
   52C5 55            [ 4]  220 	ld	d, l
   52C6 CB 2A         [ 8]  221 	sra	d
   52C8 CB 1B         [ 8]  222 	rr	e
   52CA CB 2A         [ 8]  223 	sra	d
   52CC CB 1B         [ 8]  224 	rr	e
   52CE 51            [ 4]  225 	ld	d,c
   52CF CB 3A         [ 8]  226 	srl	d
   52D1 FD E5         [15]  227 	push	iy
   52D3 21 00 C0      [10]  228 	ld	hl,#0xC000
   52D6 E5            [11]  229 	push	hl
   52D7 3E 28         [ 7]  230 	ld	a,#0x28
   52D9 F5            [11]  231 	push	af
   52DA 33            [ 6]  232 	inc	sp
   52DB DD 7E FF      [19]  233 	ld	a,-1 (ix)
   52DE F5            [11]  234 	push	af
   52DF 33            [ 6]  235 	inc	sp
   52E0 C5            [11]  236 	push	bc
   52E1 33            [ 6]  237 	inc	sp
   52E2 7B            [ 4]  238 	ld	a,e
   52E3 F5            [11]  239 	push	af
   52E4 33            [ 6]  240 	inc	sp
   52E5 D5            [11]  241 	push	de
   52E6 33            [ 6]  242 	inc	sp
   52E7 CD 3B 48      [17]  243 	call	_cpct_etm_drawTileBox2x4
   52EA 33            [ 6]  244 	inc	sp
   52EB DD E1         [14]  245 	pop	ix
   52ED C9            [10]  246 	ret
                            247 ;src/main.c:112: void redibujarProta() {
                            248 ;	---------------------------------
                            249 ; Function redibujarProta
                            250 ; ---------------------------------
   52EE                     251 _redibujarProta::
                            252 ;src/main.c:113: borrarProta();
   52EE CD 8B 52      [17]  253 	call	_borrarProta
                            254 ;src/main.c:114: prota.px = prota.x;
   52F1 01 3E 52      [10]  255 	ld	bc,#_prota + 2
   52F4 3A 3C 52      [13]  256 	ld	a, (#_prota + 0)
   52F7 02            [ 7]  257 	ld	(bc),a
                            258 ;src/main.c:115: prota.py = prota.y;
   52F8 01 3F 52      [10]  259 	ld	bc,#_prota + 3
   52FB 3A 3D 52      [13]  260 	ld	a, (#_prota + 1)
   52FE 02            [ 7]  261 	ld	(bc),a
                            262 ;src/main.c:116: dibujarProta();
   52FF C3 65 52      [10]  263 	jp  _dibujarProta
                            264 ;src/main.c:119: void moverIzquierda() {
                            265 ;	---------------------------------
                            266 ; Function moverIzquierda
                            267 ; ---------------------------------
   5302                     268 _moverIzquierda::
                            269 ;src/main.c:120: if (prota.x > LIMITE_IZQUIERDO) {
   5302 01 3C 52      [10]  270 	ld	bc,#_prota+0
   5305 0A            [ 7]  271 	ld	a,(bc)
   5306 5F            [ 4]  272 	ld	e,a
   5307 3E 04         [ 7]  273 	ld	a,#0x04
   5309 93            [ 4]  274 	sub	a, e
   530A D0            [11]  275 	ret	NC
                            276 ;src/main.c:121: prota.x--;
   530B 1D            [ 4]  277 	dec	e
   530C 7B            [ 4]  278 	ld	a,e
   530D 02            [ 7]  279 	ld	(bc),a
                            280 ;src/main.c:122: prota.mover  = SI;
   530E 21 42 52      [10]  281 	ld	hl,#(_prota + 0x0006)
   5311 36 01         [10]  282 	ld	(hl),#0x01
                            283 ;src/main.c:123: prota.mira=M_izquierda;
   5313 21 43 52      [10]  284 	ld	hl,#(_prota + 0x0007)
   5316 36 01         [10]  285 	ld	(hl),#0x01
   5318 C9            [10]  286 	ret
                            287 ;src/main.c:128: void moverDerecha() {
                            288 ;	---------------------------------
                            289 ; Function moverDerecha
                            290 ; ---------------------------------
   5319                     291 _moverDerecha::
                            292 ;src/main.c:129: if (prota.x < LIMITE_DERECHO - G_HERO_W) {
   5319 21 3C 52      [10]  293 	ld	hl,#_prota+0
   531C 4E            [ 7]  294 	ld	c,(hl)
   531D 79            [ 4]  295 	ld	a,c
   531E D6 45         [ 7]  296 	sub	a, #0x45
   5320 D0            [11]  297 	ret	NC
                            298 ;src/main.c:130: prota.x++;
   5321 0C            [ 4]  299 	inc	c
   5322 71            [ 7]  300 	ld	(hl),c
                            301 ;src/main.c:131: prota.mover  = SI;
   5323 21 42 52      [10]  302 	ld	hl,#(_prota + 0x0006)
   5326 36 01         [10]  303 	ld	(hl),#0x01
                            304 ;src/main.c:132: prota.mira=M_derecha;
   5328 21 43 52      [10]  305 	ld	hl,#(_prota + 0x0007)
   532B 36 00         [10]  306 	ld	(hl),#0x00
   532D C9            [10]  307 	ret
                            308 ;src/main.c:136: void moverArriba() {
                            309 ;	---------------------------------
                            310 ; Function moverArriba
                            311 ; ---------------------------------
   532E                     312 _moverArriba::
                            313 ;src/main.c:137: if (prota.y > LIMITE_SUPERIOR) {
   532E 21 3D 52      [10]  314 	ld	hl,#_prota + 1
   5331 4E            [ 7]  315 	ld	c,(hl)
   5332 3E 08         [ 7]  316 	ld	a,#0x08
   5334 91            [ 4]  317 	sub	a, c
   5335 D0            [11]  318 	ret	NC
                            319 ;src/main.c:138: prota.y--;
   5336 0D            [ 4]  320 	dec	c
   5337 71            [ 7]  321 	ld	(hl),c
                            322 ;src/main.c:139: prota.mover  = SI;
   5338 21 42 52      [10]  323 	ld	hl,#(_prota + 0x0006)
   533B 36 01         [10]  324 	ld	(hl),#0x01
                            325 ;src/main.c:140: prota.mira = M_arriba;
   533D 21 43 52      [10]  326 	ld	hl,#(_prota + 0x0007)
   5340 36 02         [10]  327 	ld	(hl),#0x02
   5342 C9            [10]  328 	ret
                            329 ;src/main.c:144: void moverAbajo() {
                            330 ;	---------------------------------
                            331 ; Function moverAbajo
                            332 ; ---------------------------------
   5343                     333 _moverAbajo::
                            334 ;src/main.c:145: if(prota.y < LIMITE_INFERIOR - G_HERO_H){
   5343 21 3D 52      [10]  335 	ld	hl,#_prota + 1
   5346 4E            [ 7]  336 	ld	c,(hl)
   5347 79            [ 4]  337 	ld	a,c
   5348 D6 92         [ 7]  338 	sub	a, #0x92
   534A D0            [11]  339 	ret	NC
                            340 ;src/main.c:146: prota.y++;
   534B 0C            [ 4]  341 	inc	c
   534C 71            [ 7]  342 	ld	(hl),c
                            343 ;src/main.c:147: prota.mover  = SI;
   534D 21 42 52      [10]  344 	ld	hl,#(_prota + 0x0006)
   5350 36 01         [10]  345 	ld	(hl),#0x01
                            346 ;src/main.c:148: prota.mira = M_abajo;
   5352 21 43 52      [10]  347 	ld	hl,#(_prota + 0x0007)
   5355 36 03         [10]  348 	ld	(hl),#0x03
   5357 C9            [10]  349 	ret
                            350 ;src/main.c:152: void dibujarCuchillo(u8 eje) {
                            351 ;	---------------------------------
                            352 ; Function dibujarCuchillo
                            353 ; ---------------------------------
   5358                     354 _dibujarCuchillo::
   5358 DD E5         [15]  355 	push	ix
   535A DD 21 00 00   [14]  356 	ld	ix,#0
   535E DD 39         [15]  357 	add	ix,sp
   5360 F5            [11]  358 	push	af
                            359 ;src/main.c:153: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   5361 21 45 52      [10]  360 	ld	hl, #_cu + 1
   5364 56            [ 7]  361 	ld	d,(hl)
   5365 21 44 52      [10]  362 	ld	hl, #_cu + 0
   5368 46            [ 7]  363 	ld	b,(hl)
   5369 D5            [11]  364 	push	de
   536A 33            [ 6]  365 	inc	sp
   536B C5            [11]  366 	push	bc
   536C 33            [ 6]  367 	inc	sp
   536D 21 00 C0      [10]  368 	ld	hl,#0xC000
   5370 E5            [11]  369 	push	hl
   5371 CD DF 51      [17]  370 	call	_cpct_getScreenPtr
                            371 ;src/main.c:155: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   5374 33            [ 6]  372 	inc	sp
   5375 33            [ 6]  373 	inc	sp
   5376 E5            [11]  374 	push	hl
                            375 ;src/main.c:154: if(eje == E_X){
   5377 DD 7E 04      [19]  376 	ld	a,4 (ix)
   537A B7            [ 4]  377 	or	a, a
   537B 20 19         [12]  378 	jr	NZ,00104$
                            379 ;src/main.c:155: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   537D 11 00 3E      [10]  380 	ld	de,#_g_tablatrans+0
   5380 ED 4B 48 52   [20]  381 	ld	bc, (#(_cu + 0x0004) + 0)
   5384 D5            [11]  382 	push	de
   5385 21 03 03      [10]  383 	ld	hl,#0x0303
   5388 E5            [11]  384 	push	hl
   5389 DD 6E FE      [19]  385 	ld	l,-2 (ix)
   538C DD 66 FF      [19]  386 	ld	h,-1 (ix)
   538F E5            [11]  387 	push	hl
   5390 C5            [11]  388 	push	bc
   5391 CD FF 51      [17]  389 	call	_cpct_drawSpriteMaskedAlignedTable
   5394 18 1D         [12]  390 	jr	00106$
   5396                     391 00104$:
                            392 ;src/main.c:158: else if(eje == E_Y){
   5396 DD 7E 04      [19]  393 	ld	a,4 (ix)
   5399 3D            [ 4]  394 	dec	a
   539A 20 17         [12]  395 	jr	NZ,00106$
                            396 ;src/main.c:159: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   539C 11 00 3E      [10]  397 	ld	de,#_g_tablatrans+0
   539F ED 4B 48 52   [20]  398 	ld	bc, (#(_cu + 0x0004) + 0)
   53A3 D5            [11]  399 	push	de
   53A4 21 02 06      [10]  400 	ld	hl,#0x0602
   53A7 E5            [11]  401 	push	hl
   53A8 DD 6E FE      [19]  402 	ld	l,-2 (ix)
   53AB DD 66 FF      [19]  403 	ld	h,-1 (ix)
   53AE E5            [11]  404 	push	hl
   53AF C5            [11]  405 	push	bc
   53B0 CD FF 51      [17]  406 	call	_cpct_drawSpriteMaskedAlignedTable
   53B3                     407 00106$:
   53B3 DD F9         [10]  408 	ld	sp, ix
   53B5 DD E1         [14]  409 	pop	ix
   53B7 C9            [10]  410 	ret
                            411 ;src/main.c:163: void borrarCuchillo() {
                            412 ;	---------------------------------
                            413 ; Function borrarCuchillo
                            414 ; ---------------------------------
   53B8                     415 _borrarCuchillo::
   53B8 DD E5         [15]  416 	push	ix
   53BA DD 21 00 00   [14]  417 	ld	ix,#0
   53BE DD 39         [15]  418 	add	ix,sp
   53C0 3B            [ 6]  419 	dec	sp
                            420 ;src/main.c:164: u8 w = 2 + (cu.px & 1);
   53C1 21 46 52      [10]  421 	ld	hl, #_cu + 2
   53C4 4E            [ 7]  422 	ld	c,(hl)
   53C5 79            [ 4]  423 	ld	a,c
   53C6 E6 01         [ 7]  424 	and	a, #0x01
   53C8 47            [ 4]  425 	ld	b,a
   53C9 04            [ 4]  426 	inc	b
   53CA 04            [ 4]  427 	inc	b
                            428 ;src/main.c:165: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   53CB 21 47 52      [10]  429 	ld	hl, #_cu + 3
   53CE 5E            [ 7]  430 	ld	e,(hl)
   53CF 7B            [ 4]  431 	ld	a,e
   53D0 E6 03         [ 7]  432 	and	a, #0x03
   53D2 28 04         [12]  433 	jr	Z,00103$
   53D4 3E 01         [ 7]  434 	ld	a,#0x01
   53D6 18 02         [12]  435 	jr	00104$
   53D8                     436 00103$:
   53D8 3E 00         [ 7]  437 	ld	a,#0x00
   53DA                     438 00104$:
   53DA C6 02         [ 7]  439 	add	a, #0x02
   53DC DD 77 FF      [19]  440 	ld	-1 (ix),a
                            441 ;src/main.c:166: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   53DF FD 2A 4D 52   [20]  442 	ld	iy,(_mapa)
   53E3 16 00         [ 7]  443 	ld	d,#0x00
   53E5 63            [ 4]  444 	ld	h,e
   53E6 6A            [ 4]  445 	ld	l,d
   53E7 CB 7A         [ 8]  446 	bit	7, d
   53E9 28 05         [12]  447 	jr	Z,00105$
   53EB 13            [ 6]  448 	inc	de
   53EC 13            [ 6]  449 	inc	de
   53ED 13            [ 6]  450 	inc	de
   53EE 63            [ 4]  451 	ld	h,e
   53EF 6A            [ 4]  452 	ld	l,d
   53F0                     453 00105$:
   53F0 5C            [ 4]  454 	ld	e, h
   53F1 55            [ 4]  455 	ld	d, l
   53F2 CB 2A         [ 8]  456 	sra	d
   53F4 CB 1B         [ 8]  457 	rr	e
   53F6 CB 2A         [ 8]  458 	sra	d
   53F8 CB 1B         [ 8]  459 	rr	e
   53FA 51            [ 4]  460 	ld	d,c
   53FB CB 3A         [ 8]  461 	srl	d
   53FD FD E5         [15]  462 	push	iy
   53FF 21 00 C0      [10]  463 	ld	hl,#0xC000
   5402 E5            [11]  464 	push	hl
   5403 3E 28         [ 7]  465 	ld	a,#0x28
   5405 F5            [11]  466 	push	af
   5406 33            [ 6]  467 	inc	sp
   5407 DD 7E FF      [19]  468 	ld	a,-1 (ix)
   540A F5            [11]  469 	push	af
   540B 33            [ 6]  470 	inc	sp
   540C C5            [11]  471 	push	bc
   540D 33            [ 6]  472 	inc	sp
   540E 7B            [ 4]  473 	ld	a,e
   540F F5            [11]  474 	push	af
   5410 33            [ 6]  475 	inc	sp
   5411 D5            [11]  476 	push	de
   5412 33            [ 6]  477 	inc	sp
   5413 CD 3B 48      [17]  478 	call	_cpct_etm_drawTileBox2x4
   5416 33            [ 6]  479 	inc	sp
   5417 DD E1         [14]  480 	pop	ix
   5419 C9            [10]  481 	ret
                            482 ;src/main.c:169: void redibujarCuchillo() {
                            483 ;	---------------------------------
                            484 ; Function redibujarCuchillo
                            485 ; ---------------------------------
   541A                     486 _redibujarCuchillo::
                            487 ;src/main.c:170: borrarCuchillo();
   541A CD B8 53      [17]  488 	call	_borrarCuchillo
                            489 ;src/main.c:171: cu.px = cu.x;
   541D 3A 44 52      [13]  490 	ld	a, (#_cu + 0)
   5420 32 46 52      [13]  491 	ld	(#(_cu + 0x0002)),a
                            492 ;src/main.c:172: cu.py = cu.y;
   5423 3A 45 52      [13]  493 	ld	a, (#_cu + 1)
   5426 32 47 52      [13]  494 	ld	(#(_cu + 0x0003)),a
                            495 ;src/main.c:173: dibujarCuchillo(cu.eje);
   5429 21 4C 52      [10]  496 	ld	hl, #_cu + 8
   542C 46            [ 7]  497 	ld	b,(hl)
   542D C5            [11]  498 	push	bc
   542E 33            [ 6]  499 	inc	sp
   542F CD 58 53      [17]  500 	call	_dibujarCuchillo
   5432 33            [ 6]  501 	inc	sp
   5433 C9            [10]  502 	ret
                            503 ;src/main.c:177: void lanzarCuchillo(){
                            504 ;	---------------------------------
                            505 ; Function lanzarCuchillo
                            506 ; ---------------------------------
   5434                     507 _lanzarCuchillo::
                            508 ;src/main.c:178: cu.lanzado = SI;
   5434 11 44 52      [10]  509 	ld	de,#_cu+0
   5437 21 4A 52      [10]  510 	ld	hl,#(_cu + 0x0006)
   543A 36 01         [10]  511 	ld	(hl),#0x01
                            512 ;src/main.c:179: if(prota.mira == M_derecha){
   543C 21 43 52      [10]  513 	ld	hl, #_prota + 7
   543F 4E            [ 7]  514 	ld	c,(hl)
                            515 ;src/main.c:180: cu.direccion = M_derecha;
                            516 ;src/main.c:182: cu.y=prota.y + G_HERO_H /2;	
                            517 ;src/main.c:183: cu.sprite=g_knifeX_0;
                            518 ;src/main.c:184: cu.eje = E_X;
                            519 ;src/main.c:179: if(prota.mira == M_derecha){
   5440 79            [ 4]  520 	ld	a,c
   5441 B7            [ 4]  521 	or	a, a
   5442 20 29         [12]  522 	jr	NZ,00110$
                            523 ;src/main.c:180: cu.direccion = M_derecha;
   5444 21 4B 52      [10]  524 	ld	hl,#(_cu + 0x0007)
   5447 36 00         [10]  525 	ld	(hl),#0x00
                            526 ;src/main.c:181: cu.x=prota.x + G_HERO_W;
   5449 3A 3C 52      [13]  527 	ld	a, (#_prota + 0)
   544C C6 07         [ 7]  528 	add	a, #0x07
   544E 12            [ 7]  529 	ld	(de),a
                            530 ;src/main.c:182: cu.y=prota.y + G_HERO_H /2;	
   544F 3A 3D 52      [13]  531 	ld	a, (#(_prota + 0x0001) + 0)
   5452 C6 0B         [ 7]  532 	add	a, #0x0B
   5454 32 45 52      [13]  533 	ld	(#(_cu + 0x0001)),a
                            534 ;src/main.c:183: cu.sprite=g_knifeX_0;
   5457 21 F8 46      [10]  535 	ld	hl,#_g_knifeX_0
   545A 22 48 52      [16]  536 	ld	((_cu + 0x0004)), hl
                            537 ;src/main.c:184: cu.eje = E_X;
   545D 21 4C 52      [10]  538 	ld	hl,#(_cu + 0x0008)
   5460 36 00         [10]  539 	ld	(hl),#0x00
                            540 ;src/main.c:185: dibujarCuchillo(cu.eje);
   5462 21 4C 52      [10]  541 	ld	hl, #(_cu + 0x0008) + 0
   5465 46            [ 7]  542 	ld	b,(hl)
   5466 C5            [11]  543 	push	bc
   5467 33            [ 6]  544 	inc	sp
   5468 CD 58 53      [17]  545 	call	_dibujarCuchillo
   546B 33            [ 6]  546 	inc	sp
   546C C9            [10]  547 	ret
   546D                     548 00110$:
                            549 ;src/main.c:187: else if(prota.mira == M_izquierda){
   546D 79            [ 4]  550 	ld	a,c
   546E 3D            [ 4]  551 	dec	a
   546F 20 29         [12]  552 	jr	NZ,00107$
                            553 ;src/main.c:188: cu.direccion = M_izquierda;
   5471 21 4B 52      [10]  554 	ld	hl,#(_cu + 0x0007)
   5474 36 01         [10]  555 	ld	(hl),#0x01
                            556 ;src/main.c:189: cu.x = prota.x - G_KNIFEX_0_W;
   5476 3A 3C 52      [13]  557 	ld	a, (#_prota + 0)
   5479 C6 FD         [ 7]  558 	add	a,#0xFD
   547B 12            [ 7]  559 	ld	(de),a
                            560 ;src/main.c:190: cu.y = prota.y + G_HERO_H /2;	
   547C 3A 3D 52      [13]  561 	ld	a, (#(_prota + 0x0001) + 0)
   547F C6 0B         [ 7]  562 	add	a, #0x0B
   5481 32 45 52      [13]  563 	ld	(#(_cu + 0x0001)),a
                            564 ;src/main.c:191: cu.sprite = g_knifeX_1;
   5484 21 01 47      [10]  565 	ld	hl,#_g_knifeX_1
   5487 22 48 52      [16]  566 	ld	((_cu + 0x0004)), hl
                            567 ;src/main.c:192: cu.eje = E_X;
   548A 21 4C 52      [10]  568 	ld	hl,#(_cu + 0x0008)
   548D 36 00         [10]  569 	ld	(hl),#0x00
                            570 ;src/main.c:193: dibujarCuchillo(cu.eje);
   548F 21 4C 52      [10]  571 	ld	hl, #(_cu + 0x0008) + 0
   5492 46            [ 7]  572 	ld	b,(hl)
   5493 C5            [11]  573 	push	bc
   5494 33            [ 6]  574 	inc	sp
   5495 CD 58 53      [17]  575 	call	_dibujarCuchillo
   5498 33            [ 6]  576 	inc	sp
   5499 C9            [10]  577 	ret
   549A                     578 00107$:
                            579 ;src/main.c:195: else if(prota.mira == M_abajo){
   549A 79            [ 4]  580 	ld	a,c
   549B D6 03         [ 7]  581 	sub	a, #0x03
   549D 20 29         [12]  582 	jr	NZ,00104$
                            583 ;src/main.c:196: cu.direccion = M_abajo;
   549F 21 4B 52      [10]  584 	ld	hl,#(_cu + 0x0007)
   54A2 36 03         [10]  585 	ld	(hl),#0x03
                            586 ;src/main.c:197: cu.x = prota.x + G_HERO_W / 2;
   54A4 3A 3C 52      [13]  587 	ld	a, (#_prota + 0)
   54A7 C6 03         [ 7]  588 	add	a, #0x03
   54A9 12            [ 7]  589 	ld	(de),a
                            590 ;src/main.c:198: cu.y = prota.y + G_HERO_H + 10;	
   54AA 3A 3D 52      [13]  591 	ld	a, (#(_prota + 0x0001) + 0)
   54AD C6 20         [ 7]  592 	add	a, #0x20
   54AF 32 45 52      [13]  593 	ld	(#(_cu + 0x0001)),a
                            594 ;src/main.c:199: cu.sprite = g_knifeY_0;
   54B2 21 E0 46      [10]  595 	ld	hl,#_g_knifeY_0
   54B5 22 48 52      [16]  596 	ld	((_cu + 0x0004)), hl
                            597 ;src/main.c:200: cu.eje = E_Y;
   54B8 21 4C 52      [10]  598 	ld	hl,#(_cu + 0x0008)
   54BB 36 01         [10]  599 	ld	(hl),#0x01
                            600 ;src/main.c:201: dibujarCuchillo(cu.eje);
   54BD 21 4C 52      [10]  601 	ld	hl, #(_cu + 0x0008) + 0
   54C0 46            [ 7]  602 	ld	b,(hl)
   54C1 C5            [11]  603 	push	bc
   54C2 33            [ 6]  604 	inc	sp
   54C3 CD 58 53      [17]  605 	call	_dibujarCuchillo
   54C6 33            [ 6]  606 	inc	sp
   54C7 C9            [10]  607 	ret
   54C8                     608 00104$:
                            609 ;src/main.c:203: else if(prota.mira == M_arriba){
   54C8 79            [ 4]  610 	ld	a,c
   54C9 D6 02         [ 7]  611 	sub	a, #0x02
   54CB C0            [11]  612 	ret	NZ
                            613 ;src/main.c:204: cu.direccion = M_arriba;
   54CC 21 4B 52      [10]  614 	ld	hl,#(_cu + 0x0007)
   54CF 36 02         [10]  615 	ld	(hl),#0x02
                            616 ;src/main.c:205: cu.x = prota.x + G_HERO_W / 2;
   54D1 3A 3C 52      [13]  617 	ld	a, (#_prota + 0)
   54D4 C6 03         [ 7]  618 	add	a, #0x03
   54D6 12            [ 7]  619 	ld	(de),a
                            620 ;src/main.c:206: cu.y = prota.y;	
   54D7 3A 3D 52      [13]  621 	ld	a, (#(_prota + 0x0001) + 0)
   54DA 32 45 52      [13]  622 	ld	(#(_cu + 0x0001)),a
                            623 ;src/main.c:207: cu.sprite = g_knifeY_1;
   54DD 21 EC 46      [10]  624 	ld	hl,#_g_knifeY_1
   54E0 22 48 52      [16]  625 	ld	((_cu + 0x0004)), hl
                            626 ;src/main.c:208: cu.eje = E_Y;
   54E3 21 4C 52      [10]  627 	ld	hl,#(_cu + 0x0008)
   54E6 36 01         [10]  628 	ld	(hl),#0x01
                            629 ;src/main.c:209: dibujarCuchillo(cu.eje);
   54E8 21 4C 52      [10]  630 	ld	hl, #(_cu + 0x0008) + 0
   54EB 46            [ 7]  631 	ld	b,(hl)
   54EC C5            [11]  632 	push	bc
   54ED 33            [ 6]  633 	inc	sp
   54EE CD 58 53      [17]  634 	call	_dibujarCuchillo
   54F1 33            [ 6]  635 	inc	sp
   54F2 C9            [10]  636 	ret
                            637 ;src/main.c:213: void comprobarTeclado() {
                            638 ;	---------------------------------
                            639 ; Function comprobarTeclado
                            640 ; ---------------------------------
   54F3                     641 _comprobarTeclado::
                            642 ;src/main.c:214: cpct_scanKeyboard_if();
   54F3 CD 06 49      [17]  643 	call	_cpct_scanKeyboard_if
                            644 ;src/main.c:216: if (cpct_isAnyKeyPressed()) {
   54F6 CD F9 48      [17]  645 	call	_cpct_isAnyKeyPressed
   54F9 7D            [ 4]  646 	ld	a,l
   54FA B7            [ 4]  647 	or	a, a
   54FB C8            [11]  648 	ret	Z
                            649 ;src/main.c:217: if (cpct_isKeyPressed(Key_CursorLeft))
   54FC 21 01 01      [10]  650 	ld	hl,#0x0101
   54FF CD 2F 48      [17]  651 	call	_cpct_isKeyPressed
   5502 7D            [ 4]  652 	ld	a,l
   5503 B7            [ 4]  653 	or	a, a
                            654 ;src/main.c:218: moverIzquierda();
   5504 C2 02 53      [10]  655 	jp	NZ,_moverIzquierda
                            656 ;src/main.c:219: else if (cpct_isKeyPressed(Key_CursorRight))
   5507 21 00 02      [10]  657 	ld	hl,#0x0200
   550A CD 2F 48      [17]  658 	call	_cpct_isKeyPressed
   550D 7D            [ 4]  659 	ld	a,l
   550E B7            [ 4]  660 	or	a, a
                            661 ;src/main.c:220: moverDerecha();
   550F C2 19 53      [10]  662 	jp	NZ,_moverDerecha
                            663 ;src/main.c:221: else if (cpct_isKeyPressed(Key_CursorUp))
   5512 21 00 01      [10]  664 	ld	hl,#0x0100
   5515 CD 2F 48      [17]  665 	call	_cpct_isKeyPressed
   5518 7D            [ 4]  666 	ld	a,l
   5519 B7            [ 4]  667 	or	a, a
                            668 ;src/main.c:222: moverArriba();
   551A C2 2E 53      [10]  669 	jp	NZ,_moverArriba
                            670 ;src/main.c:223: else if (cpct_isKeyPressed(Key_CursorDown))
   551D 21 00 04      [10]  671 	ld	hl,#0x0400
   5520 CD 2F 48      [17]  672 	call	_cpct_isKeyPressed
   5523 7D            [ 4]  673 	ld	a,l
   5524 B7            [ 4]  674 	or	a, a
                            675 ;src/main.c:224: moverAbajo();
   5525 C2 43 53      [10]  676 	jp	NZ,_moverAbajo
                            677 ;src/main.c:225: else if (cpct_isKeyPressed(Key_Space))
   5528 21 05 80      [10]  678 	ld	hl,#0x8005
   552B CD 2F 48      [17]  679 	call	_cpct_isKeyPressed
   552E 7D            [ 4]  680 	ld	a,l
   552F B7            [ 4]  681 	or	a, a
   5530 C8            [11]  682 	ret	Z
                            683 ;src/main.c:226: lanzarCuchillo();
   5531 C3 34 54      [10]  684 	jp  _lanzarCuchillo
                            685 ;src/main.c:232: void moverCuchillo(){
                            686 ;	---------------------------------
                            687 ; Function moverCuchillo
                            688 ; ---------------------------------
   5534                     689 _moverCuchillo::
                            690 ;src/main.c:234: if(cu.direccion == M_derecha){		
   5534 01 44 52      [10]  691 	ld	bc,#_cu+0
   5537 21 4B 52      [10]  692 	ld	hl, #_cu + 7
   553A 5E            [ 7]  693 	ld	e,(hl)
                            694 ;src/main.c:241: cu.lanzado = NO;
                            695 ;src/main.c:234: if(cu.direccion == M_derecha){		
   553B 7B            [ 4]  696 	ld	a,e
   553C B7            [ 4]  697 	or	a, a
   553D 20 19         [12]  698 	jr	NZ,00130$
                            699 ;src/main.c:235: if(cu.x< LIMITE_DERECHO - G_KNIFEX_0_W){
   553F 0A            [ 7]  700 	ld	a,(bc)
   5540 5F            [ 4]  701 	ld	e,a
   5541 D6 49         [ 7]  702 	sub	a, #0x49
   5543 30 06         [12]  703 	jr	NC,00104$
                            704 ;src/main.c:236: cu.x++;
   5545 1C            [ 4]  705 	inc	e
   5546 7B            [ 4]  706 	ld	a,e
   5547 02            [ 7]  707 	ld	(bc),a
                            708 ;src/main.c:237: redibujarCuchillo();
   5548 C3 1A 54      [10]  709 	jp  _redibujarCuchillo
   554B                     710 00104$:
                            711 ;src/main.c:239: else if(cu.x == LIMITE_DERECHO  - G_KNIFEX_0_W){
   554B 7B            [ 4]  712 	ld	a,e
   554C D6 49         [ 7]  713 	sub	a, #0x49
   554E C0            [11]  714 	ret	NZ
                            715 ;src/main.c:240: borrarCuchillo();
   554F CD B8 53      [17]  716 	call	_borrarCuchillo
                            717 ;src/main.c:241: cu.lanzado = NO;
   5552 21 4A 52      [10]  718 	ld	hl,#(_cu + 0x0006)
   5555 36 00         [10]  719 	ld	(hl),#0x00
   5557 C9            [10]  720 	ret
   5558                     721 00130$:
                            722 ;src/main.c:244: else if(cu.direccion == M_izquierda){
   5558 7B            [ 4]  723 	ld	a,e
   5559 3D            [ 4]  724 	dec	a
   555A 20 1A         [12]  725 	jr	NZ,00127$
                            726 ;src/main.c:245: if(cu.x > LIMITE_IZQUIERDO){
   555C 0A            [ 7]  727 	ld	a,(bc)
   555D 5F            [ 4]  728 	ld	e,a
   555E 3E 04         [ 7]  729 	ld	a,#0x04
   5560 93            [ 4]  730 	sub	a, e
   5561 30 06         [12]  731 	jr	NC,00109$
                            732 ;src/main.c:246: cu.x--;
   5563 1D            [ 4]  733 	dec	e
   5564 7B            [ 4]  734 	ld	a,e
   5565 02            [ 7]  735 	ld	(bc),a
                            736 ;src/main.c:247: redibujarCuchillo();
   5566 C3 1A 54      [10]  737 	jp  _redibujarCuchillo
   5569                     738 00109$:
                            739 ;src/main.c:248: }else if(cu.x == LIMITE_IZQUIERDO){
   5569 7B            [ 4]  740 	ld	a,e
   556A D6 04         [ 7]  741 	sub	a, #0x04
   556C C0            [11]  742 	ret	NZ
                            743 ;src/main.c:249: borrarCuchillo();
   556D CD B8 53      [17]  744 	call	_borrarCuchillo
                            745 ;src/main.c:250: cu.lanzado = NO;
   5570 21 4A 52      [10]  746 	ld	hl,#(_cu + 0x0006)
   5573 36 00         [10]  747 	ld	(hl),#0x00
   5575 C9            [10]  748 	ret
   5576                     749 00127$:
                            750 ;src/main.c:254: if(cu.y < LIMITE_INFERIOR - G_KNIFEY_0_H){
   5576 69            [ 4]  751 	ld	l, c
   5577 60            [ 4]  752 	ld	h, b
   5578 23            [ 6]  753 	inc	hl
                            754 ;src/main.c:253: else if(cu.direccion == M_abajo){
   5579 7B            [ 4]  755 	ld	a,e
   557A D6 03         [ 7]  756 	sub	a, #0x03
   557C 20 18         [12]  757 	jr	NZ,00124$
                            758 ;src/main.c:254: if(cu.y < LIMITE_INFERIOR - G_KNIFEY_0_H){
   557E 4E            [ 7]  759 	ld	c,(hl)
   557F 79            [ 4]  760 	ld	a,c
   5580 D6 A2         [ 7]  761 	sub	a, #0xA2
   5582 30 05         [12]  762 	jr	NC,00114$
                            763 ;src/main.c:255: cu.y++;
   5584 0C            [ 4]  764 	inc	c
   5585 71            [ 7]  765 	ld	(hl),c
                            766 ;src/main.c:256: redibujarCuchillo();
   5586 C3 1A 54      [10]  767 	jp  _redibujarCuchillo
   5589                     768 00114$:
                            769 ;src/main.c:257: }else if(cu.y == LIMITE_INFERIOR - G_KNIFEY_0_H){
   5589 79            [ 4]  770 	ld	a,c
   558A D6 A2         [ 7]  771 	sub	a, #0xA2
   558C C0            [11]  772 	ret	NZ
                            773 ;src/main.c:258: borrarCuchillo();
   558D CD B8 53      [17]  774 	call	_borrarCuchillo
                            775 ;src/main.c:259: cu.lanzado = NO;
   5590 21 4A 52      [10]  776 	ld	hl,#(_cu + 0x0006)
   5593 36 00         [10]  777 	ld	(hl),#0x00
   5595 C9            [10]  778 	ret
   5596                     779 00124$:
                            780 ;src/main.c:262: else if(cu.direccion == M_arriba){
   5596 7B            [ 4]  781 	ld	a,e
   5597 D6 02         [ 7]  782 	sub	a, #0x02
   5599 C0            [11]  783 	ret	NZ
                            784 ;src/main.c:263: if(cu.y > LIMITE_SUPERIOR){
   559A 4E            [ 7]  785 	ld	c,(hl)
   559B 3E 08         [ 7]  786 	ld	a,#0x08
   559D 91            [ 4]  787 	sub	a, c
   559E 30 05         [12]  788 	jr	NC,00119$
                            789 ;src/main.c:264: cu.y--;
   55A0 0D            [ 4]  790 	dec	c
   55A1 71            [ 7]  791 	ld	(hl),c
                            792 ;src/main.c:265: redibujarCuchillo();
   55A2 C3 1A 54      [10]  793 	jp  _redibujarCuchillo
   55A5                     794 00119$:
                            795 ;src/main.c:266: }else if(cu.y == LIMITE_SUPERIOR){
   55A5 79            [ 4]  796 	ld	a,c
   55A6 D6 08         [ 7]  797 	sub	a, #0x08
   55A8 C0            [11]  798 	ret	NZ
                            799 ;src/main.c:267: borrarCuchillo();
   55A9 CD B8 53      [17]  800 	call	_borrarCuchillo
                            801 ;src/main.c:268: cu.lanzado = NO;
   55AC 21 4A 52      [10]  802 	ld	hl,#(_cu + 0x0006)
   55AF 36 00         [10]  803 	ld	(hl),#0x00
   55B1 C9            [10]  804 	ret
                            805 ;src/main.c:273: void inicializar() {
                            806 ;	---------------------------------
                            807 ; Function inicializar
                            808 ; ---------------------------------
   55B2                     809 _inicializar::
                            810 ;src/main.c:274: cpct_disableFirmware();
   55B2 CD AD 51      [17]  811 	call	_cpct_disableFirmware
                            812 ;src/main.c:275: cpct_setVideoMode(0);
   55B5 2E 00         [ 7]  813 	ld	l,#0x00
   55B7 CD 76 49      [17]  814 	call	_cpct_setVideoMode
                            815 ;src/main.c:277: cpct_setPalette(g_palette, 16);
   55BA 21 10 00      [10]  816 	ld	hl,#0x0010
   55BD E5            [11]  817 	push	hl
   55BE 21 6E 47      [10]  818 	ld	hl,#_g_palette
   55C1 E5            [11]  819 	push	hl
   55C2 CD 18 48      [17]  820 	call	_cpct_setPalette
                            821 ;src/main.c:278: cpct_akp_musicInit(G_song);
   55C5 21 00 02      [10]  822 	ld	hl,#_G_song
   55C8 E5            [11]  823 	push	hl
   55C9 CD 89 50      [17]  824 	call	_cpct_akp_musicInit
   55CC F1            [10]  825 	pop	af
                            826 ;src/main.c:279: mapa = g_map1;
   55CD 21 00 40      [10]  827 	ld	hl,#_g_map1+0
   55D0 22 4D 52      [16]  828 	ld	(_mapa),hl
                            829 ;src/main.c:280: cpct_etm_setTileset2x4(g_tileset);
   55D3 21 0A 47      [10]  830 	ld	hl,#_g_tileset
   55D6 CD CA 48      [17]  831 	call	_cpct_etm_setTileset2x4
                            832 ;src/main.c:281: dibujarMapa();
   55D9 CD 4F 52      [17]  833 	call	_dibujarMapa
                            834 ;src/main.c:284: prota.x = prota.px = 0;
   55DC 21 3E 52      [10]  835 	ld	hl,#(_prota + 0x0002)
   55DF 36 00         [10]  836 	ld	(hl),#0x00
   55E1 21 3C 52      [10]  837 	ld	hl,#_prota
   55E4 36 00         [10]  838 	ld	(hl),#0x00
                            839 ;src/main.c:285: prota.y = prota.py = 80;
   55E6 21 3F 52      [10]  840 	ld	hl,#(_prota + 0x0003)
   55E9 36 50         [10]  841 	ld	(hl),#0x50
   55EB 21 3D 52      [10]  842 	ld	hl,#(_prota + 0x0001)
   55EE 36 50         [10]  843 	ld	(hl),#0x50
                            844 ;src/main.c:286: prota.mover  = NO;
   55F0 21 42 52      [10]  845 	ld	hl,#(_prota + 0x0006)
   55F3 36 00         [10]  846 	ld	(hl),#0x00
                            847 ;src/main.c:287: prota.mira=M_derecha;
   55F5 21 43 52      [10]  848 	ld	hl,#(_prota + 0x0007)
   55F8 36 00         [10]  849 	ld	(hl),#0x00
                            850 ;src/main.c:288: prota.sprite = g_hero;
   55FA 21 7E 47      [10]  851 	ld	hl,#_g_hero
   55FD 22 40 52      [16]  852 	ld	((_prota + 0x0004)), hl
                            853 ;src/main.c:289: cu.x = cu.px =0;
   5600 11 44 52      [10]  854 	ld	de,#_cu+0
   5603 01 46 52      [10]  855 	ld	bc,#_cu + 2
   5606 AF            [ 4]  856 	xor	a, a
   5607 02            [ 7]  857 	ld	(bc),a
   5608 AF            [ 4]  858 	xor	a, a
   5609 12            [ 7]  859 	ld	(de),a
                            860 ;src/main.c:290: cu.x = cu.px = 0;
   560A AF            [ 4]  861 	xor	a, a
   560B 02            [ 7]  862 	ld	(bc),a
   560C 21 44 52      [10]  863 	ld	hl,#_cu
   560F 36 00         [10]  864 	ld	(hl),#0x00
                            865 ;src/main.c:291: cu.lanzado=0;
   5611 21 4A 52      [10]  866 	ld	hl,#(_cu + 0x0006)
   5614 36 00         [10]  867 	ld	(hl),#0x00
                            868 ;src/main.c:293: dibujarProta();
   5616 CD 65 52      [17]  869 	call	_dibujarProta
   5619 C9            [10]  870 	ret
                            871 ;src/main.c:296: void main(void) {
                            872 ;	---------------------------------
                            873 ; Function main
                            874 ; ---------------------------------
   561A                     875 _main::
                            876 ;src/main.c:299: inicializar();
   561A CD B2 55      [17]  877 	call	_inicializar
                            878 ;src/main.c:300: cpct_akp_musicPlay();
   561D CD 86 49      [17]  879 	call	_cpct_akp_musicPlay
                            880 ;src/main.c:303: while (1) {
   5620                     881 00106$:
                            882 ;src/main.c:306: comprobarTeclado();
   5620 CD F3 54      [17]  883 	call	_comprobarTeclado
                            884 ;src/main.c:308: if(cu.lanzado){
   5623 3A 4A 52      [13]  885 	ld	a, (#(_cu + 0x0006) + 0)
   5626 B7            [ 4]  886 	or	a, a
   5627 28 06         [12]  887 	jr	Z,00102$
                            888 ;src/main.c:309: cpct_waitVSYNC();
   5629 CD 6E 49      [17]  889 	call	_cpct_waitVSYNC
                            890 ;src/main.c:310: moverCuchillo();
   562C CD 34 55      [17]  891 	call	_moverCuchillo
   562F                     892 00102$:
                            893 ;src/main.c:312: if (prota.mover) {
   562F 3A 42 52      [13]  894 	ld	a, (#(_prota + 0x0006) + 0)
   5632 B7            [ 4]  895 	or	a, a
   5633 28 0B         [12]  896 	jr	Z,00104$
                            897 ;src/main.c:313: cpct_waitVSYNC();
   5635 CD 6E 49      [17]  898 	call	_cpct_waitVSYNC
                            899 ;src/main.c:314: redibujarProta();
   5638 CD EE 52      [17]  900 	call	_redibujarProta
                            901 ;src/main.c:315: prota.mover = NO;
   563B 21 42 52      [10]  902 	ld	hl,#(_prota + 0x0006)
   563E 36 00         [10]  903 	ld	(hl),#0x00
   5640                     904 00104$:
                            905 ;src/main.c:317: cpct_waitVSYNC();
   5640 CD 6E 49      [17]  906 	call	_cpct_waitVSYNC
   5643 18 DB         [12]  907 	jr	00106$
                            908 	.area _CODE
                            909 	.area _INITIALIZER
                            910 	.area _CABS (ABS)
   0200                     911 	.org 0x0200
   0200                     912 _G_song:
   0200 41                  913 	.db #0x41	; 65	'A'
   0201 54                  914 	.db #0x54	; 84	'T'
   0202 31                  915 	.db #0x31	; 49	'1'
   0203 30                  916 	.db #0x30	; 48	'0'
   0204 01                  917 	.db #0x01	; 1
   0205 40                  918 	.db #0x40	; 64
   0206 42                  919 	.db #0x42	; 66	'B'
   0207 0F                  920 	.db #0x0F	; 15
   0208 02                  921 	.db #0x02	; 2
   0209 06                  922 	.db #0x06	; 6
   020A 1D                  923 	.db #0x1D	; 29
   020B 00                  924 	.db #0x00	; 0
   020C 10                  925 	.db #0x10	; 16
   020D 40                  926 	.db #0x40	; 64
   020E 19                  927 	.db #0x19	; 25
   020F 40                  928 	.db #0x40	; 64
   0210 00                  929 	.db #0x00	; 0
   0211 00                  930 	.db #0x00	; 0
   0212 00                  931 	.db #0x00	; 0
   0213 00                  932 	.db #0x00	; 0
   0214 00                  933 	.db #0x00	; 0
   0215 00                  934 	.db #0x00	; 0
   0216 0D                  935 	.db #0x0D	; 13
   0217 12                  936 	.db #0x12	; 18
   0218 40                  937 	.db #0x40	; 64
   0219 01                  938 	.db #0x01	; 1
   021A 00                  939 	.db #0x00	; 0
   021B 7C                  940 	.db #0x7C	; 124
   021C 18                  941 	.db #0x18	; 24
   021D 78                  942 	.db #0x78	; 120	'x'
   021E 0C                  943 	.db #0x0C	; 12
   021F 34                  944 	.db #0x34	; 52	'4'
   0220 30                  945 	.db #0x30	; 48	'0'
   0221 2C                  946 	.db #0x2C	; 44
   0222 28                  947 	.db #0x28	; 40
   0223 24                  948 	.db #0x24	; 36
   0224 20                  949 	.db #0x20	; 32
   0225 1C                  950 	.db #0x1C	; 28
   0226 0D                  951 	.db #0x0D	; 13
   0227 25                  952 	.db #0x25	; 37
   0228 40                  953 	.db #0x40	; 64
   0229 20                  954 	.db #0x20	; 32
   022A 00                  955 	.db #0x00	; 0
   022B 00                  956 	.db #0x00	; 0
   022C 00                  957 	.db #0x00	; 0
   022D 39                  958 	.db #0x39	; 57	'9'
   022E 40                  959 	.db #0x40	; 64
   022F 00                  960 	.db #0x00	; 0
   0230 57                  961 	.db #0x57	; 87	'W'
   0231 40                  962 	.db #0x40	; 64
   0232 3B                  963 	.db #0x3B	; 59
   0233 40                  964 	.db #0x40	; 64
   0234 57                  965 	.db #0x57	; 87	'W'
   0235 40                  966 	.db #0x40	; 64
   0236 01                  967 	.db #0x01	; 1
   0237 2F                  968 	.db #0x2F	; 47
   0238 40                  969 	.db #0x40	; 64
   0239 19                  970 	.db #0x19	; 25
   023A 00                  971 	.db #0x00	; 0
   023B 76                  972 	.db #0x76	; 118	'v'
   023C E1                  973 	.db #0xE1	; 225
   023D 00                  974 	.db #0x00	; 0
   023E 00                  975 	.db #0x00	; 0
   023F 01                  976 	.db #0x01	; 1
   0240 04                  977 	.db #0x04	; 4
   0241 51                  978 	.db #0x51	; 81	'Q'
   0242 04                  979 	.db #0x04	; 4
   0243 37                  980 	.db #0x37	; 55	'7'
   0244 04                  981 	.db #0x04	; 4
   0245 4F                  982 	.db #0x4F	; 79	'O'
   0246 04                  983 	.db #0x04	; 4
   0247 37                  984 	.db #0x37	; 55	'7'
   0248 02                  985 	.db #0x02	; 2
   0249 4B                  986 	.db #0x4B	; 75	'K'
   024A 02                  987 	.db #0x02	; 2
   024B 37                  988 	.db #0x37	; 55	'7'
   024C 04                  989 	.db #0x04	; 4
   024D 4F                  990 	.db #0x4F	; 79	'O'
   024E 04                  991 	.db #0x04	; 4
   024F 37                  992 	.db #0x37	; 55	'7'
   0250 04                  993 	.db #0x04	; 4
   0251 4F                  994 	.db #0x4F	; 79	'O'
   0252 04                  995 	.db #0x04	; 4
   0253 37                  996 	.db #0x37	; 55	'7'
   0254 02                  997 	.db #0x02	; 2
   0255 4B                  998 	.db #0x4B	; 75	'K'
   0256 00                  999 	.db #0x00	; 0
   0257 42                 1000 	.db #0x42	; 66	'B'
   0258 60                 1001 	.db #0x60	; 96
   0259 00                 1002 	.db #0x00	; 0
   025A 42                 1003 	.db #0x42	; 66	'B'
   025B 80                 1004 	.db #0x80	; 128
   025C 00                 1005 	.db #0x00	; 0
   025D 00                 1006 	.db #0x00	; 0
   025E 42                 1007 	.db #0x42	; 66	'B'
   025F 00                 1008 	.db #0x00	; 0
   0260 00                 1009 	.db #0x00	; 0
