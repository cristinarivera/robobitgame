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
   5281                      53 _EMirar::
   5281                      54 	.ds 1
   5282                      55 _EEje::
   5282                      56 	.ds 1
   5283                      57 _prota::
   5283                      58 	.ds 8
   528B                      59 _cu::
   528B                      60 	.ds 9
   5294                      61 _mapa::
   5294                      62 	.ds 2
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
   485F                      91 _dummy_cpct_transparentMaskTable0M0_container::
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
   5296                     132 _dibujarMapa::
                            133 ;src/main.c:92: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   5296 2A 94 52      [16]  134 	ld	hl,(_mapa)
   5299 E5            [11]  135 	push	hl
   529A 21 00 C0      [10]  136 	ld	hl,#0xC000
   529D E5            [11]  137 	push	hl
   529E 21 2C 28      [10]  138 	ld	hl,#0x282C
   52A1 E5            [11]  139 	push	hl
   52A2 2E 00         [ 7]  140 	ld	l, #0x00
   52A4 E5            [11]  141 	push	hl
   52A5 AF            [ 4]  142 	xor	a, a
   52A6 F5            [11]  143 	push	af
   52A7 33            [ 6]  144 	inc	sp
   52A8 CD 82 48      [17]  145 	call	_cpct_etm_drawTileBox2x4
   52AB C9            [10]  146 	ret
                            147 ;src/main.c:97: void dibujarProta() {
                            148 ;	---------------------------------
                            149 ; Function dibujarProta
                            150 ; ---------------------------------
   52AC                     151 _dibujarProta::
                            152 ;src/main.c:98: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   52AC 21 84 52      [10]  153 	ld	hl, #_prota + 1
   52AF 56            [ 7]  154 	ld	d,(hl)
   52B0 21 83 52      [10]  155 	ld	hl, #_prota + 0
   52B3 46            [ 7]  156 	ld	b,(hl)
   52B4 D5            [11]  157 	push	de
   52B5 33            [ 6]  158 	inc	sp
   52B6 C5            [11]  159 	push	bc
   52B7 33            [ 6]  160 	inc	sp
   52B8 21 00 C0      [10]  161 	ld	hl,#0xC000
   52BB E5            [11]  162 	push	hl
   52BC CD 26 52      [17]  163 	call	_cpct_getScreenPtr
   52BF EB            [ 4]  164 	ex	de,hl
                            165 ;src/main.c:99: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   52C0 ED 4B 87 52   [20]  166 	ld	bc, (#_prota + 4)
   52C4 21 00 3E      [10]  167 	ld	hl,#_g_tablatrans
   52C7 E5            [11]  168 	push	hl
   52C8 21 09 19      [10]  169 	ld	hl,#0x1909
   52CB E5            [11]  170 	push	hl
   52CC D5            [11]  171 	push	de
   52CD C5            [11]  172 	push	bc
   52CE CD 46 52      [17]  173 	call	_cpct_drawSpriteMaskedAlignedTable
   52D1 C9            [10]  174 	ret
                            175 ;src/main.c:102: void borrarProta() {
                            176 ;	---------------------------------
                            177 ; Function borrarProta
                            178 ; ---------------------------------
   52D2                     179 _borrarProta::
                            180 ;src/main.c:109: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   52D2 ED 4B 94 52   [20]  181 	ld	bc,(_mapa)
   52D6 21 86 52      [10]  182 	ld	hl, #_prota + 3
   52D9 5E            [ 7]  183 	ld	e,(hl)
   52DA 16 00         [ 7]  184 	ld	d,#0x00
   52DC 63            [ 4]  185 	ld	h,e
   52DD 6A            [ 4]  186 	ld	l,d
   52DE CB 7A         [ 8]  187 	bit	7, d
   52E0 28 05         [12]  188 	jr	Z,00103$
   52E2 13            [ 6]  189 	inc	de
   52E3 13            [ 6]  190 	inc	de
   52E4 13            [ 6]  191 	inc	de
   52E5 63            [ 4]  192 	ld	h,e
   52E6 6A            [ 4]  193 	ld	l,d
   52E7                     194 00103$:
   52E7 5C            [ 4]  195 	ld	e, h
   52E8 55            [ 4]  196 	ld	d, l
   52E9 CB 2A         [ 8]  197 	sra	d
   52EB CB 1B         [ 8]  198 	rr	e
   52ED CB 2A         [ 8]  199 	sra	d
   52EF CB 1B         [ 8]  200 	rr	e
   52F1 3A 85 52      [13]  201 	ld	a, (#_prota + 2)
   52F4 CB 3F         [ 8]  202 	srl	a
   52F6 57            [ 4]  203 	ld	d,a
   52F7 C5            [11]  204 	push	bc
   52F8 21 00 C0      [10]  205 	ld	hl,#0xC000
   52FB E5            [11]  206 	push	hl
   52FC 21 08 28      [10]  207 	ld	hl,#0x2808
   52FF E5            [11]  208 	push	hl
   5300 3E 05         [ 7]  209 	ld	a,#0x05
   5302 F5            [11]  210 	push	af
   5303 33            [ 6]  211 	inc	sp
   5304 7B            [ 4]  212 	ld	a,e
   5305 F5            [11]  213 	push	af
   5306 33            [ 6]  214 	inc	sp
   5307 D5            [11]  215 	push	de
   5308 33            [ 6]  216 	inc	sp
   5309 CD 82 48      [17]  217 	call	_cpct_etm_drawTileBox2x4
   530C C9            [10]  218 	ret
                            219 ;src/main.c:112: void redibujarProta() {
                            220 ;	---------------------------------
                            221 ; Function redibujarProta
                            222 ; ---------------------------------
   530D                     223 _redibujarProta::
                            224 ;src/main.c:113: borrarProta();
   530D CD D2 52      [17]  225 	call	_borrarProta
                            226 ;src/main.c:114: prota.px = prota.x;
   5310 01 85 52      [10]  227 	ld	bc,#_prota + 2
   5313 3A 83 52      [13]  228 	ld	a, (#_prota + 0)
   5316 02            [ 7]  229 	ld	(bc),a
                            230 ;src/main.c:115: prota.py = prota.y;
   5317 01 86 52      [10]  231 	ld	bc,#_prota + 3
   531A 3A 84 52      [13]  232 	ld	a, (#_prota + 1)
   531D 02            [ 7]  233 	ld	(bc),a
                            234 ;src/main.c:116: dibujarProta();
   531E C3 AC 52      [10]  235 	jp  _dibujarProta
                            236 ;src/main.c:119: void moverIzquierda() {
                            237 ;	---------------------------------
                            238 ; Function moverIzquierda
                            239 ; ---------------------------------
   5321                     240 _moverIzquierda::
                            241 ;src/main.c:120: if (prota.x > LIMITE_IZQUIERDO) {
   5321 01 83 52      [10]  242 	ld	bc,#_prota+0
   5324 0A            [ 7]  243 	ld	a,(bc)
   5325 5F            [ 4]  244 	ld	e,a
   5326 3E 04         [ 7]  245 	ld	a,#0x04
   5328 93            [ 4]  246 	sub	a, e
   5329 D0            [11]  247 	ret	NC
                            248 ;src/main.c:121: prota.x--;
   532A 1D            [ 4]  249 	dec	e
   532B 7B            [ 4]  250 	ld	a,e
   532C 02            [ 7]  251 	ld	(bc),a
                            252 ;src/main.c:122: prota.mover  = SI;
   532D 21 89 52      [10]  253 	ld	hl,#(_prota + 0x0006)
   5330 36 01         [10]  254 	ld	(hl),#0x01
                            255 ;src/main.c:123: prota.mira=M_izquierda;
   5332 21 8A 52      [10]  256 	ld	hl,#(_prota + 0x0007)
   5335 36 01         [10]  257 	ld	(hl),#0x01
   5337 C9            [10]  258 	ret
                            259 ;src/main.c:128: void moverDerecha() {
                            260 ;	---------------------------------
                            261 ; Function moverDerecha
                            262 ; ---------------------------------
   5338                     263 _moverDerecha::
                            264 ;src/main.c:129: if (prota.x < LIMITE_DERECHO - G_HERO_W) {
   5338 21 83 52      [10]  265 	ld	hl,#_prota+0
   533B 4E            [ 7]  266 	ld	c,(hl)
   533C 79            [ 4]  267 	ld	a,c
   533D D6 43         [ 7]  268 	sub	a, #0x43
   533F D0            [11]  269 	ret	NC
                            270 ;src/main.c:130: prota.x++;
   5340 0C            [ 4]  271 	inc	c
   5341 71            [ 7]  272 	ld	(hl),c
                            273 ;src/main.c:131: prota.mover  = SI;
   5342 21 89 52      [10]  274 	ld	hl,#(_prota + 0x0006)
   5345 36 01         [10]  275 	ld	(hl),#0x01
                            276 ;src/main.c:132: prota.mira=M_derecha;
   5347 21 8A 52      [10]  277 	ld	hl,#(_prota + 0x0007)
   534A 36 00         [10]  278 	ld	(hl),#0x00
   534C C9            [10]  279 	ret
                            280 ;src/main.c:136: void moverArriba() {
                            281 ;	---------------------------------
                            282 ; Function moverArriba
                            283 ; ---------------------------------
   534D                     284 _moverArriba::
                            285 ;src/main.c:137: if (prota.y > LIMITE_SUPERIOR) {
   534D 21 84 52      [10]  286 	ld	hl,#_prota + 1
   5350 4E            [ 7]  287 	ld	c,(hl)
   5351 3E 08         [ 7]  288 	ld	a,#0x08
   5353 91            [ 4]  289 	sub	a, c
   5354 D0            [11]  290 	ret	NC
                            291 ;src/main.c:138: prota.y--;
   5355 0D            [ 4]  292 	dec	c
   5356 71            [ 7]  293 	ld	(hl),c
                            294 ;src/main.c:139: prota.mover  = SI;
   5357 21 89 52      [10]  295 	ld	hl,#(_prota + 0x0006)
   535A 36 01         [10]  296 	ld	(hl),#0x01
                            297 ;src/main.c:140: prota.mira = M_arriba;
   535C 21 8A 52      [10]  298 	ld	hl,#(_prota + 0x0007)
   535F 36 02         [10]  299 	ld	(hl),#0x02
   5361 C9            [10]  300 	ret
                            301 ;src/main.c:144: void moverAbajo() {
                            302 ;	---------------------------------
                            303 ; Function moverAbajo
                            304 ; ---------------------------------
   5362                     305 _moverAbajo::
                            306 ;src/main.c:145: if(prota.y < LIMITE_INFERIOR - G_HERO_H){
   5362 21 84 52      [10]  307 	ld	hl,#_prota + 1
   5365 4E            [ 7]  308 	ld	c,(hl)
   5366 79            [ 4]  309 	ld	a,c
   5367 D6 7F         [ 7]  310 	sub	a, #0x7F
   5369 D0            [11]  311 	ret	NC
                            312 ;src/main.c:146: prota.y++;
   536A 0C            [ 4]  313 	inc	c
   536B 71            [ 7]  314 	ld	(hl),c
                            315 ;src/main.c:147: prota.mover  = SI;
   536C 21 89 52      [10]  316 	ld	hl,#(_prota + 0x0006)
   536F 36 01         [10]  317 	ld	(hl),#0x01
                            318 ;src/main.c:148: prota.mira = M_abajo;
   5371 21 8A 52      [10]  319 	ld	hl,#(_prota + 0x0007)
   5374 36 03         [10]  320 	ld	(hl),#0x03
   5376 C9            [10]  321 	ret
                            322 ;src/main.c:152: void dibujarCuchillo(u8 eje) {
                            323 ;	---------------------------------
                            324 ; Function dibujarCuchillo
                            325 ; ---------------------------------
   5377                     326 _dibujarCuchillo::
   5377 DD E5         [15]  327 	push	ix
   5379 DD 21 00 00   [14]  328 	ld	ix,#0
   537D DD 39         [15]  329 	add	ix,sp
   537F F5            [11]  330 	push	af
                            331 ;src/main.c:153: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   5380 21 8C 52      [10]  332 	ld	hl, #_cu + 1
   5383 56            [ 7]  333 	ld	d,(hl)
   5384 21 8B 52      [10]  334 	ld	hl, #_cu + 0
   5387 46            [ 7]  335 	ld	b,(hl)
   5388 D5            [11]  336 	push	de
   5389 33            [ 6]  337 	inc	sp
   538A C5            [11]  338 	push	bc
   538B 33            [ 6]  339 	inc	sp
   538C 21 00 C0      [10]  340 	ld	hl,#0xC000
   538F E5            [11]  341 	push	hl
   5390 CD 26 52      [17]  342 	call	_cpct_getScreenPtr
                            343 ;src/main.c:155: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   5393 33            [ 6]  344 	inc	sp
   5394 33            [ 6]  345 	inc	sp
   5395 E5            [11]  346 	push	hl
                            347 ;src/main.c:154: if(eje == E_X){
   5396 DD 7E 04      [19]  348 	ld	a,4 (ix)
   5399 B7            [ 4]  349 	or	a, a
   539A 20 19         [12]  350 	jr	NZ,00104$
                            351 ;src/main.c:155: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   539C 11 00 3E      [10]  352 	ld	de,#_g_tablatrans+0
   539F ED 4B 8F 52   [20]  353 	ld	bc, (#(_cu + 0x0004) + 0)
   53A3 D5            [11]  354 	push	de
   53A4 21 03 03      [10]  355 	ld	hl,#0x0303
   53A7 E5            [11]  356 	push	hl
   53A8 DD 6E FE      [19]  357 	ld	l,-2 (ix)
   53AB DD 66 FF      [19]  358 	ld	h,-1 (ix)
   53AE E5            [11]  359 	push	hl
   53AF C5            [11]  360 	push	bc
   53B0 CD 46 52      [17]  361 	call	_cpct_drawSpriteMaskedAlignedTable
   53B3 18 1D         [12]  362 	jr	00106$
   53B5                     363 00104$:
                            364 ;src/main.c:158: else if(eje == E_Y){
   53B5 DD 7E 04      [19]  365 	ld	a,4 (ix)
   53B8 3D            [ 4]  366 	dec	a
   53B9 20 17         [12]  367 	jr	NZ,00106$
                            368 ;src/main.c:159: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   53BB 11 00 3E      [10]  369 	ld	de,#_g_tablatrans+0
   53BE ED 4B 8F 52   [20]  370 	ld	bc, (#(_cu + 0x0004) + 0)
   53C2 D5            [11]  371 	push	de
   53C3 21 02 06      [10]  372 	ld	hl,#0x0602
   53C6 E5            [11]  373 	push	hl
   53C7 DD 6E FE      [19]  374 	ld	l,-2 (ix)
   53CA DD 66 FF      [19]  375 	ld	h,-1 (ix)
   53CD E5            [11]  376 	push	hl
   53CE C5            [11]  377 	push	bc
   53CF CD 46 52      [17]  378 	call	_cpct_drawSpriteMaskedAlignedTable
   53D2                     379 00106$:
   53D2 DD F9         [10]  380 	ld	sp, ix
   53D4 DD E1         [14]  381 	pop	ix
   53D6 C9            [10]  382 	ret
                            383 ;src/main.c:163: void borrarCuchillo() {
                            384 ;	---------------------------------
                            385 ; Function borrarCuchillo
                            386 ; ---------------------------------
   53D7                     387 _borrarCuchillo::
   53D7 DD E5         [15]  388 	push	ix
   53D9 DD 21 00 00   [14]  389 	ld	ix,#0
   53DD DD 39         [15]  390 	add	ix,sp
   53DF 3B            [ 6]  391 	dec	sp
                            392 ;src/main.c:164: u8 w = 2 + (cu.px & 1);
   53E0 21 8D 52      [10]  393 	ld	hl, #_cu + 2
   53E3 4E            [ 7]  394 	ld	c,(hl)
   53E4 79            [ 4]  395 	ld	a,c
   53E5 E6 01         [ 7]  396 	and	a, #0x01
   53E7 47            [ 4]  397 	ld	b,a
   53E8 04            [ 4]  398 	inc	b
   53E9 04            [ 4]  399 	inc	b
                            400 ;src/main.c:165: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   53EA 21 8E 52      [10]  401 	ld	hl, #_cu + 3
   53ED 5E            [ 7]  402 	ld	e,(hl)
   53EE 7B            [ 4]  403 	ld	a,e
   53EF E6 03         [ 7]  404 	and	a, #0x03
   53F1 28 04         [12]  405 	jr	Z,00103$
   53F3 3E 01         [ 7]  406 	ld	a,#0x01
   53F5 18 02         [12]  407 	jr	00104$
   53F7                     408 00103$:
   53F7 3E 00         [ 7]  409 	ld	a,#0x00
   53F9                     410 00104$:
   53F9 C6 02         [ 7]  411 	add	a, #0x02
   53FB DD 77 FF      [19]  412 	ld	-1 (ix),a
                            413 ;src/main.c:166: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   53FE FD 2A 94 52   [20]  414 	ld	iy,(_mapa)
   5402 16 00         [ 7]  415 	ld	d,#0x00
   5404 63            [ 4]  416 	ld	h,e
   5405 6A            [ 4]  417 	ld	l,d
   5406 CB 7A         [ 8]  418 	bit	7, d
   5408 28 05         [12]  419 	jr	Z,00105$
   540A 13            [ 6]  420 	inc	de
   540B 13            [ 6]  421 	inc	de
   540C 13            [ 6]  422 	inc	de
   540D 63            [ 4]  423 	ld	h,e
   540E 6A            [ 4]  424 	ld	l,d
   540F                     425 00105$:
   540F 5C            [ 4]  426 	ld	e, h
   5410 55            [ 4]  427 	ld	d, l
   5411 CB 2A         [ 8]  428 	sra	d
   5413 CB 1B         [ 8]  429 	rr	e
   5415 CB 2A         [ 8]  430 	sra	d
   5417 CB 1B         [ 8]  431 	rr	e
   5419 51            [ 4]  432 	ld	d,c
   541A CB 3A         [ 8]  433 	srl	d
   541C FD E5         [15]  434 	push	iy
   541E 21 00 C0      [10]  435 	ld	hl,#0xC000
   5421 E5            [11]  436 	push	hl
   5422 3E 28         [ 7]  437 	ld	a,#0x28
   5424 F5            [11]  438 	push	af
   5425 33            [ 6]  439 	inc	sp
   5426 DD 7E FF      [19]  440 	ld	a,-1 (ix)
   5429 F5            [11]  441 	push	af
   542A 33            [ 6]  442 	inc	sp
   542B C5            [11]  443 	push	bc
   542C 33            [ 6]  444 	inc	sp
   542D 7B            [ 4]  445 	ld	a,e
   542E F5            [11]  446 	push	af
   542F 33            [ 6]  447 	inc	sp
   5430 D5            [11]  448 	push	de
   5431 33            [ 6]  449 	inc	sp
   5432 CD 82 48      [17]  450 	call	_cpct_etm_drawTileBox2x4
   5435 33            [ 6]  451 	inc	sp
   5436 DD E1         [14]  452 	pop	ix
   5438 C9            [10]  453 	ret
                            454 ;src/main.c:169: void redibujarCuchillo() {
                            455 ;	---------------------------------
                            456 ; Function redibujarCuchillo
                            457 ; ---------------------------------
   5439                     458 _redibujarCuchillo::
                            459 ;src/main.c:170: borrarCuchillo();
   5439 CD D7 53      [17]  460 	call	_borrarCuchillo
                            461 ;src/main.c:171: cu.px = cu.x;
   543C 3A 8B 52      [13]  462 	ld	a, (#_cu + 0)
   543F 32 8D 52      [13]  463 	ld	(#(_cu + 0x0002)),a
                            464 ;src/main.c:172: cu.py = cu.y;
   5442 3A 8C 52      [13]  465 	ld	a, (#_cu + 1)
   5445 32 8E 52      [13]  466 	ld	(#(_cu + 0x0003)),a
                            467 ;src/main.c:173: dibujarCuchillo(cu.eje);
   5448 21 93 52      [10]  468 	ld	hl, #_cu + 8
   544B 46            [ 7]  469 	ld	b,(hl)
   544C C5            [11]  470 	push	bc
   544D 33            [ 6]  471 	inc	sp
   544E CD 77 53      [17]  472 	call	_dibujarCuchillo
   5451 33            [ 6]  473 	inc	sp
   5452 C9            [10]  474 	ret
                            475 ;src/main.c:177: void lanzarCuchillo(){
                            476 ;	---------------------------------
                            477 ; Function lanzarCuchillo
                            478 ; ---------------------------------
   5453                     479 _lanzarCuchillo::
                            480 ;src/main.c:178: cu.lanzado = SI;
   5453 11 8B 52      [10]  481 	ld	de,#_cu+0
   5456 21 91 52      [10]  482 	ld	hl,#(_cu + 0x0006)
   5459 36 01         [10]  483 	ld	(hl),#0x01
                            484 ;src/main.c:179: if(prota.mira == M_derecha){
   545B 21 8A 52      [10]  485 	ld	hl, #_prota + 7
   545E 4E            [ 7]  486 	ld	c,(hl)
                            487 ;src/main.c:180: cu.direccion = M_derecha;
                            488 ;src/main.c:182: cu.y=prota.y + G_HERO_H /2;	
                            489 ;src/main.c:183: cu.sprite=g_knifeX_0;
                            490 ;src/main.c:184: cu.eje = E_X;
                            491 ;src/main.c:179: if(prota.mira == M_derecha){
   545F 79            [ 4]  492 	ld	a,c
   5460 B7            [ 4]  493 	or	a, a
   5461 20 29         [12]  494 	jr	NZ,00110$
                            495 ;src/main.c:180: cu.direccion = M_derecha;
   5463 21 92 52      [10]  496 	ld	hl,#(_cu + 0x0007)
   5466 36 00         [10]  497 	ld	(hl),#0x00
                            498 ;src/main.c:181: cu.x=prota.x + G_HERO_W;
   5468 3A 83 52      [13]  499 	ld	a, (#_prota + 0)
   546B C6 09         [ 7]  500 	add	a, #0x09
   546D 12            [ 7]  501 	ld	(de),a
                            502 ;src/main.c:182: cu.y=prota.y + G_HERO_H /2;	
   546E 3A 84 52      [13]  503 	ld	a, (#(_prota + 0x0001) + 0)
   5471 C6 0C         [ 7]  504 	add	a, #0x0C
   5473 32 8C 52      [13]  505 	ld	(#(_cu + 0x0001)),a
                            506 ;src/main.c:183: cu.sprite=g_knifeX_0;
   5476 21 F8 46      [10]  507 	ld	hl,#_g_knifeX_0
   5479 22 8F 52      [16]  508 	ld	((_cu + 0x0004)), hl
                            509 ;src/main.c:184: cu.eje = E_X;
   547C 21 93 52      [10]  510 	ld	hl,#(_cu + 0x0008)
   547F 36 00         [10]  511 	ld	(hl),#0x00
                            512 ;src/main.c:185: dibujarCuchillo(cu.eje);
   5481 21 93 52      [10]  513 	ld	hl, #(_cu + 0x0008) + 0
   5484 46            [ 7]  514 	ld	b,(hl)
   5485 C5            [11]  515 	push	bc
   5486 33            [ 6]  516 	inc	sp
   5487 CD 77 53      [17]  517 	call	_dibujarCuchillo
   548A 33            [ 6]  518 	inc	sp
   548B C9            [10]  519 	ret
   548C                     520 00110$:
                            521 ;src/main.c:187: else if(prota.mira == M_izquierda){
   548C 79            [ 4]  522 	ld	a,c
   548D 3D            [ 4]  523 	dec	a
   548E 20 29         [12]  524 	jr	NZ,00107$
                            525 ;src/main.c:188: cu.direccion = M_izquierda;
   5490 21 92 52      [10]  526 	ld	hl,#(_cu + 0x0007)
   5493 36 01         [10]  527 	ld	(hl),#0x01
                            528 ;src/main.c:189: cu.x = prota.x - G_KNIFEX_0_W;
   5495 3A 83 52      [13]  529 	ld	a, (#_prota + 0)
   5498 C6 FD         [ 7]  530 	add	a,#0xFD
   549A 12            [ 7]  531 	ld	(de),a
                            532 ;src/main.c:190: cu.y = prota.y + G_HERO_H /2;	
   549B 3A 84 52      [13]  533 	ld	a, (#(_prota + 0x0001) + 0)
   549E C6 0C         [ 7]  534 	add	a, #0x0C
   54A0 32 8C 52      [13]  535 	ld	(#(_cu + 0x0001)),a
                            536 ;src/main.c:191: cu.sprite = g_knifeX_1;
   54A3 21 01 47      [10]  537 	ld	hl,#_g_knifeX_1
   54A6 22 8F 52      [16]  538 	ld	((_cu + 0x0004)), hl
                            539 ;src/main.c:192: cu.eje = E_X;
   54A9 21 93 52      [10]  540 	ld	hl,#(_cu + 0x0008)
   54AC 36 00         [10]  541 	ld	(hl),#0x00
                            542 ;src/main.c:193: dibujarCuchillo(cu.eje);
   54AE 21 93 52      [10]  543 	ld	hl, #(_cu + 0x0008) + 0
   54B1 46            [ 7]  544 	ld	b,(hl)
   54B2 C5            [11]  545 	push	bc
   54B3 33            [ 6]  546 	inc	sp
   54B4 CD 77 53      [17]  547 	call	_dibujarCuchillo
   54B7 33            [ 6]  548 	inc	sp
   54B8 C9            [10]  549 	ret
   54B9                     550 00107$:
                            551 ;src/main.c:195: else if(prota.mira == M_abajo){
   54B9 79            [ 4]  552 	ld	a,c
   54BA D6 03         [ 7]  553 	sub	a, #0x03
   54BC 20 29         [12]  554 	jr	NZ,00104$
                            555 ;src/main.c:196: cu.direccion = M_abajo;
   54BE 21 92 52      [10]  556 	ld	hl,#(_cu + 0x0007)
   54C1 36 03         [10]  557 	ld	(hl),#0x03
                            558 ;src/main.c:197: cu.x = prota.x + G_HERO_W / 2;
   54C3 3A 83 52      [13]  559 	ld	a, (#_prota + 0)
   54C6 C6 04         [ 7]  560 	add	a, #0x04
   54C8 12            [ 7]  561 	ld	(de),a
                            562 ;src/main.c:198: cu.y = prota.y + G_HERO_H + 10;	
   54C9 3A 84 52      [13]  563 	ld	a, (#(_prota + 0x0001) + 0)
   54CC C6 23         [ 7]  564 	add	a, #0x23
   54CE 32 8C 52      [13]  565 	ld	(#(_cu + 0x0001)),a
                            566 ;src/main.c:199: cu.sprite = g_knifeY_0;
   54D1 21 E0 46      [10]  567 	ld	hl,#_g_knifeY_0
   54D4 22 8F 52      [16]  568 	ld	((_cu + 0x0004)), hl
                            569 ;src/main.c:200: cu.eje = E_Y;
   54D7 21 93 52      [10]  570 	ld	hl,#(_cu + 0x0008)
   54DA 36 01         [10]  571 	ld	(hl),#0x01
                            572 ;src/main.c:201: dibujarCuchillo(cu.eje);
   54DC 21 93 52      [10]  573 	ld	hl, #(_cu + 0x0008) + 0
   54DF 46            [ 7]  574 	ld	b,(hl)
   54E0 C5            [11]  575 	push	bc
   54E1 33            [ 6]  576 	inc	sp
   54E2 CD 77 53      [17]  577 	call	_dibujarCuchillo
   54E5 33            [ 6]  578 	inc	sp
   54E6 C9            [10]  579 	ret
   54E7                     580 00104$:
                            581 ;src/main.c:203: else if(prota.mira == M_arriba){
   54E7 79            [ 4]  582 	ld	a,c
   54E8 D6 02         [ 7]  583 	sub	a, #0x02
   54EA C0            [11]  584 	ret	NZ
                            585 ;src/main.c:204: cu.direccion = M_arriba;
   54EB 21 92 52      [10]  586 	ld	hl,#(_cu + 0x0007)
   54EE 36 02         [10]  587 	ld	(hl),#0x02
                            588 ;src/main.c:205: cu.x = prota.x + G_HERO_W / 2;
   54F0 3A 83 52      [13]  589 	ld	a, (#_prota + 0)
   54F3 C6 04         [ 7]  590 	add	a, #0x04
   54F5 12            [ 7]  591 	ld	(de),a
                            592 ;src/main.c:206: cu.y = prota.y;	
   54F6 3A 84 52      [13]  593 	ld	a, (#(_prota + 0x0001) + 0)
   54F9 32 8C 52      [13]  594 	ld	(#(_cu + 0x0001)),a
                            595 ;src/main.c:207: cu.sprite = g_knifeY_1;
   54FC 21 EC 46      [10]  596 	ld	hl,#_g_knifeY_1
   54FF 22 8F 52      [16]  597 	ld	((_cu + 0x0004)), hl
                            598 ;src/main.c:208: cu.eje = E_Y;
   5502 21 93 52      [10]  599 	ld	hl,#(_cu + 0x0008)
   5505 36 01         [10]  600 	ld	(hl),#0x01
                            601 ;src/main.c:209: dibujarCuchillo(cu.eje);
   5507 21 93 52      [10]  602 	ld	hl, #(_cu + 0x0008) + 0
   550A 46            [ 7]  603 	ld	b,(hl)
   550B C5            [11]  604 	push	bc
   550C 33            [ 6]  605 	inc	sp
   550D CD 77 53      [17]  606 	call	_dibujarCuchillo
   5510 33            [ 6]  607 	inc	sp
   5511 C9            [10]  608 	ret
                            609 ;src/main.c:213: void comprobarTeclado() {
                            610 ;	---------------------------------
                            611 ; Function comprobarTeclado
                            612 ; ---------------------------------
   5512                     613 _comprobarTeclado::
                            614 ;src/main.c:214: cpct_scanKeyboard_if();
   5512 CD 4D 49      [17]  615 	call	_cpct_scanKeyboard_if
                            616 ;src/main.c:216: if (cpct_isAnyKeyPressed()) {
   5515 CD 40 49      [17]  617 	call	_cpct_isAnyKeyPressed
   5518 7D            [ 4]  618 	ld	a,l
   5519 B7            [ 4]  619 	or	a, a
   551A C8            [11]  620 	ret	Z
                            621 ;src/main.c:217: if (cpct_isKeyPressed(Key_CursorLeft))
   551B 21 01 01      [10]  622 	ld	hl,#0x0101
   551E CD 76 48      [17]  623 	call	_cpct_isKeyPressed
   5521 7D            [ 4]  624 	ld	a,l
   5522 B7            [ 4]  625 	or	a, a
                            626 ;src/main.c:218: moverIzquierda();
   5523 C2 21 53      [10]  627 	jp	NZ,_moverIzquierda
                            628 ;src/main.c:219: else if (cpct_isKeyPressed(Key_CursorRight))
   5526 21 00 02      [10]  629 	ld	hl,#0x0200
   5529 CD 76 48      [17]  630 	call	_cpct_isKeyPressed
   552C 7D            [ 4]  631 	ld	a,l
   552D B7            [ 4]  632 	or	a, a
                            633 ;src/main.c:220: moverDerecha();
   552E C2 38 53      [10]  634 	jp	NZ,_moverDerecha
                            635 ;src/main.c:221: else if (cpct_isKeyPressed(Key_CursorUp))
   5531 21 00 01      [10]  636 	ld	hl,#0x0100
   5534 CD 76 48      [17]  637 	call	_cpct_isKeyPressed
   5537 7D            [ 4]  638 	ld	a,l
   5538 B7            [ 4]  639 	or	a, a
                            640 ;src/main.c:222: moverArriba();
   5539 C2 4D 53      [10]  641 	jp	NZ,_moverArriba
                            642 ;src/main.c:223: else if (cpct_isKeyPressed(Key_CursorDown))
   553C 21 00 04      [10]  643 	ld	hl,#0x0400
   553F CD 76 48      [17]  644 	call	_cpct_isKeyPressed
   5542 7D            [ 4]  645 	ld	a,l
   5543 B7            [ 4]  646 	or	a, a
                            647 ;src/main.c:224: moverAbajo();
   5544 C2 62 53      [10]  648 	jp	NZ,_moverAbajo
                            649 ;src/main.c:225: else if (cpct_isKeyPressed(Key_Space))
   5547 21 05 80      [10]  650 	ld	hl,#0x8005
   554A CD 76 48      [17]  651 	call	_cpct_isKeyPressed
   554D 7D            [ 4]  652 	ld	a,l
   554E B7            [ 4]  653 	or	a, a
   554F C8            [11]  654 	ret	Z
                            655 ;src/main.c:226: lanzarCuchillo();
   5550 C3 53 54      [10]  656 	jp  _lanzarCuchillo
                            657 ;src/main.c:232: void moverCuchillo(){
                            658 ;	---------------------------------
                            659 ; Function moverCuchillo
                            660 ; ---------------------------------
   5553                     661 _moverCuchillo::
                            662 ;src/main.c:234: if(cu.direccion == M_derecha){		
   5553 01 8B 52      [10]  663 	ld	bc,#_cu+0
   5556 21 92 52      [10]  664 	ld	hl, #_cu + 7
   5559 5E            [ 7]  665 	ld	e,(hl)
                            666 ;src/main.c:241: cu.lanzado = NO;
                            667 ;src/main.c:234: if(cu.direccion == M_derecha){		
   555A 7B            [ 4]  668 	ld	a,e
   555B B7            [ 4]  669 	or	a, a
   555C 20 19         [12]  670 	jr	NZ,00130$
                            671 ;src/main.c:235: if(cu.x< LIMITE_DERECHO - G_KNIFEX_0_W){
   555E 0A            [ 7]  672 	ld	a,(bc)
   555F 5F            [ 4]  673 	ld	e,a
   5560 D6 49         [ 7]  674 	sub	a, #0x49
   5562 30 06         [12]  675 	jr	NC,00104$
                            676 ;src/main.c:236: cu.x++;
   5564 1C            [ 4]  677 	inc	e
   5565 7B            [ 4]  678 	ld	a,e
   5566 02            [ 7]  679 	ld	(bc),a
                            680 ;src/main.c:237: redibujarCuchillo();
   5567 C3 39 54      [10]  681 	jp  _redibujarCuchillo
   556A                     682 00104$:
                            683 ;src/main.c:239: else if(cu.x == LIMITE_DERECHO  - G_KNIFEX_0_W){
   556A 7B            [ 4]  684 	ld	a,e
   556B D6 49         [ 7]  685 	sub	a, #0x49
   556D C0            [11]  686 	ret	NZ
                            687 ;src/main.c:240: borrarCuchillo();
   556E CD D7 53      [17]  688 	call	_borrarCuchillo
                            689 ;src/main.c:241: cu.lanzado = NO;
   5571 21 91 52      [10]  690 	ld	hl,#(_cu + 0x0006)
   5574 36 00         [10]  691 	ld	(hl),#0x00
   5576 C9            [10]  692 	ret
   5577                     693 00130$:
                            694 ;src/main.c:244: else if(cu.direccion == M_izquierda){
   5577 7B            [ 4]  695 	ld	a,e
   5578 3D            [ 4]  696 	dec	a
   5579 20 1A         [12]  697 	jr	NZ,00127$
                            698 ;src/main.c:245: if(cu.x > LIMITE_IZQUIERDO){
   557B 0A            [ 7]  699 	ld	a,(bc)
   557C 5F            [ 4]  700 	ld	e,a
   557D 3E 04         [ 7]  701 	ld	a,#0x04
   557F 93            [ 4]  702 	sub	a, e
   5580 30 06         [12]  703 	jr	NC,00109$
                            704 ;src/main.c:246: cu.x--;
   5582 1D            [ 4]  705 	dec	e
   5583 7B            [ 4]  706 	ld	a,e
   5584 02            [ 7]  707 	ld	(bc),a
                            708 ;src/main.c:247: redibujarCuchillo();
   5585 C3 39 54      [10]  709 	jp  _redibujarCuchillo
   5588                     710 00109$:
                            711 ;src/main.c:248: }else if(cu.x == LIMITE_IZQUIERDO){
   5588 7B            [ 4]  712 	ld	a,e
   5589 D6 04         [ 7]  713 	sub	a, #0x04
   558B C0            [11]  714 	ret	NZ
                            715 ;src/main.c:249: borrarCuchillo();
   558C CD D7 53      [17]  716 	call	_borrarCuchillo
                            717 ;src/main.c:250: cu.lanzado = NO;
   558F 21 91 52      [10]  718 	ld	hl,#(_cu + 0x0006)
   5592 36 00         [10]  719 	ld	(hl),#0x00
   5594 C9            [10]  720 	ret
   5595                     721 00127$:
                            722 ;src/main.c:254: if(cu.y < LIMITE_INFERIOR - G_KNIFEY_0_H){
   5595 69            [ 4]  723 	ld	l, c
   5596 60            [ 4]  724 	ld	h, b
   5597 23            [ 6]  725 	inc	hl
                            726 ;src/main.c:253: else if(cu.direccion == M_abajo){
   5598 7B            [ 4]  727 	ld	a,e
   5599 D6 03         [ 7]  728 	sub	a, #0x03
   559B 20 18         [12]  729 	jr	NZ,00124$
                            730 ;src/main.c:254: if(cu.y < LIMITE_INFERIOR - G_KNIFEY_0_H){
   559D 4E            [ 7]  731 	ld	c,(hl)
   559E 79            [ 4]  732 	ld	a,c
   559F D6 92         [ 7]  733 	sub	a, #0x92
   55A1 30 05         [12]  734 	jr	NC,00114$
                            735 ;src/main.c:255: cu.y++;
   55A3 0C            [ 4]  736 	inc	c
   55A4 71            [ 7]  737 	ld	(hl),c
                            738 ;src/main.c:256: redibujarCuchillo();
   55A5 C3 39 54      [10]  739 	jp  _redibujarCuchillo
   55A8                     740 00114$:
                            741 ;src/main.c:257: }else if(cu.y == LIMITE_INFERIOR - G_KNIFEY_0_H){
   55A8 79            [ 4]  742 	ld	a,c
   55A9 D6 92         [ 7]  743 	sub	a, #0x92
   55AB C0            [11]  744 	ret	NZ
                            745 ;src/main.c:258: borrarCuchillo();
   55AC CD D7 53      [17]  746 	call	_borrarCuchillo
                            747 ;src/main.c:259: cu.lanzado = NO;
   55AF 21 91 52      [10]  748 	ld	hl,#(_cu + 0x0006)
   55B2 36 00         [10]  749 	ld	(hl),#0x00
   55B4 C9            [10]  750 	ret
   55B5                     751 00124$:
                            752 ;src/main.c:262: else if(cu.direccion == M_arriba){
   55B5 7B            [ 4]  753 	ld	a,e
   55B6 D6 02         [ 7]  754 	sub	a, #0x02
   55B8 C0            [11]  755 	ret	NZ
                            756 ;src/main.c:263: if(cu.y > LIMITE_SUPERIOR){
   55B9 4E            [ 7]  757 	ld	c,(hl)
   55BA 3E 08         [ 7]  758 	ld	a,#0x08
   55BC 91            [ 4]  759 	sub	a, c
   55BD 30 05         [12]  760 	jr	NC,00119$
                            761 ;src/main.c:264: cu.y--;
   55BF 0D            [ 4]  762 	dec	c
   55C0 71            [ 7]  763 	ld	(hl),c
                            764 ;src/main.c:265: redibujarCuchillo();
   55C1 C3 39 54      [10]  765 	jp  _redibujarCuchillo
   55C4                     766 00119$:
                            767 ;src/main.c:266: }else if(cu.y == LIMITE_SUPERIOR){
   55C4 79            [ 4]  768 	ld	a,c
   55C5 D6 08         [ 7]  769 	sub	a, #0x08
   55C7 C0            [11]  770 	ret	NZ
                            771 ;src/main.c:267: borrarCuchillo();
   55C8 CD D7 53      [17]  772 	call	_borrarCuchillo
                            773 ;src/main.c:268: cu.lanzado = NO;
   55CB 21 91 52      [10]  774 	ld	hl,#(_cu + 0x0006)
   55CE 36 00         [10]  775 	ld	(hl),#0x00
   55D0 C9            [10]  776 	ret
                            777 ;src/main.c:273: void inicializar() {
                            778 ;	---------------------------------
                            779 ; Function inicializar
                            780 ; ---------------------------------
   55D1                     781 _inicializar::
                            782 ;src/main.c:274: cpct_disableFirmware();
   55D1 CD F4 51      [17]  783 	call	_cpct_disableFirmware
                            784 ;src/main.c:275: cpct_setVideoMode(0);
   55D4 2E 00         [ 7]  785 	ld	l,#0x00
   55D6 CD BD 49      [17]  786 	call	_cpct_setVideoMode
                            787 ;src/main.c:277: cpct_setPalette(g_palette, 16);
   55D9 21 10 00      [10]  788 	ld	hl,#0x0010
   55DC E5            [11]  789 	push	hl
   55DD 21 6E 47      [10]  790 	ld	hl,#_g_palette
   55E0 E5            [11]  791 	push	hl
   55E1 CD 5F 48      [17]  792 	call	_cpct_setPalette
                            793 ;src/main.c:278: cpct_akp_musicInit(G_song);
   55E4 21 00 02      [10]  794 	ld	hl,#_G_song
   55E7 E5            [11]  795 	push	hl
   55E8 CD D0 50      [17]  796 	call	_cpct_akp_musicInit
   55EB F1            [10]  797 	pop	af
                            798 ;src/main.c:279: mapa = g_map1;
   55EC 21 00 40      [10]  799 	ld	hl,#_g_map1+0
   55EF 22 94 52      [16]  800 	ld	(_mapa),hl
                            801 ;src/main.c:280: cpct_etm_setTileset2x4(g_tileset);
   55F2 21 0A 47      [10]  802 	ld	hl,#_g_tileset
   55F5 CD 11 49      [17]  803 	call	_cpct_etm_setTileset2x4
                            804 ;src/main.c:281: dibujarMapa();
   55F8 CD 96 52      [17]  805 	call	_dibujarMapa
                            806 ;src/main.c:284: prota.x = prota.px = 0;
   55FB 21 85 52      [10]  807 	ld	hl,#(_prota + 0x0002)
   55FE 36 00         [10]  808 	ld	(hl),#0x00
   5600 21 83 52      [10]  809 	ld	hl,#_prota
   5603 36 00         [10]  810 	ld	(hl),#0x00
                            811 ;src/main.c:285: prota.y = prota.py = 80;
   5605 21 86 52      [10]  812 	ld	hl,#(_prota + 0x0003)
   5608 36 50         [10]  813 	ld	(hl),#0x50
   560A 21 84 52      [10]  814 	ld	hl,#(_prota + 0x0001)
   560D 36 50         [10]  815 	ld	(hl),#0x50
                            816 ;src/main.c:286: prota.mover  = NO;
   560F 21 89 52      [10]  817 	ld	hl,#(_prota + 0x0006)
   5612 36 00         [10]  818 	ld	(hl),#0x00
                            819 ;src/main.c:287: prota.mira=M_derecha;
   5614 21 8A 52      [10]  820 	ld	hl,#(_prota + 0x0007)
   5617 36 00         [10]  821 	ld	(hl),#0x00
                            822 ;src/main.c:288: prota.sprite = g_hero;
   5619 21 7E 47      [10]  823 	ld	hl,#_g_hero
   561C 22 87 52      [16]  824 	ld	((_prota + 0x0004)), hl
                            825 ;src/main.c:289: cu.x = cu.px =0;
   561F 11 8B 52      [10]  826 	ld	de,#_cu+0
   5622 01 8D 52      [10]  827 	ld	bc,#_cu + 2
   5625 AF            [ 4]  828 	xor	a, a
   5626 02            [ 7]  829 	ld	(bc),a
   5627 AF            [ 4]  830 	xor	a, a
   5628 12            [ 7]  831 	ld	(de),a
                            832 ;src/main.c:290: cu.x = cu.px = 0;
   5629 AF            [ 4]  833 	xor	a, a
   562A 02            [ 7]  834 	ld	(bc),a
   562B 21 8B 52      [10]  835 	ld	hl,#_cu
   562E 36 00         [10]  836 	ld	(hl),#0x00
                            837 ;src/main.c:291: cu.lanzado=0;
   5630 21 91 52      [10]  838 	ld	hl,#(_cu + 0x0006)
   5633 36 00         [10]  839 	ld	(hl),#0x00
                            840 ;src/main.c:293: dibujarProta();
   5635 CD AC 52      [17]  841 	call	_dibujarProta
   5638 C9            [10]  842 	ret
                            843 ;src/main.c:296: void main(void) {
                            844 ;	---------------------------------
                            845 ; Function main
                            846 ; ---------------------------------
   5639                     847 _main::
                            848 ;src/main.c:299: inicializar();
   5639 CD D1 55      [17]  849 	call	_inicializar
                            850 ;src/main.c:300: cpct_akp_musicPlay();
   563C CD CD 49      [17]  851 	call	_cpct_akp_musicPlay
                            852 ;src/main.c:303: while (1) {
   563F                     853 00106$:
                            854 ;src/main.c:306: comprobarTeclado();
   563F CD 12 55      [17]  855 	call	_comprobarTeclado
                            856 ;src/main.c:308: if(cu.lanzado){
   5642 3A 91 52      [13]  857 	ld	a, (#(_cu + 0x0006) + 0)
   5645 B7            [ 4]  858 	or	a, a
   5646 28 06         [12]  859 	jr	Z,00102$
                            860 ;src/main.c:309: cpct_waitVSYNC();
   5648 CD B5 49      [17]  861 	call	_cpct_waitVSYNC
                            862 ;src/main.c:310: moverCuchillo();
   564B CD 53 55      [17]  863 	call	_moverCuchillo
   564E                     864 00102$:
                            865 ;src/main.c:312: if (prota.mover) {
   564E 3A 89 52      [13]  866 	ld	a, (#(_prota + 0x0006) + 0)
   5651 B7            [ 4]  867 	or	a, a
   5652 28 0B         [12]  868 	jr	Z,00104$
                            869 ;src/main.c:313: cpct_waitVSYNC();
   5654 CD B5 49      [17]  870 	call	_cpct_waitVSYNC
                            871 ;src/main.c:314: redibujarProta();
   5657 CD 0D 53      [17]  872 	call	_redibujarProta
                            873 ;src/main.c:315: prota.mover = NO;
   565A 21 89 52      [10]  874 	ld	hl,#(_prota + 0x0006)
   565D 36 00         [10]  875 	ld	(hl),#0x00
   565F                     876 00104$:
                            877 ;src/main.c:317: cpct_waitVSYNC();
   565F CD B5 49      [17]  878 	call	_cpct_waitVSYNC
   5662 18 DB         [12]  879 	jr	00106$
                            880 	.area _CODE
                            881 	.area _INITIALIZER
                            882 	.area _CABS (ABS)
   0200                     883 	.org 0x0200
   0200                     884 _G_song:
   0200 41                  885 	.db #0x41	; 65	'A'
   0201 54                  886 	.db #0x54	; 84	'T'
   0202 31                  887 	.db #0x31	; 49	'1'
   0203 30                  888 	.db #0x30	; 48	'0'
   0204 01                  889 	.db #0x01	; 1
   0205 40                  890 	.db #0x40	; 64
   0206 42                  891 	.db #0x42	; 66	'B'
   0207 0F                  892 	.db #0x0F	; 15
   0208 02                  893 	.db #0x02	; 2
   0209 06                  894 	.db #0x06	; 6
   020A 1D                  895 	.db #0x1D	; 29
   020B 00                  896 	.db #0x00	; 0
   020C 10                  897 	.db #0x10	; 16
   020D 40                  898 	.db #0x40	; 64
   020E 19                  899 	.db #0x19	; 25
   020F 40                  900 	.db #0x40	; 64
   0210 00                  901 	.db #0x00	; 0
   0211 00                  902 	.db #0x00	; 0
   0212 00                  903 	.db #0x00	; 0
   0213 00                  904 	.db #0x00	; 0
   0214 00                  905 	.db #0x00	; 0
   0215 00                  906 	.db #0x00	; 0
   0216 0D                  907 	.db #0x0D	; 13
   0217 12                  908 	.db #0x12	; 18
   0218 40                  909 	.db #0x40	; 64
   0219 01                  910 	.db #0x01	; 1
   021A 00                  911 	.db #0x00	; 0
   021B 7C                  912 	.db #0x7C	; 124
   021C 18                  913 	.db #0x18	; 24
   021D 78                  914 	.db #0x78	; 120	'x'
   021E 0C                  915 	.db #0x0C	; 12
   021F 34                  916 	.db #0x34	; 52	'4'
   0220 30                  917 	.db #0x30	; 48	'0'
   0221 2C                  918 	.db #0x2C	; 44
   0222 28                  919 	.db #0x28	; 40
   0223 24                  920 	.db #0x24	; 36
   0224 20                  921 	.db #0x20	; 32
   0225 1C                  922 	.db #0x1C	; 28
   0226 0D                  923 	.db #0x0D	; 13
   0227 25                  924 	.db #0x25	; 37
   0228 40                  925 	.db #0x40	; 64
   0229 20                  926 	.db #0x20	; 32
   022A 00                  927 	.db #0x00	; 0
   022B 00                  928 	.db #0x00	; 0
   022C 00                  929 	.db #0x00	; 0
   022D 39                  930 	.db #0x39	; 57	'9'
   022E 40                  931 	.db #0x40	; 64
   022F 00                  932 	.db #0x00	; 0
   0230 57                  933 	.db #0x57	; 87	'W'
   0231 40                  934 	.db #0x40	; 64
   0232 3B                  935 	.db #0x3B	; 59
   0233 40                  936 	.db #0x40	; 64
   0234 57                  937 	.db #0x57	; 87	'W'
   0235 40                  938 	.db #0x40	; 64
   0236 01                  939 	.db #0x01	; 1
   0237 2F                  940 	.db #0x2F	; 47
   0238 40                  941 	.db #0x40	; 64
   0239 19                  942 	.db #0x19	; 25
   023A 00                  943 	.db #0x00	; 0
   023B 76                  944 	.db #0x76	; 118	'v'
   023C E1                  945 	.db #0xE1	; 225
   023D 00                  946 	.db #0x00	; 0
   023E 00                  947 	.db #0x00	; 0
   023F 01                  948 	.db #0x01	; 1
   0240 04                  949 	.db #0x04	; 4
   0241 51                  950 	.db #0x51	; 81	'Q'
   0242 04                  951 	.db #0x04	; 4
   0243 37                  952 	.db #0x37	; 55	'7'
   0244 04                  953 	.db #0x04	; 4
   0245 4F                  954 	.db #0x4F	; 79	'O'
   0246 04                  955 	.db #0x04	; 4
   0247 37                  956 	.db #0x37	; 55	'7'
   0248 02                  957 	.db #0x02	; 2
   0249 4B                  958 	.db #0x4B	; 75	'K'
   024A 02                  959 	.db #0x02	; 2
   024B 37                  960 	.db #0x37	; 55	'7'
   024C 04                  961 	.db #0x04	; 4
   024D 4F                  962 	.db #0x4F	; 79	'O'
   024E 04                  963 	.db #0x04	; 4
   024F 37                  964 	.db #0x37	; 55	'7'
   0250 04                  965 	.db #0x04	; 4
   0251 4F                  966 	.db #0x4F	; 79	'O'
   0252 04                  967 	.db #0x04	; 4
   0253 37                  968 	.db #0x37	; 55	'7'
   0254 02                  969 	.db #0x02	; 2
   0255 4B                  970 	.db #0x4B	; 75	'K'
   0256 00                  971 	.db #0x00	; 0
   0257 42                  972 	.db #0x42	; 66	'B'
   0258 60                  973 	.db #0x60	; 96
   0259 00                  974 	.db #0x00	; 0
   025A 42                  975 	.db #0x42	; 66	'B'
   025B 80                  976 	.db #0x80	; 128
   025C 00                  977 	.db #0x00	; 0
   025D 00                  978 	.db #0x00	; 0
   025E 42                  979 	.db #0x42	; 66	'B'
   025F 00                  980 	.db #0x00	; 0
   0260 00                  981 	.db #0x00	; 0
