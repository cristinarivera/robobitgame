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
   88F4                      90 	.ds 44
   8920                      91 _prota::
   8920                      92 	.ds 8
   8928                      93 _cu::
   8928                      94 	.ds 10
   8932                      95 _mapa::
   8932                      96 	.ds 2
   8934                      97 _num_mapa::
   8934                      98 	.ds 1
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
                            123 ;src/main.c:119: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
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
                            164 ;src/main.c:122: void dibujarMapa() {
                            165 ;	---------------------------------
                            166 ; Function dibujarMapa
                            167 ; ---------------------------------
   8935                     168 _dibujarMapa::
                            169 ;src/main.c:123: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   8935 2A 32 89      [16]  170 	ld	hl,(_mapa)
   8938 E5            [11]  171 	push	hl
   8939 21 F0 C0      [10]  172 	ld	hl,#0xC0F0
   893C E5            [11]  173 	push	hl
   893D 21 2C 28      [10]  174 	ld	hl,#0x282C
   8940 E5            [11]  175 	push	hl
   8941 2E 00         [ 7]  176 	ld	l, #0x00
   8943 E5            [11]  177 	push	hl
   8944 AF            [ 4]  178 	xor	a, a
   8945 F5            [11]  179 	push	af
   8946 33            [ 6]  180 	inc	sp
   8947 CD 44 7D      [17]  181 	call	_cpct_etm_drawTileBox2x4
   894A C9            [10]  182 	ret
   894B                     183 _mapas:
   894B C0 4D               184 	.dw _g_map1
   894D E0 46               185 	.dw _g_map2
   894F 00 40               186 	.dw _g_map3
   8951                     187 _spawnX:
   8951 00                  188 	.db #0x00	; 0
   8952 28                  189 	.db #0x28	; 40
   8953 47                  190 	.db #0x47	; 71	'G'
   8954 14                  191 	.db #0x14	; 20
   8955 3C                  192 	.db #0x3C	; 60
   8956                     193 _spawnY:
   8956 18                  194 	.db #0x18	; 24
   8957 2C                  195 	.db #0x2C	; 44
   8958 72                  196 	.db #0x72	; 114	'r'
   8959 8A                  197 	.db #0x8A	; 138
   895A 8A                  198 	.db #0x8A	; 138
                            199 ;src/main.c:128: void dibujarProta() {
                            200 ;	---------------------------------
                            201 ; Function dibujarProta
                            202 ; ---------------------------------
   895B                     203 _dibujarProta::
                            204 ;src/main.c:129: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   895B 21 21 89      [10]  205 	ld	hl, #_prota + 1
   895E 56            [ 7]  206 	ld	d,(hl)
   895F 21 20 89      [10]  207 	ld	hl, #_prota + 0
   8962 46            [ 7]  208 	ld	b,(hl)
   8963 D5            [11]  209 	push	de
   8964 33            [ 6]  210 	inc	sp
   8965 C5            [11]  211 	push	bc
   8966 33            [ 6]  212 	inc	sp
   8967 21 00 C0      [10]  213 	ld	hl,#0xC000
   896A E5            [11]  214 	push	hl
   896B CD 70 88      [17]  215 	call	_cpct_getScreenPtr
   896E EB            [ 4]  216 	ex	de,hl
                            217 ;src/main.c:130: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   896F ED 4B 24 89   [20]  218 	ld	bc, (#_prota + 4)
   8973 21 00 3E      [10]  219 	ld	hl,#_g_tablatrans
   8976 E5            [11]  220 	push	hl
   8977 21 07 16      [10]  221 	ld	hl,#0x1607
   897A E5            [11]  222 	push	hl
   897B D5            [11]  223 	push	de
   897C C5            [11]  224 	push	bc
   897D CD 90 88      [17]  225 	call	_cpct_drawSpriteMaskedAlignedTable
   8980 C9            [10]  226 	ret
                            227 ;src/main.c:133: void borrarProta() {
                            228 ;	---------------------------------
                            229 ; Function borrarProta
                            230 ; ---------------------------------
   8981                     231 _borrarProta::
   8981 DD E5         [15]  232 	push	ix
   8983 DD 21 00 00   [14]  233 	ld	ix,#0
   8987 DD 39         [15]  234 	add	ix,sp
   8989 F5            [11]  235 	push	af
   898A 3B            [ 6]  236 	dec	sp
                            237 ;src/main.c:135: u8 w = 4 + (prota.px & 1);
   898B 21 22 89      [10]  238 	ld	hl, #_prota + 2
   898E 4E            [ 7]  239 	ld	c,(hl)
   898F 79            [ 4]  240 	ld	a,c
   8990 E6 01         [ 7]  241 	and	a, #0x01
   8992 47            [ 4]  242 	ld	b,a
   8993 04            [ 4]  243 	inc	b
   8994 04            [ 4]  244 	inc	b
   8995 04            [ 4]  245 	inc	b
   8996 04            [ 4]  246 	inc	b
                            247 ;src/main.c:138: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   8997 21 23 89      [10]  248 	ld	hl, #_prota + 3
   899A 5E            [ 7]  249 	ld	e,(hl)
   899B CB 4B         [ 8]  250 	bit	1, e
   899D 28 04         [12]  251 	jr	Z,00103$
   899F 3E 01         [ 7]  252 	ld	a,#0x01
   89A1 18 02         [12]  253 	jr	00104$
   89A3                     254 00103$:
   89A3 3E 00         [ 7]  255 	ld	a,#0x00
   89A5                     256 00104$:
   89A5 C6 06         [ 7]  257 	add	a, #0x06
   89A7 DD 77 FD      [19]  258 	ld	-3 (ix),a
                            259 ;src/main.c:140: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   89AA FD 2A 32 89   [20]  260 	ld	iy,(_mapa)
   89AE 16 00         [ 7]  261 	ld	d,#0x00
   89B0 7B            [ 4]  262 	ld	a,e
   89B1 C6 E8         [ 7]  263 	add	a,#0xE8
   89B3 DD 77 FE      [19]  264 	ld	-2 (ix),a
   89B6 7A            [ 4]  265 	ld	a,d
   89B7 CE FF         [ 7]  266 	adc	a,#0xFF
   89B9 DD 77 FF      [19]  267 	ld	-1 (ix),a
   89BC DD 6E FE      [19]  268 	ld	l,-2 (ix)
   89BF DD 66 FF      [19]  269 	ld	h,-1 (ix)
   89C2 DD CB FF 7E   [20]  270 	bit	7, -1 (ix)
   89C6 28 04         [12]  271 	jr	Z,00105$
   89C8 21 EB FF      [10]  272 	ld	hl,#0xFFEB
   89CB 19            [11]  273 	add	hl,de
   89CC                     274 00105$:
   89CC CB 2C         [ 8]  275 	sra	h
   89CE CB 1D         [ 8]  276 	rr	l
   89D0 CB 2C         [ 8]  277 	sra	h
   89D2 CB 1D         [ 8]  278 	rr	l
   89D4 55            [ 4]  279 	ld	d,l
   89D5 CB 39         [ 8]  280 	srl	c
   89D7 FD E5         [15]  281 	push	iy
   89D9 21 F0 C0      [10]  282 	ld	hl,#0xC0F0
   89DC E5            [11]  283 	push	hl
   89DD 3E 28         [ 7]  284 	ld	a,#0x28
   89DF F5            [11]  285 	push	af
   89E0 33            [ 6]  286 	inc	sp
   89E1 DD 7E FD      [19]  287 	ld	a,-3 (ix)
   89E4 F5            [11]  288 	push	af
   89E5 33            [ 6]  289 	inc	sp
   89E6 C5            [11]  290 	push	bc
   89E7 33            [ 6]  291 	inc	sp
   89E8 D5            [11]  292 	push	de
   89E9 33            [ 6]  293 	inc	sp
   89EA 79            [ 4]  294 	ld	a,c
   89EB F5            [11]  295 	push	af
   89EC 33            [ 6]  296 	inc	sp
   89ED CD 44 7D      [17]  297 	call	_cpct_etm_drawTileBox2x4
   89F0 DD F9         [10]  298 	ld	sp, ix
   89F2 DD E1         [14]  299 	pop	ix
   89F4 C9            [10]  300 	ret
                            301 ;src/main.c:143: void menuFin(){
                            302 ;	---------------------------------
                            303 ; Function menuFin
                            304 ; ---------------------------------
   89F5                     305 _menuFin::
                            306 ;src/main.c:146: cpct_clearScreen(0);
   89F5 21 00 40      [10]  307 	ld	hl,#0x4000
   89F8 E5            [11]  308 	push	hl
   89F9 AF            [ 4]  309 	xor	a, a
   89FA F5            [11]  310 	push	af
   89FB 33            [ 6]  311 	inc	sp
   89FC 26 C0         [ 7]  312 	ld	h, #0xC0
   89FE E5            [11]  313 	push	hl
   89FF CD 2A 7F      [17]  314 	call	_cpct_memset
                            315 ;src/main.c:148: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   8A02 21 18 5A      [10]  316 	ld	hl,#0x5A18
   8A05 E5            [11]  317 	push	hl
   8A06 21 00 C0      [10]  318 	ld	hl,#0xC000
   8A09 E5            [11]  319 	push	hl
   8A0A CD 70 88      [17]  320 	call	_cpct_getScreenPtr
   8A0D 4D            [ 4]  321 	ld	c,l
   8A0E 44            [ 4]  322 	ld	b,h
                            323 ;src/main.c:149: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   8A0F 21 02 00      [10]  324 	ld	hl,#0x0002
   8A12 E5            [11]  325 	push	hl
   8A13 C5            [11]  326 	push	bc
   8A14 21 22 8A      [10]  327 	ld	hl,#___str_0
   8A17 E5            [11]  328 	push	hl
   8A18 CD 7B 7C      [17]  329 	call	_cpct_drawStringM0
   8A1B 21 06 00      [10]  330 	ld	hl,#6
   8A1E 39            [11]  331 	add	hl,sp
   8A1F F9            [ 6]  332 	ld	sp,hl
                            333 ;src/main.c:151: while(1){}
   8A20                     334 00102$:
   8A20 18 FE         [12]  335 	jr	00102$
   8A22                     336 ___str_0:
   8A22 47 41 4D 45 20 4F   337 	.ascii "GAME OVER"
        56 45 52
   8A2B 00                  338 	.db 0x00
                            339 ;src/main.c:154: void redibujarProta() {
                            340 ;	---------------------------------
                            341 ; Function redibujarProta
                            342 ; ---------------------------------
   8A2C                     343 _redibujarProta::
                            344 ;src/main.c:155: borrarProta();
   8A2C CD 81 89      [17]  345 	call	_borrarProta
                            346 ;src/main.c:156: prota.px = prota.x;
   8A2F 01 22 89      [10]  347 	ld	bc,#_prota + 2
   8A32 3A 20 89      [13]  348 	ld	a, (#_prota + 0)
   8A35 02            [ 7]  349 	ld	(bc),a
                            350 ;src/main.c:157: prota.py = prota.y;
   8A36 01 23 89      [10]  351 	ld	bc,#_prota + 3
   8A39 3A 21 89      [13]  352 	ld	a, (#_prota + 1)
   8A3C 02            [ 7]  353 	ld	(bc),a
                            354 ;src/main.c:158: dibujarProta();
   8A3D C3 5B 89      [10]  355 	jp  _dibujarProta
                            356 ;src/main.c:161: u8* getTilePtr(u8 x, u8 y) {
                            357 ;	---------------------------------
                            358 ; Function getTilePtr
                            359 ; ---------------------------------
   8A40                     360 _getTilePtr::
   8A40 DD E5         [15]  361 	push	ix
   8A42 DD 21 00 00   [14]  362 	ld	ix,#0
   8A46 DD 39         [15]  363 	add	ix,sp
                            364 ;src/main.c:162: return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
   8A48 DD 4E 05      [19]  365 	ld	c,5 (ix)
   8A4B 06 00         [ 7]  366 	ld	b,#0x00
   8A4D 79            [ 4]  367 	ld	a,c
   8A4E C6 E8         [ 7]  368 	add	a,#0xE8
   8A50 5F            [ 4]  369 	ld	e,a
   8A51 78            [ 4]  370 	ld	a,b
   8A52 CE FF         [ 7]  371 	adc	a,#0xFF
   8A54 57            [ 4]  372 	ld	d,a
   8A55 6B            [ 4]  373 	ld	l, e
   8A56 62            [ 4]  374 	ld	h, d
   8A57 CB 7A         [ 8]  375 	bit	7, d
   8A59 28 04         [12]  376 	jr	Z,00103$
   8A5B 21 EB FF      [10]  377 	ld	hl,#0xFFEB
   8A5E 09            [11]  378 	add	hl,bc
   8A5F                     379 00103$:
   8A5F CB 2C         [ 8]  380 	sra	h
   8A61 CB 1D         [ 8]  381 	rr	l
   8A63 CB 2C         [ 8]  382 	sra	h
   8A65 CB 1D         [ 8]  383 	rr	l
   8A67 4D            [ 4]  384 	ld	c, l
   8A68 44            [ 4]  385 	ld	b, h
   8A69 29            [11]  386 	add	hl, hl
   8A6A 29            [11]  387 	add	hl, hl
   8A6B 09            [11]  388 	add	hl, bc
   8A6C 29            [11]  389 	add	hl, hl
   8A6D 29            [11]  390 	add	hl, hl
   8A6E 29            [11]  391 	add	hl, hl
   8A6F 4D            [ 4]  392 	ld	c,l
   8A70 44            [ 4]  393 	ld	b,h
   8A71 2A 32 89      [16]  394 	ld	hl,(_mapa)
   8A74 09            [11]  395 	add	hl,bc
   8A75 DD 4E 04      [19]  396 	ld	c,4 (ix)
   8A78 CB 39         [ 8]  397 	srl	c
   8A7A 59            [ 4]  398 	ld	e,c
   8A7B 16 00         [ 7]  399 	ld	d,#0x00
   8A7D 19            [11]  400 	add	hl,de
   8A7E DD E1         [14]  401 	pop	ix
   8A80 C9            [10]  402 	ret
                            403 ;src/main.c:165: u8 checkCollision(int direction) { // check optimization
                            404 ;	---------------------------------
                            405 ; Function checkCollision
                            406 ; ---------------------------------
   8A81                     407 _checkCollision::
   8A81 DD E5         [15]  408 	push	ix
   8A83 DD 21 00 00   [14]  409 	ld	ix,#0
   8A87 DD 39         [15]  410 	add	ix,sp
   8A89 F5            [11]  411 	push	af
                            412 ;src/main.c:166: u8 *headTile=0, *feetTile=0, *waistTile=0;
   8A8A 21 00 00      [10]  413 	ld	hl,#0x0000
   8A8D E3            [19]  414 	ex	(sp), hl
   8A8E 11 00 00      [10]  415 	ld	de,#0x0000
   8A91 01 00 00      [10]  416 	ld	bc,#0x0000
                            417 ;src/main.c:168: switch (direction) {
   8A94 DD CB 05 7E   [20]  418 	bit	7, 5 (ix)
   8A98 C2 B5 8B      [10]  419 	jp	NZ,00105$
   8A9B 3E 03         [ 7]  420 	ld	a,#0x03
   8A9D DD BE 04      [19]  421 	cp	a, 4 (ix)
   8AA0 3E 00         [ 7]  422 	ld	a,#0x00
   8AA2 DD 9E 05      [19]  423 	sbc	a, 5 (ix)
   8AA5 E2 AA 8A      [10]  424 	jp	PO, 00128$
   8AA8 EE 80         [ 7]  425 	xor	a, #0x80
   8AAA                     426 00128$:
   8AAA FA B5 8B      [10]  427 	jp	M,00105$
   8AAD DD 5E 04      [19]  428 	ld	e,4 (ix)
   8AB0 16 00         [ 7]  429 	ld	d,#0x00
   8AB2 21 B9 8A      [10]  430 	ld	hl,#00129$
   8AB5 19            [11]  431 	add	hl,de
   8AB6 19            [11]  432 	add	hl,de
   8AB7 19            [11]  433 	add	hl,de
   8AB8 E9            [ 4]  434 	jp	(hl)
   8AB9                     435 00129$:
   8AB9 C3 C5 8A      [10]  436 	jp	00101$
   8ABC C3 10 8B      [10]  437 	jp	00102$
   8ABF C3 51 8B      [10]  438 	jp	00103$
   8AC2 C3 84 8B      [10]  439 	jp	00104$
                            440 ;src/main.c:169: case 0:
   8AC5                     441 00101$:
                            442 ;src/main.c:170: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   8AC5 21 21 89      [10]  443 	ld	hl, #(_prota + 0x0001) + 0
   8AC8 5E            [ 7]  444 	ld	e,(hl)
   8AC9 21 20 89      [10]  445 	ld	hl, #_prota + 0
   8ACC 4E            [ 7]  446 	ld	c,(hl)
   8ACD 0C            [ 4]  447 	inc	c
   8ACE 0C            [ 4]  448 	inc	c
   8ACF 0C            [ 4]  449 	inc	c
   8AD0 0C            [ 4]  450 	inc	c
   8AD1 7B            [ 4]  451 	ld	a,e
   8AD2 F5            [11]  452 	push	af
   8AD3 33            [ 6]  453 	inc	sp
   8AD4 79            [ 4]  454 	ld	a,c
   8AD5 F5            [11]  455 	push	af
   8AD6 33            [ 6]  456 	inc	sp
   8AD7 CD 40 8A      [17]  457 	call	_getTilePtr
   8ADA F1            [10]  458 	pop	af
   8ADB 33            [ 6]  459 	inc	sp
   8ADC 33            [ 6]  460 	inc	sp
   8ADD E5            [11]  461 	push	hl
                            462 ;src/main.c:171: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   8ADE 3A 21 89      [13]  463 	ld	a, (#(_prota + 0x0001) + 0)
   8AE1 C6 14         [ 7]  464 	add	a, #0x14
   8AE3 4F            [ 4]  465 	ld	c,a
   8AE4 21 20 89      [10]  466 	ld	hl, #_prota + 0
   8AE7 46            [ 7]  467 	ld	b,(hl)
   8AE8 04            [ 4]  468 	inc	b
   8AE9 04            [ 4]  469 	inc	b
   8AEA 04            [ 4]  470 	inc	b
   8AEB 04            [ 4]  471 	inc	b
   8AEC 79            [ 4]  472 	ld	a,c
   8AED F5            [11]  473 	push	af
   8AEE 33            [ 6]  474 	inc	sp
   8AEF C5            [11]  475 	push	bc
   8AF0 33            [ 6]  476 	inc	sp
   8AF1 CD 40 8A      [17]  477 	call	_getTilePtr
   8AF4 F1            [10]  478 	pop	af
   8AF5 EB            [ 4]  479 	ex	de,hl
                            480 ;src/main.c:172: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   8AF6 3A 21 89      [13]  481 	ld	a, (#(_prota + 0x0001) + 0)
   8AF9 C6 0B         [ 7]  482 	add	a, #0x0B
   8AFB 47            [ 4]  483 	ld	b,a
   8AFC 3A 20 89      [13]  484 	ld	a, (#_prota + 0)
   8AFF C6 04         [ 7]  485 	add	a, #0x04
   8B01 D5            [11]  486 	push	de
   8B02 C5            [11]  487 	push	bc
   8B03 33            [ 6]  488 	inc	sp
   8B04 F5            [11]  489 	push	af
   8B05 33            [ 6]  490 	inc	sp
   8B06 CD 40 8A      [17]  491 	call	_getTilePtr
   8B09 F1            [10]  492 	pop	af
   8B0A 4D            [ 4]  493 	ld	c,l
   8B0B 44            [ 4]  494 	ld	b,h
   8B0C D1            [10]  495 	pop	de
                            496 ;src/main.c:173: break;
   8B0D C3 B5 8B      [10]  497 	jp	00105$
                            498 ;src/main.c:174: case 1:
   8B10                     499 00102$:
                            500 ;src/main.c:175: headTile  = getTilePtr(prota.x - 1, prota.y);
   8B10 21 21 89      [10]  501 	ld	hl, #(_prota + 0x0001) + 0
   8B13 56            [ 7]  502 	ld	d,(hl)
   8B14 21 20 89      [10]  503 	ld	hl, #_prota + 0
   8B17 46            [ 7]  504 	ld	b,(hl)
   8B18 05            [ 4]  505 	dec	b
   8B19 D5            [11]  506 	push	de
   8B1A 33            [ 6]  507 	inc	sp
   8B1B C5            [11]  508 	push	bc
   8B1C 33            [ 6]  509 	inc	sp
   8B1D CD 40 8A      [17]  510 	call	_getTilePtr
   8B20 F1            [10]  511 	pop	af
   8B21 33            [ 6]  512 	inc	sp
   8B22 33            [ 6]  513 	inc	sp
   8B23 E5            [11]  514 	push	hl
                            515 ;src/main.c:176: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
   8B24 3A 21 89      [13]  516 	ld	a, (#(_prota + 0x0001) + 0)
   8B27 C6 14         [ 7]  517 	add	a, #0x14
   8B29 57            [ 4]  518 	ld	d,a
   8B2A 21 20 89      [10]  519 	ld	hl, #_prota + 0
   8B2D 46            [ 7]  520 	ld	b,(hl)
   8B2E 05            [ 4]  521 	dec	b
   8B2F D5            [11]  522 	push	de
   8B30 33            [ 6]  523 	inc	sp
   8B31 C5            [11]  524 	push	bc
   8B32 33            [ 6]  525 	inc	sp
   8B33 CD 40 8A      [17]  526 	call	_getTilePtr
   8B36 F1            [10]  527 	pop	af
   8B37 EB            [ 4]  528 	ex	de,hl
                            529 ;src/main.c:177: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
   8B38 3A 21 89      [13]  530 	ld	a, (#(_prota + 0x0001) + 0)
   8B3B C6 0B         [ 7]  531 	add	a, #0x0B
   8B3D 47            [ 4]  532 	ld	b,a
   8B3E 3A 20 89      [13]  533 	ld	a, (#_prota + 0)
   8B41 C6 FF         [ 7]  534 	add	a,#0xFF
   8B43 D5            [11]  535 	push	de
   8B44 C5            [11]  536 	push	bc
   8B45 33            [ 6]  537 	inc	sp
   8B46 F5            [11]  538 	push	af
   8B47 33            [ 6]  539 	inc	sp
   8B48 CD 40 8A      [17]  540 	call	_getTilePtr
   8B4B F1            [10]  541 	pop	af
   8B4C 4D            [ 4]  542 	ld	c,l
   8B4D 44            [ 4]  543 	ld	b,h
   8B4E D1            [10]  544 	pop	de
                            545 ;src/main.c:178: break;
   8B4F 18 64         [12]  546 	jr	00105$
                            547 ;src/main.c:179: case 2:
   8B51                     548 00103$:
                            549 ;src/main.c:180: headTile   = getTilePtr(prota.x, prota.y - 2);
   8B51 3A 21 89      [13]  550 	ld	a, (#(_prota + 0x0001) + 0)
   8B54 C6 FE         [ 7]  551 	add	a,#0xFE
   8B56 21 20 89      [10]  552 	ld	hl, #_prota + 0
   8B59 56            [ 7]  553 	ld	d,(hl)
   8B5A C5            [11]  554 	push	bc
   8B5B F5            [11]  555 	push	af
   8B5C 33            [ 6]  556 	inc	sp
   8B5D D5            [11]  557 	push	de
   8B5E 33            [ 6]  558 	inc	sp
   8B5F CD 40 8A      [17]  559 	call	_getTilePtr
   8B62 F1            [10]  560 	pop	af
   8B63 C1            [10]  561 	pop	bc
   8B64 33            [ 6]  562 	inc	sp
   8B65 33            [ 6]  563 	inc	sp
   8B66 E5            [11]  564 	push	hl
                            565 ;src/main.c:181: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
   8B67 21 21 89      [10]  566 	ld	hl, #(_prota + 0x0001) + 0
   8B6A 56            [ 7]  567 	ld	d,(hl)
   8B6B 15            [ 4]  568 	dec	d
   8B6C 15            [ 4]  569 	dec	d
   8B6D 3A 20 89      [13]  570 	ld	a, (#_prota + 0)
   8B70 C6 03         [ 7]  571 	add	a, #0x03
   8B72 C5            [11]  572 	push	bc
   8B73 D5            [11]  573 	push	de
   8B74 33            [ 6]  574 	inc	sp
   8B75 F5            [11]  575 	push	af
   8B76 33            [ 6]  576 	inc	sp
   8B77 CD 40 8A      [17]  577 	call	_getTilePtr
   8B7A F1            [10]  578 	pop	af
   8B7B EB            [ 4]  579 	ex	de,hl
   8B7C C1            [10]  580 	pop	bc
                            581 ;src/main.c:182: *waistTile = 0;
   8B7D 21 00 00      [10]  582 	ld	hl,#0x0000
   8B80 36 00         [10]  583 	ld	(hl),#0x00
                            584 ;src/main.c:183: break;
   8B82 18 31         [12]  585 	jr	00105$
                            586 ;src/main.c:184: case 3:
   8B84                     587 00104$:
                            588 ;src/main.c:185: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
   8B84 3A 21 89      [13]  589 	ld	a, (#(_prota + 0x0001) + 0)
   8B87 C6 16         [ 7]  590 	add	a, #0x16
   8B89 21 20 89      [10]  591 	ld	hl, #_prota + 0
   8B8C 56            [ 7]  592 	ld	d,(hl)
   8B8D C5            [11]  593 	push	bc
   8B8E F5            [11]  594 	push	af
   8B8F 33            [ 6]  595 	inc	sp
   8B90 D5            [11]  596 	push	de
   8B91 33            [ 6]  597 	inc	sp
   8B92 CD 40 8A      [17]  598 	call	_getTilePtr
   8B95 F1            [10]  599 	pop	af
   8B96 C1            [10]  600 	pop	bc
   8B97 33            [ 6]  601 	inc	sp
   8B98 33            [ 6]  602 	inc	sp
   8B99 E5            [11]  603 	push	hl
                            604 ;src/main.c:186: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   8B9A 3A 21 89      [13]  605 	ld	a, (#(_prota + 0x0001) + 0)
   8B9D C6 16         [ 7]  606 	add	a, #0x16
   8B9F 57            [ 4]  607 	ld	d,a
   8BA0 3A 20 89      [13]  608 	ld	a, (#_prota + 0)
   8BA3 C6 03         [ 7]  609 	add	a, #0x03
   8BA5 C5            [11]  610 	push	bc
   8BA6 D5            [11]  611 	push	de
   8BA7 33            [ 6]  612 	inc	sp
   8BA8 F5            [11]  613 	push	af
   8BA9 33            [ 6]  614 	inc	sp
   8BAA CD 40 8A      [17]  615 	call	_getTilePtr
   8BAD F1            [10]  616 	pop	af
   8BAE EB            [ 4]  617 	ex	de,hl
   8BAF C1            [10]  618 	pop	bc
                            619 ;src/main.c:187: *waistTile = 0;
   8BB0 21 00 00      [10]  620 	ld	hl,#0x0000
   8BB3 36 00         [10]  621 	ld	(hl),#0x00
                            622 ;src/main.c:189: }
   8BB5                     623 00105$:
                            624 ;src/main.c:191: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   8BB5 E1            [10]  625 	pop	hl
   8BB6 E5            [11]  626 	push	hl
   8BB7 6E            [ 7]  627 	ld	l,(hl)
   8BB8 3E 02         [ 7]  628 	ld	a,#0x02
   8BBA 95            [ 4]  629 	sub	a, l
   8BBB 38 0E         [12]  630 	jr	C,00106$
   8BBD 1A            [ 7]  631 	ld	a,(de)
   8BBE 5F            [ 4]  632 	ld	e,a
   8BBF 3E 02         [ 7]  633 	ld	a,#0x02
   8BC1 93            [ 4]  634 	sub	a, e
   8BC2 38 07         [12]  635 	jr	C,00106$
   8BC4 0A            [ 7]  636 	ld	a,(bc)
   8BC5 4F            [ 4]  637 	ld	c,a
   8BC6 3E 02         [ 7]  638 	ld	a,#0x02
   8BC8 91            [ 4]  639 	sub	a, c
   8BC9 30 04         [12]  640 	jr	NC,00107$
   8BCB                     641 00106$:
                            642 ;src/main.c:192: return 1;
   8BCB 2E 01         [ 7]  643 	ld	l,#0x01
   8BCD 18 02         [12]  644 	jr	00110$
   8BCF                     645 00107$:
                            646 ;src/main.c:194: return 0;
   8BCF 2E 00         [ 7]  647 	ld	l,#0x00
   8BD1                     648 00110$:
   8BD1 DD F9         [10]  649 	ld	sp, ix
   8BD3 DD E1         [14]  650 	pop	ix
   8BD5 C9            [10]  651 	ret
                            652 ;src/main.c:198: void dibujarEnemigo(TEnemy *enemy) {
                            653 ;	---------------------------------
                            654 ; Function dibujarEnemigo
                            655 ; ---------------------------------
   8BD6                     656 _dibujarEnemigo::
   8BD6 DD E5         [15]  657 	push	ix
   8BD8 DD 21 00 00   [14]  658 	ld	ix,#0
   8BDC DD 39         [15]  659 	add	ix,sp
                            660 ;src/main.c:199: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   8BDE DD 4E 04      [19]  661 	ld	c,4 (ix)
   8BE1 DD 46 05      [19]  662 	ld	b,5 (ix)
   8BE4 69            [ 4]  663 	ld	l, c
   8BE5 60            [ 4]  664 	ld	h, b
   8BE6 23            [ 6]  665 	inc	hl
   8BE7 56            [ 7]  666 	ld	d,(hl)
   8BE8 0A            [ 7]  667 	ld	a,(bc)
   8BE9 C5            [11]  668 	push	bc
   8BEA D5            [11]  669 	push	de
   8BEB 33            [ 6]  670 	inc	sp
   8BEC F5            [11]  671 	push	af
   8BED 33            [ 6]  672 	inc	sp
   8BEE 21 00 C0      [10]  673 	ld	hl,#0xC000
   8BF1 E5            [11]  674 	push	hl
   8BF2 CD 70 88      [17]  675 	call	_cpct_getScreenPtr
   8BF5 EB            [ 4]  676 	ex	de,hl
                            677 ;src/main.c:200: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   8BF6 E1            [10]  678 	pop	hl
   8BF7 01 04 00      [10]  679 	ld	bc, #0x0004
   8BFA 09            [11]  680 	add	hl, bc
   8BFB 4E            [ 7]  681 	ld	c,(hl)
   8BFC 23            [ 6]  682 	inc	hl
   8BFD 46            [ 7]  683 	ld	b,(hl)
   8BFE 21 00 3E      [10]  684 	ld	hl,#_g_tablatrans
   8C01 E5            [11]  685 	push	hl
   8C02 21 04 16      [10]  686 	ld	hl,#0x1604
   8C05 E5            [11]  687 	push	hl
   8C06 D5            [11]  688 	push	de
   8C07 C5            [11]  689 	push	bc
   8C08 CD 90 88      [17]  690 	call	_cpct_drawSpriteMaskedAlignedTable
   8C0B DD E1         [14]  691 	pop	ix
   8C0D C9            [10]  692 	ret
                            693 ;src/main.c:203: void dibujarExplosion() {
                            694 ;	---------------------------------
                            695 ; Function dibujarExplosion
                            696 ; ---------------------------------
   8C0E                     697 _dibujarExplosion::
                            698 ;src/main.c:204: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   8C0E 21 F5 88      [10]  699 	ld	hl, #_enemy + 1
   8C11 56            [ 7]  700 	ld	d,(hl)
   8C12 21 F4 88      [10]  701 	ld	hl, #_enemy + 0
   8C15 46            [ 7]  702 	ld	b,(hl)
   8C16 D5            [11]  703 	push	de
   8C17 33            [ 6]  704 	inc	sp
   8C18 C5            [11]  705 	push	bc
   8C19 33            [ 6]  706 	inc	sp
   8C1A 21 00 C0      [10]  707 	ld	hl,#0xC000
   8C1D E5            [11]  708 	push	hl
   8C1E CD 70 88      [17]  709 	call	_cpct_getScreenPtr
   8C21 4D            [ 4]  710 	ld	c,l
   8C22 44            [ 4]  711 	ld	b,h
                            712 ;src/main.c:205: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   8C23 11 00 3E      [10]  713 	ld	de,#_g_tablatrans+0
   8C26 D5            [11]  714 	push	de
   8C27 21 04 16      [10]  715 	ld	hl,#0x1604
   8C2A E5            [11]  716 	push	hl
   8C2B C5            [11]  717 	push	bc
   8C2C 21 A8 55      [10]  718 	ld	hl,#_g_explosion
   8C2F E5            [11]  719 	push	hl
   8C30 CD 90 88      [17]  720 	call	_cpct_drawSpriteMaskedAlignedTable
   8C33 C9            [10]  721 	ret
                            722 ;src/main.c:208: void borrarExplosion() {
                            723 ;	---------------------------------
                            724 ; Function borrarExplosion
                            725 ; ---------------------------------
   8C34                     726 _borrarExplosion::
   8C34 DD E5         [15]  727 	push	ix
   8C36 DD 21 00 00   [14]  728 	ld	ix,#0
   8C3A DD 39         [15]  729 	add	ix,sp
   8C3C F5            [11]  730 	push	af
   8C3D 3B            [ 6]  731 	dec	sp
                            732 ;src/main.c:209: u8 w = 4 + (enemy->px & 1);
   8C3E 21 F6 88      [10]  733 	ld	hl, #_enemy + 2
   8C41 4E            [ 7]  734 	ld	c,(hl)
   8C42 79            [ 4]  735 	ld	a,c
   8C43 E6 01         [ 7]  736 	and	a, #0x01
   8C45 47            [ 4]  737 	ld	b,a
   8C46 04            [ 4]  738 	inc	b
   8C47 04            [ 4]  739 	inc	b
   8C48 04            [ 4]  740 	inc	b
   8C49 04            [ 4]  741 	inc	b
                            742 ;src/main.c:212: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   8C4A 21 F7 88      [10]  743 	ld	hl, #_enemy + 3
   8C4D 5E            [ 7]  744 	ld	e,(hl)
   8C4E CB 4B         [ 8]  745 	bit	1, e
   8C50 28 04         [12]  746 	jr	Z,00103$
   8C52 3E 01         [ 7]  747 	ld	a,#0x01
   8C54 18 02         [12]  748 	jr	00104$
   8C56                     749 00103$:
   8C56 3E 00         [ 7]  750 	ld	a,#0x00
   8C58                     751 00104$:
   8C58 C6 07         [ 7]  752 	add	a, #0x07
   8C5A DD 77 FD      [19]  753 	ld	-3 (ix),a
                            754 ;src/main.c:214: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   8C5D FD 2A 32 89   [20]  755 	ld	iy,(_mapa)
   8C61 16 00         [ 7]  756 	ld	d,#0x00
   8C63 7B            [ 4]  757 	ld	a,e
   8C64 C6 E8         [ 7]  758 	add	a,#0xE8
   8C66 DD 77 FE      [19]  759 	ld	-2 (ix),a
   8C69 7A            [ 4]  760 	ld	a,d
   8C6A CE FF         [ 7]  761 	adc	a,#0xFF
   8C6C DD 77 FF      [19]  762 	ld	-1 (ix),a
   8C6F DD 6E FE      [19]  763 	ld	l,-2 (ix)
   8C72 DD 66 FF      [19]  764 	ld	h,-1 (ix)
   8C75 DD CB FF 7E   [20]  765 	bit	7, -1 (ix)
   8C79 28 04         [12]  766 	jr	Z,00105$
   8C7B 21 EB FF      [10]  767 	ld	hl,#0xFFEB
   8C7E 19            [11]  768 	add	hl,de
   8C7F                     769 00105$:
   8C7F CB 2C         [ 8]  770 	sra	h
   8C81 CB 1D         [ 8]  771 	rr	l
   8C83 CB 2C         [ 8]  772 	sra	h
   8C85 CB 1D         [ 8]  773 	rr	l
   8C87 55            [ 4]  774 	ld	d,l
   8C88 CB 39         [ 8]  775 	srl	c
   8C8A FD E5         [15]  776 	push	iy
   8C8C 21 F0 C0      [10]  777 	ld	hl,#0xC0F0
   8C8F E5            [11]  778 	push	hl
   8C90 3E 28         [ 7]  779 	ld	a,#0x28
   8C92 F5            [11]  780 	push	af
   8C93 33            [ 6]  781 	inc	sp
   8C94 DD 7E FD      [19]  782 	ld	a,-3 (ix)
   8C97 F5            [11]  783 	push	af
   8C98 33            [ 6]  784 	inc	sp
   8C99 C5            [11]  785 	push	bc
   8C9A 33            [ 6]  786 	inc	sp
   8C9B D5            [11]  787 	push	de
   8C9C 33            [ 6]  788 	inc	sp
   8C9D 79            [ 4]  789 	ld	a,c
   8C9E F5            [11]  790 	push	af
   8C9F 33            [ 6]  791 	inc	sp
   8CA0 CD 44 7D      [17]  792 	call	_cpct_etm_drawTileBox2x4
   8CA3 DD F9         [10]  793 	ld	sp, ix
   8CA5 DD E1         [14]  794 	pop	ix
   8CA7 C9            [10]  795 	ret
                            796 ;src/main.c:218: void borrarEnemigo(TEnemy *enemy) {
                            797 ;	---------------------------------
                            798 ; Function borrarEnemigo
                            799 ; ---------------------------------
   8CA8                     800 _borrarEnemigo::
   8CA8 DD E5         [15]  801 	push	ix
   8CAA DD 21 00 00   [14]  802 	ld	ix,#0
   8CAE DD 39         [15]  803 	add	ix,sp
   8CB0 21 FA FF      [10]  804 	ld	hl,#-6
   8CB3 39            [11]  805 	add	hl,sp
   8CB4 F9            [ 6]  806 	ld	sp,hl
                            807 ;src/main.c:220: u8 w = 4 + (enemy->px & 1);
   8CB5 DD 4E 04      [19]  808 	ld	c,4 (ix)
   8CB8 DD 46 05      [19]  809 	ld	b,5 (ix)
   8CBB 69            [ 4]  810 	ld	l, c
   8CBC 60            [ 4]  811 	ld	h, b
   8CBD 23            [ 6]  812 	inc	hl
   8CBE 23            [ 6]  813 	inc	hl
   8CBF 5E            [ 7]  814 	ld	e,(hl)
   8CC0 7B            [ 4]  815 	ld	a,e
   8CC1 E6 01         [ 7]  816 	and	a, #0x01
   8CC3 C6 04         [ 7]  817 	add	a, #0x04
   8CC5 DD 77 FB      [19]  818 	ld	-5 (ix),a
                            819 ;src/main.c:223: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   8CC8 69            [ 4]  820 	ld	l, c
   8CC9 60            [ 4]  821 	ld	h, b
   8CCA 23            [ 6]  822 	inc	hl
   8CCB 23            [ 6]  823 	inc	hl
   8CCC 23            [ 6]  824 	inc	hl
   8CCD 56            [ 7]  825 	ld	d,(hl)
   8CCE CB 4A         [ 8]  826 	bit	1, d
   8CD0 28 04         [12]  827 	jr	Z,00103$
   8CD2 3E 01         [ 7]  828 	ld	a,#0x01
   8CD4 18 02         [12]  829 	jr	00104$
   8CD6                     830 00103$:
   8CD6 3E 00         [ 7]  831 	ld	a,#0x00
   8CD8                     832 00104$:
   8CD8 C6 07         [ 7]  833 	add	a, #0x07
   8CDA DD 77 FA      [19]  834 	ld	-6 (ix),a
                            835 ;src/main.c:225: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   8CDD FD 2A 32 89   [20]  836 	ld	iy,(_mapa)
   8CE1 DD 72 FE      [19]  837 	ld	-2 (ix),d
   8CE4 DD 36 FF 00   [19]  838 	ld	-1 (ix),#0x00
   8CE8 DD 7E FE      [19]  839 	ld	a,-2 (ix)
   8CEB C6 E8         [ 7]  840 	add	a,#0xE8
   8CED DD 77 FC      [19]  841 	ld	-4 (ix),a
   8CF0 DD 7E FF      [19]  842 	ld	a,-1 (ix)
   8CF3 CE FF         [ 7]  843 	adc	a,#0xFF
   8CF5 DD 77 FD      [19]  844 	ld	-3 (ix),a
   8CF8 DD 56 FC      [19]  845 	ld	d,-4 (ix)
   8CFB DD 6E FD      [19]  846 	ld	l,-3 (ix)
   8CFE DD CB FD 7E   [20]  847 	bit	7, -3 (ix)
   8D02 28 0C         [12]  848 	jr	Z,00105$
   8D04 DD 7E FE      [19]  849 	ld	a,-2 (ix)
   8D07 C6 EB         [ 7]  850 	add	a, #0xEB
   8D09 57            [ 4]  851 	ld	d,a
   8D0A DD 7E FF      [19]  852 	ld	a,-1 (ix)
   8D0D CE FF         [ 7]  853 	adc	a, #0xFF
   8D0F 6F            [ 4]  854 	ld	l,a
   8D10                     855 00105$:
   8D10 CB 2D         [ 8]  856 	sra	l
   8D12 CB 1A         [ 8]  857 	rr	d
   8D14 CB 2D         [ 8]  858 	sra	l
   8D16 CB 1A         [ 8]  859 	rr	d
   8D18 CB 3B         [ 8]  860 	srl	e
   8D1A C5            [11]  861 	push	bc
   8D1B FD E5         [15]  862 	push	iy
   8D1D 21 F0 C0      [10]  863 	ld	hl,#0xC0F0
   8D20 E5            [11]  864 	push	hl
   8D21 3E 28         [ 7]  865 	ld	a,#0x28
   8D23 F5            [11]  866 	push	af
   8D24 33            [ 6]  867 	inc	sp
   8D25 DD 66 FA      [19]  868 	ld	h,-6 (ix)
   8D28 DD 6E FB      [19]  869 	ld	l,-5 (ix)
   8D2B E5            [11]  870 	push	hl
   8D2C D5            [11]  871 	push	de
   8D2D CD 44 7D      [17]  872 	call	_cpct_etm_drawTileBox2x4
   8D30 C1            [10]  873 	pop	bc
                            874 ;src/main.c:227: enemy->mover = NO;
   8D31 21 06 00      [10]  875 	ld	hl,#0x0006
   8D34 09            [11]  876 	add	hl,bc
   8D35 36 00         [10]  877 	ld	(hl),#0x00
   8D37 DD F9         [10]  878 	ld	sp, ix
   8D39 DD E1         [14]  879 	pop	ix
   8D3B C9            [10]  880 	ret
                            881 ;src/main.c:230: void redibujarEnemigo(TEnemy *enemy) {
                            882 ;	---------------------------------
                            883 ; Function redibujarEnemigo
                            884 ; ---------------------------------
   8D3C                     885 _redibujarEnemigo::
   8D3C DD E5         [15]  886 	push	ix
   8D3E DD 21 00 00   [14]  887 	ld	ix,#0
   8D42 DD 39         [15]  888 	add	ix,sp
                            889 ;src/main.c:231: borrarEnemigo(enemy);
   8D44 DD 6E 04      [19]  890 	ld	l,4 (ix)
   8D47 DD 66 05      [19]  891 	ld	h,5 (ix)
   8D4A E5            [11]  892 	push	hl
   8D4B CD A8 8C      [17]  893 	call	_borrarEnemigo
   8D4E F1            [10]  894 	pop	af
                            895 ;src/main.c:232: enemy->px = enemy->x;
   8D4F DD 4E 04      [19]  896 	ld	c,4 (ix)
   8D52 DD 46 05      [19]  897 	ld	b,5 (ix)
   8D55 59            [ 4]  898 	ld	e, c
   8D56 50            [ 4]  899 	ld	d, b
   8D57 13            [ 6]  900 	inc	de
   8D58 13            [ 6]  901 	inc	de
   8D59 0A            [ 7]  902 	ld	a,(bc)
   8D5A 12            [ 7]  903 	ld	(de),a
                            904 ;src/main.c:233: enemy->py = enemy->y;
   8D5B 59            [ 4]  905 	ld	e, c
   8D5C 50            [ 4]  906 	ld	d, b
   8D5D 13            [ 6]  907 	inc	de
   8D5E 13            [ 6]  908 	inc	de
   8D5F 13            [ 6]  909 	inc	de
   8D60 69            [ 4]  910 	ld	l, c
   8D61 60            [ 4]  911 	ld	h, b
   8D62 23            [ 6]  912 	inc	hl
   8D63 7E            [ 7]  913 	ld	a,(hl)
   8D64 12            [ 7]  914 	ld	(de),a
                            915 ;src/main.c:234: dibujarEnemigo(enemy);
   8D65 C5            [11]  916 	push	bc
   8D66 CD D6 8B      [17]  917 	call	_dibujarEnemigo
   8D69 F1            [10]  918 	pop	af
   8D6A DD E1         [14]  919 	pop	ix
   8D6C C9            [10]  920 	ret
                            921 ;src/main.c:237: u8 checkEnemyCollision(int direction, TEnemy *enemy){
                            922 ;	---------------------------------
                            923 ; Function checkEnemyCollision
                            924 ; ---------------------------------
   8D6D                     925 _checkEnemyCollision::
   8D6D DD E5         [15]  926 	push	ix
   8D6F DD 21 00 00   [14]  927 	ld	ix,#0
   8D73 DD 39         [15]  928 	add	ix,sp
   8D75 21 F9 FF      [10]  929 	ld	hl,#-7
   8D78 39            [11]  930 	add	hl,sp
   8D79 F9            [ 6]  931 	ld	sp,hl
                            932 ;src/main.c:239: u8 colisiona = 1;
   8D7A DD 36 F9 01   [19]  933 	ld	-7 (ix),#0x01
                            934 ;src/main.c:241: switch (direction) {
   8D7E DD CB 05 7E   [20]  935 	bit	7, 5 (ix)
   8D82 C2 80 8F      [10]  936 	jp	NZ,00135$
   8D85 3E 03         [ 7]  937 	ld	a,#0x03
   8D87 DD BE 04      [19]  938 	cp	a, 4 (ix)
   8D8A 3E 00         [ 7]  939 	ld	a,#0x00
   8D8C DD 9E 05      [19]  940 	sbc	a, 5 (ix)
   8D8F E2 94 8D      [10]  941 	jp	PO, 00194$
   8D92 EE 80         [ 7]  942 	xor	a, #0x80
   8D94                     943 00194$:
   8D94 FA 80 8F      [10]  944 	jp	M,00135$
                            945 ;src/main.c:249: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   8D97 DD 4E 06      [19]  946 	ld	c,6 (ix)
   8D9A DD 46 07      [19]  947 	ld	b,7 (ix)
                            948 ;src/main.c:263: enemy->mira = M_abajo;
   8D9D 21 07 00      [10]  949 	ld	hl,#0x0007
   8DA0 09            [11]  950 	add	hl,bc
   8DA1 DD 75 FA      [19]  951 	ld	-6 (ix),l
   8DA4 DD 74 FB      [19]  952 	ld	-5 (ix),h
                            953 ;src/main.c:249: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   8DA7 21 01 00      [10]  954 	ld	hl,#0x0001
   8DAA 09            [11]  955 	add	hl,bc
   8DAB DD 75 FC      [19]  956 	ld	-4 (ix),l
   8DAE DD 74 FD      [19]  957 	ld	-3 (ix),h
                            958 ;src/main.c:241: switch (direction) {
   8DB1 DD 5E 04      [19]  959 	ld	e,4 (ix)
   8DB4 16 00         [ 7]  960 	ld	d,#0x00
   8DB6 21 BD 8D      [10]  961 	ld	hl,#00195$
   8DB9 19            [11]  962 	add	hl,de
   8DBA 19            [11]  963 	add	hl,de
   8DBB 19            [11]  964 	add	hl,de
   8DBC E9            [ 4]  965 	jp	(hl)
   8DBD                     966 00195$:
   8DBD C3 80 8F      [10]  967 	jp	00135$
   8DC0 C3 80 8F      [10]  968 	jp	00135$
   8DC3 C3 CF 8D      [10]  969 	jp	00103$
   8DC6 C3 A6 8E      [10]  970 	jp	00119$
                            971 ;src/main.c:242: case 0:
                            972 ;src/main.c:244: break;
   8DC9 C3 80 8F      [10]  973 	jp	00135$
                            974 ;src/main.c:245: case 1:
                            975 ;src/main.c:247: break;
   8DCC C3 80 8F      [10]  976 	jp	00135$
                            977 ;src/main.c:248: case 2:
   8DCF                     978 00103$:
                            979 ;src/main.c:249: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   8DCF DD 6E FC      [19]  980 	ld	l,-4 (ix)
   8DD2 DD 66 FD      [19]  981 	ld	h,-3 (ix)
   8DD5 5E            [ 7]  982 	ld	e,(hl)
   8DD6 53            [ 4]  983 	ld	d,e
   8DD7 15            [ 4]  984 	dec	d
   8DD8 15            [ 4]  985 	dec	d
   8DD9 0A            [ 7]  986 	ld	a,(bc)
   8DDA C5            [11]  987 	push	bc
   8DDB D5            [11]  988 	push	de
   8DDC 33            [ 6]  989 	inc	sp
   8DDD F5            [11]  990 	push	af
   8DDE 33            [ 6]  991 	inc	sp
   8DDF CD 40 8A      [17]  992 	call	_getTilePtr
   8DE2 F1            [10]  993 	pop	af
   8DE3 C1            [10]  994 	pop	bc
   8DE4 5E            [ 7]  995 	ld	e,(hl)
   8DE5 3E 02         [ 7]  996 	ld	a,#0x02
   8DE7 93            [ 4]  997 	sub	a, e
   8DE8 DA 9E 8E      [10]  998 	jp	C,00115$
                            999 ;src/main.c:250: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   8DEB DD 6E FC      [19] 1000 	ld	l,-4 (ix)
   8DEE DD 66 FD      [19] 1001 	ld	h,-3 (ix)
   8DF1 56            [ 7] 1002 	ld	d,(hl)
   8DF2 15            [ 4] 1003 	dec	d
   8DF3 15            [ 4] 1004 	dec	d
   8DF4 0A            [ 7] 1005 	ld	a,(bc)
   8DF5 C6 02         [ 7] 1006 	add	a, #0x02
   8DF7 C5            [11] 1007 	push	bc
   8DF8 D5            [11] 1008 	push	de
   8DF9 33            [ 6] 1009 	inc	sp
   8DFA F5            [11] 1010 	push	af
   8DFB 33            [ 6] 1011 	inc	sp
   8DFC CD 40 8A      [17] 1012 	call	_getTilePtr
   8DFF F1            [10] 1013 	pop	af
   8E00 C1            [10] 1014 	pop	bc
   8E01 5E            [ 7] 1015 	ld	e,(hl)
   8E02 3E 02         [ 7] 1016 	ld	a,#0x02
   8E04 93            [ 4] 1017 	sub	a, e
   8E05 DA 9E 8E      [10] 1018 	jp	C,00115$
                           1019 ;src/main.c:251: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   8E08 DD 6E FC      [19] 1020 	ld	l,-4 (ix)
   8E0B DD 66 FD      [19] 1021 	ld	h,-3 (ix)
   8E0E 56            [ 7] 1022 	ld	d,(hl)
   8E0F 15            [ 4] 1023 	dec	d
   8E10 15            [ 4] 1024 	dec	d
   8E11 0A            [ 7] 1025 	ld	a,(bc)
   8E12 C6 04         [ 7] 1026 	add	a, #0x04
   8E14 C5            [11] 1027 	push	bc
   8E15 D5            [11] 1028 	push	de
   8E16 33            [ 6] 1029 	inc	sp
   8E17 F5            [11] 1030 	push	af
   8E18 33            [ 6] 1031 	inc	sp
   8E19 CD 40 8A      [17] 1032 	call	_getTilePtr
   8E1C F1            [10] 1033 	pop	af
   8E1D C1            [10] 1034 	pop	bc
   8E1E 5E            [ 7] 1035 	ld	e,(hl)
   8E1F 3E 02         [ 7] 1036 	ld	a,#0x02
   8E21 93            [ 4] 1037 	sub	a, e
   8E22 38 7A         [12] 1038 	jr	C,00115$
                           1039 ;src/main.c:253: if((prota.x + G_HERO_W -4) < enemy->x || prota.x  > (enemy->x + G_ENEMY_W)){
   8E24 21 20 89      [10] 1040 	ld	hl, #_prota + 0
   8E27 5E            [ 7] 1041 	ld	e,(hl)
   8E28 16 00         [ 7] 1042 	ld	d,#0x00
   8E2A 21 03 00      [10] 1043 	ld	hl,#0x0003
   8E2D 19            [11] 1044 	add	hl,de
   8E2E DD 75 FE      [19] 1045 	ld	-2 (ix),l
   8E31 DD 74 FF      [19] 1046 	ld	-1 (ix),h
   8E34 0A            [ 7] 1047 	ld	a,(bc)
   8E35 6F            [ 4] 1048 	ld	l,a
   8E36 26 00         [ 7] 1049 	ld	h,#0x00
   8E38 DD 7E FE      [19] 1050 	ld	a,-2 (ix)
   8E3B 95            [ 4] 1051 	sub	a, l
   8E3C DD 7E FF      [19] 1052 	ld	a,-1 (ix)
   8E3F 9C            [ 4] 1053 	sbc	a, h
   8E40 E2 45 8E      [10] 1054 	jp	PO, 00196$
   8E43 EE 80         [ 7] 1055 	xor	a, #0x80
   8E45                    1056 00196$:
   8E45 FA 58 8E      [10] 1057 	jp	M,00110$
   8E48 23            [ 6] 1058 	inc	hl
   8E49 23            [ 6] 1059 	inc	hl
   8E4A 23            [ 6] 1060 	inc	hl
   8E4B 23            [ 6] 1061 	inc	hl
   8E4C 7D            [ 4] 1062 	ld	a,l
   8E4D 93            [ 4] 1063 	sub	a, e
   8E4E 7C            [ 4] 1064 	ld	a,h
   8E4F 9A            [ 4] 1065 	sbc	a, d
   8E50 E2 55 8E      [10] 1066 	jp	PO, 00197$
   8E53 EE 80         [ 7] 1067 	xor	a, #0x80
   8E55                    1068 00197$:
   8E55 F2 5E 8E      [10] 1069 	jp	P,00111$
   8E58                    1070 00110$:
                           1071 ;src/main.c:255: colisiona = 0;
   8E58 DD 36 F9 00   [19] 1072 	ld	-7 (ix),#0x00
   8E5C 18 48         [12] 1073 	jr	00119$
   8E5E                    1074 00111$:
                           1075 ;src/main.c:258: if(enemy->y>prota.y){
   8E5E DD 6E FC      [19] 1076 	ld	l,-4 (ix)
   8E61 DD 66 FD      [19] 1077 	ld	h,-3 (ix)
   8E64 5E            [ 7] 1078 	ld	e,(hl)
   8E65 21 21 89      [10] 1079 	ld	hl, #(_prota + 0x0001) + 0
   8E68 6E            [ 7] 1080 	ld	l,(hl)
   8E69 7D            [ 4] 1081 	ld	a,l
   8E6A 93            [ 4] 1082 	sub	a, e
   8E6B 30 2B         [12] 1083 	jr	NC,00108$
                           1084 ;src/main.c:259: if(enemy->y - (prota.y + G_HERO_H -2) >= 2){
   8E6D 16 00         [ 7] 1085 	ld	d,#0x00
   8E6F 26 00         [ 7] 1086 	ld	h,#0x00
   8E71 D5            [11] 1087 	push	de
   8E72 11 14 00      [10] 1088 	ld	de,#0x0014
   8E75 19            [11] 1089 	add	hl, de
   8E76 D1            [10] 1090 	pop	de
   8E77 7B            [ 4] 1091 	ld	a,e
   8E78 95            [ 4] 1092 	sub	a, l
   8E79 5F            [ 4] 1093 	ld	e,a
   8E7A 7A            [ 4] 1094 	ld	a,d
   8E7B 9C            [ 4] 1095 	sbc	a, h
   8E7C 57            [ 4] 1096 	ld	d,a
   8E7D 7B            [ 4] 1097 	ld	a,e
   8E7E D6 02         [ 7] 1098 	sub	a, #0x02
   8E80 7A            [ 4] 1099 	ld	a,d
   8E81 17            [ 4] 1100 	rla
   8E82 3F            [ 4] 1101 	ccf
   8E83 1F            [ 4] 1102 	rra
   8E84 DE 80         [ 7] 1103 	sbc	a, #0x80
   8E86 38 06         [12] 1104 	jr	C,00105$
                           1105 ;src/main.c:260: colisiona = 0;
   8E88 DD 36 F9 00   [19] 1106 	ld	-7 (ix),#0x00
   8E8C 18 18         [12] 1107 	jr	00119$
   8E8E                    1108 00105$:
                           1109 ;src/main.c:263: enemy->mira = M_abajo;
   8E8E DD 6E FA      [19] 1110 	ld	l,-6 (ix)
   8E91 DD 66 FB      [19] 1111 	ld	h,-5 (ix)
   8E94 36 03         [10] 1112 	ld	(hl),#0x03
   8E96 18 0E         [12] 1113 	jr	00119$
   8E98                    1114 00108$:
                           1115 ;src/main.c:266: colisiona = 0;
   8E98 DD 36 F9 00   [19] 1116 	ld	-7 (ix),#0x00
   8E9C 18 08         [12] 1117 	jr	00119$
   8E9E                    1118 00115$:
                           1119 ;src/main.c:272: enemy->mira = M_abajo;
   8E9E DD 6E FA      [19] 1120 	ld	l,-6 (ix)
   8EA1 DD 66 FB      [19] 1121 	ld	h,-5 (ix)
   8EA4 36 03         [10] 1122 	ld	(hl),#0x03
                           1123 ;src/main.c:275: case 3:
   8EA6                    1124 00119$:
                           1125 ;src/main.c:278: if( *getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   8EA6 DD 6E FC      [19] 1126 	ld	l,-4 (ix)
   8EA9 DD 66 FD      [19] 1127 	ld	h,-3 (ix)
   8EAC 7E            [ 7] 1128 	ld	a,(hl)
   8EAD C6 18         [ 7] 1129 	add	a, #0x18
   8EAF 57            [ 4] 1130 	ld	d,a
   8EB0 0A            [ 7] 1131 	ld	a,(bc)
   8EB1 C5            [11] 1132 	push	bc
   8EB2 D5            [11] 1133 	push	de
   8EB3 33            [ 6] 1134 	inc	sp
   8EB4 F5            [11] 1135 	push	af
   8EB5 33            [ 6] 1136 	inc	sp
   8EB6 CD 40 8A      [17] 1137 	call	_getTilePtr
   8EB9 F1            [10] 1138 	pop	af
   8EBA C1            [10] 1139 	pop	bc
   8EBB 5E            [ 7] 1140 	ld	e,(hl)
   8EBC 3E 02         [ 7] 1141 	ld	a,#0x02
   8EBE 93            [ 4] 1142 	sub	a, e
   8EBF DA 78 8F      [10] 1143 	jp	C,00131$
                           1144 ;src/main.c:279: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   8EC2 DD 6E FC      [19] 1145 	ld	l,-4 (ix)
   8EC5 DD 66 FD      [19] 1146 	ld	h,-3 (ix)
   8EC8 7E            [ 7] 1147 	ld	a,(hl)
   8EC9 C6 18         [ 7] 1148 	add	a, #0x18
   8ECB 57            [ 4] 1149 	ld	d,a
   8ECC 0A            [ 7] 1150 	ld	a,(bc)
   8ECD C6 02         [ 7] 1151 	add	a, #0x02
   8ECF C5            [11] 1152 	push	bc
   8ED0 D5            [11] 1153 	push	de
   8ED1 33            [ 6] 1154 	inc	sp
   8ED2 F5            [11] 1155 	push	af
   8ED3 33            [ 6] 1156 	inc	sp
   8ED4 CD 40 8A      [17] 1157 	call	_getTilePtr
   8ED7 F1            [10] 1158 	pop	af
   8ED8 C1            [10] 1159 	pop	bc
   8ED9 5E            [ 7] 1160 	ld	e,(hl)
   8EDA 3E 02         [ 7] 1161 	ld	a,#0x02
   8EDC 93            [ 4] 1162 	sub	a, e
   8EDD DA 78 8F      [10] 1163 	jp	C,00131$
                           1164 ;src/main.c:280: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   8EE0 DD 6E FC      [19] 1165 	ld	l,-4 (ix)
   8EE3 DD 66 FD      [19] 1166 	ld	h,-3 (ix)
   8EE6 7E            [ 7] 1167 	ld	a,(hl)
   8EE7 C6 18         [ 7] 1168 	add	a, #0x18
   8EE9 57            [ 4] 1169 	ld	d,a
   8EEA 0A            [ 7] 1170 	ld	a,(bc)
   8EEB C6 04         [ 7] 1171 	add	a, #0x04
   8EED C5            [11] 1172 	push	bc
   8EEE D5            [11] 1173 	push	de
   8EEF 33            [ 6] 1174 	inc	sp
   8EF0 F5            [11] 1175 	push	af
   8EF1 33            [ 6] 1176 	inc	sp
   8EF2 CD 40 8A      [17] 1177 	call	_getTilePtr
   8EF5 F1            [10] 1178 	pop	af
   8EF6 C1            [10] 1179 	pop	bc
   8EF7 5E            [ 7] 1180 	ld	e,(hl)
   8EF8 3E 02         [ 7] 1181 	ld	a,#0x02
   8EFA 93            [ 4] 1182 	sub	a, e
   8EFB 38 7B         [12] 1183 	jr	C,00131$
                           1184 ;src/main.c:282: if( (prota.x + G_HERO_W -4) < enemy->x || prota.x  > (enemy->x + G_ENEMY_W) ){
   8EFD 21 20 89      [10] 1185 	ld	hl, #_prota + 0
   8F00 5E            [ 7] 1186 	ld	e,(hl)
   8F01 16 00         [ 7] 1187 	ld	d,#0x00
   8F03 21 03 00      [10] 1188 	ld	hl,#0x0003
   8F06 19            [11] 1189 	add	hl,de
   8F07 DD 75 FE      [19] 1190 	ld	-2 (ix),l
   8F0A DD 74 FF      [19] 1191 	ld	-1 (ix),h
   8F0D 0A            [ 7] 1192 	ld	a,(bc)
   8F0E 4F            [ 4] 1193 	ld	c,a
   8F0F 06 00         [ 7] 1194 	ld	b,#0x00
   8F11 DD 7E FE      [19] 1195 	ld	a,-2 (ix)
   8F14 91            [ 4] 1196 	sub	a, c
   8F15 DD 7E FF      [19] 1197 	ld	a,-1 (ix)
   8F18 98            [ 4] 1198 	sbc	a, b
   8F19 E2 1E 8F      [10] 1199 	jp	PO, 00198$
   8F1C EE 80         [ 7] 1200 	xor	a, #0x80
   8F1E                    1201 00198$:
   8F1E FA 31 8F      [10] 1202 	jp	M,00126$
   8F21 03            [ 6] 1203 	inc	bc
   8F22 03            [ 6] 1204 	inc	bc
   8F23 03            [ 6] 1205 	inc	bc
   8F24 03            [ 6] 1206 	inc	bc
   8F25 79            [ 4] 1207 	ld	a,c
   8F26 93            [ 4] 1208 	sub	a, e
   8F27 78            [ 4] 1209 	ld	a,b
   8F28 9A            [ 4] 1210 	sbc	a, d
   8F29 E2 2E 8F      [10] 1211 	jp	PO, 00199$
   8F2C EE 80         [ 7] 1212 	xor	a, #0x80
   8F2E                    1213 00199$:
   8F2E F2 37 8F      [10] 1214 	jp	P,00127$
   8F31                    1215 00126$:
                           1216 ;src/main.c:283: colisiona = 0;
   8F31 DD 36 F9 00   [19] 1217 	ld	-7 (ix),#0x00
   8F35 18 49         [12] 1218 	jr	00135$
   8F37                    1219 00127$:
                           1220 ;src/main.c:286: if(prota.y > enemy->y){ //si el prota esta abajo
   8F37 21 21 89      [10] 1221 	ld	hl, #(_prota + 0x0001) + 0
   8F3A 4E            [ 7] 1222 	ld	c,(hl)
   8F3B DD 6E FC      [19] 1223 	ld	l,-4 (ix)
   8F3E DD 66 FD      [19] 1224 	ld	h,-3 (ix)
   8F41 5E            [ 7] 1225 	ld	e,(hl)
   8F42 7B            [ 4] 1226 	ld	a,e
   8F43 91            [ 4] 1227 	sub	a, c
   8F44 30 2C         [12] 1228 	jr	NC,00124$
                           1229 ;src/main.c:287: if( prota.y - (enemy->y + G_ENEMY_H) > 2){ // si hay espacio entre el enemigo y el prota
   8F46 06 00         [ 7] 1230 	ld	b,#0x00
   8F48 16 00         [ 7] 1231 	ld	d,#0x00
   8F4A 21 16 00      [10] 1232 	ld	hl,#0x0016
   8F4D 19            [11] 1233 	add	hl,de
   8F4E 79            [ 4] 1234 	ld	a,c
   8F4F 95            [ 4] 1235 	sub	a, l
   8F50 4F            [ 4] 1236 	ld	c,a
   8F51 78            [ 4] 1237 	ld	a,b
   8F52 9C            [ 4] 1238 	sbc	a, h
   8F53 47            [ 4] 1239 	ld	b,a
   8F54 3E 02         [ 7] 1240 	ld	a,#0x02
   8F56 B9            [ 4] 1241 	cp	a, c
   8F57 3E 00         [ 7] 1242 	ld	a,#0x00
   8F59 98            [ 4] 1243 	sbc	a, b
   8F5A E2 5F 8F      [10] 1244 	jp	PO, 00200$
   8F5D EE 80         [ 7] 1245 	xor	a, #0x80
   8F5F                    1246 00200$:
   8F5F F2 68 8F      [10] 1247 	jp	P,00121$
                           1248 ;src/main.c:288: colisiona = 0;
   8F62 DD 36 F9 00   [19] 1249 	ld	-7 (ix),#0x00
   8F66 18 18         [12] 1250 	jr	00135$
   8F68                    1251 00121$:
                           1252 ;src/main.c:291: enemy->mira = M_arriba;
   8F68 DD 6E FA      [19] 1253 	ld	l,-6 (ix)
   8F6B DD 66 FB      [19] 1254 	ld	h,-5 (ix)
   8F6E 36 02         [10] 1255 	ld	(hl),#0x02
   8F70 18 0E         [12] 1256 	jr	00135$
   8F72                    1257 00124$:
                           1258 ;src/main.c:294: colisiona = 0;
   8F72 DD 36 F9 00   [19] 1259 	ld	-7 (ix),#0x00
   8F76 18 08         [12] 1260 	jr	00135$
   8F78                    1261 00131$:
                           1262 ;src/main.c:298: enemy->mira = M_arriba;
   8F78 DD 6E FA      [19] 1263 	ld	l,-6 (ix)
   8F7B DD 66 FB      [19] 1264 	ld	h,-5 (ix)
   8F7E 36 02         [10] 1265 	ld	(hl),#0x02
                           1266 ;src/main.c:301: }
   8F80                    1267 00135$:
                           1268 ;src/main.c:302: return colisiona;
   8F80 DD 6E F9      [19] 1269 	ld	l,-7 (ix)
   8F83 DD F9         [10] 1270 	ld	sp, ix
   8F85 DD E1         [14] 1271 	pop	ix
   8F87 C9            [10] 1272 	ret
                           1273 ;src/main.c:305: void moverEnemigoArriba(TEnemy *enemy){
                           1274 ;	---------------------------------
                           1275 ; Function moverEnemigoArriba
                           1276 ; ---------------------------------
   8F88                    1277 _moverEnemigoArriba::
   8F88 DD E5         [15] 1278 	push	ix
   8F8A DD 21 00 00   [14] 1279 	ld	ix,#0
   8F8E DD 39         [15] 1280 	add	ix,sp
                           1281 ;src/main.c:306: enemy->y--;
   8F90 DD 4E 04      [19] 1282 	ld	c,4 (ix)
   8F93 DD 46 05      [19] 1283 	ld	b,5 (ix)
   8F96 69            [ 4] 1284 	ld	l, c
   8F97 60            [ 4] 1285 	ld	h, b
   8F98 23            [ 6] 1286 	inc	hl
   8F99 5E            [ 7] 1287 	ld	e,(hl)
   8F9A 1D            [ 4] 1288 	dec	e
   8F9B 73            [ 7] 1289 	ld	(hl),e
                           1290 ;src/main.c:307: enemy->y--;
   8F9C 1D            [ 4] 1291 	dec	e
   8F9D 73            [ 7] 1292 	ld	(hl),e
                           1293 ;src/main.c:308: enemy->mover = SI;
   8F9E 21 06 00      [10] 1294 	ld	hl,#0x0006
   8FA1 09            [11] 1295 	add	hl,bc
   8FA2 36 01         [10] 1296 	ld	(hl),#0x01
   8FA4 DD E1         [14] 1297 	pop	ix
   8FA6 C9            [10] 1298 	ret
                           1299 ;src/main.c:311: void moverEnemigoAbajo(TEnemy *enemy){
                           1300 ;	---------------------------------
                           1301 ; Function moverEnemigoAbajo
                           1302 ; ---------------------------------
   8FA7                    1303 _moverEnemigoAbajo::
   8FA7 DD E5         [15] 1304 	push	ix
   8FA9 DD 21 00 00   [14] 1305 	ld	ix,#0
   8FAD DD 39         [15] 1306 	add	ix,sp
                           1307 ;src/main.c:312: enemy->y++;
   8FAF DD 4E 04      [19] 1308 	ld	c,4 (ix)
   8FB2 DD 46 05      [19] 1309 	ld	b,5 (ix)
   8FB5 59            [ 4] 1310 	ld	e, c
   8FB6 50            [ 4] 1311 	ld	d, b
   8FB7 13            [ 6] 1312 	inc	de
   8FB8 1A            [ 7] 1313 	ld	a,(de)
   8FB9 3C            [ 4] 1314 	inc	a
   8FBA 12            [ 7] 1315 	ld	(de),a
                           1316 ;src/main.c:313: enemy->y++;
   8FBB 3C            [ 4] 1317 	inc	a
   8FBC 12            [ 7] 1318 	ld	(de),a
                           1319 ;src/main.c:314: enemy->mover = SI;
   8FBD 21 06 00      [10] 1320 	ld	hl,#0x0006
   8FC0 09            [11] 1321 	add	hl,bc
   8FC1 36 01         [10] 1322 	ld	(hl),#0x01
   8FC3 DD E1         [14] 1323 	pop	ix
   8FC5 C9            [10] 1324 	ret
                           1325 ;src/main.c:317: void moverEnemigo(TEnemy *enemy){
                           1326 ;	---------------------------------
                           1327 ; Function moverEnemigo
                           1328 ; ---------------------------------
   8FC6                    1329 _moverEnemigo::
   8FC6 DD E5         [15] 1330 	push	ix
   8FC8 DD 21 00 00   [14] 1331 	ld	ix,#0
   8FCC DD 39         [15] 1332 	add	ix,sp
                           1333 ;src/main.c:318: if(!enemy->muerto){
   8FCE DD 4E 04      [19] 1334 	ld	c,4 (ix)
   8FD1 DD 46 05      [19] 1335 	ld	b,5 (ix)
   8FD4 C5            [11] 1336 	push	bc
   8FD5 FD E1         [14] 1337 	pop	iy
   8FD7 FD 7E 08      [19] 1338 	ld	a,8 (iy)
   8FDA B7            [ 4] 1339 	or	a, a
   8FDB 20 3C         [12] 1340 	jr	NZ,00110$
                           1341 ;src/main.c:319: if(!checkEnemyCollision(enemy->mira, enemy)){
   8FDD 21 07 00      [10] 1342 	ld	hl,#0x0007
   8FE0 09            [11] 1343 	add	hl,bc
   8FE1 5E            [ 7] 1344 	ld	e,(hl)
   8FE2 16 00         [ 7] 1345 	ld	d,#0x00
   8FE4 E5            [11] 1346 	push	hl
   8FE5 C5            [11] 1347 	push	bc
   8FE6 C5            [11] 1348 	push	bc
   8FE7 D5            [11] 1349 	push	de
   8FE8 CD 6D 8D      [17] 1350 	call	_checkEnemyCollision
   8FEB F1            [10] 1351 	pop	af
   8FEC F1            [10] 1352 	pop	af
   8FED 7D            [ 4] 1353 	ld	a,l
   8FEE C1            [10] 1354 	pop	bc
   8FEF E1            [10] 1355 	pop	hl
   8FF0 B7            [ 4] 1356 	or	a, a
   8FF1 20 26         [12] 1357 	jr	NZ,00110$
                           1358 ;src/main.c:321: switch (enemy->mira) {
   8FF3 5E            [ 7] 1359 	ld	e,(hl)
   8FF4 3E 03         [ 7] 1360 	ld	a,#0x03
   8FF6 93            [ 4] 1361 	sub	a, e
   8FF7 38 20         [12] 1362 	jr	C,00110$
   8FF9 16 00         [ 7] 1363 	ld	d,#0x00
   8FFB 21 01 90      [10] 1364 	ld	hl,#00124$
   8FFE 19            [11] 1365 	add	hl,de
   8FFF 19            [11] 1366 	add	hl,de
                           1367 ;src/main.c:323: case 0:
                           1368 ;src/main.c:325: break;
                           1369 ;src/main.c:326: case 1:
                           1370 ;src/main.c:328: break;
                           1371 ;src/main.c:329: case 2:
   9000 E9            [ 4] 1372 	jp	(hl)
   9001                    1373 00124$:
   9001 18 16         [12] 1374 	jr	00110$
   9003 18 14         [12] 1375 	jr	00110$
   9005 18 06         [12] 1376 	jr	00103$
   9007 18 0B         [12] 1377 	jr	00104$
   9009 18 0E         [12] 1378 	jr	00110$
   900B 18 0C         [12] 1379 	jr	00110$
   900D                    1380 00103$:
                           1381 ;src/main.c:330: moverEnemigoArriba(enemy);
   900D C5            [11] 1382 	push	bc
   900E CD 88 8F      [17] 1383 	call	_moverEnemigoArriba
   9011 F1            [10] 1384 	pop	af
                           1385 ;src/main.c:331: break;
   9012 18 05         [12] 1386 	jr	00110$
                           1387 ;src/main.c:332: case 3:
   9014                    1388 00104$:
                           1389 ;src/main.c:333: moverEnemigoAbajo(enemy);
   9014 C5            [11] 1390 	push	bc
   9015 CD A7 8F      [17] 1391 	call	_moverEnemigoAbajo
   9018 F1            [10] 1392 	pop	af
                           1393 ;src/main.c:335: }
   9019                    1394 00110$:
   9019 DD E1         [14] 1395 	pop	ix
   901B C9            [10] 1396 	ret
                           1397 ;src/main.c:341: void patrolDecision(TEnemy *enemy) { // o devuelve direccion o le pasamos un enemigo y lo mueve
                           1398 ;	---------------------------------
                           1399 ; Function patrolDecision
                           1400 ; ---------------------------------
   901C                    1401 _patrolDecision::
                           1402 ;src/main.c:342: u8 decision = cpct_getRandom_mxor_u8() % 4;
   901C CD 71 87      [17] 1403 	call	_cpct_getRandom_mxor_u8
   901F 7D            [ 4] 1404 	ld	a,l
   9020 E6 03         [ 7] 1405 	and	a, #0x03
   9022 5F            [ 4] 1406 	ld	e,a
                           1407 ;src/main.c:344: switch (decision) {
   9023 3E 03         [ 7] 1408 	ld	a,#0x03
   9025 93            [ 4] 1409 	sub	a, e
   9026 D8            [11] 1410 	ret	C
   9027 16 00         [ 7] 1411 	ld	d,#0x00
   9029 21 2F 90      [10] 1412 	ld	hl,#00112$
   902C 19            [11] 1413 	add	hl,de
   902D 19            [11] 1414 	add	hl,de
                           1415 ;src/main.c:345: case 0:
   902E E9            [ 4] 1416 	jp	(hl)
   902F                    1417 00112$:
   902F 18 06         [12] 1418 	jr	00101$
   9031 18 0D         [12] 1419 	jr	00106$
   9033 18 0B         [12] 1420 	jr	00106$
   9035 18 09         [12] 1421 	jr	00104$
   9037                    1422 00101$:
                           1423 ;src/main.c:346: moverEnemigoAbajo(enemy);
   9037 C1            [10] 1424 	pop	bc
   9038 E1            [10] 1425 	pop	hl
   9039 E5            [11] 1426 	push	hl
   903A C5            [11] 1427 	push	bc
   903B E5            [11] 1428 	push	hl
   903C CD A7 8F      [17] 1429 	call	_moverEnemigoAbajo
   903F F1            [10] 1430 	pop	af
                           1431 ;src/main.c:347: break;
                           1432 ;src/main.c:348: case 1:
                           1433 ;src/main.c:349: break;
                           1434 ;src/main.c:350: case 2:
                           1435 ;src/main.c:351: break;
                           1436 ;src/main.c:352: case 3:
                           1437 ;src/main.c:354: }
   9040                    1438 00104$:
   9040                    1439 00106$:
   9040 C9            [10] 1440 	ret
                           1441 ;src/main.c:357: void avanzarMapa() {
                           1442 ;	---------------------------------
                           1443 ; Function avanzarMapa
                           1444 ; ---------------------------------
   9041                    1445 _avanzarMapa::
                           1446 ;src/main.c:358: if(num_mapa < NUM_MAPAS -1) {
   9041 3A 34 89      [13] 1447 	ld	a,(#_num_mapa + 0)
   9044 D6 02         [ 7] 1448 	sub	a, #0x02
   9046 D2 F5 89      [10] 1449 	jp	NC,_menuFin
                           1450 ;src/main.c:359: mapa = mapas[++num_mapa];
   9049 21 34 89      [10] 1451 	ld	hl, #_num_mapa+0
   904C 34            [11] 1452 	inc	(hl)
   904D FD 21 34 89   [14] 1453 	ld	iy,#_num_mapa
   9051 FD 6E 00      [19] 1454 	ld	l,0 (iy)
   9054 26 00         [ 7] 1455 	ld	h,#0x00
   9056 29            [11] 1456 	add	hl, hl
   9057 11 4B 89      [10] 1457 	ld	de,#_mapas
   905A 19            [11] 1458 	add	hl,de
   905B 7E            [ 7] 1459 	ld	a,(hl)
   905C FD 21 32 89   [14] 1460 	ld	iy,#_mapa
   9060 FD 77 00      [19] 1461 	ld	0 (iy),a
   9063 23            [ 6] 1462 	inc	hl
   9064 7E            [ 7] 1463 	ld	a,(hl)
   9065 32 33 89      [13] 1464 	ld	(#_mapa + 1),a
                           1465 ;src/main.c:360: prota.x = prota.px = 2;
   9068 21 22 89      [10] 1466 	ld	hl,#(_prota + 0x0002)
   906B 36 02         [10] 1467 	ld	(hl),#0x02
   906D 21 20 89      [10] 1468 	ld	hl,#_prota
   9070 36 02         [10] 1469 	ld	(hl),#0x02
                           1470 ;src/main.c:361: prota.mover = SI;
   9072 21 26 89      [10] 1471 	ld	hl,#(_prota + 0x0006)
                           1472 ;src/main.c:362: dibujarMapa();
                           1473 ;src/main.c:366: menuFin();
   9075 36 01         [10] 1474 	ld	(hl), #0x01
   9077 C3 35 89      [10] 1475 	jp	_dibujarMapa
                           1476 ;src/main.c:370: void moverIzquierda() {
                           1477 ;	---------------------------------
                           1478 ; Function moverIzquierda
                           1479 ; ---------------------------------
   907A                    1480 _moverIzquierda::
                           1481 ;src/main.c:371: prota.mira = M_izquierda;
   907A 01 20 89      [10] 1482 	ld	bc,#_prota+0
   907D 21 27 89      [10] 1483 	ld	hl,#(_prota + 0x0007)
   9080 36 01         [10] 1484 	ld	(hl),#0x01
                           1485 ;src/main.c:372: if (!checkCollision(M_izquierda)) {
   9082 C5            [11] 1486 	push	bc
   9083 21 01 00      [10] 1487 	ld	hl,#0x0001
   9086 E5            [11] 1488 	push	hl
   9087 CD 81 8A      [17] 1489 	call	_checkCollision
   908A F1            [10] 1490 	pop	af
   908B C1            [10] 1491 	pop	bc
   908C 7D            [ 4] 1492 	ld	a,l
   908D B7            [ 4] 1493 	or	a, a
   908E C0            [11] 1494 	ret	NZ
                           1495 ;src/main.c:373: prota.x--;
   908F 0A            [ 7] 1496 	ld	a,(bc)
   9090 C6 FF         [ 7] 1497 	add	a,#0xFF
   9092 02            [ 7] 1498 	ld	(bc),a
                           1499 ;src/main.c:374: prota.mover = SI;
   9093 21 26 89      [10] 1500 	ld	hl,#(_prota + 0x0006)
   9096 36 01         [10] 1501 	ld	(hl),#0x01
                           1502 ;src/main.c:375: prota.sprite = g_hero_left;
   9098 21 FE 79      [10] 1503 	ld	hl,#_g_hero_left
   909B 22 24 89      [16] 1504 	ld	((_prota + 0x0004)), hl
   909E C9            [10] 1505 	ret
                           1506 ;src/main.c:379: void moverDerecha() {
                           1507 ;	---------------------------------
                           1508 ; Function moverDerecha
                           1509 ; ---------------------------------
   909F                    1510 _moverDerecha::
                           1511 ;src/main.c:380: prota.mira = M_derecha;
   909F 21 27 89      [10] 1512 	ld	hl,#(_prota + 0x0007)
   90A2 36 00         [10] 1513 	ld	(hl),#0x00
                           1514 ;src/main.c:381: if (!checkCollision(M_derecha) ) {
   90A4 21 00 00      [10] 1515 	ld	hl,#0x0000
   90A7 E5            [11] 1516 	push	hl
   90A8 CD 81 8A      [17] 1517 	call	_checkCollision
   90AB F1            [10] 1518 	pop	af
   90AC 4D            [ 4] 1519 	ld	c,l
                           1520 ;src/main.c:382: prota.x++;
   90AD 21 20 89      [10] 1521 	ld	hl, #_prota + 0
   90B0 5E            [ 7] 1522 	ld	e,(hl)
                           1523 ;src/main.c:381: if (!checkCollision(M_derecha) ) {
   90B1 79            [ 4] 1524 	ld	a,c
   90B2 B7            [ 4] 1525 	or	a, a
   90B3 20 11         [12] 1526 	jr	NZ,00104$
                           1527 ;src/main.c:382: prota.x++;
   90B5 1C            [ 4] 1528 	inc	e
   90B6 21 20 89      [10] 1529 	ld	hl,#_prota
   90B9 73            [ 7] 1530 	ld	(hl),e
                           1531 ;src/main.c:383: prota.mover = SI;
   90BA 21 26 89      [10] 1532 	ld	hl,#(_prota + 0x0006)
   90BD 36 01         [10] 1533 	ld	(hl),#0x01
                           1534 ;src/main.c:384: prota.sprite = g_hero;
   90BF 21 A8 7A      [10] 1535 	ld	hl,#_g_hero
   90C2 22 24 89      [16] 1536 	ld	((_prota + 0x0004)), hl
   90C5 C9            [10] 1537 	ret
   90C6                    1538 00104$:
                           1539 ;src/main.c:386: }else if( prota.x + G_HERO_W >= 80){
   90C6 16 00         [ 7] 1540 	ld	d,#0x00
   90C8 21 07 00      [10] 1541 	ld	hl,#0x0007
   90CB 19            [11] 1542 	add	hl,de
   90CC 11 50 80      [10] 1543 	ld	de, #0x8050
   90CF 29            [11] 1544 	add	hl, hl
   90D0 3F            [ 4] 1545 	ccf
   90D1 CB 1C         [ 8] 1546 	rr	h
   90D3 CB 1D         [ 8] 1547 	rr	l
   90D5 ED 52         [15] 1548 	sbc	hl, de
   90D7 D8            [11] 1549 	ret	C
                           1550 ;src/main.c:387: avanzarMapa();
   90D8 C3 41 90      [10] 1551 	jp  _avanzarMapa
                           1552 ;src/main.c:391: void moverArriba() {
                           1553 ;	---------------------------------
                           1554 ; Function moverArriba
                           1555 ; ---------------------------------
   90DB                    1556 _moverArriba::
                           1557 ;src/main.c:392: prota.mira = M_arriba;
   90DB 21 27 89      [10] 1558 	ld	hl,#(_prota + 0x0007)
   90DE 36 02         [10] 1559 	ld	(hl),#0x02
                           1560 ;src/main.c:393: if (!checkCollision(M_arriba)) { // TODO: COMPROBAR
   90E0 21 02 00      [10] 1561 	ld	hl,#0x0002
   90E3 E5            [11] 1562 	push	hl
   90E4 CD 81 8A      [17] 1563 	call	_checkCollision
   90E7 F1            [10] 1564 	pop	af
   90E8 7D            [ 4] 1565 	ld	a,l
   90E9 B7            [ 4] 1566 	or	a, a
   90EA C0            [11] 1567 	ret	NZ
                           1568 ;src/main.c:394: prota.y--;
   90EB 21 21 89      [10] 1569 	ld	hl,#_prota + 1
   90EE 4E            [ 7] 1570 	ld	c,(hl)
   90EF 0D            [ 4] 1571 	dec	c
   90F0 71            [ 7] 1572 	ld	(hl),c
                           1573 ;src/main.c:395: prota.y--;
   90F1 0D            [ 4] 1574 	dec	c
   90F2 71            [ 7] 1575 	ld	(hl),c
                           1576 ;src/main.c:396: prota.mover  = SI;
   90F3 21 26 89      [10] 1577 	ld	hl,#(_prota + 0x0006)
   90F6 36 01         [10] 1578 	ld	(hl),#0x01
                           1579 ;src/main.c:397: prota.sprite = g_hero_up;
   90F8 21 64 79      [10] 1580 	ld	hl,#_g_hero_up
   90FB 22 24 89      [16] 1581 	ld	((_prota + 0x0004)), hl
   90FE C9            [10] 1582 	ret
                           1583 ;src/main.c:401: void moverAbajo() {
                           1584 ;	---------------------------------
                           1585 ; Function moverAbajo
                           1586 ; ---------------------------------
   90FF                    1587 _moverAbajo::
                           1588 ;src/main.c:402: prota.mira = M_abajo;
   90FF 21 27 89      [10] 1589 	ld	hl,#(_prota + 0x0007)
   9102 36 03         [10] 1590 	ld	(hl),#0x03
                           1591 ;src/main.c:403: if (!checkCollision(M_abajo) ) { // TODO: COMPROBAR
   9104 21 03 00      [10] 1592 	ld	hl,#0x0003
   9107 E5            [11] 1593 	push	hl
   9108 CD 81 8A      [17] 1594 	call	_checkCollision
   910B F1            [10] 1595 	pop	af
   910C 7D            [ 4] 1596 	ld	a,l
   910D B7            [ 4] 1597 	or	a, a
   910E C0            [11] 1598 	ret	NZ
                           1599 ;src/main.c:404: prota.y++;
   910F 01 21 89      [10] 1600 	ld	bc,#_prota + 1
   9112 0A            [ 7] 1601 	ld	a,(bc)
   9113 3C            [ 4] 1602 	inc	a
   9114 02            [ 7] 1603 	ld	(bc),a
                           1604 ;src/main.c:405: prota.y++;
   9115 3C            [ 4] 1605 	inc	a
   9116 02            [ 7] 1606 	ld	(bc),a
                           1607 ;src/main.c:406: prota.mover  = SI;
   9117 21 26 89      [10] 1608 	ld	hl,#(_prota + 0x0006)
   911A 36 01         [10] 1609 	ld	(hl),#0x01
                           1610 ;src/main.c:407: prota.sprite = g_hero_down;
   911C 21 CA 78      [10] 1611 	ld	hl,#_g_hero_down
   911F 22 24 89      [16] 1612 	ld	((_prota + 0x0004)), hl
   9122 C9            [10] 1613 	ret
                           1614 ;src/main.c:411: void dibujarCuchillo() {
                           1615 ;	---------------------------------
                           1616 ; Function dibujarCuchillo
                           1617 ; ---------------------------------
   9123                    1618 _dibujarCuchillo::
   9123 DD E5         [15] 1619 	push	ix
   9125 DD 21 00 00   [14] 1620 	ld	ix,#0
   9129 DD 39         [15] 1621 	add	ix,sp
   912B F5            [11] 1622 	push	af
                           1623 ;src/main.c:412: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   912C 21 29 89      [10] 1624 	ld	hl, #_cu + 1
   912F 56            [ 7] 1625 	ld	d,(hl)
   9130 21 28 89      [10] 1626 	ld	hl, #_cu + 0
   9133 46            [ 7] 1627 	ld	b,(hl)
   9134 D5            [11] 1628 	push	de
   9135 33            [ 6] 1629 	inc	sp
   9136 C5            [11] 1630 	push	bc
   9137 33            [ 6] 1631 	inc	sp
   9138 21 00 C0      [10] 1632 	ld	hl,#0xC000
   913B E5            [11] 1633 	push	hl
   913C CD 70 88      [17] 1634 	call	_cpct_getScreenPtr
   913F 45            [ 4] 1635 	ld	b,l
   9140 5C            [ 4] 1636 	ld	e,h
                           1637 ;src/main.c:413: if(cu.eje == E_X){
   9141 21 30 89      [10] 1638 	ld	hl, #_cu + 8
   9144 4E            [ 7] 1639 	ld	c,(hl)
                           1640 ;src/main.c:414: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   9145 DD 70 FE      [19] 1641 	ld	-2 (ix),b
   9148 DD 73 FF      [19] 1642 	ld	-1 (ix),e
                           1643 ;src/main.c:413: if(cu.eje == E_X){
   914B 79            [ 4] 1644 	ld	a,c
   914C B7            [ 4] 1645 	or	a, a
   914D 20 19         [12] 1646 	jr	NZ,00104$
                           1647 ;src/main.c:414: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   914F 11 00 3E      [10] 1648 	ld	de,#_g_tablatrans+0
   9152 ED 4B 2C 89   [20] 1649 	ld	bc, (#(_cu + 0x0004) + 0)
   9156 D5            [11] 1650 	push	de
   9157 21 04 04      [10] 1651 	ld	hl,#0x0404
   915A E5            [11] 1652 	push	hl
   915B DD 6E FE      [19] 1653 	ld	l,-2 (ix)
   915E DD 66 FF      [19] 1654 	ld	h,-1 (ix)
   9161 E5            [11] 1655 	push	hl
   9162 C5            [11] 1656 	push	bc
   9163 CD 90 88      [17] 1657 	call	_cpct_drawSpriteMaskedAlignedTable
   9166 18 1A         [12] 1658 	jr	00106$
   9168                    1659 00104$:
                           1660 ;src/main.c:417: else if(cu.eje == E_Y){
   9168 0D            [ 4] 1661 	dec	c
   9169 20 17         [12] 1662 	jr	NZ,00106$
                           1663 ;src/main.c:418: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   916B 11 00 3E      [10] 1664 	ld	de,#_g_tablatrans+0
   916E ED 4B 2C 89   [20] 1665 	ld	bc, (#(_cu + 0x0004) + 0)
   9172 D5            [11] 1666 	push	de
   9173 21 02 08      [10] 1667 	ld	hl,#0x0802
   9176 E5            [11] 1668 	push	hl
   9177 DD 6E FE      [19] 1669 	ld	l,-2 (ix)
   917A DD 66 FF      [19] 1670 	ld	h,-1 (ix)
   917D E5            [11] 1671 	push	hl
   917E C5            [11] 1672 	push	bc
   917F CD 90 88      [17] 1673 	call	_cpct_drawSpriteMaskedAlignedTable
   9182                    1674 00106$:
   9182 DD F9         [10] 1675 	ld	sp, ix
   9184 DD E1         [14] 1676 	pop	ix
   9186 C9            [10] 1677 	ret
                           1678 ;src/main.c:422: void borrarCuchillo() {
                           1679 ;	---------------------------------
                           1680 ; Function borrarCuchillo
                           1681 ; ---------------------------------
   9187                    1682 _borrarCuchillo::
   9187 DD E5         [15] 1683 	push	ix
   9189 DD 21 00 00   [14] 1684 	ld	ix,#0
   918D DD 39         [15] 1685 	add	ix,sp
   918F F5            [11] 1686 	push	af
   9190 3B            [ 6] 1687 	dec	sp
                           1688 ;src/main.c:424: u8 w = 2 + (cu.px & 1);
   9191 21 2A 89      [10] 1689 	ld	hl, #_cu + 2
   9194 4E            [ 7] 1690 	ld	c,(hl)
   9195 79            [ 4] 1691 	ld	a,c
   9196 E6 01         [ 7] 1692 	and	a, #0x01
   9198 47            [ 4] 1693 	ld	b,a
   9199 04            [ 4] 1694 	inc	b
   919A 04            [ 4] 1695 	inc	b
                           1696 ;src/main.c:425: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   919B 21 2B 89      [10] 1697 	ld	hl, #_cu + 3
   919E 5E            [ 7] 1698 	ld	e,(hl)
   919F 7B            [ 4] 1699 	ld	a,e
   91A0 E6 03         [ 7] 1700 	and	a, #0x03
   91A2 28 04         [12] 1701 	jr	Z,00105$
   91A4 3E 01         [ 7] 1702 	ld	a,#0x01
   91A6 18 02         [12] 1703 	jr	00106$
   91A8                    1704 00105$:
   91A8 3E 00         [ 7] 1705 	ld	a,#0x00
   91AA                    1706 00106$:
   91AA C6 02         [ 7] 1707 	add	a, #0x02
   91AC DD 77 FD      [19] 1708 	ld	-3 (ix),a
                           1709 ;src/main.c:426: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   91AF FD 2A 32 89   [20] 1710 	ld	iy,(_mapa)
   91B3 16 00         [ 7] 1711 	ld	d,#0x00
   91B5 7B            [ 4] 1712 	ld	a,e
   91B6 C6 E8         [ 7] 1713 	add	a,#0xE8
   91B8 DD 77 FE      [19] 1714 	ld	-2 (ix),a
   91BB 7A            [ 4] 1715 	ld	a,d
   91BC CE FF         [ 7] 1716 	adc	a,#0xFF
   91BE DD 77 FF      [19] 1717 	ld	-1 (ix),a
   91C1 DD 6E FE      [19] 1718 	ld	l,-2 (ix)
   91C4 DD 66 FF      [19] 1719 	ld	h,-1 (ix)
   91C7 DD CB FF 7E   [20] 1720 	bit	7, -1 (ix)
   91CB 28 04         [12] 1721 	jr	Z,00107$
   91CD 21 EB FF      [10] 1722 	ld	hl,#0xFFEB
   91D0 19            [11] 1723 	add	hl,de
   91D1                    1724 00107$:
   91D1 CB 2C         [ 8] 1725 	sra	h
   91D3 CB 1D         [ 8] 1726 	rr	l
   91D5 CB 2C         [ 8] 1727 	sra	h
   91D7 CB 1D         [ 8] 1728 	rr	l
   91D9 55            [ 4] 1729 	ld	d,l
   91DA CB 39         [ 8] 1730 	srl	c
   91DC FD E5         [15] 1731 	push	iy
   91DE 21 F0 C0      [10] 1732 	ld	hl,#0xC0F0
   91E1 E5            [11] 1733 	push	hl
   91E2 3E 28         [ 7] 1734 	ld	a,#0x28
   91E4 F5            [11] 1735 	push	af
   91E5 33            [ 6] 1736 	inc	sp
   91E6 DD 7E FD      [19] 1737 	ld	a,-3 (ix)
   91E9 F5            [11] 1738 	push	af
   91EA 33            [ 6] 1739 	inc	sp
   91EB C5            [11] 1740 	push	bc
   91EC 33            [ 6] 1741 	inc	sp
   91ED D5            [11] 1742 	push	de
   91EE 33            [ 6] 1743 	inc	sp
   91EF 79            [ 4] 1744 	ld	a,c
   91F0 F5            [11] 1745 	push	af
   91F1 33            [ 6] 1746 	inc	sp
   91F2 CD 44 7D      [17] 1747 	call	_cpct_etm_drawTileBox2x4
                           1748 ;src/main.c:427: if(!cu.mover){
   91F5 3A 31 89      [13] 1749 	ld	a, (#_cu + 9)
   91F8 B7            [ 4] 1750 	or	a, a
   91F9 20 05         [12] 1751 	jr	NZ,00103$
                           1752 ;src/main.c:428: cu.lanzado = NO;
   91FB 21 2E 89      [10] 1753 	ld	hl,#(_cu + 0x0006)
   91FE 36 00         [10] 1754 	ld	(hl),#0x00
   9200                    1755 00103$:
   9200 DD F9         [10] 1756 	ld	sp, ix
   9202 DD E1         [14] 1757 	pop	ix
   9204 C9            [10] 1758 	ret
                           1759 ;src/main.c:432: void redibujarCuchillo( ) {
                           1760 ;	---------------------------------
                           1761 ; Function redibujarCuchillo
                           1762 ; ---------------------------------
   9205                    1763 _redibujarCuchillo::
                           1764 ;src/main.c:433: borrarCuchillo();
   9205 CD 87 91      [17] 1765 	call	_borrarCuchillo
                           1766 ;src/main.c:434: cu.px = cu.x;
   9208 01 2A 89      [10] 1767 	ld	bc,#_cu + 2
   920B 3A 28 89      [13] 1768 	ld	a, (#_cu + 0)
   920E 02            [ 7] 1769 	ld	(bc),a
                           1770 ;src/main.c:435: cu.py = cu.y;
   920F 01 2B 89      [10] 1771 	ld	bc,#_cu + 3
   9212 3A 29 89      [13] 1772 	ld	a, (#_cu + 1)
   9215 02            [ 7] 1773 	ld	(bc),a
                           1774 ;src/main.c:436: dibujarCuchillo();
   9216 C3 23 91      [10] 1775 	jp  _dibujarCuchillo
                           1776 ;src/main.c:440: void lanzarCuchillo(){
                           1777 ;	---------------------------------
                           1778 ; Function lanzarCuchillo
                           1779 ; ---------------------------------
   9219                    1780 _lanzarCuchillo::
                           1781 ;src/main.c:442: if(!cu.lanzado){
   9219 3A 2E 89      [13] 1782 	ld	a, (#(_cu + 0x0006) + 0)
   921C B7            [ 4] 1783 	or	a, a
   921D C0            [11] 1784 	ret	NZ
                           1785 ;src/main.c:444: if(prota.mira == M_derecha){
   921E 21 27 89      [10] 1786 	ld	hl, #_prota + 7
   9221 5E            [ 7] 1787 	ld	e,(hl)
                           1788 ;src/main.c:445: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   9222 01 21 89      [10] 1789 	ld	bc,#_prota + 1
                           1790 ;src/main.c:447: cu.direccion = M_derecha;
                           1791 ;src/main.c:449: cu.y=prota.y + G_HERO_H /2;
                           1792 ;src/main.c:450: cu.sprite=g_knifeX_0;
                           1793 ;src/main.c:451: cu.eje = E_X;
                           1794 ;src/main.c:444: if(prota.mira == M_derecha){
   9225 7B            [ 4] 1795 	ld	a,e
   9226 B7            [ 4] 1796 	or	a, a
   9227 20 41         [12] 1797 	jr	NZ,00118$
                           1798 ;src/main.c:445: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   9229 0A            [ 7] 1799 	ld	a,(bc)
   922A C6 0B         [ 7] 1800 	add	a, #0x0B
   922C 5F            [ 4] 1801 	ld	e,a
   922D 3A 20 89      [13] 1802 	ld	a, (#_prota + 0)
   9230 C6 0C         [ 7] 1803 	add	a, #0x0C
   9232 6F            [ 4] 1804 	ld	l,a
   9233 C5            [11] 1805 	push	bc
   9234 7B            [ 4] 1806 	ld	a,e
   9235 F5            [11] 1807 	push	af
   9236 33            [ 6] 1808 	inc	sp
   9237 7D            [ 4] 1809 	ld	a,l
   9238 F5            [11] 1810 	push	af
   9239 33            [ 6] 1811 	inc	sp
   923A CD 40 8A      [17] 1812 	call	_getTilePtr
   923D F1            [10] 1813 	pop	af
   923E C1            [10] 1814 	pop	bc
   923F 5E            [ 7] 1815 	ld	e,(hl)
   9240 3E 02         [ 7] 1816 	ld	a,#0x02
   9242 93            [ 4] 1817 	sub	a, e
   9243 D8            [11] 1818 	ret	C
                           1819 ;src/main.c:446: cu.lanzado = SI;
   9244 21 2E 89      [10] 1820 	ld	hl,#(_cu + 0x0006)
   9247 36 01         [10] 1821 	ld	(hl),#0x01
                           1822 ;src/main.c:447: cu.direccion = M_derecha;
   9249 21 2F 89      [10] 1823 	ld	hl,#(_cu + 0x0007)
   924C 36 00         [10] 1824 	ld	(hl),#0x00
                           1825 ;src/main.c:448: cu.x=prota.x + G_HERO_W;
   924E 3A 20 89      [13] 1826 	ld	a, (#_prota + 0)
   9251 C6 07         [ 7] 1827 	add	a, #0x07
   9253 32 28 89      [13] 1828 	ld	(#_cu),a
                           1829 ;src/main.c:449: cu.y=prota.y + G_HERO_H /2;
   9256 0A            [ 7] 1830 	ld	a,(bc)
   9257 C6 0B         [ 7] 1831 	add	a, #0x0B
   9259 32 29 89      [13] 1832 	ld	(#(_cu + 0x0001)),a
                           1833 ;src/main.c:450: cu.sprite=g_knifeX_0;
   925C 21 C0 54      [10] 1834 	ld	hl,#_g_knifeX_0
   925F 22 2C 89      [16] 1835 	ld	((_cu + 0x0004)), hl
                           1836 ;src/main.c:451: cu.eje = E_X;
   9262 21 30 89      [10] 1837 	ld	hl,#(_cu + 0x0008)
   9265 36 00         [10] 1838 	ld	(hl),#0x00
                           1839 ;src/main.c:452: dibujarCuchillo();
   9267 C3 23 91      [10] 1840 	jp  _dibujarCuchillo
   926A                    1841 00118$:
                           1842 ;src/main.c:455: else if(prota.mira == M_izquierda){
   926A 7B            [ 4] 1843 	ld	a,e
   926B 3D            [ 4] 1844 	dec	a
   926C 20 41         [12] 1845 	jr	NZ,00115$
                           1846 ;src/main.c:456: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   926E 0A            [ 7] 1847 	ld	a,(bc)
   926F C6 0B         [ 7] 1848 	add	a, #0x0B
   9271 5F            [ 4] 1849 	ld	e,a
   9272 3A 20 89      [13] 1850 	ld	a, (#_prota + 0)
   9275 C6 F6         [ 7] 1851 	add	a,#0xF6
   9277 6F            [ 4] 1852 	ld	l,a
   9278 C5            [11] 1853 	push	bc
   9279 7B            [ 4] 1854 	ld	a,e
   927A F5            [11] 1855 	push	af
   927B 33            [ 6] 1856 	inc	sp
   927C 7D            [ 4] 1857 	ld	a,l
   927D F5            [11] 1858 	push	af
   927E 33            [ 6] 1859 	inc	sp
   927F CD 40 8A      [17] 1860 	call	_getTilePtr
   9282 F1            [10] 1861 	pop	af
   9283 C1            [10] 1862 	pop	bc
   9284 5E            [ 7] 1863 	ld	e,(hl)
   9285 3E 02         [ 7] 1864 	ld	a,#0x02
   9287 93            [ 4] 1865 	sub	a, e
   9288 D8            [11] 1866 	ret	C
                           1867 ;src/main.c:457: cu.lanzado = SI;
   9289 21 2E 89      [10] 1868 	ld	hl,#(_cu + 0x0006)
   928C 36 01         [10] 1869 	ld	(hl),#0x01
                           1870 ;src/main.c:458: cu.direccion = M_izquierda;
   928E 21 2F 89      [10] 1871 	ld	hl,#(_cu + 0x0007)
   9291 36 01         [10] 1872 	ld	(hl),#0x01
                           1873 ;src/main.c:459: cu.x = prota.x - G_KNIFEX_0_W;
   9293 3A 20 89      [13] 1874 	ld	a, (#_prota + 0)
   9296 C6 FC         [ 7] 1875 	add	a,#0xFC
   9298 32 28 89      [13] 1876 	ld	(#_cu),a
                           1877 ;src/main.c:460: cu.y = prota.y + G_HERO_H /2;
   929B 0A            [ 7] 1878 	ld	a,(bc)
   929C C6 0B         [ 7] 1879 	add	a, #0x0B
   929E 32 29 89      [13] 1880 	ld	(#(_cu + 0x0001)),a
                           1881 ;src/main.c:461: cu.sprite = g_knifeX_1;
   92A1 21 D0 54      [10] 1882 	ld	hl,#_g_knifeX_1
   92A4 22 2C 89      [16] 1883 	ld	((_cu + 0x0004)), hl
                           1884 ;src/main.c:462: cu.eje = E_X;
   92A7 21 30 89      [10] 1885 	ld	hl,#(_cu + 0x0008)
   92AA 36 00         [10] 1886 	ld	(hl),#0x00
                           1887 ;src/main.c:463: dibujarCuchillo();
   92AC C3 23 91      [10] 1888 	jp  _dibujarCuchillo
   92AF                    1889 00115$:
                           1890 ;src/main.c:466: else if(prota.mira == M_abajo){
   92AF 7B            [ 4] 1891 	ld	a,e
   92B0 D6 03         [ 7] 1892 	sub	a, #0x03
   92B2 20 41         [12] 1893 	jr	NZ,00112$
                           1894 ;src/main.c:468: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   92B4 0A            [ 7] 1895 	ld	a,(bc)
   92B5 C6 1F         [ 7] 1896 	add	a, #0x1F
   92B7 5F            [ 4] 1897 	ld	e,a
   92B8 3A 20 89      [13] 1898 	ld	a, (#_prota + 0)
   92BB 57            [ 4] 1899 	ld	d,a
   92BC 14            [ 4] 1900 	inc	d
   92BD 14            [ 4] 1901 	inc	d
   92BE 14            [ 4] 1902 	inc	d
   92BF C5            [11] 1903 	push	bc
   92C0 7B            [ 4] 1904 	ld	a,e
   92C1 F5            [11] 1905 	push	af
   92C2 33            [ 6] 1906 	inc	sp
   92C3 D5            [11] 1907 	push	de
   92C4 33            [ 6] 1908 	inc	sp
   92C5 CD 40 8A      [17] 1909 	call	_getTilePtr
   92C8 F1            [10] 1910 	pop	af
   92C9 C1            [10] 1911 	pop	bc
   92CA 5E            [ 7] 1912 	ld	e,(hl)
   92CB 3E 02         [ 7] 1913 	ld	a,#0x02
   92CD 93            [ 4] 1914 	sub	a, e
   92CE D8            [11] 1915 	ret	C
                           1916 ;src/main.c:469: cu.lanzado = SI;
   92CF 21 2E 89      [10] 1917 	ld	hl,#(_cu + 0x0006)
   92D2 36 01         [10] 1918 	ld	(hl),#0x01
                           1919 ;src/main.c:470: cu.direccion = M_abajo;
   92D4 21 2F 89      [10] 1920 	ld	hl,#(_cu + 0x0007)
   92D7 36 03         [10] 1921 	ld	(hl),#0x03
                           1922 ;src/main.c:471: cu.x = prota.x + G_HERO_W / 2;
   92D9 3A 20 89      [13] 1923 	ld	a, (#_prota + 0)
   92DC C6 03         [ 7] 1924 	add	a, #0x03
   92DE 32 28 89      [13] 1925 	ld	(#_cu),a
                           1926 ;src/main.c:472: cu.y = prota.y + G_HERO_H;
   92E1 0A            [ 7] 1927 	ld	a,(bc)
   92E2 C6 16         [ 7] 1928 	add	a, #0x16
   92E4 32 29 89      [13] 1929 	ld	(#(_cu + 0x0001)),a
                           1930 ;src/main.c:473: cu.sprite = g_knifeY_0;
   92E7 21 A0 54      [10] 1931 	ld	hl,#_g_knifeY_0
   92EA 22 2C 89      [16] 1932 	ld	((_cu + 0x0004)), hl
                           1933 ;src/main.c:474: cu.eje = E_Y;
   92ED 21 30 89      [10] 1934 	ld	hl,#(_cu + 0x0008)
   92F0 36 01         [10] 1935 	ld	(hl),#0x01
                           1936 ;src/main.c:475: dibujarCuchillo();
   92F2 C3 23 91      [10] 1937 	jp  _dibujarCuchillo
   92F5                    1938 00112$:
                           1939 ;src/main.c:478: else if(prota.mira == M_arriba){
   92F5 7B            [ 4] 1940 	ld	a,e
   92F6 D6 02         [ 7] 1941 	sub	a, #0x02
   92F8 C0            [11] 1942 	ret	NZ
                           1943 ;src/main.c:479: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   92F9 0A            [ 7] 1944 	ld	a,(bc)
   92FA C6 F7         [ 7] 1945 	add	a,#0xF7
   92FC 57            [ 4] 1946 	ld	d,a
   92FD 3A 20 89      [13] 1947 	ld	a, (#_prota + 0)
   9300 C6 03         [ 7] 1948 	add	a, #0x03
   9302 C5            [11] 1949 	push	bc
   9303 D5            [11] 1950 	push	de
   9304 33            [ 6] 1951 	inc	sp
   9305 F5            [11] 1952 	push	af
   9306 33            [ 6] 1953 	inc	sp
   9307 CD 40 8A      [17] 1954 	call	_getTilePtr
   930A F1            [10] 1955 	pop	af
   930B C1            [10] 1956 	pop	bc
   930C 5E            [ 7] 1957 	ld	e,(hl)
   930D 3E 02         [ 7] 1958 	ld	a,#0x02
   930F 93            [ 4] 1959 	sub	a, e
   9310 D8            [11] 1960 	ret	C
                           1961 ;src/main.c:480: cu.lanzado = SI;
   9311 21 2E 89      [10] 1962 	ld	hl,#(_cu + 0x0006)
   9314 36 01         [10] 1963 	ld	(hl),#0x01
                           1964 ;src/main.c:481: cu.direccion = M_arriba;
   9316 21 2F 89      [10] 1965 	ld	hl,#(_cu + 0x0007)
   9319 36 02         [10] 1966 	ld	(hl),#0x02
                           1967 ;src/main.c:482: cu.x = prota.x + G_HERO_W / 2;
   931B 3A 20 89      [13] 1968 	ld	a, (#_prota + 0)
   931E C6 03         [ 7] 1969 	add	a, #0x03
   9320 32 28 89      [13] 1970 	ld	(#_cu),a
                           1971 ;src/main.c:483: cu.y = prota.y;
   9323 0A            [ 7] 1972 	ld	a,(bc)
   9324 32 29 89      [13] 1973 	ld	(#(_cu + 0x0001)),a
                           1974 ;src/main.c:484: cu.sprite = g_knifeY_1;
   9327 21 B0 54      [10] 1975 	ld	hl,#_g_knifeY_1
   932A 22 2C 89      [16] 1976 	ld	((_cu + 0x0004)), hl
                           1977 ;src/main.c:485: cu.eje = E_Y;
   932D 21 30 89      [10] 1978 	ld	hl,#(_cu + 0x0008)
   9330 36 01         [10] 1979 	ld	(hl),#0x01
                           1980 ;src/main.c:486: dibujarCuchillo();
   9332 C3 23 91      [10] 1981 	jp  _dibujarCuchillo
                           1982 ;src/main.c:492: void comprobarTeclado() {
                           1983 ;	---------------------------------
                           1984 ; Function comprobarTeclado
                           1985 ; ---------------------------------
   9335                    1986 _comprobarTeclado::
                           1987 ;src/main.c:493: cpct_scanKeyboard_if();
   9335 CD 9C 7E      [17] 1988 	call	_cpct_scanKeyboard_if
                           1989 ;src/main.c:495: if (cpct_isAnyKeyPressed()) {
   9338 CD 8F 7E      [17] 1990 	call	_cpct_isAnyKeyPressed
   933B 7D            [ 4] 1991 	ld	a,l
   933C B7            [ 4] 1992 	or	a, a
   933D C8            [11] 1993 	ret	Z
                           1994 ;src/main.c:496: if (cpct_isKeyPressed(Key_CursorLeft))
   933E 21 01 01      [10] 1995 	ld	hl,#0x0101
   9341 CD F9 7B      [17] 1996 	call	_cpct_isKeyPressed
   9344 7D            [ 4] 1997 	ld	a,l
   9345 B7            [ 4] 1998 	or	a, a
                           1999 ;src/main.c:497: moverIzquierda();
   9346 C2 7A 90      [10] 2000 	jp	NZ,_moverIzquierda
                           2001 ;src/main.c:498: else if (cpct_isKeyPressed(Key_CursorRight))
   9349 21 00 02      [10] 2002 	ld	hl,#0x0200
   934C CD F9 7B      [17] 2003 	call	_cpct_isKeyPressed
   934F 7D            [ 4] 2004 	ld	a,l
   9350 B7            [ 4] 2005 	or	a, a
                           2006 ;src/main.c:499: moverDerecha();
   9351 C2 9F 90      [10] 2007 	jp	NZ,_moverDerecha
                           2008 ;src/main.c:500: else if (cpct_isKeyPressed(Key_CursorUp))
   9354 21 00 01      [10] 2009 	ld	hl,#0x0100
   9357 CD F9 7B      [17] 2010 	call	_cpct_isKeyPressed
   935A 7D            [ 4] 2011 	ld	a,l
   935B B7            [ 4] 2012 	or	a, a
                           2013 ;src/main.c:501: moverArriba();
   935C C2 DB 90      [10] 2014 	jp	NZ,_moverArriba
                           2015 ;src/main.c:502: else if (cpct_isKeyPressed(Key_CursorDown))
   935F 21 00 04      [10] 2016 	ld	hl,#0x0400
   9362 CD F9 7B      [17] 2017 	call	_cpct_isKeyPressed
   9365 7D            [ 4] 2018 	ld	a,l
   9366 B7            [ 4] 2019 	or	a, a
                           2020 ;src/main.c:503: moverAbajo();
   9367 C2 FF 90      [10] 2021 	jp	NZ,_moverAbajo
                           2022 ;src/main.c:504: else if (cpct_isKeyPressed(Key_Space))
   936A 21 05 80      [10] 2023 	ld	hl,#0x8005
   936D CD F9 7B      [17] 2024 	call	_cpct_isKeyPressed
   9370 7D            [ 4] 2025 	ld	a,l
   9371 B7            [ 4] 2026 	or	a, a
   9372 C8            [11] 2027 	ret	Z
                           2028 ;src/main.c:505: lanzarCuchillo();
   9373 C3 19 92      [10] 2029 	jp  _lanzarCuchillo
                           2030 ;src/main.c:509: u8 checkKnifeCollision(int direction){
                           2031 ;	---------------------------------
                           2032 ; Function checkKnifeCollision
                           2033 ; ---------------------------------
   9376                    2034 _checkKnifeCollision::
   9376 DD E5         [15] 2035 	push	ix
   9378 DD 21 00 00   [14] 2036 	ld	ix,#0
   937C DD 39         [15] 2037 	add	ix,sp
                           2038 ;src/main.c:511: u8 colisiona = 1;
   937E 0E 01         [ 7] 2039 	ld	c,#0x01
                           2040 ;src/main.c:513: switch (direction) {
   9380 DD CB 05 7E   [20] 2041 	bit	7, 5 (ix)
   9384 C2 70 94      [10] 2042 	jp	NZ,00125$
   9387 3E 03         [ 7] 2043 	ld	a,#0x03
   9389 DD BE 04      [19] 2044 	cp	a, 4 (ix)
   938C 3E 00         [ 7] 2045 	ld	a,#0x00
   938E DD 9E 05      [19] 2046 	sbc	a, 5 (ix)
   9391 E2 96 93      [10] 2047 	jp	PO, 00163$
   9394 EE 80         [ 7] 2048 	xor	a, #0x80
   9396                    2049 00163$:
   9396 FA 70 94      [10] 2050 	jp	M,00125$
   9399 DD 5E 04      [19] 2051 	ld	e,4 (ix)
   939C 16 00         [ 7] 2052 	ld	d,#0x00
   939E 21 A5 93      [10] 2053 	ld	hl,#00164$
   93A1 19            [11] 2054 	add	hl,de
   93A2 19            [11] 2055 	add	hl,de
   93A3 19            [11] 2056 	add	hl,de
   93A4 E9            [ 4] 2057 	jp	(hl)
   93A5                    2058 00164$:
   93A5 C3 70 94      [10] 2059 	jp	00125$
   93A8 C3 70 94      [10] 2060 	jp	00125$
   93AB C3 B7 93      [10] 2061 	jp	00103$
   93AE C3 0E 94      [10] 2062 	jp	00114$
                           2063 ;src/main.c:514: case 0:
                           2064 ;src/main.c:516: break;
   93B1 C3 70 94      [10] 2065 	jp	00125$
                           2066 ;src/main.c:517: case 1:
                           2067 ;src/main.c:519: break;
   93B4 C3 70 94      [10] 2068 	jp	00125$
                           2069 ;src/main.c:520: case 2:
   93B7                    2070 00103$:
                           2071 ;src/main.c:522: if((enemy->x + G_ENEMY_W) < cu.x || enemy->x  > (cu.x + G_KNIFEX_0_W)){
   93B7 21 F4 88      [10] 2072 	ld	hl,#_enemy+0
   93BA 4E            [ 7] 2073 	ld	c,(hl)
   93BB 06 00         [ 7] 2074 	ld	b,#0x00
   93BD 21 04 00      [10] 2075 	ld	hl,#0x0004
   93C0 09            [11] 2076 	add	hl,bc
   93C1 EB            [ 4] 2077 	ex	de,hl
   93C2 21 28 89      [10] 2078 	ld	hl,#_cu+0
   93C5 6E            [ 7] 2079 	ld	l,(hl)
   93C6 26 00         [ 7] 2080 	ld	h,#0x00
   93C8 7B            [ 4] 2081 	ld	a,e
   93C9 95            [ 4] 2082 	sub	a, l
   93CA 7A            [ 4] 2083 	ld	a,d
   93CB 9C            [ 4] 2084 	sbc	a, h
   93CC E2 D1 93      [10] 2085 	jp	PO, 00165$
   93CF EE 80         [ 7] 2086 	xor	a, #0x80
   93D1                    2087 00165$:
   93D1 FA 0E 94      [10] 2088 	jp	M,00114$
   93D4 11 04 00      [10] 2089 	ld	de,#0x0004
   93D7 19            [11] 2090 	add	hl,de
   93D8 7D            [ 4] 2091 	ld	a,l
   93D9 91            [ 4] 2092 	sub	a, c
   93DA 7C            [ 4] 2093 	ld	a,h
   93DB 98            [ 4] 2094 	sbc	a, b
   93DC E2 E1 93      [10] 2095 	jp	PO, 00166$
   93DF EE 80         [ 7] 2096 	xor	a, #0x80
   93E1                    2097 00166$:
   93E1 FA 0E 94      [10] 2098 	jp	M,00114$
                           2099 ;src/main.c:525: if(cu.y>enemy->y){
   93E4 21 29 89      [10] 2100 	ld	hl, #(_cu + 0x0001) + 0
   93E7 4E            [ 7] 2101 	ld	c,(hl)
   93E8 21 F5 88      [10] 2102 	ld	hl, #_enemy + 1
   93EB 5E            [ 7] 2103 	ld	e,(hl)
   93EC 7B            [ 4] 2104 	ld	a,e
   93ED 91            [ 4] 2105 	sub	a, c
   93EE 30 1E         [12] 2106 	jr	NC,00114$
                           2107 ;src/main.c:526: if(cu.y - (enemy->y + G_ENEMY_H) >= 2){
   93F0 06 00         [ 7] 2108 	ld	b,#0x00
   93F2 16 00         [ 7] 2109 	ld	d,#0x00
   93F4 21 16 00      [10] 2110 	ld	hl,#0x0016
   93F7 19            [11] 2111 	add	hl,de
   93F8 79            [ 4] 2112 	ld	a,c
   93F9 95            [ 4] 2113 	sub	a, l
   93FA 4F            [ 4] 2114 	ld	c,a
   93FB 78            [ 4] 2115 	ld	a,b
   93FC 9C            [ 4] 2116 	sbc	a, h
   93FD 47            [ 4] 2117 	ld	b,a
   93FE 79            [ 4] 2118 	ld	a,c
   93FF D6 02         [ 7] 2119 	sub	a, #0x02
   9401 78            [ 4] 2120 	ld	a,b
   9402 17            [ 4] 2121 	rla
   9403 3F            [ 4] 2122 	ccf
   9404 1F            [ 4] 2123 	rra
   9405 DE 80         [ 7] 2124 	sbc	a, #0x80
   9407 30 05         [12] 2125 	jr	NC,00114$
                           2126 ;src/main.c:531: enemy->muerto = SI;
   9409 21 FC 88      [10] 2127 	ld	hl,#(_enemy + 0x0008)
   940C 36 01         [10] 2128 	ld	(hl),#0x01
                           2129 ;src/main.c:538: case 3:
   940E                    2130 00114$:
                           2131 ;src/main.c:540: if((enemy->x + G_ENEMY_W) < cu.x || enemy->x  > (cu.x + G_KNIFEX_0_W)){
   940E 21 F4 88      [10] 2132 	ld	hl, #_enemy + 0
   9411 4E            [ 7] 2133 	ld	c,(hl)
   9412 06 00         [ 7] 2134 	ld	b,#0x00
   9414 21 04 00      [10] 2135 	ld	hl,#0x0004
   9417 09            [11] 2136 	add	hl,bc
   9418 EB            [ 4] 2137 	ex	de,hl
   9419 21 28 89      [10] 2138 	ld	hl, #_cu + 0
   941C 6E            [ 7] 2139 	ld	l,(hl)
   941D 26 00         [ 7] 2140 	ld	h,#0x00
   941F 7B            [ 4] 2141 	ld	a,e
   9420 95            [ 4] 2142 	sub	a, l
   9421 7A            [ 4] 2143 	ld	a,d
   9422 9C            [ 4] 2144 	sbc	a, h
   9423 E2 28 94      [10] 2145 	jp	PO, 00167$
   9426 EE 80         [ 7] 2146 	xor	a, #0x80
   9428                    2147 00167$:
   9428 FA 3B 94      [10] 2148 	jp	M,00121$
   942B 11 04 00      [10] 2149 	ld	de,#0x0004
   942E 19            [11] 2150 	add	hl,de
   942F 7D            [ 4] 2151 	ld	a,l
   9430 91            [ 4] 2152 	sub	a, c
   9431 7C            [ 4] 2153 	ld	a,h
   9432 98            [ 4] 2154 	sbc	a, b
   9433 E2 38 94      [10] 2155 	jp	PO, 00168$
   9436 EE 80         [ 7] 2156 	xor	a, #0x80
   9438                    2157 00168$:
   9438 F2 3F 94      [10] 2158 	jp	P,00122$
   943B                    2159 00121$:
                           2160 ;src/main.c:541: colisiona = 0;
   943B 0E 00         [ 7] 2161 	ld	c,#0x00
   943D 18 31         [12] 2162 	jr	00125$
   943F                    2163 00122$:
                           2164 ;src/main.c:543: if(cu.y<enemy->y){
   943F 21 29 89      [10] 2165 	ld	hl, #(_cu + 0x0001) + 0
   9442 4E            [ 7] 2166 	ld	c,(hl)
   9443 21 F5 88      [10] 2167 	ld	hl, #_enemy + 1
   9446 6E            [ 7] 2168 	ld	l,(hl)
   9447 79            [ 4] 2169 	ld	a,c
   9448 95            [ 4] 2170 	sub	a, l
   9449 30 23         [12] 2171 	jr	NC,00119$
                           2172 ;src/main.c:544: if(enemy->y - (cu.y + G_KNIFEX_0_H - 2) >= 2){
   944B 26 00         [ 7] 2173 	ld	h,#0x00
   944D 06 00         [ 7] 2174 	ld	b,#0x00
   944F 03            [ 6] 2175 	inc	bc
   9450 03            [ 6] 2176 	inc	bc
   9451 BF            [ 4] 2177 	cp	a, a
   9452 ED 42         [15] 2178 	sbc	hl, bc
   9454 11 02 80      [10] 2179 	ld	de, #0x8002
   9457 29            [11] 2180 	add	hl, hl
   9458 3F            [ 4] 2181 	ccf
   9459 CB 1C         [ 8] 2182 	rr	h
   945B CB 1D         [ 8] 2183 	rr	l
   945D ED 52         [15] 2184 	sbc	hl, de
   945F 38 04         [12] 2185 	jr	C,00116$
                           2186 ;src/main.c:545: colisiona = 0;
   9461 0E 00         [ 7] 2187 	ld	c,#0x00
   9463 18 0B         [12] 2188 	jr	00125$
   9465                    2189 00116$:
                           2190 ;src/main.c:547: colisiona = 1;
   9465 0E 01         [ 7] 2191 	ld	c,#0x01
                           2192 ;src/main.c:548: enemy->muerto = SI;
   9467 21 FC 88      [10] 2193 	ld	hl,#(_enemy + 0x0008)
   946A 36 01         [10] 2194 	ld	(hl),#0x01
   946C 18 02         [12] 2195 	jr	00125$
   946E                    2196 00119$:
                           2197 ;src/main.c:551: colisiona = 0;
   946E 0E 00         [ 7] 2198 	ld	c,#0x00
                           2199 ;src/main.c:554: }
   9470                    2200 00125$:
                           2201 ;src/main.c:555: return colisiona;
   9470 69            [ 4] 2202 	ld	l,c
   9471 DD E1         [14] 2203 	pop	ix
   9473 C9            [10] 2204 	ret
                           2205 ;src/main.c:558: void moverCuchillo(){
                           2206 ;	---------------------------------
                           2207 ; Function moverCuchillo
                           2208 ; ---------------------------------
   9474                    2209 _moverCuchillo::
                           2210 ;src/main.c:560: if(cu.lanzado){
   9474 01 28 89      [10] 2211 	ld	bc,#_cu+0
   9477 3A 2E 89      [13] 2212 	ld	a, (#_cu + 6)
   947A B7            [ 4] 2213 	or	a, a
   947B C8            [11] 2214 	ret	Z
                           2215 ;src/main.c:561: cu.mover = 1;
   947C 21 31 89      [10] 2216 	ld	hl,#(_cu + 0x0009)
   947F 36 01         [10] 2217 	ld	(hl),#0x01
                           2218 ;src/main.c:562: if(cu.direccion == M_derecha){
   9481 21 2F 89      [10] 2219 	ld	hl, #_cu + 7
   9484 6E            [ 7] 2220 	ld	l,(hl)
                           2221 ;src/main.c:564: if( *getTilePtr(cu.x + G_KNIFEX_0_W + 1, cu.y) <= 2){
   9485 59            [ 4] 2222 	ld	e, c
   9486 50            [ 4] 2223 	ld	d, b
   9487 13            [ 6] 2224 	inc	de
                           2225 ;src/main.c:562: if(cu.direccion == M_derecha){
   9488 7D            [ 4] 2226 	ld	a,l
   9489 B7            [ 4] 2227 	or	a, a
   948A 20 27         [12] 2228 	jr	NZ,00128$
                           2229 ;src/main.c:564: if( *getTilePtr(cu.x + G_KNIFEX_0_W + 1, cu.y) <= 2){
   948C 1A            [ 7] 2230 	ld	a,(de)
   948D 5F            [ 4] 2231 	ld	e,a
   948E 0A            [ 7] 2232 	ld	a,(bc)
   948F C6 05         [ 7] 2233 	add	a, #0x05
   9491 6F            [ 4] 2234 	ld	l,a
   9492 C5            [11] 2235 	push	bc
   9493 7B            [ 4] 2236 	ld	a,e
   9494 F5            [11] 2237 	push	af
   9495 33            [ 6] 2238 	inc	sp
   9496 7D            [ 4] 2239 	ld	a,l
   9497 F5            [11] 2240 	push	af
   9498 33            [ 6] 2241 	inc	sp
   9499 CD 40 8A      [17] 2242 	call	_getTilePtr
   949C F1            [10] 2243 	pop	af
   949D C1            [10] 2244 	pop	bc
   949E 5E            [ 7] 2245 	ld	e,(hl)
   949F 3E 02         [ 7] 2246 	ld	a,#0x02
   94A1 93            [ 4] 2247 	sub	a, e
   94A2 38 09         [12] 2248 	jr	C,00102$
                           2249 ;src/main.c:565: cu.x++;
   94A4 0A            [ 7] 2250 	ld	a,(bc)
   94A5 3C            [ 4] 2251 	inc	a
   94A6 02            [ 7] 2252 	ld	(bc),a
                           2253 ;src/main.c:566: cu.mover = SI;
   94A7 21 31 89      [10] 2254 	ld	hl,#(_cu + 0x0009)
   94AA 36 01         [10] 2255 	ld	(hl),#0x01
   94AC C9            [10] 2256 	ret
   94AD                    2257 00102$:
                           2258 ;src/main.c:570: cu.mover=NO;
   94AD 21 31 89      [10] 2259 	ld	hl,#(_cu + 0x0009)
   94B0 36 00         [10] 2260 	ld	(hl),#0x00
   94B2 C9            [10] 2261 	ret
   94B3                    2262 00128$:
                           2263 ;src/main.c:573: else if(cu.direccion == M_izquierda){
   94B3 7D            [ 4] 2264 	ld	a,l
   94B4 3D            [ 4] 2265 	dec	a
   94B5 20 26         [12] 2266 	jr	NZ,00125$
                           2267 ;src/main.c:574: if(*getTilePtr(cu.x - 1, cu.y) <= 2){
   94B7 1A            [ 7] 2268 	ld	a,(de)
   94B8 5F            [ 4] 2269 	ld	e,a
   94B9 0A            [ 7] 2270 	ld	a,(bc)
   94BA 57            [ 4] 2271 	ld	d,a
   94BB 15            [ 4] 2272 	dec	d
   94BC C5            [11] 2273 	push	bc
   94BD 7B            [ 4] 2274 	ld	a,e
   94BE F5            [11] 2275 	push	af
   94BF 33            [ 6] 2276 	inc	sp
   94C0 D5            [11] 2277 	push	de
   94C1 33            [ 6] 2278 	inc	sp
   94C2 CD 40 8A      [17] 2279 	call	_getTilePtr
   94C5 F1            [10] 2280 	pop	af
   94C6 C1            [10] 2281 	pop	bc
   94C7 5E            [ 7] 2282 	ld	e,(hl)
   94C8 3E 02         [ 7] 2283 	ld	a,#0x02
   94CA 93            [ 4] 2284 	sub	a, e
   94CB 38 0A         [12] 2285 	jr	C,00105$
                           2286 ;src/main.c:575: cu.x--;
   94CD 0A            [ 7] 2287 	ld	a,(bc)
   94CE C6 FF         [ 7] 2288 	add	a,#0xFF
   94D0 02            [ 7] 2289 	ld	(bc),a
                           2290 ;src/main.c:576: cu.mover = SI;
   94D1 21 31 89      [10] 2291 	ld	hl,#(_cu + 0x0009)
   94D4 36 01         [10] 2292 	ld	(hl),#0x01
   94D6 C9            [10] 2293 	ret
   94D7                    2294 00105$:
                           2295 ;src/main.c:579: cu.mover=NO;
   94D7 21 31 89      [10] 2296 	ld	hl,#(_cu + 0x0009)
   94DA 36 00         [10] 2297 	ld	(hl),#0x00
   94DC C9            [10] 2298 	ret
   94DD                    2299 00125$:
                           2300 ;src/main.c:582: else if(cu.direccion == M_arriba){
   94DD 7D            [ 4] 2301 	ld	a,l
   94DE D6 02         [ 7] 2302 	sub	a, #0x02
   94E0 20 3E         [12] 2303 	jr	NZ,00122$
                           2304 ;src/main.c:583: if(*getTilePtr(cu.x, cu.y - 2) <= 2){
   94E2 1A            [ 7] 2305 	ld	a,(de)
   94E3 C6 FE         [ 7] 2306 	add	a,#0xFE
   94E5 F5            [11] 2307 	push	af
   94E6 0A            [ 7] 2308 	ld	a,(bc)
   94E7 47            [ 4] 2309 	ld	b,a
   94E8 F1            [10] 2310 	pop	af
   94E9 D5            [11] 2311 	push	de
   94EA F5            [11] 2312 	push	af
   94EB 33            [ 6] 2313 	inc	sp
   94EC C5            [11] 2314 	push	bc
   94ED 33            [ 6] 2315 	inc	sp
   94EE CD 40 8A      [17] 2316 	call	_getTilePtr
   94F1 F1            [10] 2317 	pop	af
   94F2 D1            [10] 2318 	pop	de
   94F3 4E            [ 7] 2319 	ld	c,(hl)
   94F4 3E 02         [ 7] 2320 	ld	a,#0x02
   94F6 91            [ 4] 2321 	sub	a, c
   94F7 38 21         [12] 2322 	jr	C,00111$
                           2323 ;src/main.c:584: if(!checkKnifeCollision(M_arriba)){
   94F9 D5            [11] 2324 	push	de
   94FA 21 02 00      [10] 2325 	ld	hl,#0x0002
   94FD E5            [11] 2326 	push	hl
   94FE CD 76 93      [17] 2327 	call	_checkKnifeCollision
   9501 F1            [10] 2328 	pop	af
   9502 D1            [10] 2329 	pop	de
   9503 7D            [ 4] 2330 	ld	a,l
   9504 B7            [ 4] 2331 	or	a, a
   9505 20 0D         [12] 2332 	jr	NZ,00108$
                           2333 ;src/main.c:585: cu.y--;
   9507 1A            [ 7] 2334 	ld	a,(de)
   9508 C6 FF         [ 7] 2335 	add	a,#0xFF
   950A 12            [ 7] 2336 	ld	(de),a
                           2337 ;src/main.c:586: cu.y--;
   950B C6 FF         [ 7] 2338 	add	a,#0xFF
   950D 12            [ 7] 2339 	ld	(de),a
                           2340 ;src/main.c:587: cu.mover = SI;
   950E 21 31 89      [10] 2341 	ld	hl,#(_cu + 0x0009)
   9511 36 01         [10] 2342 	ld	(hl),#0x01
   9513 C9            [10] 2343 	ret
   9514                    2344 00108$:
                           2345 ;src/main.c:590: cu.mover=NO;
   9514 21 31 89      [10] 2346 	ld	hl,#(_cu + 0x0009)
   9517 36 00         [10] 2347 	ld	(hl),#0x00
   9519 C9            [10] 2348 	ret
   951A                    2349 00111$:
                           2350 ;src/main.c:593: cu.mover=NO;
   951A 21 31 89      [10] 2351 	ld	hl,#(_cu + 0x0009)
   951D 36 00         [10] 2352 	ld	(hl),#0x00
   951F C9            [10] 2353 	ret
   9520                    2354 00122$:
                           2355 ;src/main.c:598: else if(cu.direccion == M_abajo){
   9520 7D            [ 4] 2356 	ld	a,l
   9521 D6 03         [ 7] 2357 	sub	a, #0x03
   9523 C0            [11] 2358 	ret	NZ
                           2359 ;src/main.c:599: if(*getTilePtr(cu.x, cu.y + G_KNIFEY_0_H + 2) <= 2){
   9524 1A            [ 7] 2360 	ld	a,(de)
   9525 C6 0A         [ 7] 2361 	add	a, #0x0A
   9527 F5            [11] 2362 	push	af
   9528 0A            [ 7] 2363 	ld	a,(bc)
   9529 47            [ 4] 2364 	ld	b,a
   952A F1            [10] 2365 	pop	af
   952B D5            [11] 2366 	push	de
   952C F5            [11] 2367 	push	af
   952D 33            [ 6] 2368 	inc	sp
   952E C5            [11] 2369 	push	bc
   952F 33            [ 6] 2370 	inc	sp
   9530 CD 40 8A      [17] 2371 	call	_getTilePtr
   9533 F1            [10] 2372 	pop	af
   9534 D1            [10] 2373 	pop	de
   9535 4E            [ 7] 2374 	ld	c,(hl)
   9536 3E 02         [ 7] 2375 	ld	a,#0x02
   9538 91            [ 4] 2376 	sub	a, c
   9539 38 1F         [12] 2377 	jr	C,00117$
                           2378 ;src/main.c:600: if(!checkKnifeCollision(M_abajo)){
   953B D5            [11] 2379 	push	de
   953C 21 03 00      [10] 2380 	ld	hl,#0x0003
   953F E5            [11] 2381 	push	hl
   9540 CD 76 93      [17] 2382 	call	_checkKnifeCollision
   9543 F1            [10] 2383 	pop	af
   9544 D1            [10] 2384 	pop	de
   9545 7D            [ 4] 2385 	ld	a,l
   9546 B7            [ 4] 2386 	or	a, a
   9547 20 0B         [12] 2387 	jr	NZ,00114$
                           2388 ;src/main.c:601: cu.y++;
   9549 1A            [ 7] 2389 	ld	a,(de)
   954A 3C            [ 4] 2390 	inc	a
   954B 12            [ 7] 2391 	ld	(de),a
                           2392 ;src/main.c:602: cu.y++;
   954C 3C            [ 4] 2393 	inc	a
   954D 12            [ 7] 2394 	ld	(de),a
                           2395 ;src/main.c:603: cu.mover = SI;
   954E 21 31 89      [10] 2396 	ld	hl,#(_cu + 0x0009)
   9551 36 01         [10] 2397 	ld	(hl),#0x01
   9553 C9            [10] 2398 	ret
   9554                    2399 00114$:
                           2400 ;src/main.c:606: cu.mover=NO;
   9554 21 31 89      [10] 2401 	ld	hl,#(_cu + 0x0009)
   9557 36 00         [10] 2402 	ld	(hl),#0x00
   9559 C9            [10] 2403 	ret
   955A                    2404 00117$:
                           2405 ;src/main.c:609: cu.mover=NO;
   955A 21 31 89      [10] 2406 	ld	hl,#(_cu + 0x0009)
   955D 36 00         [10] 2407 	ld	(hl),#0x00
   955F C9            [10] 2408 	ret
                           2409 ;src/main.c:614: void barraPuntuacionInicial(){
                           2410 ;	---------------------------------
                           2411 ; Function barraPuntuacionInicial
                           2412 ; ---------------------------------
   9560                    2413 _barraPuntuacionInicial::
                           2414 ;src/main.c:619: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   9560 21 00 02      [10] 2415 	ld	hl,#0x0200
   9563 E5            [11] 2416 	push	hl
   9564 26 C0         [ 7] 2417 	ld	h, #0xC0
   9566 E5            [11] 2418 	push	hl
   9567 CD 70 88      [17] 2419 	call	_cpct_getScreenPtr
   956A 4D            [ 4] 2420 	ld	c,l
   956B 44            [ 4] 2421 	ld	b,h
                           2422 ;src/main.c:620: cpct_drawStringM0("SCORE", memptr, 1, 0);
   956C 21 01 00      [10] 2423 	ld	hl,#0x0001
   956F E5            [11] 2424 	push	hl
   9570 C5            [11] 2425 	push	bc
   9571 21 08 96      [10] 2426 	ld	hl,#___str_1
   9574 E5            [11] 2427 	push	hl
   9575 CD 7B 7C      [17] 2428 	call	_cpct_drawStringM0
   9578 21 06 00      [10] 2429 	ld	hl,#6
   957B 39            [11] 2430 	add	hl,sp
   957C F9            [ 6] 2431 	ld	sp,hl
                           2432 ;src/main.c:621: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   957D 21 00 0E      [10] 2433 	ld	hl,#0x0E00
   9580 E5            [11] 2434 	push	hl
   9581 26 C0         [ 7] 2435 	ld	h, #0xC0
   9583 E5            [11] 2436 	push	hl
   9584 CD 70 88      [17] 2437 	call	_cpct_getScreenPtr
   9587 4D            [ 4] 2438 	ld	c,l
   9588 44            [ 4] 2439 	ld	b,h
                           2440 ;src/main.c:622: cpct_drawStringM0("00000", memptr, 15, 0);
   9589 21 0F 00      [10] 2441 	ld	hl,#0x000F
   958C E5            [11] 2442 	push	hl
   958D C5            [11] 2443 	push	bc
   958E 21 0E 96      [10] 2444 	ld	hl,#___str_2
   9591 E5            [11] 2445 	push	hl
   9592 CD 7B 7C      [17] 2446 	call	_cpct_drawStringM0
   9595 21 06 00      [10] 2447 	ld	hl,#6
   9598 39            [11] 2448 	add	hl,sp
   9599 F9            [ 6] 2449 	ld	sp,hl
                           2450 ;src/main.c:625: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 14);
   959A 21 1A 0E      [10] 2451 	ld	hl,#0x0E1A
   959D E5            [11] 2452 	push	hl
   959E 21 00 C0      [10] 2453 	ld	hl,#0xC000
   95A1 E5            [11] 2454 	push	hl
   95A2 CD 70 88      [17] 2455 	call	_cpct_getScreenPtr
   95A5 4D            [ 4] 2456 	ld	c,l
   95A6 44            [ 4] 2457 	ld	b,h
                           2458 ;src/main.c:626: cpct_drawStringM0("ROBOBIT", memptr, 3, 0);
   95A7 21 03 00      [10] 2459 	ld	hl,#0x0003
   95AA E5            [11] 2460 	push	hl
   95AB C5            [11] 2461 	push	bc
   95AC 21 14 96      [10] 2462 	ld	hl,#___str_3
   95AF E5            [11] 2463 	push	hl
   95B0 CD 7B 7C      [17] 2464 	call	_cpct_drawStringM0
   95B3 21 06 00      [10] 2465 	ld	hl,#6
   95B6 39            [11] 2466 	add	hl,sp
   95B7 F9            [ 6] 2467 	ld	sp,hl
                           2468 ;src/main.c:628: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   95B8 21 3C 02      [10] 2469 	ld	hl,#0x023C
   95BB E5            [11] 2470 	push	hl
   95BC 21 00 C0      [10] 2471 	ld	hl,#0xC000
   95BF E5            [11] 2472 	push	hl
   95C0 CD 70 88      [17] 2473 	call	_cpct_getScreenPtr
   95C3 4D            [ 4] 2474 	ld	c,l
   95C4 44            [ 4] 2475 	ld	b,h
                           2476 ;src/main.c:629: cpct_drawStringM0("LIVES", memptr, 1, 0);
   95C5 21 01 00      [10] 2477 	ld	hl,#0x0001
   95C8 E5            [11] 2478 	push	hl
   95C9 C5            [11] 2479 	push	bc
   95CA 21 1C 96      [10] 2480 	ld	hl,#___str_4
   95CD E5            [11] 2481 	push	hl
   95CE CD 7B 7C      [17] 2482 	call	_cpct_drawStringM0
   95D1 21 06 00      [10] 2483 	ld	hl,#6
   95D4 39            [11] 2484 	add	hl,sp
   95D5 F9            [ 6] 2485 	ld	sp,hl
                           2486 ;src/main.c:631: for(i=0; i<5; i++){
   95D6 01 00 00      [10] 2487 	ld	bc,#0x0000
   95D9                    2488 00102$:
                           2489 ;src/main.c:632: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   95D9 79            [ 4] 2490 	ld	a,c
   95DA 87            [ 4] 2491 	add	a, a
   95DB 87            [ 4] 2492 	add	a, a
   95DC C6 3C         [ 7] 2493 	add	a, #0x3C
   95DE 57            [ 4] 2494 	ld	d,a
   95DF C5            [11] 2495 	push	bc
   95E0 3E 0E         [ 7] 2496 	ld	a,#0x0E
   95E2 F5            [11] 2497 	push	af
   95E3 33            [ 6] 2498 	inc	sp
   95E4 D5            [11] 2499 	push	de
   95E5 33            [ 6] 2500 	inc	sp
   95E6 21 00 C0      [10] 2501 	ld	hl,#0xC000
   95E9 E5            [11] 2502 	push	hl
   95EA CD 70 88      [17] 2503 	call	_cpct_getScreenPtr
   95ED EB            [ 4] 2504 	ex	de,hl
   95EE 21 03 06      [10] 2505 	ld	hl,#0x0603
   95F1 E5            [11] 2506 	push	hl
   95F2 D5            [11] 2507 	push	de
   95F3 21 60 78      [10] 2508 	ld	hl,#_g_heart
   95F6 E5            [11] 2509 	push	hl
   95F7 CD 9F 7C      [17] 2510 	call	_cpct_drawSprite
   95FA C1            [10] 2511 	pop	bc
                           2512 ;src/main.c:631: for(i=0; i<5; i++){
   95FB 03            [ 6] 2513 	inc	bc
   95FC 79            [ 4] 2514 	ld	a,c
   95FD D6 05         [ 7] 2515 	sub	a, #0x05
   95FF 78            [ 4] 2516 	ld	a,b
   9600 17            [ 4] 2517 	rla
   9601 3F            [ 4] 2518 	ccf
   9602 1F            [ 4] 2519 	rra
   9603 DE 80         [ 7] 2520 	sbc	a, #0x80
   9605 38 D2         [12] 2521 	jr	C,00102$
   9607 C9            [10] 2522 	ret
   9608                    2523 ___str_1:
   9608 53 43 4F 52 45     2524 	.ascii "SCORE"
   960D 00                 2525 	.db 0x00
   960E                    2526 ___str_2:
   960E 30 30 30 30 30     2527 	.ascii "00000"
   9613 00                 2528 	.db 0x00
   9614                    2529 ___str_3:
   9614 52 4F 42 4F 42 49  2530 	.ascii "ROBOBIT"
        54
   961B 00                 2531 	.db 0x00
   961C                    2532 ___str_4:
   961C 4C 49 56 45 53     2533 	.ascii "LIVES"
   9621 00                 2534 	.db 0x00
                           2535 ;src/main.c:637: void borrarPantallaArriba(){
                           2536 ;	---------------------------------
                           2537 ; Function borrarPantallaArriba
                           2538 ; ---------------------------------
   9622                    2539 _borrarPantallaArriba::
                           2540 ;src/main.c:640: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 0); // posición para borrar la mitad derecha
   9622 21 00 00      [10] 2541 	ld	hl,#0x0000
   9625 E5            [11] 2542 	push	hl
   9626 26 C0         [ 7] 2543 	ld	h, #0xC0
   9628 E5            [11] 2544 	push	hl
   9629 CD 70 88      [17] 2545 	call	_cpct_getScreenPtr
   962C 4D            [ 4] 2546 	ld	c,l
   962D 44            [ 4] 2547 	ld	b,h
                           2548 ;src/main.c:641: cpct_drawSolidBox(memptr, 0, 40, 24);  //borra la mitad derecha
   962E 21 28 18      [10] 2549 	ld	hl,#0x1828
   9631 E5            [11] 2550 	push	hl
   9632 AF            [ 4] 2551 	xor	a, a
   9633 F5            [11] 2552 	push	af
   9634 33            [ 6] 2553 	inc	sp
   9635 C5            [11] 2554 	push	bc
   9636 CD 96 87      [17] 2555 	call	_cpct_drawSolidBox
   9639 F1            [10] 2556 	pop	af
                           2557 ;src/main.c:642: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 40, 0); // posición para borrar la mitad izquierda
   963A 33            [ 6] 2558 	inc	sp
   963B 21 28 00      [10] 2559 	ld	hl,#0x0028
   963E E3            [19] 2560 	ex	(sp),hl
   963F 21 00 C0      [10] 2561 	ld	hl,#0xC000
   9642 E5            [11] 2562 	push	hl
   9643 CD 70 88      [17] 2563 	call	_cpct_getScreenPtr
   9646 4D            [ 4] 2564 	ld	c,l
   9647 44            [ 4] 2565 	ld	b,h
                           2566 ;src/main.c:643: cpct_drawSolidBox(memptr, 0, 40, 24);  //borra la mitad izquierda
   9648 21 28 18      [10] 2567 	ld	hl,#0x1828
   964B E5            [11] 2568 	push	hl
   964C AF            [ 4] 2569 	xor	a, a
   964D F5            [11] 2570 	push	af
   964E 33            [ 6] 2571 	inc	sp
   964F C5            [11] 2572 	push	bc
   9650 CD 96 87      [17] 2573 	call	_cpct_drawSolidBox
   9653 F1            [10] 2574 	pop	af
   9654 F1            [10] 2575 	pop	af
   9655 33            [ 6] 2576 	inc	sp
   9656 C9            [10] 2577 	ret
                           2578 ;src/main.c:646: void menuInicio(){
                           2579 ;	---------------------------------
                           2580 ; Function menuInicio
                           2581 ; ---------------------------------
   9657                    2582 _menuInicio::
                           2583 ;src/main.c:650: cpct_clearScreen(0);
   9657 21 00 40      [10] 2584 	ld	hl,#0x4000
   965A E5            [11] 2585 	push	hl
   965B AF            [ 4] 2586 	xor	a, a
   965C F5            [11] 2587 	push	af
   965D 33            [ 6] 2588 	inc	sp
   965E 26 C0         [ 7] 2589 	ld	h, #0xC0
   9660 E5            [11] 2590 	push	hl
   9661 CD 2A 7F      [17] 2591 	call	_cpct_memset
                           2592 ;src/main.c:652: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   9664 21 1A 0F      [10] 2593 	ld	hl,#0x0F1A
   9667 E5            [11] 2594 	push	hl
   9668 21 00 C0      [10] 2595 	ld	hl,#0xC000
   966B E5            [11] 2596 	push	hl
   966C CD 70 88      [17] 2597 	call	_cpct_getScreenPtr
   966F 4D            [ 4] 2598 	ld	c,l
   9670 44            [ 4] 2599 	ld	b,h
                           2600 ;src/main.c:653: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   9671 21 04 00      [10] 2601 	ld	hl,#0x0004
   9674 E5            [11] 2602 	push	hl
   9675 C5            [11] 2603 	push	bc
   9676 21 0A 97      [10] 2604 	ld	hl,#___str_5
   9679 E5            [11] 2605 	push	hl
   967A CD 7B 7C      [17] 2606 	call	_cpct_drawStringM0
   967D 21 06 00      [10] 2607 	ld	hl,#6
   9680 39            [11] 2608 	add	hl,sp
   9681 F9            [ 6] 2609 	ld	sp,hl
                           2610 ;src/main.c:655: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   9682 21 28 6E      [10] 2611 	ld	hl,#0x6E28
   9685 E5            [11] 2612 	push	hl
   9686 21 F0 F0      [10] 2613 	ld	hl,#0xF0F0
   9689 E5            [11] 2614 	push	hl
   968A 21 00 56      [10] 2615 	ld	hl,#_g_text_0
   968D E5            [11] 2616 	push	hl
   968E CD 9F 7C      [17] 2617 	call	_cpct_drawSprite
                           2618 ;src/main.c:656: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   9691 21 28 6E      [10] 2619 	ld	hl,#0x6E28
   9694 E5            [11] 2620 	push	hl
   9695 21 18 F1      [10] 2621 	ld	hl,#0xF118
   9698 E5            [11] 2622 	push	hl
   9699 21 30 67      [10] 2623 	ld	hl,#_g_text_1
   969C E5            [11] 2624 	push	hl
   969D CD 9F 7C      [17] 2625 	call	_cpct_drawSprite
                           2626 ;src/main.c:679: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   96A0 21 08 A0      [10] 2627 	ld	hl,#0xA008
   96A3 E5            [11] 2628 	push	hl
   96A4 21 00 C0      [10] 2629 	ld	hl,#0xC000
   96A7 E5            [11] 2630 	push	hl
   96A8 CD 70 88      [17] 2631 	call	_cpct_getScreenPtr
   96AB 4D            [ 4] 2632 	ld	c,l
   96AC 44            [ 4] 2633 	ld	b,h
                           2634 ;src/main.c:680: cpct_drawStringM0("TO START PRESS S", memptr, 4, 0);
   96AD 21 04 00      [10] 2635 	ld	hl,#0x0004
   96B0 E5            [11] 2636 	push	hl
   96B1 C5            [11] 2637 	push	bc
   96B2 21 12 97      [10] 2638 	ld	hl,#___str_6
   96B5 E5            [11] 2639 	push	hl
   96B6 CD 7B 7C      [17] 2640 	call	_cpct_drawStringM0
   96B9 21 06 00      [10] 2641 	ld	hl,#6
   96BC 39            [11] 2642 	add	hl,sp
   96BD F9            [ 6] 2643 	ld	sp,hl
                           2644 ;src/main.c:682: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 170); // centrado en horizontal y abajo en vertical
   96BE 21 0A AA      [10] 2645 	ld	hl,#0xAA0A
   96C1 E5            [11] 2646 	push	hl
   96C2 21 00 C0      [10] 2647 	ld	hl,#0xC000
   96C5 E5            [11] 2648 	push	hl
   96C6 CD 70 88      [17] 2649 	call	_cpct_getScreenPtr
   96C9 4D            [ 4] 2650 	ld	c,l
   96CA 44            [ 4] 2651 	ld	b,h
                           2652 ;src/main.c:683: cpct_drawStringM0("TO MENU PRESS M", memptr, 4, 0);
   96CB 21 04 00      [10] 2653 	ld	hl,#0x0004
   96CE E5            [11] 2654 	push	hl
   96CF C5            [11] 2655 	push	bc
   96D0 21 23 97      [10] 2656 	ld	hl,#___str_7
   96D3 E5            [11] 2657 	push	hl
   96D4 CD 7B 7C      [17] 2658 	call	_cpct_drawStringM0
   96D7 21 06 00      [10] 2659 	ld	hl,#6
   96DA 39            [11] 2660 	add	hl,sp
   96DB F9            [ 6] 2661 	ld	sp,hl
                           2662 ;src/main.c:686: do{
   96DC                    2663 00106$:
                           2664 ;src/main.c:687: cpct_scanKeyboard_f();
   96DC CD 05 7C      [17] 2665 	call	_cpct_scanKeyboard_f
                           2666 ;src/main.c:690: else */if(cpct_isKeyPressed(Key_M)){
   96DF 21 04 40      [10] 2667 	ld	hl,#0x4004
   96E2 CD F9 7B      [17] 2668 	call	_cpct_isKeyPressed
   96E5 7D            [ 4] 2669 	ld	a,l
   96E6 B7            [ 4] 2670 	or	a, a
   96E7 28 0D         [12] 2671 	jr	Z,00107$
                           2672 ;src/main.c:691: cpct_scanKeyboard_f();
   96E9 CD 05 7C      [17] 2673 	call	_cpct_scanKeyboard_f
                           2674 ;src/main.c:692: do{
   96EC                    2675 00101$:
                           2676 ;src/main.c:694: } while(!cpct_isKeyPressed(Key_S));
   96EC 21 07 10      [10] 2677 	ld	hl,#0x1007
   96EF CD F9 7B      [17] 2678 	call	_cpct_isKeyPressed
   96F2 7D            [ 4] 2679 	ld	a,l
   96F3 B7            [ 4] 2680 	or	a, a
   96F4 28 F6         [12] 2681 	jr	Z,00101$
   96F6                    2682 00107$:
                           2683 ;src/main.c:696: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   96F6 21 07 10      [10] 2684 	ld	hl,#0x1007
   96F9 CD F9 7B      [17] 2685 	call	_cpct_isKeyPressed
   96FC 7D            [ 4] 2686 	ld	a,l
   96FD B7            [ 4] 2687 	or	a, a
   96FE C0            [11] 2688 	ret	NZ
   96FF 21 04 40      [10] 2689 	ld	hl,#0x4004
   9702 CD F9 7B      [17] 2690 	call	_cpct_isKeyPressed
   9705 7D            [ 4] 2691 	ld	a,l
   9706 B7            [ 4] 2692 	or	a, a
   9707 28 D3         [12] 2693 	jr	Z,00106$
   9709 C9            [10] 2694 	ret
   970A                    2695 ___str_5:
   970A 52 4F 42 4F 42 49  2696 	.ascii "ROBOBIT"
        54
   9711 00                 2697 	.db 0x00
   9712                    2698 ___str_6:
   9712 54 4F 20 53 54 41  2699 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   9722 00                 2700 	.db 0x00
   9723                    2701 ___str_7:
   9723 54 4F 20 4D 45 4E  2702 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   9732 00                 2703 	.db 0x00
                           2704 ;src/main.c:699: void inicializarCPC() {
                           2705 ;	---------------------------------
                           2706 ; Function inicializarCPC
                           2707 ; ---------------------------------
   9733                    2708 _inicializarCPC::
                           2709 ;src/main.c:700: cpct_disableFirmware();
   9733 CD 61 87      [17] 2710 	call	_cpct_disableFirmware
                           2711 ;src/main.c:701: cpct_setVideoMode(0);
   9736 2E 00         [ 7] 2712 	ld	l,#0x00
   9738 CD 0C 7F      [17] 2713 	call	_cpct_setVideoMode
                           2714 ;src/main.c:702: cpct_setBorder(HW_BLACK);
   973B 21 10 14      [10] 2715 	ld	hl,#0x1410
   973E E5            [11] 2716 	push	hl
   973F CD 6F 7C      [17] 2717 	call	_cpct_setPALColour
                           2718 ;src/main.c:703: cpct_setPalette(g_palette, 16);
   9742 21 10 00      [10] 2719 	ld	hl,#0x0010
   9745 E5            [11] 2720 	push	hl
   9746 21 98 7A      [10] 2721 	ld	hl,#_g_palette
   9749 E5            [11] 2722 	push	hl
   974A CD E2 7B      [17] 2723 	call	_cpct_setPalette
                           2724 ;src/main.c:704: cpct_akp_musicInit(G_song);
   974D 21 00 3F      [10] 2725 	ld	hl,#_G_song
   9750 E5            [11] 2726 	push	hl
   9751 CD 3D 86      [17] 2727 	call	_cpct_akp_musicInit
   9754 F1            [10] 2728 	pop	af
   9755 C9            [10] 2729 	ret
                           2730 ;src/main.c:707: void inicializarEnemy() {
                           2731 ;	---------------------------------
                           2732 ; Function inicializarEnemy
                           2733 ; ---------------------------------
   9756                    2734 _inicializarEnemy::
   9756 DD E5         [15] 2735 	push	ix
   9758 DD 21 00 00   [14] 2736 	ld	ix,#0
   975C DD 39         [15] 2737 	add	ix,sp
   975E 3B            [ 6] 2738 	dec	sp
                           2739 ;src/main.c:713: actual = enemy;
   975F 01 F4 88      [10] 2740 	ld	bc,#_enemy+0
                           2741 ;src/main.c:714: while(--i){
   9762 DD 36 FF 05   [19] 2742 	ld	-1 (ix),#0x05
   9766                    2743 00101$:
   9766 DD 35 FF      [23] 2744 	dec	-1 (ix)
   9769 DD 7E FF      [19] 2745 	ld	a,-1 (ix)
   976C B7            [ 4] 2746 	or	a, a
   976D 28 5C         [12] 2747 	jr	Z,00104$
                           2748 ;src/main.c:715: actual->x = actual->px = spawnX[i];
   976F 59            [ 4] 2749 	ld	e, c
   9770 50            [ 4] 2750 	ld	d, b
   9771 13            [ 6] 2751 	inc	de
   9772 13            [ 6] 2752 	inc	de
   9773 3E 51         [ 7] 2753 	ld	a,#<(_spawnX)
   9775 DD 86 FF      [19] 2754 	add	a, -1 (ix)
   9778 6F            [ 4] 2755 	ld	l,a
   9779 3E 89         [ 7] 2756 	ld	a,#>(_spawnX)
   977B CE 00         [ 7] 2757 	adc	a, #0x00
   977D 67            [ 4] 2758 	ld	h,a
   977E 7E            [ 7] 2759 	ld	a,(hl)
   977F 12            [ 7] 2760 	ld	(de),a
   9780 02            [ 7] 2761 	ld	(bc),a
                           2762 ;src/main.c:716: actual->y = actual->py = spawnY[i];
   9781 C5            [11] 2763 	push	bc
   9782 FD E1         [14] 2764 	pop	iy
   9784 FD 23         [10] 2765 	inc	iy
   9786 59            [ 4] 2766 	ld	e, c
   9787 50            [ 4] 2767 	ld	d, b
   9788 13            [ 6] 2768 	inc	de
   9789 13            [ 6] 2769 	inc	de
   978A 13            [ 6] 2770 	inc	de
   978B 3E 56         [ 7] 2771 	ld	a,#<(_spawnY)
   978D DD 86 FF      [19] 2772 	add	a, -1 (ix)
   9790 6F            [ 4] 2773 	ld	l,a
   9791 3E 89         [ 7] 2774 	ld	a,#>(_spawnY)
   9793 CE 00         [ 7] 2775 	adc	a, #0x00
   9795 67            [ 4] 2776 	ld	h,a
   9796 7E            [ 7] 2777 	ld	a,(hl)
   9797 12            [ 7] 2778 	ld	(de),a
   9798 FD 77 00      [19] 2779 	ld	0 (iy), a
                           2780 ;src/main.c:717: actual->mover  = NO;
   979B 21 06 00      [10] 2781 	ld	hl,#0x0006
   979E 09            [11] 2782 	add	hl,bc
   979F 36 00         [10] 2783 	ld	(hl),#0x00
                           2784 ;src/main.c:718: actual->mira   = M_abajo;
   97A1 21 07 00      [10] 2785 	ld	hl,#0x0007
   97A4 09            [11] 2786 	add	hl,bc
   97A5 36 03         [10] 2787 	ld	(hl),#0x03
                           2788 ;src/main.c:719: actual->sprite = g_enemy;
   97A7 21 04 00      [10] 2789 	ld	hl,#0x0004
   97AA 09            [11] 2790 	add	hl,bc
   97AB 36 72         [10] 2791 	ld	(hl),#<(_g_enemy)
   97AD 23            [ 6] 2792 	inc	hl
   97AE 36 78         [10] 2793 	ld	(hl),#>(_g_enemy)
                           2794 ;src/main.c:720: actual->muerto = NO;
   97B0 21 08 00      [10] 2795 	ld	hl,#0x0008
   97B3 09            [11] 2796 	add	hl,bc
   97B4 36 00         [10] 2797 	ld	(hl),#0x00
                           2798 ;src/main.c:721: actual->patrol = SI;
   97B6 21 09 00      [10] 2799 	ld	hl,#0x0009
   97B9 09            [11] 2800 	add	hl,bc
   97BA 36 01         [10] 2801 	ld	(hl),#0x01
                           2802 ;src/main.c:722: dibujarEnemigo(actual);
   97BC C5            [11] 2803 	push	bc
   97BD C5            [11] 2804 	push	bc
   97BE CD D6 8B      [17] 2805 	call	_dibujarEnemigo
   97C1 F1            [10] 2806 	pop	af
   97C2 C1            [10] 2807 	pop	bc
                           2808 ;src/main.c:724: actual++;
   97C3 21 0B 00      [10] 2809 	ld	hl,#0x000B
   97C6 09            [11] 2810 	add	hl,bc
   97C7 4D            [ 4] 2811 	ld	c,l
   97C8 44            [ 4] 2812 	ld	b,h
   97C9 18 9B         [12] 2813 	jr	00101$
   97CB                    2814 00104$:
   97CB 33            [ 6] 2815 	inc	sp
   97CC DD E1         [14] 2816 	pop	ix
   97CE C9            [10] 2817 	ret
                           2818 ;src/main.c:728: void inicializarJuego() {
                           2819 ;	---------------------------------
                           2820 ; Function inicializarJuego
                           2821 ; ---------------------------------
   97CF                    2822 _inicializarJuego::
                           2823 ;src/main.c:732: actual = enemy;
                           2824 ;src/main.c:735: num_mapa = 0;
   97CF 21 34 89      [10] 2825 	ld	hl,#_num_mapa + 0
   97D2 36 00         [10] 2826 	ld	(hl), #0x00
                           2827 ;src/main.c:736: mapa = mapas[num_mapa];
   97D4 21 4B 89      [10] 2828 	ld	hl, #_mapas + 0
   97D7 7E            [ 7] 2829 	ld	a,(hl)
   97D8 FD 21 32 89   [14] 2830 	ld	iy,#_mapa
   97DC FD 77 00      [19] 2831 	ld	0 (iy),a
   97DF 23            [ 6] 2832 	inc	hl
   97E0 7E            [ 7] 2833 	ld	a,(hl)
   97E1 32 33 89      [13] 2834 	ld	(#_mapa + 1),a
                           2835 ;src/main.c:737: cpct_etm_setTileset2x4(g_tileset);
   97E4 21 E0 54      [10] 2836 	ld	hl,#_g_tileset
   97E7 CD D3 7D      [17] 2837 	call	_cpct_etm_setTileset2x4
                           2838 ;src/main.c:739: dibujarMapa();
   97EA CD 35 89      [17] 2839 	call	_dibujarMapa
                           2840 ;src/main.c:741: borrarPantallaArriba();
   97ED CD 22 96      [17] 2841 	call	_borrarPantallaArriba
                           2842 ;src/main.c:742: barraPuntuacionInicial();
   97F0 CD 60 95      [17] 2843 	call	_barraPuntuacionInicial
                           2844 ;src/main.c:745: prota.x = prota.px = 4;
   97F3 21 22 89      [10] 2845 	ld	hl,#(_prota + 0x0002)
   97F6 36 04         [10] 2846 	ld	(hl),#0x04
   97F8 21 20 89      [10] 2847 	ld	hl,#_prota
   97FB 36 04         [10] 2848 	ld	(hl),#0x04
                           2849 ;src/main.c:746: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   97FD 21 23 89      [10] 2850 	ld	hl,#(_prota + 0x0003)
   9800 36 68         [10] 2851 	ld	(hl),#0x68
   9802 21 21 89      [10] 2852 	ld	hl,#(_prota + 0x0001)
   9805 36 68         [10] 2853 	ld	(hl),#0x68
                           2854 ;src/main.c:747: prota.mover  = NO;
   9807 21 26 89      [10] 2855 	ld	hl,#(_prota + 0x0006)
   980A 36 00         [10] 2856 	ld	(hl),#0x00
                           2857 ;src/main.c:748: prota.mira=M_derecha;
   980C 21 27 89      [10] 2858 	ld	hl,#(_prota + 0x0007)
   980F 36 00         [10] 2859 	ld	(hl),#0x00
                           2860 ;src/main.c:749: prota.sprite = g_hero;
   9811 21 A8 7A      [10] 2861 	ld	hl,#_g_hero
   9814 22 24 89      [16] 2862 	ld	((_prota + 0x0004)), hl
                           2863 ;src/main.c:753: cu.x = cu.px = 0;
   9817 21 2A 89      [10] 2864 	ld	hl,#(_cu + 0x0002)
   981A 36 00         [10] 2865 	ld	(hl),#0x00
   981C 21 28 89      [10] 2866 	ld	hl,#_cu
   981F 36 00         [10] 2867 	ld	(hl),#0x00
                           2868 ;src/main.c:754: cu.y = cu.py = 0;
   9821 21 2B 89      [10] 2869 	ld	hl,#(_cu + 0x0003)
   9824 36 00         [10] 2870 	ld	(hl),#0x00
   9826 21 29 89      [10] 2871 	ld	hl,#(_cu + 0x0001)
   9829 36 00         [10] 2872 	ld	(hl),#0x00
                           2873 ;src/main.c:755: cu.lanzado = NO;
   982B 21 2E 89      [10] 2874 	ld	hl,#(_cu + 0x0006)
   982E 36 00         [10] 2875 	ld	(hl),#0x00
                           2876 ;src/main.c:756: cu.mover = NO;
   9830 21 31 89      [10] 2877 	ld	hl,#(_cu + 0x0009)
   9833 36 00         [10] 2878 	ld	(hl),#0x00
                           2879 ;src/main.c:758: inicializarEnemy();
   9835 CD 56 97      [17] 2880 	call	_inicializarEnemy
                           2881 ;src/main.c:760: dibujarProta();
   9838 CD 5B 89      [17] 2882 	call	_dibujarProta
                           2883 ;src/main.c:761: dibujarEnemigo(actual);
   983B 21 F4 88      [10] 2884 	ld	hl,#_enemy
   983E E5            [11] 2885 	push	hl
   983F CD D6 8B      [17] 2886 	call	_dibujarEnemigo
   9842 F1            [10] 2887 	pop	af
   9843 C9            [10] 2888 	ret
                           2889 ;src/main.c:764: void main(void) {
                           2890 ;	---------------------------------
                           2891 ; Function main
                           2892 ; ---------------------------------
   9844                    2893 _main::
   9844 DD E5         [15] 2894 	push	ix
   9846 DD 21 00 00   [14] 2895 	ld	ix,#0
   984A DD 39         [15] 2896 	add	ix,sp
   984C 3B            [ 6] 2897 	dec	sp
                           2898 ;src/main.c:768: inicializarCPC();
   984D CD 33 97      [17] 2899 	call	_inicializarCPC
                           2900 ;src/main.c:769: menuInicio();
   9850 CD 57 96      [17] 2901 	call	_menuInicio
                           2902 ;src/main.c:773: inicializarJuego();
   9853 CD CF 97      [17] 2903 	call	_inicializarJuego
                           2904 ;src/main.c:778: cpct_akp_musicPlay();
   9856 CD 3A 7F      [17] 2905 	call	_cpct_akp_musicPlay
                           2906 ;src/main.c:781: actual = enemy;
                           2907 ;src/main.c:783: while (1) {
   9859                    2908 00115$:
                           2909 ;src/main.c:785: cpct_waitVSYNC();
   9859 CD 04 7F      [17] 2910 	call	_cpct_waitVSYNC
                           2911 ;src/main.c:786: comprobarTeclado();
   985C CD 35 93      [17] 2912 	call	_comprobarTeclado
                           2913 ;src/main.c:787: moverCuchillo();
   985F CD 74 94      [17] 2914 	call	_moverCuchillo
                           2915 ;src/main.c:791: cpct_waitVSYNC();
   9862 CD 04 7F      [17] 2916 	call	_cpct_waitVSYNC
                           2917 ;src/main.c:793: if (prota.mover) {
   9865 01 26 89      [10] 2918 	ld	bc,#_prota+6
   9868 0A            [ 7] 2919 	ld	a,(bc)
   9869 B7            [ 4] 2920 	or	a, a
   986A 28 07         [12] 2921 	jr	Z,00102$
                           2922 ;src/main.c:794: redibujarProta();
   986C C5            [11] 2923 	push	bc
   986D CD 2C 8A      [17] 2924 	call	_redibujarProta
   9870 C1            [10] 2925 	pop	bc
                           2926 ;src/main.c:795: prota.mover = NO;
   9871 AF            [ 4] 2927 	xor	a, a
   9872 02            [ 7] 2928 	ld	(bc),a
   9873                    2929 00102$:
                           2930 ;src/main.c:797: if(cu.lanzado && cu.mover){
   9873 21 2E 89      [10] 2931 	ld	hl,#_cu + 6
   9876 4E            [ 7] 2932 	ld	c,(hl)
   9877 11 31 89      [10] 2933 	ld	de,#_cu + 9
   987A 79            [ 4] 2934 	ld	a,c
   987B B7            [ 4] 2935 	or	a, a
   987C 28 09         [12] 2936 	jr	Z,00107$
   987E 1A            [ 7] 2937 	ld	a,(de)
   987F B7            [ 4] 2938 	or	a, a
   9880 28 05         [12] 2939 	jr	Z,00107$
                           2940 ;src/main.c:798: redibujarCuchillo();
   9882 CD 05 92      [17] 2941 	call	_redibujarCuchillo
   9885 18 0B         [12] 2942 	jr	00108$
   9887                    2943 00107$:
                           2944 ;src/main.c:799: }else if (cu.lanzado && !cu.mover){
   9887 79            [ 4] 2945 	ld	a,c
   9888 B7            [ 4] 2946 	or	a, a
   9889 28 07         [12] 2947 	jr	Z,00108$
   988B 1A            [ 7] 2948 	ld	a,(de)
   988C B7            [ 4] 2949 	or	a, a
   988D 20 03         [12] 2950 	jr	NZ,00108$
                           2951 ;src/main.c:800: borrarCuchillo();
   988F CD 87 91      [17] 2952 	call	_borrarCuchillo
   9892                    2953 00108$:
                           2954 ;src/main.c:803: if(enemy->mover){
   9892 3A FA 88      [13] 2955 	ld	a, (#_enemy + 6)
   9895 B7            [ 4] 2956 	or	a, a
   9896 28 08         [12] 2957 	jr	Z,00111$
                           2958 ;src/main.c:804: redibujarEnemigo(actual);
   9898 21 F4 88      [10] 2959 	ld	hl,#_enemy
   989B E5            [11] 2960 	push	hl
   989C CD 3C 8D      [17] 2961 	call	_redibujarEnemigo
   989F F1            [10] 2962 	pop	af
   98A0                    2963 00111$:
                           2964 ;src/main.c:806: if (enemy->muerto){
   98A0 3A FC 88      [13] 2965 	ld	a,(#_enemy + 8)
   98A3 DD 77 FF      [19] 2966 	ld	-1 (ix), a
   98A6 B7            [ 4] 2967 	or	a, a
   98A7 28 B0         [12] 2968 	jr	Z,00115$
                           2969 ;src/main.c:807: borrarEnemigo(actual);
   98A9 21 F4 88      [10] 2970 	ld	hl,#_enemy
   98AC E5            [11] 2971 	push	hl
   98AD CD A8 8C      [17] 2972 	call	_borrarEnemigo
   98B0 F1            [10] 2973 	pop	af
                           2974 ;src/main.c:808: dibujarExplosion();
   98B1 CD 0E 8C      [17] 2975 	call	_dibujarExplosion
                           2976 ;src/main.c:809: borrarExplosion();
   98B4 CD 34 8C      [17] 2977 	call	_borrarExplosion
   98B7 18 A0         [12] 2978 	jr	00115$
   98B9 33            [ 6] 2979 	inc	sp
   98BA DD E1         [14] 2980 	pop	ix
   98BC C9            [10] 2981 	ret
                           2982 	.area _CODE
                           2983 	.area _INITIALIZER
                           2984 	.area _CABS (ABS)
   3F00                    2985 	.org 0x3F00
   3F00                    2986 _G_song:
   3F00 41                 2987 	.db #0x41	; 65	'A'
   3F01 54                 2988 	.db #0x54	; 84	'T'
   3F02 31                 2989 	.db #0x31	; 49	'1'
   3F03 30                 2990 	.db #0x30	; 48	'0'
   3F04 01                 2991 	.db #0x01	; 1
   3F05 40                 2992 	.db #0x40	; 64
   3F06 42                 2993 	.db #0x42	; 66	'B'
   3F07 0F                 2994 	.db #0x0F	; 15
   3F08 02                 2995 	.db #0x02	; 2
   3F09 06                 2996 	.db #0x06	; 6
   3F0A 1D                 2997 	.db #0x1D	; 29
   3F0B 00                 2998 	.db #0x00	; 0
   3F0C 10                 2999 	.db #0x10	; 16
   3F0D 40                 3000 	.db #0x40	; 64
   3F0E 19                 3001 	.db #0x19	; 25
   3F0F 40                 3002 	.db #0x40	; 64
   3F10 00                 3003 	.db #0x00	; 0
   3F11 00                 3004 	.db #0x00	; 0
   3F12 00                 3005 	.db #0x00	; 0
   3F13 00                 3006 	.db #0x00	; 0
   3F14 00                 3007 	.db #0x00	; 0
   3F15 00                 3008 	.db #0x00	; 0
   3F16 0D                 3009 	.db #0x0D	; 13
   3F17 12                 3010 	.db #0x12	; 18
   3F18 40                 3011 	.db #0x40	; 64
   3F19 01                 3012 	.db #0x01	; 1
   3F1A 00                 3013 	.db #0x00	; 0
   3F1B 7C                 3014 	.db #0x7C	; 124
   3F1C 18                 3015 	.db #0x18	; 24
   3F1D 78                 3016 	.db #0x78	; 120	'x'
   3F1E 0C                 3017 	.db #0x0C	; 12
   3F1F 34                 3018 	.db #0x34	; 52	'4'
   3F20 30                 3019 	.db #0x30	; 48	'0'
   3F21 2C                 3020 	.db #0x2C	; 44
   3F22 28                 3021 	.db #0x28	; 40
   3F23 24                 3022 	.db #0x24	; 36
   3F24 20                 3023 	.db #0x20	; 32
   3F25 1C                 3024 	.db #0x1C	; 28
   3F26 0D                 3025 	.db #0x0D	; 13
   3F27 25                 3026 	.db #0x25	; 37
   3F28 40                 3027 	.db #0x40	; 64
   3F29 20                 3028 	.db #0x20	; 32
   3F2A 00                 3029 	.db #0x00	; 0
   3F2B 00                 3030 	.db #0x00	; 0
   3F2C 00                 3031 	.db #0x00	; 0
   3F2D 39                 3032 	.db #0x39	; 57	'9'
   3F2E 40                 3033 	.db #0x40	; 64
   3F2F 00                 3034 	.db #0x00	; 0
   3F30 57                 3035 	.db #0x57	; 87	'W'
   3F31 40                 3036 	.db #0x40	; 64
   3F32 3B                 3037 	.db #0x3B	; 59
   3F33 40                 3038 	.db #0x40	; 64
   3F34 57                 3039 	.db #0x57	; 87	'W'
   3F35 40                 3040 	.db #0x40	; 64
   3F36 01                 3041 	.db #0x01	; 1
   3F37 2F                 3042 	.db #0x2F	; 47
   3F38 40                 3043 	.db #0x40	; 64
   3F39 19                 3044 	.db #0x19	; 25
   3F3A 00                 3045 	.db #0x00	; 0
   3F3B 76                 3046 	.db #0x76	; 118	'v'
   3F3C E1                 3047 	.db #0xE1	; 225
   3F3D 00                 3048 	.db #0x00	; 0
   3F3E 00                 3049 	.db #0x00	; 0
   3F3F 01                 3050 	.db #0x01	; 1
   3F40 04                 3051 	.db #0x04	; 4
   3F41 51                 3052 	.db #0x51	; 81	'Q'
   3F42 04                 3053 	.db #0x04	; 4
   3F43 37                 3054 	.db #0x37	; 55	'7'
   3F44 04                 3055 	.db #0x04	; 4
   3F45 4F                 3056 	.db #0x4F	; 79	'O'
   3F46 04                 3057 	.db #0x04	; 4
   3F47 37                 3058 	.db #0x37	; 55	'7'
   3F48 02                 3059 	.db #0x02	; 2
   3F49 4B                 3060 	.db #0x4B	; 75	'K'
   3F4A 02                 3061 	.db #0x02	; 2
   3F4B 37                 3062 	.db #0x37	; 55	'7'
   3F4C 04                 3063 	.db #0x04	; 4
   3F4D 4F                 3064 	.db #0x4F	; 79	'O'
   3F4E 04                 3065 	.db #0x04	; 4
   3F4F 37                 3066 	.db #0x37	; 55	'7'
   3F50 04                 3067 	.db #0x04	; 4
   3F51 4F                 3068 	.db #0x4F	; 79	'O'
   3F52 04                 3069 	.db #0x04	; 4
   3F53 37                 3070 	.db #0x37	; 55	'7'
   3F54 02                 3071 	.db #0x02	; 2
   3F55 4B                 3072 	.db #0x4B	; 75	'K'
   3F56 00                 3073 	.db #0x00	; 0
   3F57 42                 3074 	.db #0x42	; 66	'B'
   3F58 60                 3075 	.db #0x60	; 96
   3F59 00                 3076 	.db #0x00	; 0
   3F5A 42                 3077 	.db #0x42	; 66	'B'
   3F5B 80                 3078 	.db #0x80	; 128
   3F5C 00                 3079 	.db #0x00	; 0
   3F5D 00                 3080 	.db #0x00	; 0
   3F5E 42                 3081 	.db #0x42	; 66	'B'
   3F5F 00                 3082 	.db #0x00	; 0
   3F60 00                 3083 	.db #0x00	; 0
