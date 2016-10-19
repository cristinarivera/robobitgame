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
                             14 	.globl _inicializarEnemy
                             15 	.globl _inicializarCPC
                             16 	.globl _menuInicio
                             17 	.globl _borrarPantallaArriba
                             18 	.globl _barraPuntuacionInicial
                             19 	.globl _moverCuchillo
                             20 	.globl _checkKnifeCollision
                             21 	.globl _comprobarTeclado
                             22 	.globl _lanzarCuchillo
                             23 	.globl _redibujarCuchillo
                             24 	.globl _borrarCuchillo
                             25 	.globl _dibujarCuchillo
                             26 	.globl _moverAbajo
                             27 	.globl _moverArriba
                             28 	.globl _moverDerecha
                             29 	.globl _moverIzquierda
                             30 	.globl _avanzarMapa
                             31 	.globl _patrolDecision
                             32 	.globl _moverEnemigo
                             33 	.globl _moverEnemigoIzquierda
                             34 	.globl _moverEnemigoDerecha
                             35 	.globl _moverEnemigoAbajo
                             36 	.globl _moverEnemigoArriba
                             37 	.globl _checkEnemyCollision
                             38 	.globl _redibujarEnemigo
                             39 	.globl _borrarEnemigo
                             40 	.globl _borrarExplosion
                             41 	.globl _dibujarExplosion
                             42 	.globl _dibujarEnemigo
                             43 	.globl _checkCollision
                             44 	.globl _getTilePtr
                             45 	.globl _redibujarProta
                             46 	.globl _menuFin
                             47 	.globl _borrarProta
                             48 	.globl _dibujarProta
                             49 	.globl _dibujarMapa
                             50 	.globl _cpct_etm_setTileset2x4
                             51 	.globl _cpct_etm_drawTileBox2x4
                             52 	.globl _cpct_getRandom_mxor_u8
                             53 	.globl _cpct_akp_musicPlay
                             54 	.globl _cpct_akp_musicInit
                             55 	.globl _cpct_getScreenPtr
                             56 	.globl _cpct_setPALColour
                             57 	.globl _cpct_setPalette
                             58 	.globl _cpct_waitVSYNC
                             59 	.globl _cpct_setVideoMode
                             60 	.globl _cpct_drawStringM0
                             61 	.globl _cpct_drawSpriteMaskedAlignedTable
                             62 	.globl _cpct_drawSolidBox
                             63 	.globl _cpct_drawSprite
                             64 	.globl _cpct_isAnyKeyPressed
                             65 	.globl _cpct_isKeyPressed
                             66 	.globl _cpct_scanKeyboard_if
                             67 	.globl _cpct_scanKeyboard_f
                             68 	.globl _cpct_memset
                             69 	.globl _cpct_disableFirmware
                             70 	.globl _num_mapa
                             71 	.globl _mapa
                             72 	.globl _cu
                             73 	.globl _prota
                             74 	.globl _enemy
                             75 	.globl _EEje
                             76 	.globl _EMirar
                             77 	.globl _spawnY
                             78 	.globl _spawnX
                             79 	.globl _mapas
                             80 ;--------------------------------------------------------
                             81 ; special function registers
                             82 ;--------------------------------------------------------
                             83 ;--------------------------------------------------------
                             84 ; ram data
                             85 ;--------------------------------------------------------
                             86 	.area _DATA
   88F2                      87 _EMirar::
   88F2                      88 	.ds 1
   88F3                      89 _EEje::
   88F3                      90 	.ds 1
   88F4                      91 _enemy::
   88F4                      92 	.ds 48
   8924                      93 _prota::
   8924                      94 	.ds 8
   892C                      95 _cu::
   892C                      96 	.ds 10
   8936                      97 _mapa::
   8936                      98 	.ds 2
   8938                      99 _num_mapa::
   8938                     100 	.ds 1
                            101 ;--------------------------------------------------------
                            102 ; ram data
                            103 ;--------------------------------------------------------
                            104 	.area _INITIALIZED
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
                            125 ;src/main.c:120: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
                            126 ;	---------------------------------
                            127 ; Function dummy_cpct_transparentMaskTable0M0_container
                            128 ; ---------------------------------
   7B42                     129 _dummy_cpct_transparentMaskTable0M0_container::
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
                            166 ;src/main.c:123: void dibujarMapa() {
                            167 ;	---------------------------------
                            168 ; Function dibujarMapa
                            169 ; ---------------------------------
   8939                     170 _dibujarMapa::
                            171 ;src/main.c:124: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   8939 2A 36 89      [16]  172 	ld	hl,(_mapa)
   893C E5            [11]  173 	push	hl
   893D 21 F0 C0      [10]  174 	ld	hl,#0xC0F0
   8940 E5            [11]  175 	push	hl
   8941 21 2C 28      [10]  176 	ld	hl,#0x282C
   8944 E5            [11]  177 	push	hl
   8945 2E 00         [ 7]  178 	ld	l, #0x00
   8947 E5            [11]  179 	push	hl
   8948 AF            [ 4]  180 	xor	a, a
   8949 F5            [11]  181 	push	af
   894A 33            [ 6]  182 	inc	sp
   894B CD 44 7D      [17]  183 	call	_cpct_etm_drawTileBox2x4
   894E C9            [10]  184 	ret
   894F                     185 _mapas:
   894F C0 4D               186 	.dw _g_map1
   8951 E0 46               187 	.dw _g_map2
   8953 00 40               188 	.dw _g_map3
   8955                     189 _spawnX:
   8955 00                  190 	.db #0x00	; 0
   8956 28                  191 	.db #0x28	; 40
   8957 47                  192 	.db #0x47	; 71	'G'
   8958 14                  193 	.db #0x14	; 20
   8959 3C                  194 	.db #0x3C	; 60
   895A                     195 _spawnY:
   895A 18                  196 	.db #0x18	; 24
   895B 2C                  197 	.db #0x2C	; 44
   895C 72                  198 	.db #0x72	; 114	'r'
   895D 8A                  199 	.db #0x8A	; 138
   895E 8A                  200 	.db #0x8A	; 138
                            201 ;src/main.c:129: void dibujarProta() {
                            202 ;	---------------------------------
                            203 ; Function dibujarProta
                            204 ; ---------------------------------
   895F                     205 _dibujarProta::
                            206 ;src/main.c:130: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   895F 21 25 89      [10]  207 	ld	hl, #_prota + 1
   8962 56            [ 7]  208 	ld	d,(hl)
   8963 21 24 89      [10]  209 	ld	hl, #_prota + 0
   8966 46            [ 7]  210 	ld	b,(hl)
   8967 D5            [11]  211 	push	de
   8968 33            [ 6]  212 	inc	sp
   8969 C5            [11]  213 	push	bc
   896A 33            [ 6]  214 	inc	sp
   896B 21 00 C0      [10]  215 	ld	hl,#0xC000
   896E E5            [11]  216 	push	hl
   896F CD 70 88      [17]  217 	call	_cpct_getScreenPtr
   8972 EB            [ 4]  218 	ex	de,hl
                            219 ;src/main.c:131: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   8973 ED 4B 28 89   [20]  220 	ld	bc, (#_prota + 4)
   8977 21 00 3E      [10]  221 	ld	hl,#_g_tablatrans
   897A E5            [11]  222 	push	hl
   897B 21 07 16      [10]  223 	ld	hl,#0x1607
   897E E5            [11]  224 	push	hl
   897F D5            [11]  225 	push	de
   8980 C5            [11]  226 	push	bc
   8981 CD 90 88      [17]  227 	call	_cpct_drawSpriteMaskedAlignedTable
   8984 C9            [10]  228 	ret
                            229 ;src/main.c:134: void borrarProta() {
                            230 ;	---------------------------------
                            231 ; Function borrarProta
                            232 ; ---------------------------------
   8985                     233 _borrarProta::
   8985 DD E5         [15]  234 	push	ix
   8987 DD 21 00 00   [14]  235 	ld	ix,#0
   898B DD 39         [15]  236 	add	ix,sp
   898D F5            [11]  237 	push	af
   898E 3B            [ 6]  238 	dec	sp
                            239 ;src/main.c:136: u8 w = 4 + (prota.px & 1);
   898F 21 26 89      [10]  240 	ld	hl, #_prota + 2
   8992 4E            [ 7]  241 	ld	c,(hl)
   8993 79            [ 4]  242 	ld	a,c
   8994 E6 01         [ 7]  243 	and	a, #0x01
   8996 47            [ 4]  244 	ld	b,a
   8997 04            [ 4]  245 	inc	b
   8998 04            [ 4]  246 	inc	b
   8999 04            [ 4]  247 	inc	b
   899A 04            [ 4]  248 	inc	b
                            249 ;src/main.c:139: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   899B 21 27 89      [10]  250 	ld	hl, #_prota + 3
   899E 5E            [ 7]  251 	ld	e,(hl)
   899F CB 4B         [ 8]  252 	bit	1, e
   89A1 28 04         [12]  253 	jr	Z,00103$
   89A3 3E 01         [ 7]  254 	ld	a,#0x01
   89A5 18 02         [12]  255 	jr	00104$
   89A7                     256 00103$:
   89A7 3E 00         [ 7]  257 	ld	a,#0x00
   89A9                     258 00104$:
   89A9 C6 06         [ 7]  259 	add	a, #0x06
   89AB DD 77 FD      [19]  260 	ld	-3 (ix),a
                            261 ;src/main.c:141: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   89AE FD 2A 36 89   [20]  262 	ld	iy,(_mapa)
   89B2 16 00         [ 7]  263 	ld	d,#0x00
   89B4 7B            [ 4]  264 	ld	a,e
   89B5 C6 E8         [ 7]  265 	add	a,#0xE8
   89B7 DD 77 FE      [19]  266 	ld	-2 (ix),a
   89BA 7A            [ 4]  267 	ld	a,d
   89BB CE FF         [ 7]  268 	adc	a,#0xFF
   89BD DD 77 FF      [19]  269 	ld	-1 (ix),a
   89C0 DD 6E FE      [19]  270 	ld	l,-2 (ix)
   89C3 DD 66 FF      [19]  271 	ld	h,-1 (ix)
   89C6 DD CB FF 7E   [20]  272 	bit	7, -1 (ix)
   89CA 28 04         [12]  273 	jr	Z,00105$
   89CC 21 EB FF      [10]  274 	ld	hl,#0xFFEB
   89CF 19            [11]  275 	add	hl,de
   89D0                     276 00105$:
   89D0 CB 2C         [ 8]  277 	sra	h
   89D2 CB 1D         [ 8]  278 	rr	l
   89D4 CB 2C         [ 8]  279 	sra	h
   89D6 CB 1D         [ 8]  280 	rr	l
   89D8 55            [ 4]  281 	ld	d,l
   89D9 CB 39         [ 8]  282 	srl	c
   89DB FD E5         [15]  283 	push	iy
   89DD 21 F0 C0      [10]  284 	ld	hl,#0xC0F0
   89E0 E5            [11]  285 	push	hl
   89E1 3E 28         [ 7]  286 	ld	a,#0x28
   89E3 F5            [11]  287 	push	af
   89E4 33            [ 6]  288 	inc	sp
   89E5 DD 7E FD      [19]  289 	ld	a,-3 (ix)
   89E8 F5            [11]  290 	push	af
   89E9 33            [ 6]  291 	inc	sp
   89EA C5            [11]  292 	push	bc
   89EB 33            [ 6]  293 	inc	sp
   89EC D5            [11]  294 	push	de
   89ED 33            [ 6]  295 	inc	sp
   89EE 79            [ 4]  296 	ld	a,c
   89EF F5            [11]  297 	push	af
   89F0 33            [ 6]  298 	inc	sp
   89F1 CD 44 7D      [17]  299 	call	_cpct_etm_drawTileBox2x4
   89F4 DD F9         [10]  300 	ld	sp, ix
   89F6 DD E1         [14]  301 	pop	ix
   89F8 C9            [10]  302 	ret
                            303 ;src/main.c:144: void menuFin(){
                            304 ;	---------------------------------
                            305 ; Function menuFin
                            306 ; ---------------------------------
   89F9                     307 _menuFin::
                            308 ;src/main.c:147: cpct_clearScreen(0);
   89F9 21 00 40      [10]  309 	ld	hl,#0x4000
   89FC E5            [11]  310 	push	hl
   89FD AF            [ 4]  311 	xor	a, a
   89FE F5            [11]  312 	push	af
   89FF 33            [ 6]  313 	inc	sp
   8A00 26 C0         [ 7]  314 	ld	h, #0xC0
   8A02 E5            [11]  315 	push	hl
   8A03 CD 2A 7F      [17]  316 	call	_cpct_memset
                            317 ;src/main.c:149: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   8A06 21 18 5A      [10]  318 	ld	hl,#0x5A18
   8A09 E5            [11]  319 	push	hl
   8A0A 21 00 C0      [10]  320 	ld	hl,#0xC000
   8A0D E5            [11]  321 	push	hl
   8A0E CD 70 88      [17]  322 	call	_cpct_getScreenPtr
   8A11 4D            [ 4]  323 	ld	c,l
   8A12 44            [ 4]  324 	ld	b,h
                            325 ;src/main.c:150: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   8A13 21 02 00      [10]  326 	ld	hl,#0x0002
   8A16 E5            [11]  327 	push	hl
   8A17 C5            [11]  328 	push	bc
   8A18 21 26 8A      [10]  329 	ld	hl,#___str_0
   8A1B E5            [11]  330 	push	hl
   8A1C CD 7B 7C      [17]  331 	call	_cpct_drawStringM0
   8A1F 21 06 00      [10]  332 	ld	hl,#6
   8A22 39            [11]  333 	add	hl,sp
   8A23 F9            [ 6]  334 	ld	sp,hl
                            335 ;src/main.c:152: while(1){}
   8A24                     336 00102$:
   8A24 18 FE         [12]  337 	jr	00102$
   8A26                     338 ___str_0:
   8A26 47 41 4D 45 20 4F   339 	.ascii "GAME OVER"
        56 45 52
   8A2F 00                  340 	.db 0x00
                            341 ;src/main.c:155: void redibujarProta() {
                            342 ;	---------------------------------
                            343 ; Function redibujarProta
                            344 ; ---------------------------------
   8A30                     345 _redibujarProta::
                            346 ;src/main.c:156: borrarProta();
   8A30 CD 85 89      [17]  347 	call	_borrarProta
                            348 ;src/main.c:157: prota.px = prota.x;
   8A33 01 26 89      [10]  349 	ld	bc,#_prota + 2
   8A36 3A 24 89      [13]  350 	ld	a, (#_prota + 0)
   8A39 02            [ 7]  351 	ld	(bc),a
                            352 ;src/main.c:158: prota.py = prota.y;
   8A3A 01 27 89      [10]  353 	ld	bc,#_prota + 3
   8A3D 3A 25 89      [13]  354 	ld	a, (#_prota + 1)
   8A40 02            [ 7]  355 	ld	(bc),a
                            356 ;src/main.c:159: dibujarProta();
   8A41 C3 5F 89      [10]  357 	jp  _dibujarProta
                            358 ;src/main.c:162: u8* getTilePtr(u8 x, u8 y) {
                            359 ;	---------------------------------
                            360 ; Function getTilePtr
                            361 ; ---------------------------------
   8A44                     362 _getTilePtr::
   8A44 DD E5         [15]  363 	push	ix
   8A46 DD 21 00 00   [14]  364 	ld	ix,#0
   8A4A DD 39         [15]  365 	add	ix,sp
                            366 ;src/main.c:163: return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
   8A4C DD 4E 05      [19]  367 	ld	c,5 (ix)
   8A4F 06 00         [ 7]  368 	ld	b,#0x00
   8A51 79            [ 4]  369 	ld	a,c
   8A52 C6 E8         [ 7]  370 	add	a,#0xE8
   8A54 5F            [ 4]  371 	ld	e,a
   8A55 78            [ 4]  372 	ld	a,b
   8A56 CE FF         [ 7]  373 	adc	a,#0xFF
   8A58 57            [ 4]  374 	ld	d,a
   8A59 6B            [ 4]  375 	ld	l, e
   8A5A 62            [ 4]  376 	ld	h, d
   8A5B CB 7A         [ 8]  377 	bit	7, d
   8A5D 28 04         [12]  378 	jr	Z,00103$
   8A5F 21 EB FF      [10]  379 	ld	hl,#0xFFEB
   8A62 09            [11]  380 	add	hl,bc
   8A63                     381 00103$:
   8A63 CB 2C         [ 8]  382 	sra	h
   8A65 CB 1D         [ 8]  383 	rr	l
   8A67 CB 2C         [ 8]  384 	sra	h
   8A69 CB 1D         [ 8]  385 	rr	l
   8A6B 4D            [ 4]  386 	ld	c, l
   8A6C 44            [ 4]  387 	ld	b, h
   8A6D 29            [11]  388 	add	hl, hl
   8A6E 29            [11]  389 	add	hl, hl
   8A6F 09            [11]  390 	add	hl, bc
   8A70 29            [11]  391 	add	hl, hl
   8A71 29            [11]  392 	add	hl, hl
   8A72 29            [11]  393 	add	hl, hl
   8A73 4D            [ 4]  394 	ld	c,l
   8A74 44            [ 4]  395 	ld	b,h
   8A75 2A 36 89      [16]  396 	ld	hl,(_mapa)
   8A78 09            [11]  397 	add	hl,bc
   8A79 DD 4E 04      [19]  398 	ld	c,4 (ix)
   8A7C CB 39         [ 8]  399 	srl	c
   8A7E 59            [ 4]  400 	ld	e,c
   8A7F 16 00         [ 7]  401 	ld	d,#0x00
   8A81 19            [11]  402 	add	hl,de
   8A82 DD E1         [14]  403 	pop	ix
   8A84 C9            [10]  404 	ret
                            405 ;src/main.c:166: u8 checkCollision(int direction) { // check optimization
                            406 ;	---------------------------------
                            407 ; Function checkCollision
                            408 ; ---------------------------------
   8A85                     409 _checkCollision::
   8A85 DD E5         [15]  410 	push	ix
   8A87 DD 21 00 00   [14]  411 	ld	ix,#0
   8A8B DD 39         [15]  412 	add	ix,sp
   8A8D F5            [11]  413 	push	af
                            414 ;src/main.c:167: u8 *headTile=0, *feetTile=0, *waistTile=0;
   8A8E 21 00 00      [10]  415 	ld	hl,#0x0000
   8A91 E3            [19]  416 	ex	(sp), hl
   8A92 11 00 00      [10]  417 	ld	de,#0x0000
   8A95 01 00 00      [10]  418 	ld	bc,#0x0000
                            419 ;src/main.c:169: switch (direction) {
   8A98 DD CB 05 7E   [20]  420 	bit	7, 5 (ix)
   8A9C C2 B9 8B      [10]  421 	jp	NZ,00105$
   8A9F 3E 03         [ 7]  422 	ld	a,#0x03
   8AA1 DD BE 04      [19]  423 	cp	a, 4 (ix)
   8AA4 3E 00         [ 7]  424 	ld	a,#0x00
   8AA6 DD 9E 05      [19]  425 	sbc	a, 5 (ix)
   8AA9 E2 AE 8A      [10]  426 	jp	PO, 00128$
   8AAC EE 80         [ 7]  427 	xor	a, #0x80
   8AAE                     428 00128$:
   8AAE FA B9 8B      [10]  429 	jp	M,00105$
   8AB1 DD 5E 04      [19]  430 	ld	e,4 (ix)
   8AB4 16 00         [ 7]  431 	ld	d,#0x00
   8AB6 21 BD 8A      [10]  432 	ld	hl,#00129$
   8AB9 19            [11]  433 	add	hl,de
   8ABA 19            [11]  434 	add	hl,de
   8ABB 19            [11]  435 	add	hl,de
   8ABC E9            [ 4]  436 	jp	(hl)
   8ABD                     437 00129$:
   8ABD C3 C9 8A      [10]  438 	jp	00101$
   8AC0 C3 14 8B      [10]  439 	jp	00102$
   8AC3 C3 55 8B      [10]  440 	jp	00103$
   8AC6 C3 88 8B      [10]  441 	jp	00104$
                            442 ;src/main.c:170: case 0:
   8AC9                     443 00101$:
                            444 ;src/main.c:171: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   8AC9 21 25 89      [10]  445 	ld	hl, #(_prota + 0x0001) + 0
   8ACC 5E            [ 7]  446 	ld	e,(hl)
   8ACD 21 24 89      [10]  447 	ld	hl, #_prota + 0
   8AD0 4E            [ 7]  448 	ld	c,(hl)
   8AD1 0C            [ 4]  449 	inc	c
   8AD2 0C            [ 4]  450 	inc	c
   8AD3 0C            [ 4]  451 	inc	c
   8AD4 0C            [ 4]  452 	inc	c
   8AD5 7B            [ 4]  453 	ld	a,e
   8AD6 F5            [11]  454 	push	af
   8AD7 33            [ 6]  455 	inc	sp
   8AD8 79            [ 4]  456 	ld	a,c
   8AD9 F5            [11]  457 	push	af
   8ADA 33            [ 6]  458 	inc	sp
   8ADB CD 44 8A      [17]  459 	call	_getTilePtr
   8ADE F1            [10]  460 	pop	af
   8ADF 33            [ 6]  461 	inc	sp
   8AE0 33            [ 6]  462 	inc	sp
   8AE1 E5            [11]  463 	push	hl
                            464 ;src/main.c:172: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   8AE2 3A 25 89      [13]  465 	ld	a, (#(_prota + 0x0001) + 0)
   8AE5 C6 14         [ 7]  466 	add	a, #0x14
   8AE7 4F            [ 4]  467 	ld	c,a
   8AE8 21 24 89      [10]  468 	ld	hl, #_prota + 0
   8AEB 46            [ 7]  469 	ld	b,(hl)
   8AEC 04            [ 4]  470 	inc	b
   8AED 04            [ 4]  471 	inc	b
   8AEE 04            [ 4]  472 	inc	b
   8AEF 04            [ 4]  473 	inc	b
   8AF0 79            [ 4]  474 	ld	a,c
   8AF1 F5            [11]  475 	push	af
   8AF2 33            [ 6]  476 	inc	sp
   8AF3 C5            [11]  477 	push	bc
   8AF4 33            [ 6]  478 	inc	sp
   8AF5 CD 44 8A      [17]  479 	call	_getTilePtr
   8AF8 F1            [10]  480 	pop	af
   8AF9 EB            [ 4]  481 	ex	de,hl
                            482 ;src/main.c:173: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   8AFA 3A 25 89      [13]  483 	ld	a, (#(_prota + 0x0001) + 0)
   8AFD C6 0B         [ 7]  484 	add	a, #0x0B
   8AFF 47            [ 4]  485 	ld	b,a
   8B00 3A 24 89      [13]  486 	ld	a, (#_prota + 0)
   8B03 C6 04         [ 7]  487 	add	a, #0x04
   8B05 D5            [11]  488 	push	de
   8B06 C5            [11]  489 	push	bc
   8B07 33            [ 6]  490 	inc	sp
   8B08 F5            [11]  491 	push	af
   8B09 33            [ 6]  492 	inc	sp
   8B0A CD 44 8A      [17]  493 	call	_getTilePtr
   8B0D F1            [10]  494 	pop	af
   8B0E 4D            [ 4]  495 	ld	c,l
   8B0F 44            [ 4]  496 	ld	b,h
   8B10 D1            [10]  497 	pop	de
                            498 ;src/main.c:174: break;
   8B11 C3 B9 8B      [10]  499 	jp	00105$
                            500 ;src/main.c:175: case 1:
   8B14                     501 00102$:
                            502 ;src/main.c:176: headTile  = getTilePtr(prota.x - 1, prota.y);
   8B14 21 25 89      [10]  503 	ld	hl, #(_prota + 0x0001) + 0
   8B17 56            [ 7]  504 	ld	d,(hl)
   8B18 21 24 89      [10]  505 	ld	hl, #_prota + 0
   8B1B 46            [ 7]  506 	ld	b,(hl)
   8B1C 05            [ 4]  507 	dec	b
   8B1D D5            [11]  508 	push	de
   8B1E 33            [ 6]  509 	inc	sp
   8B1F C5            [11]  510 	push	bc
   8B20 33            [ 6]  511 	inc	sp
   8B21 CD 44 8A      [17]  512 	call	_getTilePtr
   8B24 F1            [10]  513 	pop	af
   8B25 33            [ 6]  514 	inc	sp
   8B26 33            [ 6]  515 	inc	sp
   8B27 E5            [11]  516 	push	hl
                            517 ;src/main.c:177: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
   8B28 3A 25 89      [13]  518 	ld	a, (#(_prota + 0x0001) + 0)
   8B2B C6 14         [ 7]  519 	add	a, #0x14
   8B2D 57            [ 4]  520 	ld	d,a
   8B2E 21 24 89      [10]  521 	ld	hl, #_prota + 0
   8B31 46            [ 7]  522 	ld	b,(hl)
   8B32 05            [ 4]  523 	dec	b
   8B33 D5            [11]  524 	push	de
   8B34 33            [ 6]  525 	inc	sp
   8B35 C5            [11]  526 	push	bc
   8B36 33            [ 6]  527 	inc	sp
   8B37 CD 44 8A      [17]  528 	call	_getTilePtr
   8B3A F1            [10]  529 	pop	af
   8B3B EB            [ 4]  530 	ex	de,hl
                            531 ;src/main.c:178: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
   8B3C 3A 25 89      [13]  532 	ld	a, (#(_prota + 0x0001) + 0)
   8B3F C6 0B         [ 7]  533 	add	a, #0x0B
   8B41 47            [ 4]  534 	ld	b,a
   8B42 3A 24 89      [13]  535 	ld	a, (#_prota + 0)
   8B45 C6 FF         [ 7]  536 	add	a,#0xFF
   8B47 D5            [11]  537 	push	de
   8B48 C5            [11]  538 	push	bc
   8B49 33            [ 6]  539 	inc	sp
   8B4A F5            [11]  540 	push	af
   8B4B 33            [ 6]  541 	inc	sp
   8B4C CD 44 8A      [17]  542 	call	_getTilePtr
   8B4F F1            [10]  543 	pop	af
   8B50 4D            [ 4]  544 	ld	c,l
   8B51 44            [ 4]  545 	ld	b,h
   8B52 D1            [10]  546 	pop	de
                            547 ;src/main.c:179: break;
   8B53 18 64         [12]  548 	jr	00105$
                            549 ;src/main.c:180: case 2:
   8B55                     550 00103$:
                            551 ;src/main.c:181: headTile   = getTilePtr(prota.x, prota.y - 2);
   8B55 3A 25 89      [13]  552 	ld	a, (#(_prota + 0x0001) + 0)
   8B58 C6 FE         [ 7]  553 	add	a,#0xFE
   8B5A 21 24 89      [10]  554 	ld	hl, #_prota + 0
   8B5D 56            [ 7]  555 	ld	d,(hl)
   8B5E C5            [11]  556 	push	bc
   8B5F F5            [11]  557 	push	af
   8B60 33            [ 6]  558 	inc	sp
   8B61 D5            [11]  559 	push	de
   8B62 33            [ 6]  560 	inc	sp
   8B63 CD 44 8A      [17]  561 	call	_getTilePtr
   8B66 F1            [10]  562 	pop	af
   8B67 C1            [10]  563 	pop	bc
   8B68 33            [ 6]  564 	inc	sp
   8B69 33            [ 6]  565 	inc	sp
   8B6A E5            [11]  566 	push	hl
                            567 ;src/main.c:182: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
   8B6B 21 25 89      [10]  568 	ld	hl, #(_prota + 0x0001) + 0
   8B6E 56            [ 7]  569 	ld	d,(hl)
   8B6F 15            [ 4]  570 	dec	d
   8B70 15            [ 4]  571 	dec	d
   8B71 3A 24 89      [13]  572 	ld	a, (#_prota + 0)
   8B74 C6 03         [ 7]  573 	add	a, #0x03
   8B76 C5            [11]  574 	push	bc
   8B77 D5            [11]  575 	push	de
   8B78 33            [ 6]  576 	inc	sp
   8B79 F5            [11]  577 	push	af
   8B7A 33            [ 6]  578 	inc	sp
   8B7B CD 44 8A      [17]  579 	call	_getTilePtr
   8B7E F1            [10]  580 	pop	af
   8B7F EB            [ 4]  581 	ex	de,hl
   8B80 C1            [10]  582 	pop	bc
                            583 ;src/main.c:183: *waistTile = 0;
   8B81 21 00 00      [10]  584 	ld	hl,#0x0000
   8B84 36 00         [10]  585 	ld	(hl),#0x00
                            586 ;src/main.c:184: break;
   8B86 18 31         [12]  587 	jr	00105$
                            588 ;src/main.c:185: case 3:
   8B88                     589 00104$:
                            590 ;src/main.c:186: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
   8B88 3A 25 89      [13]  591 	ld	a, (#(_prota + 0x0001) + 0)
   8B8B C6 16         [ 7]  592 	add	a, #0x16
   8B8D 21 24 89      [10]  593 	ld	hl, #_prota + 0
   8B90 56            [ 7]  594 	ld	d,(hl)
   8B91 C5            [11]  595 	push	bc
   8B92 F5            [11]  596 	push	af
   8B93 33            [ 6]  597 	inc	sp
   8B94 D5            [11]  598 	push	de
   8B95 33            [ 6]  599 	inc	sp
   8B96 CD 44 8A      [17]  600 	call	_getTilePtr
   8B99 F1            [10]  601 	pop	af
   8B9A C1            [10]  602 	pop	bc
   8B9B 33            [ 6]  603 	inc	sp
   8B9C 33            [ 6]  604 	inc	sp
   8B9D E5            [11]  605 	push	hl
                            606 ;src/main.c:187: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   8B9E 3A 25 89      [13]  607 	ld	a, (#(_prota + 0x0001) + 0)
   8BA1 C6 16         [ 7]  608 	add	a, #0x16
   8BA3 57            [ 4]  609 	ld	d,a
   8BA4 3A 24 89      [13]  610 	ld	a, (#_prota + 0)
   8BA7 C6 03         [ 7]  611 	add	a, #0x03
   8BA9 C5            [11]  612 	push	bc
   8BAA D5            [11]  613 	push	de
   8BAB 33            [ 6]  614 	inc	sp
   8BAC F5            [11]  615 	push	af
   8BAD 33            [ 6]  616 	inc	sp
   8BAE CD 44 8A      [17]  617 	call	_getTilePtr
   8BB1 F1            [10]  618 	pop	af
   8BB2 EB            [ 4]  619 	ex	de,hl
   8BB3 C1            [10]  620 	pop	bc
                            621 ;src/main.c:188: *waistTile = 0;
   8BB4 21 00 00      [10]  622 	ld	hl,#0x0000
   8BB7 36 00         [10]  623 	ld	(hl),#0x00
                            624 ;src/main.c:190: }
   8BB9                     625 00105$:
                            626 ;src/main.c:192: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   8BB9 E1            [10]  627 	pop	hl
   8BBA E5            [11]  628 	push	hl
   8BBB 6E            [ 7]  629 	ld	l,(hl)
   8BBC 3E 02         [ 7]  630 	ld	a,#0x02
   8BBE 95            [ 4]  631 	sub	a, l
   8BBF 38 0E         [12]  632 	jr	C,00106$
   8BC1 1A            [ 7]  633 	ld	a,(de)
   8BC2 5F            [ 4]  634 	ld	e,a
   8BC3 3E 02         [ 7]  635 	ld	a,#0x02
   8BC5 93            [ 4]  636 	sub	a, e
   8BC6 38 07         [12]  637 	jr	C,00106$
   8BC8 0A            [ 7]  638 	ld	a,(bc)
   8BC9 4F            [ 4]  639 	ld	c,a
   8BCA 3E 02         [ 7]  640 	ld	a,#0x02
   8BCC 91            [ 4]  641 	sub	a, c
   8BCD 30 04         [12]  642 	jr	NC,00107$
   8BCF                     643 00106$:
                            644 ;src/main.c:193: return 1;
   8BCF 2E 01         [ 7]  645 	ld	l,#0x01
   8BD1 18 02         [12]  646 	jr	00110$
   8BD3                     647 00107$:
                            648 ;src/main.c:195: return 0;
   8BD3 2E 00         [ 7]  649 	ld	l,#0x00
   8BD5                     650 00110$:
   8BD5 DD F9         [10]  651 	ld	sp, ix
   8BD7 DD E1         [14]  652 	pop	ix
   8BD9 C9            [10]  653 	ret
                            654 ;src/main.c:199: void dibujarEnemigo(TEnemy *enemy) {
                            655 ;	---------------------------------
                            656 ; Function dibujarEnemigo
                            657 ; ---------------------------------
   8BDA                     658 _dibujarEnemigo::
   8BDA DD E5         [15]  659 	push	ix
   8BDC DD 21 00 00   [14]  660 	ld	ix,#0
   8BE0 DD 39         [15]  661 	add	ix,sp
                            662 ;src/main.c:200: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   8BE2 DD 4E 04      [19]  663 	ld	c,4 (ix)
   8BE5 DD 46 05      [19]  664 	ld	b,5 (ix)
   8BE8 69            [ 4]  665 	ld	l, c
   8BE9 60            [ 4]  666 	ld	h, b
   8BEA 23            [ 6]  667 	inc	hl
   8BEB 56            [ 7]  668 	ld	d,(hl)
   8BEC 0A            [ 7]  669 	ld	a,(bc)
   8BED C5            [11]  670 	push	bc
   8BEE D5            [11]  671 	push	de
   8BEF 33            [ 6]  672 	inc	sp
   8BF0 F5            [11]  673 	push	af
   8BF1 33            [ 6]  674 	inc	sp
   8BF2 21 00 C0      [10]  675 	ld	hl,#0xC000
   8BF5 E5            [11]  676 	push	hl
   8BF6 CD 70 88      [17]  677 	call	_cpct_getScreenPtr
   8BF9 EB            [ 4]  678 	ex	de,hl
                            679 ;src/main.c:201: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   8BFA E1            [10]  680 	pop	hl
   8BFB 01 04 00      [10]  681 	ld	bc, #0x0004
   8BFE 09            [11]  682 	add	hl, bc
   8BFF 4E            [ 7]  683 	ld	c,(hl)
   8C00 23            [ 6]  684 	inc	hl
   8C01 46            [ 7]  685 	ld	b,(hl)
   8C02 21 00 3E      [10]  686 	ld	hl,#_g_tablatrans
   8C05 E5            [11]  687 	push	hl
   8C06 21 04 16      [10]  688 	ld	hl,#0x1604
   8C09 E5            [11]  689 	push	hl
   8C0A D5            [11]  690 	push	de
   8C0B C5            [11]  691 	push	bc
   8C0C CD 90 88      [17]  692 	call	_cpct_drawSpriteMaskedAlignedTable
   8C0F DD E1         [14]  693 	pop	ix
   8C11 C9            [10]  694 	ret
                            695 ;src/main.c:204: void dibujarExplosion(TEnemy *enemy) {
                            696 ;	---------------------------------
                            697 ; Function dibujarExplosion
                            698 ; ---------------------------------
   8C12                     699 _dibujarExplosion::
   8C12 DD E5         [15]  700 	push	ix
   8C14 DD 21 00 00   [14]  701 	ld	ix,#0
   8C18 DD 39         [15]  702 	add	ix,sp
                            703 ;src/main.c:205: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   8C1A DD 4E 04      [19]  704 	ld	c,4 (ix)
   8C1D DD 46 05      [19]  705 	ld	b,5 (ix)
   8C20 69            [ 4]  706 	ld	l, c
   8C21 60            [ 4]  707 	ld	h, b
   8C22 23            [ 6]  708 	inc	hl
   8C23 56            [ 7]  709 	ld	d,(hl)
   8C24 0A            [ 7]  710 	ld	a,(bc)
   8C25 47            [ 4]  711 	ld	b,a
   8C26 D5            [11]  712 	push	de
   8C27 33            [ 6]  713 	inc	sp
   8C28 C5            [11]  714 	push	bc
   8C29 33            [ 6]  715 	inc	sp
   8C2A 21 00 C0      [10]  716 	ld	hl,#0xC000
   8C2D E5            [11]  717 	push	hl
   8C2E CD 70 88      [17]  718 	call	_cpct_getScreenPtr
   8C31 4D            [ 4]  719 	ld	c,l
   8C32 44            [ 4]  720 	ld	b,h
                            721 ;src/main.c:206: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   8C33 11 00 3E      [10]  722 	ld	de,#_g_tablatrans+0
   8C36 D5            [11]  723 	push	de
   8C37 21 04 16      [10]  724 	ld	hl,#0x1604
   8C3A E5            [11]  725 	push	hl
   8C3B C5            [11]  726 	push	bc
   8C3C 21 A8 55      [10]  727 	ld	hl,#_g_explosion
   8C3F E5            [11]  728 	push	hl
   8C40 CD 90 88      [17]  729 	call	_cpct_drawSpriteMaskedAlignedTable
   8C43 DD E1         [14]  730 	pop	ix
   8C45 C9            [10]  731 	ret
                            732 ;src/main.c:209: void borrarExplosion() {
                            733 ;	---------------------------------
                            734 ; Function borrarExplosion
                            735 ; ---------------------------------
   8C46                     736 _borrarExplosion::
   8C46 DD E5         [15]  737 	push	ix
   8C48 DD 21 00 00   [14]  738 	ld	ix,#0
   8C4C DD 39         [15]  739 	add	ix,sp
   8C4E F5            [11]  740 	push	af
   8C4F 3B            [ 6]  741 	dec	sp
                            742 ;src/main.c:210: u8 w = 4 + (enemy->px & 1);
   8C50 21 F6 88      [10]  743 	ld	hl, #_enemy + 2
   8C53 4E            [ 7]  744 	ld	c,(hl)
   8C54 79            [ 4]  745 	ld	a,c
   8C55 E6 01         [ 7]  746 	and	a, #0x01
   8C57 47            [ 4]  747 	ld	b,a
   8C58 04            [ 4]  748 	inc	b
   8C59 04            [ 4]  749 	inc	b
   8C5A 04            [ 4]  750 	inc	b
   8C5B 04            [ 4]  751 	inc	b
                            752 ;src/main.c:213: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   8C5C 21 F7 88      [10]  753 	ld	hl, #_enemy + 3
   8C5F 5E            [ 7]  754 	ld	e,(hl)
   8C60 CB 4B         [ 8]  755 	bit	1, e
   8C62 28 04         [12]  756 	jr	Z,00103$
   8C64 3E 01         [ 7]  757 	ld	a,#0x01
   8C66 18 02         [12]  758 	jr	00104$
   8C68                     759 00103$:
   8C68 3E 00         [ 7]  760 	ld	a,#0x00
   8C6A                     761 00104$:
   8C6A C6 07         [ 7]  762 	add	a, #0x07
   8C6C DD 77 FD      [19]  763 	ld	-3 (ix),a
                            764 ;src/main.c:215: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   8C6F FD 2A 36 89   [20]  765 	ld	iy,(_mapa)
   8C73 16 00         [ 7]  766 	ld	d,#0x00
   8C75 7B            [ 4]  767 	ld	a,e
   8C76 C6 E8         [ 7]  768 	add	a,#0xE8
   8C78 DD 77 FE      [19]  769 	ld	-2 (ix),a
   8C7B 7A            [ 4]  770 	ld	a,d
   8C7C CE FF         [ 7]  771 	adc	a,#0xFF
   8C7E DD 77 FF      [19]  772 	ld	-1 (ix),a
   8C81 DD 6E FE      [19]  773 	ld	l,-2 (ix)
   8C84 DD 66 FF      [19]  774 	ld	h,-1 (ix)
   8C87 DD CB FF 7E   [20]  775 	bit	7, -1 (ix)
   8C8B 28 04         [12]  776 	jr	Z,00105$
   8C8D 21 EB FF      [10]  777 	ld	hl,#0xFFEB
   8C90 19            [11]  778 	add	hl,de
   8C91                     779 00105$:
   8C91 CB 2C         [ 8]  780 	sra	h
   8C93 CB 1D         [ 8]  781 	rr	l
   8C95 CB 2C         [ 8]  782 	sra	h
   8C97 CB 1D         [ 8]  783 	rr	l
   8C99 55            [ 4]  784 	ld	d,l
   8C9A CB 39         [ 8]  785 	srl	c
   8C9C FD E5         [15]  786 	push	iy
   8C9E 21 F0 C0      [10]  787 	ld	hl,#0xC0F0
   8CA1 E5            [11]  788 	push	hl
   8CA2 3E 28         [ 7]  789 	ld	a,#0x28
   8CA4 F5            [11]  790 	push	af
   8CA5 33            [ 6]  791 	inc	sp
   8CA6 DD 7E FD      [19]  792 	ld	a,-3 (ix)
   8CA9 F5            [11]  793 	push	af
   8CAA 33            [ 6]  794 	inc	sp
   8CAB C5            [11]  795 	push	bc
   8CAC 33            [ 6]  796 	inc	sp
   8CAD D5            [11]  797 	push	de
   8CAE 33            [ 6]  798 	inc	sp
   8CAF 79            [ 4]  799 	ld	a,c
   8CB0 F5            [11]  800 	push	af
   8CB1 33            [ 6]  801 	inc	sp
   8CB2 CD 44 7D      [17]  802 	call	_cpct_etm_drawTileBox2x4
   8CB5 DD F9         [10]  803 	ld	sp, ix
   8CB7 DD E1         [14]  804 	pop	ix
   8CB9 C9            [10]  805 	ret
                            806 ;src/main.c:219: void borrarEnemigo(TEnemy *enemy) {
                            807 ;	---------------------------------
                            808 ; Function borrarEnemigo
                            809 ; ---------------------------------
   8CBA                     810 _borrarEnemigo::
   8CBA DD E5         [15]  811 	push	ix
   8CBC DD 21 00 00   [14]  812 	ld	ix,#0
   8CC0 DD 39         [15]  813 	add	ix,sp
   8CC2 21 FA FF      [10]  814 	ld	hl,#-6
   8CC5 39            [11]  815 	add	hl,sp
   8CC6 F9            [ 6]  816 	ld	sp,hl
                            817 ;src/main.c:221: u8 w = 4 + (enemy->px & 1);
   8CC7 DD 4E 04      [19]  818 	ld	c,4 (ix)
   8CCA DD 46 05      [19]  819 	ld	b,5 (ix)
   8CCD 69            [ 4]  820 	ld	l, c
   8CCE 60            [ 4]  821 	ld	h, b
   8CCF 23            [ 6]  822 	inc	hl
   8CD0 23            [ 6]  823 	inc	hl
   8CD1 5E            [ 7]  824 	ld	e,(hl)
   8CD2 7B            [ 4]  825 	ld	a,e
   8CD3 E6 01         [ 7]  826 	and	a, #0x01
   8CD5 C6 04         [ 7]  827 	add	a, #0x04
   8CD7 DD 77 FA      [19]  828 	ld	-6 (ix),a
                            829 ;src/main.c:224: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   8CDA 69            [ 4]  830 	ld	l, c
   8CDB 60            [ 4]  831 	ld	h, b
   8CDC 23            [ 6]  832 	inc	hl
   8CDD 23            [ 6]  833 	inc	hl
   8CDE 23            [ 6]  834 	inc	hl
   8CDF 56            [ 7]  835 	ld	d,(hl)
   8CE0 CB 4A         [ 8]  836 	bit	1, d
   8CE2 28 04         [12]  837 	jr	Z,00103$
   8CE4 3E 01         [ 7]  838 	ld	a,#0x01
   8CE6 18 02         [12]  839 	jr	00104$
   8CE8                     840 00103$:
   8CE8 3E 00         [ 7]  841 	ld	a,#0x00
   8CEA                     842 00104$:
   8CEA C6 07         [ 7]  843 	add	a, #0x07
   8CEC DD 77 FB      [19]  844 	ld	-5 (ix),a
                            845 ;src/main.c:226: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   8CEF FD 2A 36 89   [20]  846 	ld	iy,(_mapa)
   8CF3 DD 72 FE      [19]  847 	ld	-2 (ix),d
   8CF6 DD 36 FF 00   [19]  848 	ld	-1 (ix),#0x00
   8CFA DD 7E FE      [19]  849 	ld	a,-2 (ix)
   8CFD C6 E8         [ 7]  850 	add	a,#0xE8
   8CFF DD 77 FC      [19]  851 	ld	-4 (ix),a
   8D02 DD 7E FF      [19]  852 	ld	a,-1 (ix)
   8D05 CE FF         [ 7]  853 	adc	a,#0xFF
   8D07 DD 77 FD      [19]  854 	ld	-3 (ix),a
   8D0A DD 56 FC      [19]  855 	ld	d,-4 (ix)
   8D0D DD 6E FD      [19]  856 	ld	l,-3 (ix)
   8D10 DD CB FD 7E   [20]  857 	bit	7, -3 (ix)
   8D14 28 0C         [12]  858 	jr	Z,00105$
   8D16 DD 7E FE      [19]  859 	ld	a,-2 (ix)
   8D19 C6 EB         [ 7]  860 	add	a, #0xEB
   8D1B 57            [ 4]  861 	ld	d,a
   8D1C DD 7E FF      [19]  862 	ld	a,-1 (ix)
   8D1F CE FF         [ 7]  863 	adc	a, #0xFF
   8D21 6F            [ 4]  864 	ld	l,a
   8D22                     865 00105$:
   8D22 CB 2D         [ 8]  866 	sra	l
   8D24 CB 1A         [ 8]  867 	rr	d
   8D26 CB 2D         [ 8]  868 	sra	l
   8D28 CB 1A         [ 8]  869 	rr	d
   8D2A CB 3B         [ 8]  870 	srl	e
   8D2C C5            [11]  871 	push	bc
   8D2D FD E5         [15]  872 	push	iy
   8D2F 21 F0 C0      [10]  873 	ld	hl,#0xC0F0
   8D32 E5            [11]  874 	push	hl
   8D33 3E 28         [ 7]  875 	ld	a,#0x28
   8D35 F5            [11]  876 	push	af
   8D36 33            [ 6]  877 	inc	sp
   8D37 DD 66 FB      [19]  878 	ld	h,-5 (ix)
   8D3A DD 6E FA      [19]  879 	ld	l,-6 (ix)
   8D3D E5            [11]  880 	push	hl
   8D3E D5            [11]  881 	push	de
   8D3F CD 44 7D      [17]  882 	call	_cpct_etm_drawTileBox2x4
   8D42 C1            [10]  883 	pop	bc
                            884 ;src/main.c:228: enemy->mover = NO;
   8D43 21 06 00      [10]  885 	ld	hl,#0x0006
   8D46 09            [11]  886 	add	hl,bc
   8D47 36 00         [10]  887 	ld	(hl),#0x00
   8D49 DD F9         [10]  888 	ld	sp, ix
   8D4B DD E1         [14]  889 	pop	ix
   8D4D C9            [10]  890 	ret
                            891 ;src/main.c:231: void redibujarEnemigo(TEnemy *enemy) {
                            892 ;	---------------------------------
                            893 ; Function redibujarEnemigo
                            894 ; ---------------------------------
   8D4E                     895 _redibujarEnemigo::
   8D4E DD E5         [15]  896 	push	ix
   8D50 DD 21 00 00   [14]  897 	ld	ix,#0
   8D54 DD 39         [15]  898 	add	ix,sp
                            899 ;src/main.c:232: borrarEnemigo(enemy);
   8D56 DD 6E 04      [19]  900 	ld	l,4 (ix)
   8D59 DD 66 05      [19]  901 	ld	h,5 (ix)
   8D5C E5            [11]  902 	push	hl
   8D5D CD BA 8C      [17]  903 	call	_borrarEnemigo
   8D60 F1            [10]  904 	pop	af
                            905 ;src/main.c:233: enemy->px = enemy->x;
   8D61 DD 4E 04      [19]  906 	ld	c,4 (ix)
   8D64 DD 46 05      [19]  907 	ld	b,5 (ix)
   8D67 59            [ 4]  908 	ld	e, c
   8D68 50            [ 4]  909 	ld	d, b
   8D69 13            [ 6]  910 	inc	de
   8D6A 13            [ 6]  911 	inc	de
   8D6B 0A            [ 7]  912 	ld	a,(bc)
   8D6C 12            [ 7]  913 	ld	(de),a
                            914 ;src/main.c:234: enemy->py = enemy->y;
   8D6D 59            [ 4]  915 	ld	e, c
   8D6E 50            [ 4]  916 	ld	d, b
   8D6F 13            [ 6]  917 	inc	de
   8D70 13            [ 6]  918 	inc	de
   8D71 13            [ 6]  919 	inc	de
   8D72 69            [ 4]  920 	ld	l, c
   8D73 60            [ 4]  921 	ld	h, b
   8D74 23            [ 6]  922 	inc	hl
   8D75 7E            [ 7]  923 	ld	a,(hl)
   8D76 12            [ 7]  924 	ld	(de),a
                            925 ;src/main.c:235: dibujarEnemigo(enemy);
   8D77 C5            [11]  926 	push	bc
   8D78 CD DA 8B      [17]  927 	call	_dibujarEnemigo
   8D7B F1            [10]  928 	pop	af
   8D7C DD E1         [14]  929 	pop	ix
   8D7E C9            [10]  930 	ret
                            931 ;src/main.c:238: u8 checkEnemyCollision(int direction, TEnemy *enemy){
                            932 ;	---------------------------------
                            933 ; Function checkEnemyCollision
                            934 ; ---------------------------------
   8D7F                     935 _checkEnemyCollision::
   8D7F DD E5         [15]  936 	push	ix
   8D81 DD 21 00 00   [14]  937 	ld	ix,#0
   8D85 DD 39         [15]  938 	add	ix,sp
   8D87 21 F7 FF      [10]  939 	ld	hl,#-9
   8D8A 39            [11]  940 	add	hl,sp
   8D8B F9            [ 6]  941 	ld	sp,hl
                            942 ;src/main.c:240: u8 colisiona = 1;
   8D8C DD 36 F7 01   [19]  943 	ld	-9 (ix),#0x01
                            944 ;src/main.c:242: switch (direction) {
   8D90 DD CB 05 7E   [20]  945 	bit	7, 5 (ix)
   8D94 C2 47 91      [10]  946 	jp	NZ,00165$
   8D97 3E 03         [ 7]  947 	ld	a,#0x03
   8D99 DD BE 04      [19]  948 	cp	a, 4 (ix)
   8D9C 3E 00         [ 7]  949 	ld	a,#0x00
   8D9E DD 9E 05      [19]  950 	sbc	a, 5 (ix)
   8DA1 E2 A6 8D      [10]  951 	jp	PO, 00272$
   8DA4 EE 80         [ 7]  952 	xor	a, #0x80
   8DA6                     953 00272$:
   8DA6 FA 47 91      [10]  954 	jp	M,00165$
                            955 ;src/main.c:244: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   8DA9 DD 4E 06      [19]  956 	ld	c,6 (ix)
   8DAC DD 46 07      [19]  957 	ld	b,7 (ix)
   8DAF 0A            [ 7]  958 	ld	a,(bc)
   8DB0 5F            [ 4]  959 	ld	e,a
   8DB1 21 01 00      [10]  960 	ld	hl,#0x0001
   8DB4 09            [11]  961 	add	hl,bc
   8DB5 DD 75 F8      [19]  962 	ld	-8 (ix),l
   8DB8 DD 74 F9      [19]  963 	ld	-7 (ix),h
   8DBB DD 6E F8      [19]  964 	ld	l,-8 (ix)
   8DBE DD 66 F9      [19]  965 	ld	h,-7 (ix)
   8DC1 56            [ 7]  966 	ld	d,(hl)
                            967 ;src/main.c:257: enemy->muerto = SI;
   8DC2 21 08 00      [10]  968 	ld	hl,#0x0008
   8DC5 09            [11]  969 	add	hl,bc
   8DC6 DD 75 FA      [19]  970 	ld	-6 (ix),l
   8DC9 DD 74 FB      [19]  971 	ld	-5 (ix),h
                            972 ;src/main.c:264: enemy->mira = M_izquierda;
   8DCC 21 07 00      [10]  973 	ld	hl,#0x0007
   8DCF 09            [11]  974 	add	hl,bc
   8DD0 DD 75 FC      [19]  975 	ld	-4 (ix),l
   8DD3 DD 74 FD      [19]  976 	ld	-3 (ix),h
                            977 ;src/main.c:242: switch (direction) {
   8DD6 D5            [11]  978 	push	de
   8DD7 DD 5E 04      [19]  979 	ld	e,4 (ix)
   8DDA 16 00         [ 7]  980 	ld	d,#0x00
   8DDC 21 E4 8D      [10]  981 	ld	hl,#00273$
   8DDF 19            [11]  982 	add	hl,de
   8DE0 19            [11]  983 	add	hl,de
   8DE1 19            [11]  984 	add	hl,de
   8DE2 D1            [10]  985 	pop	de
   8DE3 E9            [ 4]  986 	jp	(hl)
   8DE4                     987 00273$:
   8DE4 C3 F0 8D      [10]  988 	jp	00101$
   8DE7 C3 C9 8E      [10]  989 	jp	00117$
   8DEA C3 9E 8F      [10]  990 	jp	00133$
   8DED C3 6D 90      [10]  991 	jp	00149$
                            992 ;src/main.c:243: case 0:
   8DF0                     993 00101$:
                            994 ;src/main.c:244: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   8DF0 7B            [ 4]  995 	ld	a,e
   8DF1 C6 05         [ 7]  996 	add	a, #0x05
   8DF3 C5            [11]  997 	push	bc
   8DF4 D5            [11]  998 	push	de
   8DF5 33            [ 6]  999 	inc	sp
   8DF6 F5            [11] 1000 	push	af
   8DF7 33            [ 6] 1001 	inc	sp
   8DF8 CD 44 8A      [17] 1002 	call	_getTilePtr
   8DFB F1            [10] 1003 	pop	af
   8DFC C1            [10] 1004 	pop	bc
   8DFD 5E            [ 7] 1005 	ld	e,(hl)
   8DFE 3E 02         [ 7] 1006 	ld	a,#0x02
   8E00 93            [ 4] 1007 	sub	a, e
   8E01 DA BE 8E      [10] 1008 	jp	C,00113$
                           1009 ;src/main.c:245: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   8E04 DD 6E F8      [19] 1010 	ld	l,-8 (ix)
   8E07 DD 66 F9      [19] 1011 	ld	h,-7 (ix)
   8E0A 7E            [ 7] 1012 	ld	a,(hl)
   8E0B C6 0B         [ 7] 1013 	add	a, #0x0B
   8E0D 57            [ 4] 1014 	ld	d,a
   8E0E 0A            [ 7] 1015 	ld	a,(bc)
   8E0F C6 05         [ 7] 1016 	add	a, #0x05
   8E11 C5            [11] 1017 	push	bc
   8E12 D5            [11] 1018 	push	de
   8E13 33            [ 6] 1019 	inc	sp
   8E14 F5            [11] 1020 	push	af
   8E15 33            [ 6] 1021 	inc	sp
   8E16 CD 44 8A      [17] 1022 	call	_getTilePtr
   8E19 F1            [10] 1023 	pop	af
   8E1A C1            [10] 1024 	pop	bc
   8E1B 5E            [ 7] 1025 	ld	e,(hl)
   8E1C 3E 02         [ 7] 1026 	ld	a,#0x02
   8E1E 93            [ 4] 1027 	sub	a, e
   8E1F DA BE 8E      [10] 1028 	jp	C,00113$
                           1029 ;src/main.c:246: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   8E22 DD 6E F8      [19] 1030 	ld	l,-8 (ix)
   8E25 DD 66 F9      [19] 1031 	ld	h,-7 (ix)
   8E28 7E            [ 7] 1032 	ld	a,(hl)
   8E29 C6 16         [ 7] 1033 	add	a, #0x16
   8E2B 57            [ 4] 1034 	ld	d,a
   8E2C 0A            [ 7] 1035 	ld	a,(bc)
   8E2D C6 05         [ 7] 1036 	add	a, #0x05
   8E2F C5            [11] 1037 	push	bc
   8E30 D5            [11] 1038 	push	de
   8E31 33            [ 6] 1039 	inc	sp
   8E32 F5            [11] 1040 	push	af
   8E33 33            [ 6] 1041 	inc	sp
   8E34 CD 44 8A      [17] 1042 	call	_getTilePtr
   8E37 F1            [10] 1043 	pop	af
   8E38 C1            [10] 1044 	pop	bc
   8E39 5E            [ 7] 1045 	ld	e,(hl)
   8E3A 3E 02         [ 7] 1046 	ld	a,#0x02
   8E3C 93            [ 4] 1047 	sub	a, e
   8E3D DA BE 8E      [10] 1048 	jp	C,00113$
                           1049 ;src/main.c:248: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   8E40 21 2D 89      [10] 1050 	ld	hl, #_cu + 1
   8E43 5E            [ 7] 1051 	ld	e,(hl)
   8E44 16 00         [ 7] 1052 	ld	d,#0x00
   8E46 21 04 00      [10] 1053 	ld	hl,#0x0004
   8E49 19            [11] 1054 	add	hl,de
   8E4A DD 75 FE      [19] 1055 	ld	-2 (ix),l
   8E4D DD 74 FF      [19] 1056 	ld	-1 (ix),h
   8E50 DD 6E F8      [19] 1057 	ld	l,-8 (ix)
   8E53 DD 66 F9      [19] 1058 	ld	h,-7 (ix)
   8E56 6E            [ 7] 1059 	ld	l,(hl)
   8E57 26 00         [ 7] 1060 	ld	h,#0x00
   8E59 DD 7E FE      [19] 1061 	ld	a,-2 (ix)
   8E5C 95            [ 4] 1062 	sub	a, l
   8E5D DD 7E FF      [19] 1063 	ld	a,-1 (ix)
   8E60 9C            [ 4] 1064 	sbc	a, h
   8E61 E2 66 8E      [10] 1065 	jp	PO, 00274$
   8E64 EE 80         [ 7] 1066 	xor	a, #0x80
   8E66                    1067 00274$:
   8E66 FA 7B 8E      [10] 1068 	jp	M,00108$
   8E69 D5            [11] 1069 	push	de
   8E6A 11 16 00      [10] 1070 	ld	de,#0x0016
   8E6D 19            [11] 1071 	add	hl, de
   8E6E D1            [10] 1072 	pop	de
   8E6F 7D            [ 4] 1073 	ld	a,l
   8E70 93            [ 4] 1074 	sub	a, e
   8E71 7C            [ 4] 1075 	ld	a,h
   8E72 9A            [ 4] 1076 	sbc	a, d
   8E73 E2 78 8E      [10] 1077 	jp	PO, 00275$
   8E76 EE 80         [ 7] 1078 	xor	a, #0x80
   8E78                    1079 00275$:
   8E78 F2 82 8E      [10] 1080 	jp	P,00109$
   8E7B                    1081 00108$:
                           1082 ;src/main.c:249: colisiona = 0;
   8E7B DD 36 F7 00   [19] 1083 	ld	-9 (ix),#0x00
   8E7F C3 47 91      [10] 1084 	jp	00165$
   8E82                    1085 00109$:
                           1086 ;src/main.c:252: if(cu.x > enemy->x){ //si el cu esta abajo
   8E82 21 2C 89      [10] 1087 	ld	hl, #_cu + 0
   8E85 5E            [ 7] 1088 	ld	e,(hl)
   8E86 0A            [ 7] 1089 	ld	a,(bc)
   8E87 4F            [ 4] 1090 	ld	c,a
   8E88 93            [ 4] 1091 	sub	a, e
   8E89 30 2C         [12] 1092 	jr	NC,00106$
                           1093 ;src/main.c:253: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
   8E8B 6B            [ 4] 1094 	ld	l,e
   8E8C 26 00         [ 7] 1095 	ld	h,#0x00
   8E8E 06 00         [ 7] 1096 	ld	b,#0x00
   8E90 03            [ 6] 1097 	inc	bc
   8E91 03            [ 6] 1098 	inc	bc
   8E92 03            [ 6] 1099 	inc	bc
   8E93 03            [ 6] 1100 	inc	bc
   8E94 BF            [ 4] 1101 	cp	a, a
   8E95 ED 42         [15] 1102 	sbc	hl, bc
   8E97 3E 01         [ 7] 1103 	ld	a,#0x01
   8E99 BD            [ 4] 1104 	cp	a, l
   8E9A 3E 00         [ 7] 1105 	ld	a,#0x00
   8E9C 9C            [ 4] 1106 	sbc	a, h
   8E9D E2 A2 8E      [10] 1107 	jp	PO, 00276$
   8EA0 EE 80         [ 7] 1108 	xor	a, #0x80
   8EA2                    1109 00276$:
   8EA2 F2 AC 8E      [10] 1110 	jp	P,00103$
                           1111 ;src/main.c:254: colisiona = 0;
   8EA5 DD 36 F7 00   [19] 1112 	ld	-9 (ix),#0x00
   8EA9 C3 47 91      [10] 1113 	jp	00165$
   8EAC                    1114 00103$:
                           1115 ;src/main.c:257: enemy->muerto = SI;
   8EAC DD 6E FA      [19] 1116 	ld	l,-6 (ix)
   8EAF DD 66 FB      [19] 1117 	ld	h,-5 (ix)
   8EB2 36 01         [10] 1118 	ld	(hl),#0x01
   8EB4 C3 47 91      [10] 1119 	jp	00165$
   8EB7                    1120 00106$:
                           1121 ;src/main.c:260: colisiona = 0;
   8EB7 DD 36 F7 00   [19] 1122 	ld	-9 (ix),#0x00
   8EBB C3 47 91      [10] 1123 	jp	00165$
   8EBE                    1124 00113$:
                           1125 ;src/main.c:264: enemy->mira = M_izquierda;
   8EBE DD 6E FC      [19] 1126 	ld	l,-4 (ix)
   8EC1 DD 66 FD      [19] 1127 	ld	h,-3 (ix)
   8EC4 36 01         [10] 1128 	ld	(hl),#0x01
                           1129 ;src/main.c:266: break;
   8EC6 C3 47 91      [10] 1130 	jp	00165$
                           1131 ;src/main.c:267: case 1:
   8EC9                    1132 00117$:
                           1133 ;src/main.c:268: if( *getTilePtr(enemy->x - 1, enemy->y) <= 2
   8EC9 1D            [ 4] 1134 	dec	e
   8ECA C5            [11] 1135 	push	bc
   8ECB D5            [11] 1136 	push	de
   8ECC CD 44 8A      [17] 1137 	call	_getTilePtr
   8ECF F1            [10] 1138 	pop	af
   8ED0 C1            [10] 1139 	pop	bc
   8ED1 5E            [ 7] 1140 	ld	e,(hl)
   8ED2 3E 02         [ 7] 1141 	ld	a,#0x02
   8ED4 93            [ 4] 1142 	sub	a, e
   8ED5 DA 93 8F      [10] 1143 	jp	C,00129$
                           1144 ;src/main.c:269: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   8ED8 DD 6E F8      [19] 1145 	ld	l,-8 (ix)
   8EDB DD 66 F9      [19] 1146 	ld	h,-7 (ix)
   8EDE 7E            [ 7] 1147 	ld	a,(hl)
   8EDF C6 0B         [ 7] 1148 	add	a, #0x0B
   8EE1 57            [ 4] 1149 	ld	d,a
   8EE2 0A            [ 7] 1150 	ld	a,(bc)
   8EE3 C6 FF         [ 7] 1151 	add	a,#0xFF
   8EE5 C5            [11] 1152 	push	bc
   8EE6 D5            [11] 1153 	push	de
   8EE7 33            [ 6] 1154 	inc	sp
   8EE8 F5            [11] 1155 	push	af
   8EE9 33            [ 6] 1156 	inc	sp
   8EEA CD 44 8A      [17] 1157 	call	_getTilePtr
   8EED F1            [10] 1158 	pop	af
   8EEE C1            [10] 1159 	pop	bc
   8EEF 5E            [ 7] 1160 	ld	e,(hl)
   8EF0 3E 02         [ 7] 1161 	ld	a,#0x02
   8EF2 93            [ 4] 1162 	sub	a, e
   8EF3 DA 93 8F      [10] 1163 	jp	C,00129$
                           1164 ;src/main.c:270: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   8EF6 DD 6E F8      [19] 1165 	ld	l,-8 (ix)
   8EF9 DD 66 F9      [19] 1166 	ld	h,-7 (ix)
   8EFC 7E            [ 7] 1167 	ld	a,(hl)
   8EFD C6 16         [ 7] 1168 	add	a, #0x16
   8EFF 57            [ 4] 1169 	ld	d,a
   8F00 0A            [ 7] 1170 	ld	a,(bc)
   8F01 C6 FF         [ 7] 1171 	add	a,#0xFF
   8F03 C5            [11] 1172 	push	bc
   8F04 D5            [11] 1173 	push	de
   8F05 33            [ 6] 1174 	inc	sp
   8F06 F5            [11] 1175 	push	af
   8F07 33            [ 6] 1176 	inc	sp
   8F08 CD 44 8A      [17] 1177 	call	_getTilePtr
   8F0B F1            [10] 1178 	pop	af
   8F0C C1            [10] 1179 	pop	bc
   8F0D 5E            [ 7] 1180 	ld	e,(hl)
   8F0E 3E 02         [ 7] 1181 	ld	a,#0x02
   8F10 93            [ 4] 1182 	sub	a, e
   8F11 DA 93 8F      [10] 1183 	jp	C,00129$
                           1184 ;src/main.c:272: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   8F14 21 2D 89      [10] 1185 	ld	hl, #_cu + 1
   8F17 5E            [ 7] 1186 	ld	e,(hl)
   8F18 16 00         [ 7] 1187 	ld	d,#0x00
   8F1A 21 04 00      [10] 1188 	ld	hl,#0x0004
   8F1D 19            [11] 1189 	add	hl,de
   8F1E DD 75 FE      [19] 1190 	ld	-2 (ix),l
   8F21 DD 74 FF      [19] 1191 	ld	-1 (ix),h
   8F24 DD 6E F8      [19] 1192 	ld	l,-8 (ix)
   8F27 DD 66 F9      [19] 1193 	ld	h,-7 (ix)
   8F2A 6E            [ 7] 1194 	ld	l,(hl)
   8F2B 26 00         [ 7] 1195 	ld	h,#0x00
   8F2D DD 7E FE      [19] 1196 	ld	a,-2 (ix)
   8F30 95            [ 4] 1197 	sub	a, l
   8F31 DD 7E FF      [19] 1198 	ld	a,-1 (ix)
   8F34 9C            [ 4] 1199 	sbc	a, h
   8F35 E2 3A 8F      [10] 1200 	jp	PO, 00277$
   8F38 EE 80         [ 7] 1201 	xor	a, #0x80
   8F3A                    1202 00277$:
   8F3A FA 4F 8F      [10] 1203 	jp	M,00124$
   8F3D D5            [11] 1204 	push	de
   8F3E 11 16 00      [10] 1205 	ld	de,#0x0016
   8F41 19            [11] 1206 	add	hl, de
   8F42 D1            [10] 1207 	pop	de
   8F43 7D            [ 4] 1208 	ld	a,l
   8F44 93            [ 4] 1209 	sub	a, e
   8F45 7C            [ 4] 1210 	ld	a,h
   8F46 9A            [ 4] 1211 	sbc	a, d
   8F47 E2 4C 8F      [10] 1212 	jp	PO, 00278$
   8F4A EE 80         [ 7] 1213 	xor	a, #0x80
   8F4C                    1214 00278$:
   8F4C F2 56 8F      [10] 1215 	jp	P,00125$
   8F4F                    1216 00124$:
                           1217 ;src/main.c:273: colisiona = 0;
   8F4F DD 36 F7 00   [19] 1218 	ld	-9 (ix),#0x00
   8F53 C3 47 91      [10] 1219 	jp	00165$
   8F56                    1220 00125$:
                           1221 ;src/main.c:276: if(enemy->x > cu.x){ //si el cu esta abajo
   8F56 0A            [ 7] 1222 	ld	a,(bc)
   8F57 5F            [ 4] 1223 	ld	e,a
   8F58 21 2C 89      [10] 1224 	ld	hl, #_cu + 0
   8F5B 4E            [ 7] 1225 	ld	c,(hl)
   8F5C 79            [ 4] 1226 	ld	a,c
   8F5D 93            [ 4] 1227 	sub	a, e
   8F5E 30 2C         [12] 1228 	jr	NC,00122$
                           1229 ;src/main.c:277: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
   8F60 6B            [ 4] 1230 	ld	l,e
   8F61 26 00         [ 7] 1231 	ld	h,#0x00
   8F63 06 00         [ 7] 1232 	ld	b,#0x00
   8F65 03            [ 6] 1233 	inc	bc
   8F66 03            [ 6] 1234 	inc	bc
   8F67 03            [ 6] 1235 	inc	bc
   8F68 03            [ 6] 1236 	inc	bc
   8F69 BF            [ 4] 1237 	cp	a, a
   8F6A ED 42         [15] 1238 	sbc	hl, bc
   8F6C 3E 01         [ 7] 1239 	ld	a,#0x01
   8F6E BD            [ 4] 1240 	cp	a, l
   8F6F 3E 00         [ 7] 1241 	ld	a,#0x00
   8F71 9C            [ 4] 1242 	sbc	a, h
   8F72 E2 77 8F      [10] 1243 	jp	PO, 00279$
   8F75 EE 80         [ 7] 1244 	xor	a, #0x80
   8F77                    1245 00279$:
   8F77 F2 81 8F      [10] 1246 	jp	P,00119$
                           1247 ;src/main.c:278: colisiona = 0;
   8F7A DD 36 F7 00   [19] 1248 	ld	-9 (ix),#0x00
   8F7E C3 47 91      [10] 1249 	jp	00165$
   8F81                    1250 00119$:
                           1251 ;src/main.c:281: enemy->muerto = SI;
   8F81 DD 6E FA      [19] 1252 	ld	l,-6 (ix)
   8F84 DD 66 FB      [19] 1253 	ld	h,-5 (ix)
   8F87 36 01         [10] 1254 	ld	(hl),#0x01
   8F89 C3 47 91      [10] 1255 	jp	00165$
   8F8C                    1256 00122$:
                           1257 ;src/main.c:284: colisiona = 0;
   8F8C DD 36 F7 00   [19] 1258 	ld	-9 (ix),#0x00
   8F90 C3 47 91      [10] 1259 	jp	00165$
   8F93                    1260 00129$:
                           1261 ;src/main.c:288: enemy->mira = M_derecha;
   8F93 DD 6E FC      [19] 1262 	ld	l,-4 (ix)
   8F96 DD 66 FD      [19] 1263 	ld	h,-3 (ix)
   8F99 36 00         [10] 1264 	ld	(hl),#0x00
                           1265 ;src/main.c:290: break;
   8F9B C3 47 91      [10] 1266 	jp	00165$
                           1267 ;src/main.c:291: case 2:
   8F9E                    1268 00133$:
                           1269 ;src/main.c:292: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   8F9E 15            [ 4] 1270 	dec	d
   8F9F 15            [ 4] 1271 	dec	d
   8FA0 C5            [11] 1272 	push	bc
   8FA1 D5            [11] 1273 	push	de
   8FA2 CD 44 8A      [17] 1274 	call	_getTilePtr
   8FA5 F1            [10] 1275 	pop	af
   8FA6 C1            [10] 1276 	pop	bc
   8FA7 5E            [ 7] 1277 	ld	e,(hl)
   8FA8 3E 02         [ 7] 1278 	ld	a,#0x02
   8FAA 93            [ 4] 1279 	sub	a, e
   8FAB DA 65 90      [10] 1280 	jp	C,00145$
                           1281 ;src/main.c:293: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   8FAE DD 6E F8      [19] 1282 	ld	l,-8 (ix)
   8FB1 DD 66 F9      [19] 1283 	ld	h,-7 (ix)
   8FB4 56            [ 7] 1284 	ld	d,(hl)
   8FB5 15            [ 4] 1285 	dec	d
   8FB6 15            [ 4] 1286 	dec	d
   8FB7 0A            [ 7] 1287 	ld	a,(bc)
   8FB8 C6 02         [ 7] 1288 	add	a, #0x02
   8FBA C5            [11] 1289 	push	bc
   8FBB D5            [11] 1290 	push	de
   8FBC 33            [ 6] 1291 	inc	sp
   8FBD F5            [11] 1292 	push	af
   8FBE 33            [ 6] 1293 	inc	sp
   8FBF CD 44 8A      [17] 1294 	call	_getTilePtr
   8FC2 F1            [10] 1295 	pop	af
   8FC3 C1            [10] 1296 	pop	bc
   8FC4 5E            [ 7] 1297 	ld	e,(hl)
   8FC5 3E 02         [ 7] 1298 	ld	a,#0x02
   8FC7 93            [ 4] 1299 	sub	a, e
   8FC8 DA 65 90      [10] 1300 	jp	C,00145$
                           1301 ;src/main.c:294: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   8FCB DD 6E F8      [19] 1302 	ld	l,-8 (ix)
   8FCE DD 66 F9      [19] 1303 	ld	h,-7 (ix)
   8FD1 56            [ 7] 1304 	ld	d,(hl)
   8FD2 15            [ 4] 1305 	dec	d
   8FD3 15            [ 4] 1306 	dec	d
   8FD4 0A            [ 7] 1307 	ld	a,(bc)
   8FD5 C6 04         [ 7] 1308 	add	a, #0x04
   8FD7 C5            [11] 1309 	push	bc
   8FD8 D5            [11] 1310 	push	de
   8FD9 33            [ 6] 1311 	inc	sp
   8FDA F5            [11] 1312 	push	af
   8FDB 33            [ 6] 1313 	inc	sp
   8FDC CD 44 8A      [17] 1314 	call	_getTilePtr
   8FDF F1            [10] 1315 	pop	af
   8FE0 C1            [10] 1316 	pop	bc
   8FE1 5E            [ 7] 1317 	ld	e,(hl)
   8FE2 3E 02         [ 7] 1318 	ld	a,#0x02
   8FE4 93            [ 4] 1319 	sub	a, e
   8FE5 DA 65 90      [10] 1320 	jp	C,00145$
                           1321 ;src/main.c:296: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   8FE8 21 2C 89      [10] 1322 	ld	hl, #_cu + 0
   8FEB 5E            [ 7] 1323 	ld	e,(hl)
   8FEC 16 00         [ 7] 1324 	ld	d,#0x00
   8FEE 21 02 00      [10] 1325 	ld	hl,#0x0002
   8FF1 19            [11] 1326 	add	hl,de
   8FF2 DD 75 FE      [19] 1327 	ld	-2 (ix),l
   8FF5 DD 74 FF      [19] 1328 	ld	-1 (ix),h
   8FF8 0A            [ 7] 1329 	ld	a,(bc)
   8FF9 6F            [ 4] 1330 	ld	l,a
   8FFA 26 00         [ 7] 1331 	ld	h,#0x00
   8FFC DD 7E FE      [19] 1332 	ld	a,-2 (ix)
   8FFF 95            [ 4] 1333 	sub	a, l
   9000 DD 7E FF      [19] 1334 	ld	a,-1 (ix)
   9003 9C            [ 4] 1335 	sbc	a, h
   9004 E2 09 90      [10] 1336 	jp	PO, 00280$
   9007 EE 80         [ 7] 1337 	xor	a, #0x80
   9009                    1338 00280$:
   9009 FA 1C 90      [10] 1339 	jp	M,00140$
   900C 23            [ 6] 1340 	inc	hl
   900D 23            [ 6] 1341 	inc	hl
   900E 23            [ 6] 1342 	inc	hl
   900F 23            [ 6] 1343 	inc	hl
   9010 7D            [ 4] 1344 	ld	a,l
   9011 93            [ 4] 1345 	sub	a, e
   9012 7C            [ 4] 1346 	ld	a,h
   9013 9A            [ 4] 1347 	sbc	a, d
   9014 E2 19 90      [10] 1348 	jp	PO, 00281$
   9017 EE 80         [ 7] 1349 	xor	a, #0x80
   9019                    1350 00281$:
   9019 F2 22 90      [10] 1351 	jp	P,00141$
   901C                    1352 00140$:
                           1353 ;src/main.c:298: colisiona = 0;
   901C DD 36 F7 00   [19] 1354 	ld	-9 (ix),#0x00
   9020 18 4B         [12] 1355 	jr	00149$
   9022                    1356 00141$:
                           1357 ;src/main.c:301: if(enemy->y>cu.y){
   9022 DD 6E F8      [19] 1358 	ld	l,-8 (ix)
   9025 DD 66 F9      [19] 1359 	ld	h,-7 (ix)
   9028 5E            [ 7] 1360 	ld	e,(hl)
   9029 21 2D 89      [10] 1361 	ld	hl, #(_cu + 0x0001) + 0
   902C 6E            [ 7] 1362 	ld	l,(hl)
   902D 7D            [ 4] 1363 	ld	a,l
   902E 93            [ 4] 1364 	sub	a, e
   902F 30 2E         [12] 1365 	jr	NC,00138$
                           1366 ;src/main.c:302: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   9031 16 00         [ 7] 1367 	ld	d,#0x00
   9033 26 00         [ 7] 1368 	ld	h,#0x00
   9035 D5            [11] 1369 	push	de
   9036 11 08 00      [10] 1370 	ld	de,#0x0008
   9039 19            [11] 1371 	add	hl, de
   903A D1            [10] 1372 	pop	de
   903B 7B            [ 4] 1373 	ld	a,e
   903C 95            [ 4] 1374 	sub	a, l
   903D 5F            [ 4] 1375 	ld	e,a
   903E 7A            [ 4] 1376 	ld	a,d
   903F 9C            [ 4] 1377 	sbc	a, h
   9040 57            [ 4] 1378 	ld	d,a
   9041 3E 02         [ 7] 1379 	ld	a,#0x02
   9043 BB            [ 4] 1380 	cp	a, e
   9044 3E 00         [ 7] 1381 	ld	a,#0x00
   9046 9A            [ 4] 1382 	sbc	a, d
   9047 E2 4C 90      [10] 1383 	jp	PO, 00282$
   904A EE 80         [ 7] 1384 	xor	a, #0x80
   904C                    1385 00282$:
   904C F2 55 90      [10] 1386 	jp	P,00135$
                           1387 ;src/main.c:303: colisiona = 0;
   904F DD 36 F7 00   [19] 1388 	ld	-9 (ix),#0x00
   9053 18 18         [12] 1389 	jr	00149$
   9055                    1390 00135$:
                           1391 ;src/main.c:306: enemy->muerto = SI;
   9055 DD 6E FA      [19] 1392 	ld	l,-6 (ix)
   9058 DD 66 FB      [19] 1393 	ld	h,-5 (ix)
   905B 36 01         [10] 1394 	ld	(hl),#0x01
   905D 18 0E         [12] 1395 	jr	00149$
   905F                    1396 00138$:
                           1397 ;src/main.c:310: colisiona = 0;
   905F DD 36 F7 00   [19] 1398 	ld	-9 (ix),#0x00
   9063 18 08         [12] 1399 	jr	00149$
   9065                    1400 00145$:
                           1401 ;src/main.c:316: enemy->mira = M_abajo;
   9065 DD 6E FC      [19] 1402 	ld	l,-4 (ix)
   9068 DD 66 FD      [19] 1403 	ld	h,-3 (ix)
   906B 36 03         [10] 1404 	ld	(hl),#0x03
                           1405 ;src/main.c:319: case 3:
   906D                    1406 00149$:
                           1407 ;src/main.c:322: if( *getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   906D DD 6E F8      [19] 1408 	ld	l,-8 (ix)
   9070 DD 66 F9      [19] 1409 	ld	h,-7 (ix)
   9073 7E            [ 7] 1410 	ld	a,(hl)
   9074 C6 18         [ 7] 1411 	add	a, #0x18
   9076 57            [ 4] 1412 	ld	d,a
   9077 0A            [ 7] 1413 	ld	a,(bc)
   9078 C5            [11] 1414 	push	bc
   9079 D5            [11] 1415 	push	de
   907A 33            [ 6] 1416 	inc	sp
   907B F5            [11] 1417 	push	af
   907C 33            [ 6] 1418 	inc	sp
   907D CD 44 8A      [17] 1419 	call	_getTilePtr
   9080 F1            [10] 1420 	pop	af
   9081 C1            [10] 1421 	pop	bc
   9082 5E            [ 7] 1422 	ld	e,(hl)
   9083 3E 02         [ 7] 1423 	ld	a,#0x02
   9085 93            [ 4] 1424 	sub	a, e
   9086 DA 3F 91      [10] 1425 	jp	C,00161$
                           1426 ;src/main.c:323: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   9089 DD 6E F8      [19] 1427 	ld	l,-8 (ix)
   908C DD 66 F9      [19] 1428 	ld	h,-7 (ix)
   908F 7E            [ 7] 1429 	ld	a,(hl)
   9090 C6 18         [ 7] 1430 	add	a, #0x18
   9092 57            [ 4] 1431 	ld	d,a
   9093 0A            [ 7] 1432 	ld	a,(bc)
   9094 C6 02         [ 7] 1433 	add	a, #0x02
   9096 C5            [11] 1434 	push	bc
   9097 D5            [11] 1435 	push	de
   9098 33            [ 6] 1436 	inc	sp
   9099 F5            [11] 1437 	push	af
   909A 33            [ 6] 1438 	inc	sp
   909B CD 44 8A      [17] 1439 	call	_getTilePtr
   909E F1            [10] 1440 	pop	af
   909F C1            [10] 1441 	pop	bc
   90A0 5E            [ 7] 1442 	ld	e,(hl)
   90A1 3E 02         [ 7] 1443 	ld	a,#0x02
   90A3 93            [ 4] 1444 	sub	a, e
   90A4 DA 3F 91      [10] 1445 	jp	C,00161$
                           1446 ;src/main.c:324: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   90A7 DD 6E F8      [19] 1447 	ld	l,-8 (ix)
   90AA DD 66 F9      [19] 1448 	ld	h,-7 (ix)
   90AD 7E            [ 7] 1449 	ld	a,(hl)
   90AE C6 18         [ 7] 1450 	add	a, #0x18
   90B0 57            [ 4] 1451 	ld	d,a
   90B1 0A            [ 7] 1452 	ld	a,(bc)
   90B2 C6 04         [ 7] 1453 	add	a, #0x04
   90B4 C5            [11] 1454 	push	bc
   90B5 D5            [11] 1455 	push	de
   90B6 33            [ 6] 1456 	inc	sp
   90B7 F5            [11] 1457 	push	af
   90B8 33            [ 6] 1458 	inc	sp
   90B9 CD 44 8A      [17] 1459 	call	_getTilePtr
   90BC F1            [10] 1460 	pop	af
   90BD C1            [10] 1461 	pop	bc
   90BE 5E            [ 7] 1462 	ld	e,(hl)
   90BF 3E 02         [ 7] 1463 	ld	a,#0x02
   90C1 93            [ 4] 1464 	sub	a, e
   90C2 38 7B         [12] 1465 	jr	C,00161$
                           1466 ;src/main.c:326: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   90C4 21 2C 89      [10] 1467 	ld	hl, #_cu + 0
   90C7 5E            [ 7] 1468 	ld	e,(hl)
   90C8 16 00         [ 7] 1469 	ld	d,#0x00
   90CA 21 02 00      [10] 1470 	ld	hl,#0x0002
   90CD 19            [11] 1471 	add	hl,de
   90CE DD 75 FE      [19] 1472 	ld	-2 (ix),l
   90D1 DD 74 FF      [19] 1473 	ld	-1 (ix),h
   90D4 0A            [ 7] 1474 	ld	a,(bc)
   90D5 4F            [ 4] 1475 	ld	c,a
   90D6 06 00         [ 7] 1476 	ld	b,#0x00
   90D8 DD 7E FE      [19] 1477 	ld	a,-2 (ix)
   90DB 91            [ 4] 1478 	sub	a, c
   90DC DD 7E FF      [19] 1479 	ld	a,-1 (ix)
   90DF 98            [ 4] 1480 	sbc	a, b
   90E0 E2 E5 90      [10] 1481 	jp	PO, 00283$
   90E3 EE 80         [ 7] 1482 	xor	a, #0x80
   90E5                    1483 00283$:
   90E5 FA F8 90      [10] 1484 	jp	M,00156$
   90E8 03            [ 6] 1485 	inc	bc
   90E9 03            [ 6] 1486 	inc	bc
   90EA 03            [ 6] 1487 	inc	bc
   90EB 03            [ 6] 1488 	inc	bc
   90EC 79            [ 4] 1489 	ld	a,c
   90ED 93            [ 4] 1490 	sub	a, e
   90EE 78            [ 4] 1491 	ld	a,b
   90EF 9A            [ 4] 1492 	sbc	a, d
   90F0 E2 F5 90      [10] 1493 	jp	PO, 00284$
   90F3 EE 80         [ 7] 1494 	xor	a, #0x80
   90F5                    1495 00284$:
   90F5 F2 FE 90      [10] 1496 	jp	P,00157$
   90F8                    1497 00156$:
                           1498 ;src/main.c:327: colisiona = 0;
   90F8 DD 36 F7 00   [19] 1499 	ld	-9 (ix),#0x00
   90FC 18 49         [12] 1500 	jr	00165$
   90FE                    1501 00157$:
                           1502 ;src/main.c:330: if(cu.y > enemy->y){ //si el cu esta abajo
   90FE 21 2D 89      [10] 1503 	ld	hl, #(_cu + 0x0001) + 0
   9101 4E            [ 7] 1504 	ld	c,(hl)
   9102 DD 6E F8      [19] 1505 	ld	l,-8 (ix)
   9105 DD 66 F9      [19] 1506 	ld	h,-7 (ix)
   9108 5E            [ 7] 1507 	ld	e,(hl)
   9109 7B            [ 4] 1508 	ld	a,e
   910A 91            [ 4] 1509 	sub	a, c
   910B 30 2C         [12] 1510 	jr	NC,00154$
                           1511 ;src/main.c:331: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   910D 06 00         [ 7] 1512 	ld	b,#0x00
   910F 16 00         [ 7] 1513 	ld	d,#0x00
   9111 21 16 00      [10] 1514 	ld	hl,#0x0016
   9114 19            [11] 1515 	add	hl,de
   9115 79            [ 4] 1516 	ld	a,c
   9116 95            [ 4] 1517 	sub	a, l
   9117 4F            [ 4] 1518 	ld	c,a
   9118 78            [ 4] 1519 	ld	a,b
   9119 9C            [ 4] 1520 	sbc	a, h
   911A 47            [ 4] 1521 	ld	b,a
   911B 3E 02         [ 7] 1522 	ld	a,#0x02
   911D B9            [ 4] 1523 	cp	a, c
   911E 3E 00         [ 7] 1524 	ld	a,#0x00
   9120 98            [ 4] 1525 	sbc	a, b
   9121 E2 26 91      [10] 1526 	jp	PO, 00285$
   9124 EE 80         [ 7] 1527 	xor	a, #0x80
   9126                    1528 00285$:
   9126 F2 2F 91      [10] 1529 	jp	P,00151$
                           1530 ;src/main.c:332: colisiona = 0;
   9129 DD 36 F7 00   [19] 1531 	ld	-9 (ix),#0x00
   912D 18 18         [12] 1532 	jr	00165$
   912F                    1533 00151$:
                           1534 ;src/main.c:335: enemy->muerto = SI;
   912F DD 6E FA      [19] 1535 	ld	l,-6 (ix)
   9132 DD 66 FB      [19] 1536 	ld	h,-5 (ix)
   9135 36 01         [10] 1537 	ld	(hl),#0x01
   9137 18 0E         [12] 1538 	jr	00165$
   9139                    1539 00154$:
                           1540 ;src/main.c:339: colisiona = 0;
   9139 DD 36 F7 00   [19] 1541 	ld	-9 (ix),#0x00
   913D 18 08         [12] 1542 	jr	00165$
   913F                    1543 00161$:
                           1544 ;src/main.c:343: enemy->mira = M_arriba;
   913F DD 6E FC      [19] 1545 	ld	l,-4 (ix)
   9142 DD 66 FD      [19] 1546 	ld	h,-3 (ix)
   9145 36 02         [10] 1547 	ld	(hl),#0x02
                           1548 ;src/main.c:346: }
   9147                    1549 00165$:
                           1550 ;src/main.c:347: return colisiona;
   9147 DD 6E F7      [19] 1551 	ld	l,-9 (ix)
   914A DD F9         [10] 1552 	ld	sp, ix
   914C DD E1         [14] 1553 	pop	ix
   914E C9            [10] 1554 	ret
                           1555 ;src/main.c:350: void moverEnemigoArriba(TEnemy *enemy){
                           1556 ;	---------------------------------
                           1557 ; Function moverEnemigoArriba
                           1558 ; ---------------------------------
   914F                    1559 _moverEnemigoArriba::
   914F DD E5         [15] 1560 	push	ix
   9151 DD 21 00 00   [14] 1561 	ld	ix,#0
   9155 DD 39         [15] 1562 	add	ix,sp
                           1563 ;src/main.c:351: enemy->y--;
   9157 DD 4E 04      [19] 1564 	ld	c,4 (ix)
   915A DD 46 05      [19] 1565 	ld	b,5 (ix)
   915D 69            [ 4] 1566 	ld	l, c
   915E 60            [ 4] 1567 	ld	h, b
   915F 23            [ 6] 1568 	inc	hl
   9160 5E            [ 7] 1569 	ld	e,(hl)
   9161 1D            [ 4] 1570 	dec	e
   9162 73            [ 7] 1571 	ld	(hl),e
                           1572 ;src/main.c:352: enemy->y--;
   9163 1D            [ 4] 1573 	dec	e
   9164 73            [ 7] 1574 	ld	(hl),e
                           1575 ;src/main.c:353: enemy->mover = SI;
   9165 21 06 00      [10] 1576 	ld	hl,#0x0006
   9168 09            [11] 1577 	add	hl,bc
   9169 36 01         [10] 1578 	ld	(hl),#0x01
   916B DD E1         [14] 1579 	pop	ix
   916D C9            [10] 1580 	ret
                           1581 ;src/main.c:356: void moverEnemigoAbajo(TEnemy *enemy){
                           1582 ;	---------------------------------
                           1583 ; Function moverEnemigoAbajo
                           1584 ; ---------------------------------
   916E                    1585 _moverEnemigoAbajo::
   916E DD E5         [15] 1586 	push	ix
   9170 DD 21 00 00   [14] 1587 	ld	ix,#0
   9174 DD 39         [15] 1588 	add	ix,sp
                           1589 ;src/main.c:357: enemy->y++;
   9176 DD 4E 04      [19] 1590 	ld	c,4 (ix)
   9179 DD 46 05      [19] 1591 	ld	b,5 (ix)
   917C 59            [ 4] 1592 	ld	e, c
   917D 50            [ 4] 1593 	ld	d, b
   917E 13            [ 6] 1594 	inc	de
   917F 1A            [ 7] 1595 	ld	a,(de)
   9180 3C            [ 4] 1596 	inc	a
   9181 12            [ 7] 1597 	ld	(de),a
                           1598 ;src/main.c:358: enemy->y++;
   9182 3C            [ 4] 1599 	inc	a
   9183 12            [ 7] 1600 	ld	(de),a
                           1601 ;src/main.c:359: enemy->mover = SI;
   9184 21 06 00      [10] 1602 	ld	hl,#0x0006
   9187 09            [11] 1603 	add	hl,bc
   9188 36 01         [10] 1604 	ld	(hl),#0x01
   918A DD E1         [14] 1605 	pop	ix
   918C C9            [10] 1606 	ret
                           1607 ;src/main.c:362: void moverEnemigoDerecha(TEnemy *enemy){
                           1608 ;	---------------------------------
                           1609 ; Function moverEnemigoDerecha
                           1610 ; ---------------------------------
   918D                    1611 _moverEnemigoDerecha::
                           1612 ;src/main.c:363: enemy->x++;
   918D D1            [10] 1613 	pop	de
   918E C1            [10] 1614 	pop	bc
   918F C5            [11] 1615 	push	bc
   9190 D5            [11] 1616 	push	de
   9191 0A            [ 7] 1617 	ld	a,(bc)
   9192 3C            [ 4] 1618 	inc	a
   9193 02            [ 7] 1619 	ld	(bc),a
                           1620 ;src/main.c:364: enemy->mover = SI;
   9194 21 06 00      [10] 1621 	ld	hl,#0x0006
   9197 09            [11] 1622 	add	hl,bc
   9198 36 01         [10] 1623 	ld	(hl),#0x01
   919A C9            [10] 1624 	ret
                           1625 ;src/main.c:367: void moverEnemigoIzquierda(TEnemy *enemy){
                           1626 ;	---------------------------------
                           1627 ; Function moverEnemigoIzquierda
                           1628 ; ---------------------------------
   919B                    1629 _moverEnemigoIzquierda::
                           1630 ;src/main.c:368: enemy->x--;
   919B D1            [10] 1631 	pop	de
   919C C1            [10] 1632 	pop	bc
   919D C5            [11] 1633 	push	bc
   919E D5            [11] 1634 	push	de
   919F 0A            [ 7] 1635 	ld	a,(bc)
   91A0 C6 FF         [ 7] 1636 	add	a,#0xFF
   91A2 02            [ 7] 1637 	ld	(bc),a
                           1638 ;src/main.c:369: enemy->mover = SI;
   91A3 21 06 00      [10] 1639 	ld	hl,#0x0006
   91A6 09            [11] 1640 	add	hl,bc
   91A7 36 01         [10] 1641 	ld	(hl),#0x01
   91A9 C9            [10] 1642 	ret
                           1643 ;src/main.c:372: void moverEnemigo(TEnemy *enemy){
                           1644 ;	---------------------------------
                           1645 ; Function moverEnemigo
                           1646 ; ---------------------------------
   91AA                    1647 _moverEnemigo::
   91AA DD E5         [15] 1648 	push	ix
   91AC DD 21 00 00   [14] 1649 	ld	ix,#0
   91B0 DD 39         [15] 1650 	add	ix,sp
                           1651 ;src/main.c:373: if(!enemy->muerto){
   91B2 DD 4E 04      [19] 1652 	ld	c,4 (ix)
   91B5 DD 46 05      [19] 1653 	ld	b,5 (ix)
   91B8 C5            [11] 1654 	push	bc
   91B9 FD E1         [14] 1655 	pop	iy
   91BB FD 7E 08      [19] 1656 	ld	a,8 (iy)
   91BE B7            [ 4] 1657 	or	a, a
   91BF 20 46         [12] 1658 	jr	NZ,00110$
                           1659 ;src/main.c:374: if(!checkEnemyCollision(enemy->mira, enemy)){
   91C1 21 07 00      [10] 1660 	ld	hl,#0x0007
   91C4 09            [11] 1661 	add	hl,bc
   91C5 5E            [ 7] 1662 	ld	e,(hl)
   91C6 16 00         [ 7] 1663 	ld	d,#0x00
   91C8 E5            [11] 1664 	push	hl
   91C9 C5            [11] 1665 	push	bc
   91CA C5            [11] 1666 	push	bc
   91CB D5            [11] 1667 	push	de
   91CC CD 7F 8D      [17] 1668 	call	_checkEnemyCollision
   91CF F1            [10] 1669 	pop	af
   91D0 F1            [10] 1670 	pop	af
   91D1 7D            [ 4] 1671 	ld	a,l
   91D2 C1            [10] 1672 	pop	bc
   91D3 E1            [10] 1673 	pop	hl
   91D4 B7            [ 4] 1674 	or	a, a
   91D5 20 30         [12] 1675 	jr	NZ,00110$
                           1676 ;src/main.c:376: switch (enemy->mira) {
   91D7 5E            [ 7] 1677 	ld	e,(hl)
   91D8 3E 03         [ 7] 1678 	ld	a,#0x03
   91DA 93            [ 4] 1679 	sub	a, e
   91DB 38 2A         [12] 1680 	jr	C,00110$
   91DD 16 00         [ 7] 1681 	ld	d,#0x00
   91DF 21 E5 91      [10] 1682 	ld	hl,#00124$
   91E2 19            [11] 1683 	add	hl,de
   91E3 19            [11] 1684 	add	hl,de
                           1685 ;src/main.c:378: case 0:
   91E4 E9            [ 4] 1686 	jp	(hl)
   91E5                    1687 00124$:
   91E5 18 06         [12] 1688 	jr	00101$
   91E7 18 0B         [12] 1689 	jr	00102$
   91E9 18 10         [12] 1690 	jr	00103$
   91EB 18 15         [12] 1691 	jr	00104$
   91ED                    1692 00101$:
                           1693 ;src/main.c:379: moverEnemigoDerecha(enemy);
   91ED C5            [11] 1694 	push	bc
   91EE CD 8D 91      [17] 1695 	call	_moverEnemigoDerecha
   91F1 F1            [10] 1696 	pop	af
                           1697 ;src/main.c:380: break;
   91F2 18 13         [12] 1698 	jr	00110$
                           1699 ;src/main.c:381: case 1:
   91F4                    1700 00102$:
                           1701 ;src/main.c:382: moverEnemigoIzquierda(enemy);
   91F4 C5            [11] 1702 	push	bc
   91F5 CD 9B 91      [17] 1703 	call	_moverEnemigoIzquierda
   91F8 F1            [10] 1704 	pop	af
                           1705 ;src/main.c:383: break;
   91F9 18 0C         [12] 1706 	jr	00110$
                           1707 ;src/main.c:384: case 2:
   91FB                    1708 00103$:
                           1709 ;src/main.c:385: moverEnemigoArriba(enemy);
   91FB C5            [11] 1710 	push	bc
   91FC CD 4F 91      [17] 1711 	call	_moverEnemigoArriba
   91FF F1            [10] 1712 	pop	af
                           1713 ;src/main.c:386: break;
   9200 18 05         [12] 1714 	jr	00110$
                           1715 ;src/main.c:387: case 3:
   9202                    1716 00104$:
                           1717 ;src/main.c:388: moverEnemigoAbajo(enemy);
   9202 C5            [11] 1718 	push	bc
   9203 CD 6E 91      [17] 1719 	call	_moverEnemigoAbajo
   9206 F1            [10] 1720 	pop	af
                           1721 ;src/main.c:390: }
   9207                    1722 00110$:
   9207 DD E1         [14] 1723 	pop	ix
   9209 C9            [10] 1724 	ret
                           1725 ;src/main.c:396: void patrolDecision(TEnemy *enemy) { // o devuelve direccion o le pasamos un enemigo y lo mueve
                           1726 ;	---------------------------------
                           1727 ; Function patrolDecision
                           1728 ; ---------------------------------
   920A                    1729 _patrolDecision::
                           1730 ;src/main.c:397: u8 decision = cpct_getRandom_mxor_u8() % 4;
   920A CD 71 87      [17] 1731 	call	_cpct_getRandom_mxor_u8
   920D 7D            [ 4] 1732 	ld	a,l
   920E E6 03         [ 7] 1733 	and	a, #0x03
   9210 5F            [ 4] 1734 	ld	e,a
                           1735 ;src/main.c:399: switch (decision) {
   9211 3E 03         [ 7] 1736 	ld	a,#0x03
   9213 93            [ 4] 1737 	sub	a, e
   9214 D8            [11] 1738 	ret	C
   9215 16 00         [ 7] 1739 	ld	d,#0x00
   9217 21 1D 92      [10] 1740 	ld	hl,#00112$
   921A 19            [11] 1741 	add	hl,de
   921B 19            [11] 1742 	add	hl,de
                           1743 ;src/main.c:400: case 0:
   921C E9            [ 4] 1744 	jp	(hl)
   921D                    1745 00112$:
   921D 18 06         [12] 1746 	jr	00101$
   921F 18 0D         [12] 1747 	jr	00106$
   9221 18 0B         [12] 1748 	jr	00106$
   9223 18 09         [12] 1749 	jr	00104$
   9225                    1750 00101$:
                           1751 ;src/main.c:401: moverEnemigoAbajo(enemy);
   9225 C1            [10] 1752 	pop	bc
   9226 E1            [10] 1753 	pop	hl
   9227 E5            [11] 1754 	push	hl
   9228 C5            [11] 1755 	push	bc
   9229 E5            [11] 1756 	push	hl
   922A CD 6E 91      [17] 1757 	call	_moverEnemigoAbajo
   922D F1            [10] 1758 	pop	af
                           1759 ;src/main.c:402: break;
                           1760 ;src/main.c:403: case 1:
                           1761 ;src/main.c:404: break;
                           1762 ;src/main.c:405: case 2:
                           1763 ;src/main.c:406: break;
                           1764 ;src/main.c:407: case 3:
                           1765 ;src/main.c:409: }
   922E                    1766 00104$:
   922E                    1767 00106$:
   922E C9            [10] 1768 	ret
                           1769 ;src/main.c:412: void avanzarMapa() {
                           1770 ;	---------------------------------
                           1771 ; Function avanzarMapa
                           1772 ; ---------------------------------
   922F                    1773 _avanzarMapa::
                           1774 ;src/main.c:413: if(num_mapa < NUM_MAPAS -1) {
   922F 3A 38 89      [13] 1775 	ld	a,(#_num_mapa + 0)
   9232 D6 02         [ 7] 1776 	sub	a, #0x02
   9234 D2 F9 89      [10] 1777 	jp	NC,_menuFin
                           1778 ;src/main.c:414: mapa = mapas[++num_mapa];
   9237 21 38 89      [10] 1779 	ld	hl, #_num_mapa+0
   923A 34            [11] 1780 	inc	(hl)
   923B FD 21 38 89   [14] 1781 	ld	iy,#_num_mapa
   923F FD 6E 00      [19] 1782 	ld	l,0 (iy)
   9242 26 00         [ 7] 1783 	ld	h,#0x00
   9244 29            [11] 1784 	add	hl, hl
   9245 11 4F 89      [10] 1785 	ld	de,#_mapas
   9248 19            [11] 1786 	add	hl,de
   9249 7E            [ 7] 1787 	ld	a,(hl)
   924A FD 21 36 89   [14] 1788 	ld	iy,#_mapa
   924E FD 77 00      [19] 1789 	ld	0 (iy),a
   9251 23            [ 6] 1790 	inc	hl
   9252 7E            [ 7] 1791 	ld	a,(hl)
   9253 32 37 89      [13] 1792 	ld	(#_mapa + 1),a
                           1793 ;src/main.c:415: prota.x = prota.px = 2;
   9256 21 26 89      [10] 1794 	ld	hl,#(_prota + 0x0002)
   9259 36 02         [10] 1795 	ld	(hl),#0x02
   925B 21 24 89      [10] 1796 	ld	hl,#_prota
   925E 36 02         [10] 1797 	ld	(hl),#0x02
                           1798 ;src/main.c:416: prota.mover = SI;
   9260 21 2A 89      [10] 1799 	ld	hl,#(_prota + 0x0006)
                           1800 ;src/main.c:417: dibujarMapa();
                           1801 ;src/main.c:421: menuFin();
   9263 36 01         [10] 1802 	ld	(hl), #0x01
   9265 C3 39 89      [10] 1803 	jp	_dibujarMapa
                           1804 ;src/main.c:425: void moverIzquierda() {
                           1805 ;	---------------------------------
                           1806 ; Function moverIzquierda
                           1807 ; ---------------------------------
   9268                    1808 _moverIzquierda::
                           1809 ;src/main.c:426: prota.mira = M_izquierda;
   9268 01 24 89      [10] 1810 	ld	bc,#_prota+0
   926B 21 2B 89      [10] 1811 	ld	hl,#(_prota + 0x0007)
   926E 36 01         [10] 1812 	ld	(hl),#0x01
                           1813 ;src/main.c:427: if (!checkCollision(M_izquierda)) {
   9270 C5            [11] 1814 	push	bc
   9271 21 01 00      [10] 1815 	ld	hl,#0x0001
   9274 E5            [11] 1816 	push	hl
   9275 CD 85 8A      [17] 1817 	call	_checkCollision
   9278 F1            [10] 1818 	pop	af
   9279 C1            [10] 1819 	pop	bc
   927A 7D            [ 4] 1820 	ld	a,l
   927B B7            [ 4] 1821 	or	a, a
   927C C0            [11] 1822 	ret	NZ
                           1823 ;src/main.c:428: prota.x--;
   927D 0A            [ 7] 1824 	ld	a,(bc)
   927E C6 FF         [ 7] 1825 	add	a,#0xFF
   9280 02            [ 7] 1826 	ld	(bc),a
                           1827 ;src/main.c:429: prota.mover = SI;
   9281 21 2A 89      [10] 1828 	ld	hl,#(_prota + 0x0006)
   9284 36 01         [10] 1829 	ld	(hl),#0x01
                           1830 ;src/main.c:430: prota.sprite = g_hero_left;
   9286 21 FE 79      [10] 1831 	ld	hl,#_g_hero_left
   9289 22 28 89      [16] 1832 	ld	((_prota + 0x0004)), hl
   928C C9            [10] 1833 	ret
                           1834 ;src/main.c:434: void moverDerecha() {
                           1835 ;	---------------------------------
                           1836 ; Function moverDerecha
                           1837 ; ---------------------------------
   928D                    1838 _moverDerecha::
                           1839 ;src/main.c:435: prota.mira = M_derecha;
   928D 21 2B 89      [10] 1840 	ld	hl,#(_prota + 0x0007)
   9290 36 00         [10] 1841 	ld	(hl),#0x00
                           1842 ;src/main.c:436: if (!checkCollision(M_derecha) ) {
   9292 21 00 00      [10] 1843 	ld	hl,#0x0000
   9295 E5            [11] 1844 	push	hl
   9296 CD 85 8A      [17] 1845 	call	_checkCollision
   9299 F1            [10] 1846 	pop	af
   929A 4D            [ 4] 1847 	ld	c,l
                           1848 ;src/main.c:437: prota.x++;
   929B 21 24 89      [10] 1849 	ld	hl, #_prota + 0
   929E 5E            [ 7] 1850 	ld	e,(hl)
                           1851 ;src/main.c:436: if (!checkCollision(M_derecha) ) {
   929F 79            [ 4] 1852 	ld	a,c
   92A0 B7            [ 4] 1853 	or	a, a
   92A1 20 11         [12] 1854 	jr	NZ,00104$
                           1855 ;src/main.c:437: prota.x++;
   92A3 1C            [ 4] 1856 	inc	e
   92A4 21 24 89      [10] 1857 	ld	hl,#_prota
   92A7 73            [ 7] 1858 	ld	(hl),e
                           1859 ;src/main.c:438: prota.mover = SI;
   92A8 21 2A 89      [10] 1860 	ld	hl,#(_prota + 0x0006)
   92AB 36 01         [10] 1861 	ld	(hl),#0x01
                           1862 ;src/main.c:439: prota.sprite = g_hero;
   92AD 21 A8 7A      [10] 1863 	ld	hl,#_g_hero
   92B0 22 28 89      [16] 1864 	ld	((_prota + 0x0004)), hl
   92B3 C9            [10] 1865 	ret
   92B4                    1866 00104$:
                           1867 ;src/main.c:441: }else if( prota.x + G_HERO_W >= 80){
   92B4 16 00         [ 7] 1868 	ld	d,#0x00
   92B6 21 07 00      [10] 1869 	ld	hl,#0x0007
   92B9 19            [11] 1870 	add	hl,de
   92BA 11 50 80      [10] 1871 	ld	de, #0x8050
   92BD 29            [11] 1872 	add	hl, hl
   92BE 3F            [ 4] 1873 	ccf
   92BF CB 1C         [ 8] 1874 	rr	h
   92C1 CB 1D         [ 8] 1875 	rr	l
   92C3 ED 52         [15] 1876 	sbc	hl, de
   92C5 D8            [11] 1877 	ret	C
                           1878 ;src/main.c:442: avanzarMapa();
   92C6 C3 2F 92      [10] 1879 	jp  _avanzarMapa
                           1880 ;src/main.c:446: void moverArriba() {
                           1881 ;	---------------------------------
                           1882 ; Function moverArriba
                           1883 ; ---------------------------------
   92C9                    1884 _moverArriba::
                           1885 ;src/main.c:447: prota.mira = M_arriba;
   92C9 21 2B 89      [10] 1886 	ld	hl,#(_prota + 0x0007)
   92CC 36 02         [10] 1887 	ld	(hl),#0x02
                           1888 ;src/main.c:448: if (!checkCollision(M_arriba)) { // TODO: COMPROBAR
   92CE 21 02 00      [10] 1889 	ld	hl,#0x0002
   92D1 E5            [11] 1890 	push	hl
   92D2 CD 85 8A      [17] 1891 	call	_checkCollision
   92D5 F1            [10] 1892 	pop	af
   92D6 7D            [ 4] 1893 	ld	a,l
   92D7 B7            [ 4] 1894 	or	a, a
   92D8 C0            [11] 1895 	ret	NZ
                           1896 ;src/main.c:449: prota.y--;
   92D9 21 25 89      [10] 1897 	ld	hl,#_prota + 1
   92DC 4E            [ 7] 1898 	ld	c,(hl)
   92DD 0D            [ 4] 1899 	dec	c
   92DE 71            [ 7] 1900 	ld	(hl),c
                           1901 ;src/main.c:450: prota.y--;
   92DF 0D            [ 4] 1902 	dec	c
   92E0 71            [ 7] 1903 	ld	(hl),c
                           1904 ;src/main.c:451: prota.mover  = SI;
   92E1 21 2A 89      [10] 1905 	ld	hl,#(_prota + 0x0006)
   92E4 36 01         [10] 1906 	ld	(hl),#0x01
                           1907 ;src/main.c:452: prota.sprite = g_hero_up;
   92E6 21 64 79      [10] 1908 	ld	hl,#_g_hero_up
   92E9 22 28 89      [16] 1909 	ld	((_prota + 0x0004)), hl
   92EC C9            [10] 1910 	ret
                           1911 ;src/main.c:456: void moverAbajo() {
                           1912 ;	---------------------------------
                           1913 ; Function moverAbajo
                           1914 ; ---------------------------------
   92ED                    1915 _moverAbajo::
                           1916 ;src/main.c:457: prota.mira = M_abajo;
   92ED 21 2B 89      [10] 1917 	ld	hl,#(_prota + 0x0007)
   92F0 36 03         [10] 1918 	ld	(hl),#0x03
                           1919 ;src/main.c:458: if (!checkCollision(M_abajo) ) { // TODO: COMPROBAR
   92F2 21 03 00      [10] 1920 	ld	hl,#0x0003
   92F5 E5            [11] 1921 	push	hl
   92F6 CD 85 8A      [17] 1922 	call	_checkCollision
   92F9 F1            [10] 1923 	pop	af
   92FA 7D            [ 4] 1924 	ld	a,l
   92FB B7            [ 4] 1925 	or	a, a
   92FC C0            [11] 1926 	ret	NZ
                           1927 ;src/main.c:459: prota.y++;
   92FD 01 25 89      [10] 1928 	ld	bc,#_prota + 1
   9300 0A            [ 7] 1929 	ld	a,(bc)
   9301 3C            [ 4] 1930 	inc	a
   9302 02            [ 7] 1931 	ld	(bc),a
                           1932 ;src/main.c:460: prota.y++;
   9303 3C            [ 4] 1933 	inc	a
   9304 02            [ 7] 1934 	ld	(bc),a
                           1935 ;src/main.c:461: prota.mover  = SI;
   9305 21 2A 89      [10] 1936 	ld	hl,#(_prota + 0x0006)
   9308 36 01         [10] 1937 	ld	(hl),#0x01
                           1938 ;src/main.c:462: prota.sprite = g_hero_down;
   930A 21 CA 78      [10] 1939 	ld	hl,#_g_hero_down
   930D 22 28 89      [16] 1940 	ld	((_prota + 0x0004)), hl
   9310 C9            [10] 1941 	ret
                           1942 ;src/main.c:466: void dibujarCuchillo() {
                           1943 ;	---------------------------------
                           1944 ; Function dibujarCuchillo
                           1945 ; ---------------------------------
   9311                    1946 _dibujarCuchillo::
   9311 DD E5         [15] 1947 	push	ix
   9313 DD 21 00 00   [14] 1948 	ld	ix,#0
   9317 DD 39         [15] 1949 	add	ix,sp
   9319 F5            [11] 1950 	push	af
                           1951 ;src/main.c:467: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   931A 21 2D 89      [10] 1952 	ld	hl, #_cu + 1
   931D 56            [ 7] 1953 	ld	d,(hl)
   931E 21 2C 89      [10] 1954 	ld	hl, #_cu + 0
   9321 46            [ 7] 1955 	ld	b,(hl)
   9322 D5            [11] 1956 	push	de
   9323 33            [ 6] 1957 	inc	sp
   9324 C5            [11] 1958 	push	bc
   9325 33            [ 6] 1959 	inc	sp
   9326 21 00 C0      [10] 1960 	ld	hl,#0xC000
   9329 E5            [11] 1961 	push	hl
   932A CD 70 88      [17] 1962 	call	_cpct_getScreenPtr
   932D 45            [ 4] 1963 	ld	b,l
   932E 5C            [ 4] 1964 	ld	e,h
                           1965 ;src/main.c:468: if(cu.eje == E_X){
   932F 21 34 89      [10] 1966 	ld	hl, #_cu + 8
   9332 4E            [ 7] 1967 	ld	c,(hl)
                           1968 ;src/main.c:469: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   9333 DD 70 FE      [19] 1969 	ld	-2 (ix),b
   9336 DD 73 FF      [19] 1970 	ld	-1 (ix),e
                           1971 ;src/main.c:468: if(cu.eje == E_X){
   9339 79            [ 4] 1972 	ld	a,c
   933A B7            [ 4] 1973 	or	a, a
   933B 20 19         [12] 1974 	jr	NZ,00104$
                           1975 ;src/main.c:469: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   933D 11 00 3E      [10] 1976 	ld	de,#_g_tablatrans+0
   9340 ED 4B 30 89   [20] 1977 	ld	bc, (#(_cu + 0x0004) + 0)
   9344 D5            [11] 1978 	push	de
   9345 21 04 04      [10] 1979 	ld	hl,#0x0404
   9348 E5            [11] 1980 	push	hl
   9349 DD 6E FE      [19] 1981 	ld	l,-2 (ix)
   934C DD 66 FF      [19] 1982 	ld	h,-1 (ix)
   934F E5            [11] 1983 	push	hl
   9350 C5            [11] 1984 	push	bc
   9351 CD 90 88      [17] 1985 	call	_cpct_drawSpriteMaskedAlignedTable
   9354 18 1A         [12] 1986 	jr	00106$
   9356                    1987 00104$:
                           1988 ;src/main.c:472: else if(cu.eje == E_Y){
   9356 0D            [ 4] 1989 	dec	c
   9357 20 17         [12] 1990 	jr	NZ,00106$
                           1991 ;src/main.c:473: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   9359 11 00 3E      [10] 1992 	ld	de,#_g_tablatrans+0
   935C ED 4B 30 89   [20] 1993 	ld	bc, (#(_cu + 0x0004) + 0)
   9360 D5            [11] 1994 	push	de
   9361 21 02 08      [10] 1995 	ld	hl,#0x0802
   9364 E5            [11] 1996 	push	hl
   9365 DD 6E FE      [19] 1997 	ld	l,-2 (ix)
   9368 DD 66 FF      [19] 1998 	ld	h,-1 (ix)
   936B E5            [11] 1999 	push	hl
   936C C5            [11] 2000 	push	bc
   936D CD 90 88      [17] 2001 	call	_cpct_drawSpriteMaskedAlignedTable
   9370                    2002 00106$:
   9370 DD F9         [10] 2003 	ld	sp, ix
   9372 DD E1         [14] 2004 	pop	ix
   9374 C9            [10] 2005 	ret
                           2006 ;src/main.c:477: void borrarCuchillo() {
                           2007 ;	---------------------------------
                           2008 ; Function borrarCuchillo
                           2009 ; ---------------------------------
   9375                    2010 _borrarCuchillo::
   9375 DD E5         [15] 2011 	push	ix
   9377 DD 21 00 00   [14] 2012 	ld	ix,#0
   937B DD 39         [15] 2013 	add	ix,sp
   937D F5            [11] 2014 	push	af
   937E 3B            [ 6] 2015 	dec	sp
                           2016 ;src/main.c:479: u8 w = 2 + (cu.px & 1);
   937F 21 2E 89      [10] 2017 	ld	hl, #_cu + 2
   9382 4E            [ 7] 2018 	ld	c,(hl)
   9383 79            [ 4] 2019 	ld	a,c
   9384 E6 01         [ 7] 2020 	and	a, #0x01
   9386 47            [ 4] 2021 	ld	b,a
   9387 04            [ 4] 2022 	inc	b
   9388 04            [ 4] 2023 	inc	b
                           2024 ;src/main.c:480: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   9389 21 2F 89      [10] 2025 	ld	hl, #_cu + 3
   938C 5E            [ 7] 2026 	ld	e,(hl)
   938D 7B            [ 4] 2027 	ld	a,e
   938E E6 03         [ 7] 2028 	and	a, #0x03
   9390 28 04         [12] 2029 	jr	Z,00105$
   9392 3E 01         [ 7] 2030 	ld	a,#0x01
   9394 18 02         [12] 2031 	jr	00106$
   9396                    2032 00105$:
   9396 3E 00         [ 7] 2033 	ld	a,#0x00
   9398                    2034 00106$:
   9398 C6 02         [ 7] 2035 	add	a, #0x02
   939A DD 77 FD      [19] 2036 	ld	-3 (ix),a
                           2037 ;src/main.c:481: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   939D FD 2A 36 89   [20] 2038 	ld	iy,(_mapa)
   93A1 16 00         [ 7] 2039 	ld	d,#0x00
   93A3 7B            [ 4] 2040 	ld	a,e
   93A4 C6 E8         [ 7] 2041 	add	a,#0xE8
   93A6 DD 77 FE      [19] 2042 	ld	-2 (ix),a
   93A9 7A            [ 4] 2043 	ld	a,d
   93AA CE FF         [ 7] 2044 	adc	a,#0xFF
   93AC DD 77 FF      [19] 2045 	ld	-1 (ix),a
   93AF DD 6E FE      [19] 2046 	ld	l,-2 (ix)
   93B2 DD 66 FF      [19] 2047 	ld	h,-1 (ix)
   93B5 DD CB FF 7E   [20] 2048 	bit	7, -1 (ix)
   93B9 28 04         [12] 2049 	jr	Z,00107$
   93BB 21 EB FF      [10] 2050 	ld	hl,#0xFFEB
   93BE 19            [11] 2051 	add	hl,de
   93BF                    2052 00107$:
   93BF CB 2C         [ 8] 2053 	sra	h
   93C1 CB 1D         [ 8] 2054 	rr	l
   93C3 CB 2C         [ 8] 2055 	sra	h
   93C5 CB 1D         [ 8] 2056 	rr	l
   93C7 55            [ 4] 2057 	ld	d,l
   93C8 CB 39         [ 8] 2058 	srl	c
   93CA FD E5         [15] 2059 	push	iy
   93CC 21 F0 C0      [10] 2060 	ld	hl,#0xC0F0
   93CF E5            [11] 2061 	push	hl
   93D0 3E 28         [ 7] 2062 	ld	a,#0x28
   93D2 F5            [11] 2063 	push	af
   93D3 33            [ 6] 2064 	inc	sp
   93D4 DD 7E FD      [19] 2065 	ld	a,-3 (ix)
   93D7 F5            [11] 2066 	push	af
   93D8 33            [ 6] 2067 	inc	sp
   93D9 C5            [11] 2068 	push	bc
   93DA 33            [ 6] 2069 	inc	sp
   93DB D5            [11] 2070 	push	de
   93DC 33            [ 6] 2071 	inc	sp
   93DD 79            [ 4] 2072 	ld	a,c
   93DE F5            [11] 2073 	push	af
   93DF 33            [ 6] 2074 	inc	sp
   93E0 CD 44 7D      [17] 2075 	call	_cpct_etm_drawTileBox2x4
                           2076 ;src/main.c:482: if(!cu.mover){
   93E3 3A 35 89      [13] 2077 	ld	a, (#_cu + 9)
   93E6 B7            [ 4] 2078 	or	a, a
   93E7 20 05         [12] 2079 	jr	NZ,00103$
                           2080 ;src/main.c:483: cu.lanzado = NO;
   93E9 21 32 89      [10] 2081 	ld	hl,#(_cu + 0x0006)
   93EC 36 00         [10] 2082 	ld	(hl),#0x00
   93EE                    2083 00103$:
   93EE DD F9         [10] 2084 	ld	sp, ix
   93F0 DD E1         [14] 2085 	pop	ix
   93F2 C9            [10] 2086 	ret
                           2087 ;src/main.c:487: void redibujarCuchillo( ) {
                           2088 ;	---------------------------------
                           2089 ; Function redibujarCuchillo
                           2090 ; ---------------------------------
   93F3                    2091 _redibujarCuchillo::
                           2092 ;src/main.c:488: borrarCuchillo();
   93F3 CD 75 93      [17] 2093 	call	_borrarCuchillo
                           2094 ;src/main.c:489: cu.px = cu.x;
   93F6 01 2E 89      [10] 2095 	ld	bc,#_cu + 2
   93F9 3A 2C 89      [13] 2096 	ld	a, (#_cu + 0)
   93FC 02            [ 7] 2097 	ld	(bc),a
                           2098 ;src/main.c:490: cu.py = cu.y;
   93FD 01 2F 89      [10] 2099 	ld	bc,#_cu + 3
   9400 3A 2D 89      [13] 2100 	ld	a, (#_cu + 1)
   9403 02            [ 7] 2101 	ld	(bc),a
                           2102 ;src/main.c:491: dibujarCuchillo();
   9404 C3 11 93      [10] 2103 	jp  _dibujarCuchillo
                           2104 ;src/main.c:495: void lanzarCuchillo(){
                           2105 ;	---------------------------------
                           2106 ; Function lanzarCuchillo
                           2107 ; ---------------------------------
   9407                    2108 _lanzarCuchillo::
                           2109 ;src/main.c:497: if(!cu.lanzado){
   9407 3A 32 89      [13] 2110 	ld	a, (#(_cu + 0x0006) + 0)
   940A B7            [ 4] 2111 	or	a, a
   940B C0            [11] 2112 	ret	NZ
                           2113 ;src/main.c:499: if(prota.mira == M_derecha){
   940C 21 2B 89      [10] 2114 	ld	hl, #_prota + 7
   940F 5E            [ 7] 2115 	ld	e,(hl)
                           2116 ;src/main.c:500: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   9410 01 25 89      [10] 2117 	ld	bc,#_prota + 1
                           2118 ;src/main.c:502: cu.direccion = M_derecha;
                           2119 ;src/main.c:504: cu.y=prota.y + G_HERO_H /2;
                           2120 ;src/main.c:505: cu.sprite=g_knifeX_0;
                           2121 ;src/main.c:506: cu.eje = E_X;
                           2122 ;src/main.c:499: if(prota.mira == M_derecha){
   9413 7B            [ 4] 2123 	ld	a,e
   9414 B7            [ 4] 2124 	or	a, a
   9415 20 41         [12] 2125 	jr	NZ,00118$
                           2126 ;src/main.c:500: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   9417 0A            [ 7] 2127 	ld	a,(bc)
   9418 C6 0B         [ 7] 2128 	add	a, #0x0B
   941A 5F            [ 4] 2129 	ld	e,a
   941B 3A 24 89      [13] 2130 	ld	a, (#_prota + 0)
   941E C6 0C         [ 7] 2131 	add	a, #0x0C
   9420 6F            [ 4] 2132 	ld	l,a
   9421 C5            [11] 2133 	push	bc
   9422 7B            [ 4] 2134 	ld	a,e
   9423 F5            [11] 2135 	push	af
   9424 33            [ 6] 2136 	inc	sp
   9425 7D            [ 4] 2137 	ld	a,l
   9426 F5            [11] 2138 	push	af
   9427 33            [ 6] 2139 	inc	sp
   9428 CD 44 8A      [17] 2140 	call	_getTilePtr
   942B F1            [10] 2141 	pop	af
   942C C1            [10] 2142 	pop	bc
   942D 5E            [ 7] 2143 	ld	e,(hl)
   942E 3E 02         [ 7] 2144 	ld	a,#0x02
   9430 93            [ 4] 2145 	sub	a, e
   9431 D8            [11] 2146 	ret	C
                           2147 ;src/main.c:501: cu.lanzado = SI;
   9432 21 32 89      [10] 2148 	ld	hl,#(_cu + 0x0006)
   9435 36 01         [10] 2149 	ld	(hl),#0x01
                           2150 ;src/main.c:502: cu.direccion = M_derecha;
   9437 21 33 89      [10] 2151 	ld	hl,#(_cu + 0x0007)
   943A 36 00         [10] 2152 	ld	(hl),#0x00
                           2153 ;src/main.c:503: cu.x=prota.x + G_HERO_W;
   943C 3A 24 89      [13] 2154 	ld	a, (#_prota + 0)
   943F C6 07         [ 7] 2155 	add	a, #0x07
   9441 32 2C 89      [13] 2156 	ld	(#_cu),a
                           2157 ;src/main.c:504: cu.y=prota.y + G_HERO_H /2;
   9444 0A            [ 7] 2158 	ld	a,(bc)
   9445 C6 0B         [ 7] 2159 	add	a, #0x0B
   9447 32 2D 89      [13] 2160 	ld	(#(_cu + 0x0001)),a
                           2161 ;src/main.c:505: cu.sprite=g_knifeX_0;
   944A 21 C0 54      [10] 2162 	ld	hl,#_g_knifeX_0
   944D 22 30 89      [16] 2163 	ld	((_cu + 0x0004)), hl
                           2164 ;src/main.c:506: cu.eje = E_X;
   9450 21 34 89      [10] 2165 	ld	hl,#(_cu + 0x0008)
   9453 36 00         [10] 2166 	ld	(hl),#0x00
                           2167 ;src/main.c:507: dibujarCuchillo();
   9455 C3 11 93      [10] 2168 	jp  _dibujarCuchillo
   9458                    2169 00118$:
                           2170 ;src/main.c:510: else if(prota.mira == M_izquierda){
   9458 7B            [ 4] 2171 	ld	a,e
   9459 3D            [ 4] 2172 	dec	a
   945A 20 41         [12] 2173 	jr	NZ,00115$
                           2174 ;src/main.c:511: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   945C 0A            [ 7] 2175 	ld	a,(bc)
   945D C6 0B         [ 7] 2176 	add	a, #0x0B
   945F 5F            [ 4] 2177 	ld	e,a
   9460 3A 24 89      [13] 2178 	ld	a, (#_prota + 0)
   9463 C6 F6         [ 7] 2179 	add	a,#0xF6
   9465 6F            [ 4] 2180 	ld	l,a
   9466 C5            [11] 2181 	push	bc
   9467 7B            [ 4] 2182 	ld	a,e
   9468 F5            [11] 2183 	push	af
   9469 33            [ 6] 2184 	inc	sp
   946A 7D            [ 4] 2185 	ld	a,l
   946B F5            [11] 2186 	push	af
   946C 33            [ 6] 2187 	inc	sp
   946D CD 44 8A      [17] 2188 	call	_getTilePtr
   9470 F1            [10] 2189 	pop	af
   9471 C1            [10] 2190 	pop	bc
   9472 5E            [ 7] 2191 	ld	e,(hl)
   9473 3E 02         [ 7] 2192 	ld	a,#0x02
   9475 93            [ 4] 2193 	sub	a, e
   9476 D8            [11] 2194 	ret	C
                           2195 ;src/main.c:512: cu.lanzado = SI;
   9477 21 32 89      [10] 2196 	ld	hl,#(_cu + 0x0006)
   947A 36 01         [10] 2197 	ld	(hl),#0x01
                           2198 ;src/main.c:513: cu.direccion = M_izquierda;
   947C 21 33 89      [10] 2199 	ld	hl,#(_cu + 0x0007)
   947F 36 01         [10] 2200 	ld	(hl),#0x01
                           2201 ;src/main.c:514: cu.x = prota.x - G_KNIFEX_0_W;
   9481 3A 24 89      [13] 2202 	ld	a, (#_prota + 0)
   9484 C6 FC         [ 7] 2203 	add	a,#0xFC
   9486 32 2C 89      [13] 2204 	ld	(#_cu),a
                           2205 ;src/main.c:515: cu.y = prota.y + G_HERO_H /2;
   9489 0A            [ 7] 2206 	ld	a,(bc)
   948A C6 0B         [ 7] 2207 	add	a, #0x0B
   948C 32 2D 89      [13] 2208 	ld	(#(_cu + 0x0001)),a
                           2209 ;src/main.c:516: cu.sprite = g_knifeX_1;
   948F 21 D0 54      [10] 2210 	ld	hl,#_g_knifeX_1
   9492 22 30 89      [16] 2211 	ld	((_cu + 0x0004)), hl
                           2212 ;src/main.c:517: cu.eje = E_X;
   9495 21 34 89      [10] 2213 	ld	hl,#(_cu + 0x0008)
   9498 36 00         [10] 2214 	ld	(hl),#0x00
                           2215 ;src/main.c:518: dibujarCuchillo();
   949A C3 11 93      [10] 2216 	jp  _dibujarCuchillo
   949D                    2217 00115$:
                           2218 ;src/main.c:521: else if(prota.mira == M_abajo){
   949D 7B            [ 4] 2219 	ld	a,e
   949E D6 03         [ 7] 2220 	sub	a, #0x03
   94A0 20 41         [12] 2221 	jr	NZ,00112$
                           2222 ;src/main.c:523: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   94A2 0A            [ 7] 2223 	ld	a,(bc)
   94A3 C6 1F         [ 7] 2224 	add	a, #0x1F
   94A5 5F            [ 4] 2225 	ld	e,a
   94A6 3A 24 89      [13] 2226 	ld	a, (#_prota + 0)
   94A9 57            [ 4] 2227 	ld	d,a
   94AA 14            [ 4] 2228 	inc	d
   94AB 14            [ 4] 2229 	inc	d
   94AC 14            [ 4] 2230 	inc	d
   94AD C5            [11] 2231 	push	bc
   94AE 7B            [ 4] 2232 	ld	a,e
   94AF F5            [11] 2233 	push	af
   94B0 33            [ 6] 2234 	inc	sp
   94B1 D5            [11] 2235 	push	de
   94B2 33            [ 6] 2236 	inc	sp
   94B3 CD 44 8A      [17] 2237 	call	_getTilePtr
   94B6 F1            [10] 2238 	pop	af
   94B7 C1            [10] 2239 	pop	bc
   94B8 5E            [ 7] 2240 	ld	e,(hl)
   94B9 3E 02         [ 7] 2241 	ld	a,#0x02
   94BB 93            [ 4] 2242 	sub	a, e
   94BC D8            [11] 2243 	ret	C
                           2244 ;src/main.c:524: cu.lanzado = SI;
   94BD 21 32 89      [10] 2245 	ld	hl,#(_cu + 0x0006)
   94C0 36 01         [10] 2246 	ld	(hl),#0x01
                           2247 ;src/main.c:525: cu.direccion = M_abajo;
   94C2 21 33 89      [10] 2248 	ld	hl,#(_cu + 0x0007)
   94C5 36 03         [10] 2249 	ld	(hl),#0x03
                           2250 ;src/main.c:526: cu.x = prota.x + G_HERO_W / 2;
   94C7 3A 24 89      [13] 2251 	ld	a, (#_prota + 0)
   94CA C6 03         [ 7] 2252 	add	a, #0x03
   94CC 32 2C 89      [13] 2253 	ld	(#_cu),a
                           2254 ;src/main.c:527: cu.y = prota.y + G_HERO_H;
   94CF 0A            [ 7] 2255 	ld	a,(bc)
   94D0 C6 16         [ 7] 2256 	add	a, #0x16
   94D2 32 2D 89      [13] 2257 	ld	(#(_cu + 0x0001)),a
                           2258 ;src/main.c:528: cu.sprite = g_knifeY_0;
   94D5 21 A0 54      [10] 2259 	ld	hl,#_g_knifeY_0
   94D8 22 30 89      [16] 2260 	ld	((_cu + 0x0004)), hl
                           2261 ;src/main.c:529: cu.eje = E_Y;
   94DB 21 34 89      [10] 2262 	ld	hl,#(_cu + 0x0008)
   94DE 36 01         [10] 2263 	ld	(hl),#0x01
                           2264 ;src/main.c:530: dibujarCuchillo();
   94E0 C3 11 93      [10] 2265 	jp  _dibujarCuchillo
   94E3                    2266 00112$:
                           2267 ;src/main.c:533: else if(prota.mira == M_arriba){
   94E3 7B            [ 4] 2268 	ld	a,e
   94E4 D6 02         [ 7] 2269 	sub	a, #0x02
   94E6 C0            [11] 2270 	ret	NZ
                           2271 ;src/main.c:534: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   94E7 0A            [ 7] 2272 	ld	a,(bc)
   94E8 C6 F7         [ 7] 2273 	add	a,#0xF7
   94EA 57            [ 4] 2274 	ld	d,a
   94EB 3A 24 89      [13] 2275 	ld	a, (#_prota + 0)
   94EE C6 03         [ 7] 2276 	add	a, #0x03
   94F0 C5            [11] 2277 	push	bc
   94F1 D5            [11] 2278 	push	de
   94F2 33            [ 6] 2279 	inc	sp
   94F3 F5            [11] 2280 	push	af
   94F4 33            [ 6] 2281 	inc	sp
   94F5 CD 44 8A      [17] 2282 	call	_getTilePtr
   94F8 F1            [10] 2283 	pop	af
   94F9 C1            [10] 2284 	pop	bc
   94FA 5E            [ 7] 2285 	ld	e,(hl)
   94FB 3E 02         [ 7] 2286 	ld	a,#0x02
   94FD 93            [ 4] 2287 	sub	a, e
   94FE D8            [11] 2288 	ret	C
                           2289 ;src/main.c:535: cu.lanzado = SI;
   94FF 21 32 89      [10] 2290 	ld	hl,#(_cu + 0x0006)
   9502 36 01         [10] 2291 	ld	(hl),#0x01
                           2292 ;src/main.c:536: cu.direccion = M_arriba;
   9504 21 33 89      [10] 2293 	ld	hl,#(_cu + 0x0007)
   9507 36 02         [10] 2294 	ld	(hl),#0x02
                           2295 ;src/main.c:537: cu.x = prota.x + G_HERO_W / 2;
   9509 3A 24 89      [13] 2296 	ld	a, (#_prota + 0)
   950C C6 03         [ 7] 2297 	add	a, #0x03
   950E 32 2C 89      [13] 2298 	ld	(#_cu),a
                           2299 ;src/main.c:538: cu.y = prota.y;
   9511 0A            [ 7] 2300 	ld	a,(bc)
   9512 32 2D 89      [13] 2301 	ld	(#(_cu + 0x0001)),a
                           2302 ;src/main.c:539: cu.sprite = g_knifeY_1;
   9515 21 B0 54      [10] 2303 	ld	hl,#_g_knifeY_1
   9518 22 30 89      [16] 2304 	ld	((_cu + 0x0004)), hl
                           2305 ;src/main.c:540: cu.eje = E_Y;
   951B 21 34 89      [10] 2306 	ld	hl,#(_cu + 0x0008)
   951E 36 01         [10] 2307 	ld	(hl),#0x01
                           2308 ;src/main.c:541: dibujarCuchillo();
   9520 C3 11 93      [10] 2309 	jp  _dibujarCuchillo
                           2310 ;src/main.c:547: void comprobarTeclado() {
                           2311 ;	---------------------------------
                           2312 ; Function comprobarTeclado
                           2313 ; ---------------------------------
   9523                    2314 _comprobarTeclado::
                           2315 ;src/main.c:548: cpct_scanKeyboard_if();
   9523 CD 9C 7E      [17] 2316 	call	_cpct_scanKeyboard_if
                           2317 ;src/main.c:550: if (cpct_isAnyKeyPressed()) {
   9526 CD 8F 7E      [17] 2318 	call	_cpct_isAnyKeyPressed
   9529 7D            [ 4] 2319 	ld	a,l
   952A B7            [ 4] 2320 	or	a, a
   952B C8            [11] 2321 	ret	Z
                           2322 ;src/main.c:551: if (cpct_isKeyPressed(Key_CursorLeft))
   952C 21 01 01      [10] 2323 	ld	hl,#0x0101
   952F CD F9 7B      [17] 2324 	call	_cpct_isKeyPressed
   9532 7D            [ 4] 2325 	ld	a,l
   9533 B7            [ 4] 2326 	or	a, a
                           2327 ;src/main.c:552: moverIzquierda();
   9534 C2 68 92      [10] 2328 	jp	NZ,_moverIzquierda
                           2329 ;src/main.c:553: else if (cpct_isKeyPressed(Key_CursorRight))
   9537 21 00 02      [10] 2330 	ld	hl,#0x0200
   953A CD F9 7B      [17] 2331 	call	_cpct_isKeyPressed
   953D 7D            [ 4] 2332 	ld	a,l
   953E B7            [ 4] 2333 	or	a, a
                           2334 ;src/main.c:554: moverDerecha();
   953F C2 8D 92      [10] 2335 	jp	NZ,_moverDerecha
                           2336 ;src/main.c:555: else if (cpct_isKeyPressed(Key_CursorUp))
   9542 21 00 01      [10] 2337 	ld	hl,#0x0100
   9545 CD F9 7B      [17] 2338 	call	_cpct_isKeyPressed
   9548 7D            [ 4] 2339 	ld	a,l
   9549 B7            [ 4] 2340 	or	a, a
                           2341 ;src/main.c:556: moverArriba();
   954A C2 C9 92      [10] 2342 	jp	NZ,_moverArriba
                           2343 ;src/main.c:557: else if (cpct_isKeyPressed(Key_CursorDown))
   954D 21 00 04      [10] 2344 	ld	hl,#0x0400
   9550 CD F9 7B      [17] 2345 	call	_cpct_isKeyPressed
   9553 7D            [ 4] 2346 	ld	a,l
   9554 B7            [ 4] 2347 	or	a, a
                           2348 ;src/main.c:558: moverAbajo();
   9555 C2 ED 92      [10] 2349 	jp	NZ,_moverAbajo
                           2350 ;src/main.c:559: else if (cpct_isKeyPressed(Key_Space))
   9558 21 05 80      [10] 2351 	ld	hl,#0x8005
   955B CD F9 7B      [17] 2352 	call	_cpct_isKeyPressed
   955E 7D            [ 4] 2353 	ld	a,l
   955F B7            [ 4] 2354 	or	a, a
   9560 C8            [11] 2355 	ret	Z
                           2356 ;src/main.c:560: lanzarCuchillo();
   9561 C3 07 94      [10] 2357 	jp  _lanzarCuchillo
                           2358 ;src/main.c:564: u8 checkKnifeCollision(int direction, u8 xoff, u8 yoff){
                           2359 ;	---------------------------------
                           2360 ; Function checkKnifeCollision
                           2361 ; ---------------------------------
   9564                    2362 _checkKnifeCollision::
                           2363 ;src/main.c:566: return *getTilePtr(cu.x + xoff, cu.y + yoff) <= 2;
   9564 3A 2D 89      [13] 2364 	ld	a,(#_cu + 1)
   9567 21 05 00      [10] 2365 	ld	hl,#5
   956A 39            [11] 2366 	add	hl,sp
   956B 86            [ 7] 2367 	add	a, (hl)
   956C 47            [ 4] 2368 	ld	b,a
   956D 3A 2C 89      [13] 2369 	ld	a,(#_cu + 0)
   9570 21 04 00      [10] 2370 	ld	hl,#4
   9573 39            [11] 2371 	add	hl,sp
   9574 86            [ 7] 2372 	add	a, (hl)
   9575 4F            [ 4] 2373 	ld	c,a
   9576 C5            [11] 2374 	push	bc
   9577 CD 44 8A      [17] 2375 	call	_getTilePtr
   957A F1            [10] 2376 	pop	af
   957B 4E            [ 7] 2377 	ld	c,(hl)
   957C 3E 02         [ 7] 2378 	ld	a,#0x02
   957E 91            [ 4] 2379 	sub	a, c
   957F 3E 00         [ 7] 2380 	ld	a,#0x00
   9581 17            [ 4] 2381 	rla
   9582 EE 01         [ 7] 2382 	xor	a, #0x01
   9584 6F            [ 4] 2383 	ld	l, a
   9585 C9            [10] 2384 	ret
                           2385 ;src/main.c:569: void moverCuchillo(){
                           2386 ;	---------------------------------
                           2387 ; Function moverCuchillo
                           2388 ; ---------------------------------
   9586                    2389 _moverCuchillo::
                           2390 ;src/main.c:572: if(cu.lanzado){
   9586 01 2C 89      [10] 2391 	ld	bc,#_cu+0
   9589 3A 32 89      [13] 2392 	ld	a, (#_cu + 6)
   958C B7            [ 4] 2393 	or	a, a
   958D C8            [11] 2394 	ret	Z
                           2395 ;src/main.c:573: cu.mover = SI;
   958E 21 09 00      [10] 2396 	ld	hl,#0x0009
   9591 09            [11] 2397 	add	hl,bc
   9592 EB            [ 4] 2398 	ex	de,hl
   9593 3E 01         [ 7] 2399 	ld	a,#0x01
   9595 12            [ 7] 2400 	ld	(de),a
                           2401 ;src/main.c:574: if(cu.direccion == M_derecha){
   9596 21 33 89      [10] 2402 	ld	hl, #_cu + 7
   9599 6E            [ 7] 2403 	ld	l,(hl)
   959A 7D            [ 4] 2404 	ld	a,l
   959B B7            [ 4] 2405 	or	a, a
   959C 20 1E         [12] 2406 	jr	NZ,00122$
                           2407 ;src/main.c:576: if(checkKnifeCollision(M_derecha, G_KNIFEX_0_W + 1, 0)){
   959E C5            [11] 2408 	push	bc
   959F D5            [11] 2409 	push	de
   95A0 21 05 00      [10] 2410 	ld	hl,#0x0005
   95A3 E5            [11] 2411 	push	hl
   95A4 2E 00         [ 7] 2412 	ld	l, #0x00
   95A6 E5            [11] 2413 	push	hl
   95A7 CD 64 95      [17] 2414 	call	_checkKnifeCollision
   95AA F1            [10] 2415 	pop	af
   95AB F1            [10] 2416 	pop	af
   95AC D1            [10] 2417 	pop	de
   95AD C1            [10] 2418 	pop	bc
   95AE 7D            [ 4] 2419 	ld	a,l
   95AF B7            [ 4] 2420 	or	a, a
   95B0 28 07         [12] 2421 	jr	Z,00102$
                           2422 ;src/main.c:577: cu.mover = SI;
   95B2 3E 01         [ 7] 2423 	ld	a,#0x01
   95B4 12            [ 7] 2424 	ld	(de),a
                           2425 ;src/main.c:578: cu.x++;
   95B5 0A            [ 7] 2426 	ld	a,(bc)
   95B6 3C            [ 4] 2427 	inc	a
   95B7 02            [ 7] 2428 	ld	(bc),a
   95B8 C9            [10] 2429 	ret
   95B9                    2430 00102$:
                           2431 ;src/main.c:581: cu.mover=NO;
   95B9 AF            [ 4] 2432 	xor	a, a
   95BA 12            [ 7] 2433 	ld	(de),a
   95BB C9            [10] 2434 	ret
   95BC                    2435 00122$:
                           2436 ;src/main.c:584: else if(cu.direccion == M_izquierda){
   95BC 7D            [ 4] 2437 	ld	a,l
   95BD 3D            [ 4] 2438 	dec	a
   95BE 20 1F         [12] 2439 	jr	NZ,00119$
                           2440 ;src/main.c:585: if(checkKnifeCollision(M_derecha, -1, 0)){			
   95C0 C5            [11] 2441 	push	bc
   95C1 D5            [11] 2442 	push	de
   95C2 21 FF 00      [10] 2443 	ld	hl,#0x00FF
   95C5 E5            [11] 2444 	push	hl
   95C6 2E 00         [ 7] 2445 	ld	l, #0x00
   95C8 E5            [11] 2446 	push	hl
   95C9 CD 64 95      [17] 2447 	call	_checkKnifeCollision
   95CC F1            [10] 2448 	pop	af
   95CD F1            [10] 2449 	pop	af
   95CE D1            [10] 2450 	pop	de
   95CF C1            [10] 2451 	pop	bc
   95D0 7D            [ 4] 2452 	ld	a,l
   95D1 B7            [ 4] 2453 	or	a, a
   95D2 28 08         [12] 2454 	jr	Z,00105$
                           2455 ;src/main.c:586: cu.mover = SI;		
   95D4 3E 01         [ 7] 2456 	ld	a,#0x01
   95D6 12            [ 7] 2457 	ld	(de),a
                           2458 ;src/main.c:587: cu.x--;
   95D7 0A            [ 7] 2459 	ld	a,(bc)
   95D8 C6 FF         [ 7] 2460 	add	a,#0xFF
   95DA 02            [ 7] 2461 	ld	(bc),a
   95DB C9            [10] 2462 	ret
   95DC                    2463 00105$:
                           2464 ;src/main.c:589: cu.mover=NO;
   95DC AF            [ 4] 2465 	xor	a, a
   95DD 12            [ 7] 2466 	ld	(de),a
   95DE C9            [10] 2467 	ret
   95DF                    2468 00119$:
                           2469 ;src/main.c:595: cu.y--;
   95DF 03            [ 6] 2470 	inc	bc
                           2471 ;src/main.c:592: else if(cu.direccion == M_arriba){
   95E0 7D            [ 4] 2472 	ld	a,l
   95E1 D6 02         [ 7] 2473 	sub	a, #0x02
   95E3 20 22         [12] 2474 	jr	NZ,00116$
                           2475 ;src/main.c:593: if(checkKnifeCollision(M_derecha, 0, -2)){
   95E5 C5            [11] 2476 	push	bc
   95E6 D5            [11] 2477 	push	de
   95E7 21 00 FE      [10] 2478 	ld	hl,#0xFE00
   95EA E5            [11] 2479 	push	hl
   95EB 26 00         [ 7] 2480 	ld	h, #0x00
   95ED E5            [11] 2481 	push	hl
   95EE CD 64 95      [17] 2482 	call	_checkKnifeCollision
   95F1 F1            [10] 2483 	pop	af
   95F2 F1            [10] 2484 	pop	af
   95F3 D1            [10] 2485 	pop	de
   95F4 C1            [10] 2486 	pop	bc
   95F5 7D            [ 4] 2487 	ld	a,l
   95F6 B7            [ 4] 2488 	or	a, a
   95F7 28 0B         [12] 2489 	jr	Z,00108$
                           2490 ;src/main.c:594: cu.mover = SI;
   95F9 3E 01         [ 7] 2491 	ld	a,#0x01
   95FB 12            [ 7] 2492 	ld	(de),a
                           2493 ;src/main.c:595: cu.y--;
   95FC 0A            [ 7] 2494 	ld	a,(bc)
   95FD C6 FF         [ 7] 2495 	add	a,#0xFF
   95FF 02            [ 7] 2496 	ld	(bc),a
                           2497 ;src/main.c:596: cu.y--;
   9600 C6 FF         [ 7] 2498 	add	a,#0xFF
   9602 02            [ 7] 2499 	ld	(bc),a
   9603 C9            [10] 2500 	ret
   9604                    2501 00108$:
                           2502 ;src/main.c:599: cu.mover=NO;
   9604 AF            [ 4] 2503 	xor	a, a
   9605 12            [ 7] 2504 	ld	(de),a
   9606 C9            [10] 2505 	ret
   9607                    2506 00116$:
                           2507 ;src/main.c:602: else if(cu.direccion == M_abajo){
   9607 7D            [ 4] 2508 	ld	a,l
   9608 D6 03         [ 7] 2509 	sub	a, #0x03
   960A C0            [11] 2510 	ret	NZ
                           2511 ;src/main.c:603: if(checkKnifeCollision(M_derecha, 0, G_KNIFEY_0_H + 2)){
   960B C5            [11] 2512 	push	bc
   960C D5            [11] 2513 	push	de
   960D 21 00 0A      [10] 2514 	ld	hl,#0x0A00
   9610 E5            [11] 2515 	push	hl
   9611 26 00         [ 7] 2516 	ld	h, #0x00
   9613 E5            [11] 2517 	push	hl
   9614 CD 64 95      [17] 2518 	call	_checkKnifeCollision
   9617 F1            [10] 2519 	pop	af
   9618 F1            [10] 2520 	pop	af
   9619 D1            [10] 2521 	pop	de
   961A C1            [10] 2522 	pop	bc
   961B 7D            [ 4] 2523 	ld	a,l
   961C B7            [ 4] 2524 	or	a, a
   961D 28 09         [12] 2525 	jr	Z,00111$
                           2526 ;src/main.c:604: cu.mover = SI;
   961F 3E 01         [ 7] 2527 	ld	a,#0x01
   9621 12            [ 7] 2528 	ld	(de),a
                           2529 ;src/main.c:605: cu.y++;
   9622 0A            [ 7] 2530 	ld	a,(bc)
   9623 3C            [ 4] 2531 	inc	a
   9624 02            [ 7] 2532 	ld	(bc),a
                           2533 ;src/main.c:606: cu.y++;
   9625 3C            [ 4] 2534 	inc	a
   9626 02            [ 7] 2535 	ld	(bc),a
   9627 C9            [10] 2536 	ret
   9628                    2537 00111$:
                           2538 ;src/main.c:609: cu.mover=NO;
   9628 AF            [ 4] 2539 	xor	a, a
   9629 12            [ 7] 2540 	ld	(de),a
   962A C9            [10] 2541 	ret
                           2542 ;src/main.c:614: void barraPuntuacionInicial(){
                           2543 ;	---------------------------------
                           2544 ; Function barraPuntuacionInicial
                           2545 ; ---------------------------------
   962B                    2546 _barraPuntuacionInicial::
                           2547 ;src/main.c:619: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   962B 21 00 02      [10] 2548 	ld	hl,#0x0200
   962E E5            [11] 2549 	push	hl
   962F 26 C0         [ 7] 2550 	ld	h, #0xC0
   9631 E5            [11] 2551 	push	hl
   9632 CD 70 88      [17] 2552 	call	_cpct_getScreenPtr
   9635 4D            [ 4] 2553 	ld	c,l
   9636 44            [ 4] 2554 	ld	b,h
                           2555 ;src/main.c:620: cpct_drawStringM0("SCORE", memptr, 1, 0);
   9637 21 01 00      [10] 2556 	ld	hl,#0x0001
   963A E5            [11] 2557 	push	hl
   963B C5            [11] 2558 	push	bc
   963C 21 D3 96      [10] 2559 	ld	hl,#___str_1
   963F E5            [11] 2560 	push	hl
   9640 CD 7B 7C      [17] 2561 	call	_cpct_drawStringM0
   9643 21 06 00      [10] 2562 	ld	hl,#6
   9646 39            [11] 2563 	add	hl,sp
   9647 F9            [ 6] 2564 	ld	sp,hl
                           2565 ;src/main.c:621: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   9648 21 00 0E      [10] 2566 	ld	hl,#0x0E00
   964B E5            [11] 2567 	push	hl
   964C 26 C0         [ 7] 2568 	ld	h, #0xC0
   964E E5            [11] 2569 	push	hl
   964F CD 70 88      [17] 2570 	call	_cpct_getScreenPtr
   9652 4D            [ 4] 2571 	ld	c,l
   9653 44            [ 4] 2572 	ld	b,h
                           2573 ;src/main.c:622: cpct_drawStringM0("00000", memptr, 15, 0);
   9654 21 0F 00      [10] 2574 	ld	hl,#0x000F
   9657 E5            [11] 2575 	push	hl
   9658 C5            [11] 2576 	push	bc
   9659 21 D9 96      [10] 2577 	ld	hl,#___str_2
   965C E5            [11] 2578 	push	hl
   965D CD 7B 7C      [17] 2579 	call	_cpct_drawStringM0
   9660 21 06 00      [10] 2580 	ld	hl,#6
   9663 39            [11] 2581 	add	hl,sp
   9664 F9            [ 6] 2582 	ld	sp,hl
                           2583 ;src/main.c:625: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 14);
   9665 21 1A 0E      [10] 2584 	ld	hl,#0x0E1A
   9668 E5            [11] 2585 	push	hl
   9669 21 00 C0      [10] 2586 	ld	hl,#0xC000
   966C E5            [11] 2587 	push	hl
   966D CD 70 88      [17] 2588 	call	_cpct_getScreenPtr
   9670 4D            [ 4] 2589 	ld	c,l
   9671 44            [ 4] 2590 	ld	b,h
                           2591 ;src/main.c:626: cpct_drawStringM0("ROBOBIT", memptr, 3, 0);
   9672 21 03 00      [10] 2592 	ld	hl,#0x0003
   9675 E5            [11] 2593 	push	hl
   9676 C5            [11] 2594 	push	bc
   9677 21 DF 96      [10] 2595 	ld	hl,#___str_3
   967A E5            [11] 2596 	push	hl
   967B CD 7B 7C      [17] 2597 	call	_cpct_drawStringM0
   967E 21 06 00      [10] 2598 	ld	hl,#6
   9681 39            [11] 2599 	add	hl,sp
   9682 F9            [ 6] 2600 	ld	sp,hl
                           2601 ;src/main.c:628: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   9683 21 3C 02      [10] 2602 	ld	hl,#0x023C
   9686 E5            [11] 2603 	push	hl
   9687 21 00 C0      [10] 2604 	ld	hl,#0xC000
   968A E5            [11] 2605 	push	hl
   968B CD 70 88      [17] 2606 	call	_cpct_getScreenPtr
   968E 4D            [ 4] 2607 	ld	c,l
   968F 44            [ 4] 2608 	ld	b,h
                           2609 ;src/main.c:629: cpct_drawStringM0("LIVES", memptr, 1, 0);
   9690 21 01 00      [10] 2610 	ld	hl,#0x0001
   9693 E5            [11] 2611 	push	hl
   9694 C5            [11] 2612 	push	bc
   9695 21 E7 96      [10] 2613 	ld	hl,#___str_4
   9698 E5            [11] 2614 	push	hl
   9699 CD 7B 7C      [17] 2615 	call	_cpct_drawStringM0
   969C 21 06 00      [10] 2616 	ld	hl,#6
   969F 39            [11] 2617 	add	hl,sp
   96A0 F9            [ 6] 2618 	ld	sp,hl
                           2619 ;src/main.c:631: for(i=0; i<5; i++){
   96A1 01 00 00      [10] 2620 	ld	bc,#0x0000
   96A4                    2621 00102$:
                           2622 ;src/main.c:632: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   96A4 79            [ 4] 2623 	ld	a,c
   96A5 87            [ 4] 2624 	add	a, a
   96A6 87            [ 4] 2625 	add	a, a
   96A7 C6 3C         [ 7] 2626 	add	a, #0x3C
   96A9 57            [ 4] 2627 	ld	d,a
   96AA C5            [11] 2628 	push	bc
   96AB 3E 0E         [ 7] 2629 	ld	a,#0x0E
   96AD F5            [11] 2630 	push	af
   96AE 33            [ 6] 2631 	inc	sp
   96AF D5            [11] 2632 	push	de
   96B0 33            [ 6] 2633 	inc	sp
   96B1 21 00 C0      [10] 2634 	ld	hl,#0xC000
   96B4 E5            [11] 2635 	push	hl
   96B5 CD 70 88      [17] 2636 	call	_cpct_getScreenPtr
   96B8 EB            [ 4] 2637 	ex	de,hl
   96B9 21 03 06      [10] 2638 	ld	hl,#0x0603
   96BC E5            [11] 2639 	push	hl
   96BD D5            [11] 2640 	push	de
   96BE 21 60 78      [10] 2641 	ld	hl,#_g_heart
   96C1 E5            [11] 2642 	push	hl
   96C2 CD 9F 7C      [17] 2643 	call	_cpct_drawSprite
   96C5 C1            [10] 2644 	pop	bc
                           2645 ;src/main.c:631: for(i=0; i<5; i++){
   96C6 03            [ 6] 2646 	inc	bc
   96C7 79            [ 4] 2647 	ld	a,c
   96C8 D6 05         [ 7] 2648 	sub	a, #0x05
   96CA 78            [ 4] 2649 	ld	a,b
   96CB 17            [ 4] 2650 	rla
   96CC 3F            [ 4] 2651 	ccf
   96CD 1F            [ 4] 2652 	rra
   96CE DE 80         [ 7] 2653 	sbc	a, #0x80
   96D0 38 D2         [12] 2654 	jr	C,00102$
   96D2 C9            [10] 2655 	ret
   96D3                    2656 ___str_1:
   96D3 53 43 4F 52 45     2657 	.ascii "SCORE"
   96D8 00                 2658 	.db 0x00
   96D9                    2659 ___str_2:
   96D9 30 30 30 30 30     2660 	.ascii "00000"
   96DE 00                 2661 	.db 0x00
   96DF                    2662 ___str_3:
   96DF 52 4F 42 4F 42 49  2663 	.ascii "ROBOBIT"
        54
   96E6 00                 2664 	.db 0x00
   96E7                    2665 ___str_4:
   96E7 4C 49 56 45 53     2666 	.ascii "LIVES"
   96EC 00                 2667 	.db 0x00
                           2668 ;src/main.c:637: void borrarPantallaArriba(){
                           2669 ;	---------------------------------
                           2670 ; Function borrarPantallaArriba
                           2671 ; ---------------------------------
   96ED                    2672 _borrarPantallaArriba::
                           2673 ;src/main.c:640: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 0); // posición para borrar la mitad derecha
   96ED 21 00 00      [10] 2674 	ld	hl,#0x0000
   96F0 E5            [11] 2675 	push	hl
   96F1 26 C0         [ 7] 2676 	ld	h, #0xC0
   96F3 E5            [11] 2677 	push	hl
   96F4 CD 70 88      [17] 2678 	call	_cpct_getScreenPtr
   96F7 4D            [ 4] 2679 	ld	c,l
   96F8 44            [ 4] 2680 	ld	b,h
                           2681 ;src/main.c:641: cpct_drawSolidBox(memptr, 0, 40, 24);  //borra la mitad derecha
   96F9 21 28 18      [10] 2682 	ld	hl,#0x1828
   96FC E5            [11] 2683 	push	hl
   96FD AF            [ 4] 2684 	xor	a, a
   96FE F5            [11] 2685 	push	af
   96FF 33            [ 6] 2686 	inc	sp
   9700 C5            [11] 2687 	push	bc
   9701 CD 96 87      [17] 2688 	call	_cpct_drawSolidBox
   9704 F1            [10] 2689 	pop	af
                           2690 ;src/main.c:642: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 40, 0); // posición para borrar la mitad izquierda
   9705 33            [ 6] 2691 	inc	sp
   9706 21 28 00      [10] 2692 	ld	hl,#0x0028
   9709 E3            [19] 2693 	ex	(sp),hl
   970A 21 00 C0      [10] 2694 	ld	hl,#0xC000
   970D E5            [11] 2695 	push	hl
   970E CD 70 88      [17] 2696 	call	_cpct_getScreenPtr
   9711 4D            [ 4] 2697 	ld	c,l
   9712 44            [ 4] 2698 	ld	b,h
                           2699 ;src/main.c:643: cpct_drawSolidBox(memptr, 0, 40, 24);  //borra la mitad izquierda
   9713 21 28 18      [10] 2700 	ld	hl,#0x1828
   9716 E5            [11] 2701 	push	hl
   9717 AF            [ 4] 2702 	xor	a, a
   9718 F5            [11] 2703 	push	af
   9719 33            [ 6] 2704 	inc	sp
   971A C5            [11] 2705 	push	bc
   971B CD 96 87      [17] 2706 	call	_cpct_drawSolidBox
   971E F1            [10] 2707 	pop	af
   971F F1            [10] 2708 	pop	af
   9720 33            [ 6] 2709 	inc	sp
   9721 C9            [10] 2710 	ret
                           2711 ;src/main.c:646: void menuInicio(){
                           2712 ;	---------------------------------
                           2713 ; Function menuInicio
                           2714 ; ---------------------------------
   9722                    2715 _menuInicio::
                           2716 ;src/main.c:650: cpct_clearScreen(0);
   9722 21 00 40      [10] 2717 	ld	hl,#0x4000
   9725 E5            [11] 2718 	push	hl
   9726 AF            [ 4] 2719 	xor	a, a
   9727 F5            [11] 2720 	push	af
   9728 33            [ 6] 2721 	inc	sp
   9729 26 C0         [ 7] 2722 	ld	h, #0xC0
   972B E5            [11] 2723 	push	hl
   972C CD 2A 7F      [17] 2724 	call	_cpct_memset
                           2725 ;src/main.c:652: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   972F 21 1A 0F      [10] 2726 	ld	hl,#0x0F1A
   9732 E5            [11] 2727 	push	hl
   9733 21 00 C0      [10] 2728 	ld	hl,#0xC000
   9736 E5            [11] 2729 	push	hl
   9737 CD 70 88      [17] 2730 	call	_cpct_getScreenPtr
   973A 4D            [ 4] 2731 	ld	c,l
   973B 44            [ 4] 2732 	ld	b,h
                           2733 ;src/main.c:653: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   973C 21 04 00      [10] 2734 	ld	hl,#0x0004
   973F E5            [11] 2735 	push	hl
   9740 C5            [11] 2736 	push	bc
   9741 21 D5 97      [10] 2737 	ld	hl,#___str_5
   9744 E5            [11] 2738 	push	hl
   9745 CD 7B 7C      [17] 2739 	call	_cpct_drawStringM0
   9748 21 06 00      [10] 2740 	ld	hl,#6
   974B 39            [11] 2741 	add	hl,sp
   974C F9            [ 6] 2742 	ld	sp,hl
                           2743 ;src/main.c:655: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   974D 21 28 6E      [10] 2744 	ld	hl,#0x6E28
   9750 E5            [11] 2745 	push	hl
   9751 21 F0 F0      [10] 2746 	ld	hl,#0xF0F0
   9754 E5            [11] 2747 	push	hl
   9755 21 00 56      [10] 2748 	ld	hl,#_g_text_0
   9758 E5            [11] 2749 	push	hl
   9759 CD 9F 7C      [17] 2750 	call	_cpct_drawSprite
                           2751 ;src/main.c:656: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   975C 21 28 6E      [10] 2752 	ld	hl,#0x6E28
   975F E5            [11] 2753 	push	hl
   9760 21 18 F1      [10] 2754 	ld	hl,#0xF118
   9763 E5            [11] 2755 	push	hl
   9764 21 30 67      [10] 2756 	ld	hl,#_g_text_1
   9767 E5            [11] 2757 	push	hl
   9768 CD 9F 7C      [17] 2758 	call	_cpct_drawSprite
                           2759 ;src/main.c:679: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   976B 21 08 A0      [10] 2760 	ld	hl,#0xA008
   976E E5            [11] 2761 	push	hl
   976F 21 00 C0      [10] 2762 	ld	hl,#0xC000
   9772 E5            [11] 2763 	push	hl
   9773 CD 70 88      [17] 2764 	call	_cpct_getScreenPtr
   9776 4D            [ 4] 2765 	ld	c,l
   9777 44            [ 4] 2766 	ld	b,h
                           2767 ;src/main.c:680: cpct_drawStringM0("TO START PRESS S", memptr, 4, 0);
   9778 21 04 00      [10] 2768 	ld	hl,#0x0004
   977B E5            [11] 2769 	push	hl
   977C C5            [11] 2770 	push	bc
   977D 21 DD 97      [10] 2771 	ld	hl,#___str_6
   9780 E5            [11] 2772 	push	hl
   9781 CD 7B 7C      [17] 2773 	call	_cpct_drawStringM0
   9784 21 06 00      [10] 2774 	ld	hl,#6
   9787 39            [11] 2775 	add	hl,sp
   9788 F9            [ 6] 2776 	ld	sp,hl
                           2777 ;src/main.c:682: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 170); // centrado en horizontal y abajo en vertical
   9789 21 0A AA      [10] 2778 	ld	hl,#0xAA0A
   978C E5            [11] 2779 	push	hl
   978D 21 00 C0      [10] 2780 	ld	hl,#0xC000
   9790 E5            [11] 2781 	push	hl
   9791 CD 70 88      [17] 2782 	call	_cpct_getScreenPtr
   9794 4D            [ 4] 2783 	ld	c,l
   9795 44            [ 4] 2784 	ld	b,h
                           2785 ;src/main.c:683: cpct_drawStringM0("TO MENU PRESS M", memptr, 4, 0);
   9796 21 04 00      [10] 2786 	ld	hl,#0x0004
   9799 E5            [11] 2787 	push	hl
   979A C5            [11] 2788 	push	bc
   979B 21 EE 97      [10] 2789 	ld	hl,#___str_7
   979E E5            [11] 2790 	push	hl
   979F CD 7B 7C      [17] 2791 	call	_cpct_drawStringM0
   97A2 21 06 00      [10] 2792 	ld	hl,#6
   97A5 39            [11] 2793 	add	hl,sp
   97A6 F9            [ 6] 2794 	ld	sp,hl
                           2795 ;src/main.c:686: do{
   97A7                    2796 00106$:
                           2797 ;src/main.c:687: cpct_scanKeyboard_f();
   97A7 CD 05 7C      [17] 2798 	call	_cpct_scanKeyboard_f
                           2799 ;src/main.c:690: else */if(cpct_isKeyPressed(Key_M)){
   97AA 21 04 40      [10] 2800 	ld	hl,#0x4004
   97AD CD F9 7B      [17] 2801 	call	_cpct_isKeyPressed
   97B0 7D            [ 4] 2802 	ld	a,l
   97B1 B7            [ 4] 2803 	or	a, a
   97B2 28 0D         [12] 2804 	jr	Z,00107$
                           2805 ;src/main.c:691: cpct_scanKeyboard_f();
   97B4 CD 05 7C      [17] 2806 	call	_cpct_scanKeyboard_f
                           2807 ;src/main.c:692: do{
   97B7                    2808 00101$:
                           2809 ;src/main.c:694: } while(!cpct_isKeyPressed(Key_S));
   97B7 21 07 10      [10] 2810 	ld	hl,#0x1007
   97BA CD F9 7B      [17] 2811 	call	_cpct_isKeyPressed
   97BD 7D            [ 4] 2812 	ld	a,l
   97BE B7            [ 4] 2813 	or	a, a
   97BF 28 F6         [12] 2814 	jr	Z,00101$
   97C1                    2815 00107$:
                           2816 ;src/main.c:696: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   97C1 21 07 10      [10] 2817 	ld	hl,#0x1007
   97C4 CD F9 7B      [17] 2818 	call	_cpct_isKeyPressed
   97C7 7D            [ 4] 2819 	ld	a,l
   97C8 B7            [ 4] 2820 	or	a, a
   97C9 C0            [11] 2821 	ret	NZ
   97CA 21 04 40      [10] 2822 	ld	hl,#0x4004
   97CD CD F9 7B      [17] 2823 	call	_cpct_isKeyPressed
   97D0 7D            [ 4] 2824 	ld	a,l
   97D1 B7            [ 4] 2825 	or	a, a
   97D2 28 D3         [12] 2826 	jr	Z,00106$
   97D4 C9            [10] 2827 	ret
   97D5                    2828 ___str_5:
   97D5 52 4F 42 4F 42 49  2829 	.ascii "ROBOBIT"
        54
   97DC 00                 2830 	.db 0x00
   97DD                    2831 ___str_6:
   97DD 54 4F 20 53 54 41  2832 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   97ED 00                 2833 	.db 0x00
   97EE                    2834 ___str_7:
   97EE 54 4F 20 4D 45 4E  2835 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   97FD 00                 2836 	.db 0x00
                           2837 ;src/main.c:699: void inicializarCPC() {
                           2838 ;	---------------------------------
                           2839 ; Function inicializarCPC
                           2840 ; ---------------------------------
   97FE                    2841 _inicializarCPC::
                           2842 ;src/main.c:700: cpct_disableFirmware();
   97FE CD 61 87      [17] 2843 	call	_cpct_disableFirmware
                           2844 ;src/main.c:701: cpct_setVideoMode(0);
   9801 2E 00         [ 7] 2845 	ld	l,#0x00
   9803 CD 0C 7F      [17] 2846 	call	_cpct_setVideoMode
                           2847 ;src/main.c:702: cpct_setBorder(HW_BLACK);
   9806 21 10 14      [10] 2848 	ld	hl,#0x1410
   9809 E5            [11] 2849 	push	hl
   980A CD 6F 7C      [17] 2850 	call	_cpct_setPALColour
                           2851 ;src/main.c:703: cpct_setPalette(g_palette, 16);
   980D 21 10 00      [10] 2852 	ld	hl,#0x0010
   9810 E5            [11] 2853 	push	hl
   9811 21 98 7A      [10] 2854 	ld	hl,#_g_palette
   9814 E5            [11] 2855 	push	hl
   9815 CD E2 7B      [17] 2856 	call	_cpct_setPalette
                           2857 ;src/main.c:704: cpct_akp_musicInit(G_song);
   9818 21 00 3F      [10] 2858 	ld	hl,#_G_song
   981B E5            [11] 2859 	push	hl
   981C CD 3D 86      [17] 2860 	call	_cpct_akp_musicInit
   981F F1            [10] 2861 	pop	af
   9820 C9            [10] 2862 	ret
                           2863 ;src/main.c:707: void inicializarEnemy() {
                           2864 ;	---------------------------------
                           2865 ; Function inicializarEnemy
                           2866 ; ---------------------------------
   9821                    2867 _inicializarEnemy::
   9821 DD E5         [15] 2868 	push	ix
   9823 DD 21 00 00   [14] 2869 	ld	ix,#0
   9827 DD 39         [15] 2870 	add	ix,sp
   9829 F5            [11] 2871 	push	af
                           2872 ;src/main.c:708: u8 i = (2 + num_mapa) + 1; //sacar distinto numero dependiendo del mapa
   982A 21 38 89      [10] 2873 	ld	hl,#_num_mapa + 0
   982D 4E            [ 7] 2874 	ld	c, (hl)
   982E 0C            [ 4] 2875 	inc	c
   982F 0C            [ 4] 2876 	inc	c
   9830 0C            [ 4] 2877 	inc	c
                           2878 ;src/main.c:713: actual = enemy;
   9831 11 F4 88      [10] 2879 	ld	de,#_enemy+0
                           2880 ;src/main.c:714: while(--i){
   9834                    2881 00104$:
   9834 0D            [ 4] 2882 	dec c
   9835 28 72         [12] 2883 	jr	Z,00107$
                           2884 ;src/main.c:715: actual->x = actual->px = spawnX[i];
   9837 D5            [11] 2885 	push	de
   9838 FD E1         [14] 2886 	pop	iy
   983A FD 23         [10] 2887 	inc	iy
   983C FD 23         [10] 2888 	inc	iy
   983E 21 55 89      [10] 2889 	ld	hl,#_spawnX
   9841 06 00         [ 7] 2890 	ld	b,#0x00
   9843 09            [11] 2891 	add	hl, bc
   9844 7E            [ 7] 2892 	ld	a,(hl)
   9845 FD 77 00      [19] 2893 	ld	0 (iy), a
   9848 12            [ 7] 2894 	ld	(de),a
                           2895 ;src/main.c:716: actual->y = actual->py = spawnY[i];
   9849 D5            [11] 2896 	push	de
   984A FD E1         [14] 2897 	pop	iy
   984C FD 23         [10] 2898 	inc	iy
   984E 21 03 00      [10] 2899 	ld	hl,#0x0003
   9851 19            [11] 2900 	add	hl,de
   9852 E3            [19] 2901 	ex	(sp), hl
   9853 21 5A 89      [10] 2902 	ld	hl,#_spawnY
   9856 06 00         [ 7] 2903 	ld	b,#0x00
   9858 09            [11] 2904 	add	hl, bc
   9859 46            [ 7] 2905 	ld	b,(hl)
   985A E1            [10] 2906 	pop	hl
   985B E5            [11] 2907 	push	hl
   985C 70            [ 7] 2908 	ld	(hl),b
   985D FD 70 00      [19] 2909 	ld	0 (iy), b
                           2910 ;src/main.c:717: actual->mover  = NO;
   9860 21 06 00      [10] 2911 	ld	hl,#0x0006
   9863 19            [11] 2912 	add	hl,de
   9864 36 00         [10] 2913 	ld	(hl),#0x00
                           2914 ;src/main.c:718: if( i % 2 == 0){
   9866 79            [ 4] 2915 	ld	a,c
   9867 E6 01         [ 7] 2916 	and	a, #0x01
   9869 47            [ 4] 2917 	ld	b,a
                           2918 ;src/main.c:719: actual->mira   = M_abajo;
   986A 21 07 00      [10] 2919 	ld	hl,#0x0007
   986D 19            [11] 2920 	add	hl,de
   986E E3            [19] 2921 	ex	(sp), hl
                           2922 ;src/main.c:718: if( i % 2 == 0){
   986F 78            [ 4] 2923 	ld	a,b
   9870 B7            [ 4] 2924 	or	a, a
   9871 20 06         [12] 2925 	jr	NZ,00102$
                           2926 ;src/main.c:719: actual->mira   = M_abajo;
   9873 E1            [10] 2927 	pop	hl
   9874 E5            [11] 2928 	push	hl
   9875 36 03         [10] 2929 	ld	(hl),#0x03
   9877 18 04         [12] 2930 	jr	00103$
   9879                    2931 00102$:
                           2932 ;src/main.c:722: actual->mira = M_derecha;
   9879 E1            [10] 2933 	pop	hl
   987A E5            [11] 2934 	push	hl
   987B 36 00         [10] 2935 	ld	(hl),#0x00
   987D                    2936 00103$:
                           2937 ;src/main.c:724: actual->sprite = g_enemy;
   987D 21 04 00      [10] 2938 	ld	hl,#0x0004
   9880 19            [11] 2939 	add	hl,de
   9881 36 72         [10] 2940 	ld	(hl),#<(_g_enemy)
   9883 23            [ 6] 2941 	inc	hl
   9884 36 78         [10] 2942 	ld	(hl),#>(_g_enemy)
                           2943 ;src/main.c:725: actual->muerto = NO;
   9886 21 08 00      [10] 2944 	ld	hl,#0x0008
   9889 19            [11] 2945 	add	hl,de
   988A 36 00         [10] 2946 	ld	(hl),#0x00
                           2947 ;src/main.c:726: actual->muertes = 0;
   988C 21 0B 00      [10] 2948 	ld	hl,#0x000B
   988F 19            [11] 2949 	add	hl,de
   9890 36 00         [10] 2950 	ld	(hl),#0x00
                           2951 ;src/main.c:727: actual->patrol = SI;
   9892 21 09 00      [10] 2952 	ld	hl,#0x0009
   9895 19            [11] 2953 	add	hl,de
   9896 36 01         [10] 2954 	ld	(hl),#0x01
                           2955 ;src/main.c:729: dibujarEnemigo(actual);
   9898 C5            [11] 2956 	push	bc
   9899 D5            [11] 2957 	push	de
   989A D5            [11] 2958 	push	de
   989B CD DA 8B      [17] 2959 	call	_dibujarEnemigo
   989E F1            [10] 2960 	pop	af
   989F D1            [10] 2961 	pop	de
   98A0 C1            [10] 2962 	pop	bc
                           2963 ;src/main.c:731: ++actual;
   98A1 21 0C 00      [10] 2964 	ld	hl,#0x000C
   98A4 19            [11] 2965 	add	hl,de
   98A5 5D            [ 4] 2966 	ld	e,l
   98A6 54            [ 4] 2967 	ld	d,h
   98A7 18 8B         [12] 2968 	jr	00104$
   98A9                    2969 00107$:
   98A9 DD F9         [10] 2970 	ld	sp, ix
   98AB DD E1         [14] 2971 	pop	ix
   98AD C9            [10] 2972 	ret
                           2973 ;src/main.c:735: void inicializarJuego() {
                           2974 ;	---------------------------------
                           2975 ; Function inicializarJuego
                           2976 ; ---------------------------------
   98AE                    2977 _inicializarJuego::
                           2978 ;src/main.c:737: num_mapa = 0;
   98AE 21 38 89      [10] 2979 	ld	hl,#_num_mapa + 0
   98B1 36 00         [10] 2980 	ld	(hl), #0x00
                           2981 ;src/main.c:738: mapa = mapas[num_mapa];
   98B3 21 4F 89      [10] 2982 	ld	hl, #_mapas + 0
   98B6 7E            [ 7] 2983 	ld	a,(hl)
   98B7 FD 21 36 89   [14] 2984 	ld	iy,#_mapa
   98BB FD 77 00      [19] 2985 	ld	0 (iy),a
   98BE 23            [ 6] 2986 	inc	hl
   98BF 7E            [ 7] 2987 	ld	a,(hl)
   98C0 32 37 89      [13] 2988 	ld	(#_mapa + 1),a
                           2989 ;src/main.c:739: cpct_etm_setTileset2x4(g_tileset);
   98C3 21 E0 54      [10] 2990 	ld	hl,#_g_tileset
   98C6 CD D3 7D      [17] 2991 	call	_cpct_etm_setTileset2x4
                           2992 ;src/main.c:741: dibujarMapa();
   98C9 CD 39 89      [17] 2993 	call	_dibujarMapa
                           2994 ;src/main.c:743: borrarPantallaArriba();
   98CC CD ED 96      [17] 2995 	call	_borrarPantallaArriba
                           2996 ;src/main.c:744: barraPuntuacionInicial();
   98CF CD 2B 96      [17] 2997 	call	_barraPuntuacionInicial
                           2998 ;src/main.c:747: prota.x = prota.px = 4;
   98D2 21 26 89      [10] 2999 	ld	hl,#(_prota + 0x0002)
   98D5 36 04         [10] 3000 	ld	(hl),#0x04
   98D7 21 24 89      [10] 3001 	ld	hl,#_prota
   98DA 36 04         [10] 3002 	ld	(hl),#0x04
                           3003 ;src/main.c:748: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   98DC 21 27 89      [10] 3004 	ld	hl,#(_prota + 0x0003)
   98DF 36 68         [10] 3005 	ld	(hl),#0x68
   98E1 21 25 89      [10] 3006 	ld	hl,#(_prota + 0x0001)
   98E4 36 68         [10] 3007 	ld	(hl),#0x68
                           3008 ;src/main.c:749: prota.mover  = NO;
   98E6 21 2A 89      [10] 3009 	ld	hl,#(_prota + 0x0006)
   98E9 36 00         [10] 3010 	ld	(hl),#0x00
                           3011 ;src/main.c:750: prota.mira=M_derecha;
   98EB 21 2B 89      [10] 3012 	ld	hl,#(_prota + 0x0007)
   98EE 36 00         [10] 3013 	ld	(hl),#0x00
                           3014 ;src/main.c:751: prota.sprite = g_hero;
   98F0 21 A8 7A      [10] 3015 	ld	hl,#_g_hero
   98F3 22 28 89      [16] 3016 	ld	((_prota + 0x0004)), hl
                           3017 ;src/main.c:755: cu.x = cu.px = 0;
   98F6 21 2E 89      [10] 3018 	ld	hl,#(_cu + 0x0002)
   98F9 36 00         [10] 3019 	ld	(hl),#0x00
   98FB 21 2C 89      [10] 3020 	ld	hl,#_cu
   98FE 36 00         [10] 3021 	ld	(hl),#0x00
                           3022 ;src/main.c:756: cu.y = cu.py = 0;
   9900 21 2F 89      [10] 3023 	ld	hl,#(_cu + 0x0003)
   9903 36 00         [10] 3024 	ld	(hl),#0x00
   9905 21 2D 89      [10] 3025 	ld	hl,#(_cu + 0x0001)
   9908 36 00         [10] 3026 	ld	(hl),#0x00
                           3027 ;src/main.c:757: cu.lanzado = NO;
   990A 21 32 89      [10] 3028 	ld	hl,#(_cu + 0x0006)
   990D 36 00         [10] 3029 	ld	(hl),#0x00
                           3030 ;src/main.c:758: cu.mover = NO;
   990F 21 35 89      [10] 3031 	ld	hl,#(_cu + 0x0009)
   9912 36 00         [10] 3032 	ld	(hl),#0x00
                           3033 ;src/main.c:760: inicializarEnemy();
   9914 CD 21 98      [17] 3034 	call	_inicializarEnemy
                           3035 ;src/main.c:762: dibujarProta();
   9917 C3 5F 89      [10] 3036 	jp  _dibujarProta
                           3037 ;src/main.c:765: void main(void) {
                           3038 ;	---------------------------------
                           3039 ; Function main
                           3040 ; ---------------------------------
   991A                    3041 _main::
   991A DD E5         [15] 3042 	push	ix
   991C DD 21 00 00   [14] 3043 	ld	ix,#0
   9920 DD 39         [15] 3044 	add	ix,sp
   9922 3B            [ 6] 3045 	dec	sp
                           3046 ;src/main.c:769: inicializarCPC();
   9923 CD FE 97      [17] 3047 	call	_inicializarCPC
                           3048 ;src/main.c:770: menuInicio();
   9926 CD 22 97      [17] 3049 	call	_menuInicio
                           3050 ;src/main.c:774: inicializarJuego();
   9929 CD AE 98      [17] 3051 	call	_inicializarJuego
                           3052 ;src/main.c:779: cpct_akp_musicPlay();
   992C CD 3A 7F      [17] 3053 	call	_cpct_akp_musicPlay
                           3054 ;src/main.c:781: while (1) {
   992F                    3055 00122$:
                           3056 ;src/main.c:784: actual = enemy;
                           3057 ;src/main.c:786: comprobarTeclado();
   992F CD 23 95      [17] 3058 	call	_comprobarTeclado
                           3059 ;src/main.c:787: moverCuchillo();
   9932 CD 86 95      [17] 3060 	call	_moverCuchillo
                           3061 ;src/main.c:789: while(--i){
   9935 11 F4 88      [10] 3062 	ld	de,#_enemy
   9938 0E 05         [ 7] 3063 	ld	c,#0x05
   993A                    3064 00101$:
   993A 0D            [ 4] 3065 	dec c
   993B 28 11         [12] 3066 	jr	Z,00103$
                           3067 ;src/main.c:790: moverEnemigo(actual);
   993D C5            [11] 3068 	push	bc
   993E D5            [11] 3069 	push	de
   993F D5            [11] 3070 	push	de
   9940 CD AA 91      [17] 3071 	call	_moverEnemigo
   9943 F1            [10] 3072 	pop	af
   9944 D1            [10] 3073 	pop	de
   9945 C1            [10] 3074 	pop	bc
                           3075 ;src/main.c:791: ++actual;
   9946 21 0C 00      [10] 3076 	ld	hl,#0x000C
   9949 19            [11] 3077 	add	hl,de
   994A 5D            [ 4] 3078 	ld	e,l
   994B 54            [ 4] 3079 	ld	d,h
   994C 18 EC         [12] 3080 	jr	00101$
   994E                    3081 00103$:
                           3082 ;src/main.c:794: actual = enemy;
   994E 01 F4 88      [10] 3083 	ld	bc,#_enemy
                           3084 ;src/main.c:796: cpct_waitVSYNC();
   9951 C5            [11] 3085 	push	bc
   9952 CD 04 7F      [17] 3086 	call	_cpct_waitVSYNC
   9955 C1            [10] 3087 	pop	bc
                           3088 ;src/main.c:798: if (prota.mover) {
   9956 11 2A 89      [10] 3089 	ld	de,#_prota+6
   9959 1A            [ 7] 3090 	ld	a,(de)
   995A B7            [ 4] 3091 	or	a, a
   995B 28 09         [12] 3092 	jr	Z,00105$
                           3093 ;src/main.c:799: redibujarProta();
   995D C5            [11] 3094 	push	bc
   995E D5            [11] 3095 	push	de
   995F CD 30 8A      [17] 3096 	call	_redibujarProta
   9962 D1            [10] 3097 	pop	de
   9963 C1            [10] 3098 	pop	bc
                           3099 ;src/main.c:800: prota.mover = NO;
   9964 AF            [ 4] 3100 	xor	a, a
   9965 12            [ 7] 3101 	ld	(de),a
   9966                    3102 00105$:
                           3103 ;src/main.c:802: if(cu.lanzado && cu.mover){
   9966 21 32 89      [10] 3104 	ld	hl,#_cu + 6
   9969 5E            [ 7] 3105 	ld	e,(hl)
   996A 21 35 89      [10] 3106 	ld	hl,#_cu + 9
   996D 7B            [ 4] 3107 	ld	a,e
   996E B7            [ 4] 3108 	or	a, a
   996F 28 0B         [12] 3109 	jr	Z,00110$
   9971 7E            [ 7] 3110 	ld	a,(hl)
   9972 B7            [ 4] 3111 	or	a, a
   9973 28 07         [12] 3112 	jr	Z,00110$
                           3113 ;src/main.c:803: redibujarCuchillo();
   9975 C5            [11] 3114 	push	bc
   9976 CD F3 93      [17] 3115 	call	_redibujarCuchillo
   9979 C1            [10] 3116 	pop	bc
   997A 18 17         [12] 3117 	jr	00137$
   997C                    3118 00110$:
                           3119 ;src/main.c:804: }else if (cu.lanzado && !cu.mover){
   997C 7B            [ 4] 3120 	ld	a,e
   997D B7            [ 4] 3121 	or	a, a
   997E 28 13         [12] 3122 	jr	Z,00137$
   9980 7E            [ 7] 3123 	ld	a,(hl)
   9981 B7            [ 4] 3124 	or	a, a
   9982 20 0F         [12] 3125 	jr	NZ,00137$
                           3126 ;src/main.c:805: borrarCuchillo();
   9984 C5            [11] 3127 	push	bc
   9985 CD 75 93      [17] 3128 	call	_borrarCuchillo
   9988 C1            [10] 3129 	pop	bc
                           3130 ;src/main.c:806: cu.x=0;
   9989 21 2C 89      [10] 3131 	ld	hl,#_cu
   998C 36 00         [10] 3132 	ld	(hl),#0x00
                           3133 ;src/main.c:807: cu.y=0;
   998E 21 2D 89      [10] 3134 	ld	hl,#(_cu + 0x0001)
   9991 36 00         [10] 3135 	ld	(hl),#0x00
                           3136 ;src/main.c:811: while(--i){
   9993                    3137 00137$:
   9993 DD 36 FF 05   [19] 3138 	ld	-1 (ix),#0x05
   9997                    3139 00118$:
   9997 DD 35 FF      [23] 3140 	dec	-1 (ix)
   999A DD 7E FF      [19] 3141 	ld	a,-1 (ix)
   999D B7            [ 4] 3142 	or	a, a
   999E 28 43         [12] 3143 	jr	Z,00120$
                           3144 ;src/main.c:812: if(actual->mover){
   99A0 C5            [11] 3145 	push	bc
   99A1 FD E1         [14] 3146 	pop	iy
   99A3 FD 7E 06      [19] 3147 	ld	a,6 (iy)
   99A6 B7            [ 4] 3148 	or	a, a
   99A7 28 07         [12] 3149 	jr	Z,00114$
                           3150 ;src/main.c:813: redibujarEnemigo(actual);
   99A9 C5            [11] 3151 	push	bc
   99AA C5            [11] 3152 	push	bc
   99AB CD 4E 8D      [17] 3153 	call	_redibujarEnemigo
   99AE F1            [10] 3154 	pop	af
   99AF C1            [10] 3155 	pop	bc
   99B0                    3156 00114$:
                           3157 ;src/main.c:815: if (actual->muerto && actual->muertes == 0){
   99B0 C5            [11] 3158 	push	bc
   99B1 FD E1         [14] 3159 	pop	iy
   99B3 FD 7E 08      [19] 3160 	ld	a,8 (iy)
   99B6 B7            [ 4] 3161 	or	a, a
   99B7 28 22         [12] 3162 	jr	Z,00116$
   99B9 21 0B 00      [10] 3163 	ld	hl,#0x000B
   99BC 09            [11] 3164 	add	hl,bc
   99BD 7E            [ 7] 3165 	ld	a,(hl)
   99BE B7            [ 4] 3166 	or	a, a
   99BF 20 1A         [12] 3167 	jr	NZ,00116$
                           3168 ;src/main.c:816: borrarEnemigo(actual);
   99C1 E5            [11] 3169 	push	hl
   99C2 C5            [11] 3170 	push	bc
   99C3 C5            [11] 3171 	push	bc
   99C4 CD BA 8C      [17] 3172 	call	_borrarEnemigo
   99C7 F1            [10] 3173 	pop	af
   99C8 C1            [10] 3174 	pop	bc
   99C9 C5            [11] 3175 	push	bc
   99CA C5            [11] 3176 	push	bc
   99CB CD 12 8C      [17] 3177 	call	_dibujarExplosion
   99CE F1            [10] 3178 	pop	af
   99CF C1            [10] 3179 	pop	bc
   99D0 E1            [10] 3180 	pop	hl
                           3181 ;src/main.c:819: actual->muertes++;
   99D1 5E            [ 7] 3182 	ld	e,(hl)
   99D2 1C            [ 4] 3183 	inc	e
   99D3 73            [ 7] 3184 	ld	(hl),e
                           3185 ;src/main.c:820: actual->x = 0;
   99D4 AF            [ 4] 3186 	xor	a, a
   99D5 02            [ 7] 3187 	ld	(bc),a
                           3188 ;src/main.c:821: actual->y = 0;
   99D6 59            [ 4] 3189 	ld	e, c
   99D7 50            [ 4] 3190 	ld	d, b
   99D8 13            [ 6] 3191 	inc	de
   99D9 AF            [ 4] 3192 	xor	a, a
   99DA 12            [ 7] 3193 	ld	(de),a
   99DB                    3194 00116$:
                           3195 ;src/main.c:823: ++actual;
   99DB 21 0C 00      [10] 3196 	ld	hl,#0x000C
   99DE 09            [11] 3197 	add	hl,bc
   99DF 4D            [ 4] 3198 	ld	c,l
   99E0 44            [ 4] 3199 	ld	b,h
   99E1 18 B4         [12] 3200 	jr	00118$
   99E3                    3201 00120$:
                           3202 ;src/main.c:825: cpct_waitVSYNC();
   99E3 CD 04 7F      [17] 3203 	call	_cpct_waitVSYNC
   99E6 C3 2F 99      [10] 3204 	jp	00122$
   99E9 33            [ 6] 3205 	inc	sp
   99EA DD E1         [14] 3206 	pop	ix
   99EC C9            [10] 3207 	ret
                           3208 	.area _CODE
                           3209 	.area _INITIALIZER
                           3210 	.area _CABS (ABS)
   3F00                    3211 	.org 0x3F00
   3F00                    3212 _G_song:
   3F00 41                 3213 	.db #0x41	; 65	'A'
   3F01 54                 3214 	.db #0x54	; 84	'T'
   3F02 31                 3215 	.db #0x31	; 49	'1'
   3F03 30                 3216 	.db #0x30	; 48	'0'
   3F04 01                 3217 	.db #0x01	; 1
   3F05 40                 3218 	.db #0x40	; 64
   3F06 42                 3219 	.db #0x42	; 66	'B'
   3F07 0F                 3220 	.db #0x0F	; 15
   3F08 02                 3221 	.db #0x02	; 2
   3F09 06                 3222 	.db #0x06	; 6
   3F0A 1D                 3223 	.db #0x1D	; 29
   3F0B 00                 3224 	.db #0x00	; 0
   3F0C 10                 3225 	.db #0x10	; 16
   3F0D 40                 3226 	.db #0x40	; 64
   3F0E 19                 3227 	.db #0x19	; 25
   3F0F 40                 3228 	.db #0x40	; 64
   3F10 00                 3229 	.db #0x00	; 0
   3F11 00                 3230 	.db #0x00	; 0
   3F12 00                 3231 	.db #0x00	; 0
   3F13 00                 3232 	.db #0x00	; 0
   3F14 00                 3233 	.db #0x00	; 0
   3F15 00                 3234 	.db #0x00	; 0
   3F16 0D                 3235 	.db #0x0D	; 13
   3F17 12                 3236 	.db #0x12	; 18
   3F18 40                 3237 	.db #0x40	; 64
   3F19 01                 3238 	.db #0x01	; 1
   3F1A 00                 3239 	.db #0x00	; 0
   3F1B 7C                 3240 	.db #0x7C	; 124
   3F1C 18                 3241 	.db #0x18	; 24
   3F1D 78                 3242 	.db #0x78	; 120	'x'
   3F1E 0C                 3243 	.db #0x0C	; 12
   3F1F 34                 3244 	.db #0x34	; 52	'4'
   3F20 30                 3245 	.db #0x30	; 48	'0'
   3F21 2C                 3246 	.db #0x2C	; 44
   3F22 28                 3247 	.db #0x28	; 40
   3F23 24                 3248 	.db #0x24	; 36
   3F24 20                 3249 	.db #0x20	; 32
   3F25 1C                 3250 	.db #0x1C	; 28
   3F26 0D                 3251 	.db #0x0D	; 13
   3F27 25                 3252 	.db #0x25	; 37
   3F28 40                 3253 	.db #0x40	; 64
   3F29 20                 3254 	.db #0x20	; 32
   3F2A 00                 3255 	.db #0x00	; 0
   3F2B 00                 3256 	.db #0x00	; 0
   3F2C 00                 3257 	.db #0x00	; 0
   3F2D 39                 3258 	.db #0x39	; 57	'9'
   3F2E 40                 3259 	.db #0x40	; 64
   3F2F 00                 3260 	.db #0x00	; 0
   3F30 57                 3261 	.db #0x57	; 87	'W'
   3F31 40                 3262 	.db #0x40	; 64
   3F32 3B                 3263 	.db #0x3B	; 59
   3F33 40                 3264 	.db #0x40	; 64
   3F34 57                 3265 	.db #0x57	; 87	'W'
   3F35 40                 3266 	.db #0x40	; 64
   3F36 01                 3267 	.db #0x01	; 1
   3F37 2F                 3268 	.db #0x2F	; 47
   3F38 40                 3269 	.db #0x40	; 64
   3F39 19                 3270 	.db #0x19	; 25
   3F3A 00                 3271 	.db #0x00	; 0
   3F3B 76                 3272 	.db #0x76	; 118	'v'
   3F3C E1                 3273 	.db #0xE1	; 225
   3F3D 00                 3274 	.db #0x00	; 0
   3F3E 00                 3275 	.db #0x00	; 0
   3F3F 01                 3276 	.db #0x01	; 1
   3F40 04                 3277 	.db #0x04	; 4
   3F41 51                 3278 	.db #0x51	; 81	'Q'
   3F42 04                 3279 	.db #0x04	; 4
   3F43 37                 3280 	.db #0x37	; 55	'7'
   3F44 04                 3281 	.db #0x04	; 4
   3F45 4F                 3282 	.db #0x4F	; 79	'O'
   3F46 04                 3283 	.db #0x04	; 4
   3F47 37                 3284 	.db #0x37	; 55	'7'
   3F48 02                 3285 	.db #0x02	; 2
   3F49 4B                 3286 	.db #0x4B	; 75	'K'
   3F4A 02                 3287 	.db #0x02	; 2
   3F4B 37                 3288 	.db #0x37	; 55	'7'
   3F4C 04                 3289 	.db #0x04	; 4
   3F4D 4F                 3290 	.db #0x4F	; 79	'O'
   3F4E 04                 3291 	.db #0x04	; 4
   3F4F 37                 3292 	.db #0x37	; 55	'7'
   3F50 04                 3293 	.db #0x04	; 4
   3F51 4F                 3294 	.db #0x4F	; 79	'O'
   3F52 04                 3295 	.db #0x04	; 4
   3F53 37                 3296 	.db #0x37	; 55	'7'
   3F54 02                 3297 	.db #0x02	; 2
   3F55 4B                 3298 	.db #0x4B	; 75	'K'
   3F56 00                 3299 	.db #0x00	; 0
   3F57 42                 3300 	.db #0x42	; 66	'B'
   3F58 60                 3301 	.db #0x60	; 96
   3F59 00                 3302 	.db #0x00	; 0
   3F5A 42                 3303 	.db #0x42	; 66	'B'
   3F5B 80                 3304 	.db #0x80	; 128
   3F5C 00                 3305 	.db #0x00	; 0
   3F5D 00                 3306 	.db #0x00	; 0
   3F5E 42                 3307 	.db #0x42	; 66	'B'
   3F5F 00                 3308 	.db #0x00	; 0
   3F60 00                 3309 	.db #0x00	; 0
