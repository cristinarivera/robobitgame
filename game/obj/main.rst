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
                             33 	.globl _moverEnemigoAbajo
                             34 	.globl _moverEnemigoArriba
                             35 	.globl _checkEnemyCollision
                             36 	.globl _redibujarEnemigo
                             37 	.globl _borrarEnemigo
                             38 	.globl _borrarExplosion
                             39 	.globl _dibujarExplosion
                             40 	.globl _dibujarEnemigo
                             41 	.globl _checkCollision
                             42 	.globl _getTilePtr
                             43 	.globl _redibujarProta
                             44 	.globl _menuFin
                             45 	.globl _borrarProta
                             46 	.globl _dibujarProta
                             47 	.globl _dibujarMapa
                             48 	.globl _cpct_etm_setTileset2x4
                             49 	.globl _cpct_etm_drawTileBox2x4
                             50 	.globl _cpct_getRandom_mxor_u8
                             51 	.globl _cpct_akp_musicPlay
                             52 	.globl _cpct_akp_musicInit
                             53 	.globl _cpct_getScreenPtr
                             54 	.globl _cpct_setPALColour
                             55 	.globl _cpct_setPalette
                             56 	.globl _cpct_waitVSYNC
                             57 	.globl _cpct_setVideoMode
                             58 	.globl _cpct_drawStringM0
                             59 	.globl _cpct_drawSpriteMaskedAlignedTable
                             60 	.globl _cpct_drawSolidBox
                             61 	.globl _cpct_drawSprite
                             62 	.globl _cpct_isAnyKeyPressed
                             63 	.globl _cpct_isKeyPressed
                             64 	.globl _cpct_scanKeyboard_if
                             65 	.globl _cpct_scanKeyboard_f
                             66 	.globl _cpct_memset
                             67 	.globl _cpct_disableFirmware
                             68 	.globl _num_mapa
                             69 	.globl _mapa
                             70 	.globl _cu
                             71 	.globl _prota
                             72 	.globl _enemy
                             73 	.globl _EEje
                             74 	.globl _EMirar
                             75 	.globl _spawnY
                             76 	.globl _spawnX
                             77 	.globl _mapas
                             78 ;--------------------------------------------------------
                             79 ; special function registers
                             80 ;--------------------------------------------------------
                             81 ;--------------------------------------------------------
                             82 ; ram data
                             83 ;--------------------------------------------------------
                             84 	.area _DATA
   88F2                      85 _EMirar::
   88F2                      86 	.ds 1
   88F3                      87 _EEje::
   88F3                      88 	.ds 1
   88F4                      89 _enemy::
   88F4                      90 	.ds 48
   8924                      91 _prota::
   8924                      92 	.ds 8
   892C                      93 _cu::
   892C                      94 	.ds 10
   8936                      95 _mapa::
   8936                      96 	.ds 2
   8938                      97 _num_mapa::
   8938                      98 	.ds 1
                             99 ;--------------------------------------------------------
                            100 ; ram data
                            101 ;--------------------------------------------------------
                            102 	.area _INITIALIZED
                            103 ;--------------------------------------------------------
                            104 ; absolute external ram data
                            105 ;--------------------------------------------------------
                            106 	.area _DABS (ABS)
                            107 ;--------------------------------------------------------
                            108 ; global & static initialisations
                            109 ;--------------------------------------------------------
                            110 	.area _HOME
                            111 	.area _GSINIT
                            112 	.area _GSFINAL
                            113 	.area _GSINIT
                            114 ;--------------------------------------------------------
                            115 ; Home
                            116 ;--------------------------------------------------------
                            117 	.area _HOME
                            118 	.area _HOME
                            119 ;--------------------------------------------------------
                            120 ; code
                            121 ;--------------------------------------------------------
                            122 	.area _CODE
                            123 ;src/main.c:120: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
                            124 ;	---------------------------------
                            125 ; Function dummy_cpct_transparentMaskTable0M0_container
                            126 ; ---------------------------------
   7B42                     127 _dummy_cpct_transparentMaskTable0M0_container::
                            128 	.area _g_tablatrans_ (ABS) 
   3E00                     129 	.org 0x3E00 
   3E00                     130 	 _g_tablatrans::
   3E00 FF AA 55 00 AA AA   131 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E08 55 00 55 00 00 00   132 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E10 AA AA 00 00 AA AA   133 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E18 00 00 00 00 00 00   134 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E20 55 00 55 00 00 00   135 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E28 55 00 55 00 00 00   136 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E30 00 00 00 00 00 00   137 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E38 00 00 00 00 00 00   138 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E40 AA AA 00 00 AA AA   139 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E48 00 00 00 00 00 00   140 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E50 AA AA 00 00 AA AA   141 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E58 00 00 00 00 00 00   142 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E60 00 00 00 00 00 00   143 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E68 00 00 00 00 00 00   144 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E70 00 00 00 00 00 00   145 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E78 00 00 00 00 00 00   146 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E80 55 00 55 00 00 00   147 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E88 55 00 55 00 00 00   148 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E90 00 00 00 00 00 00   149 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E98 00 00 00 00 00 00   150 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA0 55 00 55 00 00 00   151 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA8 55 00 55 00 00 00   152 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB0 00 00 00 00 00 00   153 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB8 00 00 00 00 00 00   154 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC0 00 00 00 00 00 00   155 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC8 00 00 00 00 00 00   156 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED0 00 00 00 00 00 00   157 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED8 00 00 00 00 00 00   158 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE0 00 00 00 00 00 00   159 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE8 00 00 00 00 00 00   160 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF0 00 00 00 00 00 00   161 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF8 00 00 00 00 00 00   162 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            163 	.area _CSEG (REL, CON) 
                            164 ;src/main.c:123: void dibujarMapa() {
                            165 ;	---------------------------------
                            166 ; Function dibujarMapa
                            167 ; ---------------------------------
   8939                     168 _dibujarMapa::
                            169 ;src/main.c:124: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   8939 2A 36 89      [16]  170 	ld	hl,(_mapa)
   893C E5            [11]  171 	push	hl
   893D 21 F0 C0      [10]  172 	ld	hl,#0xC0F0
   8940 E5            [11]  173 	push	hl
   8941 21 2C 28      [10]  174 	ld	hl,#0x282C
   8944 E5            [11]  175 	push	hl
   8945 2E 00         [ 7]  176 	ld	l, #0x00
   8947 E5            [11]  177 	push	hl
   8948 AF            [ 4]  178 	xor	a, a
   8949 F5            [11]  179 	push	af
   894A 33            [ 6]  180 	inc	sp
   894B CD 44 7D      [17]  181 	call	_cpct_etm_drawTileBox2x4
   894E C9            [10]  182 	ret
   894F                     183 _mapas:
   894F C0 4D               184 	.dw _g_map1
   8951 E0 46               185 	.dw _g_map2
   8953 00 40               186 	.dw _g_map3
   8955                     187 _spawnX:
   8955 00                  188 	.db #0x00	; 0
   8956 28                  189 	.db #0x28	; 40
   8957 47                  190 	.db #0x47	; 71	'G'
   8958 14                  191 	.db #0x14	; 20
   8959 3C                  192 	.db #0x3C	; 60
   895A                     193 _spawnY:
   895A 18                  194 	.db #0x18	; 24
   895B 2C                  195 	.db #0x2C	; 44
   895C 72                  196 	.db #0x72	; 114	'r'
   895D 8A                  197 	.db #0x8A	; 138
   895E 8A                  198 	.db #0x8A	; 138
                            199 ;src/main.c:129: void dibujarProta() {
                            200 ;	---------------------------------
                            201 ; Function dibujarProta
                            202 ; ---------------------------------
   895F                     203 _dibujarProta::
                            204 ;src/main.c:130: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   895F 21 25 89      [10]  205 	ld	hl, #_prota + 1
   8962 56            [ 7]  206 	ld	d,(hl)
   8963 21 24 89      [10]  207 	ld	hl, #_prota + 0
   8966 46            [ 7]  208 	ld	b,(hl)
   8967 D5            [11]  209 	push	de
   8968 33            [ 6]  210 	inc	sp
   8969 C5            [11]  211 	push	bc
   896A 33            [ 6]  212 	inc	sp
   896B 21 00 C0      [10]  213 	ld	hl,#0xC000
   896E E5            [11]  214 	push	hl
   896F CD 70 88      [17]  215 	call	_cpct_getScreenPtr
   8972 EB            [ 4]  216 	ex	de,hl
                            217 ;src/main.c:131: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   8973 ED 4B 28 89   [20]  218 	ld	bc, (#_prota + 4)
   8977 21 00 3E      [10]  219 	ld	hl,#_g_tablatrans
   897A E5            [11]  220 	push	hl
   897B 21 07 16      [10]  221 	ld	hl,#0x1607
   897E E5            [11]  222 	push	hl
   897F D5            [11]  223 	push	de
   8980 C5            [11]  224 	push	bc
   8981 CD 90 88      [17]  225 	call	_cpct_drawSpriteMaskedAlignedTable
   8984 C9            [10]  226 	ret
                            227 ;src/main.c:134: void borrarProta() {
                            228 ;	---------------------------------
                            229 ; Function borrarProta
                            230 ; ---------------------------------
   8985                     231 _borrarProta::
   8985 DD E5         [15]  232 	push	ix
   8987 DD 21 00 00   [14]  233 	ld	ix,#0
   898B DD 39         [15]  234 	add	ix,sp
   898D F5            [11]  235 	push	af
   898E 3B            [ 6]  236 	dec	sp
                            237 ;src/main.c:136: u8 w = 4 + (prota.px & 1);
   898F 21 26 89      [10]  238 	ld	hl, #_prota + 2
   8992 4E            [ 7]  239 	ld	c,(hl)
   8993 79            [ 4]  240 	ld	a,c
   8994 E6 01         [ 7]  241 	and	a, #0x01
   8996 47            [ 4]  242 	ld	b,a
   8997 04            [ 4]  243 	inc	b
   8998 04            [ 4]  244 	inc	b
   8999 04            [ 4]  245 	inc	b
   899A 04            [ 4]  246 	inc	b
                            247 ;src/main.c:139: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   899B 21 27 89      [10]  248 	ld	hl, #_prota + 3
   899E 5E            [ 7]  249 	ld	e,(hl)
   899F CB 4B         [ 8]  250 	bit	1, e
   89A1 28 04         [12]  251 	jr	Z,00103$
   89A3 3E 01         [ 7]  252 	ld	a,#0x01
   89A5 18 02         [12]  253 	jr	00104$
   89A7                     254 00103$:
   89A7 3E 00         [ 7]  255 	ld	a,#0x00
   89A9                     256 00104$:
   89A9 C6 06         [ 7]  257 	add	a, #0x06
   89AB DD 77 FD      [19]  258 	ld	-3 (ix),a
                            259 ;src/main.c:141: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   89AE FD 2A 36 89   [20]  260 	ld	iy,(_mapa)
   89B2 16 00         [ 7]  261 	ld	d,#0x00
   89B4 7B            [ 4]  262 	ld	a,e
   89B5 C6 E8         [ 7]  263 	add	a,#0xE8
   89B7 DD 77 FE      [19]  264 	ld	-2 (ix),a
   89BA 7A            [ 4]  265 	ld	a,d
   89BB CE FF         [ 7]  266 	adc	a,#0xFF
   89BD DD 77 FF      [19]  267 	ld	-1 (ix),a
   89C0 DD 6E FE      [19]  268 	ld	l,-2 (ix)
   89C3 DD 66 FF      [19]  269 	ld	h,-1 (ix)
   89C6 DD CB FF 7E   [20]  270 	bit	7, -1 (ix)
   89CA 28 04         [12]  271 	jr	Z,00105$
   89CC 21 EB FF      [10]  272 	ld	hl,#0xFFEB
   89CF 19            [11]  273 	add	hl,de
   89D0                     274 00105$:
   89D0 CB 2C         [ 8]  275 	sra	h
   89D2 CB 1D         [ 8]  276 	rr	l
   89D4 CB 2C         [ 8]  277 	sra	h
   89D6 CB 1D         [ 8]  278 	rr	l
   89D8 55            [ 4]  279 	ld	d,l
   89D9 CB 39         [ 8]  280 	srl	c
   89DB FD E5         [15]  281 	push	iy
   89DD 21 F0 C0      [10]  282 	ld	hl,#0xC0F0
   89E0 E5            [11]  283 	push	hl
   89E1 3E 28         [ 7]  284 	ld	a,#0x28
   89E3 F5            [11]  285 	push	af
   89E4 33            [ 6]  286 	inc	sp
   89E5 DD 7E FD      [19]  287 	ld	a,-3 (ix)
   89E8 F5            [11]  288 	push	af
   89E9 33            [ 6]  289 	inc	sp
   89EA C5            [11]  290 	push	bc
   89EB 33            [ 6]  291 	inc	sp
   89EC D5            [11]  292 	push	de
   89ED 33            [ 6]  293 	inc	sp
   89EE 79            [ 4]  294 	ld	a,c
   89EF F5            [11]  295 	push	af
   89F0 33            [ 6]  296 	inc	sp
   89F1 CD 44 7D      [17]  297 	call	_cpct_etm_drawTileBox2x4
   89F4 DD F9         [10]  298 	ld	sp, ix
   89F6 DD E1         [14]  299 	pop	ix
   89F8 C9            [10]  300 	ret
                            301 ;src/main.c:144: void menuFin(){
                            302 ;	---------------------------------
                            303 ; Function menuFin
                            304 ; ---------------------------------
   89F9                     305 _menuFin::
                            306 ;src/main.c:147: cpct_clearScreen(0);
   89F9 21 00 40      [10]  307 	ld	hl,#0x4000
   89FC E5            [11]  308 	push	hl
   89FD AF            [ 4]  309 	xor	a, a
   89FE F5            [11]  310 	push	af
   89FF 33            [ 6]  311 	inc	sp
   8A00 26 C0         [ 7]  312 	ld	h, #0xC0
   8A02 E5            [11]  313 	push	hl
   8A03 CD 2A 7F      [17]  314 	call	_cpct_memset
                            315 ;src/main.c:149: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   8A06 21 18 5A      [10]  316 	ld	hl,#0x5A18
   8A09 E5            [11]  317 	push	hl
   8A0A 21 00 C0      [10]  318 	ld	hl,#0xC000
   8A0D E5            [11]  319 	push	hl
   8A0E CD 70 88      [17]  320 	call	_cpct_getScreenPtr
   8A11 4D            [ 4]  321 	ld	c,l
   8A12 44            [ 4]  322 	ld	b,h
                            323 ;src/main.c:150: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   8A13 21 02 00      [10]  324 	ld	hl,#0x0002
   8A16 E5            [11]  325 	push	hl
   8A17 C5            [11]  326 	push	bc
   8A18 21 26 8A      [10]  327 	ld	hl,#___str_0
   8A1B E5            [11]  328 	push	hl
   8A1C CD 7B 7C      [17]  329 	call	_cpct_drawStringM0
   8A1F 21 06 00      [10]  330 	ld	hl,#6
   8A22 39            [11]  331 	add	hl,sp
   8A23 F9            [ 6]  332 	ld	sp,hl
                            333 ;src/main.c:152: while(1){}
   8A24                     334 00102$:
   8A24 18 FE         [12]  335 	jr	00102$
   8A26                     336 ___str_0:
   8A26 47 41 4D 45 20 4F   337 	.ascii "GAME OVER"
        56 45 52
   8A2F 00                  338 	.db 0x00
                            339 ;src/main.c:155: void redibujarProta() {
                            340 ;	---------------------------------
                            341 ; Function redibujarProta
                            342 ; ---------------------------------
   8A30                     343 _redibujarProta::
                            344 ;src/main.c:156: borrarProta();
   8A30 CD 85 89      [17]  345 	call	_borrarProta
                            346 ;src/main.c:157: prota.px = prota.x;
   8A33 01 26 89      [10]  347 	ld	bc,#_prota + 2
   8A36 3A 24 89      [13]  348 	ld	a, (#_prota + 0)
   8A39 02            [ 7]  349 	ld	(bc),a
                            350 ;src/main.c:158: prota.py = prota.y;
   8A3A 01 27 89      [10]  351 	ld	bc,#_prota + 3
   8A3D 3A 25 89      [13]  352 	ld	a, (#_prota + 1)
   8A40 02            [ 7]  353 	ld	(bc),a
                            354 ;src/main.c:159: dibujarProta();
   8A41 C3 5F 89      [10]  355 	jp  _dibujarProta
                            356 ;src/main.c:162: u8* getTilePtr(u8 x, u8 y) {
                            357 ;	---------------------------------
                            358 ; Function getTilePtr
                            359 ; ---------------------------------
   8A44                     360 _getTilePtr::
   8A44 DD E5         [15]  361 	push	ix
   8A46 DD 21 00 00   [14]  362 	ld	ix,#0
   8A4A DD 39         [15]  363 	add	ix,sp
                            364 ;src/main.c:163: return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
   8A4C DD 4E 05      [19]  365 	ld	c,5 (ix)
   8A4F 06 00         [ 7]  366 	ld	b,#0x00
   8A51 79            [ 4]  367 	ld	a,c
   8A52 C6 E8         [ 7]  368 	add	a,#0xE8
   8A54 5F            [ 4]  369 	ld	e,a
   8A55 78            [ 4]  370 	ld	a,b
   8A56 CE FF         [ 7]  371 	adc	a,#0xFF
   8A58 57            [ 4]  372 	ld	d,a
   8A59 6B            [ 4]  373 	ld	l, e
   8A5A 62            [ 4]  374 	ld	h, d
   8A5B CB 7A         [ 8]  375 	bit	7, d
   8A5D 28 04         [12]  376 	jr	Z,00103$
   8A5F 21 EB FF      [10]  377 	ld	hl,#0xFFEB
   8A62 09            [11]  378 	add	hl,bc
   8A63                     379 00103$:
   8A63 CB 2C         [ 8]  380 	sra	h
   8A65 CB 1D         [ 8]  381 	rr	l
   8A67 CB 2C         [ 8]  382 	sra	h
   8A69 CB 1D         [ 8]  383 	rr	l
   8A6B 4D            [ 4]  384 	ld	c, l
   8A6C 44            [ 4]  385 	ld	b, h
   8A6D 29            [11]  386 	add	hl, hl
   8A6E 29            [11]  387 	add	hl, hl
   8A6F 09            [11]  388 	add	hl, bc
   8A70 29            [11]  389 	add	hl, hl
   8A71 29            [11]  390 	add	hl, hl
   8A72 29            [11]  391 	add	hl, hl
   8A73 4D            [ 4]  392 	ld	c,l
   8A74 44            [ 4]  393 	ld	b,h
   8A75 2A 36 89      [16]  394 	ld	hl,(_mapa)
   8A78 09            [11]  395 	add	hl,bc
   8A79 DD 4E 04      [19]  396 	ld	c,4 (ix)
   8A7C CB 39         [ 8]  397 	srl	c
   8A7E 59            [ 4]  398 	ld	e,c
   8A7F 16 00         [ 7]  399 	ld	d,#0x00
   8A81 19            [11]  400 	add	hl,de
   8A82 DD E1         [14]  401 	pop	ix
   8A84 C9            [10]  402 	ret
                            403 ;src/main.c:166: u8 checkCollision(int direction) { // check optimization
                            404 ;	---------------------------------
                            405 ; Function checkCollision
                            406 ; ---------------------------------
   8A85                     407 _checkCollision::
   8A85 DD E5         [15]  408 	push	ix
   8A87 DD 21 00 00   [14]  409 	ld	ix,#0
   8A8B DD 39         [15]  410 	add	ix,sp
   8A8D F5            [11]  411 	push	af
                            412 ;src/main.c:167: u8 *headTile=0, *feetTile=0, *waistTile=0;
   8A8E 21 00 00      [10]  413 	ld	hl,#0x0000
   8A91 E3            [19]  414 	ex	(sp), hl
   8A92 11 00 00      [10]  415 	ld	de,#0x0000
   8A95 01 00 00      [10]  416 	ld	bc,#0x0000
                            417 ;src/main.c:169: switch (direction) {
   8A98 DD CB 05 7E   [20]  418 	bit	7, 5 (ix)
   8A9C C2 B9 8B      [10]  419 	jp	NZ,00105$
   8A9F 3E 03         [ 7]  420 	ld	a,#0x03
   8AA1 DD BE 04      [19]  421 	cp	a, 4 (ix)
   8AA4 3E 00         [ 7]  422 	ld	a,#0x00
   8AA6 DD 9E 05      [19]  423 	sbc	a, 5 (ix)
   8AA9 E2 AE 8A      [10]  424 	jp	PO, 00128$
   8AAC EE 80         [ 7]  425 	xor	a, #0x80
   8AAE                     426 00128$:
   8AAE FA B9 8B      [10]  427 	jp	M,00105$
   8AB1 DD 5E 04      [19]  428 	ld	e,4 (ix)
   8AB4 16 00         [ 7]  429 	ld	d,#0x00
   8AB6 21 BD 8A      [10]  430 	ld	hl,#00129$
   8AB9 19            [11]  431 	add	hl,de
   8ABA 19            [11]  432 	add	hl,de
   8ABB 19            [11]  433 	add	hl,de
   8ABC E9            [ 4]  434 	jp	(hl)
   8ABD                     435 00129$:
   8ABD C3 C9 8A      [10]  436 	jp	00101$
   8AC0 C3 14 8B      [10]  437 	jp	00102$
   8AC3 C3 55 8B      [10]  438 	jp	00103$
   8AC6 C3 88 8B      [10]  439 	jp	00104$
                            440 ;src/main.c:170: case 0:
   8AC9                     441 00101$:
                            442 ;src/main.c:171: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   8AC9 21 25 89      [10]  443 	ld	hl, #(_prota + 0x0001) + 0
   8ACC 5E            [ 7]  444 	ld	e,(hl)
   8ACD 21 24 89      [10]  445 	ld	hl, #_prota + 0
   8AD0 4E            [ 7]  446 	ld	c,(hl)
   8AD1 0C            [ 4]  447 	inc	c
   8AD2 0C            [ 4]  448 	inc	c
   8AD3 0C            [ 4]  449 	inc	c
   8AD4 0C            [ 4]  450 	inc	c
   8AD5 7B            [ 4]  451 	ld	a,e
   8AD6 F5            [11]  452 	push	af
   8AD7 33            [ 6]  453 	inc	sp
   8AD8 79            [ 4]  454 	ld	a,c
   8AD9 F5            [11]  455 	push	af
   8ADA 33            [ 6]  456 	inc	sp
   8ADB CD 44 8A      [17]  457 	call	_getTilePtr
   8ADE F1            [10]  458 	pop	af
   8ADF 33            [ 6]  459 	inc	sp
   8AE0 33            [ 6]  460 	inc	sp
   8AE1 E5            [11]  461 	push	hl
                            462 ;src/main.c:172: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   8AE2 3A 25 89      [13]  463 	ld	a, (#(_prota + 0x0001) + 0)
   8AE5 C6 14         [ 7]  464 	add	a, #0x14
   8AE7 4F            [ 4]  465 	ld	c,a
   8AE8 21 24 89      [10]  466 	ld	hl, #_prota + 0
   8AEB 46            [ 7]  467 	ld	b,(hl)
   8AEC 04            [ 4]  468 	inc	b
   8AED 04            [ 4]  469 	inc	b
   8AEE 04            [ 4]  470 	inc	b
   8AEF 04            [ 4]  471 	inc	b
   8AF0 79            [ 4]  472 	ld	a,c
   8AF1 F5            [11]  473 	push	af
   8AF2 33            [ 6]  474 	inc	sp
   8AF3 C5            [11]  475 	push	bc
   8AF4 33            [ 6]  476 	inc	sp
   8AF5 CD 44 8A      [17]  477 	call	_getTilePtr
   8AF8 F1            [10]  478 	pop	af
   8AF9 EB            [ 4]  479 	ex	de,hl
                            480 ;src/main.c:173: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   8AFA 3A 25 89      [13]  481 	ld	a, (#(_prota + 0x0001) + 0)
   8AFD C6 0B         [ 7]  482 	add	a, #0x0B
   8AFF 47            [ 4]  483 	ld	b,a
   8B00 3A 24 89      [13]  484 	ld	a, (#_prota + 0)
   8B03 C6 04         [ 7]  485 	add	a, #0x04
   8B05 D5            [11]  486 	push	de
   8B06 C5            [11]  487 	push	bc
   8B07 33            [ 6]  488 	inc	sp
   8B08 F5            [11]  489 	push	af
   8B09 33            [ 6]  490 	inc	sp
   8B0A CD 44 8A      [17]  491 	call	_getTilePtr
   8B0D F1            [10]  492 	pop	af
   8B0E 4D            [ 4]  493 	ld	c,l
   8B0F 44            [ 4]  494 	ld	b,h
   8B10 D1            [10]  495 	pop	de
                            496 ;src/main.c:174: break;
   8B11 C3 B9 8B      [10]  497 	jp	00105$
                            498 ;src/main.c:175: case 1:
   8B14                     499 00102$:
                            500 ;src/main.c:176: headTile  = getTilePtr(prota.x - 1, prota.y);
   8B14 21 25 89      [10]  501 	ld	hl, #(_prota + 0x0001) + 0
   8B17 56            [ 7]  502 	ld	d,(hl)
   8B18 21 24 89      [10]  503 	ld	hl, #_prota + 0
   8B1B 46            [ 7]  504 	ld	b,(hl)
   8B1C 05            [ 4]  505 	dec	b
   8B1D D5            [11]  506 	push	de
   8B1E 33            [ 6]  507 	inc	sp
   8B1F C5            [11]  508 	push	bc
   8B20 33            [ 6]  509 	inc	sp
   8B21 CD 44 8A      [17]  510 	call	_getTilePtr
   8B24 F1            [10]  511 	pop	af
   8B25 33            [ 6]  512 	inc	sp
   8B26 33            [ 6]  513 	inc	sp
   8B27 E5            [11]  514 	push	hl
                            515 ;src/main.c:177: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
   8B28 3A 25 89      [13]  516 	ld	a, (#(_prota + 0x0001) + 0)
   8B2B C6 14         [ 7]  517 	add	a, #0x14
   8B2D 57            [ 4]  518 	ld	d,a
   8B2E 21 24 89      [10]  519 	ld	hl, #_prota + 0
   8B31 46            [ 7]  520 	ld	b,(hl)
   8B32 05            [ 4]  521 	dec	b
   8B33 D5            [11]  522 	push	de
   8B34 33            [ 6]  523 	inc	sp
   8B35 C5            [11]  524 	push	bc
   8B36 33            [ 6]  525 	inc	sp
   8B37 CD 44 8A      [17]  526 	call	_getTilePtr
   8B3A F1            [10]  527 	pop	af
   8B3B EB            [ 4]  528 	ex	de,hl
                            529 ;src/main.c:178: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
   8B3C 3A 25 89      [13]  530 	ld	a, (#(_prota + 0x0001) + 0)
   8B3F C6 0B         [ 7]  531 	add	a, #0x0B
   8B41 47            [ 4]  532 	ld	b,a
   8B42 3A 24 89      [13]  533 	ld	a, (#_prota + 0)
   8B45 C6 FF         [ 7]  534 	add	a,#0xFF
   8B47 D5            [11]  535 	push	de
   8B48 C5            [11]  536 	push	bc
   8B49 33            [ 6]  537 	inc	sp
   8B4A F5            [11]  538 	push	af
   8B4B 33            [ 6]  539 	inc	sp
   8B4C CD 44 8A      [17]  540 	call	_getTilePtr
   8B4F F1            [10]  541 	pop	af
   8B50 4D            [ 4]  542 	ld	c,l
   8B51 44            [ 4]  543 	ld	b,h
   8B52 D1            [10]  544 	pop	de
                            545 ;src/main.c:179: break;
   8B53 18 64         [12]  546 	jr	00105$
                            547 ;src/main.c:180: case 2:
   8B55                     548 00103$:
                            549 ;src/main.c:181: headTile   = getTilePtr(prota.x, prota.y - 2);
   8B55 3A 25 89      [13]  550 	ld	a, (#(_prota + 0x0001) + 0)
   8B58 C6 FE         [ 7]  551 	add	a,#0xFE
   8B5A 21 24 89      [10]  552 	ld	hl, #_prota + 0
   8B5D 56            [ 7]  553 	ld	d,(hl)
   8B5E C5            [11]  554 	push	bc
   8B5F F5            [11]  555 	push	af
   8B60 33            [ 6]  556 	inc	sp
   8B61 D5            [11]  557 	push	de
   8B62 33            [ 6]  558 	inc	sp
   8B63 CD 44 8A      [17]  559 	call	_getTilePtr
   8B66 F1            [10]  560 	pop	af
   8B67 C1            [10]  561 	pop	bc
   8B68 33            [ 6]  562 	inc	sp
   8B69 33            [ 6]  563 	inc	sp
   8B6A E5            [11]  564 	push	hl
                            565 ;src/main.c:182: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
   8B6B 21 25 89      [10]  566 	ld	hl, #(_prota + 0x0001) + 0
   8B6E 56            [ 7]  567 	ld	d,(hl)
   8B6F 15            [ 4]  568 	dec	d
   8B70 15            [ 4]  569 	dec	d
   8B71 3A 24 89      [13]  570 	ld	a, (#_prota + 0)
   8B74 C6 03         [ 7]  571 	add	a, #0x03
   8B76 C5            [11]  572 	push	bc
   8B77 D5            [11]  573 	push	de
   8B78 33            [ 6]  574 	inc	sp
   8B79 F5            [11]  575 	push	af
   8B7A 33            [ 6]  576 	inc	sp
   8B7B CD 44 8A      [17]  577 	call	_getTilePtr
   8B7E F1            [10]  578 	pop	af
   8B7F EB            [ 4]  579 	ex	de,hl
   8B80 C1            [10]  580 	pop	bc
                            581 ;src/main.c:183: *waistTile = 0;
   8B81 21 00 00      [10]  582 	ld	hl,#0x0000
   8B84 36 00         [10]  583 	ld	(hl),#0x00
                            584 ;src/main.c:184: break;
   8B86 18 31         [12]  585 	jr	00105$
                            586 ;src/main.c:185: case 3:
   8B88                     587 00104$:
                            588 ;src/main.c:186: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
   8B88 3A 25 89      [13]  589 	ld	a, (#(_prota + 0x0001) + 0)
   8B8B C6 16         [ 7]  590 	add	a, #0x16
   8B8D 21 24 89      [10]  591 	ld	hl, #_prota + 0
   8B90 56            [ 7]  592 	ld	d,(hl)
   8B91 C5            [11]  593 	push	bc
   8B92 F5            [11]  594 	push	af
   8B93 33            [ 6]  595 	inc	sp
   8B94 D5            [11]  596 	push	de
   8B95 33            [ 6]  597 	inc	sp
   8B96 CD 44 8A      [17]  598 	call	_getTilePtr
   8B99 F1            [10]  599 	pop	af
   8B9A C1            [10]  600 	pop	bc
   8B9B 33            [ 6]  601 	inc	sp
   8B9C 33            [ 6]  602 	inc	sp
   8B9D E5            [11]  603 	push	hl
                            604 ;src/main.c:187: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   8B9E 3A 25 89      [13]  605 	ld	a, (#(_prota + 0x0001) + 0)
   8BA1 C6 16         [ 7]  606 	add	a, #0x16
   8BA3 57            [ 4]  607 	ld	d,a
   8BA4 3A 24 89      [13]  608 	ld	a, (#_prota + 0)
   8BA7 C6 03         [ 7]  609 	add	a, #0x03
   8BA9 C5            [11]  610 	push	bc
   8BAA D5            [11]  611 	push	de
   8BAB 33            [ 6]  612 	inc	sp
   8BAC F5            [11]  613 	push	af
   8BAD 33            [ 6]  614 	inc	sp
   8BAE CD 44 8A      [17]  615 	call	_getTilePtr
   8BB1 F1            [10]  616 	pop	af
   8BB2 EB            [ 4]  617 	ex	de,hl
   8BB3 C1            [10]  618 	pop	bc
                            619 ;src/main.c:188: *waistTile = 0;
   8BB4 21 00 00      [10]  620 	ld	hl,#0x0000
   8BB7 36 00         [10]  621 	ld	(hl),#0x00
                            622 ;src/main.c:190: }
   8BB9                     623 00105$:
                            624 ;src/main.c:192: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   8BB9 E1            [10]  625 	pop	hl
   8BBA E5            [11]  626 	push	hl
   8BBB 6E            [ 7]  627 	ld	l,(hl)
   8BBC 3E 02         [ 7]  628 	ld	a,#0x02
   8BBE 95            [ 4]  629 	sub	a, l
   8BBF 38 0E         [12]  630 	jr	C,00106$
   8BC1 1A            [ 7]  631 	ld	a,(de)
   8BC2 5F            [ 4]  632 	ld	e,a
   8BC3 3E 02         [ 7]  633 	ld	a,#0x02
   8BC5 93            [ 4]  634 	sub	a, e
   8BC6 38 07         [12]  635 	jr	C,00106$
   8BC8 0A            [ 7]  636 	ld	a,(bc)
   8BC9 4F            [ 4]  637 	ld	c,a
   8BCA 3E 02         [ 7]  638 	ld	a,#0x02
   8BCC 91            [ 4]  639 	sub	a, c
   8BCD 30 04         [12]  640 	jr	NC,00107$
   8BCF                     641 00106$:
                            642 ;src/main.c:193: return 1;
   8BCF 2E 01         [ 7]  643 	ld	l,#0x01
   8BD1 18 02         [12]  644 	jr	00110$
   8BD3                     645 00107$:
                            646 ;src/main.c:195: return 0;
   8BD3 2E 00         [ 7]  647 	ld	l,#0x00
   8BD5                     648 00110$:
   8BD5 DD F9         [10]  649 	ld	sp, ix
   8BD7 DD E1         [14]  650 	pop	ix
   8BD9 C9            [10]  651 	ret
                            652 ;src/main.c:199: void dibujarEnemigo(TEnemy *enemy) {
                            653 ;	---------------------------------
                            654 ; Function dibujarEnemigo
                            655 ; ---------------------------------
   8BDA                     656 _dibujarEnemigo::
   8BDA DD E5         [15]  657 	push	ix
   8BDC DD 21 00 00   [14]  658 	ld	ix,#0
   8BE0 DD 39         [15]  659 	add	ix,sp
                            660 ;src/main.c:200: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   8BE2 DD 4E 04      [19]  661 	ld	c,4 (ix)
   8BE5 DD 46 05      [19]  662 	ld	b,5 (ix)
   8BE8 69            [ 4]  663 	ld	l, c
   8BE9 60            [ 4]  664 	ld	h, b
   8BEA 23            [ 6]  665 	inc	hl
   8BEB 56            [ 7]  666 	ld	d,(hl)
   8BEC 0A            [ 7]  667 	ld	a,(bc)
   8BED C5            [11]  668 	push	bc
   8BEE D5            [11]  669 	push	de
   8BEF 33            [ 6]  670 	inc	sp
   8BF0 F5            [11]  671 	push	af
   8BF1 33            [ 6]  672 	inc	sp
   8BF2 21 00 C0      [10]  673 	ld	hl,#0xC000
   8BF5 E5            [11]  674 	push	hl
   8BF6 CD 70 88      [17]  675 	call	_cpct_getScreenPtr
   8BF9 EB            [ 4]  676 	ex	de,hl
                            677 ;src/main.c:201: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   8BFA E1            [10]  678 	pop	hl
   8BFB 01 04 00      [10]  679 	ld	bc, #0x0004
   8BFE 09            [11]  680 	add	hl, bc
   8BFF 4E            [ 7]  681 	ld	c,(hl)
   8C00 23            [ 6]  682 	inc	hl
   8C01 46            [ 7]  683 	ld	b,(hl)
   8C02 21 00 3E      [10]  684 	ld	hl,#_g_tablatrans
   8C05 E5            [11]  685 	push	hl
   8C06 21 04 16      [10]  686 	ld	hl,#0x1604
   8C09 E5            [11]  687 	push	hl
   8C0A D5            [11]  688 	push	de
   8C0B C5            [11]  689 	push	bc
   8C0C CD 90 88      [17]  690 	call	_cpct_drawSpriteMaskedAlignedTable
   8C0F DD E1         [14]  691 	pop	ix
   8C11 C9            [10]  692 	ret
                            693 ;src/main.c:204: void dibujarExplosion(TEnemy *enemy) {
                            694 ;	---------------------------------
                            695 ; Function dibujarExplosion
                            696 ; ---------------------------------
   8C12                     697 _dibujarExplosion::
   8C12 DD E5         [15]  698 	push	ix
   8C14 DD 21 00 00   [14]  699 	ld	ix,#0
   8C18 DD 39         [15]  700 	add	ix,sp
                            701 ;src/main.c:205: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   8C1A DD 4E 04      [19]  702 	ld	c,4 (ix)
   8C1D DD 46 05      [19]  703 	ld	b,5 (ix)
   8C20 69            [ 4]  704 	ld	l, c
   8C21 60            [ 4]  705 	ld	h, b
   8C22 23            [ 6]  706 	inc	hl
   8C23 56            [ 7]  707 	ld	d,(hl)
   8C24 0A            [ 7]  708 	ld	a,(bc)
   8C25 47            [ 4]  709 	ld	b,a
   8C26 D5            [11]  710 	push	de
   8C27 33            [ 6]  711 	inc	sp
   8C28 C5            [11]  712 	push	bc
   8C29 33            [ 6]  713 	inc	sp
   8C2A 21 00 C0      [10]  714 	ld	hl,#0xC000
   8C2D E5            [11]  715 	push	hl
   8C2E CD 70 88      [17]  716 	call	_cpct_getScreenPtr
   8C31 4D            [ 4]  717 	ld	c,l
   8C32 44            [ 4]  718 	ld	b,h
                            719 ;src/main.c:206: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   8C33 11 00 3E      [10]  720 	ld	de,#_g_tablatrans+0
   8C36 D5            [11]  721 	push	de
   8C37 21 04 16      [10]  722 	ld	hl,#0x1604
   8C3A E5            [11]  723 	push	hl
   8C3B C5            [11]  724 	push	bc
   8C3C 21 A8 55      [10]  725 	ld	hl,#_g_explosion
   8C3F E5            [11]  726 	push	hl
   8C40 CD 90 88      [17]  727 	call	_cpct_drawSpriteMaskedAlignedTable
   8C43 DD E1         [14]  728 	pop	ix
   8C45 C9            [10]  729 	ret
                            730 ;src/main.c:209: void borrarExplosion() {
                            731 ;	---------------------------------
                            732 ; Function borrarExplosion
                            733 ; ---------------------------------
   8C46                     734 _borrarExplosion::
   8C46 DD E5         [15]  735 	push	ix
   8C48 DD 21 00 00   [14]  736 	ld	ix,#0
   8C4C DD 39         [15]  737 	add	ix,sp
   8C4E F5            [11]  738 	push	af
   8C4F 3B            [ 6]  739 	dec	sp
                            740 ;src/main.c:210: u8 w = 4 + (enemy->px & 1);
   8C50 21 F6 88      [10]  741 	ld	hl, #_enemy + 2
   8C53 4E            [ 7]  742 	ld	c,(hl)
   8C54 79            [ 4]  743 	ld	a,c
   8C55 E6 01         [ 7]  744 	and	a, #0x01
   8C57 47            [ 4]  745 	ld	b,a
   8C58 04            [ 4]  746 	inc	b
   8C59 04            [ 4]  747 	inc	b
   8C5A 04            [ 4]  748 	inc	b
   8C5B 04            [ 4]  749 	inc	b
                            750 ;src/main.c:213: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   8C5C 21 F7 88      [10]  751 	ld	hl, #_enemy + 3
   8C5F 5E            [ 7]  752 	ld	e,(hl)
   8C60 CB 4B         [ 8]  753 	bit	1, e
   8C62 28 04         [12]  754 	jr	Z,00103$
   8C64 3E 01         [ 7]  755 	ld	a,#0x01
   8C66 18 02         [12]  756 	jr	00104$
   8C68                     757 00103$:
   8C68 3E 00         [ 7]  758 	ld	a,#0x00
   8C6A                     759 00104$:
   8C6A C6 07         [ 7]  760 	add	a, #0x07
   8C6C DD 77 FD      [19]  761 	ld	-3 (ix),a
                            762 ;src/main.c:215: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   8C6F FD 2A 36 89   [20]  763 	ld	iy,(_mapa)
   8C73 16 00         [ 7]  764 	ld	d,#0x00
   8C75 7B            [ 4]  765 	ld	a,e
   8C76 C6 E8         [ 7]  766 	add	a,#0xE8
   8C78 DD 77 FE      [19]  767 	ld	-2 (ix),a
   8C7B 7A            [ 4]  768 	ld	a,d
   8C7C CE FF         [ 7]  769 	adc	a,#0xFF
   8C7E DD 77 FF      [19]  770 	ld	-1 (ix),a
   8C81 DD 6E FE      [19]  771 	ld	l,-2 (ix)
   8C84 DD 66 FF      [19]  772 	ld	h,-1 (ix)
   8C87 DD CB FF 7E   [20]  773 	bit	7, -1 (ix)
   8C8B 28 04         [12]  774 	jr	Z,00105$
   8C8D 21 EB FF      [10]  775 	ld	hl,#0xFFEB
   8C90 19            [11]  776 	add	hl,de
   8C91                     777 00105$:
   8C91 CB 2C         [ 8]  778 	sra	h
   8C93 CB 1D         [ 8]  779 	rr	l
   8C95 CB 2C         [ 8]  780 	sra	h
   8C97 CB 1D         [ 8]  781 	rr	l
   8C99 55            [ 4]  782 	ld	d,l
   8C9A CB 39         [ 8]  783 	srl	c
   8C9C FD E5         [15]  784 	push	iy
   8C9E 21 F0 C0      [10]  785 	ld	hl,#0xC0F0
   8CA1 E5            [11]  786 	push	hl
   8CA2 3E 28         [ 7]  787 	ld	a,#0x28
   8CA4 F5            [11]  788 	push	af
   8CA5 33            [ 6]  789 	inc	sp
   8CA6 DD 7E FD      [19]  790 	ld	a,-3 (ix)
   8CA9 F5            [11]  791 	push	af
   8CAA 33            [ 6]  792 	inc	sp
   8CAB C5            [11]  793 	push	bc
   8CAC 33            [ 6]  794 	inc	sp
   8CAD D5            [11]  795 	push	de
   8CAE 33            [ 6]  796 	inc	sp
   8CAF 79            [ 4]  797 	ld	a,c
   8CB0 F5            [11]  798 	push	af
   8CB1 33            [ 6]  799 	inc	sp
   8CB2 CD 44 7D      [17]  800 	call	_cpct_etm_drawTileBox2x4
   8CB5 DD F9         [10]  801 	ld	sp, ix
   8CB7 DD E1         [14]  802 	pop	ix
   8CB9 C9            [10]  803 	ret
                            804 ;src/main.c:219: void borrarEnemigo(TEnemy *enemy) {
                            805 ;	---------------------------------
                            806 ; Function borrarEnemigo
                            807 ; ---------------------------------
   8CBA                     808 _borrarEnemigo::
   8CBA DD E5         [15]  809 	push	ix
   8CBC DD 21 00 00   [14]  810 	ld	ix,#0
   8CC0 DD 39         [15]  811 	add	ix,sp
   8CC2 21 FA FF      [10]  812 	ld	hl,#-6
   8CC5 39            [11]  813 	add	hl,sp
   8CC6 F9            [ 6]  814 	ld	sp,hl
                            815 ;src/main.c:221: u8 w = 4 + (enemy->px & 1);
   8CC7 DD 4E 04      [19]  816 	ld	c,4 (ix)
   8CCA DD 46 05      [19]  817 	ld	b,5 (ix)
   8CCD 69            [ 4]  818 	ld	l, c
   8CCE 60            [ 4]  819 	ld	h, b
   8CCF 23            [ 6]  820 	inc	hl
   8CD0 23            [ 6]  821 	inc	hl
   8CD1 5E            [ 7]  822 	ld	e,(hl)
   8CD2 7B            [ 4]  823 	ld	a,e
   8CD3 E6 01         [ 7]  824 	and	a, #0x01
   8CD5 C6 04         [ 7]  825 	add	a, #0x04
   8CD7 DD 77 FA      [19]  826 	ld	-6 (ix),a
                            827 ;src/main.c:224: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   8CDA 69            [ 4]  828 	ld	l, c
   8CDB 60            [ 4]  829 	ld	h, b
   8CDC 23            [ 6]  830 	inc	hl
   8CDD 23            [ 6]  831 	inc	hl
   8CDE 23            [ 6]  832 	inc	hl
   8CDF 56            [ 7]  833 	ld	d,(hl)
   8CE0 CB 4A         [ 8]  834 	bit	1, d
   8CE2 28 04         [12]  835 	jr	Z,00103$
   8CE4 3E 01         [ 7]  836 	ld	a,#0x01
   8CE6 18 02         [12]  837 	jr	00104$
   8CE8                     838 00103$:
   8CE8 3E 00         [ 7]  839 	ld	a,#0x00
   8CEA                     840 00104$:
   8CEA C6 07         [ 7]  841 	add	a, #0x07
   8CEC DD 77 FB      [19]  842 	ld	-5 (ix),a
                            843 ;src/main.c:226: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   8CEF FD 2A 36 89   [20]  844 	ld	iy,(_mapa)
   8CF3 DD 72 FE      [19]  845 	ld	-2 (ix),d
   8CF6 DD 36 FF 00   [19]  846 	ld	-1 (ix),#0x00
   8CFA DD 7E FE      [19]  847 	ld	a,-2 (ix)
   8CFD C6 E8         [ 7]  848 	add	a,#0xE8
   8CFF DD 77 FC      [19]  849 	ld	-4 (ix),a
   8D02 DD 7E FF      [19]  850 	ld	a,-1 (ix)
   8D05 CE FF         [ 7]  851 	adc	a,#0xFF
   8D07 DD 77 FD      [19]  852 	ld	-3 (ix),a
   8D0A DD 56 FC      [19]  853 	ld	d,-4 (ix)
   8D0D DD 6E FD      [19]  854 	ld	l,-3 (ix)
   8D10 DD CB FD 7E   [20]  855 	bit	7, -3 (ix)
   8D14 28 0C         [12]  856 	jr	Z,00105$
   8D16 DD 7E FE      [19]  857 	ld	a,-2 (ix)
   8D19 C6 EB         [ 7]  858 	add	a, #0xEB
   8D1B 57            [ 4]  859 	ld	d,a
   8D1C DD 7E FF      [19]  860 	ld	a,-1 (ix)
   8D1F CE FF         [ 7]  861 	adc	a, #0xFF
   8D21 6F            [ 4]  862 	ld	l,a
   8D22                     863 00105$:
   8D22 CB 2D         [ 8]  864 	sra	l
   8D24 CB 1A         [ 8]  865 	rr	d
   8D26 CB 2D         [ 8]  866 	sra	l
   8D28 CB 1A         [ 8]  867 	rr	d
   8D2A CB 3B         [ 8]  868 	srl	e
   8D2C C5            [11]  869 	push	bc
   8D2D FD E5         [15]  870 	push	iy
   8D2F 21 F0 C0      [10]  871 	ld	hl,#0xC0F0
   8D32 E5            [11]  872 	push	hl
   8D33 3E 28         [ 7]  873 	ld	a,#0x28
   8D35 F5            [11]  874 	push	af
   8D36 33            [ 6]  875 	inc	sp
   8D37 DD 66 FB      [19]  876 	ld	h,-5 (ix)
   8D3A DD 6E FA      [19]  877 	ld	l,-6 (ix)
   8D3D E5            [11]  878 	push	hl
   8D3E D5            [11]  879 	push	de
   8D3F CD 44 7D      [17]  880 	call	_cpct_etm_drawTileBox2x4
   8D42 C1            [10]  881 	pop	bc
                            882 ;src/main.c:228: enemy->mover = NO;
   8D43 21 06 00      [10]  883 	ld	hl,#0x0006
   8D46 09            [11]  884 	add	hl,bc
   8D47 36 00         [10]  885 	ld	(hl),#0x00
   8D49 DD F9         [10]  886 	ld	sp, ix
   8D4B DD E1         [14]  887 	pop	ix
   8D4D C9            [10]  888 	ret
                            889 ;src/main.c:231: void redibujarEnemigo(TEnemy *enemy) {
                            890 ;	---------------------------------
                            891 ; Function redibujarEnemigo
                            892 ; ---------------------------------
   8D4E                     893 _redibujarEnemigo::
   8D4E DD E5         [15]  894 	push	ix
   8D50 DD 21 00 00   [14]  895 	ld	ix,#0
   8D54 DD 39         [15]  896 	add	ix,sp
                            897 ;src/main.c:232: borrarEnemigo(enemy);
   8D56 DD 6E 04      [19]  898 	ld	l,4 (ix)
   8D59 DD 66 05      [19]  899 	ld	h,5 (ix)
   8D5C E5            [11]  900 	push	hl
   8D5D CD BA 8C      [17]  901 	call	_borrarEnemigo
   8D60 F1            [10]  902 	pop	af
                            903 ;src/main.c:233: enemy->px = enemy->x;
   8D61 DD 4E 04      [19]  904 	ld	c,4 (ix)
   8D64 DD 46 05      [19]  905 	ld	b,5 (ix)
   8D67 59            [ 4]  906 	ld	e, c
   8D68 50            [ 4]  907 	ld	d, b
   8D69 13            [ 6]  908 	inc	de
   8D6A 13            [ 6]  909 	inc	de
   8D6B 0A            [ 7]  910 	ld	a,(bc)
   8D6C 12            [ 7]  911 	ld	(de),a
                            912 ;src/main.c:234: enemy->py = enemy->y;
   8D6D 59            [ 4]  913 	ld	e, c
   8D6E 50            [ 4]  914 	ld	d, b
   8D6F 13            [ 6]  915 	inc	de
   8D70 13            [ 6]  916 	inc	de
   8D71 13            [ 6]  917 	inc	de
   8D72 69            [ 4]  918 	ld	l, c
   8D73 60            [ 4]  919 	ld	h, b
   8D74 23            [ 6]  920 	inc	hl
   8D75 7E            [ 7]  921 	ld	a,(hl)
   8D76 12            [ 7]  922 	ld	(de),a
                            923 ;src/main.c:235: dibujarEnemigo(enemy);
   8D77 C5            [11]  924 	push	bc
   8D78 CD DA 8B      [17]  925 	call	_dibujarEnemigo
   8D7B F1            [10]  926 	pop	af
   8D7C DD E1         [14]  927 	pop	ix
   8D7E C9            [10]  928 	ret
                            929 ;src/main.c:238: u8 checkEnemyCollision(int direction, TEnemy *enemy){
                            930 ;	---------------------------------
                            931 ; Function checkEnemyCollision
                            932 ; ---------------------------------
   8D7F                     933 _checkEnemyCollision::
   8D7F DD E5         [15]  934 	push	ix
   8D81 DD 21 00 00   [14]  935 	ld	ix,#0
   8D85 DD 39         [15]  936 	add	ix,sp
   8D87 21 F7 FF      [10]  937 	ld	hl,#-9
   8D8A 39            [11]  938 	add	hl,sp
   8D8B F9            [ 6]  939 	ld	sp,hl
                            940 ;src/main.c:240: u8 colisiona = 1;
   8D8C DD 36 F7 01   [19]  941 	ld	-9 (ix),#0x01
                            942 ;src/main.c:242: switch (direction) {
   8D90 DD CB 05 7E   [20]  943 	bit	7, 5 (ix)
   8D94 C2 9B 8F      [10]  944 	jp	NZ,00135$
   8D97 3E 03         [ 7]  945 	ld	a,#0x03
   8D99 DD BE 04      [19]  946 	cp	a, 4 (ix)
   8D9C 3E 00         [ 7]  947 	ld	a,#0x00
   8D9E DD 9E 05      [19]  948 	sbc	a, 5 (ix)
   8DA1 E2 A6 8D      [10]  949 	jp	PO, 00194$
   8DA4 EE 80         [ 7]  950 	xor	a, #0x80
   8DA6                     951 00194$:
   8DA6 FA 9B 8F      [10]  952 	jp	M,00135$
                            953 ;src/main.c:250: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   8DA9 DD 4E 06      [19]  954 	ld	c,6 (ix)
   8DAC DD 46 07      [19]  955 	ld	b,7 (ix)
   8DAF 21 01 00      [10]  956 	ld	hl,#0x0001
   8DB2 09            [11]  957 	add	hl,bc
   8DB3 DD 75 FA      [19]  958 	ld	-6 (ix),l
   8DB6 DD 74 FB      [19]  959 	ld	-5 (ix),h
                            960 ;src/main.c:264: enemy->muerto = SI;
   8DB9 21 08 00      [10]  961 	ld	hl,#0x0008
   8DBC 09            [11]  962 	add	hl,bc
   8DBD DD 75 FE      [19]  963 	ld	-2 (ix),l
   8DC0 DD 74 FF      [19]  964 	ld	-1 (ix),h
                            965 ;src/main.c:274: enemy->mira = M_abajo;
   8DC3 21 07 00      [10]  966 	ld	hl,#0x0007
   8DC6 09            [11]  967 	add	hl,bc
   8DC7 DD 75 F8      [19]  968 	ld	-8 (ix),l
   8DCA DD 74 F9      [19]  969 	ld	-7 (ix),h
                            970 ;src/main.c:242: switch (direction) {
   8DCD DD 5E 04      [19]  971 	ld	e,4 (ix)
   8DD0 16 00         [ 7]  972 	ld	d,#0x00
   8DD2 21 D9 8D      [10]  973 	ld	hl,#00195$
   8DD5 19            [11]  974 	add	hl,de
   8DD6 19            [11]  975 	add	hl,de
   8DD7 19            [11]  976 	add	hl,de
   8DD8 E9            [ 4]  977 	jp	(hl)
   8DD9                     978 00195$:
   8DD9 C3 9B 8F      [10]  979 	jp	00135$
   8DDC C3 9B 8F      [10]  980 	jp	00135$
   8DDF C3 EB 8D      [10]  981 	jp	00103$
   8DE2 C3 C1 8E      [10]  982 	jp	00119$
                            983 ;src/main.c:243: case 0:
                            984 ;src/main.c:245: break;
   8DE5 C3 9B 8F      [10]  985 	jp	00135$
                            986 ;src/main.c:246: case 1:
                            987 ;src/main.c:248: break;
   8DE8 C3 9B 8F      [10]  988 	jp	00135$
                            989 ;src/main.c:249: case 2:
   8DEB                     990 00103$:
                            991 ;src/main.c:250: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   8DEB DD 6E FA      [19]  992 	ld	l,-6 (ix)
   8DEE DD 66 FB      [19]  993 	ld	h,-5 (ix)
   8DF1 56            [ 7]  994 	ld	d,(hl)
   8DF2 15            [ 4]  995 	dec	d
   8DF3 15            [ 4]  996 	dec	d
   8DF4 0A            [ 7]  997 	ld	a,(bc)
   8DF5 C5            [11]  998 	push	bc
   8DF6 D5            [11]  999 	push	de
   8DF7 33            [ 6] 1000 	inc	sp
   8DF8 F5            [11] 1001 	push	af
   8DF9 33            [ 6] 1002 	inc	sp
   8DFA CD 44 8A      [17] 1003 	call	_getTilePtr
   8DFD F1            [10] 1004 	pop	af
   8DFE C1            [10] 1005 	pop	bc
   8DFF 5E            [ 7] 1006 	ld	e,(hl)
   8E00 3E 02         [ 7] 1007 	ld	a,#0x02
   8E02 93            [ 4] 1008 	sub	a, e
   8E03 DA B9 8E      [10] 1009 	jp	C,00115$
                           1010 ;src/main.c:251: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   8E06 DD 6E FA      [19] 1011 	ld	l,-6 (ix)
   8E09 DD 66 FB      [19] 1012 	ld	h,-5 (ix)
   8E0C 56            [ 7] 1013 	ld	d,(hl)
   8E0D 15            [ 4] 1014 	dec	d
   8E0E 15            [ 4] 1015 	dec	d
   8E0F 0A            [ 7] 1016 	ld	a,(bc)
   8E10 C6 02         [ 7] 1017 	add	a, #0x02
   8E12 C5            [11] 1018 	push	bc
   8E13 D5            [11] 1019 	push	de
   8E14 33            [ 6] 1020 	inc	sp
   8E15 F5            [11] 1021 	push	af
   8E16 33            [ 6] 1022 	inc	sp
   8E17 CD 44 8A      [17] 1023 	call	_getTilePtr
   8E1A F1            [10] 1024 	pop	af
   8E1B C1            [10] 1025 	pop	bc
   8E1C 5E            [ 7] 1026 	ld	e,(hl)
   8E1D 3E 02         [ 7] 1027 	ld	a,#0x02
   8E1F 93            [ 4] 1028 	sub	a, e
   8E20 DA B9 8E      [10] 1029 	jp	C,00115$
                           1030 ;src/main.c:252: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   8E23 DD 6E FA      [19] 1031 	ld	l,-6 (ix)
   8E26 DD 66 FB      [19] 1032 	ld	h,-5 (ix)
   8E29 56            [ 7] 1033 	ld	d,(hl)
   8E2A 15            [ 4] 1034 	dec	d
   8E2B 15            [ 4] 1035 	dec	d
   8E2C 0A            [ 7] 1036 	ld	a,(bc)
   8E2D C6 04         [ 7] 1037 	add	a, #0x04
   8E2F C5            [11] 1038 	push	bc
   8E30 D5            [11] 1039 	push	de
   8E31 33            [ 6] 1040 	inc	sp
   8E32 F5            [11] 1041 	push	af
   8E33 33            [ 6] 1042 	inc	sp
   8E34 CD 44 8A      [17] 1043 	call	_getTilePtr
   8E37 F1            [10] 1044 	pop	af
   8E38 C1            [10] 1045 	pop	bc
   8E39 5E            [ 7] 1046 	ld	e,(hl)
   8E3A 3E 02         [ 7] 1047 	ld	a,#0x02
   8E3C 93            [ 4] 1048 	sub	a, e
   8E3D 38 7A         [12] 1049 	jr	C,00115$
                           1050 ;src/main.c:254: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   8E3F 21 2C 89      [10] 1051 	ld	hl, #_cu + 0
   8E42 5E            [ 7] 1052 	ld	e,(hl)
   8E43 16 00         [ 7] 1053 	ld	d,#0x00
   8E45 21 02 00      [10] 1054 	ld	hl,#0x0002
   8E48 19            [11] 1055 	add	hl,de
   8E49 DD 75 FC      [19] 1056 	ld	-4 (ix),l
   8E4C DD 74 FD      [19] 1057 	ld	-3 (ix),h
   8E4F 0A            [ 7] 1058 	ld	a,(bc)
   8E50 6F            [ 4] 1059 	ld	l,a
   8E51 26 00         [ 7] 1060 	ld	h,#0x00
   8E53 DD 7E FC      [19] 1061 	ld	a,-4 (ix)
   8E56 95            [ 4] 1062 	sub	a, l
   8E57 DD 7E FD      [19] 1063 	ld	a,-3 (ix)
   8E5A 9C            [ 4] 1064 	sbc	a, h
   8E5B E2 60 8E      [10] 1065 	jp	PO, 00196$
   8E5E EE 80         [ 7] 1066 	xor	a, #0x80
   8E60                    1067 00196$:
   8E60 FA 73 8E      [10] 1068 	jp	M,00110$
   8E63 23            [ 6] 1069 	inc	hl
   8E64 23            [ 6] 1070 	inc	hl
   8E65 23            [ 6] 1071 	inc	hl
   8E66 23            [ 6] 1072 	inc	hl
   8E67 7D            [ 4] 1073 	ld	a,l
   8E68 93            [ 4] 1074 	sub	a, e
   8E69 7C            [ 4] 1075 	ld	a,h
   8E6A 9A            [ 4] 1076 	sbc	a, d
   8E6B E2 70 8E      [10] 1077 	jp	PO, 00197$
   8E6E EE 80         [ 7] 1078 	xor	a, #0x80
   8E70                    1079 00197$:
   8E70 F2 79 8E      [10] 1080 	jp	P,00111$
   8E73                    1081 00110$:
                           1082 ;src/main.c:256: colisiona = 0;
   8E73 DD 36 F7 00   [19] 1083 	ld	-9 (ix),#0x00
   8E77 18 48         [12] 1084 	jr	00119$
   8E79                    1085 00111$:
                           1086 ;src/main.c:259: if(enemy->y>cu.y){
   8E79 DD 6E FA      [19] 1087 	ld	l,-6 (ix)
   8E7C DD 66 FB      [19] 1088 	ld	h,-5 (ix)
   8E7F 5E            [ 7] 1089 	ld	e,(hl)
   8E80 21 2D 89      [10] 1090 	ld	hl, #(_cu + 0x0001) + 0
   8E83 6E            [ 7] 1091 	ld	l,(hl)
   8E84 7D            [ 4] 1092 	ld	a,l
   8E85 93            [ 4] 1093 	sub	a, e
   8E86 30 2B         [12] 1094 	jr	NC,00108$
                           1095 ;src/main.c:260: if(enemy->y - (cu.y + G_KNIFEY_0_H -2) >= 2){
   8E88 16 00         [ 7] 1096 	ld	d,#0x00
   8E8A 26 00         [ 7] 1097 	ld	h,#0x00
   8E8C D5            [11] 1098 	push	de
   8E8D 11 06 00      [10] 1099 	ld	de,#0x0006
   8E90 19            [11] 1100 	add	hl, de
   8E91 D1            [10] 1101 	pop	de
   8E92 7B            [ 4] 1102 	ld	a,e
   8E93 95            [ 4] 1103 	sub	a, l
   8E94 5F            [ 4] 1104 	ld	e,a
   8E95 7A            [ 4] 1105 	ld	a,d
   8E96 9C            [ 4] 1106 	sbc	a, h
   8E97 57            [ 4] 1107 	ld	d,a
   8E98 7B            [ 4] 1108 	ld	a,e
   8E99 D6 02         [ 7] 1109 	sub	a, #0x02
   8E9B 7A            [ 4] 1110 	ld	a,d
   8E9C 17            [ 4] 1111 	rla
   8E9D 3F            [ 4] 1112 	ccf
   8E9E 1F            [ 4] 1113 	rra
   8E9F DE 80         [ 7] 1114 	sbc	a, #0x80
   8EA1 38 06         [12] 1115 	jr	C,00105$
                           1116 ;src/main.c:261: colisiona = 0;
   8EA3 DD 36 F7 00   [19] 1117 	ld	-9 (ix),#0x00
   8EA7 18 18         [12] 1118 	jr	00119$
   8EA9                    1119 00105$:
                           1120 ;src/main.c:264: enemy->muerto = SI;
   8EA9 DD 6E FE      [19] 1121 	ld	l,-2 (ix)
   8EAC DD 66 FF      [19] 1122 	ld	h,-1 (ix)
   8EAF 36 01         [10] 1123 	ld	(hl),#0x01
   8EB1 18 0E         [12] 1124 	jr	00119$
   8EB3                    1125 00108$:
                           1126 ;src/main.c:268: colisiona = 0;
   8EB3 DD 36 F7 00   [19] 1127 	ld	-9 (ix),#0x00
   8EB7 18 08         [12] 1128 	jr	00119$
   8EB9                    1129 00115$:
                           1130 ;src/main.c:274: enemy->mira = M_abajo;
   8EB9 DD 6E F8      [19] 1131 	ld	l,-8 (ix)
   8EBC DD 66 F9      [19] 1132 	ld	h,-7 (ix)
   8EBF 36 03         [10] 1133 	ld	(hl),#0x03
                           1134 ;src/main.c:277: case 3:
   8EC1                    1135 00119$:
                           1136 ;src/main.c:280: if( *getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   8EC1 DD 6E FA      [19] 1137 	ld	l,-6 (ix)
   8EC4 DD 66 FB      [19] 1138 	ld	h,-5 (ix)
   8EC7 7E            [ 7] 1139 	ld	a,(hl)
   8EC8 C6 18         [ 7] 1140 	add	a, #0x18
   8ECA 57            [ 4] 1141 	ld	d,a
   8ECB 0A            [ 7] 1142 	ld	a,(bc)
   8ECC C5            [11] 1143 	push	bc
   8ECD D5            [11] 1144 	push	de
   8ECE 33            [ 6] 1145 	inc	sp
   8ECF F5            [11] 1146 	push	af
   8ED0 33            [ 6] 1147 	inc	sp
   8ED1 CD 44 8A      [17] 1148 	call	_getTilePtr
   8ED4 F1            [10] 1149 	pop	af
   8ED5 C1            [10] 1150 	pop	bc
   8ED6 5E            [ 7] 1151 	ld	e,(hl)
   8ED7 3E 02         [ 7] 1152 	ld	a,#0x02
   8ED9 93            [ 4] 1153 	sub	a, e
   8EDA DA 93 8F      [10] 1154 	jp	C,00131$
                           1155 ;src/main.c:281: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   8EDD DD 6E FA      [19] 1156 	ld	l,-6 (ix)
   8EE0 DD 66 FB      [19] 1157 	ld	h,-5 (ix)
   8EE3 7E            [ 7] 1158 	ld	a,(hl)
   8EE4 C6 18         [ 7] 1159 	add	a, #0x18
   8EE6 57            [ 4] 1160 	ld	d,a
   8EE7 0A            [ 7] 1161 	ld	a,(bc)
   8EE8 C6 02         [ 7] 1162 	add	a, #0x02
   8EEA C5            [11] 1163 	push	bc
   8EEB D5            [11] 1164 	push	de
   8EEC 33            [ 6] 1165 	inc	sp
   8EED F5            [11] 1166 	push	af
   8EEE 33            [ 6] 1167 	inc	sp
   8EEF CD 44 8A      [17] 1168 	call	_getTilePtr
   8EF2 F1            [10] 1169 	pop	af
   8EF3 C1            [10] 1170 	pop	bc
   8EF4 5E            [ 7] 1171 	ld	e,(hl)
   8EF5 3E 02         [ 7] 1172 	ld	a,#0x02
   8EF7 93            [ 4] 1173 	sub	a, e
   8EF8 DA 93 8F      [10] 1174 	jp	C,00131$
                           1175 ;src/main.c:282: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   8EFB DD 6E FA      [19] 1176 	ld	l,-6 (ix)
   8EFE DD 66 FB      [19] 1177 	ld	h,-5 (ix)
   8F01 7E            [ 7] 1178 	ld	a,(hl)
   8F02 C6 18         [ 7] 1179 	add	a, #0x18
   8F04 57            [ 4] 1180 	ld	d,a
   8F05 0A            [ 7] 1181 	ld	a,(bc)
   8F06 C6 04         [ 7] 1182 	add	a, #0x04
   8F08 C5            [11] 1183 	push	bc
   8F09 D5            [11] 1184 	push	de
   8F0A 33            [ 6] 1185 	inc	sp
   8F0B F5            [11] 1186 	push	af
   8F0C 33            [ 6] 1187 	inc	sp
   8F0D CD 44 8A      [17] 1188 	call	_getTilePtr
   8F10 F1            [10] 1189 	pop	af
   8F11 C1            [10] 1190 	pop	bc
   8F12 5E            [ 7] 1191 	ld	e,(hl)
   8F13 3E 02         [ 7] 1192 	ld	a,#0x02
   8F15 93            [ 4] 1193 	sub	a, e
   8F16 38 7B         [12] 1194 	jr	C,00131$
                           1195 ;src/main.c:284: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   8F18 21 2C 89      [10] 1196 	ld	hl, #_cu + 0
   8F1B 5E            [ 7] 1197 	ld	e,(hl)
   8F1C 16 00         [ 7] 1198 	ld	d,#0x00
   8F1E 21 02 00      [10] 1199 	ld	hl,#0x0002
   8F21 19            [11] 1200 	add	hl,de
   8F22 DD 75 FC      [19] 1201 	ld	-4 (ix),l
   8F25 DD 74 FD      [19] 1202 	ld	-3 (ix),h
   8F28 0A            [ 7] 1203 	ld	a,(bc)
   8F29 4F            [ 4] 1204 	ld	c,a
   8F2A 06 00         [ 7] 1205 	ld	b,#0x00
   8F2C DD 7E FC      [19] 1206 	ld	a,-4 (ix)
   8F2F 91            [ 4] 1207 	sub	a, c
   8F30 DD 7E FD      [19] 1208 	ld	a,-3 (ix)
   8F33 98            [ 4] 1209 	sbc	a, b
   8F34 E2 39 8F      [10] 1210 	jp	PO, 00198$
   8F37 EE 80         [ 7] 1211 	xor	a, #0x80
   8F39                    1212 00198$:
   8F39 FA 4C 8F      [10] 1213 	jp	M,00126$
   8F3C 03            [ 6] 1214 	inc	bc
   8F3D 03            [ 6] 1215 	inc	bc
   8F3E 03            [ 6] 1216 	inc	bc
   8F3F 03            [ 6] 1217 	inc	bc
   8F40 79            [ 4] 1218 	ld	a,c
   8F41 93            [ 4] 1219 	sub	a, e
   8F42 78            [ 4] 1220 	ld	a,b
   8F43 9A            [ 4] 1221 	sbc	a, d
   8F44 E2 49 8F      [10] 1222 	jp	PO, 00199$
   8F47 EE 80         [ 7] 1223 	xor	a, #0x80
   8F49                    1224 00199$:
   8F49 F2 52 8F      [10] 1225 	jp	P,00127$
   8F4C                    1226 00126$:
                           1227 ;src/main.c:285: colisiona = 0;
   8F4C DD 36 F7 00   [19] 1228 	ld	-9 (ix),#0x00
   8F50 18 49         [12] 1229 	jr	00135$
   8F52                    1230 00127$:
                           1231 ;src/main.c:288: if(cu.y > enemy->y){ //si el cu esta abajo
   8F52 21 2D 89      [10] 1232 	ld	hl, #(_cu + 0x0001) + 0
   8F55 4E            [ 7] 1233 	ld	c,(hl)
   8F56 DD 6E FA      [19] 1234 	ld	l,-6 (ix)
   8F59 DD 66 FB      [19] 1235 	ld	h,-5 (ix)
   8F5C 5E            [ 7] 1236 	ld	e,(hl)
   8F5D 7B            [ 4] 1237 	ld	a,e
   8F5E 91            [ 4] 1238 	sub	a, c
   8F5F 30 2C         [12] 1239 	jr	NC,00124$
                           1240 ;src/main.c:289: if( cu.y - (enemy->y + G_ENEMY_H) > 2){ // si hay espacio entre el enemigo y el cu
   8F61 06 00         [ 7] 1241 	ld	b,#0x00
   8F63 16 00         [ 7] 1242 	ld	d,#0x00
   8F65 21 16 00      [10] 1243 	ld	hl,#0x0016
   8F68 19            [11] 1244 	add	hl,de
   8F69 79            [ 4] 1245 	ld	a,c
   8F6A 95            [ 4] 1246 	sub	a, l
   8F6B 4F            [ 4] 1247 	ld	c,a
   8F6C 78            [ 4] 1248 	ld	a,b
   8F6D 9C            [ 4] 1249 	sbc	a, h
   8F6E 47            [ 4] 1250 	ld	b,a
   8F6F 3E 02         [ 7] 1251 	ld	a,#0x02
   8F71 B9            [ 4] 1252 	cp	a, c
   8F72 3E 00         [ 7] 1253 	ld	a,#0x00
   8F74 98            [ 4] 1254 	sbc	a, b
   8F75 E2 7A 8F      [10] 1255 	jp	PO, 00200$
   8F78 EE 80         [ 7] 1256 	xor	a, #0x80
   8F7A                    1257 00200$:
   8F7A F2 83 8F      [10] 1258 	jp	P,00121$
                           1259 ;src/main.c:290: colisiona = 0;
   8F7D DD 36 F7 00   [19] 1260 	ld	-9 (ix),#0x00
   8F81 18 18         [12] 1261 	jr	00135$
   8F83                    1262 00121$:
                           1263 ;src/main.c:293: enemy->muerto = SI;
   8F83 DD 6E FE      [19] 1264 	ld	l,-2 (ix)
   8F86 DD 66 FF      [19] 1265 	ld	h,-1 (ix)
   8F89 36 01         [10] 1266 	ld	(hl),#0x01
   8F8B 18 0E         [12] 1267 	jr	00135$
   8F8D                    1268 00124$:
                           1269 ;src/main.c:297: colisiona = 0;
   8F8D DD 36 F7 00   [19] 1270 	ld	-9 (ix),#0x00
   8F91 18 08         [12] 1271 	jr	00135$
   8F93                    1272 00131$:
                           1273 ;src/main.c:301: enemy->mira = M_arriba;
   8F93 DD 6E F8      [19] 1274 	ld	l,-8 (ix)
   8F96 DD 66 F9      [19] 1275 	ld	h,-7 (ix)
   8F99 36 02         [10] 1276 	ld	(hl),#0x02
                           1277 ;src/main.c:304: }
   8F9B                    1278 00135$:
                           1279 ;src/main.c:305: return colisiona;
   8F9B DD 6E F7      [19] 1280 	ld	l,-9 (ix)
   8F9E DD F9         [10] 1281 	ld	sp, ix
   8FA0 DD E1         [14] 1282 	pop	ix
   8FA2 C9            [10] 1283 	ret
                           1284 ;src/main.c:308: void moverEnemigoArriba(TEnemy *enemy){
                           1285 ;	---------------------------------
                           1286 ; Function moverEnemigoArriba
                           1287 ; ---------------------------------
   8FA3                    1288 _moverEnemigoArriba::
   8FA3 DD E5         [15] 1289 	push	ix
   8FA5 DD 21 00 00   [14] 1290 	ld	ix,#0
   8FA9 DD 39         [15] 1291 	add	ix,sp
                           1292 ;src/main.c:309: enemy->y--;
   8FAB DD 4E 04      [19] 1293 	ld	c,4 (ix)
   8FAE DD 46 05      [19] 1294 	ld	b,5 (ix)
   8FB1 69            [ 4] 1295 	ld	l, c
   8FB2 60            [ 4] 1296 	ld	h, b
   8FB3 23            [ 6] 1297 	inc	hl
   8FB4 5E            [ 7] 1298 	ld	e,(hl)
   8FB5 1D            [ 4] 1299 	dec	e
   8FB6 73            [ 7] 1300 	ld	(hl),e
                           1301 ;src/main.c:310: enemy->y--;
   8FB7 1D            [ 4] 1302 	dec	e
   8FB8 73            [ 7] 1303 	ld	(hl),e
                           1304 ;src/main.c:311: enemy->mover = SI;
   8FB9 21 06 00      [10] 1305 	ld	hl,#0x0006
   8FBC 09            [11] 1306 	add	hl,bc
   8FBD 36 01         [10] 1307 	ld	(hl),#0x01
   8FBF DD E1         [14] 1308 	pop	ix
   8FC1 C9            [10] 1309 	ret
                           1310 ;src/main.c:314: void moverEnemigoAbajo(TEnemy *enemy){
                           1311 ;	---------------------------------
                           1312 ; Function moverEnemigoAbajo
                           1313 ; ---------------------------------
   8FC2                    1314 _moverEnemigoAbajo::
   8FC2 DD E5         [15] 1315 	push	ix
   8FC4 DD 21 00 00   [14] 1316 	ld	ix,#0
   8FC8 DD 39         [15] 1317 	add	ix,sp
                           1318 ;src/main.c:315: enemy->y++;
   8FCA DD 4E 04      [19] 1319 	ld	c,4 (ix)
   8FCD DD 46 05      [19] 1320 	ld	b,5 (ix)
   8FD0 59            [ 4] 1321 	ld	e, c
   8FD1 50            [ 4] 1322 	ld	d, b
   8FD2 13            [ 6] 1323 	inc	de
   8FD3 1A            [ 7] 1324 	ld	a,(de)
   8FD4 3C            [ 4] 1325 	inc	a
   8FD5 12            [ 7] 1326 	ld	(de),a
                           1327 ;src/main.c:316: enemy->y++;
   8FD6 3C            [ 4] 1328 	inc	a
   8FD7 12            [ 7] 1329 	ld	(de),a
                           1330 ;src/main.c:317: enemy->mover = SI;
   8FD8 21 06 00      [10] 1331 	ld	hl,#0x0006
   8FDB 09            [11] 1332 	add	hl,bc
   8FDC 36 01         [10] 1333 	ld	(hl),#0x01
   8FDE DD E1         [14] 1334 	pop	ix
   8FE0 C9            [10] 1335 	ret
                           1336 ;src/main.c:320: void moverEnemigo(TEnemy *enemy){
                           1337 ;	---------------------------------
                           1338 ; Function moverEnemigo
                           1339 ; ---------------------------------
   8FE1                    1340 _moverEnemigo::
   8FE1 DD E5         [15] 1341 	push	ix
   8FE3 DD 21 00 00   [14] 1342 	ld	ix,#0
   8FE7 DD 39         [15] 1343 	add	ix,sp
                           1344 ;src/main.c:321: if(!enemy->muerto){
   8FE9 DD 4E 04      [19] 1345 	ld	c,4 (ix)
   8FEC DD 46 05      [19] 1346 	ld	b,5 (ix)
   8FEF C5            [11] 1347 	push	bc
   8FF0 FD E1         [14] 1348 	pop	iy
   8FF2 FD 7E 08      [19] 1349 	ld	a,8 (iy)
   8FF5 B7            [ 4] 1350 	or	a, a
   8FF6 20 3C         [12] 1351 	jr	NZ,00110$
                           1352 ;src/main.c:322: if(!checkEnemyCollision(enemy->mira, enemy)){
   8FF8 21 07 00      [10] 1353 	ld	hl,#0x0007
   8FFB 09            [11] 1354 	add	hl,bc
   8FFC 5E            [ 7] 1355 	ld	e,(hl)
   8FFD 16 00         [ 7] 1356 	ld	d,#0x00
   8FFF E5            [11] 1357 	push	hl
   9000 C5            [11] 1358 	push	bc
   9001 C5            [11] 1359 	push	bc
   9002 D5            [11] 1360 	push	de
   9003 CD 7F 8D      [17] 1361 	call	_checkEnemyCollision
   9006 F1            [10] 1362 	pop	af
   9007 F1            [10] 1363 	pop	af
   9008 7D            [ 4] 1364 	ld	a,l
   9009 C1            [10] 1365 	pop	bc
   900A E1            [10] 1366 	pop	hl
   900B B7            [ 4] 1367 	or	a, a
   900C 20 26         [12] 1368 	jr	NZ,00110$
                           1369 ;src/main.c:324: switch (enemy->mira) {
   900E 5E            [ 7] 1370 	ld	e,(hl)
   900F 3E 03         [ 7] 1371 	ld	a,#0x03
   9011 93            [ 4] 1372 	sub	a, e
   9012 38 20         [12] 1373 	jr	C,00110$
   9014 16 00         [ 7] 1374 	ld	d,#0x00
   9016 21 1C 90      [10] 1375 	ld	hl,#00124$
   9019 19            [11] 1376 	add	hl,de
   901A 19            [11] 1377 	add	hl,de
                           1378 ;src/main.c:326: case 0:
                           1379 ;src/main.c:328: break;
                           1380 ;src/main.c:329: case 1:
                           1381 ;src/main.c:331: break;
                           1382 ;src/main.c:332: case 2:
   901B E9            [ 4] 1383 	jp	(hl)
   901C                    1384 00124$:
   901C 18 16         [12] 1385 	jr	00110$
   901E 18 14         [12] 1386 	jr	00110$
   9020 18 06         [12] 1387 	jr	00103$
   9022 18 0B         [12] 1388 	jr	00104$
   9024 18 0E         [12] 1389 	jr	00110$
   9026 18 0C         [12] 1390 	jr	00110$
   9028                    1391 00103$:
                           1392 ;src/main.c:333: moverEnemigoArriba(enemy);
   9028 C5            [11] 1393 	push	bc
   9029 CD A3 8F      [17] 1394 	call	_moverEnemigoArriba
   902C F1            [10] 1395 	pop	af
                           1396 ;src/main.c:334: break;
   902D 18 05         [12] 1397 	jr	00110$
                           1398 ;src/main.c:335: case 3:
   902F                    1399 00104$:
                           1400 ;src/main.c:336: moverEnemigoAbajo(enemy);
   902F C5            [11] 1401 	push	bc
   9030 CD C2 8F      [17] 1402 	call	_moverEnemigoAbajo
   9033 F1            [10] 1403 	pop	af
                           1404 ;src/main.c:338: }
   9034                    1405 00110$:
   9034 DD E1         [14] 1406 	pop	ix
   9036 C9            [10] 1407 	ret
                           1408 ;src/main.c:344: void patrolDecision(TEnemy *enemy) { // o devuelve direccion o le pasamos un enemigo y lo mueve
                           1409 ;	---------------------------------
                           1410 ; Function patrolDecision
                           1411 ; ---------------------------------
   9037                    1412 _patrolDecision::
                           1413 ;src/main.c:345: u8 decision = cpct_getRandom_mxor_u8() % 4;
   9037 CD 71 87      [17] 1414 	call	_cpct_getRandom_mxor_u8
   903A 7D            [ 4] 1415 	ld	a,l
   903B E6 03         [ 7] 1416 	and	a, #0x03
   903D 5F            [ 4] 1417 	ld	e,a
                           1418 ;src/main.c:347: switch (decision) {
   903E 3E 03         [ 7] 1419 	ld	a,#0x03
   9040 93            [ 4] 1420 	sub	a, e
   9041 D8            [11] 1421 	ret	C
   9042 16 00         [ 7] 1422 	ld	d,#0x00
   9044 21 4A 90      [10] 1423 	ld	hl,#00112$
   9047 19            [11] 1424 	add	hl,de
   9048 19            [11] 1425 	add	hl,de
                           1426 ;src/main.c:348: case 0:
   9049 E9            [ 4] 1427 	jp	(hl)
   904A                    1428 00112$:
   904A 18 06         [12] 1429 	jr	00101$
   904C 18 0D         [12] 1430 	jr	00106$
   904E 18 0B         [12] 1431 	jr	00106$
   9050 18 09         [12] 1432 	jr	00104$
   9052                    1433 00101$:
                           1434 ;src/main.c:349: moverEnemigoAbajo(enemy);
   9052 C1            [10] 1435 	pop	bc
   9053 E1            [10] 1436 	pop	hl
   9054 E5            [11] 1437 	push	hl
   9055 C5            [11] 1438 	push	bc
   9056 E5            [11] 1439 	push	hl
   9057 CD C2 8F      [17] 1440 	call	_moverEnemigoAbajo
   905A F1            [10] 1441 	pop	af
                           1442 ;src/main.c:350: break;
                           1443 ;src/main.c:351: case 1:
                           1444 ;src/main.c:352: break;
                           1445 ;src/main.c:353: case 2:
                           1446 ;src/main.c:354: break;
                           1447 ;src/main.c:355: case 3:
                           1448 ;src/main.c:357: }
   905B                    1449 00104$:
   905B                    1450 00106$:
   905B C9            [10] 1451 	ret
                           1452 ;src/main.c:360: void avanzarMapa() {
                           1453 ;	---------------------------------
                           1454 ; Function avanzarMapa
                           1455 ; ---------------------------------
   905C                    1456 _avanzarMapa::
                           1457 ;src/main.c:361: if(num_mapa < NUM_MAPAS -1) {
   905C 3A 38 89      [13] 1458 	ld	a,(#_num_mapa + 0)
   905F D6 02         [ 7] 1459 	sub	a, #0x02
   9061 D2 F9 89      [10] 1460 	jp	NC,_menuFin
                           1461 ;src/main.c:362: mapa = mapas[++num_mapa];
   9064 21 38 89      [10] 1462 	ld	hl, #_num_mapa+0
   9067 34            [11] 1463 	inc	(hl)
   9068 FD 21 38 89   [14] 1464 	ld	iy,#_num_mapa
   906C FD 6E 00      [19] 1465 	ld	l,0 (iy)
   906F 26 00         [ 7] 1466 	ld	h,#0x00
   9071 29            [11] 1467 	add	hl, hl
   9072 11 4F 89      [10] 1468 	ld	de,#_mapas
   9075 19            [11] 1469 	add	hl,de
   9076 7E            [ 7] 1470 	ld	a,(hl)
   9077 FD 21 36 89   [14] 1471 	ld	iy,#_mapa
   907B FD 77 00      [19] 1472 	ld	0 (iy),a
   907E 23            [ 6] 1473 	inc	hl
   907F 7E            [ 7] 1474 	ld	a,(hl)
   9080 32 37 89      [13] 1475 	ld	(#_mapa + 1),a
                           1476 ;src/main.c:363: prota.x = prota.px = 2;
   9083 21 26 89      [10] 1477 	ld	hl,#(_prota + 0x0002)
   9086 36 02         [10] 1478 	ld	(hl),#0x02
   9088 21 24 89      [10] 1479 	ld	hl,#_prota
   908B 36 02         [10] 1480 	ld	(hl),#0x02
                           1481 ;src/main.c:364: prota.mover = SI;
   908D 21 2A 89      [10] 1482 	ld	hl,#(_prota + 0x0006)
                           1483 ;src/main.c:365: dibujarMapa();
                           1484 ;src/main.c:369: menuFin();
   9090 36 01         [10] 1485 	ld	(hl), #0x01
   9092 C3 39 89      [10] 1486 	jp	_dibujarMapa
                           1487 ;src/main.c:373: void moverIzquierda() {
                           1488 ;	---------------------------------
                           1489 ; Function moverIzquierda
                           1490 ; ---------------------------------
   9095                    1491 _moverIzquierda::
                           1492 ;src/main.c:374: prota.mira = M_izquierda;
   9095 01 24 89      [10] 1493 	ld	bc,#_prota+0
   9098 21 2B 89      [10] 1494 	ld	hl,#(_prota + 0x0007)
   909B 36 01         [10] 1495 	ld	(hl),#0x01
                           1496 ;src/main.c:375: if (!checkCollision(M_izquierda)) {
   909D C5            [11] 1497 	push	bc
   909E 21 01 00      [10] 1498 	ld	hl,#0x0001
   90A1 E5            [11] 1499 	push	hl
   90A2 CD 85 8A      [17] 1500 	call	_checkCollision
   90A5 F1            [10] 1501 	pop	af
   90A6 C1            [10] 1502 	pop	bc
   90A7 7D            [ 4] 1503 	ld	a,l
   90A8 B7            [ 4] 1504 	or	a, a
   90A9 C0            [11] 1505 	ret	NZ
                           1506 ;src/main.c:376: prota.x--;
   90AA 0A            [ 7] 1507 	ld	a,(bc)
   90AB C6 FF         [ 7] 1508 	add	a,#0xFF
   90AD 02            [ 7] 1509 	ld	(bc),a
                           1510 ;src/main.c:377: prota.mover = SI;
   90AE 21 2A 89      [10] 1511 	ld	hl,#(_prota + 0x0006)
   90B1 36 01         [10] 1512 	ld	(hl),#0x01
                           1513 ;src/main.c:378: prota.sprite = g_hero_left;
   90B3 21 FE 79      [10] 1514 	ld	hl,#_g_hero_left
   90B6 22 28 89      [16] 1515 	ld	((_prota + 0x0004)), hl
   90B9 C9            [10] 1516 	ret
                           1517 ;src/main.c:382: void moverDerecha() {
                           1518 ;	---------------------------------
                           1519 ; Function moverDerecha
                           1520 ; ---------------------------------
   90BA                    1521 _moverDerecha::
                           1522 ;src/main.c:383: prota.mira = M_derecha;
   90BA 21 2B 89      [10] 1523 	ld	hl,#(_prota + 0x0007)
   90BD 36 00         [10] 1524 	ld	(hl),#0x00
                           1525 ;src/main.c:384: if (!checkCollision(M_derecha) ) {
   90BF 21 00 00      [10] 1526 	ld	hl,#0x0000
   90C2 E5            [11] 1527 	push	hl
   90C3 CD 85 8A      [17] 1528 	call	_checkCollision
   90C6 F1            [10] 1529 	pop	af
   90C7 4D            [ 4] 1530 	ld	c,l
                           1531 ;src/main.c:385: prota.x++;
   90C8 21 24 89      [10] 1532 	ld	hl, #_prota + 0
   90CB 5E            [ 7] 1533 	ld	e,(hl)
                           1534 ;src/main.c:384: if (!checkCollision(M_derecha) ) {
   90CC 79            [ 4] 1535 	ld	a,c
   90CD B7            [ 4] 1536 	or	a, a
   90CE 20 11         [12] 1537 	jr	NZ,00104$
                           1538 ;src/main.c:385: prota.x++;
   90D0 1C            [ 4] 1539 	inc	e
   90D1 21 24 89      [10] 1540 	ld	hl,#_prota
   90D4 73            [ 7] 1541 	ld	(hl),e
                           1542 ;src/main.c:386: prota.mover = SI;
   90D5 21 2A 89      [10] 1543 	ld	hl,#(_prota + 0x0006)
   90D8 36 01         [10] 1544 	ld	(hl),#0x01
                           1545 ;src/main.c:387: prota.sprite = g_hero;
   90DA 21 A8 7A      [10] 1546 	ld	hl,#_g_hero
   90DD 22 28 89      [16] 1547 	ld	((_prota + 0x0004)), hl
   90E0 C9            [10] 1548 	ret
   90E1                    1549 00104$:
                           1550 ;src/main.c:389: }else if( prota.x + G_HERO_W >= 80){
   90E1 16 00         [ 7] 1551 	ld	d,#0x00
   90E3 21 07 00      [10] 1552 	ld	hl,#0x0007
   90E6 19            [11] 1553 	add	hl,de
   90E7 11 50 80      [10] 1554 	ld	de, #0x8050
   90EA 29            [11] 1555 	add	hl, hl
   90EB 3F            [ 4] 1556 	ccf
   90EC CB 1C         [ 8] 1557 	rr	h
   90EE CB 1D         [ 8] 1558 	rr	l
   90F0 ED 52         [15] 1559 	sbc	hl, de
   90F2 D8            [11] 1560 	ret	C
                           1561 ;src/main.c:390: avanzarMapa();
   90F3 C3 5C 90      [10] 1562 	jp  _avanzarMapa
                           1563 ;src/main.c:394: void moverArriba() {
                           1564 ;	---------------------------------
                           1565 ; Function moverArriba
                           1566 ; ---------------------------------
   90F6                    1567 _moverArriba::
                           1568 ;src/main.c:395: prota.mira = M_arriba;
   90F6 21 2B 89      [10] 1569 	ld	hl,#(_prota + 0x0007)
   90F9 36 02         [10] 1570 	ld	(hl),#0x02
                           1571 ;src/main.c:396: if (!checkCollision(M_arriba)) { // TODO: COMPROBAR
   90FB 21 02 00      [10] 1572 	ld	hl,#0x0002
   90FE E5            [11] 1573 	push	hl
   90FF CD 85 8A      [17] 1574 	call	_checkCollision
   9102 F1            [10] 1575 	pop	af
   9103 7D            [ 4] 1576 	ld	a,l
   9104 B7            [ 4] 1577 	or	a, a
   9105 C0            [11] 1578 	ret	NZ
                           1579 ;src/main.c:397: prota.y--;
   9106 21 25 89      [10] 1580 	ld	hl,#_prota + 1
   9109 4E            [ 7] 1581 	ld	c,(hl)
   910A 0D            [ 4] 1582 	dec	c
   910B 71            [ 7] 1583 	ld	(hl),c
                           1584 ;src/main.c:398: prota.y--;
   910C 0D            [ 4] 1585 	dec	c
   910D 71            [ 7] 1586 	ld	(hl),c
                           1587 ;src/main.c:399: prota.mover  = SI;
   910E 21 2A 89      [10] 1588 	ld	hl,#(_prota + 0x0006)
   9111 36 01         [10] 1589 	ld	(hl),#0x01
                           1590 ;src/main.c:400: prota.sprite = g_hero_up;
   9113 21 64 79      [10] 1591 	ld	hl,#_g_hero_up
   9116 22 28 89      [16] 1592 	ld	((_prota + 0x0004)), hl
   9119 C9            [10] 1593 	ret
                           1594 ;src/main.c:404: void moverAbajo() {
                           1595 ;	---------------------------------
                           1596 ; Function moverAbajo
                           1597 ; ---------------------------------
   911A                    1598 _moverAbajo::
                           1599 ;src/main.c:405: prota.mira = M_abajo;
   911A 21 2B 89      [10] 1600 	ld	hl,#(_prota + 0x0007)
   911D 36 03         [10] 1601 	ld	(hl),#0x03
                           1602 ;src/main.c:406: if (!checkCollision(M_abajo) ) { // TODO: COMPROBAR
   911F 21 03 00      [10] 1603 	ld	hl,#0x0003
   9122 E5            [11] 1604 	push	hl
   9123 CD 85 8A      [17] 1605 	call	_checkCollision
   9126 F1            [10] 1606 	pop	af
   9127 7D            [ 4] 1607 	ld	a,l
   9128 B7            [ 4] 1608 	or	a, a
   9129 C0            [11] 1609 	ret	NZ
                           1610 ;src/main.c:407: prota.y++;
   912A 01 25 89      [10] 1611 	ld	bc,#_prota + 1
   912D 0A            [ 7] 1612 	ld	a,(bc)
   912E 3C            [ 4] 1613 	inc	a
   912F 02            [ 7] 1614 	ld	(bc),a
                           1615 ;src/main.c:408: prota.y++;
   9130 3C            [ 4] 1616 	inc	a
   9131 02            [ 7] 1617 	ld	(bc),a
                           1618 ;src/main.c:409: prota.mover  = SI;
   9132 21 2A 89      [10] 1619 	ld	hl,#(_prota + 0x0006)
   9135 36 01         [10] 1620 	ld	(hl),#0x01
                           1621 ;src/main.c:410: prota.sprite = g_hero_down;
   9137 21 CA 78      [10] 1622 	ld	hl,#_g_hero_down
   913A 22 28 89      [16] 1623 	ld	((_prota + 0x0004)), hl
   913D C9            [10] 1624 	ret
                           1625 ;src/main.c:414: void dibujarCuchillo() {
                           1626 ;	---------------------------------
                           1627 ; Function dibujarCuchillo
                           1628 ; ---------------------------------
   913E                    1629 _dibujarCuchillo::
   913E DD E5         [15] 1630 	push	ix
   9140 DD 21 00 00   [14] 1631 	ld	ix,#0
   9144 DD 39         [15] 1632 	add	ix,sp
   9146 F5            [11] 1633 	push	af
                           1634 ;src/main.c:415: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   9147 21 2D 89      [10] 1635 	ld	hl, #_cu + 1
   914A 56            [ 7] 1636 	ld	d,(hl)
   914B 21 2C 89      [10] 1637 	ld	hl, #_cu + 0
   914E 46            [ 7] 1638 	ld	b,(hl)
   914F D5            [11] 1639 	push	de
   9150 33            [ 6] 1640 	inc	sp
   9151 C5            [11] 1641 	push	bc
   9152 33            [ 6] 1642 	inc	sp
   9153 21 00 C0      [10] 1643 	ld	hl,#0xC000
   9156 E5            [11] 1644 	push	hl
   9157 CD 70 88      [17] 1645 	call	_cpct_getScreenPtr
   915A 45            [ 4] 1646 	ld	b,l
   915B 5C            [ 4] 1647 	ld	e,h
                           1648 ;src/main.c:416: if(cu.eje == E_X){
   915C 21 34 89      [10] 1649 	ld	hl, #_cu + 8
   915F 4E            [ 7] 1650 	ld	c,(hl)
                           1651 ;src/main.c:417: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   9160 DD 70 FE      [19] 1652 	ld	-2 (ix),b
   9163 DD 73 FF      [19] 1653 	ld	-1 (ix),e
                           1654 ;src/main.c:416: if(cu.eje == E_X){
   9166 79            [ 4] 1655 	ld	a,c
   9167 B7            [ 4] 1656 	or	a, a
   9168 20 19         [12] 1657 	jr	NZ,00104$
                           1658 ;src/main.c:417: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   916A 11 00 3E      [10] 1659 	ld	de,#_g_tablatrans+0
   916D ED 4B 30 89   [20] 1660 	ld	bc, (#(_cu + 0x0004) + 0)
   9171 D5            [11] 1661 	push	de
   9172 21 04 04      [10] 1662 	ld	hl,#0x0404
   9175 E5            [11] 1663 	push	hl
   9176 DD 6E FE      [19] 1664 	ld	l,-2 (ix)
   9179 DD 66 FF      [19] 1665 	ld	h,-1 (ix)
   917C E5            [11] 1666 	push	hl
   917D C5            [11] 1667 	push	bc
   917E CD 90 88      [17] 1668 	call	_cpct_drawSpriteMaskedAlignedTable
   9181 18 1A         [12] 1669 	jr	00106$
   9183                    1670 00104$:
                           1671 ;src/main.c:420: else if(cu.eje == E_Y){
   9183 0D            [ 4] 1672 	dec	c
   9184 20 17         [12] 1673 	jr	NZ,00106$
                           1674 ;src/main.c:421: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   9186 11 00 3E      [10] 1675 	ld	de,#_g_tablatrans+0
   9189 ED 4B 30 89   [20] 1676 	ld	bc, (#(_cu + 0x0004) + 0)
   918D D5            [11] 1677 	push	de
   918E 21 02 08      [10] 1678 	ld	hl,#0x0802
   9191 E5            [11] 1679 	push	hl
   9192 DD 6E FE      [19] 1680 	ld	l,-2 (ix)
   9195 DD 66 FF      [19] 1681 	ld	h,-1 (ix)
   9198 E5            [11] 1682 	push	hl
   9199 C5            [11] 1683 	push	bc
   919A CD 90 88      [17] 1684 	call	_cpct_drawSpriteMaskedAlignedTable
   919D                    1685 00106$:
   919D DD F9         [10] 1686 	ld	sp, ix
   919F DD E1         [14] 1687 	pop	ix
   91A1 C9            [10] 1688 	ret
                           1689 ;src/main.c:425: void borrarCuchillo() {
                           1690 ;	---------------------------------
                           1691 ; Function borrarCuchillo
                           1692 ; ---------------------------------
   91A2                    1693 _borrarCuchillo::
   91A2 DD E5         [15] 1694 	push	ix
   91A4 DD 21 00 00   [14] 1695 	ld	ix,#0
   91A8 DD 39         [15] 1696 	add	ix,sp
   91AA F5            [11] 1697 	push	af
   91AB 3B            [ 6] 1698 	dec	sp
                           1699 ;src/main.c:427: u8 w = 2 + (cu.px & 1);
   91AC 21 2E 89      [10] 1700 	ld	hl, #_cu + 2
   91AF 4E            [ 7] 1701 	ld	c,(hl)
   91B0 79            [ 4] 1702 	ld	a,c
   91B1 E6 01         [ 7] 1703 	and	a, #0x01
   91B3 47            [ 4] 1704 	ld	b,a
   91B4 04            [ 4] 1705 	inc	b
   91B5 04            [ 4] 1706 	inc	b
                           1707 ;src/main.c:428: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   91B6 21 2F 89      [10] 1708 	ld	hl, #_cu + 3
   91B9 5E            [ 7] 1709 	ld	e,(hl)
   91BA 7B            [ 4] 1710 	ld	a,e
   91BB E6 03         [ 7] 1711 	and	a, #0x03
   91BD 28 04         [12] 1712 	jr	Z,00105$
   91BF 3E 01         [ 7] 1713 	ld	a,#0x01
   91C1 18 02         [12] 1714 	jr	00106$
   91C3                    1715 00105$:
   91C3 3E 00         [ 7] 1716 	ld	a,#0x00
   91C5                    1717 00106$:
   91C5 C6 02         [ 7] 1718 	add	a, #0x02
   91C7 DD 77 FD      [19] 1719 	ld	-3 (ix),a
                           1720 ;src/main.c:429: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   91CA FD 2A 36 89   [20] 1721 	ld	iy,(_mapa)
   91CE 16 00         [ 7] 1722 	ld	d,#0x00
   91D0 7B            [ 4] 1723 	ld	a,e
   91D1 C6 E8         [ 7] 1724 	add	a,#0xE8
   91D3 DD 77 FE      [19] 1725 	ld	-2 (ix),a
   91D6 7A            [ 4] 1726 	ld	a,d
   91D7 CE FF         [ 7] 1727 	adc	a,#0xFF
   91D9 DD 77 FF      [19] 1728 	ld	-1 (ix),a
   91DC DD 6E FE      [19] 1729 	ld	l,-2 (ix)
   91DF DD 66 FF      [19] 1730 	ld	h,-1 (ix)
   91E2 DD CB FF 7E   [20] 1731 	bit	7, -1 (ix)
   91E6 28 04         [12] 1732 	jr	Z,00107$
   91E8 21 EB FF      [10] 1733 	ld	hl,#0xFFEB
   91EB 19            [11] 1734 	add	hl,de
   91EC                    1735 00107$:
   91EC CB 2C         [ 8] 1736 	sra	h
   91EE CB 1D         [ 8] 1737 	rr	l
   91F0 CB 2C         [ 8] 1738 	sra	h
   91F2 CB 1D         [ 8] 1739 	rr	l
   91F4 55            [ 4] 1740 	ld	d,l
   91F5 CB 39         [ 8] 1741 	srl	c
   91F7 FD E5         [15] 1742 	push	iy
   91F9 21 F0 C0      [10] 1743 	ld	hl,#0xC0F0
   91FC E5            [11] 1744 	push	hl
   91FD 3E 28         [ 7] 1745 	ld	a,#0x28
   91FF F5            [11] 1746 	push	af
   9200 33            [ 6] 1747 	inc	sp
   9201 DD 7E FD      [19] 1748 	ld	a,-3 (ix)
   9204 F5            [11] 1749 	push	af
   9205 33            [ 6] 1750 	inc	sp
   9206 C5            [11] 1751 	push	bc
   9207 33            [ 6] 1752 	inc	sp
   9208 D5            [11] 1753 	push	de
   9209 33            [ 6] 1754 	inc	sp
   920A 79            [ 4] 1755 	ld	a,c
   920B F5            [11] 1756 	push	af
   920C 33            [ 6] 1757 	inc	sp
   920D CD 44 7D      [17] 1758 	call	_cpct_etm_drawTileBox2x4
                           1759 ;src/main.c:430: if(!cu.mover){
   9210 3A 35 89      [13] 1760 	ld	a, (#_cu + 9)
   9213 B7            [ 4] 1761 	or	a, a
   9214 20 05         [12] 1762 	jr	NZ,00103$
                           1763 ;src/main.c:431: cu.lanzado = NO;
   9216 21 32 89      [10] 1764 	ld	hl,#(_cu + 0x0006)
   9219 36 00         [10] 1765 	ld	(hl),#0x00
   921B                    1766 00103$:
   921B DD F9         [10] 1767 	ld	sp, ix
   921D DD E1         [14] 1768 	pop	ix
   921F C9            [10] 1769 	ret
                           1770 ;src/main.c:435: void redibujarCuchillo( ) {
                           1771 ;	---------------------------------
                           1772 ; Function redibujarCuchillo
                           1773 ; ---------------------------------
   9220                    1774 _redibujarCuchillo::
                           1775 ;src/main.c:436: borrarCuchillo();
   9220 CD A2 91      [17] 1776 	call	_borrarCuchillo
                           1777 ;src/main.c:437: cu.px = cu.x;
   9223 01 2E 89      [10] 1778 	ld	bc,#_cu + 2
   9226 3A 2C 89      [13] 1779 	ld	a, (#_cu + 0)
   9229 02            [ 7] 1780 	ld	(bc),a
                           1781 ;src/main.c:438: cu.py = cu.y;
   922A 01 2F 89      [10] 1782 	ld	bc,#_cu + 3
   922D 3A 2D 89      [13] 1783 	ld	a, (#_cu + 1)
   9230 02            [ 7] 1784 	ld	(bc),a
                           1785 ;src/main.c:439: dibujarCuchillo();
   9231 C3 3E 91      [10] 1786 	jp  _dibujarCuchillo
                           1787 ;src/main.c:443: void lanzarCuchillo(){
                           1788 ;	---------------------------------
                           1789 ; Function lanzarCuchillo
                           1790 ; ---------------------------------
   9234                    1791 _lanzarCuchillo::
                           1792 ;src/main.c:445: if(!cu.lanzado){
   9234 3A 32 89      [13] 1793 	ld	a, (#(_cu + 0x0006) + 0)
   9237 B7            [ 4] 1794 	or	a, a
   9238 C0            [11] 1795 	ret	NZ
                           1796 ;src/main.c:447: if(prota.mira == M_derecha){
   9239 21 2B 89      [10] 1797 	ld	hl, #_prota + 7
   923C 5E            [ 7] 1798 	ld	e,(hl)
                           1799 ;src/main.c:448: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   923D 01 25 89      [10] 1800 	ld	bc,#_prota + 1
                           1801 ;src/main.c:450: cu.direccion = M_derecha;
                           1802 ;src/main.c:452: cu.y=prota.y + G_HERO_H /2;
                           1803 ;src/main.c:453: cu.sprite=g_knifeX_0;
                           1804 ;src/main.c:454: cu.eje = E_X;
                           1805 ;src/main.c:447: if(prota.mira == M_derecha){
   9240 7B            [ 4] 1806 	ld	a,e
   9241 B7            [ 4] 1807 	or	a, a
   9242 20 41         [12] 1808 	jr	NZ,00118$
                           1809 ;src/main.c:448: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   9244 0A            [ 7] 1810 	ld	a,(bc)
   9245 C6 0B         [ 7] 1811 	add	a, #0x0B
   9247 5F            [ 4] 1812 	ld	e,a
   9248 3A 24 89      [13] 1813 	ld	a, (#_prota + 0)
   924B C6 0C         [ 7] 1814 	add	a, #0x0C
   924D 6F            [ 4] 1815 	ld	l,a
   924E C5            [11] 1816 	push	bc
   924F 7B            [ 4] 1817 	ld	a,e
   9250 F5            [11] 1818 	push	af
   9251 33            [ 6] 1819 	inc	sp
   9252 7D            [ 4] 1820 	ld	a,l
   9253 F5            [11] 1821 	push	af
   9254 33            [ 6] 1822 	inc	sp
   9255 CD 44 8A      [17] 1823 	call	_getTilePtr
   9258 F1            [10] 1824 	pop	af
   9259 C1            [10] 1825 	pop	bc
   925A 5E            [ 7] 1826 	ld	e,(hl)
   925B 3E 02         [ 7] 1827 	ld	a,#0x02
   925D 93            [ 4] 1828 	sub	a, e
   925E D8            [11] 1829 	ret	C
                           1830 ;src/main.c:449: cu.lanzado = SI;
   925F 21 32 89      [10] 1831 	ld	hl,#(_cu + 0x0006)
   9262 36 01         [10] 1832 	ld	(hl),#0x01
                           1833 ;src/main.c:450: cu.direccion = M_derecha;
   9264 21 33 89      [10] 1834 	ld	hl,#(_cu + 0x0007)
   9267 36 00         [10] 1835 	ld	(hl),#0x00
                           1836 ;src/main.c:451: cu.x=prota.x + G_HERO_W;
   9269 3A 24 89      [13] 1837 	ld	a, (#_prota + 0)
   926C C6 07         [ 7] 1838 	add	a, #0x07
   926E 32 2C 89      [13] 1839 	ld	(#_cu),a
                           1840 ;src/main.c:452: cu.y=prota.y + G_HERO_H /2;
   9271 0A            [ 7] 1841 	ld	a,(bc)
   9272 C6 0B         [ 7] 1842 	add	a, #0x0B
   9274 32 2D 89      [13] 1843 	ld	(#(_cu + 0x0001)),a
                           1844 ;src/main.c:453: cu.sprite=g_knifeX_0;
   9277 21 C0 54      [10] 1845 	ld	hl,#_g_knifeX_0
   927A 22 30 89      [16] 1846 	ld	((_cu + 0x0004)), hl
                           1847 ;src/main.c:454: cu.eje = E_X;
   927D 21 34 89      [10] 1848 	ld	hl,#(_cu + 0x0008)
   9280 36 00         [10] 1849 	ld	(hl),#0x00
                           1850 ;src/main.c:455: dibujarCuchillo();
   9282 C3 3E 91      [10] 1851 	jp  _dibujarCuchillo
   9285                    1852 00118$:
                           1853 ;src/main.c:458: else if(prota.mira == M_izquierda){
   9285 7B            [ 4] 1854 	ld	a,e
   9286 3D            [ 4] 1855 	dec	a
   9287 20 41         [12] 1856 	jr	NZ,00115$
                           1857 ;src/main.c:459: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   9289 0A            [ 7] 1858 	ld	a,(bc)
   928A C6 0B         [ 7] 1859 	add	a, #0x0B
   928C 5F            [ 4] 1860 	ld	e,a
   928D 3A 24 89      [13] 1861 	ld	a, (#_prota + 0)
   9290 C6 F6         [ 7] 1862 	add	a,#0xF6
   9292 6F            [ 4] 1863 	ld	l,a
   9293 C5            [11] 1864 	push	bc
   9294 7B            [ 4] 1865 	ld	a,e
   9295 F5            [11] 1866 	push	af
   9296 33            [ 6] 1867 	inc	sp
   9297 7D            [ 4] 1868 	ld	a,l
   9298 F5            [11] 1869 	push	af
   9299 33            [ 6] 1870 	inc	sp
   929A CD 44 8A      [17] 1871 	call	_getTilePtr
   929D F1            [10] 1872 	pop	af
   929E C1            [10] 1873 	pop	bc
   929F 5E            [ 7] 1874 	ld	e,(hl)
   92A0 3E 02         [ 7] 1875 	ld	a,#0x02
   92A2 93            [ 4] 1876 	sub	a, e
   92A3 D8            [11] 1877 	ret	C
                           1878 ;src/main.c:460: cu.lanzado = SI;
   92A4 21 32 89      [10] 1879 	ld	hl,#(_cu + 0x0006)
   92A7 36 01         [10] 1880 	ld	(hl),#0x01
                           1881 ;src/main.c:461: cu.direccion = M_izquierda;
   92A9 21 33 89      [10] 1882 	ld	hl,#(_cu + 0x0007)
   92AC 36 01         [10] 1883 	ld	(hl),#0x01
                           1884 ;src/main.c:462: cu.x = prota.x - G_KNIFEX_0_W;
   92AE 3A 24 89      [13] 1885 	ld	a, (#_prota + 0)
   92B1 C6 FC         [ 7] 1886 	add	a,#0xFC
   92B3 32 2C 89      [13] 1887 	ld	(#_cu),a
                           1888 ;src/main.c:463: cu.y = prota.y + G_HERO_H /2;
   92B6 0A            [ 7] 1889 	ld	a,(bc)
   92B7 C6 0B         [ 7] 1890 	add	a, #0x0B
   92B9 32 2D 89      [13] 1891 	ld	(#(_cu + 0x0001)),a
                           1892 ;src/main.c:464: cu.sprite = g_knifeX_1;
   92BC 21 D0 54      [10] 1893 	ld	hl,#_g_knifeX_1
   92BF 22 30 89      [16] 1894 	ld	((_cu + 0x0004)), hl
                           1895 ;src/main.c:465: cu.eje = E_X;
   92C2 21 34 89      [10] 1896 	ld	hl,#(_cu + 0x0008)
   92C5 36 00         [10] 1897 	ld	(hl),#0x00
                           1898 ;src/main.c:466: dibujarCuchillo();
   92C7 C3 3E 91      [10] 1899 	jp  _dibujarCuchillo
   92CA                    1900 00115$:
                           1901 ;src/main.c:469: else if(prota.mira == M_abajo){
   92CA 7B            [ 4] 1902 	ld	a,e
   92CB D6 03         [ 7] 1903 	sub	a, #0x03
   92CD 20 41         [12] 1904 	jr	NZ,00112$
                           1905 ;src/main.c:471: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   92CF 0A            [ 7] 1906 	ld	a,(bc)
   92D0 C6 1F         [ 7] 1907 	add	a, #0x1F
   92D2 5F            [ 4] 1908 	ld	e,a
   92D3 3A 24 89      [13] 1909 	ld	a, (#_prota + 0)
   92D6 57            [ 4] 1910 	ld	d,a
   92D7 14            [ 4] 1911 	inc	d
   92D8 14            [ 4] 1912 	inc	d
   92D9 14            [ 4] 1913 	inc	d
   92DA C5            [11] 1914 	push	bc
   92DB 7B            [ 4] 1915 	ld	a,e
   92DC F5            [11] 1916 	push	af
   92DD 33            [ 6] 1917 	inc	sp
   92DE D5            [11] 1918 	push	de
   92DF 33            [ 6] 1919 	inc	sp
   92E0 CD 44 8A      [17] 1920 	call	_getTilePtr
   92E3 F1            [10] 1921 	pop	af
   92E4 C1            [10] 1922 	pop	bc
   92E5 5E            [ 7] 1923 	ld	e,(hl)
   92E6 3E 02         [ 7] 1924 	ld	a,#0x02
   92E8 93            [ 4] 1925 	sub	a, e
   92E9 D8            [11] 1926 	ret	C
                           1927 ;src/main.c:472: cu.lanzado = SI;
   92EA 21 32 89      [10] 1928 	ld	hl,#(_cu + 0x0006)
   92ED 36 01         [10] 1929 	ld	(hl),#0x01
                           1930 ;src/main.c:473: cu.direccion = M_abajo;
   92EF 21 33 89      [10] 1931 	ld	hl,#(_cu + 0x0007)
   92F2 36 03         [10] 1932 	ld	(hl),#0x03
                           1933 ;src/main.c:474: cu.x = prota.x + G_HERO_W / 2;
   92F4 3A 24 89      [13] 1934 	ld	a, (#_prota + 0)
   92F7 C6 03         [ 7] 1935 	add	a, #0x03
   92F9 32 2C 89      [13] 1936 	ld	(#_cu),a
                           1937 ;src/main.c:475: cu.y = prota.y + G_HERO_H;
   92FC 0A            [ 7] 1938 	ld	a,(bc)
   92FD C6 16         [ 7] 1939 	add	a, #0x16
   92FF 32 2D 89      [13] 1940 	ld	(#(_cu + 0x0001)),a
                           1941 ;src/main.c:476: cu.sprite = g_knifeY_0;
   9302 21 A0 54      [10] 1942 	ld	hl,#_g_knifeY_0
   9305 22 30 89      [16] 1943 	ld	((_cu + 0x0004)), hl
                           1944 ;src/main.c:477: cu.eje = E_Y;
   9308 21 34 89      [10] 1945 	ld	hl,#(_cu + 0x0008)
   930B 36 01         [10] 1946 	ld	(hl),#0x01
                           1947 ;src/main.c:478: dibujarCuchillo();
   930D C3 3E 91      [10] 1948 	jp  _dibujarCuchillo
   9310                    1949 00112$:
                           1950 ;src/main.c:481: else if(prota.mira == M_arriba){
   9310 7B            [ 4] 1951 	ld	a,e
   9311 D6 02         [ 7] 1952 	sub	a, #0x02
   9313 C0            [11] 1953 	ret	NZ
                           1954 ;src/main.c:482: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   9314 0A            [ 7] 1955 	ld	a,(bc)
   9315 C6 F7         [ 7] 1956 	add	a,#0xF7
   9317 57            [ 4] 1957 	ld	d,a
   9318 3A 24 89      [13] 1958 	ld	a, (#_prota + 0)
   931B C6 03         [ 7] 1959 	add	a, #0x03
   931D C5            [11] 1960 	push	bc
   931E D5            [11] 1961 	push	de
   931F 33            [ 6] 1962 	inc	sp
   9320 F5            [11] 1963 	push	af
   9321 33            [ 6] 1964 	inc	sp
   9322 CD 44 8A      [17] 1965 	call	_getTilePtr
   9325 F1            [10] 1966 	pop	af
   9326 C1            [10] 1967 	pop	bc
   9327 5E            [ 7] 1968 	ld	e,(hl)
   9328 3E 02         [ 7] 1969 	ld	a,#0x02
   932A 93            [ 4] 1970 	sub	a, e
   932B D8            [11] 1971 	ret	C
                           1972 ;src/main.c:483: cu.lanzado = SI;
   932C 21 32 89      [10] 1973 	ld	hl,#(_cu + 0x0006)
   932F 36 01         [10] 1974 	ld	(hl),#0x01
                           1975 ;src/main.c:484: cu.direccion = M_arriba;
   9331 21 33 89      [10] 1976 	ld	hl,#(_cu + 0x0007)
   9334 36 02         [10] 1977 	ld	(hl),#0x02
                           1978 ;src/main.c:485: cu.x = prota.x + G_HERO_W / 2;
   9336 3A 24 89      [13] 1979 	ld	a, (#_prota + 0)
   9339 C6 03         [ 7] 1980 	add	a, #0x03
   933B 32 2C 89      [13] 1981 	ld	(#_cu),a
                           1982 ;src/main.c:486: cu.y = prota.y;
   933E 0A            [ 7] 1983 	ld	a,(bc)
   933F 32 2D 89      [13] 1984 	ld	(#(_cu + 0x0001)),a
                           1985 ;src/main.c:487: cu.sprite = g_knifeY_1;
   9342 21 B0 54      [10] 1986 	ld	hl,#_g_knifeY_1
   9345 22 30 89      [16] 1987 	ld	((_cu + 0x0004)), hl
                           1988 ;src/main.c:488: cu.eje = E_Y;
   9348 21 34 89      [10] 1989 	ld	hl,#(_cu + 0x0008)
   934B 36 01         [10] 1990 	ld	(hl),#0x01
                           1991 ;src/main.c:489: dibujarCuchillo();
   934D C3 3E 91      [10] 1992 	jp  _dibujarCuchillo
                           1993 ;src/main.c:495: void comprobarTeclado() {
                           1994 ;	---------------------------------
                           1995 ; Function comprobarTeclado
                           1996 ; ---------------------------------
   9350                    1997 _comprobarTeclado::
                           1998 ;src/main.c:496: cpct_scanKeyboard_if();
   9350 CD 9C 7E      [17] 1999 	call	_cpct_scanKeyboard_if
                           2000 ;src/main.c:498: if (cpct_isAnyKeyPressed()) {
   9353 CD 8F 7E      [17] 2001 	call	_cpct_isAnyKeyPressed
   9356 7D            [ 4] 2002 	ld	a,l
   9357 B7            [ 4] 2003 	or	a, a
   9358 C8            [11] 2004 	ret	Z
                           2005 ;src/main.c:499: if (cpct_isKeyPressed(Key_CursorLeft))
   9359 21 01 01      [10] 2006 	ld	hl,#0x0101
   935C CD F9 7B      [17] 2007 	call	_cpct_isKeyPressed
   935F 7D            [ 4] 2008 	ld	a,l
   9360 B7            [ 4] 2009 	or	a, a
                           2010 ;src/main.c:500: moverIzquierda();
   9361 C2 95 90      [10] 2011 	jp	NZ,_moverIzquierda
                           2012 ;src/main.c:501: else if (cpct_isKeyPressed(Key_CursorRight))
   9364 21 00 02      [10] 2013 	ld	hl,#0x0200
   9367 CD F9 7B      [17] 2014 	call	_cpct_isKeyPressed
   936A 7D            [ 4] 2015 	ld	a,l
   936B B7            [ 4] 2016 	or	a, a
                           2017 ;src/main.c:502: moverDerecha();
   936C C2 BA 90      [10] 2018 	jp	NZ,_moverDerecha
                           2019 ;src/main.c:503: else if (cpct_isKeyPressed(Key_CursorUp))
   936F 21 00 01      [10] 2020 	ld	hl,#0x0100
   9372 CD F9 7B      [17] 2021 	call	_cpct_isKeyPressed
   9375 7D            [ 4] 2022 	ld	a,l
   9376 B7            [ 4] 2023 	or	a, a
                           2024 ;src/main.c:504: moverArriba();
   9377 C2 F6 90      [10] 2025 	jp	NZ,_moverArriba
                           2026 ;src/main.c:505: else if (cpct_isKeyPressed(Key_CursorDown))
   937A 21 00 04      [10] 2027 	ld	hl,#0x0400
   937D CD F9 7B      [17] 2028 	call	_cpct_isKeyPressed
   9380 7D            [ 4] 2029 	ld	a,l
   9381 B7            [ 4] 2030 	or	a, a
                           2031 ;src/main.c:506: moverAbajo();
   9382 C2 1A 91      [10] 2032 	jp	NZ,_moverAbajo
                           2033 ;src/main.c:507: else if (cpct_isKeyPressed(Key_Space))
   9385 21 05 80      [10] 2034 	ld	hl,#0x8005
   9388 CD F9 7B      [17] 2035 	call	_cpct_isKeyPressed
   938B 7D            [ 4] 2036 	ld	a,l
   938C B7            [ 4] 2037 	or	a, a
   938D C8            [11] 2038 	ret	Z
                           2039 ;src/main.c:508: lanzarCuchillo();
   938E C3 34 92      [10] 2040 	jp  _lanzarCuchillo
                           2041 ;src/main.c:512: u8 checkKnifeCollision(int direction){
                           2042 ;	---------------------------------
                           2043 ; Function checkKnifeCollision
                           2044 ; ---------------------------------
   9391                    2045 _checkKnifeCollision::
   9391 DD E5         [15] 2046 	push	ix
   9393 DD 21 00 00   [14] 2047 	ld	ix,#0
   9397 DD 39         [15] 2048 	add	ix,sp
                           2049 ;src/main.c:514: u8 colisiona = 1;
   9399 0E 01         [ 7] 2050 	ld	c,#0x01
                           2051 ;src/main.c:516: switch (direction) {
   939B DD CB 05 7E   [20] 2052 	bit	7, 5 (ix)
   939F C2 67 94      [10] 2053 	jp	NZ,00125$
   93A2 3E 03         [ 7] 2054 	ld	a,#0x03
   93A4 DD BE 04      [19] 2055 	cp	a, 4 (ix)
   93A7 3E 00         [ 7] 2056 	ld	a,#0x00
   93A9 DD 9E 05      [19] 2057 	sbc	a, 5 (ix)
   93AC E2 B1 93      [10] 2058 	jp	PO, 00159$
   93AF EE 80         [ 7] 2059 	xor	a, #0x80
   93B1                    2060 00159$:
   93B1 FA 67 94      [10] 2061 	jp	M,00125$
   93B4 DD 5E 04      [19] 2062 	ld	e,4 (ix)
   93B7 16 00         [ 7] 2063 	ld	d,#0x00
   93B9 21 C0 93      [10] 2064 	ld	hl,#00160$
   93BC 19            [11] 2065 	add	hl,de
   93BD 19            [11] 2066 	add	hl,de
   93BE 19            [11] 2067 	add	hl,de
   93BF E9            [ 4] 2068 	jp	(hl)
   93C0                    2069 00160$:
   93C0 C3 67 94      [10] 2070 	jp	00125$
   93C3 C3 67 94      [10] 2071 	jp	00125$
   93C6 C3 D2 93      [10] 2072 	jp	00103$
   93C9 C3 0A 94      [10] 2073 	jp	00114$
                           2074 ;src/main.c:517: case 0:
                           2075 ;src/main.c:519: break;
   93CC C3 67 94      [10] 2076 	jp	00125$
                           2077 ;src/main.c:520: case 1:
                           2078 ;src/main.c:522: break;
   93CF C3 67 94      [10] 2079 	jp	00125$
                           2080 ;src/main.c:523: case 2:
   93D2                    2081 00103$:
                           2082 ;src/main.c:525: if((enemy->x + G_ENEMY_W) < cu.x || enemy->x  > (cu.x + G_KNIFEX_0_W)){
   93D2 21 F4 88      [10] 2083 	ld	hl,#_enemy+0
   93D5 4E            [ 7] 2084 	ld	c,(hl)
   93D6 06 00         [ 7] 2085 	ld	b,#0x00
   93D8 21 04 00      [10] 2086 	ld	hl,#0x0004
   93DB 09            [11] 2087 	add	hl,bc
   93DC EB            [ 4] 2088 	ex	de,hl
   93DD 21 2C 89      [10] 2089 	ld	hl,#_cu+0
   93E0 6E            [ 7] 2090 	ld	l,(hl)
   93E1 26 00         [ 7] 2091 	ld	h,#0x00
   93E3 7B            [ 4] 2092 	ld	a,e
   93E4 95            [ 4] 2093 	sub	a, l
   93E5 7A            [ 4] 2094 	ld	a,d
   93E6 9C            [ 4] 2095 	sbc	a, h
   93E7 E2 EC 93      [10] 2096 	jp	PO, 00161$
   93EA EE 80         [ 7] 2097 	xor	a, #0x80
   93EC                    2098 00161$:
   93EC FA 0A 94      [10] 2099 	jp	M,00114$
   93EF 11 04 00      [10] 2100 	ld	de,#0x0004
   93F2 19            [11] 2101 	add	hl,de
   93F3 7D            [ 4] 2102 	ld	a,l
   93F4 91            [ 4] 2103 	sub	a, c
   93F5 7C            [ 4] 2104 	ld	a,h
   93F6 98            [ 4] 2105 	sbc	a, b
   93F7 E2 FC 93      [10] 2106 	jp	PO, 00162$
   93FA EE 80         [ 7] 2107 	xor	a, #0x80
   93FC                    2108 00162$:
   93FC FA 0A 94      [10] 2109 	jp	M,00114$
                           2110 ;src/main.c:528: if(cu.y>enemy->y){
   93FF 21 2D 89      [10] 2111 	ld	hl, #(_cu + 0x0001) + 0
   9402 4E            [ 7] 2112 	ld	c,(hl)
   9403 3A F5 88      [13] 2113 	ld	a,(#(_enemy + 0x0001) + 0)
   9406 91            [ 4] 2114 	sub	a, c
   9407 3E 00         [ 7] 2115 	ld	a,#0x00
   9409 17            [ 4] 2116 	rla
                           2117 ;src/main.c:541: case 3:
   940A                    2118 00114$:
                           2119 ;src/main.c:543: if((enemy->x + G_ENEMY_W) < cu.x || enemy->x  > (cu.x + G_KNIFEX_0_W)){
   940A 21 F4 88      [10] 2120 	ld	hl, #_enemy + 0
   940D 4E            [ 7] 2121 	ld	c,(hl)
   940E 06 00         [ 7] 2122 	ld	b,#0x00
   9410 21 04 00      [10] 2123 	ld	hl,#0x0004
   9413 09            [11] 2124 	add	hl,bc
   9414 EB            [ 4] 2125 	ex	de,hl
   9415 21 2C 89      [10] 2126 	ld	hl, #_cu + 0
   9418 6E            [ 7] 2127 	ld	l,(hl)
   9419 26 00         [ 7] 2128 	ld	h,#0x00
   941B 7B            [ 4] 2129 	ld	a,e
   941C 95            [ 4] 2130 	sub	a, l
   941D 7A            [ 4] 2131 	ld	a,d
   941E 9C            [ 4] 2132 	sbc	a, h
   941F E2 24 94      [10] 2133 	jp	PO, 00163$
   9422 EE 80         [ 7] 2134 	xor	a, #0x80
   9424                    2135 00163$:
   9424 FA 37 94      [10] 2136 	jp	M,00121$
   9427 11 04 00      [10] 2137 	ld	de,#0x0004
   942A 19            [11] 2138 	add	hl,de
   942B 7D            [ 4] 2139 	ld	a,l
   942C 91            [ 4] 2140 	sub	a, c
   942D 7C            [ 4] 2141 	ld	a,h
   942E 98            [ 4] 2142 	sbc	a, b
   942F E2 34 94      [10] 2143 	jp	PO, 00164$
   9432 EE 80         [ 7] 2144 	xor	a, #0x80
   9434                    2145 00164$:
   9434 F2 3B 94      [10] 2146 	jp	P,00122$
   9437                    2147 00121$:
                           2148 ;src/main.c:544: colisiona = 0;
   9437 0E 00         [ 7] 2149 	ld	c,#0x00
   9439 18 2C         [12] 2150 	jr	00125$
   943B                    2151 00122$:
                           2152 ;src/main.c:546: if(cu.y<enemy->y){
   943B 21 2D 89      [10] 2153 	ld	hl, #(_cu + 0x0001) + 0
   943E 4E            [ 7] 2154 	ld	c,(hl)
   943F 21 F5 88      [10] 2155 	ld	hl, #(_enemy + 0x0001) + 0
   9442 6E            [ 7] 2156 	ld	l,(hl)
   9443 79            [ 4] 2157 	ld	a,c
   9444 95            [ 4] 2158 	sub	a, l
   9445 30 1E         [12] 2159 	jr	NC,00119$
                           2160 ;src/main.c:547: if(enemy->y - (cu.y + G_KNIFEX_0_H - 2) >= 2){
   9447 26 00         [ 7] 2161 	ld	h,#0x00
   9449 06 00         [ 7] 2162 	ld	b,#0x00
   944B 03            [ 6] 2163 	inc	bc
   944C 03            [ 6] 2164 	inc	bc
   944D BF            [ 4] 2165 	cp	a, a
   944E ED 42         [15] 2166 	sbc	hl, bc
   9450 11 02 80      [10] 2167 	ld	de, #0x8002
   9453 29            [11] 2168 	add	hl, hl
   9454 3F            [ 4] 2169 	ccf
   9455 CB 1C         [ 8] 2170 	rr	h
   9457 CB 1D         [ 8] 2171 	rr	l
   9459 ED 52         [15] 2172 	sbc	hl, de
   945B 38 04         [12] 2173 	jr	C,00116$
                           2174 ;src/main.c:548: colisiona = 0;
   945D 0E 00         [ 7] 2175 	ld	c,#0x00
   945F 18 06         [12] 2176 	jr	00125$
   9461                    2177 00116$:
                           2178 ;src/main.c:550: colisiona = 1;
   9461 0E 01         [ 7] 2179 	ld	c,#0x01
   9463 18 02         [12] 2180 	jr	00125$
   9465                    2181 00119$:
                           2182 ;src/main.c:554: colisiona = 0;
   9465 0E 00         [ 7] 2183 	ld	c,#0x00
                           2184 ;src/main.c:557: }
   9467                    2185 00125$:
                           2186 ;src/main.c:558: return colisiona;
   9467 69            [ 4] 2187 	ld	l,c
   9468 DD E1         [14] 2188 	pop	ix
   946A C9            [10] 2189 	ret
                           2190 ;src/main.c:561: void moverCuchillo(){
                           2191 ;	---------------------------------
                           2192 ; Function moverCuchillo
                           2193 ; ---------------------------------
   946B                    2194 _moverCuchillo::
                           2195 ;src/main.c:563: if(cu.lanzado){
   946B 01 2C 89      [10] 2196 	ld	bc,#_cu+0
   946E 3A 32 89      [13] 2197 	ld	a, (#_cu + 6)
   9471 B7            [ 4] 2198 	or	a, a
   9472 C8            [11] 2199 	ret	Z
                           2200 ;src/main.c:564: cu.mover = 1;
   9473 21 35 89      [10] 2201 	ld	hl,#(_cu + 0x0009)
   9476 36 01         [10] 2202 	ld	(hl),#0x01
                           2203 ;src/main.c:565: if(cu.direccion == M_derecha){
   9478 21 33 89      [10] 2204 	ld	hl, #_cu + 7
   947B 6E            [ 7] 2205 	ld	l,(hl)
                           2206 ;src/main.c:567: if( *getTilePtr(cu.x + G_KNIFEX_0_W + 1, cu.y) <= 2){
   947C 59            [ 4] 2207 	ld	e, c
   947D 50            [ 4] 2208 	ld	d, b
   947E 13            [ 6] 2209 	inc	de
                           2210 ;src/main.c:565: if(cu.direccion == M_derecha){
   947F 7D            [ 4] 2211 	ld	a,l
   9480 B7            [ 4] 2212 	or	a, a
   9481 20 27         [12] 2213 	jr	NZ,00128$
                           2214 ;src/main.c:567: if( *getTilePtr(cu.x + G_KNIFEX_0_W + 1, cu.y) <= 2){
   9483 1A            [ 7] 2215 	ld	a,(de)
   9484 5F            [ 4] 2216 	ld	e,a
   9485 0A            [ 7] 2217 	ld	a,(bc)
   9486 C6 05         [ 7] 2218 	add	a, #0x05
   9488 6F            [ 4] 2219 	ld	l,a
   9489 C5            [11] 2220 	push	bc
   948A 7B            [ 4] 2221 	ld	a,e
   948B F5            [11] 2222 	push	af
   948C 33            [ 6] 2223 	inc	sp
   948D 7D            [ 4] 2224 	ld	a,l
   948E F5            [11] 2225 	push	af
   948F 33            [ 6] 2226 	inc	sp
   9490 CD 44 8A      [17] 2227 	call	_getTilePtr
   9493 F1            [10] 2228 	pop	af
   9494 C1            [10] 2229 	pop	bc
   9495 5E            [ 7] 2230 	ld	e,(hl)
   9496 3E 02         [ 7] 2231 	ld	a,#0x02
   9498 93            [ 4] 2232 	sub	a, e
   9499 38 09         [12] 2233 	jr	C,00102$
                           2234 ;src/main.c:568: cu.x++;
   949B 0A            [ 7] 2235 	ld	a,(bc)
   949C 3C            [ 4] 2236 	inc	a
   949D 02            [ 7] 2237 	ld	(bc),a
                           2238 ;src/main.c:569: cu.mover = SI;
   949E 21 35 89      [10] 2239 	ld	hl,#(_cu + 0x0009)
   94A1 36 01         [10] 2240 	ld	(hl),#0x01
   94A3 C9            [10] 2241 	ret
   94A4                    2242 00102$:
                           2243 ;src/main.c:573: cu.mover=NO;
   94A4 21 35 89      [10] 2244 	ld	hl,#(_cu + 0x0009)
   94A7 36 00         [10] 2245 	ld	(hl),#0x00
   94A9 C9            [10] 2246 	ret
   94AA                    2247 00128$:
                           2248 ;src/main.c:576: else if(cu.direccion == M_izquierda){
   94AA 7D            [ 4] 2249 	ld	a,l
   94AB 3D            [ 4] 2250 	dec	a
   94AC 20 26         [12] 2251 	jr	NZ,00125$
                           2252 ;src/main.c:577: if(*getTilePtr(cu.x - 1, cu.y) <= 2){
   94AE 1A            [ 7] 2253 	ld	a,(de)
   94AF 5F            [ 4] 2254 	ld	e,a
   94B0 0A            [ 7] 2255 	ld	a,(bc)
   94B1 57            [ 4] 2256 	ld	d,a
   94B2 15            [ 4] 2257 	dec	d
   94B3 C5            [11] 2258 	push	bc
   94B4 7B            [ 4] 2259 	ld	a,e
   94B5 F5            [11] 2260 	push	af
   94B6 33            [ 6] 2261 	inc	sp
   94B7 D5            [11] 2262 	push	de
   94B8 33            [ 6] 2263 	inc	sp
   94B9 CD 44 8A      [17] 2264 	call	_getTilePtr
   94BC F1            [10] 2265 	pop	af
   94BD C1            [10] 2266 	pop	bc
   94BE 5E            [ 7] 2267 	ld	e,(hl)
   94BF 3E 02         [ 7] 2268 	ld	a,#0x02
   94C1 93            [ 4] 2269 	sub	a, e
   94C2 38 0A         [12] 2270 	jr	C,00105$
                           2271 ;src/main.c:578: cu.x--;
   94C4 0A            [ 7] 2272 	ld	a,(bc)
   94C5 C6 FF         [ 7] 2273 	add	a,#0xFF
   94C7 02            [ 7] 2274 	ld	(bc),a
                           2275 ;src/main.c:579: cu.mover = SI;
   94C8 21 35 89      [10] 2276 	ld	hl,#(_cu + 0x0009)
   94CB 36 01         [10] 2277 	ld	(hl),#0x01
   94CD C9            [10] 2278 	ret
   94CE                    2279 00105$:
                           2280 ;src/main.c:582: cu.mover=NO;
   94CE 21 35 89      [10] 2281 	ld	hl,#(_cu + 0x0009)
   94D1 36 00         [10] 2282 	ld	(hl),#0x00
   94D3 C9            [10] 2283 	ret
   94D4                    2284 00125$:
                           2285 ;src/main.c:585: else if(cu.direccion == M_arriba){
   94D4 7D            [ 4] 2286 	ld	a,l
   94D5 D6 02         [ 7] 2287 	sub	a, #0x02
   94D7 20 3E         [12] 2288 	jr	NZ,00122$
                           2289 ;src/main.c:586: if(*getTilePtr(cu.x, cu.y - 2) <= 2){
   94D9 1A            [ 7] 2290 	ld	a,(de)
   94DA C6 FE         [ 7] 2291 	add	a,#0xFE
   94DC F5            [11] 2292 	push	af
   94DD 0A            [ 7] 2293 	ld	a,(bc)
   94DE 47            [ 4] 2294 	ld	b,a
   94DF F1            [10] 2295 	pop	af
   94E0 D5            [11] 2296 	push	de
   94E1 F5            [11] 2297 	push	af
   94E2 33            [ 6] 2298 	inc	sp
   94E3 C5            [11] 2299 	push	bc
   94E4 33            [ 6] 2300 	inc	sp
   94E5 CD 44 8A      [17] 2301 	call	_getTilePtr
   94E8 F1            [10] 2302 	pop	af
   94E9 D1            [10] 2303 	pop	de
   94EA 4E            [ 7] 2304 	ld	c,(hl)
   94EB 3E 02         [ 7] 2305 	ld	a,#0x02
   94ED 91            [ 4] 2306 	sub	a, c
   94EE 38 21         [12] 2307 	jr	C,00111$
                           2308 ;src/main.c:587: if(!checkKnifeCollision(M_arriba)){
   94F0 D5            [11] 2309 	push	de
   94F1 21 02 00      [10] 2310 	ld	hl,#0x0002
   94F4 E5            [11] 2311 	push	hl
   94F5 CD 91 93      [17] 2312 	call	_checkKnifeCollision
   94F8 F1            [10] 2313 	pop	af
   94F9 D1            [10] 2314 	pop	de
   94FA 7D            [ 4] 2315 	ld	a,l
   94FB B7            [ 4] 2316 	or	a, a
   94FC 20 0D         [12] 2317 	jr	NZ,00108$
                           2318 ;src/main.c:588: cu.y--;
   94FE 1A            [ 7] 2319 	ld	a,(de)
   94FF C6 FF         [ 7] 2320 	add	a,#0xFF
   9501 12            [ 7] 2321 	ld	(de),a
                           2322 ;src/main.c:589: cu.y--;
   9502 C6 FF         [ 7] 2323 	add	a,#0xFF
   9504 12            [ 7] 2324 	ld	(de),a
                           2325 ;src/main.c:590: cu.mover = SI;
   9505 21 35 89      [10] 2326 	ld	hl,#(_cu + 0x0009)
   9508 36 01         [10] 2327 	ld	(hl),#0x01
   950A C9            [10] 2328 	ret
   950B                    2329 00108$:
                           2330 ;src/main.c:593: cu.mover=NO;
   950B 21 35 89      [10] 2331 	ld	hl,#(_cu + 0x0009)
   950E 36 00         [10] 2332 	ld	(hl),#0x00
   9510 C9            [10] 2333 	ret
   9511                    2334 00111$:
                           2335 ;src/main.c:596: cu.mover=NO;
   9511 21 35 89      [10] 2336 	ld	hl,#(_cu + 0x0009)
   9514 36 00         [10] 2337 	ld	(hl),#0x00
   9516 C9            [10] 2338 	ret
   9517                    2339 00122$:
                           2340 ;src/main.c:601: else if(cu.direccion == M_abajo){
   9517 7D            [ 4] 2341 	ld	a,l
   9518 D6 03         [ 7] 2342 	sub	a, #0x03
   951A C0            [11] 2343 	ret	NZ
                           2344 ;src/main.c:602: if(*getTilePtr(cu.x, cu.y + G_KNIFEY_0_H + 2) <= 2){
   951B 1A            [ 7] 2345 	ld	a,(de)
   951C C6 0A         [ 7] 2346 	add	a, #0x0A
   951E F5            [11] 2347 	push	af
   951F 0A            [ 7] 2348 	ld	a,(bc)
   9520 47            [ 4] 2349 	ld	b,a
   9521 F1            [10] 2350 	pop	af
   9522 D5            [11] 2351 	push	de
   9523 F5            [11] 2352 	push	af
   9524 33            [ 6] 2353 	inc	sp
   9525 C5            [11] 2354 	push	bc
   9526 33            [ 6] 2355 	inc	sp
   9527 CD 44 8A      [17] 2356 	call	_getTilePtr
   952A F1            [10] 2357 	pop	af
   952B D1            [10] 2358 	pop	de
   952C 4E            [ 7] 2359 	ld	c,(hl)
   952D 3E 02         [ 7] 2360 	ld	a,#0x02
   952F 91            [ 4] 2361 	sub	a, c
   9530 38 1F         [12] 2362 	jr	C,00117$
                           2363 ;src/main.c:603: if(!checkKnifeCollision(M_abajo)){
   9532 D5            [11] 2364 	push	de
   9533 21 03 00      [10] 2365 	ld	hl,#0x0003
   9536 E5            [11] 2366 	push	hl
   9537 CD 91 93      [17] 2367 	call	_checkKnifeCollision
   953A F1            [10] 2368 	pop	af
   953B D1            [10] 2369 	pop	de
   953C 7D            [ 4] 2370 	ld	a,l
   953D B7            [ 4] 2371 	or	a, a
   953E 20 0B         [12] 2372 	jr	NZ,00114$
                           2373 ;src/main.c:604: cu.y++;
   9540 1A            [ 7] 2374 	ld	a,(de)
   9541 3C            [ 4] 2375 	inc	a
   9542 12            [ 7] 2376 	ld	(de),a
                           2377 ;src/main.c:605: cu.y++;
   9543 3C            [ 4] 2378 	inc	a
   9544 12            [ 7] 2379 	ld	(de),a
                           2380 ;src/main.c:606: cu.mover = SI;
   9545 21 35 89      [10] 2381 	ld	hl,#(_cu + 0x0009)
   9548 36 01         [10] 2382 	ld	(hl),#0x01
   954A C9            [10] 2383 	ret
   954B                    2384 00114$:
                           2385 ;src/main.c:609: cu.mover=NO;
   954B 21 35 89      [10] 2386 	ld	hl,#(_cu + 0x0009)
   954E 36 00         [10] 2387 	ld	(hl),#0x00
   9550 C9            [10] 2388 	ret
   9551                    2389 00117$:
                           2390 ;src/main.c:612: cu.mover=NO;
   9551 21 35 89      [10] 2391 	ld	hl,#(_cu + 0x0009)
   9554 36 00         [10] 2392 	ld	(hl),#0x00
   9556 C9            [10] 2393 	ret
                           2394 ;src/main.c:617: void barraPuntuacionInicial(){
                           2395 ;	---------------------------------
                           2396 ; Function barraPuntuacionInicial
                           2397 ; ---------------------------------
   9557                    2398 _barraPuntuacionInicial::
                           2399 ;src/main.c:622: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   9557 21 00 02      [10] 2400 	ld	hl,#0x0200
   955A E5            [11] 2401 	push	hl
   955B 26 C0         [ 7] 2402 	ld	h, #0xC0
   955D E5            [11] 2403 	push	hl
   955E CD 70 88      [17] 2404 	call	_cpct_getScreenPtr
   9561 4D            [ 4] 2405 	ld	c,l
   9562 44            [ 4] 2406 	ld	b,h
                           2407 ;src/main.c:623: cpct_drawStringM0("SCORE", memptr, 1, 0);
   9563 21 01 00      [10] 2408 	ld	hl,#0x0001
   9566 E5            [11] 2409 	push	hl
   9567 C5            [11] 2410 	push	bc
   9568 21 FF 95      [10] 2411 	ld	hl,#___str_1
   956B E5            [11] 2412 	push	hl
   956C CD 7B 7C      [17] 2413 	call	_cpct_drawStringM0
   956F 21 06 00      [10] 2414 	ld	hl,#6
   9572 39            [11] 2415 	add	hl,sp
   9573 F9            [ 6] 2416 	ld	sp,hl
                           2417 ;src/main.c:624: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   9574 21 00 0E      [10] 2418 	ld	hl,#0x0E00
   9577 E5            [11] 2419 	push	hl
   9578 26 C0         [ 7] 2420 	ld	h, #0xC0
   957A E5            [11] 2421 	push	hl
   957B CD 70 88      [17] 2422 	call	_cpct_getScreenPtr
   957E 4D            [ 4] 2423 	ld	c,l
   957F 44            [ 4] 2424 	ld	b,h
                           2425 ;src/main.c:625: cpct_drawStringM0("00000", memptr, 15, 0);
   9580 21 0F 00      [10] 2426 	ld	hl,#0x000F
   9583 E5            [11] 2427 	push	hl
   9584 C5            [11] 2428 	push	bc
   9585 21 05 96      [10] 2429 	ld	hl,#___str_2
   9588 E5            [11] 2430 	push	hl
   9589 CD 7B 7C      [17] 2431 	call	_cpct_drawStringM0
   958C 21 06 00      [10] 2432 	ld	hl,#6
   958F 39            [11] 2433 	add	hl,sp
   9590 F9            [ 6] 2434 	ld	sp,hl
                           2435 ;src/main.c:628: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 14);
   9591 21 1A 0E      [10] 2436 	ld	hl,#0x0E1A
   9594 E5            [11] 2437 	push	hl
   9595 21 00 C0      [10] 2438 	ld	hl,#0xC000
   9598 E5            [11] 2439 	push	hl
   9599 CD 70 88      [17] 2440 	call	_cpct_getScreenPtr
   959C 4D            [ 4] 2441 	ld	c,l
   959D 44            [ 4] 2442 	ld	b,h
                           2443 ;src/main.c:629: cpct_drawStringM0("ROBOBIT", memptr, 3, 0);
   959E 21 03 00      [10] 2444 	ld	hl,#0x0003
   95A1 E5            [11] 2445 	push	hl
   95A2 C5            [11] 2446 	push	bc
   95A3 21 0B 96      [10] 2447 	ld	hl,#___str_3
   95A6 E5            [11] 2448 	push	hl
   95A7 CD 7B 7C      [17] 2449 	call	_cpct_drawStringM0
   95AA 21 06 00      [10] 2450 	ld	hl,#6
   95AD 39            [11] 2451 	add	hl,sp
   95AE F9            [ 6] 2452 	ld	sp,hl
                           2453 ;src/main.c:631: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   95AF 21 3C 02      [10] 2454 	ld	hl,#0x023C
   95B2 E5            [11] 2455 	push	hl
   95B3 21 00 C0      [10] 2456 	ld	hl,#0xC000
   95B6 E5            [11] 2457 	push	hl
   95B7 CD 70 88      [17] 2458 	call	_cpct_getScreenPtr
   95BA 4D            [ 4] 2459 	ld	c,l
   95BB 44            [ 4] 2460 	ld	b,h
                           2461 ;src/main.c:632: cpct_drawStringM0("LIVES", memptr, 1, 0);
   95BC 21 01 00      [10] 2462 	ld	hl,#0x0001
   95BF E5            [11] 2463 	push	hl
   95C0 C5            [11] 2464 	push	bc
   95C1 21 13 96      [10] 2465 	ld	hl,#___str_4
   95C4 E5            [11] 2466 	push	hl
   95C5 CD 7B 7C      [17] 2467 	call	_cpct_drawStringM0
   95C8 21 06 00      [10] 2468 	ld	hl,#6
   95CB 39            [11] 2469 	add	hl,sp
   95CC F9            [ 6] 2470 	ld	sp,hl
                           2471 ;src/main.c:634: for(i=0; i<5; i++){
   95CD 01 00 00      [10] 2472 	ld	bc,#0x0000
   95D0                    2473 00102$:
                           2474 ;src/main.c:635: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   95D0 79            [ 4] 2475 	ld	a,c
   95D1 87            [ 4] 2476 	add	a, a
   95D2 87            [ 4] 2477 	add	a, a
   95D3 C6 3C         [ 7] 2478 	add	a, #0x3C
   95D5 57            [ 4] 2479 	ld	d,a
   95D6 C5            [11] 2480 	push	bc
   95D7 3E 0E         [ 7] 2481 	ld	a,#0x0E
   95D9 F5            [11] 2482 	push	af
   95DA 33            [ 6] 2483 	inc	sp
   95DB D5            [11] 2484 	push	de
   95DC 33            [ 6] 2485 	inc	sp
   95DD 21 00 C0      [10] 2486 	ld	hl,#0xC000
   95E0 E5            [11] 2487 	push	hl
   95E1 CD 70 88      [17] 2488 	call	_cpct_getScreenPtr
   95E4 EB            [ 4] 2489 	ex	de,hl
   95E5 21 03 06      [10] 2490 	ld	hl,#0x0603
   95E8 E5            [11] 2491 	push	hl
   95E9 D5            [11] 2492 	push	de
   95EA 21 60 78      [10] 2493 	ld	hl,#_g_heart
   95ED E5            [11] 2494 	push	hl
   95EE CD 9F 7C      [17] 2495 	call	_cpct_drawSprite
   95F1 C1            [10] 2496 	pop	bc
                           2497 ;src/main.c:634: for(i=0; i<5; i++){
   95F2 03            [ 6] 2498 	inc	bc
   95F3 79            [ 4] 2499 	ld	a,c
   95F4 D6 05         [ 7] 2500 	sub	a, #0x05
   95F6 78            [ 4] 2501 	ld	a,b
   95F7 17            [ 4] 2502 	rla
   95F8 3F            [ 4] 2503 	ccf
   95F9 1F            [ 4] 2504 	rra
   95FA DE 80         [ 7] 2505 	sbc	a, #0x80
   95FC 38 D2         [12] 2506 	jr	C,00102$
   95FE C9            [10] 2507 	ret
   95FF                    2508 ___str_1:
   95FF 53 43 4F 52 45     2509 	.ascii "SCORE"
   9604 00                 2510 	.db 0x00
   9605                    2511 ___str_2:
   9605 30 30 30 30 30     2512 	.ascii "00000"
   960A 00                 2513 	.db 0x00
   960B                    2514 ___str_3:
   960B 52 4F 42 4F 42 49  2515 	.ascii "ROBOBIT"
        54
   9612 00                 2516 	.db 0x00
   9613                    2517 ___str_4:
   9613 4C 49 56 45 53     2518 	.ascii "LIVES"
   9618 00                 2519 	.db 0x00
                           2520 ;src/main.c:640: void borrarPantallaArriba(){
                           2521 ;	---------------------------------
                           2522 ; Function borrarPantallaArriba
                           2523 ; ---------------------------------
   9619                    2524 _borrarPantallaArriba::
                           2525 ;src/main.c:643: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 0); // posición para borrar la mitad derecha
   9619 21 00 00      [10] 2526 	ld	hl,#0x0000
   961C E5            [11] 2527 	push	hl
   961D 26 C0         [ 7] 2528 	ld	h, #0xC0
   961F E5            [11] 2529 	push	hl
   9620 CD 70 88      [17] 2530 	call	_cpct_getScreenPtr
   9623 4D            [ 4] 2531 	ld	c,l
   9624 44            [ 4] 2532 	ld	b,h
                           2533 ;src/main.c:644: cpct_drawSolidBox(memptr, 0, 40, 24);  //borra la mitad derecha
   9625 21 28 18      [10] 2534 	ld	hl,#0x1828
   9628 E5            [11] 2535 	push	hl
   9629 AF            [ 4] 2536 	xor	a, a
   962A F5            [11] 2537 	push	af
   962B 33            [ 6] 2538 	inc	sp
   962C C5            [11] 2539 	push	bc
   962D CD 96 87      [17] 2540 	call	_cpct_drawSolidBox
   9630 F1            [10] 2541 	pop	af
                           2542 ;src/main.c:645: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 40, 0); // posición para borrar la mitad izquierda
   9631 33            [ 6] 2543 	inc	sp
   9632 21 28 00      [10] 2544 	ld	hl,#0x0028
   9635 E3            [19] 2545 	ex	(sp),hl
   9636 21 00 C0      [10] 2546 	ld	hl,#0xC000
   9639 E5            [11] 2547 	push	hl
   963A CD 70 88      [17] 2548 	call	_cpct_getScreenPtr
   963D 4D            [ 4] 2549 	ld	c,l
   963E 44            [ 4] 2550 	ld	b,h
                           2551 ;src/main.c:646: cpct_drawSolidBox(memptr, 0, 40, 24);  //borra la mitad izquierda
   963F 21 28 18      [10] 2552 	ld	hl,#0x1828
   9642 E5            [11] 2553 	push	hl
   9643 AF            [ 4] 2554 	xor	a, a
   9644 F5            [11] 2555 	push	af
   9645 33            [ 6] 2556 	inc	sp
   9646 C5            [11] 2557 	push	bc
   9647 CD 96 87      [17] 2558 	call	_cpct_drawSolidBox
   964A F1            [10] 2559 	pop	af
   964B F1            [10] 2560 	pop	af
   964C 33            [ 6] 2561 	inc	sp
   964D C9            [10] 2562 	ret
                           2563 ;src/main.c:649: void menuInicio(){
                           2564 ;	---------------------------------
                           2565 ; Function menuInicio
                           2566 ; ---------------------------------
   964E                    2567 _menuInicio::
                           2568 ;src/main.c:653: cpct_clearScreen(0);
   964E 21 00 40      [10] 2569 	ld	hl,#0x4000
   9651 E5            [11] 2570 	push	hl
   9652 AF            [ 4] 2571 	xor	a, a
   9653 F5            [11] 2572 	push	af
   9654 33            [ 6] 2573 	inc	sp
   9655 26 C0         [ 7] 2574 	ld	h, #0xC0
   9657 E5            [11] 2575 	push	hl
   9658 CD 2A 7F      [17] 2576 	call	_cpct_memset
                           2577 ;src/main.c:655: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   965B 21 1A 0F      [10] 2578 	ld	hl,#0x0F1A
   965E E5            [11] 2579 	push	hl
   965F 21 00 C0      [10] 2580 	ld	hl,#0xC000
   9662 E5            [11] 2581 	push	hl
   9663 CD 70 88      [17] 2582 	call	_cpct_getScreenPtr
   9666 4D            [ 4] 2583 	ld	c,l
   9667 44            [ 4] 2584 	ld	b,h
                           2585 ;src/main.c:656: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   9668 21 04 00      [10] 2586 	ld	hl,#0x0004
   966B E5            [11] 2587 	push	hl
   966C C5            [11] 2588 	push	bc
   966D 21 01 97      [10] 2589 	ld	hl,#___str_5
   9670 E5            [11] 2590 	push	hl
   9671 CD 7B 7C      [17] 2591 	call	_cpct_drawStringM0
   9674 21 06 00      [10] 2592 	ld	hl,#6
   9677 39            [11] 2593 	add	hl,sp
   9678 F9            [ 6] 2594 	ld	sp,hl
                           2595 ;src/main.c:658: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   9679 21 28 6E      [10] 2596 	ld	hl,#0x6E28
   967C E5            [11] 2597 	push	hl
   967D 21 F0 F0      [10] 2598 	ld	hl,#0xF0F0
   9680 E5            [11] 2599 	push	hl
   9681 21 00 56      [10] 2600 	ld	hl,#_g_text_0
   9684 E5            [11] 2601 	push	hl
   9685 CD 9F 7C      [17] 2602 	call	_cpct_drawSprite
                           2603 ;src/main.c:659: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   9688 21 28 6E      [10] 2604 	ld	hl,#0x6E28
   968B E5            [11] 2605 	push	hl
   968C 21 18 F1      [10] 2606 	ld	hl,#0xF118
   968F E5            [11] 2607 	push	hl
   9690 21 30 67      [10] 2608 	ld	hl,#_g_text_1
   9693 E5            [11] 2609 	push	hl
   9694 CD 9F 7C      [17] 2610 	call	_cpct_drawSprite
                           2611 ;src/main.c:682: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   9697 21 08 A0      [10] 2612 	ld	hl,#0xA008
   969A E5            [11] 2613 	push	hl
   969B 21 00 C0      [10] 2614 	ld	hl,#0xC000
   969E E5            [11] 2615 	push	hl
   969F CD 70 88      [17] 2616 	call	_cpct_getScreenPtr
   96A2 4D            [ 4] 2617 	ld	c,l
   96A3 44            [ 4] 2618 	ld	b,h
                           2619 ;src/main.c:683: cpct_drawStringM0("TO START PRESS S", memptr, 4, 0);
   96A4 21 04 00      [10] 2620 	ld	hl,#0x0004
   96A7 E5            [11] 2621 	push	hl
   96A8 C5            [11] 2622 	push	bc
   96A9 21 09 97      [10] 2623 	ld	hl,#___str_6
   96AC E5            [11] 2624 	push	hl
   96AD CD 7B 7C      [17] 2625 	call	_cpct_drawStringM0
   96B0 21 06 00      [10] 2626 	ld	hl,#6
   96B3 39            [11] 2627 	add	hl,sp
   96B4 F9            [ 6] 2628 	ld	sp,hl
                           2629 ;src/main.c:685: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 170); // centrado en horizontal y abajo en vertical
   96B5 21 0A AA      [10] 2630 	ld	hl,#0xAA0A
   96B8 E5            [11] 2631 	push	hl
   96B9 21 00 C0      [10] 2632 	ld	hl,#0xC000
   96BC E5            [11] 2633 	push	hl
   96BD CD 70 88      [17] 2634 	call	_cpct_getScreenPtr
   96C0 4D            [ 4] 2635 	ld	c,l
   96C1 44            [ 4] 2636 	ld	b,h
                           2637 ;src/main.c:686: cpct_drawStringM0("TO MENU PRESS M", memptr, 4, 0);
   96C2 21 04 00      [10] 2638 	ld	hl,#0x0004
   96C5 E5            [11] 2639 	push	hl
   96C6 C5            [11] 2640 	push	bc
   96C7 21 1A 97      [10] 2641 	ld	hl,#___str_7
   96CA E5            [11] 2642 	push	hl
   96CB CD 7B 7C      [17] 2643 	call	_cpct_drawStringM0
   96CE 21 06 00      [10] 2644 	ld	hl,#6
   96D1 39            [11] 2645 	add	hl,sp
   96D2 F9            [ 6] 2646 	ld	sp,hl
                           2647 ;src/main.c:689: do{
   96D3                    2648 00106$:
                           2649 ;src/main.c:690: cpct_scanKeyboard_f();
   96D3 CD 05 7C      [17] 2650 	call	_cpct_scanKeyboard_f
                           2651 ;src/main.c:693: else */if(cpct_isKeyPressed(Key_M)){
   96D6 21 04 40      [10] 2652 	ld	hl,#0x4004
   96D9 CD F9 7B      [17] 2653 	call	_cpct_isKeyPressed
   96DC 7D            [ 4] 2654 	ld	a,l
   96DD B7            [ 4] 2655 	or	a, a
   96DE 28 0D         [12] 2656 	jr	Z,00107$
                           2657 ;src/main.c:694: cpct_scanKeyboard_f();
   96E0 CD 05 7C      [17] 2658 	call	_cpct_scanKeyboard_f
                           2659 ;src/main.c:695: do{
   96E3                    2660 00101$:
                           2661 ;src/main.c:697: } while(!cpct_isKeyPressed(Key_S));
   96E3 21 07 10      [10] 2662 	ld	hl,#0x1007
   96E6 CD F9 7B      [17] 2663 	call	_cpct_isKeyPressed
   96E9 7D            [ 4] 2664 	ld	a,l
   96EA B7            [ 4] 2665 	or	a, a
   96EB 28 F6         [12] 2666 	jr	Z,00101$
   96ED                    2667 00107$:
                           2668 ;src/main.c:699: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   96ED 21 07 10      [10] 2669 	ld	hl,#0x1007
   96F0 CD F9 7B      [17] 2670 	call	_cpct_isKeyPressed
   96F3 7D            [ 4] 2671 	ld	a,l
   96F4 B7            [ 4] 2672 	or	a, a
   96F5 C0            [11] 2673 	ret	NZ
   96F6 21 04 40      [10] 2674 	ld	hl,#0x4004
   96F9 CD F9 7B      [17] 2675 	call	_cpct_isKeyPressed
   96FC 7D            [ 4] 2676 	ld	a,l
   96FD B7            [ 4] 2677 	or	a, a
   96FE 28 D3         [12] 2678 	jr	Z,00106$
   9700 C9            [10] 2679 	ret
   9701                    2680 ___str_5:
   9701 52 4F 42 4F 42 49  2681 	.ascii "ROBOBIT"
        54
   9708 00                 2682 	.db 0x00
   9709                    2683 ___str_6:
   9709 54 4F 20 53 54 41  2684 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   9719 00                 2685 	.db 0x00
   971A                    2686 ___str_7:
   971A 54 4F 20 4D 45 4E  2687 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   9729 00                 2688 	.db 0x00
                           2689 ;src/main.c:702: void inicializarCPC() {
                           2690 ;	---------------------------------
                           2691 ; Function inicializarCPC
                           2692 ; ---------------------------------
   972A                    2693 _inicializarCPC::
                           2694 ;src/main.c:703: cpct_disableFirmware();
   972A CD 61 87      [17] 2695 	call	_cpct_disableFirmware
                           2696 ;src/main.c:704: cpct_setVideoMode(0);
   972D 2E 00         [ 7] 2697 	ld	l,#0x00
   972F CD 0C 7F      [17] 2698 	call	_cpct_setVideoMode
                           2699 ;src/main.c:705: cpct_setBorder(HW_BLACK);
   9732 21 10 14      [10] 2700 	ld	hl,#0x1410
   9735 E5            [11] 2701 	push	hl
   9736 CD 6F 7C      [17] 2702 	call	_cpct_setPALColour
                           2703 ;src/main.c:706: cpct_setPalette(g_palette, 16);
   9739 21 10 00      [10] 2704 	ld	hl,#0x0010
   973C E5            [11] 2705 	push	hl
   973D 21 98 7A      [10] 2706 	ld	hl,#_g_palette
   9740 E5            [11] 2707 	push	hl
   9741 CD E2 7B      [17] 2708 	call	_cpct_setPalette
                           2709 ;src/main.c:707: cpct_akp_musicInit(G_song);
   9744 21 00 3F      [10] 2710 	ld	hl,#_G_song
   9747 E5            [11] 2711 	push	hl
   9748 CD 3D 86      [17] 2712 	call	_cpct_akp_musicInit
   974B F1            [10] 2713 	pop	af
   974C C9            [10] 2714 	ret
                           2715 ;src/main.c:710: void inicializarEnemy() {
                           2716 ;	---------------------------------
                           2717 ; Function inicializarEnemy
                           2718 ; ---------------------------------
   974D                    2719 _inicializarEnemy::
   974D DD E5         [15] 2720 	push	ix
   974F DD 21 00 00   [14] 2721 	ld	ix,#0
   9753 DD 39         [15] 2722 	add	ix,sp
   9755 3B            [ 6] 2723 	dec	sp
                           2724 ;src/main.c:716: actual = enemy;
   9756 01 F4 88      [10] 2725 	ld	bc,#_enemy+0
                           2726 ;src/main.c:717: while(--i){
   9759 DD 36 FF 05   [19] 2727 	ld	-1 (ix),#0x05
   975D                    2728 00101$:
   975D DD 35 FF      [23] 2729 	dec	-1 (ix)
   9760 DD 7E FF      [19] 2730 	ld	a,-1 (ix)
   9763 B7            [ 4] 2731 	or	a, a
   9764 28 62         [12] 2732 	jr	Z,00104$
                           2733 ;src/main.c:718: actual->x = actual->px = spawnX[i];
   9766 59            [ 4] 2734 	ld	e, c
   9767 50            [ 4] 2735 	ld	d, b
   9768 13            [ 6] 2736 	inc	de
   9769 13            [ 6] 2737 	inc	de
   976A 3E 55         [ 7] 2738 	ld	a,#<(_spawnX)
   976C DD 86 FF      [19] 2739 	add	a, -1 (ix)
   976F 6F            [ 4] 2740 	ld	l,a
   9770 3E 89         [ 7] 2741 	ld	a,#>(_spawnX)
   9772 CE 00         [ 7] 2742 	adc	a, #0x00
   9774 67            [ 4] 2743 	ld	h,a
   9775 7E            [ 7] 2744 	ld	a,(hl)
   9776 12            [ 7] 2745 	ld	(de),a
   9777 02            [ 7] 2746 	ld	(bc),a
                           2747 ;src/main.c:719: actual->y = actual->py = spawnY[i];
   9778 C5            [11] 2748 	push	bc
   9779 FD E1         [14] 2749 	pop	iy
   977B FD 23         [10] 2750 	inc	iy
   977D 59            [ 4] 2751 	ld	e, c
   977E 50            [ 4] 2752 	ld	d, b
   977F 13            [ 6] 2753 	inc	de
   9780 13            [ 6] 2754 	inc	de
   9781 13            [ 6] 2755 	inc	de
   9782 3E 5A         [ 7] 2756 	ld	a,#<(_spawnY)
   9784 DD 86 FF      [19] 2757 	add	a, -1 (ix)
   9787 6F            [ 4] 2758 	ld	l,a
   9788 3E 89         [ 7] 2759 	ld	a,#>(_spawnY)
   978A CE 00         [ 7] 2760 	adc	a, #0x00
   978C 67            [ 4] 2761 	ld	h,a
   978D 7E            [ 7] 2762 	ld	a,(hl)
   978E 12            [ 7] 2763 	ld	(de),a
   978F FD 77 00      [19] 2764 	ld	0 (iy), a
                           2765 ;src/main.c:720: actual->mover  = NO;
   9792 21 06 00      [10] 2766 	ld	hl,#0x0006
   9795 09            [11] 2767 	add	hl,bc
   9796 36 00         [10] 2768 	ld	(hl),#0x00
                           2769 ;src/main.c:721: actual->mira   = M_abajo;
   9798 21 07 00      [10] 2770 	ld	hl,#0x0007
   979B 09            [11] 2771 	add	hl,bc
   979C 36 03         [10] 2772 	ld	(hl),#0x03
                           2773 ;src/main.c:722: actual->sprite = g_enemy;
   979E 21 04 00      [10] 2774 	ld	hl,#0x0004
   97A1 09            [11] 2775 	add	hl,bc
   97A2 36 72         [10] 2776 	ld	(hl),#<(_g_enemy)
   97A4 23            [ 6] 2777 	inc	hl
   97A5 36 78         [10] 2778 	ld	(hl),#>(_g_enemy)
                           2779 ;src/main.c:723: actual->muerto = NO;
   97A7 21 08 00      [10] 2780 	ld	hl,#0x0008
   97AA 09            [11] 2781 	add	hl,bc
   97AB 36 00         [10] 2782 	ld	(hl),#0x00
                           2783 ;src/main.c:724: actual->muertes = 0;
   97AD 21 0B 00      [10] 2784 	ld	hl,#0x000B
   97B0 09            [11] 2785 	add	hl,bc
   97B1 36 00         [10] 2786 	ld	(hl),#0x00
                           2787 ;src/main.c:725: actual->patrol = SI;
   97B3 21 09 00      [10] 2788 	ld	hl,#0x0009
   97B6 09            [11] 2789 	add	hl,bc
   97B7 36 01         [10] 2790 	ld	(hl),#0x01
                           2791 ;src/main.c:727: dibujarEnemigo(actual);
   97B9 C5            [11] 2792 	push	bc
   97BA C5            [11] 2793 	push	bc
   97BB CD DA 8B      [17] 2794 	call	_dibujarEnemigo
   97BE F1            [10] 2795 	pop	af
   97BF C1            [10] 2796 	pop	bc
                           2797 ;src/main.c:729: ++actual;
   97C0 21 0C 00      [10] 2798 	ld	hl,#0x000C
   97C3 09            [11] 2799 	add	hl,bc
   97C4 4D            [ 4] 2800 	ld	c,l
   97C5 44            [ 4] 2801 	ld	b,h
   97C6 18 95         [12] 2802 	jr	00101$
   97C8                    2803 00104$:
   97C8 33            [ 6] 2804 	inc	sp
   97C9 DD E1         [14] 2805 	pop	ix
   97CB C9            [10] 2806 	ret
                           2807 ;src/main.c:733: void inicializarJuego() {
                           2808 ;	---------------------------------
                           2809 ; Function inicializarJuego
                           2810 ; ---------------------------------
   97CC                    2811 _inicializarJuego::
                           2812 ;src/main.c:735: num_mapa = 0;
   97CC 21 38 89      [10] 2813 	ld	hl,#_num_mapa + 0
   97CF 36 00         [10] 2814 	ld	(hl), #0x00
                           2815 ;src/main.c:736: mapa = mapas[num_mapa];
   97D1 21 4F 89      [10] 2816 	ld	hl, #_mapas + 0
   97D4 7E            [ 7] 2817 	ld	a,(hl)
   97D5 FD 21 36 89   [14] 2818 	ld	iy,#_mapa
   97D9 FD 77 00      [19] 2819 	ld	0 (iy),a
   97DC 23            [ 6] 2820 	inc	hl
   97DD 7E            [ 7] 2821 	ld	a,(hl)
   97DE 32 37 89      [13] 2822 	ld	(#_mapa + 1),a
                           2823 ;src/main.c:737: cpct_etm_setTileset2x4(g_tileset);
   97E1 21 E0 54      [10] 2824 	ld	hl,#_g_tileset
   97E4 CD D3 7D      [17] 2825 	call	_cpct_etm_setTileset2x4
                           2826 ;src/main.c:739: dibujarMapa();
   97E7 CD 39 89      [17] 2827 	call	_dibujarMapa
                           2828 ;src/main.c:741: borrarPantallaArriba();
   97EA CD 19 96      [17] 2829 	call	_borrarPantallaArriba
                           2830 ;src/main.c:742: barraPuntuacionInicial();
   97ED CD 57 95      [17] 2831 	call	_barraPuntuacionInicial
                           2832 ;src/main.c:745: prota.x = prota.px = 4;
   97F0 21 26 89      [10] 2833 	ld	hl,#(_prota + 0x0002)
   97F3 36 04         [10] 2834 	ld	(hl),#0x04
   97F5 21 24 89      [10] 2835 	ld	hl,#_prota
   97F8 36 04         [10] 2836 	ld	(hl),#0x04
                           2837 ;src/main.c:746: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   97FA 21 27 89      [10] 2838 	ld	hl,#(_prota + 0x0003)
   97FD 36 68         [10] 2839 	ld	(hl),#0x68
   97FF 21 25 89      [10] 2840 	ld	hl,#(_prota + 0x0001)
   9802 36 68         [10] 2841 	ld	(hl),#0x68
                           2842 ;src/main.c:747: prota.mover  = NO;
   9804 21 2A 89      [10] 2843 	ld	hl,#(_prota + 0x0006)
   9807 36 00         [10] 2844 	ld	(hl),#0x00
                           2845 ;src/main.c:748: prota.mira=M_derecha;
   9809 21 2B 89      [10] 2846 	ld	hl,#(_prota + 0x0007)
   980C 36 00         [10] 2847 	ld	(hl),#0x00
                           2848 ;src/main.c:749: prota.sprite = g_hero;
   980E 21 A8 7A      [10] 2849 	ld	hl,#_g_hero
   9811 22 28 89      [16] 2850 	ld	((_prota + 0x0004)), hl
                           2851 ;src/main.c:753: cu.x = cu.px = 0;
   9814 21 2E 89      [10] 2852 	ld	hl,#(_cu + 0x0002)
   9817 36 00         [10] 2853 	ld	(hl),#0x00
   9819 21 2C 89      [10] 2854 	ld	hl,#_cu
   981C 36 00         [10] 2855 	ld	(hl),#0x00
                           2856 ;src/main.c:754: cu.y = cu.py = 0;
   981E 21 2F 89      [10] 2857 	ld	hl,#(_cu + 0x0003)
   9821 36 00         [10] 2858 	ld	(hl),#0x00
   9823 21 2D 89      [10] 2859 	ld	hl,#(_cu + 0x0001)
   9826 36 00         [10] 2860 	ld	(hl),#0x00
                           2861 ;src/main.c:755: cu.lanzado = NO;
   9828 21 32 89      [10] 2862 	ld	hl,#(_cu + 0x0006)
   982B 36 00         [10] 2863 	ld	(hl),#0x00
                           2864 ;src/main.c:756: cu.mover = NO;
   982D 21 35 89      [10] 2865 	ld	hl,#(_cu + 0x0009)
   9830 36 00         [10] 2866 	ld	(hl),#0x00
                           2867 ;src/main.c:758: inicializarEnemy();
   9832 CD 4D 97      [17] 2868 	call	_inicializarEnemy
                           2869 ;src/main.c:760: dibujarProta();
   9835 C3 5F 89      [10] 2870 	jp  _dibujarProta
                           2871 ;src/main.c:763: void main(void) {
                           2872 ;	---------------------------------
                           2873 ; Function main
                           2874 ; ---------------------------------
   9838                    2875 _main::
                           2876 ;src/main.c:767: inicializarCPC();
   9838 CD 2A 97      [17] 2877 	call	_inicializarCPC
                           2878 ;src/main.c:768: menuInicio();
   983B CD 4E 96      [17] 2879 	call	_menuInicio
                           2880 ;src/main.c:772: inicializarJuego();
   983E CD CC 97      [17] 2881 	call	_inicializarJuego
                           2882 ;src/main.c:777: cpct_akp_musicPlay();
   9841 CD 3A 7F      [17] 2883 	call	_cpct_akp_musicPlay
                           2884 ;src/main.c:779: while (1) {
   9844                    2885 00122$:
                           2886 ;src/main.c:782: actual = enemy;
                           2887 ;src/main.c:784: comprobarTeclado();
   9844 CD 50 93      [17] 2888 	call	_comprobarTeclado
                           2889 ;src/main.c:785: moverCuchillo();
   9847 CD 6B 94      [17] 2890 	call	_moverCuchillo
                           2891 ;src/main.c:787: while(--i){
   984A 11 F4 88      [10] 2892 	ld	de,#_enemy
   984D 0E 05         [ 7] 2893 	ld	c,#0x05
   984F                    2894 00101$:
   984F 0D            [ 4] 2895 	dec c
   9850 28 11         [12] 2896 	jr	Z,00103$
                           2897 ;src/main.c:788: moverEnemigo(actual);
   9852 C5            [11] 2898 	push	bc
   9853 D5            [11] 2899 	push	de
   9854 D5            [11] 2900 	push	de
   9855 CD E1 8F      [17] 2901 	call	_moverEnemigo
   9858 F1            [10] 2902 	pop	af
   9859 D1            [10] 2903 	pop	de
   985A C1            [10] 2904 	pop	bc
                           2905 ;src/main.c:789: ++actual;
   985B 21 0C 00      [10] 2906 	ld	hl,#0x000C
   985E 19            [11] 2907 	add	hl,de
   985F 5D            [ 4] 2908 	ld	e,l
   9860 54            [ 4] 2909 	ld	d,h
   9861 18 EC         [12] 2910 	jr	00101$
   9863                    2911 00103$:
                           2912 ;src/main.c:792: actual = enemy;
   9863 01 F4 88      [10] 2913 	ld	bc,#_enemy
                           2914 ;src/main.c:794: cpct_waitVSYNC();
   9866 C5            [11] 2915 	push	bc
   9867 CD 04 7F      [17] 2916 	call	_cpct_waitVSYNC
   986A C1            [10] 2917 	pop	bc
                           2918 ;src/main.c:796: if (prota.mover) {
   986B 11 2A 89      [10] 2919 	ld	de,#_prota+6
   986E 1A            [ 7] 2920 	ld	a,(de)
   986F B7            [ 4] 2921 	or	a, a
   9870 28 09         [12] 2922 	jr	Z,00105$
                           2923 ;src/main.c:797: redibujarProta();
   9872 C5            [11] 2924 	push	bc
   9873 D5            [11] 2925 	push	de
   9874 CD 30 8A      [17] 2926 	call	_redibujarProta
   9877 D1            [10] 2927 	pop	de
   9878 C1            [10] 2928 	pop	bc
                           2929 ;src/main.c:798: prota.mover = NO;
   9879 AF            [ 4] 2930 	xor	a, a
   987A 12            [ 7] 2931 	ld	(de),a
   987B                    2932 00105$:
                           2933 ;src/main.c:800: if(cu.lanzado && cu.mover){
   987B 21 32 89      [10] 2934 	ld	hl,#_cu + 6
   987E 5E            [ 7] 2935 	ld	e,(hl)
   987F 21 35 89      [10] 2936 	ld	hl,#_cu + 9
   9882 7B            [ 4] 2937 	ld	a,e
   9883 B7            [ 4] 2938 	or	a, a
   9884 28 0B         [12] 2939 	jr	Z,00110$
   9886 7E            [ 7] 2940 	ld	a,(hl)
   9887 B7            [ 4] 2941 	or	a, a
   9888 28 07         [12] 2942 	jr	Z,00110$
                           2943 ;src/main.c:801: redibujarCuchillo();
   988A C5            [11] 2944 	push	bc
   988B CD 20 92      [17] 2945 	call	_redibujarCuchillo
   988E C1            [10] 2946 	pop	bc
   988F 18 0D         [12] 2947 	jr	00137$
   9891                    2948 00110$:
                           2949 ;src/main.c:802: }else if (cu.lanzado && !cu.mover){
   9891 7B            [ 4] 2950 	ld	a,e
   9892 B7            [ 4] 2951 	or	a, a
   9893 28 09         [12] 2952 	jr	Z,00137$
   9895 7E            [ 7] 2953 	ld	a,(hl)
   9896 B7            [ 4] 2954 	or	a, a
   9897 20 05         [12] 2955 	jr	NZ,00137$
                           2956 ;src/main.c:803: borrarCuchillo();
   9899 C5            [11] 2957 	push	bc
   989A CD A2 91      [17] 2958 	call	_borrarCuchillo
   989D C1            [10] 2959 	pop	bc
                           2960 ;src/main.c:806: while(--i){
   989E                    2961 00137$:
   989E 1E 05         [ 7] 2962 	ld	e,#0x05
   98A0                    2963 00118$:
   98A0 1D            [ 4] 2964 	dec	e
   98A1 7B            [ 4] 2965 	ld	a,e
   98A2 B7            [ 4] 2966 	or	a, a
   98A3 28 49         [12] 2967 	jr	Z,00120$
                           2968 ;src/main.c:807: if(actual->mover){
   98A5 C5            [11] 2969 	push	bc
   98A6 FD E1         [14] 2970 	pop	iy
   98A8 FD 7E 06      [19] 2971 	ld	a,6 (iy)
   98AB B7            [ 4] 2972 	or	a, a
   98AC 28 09         [12] 2973 	jr	Z,00114$
                           2974 ;src/main.c:808: redibujarEnemigo(actual);
   98AE C5            [11] 2975 	push	bc
   98AF D5            [11] 2976 	push	de
   98B0 C5            [11] 2977 	push	bc
   98B1 CD 4E 8D      [17] 2978 	call	_redibujarEnemigo
   98B4 F1            [10] 2979 	pop	af
   98B5 D1            [10] 2980 	pop	de
   98B6 C1            [10] 2981 	pop	bc
   98B7                    2982 00114$:
                           2983 ;src/main.c:810: if (actual->muerto && actual->muertes == 0){
   98B7 C5            [11] 2984 	push	bc
   98B8 FD E1         [14] 2985 	pop	iy
   98BA FD 7E 08      [19] 2986 	ld	a,8 (iy)
   98BD B7            [ 4] 2987 	or	a, a
   98BE 28 26         [12] 2988 	jr	Z,00116$
   98C0 21 0B 00      [10] 2989 	ld	hl,#0x000B
   98C3 09            [11] 2990 	add	hl,bc
   98C4 7E            [ 7] 2991 	ld	a,(hl)
   98C5 B7            [ 4] 2992 	or	a, a
   98C6 20 1E         [12] 2993 	jr	NZ,00116$
                           2994 ;src/main.c:811: borrarEnemigo(actual);
   98C8 E5            [11] 2995 	push	hl
   98C9 C5            [11] 2996 	push	bc
   98CA D5            [11] 2997 	push	de
   98CB C5            [11] 2998 	push	bc
   98CC CD BA 8C      [17] 2999 	call	_borrarEnemigo
   98CF F1            [10] 3000 	pop	af
   98D0 D1            [10] 3001 	pop	de
   98D1 C1            [10] 3002 	pop	bc
   98D2 C5            [11] 3003 	push	bc
   98D3 D5            [11] 3004 	push	de
   98D4 C5            [11] 3005 	push	bc
   98D5 CD 12 8C      [17] 3006 	call	_dibujarExplosion
   98D8 F1            [10] 3007 	pop	af
   98D9 D1            [10] 3008 	pop	de
   98DA C1            [10] 3009 	pop	bc
   98DB E1            [10] 3010 	pop	hl
                           3011 ;src/main.c:814: actual->muertes++;
   98DC 56            [ 7] 3012 	ld	d,(hl)
   98DD 14            [ 4] 3013 	inc	d
   98DE 72            [ 7] 3014 	ld	(hl),d
                           3015 ;src/main.c:815: actual->x = 0;
   98DF AF            [ 4] 3016 	xor	a, a
   98E0 02            [ 7] 3017 	ld	(bc),a
                           3018 ;src/main.c:816: actual->y = 0;
   98E1 69            [ 4] 3019 	ld	l, c
   98E2 60            [ 4] 3020 	ld	h, b
   98E3 23            [ 6] 3021 	inc	hl
   98E4 36 00         [10] 3022 	ld	(hl),#0x00
   98E6                    3023 00116$:
                           3024 ;src/main.c:818: ++actual;
   98E6 21 0C 00      [10] 3025 	ld	hl,#0x000C
   98E9 09            [11] 3026 	add	hl,bc
   98EA 4D            [ 4] 3027 	ld	c,l
   98EB 44            [ 4] 3028 	ld	b,h
   98EC 18 B2         [12] 3029 	jr	00118$
   98EE                    3030 00120$:
                           3031 ;src/main.c:820: cpct_waitVSYNC();
   98EE CD 04 7F      [17] 3032 	call	_cpct_waitVSYNC
   98F1 C3 44 98      [10] 3033 	jp	00122$
                           3034 	.area _CODE
                           3035 	.area _INITIALIZER
                           3036 	.area _CABS (ABS)
   3F00                    3037 	.org 0x3F00
   3F00                    3038 _G_song:
   3F00 41                 3039 	.db #0x41	; 65	'A'
   3F01 54                 3040 	.db #0x54	; 84	'T'
   3F02 31                 3041 	.db #0x31	; 49	'1'
   3F03 30                 3042 	.db #0x30	; 48	'0'
   3F04 01                 3043 	.db #0x01	; 1
   3F05 40                 3044 	.db #0x40	; 64
   3F06 42                 3045 	.db #0x42	; 66	'B'
   3F07 0F                 3046 	.db #0x0F	; 15
   3F08 02                 3047 	.db #0x02	; 2
   3F09 06                 3048 	.db #0x06	; 6
   3F0A 1D                 3049 	.db #0x1D	; 29
   3F0B 00                 3050 	.db #0x00	; 0
   3F0C 10                 3051 	.db #0x10	; 16
   3F0D 40                 3052 	.db #0x40	; 64
   3F0E 19                 3053 	.db #0x19	; 25
   3F0F 40                 3054 	.db #0x40	; 64
   3F10 00                 3055 	.db #0x00	; 0
   3F11 00                 3056 	.db #0x00	; 0
   3F12 00                 3057 	.db #0x00	; 0
   3F13 00                 3058 	.db #0x00	; 0
   3F14 00                 3059 	.db #0x00	; 0
   3F15 00                 3060 	.db #0x00	; 0
   3F16 0D                 3061 	.db #0x0D	; 13
   3F17 12                 3062 	.db #0x12	; 18
   3F18 40                 3063 	.db #0x40	; 64
   3F19 01                 3064 	.db #0x01	; 1
   3F1A 00                 3065 	.db #0x00	; 0
   3F1B 7C                 3066 	.db #0x7C	; 124
   3F1C 18                 3067 	.db #0x18	; 24
   3F1D 78                 3068 	.db #0x78	; 120	'x'
   3F1E 0C                 3069 	.db #0x0C	; 12
   3F1F 34                 3070 	.db #0x34	; 52	'4'
   3F20 30                 3071 	.db #0x30	; 48	'0'
   3F21 2C                 3072 	.db #0x2C	; 44
   3F22 28                 3073 	.db #0x28	; 40
   3F23 24                 3074 	.db #0x24	; 36
   3F24 20                 3075 	.db #0x20	; 32
   3F25 1C                 3076 	.db #0x1C	; 28
   3F26 0D                 3077 	.db #0x0D	; 13
   3F27 25                 3078 	.db #0x25	; 37
   3F28 40                 3079 	.db #0x40	; 64
   3F29 20                 3080 	.db #0x20	; 32
   3F2A 00                 3081 	.db #0x00	; 0
   3F2B 00                 3082 	.db #0x00	; 0
   3F2C 00                 3083 	.db #0x00	; 0
   3F2D 39                 3084 	.db #0x39	; 57	'9'
   3F2E 40                 3085 	.db #0x40	; 64
   3F2F 00                 3086 	.db #0x00	; 0
   3F30 57                 3087 	.db #0x57	; 87	'W'
   3F31 40                 3088 	.db #0x40	; 64
   3F32 3B                 3089 	.db #0x3B	; 59
   3F33 40                 3090 	.db #0x40	; 64
   3F34 57                 3091 	.db #0x57	; 87	'W'
   3F35 40                 3092 	.db #0x40	; 64
   3F36 01                 3093 	.db #0x01	; 1
   3F37 2F                 3094 	.db #0x2F	; 47
   3F38 40                 3095 	.db #0x40	; 64
   3F39 19                 3096 	.db #0x19	; 25
   3F3A 00                 3097 	.db #0x00	; 0
   3F3B 76                 3098 	.db #0x76	; 118	'v'
   3F3C E1                 3099 	.db #0xE1	; 225
   3F3D 00                 3100 	.db #0x00	; 0
   3F3E 00                 3101 	.db #0x00	; 0
   3F3F 01                 3102 	.db #0x01	; 1
   3F40 04                 3103 	.db #0x04	; 4
   3F41 51                 3104 	.db #0x51	; 81	'Q'
   3F42 04                 3105 	.db #0x04	; 4
   3F43 37                 3106 	.db #0x37	; 55	'7'
   3F44 04                 3107 	.db #0x04	; 4
   3F45 4F                 3108 	.db #0x4F	; 79	'O'
   3F46 04                 3109 	.db #0x04	; 4
   3F47 37                 3110 	.db #0x37	; 55	'7'
   3F48 02                 3111 	.db #0x02	; 2
   3F49 4B                 3112 	.db #0x4B	; 75	'K'
   3F4A 02                 3113 	.db #0x02	; 2
   3F4B 37                 3114 	.db #0x37	; 55	'7'
   3F4C 04                 3115 	.db #0x04	; 4
   3F4D 4F                 3116 	.db #0x4F	; 79	'O'
   3F4E 04                 3117 	.db #0x04	; 4
   3F4F 37                 3118 	.db #0x37	; 55	'7'
   3F50 04                 3119 	.db #0x04	; 4
   3F51 4F                 3120 	.db #0x4F	; 79	'O'
   3F52 04                 3121 	.db #0x04	; 4
   3F53 37                 3122 	.db #0x37	; 55	'7'
   3F54 02                 3123 	.db #0x02	; 2
   3F55 4B                 3124 	.db #0x4B	; 75	'K'
   3F56 00                 3125 	.db #0x00	; 0
   3F57 42                 3126 	.db #0x42	; 66	'B'
   3F58 60                 3127 	.db #0x60	; 96
   3F59 00                 3128 	.db #0x00	; 0
   3F5A 42                 3129 	.db #0x42	; 66	'B'
   3F5B 80                 3130 	.db #0x80	; 128
   3F5C 00                 3131 	.db #0x00	; 0
   3F5D 00                 3132 	.db #0x00	; 0
   3F5E 42                 3133 	.db #0x42	; 66	'B'
   3F5F 00                 3134 	.db #0x00	; 0
   3F60 00                 3135 	.db #0x00	; 0
