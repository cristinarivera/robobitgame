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
                             13 	.globl _inicializarJuego
                             14 	.globl _inicializarCPC
                             15 	.globl _inicializarEnemy
                             16 	.globl _menuInicio
                             17 	.globl _menuFin
                             18 	.globl _borrarPantallaAbajo
                             19 	.globl _barraPuntuacionInicial
                             20 	.globl _moverCuchillo
                             21 	.globl _checkKnifeCollision
                             22 	.globl _comprobarTeclado
                             23 	.globl _lanzarCuchillo
                             24 	.globl _redibujarCuchillo
                             25 	.globl _borrarCuchillo
                             26 	.globl _dibujarCuchillo
                             27 	.globl _moverAbajo
                             28 	.globl _moverArriba
                             29 	.globl _moverDerecha
                             30 	.globl _moverIzquierda
                             31 	.globl _avanzarMapa
                             32 	.globl _patrolDecision
                             33 	.globl _moverEnemigo
                             34 	.globl _moverEnemigoAbajo
                             35 	.globl _moverEnemigoArriba
                             36 	.globl _checkEnemyCollision
                             37 	.globl _redibujarEnemigo
                             38 	.globl _borrarEnemigo
                             39 	.globl _dibujarEnemigo
                             40 	.globl _checkCollision
                             41 	.globl _getTilePtr
                             42 	.globl _redibujarProta
                             43 	.globl _borrarProta
                             44 	.globl _dibujarProta
                             45 	.globl _dibujarMapa
                             46 	.globl _cpct_etm_setTileset2x4
                             47 	.globl _cpct_etm_drawTileBox2x4
                             48 	.globl _cpct_getRandom_mxor_u8
                             49 	.globl _cpct_akp_musicPlay
                             50 	.globl _cpct_akp_musicInit
                             51 	.globl _cpct_getScreenPtr
                             52 	.globl _cpct_setPALColour
                             53 	.globl _cpct_setPalette
                             54 	.globl _cpct_waitVSYNC
                             55 	.globl _cpct_setVideoMode
                             56 	.globl _cpct_drawStringM0
                             57 	.globl _cpct_drawSpriteMaskedAlignedTable
                             58 	.globl _cpct_drawSolidBox
                             59 	.globl _cpct_drawSprite
                             60 	.globl _cpct_isAnyKeyPressed
                             61 	.globl _cpct_isKeyPressed
                             62 	.globl _cpct_scanKeyboard_if
                             63 	.globl _cpct_scanKeyboard_f
                             64 	.globl _cpct_memset
                             65 	.globl _cpct_disableFirmware
                             66 	.globl _num_mapa
                             67 	.globl _mapa
                             68 	.globl _cu
                             69 	.globl _prota
                             70 	.globl _enemy
                             71 	.globl _EEje
                             72 	.globl _EMirar
                             73 	.globl _mapas
                             74 ;--------------------------------------------------------
                             75 ; special function registers
                             76 ;--------------------------------------------------------
                             77 ;--------------------------------------------------------
                             78 ; ram data
                             79 ;--------------------------------------------------------
                             80 	.area _DATA
   663A                      81 _EMirar::
   663A                      82 	.ds 1
   663B                      83 _EEje::
   663B                      84 	.ds 1
   663C                      85 _enemy::
   663C                      86 	.ds 40
   6664                      87 _prota::
   6664                      88 	.ds 8
   666C                      89 _cu::
   666C                      90 	.ds 10
   6676                      91 _mapa::
   6676                      92 	.ds 2
   6678                      93 _num_mapa::
   6678                      94 	.ds 1
                             95 ;--------------------------------------------------------
                             96 ; ram data
                             97 ;--------------------------------------------------------
                             98 	.area _INITIALIZED
                             99 ;--------------------------------------------------------
                            100 ; absolute external ram data
                            101 ;--------------------------------------------------------
                            102 	.area _DABS (ABS)
                            103 ;--------------------------------------------------------
                            104 ; global & static initialisations
                            105 ;--------------------------------------------------------
                            106 	.area _HOME
                            107 	.area _GSINIT
                            108 	.area _GSFINAL
                            109 	.area _GSINIT
                            110 ;--------------------------------------------------------
                            111 ; Home
                            112 ;--------------------------------------------------------
                            113 	.area _HOME
                            114 	.area _HOME
                            115 ;--------------------------------------------------------
                            116 ; code
                            117 ;--------------------------------------------------------
                            118 	.area _CODE
                            119 ;src/main.c:114: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
                            120 ;	---------------------------------
                            121 ; Function dummy_cpct_transparentMaskTable0M0_container
                            122 ; ---------------------------------
   58DA                     123 _dummy_cpct_transparentMaskTable0M0_container::
                            124 	.area _g_tablatrans_ (ABS) 
   3E00                     125 	.org 0x3E00 
   3E00                     126 	 _g_tablatrans::
   3E00 FF AA 55 00 AA AA   127 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E08 55 00 55 00 00 00   128 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E10 AA AA 00 00 AA AA   129 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E18 00 00 00 00 00 00   130 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E20 55 00 55 00 00 00   131 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E28 55 00 55 00 00 00   132 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E30 00 00 00 00 00 00   133 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E38 00 00 00 00 00 00   134 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E40 AA AA 00 00 AA AA   135 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E48 00 00 00 00 00 00   136 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E50 AA AA 00 00 AA AA   137 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E58 00 00 00 00 00 00   138 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E60 00 00 00 00 00 00   139 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E68 00 00 00 00 00 00   140 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E70 00 00 00 00 00 00   141 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E78 00 00 00 00 00 00   142 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E80 55 00 55 00 00 00   143 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E88 55 00 55 00 00 00   144 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E90 00 00 00 00 00 00   145 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E98 00 00 00 00 00 00   146 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA0 55 00 55 00 00 00   147 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA8 55 00 55 00 00 00   148 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB0 00 00 00 00 00 00   149 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB8 00 00 00 00 00 00   150 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC0 00 00 00 00 00 00   151 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC8 00 00 00 00 00 00   152 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED0 00 00 00 00 00 00   153 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED8 00 00 00 00 00 00   154 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE0 00 00 00 00 00 00   155 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE8 00 00 00 00 00 00   156 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF0 00 00 00 00 00 00   157 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF8 00 00 00 00 00 00   158 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            159 	.area _CSEG (REL, CON) 
                            160 ;src/main.c:117: void dibujarMapa() {
                            161 ;	---------------------------------
                            162 ; Function dibujarMapa
                            163 ; ---------------------------------
   6679                     164 _dibujarMapa::
                            165 ;src/main.c:118: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   6679 2A 76 66      [16]  166 	ld	hl,(_mapa)
   667C E5            [11]  167 	push	hl
   667D 21 00 C0      [10]  168 	ld	hl,#0xC000
   6680 E5            [11]  169 	push	hl
   6681 21 2C 28      [10]  170 	ld	hl,#0x282C
   6684 E5            [11]  171 	push	hl
   6685 2E 00         [ 7]  172 	ld	l, #0x00
   6687 E5            [11]  173 	push	hl
   6688 AF            [ 4]  174 	xor	a, a
   6689 F5            [11]  175 	push	af
   668A 33            [ 6]  176 	inc	sp
   668B CD 8C 5A      [17]  177 	call	_cpct_etm_drawTileBox2x4
   668E C9            [10]  178 	ret
   668F                     179 _mapas:
   668F C0 4D               180 	.dw _g_map1
   6691 E0 46               181 	.dw _g_map2
   6693 00 40               182 	.dw _g_map3
                            183 ;src/main.c:123: void dibujarProta() {
                            184 ;	---------------------------------
                            185 ; Function dibujarProta
                            186 ; ---------------------------------
   6695                     187 _dibujarProta::
                            188 ;src/main.c:124: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   6695 21 65 66      [10]  189 	ld	hl, #_prota + 1
   6698 56            [ 7]  190 	ld	d,(hl)
   6699 21 64 66      [10]  191 	ld	hl, #_prota + 0
   669C 46            [ 7]  192 	ld	b,(hl)
   669D D5            [11]  193 	push	de
   669E 33            [ 6]  194 	inc	sp
   669F C5            [11]  195 	push	bc
   66A0 33            [ 6]  196 	inc	sp
   66A1 21 00 C0      [10]  197 	ld	hl,#0xC000
   66A4 E5            [11]  198 	push	hl
   66A5 CD B8 65      [17]  199 	call	_cpct_getScreenPtr
   66A8 EB            [ 4]  200 	ex	de,hl
                            201 ;src/main.c:125: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   66A9 ED 4B 68 66   [20]  202 	ld	bc, (#_prota + 4)
   66AD 21 00 3E      [10]  203 	ld	hl,#_g_tablatrans
   66B0 E5            [11]  204 	push	hl
   66B1 21 07 16      [10]  205 	ld	hl,#0x1607
   66B4 E5            [11]  206 	push	hl
   66B5 D5            [11]  207 	push	de
   66B6 C5            [11]  208 	push	bc
   66B7 CD D8 65      [17]  209 	call	_cpct_drawSpriteMaskedAlignedTable
   66BA C9            [10]  210 	ret
                            211 ;src/main.c:128: void borrarProta() {
                            212 ;	---------------------------------
                            213 ; Function borrarProta
                            214 ; ---------------------------------
   66BB                     215 _borrarProta::
   66BB DD E5         [15]  216 	push	ix
   66BD DD 21 00 00   [14]  217 	ld	ix,#0
   66C1 DD 39         [15]  218 	add	ix,sp
   66C3 3B            [ 6]  219 	dec	sp
                            220 ;src/main.c:130: u8 w = 4 + (prota.px & 1);
   66C4 21 66 66      [10]  221 	ld	hl, #_prota + 2
   66C7 4E            [ 7]  222 	ld	c,(hl)
   66C8 79            [ 4]  223 	ld	a,c
   66C9 E6 01         [ 7]  224 	and	a, #0x01
   66CB 47            [ 4]  225 	ld	b,a
   66CC 04            [ 4]  226 	inc	b
   66CD 04            [ 4]  227 	inc	b
   66CE 04            [ 4]  228 	inc	b
   66CF 04            [ 4]  229 	inc	b
                            230 ;src/main.c:133: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   66D0 21 67 66      [10]  231 	ld	hl, #_prota + 3
   66D3 5E            [ 7]  232 	ld	e,(hl)
   66D4 CB 4B         [ 8]  233 	bit	1, e
   66D6 28 04         [12]  234 	jr	Z,00103$
   66D8 3E 01         [ 7]  235 	ld	a,#0x01
   66DA 18 02         [12]  236 	jr	00104$
   66DC                     237 00103$:
   66DC 3E 00         [ 7]  238 	ld	a,#0x00
   66DE                     239 00104$:
   66DE C6 06         [ 7]  240 	add	a, #0x06
   66E0 DD 77 FF      [19]  241 	ld	-1 (ix),a
                            242 ;src/main.c:135: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   66E3 FD 2A 76 66   [20]  243 	ld	iy,(_mapa)
   66E7 16 00         [ 7]  244 	ld	d,#0x00
   66E9 63            [ 4]  245 	ld	h,e
   66EA 6A            [ 4]  246 	ld	l,d
   66EB CB 7A         [ 8]  247 	bit	7, d
   66ED 28 05         [12]  248 	jr	Z,00105$
   66EF 13            [ 6]  249 	inc	de
   66F0 13            [ 6]  250 	inc	de
   66F1 13            [ 6]  251 	inc	de
   66F2 63            [ 4]  252 	ld	h,e
   66F3 6A            [ 4]  253 	ld	l,d
   66F4                     254 00105$:
   66F4 5C            [ 4]  255 	ld	e, h
   66F5 55            [ 4]  256 	ld	d, l
   66F6 CB 2A         [ 8]  257 	sra	d
   66F8 CB 1B         [ 8]  258 	rr	e
   66FA CB 2A         [ 8]  259 	sra	d
   66FC CB 1B         [ 8]  260 	rr	e
   66FE 51            [ 4]  261 	ld	d,c
   66FF CB 3A         [ 8]  262 	srl	d
   6701 FD E5         [15]  263 	push	iy
   6703 21 00 C0      [10]  264 	ld	hl,#0xC000
   6706 E5            [11]  265 	push	hl
   6707 3E 28         [ 7]  266 	ld	a,#0x28
   6709 F5            [11]  267 	push	af
   670A 33            [ 6]  268 	inc	sp
   670B DD 7E FF      [19]  269 	ld	a,-1 (ix)
   670E F5            [11]  270 	push	af
   670F 33            [ 6]  271 	inc	sp
   6710 C5            [11]  272 	push	bc
   6711 33            [ 6]  273 	inc	sp
   6712 7B            [ 4]  274 	ld	a,e
   6713 F5            [11]  275 	push	af
   6714 33            [ 6]  276 	inc	sp
   6715 D5            [11]  277 	push	de
   6716 33            [ 6]  278 	inc	sp
   6717 CD 8C 5A      [17]  279 	call	_cpct_etm_drawTileBox2x4
   671A 33            [ 6]  280 	inc	sp
   671B DD E1         [14]  281 	pop	ix
   671D C9            [10]  282 	ret
                            283 ;src/main.c:140: void redibujarProta() {
                            284 ;	---------------------------------
                            285 ; Function redibujarProta
                            286 ; ---------------------------------
   671E                     287 _redibujarProta::
                            288 ;src/main.c:141: borrarProta();
   671E CD BB 66      [17]  289 	call	_borrarProta
                            290 ;src/main.c:142: prota.px = prota.x;
   6721 01 66 66      [10]  291 	ld	bc,#_prota + 2
   6724 3A 64 66      [13]  292 	ld	a, (#_prota + 0)
   6727 02            [ 7]  293 	ld	(bc),a
                            294 ;src/main.c:143: prota.py = prota.y;
   6728 01 67 66      [10]  295 	ld	bc,#_prota + 3
   672B 3A 65 66      [13]  296 	ld	a, (#_prota + 1)
   672E 02            [ 7]  297 	ld	(bc),a
                            298 ;src/main.c:144: dibujarProta();
   672F C3 95 66      [10]  299 	jp  _dibujarProta
                            300 ;src/main.c:147: u8* getTilePtr(u8 x, u8 y) {
                            301 ;	---------------------------------
                            302 ; Function getTilePtr
                            303 ; ---------------------------------
   6732                     304 _getTilePtr::
                            305 ;src/main.c:148: return mapa + (y/4)*g_map1_W + x/2;
   6732 21 03 00      [10]  306 	ld	hl, #3+0
   6735 39            [11]  307 	add	hl, sp
   6736 4E            [ 7]  308 	ld	c, (hl)
   6737 CB 39         [ 8]  309 	srl	c
   6739 CB 39         [ 8]  310 	srl	c
   673B 06 00         [ 7]  311 	ld	b,#0x00
   673D 69            [ 4]  312 	ld	l, c
   673E 60            [ 4]  313 	ld	h, b
   673F 29            [11]  314 	add	hl, hl
   6740 29            [11]  315 	add	hl, hl
   6741 09            [11]  316 	add	hl, bc
   6742 29            [11]  317 	add	hl, hl
   6743 29            [11]  318 	add	hl, hl
   6744 29            [11]  319 	add	hl, hl
   6745 ED 5B 76 66   [20]  320 	ld	de,(_mapa)
   6749 19            [11]  321 	add	hl,de
   674A FD 21 02 00   [14]  322 	ld	iy,#2
   674E FD 39         [15]  323 	add	iy,sp
   6750 FD 4E 00      [19]  324 	ld	c,0 (iy)
   6753 CB 39         [ 8]  325 	srl	c
   6755 59            [ 4]  326 	ld	e,c
   6756 16 00         [ 7]  327 	ld	d,#0x00
   6758 19            [11]  328 	add	hl,de
   6759 C9            [10]  329 	ret
                            330 ;src/main.c:151: u8 checkCollision(int direction) { // check optimization
                            331 ;	---------------------------------
                            332 ; Function checkCollision
                            333 ; ---------------------------------
   675A                     334 _checkCollision::
   675A DD E5         [15]  335 	push	ix
   675C DD 21 00 00   [14]  336 	ld	ix,#0
   6760 DD 39         [15]  337 	add	ix,sp
   6762 21 F8 FF      [10]  338 	ld	hl,#-8
   6765 39            [11]  339 	add	hl,sp
   6766 F9            [ 6]  340 	ld	sp,hl
                            341 ;src/main.c:154: switch (direction) {
   6767 DD CB 05 7E   [20]  342 	bit	7, 5 (ix)
   676B C2 77 68      [10]  343 	jp	NZ,00105$
   676E 3E 03         [ 7]  344 	ld	a,#0x03
   6770 DD BE 04      [19]  345 	cp	a, 4 (ix)
   6773 3E 00         [ 7]  346 	ld	a,#0x00
   6775 DD 9E 05      [19]  347 	sbc	a, 5 (ix)
   6778 E2 7D 67      [10]  348 	jp	PO, 00128$
   677B EE 80         [ 7]  349 	xor	a, #0x80
   677D                     350 00128$:
   677D FA 77 68      [10]  351 	jp	M,00105$
   6780 DD 5E 04      [19]  352 	ld	e,4 (ix)
   6783 16 00         [ 7]  353 	ld	d,#0x00
   6785 21 8C 67      [10]  354 	ld	hl,#00129$
   6788 19            [11]  355 	add	hl,de
   6789 19            [11]  356 	add	hl,de
   678A 19            [11]  357 	add	hl,de
   678B E9            [ 4]  358 	jp	(hl)
   678C                     359 00129$:
   678C C3 98 67      [10]  360 	jp	00101$
   678F C3 DD 67      [10]  361 	jp	00102$
   6792 C3 1D 68      [10]  362 	jp	00103$
   6795 C3 4B 68      [10]  363 	jp	00104$
                            364 ;src/main.c:155: case 0:
   6798                     365 00101$:
                            366 ;src/main.c:156: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   6798 21 65 66      [10]  367 	ld	hl, #(_prota + 0x0001) + 0
   679B 46            [ 7]  368 	ld	b,(hl)
   679C 3A 64 66      [13]  369 	ld	a, (#_prota + 0)
   679F C6 04         [ 7]  370 	add	a, #0x04
   67A1 C5            [11]  371 	push	bc
   67A2 33            [ 6]  372 	inc	sp
   67A3 F5            [11]  373 	push	af
   67A4 33            [ 6]  374 	inc	sp
   67A5 CD 32 67      [17]  375 	call	_getTilePtr
   67A8 F1            [10]  376 	pop	af
   67A9 DD 75 FE      [19]  377 	ld	-2 (ix),l
   67AC DD 74 FF      [19]  378 	ld	-1 (ix),h
                            379 ;src/main.c:157: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   67AF 3A 65 66      [13]  380 	ld	a, (#(_prota + 0x0001) + 0)
   67B2 C6 14         [ 7]  381 	add	a, #0x14
   67B4 47            [ 4]  382 	ld	b,a
   67B5 3A 64 66      [13]  383 	ld	a, (#_prota + 0)
   67B8 C6 04         [ 7]  384 	add	a, #0x04
   67BA C5            [11]  385 	push	bc
   67BB 33            [ 6]  386 	inc	sp
   67BC F5            [11]  387 	push	af
   67BD 33            [ 6]  388 	inc	sp
   67BE CD 32 67      [17]  389 	call	_getTilePtr
   67C1 F1            [10]  390 	pop	af
   67C2 4D            [ 4]  391 	ld	c,l
   67C3 44            [ 4]  392 	ld	b,h
                            393 ;src/main.c:158: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   67C4 3A 65 66      [13]  394 	ld	a, (#(_prota + 0x0001) + 0)
   67C7 C6 0B         [ 7]  395 	add	a, #0x0B
   67C9 57            [ 4]  396 	ld	d,a
   67CA 3A 64 66      [13]  397 	ld	a, (#_prota + 0)
   67CD C6 04         [ 7]  398 	add	a, #0x04
   67CF C5            [11]  399 	push	bc
   67D0 D5            [11]  400 	push	de
   67D1 33            [ 6]  401 	inc	sp
   67D2 F5            [11]  402 	push	af
   67D3 33            [ 6]  403 	inc	sp
   67D4 CD 32 67      [17]  404 	call	_getTilePtr
   67D7 F1            [10]  405 	pop	af
   67D8 EB            [ 4]  406 	ex	de,hl
   67D9 C1            [10]  407 	pop	bc
                            408 ;src/main.c:159: break;
   67DA C3 77 68      [10]  409 	jp	00105$
                            410 ;src/main.c:160: case 1:
   67DD                     411 00102$:
                            412 ;src/main.c:161: headTile  = getTilePtr(prota.x - 1, prota.y);
   67DD 21 65 66      [10]  413 	ld	hl, #(_prota + 0x0001) + 0
   67E0 46            [ 7]  414 	ld	b,(hl)
   67E1 21 64 66      [10]  415 	ld	hl, #_prota + 0
   67E4 56            [ 7]  416 	ld	d,(hl)
   67E5 15            [ 4]  417 	dec	d
   67E6 4A            [ 4]  418 	ld	c, d
   67E7 C5            [11]  419 	push	bc
   67E8 CD 32 67      [17]  420 	call	_getTilePtr
   67EB F1            [10]  421 	pop	af
   67EC DD 75 FE      [19]  422 	ld	-2 (ix),l
   67EF DD 74 FF      [19]  423 	ld	-1 (ix),h
                            424 ;src/main.c:162: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
   67F2 3A 65 66      [13]  425 	ld	a, (#(_prota + 0x0001) + 0)
   67F5 C6 14         [ 7]  426 	add	a, #0x14
   67F7 47            [ 4]  427 	ld	b,a
   67F8 21 64 66      [10]  428 	ld	hl, #_prota + 0
   67FB 56            [ 7]  429 	ld	d,(hl)
   67FC 15            [ 4]  430 	dec	d
   67FD 4A            [ 4]  431 	ld	c, d
   67FE C5            [11]  432 	push	bc
   67FF CD 32 67      [17]  433 	call	_getTilePtr
   6802 F1            [10]  434 	pop	af
   6803 4D            [ 4]  435 	ld	c,l
   6804 44            [ 4]  436 	ld	b,h
                            437 ;src/main.c:163: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
   6805 3A 65 66      [13]  438 	ld	a, (#(_prota + 0x0001) + 0)
   6808 C6 0B         [ 7]  439 	add	a, #0x0B
   680A 57            [ 4]  440 	ld	d,a
   680B 3A 64 66      [13]  441 	ld	a, (#_prota + 0)
   680E C6 FF         [ 7]  442 	add	a,#0xFF
   6810 C5            [11]  443 	push	bc
   6811 D5            [11]  444 	push	de
   6812 33            [ 6]  445 	inc	sp
   6813 F5            [11]  446 	push	af
   6814 33            [ 6]  447 	inc	sp
   6815 CD 32 67      [17]  448 	call	_getTilePtr
   6818 F1            [10]  449 	pop	af
   6819 EB            [ 4]  450 	ex	de,hl
   681A C1            [10]  451 	pop	bc
                            452 ;src/main.c:164: break;
   681B 18 5A         [12]  453 	jr	00105$
                            454 ;src/main.c:165: case 2:
   681D                     455 00103$:
                            456 ;src/main.c:166: headTile   = getTilePtr(prota.x, prota.y - 2);
   681D 21 65 66      [10]  457 	ld	hl, #(_prota + 0x0001) + 0
   6820 46            [ 7]  458 	ld	b,(hl)
   6821 05            [ 4]  459 	dec	b
   6822 05            [ 4]  460 	dec	b
   6823 21 64 66      [10]  461 	ld	hl, #_prota + 0
   6826 4E            [ 7]  462 	ld	c, (hl)
   6827 C5            [11]  463 	push	bc
   6828 CD 32 67      [17]  464 	call	_getTilePtr
   682B F1            [10]  465 	pop	af
   682C DD 75 FE      [19]  466 	ld	-2 (ix),l
   682F DD 74 FF      [19]  467 	ld	-1 (ix),h
                            468 ;src/main.c:167: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
   6832 3A 65 66      [13]  469 	ld	a, (#(_prota + 0x0001) + 0)
   6835 47            [ 4]  470 	ld	b,a
   6836 05            [ 4]  471 	dec	b
   6837 05            [ 4]  472 	dec	b
   6838 3A 64 66      [13]  473 	ld	a, (#_prota + 0)
   683B C6 03         [ 7]  474 	add	a, #0x03
   683D C5            [11]  475 	push	bc
   683E 33            [ 6]  476 	inc	sp
   683F F5            [11]  477 	push	af
   6840 33            [ 6]  478 	inc	sp
   6841 CD 32 67      [17]  479 	call	_getTilePtr
   6844 F1            [10]  480 	pop	af
   6845 4D            [ 4]  481 	ld	c,l
   6846 44            [ 4]  482 	ld	b,h
                            483 ;src/main.c:168: *waistTile = 0;
   6847 AF            [ 4]  484 	xor	a, a
   6848 12            [ 7]  485 	ld	(de),a
                            486 ;src/main.c:169: break;
   6849 18 2C         [12]  487 	jr	00105$
                            488 ;src/main.c:170: case 3:
   684B                     489 00104$:
                            490 ;src/main.c:171: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
   684B 3A 65 66      [13]  491 	ld	a, (#(_prota + 0x0001) + 0)
   684E C6 16         [ 7]  492 	add	a, #0x16
   6850 47            [ 4]  493 	ld	b,a
   6851 21 64 66      [10]  494 	ld	hl, #_prota + 0
   6854 4E            [ 7]  495 	ld	c, (hl)
   6855 C5            [11]  496 	push	bc
   6856 CD 32 67      [17]  497 	call	_getTilePtr
   6859 F1            [10]  498 	pop	af
   685A DD 75 FE      [19]  499 	ld	-2 (ix),l
   685D DD 74 FF      [19]  500 	ld	-1 (ix),h
                            501 ;src/main.c:172: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   6860 3A 65 66      [13]  502 	ld	a, (#(_prota + 0x0001) + 0)
   6863 C6 16         [ 7]  503 	add	a, #0x16
   6865 47            [ 4]  504 	ld	b,a
   6866 3A 64 66      [13]  505 	ld	a, (#_prota + 0)
   6869 C6 03         [ 7]  506 	add	a, #0x03
   686B C5            [11]  507 	push	bc
   686C 33            [ 6]  508 	inc	sp
   686D F5            [11]  509 	push	af
   686E 33            [ 6]  510 	inc	sp
   686F CD 32 67      [17]  511 	call	_getTilePtr
   6872 F1            [10]  512 	pop	af
   6873 4D            [ 4]  513 	ld	c,l
   6874 44            [ 4]  514 	ld	b,h
                            515 ;src/main.c:173: *waistTile = 0;
   6875 AF            [ 4]  516 	xor	a, a
   6876 12            [ 7]  517 	ld	(de),a
                            518 ;src/main.c:175: }
   6877                     519 00105$:
                            520 ;src/main.c:177: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   6877 DD 6E FE      [19]  521 	ld	l,-2 (ix)
   687A DD 66 FF      [19]  522 	ld	h,-1 (ix)
   687D 6E            [ 7]  523 	ld	l,(hl)
   687E 3E 02         [ 7]  524 	ld	a,#0x02
   6880 95            [ 4]  525 	sub	a, l
   6881 38 0E         [12]  526 	jr	C,00106$
   6883 0A            [ 7]  527 	ld	a,(bc)
   6884 4F            [ 4]  528 	ld	c,a
   6885 3E 02         [ 7]  529 	ld	a,#0x02
   6887 91            [ 4]  530 	sub	a, c
   6888 38 07         [12]  531 	jr	C,00106$
   688A 1A            [ 7]  532 	ld	a,(de)
   688B 4F            [ 4]  533 	ld	c,a
   688C 3E 02         [ 7]  534 	ld	a,#0x02
   688E 91            [ 4]  535 	sub	a, c
   688F 30 04         [12]  536 	jr	NC,00107$
   6891                     537 00106$:
                            538 ;src/main.c:178: return 1;
   6891 2E 01         [ 7]  539 	ld	l,#0x01
   6893 18 02         [12]  540 	jr	00110$
   6895                     541 00107$:
                            542 ;src/main.c:180: return 0;
   6895 2E 00         [ 7]  543 	ld	l,#0x00
   6897                     544 00110$:
   6897 DD F9         [10]  545 	ld	sp, ix
   6899 DD E1         [14]  546 	pop	ix
   689B C9            [10]  547 	ret
                            548 ;src/main.c:184: void dibujarEnemigo(TEnemy *enemy) {
                            549 ;	---------------------------------
                            550 ; Function dibujarEnemigo
                            551 ; ---------------------------------
   689C                     552 _dibujarEnemigo::
   689C DD E5         [15]  553 	push	ix
   689E DD 21 00 00   [14]  554 	ld	ix,#0
   68A2 DD 39         [15]  555 	add	ix,sp
                            556 ;src/main.c:185: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   68A4 DD 4E 04      [19]  557 	ld	c,4 (ix)
   68A7 DD 46 05      [19]  558 	ld	b,5 (ix)
   68AA 69            [ 4]  559 	ld	l, c
   68AB 60            [ 4]  560 	ld	h, b
   68AC 23            [ 6]  561 	inc	hl
   68AD 56            [ 7]  562 	ld	d,(hl)
   68AE 0A            [ 7]  563 	ld	a,(bc)
   68AF C5            [11]  564 	push	bc
   68B0 D5            [11]  565 	push	de
   68B1 33            [ 6]  566 	inc	sp
   68B2 F5            [11]  567 	push	af
   68B3 33            [ 6]  568 	inc	sp
   68B4 21 00 C0      [10]  569 	ld	hl,#0xC000
   68B7 E5            [11]  570 	push	hl
   68B8 CD B8 65      [17]  571 	call	_cpct_getScreenPtr
   68BB EB            [ 4]  572 	ex	de,hl
                            573 ;src/main.c:186: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   68BC E1            [10]  574 	pop	hl
   68BD 01 04 00      [10]  575 	ld	bc, #0x0004
   68C0 09            [11]  576 	add	hl, bc
   68C1 4E            [ 7]  577 	ld	c,(hl)
   68C2 23            [ 6]  578 	inc	hl
   68C3 46            [ 7]  579 	ld	b,(hl)
   68C4 21 00 3E      [10]  580 	ld	hl,#_g_tablatrans
   68C7 E5            [11]  581 	push	hl
   68C8 21 04 16      [10]  582 	ld	hl,#0x1604
   68CB E5            [11]  583 	push	hl
   68CC D5            [11]  584 	push	de
   68CD C5            [11]  585 	push	bc
   68CE CD D8 65      [17]  586 	call	_cpct_drawSpriteMaskedAlignedTable
   68D1 DD E1         [14]  587 	pop	ix
   68D3 C9            [10]  588 	ret
                            589 ;src/main.c:189: void borrarEnemigo(TEnemy *enemy) {
                            590 ;	---------------------------------
                            591 ; Function borrarEnemigo
                            592 ; ---------------------------------
   68D4                     593 _borrarEnemigo::
   68D4 DD E5         [15]  594 	push	ix
   68D6 DD 21 00 00   [14]  595 	ld	ix,#0
   68DA DD 39         [15]  596 	add	ix,sp
   68DC F5            [11]  597 	push	af
   68DD F5            [11]  598 	push	af
                            599 ;src/main.c:191: u8 w = 4 + (enemy->px & 1);
   68DE DD 4E 04      [19]  600 	ld	c,4 (ix)
   68E1 DD 46 05      [19]  601 	ld	b,5 (ix)
   68E4 69            [ 4]  602 	ld	l, c
   68E5 60            [ 4]  603 	ld	h, b
   68E6 23            [ 6]  604 	inc	hl
   68E7 23            [ 6]  605 	inc	hl
   68E8 5E            [ 7]  606 	ld	e,(hl)
   68E9 7B            [ 4]  607 	ld	a,e
   68EA E6 01         [ 7]  608 	and	a, #0x01
   68EC C6 04         [ 7]  609 	add	a, #0x04
   68EE DD 77 FD      [19]  610 	ld	-3 (ix),a
                            611 ;src/main.c:194: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   68F1 69            [ 4]  612 	ld	l, c
   68F2 60            [ 4]  613 	ld	h, b
   68F3 23            [ 6]  614 	inc	hl
   68F4 23            [ 6]  615 	inc	hl
   68F5 23            [ 6]  616 	inc	hl
   68F6 56            [ 7]  617 	ld	d,(hl)
   68F7 CB 4A         [ 8]  618 	bit	1, d
   68F9 28 04         [12]  619 	jr	Z,00103$
   68FB 3E 01         [ 7]  620 	ld	a,#0x01
   68FD 18 02         [12]  621 	jr	00104$
   68FF                     622 00103$:
   68FF 3E 00         [ 7]  623 	ld	a,#0x00
   6901                     624 00104$:
   6901 C6 07         [ 7]  625 	add	a, #0x07
   6903 DD 77 FC      [19]  626 	ld	-4 (ix),a
                            627 ;src/main.c:196: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   6906 FD 2A 76 66   [20]  628 	ld	iy,(_mapa)
   690A 6A            [ 4]  629 	ld	l,d
   690B 26 00         [ 7]  630 	ld	h,#0x00
   690D DD 75 FE      [19]  631 	ld	-2 (ix),l
   6910 DD 74 FF      [19]  632 	ld	-1 (ix),h
   6913 CB 7C         [ 8]  633 	bit	7, h
   6915 28 09         [12]  634 	jr	Z,00105$
   6917 23            [ 6]  635 	inc	hl
   6918 23            [ 6]  636 	inc	hl
   6919 23            [ 6]  637 	inc	hl
   691A DD 75 FE      [19]  638 	ld	-2 (ix),l
   691D DD 74 FF      [19]  639 	ld	-1 (ix),h
   6920                     640 00105$:
   6920 DD 56 FE      [19]  641 	ld	d,-2 (ix)
   6923 DD 6E FF      [19]  642 	ld	l,-1 (ix)
   6926 CB 2D         [ 8]  643 	sra	l
   6928 CB 1A         [ 8]  644 	rr	d
   692A CB 2D         [ 8]  645 	sra	l
   692C CB 1A         [ 8]  646 	rr	d
   692E CB 3B         [ 8]  647 	srl	e
   6930 C5            [11]  648 	push	bc
   6931 FD E5         [15]  649 	push	iy
   6933 21 00 C0      [10]  650 	ld	hl,#0xC000
   6936 E5            [11]  651 	push	hl
   6937 3E 28         [ 7]  652 	ld	a,#0x28
   6939 F5            [11]  653 	push	af
   693A 33            [ 6]  654 	inc	sp
   693B DD 66 FC      [19]  655 	ld	h,-4 (ix)
   693E DD 6E FD      [19]  656 	ld	l,-3 (ix)
   6941 E5            [11]  657 	push	hl
   6942 D5            [11]  658 	push	de
   6943 CD 8C 5A      [17]  659 	call	_cpct_etm_drawTileBox2x4
   6946 C1            [10]  660 	pop	bc
                            661 ;src/main.c:198: enemy->mover = NO;
   6947 21 06 00      [10]  662 	ld	hl,#0x0006
   694A 09            [11]  663 	add	hl,bc
   694B 36 00         [10]  664 	ld	(hl),#0x00
   694D DD F9         [10]  665 	ld	sp, ix
   694F DD E1         [14]  666 	pop	ix
   6951 C9            [10]  667 	ret
                            668 ;src/main.c:203: void redibujarEnemigo(TEnemy *enemy) {
                            669 ;	---------------------------------
                            670 ; Function redibujarEnemigo
                            671 ; ---------------------------------
   6952                     672 _redibujarEnemigo::
   6952 DD E5         [15]  673 	push	ix
   6954 DD 21 00 00   [14]  674 	ld	ix,#0
   6958 DD 39         [15]  675 	add	ix,sp
                            676 ;src/main.c:204: borrarEnemigo(enemy);
   695A DD 6E 04      [19]  677 	ld	l,4 (ix)
   695D DD 66 05      [19]  678 	ld	h,5 (ix)
   6960 E5            [11]  679 	push	hl
   6961 CD D4 68      [17]  680 	call	_borrarEnemigo
   6964 F1            [10]  681 	pop	af
                            682 ;src/main.c:205: enemy->px = enemy->x;
   6965 DD 4E 04      [19]  683 	ld	c,4 (ix)
   6968 DD 46 05      [19]  684 	ld	b,5 (ix)
   696B 59            [ 4]  685 	ld	e, c
   696C 50            [ 4]  686 	ld	d, b
   696D 13            [ 6]  687 	inc	de
   696E 13            [ 6]  688 	inc	de
   696F 0A            [ 7]  689 	ld	a,(bc)
   6970 12            [ 7]  690 	ld	(de),a
                            691 ;src/main.c:206: enemy->py = enemy->y;
   6971 59            [ 4]  692 	ld	e, c
   6972 50            [ 4]  693 	ld	d, b
   6973 13            [ 6]  694 	inc	de
   6974 13            [ 6]  695 	inc	de
   6975 13            [ 6]  696 	inc	de
   6976 69            [ 4]  697 	ld	l, c
   6977 60            [ 4]  698 	ld	h, b
   6978 23            [ 6]  699 	inc	hl
   6979 7E            [ 7]  700 	ld	a,(hl)
   697A 12            [ 7]  701 	ld	(de),a
                            702 ;src/main.c:207: dibujarEnemigo(enemy);
   697B C5            [11]  703 	push	bc
   697C CD 9C 68      [17]  704 	call	_dibujarEnemigo
   697F F1            [10]  705 	pop	af
   6980 DD E1         [14]  706 	pop	ix
   6982 C9            [10]  707 	ret
                            708 ;src/main.c:210: u8 checkEnemyCollision(int direction, TEnemy *enemy){
                            709 ;	---------------------------------
                            710 ; Function checkEnemyCollision
                            711 ; ---------------------------------
   6983                     712 _checkEnemyCollision::
   6983 DD E5         [15]  713 	push	ix
   6985 DD 21 00 00   [14]  714 	ld	ix,#0
   6989 DD 39         [15]  715 	add	ix,sp
   698B 21 F9 FF      [10]  716 	ld	hl,#-7
   698E 39            [11]  717 	add	hl,sp
   698F F9            [ 6]  718 	ld	sp,hl
                            719 ;src/main.c:212: u8 colisiona = 1;
   6990 DD 36 F9 01   [19]  720 	ld	-7 (ix),#0x01
                            721 ;src/main.c:214: switch (direction) {
   6994 DD CB 05 7E   [20]  722 	bit	7, 5 (ix)
   6998 C2 96 6B      [10]  723 	jp	NZ,00135$
   699B 3E 03         [ 7]  724 	ld	a,#0x03
   699D DD BE 04      [19]  725 	cp	a, 4 (ix)
   69A0 3E 00         [ 7]  726 	ld	a,#0x00
   69A2 DD 9E 05      [19]  727 	sbc	a, 5 (ix)
   69A5 E2 AA 69      [10]  728 	jp	PO, 00194$
   69A8 EE 80         [ 7]  729 	xor	a, #0x80
   69AA                     730 00194$:
   69AA FA 96 6B      [10]  731 	jp	M,00135$
                            732 ;src/main.c:222: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   69AD DD 4E 06      [19]  733 	ld	c,6 (ix)
   69B0 DD 46 07      [19]  734 	ld	b,7 (ix)
                            735 ;src/main.c:236: enemy->mira = M_abajo;
   69B3 21 07 00      [10]  736 	ld	hl,#0x0007
   69B6 09            [11]  737 	add	hl,bc
   69B7 DD 75 FE      [19]  738 	ld	-2 (ix),l
   69BA DD 74 FF      [19]  739 	ld	-1 (ix),h
                            740 ;src/main.c:222: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   69BD 21 01 00      [10]  741 	ld	hl,#0x0001
   69C0 09            [11]  742 	add	hl,bc
   69C1 DD 75 FA      [19]  743 	ld	-6 (ix),l
   69C4 DD 74 FB      [19]  744 	ld	-5 (ix),h
                            745 ;src/main.c:214: switch (direction) {
   69C7 DD 5E 04      [19]  746 	ld	e,4 (ix)
   69CA 16 00         [ 7]  747 	ld	d,#0x00
   69CC 21 D3 69      [10]  748 	ld	hl,#00195$
   69CF 19            [11]  749 	add	hl,de
   69D0 19            [11]  750 	add	hl,de
   69D1 19            [11]  751 	add	hl,de
   69D2 E9            [ 4]  752 	jp	(hl)
   69D3                     753 00195$:
   69D3 C3 96 6B      [10]  754 	jp	00135$
   69D6 C3 96 6B      [10]  755 	jp	00135$
   69D9 C3 E5 69      [10]  756 	jp	00103$
   69DC C3 BC 6A      [10]  757 	jp	00119$
                            758 ;src/main.c:215: case 0:
                            759 ;src/main.c:217: break;
   69DF C3 96 6B      [10]  760 	jp	00135$
                            761 ;src/main.c:218: case 1:
                            762 ;src/main.c:220: break;
   69E2 C3 96 6B      [10]  763 	jp	00135$
                            764 ;src/main.c:221: case 2:
   69E5                     765 00103$:
                            766 ;src/main.c:222: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   69E5 DD 6E FA      [19]  767 	ld	l,-6 (ix)
   69E8 DD 66 FB      [19]  768 	ld	h,-5 (ix)
   69EB 5E            [ 7]  769 	ld	e,(hl)
   69EC 53            [ 4]  770 	ld	d,e
   69ED 15            [ 4]  771 	dec	d
   69EE 15            [ 4]  772 	dec	d
   69EF 0A            [ 7]  773 	ld	a,(bc)
   69F0 C5            [11]  774 	push	bc
   69F1 D5            [11]  775 	push	de
   69F2 33            [ 6]  776 	inc	sp
   69F3 F5            [11]  777 	push	af
   69F4 33            [ 6]  778 	inc	sp
   69F5 CD 32 67      [17]  779 	call	_getTilePtr
   69F8 F1            [10]  780 	pop	af
   69F9 C1            [10]  781 	pop	bc
   69FA 5E            [ 7]  782 	ld	e,(hl)
   69FB 3E 02         [ 7]  783 	ld	a,#0x02
   69FD 93            [ 4]  784 	sub	a, e
   69FE DA B4 6A      [10]  785 	jp	C,00115$
                            786 ;src/main.c:223: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   6A01 DD 6E FA      [19]  787 	ld	l,-6 (ix)
   6A04 DD 66 FB      [19]  788 	ld	h,-5 (ix)
   6A07 56            [ 7]  789 	ld	d,(hl)
   6A08 15            [ 4]  790 	dec	d
   6A09 15            [ 4]  791 	dec	d
   6A0A 0A            [ 7]  792 	ld	a,(bc)
   6A0B C6 02         [ 7]  793 	add	a, #0x02
   6A0D C5            [11]  794 	push	bc
   6A0E D5            [11]  795 	push	de
   6A0F 33            [ 6]  796 	inc	sp
   6A10 F5            [11]  797 	push	af
   6A11 33            [ 6]  798 	inc	sp
   6A12 CD 32 67      [17]  799 	call	_getTilePtr
   6A15 F1            [10]  800 	pop	af
   6A16 C1            [10]  801 	pop	bc
   6A17 5E            [ 7]  802 	ld	e,(hl)
   6A18 3E 02         [ 7]  803 	ld	a,#0x02
   6A1A 93            [ 4]  804 	sub	a, e
   6A1B DA B4 6A      [10]  805 	jp	C,00115$
                            806 ;src/main.c:224: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   6A1E DD 6E FA      [19]  807 	ld	l,-6 (ix)
   6A21 DD 66 FB      [19]  808 	ld	h,-5 (ix)
   6A24 56            [ 7]  809 	ld	d,(hl)
   6A25 15            [ 4]  810 	dec	d
   6A26 15            [ 4]  811 	dec	d
   6A27 0A            [ 7]  812 	ld	a,(bc)
   6A28 C6 04         [ 7]  813 	add	a, #0x04
   6A2A C5            [11]  814 	push	bc
   6A2B D5            [11]  815 	push	de
   6A2C 33            [ 6]  816 	inc	sp
   6A2D F5            [11]  817 	push	af
   6A2E 33            [ 6]  818 	inc	sp
   6A2F CD 32 67      [17]  819 	call	_getTilePtr
   6A32 F1            [10]  820 	pop	af
   6A33 C1            [10]  821 	pop	bc
   6A34 5E            [ 7]  822 	ld	e,(hl)
   6A35 3E 02         [ 7]  823 	ld	a,#0x02
   6A37 93            [ 4]  824 	sub	a, e
   6A38 38 7A         [12]  825 	jr	C,00115$
                            826 ;src/main.c:226: if((prota.x + G_HERO_W -4) < enemy->x || prota.x  > (enemy->x + G_ENEMY_W)){
   6A3A 21 64 66      [10]  827 	ld	hl, #_prota + 0
   6A3D 5E            [ 7]  828 	ld	e,(hl)
   6A3E 16 00         [ 7]  829 	ld	d,#0x00
   6A40 21 03 00      [10]  830 	ld	hl,#0x0003
   6A43 19            [11]  831 	add	hl,de
   6A44 DD 75 FC      [19]  832 	ld	-4 (ix),l
   6A47 DD 74 FD      [19]  833 	ld	-3 (ix),h
   6A4A 0A            [ 7]  834 	ld	a,(bc)
   6A4B 6F            [ 4]  835 	ld	l,a
   6A4C 26 00         [ 7]  836 	ld	h,#0x00
   6A4E DD 7E FC      [19]  837 	ld	a,-4 (ix)
   6A51 95            [ 4]  838 	sub	a, l
   6A52 DD 7E FD      [19]  839 	ld	a,-3 (ix)
   6A55 9C            [ 4]  840 	sbc	a, h
   6A56 E2 5B 6A      [10]  841 	jp	PO, 00196$
   6A59 EE 80         [ 7]  842 	xor	a, #0x80
   6A5B                     843 00196$:
   6A5B FA 6E 6A      [10]  844 	jp	M,00110$
   6A5E 23            [ 6]  845 	inc	hl
   6A5F 23            [ 6]  846 	inc	hl
   6A60 23            [ 6]  847 	inc	hl
   6A61 23            [ 6]  848 	inc	hl
   6A62 7D            [ 4]  849 	ld	a,l
   6A63 93            [ 4]  850 	sub	a, e
   6A64 7C            [ 4]  851 	ld	a,h
   6A65 9A            [ 4]  852 	sbc	a, d
   6A66 E2 6B 6A      [10]  853 	jp	PO, 00197$
   6A69 EE 80         [ 7]  854 	xor	a, #0x80
   6A6B                     855 00197$:
   6A6B F2 74 6A      [10]  856 	jp	P,00111$
   6A6E                     857 00110$:
                            858 ;src/main.c:228: colisiona = 0;
   6A6E DD 36 F9 00   [19]  859 	ld	-7 (ix),#0x00
   6A72 18 48         [12]  860 	jr	00119$
   6A74                     861 00111$:
                            862 ;src/main.c:231: if(enemy->y>prota.y){
   6A74 DD 6E FA      [19]  863 	ld	l,-6 (ix)
   6A77 DD 66 FB      [19]  864 	ld	h,-5 (ix)
   6A7A 5E            [ 7]  865 	ld	e,(hl)
   6A7B 21 65 66      [10]  866 	ld	hl, #(_prota + 0x0001) + 0
   6A7E 6E            [ 7]  867 	ld	l,(hl)
   6A7F 7D            [ 4]  868 	ld	a,l
   6A80 93            [ 4]  869 	sub	a, e
   6A81 30 2B         [12]  870 	jr	NC,00108$
                            871 ;src/main.c:232: if(enemy->y - (prota.y + G_HERO_H -2) >= 2){
   6A83 16 00         [ 7]  872 	ld	d,#0x00
   6A85 26 00         [ 7]  873 	ld	h,#0x00
   6A87 D5            [11]  874 	push	de
   6A88 11 14 00      [10]  875 	ld	de,#0x0014
   6A8B 19            [11]  876 	add	hl, de
   6A8C D1            [10]  877 	pop	de
   6A8D 7B            [ 4]  878 	ld	a,e
   6A8E 95            [ 4]  879 	sub	a, l
   6A8F 5F            [ 4]  880 	ld	e,a
   6A90 7A            [ 4]  881 	ld	a,d
   6A91 9C            [ 4]  882 	sbc	a, h
   6A92 57            [ 4]  883 	ld	d,a
   6A93 7B            [ 4]  884 	ld	a,e
   6A94 D6 02         [ 7]  885 	sub	a, #0x02
   6A96 7A            [ 4]  886 	ld	a,d
   6A97 17            [ 4]  887 	rla
   6A98 3F            [ 4]  888 	ccf
   6A99 1F            [ 4]  889 	rra
   6A9A DE 80         [ 7]  890 	sbc	a, #0x80
   6A9C 38 06         [12]  891 	jr	C,00105$
                            892 ;src/main.c:233: colisiona = 0;
   6A9E DD 36 F9 00   [19]  893 	ld	-7 (ix),#0x00
   6AA2 18 18         [12]  894 	jr	00119$
   6AA4                     895 00105$:
                            896 ;src/main.c:236: enemy->mira = M_abajo;
   6AA4 DD 6E FE      [19]  897 	ld	l,-2 (ix)
   6AA7 DD 66 FF      [19]  898 	ld	h,-1 (ix)
   6AAA 36 03         [10]  899 	ld	(hl),#0x03
   6AAC 18 0E         [12]  900 	jr	00119$
   6AAE                     901 00108$:
                            902 ;src/main.c:239: colisiona = 0;
   6AAE DD 36 F9 00   [19]  903 	ld	-7 (ix),#0x00
   6AB2 18 08         [12]  904 	jr	00119$
   6AB4                     905 00115$:
                            906 ;src/main.c:245: enemy->mira = M_abajo;
   6AB4 DD 6E FE      [19]  907 	ld	l,-2 (ix)
   6AB7 DD 66 FF      [19]  908 	ld	h,-1 (ix)
   6ABA 36 03         [10]  909 	ld	(hl),#0x03
                            910 ;src/main.c:248: case 3:
   6ABC                     911 00119$:
                            912 ;src/main.c:251: if( *getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   6ABC DD 6E FA      [19]  913 	ld	l,-6 (ix)
   6ABF DD 66 FB      [19]  914 	ld	h,-5 (ix)
   6AC2 7E            [ 7]  915 	ld	a,(hl)
   6AC3 C6 18         [ 7]  916 	add	a, #0x18
   6AC5 57            [ 4]  917 	ld	d,a
   6AC6 0A            [ 7]  918 	ld	a,(bc)
   6AC7 C5            [11]  919 	push	bc
   6AC8 D5            [11]  920 	push	de
   6AC9 33            [ 6]  921 	inc	sp
   6ACA F5            [11]  922 	push	af
   6ACB 33            [ 6]  923 	inc	sp
   6ACC CD 32 67      [17]  924 	call	_getTilePtr
   6ACF F1            [10]  925 	pop	af
   6AD0 C1            [10]  926 	pop	bc
   6AD1 5E            [ 7]  927 	ld	e,(hl)
   6AD2 3E 02         [ 7]  928 	ld	a,#0x02
   6AD4 93            [ 4]  929 	sub	a, e
   6AD5 DA 8E 6B      [10]  930 	jp	C,00131$
                            931 ;src/main.c:252: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   6AD8 DD 6E FA      [19]  932 	ld	l,-6 (ix)
   6ADB DD 66 FB      [19]  933 	ld	h,-5 (ix)
   6ADE 7E            [ 7]  934 	ld	a,(hl)
   6ADF C6 18         [ 7]  935 	add	a, #0x18
   6AE1 57            [ 4]  936 	ld	d,a
   6AE2 0A            [ 7]  937 	ld	a,(bc)
   6AE3 C6 02         [ 7]  938 	add	a, #0x02
   6AE5 C5            [11]  939 	push	bc
   6AE6 D5            [11]  940 	push	de
   6AE7 33            [ 6]  941 	inc	sp
   6AE8 F5            [11]  942 	push	af
   6AE9 33            [ 6]  943 	inc	sp
   6AEA CD 32 67      [17]  944 	call	_getTilePtr
   6AED F1            [10]  945 	pop	af
   6AEE C1            [10]  946 	pop	bc
   6AEF 5E            [ 7]  947 	ld	e,(hl)
   6AF0 3E 02         [ 7]  948 	ld	a,#0x02
   6AF2 93            [ 4]  949 	sub	a, e
   6AF3 DA 8E 6B      [10]  950 	jp	C,00131$
                            951 ;src/main.c:253: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   6AF6 DD 6E FA      [19]  952 	ld	l,-6 (ix)
   6AF9 DD 66 FB      [19]  953 	ld	h,-5 (ix)
   6AFC 7E            [ 7]  954 	ld	a,(hl)
   6AFD C6 18         [ 7]  955 	add	a, #0x18
   6AFF 57            [ 4]  956 	ld	d,a
   6B00 0A            [ 7]  957 	ld	a,(bc)
   6B01 C6 04         [ 7]  958 	add	a, #0x04
   6B03 C5            [11]  959 	push	bc
   6B04 D5            [11]  960 	push	de
   6B05 33            [ 6]  961 	inc	sp
   6B06 F5            [11]  962 	push	af
   6B07 33            [ 6]  963 	inc	sp
   6B08 CD 32 67      [17]  964 	call	_getTilePtr
   6B0B F1            [10]  965 	pop	af
   6B0C C1            [10]  966 	pop	bc
   6B0D 5E            [ 7]  967 	ld	e,(hl)
   6B0E 3E 02         [ 7]  968 	ld	a,#0x02
   6B10 93            [ 4]  969 	sub	a, e
   6B11 38 7B         [12]  970 	jr	C,00131$
                            971 ;src/main.c:255: if( (prota.x + G_HERO_W -4) < enemy->x || prota.x  > (enemy->x + G_ENEMY_W) ){
   6B13 21 64 66      [10]  972 	ld	hl, #_prota + 0
   6B16 5E            [ 7]  973 	ld	e,(hl)
   6B17 16 00         [ 7]  974 	ld	d,#0x00
   6B19 21 03 00      [10]  975 	ld	hl,#0x0003
   6B1C 19            [11]  976 	add	hl,de
   6B1D DD 75 FC      [19]  977 	ld	-4 (ix),l
   6B20 DD 74 FD      [19]  978 	ld	-3 (ix),h
   6B23 0A            [ 7]  979 	ld	a,(bc)
   6B24 4F            [ 4]  980 	ld	c,a
   6B25 06 00         [ 7]  981 	ld	b,#0x00
   6B27 DD 7E FC      [19]  982 	ld	a,-4 (ix)
   6B2A 91            [ 4]  983 	sub	a, c
   6B2B DD 7E FD      [19]  984 	ld	a,-3 (ix)
   6B2E 98            [ 4]  985 	sbc	a, b
   6B2F E2 34 6B      [10]  986 	jp	PO, 00198$
   6B32 EE 80         [ 7]  987 	xor	a, #0x80
   6B34                     988 00198$:
   6B34 FA 47 6B      [10]  989 	jp	M,00126$
   6B37 03            [ 6]  990 	inc	bc
   6B38 03            [ 6]  991 	inc	bc
   6B39 03            [ 6]  992 	inc	bc
   6B3A 03            [ 6]  993 	inc	bc
   6B3B 79            [ 4]  994 	ld	a,c
   6B3C 93            [ 4]  995 	sub	a, e
   6B3D 78            [ 4]  996 	ld	a,b
   6B3E 9A            [ 4]  997 	sbc	a, d
   6B3F E2 44 6B      [10]  998 	jp	PO, 00199$
   6B42 EE 80         [ 7]  999 	xor	a, #0x80
   6B44                    1000 00199$:
   6B44 F2 4D 6B      [10] 1001 	jp	P,00127$
   6B47                    1002 00126$:
                           1003 ;src/main.c:256: colisiona = 0;
   6B47 DD 36 F9 00   [19] 1004 	ld	-7 (ix),#0x00
   6B4B 18 49         [12] 1005 	jr	00135$
   6B4D                    1006 00127$:
                           1007 ;src/main.c:259: if(prota.y > enemy->y){ //si el prota esta abajo
   6B4D 21 65 66      [10] 1008 	ld	hl, #(_prota + 0x0001) + 0
   6B50 4E            [ 7] 1009 	ld	c,(hl)
   6B51 DD 6E FA      [19] 1010 	ld	l,-6 (ix)
   6B54 DD 66 FB      [19] 1011 	ld	h,-5 (ix)
   6B57 5E            [ 7] 1012 	ld	e,(hl)
   6B58 7B            [ 4] 1013 	ld	a,e
   6B59 91            [ 4] 1014 	sub	a, c
   6B5A 30 2C         [12] 1015 	jr	NC,00124$
                           1016 ;src/main.c:260: if( prota.y - (enemy->y + G_ENEMY_H) > 2){ // si hay espacio entre el enemigo y el prota
   6B5C 06 00         [ 7] 1017 	ld	b,#0x00
   6B5E 16 00         [ 7] 1018 	ld	d,#0x00
   6B60 21 16 00      [10] 1019 	ld	hl,#0x0016
   6B63 19            [11] 1020 	add	hl,de
   6B64 79            [ 4] 1021 	ld	a,c
   6B65 95            [ 4] 1022 	sub	a, l
   6B66 4F            [ 4] 1023 	ld	c,a
   6B67 78            [ 4] 1024 	ld	a,b
   6B68 9C            [ 4] 1025 	sbc	a, h
   6B69 47            [ 4] 1026 	ld	b,a
   6B6A 3E 02         [ 7] 1027 	ld	a,#0x02
   6B6C B9            [ 4] 1028 	cp	a, c
   6B6D 3E 00         [ 7] 1029 	ld	a,#0x00
   6B6F 98            [ 4] 1030 	sbc	a, b
   6B70 E2 75 6B      [10] 1031 	jp	PO, 00200$
   6B73 EE 80         [ 7] 1032 	xor	a, #0x80
   6B75                    1033 00200$:
   6B75 F2 7E 6B      [10] 1034 	jp	P,00121$
                           1035 ;src/main.c:261: colisiona = 0;
   6B78 DD 36 F9 00   [19] 1036 	ld	-7 (ix),#0x00
   6B7C 18 18         [12] 1037 	jr	00135$
   6B7E                    1038 00121$:
                           1039 ;src/main.c:264: enemy->mira = M_arriba;
   6B7E DD 6E FE      [19] 1040 	ld	l,-2 (ix)
   6B81 DD 66 FF      [19] 1041 	ld	h,-1 (ix)
   6B84 36 02         [10] 1042 	ld	(hl),#0x02
   6B86 18 0E         [12] 1043 	jr	00135$
   6B88                    1044 00124$:
                           1045 ;src/main.c:267: colisiona = 0;
   6B88 DD 36 F9 00   [19] 1046 	ld	-7 (ix),#0x00
   6B8C 18 08         [12] 1047 	jr	00135$
   6B8E                    1048 00131$:
                           1049 ;src/main.c:271: enemy->mira = M_arriba;
   6B8E DD 6E FE      [19] 1050 	ld	l,-2 (ix)
   6B91 DD 66 FF      [19] 1051 	ld	h,-1 (ix)
   6B94 36 02         [10] 1052 	ld	(hl),#0x02
                           1053 ;src/main.c:274: }
   6B96                    1054 00135$:
                           1055 ;src/main.c:275: return colisiona;
   6B96 DD 6E F9      [19] 1056 	ld	l,-7 (ix)
   6B99 DD F9         [10] 1057 	ld	sp, ix
   6B9B DD E1         [14] 1058 	pop	ix
   6B9D C9            [10] 1059 	ret
                           1060 ;src/main.c:278: void moverEnemigoArriba(TEnemy *enemy){
                           1061 ;	---------------------------------
                           1062 ; Function moverEnemigoArriba
                           1063 ; ---------------------------------
   6B9E                    1064 _moverEnemigoArriba::
   6B9E DD E5         [15] 1065 	push	ix
   6BA0 DD 21 00 00   [14] 1066 	ld	ix,#0
   6BA4 DD 39         [15] 1067 	add	ix,sp
                           1068 ;src/main.c:279: enemy->y--;
   6BA6 DD 4E 04      [19] 1069 	ld	c,4 (ix)
   6BA9 DD 46 05      [19] 1070 	ld	b,5 (ix)
   6BAC 69            [ 4] 1071 	ld	l, c
   6BAD 60            [ 4] 1072 	ld	h, b
   6BAE 23            [ 6] 1073 	inc	hl
   6BAF 5E            [ 7] 1074 	ld	e,(hl)
   6BB0 1D            [ 4] 1075 	dec	e
   6BB1 73            [ 7] 1076 	ld	(hl),e
                           1077 ;src/main.c:280: enemy->y--;
   6BB2 1D            [ 4] 1078 	dec	e
   6BB3 73            [ 7] 1079 	ld	(hl),e
                           1080 ;src/main.c:281: enemy->mover = SI;
   6BB4 21 06 00      [10] 1081 	ld	hl,#0x0006
   6BB7 09            [11] 1082 	add	hl,bc
   6BB8 36 01         [10] 1083 	ld	(hl),#0x01
   6BBA DD E1         [14] 1084 	pop	ix
   6BBC C9            [10] 1085 	ret
                           1086 ;src/main.c:284: void moverEnemigoAbajo(TEnemy *enemy){
                           1087 ;	---------------------------------
                           1088 ; Function moverEnemigoAbajo
                           1089 ; ---------------------------------
   6BBD                    1090 _moverEnemigoAbajo::
   6BBD DD E5         [15] 1091 	push	ix
   6BBF DD 21 00 00   [14] 1092 	ld	ix,#0
   6BC3 DD 39         [15] 1093 	add	ix,sp
                           1094 ;src/main.c:285: enemy->y++;
   6BC5 DD 4E 04      [19] 1095 	ld	c,4 (ix)
   6BC8 DD 46 05      [19] 1096 	ld	b,5 (ix)
   6BCB 59            [ 4] 1097 	ld	e, c
   6BCC 50            [ 4] 1098 	ld	d, b
   6BCD 13            [ 6] 1099 	inc	de
   6BCE 1A            [ 7] 1100 	ld	a,(de)
   6BCF 3C            [ 4] 1101 	inc	a
   6BD0 12            [ 7] 1102 	ld	(de),a
                           1103 ;src/main.c:286: enemy->y++;
   6BD1 3C            [ 4] 1104 	inc	a
   6BD2 12            [ 7] 1105 	ld	(de),a
                           1106 ;src/main.c:287: enemy->mover = SI;
   6BD3 21 06 00      [10] 1107 	ld	hl,#0x0006
   6BD6 09            [11] 1108 	add	hl,bc
   6BD7 36 01         [10] 1109 	ld	(hl),#0x01
   6BD9 DD E1         [14] 1110 	pop	ix
   6BDB C9            [10] 1111 	ret
                           1112 ;src/main.c:290: void moverEnemigo(TEnemy *enemy){
                           1113 ;	---------------------------------
                           1114 ; Function moverEnemigo
                           1115 ; ---------------------------------
   6BDC                    1116 _moverEnemigo::
   6BDC DD E5         [15] 1117 	push	ix
   6BDE DD 21 00 00   [14] 1118 	ld	ix,#0
   6BE2 DD 39         [15] 1119 	add	ix,sp
                           1120 ;src/main.c:291: if(!enemy->muerto){
   6BE4 DD 4E 04      [19] 1121 	ld	c,4 (ix)
   6BE7 DD 46 05      [19] 1122 	ld	b,5 (ix)
   6BEA C5            [11] 1123 	push	bc
   6BEB FD E1         [14] 1124 	pop	iy
   6BED FD 7E 08      [19] 1125 	ld	a,8 (iy)
   6BF0 B7            [ 4] 1126 	or	a, a
   6BF1 20 3C         [12] 1127 	jr	NZ,00110$
                           1128 ;src/main.c:292: if(!checkEnemyCollision(enemy->mira, enemy)){
   6BF3 21 07 00      [10] 1129 	ld	hl,#0x0007
   6BF6 09            [11] 1130 	add	hl,bc
   6BF7 5E            [ 7] 1131 	ld	e,(hl)
   6BF8 16 00         [ 7] 1132 	ld	d,#0x00
   6BFA E5            [11] 1133 	push	hl
   6BFB C5            [11] 1134 	push	bc
   6BFC C5            [11] 1135 	push	bc
   6BFD D5            [11] 1136 	push	de
   6BFE CD 83 69      [17] 1137 	call	_checkEnemyCollision
   6C01 F1            [10] 1138 	pop	af
   6C02 F1            [10] 1139 	pop	af
   6C03 7D            [ 4] 1140 	ld	a,l
   6C04 C1            [10] 1141 	pop	bc
   6C05 E1            [10] 1142 	pop	hl
   6C06 B7            [ 4] 1143 	or	a, a
   6C07 20 26         [12] 1144 	jr	NZ,00110$
                           1145 ;src/main.c:294: switch (enemy->mira) {
   6C09 5E            [ 7] 1146 	ld	e,(hl)
   6C0A 3E 03         [ 7] 1147 	ld	a,#0x03
   6C0C 93            [ 4] 1148 	sub	a, e
   6C0D 38 20         [12] 1149 	jr	C,00110$
   6C0F 16 00         [ 7] 1150 	ld	d,#0x00
   6C11 21 17 6C      [10] 1151 	ld	hl,#00124$
   6C14 19            [11] 1152 	add	hl,de
   6C15 19            [11] 1153 	add	hl,de
                           1154 ;src/main.c:295: case 0:
                           1155 ;src/main.c:297: break;
                           1156 ;src/main.c:298: case 1:
                           1157 ;src/main.c:300: break;
                           1158 ;src/main.c:301: case 2:
   6C16 E9            [ 4] 1159 	jp	(hl)
   6C17                    1160 00124$:
   6C17 18 16         [12] 1161 	jr	00110$
   6C19 18 14         [12] 1162 	jr	00110$
   6C1B 18 06         [12] 1163 	jr	00103$
   6C1D 18 0B         [12] 1164 	jr	00104$
   6C1F 18 0E         [12] 1165 	jr	00110$
   6C21 18 0C         [12] 1166 	jr	00110$
   6C23                    1167 00103$:
                           1168 ;src/main.c:302: moverEnemigoArriba(enemy);
   6C23 C5            [11] 1169 	push	bc
   6C24 CD 9E 6B      [17] 1170 	call	_moverEnemigoArriba
   6C27 F1            [10] 1171 	pop	af
                           1172 ;src/main.c:303: break;
   6C28 18 05         [12] 1173 	jr	00110$
                           1174 ;src/main.c:304: case 3:
   6C2A                    1175 00104$:
                           1176 ;src/main.c:305: moverEnemigoAbajo(enemy);
   6C2A C5            [11] 1177 	push	bc
   6C2B CD BD 6B      [17] 1178 	call	_moverEnemigoAbajo
   6C2E F1            [10] 1179 	pop	af
                           1180 ;src/main.c:307: }
   6C2F                    1181 00110$:
   6C2F DD E1         [14] 1182 	pop	ix
   6C31 C9            [10] 1183 	ret
                           1184 ;src/main.c:312: void patrolDecision(TEnemy *enemy) { // o devuelve direccion o le pasamos un enemigo y lo mueve
                           1185 ;	---------------------------------
                           1186 ; Function patrolDecision
                           1187 ; ---------------------------------
   6C32                    1188 _patrolDecision::
                           1189 ;src/main.c:313: u8 decision = cpct_getRandom_mxor_u8() % 4;
   6C32 CD B9 64      [17] 1190 	call	_cpct_getRandom_mxor_u8
   6C35 7D            [ 4] 1191 	ld	a,l
   6C36 E6 03         [ 7] 1192 	and	a, #0x03
   6C38 5F            [ 4] 1193 	ld	e,a
                           1194 ;src/main.c:315: switch (decision) {
   6C39 3E 03         [ 7] 1195 	ld	a,#0x03
   6C3B 93            [ 4] 1196 	sub	a, e
   6C3C D8            [11] 1197 	ret	C
   6C3D 16 00         [ 7] 1198 	ld	d,#0x00
   6C3F 21 45 6C      [10] 1199 	ld	hl,#00112$
   6C42 19            [11] 1200 	add	hl,de
   6C43 19            [11] 1201 	add	hl,de
                           1202 ;src/main.c:316: case 0:
   6C44 E9            [ 4] 1203 	jp	(hl)
   6C45                    1204 00112$:
   6C45 18 06         [12] 1205 	jr	00101$
   6C47 18 0D         [12] 1206 	jr	00106$
   6C49 18 0B         [12] 1207 	jr	00106$
   6C4B 18 09         [12] 1208 	jr	00104$
   6C4D                    1209 00101$:
                           1210 ;src/main.c:317: moverEnemigoAbajo(enemy);
   6C4D C1            [10] 1211 	pop	bc
   6C4E E1            [10] 1212 	pop	hl
   6C4F E5            [11] 1213 	push	hl
   6C50 C5            [11] 1214 	push	bc
   6C51 E5            [11] 1215 	push	hl
   6C52 CD BD 6B      [17] 1216 	call	_moverEnemigoAbajo
   6C55 F1            [10] 1217 	pop	af
                           1218 ;src/main.c:318: break;
                           1219 ;src/main.c:319: case 1:
                           1220 ;src/main.c:320: break;
                           1221 ;src/main.c:321: case 2:
                           1222 ;src/main.c:322: break;
                           1223 ;src/main.c:323: case 3:
                           1224 ;src/main.c:325: }
   6C56                    1225 00104$:
   6C56                    1226 00106$:
   6C56 C9            [10] 1227 	ret
                           1228 ;src/main.c:328: void avanzarMapa() {
                           1229 ;	---------------------------------
                           1230 ; Function avanzarMapa
                           1231 ; ---------------------------------
   6C57                    1232 _avanzarMapa::
                           1233 ;src/main.c:329: if(num_mapa < NUM_MAPAS -1) {
   6C57 3A 78 66      [13] 1234 	ld	a,(#_num_mapa + 0)
   6C5A D6 02         [ 7] 1235 	sub	a, #0x02
   6C5C D2 62 72      [10] 1236 	jp	NC,_menuFin
                           1237 ;src/main.c:330: mapa = mapas[++num_mapa];
   6C5F 21 78 66      [10] 1238 	ld	hl, #_num_mapa+0
   6C62 34            [11] 1239 	inc	(hl)
   6C63 FD 21 78 66   [14] 1240 	ld	iy,#_num_mapa
   6C67 FD 6E 00      [19] 1241 	ld	l,0 (iy)
   6C6A 26 00         [ 7] 1242 	ld	h,#0x00
   6C6C 29            [11] 1243 	add	hl, hl
   6C6D 11 8F 66      [10] 1244 	ld	de,#_mapas
   6C70 19            [11] 1245 	add	hl,de
   6C71 7E            [ 7] 1246 	ld	a,(hl)
   6C72 FD 21 76 66   [14] 1247 	ld	iy,#_mapa
   6C76 FD 77 00      [19] 1248 	ld	0 (iy),a
   6C79 23            [ 6] 1249 	inc	hl
   6C7A 7E            [ 7] 1250 	ld	a,(hl)
   6C7B 32 77 66      [13] 1251 	ld	(#_mapa + 1),a
                           1252 ;src/main.c:331: prota.x = prota.px = 2;
   6C7E 21 66 66      [10] 1253 	ld	hl,#(_prota + 0x0002)
   6C81 36 02         [10] 1254 	ld	(hl),#0x02
   6C83 21 64 66      [10] 1255 	ld	hl,#_prota
   6C86 36 02         [10] 1256 	ld	(hl),#0x02
                           1257 ;src/main.c:332: prota.mover = SI;
   6C88 21 6A 66      [10] 1258 	ld	hl,#(_prota + 0x0006)
                           1259 ;src/main.c:333: dibujarMapa();
                           1260 ;src/main.c:337: menuFin();
   6C8B 36 01         [10] 1261 	ld	(hl), #0x01
   6C8D C3 79 66      [10] 1262 	jp	_dibujarMapa
                           1263 ;src/main.c:341: void moverIzquierda() {
                           1264 ;	---------------------------------
                           1265 ; Function moverIzquierda
                           1266 ; ---------------------------------
   6C90                    1267 _moverIzquierda::
                           1268 ;src/main.c:342: prota.mira = M_izquierda;
   6C90 01 64 66      [10] 1269 	ld	bc,#_prota+0
   6C93 21 6B 66      [10] 1270 	ld	hl,#(_prota + 0x0007)
   6C96 36 01         [10] 1271 	ld	(hl),#0x01
                           1272 ;src/main.c:343: if (!checkCollision(M_izquierda)) {
   6C98 C5            [11] 1273 	push	bc
   6C99 21 01 00      [10] 1274 	ld	hl,#0x0001
   6C9C E5            [11] 1275 	push	hl
   6C9D CD 5A 67      [17] 1276 	call	_checkCollision
   6CA0 F1            [10] 1277 	pop	af
   6CA1 C1            [10] 1278 	pop	bc
   6CA2 7D            [ 4] 1279 	ld	a,l
   6CA3 B7            [ 4] 1280 	or	a, a
   6CA4 C0            [11] 1281 	ret	NZ
                           1282 ;src/main.c:344: prota.x--;
   6CA5 0A            [ 7] 1283 	ld	a,(bc)
   6CA6 C6 FF         [ 7] 1284 	add	a,#0xFF
   6CA8 02            [ 7] 1285 	ld	(bc),a
                           1286 ;src/main.c:345: prota.mover = SI;
   6CA9 21 6A 66      [10] 1287 	ld	hl,#(_prota + 0x0006)
   6CAC 36 01         [10] 1288 	ld	(hl),#0x01
                           1289 ;src/main.c:346: prota.sprite = g_hero_left;
   6CAE 21 46 57      [10] 1290 	ld	hl,#_g_hero_left
   6CB1 22 68 66      [16] 1291 	ld	((_prota + 0x0004)), hl
   6CB4 C9            [10] 1292 	ret
                           1293 ;src/main.c:350: void moverDerecha() {
                           1294 ;	---------------------------------
                           1295 ; Function moverDerecha
                           1296 ; ---------------------------------
   6CB5                    1297 _moverDerecha::
                           1298 ;src/main.c:351: prota.mira = M_derecha;
   6CB5 21 6B 66      [10] 1299 	ld	hl,#(_prota + 0x0007)
   6CB8 36 00         [10] 1300 	ld	(hl),#0x00
                           1301 ;src/main.c:352: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   6CBA 21 00 00      [10] 1302 	ld	hl,#0x0000
   6CBD E5            [11] 1303 	push	hl
   6CBE CD 5A 67      [17] 1304 	call	_checkCollision
   6CC1 F1            [10] 1305 	pop	af
   6CC2 45            [ 4] 1306 	ld	b,l
   6CC3 21 64 66      [10] 1307 	ld	hl, #_prota + 0
   6CC6 4E            [ 7] 1308 	ld	c,(hl)
   6CC7 59            [ 4] 1309 	ld	e,c
   6CC8 16 00         [ 7] 1310 	ld	d,#0x00
   6CCA 21 07 00      [10] 1311 	ld	hl,#0x0007
   6CCD 19            [11] 1312 	add	hl,de
   6CCE 11 50 80      [10] 1313 	ld	de, #0x8050
   6CD1 29            [11] 1314 	add	hl, hl
   6CD2 3F            [ 4] 1315 	ccf
   6CD3 CB 1C         [ 8] 1316 	rr	h
   6CD5 CB 1D         [ 8] 1317 	rr	l
   6CD7 ED 52         [15] 1318 	sbc	hl, de
   6CD9 3E 00         [ 7] 1319 	ld	a,#0x00
   6CDB 17            [ 4] 1320 	rla
   6CDC 5F            [ 4] 1321 	ld	e,a
   6CDD 78            [ 4] 1322 	ld	a,b
   6CDE B7            [ 4] 1323 	or	a,a
   6CDF 20 14         [12] 1324 	jr	NZ,00104$
   6CE1 B3            [ 4] 1325 	or	a,e
   6CE2 28 11         [12] 1326 	jr	Z,00104$
                           1327 ;src/main.c:353: prota.x++;
   6CE4 0C            [ 4] 1328 	inc	c
   6CE5 21 64 66      [10] 1329 	ld	hl,#_prota
   6CE8 71            [ 7] 1330 	ld	(hl),c
                           1331 ;src/main.c:354: prota.mover = SI;
   6CE9 21 6A 66      [10] 1332 	ld	hl,#(_prota + 0x0006)
   6CEC 36 01         [10] 1333 	ld	(hl),#0x01
                           1334 ;src/main.c:355: prota.sprite = g_hero;
   6CEE 21 F0 57      [10] 1335 	ld	hl,#_g_hero
   6CF1 22 68 66      [16] 1336 	ld	((_prota + 0x0004)), hl
   6CF4 C9            [10] 1337 	ret
   6CF5                    1338 00104$:
                           1339 ;src/main.c:357: }else if( prota.x + G_HERO_W >= 80){
   6CF5 7B            [ 4] 1340 	ld	a,e
   6CF6 B7            [ 4] 1341 	or	a, a
   6CF7 C0            [11] 1342 	ret	NZ
                           1343 ;src/main.c:358: avanzarMapa();
   6CF8 C3 57 6C      [10] 1344 	jp  _avanzarMapa
                           1345 ;src/main.c:362: void moverArriba() {
                           1346 ;	---------------------------------
                           1347 ; Function moverArriba
                           1348 ; ---------------------------------
   6CFB                    1349 _moverArriba::
                           1350 ;src/main.c:363: prota.mira = M_arriba;
   6CFB 21 6B 66      [10] 1351 	ld	hl,#(_prota + 0x0007)
   6CFE 36 02         [10] 1352 	ld	(hl),#0x02
                           1353 ;src/main.c:364: if (!checkCollision(M_arriba) && (prota.y >= 0)) { // TODO: COMPROBAR
   6D00 21 02 00      [10] 1354 	ld	hl,#0x0002
   6D03 E5            [11] 1355 	push	hl
   6D04 CD 5A 67      [17] 1356 	call	_checkCollision
   6D07 F1            [10] 1357 	pop	af
   6D08 7D            [ 4] 1358 	ld	a,l
   6D09 B7            [ 4] 1359 	or	a, a
   6D0A C0            [11] 1360 	ret	NZ
                           1361 ;src/main.c:365: prota.y--;
   6D0B 21 65 66      [10] 1362 	ld	hl,#_prota + 1
   6D0E 4E            [ 7] 1363 	ld	c,(hl)
   6D0F 0D            [ 4] 1364 	dec	c
   6D10 71            [ 7] 1365 	ld	(hl),c
                           1366 ;src/main.c:366: prota.y--;
   6D11 0D            [ 4] 1367 	dec	c
   6D12 71            [ 7] 1368 	ld	(hl),c
                           1369 ;src/main.c:367: prota.mover  = SI;
   6D13 21 6A 66      [10] 1370 	ld	hl,#(_prota + 0x0006)
   6D16 36 01         [10] 1371 	ld	(hl),#0x01
                           1372 ;src/main.c:368: prota.sprite = g_hero_up;
   6D18 21 AC 56      [10] 1373 	ld	hl,#_g_hero_up
   6D1B 22 68 66      [16] 1374 	ld	((_prota + 0x0004)), hl
   6D1E C9            [10] 1375 	ret
                           1376 ;src/main.c:372: void moverAbajo() {
                           1377 ;	---------------------------------
                           1378 ; Function moverAbajo
                           1379 ; ---------------------------------
   6D1F                    1380 _moverAbajo::
                           1381 ;src/main.c:373: prota.mira = M_abajo;
   6D1F 21 6B 66      [10] 1382 	ld	hl,#(_prota + 0x0007)
   6D22 36 03         [10] 1383 	ld	(hl),#0x03
                           1384 ;src/main.c:374: if (!checkCollision(M_abajo) && (prota.y + G_HERO_H < ALTO_MAPA)) { // TODO: COMPROBAR
   6D24 21 03 00      [10] 1385 	ld	hl,#0x0003
   6D27 E5            [11] 1386 	push	hl
   6D28 CD 5A 67      [17] 1387 	call	_checkCollision
   6D2B F1            [10] 1388 	pop	af
   6D2C 7D            [ 4] 1389 	ld	a,l
   6D2D B7            [ 4] 1390 	or	a, a
   6D2E C0            [11] 1391 	ret	NZ
   6D2F 01 65 66      [10] 1392 	ld	bc,#_prota + 1
   6D32 0A            [ 7] 1393 	ld	a,(bc)
   6D33 5F            [ 4] 1394 	ld	e,a
   6D34 6B            [ 4] 1395 	ld	l,e
   6D35 26 00         [ 7] 1396 	ld	h,#0x00
   6D37 D5            [11] 1397 	push	de
   6D38 11 16 00      [10] 1398 	ld	de,#0x0016
   6D3B 19            [11] 1399 	add	hl, de
   6D3C D1            [10] 1400 	pop	de
   6D3D 7D            [ 4] 1401 	ld	a,l
   6D3E D6 B0         [ 7] 1402 	sub	a, #0xB0
   6D40 7C            [ 4] 1403 	ld	a,h
   6D41 17            [ 4] 1404 	rla
   6D42 3F            [ 4] 1405 	ccf
   6D43 1F            [ 4] 1406 	rra
   6D44 DE 80         [ 7] 1407 	sbc	a, #0x80
   6D46 D0            [11] 1408 	ret	NC
                           1409 ;src/main.c:375: prota.y++;
   6D47 7B            [ 4] 1410 	ld	a,e
   6D48 3C            [ 4] 1411 	inc	a
   6D49 02            [ 7] 1412 	ld	(bc),a
                           1413 ;src/main.c:376: prota.y++;
   6D4A 3C            [ 4] 1414 	inc	a
   6D4B 02            [ 7] 1415 	ld	(bc),a
                           1416 ;src/main.c:377: prota.mover  = SI;
   6D4C 21 6A 66      [10] 1417 	ld	hl,#(_prota + 0x0006)
   6D4F 36 01         [10] 1418 	ld	(hl),#0x01
                           1419 ;src/main.c:378: prota.sprite = g_hero_down;
   6D51 21 12 56      [10] 1420 	ld	hl,#_g_hero_down
   6D54 22 68 66      [16] 1421 	ld	((_prota + 0x0004)), hl
   6D57 C9            [10] 1422 	ret
                           1423 ;src/main.c:382: void dibujarCuchillo() {
                           1424 ;	---------------------------------
                           1425 ; Function dibujarCuchillo
                           1426 ; ---------------------------------
   6D58                    1427 _dibujarCuchillo::
   6D58 DD E5         [15] 1428 	push	ix
   6D5A DD 21 00 00   [14] 1429 	ld	ix,#0
   6D5E DD 39         [15] 1430 	add	ix,sp
   6D60 F5            [11] 1431 	push	af
                           1432 ;src/main.c:383: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   6D61 21 6D 66      [10] 1433 	ld	hl, #_cu + 1
   6D64 56            [ 7] 1434 	ld	d,(hl)
   6D65 21 6C 66      [10] 1435 	ld	hl, #_cu + 0
   6D68 46            [ 7] 1436 	ld	b,(hl)
   6D69 D5            [11] 1437 	push	de
   6D6A 33            [ 6] 1438 	inc	sp
   6D6B C5            [11] 1439 	push	bc
   6D6C 33            [ 6] 1440 	inc	sp
   6D6D 21 00 C0      [10] 1441 	ld	hl,#0xC000
   6D70 E5            [11] 1442 	push	hl
   6D71 CD B8 65      [17] 1443 	call	_cpct_getScreenPtr
   6D74 45            [ 4] 1444 	ld	b,l
   6D75 5C            [ 4] 1445 	ld	e,h
                           1446 ;src/main.c:384: if(cu.eje == E_X){
   6D76 21 74 66      [10] 1447 	ld	hl, #_cu + 8
   6D79 4E            [ 7] 1448 	ld	c,(hl)
                           1449 ;src/main.c:385: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   6D7A DD 70 FE      [19] 1450 	ld	-2 (ix),b
   6D7D DD 73 FF      [19] 1451 	ld	-1 (ix),e
                           1452 ;src/main.c:384: if(cu.eje == E_X){
   6D80 79            [ 4] 1453 	ld	a,c
   6D81 B7            [ 4] 1454 	or	a, a
   6D82 20 19         [12] 1455 	jr	NZ,00104$
                           1456 ;src/main.c:385: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   6D84 11 00 3E      [10] 1457 	ld	de,#_g_tablatrans+0
   6D87 ED 4B 70 66   [20] 1458 	ld	bc, (#(_cu + 0x0004) + 0)
   6D8B D5            [11] 1459 	push	de
   6D8C 21 04 04      [10] 1460 	ld	hl,#0x0404
   6D8F E5            [11] 1461 	push	hl
   6D90 DD 6E FE      [19] 1462 	ld	l,-2 (ix)
   6D93 DD 66 FF      [19] 1463 	ld	h,-1 (ix)
   6D96 E5            [11] 1464 	push	hl
   6D97 C5            [11] 1465 	push	bc
   6D98 CD D8 65      [17] 1466 	call	_cpct_drawSpriteMaskedAlignedTable
   6D9B 18 1A         [12] 1467 	jr	00106$
   6D9D                    1468 00104$:
                           1469 ;src/main.c:388: else if(cu.eje == E_Y){
   6D9D 0D            [ 4] 1470 	dec	c
   6D9E 20 17         [12] 1471 	jr	NZ,00106$
                           1472 ;src/main.c:389: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   6DA0 11 00 3E      [10] 1473 	ld	de,#_g_tablatrans+0
   6DA3 ED 4B 70 66   [20] 1474 	ld	bc, (#(_cu + 0x0004) + 0)
   6DA7 D5            [11] 1475 	push	de
   6DA8 21 02 08      [10] 1476 	ld	hl,#0x0802
   6DAB E5            [11] 1477 	push	hl
   6DAC DD 6E FE      [19] 1478 	ld	l,-2 (ix)
   6DAF DD 66 FF      [19] 1479 	ld	h,-1 (ix)
   6DB2 E5            [11] 1480 	push	hl
   6DB3 C5            [11] 1481 	push	bc
   6DB4 CD D8 65      [17] 1482 	call	_cpct_drawSpriteMaskedAlignedTable
   6DB7                    1483 00106$:
   6DB7 DD F9         [10] 1484 	ld	sp, ix
   6DB9 DD E1         [14] 1485 	pop	ix
   6DBB C9            [10] 1486 	ret
                           1487 ;src/main.c:393: void borrarCuchillo() {
                           1488 ;	---------------------------------
                           1489 ; Function borrarCuchillo
                           1490 ; ---------------------------------
   6DBC                    1491 _borrarCuchillo::
   6DBC DD E5         [15] 1492 	push	ix
   6DBE DD 21 00 00   [14] 1493 	ld	ix,#0
   6DC2 DD 39         [15] 1494 	add	ix,sp
   6DC4 3B            [ 6] 1495 	dec	sp
                           1496 ;src/main.c:395: u8 w = 2 + (cu.px & 1);
   6DC5 21 6E 66      [10] 1497 	ld	hl, #_cu + 2
   6DC8 4E            [ 7] 1498 	ld	c,(hl)
   6DC9 79            [ 4] 1499 	ld	a,c
   6DCA E6 01         [ 7] 1500 	and	a, #0x01
   6DCC 47            [ 4] 1501 	ld	b,a
   6DCD 04            [ 4] 1502 	inc	b
   6DCE 04            [ 4] 1503 	inc	b
                           1504 ;src/main.c:396: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   6DCF 21 6F 66      [10] 1505 	ld	hl, #_cu + 3
   6DD2 5E            [ 7] 1506 	ld	e,(hl)
   6DD3 7B            [ 4] 1507 	ld	a,e
   6DD4 E6 03         [ 7] 1508 	and	a, #0x03
   6DD6 28 04         [12] 1509 	jr	Z,00105$
   6DD8 3E 01         [ 7] 1510 	ld	a,#0x01
   6DDA 18 02         [12] 1511 	jr	00106$
   6DDC                    1512 00105$:
   6DDC 3E 00         [ 7] 1513 	ld	a,#0x00
   6DDE                    1514 00106$:
   6DDE C6 02         [ 7] 1515 	add	a, #0x02
   6DE0 DD 77 FF      [19] 1516 	ld	-1 (ix),a
                           1517 ;src/main.c:397: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   6DE3 FD 2A 76 66   [20] 1518 	ld	iy,(_mapa)
   6DE7 16 00         [ 7] 1519 	ld	d,#0x00
   6DE9 63            [ 4] 1520 	ld	h,e
   6DEA 6A            [ 4] 1521 	ld	l,d
   6DEB CB 7A         [ 8] 1522 	bit	7, d
   6DED 28 05         [12] 1523 	jr	Z,00107$
   6DEF 13            [ 6] 1524 	inc	de
   6DF0 13            [ 6] 1525 	inc	de
   6DF1 13            [ 6] 1526 	inc	de
   6DF2 63            [ 4] 1527 	ld	h,e
   6DF3 6A            [ 4] 1528 	ld	l,d
   6DF4                    1529 00107$:
   6DF4 5C            [ 4] 1530 	ld	e, h
   6DF5 55            [ 4] 1531 	ld	d, l
   6DF6 CB 2A         [ 8] 1532 	sra	d
   6DF8 CB 1B         [ 8] 1533 	rr	e
   6DFA CB 2A         [ 8] 1534 	sra	d
   6DFC CB 1B         [ 8] 1535 	rr	e
   6DFE 51            [ 4] 1536 	ld	d,c
   6DFF CB 3A         [ 8] 1537 	srl	d
   6E01 FD E5         [15] 1538 	push	iy
   6E03 21 00 C0      [10] 1539 	ld	hl,#0xC000
   6E06 E5            [11] 1540 	push	hl
   6E07 3E 28         [ 7] 1541 	ld	a,#0x28
   6E09 F5            [11] 1542 	push	af
   6E0A 33            [ 6] 1543 	inc	sp
   6E0B DD 7E FF      [19] 1544 	ld	a,-1 (ix)
   6E0E F5            [11] 1545 	push	af
   6E0F 33            [ 6] 1546 	inc	sp
   6E10 C5            [11] 1547 	push	bc
   6E11 33            [ 6] 1548 	inc	sp
   6E12 7B            [ 4] 1549 	ld	a,e
   6E13 F5            [11] 1550 	push	af
   6E14 33            [ 6] 1551 	inc	sp
   6E15 D5            [11] 1552 	push	de
   6E16 33            [ 6] 1553 	inc	sp
   6E17 CD 8C 5A      [17] 1554 	call	_cpct_etm_drawTileBox2x4
                           1555 ;src/main.c:398: if(!cu.mover){
   6E1A 3A 75 66      [13] 1556 	ld	a, (#_cu + 9)
   6E1D B7            [ 4] 1557 	or	a, a
   6E1E 20 05         [12] 1558 	jr	NZ,00103$
                           1559 ;src/main.c:399: cu.lanzado = NO;
   6E20 21 72 66      [10] 1560 	ld	hl,#(_cu + 0x0006)
   6E23 36 00         [10] 1561 	ld	(hl),#0x00
   6E25                    1562 00103$:
   6E25 33            [ 6] 1563 	inc	sp
   6E26 DD E1         [14] 1564 	pop	ix
   6E28 C9            [10] 1565 	ret
                           1566 ;src/main.c:403: void redibujarCuchillo( ) {
                           1567 ;	---------------------------------
                           1568 ; Function redibujarCuchillo
                           1569 ; ---------------------------------
   6E29                    1570 _redibujarCuchillo::
                           1571 ;src/main.c:404: borrarCuchillo();
   6E29 CD BC 6D      [17] 1572 	call	_borrarCuchillo
                           1573 ;src/main.c:405: cu.px = cu.x;
   6E2C 01 6E 66      [10] 1574 	ld	bc,#_cu + 2
   6E2F 3A 6C 66      [13] 1575 	ld	a, (#_cu + 0)
   6E32 02            [ 7] 1576 	ld	(bc),a
                           1577 ;src/main.c:406: cu.py = cu.y;
   6E33 01 6F 66      [10] 1578 	ld	bc,#_cu + 3
   6E36 3A 6D 66      [13] 1579 	ld	a, (#_cu + 1)
   6E39 02            [ 7] 1580 	ld	(bc),a
                           1581 ;src/main.c:407: dibujarCuchillo();
   6E3A C3 58 6D      [10] 1582 	jp  _dibujarCuchillo
                           1583 ;src/main.c:411: void lanzarCuchillo(){
                           1584 ;	---------------------------------
                           1585 ; Function lanzarCuchillo
                           1586 ; ---------------------------------
   6E3D                    1587 _lanzarCuchillo::
                           1588 ;src/main.c:413: if(!cu.lanzado){
   6E3D 3A 72 66      [13] 1589 	ld	a, (#(_cu + 0x0006) + 0)
   6E40 B7            [ 4] 1590 	or	a, a
   6E41 C0            [11] 1591 	ret	NZ
                           1592 ;src/main.c:415: if(prota.mira == M_derecha){
   6E42 21 6B 66      [10] 1593 	ld	hl, #_prota + 7
   6E45 5E            [ 7] 1594 	ld	e,(hl)
                           1595 ;src/main.c:416: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   6E46 01 65 66      [10] 1596 	ld	bc,#_prota + 1
                           1597 ;src/main.c:418: cu.direccion = M_derecha;
                           1598 ;src/main.c:420: cu.y=prota.y + G_HERO_H /2;
                           1599 ;src/main.c:421: cu.sprite=g_knifeX_0;
                           1600 ;src/main.c:422: cu.eje = E_X;
                           1601 ;src/main.c:415: if(prota.mira == M_derecha){
   6E49 7B            [ 4] 1602 	ld	a,e
   6E4A B7            [ 4] 1603 	or	a, a
   6E4B 20 41         [12] 1604 	jr	NZ,00118$
                           1605 ;src/main.c:416: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   6E4D 0A            [ 7] 1606 	ld	a,(bc)
   6E4E C6 0B         [ 7] 1607 	add	a, #0x0B
   6E50 5F            [ 4] 1608 	ld	e,a
   6E51 3A 64 66      [13] 1609 	ld	a, (#_prota + 0)
   6E54 C6 0C         [ 7] 1610 	add	a, #0x0C
   6E56 6F            [ 4] 1611 	ld	l,a
   6E57 C5            [11] 1612 	push	bc
   6E58 7B            [ 4] 1613 	ld	a,e
   6E59 F5            [11] 1614 	push	af
   6E5A 33            [ 6] 1615 	inc	sp
   6E5B 7D            [ 4] 1616 	ld	a,l
   6E5C F5            [11] 1617 	push	af
   6E5D 33            [ 6] 1618 	inc	sp
   6E5E CD 32 67      [17] 1619 	call	_getTilePtr
   6E61 F1            [10] 1620 	pop	af
   6E62 C1            [10] 1621 	pop	bc
   6E63 5E            [ 7] 1622 	ld	e,(hl)
   6E64 3E 02         [ 7] 1623 	ld	a,#0x02
   6E66 93            [ 4] 1624 	sub	a, e
   6E67 D8            [11] 1625 	ret	C
                           1626 ;src/main.c:417: cu.lanzado = SI;
   6E68 21 72 66      [10] 1627 	ld	hl,#(_cu + 0x0006)
   6E6B 36 01         [10] 1628 	ld	(hl),#0x01
                           1629 ;src/main.c:418: cu.direccion = M_derecha;
   6E6D 21 73 66      [10] 1630 	ld	hl,#(_cu + 0x0007)
   6E70 36 00         [10] 1631 	ld	(hl),#0x00
                           1632 ;src/main.c:419: cu.x=prota.x + G_HERO_W;
   6E72 3A 64 66      [13] 1633 	ld	a, (#_prota + 0)
   6E75 C6 07         [ 7] 1634 	add	a, #0x07
   6E77 32 6C 66      [13] 1635 	ld	(#_cu),a
                           1636 ;src/main.c:420: cu.y=prota.y + G_HERO_H /2;
   6E7A 0A            [ 7] 1637 	ld	a,(bc)
   6E7B C6 0B         [ 7] 1638 	add	a, #0x0B
   6E7D 32 6D 66      [13] 1639 	ld	(#(_cu + 0x0001)),a
                           1640 ;src/main.c:421: cu.sprite=g_knifeX_0;
   6E80 21 C0 54      [10] 1641 	ld	hl,#_g_knifeX_0
   6E83 22 70 66      [16] 1642 	ld	((_cu + 0x0004)), hl
                           1643 ;src/main.c:422: cu.eje = E_X;
   6E86 21 74 66      [10] 1644 	ld	hl,#(_cu + 0x0008)
   6E89 36 00         [10] 1645 	ld	(hl),#0x00
                           1646 ;src/main.c:423: dibujarCuchillo();
   6E8B C3 58 6D      [10] 1647 	jp  _dibujarCuchillo
   6E8E                    1648 00118$:
                           1649 ;src/main.c:426: else if(prota.mira == M_izquierda){
   6E8E 7B            [ 4] 1650 	ld	a,e
   6E8F 3D            [ 4] 1651 	dec	a
   6E90 20 41         [12] 1652 	jr	NZ,00115$
                           1653 ;src/main.c:427: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   6E92 0A            [ 7] 1654 	ld	a,(bc)
   6E93 C6 0B         [ 7] 1655 	add	a, #0x0B
   6E95 5F            [ 4] 1656 	ld	e,a
   6E96 3A 64 66      [13] 1657 	ld	a, (#_prota + 0)
   6E99 C6 F6         [ 7] 1658 	add	a,#0xF6
   6E9B 6F            [ 4] 1659 	ld	l,a
   6E9C C5            [11] 1660 	push	bc
   6E9D 7B            [ 4] 1661 	ld	a,e
   6E9E F5            [11] 1662 	push	af
   6E9F 33            [ 6] 1663 	inc	sp
   6EA0 7D            [ 4] 1664 	ld	a,l
   6EA1 F5            [11] 1665 	push	af
   6EA2 33            [ 6] 1666 	inc	sp
   6EA3 CD 32 67      [17] 1667 	call	_getTilePtr
   6EA6 F1            [10] 1668 	pop	af
   6EA7 C1            [10] 1669 	pop	bc
   6EA8 5E            [ 7] 1670 	ld	e,(hl)
   6EA9 3E 02         [ 7] 1671 	ld	a,#0x02
   6EAB 93            [ 4] 1672 	sub	a, e
   6EAC D8            [11] 1673 	ret	C
                           1674 ;src/main.c:428: cu.lanzado = SI;
   6EAD 21 72 66      [10] 1675 	ld	hl,#(_cu + 0x0006)
   6EB0 36 01         [10] 1676 	ld	(hl),#0x01
                           1677 ;src/main.c:429: cu.direccion = M_izquierda;
   6EB2 21 73 66      [10] 1678 	ld	hl,#(_cu + 0x0007)
   6EB5 36 01         [10] 1679 	ld	(hl),#0x01
                           1680 ;src/main.c:430: cu.x = prota.x - G_KNIFEX_0_W;
   6EB7 3A 64 66      [13] 1681 	ld	a, (#_prota + 0)
   6EBA C6 FC         [ 7] 1682 	add	a,#0xFC
   6EBC 32 6C 66      [13] 1683 	ld	(#_cu),a
                           1684 ;src/main.c:431: cu.y = prota.y + G_HERO_H /2;
   6EBF 0A            [ 7] 1685 	ld	a,(bc)
   6EC0 C6 0B         [ 7] 1686 	add	a, #0x0B
   6EC2 32 6D 66      [13] 1687 	ld	(#(_cu + 0x0001)),a
                           1688 ;src/main.c:432: cu.sprite = g_knifeX_1;
   6EC5 21 D0 54      [10] 1689 	ld	hl,#_g_knifeX_1
   6EC8 22 70 66      [16] 1690 	ld	((_cu + 0x0004)), hl
                           1691 ;src/main.c:433: cu.eje = E_X;
   6ECB 21 74 66      [10] 1692 	ld	hl,#(_cu + 0x0008)
   6ECE 36 00         [10] 1693 	ld	(hl),#0x00
                           1694 ;src/main.c:434: dibujarCuchillo();
   6ED0 C3 58 6D      [10] 1695 	jp  _dibujarCuchillo
   6ED3                    1696 00115$:
                           1697 ;src/main.c:437: else if(prota.mira == M_abajo){
   6ED3 7B            [ 4] 1698 	ld	a,e
   6ED4 D6 03         [ 7] 1699 	sub	a, #0x03
   6ED6 20 41         [12] 1700 	jr	NZ,00112$
                           1701 ;src/main.c:439: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   6ED8 0A            [ 7] 1702 	ld	a,(bc)
   6ED9 C6 1F         [ 7] 1703 	add	a, #0x1F
   6EDB 5F            [ 4] 1704 	ld	e,a
   6EDC 3A 64 66      [13] 1705 	ld	a, (#_prota + 0)
   6EDF 57            [ 4] 1706 	ld	d,a
   6EE0 14            [ 4] 1707 	inc	d
   6EE1 14            [ 4] 1708 	inc	d
   6EE2 14            [ 4] 1709 	inc	d
   6EE3 C5            [11] 1710 	push	bc
   6EE4 7B            [ 4] 1711 	ld	a,e
   6EE5 F5            [11] 1712 	push	af
   6EE6 33            [ 6] 1713 	inc	sp
   6EE7 D5            [11] 1714 	push	de
   6EE8 33            [ 6] 1715 	inc	sp
   6EE9 CD 32 67      [17] 1716 	call	_getTilePtr
   6EEC F1            [10] 1717 	pop	af
   6EED C1            [10] 1718 	pop	bc
   6EEE 5E            [ 7] 1719 	ld	e,(hl)
   6EEF 3E 02         [ 7] 1720 	ld	a,#0x02
   6EF1 93            [ 4] 1721 	sub	a, e
   6EF2 D8            [11] 1722 	ret	C
                           1723 ;src/main.c:440: cu.lanzado = SI;
   6EF3 21 72 66      [10] 1724 	ld	hl,#(_cu + 0x0006)
   6EF6 36 01         [10] 1725 	ld	(hl),#0x01
                           1726 ;src/main.c:441: cu.direccion = M_abajo;
   6EF8 21 73 66      [10] 1727 	ld	hl,#(_cu + 0x0007)
   6EFB 36 03         [10] 1728 	ld	(hl),#0x03
                           1729 ;src/main.c:442: cu.x = prota.x + G_HERO_W / 2;
   6EFD 3A 64 66      [13] 1730 	ld	a, (#_prota + 0)
   6F00 C6 03         [ 7] 1731 	add	a, #0x03
   6F02 32 6C 66      [13] 1732 	ld	(#_cu),a
                           1733 ;src/main.c:443: cu.y = prota.y + G_HERO_H;
   6F05 0A            [ 7] 1734 	ld	a,(bc)
   6F06 C6 16         [ 7] 1735 	add	a, #0x16
   6F08 32 6D 66      [13] 1736 	ld	(#(_cu + 0x0001)),a
                           1737 ;src/main.c:444: cu.sprite = g_knifeY_0;
   6F0B 21 A0 54      [10] 1738 	ld	hl,#_g_knifeY_0
   6F0E 22 70 66      [16] 1739 	ld	((_cu + 0x0004)), hl
                           1740 ;src/main.c:445: cu.eje = E_Y;
   6F11 21 74 66      [10] 1741 	ld	hl,#(_cu + 0x0008)
   6F14 36 01         [10] 1742 	ld	(hl),#0x01
                           1743 ;src/main.c:446: dibujarCuchillo();
   6F16 C3 58 6D      [10] 1744 	jp  _dibujarCuchillo
   6F19                    1745 00112$:
                           1746 ;src/main.c:449: else if(prota.mira == M_arriba){
   6F19 7B            [ 4] 1747 	ld	a,e
   6F1A D6 02         [ 7] 1748 	sub	a, #0x02
   6F1C C0            [11] 1749 	ret	NZ
                           1750 ;src/main.c:450: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   6F1D 0A            [ 7] 1751 	ld	a,(bc)
   6F1E C6 F7         [ 7] 1752 	add	a,#0xF7
   6F20 57            [ 4] 1753 	ld	d,a
   6F21 3A 64 66      [13] 1754 	ld	a, (#_prota + 0)
   6F24 C6 03         [ 7] 1755 	add	a, #0x03
   6F26 C5            [11] 1756 	push	bc
   6F27 D5            [11] 1757 	push	de
   6F28 33            [ 6] 1758 	inc	sp
   6F29 F5            [11] 1759 	push	af
   6F2A 33            [ 6] 1760 	inc	sp
   6F2B CD 32 67      [17] 1761 	call	_getTilePtr
   6F2E F1            [10] 1762 	pop	af
   6F2F C1            [10] 1763 	pop	bc
   6F30 5E            [ 7] 1764 	ld	e,(hl)
   6F31 3E 02         [ 7] 1765 	ld	a,#0x02
   6F33 93            [ 4] 1766 	sub	a, e
   6F34 D8            [11] 1767 	ret	C
                           1768 ;src/main.c:451: cu.lanzado = SI;
   6F35 21 72 66      [10] 1769 	ld	hl,#(_cu + 0x0006)
   6F38 36 01         [10] 1770 	ld	(hl),#0x01
                           1771 ;src/main.c:452: cu.direccion = M_arriba;
   6F3A 21 73 66      [10] 1772 	ld	hl,#(_cu + 0x0007)
   6F3D 36 02         [10] 1773 	ld	(hl),#0x02
                           1774 ;src/main.c:453: cu.x = prota.x + G_HERO_W / 2;
   6F3F 3A 64 66      [13] 1775 	ld	a, (#_prota + 0)
   6F42 C6 03         [ 7] 1776 	add	a, #0x03
   6F44 32 6C 66      [13] 1777 	ld	(#_cu),a
                           1778 ;src/main.c:454: cu.y = prota.y;
   6F47 0A            [ 7] 1779 	ld	a,(bc)
   6F48 32 6D 66      [13] 1780 	ld	(#(_cu + 0x0001)),a
                           1781 ;src/main.c:455: cu.sprite = g_knifeY_1;
   6F4B 21 B0 54      [10] 1782 	ld	hl,#_g_knifeY_1
   6F4E 22 70 66      [16] 1783 	ld	((_cu + 0x0004)), hl
                           1784 ;src/main.c:456: cu.eje = E_Y;
   6F51 21 74 66      [10] 1785 	ld	hl,#(_cu + 0x0008)
   6F54 36 01         [10] 1786 	ld	(hl),#0x01
                           1787 ;src/main.c:457: dibujarCuchillo();
   6F56 C3 58 6D      [10] 1788 	jp  _dibujarCuchillo
                           1789 ;src/main.c:463: void comprobarTeclado() {
                           1790 ;	---------------------------------
                           1791 ; Function comprobarTeclado
                           1792 ; ---------------------------------
   6F59                    1793 _comprobarTeclado::
                           1794 ;src/main.c:464: cpct_scanKeyboard_if();
   6F59 CD E4 5B      [17] 1795 	call	_cpct_scanKeyboard_if
                           1796 ;src/main.c:466: if (cpct_isAnyKeyPressed()) {
   6F5C CD D7 5B      [17] 1797 	call	_cpct_isAnyKeyPressed
   6F5F 7D            [ 4] 1798 	ld	a,l
   6F60 B7            [ 4] 1799 	or	a, a
   6F61 C8            [11] 1800 	ret	Z
                           1801 ;src/main.c:467: if (cpct_isKeyPressed(Key_CursorLeft))
   6F62 21 01 01      [10] 1802 	ld	hl,#0x0101
   6F65 CD 41 59      [17] 1803 	call	_cpct_isKeyPressed
   6F68 7D            [ 4] 1804 	ld	a,l
   6F69 B7            [ 4] 1805 	or	a, a
                           1806 ;src/main.c:468: moverIzquierda();
   6F6A C2 90 6C      [10] 1807 	jp	NZ,_moverIzquierda
                           1808 ;src/main.c:469: else if (cpct_isKeyPressed(Key_CursorRight))
   6F6D 21 00 02      [10] 1809 	ld	hl,#0x0200
   6F70 CD 41 59      [17] 1810 	call	_cpct_isKeyPressed
   6F73 7D            [ 4] 1811 	ld	a,l
   6F74 B7            [ 4] 1812 	or	a, a
                           1813 ;src/main.c:470: moverDerecha();
   6F75 C2 B5 6C      [10] 1814 	jp	NZ,_moverDerecha
                           1815 ;src/main.c:471: else if (cpct_isKeyPressed(Key_CursorUp))
   6F78 21 00 01      [10] 1816 	ld	hl,#0x0100
   6F7B CD 41 59      [17] 1817 	call	_cpct_isKeyPressed
   6F7E 7D            [ 4] 1818 	ld	a,l
   6F7F B7            [ 4] 1819 	or	a, a
                           1820 ;src/main.c:472: moverArriba();
   6F80 C2 FB 6C      [10] 1821 	jp	NZ,_moverArriba
                           1822 ;src/main.c:473: else if (cpct_isKeyPressed(Key_CursorDown))
   6F83 21 00 04      [10] 1823 	ld	hl,#0x0400
   6F86 CD 41 59      [17] 1824 	call	_cpct_isKeyPressed
   6F89 7D            [ 4] 1825 	ld	a,l
   6F8A B7            [ 4] 1826 	or	a, a
                           1827 ;src/main.c:474: moverAbajo();
   6F8B C2 1F 6D      [10] 1828 	jp	NZ,_moverAbajo
                           1829 ;src/main.c:475: else if (cpct_isKeyPressed(Key_Space))
   6F8E 21 05 80      [10] 1830 	ld	hl,#0x8005
   6F91 CD 41 59      [17] 1831 	call	_cpct_isKeyPressed
   6F94 7D            [ 4] 1832 	ld	a,l
   6F95 B7            [ 4] 1833 	or	a, a
   6F96 C8            [11] 1834 	ret	Z
                           1835 ;src/main.c:476: lanzarCuchillo();
   6F97 C3 3D 6E      [10] 1836 	jp  _lanzarCuchillo
                           1837 ;src/main.c:480: u8 checkKnifeCollision(int direction){
                           1838 ;	---------------------------------
                           1839 ; Function checkKnifeCollision
                           1840 ; ---------------------------------
   6F9A                    1841 _checkKnifeCollision::
   6F9A DD E5         [15] 1842 	push	ix
   6F9C DD 21 00 00   [14] 1843 	ld	ix,#0
   6FA0 DD 39         [15] 1844 	add	ix,sp
                           1845 ;src/main.c:482: u8 colisiona = 1;
   6FA2 0E 01         [ 7] 1846 	ld	c,#0x01
                           1847 ;src/main.c:484: switch (direction) {
   6FA4 DD CB 05 7E   [20] 1848 	bit	7, 5 (ix)
   6FA8 C2 94 70      [10] 1849 	jp	NZ,00125$
   6FAB 3E 03         [ 7] 1850 	ld	a,#0x03
   6FAD DD BE 04      [19] 1851 	cp	a, 4 (ix)
   6FB0 3E 00         [ 7] 1852 	ld	a,#0x00
   6FB2 DD 9E 05      [19] 1853 	sbc	a, 5 (ix)
   6FB5 E2 BA 6F      [10] 1854 	jp	PO, 00163$
   6FB8 EE 80         [ 7] 1855 	xor	a, #0x80
   6FBA                    1856 00163$:
   6FBA FA 94 70      [10] 1857 	jp	M,00125$
   6FBD DD 5E 04      [19] 1858 	ld	e,4 (ix)
   6FC0 16 00         [ 7] 1859 	ld	d,#0x00
   6FC2 21 C9 6F      [10] 1860 	ld	hl,#00164$
   6FC5 19            [11] 1861 	add	hl,de
   6FC6 19            [11] 1862 	add	hl,de
   6FC7 19            [11] 1863 	add	hl,de
   6FC8 E9            [ 4] 1864 	jp	(hl)
   6FC9                    1865 00164$:
   6FC9 C3 94 70      [10] 1866 	jp	00125$
   6FCC C3 94 70      [10] 1867 	jp	00125$
   6FCF C3 DB 6F      [10] 1868 	jp	00103$
   6FD2 C3 32 70      [10] 1869 	jp	00114$
                           1870 ;src/main.c:485: case 0:
                           1871 ;src/main.c:487: break;
   6FD5 C3 94 70      [10] 1872 	jp	00125$
                           1873 ;src/main.c:488: case 1:
                           1874 ;src/main.c:490: break;
   6FD8 C3 94 70      [10] 1875 	jp	00125$
                           1876 ;src/main.c:491: case 2:
   6FDB                    1877 00103$:
                           1878 ;src/main.c:493: if((enemy->x + G_ENEMY_W) < cu.x || enemy->x  > (cu.x + G_KNIFEX_0_W)){
   6FDB 21 3C 66      [10] 1879 	ld	hl,#_enemy+0
   6FDE 4E            [ 7] 1880 	ld	c,(hl)
   6FDF 06 00         [ 7] 1881 	ld	b,#0x00
   6FE1 21 04 00      [10] 1882 	ld	hl,#0x0004
   6FE4 09            [11] 1883 	add	hl,bc
   6FE5 EB            [ 4] 1884 	ex	de,hl
   6FE6 21 6C 66      [10] 1885 	ld	hl,#_cu+0
   6FE9 6E            [ 7] 1886 	ld	l,(hl)
   6FEA 26 00         [ 7] 1887 	ld	h,#0x00
   6FEC 7B            [ 4] 1888 	ld	a,e
   6FED 95            [ 4] 1889 	sub	a, l
   6FEE 7A            [ 4] 1890 	ld	a,d
   6FEF 9C            [ 4] 1891 	sbc	a, h
   6FF0 E2 F5 6F      [10] 1892 	jp	PO, 00165$
   6FF3 EE 80         [ 7] 1893 	xor	a, #0x80
   6FF5                    1894 00165$:
   6FF5 FA 32 70      [10] 1895 	jp	M,00114$
   6FF8 11 04 00      [10] 1896 	ld	de,#0x0004
   6FFB 19            [11] 1897 	add	hl,de
   6FFC 7D            [ 4] 1898 	ld	a,l
   6FFD 91            [ 4] 1899 	sub	a, c
   6FFE 7C            [ 4] 1900 	ld	a,h
   6FFF 98            [ 4] 1901 	sbc	a, b
   7000 E2 05 70      [10] 1902 	jp	PO, 00166$
   7003 EE 80         [ 7] 1903 	xor	a, #0x80
   7005                    1904 00166$:
   7005 FA 32 70      [10] 1905 	jp	M,00114$
                           1906 ;src/main.c:496: if(cu.y>enemy->y){
   7008 21 6D 66      [10] 1907 	ld	hl, #(_cu + 0x0001) + 0
   700B 4E            [ 7] 1908 	ld	c,(hl)
   700C 21 3D 66      [10] 1909 	ld	hl, #_enemy + 1
   700F 5E            [ 7] 1910 	ld	e,(hl)
   7010 7B            [ 4] 1911 	ld	a,e
   7011 91            [ 4] 1912 	sub	a, c
   7012 30 1E         [12] 1913 	jr	NC,00114$
                           1914 ;src/main.c:497: if(cu.y - (enemy->y + G_ENEMY_H) >= 2){
   7014 06 00         [ 7] 1915 	ld	b,#0x00
   7016 16 00         [ 7] 1916 	ld	d,#0x00
   7018 21 16 00      [10] 1917 	ld	hl,#0x0016
   701B 19            [11] 1918 	add	hl,de
   701C 79            [ 4] 1919 	ld	a,c
   701D 95            [ 4] 1920 	sub	a, l
   701E 4F            [ 4] 1921 	ld	c,a
   701F 78            [ 4] 1922 	ld	a,b
   7020 9C            [ 4] 1923 	sbc	a, h
   7021 47            [ 4] 1924 	ld	b,a
   7022 79            [ 4] 1925 	ld	a,c
   7023 D6 02         [ 7] 1926 	sub	a, #0x02
   7025 78            [ 4] 1927 	ld	a,b
   7026 17            [ 4] 1928 	rla
   7027 3F            [ 4] 1929 	ccf
   7028 1F            [ 4] 1930 	rra
   7029 DE 80         [ 7] 1931 	sbc	a, #0x80
   702B 30 05         [12] 1932 	jr	NC,00114$
                           1933 ;src/main.c:502: enemy->muerto = SI;
   702D 21 44 66      [10] 1934 	ld	hl,#(_enemy + 0x0008)
   7030 36 01         [10] 1935 	ld	(hl),#0x01
                           1936 ;src/main.c:509: case 3:
   7032                    1937 00114$:
                           1938 ;src/main.c:511: if((enemy->x + G_ENEMY_W) < cu.x || enemy->x  > (cu.x + G_KNIFEX_0_W)){
   7032 21 3C 66      [10] 1939 	ld	hl, #_enemy + 0
   7035 4E            [ 7] 1940 	ld	c,(hl)
   7036 06 00         [ 7] 1941 	ld	b,#0x00
   7038 21 04 00      [10] 1942 	ld	hl,#0x0004
   703B 09            [11] 1943 	add	hl,bc
   703C EB            [ 4] 1944 	ex	de,hl
   703D 21 6C 66      [10] 1945 	ld	hl, #_cu + 0
   7040 6E            [ 7] 1946 	ld	l,(hl)
   7041 26 00         [ 7] 1947 	ld	h,#0x00
   7043 7B            [ 4] 1948 	ld	a,e
   7044 95            [ 4] 1949 	sub	a, l
   7045 7A            [ 4] 1950 	ld	a,d
   7046 9C            [ 4] 1951 	sbc	a, h
   7047 E2 4C 70      [10] 1952 	jp	PO, 00167$
   704A EE 80         [ 7] 1953 	xor	a, #0x80
   704C                    1954 00167$:
   704C FA 5F 70      [10] 1955 	jp	M,00121$
   704F 11 04 00      [10] 1956 	ld	de,#0x0004
   7052 19            [11] 1957 	add	hl,de
   7053 7D            [ 4] 1958 	ld	a,l
   7054 91            [ 4] 1959 	sub	a, c
   7055 7C            [ 4] 1960 	ld	a,h
   7056 98            [ 4] 1961 	sbc	a, b
   7057 E2 5C 70      [10] 1962 	jp	PO, 00168$
   705A EE 80         [ 7] 1963 	xor	a, #0x80
   705C                    1964 00168$:
   705C F2 63 70      [10] 1965 	jp	P,00122$
   705F                    1966 00121$:
                           1967 ;src/main.c:512: colisiona = 0;
   705F 0E 00         [ 7] 1968 	ld	c,#0x00
   7061 18 31         [12] 1969 	jr	00125$
   7063                    1970 00122$:
                           1971 ;src/main.c:514: if(cu.y<enemy->y){
   7063 21 6D 66      [10] 1972 	ld	hl, #(_cu + 0x0001) + 0
   7066 4E            [ 7] 1973 	ld	c,(hl)
   7067 21 3D 66      [10] 1974 	ld	hl, #_enemy + 1
   706A 6E            [ 7] 1975 	ld	l,(hl)
   706B 79            [ 4] 1976 	ld	a,c
   706C 95            [ 4] 1977 	sub	a, l
   706D 30 23         [12] 1978 	jr	NC,00119$
                           1979 ;src/main.c:515: if(enemy->y - (cu.y + G_KNIFEX_0_H - 2) >= 2){
   706F 26 00         [ 7] 1980 	ld	h,#0x00
   7071 06 00         [ 7] 1981 	ld	b,#0x00
   7073 03            [ 6] 1982 	inc	bc
   7074 03            [ 6] 1983 	inc	bc
   7075 BF            [ 4] 1984 	cp	a, a
   7076 ED 42         [15] 1985 	sbc	hl, bc
   7078 11 02 80      [10] 1986 	ld	de, #0x8002
   707B 29            [11] 1987 	add	hl, hl
   707C 3F            [ 4] 1988 	ccf
   707D CB 1C         [ 8] 1989 	rr	h
   707F CB 1D         [ 8] 1990 	rr	l
   7081 ED 52         [15] 1991 	sbc	hl, de
   7083 38 04         [12] 1992 	jr	C,00116$
                           1993 ;src/main.c:516: colisiona = 0;
   7085 0E 00         [ 7] 1994 	ld	c,#0x00
   7087 18 0B         [12] 1995 	jr	00125$
   7089                    1996 00116$:
                           1997 ;src/main.c:518: colisiona = 1;
   7089 0E 01         [ 7] 1998 	ld	c,#0x01
                           1999 ;src/main.c:519: enemy->muerto = SI;
   708B 21 44 66      [10] 2000 	ld	hl,#(_enemy + 0x0008)
   708E 36 01         [10] 2001 	ld	(hl),#0x01
   7090 18 02         [12] 2002 	jr	00125$
   7092                    2003 00119$:
                           2004 ;src/main.c:522: colisiona = 0;
   7092 0E 00         [ 7] 2005 	ld	c,#0x00
                           2006 ;src/main.c:525: }
   7094                    2007 00125$:
                           2008 ;src/main.c:526: return colisiona;
   7094 69            [ 4] 2009 	ld	l,c
   7095 DD E1         [14] 2010 	pop	ix
   7097 C9            [10] 2011 	ret
                           2012 ;src/main.c:529: void moverCuchillo(){
                           2013 ;	---------------------------------
                           2014 ; Function moverCuchillo
                           2015 ; ---------------------------------
   7098                    2016 _moverCuchillo::
                           2017 ;src/main.c:531: if(cu.lanzado){
   7098 01 6C 66      [10] 2018 	ld	bc,#_cu+0
   709B 3A 72 66      [13] 2019 	ld	a, (#_cu + 6)
   709E B7            [ 4] 2020 	or	a, a
   709F C8            [11] 2021 	ret	Z
                           2022 ;src/main.c:532: cu.mover = 1;
   70A0 21 75 66      [10] 2023 	ld	hl,#(_cu + 0x0009)
   70A3 36 01         [10] 2024 	ld	(hl),#0x01
                           2025 ;src/main.c:533: if(cu.direccion == M_derecha){
   70A5 21 73 66      [10] 2026 	ld	hl, #_cu + 7
   70A8 6E            [ 7] 2027 	ld	l,(hl)
                           2028 ;src/main.c:535: if( *getTilePtr(cu.x + G_KNIFEX_0_W + 1, cu.y) <= 2){
   70A9 59            [ 4] 2029 	ld	e, c
   70AA 50            [ 4] 2030 	ld	d, b
   70AB 13            [ 6] 2031 	inc	de
                           2032 ;src/main.c:533: if(cu.direccion == M_derecha){
   70AC 7D            [ 4] 2033 	ld	a,l
   70AD B7            [ 4] 2034 	or	a, a
   70AE 20 27         [12] 2035 	jr	NZ,00128$
                           2036 ;src/main.c:535: if( *getTilePtr(cu.x + G_KNIFEX_0_W + 1, cu.y) <= 2){
   70B0 1A            [ 7] 2037 	ld	a,(de)
   70B1 5F            [ 4] 2038 	ld	e,a
   70B2 0A            [ 7] 2039 	ld	a,(bc)
   70B3 C6 05         [ 7] 2040 	add	a, #0x05
   70B5 6F            [ 4] 2041 	ld	l,a
   70B6 C5            [11] 2042 	push	bc
   70B7 7B            [ 4] 2043 	ld	a,e
   70B8 F5            [11] 2044 	push	af
   70B9 33            [ 6] 2045 	inc	sp
   70BA 7D            [ 4] 2046 	ld	a,l
   70BB F5            [11] 2047 	push	af
   70BC 33            [ 6] 2048 	inc	sp
   70BD CD 32 67      [17] 2049 	call	_getTilePtr
   70C0 F1            [10] 2050 	pop	af
   70C1 C1            [10] 2051 	pop	bc
   70C2 5E            [ 7] 2052 	ld	e,(hl)
   70C3 3E 02         [ 7] 2053 	ld	a,#0x02
   70C5 93            [ 4] 2054 	sub	a, e
   70C6 38 09         [12] 2055 	jr	C,00102$
                           2056 ;src/main.c:536: cu.x++;
   70C8 0A            [ 7] 2057 	ld	a,(bc)
   70C9 3C            [ 4] 2058 	inc	a
   70CA 02            [ 7] 2059 	ld	(bc),a
                           2060 ;src/main.c:537: cu.mover = SI;
   70CB 21 75 66      [10] 2061 	ld	hl,#(_cu + 0x0009)
   70CE 36 01         [10] 2062 	ld	(hl),#0x01
   70D0 C9            [10] 2063 	ret
   70D1                    2064 00102$:
                           2065 ;src/main.c:541: cu.mover=NO;
   70D1 21 75 66      [10] 2066 	ld	hl,#(_cu + 0x0009)
   70D4 36 00         [10] 2067 	ld	(hl),#0x00
   70D6 C9            [10] 2068 	ret
   70D7                    2069 00128$:
                           2070 ;src/main.c:544: else if(cu.direccion == M_izquierda){
   70D7 7D            [ 4] 2071 	ld	a,l
   70D8 3D            [ 4] 2072 	dec	a
   70D9 20 26         [12] 2073 	jr	NZ,00125$
                           2074 ;src/main.c:545: if(*getTilePtr(cu.x - 1, cu.y) <= 2){
   70DB 1A            [ 7] 2075 	ld	a,(de)
   70DC 5F            [ 4] 2076 	ld	e,a
   70DD 0A            [ 7] 2077 	ld	a,(bc)
   70DE 57            [ 4] 2078 	ld	d,a
   70DF 15            [ 4] 2079 	dec	d
   70E0 C5            [11] 2080 	push	bc
   70E1 7B            [ 4] 2081 	ld	a,e
   70E2 F5            [11] 2082 	push	af
   70E3 33            [ 6] 2083 	inc	sp
   70E4 D5            [11] 2084 	push	de
   70E5 33            [ 6] 2085 	inc	sp
   70E6 CD 32 67      [17] 2086 	call	_getTilePtr
   70E9 F1            [10] 2087 	pop	af
   70EA C1            [10] 2088 	pop	bc
   70EB 5E            [ 7] 2089 	ld	e,(hl)
   70EC 3E 02         [ 7] 2090 	ld	a,#0x02
   70EE 93            [ 4] 2091 	sub	a, e
   70EF 38 0A         [12] 2092 	jr	C,00105$
                           2093 ;src/main.c:546: cu.x--;
   70F1 0A            [ 7] 2094 	ld	a,(bc)
   70F2 C6 FF         [ 7] 2095 	add	a,#0xFF
   70F4 02            [ 7] 2096 	ld	(bc),a
                           2097 ;src/main.c:547: cu.mover = SI;
   70F5 21 75 66      [10] 2098 	ld	hl,#(_cu + 0x0009)
   70F8 36 01         [10] 2099 	ld	(hl),#0x01
   70FA C9            [10] 2100 	ret
   70FB                    2101 00105$:
                           2102 ;src/main.c:550: cu.mover=NO;
   70FB 21 75 66      [10] 2103 	ld	hl,#(_cu + 0x0009)
   70FE 36 00         [10] 2104 	ld	(hl),#0x00
   7100 C9            [10] 2105 	ret
   7101                    2106 00125$:
                           2107 ;src/main.c:553: else if(cu.direccion == M_arriba){
   7101 7D            [ 4] 2108 	ld	a,l
   7102 D6 02         [ 7] 2109 	sub	a, #0x02
   7104 20 3E         [12] 2110 	jr	NZ,00122$
                           2111 ;src/main.c:554: if(*getTilePtr(cu.x, cu.y - 2) <= 2){
   7106 1A            [ 7] 2112 	ld	a,(de)
   7107 C6 FE         [ 7] 2113 	add	a,#0xFE
   7109 F5            [11] 2114 	push	af
   710A 0A            [ 7] 2115 	ld	a,(bc)
   710B 47            [ 4] 2116 	ld	b,a
   710C F1            [10] 2117 	pop	af
   710D D5            [11] 2118 	push	de
   710E F5            [11] 2119 	push	af
   710F 33            [ 6] 2120 	inc	sp
   7110 C5            [11] 2121 	push	bc
   7111 33            [ 6] 2122 	inc	sp
   7112 CD 32 67      [17] 2123 	call	_getTilePtr
   7115 F1            [10] 2124 	pop	af
   7116 D1            [10] 2125 	pop	de
   7117 4E            [ 7] 2126 	ld	c,(hl)
   7118 3E 02         [ 7] 2127 	ld	a,#0x02
   711A 91            [ 4] 2128 	sub	a, c
   711B 38 21         [12] 2129 	jr	C,00111$
                           2130 ;src/main.c:555: if(!checkKnifeCollision(M_arriba)){
   711D D5            [11] 2131 	push	de
   711E 21 02 00      [10] 2132 	ld	hl,#0x0002
   7121 E5            [11] 2133 	push	hl
   7122 CD 9A 6F      [17] 2134 	call	_checkKnifeCollision
   7125 F1            [10] 2135 	pop	af
   7126 D1            [10] 2136 	pop	de
   7127 7D            [ 4] 2137 	ld	a,l
   7128 B7            [ 4] 2138 	or	a, a
   7129 20 0D         [12] 2139 	jr	NZ,00108$
                           2140 ;src/main.c:556: cu.y--;
   712B 1A            [ 7] 2141 	ld	a,(de)
   712C C6 FF         [ 7] 2142 	add	a,#0xFF
   712E 12            [ 7] 2143 	ld	(de),a
                           2144 ;src/main.c:557: cu.y--;
   712F C6 FF         [ 7] 2145 	add	a,#0xFF
   7131 12            [ 7] 2146 	ld	(de),a
                           2147 ;src/main.c:558: cu.mover = SI;
   7132 21 75 66      [10] 2148 	ld	hl,#(_cu + 0x0009)
   7135 36 01         [10] 2149 	ld	(hl),#0x01
   7137 C9            [10] 2150 	ret
   7138                    2151 00108$:
                           2152 ;src/main.c:561: cu.mover=NO;
   7138 21 75 66      [10] 2153 	ld	hl,#(_cu + 0x0009)
   713B 36 00         [10] 2154 	ld	(hl),#0x00
   713D C9            [10] 2155 	ret
   713E                    2156 00111$:
                           2157 ;src/main.c:564: cu.mover=NO;
   713E 21 75 66      [10] 2158 	ld	hl,#(_cu + 0x0009)
   7141 36 00         [10] 2159 	ld	(hl),#0x00
   7143 C9            [10] 2160 	ret
   7144                    2161 00122$:
                           2162 ;src/main.c:569: else if(cu.direccion == M_abajo){
   7144 7D            [ 4] 2163 	ld	a,l
   7145 D6 03         [ 7] 2164 	sub	a, #0x03
   7147 C0            [11] 2165 	ret	NZ
                           2166 ;src/main.c:570: if(*getTilePtr(cu.x, cu.y + G_KNIFEY_0_H + 2) <= 2){
   7148 1A            [ 7] 2167 	ld	a,(de)
   7149 C6 0A         [ 7] 2168 	add	a, #0x0A
   714B F5            [11] 2169 	push	af
   714C 0A            [ 7] 2170 	ld	a,(bc)
   714D 47            [ 4] 2171 	ld	b,a
   714E F1            [10] 2172 	pop	af
   714F D5            [11] 2173 	push	de
   7150 F5            [11] 2174 	push	af
   7151 33            [ 6] 2175 	inc	sp
   7152 C5            [11] 2176 	push	bc
   7153 33            [ 6] 2177 	inc	sp
   7154 CD 32 67      [17] 2178 	call	_getTilePtr
   7157 F1            [10] 2179 	pop	af
   7158 D1            [10] 2180 	pop	de
   7159 4E            [ 7] 2181 	ld	c,(hl)
   715A 3E 02         [ 7] 2182 	ld	a,#0x02
   715C 91            [ 4] 2183 	sub	a, c
   715D 38 1F         [12] 2184 	jr	C,00117$
                           2185 ;src/main.c:571: if(!checkKnifeCollision(M_abajo)){
   715F D5            [11] 2186 	push	de
   7160 21 03 00      [10] 2187 	ld	hl,#0x0003
   7163 E5            [11] 2188 	push	hl
   7164 CD 9A 6F      [17] 2189 	call	_checkKnifeCollision
   7167 F1            [10] 2190 	pop	af
   7168 D1            [10] 2191 	pop	de
   7169 7D            [ 4] 2192 	ld	a,l
   716A B7            [ 4] 2193 	or	a, a
   716B 20 0B         [12] 2194 	jr	NZ,00114$
                           2195 ;src/main.c:572: cu.y++;
   716D 1A            [ 7] 2196 	ld	a,(de)
   716E 3C            [ 4] 2197 	inc	a
   716F 12            [ 7] 2198 	ld	(de),a
                           2199 ;src/main.c:573: cu.y++;
   7170 3C            [ 4] 2200 	inc	a
   7171 12            [ 7] 2201 	ld	(de),a
                           2202 ;src/main.c:574: cu.mover = SI;
   7172 21 75 66      [10] 2203 	ld	hl,#(_cu + 0x0009)
   7175 36 01         [10] 2204 	ld	(hl),#0x01
   7177 C9            [10] 2205 	ret
   7178                    2206 00114$:
                           2207 ;src/main.c:577: cu.mover=NO;
   7178 21 75 66      [10] 2208 	ld	hl,#(_cu + 0x0009)
   717B 36 00         [10] 2209 	ld	(hl),#0x00
   717D C9            [10] 2210 	ret
   717E                    2211 00117$:
                           2212 ;src/main.c:580: cu.mover=NO;
   717E 21 75 66      [10] 2213 	ld	hl,#(_cu + 0x0009)
   7181 36 00         [10] 2214 	ld	(hl),#0x00
   7183 C9            [10] 2215 	ret
                           2216 ;src/main.c:585: void barraPuntuacionInicial(){
                           2217 ;	---------------------------------
                           2218 ; Function barraPuntuacionInicial
                           2219 ; ---------------------------------
   7184                    2220 _barraPuntuacionInicial::
                           2221 ;src/main.c:590: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 178); //
   7184 21 00 B2      [10] 2222 	ld	hl,#0xB200
   7187 E5            [11] 2223 	push	hl
   7188 26 C0         [ 7] 2224 	ld	h, #0xC0
   718A E5            [11] 2225 	push	hl
   718B CD B8 65      [17] 2226 	call	_cpct_getScreenPtr
   718E 4D            [ 4] 2227 	ld	c,l
   718F 44            [ 4] 2228 	ld	b,h
                           2229 ;src/main.c:591: cpct_drawStringM0("SCORE", memptr, 1, 0);
   7190 21 01 00      [10] 2230 	ld	hl,#0x0001
   7193 E5            [11] 2231 	push	hl
   7194 C5            [11] 2232 	push	bc
   7195 21 2C 72      [10] 2233 	ld	hl,#___str_0
   7198 E5            [11] 2234 	push	hl
   7199 CD C3 59      [17] 2235 	call	_cpct_drawStringM0
   719C 21 06 00      [10] 2236 	ld	hl,#6
   719F 39            [11] 2237 	add	hl,sp
   71A0 F9            [ 6] 2238 	ld	sp,hl
                           2239 ;src/main.c:592: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 190); // puntuación inicial
   71A1 21 00 BE      [10] 2240 	ld	hl,#0xBE00
   71A4 E5            [11] 2241 	push	hl
   71A5 26 C0         [ 7] 2242 	ld	h, #0xC0
   71A7 E5            [11] 2243 	push	hl
   71A8 CD B8 65      [17] 2244 	call	_cpct_getScreenPtr
   71AB 4D            [ 4] 2245 	ld	c,l
   71AC 44            [ 4] 2246 	ld	b,h
                           2247 ;src/main.c:593: cpct_drawStringM0("00000", memptr, 15, 0);
   71AD 21 0F 00      [10] 2248 	ld	hl,#0x000F
   71B0 E5            [11] 2249 	push	hl
   71B1 C5            [11] 2250 	push	bc
   71B2 21 32 72      [10] 2251 	ld	hl,#___str_1
   71B5 E5            [11] 2252 	push	hl
   71B6 CD C3 59      [17] 2253 	call	_cpct_drawStringM0
   71B9 21 06 00      [10] 2254 	ld	hl,#6
   71BC 39            [11] 2255 	add	hl,sp
   71BD F9            [ 6] 2256 	ld	sp,hl
                           2257 ;src/main.c:596: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 190);
   71BE 21 1A BE      [10] 2258 	ld	hl,#0xBE1A
   71C1 E5            [11] 2259 	push	hl
   71C2 21 00 C0      [10] 2260 	ld	hl,#0xC000
   71C5 E5            [11] 2261 	push	hl
   71C6 CD B8 65      [17] 2262 	call	_cpct_getScreenPtr
   71C9 4D            [ 4] 2263 	ld	c,l
   71CA 44            [ 4] 2264 	ld	b,h
                           2265 ;src/main.c:597: cpct_drawStringM0("ROBOBIT", memptr, 3, 0);
   71CB 21 03 00      [10] 2266 	ld	hl,#0x0003
   71CE E5            [11] 2267 	push	hl
   71CF C5            [11] 2268 	push	bc
   71D0 21 38 72      [10] 2269 	ld	hl,#___str_2
   71D3 E5            [11] 2270 	push	hl
   71D4 CD C3 59      [17] 2271 	call	_cpct_drawStringM0
   71D7 21 06 00      [10] 2272 	ld	hl,#6
   71DA 39            [11] 2273 	add	hl,sp
   71DB F9            [ 6] 2274 	ld	sp,hl
                           2275 ;src/main.c:599: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 178); //
   71DC 21 3C B2      [10] 2276 	ld	hl,#0xB23C
   71DF E5            [11] 2277 	push	hl
   71E0 21 00 C0      [10] 2278 	ld	hl,#0xC000
   71E3 E5            [11] 2279 	push	hl
   71E4 CD B8 65      [17] 2280 	call	_cpct_getScreenPtr
   71E7 4D            [ 4] 2281 	ld	c,l
   71E8 44            [ 4] 2282 	ld	b,h
                           2283 ;src/main.c:600: cpct_drawStringM0("LIVES", memptr, 1, 0);
   71E9 21 01 00      [10] 2284 	ld	hl,#0x0001
   71EC E5            [11] 2285 	push	hl
   71ED C5            [11] 2286 	push	bc
   71EE 21 40 72      [10] 2287 	ld	hl,#___str_3
   71F1 E5            [11] 2288 	push	hl
   71F2 CD C3 59      [17] 2289 	call	_cpct_drawStringM0
   71F5 21 06 00      [10] 2290 	ld	hl,#6
   71F8 39            [11] 2291 	add	hl,sp
   71F9 F9            [ 6] 2292 	ld	sp,hl
                           2293 ;src/main.c:602: for(i=0; i<5; i++){
   71FA 01 00 00      [10] 2294 	ld	bc,#0x0000
   71FD                    2295 00102$:
                           2296 ;src/main.c:603: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 190); // dibuja 5 corazones
   71FD 79            [ 4] 2297 	ld	a,c
   71FE 87            [ 4] 2298 	add	a, a
   71FF 87            [ 4] 2299 	add	a, a
   7200 C6 3C         [ 7] 2300 	add	a, #0x3C
   7202 57            [ 4] 2301 	ld	d,a
   7203 C5            [11] 2302 	push	bc
   7204 3E BE         [ 7] 2303 	ld	a,#0xBE
   7206 F5            [11] 2304 	push	af
   7207 33            [ 6] 2305 	inc	sp
   7208 D5            [11] 2306 	push	de
   7209 33            [ 6] 2307 	inc	sp
   720A 21 00 C0      [10] 2308 	ld	hl,#0xC000
   720D E5            [11] 2309 	push	hl
   720E CD B8 65      [17] 2310 	call	_cpct_getScreenPtr
   7211 EB            [ 4] 2311 	ex	de,hl
   7212 21 03 06      [10] 2312 	ld	hl,#0x0603
   7215 E5            [11] 2313 	push	hl
   7216 D5            [11] 2314 	push	de
   7217 21 A8 55      [10] 2315 	ld	hl,#_g_heart
   721A E5            [11] 2316 	push	hl
   721B CD E7 59      [17] 2317 	call	_cpct_drawSprite
   721E C1            [10] 2318 	pop	bc
                           2319 ;src/main.c:602: for(i=0; i<5; i++){
   721F 03            [ 6] 2320 	inc	bc
   7220 79            [ 4] 2321 	ld	a,c
   7221 D6 05         [ 7] 2322 	sub	a, #0x05
   7223 78            [ 4] 2323 	ld	a,b
   7224 17            [ 4] 2324 	rla
   7225 3F            [ 4] 2325 	ccf
   7226 1F            [ 4] 2326 	rra
   7227 DE 80         [ 7] 2327 	sbc	a, #0x80
   7229 38 D2         [12] 2328 	jr	C,00102$
   722B C9            [10] 2329 	ret
   722C                    2330 ___str_0:
   722C 53 43 4F 52 45     2331 	.ascii "SCORE"
   7231 00                 2332 	.db 0x00
   7232                    2333 ___str_1:
   7232 30 30 30 30 30     2334 	.ascii "00000"
   7237 00                 2335 	.db 0x00
   7238                    2336 ___str_2:
   7238 52 4F 42 4F 42 49  2337 	.ascii "ROBOBIT"
        54
   723F 00                 2338 	.db 0x00
   7240                    2339 ___str_3:
   7240 4C 49 56 45 53     2340 	.ascii "LIVES"
   7245 00                 2341 	.db 0x00
                           2342 ;src/main.c:608: void borrarPantallaAbajo(){
                           2343 ;	---------------------------------
                           2344 ; Function borrarPantallaAbajo
                           2345 ; ---------------------------------
   7246                    2346 _borrarPantallaAbajo::
                           2347 ;src/main.c:610: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 180); // posición para borrar
   7246 21 1A B4      [10] 2348 	ld	hl,#0xB41A
   7249 E5            [11] 2349 	push	hl
   724A 21 00 C0      [10] 2350 	ld	hl,#0xC000
   724D E5            [11] 2351 	push	hl
   724E CD B8 65      [17] 2352 	call	_cpct_getScreenPtr
   7251 4D            [ 4] 2353 	ld	c,l
   7252 44            [ 4] 2354 	ld	b,h
                           2355 ;src/main.c:612: cpct_drawSolidBox(memptr, 0, 30, 7);  //borra el texto "PULSA I"
   7253 21 1E 07      [10] 2356 	ld	hl,#0x071E
   7256 E5            [11] 2357 	push	hl
   7257 AF            [ 4] 2358 	xor	a, a
   7258 F5            [11] 2359 	push	af
   7259 33            [ 6] 2360 	inc	sp
   725A C5            [11] 2361 	push	bc
   725B CD DE 64      [17] 2362 	call	_cpct_drawSolidBox
   725E F1            [10] 2363 	pop	af
   725F F1            [10] 2364 	pop	af
   7260 33            [ 6] 2365 	inc	sp
   7261 C9            [10] 2366 	ret
                           2367 ;src/main.c:615: void menuFin(){
                           2368 ;	---------------------------------
                           2369 ; Function menuFin
                           2370 ; ---------------------------------
   7262                    2371 _menuFin::
                           2372 ;src/main.c:618: cpct_clearScreen(0);
   7262 21 00 40      [10] 2373 	ld	hl,#0x4000
   7265 E5            [11] 2374 	push	hl
   7266 AF            [ 4] 2375 	xor	a, a
   7267 F5            [11] 2376 	push	af
   7268 33            [ 6] 2377 	inc	sp
   7269 26 C0         [ 7] 2378 	ld	h, #0xC0
   726B E5            [11] 2379 	push	hl
   726C CD 72 5C      [17] 2380 	call	_cpct_memset
                           2381 ;src/main.c:620: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 12, 90); // centrado en horizontal y arriba en vertical
   726F 21 0C 5A      [10] 2382 	ld	hl,#0x5A0C
   7272 E5            [11] 2383 	push	hl
   7273 21 00 C0      [10] 2384 	ld	hl,#0xC000
   7276 E5            [11] 2385 	push	hl
   7277 CD B8 65      [17] 2386 	call	_cpct_getScreenPtr
   727A 4D            [ 4] 2387 	ld	c,l
   727B 44            [ 4] 2388 	ld	b,h
                           2389 ;src/main.c:621: cpct_drawStringM0("FIN DE PARTIDA", memptr, 2, 0);
   727C 21 02 00      [10] 2390 	ld	hl,#0x0002
   727F E5            [11] 2391 	push	hl
   7280 C5            [11] 2392 	push	bc
   7281 21 9B 72      [10] 2393 	ld	hl,#___str_4
   7284 E5            [11] 2394 	push	hl
   7285 CD C3 59      [17] 2395 	call	_cpct_drawStringM0
   7288 21 06 00      [10] 2396 	ld	hl,#6
   728B 39            [11] 2397 	add	hl,sp
   728C F9            [ 6] 2398 	ld	sp,hl
                           2399 ;src/main.c:625: do{
   728D                    2400 00101$:
                           2401 ;src/main.c:626: cpct_scanKeyboard_f();
   728D CD 4D 59      [17] 2402 	call	_cpct_scanKeyboard_f
                           2403 ;src/main.c:627: } while(!cpct_isKeyPressed(Key_I));
   7290 21 04 08      [10] 2404 	ld	hl,#0x0804
   7293 CD 41 59      [17] 2405 	call	_cpct_isKeyPressed
   7296 7D            [ 4] 2406 	ld	a,l
   7297 B7            [ 4] 2407 	or	a, a
   7298 28 F3         [12] 2408 	jr	Z,00101$
   729A C9            [10] 2409 	ret
   729B                    2410 ___str_4:
   729B 46 49 4E 20 44 45  2411 	.ascii "FIN DE PARTIDA"
        20 50 41 52 54 49
        44 41
   72A9 00                 2412 	.db 0x00
                           2413 ;src/main.c:630: void menuInicio(){
                           2414 ;	---------------------------------
                           2415 ; Function menuInicio
                           2416 ; ---------------------------------
   72AA                    2417 _menuInicio::
                           2418 ;src/main.c:634: cpct_clearScreen(0);
   72AA 21 00 40      [10] 2419 	ld	hl,#0x4000
   72AD E5            [11] 2420 	push	hl
   72AE AF            [ 4] 2421 	xor	a, a
   72AF F5            [11] 2422 	push	af
   72B0 33            [ 6] 2423 	inc	sp
   72B1 26 C0         [ 7] 2424 	ld	h, #0xC0
   72B3 E5            [11] 2425 	push	hl
   72B4 CD 72 5C      [17] 2426 	call	_cpct_memset
                           2427 ;src/main.c:636: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 15); // centrado en horizontal y arriba en vertical
   72B7 21 20 0F      [10] 2428 	ld	hl,#0x0F20
   72BA E5            [11] 2429 	push	hl
   72BB 21 00 C0      [10] 2430 	ld	hl,#0xC000
   72BE E5            [11] 2431 	push	hl
   72BF CD B8 65      [17] 2432 	call	_cpct_getScreenPtr
   72C2 4D            [ 4] 2433 	ld	c,l
   72C3 44            [ 4] 2434 	ld	b,h
                           2435 ;src/main.c:637: cpct_drawStringM0("MENU", memptr, 2, 0);
   72C4 21 02 00      [10] 2436 	ld	hl,#0x0002
   72C7 E5            [11] 2437 	push	hl
   72C8 C5            [11] 2438 	push	bc
   72C9 21 01 73      [10] 2439 	ld	hl,#___str_5
   72CC E5            [11] 2440 	push	hl
   72CD CD C3 59      [17] 2441 	call	_cpct_drawStringM0
   72D0 21 06 00      [10] 2442 	ld	hl,#6
   72D3 39            [11] 2443 	add	hl,sp
   72D4 F9            [ 6] 2444 	ld	sp,hl
                           2445 ;src/main.c:639: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 160); // centrado en horizontal y abajo en vertical
   72D5 21 1A A0      [10] 2446 	ld	hl,#0xA01A
   72D8 E5            [11] 2447 	push	hl
   72D9 21 00 C0      [10] 2448 	ld	hl,#0xC000
   72DC E5            [11] 2449 	push	hl
   72DD CD B8 65      [17] 2450 	call	_cpct_getScreenPtr
   72E0 4D            [ 4] 2451 	ld	c,l
   72E1 44            [ 4] 2452 	ld	b,h
                           2453 ;src/main.c:640: cpct_drawStringM0("PULSA I", memptr, 1, 0);
   72E2 21 01 00      [10] 2454 	ld	hl,#0x0001
   72E5 E5            [11] 2455 	push	hl
   72E6 C5            [11] 2456 	push	bc
   72E7 21 06 73      [10] 2457 	ld	hl,#___str_6
   72EA E5            [11] 2458 	push	hl
   72EB CD C3 59      [17] 2459 	call	_cpct_drawStringM0
   72EE 21 06 00      [10] 2460 	ld	hl,#6
   72F1 39            [11] 2461 	add	hl,sp
   72F2 F9            [ 6] 2462 	ld	sp,hl
                           2463 ;src/main.c:643: do{
   72F3                    2464 00101$:
                           2465 ;src/main.c:644: cpct_scanKeyboard_f();
   72F3 CD 4D 59      [17] 2466 	call	_cpct_scanKeyboard_f
                           2467 ;src/main.c:645: } while(!cpct_isKeyPressed(Key_I));
   72F6 21 04 08      [10] 2468 	ld	hl,#0x0804
   72F9 CD 41 59      [17] 2469 	call	_cpct_isKeyPressed
   72FC 7D            [ 4] 2470 	ld	a,l
   72FD B7            [ 4] 2471 	or	a, a
   72FE 28 F3         [12] 2472 	jr	Z,00101$
   7300 C9            [10] 2473 	ret
   7301                    2474 ___str_5:
   7301 4D 45 4E 55        2475 	.ascii "MENU"
   7305 00                 2476 	.db 0x00
   7306                    2477 ___str_6:
   7306 50 55 4C 53 41 20  2478 	.ascii "PULSA I"
        49
   730D 00                 2479 	.db 0x00
                           2480 ;src/main.c:648: void inicializarEnemy() {
                           2481 ;	---------------------------------
                           2482 ; Function inicializarEnemy
                           2483 ; ---------------------------------
   730E                    2484 _inicializarEnemy::
                           2485 ;src/main.c:653: actual = enemy;
                           2486 ;src/main.c:654: while(--i){
   730E 0E 05         [ 7] 2487 	ld	c,#0x05
   7310                    2488 00104$:
   7310 0D            [ 4] 2489 	dec c
   7311 C8            [11] 2490 	ret	Z
                           2491 ;src/main.c:655: enemy->x = enemy->px = 71;
   7312 21 3E 66      [10] 2492 	ld	hl,#(_enemy + 0x0002)
   7315 36 47         [10] 2493 	ld	(hl),#0x47
   7317 21 3C 66      [10] 2494 	ld	hl,#_enemy
   731A 36 47         [10] 2495 	ld	(hl),#0x47
                           2496 ;src/main.c:656: enemy->y = enemy->py = 84;
   731C 21 3F 66      [10] 2497 	ld	hl,#(_enemy + 0x0003)
   731F 36 54         [10] 2498 	ld	(hl),#0x54
   7321 21 3D 66      [10] 2499 	ld	hl,#(_enemy + 0x0001)
   7324 36 54         [10] 2500 	ld	(hl),#0x54
                           2501 ;src/main.c:657: enemy->mover  = NO;
   7326 21 42 66      [10] 2502 	ld	hl,#(_enemy + 0x0006)
   7329 36 00         [10] 2503 	ld	(hl),#0x00
                           2504 ;src/main.c:658: enemy->mira=M_abajo;
   732B 21 43 66      [10] 2505 	ld	hl,#(_enemy + 0x0007)
   732E 36 03         [10] 2506 	ld	(hl),#0x03
                           2507 ;src/main.c:659: enemy->sprite = g_enemy;
   7330 21 BA 55      [10] 2508 	ld	hl,#_g_enemy
   7333 22 40 66      [16] 2509 	ld	((_enemy + 0x0004)), hl
                           2510 ;src/main.c:661: enemy->muerto = SI;
   7336 21 44 66      [10] 2511 	ld	hl,#_enemy + 8
                           2512 ;src/main.c:660: if(i!=4){
   7339 79            [ 4] 2513 	ld	a,c
   733A D6 04         [ 7] 2514 	sub	a, #0x04
   733C 28 04         [12] 2515 	jr	Z,00102$
                           2516 ;src/main.c:661: enemy->muerto = SI;
   733E 36 01         [10] 2517 	ld	(hl),#0x01
   7340 18 02         [12] 2518 	jr	00103$
   7342                    2519 00102$:
                           2520 ;src/main.c:664: enemy->muerto = NO;
   7342 36 00         [10] 2521 	ld	(hl),#0x00
   7344                    2522 00103$:
                           2523 ;src/main.c:666: enemy->patrol = SI;
   7344 21 45 66      [10] 2524 	ld	hl,#(_enemy + 0x0009)
   7347 36 01         [10] 2525 	ld	(hl),#0x01
                           2526 ;src/main.c:667: actual++;
   7349 18 C5         [12] 2527 	jr	00104$
                           2528 ;src/main.c:671: void inicializarCPC() {
                           2529 ;	---------------------------------
                           2530 ; Function inicializarCPC
                           2531 ; ---------------------------------
   734B                    2532 _inicializarCPC::
                           2533 ;src/main.c:672: cpct_disableFirmware();
   734B CD A9 64      [17] 2534 	call	_cpct_disableFirmware
                           2535 ;src/main.c:673: cpct_setVideoMode(0);
   734E 2E 00         [ 7] 2536 	ld	l,#0x00
   7350 CD 54 5C      [17] 2537 	call	_cpct_setVideoMode
                           2538 ;src/main.c:674: cpct_setBorder(HW_BLACK);
   7353 21 10 14      [10] 2539 	ld	hl,#0x1410
   7356 E5            [11] 2540 	push	hl
   7357 CD B7 59      [17] 2541 	call	_cpct_setPALColour
                           2542 ;src/main.c:675: cpct_setPalette(g_palette, 16);
   735A 21 10 00      [10] 2543 	ld	hl,#0x0010
   735D E5            [11] 2544 	push	hl
   735E 21 E0 57      [10] 2545 	ld	hl,#_g_palette
   7361 E5            [11] 2546 	push	hl
   7362 CD 2A 59      [17] 2547 	call	_cpct_setPalette
                           2548 ;src/main.c:676: cpct_akp_musicInit(G_song);
   7365 21 00 3F      [10] 2549 	ld	hl,#_G_song
   7368 E5            [11] 2550 	push	hl
   7369 CD 85 63      [17] 2551 	call	_cpct_akp_musicInit
   736C F1            [10] 2552 	pop	af
   736D C9            [10] 2553 	ret
                           2554 ;src/main.c:679: void inicializarJuego() {
                           2555 ;	---------------------------------
                           2556 ; Function inicializarJuego
                           2557 ; ---------------------------------
   736E                    2558 _inicializarJuego::
                           2559 ;src/main.c:683: actual = enemy;
                           2560 ;src/main.c:685: num_mapa = 0;
   736E 21 78 66      [10] 2561 	ld	hl,#_num_mapa + 0
   7371 36 00         [10] 2562 	ld	(hl), #0x00
                           2563 ;src/main.c:686: mapa = mapas[num_mapa];
   7373 21 8F 66      [10] 2564 	ld	hl, #_mapas + 0
   7376 7E            [ 7] 2565 	ld	a,(hl)
   7377 FD 21 76 66   [14] 2566 	ld	iy,#_mapa
   737B FD 77 00      [19] 2567 	ld	0 (iy),a
   737E 23            [ 6] 2568 	inc	hl
   737F 7E            [ 7] 2569 	ld	a,(hl)
   7380 32 77 66      [13] 2570 	ld	(#_mapa + 1),a
                           2571 ;src/main.c:687: cpct_etm_setTileset2x4(g_tileset);
   7383 21 E0 54      [10] 2572 	ld	hl,#_g_tileset
   7386 CD 1B 5B      [17] 2573 	call	_cpct_etm_setTileset2x4
                           2574 ;src/main.c:688: dibujarMapa();
   7389 CD 79 66      [17] 2575 	call	_dibujarMapa
                           2576 ;src/main.c:689: borrarPantallaAbajo();
   738C CD 46 72      [17] 2577 	call	_borrarPantallaAbajo
                           2578 ;src/main.c:690: barraPuntuacionInicial();
   738F CD 84 71      [17] 2579 	call	_barraPuntuacionInicial
                           2580 ;src/main.c:693: prota.x = prota.px = 4;
   7392 21 66 66      [10] 2581 	ld	hl,#(_prota + 0x0002)
   7395 36 04         [10] 2582 	ld	(hl),#0x04
   7397 21 64 66      [10] 2583 	ld	hl,#_prota
   739A 36 04         [10] 2584 	ld	(hl),#0x04
                           2585 ;src/main.c:694: prota.y = prota.py = 80;
   739C 21 67 66      [10] 2586 	ld	hl,#(_prota + 0x0003)
   739F 36 50         [10] 2587 	ld	(hl),#0x50
   73A1 21 65 66      [10] 2588 	ld	hl,#(_prota + 0x0001)
   73A4 36 50         [10] 2589 	ld	(hl),#0x50
                           2590 ;src/main.c:695: prota.mover  = NO;
   73A6 21 6A 66      [10] 2591 	ld	hl,#(_prota + 0x0006)
   73A9 36 00         [10] 2592 	ld	(hl),#0x00
                           2593 ;src/main.c:696: prota.mira=M_derecha;
   73AB 21 6B 66      [10] 2594 	ld	hl,#(_prota + 0x0007)
   73AE 36 00         [10] 2595 	ld	(hl),#0x00
                           2596 ;src/main.c:697: prota.sprite = g_hero;
   73B0 21 F0 57      [10] 2597 	ld	hl,#_g_hero
   73B3 22 68 66      [16] 2598 	ld	((_prota + 0x0004)), hl
                           2599 ;src/main.c:701: cu.x = cu.px = 0;
   73B6 21 6E 66      [10] 2600 	ld	hl,#(_cu + 0x0002)
   73B9 36 00         [10] 2601 	ld	(hl),#0x00
   73BB 21 6C 66      [10] 2602 	ld	hl,#_cu
   73BE 36 00         [10] 2603 	ld	(hl),#0x00
                           2604 ;src/main.c:702: cu.y = cu.py = 0;
   73C0 21 6F 66      [10] 2605 	ld	hl,#(_cu + 0x0003)
   73C3 36 00         [10] 2606 	ld	(hl),#0x00
   73C5 21 6D 66      [10] 2607 	ld	hl,#(_cu + 0x0001)
   73C8 36 00         [10] 2608 	ld	(hl),#0x00
                           2609 ;src/main.c:703: cu.lanzado = NO;
   73CA 21 72 66      [10] 2610 	ld	hl,#(_cu + 0x0006)
   73CD 36 00         [10] 2611 	ld	(hl),#0x00
                           2612 ;src/main.c:704: cu.mover = NO;
   73CF 21 75 66      [10] 2613 	ld	hl,#(_cu + 0x0009)
   73D2 36 00         [10] 2614 	ld	(hl),#0x00
                           2615 ;src/main.c:708: dibujarProta();
   73D4 CD 95 66      [17] 2616 	call	_dibujarProta
                           2617 ;src/main.c:709: dibujarEnemigo(actual);
   73D7 21 3C 66      [10] 2618 	ld	hl,#_enemy
   73DA E5            [11] 2619 	push	hl
   73DB CD 9C 68      [17] 2620 	call	_dibujarEnemigo
   73DE F1            [10] 2621 	pop	af
   73DF C9            [10] 2622 	ret
                           2623 ;src/main.c:712: void main(void) {
                           2624 ;	---------------------------------
                           2625 ; Function main
                           2626 ; ---------------------------------
   73E0                    2627 _main::
                           2628 ;src/main.c:716: inicializarCPC();
   73E0 CD 4B 73      [17] 2629 	call	_inicializarCPC
                           2630 ;src/main.c:717: menuInicio();
   73E3 CD AA 72      [17] 2631 	call	_menuInicio
                           2632 ;src/main.c:719: inicializarJuego();
   73E6 CD 6E 73      [17] 2633 	call	_inicializarJuego
                           2634 ;src/main.c:720: inicializarEnemy();
   73E9 CD 0E 73      [17] 2635 	call	_inicializarEnemy
                           2636 ;src/main.c:721: cpct_akp_musicPlay();
   73EC CD 82 5C      [17] 2637 	call	_cpct_akp_musicPlay
                           2638 ;src/main.c:724: actual = enemy;
                           2639 ;src/main.c:726: while (1) {
   73EF                    2640 00115$:
                           2641 ;src/main.c:728: comprobarTeclado();
   73EF CD 59 6F      [17] 2642 	call	_comprobarTeclado
                           2643 ;src/main.c:729: moverCuchillo();
   73F2 CD 98 70      [17] 2644 	call	_moverCuchillo
                           2645 ;src/main.c:730: moverEnemigo(actual);
   73F5 21 3C 66      [10] 2646 	ld	hl,#_enemy
   73F8 E5            [11] 2647 	push	hl
   73F9 CD DC 6B      [17] 2648 	call	_moverEnemigo
   73FC F1            [10] 2649 	pop	af
                           2650 ;src/main.c:732: cpct_waitVSYNC();
   73FD CD 4C 5C      [17] 2651 	call	_cpct_waitVSYNC
                           2652 ;src/main.c:734: if (prota.mover) {
   7400 01 6A 66      [10] 2653 	ld	bc,#_prota+6
   7403 0A            [ 7] 2654 	ld	a,(bc)
   7404 B7            [ 4] 2655 	or	a, a
   7405 28 07         [12] 2656 	jr	Z,00102$
                           2657 ;src/main.c:735: redibujarProta();
   7407 C5            [11] 2658 	push	bc
   7408 CD 1E 67      [17] 2659 	call	_redibujarProta
   740B C1            [10] 2660 	pop	bc
                           2661 ;src/main.c:736: prota.mover = NO;
   740C AF            [ 4] 2662 	xor	a, a
   740D 02            [ 7] 2663 	ld	(bc),a
   740E                    2664 00102$:
                           2665 ;src/main.c:738: if(cu.lanzado && cu.mover){
   740E 21 72 66      [10] 2666 	ld	hl,#_cu + 6
   7411 4E            [ 7] 2667 	ld	c,(hl)
   7412 11 75 66      [10] 2668 	ld	de,#_cu + 9
   7415 79            [ 4] 2669 	ld	a,c
   7416 B7            [ 4] 2670 	or	a, a
   7417 28 09         [12] 2671 	jr	Z,00107$
   7419 1A            [ 7] 2672 	ld	a,(de)
   741A B7            [ 4] 2673 	or	a, a
   741B 28 05         [12] 2674 	jr	Z,00107$
                           2675 ;src/main.c:739: redibujarCuchillo();
   741D CD 29 6E      [17] 2676 	call	_redibujarCuchillo
   7420 18 0B         [12] 2677 	jr	00108$
   7422                    2678 00107$:
                           2679 ;src/main.c:740: }else if (cu.lanzado && !cu.mover){
   7422 79            [ 4] 2680 	ld	a,c
   7423 B7            [ 4] 2681 	or	a, a
   7424 28 07         [12] 2682 	jr	Z,00108$
   7426 1A            [ 7] 2683 	ld	a,(de)
   7427 B7            [ 4] 2684 	or	a, a
   7428 20 03         [12] 2685 	jr	NZ,00108$
                           2686 ;src/main.c:741: borrarCuchillo();
   742A CD BC 6D      [17] 2687 	call	_borrarCuchillo
   742D                    2688 00108$:
                           2689 ;src/main.c:744: if(enemy->mover){
   742D 3A 42 66      [13] 2690 	ld	a, (#_enemy + 6)
   7430 B7            [ 4] 2691 	or	a, a
   7431 28 03         [12] 2692 	jr	Z,00111$
                           2693 ;src/main.c:745: redibujarEnemigo();
   7433 CD 52 69      [17] 2694 	call	_redibujarEnemigo
   7436                    2695 00111$:
                           2696 ;src/main.c:747: if (enemy->muerto){
   7436 3A 44 66      [13] 2697 	ld	a, (#_enemy + 8)
   7439 B7            [ 4] 2698 	or	a, a
   743A 28 B3         [12] 2699 	jr	Z,00115$
                           2700 ;src/main.c:748: borrarEnemigo();
   743C CD D4 68      [17] 2701 	call	_borrarEnemigo
   743F 18 AE         [12] 2702 	jr	00115$
                           2703 	.area _CODE
                           2704 	.area _INITIALIZER
                           2705 	.area _CABS (ABS)
   3F00                    2706 	.org 0x3F00
   3F00                    2707 _G_song:
   3F00 41                 2708 	.db #0x41	; 65	'A'
   3F01 54                 2709 	.db #0x54	; 84	'T'
   3F02 31                 2710 	.db #0x31	; 49	'1'
   3F03 30                 2711 	.db #0x30	; 48	'0'
   3F04 01                 2712 	.db #0x01	; 1
   3F05 40                 2713 	.db #0x40	; 64
   3F06 42                 2714 	.db #0x42	; 66	'B'
   3F07 0F                 2715 	.db #0x0F	; 15
   3F08 02                 2716 	.db #0x02	; 2
   3F09 06                 2717 	.db #0x06	; 6
   3F0A 1D                 2718 	.db #0x1D	; 29
   3F0B 00                 2719 	.db #0x00	; 0
   3F0C 10                 2720 	.db #0x10	; 16
   3F0D 40                 2721 	.db #0x40	; 64
   3F0E 19                 2722 	.db #0x19	; 25
   3F0F 40                 2723 	.db #0x40	; 64
   3F10 00                 2724 	.db #0x00	; 0
   3F11 00                 2725 	.db #0x00	; 0
   3F12 00                 2726 	.db #0x00	; 0
   3F13 00                 2727 	.db #0x00	; 0
   3F14 00                 2728 	.db #0x00	; 0
   3F15 00                 2729 	.db #0x00	; 0
   3F16 0D                 2730 	.db #0x0D	; 13
   3F17 12                 2731 	.db #0x12	; 18
   3F18 40                 2732 	.db #0x40	; 64
   3F19 01                 2733 	.db #0x01	; 1
   3F1A 00                 2734 	.db #0x00	; 0
   3F1B 7C                 2735 	.db #0x7C	; 124
   3F1C 18                 2736 	.db #0x18	; 24
   3F1D 78                 2737 	.db #0x78	; 120	'x'
   3F1E 0C                 2738 	.db #0x0C	; 12
   3F1F 34                 2739 	.db #0x34	; 52	'4'
   3F20 30                 2740 	.db #0x30	; 48	'0'
   3F21 2C                 2741 	.db #0x2C	; 44
   3F22 28                 2742 	.db #0x28	; 40
   3F23 24                 2743 	.db #0x24	; 36
   3F24 20                 2744 	.db #0x20	; 32
   3F25 1C                 2745 	.db #0x1C	; 28
   3F26 0D                 2746 	.db #0x0D	; 13
   3F27 25                 2747 	.db #0x25	; 37
   3F28 40                 2748 	.db #0x40	; 64
   3F29 20                 2749 	.db #0x20	; 32
   3F2A 00                 2750 	.db #0x00	; 0
   3F2B 00                 2751 	.db #0x00	; 0
   3F2C 00                 2752 	.db #0x00	; 0
   3F2D 39                 2753 	.db #0x39	; 57	'9'
   3F2E 40                 2754 	.db #0x40	; 64
   3F2F 00                 2755 	.db #0x00	; 0
   3F30 57                 2756 	.db #0x57	; 87	'W'
   3F31 40                 2757 	.db #0x40	; 64
   3F32 3B                 2758 	.db #0x3B	; 59
   3F33 40                 2759 	.db #0x40	; 64
   3F34 57                 2760 	.db #0x57	; 87	'W'
   3F35 40                 2761 	.db #0x40	; 64
   3F36 01                 2762 	.db #0x01	; 1
   3F37 2F                 2763 	.db #0x2F	; 47
   3F38 40                 2764 	.db #0x40	; 64
   3F39 19                 2765 	.db #0x19	; 25
   3F3A 00                 2766 	.db #0x00	; 0
   3F3B 76                 2767 	.db #0x76	; 118	'v'
   3F3C E1                 2768 	.db #0xE1	; 225
   3F3D 00                 2769 	.db #0x00	; 0
   3F3E 00                 2770 	.db #0x00	; 0
   3F3F 01                 2771 	.db #0x01	; 1
   3F40 04                 2772 	.db #0x04	; 4
   3F41 51                 2773 	.db #0x51	; 81	'Q'
   3F42 04                 2774 	.db #0x04	; 4
   3F43 37                 2775 	.db #0x37	; 55	'7'
   3F44 04                 2776 	.db #0x04	; 4
   3F45 4F                 2777 	.db #0x4F	; 79	'O'
   3F46 04                 2778 	.db #0x04	; 4
   3F47 37                 2779 	.db #0x37	; 55	'7'
   3F48 02                 2780 	.db #0x02	; 2
   3F49 4B                 2781 	.db #0x4B	; 75	'K'
   3F4A 02                 2782 	.db #0x02	; 2
   3F4B 37                 2783 	.db #0x37	; 55	'7'
   3F4C 04                 2784 	.db #0x04	; 4
   3F4D 4F                 2785 	.db #0x4F	; 79	'O'
   3F4E 04                 2786 	.db #0x04	; 4
   3F4F 37                 2787 	.db #0x37	; 55	'7'
   3F50 04                 2788 	.db #0x04	; 4
   3F51 4F                 2789 	.db #0x4F	; 79	'O'
   3F52 04                 2790 	.db #0x04	; 4
   3F53 37                 2791 	.db #0x37	; 55	'7'
   3F54 02                 2792 	.db #0x02	; 2
   3F55 4B                 2793 	.db #0x4B	; 75	'K'
   3F56 00                 2794 	.db #0x00	; 0
   3F57 42                 2795 	.db #0x42	; 66	'B'
   3F58 60                 2796 	.db #0x60	; 96
   3F59 00                 2797 	.db #0x00	; 0
   3F5A 42                 2798 	.db #0x42	; 66	'B'
   3F5B 80                 2799 	.db #0x80	; 128
   3F5C 00                 2800 	.db #0x00	; 0
   3F5D 00                 2801 	.db #0x00	; 0
   3F5E 42                 2802 	.db #0x42	; 66	'B'
   3F5F 00                 2803 	.db #0x00	; 0
   3F60 00                 2804 	.db #0x00	; 0
