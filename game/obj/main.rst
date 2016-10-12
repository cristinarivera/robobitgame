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
                             15 	.globl _menuInicio
                             16 	.globl _menuFin
                             17 	.globl _borrarPantallaAbajo
                             18 	.globl _barraPuntuacionInicial
                             19 	.globl _moverCuchillo
                             20 	.globl _comprobarTeclado
                             21 	.globl _lanzarCuchillo
                             22 	.globl _redibujarCuchillo
                             23 	.globl _borrarCuchillo
                             24 	.globl _dibujarCuchillo
                             25 	.globl _moverAbajo
                             26 	.globl _moverArriba
                             27 	.globl _moverDerecha
                             28 	.globl _moverIzquierda
                             29 	.globl _avanzarMapa
                             30 	.globl _moverEnemigo
                             31 	.globl _redibujarEnemigo
                             32 	.globl _borrarEnemigo
                             33 	.globl _dibujarEnemigo
                             34 	.globl _checkCollision
                             35 	.globl _getTilePtr
                             36 	.globl _redibujarProta
                             37 	.globl _borrarProta
                             38 	.globl _dibujarProta
                             39 	.globl _dibujarMapa
                             40 	.globl _cpct_etm_setTileset2x4
                             41 	.globl _cpct_etm_drawTileBox2x4
                             42 	.globl _cpct_akp_musicPlay
                             43 	.globl _cpct_akp_musicInit
                             44 	.globl _cpct_getScreenPtr
                             45 	.globl _cpct_setPALColour
                             46 	.globl _cpct_setPalette
                             47 	.globl _cpct_waitVSYNC
                             48 	.globl _cpct_setVideoMode
                             49 	.globl _cpct_drawStringM0
                             50 	.globl _cpct_drawSpriteMaskedAlignedTable
                             51 	.globl _cpct_drawSolidBox
                             52 	.globl _cpct_drawSprite
                             53 	.globl _cpct_isAnyKeyPressed
                             54 	.globl _cpct_isKeyPressed
                             55 	.globl _cpct_scanKeyboard_if
                             56 	.globl _cpct_scanKeyboard_f
                             57 	.globl _cpct_memset
                             58 	.globl _cpct_disableFirmware
                             59 	.globl _num_mapa
                             60 	.globl _mapa
                             61 	.globl _cu
                             62 	.globl _prota
                             63 	.globl _enemy
                             64 	.globl _EEje
                             65 	.globl _EMirar
                             66 	.globl _mapas
                             67 ;--------------------------------------------------------
                             68 ; special function registers
                             69 ;--------------------------------------------------------
                             70 ;--------------------------------------------------------
                             71 ; ram data
                             72 ;--------------------------------------------------------
                             73 	.area _DATA
   65EE                      74 _EMirar::
   65EE                      75 	.ds 1
   65EF                      76 _EEje::
   65EF                      77 	.ds 1
   65F0                      78 _enemy::
   65F0                      79 	.ds 8
   65F8                      80 _prota::
   65F8                      81 	.ds 8
   6600                      82 _cu::
   6600                      83 	.ds 90
   665A                      84 _mapa::
   665A                      85 	.ds 2
   665C                      86 _num_mapa::
   665C                      87 	.ds 1
                             88 ;--------------------------------------------------------
                             89 ; ram data
                             90 ;--------------------------------------------------------
                             91 	.area _INITIALIZED
                             92 ;--------------------------------------------------------
                             93 ; absolute external ram data
                             94 ;--------------------------------------------------------
                             95 	.area _DABS (ABS)
                             96 ;--------------------------------------------------------
                             97 ; global & static initialisations
                             98 ;--------------------------------------------------------
                             99 	.area _HOME
                            100 	.area _GSINIT
                            101 	.area _GSFINAL
                            102 	.area _GSINIT
                            103 ;--------------------------------------------------------
                            104 ; Home
                            105 ;--------------------------------------------------------
                            106 	.area _HOME
                            107 	.area _HOME
                            108 ;--------------------------------------------------------
                            109 ; code
                            110 ;--------------------------------------------------------
                            111 	.area _CODE
                            112 ;src/main.c:111: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
                            113 ;	---------------------------------
                            114 ; Function dummy_cpct_transparentMaskTable0M0_container
                            115 ; ---------------------------------
   58DA                     116 _dummy_cpct_transparentMaskTable0M0_container::
                            117 	.area _g_tablatrans_ (ABS) 
   3E00                     118 	.org 0x3E00 
   3E00                     119 	 _g_tablatrans::
   3E00 FF AA 55 00 AA AA   120 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E08 55 00 55 00 00 00   121 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E10 AA AA 00 00 AA AA   122 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E18 00 00 00 00 00 00   123 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E20 55 00 55 00 00 00   124 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E28 55 00 55 00 00 00   125 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E30 00 00 00 00 00 00   126 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E38 00 00 00 00 00 00   127 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E40 AA AA 00 00 AA AA   128 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E48 00 00 00 00 00 00   129 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E50 AA AA 00 00 AA AA   130 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E58 00 00 00 00 00 00   131 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E60 00 00 00 00 00 00   132 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E68 00 00 00 00 00 00   133 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E70 00 00 00 00 00 00   134 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E78 00 00 00 00 00 00   135 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E80 55 00 55 00 00 00   136 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E88 55 00 55 00 00 00   137 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E90 00 00 00 00 00 00   138 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E98 00 00 00 00 00 00   139 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA0 55 00 55 00 00 00   140 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA8 55 00 55 00 00 00   141 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB0 00 00 00 00 00 00   142 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB8 00 00 00 00 00 00   143 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC0 00 00 00 00 00 00   144 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC8 00 00 00 00 00 00   145 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED0 00 00 00 00 00 00   146 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED8 00 00 00 00 00 00   147 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE0 00 00 00 00 00 00   148 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE8 00 00 00 00 00 00   149 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF0 00 00 00 00 00 00   150 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF8 00 00 00 00 00 00   151 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            152 	.area _CSEG (REL, CON) 
                            153 ;src/main.c:114: void dibujarMapa() {
                            154 ;	---------------------------------
                            155 ; Function dibujarMapa
                            156 ; ---------------------------------
   665D                     157 _dibujarMapa::
                            158 ;src/main.c:115: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   665D 2A 5A 66      [16]  159 	ld	hl,(_mapa)
   6660 E5            [11]  160 	push	hl
   6661 21 00 C0      [10]  161 	ld	hl,#0xC000
   6664 E5            [11]  162 	push	hl
   6665 21 2C 28      [10]  163 	ld	hl,#0x282C
   6668 E5            [11]  164 	push	hl
   6669 2E 00         [ 7]  165 	ld	l, #0x00
   666B E5            [11]  166 	push	hl
   666C AF            [ 4]  167 	xor	a, a
   666D F5            [11]  168 	push	af
   666E 33            [ 6]  169 	inc	sp
   666F CD 8C 5A      [17]  170 	call	_cpct_etm_drawTileBox2x4
   6672 C9            [10]  171 	ret
   6673                     172 _mapas:
   6673 C0 4D               173 	.dw _g_map1
   6675 E0 46               174 	.dw _g_map2
   6677 00 40               175 	.dw _g_map3
                            176 ;src/main.c:120: void dibujarProta() {
                            177 ;	---------------------------------
                            178 ; Function dibujarProta
                            179 ; ---------------------------------
   6679                     180 _dibujarProta::
                            181 ;src/main.c:121: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   6679 21 F9 65      [10]  182 	ld	hl, #_prota + 1
   667C 56            [ 7]  183 	ld	d,(hl)
   667D 21 F8 65      [10]  184 	ld	hl, #_prota + 0
   6680 46            [ 7]  185 	ld	b,(hl)
   6681 D5            [11]  186 	push	de
   6682 33            [ 6]  187 	inc	sp
   6683 C5            [11]  188 	push	bc
   6684 33            [ 6]  189 	inc	sp
   6685 21 00 C0      [10]  190 	ld	hl,#0xC000
   6688 E5            [11]  191 	push	hl
   6689 CD 93 65      [17]  192 	call	_cpct_getScreenPtr
   668C EB            [ 4]  193 	ex	de,hl
                            194 ;src/main.c:122: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   668D ED 4B FC 65   [20]  195 	ld	bc, (#_prota + 4)
   6691 21 00 3E      [10]  196 	ld	hl,#_g_tablatrans
   6694 E5            [11]  197 	push	hl
   6695 21 07 16      [10]  198 	ld	hl,#0x1607
   6698 E5            [11]  199 	push	hl
   6699 D5            [11]  200 	push	de
   669A C5            [11]  201 	push	bc
   669B CD B3 65      [17]  202 	call	_cpct_drawSpriteMaskedAlignedTable
   669E C9            [10]  203 	ret
                            204 ;src/main.c:125: void borrarProta() {
                            205 ;	---------------------------------
                            206 ; Function borrarProta
                            207 ; ---------------------------------
   669F                     208 _borrarProta::
   669F DD E5         [15]  209 	push	ix
   66A1 DD 21 00 00   [14]  210 	ld	ix,#0
   66A5 DD 39         [15]  211 	add	ix,sp
   66A7 3B            [ 6]  212 	dec	sp
                            213 ;src/main.c:127: u8 w = 4 + (prota.px & 1);
   66A8 21 FA 65      [10]  214 	ld	hl, #_prota + 2
   66AB 4E            [ 7]  215 	ld	c,(hl)
   66AC 79            [ 4]  216 	ld	a,c
   66AD E6 01         [ 7]  217 	and	a, #0x01
   66AF 47            [ 4]  218 	ld	b,a
   66B0 04            [ 4]  219 	inc	b
   66B1 04            [ 4]  220 	inc	b
   66B2 04            [ 4]  221 	inc	b
   66B3 04            [ 4]  222 	inc	b
                            223 ;src/main.c:130: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   66B4 21 FB 65      [10]  224 	ld	hl, #_prota + 3
   66B7 5E            [ 7]  225 	ld	e,(hl)
   66B8 CB 4B         [ 8]  226 	bit	1, e
   66BA 28 04         [12]  227 	jr	Z,00103$
   66BC 3E 01         [ 7]  228 	ld	a,#0x01
   66BE 18 02         [12]  229 	jr	00104$
   66C0                     230 00103$:
   66C0 3E 00         [ 7]  231 	ld	a,#0x00
   66C2                     232 00104$:
   66C2 C6 06         [ 7]  233 	add	a, #0x06
   66C4 DD 77 FF      [19]  234 	ld	-1 (ix),a
                            235 ;src/main.c:132: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   66C7 FD 2A 5A 66   [20]  236 	ld	iy,(_mapa)
   66CB 16 00         [ 7]  237 	ld	d,#0x00
   66CD 63            [ 4]  238 	ld	h,e
   66CE 6A            [ 4]  239 	ld	l,d
   66CF CB 7A         [ 8]  240 	bit	7, d
   66D1 28 05         [12]  241 	jr	Z,00105$
   66D3 13            [ 6]  242 	inc	de
   66D4 13            [ 6]  243 	inc	de
   66D5 13            [ 6]  244 	inc	de
   66D6 63            [ 4]  245 	ld	h,e
   66D7 6A            [ 4]  246 	ld	l,d
   66D8                     247 00105$:
   66D8 5C            [ 4]  248 	ld	e, h
   66D9 55            [ 4]  249 	ld	d, l
   66DA CB 2A         [ 8]  250 	sra	d
   66DC CB 1B         [ 8]  251 	rr	e
   66DE CB 2A         [ 8]  252 	sra	d
   66E0 CB 1B         [ 8]  253 	rr	e
   66E2 51            [ 4]  254 	ld	d,c
   66E3 CB 3A         [ 8]  255 	srl	d
   66E5 FD E5         [15]  256 	push	iy
   66E7 21 00 C0      [10]  257 	ld	hl,#0xC000
   66EA E5            [11]  258 	push	hl
   66EB 3E 28         [ 7]  259 	ld	a,#0x28
   66ED F5            [11]  260 	push	af
   66EE 33            [ 6]  261 	inc	sp
   66EF DD 7E FF      [19]  262 	ld	a,-1 (ix)
   66F2 F5            [11]  263 	push	af
   66F3 33            [ 6]  264 	inc	sp
   66F4 C5            [11]  265 	push	bc
   66F5 33            [ 6]  266 	inc	sp
   66F6 7B            [ 4]  267 	ld	a,e
   66F7 F5            [11]  268 	push	af
   66F8 33            [ 6]  269 	inc	sp
   66F9 D5            [11]  270 	push	de
   66FA 33            [ 6]  271 	inc	sp
   66FB CD 8C 5A      [17]  272 	call	_cpct_etm_drawTileBox2x4
   66FE 33            [ 6]  273 	inc	sp
   66FF DD E1         [14]  274 	pop	ix
   6701 C9            [10]  275 	ret
                            276 ;src/main.c:137: void redibujarProta() {
                            277 ;	---------------------------------
                            278 ; Function redibujarProta
                            279 ; ---------------------------------
   6702                     280 _redibujarProta::
                            281 ;src/main.c:138: borrarProta();
   6702 CD 9F 66      [17]  282 	call	_borrarProta
                            283 ;src/main.c:139: prota.px = prota.x;
   6705 01 FA 65      [10]  284 	ld	bc,#_prota + 2
   6708 3A F8 65      [13]  285 	ld	a, (#_prota + 0)
   670B 02            [ 7]  286 	ld	(bc),a
                            287 ;src/main.c:140: prota.py = prota.y;
   670C 01 FB 65      [10]  288 	ld	bc,#_prota + 3
   670F 3A F9 65      [13]  289 	ld	a, (#_prota + 1)
   6712 02            [ 7]  290 	ld	(bc),a
                            291 ;src/main.c:141: dibujarProta();
   6713 C3 79 66      [10]  292 	jp  _dibujarProta
                            293 ;src/main.c:144: u8* getTilePtr(u8 x, u8 y) {
                            294 ;	---------------------------------
                            295 ; Function getTilePtr
                            296 ; ---------------------------------
   6716                     297 _getTilePtr::
                            298 ;src/main.c:145: return mapa + (y/4)*g_map1_W + x/2;
   6716 21 03 00      [10]  299 	ld	hl, #3+0
   6719 39            [11]  300 	add	hl, sp
   671A 4E            [ 7]  301 	ld	c, (hl)
   671B CB 39         [ 8]  302 	srl	c
   671D CB 39         [ 8]  303 	srl	c
   671F 06 00         [ 7]  304 	ld	b,#0x00
   6721 69            [ 4]  305 	ld	l, c
   6722 60            [ 4]  306 	ld	h, b
   6723 29            [11]  307 	add	hl, hl
   6724 29            [11]  308 	add	hl, hl
   6725 09            [11]  309 	add	hl, bc
   6726 29            [11]  310 	add	hl, hl
   6727 29            [11]  311 	add	hl, hl
   6728 29            [11]  312 	add	hl, hl
   6729 ED 5B 5A 66   [20]  313 	ld	de,(_mapa)
   672D 19            [11]  314 	add	hl,de
   672E FD 21 02 00   [14]  315 	ld	iy,#2
   6732 FD 39         [15]  316 	add	iy,sp
   6734 FD 4E 00      [19]  317 	ld	c,0 (iy)
   6737 CB 39         [ 8]  318 	srl	c
   6739 59            [ 4]  319 	ld	e,c
   673A 16 00         [ 7]  320 	ld	d,#0x00
   673C 19            [11]  321 	add	hl,de
   673D C9            [10]  322 	ret
                            323 ;src/main.c:148: u8 checkCollision(int direction) { // check optimization
                            324 ;	---------------------------------
                            325 ; Function checkCollision
                            326 ; ---------------------------------
   673E                     327 _checkCollision::
   673E DD E5         [15]  328 	push	ix
   6740 DD 21 00 00   [14]  329 	ld	ix,#0
   6744 DD 39         [15]  330 	add	ix,sp
   6746 21 F8 FF      [10]  331 	ld	hl,#-8
   6749 39            [11]  332 	add	hl,sp
   674A F9            [ 6]  333 	ld	sp,hl
                            334 ;src/main.c:151: switch (direction) {
   674B DD CB 05 7E   [20]  335 	bit	7, 5 (ix)
   674F C2 5B 68      [10]  336 	jp	NZ,00105$
   6752 3E 03         [ 7]  337 	ld	a,#0x03
   6754 DD BE 04      [19]  338 	cp	a, 4 (ix)
   6757 3E 00         [ 7]  339 	ld	a,#0x00
   6759 DD 9E 05      [19]  340 	sbc	a, 5 (ix)
   675C E2 61 67      [10]  341 	jp	PO, 00128$
   675F EE 80         [ 7]  342 	xor	a, #0x80
   6761                     343 00128$:
   6761 FA 5B 68      [10]  344 	jp	M,00105$
   6764 DD 5E 04      [19]  345 	ld	e,4 (ix)
   6767 16 00         [ 7]  346 	ld	d,#0x00
   6769 21 70 67      [10]  347 	ld	hl,#00129$
   676C 19            [11]  348 	add	hl,de
   676D 19            [11]  349 	add	hl,de
   676E 19            [11]  350 	add	hl,de
   676F E9            [ 4]  351 	jp	(hl)
   6770                     352 00129$:
   6770 C3 7C 67      [10]  353 	jp	00101$
   6773 C3 C1 67      [10]  354 	jp	00102$
   6776 C3 01 68      [10]  355 	jp	00103$
   6779 C3 2F 68      [10]  356 	jp	00104$
                            357 ;src/main.c:152: case 0:
   677C                     358 00101$:
                            359 ;src/main.c:153: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   677C 21 F9 65      [10]  360 	ld	hl, #(_prota + 0x0001) + 0
   677F 46            [ 7]  361 	ld	b,(hl)
   6780 3A F8 65      [13]  362 	ld	a, (#_prota + 0)
   6783 C6 04         [ 7]  363 	add	a, #0x04
   6785 C5            [11]  364 	push	bc
   6786 33            [ 6]  365 	inc	sp
   6787 F5            [11]  366 	push	af
   6788 33            [ 6]  367 	inc	sp
   6789 CD 16 67      [17]  368 	call	_getTilePtr
   678C F1            [10]  369 	pop	af
   678D DD 75 FE      [19]  370 	ld	-2 (ix),l
   6790 DD 74 FF      [19]  371 	ld	-1 (ix),h
                            372 ;src/main.c:154: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   6793 3A F9 65      [13]  373 	ld	a, (#(_prota + 0x0001) + 0)
   6796 C6 14         [ 7]  374 	add	a, #0x14
   6798 47            [ 4]  375 	ld	b,a
   6799 3A F8 65      [13]  376 	ld	a, (#_prota + 0)
   679C C6 04         [ 7]  377 	add	a, #0x04
   679E C5            [11]  378 	push	bc
   679F 33            [ 6]  379 	inc	sp
   67A0 F5            [11]  380 	push	af
   67A1 33            [ 6]  381 	inc	sp
   67A2 CD 16 67      [17]  382 	call	_getTilePtr
   67A5 F1            [10]  383 	pop	af
   67A6 4D            [ 4]  384 	ld	c,l
   67A7 44            [ 4]  385 	ld	b,h
                            386 ;src/main.c:155: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   67A8 3A F9 65      [13]  387 	ld	a, (#(_prota + 0x0001) + 0)
   67AB C6 0B         [ 7]  388 	add	a, #0x0B
   67AD 57            [ 4]  389 	ld	d,a
   67AE 3A F8 65      [13]  390 	ld	a, (#_prota + 0)
   67B1 C6 04         [ 7]  391 	add	a, #0x04
   67B3 C5            [11]  392 	push	bc
   67B4 D5            [11]  393 	push	de
   67B5 33            [ 6]  394 	inc	sp
   67B6 F5            [11]  395 	push	af
   67B7 33            [ 6]  396 	inc	sp
   67B8 CD 16 67      [17]  397 	call	_getTilePtr
   67BB F1            [10]  398 	pop	af
   67BC EB            [ 4]  399 	ex	de,hl
   67BD C1            [10]  400 	pop	bc
                            401 ;src/main.c:156: break;
   67BE C3 5B 68      [10]  402 	jp	00105$
                            403 ;src/main.c:157: case 1:
   67C1                     404 00102$:
                            405 ;src/main.c:158: headTile  = getTilePtr(prota.x - 1, prota.y);
   67C1 21 F9 65      [10]  406 	ld	hl, #(_prota + 0x0001) + 0
   67C4 46            [ 7]  407 	ld	b,(hl)
   67C5 21 F8 65      [10]  408 	ld	hl, #_prota + 0
   67C8 56            [ 7]  409 	ld	d,(hl)
   67C9 15            [ 4]  410 	dec	d
   67CA 4A            [ 4]  411 	ld	c, d
   67CB C5            [11]  412 	push	bc
   67CC CD 16 67      [17]  413 	call	_getTilePtr
   67CF F1            [10]  414 	pop	af
   67D0 DD 75 FE      [19]  415 	ld	-2 (ix),l
   67D3 DD 74 FF      [19]  416 	ld	-1 (ix),h
                            417 ;src/main.c:159: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
   67D6 3A F9 65      [13]  418 	ld	a, (#(_prota + 0x0001) + 0)
   67D9 C6 14         [ 7]  419 	add	a, #0x14
   67DB 47            [ 4]  420 	ld	b,a
   67DC 21 F8 65      [10]  421 	ld	hl, #_prota + 0
   67DF 56            [ 7]  422 	ld	d,(hl)
   67E0 15            [ 4]  423 	dec	d
   67E1 4A            [ 4]  424 	ld	c, d
   67E2 C5            [11]  425 	push	bc
   67E3 CD 16 67      [17]  426 	call	_getTilePtr
   67E6 F1            [10]  427 	pop	af
   67E7 4D            [ 4]  428 	ld	c,l
   67E8 44            [ 4]  429 	ld	b,h
                            430 ;src/main.c:160: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
   67E9 3A F9 65      [13]  431 	ld	a, (#(_prota + 0x0001) + 0)
   67EC C6 0B         [ 7]  432 	add	a, #0x0B
   67EE 57            [ 4]  433 	ld	d,a
   67EF 3A F8 65      [13]  434 	ld	a, (#_prota + 0)
   67F2 C6 FF         [ 7]  435 	add	a,#0xFF
   67F4 C5            [11]  436 	push	bc
   67F5 D5            [11]  437 	push	de
   67F6 33            [ 6]  438 	inc	sp
   67F7 F5            [11]  439 	push	af
   67F8 33            [ 6]  440 	inc	sp
   67F9 CD 16 67      [17]  441 	call	_getTilePtr
   67FC F1            [10]  442 	pop	af
   67FD EB            [ 4]  443 	ex	de,hl
   67FE C1            [10]  444 	pop	bc
                            445 ;src/main.c:161: break;
   67FF 18 5A         [12]  446 	jr	00105$
                            447 ;src/main.c:162: case 2:
   6801                     448 00103$:
                            449 ;src/main.c:163: headTile   = getTilePtr(prota.x, prota.y - 2);
   6801 21 F9 65      [10]  450 	ld	hl, #(_prota + 0x0001) + 0
   6804 46            [ 7]  451 	ld	b,(hl)
   6805 05            [ 4]  452 	dec	b
   6806 05            [ 4]  453 	dec	b
   6807 21 F8 65      [10]  454 	ld	hl, #_prota + 0
   680A 4E            [ 7]  455 	ld	c, (hl)
   680B C5            [11]  456 	push	bc
   680C CD 16 67      [17]  457 	call	_getTilePtr
   680F F1            [10]  458 	pop	af
   6810 DD 75 FE      [19]  459 	ld	-2 (ix),l
   6813 DD 74 FF      [19]  460 	ld	-1 (ix),h
                            461 ;src/main.c:164: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
   6816 3A F9 65      [13]  462 	ld	a, (#(_prota + 0x0001) + 0)
   6819 47            [ 4]  463 	ld	b,a
   681A 05            [ 4]  464 	dec	b
   681B 05            [ 4]  465 	dec	b
   681C 3A F8 65      [13]  466 	ld	a, (#_prota + 0)
   681F C6 03         [ 7]  467 	add	a, #0x03
   6821 C5            [11]  468 	push	bc
   6822 33            [ 6]  469 	inc	sp
   6823 F5            [11]  470 	push	af
   6824 33            [ 6]  471 	inc	sp
   6825 CD 16 67      [17]  472 	call	_getTilePtr
   6828 F1            [10]  473 	pop	af
   6829 4D            [ 4]  474 	ld	c,l
   682A 44            [ 4]  475 	ld	b,h
                            476 ;src/main.c:165: *waistTile = 0;
   682B AF            [ 4]  477 	xor	a, a
   682C 12            [ 7]  478 	ld	(de),a
                            479 ;src/main.c:166: break;
   682D 18 2C         [12]  480 	jr	00105$
                            481 ;src/main.c:167: case 3:
   682F                     482 00104$:
                            483 ;src/main.c:168: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
   682F 3A F9 65      [13]  484 	ld	a, (#(_prota + 0x0001) + 0)
   6832 C6 16         [ 7]  485 	add	a, #0x16
   6834 47            [ 4]  486 	ld	b,a
   6835 21 F8 65      [10]  487 	ld	hl, #_prota + 0
   6838 4E            [ 7]  488 	ld	c, (hl)
   6839 C5            [11]  489 	push	bc
   683A CD 16 67      [17]  490 	call	_getTilePtr
   683D F1            [10]  491 	pop	af
   683E DD 75 FE      [19]  492 	ld	-2 (ix),l
   6841 DD 74 FF      [19]  493 	ld	-1 (ix),h
                            494 ;src/main.c:169: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   6844 3A F9 65      [13]  495 	ld	a, (#(_prota + 0x0001) + 0)
   6847 C6 16         [ 7]  496 	add	a, #0x16
   6849 47            [ 4]  497 	ld	b,a
   684A 3A F8 65      [13]  498 	ld	a, (#_prota + 0)
   684D C6 03         [ 7]  499 	add	a, #0x03
   684F C5            [11]  500 	push	bc
   6850 33            [ 6]  501 	inc	sp
   6851 F5            [11]  502 	push	af
   6852 33            [ 6]  503 	inc	sp
   6853 CD 16 67      [17]  504 	call	_getTilePtr
   6856 F1            [10]  505 	pop	af
   6857 4D            [ 4]  506 	ld	c,l
   6858 44            [ 4]  507 	ld	b,h
                            508 ;src/main.c:170: *waistTile = 0;
   6859 AF            [ 4]  509 	xor	a, a
   685A 12            [ 7]  510 	ld	(de),a
                            511 ;src/main.c:172: }
   685B                     512 00105$:
                            513 ;src/main.c:174: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   685B DD 6E FE      [19]  514 	ld	l,-2 (ix)
   685E DD 66 FF      [19]  515 	ld	h,-1 (ix)
   6861 6E            [ 7]  516 	ld	l,(hl)
   6862 3E 02         [ 7]  517 	ld	a,#0x02
   6864 95            [ 4]  518 	sub	a, l
   6865 38 0E         [12]  519 	jr	C,00106$
   6867 0A            [ 7]  520 	ld	a,(bc)
   6868 4F            [ 4]  521 	ld	c,a
   6869 3E 02         [ 7]  522 	ld	a,#0x02
   686B 91            [ 4]  523 	sub	a, c
   686C 38 07         [12]  524 	jr	C,00106$
   686E 1A            [ 7]  525 	ld	a,(de)
   686F 4F            [ 4]  526 	ld	c,a
   6870 3E 02         [ 7]  527 	ld	a,#0x02
   6872 91            [ 4]  528 	sub	a, c
   6873 30 04         [12]  529 	jr	NC,00107$
   6875                     530 00106$:
                            531 ;src/main.c:175: return 1;
   6875 2E 01         [ 7]  532 	ld	l,#0x01
   6877 18 02         [12]  533 	jr	00110$
   6879                     534 00107$:
                            535 ;src/main.c:177: return 0;
   6879 2E 00         [ 7]  536 	ld	l,#0x00
   687B                     537 00110$:
   687B DD F9         [10]  538 	ld	sp, ix
   687D DD E1         [14]  539 	pop	ix
   687F C9            [10]  540 	ret
                            541 ;src/main.c:181: void dibujarEnemigo() {
                            542 ;	---------------------------------
                            543 ; Function dibujarEnemigo
                            544 ; ---------------------------------
   6880                     545 _dibujarEnemigo::
                            546 ;src/main.c:182: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy.x, enemy.y);
   6880 21 F1 65      [10]  547 	ld	hl, #_enemy + 1
   6883 56            [ 7]  548 	ld	d,(hl)
   6884 21 F0 65      [10]  549 	ld	hl, #_enemy + 0
   6887 46            [ 7]  550 	ld	b,(hl)
   6888 D5            [11]  551 	push	de
   6889 33            [ 6]  552 	inc	sp
   688A C5            [11]  553 	push	bc
   688B 33            [ 6]  554 	inc	sp
   688C 21 00 C0      [10]  555 	ld	hl,#0xC000
   688F E5            [11]  556 	push	hl
   6890 CD 93 65      [17]  557 	call	_cpct_getScreenPtr
   6893 EB            [ 4]  558 	ex	de,hl
                            559 ;src/main.c:183: cpct_drawSpriteMaskedAlignedTable (enemy.sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   6894 ED 4B F4 65   [20]  560 	ld	bc, (#_enemy + 4)
   6898 21 00 3E      [10]  561 	ld	hl,#_g_tablatrans
   689B E5            [11]  562 	push	hl
   689C 21 04 16      [10]  563 	ld	hl,#0x1604
   689F E5            [11]  564 	push	hl
   68A0 D5            [11]  565 	push	de
   68A1 C5            [11]  566 	push	bc
   68A2 CD B3 65      [17]  567 	call	_cpct_drawSpriteMaskedAlignedTable
   68A5 C9            [10]  568 	ret
                            569 ;src/main.c:186: void borrarEnemigo() {
                            570 ;	---------------------------------
                            571 ; Function borrarEnemigo
                            572 ; ---------------------------------
   68A6                     573 _borrarEnemigo::
   68A6 DD E5         [15]  574 	push	ix
   68A8 DD 21 00 00   [14]  575 	ld	ix,#0
   68AC DD 39         [15]  576 	add	ix,sp
   68AE 3B            [ 6]  577 	dec	sp
                            578 ;src/main.c:188: u8 w = 4 + (enemy.px & 1);
   68AF 21 F2 65      [10]  579 	ld	hl, #_enemy + 2
   68B2 4E            [ 7]  580 	ld	c,(hl)
   68B3 79            [ 4]  581 	ld	a,c
   68B4 E6 01         [ 7]  582 	and	a, #0x01
   68B6 47            [ 4]  583 	ld	b,a
   68B7 04            [ 4]  584 	inc	b
   68B8 04            [ 4]  585 	inc	b
   68B9 04            [ 4]  586 	inc	b
   68BA 04            [ 4]  587 	inc	b
                            588 ;src/main.c:191: u8 h = 7 + (enemy.py & 2 ? 1 : 0);
   68BB 21 F3 65      [10]  589 	ld	hl, #_enemy + 3
   68BE 5E            [ 7]  590 	ld	e,(hl)
   68BF CB 4B         [ 8]  591 	bit	1, e
   68C1 28 04         [12]  592 	jr	Z,00103$
   68C3 3E 01         [ 7]  593 	ld	a,#0x01
   68C5 18 02         [12]  594 	jr	00104$
   68C7                     595 00103$:
   68C7 3E 00         [ 7]  596 	ld	a,#0x00
   68C9                     597 00104$:
   68C9 C6 07         [ 7]  598 	add	a, #0x07
   68CB DD 77 FF      [19]  599 	ld	-1 (ix),a
                            600 ;src/main.c:193: cpct_etm_drawTileBox2x4 (enemy.px / 2, (enemy.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   68CE FD 2A 5A 66   [20]  601 	ld	iy,(_mapa)
   68D2 16 00         [ 7]  602 	ld	d,#0x00
   68D4 63            [ 4]  603 	ld	h,e
   68D5 6A            [ 4]  604 	ld	l,d
   68D6 CB 7A         [ 8]  605 	bit	7, d
   68D8 28 05         [12]  606 	jr	Z,00105$
   68DA 13            [ 6]  607 	inc	de
   68DB 13            [ 6]  608 	inc	de
   68DC 13            [ 6]  609 	inc	de
   68DD 63            [ 4]  610 	ld	h,e
   68DE 6A            [ 4]  611 	ld	l,d
   68DF                     612 00105$:
   68DF 5C            [ 4]  613 	ld	e, h
   68E0 55            [ 4]  614 	ld	d, l
   68E1 CB 2A         [ 8]  615 	sra	d
   68E3 CB 1B         [ 8]  616 	rr	e
   68E5 CB 2A         [ 8]  617 	sra	d
   68E7 CB 1B         [ 8]  618 	rr	e
   68E9 51            [ 4]  619 	ld	d,c
   68EA CB 3A         [ 8]  620 	srl	d
   68EC FD E5         [15]  621 	push	iy
   68EE 21 00 C0      [10]  622 	ld	hl,#0xC000
   68F1 E5            [11]  623 	push	hl
   68F2 3E 28         [ 7]  624 	ld	a,#0x28
   68F4 F5            [11]  625 	push	af
   68F5 33            [ 6]  626 	inc	sp
   68F6 DD 7E FF      [19]  627 	ld	a,-1 (ix)
   68F9 F5            [11]  628 	push	af
   68FA 33            [ 6]  629 	inc	sp
   68FB C5            [11]  630 	push	bc
   68FC 33            [ 6]  631 	inc	sp
   68FD 7B            [ 4]  632 	ld	a,e
   68FE F5            [11]  633 	push	af
   68FF 33            [ 6]  634 	inc	sp
   6900 D5            [11]  635 	push	de
   6901 33            [ 6]  636 	inc	sp
   6902 CD 8C 5A      [17]  637 	call	_cpct_etm_drawTileBox2x4
   6905 33            [ 6]  638 	inc	sp
   6906 DD E1         [14]  639 	pop	ix
   6908 C9            [10]  640 	ret
                            641 ;src/main.c:198: void redibujarEnemigo() {
                            642 ;	---------------------------------
                            643 ; Function redibujarEnemigo
                            644 ; ---------------------------------
   6909                     645 _redibujarEnemigo::
                            646 ;src/main.c:199: borrarEnemigo();
   6909 CD A6 68      [17]  647 	call	_borrarEnemigo
                            648 ;src/main.c:200: enemy.px = enemy.x;
   690C 01 F2 65      [10]  649 	ld	bc,#_enemy + 2
   690F 3A F0 65      [13]  650 	ld	a, (#_enemy + 0)
   6912 02            [ 7]  651 	ld	(bc),a
                            652 ;src/main.c:201: enemy.py = enemy.y;
   6913 01 F3 65      [10]  653 	ld	bc,#_enemy + 3
   6916 3A F1 65      [13]  654 	ld	a, (#_enemy + 1)
   6919 02            [ 7]  655 	ld	(bc),a
                            656 ;src/main.c:202: dibujarEnemigo();
   691A C3 80 68      [10]  657 	jp  _dibujarEnemigo
                            658 ;src/main.c:205: void moverEnemigo(){
                            659 ;	---------------------------------
                            660 ; Function moverEnemigo
                            661 ; ---------------------------------
   691D                     662 _moverEnemigo::
                            663 ;src/main.c:207: if(enemy.mira == M_abajo){
   691D 21 F7 65      [10]  664 	ld	hl, #(_enemy + 0x0007) + 0
   6920 46            [ 7]  665 	ld	b,(hl)
                            666 ;src/main.c:208: if( *getTilePtr(enemy.x, enemy.y + G_ENEMY_H + 2) <= 2
   6921 11 F1 65      [10]  667 	ld	de,#_enemy + 1
   6924 1A            [ 7]  668 	ld	a,(de)
   6925 4F            [ 4]  669 	ld	c,a
   6926 21 F0 65      [10]  670 	ld	hl, #_enemy + 0
   6929 6E            [ 7]  671 	ld	l,(hl)
                            672 ;src/main.c:207: if(enemy.mira == M_abajo){
   692A 78            [ 4]  673 	ld	a,b
   692B D6 03         [ 7]  674 	sub	a, #0x03
   692D 20 57         [12]  675 	jr	NZ,00112$
                            676 ;src/main.c:208: if( *getTilePtr(enemy.x, enemy.y + G_ENEMY_H + 2) <= 2
   692F 79            [ 4]  677 	ld	a,c
   6930 C6 18         [ 7]  678 	add	a, #0x18
   6932 67            [ 4]  679 	ld	h,a
   6933 D5            [11]  680 	push	de
   6934 E5            [11]  681 	push	hl
   6935 33            [ 6]  682 	inc	sp
   6936 7D            [ 4]  683 	ld	a,l
   6937 F5            [11]  684 	push	af
   6938 33            [ 6]  685 	inc	sp
   6939 CD 16 67      [17]  686 	call	_getTilePtr
   693C F1            [10]  687 	pop	af
   693D D1            [10]  688 	pop	de
   693E 4E            [ 7]  689 	ld	c,(hl)
   693F 3E 02         [ 7]  690 	ld	a,#0x02
   6941 91            [ 4]  691 	sub	a, c
   6942 38 3C         [12]  692 	jr	C,00102$
                            693 ;src/main.c:209: && *getTilePtr(enemy.x + G_ENEMY_W / 2, enemy.y + G_ENEMY_H + 2) <= 2
   6944 1A            [ 7]  694 	ld	a,(de)
   6945 C6 18         [ 7]  695 	add	a, #0x18
   6947 4F            [ 4]  696 	ld	c,a
   6948 3A F0 65      [13]  697 	ld	a, (#_enemy + 0)
   694B 47            [ 4]  698 	ld	b,a
   694C 04            [ 4]  699 	inc	b
   694D 04            [ 4]  700 	inc	b
   694E D5            [11]  701 	push	de
   694F 79            [ 4]  702 	ld	a,c
   6950 F5            [11]  703 	push	af
   6951 33            [ 6]  704 	inc	sp
   6952 C5            [11]  705 	push	bc
   6953 33            [ 6]  706 	inc	sp
   6954 CD 16 67      [17]  707 	call	_getTilePtr
   6957 F1            [10]  708 	pop	af
   6958 D1            [10]  709 	pop	de
   6959 4E            [ 7]  710 	ld	c,(hl)
   695A 3E 02         [ 7]  711 	ld	a,#0x02
   695C 91            [ 4]  712 	sub	a, c
   695D 38 21         [12]  713 	jr	C,00102$
                            714 ;src/main.c:210: && *getTilePtr(enemy.x + G_ENEMY_W, enemy.y + G_ENEMY_H + 2) <= 2)
   695F 1A            [ 7]  715 	ld	a,(de)
   6960 C6 18         [ 7]  716 	add	a, #0x18
   6962 47            [ 4]  717 	ld	b,a
   6963 3A F0 65      [13]  718 	ld	a, (#_enemy + 0)
   6966 C6 04         [ 7]  719 	add	a, #0x04
   6968 D5            [11]  720 	push	de
   6969 C5            [11]  721 	push	bc
   696A 33            [ 6]  722 	inc	sp
   696B F5            [11]  723 	push	af
   696C 33            [ 6]  724 	inc	sp
   696D CD 16 67      [17]  725 	call	_getTilePtr
   6970 F1            [10]  726 	pop	af
   6971 D1            [10]  727 	pop	de
   6972 4E            [ 7]  728 	ld	c,(hl)
   6973 3E 02         [ 7]  729 	ld	a,#0x02
   6975 91            [ 4]  730 	sub	a, c
   6976 38 08         [12]  731 	jr	C,00102$
                            732 ;src/main.c:213: enemy.y++;
   6978 1A            [ 7]  733 	ld	a,(de)
   6979 3C            [ 4]  734 	inc	a
   697A 12            [ 7]  735 	ld	(de),a
                            736 ;src/main.c:214: enemy.y++;
   697B 3C            [ 4]  737 	inc	a
   697C 12            [ 7]  738 	ld	(de),a
                            739 ;src/main.c:215: redibujarEnemigo();
   697D C3 09 69      [10]  740 	jp  _redibujarEnemigo
   6980                     741 00102$:
                            742 ;src/main.c:217: enemy.mira = M_arriba;
   6980 21 F7 65      [10]  743 	ld	hl,#(_enemy + 0x0007)
   6983 36 02         [10]  744 	ld	(hl),#0x02
   6985 C9            [10]  745 	ret
   6986                     746 00112$:
                            747 ;src/main.c:221: if( *getTilePtr(enemy.x, enemy.y - 2) <= 2
   6986 61            [ 4]  748 	ld	h,c
   6987 25            [ 4]  749 	dec	h
   6988 25            [ 4]  750 	dec	h
   6989 D5            [11]  751 	push	de
   698A E5            [11]  752 	push	hl
   698B 33            [ 6]  753 	inc	sp
   698C 7D            [ 4]  754 	ld	a,l
   698D F5            [11]  755 	push	af
   698E 33            [ 6]  756 	inc	sp
   698F CD 16 67      [17]  757 	call	_getTilePtr
   6992 F1            [10]  758 	pop	af
   6993 D1            [10]  759 	pop	de
   6994 4E            [ 7]  760 	ld	c,(hl)
   6995 3E 02         [ 7]  761 	ld	a,#0x02
   6997 91            [ 4]  762 	sub	a, c
   6998 38 3C         [12]  763 	jr	C,00107$
                            764 ;src/main.c:222: && *getTilePtr(enemy.x + G_ENEMY_W / 2, enemy.y - 2) <= 2
   699A 1A            [ 7]  765 	ld	a,(de)
   699B 47            [ 4]  766 	ld	b,a
   699C 05            [ 4]  767 	dec	b
   699D 05            [ 4]  768 	dec	b
   699E 3A F0 65      [13]  769 	ld	a, (#_enemy + 0)
   69A1 C6 02         [ 7]  770 	add	a, #0x02
   69A3 D5            [11]  771 	push	de
   69A4 C5            [11]  772 	push	bc
   69A5 33            [ 6]  773 	inc	sp
   69A6 F5            [11]  774 	push	af
   69A7 33            [ 6]  775 	inc	sp
   69A8 CD 16 67      [17]  776 	call	_getTilePtr
   69AB F1            [10]  777 	pop	af
   69AC D1            [10]  778 	pop	de
   69AD 4E            [ 7]  779 	ld	c,(hl)
   69AE 3E 02         [ 7]  780 	ld	a,#0x02
   69B0 91            [ 4]  781 	sub	a, c
   69B1 38 23         [12]  782 	jr	C,00107$
                            783 ;src/main.c:223: && *getTilePtr(enemy.x + G_ENEMY_W, enemy.y - 2) <= 2)
   69B3 1A            [ 7]  784 	ld	a,(de)
   69B4 47            [ 4]  785 	ld	b,a
   69B5 05            [ 4]  786 	dec	b
   69B6 05            [ 4]  787 	dec	b
   69B7 3A F0 65      [13]  788 	ld	a, (#_enemy + 0)
   69BA C6 04         [ 7]  789 	add	a, #0x04
   69BC D5            [11]  790 	push	de
   69BD C5            [11]  791 	push	bc
   69BE 33            [ 6]  792 	inc	sp
   69BF F5            [11]  793 	push	af
   69C0 33            [ 6]  794 	inc	sp
   69C1 CD 16 67      [17]  795 	call	_getTilePtr
   69C4 F1            [10]  796 	pop	af
   69C5 D1            [10]  797 	pop	de
   69C6 4E            [ 7]  798 	ld	c,(hl)
   69C7 3E 02         [ 7]  799 	ld	a,#0x02
   69C9 91            [ 4]  800 	sub	a, c
   69CA 38 0A         [12]  801 	jr	C,00107$
                            802 ;src/main.c:226: enemy.y--;
   69CC 1A            [ 7]  803 	ld	a,(de)
   69CD C6 FF         [ 7]  804 	add	a,#0xFF
   69CF 12            [ 7]  805 	ld	(de),a
                            806 ;src/main.c:227: enemy.y--;
   69D0 C6 FF         [ 7]  807 	add	a,#0xFF
   69D2 12            [ 7]  808 	ld	(de),a
                            809 ;src/main.c:228: redibujarEnemigo();
   69D3 C3 09 69      [10]  810 	jp  _redibujarEnemigo
   69D6                     811 00107$:
                            812 ;src/main.c:230: enemy.mira = M_abajo;
   69D6 21 F7 65      [10]  813 	ld	hl,#(_enemy + 0x0007)
   69D9 36 03         [10]  814 	ld	(hl),#0x03
   69DB C9            [10]  815 	ret
                            816 ;src/main.c:235: void avanzarMapa() {
                            817 ;	---------------------------------
                            818 ; Function avanzarMapa
                            819 ; ---------------------------------
   69DC                     820 _avanzarMapa::
                            821 ;src/main.c:236: if(num_mapa < NUM_MAPAS -1) {
   69DC 3A 5C 66      [13]  822 	ld	a,(#_num_mapa + 0)
   69DF D6 02         [ 7]  823 	sub	a, #0x02
   69E1 D2 16 70      [10]  824 	jp	NC,_menuFin
                            825 ;src/main.c:237: mapa = mapas[++num_mapa];
   69E4 21 5C 66      [10]  826 	ld	hl, #_num_mapa+0
   69E7 34            [11]  827 	inc	(hl)
   69E8 FD 21 5C 66   [14]  828 	ld	iy,#_num_mapa
   69EC FD 6E 00      [19]  829 	ld	l,0 (iy)
   69EF 26 00         [ 7]  830 	ld	h,#0x00
   69F1 29            [11]  831 	add	hl, hl
   69F2 11 73 66      [10]  832 	ld	de,#_mapas
   69F5 19            [11]  833 	add	hl,de
   69F6 7E            [ 7]  834 	ld	a,(hl)
   69F7 FD 21 5A 66   [14]  835 	ld	iy,#_mapa
   69FB FD 77 00      [19]  836 	ld	0 (iy),a
   69FE 23            [ 6]  837 	inc	hl
   69FF 7E            [ 7]  838 	ld	a,(hl)
   6A00 32 5B 66      [13]  839 	ld	(#_mapa + 1),a
                            840 ;src/main.c:238: prota.x = prota.px = 2;
   6A03 21 FA 65      [10]  841 	ld	hl,#(_prota + 0x0002)
   6A06 36 02         [10]  842 	ld	(hl),#0x02
   6A08 21 F8 65      [10]  843 	ld	hl,#_prota
   6A0B 36 02         [10]  844 	ld	(hl),#0x02
                            845 ;src/main.c:239: prota.mover = SI;
   6A0D 21 FE 65      [10]  846 	ld	hl,#(_prota + 0x0006)
                            847 ;src/main.c:240: dibujarMapa();
                            848 ;src/main.c:244: menuFin();
   6A10 36 01         [10]  849 	ld	(hl), #0x01
   6A12 C3 5D 66      [10]  850 	jp	_dibujarMapa
                            851 ;src/main.c:248: void moverIzquierda() {
                            852 ;	---------------------------------
                            853 ; Function moverIzquierda
                            854 ; ---------------------------------
   6A15                     855 _moverIzquierda::
                            856 ;src/main.c:249: prota.mira = M_izquierda;
   6A15 01 F8 65      [10]  857 	ld	bc,#_prota+0
   6A18 21 FF 65      [10]  858 	ld	hl,#(_prota + 0x0007)
   6A1B 36 01         [10]  859 	ld	(hl),#0x01
                            860 ;src/main.c:250: if (!checkCollision(M_izquierda)) {
   6A1D C5            [11]  861 	push	bc
   6A1E 21 01 00      [10]  862 	ld	hl,#0x0001
   6A21 E5            [11]  863 	push	hl
   6A22 CD 3E 67      [17]  864 	call	_checkCollision
   6A25 F1            [10]  865 	pop	af
   6A26 C1            [10]  866 	pop	bc
   6A27 7D            [ 4]  867 	ld	a,l
   6A28 B7            [ 4]  868 	or	a, a
   6A29 C0            [11]  869 	ret	NZ
                            870 ;src/main.c:251: prota.x--;
   6A2A 0A            [ 7]  871 	ld	a,(bc)
   6A2B C6 FF         [ 7]  872 	add	a,#0xFF
   6A2D 02            [ 7]  873 	ld	(bc),a
                            874 ;src/main.c:252: prota.mover = SI;
   6A2E 21 FE 65      [10]  875 	ld	hl,#(_prota + 0x0006)
   6A31 36 01         [10]  876 	ld	(hl),#0x01
                            877 ;src/main.c:253: prota.sprite = g_hero_left;
   6A33 21 46 57      [10]  878 	ld	hl,#_g_hero_left
   6A36 22 FC 65      [16]  879 	ld	((_prota + 0x0004)), hl
   6A39 C9            [10]  880 	ret
                            881 ;src/main.c:257: void moverDerecha() {
                            882 ;	---------------------------------
                            883 ; Function moverDerecha
                            884 ; ---------------------------------
   6A3A                     885 _moverDerecha::
                            886 ;src/main.c:258: prota.mira = M_derecha;
   6A3A 21 FF 65      [10]  887 	ld	hl,#(_prota + 0x0007)
   6A3D 36 00         [10]  888 	ld	(hl),#0x00
                            889 ;src/main.c:259: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   6A3F 21 00 00      [10]  890 	ld	hl,#0x0000
   6A42 E5            [11]  891 	push	hl
   6A43 CD 3E 67      [17]  892 	call	_checkCollision
   6A46 F1            [10]  893 	pop	af
   6A47 45            [ 4]  894 	ld	b,l
   6A48 21 F8 65      [10]  895 	ld	hl, #_prota + 0
   6A4B 4E            [ 7]  896 	ld	c,(hl)
   6A4C 59            [ 4]  897 	ld	e,c
   6A4D 16 00         [ 7]  898 	ld	d,#0x00
   6A4F 21 07 00      [10]  899 	ld	hl,#0x0007
   6A52 19            [11]  900 	add	hl,de
   6A53 11 50 80      [10]  901 	ld	de, #0x8050
   6A56 29            [11]  902 	add	hl, hl
   6A57 3F            [ 4]  903 	ccf
   6A58 CB 1C         [ 8]  904 	rr	h
   6A5A CB 1D         [ 8]  905 	rr	l
   6A5C ED 52         [15]  906 	sbc	hl, de
   6A5E 3E 00         [ 7]  907 	ld	a,#0x00
   6A60 17            [ 4]  908 	rla
   6A61 5F            [ 4]  909 	ld	e,a
   6A62 78            [ 4]  910 	ld	a,b
   6A63 B7            [ 4]  911 	or	a,a
   6A64 20 14         [12]  912 	jr	NZ,00104$
   6A66 B3            [ 4]  913 	or	a,e
   6A67 28 11         [12]  914 	jr	Z,00104$
                            915 ;src/main.c:260: prota.x++;
   6A69 0C            [ 4]  916 	inc	c
   6A6A 21 F8 65      [10]  917 	ld	hl,#_prota
   6A6D 71            [ 7]  918 	ld	(hl),c
                            919 ;src/main.c:261: prota.mover = SI;
   6A6E 21 FE 65      [10]  920 	ld	hl,#(_prota + 0x0006)
   6A71 36 01         [10]  921 	ld	(hl),#0x01
                            922 ;src/main.c:262: prota.sprite = g_hero;
   6A73 21 F0 57      [10]  923 	ld	hl,#_g_hero
   6A76 22 FC 65      [16]  924 	ld	((_prota + 0x0004)), hl
   6A79 C9            [10]  925 	ret
   6A7A                     926 00104$:
                            927 ;src/main.c:264: }else if( prota.x + G_HERO_W >= 80){
   6A7A 7B            [ 4]  928 	ld	a,e
   6A7B B7            [ 4]  929 	or	a, a
   6A7C C0            [11]  930 	ret	NZ
                            931 ;src/main.c:265: avanzarMapa();	
   6A7D C3 DC 69      [10]  932 	jp  _avanzarMapa
                            933 ;src/main.c:269: void moverArriba() {
                            934 ;	---------------------------------
                            935 ; Function moverArriba
                            936 ; ---------------------------------
   6A80                     937 _moverArriba::
                            938 ;src/main.c:270: prota.mira = M_arriba;
   6A80 21 FF 65      [10]  939 	ld	hl,#(_prota + 0x0007)
   6A83 36 02         [10]  940 	ld	(hl),#0x02
                            941 ;src/main.c:271: if (!checkCollision(M_arriba) && (prota.y >= 0)) { // TODO: COMPROBAR
   6A85 21 02 00      [10]  942 	ld	hl,#0x0002
   6A88 E5            [11]  943 	push	hl
   6A89 CD 3E 67      [17]  944 	call	_checkCollision
   6A8C F1            [10]  945 	pop	af
   6A8D 7D            [ 4]  946 	ld	a,l
   6A8E B7            [ 4]  947 	or	a, a
   6A8F C0            [11]  948 	ret	NZ
                            949 ;src/main.c:272: prota.y--;
   6A90 21 F9 65      [10]  950 	ld	hl,#_prota + 1
   6A93 4E            [ 7]  951 	ld	c,(hl)
   6A94 0D            [ 4]  952 	dec	c
   6A95 71            [ 7]  953 	ld	(hl),c
                            954 ;src/main.c:273: prota.y--;
   6A96 0D            [ 4]  955 	dec	c
   6A97 71            [ 7]  956 	ld	(hl),c
                            957 ;src/main.c:274: prota.mover  = SI;
   6A98 21 FE 65      [10]  958 	ld	hl,#(_prota + 0x0006)
   6A9B 36 01         [10]  959 	ld	(hl),#0x01
                            960 ;src/main.c:275: prota.sprite = g_hero_up;
   6A9D 21 AC 56      [10]  961 	ld	hl,#_g_hero_up
   6AA0 22 FC 65      [16]  962 	ld	((_prota + 0x0004)), hl
   6AA3 C9            [10]  963 	ret
                            964 ;src/main.c:279: void moverAbajo() {
                            965 ;	---------------------------------
                            966 ; Function moverAbajo
                            967 ; ---------------------------------
   6AA4                     968 _moverAbajo::
                            969 ;src/main.c:280: prota.mira = M_abajo;
   6AA4 21 FF 65      [10]  970 	ld	hl,#(_prota + 0x0007)
   6AA7 36 03         [10]  971 	ld	(hl),#0x03
                            972 ;src/main.c:281: if (!checkCollision(M_abajo) && (prota.y + G_HERO_H < ALTO_MAPA)) { // TODO: COMPROBAR
   6AA9 21 03 00      [10]  973 	ld	hl,#0x0003
   6AAC E5            [11]  974 	push	hl
   6AAD CD 3E 67      [17]  975 	call	_checkCollision
   6AB0 F1            [10]  976 	pop	af
   6AB1 7D            [ 4]  977 	ld	a,l
   6AB2 B7            [ 4]  978 	or	a, a
   6AB3 C0            [11]  979 	ret	NZ
   6AB4 01 F9 65      [10]  980 	ld	bc,#_prota + 1
   6AB7 0A            [ 7]  981 	ld	a,(bc)
   6AB8 5F            [ 4]  982 	ld	e,a
   6AB9 6B            [ 4]  983 	ld	l,e
   6ABA 26 00         [ 7]  984 	ld	h,#0x00
   6ABC D5            [11]  985 	push	de
   6ABD 11 16 00      [10]  986 	ld	de,#0x0016
   6AC0 19            [11]  987 	add	hl, de
   6AC1 D1            [10]  988 	pop	de
   6AC2 7D            [ 4]  989 	ld	a,l
   6AC3 D6 B0         [ 7]  990 	sub	a, #0xB0
   6AC5 7C            [ 4]  991 	ld	a,h
   6AC6 17            [ 4]  992 	rla
   6AC7 3F            [ 4]  993 	ccf
   6AC8 1F            [ 4]  994 	rra
   6AC9 DE 80         [ 7]  995 	sbc	a, #0x80
   6ACB D0            [11]  996 	ret	NC
                            997 ;src/main.c:282: prota.y++;
   6ACC 7B            [ 4]  998 	ld	a,e
   6ACD 3C            [ 4]  999 	inc	a
   6ACE 02            [ 7] 1000 	ld	(bc),a
                           1001 ;src/main.c:283: prota.y++;
   6ACF 3C            [ 4] 1002 	inc	a
   6AD0 02            [ 7] 1003 	ld	(bc),a
                           1004 ;src/main.c:284: prota.mover  = SI;
   6AD1 21 FE 65      [10] 1005 	ld	hl,#(_prota + 0x0006)
   6AD4 36 01         [10] 1006 	ld	(hl),#0x01
                           1007 ;src/main.c:285: prota.sprite = g_hero_down;
   6AD6 21 12 56      [10] 1008 	ld	hl,#_g_hero_down
   6AD9 22 FC 65      [16] 1009 	ld	((_prota + 0x0004)), hl
   6ADC C9            [10] 1010 	ret
                           1011 ;src/main.c:289: void dibujarCuchillo(TKnife* actual) {
                           1012 ;	---------------------------------
                           1013 ; Function dibujarCuchillo
                           1014 ; ---------------------------------
   6ADD                    1015 _dibujarCuchillo::
   6ADD DD E5         [15] 1016 	push	ix
   6ADF DD 21 00 00   [14] 1017 	ld	ix,#0
   6AE3 DD 39         [15] 1018 	add	ix,sp
   6AE5 F5            [11] 1019 	push	af
   6AE6 F5            [11] 1020 	push	af
                           1021 ;src/main.c:290: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, actual->x, actual->y);
   6AE7 DD 5E 04      [19] 1022 	ld	e,4 (ix)
   6AEA DD 56 05      [19] 1023 	ld	d,5 (ix)
   6AED 6B            [ 4] 1024 	ld	l, e
   6AEE 62            [ 4] 1025 	ld	h, d
   6AEF 23            [ 6] 1026 	inc	hl
   6AF0 46            [ 7] 1027 	ld	b,(hl)
   6AF1 1A            [ 7] 1028 	ld	a,(de)
   6AF2 D5            [11] 1029 	push	de
   6AF3 C5            [11] 1030 	push	bc
   6AF4 33            [ 6] 1031 	inc	sp
   6AF5 F5            [11] 1032 	push	af
   6AF6 33            [ 6] 1033 	inc	sp
   6AF7 21 00 C0      [10] 1034 	ld	hl,#0xC000
   6AFA E5            [11] 1035 	push	hl
   6AFB CD 93 65      [17] 1036 	call	_cpct_getScreenPtr
   6AFE D1            [10] 1037 	pop	de
   6AFF E5            [11] 1038 	push	hl
   6B00 FD E1         [14] 1039 	pop	iy
                           1040 ;src/main.c:291: if(actual->eje == E_X){
   6B02 6B            [ 4] 1041 	ld	l, e
   6B03 62            [ 4] 1042 	ld	h, d
   6B04 01 08 00      [10] 1043 	ld	bc, #0x0008
   6B07 09            [11] 1044 	add	hl, bc
   6B08 4E            [ 7] 1045 	ld	c,(hl)
                           1046 ;src/main.c:292: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   6B09 FD E5         [15] 1047 	push	iy
   6B0B F1            [10] 1048 	pop	af
   6B0C DD 77 FF      [19] 1049 	ld	-1 (ix),a
   6B0F FD E5         [15] 1050 	push	iy
   6B11 3B            [ 6] 1051 	dec	sp
   6B12 F1            [10] 1052 	pop	af
   6B13 33            [ 6] 1053 	inc	sp
   6B14 DD 77 FE      [19] 1054 	ld	-2 (ix),a
   6B17 21 04 00      [10] 1055 	ld	hl,#0x0004
   6B1A 19            [11] 1056 	add	hl,de
   6B1B E3            [19] 1057 	ex	(sp), hl
                           1058 ;src/main.c:291: if(actual->eje == E_X){
   6B1C 79            [ 4] 1059 	ld	a,c
   6B1D B7            [ 4] 1060 	or	a, a
   6B1E 20 1A         [12] 1061 	jr	NZ,00104$
                           1062 ;src/main.c:292: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   6B20 11 00 3E      [10] 1063 	ld	de,#_g_tablatrans+0
   6B23 E1            [10] 1064 	pop	hl
   6B24 E5            [11] 1065 	push	hl
   6B25 4E            [ 7] 1066 	ld	c,(hl)
   6B26 23            [ 6] 1067 	inc	hl
   6B27 46            [ 7] 1068 	ld	b,(hl)
   6B28 D5            [11] 1069 	push	de
   6B29 21 04 04      [10] 1070 	ld	hl,#0x0404
   6B2C E5            [11] 1071 	push	hl
   6B2D DD 6E FE      [19] 1072 	ld	l,-2 (ix)
   6B30 DD 66 FF      [19] 1073 	ld	h,-1 (ix)
   6B33 E5            [11] 1074 	push	hl
   6B34 C5            [11] 1075 	push	bc
   6B35 CD B3 65      [17] 1076 	call	_cpct_drawSpriteMaskedAlignedTable
   6B38 18 1B         [12] 1077 	jr	00106$
   6B3A                    1078 00104$:
                           1079 ;src/main.c:295: else if(actual->eje == E_Y){
   6B3A 0D            [ 4] 1080 	dec	c
   6B3B 20 18         [12] 1081 	jr	NZ,00106$
                           1082 ;src/main.c:296: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   6B3D 11 00 3E      [10] 1083 	ld	de,#_g_tablatrans+0
   6B40 E1            [10] 1084 	pop	hl
   6B41 E5            [11] 1085 	push	hl
   6B42 4E            [ 7] 1086 	ld	c,(hl)
   6B43 23            [ 6] 1087 	inc	hl
   6B44 46            [ 7] 1088 	ld	b,(hl)
   6B45 D5            [11] 1089 	push	de
   6B46 21 02 08      [10] 1090 	ld	hl,#0x0802
   6B49 E5            [11] 1091 	push	hl
   6B4A DD 6E FE      [19] 1092 	ld	l,-2 (ix)
   6B4D DD 66 FF      [19] 1093 	ld	h,-1 (ix)
   6B50 E5            [11] 1094 	push	hl
   6B51 C5            [11] 1095 	push	bc
   6B52 CD B3 65      [17] 1096 	call	_cpct_drawSpriteMaskedAlignedTable
   6B55                    1097 00106$:
   6B55 DD F9         [10] 1098 	ld	sp, ix
   6B57 DD E1         [14] 1099 	pop	ix
   6B59 C9            [10] 1100 	ret
                           1101 ;src/main.c:300: void borrarCuchillo(TKnife* actual) {
                           1102 ;	---------------------------------
                           1103 ; Function borrarCuchillo
                           1104 ; ---------------------------------
   6B5A                    1105 _borrarCuchillo::
   6B5A DD E5         [15] 1106 	push	ix
   6B5C DD 21 00 00   [14] 1107 	ld	ix,#0
   6B60 DD 39         [15] 1108 	add	ix,sp
   6B62 3B            [ 6] 1109 	dec	sp
                           1110 ;src/main.c:301: u8 w = 2 + (actual->px & 1);
   6B63 DD 5E 04      [19] 1111 	ld	e,4 (ix)
   6B66 DD 56 05      [19] 1112 	ld	d,5 (ix)
   6B69 6B            [ 4] 1113 	ld	l, e
   6B6A 62            [ 4] 1114 	ld	h, d
   6B6B 23            [ 6] 1115 	inc	hl
   6B6C 23            [ 6] 1116 	inc	hl
   6B6D 4E            [ 7] 1117 	ld	c,(hl)
   6B6E 79            [ 4] 1118 	ld	a,c
   6B6F E6 01         [ 7] 1119 	and	a, #0x01
   6B71 47            [ 4] 1120 	ld	b,a
   6B72 04            [ 4] 1121 	inc	b
   6B73 04            [ 4] 1122 	inc	b
                           1123 ;src/main.c:302: u8 h = 2 + (actual->py & 3 ? 1 : 0);
   6B74 EB            [ 4] 1124 	ex	de,hl
   6B75 23            [ 6] 1125 	inc	hl
   6B76 23            [ 6] 1126 	inc	hl
   6B77 23            [ 6] 1127 	inc	hl
   6B78 5E            [ 7] 1128 	ld	e,(hl)
   6B79 7B            [ 4] 1129 	ld	a,e
   6B7A E6 03         [ 7] 1130 	and	a, #0x03
   6B7C 28 04         [12] 1131 	jr	Z,00103$
   6B7E 3E 01         [ 7] 1132 	ld	a,#0x01
   6B80 18 02         [12] 1133 	jr	00104$
   6B82                    1134 00103$:
   6B82 3E 00         [ 7] 1135 	ld	a,#0x00
   6B84                    1136 00104$:
   6B84 C6 02         [ 7] 1137 	add	a, #0x02
   6B86 DD 77 FF      [19] 1138 	ld	-1 (ix),a
                           1139 ;src/main.c:303: cpct_etm_drawTileBox2x4 (actual->px / 2, (actual->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   6B89 FD 2A 5A 66   [20] 1140 	ld	iy,(_mapa)
   6B8D 16 00         [ 7] 1141 	ld	d,#0x00
   6B8F 63            [ 4] 1142 	ld	h,e
   6B90 6A            [ 4] 1143 	ld	l,d
   6B91 CB 7A         [ 8] 1144 	bit	7, d
   6B93 28 05         [12] 1145 	jr	Z,00105$
   6B95 13            [ 6] 1146 	inc	de
   6B96 13            [ 6] 1147 	inc	de
   6B97 13            [ 6] 1148 	inc	de
   6B98 63            [ 4] 1149 	ld	h,e
   6B99 6A            [ 4] 1150 	ld	l,d
   6B9A                    1151 00105$:
   6B9A 5C            [ 4] 1152 	ld	e, h
   6B9B 55            [ 4] 1153 	ld	d, l
   6B9C CB 2A         [ 8] 1154 	sra	d
   6B9E CB 1B         [ 8] 1155 	rr	e
   6BA0 CB 2A         [ 8] 1156 	sra	d
   6BA2 CB 1B         [ 8] 1157 	rr	e
   6BA4 51            [ 4] 1158 	ld	d,c
   6BA5 CB 3A         [ 8] 1159 	srl	d
   6BA7 FD E5         [15] 1160 	push	iy
   6BA9 21 00 C0      [10] 1161 	ld	hl,#0xC000
   6BAC E5            [11] 1162 	push	hl
   6BAD 3E 28         [ 7] 1163 	ld	a,#0x28
   6BAF F5            [11] 1164 	push	af
   6BB0 33            [ 6] 1165 	inc	sp
   6BB1 DD 7E FF      [19] 1166 	ld	a,-1 (ix)
   6BB4 F5            [11] 1167 	push	af
   6BB5 33            [ 6] 1168 	inc	sp
   6BB6 C5            [11] 1169 	push	bc
   6BB7 33            [ 6] 1170 	inc	sp
   6BB8 7B            [ 4] 1171 	ld	a,e
   6BB9 F5            [11] 1172 	push	af
   6BBA 33            [ 6] 1173 	inc	sp
   6BBB D5            [11] 1174 	push	de
   6BBC 33            [ 6] 1175 	inc	sp
   6BBD CD 8C 5A      [17] 1176 	call	_cpct_etm_drawTileBox2x4
   6BC0 33            [ 6] 1177 	inc	sp
   6BC1 DD E1         [14] 1178 	pop	ix
   6BC3 C9            [10] 1179 	ret
                           1180 ;src/main.c:306: void redibujarCuchillo(TKnife* actual) {
                           1181 ;	---------------------------------
                           1182 ; Function redibujarCuchillo
                           1183 ; ---------------------------------
   6BC4                    1184 _redibujarCuchillo::
   6BC4 DD E5         [15] 1185 	push	ix
   6BC6 DD 21 00 00   [14] 1186 	ld	ix,#0
   6BCA DD 39         [15] 1187 	add	ix,sp
                           1188 ;src/main.c:307: borrarCuchillo(actual);
   6BCC DD 6E 04      [19] 1189 	ld	l,4 (ix)
   6BCF DD 66 05      [19] 1190 	ld	h,5 (ix)
   6BD2 E5            [11] 1191 	push	hl
   6BD3 CD 5A 6B      [17] 1192 	call	_borrarCuchillo
   6BD6 F1            [10] 1193 	pop	af
                           1194 ;src/main.c:308: actual->px = actual->x;
   6BD7 DD 4E 04      [19] 1195 	ld	c,4 (ix)
   6BDA DD 46 05      [19] 1196 	ld	b,5 (ix)
   6BDD 59            [ 4] 1197 	ld	e, c
   6BDE 50            [ 4] 1198 	ld	d, b
   6BDF 13            [ 6] 1199 	inc	de
   6BE0 13            [ 6] 1200 	inc	de
   6BE1 0A            [ 7] 1201 	ld	a,(bc)
   6BE2 12            [ 7] 1202 	ld	(de),a
                           1203 ;src/main.c:309: actual->py = actual->y;
   6BE3 59            [ 4] 1204 	ld	e, c
   6BE4 50            [ 4] 1205 	ld	d, b
   6BE5 13            [ 6] 1206 	inc	de
   6BE6 13            [ 6] 1207 	inc	de
   6BE7 13            [ 6] 1208 	inc	de
   6BE8 69            [ 4] 1209 	ld	l, c
   6BE9 60            [ 4] 1210 	ld	h, b
   6BEA 23            [ 6] 1211 	inc	hl
   6BEB 7E            [ 7] 1212 	ld	a,(hl)
   6BEC 12            [ 7] 1213 	ld	(de),a
                           1214 ;src/main.c:310: dibujarCuchillo(actual);
   6BED C5            [11] 1215 	push	bc
   6BEE CD DD 6A      [17] 1216 	call	_dibujarCuchillo
   6BF1 F1            [10] 1217 	pop	af
   6BF2 DD E1         [14] 1218 	pop	ix
   6BF4 C9            [10] 1219 	ret
                           1220 ;src/main.c:314: void lanzarCuchillo(){
                           1221 ;	---------------------------------
                           1222 ; Function lanzarCuchillo
                           1223 ; ---------------------------------
   6BF5                    1224 _lanzarCuchillo::
   6BF5 DD E5         [15] 1225 	push	ix
   6BF7 DD 21 00 00   [14] 1226 	ld	ix,#0
   6BFB DD 39         [15] 1227 	add	ix,sp
   6BFD 21 F6 FF      [10] 1228 	ld	hl,#-10
   6C00 39            [11] 1229 	add	hl,sp
   6C01 F9            [ 6] 1230 	ld	sp,hl
                           1231 ;src/main.c:316: TKnife* actual = cu;
   6C02 01 00 66      [10] 1232 	ld	bc,#_cu+0
                           1233 ;src/main.c:319: while(i>0 && actual->lanzado){
   6C05 1E 0A         [ 7] 1234 	ld	e,#0x0A
   6C07                    1235 00102$:
   6C07 21 06 00      [10] 1236 	ld	hl,#0x0006
   6C0A 09            [11] 1237 	add	hl,bc
   6C0B E3            [19] 1238 	ex	(sp), hl
   6C0C 7B            [ 4] 1239 	ld	a,e
   6C0D B7            [ 4] 1240 	or	a, a
   6C0E 28 0F         [12] 1241 	jr	Z,00104$
   6C10 E1            [10] 1242 	pop	hl
   6C11 E5            [11] 1243 	push	hl
   6C12 7E            [ 7] 1244 	ld	a,(hl)
   6C13 B7            [ 4] 1245 	or	a, a
   6C14 28 09         [12] 1246 	jr	Z,00104$
                           1247 ;src/main.c:320: --i;
   6C16 1D            [ 4] 1248 	dec	e
                           1249 ;src/main.c:321: actual++;
   6C17 21 09 00      [10] 1250 	ld	hl,#0x0009
   6C1A 09            [11] 1251 	add	hl,bc
   6C1B 4D            [ 4] 1252 	ld	c,l
   6C1C 44            [ 4] 1253 	ld	b,h
   6C1D 18 E8         [12] 1254 	jr	00102$
   6C1F                    1255 00104$:
                           1256 ;src/main.c:324: if(i>0 && !actual->lanzado){
   6C1F 7B            [ 4] 1257 	ld	a,e
   6C20 B7            [ 4] 1258 	or	a, a
   6C21 CA B6 6D      [10] 1259 	jp	Z,00127$
   6C24 E1            [10] 1260 	pop	hl
   6C25 E5            [11] 1261 	push	hl
   6C26 7E            [ 7] 1262 	ld	a,(hl)
   6C27 B7            [ 4] 1263 	or	a, a
   6C28 C2 B6 6D      [10] 1264 	jp	NZ,00127$
                           1265 ;src/main.c:326: if(prota.mira == M_derecha){
   6C2B 21 FF 65      [10] 1266 	ld	hl, #_prota + 7
   6C2E 5E            [ 7] 1267 	ld	e,(hl)
                           1268 ;src/main.c:328: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
                           1269 ;src/main.c:330: actual->direccion = M_derecha;
   6C2F 21 07 00      [10] 1270 	ld	hl,#0x0007
   6C32 09            [11] 1271 	add	hl,bc
   6C33 DD 75 F8      [19] 1272 	ld	-8 (ix),l
   6C36 DD 74 F9      [19] 1273 	ld	-7 (ix),h
                           1274 ;src/main.c:332: actual->y=prota.y + G_HERO_H /2;
   6C39 21 01 00      [10] 1275 	ld	hl,#0x0001
   6C3C 09            [11] 1276 	add	hl,bc
   6C3D DD 75 FA      [19] 1277 	ld	-6 (ix),l
   6C40 DD 74 FB      [19] 1278 	ld	-5 (ix),h
                           1279 ;src/main.c:333: actual->sprite=g_knifeX_0;
   6C43 21 04 00      [10] 1280 	ld	hl,#0x0004
   6C46 09            [11] 1281 	add	hl,bc
   6C47 DD 75 FE      [19] 1282 	ld	-2 (ix),l
   6C4A DD 74 FF      [19] 1283 	ld	-1 (ix),h
                           1284 ;src/main.c:334: actual->eje = E_X;
   6C4D 21 08 00      [10] 1285 	ld	hl,#0x0008
   6C50 09            [11] 1286 	add	hl,bc
   6C51 DD 75 FC      [19] 1287 	ld	-4 (ix),l
   6C54 DD 74 FD      [19] 1288 	ld	-3 (ix),h
                           1289 ;src/main.c:326: if(prota.mira == M_derecha){
   6C57 7B            [ 4] 1290 	ld	a,e
   6C58 B7            [ 4] 1291 	or	a, a
   6C59 20 55         [12] 1292 	jr	NZ,00122$
                           1293 ;src/main.c:328: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   6C5B 3A F9 65      [13] 1294 	ld	a, (#(_prota + 0x0001) + 0)
   6C5E C6 0B         [ 7] 1295 	add	a, #0x0B
   6C60 57            [ 4] 1296 	ld	d,a
   6C61 3A F8 65      [13] 1297 	ld	a, (#_prota + 0)
   6C64 C6 0C         [ 7] 1298 	add	a, #0x0C
   6C66 C5            [11] 1299 	push	bc
   6C67 D5            [11] 1300 	push	de
   6C68 33            [ 6] 1301 	inc	sp
   6C69 F5            [11] 1302 	push	af
   6C6A 33            [ 6] 1303 	inc	sp
   6C6B CD 16 67      [17] 1304 	call	_getTilePtr
   6C6E F1            [10] 1305 	pop	af
   6C6F C1            [10] 1306 	pop	bc
   6C70 5E            [ 7] 1307 	ld	e,(hl)
   6C71 3E 02         [ 7] 1308 	ld	a,#0x02
   6C73 93            [ 4] 1309 	sub	a, e
   6C74 DA B6 6D      [10] 1310 	jp	C,00127$
                           1311 ;src/main.c:329: actual->lanzado = SI;
   6C77 E1            [10] 1312 	pop	hl
   6C78 E5            [11] 1313 	push	hl
   6C79 36 01         [10] 1314 	ld	(hl),#0x01
                           1315 ;src/main.c:330: actual->direccion = M_derecha;
   6C7B DD 6E F8      [19] 1316 	ld	l,-8 (ix)
   6C7E DD 66 F9      [19] 1317 	ld	h,-7 (ix)
   6C81 36 00         [10] 1318 	ld	(hl),#0x00
                           1319 ;src/main.c:331: actual->x=prota.x + G_HERO_W;
   6C83 3A F8 65      [13] 1320 	ld	a, (#_prota + 0)
   6C86 C6 07         [ 7] 1321 	add	a, #0x07
   6C88 02            [ 7] 1322 	ld	(bc),a
                           1323 ;src/main.c:332: actual->y=prota.y + G_HERO_H /2;
   6C89 3A F9 65      [13] 1324 	ld	a, (#(_prota + 0x0001) + 0)
   6C8C C6 0B         [ 7] 1325 	add	a, #0x0B
   6C8E DD 6E FA      [19] 1326 	ld	l,-6 (ix)
   6C91 DD 66 FB      [19] 1327 	ld	h,-5 (ix)
   6C94 77            [ 7] 1328 	ld	(hl),a
                           1329 ;src/main.c:333: actual->sprite=g_knifeX_0;
   6C95 DD 6E FE      [19] 1330 	ld	l,-2 (ix)
   6C98 DD 66 FF      [19] 1331 	ld	h,-1 (ix)
   6C9B 36 C0         [10] 1332 	ld	(hl),#<(_g_knifeX_0)
   6C9D 23            [ 6] 1333 	inc	hl
   6C9E 36 54         [10] 1334 	ld	(hl),#>(_g_knifeX_0)
                           1335 ;src/main.c:334: actual->eje = E_X;
   6CA0 DD 6E FC      [19] 1336 	ld	l,-4 (ix)
   6CA3 DD 66 FD      [19] 1337 	ld	h,-3 (ix)
   6CA6 36 00         [10] 1338 	ld	(hl),#0x00
                           1339 ;src/main.c:335: dibujarCuchillo(actual);
   6CA8 C5            [11] 1340 	push	bc
   6CA9 CD DD 6A      [17] 1341 	call	_dibujarCuchillo
   6CAC F1            [10] 1342 	pop	af
   6CAD C3 B6 6D      [10] 1343 	jp	00127$
   6CB0                    1344 00122$:
                           1345 ;src/main.c:338: else if(prota.mira == M_izquierda){
   6CB0 7B            [ 4] 1346 	ld	a,e
   6CB1 3D            [ 4] 1347 	dec	a
   6CB2 20 55         [12] 1348 	jr	NZ,00119$
                           1349 ;src/main.c:339: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   6CB4 3A F9 65      [13] 1350 	ld	a, (#(_prota + 0x0001) + 0)
   6CB7 C6 0B         [ 7] 1351 	add	a, #0x0B
   6CB9 57            [ 4] 1352 	ld	d,a
   6CBA 3A F8 65      [13] 1353 	ld	a, (#_prota + 0)
   6CBD C6 F6         [ 7] 1354 	add	a,#0xF6
   6CBF C5            [11] 1355 	push	bc
   6CC0 D5            [11] 1356 	push	de
   6CC1 33            [ 6] 1357 	inc	sp
   6CC2 F5            [11] 1358 	push	af
   6CC3 33            [ 6] 1359 	inc	sp
   6CC4 CD 16 67      [17] 1360 	call	_getTilePtr
   6CC7 F1            [10] 1361 	pop	af
   6CC8 C1            [10] 1362 	pop	bc
   6CC9 5E            [ 7] 1363 	ld	e,(hl)
   6CCA 3E 02         [ 7] 1364 	ld	a,#0x02
   6CCC 93            [ 4] 1365 	sub	a, e
   6CCD DA B6 6D      [10] 1366 	jp	C,00127$
                           1367 ;src/main.c:340: actual->lanzado = SI;
   6CD0 E1            [10] 1368 	pop	hl
   6CD1 E5            [11] 1369 	push	hl
   6CD2 36 01         [10] 1370 	ld	(hl),#0x01
                           1371 ;src/main.c:341: actual->direccion = M_izquierda;
   6CD4 DD 6E F8      [19] 1372 	ld	l,-8 (ix)
   6CD7 DD 66 F9      [19] 1373 	ld	h,-7 (ix)
   6CDA 36 01         [10] 1374 	ld	(hl),#0x01
                           1375 ;src/main.c:342: actual->x = prota.x - G_KNIFEX_0_W;
   6CDC 3A F8 65      [13] 1376 	ld	a, (#_prota + 0)
   6CDF C6 FC         [ 7] 1377 	add	a,#0xFC
   6CE1 02            [ 7] 1378 	ld	(bc),a
                           1379 ;src/main.c:343: actual->y = prota.y + G_HERO_H /2;
   6CE2 3A F9 65      [13] 1380 	ld	a, (#(_prota + 0x0001) + 0)
   6CE5 C6 0B         [ 7] 1381 	add	a, #0x0B
   6CE7 DD 6E FA      [19] 1382 	ld	l,-6 (ix)
   6CEA DD 66 FB      [19] 1383 	ld	h,-5 (ix)
   6CED 77            [ 7] 1384 	ld	(hl),a
                           1385 ;src/main.c:344: actual->sprite = g_knifeX_1;
   6CEE DD 6E FE      [19] 1386 	ld	l,-2 (ix)
   6CF1 DD 66 FF      [19] 1387 	ld	h,-1 (ix)
   6CF4 36 D0         [10] 1388 	ld	(hl),#<(_g_knifeX_1)
   6CF6 23            [ 6] 1389 	inc	hl
   6CF7 36 54         [10] 1390 	ld	(hl),#>(_g_knifeX_1)
                           1391 ;src/main.c:345: actual->eje = E_X;
   6CF9 DD 6E FC      [19] 1392 	ld	l,-4 (ix)
   6CFC DD 66 FD      [19] 1393 	ld	h,-3 (ix)
   6CFF 36 00         [10] 1394 	ld	(hl),#0x00
                           1395 ;src/main.c:346: dibujarCuchillo(actual);
   6D01 C5            [11] 1396 	push	bc
   6D02 CD DD 6A      [17] 1397 	call	_dibujarCuchillo
   6D05 F1            [10] 1398 	pop	af
   6D06 C3 B6 6D      [10] 1399 	jp	00127$
   6D09                    1400 00119$:
                           1401 ;src/main.c:349: else if(prota.mira == M_abajo){
   6D09 7B            [ 4] 1402 	ld	a,e
   6D0A D6 03         [ 7] 1403 	sub	a, #0x03
   6D0C 20 54         [12] 1404 	jr	NZ,00116$
                           1405 ;src/main.c:351: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   6D0E 3A F9 65      [13] 1406 	ld	a, (#(_prota + 0x0001) + 0)
   6D11 C6 1F         [ 7] 1407 	add	a, #0x1F
   6D13 57            [ 4] 1408 	ld	d,a
   6D14 3A F8 65      [13] 1409 	ld	a, (#_prota + 0)
   6D17 C6 03         [ 7] 1410 	add	a, #0x03
   6D19 C5            [11] 1411 	push	bc
   6D1A D5            [11] 1412 	push	de
   6D1B 33            [ 6] 1413 	inc	sp
   6D1C F5            [11] 1414 	push	af
   6D1D 33            [ 6] 1415 	inc	sp
   6D1E CD 16 67      [17] 1416 	call	_getTilePtr
   6D21 F1            [10] 1417 	pop	af
   6D22 C1            [10] 1418 	pop	bc
   6D23 5E            [ 7] 1419 	ld	e,(hl)
   6D24 3E 02         [ 7] 1420 	ld	a,#0x02
   6D26 93            [ 4] 1421 	sub	a, e
   6D27 DA B6 6D      [10] 1422 	jp	C,00127$
                           1423 ;src/main.c:352: actual->lanzado = SI;
   6D2A E1            [10] 1424 	pop	hl
   6D2B E5            [11] 1425 	push	hl
   6D2C 36 01         [10] 1426 	ld	(hl),#0x01
                           1427 ;src/main.c:353: actual->direccion = M_abajo;
   6D2E DD 6E F8      [19] 1428 	ld	l,-8 (ix)
   6D31 DD 66 F9      [19] 1429 	ld	h,-7 (ix)
   6D34 36 03         [10] 1430 	ld	(hl),#0x03
                           1431 ;src/main.c:354: actual->x = prota.x + G_HERO_W / 2;
   6D36 3A F8 65      [13] 1432 	ld	a, (#_prota + 0)
   6D39 C6 03         [ 7] 1433 	add	a, #0x03
   6D3B 02            [ 7] 1434 	ld	(bc),a
                           1435 ;src/main.c:355: actual->y = prota.y + G_HERO_H;
   6D3C 3A F9 65      [13] 1436 	ld	a, (#(_prota + 0x0001) + 0)
   6D3F C6 16         [ 7] 1437 	add	a, #0x16
   6D41 DD 6E FA      [19] 1438 	ld	l,-6 (ix)
   6D44 DD 66 FB      [19] 1439 	ld	h,-5 (ix)
   6D47 77            [ 7] 1440 	ld	(hl),a
                           1441 ;src/main.c:356: actual->sprite = g_knifeY_0;
   6D48 DD 6E FE      [19] 1442 	ld	l,-2 (ix)
   6D4B DD 66 FF      [19] 1443 	ld	h,-1 (ix)
   6D4E 36 A0         [10] 1444 	ld	(hl),#<(_g_knifeY_0)
   6D50 23            [ 6] 1445 	inc	hl
   6D51 36 54         [10] 1446 	ld	(hl),#>(_g_knifeY_0)
                           1447 ;src/main.c:357: actual->eje = E_Y;
   6D53 DD 6E FC      [19] 1448 	ld	l,-4 (ix)
   6D56 DD 66 FD      [19] 1449 	ld	h,-3 (ix)
   6D59 36 01         [10] 1450 	ld	(hl),#0x01
                           1451 ;src/main.c:358: dibujarCuchillo(actual);
   6D5B C5            [11] 1452 	push	bc
   6D5C CD DD 6A      [17] 1453 	call	_dibujarCuchillo
   6D5F F1            [10] 1454 	pop	af
   6D60 18 54         [12] 1455 	jr	00127$
   6D62                    1456 00116$:
                           1457 ;src/main.c:361: else if(prota.mira == M_arriba){
   6D62 7B            [ 4] 1458 	ld	a,e
   6D63 D6 02         [ 7] 1459 	sub	a, #0x02
   6D65 20 4F         [12] 1460 	jr	NZ,00127$
                           1461 ;src/main.c:362: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   6D67 3A F9 65      [13] 1462 	ld	a, (#(_prota + 0x0001) + 0)
   6D6A C6 F7         [ 7] 1463 	add	a,#0xF7
   6D6C 57            [ 4] 1464 	ld	d,a
   6D6D 3A F8 65      [13] 1465 	ld	a, (#_prota + 0)
   6D70 C6 03         [ 7] 1466 	add	a, #0x03
   6D72 C5            [11] 1467 	push	bc
   6D73 D5            [11] 1468 	push	de
   6D74 33            [ 6] 1469 	inc	sp
   6D75 F5            [11] 1470 	push	af
   6D76 33            [ 6] 1471 	inc	sp
   6D77 CD 16 67      [17] 1472 	call	_getTilePtr
   6D7A F1            [10] 1473 	pop	af
   6D7B C1            [10] 1474 	pop	bc
   6D7C 5E            [ 7] 1475 	ld	e,(hl)
   6D7D 3E 02         [ 7] 1476 	ld	a,#0x02
   6D7F 93            [ 4] 1477 	sub	a, e
   6D80 38 34         [12] 1478 	jr	C,00127$
                           1479 ;src/main.c:363: actual->lanzado = SI;
   6D82 E1            [10] 1480 	pop	hl
   6D83 E5            [11] 1481 	push	hl
   6D84 36 01         [10] 1482 	ld	(hl),#0x01
                           1483 ;src/main.c:364: actual->direccion = M_arriba;
   6D86 DD 6E F8      [19] 1484 	ld	l,-8 (ix)
   6D89 DD 66 F9      [19] 1485 	ld	h,-7 (ix)
   6D8C 36 02         [10] 1486 	ld	(hl),#0x02
                           1487 ;src/main.c:365: actual->x = prota.x + G_HERO_W / 2;
   6D8E 3A F8 65      [13] 1488 	ld	a, (#_prota + 0)
   6D91 C6 03         [ 7] 1489 	add	a, #0x03
   6D93 02            [ 7] 1490 	ld	(bc),a
                           1491 ;src/main.c:366: actual->y = prota.y;
   6D94 3A F9 65      [13] 1492 	ld	a, (#(_prota + 0x0001) + 0)
   6D97 DD 6E FA      [19] 1493 	ld	l,-6 (ix)
   6D9A DD 66 FB      [19] 1494 	ld	h,-5 (ix)
   6D9D 77            [ 7] 1495 	ld	(hl),a
                           1496 ;src/main.c:367: actual->sprite = g_knifeY_1;
   6D9E DD 6E FE      [19] 1497 	ld	l,-2 (ix)
   6DA1 DD 66 FF      [19] 1498 	ld	h,-1 (ix)
   6DA4 36 B0         [10] 1499 	ld	(hl),#<(_g_knifeY_1)
   6DA6 23            [ 6] 1500 	inc	hl
   6DA7 36 54         [10] 1501 	ld	(hl),#>(_g_knifeY_1)
                           1502 ;src/main.c:368: actual->eje = E_Y;
   6DA9 DD 6E FC      [19] 1503 	ld	l,-4 (ix)
   6DAC DD 66 FD      [19] 1504 	ld	h,-3 (ix)
   6DAF 36 01         [10] 1505 	ld	(hl),#0x01
                           1506 ;src/main.c:369: dibujarCuchillo(actual);
   6DB1 C5            [11] 1507 	push	bc
   6DB2 CD DD 6A      [17] 1508 	call	_dibujarCuchillo
   6DB5 F1            [10] 1509 	pop	af
   6DB6                    1510 00127$:
   6DB6 DD F9         [10] 1511 	ld	sp, ix
   6DB8 DD E1         [14] 1512 	pop	ix
   6DBA C9            [10] 1513 	ret
                           1514 ;src/main.c:375: void comprobarTeclado() {
                           1515 ;	---------------------------------
                           1516 ; Function comprobarTeclado
                           1517 ; ---------------------------------
   6DBB                    1518 _comprobarTeclado::
                           1519 ;src/main.c:376: cpct_scanKeyboard_if();
   6DBB CD E4 5B      [17] 1520 	call	_cpct_scanKeyboard_if
                           1521 ;src/main.c:378: if (cpct_isAnyKeyPressed()) {
   6DBE CD D7 5B      [17] 1522 	call	_cpct_isAnyKeyPressed
   6DC1 7D            [ 4] 1523 	ld	a,l
   6DC2 B7            [ 4] 1524 	or	a, a
   6DC3 C8            [11] 1525 	ret	Z
                           1526 ;src/main.c:379: if (cpct_isKeyPressed(Key_CursorLeft))
   6DC4 21 01 01      [10] 1527 	ld	hl,#0x0101
   6DC7 CD 41 59      [17] 1528 	call	_cpct_isKeyPressed
   6DCA 7D            [ 4] 1529 	ld	a,l
   6DCB B7            [ 4] 1530 	or	a, a
                           1531 ;src/main.c:380: moverIzquierda();
   6DCC C2 15 6A      [10] 1532 	jp	NZ,_moverIzquierda
                           1533 ;src/main.c:381: else if (cpct_isKeyPressed(Key_CursorRight))
   6DCF 21 00 02      [10] 1534 	ld	hl,#0x0200
   6DD2 CD 41 59      [17] 1535 	call	_cpct_isKeyPressed
   6DD5 7D            [ 4] 1536 	ld	a,l
   6DD6 B7            [ 4] 1537 	or	a, a
                           1538 ;src/main.c:382: moverDerecha();
   6DD7 C2 3A 6A      [10] 1539 	jp	NZ,_moverDerecha
                           1540 ;src/main.c:383: else if (cpct_isKeyPressed(Key_CursorUp))
   6DDA 21 00 01      [10] 1541 	ld	hl,#0x0100
   6DDD CD 41 59      [17] 1542 	call	_cpct_isKeyPressed
   6DE0 7D            [ 4] 1543 	ld	a,l
   6DE1 B7            [ 4] 1544 	or	a, a
                           1545 ;src/main.c:384: moverArriba();
   6DE2 C2 80 6A      [10] 1546 	jp	NZ,_moverArriba
                           1547 ;src/main.c:385: else if (cpct_isKeyPressed(Key_CursorDown))
   6DE5 21 00 04      [10] 1548 	ld	hl,#0x0400
   6DE8 CD 41 59      [17] 1549 	call	_cpct_isKeyPressed
   6DEB 7D            [ 4] 1550 	ld	a,l
   6DEC B7            [ 4] 1551 	or	a, a
                           1552 ;src/main.c:386: moverAbajo();
   6DED C2 A4 6A      [10] 1553 	jp	NZ,_moverAbajo
                           1554 ;src/main.c:387: else if (cpct_isKeyPressed(Key_Space))
   6DF0 21 05 80      [10] 1555 	ld	hl,#0x8005
   6DF3 CD 41 59      [17] 1556 	call	_cpct_isKeyPressed
   6DF6 7D            [ 4] 1557 	ld	a,l
   6DF7 B7            [ 4] 1558 	or	a, a
   6DF8 C8            [11] 1559 	ret	Z
                           1560 ;src/main.c:388: lanzarCuchillo();
   6DF9 C3 F5 6B      [10] 1561 	jp  _lanzarCuchillo
                           1562 ;src/main.c:394: void moverCuchillo(){
                           1563 ;	---------------------------------
                           1564 ; Function moverCuchillo
                           1565 ; ---------------------------------
   6DFC                    1566 _moverCuchillo::
   6DFC DD E5         [15] 1567 	push	ix
   6DFE DD 21 00 00   [14] 1568 	ld	ix,#0
   6E02 DD 39         [15] 1569 	add	ix,sp
   6E04 F5            [11] 1570 	push	af
   6E05 F5            [11] 1571 	push	af
                           1572 ;src/main.c:396: u8 i = 10 + 1;
   6E06 DD 36 FC 0B   [19] 1573 	ld	-4 (ix),#0x0B
                           1574 ;src/main.c:397: TKnife* actual = cu;
   6E0A 01 00 66      [10] 1575 	ld	bc,#_cu+0
                           1576 ;src/main.c:399: while(--i){
   6E0D                    1577 00126$:
   6E0D DD 35 FC      [23] 1578 	dec	-4 (ix)
   6E10 DD 7E FC      [19] 1579 	ld	a, -4 (ix)
   6E13 B7            [ 4] 1580 	or	a, a
   6E14 CA 33 6F      [10] 1581 	jp	Z,00129$
                           1582 ;src/main.c:400: if(actual->lanzado){
   6E17 21 06 00      [10] 1583 	ld	hl,#0x0006
   6E1A 09            [11] 1584 	add	hl,bc
   6E1B DD 75 FD      [19] 1585 	ld	-3 (ix),l
   6E1E DD 74 FE      [19] 1586 	ld	-2 (ix),h
   6E21 DD 6E FD      [19] 1587 	ld	l,-3 (ix)
   6E24 DD 66 FE      [19] 1588 	ld	h,-2 (ix)
   6E27 7E            [ 7] 1589 	ld	a,(hl)
   6E28 B7            [ 4] 1590 	or	a, a
   6E29 CA 2A 6F      [10] 1591 	jp	Z,00125$
                           1592 ;src/main.c:401: if(actual->direccion == M_derecha){
   6E2C C5            [11] 1593 	push	bc
   6E2D FD E1         [14] 1594 	pop	iy
   6E2F FD 6E 07      [19] 1595 	ld	l,7 (iy)
                           1596 ;src/main.c:403: if( *getTilePtr(actual->x + G_KNIFEX_0_W + 1, actual->y) <= 2){
   6E32 59            [ 4] 1597 	ld	e, c
   6E33 50            [ 4] 1598 	ld	d, b
   6E34 13            [ 6] 1599 	inc	de
                           1600 ;src/main.c:401: if(actual->direccion == M_derecha){
   6E35 7D            [ 4] 1601 	ld	a,l
   6E36 B7            [ 4] 1602 	or	a, a
   6E37 20 34         [12] 1603 	jr	NZ,00122$
                           1604 ;src/main.c:403: if( *getTilePtr(actual->x + G_KNIFEX_0_W + 1, actual->y) <= 2){
   6E39 1A            [ 7] 1605 	ld	a,(de)
   6E3A 57            [ 4] 1606 	ld	d,a
   6E3B 0A            [ 7] 1607 	ld	a,(bc)
   6E3C C6 05         [ 7] 1608 	add	a, #0x05
   6E3E C5            [11] 1609 	push	bc
   6E3F D5            [11] 1610 	push	de
   6E40 33            [ 6] 1611 	inc	sp
   6E41 F5            [11] 1612 	push	af
   6E42 33            [ 6] 1613 	inc	sp
   6E43 CD 16 67      [17] 1614 	call	_getTilePtr
   6E46 F1            [10] 1615 	pop	af
   6E47 C1            [10] 1616 	pop	bc
   6E48 5E            [ 7] 1617 	ld	e,(hl)
   6E49 3E 02         [ 7] 1618 	ld	a,#0x02
   6E4B 93            [ 4] 1619 	sub	a, e
   6E4C 38 0D         [12] 1620 	jr	C,00102$
                           1621 ;src/main.c:404: actual->x++;
   6E4E 0A            [ 7] 1622 	ld	a,(bc)
   6E4F 3C            [ 4] 1623 	inc	a
   6E50 02            [ 7] 1624 	ld	(bc),a
                           1625 ;src/main.c:406: redibujarCuchillo(actual);
   6E51 C5            [11] 1626 	push	bc
   6E52 C5            [11] 1627 	push	bc
   6E53 CD C4 6B      [17] 1628 	call	_redibujarCuchillo
   6E56 F1            [10] 1629 	pop	af
   6E57 C1            [10] 1630 	pop	bc
   6E58 C3 2A 6F      [10] 1631 	jp	00125$
   6E5B                    1632 00102$:
                           1633 ;src/main.c:409: borrarCuchillo(actual);
   6E5B C5            [11] 1634 	push	bc
   6E5C C5            [11] 1635 	push	bc
   6E5D CD 5A 6B      [17] 1636 	call	_borrarCuchillo
   6E60 F1            [10] 1637 	pop	af
   6E61 C1            [10] 1638 	pop	bc
                           1639 ;src/main.c:410: actual->lanzado = NO;
   6E62 DD 6E FD      [19] 1640 	ld	l,-3 (ix)
   6E65 DD 66 FE      [19] 1641 	ld	h,-2 (ix)
   6E68 36 00         [10] 1642 	ld	(hl),#0x00
   6E6A C3 2A 6F      [10] 1643 	jp	00125$
   6E6D                    1644 00122$:
                           1645 ;src/main.c:413: else if(actual->direccion == M_izquierda){
   6E6D 7D            [ 4] 1646 	ld	a,l
   6E6E 3D            [ 4] 1647 	dec	a
   6E6F 20 35         [12] 1648 	jr	NZ,00119$
                           1649 ;src/main.c:414: if(*getTilePtr(actual->x - 1, actual->y) <= 2){
   6E71 1A            [ 7] 1650 	ld	a,(de)
   6E72 57            [ 4] 1651 	ld	d,a
   6E73 0A            [ 7] 1652 	ld	a,(bc)
   6E74 C6 FF         [ 7] 1653 	add	a,#0xFF
   6E76 C5            [11] 1654 	push	bc
   6E77 D5            [11] 1655 	push	de
   6E78 33            [ 6] 1656 	inc	sp
   6E79 F5            [11] 1657 	push	af
   6E7A 33            [ 6] 1658 	inc	sp
   6E7B CD 16 67      [17] 1659 	call	_getTilePtr
   6E7E F1            [10] 1660 	pop	af
   6E7F C1            [10] 1661 	pop	bc
   6E80 5E            [ 7] 1662 	ld	e,(hl)
   6E81 3E 02         [ 7] 1663 	ld	a,#0x02
   6E83 93            [ 4] 1664 	sub	a, e
   6E84 38 0E         [12] 1665 	jr	C,00105$
                           1666 ;src/main.c:415: actual->x--;
   6E86 0A            [ 7] 1667 	ld	a,(bc)
   6E87 C6 FF         [ 7] 1668 	add	a,#0xFF
   6E89 02            [ 7] 1669 	ld	(bc),a
                           1670 ;src/main.c:417: redibujarCuchillo(actual);
   6E8A C5            [11] 1671 	push	bc
   6E8B C5            [11] 1672 	push	bc
   6E8C CD C4 6B      [17] 1673 	call	_redibujarCuchillo
   6E8F F1            [10] 1674 	pop	af
   6E90 C1            [10] 1675 	pop	bc
   6E91 C3 2A 6F      [10] 1676 	jp	00125$
   6E94                    1677 00105$:
                           1678 ;src/main.c:419: borrarCuchillo(actual);
   6E94 C5            [11] 1679 	push	bc
   6E95 C5            [11] 1680 	push	bc
   6E96 CD 5A 6B      [17] 1681 	call	_borrarCuchillo
   6E99 F1            [10] 1682 	pop	af
   6E9A C1            [10] 1683 	pop	bc
                           1684 ;src/main.c:420: actual->lanzado = NO;
   6E9B DD 6E FD      [19] 1685 	ld	l,-3 (ix)
   6E9E DD 66 FE      [19] 1686 	ld	h,-2 (ix)
   6EA1 36 00         [10] 1687 	ld	(hl),#0x00
   6EA3 C3 2A 6F      [10] 1688 	jp	00125$
   6EA6                    1689 00119$:
                           1690 ;src/main.c:423: else if(actual->direccion == M_abajo){
   6EA6 7D            [ 4] 1691 	ld	a,l
   6EA7 D6 03         [ 7] 1692 	sub	a, #0x03
   6EA9 20 3D         [12] 1693 	jr	NZ,00116$
                           1694 ;src/main.c:424: if(*getTilePtr(actual->x, actual->y + G_KNIFEY_0_H + 2) <= 2){
   6EAB 1A            [ 7] 1695 	ld	a,(de)
   6EAC C6 0A         [ 7] 1696 	add	a, #0x0A
   6EAE F5            [11] 1697 	push	af
   6EAF 0A            [ 7] 1698 	ld	a,(bc)
   6EB0 DD 77 FF      [19] 1699 	ld	-1 (ix),a
   6EB3 F1            [10] 1700 	pop	af
   6EB4 C5            [11] 1701 	push	bc
   6EB5 D5            [11] 1702 	push	de
   6EB6 F5            [11] 1703 	push	af
   6EB7 33            [ 6] 1704 	inc	sp
   6EB8 DD 7E FF      [19] 1705 	ld	a,-1 (ix)
   6EBB F5            [11] 1706 	push	af
   6EBC 33            [ 6] 1707 	inc	sp
   6EBD CD 16 67      [17] 1708 	call	_getTilePtr
   6EC0 F1            [10] 1709 	pop	af
   6EC1 D1            [10] 1710 	pop	de
   6EC2 C1            [10] 1711 	pop	bc
   6EC3 6E            [ 7] 1712 	ld	l,(hl)
   6EC4 3E 02         [ 7] 1713 	ld	a,#0x02
   6EC6 95            [ 4] 1714 	sub	a, l
   6EC7 38 0E         [12] 1715 	jr	C,00108$
                           1716 ;src/main.c:425: actual->y++;
   6EC9 1A            [ 7] 1717 	ld	a,(de)
   6ECA 3C            [ 4] 1718 	inc	a
   6ECB 12            [ 7] 1719 	ld	(de),a
                           1720 ;src/main.c:426: actual->y++;
   6ECC 3C            [ 4] 1721 	inc	a
   6ECD 12            [ 7] 1722 	ld	(de),a
                           1723 ;src/main.c:427: redibujarCuchillo(actual);
   6ECE C5            [11] 1724 	push	bc
   6ECF C5            [11] 1725 	push	bc
   6ED0 CD C4 6B      [17] 1726 	call	_redibujarCuchillo
   6ED3 F1            [10] 1727 	pop	af
   6ED4 C1            [10] 1728 	pop	bc
   6ED5 18 53         [12] 1729 	jr	00125$
   6ED7                    1730 00108$:
                           1731 ;src/main.c:431: borrarCuchillo(actual);
   6ED7 C5            [11] 1732 	push	bc
   6ED8 C5            [11] 1733 	push	bc
   6ED9 CD 5A 6B      [17] 1734 	call	_borrarCuchillo
   6EDC F1            [10] 1735 	pop	af
   6EDD C1            [10] 1736 	pop	bc
                           1737 ;src/main.c:432: actual->lanzado = NO;
   6EDE DD 6E FD      [19] 1738 	ld	l,-3 (ix)
   6EE1 DD 66 FE      [19] 1739 	ld	h,-2 (ix)
   6EE4 36 00         [10] 1740 	ld	(hl),#0x00
   6EE6 18 42         [12] 1741 	jr	00125$
   6EE8                    1742 00116$:
                           1743 ;src/main.c:435: else if(actual->direccion == M_arriba){
   6EE8 7D            [ 4] 1744 	ld	a,l
   6EE9 D6 02         [ 7] 1745 	sub	a, #0x02
   6EEB 20 3D         [12] 1746 	jr	NZ,00125$
                           1747 ;src/main.c:436: if(*getTilePtr(actual->x, actual->y - 2) <= 2){
   6EED 1A            [ 7] 1748 	ld	a,(de)
   6EEE C6 FE         [ 7] 1749 	add	a,#0xFE
   6EF0 F5            [11] 1750 	push	af
   6EF1 0A            [ 7] 1751 	ld	a,(bc)
   6EF2 DD 77 FF      [19] 1752 	ld	-1 (ix),a
   6EF5 F1            [10] 1753 	pop	af
   6EF6 C5            [11] 1754 	push	bc
   6EF7 D5            [11] 1755 	push	de
   6EF8 F5            [11] 1756 	push	af
   6EF9 33            [ 6] 1757 	inc	sp
   6EFA DD 7E FF      [19] 1758 	ld	a,-1 (ix)
   6EFD F5            [11] 1759 	push	af
   6EFE 33            [ 6] 1760 	inc	sp
   6EFF CD 16 67      [17] 1761 	call	_getTilePtr
   6F02 F1            [10] 1762 	pop	af
   6F03 D1            [10] 1763 	pop	de
   6F04 C1            [10] 1764 	pop	bc
   6F05 6E            [ 7] 1765 	ld	l,(hl)
   6F06 3E 02         [ 7] 1766 	ld	a,#0x02
   6F08 95            [ 4] 1767 	sub	a, l
   6F09 38 10         [12] 1768 	jr	C,00111$
                           1769 ;src/main.c:437: actual->y--;
   6F0B 1A            [ 7] 1770 	ld	a,(de)
   6F0C C6 FF         [ 7] 1771 	add	a,#0xFF
   6F0E 12            [ 7] 1772 	ld	(de),a
                           1773 ;src/main.c:438: actual->y--;
   6F0F C6 FF         [ 7] 1774 	add	a,#0xFF
   6F11 12            [ 7] 1775 	ld	(de),a
                           1776 ;src/main.c:439: redibujarCuchillo(actual);
   6F12 C5            [11] 1777 	push	bc
   6F13 C5            [11] 1778 	push	bc
   6F14 CD C4 6B      [17] 1779 	call	_redibujarCuchillo
   6F17 F1            [10] 1780 	pop	af
   6F18 C1            [10] 1781 	pop	bc
   6F19 18 0F         [12] 1782 	jr	00125$
   6F1B                    1783 00111$:
                           1784 ;src/main.c:442: borrarCuchillo(actual);
   6F1B C5            [11] 1785 	push	bc
   6F1C C5            [11] 1786 	push	bc
   6F1D CD 5A 6B      [17] 1787 	call	_borrarCuchillo
   6F20 F1            [10] 1788 	pop	af
   6F21 C1            [10] 1789 	pop	bc
                           1790 ;src/main.c:443: actual->lanzado = NO;
   6F22 DD 6E FD      [19] 1791 	ld	l,-3 (ix)
   6F25 DD 66 FE      [19] 1792 	ld	h,-2 (ix)
   6F28 36 00         [10] 1793 	ld	(hl),#0x00
   6F2A                    1794 00125$:
                           1795 ;src/main.c:447: ++actual;
   6F2A 21 09 00      [10] 1796 	ld	hl,#0x0009
   6F2D 09            [11] 1797 	add	hl,bc
   6F2E 4D            [ 4] 1798 	ld	c,l
   6F2F 44            [ 4] 1799 	ld	b,h
   6F30 C3 0D 6E      [10] 1800 	jp	00126$
   6F33                    1801 00129$:
   6F33 DD F9         [10] 1802 	ld	sp, ix
   6F35 DD E1         [14] 1803 	pop	ix
   6F37 C9            [10] 1804 	ret
                           1805 ;src/main.c:450: void barraPuntuacionInicial(){
                           1806 ;	---------------------------------
                           1807 ; Function barraPuntuacionInicial
                           1808 ; ---------------------------------
   6F38                    1809 _barraPuntuacionInicial::
                           1810 ;src/main.c:455: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 178); // 
   6F38 21 00 B2      [10] 1811 	ld	hl,#0xB200
   6F3B E5            [11] 1812 	push	hl
   6F3C 26 C0         [ 7] 1813 	ld	h, #0xC0
   6F3E E5            [11] 1814 	push	hl
   6F3F CD 93 65      [17] 1815 	call	_cpct_getScreenPtr
   6F42 4D            [ 4] 1816 	ld	c,l
   6F43 44            [ 4] 1817 	ld	b,h
                           1818 ;src/main.c:456: cpct_drawStringM0("SCORE", memptr, 1, 0);
   6F44 21 01 00      [10] 1819 	ld	hl,#0x0001
   6F47 E5            [11] 1820 	push	hl
   6F48 C5            [11] 1821 	push	bc
   6F49 21 E0 6F      [10] 1822 	ld	hl,#___str_0
   6F4C E5            [11] 1823 	push	hl
   6F4D CD C3 59      [17] 1824 	call	_cpct_drawStringM0
   6F50 21 06 00      [10] 1825 	ld	hl,#6
   6F53 39            [11] 1826 	add	hl,sp
   6F54 F9            [ 6] 1827 	ld	sp,hl
                           1828 ;src/main.c:457: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 190); // puntuación inicial
   6F55 21 00 BE      [10] 1829 	ld	hl,#0xBE00
   6F58 E5            [11] 1830 	push	hl
   6F59 26 C0         [ 7] 1831 	ld	h, #0xC0
   6F5B E5            [11] 1832 	push	hl
   6F5C CD 93 65      [17] 1833 	call	_cpct_getScreenPtr
   6F5F 4D            [ 4] 1834 	ld	c,l
   6F60 44            [ 4] 1835 	ld	b,h
                           1836 ;src/main.c:458: cpct_drawStringM0("00000", memptr, 15, 0);
   6F61 21 0F 00      [10] 1837 	ld	hl,#0x000F
   6F64 E5            [11] 1838 	push	hl
   6F65 C5            [11] 1839 	push	bc
   6F66 21 E6 6F      [10] 1840 	ld	hl,#___str_1
   6F69 E5            [11] 1841 	push	hl
   6F6A CD C3 59      [17] 1842 	call	_cpct_drawStringM0
   6F6D 21 06 00      [10] 1843 	ld	hl,#6
   6F70 39            [11] 1844 	add	hl,sp
   6F71 F9            [ 6] 1845 	ld	sp,hl
                           1846 ;src/main.c:461: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 190);
   6F72 21 1A BE      [10] 1847 	ld	hl,#0xBE1A
   6F75 E5            [11] 1848 	push	hl
   6F76 21 00 C0      [10] 1849 	ld	hl,#0xC000
   6F79 E5            [11] 1850 	push	hl
   6F7A CD 93 65      [17] 1851 	call	_cpct_getScreenPtr
   6F7D 4D            [ 4] 1852 	ld	c,l
   6F7E 44            [ 4] 1853 	ld	b,h
                           1854 ;src/main.c:462: cpct_drawStringM0("ROBOBIT", memptr, 3, 0);
   6F7F 21 03 00      [10] 1855 	ld	hl,#0x0003
   6F82 E5            [11] 1856 	push	hl
   6F83 C5            [11] 1857 	push	bc
   6F84 21 EC 6F      [10] 1858 	ld	hl,#___str_2
   6F87 E5            [11] 1859 	push	hl
   6F88 CD C3 59      [17] 1860 	call	_cpct_drawStringM0
   6F8B 21 06 00      [10] 1861 	ld	hl,#6
   6F8E 39            [11] 1862 	add	hl,sp
   6F8F F9            [ 6] 1863 	ld	sp,hl
                           1864 ;src/main.c:464: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 178); // 
   6F90 21 3C B2      [10] 1865 	ld	hl,#0xB23C
   6F93 E5            [11] 1866 	push	hl
   6F94 21 00 C0      [10] 1867 	ld	hl,#0xC000
   6F97 E5            [11] 1868 	push	hl
   6F98 CD 93 65      [17] 1869 	call	_cpct_getScreenPtr
   6F9B 4D            [ 4] 1870 	ld	c,l
   6F9C 44            [ 4] 1871 	ld	b,h
                           1872 ;src/main.c:465: cpct_drawStringM0("LIVES", memptr, 1, 0);
   6F9D 21 01 00      [10] 1873 	ld	hl,#0x0001
   6FA0 E5            [11] 1874 	push	hl
   6FA1 C5            [11] 1875 	push	bc
   6FA2 21 F4 6F      [10] 1876 	ld	hl,#___str_3
   6FA5 E5            [11] 1877 	push	hl
   6FA6 CD C3 59      [17] 1878 	call	_cpct_drawStringM0
   6FA9 21 06 00      [10] 1879 	ld	hl,#6
   6FAC 39            [11] 1880 	add	hl,sp
   6FAD F9            [ 6] 1881 	ld	sp,hl
                           1882 ;src/main.c:467: for(i=0; i<5; i++){
   6FAE 01 00 00      [10] 1883 	ld	bc,#0x0000
   6FB1                    1884 00102$:
                           1885 ;src/main.c:468: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 190); // dibuja 5 corazones
   6FB1 79            [ 4] 1886 	ld	a,c
   6FB2 87            [ 4] 1887 	add	a, a
   6FB3 87            [ 4] 1888 	add	a, a
   6FB4 C6 3C         [ 7] 1889 	add	a, #0x3C
   6FB6 57            [ 4] 1890 	ld	d,a
   6FB7 C5            [11] 1891 	push	bc
   6FB8 3E BE         [ 7] 1892 	ld	a,#0xBE
   6FBA F5            [11] 1893 	push	af
   6FBB 33            [ 6] 1894 	inc	sp
   6FBC D5            [11] 1895 	push	de
   6FBD 33            [ 6] 1896 	inc	sp
   6FBE 21 00 C0      [10] 1897 	ld	hl,#0xC000
   6FC1 E5            [11] 1898 	push	hl
   6FC2 CD 93 65      [17] 1899 	call	_cpct_getScreenPtr
   6FC5 EB            [ 4] 1900 	ex	de,hl
   6FC6 21 03 06      [10] 1901 	ld	hl,#0x0603
   6FC9 E5            [11] 1902 	push	hl
   6FCA D5            [11] 1903 	push	de
   6FCB 21 A8 55      [10] 1904 	ld	hl,#_g_heart
   6FCE E5            [11] 1905 	push	hl
   6FCF CD E7 59      [17] 1906 	call	_cpct_drawSprite
   6FD2 C1            [10] 1907 	pop	bc
                           1908 ;src/main.c:467: for(i=0; i<5; i++){
   6FD3 03            [ 6] 1909 	inc	bc
   6FD4 79            [ 4] 1910 	ld	a,c
   6FD5 D6 05         [ 7] 1911 	sub	a, #0x05
   6FD7 78            [ 4] 1912 	ld	a,b
   6FD8 17            [ 4] 1913 	rla
   6FD9 3F            [ 4] 1914 	ccf
   6FDA 1F            [ 4] 1915 	rra
   6FDB DE 80         [ 7] 1916 	sbc	a, #0x80
   6FDD 38 D2         [12] 1917 	jr	C,00102$
   6FDF C9            [10] 1918 	ret
   6FE0                    1919 ___str_0:
   6FE0 53 43 4F 52 45     1920 	.ascii "SCORE"
   6FE5 00                 1921 	.db 0x00
   6FE6                    1922 ___str_1:
   6FE6 30 30 30 30 30     1923 	.ascii "00000"
   6FEB 00                 1924 	.db 0x00
   6FEC                    1925 ___str_2:
   6FEC 52 4F 42 4F 42 49  1926 	.ascii "ROBOBIT"
        54
   6FF3 00                 1927 	.db 0x00
   6FF4                    1928 ___str_3:
   6FF4 4C 49 56 45 53     1929 	.ascii "LIVES"
   6FF9 00                 1930 	.db 0x00
                           1931 ;src/main.c:473: void borrarPantallaAbajo(){
                           1932 ;	---------------------------------
                           1933 ; Function borrarPantallaAbajo
                           1934 ; ---------------------------------
   6FFA                    1935 _borrarPantallaAbajo::
                           1936 ;src/main.c:475: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 180); // posición para borrar 
   6FFA 21 1A B4      [10] 1937 	ld	hl,#0xB41A
   6FFD E5            [11] 1938 	push	hl
   6FFE 21 00 C0      [10] 1939 	ld	hl,#0xC000
   7001 E5            [11] 1940 	push	hl
   7002 CD 93 65      [17] 1941 	call	_cpct_getScreenPtr
   7005 4D            [ 4] 1942 	ld	c,l
   7006 44            [ 4] 1943 	ld	b,h
                           1944 ;src/main.c:477: cpct_drawSolidBox(memptr, 0, 30, 7);  //borra el texto "PULSA I"
   7007 21 1E 07      [10] 1945 	ld	hl,#0x071E
   700A E5            [11] 1946 	push	hl
   700B AF            [ 4] 1947 	xor	a, a
   700C F5            [11] 1948 	push	af
   700D 33            [ 6] 1949 	inc	sp
   700E C5            [11] 1950 	push	bc
   700F CD B9 64      [17] 1951 	call	_cpct_drawSolidBox
   7012 F1            [10] 1952 	pop	af
   7013 F1            [10] 1953 	pop	af
   7014 33            [ 6] 1954 	inc	sp
   7015 C9            [10] 1955 	ret
                           1956 ;src/main.c:480: void menuFin(){
                           1957 ;	---------------------------------
                           1958 ; Function menuFin
                           1959 ; ---------------------------------
   7016                    1960 _menuFin::
                           1961 ;src/main.c:483: cpct_clearScreen(0);
   7016 21 00 40      [10] 1962 	ld	hl,#0x4000
   7019 E5            [11] 1963 	push	hl
   701A AF            [ 4] 1964 	xor	a, a
   701B F5            [11] 1965 	push	af
   701C 33            [ 6] 1966 	inc	sp
   701D 26 C0         [ 7] 1967 	ld	h, #0xC0
   701F E5            [11] 1968 	push	hl
   7020 CD 72 5C      [17] 1969 	call	_cpct_memset
                           1970 ;src/main.c:485: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 12, 90); // centrado en horizontal y arriba en vertical
   7023 21 0C 5A      [10] 1971 	ld	hl,#0x5A0C
   7026 E5            [11] 1972 	push	hl
   7027 21 00 C0      [10] 1973 	ld	hl,#0xC000
   702A E5            [11] 1974 	push	hl
   702B CD 93 65      [17] 1975 	call	_cpct_getScreenPtr
   702E 4D            [ 4] 1976 	ld	c,l
   702F 44            [ 4] 1977 	ld	b,h
                           1978 ;src/main.c:486: cpct_drawStringM0("FIN DE PARTIDA", memptr, 2, 0);
   7030 21 02 00      [10] 1979 	ld	hl,#0x0002
   7033 E5            [11] 1980 	push	hl
   7034 C5            [11] 1981 	push	bc
   7035 21 4F 70      [10] 1982 	ld	hl,#___str_4
   7038 E5            [11] 1983 	push	hl
   7039 CD C3 59      [17] 1984 	call	_cpct_drawStringM0
   703C 21 06 00      [10] 1985 	ld	hl,#6
   703F 39            [11] 1986 	add	hl,sp
   7040 F9            [ 6] 1987 	ld	sp,hl
                           1988 ;src/main.c:490: do{
   7041                    1989 00101$:
                           1990 ;src/main.c:491: cpct_scanKeyboard_f();   		
   7041 CD 4D 59      [17] 1991 	call	_cpct_scanKeyboard_f
                           1992 ;src/main.c:492: } while(!cpct_isKeyPressed(Key_I));   		
   7044 21 04 08      [10] 1993 	ld	hl,#0x0804
   7047 CD 41 59      [17] 1994 	call	_cpct_isKeyPressed
   704A 7D            [ 4] 1995 	ld	a,l
   704B B7            [ 4] 1996 	or	a, a
   704C 28 F3         [12] 1997 	jr	Z,00101$
   704E C9            [10] 1998 	ret
   704F                    1999 ___str_4:
   704F 46 49 4E 20 44 45  2000 	.ascii "FIN DE PARTIDA"
        20 50 41 52 54 49
        44 41
   705D 00                 2001 	.db 0x00
                           2002 ;src/main.c:495: void menuInicio(){
                           2003 ;	---------------------------------
                           2004 ; Function menuInicio
                           2005 ; ---------------------------------
   705E                    2006 _menuInicio::
                           2007 ;src/main.c:499: cpct_clearScreen(0);
   705E 21 00 40      [10] 2008 	ld	hl,#0x4000
   7061 E5            [11] 2009 	push	hl
   7062 AF            [ 4] 2010 	xor	a, a
   7063 F5            [11] 2011 	push	af
   7064 33            [ 6] 2012 	inc	sp
   7065 26 C0         [ 7] 2013 	ld	h, #0xC0
   7067 E5            [11] 2014 	push	hl
   7068 CD 72 5C      [17] 2015 	call	_cpct_memset
                           2016 ;src/main.c:501: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 15); // centrado en horizontal y arriba en vertical
   706B 21 20 0F      [10] 2017 	ld	hl,#0x0F20
   706E E5            [11] 2018 	push	hl
   706F 21 00 C0      [10] 2019 	ld	hl,#0xC000
   7072 E5            [11] 2020 	push	hl
   7073 CD 93 65      [17] 2021 	call	_cpct_getScreenPtr
   7076 4D            [ 4] 2022 	ld	c,l
   7077 44            [ 4] 2023 	ld	b,h
                           2024 ;src/main.c:502: cpct_drawStringM0("MENU", memptr, 2, 0);
   7078 21 02 00      [10] 2025 	ld	hl,#0x0002
   707B E5            [11] 2026 	push	hl
   707C C5            [11] 2027 	push	bc
   707D 21 B5 70      [10] 2028 	ld	hl,#___str_5
   7080 E5            [11] 2029 	push	hl
   7081 CD C3 59      [17] 2030 	call	_cpct_drawStringM0
   7084 21 06 00      [10] 2031 	ld	hl,#6
   7087 39            [11] 2032 	add	hl,sp
   7088 F9            [ 6] 2033 	ld	sp,hl
                           2034 ;src/main.c:504: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 160); // centrado en horizontal y abajo en vertical
   7089 21 1A A0      [10] 2035 	ld	hl,#0xA01A
   708C E5            [11] 2036 	push	hl
   708D 21 00 C0      [10] 2037 	ld	hl,#0xC000
   7090 E5            [11] 2038 	push	hl
   7091 CD 93 65      [17] 2039 	call	_cpct_getScreenPtr
   7094 4D            [ 4] 2040 	ld	c,l
   7095 44            [ 4] 2041 	ld	b,h
                           2042 ;src/main.c:505: cpct_drawStringM0("PULSA I", memptr, 1, 0);
   7096 21 01 00      [10] 2043 	ld	hl,#0x0001
   7099 E5            [11] 2044 	push	hl
   709A C5            [11] 2045 	push	bc
   709B 21 BA 70      [10] 2046 	ld	hl,#___str_6
   709E E5            [11] 2047 	push	hl
   709F CD C3 59      [17] 2048 	call	_cpct_drawStringM0
   70A2 21 06 00      [10] 2049 	ld	hl,#6
   70A5 39            [11] 2050 	add	hl,sp
   70A6 F9            [ 6] 2051 	ld	sp,hl
                           2052 ;src/main.c:508: do{
   70A7                    2053 00101$:
                           2054 ;src/main.c:509: cpct_scanKeyboard_f();   		
   70A7 CD 4D 59      [17] 2055 	call	_cpct_scanKeyboard_f
                           2056 ;src/main.c:510: } while(!cpct_isKeyPressed(Key_I));   		
   70AA 21 04 08      [10] 2057 	ld	hl,#0x0804
   70AD CD 41 59      [17] 2058 	call	_cpct_isKeyPressed
   70B0 7D            [ 4] 2059 	ld	a,l
   70B1 B7            [ 4] 2060 	or	a, a
   70B2 28 F3         [12] 2061 	jr	Z,00101$
   70B4 C9            [10] 2062 	ret
   70B5                    2063 ___str_5:
   70B5 4D 45 4E 55        2064 	.ascii "MENU"
   70B9 00                 2065 	.db 0x00
   70BA                    2066 ___str_6:
   70BA 50 55 4C 53 41 20  2067 	.ascii "PULSA I"
        49
   70C1 00                 2068 	.db 0x00
                           2069 ;src/main.c:513: void inicializarCPC() {
                           2070 ;	---------------------------------
                           2071 ; Function inicializarCPC
                           2072 ; ---------------------------------
   70C2                    2073 _inicializarCPC::
                           2074 ;src/main.c:514: cpct_disableFirmware();
   70C2 CD A9 64      [17] 2075 	call	_cpct_disableFirmware
                           2076 ;src/main.c:515: cpct_setVideoMode(0);
   70C5 2E 00         [ 7] 2077 	ld	l,#0x00
   70C7 CD 54 5C      [17] 2078 	call	_cpct_setVideoMode
                           2079 ;src/main.c:516: cpct_setBorder(HW_BLACK);
   70CA 21 10 14      [10] 2080 	ld	hl,#0x1410
   70CD E5            [11] 2081 	push	hl
   70CE CD B7 59      [17] 2082 	call	_cpct_setPALColour
                           2083 ;src/main.c:517: cpct_setPalette(g_palette, 16);
   70D1 21 10 00      [10] 2084 	ld	hl,#0x0010
   70D4 E5            [11] 2085 	push	hl
   70D5 21 E0 57      [10] 2086 	ld	hl,#_g_palette
   70D8 E5            [11] 2087 	push	hl
   70D9 CD 2A 59      [17] 2088 	call	_cpct_setPalette
                           2089 ;src/main.c:518: cpct_akp_musicInit(G_song);
   70DC 21 00 3F      [10] 2090 	ld	hl,#_G_song
   70DF E5            [11] 2091 	push	hl
   70E0 CD 85 63      [17] 2092 	call	_cpct_akp_musicInit
   70E3 F1            [10] 2093 	pop	af
   70E4 C9            [10] 2094 	ret
                           2095 ;src/main.c:521: void inicializarJuego() {
                           2096 ;	---------------------------------
                           2097 ; Function inicializarJuego
                           2098 ; ---------------------------------
   70E5                    2099 _inicializarJuego::
                           2100 ;src/main.c:524: TKnife* actual = cu;
                           2101 ;src/main.c:526: num_mapa = 0;
   70E5 21 5C 66      [10] 2102 	ld	hl,#_num_mapa + 0
   70E8 36 00         [10] 2103 	ld	(hl), #0x00
                           2104 ;src/main.c:527: mapa = mapas[num_mapa];
   70EA 21 73 66      [10] 2105 	ld	hl, #_mapas + 0
   70ED 7E            [ 7] 2106 	ld	a,(hl)
   70EE FD 21 5A 66   [14] 2107 	ld	iy,#_mapa
   70F2 FD 77 00      [19] 2108 	ld	0 (iy),a
   70F5 23            [ 6] 2109 	inc	hl
   70F6 7E            [ 7] 2110 	ld	a,(hl)
   70F7 32 5B 66      [13] 2111 	ld	(#_mapa + 1),a
                           2112 ;src/main.c:528: cpct_etm_setTileset2x4(g_tileset);
   70FA 21 E0 54      [10] 2113 	ld	hl,#_g_tileset
   70FD CD 1B 5B      [17] 2114 	call	_cpct_etm_setTileset2x4
                           2115 ;src/main.c:529: dibujarMapa();
   7100 CD 5D 66      [17] 2116 	call	_dibujarMapa
                           2117 ;src/main.c:530: borrarPantallaAbajo();
   7103 CD FA 6F      [17] 2118 	call	_borrarPantallaAbajo
                           2119 ;src/main.c:531: barraPuntuacionInicial();
   7106 CD 38 6F      [17] 2120 	call	_barraPuntuacionInicial
                           2121 ;src/main.c:534: prota.x = prota.px = 4;
   7109 21 FA 65      [10] 2122 	ld	hl,#(_prota + 0x0002)
   710C 36 04         [10] 2123 	ld	(hl),#0x04
   710E 21 F8 65      [10] 2124 	ld	hl,#_prota
   7111 36 04         [10] 2125 	ld	(hl),#0x04
                           2126 ;src/main.c:535: prota.y = prota.py = 80;
   7113 21 FB 65      [10] 2127 	ld	hl,#(_prota + 0x0003)
   7116 36 50         [10] 2128 	ld	(hl),#0x50
   7118 21 F9 65      [10] 2129 	ld	hl,#(_prota + 0x0001)
   711B 36 50         [10] 2130 	ld	(hl),#0x50
                           2131 ;src/main.c:536: prota.mover  = NO;
   711D 21 FE 65      [10] 2132 	ld	hl,#(_prota + 0x0006)
   7120 36 00         [10] 2133 	ld	(hl),#0x00
                           2134 ;src/main.c:537: prota.mira=M_derecha;
   7122 21 FF 65      [10] 2135 	ld	hl,#(_prota + 0x0007)
   7125 36 00         [10] 2136 	ld	(hl),#0x00
                           2137 ;src/main.c:538: prota.sprite = g_hero;
   7127 21 F0 57      [10] 2138 	ld	hl,#_g_hero
   712A 22 FC 65      [16] 2139 	ld	((_prota + 0x0004)), hl
                           2140 ;src/main.c:540: enemy.x = enemy.px = 67;
   712D 21 F2 65      [10] 2141 	ld	hl,#(_enemy + 0x0002)
   7130 36 43         [10] 2142 	ld	(hl),#0x43
   7132 21 F0 65      [10] 2143 	ld	hl,#_enemy
   7135 36 43         [10] 2144 	ld	(hl),#0x43
                           2145 ;src/main.c:541: enemy.y = enemy.py = 84;
   7137 21 F3 65      [10] 2146 	ld	hl,#(_enemy + 0x0003)
   713A 36 54         [10] 2147 	ld	(hl),#0x54
   713C 21 F1 65      [10] 2148 	ld	hl,#(_enemy + 0x0001)
   713F 36 54         [10] 2149 	ld	(hl),#0x54
                           2150 ;src/main.c:542: enemy.mover  = NO;
   7141 21 F6 65      [10] 2151 	ld	hl,#(_enemy + 0x0006)
   7144 36 00         [10] 2152 	ld	(hl),#0x00
                           2153 ;src/main.c:543: enemy.mira=M_abajo;
   7146 21 F7 65      [10] 2154 	ld	hl,#(_enemy + 0x0007)
   7149 36 03         [10] 2155 	ld	(hl),#0x03
                           2156 ;src/main.c:544: enemy.sprite = g_enemy;
   714B 21 BA 55      [10] 2157 	ld	hl,#_g_enemy
   714E 22 F4 65      [16] 2158 	ld	((_enemy + 0x0004)), hl
                           2159 ;src/main.c:546: i = 10 + 1;
   7151 0E 0B         [ 7] 2160 	ld	c,#0x0B
                           2161 ;src/main.c:548: while(--i){
   7153 11 00 66      [10] 2162 	ld	de,#_cu
   7156                    2163 00101$:
   7156 41            [ 4] 2164 	ld	b,c
   7157 05            [ 4] 2165 	dec	b
   7158 78            [ 4] 2166 	ld	a,b
   7159 4F            [ 4] 2167 	ld	c,a
   715A B7            [ 4] 2168 	or	a, a
   715B 28 25         [12] 2169 	jr	Z,00103$
                           2170 ;src/main.c:549: actual->x = actual->px = 0;
   715D 6B            [ 4] 2171 	ld	l, e
   715E 62            [ 4] 2172 	ld	h, d
   715F 23            [ 6] 2173 	inc	hl
   7160 23            [ 6] 2174 	inc	hl
   7161 36 00         [10] 2175 	ld	(hl),#0x00
   7163 AF            [ 4] 2176 	xor	a, a
   7164 12            [ 7] 2177 	ld	(de),a
                           2178 ;src/main.c:550: actual->y = actual->py = 0;
   7165 D5            [11] 2179 	push	de
   7166 FD E1         [14] 2180 	pop	iy
   7168 FD 23         [10] 2181 	inc	iy
   716A 6B            [ 4] 2182 	ld	l, e
   716B 62            [ 4] 2183 	ld	h, d
   716C 23            [ 6] 2184 	inc	hl
   716D 23            [ 6] 2185 	inc	hl
   716E 23            [ 6] 2186 	inc	hl
   716F 36 00         [10] 2187 	ld	(hl),#0x00
   7171 FD 36 00 00   [19] 2188 	ld	0 (iy), #0x00
                           2189 ;src/main.c:551: actual->lanzado = 0;
   7175 21 06 00      [10] 2190 	ld	hl,#0x0006
   7178 19            [11] 2191 	add	hl,de
   7179 36 00         [10] 2192 	ld	(hl),#0x00
                           2193 ;src/main.c:552: ++actual;
   717B 21 09 00      [10] 2194 	ld	hl,#0x0009
   717E 19            [11] 2195 	add	hl,de
   717F EB            [ 4] 2196 	ex	de,hl
   7180 18 D4         [12] 2197 	jr	00101$
   7182                    2198 00103$:
                           2199 ;src/main.c:555: dibujarProta();
   7182 CD 79 66      [17] 2200 	call	_dibujarProta
                           2201 ;src/main.c:556: dibujarEnemigo();
   7185 C3 80 68      [10] 2202 	jp  _dibujarEnemigo
                           2203 ;src/main.c:559: void main(void) {
                           2204 ;	---------------------------------
                           2205 ; Function main
                           2206 ; ---------------------------------
   7188                    2207 _main::
                           2208 ;src/main.c:561: inicializarCPC();
   7188 CD C2 70      [17] 2209 	call	_inicializarCPC
                           2210 ;src/main.c:562: menuInicio();
   718B CD 5E 70      [17] 2211 	call	_menuInicio
                           2212 ;src/main.c:564: inicializarJuego();
   718E CD E5 70      [17] 2213 	call	_inicializarJuego
                           2214 ;src/main.c:565: cpct_akp_musicPlay();
   7191 CD 82 5C      [17] 2215 	call	_cpct_akp_musicPlay
                           2216 ;src/main.c:567: while (1) {
   7194                    2217 00104$:
                           2218 ;src/main.c:570: comprobarTeclado();
   7194 CD BB 6D      [17] 2219 	call	_comprobarTeclado
                           2220 ;src/main.c:572: cpct_waitVSYNC();
   7197 CD 4C 5C      [17] 2221 	call	_cpct_waitVSYNC
                           2222 ;src/main.c:573: moverCuchillo();
   719A CD FC 6D      [17] 2223 	call	_moverCuchillo
                           2224 ;src/main.c:574: moverEnemigo();
   719D CD 1D 69      [17] 2225 	call	_moverEnemigo
                           2226 ;src/main.c:576: if (prota.mover) {
   71A0 3A FE 65      [13] 2227 	ld	a, (#(_prota + 0x0006) + 0)
   71A3 B7            [ 4] 2228 	or	a, a
   71A4 28 EE         [12] 2229 	jr	Z,00104$
                           2230 ;src/main.c:578: redibujarProta();
   71A6 CD 02 67      [17] 2231 	call	_redibujarProta
                           2232 ;src/main.c:579: prota.mover = NO;
   71A9 21 FE 65      [10] 2233 	ld	hl,#(_prota + 0x0006)
   71AC 36 00         [10] 2234 	ld	(hl),#0x00
   71AE 18 E4         [12] 2235 	jr	00104$
                           2236 	.area _CODE
                           2237 	.area _INITIALIZER
                           2238 	.area _CABS (ABS)
   3F00                    2239 	.org 0x3F00
   3F00                    2240 _G_song:
   3F00 41                 2241 	.db #0x41	; 65	'A'
   3F01 54                 2242 	.db #0x54	; 84	'T'
   3F02 31                 2243 	.db #0x31	; 49	'1'
   3F03 30                 2244 	.db #0x30	; 48	'0'
   3F04 01                 2245 	.db #0x01	; 1
   3F05 40                 2246 	.db #0x40	; 64
   3F06 42                 2247 	.db #0x42	; 66	'B'
   3F07 0F                 2248 	.db #0x0F	; 15
   3F08 02                 2249 	.db #0x02	; 2
   3F09 06                 2250 	.db #0x06	; 6
   3F0A 1D                 2251 	.db #0x1D	; 29
   3F0B 00                 2252 	.db #0x00	; 0
   3F0C 10                 2253 	.db #0x10	; 16
   3F0D 40                 2254 	.db #0x40	; 64
   3F0E 19                 2255 	.db #0x19	; 25
   3F0F 40                 2256 	.db #0x40	; 64
   3F10 00                 2257 	.db #0x00	; 0
   3F11 00                 2258 	.db #0x00	; 0
   3F12 00                 2259 	.db #0x00	; 0
   3F13 00                 2260 	.db #0x00	; 0
   3F14 00                 2261 	.db #0x00	; 0
   3F15 00                 2262 	.db #0x00	; 0
   3F16 0D                 2263 	.db #0x0D	; 13
   3F17 12                 2264 	.db #0x12	; 18
   3F18 40                 2265 	.db #0x40	; 64
   3F19 01                 2266 	.db #0x01	; 1
   3F1A 00                 2267 	.db #0x00	; 0
   3F1B 7C                 2268 	.db #0x7C	; 124
   3F1C 18                 2269 	.db #0x18	; 24
   3F1D 78                 2270 	.db #0x78	; 120	'x'
   3F1E 0C                 2271 	.db #0x0C	; 12
   3F1F 34                 2272 	.db #0x34	; 52	'4'
   3F20 30                 2273 	.db #0x30	; 48	'0'
   3F21 2C                 2274 	.db #0x2C	; 44
   3F22 28                 2275 	.db #0x28	; 40
   3F23 24                 2276 	.db #0x24	; 36
   3F24 20                 2277 	.db #0x20	; 32
   3F25 1C                 2278 	.db #0x1C	; 28
   3F26 0D                 2279 	.db #0x0D	; 13
   3F27 25                 2280 	.db #0x25	; 37
   3F28 40                 2281 	.db #0x40	; 64
   3F29 20                 2282 	.db #0x20	; 32
   3F2A 00                 2283 	.db #0x00	; 0
   3F2B 00                 2284 	.db #0x00	; 0
   3F2C 00                 2285 	.db #0x00	; 0
   3F2D 39                 2286 	.db #0x39	; 57	'9'
   3F2E 40                 2287 	.db #0x40	; 64
   3F2F 00                 2288 	.db #0x00	; 0
   3F30 57                 2289 	.db #0x57	; 87	'W'
   3F31 40                 2290 	.db #0x40	; 64
   3F32 3B                 2291 	.db #0x3B	; 59
   3F33 40                 2292 	.db #0x40	; 64
   3F34 57                 2293 	.db #0x57	; 87	'W'
   3F35 40                 2294 	.db #0x40	; 64
   3F36 01                 2295 	.db #0x01	; 1
   3F37 2F                 2296 	.db #0x2F	; 47
   3F38 40                 2297 	.db #0x40	; 64
   3F39 19                 2298 	.db #0x19	; 25
   3F3A 00                 2299 	.db #0x00	; 0
   3F3B 76                 2300 	.db #0x76	; 118	'v'
   3F3C E1                 2301 	.db #0xE1	; 225
   3F3D 00                 2302 	.db #0x00	; 0
   3F3E 00                 2303 	.db #0x00	; 0
   3F3F 01                 2304 	.db #0x01	; 1
   3F40 04                 2305 	.db #0x04	; 4
   3F41 51                 2306 	.db #0x51	; 81	'Q'
   3F42 04                 2307 	.db #0x04	; 4
   3F43 37                 2308 	.db #0x37	; 55	'7'
   3F44 04                 2309 	.db #0x04	; 4
   3F45 4F                 2310 	.db #0x4F	; 79	'O'
   3F46 04                 2311 	.db #0x04	; 4
   3F47 37                 2312 	.db #0x37	; 55	'7'
   3F48 02                 2313 	.db #0x02	; 2
   3F49 4B                 2314 	.db #0x4B	; 75	'K'
   3F4A 02                 2315 	.db #0x02	; 2
   3F4B 37                 2316 	.db #0x37	; 55	'7'
   3F4C 04                 2317 	.db #0x04	; 4
   3F4D 4F                 2318 	.db #0x4F	; 79	'O'
   3F4E 04                 2319 	.db #0x04	; 4
   3F4F 37                 2320 	.db #0x37	; 55	'7'
   3F50 04                 2321 	.db #0x04	; 4
   3F51 4F                 2322 	.db #0x4F	; 79	'O'
   3F52 04                 2323 	.db #0x04	; 4
   3F53 37                 2324 	.db #0x37	; 55	'7'
   3F54 02                 2325 	.db #0x02	; 2
   3F55 4B                 2326 	.db #0x4B	; 75	'K'
   3F56 00                 2327 	.db #0x00	; 0
   3F57 42                 2328 	.db #0x42	; 66	'B'
   3F58 60                 2329 	.db #0x60	; 96
   3F59 00                 2330 	.db #0x00	; 0
   3F5A 42                 2331 	.db #0x42	; 66	'B'
   3F5B 80                 2332 	.db #0x80	; 128
   3F5C 00                 2333 	.db #0x00	; 0
   3F5D 00                 2334 	.db #0x00	; 0
   3F5E 42                 2335 	.db #0x42	; 66	'B'
   3F5F 00                 2336 	.db #0x00	; 0
   3F60 00                 2337 	.db #0x00	; 0
