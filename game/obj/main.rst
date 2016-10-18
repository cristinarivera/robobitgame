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
                             75 	.globl _mapas
                             76 ;--------------------------------------------------------
                             77 ; special function registers
                             78 ;--------------------------------------------------------
                             79 ;--------------------------------------------------------
                             80 ; ram data
                             81 ;--------------------------------------------------------
                             82 	.area _DATA
   88F2                      83 _EMirar::
   88F2                      84 	.ds 1
   88F3                      85 _EEje::
   88F3                      86 	.ds 1
   88F4                      87 _enemy::
   88F4                      88 	.ds 40
   891C                      89 _prota::
   891C                      90 	.ds 8
   8924                      91 _cu::
   8924                      92 	.ds 10
   892E                      93 _mapa::
   892E                      94 	.ds 2
   8930                      95 _num_mapa::
   8930                      96 	.ds 1
                             97 ;--------------------------------------------------------
                             98 ; ram data
                             99 ;--------------------------------------------------------
                            100 	.area _INITIALIZED
                            101 ;--------------------------------------------------------
                            102 ; absolute external ram data
                            103 ;--------------------------------------------------------
                            104 	.area _DABS (ABS)
                            105 ;--------------------------------------------------------
                            106 ; global & static initialisations
                            107 ;--------------------------------------------------------
                            108 	.area _HOME
                            109 	.area _GSINIT
                            110 	.area _GSFINAL
                            111 	.area _GSINIT
                            112 ;--------------------------------------------------------
                            113 ; Home
                            114 ;--------------------------------------------------------
                            115 	.area _HOME
                            116 	.area _HOME
                            117 ;--------------------------------------------------------
                            118 ; code
                            119 ;--------------------------------------------------------
                            120 	.area _CODE
                            121 ;src/main.c:116: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
                            122 ;	---------------------------------
                            123 ; Function dummy_cpct_transparentMaskTable0M0_container
                            124 ; ---------------------------------
   7B92                     125 _dummy_cpct_transparentMaskTable0M0_container::
                            126 	.area _g_tablatrans_ (ABS) 
   3E00                     127 	.org 0x3E00 
   3E00                     128 	 _g_tablatrans::
   3E00 FF AA 55 00 AA AA   129 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E08 55 00 55 00 00 00   130 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E10 AA AA 00 00 AA AA   131 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E18 00 00 00 00 00 00   132 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E20 55 00 55 00 00 00   133 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E28 55 00 55 00 00 00   134 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E30 00 00 00 00 00 00   135 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E38 00 00 00 00 00 00   136 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E40 AA AA 00 00 AA AA   137 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E48 00 00 00 00 00 00   138 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E50 AA AA 00 00 AA AA   139 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E58 00 00 00 00 00 00   140 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E60 00 00 00 00 00 00   141 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E68 00 00 00 00 00 00   142 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E70 00 00 00 00 00 00   143 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E78 00 00 00 00 00 00   144 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E80 55 00 55 00 00 00   145 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E88 55 00 55 00 00 00   146 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E90 00 00 00 00 00 00   147 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E98 00 00 00 00 00 00   148 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA0 55 00 55 00 00 00   149 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA8 55 00 55 00 00 00   150 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB0 00 00 00 00 00 00   151 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB8 00 00 00 00 00 00   152 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC0 00 00 00 00 00 00   153 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC8 00 00 00 00 00 00   154 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED0 00 00 00 00 00 00   155 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED8 00 00 00 00 00 00   156 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE0 00 00 00 00 00 00   157 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE8 00 00 00 00 00 00   158 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF0 00 00 00 00 00 00   159 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF8 00 00 00 00 00 00   160 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            161 	.area _CSEG (REL, CON) 
                            162 ;src/main.c:119: void dibujarMapa() {
                            163 ;	---------------------------------
                            164 ; Function dibujarMapa
                            165 ; ---------------------------------
   8931                     166 _dibujarMapa::
                            167 ;src/main.c:120: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   8931 2A 2E 89      [16]  168 	ld	hl,(_mapa)
   8934 E5            [11]  169 	push	hl
   8935 21 00 C0      [10]  170 	ld	hl,#0xC000
   8938 E5            [11]  171 	push	hl
   8939 21 2C 28      [10]  172 	ld	hl,#0x282C
   893C E5            [11]  173 	push	hl
   893D 2E 00         [ 7]  174 	ld	l, #0x00
   893F E5            [11]  175 	push	hl
   8940 AF            [ 4]  176 	xor	a, a
   8941 F5            [11]  177 	push	af
   8942 33            [ 6]  178 	inc	sp
   8943 CD 44 7D      [17]  179 	call	_cpct_etm_drawTileBox2x4
   8946 C9            [10]  180 	ret
   8947                     181 _mapas:
   8947 C0 4D               182 	.dw _g_map1
   8949 E0 46               183 	.dw _g_map2
   894B 00 40               184 	.dw _g_map3
                            185 ;src/main.c:125: void dibujarProta() {
                            186 ;	---------------------------------
                            187 ; Function dibujarProta
                            188 ; ---------------------------------
   894D                     189 _dibujarProta::
                            190 ;src/main.c:126: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   894D 21 1D 89      [10]  191 	ld	hl, #_prota + 1
   8950 56            [ 7]  192 	ld	d,(hl)
   8951 21 1C 89      [10]  193 	ld	hl, #_prota + 0
   8954 46            [ 7]  194 	ld	b,(hl)
   8955 D5            [11]  195 	push	de
   8956 33            [ 6]  196 	inc	sp
   8957 C5            [11]  197 	push	bc
   8958 33            [ 6]  198 	inc	sp
   8959 21 00 C0      [10]  199 	ld	hl,#0xC000
   895C E5            [11]  200 	push	hl
   895D CD 70 88      [17]  201 	call	_cpct_getScreenPtr
   8960 EB            [ 4]  202 	ex	de,hl
                            203 ;src/main.c:127: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   8961 ED 4B 20 89   [20]  204 	ld	bc, (#_prota + 4)
   8965 21 00 3E      [10]  205 	ld	hl,#_g_tablatrans
   8968 E5            [11]  206 	push	hl
   8969 21 07 16      [10]  207 	ld	hl,#0x1607
   896C E5            [11]  208 	push	hl
   896D D5            [11]  209 	push	de
   896E C5            [11]  210 	push	bc
   896F CD 90 88      [17]  211 	call	_cpct_drawSpriteMaskedAlignedTable
   8972 C9            [10]  212 	ret
                            213 ;src/main.c:130: void borrarProta() {
                            214 ;	---------------------------------
                            215 ; Function borrarProta
                            216 ; ---------------------------------
   8973                     217 _borrarProta::
   8973 DD E5         [15]  218 	push	ix
   8975 DD 21 00 00   [14]  219 	ld	ix,#0
   8979 DD 39         [15]  220 	add	ix,sp
   897B 3B            [ 6]  221 	dec	sp
                            222 ;src/main.c:132: u8 w = 4 + (prota.px & 1);
   897C 21 1E 89      [10]  223 	ld	hl, #_prota + 2
   897F 4E            [ 7]  224 	ld	c,(hl)
   8980 79            [ 4]  225 	ld	a,c
   8981 E6 01         [ 7]  226 	and	a, #0x01
   8983 47            [ 4]  227 	ld	b,a
   8984 04            [ 4]  228 	inc	b
   8985 04            [ 4]  229 	inc	b
   8986 04            [ 4]  230 	inc	b
   8987 04            [ 4]  231 	inc	b
                            232 ;src/main.c:135: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   8988 21 1F 89      [10]  233 	ld	hl, #_prota + 3
   898B 5E            [ 7]  234 	ld	e,(hl)
   898C CB 4B         [ 8]  235 	bit	1, e
   898E 28 04         [12]  236 	jr	Z,00103$
   8990 3E 01         [ 7]  237 	ld	a,#0x01
   8992 18 02         [12]  238 	jr	00104$
   8994                     239 00103$:
   8994 3E 00         [ 7]  240 	ld	a,#0x00
   8996                     241 00104$:
   8996 C6 06         [ 7]  242 	add	a, #0x06
   8998 DD 77 FF      [19]  243 	ld	-1 (ix),a
                            244 ;src/main.c:137: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   899B FD 2A 2E 89   [20]  245 	ld	iy,(_mapa)
   899F 16 00         [ 7]  246 	ld	d,#0x00
   89A1 63            [ 4]  247 	ld	h,e
   89A2 6A            [ 4]  248 	ld	l,d
   89A3 CB 7A         [ 8]  249 	bit	7, d
   89A5 28 05         [12]  250 	jr	Z,00105$
   89A7 13            [ 6]  251 	inc	de
   89A8 13            [ 6]  252 	inc	de
   89A9 13            [ 6]  253 	inc	de
   89AA 63            [ 4]  254 	ld	h,e
   89AB 6A            [ 4]  255 	ld	l,d
   89AC                     256 00105$:
   89AC 5C            [ 4]  257 	ld	e, h
   89AD 55            [ 4]  258 	ld	d, l
   89AE CB 2A         [ 8]  259 	sra	d
   89B0 CB 1B         [ 8]  260 	rr	e
   89B2 CB 2A         [ 8]  261 	sra	d
   89B4 CB 1B         [ 8]  262 	rr	e
   89B6 51            [ 4]  263 	ld	d,c
   89B7 CB 3A         [ 8]  264 	srl	d
   89B9 FD E5         [15]  265 	push	iy
   89BB 21 00 C0      [10]  266 	ld	hl,#0xC000
   89BE E5            [11]  267 	push	hl
   89BF 3E 28         [ 7]  268 	ld	a,#0x28
   89C1 F5            [11]  269 	push	af
   89C2 33            [ 6]  270 	inc	sp
   89C3 DD 7E FF      [19]  271 	ld	a,-1 (ix)
   89C6 F5            [11]  272 	push	af
   89C7 33            [ 6]  273 	inc	sp
   89C8 C5            [11]  274 	push	bc
   89C9 33            [ 6]  275 	inc	sp
   89CA 7B            [ 4]  276 	ld	a,e
   89CB F5            [11]  277 	push	af
   89CC 33            [ 6]  278 	inc	sp
   89CD D5            [11]  279 	push	de
   89CE 33            [ 6]  280 	inc	sp
   89CF CD 44 7D      [17]  281 	call	_cpct_etm_drawTileBox2x4
   89D2 33            [ 6]  282 	inc	sp
   89D3 DD E1         [14]  283 	pop	ix
   89D5 C9            [10]  284 	ret
                            285 ;src/main.c:140: void menuFin(){
                            286 ;	---------------------------------
                            287 ; Function menuFin
                            288 ; ---------------------------------
   89D6                     289 _menuFin::
                            290 ;src/main.c:143: cpct_clearScreen(0);
   89D6 21 00 40      [10]  291 	ld	hl,#0x4000
   89D9 E5            [11]  292 	push	hl
   89DA AF            [ 4]  293 	xor	a, a
   89DB F5            [11]  294 	push	af
   89DC 33            [ 6]  295 	inc	sp
   89DD 26 C0         [ 7]  296 	ld	h, #0xC0
   89DF E5            [11]  297 	push	hl
   89E0 CD 2A 7F      [17]  298 	call	_cpct_memset
                            299 ;src/main.c:145: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   89E3 21 18 5A      [10]  300 	ld	hl,#0x5A18
   89E6 E5            [11]  301 	push	hl
   89E7 21 00 C0      [10]  302 	ld	hl,#0xC000
   89EA E5            [11]  303 	push	hl
   89EB CD 70 88      [17]  304 	call	_cpct_getScreenPtr
   89EE 4D            [ 4]  305 	ld	c,l
   89EF 44            [ 4]  306 	ld	b,h
                            307 ;src/main.c:146: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   89F0 21 02 00      [10]  308 	ld	hl,#0x0002
   89F3 E5            [11]  309 	push	hl
   89F4 C5            [11]  310 	push	bc
   89F5 21 03 8A      [10]  311 	ld	hl,#___str_0
   89F8 E5            [11]  312 	push	hl
   89F9 CD 7B 7C      [17]  313 	call	_cpct_drawStringM0
   89FC 21 06 00      [10]  314 	ld	hl,#6
   89FF 39            [11]  315 	add	hl,sp
   8A00 F9            [ 6]  316 	ld	sp,hl
                            317 ;src/main.c:148: while(1){}
   8A01                     318 00102$:
   8A01 18 FE         [12]  319 	jr	00102$
   8A03                     320 ___str_0:
   8A03 47 41 4D 45 20 4F   321 	.ascii "GAME OVER"
        56 45 52
   8A0C 00                  322 	.db 0x00
                            323 ;src/main.c:151: void redibujarProta() {
                            324 ;	---------------------------------
                            325 ; Function redibujarProta
                            326 ; ---------------------------------
   8A0D                     327 _redibujarProta::
                            328 ;src/main.c:152: borrarProta();
   8A0D CD 73 89      [17]  329 	call	_borrarProta
                            330 ;src/main.c:153: prota.px = prota.x;
   8A10 01 1E 89      [10]  331 	ld	bc,#_prota + 2
   8A13 3A 1C 89      [13]  332 	ld	a, (#_prota + 0)
   8A16 02            [ 7]  333 	ld	(bc),a
                            334 ;src/main.c:154: prota.py = prota.y;
   8A17 01 1F 89      [10]  335 	ld	bc,#_prota + 3
   8A1A 3A 1D 89      [13]  336 	ld	a, (#_prota + 1)
   8A1D 02            [ 7]  337 	ld	(bc),a
                            338 ;src/main.c:155: dibujarProta();
   8A1E C3 4D 89      [10]  339 	jp  _dibujarProta
                            340 ;src/main.c:158: u8* getTilePtr(u8 x, u8 y) {
                            341 ;	---------------------------------
                            342 ; Function getTilePtr
                            343 ; ---------------------------------
   8A21                     344 _getTilePtr::
                            345 ;src/main.c:159: return mapa + (y/4)*g_map1_W + x/2;
   8A21 21 03 00      [10]  346 	ld	hl, #3+0
   8A24 39            [11]  347 	add	hl, sp
   8A25 4E            [ 7]  348 	ld	c, (hl)
   8A26 CB 39         [ 8]  349 	srl	c
   8A28 CB 39         [ 8]  350 	srl	c
   8A2A 06 00         [ 7]  351 	ld	b,#0x00
   8A2C 69            [ 4]  352 	ld	l, c
   8A2D 60            [ 4]  353 	ld	h, b
   8A2E 29            [11]  354 	add	hl, hl
   8A2F 29            [11]  355 	add	hl, hl
   8A30 09            [11]  356 	add	hl, bc
   8A31 29            [11]  357 	add	hl, hl
   8A32 29            [11]  358 	add	hl, hl
   8A33 29            [11]  359 	add	hl, hl
   8A34 ED 5B 2E 89   [20]  360 	ld	de,(_mapa)
   8A38 19            [11]  361 	add	hl,de
   8A39 FD 21 02 00   [14]  362 	ld	iy,#2
   8A3D FD 39         [15]  363 	add	iy,sp
   8A3F FD 4E 00      [19]  364 	ld	c,0 (iy)
   8A42 CB 39         [ 8]  365 	srl	c
   8A44 59            [ 4]  366 	ld	e,c
   8A45 16 00         [ 7]  367 	ld	d,#0x00
   8A47 19            [11]  368 	add	hl,de
   8A48 C9            [10]  369 	ret
                            370 ;src/main.c:162: u8 checkCollision(int direction) { // check optimization
                            371 ;	---------------------------------
                            372 ; Function checkCollision
                            373 ; ---------------------------------
   8A49                     374 _checkCollision::
   8A49 DD E5         [15]  375 	push	ix
   8A4B DD 21 00 00   [14]  376 	ld	ix,#0
   8A4F DD 39         [15]  377 	add	ix,sp
   8A51 F5            [11]  378 	push	af
                            379 ;src/main.c:163: u8 *headTile=0, *feetTile=0, *waistTile=0;
   8A52 21 00 00      [10]  380 	ld	hl,#0x0000
   8A55 E3            [19]  381 	ex	(sp), hl
   8A56 11 00 00      [10]  382 	ld	de,#0x0000
   8A59 01 00 00      [10]  383 	ld	bc,#0x0000
                            384 ;src/main.c:165: switch (direction) {
   8A5C DD CB 05 7E   [20]  385 	bit	7, 5 (ix)
   8A60 C2 7D 8B      [10]  386 	jp	NZ,00105$
   8A63 3E 03         [ 7]  387 	ld	a,#0x03
   8A65 DD BE 04      [19]  388 	cp	a, 4 (ix)
   8A68 3E 00         [ 7]  389 	ld	a,#0x00
   8A6A DD 9E 05      [19]  390 	sbc	a, 5 (ix)
   8A6D E2 72 8A      [10]  391 	jp	PO, 00128$
   8A70 EE 80         [ 7]  392 	xor	a, #0x80
   8A72                     393 00128$:
   8A72 FA 7D 8B      [10]  394 	jp	M,00105$
   8A75 DD 5E 04      [19]  395 	ld	e,4 (ix)
   8A78 16 00         [ 7]  396 	ld	d,#0x00
   8A7A 21 81 8A      [10]  397 	ld	hl,#00129$
   8A7D 19            [11]  398 	add	hl,de
   8A7E 19            [11]  399 	add	hl,de
   8A7F 19            [11]  400 	add	hl,de
   8A80 E9            [ 4]  401 	jp	(hl)
   8A81                     402 00129$:
   8A81 C3 8D 8A      [10]  403 	jp	00101$
   8A84 C3 D8 8A      [10]  404 	jp	00102$
   8A87 C3 19 8B      [10]  405 	jp	00103$
   8A8A C3 4C 8B      [10]  406 	jp	00104$
                            407 ;src/main.c:166: case 0:
   8A8D                     408 00101$:
                            409 ;src/main.c:167: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   8A8D 21 1D 89      [10]  410 	ld	hl, #(_prota + 0x0001) + 0
   8A90 5E            [ 7]  411 	ld	e,(hl)
   8A91 21 1C 89      [10]  412 	ld	hl, #_prota + 0
   8A94 4E            [ 7]  413 	ld	c,(hl)
   8A95 0C            [ 4]  414 	inc	c
   8A96 0C            [ 4]  415 	inc	c
   8A97 0C            [ 4]  416 	inc	c
   8A98 0C            [ 4]  417 	inc	c
   8A99 7B            [ 4]  418 	ld	a,e
   8A9A F5            [11]  419 	push	af
   8A9B 33            [ 6]  420 	inc	sp
   8A9C 79            [ 4]  421 	ld	a,c
   8A9D F5            [11]  422 	push	af
   8A9E 33            [ 6]  423 	inc	sp
   8A9F CD 21 8A      [17]  424 	call	_getTilePtr
   8AA2 F1            [10]  425 	pop	af
   8AA3 33            [ 6]  426 	inc	sp
   8AA4 33            [ 6]  427 	inc	sp
   8AA5 E5            [11]  428 	push	hl
                            429 ;src/main.c:168: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   8AA6 3A 1D 89      [13]  430 	ld	a, (#(_prota + 0x0001) + 0)
   8AA9 C6 14         [ 7]  431 	add	a, #0x14
   8AAB 4F            [ 4]  432 	ld	c,a
   8AAC 21 1C 89      [10]  433 	ld	hl, #_prota + 0
   8AAF 46            [ 7]  434 	ld	b,(hl)
   8AB0 04            [ 4]  435 	inc	b
   8AB1 04            [ 4]  436 	inc	b
   8AB2 04            [ 4]  437 	inc	b
   8AB3 04            [ 4]  438 	inc	b
   8AB4 79            [ 4]  439 	ld	a,c
   8AB5 F5            [11]  440 	push	af
   8AB6 33            [ 6]  441 	inc	sp
   8AB7 C5            [11]  442 	push	bc
   8AB8 33            [ 6]  443 	inc	sp
   8AB9 CD 21 8A      [17]  444 	call	_getTilePtr
   8ABC F1            [10]  445 	pop	af
   8ABD EB            [ 4]  446 	ex	de,hl
                            447 ;src/main.c:169: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   8ABE 3A 1D 89      [13]  448 	ld	a, (#(_prota + 0x0001) + 0)
   8AC1 C6 0B         [ 7]  449 	add	a, #0x0B
   8AC3 47            [ 4]  450 	ld	b,a
   8AC4 3A 1C 89      [13]  451 	ld	a, (#_prota + 0)
   8AC7 C6 04         [ 7]  452 	add	a, #0x04
   8AC9 D5            [11]  453 	push	de
   8ACA C5            [11]  454 	push	bc
   8ACB 33            [ 6]  455 	inc	sp
   8ACC F5            [11]  456 	push	af
   8ACD 33            [ 6]  457 	inc	sp
   8ACE CD 21 8A      [17]  458 	call	_getTilePtr
   8AD1 F1            [10]  459 	pop	af
   8AD2 4D            [ 4]  460 	ld	c,l
   8AD3 44            [ 4]  461 	ld	b,h
   8AD4 D1            [10]  462 	pop	de
                            463 ;src/main.c:170: break;
   8AD5 C3 7D 8B      [10]  464 	jp	00105$
                            465 ;src/main.c:171: case 1:
   8AD8                     466 00102$:
                            467 ;src/main.c:172: headTile  = getTilePtr(prota.x - 1, prota.y);
   8AD8 21 1D 89      [10]  468 	ld	hl, #(_prota + 0x0001) + 0
   8ADB 56            [ 7]  469 	ld	d,(hl)
   8ADC 21 1C 89      [10]  470 	ld	hl, #_prota + 0
   8ADF 46            [ 7]  471 	ld	b,(hl)
   8AE0 05            [ 4]  472 	dec	b
   8AE1 D5            [11]  473 	push	de
   8AE2 33            [ 6]  474 	inc	sp
   8AE3 C5            [11]  475 	push	bc
   8AE4 33            [ 6]  476 	inc	sp
   8AE5 CD 21 8A      [17]  477 	call	_getTilePtr
   8AE8 F1            [10]  478 	pop	af
   8AE9 33            [ 6]  479 	inc	sp
   8AEA 33            [ 6]  480 	inc	sp
   8AEB E5            [11]  481 	push	hl
                            482 ;src/main.c:173: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
   8AEC 3A 1D 89      [13]  483 	ld	a, (#(_prota + 0x0001) + 0)
   8AEF C6 14         [ 7]  484 	add	a, #0x14
   8AF1 57            [ 4]  485 	ld	d,a
   8AF2 21 1C 89      [10]  486 	ld	hl, #_prota + 0
   8AF5 46            [ 7]  487 	ld	b,(hl)
   8AF6 05            [ 4]  488 	dec	b
   8AF7 D5            [11]  489 	push	de
   8AF8 33            [ 6]  490 	inc	sp
   8AF9 C5            [11]  491 	push	bc
   8AFA 33            [ 6]  492 	inc	sp
   8AFB CD 21 8A      [17]  493 	call	_getTilePtr
   8AFE F1            [10]  494 	pop	af
   8AFF EB            [ 4]  495 	ex	de,hl
                            496 ;src/main.c:174: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
   8B00 3A 1D 89      [13]  497 	ld	a, (#(_prota + 0x0001) + 0)
   8B03 C6 0B         [ 7]  498 	add	a, #0x0B
   8B05 47            [ 4]  499 	ld	b,a
   8B06 3A 1C 89      [13]  500 	ld	a, (#_prota + 0)
   8B09 C6 FF         [ 7]  501 	add	a,#0xFF
   8B0B D5            [11]  502 	push	de
   8B0C C5            [11]  503 	push	bc
   8B0D 33            [ 6]  504 	inc	sp
   8B0E F5            [11]  505 	push	af
   8B0F 33            [ 6]  506 	inc	sp
   8B10 CD 21 8A      [17]  507 	call	_getTilePtr
   8B13 F1            [10]  508 	pop	af
   8B14 4D            [ 4]  509 	ld	c,l
   8B15 44            [ 4]  510 	ld	b,h
   8B16 D1            [10]  511 	pop	de
                            512 ;src/main.c:175: break;
   8B17 18 64         [12]  513 	jr	00105$
                            514 ;src/main.c:176: case 2:
   8B19                     515 00103$:
                            516 ;src/main.c:177: headTile   = getTilePtr(prota.x, prota.y - 2);
   8B19 3A 1D 89      [13]  517 	ld	a, (#(_prota + 0x0001) + 0)
   8B1C C6 FE         [ 7]  518 	add	a,#0xFE
   8B1E 21 1C 89      [10]  519 	ld	hl, #_prota + 0
   8B21 56            [ 7]  520 	ld	d,(hl)
   8B22 C5            [11]  521 	push	bc
   8B23 F5            [11]  522 	push	af
   8B24 33            [ 6]  523 	inc	sp
   8B25 D5            [11]  524 	push	de
   8B26 33            [ 6]  525 	inc	sp
   8B27 CD 21 8A      [17]  526 	call	_getTilePtr
   8B2A F1            [10]  527 	pop	af
   8B2B C1            [10]  528 	pop	bc
   8B2C 33            [ 6]  529 	inc	sp
   8B2D 33            [ 6]  530 	inc	sp
   8B2E E5            [11]  531 	push	hl
                            532 ;src/main.c:178: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
   8B2F 21 1D 89      [10]  533 	ld	hl, #(_prota + 0x0001) + 0
   8B32 56            [ 7]  534 	ld	d,(hl)
   8B33 15            [ 4]  535 	dec	d
   8B34 15            [ 4]  536 	dec	d
   8B35 3A 1C 89      [13]  537 	ld	a, (#_prota + 0)
   8B38 C6 03         [ 7]  538 	add	a, #0x03
   8B3A C5            [11]  539 	push	bc
   8B3B D5            [11]  540 	push	de
   8B3C 33            [ 6]  541 	inc	sp
   8B3D F5            [11]  542 	push	af
   8B3E 33            [ 6]  543 	inc	sp
   8B3F CD 21 8A      [17]  544 	call	_getTilePtr
   8B42 F1            [10]  545 	pop	af
   8B43 EB            [ 4]  546 	ex	de,hl
   8B44 C1            [10]  547 	pop	bc
                            548 ;src/main.c:179: *waistTile = 0;
   8B45 21 00 00      [10]  549 	ld	hl,#0x0000
   8B48 36 00         [10]  550 	ld	(hl),#0x00
                            551 ;src/main.c:180: break;
   8B4A 18 31         [12]  552 	jr	00105$
                            553 ;src/main.c:181: case 3:
   8B4C                     554 00104$:
                            555 ;src/main.c:182: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
   8B4C 3A 1D 89      [13]  556 	ld	a, (#(_prota + 0x0001) + 0)
   8B4F C6 16         [ 7]  557 	add	a, #0x16
   8B51 21 1C 89      [10]  558 	ld	hl, #_prota + 0
   8B54 56            [ 7]  559 	ld	d,(hl)
   8B55 C5            [11]  560 	push	bc
   8B56 F5            [11]  561 	push	af
   8B57 33            [ 6]  562 	inc	sp
   8B58 D5            [11]  563 	push	de
   8B59 33            [ 6]  564 	inc	sp
   8B5A CD 21 8A      [17]  565 	call	_getTilePtr
   8B5D F1            [10]  566 	pop	af
   8B5E C1            [10]  567 	pop	bc
   8B5F 33            [ 6]  568 	inc	sp
   8B60 33            [ 6]  569 	inc	sp
   8B61 E5            [11]  570 	push	hl
                            571 ;src/main.c:183: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   8B62 3A 1D 89      [13]  572 	ld	a, (#(_prota + 0x0001) + 0)
   8B65 C6 16         [ 7]  573 	add	a, #0x16
   8B67 57            [ 4]  574 	ld	d,a
   8B68 3A 1C 89      [13]  575 	ld	a, (#_prota + 0)
   8B6B C6 03         [ 7]  576 	add	a, #0x03
   8B6D C5            [11]  577 	push	bc
   8B6E D5            [11]  578 	push	de
   8B6F 33            [ 6]  579 	inc	sp
   8B70 F5            [11]  580 	push	af
   8B71 33            [ 6]  581 	inc	sp
   8B72 CD 21 8A      [17]  582 	call	_getTilePtr
   8B75 F1            [10]  583 	pop	af
   8B76 EB            [ 4]  584 	ex	de,hl
   8B77 C1            [10]  585 	pop	bc
                            586 ;src/main.c:184: *waistTile = 0;
   8B78 21 00 00      [10]  587 	ld	hl,#0x0000
   8B7B 36 00         [10]  588 	ld	(hl),#0x00
                            589 ;src/main.c:186: }
   8B7D                     590 00105$:
                            591 ;src/main.c:188: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   8B7D E1            [10]  592 	pop	hl
   8B7E E5            [11]  593 	push	hl
   8B7F 6E            [ 7]  594 	ld	l,(hl)
   8B80 3E 02         [ 7]  595 	ld	a,#0x02
   8B82 95            [ 4]  596 	sub	a, l
   8B83 38 0E         [12]  597 	jr	C,00106$
   8B85 1A            [ 7]  598 	ld	a,(de)
   8B86 5F            [ 4]  599 	ld	e,a
   8B87 3E 02         [ 7]  600 	ld	a,#0x02
   8B89 93            [ 4]  601 	sub	a, e
   8B8A 38 07         [12]  602 	jr	C,00106$
   8B8C 0A            [ 7]  603 	ld	a,(bc)
   8B8D 4F            [ 4]  604 	ld	c,a
   8B8E 3E 02         [ 7]  605 	ld	a,#0x02
   8B90 91            [ 4]  606 	sub	a, c
   8B91 30 04         [12]  607 	jr	NC,00107$
   8B93                     608 00106$:
                            609 ;src/main.c:189: return 1;
   8B93 2E 01         [ 7]  610 	ld	l,#0x01
   8B95 18 02         [12]  611 	jr	00110$
   8B97                     612 00107$:
                            613 ;src/main.c:191: return 0;
   8B97 2E 00         [ 7]  614 	ld	l,#0x00
   8B99                     615 00110$:
   8B99 DD F9         [10]  616 	ld	sp, ix
   8B9B DD E1         [14]  617 	pop	ix
   8B9D C9            [10]  618 	ret
                            619 ;src/main.c:195: void dibujarEnemigo(TEnemy *enemy) {
                            620 ;	---------------------------------
                            621 ; Function dibujarEnemigo
                            622 ; ---------------------------------
   8B9E                     623 _dibujarEnemigo::
   8B9E DD E5         [15]  624 	push	ix
   8BA0 DD 21 00 00   [14]  625 	ld	ix,#0
   8BA4 DD 39         [15]  626 	add	ix,sp
                            627 ;src/main.c:196: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   8BA6 DD 4E 04      [19]  628 	ld	c,4 (ix)
   8BA9 DD 46 05      [19]  629 	ld	b,5 (ix)
   8BAC 69            [ 4]  630 	ld	l, c
   8BAD 60            [ 4]  631 	ld	h, b
   8BAE 23            [ 6]  632 	inc	hl
   8BAF 56            [ 7]  633 	ld	d,(hl)
   8BB0 0A            [ 7]  634 	ld	a,(bc)
   8BB1 C5            [11]  635 	push	bc
   8BB2 D5            [11]  636 	push	de
   8BB3 33            [ 6]  637 	inc	sp
   8BB4 F5            [11]  638 	push	af
   8BB5 33            [ 6]  639 	inc	sp
   8BB6 21 00 C0      [10]  640 	ld	hl,#0xC000
   8BB9 E5            [11]  641 	push	hl
   8BBA CD 70 88      [17]  642 	call	_cpct_getScreenPtr
   8BBD EB            [ 4]  643 	ex	de,hl
                            644 ;src/main.c:197: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   8BBE E1            [10]  645 	pop	hl
   8BBF 01 04 00      [10]  646 	ld	bc, #0x0004
   8BC2 09            [11]  647 	add	hl, bc
   8BC3 4E            [ 7]  648 	ld	c,(hl)
   8BC4 23            [ 6]  649 	inc	hl
   8BC5 46            [ 7]  650 	ld	b,(hl)
   8BC6 21 00 3E      [10]  651 	ld	hl,#_g_tablatrans
   8BC9 E5            [11]  652 	push	hl
   8BCA 21 04 16      [10]  653 	ld	hl,#0x1604
   8BCD E5            [11]  654 	push	hl
   8BCE D5            [11]  655 	push	de
   8BCF C5            [11]  656 	push	bc
   8BD0 CD 90 88      [17]  657 	call	_cpct_drawSpriteMaskedAlignedTable
   8BD3 DD E1         [14]  658 	pop	ix
   8BD5 C9            [10]  659 	ret
                            660 ;src/main.c:200: void dibujarExplosion() {
                            661 ;	---------------------------------
                            662 ; Function dibujarExplosion
                            663 ; ---------------------------------
   8BD6                     664 _dibujarExplosion::
                            665 ;src/main.c:201: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   8BD6 21 F5 88      [10]  666 	ld	hl, #_enemy + 1
   8BD9 56            [ 7]  667 	ld	d,(hl)
   8BDA 21 F4 88      [10]  668 	ld	hl, #_enemy + 0
   8BDD 46            [ 7]  669 	ld	b,(hl)
   8BDE D5            [11]  670 	push	de
   8BDF 33            [ 6]  671 	inc	sp
   8BE0 C5            [11]  672 	push	bc
   8BE1 33            [ 6]  673 	inc	sp
   8BE2 21 00 C0      [10]  674 	ld	hl,#0xC000
   8BE5 E5            [11]  675 	push	hl
   8BE6 CD 70 88      [17]  676 	call	_cpct_getScreenPtr
   8BE9 4D            [ 4]  677 	ld	c,l
   8BEA 44            [ 4]  678 	ld	b,h
                            679 ;src/main.c:202: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   8BEB 11 00 3E      [10]  680 	ld	de,#_g_tablatrans+0
   8BEE D5            [11]  681 	push	de
   8BEF 21 04 16      [10]  682 	ld	hl,#0x1604
   8BF2 E5            [11]  683 	push	hl
   8BF3 C5            [11]  684 	push	bc
   8BF4 21 A8 55      [10]  685 	ld	hl,#_g_explosion
   8BF7 E5            [11]  686 	push	hl
   8BF8 CD 90 88      [17]  687 	call	_cpct_drawSpriteMaskedAlignedTable
   8BFB C9            [10]  688 	ret
                            689 ;src/main.c:205: void borrarExplosion() {
                            690 ;	---------------------------------
                            691 ; Function borrarExplosion
                            692 ; ---------------------------------
   8BFC                     693 _borrarExplosion::
   8BFC DD E5         [15]  694 	push	ix
   8BFE DD 21 00 00   [14]  695 	ld	ix,#0
   8C02 DD 39         [15]  696 	add	ix,sp
   8C04 3B            [ 6]  697 	dec	sp
                            698 ;src/main.c:206: u8 w = 4 + (enemy->px & 1);
   8C05 21 F6 88      [10]  699 	ld	hl, #_enemy + 2
   8C08 4E            [ 7]  700 	ld	c,(hl)
   8C09 79            [ 4]  701 	ld	a,c
   8C0A E6 01         [ 7]  702 	and	a, #0x01
   8C0C 47            [ 4]  703 	ld	b,a
   8C0D 04            [ 4]  704 	inc	b
   8C0E 04            [ 4]  705 	inc	b
   8C0F 04            [ 4]  706 	inc	b
   8C10 04            [ 4]  707 	inc	b
                            708 ;src/main.c:209: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   8C11 21 F7 88      [10]  709 	ld	hl, #_enemy + 3
   8C14 5E            [ 7]  710 	ld	e,(hl)
   8C15 CB 4B         [ 8]  711 	bit	1, e
   8C17 28 04         [12]  712 	jr	Z,00103$
   8C19 3E 01         [ 7]  713 	ld	a,#0x01
   8C1B 18 02         [12]  714 	jr	00104$
   8C1D                     715 00103$:
   8C1D 3E 00         [ 7]  716 	ld	a,#0x00
   8C1F                     717 00104$:
   8C1F C6 07         [ 7]  718 	add	a, #0x07
   8C21 DD 77 FF      [19]  719 	ld	-1 (ix),a
                            720 ;src/main.c:211: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   8C24 FD 2A 2E 89   [20]  721 	ld	iy,(_mapa)
   8C28 16 00         [ 7]  722 	ld	d,#0x00
   8C2A 63            [ 4]  723 	ld	h,e
   8C2B 6A            [ 4]  724 	ld	l,d
   8C2C CB 7A         [ 8]  725 	bit	7, d
   8C2E 28 05         [12]  726 	jr	Z,00105$
   8C30 13            [ 6]  727 	inc	de
   8C31 13            [ 6]  728 	inc	de
   8C32 13            [ 6]  729 	inc	de
   8C33 63            [ 4]  730 	ld	h,e
   8C34 6A            [ 4]  731 	ld	l,d
   8C35                     732 00105$:
   8C35 5C            [ 4]  733 	ld	e, h
   8C36 55            [ 4]  734 	ld	d, l
   8C37 CB 2A         [ 8]  735 	sra	d
   8C39 CB 1B         [ 8]  736 	rr	e
   8C3B CB 2A         [ 8]  737 	sra	d
   8C3D CB 1B         [ 8]  738 	rr	e
   8C3F 51            [ 4]  739 	ld	d,c
   8C40 CB 3A         [ 8]  740 	srl	d
   8C42 FD E5         [15]  741 	push	iy
   8C44 21 00 C0      [10]  742 	ld	hl,#0xC000
   8C47 E5            [11]  743 	push	hl
   8C48 3E 28         [ 7]  744 	ld	a,#0x28
   8C4A F5            [11]  745 	push	af
   8C4B 33            [ 6]  746 	inc	sp
   8C4C DD 7E FF      [19]  747 	ld	a,-1 (ix)
   8C4F F5            [11]  748 	push	af
   8C50 33            [ 6]  749 	inc	sp
   8C51 C5            [11]  750 	push	bc
   8C52 33            [ 6]  751 	inc	sp
   8C53 7B            [ 4]  752 	ld	a,e
   8C54 F5            [11]  753 	push	af
   8C55 33            [ 6]  754 	inc	sp
   8C56 D5            [11]  755 	push	de
   8C57 33            [ 6]  756 	inc	sp
   8C58 CD 44 7D      [17]  757 	call	_cpct_etm_drawTileBox2x4
   8C5B 33            [ 6]  758 	inc	sp
   8C5C DD E1         [14]  759 	pop	ix
   8C5E C9            [10]  760 	ret
                            761 ;src/main.c:215: void borrarEnemigo(TEnemy *enemy) {
                            762 ;	---------------------------------
                            763 ; Function borrarEnemigo
                            764 ; ---------------------------------
   8C5F                     765 _borrarEnemigo::
   8C5F DD E5         [15]  766 	push	ix
   8C61 DD 21 00 00   [14]  767 	ld	ix,#0
   8C65 DD 39         [15]  768 	add	ix,sp
   8C67 F5            [11]  769 	push	af
   8C68 F5            [11]  770 	push	af
                            771 ;src/main.c:217: u8 w = 4 + (enemy->px & 1);
   8C69 DD 4E 04      [19]  772 	ld	c,4 (ix)
   8C6C DD 46 05      [19]  773 	ld	b,5 (ix)
   8C6F 69            [ 4]  774 	ld	l, c
   8C70 60            [ 4]  775 	ld	h, b
   8C71 23            [ 6]  776 	inc	hl
   8C72 23            [ 6]  777 	inc	hl
   8C73 5E            [ 7]  778 	ld	e,(hl)
   8C74 7B            [ 4]  779 	ld	a,e
   8C75 E6 01         [ 7]  780 	and	a, #0x01
   8C77 C6 04         [ 7]  781 	add	a, #0x04
   8C79 DD 77 FC      [19]  782 	ld	-4 (ix),a
                            783 ;src/main.c:220: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   8C7C 69            [ 4]  784 	ld	l, c
   8C7D 60            [ 4]  785 	ld	h, b
   8C7E 23            [ 6]  786 	inc	hl
   8C7F 23            [ 6]  787 	inc	hl
   8C80 23            [ 6]  788 	inc	hl
   8C81 56            [ 7]  789 	ld	d,(hl)
   8C82 CB 4A         [ 8]  790 	bit	1, d
   8C84 28 04         [12]  791 	jr	Z,00103$
   8C86 3E 01         [ 7]  792 	ld	a,#0x01
   8C88 18 02         [12]  793 	jr	00104$
   8C8A                     794 00103$:
   8C8A 3E 00         [ 7]  795 	ld	a,#0x00
   8C8C                     796 00104$:
   8C8C C6 07         [ 7]  797 	add	a, #0x07
   8C8E DD 77 FD      [19]  798 	ld	-3 (ix),a
                            799 ;src/main.c:222: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   8C91 FD 2A 2E 89   [20]  800 	ld	iy,(_mapa)
   8C95 6A            [ 4]  801 	ld	l,d
   8C96 26 00         [ 7]  802 	ld	h,#0x00
   8C98 DD 75 FE      [19]  803 	ld	-2 (ix),l
   8C9B DD 74 FF      [19]  804 	ld	-1 (ix),h
   8C9E CB 7C         [ 8]  805 	bit	7, h
   8CA0 28 09         [12]  806 	jr	Z,00105$
   8CA2 23            [ 6]  807 	inc	hl
   8CA3 23            [ 6]  808 	inc	hl
   8CA4 23            [ 6]  809 	inc	hl
   8CA5 DD 75 FE      [19]  810 	ld	-2 (ix),l
   8CA8 DD 74 FF      [19]  811 	ld	-1 (ix),h
   8CAB                     812 00105$:
   8CAB DD 56 FE      [19]  813 	ld	d,-2 (ix)
   8CAE DD 6E FF      [19]  814 	ld	l,-1 (ix)
   8CB1 CB 2D         [ 8]  815 	sra	l
   8CB3 CB 1A         [ 8]  816 	rr	d
   8CB5 CB 2D         [ 8]  817 	sra	l
   8CB7 CB 1A         [ 8]  818 	rr	d
   8CB9 CB 3B         [ 8]  819 	srl	e
   8CBB C5            [11]  820 	push	bc
   8CBC FD E5         [15]  821 	push	iy
   8CBE 21 00 C0      [10]  822 	ld	hl,#0xC000
   8CC1 E5            [11]  823 	push	hl
   8CC2 3E 28         [ 7]  824 	ld	a,#0x28
   8CC4 F5            [11]  825 	push	af
   8CC5 33            [ 6]  826 	inc	sp
   8CC6 DD 66 FD      [19]  827 	ld	h,-3 (ix)
   8CC9 DD 6E FC      [19]  828 	ld	l,-4 (ix)
   8CCC E5            [11]  829 	push	hl
   8CCD D5            [11]  830 	push	de
   8CCE CD 44 7D      [17]  831 	call	_cpct_etm_drawTileBox2x4
   8CD1 C1            [10]  832 	pop	bc
                            833 ;src/main.c:224: enemy->mover = NO;
   8CD2 21 06 00      [10]  834 	ld	hl,#0x0006
   8CD5 09            [11]  835 	add	hl,bc
   8CD6 36 00         [10]  836 	ld	(hl),#0x00
   8CD8 DD F9         [10]  837 	ld	sp, ix
   8CDA DD E1         [14]  838 	pop	ix
   8CDC C9            [10]  839 	ret
                            840 ;src/main.c:227: void redibujarEnemigo(TEnemy *enemy) {
                            841 ;	---------------------------------
                            842 ; Function redibujarEnemigo
                            843 ; ---------------------------------
   8CDD                     844 _redibujarEnemigo::
   8CDD DD E5         [15]  845 	push	ix
   8CDF DD 21 00 00   [14]  846 	ld	ix,#0
   8CE3 DD 39         [15]  847 	add	ix,sp
                            848 ;src/main.c:228: borrarEnemigo(enemy);
   8CE5 DD 6E 04      [19]  849 	ld	l,4 (ix)
   8CE8 DD 66 05      [19]  850 	ld	h,5 (ix)
   8CEB E5            [11]  851 	push	hl
   8CEC CD 5F 8C      [17]  852 	call	_borrarEnemigo
   8CEF F1            [10]  853 	pop	af
                            854 ;src/main.c:229: enemy->px = enemy->x;
   8CF0 DD 4E 04      [19]  855 	ld	c,4 (ix)
   8CF3 DD 46 05      [19]  856 	ld	b,5 (ix)
   8CF6 59            [ 4]  857 	ld	e, c
   8CF7 50            [ 4]  858 	ld	d, b
   8CF8 13            [ 6]  859 	inc	de
   8CF9 13            [ 6]  860 	inc	de
   8CFA 0A            [ 7]  861 	ld	a,(bc)
   8CFB 12            [ 7]  862 	ld	(de),a
                            863 ;src/main.c:230: enemy->py = enemy->y;
   8CFC 59            [ 4]  864 	ld	e, c
   8CFD 50            [ 4]  865 	ld	d, b
   8CFE 13            [ 6]  866 	inc	de
   8CFF 13            [ 6]  867 	inc	de
   8D00 13            [ 6]  868 	inc	de
   8D01 69            [ 4]  869 	ld	l, c
   8D02 60            [ 4]  870 	ld	h, b
   8D03 23            [ 6]  871 	inc	hl
   8D04 7E            [ 7]  872 	ld	a,(hl)
   8D05 12            [ 7]  873 	ld	(de),a
                            874 ;src/main.c:231: dibujarEnemigo(enemy);
   8D06 C5            [11]  875 	push	bc
   8D07 CD 9E 8B      [17]  876 	call	_dibujarEnemigo
   8D0A F1            [10]  877 	pop	af
   8D0B DD E1         [14]  878 	pop	ix
   8D0D C9            [10]  879 	ret
                            880 ;src/main.c:234: u8 checkEnemyCollision(int direction, TEnemy *enemy){
                            881 ;	---------------------------------
                            882 ; Function checkEnemyCollision
                            883 ; ---------------------------------
   8D0E                     884 _checkEnemyCollision::
   8D0E DD E5         [15]  885 	push	ix
   8D10 DD 21 00 00   [14]  886 	ld	ix,#0
   8D14 DD 39         [15]  887 	add	ix,sp
   8D16 21 F9 FF      [10]  888 	ld	hl,#-7
   8D19 39            [11]  889 	add	hl,sp
   8D1A F9            [ 6]  890 	ld	sp,hl
                            891 ;src/main.c:236: u8 colisiona = 1;
   8D1B DD 36 F9 01   [19]  892 	ld	-7 (ix),#0x01
                            893 ;src/main.c:238: switch (direction) {
   8D1F DD CB 05 7E   [20]  894 	bit	7, 5 (ix)
   8D23 C2 21 8F      [10]  895 	jp	NZ,00135$
   8D26 3E 03         [ 7]  896 	ld	a,#0x03
   8D28 DD BE 04      [19]  897 	cp	a, 4 (ix)
   8D2B 3E 00         [ 7]  898 	ld	a,#0x00
   8D2D DD 9E 05      [19]  899 	sbc	a, 5 (ix)
   8D30 E2 35 8D      [10]  900 	jp	PO, 00194$
   8D33 EE 80         [ 7]  901 	xor	a, #0x80
   8D35                     902 00194$:
   8D35 FA 21 8F      [10]  903 	jp	M,00135$
                            904 ;src/main.c:246: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   8D38 DD 4E 06      [19]  905 	ld	c,6 (ix)
   8D3B DD 46 07      [19]  906 	ld	b,7 (ix)
                            907 ;src/main.c:260: enemy->mira = M_abajo;
   8D3E 21 07 00      [10]  908 	ld	hl,#0x0007
   8D41 09            [11]  909 	add	hl,bc
   8D42 DD 75 FC      [19]  910 	ld	-4 (ix),l
   8D45 DD 74 FD      [19]  911 	ld	-3 (ix),h
                            912 ;src/main.c:246: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   8D48 21 01 00      [10]  913 	ld	hl,#0x0001
   8D4B 09            [11]  914 	add	hl,bc
   8D4C DD 75 FA      [19]  915 	ld	-6 (ix),l
   8D4F DD 74 FB      [19]  916 	ld	-5 (ix),h
                            917 ;src/main.c:238: switch (direction) {
   8D52 DD 5E 04      [19]  918 	ld	e,4 (ix)
   8D55 16 00         [ 7]  919 	ld	d,#0x00
   8D57 21 5E 8D      [10]  920 	ld	hl,#00195$
   8D5A 19            [11]  921 	add	hl,de
   8D5B 19            [11]  922 	add	hl,de
   8D5C 19            [11]  923 	add	hl,de
   8D5D E9            [ 4]  924 	jp	(hl)
   8D5E                     925 00195$:
   8D5E C3 21 8F      [10]  926 	jp	00135$
   8D61 C3 21 8F      [10]  927 	jp	00135$
   8D64 C3 70 8D      [10]  928 	jp	00103$
   8D67 C3 47 8E      [10]  929 	jp	00119$
                            930 ;src/main.c:239: case 0:
                            931 ;src/main.c:241: break;
   8D6A C3 21 8F      [10]  932 	jp	00135$
                            933 ;src/main.c:242: case 1:
                            934 ;src/main.c:244: break;
   8D6D C3 21 8F      [10]  935 	jp	00135$
                            936 ;src/main.c:245: case 2:
   8D70                     937 00103$:
                            938 ;src/main.c:246: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   8D70 DD 6E FA      [19]  939 	ld	l,-6 (ix)
   8D73 DD 66 FB      [19]  940 	ld	h,-5 (ix)
   8D76 5E            [ 7]  941 	ld	e,(hl)
   8D77 53            [ 4]  942 	ld	d,e
   8D78 15            [ 4]  943 	dec	d
   8D79 15            [ 4]  944 	dec	d
   8D7A 0A            [ 7]  945 	ld	a,(bc)
   8D7B C5            [11]  946 	push	bc
   8D7C D5            [11]  947 	push	de
   8D7D 33            [ 6]  948 	inc	sp
   8D7E F5            [11]  949 	push	af
   8D7F 33            [ 6]  950 	inc	sp
   8D80 CD 21 8A      [17]  951 	call	_getTilePtr
   8D83 F1            [10]  952 	pop	af
   8D84 C1            [10]  953 	pop	bc
   8D85 5E            [ 7]  954 	ld	e,(hl)
   8D86 3E 02         [ 7]  955 	ld	a,#0x02
   8D88 93            [ 4]  956 	sub	a, e
   8D89 DA 3F 8E      [10]  957 	jp	C,00115$
                            958 ;src/main.c:247: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   8D8C DD 6E FA      [19]  959 	ld	l,-6 (ix)
   8D8F DD 66 FB      [19]  960 	ld	h,-5 (ix)
   8D92 56            [ 7]  961 	ld	d,(hl)
   8D93 15            [ 4]  962 	dec	d
   8D94 15            [ 4]  963 	dec	d
   8D95 0A            [ 7]  964 	ld	a,(bc)
   8D96 C6 02         [ 7]  965 	add	a, #0x02
   8D98 C5            [11]  966 	push	bc
   8D99 D5            [11]  967 	push	de
   8D9A 33            [ 6]  968 	inc	sp
   8D9B F5            [11]  969 	push	af
   8D9C 33            [ 6]  970 	inc	sp
   8D9D CD 21 8A      [17]  971 	call	_getTilePtr
   8DA0 F1            [10]  972 	pop	af
   8DA1 C1            [10]  973 	pop	bc
   8DA2 5E            [ 7]  974 	ld	e,(hl)
   8DA3 3E 02         [ 7]  975 	ld	a,#0x02
   8DA5 93            [ 4]  976 	sub	a, e
   8DA6 DA 3F 8E      [10]  977 	jp	C,00115$
                            978 ;src/main.c:248: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   8DA9 DD 6E FA      [19]  979 	ld	l,-6 (ix)
   8DAC DD 66 FB      [19]  980 	ld	h,-5 (ix)
   8DAF 56            [ 7]  981 	ld	d,(hl)
   8DB0 15            [ 4]  982 	dec	d
   8DB1 15            [ 4]  983 	dec	d
   8DB2 0A            [ 7]  984 	ld	a,(bc)
   8DB3 C6 04         [ 7]  985 	add	a, #0x04
   8DB5 C5            [11]  986 	push	bc
   8DB6 D5            [11]  987 	push	de
   8DB7 33            [ 6]  988 	inc	sp
   8DB8 F5            [11]  989 	push	af
   8DB9 33            [ 6]  990 	inc	sp
   8DBA CD 21 8A      [17]  991 	call	_getTilePtr
   8DBD F1            [10]  992 	pop	af
   8DBE C1            [10]  993 	pop	bc
   8DBF 5E            [ 7]  994 	ld	e,(hl)
   8DC0 3E 02         [ 7]  995 	ld	a,#0x02
   8DC2 93            [ 4]  996 	sub	a, e
   8DC3 38 7A         [12]  997 	jr	C,00115$
                            998 ;src/main.c:250: if((prota.x + G_HERO_W -4) < enemy->x || prota.x  > (enemy->x + G_ENEMY_W)){
   8DC5 21 1C 89      [10]  999 	ld	hl, #_prota + 0
   8DC8 5E            [ 7] 1000 	ld	e,(hl)
   8DC9 16 00         [ 7] 1001 	ld	d,#0x00
   8DCB 21 03 00      [10] 1002 	ld	hl,#0x0003
   8DCE 19            [11] 1003 	add	hl,de
   8DCF DD 75 FE      [19] 1004 	ld	-2 (ix),l
   8DD2 DD 74 FF      [19] 1005 	ld	-1 (ix),h
   8DD5 0A            [ 7] 1006 	ld	a,(bc)
   8DD6 6F            [ 4] 1007 	ld	l,a
   8DD7 26 00         [ 7] 1008 	ld	h,#0x00
   8DD9 DD 7E FE      [19] 1009 	ld	a,-2 (ix)
   8DDC 95            [ 4] 1010 	sub	a, l
   8DDD DD 7E FF      [19] 1011 	ld	a,-1 (ix)
   8DE0 9C            [ 4] 1012 	sbc	a, h
   8DE1 E2 E6 8D      [10] 1013 	jp	PO, 00196$
   8DE4 EE 80         [ 7] 1014 	xor	a, #0x80
   8DE6                    1015 00196$:
   8DE6 FA F9 8D      [10] 1016 	jp	M,00110$
   8DE9 23            [ 6] 1017 	inc	hl
   8DEA 23            [ 6] 1018 	inc	hl
   8DEB 23            [ 6] 1019 	inc	hl
   8DEC 23            [ 6] 1020 	inc	hl
   8DED 7D            [ 4] 1021 	ld	a,l
   8DEE 93            [ 4] 1022 	sub	a, e
   8DEF 7C            [ 4] 1023 	ld	a,h
   8DF0 9A            [ 4] 1024 	sbc	a, d
   8DF1 E2 F6 8D      [10] 1025 	jp	PO, 00197$
   8DF4 EE 80         [ 7] 1026 	xor	a, #0x80
   8DF6                    1027 00197$:
   8DF6 F2 FF 8D      [10] 1028 	jp	P,00111$
   8DF9                    1029 00110$:
                           1030 ;src/main.c:252: colisiona = 0;
   8DF9 DD 36 F9 00   [19] 1031 	ld	-7 (ix),#0x00
   8DFD 18 48         [12] 1032 	jr	00119$
   8DFF                    1033 00111$:
                           1034 ;src/main.c:255: if(enemy->y>prota.y){
   8DFF DD 6E FA      [19] 1035 	ld	l,-6 (ix)
   8E02 DD 66 FB      [19] 1036 	ld	h,-5 (ix)
   8E05 5E            [ 7] 1037 	ld	e,(hl)
   8E06 21 1D 89      [10] 1038 	ld	hl, #(_prota + 0x0001) + 0
   8E09 6E            [ 7] 1039 	ld	l,(hl)
   8E0A 7D            [ 4] 1040 	ld	a,l
   8E0B 93            [ 4] 1041 	sub	a, e
   8E0C 30 2B         [12] 1042 	jr	NC,00108$
                           1043 ;src/main.c:256: if(enemy->y - (prota.y + G_HERO_H -2) >= 2){
   8E0E 16 00         [ 7] 1044 	ld	d,#0x00
   8E10 26 00         [ 7] 1045 	ld	h,#0x00
   8E12 D5            [11] 1046 	push	de
   8E13 11 14 00      [10] 1047 	ld	de,#0x0014
   8E16 19            [11] 1048 	add	hl, de
   8E17 D1            [10] 1049 	pop	de
   8E18 7B            [ 4] 1050 	ld	a,e
   8E19 95            [ 4] 1051 	sub	a, l
   8E1A 5F            [ 4] 1052 	ld	e,a
   8E1B 7A            [ 4] 1053 	ld	a,d
   8E1C 9C            [ 4] 1054 	sbc	a, h
   8E1D 57            [ 4] 1055 	ld	d,a
   8E1E 7B            [ 4] 1056 	ld	a,e
   8E1F D6 02         [ 7] 1057 	sub	a, #0x02
   8E21 7A            [ 4] 1058 	ld	a,d
   8E22 17            [ 4] 1059 	rla
   8E23 3F            [ 4] 1060 	ccf
   8E24 1F            [ 4] 1061 	rra
   8E25 DE 80         [ 7] 1062 	sbc	a, #0x80
   8E27 38 06         [12] 1063 	jr	C,00105$
                           1064 ;src/main.c:257: colisiona = 0;
   8E29 DD 36 F9 00   [19] 1065 	ld	-7 (ix),#0x00
   8E2D 18 18         [12] 1066 	jr	00119$
   8E2F                    1067 00105$:
                           1068 ;src/main.c:260: enemy->mira = M_abajo;
   8E2F DD 6E FC      [19] 1069 	ld	l,-4 (ix)
   8E32 DD 66 FD      [19] 1070 	ld	h,-3 (ix)
   8E35 36 03         [10] 1071 	ld	(hl),#0x03
   8E37 18 0E         [12] 1072 	jr	00119$
   8E39                    1073 00108$:
                           1074 ;src/main.c:263: colisiona = 0;
   8E39 DD 36 F9 00   [19] 1075 	ld	-7 (ix),#0x00
   8E3D 18 08         [12] 1076 	jr	00119$
   8E3F                    1077 00115$:
                           1078 ;src/main.c:269: enemy->mira = M_abajo;
   8E3F DD 6E FC      [19] 1079 	ld	l,-4 (ix)
   8E42 DD 66 FD      [19] 1080 	ld	h,-3 (ix)
   8E45 36 03         [10] 1081 	ld	(hl),#0x03
                           1082 ;src/main.c:272: case 3:
   8E47                    1083 00119$:
                           1084 ;src/main.c:275: if( *getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   8E47 DD 6E FA      [19] 1085 	ld	l,-6 (ix)
   8E4A DD 66 FB      [19] 1086 	ld	h,-5 (ix)
   8E4D 7E            [ 7] 1087 	ld	a,(hl)
   8E4E C6 18         [ 7] 1088 	add	a, #0x18
   8E50 57            [ 4] 1089 	ld	d,a
   8E51 0A            [ 7] 1090 	ld	a,(bc)
   8E52 C5            [11] 1091 	push	bc
   8E53 D5            [11] 1092 	push	de
   8E54 33            [ 6] 1093 	inc	sp
   8E55 F5            [11] 1094 	push	af
   8E56 33            [ 6] 1095 	inc	sp
   8E57 CD 21 8A      [17] 1096 	call	_getTilePtr
   8E5A F1            [10] 1097 	pop	af
   8E5B C1            [10] 1098 	pop	bc
   8E5C 5E            [ 7] 1099 	ld	e,(hl)
   8E5D 3E 02         [ 7] 1100 	ld	a,#0x02
   8E5F 93            [ 4] 1101 	sub	a, e
   8E60 DA 19 8F      [10] 1102 	jp	C,00131$
                           1103 ;src/main.c:276: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   8E63 DD 6E FA      [19] 1104 	ld	l,-6 (ix)
   8E66 DD 66 FB      [19] 1105 	ld	h,-5 (ix)
   8E69 7E            [ 7] 1106 	ld	a,(hl)
   8E6A C6 18         [ 7] 1107 	add	a, #0x18
   8E6C 57            [ 4] 1108 	ld	d,a
   8E6D 0A            [ 7] 1109 	ld	a,(bc)
   8E6E C6 02         [ 7] 1110 	add	a, #0x02
   8E70 C5            [11] 1111 	push	bc
   8E71 D5            [11] 1112 	push	de
   8E72 33            [ 6] 1113 	inc	sp
   8E73 F5            [11] 1114 	push	af
   8E74 33            [ 6] 1115 	inc	sp
   8E75 CD 21 8A      [17] 1116 	call	_getTilePtr
   8E78 F1            [10] 1117 	pop	af
   8E79 C1            [10] 1118 	pop	bc
   8E7A 5E            [ 7] 1119 	ld	e,(hl)
   8E7B 3E 02         [ 7] 1120 	ld	a,#0x02
   8E7D 93            [ 4] 1121 	sub	a, e
   8E7E DA 19 8F      [10] 1122 	jp	C,00131$
                           1123 ;src/main.c:277: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   8E81 DD 6E FA      [19] 1124 	ld	l,-6 (ix)
   8E84 DD 66 FB      [19] 1125 	ld	h,-5 (ix)
   8E87 7E            [ 7] 1126 	ld	a,(hl)
   8E88 C6 18         [ 7] 1127 	add	a, #0x18
   8E8A 57            [ 4] 1128 	ld	d,a
   8E8B 0A            [ 7] 1129 	ld	a,(bc)
   8E8C C6 04         [ 7] 1130 	add	a, #0x04
   8E8E C5            [11] 1131 	push	bc
   8E8F D5            [11] 1132 	push	de
   8E90 33            [ 6] 1133 	inc	sp
   8E91 F5            [11] 1134 	push	af
   8E92 33            [ 6] 1135 	inc	sp
   8E93 CD 21 8A      [17] 1136 	call	_getTilePtr
   8E96 F1            [10] 1137 	pop	af
   8E97 C1            [10] 1138 	pop	bc
   8E98 5E            [ 7] 1139 	ld	e,(hl)
   8E99 3E 02         [ 7] 1140 	ld	a,#0x02
   8E9B 93            [ 4] 1141 	sub	a, e
   8E9C 38 7B         [12] 1142 	jr	C,00131$
                           1143 ;src/main.c:279: if( (prota.x + G_HERO_W -4) < enemy->x || prota.x  > (enemy->x + G_ENEMY_W) ){
   8E9E 21 1C 89      [10] 1144 	ld	hl, #_prota + 0
   8EA1 5E            [ 7] 1145 	ld	e,(hl)
   8EA2 16 00         [ 7] 1146 	ld	d,#0x00
   8EA4 21 03 00      [10] 1147 	ld	hl,#0x0003
   8EA7 19            [11] 1148 	add	hl,de
   8EA8 DD 75 FE      [19] 1149 	ld	-2 (ix),l
   8EAB DD 74 FF      [19] 1150 	ld	-1 (ix),h
   8EAE 0A            [ 7] 1151 	ld	a,(bc)
   8EAF 4F            [ 4] 1152 	ld	c,a
   8EB0 06 00         [ 7] 1153 	ld	b,#0x00
   8EB2 DD 7E FE      [19] 1154 	ld	a,-2 (ix)
   8EB5 91            [ 4] 1155 	sub	a, c
   8EB6 DD 7E FF      [19] 1156 	ld	a,-1 (ix)
   8EB9 98            [ 4] 1157 	sbc	a, b
   8EBA E2 BF 8E      [10] 1158 	jp	PO, 00198$
   8EBD EE 80         [ 7] 1159 	xor	a, #0x80
   8EBF                    1160 00198$:
   8EBF FA D2 8E      [10] 1161 	jp	M,00126$
   8EC2 03            [ 6] 1162 	inc	bc
   8EC3 03            [ 6] 1163 	inc	bc
   8EC4 03            [ 6] 1164 	inc	bc
   8EC5 03            [ 6] 1165 	inc	bc
   8EC6 79            [ 4] 1166 	ld	a,c
   8EC7 93            [ 4] 1167 	sub	a, e
   8EC8 78            [ 4] 1168 	ld	a,b
   8EC9 9A            [ 4] 1169 	sbc	a, d
   8ECA E2 CF 8E      [10] 1170 	jp	PO, 00199$
   8ECD EE 80         [ 7] 1171 	xor	a, #0x80
   8ECF                    1172 00199$:
   8ECF F2 D8 8E      [10] 1173 	jp	P,00127$
   8ED2                    1174 00126$:
                           1175 ;src/main.c:280: colisiona = 0;
   8ED2 DD 36 F9 00   [19] 1176 	ld	-7 (ix),#0x00
   8ED6 18 49         [12] 1177 	jr	00135$
   8ED8                    1178 00127$:
                           1179 ;src/main.c:283: if(prota.y > enemy->y){ //si el prota esta abajo
   8ED8 21 1D 89      [10] 1180 	ld	hl, #(_prota + 0x0001) + 0
   8EDB 4E            [ 7] 1181 	ld	c,(hl)
   8EDC DD 6E FA      [19] 1182 	ld	l,-6 (ix)
   8EDF DD 66 FB      [19] 1183 	ld	h,-5 (ix)
   8EE2 5E            [ 7] 1184 	ld	e,(hl)
   8EE3 7B            [ 4] 1185 	ld	a,e
   8EE4 91            [ 4] 1186 	sub	a, c
   8EE5 30 2C         [12] 1187 	jr	NC,00124$
                           1188 ;src/main.c:284: if( prota.y - (enemy->y + G_ENEMY_H) > 2){ // si hay espacio entre el enemigo y el prota
   8EE7 06 00         [ 7] 1189 	ld	b,#0x00
   8EE9 16 00         [ 7] 1190 	ld	d,#0x00
   8EEB 21 16 00      [10] 1191 	ld	hl,#0x0016
   8EEE 19            [11] 1192 	add	hl,de
   8EEF 79            [ 4] 1193 	ld	a,c
   8EF0 95            [ 4] 1194 	sub	a, l
   8EF1 4F            [ 4] 1195 	ld	c,a
   8EF2 78            [ 4] 1196 	ld	a,b
   8EF3 9C            [ 4] 1197 	sbc	a, h
   8EF4 47            [ 4] 1198 	ld	b,a
   8EF5 3E 02         [ 7] 1199 	ld	a,#0x02
   8EF7 B9            [ 4] 1200 	cp	a, c
   8EF8 3E 00         [ 7] 1201 	ld	a,#0x00
   8EFA 98            [ 4] 1202 	sbc	a, b
   8EFB E2 00 8F      [10] 1203 	jp	PO, 00200$
   8EFE EE 80         [ 7] 1204 	xor	a, #0x80
   8F00                    1205 00200$:
   8F00 F2 09 8F      [10] 1206 	jp	P,00121$
                           1207 ;src/main.c:285: colisiona = 0;
   8F03 DD 36 F9 00   [19] 1208 	ld	-7 (ix),#0x00
   8F07 18 18         [12] 1209 	jr	00135$
   8F09                    1210 00121$:
                           1211 ;src/main.c:288: enemy->mira = M_arriba;
   8F09 DD 6E FC      [19] 1212 	ld	l,-4 (ix)
   8F0C DD 66 FD      [19] 1213 	ld	h,-3 (ix)
   8F0F 36 02         [10] 1214 	ld	(hl),#0x02
   8F11 18 0E         [12] 1215 	jr	00135$
   8F13                    1216 00124$:
                           1217 ;src/main.c:291: colisiona = 0;
   8F13 DD 36 F9 00   [19] 1218 	ld	-7 (ix),#0x00
   8F17 18 08         [12] 1219 	jr	00135$
   8F19                    1220 00131$:
                           1221 ;src/main.c:295: enemy->mira = M_arriba;
   8F19 DD 6E FC      [19] 1222 	ld	l,-4 (ix)
   8F1C DD 66 FD      [19] 1223 	ld	h,-3 (ix)
   8F1F 36 02         [10] 1224 	ld	(hl),#0x02
                           1225 ;src/main.c:298: }
   8F21                    1226 00135$:
                           1227 ;src/main.c:299: return colisiona;
   8F21 DD 6E F9      [19] 1228 	ld	l,-7 (ix)
   8F24 DD F9         [10] 1229 	ld	sp, ix
   8F26 DD E1         [14] 1230 	pop	ix
   8F28 C9            [10] 1231 	ret
                           1232 ;src/main.c:302: void moverEnemigoArriba(TEnemy *enemy){
                           1233 ;	---------------------------------
                           1234 ; Function moverEnemigoArriba
                           1235 ; ---------------------------------
   8F29                    1236 _moverEnemigoArriba::
   8F29 DD E5         [15] 1237 	push	ix
   8F2B DD 21 00 00   [14] 1238 	ld	ix,#0
   8F2F DD 39         [15] 1239 	add	ix,sp
                           1240 ;src/main.c:303: enemy->y--;
   8F31 DD 4E 04      [19] 1241 	ld	c,4 (ix)
   8F34 DD 46 05      [19] 1242 	ld	b,5 (ix)
   8F37 69            [ 4] 1243 	ld	l, c
   8F38 60            [ 4] 1244 	ld	h, b
   8F39 23            [ 6] 1245 	inc	hl
   8F3A 5E            [ 7] 1246 	ld	e,(hl)
   8F3B 1D            [ 4] 1247 	dec	e
   8F3C 73            [ 7] 1248 	ld	(hl),e
                           1249 ;src/main.c:304: enemy->y--;
   8F3D 1D            [ 4] 1250 	dec	e
   8F3E 73            [ 7] 1251 	ld	(hl),e
                           1252 ;src/main.c:305: enemy->mover = SI;
   8F3F 21 06 00      [10] 1253 	ld	hl,#0x0006
   8F42 09            [11] 1254 	add	hl,bc
   8F43 36 01         [10] 1255 	ld	(hl),#0x01
   8F45 DD E1         [14] 1256 	pop	ix
   8F47 C9            [10] 1257 	ret
                           1258 ;src/main.c:308: void moverEnemigoAbajo(TEnemy *enemy){
                           1259 ;	---------------------------------
                           1260 ; Function moverEnemigoAbajo
                           1261 ; ---------------------------------
   8F48                    1262 _moverEnemigoAbajo::
   8F48 DD E5         [15] 1263 	push	ix
   8F4A DD 21 00 00   [14] 1264 	ld	ix,#0
   8F4E DD 39         [15] 1265 	add	ix,sp
                           1266 ;src/main.c:309: enemy->y++;
   8F50 DD 4E 04      [19] 1267 	ld	c,4 (ix)
   8F53 DD 46 05      [19] 1268 	ld	b,5 (ix)
   8F56 59            [ 4] 1269 	ld	e, c
   8F57 50            [ 4] 1270 	ld	d, b
   8F58 13            [ 6] 1271 	inc	de
   8F59 1A            [ 7] 1272 	ld	a,(de)
   8F5A 3C            [ 4] 1273 	inc	a
   8F5B 12            [ 7] 1274 	ld	(de),a
                           1275 ;src/main.c:310: enemy->y++;
   8F5C 3C            [ 4] 1276 	inc	a
   8F5D 12            [ 7] 1277 	ld	(de),a
                           1278 ;src/main.c:311: enemy->mover = SI;
   8F5E 21 06 00      [10] 1279 	ld	hl,#0x0006
   8F61 09            [11] 1280 	add	hl,bc
   8F62 36 01         [10] 1281 	ld	(hl),#0x01
   8F64 DD E1         [14] 1282 	pop	ix
   8F66 C9            [10] 1283 	ret
                           1284 ;src/main.c:314: void moverEnemigo(TEnemy *enemy){
                           1285 ;	---------------------------------
                           1286 ; Function moverEnemigo
                           1287 ; ---------------------------------
   8F67                    1288 _moverEnemigo::
   8F67 DD E5         [15] 1289 	push	ix
   8F69 DD 21 00 00   [14] 1290 	ld	ix,#0
   8F6D DD 39         [15] 1291 	add	ix,sp
                           1292 ;src/main.c:315: if(!enemy->muerto){
   8F6F DD 4E 04      [19] 1293 	ld	c,4 (ix)
   8F72 DD 46 05      [19] 1294 	ld	b,5 (ix)
   8F75 C5            [11] 1295 	push	bc
   8F76 FD E1         [14] 1296 	pop	iy
   8F78 FD 7E 08      [19] 1297 	ld	a,8 (iy)
   8F7B B7            [ 4] 1298 	or	a, a
   8F7C 20 3C         [12] 1299 	jr	NZ,00110$
                           1300 ;src/main.c:316: if(!checkEnemyCollision(enemy->mira, enemy)){
   8F7E 21 07 00      [10] 1301 	ld	hl,#0x0007
   8F81 09            [11] 1302 	add	hl,bc
   8F82 5E            [ 7] 1303 	ld	e,(hl)
   8F83 16 00         [ 7] 1304 	ld	d,#0x00
   8F85 E5            [11] 1305 	push	hl
   8F86 C5            [11] 1306 	push	bc
   8F87 C5            [11] 1307 	push	bc
   8F88 D5            [11] 1308 	push	de
   8F89 CD 0E 8D      [17] 1309 	call	_checkEnemyCollision
   8F8C F1            [10] 1310 	pop	af
   8F8D F1            [10] 1311 	pop	af
   8F8E 7D            [ 4] 1312 	ld	a,l
   8F8F C1            [10] 1313 	pop	bc
   8F90 E1            [10] 1314 	pop	hl
   8F91 B7            [ 4] 1315 	or	a, a
   8F92 20 26         [12] 1316 	jr	NZ,00110$
                           1317 ;src/main.c:318: switch (enemy->mira) {
   8F94 5E            [ 7] 1318 	ld	e,(hl)
   8F95 3E 03         [ 7] 1319 	ld	a,#0x03
   8F97 93            [ 4] 1320 	sub	a, e
   8F98 38 20         [12] 1321 	jr	C,00110$
   8F9A 16 00         [ 7] 1322 	ld	d,#0x00
   8F9C 21 A2 8F      [10] 1323 	ld	hl,#00124$
   8F9F 19            [11] 1324 	add	hl,de
   8FA0 19            [11] 1325 	add	hl,de
                           1326 ;src/main.c:320: case 0:
                           1327 ;src/main.c:322: break;
                           1328 ;src/main.c:323: case 1:
                           1329 ;src/main.c:325: break;
                           1330 ;src/main.c:326: case 2:
   8FA1 E9            [ 4] 1331 	jp	(hl)
   8FA2                    1332 00124$:
   8FA2 18 16         [12] 1333 	jr	00110$
   8FA4 18 14         [12] 1334 	jr	00110$
   8FA6 18 06         [12] 1335 	jr	00103$
   8FA8 18 0B         [12] 1336 	jr	00104$
   8FAA 18 0E         [12] 1337 	jr	00110$
   8FAC 18 0C         [12] 1338 	jr	00110$
   8FAE                    1339 00103$:
                           1340 ;src/main.c:327: moverEnemigoArriba(enemy);
   8FAE C5            [11] 1341 	push	bc
   8FAF CD 29 8F      [17] 1342 	call	_moverEnemigoArriba
   8FB2 F1            [10] 1343 	pop	af
                           1344 ;src/main.c:328: break;
   8FB3 18 05         [12] 1345 	jr	00110$
                           1346 ;src/main.c:329: case 3:
   8FB5                    1347 00104$:
                           1348 ;src/main.c:330: moverEnemigoAbajo(enemy);
   8FB5 C5            [11] 1349 	push	bc
   8FB6 CD 48 8F      [17] 1350 	call	_moverEnemigoAbajo
   8FB9 F1            [10] 1351 	pop	af
                           1352 ;src/main.c:332: }
   8FBA                    1353 00110$:
   8FBA DD E1         [14] 1354 	pop	ix
   8FBC C9            [10] 1355 	ret
                           1356 ;src/main.c:338: void patrolDecision(TEnemy *enemy) { // o devuelve direccion o le pasamos un enemigo y lo mueve
                           1357 ;	---------------------------------
                           1358 ; Function patrolDecision
                           1359 ; ---------------------------------
   8FBD                    1360 _patrolDecision::
                           1361 ;src/main.c:339: u8 decision = cpct_getRandom_mxor_u8() % 4;
   8FBD CD 71 87      [17] 1362 	call	_cpct_getRandom_mxor_u8
   8FC0 7D            [ 4] 1363 	ld	a,l
   8FC1 E6 03         [ 7] 1364 	and	a, #0x03
   8FC3 5F            [ 4] 1365 	ld	e,a
                           1366 ;src/main.c:341: switch (decision) {
   8FC4 3E 03         [ 7] 1367 	ld	a,#0x03
   8FC6 93            [ 4] 1368 	sub	a, e
   8FC7 D8            [11] 1369 	ret	C
   8FC8 16 00         [ 7] 1370 	ld	d,#0x00
   8FCA 21 D0 8F      [10] 1371 	ld	hl,#00112$
   8FCD 19            [11] 1372 	add	hl,de
   8FCE 19            [11] 1373 	add	hl,de
                           1374 ;src/main.c:342: case 0:
   8FCF E9            [ 4] 1375 	jp	(hl)
   8FD0                    1376 00112$:
   8FD0 18 06         [12] 1377 	jr	00101$
   8FD2 18 0D         [12] 1378 	jr	00106$
   8FD4 18 0B         [12] 1379 	jr	00106$
   8FD6 18 09         [12] 1380 	jr	00104$
   8FD8                    1381 00101$:
                           1382 ;src/main.c:343: moverEnemigoAbajo(enemy);
   8FD8 C1            [10] 1383 	pop	bc
   8FD9 E1            [10] 1384 	pop	hl
   8FDA E5            [11] 1385 	push	hl
   8FDB C5            [11] 1386 	push	bc
   8FDC E5            [11] 1387 	push	hl
   8FDD CD 48 8F      [17] 1388 	call	_moverEnemigoAbajo
   8FE0 F1            [10] 1389 	pop	af
                           1390 ;src/main.c:344: break;
                           1391 ;src/main.c:345: case 1:
                           1392 ;src/main.c:346: break;
                           1393 ;src/main.c:347: case 2:
                           1394 ;src/main.c:348: break;
                           1395 ;src/main.c:349: case 3:
                           1396 ;src/main.c:351: }
   8FE1                    1397 00104$:
   8FE1                    1398 00106$:
   8FE1 C9            [10] 1399 	ret
                           1400 ;src/main.c:354: void avanzarMapa() {
                           1401 ;	---------------------------------
                           1402 ; Function avanzarMapa
                           1403 ; ---------------------------------
   8FE2                    1404 _avanzarMapa::
                           1405 ;src/main.c:355: if(num_mapa < NUM_MAPAS -1) {
   8FE2 3A 30 89      [13] 1406 	ld	a,(#_num_mapa + 0)
   8FE5 D6 02         [ 7] 1407 	sub	a, #0x02
   8FE7 D2 D6 89      [10] 1408 	jp	NC,_menuFin
                           1409 ;src/main.c:356: mapa = mapas[++num_mapa];
   8FEA 21 30 89      [10] 1410 	ld	hl, #_num_mapa+0
   8FED 34            [11] 1411 	inc	(hl)
   8FEE FD 21 30 89   [14] 1412 	ld	iy,#_num_mapa
   8FF2 FD 6E 00      [19] 1413 	ld	l,0 (iy)
   8FF5 26 00         [ 7] 1414 	ld	h,#0x00
   8FF7 29            [11] 1415 	add	hl, hl
   8FF8 11 47 89      [10] 1416 	ld	de,#_mapas
   8FFB 19            [11] 1417 	add	hl,de
   8FFC 7E            [ 7] 1418 	ld	a,(hl)
   8FFD FD 21 2E 89   [14] 1419 	ld	iy,#_mapa
   9001 FD 77 00      [19] 1420 	ld	0 (iy),a
   9004 23            [ 6] 1421 	inc	hl
   9005 7E            [ 7] 1422 	ld	a,(hl)
   9006 32 2F 89      [13] 1423 	ld	(#_mapa + 1),a
                           1424 ;src/main.c:357: prota.x = prota.px = 2;
   9009 21 1E 89      [10] 1425 	ld	hl,#(_prota + 0x0002)
   900C 36 02         [10] 1426 	ld	(hl),#0x02
   900E 21 1C 89      [10] 1427 	ld	hl,#_prota
   9011 36 02         [10] 1428 	ld	(hl),#0x02
                           1429 ;src/main.c:358: prota.mover = SI;
   9013 21 22 89      [10] 1430 	ld	hl,#(_prota + 0x0006)
                           1431 ;src/main.c:359: dibujarMapa();
                           1432 ;src/main.c:363: menuFin();
   9016 36 01         [10] 1433 	ld	(hl), #0x01
   9018 C3 31 89      [10] 1434 	jp	_dibujarMapa
                           1435 ;src/main.c:367: void moverIzquierda() {
                           1436 ;	---------------------------------
                           1437 ; Function moverIzquierda
                           1438 ; ---------------------------------
   901B                    1439 _moverIzquierda::
                           1440 ;src/main.c:368: prota.mira = M_izquierda;
   901B 01 1C 89      [10] 1441 	ld	bc,#_prota+0
   901E 21 23 89      [10] 1442 	ld	hl,#(_prota + 0x0007)
   9021 36 01         [10] 1443 	ld	(hl),#0x01
                           1444 ;src/main.c:369: if (!checkCollision(M_izquierda)) {
   9023 C5            [11] 1445 	push	bc
   9024 21 01 00      [10] 1446 	ld	hl,#0x0001
   9027 E5            [11] 1447 	push	hl
   9028 CD 49 8A      [17] 1448 	call	_checkCollision
   902B F1            [10] 1449 	pop	af
   902C C1            [10] 1450 	pop	bc
   902D 7D            [ 4] 1451 	ld	a,l
   902E B7            [ 4] 1452 	or	a, a
   902F C0            [11] 1453 	ret	NZ
                           1454 ;src/main.c:370: prota.x--;
   9030 0A            [ 7] 1455 	ld	a,(bc)
   9031 C6 FF         [ 7] 1456 	add	a,#0xFF
   9033 02            [ 7] 1457 	ld	(bc),a
                           1458 ;src/main.c:371: prota.mover = SI;
   9034 21 22 89      [10] 1459 	ld	hl,#(_prota + 0x0006)
   9037 36 01         [10] 1460 	ld	(hl),#0x01
                           1461 ;src/main.c:372: prota.sprite = g_hero_left;
   9039 21 FE 79      [10] 1462 	ld	hl,#_g_hero_left
   903C 22 20 89      [16] 1463 	ld	((_prota + 0x0004)), hl
   903F C9            [10] 1464 	ret
                           1465 ;src/main.c:376: void moverDerecha() {
                           1466 ;	---------------------------------
                           1467 ; Function moverDerecha
                           1468 ; ---------------------------------
   9040                    1469 _moverDerecha::
                           1470 ;src/main.c:377: prota.mira = M_derecha;
   9040 21 23 89      [10] 1471 	ld	hl,#(_prota + 0x0007)
   9043 36 00         [10] 1472 	ld	(hl),#0x00
                           1473 ;src/main.c:378: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   9045 21 00 00      [10] 1474 	ld	hl,#0x0000
   9048 E5            [11] 1475 	push	hl
   9049 CD 49 8A      [17] 1476 	call	_checkCollision
   904C F1            [10] 1477 	pop	af
   904D 45            [ 4] 1478 	ld	b,l
   904E 21 1C 89      [10] 1479 	ld	hl, #_prota + 0
   9051 4E            [ 7] 1480 	ld	c,(hl)
   9052 59            [ 4] 1481 	ld	e,c
   9053 16 00         [ 7] 1482 	ld	d,#0x00
   9055 21 07 00      [10] 1483 	ld	hl,#0x0007
   9058 19            [11] 1484 	add	hl,de
   9059 11 50 80      [10] 1485 	ld	de, #0x8050
   905C 29            [11] 1486 	add	hl, hl
   905D 3F            [ 4] 1487 	ccf
   905E CB 1C         [ 8] 1488 	rr	h
   9060 CB 1D         [ 8] 1489 	rr	l
   9062 ED 52         [15] 1490 	sbc	hl, de
   9064 3E 00         [ 7] 1491 	ld	a,#0x00
   9066 17            [ 4] 1492 	rla
   9067 5F            [ 4] 1493 	ld	e,a
   9068 78            [ 4] 1494 	ld	a,b
   9069 B7            [ 4] 1495 	or	a,a
   906A 20 14         [12] 1496 	jr	NZ,00104$
   906C B3            [ 4] 1497 	or	a,e
   906D 28 11         [12] 1498 	jr	Z,00104$
                           1499 ;src/main.c:379: prota.x++;
   906F 0C            [ 4] 1500 	inc	c
   9070 21 1C 89      [10] 1501 	ld	hl,#_prota
   9073 71            [ 7] 1502 	ld	(hl),c
                           1503 ;src/main.c:380: prota.mover = SI;
   9074 21 22 89      [10] 1504 	ld	hl,#(_prota + 0x0006)
   9077 36 01         [10] 1505 	ld	(hl),#0x01
                           1506 ;src/main.c:381: prota.sprite = g_hero;
   9079 21 A8 7A      [10] 1507 	ld	hl,#_g_hero
   907C 22 20 89      [16] 1508 	ld	((_prota + 0x0004)), hl
   907F C9            [10] 1509 	ret
   9080                    1510 00104$:
                           1511 ;src/main.c:383: }else if( prota.x + G_HERO_W >= 80){
   9080 7B            [ 4] 1512 	ld	a,e
   9081 B7            [ 4] 1513 	or	a, a
   9082 C0            [11] 1514 	ret	NZ
                           1515 ;src/main.c:384: avanzarMapa();
   9083 C3 E2 8F      [10] 1516 	jp  _avanzarMapa
                           1517 ;src/main.c:388: void moverArriba() {
                           1518 ;	---------------------------------
                           1519 ; Function moverArriba
                           1520 ; ---------------------------------
   9086                    1521 _moverArriba::
                           1522 ;src/main.c:389: prota.mira = M_arriba;
   9086 21 23 89      [10] 1523 	ld	hl,#(_prota + 0x0007)
   9089 36 02         [10] 1524 	ld	(hl),#0x02
                           1525 ;src/main.c:390: if (!checkCollision(M_arriba) && (prota.y >= 0)) { // TODO: COMPROBAR
   908B 21 02 00      [10] 1526 	ld	hl,#0x0002
   908E E5            [11] 1527 	push	hl
   908F CD 49 8A      [17] 1528 	call	_checkCollision
   9092 F1            [10] 1529 	pop	af
   9093 7D            [ 4] 1530 	ld	a,l
   9094 B7            [ 4] 1531 	or	a, a
   9095 C0            [11] 1532 	ret	NZ
                           1533 ;src/main.c:391: prota.y--;
   9096 21 1D 89      [10] 1534 	ld	hl,#_prota + 1
   9099 4E            [ 7] 1535 	ld	c,(hl)
   909A 0D            [ 4] 1536 	dec	c
   909B 71            [ 7] 1537 	ld	(hl),c
                           1538 ;src/main.c:392: prota.y--;
   909C 0D            [ 4] 1539 	dec	c
   909D 71            [ 7] 1540 	ld	(hl),c
                           1541 ;src/main.c:393: prota.mover  = SI;
   909E 21 22 89      [10] 1542 	ld	hl,#(_prota + 0x0006)
   90A1 36 01         [10] 1543 	ld	(hl),#0x01
                           1544 ;src/main.c:394: prota.sprite = g_hero_up;
   90A3 21 64 79      [10] 1545 	ld	hl,#_g_hero_up
   90A6 22 20 89      [16] 1546 	ld	((_prota + 0x0004)), hl
   90A9 C9            [10] 1547 	ret
                           1548 ;src/main.c:398: void moverAbajo() {
                           1549 ;	---------------------------------
                           1550 ; Function moverAbajo
                           1551 ; ---------------------------------
   90AA                    1552 _moverAbajo::
                           1553 ;src/main.c:399: prota.mira = M_abajo;
   90AA 21 23 89      [10] 1554 	ld	hl,#(_prota + 0x0007)
   90AD 36 03         [10] 1555 	ld	(hl),#0x03
                           1556 ;src/main.c:400: if (!checkCollision(M_abajo) && (prota.y + G_HERO_H < ALTO_MAPA)) { // TODO: COMPROBAR
   90AF 21 03 00      [10] 1557 	ld	hl,#0x0003
   90B2 E5            [11] 1558 	push	hl
   90B3 CD 49 8A      [17] 1559 	call	_checkCollision
   90B6 F1            [10] 1560 	pop	af
   90B7 7D            [ 4] 1561 	ld	a,l
   90B8 B7            [ 4] 1562 	or	a, a
   90B9 C0            [11] 1563 	ret	NZ
   90BA 01 1D 89      [10] 1564 	ld	bc,#_prota + 1
   90BD 0A            [ 7] 1565 	ld	a,(bc)
   90BE 5F            [ 4] 1566 	ld	e,a
   90BF 6B            [ 4] 1567 	ld	l,e
   90C0 26 00         [ 7] 1568 	ld	h,#0x00
   90C2 D5            [11] 1569 	push	de
   90C3 11 16 00      [10] 1570 	ld	de,#0x0016
   90C6 19            [11] 1571 	add	hl, de
   90C7 D1            [10] 1572 	pop	de
   90C8 7D            [ 4] 1573 	ld	a,l
   90C9 D6 B0         [ 7] 1574 	sub	a, #0xB0
   90CB 7C            [ 4] 1575 	ld	a,h
   90CC 17            [ 4] 1576 	rla
   90CD 3F            [ 4] 1577 	ccf
   90CE 1F            [ 4] 1578 	rra
   90CF DE 80         [ 7] 1579 	sbc	a, #0x80
   90D1 D0            [11] 1580 	ret	NC
                           1581 ;src/main.c:401: prota.y++;
   90D2 7B            [ 4] 1582 	ld	a,e
   90D3 3C            [ 4] 1583 	inc	a
   90D4 02            [ 7] 1584 	ld	(bc),a
                           1585 ;src/main.c:402: prota.y++;
   90D5 3C            [ 4] 1586 	inc	a
   90D6 02            [ 7] 1587 	ld	(bc),a
                           1588 ;src/main.c:403: prota.mover  = SI;
   90D7 21 22 89      [10] 1589 	ld	hl,#(_prota + 0x0006)
   90DA 36 01         [10] 1590 	ld	(hl),#0x01
                           1591 ;src/main.c:404: prota.sprite = g_hero_down;
   90DC 21 CA 78      [10] 1592 	ld	hl,#_g_hero_down
   90DF 22 20 89      [16] 1593 	ld	((_prota + 0x0004)), hl
   90E2 C9            [10] 1594 	ret
                           1595 ;src/main.c:408: void dibujarCuchillo() {
                           1596 ;	---------------------------------
                           1597 ; Function dibujarCuchillo
                           1598 ; ---------------------------------
   90E3                    1599 _dibujarCuchillo::
   90E3 DD E5         [15] 1600 	push	ix
   90E5 DD 21 00 00   [14] 1601 	ld	ix,#0
   90E9 DD 39         [15] 1602 	add	ix,sp
   90EB F5            [11] 1603 	push	af
                           1604 ;src/main.c:409: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   90EC 21 25 89      [10] 1605 	ld	hl, #_cu + 1
   90EF 56            [ 7] 1606 	ld	d,(hl)
   90F0 21 24 89      [10] 1607 	ld	hl, #_cu + 0
   90F3 46            [ 7] 1608 	ld	b,(hl)
   90F4 D5            [11] 1609 	push	de
   90F5 33            [ 6] 1610 	inc	sp
   90F6 C5            [11] 1611 	push	bc
   90F7 33            [ 6] 1612 	inc	sp
   90F8 21 00 C0      [10] 1613 	ld	hl,#0xC000
   90FB E5            [11] 1614 	push	hl
   90FC CD 70 88      [17] 1615 	call	_cpct_getScreenPtr
   90FF 45            [ 4] 1616 	ld	b,l
   9100 5C            [ 4] 1617 	ld	e,h
                           1618 ;src/main.c:410: if(cu.eje == E_X){
   9101 21 2C 89      [10] 1619 	ld	hl, #_cu + 8
   9104 4E            [ 7] 1620 	ld	c,(hl)
                           1621 ;src/main.c:411: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   9105 DD 70 FE      [19] 1622 	ld	-2 (ix),b
   9108 DD 73 FF      [19] 1623 	ld	-1 (ix),e
                           1624 ;src/main.c:410: if(cu.eje == E_X){
   910B 79            [ 4] 1625 	ld	a,c
   910C B7            [ 4] 1626 	or	a, a
   910D 20 19         [12] 1627 	jr	NZ,00104$
                           1628 ;src/main.c:411: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   910F 11 00 3E      [10] 1629 	ld	de,#_g_tablatrans+0
   9112 ED 4B 28 89   [20] 1630 	ld	bc, (#(_cu + 0x0004) + 0)
   9116 D5            [11] 1631 	push	de
   9117 21 04 04      [10] 1632 	ld	hl,#0x0404
   911A E5            [11] 1633 	push	hl
   911B DD 6E FE      [19] 1634 	ld	l,-2 (ix)
   911E DD 66 FF      [19] 1635 	ld	h,-1 (ix)
   9121 E5            [11] 1636 	push	hl
   9122 C5            [11] 1637 	push	bc
   9123 CD 90 88      [17] 1638 	call	_cpct_drawSpriteMaskedAlignedTable
   9126 18 1A         [12] 1639 	jr	00106$
   9128                    1640 00104$:
                           1641 ;src/main.c:414: else if(cu.eje == E_Y){
   9128 0D            [ 4] 1642 	dec	c
   9129 20 17         [12] 1643 	jr	NZ,00106$
                           1644 ;src/main.c:415: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   912B 11 00 3E      [10] 1645 	ld	de,#_g_tablatrans+0
   912E ED 4B 28 89   [20] 1646 	ld	bc, (#(_cu + 0x0004) + 0)
   9132 D5            [11] 1647 	push	de
   9133 21 02 08      [10] 1648 	ld	hl,#0x0802
   9136 E5            [11] 1649 	push	hl
   9137 DD 6E FE      [19] 1650 	ld	l,-2 (ix)
   913A DD 66 FF      [19] 1651 	ld	h,-1 (ix)
   913D E5            [11] 1652 	push	hl
   913E C5            [11] 1653 	push	bc
   913F CD 90 88      [17] 1654 	call	_cpct_drawSpriteMaskedAlignedTable
   9142                    1655 00106$:
   9142 DD F9         [10] 1656 	ld	sp, ix
   9144 DD E1         [14] 1657 	pop	ix
   9146 C9            [10] 1658 	ret
                           1659 ;src/main.c:419: void borrarCuchillo() {
                           1660 ;	---------------------------------
                           1661 ; Function borrarCuchillo
                           1662 ; ---------------------------------
   9147                    1663 _borrarCuchillo::
   9147 DD E5         [15] 1664 	push	ix
   9149 DD 21 00 00   [14] 1665 	ld	ix,#0
   914D DD 39         [15] 1666 	add	ix,sp
   914F 3B            [ 6] 1667 	dec	sp
                           1668 ;src/main.c:421: u8 w = 2 + (cu.px & 1);
   9150 21 26 89      [10] 1669 	ld	hl, #_cu + 2
   9153 4E            [ 7] 1670 	ld	c,(hl)
   9154 79            [ 4] 1671 	ld	a,c
   9155 E6 01         [ 7] 1672 	and	a, #0x01
   9157 47            [ 4] 1673 	ld	b,a
   9158 04            [ 4] 1674 	inc	b
   9159 04            [ 4] 1675 	inc	b
                           1676 ;src/main.c:422: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   915A 21 27 89      [10] 1677 	ld	hl, #_cu + 3
   915D 5E            [ 7] 1678 	ld	e,(hl)
   915E 7B            [ 4] 1679 	ld	a,e
   915F E6 03         [ 7] 1680 	and	a, #0x03
   9161 28 04         [12] 1681 	jr	Z,00105$
   9163 3E 01         [ 7] 1682 	ld	a,#0x01
   9165 18 02         [12] 1683 	jr	00106$
   9167                    1684 00105$:
   9167 3E 00         [ 7] 1685 	ld	a,#0x00
   9169                    1686 00106$:
   9169 C6 02         [ 7] 1687 	add	a, #0x02
   916B DD 77 FF      [19] 1688 	ld	-1 (ix),a
                           1689 ;src/main.c:423: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   916E FD 2A 2E 89   [20] 1690 	ld	iy,(_mapa)
   9172 16 00         [ 7] 1691 	ld	d,#0x00
   9174 63            [ 4] 1692 	ld	h,e
   9175 6A            [ 4] 1693 	ld	l,d
   9176 CB 7A         [ 8] 1694 	bit	7, d
   9178 28 05         [12] 1695 	jr	Z,00107$
   917A 13            [ 6] 1696 	inc	de
   917B 13            [ 6] 1697 	inc	de
   917C 13            [ 6] 1698 	inc	de
   917D 63            [ 4] 1699 	ld	h,e
   917E 6A            [ 4] 1700 	ld	l,d
   917F                    1701 00107$:
   917F 5C            [ 4] 1702 	ld	e, h
   9180 55            [ 4] 1703 	ld	d, l
   9181 CB 2A         [ 8] 1704 	sra	d
   9183 CB 1B         [ 8] 1705 	rr	e
   9185 CB 2A         [ 8] 1706 	sra	d
   9187 CB 1B         [ 8] 1707 	rr	e
   9189 51            [ 4] 1708 	ld	d,c
   918A CB 3A         [ 8] 1709 	srl	d
   918C FD E5         [15] 1710 	push	iy
   918E 21 00 C0      [10] 1711 	ld	hl,#0xC000
   9191 E5            [11] 1712 	push	hl
   9192 3E 28         [ 7] 1713 	ld	a,#0x28
   9194 F5            [11] 1714 	push	af
   9195 33            [ 6] 1715 	inc	sp
   9196 DD 7E FF      [19] 1716 	ld	a,-1 (ix)
   9199 F5            [11] 1717 	push	af
   919A 33            [ 6] 1718 	inc	sp
   919B C5            [11] 1719 	push	bc
   919C 33            [ 6] 1720 	inc	sp
   919D 7B            [ 4] 1721 	ld	a,e
   919E F5            [11] 1722 	push	af
   919F 33            [ 6] 1723 	inc	sp
   91A0 D5            [11] 1724 	push	de
   91A1 33            [ 6] 1725 	inc	sp
   91A2 CD 44 7D      [17] 1726 	call	_cpct_etm_drawTileBox2x4
                           1727 ;src/main.c:424: if(!cu.mover){
   91A5 3A 2D 89      [13] 1728 	ld	a, (#_cu + 9)
   91A8 B7            [ 4] 1729 	or	a, a
   91A9 20 05         [12] 1730 	jr	NZ,00103$
                           1731 ;src/main.c:425: cu.lanzado = NO;
   91AB 21 2A 89      [10] 1732 	ld	hl,#(_cu + 0x0006)
   91AE 36 00         [10] 1733 	ld	(hl),#0x00
   91B0                    1734 00103$:
   91B0 33            [ 6] 1735 	inc	sp
   91B1 DD E1         [14] 1736 	pop	ix
   91B3 C9            [10] 1737 	ret
                           1738 ;src/main.c:429: void redibujarCuchillo( ) {
                           1739 ;	---------------------------------
                           1740 ; Function redibujarCuchillo
                           1741 ; ---------------------------------
   91B4                    1742 _redibujarCuchillo::
                           1743 ;src/main.c:430: borrarCuchillo();
   91B4 CD 47 91      [17] 1744 	call	_borrarCuchillo
                           1745 ;src/main.c:431: cu.px = cu.x;
   91B7 01 26 89      [10] 1746 	ld	bc,#_cu + 2
   91BA 3A 24 89      [13] 1747 	ld	a, (#_cu + 0)
   91BD 02            [ 7] 1748 	ld	(bc),a
                           1749 ;src/main.c:432: cu.py = cu.y;
   91BE 01 27 89      [10] 1750 	ld	bc,#_cu + 3
   91C1 3A 25 89      [13] 1751 	ld	a, (#_cu + 1)
   91C4 02            [ 7] 1752 	ld	(bc),a
                           1753 ;src/main.c:433: dibujarCuchillo();
   91C5 C3 E3 90      [10] 1754 	jp  _dibujarCuchillo
                           1755 ;src/main.c:437: void lanzarCuchillo(){
                           1756 ;	---------------------------------
                           1757 ; Function lanzarCuchillo
                           1758 ; ---------------------------------
   91C8                    1759 _lanzarCuchillo::
                           1760 ;src/main.c:439: if(!cu.lanzado){
   91C8 3A 2A 89      [13] 1761 	ld	a, (#(_cu + 0x0006) + 0)
   91CB B7            [ 4] 1762 	or	a, a
   91CC C0            [11] 1763 	ret	NZ
                           1764 ;src/main.c:441: if(prota.mira == M_derecha){
   91CD 21 23 89      [10] 1765 	ld	hl, #_prota + 7
   91D0 5E            [ 7] 1766 	ld	e,(hl)
                           1767 ;src/main.c:442: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   91D1 01 1D 89      [10] 1768 	ld	bc,#_prota + 1
                           1769 ;src/main.c:444: cu.direccion = M_derecha;
                           1770 ;src/main.c:446: cu.y=prota.y + G_HERO_H /2;
                           1771 ;src/main.c:447: cu.sprite=g_knifeX_0;
                           1772 ;src/main.c:448: cu.eje = E_X;
                           1773 ;src/main.c:441: if(prota.mira == M_derecha){
   91D4 7B            [ 4] 1774 	ld	a,e
   91D5 B7            [ 4] 1775 	or	a, a
   91D6 20 41         [12] 1776 	jr	NZ,00118$
                           1777 ;src/main.c:442: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   91D8 0A            [ 7] 1778 	ld	a,(bc)
   91D9 C6 0B         [ 7] 1779 	add	a, #0x0B
   91DB 5F            [ 4] 1780 	ld	e,a
   91DC 3A 1C 89      [13] 1781 	ld	a, (#_prota + 0)
   91DF C6 0C         [ 7] 1782 	add	a, #0x0C
   91E1 6F            [ 4] 1783 	ld	l,a
   91E2 C5            [11] 1784 	push	bc
   91E3 7B            [ 4] 1785 	ld	a,e
   91E4 F5            [11] 1786 	push	af
   91E5 33            [ 6] 1787 	inc	sp
   91E6 7D            [ 4] 1788 	ld	a,l
   91E7 F5            [11] 1789 	push	af
   91E8 33            [ 6] 1790 	inc	sp
   91E9 CD 21 8A      [17] 1791 	call	_getTilePtr
   91EC F1            [10] 1792 	pop	af
   91ED C1            [10] 1793 	pop	bc
   91EE 5E            [ 7] 1794 	ld	e,(hl)
   91EF 3E 02         [ 7] 1795 	ld	a,#0x02
   91F1 93            [ 4] 1796 	sub	a, e
   91F2 D8            [11] 1797 	ret	C
                           1798 ;src/main.c:443: cu.lanzado = SI;
   91F3 21 2A 89      [10] 1799 	ld	hl,#(_cu + 0x0006)
   91F6 36 01         [10] 1800 	ld	(hl),#0x01
                           1801 ;src/main.c:444: cu.direccion = M_derecha;
   91F8 21 2B 89      [10] 1802 	ld	hl,#(_cu + 0x0007)
   91FB 36 00         [10] 1803 	ld	(hl),#0x00
                           1804 ;src/main.c:445: cu.x=prota.x + G_HERO_W;
   91FD 3A 1C 89      [13] 1805 	ld	a, (#_prota + 0)
   9200 C6 07         [ 7] 1806 	add	a, #0x07
   9202 32 24 89      [13] 1807 	ld	(#_cu),a
                           1808 ;src/main.c:446: cu.y=prota.y + G_HERO_H /2;
   9205 0A            [ 7] 1809 	ld	a,(bc)
   9206 C6 0B         [ 7] 1810 	add	a, #0x0B
   9208 32 25 89      [13] 1811 	ld	(#(_cu + 0x0001)),a
                           1812 ;src/main.c:447: cu.sprite=g_knifeX_0;
   920B 21 C0 54      [10] 1813 	ld	hl,#_g_knifeX_0
   920E 22 28 89      [16] 1814 	ld	((_cu + 0x0004)), hl
                           1815 ;src/main.c:448: cu.eje = E_X;
   9211 21 2C 89      [10] 1816 	ld	hl,#(_cu + 0x0008)
   9214 36 00         [10] 1817 	ld	(hl),#0x00
                           1818 ;src/main.c:449: dibujarCuchillo();
   9216 C3 E3 90      [10] 1819 	jp  _dibujarCuchillo
   9219                    1820 00118$:
                           1821 ;src/main.c:452: else if(prota.mira == M_izquierda){
   9219 7B            [ 4] 1822 	ld	a,e
   921A 3D            [ 4] 1823 	dec	a
   921B 20 41         [12] 1824 	jr	NZ,00115$
                           1825 ;src/main.c:453: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   921D 0A            [ 7] 1826 	ld	a,(bc)
   921E C6 0B         [ 7] 1827 	add	a, #0x0B
   9220 5F            [ 4] 1828 	ld	e,a
   9221 3A 1C 89      [13] 1829 	ld	a, (#_prota + 0)
   9224 C6 F6         [ 7] 1830 	add	a,#0xF6
   9226 6F            [ 4] 1831 	ld	l,a
   9227 C5            [11] 1832 	push	bc
   9228 7B            [ 4] 1833 	ld	a,e
   9229 F5            [11] 1834 	push	af
   922A 33            [ 6] 1835 	inc	sp
   922B 7D            [ 4] 1836 	ld	a,l
   922C F5            [11] 1837 	push	af
   922D 33            [ 6] 1838 	inc	sp
   922E CD 21 8A      [17] 1839 	call	_getTilePtr
   9231 F1            [10] 1840 	pop	af
   9232 C1            [10] 1841 	pop	bc
   9233 5E            [ 7] 1842 	ld	e,(hl)
   9234 3E 02         [ 7] 1843 	ld	a,#0x02
   9236 93            [ 4] 1844 	sub	a, e
   9237 D8            [11] 1845 	ret	C
                           1846 ;src/main.c:454: cu.lanzado = SI;
   9238 21 2A 89      [10] 1847 	ld	hl,#(_cu + 0x0006)
   923B 36 01         [10] 1848 	ld	(hl),#0x01
                           1849 ;src/main.c:455: cu.direccion = M_izquierda;
   923D 21 2B 89      [10] 1850 	ld	hl,#(_cu + 0x0007)
   9240 36 01         [10] 1851 	ld	(hl),#0x01
                           1852 ;src/main.c:456: cu.x = prota.x - G_KNIFEX_0_W;
   9242 3A 1C 89      [13] 1853 	ld	a, (#_prota + 0)
   9245 C6 FC         [ 7] 1854 	add	a,#0xFC
   9247 32 24 89      [13] 1855 	ld	(#_cu),a
                           1856 ;src/main.c:457: cu.y = prota.y + G_HERO_H /2;
   924A 0A            [ 7] 1857 	ld	a,(bc)
   924B C6 0B         [ 7] 1858 	add	a, #0x0B
   924D 32 25 89      [13] 1859 	ld	(#(_cu + 0x0001)),a
                           1860 ;src/main.c:458: cu.sprite = g_knifeX_1;
   9250 21 D0 54      [10] 1861 	ld	hl,#_g_knifeX_1
   9253 22 28 89      [16] 1862 	ld	((_cu + 0x0004)), hl
                           1863 ;src/main.c:459: cu.eje = E_X;
   9256 21 2C 89      [10] 1864 	ld	hl,#(_cu + 0x0008)
   9259 36 00         [10] 1865 	ld	(hl),#0x00
                           1866 ;src/main.c:460: dibujarCuchillo();
   925B C3 E3 90      [10] 1867 	jp  _dibujarCuchillo
   925E                    1868 00115$:
                           1869 ;src/main.c:463: else if(prota.mira == M_abajo){
   925E 7B            [ 4] 1870 	ld	a,e
   925F D6 03         [ 7] 1871 	sub	a, #0x03
   9261 20 41         [12] 1872 	jr	NZ,00112$
                           1873 ;src/main.c:465: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   9263 0A            [ 7] 1874 	ld	a,(bc)
   9264 C6 1F         [ 7] 1875 	add	a, #0x1F
   9266 5F            [ 4] 1876 	ld	e,a
   9267 3A 1C 89      [13] 1877 	ld	a, (#_prota + 0)
   926A 57            [ 4] 1878 	ld	d,a
   926B 14            [ 4] 1879 	inc	d
   926C 14            [ 4] 1880 	inc	d
   926D 14            [ 4] 1881 	inc	d
   926E C5            [11] 1882 	push	bc
   926F 7B            [ 4] 1883 	ld	a,e
   9270 F5            [11] 1884 	push	af
   9271 33            [ 6] 1885 	inc	sp
   9272 D5            [11] 1886 	push	de
   9273 33            [ 6] 1887 	inc	sp
   9274 CD 21 8A      [17] 1888 	call	_getTilePtr
   9277 F1            [10] 1889 	pop	af
   9278 C1            [10] 1890 	pop	bc
   9279 5E            [ 7] 1891 	ld	e,(hl)
   927A 3E 02         [ 7] 1892 	ld	a,#0x02
   927C 93            [ 4] 1893 	sub	a, e
   927D D8            [11] 1894 	ret	C
                           1895 ;src/main.c:466: cu.lanzado = SI;
   927E 21 2A 89      [10] 1896 	ld	hl,#(_cu + 0x0006)
   9281 36 01         [10] 1897 	ld	(hl),#0x01
                           1898 ;src/main.c:467: cu.direccion = M_abajo;
   9283 21 2B 89      [10] 1899 	ld	hl,#(_cu + 0x0007)
   9286 36 03         [10] 1900 	ld	(hl),#0x03
                           1901 ;src/main.c:468: cu.x = prota.x + G_HERO_W / 2;
   9288 3A 1C 89      [13] 1902 	ld	a, (#_prota + 0)
   928B C6 03         [ 7] 1903 	add	a, #0x03
   928D 32 24 89      [13] 1904 	ld	(#_cu),a
                           1905 ;src/main.c:469: cu.y = prota.y + G_HERO_H;
   9290 0A            [ 7] 1906 	ld	a,(bc)
   9291 C6 16         [ 7] 1907 	add	a, #0x16
   9293 32 25 89      [13] 1908 	ld	(#(_cu + 0x0001)),a
                           1909 ;src/main.c:470: cu.sprite = g_knifeY_0;
   9296 21 A0 54      [10] 1910 	ld	hl,#_g_knifeY_0
   9299 22 28 89      [16] 1911 	ld	((_cu + 0x0004)), hl
                           1912 ;src/main.c:471: cu.eje = E_Y;
   929C 21 2C 89      [10] 1913 	ld	hl,#(_cu + 0x0008)
   929F 36 01         [10] 1914 	ld	(hl),#0x01
                           1915 ;src/main.c:472: dibujarCuchillo();
   92A1 C3 E3 90      [10] 1916 	jp  _dibujarCuchillo
   92A4                    1917 00112$:
                           1918 ;src/main.c:475: else if(prota.mira == M_arriba){
   92A4 7B            [ 4] 1919 	ld	a,e
   92A5 D6 02         [ 7] 1920 	sub	a, #0x02
   92A7 C0            [11] 1921 	ret	NZ
                           1922 ;src/main.c:476: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   92A8 0A            [ 7] 1923 	ld	a,(bc)
   92A9 C6 F7         [ 7] 1924 	add	a,#0xF7
   92AB 57            [ 4] 1925 	ld	d,a
   92AC 3A 1C 89      [13] 1926 	ld	a, (#_prota + 0)
   92AF C6 03         [ 7] 1927 	add	a, #0x03
   92B1 C5            [11] 1928 	push	bc
   92B2 D5            [11] 1929 	push	de
   92B3 33            [ 6] 1930 	inc	sp
   92B4 F5            [11] 1931 	push	af
   92B5 33            [ 6] 1932 	inc	sp
   92B6 CD 21 8A      [17] 1933 	call	_getTilePtr
   92B9 F1            [10] 1934 	pop	af
   92BA C1            [10] 1935 	pop	bc
   92BB 5E            [ 7] 1936 	ld	e,(hl)
   92BC 3E 02         [ 7] 1937 	ld	a,#0x02
   92BE 93            [ 4] 1938 	sub	a, e
   92BF D8            [11] 1939 	ret	C
                           1940 ;src/main.c:477: cu.lanzado = SI;
   92C0 21 2A 89      [10] 1941 	ld	hl,#(_cu + 0x0006)
   92C3 36 01         [10] 1942 	ld	(hl),#0x01
                           1943 ;src/main.c:478: cu.direccion = M_arriba;
   92C5 21 2B 89      [10] 1944 	ld	hl,#(_cu + 0x0007)
   92C8 36 02         [10] 1945 	ld	(hl),#0x02
                           1946 ;src/main.c:479: cu.x = prota.x + G_HERO_W / 2;
   92CA 3A 1C 89      [13] 1947 	ld	a, (#_prota + 0)
   92CD C6 03         [ 7] 1948 	add	a, #0x03
   92CF 32 24 89      [13] 1949 	ld	(#_cu),a
                           1950 ;src/main.c:480: cu.y = prota.y;
   92D2 0A            [ 7] 1951 	ld	a,(bc)
   92D3 32 25 89      [13] 1952 	ld	(#(_cu + 0x0001)),a
                           1953 ;src/main.c:481: cu.sprite = g_knifeY_1;
   92D6 21 B0 54      [10] 1954 	ld	hl,#_g_knifeY_1
   92D9 22 28 89      [16] 1955 	ld	((_cu + 0x0004)), hl
                           1956 ;src/main.c:482: cu.eje = E_Y;
   92DC 21 2C 89      [10] 1957 	ld	hl,#(_cu + 0x0008)
   92DF 36 01         [10] 1958 	ld	(hl),#0x01
                           1959 ;src/main.c:483: dibujarCuchillo();
   92E1 C3 E3 90      [10] 1960 	jp  _dibujarCuchillo
                           1961 ;src/main.c:489: void comprobarTeclado() {
                           1962 ;	---------------------------------
                           1963 ; Function comprobarTeclado
                           1964 ; ---------------------------------
   92E4                    1965 _comprobarTeclado::
                           1966 ;src/main.c:490: cpct_scanKeyboard_if();
   92E4 CD 9C 7E      [17] 1967 	call	_cpct_scanKeyboard_if
                           1968 ;src/main.c:492: if (cpct_isAnyKeyPressed()) {
   92E7 CD 8F 7E      [17] 1969 	call	_cpct_isAnyKeyPressed
   92EA 7D            [ 4] 1970 	ld	a,l
   92EB B7            [ 4] 1971 	or	a, a
   92EC C8            [11] 1972 	ret	Z
                           1973 ;src/main.c:493: if (cpct_isKeyPressed(Key_CursorLeft))
   92ED 21 01 01      [10] 1974 	ld	hl,#0x0101
   92F0 CD F9 7B      [17] 1975 	call	_cpct_isKeyPressed
   92F3 7D            [ 4] 1976 	ld	a,l
   92F4 B7            [ 4] 1977 	or	a, a
                           1978 ;src/main.c:494: moverIzquierda();
   92F5 C2 1B 90      [10] 1979 	jp	NZ,_moverIzquierda
                           1980 ;src/main.c:495: else if (cpct_isKeyPressed(Key_CursorRight))
   92F8 21 00 02      [10] 1981 	ld	hl,#0x0200
   92FB CD F9 7B      [17] 1982 	call	_cpct_isKeyPressed
   92FE 7D            [ 4] 1983 	ld	a,l
   92FF B7            [ 4] 1984 	or	a, a
                           1985 ;src/main.c:496: moverDerecha();
   9300 C2 40 90      [10] 1986 	jp	NZ,_moverDerecha
                           1987 ;src/main.c:497: else if (cpct_isKeyPressed(Key_CursorUp))
   9303 21 00 01      [10] 1988 	ld	hl,#0x0100
   9306 CD F9 7B      [17] 1989 	call	_cpct_isKeyPressed
   9309 7D            [ 4] 1990 	ld	a,l
   930A B7            [ 4] 1991 	or	a, a
                           1992 ;src/main.c:498: moverArriba();
   930B C2 86 90      [10] 1993 	jp	NZ,_moverArriba
                           1994 ;src/main.c:499: else if (cpct_isKeyPressed(Key_CursorDown))
   930E 21 00 04      [10] 1995 	ld	hl,#0x0400
   9311 CD F9 7B      [17] 1996 	call	_cpct_isKeyPressed
   9314 7D            [ 4] 1997 	ld	a,l
   9315 B7            [ 4] 1998 	or	a, a
                           1999 ;src/main.c:500: moverAbajo();
   9316 C2 AA 90      [10] 2000 	jp	NZ,_moverAbajo
                           2001 ;src/main.c:501: else if (cpct_isKeyPressed(Key_Space))
   9319 21 05 80      [10] 2002 	ld	hl,#0x8005
   931C CD F9 7B      [17] 2003 	call	_cpct_isKeyPressed
   931F 7D            [ 4] 2004 	ld	a,l
   9320 B7            [ 4] 2005 	or	a, a
   9321 C8            [11] 2006 	ret	Z
                           2007 ;src/main.c:502: lanzarCuchillo();
   9322 C3 C8 91      [10] 2008 	jp  _lanzarCuchillo
                           2009 ;src/main.c:506: u8 checkKnifeCollision(int direction){
                           2010 ;	---------------------------------
                           2011 ; Function checkKnifeCollision
                           2012 ; ---------------------------------
   9325                    2013 _checkKnifeCollision::
   9325 DD E5         [15] 2014 	push	ix
   9327 DD 21 00 00   [14] 2015 	ld	ix,#0
   932B DD 39         [15] 2016 	add	ix,sp
                           2017 ;src/main.c:508: u8 colisiona = 1;
   932D 0E 01         [ 7] 2018 	ld	c,#0x01
                           2019 ;src/main.c:510: switch (direction) {
   932F DD CB 05 7E   [20] 2020 	bit	7, 5 (ix)
   9333 C2 1F 94      [10] 2021 	jp	NZ,00125$
   9336 3E 03         [ 7] 2022 	ld	a,#0x03
   9338 DD BE 04      [19] 2023 	cp	a, 4 (ix)
   933B 3E 00         [ 7] 2024 	ld	a,#0x00
   933D DD 9E 05      [19] 2025 	sbc	a, 5 (ix)
   9340 E2 45 93      [10] 2026 	jp	PO, 00163$
   9343 EE 80         [ 7] 2027 	xor	a, #0x80
   9345                    2028 00163$:
   9345 FA 1F 94      [10] 2029 	jp	M,00125$
   9348 DD 5E 04      [19] 2030 	ld	e,4 (ix)
   934B 16 00         [ 7] 2031 	ld	d,#0x00
   934D 21 54 93      [10] 2032 	ld	hl,#00164$
   9350 19            [11] 2033 	add	hl,de
   9351 19            [11] 2034 	add	hl,de
   9352 19            [11] 2035 	add	hl,de
   9353 E9            [ 4] 2036 	jp	(hl)
   9354                    2037 00164$:
   9354 C3 1F 94      [10] 2038 	jp	00125$
   9357 C3 1F 94      [10] 2039 	jp	00125$
   935A C3 66 93      [10] 2040 	jp	00103$
   935D C3 BD 93      [10] 2041 	jp	00114$
                           2042 ;src/main.c:511: case 0:
                           2043 ;src/main.c:513: break;
   9360 C3 1F 94      [10] 2044 	jp	00125$
                           2045 ;src/main.c:514: case 1:
                           2046 ;src/main.c:516: break;
   9363 C3 1F 94      [10] 2047 	jp	00125$
                           2048 ;src/main.c:517: case 2:
   9366                    2049 00103$:
                           2050 ;src/main.c:519: if((enemy->x + G_ENEMY_W) < cu.x || enemy->x  > (cu.x + G_KNIFEX_0_W)){
   9366 21 F4 88      [10] 2051 	ld	hl,#_enemy+0
   9369 4E            [ 7] 2052 	ld	c,(hl)
   936A 06 00         [ 7] 2053 	ld	b,#0x00
   936C 21 04 00      [10] 2054 	ld	hl,#0x0004
   936F 09            [11] 2055 	add	hl,bc
   9370 EB            [ 4] 2056 	ex	de,hl
   9371 21 24 89      [10] 2057 	ld	hl,#_cu+0
   9374 6E            [ 7] 2058 	ld	l,(hl)
   9375 26 00         [ 7] 2059 	ld	h,#0x00
   9377 7B            [ 4] 2060 	ld	a,e
   9378 95            [ 4] 2061 	sub	a, l
   9379 7A            [ 4] 2062 	ld	a,d
   937A 9C            [ 4] 2063 	sbc	a, h
   937B E2 80 93      [10] 2064 	jp	PO, 00165$
   937E EE 80         [ 7] 2065 	xor	a, #0x80
   9380                    2066 00165$:
   9380 FA BD 93      [10] 2067 	jp	M,00114$
   9383 11 04 00      [10] 2068 	ld	de,#0x0004
   9386 19            [11] 2069 	add	hl,de
   9387 7D            [ 4] 2070 	ld	a,l
   9388 91            [ 4] 2071 	sub	a, c
   9389 7C            [ 4] 2072 	ld	a,h
   938A 98            [ 4] 2073 	sbc	a, b
   938B E2 90 93      [10] 2074 	jp	PO, 00166$
   938E EE 80         [ 7] 2075 	xor	a, #0x80
   9390                    2076 00166$:
   9390 FA BD 93      [10] 2077 	jp	M,00114$
                           2078 ;src/main.c:522: if(cu.y>enemy->y){
   9393 21 25 89      [10] 2079 	ld	hl, #(_cu + 0x0001) + 0
   9396 4E            [ 7] 2080 	ld	c,(hl)
   9397 21 F5 88      [10] 2081 	ld	hl, #_enemy + 1
   939A 5E            [ 7] 2082 	ld	e,(hl)
   939B 7B            [ 4] 2083 	ld	a,e
   939C 91            [ 4] 2084 	sub	a, c
   939D 30 1E         [12] 2085 	jr	NC,00114$
                           2086 ;src/main.c:523: if(cu.y - (enemy->y + G_ENEMY_H) >= 2){
   939F 06 00         [ 7] 2087 	ld	b,#0x00
   93A1 16 00         [ 7] 2088 	ld	d,#0x00
   93A3 21 16 00      [10] 2089 	ld	hl,#0x0016
   93A6 19            [11] 2090 	add	hl,de
   93A7 79            [ 4] 2091 	ld	a,c
   93A8 95            [ 4] 2092 	sub	a, l
   93A9 4F            [ 4] 2093 	ld	c,a
   93AA 78            [ 4] 2094 	ld	a,b
   93AB 9C            [ 4] 2095 	sbc	a, h
   93AC 47            [ 4] 2096 	ld	b,a
   93AD 79            [ 4] 2097 	ld	a,c
   93AE D6 02         [ 7] 2098 	sub	a, #0x02
   93B0 78            [ 4] 2099 	ld	a,b
   93B1 17            [ 4] 2100 	rla
   93B2 3F            [ 4] 2101 	ccf
   93B3 1F            [ 4] 2102 	rra
   93B4 DE 80         [ 7] 2103 	sbc	a, #0x80
   93B6 30 05         [12] 2104 	jr	NC,00114$
                           2105 ;src/main.c:528: enemy->muerto = SI;
   93B8 21 FC 88      [10] 2106 	ld	hl,#(_enemy + 0x0008)
   93BB 36 01         [10] 2107 	ld	(hl),#0x01
                           2108 ;src/main.c:535: case 3:
   93BD                    2109 00114$:
                           2110 ;src/main.c:537: if((enemy->x + G_ENEMY_W) < cu.x || enemy->x  > (cu.x + G_KNIFEX_0_W)){
   93BD 21 F4 88      [10] 2111 	ld	hl, #_enemy + 0
   93C0 4E            [ 7] 2112 	ld	c,(hl)
   93C1 06 00         [ 7] 2113 	ld	b,#0x00
   93C3 21 04 00      [10] 2114 	ld	hl,#0x0004
   93C6 09            [11] 2115 	add	hl,bc
   93C7 EB            [ 4] 2116 	ex	de,hl
   93C8 21 24 89      [10] 2117 	ld	hl, #_cu + 0
   93CB 6E            [ 7] 2118 	ld	l,(hl)
   93CC 26 00         [ 7] 2119 	ld	h,#0x00
   93CE 7B            [ 4] 2120 	ld	a,e
   93CF 95            [ 4] 2121 	sub	a, l
   93D0 7A            [ 4] 2122 	ld	a,d
   93D1 9C            [ 4] 2123 	sbc	a, h
   93D2 E2 D7 93      [10] 2124 	jp	PO, 00167$
   93D5 EE 80         [ 7] 2125 	xor	a, #0x80
   93D7                    2126 00167$:
   93D7 FA EA 93      [10] 2127 	jp	M,00121$
   93DA 11 04 00      [10] 2128 	ld	de,#0x0004
   93DD 19            [11] 2129 	add	hl,de
   93DE 7D            [ 4] 2130 	ld	a,l
   93DF 91            [ 4] 2131 	sub	a, c
   93E0 7C            [ 4] 2132 	ld	a,h
   93E1 98            [ 4] 2133 	sbc	a, b
   93E2 E2 E7 93      [10] 2134 	jp	PO, 00168$
   93E5 EE 80         [ 7] 2135 	xor	a, #0x80
   93E7                    2136 00168$:
   93E7 F2 EE 93      [10] 2137 	jp	P,00122$
   93EA                    2138 00121$:
                           2139 ;src/main.c:538: colisiona = 0;
   93EA 0E 00         [ 7] 2140 	ld	c,#0x00
   93EC 18 31         [12] 2141 	jr	00125$
   93EE                    2142 00122$:
                           2143 ;src/main.c:540: if(cu.y<enemy->y){
   93EE 21 25 89      [10] 2144 	ld	hl, #(_cu + 0x0001) + 0
   93F1 4E            [ 7] 2145 	ld	c,(hl)
   93F2 21 F5 88      [10] 2146 	ld	hl, #_enemy + 1
   93F5 6E            [ 7] 2147 	ld	l,(hl)
   93F6 79            [ 4] 2148 	ld	a,c
   93F7 95            [ 4] 2149 	sub	a, l
   93F8 30 23         [12] 2150 	jr	NC,00119$
                           2151 ;src/main.c:541: if(enemy->y - (cu.y + G_KNIFEX_0_H - 2) >= 2){
   93FA 26 00         [ 7] 2152 	ld	h,#0x00
   93FC 06 00         [ 7] 2153 	ld	b,#0x00
   93FE 03            [ 6] 2154 	inc	bc
   93FF 03            [ 6] 2155 	inc	bc
   9400 BF            [ 4] 2156 	cp	a, a
   9401 ED 42         [15] 2157 	sbc	hl, bc
   9403 11 02 80      [10] 2158 	ld	de, #0x8002
   9406 29            [11] 2159 	add	hl, hl
   9407 3F            [ 4] 2160 	ccf
   9408 CB 1C         [ 8] 2161 	rr	h
   940A CB 1D         [ 8] 2162 	rr	l
   940C ED 52         [15] 2163 	sbc	hl, de
   940E 38 04         [12] 2164 	jr	C,00116$
                           2165 ;src/main.c:542: colisiona = 0;
   9410 0E 00         [ 7] 2166 	ld	c,#0x00
   9412 18 0B         [12] 2167 	jr	00125$
   9414                    2168 00116$:
                           2169 ;src/main.c:544: colisiona = 1;
   9414 0E 01         [ 7] 2170 	ld	c,#0x01
                           2171 ;src/main.c:545: enemy->muerto = SI;
   9416 21 FC 88      [10] 2172 	ld	hl,#(_enemy + 0x0008)
   9419 36 01         [10] 2173 	ld	(hl),#0x01
   941B 18 02         [12] 2174 	jr	00125$
   941D                    2175 00119$:
                           2176 ;src/main.c:548: colisiona = 0;
   941D 0E 00         [ 7] 2177 	ld	c,#0x00
                           2178 ;src/main.c:551: }
   941F                    2179 00125$:
                           2180 ;src/main.c:552: return colisiona;
   941F 69            [ 4] 2181 	ld	l,c
   9420 DD E1         [14] 2182 	pop	ix
   9422 C9            [10] 2183 	ret
                           2184 ;src/main.c:555: void moverCuchillo(){
                           2185 ;	---------------------------------
                           2186 ; Function moverCuchillo
                           2187 ; ---------------------------------
   9423                    2188 _moverCuchillo::
                           2189 ;src/main.c:557: if(cu.lanzado){
   9423 01 24 89      [10] 2190 	ld	bc,#_cu+0
   9426 3A 2A 89      [13] 2191 	ld	a, (#_cu + 6)
   9429 B7            [ 4] 2192 	or	a, a
   942A C8            [11] 2193 	ret	Z
                           2194 ;src/main.c:558: cu.mover = 1;
   942B 21 2D 89      [10] 2195 	ld	hl,#(_cu + 0x0009)
   942E 36 01         [10] 2196 	ld	(hl),#0x01
                           2197 ;src/main.c:559: if(cu.direccion == M_derecha){
   9430 21 2B 89      [10] 2198 	ld	hl, #_cu + 7
   9433 6E            [ 7] 2199 	ld	l,(hl)
                           2200 ;src/main.c:561: if( *getTilePtr(cu.x + G_KNIFEX_0_W + 1, cu.y) <= 2){
   9434 59            [ 4] 2201 	ld	e, c
   9435 50            [ 4] 2202 	ld	d, b
   9436 13            [ 6] 2203 	inc	de
                           2204 ;src/main.c:559: if(cu.direccion == M_derecha){
   9437 7D            [ 4] 2205 	ld	a,l
   9438 B7            [ 4] 2206 	or	a, a
   9439 20 27         [12] 2207 	jr	NZ,00128$
                           2208 ;src/main.c:561: if( *getTilePtr(cu.x + G_KNIFEX_0_W + 1, cu.y) <= 2){
   943B 1A            [ 7] 2209 	ld	a,(de)
   943C 5F            [ 4] 2210 	ld	e,a
   943D 0A            [ 7] 2211 	ld	a,(bc)
   943E C6 05         [ 7] 2212 	add	a, #0x05
   9440 6F            [ 4] 2213 	ld	l,a
   9441 C5            [11] 2214 	push	bc
   9442 7B            [ 4] 2215 	ld	a,e
   9443 F5            [11] 2216 	push	af
   9444 33            [ 6] 2217 	inc	sp
   9445 7D            [ 4] 2218 	ld	a,l
   9446 F5            [11] 2219 	push	af
   9447 33            [ 6] 2220 	inc	sp
   9448 CD 21 8A      [17] 2221 	call	_getTilePtr
   944B F1            [10] 2222 	pop	af
   944C C1            [10] 2223 	pop	bc
   944D 5E            [ 7] 2224 	ld	e,(hl)
   944E 3E 02         [ 7] 2225 	ld	a,#0x02
   9450 93            [ 4] 2226 	sub	a, e
   9451 38 09         [12] 2227 	jr	C,00102$
                           2228 ;src/main.c:562: cu.x++;
   9453 0A            [ 7] 2229 	ld	a,(bc)
   9454 3C            [ 4] 2230 	inc	a
   9455 02            [ 7] 2231 	ld	(bc),a
                           2232 ;src/main.c:563: cu.mover = SI;
   9456 21 2D 89      [10] 2233 	ld	hl,#(_cu + 0x0009)
   9459 36 01         [10] 2234 	ld	(hl),#0x01
   945B C9            [10] 2235 	ret
   945C                    2236 00102$:
                           2237 ;src/main.c:567: cu.mover=NO;
   945C 21 2D 89      [10] 2238 	ld	hl,#(_cu + 0x0009)
   945F 36 00         [10] 2239 	ld	(hl),#0x00
   9461 C9            [10] 2240 	ret
   9462                    2241 00128$:
                           2242 ;src/main.c:570: else if(cu.direccion == M_izquierda){
   9462 7D            [ 4] 2243 	ld	a,l
   9463 3D            [ 4] 2244 	dec	a
   9464 20 26         [12] 2245 	jr	NZ,00125$
                           2246 ;src/main.c:571: if(*getTilePtr(cu.x - 1, cu.y) <= 2){
   9466 1A            [ 7] 2247 	ld	a,(de)
   9467 5F            [ 4] 2248 	ld	e,a
   9468 0A            [ 7] 2249 	ld	a,(bc)
   9469 57            [ 4] 2250 	ld	d,a
   946A 15            [ 4] 2251 	dec	d
   946B C5            [11] 2252 	push	bc
   946C 7B            [ 4] 2253 	ld	a,e
   946D F5            [11] 2254 	push	af
   946E 33            [ 6] 2255 	inc	sp
   946F D5            [11] 2256 	push	de
   9470 33            [ 6] 2257 	inc	sp
   9471 CD 21 8A      [17] 2258 	call	_getTilePtr
   9474 F1            [10] 2259 	pop	af
   9475 C1            [10] 2260 	pop	bc
   9476 5E            [ 7] 2261 	ld	e,(hl)
   9477 3E 02         [ 7] 2262 	ld	a,#0x02
   9479 93            [ 4] 2263 	sub	a, e
   947A 38 0A         [12] 2264 	jr	C,00105$
                           2265 ;src/main.c:572: cu.x--;
   947C 0A            [ 7] 2266 	ld	a,(bc)
   947D C6 FF         [ 7] 2267 	add	a,#0xFF
   947F 02            [ 7] 2268 	ld	(bc),a
                           2269 ;src/main.c:573: cu.mover = SI;
   9480 21 2D 89      [10] 2270 	ld	hl,#(_cu + 0x0009)
   9483 36 01         [10] 2271 	ld	(hl),#0x01
   9485 C9            [10] 2272 	ret
   9486                    2273 00105$:
                           2274 ;src/main.c:576: cu.mover=NO;
   9486 21 2D 89      [10] 2275 	ld	hl,#(_cu + 0x0009)
   9489 36 00         [10] 2276 	ld	(hl),#0x00
   948B C9            [10] 2277 	ret
   948C                    2278 00125$:
                           2279 ;src/main.c:579: else if(cu.direccion == M_arriba){
   948C 7D            [ 4] 2280 	ld	a,l
   948D D6 02         [ 7] 2281 	sub	a, #0x02
   948F 20 3E         [12] 2282 	jr	NZ,00122$
                           2283 ;src/main.c:580: if(*getTilePtr(cu.x, cu.y - 2) <= 2){
   9491 1A            [ 7] 2284 	ld	a,(de)
   9492 C6 FE         [ 7] 2285 	add	a,#0xFE
   9494 F5            [11] 2286 	push	af
   9495 0A            [ 7] 2287 	ld	a,(bc)
   9496 47            [ 4] 2288 	ld	b,a
   9497 F1            [10] 2289 	pop	af
   9498 D5            [11] 2290 	push	de
   9499 F5            [11] 2291 	push	af
   949A 33            [ 6] 2292 	inc	sp
   949B C5            [11] 2293 	push	bc
   949C 33            [ 6] 2294 	inc	sp
   949D CD 21 8A      [17] 2295 	call	_getTilePtr
   94A0 F1            [10] 2296 	pop	af
   94A1 D1            [10] 2297 	pop	de
   94A2 4E            [ 7] 2298 	ld	c,(hl)
   94A3 3E 02         [ 7] 2299 	ld	a,#0x02
   94A5 91            [ 4] 2300 	sub	a, c
   94A6 38 21         [12] 2301 	jr	C,00111$
                           2302 ;src/main.c:581: if(!checkKnifeCollision(M_arriba)){
   94A8 D5            [11] 2303 	push	de
   94A9 21 02 00      [10] 2304 	ld	hl,#0x0002
   94AC E5            [11] 2305 	push	hl
   94AD CD 25 93      [17] 2306 	call	_checkKnifeCollision
   94B0 F1            [10] 2307 	pop	af
   94B1 D1            [10] 2308 	pop	de
   94B2 7D            [ 4] 2309 	ld	a,l
   94B3 B7            [ 4] 2310 	or	a, a
   94B4 20 0D         [12] 2311 	jr	NZ,00108$
                           2312 ;src/main.c:582: cu.y--;
   94B6 1A            [ 7] 2313 	ld	a,(de)
   94B7 C6 FF         [ 7] 2314 	add	a,#0xFF
   94B9 12            [ 7] 2315 	ld	(de),a
                           2316 ;src/main.c:583: cu.y--;
   94BA C6 FF         [ 7] 2317 	add	a,#0xFF
   94BC 12            [ 7] 2318 	ld	(de),a
                           2319 ;src/main.c:584: cu.mover = SI;
   94BD 21 2D 89      [10] 2320 	ld	hl,#(_cu + 0x0009)
   94C0 36 01         [10] 2321 	ld	(hl),#0x01
   94C2 C9            [10] 2322 	ret
   94C3                    2323 00108$:
                           2324 ;src/main.c:587: cu.mover=NO;
   94C3 21 2D 89      [10] 2325 	ld	hl,#(_cu + 0x0009)
   94C6 36 00         [10] 2326 	ld	(hl),#0x00
   94C8 C9            [10] 2327 	ret
   94C9                    2328 00111$:
                           2329 ;src/main.c:590: cu.mover=NO;
   94C9 21 2D 89      [10] 2330 	ld	hl,#(_cu + 0x0009)
   94CC 36 00         [10] 2331 	ld	(hl),#0x00
   94CE C9            [10] 2332 	ret
   94CF                    2333 00122$:
                           2334 ;src/main.c:595: else if(cu.direccion == M_abajo){
   94CF 7D            [ 4] 2335 	ld	a,l
   94D0 D6 03         [ 7] 2336 	sub	a, #0x03
   94D2 C0            [11] 2337 	ret	NZ
                           2338 ;src/main.c:596: if(*getTilePtr(cu.x, cu.y + G_KNIFEY_0_H + 2) <= 2){
   94D3 1A            [ 7] 2339 	ld	a,(de)
   94D4 C6 0A         [ 7] 2340 	add	a, #0x0A
   94D6 F5            [11] 2341 	push	af
   94D7 0A            [ 7] 2342 	ld	a,(bc)
   94D8 47            [ 4] 2343 	ld	b,a
   94D9 F1            [10] 2344 	pop	af
   94DA D5            [11] 2345 	push	de
   94DB F5            [11] 2346 	push	af
   94DC 33            [ 6] 2347 	inc	sp
   94DD C5            [11] 2348 	push	bc
   94DE 33            [ 6] 2349 	inc	sp
   94DF CD 21 8A      [17] 2350 	call	_getTilePtr
   94E2 F1            [10] 2351 	pop	af
   94E3 D1            [10] 2352 	pop	de
   94E4 4E            [ 7] 2353 	ld	c,(hl)
   94E5 3E 02         [ 7] 2354 	ld	a,#0x02
   94E7 91            [ 4] 2355 	sub	a, c
   94E8 38 1F         [12] 2356 	jr	C,00117$
                           2357 ;src/main.c:597: if(!checkKnifeCollision(M_abajo)){
   94EA D5            [11] 2358 	push	de
   94EB 21 03 00      [10] 2359 	ld	hl,#0x0003
   94EE E5            [11] 2360 	push	hl
   94EF CD 25 93      [17] 2361 	call	_checkKnifeCollision
   94F2 F1            [10] 2362 	pop	af
   94F3 D1            [10] 2363 	pop	de
   94F4 7D            [ 4] 2364 	ld	a,l
   94F5 B7            [ 4] 2365 	or	a, a
   94F6 20 0B         [12] 2366 	jr	NZ,00114$
                           2367 ;src/main.c:598: cu.y++;
   94F8 1A            [ 7] 2368 	ld	a,(de)
   94F9 3C            [ 4] 2369 	inc	a
   94FA 12            [ 7] 2370 	ld	(de),a
                           2371 ;src/main.c:599: cu.y++;
   94FB 3C            [ 4] 2372 	inc	a
   94FC 12            [ 7] 2373 	ld	(de),a
                           2374 ;src/main.c:600: cu.mover = SI;
   94FD 21 2D 89      [10] 2375 	ld	hl,#(_cu + 0x0009)
   9500 36 01         [10] 2376 	ld	(hl),#0x01
   9502 C9            [10] 2377 	ret
   9503                    2378 00114$:
                           2379 ;src/main.c:603: cu.mover=NO;
   9503 21 2D 89      [10] 2380 	ld	hl,#(_cu + 0x0009)
   9506 36 00         [10] 2381 	ld	(hl),#0x00
   9508 C9            [10] 2382 	ret
   9509                    2383 00117$:
                           2384 ;src/main.c:606: cu.mover=NO;
   9509 21 2D 89      [10] 2385 	ld	hl,#(_cu + 0x0009)
   950C 36 00         [10] 2386 	ld	(hl),#0x00
   950E C9            [10] 2387 	ret
                           2388 ;src/main.c:611: void barraPuntuacionInicial(){
                           2389 ;	---------------------------------
                           2390 ; Function barraPuntuacionInicial
                           2391 ; ---------------------------------
   950F                    2392 _barraPuntuacionInicial::
                           2393 ;src/main.c:616: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 178); //
   950F 21 00 B2      [10] 2394 	ld	hl,#0xB200
   9512 E5            [11] 2395 	push	hl
   9513 26 C0         [ 7] 2396 	ld	h, #0xC0
   9515 E5            [11] 2397 	push	hl
   9516 CD 70 88      [17] 2398 	call	_cpct_getScreenPtr
   9519 4D            [ 4] 2399 	ld	c,l
   951A 44            [ 4] 2400 	ld	b,h
                           2401 ;src/main.c:617: cpct_drawStringM0("SCORE", memptr, 1, 0);
   951B 21 01 00      [10] 2402 	ld	hl,#0x0001
   951E E5            [11] 2403 	push	hl
   951F C5            [11] 2404 	push	bc
   9520 21 B7 95      [10] 2405 	ld	hl,#___str_1
   9523 E5            [11] 2406 	push	hl
   9524 CD 7B 7C      [17] 2407 	call	_cpct_drawStringM0
   9527 21 06 00      [10] 2408 	ld	hl,#6
   952A 39            [11] 2409 	add	hl,sp
   952B F9            [ 6] 2410 	ld	sp,hl
                           2411 ;src/main.c:618: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 190); // puntuación inicial
   952C 21 00 BE      [10] 2412 	ld	hl,#0xBE00
   952F E5            [11] 2413 	push	hl
   9530 26 C0         [ 7] 2414 	ld	h, #0xC0
   9532 E5            [11] 2415 	push	hl
   9533 CD 70 88      [17] 2416 	call	_cpct_getScreenPtr
   9536 4D            [ 4] 2417 	ld	c,l
   9537 44            [ 4] 2418 	ld	b,h
                           2419 ;src/main.c:619: cpct_drawStringM0("00000", memptr, 15, 0);
   9538 21 0F 00      [10] 2420 	ld	hl,#0x000F
   953B E5            [11] 2421 	push	hl
   953C C5            [11] 2422 	push	bc
   953D 21 BD 95      [10] 2423 	ld	hl,#___str_2
   9540 E5            [11] 2424 	push	hl
   9541 CD 7B 7C      [17] 2425 	call	_cpct_drawStringM0
   9544 21 06 00      [10] 2426 	ld	hl,#6
   9547 39            [11] 2427 	add	hl,sp
   9548 F9            [ 6] 2428 	ld	sp,hl
                           2429 ;src/main.c:622: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 190);
   9549 21 1A BE      [10] 2430 	ld	hl,#0xBE1A
   954C E5            [11] 2431 	push	hl
   954D 21 00 C0      [10] 2432 	ld	hl,#0xC000
   9550 E5            [11] 2433 	push	hl
   9551 CD 70 88      [17] 2434 	call	_cpct_getScreenPtr
   9554 4D            [ 4] 2435 	ld	c,l
   9555 44            [ 4] 2436 	ld	b,h
                           2437 ;src/main.c:623: cpct_drawStringM0("ROBOBIT", memptr, 3, 0);
   9556 21 03 00      [10] 2438 	ld	hl,#0x0003
   9559 E5            [11] 2439 	push	hl
   955A C5            [11] 2440 	push	bc
   955B 21 C3 95      [10] 2441 	ld	hl,#___str_3
   955E E5            [11] 2442 	push	hl
   955F CD 7B 7C      [17] 2443 	call	_cpct_drawStringM0
   9562 21 06 00      [10] 2444 	ld	hl,#6
   9565 39            [11] 2445 	add	hl,sp
   9566 F9            [ 6] 2446 	ld	sp,hl
                           2447 ;src/main.c:625: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 178); //
   9567 21 3C B2      [10] 2448 	ld	hl,#0xB23C
   956A E5            [11] 2449 	push	hl
   956B 21 00 C0      [10] 2450 	ld	hl,#0xC000
   956E E5            [11] 2451 	push	hl
   956F CD 70 88      [17] 2452 	call	_cpct_getScreenPtr
   9572 4D            [ 4] 2453 	ld	c,l
   9573 44            [ 4] 2454 	ld	b,h
                           2455 ;src/main.c:626: cpct_drawStringM0("LIVES", memptr, 1, 0);
   9574 21 01 00      [10] 2456 	ld	hl,#0x0001
   9577 E5            [11] 2457 	push	hl
   9578 C5            [11] 2458 	push	bc
   9579 21 CB 95      [10] 2459 	ld	hl,#___str_4
   957C E5            [11] 2460 	push	hl
   957D CD 7B 7C      [17] 2461 	call	_cpct_drawStringM0
   9580 21 06 00      [10] 2462 	ld	hl,#6
   9583 39            [11] 2463 	add	hl,sp
   9584 F9            [ 6] 2464 	ld	sp,hl
                           2465 ;src/main.c:628: for(i=0; i<5; i++){
   9585 01 00 00      [10] 2466 	ld	bc,#0x0000
   9588                    2467 00102$:
                           2468 ;src/main.c:629: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 190); // dibuja 5 corazones
   9588 79            [ 4] 2469 	ld	a,c
   9589 87            [ 4] 2470 	add	a, a
   958A 87            [ 4] 2471 	add	a, a
   958B C6 3C         [ 7] 2472 	add	a, #0x3C
   958D 57            [ 4] 2473 	ld	d,a
   958E C5            [11] 2474 	push	bc
   958F 3E BE         [ 7] 2475 	ld	a,#0xBE
   9591 F5            [11] 2476 	push	af
   9592 33            [ 6] 2477 	inc	sp
   9593 D5            [11] 2478 	push	de
   9594 33            [ 6] 2479 	inc	sp
   9595 21 00 C0      [10] 2480 	ld	hl,#0xC000
   9598 E5            [11] 2481 	push	hl
   9599 CD 70 88      [17] 2482 	call	_cpct_getScreenPtr
   959C EB            [ 4] 2483 	ex	de,hl
   959D 21 03 06      [10] 2484 	ld	hl,#0x0603
   95A0 E5            [11] 2485 	push	hl
   95A1 D5            [11] 2486 	push	de
   95A2 21 60 78      [10] 2487 	ld	hl,#_g_heart
   95A5 E5            [11] 2488 	push	hl
   95A6 CD 9F 7C      [17] 2489 	call	_cpct_drawSprite
   95A9 C1            [10] 2490 	pop	bc
                           2491 ;src/main.c:628: for(i=0; i<5; i++){
   95AA 03            [ 6] 2492 	inc	bc
   95AB 79            [ 4] 2493 	ld	a,c
   95AC D6 05         [ 7] 2494 	sub	a, #0x05
   95AE 78            [ 4] 2495 	ld	a,b
   95AF 17            [ 4] 2496 	rla
   95B0 3F            [ 4] 2497 	ccf
   95B1 1F            [ 4] 2498 	rra
   95B2 DE 80         [ 7] 2499 	sbc	a, #0x80
   95B4 38 D2         [12] 2500 	jr	C,00102$
   95B6 C9            [10] 2501 	ret
   95B7                    2502 ___str_1:
   95B7 53 43 4F 52 45     2503 	.ascii "SCORE"
   95BC 00                 2504 	.db 0x00
   95BD                    2505 ___str_2:
   95BD 30 30 30 30 30     2506 	.ascii "00000"
   95C2 00                 2507 	.db 0x00
   95C3                    2508 ___str_3:
   95C3 52 4F 42 4F 42 49  2509 	.ascii "ROBOBIT"
        54
   95CA 00                 2510 	.db 0x00
   95CB                    2511 ___str_4:
   95CB 4C 49 56 45 53     2512 	.ascii "LIVES"
   95D0 00                 2513 	.db 0x00
                           2514 ;src/main.c:634: void borrarPantallaAbajo(){
                           2515 ;	---------------------------------
                           2516 ; Function borrarPantallaAbajo
                           2517 ; ---------------------------------
   95D1                    2518 _borrarPantallaAbajo::
                           2519 ;src/main.c:637: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 176); // posición para borrar la mitad derecha
   95D1 21 00 B0      [10] 2520 	ld	hl,#0xB000
   95D4 E5            [11] 2521 	push	hl
   95D5 26 C0         [ 7] 2522 	ld	h, #0xC0
   95D7 E5            [11] 2523 	push	hl
   95D8 CD 70 88      [17] 2524 	call	_cpct_getScreenPtr
   95DB 4D            [ 4] 2525 	ld	c,l
   95DC 44            [ 4] 2526 	ld	b,h
                           2527 ;src/main.c:638: cpct_drawSolidBox(memptr, 0, 40, 7);  //borra la mitad derecha
   95DD 21 28 07      [10] 2528 	ld	hl,#0x0728
   95E0 E5            [11] 2529 	push	hl
   95E1 AF            [ 4] 2530 	xor	a, a
   95E2 F5            [11] 2531 	push	af
   95E3 33            [ 6] 2532 	inc	sp
   95E4 C5            [11] 2533 	push	bc
   95E5 CD 96 87      [17] 2534 	call	_cpct_drawSolidBox
   95E8 F1            [10] 2535 	pop	af
                           2536 ;src/main.c:639: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 40, 176); // posición para borrar la mitad izquierda
   95E9 33            [ 6] 2537 	inc	sp
   95EA 21 28 B0      [10] 2538 	ld	hl,#0xB028
   95ED E3            [19] 2539 	ex	(sp),hl
   95EE 21 00 C0      [10] 2540 	ld	hl,#0xC000
   95F1 E5            [11] 2541 	push	hl
   95F2 CD 70 88      [17] 2542 	call	_cpct_getScreenPtr
   95F5 4D            [ 4] 2543 	ld	c,l
   95F6 44            [ 4] 2544 	ld	b,h
                           2545 ;src/main.c:640: cpct_drawSolidBox(memptr, 0, 40, 7);  //borra la mitad izquierda
   95F7 21 28 07      [10] 2546 	ld	hl,#0x0728
   95FA E5            [11] 2547 	push	hl
   95FB AF            [ 4] 2548 	xor	a, a
   95FC F5            [11] 2549 	push	af
   95FD 33            [ 6] 2550 	inc	sp
   95FE C5            [11] 2551 	push	bc
   95FF CD 96 87      [17] 2552 	call	_cpct_drawSolidBox
   9602 F1            [10] 2553 	pop	af
   9603 F1            [10] 2554 	pop	af
   9604 33            [ 6] 2555 	inc	sp
   9605 C9            [10] 2556 	ret
                           2557 ;src/main.c:643: void menuInicio(){
                           2558 ;	---------------------------------
                           2559 ; Function menuInicio
                           2560 ; ---------------------------------
   9606                    2561 _menuInicio::
                           2562 ;src/main.c:647: cpct_clearScreen(0);
   9606 21 00 40      [10] 2563 	ld	hl,#0x4000
   9609 E5            [11] 2564 	push	hl
   960A AF            [ 4] 2565 	xor	a, a
   960B F5            [11] 2566 	push	af
   960C 33            [ 6] 2567 	inc	sp
   960D 26 C0         [ 7] 2568 	ld	h, #0xC0
   960F E5            [11] 2569 	push	hl
   9610 CD 2A 7F      [17] 2570 	call	_cpct_memset
                           2571 ;src/main.c:649: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   9613 21 1A 0F      [10] 2572 	ld	hl,#0x0F1A
   9616 E5            [11] 2573 	push	hl
   9617 21 00 C0      [10] 2574 	ld	hl,#0xC000
   961A E5            [11] 2575 	push	hl
   961B CD 70 88      [17] 2576 	call	_cpct_getScreenPtr
   961E 4D            [ 4] 2577 	ld	c,l
   961F 44            [ 4] 2578 	ld	b,h
                           2579 ;src/main.c:650: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   9620 21 04 00      [10] 2580 	ld	hl,#0x0004
   9623 E5            [11] 2581 	push	hl
   9624 C5            [11] 2582 	push	bc
   9625 21 B9 96      [10] 2583 	ld	hl,#___str_5
   9628 E5            [11] 2584 	push	hl
   9629 CD 7B 7C      [17] 2585 	call	_cpct_drawStringM0
   962C 21 06 00      [10] 2586 	ld	hl,#6
   962F 39            [11] 2587 	add	hl,sp
   9630 F9            [ 6] 2588 	ld	sp,hl
                           2589 ;src/main.c:652: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   9631 21 28 6E      [10] 2590 	ld	hl,#0x6E28
   9634 E5            [11] 2591 	push	hl
   9635 21 F0 F0      [10] 2592 	ld	hl,#0xF0F0
   9638 E5            [11] 2593 	push	hl
   9639 21 00 56      [10] 2594 	ld	hl,#_g_text_0
   963C E5            [11] 2595 	push	hl
   963D CD 9F 7C      [17] 2596 	call	_cpct_drawSprite
                           2597 ;src/main.c:653: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   9640 21 28 6E      [10] 2598 	ld	hl,#0x6E28
   9643 E5            [11] 2599 	push	hl
   9644 21 18 F1      [10] 2600 	ld	hl,#0xF118
   9647 E5            [11] 2601 	push	hl
   9648 21 30 67      [10] 2602 	ld	hl,#_g_text_1
   964B E5            [11] 2603 	push	hl
   964C CD 9F 7C      [17] 2604 	call	_cpct_drawSprite
                           2605 ;src/main.c:676: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   964F 21 08 A0      [10] 2606 	ld	hl,#0xA008
   9652 E5            [11] 2607 	push	hl
   9653 21 00 C0      [10] 2608 	ld	hl,#0xC000
   9656 E5            [11] 2609 	push	hl
   9657 CD 70 88      [17] 2610 	call	_cpct_getScreenPtr
   965A 4D            [ 4] 2611 	ld	c,l
   965B 44            [ 4] 2612 	ld	b,h
                           2613 ;src/main.c:677: cpct_drawStringM0("TO START PRESS S", memptr, 4, 0);
   965C 21 04 00      [10] 2614 	ld	hl,#0x0004
   965F E5            [11] 2615 	push	hl
   9660 C5            [11] 2616 	push	bc
   9661 21 C1 96      [10] 2617 	ld	hl,#___str_6
   9664 E5            [11] 2618 	push	hl
   9665 CD 7B 7C      [17] 2619 	call	_cpct_drawStringM0
   9668 21 06 00      [10] 2620 	ld	hl,#6
   966B 39            [11] 2621 	add	hl,sp
   966C F9            [ 6] 2622 	ld	sp,hl
                           2623 ;src/main.c:679: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 170); // centrado en horizontal y abajo en vertical
   966D 21 0A AA      [10] 2624 	ld	hl,#0xAA0A
   9670 E5            [11] 2625 	push	hl
   9671 21 00 C0      [10] 2626 	ld	hl,#0xC000
   9674 E5            [11] 2627 	push	hl
   9675 CD 70 88      [17] 2628 	call	_cpct_getScreenPtr
   9678 4D            [ 4] 2629 	ld	c,l
   9679 44            [ 4] 2630 	ld	b,h
                           2631 ;src/main.c:680: cpct_drawStringM0("TO MENU PRESS M", memptr, 4, 0);
   967A 21 04 00      [10] 2632 	ld	hl,#0x0004
   967D E5            [11] 2633 	push	hl
   967E C5            [11] 2634 	push	bc
   967F 21 D2 96      [10] 2635 	ld	hl,#___str_7
   9682 E5            [11] 2636 	push	hl
   9683 CD 7B 7C      [17] 2637 	call	_cpct_drawStringM0
   9686 21 06 00      [10] 2638 	ld	hl,#6
   9689 39            [11] 2639 	add	hl,sp
   968A F9            [ 6] 2640 	ld	sp,hl
                           2641 ;src/main.c:683: do{
   968B                    2642 00106$:
                           2643 ;src/main.c:684: cpct_scanKeyboard_f();
   968B CD 05 7C      [17] 2644 	call	_cpct_scanKeyboard_f
                           2645 ;src/main.c:687: else */if(cpct_isKeyPressed(Key_M)){
   968E 21 04 40      [10] 2646 	ld	hl,#0x4004
   9691 CD F9 7B      [17] 2647 	call	_cpct_isKeyPressed
   9694 7D            [ 4] 2648 	ld	a,l
   9695 B7            [ 4] 2649 	or	a, a
   9696 28 0D         [12] 2650 	jr	Z,00107$
                           2651 ;src/main.c:688: cpct_scanKeyboard_f();
   9698 CD 05 7C      [17] 2652 	call	_cpct_scanKeyboard_f
                           2653 ;src/main.c:689: do{
   969B                    2654 00101$:
                           2655 ;src/main.c:691: } while(!cpct_isKeyPressed(Key_S));
   969B 21 07 10      [10] 2656 	ld	hl,#0x1007
   969E CD F9 7B      [17] 2657 	call	_cpct_isKeyPressed
   96A1 7D            [ 4] 2658 	ld	a,l
   96A2 B7            [ 4] 2659 	or	a, a
   96A3 28 F6         [12] 2660 	jr	Z,00101$
   96A5                    2661 00107$:
                           2662 ;src/main.c:693: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   96A5 21 07 10      [10] 2663 	ld	hl,#0x1007
   96A8 CD F9 7B      [17] 2664 	call	_cpct_isKeyPressed
   96AB 7D            [ 4] 2665 	ld	a,l
   96AC B7            [ 4] 2666 	or	a, a
   96AD C0            [11] 2667 	ret	NZ
   96AE 21 04 40      [10] 2668 	ld	hl,#0x4004
   96B1 CD F9 7B      [17] 2669 	call	_cpct_isKeyPressed
   96B4 7D            [ 4] 2670 	ld	a,l
   96B5 B7            [ 4] 2671 	or	a, a
   96B6 28 D3         [12] 2672 	jr	Z,00106$
   96B8 C9            [10] 2673 	ret
   96B9                    2674 ___str_5:
   96B9 52 4F 42 4F 42 49  2675 	.ascii "ROBOBIT"
        54
   96C0 00                 2676 	.db 0x00
   96C1                    2677 ___str_6:
   96C1 54 4F 20 53 54 41  2678 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   96D1 00                 2679 	.db 0x00
   96D2                    2680 ___str_7:
   96D2 54 4F 20 4D 45 4E  2681 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   96E1 00                 2682 	.db 0x00
                           2683 ;src/main.c:696: void inicializarCPC() {
                           2684 ;	---------------------------------
                           2685 ; Function inicializarCPC
                           2686 ; ---------------------------------
   96E2                    2687 _inicializarCPC::
                           2688 ;src/main.c:697: cpct_disableFirmware();
   96E2 CD 61 87      [17] 2689 	call	_cpct_disableFirmware
                           2690 ;src/main.c:698: cpct_setVideoMode(0);
   96E5 2E 00         [ 7] 2691 	ld	l,#0x00
   96E7 CD 0C 7F      [17] 2692 	call	_cpct_setVideoMode
                           2693 ;src/main.c:699: cpct_setBorder(HW_BLACK);
   96EA 21 10 14      [10] 2694 	ld	hl,#0x1410
   96ED E5            [11] 2695 	push	hl
   96EE CD 6F 7C      [17] 2696 	call	_cpct_setPALColour
                           2697 ;src/main.c:700: cpct_setPalette(g_palette, 16);
   96F1 21 10 00      [10] 2698 	ld	hl,#0x0010
   96F4 E5            [11] 2699 	push	hl
   96F5 21 98 7A      [10] 2700 	ld	hl,#_g_palette
   96F8 E5            [11] 2701 	push	hl
   96F9 CD E2 7B      [17] 2702 	call	_cpct_setPalette
                           2703 ;src/main.c:701: cpct_akp_musicInit(G_song);
   96FC 21 00 3F      [10] 2704 	ld	hl,#_G_song
   96FF E5            [11] 2705 	push	hl
   9700 CD 3D 86      [17] 2706 	call	_cpct_akp_musicInit
   9703 F1            [10] 2707 	pop	af
   9704 C9            [10] 2708 	ret
                           2709 ;src/main.c:704: void inicializarEnemy() {
                           2710 ;	---------------------------------
                           2711 ; Function inicializarEnemy
                           2712 ; ---------------------------------
   9705                    2713 _inicializarEnemy::
                           2714 ;src/main.c:709: actual = enemy;
   9705 01 F4 88      [10] 2715 	ld	bc,#_enemy+0
                           2716 ;src/main.c:710: while(--i){
   9708 1E 05         [ 7] 2717 	ld	e,#0x05
   970A                    2718 00104$:
   970A 1D            [ 4] 2719 	dec e
   970B C8            [11] 2720 	ret	Z
                           2721 ;src/main.c:711: actual->x = actual->px = 71;
   970C 69            [ 4] 2722 	ld	l, c
   970D 60            [ 4] 2723 	ld	h, b
   970E 23            [ 6] 2724 	inc	hl
   970F 23            [ 6] 2725 	inc	hl
   9710 36 47         [10] 2726 	ld	(hl),#0x47
   9712 3E 47         [ 7] 2727 	ld	a,#0x47
   9714 02            [ 7] 2728 	ld	(bc),a
                           2729 ;src/main.c:712: actual->y = actual->py = 84;
   9715 C5            [11] 2730 	push	bc
   9716 FD E1         [14] 2731 	pop	iy
   9718 FD 23         [10] 2732 	inc	iy
   971A 69            [ 4] 2733 	ld	l, c
   971B 60            [ 4] 2734 	ld	h, b
   971C 23            [ 6] 2735 	inc	hl
   971D 23            [ 6] 2736 	inc	hl
   971E 23            [ 6] 2737 	inc	hl
   971F 36 54         [10] 2738 	ld	(hl),#0x54
   9721 FD 36 00 54   [19] 2739 	ld	0 (iy), #0x54
                           2740 ;src/main.c:713: actual->mover  = NO;
   9725 21 06 00      [10] 2741 	ld	hl,#0x0006
   9728 09            [11] 2742 	add	hl,bc
   9729 36 00         [10] 2743 	ld	(hl),#0x00
                           2744 ;src/main.c:714: actual->mira=M_abajo;
   972B 21 07 00      [10] 2745 	ld	hl,#0x0007
   972E 09            [11] 2746 	add	hl,bc
   972F 36 03         [10] 2747 	ld	(hl),#0x03
                           2748 ;src/main.c:715: actual->sprite = g_enemy;
   9731 21 04 00      [10] 2749 	ld	hl,#0x0004
   9734 09            [11] 2750 	add	hl,bc
   9735 36 72         [10] 2751 	ld	(hl),#<(_g_enemy)
   9737 23            [ 6] 2752 	inc	hl
   9738 36 78         [10] 2753 	ld	(hl),#>(_g_enemy)
                           2754 ;src/main.c:717: actual->muerto = SI;
   973A 21 08 00      [10] 2755 	ld	hl,#0x0008
   973D 09            [11] 2756 	add	hl,bc
                           2757 ;src/main.c:716: if(i!=4){
   973E 7B            [ 4] 2758 	ld	a,e
   973F D6 04         [ 7] 2759 	sub	a, #0x04
   9741 28 04         [12] 2760 	jr	Z,00102$
                           2761 ;src/main.c:717: actual->muerto = SI;
   9743 36 01         [10] 2762 	ld	(hl),#0x01
   9745 18 02         [12] 2763 	jr	00103$
   9747                    2764 00102$:
                           2765 ;src/main.c:720: actual->muerto = NO;
   9747 36 00         [10] 2766 	ld	(hl),#0x00
   9749                    2767 00103$:
                           2768 ;src/main.c:722: actual->patrol = SI;
   9749 21 09 00      [10] 2769 	ld	hl,#0x0009
   974C 09            [11] 2770 	add	hl,bc
   974D 36 01         [10] 2771 	ld	(hl),#0x01
                           2772 ;src/main.c:723: actual++;
   974F 21 0A 00      [10] 2773 	ld	hl,#0x000A
   9752 09            [11] 2774 	add	hl,bc
   9753 4D            [ 4] 2775 	ld	c,l
   9754 44            [ 4] 2776 	ld	b,h
   9755 18 B3         [12] 2777 	jr	00104$
                           2778 ;src/main.c:727: void inicializarJuego() {
                           2779 ;	---------------------------------
                           2780 ; Function inicializarJuego
                           2781 ; ---------------------------------
   9757                    2782 _inicializarJuego::
                           2783 ;src/main.c:731: actual = enemy;
                           2784 ;src/main.c:734: num_mapa = 0;
   9757 21 30 89      [10] 2785 	ld	hl,#_num_mapa + 0
   975A 36 00         [10] 2786 	ld	(hl), #0x00
                           2787 ;src/main.c:735: mapa = mapas[num_mapa];
   975C 21 47 89      [10] 2788 	ld	hl, #_mapas + 0
   975F 7E            [ 7] 2789 	ld	a,(hl)
   9760 FD 21 2E 89   [14] 2790 	ld	iy,#_mapa
   9764 FD 77 00      [19] 2791 	ld	0 (iy),a
   9767 23            [ 6] 2792 	inc	hl
   9768 7E            [ 7] 2793 	ld	a,(hl)
   9769 32 2F 89      [13] 2794 	ld	(#_mapa + 1),a
                           2795 ;src/main.c:736: cpct_etm_setTileset2x4(g_tileset);
   976C 21 E0 54      [10] 2796 	ld	hl,#_g_tileset
   976F CD D3 7D      [17] 2797 	call	_cpct_etm_setTileset2x4
                           2798 ;src/main.c:737: dibujarMapa();
   9772 CD 31 89      [17] 2799 	call	_dibujarMapa
                           2800 ;src/main.c:738: borrarPantallaAbajo();
   9775 CD D1 95      [17] 2801 	call	_borrarPantallaAbajo
                           2802 ;src/main.c:739: barraPuntuacionInicial();
   9778 CD 0F 95      [17] 2803 	call	_barraPuntuacionInicial
                           2804 ;src/main.c:742: prota.x = prota.px = 4;
   977B 21 1E 89      [10] 2805 	ld	hl,#(_prota + 0x0002)
   977E 36 04         [10] 2806 	ld	(hl),#0x04
   9780 21 1C 89      [10] 2807 	ld	hl,#_prota
   9783 36 04         [10] 2808 	ld	(hl),#0x04
                           2809 ;src/main.c:743: prota.y = prota.py = 80;
   9785 21 1F 89      [10] 2810 	ld	hl,#(_prota + 0x0003)
   9788 36 50         [10] 2811 	ld	(hl),#0x50
   978A 21 1D 89      [10] 2812 	ld	hl,#(_prota + 0x0001)
   978D 36 50         [10] 2813 	ld	(hl),#0x50
                           2814 ;src/main.c:744: prota.mover  = NO;
   978F 21 22 89      [10] 2815 	ld	hl,#(_prota + 0x0006)
   9792 36 00         [10] 2816 	ld	(hl),#0x00
                           2817 ;src/main.c:745: prota.mira=M_derecha;
   9794 21 23 89      [10] 2818 	ld	hl,#(_prota + 0x0007)
   9797 36 00         [10] 2819 	ld	(hl),#0x00
                           2820 ;src/main.c:746: prota.sprite = g_hero;
   9799 21 A8 7A      [10] 2821 	ld	hl,#_g_hero
   979C 22 20 89      [16] 2822 	ld	((_prota + 0x0004)), hl
                           2823 ;src/main.c:750: cu.x = cu.px = 0;
   979F 21 26 89      [10] 2824 	ld	hl,#(_cu + 0x0002)
   97A2 36 00         [10] 2825 	ld	(hl),#0x00
   97A4 21 24 89      [10] 2826 	ld	hl,#_cu
   97A7 36 00         [10] 2827 	ld	(hl),#0x00
                           2828 ;src/main.c:751: cu.y = cu.py = 0;
   97A9 21 27 89      [10] 2829 	ld	hl,#(_cu + 0x0003)
   97AC 36 00         [10] 2830 	ld	(hl),#0x00
   97AE 21 25 89      [10] 2831 	ld	hl,#(_cu + 0x0001)
   97B1 36 00         [10] 2832 	ld	(hl),#0x00
                           2833 ;src/main.c:752: cu.lanzado = NO;
   97B3 21 2A 89      [10] 2834 	ld	hl,#(_cu + 0x0006)
   97B6 36 00         [10] 2835 	ld	(hl),#0x00
                           2836 ;src/main.c:753: cu.mover = NO;
   97B8 21 2D 89      [10] 2837 	ld	hl,#(_cu + 0x0009)
   97BB 36 00         [10] 2838 	ld	(hl),#0x00
                           2839 ;src/main.c:755: inicializarEnemy();
   97BD CD 05 97      [17] 2840 	call	_inicializarEnemy
                           2841 ;src/main.c:757: dibujarProta();
   97C0 CD 4D 89      [17] 2842 	call	_dibujarProta
                           2843 ;src/main.c:758: dibujarEnemigo(actual);
   97C3 21 F4 88      [10] 2844 	ld	hl,#_enemy
   97C6 E5            [11] 2845 	push	hl
   97C7 CD 9E 8B      [17] 2846 	call	_dibujarEnemigo
   97CA F1            [10] 2847 	pop	af
   97CB C9            [10] 2848 	ret
                           2849 ;src/main.c:761: void main(void) {
                           2850 ;	---------------------------------
                           2851 ; Function main
                           2852 ; ---------------------------------
   97CC                    2853 _main::
   97CC DD E5         [15] 2854 	push	ix
   97CE DD 21 00 00   [14] 2855 	ld	ix,#0
   97D2 DD 39         [15] 2856 	add	ix,sp
   97D4 3B            [ 6] 2857 	dec	sp
                           2858 ;src/main.c:765: inicializarCPC();
   97D5 CD E2 96      [17] 2859 	call	_inicializarCPC
                           2860 ;src/main.c:766: menuInicio();
   97D8 CD 06 96      [17] 2861 	call	_menuInicio
                           2862 ;src/main.c:770: inicializarJuego();
   97DB CD 57 97      [17] 2863 	call	_inicializarJuego
                           2864 ;src/main.c:775: cpct_akp_musicPlay();
   97DE CD 3A 7F      [17] 2865 	call	_cpct_akp_musicPlay
                           2866 ;src/main.c:778: actual = enemy;
                           2867 ;src/main.c:780: while (1) {
   97E1                    2868 00115$:
                           2869 ;src/main.c:782: cpct_waitVSYNC();
   97E1 CD 04 7F      [17] 2870 	call	_cpct_waitVSYNC
                           2871 ;src/main.c:783: comprobarTeclado();
   97E4 CD E4 92      [17] 2872 	call	_comprobarTeclado
                           2873 ;src/main.c:784: moverCuchillo();
   97E7 CD 23 94      [17] 2874 	call	_moverCuchillo
                           2875 ;src/main.c:786: moverEnemigo(actual);
   97EA 21 F4 88      [10] 2876 	ld	hl,#_enemy
   97ED E5            [11] 2877 	push	hl
   97EE CD 67 8F      [17] 2878 	call	_moverEnemigo
   97F1 F1            [10] 2879 	pop	af
                           2880 ;src/main.c:788: cpct_waitVSYNC();
   97F2 CD 04 7F      [17] 2881 	call	_cpct_waitVSYNC
                           2882 ;src/main.c:790: if (prota.mover) {
   97F5 01 22 89      [10] 2883 	ld	bc,#_prota+6
   97F8 0A            [ 7] 2884 	ld	a,(bc)
   97F9 B7            [ 4] 2885 	or	a, a
   97FA 28 07         [12] 2886 	jr	Z,00102$
                           2887 ;src/main.c:791: redibujarProta();
   97FC C5            [11] 2888 	push	bc
   97FD CD 0D 8A      [17] 2889 	call	_redibujarProta
   9800 C1            [10] 2890 	pop	bc
                           2891 ;src/main.c:792: prota.mover = NO;
   9801 AF            [ 4] 2892 	xor	a, a
   9802 02            [ 7] 2893 	ld	(bc),a
   9803                    2894 00102$:
                           2895 ;src/main.c:794: if(cu.lanzado && cu.mover){
   9803 21 2A 89      [10] 2896 	ld	hl,#_cu + 6
   9806 4E            [ 7] 2897 	ld	c,(hl)
   9807 11 2D 89      [10] 2898 	ld	de,#_cu + 9
   980A 79            [ 4] 2899 	ld	a,c
   980B B7            [ 4] 2900 	or	a, a
   980C 28 09         [12] 2901 	jr	Z,00107$
   980E 1A            [ 7] 2902 	ld	a,(de)
   980F B7            [ 4] 2903 	or	a, a
   9810 28 05         [12] 2904 	jr	Z,00107$
                           2905 ;src/main.c:795: redibujarCuchillo();
   9812 CD B4 91      [17] 2906 	call	_redibujarCuchillo
   9815 18 0B         [12] 2907 	jr	00108$
   9817                    2908 00107$:
                           2909 ;src/main.c:796: }else if (cu.lanzado && !cu.mover){
   9817 79            [ 4] 2910 	ld	a,c
   9818 B7            [ 4] 2911 	or	a, a
   9819 28 07         [12] 2912 	jr	Z,00108$
   981B 1A            [ 7] 2913 	ld	a,(de)
   981C B7            [ 4] 2914 	or	a, a
   981D 20 03         [12] 2915 	jr	NZ,00108$
                           2916 ;src/main.c:797: borrarCuchillo();
   981F CD 47 91      [17] 2917 	call	_borrarCuchillo
   9822                    2918 00108$:
                           2919 ;src/main.c:800: if(enemy->mover){
   9822 3A FA 88      [13] 2920 	ld	a, (#_enemy + 6)
   9825 B7            [ 4] 2921 	or	a, a
   9826 28 08         [12] 2922 	jr	Z,00111$
                           2923 ;src/main.c:801: redibujarEnemigo(actual);
   9828 21 F4 88      [10] 2924 	ld	hl,#_enemy
   982B E5            [11] 2925 	push	hl
   982C CD DD 8C      [17] 2926 	call	_redibujarEnemigo
   982F F1            [10] 2927 	pop	af
   9830                    2928 00111$:
                           2929 ;src/main.c:803: if (enemy->muerto){
   9830 3A FC 88      [13] 2930 	ld	a,(#_enemy + 8)
   9833 DD 77 FF      [19] 2931 	ld	-1 (ix), a
   9836 B7            [ 4] 2932 	or	a, a
   9837 28 A8         [12] 2933 	jr	Z,00115$
                           2934 ;src/main.c:805: borrarEnemigo(actual);
   9839 21 F4 88      [10] 2935 	ld	hl,#_enemy
   983C E5            [11] 2936 	push	hl
   983D CD 5F 8C      [17] 2937 	call	_borrarEnemigo
   9840 F1            [10] 2938 	pop	af
                           2939 ;src/main.c:807: dibujarExplosion();
   9841 CD D6 8B      [17] 2940 	call	_dibujarExplosion
                           2941 ;src/main.c:808: borrarExplosion();
   9844 CD FC 8B      [17] 2942 	call	_borrarExplosion
   9847 18 98         [12] 2943 	jr	00115$
   9849 33            [ 6] 2944 	inc	sp
   984A DD E1         [14] 2945 	pop	ix
   984C C9            [10] 2946 	ret
                           2947 	.area _CODE
                           2948 	.area _INITIALIZER
                           2949 	.area _CABS (ABS)
   3F00                    2950 	.org 0x3F00
   3F00                    2951 _G_song:
   3F00 41                 2952 	.db #0x41	; 65	'A'
   3F01 54                 2953 	.db #0x54	; 84	'T'
   3F02 31                 2954 	.db #0x31	; 49	'1'
   3F03 30                 2955 	.db #0x30	; 48	'0'
   3F04 01                 2956 	.db #0x01	; 1
   3F05 40                 2957 	.db #0x40	; 64
   3F06 42                 2958 	.db #0x42	; 66	'B'
   3F07 0F                 2959 	.db #0x0F	; 15
   3F08 02                 2960 	.db #0x02	; 2
   3F09 06                 2961 	.db #0x06	; 6
   3F0A 1D                 2962 	.db #0x1D	; 29
   3F0B 00                 2963 	.db #0x00	; 0
   3F0C 10                 2964 	.db #0x10	; 16
   3F0D 40                 2965 	.db #0x40	; 64
   3F0E 19                 2966 	.db #0x19	; 25
   3F0F 40                 2967 	.db #0x40	; 64
   3F10 00                 2968 	.db #0x00	; 0
   3F11 00                 2969 	.db #0x00	; 0
   3F12 00                 2970 	.db #0x00	; 0
   3F13 00                 2971 	.db #0x00	; 0
   3F14 00                 2972 	.db #0x00	; 0
   3F15 00                 2973 	.db #0x00	; 0
   3F16 0D                 2974 	.db #0x0D	; 13
   3F17 12                 2975 	.db #0x12	; 18
   3F18 40                 2976 	.db #0x40	; 64
   3F19 01                 2977 	.db #0x01	; 1
   3F1A 00                 2978 	.db #0x00	; 0
   3F1B 7C                 2979 	.db #0x7C	; 124
   3F1C 18                 2980 	.db #0x18	; 24
   3F1D 78                 2981 	.db #0x78	; 120	'x'
   3F1E 0C                 2982 	.db #0x0C	; 12
   3F1F 34                 2983 	.db #0x34	; 52	'4'
   3F20 30                 2984 	.db #0x30	; 48	'0'
   3F21 2C                 2985 	.db #0x2C	; 44
   3F22 28                 2986 	.db #0x28	; 40
   3F23 24                 2987 	.db #0x24	; 36
   3F24 20                 2988 	.db #0x20	; 32
   3F25 1C                 2989 	.db #0x1C	; 28
   3F26 0D                 2990 	.db #0x0D	; 13
   3F27 25                 2991 	.db #0x25	; 37
   3F28 40                 2992 	.db #0x40	; 64
   3F29 20                 2993 	.db #0x20	; 32
   3F2A 00                 2994 	.db #0x00	; 0
   3F2B 00                 2995 	.db #0x00	; 0
   3F2C 00                 2996 	.db #0x00	; 0
   3F2D 39                 2997 	.db #0x39	; 57	'9'
   3F2E 40                 2998 	.db #0x40	; 64
   3F2F 00                 2999 	.db #0x00	; 0
   3F30 57                 3000 	.db #0x57	; 87	'W'
   3F31 40                 3001 	.db #0x40	; 64
   3F32 3B                 3002 	.db #0x3B	; 59
   3F33 40                 3003 	.db #0x40	; 64
   3F34 57                 3004 	.db #0x57	; 87	'W'
   3F35 40                 3005 	.db #0x40	; 64
   3F36 01                 3006 	.db #0x01	; 1
   3F37 2F                 3007 	.db #0x2F	; 47
   3F38 40                 3008 	.db #0x40	; 64
   3F39 19                 3009 	.db #0x19	; 25
   3F3A 00                 3010 	.db #0x00	; 0
   3F3B 76                 3011 	.db #0x76	; 118	'v'
   3F3C E1                 3012 	.db #0xE1	; 225
   3F3D 00                 3013 	.db #0x00	; 0
   3F3E 00                 3014 	.db #0x00	; 0
   3F3F 01                 3015 	.db #0x01	; 1
   3F40 04                 3016 	.db #0x04	; 4
   3F41 51                 3017 	.db #0x51	; 81	'Q'
   3F42 04                 3018 	.db #0x04	; 4
   3F43 37                 3019 	.db #0x37	; 55	'7'
   3F44 04                 3020 	.db #0x04	; 4
   3F45 4F                 3021 	.db #0x4F	; 79	'O'
   3F46 04                 3022 	.db #0x04	; 4
   3F47 37                 3023 	.db #0x37	; 55	'7'
   3F48 02                 3024 	.db #0x02	; 2
   3F49 4B                 3025 	.db #0x4B	; 75	'K'
   3F4A 02                 3026 	.db #0x02	; 2
   3F4B 37                 3027 	.db #0x37	; 55	'7'
   3F4C 04                 3028 	.db #0x04	; 4
   3F4D 4F                 3029 	.db #0x4F	; 79	'O'
   3F4E 04                 3030 	.db #0x04	; 4
   3F4F 37                 3031 	.db #0x37	; 55	'7'
   3F50 04                 3032 	.db #0x04	; 4
   3F51 4F                 3033 	.db #0x4F	; 79	'O'
   3F52 04                 3034 	.db #0x04	; 4
   3F53 37                 3035 	.db #0x37	; 55	'7'
   3F54 02                 3036 	.db #0x02	; 2
   3F55 4B                 3037 	.db #0x4B	; 75	'K'
   3F56 00                 3038 	.db #0x00	; 0
   3F57 42                 3039 	.db #0x42	; 66	'B'
   3F58 60                 3040 	.db #0x60	; 96
   3F59 00                 3041 	.db #0x00	; 0
   3F5A 42                 3042 	.db #0x42	; 66	'B'
   3F5B 80                 3043 	.db #0x80	; 128
   3F5C 00                 3044 	.db #0x00	; 0
   3F5D 00                 3045 	.db #0x00	; 0
   3F5E 42                 3046 	.db #0x42	; 66	'B'
   3F5F 00                 3047 	.db #0x00	; 0
   3F60 00                 3048 	.db #0x00	; 0
