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
                             17 	.globl _borrarPantallaAbajo
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
   7B92                     127 _dummy_cpct_transparentMaskTable0M0_container::
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
   8939 21 00 C0      [10]  172 	ld	hl,#0xC000
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
   8956 00                  194 	.db #0x00	; 0
   8957 14                  195 	.db #0x14	; 20
   8958 5A                  196 	.db #0x5A	; 90	'Z'
   8959 72                  197 	.db #0x72	; 114	'r'
   895A 72                  198 	.db #0x72	; 114	'r'
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
   8989 3B            [ 6]  235 	dec	sp
                            236 ;src/main.c:135: u8 w = 4 + (prota.px & 1);
   898A 21 22 89      [10]  237 	ld	hl, #_prota + 2
   898D 4E            [ 7]  238 	ld	c,(hl)
   898E 79            [ 4]  239 	ld	a,c
   898F E6 01         [ 7]  240 	and	a, #0x01
   8991 47            [ 4]  241 	ld	b,a
   8992 04            [ 4]  242 	inc	b
   8993 04            [ 4]  243 	inc	b
   8994 04            [ 4]  244 	inc	b
   8995 04            [ 4]  245 	inc	b
                            246 ;src/main.c:138: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   8996 21 23 89      [10]  247 	ld	hl, #_prota + 3
   8999 5E            [ 7]  248 	ld	e,(hl)
   899A CB 4B         [ 8]  249 	bit	1, e
   899C 28 04         [12]  250 	jr	Z,00103$
   899E 3E 01         [ 7]  251 	ld	a,#0x01
   89A0 18 02         [12]  252 	jr	00104$
   89A2                     253 00103$:
   89A2 3E 00         [ 7]  254 	ld	a,#0x00
   89A4                     255 00104$:
   89A4 C6 06         [ 7]  256 	add	a, #0x06
   89A6 DD 77 FF      [19]  257 	ld	-1 (ix),a
                            258 ;src/main.c:140: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   89A9 FD 2A 32 89   [20]  259 	ld	iy,(_mapa)
   89AD 16 00         [ 7]  260 	ld	d,#0x00
   89AF 63            [ 4]  261 	ld	h,e
   89B0 6A            [ 4]  262 	ld	l,d
   89B1 CB 7A         [ 8]  263 	bit	7, d
   89B3 28 05         [12]  264 	jr	Z,00105$
   89B5 13            [ 6]  265 	inc	de
   89B6 13            [ 6]  266 	inc	de
   89B7 13            [ 6]  267 	inc	de
   89B8 63            [ 4]  268 	ld	h,e
   89B9 6A            [ 4]  269 	ld	l,d
   89BA                     270 00105$:
   89BA 5C            [ 4]  271 	ld	e, h
   89BB 55            [ 4]  272 	ld	d, l
   89BC CB 2A         [ 8]  273 	sra	d
   89BE CB 1B         [ 8]  274 	rr	e
   89C0 CB 2A         [ 8]  275 	sra	d
   89C2 CB 1B         [ 8]  276 	rr	e
   89C4 51            [ 4]  277 	ld	d,c
   89C5 CB 3A         [ 8]  278 	srl	d
   89C7 FD E5         [15]  279 	push	iy
   89C9 21 00 C0      [10]  280 	ld	hl,#0xC000
   89CC E5            [11]  281 	push	hl
   89CD 3E 28         [ 7]  282 	ld	a,#0x28
   89CF F5            [11]  283 	push	af
   89D0 33            [ 6]  284 	inc	sp
   89D1 DD 7E FF      [19]  285 	ld	a,-1 (ix)
   89D4 F5            [11]  286 	push	af
   89D5 33            [ 6]  287 	inc	sp
   89D6 C5            [11]  288 	push	bc
   89D7 33            [ 6]  289 	inc	sp
   89D8 7B            [ 4]  290 	ld	a,e
   89D9 F5            [11]  291 	push	af
   89DA 33            [ 6]  292 	inc	sp
   89DB D5            [11]  293 	push	de
   89DC 33            [ 6]  294 	inc	sp
   89DD CD 44 7D      [17]  295 	call	_cpct_etm_drawTileBox2x4
   89E0 33            [ 6]  296 	inc	sp
   89E1 DD E1         [14]  297 	pop	ix
   89E3 C9            [10]  298 	ret
                            299 ;src/main.c:143: void menuFin(){
                            300 ;	---------------------------------
                            301 ; Function menuFin
                            302 ; ---------------------------------
   89E4                     303 _menuFin::
                            304 ;src/main.c:146: cpct_clearScreen(0);
   89E4 21 00 40      [10]  305 	ld	hl,#0x4000
   89E7 E5            [11]  306 	push	hl
   89E8 AF            [ 4]  307 	xor	a, a
   89E9 F5            [11]  308 	push	af
   89EA 33            [ 6]  309 	inc	sp
   89EB 26 C0         [ 7]  310 	ld	h, #0xC0
   89ED E5            [11]  311 	push	hl
   89EE CD 2A 7F      [17]  312 	call	_cpct_memset
                            313 ;src/main.c:148: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   89F1 21 18 5A      [10]  314 	ld	hl,#0x5A18
   89F4 E5            [11]  315 	push	hl
   89F5 21 00 C0      [10]  316 	ld	hl,#0xC000
   89F8 E5            [11]  317 	push	hl
   89F9 CD 70 88      [17]  318 	call	_cpct_getScreenPtr
   89FC 4D            [ 4]  319 	ld	c,l
   89FD 44            [ 4]  320 	ld	b,h
                            321 ;src/main.c:149: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   89FE 21 02 00      [10]  322 	ld	hl,#0x0002
   8A01 E5            [11]  323 	push	hl
   8A02 C5            [11]  324 	push	bc
   8A03 21 11 8A      [10]  325 	ld	hl,#___str_0
   8A06 E5            [11]  326 	push	hl
   8A07 CD 7B 7C      [17]  327 	call	_cpct_drawStringM0
   8A0A 21 06 00      [10]  328 	ld	hl,#6
   8A0D 39            [11]  329 	add	hl,sp
   8A0E F9            [ 6]  330 	ld	sp,hl
                            331 ;src/main.c:151: while(1){}
   8A0F                     332 00102$:
   8A0F 18 FE         [12]  333 	jr	00102$
   8A11                     334 ___str_0:
   8A11 47 41 4D 45 20 4F   335 	.ascii "GAME OVER"
        56 45 52
   8A1A 00                  336 	.db 0x00
                            337 ;src/main.c:154: void redibujarProta() {
                            338 ;	---------------------------------
                            339 ; Function redibujarProta
                            340 ; ---------------------------------
   8A1B                     341 _redibujarProta::
                            342 ;src/main.c:155: borrarProta();
   8A1B CD 81 89      [17]  343 	call	_borrarProta
                            344 ;src/main.c:156: prota.px = prota.x;
   8A1E 01 22 89      [10]  345 	ld	bc,#_prota + 2
   8A21 3A 20 89      [13]  346 	ld	a, (#_prota + 0)
   8A24 02            [ 7]  347 	ld	(bc),a
                            348 ;src/main.c:157: prota.py = prota.y;
   8A25 01 23 89      [10]  349 	ld	bc,#_prota + 3
   8A28 3A 21 89      [13]  350 	ld	a, (#_prota + 1)
   8A2B 02            [ 7]  351 	ld	(bc),a
                            352 ;src/main.c:158: dibujarProta();
   8A2C C3 5B 89      [10]  353 	jp  _dibujarProta
                            354 ;src/main.c:161: u8* getTilePtr(u8 x, u8 y) {
                            355 ;	---------------------------------
                            356 ; Function getTilePtr
                            357 ; ---------------------------------
   8A2F                     358 _getTilePtr::
                            359 ;src/main.c:162: return mapa + (y/4)*g_map1_W + x/2;
   8A2F 21 03 00      [10]  360 	ld	hl, #3+0
   8A32 39            [11]  361 	add	hl, sp
   8A33 4E            [ 7]  362 	ld	c, (hl)
   8A34 CB 39         [ 8]  363 	srl	c
   8A36 CB 39         [ 8]  364 	srl	c
   8A38 06 00         [ 7]  365 	ld	b,#0x00
   8A3A 69            [ 4]  366 	ld	l, c
   8A3B 60            [ 4]  367 	ld	h, b
   8A3C 29            [11]  368 	add	hl, hl
   8A3D 29            [11]  369 	add	hl, hl
   8A3E 09            [11]  370 	add	hl, bc
   8A3F 29            [11]  371 	add	hl, hl
   8A40 29            [11]  372 	add	hl, hl
   8A41 29            [11]  373 	add	hl, hl
   8A42 ED 5B 32 89   [20]  374 	ld	de,(_mapa)
   8A46 19            [11]  375 	add	hl,de
   8A47 FD 21 02 00   [14]  376 	ld	iy,#2
   8A4B FD 39         [15]  377 	add	iy,sp
   8A4D FD 4E 00      [19]  378 	ld	c,0 (iy)
   8A50 CB 39         [ 8]  379 	srl	c
   8A52 59            [ 4]  380 	ld	e,c
   8A53 16 00         [ 7]  381 	ld	d,#0x00
   8A55 19            [11]  382 	add	hl,de
   8A56 C9            [10]  383 	ret
                            384 ;src/main.c:165: u8 checkCollision(int direction) { // check optimization
                            385 ;	---------------------------------
                            386 ; Function checkCollision
                            387 ; ---------------------------------
   8A57                     388 _checkCollision::
   8A57 DD E5         [15]  389 	push	ix
   8A59 DD 21 00 00   [14]  390 	ld	ix,#0
   8A5D DD 39         [15]  391 	add	ix,sp
   8A5F F5            [11]  392 	push	af
                            393 ;src/main.c:166: u8 *headTile=0, *feetTile=0, *waistTile=0;
   8A60 21 00 00      [10]  394 	ld	hl,#0x0000
   8A63 E3            [19]  395 	ex	(sp), hl
   8A64 11 00 00      [10]  396 	ld	de,#0x0000
   8A67 01 00 00      [10]  397 	ld	bc,#0x0000
                            398 ;src/main.c:168: switch (direction) {
   8A6A DD CB 05 7E   [20]  399 	bit	7, 5 (ix)
   8A6E C2 8B 8B      [10]  400 	jp	NZ,00105$
   8A71 3E 03         [ 7]  401 	ld	a,#0x03
   8A73 DD BE 04      [19]  402 	cp	a, 4 (ix)
   8A76 3E 00         [ 7]  403 	ld	a,#0x00
   8A78 DD 9E 05      [19]  404 	sbc	a, 5 (ix)
   8A7B E2 80 8A      [10]  405 	jp	PO, 00128$
   8A7E EE 80         [ 7]  406 	xor	a, #0x80
   8A80                     407 00128$:
   8A80 FA 8B 8B      [10]  408 	jp	M,00105$
   8A83 DD 5E 04      [19]  409 	ld	e,4 (ix)
   8A86 16 00         [ 7]  410 	ld	d,#0x00
   8A88 21 8F 8A      [10]  411 	ld	hl,#00129$
   8A8B 19            [11]  412 	add	hl,de
   8A8C 19            [11]  413 	add	hl,de
   8A8D 19            [11]  414 	add	hl,de
   8A8E E9            [ 4]  415 	jp	(hl)
   8A8F                     416 00129$:
   8A8F C3 9B 8A      [10]  417 	jp	00101$
   8A92 C3 E6 8A      [10]  418 	jp	00102$
   8A95 C3 27 8B      [10]  419 	jp	00103$
   8A98 C3 5A 8B      [10]  420 	jp	00104$
                            421 ;src/main.c:169: case 0:
   8A9B                     422 00101$:
                            423 ;src/main.c:170: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   8A9B 21 21 89      [10]  424 	ld	hl, #(_prota + 0x0001) + 0
   8A9E 5E            [ 7]  425 	ld	e,(hl)
   8A9F 21 20 89      [10]  426 	ld	hl, #_prota + 0
   8AA2 4E            [ 7]  427 	ld	c,(hl)
   8AA3 0C            [ 4]  428 	inc	c
   8AA4 0C            [ 4]  429 	inc	c
   8AA5 0C            [ 4]  430 	inc	c
   8AA6 0C            [ 4]  431 	inc	c
   8AA7 7B            [ 4]  432 	ld	a,e
   8AA8 F5            [11]  433 	push	af
   8AA9 33            [ 6]  434 	inc	sp
   8AAA 79            [ 4]  435 	ld	a,c
   8AAB F5            [11]  436 	push	af
   8AAC 33            [ 6]  437 	inc	sp
   8AAD CD 2F 8A      [17]  438 	call	_getTilePtr
   8AB0 F1            [10]  439 	pop	af
   8AB1 33            [ 6]  440 	inc	sp
   8AB2 33            [ 6]  441 	inc	sp
   8AB3 E5            [11]  442 	push	hl
                            443 ;src/main.c:171: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   8AB4 3A 21 89      [13]  444 	ld	a, (#(_prota + 0x0001) + 0)
   8AB7 C6 14         [ 7]  445 	add	a, #0x14
   8AB9 4F            [ 4]  446 	ld	c,a
   8ABA 21 20 89      [10]  447 	ld	hl, #_prota + 0
   8ABD 46            [ 7]  448 	ld	b,(hl)
   8ABE 04            [ 4]  449 	inc	b
   8ABF 04            [ 4]  450 	inc	b
   8AC0 04            [ 4]  451 	inc	b
   8AC1 04            [ 4]  452 	inc	b
   8AC2 79            [ 4]  453 	ld	a,c
   8AC3 F5            [11]  454 	push	af
   8AC4 33            [ 6]  455 	inc	sp
   8AC5 C5            [11]  456 	push	bc
   8AC6 33            [ 6]  457 	inc	sp
   8AC7 CD 2F 8A      [17]  458 	call	_getTilePtr
   8ACA F1            [10]  459 	pop	af
   8ACB EB            [ 4]  460 	ex	de,hl
                            461 ;src/main.c:172: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   8ACC 3A 21 89      [13]  462 	ld	a, (#(_prota + 0x0001) + 0)
   8ACF C6 0B         [ 7]  463 	add	a, #0x0B
   8AD1 47            [ 4]  464 	ld	b,a
   8AD2 3A 20 89      [13]  465 	ld	a, (#_prota + 0)
   8AD5 C6 04         [ 7]  466 	add	a, #0x04
   8AD7 D5            [11]  467 	push	de
   8AD8 C5            [11]  468 	push	bc
   8AD9 33            [ 6]  469 	inc	sp
   8ADA F5            [11]  470 	push	af
   8ADB 33            [ 6]  471 	inc	sp
   8ADC CD 2F 8A      [17]  472 	call	_getTilePtr
   8ADF F1            [10]  473 	pop	af
   8AE0 4D            [ 4]  474 	ld	c,l
   8AE1 44            [ 4]  475 	ld	b,h
   8AE2 D1            [10]  476 	pop	de
                            477 ;src/main.c:173: break;
   8AE3 C3 8B 8B      [10]  478 	jp	00105$
                            479 ;src/main.c:174: case 1:
   8AE6                     480 00102$:
                            481 ;src/main.c:175: headTile  = getTilePtr(prota.x - 1, prota.y);
   8AE6 21 21 89      [10]  482 	ld	hl, #(_prota + 0x0001) + 0
   8AE9 56            [ 7]  483 	ld	d,(hl)
   8AEA 21 20 89      [10]  484 	ld	hl, #_prota + 0
   8AED 46            [ 7]  485 	ld	b,(hl)
   8AEE 05            [ 4]  486 	dec	b
   8AEF D5            [11]  487 	push	de
   8AF0 33            [ 6]  488 	inc	sp
   8AF1 C5            [11]  489 	push	bc
   8AF2 33            [ 6]  490 	inc	sp
   8AF3 CD 2F 8A      [17]  491 	call	_getTilePtr
   8AF6 F1            [10]  492 	pop	af
   8AF7 33            [ 6]  493 	inc	sp
   8AF8 33            [ 6]  494 	inc	sp
   8AF9 E5            [11]  495 	push	hl
                            496 ;src/main.c:176: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
   8AFA 3A 21 89      [13]  497 	ld	a, (#(_prota + 0x0001) + 0)
   8AFD C6 14         [ 7]  498 	add	a, #0x14
   8AFF 57            [ 4]  499 	ld	d,a
   8B00 21 20 89      [10]  500 	ld	hl, #_prota + 0
   8B03 46            [ 7]  501 	ld	b,(hl)
   8B04 05            [ 4]  502 	dec	b
   8B05 D5            [11]  503 	push	de
   8B06 33            [ 6]  504 	inc	sp
   8B07 C5            [11]  505 	push	bc
   8B08 33            [ 6]  506 	inc	sp
   8B09 CD 2F 8A      [17]  507 	call	_getTilePtr
   8B0C F1            [10]  508 	pop	af
   8B0D EB            [ 4]  509 	ex	de,hl
                            510 ;src/main.c:177: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
   8B0E 3A 21 89      [13]  511 	ld	a, (#(_prota + 0x0001) + 0)
   8B11 C6 0B         [ 7]  512 	add	a, #0x0B
   8B13 47            [ 4]  513 	ld	b,a
   8B14 3A 20 89      [13]  514 	ld	a, (#_prota + 0)
   8B17 C6 FF         [ 7]  515 	add	a,#0xFF
   8B19 D5            [11]  516 	push	de
   8B1A C5            [11]  517 	push	bc
   8B1B 33            [ 6]  518 	inc	sp
   8B1C F5            [11]  519 	push	af
   8B1D 33            [ 6]  520 	inc	sp
   8B1E CD 2F 8A      [17]  521 	call	_getTilePtr
   8B21 F1            [10]  522 	pop	af
   8B22 4D            [ 4]  523 	ld	c,l
   8B23 44            [ 4]  524 	ld	b,h
   8B24 D1            [10]  525 	pop	de
                            526 ;src/main.c:178: break;
   8B25 18 64         [12]  527 	jr	00105$
                            528 ;src/main.c:179: case 2:
   8B27                     529 00103$:
                            530 ;src/main.c:180: headTile   = getTilePtr(prota.x, prota.y - 2);
   8B27 3A 21 89      [13]  531 	ld	a, (#(_prota + 0x0001) + 0)
   8B2A C6 FE         [ 7]  532 	add	a,#0xFE
   8B2C 21 20 89      [10]  533 	ld	hl, #_prota + 0
   8B2F 56            [ 7]  534 	ld	d,(hl)
   8B30 C5            [11]  535 	push	bc
   8B31 F5            [11]  536 	push	af
   8B32 33            [ 6]  537 	inc	sp
   8B33 D5            [11]  538 	push	de
   8B34 33            [ 6]  539 	inc	sp
   8B35 CD 2F 8A      [17]  540 	call	_getTilePtr
   8B38 F1            [10]  541 	pop	af
   8B39 C1            [10]  542 	pop	bc
   8B3A 33            [ 6]  543 	inc	sp
   8B3B 33            [ 6]  544 	inc	sp
   8B3C E5            [11]  545 	push	hl
                            546 ;src/main.c:181: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
   8B3D 21 21 89      [10]  547 	ld	hl, #(_prota + 0x0001) + 0
   8B40 56            [ 7]  548 	ld	d,(hl)
   8B41 15            [ 4]  549 	dec	d
   8B42 15            [ 4]  550 	dec	d
   8B43 3A 20 89      [13]  551 	ld	a, (#_prota + 0)
   8B46 C6 03         [ 7]  552 	add	a, #0x03
   8B48 C5            [11]  553 	push	bc
   8B49 D5            [11]  554 	push	de
   8B4A 33            [ 6]  555 	inc	sp
   8B4B F5            [11]  556 	push	af
   8B4C 33            [ 6]  557 	inc	sp
   8B4D CD 2F 8A      [17]  558 	call	_getTilePtr
   8B50 F1            [10]  559 	pop	af
   8B51 EB            [ 4]  560 	ex	de,hl
   8B52 C1            [10]  561 	pop	bc
                            562 ;src/main.c:182: *waistTile = 0;
   8B53 21 00 00      [10]  563 	ld	hl,#0x0000
   8B56 36 00         [10]  564 	ld	(hl),#0x00
                            565 ;src/main.c:183: break;
   8B58 18 31         [12]  566 	jr	00105$
                            567 ;src/main.c:184: case 3:
   8B5A                     568 00104$:
                            569 ;src/main.c:185: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
   8B5A 3A 21 89      [13]  570 	ld	a, (#(_prota + 0x0001) + 0)
   8B5D C6 16         [ 7]  571 	add	a, #0x16
   8B5F 21 20 89      [10]  572 	ld	hl, #_prota + 0
   8B62 56            [ 7]  573 	ld	d,(hl)
   8B63 C5            [11]  574 	push	bc
   8B64 F5            [11]  575 	push	af
   8B65 33            [ 6]  576 	inc	sp
   8B66 D5            [11]  577 	push	de
   8B67 33            [ 6]  578 	inc	sp
   8B68 CD 2F 8A      [17]  579 	call	_getTilePtr
   8B6B F1            [10]  580 	pop	af
   8B6C C1            [10]  581 	pop	bc
   8B6D 33            [ 6]  582 	inc	sp
   8B6E 33            [ 6]  583 	inc	sp
   8B6F E5            [11]  584 	push	hl
                            585 ;src/main.c:186: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   8B70 3A 21 89      [13]  586 	ld	a, (#(_prota + 0x0001) + 0)
   8B73 C6 16         [ 7]  587 	add	a, #0x16
   8B75 57            [ 4]  588 	ld	d,a
   8B76 3A 20 89      [13]  589 	ld	a, (#_prota + 0)
   8B79 C6 03         [ 7]  590 	add	a, #0x03
   8B7B C5            [11]  591 	push	bc
   8B7C D5            [11]  592 	push	de
   8B7D 33            [ 6]  593 	inc	sp
   8B7E F5            [11]  594 	push	af
   8B7F 33            [ 6]  595 	inc	sp
   8B80 CD 2F 8A      [17]  596 	call	_getTilePtr
   8B83 F1            [10]  597 	pop	af
   8B84 EB            [ 4]  598 	ex	de,hl
   8B85 C1            [10]  599 	pop	bc
                            600 ;src/main.c:187: *waistTile = 0;
   8B86 21 00 00      [10]  601 	ld	hl,#0x0000
   8B89 36 00         [10]  602 	ld	(hl),#0x00
                            603 ;src/main.c:189: }
   8B8B                     604 00105$:
                            605 ;src/main.c:191: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   8B8B E1            [10]  606 	pop	hl
   8B8C E5            [11]  607 	push	hl
   8B8D 6E            [ 7]  608 	ld	l,(hl)
   8B8E 3E 02         [ 7]  609 	ld	a,#0x02
   8B90 95            [ 4]  610 	sub	a, l
   8B91 38 0E         [12]  611 	jr	C,00106$
   8B93 1A            [ 7]  612 	ld	a,(de)
   8B94 5F            [ 4]  613 	ld	e,a
   8B95 3E 02         [ 7]  614 	ld	a,#0x02
   8B97 93            [ 4]  615 	sub	a, e
   8B98 38 07         [12]  616 	jr	C,00106$
   8B9A 0A            [ 7]  617 	ld	a,(bc)
   8B9B 4F            [ 4]  618 	ld	c,a
   8B9C 3E 02         [ 7]  619 	ld	a,#0x02
   8B9E 91            [ 4]  620 	sub	a, c
   8B9F 30 04         [12]  621 	jr	NC,00107$
   8BA1                     622 00106$:
                            623 ;src/main.c:192: return 1;
   8BA1 2E 01         [ 7]  624 	ld	l,#0x01
   8BA3 18 02         [12]  625 	jr	00110$
   8BA5                     626 00107$:
                            627 ;src/main.c:194: return 0;
   8BA5 2E 00         [ 7]  628 	ld	l,#0x00
   8BA7                     629 00110$:
   8BA7 DD F9         [10]  630 	ld	sp, ix
   8BA9 DD E1         [14]  631 	pop	ix
   8BAB C9            [10]  632 	ret
                            633 ;src/main.c:198: void dibujarEnemigo(TEnemy *enemy) {
                            634 ;	---------------------------------
                            635 ; Function dibujarEnemigo
                            636 ; ---------------------------------
   8BAC                     637 _dibujarEnemigo::
   8BAC DD E5         [15]  638 	push	ix
   8BAE DD 21 00 00   [14]  639 	ld	ix,#0
   8BB2 DD 39         [15]  640 	add	ix,sp
                            641 ;src/main.c:199: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   8BB4 DD 4E 04      [19]  642 	ld	c,4 (ix)
   8BB7 DD 46 05      [19]  643 	ld	b,5 (ix)
   8BBA 69            [ 4]  644 	ld	l, c
   8BBB 60            [ 4]  645 	ld	h, b
   8BBC 23            [ 6]  646 	inc	hl
   8BBD 56            [ 7]  647 	ld	d,(hl)
   8BBE 0A            [ 7]  648 	ld	a,(bc)
   8BBF C5            [11]  649 	push	bc
   8BC0 D5            [11]  650 	push	de
   8BC1 33            [ 6]  651 	inc	sp
   8BC2 F5            [11]  652 	push	af
   8BC3 33            [ 6]  653 	inc	sp
   8BC4 21 00 C0      [10]  654 	ld	hl,#0xC000
   8BC7 E5            [11]  655 	push	hl
   8BC8 CD 70 88      [17]  656 	call	_cpct_getScreenPtr
   8BCB EB            [ 4]  657 	ex	de,hl
                            658 ;src/main.c:200: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   8BCC E1            [10]  659 	pop	hl
   8BCD 01 04 00      [10]  660 	ld	bc, #0x0004
   8BD0 09            [11]  661 	add	hl, bc
   8BD1 4E            [ 7]  662 	ld	c,(hl)
   8BD2 23            [ 6]  663 	inc	hl
   8BD3 46            [ 7]  664 	ld	b,(hl)
   8BD4 21 00 3E      [10]  665 	ld	hl,#_g_tablatrans
   8BD7 E5            [11]  666 	push	hl
   8BD8 21 04 16      [10]  667 	ld	hl,#0x1604
   8BDB E5            [11]  668 	push	hl
   8BDC D5            [11]  669 	push	de
   8BDD C5            [11]  670 	push	bc
   8BDE CD 90 88      [17]  671 	call	_cpct_drawSpriteMaskedAlignedTable
   8BE1 DD E1         [14]  672 	pop	ix
   8BE3 C9            [10]  673 	ret
                            674 ;src/main.c:203: void dibujarExplosion() {
                            675 ;	---------------------------------
                            676 ; Function dibujarExplosion
                            677 ; ---------------------------------
   8BE4                     678 _dibujarExplosion::
                            679 ;src/main.c:204: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   8BE4 21 F5 88      [10]  680 	ld	hl, #_enemy + 1
   8BE7 56            [ 7]  681 	ld	d,(hl)
   8BE8 21 F4 88      [10]  682 	ld	hl, #_enemy + 0
   8BEB 46            [ 7]  683 	ld	b,(hl)
   8BEC D5            [11]  684 	push	de
   8BED 33            [ 6]  685 	inc	sp
   8BEE C5            [11]  686 	push	bc
   8BEF 33            [ 6]  687 	inc	sp
   8BF0 21 00 C0      [10]  688 	ld	hl,#0xC000
   8BF3 E5            [11]  689 	push	hl
   8BF4 CD 70 88      [17]  690 	call	_cpct_getScreenPtr
   8BF7 4D            [ 4]  691 	ld	c,l
   8BF8 44            [ 4]  692 	ld	b,h
                            693 ;src/main.c:205: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   8BF9 11 00 3E      [10]  694 	ld	de,#_g_tablatrans+0
   8BFC D5            [11]  695 	push	de
   8BFD 21 04 16      [10]  696 	ld	hl,#0x1604
   8C00 E5            [11]  697 	push	hl
   8C01 C5            [11]  698 	push	bc
   8C02 21 A8 55      [10]  699 	ld	hl,#_g_explosion
   8C05 E5            [11]  700 	push	hl
   8C06 CD 90 88      [17]  701 	call	_cpct_drawSpriteMaskedAlignedTable
   8C09 C9            [10]  702 	ret
                            703 ;src/main.c:208: void borrarExplosion() {
                            704 ;	---------------------------------
                            705 ; Function borrarExplosion
                            706 ; ---------------------------------
   8C0A                     707 _borrarExplosion::
   8C0A DD E5         [15]  708 	push	ix
   8C0C DD 21 00 00   [14]  709 	ld	ix,#0
   8C10 DD 39         [15]  710 	add	ix,sp
   8C12 3B            [ 6]  711 	dec	sp
                            712 ;src/main.c:209: u8 w = 4 + (enemy->px & 1);
   8C13 21 F6 88      [10]  713 	ld	hl, #_enemy + 2
   8C16 4E            [ 7]  714 	ld	c,(hl)
   8C17 79            [ 4]  715 	ld	a,c
   8C18 E6 01         [ 7]  716 	and	a, #0x01
   8C1A 47            [ 4]  717 	ld	b,a
   8C1B 04            [ 4]  718 	inc	b
   8C1C 04            [ 4]  719 	inc	b
   8C1D 04            [ 4]  720 	inc	b
   8C1E 04            [ 4]  721 	inc	b
                            722 ;src/main.c:212: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   8C1F 21 F7 88      [10]  723 	ld	hl, #_enemy + 3
   8C22 5E            [ 7]  724 	ld	e,(hl)
   8C23 CB 4B         [ 8]  725 	bit	1, e
   8C25 28 04         [12]  726 	jr	Z,00103$
   8C27 3E 01         [ 7]  727 	ld	a,#0x01
   8C29 18 02         [12]  728 	jr	00104$
   8C2B                     729 00103$:
   8C2B 3E 00         [ 7]  730 	ld	a,#0x00
   8C2D                     731 00104$:
   8C2D C6 07         [ 7]  732 	add	a, #0x07
   8C2F DD 77 FF      [19]  733 	ld	-1 (ix),a
                            734 ;src/main.c:214: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   8C32 FD 2A 32 89   [20]  735 	ld	iy,(_mapa)
   8C36 16 00         [ 7]  736 	ld	d,#0x00
   8C38 63            [ 4]  737 	ld	h,e
   8C39 6A            [ 4]  738 	ld	l,d
   8C3A CB 7A         [ 8]  739 	bit	7, d
   8C3C 28 05         [12]  740 	jr	Z,00105$
   8C3E 13            [ 6]  741 	inc	de
   8C3F 13            [ 6]  742 	inc	de
   8C40 13            [ 6]  743 	inc	de
   8C41 63            [ 4]  744 	ld	h,e
   8C42 6A            [ 4]  745 	ld	l,d
   8C43                     746 00105$:
   8C43 5C            [ 4]  747 	ld	e, h
   8C44 55            [ 4]  748 	ld	d, l
   8C45 CB 2A         [ 8]  749 	sra	d
   8C47 CB 1B         [ 8]  750 	rr	e
   8C49 CB 2A         [ 8]  751 	sra	d
   8C4B CB 1B         [ 8]  752 	rr	e
   8C4D 51            [ 4]  753 	ld	d,c
   8C4E CB 3A         [ 8]  754 	srl	d
   8C50 FD E5         [15]  755 	push	iy
   8C52 21 00 C0      [10]  756 	ld	hl,#0xC000
   8C55 E5            [11]  757 	push	hl
   8C56 3E 28         [ 7]  758 	ld	a,#0x28
   8C58 F5            [11]  759 	push	af
   8C59 33            [ 6]  760 	inc	sp
   8C5A DD 7E FF      [19]  761 	ld	a,-1 (ix)
   8C5D F5            [11]  762 	push	af
   8C5E 33            [ 6]  763 	inc	sp
   8C5F C5            [11]  764 	push	bc
   8C60 33            [ 6]  765 	inc	sp
   8C61 7B            [ 4]  766 	ld	a,e
   8C62 F5            [11]  767 	push	af
   8C63 33            [ 6]  768 	inc	sp
   8C64 D5            [11]  769 	push	de
   8C65 33            [ 6]  770 	inc	sp
   8C66 CD 44 7D      [17]  771 	call	_cpct_etm_drawTileBox2x4
   8C69 33            [ 6]  772 	inc	sp
   8C6A DD E1         [14]  773 	pop	ix
   8C6C C9            [10]  774 	ret
                            775 ;src/main.c:218: void borrarEnemigo(TEnemy *enemy) {
                            776 ;	---------------------------------
                            777 ; Function borrarEnemigo
                            778 ; ---------------------------------
   8C6D                     779 _borrarEnemigo::
   8C6D DD E5         [15]  780 	push	ix
   8C6F DD 21 00 00   [14]  781 	ld	ix,#0
   8C73 DD 39         [15]  782 	add	ix,sp
   8C75 F5            [11]  783 	push	af
   8C76 F5            [11]  784 	push	af
                            785 ;src/main.c:220: u8 w = 4 + (enemy->px & 1);
   8C77 DD 4E 04      [19]  786 	ld	c,4 (ix)
   8C7A DD 46 05      [19]  787 	ld	b,5 (ix)
   8C7D 69            [ 4]  788 	ld	l, c
   8C7E 60            [ 4]  789 	ld	h, b
   8C7F 23            [ 6]  790 	inc	hl
   8C80 23            [ 6]  791 	inc	hl
   8C81 5E            [ 7]  792 	ld	e,(hl)
   8C82 7B            [ 4]  793 	ld	a,e
   8C83 E6 01         [ 7]  794 	and	a, #0x01
   8C85 C6 04         [ 7]  795 	add	a, #0x04
   8C87 DD 77 FD      [19]  796 	ld	-3 (ix),a
                            797 ;src/main.c:223: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   8C8A 69            [ 4]  798 	ld	l, c
   8C8B 60            [ 4]  799 	ld	h, b
   8C8C 23            [ 6]  800 	inc	hl
   8C8D 23            [ 6]  801 	inc	hl
   8C8E 23            [ 6]  802 	inc	hl
   8C8F 56            [ 7]  803 	ld	d,(hl)
   8C90 CB 4A         [ 8]  804 	bit	1, d
   8C92 28 04         [12]  805 	jr	Z,00103$
   8C94 3E 01         [ 7]  806 	ld	a,#0x01
   8C96 18 02         [12]  807 	jr	00104$
   8C98                     808 00103$:
   8C98 3E 00         [ 7]  809 	ld	a,#0x00
   8C9A                     810 00104$:
   8C9A C6 07         [ 7]  811 	add	a, #0x07
   8C9C DD 77 FC      [19]  812 	ld	-4 (ix),a
                            813 ;src/main.c:225: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   8C9F FD 2A 32 89   [20]  814 	ld	iy,(_mapa)
   8CA3 6A            [ 4]  815 	ld	l,d
   8CA4 26 00         [ 7]  816 	ld	h,#0x00
   8CA6 DD 75 FE      [19]  817 	ld	-2 (ix),l
   8CA9 DD 74 FF      [19]  818 	ld	-1 (ix),h
   8CAC CB 7C         [ 8]  819 	bit	7, h
   8CAE 28 09         [12]  820 	jr	Z,00105$
   8CB0 23            [ 6]  821 	inc	hl
   8CB1 23            [ 6]  822 	inc	hl
   8CB2 23            [ 6]  823 	inc	hl
   8CB3 DD 75 FE      [19]  824 	ld	-2 (ix),l
   8CB6 DD 74 FF      [19]  825 	ld	-1 (ix),h
   8CB9                     826 00105$:
   8CB9 DD 56 FE      [19]  827 	ld	d,-2 (ix)
   8CBC DD 6E FF      [19]  828 	ld	l,-1 (ix)
   8CBF CB 2D         [ 8]  829 	sra	l
   8CC1 CB 1A         [ 8]  830 	rr	d
   8CC3 CB 2D         [ 8]  831 	sra	l
   8CC5 CB 1A         [ 8]  832 	rr	d
   8CC7 CB 3B         [ 8]  833 	srl	e
   8CC9 C5            [11]  834 	push	bc
   8CCA FD E5         [15]  835 	push	iy
   8CCC 21 00 C0      [10]  836 	ld	hl,#0xC000
   8CCF E5            [11]  837 	push	hl
   8CD0 3E 28         [ 7]  838 	ld	a,#0x28
   8CD2 F5            [11]  839 	push	af
   8CD3 33            [ 6]  840 	inc	sp
   8CD4 DD 66 FC      [19]  841 	ld	h,-4 (ix)
   8CD7 DD 6E FD      [19]  842 	ld	l,-3 (ix)
   8CDA E5            [11]  843 	push	hl
   8CDB D5            [11]  844 	push	de
   8CDC CD 44 7D      [17]  845 	call	_cpct_etm_drawTileBox2x4
   8CDF C1            [10]  846 	pop	bc
                            847 ;src/main.c:227: enemy->mover = NO;
   8CE0 21 06 00      [10]  848 	ld	hl,#0x0006
   8CE3 09            [11]  849 	add	hl,bc
   8CE4 36 00         [10]  850 	ld	(hl),#0x00
   8CE6 DD F9         [10]  851 	ld	sp, ix
   8CE8 DD E1         [14]  852 	pop	ix
   8CEA C9            [10]  853 	ret
                            854 ;src/main.c:230: void redibujarEnemigo(TEnemy *enemy) {
                            855 ;	---------------------------------
                            856 ; Function redibujarEnemigo
                            857 ; ---------------------------------
   8CEB                     858 _redibujarEnemigo::
   8CEB DD E5         [15]  859 	push	ix
   8CED DD 21 00 00   [14]  860 	ld	ix,#0
   8CF1 DD 39         [15]  861 	add	ix,sp
                            862 ;src/main.c:231: borrarEnemigo(enemy);
   8CF3 DD 6E 04      [19]  863 	ld	l,4 (ix)
   8CF6 DD 66 05      [19]  864 	ld	h,5 (ix)
   8CF9 E5            [11]  865 	push	hl
   8CFA CD 6D 8C      [17]  866 	call	_borrarEnemigo
   8CFD F1            [10]  867 	pop	af
                            868 ;src/main.c:232: enemy->px = enemy->x;
   8CFE DD 4E 04      [19]  869 	ld	c,4 (ix)
   8D01 DD 46 05      [19]  870 	ld	b,5 (ix)
   8D04 59            [ 4]  871 	ld	e, c
   8D05 50            [ 4]  872 	ld	d, b
   8D06 13            [ 6]  873 	inc	de
   8D07 13            [ 6]  874 	inc	de
   8D08 0A            [ 7]  875 	ld	a,(bc)
   8D09 12            [ 7]  876 	ld	(de),a
                            877 ;src/main.c:233: enemy->py = enemy->y;
   8D0A 59            [ 4]  878 	ld	e, c
   8D0B 50            [ 4]  879 	ld	d, b
   8D0C 13            [ 6]  880 	inc	de
   8D0D 13            [ 6]  881 	inc	de
   8D0E 13            [ 6]  882 	inc	de
   8D0F 69            [ 4]  883 	ld	l, c
   8D10 60            [ 4]  884 	ld	h, b
   8D11 23            [ 6]  885 	inc	hl
   8D12 7E            [ 7]  886 	ld	a,(hl)
   8D13 12            [ 7]  887 	ld	(de),a
                            888 ;src/main.c:234: dibujarEnemigo(enemy);
   8D14 C5            [11]  889 	push	bc
   8D15 CD AC 8B      [17]  890 	call	_dibujarEnemigo
   8D18 F1            [10]  891 	pop	af
   8D19 DD E1         [14]  892 	pop	ix
   8D1B C9            [10]  893 	ret
                            894 ;src/main.c:237: u8 checkEnemyCollision(int direction, TEnemy *enemy){
                            895 ;	---------------------------------
                            896 ; Function checkEnemyCollision
                            897 ; ---------------------------------
   8D1C                     898 _checkEnemyCollision::
   8D1C DD E5         [15]  899 	push	ix
   8D1E DD 21 00 00   [14]  900 	ld	ix,#0
   8D22 DD 39         [15]  901 	add	ix,sp
   8D24 21 F9 FF      [10]  902 	ld	hl,#-7
   8D27 39            [11]  903 	add	hl,sp
   8D28 F9            [ 6]  904 	ld	sp,hl
                            905 ;src/main.c:239: u8 colisiona = 1;
   8D29 DD 36 F9 01   [19]  906 	ld	-7 (ix),#0x01
                            907 ;src/main.c:241: switch (direction) {
   8D2D DD CB 05 7E   [20]  908 	bit	7, 5 (ix)
   8D31 C2 2F 8F      [10]  909 	jp	NZ,00135$
   8D34 3E 03         [ 7]  910 	ld	a,#0x03
   8D36 DD BE 04      [19]  911 	cp	a, 4 (ix)
   8D39 3E 00         [ 7]  912 	ld	a,#0x00
   8D3B DD 9E 05      [19]  913 	sbc	a, 5 (ix)
   8D3E E2 43 8D      [10]  914 	jp	PO, 00194$
   8D41 EE 80         [ 7]  915 	xor	a, #0x80
   8D43                     916 00194$:
   8D43 FA 2F 8F      [10]  917 	jp	M,00135$
                            918 ;src/main.c:249: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   8D46 DD 4E 06      [19]  919 	ld	c,6 (ix)
   8D49 DD 46 07      [19]  920 	ld	b,7 (ix)
                            921 ;src/main.c:263: enemy->mira = M_abajo;
   8D4C 21 07 00      [10]  922 	ld	hl,#0x0007
   8D4F 09            [11]  923 	add	hl,bc
   8D50 DD 75 FE      [19]  924 	ld	-2 (ix),l
   8D53 DD 74 FF      [19]  925 	ld	-1 (ix),h
                            926 ;src/main.c:249: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   8D56 21 01 00      [10]  927 	ld	hl,#0x0001
   8D59 09            [11]  928 	add	hl,bc
   8D5A DD 75 FC      [19]  929 	ld	-4 (ix),l
   8D5D DD 74 FD      [19]  930 	ld	-3 (ix),h
                            931 ;src/main.c:241: switch (direction) {
   8D60 DD 5E 04      [19]  932 	ld	e,4 (ix)
   8D63 16 00         [ 7]  933 	ld	d,#0x00
   8D65 21 6C 8D      [10]  934 	ld	hl,#00195$
   8D68 19            [11]  935 	add	hl,de
   8D69 19            [11]  936 	add	hl,de
   8D6A 19            [11]  937 	add	hl,de
   8D6B E9            [ 4]  938 	jp	(hl)
   8D6C                     939 00195$:
   8D6C C3 2F 8F      [10]  940 	jp	00135$
   8D6F C3 2F 8F      [10]  941 	jp	00135$
   8D72 C3 7E 8D      [10]  942 	jp	00103$
   8D75 C3 55 8E      [10]  943 	jp	00119$
                            944 ;src/main.c:242: case 0:
                            945 ;src/main.c:244: break;
   8D78 C3 2F 8F      [10]  946 	jp	00135$
                            947 ;src/main.c:245: case 1:
                            948 ;src/main.c:247: break;
   8D7B C3 2F 8F      [10]  949 	jp	00135$
                            950 ;src/main.c:248: case 2:
   8D7E                     951 00103$:
                            952 ;src/main.c:249: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   8D7E DD 6E FC      [19]  953 	ld	l,-4 (ix)
   8D81 DD 66 FD      [19]  954 	ld	h,-3 (ix)
   8D84 5E            [ 7]  955 	ld	e,(hl)
   8D85 53            [ 4]  956 	ld	d,e
   8D86 15            [ 4]  957 	dec	d
   8D87 15            [ 4]  958 	dec	d
   8D88 0A            [ 7]  959 	ld	a,(bc)
   8D89 C5            [11]  960 	push	bc
   8D8A D5            [11]  961 	push	de
   8D8B 33            [ 6]  962 	inc	sp
   8D8C F5            [11]  963 	push	af
   8D8D 33            [ 6]  964 	inc	sp
   8D8E CD 2F 8A      [17]  965 	call	_getTilePtr
   8D91 F1            [10]  966 	pop	af
   8D92 C1            [10]  967 	pop	bc
   8D93 5E            [ 7]  968 	ld	e,(hl)
   8D94 3E 02         [ 7]  969 	ld	a,#0x02
   8D96 93            [ 4]  970 	sub	a, e
   8D97 DA 4D 8E      [10]  971 	jp	C,00115$
                            972 ;src/main.c:250: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   8D9A DD 6E FC      [19]  973 	ld	l,-4 (ix)
   8D9D DD 66 FD      [19]  974 	ld	h,-3 (ix)
   8DA0 56            [ 7]  975 	ld	d,(hl)
   8DA1 15            [ 4]  976 	dec	d
   8DA2 15            [ 4]  977 	dec	d
   8DA3 0A            [ 7]  978 	ld	a,(bc)
   8DA4 C6 02         [ 7]  979 	add	a, #0x02
   8DA6 C5            [11]  980 	push	bc
   8DA7 D5            [11]  981 	push	de
   8DA8 33            [ 6]  982 	inc	sp
   8DA9 F5            [11]  983 	push	af
   8DAA 33            [ 6]  984 	inc	sp
   8DAB CD 2F 8A      [17]  985 	call	_getTilePtr
   8DAE F1            [10]  986 	pop	af
   8DAF C1            [10]  987 	pop	bc
   8DB0 5E            [ 7]  988 	ld	e,(hl)
   8DB1 3E 02         [ 7]  989 	ld	a,#0x02
   8DB3 93            [ 4]  990 	sub	a, e
   8DB4 DA 4D 8E      [10]  991 	jp	C,00115$
                            992 ;src/main.c:251: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   8DB7 DD 6E FC      [19]  993 	ld	l,-4 (ix)
   8DBA DD 66 FD      [19]  994 	ld	h,-3 (ix)
   8DBD 56            [ 7]  995 	ld	d,(hl)
   8DBE 15            [ 4]  996 	dec	d
   8DBF 15            [ 4]  997 	dec	d
   8DC0 0A            [ 7]  998 	ld	a,(bc)
   8DC1 C6 04         [ 7]  999 	add	a, #0x04
   8DC3 C5            [11] 1000 	push	bc
   8DC4 D5            [11] 1001 	push	de
   8DC5 33            [ 6] 1002 	inc	sp
   8DC6 F5            [11] 1003 	push	af
   8DC7 33            [ 6] 1004 	inc	sp
   8DC8 CD 2F 8A      [17] 1005 	call	_getTilePtr
   8DCB F1            [10] 1006 	pop	af
   8DCC C1            [10] 1007 	pop	bc
   8DCD 5E            [ 7] 1008 	ld	e,(hl)
   8DCE 3E 02         [ 7] 1009 	ld	a,#0x02
   8DD0 93            [ 4] 1010 	sub	a, e
   8DD1 38 7A         [12] 1011 	jr	C,00115$
                           1012 ;src/main.c:253: if((prota.x + G_HERO_W -4) < enemy->x || prota.x  > (enemy->x + G_ENEMY_W)){
   8DD3 21 20 89      [10] 1013 	ld	hl, #_prota + 0
   8DD6 5E            [ 7] 1014 	ld	e,(hl)
   8DD7 16 00         [ 7] 1015 	ld	d,#0x00
   8DD9 21 03 00      [10] 1016 	ld	hl,#0x0003
   8DDC 19            [11] 1017 	add	hl,de
   8DDD DD 75 FA      [19] 1018 	ld	-6 (ix),l
   8DE0 DD 74 FB      [19] 1019 	ld	-5 (ix),h
   8DE3 0A            [ 7] 1020 	ld	a,(bc)
   8DE4 6F            [ 4] 1021 	ld	l,a
   8DE5 26 00         [ 7] 1022 	ld	h,#0x00
   8DE7 DD 7E FA      [19] 1023 	ld	a,-6 (ix)
   8DEA 95            [ 4] 1024 	sub	a, l
   8DEB DD 7E FB      [19] 1025 	ld	a,-5 (ix)
   8DEE 9C            [ 4] 1026 	sbc	a, h
   8DEF E2 F4 8D      [10] 1027 	jp	PO, 00196$
   8DF2 EE 80         [ 7] 1028 	xor	a, #0x80
   8DF4                    1029 00196$:
   8DF4 FA 07 8E      [10] 1030 	jp	M,00110$
   8DF7 23            [ 6] 1031 	inc	hl
   8DF8 23            [ 6] 1032 	inc	hl
   8DF9 23            [ 6] 1033 	inc	hl
   8DFA 23            [ 6] 1034 	inc	hl
   8DFB 7D            [ 4] 1035 	ld	a,l
   8DFC 93            [ 4] 1036 	sub	a, e
   8DFD 7C            [ 4] 1037 	ld	a,h
   8DFE 9A            [ 4] 1038 	sbc	a, d
   8DFF E2 04 8E      [10] 1039 	jp	PO, 00197$
   8E02 EE 80         [ 7] 1040 	xor	a, #0x80
   8E04                    1041 00197$:
   8E04 F2 0D 8E      [10] 1042 	jp	P,00111$
   8E07                    1043 00110$:
                           1044 ;src/main.c:255: colisiona = 0;
   8E07 DD 36 F9 00   [19] 1045 	ld	-7 (ix),#0x00
   8E0B 18 48         [12] 1046 	jr	00119$
   8E0D                    1047 00111$:
                           1048 ;src/main.c:258: if(enemy->y>prota.y){
   8E0D DD 6E FC      [19] 1049 	ld	l,-4 (ix)
   8E10 DD 66 FD      [19] 1050 	ld	h,-3 (ix)
   8E13 5E            [ 7] 1051 	ld	e,(hl)
   8E14 21 21 89      [10] 1052 	ld	hl, #(_prota + 0x0001) + 0
   8E17 6E            [ 7] 1053 	ld	l,(hl)
   8E18 7D            [ 4] 1054 	ld	a,l
   8E19 93            [ 4] 1055 	sub	a, e
   8E1A 30 2B         [12] 1056 	jr	NC,00108$
                           1057 ;src/main.c:259: if(enemy->y - (prota.y + G_HERO_H -2) >= 2){
   8E1C 16 00         [ 7] 1058 	ld	d,#0x00
   8E1E 26 00         [ 7] 1059 	ld	h,#0x00
   8E20 D5            [11] 1060 	push	de
   8E21 11 14 00      [10] 1061 	ld	de,#0x0014
   8E24 19            [11] 1062 	add	hl, de
   8E25 D1            [10] 1063 	pop	de
   8E26 7B            [ 4] 1064 	ld	a,e
   8E27 95            [ 4] 1065 	sub	a, l
   8E28 5F            [ 4] 1066 	ld	e,a
   8E29 7A            [ 4] 1067 	ld	a,d
   8E2A 9C            [ 4] 1068 	sbc	a, h
   8E2B 57            [ 4] 1069 	ld	d,a
   8E2C 7B            [ 4] 1070 	ld	a,e
   8E2D D6 02         [ 7] 1071 	sub	a, #0x02
   8E2F 7A            [ 4] 1072 	ld	a,d
   8E30 17            [ 4] 1073 	rla
   8E31 3F            [ 4] 1074 	ccf
   8E32 1F            [ 4] 1075 	rra
   8E33 DE 80         [ 7] 1076 	sbc	a, #0x80
   8E35 38 06         [12] 1077 	jr	C,00105$
                           1078 ;src/main.c:260: colisiona = 0;
   8E37 DD 36 F9 00   [19] 1079 	ld	-7 (ix),#0x00
   8E3B 18 18         [12] 1080 	jr	00119$
   8E3D                    1081 00105$:
                           1082 ;src/main.c:263: enemy->mira = M_abajo;
   8E3D DD 6E FE      [19] 1083 	ld	l,-2 (ix)
   8E40 DD 66 FF      [19] 1084 	ld	h,-1 (ix)
   8E43 36 03         [10] 1085 	ld	(hl),#0x03
   8E45 18 0E         [12] 1086 	jr	00119$
   8E47                    1087 00108$:
                           1088 ;src/main.c:266: colisiona = 0;
   8E47 DD 36 F9 00   [19] 1089 	ld	-7 (ix),#0x00
   8E4B 18 08         [12] 1090 	jr	00119$
   8E4D                    1091 00115$:
                           1092 ;src/main.c:272: enemy->mira = M_abajo;
   8E4D DD 6E FE      [19] 1093 	ld	l,-2 (ix)
   8E50 DD 66 FF      [19] 1094 	ld	h,-1 (ix)
   8E53 36 03         [10] 1095 	ld	(hl),#0x03
                           1096 ;src/main.c:275: case 3:
   8E55                    1097 00119$:
                           1098 ;src/main.c:278: if( *getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   8E55 DD 6E FC      [19] 1099 	ld	l,-4 (ix)
   8E58 DD 66 FD      [19] 1100 	ld	h,-3 (ix)
   8E5B 7E            [ 7] 1101 	ld	a,(hl)
   8E5C C6 18         [ 7] 1102 	add	a, #0x18
   8E5E 57            [ 4] 1103 	ld	d,a
   8E5F 0A            [ 7] 1104 	ld	a,(bc)
   8E60 C5            [11] 1105 	push	bc
   8E61 D5            [11] 1106 	push	de
   8E62 33            [ 6] 1107 	inc	sp
   8E63 F5            [11] 1108 	push	af
   8E64 33            [ 6] 1109 	inc	sp
   8E65 CD 2F 8A      [17] 1110 	call	_getTilePtr
   8E68 F1            [10] 1111 	pop	af
   8E69 C1            [10] 1112 	pop	bc
   8E6A 5E            [ 7] 1113 	ld	e,(hl)
   8E6B 3E 02         [ 7] 1114 	ld	a,#0x02
   8E6D 93            [ 4] 1115 	sub	a, e
   8E6E DA 27 8F      [10] 1116 	jp	C,00131$
                           1117 ;src/main.c:279: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   8E71 DD 6E FC      [19] 1118 	ld	l,-4 (ix)
   8E74 DD 66 FD      [19] 1119 	ld	h,-3 (ix)
   8E77 7E            [ 7] 1120 	ld	a,(hl)
   8E78 C6 18         [ 7] 1121 	add	a, #0x18
   8E7A 57            [ 4] 1122 	ld	d,a
   8E7B 0A            [ 7] 1123 	ld	a,(bc)
   8E7C C6 02         [ 7] 1124 	add	a, #0x02
   8E7E C5            [11] 1125 	push	bc
   8E7F D5            [11] 1126 	push	de
   8E80 33            [ 6] 1127 	inc	sp
   8E81 F5            [11] 1128 	push	af
   8E82 33            [ 6] 1129 	inc	sp
   8E83 CD 2F 8A      [17] 1130 	call	_getTilePtr
   8E86 F1            [10] 1131 	pop	af
   8E87 C1            [10] 1132 	pop	bc
   8E88 5E            [ 7] 1133 	ld	e,(hl)
   8E89 3E 02         [ 7] 1134 	ld	a,#0x02
   8E8B 93            [ 4] 1135 	sub	a, e
   8E8C DA 27 8F      [10] 1136 	jp	C,00131$
                           1137 ;src/main.c:280: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   8E8F DD 6E FC      [19] 1138 	ld	l,-4 (ix)
   8E92 DD 66 FD      [19] 1139 	ld	h,-3 (ix)
   8E95 7E            [ 7] 1140 	ld	a,(hl)
   8E96 C6 18         [ 7] 1141 	add	a, #0x18
   8E98 57            [ 4] 1142 	ld	d,a
   8E99 0A            [ 7] 1143 	ld	a,(bc)
   8E9A C6 04         [ 7] 1144 	add	a, #0x04
   8E9C C5            [11] 1145 	push	bc
   8E9D D5            [11] 1146 	push	de
   8E9E 33            [ 6] 1147 	inc	sp
   8E9F F5            [11] 1148 	push	af
   8EA0 33            [ 6] 1149 	inc	sp
   8EA1 CD 2F 8A      [17] 1150 	call	_getTilePtr
   8EA4 F1            [10] 1151 	pop	af
   8EA5 C1            [10] 1152 	pop	bc
   8EA6 5E            [ 7] 1153 	ld	e,(hl)
   8EA7 3E 02         [ 7] 1154 	ld	a,#0x02
   8EA9 93            [ 4] 1155 	sub	a, e
   8EAA 38 7B         [12] 1156 	jr	C,00131$
                           1157 ;src/main.c:282: if( (prota.x + G_HERO_W -4) < enemy->x || prota.x  > (enemy->x + G_ENEMY_W) ){
   8EAC 21 20 89      [10] 1158 	ld	hl, #_prota + 0
   8EAF 5E            [ 7] 1159 	ld	e,(hl)
   8EB0 16 00         [ 7] 1160 	ld	d,#0x00
   8EB2 21 03 00      [10] 1161 	ld	hl,#0x0003
   8EB5 19            [11] 1162 	add	hl,de
   8EB6 DD 75 FA      [19] 1163 	ld	-6 (ix),l
   8EB9 DD 74 FB      [19] 1164 	ld	-5 (ix),h
   8EBC 0A            [ 7] 1165 	ld	a,(bc)
   8EBD 4F            [ 4] 1166 	ld	c,a
   8EBE 06 00         [ 7] 1167 	ld	b,#0x00
   8EC0 DD 7E FA      [19] 1168 	ld	a,-6 (ix)
   8EC3 91            [ 4] 1169 	sub	a, c
   8EC4 DD 7E FB      [19] 1170 	ld	a,-5 (ix)
   8EC7 98            [ 4] 1171 	sbc	a, b
   8EC8 E2 CD 8E      [10] 1172 	jp	PO, 00198$
   8ECB EE 80         [ 7] 1173 	xor	a, #0x80
   8ECD                    1174 00198$:
   8ECD FA E0 8E      [10] 1175 	jp	M,00126$
   8ED0 03            [ 6] 1176 	inc	bc
   8ED1 03            [ 6] 1177 	inc	bc
   8ED2 03            [ 6] 1178 	inc	bc
   8ED3 03            [ 6] 1179 	inc	bc
   8ED4 79            [ 4] 1180 	ld	a,c
   8ED5 93            [ 4] 1181 	sub	a, e
   8ED6 78            [ 4] 1182 	ld	a,b
   8ED7 9A            [ 4] 1183 	sbc	a, d
   8ED8 E2 DD 8E      [10] 1184 	jp	PO, 00199$
   8EDB EE 80         [ 7] 1185 	xor	a, #0x80
   8EDD                    1186 00199$:
   8EDD F2 E6 8E      [10] 1187 	jp	P,00127$
   8EE0                    1188 00126$:
                           1189 ;src/main.c:283: colisiona = 0;
   8EE0 DD 36 F9 00   [19] 1190 	ld	-7 (ix),#0x00
   8EE4 18 49         [12] 1191 	jr	00135$
   8EE6                    1192 00127$:
                           1193 ;src/main.c:286: if(prota.y > enemy->y){ //si el prota esta abajo
   8EE6 21 21 89      [10] 1194 	ld	hl, #(_prota + 0x0001) + 0
   8EE9 4E            [ 7] 1195 	ld	c,(hl)
   8EEA DD 6E FC      [19] 1196 	ld	l,-4 (ix)
   8EED DD 66 FD      [19] 1197 	ld	h,-3 (ix)
   8EF0 5E            [ 7] 1198 	ld	e,(hl)
   8EF1 7B            [ 4] 1199 	ld	a,e
   8EF2 91            [ 4] 1200 	sub	a, c
   8EF3 30 2C         [12] 1201 	jr	NC,00124$
                           1202 ;src/main.c:287: if( prota.y - (enemy->y + G_ENEMY_H) > 2){ // si hay espacio entre el enemigo y el prota
   8EF5 06 00         [ 7] 1203 	ld	b,#0x00
   8EF7 16 00         [ 7] 1204 	ld	d,#0x00
   8EF9 21 16 00      [10] 1205 	ld	hl,#0x0016
   8EFC 19            [11] 1206 	add	hl,de
   8EFD 79            [ 4] 1207 	ld	a,c
   8EFE 95            [ 4] 1208 	sub	a, l
   8EFF 4F            [ 4] 1209 	ld	c,a
   8F00 78            [ 4] 1210 	ld	a,b
   8F01 9C            [ 4] 1211 	sbc	a, h
   8F02 47            [ 4] 1212 	ld	b,a
   8F03 3E 02         [ 7] 1213 	ld	a,#0x02
   8F05 B9            [ 4] 1214 	cp	a, c
   8F06 3E 00         [ 7] 1215 	ld	a,#0x00
   8F08 98            [ 4] 1216 	sbc	a, b
   8F09 E2 0E 8F      [10] 1217 	jp	PO, 00200$
   8F0C EE 80         [ 7] 1218 	xor	a, #0x80
   8F0E                    1219 00200$:
   8F0E F2 17 8F      [10] 1220 	jp	P,00121$
                           1221 ;src/main.c:288: colisiona = 0;
   8F11 DD 36 F9 00   [19] 1222 	ld	-7 (ix),#0x00
   8F15 18 18         [12] 1223 	jr	00135$
   8F17                    1224 00121$:
                           1225 ;src/main.c:291: enemy->mira = M_arriba;
   8F17 DD 6E FE      [19] 1226 	ld	l,-2 (ix)
   8F1A DD 66 FF      [19] 1227 	ld	h,-1 (ix)
   8F1D 36 02         [10] 1228 	ld	(hl),#0x02
   8F1F 18 0E         [12] 1229 	jr	00135$
   8F21                    1230 00124$:
                           1231 ;src/main.c:294: colisiona = 0;
   8F21 DD 36 F9 00   [19] 1232 	ld	-7 (ix),#0x00
   8F25 18 08         [12] 1233 	jr	00135$
   8F27                    1234 00131$:
                           1235 ;src/main.c:298: enemy->mira = M_arriba;
   8F27 DD 6E FE      [19] 1236 	ld	l,-2 (ix)
   8F2A DD 66 FF      [19] 1237 	ld	h,-1 (ix)
   8F2D 36 02         [10] 1238 	ld	(hl),#0x02
                           1239 ;src/main.c:301: }
   8F2F                    1240 00135$:
                           1241 ;src/main.c:302: return colisiona;
   8F2F DD 6E F9      [19] 1242 	ld	l,-7 (ix)
   8F32 DD F9         [10] 1243 	ld	sp, ix
   8F34 DD E1         [14] 1244 	pop	ix
   8F36 C9            [10] 1245 	ret
                           1246 ;src/main.c:305: void moverEnemigoArriba(TEnemy *enemy){
                           1247 ;	---------------------------------
                           1248 ; Function moverEnemigoArriba
                           1249 ; ---------------------------------
   8F37                    1250 _moverEnemigoArriba::
   8F37 DD E5         [15] 1251 	push	ix
   8F39 DD 21 00 00   [14] 1252 	ld	ix,#0
   8F3D DD 39         [15] 1253 	add	ix,sp
                           1254 ;src/main.c:306: enemy->y--;
   8F3F DD 4E 04      [19] 1255 	ld	c,4 (ix)
   8F42 DD 46 05      [19] 1256 	ld	b,5 (ix)
   8F45 69            [ 4] 1257 	ld	l, c
   8F46 60            [ 4] 1258 	ld	h, b
   8F47 23            [ 6] 1259 	inc	hl
   8F48 5E            [ 7] 1260 	ld	e,(hl)
   8F49 1D            [ 4] 1261 	dec	e
   8F4A 73            [ 7] 1262 	ld	(hl),e
                           1263 ;src/main.c:307: enemy->y--;
   8F4B 1D            [ 4] 1264 	dec	e
   8F4C 73            [ 7] 1265 	ld	(hl),e
                           1266 ;src/main.c:308: enemy->mover = SI;
   8F4D 21 06 00      [10] 1267 	ld	hl,#0x0006
   8F50 09            [11] 1268 	add	hl,bc
   8F51 36 01         [10] 1269 	ld	(hl),#0x01
   8F53 DD E1         [14] 1270 	pop	ix
   8F55 C9            [10] 1271 	ret
                           1272 ;src/main.c:311: void moverEnemigoAbajo(TEnemy *enemy){
                           1273 ;	---------------------------------
                           1274 ; Function moverEnemigoAbajo
                           1275 ; ---------------------------------
   8F56                    1276 _moverEnemigoAbajo::
   8F56 DD E5         [15] 1277 	push	ix
   8F58 DD 21 00 00   [14] 1278 	ld	ix,#0
   8F5C DD 39         [15] 1279 	add	ix,sp
                           1280 ;src/main.c:312: enemy->y++;
   8F5E DD 4E 04      [19] 1281 	ld	c,4 (ix)
   8F61 DD 46 05      [19] 1282 	ld	b,5 (ix)
   8F64 59            [ 4] 1283 	ld	e, c
   8F65 50            [ 4] 1284 	ld	d, b
   8F66 13            [ 6] 1285 	inc	de
   8F67 1A            [ 7] 1286 	ld	a,(de)
   8F68 3C            [ 4] 1287 	inc	a
   8F69 12            [ 7] 1288 	ld	(de),a
                           1289 ;src/main.c:313: enemy->y++;
   8F6A 3C            [ 4] 1290 	inc	a
   8F6B 12            [ 7] 1291 	ld	(de),a
                           1292 ;src/main.c:314: enemy->mover = SI;
   8F6C 21 06 00      [10] 1293 	ld	hl,#0x0006
   8F6F 09            [11] 1294 	add	hl,bc
   8F70 36 01         [10] 1295 	ld	(hl),#0x01
   8F72 DD E1         [14] 1296 	pop	ix
   8F74 C9            [10] 1297 	ret
                           1298 ;src/main.c:317: void moverEnemigo(TEnemy *enemy){
                           1299 ;	---------------------------------
                           1300 ; Function moverEnemigo
                           1301 ; ---------------------------------
   8F75                    1302 _moverEnemigo::
   8F75 DD E5         [15] 1303 	push	ix
   8F77 DD 21 00 00   [14] 1304 	ld	ix,#0
   8F7B DD 39         [15] 1305 	add	ix,sp
                           1306 ;src/main.c:318: if(!enemy->muerto){
   8F7D DD 4E 04      [19] 1307 	ld	c,4 (ix)
   8F80 DD 46 05      [19] 1308 	ld	b,5 (ix)
   8F83 C5            [11] 1309 	push	bc
   8F84 FD E1         [14] 1310 	pop	iy
   8F86 FD 7E 08      [19] 1311 	ld	a,8 (iy)
   8F89 B7            [ 4] 1312 	or	a, a
   8F8A 20 3C         [12] 1313 	jr	NZ,00110$
                           1314 ;src/main.c:319: if(!checkEnemyCollision(enemy->mira, enemy)){
   8F8C 21 07 00      [10] 1315 	ld	hl,#0x0007
   8F8F 09            [11] 1316 	add	hl,bc
   8F90 5E            [ 7] 1317 	ld	e,(hl)
   8F91 16 00         [ 7] 1318 	ld	d,#0x00
   8F93 E5            [11] 1319 	push	hl
   8F94 C5            [11] 1320 	push	bc
   8F95 C5            [11] 1321 	push	bc
   8F96 D5            [11] 1322 	push	de
   8F97 CD 1C 8D      [17] 1323 	call	_checkEnemyCollision
   8F9A F1            [10] 1324 	pop	af
   8F9B F1            [10] 1325 	pop	af
   8F9C 7D            [ 4] 1326 	ld	a,l
   8F9D C1            [10] 1327 	pop	bc
   8F9E E1            [10] 1328 	pop	hl
   8F9F B7            [ 4] 1329 	or	a, a
   8FA0 20 26         [12] 1330 	jr	NZ,00110$
                           1331 ;src/main.c:321: switch (enemy->mira) {
   8FA2 5E            [ 7] 1332 	ld	e,(hl)
   8FA3 3E 03         [ 7] 1333 	ld	a,#0x03
   8FA5 93            [ 4] 1334 	sub	a, e
   8FA6 38 20         [12] 1335 	jr	C,00110$
   8FA8 16 00         [ 7] 1336 	ld	d,#0x00
   8FAA 21 B0 8F      [10] 1337 	ld	hl,#00124$
   8FAD 19            [11] 1338 	add	hl,de
   8FAE 19            [11] 1339 	add	hl,de
                           1340 ;src/main.c:323: case 0:
                           1341 ;src/main.c:325: break;
                           1342 ;src/main.c:326: case 1:
                           1343 ;src/main.c:328: break;
                           1344 ;src/main.c:329: case 2:
   8FAF E9            [ 4] 1345 	jp	(hl)
   8FB0                    1346 00124$:
   8FB0 18 16         [12] 1347 	jr	00110$
   8FB2 18 14         [12] 1348 	jr	00110$
   8FB4 18 06         [12] 1349 	jr	00103$
   8FB6 18 0B         [12] 1350 	jr	00104$
   8FB8 18 0E         [12] 1351 	jr	00110$
   8FBA 18 0C         [12] 1352 	jr	00110$
   8FBC                    1353 00103$:
                           1354 ;src/main.c:330: moverEnemigoArriba(enemy);
   8FBC C5            [11] 1355 	push	bc
   8FBD CD 37 8F      [17] 1356 	call	_moverEnemigoArriba
   8FC0 F1            [10] 1357 	pop	af
                           1358 ;src/main.c:331: break;
   8FC1 18 05         [12] 1359 	jr	00110$
                           1360 ;src/main.c:332: case 3:
   8FC3                    1361 00104$:
                           1362 ;src/main.c:333: moverEnemigoAbajo(enemy);
   8FC3 C5            [11] 1363 	push	bc
   8FC4 CD 56 8F      [17] 1364 	call	_moverEnemigoAbajo
   8FC7 F1            [10] 1365 	pop	af
                           1366 ;src/main.c:335: }
   8FC8                    1367 00110$:
   8FC8 DD E1         [14] 1368 	pop	ix
   8FCA C9            [10] 1369 	ret
                           1370 ;src/main.c:341: void patrolDecision(TEnemy *enemy) { // o devuelve direccion o le pasamos un enemigo y lo mueve
                           1371 ;	---------------------------------
                           1372 ; Function patrolDecision
                           1373 ; ---------------------------------
   8FCB                    1374 _patrolDecision::
                           1375 ;src/main.c:342: u8 decision = cpct_getRandom_mxor_u8() % 4;
   8FCB CD 71 87      [17] 1376 	call	_cpct_getRandom_mxor_u8
   8FCE 7D            [ 4] 1377 	ld	a,l
   8FCF E6 03         [ 7] 1378 	and	a, #0x03
   8FD1 5F            [ 4] 1379 	ld	e,a
                           1380 ;src/main.c:344: switch (decision) {
   8FD2 3E 03         [ 7] 1381 	ld	a,#0x03
   8FD4 93            [ 4] 1382 	sub	a, e
   8FD5 D8            [11] 1383 	ret	C
   8FD6 16 00         [ 7] 1384 	ld	d,#0x00
   8FD8 21 DE 8F      [10] 1385 	ld	hl,#00112$
   8FDB 19            [11] 1386 	add	hl,de
   8FDC 19            [11] 1387 	add	hl,de
                           1388 ;src/main.c:345: case 0:
   8FDD E9            [ 4] 1389 	jp	(hl)
   8FDE                    1390 00112$:
   8FDE 18 06         [12] 1391 	jr	00101$
   8FE0 18 0D         [12] 1392 	jr	00106$
   8FE2 18 0B         [12] 1393 	jr	00106$
   8FE4 18 09         [12] 1394 	jr	00104$
   8FE6                    1395 00101$:
                           1396 ;src/main.c:346: moverEnemigoAbajo(enemy);
   8FE6 C1            [10] 1397 	pop	bc
   8FE7 E1            [10] 1398 	pop	hl
   8FE8 E5            [11] 1399 	push	hl
   8FE9 C5            [11] 1400 	push	bc
   8FEA E5            [11] 1401 	push	hl
   8FEB CD 56 8F      [17] 1402 	call	_moverEnemigoAbajo
   8FEE F1            [10] 1403 	pop	af
                           1404 ;src/main.c:347: break;
                           1405 ;src/main.c:348: case 1:
                           1406 ;src/main.c:349: break;
                           1407 ;src/main.c:350: case 2:
                           1408 ;src/main.c:351: break;
                           1409 ;src/main.c:352: case 3:
                           1410 ;src/main.c:354: }
   8FEF                    1411 00104$:
   8FEF                    1412 00106$:
   8FEF C9            [10] 1413 	ret
                           1414 ;src/main.c:357: void avanzarMapa() {
                           1415 ;	---------------------------------
                           1416 ; Function avanzarMapa
                           1417 ; ---------------------------------
   8FF0                    1418 _avanzarMapa::
                           1419 ;src/main.c:358: if(num_mapa < NUM_MAPAS -1) {
   8FF0 3A 34 89      [13] 1420 	ld	a,(#_num_mapa + 0)
   8FF3 D6 02         [ 7] 1421 	sub	a, #0x02
   8FF5 D2 E4 89      [10] 1422 	jp	NC,_menuFin
                           1423 ;src/main.c:359: mapa = mapas[++num_mapa];
   8FF8 21 34 89      [10] 1424 	ld	hl, #_num_mapa+0
   8FFB 34            [11] 1425 	inc	(hl)
   8FFC FD 21 34 89   [14] 1426 	ld	iy,#_num_mapa
   9000 FD 6E 00      [19] 1427 	ld	l,0 (iy)
   9003 26 00         [ 7] 1428 	ld	h,#0x00
   9005 29            [11] 1429 	add	hl, hl
   9006 11 4B 89      [10] 1430 	ld	de,#_mapas
   9009 19            [11] 1431 	add	hl,de
   900A 7E            [ 7] 1432 	ld	a,(hl)
   900B FD 21 32 89   [14] 1433 	ld	iy,#_mapa
   900F FD 77 00      [19] 1434 	ld	0 (iy),a
   9012 23            [ 6] 1435 	inc	hl
   9013 7E            [ 7] 1436 	ld	a,(hl)
   9014 32 33 89      [13] 1437 	ld	(#_mapa + 1),a
                           1438 ;src/main.c:360: prota.x = prota.px = 2;
   9017 21 22 89      [10] 1439 	ld	hl,#(_prota + 0x0002)
   901A 36 02         [10] 1440 	ld	(hl),#0x02
   901C 21 20 89      [10] 1441 	ld	hl,#_prota
   901F 36 02         [10] 1442 	ld	(hl),#0x02
                           1443 ;src/main.c:361: prota.mover = SI;
   9021 21 26 89      [10] 1444 	ld	hl,#(_prota + 0x0006)
                           1445 ;src/main.c:362: dibujarMapa();
                           1446 ;src/main.c:366: menuFin();
   9024 36 01         [10] 1447 	ld	(hl), #0x01
   9026 C3 35 89      [10] 1448 	jp	_dibujarMapa
                           1449 ;src/main.c:370: void moverIzquierda() {
                           1450 ;	---------------------------------
                           1451 ; Function moverIzquierda
                           1452 ; ---------------------------------
   9029                    1453 _moverIzquierda::
                           1454 ;src/main.c:371: prota.mira = M_izquierda;
   9029 01 20 89      [10] 1455 	ld	bc,#_prota+0
   902C 21 27 89      [10] 1456 	ld	hl,#(_prota + 0x0007)
   902F 36 01         [10] 1457 	ld	(hl),#0x01
                           1458 ;src/main.c:372: if (!checkCollision(M_izquierda)) {
   9031 C5            [11] 1459 	push	bc
   9032 21 01 00      [10] 1460 	ld	hl,#0x0001
   9035 E5            [11] 1461 	push	hl
   9036 CD 57 8A      [17] 1462 	call	_checkCollision
   9039 F1            [10] 1463 	pop	af
   903A C1            [10] 1464 	pop	bc
   903B 7D            [ 4] 1465 	ld	a,l
   903C B7            [ 4] 1466 	or	a, a
   903D C0            [11] 1467 	ret	NZ
                           1468 ;src/main.c:373: prota.x--;
   903E 0A            [ 7] 1469 	ld	a,(bc)
   903F C6 FF         [ 7] 1470 	add	a,#0xFF
   9041 02            [ 7] 1471 	ld	(bc),a
                           1472 ;src/main.c:374: prota.mover = SI;
   9042 21 26 89      [10] 1473 	ld	hl,#(_prota + 0x0006)
   9045 36 01         [10] 1474 	ld	(hl),#0x01
                           1475 ;src/main.c:375: prota.sprite = g_hero_left;
   9047 21 FE 79      [10] 1476 	ld	hl,#_g_hero_left
   904A 22 24 89      [16] 1477 	ld	((_prota + 0x0004)), hl
   904D C9            [10] 1478 	ret
                           1479 ;src/main.c:379: void moverDerecha() {
                           1480 ;	---------------------------------
                           1481 ; Function moverDerecha
                           1482 ; ---------------------------------
   904E                    1483 _moverDerecha::
                           1484 ;src/main.c:380: prota.mira = M_derecha;
   904E 21 27 89      [10] 1485 	ld	hl,#(_prota + 0x0007)
   9051 36 00         [10] 1486 	ld	(hl),#0x00
                           1487 ;src/main.c:381: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   9053 21 00 00      [10] 1488 	ld	hl,#0x0000
   9056 E5            [11] 1489 	push	hl
   9057 CD 57 8A      [17] 1490 	call	_checkCollision
   905A F1            [10] 1491 	pop	af
   905B 45            [ 4] 1492 	ld	b,l
   905C 21 20 89      [10] 1493 	ld	hl, #_prota + 0
   905F 4E            [ 7] 1494 	ld	c,(hl)
   9060 59            [ 4] 1495 	ld	e,c
   9061 16 00         [ 7] 1496 	ld	d,#0x00
   9063 21 07 00      [10] 1497 	ld	hl,#0x0007
   9066 19            [11] 1498 	add	hl,de
   9067 11 50 80      [10] 1499 	ld	de, #0x8050
   906A 29            [11] 1500 	add	hl, hl
   906B 3F            [ 4] 1501 	ccf
   906C CB 1C         [ 8] 1502 	rr	h
   906E CB 1D         [ 8] 1503 	rr	l
   9070 ED 52         [15] 1504 	sbc	hl, de
   9072 3E 00         [ 7] 1505 	ld	a,#0x00
   9074 17            [ 4] 1506 	rla
   9075 5F            [ 4] 1507 	ld	e,a
   9076 78            [ 4] 1508 	ld	a,b
   9077 B7            [ 4] 1509 	or	a,a
   9078 20 14         [12] 1510 	jr	NZ,00104$
   907A B3            [ 4] 1511 	or	a,e
   907B 28 11         [12] 1512 	jr	Z,00104$
                           1513 ;src/main.c:382: prota.x++;
   907D 0C            [ 4] 1514 	inc	c
   907E 21 20 89      [10] 1515 	ld	hl,#_prota
   9081 71            [ 7] 1516 	ld	(hl),c
                           1517 ;src/main.c:383: prota.mover = SI;
   9082 21 26 89      [10] 1518 	ld	hl,#(_prota + 0x0006)
   9085 36 01         [10] 1519 	ld	(hl),#0x01
                           1520 ;src/main.c:384: prota.sprite = g_hero;
   9087 21 A8 7A      [10] 1521 	ld	hl,#_g_hero
   908A 22 24 89      [16] 1522 	ld	((_prota + 0x0004)), hl
   908D C9            [10] 1523 	ret
   908E                    1524 00104$:
                           1525 ;src/main.c:386: }else if( prota.x + G_HERO_W >= 80){
   908E 7B            [ 4] 1526 	ld	a,e
   908F B7            [ 4] 1527 	or	a, a
   9090 C0            [11] 1528 	ret	NZ
                           1529 ;src/main.c:387: avanzarMapa();
   9091 C3 F0 8F      [10] 1530 	jp  _avanzarMapa
                           1531 ;src/main.c:391: void moverArriba() {
                           1532 ;	---------------------------------
                           1533 ; Function moverArriba
                           1534 ; ---------------------------------
   9094                    1535 _moverArriba::
                           1536 ;src/main.c:392: prota.mira = M_arriba;
   9094 21 27 89      [10] 1537 	ld	hl,#(_prota + 0x0007)
   9097 36 02         [10] 1538 	ld	(hl),#0x02
                           1539 ;src/main.c:393: if (!checkCollision(M_arriba) && (prota.y >= 0)) { // TODO: COMPROBAR
   9099 21 02 00      [10] 1540 	ld	hl,#0x0002
   909C E5            [11] 1541 	push	hl
   909D CD 57 8A      [17] 1542 	call	_checkCollision
   90A0 F1            [10] 1543 	pop	af
   90A1 7D            [ 4] 1544 	ld	a,l
   90A2 B7            [ 4] 1545 	or	a, a
   90A3 C0            [11] 1546 	ret	NZ
                           1547 ;src/main.c:394: prota.y--;
   90A4 21 21 89      [10] 1548 	ld	hl,#_prota + 1
   90A7 4E            [ 7] 1549 	ld	c,(hl)
   90A8 0D            [ 4] 1550 	dec	c
   90A9 71            [ 7] 1551 	ld	(hl),c
                           1552 ;src/main.c:395: prota.y--;
   90AA 0D            [ 4] 1553 	dec	c
   90AB 71            [ 7] 1554 	ld	(hl),c
                           1555 ;src/main.c:396: prota.mover  = SI;
   90AC 21 26 89      [10] 1556 	ld	hl,#(_prota + 0x0006)
   90AF 36 01         [10] 1557 	ld	(hl),#0x01
                           1558 ;src/main.c:397: prota.sprite = g_hero_up;
   90B1 21 64 79      [10] 1559 	ld	hl,#_g_hero_up
   90B4 22 24 89      [16] 1560 	ld	((_prota + 0x0004)), hl
   90B7 C9            [10] 1561 	ret
                           1562 ;src/main.c:401: void moverAbajo() {
                           1563 ;	---------------------------------
                           1564 ; Function moverAbajo
                           1565 ; ---------------------------------
   90B8                    1566 _moverAbajo::
                           1567 ;src/main.c:402: prota.mira = M_abajo;
   90B8 21 27 89      [10] 1568 	ld	hl,#(_prota + 0x0007)
   90BB 36 03         [10] 1569 	ld	(hl),#0x03
                           1570 ;src/main.c:403: if (!checkCollision(M_abajo) && (prota.y + G_HERO_H < ALTO_MAPA)) { // TODO: COMPROBAR
   90BD 21 03 00      [10] 1571 	ld	hl,#0x0003
   90C0 E5            [11] 1572 	push	hl
   90C1 CD 57 8A      [17] 1573 	call	_checkCollision
   90C4 F1            [10] 1574 	pop	af
   90C5 7D            [ 4] 1575 	ld	a,l
   90C6 B7            [ 4] 1576 	or	a, a
   90C7 C0            [11] 1577 	ret	NZ
   90C8 01 21 89      [10] 1578 	ld	bc,#_prota + 1
   90CB 0A            [ 7] 1579 	ld	a,(bc)
   90CC 5F            [ 4] 1580 	ld	e,a
   90CD 6B            [ 4] 1581 	ld	l,e
   90CE 26 00         [ 7] 1582 	ld	h,#0x00
   90D0 D5            [11] 1583 	push	de
   90D1 11 16 00      [10] 1584 	ld	de,#0x0016
   90D4 19            [11] 1585 	add	hl, de
   90D5 D1            [10] 1586 	pop	de
   90D6 7D            [ 4] 1587 	ld	a,l
   90D7 D6 B0         [ 7] 1588 	sub	a, #0xB0
   90D9 7C            [ 4] 1589 	ld	a,h
   90DA 17            [ 4] 1590 	rla
   90DB 3F            [ 4] 1591 	ccf
   90DC 1F            [ 4] 1592 	rra
   90DD DE 80         [ 7] 1593 	sbc	a, #0x80
   90DF D0            [11] 1594 	ret	NC
                           1595 ;src/main.c:404: prota.y++;
   90E0 7B            [ 4] 1596 	ld	a,e
   90E1 3C            [ 4] 1597 	inc	a
   90E2 02            [ 7] 1598 	ld	(bc),a
                           1599 ;src/main.c:405: prota.y++;
   90E3 3C            [ 4] 1600 	inc	a
   90E4 02            [ 7] 1601 	ld	(bc),a
                           1602 ;src/main.c:406: prota.mover  = SI;
   90E5 21 26 89      [10] 1603 	ld	hl,#(_prota + 0x0006)
   90E8 36 01         [10] 1604 	ld	(hl),#0x01
                           1605 ;src/main.c:407: prota.sprite = g_hero_down;
   90EA 21 CA 78      [10] 1606 	ld	hl,#_g_hero_down
   90ED 22 24 89      [16] 1607 	ld	((_prota + 0x0004)), hl
   90F0 C9            [10] 1608 	ret
                           1609 ;src/main.c:411: void dibujarCuchillo() {
                           1610 ;	---------------------------------
                           1611 ; Function dibujarCuchillo
                           1612 ; ---------------------------------
   90F1                    1613 _dibujarCuchillo::
   90F1 DD E5         [15] 1614 	push	ix
   90F3 DD 21 00 00   [14] 1615 	ld	ix,#0
   90F7 DD 39         [15] 1616 	add	ix,sp
   90F9 F5            [11] 1617 	push	af
                           1618 ;src/main.c:412: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   90FA 21 29 89      [10] 1619 	ld	hl, #_cu + 1
   90FD 56            [ 7] 1620 	ld	d,(hl)
   90FE 21 28 89      [10] 1621 	ld	hl, #_cu + 0
   9101 46            [ 7] 1622 	ld	b,(hl)
   9102 D5            [11] 1623 	push	de
   9103 33            [ 6] 1624 	inc	sp
   9104 C5            [11] 1625 	push	bc
   9105 33            [ 6] 1626 	inc	sp
   9106 21 00 C0      [10] 1627 	ld	hl,#0xC000
   9109 E5            [11] 1628 	push	hl
   910A CD 70 88      [17] 1629 	call	_cpct_getScreenPtr
   910D 45            [ 4] 1630 	ld	b,l
   910E 5C            [ 4] 1631 	ld	e,h
                           1632 ;src/main.c:413: if(cu.eje == E_X){
   910F 21 30 89      [10] 1633 	ld	hl, #_cu + 8
   9112 4E            [ 7] 1634 	ld	c,(hl)
                           1635 ;src/main.c:414: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   9113 DD 70 FE      [19] 1636 	ld	-2 (ix),b
   9116 DD 73 FF      [19] 1637 	ld	-1 (ix),e
                           1638 ;src/main.c:413: if(cu.eje == E_X){
   9119 79            [ 4] 1639 	ld	a,c
   911A B7            [ 4] 1640 	or	a, a
   911B 20 19         [12] 1641 	jr	NZ,00104$
                           1642 ;src/main.c:414: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   911D 11 00 3E      [10] 1643 	ld	de,#_g_tablatrans+0
   9120 ED 4B 2C 89   [20] 1644 	ld	bc, (#(_cu + 0x0004) + 0)
   9124 D5            [11] 1645 	push	de
   9125 21 04 04      [10] 1646 	ld	hl,#0x0404
   9128 E5            [11] 1647 	push	hl
   9129 DD 6E FE      [19] 1648 	ld	l,-2 (ix)
   912C DD 66 FF      [19] 1649 	ld	h,-1 (ix)
   912F E5            [11] 1650 	push	hl
   9130 C5            [11] 1651 	push	bc
   9131 CD 90 88      [17] 1652 	call	_cpct_drawSpriteMaskedAlignedTable
   9134 18 1A         [12] 1653 	jr	00106$
   9136                    1654 00104$:
                           1655 ;src/main.c:417: else if(cu.eje == E_Y){
   9136 0D            [ 4] 1656 	dec	c
   9137 20 17         [12] 1657 	jr	NZ,00106$
                           1658 ;src/main.c:418: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   9139 11 00 3E      [10] 1659 	ld	de,#_g_tablatrans+0
   913C ED 4B 2C 89   [20] 1660 	ld	bc, (#(_cu + 0x0004) + 0)
   9140 D5            [11] 1661 	push	de
   9141 21 02 08      [10] 1662 	ld	hl,#0x0802
   9144 E5            [11] 1663 	push	hl
   9145 DD 6E FE      [19] 1664 	ld	l,-2 (ix)
   9148 DD 66 FF      [19] 1665 	ld	h,-1 (ix)
   914B E5            [11] 1666 	push	hl
   914C C5            [11] 1667 	push	bc
   914D CD 90 88      [17] 1668 	call	_cpct_drawSpriteMaskedAlignedTable
   9150                    1669 00106$:
   9150 DD F9         [10] 1670 	ld	sp, ix
   9152 DD E1         [14] 1671 	pop	ix
   9154 C9            [10] 1672 	ret
                           1673 ;src/main.c:422: void borrarCuchillo() {
                           1674 ;	---------------------------------
                           1675 ; Function borrarCuchillo
                           1676 ; ---------------------------------
   9155                    1677 _borrarCuchillo::
   9155 DD E5         [15] 1678 	push	ix
   9157 DD 21 00 00   [14] 1679 	ld	ix,#0
   915B DD 39         [15] 1680 	add	ix,sp
   915D 3B            [ 6] 1681 	dec	sp
                           1682 ;src/main.c:424: u8 w = 2 + (cu.px & 1);
   915E 21 2A 89      [10] 1683 	ld	hl, #_cu + 2
   9161 4E            [ 7] 1684 	ld	c,(hl)
   9162 79            [ 4] 1685 	ld	a,c
   9163 E6 01         [ 7] 1686 	and	a, #0x01
   9165 47            [ 4] 1687 	ld	b,a
   9166 04            [ 4] 1688 	inc	b
   9167 04            [ 4] 1689 	inc	b
                           1690 ;src/main.c:425: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   9168 21 2B 89      [10] 1691 	ld	hl, #_cu + 3
   916B 5E            [ 7] 1692 	ld	e,(hl)
   916C 7B            [ 4] 1693 	ld	a,e
   916D E6 03         [ 7] 1694 	and	a, #0x03
   916F 28 04         [12] 1695 	jr	Z,00105$
   9171 3E 01         [ 7] 1696 	ld	a,#0x01
   9173 18 02         [12] 1697 	jr	00106$
   9175                    1698 00105$:
   9175 3E 00         [ 7] 1699 	ld	a,#0x00
   9177                    1700 00106$:
   9177 C6 02         [ 7] 1701 	add	a, #0x02
   9179 DD 77 FF      [19] 1702 	ld	-1 (ix),a
                           1703 ;src/main.c:426: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   917C FD 2A 32 89   [20] 1704 	ld	iy,(_mapa)
   9180 16 00         [ 7] 1705 	ld	d,#0x00
   9182 63            [ 4] 1706 	ld	h,e
   9183 6A            [ 4] 1707 	ld	l,d
   9184 CB 7A         [ 8] 1708 	bit	7, d
   9186 28 05         [12] 1709 	jr	Z,00107$
   9188 13            [ 6] 1710 	inc	de
   9189 13            [ 6] 1711 	inc	de
   918A 13            [ 6] 1712 	inc	de
   918B 63            [ 4] 1713 	ld	h,e
   918C 6A            [ 4] 1714 	ld	l,d
   918D                    1715 00107$:
   918D 5C            [ 4] 1716 	ld	e, h
   918E 55            [ 4] 1717 	ld	d, l
   918F CB 2A         [ 8] 1718 	sra	d
   9191 CB 1B         [ 8] 1719 	rr	e
   9193 CB 2A         [ 8] 1720 	sra	d
   9195 CB 1B         [ 8] 1721 	rr	e
   9197 51            [ 4] 1722 	ld	d,c
   9198 CB 3A         [ 8] 1723 	srl	d
   919A FD E5         [15] 1724 	push	iy
   919C 21 00 C0      [10] 1725 	ld	hl,#0xC000
   919F E5            [11] 1726 	push	hl
   91A0 3E 28         [ 7] 1727 	ld	a,#0x28
   91A2 F5            [11] 1728 	push	af
   91A3 33            [ 6] 1729 	inc	sp
   91A4 DD 7E FF      [19] 1730 	ld	a,-1 (ix)
   91A7 F5            [11] 1731 	push	af
   91A8 33            [ 6] 1732 	inc	sp
   91A9 C5            [11] 1733 	push	bc
   91AA 33            [ 6] 1734 	inc	sp
   91AB 7B            [ 4] 1735 	ld	a,e
   91AC F5            [11] 1736 	push	af
   91AD 33            [ 6] 1737 	inc	sp
   91AE D5            [11] 1738 	push	de
   91AF 33            [ 6] 1739 	inc	sp
   91B0 CD 44 7D      [17] 1740 	call	_cpct_etm_drawTileBox2x4
                           1741 ;src/main.c:427: if(!cu.mover){
   91B3 3A 31 89      [13] 1742 	ld	a, (#_cu + 9)
   91B6 B7            [ 4] 1743 	or	a, a
   91B7 20 05         [12] 1744 	jr	NZ,00103$
                           1745 ;src/main.c:428: cu.lanzado = NO;
   91B9 21 2E 89      [10] 1746 	ld	hl,#(_cu + 0x0006)
   91BC 36 00         [10] 1747 	ld	(hl),#0x00
   91BE                    1748 00103$:
   91BE 33            [ 6] 1749 	inc	sp
   91BF DD E1         [14] 1750 	pop	ix
   91C1 C9            [10] 1751 	ret
                           1752 ;src/main.c:432: void redibujarCuchillo( ) {
                           1753 ;	---------------------------------
                           1754 ; Function redibujarCuchillo
                           1755 ; ---------------------------------
   91C2                    1756 _redibujarCuchillo::
                           1757 ;src/main.c:433: borrarCuchillo();
   91C2 CD 55 91      [17] 1758 	call	_borrarCuchillo
                           1759 ;src/main.c:434: cu.px = cu.x;
   91C5 01 2A 89      [10] 1760 	ld	bc,#_cu + 2
   91C8 3A 28 89      [13] 1761 	ld	a, (#_cu + 0)
   91CB 02            [ 7] 1762 	ld	(bc),a
                           1763 ;src/main.c:435: cu.py = cu.y;
   91CC 01 2B 89      [10] 1764 	ld	bc,#_cu + 3
   91CF 3A 29 89      [13] 1765 	ld	a, (#_cu + 1)
   91D2 02            [ 7] 1766 	ld	(bc),a
                           1767 ;src/main.c:436: dibujarCuchillo();
   91D3 C3 F1 90      [10] 1768 	jp  _dibujarCuchillo
                           1769 ;src/main.c:440: void lanzarCuchillo(){
                           1770 ;	---------------------------------
                           1771 ; Function lanzarCuchillo
                           1772 ; ---------------------------------
   91D6                    1773 _lanzarCuchillo::
                           1774 ;src/main.c:442: if(!cu.lanzado){
   91D6 3A 2E 89      [13] 1775 	ld	a, (#(_cu + 0x0006) + 0)
   91D9 B7            [ 4] 1776 	or	a, a
   91DA C0            [11] 1777 	ret	NZ
                           1778 ;src/main.c:444: if(prota.mira == M_derecha){
   91DB 21 27 89      [10] 1779 	ld	hl, #_prota + 7
   91DE 5E            [ 7] 1780 	ld	e,(hl)
                           1781 ;src/main.c:445: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   91DF 01 21 89      [10] 1782 	ld	bc,#_prota + 1
                           1783 ;src/main.c:447: cu.direccion = M_derecha;
                           1784 ;src/main.c:449: cu.y=prota.y + G_HERO_H /2;
                           1785 ;src/main.c:450: cu.sprite=g_knifeX_0;
                           1786 ;src/main.c:451: cu.eje = E_X;
                           1787 ;src/main.c:444: if(prota.mira == M_derecha){
   91E2 7B            [ 4] 1788 	ld	a,e
   91E3 B7            [ 4] 1789 	or	a, a
   91E4 20 41         [12] 1790 	jr	NZ,00118$
                           1791 ;src/main.c:445: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   91E6 0A            [ 7] 1792 	ld	a,(bc)
   91E7 C6 0B         [ 7] 1793 	add	a, #0x0B
   91E9 5F            [ 4] 1794 	ld	e,a
   91EA 3A 20 89      [13] 1795 	ld	a, (#_prota + 0)
   91ED C6 0C         [ 7] 1796 	add	a, #0x0C
   91EF 6F            [ 4] 1797 	ld	l,a
   91F0 C5            [11] 1798 	push	bc
   91F1 7B            [ 4] 1799 	ld	a,e
   91F2 F5            [11] 1800 	push	af
   91F3 33            [ 6] 1801 	inc	sp
   91F4 7D            [ 4] 1802 	ld	a,l
   91F5 F5            [11] 1803 	push	af
   91F6 33            [ 6] 1804 	inc	sp
   91F7 CD 2F 8A      [17] 1805 	call	_getTilePtr
   91FA F1            [10] 1806 	pop	af
   91FB C1            [10] 1807 	pop	bc
   91FC 5E            [ 7] 1808 	ld	e,(hl)
   91FD 3E 02         [ 7] 1809 	ld	a,#0x02
   91FF 93            [ 4] 1810 	sub	a, e
   9200 D8            [11] 1811 	ret	C
                           1812 ;src/main.c:446: cu.lanzado = SI;
   9201 21 2E 89      [10] 1813 	ld	hl,#(_cu + 0x0006)
   9204 36 01         [10] 1814 	ld	(hl),#0x01
                           1815 ;src/main.c:447: cu.direccion = M_derecha;
   9206 21 2F 89      [10] 1816 	ld	hl,#(_cu + 0x0007)
   9209 36 00         [10] 1817 	ld	(hl),#0x00
                           1818 ;src/main.c:448: cu.x=prota.x + G_HERO_W;
   920B 3A 20 89      [13] 1819 	ld	a, (#_prota + 0)
   920E C6 07         [ 7] 1820 	add	a, #0x07
   9210 32 28 89      [13] 1821 	ld	(#_cu),a
                           1822 ;src/main.c:449: cu.y=prota.y + G_HERO_H /2;
   9213 0A            [ 7] 1823 	ld	a,(bc)
   9214 C6 0B         [ 7] 1824 	add	a, #0x0B
   9216 32 29 89      [13] 1825 	ld	(#(_cu + 0x0001)),a
                           1826 ;src/main.c:450: cu.sprite=g_knifeX_0;
   9219 21 C0 54      [10] 1827 	ld	hl,#_g_knifeX_0
   921C 22 2C 89      [16] 1828 	ld	((_cu + 0x0004)), hl
                           1829 ;src/main.c:451: cu.eje = E_X;
   921F 21 30 89      [10] 1830 	ld	hl,#(_cu + 0x0008)
   9222 36 00         [10] 1831 	ld	(hl),#0x00
                           1832 ;src/main.c:452: dibujarCuchillo();
   9224 C3 F1 90      [10] 1833 	jp  _dibujarCuchillo
   9227                    1834 00118$:
                           1835 ;src/main.c:455: else if(prota.mira == M_izquierda){
   9227 7B            [ 4] 1836 	ld	a,e
   9228 3D            [ 4] 1837 	dec	a
   9229 20 41         [12] 1838 	jr	NZ,00115$
                           1839 ;src/main.c:456: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   922B 0A            [ 7] 1840 	ld	a,(bc)
   922C C6 0B         [ 7] 1841 	add	a, #0x0B
   922E 5F            [ 4] 1842 	ld	e,a
   922F 3A 20 89      [13] 1843 	ld	a, (#_prota + 0)
   9232 C6 F6         [ 7] 1844 	add	a,#0xF6
   9234 6F            [ 4] 1845 	ld	l,a
   9235 C5            [11] 1846 	push	bc
   9236 7B            [ 4] 1847 	ld	a,e
   9237 F5            [11] 1848 	push	af
   9238 33            [ 6] 1849 	inc	sp
   9239 7D            [ 4] 1850 	ld	a,l
   923A F5            [11] 1851 	push	af
   923B 33            [ 6] 1852 	inc	sp
   923C CD 2F 8A      [17] 1853 	call	_getTilePtr
   923F F1            [10] 1854 	pop	af
   9240 C1            [10] 1855 	pop	bc
   9241 5E            [ 7] 1856 	ld	e,(hl)
   9242 3E 02         [ 7] 1857 	ld	a,#0x02
   9244 93            [ 4] 1858 	sub	a, e
   9245 D8            [11] 1859 	ret	C
                           1860 ;src/main.c:457: cu.lanzado = SI;
   9246 21 2E 89      [10] 1861 	ld	hl,#(_cu + 0x0006)
   9249 36 01         [10] 1862 	ld	(hl),#0x01
                           1863 ;src/main.c:458: cu.direccion = M_izquierda;
   924B 21 2F 89      [10] 1864 	ld	hl,#(_cu + 0x0007)
   924E 36 01         [10] 1865 	ld	(hl),#0x01
                           1866 ;src/main.c:459: cu.x = prota.x - G_KNIFEX_0_W;
   9250 3A 20 89      [13] 1867 	ld	a, (#_prota + 0)
   9253 C6 FC         [ 7] 1868 	add	a,#0xFC
   9255 32 28 89      [13] 1869 	ld	(#_cu),a
                           1870 ;src/main.c:460: cu.y = prota.y + G_HERO_H /2;
   9258 0A            [ 7] 1871 	ld	a,(bc)
   9259 C6 0B         [ 7] 1872 	add	a, #0x0B
   925B 32 29 89      [13] 1873 	ld	(#(_cu + 0x0001)),a
                           1874 ;src/main.c:461: cu.sprite = g_knifeX_1;
   925E 21 D0 54      [10] 1875 	ld	hl,#_g_knifeX_1
   9261 22 2C 89      [16] 1876 	ld	((_cu + 0x0004)), hl
                           1877 ;src/main.c:462: cu.eje = E_X;
   9264 21 30 89      [10] 1878 	ld	hl,#(_cu + 0x0008)
   9267 36 00         [10] 1879 	ld	(hl),#0x00
                           1880 ;src/main.c:463: dibujarCuchillo();
   9269 C3 F1 90      [10] 1881 	jp  _dibujarCuchillo
   926C                    1882 00115$:
                           1883 ;src/main.c:466: else if(prota.mira == M_abajo){
   926C 7B            [ 4] 1884 	ld	a,e
   926D D6 03         [ 7] 1885 	sub	a, #0x03
   926F 20 41         [12] 1886 	jr	NZ,00112$
                           1887 ;src/main.c:468: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   9271 0A            [ 7] 1888 	ld	a,(bc)
   9272 C6 1F         [ 7] 1889 	add	a, #0x1F
   9274 5F            [ 4] 1890 	ld	e,a
   9275 3A 20 89      [13] 1891 	ld	a, (#_prota + 0)
   9278 57            [ 4] 1892 	ld	d,a
   9279 14            [ 4] 1893 	inc	d
   927A 14            [ 4] 1894 	inc	d
   927B 14            [ 4] 1895 	inc	d
   927C C5            [11] 1896 	push	bc
   927D 7B            [ 4] 1897 	ld	a,e
   927E F5            [11] 1898 	push	af
   927F 33            [ 6] 1899 	inc	sp
   9280 D5            [11] 1900 	push	de
   9281 33            [ 6] 1901 	inc	sp
   9282 CD 2F 8A      [17] 1902 	call	_getTilePtr
   9285 F1            [10] 1903 	pop	af
   9286 C1            [10] 1904 	pop	bc
   9287 5E            [ 7] 1905 	ld	e,(hl)
   9288 3E 02         [ 7] 1906 	ld	a,#0x02
   928A 93            [ 4] 1907 	sub	a, e
   928B D8            [11] 1908 	ret	C
                           1909 ;src/main.c:469: cu.lanzado = SI;
   928C 21 2E 89      [10] 1910 	ld	hl,#(_cu + 0x0006)
   928F 36 01         [10] 1911 	ld	(hl),#0x01
                           1912 ;src/main.c:470: cu.direccion = M_abajo;
   9291 21 2F 89      [10] 1913 	ld	hl,#(_cu + 0x0007)
   9294 36 03         [10] 1914 	ld	(hl),#0x03
                           1915 ;src/main.c:471: cu.x = prota.x + G_HERO_W / 2;
   9296 3A 20 89      [13] 1916 	ld	a, (#_prota + 0)
   9299 C6 03         [ 7] 1917 	add	a, #0x03
   929B 32 28 89      [13] 1918 	ld	(#_cu),a
                           1919 ;src/main.c:472: cu.y = prota.y + G_HERO_H;
   929E 0A            [ 7] 1920 	ld	a,(bc)
   929F C6 16         [ 7] 1921 	add	a, #0x16
   92A1 32 29 89      [13] 1922 	ld	(#(_cu + 0x0001)),a
                           1923 ;src/main.c:473: cu.sprite = g_knifeY_0;
   92A4 21 A0 54      [10] 1924 	ld	hl,#_g_knifeY_0
   92A7 22 2C 89      [16] 1925 	ld	((_cu + 0x0004)), hl
                           1926 ;src/main.c:474: cu.eje = E_Y;
   92AA 21 30 89      [10] 1927 	ld	hl,#(_cu + 0x0008)
   92AD 36 01         [10] 1928 	ld	(hl),#0x01
                           1929 ;src/main.c:475: dibujarCuchillo();
   92AF C3 F1 90      [10] 1930 	jp  _dibujarCuchillo
   92B2                    1931 00112$:
                           1932 ;src/main.c:478: else if(prota.mira == M_arriba){
   92B2 7B            [ 4] 1933 	ld	a,e
   92B3 D6 02         [ 7] 1934 	sub	a, #0x02
   92B5 C0            [11] 1935 	ret	NZ
                           1936 ;src/main.c:479: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   92B6 0A            [ 7] 1937 	ld	a,(bc)
   92B7 C6 F7         [ 7] 1938 	add	a,#0xF7
   92B9 57            [ 4] 1939 	ld	d,a
   92BA 3A 20 89      [13] 1940 	ld	a, (#_prota + 0)
   92BD C6 03         [ 7] 1941 	add	a, #0x03
   92BF C5            [11] 1942 	push	bc
   92C0 D5            [11] 1943 	push	de
   92C1 33            [ 6] 1944 	inc	sp
   92C2 F5            [11] 1945 	push	af
   92C3 33            [ 6] 1946 	inc	sp
   92C4 CD 2F 8A      [17] 1947 	call	_getTilePtr
   92C7 F1            [10] 1948 	pop	af
   92C8 C1            [10] 1949 	pop	bc
   92C9 5E            [ 7] 1950 	ld	e,(hl)
   92CA 3E 02         [ 7] 1951 	ld	a,#0x02
   92CC 93            [ 4] 1952 	sub	a, e
   92CD D8            [11] 1953 	ret	C
                           1954 ;src/main.c:480: cu.lanzado = SI;
   92CE 21 2E 89      [10] 1955 	ld	hl,#(_cu + 0x0006)
   92D1 36 01         [10] 1956 	ld	(hl),#0x01
                           1957 ;src/main.c:481: cu.direccion = M_arriba;
   92D3 21 2F 89      [10] 1958 	ld	hl,#(_cu + 0x0007)
   92D6 36 02         [10] 1959 	ld	(hl),#0x02
                           1960 ;src/main.c:482: cu.x = prota.x + G_HERO_W / 2;
   92D8 3A 20 89      [13] 1961 	ld	a, (#_prota + 0)
   92DB C6 03         [ 7] 1962 	add	a, #0x03
   92DD 32 28 89      [13] 1963 	ld	(#_cu),a
                           1964 ;src/main.c:483: cu.y = prota.y;
   92E0 0A            [ 7] 1965 	ld	a,(bc)
   92E1 32 29 89      [13] 1966 	ld	(#(_cu + 0x0001)),a
                           1967 ;src/main.c:484: cu.sprite = g_knifeY_1;
   92E4 21 B0 54      [10] 1968 	ld	hl,#_g_knifeY_1
   92E7 22 2C 89      [16] 1969 	ld	((_cu + 0x0004)), hl
                           1970 ;src/main.c:485: cu.eje = E_Y;
   92EA 21 30 89      [10] 1971 	ld	hl,#(_cu + 0x0008)
   92ED 36 01         [10] 1972 	ld	(hl),#0x01
                           1973 ;src/main.c:486: dibujarCuchillo();
   92EF C3 F1 90      [10] 1974 	jp  _dibujarCuchillo
                           1975 ;src/main.c:492: void comprobarTeclado() {
                           1976 ;	---------------------------------
                           1977 ; Function comprobarTeclado
                           1978 ; ---------------------------------
   92F2                    1979 _comprobarTeclado::
                           1980 ;src/main.c:493: cpct_scanKeyboard_if();
   92F2 CD 9C 7E      [17] 1981 	call	_cpct_scanKeyboard_if
                           1982 ;src/main.c:495: if (cpct_isAnyKeyPressed()) {
   92F5 CD 8F 7E      [17] 1983 	call	_cpct_isAnyKeyPressed
   92F8 7D            [ 4] 1984 	ld	a,l
   92F9 B7            [ 4] 1985 	or	a, a
   92FA C8            [11] 1986 	ret	Z
                           1987 ;src/main.c:496: if (cpct_isKeyPressed(Key_CursorLeft))
   92FB 21 01 01      [10] 1988 	ld	hl,#0x0101
   92FE CD F9 7B      [17] 1989 	call	_cpct_isKeyPressed
   9301 7D            [ 4] 1990 	ld	a,l
   9302 B7            [ 4] 1991 	or	a, a
                           1992 ;src/main.c:497: moverIzquierda();
   9303 C2 29 90      [10] 1993 	jp	NZ,_moverIzquierda
                           1994 ;src/main.c:498: else if (cpct_isKeyPressed(Key_CursorRight))
   9306 21 00 02      [10] 1995 	ld	hl,#0x0200
   9309 CD F9 7B      [17] 1996 	call	_cpct_isKeyPressed
   930C 7D            [ 4] 1997 	ld	a,l
   930D B7            [ 4] 1998 	or	a, a
                           1999 ;src/main.c:499: moverDerecha();
   930E C2 4E 90      [10] 2000 	jp	NZ,_moverDerecha
                           2001 ;src/main.c:500: else if (cpct_isKeyPressed(Key_CursorUp))
   9311 21 00 01      [10] 2002 	ld	hl,#0x0100
   9314 CD F9 7B      [17] 2003 	call	_cpct_isKeyPressed
   9317 7D            [ 4] 2004 	ld	a,l
   9318 B7            [ 4] 2005 	or	a, a
                           2006 ;src/main.c:501: moverArriba();
   9319 C2 94 90      [10] 2007 	jp	NZ,_moverArriba
                           2008 ;src/main.c:502: else if (cpct_isKeyPressed(Key_CursorDown))
   931C 21 00 04      [10] 2009 	ld	hl,#0x0400
   931F CD F9 7B      [17] 2010 	call	_cpct_isKeyPressed
   9322 7D            [ 4] 2011 	ld	a,l
   9323 B7            [ 4] 2012 	or	a, a
                           2013 ;src/main.c:503: moverAbajo();
   9324 C2 B8 90      [10] 2014 	jp	NZ,_moverAbajo
                           2015 ;src/main.c:504: else if (cpct_isKeyPressed(Key_Space))
   9327 21 05 80      [10] 2016 	ld	hl,#0x8005
   932A CD F9 7B      [17] 2017 	call	_cpct_isKeyPressed
   932D 7D            [ 4] 2018 	ld	a,l
   932E B7            [ 4] 2019 	or	a, a
   932F C8            [11] 2020 	ret	Z
                           2021 ;src/main.c:505: lanzarCuchillo();
   9330 C3 D6 91      [10] 2022 	jp  _lanzarCuchillo
                           2023 ;src/main.c:509: u8 checkKnifeCollision(int direction){
                           2024 ;	---------------------------------
                           2025 ; Function checkKnifeCollision
                           2026 ; ---------------------------------
   9333                    2027 _checkKnifeCollision::
   9333 DD E5         [15] 2028 	push	ix
   9335 DD 21 00 00   [14] 2029 	ld	ix,#0
   9339 DD 39         [15] 2030 	add	ix,sp
                           2031 ;src/main.c:511: u8 colisiona = 1;
   933B 0E 01         [ 7] 2032 	ld	c,#0x01
                           2033 ;src/main.c:513: switch (direction) {
   933D DD CB 05 7E   [20] 2034 	bit	7, 5 (ix)
   9341 C2 2D 94      [10] 2035 	jp	NZ,00125$
   9344 3E 03         [ 7] 2036 	ld	a,#0x03
   9346 DD BE 04      [19] 2037 	cp	a, 4 (ix)
   9349 3E 00         [ 7] 2038 	ld	a,#0x00
   934B DD 9E 05      [19] 2039 	sbc	a, 5 (ix)
   934E E2 53 93      [10] 2040 	jp	PO, 00163$
   9351 EE 80         [ 7] 2041 	xor	a, #0x80
   9353                    2042 00163$:
   9353 FA 2D 94      [10] 2043 	jp	M,00125$
   9356 DD 5E 04      [19] 2044 	ld	e,4 (ix)
   9359 16 00         [ 7] 2045 	ld	d,#0x00
   935B 21 62 93      [10] 2046 	ld	hl,#00164$
   935E 19            [11] 2047 	add	hl,de
   935F 19            [11] 2048 	add	hl,de
   9360 19            [11] 2049 	add	hl,de
   9361 E9            [ 4] 2050 	jp	(hl)
   9362                    2051 00164$:
   9362 C3 2D 94      [10] 2052 	jp	00125$
   9365 C3 2D 94      [10] 2053 	jp	00125$
   9368 C3 74 93      [10] 2054 	jp	00103$
   936B C3 CB 93      [10] 2055 	jp	00114$
                           2056 ;src/main.c:514: case 0:
                           2057 ;src/main.c:516: break;
   936E C3 2D 94      [10] 2058 	jp	00125$
                           2059 ;src/main.c:517: case 1:
                           2060 ;src/main.c:519: break;
   9371 C3 2D 94      [10] 2061 	jp	00125$
                           2062 ;src/main.c:520: case 2:
   9374                    2063 00103$:
                           2064 ;src/main.c:522: if((enemy->x + G_ENEMY_W) < cu.x || enemy->x  > (cu.x + G_KNIFEX_0_W)){
   9374 21 F4 88      [10] 2065 	ld	hl,#_enemy+0
   9377 4E            [ 7] 2066 	ld	c,(hl)
   9378 06 00         [ 7] 2067 	ld	b,#0x00
   937A 21 04 00      [10] 2068 	ld	hl,#0x0004
   937D 09            [11] 2069 	add	hl,bc
   937E EB            [ 4] 2070 	ex	de,hl
   937F 21 28 89      [10] 2071 	ld	hl,#_cu+0
   9382 6E            [ 7] 2072 	ld	l,(hl)
   9383 26 00         [ 7] 2073 	ld	h,#0x00
   9385 7B            [ 4] 2074 	ld	a,e
   9386 95            [ 4] 2075 	sub	a, l
   9387 7A            [ 4] 2076 	ld	a,d
   9388 9C            [ 4] 2077 	sbc	a, h
   9389 E2 8E 93      [10] 2078 	jp	PO, 00165$
   938C EE 80         [ 7] 2079 	xor	a, #0x80
   938E                    2080 00165$:
   938E FA CB 93      [10] 2081 	jp	M,00114$
   9391 11 04 00      [10] 2082 	ld	de,#0x0004
   9394 19            [11] 2083 	add	hl,de
   9395 7D            [ 4] 2084 	ld	a,l
   9396 91            [ 4] 2085 	sub	a, c
   9397 7C            [ 4] 2086 	ld	a,h
   9398 98            [ 4] 2087 	sbc	a, b
   9399 E2 9E 93      [10] 2088 	jp	PO, 00166$
   939C EE 80         [ 7] 2089 	xor	a, #0x80
   939E                    2090 00166$:
   939E FA CB 93      [10] 2091 	jp	M,00114$
                           2092 ;src/main.c:525: if(cu.y>enemy->y){
   93A1 21 29 89      [10] 2093 	ld	hl, #(_cu + 0x0001) + 0
   93A4 4E            [ 7] 2094 	ld	c,(hl)
   93A5 21 F5 88      [10] 2095 	ld	hl, #_enemy + 1
   93A8 5E            [ 7] 2096 	ld	e,(hl)
   93A9 7B            [ 4] 2097 	ld	a,e
   93AA 91            [ 4] 2098 	sub	a, c
   93AB 30 1E         [12] 2099 	jr	NC,00114$
                           2100 ;src/main.c:526: if(cu.y - (enemy->y + G_ENEMY_H) >= 2){
   93AD 06 00         [ 7] 2101 	ld	b,#0x00
   93AF 16 00         [ 7] 2102 	ld	d,#0x00
   93B1 21 16 00      [10] 2103 	ld	hl,#0x0016
   93B4 19            [11] 2104 	add	hl,de
   93B5 79            [ 4] 2105 	ld	a,c
   93B6 95            [ 4] 2106 	sub	a, l
   93B7 4F            [ 4] 2107 	ld	c,a
   93B8 78            [ 4] 2108 	ld	a,b
   93B9 9C            [ 4] 2109 	sbc	a, h
   93BA 47            [ 4] 2110 	ld	b,a
   93BB 79            [ 4] 2111 	ld	a,c
   93BC D6 02         [ 7] 2112 	sub	a, #0x02
   93BE 78            [ 4] 2113 	ld	a,b
   93BF 17            [ 4] 2114 	rla
   93C0 3F            [ 4] 2115 	ccf
   93C1 1F            [ 4] 2116 	rra
   93C2 DE 80         [ 7] 2117 	sbc	a, #0x80
   93C4 30 05         [12] 2118 	jr	NC,00114$
                           2119 ;src/main.c:531: enemy->muerto = SI;
   93C6 21 FC 88      [10] 2120 	ld	hl,#(_enemy + 0x0008)
   93C9 36 01         [10] 2121 	ld	(hl),#0x01
                           2122 ;src/main.c:538: case 3:
   93CB                    2123 00114$:
                           2124 ;src/main.c:540: if((enemy->x + G_ENEMY_W) < cu.x || enemy->x  > (cu.x + G_KNIFEX_0_W)){
   93CB 21 F4 88      [10] 2125 	ld	hl, #_enemy + 0
   93CE 4E            [ 7] 2126 	ld	c,(hl)
   93CF 06 00         [ 7] 2127 	ld	b,#0x00
   93D1 21 04 00      [10] 2128 	ld	hl,#0x0004
   93D4 09            [11] 2129 	add	hl,bc
   93D5 EB            [ 4] 2130 	ex	de,hl
   93D6 21 28 89      [10] 2131 	ld	hl, #_cu + 0
   93D9 6E            [ 7] 2132 	ld	l,(hl)
   93DA 26 00         [ 7] 2133 	ld	h,#0x00
   93DC 7B            [ 4] 2134 	ld	a,e
   93DD 95            [ 4] 2135 	sub	a, l
   93DE 7A            [ 4] 2136 	ld	a,d
   93DF 9C            [ 4] 2137 	sbc	a, h
   93E0 E2 E5 93      [10] 2138 	jp	PO, 00167$
   93E3 EE 80         [ 7] 2139 	xor	a, #0x80
   93E5                    2140 00167$:
   93E5 FA F8 93      [10] 2141 	jp	M,00121$
   93E8 11 04 00      [10] 2142 	ld	de,#0x0004
   93EB 19            [11] 2143 	add	hl,de
   93EC 7D            [ 4] 2144 	ld	a,l
   93ED 91            [ 4] 2145 	sub	a, c
   93EE 7C            [ 4] 2146 	ld	a,h
   93EF 98            [ 4] 2147 	sbc	a, b
   93F0 E2 F5 93      [10] 2148 	jp	PO, 00168$
   93F3 EE 80         [ 7] 2149 	xor	a, #0x80
   93F5                    2150 00168$:
   93F5 F2 FC 93      [10] 2151 	jp	P,00122$
   93F8                    2152 00121$:
                           2153 ;src/main.c:541: colisiona = 0;
   93F8 0E 00         [ 7] 2154 	ld	c,#0x00
   93FA 18 31         [12] 2155 	jr	00125$
   93FC                    2156 00122$:
                           2157 ;src/main.c:543: if(cu.y<enemy->y){
   93FC 21 29 89      [10] 2158 	ld	hl, #(_cu + 0x0001) + 0
   93FF 4E            [ 7] 2159 	ld	c,(hl)
   9400 21 F5 88      [10] 2160 	ld	hl, #_enemy + 1
   9403 6E            [ 7] 2161 	ld	l,(hl)
   9404 79            [ 4] 2162 	ld	a,c
   9405 95            [ 4] 2163 	sub	a, l
   9406 30 23         [12] 2164 	jr	NC,00119$
                           2165 ;src/main.c:544: if(enemy->y - (cu.y + G_KNIFEX_0_H - 2) >= 2){
   9408 26 00         [ 7] 2166 	ld	h,#0x00
   940A 06 00         [ 7] 2167 	ld	b,#0x00
   940C 03            [ 6] 2168 	inc	bc
   940D 03            [ 6] 2169 	inc	bc
   940E BF            [ 4] 2170 	cp	a, a
   940F ED 42         [15] 2171 	sbc	hl, bc
   9411 11 02 80      [10] 2172 	ld	de, #0x8002
   9414 29            [11] 2173 	add	hl, hl
   9415 3F            [ 4] 2174 	ccf
   9416 CB 1C         [ 8] 2175 	rr	h
   9418 CB 1D         [ 8] 2176 	rr	l
   941A ED 52         [15] 2177 	sbc	hl, de
   941C 38 04         [12] 2178 	jr	C,00116$
                           2179 ;src/main.c:545: colisiona = 0;
   941E 0E 00         [ 7] 2180 	ld	c,#0x00
   9420 18 0B         [12] 2181 	jr	00125$
   9422                    2182 00116$:
                           2183 ;src/main.c:547: colisiona = 1;
   9422 0E 01         [ 7] 2184 	ld	c,#0x01
                           2185 ;src/main.c:548: enemy->muerto = SI;
   9424 21 FC 88      [10] 2186 	ld	hl,#(_enemy + 0x0008)
   9427 36 01         [10] 2187 	ld	(hl),#0x01
   9429 18 02         [12] 2188 	jr	00125$
   942B                    2189 00119$:
                           2190 ;src/main.c:551: colisiona = 0;
   942B 0E 00         [ 7] 2191 	ld	c,#0x00
                           2192 ;src/main.c:554: }
   942D                    2193 00125$:
                           2194 ;src/main.c:555: return colisiona;
   942D 69            [ 4] 2195 	ld	l,c
   942E DD E1         [14] 2196 	pop	ix
   9430 C9            [10] 2197 	ret
                           2198 ;src/main.c:558: void moverCuchillo(){
                           2199 ;	---------------------------------
                           2200 ; Function moverCuchillo
                           2201 ; ---------------------------------
   9431                    2202 _moverCuchillo::
                           2203 ;src/main.c:560: if(cu.lanzado){
   9431 01 28 89      [10] 2204 	ld	bc,#_cu+0
   9434 3A 2E 89      [13] 2205 	ld	a, (#_cu + 6)
   9437 B7            [ 4] 2206 	or	a, a
   9438 C8            [11] 2207 	ret	Z
                           2208 ;src/main.c:561: cu.mover = 1;
   9439 21 31 89      [10] 2209 	ld	hl,#(_cu + 0x0009)
   943C 36 01         [10] 2210 	ld	(hl),#0x01
                           2211 ;src/main.c:562: if(cu.direccion == M_derecha){
   943E 21 2F 89      [10] 2212 	ld	hl, #_cu + 7
   9441 6E            [ 7] 2213 	ld	l,(hl)
                           2214 ;src/main.c:564: if( *getTilePtr(cu.x + G_KNIFEX_0_W + 1, cu.y) <= 2){
   9442 59            [ 4] 2215 	ld	e, c
   9443 50            [ 4] 2216 	ld	d, b
   9444 13            [ 6] 2217 	inc	de
                           2218 ;src/main.c:562: if(cu.direccion == M_derecha){
   9445 7D            [ 4] 2219 	ld	a,l
   9446 B7            [ 4] 2220 	or	a, a
   9447 20 27         [12] 2221 	jr	NZ,00128$
                           2222 ;src/main.c:564: if( *getTilePtr(cu.x + G_KNIFEX_0_W + 1, cu.y) <= 2){
   9449 1A            [ 7] 2223 	ld	a,(de)
   944A 5F            [ 4] 2224 	ld	e,a
   944B 0A            [ 7] 2225 	ld	a,(bc)
   944C C6 05         [ 7] 2226 	add	a, #0x05
   944E 6F            [ 4] 2227 	ld	l,a
   944F C5            [11] 2228 	push	bc
   9450 7B            [ 4] 2229 	ld	a,e
   9451 F5            [11] 2230 	push	af
   9452 33            [ 6] 2231 	inc	sp
   9453 7D            [ 4] 2232 	ld	a,l
   9454 F5            [11] 2233 	push	af
   9455 33            [ 6] 2234 	inc	sp
   9456 CD 2F 8A      [17] 2235 	call	_getTilePtr
   9459 F1            [10] 2236 	pop	af
   945A C1            [10] 2237 	pop	bc
   945B 5E            [ 7] 2238 	ld	e,(hl)
   945C 3E 02         [ 7] 2239 	ld	a,#0x02
   945E 93            [ 4] 2240 	sub	a, e
   945F 38 09         [12] 2241 	jr	C,00102$
                           2242 ;src/main.c:565: cu.x++;
   9461 0A            [ 7] 2243 	ld	a,(bc)
   9462 3C            [ 4] 2244 	inc	a
   9463 02            [ 7] 2245 	ld	(bc),a
                           2246 ;src/main.c:566: cu.mover = SI;
   9464 21 31 89      [10] 2247 	ld	hl,#(_cu + 0x0009)
   9467 36 01         [10] 2248 	ld	(hl),#0x01
   9469 C9            [10] 2249 	ret
   946A                    2250 00102$:
                           2251 ;src/main.c:570: cu.mover=NO;
   946A 21 31 89      [10] 2252 	ld	hl,#(_cu + 0x0009)
   946D 36 00         [10] 2253 	ld	(hl),#0x00
   946F C9            [10] 2254 	ret
   9470                    2255 00128$:
                           2256 ;src/main.c:573: else if(cu.direccion == M_izquierda){
   9470 7D            [ 4] 2257 	ld	a,l
   9471 3D            [ 4] 2258 	dec	a
   9472 20 26         [12] 2259 	jr	NZ,00125$
                           2260 ;src/main.c:574: if(*getTilePtr(cu.x - 1, cu.y) <= 2){
   9474 1A            [ 7] 2261 	ld	a,(de)
   9475 5F            [ 4] 2262 	ld	e,a
   9476 0A            [ 7] 2263 	ld	a,(bc)
   9477 57            [ 4] 2264 	ld	d,a
   9478 15            [ 4] 2265 	dec	d
   9479 C5            [11] 2266 	push	bc
   947A 7B            [ 4] 2267 	ld	a,e
   947B F5            [11] 2268 	push	af
   947C 33            [ 6] 2269 	inc	sp
   947D D5            [11] 2270 	push	de
   947E 33            [ 6] 2271 	inc	sp
   947F CD 2F 8A      [17] 2272 	call	_getTilePtr
   9482 F1            [10] 2273 	pop	af
   9483 C1            [10] 2274 	pop	bc
   9484 5E            [ 7] 2275 	ld	e,(hl)
   9485 3E 02         [ 7] 2276 	ld	a,#0x02
   9487 93            [ 4] 2277 	sub	a, e
   9488 38 0A         [12] 2278 	jr	C,00105$
                           2279 ;src/main.c:575: cu.x--;
   948A 0A            [ 7] 2280 	ld	a,(bc)
   948B C6 FF         [ 7] 2281 	add	a,#0xFF
   948D 02            [ 7] 2282 	ld	(bc),a
                           2283 ;src/main.c:576: cu.mover = SI;
   948E 21 31 89      [10] 2284 	ld	hl,#(_cu + 0x0009)
   9491 36 01         [10] 2285 	ld	(hl),#0x01
   9493 C9            [10] 2286 	ret
   9494                    2287 00105$:
                           2288 ;src/main.c:579: cu.mover=NO;
   9494 21 31 89      [10] 2289 	ld	hl,#(_cu + 0x0009)
   9497 36 00         [10] 2290 	ld	(hl),#0x00
   9499 C9            [10] 2291 	ret
   949A                    2292 00125$:
                           2293 ;src/main.c:582: else if(cu.direccion == M_arriba){
   949A 7D            [ 4] 2294 	ld	a,l
   949B D6 02         [ 7] 2295 	sub	a, #0x02
   949D 20 3E         [12] 2296 	jr	NZ,00122$
                           2297 ;src/main.c:583: if(*getTilePtr(cu.x, cu.y - 2) <= 2){
   949F 1A            [ 7] 2298 	ld	a,(de)
   94A0 C6 FE         [ 7] 2299 	add	a,#0xFE
   94A2 F5            [11] 2300 	push	af
   94A3 0A            [ 7] 2301 	ld	a,(bc)
   94A4 47            [ 4] 2302 	ld	b,a
   94A5 F1            [10] 2303 	pop	af
   94A6 D5            [11] 2304 	push	de
   94A7 F5            [11] 2305 	push	af
   94A8 33            [ 6] 2306 	inc	sp
   94A9 C5            [11] 2307 	push	bc
   94AA 33            [ 6] 2308 	inc	sp
   94AB CD 2F 8A      [17] 2309 	call	_getTilePtr
   94AE F1            [10] 2310 	pop	af
   94AF D1            [10] 2311 	pop	de
   94B0 4E            [ 7] 2312 	ld	c,(hl)
   94B1 3E 02         [ 7] 2313 	ld	a,#0x02
   94B3 91            [ 4] 2314 	sub	a, c
   94B4 38 21         [12] 2315 	jr	C,00111$
                           2316 ;src/main.c:584: if(!checkKnifeCollision(M_arriba)){
   94B6 D5            [11] 2317 	push	de
   94B7 21 02 00      [10] 2318 	ld	hl,#0x0002
   94BA E5            [11] 2319 	push	hl
   94BB CD 33 93      [17] 2320 	call	_checkKnifeCollision
   94BE F1            [10] 2321 	pop	af
   94BF D1            [10] 2322 	pop	de
   94C0 7D            [ 4] 2323 	ld	a,l
   94C1 B7            [ 4] 2324 	or	a, a
   94C2 20 0D         [12] 2325 	jr	NZ,00108$
                           2326 ;src/main.c:585: cu.y--;
   94C4 1A            [ 7] 2327 	ld	a,(de)
   94C5 C6 FF         [ 7] 2328 	add	a,#0xFF
   94C7 12            [ 7] 2329 	ld	(de),a
                           2330 ;src/main.c:586: cu.y--;
   94C8 C6 FF         [ 7] 2331 	add	a,#0xFF
   94CA 12            [ 7] 2332 	ld	(de),a
                           2333 ;src/main.c:587: cu.mover = SI;
   94CB 21 31 89      [10] 2334 	ld	hl,#(_cu + 0x0009)
   94CE 36 01         [10] 2335 	ld	(hl),#0x01
   94D0 C9            [10] 2336 	ret
   94D1                    2337 00108$:
                           2338 ;src/main.c:590: cu.mover=NO;
   94D1 21 31 89      [10] 2339 	ld	hl,#(_cu + 0x0009)
   94D4 36 00         [10] 2340 	ld	(hl),#0x00
   94D6 C9            [10] 2341 	ret
   94D7                    2342 00111$:
                           2343 ;src/main.c:593: cu.mover=NO;
   94D7 21 31 89      [10] 2344 	ld	hl,#(_cu + 0x0009)
   94DA 36 00         [10] 2345 	ld	(hl),#0x00
   94DC C9            [10] 2346 	ret
   94DD                    2347 00122$:
                           2348 ;src/main.c:598: else if(cu.direccion == M_abajo){
   94DD 7D            [ 4] 2349 	ld	a,l
   94DE D6 03         [ 7] 2350 	sub	a, #0x03
   94E0 C0            [11] 2351 	ret	NZ
                           2352 ;src/main.c:599: if(*getTilePtr(cu.x, cu.y + G_KNIFEY_0_H + 2) <= 2){
   94E1 1A            [ 7] 2353 	ld	a,(de)
   94E2 C6 0A         [ 7] 2354 	add	a, #0x0A
   94E4 F5            [11] 2355 	push	af
   94E5 0A            [ 7] 2356 	ld	a,(bc)
   94E6 47            [ 4] 2357 	ld	b,a
   94E7 F1            [10] 2358 	pop	af
   94E8 D5            [11] 2359 	push	de
   94E9 F5            [11] 2360 	push	af
   94EA 33            [ 6] 2361 	inc	sp
   94EB C5            [11] 2362 	push	bc
   94EC 33            [ 6] 2363 	inc	sp
   94ED CD 2F 8A      [17] 2364 	call	_getTilePtr
   94F0 F1            [10] 2365 	pop	af
   94F1 D1            [10] 2366 	pop	de
   94F2 4E            [ 7] 2367 	ld	c,(hl)
   94F3 3E 02         [ 7] 2368 	ld	a,#0x02
   94F5 91            [ 4] 2369 	sub	a, c
   94F6 38 1F         [12] 2370 	jr	C,00117$
                           2371 ;src/main.c:600: if(!checkKnifeCollision(M_abajo)){
   94F8 D5            [11] 2372 	push	de
   94F9 21 03 00      [10] 2373 	ld	hl,#0x0003
   94FC E5            [11] 2374 	push	hl
   94FD CD 33 93      [17] 2375 	call	_checkKnifeCollision
   9500 F1            [10] 2376 	pop	af
   9501 D1            [10] 2377 	pop	de
   9502 7D            [ 4] 2378 	ld	a,l
   9503 B7            [ 4] 2379 	or	a, a
   9504 20 0B         [12] 2380 	jr	NZ,00114$
                           2381 ;src/main.c:601: cu.y++;
   9506 1A            [ 7] 2382 	ld	a,(de)
   9507 3C            [ 4] 2383 	inc	a
   9508 12            [ 7] 2384 	ld	(de),a
                           2385 ;src/main.c:602: cu.y++;
   9509 3C            [ 4] 2386 	inc	a
   950A 12            [ 7] 2387 	ld	(de),a
                           2388 ;src/main.c:603: cu.mover = SI;
   950B 21 31 89      [10] 2389 	ld	hl,#(_cu + 0x0009)
   950E 36 01         [10] 2390 	ld	(hl),#0x01
   9510 C9            [10] 2391 	ret
   9511                    2392 00114$:
                           2393 ;src/main.c:606: cu.mover=NO;
   9511 21 31 89      [10] 2394 	ld	hl,#(_cu + 0x0009)
   9514 36 00         [10] 2395 	ld	(hl),#0x00
   9516 C9            [10] 2396 	ret
   9517                    2397 00117$:
                           2398 ;src/main.c:609: cu.mover=NO;
   9517 21 31 89      [10] 2399 	ld	hl,#(_cu + 0x0009)
   951A 36 00         [10] 2400 	ld	(hl),#0x00
   951C C9            [10] 2401 	ret
                           2402 ;src/main.c:614: void barraPuntuacionInicial(){
                           2403 ;	---------------------------------
                           2404 ; Function barraPuntuacionInicial
                           2405 ; ---------------------------------
   951D                    2406 _barraPuntuacionInicial::
                           2407 ;src/main.c:619: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 178); //
   951D 21 00 B2      [10] 2408 	ld	hl,#0xB200
   9520 E5            [11] 2409 	push	hl
   9521 26 C0         [ 7] 2410 	ld	h, #0xC0
   9523 E5            [11] 2411 	push	hl
   9524 CD 70 88      [17] 2412 	call	_cpct_getScreenPtr
   9527 4D            [ 4] 2413 	ld	c,l
   9528 44            [ 4] 2414 	ld	b,h
                           2415 ;src/main.c:620: cpct_drawStringM0("SCORE", memptr, 1, 0);
   9529 21 01 00      [10] 2416 	ld	hl,#0x0001
   952C E5            [11] 2417 	push	hl
   952D C5            [11] 2418 	push	bc
   952E 21 C5 95      [10] 2419 	ld	hl,#___str_1
   9531 E5            [11] 2420 	push	hl
   9532 CD 7B 7C      [17] 2421 	call	_cpct_drawStringM0
   9535 21 06 00      [10] 2422 	ld	hl,#6
   9538 39            [11] 2423 	add	hl,sp
   9539 F9            [ 6] 2424 	ld	sp,hl
                           2425 ;src/main.c:621: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 190); // puntuación inicial
   953A 21 00 BE      [10] 2426 	ld	hl,#0xBE00
   953D E5            [11] 2427 	push	hl
   953E 26 C0         [ 7] 2428 	ld	h, #0xC0
   9540 E5            [11] 2429 	push	hl
   9541 CD 70 88      [17] 2430 	call	_cpct_getScreenPtr
   9544 4D            [ 4] 2431 	ld	c,l
   9545 44            [ 4] 2432 	ld	b,h
                           2433 ;src/main.c:622: cpct_drawStringM0("00000", memptr, 15, 0);
   9546 21 0F 00      [10] 2434 	ld	hl,#0x000F
   9549 E5            [11] 2435 	push	hl
   954A C5            [11] 2436 	push	bc
   954B 21 CB 95      [10] 2437 	ld	hl,#___str_2
   954E E5            [11] 2438 	push	hl
   954F CD 7B 7C      [17] 2439 	call	_cpct_drawStringM0
   9552 21 06 00      [10] 2440 	ld	hl,#6
   9555 39            [11] 2441 	add	hl,sp
   9556 F9            [ 6] 2442 	ld	sp,hl
                           2443 ;src/main.c:625: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 190);
   9557 21 1A BE      [10] 2444 	ld	hl,#0xBE1A
   955A E5            [11] 2445 	push	hl
   955B 21 00 C0      [10] 2446 	ld	hl,#0xC000
   955E E5            [11] 2447 	push	hl
   955F CD 70 88      [17] 2448 	call	_cpct_getScreenPtr
   9562 4D            [ 4] 2449 	ld	c,l
   9563 44            [ 4] 2450 	ld	b,h
                           2451 ;src/main.c:626: cpct_drawStringM0("ROBOBIT", memptr, 3, 0);
   9564 21 03 00      [10] 2452 	ld	hl,#0x0003
   9567 E5            [11] 2453 	push	hl
   9568 C5            [11] 2454 	push	bc
   9569 21 D1 95      [10] 2455 	ld	hl,#___str_3
   956C E5            [11] 2456 	push	hl
   956D CD 7B 7C      [17] 2457 	call	_cpct_drawStringM0
   9570 21 06 00      [10] 2458 	ld	hl,#6
   9573 39            [11] 2459 	add	hl,sp
   9574 F9            [ 6] 2460 	ld	sp,hl
                           2461 ;src/main.c:628: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 178); //
   9575 21 3C B2      [10] 2462 	ld	hl,#0xB23C
   9578 E5            [11] 2463 	push	hl
   9579 21 00 C0      [10] 2464 	ld	hl,#0xC000
   957C E5            [11] 2465 	push	hl
   957D CD 70 88      [17] 2466 	call	_cpct_getScreenPtr
   9580 4D            [ 4] 2467 	ld	c,l
   9581 44            [ 4] 2468 	ld	b,h
                           2469 ;src/main.c:629: cpct_drawStringM0("LIVES", memptr, 1, 0);
   9582 21 01 00      [10] 2470 	ld	hl,#0x0001
   9585 E5            [11] 2471 	push	hl
   9586 C5            [11] 2472 	push	bc
   9587 21 D9 95      [10] 2473 	ld	hl,#___str_4
   958A E5            [11] 2474 	push	hl
   958B CD 7B 7C      [17] 2475 	call	_cpct_drawStringM0
   958E 21 06 00      [10] 2476 	ld	hl,#6
   9591 39            [11] 2477 	add	hl,sp
   9592 F9            [ 6] 2478 	ld	sp,hl
                           2479 ;src/main.c:631: for(i=0; i<5; i++){
   9593 01 00 00      [10] 2480 	ld	bc,#0x0000
   9596                    2481 00102$:
                           2482 ;src/main.c:632: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 190); // dibuja 5 corazones
   9596 79            [ 4] 2483 	ld	a,c
   9597 87            [ 4] 2484 	add	a, a
   9598 87            [ 4] 2485 	add	a, a
   9599 C6 3C         [ 7] 2486 	add	a, #0x3C
   959B 57            [ 4] 2487 	ld	d,a
   959C C5            [11] 2488 	push	bc
   959D 3E BE         [ 7] 2489 	ld	a,#0xBE
   959F F5            [11] 2490 	push	af
   95A0 33            [ 6] 2491 	inc	sp
   95A1 D5            [11] 2492 	push	de
   95A2 33            [ 6] 2493 	inc	sp
   95A3 21 00 C0      [10] 2494 	ld	hl,#0xC000
   95A6 E5            [11] 2495 	push	hl
   95A7 CD 70 88      [17] 2496 	call	_cpct_getScreenPtr
   95AA EB            [ 4] 2497 	ex	de,hl
   95AB 21 03 06      [10] 2498 	ld	hl,#0x0603
   95AE E5            [11] 2499 	push	hl
   95AF D5            [11] 2500 	push	de
   95B0 21 60 78      [10] 2501 	ld	hl,#_g_heart
   95B3 E5            [11] 2502 	push	hl
   95B4 CD 9F 7C      [17] 2503 	call	_cpct_drawSprite
   95B7 C1            [10] 2504 	pop	bc
                           2505 ;src/main.c:631: for(i=0; i<5; i++){
   95B8 03            [ 6] 2506 	inc	bc
   95B9 79            [ 4] 2507 	ld	a,c
   95BA D6 05         [ 7] 2508 	sub	a, #0x05
   95BC 78            [ 4] 2509 	ld	a,b
   95BD 17            [ 4] 2510 	rla
   95BE 3F            [ 4] 2511 	ccf
   95BF 1F            [ 4] 2512 	rra
   95C0 DE 80         [ 7] 2513 	sbc	a, #0x80
   95C2 38 D2         [12] 2514 	jr	C,00102$
   95C4 C9            [10] 2515 	ret
   95C5                    2516 ___str_1:
   95C5 53 43 4F 52 45     2517 	.ascii "SCORE"
   95CA 00                 2518 	.db 0x00
   95CB                    2519 ___str_2:
   95CB 30 30 30 30 30     2520 	.ascii "00000"
   95D0 00                 2521 	.db 0x00
   95D1                    2522 ___str_3:
   95D1 52 4F 42 4F 42 49  2523 	.ascii "ROBOBIT"
        54
   95D8 00                 2524 	.db 0x00
   95D9                    2525 ___str_4:
   95D9 4C 49 56 45 53     2526 	.ascii "LIVES"
   95DE 00                 2527 	.db 0x00
                           2528 ;src/main.c:637: void borrarPantallaAbajo(){
                           2529 ;	---------------------------------
                           2530 ; Function borrarPantallaAbajo
                           2531 ; ---------------------------------
   95DF                    2532 _borrarPantallaAbajo::
                           2533 ;src/main.c:640: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 176); // posición para borrar la mitad derecha
   95DF 21 00 B0      [10] 2534 	ld	hl,#0xB000
   95E2 E5            [11] 2535 	push	hl
   95E3 26 C0         [ 7] 2536 	ld	h, #0xC0
   95E5 E5            [11] 2537 	push	hl
   95E6 CD 70 88      [17] 2538 	call	_cpct_getScreenPtr
   95E9 4D            [ 4] 2539 	ld	c,l
   95EA 44            [ 4] 2540 	ld	b,h
                           2541 ;src/main.c:641: cpct_drawSolidBox(memptr, 0, 40, 7);  //borra la mitad derecha
   95EB 21 28 07      [10] 2542 	ld	hl,#0x0728
   95EE E5            [11] 2543 	push	hl
   95EF AF            [ 4] 2544 	xor	a, a
   95F0 F5            [11] 2545 	push	af
   95F1 33            [ 6] 2546 	inc	sp
   95F2 C5            [11] 2547 	push	bc
   95F3 CD 96 87      [17] 2548 	call	_cpct_drawSolidBox
   95F6 F1            [10] 2549 	pop	af
                           2550 ;src/main.c:642: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 40, 176); // posición para borrar la mitad izquierda
   95F7 33            [ 6] 2551 	inc	sp
   95F8 21 28 B0      [10] 2552 	ld	hl,#0xB028
   95FB E3            [19] 2553 	ex	(sp),hl
   95FC 21 00 C0      [10] 2554 	ld	hl,#0xC000
   95FF E5            [11] 2555 	push	hl
   9600 CD 70 88      [17] 2556 	call	_cpct_getScreenPtr
   9603 4D            [ 4] 2557 	ld	c,l
   9604 44            [ 4] 2558 	ld	b,h
                           2559 ;src/main.c:643: cpct_drawSolidBox(memptr, 0, 40, 7);  //borra la mitad izquierda
   9605 21 28 07      [10] 2560 	ld	hl,#0x0728
   9608 E5            [11] 2561 	push	hl
   9609 AF            [ 4] 2562 	xor	a, a
   960A F5            [11] 2563 	push	af
   960B 33            [ 6] 2564 	inc	sp
   960C C5            [11] 2565 	push	bc
   960D CD 96 87      [17] 2566 	call	_cpct_drawSolidBox
   9610 F1            [10] 2567 	pop	af
   9611 F1            [10] 2568 	pop	af
   9612 33            [ 6] 2569 	inc	sp
   9613 C9            [10] 2570 	ret
                           2571 ;src/main.c:646: void menuInicio(){
                           2572 ;	---------------------------------
                           2573 ; Function menuInicio
                           2574 ; ---------------------------------
   9614                    2575 _menuInicio::
                           2576 ;src/main.c:650: cpct_clearScreen(0);
   9614 21 00 40      [10] 2577 	ld	hl,#0x4000
   9617 E5            [11] 2578 	push	hl
   9618 AF            [ 4] 2579 	xor	a, a
   9619 F5            [11] 2580 	push	af
   961A 33            [ 6] 2581 	inc	sp
   961B 26 C0         [ 7] 2582 	ld	h, #0xC0
   961D E5            [11] 2583 	push	hl
   961E CD 2A 7F      [17] 2584 	call	_cpct_memset
                           2585 ;src/main.c:652: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   9621 21 1A 0F      [10] 2586 	ld	hl,#0x0F1A
   9624 E5            [11] 2587 	push	hl
   9625 21 00 C0      [10] 2588 	ld	hl,#0xC000
   9628 E5            [11] 2589 	push	hl
   9629 CD 70 88      [17] 2590 	call	_cpct_getScreenPtr
   962C 4D            [ 4] 2591 	ld	c,l
   962D 44            [ 4] 2592 	ld	b,h
                           2593 ;src/main.c:653: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   962E 21 04 00      [10] 2594 	ld	hl,#0x0004
   9631 E5            [11] 2595 	push	hl
   9632 C5            [11] 2596 	push	bc
   9633 21 C7 96      [10] 2597 	ld	hl,#___str_5
   9636 E5            [11] 2598 	push	hl
   9637 CD 7B 7C      [17] 2599 	call	_cpct_drawStringM0
   963A 21 06 00      [10] 2600 	ld	hl,#6
   963D 39            [11] 2601 	add	hl,sp
   963E F9            [ 6] 2602 	ld	sp,hl
                           2603 ;src/main.c:655: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   963F 21 28 6E      [10] 2604 	ld	hl,#0x6E28
   9642 E5            [11] 2605 	push	hl
   9643 21 F0 F0      [10] 2606 	ld	hl,#0xF0F0
   9646 E5            [11] 2607 	push	hl
   9647 21 00 56      [10] 2608 	ld	hl,#_g_text_0
   964A E5            [11] 2609 	push	hl
   964B CD 9F 7C      [17] 2610 	call	_cpct_drawSprite
                           2611 ;src/main.c:656: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   964E 21 28 6E      [10] 2612 	ld	hl,#0x6E28
   9651 E5            [11] 2613 	push	hl
   9652 21 18 F1      [10] 2614 	ld	hl,#0xF118
   9655 E5            [11] 2615 	push	hl
   9656 21 30 67      [10] 2616 	ld	hl,#_g_text_1
   9659 E5            [11] 2617 	push	hl
   965A CD 9F 7C      [17] 2618 	call	_cpct_drawSprite
                           2619 ;src/main.c:679: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   965D 21 08 A0      [10] 2620 	ld	hl,#0xA008
   9660 E5            [11] 2621 	push	hl
   9661 21 00 C0      [10] 2622 	ld	hl,#0xC000
   9664 E5            [11] 2623 	push	hl
   9665 CD 70 88      [17] 2624 	call	_cpct_getScreenPtr
   9668 4D            [ 4] 2625 	ld	c,l
   9669 44            [ 4] 2626 	ld	b,h
                           2627 ;src/main.c:680: cpct_drawStringM0("TO START PRESS S", memptr, 4, 0);
   966A 21 04 00      [10] 2628 	ld	hl,#0x0004
   966D E5            [11] 2629 	push	hl
   966E C5            [11] 2630 	push	bc
   966F 21 CF 96      [10] 2631 	ld	hl,#___str_6
   9672 E5            [11] 2632 	push	hl
   9673 CD 7B 7C      [17] 2633 	call	_cpct_drawStringM0
   9676 21 06 00      [10] 2634 	ld	hl,#6
   9679 39            [11] 2635 	add	hl,sp
   967A F9            [ 6] 2636 	ld	sp,hl
                           2637 ;src/main.c:682: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 170); // centrado en horizontal y abajo en vertical
   967B 21 0A AA      [10] 2638 	ld	hl,#0xAA0A
   967E E5            [11] 2639 	push	hl
   967F 21 00 C0      [10] 2640 	ld	hl,#0xC000
   9682 E5            [11] 2641 	push	hl
   9683 CD 70 88      [17] 2642 	call	_cpct_getScreenPtr
   9686 4D            [ 4] 2643 	ld	c,l
   9687 44            [ 4] 2644 	ld	b,h
                           2645 ;src/main.c:683: cpct_drawStringM0("TO MENU PRESS M", memptr, 4, 0);
   9688 21 04 00      [10] 2646 	ld	hl,#0x0004
   968B E5            [11] 2647 	push	hl
   968C C5            [11] 2648 	push	bc
   968D 21 E0 96      [10] 2649 	ld	hl,#___str_7
   9690 E5            [11] 2650 	push	hl
   9691 CD 7B 7C      [17] 2651 	call	_cpct_drawStringM0
   9694 21 06 00      [10] 2652 	ld	hl,#6
   9697 39            [11] 2653 	add	hl,sp
   9698 F9            [ 6] 2654 	ld	sp,hl
                           2655 ;src/main.c:686: do{
   9699                    2656 00106$:
                           2657 ;src/main.c:687: cpct_scanKeyboard_f();
   9699 CD 05 7C      [17] 2658 	call	_cpct_scanKeyboard_f
                           2659 ;src/main.c:690: else */if(cpct_isKeyPressed(Key_M)){
   969C 21 04 40      [10] 2660 	ld	hl,#0x4004
   969F CD F9 7B      [17] 2661 	call	_cpct_isKeyPressed
   96A2 7D            [ 4] 2662 	ld	a,l
   96A3 B7            [ 4] 2663 	or	a, a
   96A4 28 0D         [12] 2664 	jr	Z,00107$
                           2665 ;src/main.c:691: cpct_scanKeyboard_f();
   96A6 CD 05 7C      [17] 2666 	call	_cpct_scanKeyboard_f
                           2667 ;src/main.c:692: do{
   96A9                    2668 00101$:
                           2669 ;src/main.c:694: } while(!cpct_isKeyPressed(Key_S));
   96A9 21 07 10      [10] 2670 	ld	hl,#0x1007
   96AC CD F9 7B      [17] 2671 	call	_cpct_isKeyPressed
   96AF 7D            [ 4] 2672 	ld	a,l
   96B0 B7            [ 4] 2673 	or	a, a
   96B1 28 F6         [12] 2674 	jr	Z,00101$
   96B3                    2675 00107$:
                           2676 ;src/main.c:696: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   96B3 21 07 10      [10] 2677 	ld	hl,#0x1007
   96B6 CD F9 7B      [17] 2678 	call	_cpct_isKeyPressed
   96B9 7D            [ 4] 2679 	ld	a,l
   96BA B7            [ 4] 2680 	or	a, a
   96BB C0            [11] 2681 	ret	NZ
   96BC 21 04 40      [10] 2682 	ld	hl,#0x4004
   96BF CD F9 7B      [17] 2683 	call	_cpct_isKeyPressed
   96C2 7D            [ 4] 2684 	ld	a,l
   96C3 B7            [ 4] 2685 	or	a, a
   96C4 28 D3         [12] 2686 	jr	Z,00106$
   96C6 C9            [10] 2687 	ret
   96C7                    2688 ___str_5:
   96C7 52 4F 42 4F 42 49  2689 	.ascii "ROBOBIT"
        54
   96CE 00                 2690 	.db 0x00
   96CF                    2691 ___str_6:
   96CF 54 4F 20 53 54 41  2692 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   96DF 00                 2693 	.db 0x00
   96E0                    2694 ___str_7:
   96E0 54 4F 20 4D 45 4E  2695 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   96EF 00                 2696 	.db 0x00
                           2697 ;src/main.c:699: void inicializarCPC() {
                           2698 ;	---------------------------------
                           2699 ; Function inicializarCPC
                           2700 ; ---------------------------------
   96F0                    2701 _inicializarCPC::
                           2702 ;src/main.c:700: cpct_disableFirmware();
   96F0 CD 61 87      [17] 2703 	call	_cpct_disableFirmware
                           2704 ;src/main.c:701: cpct_setVideoMode(0);
   96F3 2E 00         [ 7] 2705 	ld	l,#0x00
   96F5 CD 0C 7F      [17] 2706 	call	_cpct_setVideoMode
                           2707 ;src/main.c:702: cpct_setBorder(HW_BLACK);
   96F8 21 10 14      [10] 2708 	ld	hl,#0x1410
   96FB E5            [11] 2709 	push	hl
   96FC CD 6F 7C      [17] 2710 	call	_cpct_setPALColour
                           2711 ;src/main.c:703: cpct_setPalette(g_palette, 16);
   96FF 21 10 00      [10] 2712 	ld	hl,#0x0010
   9702 E5            [11] 2713 	push	hl
   9703 21 98 7A      [10] 2714 	ld	hl,#_g_palette
   9706 E5            [11] 2715 	push	hl
   9707 CD E2 7B      [17] 2716 	call	_cpct_setPalette
                           2717 ;src/main.c:704: cpct_akp_musicInit(G_song);
   970A 21 00 3F      [10] 2718 	ld	hl,#_G_song
   970D E5            [11] 2719 	push	hl
   970E CD 3D 86      [17] 2720 	call	_cpct_akp_musicInit
   9711 F1            [10] 2721 	pop	af
   9712 C9            [10] 2722 	ret
                           2723 ;src/main.c:707: void inicializarEnemy() {
                           2724 ;	---------------------------------
                           2725 ; Function inicializarEnemy
                           2726 ; ---------------------------------
   9713                    2727 _inicializarEnemy::
   9713 DD E5         [15] 2728 	push	ix
   9715 DD 21 00 00   [14] 2729 	ld	ix,#0
   9719 DD 39         [15] 2730 	add	ix,sp
   971B 3B            [ 6] 2731 	dec	sp
                           2732 ;src/main.c:713: actual = enemy;
   971C 01 F4 88      [10] 2733 	ld	bc,#_enemy+0
                           2734 ;src/main.c:714: while(--i){
   971F DD 36 FF 05   [19] 2735 	ld	-1 (ix),#0x05
   9723                    2736 00101$:
   9723 DD 35 FF      [23] 2737 	dec	-1 (ix)
   9726 DD 7E FF      [19] 2738 	ld	a,-1 (ix)
   9729 B7            [ 4] 2739 	or	a, a
   972A 28 5C         [12] 2740 	jr	Z,00104$
                           2741 ;src/main.c:715: actual->x = actual->px = spawnX[i];
   972C 59            [ 4] 2742 	ld	e, c
   972D 50            [ 4] 2743 	ld	d, b
   972E 13            [ 6] 2744 	inc	de
   972F 13            [ 6] 2745 	inc	de
   9730 3E 51         [ 7] 2746 	ld	a,#<(_spawnX)
   9732 DD 86 FF      [19] 2747 	add	a, -1 (ix)
   9735 6F            [ 4] 2748 	ld	l,a
   9736 3E 89         [ 7] 2749 	ld	a,#>(_spawnX)
   9738 CE 00         [ 7] 2750 	adc	a, #0x00
   973A 67            [ 4] 2751 	ld	h,a
   973B 7E            [ 7] 2752 	ld	a,(hl)
   973C 12            [ 7] 2753 	ld	(de),a
   973D 02            [ 7] 2754 	ld	(bc),a
                           2755 ;src/main.c:716: actual->y = actual->py = spawnY[i];
   973E C5            [11] 2756 	push	bc
   973F FD E1         [14] 2757 	pop	iy
   9741 FD 23         [10] 2758 	inc	iy
   9743 59            [ 4] 2759 	ld	e, c
   9744 50            [ 4] 2760 	ld	d, b
   9745 13            [ 6] 2761 	inc	de
   9746 13            [ 6] 2762 	inc	de
   9747 13            [ 6] 2763 	inc	de
   9748 3E 56         [ 7] 2764 	ld	a,#<(_spawnY)
   974A DD 86 FF      [19] 2765 	add	a, -1 (ix)
   974D 6F            [ 4] 2766 	ld	l,a
   974E 3E 89         [ 7] 2767 	ld	a,#>(_spawnY)
   9750 CE 00         [ 7] 2768 	adc	a, #0x00
   9752 67            [ 4] 2769 	ld	h,a
   9753 7E            [ 7] 2770 	ld	a,(hl)
   9754 12            [ 7] 2771 	ld	(de),a
   9755 FD 77 00      [19] 2772 	ld	0 (iy), a
                           2773 ;src/main.c:717: actual->mover  = NO;
   9758 21 06 00      [10] 2774 	ld	hl,#0x0006
   975B 09            [11] 2775 	add	hl,bc
   975C 36 00         [10] 2776 	ld	(hl),#0x00
                           2777 ;src/main.c:718: actual->mira   = M_abajo;
   975E 21 07 00      [10] 2778 	ld	hl,#0x0007
   9761 09            [11] 2779 	add	hl,bc
   9762 36 03         [10] 2780 	ld	(hl),#0x03
                           2781 ;src/main.c:719: actual->sprite = g_enemy;
   9764 21 04 00      [10] 2782 	ld	hl,#0x0004
   9767 09            [11] 2783 	add	hl,bc
   9768 36 72         [10] 2784 	ld	(hl),#<(_g_enemy)
   976A 23            [ 6] 2785 	inc	hl
   976B 36 78         [10] 2786 	ld	(hl),#>(_g_enemy)
                           2787 ;src/main.c:720: actual->muerto = NO;
   976D 21 08 00      [10] 2788 	ld	hl,#0x0008
   9770 09            [11] 2789 	add	hl,bc
   9771 36 00         [10] 2790 	ld	(hl),#0x00
                           2791 ;src/main.c:721: actual->patrol = SI;
   9773 21 09 00      [10] 2792 	ld	hl,#0x0009
   9776 09            [11] 2793 	add	hl,bc
   9777 36 01         [10] 2794 	ld	(hl),#0x01
                           2795 ;src/main.c:722: dibujarEnemigo(actual);
   9779 C5            [11] 2796 	push	bc
   977A C5            [11] 2797 	push	bc
   977B CD AC 8B      [17] 2798 	call	_dibujarEnemigo
   977E F1            [10] 2799 	pop	af
   977F C1            [10] 2800 	pop	bc
                           2801 ;src/main.c:724: actual++;
   9780 21 0B 00      [10] 2802 	ld	hl,#0x000B
   9783 09            [11] 2803 	add	hl,bc
   9784 4D            [ 4] 2804 	ld	c,l
   9785 44            [ 4] 2805 	ld	b,h
   9786 18 9B         [12] 2806 	jr	00101$
   9788                    2807 00104$:
   9788 33            [ 6] 2808 	inc	sp
   9789 DD E1         [14] 2809 	pop	ix
   978B C9            [10] 2810 	ret
                           2811 ;src/main.c:728: void inicializarJuego() {
                           2812 ;	---------------------------------
                           2813 ; Function inicializarJuego
                           2814 ; ---------------------------------
   978C                    2815 _inicializarJuego::
                           2816 ;src/main.c:732: actual = enemy;
                           2817 ;src/main.c:735: num_mapa = 0;
   978C 21 34 89      [10] 2818 	ld	hl,#_num_mapa + 0
   978F 36 00         [10] 2819 	ld	(hl), #0x00
                           2820 ;src/main.c:736: mapa = mapas[num_mapa];
   9791 21 4B 89      [10] 2821 	ld	hl, #_mapas + 0
   9794 7E            [ 7] 2822 	ld	a,(hl)
   9795 FD 21 32 89   [14] 2823 	ld	iy,#_mapa
   9799 FD 77 00      [19] 2824 	ld	0 (iy),a
   979C 23            [ 6] 2825 	inc	hl
   979D 7E            [ 7] 2826 	ld	a,(hl)
   979E 32 33 89      [13] 2827 	ld	(#_mapa + 1),a
                           2828 ;src/main.c:737: cpct_etm_setTileset2x4(g_tileset);
   97A1 21 E0 54      [10] 2829 	ld	hl,#_g_tileset
   97A4 CD D3 7D      [17] 2830 	call	_cpct_etm_setTileset2x4
                           2831 ;src/main.c:738: dibujarMapa();
   97A7 CD 35 89      [17] 2832 	call	_dibujarMapa
                           2833 ;src/main.c:739: borrarPantallaAbajo();
   97AA CD DF 95      [17] 2834 	call	_borrarPantallaAbajo
                           2835 ;src/main.c:740: barraPuntuacionInicial();
   97AD CD 1D 95      [17] 2836 	call	_barraPuntuacionInicial
                           2837 ;src/main.c:743: prota.x = prota.px = 4;
   97B0 21 22 89      [10] 2838 	ld	hl,#(_prota + 0x0002)
   97B3 36 04         [10] 2839 	ld	(hl),#0x04
   97B5 21 20 89      [10] 2840 	ld	hl,#_prota
   97B8 36 04         [10] 2841 	ld	(hl),#0x04
                           2842 ;src/main.c:744: prota.y = prota.py = 80;
   97BA 21 23 89      [10] 2843 	ld	hl,#(_prota + 0x0003)
   97BD 36 50         [10] 2844 	ld	(hl),#0x50
   97BF 21 21 89      [10] 2845 	ld	hl,#(_prota + 0x0001)
   97C2 36 50         [10] 2846 	ld	(hl),#0x50
                           2847 ;src/main.c:745: prota.mover  = NO;
   97C4 21 26 89      [10] 2848 	ld	hl,#(_prota + 0x0006)
   97C7 36 00         [10] 2849 	ld	(hl),#0x00
                           2850 ;src/main.c:746: prota.mira=M_derecha;
   97C9 21 27 89      [10] 2851 	ld	hl,#(_prota + 0x0007)
   97CC 36 00         [10] 2852 	ld	(hl),#0x00
                           2853 ;src/main.c:747: prota.sprite = g_hero;
   97CE 21 A8 7A      [10] 2854 	ld	hl,#_g_hero
   97D1 22 24 89      [16] 2855 	ld	((_prota + 0x0004)), hl
                           2856 ;src/main.c:751: cu.x = cu.px = 0;
   97D4 21 2A 89      [10] 2857 	ld	hl,#(_cu + 0x0002)
   97D7 36 00         [10] 2858 	ld	(hl),#0x00
   97D9 21 28 89      [10] 2859 	ld	hl,#_cu
   97DC 36 00         [10] 2860 	ld	(hl),#0x00
                           2861 ;src/main.c:752: cu.y = cu.py = 0;
   97DE 21 2B 89      [10] 2862 	ld	hl,#(_cu + 0x0003)
   97E1 36 00         [10] 2863 	ld	(hl),#0x00
   97E3 21 29 89      [10] 2864 	ld	hl,#(_cu + 0x0001)
   97E6 36 00         [10] 2865 	ld	(hl),#0x00
                           2866 ;src/main.c:753: cu.lanzado = NO;
   97E8 21 2E 89      [10] 2867 	ld	hl,#(_cu + 0x0006)
   97EB 36 00         [10] 2868 	ld	(hl),#0x00
                           2869 ;src/main.c:754: cu.mover = NO;
   97ED 21 31 89      [10] 2870 	ld	hl,#(_cu + 0x0009)
   97F0 36 00         [10] 2871 	ld	(hl),#0x00
                           2872 ;src/main.c:756: inicializarEnemy();
   97F2 CD 13 97      [17] 2873 	call	_inicializarEnemy
                           2874 ;src/main.c:758: dibujarProta();
   97F5 CD 5B 89      [17] 2875 	call	_dibujarProta
                           2876 ;src/main.c:759: dibujarEnemigo(actual);
   97F8 21 F4 88      [10] 2877 	ld	hl,#_enemy
   97FB E5            [11] 2878 	push	hl
   97FC CD AC 8B      [17] 2879 	call	_dibujarEnemigo
   97FF F1            [10] 2880 	pop	af
   9800 C9            [10] 2881 	ret
                           2882 ;src/main.c:762: void main(void) {
                           2883 ;	---------------------------------
                           2884 ; Function main
                           2885 ; ---------------------------------
   9801                    2886 _main::
   9801 DD E5         [15] 2887 	push	ix
   9803 DD 21 00 00   [14] 2888 	ld	ix,#0
   9807 DD 39         [15] 2889 	add	ix,sp
   9809 3B            [ 6] 2890 	dec	sp
                           2891 ;src/main.c:766: inicializarCPC();
   980A CD F0 96      [17] 2892 	call	_inicializarCPC
                           2893 ;src/main.c:767: menuInicio();
   980D CD 14 96      [17] 2894 	call	_menuInicio
                           2895 ;src/main.c:771: inicializarJuego();
   9810 CD 8C 97      [17] 2896 	call	_inicializarJuego
                           2897 ;src/main.c:776: cpct_akp_musicPlay();
   9813 CD 3A 7F      [17] 2898 	call	_cpct_akp_musicPlay
                           2899 ;src/main.c:779: actual = enemy;
                           2900 ;src/main.c:781: while (1) {
   9816                    2901 00115$:
                           2902 ;src/main.c:783: cpct_waitVSYNC();
   9816 CD 04 7F      [17] 2903 	call	_cpct_waitVSYNC
                           2904 ;src/main.c:784: comprobarTeclado();
   9819 CD F2 92      [17] 2905 	call	_comprobarTeclado
                           2906 ;src/main.c:785: moverCuchillo();
   981C CD 31 94      [17] 2907 	call	_moverCuchillo
                           2908 ;src/main.c:789: cpct_waitVSYNC();
   981F CD 04 7F      [17] 2909 	call	_cpct_waitVSYNC
                           2910 ;src/main.c:791: if (prota.mover) {
   9822 01 26 89      [10] 2911 	ld	bc,#_prota+6
   9825 0A            [ 7] 2912 	ld	a,(bc)
   9826 B7            [ 4] 2913 	or	a, a
   9827 28 07         [12] 2914 	jr	Z,00102$
                           2915 ;src/main.c:792: redibujarProta();
   9829 C5            [11] 2916 	push	bc
   982A CD 1B 8A      [17] 2917 	call	_redibujarProta
   982D C1            [10] 2918 	pop	bc
                           2919 ;src/main.c:793: prota.mover = NO;
   982E AF            [ 4] 2920 	xor	a, a
   982F 02            [ 7] 2921 	ld	(bc),a
   9830                    2922 00102$:
                           2923 ;src/main.c:795: if(cu.lanzado && cu.mover){
   9830 21 2E 89      [10] 2924 	ld	hl,#_cu + 6
   9833 4E            [ 7] 2925 	ld	c,(hl)
   9834 11 31 89      [10] 2926 	ld	de,#_cu + 9
   9837 79            [ 4] 2927 	ld	a,c
   9838 B7            [ 4] 2928 	or	a, a
   9839 28 09         [12] 2929 	jr	Z,00107$
   983B 1A            [ 7] 2930 	ld	a,(de)
   983C B7            [ 4] 2931 	or	a, a
   983D 28 05         [12] 2932 	jr	Z,00107$
                           2933 ;src/main.c:796: redibujarCuchillo();
   983F CD C2 91      [17] 2934 	call	_redibujarCuchillo
   9842 18 0B         [12] 2935 	jr	00108$
   9844                    2936 00107$:
                           2937 ;src/main.c:797: }else if (cu.lanzado && !cu.mover){
   9844 79            [ 4] 2938 	ld	a,c
   9845 B7            [ 4] 2939 	or	a, a
   9846 28 07         [12] 2940 	jr	Z,00108$
   9848 1A            [ 7] 2941 	ld	a,(de)
   9849 B7            [ 4] 2942 	or	a, a
   984A 20 03         [12] 2943 	jr	NZ,00108$
                           2944 ;src/main.c:798: borrarCuchillo();
   984C CD 55 91      [17] 2945 	call	_borrarCuchillo
   984F                    2946 00108$:
                           2947 ;src/main.c:801: if(enemy->mover){
   984F 3A FA 88      [13] 2948 	ld	a, (#_enemy + 6)
   9852 B7            [ 4] 2949 	or	a, a
   9853 28 08         [12] 2950 	jr	Z,00111$
                           2951 ;src/main.c:802: redibujarEnemigo(actual);
   9855 21 F4 88      [10] 2952 	ld	hl,#_enemy
   9858 E5            [11] 2953 	push	hl
   9859 CD EB 8C      [17] 2954 	call	_redibujarEnemigo
   985C F1            [10] 2955 	pop	af
   985D                    2956 00111$:
                           2957 ;src/main.c:804: if (enemy->muerto){
   985D 3A FC 88      [13] 2958 	ld	a,(#_enemy + 8)
   9860 DD 77 FF      [19] 2959 	ld	-1 (ix), a
   9863 B7            [ 4] 2960 	or	a, a
   9864 28 B0         [12] 2961 	jr	Z,00115$
                           2962 ;src/main.c:805: borrarEnemigo(actual);
   9866 21 F4 88      [10] 2963 	ld	hl,#_enemy
   9869 E5            [11] 2964 	push	hl
   986A CD 6D 8C      [17] 2965 	call	_borrarEnemigo
   986D F1            [10] 2966 	pop	af
                           2967 ;src/main.c:806: dibujarExplosion();
   986E CD E4 8B      [17] 2968 	call	_dibujarExplosion
                           2969 ;src/main.c:807: borrarExplosion();
   9871 CD 0A 8C      [17] 2970 	call	_borrarExplosion
   9874 18 A0         [12] 2971 	jr	00115$
   9876 33            [ 6] 2972 	inc	sp
   9877 DD E1         [14] 2973 	pop	ix
   9879 C9            [10] 2974 	ret
                           2975 	.area _CODE
                           2976 	.area _INITIALIZER
                           2977 	.area _CABS (ABS)
   3F00                    2978 	.org 0x3F00
   3F00                    2979 _G_song:
   3F00 41                 2980 	.db #0x41	; 65	'A'
   3F01 54                 2981 	.db #0x54	; 84	'T'
   3F02 31                 2982 	.db #0x31	; 49	'1'
   3F03 30                 2983 	.db #0x30	; 48	'0'
   3F04 01                 2984 	.db #0x01	; 1
   3F05 40                 2985 	.db #0x40	; 64
   3F06 42                 2986 	.db #0x42	; 66	'B'
   3F07 0F                 2987 	.db #0x0F	; 15
   3F08 02                 2988 	.db #0x02	; 2
   3F09 06                 2989 	.db #0x06	; 6
   3F0A 1D                 2990 	.db #0x1D	; 29
   3F0B 00                 2991 	.db #0x00	; 0
   3F0C 10                 2992 	.db #0x10	; 16
   3F0D 40                 2993 	.db #0x40	; 64
   3F0E 19                 2994 	.db #0x19	; 25
   3F0F 40                 2995 	.db #0x40	; 64
   3F10 00                 2996 	.db #0x00	; 0
   3F11 00                 2997 	.db #0x00	; 0
   3F12 00                 2998 	.db #0x00	; 0
   3F13 00                 2999 	.db #0x00	; 0
   3F14 00                 3000 	.db #0x00	; 0
   3F15 00                 3001 	.db #0x00	; 0
   3F16 0D                 3002 	.db #0x0D	; 13
   3F17 12                 3003 	.db #0x12	; 18
   3F18 40                 3004 	.db #0x40	; 64
   3F19 01                 3005 	.db #0x01	; 1
   3F1A 00                 3006 	.db #0x00	; 0
   3F1B 7C                 3007 	.db #0x7C	; 124
   3F1C 18                 3008 	.db #0x18	; 24
   3F1D 78                 3009 	.db #0x78	; 120	'x'
   3F1E 0C                 3010 	.db #0x0C	; 12
   3F1F 34                 3011 	.db #0x34	; 52	'4'
   3F20 30                 3012 	.db #0x30	; 48	'0'
   3F21 2C                 3013 	.db #0x2C	; 44
   3F22 28                 3014 	.db #0x28	; 40
   3F23 24                 3015 	.db #0x24	; 36
   3F24 20                 3016 	.db #0x20	; 32
   3F25 1C                 3017 	.db #0x1C	; 28
   3F26 0D                 3018 	.db #0x0D	; 13
   3F27 25                 3019 	.db #0x25	; 37
   3F28 40                 3020 	.db #0x40	; 64
   3F29 20                 3021 	.db #0x20	; 32
   3F2A 00                 3022 	.db #0x00	; 0
   3F2B 00                 3023 	.db #0x00	; 0
   3F2C 00                 3024 	.db #0x00	; 0
   3F2D 39                 3025 	.db #0x39	; 57	'9'
   3F2E 40                 3026 	.db #0x40	; 64
   3F2F 00                 3027 	.db #0x00	; 0
   3F30 57                 3028 	.db #0x57	; 87	'W'
   3F31 40                 3029 	.db #0x40	; 64
   3F32 3B                 3030 	.db #0x3B	; 59
   3F33 40                 3031 	.db #0x40	; 64
   3F34 57                 3032 	.db #0x57	; 87	'W'
   3F35 40                 3033 	.db #0x40	; 64
   3F36 01                 3034 	.db #0x01	; 1
   3F37 2F                 3035 	.db #0x2F	; 47
   3F38 40                 3036 	.db #0x40	; 64
   3F39 19                 3037 	.db #0x19	; 25
   3F3A 00                 3038 	.db #0x00	; 0
   3F3B 76                 3039 	.db #0x76	; 118	'v'
   3F3C E1                 3040 	.db #0xE1	; 225
   3F3D 00                 3041 	.db #0x00	; 0
   3F3E 00                 3042 	.db #0x00	; 0
   3F3F 01                 3043 	.db #0x01	; 1
   3F40 04                 3044 	.db #0x04	; 4
   3F41 51                 3045 	.db #0x51	; 81	'Q'
   3F42 04                 3046 	.db #0x04	; 4
   3F43 37                 3047 	.db #0x37	; 55	'7'
   3F44 04                 3048 	.db #0x04	; 4
   3F45 4F                 3049 	.db #0x4F	; 79	'O'
   3F46 04                 3050 	.db #0x04	; 4
   3F47 37                 3051 	.db #0x37	; 55	'7'
   3F48 02                 3052 	.db #0x02	; 2
   3F49 4B                 3053 	.db #0x4B	; 75	'K'
   3F4A 02                 3054 	.db #0x02	; 2
   3F4B 37                 3055 	.db #0x37	; 55	'7'
   3F4C 04                 3056 	.db #0x04	; 4
   3F4D 4F                 3057 	.db #0x4F	; 79	'O'
   3F4E 04                 3058 	.db #0x04	; 4
   3F4F 37                 3059 	.db #0x37	; 55	'7'
   3F50 04                 3060 	.db #0x04	; 4
   3F51 4F                 3061 	.db #0x4F	; 79	'O'
   3F52 04                 3062 	.db #0x04	; 4
   3F53 37                 3063 	.db #0x37	; 55	'7'
   3F54 02                 3064 	.db #0x02	; 2
   3F55 4B                 3065 	.db #0x4B	; 75	'K'
   3F56 00                 3066 	.db #0x00	; 0
   3F57 42                 3067 	.db #0x42	; 66	'B'
   3F58 60                 3068 	.db #0x60	; 96
   3F59 00                 3069 	.db #0x00	; 0
   3F5A 42                 3070 	.db #0x42	; 66	'B'
   3F5B 80                 3071 	.db #0x80	; 128
   3F5C 00                 3072 	.db #0x00	; 0
   3F5D 00                 3073 	.db #0x00	; 0
   3F5E 42                 3074 	.db #0x42	; 66	'B'
   3F5F 00                 3075 	.db #0x00	; 0
   3F60 00                 3076 	.db #0x00	; 0
