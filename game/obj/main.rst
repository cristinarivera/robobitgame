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
                             15 	.globl _moverCuchillo
                             16 	.globl _checkKnifeCollision
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
                             27 	.globl _inicializarEnemy
                             28 	.globl _moverEnemigo
                             29 	.globl _moverEnemigoIzquierda
                             30 	.globl _moverEnemigoDerecha
                             31 	.globl _moverEnemigoAbajo
                             32 	.globl _moverEnemigoArriba
                             33 	.globl _checkEnemyCollision
                             34 	.globl _redibujarEnemigo
                             35 	.globl _borrarEnemigo
                             36 	.globl _borrarExplosion
                             37 	.globl _dibujarExplosion
                             38 	.globl _dibujarEnemigo
                             39 	.globl _checkCollision
                             40 	.globl _getTilePtr
                             41 	.globl _redibujarProta
                             42 	.globl _borrarProta
                             43 	.globl _dibujarProta
                             44 	.globl _dibujarMapa
                             45 	.globl _aumentarPuntuacion
                             46 	.globl _modificarPuntuacion
                             47 	.globl _barraPuntuacionInicial
                             48 	.globl _menuInicio
                             49 	.globl _menuFin
                             50 	.globl _cpct_etm_setTileset2x4
                             51 	.globl _cpct_etm_drawTileBox2x4
                             52 	.globl _cpct_akp_musicPlay
                             53 	.globl _cpct_akp_musicInit
                             54 	.globl _cpct_getScreenPtr
                             55 	.globl _cpct_setPALColour
                             56 	.globl _cpct_setPalette
                             57 	.globl _cpct_waitVSYNC
                             58 	.globl _cpct_setVideoMode
                             59 	.globl _cpct_drawSpriteMaskedAlignedTable
                             60 	.globl _cpct_isAnyKeyPressed
                             61 	.globl _cpct_isKeyPressed
                             62 	.globl _cpct_scanKeyboard_if
                             63 	.globl _cpct_disableFirmware
                             64 	.globl _vidas
                             65 	.globl _puntuacion
                             66 	.globl _num_mapa
                             67 	.globl _mapa
                             68 	.globl _cu
                             69 	.globl _prota
                             70 	.globl _enemy
                             71 	.globl _EEje
                             72 	.globl _EMirar
                             73 	.globl _spawnY
                             74 	.globl _spawnX
                             75 	.globl _mapas
                             76 ;--------------------------------------------------------
                             77 ; special function registers
                             78 ;--------------------------------------------------------
                             79 ;--------------------------------------------------------
                             80 ; ram data
                             81 ;--------------------------------------------------------
                             82 	.area _DATA
   90BA                      83 _EMirar::
   90BA                      84 	.ds 1
   90BB                      85 _EEje::
   90BB                      86 	.ds 1
   90BC                      87 _enemy::
   90BC                      88 	.ds 52
   90F0                      89 _prota::
   90F0                      90 	.ds 8
   90F8                      91 _cu::
   90F8                      92 	.ds 10
                             93 ;--------------------------------------------------------
                             94 ; ram data
                             95 ;--------------------------------------------------------
                             96 	.area _INITIALIZED
   9102                      97 _mapa::
   9102                      98 	.ds 2
   9104                      99 _num_mapa::
   9104                     100 	.ds 1
   9105                     101 _puntuacion::
   9105                     102 	.ds 1
   9106                     103 _vidas::
   9106                     104 	.ds 1
                            105 ;--------------------------------------------------------
                            106 ; absolute external ram data
                            107 ;--------------------------------------------------------
                            108 	.area _DABS (ABS)
                            109 ;--------------------------------------------------------
                            110 ; global & static initialisations
                            111 ;--------------------------------------------------------
                            112 	.area _HOME
                            113 	.area _GSINIT
                            114 	.area _GSFINAL
                            115 	.area _GSINIT
                            116 ;--------------------------------------------------------
                            117 ; Home
                            118 ;--------------------------------------------------------
                            119 	.area _HOME
                            120 	.area _HOME
                            121 ;--------------------------------------------------------
                            122 ; code
                            123 ;--------------------------------------------------------
                            124 	.area _CODE
                            125 ;src/main.c:108: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
                            126 ;	---------------------------------
                            127 ; Function dummy_cpct_transparentMaskTable0M0_container
                            128 ; ---------------------------------
   7C0A                     129 _dummy_cpct_transparentMaskTable0M0_container::
                            130 	.area _g_tablatrans_ (ABS) 
   3E00                     131 	.org 0x3E00 
   3E00                     132 	 _g_tablatrans::
   3E00 FF AA 55 00 AA AA   133 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E08 55 00 55 00 00 00   134 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E10 AA AA 00 00 AA AA   135 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E18 00 00 00 00 00 00   136 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E20 55 00 55 00 00 00   137 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E28 55 00 55 00 00 00   138 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E30 00 00 00 00 00 00   139 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E38 00 00 00 00 00 00   140 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E40 AA AA 00 00 AA AA   141 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E48 00 00 00 00 00 00   142 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E50 AA AA 00 00 AA AA   143 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E58 00 00 00 00 00 00   144 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E60 00 00 00 00 00 00   145 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E68 00 00 00 00 00 00   146 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E70 00 00 00 00 00 00   147 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E78 00 00 00 00 00 00   148 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E80 55 00 55 00 00 00   149 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E88 55 00 55 00 00 00   150 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E90 00 00 00 00 00 00   151 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E98 00 00 00 00 00 00   152 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA0 55 00 55 00 00 00   153 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA8 55 00 55 00 00 00   154 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB0 00 00 00 00 00 00   155 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB8 00 00 00 00 00 00   156 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC0 00 00 00 00 00 00   157 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC8 00 00 00 00 00 00   158 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED0 00 00 00 00 00 00   159 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED8 00 00 00 00 00 00   160 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE0 00 00 00 00 00 00   161 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE8 00 00 00 00 00 00   162 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF0 00 00 00 00 00 00   163 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF8 00 00 00 00 00 00   164 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            165 	.area _CSEG (REL, CON) 
                            166 ;src/main.c:114: void dibujarMapa() {
                            167 ;	---------------------------------
                            168 ; Function dibujarMapa
                            169 ; ---------------------------------
   910C                     170 _dibujarMapa::
                            171 ;src/main.c:115: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   910C 2A 02 91      [16]  172 	ld	hl,(_mapa)
   910F E5            [11]  173 	push	hl
   9110 21 F0 C0      [10]  174 	ld	hl,#0xC0F0
   9113 E5            [11]  175 	push	hl
   9114 21 2C 28      [10]  176 	ld	hl,#0x282C
   9117 E5            [11]  177 	push	hl
   9118 2E 00         [ 7]  178 	ld	l, #0x00
   911A E5            [11]  179 	push	hl
   911B AF            [ 4]  180 	xor	a, a
   911C F5            [11]  181 	push	af
   911D 33            [ 6]  182 	inc	sp
   911E CD 41 85      [17]  183 	call	_cpct_etm_drawTileBox2x4
   9121 C9            [10]  184 	ret
   9122                     185 _mapas:
   9122 C0 4D               186 	.dw _g_map1
   9124 E0 46               187 	.dw _g_map2
   9126 00 40               188 	.dw _g_map3
   9128                     189 _spawnX:
   9128 00                  190 	.db #0x00	; 0
   9129 28                  191 	.db #0x28	; 40
   912A 47                  192 	.db #0x47	; 71	'G'
   912B 14                  193 	.db #0x14	; 20
   912C 3C                  194 	.db #0x3C	; 60
   912D                     195 _spawnY:
   912D 00                  196 	.db #0x00	; 0
   912E 2C                  197 	.db #0x2C	; 44
   912F 72                  198 	.db #0x72	; 114	'r'
   9130 8A                  199 	.db #0x8A	; 138
   9131 8A                  200 	.db #0x8A	; 138
                            201 ;src/main.c:118: void dibujarProta() {
                            202 ;	---------------------------------
                            203 ; Function dibujarProta
                            204 ; ---------------------------------
   9132                     205 _dibujarProta::
                            206 ;src/main.c:119: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   9132 21 F1 90      [10]  207 	ld	hl, #_prota + 1
   9135 56            [ 7]  208 	ld	d,(hl)
   9136 21 F0 90      [10]  209 	ld	hl, #_prota + 0
   9139 46            [ 7]  210 	ld	b,(hl)
   913A D5            [11]  211 	push	de
   913B 33            [ 6]  212 	inc	sp
   913C C5            [11]  213 	push	bc
   913D 33            [ 6]  214 	inc	sp
   913E 21 00 C0      [10]  215 	ld	hl,#0xC000
   9141 E5            [11]  216 	push	hl
   9142 CD 5F 90      [17]  217 	call	_cpct_getScreenPtr
   9145 EB            [ 4]  218 	ex	de,hl
                            219 ;src/main.c:120: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   9146 ED 4B F4 90   [20]  220 	ld	bc, (#_prota + 4)
   914A 21 00 3E      [10]  221 	ld	hl,#_g_tablatrans
   914D E5            [11]  222 	push	hl
   914E 21 07 16      [10]  223 	ld	hl,#0x1607
   9151 E5            [11]  224 	push	hl
   9152 D5            [11]  225 	push	de
   9153 C5            [11]  226 	push	bc
   9154 CD 7F 90      [17]  227 	call	_cpct_drawSpriteMaskedAlignedTable
   9157 C9            [10]  228 	ret
                            229 ;src/main.c:123: void borrarProta() {
                            230 ;	---------------------------------
                            231 ; Function borrarProta
                            232 ; ---------------------------------
   9158                     233 _borrarProta::
   9158 DD E5         [15]  234 	push	ix
   915A DD 21 00 00   [14]  235 	ld	ix,#0
   915E DD 39         [15]  236 	add	ix,sp
   9160 F5            [11]  237 	push	af
   9161 3B            [ 6]  238 	dec	sp
                            239 ;src/main.c:125: u8 w = 4 + (prota.px & 1);
   9162 21 F2 90      [10]  240 	ld	hl, #_prota + 2
   9165 4E            [ 7]  241 	ld	c,(hl)
   9166 79            [ 4]  242 	ld	a,c
   9167 E6 01         [ 7]  243 	and	a, #0x01
   9169 47            [ 4]  244 	ld	b,a
   916A 04            [ 4]  245 	inc	b
   916B 04            [ 4]  246 	inc	b
   916C 04            [ 4]  247 	inc	b
   916D 04            [ 4]  248 	inc	b
                            249 ;src/main.c:128: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   916E 21 F3 90      [10]  250 	ld	hl, #_prota + 3
   9171 5E            [ 7]  251 	ld	e,(hl)
   9172 CB 4B         [ 8]  252 	bit	1, e
   9174 28 04         [12]  253 	jr	Z,00103$
   9176 3E 01         [ 7]  254 	ld	a,#0x01
   9178 18 02         [12]  255 	jr	00104$
   917A                     256 00103$:
   917A 3E 00         [ 7]  257 	ld	a,#0x00
   917C                     258 00104$:
   917C C6 06         [ 7]  259 	add	a, #0x06
   917E DD 77 FD      [19]  260 	ld	-3 (ix),a
                            261 ;src/main.c:130: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   9181 FD 2A 02 91   [20]  262 	ld	iy,(_mapa)
   9185 16 00         [ 7]  263 	ld	d,#0x00
   9187 7B            [ 4]  264 	ld	a,e
   9188 C6 E8         [ 7]  265 	add	a,#0xE8
   918A DD 77 FE      [19]  266 	ld	-2 (ix),a
   918D 7A            [ 4]  267 	ld	a,d
   918E CE FF         [ 7]  268 	adc	a,#0xFF
   9190 DD 77 FF      [19]  269 	ld	-1 (ix),a
   9193 DD 6E FE      [19]  270 	ld	l,-2 (ix)
   9196 DD 66 FF      [19]  271 	ld	h,-1 (ix)
   9199 DD CB FF 7E   [20]  272 	bit	7, -1 (ix)
   919D 28 04         [12]  273 	jr	Z,00105$
   919F 21 EB FF      [10]  274 	ld	hl,#0xFFEB
   91A2 19            [11]  275 	add	hl,de
   91A3                     276 00105$:
   91A3 CB 2C         [ 8]  277 	sra	h
   91A5 CB 1D         [ 8]  278 	rr	l
   91A7 CB 2C         [ 8]  279 	sra	h
   91A9 CB 1D         [ 8]  280 	rr	l
   91AB 55            [ 4]  281 	ld	d,l
   91AC CB 39         [ 8]  282 	srl	c
   91AE FD E5         [15]  283 	push	iy
   91B0 21 F0 C0      [10]  284 	ld	hl,#0xC0F0
   91B3 E5            [11]  285 	push	hl
   91B4 3E 28         [ 7]  286 	ld	a,#0x28
   91B6 F5            [11]  287 	push	af
   91B7 33            [ 6]  288 	inc	sp
   91B8 DD 7E FD      [19]  289 	ld	a,-3 (ix)
   91BB F5            [11]  290 	push	af
   91BC 33            [ 6]  291 	inc	sp
   91BD C5            [11]  292 	push	bc
   91BE 33            [ 6]  293 	inc	sp
   91BF D5            [11]  294 	push	de
   91C0 33            [ 6]  295 	inc	sp
   91C1 79            [ 4]  296 	ld	a,c
   91C2 F5            [11]  297 	push	af
   91C3 33            [ 6]  298 	inc	sp
   91C4 CD 41 85      [17]  299 	call	_cpct_etm_drawTileBox2x4
   91C7 DD F9         [10]  300 	ld	sp, ix
   91C9 DD E1         [14]  301 	pop	ix
   91CB C9            [10]  302 	ret
                            303 ;src/main.c:133: void redibujarProta() {
                            304 ;	---------------------------------
                            305 ; Function redibujarProta
                            306 ; ---------------------------------
   91CC                     307 _redibujarProta::
                            308 ;src/main.c:134: borrarProta();
   91CC CD 58 91      [17]  309 	call	_borrarProta
                            310 ;src/main.c:135: prota.px = prota.x;
   91CF 01 F2 90      [10]  311 	ld	bc,#_prota + 2
   91D2 3A F0 90      [13]  312 	ld	a, (#_prota + 0)
   91D5 02            [ 7]  313 	ld	(bc),a
                            314 ;src/main.c:136: prota.py = prota.y;
   91D6 01 F3 90      [10]  315 	ld	bc,#_prota + 3
   91D9 3A F1 90      [13]  316 	ld	a, (#_prota + 1)
   91DC 02            [ 7]  317 	ld	(bc),a
                            318 ;src/main.c:137: dibujarProta();
   91DD C3 32 91      [10]  319 	jp  _dibujarProta
                            320 ;src/main.c:140: u8* getTilePtr(u8 x, u8 y) {
                            321 ;	---------------------------------
                            322 ; Function getTilePtr
                            323 ; ---------------------------------
   91E0                     324 _getTilePtr::
   91E0 DD E5         [15]  325 	push	ix
   91E2 DD 21 00 00   [14]  326 	ld	ix,#0
   91E6 DD 39         [15]  327 	add	ix,sp
                            328 ;src/main.c:141: return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
   91E8 DD 4E 05      [19]  329 	ld	c,5 (ix)
   91EB 06 00         [ 7]  330 	ld	b,#0x00
   91ED 79            [ 4]  331 	ld	a,c
   91EE C6 E8         [ 7]  332 	add	a,#0xE8
   91F0 5F            [ 4]  333 	ld	e,a
   91F1 78            [ 4]  334 	ld	a,b
   91F2 CE FF         [ 7]  335 	adc	a,#0xFF
   91F4 57            [ 4]  336 	ld	d,a
   91F5 6B            [ 4]  337 	ld	l, e
   91F6 62            [ 4]  338 	ld	h, d
   91F7 CB 7A         [ 8]  339 	bit	7, d
   91F9 28 04         [12]  340 	jr	Z,00103$
   91FB 21 EB FF      [10]  341 	ld	hl,#0xFFEB
   91FE 09            [11]  342 	add	hl,bc
   91FF                     343 00103$:
   91FF CB 2C         [ 8]  344 	sra	h
   9201 CB 1D         [ 8]  345 	rr	l
   9203 CB 2C         [ 8]  346 	sra	h
   9205 CB 1D         [ 8]  347 	rr	l
   9207 4D            [ 4]  348 	ld	c, l
   9208 44            [ 4]  349 	ld	b, h
   9209 29            [11]  350 	add	hl, hl
   920A 29            [11]  351 	add	hl, hl
   920B 09            [11]  352 	add	hl, bc
   920C 29            [11]  353 	add	hl, hl
   920D 29            [11]  354 	add	hl, hl
   920E 29            [11]  355 	add	hl, hl
   920F 4D            [ 4]  356 	ld	c,l
   9210 44            [ 4]  357 	ld	b,h
   9211 2A 02 91      [16]  358 	ld	hl,(_mapa)
   9214 09            [11]  359 	add	hl,bc
   9215 DD 4E 04      [19]  360 	ld	c,4 (ix)
   9218 CB 39         [ 8]  361 	srl	c
   921A 59            [ 4]  362 	ld	e,c
   921B 16 00         [ 7]  363 	ld	d,#0x00
   921D 19            [11]  364 	add	hl,de
   921E DD E1         [14]  365 	pop	ix
   9220 C9            [10]  366 	ret
                            367 ;src/main.c:144: u8 checkCollision(int direction) { // check optimization
                            368 ;	---------------------------------
                            369 ; Function checkCollision
                            370 ; ---------------------------------
   9221                     371 _checkCollision::
   9221 DD E5         [15]  372 	push	ix
   9223 DD 21 00 00   [14]  373 	ld	ix,#0
   9227 DD 39         [15]  374 	add	ix,sp
   9229 F5            [11]  375 	push	af
                            376 ;src/main.c:145: u8 *headTile=0, *feetTile=0, *waistTile=0;
   922A 21 00 00      [10]  377 	ld	hl,#0x0000
   922D E3            [19]  378 	ex	(sp), hl
   922E 11 00 00      [10]  379 	ld	de,#0x0000
   9231 01 00 00      [10]  380 	ld	bc,#0x0000
                            381 ;src/main.c:147: switch (direction) {
   9234 DD CB 05 7E   [20]  382 	bit	7, 5 (ix)
   9238 C2 55 93      [10]  383 	jp	NZ,00105$
   923B 3E 03         [ 7]  384 	ld	a,#0x03
   923D DD BE 04      [19]  385 	cp	a, 4 (ix)
   9240 3E 00         [ 7]  386 	ld	a,#0x00
   9242 DD 9E 05      [19]  387 	sbc	a, 5 (ix)
   9245 E2 4A 92      [10]  388 	jp	PO, 00128$
   9248 EE 80         [ 7]  389 	xor	a, #0x80
   924A                     390 00128$:
   924A FA 55 93      [10]  391 	jp	M,00105$
   924D DD 5E 04      [19]  392 	ld	e,4 (ix)
   9250 16 00         [ 7]  393 	ld	d,#0x00
   9252 21 59 92      [10]  394 	ld	hl,#00129$
   9255 19            [11]  395 	add	hl,de
   9256 19            [11]  396 	add	hl,de
   9257 19            [11]  397 	add	hl,de
   9258 E9            [ 4]  398 	jp	(hl)
   9259                     399 00129$:
   9259 C3 65 92      [10]  400 	jp	00101$
   925C C3 B0 92      [10]  401 	jp	00102$
   925F C3 F1 92      [10]  402 	jp	00103$
   9262 C3 24 93      [10]  403 	jp	00104$
                            404 ;src/main.c:148: case 0:
   9265                     405 00101$:
                            406 ;src/main.c:149: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   9265 21 F1 90      [10]  407 	ld	hl, #(_prota + 0x0001) + 0
   9268 5E            [ 7]  408 	ld	e,(hl)
   9269 21 F0 90      [10]  409 	ld	hl, #_prota + 0
   926C 4E            [ 7]  410 	ld	c,(hl)
   926D 0C            [ 4]  411 	inc	c
   926E 0C            [ 4]  412 	inc	c
   926F 0C            [ 4]  413 	inc	c
   9270 0C            [ 4]  414 	inc	c
   9271 7B            [ 4]  415 	ld	a,e
   9272 F5            [11]  416 	push	af
   9273 33            [ 6]  417 	inc	sp
   9274 79            [ 4]  418 	ld	a,c
   9275 F5            [11]  419 	push	af
   9276 33            [ 6]  420 	inc	sp
   9277 CD E0 91      [17]  421 	call	_getTilePtr
   927A F1            [10]  422 	pop	af
   927B 33            [ 6]  423 	inc	sp
   927C 33            [ 6]  424 	inc	sp
   927D E5            [11]  425 	push	hl
                            426 ;src/main.c:150: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   927E 3A F1 90      [13]  427 	ld	a, (#(_prota + 0x0001) + 0)
   9281 C6 14         [ 7]  428 	add	a, #0x14
   9283 4F            [ 4]  429 	ld	c,a
   9284 21 F0 90      [10]  430 	ld	hl, #_prota + 0
   9287 46            [ 7]  431 	ld	b,(hl)
   9288 04            [ 4]  432 	inc	b
   9289 04            [ 4]  433 	inc	b
   928A 04            [ 4]  434 	inc	b
   928B 04            [ 4]  435 	inc	b
   928C 79            [ 4]  436 	ld	a,c
   928D F5            [11]  437 	push	af
   928E 33            [ 6]  438 	inc	sp
   928F C5            [11]  439 	push	bc
   9290 33            [ 6]  440 	inc	sp
   9291 CD E0 91      [17]  441 	call	_getTilePtr
   9294 F1            [10]  442 	pop	af
   9295 EB            [ 4]  443 	ex	de,hl
                            444 ;src/main.c:151: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   9296 3A F1 90      [13]  445 	ld	a, (#(_prota + 0x0001) + 0)
   9299 C6 0B         [ 7]  446 	add	a, #0x0B
   929B 47            [ 4]  447 	ld	b,a
   929C 3A F0 90      [13]  448 	ld	a, (#_prota + 0)
   929F C6 04         [ 7]  449 	add	a, #0x04
   92A1 D5            [11]  450 	push	de
   92A2 C5            [11]  451 	push	bc
   92A3 33            [ 6]  452 	inc	sp
   92A4 F5            [11]  453 	push	af
   92A5 33            [ 6]  454 	inc	sp
   92A6 CD E0 91      [17]  455 	call	_getTilePtr
   92A9 F1            [10]  456 	pop	af
   92AA 4D            [ 4]  457 	ld	c,l
   92AB 44            [ 4]  458 	ld	b,h
   92AC D1            [10]  459 	pop	de
                            460 ;src/main.c:152: break;
   92AD C3 55 93      [10]  461 	jp	00105$
                            462 ;src/main.c:153: case 1:
   92B0                     463 00102$:
                            464 ;src/main.c:154: headTile  = getTilePtr(prota.x - 1, prota.y);
   92B0 21 F1 90      [10]  465 	ld	hl, #(_prota + 0x0001) + 0
   92B3 56            [ 7]  466 	ld	d,(hl)
   92B4 21 F0 90      [10]  467 	ld	hl, #_prota + 0
   92B7 46            [ 7]  468 	ld	b,(hl)
   92B8 05            [ 4]  469 	dec	b
   92B9 D5            [11]  470 	push	de
   92BA 33            [ 6]  471 	inc	sp
   92BB C5            [11]  472 	push	bc
   92BC 33            [ 6]  473 	inc	sp
   92BD CD E0 91      [17]  474 	call	_getTilePtr
   92C0 F1            [10]  475 	pop	af
   92C1 33            [ 6]  476 	inc	sp
   92C2 33            [ 6]  477 	inc	sp
   92C3 E5            [11]  478 	push	hl
                            479 ;src/main.c:155: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
   92C4 3A F1 90      [13]  480 	ld	a, (#(_prota + 0x0001) + 0)
   92C7 C6 14         [ 7]  481 	add	a, #0x14
   92C9 57            [ 4]  482 	ld	d,a
   92CA 21 F0 90      [10]  483 	ld	hl, #_prota + 0
   92CD 46            [ 7]  484 	ld	b,(hl)
   92CE 05            [ 4]  485 	dec	b
   92CF D5            [11]  486 	push	de
   92D0 33            [ 6]  487 	inc	sp
   92D1 C5            [11]  488 	push	bc
   92D2 33            [ 6]  489 	inc	sp
   92D3 CD E0 91      [17]  490 	call	_getTilePtr
   92D6 F1            [10]  491 	pop	af
   92D7 EB            [ 4]  492 	ex	de,hl
                            493 ;src/main.c:156: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
   92D8 3A F1 90      [13]  494 	ld	a, (#(_prota + 0x0001) + 0)
   92DB C6 0B         [ 7]  495 	add	a, #0x0B
   92DD 47            [ 4]  496 	ld	b,a
   92DE 3A F0 90      [13]  497 	ld	a, (#_prota + 0)
   92E1 C6 FF         [ 7]  498 	add	a,#0xFF
   92E3 D5            [11]  499 	push	de
   92E4 C5            [11]  500 	push	bc
   92E5 33            [ 6]  501 	inc	sp
   92E6 F5            [11]  502 	push	af
   92E7 33            [ 6]  503 	inc	sp
   92E8 CD E0 91      [17]  504 	call	_getTilePtr
   92EB F1            [10]  505 	pop	af
   92EC 4D            [ 4]  506 	ld	c,l
   92ED 44            [ 4]  507 	ld	b,h
   92EE D1            [10]  508 	pop	de
                            509 ;src/main.c:157: break;
   92EF 18 64         [12]  510 	jr	00105$
                            511 ;src/main.c:158: case 2:
   92F1                     512 00103$:
                            513 ;src/main.c:159: headTile   = getTilePtr(prota.x, prota.y - 2);
   92F1 3A F1 90      [13]  514 	ld	a, (#(_prota + 0x0001) + 0)
   92F4 C6 FE         [ 7]  515 	add	a,#0xFE
   92F6 21 F0 90      [10]  516 	ld	hl, #_prota + 0
   92F9 56            [ 7]  517 	ld	d,(hl)
   92FA C5            [11]  518 	push	bc
   92FB F5            [11]  519 	push	af
   92FC 33            [ 6]  520 	inc	sp
   92FD D5            [11]  521 	push	de
   92FE 33            [ 6]  522 	inc	sp
   92FF CD E0 91      [17]  523 	call	_getTilePtr
   9302 F1            [10]  524 	pop	af
   9303 C1            [10]  525 	pop	bc
   9304 33            [ 6]  526 	inc	sp
   9305 33            [ 6]  527 	inc	sp
   9306 E5            [11]  528 	push	hl
                            529 ;src/main.c:160: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
   9307 21 F1 90      [10]  530 	ld	hl, #(_prota + 0x0001) + 0
   930A 56            [ 7]  531 	ld	d,(hl)
   930B 15            [ 4]  532 	dec	d
   930C 15            [ 4]  533 	dec	d
   930D 3A F0 90      [13]  534 	ld	a, (#_prota + 0)
   9310 C6 03         [ 7]  535 	add	a, #0x03
   9312 C5            [11]  536 	push	bc
   9313 D5            [11]  537 	push	de
   9314 33            [ 6]  538 	inc	sp
   9315 F5            [11]  539 	push	af
   9316 33            [ 6]  540 	inc	sp
   9317 CD E0 91      [17]  541 	call	_getTilePtr
   931A F1            [10]  542 	pop	af
   931B EB            [ 4]  543 	ex	de,hl
   931C C1            [10]  544 	pop	bc
                            545 ;src/main.c:161: *waistTile = 0;
   931D 21 00 00      [10]  546 	ld	hl,#0x0000
   9320 36 00         [10]  547 	ld	(hl),#0x00
                            548 ;src/main.c:162: break;
   9322 18 31         [12]  549 	jr	00105$
                            550 ;src/main.c:163: case 3:
   9324                     551 00104$:
                            552 ;src/main.c:164: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
   9324 3A F1 90      [13]  553 	ld	a, (#(_prota + 0x0001) + 0)
   9327 C6 16         [ 7]  554 	add	a, #0x16
   9329 21 F0 90      [10]  555 	ld	hl, #_prota + 0
   932C 56            [ 7]  556 	ld	d,(hl)
   932D C5            [11]  557 	push	bc
   932E F5            [11]  558 	push	af
   932F 33            [ 6]  559 	inc	sp
   9330 D5            [11]  560 	push	de
   9331 33            [ 6]  561 	inc	sp
   9332 CD E0 91      [17]  562 	call	_getTilePtr
   9335 F1            [10]  563 	pop	af
   9336 C1            [10]  564 	pop	bc
   9337 33            [ 6]  565 	inc	sp
   9338 33            [ 6]  566 	inc	sp
   9339 E5            [11]  567 	push	hl
                            568 ;src/main.c:165: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   933A 3A F1 90      [13]  569 	ld	a, (#(_prota + 0x0001) + 0)
   933D C6 16         [ 7]  570 	add	a, #0x16
   933F 57            [ 4]  571 	ld	d,a
   9340 3A F0 90      [13]  572 	ld	a, (#_prota + 0)
   9343 C6 03         [ 7]  573 	add	a, #0x03
   9345 C5            [11]  574 	push	bc
   9346 D5            [11]  575 	push	de
   9347 33            [ 6]  576 	inc	sp
   9348 F5            [11]  577 	push	af
   9349 33            [ 6]  578 	inc	sp
   934A CD E0 91      [17]  579 	call	_getTilePtr
   934D F1            [10]  580 	pop	af
   934E EB            [ 4]  581 	ex	de,hl
   934F C1            [10]  582 	pop	bc
                            583 ;src/main.c:166: *waistTile = 0;
   9350 21 00 00      [10]  584 	ld	hl,#0x0000
   9353 36 00         [10]  585 	ld	(hl),#0x00
                            586 ;src/main.c:168: }
   9355                     587 00105$:
                            588 ;src/main.c:170: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   9355 E1            [10]  589 	pop	hl
   9356 E5            [11]  590 	push	hl
   9357 6E            [ 7]  591 	ld	l,(hl)
   9358 3E 02         [ 7]  592 	ld	a,#0x02
   935A 95            [ 4]  593 	sub	a, l
   935B 38 0E         [12]  594 	jr	C,00106$
   935D 1A            [ 7]  595 	ld	a,(de)
   935E 5F            [ 4]  596 	ld	e,a
   935F 3E 02         [ 7]  597 	ld	a,#0x02
   9361 93            [ 4]  598 	sub	a, e
   9362 38 07         [12]  599 	jr	C,00106$
   9364 0A            [ 7]  600 	ld	a,(bc)
   9365 4F            [ 4]  601 	ld	c,a
   9366 3E 02         [ 7]  602 	ld	a,#0x02
   9368 91            [ 4]  603 	sub	a, c
   9369 30 04         [12]  604 	jr	NC,00107$
   936B                     605 00106$:
                            606 ;src/main.c:171: return 1;
   936B 2E 01         [ 7]  607 	ld	l,#0x01
   936D 18 02         [12]  608 	jr	00110$
   936F                     609 00107$:
                            610 ;src/main.c:173: return 0;
   936F 2E 00         [ 7]  611 	ld	l,#0x00
   9371                     612 00110$:
   9371 DD F9         [10]  613 	ld	sp, ix
   9373 DD E1         [14]  614 	pop	ix
   9375 C9            [10]  615 	ret
                            616 ;src/main.c:176: void dibujarEnemigo(TEnemy *enemy) {
                            617 ;	---------------------------------
                            618 ; Function dibujarEnemigo
                            619 ; ---------------------------------
   9376                     620 _dibujarEnemigo::
   9376 DD E5         [15]  621 	push	ix
   9378 DD 21 00 00   [14]  622 	ld	ix,#0
   937C DD 39         [15]  623 	add	ix,sp
                            624 ;src/main.c:177: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   937E DD 4E 04      [19]  625 	ld	c,4 (ix)
   9381 DD 46 05      [19]  626 	ld	b,5 (ix)
   9384 69            [ 4]  627 	ld	l, c
   9385 60            [ 4]  628 	ld	h, b
   9386 23            [ 6]  629 	inc	hl
   9387 56            [ 7]  630 	ld	d,(hl)
   9388 0A            [ 7]  631 	ld	a,(bc)
   9389 C5            [11]  632 	push	bc
   938A D5            [11]  633 	push	de
   938B 33            [ 6]  634 	inc	sp
   938C F5            [11]  635 	push	af
   938D 33            [ 6]  636 	inc	sp
   938E 21 00 C0      [10]  637 	ld	hl,#0xC000
   9391 E5            [11]  638 	push	hl
   9392 CD 5F 90      [17]  639 	call	_cpct_getScreenPtr
   9395 EB            [ 4]  640 	ex	de,hl
                            641 ;src/main.c:178: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   9396 E1            [10]  642 	pop	hl
   9397 01 04 00      [10]  643 	ld	bc, #0x0004
   939A 09            [11]  644 	add	hl, bc
   939B 4E            [ 7]  645 	ld	c,(hl)
   939C 23            [ 6]  646 	inc	hl
   939D 46            [ 7]  647 	ld	b,(hl)
   939E 21 00 3E      [10]  648 	ld	hl,#_g_tablatrans
   93A1 E5            [11]  649 	push	hl
   93A2 21 04 16      [10]  650 	ld	hl,#0x1604
   93A5 E5            [11]  651 	push	hl
   93A6 D5            [11]  652 	push	de
   93A7 C5            [11]  653 	push	bc
   93A8 CD 7F 90      [17]  654 	call	_cpct_drawSpriteMaskedAlignedTable
   93AB DD E1         [14]  655 	pop	ix
   93AD C9            [10]  656 	ret
                            657 ;src/main.c:181: void dibujarExplosion(TEnemy *enemy) {
                            658 ;	---------------------------------
                            659 ; Function dibujarExplosion
                            660 ; ---------------------------------
   93AE                     661 _dibujarExplosion::
   93AE DD E5         [15]  662 	push	ix
   93B0 DD 21 00 00   [14]  663 	ld	ix,#0
   93B4 DD 39         [15]  664 	add	ix,sp
                            665 ;src/main.c:182: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   93B6 DD 4E 04      [19]  666 	ld	c,4 (ix)
   93B9 DD 46 05      [19]  667 	ld	b,5 (ix)
   93BC 69            [ 4]  668 	ld	l, c
   93BD 60            [ 4]  669 	ld	h, b
   93BE 23            [ 6]  670 	inc	hl
   93BF 56            [ 7]  671 	ld	d,(hl)
   93C0 0A            [ 7]  672 	ld	a,(bc)
   93C1 47            [ 4]  673 	ld	b,a
   93C2 D5            [11]  674 	push	de
   93C3 33            [ 6]  675 	inc	sp
   93C4 C5            [11]  676 	push	bc
   93C5 33            [ 6]  677 	inc	sp
   93C6 21 00 C0      [10]  678 	ld	hl,#0xC000
   93C9 E5            [11]  679 	push	hl
   93CA CD 5F 90      [17]  680 	call	_cpct_getScreenPtr
   93CD 4D            [ 4]  681 	ld	c,l
   93CE 44            [ 4]  682 	ld	b,h
                            683 ;src/main.c:183: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   93CF 11 00 3E      [10]  684 	ld	de,#_g_tablatrans+0
   93D2 D5            [11]  685 	push	de
   93D3 21 04 16      [10]  686 	ld	hl,#0x1604
   93D6 E5            [11]  687 	push	hl
   93D7 C5            [11]  688 	push	bc
   93D8 21 70 56      [10]  689 	ld	hl,#_g_explosion
   93DB E5            [11]  690 	push	hl
   93DC CD 7F 90      [17]  691 	call	_cpct_drawSpriteMaskedAlignedTable
   93DF DD E1         [14]  692 	pop	ix
   93E1 C9            [10]  693 	ret
                            694 ;src/main.c:186: void borrarExplosion() {
                            695 ;	---------------------------------
                            696 ; Function borrarExplosion
                            697 ; ---------------------------------
   93E2                     698 _borrarExplosion::
   93E2 DD E5         [15]  699 	push	ix
   93E4 DD 21 00 00   [14]  700 	ld	ix,#0
   93E8 DD 39         [15]  701 	add	ix,sp
   93EA F5            [11]  702 	push	af
   93EB 3B            [ 6]  703 	dec	sp
                            704 ;src/main.c:187: u8 w = 4 + (enemy->px & 1);
   93EC 21 BE 90      [10]  705 	ld	hl, #_enemy + 2
   93EF 4E            [ 7]  706 	ld	c,(hl)
   93F0 79            [ 4]  707 	ld	a,c
   93F1 E6 01         [ 7]  708 	and	a, #0x01
   93F3 47            [ 4]  709 	ld	b,a
   93F4 04            [ 4]  710 	inc	b
   93F5 04            [ 4]  711 	inc	b
   93F6 04            [ 4]  712 	inc	b
   93F7 04            [ 4]  713 	inc	b
                            714 ;src/main.c:190: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   93F8 21 BF 90      [10]  715 	ld	hl, #_enemy + 3
   93FB 5E            [ 7]  716 	ld	e,(hl)
   93FC CB 4B         [ 8]  717 	bit	1, e
   93FE 28 04         [12]  718 	jr	Z,00103$
   9400 3E 01         [ 7]  719 	ld	a,#0x01
   9402 18 02         [12]  720 	jr	00104$
   9404                     721 00103$:
   9404 3E 00         [ 7]  722 	ld	a,#0x00
   9406                     723 00104$:
   9406 C6 07         [ 7]  724 	add	a, #0x07
   9408 DD 77 FD      [19]  725 	ld	-3 (ix),a
                            726 ;src/main.c:192: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   940B FD 2A 02 91   [20]  727 	ld	iy,(_mapa)
   940F 16 00         [ 7]  728 	ld	d,#0x00
   9411 7B            [ 4]  729 	ld	a,e
   9412 C6 E8         [ 7]  730 	add	a,#0xE8
   9414 DD 77 FE      [19]  731 	ld	-2 (ix),a
   9417 7A            [ 4]  732 	ld	a,d
   9418 CE FF         [ 7]  733 	adc	a,#0xFF
   941A DD 77 FF      [19]  734 	ld	-1 (ix),a
   941D DD 6E FE      [19]  735 	ld	l,-2 (ix)
   9420 DD 66 FF      [19]  736 	ld	h,-1 (ix)
   9423 DD CB FF 7E   [20]  737 	bit	7, -1 (ix)
   9427 28 04         [12]  738 	jr	Z,00105$
   9429 21 EB FF      [10]  739 	ld	hl,#0xFFEB
   942C 19            [11]  740 	add	hl,de
   942D                     741 00105$:
   942D CB 2C         [ 8]  742 	sra	h
   942F CB 1D         [ 8]  743 	rr	l
   9431 CB 2C         [ 8]  744 	sra	h
   9433 CB 1D         [ 8]  745 	rr	l
   9435 55            [ 4]  746 	ld	d,l
   9436 CB 39         [ 8]  747 	srl	c
   9438 FD E5         [15]  748 	push	iy
   943A 21 F0 C0      [10]  749 	ld	hl,#0xC0F0
   943D E5            [11]  750 	push	hl
   943E 3E 28         [ 7]  751 	ld	a,#0x28
   9440 F5            [11]  752 	push	af
   9441 33            [ 6]  753 	inc	sp
   9442 DD 7E FD      [19]  754 	ld	a,-3 (ix)
   9445 F5            [11]  755 	push	af
   9446 33            [ 6]  756 	inc	sp
   9447 C5            [11]  757 	push	bc
   9448 33            [ 6]  758 	inc	sp
   9449 D5            [11]  759 	push	de
   944A 33            [ 6]  760 	inc	sp
   944B 79            [ 4]  761 	ld	a,c
   944C F5            [11]  762 	push	af
   944D 33            [ 6]  763 	inc	sp
   944E CD 41 85      [17]  764 	call	_cpct_etm_drawTileBox2x4
   9451 DD F9         [10]  765 	ld	sp, ix
   9453 DD E1         [14]  766 	pop	ix
   9455 C9            [10]  767 	ret
                            768 ;src/main.c:196: void borrarEnemigo(TEnemy *enemy) {
                            769 ;	---------------------------------
                            770 ; Function borrarEnemigo
                            771 ; ---------------------------------
   9456                     772 _borrarEnemigo::
   9456 DD E5         [15]  773 	push	ix
   9458 DD 21 00 00   [14]  774 	ld	ix,#0
   945C DD 39         [15]  775 	add	ix,sp
   945E 21 FA FF      [10]  776 	ld	hl,#-6
   9461 39            [11]  777 	add	hl,sp
   9462 F9            [ 6]  778 	ld	sp,hl
                            779 ;src/main.c:198: u8 w = 4 + (enemy->px & 1);
   9463 DD 4E 04      [19]  780 	ld	c,4 (ix)
   9466 DD 46 05      [19]  781 	ld	b,5 (ix)
   9469 69            [ 4]  782 	ld	l, c
   946A 60            [ 4]  783 	ld	h, b
   946B 23            [ 6]  784 	inc	hl
   946C 23            [ 6]  785 	inc	hl
   946D 5E            [ 7]  786 	ld	e,(hl)
   946E 7B            [ 4]  787 	ld	a,e
   946F E6 01         [ 7]  788 	and	a, #0x01
   9471 C6 04         [ 7]  789 	add	a, #0x04
   9473 DD 77 FA      [19]  790 	ld	-6 (ix),a
                            791 ;src/main.c:201: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   9476 69            [ 4]  792 	ld	l, c
   9477 60            [ 4]  793 	ld	h, b
   9478 23            [ 6]  794 	inc	hl
   9479 23            [ 6]  795 	inc	hl
   947A 23            [ 6]  796 	inc	hl
   947B 56            [ 7]  797 	ld	d,(hl)
   947C CB 4A         [ 8]  798 	bit	1, d
   947E 28 04         [12]  799 	jr	Z,00103$
   9480 3E 01         [ 7]  800 	ld	a,#0x01
   9482 18 02         [12]  801 	jr	00104$
   9484                     802 00103$:
   9484 3E 00         [ 7]  803 	ld	a,#0x00
   9486                     804 00104$:
   9486 C6 07         [ 7]  805 	add	a, #0x07
   9488 DD 77 FB      [19]  806 	ld	-5 (ix),a
                            807 ;src/main.c:203: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   948B FD 2A 02 91   [20]  808 	ld	iy,(_mapa)
   948F DD 72 FE      [19]  809 	ld	-2 (ix),d
   9492 DD 36 FF 00   [19]  810 	ld	-1 (ix),#0x00
   9496 DD 7E FE      [19]  811 	ld	a,-2 (ix)
   9499 C6 E8         [ 7]  812 	add	a,#0xE8
   949B DD 77 FC      [19]  813 	ld	-4 (ix),a
   949E DD 7E FF      [19]  814 	ld	a,-1 (ix)
   94A1 CE FF         [ 7]  815 	adc	a,#0xFF
   94A3 DD 77 FD      [19]  816 	ld	-3 (ix),a
   94A6 DD 56 FC      [19]  817 	ld	d,-4 (ix)
   94A9 DD 6E FD      [19]  818 	ld	l,-3 (ix)
   94AC DD CB FD 7E   [20]  819 	bit	7, -3 (ix)
   94B0 28 0C         [12]  820 	jr	Z,00105$
   94B2 DD 7E FE      [19]  821 	ld	a,-2 (ix)
   94B5 C6 EB         [ 7]  822 	add	a, #0xEB
   94B7 57            [ 4]  823 	ld	d,a
   94B8 DD 7E FF      [19]  824 	ld	a,-1 (ix)
   94BB CE FF         [ 7]  825 	adc	a, #0xFF
   94BD 6F            [ 4]  826 	ld	l,a
   94BE                     827 00105$:
   94BE CB 2D         [ 8]  828 	sra	l
   94C0 CB 1A         [ 8]  829 	rr	d
   94C2 CB 2D         [ 8]  830 	sra	l
   94C4 CB 1A         [ 8]  831 	rr	d
   94C6 CB 3B         [ 8]  832 	srl	e
   94C8 C5            [11]  833 	push	bc
   94C9 FD E5         [15]  834 	push	iy
   94CB 21 F0 C0      [10]  835 	ld	hl,#0xC0F0
   94CE E5            [11]  836 	push	hl
   94CF 3E 28         [ 7]  837 	ld	a,#0x28
   94D1 F5            [11]  838 	push	af
   94D2 33            [ 6]  839 	inc	sp
   94D3 DD 66 FB      [19]  840 	ld	h,-5 (ix)
   94D6 DD 6E FA      [19]  841 	ld	l,-6 (ix)
   94D9 E5            [11]  842 	push	hl
   94DA D5            [11]  843 	push	de
   94DB CD 41 85      [17]  844 	call	_cpct_etm_drawTileBox2x4
   94DE C1            [10]  845 	pop	bc
                            846 ;src/main.c:205: enemy->mover = NO;
   94DF 21 06 00      [10]  847 	ld	hl,#0x0006
   94E2 09            [11]  848 	add	hl,bc
   94E3 36 00         [10]  849 	ld	(hl),#0x00
   94E5 DD F9         [10]  850 	ld	sp, ix
   94E7 DD E1         [14]  851 	pop	ix
   94E9 C9            [10]  852 	ret
                            853 ;src/main.c:208: void redibujarEnemigo(TEnemy *enemy) {
                            854 ;	---------------------------------
                            855 ; Function redibujarEnemigo
                            856 ; ---------------------------------
   94EA                     857 _redibujarEnemigo::
   94EA DD E5         [15]  858 	push	ix
   94EC DD 21 00 00   [14]  859 	ld	ix,#0
   94F0 DD 39         [15]  860 	add	ix,sp
                            861 ;src/main.c:209: borrarEnemigo(enemy);
   94F2 DD 6E 04      [19]  862 	ld	l,4 (ix)
   94F5 DD 66 05      [19]  863 	ld	h,5 (ix)
   94F8 E5            [11]  864 	push	hl
   94F9 CD 56 94      [17]  865 	call	_borrarEnemigo
   94FC F1            [10]  866 	pop	af
                            867 ;src/main.c:210: enemy->px = enemy->x;
   94FD DD 4E 04      [19]  868 	ld	c,4 (ix)
   9500 DD 46 05      [19]  869 	ld	b,5 (ix)
   9503 59            [ 4]  870 	ld	e, c
   9504 50            [ 4]  871 	ld	d, b
   9505 13            [ 6]  872 	inc	de
   9506 13            [ 6]  873 	inc	de
   9507 0A            [ 7]  874 	ld	a,(bc)
   9508 12            [ 7]  875 	ld	(de),a
                            876 ;src/main.c:211: enemy->py = enemy->y;
   9509 59            [ 4]  877 	ld	e, c
   950A 50            [ 4]  878 	ld	d, b
   950B 13            [ 6]  879 	inc	de
   950C 13            [ 6]  880 	inc	de
   950D 13            [ 6]  881 	inc	de
   950E 69            [ 4]  882 	ld	l, c
   950F 60            [ 4]  883 	ld	h, b
   9510 23            [ 6]  884 	inc	hl
   9511 7E            [ 7]  885 	ld	a,(hl)
   9512 12            [ 7]  886 	ld	(de),a
                            887 ;src/main.c:212: dibujarEnemigo(enemy);
   9513 C5            [11]  888 	push	bc
   9514 CD 76 93      [17]  889 	call	_dibujarEnemigo
   9517 F1            [10]  890 	pop	af
   9518 DD E1         [14]  891 	pop	ix
   951A C9            [10]  892 	ret
                            893 ;src/main.c:215: u8 checkEnemyCollision(int direction, TEnemy *enemy){
                            894 ;	---------------------------------
                            895 ; Function checkEnemyCollision
                            896 ; ---------------------------------
   951B                     897 _checkEnemyCollision::
   951B DD E5         [15]  898 	push	ix
   951D DD 21 00 00   [14]  899 	ld	ix,#0
   9521 DD 39         [15]  900 	add	ix,sp
   9523 21 F7 FF      [10]  901 	ld	hl,#-9
   9526 39            [11]  902 	add	hl,sp
   9527 F9            [ 6]  903 	ld	sp,hl
                            904 ;src/main.c:217: u8 colisiona = 1;
   9528 DD 36 F7 01   [19]  905 	ld	-9 (ix),#0x01
                            906 ;src/main.c:219: switch (direction) {
   952C DD CB 05 7E   [20]  907 	bit	7, 5 (ix)
   9530 C2 E3 98      [10]  908 	jp	NZ,00165$
   9533 3E 03         [ 7]  909 	ld	a,#0x03
   9535 DD BE 04      [19]  910 	cp	a, 4 (ix)
   9538 3E 00         [ 7]  911 	ld	a,#0x00
   953A DD 9E 05      [19]  912 	sbc	a, 5 (ix)
   953D E2 42 95      [10]  913 	jp	PO, 00272$
   9540 EE 80         [ 7]  914 	xor	a, #0x80
   9542                     915 00272$:
   9542 FA E3 98      [10]  916 	jp	M,00165$
                            917 ;src/main.c:221: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   9545 DD 4E 06      [19]  918 	ld	c,6 (ix)
   9548 DD 46 07      [19]  919 	ld	b,7 (ix)
   954B 0A            [ 7]  920 	ld	a,(bc)
   954C 5F            [ 4]  921 	ld	e,a
   954D 21 01 00      [10]  922 	ld	hl,#0x0001
   9550 09            [11]  923 	add	hl,bc
   9551 DD 75 F8      [19]  924 	ld	-8 (ix),l
   9554 DD 74 F9      [19]  925 	ld	-7 (ix),h
   9557 DD 6E F8      [19]  926 	ld	l,-8 (ix)
   955A DD 66 F9      [19]  927 	ld	h,-7 (ix)
   955D 56            [ 7]  928 	ld	d,(hl)
                            929 ;src/main.c:234: enemy->muerto = SI;
   955E 21 08 00      [10]  930 	ld	hl,#0x0008
   9561 09            [11]  931 	add	hl,bc
   9562 DD 75 FA      [19]  932 	ld	-6 (ix),l
   9565 DD 74 FB      [19]  933 	ld	-5 (ix),h
                            934 ;src/main.c:241: enemy->mira = M_izquierda;
   9568 21 07 00      [10]  935 	ld	hl,#0x0007
   956B 09            [11]  936 	add	hl,bc
   956C DD 75 FC      [19]  937 	ld	-4 (ix),l
   956F DD 74 FD      [19]  938 	ld	-3 (ix),h
                            939 ;src/main.c:219: switch (direction) {
   9572 D5            [11]  940 	push	de
   9573 DD 5E 04      [19]  941 	ld	e,4 (ix)
   9576 16 00         [ 7]  942 	ld	d,#0x00
   9578 21 80 95      [10]  943 	ld	hl,#00273$
   957B 19            [11]  944 	add	hl,de
   957C 19            [11]  945 	add	hl,de
   957D 19            [11]  946 	add	hl,de
   957E D1            [10]  947 	pop	de
   957F E9            [ 4]  948 	jp	(hl)
   9580                     949 00273$:
   9580 C3 8C 95      [10]  950 	jp	00101$
   9583 C3 65 96      [10]  951 	jp	00117$
   9586 C3 3A 97      [10]  952 	jp	00133$
   9589 C3 09 98      [10]  953 	jp	00149$
                            954 ;src/main.c:220: case 0:
   958C                     955 00101$:
                            956 ;src/main.c:221: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   958C 7B            [ 4]  957 	ld	a,e
   958D C6 05         [ 7]  958 	add	a, #0x05
   958F C5            [11]  959 	push	bc
   9590 D5            [11]  960 	push	de
   9591 33            [ 6]  961 	inc	sp
   9592 F5            [11]  962 	push	af
   9593 33            [ 6]  963 	inc	sp
   9594 CD E0 91      [17]  964 	call	_getTilePtr
   9597 F1            [10]  965 	pop	af
   9598 C1            [10]  966 	pop	bc
   9599 5E            [ 7]  967 	ld	e,(hl)
   959A 3E 02         [ 7]  968 	ld	a,#0x02
   959C 93            [ 4]  969 	sub	a, e
   959D DA 5A 96      [10]  970 	jp	C,00113$
                            971 ;src/main.c:222: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   95A0 DD 6E F8      [19]  972 	ld	l,-8 (ix)
   95A3 DD 66 F9      [19]  973 	ld	h,-7 (ix)
   95A6 7E            [ 7]  974 	ld	a,(hl)
   95A7 C6 0B         [ 7]  975 	add	a, #0x0B
   95A9 57            [ 4]  976 	ld	d,a
   95AA 0A            [ 7]  977 	ld	a,(bc)
   95AB C6 05         [ 7]  978 	add	a, #0x05
   95AD C5            [11]  979 	push	bc
   95AE D5            [11]  980 	push	de
   95AF 33            [ 6]  981 	inc	sp
   95B0 F5            [11]  982 	push	af
   95B1 33            [ 6]  983 	inc	sp
   95B2 CD E0 91      [17]  984 	call	_getTilePtr
   95B5 F1            [10]  985 	pop	af
   95B6 C1            [10]  986 	pop	bc
   95B7 5E            [ 7]  987 	ld	e,(hl)
   95B8 3E 02         [ 7]  988 	ld	a,#0x02
   95BA 93            [ 4]  989 	sub	a, e
   95BB DA 5A 96      [10]  990 	jp	C,00113$
                            991 ;src/main.c:223: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   95BE DD 6E F8      [19]  992 	ld	l,-8 (ix)
   95C1 DD 66 F9      [19]  993 	ld	h,-7 (ix)
   95C4 7E            [ 7]  994 	ld	a,(hl)
   95C5 C6 16         [ 7]  995 	add	a, #0x16
   95C7 57            [ 4]  996 	ld	d,a
   95C8 0A            [ 7]  997 	ld	a,(bc)
   95C9 C6 05         [ 7]  998 	add	a, #0x05
   95CB C5            [11]  999 	push	bc
   95CC D5            [11] 1000 	push	de
   95CD 33            [ 6] 1001 	inc	sp
   95CE F5            [11] 1002 	push	af
   95CF 33            [ 6] 1003 	inc	sp
   95D0 CD E0 91      [17] 1004 	call	_getTilePtr
   95D3 F1            [10] 1005 	pop	af
   95D4 C1            [10] 1006 	pop	bc
   95D5 5E            [ 7] 1007 	ld	e,(hl)
   95D6 3E 02         [ 7] 1008 	ld	a,#0x02
   95D8 93            [ 4] 1009 	sub	a, e
   95D9 DA 5A 96      [10] 1010 	jp	C,00113$
                           1011 ;src/main.c:225: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   95DC 21 F9 90      [10] 1012 	ld	hl, #_cu + 1
   95DF 5E            [ 7] 1013 	ld	e,(hl)
   95E0 16 00         [ 7] 1014 	ld	d,#0x00
   95E2 21 04 00      [10] 1015 	ld	hl,#0x0004
   95E5 19            [11] 1016 	add	hl,de
   95E6 DD 75 FE      [19] 1017 	ld	-2 (ix),l
   95E9 DD 74 FF      [19] 1018 	ld	-1 (ix),h
   95EC DD 6E F8      [19] 1019 	ld	l,-8 (ix)
   95EF DD 66 F9      [19] 1020 	ld	h,-7 (ix)
   95F2 6E            [ 7] 1021 	ld	l,(hl)
   95F3 26 00         [ 7] 1022 	ld	h,#0x00
   95F5 DD 7E FE      [19] 1023 	ld	a,-2 (ix)
   95F8 95            [ 4] 1024 	sub	a, l
   95F9 DD 7E FF      [19] 1025 	ld	a,-1 (ix)
   95FC 9C            [ 4] 1026 	sbc	a, h
   95FD E2 02 96      [10] 1027 	jp	PO, 00274$
   9600 EE 80         [ 7] 1028 	xor	a, #0x80
   9602                    1029 00274$:
   9602 FA 17 96      [10] 1030 	jp	M,00108$
   9605 D5            [11] 1031 	push	de
   9606 11 16 00      [10] 1032 	ld	de,#0x0016
   9609 19            [11] 1033 	add	hl, de
   960A D1            [10] 1034 	pop	de
   960B 7D            [ 4] 1035 	ld	a,l
   960C 93            [ 4] 1036 	sub	a, e
   960D 7C            [ 4] 1037 	ld	a,h
   960E 9A            [ 4] 1038 	sbc	a, d
   960F E2 14 96      [10] 1039 	jp	PO, 00275$
   9612 EE 80         [ 7] 1040 	xor	a, #0x80
   9614                    1041 00275$:
   9614 F2 1E 96      [10] 1042 	jp	P,00109$
   9617                    1043 00108$:
                           1044 ;src/main.c:226: colisiona = 0;
   9617 DD 36 F7 00   [19] 1045 	ld	-9 (ix),#0x00
   961B C3 E3 98      [10] 1046 	jp	00165$
   961E                    1047 00109$:
                           1048 ;src/main.c:229: if(cu.x > enemy->x){ //si el cu esta abajo
   961E 21 F8 90      [10] 1049 	ld	hl, #_cu + 0
   9621 5E            [ 7] 1050 	ld	e,(hl)
   9622 0A            [ 7] 1051 	ld	a,(bc)
   9623 4F            [ 4] 1052 	ld	c,a
   9624 93            [ 4] 1053 	sub	a, e
   9625 30 2C         [12] 1054 	jr	NC,00106$
                           1055 ;src/main.c:230: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
   9627 6B            [ 4] 1056 	ld	l,e
   9628 26 00         [ 7] 1057 	ld	h,#0x00
   962A 06 00         [ 7] 1058 	ld	b,#0x00
   962C 03            [ 6] 1059 	inc	bc
   962D 03            [ 6] 1060 	inc	bc
   962E 03            [ 6] 1061 	inc	bc
   962F 03            [ 6] 1062 	inc	bc
   9630 BF            [ 4] 1063 	cp	a, a
   9631 ED 42         [15] 1064 	sbc	hl, bc
   9633 3E 01         [ 7] 1065 	ld	a,#0x01
   9635 BD            [ 4] 1066 	cp	a, l
   9636 3E 00         [ 7] 1067 	ld	a,#0x00
   9638 9C            [ 4] 1068 	sbc	a, h
   9639 E2 3E 96      [10] 1069 	jp	PO, 00276$
   963C EE 80         [ 7] 1070 	xor	a, #0x80
   963E                    1071 00276$:
   963E F2 48 96      [10] 1072 	jp	P,00103$
                           1073 ;src/main.c:231: colisiona = 0;
   9641 DD 36 F7 00   [19] 1074 	ld	-9 (ix),#0x00
   9645 C3 E3 98      [10] 1075 	jp	00165$
   9648                    1076 00103$:
                           1077 ;src/main.c:234: enemy->muerto = SI;
   9648 DD 6E FA      [19] 1078 	ld	l,-6 (ix)
   964B DD 66 FB      [19] 1079 	ld	h,-5 (ix)
   964E 36 01         [10] 1080 	ld	(hl),#0x01
   9650 C3 E3 98      [10] 1081 	jp	00165$
   9653                    1082 00106$:
                           1083 ;src/main.c:237: colisiona = 0;
   9653 DD 36 F7 00   [19] 1084 	ld	-9 (ix),#0x00
   9657 C3 E3 98      [10] 1085 	jp	00165$
   965A                    1086 00113$:
                           1087 ;src/main.c:241: enemy->mira = M_izquierda;
   965A DD 6E FC      [19] 1088 	ld	l,-4 (ix)
   965D DD 66 FD      [19] 1089 	ld	h,-3 (ix)
   9660 36 01         [10] 1090 	ld	(hl),#0x01
                           1091 ;src/main.c:243: break;
   9662 C3 E3 98      [10] 1092 	jp	00165$
                           1093 ;src/main.c:244: case 1:
   9665                    1094 00117$:
                           1095 ;src/main.c:245: if( *getTilePtr(enemy->x - 1, enemy->y) <= 2
   9665 1D            [ 4] 1096 	dec	e
   9666 C5            [11] 1097 	push	bc
   9667 D5            [11] 1098 	push	de
   9668 CD E0 91      [17] 1099 	call	_getTilePtr
   966B F1            [10] 1100 	pop	af
   966C C1            [10] 1101 	pop	bc
   966D 5E            [ 7] 1102 	ld	e,(hl)
   966E 3E 02         [ 7] 1103 	ld	a,#0x02
   9670 93            [ 4] 1104 	sub	a, e
   9671 DA 2F 97      [10] 1105 	jp	C,00129$
                           1106 ;src/main.c:246: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   9674 DD 6E F8      [19] 1107 	ld	l,-8 (ix)
   9677 DD 66 F9      [19] 1108 	ld	h,-7 (ix)
   967A 7E            [ 7] 1109 	ld	a,(hl)
   967B C6 0B         [ 7] 1110 	add	a, #0x0B
   967D 57            [ 4] 1111 	ld	d,a
   967E 0A            [ 7] 1112 	ld	a,(bc)
   967F C6 FF         [ 7] 1113 	add	a,#0xFF
   9681 C5            [11] 1114 	push	bc
   9682 D5            [11] 1115 	push	de
   9683 33            [ 6] 1116 	inc	sp
   9684 F5            [11] 1117 	push	af
   9685 33            [ 6] 1118 	inc	sp
   9686 CD E0 91      [17] 1119 	call	_getTilePtr
   9689 F1            [10] 1120 	pop	af
   968A C1            [10] 1121 	pop	bc
   968B 5E            [ 7] 1122 	ld	e,(hl)
   968C 3E 02         [ 7] 1123 	ld	a,#0x02
   968E 93            [ 4] 1124 	sub	a, e
   968F DA 2F 97      [10] 1125 	jp	C,00129$
                           1126 ;src/main.c:247: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   9692 DD 6E F8      [19] 1127 	ld	l,-8 (ix)
   9695 DD 66 F9      [19] 1128 	ld	h,-7 (ix)
   9698 7E            [ 7] 1129 	ld	a,(hl)
   9699 C6 16         [ 7] 1130 	add	a, #0x16
   969B 57            [ 4] 1131 	ld	d,a
   969C 0A            [ 7] 1132 	ld	a,(bc)
   969D C6 FF         [ 7] 1133 	add	a,#0xFF
   969F C5            [11] 1134 	push	bc
   96A0 D5            [11] 1135 	push	de
   96A1 33            [ 6] 1136 	inc	sp
   96A2 F5            [11] 1137 	push	af
   96A3 33            [ 6] 1138 	inc	sp
   96A4 CD E0 91      [17] 1139 	call	_getTilePtr
   96A7 F1            [10] 1140 	pop	af
   96A8 C1            [10] 1141 	pop	bc
   96A9 5E            [ 7] 1142 	ld	e,(hl)
   96AA 3E 02         [ 7] 1143 	ld	a,#0x02
   96AC 93            [ 4] 1144 	sub	a, e
   96AD DA 2F 97      [10] 1145 	jp	C,00129$
                           1146 ;src/main.c:249: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   96B0 21 F9 90      [10] 1147 	ld	hl, #_cu + 1
   96B3 5E            [ 7] 1148 	ld	e,(hl)
   96B4 16 00         [ 7] 1149 	ld	d,#0x00
   96B6 21 04 00      [10] 1150 	ld	hl,#0x0004
   96B9 19            [11] 1151 	add	hl,de
   96BA DD 75 FE      [19] 1152 	ld	-2 (ix),l
   96BD DD 74 FF      [19] 1153 	ld	-1 (ix),h
   96C0 DD 6E F8      [19] 1154 	ld	l,-8 (ix)
   96C3 DD 66 F9      [19] 1155 	ld	h,-7 (ix)
   96C6 6E            [ 7] 1156 	ld	l,(hl)
   96C7 26 00         [ 7] 1157 	ld	h,#0x00
   96C9 DD 7E FE      [19] 1158 	ld	a,-2 (ix)
   96CC 95            [ 4] 1159 	sub	a, l
   96CD DD 7E FF      [19] 1160 	ld	a,-1 (ix)
   96D0 9C            [ 4] 1161 	sbc	a, h
   96D1 E2 D6 96      [10] 1162 	jp	PO, 00277$
   96D4 EE 80         [ 7] 1163 	xor	a, #0x80
   96D6                    1164 00277$:
   96D6 FA EB 96      [10] 1165 	jp	M,00124$
   96D9 D5            [11] 1166 	push	de
   96DA 11 16 00      [10] 1167 	ld	de,#0x0016
   96DD 19            [11] 1168 	add	hl, de
   96DE D1            [10] 1169 	pop	de
   96DF 7D            [ 4] 1170 	ld	a,l
   96E0 93            [ 4] 1171 	sub	a, e
   96E1 7C            [ 4] 1172 	ld	a,h
   96E2 9A            [ 4] 1173 	sbc	a, d
   96E3 E2 E8 96      [10] 1174 	jp	PO, 00278$
   96E6 EE 80         [ 7] 1175 	xor	a, #0x80
   96E8                    1176 00278$:
   96E8 F2 F2 96      [10] 1177 	jp	P,00125$
   96EB                    1178 00124$:
                           1179 ;src/main.c:250: colisiona = 0;
   96EB DD 36 F7 00   [19] 1180 	ld	-9 (ix),#0x00
   96EF C3 E3 98      [10] 1181 	jp	00165$
   96F2                    1182 00125$:
                           1183 ;src/main.c:253: if(enemy->x > cu.x){ //si el cu esta abajo
   96F2 0A            [ 7] 1184 	ld	a,(bc)
   96F3 5F            [ 4] 1185 	ld	e,a
   96F4 21 F8 90      [10] 1186 	ld	hl, #_cu + 0
   96F7 4E            [ 7] 1187 	ld	c,(hl)
   96F8 79            [ 4] 1188 	ld	a,c
   96F9 93            [ 4] 1189 	sub	a, e
   96FA 30 2C         [12] 1190 	jr	NC,00122$
                           1191 ;src/main.c:254: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
   96FC 6B            [ 4] 1192 	ld	l,e
   96FD 26 00         [ 7] 1193 	ld	h,#0x00
   96FF 06 00         [ 7] 1194 	ld	b,#0x00
   9701 03            [ 6] 1195 	inc	bc
   9702 03            [ 6] 1196 	inc	bc
   9703 03            [ 6] 1197 	inc	bc
   9704 03            [ 6] 1198 	inc	bc
   9705 BF            [ 4] 1199 	cp	a, a
   9706 ED 42         [15] 1200 	sbc	hl, bc
   9708 3E 01         [ 7] 1201 	ld	a,#0x01
   970A BD            [ 4] 1202 	cp	a, l
   970B 3E 00         [ 7] 1203 	ld	a,#0x00
   970D 9C            [ 4] 1204 	sbc	a, h
   970E E2 13 97      [10] 1205 	jp	PO, 00279$
   9711 EE 80         [ 7] 1206 	xor	a, #0x80
   9713                    1207 00279$:
   9713 F2 1D 97      [10] 1208 	jp	P,00119$
                           1209 ;src/main.c:255: colisiona = 0;
   9716 DD 36 F7 00   [19] 1210 	ld	-9 (ix),#0x00
   971A C3 E3 98      [10] 1211 	jp	00165$
   971D                    1212 00119$:
                           1213 ;src/main.c:258: enemy->muerto = SI;
   971D DD 6E FA      [19] 1214 	ld	l,-6 (ix)
   9720 DD 66 FB      [19] 1215 	ld	h,-5 (ix)
   9723 36 01         [10] 1216 	ld	(hl),#0x01
   9725 C3 E3 98      [10] 1217 	jp	00165$
   9728                    1218 00122$:
                           1219 ;src/main.c:261: colisiona = 0;
   9728 DD 36 F7 00   [19] 1220 	ld	-9 (ix),#0x00
   972C C3 E3 98      [10] 1221 	jp	00165$
   972F                    1222 00129$:
                           1223 ;src/main.c:265: enemy->mira = M_derecha;
   972F DD 6E FC      [19] 1224 	ld	l,-4 (ix)
   9732 DD 66 FD      [19] 1225 	ld	h,-3 (ix)
   9735 36 00         [10] 1226 	ld	(hl),#0x00
                           1227 ;src/main.c:267: break;
   9737 C3 E3 98      [10] 1228 	jp	00165$
                           1229 ;src/main.c:268: case 2:
   973A                    1230 00133$:
                           1231 ;src/main.c:269: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   973A 15            [ 4] 1232 	dec	d
   973B 15            [ 4] 1233 	dec	d
   973C C5            [11] 1234 	push	bc
   973D D5            [11] 1235 	push	de
   973E CD E0 91      [17] 1236 	call	_getTilePtr
   9741 F1            [10] 1237 	pop	af
   9742 C1            [10] 1238 	pop	bc
   9743 5E            [ 7] 1239 	ld	e,(hl)
   9744 3E 02         [ 7] 1240 	ld	a,#0x02
   9746 93            [ 4] 1241 	sub	a, e
   9747 DA 01 98      [10] 1242 	jp	C,00145$
                           1243 ;src/main.c:270: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   974A DD 6E F8      [19] 1244 	ld	l,-8 (ix)
   974D DD 66 F9      [19] 1245 	ld	h,-7 (ix)
   9750 56            [ 7] 1246 	ld	d,(hl)
   9751 15            [ 4] 1247 	dec	d
   9752 15            [ 4] 1248 	dec	d
   9753 0A            [ 7] 1249 	ld	a,(bc)
   9754 C6 02         [ 7] 1250 	add	a, #0x02
   9756 C5            [11] 1251 	push	bc
   9757 D5            [11] 1252 	push	de
   9758 33            [ 6] 1253 	inc	sp
   9759 F5            [11] 1254 	push	af
   975A 33            [ 6] 1255 	inc	sp
   975B CD E0 91      [17] 1256 	call	_getTilePtr
   975E F1            [10] 1257 	pop	af
   975F C1            [10] 1258 	pop	bc
   9760 5E            [ 7] 1259 	ld	e,(hl)
   9761 3E 02         [ 7] 1260 	ld	a,#0x02
   9763 93            [ 4] 1261 	sub	a, e
   9764 DA 01 98      [10] 1262 	jp	C,00145$
                           1263 ;src/main.c:271: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   9767 DD 6E F8      [19] 1264 	ld	l,-8 (ix)
   976A DD 66 F9      [19] 1265 	ld	h,-7 (ix)
   976D 56            [ 7] 1266 	ld	d,(hl)
   976E 15            [ 4] 1267 	dec	d
   976F 15            [ 4] 1268 	dec	d
   9770 0A            [ 7] 1269 	ld	a,(bc)
   9771 C6 04         [ 7] 1270 	add	a, #0x04
   9773 C5            [11] 1271 	push	bc
   9774 D5            [11] 1272 	push	de
   9775 33            [ 6] 1273 	inc	sp
   9776 F5            [11] 1274 	push	af
   9777 33            [ 6] 1275 	inc	sp
   9778 CD E0 91      [17] 1276 	call	_getTilePtr
   977B F1            [10] 1277 	pop	af
   977C C1            [10] 1278 	pop	bc
   977D 5E            [ 7] 1279 	ld	e,(hl)
   977E 3E 02         [ 7] 1280 	ld	a,#0x02
   9780 93            [ 4] 1281 	sub	a, e
   9781 DA 01 98      [10] 1282 	jp	C,00145$
                           1283 ;src/main.c:273: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   9784 21 F8 90      [10] 1284 	ld	hl, #_cu + 0
   9787 5E            [ 7] 1285 	ld	e,(hl)
   9788 16 00         [ 7] 1286 	ld	d,#0x00
   978A 21 02 00      [10] 1287 	ld	hl,#0x0002
   978D 19            [11] 1288 	add	hl,de
   978E DD 75 FE      [19] 1289 	ld	-2 (ix),l
   9791 DD 74 FF      [19] 1290 	ld	-1 (ix),h
   9794 0A            [ 7] 1291 	ld	a,(bc)
   9795 6F            [ 4] 1292 	ld	l,a
   9796 26 00         [ 7] 1293 	ld	h,#0x00
   9798 DD 7E FE      [19] 1294 	ld	a,-2 (ix)
   979B 95            [ 4] 1295 	sub	a, l
   979C DD 7E FF      [19] 1296 	ld	a,-1 (ix)
   979F 9C            [ 4] 1297 	sbc	a, h
   97A0 E2 A5 97      [10] 1298 	jp	PO, 00280$
   97A3 EE 80         [ 7] 1299 	xor	a, #0x80
   97A5                    1300 00280$:
   97A5 FA B8 97      [10] 1301 	jp	M,00140$
   97A8 23            [ 6] 1302 	inc	hl
   97A9 23            [ 6] 1303 	inc	hl
   97AA 23            [ 6] 1304 	inc	hl
   97AB 23            [ 6] 1305 	inc	hl
   97AC 7D            [ 4] 1306 	ld	a,l
   97AD 93            [ 4] 1307 	sub	a, e
   97AE 7C            [ 4] 1308 	ld	a,h
   97AF 9A            [ 4] 1309 	sbc	a, d
   97B0 E2 B5 97      [10] 1310 	jp	PO, 00281$
   97B3 EE 80         [ 7] 1311 	xor	a, #0x80
   97B5                    1312 00281$:
   97B5 F2 BE 97      [10] 1313 	jp	P,00141$
   97B8                    1314 00140$:
                           1315 ;src/main.c:275: colisiona = 0;
   97B8 DD 36 F7 00   [19] 1316 	ld	-9 (ix),#0x00
   97BC 18 4B         [12] 1317 	jr	00149$
   97BE                    1318 00141$:
                           1319 ;src/main.c:278: if(enemy->y>cu.y){
   97BE DD 6E F8      [19] 1320 	ld	l,-8 (ix)
   97C1 DD 66 F9      [19] 1321 	ld	h,-7 (ix)
   97C4 5E            [ 7] 1322 	ld	e,(hl)
   97C5 21 F9 90      [10] 1323 	ld	hl, #(_cu + 0x0001) + 0
   97C8 6E            [ 7] 1324 	ld	l,(hl)
   97C9 7D            [ 4] 1325 	ld	a,l
   97CA 93            [ 4] 1326 	sub	a, e
   97CB 30 2E         [12] 1327 	jr	NC,00138$
                           1328 ;src/main.c:279: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   97CD 16 00         [ 7] 1329 	ld	d,#0x00
   97CF 26 00         [ 7] 1330 	ld	h,#0x00
   97D1 D5            [11] 1331 	push	de
   97D2 11 08 00      [10] 1332 	ld	de,#0x0008
   97D5 19            [11] 1333 	add	hl, de
   97D6 D1            [10] 1334 	pop	de
   97D7 7B            [ 4] 1335 	ld	a,e
   97D8 95            [ 4] 1336 	sub	a, l
   97D9 5F            [ 4] 1337 	ld	e,a
   97DA 7A            [ 4] 1338 	ld	a,d
   97DB 9C            [ 4] 1339 	sbc	a, h
   97DC 57            [ 4] 1340 	ld	d,a
   97DD 3E 02         [ 7] 1341 	ld	a,#0x02
   97DF BB            [ 4] 1342 	cp	a, e
   97E0 3E 00         [ 7] 1343 	ld	a,#0x00
   97E2 9A            [ 4] 1344 	sbc	a, d
   97E3 E2 E8 97      [10] 1345 	jp	PO, 00282$
   97E6 EE 80         [ 7] 1346 	xor	a, #0x80
   97E8                    1347 00282$:
   97E8 F2 F1 97      [10] 1348 	jp	P,00135$
                           1349 ;src/main.c:280: colisiona = 0;
   97EB DD 36 F7 00   [19] 1350 	ld	-9 (ix),#0x00
   97EF 18 18         [12] 1351 	jr	00149$
   97F1                    1352 00135$:
                           1353 ;src/main.c:283: enemy->muerto = SI;
   97F1 DD 6E FA      [19] 1354 	ld	l,-6 (ix)
   97F4 DD 66 FB      [19] 1355 	ld	h,-5 (ix)
   97F7 36 01         [10] 1356 	ld	(hl),#0x01
   97F9 18 0E         [12] 1357 	jr	00149$
   97FB                    1358 00138$:
                           1359 ;src/main.c:287: colisiona = 0;
   97FB DD 36 F7 00   [19] 1360 	ld	-9 (ix),#0x00
   97FF 18 08         [12] 1361 	jr	00149$
   9801                    1362 00145$:
                           1363 ;src/main.c:293: enemy->mira = M_abajo;
   9801 DD 6E FC      [19] 1364 	ld	l,-4 (ix)
   9804 DD 66 FD      [19] 1365 	ld	h,-3 (ix)
   9807 36 03         [10] 1366 	ld	(hl),#0x03
                           1367 ;src/main.c:296: case 3:
   9809                    1368 00149$:
                           1369 ;src/main.c:299: if( *getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   9809 DD 6E F8      [19] 1370 	ld	l,-8 (ix)
   980C DD 66 F9      [19] 1371 	ld	h,-7 (ix)
   980F 7E            [ 7] 1372 	ld	a,(hl)
   9810 C6 18         [ 7] 1373 	add	a, #0x18
   9812 57            [ 4] 1374 	ld	d,a
   9813 0A            [ 7] 1375 	ld	a,(bc)
   9814 C5            [11] 1376 	push	bc
   9815 D5            [11] 1377 	push	de
   9816 33            [ 6] 1378 	inc	sp
   9817 F5            [11] 1379 	push	af
   9818 33            [ 6] 1380 	inc	sp
   9819 CD E0 91      [17] 1381 	call	_getTilePtr
   981C F1            [10] 1382 	pop	af
   981D C1            [10] 1383 	pop	bc
   981E 5E            [ 7] 1384 	ld	e,(hl)
   981F 3E 02         [ 7] 1385 	ld	a,#0x02
   9821 93            [ 4] 1386 	sub	a, e
   9822 DA DB 98      [10] 1387 	jp	C,00161$
                           1388 ;src/main.c:300: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   9825 DD 6E F8      [19] 1389 	ld	l,-8 (ix)
   9828 DD 66 F9      [19] 1390 	ld	h,-7 (ix)
   982B 7E            [ 7] 1391 	ld	a,(hl)
   982C C6 18         [ 7] 1392 	add	a, #0x18
   982E 57            [ 4] 1393 	ld	d,a
   982F 0A            [ 7] 1394 	ld	a,(bc)
   9830 C6 02         [ 7] 1395 	add	a, #0x02
   9832 C5            [11] 1396 	push	bc
   9833 D5            [11] 1397 	push	de
   9834 33            [ 6] 1398 	inc	sp
   9835 F5            [11] 1399 	push	af
   9836 33            [ 6] 1400 	inc	sp
   9837 CD E0 91      [17] 1401 	call	_getTilePtr
   983A F1            [10] 1402 	pop	af
   983B C1            [10] 1403 	pop	bc
   983C 5E            [ 7] 1404 	ld	e,(hl)
   983D 3E 02         [ 7] 1405 	ld	a,#0x02
   983F 93            [ 4] 1406 	sub	a, e
   9840 DA DB 98      [10] 1407 	jp	C,00161$
                           1408 ;src/main.c:301: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   9843 DD 6E F8      [19] 1409 	ld	l,-8 (ix)
   9846 DD 66 F9      [19] 1410 	ld	h,-7 (ix)
   9849 7E            [ 7] 1411 	ld	a,(hl)
   984A C6 18         [ 7] 1412 	add	a, #0x18
   984C 57            [ 4] 1413 	ld	d,a
   984D 0A            [ 7] 1414 	ld	a,(bc)
   984E C6 04         [ 7] 1415 	add	a, #0x04
   9850 C5            [11] 1416 	push	bc
   9851 D5            [11] 1417 	push	de
   9852 33            [ 6] 1418 	inc	sp
   9853 F5            [11] 1419 	push	af
   9854 33            [ 6] 1420 	inc	sp
   9855 CD E0 91      [17] 1421 	call	_getTilePtr
   9858 F1            [10] 1422 	pop	af
   9859 C1            [10] 1423 	pop	bc
   985A 5E            [ 7] 1424 	ld	e,(hl)
   985B 3E 02         [ 7] 1425 	ld	a,#0x02
   985D 93            [ 4] 1426 	sub	a, e
   985E 38 7B         [12] 1427 	jr	C,00161$
                           1428 ;src/main.c:303: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   9860 21 F8 90      [10] 1429 	ld	hl, #_cu + 0
   9863 5E            [ 7] 1430 	ld	e,(hl)
   9864 16 00         [ 7] 1431 	ld	d,#0x00
   9866 21 02 00      [10] 1432 	ld	hl,#0x0002
   9869 19            [11] 1433 	add	hl,de
   986A DD 75 FE      [19] 1434 	ld	-2 (ix),l
   986D DD 74 FF      [19] 1435 	ld	-1 (ix),h
   9870 0A            [ 7] 1436 	ld	a,(bc)
   9871 4F            [ 4] 1437 	ld	c,a
   9872 06 00         [ 7] 1438 	ld	b,#0x00
   9874 DD 7E FE      [19] 1439 	ld	a,-2 (ix)
   9877 91            [ 4] 1440 	sub	a, c
   9878 DD 7E FF      [19] 1441 	ld	a,-1 (ix)
   987B 98            [ 4] 1442 	sbc	a, b
   987C E2 81 98      [10] 1443 	jp	PO, 00283$
   987F EE 80         [ 7] 1444 	xor	a, #0x80
   9881                    1445 00283$:
   9881 FA 94 98      [10] 1446 	jp	M,00156$
   9884 03            [ 6] 1447 	inc	bc
   9885 03            [ 6] 1448 	inc	bc
   9886 03            [ 6] 1449 	inc	bc
   9887 03            [ 6] 1450 	inc	bc
   9888 79            [ 4] 1451 	ld	a,c
   9889 93            [ 4] 1452 	sub	a, e
   988A 78            [ 4] 1453 	ld	a,b
   988B 9A            [ 4] 1454 	sbc	a, d
   988C E2 91 98      [10] 1455 	jp	PO, 00284$
   988F EE 80         [ 7] 1456 	xor	a, #0x80
   9891                    1457 00284$:
   9891 F2 9A 98      [10] 1458 	jp	P,00157$
   9894                    1459 00156$:
                           1460 ;src/main.c:304: colisiona = 0;
   9894 DD 36 F7 00   [19] 1461 	ld	-9 (ix),#0x00
   9898 18 49         [12] 1462 	jr	00165$
   989A                    1463 00157$:
                           1464 ;src/main.c:307: if(cu.y > enemy->y){ //si el cu esta abajo
   989A 21 F9 90      [10] 1465 	ld	hl, #(_cu + 0x0001) + 0
   989D 4E            [ 7] 1466 	ld	c,(hl)
   989E DD 6E F8      [19] 1467 	ld	l,-8 (ix)
   98A1 DD 66 F9      [19] 1468 	ld	h,-7 (ix)
   98A4 5E            [ 7] 1469 	ld	e,(hl)
   98A5 7B            [ 4] 1470 	ld	a,e
   98A6 91            [ 4] 1471 	sub	a, c
   98A7 30 2C         [12] 1472 	jr	NC,00154$
                           1473 ;src/main.c:308: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   98A9 06 00         [ 7] 1474 	ld	b,#0x00
   98AB 16 00         [ 7] 1475 	ld	d,#0x00
   98AD 21 16 00      [10] 1476 	ld	hl,#0x0016
   98B0 19            [11] 1477 	add	hl,de
   98B1 79            [ 4] 1478 	ld	a,c
   98B2 95            [ 4] 1479 	sub	a, l
   98B3 4F            [ 4] 1480 	ld	c,a
   98B4 78            [ 4] 1481 	ld	a,b
   98B5 9C            [ 4] 1482 	sbc	a, h
   98B6 47            [ 4] 1483 	ld	b,a
   98B7 3E 02         [ 7] 1484 	ld	a,#0x02
   98B9 B9            [ 4] 1485 	cp	a, c
   98BA 3E 00         [ 7] 1486 	ld	a,#0x00
   98BC 98            [ 4] 1487 	sbc	a, b
   98BD E2 C2 98      [10] 1488 	jp	PO, 00285$
   98C0 EE 80         [ 7] 1489 	xor	a, #0x80
   98C2                    1490 00285$:
   98C2 F2 CB 98      [10] 1491 	jp	P,00151$
                           1492 ;src/main.c:309: colisiona = 0;
   98C5 DD 36 F7 00   [19] 1493 	ld	-9 (ix),#0x00
   98C9 18 18         [12] 1494 	jr	00165$
   98CB                    1495 00151$:
                           1496 ;src/main.c:312: enemy->muerto = SI;
   98CB DD 6E FA      [19] 1497 	ld	l,-6 (ix)
   98CE DD 66 FB      [19] 1498 	ld	h,-5 (ix)
   98D1 36 01         [10] 1499 	ld	(hl),#0x01
   98D3 18 0E         [12] 1500 	jr	00165$
   98D5                    1501 00154$:
                           1502 ;src/main.c:316: colisiona = 0;
   98D5 DD 36 F7 00   [19] 1503 	ld	-9 (ix),#0x00
   98D9 18 08         [12] 1504 	jr	00165$
   98DB                    1505 00161$:
                           1506 ;src/main.c:320: enemy->mira = M_arriba;
   98DB DD 6E FC      [19] 1507 	ld	l,-4 (ix)
   98DE DD 66 FD      [19] 1508 	ld	h,-3 (ix)
   98E1 36 02         [10] 1509 	ld	(hl),#0x02
                           1510 ;src/main.c:323: }
   98E3                    1511 00165$:
                           1512 ;src/main.c:324: return colisiona;
   98E3 DD 6E F7      [19] 1513 	ld	l,-9 (ix)
   98E6 DD F9         [10] 1514 	ld	sp, ix
   98E8 DD E1         [14] 1515 	pop	ix
   98EA C9            [10] 1516 	ret
                           1517 ;src/main.c:327: void moverEnemigoArriba(TEnemy *enemy){
                           1518 ;	---------------------------------
                           1519 ; Function moverEnemigoArriba
                           1520 ; ---------------------------------
   98EB                    1521 _moverEnemigoArriba::
   98EB DD E5         [15] 1522 	push	ix
   98ED DD 21 00 00   [14] 1523 	ld	ix,#0
   98F1 DD 39         [15] 1524 	add	ix,sp
                           1525 ;src/main.c:328: enemy->y--;
   98F3 DD 4E 04      [19] 1526 	ld	c,4 (ix)
   98F6 DD 46 05      [19] 1527 	ld	b,5 (ix)
   98F9 69            [ 4] 1528 	ld	l, c
   98FA 60            [ 4] 1529 	ld	h, b
   98FB 23            [ 6] 1530 	inc	hl
   98FC 5E            [ 7] 1531 	ld	e,(hl)
   98FD 1D            [ 4] 1532 	dec	e
   98FE 73            [ 7] 1533 	ld	(hl),e
                           1534 ;src/main.c:329: enemy->y--;
   98FF 1D            [ 4] 1535 	dec	e
   9900 73            [ 7] 1536 	ld	(hl),e
                           1537 ;src/main.c:330: enemy->mover = SI;
   9901 21 06 00      [10] 1538 	ld	hl,#0x0006
   9904 09            [11] 1539 	add	hl,bc
   9905 36 01         [10] 1540 	ld	(hl),#0x01
   9907 DD E1         [14] 1541 	pop	ix
   9909 C9            [10] 1542 	ret
                           1543 ;src/main.c:333: void moverEnemigoAbajo(TEnemy *enemy){
                           1544 ;	---------------------------------
                           1545 ; Function moverEnemigoAbajo
                           1546 ; ---------------------------------
   990A                    1547 _moverEnemigoAbajo::
   990A DD E5         [15] 1548 	push	ix
   990C DD 21 00 00   [14] 1549 	ld	ix,#0
   9910 DD 39         [15] 1550 	add	ix,sp
                           1551 ;src/main.c:334: enemy->y++;
   9912 DD 4E 04      [19] 1552 	ld	c,4 (ix)
   9915 DD 46 05      [19] 1553 	ld	b,5 (ix)
   9918 59            [ 4] 1554 	ld	e, c
   9919 50            [ 4] 1555 	ld	d, b
   991A 13            [ 6] 1556 	inc	de
   991B 1A            [ 7] 1557 	ld	a,(de)
   991C 3C            [ 4] 1558 	inc	a
   991D 12            [ 7] 1559 	ld	(de),a
                           1560 ;src/main.c:335: enemy->y++;
   991E 3C            [ 4] 1561 	inc	a
   991F 12            [ 7] 1562 	ld	(de),a
                           1563 ;src/main.c:336: enemy->mover = SI;
   9920 21 06 00      [10] 1564 	ld	hl,#0x0006
   9923 09            [11] 1565 	add	hl,bc
   9924 36 01         [10] 1566 	ld	(hl),#0x01
   9926 DD E1         [14] 1567 	pop	ix
   9928 C9            [10] 1568 	ret
                           1569 ;src/main.c:339: void moverEnemigoDerecha(TEnemy *enemy){
                           1570 ;	---------------------------------
                           1571 ; Function moverEnemigoDerecha
                           1572 ; ---------------------------------
   9929                    1573 _moverEnemigoDerecha::
                           1574 ;src/main.c:340: enemy->x++;
   9929 D1            [10] 1575 	pop	de
   992A C1            [10] 1576 	pop	bc
   992B C5            [11] 1577 	push	bc
   992C D5            [11] 1578 	push	de
   992D 0A            [ 7] 1579 	ld	a,(bc)
   992E 3C            [ 4] 1580 	inc	a
   992F 02            [ 7] 1581 	ld	(bc),a
                           1582 ;src/main.c:341: enemy->x++;
   9930 3C            [ 4] 1583 	inc	a
   9931 02            [ 7] 1584 	ld	(bc),a
                           1585 ;src/main.c:342: enemy->mover = SI;
   9932 21 06 00      [10] 1586 	ld	hl,#0x0006
   9935 09            [11] 1587 	add	hl,bc
   9936 36 01         [10] 1588 	ld	(hl),#0x01
   9938 C9            [10] 1589 	ret
                           1590 ;src/main.c:345: void moverEnemigoIzquierda(TEnemy *enemy){
                           1591 ;	---------------------------------
                           1592 ; Function moverEnemigoIzquierda
                           1593 ; ---------------------------------
   9939                    1594 _moverEnemigoIzquierda::
                           1595 ;src/main.c:346: enemy->x--;
   9939 D1            [10] 1596 	pop	de
   993A C1            [10] 1597 	pop	bc
   993B C5            [11] 1598 	push	bc
   993C D5            [11] 1599 	push	de
   993D 0A            [ 7] 1600 	ld	a,(bc)
   993E C6 FF         [ 7] 1601 	add	a,#0xFF
   9940 02            [ 7] 1602 	ld	(bc),a
                           1603 ;src/main.c:347: enemy->x--;
   9941 C6 FF         [ 7] 1604 	add	a,#0xFF
   9943 02            [ 7] 1605 	ld	(bc),a
                           1606 ;src/main.c:348: enemy->mover = SI;
   9944 21 06 00      [10] 1607 	ld	hl,#0x0006
   9947 09            [11] 1608 	add	hl,bc
   9948 36 01         [10] 1609 	ld	(hl),#0x01
   994A C9            [10] 1610 	ret
                           1611 ;src/main.c:351: void moverEnemigo(TEnemy *enemy){
                           1612 ;	---------------------------------
                           1613 ; Function moverEnemigo
                           1614 ; ---------------------------------
   994B                    1615 _moverEnemigo::
   994B DD E5         [15] 1616 	push	ix
   994D DD 21 00 00   [14] 1617 	ld	ix,#0
   9951 DD 39         [15] 1618 	add	ix,sp
                           1619 ;src/main.c:352: if(!enemy->muerto){
   9953 DD 4E 04      [19] 1620 	ld	c,4 (ix)
   9956 DD 46 05      [19] 1621 	ld	b,5 (ix)
   9959 C5            [11] 1622 	push	bc
   995A FD E1         [14] 1623 	pop	iy
   995C FD 7E 08      [19] 1624 	ld	a,8 (iy)
   995F B7            [ 4] 1625 	or	a, a
   9960 20 46         [12] 1626 	jr	NZ,00110$
                           1627 ;src/main.c:353: if(!checkEnemyCollision(enemy->mira, enemy)){
   9962 21 07 00      [10] 1628 	ld	hl,#0x0007
   9965 09            [11] 1629 	add	hl,bc
   9966 5E            [ 7] 1630 	ld	e,(hl)
   9967 16 00         [ 7] 1631 	ld	d,#0x00
   9969 E5            [11] 1632 	push	hl
   996A C5            [11] 1633 	push	bc
   996B C5            [11] 1634 	push	bc
   996C D5            [11] 1635 	push	de
   996D CD 1B 95      [17] 1636 	call	_checkEnemyCollision
   9970 F1            [10] 1637 	pop	af
   9971 F1            [10] 1638 	pop	af
   9972 7D            [ 4] 1639 	ld	a,l
   9973 C1            [10] 1640 	pop	bc
   9974 E1            [10] 1641 	pop	hl
   9975 B7            [ 4] 1642 	or	a, a
   9976 20 30         [12] 1643 	jr	NZ,00110$
                           1644 ;src/main.c:355: switch (enemy->mira) {
   9978 5E            [ 7] 1645 	ld	e,(hl)
   9979 3E 03         [ 7] 1646 	ld	a,#0x03
   997B 93            [ 4] 1647 	sub	a, e
   997C 38 2A         [12] 1648 	jr	C,00110$
   997E 16 00         [ 7] 1649 	ld	d,#0x00
   9980 21 86 99      [10] 1650 	ld	hl,#00124$
   9983 19            [11] 1651 	add	hl,de
   9984 19            [11] 1652 	add	hl,de
                           1653 ;src/main.c:357: case 0:
   9985 E9            [ 4] 1654 	jp	(hl)
   9986                    1655 00124$:
   9986 18 06         [12] 1656 	jr	00101$
   9988 18 0B         [12] 1657 	jr	00102$
   998A 18 10         [12] 1658 	jr	00103$
   998C 18 15         [12] 1659 	jr	00104$
   998E                    1660 00101$:
                           1661 ;src/main.c:358: moverEnemigoDerecha(enemy);
   998E C5            [11] 1662 	push	bc
   998F CD 29 99      [17] 1663 	call	_moverEnemigoDerecha
   9992 F1            [10] 1664 	pop	af
                           1665 ;src/main.c:359: break;
   9993 18 13         [12] 1666 	jr	00110$
                           1667 ;src/main.c:360: case 1:
   9995                    1668 00102$:
                           1669 ;src/main.c:361: moverEnemigoIzquierda(enemy);
   9995 C5            [11] 1670 	push	bc
   9996 CD 39 99      [17] 1671 	call	_moverEnemigoIzquierda
   9999 F1            [10] 1672 	pop	af
                           1673 ;src/main.c:362: break;
   999A 18 0C         [12] 1674 	jr	00110$
                           1675 ;src/main.c:363: case 2:
   999C                    1676 00103$:
                           1677 ;src/main.c:364: moverEnemigoArriba(enemy);
   999C C5            [11] 1678 	push	bc
   999D CD EB 98      [17] 1679 	call	_moverEnemigoArriba
   99A0 F1            [10] 1680 	pop	af
                           1681 ;src/main.c:365: break;
   99A1 18 05         [12] 1682 	jr	00110$
                           1683 ;src/main.c:366: case 3:
   99A3                    1684 00104$:
                           1685 ;src/main.c:367: moverEnemigoAbajo(enemy);
   99A3 C5            [11] 1686 	push	bc
   99A4 CD 0A 99      [17] 1687 	call	_moverEnemigoAbajo
   99A7 F1            [10] 1688 	pop	af
                           1689 ;src/main.c:369: }
   99A8                    1690 00110$:
   99A8 DD E1         [14] 1691 	pop	ix
   99AA C9            [10] 1692 	ret
                           1693 ;src/main.c:374: void inicializarEnemy() {
                           1694 ;	---------------------------------
                           1695 ; Function inicializarEnemy
                           1696 ; ---------------------------------
   99AB                    1697 _inicializarEnemy::
   99AB DD E5         [15] 1698 	push	ix
   99AD DD 21 00 00   [14] 1699 	ld	ix,#0
   99B1 DD 39         [15] 1700 	add	ix,sp
   99B3 3B            [ 6] 1701 	dec	sp
                           1702 ;src/main.c:375: u8 i = (2 + num_mapa) + 1; //sacar distinto numero dependiendo del mapa
   99B4 3A 04 91      [13] 1703 	ld	a,(#_num_mapa + 0)
   99B7 C6 03         [ 7] 1704 	add	a, #0x03
   99B9 DD 77 FF      [19] 1705 	ld	-1 (ix),a
                           1706 ;src/main.c:380: actual = enemy;
   99BC 11 BC 90      [10] 1707 	ld	de,#_enemy+0
                           1708 ;src/main.c:381: while(--i){
   99BF                    1709 00101$:
   99BF DD 35 FF      [23] 1710 	dec	-1 (ix)
   99C2 DD 7E FF      [19] 1711 	ld	a,-1 (ix)
   99C5 B7            [ 4] 1712 	or	a, a
   99C6 28 61         [12] 1713 	jr	Z,00104$
                           1714 ;src/main.c:382: actual->x = actual->px = spawnX[i];
   99C8 4B            [ 4] 1715 	ld	c, e
   99C9 42            [ 4] 1716 	ld	b, d
   99CA 03            [ 6] 1717 	inc	bc
   99CB 03            [ 6] 1718 	inc	bc
   99CC 3E 28         [ 7] 1719 	ld	a,#<(_spawnX)
   99CE DD 86 FF      [19] 1720 	add	a, -1 (ix)
   99D1 6F            [ 4] 1721 	ld	l,a
   99D2 3E 91         [ 7] 1722 	ld	a,#>(_spawnX)
   99D4 CE 00         [ 7] 1723 	adc	a, #0x00
   99D6 67            [ 4] 1724 	ld	h,a
   99D7 7E            [ 7] 1725 	ld	a,(hl)
   99D8 02            [ 7] 1726 	ld	(bc),a
   99D9 12            [ 7] 1727 	ld	(de),a
                           1728 ;src/main.c:383: actual->y = actual->py = spawnY[i];
   99DA D5            [11] 1729 	push	de
   99DB FD E1         [14] 1730 	pop	iy
   99DD FD 23         [10] 1731 	inc	iy
   99DF 4B            [ 4] 1732 	ld	c, e
   99E0 42            [ 4] 1733 	ld	b, d
   99E1 03            [ 6] 1734 	inc	bc
   99E2 03            [ 6] 1735 	inc	bc
   99E3 03            [ 6] 1736 	inc	bc
   99E4 3E 2D         [ 7] 1737 	ld	a,#<(_spawnY)
   99E6 DD 86 FF      [19] 1738 	add	a, -1 (ix)
   99E9 6F            [ 4] 1739 	ld	l,a
   99EA 3E 91         [ 7] 1740 	ld	a,#>(_spawnY)
   99EC CE 00         [ 7] 1741 	adc	a, #0x00
   99EE 67            [ 4] 1742 	ld	h,a
   99EF 7E            [ 7] 1743 	ld	a,(hl)
   99F0 02            [ 7] 1744 	ld	(bc),a
   99F1 FD 77 00      [19] 1745 	ld	0 (iy), a
                           1746 ;src/main.c:384: actual->mover  = NO;
   99F4 21 06 00      [10] 1747 	ld	hl,#0x0006
   99F7 19            [11] 1748 	add	hl,de
   99F8 36 00         [10] 1749 	ld	(hl),#0x00
                           1750 ;src/main.c:385: actual->mira   = M_abajo;
   99FA 21 07 00      [10] 1751 	ld	hl,#0x0007
   99FD 19            [11] 1752 	add	hl,de
   99FE 36 03         [10] 1753 	ld	(hl),#0x03
                           1754 ;src/main.c:386: actual->sprite = g_enemy;
   9A00 21 04 00      [10] 1755 	ld	hl,#0x0004
   9A03 19            [11] 1756 	add	hl,de
   9A04 36 3A         [10] 1757 	ld	(hl),#<(_g_enemy)
   9A06 23            [ 6] 1758 	inc	hl
   9A07 36 79         [10] 1759 	ld	(hl),#>(_g_enemy)
                           1760 ;src/main.c:387: actual->muerto = NO;
   9A09 21 08 00      [10] 1761 	ld	hl,#0x0008
   9A0C 19            [11] 1762 	add	hl,de
   9A0D 36 00         [10] 1763 	ld	(hl),#0x00
                           1764 ;src/main.c:388: actual->muertes = 0;
   9A0F 21 0C 00      [10] 1765 	ld	hl,#0x000C
   9A12 19            [11] 1766 	add	hl,de
   9A13 36 00         [10] 1767 	ld	(hl),#0x00
                           1768 ;src/main.c:389: actual->patroling = SI;
   9A15 21 09 00      [10] 1769 	ld	hl,#0x0009
   9A18 19            [11] 1770 	add	hl,de
   9A19 36 01         [10] 1771 	ld	(hl),#0x01
                           1772 ;src/main.c:391: dibujarEnemigo(actual);
   9A1B D5            [11] 1773 	push	de
   9A1C D5            [11] 1774 	push	de
   9A1D CD 76 93      [17] 1775 	call	_dibujarEnemigo
   9A20 F1            [10] 1776 	pop	af
   9A21 D1            [10] 1777 	pop	de
                           1778 ;src/main.c:393: ++actual;
   9A22 21 0D 00      [10] 1779 	ld	hl,#0x000D
   9A25 19            [11] 1780 	add	hl,de
   9A26 EB            [ 4] 1781 	ex	de,hl
   9A27 18 96         [12] 1782 	jr	00101$
   9A29                    1783 00104$:
   9A29 33            [ 6] 1784 	inc	sp
   9A2A DD E1         [14] 1785 	pop	ix
   9A2C C9            [10] 1786 	ret
                           1787 ;src/main.c:397: void avanzarMapa() {
                           1788 ;	---------------------------------
                           1789 ; Function avanzarMapa
                           1790 ; ---------------------------------
   9A2D                    1791 _avanzarMapa::
                           1792 ;src/main.c:398: if(num_mapa < NUM_MAPAS -1) {
   9A2D 3A 04 91      [13] 1793 	ld	a,(#_num_mapa + 0)
   9A30 D6 02         [ 7] 1794 	sub	a, #0x02
   9A32 30 34         [12] 1795 	jr	NC,00102$
                           1796 ;src/main.c:399: mapa = mapas[++num_mapa];
   9A34 01 22 91      [10] 1797 	ld	bc,#_mapas+0
   9A37 21 04 91      [10] 1798 	ld	hl, #_num_mapa+0
   9A3A 34            [11] 1799 	inc	(hl)
   9A3B FD 21 04 91   [14] 1800 	ld	iy,#_num_mapa
   9A3F FD 6E 00      [19] 1801 	ld	l,0 (iy)
   9A42 26 00         [ 7] 1802 	ld	h,#0x00
   9A44 29            [11] 1803 	add	hl, hl
   9A45 09            [11] 1804 	add	hl,bc
   9A46 7E            [ 7] 1805 	ld	a,(hl)
   9A47 FD 21 02 91   [14] 1806 	ld	iy,#_mapa
   9A4B FD 77 00      [19] 1807 	ld	0 (iy),a
   9A4E 23            [ 6] 1808 	inc	hl
   9A4F 7E            [ 7] 1809 	ld	a,(hl)
   9A50 32 03 91      [13] 1810 	ld	(#_mapa + 1),a
                           1811 ;src/main.c:400: prota.x = prota.px = 2;
   9A53 21 F2 90      [10] 1812 	ld	hl,#(_prota + 0x0002)
   9A56 36 02         [10] 1813 	ld	(hl),#0x02
   9A58 21 F0 90      [10] 1814 	ld	hl,#_prota
   9A5B 36 02         [10] 1815 	ld	(hl),#0x02
                           1816 ;src/main.c:401: prota.mover = SI;
   9A5D 21 F6 90      [10] 1817 	ld	hl,#(_prota + 0x0006)
   9A60 36 01         [10] 1818 	ld	(hl),#0x01
                           1819 ;src/main.c:402: dibujarMapa();
   9A62 CD 0C 91      [17] 1820 	call	_dibujarMapa
                           1821 ;src/main.c:403: inicializarEnemy();
   9A65 C3 AB 99      [10] 1822 	jp  _inicializarEnemy
   9A68                    1823 00102$:
                           1824 ;src/main.c:406: menuFin(puntuacion);
   9A68 FD 21 05 91   [14] 1825 	ld	iy,#_puntuacion
   9A6C FD 6E 00      [19] 1826 	ld	l,0 (iy)
   9A6F 26 00         [ 7] 1827 	ld	h,#0x00
   9A71 C3 0A 7C      [10] 1828 	jp  _menuFin
                           1829 ;src/main.c:410: void moverIzquierda() {
                           1830 ;	---------------------------------
                           1831 ; Function moverIzquierda
                           1832 ; ---------------------------------
   9A74                    1833 _moverIzquierda::
                           1834 ;src/main.c:411: prota.mira = M_izquierda;
   9A74 01 F0 90      [10] 1835 	ld	bc,#_prota+0
   9A77 21 F7 90      [10] 1836 	ld	hl,#(_prota + 0x0007)
   9A7A 36 01         [10] 1837 	ld	(hl),#0x01
                           1838 ;src/main.c:412: if (!checkCollision(M_izquierda)) {
   9A7C C5            [11] 1839 	push	bc
   9A7D 21 01 00      [10] 1840 	ld	hl,#0x0001
   9A80 E5            [11] 1841 	push	hl
   9A81 CD 21 92      [17] 1842 	call	_checkCollision
   9A84 F1            [10] 1843 	pop	af
   9A85 C1            [10] 1844 	pop	bc
   9A86 7D            [ 4] 1845 	ld	a,l
   9A87 B7            [ 4] 1846 	or	a, a
   9A88 C0            [11] 1847 	ret	NZ
                           1848 ;src/main.c:413: prota.x--;
   9A89 0A            [ 7] 1849 	ld	a,(bc)
   9A8A C6 FF         [ 7] 1850 	add	a,#0xFF
   9A8C 02            [ 7] 1851 	ld	(bc),a
                           1852 ;src/main.c:414: prota.mover = SI;
   9A8D 21 F6 90      [10] 1853 	ld	hl,#(_prota + 0x0006)
   9A90 36 01         [10] 1854 	ld	(hl),#0x01
                           1855 ;src/main.c:415: prota.sprite = g_hero_left;
   9A92 21 C6 7A      [10] 1856 	ld	hl,#_g_hero_left
   9A95 22 F4 90      [16] 1857 	ld	((_prota + 0x0004)), hl
   9A98 C9            [10] 1858 	ret
                           1859 ;src/main.c:419: void moverDerecha() {
                           1860 ;	---------------------------------
                           1861 ; Function moverDerecha
                           1862 ; ---------------------------------
   9A99                    1863 _moverDerecha::
                           1864 ;src/main.c:420: prota.mira = M_derecha;
   9A99 21 F7 90      [10] 1865 	ld	hl,#(_prota + 0x0007)
   9A9C 36 00         [10] 1866 	ld	(hl),#0x00
                           1867 ;src/main.c:421: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   9A9E 21 00 00      [10] 1868 	ld	hl,#0x0000
   9AA1 E5            [11] 1869 	push	hl
   9AA2 CD 21 92      [17] 1870 	call	_checkCollision
   9AA5 F1            [10] 1871 	pop	af
   9AA6 45            [ 4] 1872 	ld	b,l
   9AA7 21 F0 90      [10] 1873 	ld	hl, #_prota + 0
   9AAA 4E            [ 7] 1874 	ld	c,(hl)
   9AAB 59            [ 4] 1875 	ld	e,c
   9AAC 16 00         [ 7] 1876 	ld	d,#0x00
   9AAE 21 07 00      [10] 1877 	ld	hl,#0x0007
   9AB1 19            [11] 1878 	add	hl,de
   9AB2 11 50 80      [10] 1879 	ld	de, #0x8050
   9AB5 29            [11] 1880 	add	hl, hl
   9AB6 3F            [ 4] 1881 	ccf
   9AB7 CB 1C         [ 8] 1882 	rr	h
   9AB9 CB 1D         [ 8] 1883 	rr	l
   9ABB ED 52         [15] 1884 	sbc	hl, de
   9ABD 3E 00         [ 7] 1885 	ld	a,#0x00
   9ABF 17            [ 4] 1886 	rla
   9AC0 5F            [ 4] 1887 	ld	e,a
   9AC1 78            [ 4] 1888 	ld	a,b
   9AC2 B7            [ 4] 1889 	or	a,a
   9AC3 20 14         [12] 1890 	jr	NZ,00104$
   9AC5 B3            [ 4] 1891 	or	a,e
   9AC6 28 11         [12] 1892 	jr	Z,00104$
                           1893 ;src/main.c:422: prota.x++;
   9AC8 0C            [ 4] 1894 	inc	c
   9AC9 21 F0 90      [10] 1895 	ld	hl,#_prota
   9ACC 71            [ 7] 1896 	ld	(hl),c
                           1897 ;src/main.c:423: prota.mover = SI;
   9ACD 21 F6 90      [10] 1898 	ld	hl,#(_prota + 0x0006)
   9AD0 36 01         [10] 1899 	ld	(hl),#0x01
                           1900 ;src/main.c:424: prota.sprite = g_hero;
   9AD2 21 70 7B      [10] 1901 	ld	hl,#_g_hero
   9AD5 22 F4 90      [16] 1902 	ld	((_prota + 0x0004)), hl
   9AD8 C9            [10] 1903 	ret
   9AD9                    1904 00104$:
                           1905 ;src/main.c:426: }else if( prota.x + G_HERO_W >= 80){
   9AD9 7B            [ 4] 1906 	ld	a,e
   9ADA B7            [ 4] 1907 	or	a, a
   9ADB C0            [11] 1908 	ret	NZ
                           1909 ;src/main.c:427: avanzarMapa();
   9ADC C3 2D 9A      [10] 1910 	jp  _avanzarMapa
                           1911 ;src/main.c:431: void moverArriba() {
                           1912 ;	---------------------------------
                           1913 ; Function moverArriba
                           1914 ; ---------------------------------
   9ADF                    1915 _moverArriba::
                           1916 ;src/main.c:432: prota.mira = M_arriba;
   9ADF 21 F7 90      [10] 1917 	ld	hl,#(_prota + 0x0007)
   9AE2 36 02         [10] 1918 	ld	(hl),#0x02
                           1919 ;src/main.c:433: if (!checkCollision(M_arriba)) { 
   9AE4 21 02 00      [10] 1920 	ld	hl,#0x0002
   9AE7 E5            [11] 1921 	push	hl
   9AE8 CD 21 92      [17] 1922 	call	_checkCollision
   9AEB F1            [10] 1923 	pop	af
   9AEC 7D            [ 4] 1924 	ld	a,l
   9AED B7            [ 4] 1925 	or	a, a
   9AEE C0            [11] 1926 	ret	NZ
                           1927 ;src/main.c:434: prota.y--;
   9AEF 21 F1 90      [10] 1928 	ld	hl,#_prota + 1
   9AF2 4E            [ 7] 1929 	ld	c,(hl)
   9AF3 0D            [ 4] 1930 	dec	c
   9AF4 71            [ 7] 1931 	ld	(hl),c
                           1932 ;src/main.c:435: prota.y--;
   9AF5 0D            [ 4] 1933 	dec	c
   9AF6 71            [ 7] 1934 	ld	(hl),c
                           1935 ;src/main.c:436: prota.mover  = SI;
   9AF7 21 F6 90      [10] 1936 	ld	hl,#(_prota + 0x0006)
   9AFA 36 01         [10] 1937 	ld	(hl),#0x01
                           1938 ;src/main.c:437: prota.sprite = g_hero_up;
   9AFC 21 2C 7A      [10] 1939 	ld	hl,#_g_hero_up
   9AFF 22 F4 90      [16] 1940 	ld	((_prota + 0x0004)), hl
   9B02 C9            [10] 1941 	ret
                           1942 ;src/main.c:441: void moverAbajo() {
                           1943 ;	---------------------------------
                           1944 ; Function moverAbajo
                           1945 ; ---------------------------------
   9B03                    1946 _moverAbajo::
                           1947 ;src/main.c:442: prota.mira = M_abajo;
   9B03 21 F7 90      [10] 1948 	ld	hl,#(_prota + 0x0007)
   9B06 36 03         [10] 1949 	ld	(hl),#0x03
                           1950 ;src/main.c:443: if (!checkCollision(M_abajo) ) { 
   9B08 21 03 00      [10] 1951 	ld	hl,#0x0003
   9B0B E5            [11] 1952 	push	hl
   9B0C CD 21 92      [17] 1953 	call	_checkCollision
   9B0F F1            [10] 1954 	pop	af
   9B10 7D            [ 4] 1955 	ld	a,l
   9B11 B7            [ 4] 1956 	or	a, a
   9B12 C0            [11] 1957 	ret	NZ
                           1958 ;src/main.c:444: prota.y++;
   9B13 01 F1 90      [10] 1959 	ld	bc,#_prota + 1
   9B16 0A            [ 7] 1960 	ld	a,(bc)
   9B17 3C            [ 4] 1961 	inc	a
   9B18 02            [ 7] 1962 	ld	(bc),a
                           1963 ;src/main.c:445: prota.y++;
   9B19 3C            [ 4] 1964 	inc	a
   9B1A 02            [ 7] 1965 	ld	(bc),a
                           1966 ;src/main.c:446: prota.mover  = SI;
   9B1B 21 F6 90      [10] 1967 	ld	hl,#(_prota + 0x0006)
   9B1E 36 01         [10] 1968 	ld	(hl),#0x01
                           1969 ;src/main.c:447: prota.sprite = g_hero_down;
   9B20 21 92 79      [10] 1970 	ld	hl,#_g_hero_down
   9B23 22 F4 90      [16] 1971 	ld	((_prota + 0x0004)), hl
   9B26 C9            [10] 1972 	ret
                           1973 ;src/main.c:451: void dibujarCuchillo() {
                           1974 ;	---------------------------------
                           1975 ; Function dibujarCuchillo
                           1976 ; ---------------------------------
   9B27                    1977 _dibujarCuchillo::
   9B27 DD E5         [15] 1978 	push	ix
   9B29 DD 21 00 00   [14] 1979 	ld	ix,#0
   9B2D DD 39         [15] 1980 	add	ix,sp
   9B2F F5            [11] 1981 	push	af
                           1982 ;src/main.c:452: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   9B30 21 F9 90      [10] 1983 	ld	hl, #_cu + 1
   9B33 56            [ 7] 1984 	ld	d,(hl)
   9B34 21 F8 90      [10] 1985 	ld	hl, #_cu + 0
   9B37 46            [ 7] 1986 	ld	b,(hl)
   9B38 D5            [11] 1987 	push	de
   9B39 33            [ 6] 1988 	inc	sp
   9B3A C5            [11] 1989 	push	bc
   9B3B 33            [ 6] 1990 	inc	sp
   9B3C 21 00 C0      [10] 1991 	ld	hl,#0xC000
   9B3F E5            [11] 1992 	push	hl
   9B40 CD 5F 90      [17] 1993 	call	_cpct_getScreenPtr
   9B43 45            [ 4] 1994 	ld	b,l
   9B44 5C            [ 4] 1995 	ld	e,h
                           1996 ;src/main.c:453: if(cu.eje == E_X){
   9B45 21 00 91      [10] 1997 	ld	hl, #_cu + 8
   9B48 4E            [ 7] 1998 	ld	c,(hl)
                           1999 ;src/main.c:454: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   9B49 DD 70 FE      [19] 2000 	ld	-2 (ix),b
   9B4C DD 73 FF      [19] 2001 	ld	-1 (ix),e
                           2002 ;src/main.c:453: if(cu.eje == E_X){
   9B4F 79            [ 4] 2003 	ld	a,c
   9B50 B7            [ 4] 2004 	or	a, a
   9B51 20 19         [12] 2005 	jr	NZ,00104$
                           2006 ;src/main.c:454: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   9B53 11 00 3E      [10] 2007 	ld	de,#_g_tablatrans+0
   9B56 ED 4B FC 90   [20] 2008 	ld	bc, (#(_cu + 0x0004) + 0)
   9B5A D5            [11] 2009 	push	de
   9B5B 21 04 04      [10] 2010 	ld	hl,#0x0404
   9B5E E5            [11] 2011 	push	hl
   9B5F DD 6E FE      [19] 2012 	ld	l,-2 (ix)
   9B62 DD 66 FF      [19] 2013 	ld	h,-1 (ix)
   9B65 E5            [11] 2014 	push	hl
   9B66 C5            [11] 2015 	push	bc
   9B67 CD 7F 90      [17] 2016 	call	_cpct_drawSpriteMaskedAlignedTable
   9B6A 18 1A         [12] 2017 	jr	00106$
   9B6C                    2018 00104$:
                           2019 ;src/main.c:457: else if(cu.eje == E_Y){
   9B6C 0D            [ 4] 2020 	dec	c
   9B6D 20 17         [12] 2021 	jr	NZ,00106$
                           2022 ;src/main.c:458: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   9B6F 11 00 3E      [10] 2023 	ld	de,#_g_tablatrans+0
   9B72 ED 4B FC 90   [20] 2024 	ld	bc, (#(_cu + 0x0004) + 0)
   9B76 D5            [11] 2025 	push	de
   9B77 21 02 08      [10] 2026 	ld	hl,#0x0802
   9B7A E5            [11] 2027 	push	hl
   9B7B DD 6E FE      [19] 2028 	ld	l,-2 (ix)
   9B7E DD 66 FF      [19] 2029 	ld	h,-1 (ix)
   9B81 E5            [11] 2030 	push	hl
   9B82 C5            [11] 2031 	push	bc
   9B83 CD 7F 90      [17] 2032 	call	_cpct_drawSpriteMaskedAlignedTable
   9B86                    2033 00106$:
   9B86 DD F9         [10] 2034 	ld	sp, ix
   9B88 DD E1         [14] 2035 	pop	ix
   9B8A C9            [10] 2036 	ret
                           2037 ;src/main.c:462: void borrarCuchillo() {
                           2038 ;	---------------------------------
                           2039 ; Function borrarCuchillo
                           2040 ; ---------------------------------
   9B8B                    2041 _borrarCuchillo::
   9B8B DD E5         [15] 2042 	push	ix
   9B8D DD 21 00 00   [14] 2043 	ld	ix,#0
   9B91 DD 39         [15] 2044 	add	ix,sp
   9B93 F5            [11] 2045 	push	af
   9B94 3B            [ 6] 2046 	dec	sp
                           2047 ;src/main.c:464: u8 w = 2 + (cu.px & 1);
   9B95 21 FA 90      [10] 2048 	ld	hl, #_cu + 2
   9B98 4E            [ 7] 2049 	ld	c,(hl)
   9B99 79            [ 4] 2050 	ld	a,c
   9B9A E6 01         [ 7] 2051 	and	a, #0x01
   9B9C 47            [ 4] 2052 	ld	b,a
   9B9D 04            [ 4] 2053 	inc	b
   9B9E 04            [ 4] 2054 	inc	b
                           2055 ;src/main.c:465: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   9B9F 21 FB 90      [10] 2056 	ld	hl, #_cu + 3
   9BA2 5E            [ 7] 2057 	ld	e,(hl)
   9BA3 7B            [ 4] 2058 	ld	a,e
   9BA4 E6 03         [ 7] 2059 	and	a, #0x03
   9BA6 28 04         [12] 2060 	jr	Z,00105$
   9BA8 3E 01         [ 7] 2061 	ld	a,#0x01
   9BAA 18 02         [12] 2062 	jr	00106$
   9BAC                    2063 00105$:
   9BAC 3E 00         [ 7] 2064 	ld	a,#0x00
   9BAE                    2065 00106$:
   9BAE C6 02         [ 7] 2066 	add	a, #0x02
   9BB0 DD 77 FD      [19] 2067 	ld	-3 (ix),a
                           2068 ;src/main.c:466: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   9BB3 FD 2A 02 91   [20] 2069 	ld	iy,(_mapa)
   9BB7 16 00         [ 7] 2070 	ld	d,#0x00
   9BB9 7B            [ 4] 2071 	ld	a,e
   9BBA C6 E8         [ 7] 2072 	add	a,#0xE8
   9BBC DD 77 FE      [19] 2073 	ld	-2 (ix),a
   9BBF 7A            [ 4] 2074 	ld	a,d
   9BC0 CE FF         [ 7] 2075 	adc	a,#0xFF
   9BC2 DD 77 FF      [19] 2076 	ld	-1 (ix),a
   9BC5 DD 6E FE      [19] 2077 	ld	l,-2 (ix)
   9BC8 DD 66 FF      [19] 2078 	ld	h,-1 (ix)
   9BCB DD CB FF 7E   [20] 2079 	bit	7, -1 (ix)
   9BCF 28 04         [12] 2080 	jr	Z,00107$
   9BD1 21 EB FF      [10] 2081 	ld	hl,#0xFFEB
   9BD4 19            [11] 2082 	add	hl,de
   9BD5                    2083 00107$:
   9BD5 CB 2C         [ 8] 2084 	sra	h
   9BD7 CB 1D         [ 8] 2085 	rr	l
   9BD9 CB 2C         [ 8] 2086 	sra	h
   9BDB CB 1D         [ 8] 2087 	rr	l
   9BDD 55            [ 4] 2088 	ld	d,l
   9BDE CB 39         [ 8] 2089 	srl	c
   9BE0 FD E5         [15] 2090 	push	iy
   9BE2 21 F0 C0      [10] 2091 	ld	hl,#0xC0F0
   9BE5 E5            [11] 2092 	push	hl
   9BE6 3E 28         [ 7] 2093 	ld	a,#0x28
   9BE8 F5            [11] 2094 	push	af
   9BE9 33            [ 6] 2095 	inc	sp
   9BEA DD 7E FD      [19] 2096 	ld	a,-3 (ix)
   9BED F5            [11] 2097 	push	af
   9BEE 33            [ 6] 2098 	inc	sp
   9BEF C5            [11] 2099 	push	bc
   9BF0 33            [ 6] 2100 	inc	sp
   9BF1 D5            [11] 2101 	push	de
   9BF2 33            [ 6] 2102 	inc	sp
   9BF3 79            [ 4] 2103 	ld	a,c
   9BF4 F5            [11] 2104 	push	af
   9BF5 33            [ 6] 2105 	inc	sp
   9BF6 CD 41 85      [17] 2106 	call	_cpct_etm_drawTileBox2x4
                           2107 ;src/main.c:467: if(!cu.mover){
   9BF9 3A 01 91      [13] 2108 	ld	a, (#_cu + 9)
   9BFC B7            [ 4] 2109 	or	a, a
   9BFD 20 05         [12] 2110 	jr	NZ,00103$
                           2111 ;src/main.c:468: cu.lanzado = NO;
   9BFF 21 FE 90      [10] 2112 	ld	hl,#(_cu + 0x0006)
   9C02 36 00         [10] 2113 	ld	(hl),#0x00
   9C04                    2114 00103$:
   9C04 DD F9         [10] 2115 	ld	sp, ix
   9C06 DD E1         [14] 2116 	pop	ix
   9C08 C9            [10] 2117 	ret
                           2118 ;src/main.c:472: void redibujarCuchillo( ) {
                           2119 ;	---------------------------------
                           2120 ; Function redibujarCuchillo
                           2121 ; ---------------------------------
   9C09                    2122 _redibujarCuchillo::
                           2123 ;src/main.c:473: borrarCuchillo();
   9C09 CD 8B 9B      [17] 2124 	call	_borrarCuchillo
                           2125 ;src/main.c:474: cu.px = cu.x;
   9C0C 01 FA 90      [10] 2126 	ld	bc,#_cu + 2
   9C0F 3A F8 90      [13] 2127 	ld	a, (#_cu + 0)
   9C12 02            [ 7] 2128 	ld	(bc),a
                           2129 ;src/main.c:475: cu.py = cu.y;
   9C13 01 FB 90      [10] 2130 	ld	bc,#_cu + 3
   9C16 3A F9 90      [13] 2131 	ld	a, (#_cu + 1)
   9C19 02            [ 7] 2132 	ld	(bc),a
                           2133 ;src/main.c:476: dibujarCuchillo();
   9C1A C3 27 9B      [10] 2134 	jp  _dibujarCuchillo
                           2135 ;src/main.c:479: void lanzarCuchillo(){
                           2136 ;	---------------------------------
                           2137 ; Function lanzarCuchillo
                           2138 ; ---------------------------------
   9C1D                    2139 _lanzarCuchillo::
                           2140 ;src/main.c:481: if(!cu.lanzado){
   9C1D 3A FE 90      [13] 2141 	ld	a, (#(_cu + 0x0006) + 0)
   9C20 B7            [ 4] 2142 	or	a, a
   9C21 C0            [11] 2143 	ret	NZ
                           2144 ;src/main.c:483: if(prota.mira == M_derecha){
   9C22 21 F7 90      [10] 2145 	ld	hl, #_prota + 7
   9C25 5E            [ 7] 2146 	ld	e,(hl)
                           2147 ;src/main.c:484: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   9C26 01 F1 90      [10] 2148 	ld	bc,#_prota + 1
                           2149 ;src/main.c:486: cu.direccion = M_derecha;
                           2150 ;src/main.c:488: cu.y=prota.y + G_HERO_H /2;
                           2151 ;src/main.c:489: cu.sprite=g_knifeX_0;
                           2152 ;src/main.c:490: cu.eje = E_X;
                           2153 ;src/main.c:483: if(prota.mira == M_derecha){
   9C29 7B            [ 4] 2154 	ld	a,e
   9C2A B7            [ 4] 2155 	or	a, a
   9C2B 20 41         [12] 2156 	jr	NZ,00118$
                           2157 ;src/main.c:484: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   9C2D 0A            [ 7] 2158 	ld	a,(bc)
   9C2E C6 0B         [ 7] 2159 	add	a, #0x0B
   9C30 5F            [ 4] 2160 	ld	e,a
   9C31 3A F0 90      [13] 2161 	ld	a, (#_prota + 0)
   9C34 C6 0C         [ 7] 2162 	add	a, #0x0C
   9C36 6F            [ 4] 2163 	ld	l,a
   9C37 C5            [11] 2164 	push	bc
   9C38 7B            [ 4] 2165 	ld	a,e
   9C39 F5            [11] 2166 	push	af
   9C3A 33            [ 6] 2167 	inc	sp
   9C3B 7D            [ 4] 2168 	ld	a,l
   9C3C F5            [11] 2169 	push	af
   9C3D 33            [ 6] 2170 	inc	sp
   9C3E CD E0 91      [17] 2171 	call	_getTilePtr
   9C41 F1            [10] 2172 	pop	af
   9C42 C1            [10] 2173 	pop	bc
   9C43 5E            [ 7] 2174 	ld	e,(hl)
   9C44 3E 02         [ 7] 2175 	ld	a,#0x02
   9C46 93            [ 4] 2176 	sub	a, e
   9C47 D8            [11] 2177 	ret	C
                           2178 ;src/main.c:485: cu.lanzado = SI;
   9C48 21 FE 90      [10] 2179 	ld	hl,#(_cu + 0x0006)
   9C4B 36 01         [10] 2180 	ld	(hl),#0x01
                           2181 ;src/main.c:486: cu.direccion = M_derecha;
   9C4D 21 FF 90      [10] 2182 	ld	hl,#(_cu + 0x0007)
   9C50 36 00         [10] 2183 	ld	(hl),#0x00
                           2184 ;src/main.c:487: cu.x=prota.x + G_HERO_W;
   9C52 3A F0 90      [13] 2185 	ld	a, (#_prota + 0)
   9C55 C6 07         [ 7] 2186 	add	a, #0x07
   9C57 32 F8 90      [13] 2187 	ld	(#_cu),a
                           2188 ;src/main.c:488: cu.y=prota.y + G_HERO_H /2;
   9C5A 0A            [ 7] 2189 	ld	a,(bc)
   9C5B C6 0B         [ 7] 2190 	add	a, #0x0B
   9C5D 32 F9 90      [13] 2191 	ld	(#(_cu + 0x0001)),a
                           2192 ;src/main.c:489: cu.sprite=g_knifeX_0;
   9C60 21 C0 54      [10] 2193 	ld	hl,#_g_knifeX_0
   9C63 22 FC 90      [16] 2194 	ld	((_cu + 0x0004)), hl
                           2195 ;src/main.c:490: cu.eje = E_X;
   9C66 21 00 91      [10] 2196 	ld	hl,#(_cu + 0x0008)
   9C69 36 00         [10] 2197 	ld	(hl),#0x00
                           2198 ;src/main.c:491: dibujarCuchillo();
   9C6B C3 27 9B      [10] 2199 	jp  _dibujarCuchillo
   9C6E                    2200 00118$:
                           2201 ;src/main.c:494: else if(prota.mira == M_izquierda){
   9C6E 7B            [ 4] 2202 	ld	a,e
   9C6F 3D            [ 4] 2203 	dec	a
   9C70 20 41         [12] 2204 	jr	NZ,00115$
                           2205 ;src/main.c:495: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   9C72 0A            [ 7] 2206 	ld	a,(bc)
   9C73 C6 0B         [ 7] 2207 	add	a, #0x0B
   9C75 5F            [ 4] 2208 	ld	e,a
   9C76 3A F0 90      [13] 2209 	ld	a, (#_prota + 0)
   9C79 C6 F6         [ 7] 2210 	add	a,#0xF6
   9C7B 6F            [ 4] 2211 	ld	l,a
   9C7C C5            [11] 2212 	push	bc
   9C7D 7B            [ 4] 2213 	ld	a,e
   9C7E F5            [11] 2214 	push	af
   9C7F 33            [ 6] 2215 	inc	sp
   9C80 7D            [ 4] 2216 	ld	a,l
   9C81 F5            [11] 2217 	push	af
   9C82 33            [ 6] 2218 	inc	sp
   9C83 CD E0 91      [17] 2219 	call	_getTilePtr
   9C86 F1            [10] 2220 	pop	af
   9C87 C1            [10] 2221 	pop	bc
   9C88 5E            [ 7] 2222 	ld	e,(hl)
   9C89 3E 02         [ 7] 2223 	ld	a,#0x02
   9C8B 93            [ 4] 2224 	sub	a, e
   9C8C D8            [11] 2225 	ret	C
                           2226 ;src/main.c:496: cu.lanzado = SI;
   9C8D 21 FE 90      [10] 2227 	ld	hl,#(_cu + 0x0006)
   9C90 36 01         [10] 2228 	ld	(hl),#0x01
                           2229 ;src/main.c:497: cu.direccion = M_izquierda;
   9C92 21 FF 90      [10] 2230 	ld	hl,#(_cu + 0x0007)
   9C95 36 01         [10] 2231 	ld	(hl),#0x01
                           2232 ;src/main.c:498: cu.x = prota.x - G_KNIFEX_0_W;
   9C97 3A F0 90      [13] 2233 	ld	a, (#_prota + 0)
   9C9A C6 FC         [ 7] 2234 	add	a,#0xFC
   9C9C 32 F8 90      [13] 2235 	ld	(#_cu),a
                           2236 ;src/main.c:499: cu.y = prota.y + G_HERO_H /2;
   9C9F 0A            [ 7] 2237 	ld	a,(bc)
   9CA0 C6 0B         [ 7] 2238 	add	a, #0x0B
   9CA2 32 F9 90      [13] 2239 	ld	(#(_cu + 0x0001)),a
                           2240 ;src/main.c:500: cu.sprite = g_knifeX_1;
   9CA5 21 D0 54      [10] 2241 	ld	hl,#_g_knifeX_1
   9CA8 22 FC 90      [16] 2242 	ld	((_cu + 0x0004)), hl
                           2243 ;src/main.c:501: cu.eje = E_X;
   9CAB 21 00 91      [10] 2244 	ld	hl,#(_cu + 0x0008)
   9CAE 36 00         [10] 2245 	ld	(hl),#0x00
                           2246 ;src/main.c:502: dibujarCuchillo();
   9CB0 C3 27 9B      [10] 2247 	jp  _dibujarCuchillo
   9CB3                    2248 00115$:
                           2249 ;src/main.c:505: else if(prota.mira == M_abajo){
   9CB3 7B            [ 4] 2250 	ld	a,e
   9CB4 D6 03         [ 7] 2251 	sub	a, #0x03
   9CB6 20 41         [12] 2252 	jr	NZ,00112$
                           2253 ;src/main.c:507: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   9CB8 0A            [ 7] 2254 	ld	a,(bc)
   9CB9 C6 1F         [ 7] 2255 	add	a, #0x1F
   9CBB 5F            [ 4] 2256 	ld	e,a
   9CBC 3A F0 90      [13] 2257 	ld	a, (#_prota + 0)
   9CBF 57            [ 4] 2258 	ld	d,a
   9CC0 14            [ 4] 2259 	inc	d
   9CC1 14            [ 4] 2260 	inc	d
   9CC2 14            [ 4] 2261 	inc	d
   9CC3 C5            [11] 2262 	push	bc
   9CC4 7B            [ 4] 2263 	ld	a,e
   9CC5 F5            [11] 2264 	push	af
   9CC6 33            [ 6] 2265 	inc	sp
   9CC7 D5            [11] 2266 	push	de
   9CC8 33            [ 6] 2267 	inc	sp
   9CC9 CD E0 91      [17] 2268 	call	_getTilePtr
   9CCC F1            [10] 2269 	pop	af
   9CCD C1            [10] 2270 	pop	bc
   9CCE 5E            [ 7] 2271 	ld	e,(hl)
   9CCF 3E 02         [ 7] 2272 	ld	a,#0x02
   9CD1 93            [ 4] 2273 	sub	a, e
   9CD2 D8            [11] 2274 	ret	C
                           2275 ;src/main.c:508: cu.lanzado = SI;
   9CD3 21 FE 90      [10] 2276 	ld	hl,#(_cu + 0x0006)
   9CD6 36 01         [10] 2277 	ld	(hl),#0x01
                           2278 ;src/main.c:509: cu.direccion = M_abajo;
   9CD8 21 FF 90      [10] 2279 	ld	hl,#(_cu + 0x0007)
   9CDB 36 03         [10] 2280 	ld	(hl),#0x03
                           2281 ;src/main.c:510: cu.x = prota.x + G_HERO_W / 2;
   9CDD 3A F0 90      [13] 2282 	ld	a, (#_prota + 0)
   9CE0 C6 03         [ 7] 2283 	add	a, #0x03
   9CE2 32 F8 90      [13] 2284 	ld	(#_cu),a
                           2285 ;src/main.c:511: cu.y = prota.y + G_HERO_H;
   9CE5 0A            [ 7] 2286 	ld	a,(bc)
   9CE6 C6 16         [ 7] 2287 	add	a, #0x16
   9CE8 32 F9 90      [13] 2288 	ld	(#(_cu + 0x0001)),a
                           2289 ;src/main.c:512: cu.sprite = g_knifeY_0;
   9CEB 21 A0 54      [10] 2290 	ld	hl,#_g_knifeY_0
   9CEE 22 FC 90      [16] 2291 	ld	((_cu + 0x0004)), hl
                           2292 ;src/main.c:513: cu.eje = E_Y;
   9CF1 21 00 91      [10] 2293 	ld	hl,#(_cu + 0x0008)
   9CF4 36 01         [10] 2294 	ld	(hl),#0x01
                           2295 ;src/main.c:514: dibujarCuchillo();
   9CF6 C3 27 9B      [10] 2296 	jp  _dibujarCuchillo
   9CF9                    2297 00112$:
                           2298 ;src/main.c:517: else if(prota.mira == M_arriba){
   9CF9 7B            [ 4] 2299 	ld	a,e
   9CFA D6 02         [ 7] 2300 	sub	a, #0x02
   9CFC C0            [11] 2301 	ret	NZ
                           2302 ;src/main.c:518: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   9CFD 0A            [ 7] 2303 	ld	a,(bc)
   9CFE C6 F7         [ 7] 2304 	add	a,#0xF7
   9D00 57            [ 4] 2305 	ld	d,a
   9D01 3A F0 90      [13] 2306 	ld	a, (#_prota + 0)
   9D04 C6 03         [ 7] 2307 	add	a, #0x03
   9D06 C5            [11] 2308 	push	bc
   9D07 D5            [11] 2309 	push	de
   9D08 33            [ 6] 2310 	inc	sp
   9D09 F5            [11] 2311 	push	af
   9D0A 33            [ 6] 2312 	inc	sp
   9D0B CD E0 91      [17] 2313 	call	_getTilePtr
   9D0E F1            [10] 2314 	pop	af
   9D0F C1            [10] 2315 	pop	bc
   9D10 5E            [ 7] 2316 	ld	e,(hl)
   9D11 3E 02         [ 7] 2317 	ld	a,#0x02
   9D13 93            [ 4] 2318 	sub	a, e
   9D14 D8            [11] 2319 	ret	C
                           2320 ;src/main.c:519: cu.lanzado = SI;
   9D15 21 FE 90      [10] 2321 	ld	hl,#(_cu + 0x0006)
   9D18 36 01         [10] 2322 	ld	(hl),#0x01
                           2323 ;src/main.c:520: cu.direccion = M_arriba;
   9D1A 21 FF 90      [10] 2324 	ld	hl,#(_cu + 0x0007)
   9D1D 36 02         [10] 2325 	ld	(hl),#0x02
                           2326 ;src/main.c:521: cu.x = prota.x + G_HERO_W / 2;
   9D1F 3A F0 90      [13] 2327 	ld	a, (#_prota + 0)
   9D22 C6 03         [ 7] 2328 	add	a, #0x03
   9D24 32 F8 90      [13] 2329 	ld	(#_cu),a
                           2330 ;src/main.c:522: cu.y = prota.y;
   9D27 0A            [ 7] 2331 	ld	a,(bc)
   9D28 32 F9 90      [13] 2332 	ld	(#(_cu + 0x0001)),a
                           2333 ;src/main.c:523: cu.sprite = g_knifeY_1;
   9D2B 21 B0 54      [10] 2334 	ld	hl,#_g_knifeY_1
   9D2E 22 FC 90      [16] 2335 	ld	((_cu + 0x0004)), hl
                           2336 ;src/main.c:524: cu.eje = E_Y;
   9D31 21 00 91      [10] 2337 	ld	hl,#(_cu + 0x0008)
   9D34 36 01         [10] 2338 	ld	(hl),#0x01
                           2339 ;src/main.c:525: dibujarCuchillo();
   9D36 C3 27 9B      [10] 2340 	jp  _dibujarCuchillo
                           2341 ;src/main.c:531: void comprobarTeclado() {
                           2342 ;	---------------------------------
                           2343 ; Function comprobarTeclado
                           2344 ; ---------------------------------
   9D39                    2345 _comprobarTeclado::
                           2346 ;src/main.c:532: cpct_scanKeyboard_if();
   9D39 CD 99 86      [17] 2347 	call	_cpct_scanKeyboard_if
                           2348 ;src/main.c:534: if (cpct_isAnyKeyPressed()) {
   9D3C CD 8C 86      [17] 2349 	call	_cpct_isAnyKeyPressed
   9D3F 7D            [ 4] 2350 	ld	a,l
   9D40 B7            [ 4] 2351 	or	a, a
   9D41 C8            [11] 2352 	ret	Z
                           2353 ;src/main.c:535: if (cpct_isKeyPressed(Key_CursorLeft))
   9D42 21 01 01      [10] 2354 	ld	hl,#0x0101
   9D45 CD 60 84      [17] 2355 	call	_cpct_isKeyPressed
   9D48 7D            [ 4] 2356 	ld	a,l
   9D49 B7            [ 4] 2357 	or	a, a
                           2358 ;src/main.c:536: moverIzquierda();
   9D4A C2 74 9A      [10] 2359 	jp	NZ,_moverIzquierda
                           2360 ;src/main.c:537: else if (cpct_isKeyPressed(Key_CursorRight))
   9D4D 21 00 02      [10] 2361 	ld	hl,#0x0200
   9D50 CD 60 84      [17] 2362 	call	_cpct_isKeyPressed
   9D53 7D            [ 4] 2363 	ld	a,l
   9D54 B7            [ 4] 2364 	or	a, a
                           2365 ;src/main.c:538: moverDerecha();
   9D55 C2 99 9A      [10] 2366 	jp	NZ,_moverDerecha
                           2367 ;src/main.c:539: else if (cpct_isKeyPressed(Key_CursorUp))
   9D58 21 00 01      [10] 2368 	ld	hl,#0x0100
   9D5B CD 60 84      [17] 2369 	call	_cpct_isKeyPressed
   9D5E 7D            [ 4] 2370 	ld	a,l
   9D5F B7            [ 4] 2371 	or	a, a
                           2372 ;src/main.c:540: moverArriba();
   9D60 C2 DF 9A      [10] 2373 	jp	NZ,_moverArriba
                           2374 ;src/main.c:541: else if (cpct_isKeyPressed(Key_CursorDown))
   9D63 21 00 04      [10] 2375 	ld	hl,#0x0400
   9D66 CD 60 84      [17] 2376 	call	_cpct_isKeyPressed
   9D69 7D            [ 4] 2377 	ld	a,l
   9D6A B7            [ 4] 2378 	or	a, a
                           2379 ;src/main.c:542: moverAbajo();
   9D6B C2 03 9B      [10] 2380 	jp	NZ,_moverAbajo
                           2381 ;src/main.c:543: else if (cpct_isKeyPressed(Key_Space))
   9D6E 21 05 80      [10] 2382 	ld	hl,#0x8005
   9D71 CD 60 84      [17] 2383 	call	_cpct_isKeyPressed
   9D74 7D            [ 4] 2384 	ld	a,l
   9D75 B7            [ 4] 2385 	or	a, a
   9D76 C8            [11] 2386 	ret	Z
                           2387 ;src/main.c:544: lanzarCuchillo();
   9D77 C3 1D 9C      [10] 2388 	jp  _lanzarCuchillo
                           2389 ;src/main.c:548: u8 checkKnifeCollision(int direction, u8 xoff, u8 yoff){ // TODO: el parámetro direction no se usa
                           2390 ;	---------------------------------
                           2391 ; Function checkKnifeCollision
                           2392 ; ---------------------------------
   9D7A                    2393 _checkKnifeCollision::
                           2394 ;src/main.c:550: return *getTilePtr(cu.x + xoff, cu.y + yoff) <= 2;
   9D7A 3A F9 90      [13] 2395 	ld	a,(#_cu + 1)
   9D7D 21 05 00      [10] 2396 	ld	hl,#5
   9D80 39            [11] 2397 	add	hl,sp
   9D81 86            [ 7] 2398 	add	a, (hl)
   9D82 47            [ 4] 2399 	ld	b,a
   9D83 3A F8 90      [13] 2400 	ld	a,(#_cu + 0)
   9D86 21 04 00      [10] 2401 	ld	hl,#4
   9D89 39            [11] 2402 	add	hl,sp
   9D8A 86            [ 7] 2403 	add	a, (hl)
   9D8B 4F            [ 4] 2404 	ld	c,a
   9D8C C5            [11] 2405 	push	bc
   9D8D CD E0 91      [17] 2406 	call	_getTilePtr
   9D90 F1            [10] 2407 	pop	af
   9D91 4E            [ 7] 2408 	ld	c,(hl)
   9D92 3E 02         [ 7] 2409 	ld	a,#0x02
   9D94 91            [ 4] 2410 	sub	a, c
   9D95 3E 00         [ 7] 2411 	ld	a,#0x00
   9D97 17            [ 4] 2412 	rla
   9D98 EE 01         [ 7] 2413 	xor	a, #0x01
   9D9A 6F            [ 4] 2414 	ld	l, a
   9D9B C9            [10] 2415 	ret
                           2416 ;src/main.c:553: void moverCuchillo(){
                           2417 ;	---------------------------------
                           2418 ; Function moverCuchillo
                           2419 ; ---------------------------------
   9D9C                    2420 _moverCuchillo::
                           2421 ;src/main.c:554: if(cu.lanzado){
   9D9C 01 F8 90      [10] 2422 	ld	bc,#_cu+0
   9D9F 3A FE 90      [13] 2423 	ld	a, (#_cu + 6)
   9DA2 B7            [ 4] 2424 	or	a, a
   9DA3 C8            [11] 2425 	ret	Z
                           2426 ;src/main.c:555: cu.mover = SI;
   9DA4 21 09 00      [10] 2427 	ld	hl,#0x0009
   9DA7 09            [11] 2428 	add	hl,bc
   9DA8 EB            [ 4] 2429 	ex	de,hl
   9DA9 3E 01         [ 7] 2430 	ld	a,#0x01
   9DAB 12            [ 7] 2431 	ld	(de),a
                           2432 ;src/main.c:556: if(cu.direccion == M_derecha){
   9DAC 21 FF 90      [10] 2433 	ld	hl, #_cu + 7
   9DAF 6E            [ 7] 2434 	ld	l,(hl)
   9DB0 7D            [ 4] 2435 	ld	a,l
   9DB1 B7            [ 4] 2436 	or	a, a
   9DB2 20 1E         [12] 2437 	jr	NZ,00122$
                           2438 ;src/main.c:558: if(checkKnifeCollision(M_derecha, G_KNIFEX_0_W + 1, 0)){
   9DB4 C5            [11] 2439 	push	bc
   9DB5 D5            [11] 2440 	push	de
   9DB6 21 05 00      [10] 2441 	ld	hl,#0x0005
   9DB9 E5            [11] 2442 	push	hl
   9DBA 2E 00         [ 7] 2443 	ld	l, #0x00
   9DBC E5            [11] 2444 	push	hl
   9DBD CD 7A 9D      [17] 2445 	call	_checkKnifeCollision
   9DC0 F1            [10] 2446 	pop	af
   9DC1 F1            [10] 2447 	pop	af
   9DC2 D1            [10] 2448 	pop	de
   9DC3 C1            [10] 2449 	pop	bc
   9DC4 7D            [ 4] 2450 	ld	a,l
   9DC5 B7            [ 4] 2451 	or	a, a
   9DC6 28 07         [12] 2452 	jr	Z,00102$
                           2453 ;src/main.c:559: cu.mover = SI;
   9DC8 3E 01         [ 7] 2454 	ld	a,#0x01
   9DCA 12            [ 7] 2455 	ld	(de),a
                           2456 ;src/main.c:560: cu.x++;
   9DCB 0A            [ 7] 2457 	ld	a,(bc)
   9DCC 3C            [ 4] 2458 	inc	a
   9DCD 02            [ 7] 2459 	ld	(bc),a
   9DCE C9            [10] 2460 	ret
   9DCF                    2461 00102$:
                           2462 ;src/main.c:563: cu.mover=NO;
   9DCF AF            [ 4] 2463 	xor	a, a
   9DD0 12            [ 7] 2464 	ld	(de),a
   9DD1 C9            [10] 2465 	ret
   9DD2                    2466 00122$:
                           2467 ;src/main.c:566: else if(cu.direccion == M_izquierda){
   9DD2 7D            [ 4] 2468 	ld	a,l
   9DD3 3D            [ 4] 2469 	dec	a
   9DD4 20 1F         [12] 2470 	jr	NZ,00119$
                           2471 ;src/main.c:567: if(checkKnifeCollision(M_derecha, -1, 0)){
   9DD6 C5            [11] 2472 	push	bc
   9DD7 D5            [11] 2473 	push	de
   9DD8 21 FF 00      [10] 2474 	ld	hl,#0x00FF
   9DDB E5            [11] 2475 	push	hl
   9DDC 2E 00         [ 7] 2476 	ld	l, #0x00
   9DDE E5            [11] 2477 	push	hl
   9DDF CD 7A 9D      [17] 2478 	call	_checkKnifeCollision
   9DE2 F1            [10] 2479 	pop	af
   9DE3 F1            [10] 2480 	pop	af
   9DE4 D1            [10] 2481 	pop	de
   9DE5 C1            [10] 2482 	pop	bc
   9DE6 7D            [ 4] 2483 	ld	a,l
   9DE7 B7            [ 4] 2484 	or	a, a
   9DE8 28 08         [12] 2485 	jr	Z,00105$
                           2486 ;src/main.c:568: cu.mover = SI;
   9DEA 3E 01         [ 7] 2487 	ld	a,#0x01
   9DEC 12            [ 7] 2488 	ld	(de),a
                           2489 ;src/main.c:569: cu.x--;
   9DED 0A            [ 7] 2490 	ld	a,(bc)
   9DEE C6 FF         [ 7] 2491 	add	a,#0xFF
   9DF0 02            [ 7] 2492 	ld	(bc),a
   9DF1 C9            [10] 2493 	ret
   9DF2                    2494 00105$:
                           2495 ;src/main.c:571: cu.mover=NO;
   9DF2 AF            [ 4] 2496 	xor	a, a
   9DF3 12            [ 7] 2497 	ld	(de),a
   9DF4 C9            [10] 2498 	ret
   9DF5                    2499 00119$:
                           2500 ;src/main.c:577: cu.y--;
   9DF5 03            [ 6] 2501 	inc	bc
                           2502 ;src/main.c:574: else if(cu.direccion == M_arriba){
   9DF6 7D            [ 4] 2503 	ld	a,l
   9DF7 D6 02         [ 7] 2504 	sub	a, #0x02
   9DF9 20 22         [12] 2505 	jr	NZ,00116$
                           2506 ;src/main.c:575: if(checkKnifeCollision(M_derecha, 0, -2)){
   9DFB C5            [11] 2507 	push	bc
   9DFC D5            [11] 2508 	push	de
   9DFD 21 00 FE      [10] 2509 	ld	hl,#0xFE00
   9E00 E5            [11] 2510 	push	hl
   9E01 26 00         [ 7] 2511 	ld	h, #0x00
   9E03 E5            [11] 2512 	push	hl
   9E04 CD 7A 9D      [17] 2513 	call	_checkKnifeCollision
   9E07 F1            [10] 2514 	pop	af
   9E08 F1            [10] 2515 	pop	af
   9E09 D1            [10] 2516 	pop	de
   9E0A C1            [10] 2517 	pop	bc
   9E0B 7D            [ 4] 2518 	ld	a,l
   9E0C B7            [ 4] 2519 	or	a, a
   9E0D 28 0B         [12] 2520 	jr	Z,00108$
                           2521 ;src/main.c:576: cu.mover = SI;
   9E0F 3E 01         [ 7] 2522 	ld	a,#0x01
   9E11 12            [ 7] 2523 	ld	(de),a
                           2524 ;src/main.c:577: cu.y--;
   9E12 0A            [ 7] 2525 	ld	a,(bc)
   9E13 C6 FF         [ 7] 2526 	add	a,#0xFF
   9E15 02            [ 7] 2527 	ld	(bc),a
                           2528 ;src/main.c:578: cu.y--;
   9E16 C6 FF         [ 7] 2529 	add	a,#0xFF
   9E18 02            [ 7] 2530 	ld	(bc),a
   9E19 C9            [10] 2531 	ret
   9E1A                    2532 00108$:
                           2533 ;src/main.c:581: cu.mover=NO;
   9E1A AF            [ 4] 2534 	xor	a, a
   9E1B 12            [ 7] 2535 	ld	(de),a
   9E1C C9            [10] 2536 	ret
   9E1D                    2537 00116$:
                           2538 ;src/main.c:584: else if(cu.direccion == M_abajo){
   9E1D 7D            [ 4] 2539 	ld	a,l
   9E1E D6 03         [ 7] 2540 	sub	a, #0x03
   9E20 C0            [11] 2541 	ret	NZ
                           2542 ;src/main.c:585: if(checkKnifeCollision(M_derecha, 0, G_KNIFEY_0_H + 2)){
   9E21 C5            [11] 2543 	push	bc
   9E22 D5            [11] 2544 	push	de
   9E23 21 00 0A      [10] 2545 	ld	hl,#0x0A00
   9E26 E5            [11] 2546 	push	hl
   9E27 26 00         [ 7] 2547 	ld	h, #0x00
   9E29 E5            [11] 2548 	push	hl
   9E2A CD 7A 9D      [17] 2549 	call	_checkKnifeCollision
   9E2D F1            [10] 2550 	pop	af
   9E2E F1            [10] 2551 	pop	af
   9E2F D1            [10] 2552 	pop	de
   9E30 C1            [10] 2553 	pop	bc
   9E31 7D            [ 4] 2554 	ld	a,l
   9E32 B7            [ 4] 2555 	or	a, a
   9E33 28 09         [12] 2556 	jr	Z,00111$
                           2557 ;src/main.c:586: cu.mover = SI;
   9E35 3E 01         [ 7] 2558 	ld	a,#0x01
   9E37 12            [ 7] 2559 	ld	(de),a
                           2560 ;src/main.c:587: cu.y++;
   9E38 0A            [ 7] 2561 	ld	a,(bc)
   9E39 3C            [ 4] 2562 	inc	a
   9E3A 02            [ 7] 2563 	ld	(bc),a
                           2564 ;src/main.c:588: cu.y++;
   9E3B 3C            [ 4] 2565 	inc	a
   9E3C 02            [ 7] 2566 	ld	(bc),a
   9E3D C9            [10] 2567 	ret
   9E3E                    2568 00111$:
                           2569 ;src/main.c:591: cu.mover=NO;
   9E3E AF            [ 4] 2570 	xor	a, a
   9E3F 12            [ 7] 2571 	ld	(de),a
   9E40 C9            [10] 2572 	ret
                           2573 ;src/main.c:597: void inicializarCPC() {
                           2574 ;	---------------------------------
                           2575 ; Function inicializarCPC
                           2576 ; ---------------------------------
   9E41                    2577 _inicializarCPC::
                           2578 ;src/main.c:598: cpct_disableFirmware();
   9E41 CD 5E 8F      [17] 2579 	call	_cpct_disableFirmware
                           2580 ;src/main.c:599: cpct_setVideoMode(0);
   9E44 2E 00         [ 7] 2581 	ld	l,#0x00
   9E46 CD 09 87      [17] 2582 	call	_cpct_setVideoMode
                           2583 ;src/main.c:600: cpct_setBorder(HW_BLACK);
   9E49 21 10 14      [10] 2584 	ld	hl,#0x1410
   9E4C E5            [11] 2585 	push	hl
   9E4D CD 6C 84      [17] 2586 	call	_cpct_setPALColour
                           2587 ;src/main.c:601: cpct_setPalette(g_palette, 16);
   9E50 21 10 00      [10] 2588 	ld	hl,#0x0010
   9E53 E5            [11] 2589 	push	hl
   9E54 21 60 7B      [10] 2590 	ld	hl,#_g_palette
   9E57 E5            [11] 2591 	push	hl
   9E58 CD 49 84      [17] 2592 	call	_cpct_setPalette
                           2593 ;src/main.c:602: cpct_akp_musicInit(G_song);
   9E5B 21 00 3F      [10] 2594 	ld	hl,#_G_song
   9E5E E5            [11] 2595 	push	hl
   9E5F CD 3A 8E      [17] 2596 	call	_cpct_akp_musicInit
   9E62 F1            [10] 2597 	pop	af
   9E63 C9            [10] 2598 	ret
                           2599 ;src/main.c:605: void inicializarJuego() {
                           2600 ;	---------------------------------
                           2601 ; Function inicializarJuego
                           2602 ; ---------------------------------
   9E64                    2603 _inicializarJuego::
                           2604 ;src/main.c:607: num_mapa = 0;
   9E64 21 04 91      [10] 2605 	ld	hl,#_num_mapa + 0
   9E67 36 00         [10] 2606 	ld	(hl), #0x00
                           2607 ;src/main.c:608: mapa = mapas[num_mapa];
   9E69 21 22 91      [10] 2608 	ld	hl, #_mapas + 0
   9E6C 7E            [ 7] 2609 	ld	a,(hl)
   9E6D FD 21 02 91   [14] 2610 	ld	iy,#_mapa
   9E71 FD 77 00      [19] 2611 	ld	0 (iy),a
   9E74 23            [ 6] 2612 	inc	hl
   9E75 7E            [ 7] 2613 	ld	a,(hl)
   9E76 32 03 91      [13] 2614 	ld	(#_mapa + 1),a
                           2615 ;src/main.c:609: cpct_etm_setTileset2x4(g_tileset);
   9E79 21 E0 54      [10] 2616 	ld	hl,#_g_tileset
   9E7C CD 5D 86      [17] 2617 	call	_cpct_etm_setTileset2x4
                           2618 ;src/main.c:611: dibujarMapa();
   9E7F CD 0C 91      [17] 2619 	call	_dibujarMapa
                           2620 ;src/main.c:614: barraPuntuacionInicial();
   9E82 CD AA 81      [17] 2621 	call	_barraPuntuacionInicial
                           2622 ;src/main.c:617: prota.x = prota.px = 4;
   9E85 21 F2 90      [10] 2623 	ld	hl,#(_prota + 0x0002)
   9E88 36 04         [10] 2624 	ld	(hl),#0x04
   9E8A 21 F0 90      [10] 2625 	ld	hl,#_prota
   9E8D 36 04         [10] 2626 	ld	(hl),#0x04
                           2627 ;src/main.c:618: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   9E8F 21 F3 90      [10] 2628 	ld	hl,#(_prota + 0x0003)
   9E92 36 68         [10] 2629 	ld	(hl),#0x68
   9E94 21 F1 90      [10] 2630 	ld	hl,#(_prota + 0x0001)
   9E97 36 68         [10] 2631 	ld	(hl),#0x68
                           2632 ;src/main.c:619: prota.mover  = NO;
   9E99 21 F6 90      [10] 2633 	ld	hl,#(_prota + 0x0006)
   9E9C 36 00         [10] 2634 	ld	(hl),#0x00
                           2635 ;src/main.c:620: prota.mira=M_derecha;
   9E9E 21 F7 90      [10] 2636 	ld	hl,#(_prota + 0x0007)
   9EA1 36 00         [10] 2637 	ld	(hl),#0x00
                           2638 ;src/main.c:621: prota.sprite = g_hero;
   9EA3 21 70 7B      [10] 2639 	ld	hl,#_g_hero
   9EA6 22 F4 90      [16] 2640 	ld	((_prota + 0x0004)), hl
                           2641 ;src/main.c:625: cu.x = cu.px = 0;
   9EA9 21 FA 90      [10] 2642 	ld	hl,#(_cu + 0x0002)
   9EAC 36 00         [10] 2643 	ld	(hl),#0x00
   9EAE 21 F8 90      [10] 2644 	ld	hl,#_cu
   9EB1 36 00         [10] 2645 	ld	(hl),#0x00
                           2646 ;src/main.c:626: cu.y = cu.py = 0;
   9EB3 21 FB 90      [10] 2647 	ld	hl,#(_cu + 0x0003)
   9EB6 36 00         [10] 2648 	ld	(hl),#0x00
   9EB8 21 F9 90      [10] 2649 	ld	hl,#(_cu + 0x0001)
   9EBB 36 00         [10] 2650 	ld	(hl),#0x00
                           2651 ;src/main.c:627: cu.lanzado = NO;
   9EBD 21 FE 90      [10] 2652 	ld	hl,#(_cu + 0x0006)
   9EC0 36 00         [10] 2653 	ld	(hl),#0x00
                           2654 ;src/main.c:628: cu.mover = NO;
   9EC2 21 01 91      [10] 2655 	ld	hl,#(_cu + 0x0009)
   9EC5 36 00         [10] 2656 	ld	(hl),#0x00
                           2657 ;src/main.c:630: inicializarEnemy();
   9EC7 CD AB 99      [17] 2658 	call	_inicializarEnemy
                           2659 ;src/main.c:632: dibujarProta();
   9ECA C3 32 91      [10] 2660 	jp  _dibujarProta
                           2661 ;src/main.c:635: void main(void) {
                           2662 ;	---------------------------------
                           2663 ; Function main
                           2664 ; ---------------------------------
   9ECD                    2665 _main::
   9ECD DD E5         [15] 2666 	push	ix
   9ECF DD 21 00 00   [14] 2667 	ld	ix,#0
   9ED3 DD 39         [15] 2668 	add	ix,sp
   9ED5 3B            [ 6] 2669 	dec	sp
                           2670 ;src/main.c:640: inicializarCPC();
   9ED6 CD 41 9E      [17] 2671 	call	_inicializarCPC
                           2672 ;src/main.c:642: menuInicio();
   9ED9 CD CB 80      [17] 2673 	call	_menuInicio
                           2674 ;src/main.c:644: inicializarJuego();
   9EDC CD 64 9E      [17] 2675 	call	_inicializarJuego
                           2676 ;src/main.c:645: cpct_akp_musicPlay();
   9EDF CD 37 87      [17] 2677 	call	_cpct_akp_musicPlay
                           2678 ;src/main.c:647: while (1) {
   9EE2                    2679 00122$:
                           2680 ;src/main.c:649: i = (2 + num_mapa) + 1;
   9EE2 21 04 91      [10] 2681 	ld	hl,#_num_mapa + 0
   9EE5 4E            [ 7] 2682 	ld	c, (hl)
   9EE6 0C            [ 4] 2683 	inc	c
   9EE7 0C            [ 4] 2684 	inc	c
   9EE8 0C            [ 4] 2685 	inc	c
                           2686 ;src/main.c:650: actual = enemy;
                           2687 ;src/main.c:652: comprobarTeclado();
   9EE9 C5            [11] 2688 	push	bc
   9EEA CD 39 9D      [17] 2689 	call	_comprobarTeclado
   9EED CD 9C 9D      [17] 2690 	call	_moverCuchillo
   9EF0 C1            [10] 2691 	pop	bc
                           2692 ;src/main.c:655: while(--i){
   9EF1 11 BC 90      [10] 2693 	ld	de,#_enemy
   9EF4                    2694 00101$:
   9EF4 0D            [ 4] 2695 	dec c
   9EF5 28 11         [12] 2696 	jr	Z,00103$
                           2697 ;src/main.c:656: moverEnemigo(actual);
   9EF7 C5            [11] 2698 	push	bc
   9EF8 D5            [11] 2699 	push	de
   9EF9 D5            [11] 2700 	push	de
   9EFA CD 4B 99      [17] 2701 	call	_moverEnemigo
   9EFD F1            [10] 2702 	pop	af
   9EFE D1            [10] 2703 	pop	de
   9EFF C1            [10] 2704 	pop	bc
                           2705 ;src/main.c:657: ++actual;
   9F00 21 0D 00      [10] 2706 	ld	hl,#0x000D
   9F03 19            [11] 2707 	add	hl,de
   9F04 5D            [ 4] 2708 	ld	e,l
   9F05 54            [ 4] 2709 	ld	d,h
   9F06 18 EC         [12] 2710 	jr	00101$
   9F08                    2711 00103$:
                           2712 ;src/main.c:660: actual = enemy;
   9F08 01 BC 90      [10] 2713 	ld	bc,#_enemy
                           2714 ;src/main.c:662: cpct_waitVSYNC();
   9F0B C5            [11] 2715 	push	bc
   9F0C CD 01 87      [17] 2716 	call	_cpct_waitVSYNC
   9F0F C1            [10] 2717 	pop	bc
                           2718 ;src/main.c:664: if (prota.mover) {
   9F10 11 F6 90      [10] 2719 	ld	de,#_prota+6
   9F13 1A            [ 7] 2720 	ld	a,(de)
   9F14 B7            [ 4] 2721 	or	a, a
   9F15 28 09         [12] 2722 	jr	Z,00105$
                           2723 ;src/main.c:665: redibujarProta();
   9F17 C5            [11] 2724 	push	bc
   9F18 D5            [11] 2725 	push	de
   9F19 CD CC 91      [17] 2726 	call	_redibujarProta
   9F1C D1            [10] 2727 	pop	de
   9F1D C1            [10] 2728 	pop	bc
                           2729 ;src/main.c:666: prota.mover = NO;
   9F1E AF            [ 4] 2730 	xor	a, a
   9F1F 12            [ 7] 2731 	ld	(de),a
   9F20                    2732 00105$:
                           2733 ;src/main.c:668: if(cu.lanzado && cu.mover){
   9F20 21 FE 90      [10] 2734 	ld	hl,#_cu + 6
   9F23 5E            [ 7] 2735 	ld	e,(hl)
   9F24 21 01 91      [10] 2736 	ld	hl,#_cu + 9
   9F27 7B            [ 4] 2737 	ld	a,e
   9F28 B7            [ 4] 2738 	or	a, a
   9F29 28 0B         [12] 2739 	jr	Z,00110$
   9F2B 7E            [ 7] 2740 	ld	a,(hl)
   9F2C B7            [ 4] 2741 	or	a, a
   9F2D 28 07         [12] 2742 	jr	Z,00110$
                           2743 ;src/main.c:669: redibujarCuchillo();
   9F2F C5            [11] 2744 	push	bc
   9F30 CD 09 9C      [17] 2745 	call	_redibujarCuchillo
   9F33 C1            [10] 2746 	pop	bc
   9F34 18 0D         [12] 2747 	jr	00137$
   9F36                    2748 00110$:
                           2749 ;src/main.c:670: }else if (cu.lanzado && !cu.mover){
   9F36 7B            [ 4] 2750 	ld	a,e
   9F37 B7            [ 4] 2751 	or	a, a
   9F38 28 09         [12] 2752 	jr	Z,00137$
   9F3A 7E            [ 7] 2753 	ld	a,(hl)
   9F3B B7            [ 4] 2754 	or	a, a
   9F3C 20 05         [12] 2755 	jr	NZ,00137$
                           2756 ;src/main.c:671: borrarCuchillo();
   9F3E C5            [11] 2757 	push	bc
   9F3F CD 8B 9B      [17] 2758 	call	_borrarCuchillo
   9F42 C1            [10] 2759 	pop	bc
                           2760 ;src/main.c:674: while(--i){
   9F43                    2761 00137$:
   9F43 DD 36 FF 05   [19] 2762 	ld	-1 (ix),#0x05
   9F47                    2763 00118$:
   9F47 DD 35 FF      [23] 2764 	dec	-1 (ix)
   9F4A DD 7E FF      [19] 2765 	ld	a,-1 (ix)
   9F4D B7            [ 4] 2766 	or	a, a
   9F4E 28 62         [12] 2767 	jr	Z,00120$
                           2768 ;src/main.c:675: if(actual->mover){
   9F50 C5            [11] 2769 	push	bc
   9F51 FD E1         [14] 2770 	pop	iy
   9F53 FD 7E 06      [19] 2771 	ld	a,6 (iy)
   9F56 B7            [ 4] 2772 	or	a, a
   9F57 28 07         [12] 2773 	jr	Z,00114$
                           2774 ;src/main.c:676: redibujarEnemigo(actual);
   9F59 C5            [11] 2775 	push	bc
   9F5A C5            [11] 2776 	push	bc
   9F5B CD EA 94      [17] 2777 	call	_redibujarEnemigo
   9F5E F1            [10] 2778 	pop	af
   9F5F C1            [10] 2779 	pop	bc
   9F60                    2780 00114$:
                           2781 ;src/main.c:678: if (actual->muerto && actual->muertes == 0){
   9F60 C5            [11] 2782 	push	bc
   9F61 FD E1         [14] 2783 	pop	iy
   9F63 FD 7E 08      [19] 2784 	ld	a,8 (iy)
   9F66 B7            [ 4] 2785 	or	a, a
   9F67 28 41         [12] 2786 	jr	Z,00116$
   9F69 21 0C 00      [10] 2787 	ld	hl,#0x000C
   9F6C 09            [11] 2788 	add	hl,bc
   9F6D EB            [ 4] 2789 	ex	de,hl
   9F6E 1A            [ 7] 2790 	ld	a,(de)
   9F6F B7            [ 4] 2791 	or	a, a
   9F70 20 38         [12] 2792 	jr	NZ,00116$
                           2793 ;src/main.c:679: borrarEnemigo(actual);
   9F72 C5            [11] 2794 	push	bc
   9F73 D5            [11] 2795 	push	de
   9F74 C5            [11] 2796 	push	bc
   9F75 CD 56 94      [17] 2797 	call	_borrarEnemigo
   9F78 F1            [10] 2798 	pop	af
   9F79 D1            [10] 2799 	pop	de
   9F7A C1            [10] 2800 	pop	bc
                           2801 ;src/main.c:680: dibujarExplosion(actual);
   9F7B C5            [11] 2802 	push	bc
   9F7C D5            [11] 2803 	push	de
   9F7D C5            [11] 2804 	push	bc
   9F7E CD AE 93      [17] 2805 	call	_dibujarExplosion
   9F81 F1            [10] 2806 	pop	af
   9F82 CD 83 83      [17] 2807 	call	_aumentarPuntuacion
   9F85 D1            [10] 2808 	pop	de
   9F86 C1            [10] 2809 	pop	bc
   9F87 FD 21 05 91   [14] 2810 	ld	iy,#_puntuacion
   9F8B FD 75 00      [19] 2811 	ld	0 (iy),l
                           2812 ;src/main.c:684: modificarPuntuacion(puntuacion);
   9F8E FD 21 05 91   [14] 2813 	ld	iy,#_puntuacion
   9F92 FD 6E 00      [19] 2814 	ld	l,0 (iy)
   9F95 26 00         [ 7] 2815 	ld	h,#0x00
   9F97 C5            [11] 2816 	push	bc
   9F98 D5            [11] 2817 	push	de
   9F99 E5            [11] 2818 	push	hl
   9F9A CD 46 82      [17] 2819 	call	_modificarPuntuacion
   9F9D F1            [10] 2820 	pop	af
   9F9E D1            [10] 2821 	pop	de
   9F9F C1            [10] 2822 	pop	bc
                           2823 ;src/main.c:686: actual->muertes++;
   9FA0 1A            [ 7] 2824 	ld	a,(de)
   9FA1 3C            [ 4] 2825 	inc	a
   9FA2 12            [ 7] 2826 	ld	(de),a
                           2827 ;src/main.c:687: actual->x = 0;
   9FA3 AF            [ 4] 2828 	xor	a, a
   9FA4 02            [ 7] 2829 	ld	(bc),a
                           2830 ;src/main.c:688: actual->y = 0;
   9FA5 59            [ 4] 2831 	ld	e, c
   9FA6 50            [ 4] 2832 	ld	d, b
   9FA7 13            [ 6] 2833 	inc	de
   9FA8 AF            [ 4] 2834 	xor	a, a
   9FA9 12            [ 7] 2835 	ld	(de),a
   9FAA                    2836 00116$:
                           2837 ;src/main.c:690: ++actual;
   9FAA 21 0D 00      [10] 2838 	ld	hl,#0x000D
   9FAD 09            [11] 2839 	add	hl,bc
   9FAE 4D            [ 4] 2840 	ld	c,l
   9FAF 44            [ 4] 2841 	ld	b,h
   9FB0 18 95         [12] 2842 	jr	00118$
   9FB2                    2843 00120$:
                           2844 ;src/main.c:692: cpct_waitVSYNC();
   9FB2 CD 01 87      [17] 2845 	call	_cpct_waitVSYNC
   9FB5 C3 E2 9E      [10] 2846 	jp	00122$
   9FB8 33            [ 6] 2847 	inc	sp
   9FB9 DD E1         [14] 2848 	pop	ix
   9FBB C9            [10] 2849 	ret
                           2850 	.area _CODE
                           2851 	.area _INITIALIZER
   9107                    2852 __xinit__mapa:
   9107 00 00              2853 	.dw #0x0000
   9109                    2854 __xinit__num_mapa:
   9109 00                 2855 	.db #0x00	; 0
   910A                    2856 __xinit__puntuacion:
   910A 00                 2857 	.db #0x00	; 0
   910B                    2858 __xinit__vidas:
   910B 05                 2859 	.db #0x05	; 5
                           2860 	.area _CABS (ABS)
   3F00                    2861 	.org 0x3F00
   3F00                    2862 _G_song:
   3F00 41                 2863 	.db #0x41	; 65	'A'
   3F01 54                 2864 	.db #0x54	; 84	'T'
   3F02 31                 2865 	.db #0x31	; 49	'1'
   3F03 30                 2866 	.db #0x30	; 48	'0'
   3F04 01                 2867 	.db #0x01	; 1
   3F05 40                 2868 	.db #0x40	; 64
   3F06 42                 2869 	.db #0x42	; 66	'B'
   3F07 0F                 2870 	.db #0x0F	; 15
   3F08 02                 2871 	.db #0x02	; 2
   3F09 06                 2872 	.db #0x06	; 6
   3F0A 1D                 2873 	.db #0x1D	; 29
   3F0B 00                 2874 	.db #0x00	; 0
   3F0C 10                 2875 	.db #0x10	; 16
   3F0D 40                 2876 	.db #0x40	; 64
   3F0E 19                 2877 	.db #0x19	; 25
   3F0F 40                 2878 	.db #0x40	; 64
   3F10 00                 2879 	.db #0x00	; 0
   3F11 00                 2880 	.db #0x00	; 0
   3F12 00                 2881 	.db #0x00	; 0
   3F13 00                 2882 	.db #0x00	; 0
   3F14 00                 2883 	.db #0x00	; 0
   3F15 00                 2884 	.db #0x00	; 0
   3F16 0D                 2885 	.db #0x0D	; 13
   3F17 12                 2886 	.db #0x12	; 18
   3F18 40                 2887 	.db #0x40	; 64
   3F19 01                 2888 	.db #0x01	; 1
   3F1A 00                 2889 	.db #0x00	; 0
   3F1B 7C                 2890 	.db #0x7C	; 124
   3F1C 18                 2891 	.db #0x18	; 24
   3F1D 78                 2892 	.db #0x78	; 120	'x'
   3F1E 0C                 2893 	.db #0x0C	; 12
   3F1F 34                 2894 	.db #0x34	; 52	'4'
   3F20 30                 2895 	.db #0x30	; 48	'0'
   3F21 2C                 2896 	.db #0x2C	; 44
   3F22 28                 2897 	.db #0x28	; 40
   3F23 24                 2898 	.db #0x24	; 36
   3F24 20                 2899 	.db #0x20	; 32
   3F25 1C                 2900 	.db #0x1C	; 28
   3F26 0D                 2901 	.db #0x0D	; 13
   3F27 25                 2902 	.db #0x25	; 37
   3F28 40                 2903 	.db #0x40	; 64
   3F29 20                 2904 	.db #0x20	; 32
   3F2A 00                 2905 	.db #0x00	; 0
   3F2B 00                 2906 	.db #0x00	; 0
   3F2C 00                 2907 	.db #0x00	; 0
   3F2D 39                 2908 	.db #0x39	; 57	'9'
   3F2E 40                 2909 	.db #0x40	; 64
   3F2F 00                 2910 	.db #0x00	; 0
   3F30 57                 2911 	.db #0x57	; 87	'W'
   3F31 40                 2912 	.db #0x40	; 64
   3F32 3B                 2913 	.db #0x3B	; 59
   3F33 40                 2914 	.db #0x40	; 64
   3F34 57                 2915 	.db #0x57	; 87	'W'
   3F35 40                 2916 	.db #0x40	; 64
   3F36 01                 2917 	.db #0x01	; 1
   3F37 2F                 2918 	.db #0x2F	; 47
   3F38 40                 2919 	.db #0x40	; 64
   3F39 19                 2920 	.db #0x19	; 25
   3F3A 00                 2921 	.db #0x00	; 0
   3F3B 76                 2922 	.db #0x76	; 118	'v'
   3F3C E1                 2923 	.db #0xE1	; 225
   3F3D 00                 2924 	.db #0x00	; 0
   3F3E 00                 2925 	.db #0x00	; 0
   3F3F 01                 2926 	.db #0x01	; 1
   3F40 04                 2927 	.db #0x04	; 4
   3F41 51                 2928 	.db #0x51	; 81	'Q'
   3F42 04                 2929 	.db #0x04	; 4
   3F43 37                 2930 	.db #0x37	; 55	'7'
   3F44 04                 2931 	.db #0x04	; 4
   3F45 4F                 2932 	.db #0x4F	; 79	'O'
   3F46 04                 2933 	.db #0x04	; 4
   3F47 37                 2934 	.db #0x37	; 55	'7'
   3F48 02                 2935 	.db #0x02	; 2
   3F49 4B                 2936 	.db #0x4B	; 75	'K'
   3F4A 02                 2937 	.db #0x02	; 2
   3F4B 37                 2938 	.db #0x37	; 55	'7'
   3F4C 04                 2939 	.db #0x04	; 4
   3F4D 4F                 2940 	.db #0x4F	; 79	'O'
   3F4E 04                 2941 	.db #0x04	; 4
   3F4F 37                 2942 	.db #0x37	; 55	'7'
   3F50 04                 2943 	.db #0x04	; 4
   3F51 4F                 2944 	.db #0x4F	; 79	'O'
   3F52 04                 2945 	.db #0x04	; 4
   3F53 37                 2946 	.db #0x37	; 55	'7'
   3F54 02                 2947 	.db #0x02	; 2
   3F55 4B                 2948 	.db #0x4B	; 75	'K'
   3F56 00                 2949 	.db #0x00	; 0
   3F57 42                 2950 	.db #0x42	; 66	'B'
   3F58 60                 2951 	.db #0x60	; 96
   3F59 00                 2952 	.db #0x00	; 0
   3F5A 42                 2953 	.db #0x42	; 66	'B'
   3F5B 80                 2954 	.db #0x80	; 128
   3F5C 00                 2955 	.db #0x00	; 0
   3F5D 00                 2956 	.db #0x00	; 0
   3F5E 42                 2957 	.db #0x42	; 66	'B'
   3F5F 00                 2958 	.db #0x00	; 0
   3F60 00                 2959 	.db #0x00	; 0
