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
                             11 	.globl _main
                             12 	.globl _inicializarJuego
                             13 	.globl _inicializarCPC
                             14 	.globl _intHandler
                             15 	.globl _moverAbajo
                             16 	.globl _moverArriba
                             17 	.globl _moverDerecha
                             18 	.globl _moverIzquierda
                             19 	.globl _avanzarMapa
                             20 	.globl _inicializarEnemy
                             21 	.globl _moverEnemigo
                             22 	.globl _moverEnemigoIzquierda
                             23 	.globl _moverEnemigoDerecha
                             24 	.globl _moverEnemigoAbajo
                             25 	.globl _moverEnemigoArriba
                             26 	.globl _checkEnemyCollision
                             27 	.globl _redibujarEnemigo
                             28 	.globl _borrarEnemigo
                             29 	.globl _borrarExplosion
                             30 	.globl _dibujarExplosion
                             31 	.globl _dibujarEnemigo
                             32 	.globl _checkCollision
                             33 	.globl _comprobarTeclado
                             34 	.globl _redibujarProta
                             35 	.globl _borrarProta
                             36 	.globl _dibujarProta
                             37 	.globl _dibujarMapa
                             38 	.globl _play
                             39 	.globl _moverCuchillo
                             40 	.globl _lanzarCuchillo
                             41 	.globl _redibujarCuchillo
                             42 	.globl _borrarCuchillo
                             43 	.globl _getTilePtr
                             44 	.globl _aumentarPuntuacion
                             45 	.globl _modificarPuntuacion
                             46 	.globl _barraPuntuacionInicial
                             47 	.globl _menuInicio
                             48 	.globl _menuFin
                             49 	.globl _cpct_etm_setTileset2x4
                             50 	.globl _cpct_etm_drawTileBox2x4
                             51 	.globl _cpct_akp_musicInit
                             52 	.globl _cpct_getScreenPtr
                             53 	.globl _cpct_setPALColour
                             54 	.globl _cpct_setPalette
                             55 	.globl _cpct_waitVSYNC
                             56 	.globl _cpct_setVideoMode
                             57 	.globl _cpct_drawSpriteMaskedAlignedTable
                             58 	.globl _cpct_isAnyKeyPressed
                             59 	.globl _cpct_isKeyPressed
                             60 	.globl _cpct_scanKeyboard_if
                             61 	.globl _cpct_setInterruptHandler
                             62 	.globl _cpct_disableFirmware
                             63 	.globl _vidas
                             64 	.globl _puntuacion
                             65 	.globl _num_mapa
                             66 	.globl _mapa
                             67 	.globl _i
                             68 	.globl _cu
                             69 	.globl _prota
                             70 	.globl _enemy
                             71 	.globl _spawnY
                             72 	.globl _spawnX
                             73 	.globl _mapas
                             74 ;--------------------------------------------------------
                             75 ; special function registers
                             76 ;--------------------------------------------------------
                             77 ;--------------------------------------------------------
                             78 ; ram data
                             79 ;--------------------------------------------------------
                             80 	.area _DATA
   8B14                      81 _enemy::
   8B14                      82 	.ds 52
   8B48                      83 _prota::
   8B48                      84 	.ds 8
   8B50                      85 _cu::
   8B50                      86 	.ds 10
   8B5A                      87 _i::
   8B5A                      88 	.ds 1
                             89 ;--------------------------------------------------------
                             90 ; ram data
                             91 ;--------------------------------------------------------
                             92 	.area _INITIALIZED
   8B5B                      93 _mapa::
   8B5B                      94 	.ds 2
   8B5D                      95 _num_mapa::
   8B5D                      96 	.ds 1
   8B5E                      97 _puntuacion::
   8B5E                      98 	.ds 1
   8B5F                      99 _vidas::
   8B5F                     100 	.ds 1
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
                            121 ;src/main.c:92: cpctm_createTransparentMaskTable(g_tablatrans, 0x2E00, M0, 0); 
                            122 ;	---------------------------------
                            123 ; Function dummy_cpct_transparentMaskTable0M0_container
                            124 ; ---------------------------------
   75E8                     125 _dummy_cpct_transparentMaskTable0M0_container::
                            126 	.area _g_tablatrans_ (ABS) 
   2E00                     127 	.org 0x2E00 
   2E00                     128 	 _g_tablatrans::
   2E00 FF AA 55 00 AA AA   129 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   2E08 55 00 55 00 00 00   130 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E10 AA AA 00 00 AA AA   131 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   2E18 00 00 00 00 00 00   132 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E20 55 00 55 00 00 00   133 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E28 55 00 55 00 00 00   134 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E30 00 00 00 00 00 00   135 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E38 00 00 00 00 00 00   136 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E40 AA AA 00 00 AA AA   137 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   2E48 00 00 00 00 00 00   138 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E50 AA AA 00 00 AA AA   139 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   2E58 00 00 00 00 00 00   140 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E60 00 00 00 00 00 00   141 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E68 00 00 00 00 00 00   142 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E70 00 00 00 00 00 00   143 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E78 00 00 00 00 00 00   144 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E80 55 00 55 00 00 00   145 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E88 55 00 55 00 00 00   146 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E90 00 00 00 00 00 00   147 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2E98 00 00 00 00 00 00   148 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2EA0 55 00 55 00 00 00   149 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2EA8 55 00 55 00 00 00   150 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2EB0 00 00 00 00 00 00   151 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2EB8 00 00 00 00 00 00   152 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2EC0 00 00 00 00 00 00   153 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2EC8 00 00 00 00 00 00   154 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2ED0 00 00 00 00 00 00   155 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2ED8 00 00 00 00 00 00   156 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2EE0 00 00 00 00 00 00   157 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2EE8 00 00 00 00 00 00   158 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2EF0 00 00 00 00 00 00   159 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   2EF8 00 00 00 00 00 00   160 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            161 	.area _CSEG (REL, CON) 
                            162 ;src/main.c:95: void dibujarMapa() {
                            163 ;	---------------------------------
                            164 ; Function dibujarMapa
                            165 ; ---------------------------------
   8B65                     166 _dibujarMapa::
                            167 ;src/main.c:98: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, p, mapa);
   8B65 2A 5B 8B      [16]  168 	ld	hl,(_mapa)
   8B68 E5            [11]  169 	push	hl
   8B69 21 F0 C0      [10]  170 	ld	hl,#0xC0F0
   8B6C E5            [11]  171 	push	hl
   8B6D 21 2C 28      [10]  172 	ld	hl,#0x282C
   8B70 E5            [11]  173 	push	hl
   8B71 2E 00         [ 7]  174 	ld	l, #0x00
   8B73 E5            [11]  175 	push	hl
   8B74 AF            [ 4]  176 	xor	a, a
   8B75 F5            [11]  177 	push	af
   8B76 33            [ 6]  178 	inc	sp
   8B77 CD 73 7F      [17]  179 	call	_cpct_etm_drawTileBox2x4
   8B7A C9            [10]  180 	ret
   8B7B                     181 _mapas:
   8B7B C0 42               182 	.dw _g_map1
   8B7D E0 3B               183 	.dw _g_map2
   8B7F 00 35               184 	.dw _g_map3
   8B81                     185 _spawnX:
   8B81 00                  186 	.db #0x00	; 0
   8B82 28                  187 	.db #0x28	; 40
   8B83 47                  188 	.db #0x47	; 71	'G'
   8B84 14                  189 	.db #0x14	; 20
   8B85 3C                  190 	.db #0x3C	; 60
   8B86                     191 _spawnY:
   8B86 00                  192 	.db #0x00	; 0
   8B87 2C                  193 	.db #0x2C	; 44
   8B88 72                  194 	.db #0x72	; 114	'r'
   8B89 8A                  195 	.db #0x8A	; 138
   8B8A 8A                  196 	.db #0x8A	; 138
                            197 ;src/main.c:101: void dibujarProta() {
                            198 ;	---------------------------------
                            199 ; Function dibujarProta
                            200 ; ---------------------------------
   8B8B                     201 _dibujarProta::
                            202 ;src/main.c:102: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   8B8B 21 49 8B      [10]  203 	ld	hl, #_prota + 1
   8B8E 56            [ 7]  204 	ld	d,(hl)
   8B8F 21 48 8B      [10]  205 	ld	hl, #_prota + 0
   8B92 46            [ 7]  206 	ld	b,(hl)
   8B93 D5            [11]  207 	push	de
   8B94 33            [ 6]  208 	inc	sp
   8B95 C5            [11]  209 	push	bc
   8B96 33            [ 6]  210 	inc	sp
   8B97 21 00 C0      [10]  211 	ld	hl,#0xC000
   8B9A E5            [11]  212 	push	hl
   8B9B CD 91 8A      [17]  213 	call	_cpct_getScreenPtr
   8B9E EB            [ 4]  214 	ex	de,hl
                            215 ;src/main.c:103: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   8B9F ED 4B 4C 8B   [20]  216 	ld	bc, (#_prota + 4)
   8BA3 21 00 2E      [10]  217 	ld	hl,#_g_tablatrans
   8BA6 E5            [11]  218 	push	hl
   8BA7 21 07 16      [10]  219 	ld	hl,#0x1607
   8BAA E5            [11]  220 	push	hl
   8BAB D5            [11]  221 	push	de
   8BAC C5            [11]  222 	push	bc
   8BAD CD B1 8A      [17]  223 	call	_cpct_drawSpriteMaskedAlignedTable
   8BB0 C9            [10]  224 	ret
                            225 ;src/main.c:106: void borrarProta() {
                            226 ;	---------------------------------
                            227 ; Function borrarProta
                            228 ; ---------------------------------
   8BB1                     229 _borrarProta::
   8BB1 DD E5         [15]  230 	push	ix
   8BB3 DD 21 00 00   [14]  231 	ld	ix,#0
   8BB7 DD 39         [15]  232 	add	ix,sp
   8BB9 F5            [11]  233 	push	af
   8BBA 3B            [ 6]  234 	dec	sp
                            235 ;src/main.c:110: u8 w = 4 + (prota.px & 1);
   8BBB 21 4A 8B      [10]  236 	ld	hl, #_prota + 2
   8BBE 4E            [ 7]  237 	ld	c,(hl)
   8BBF 79            [ 4]  238 	ld	a,c
   8BC0 E6 01         [ 7]  239 	and	a, #0x01
   8BC2 47            [ 4]  240 	ld	b,a
   8BC3 04            [ 4]  241 	inc	b
   8BC4 04            [ 4]  242 	inc	b
   8BC5 04            [ 4]  243 	inc	b
   8BC6 04            [ 4]  244 	inc	b
                            245 ;src/main.c:113: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   8BC7 21 4B 8B      [10]  246 	ld	hl, #_prota + 3
   8BCA 5E            [ 7]  247 	ld	e,(hl)
   8BCB CB 4B         [ 8]  248 	bit	1, e
   8BCD 28 04         [12]  249 	jr	Z,00103$
   8BCF 3E 01         [ 7]  250 	ld	a,#0x01
   8BD1 18 02         [12]  251 	jr	00104$
   8BD3                     252 00103$:
   8BD3 3E 00         [ 7]  253 	ld	a,#0x00
   8BD5                     254 00104$:
   8BD5 C6 06         [ 7]  255 	add	a, #0x06
   8BD7 DD 77 FD      [19]  256 	ld	-3 (ix),a
                            257 ;src/main.c:115: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   8BDA FD 2A 5B 8B   [20]  258 	ld	iy,(_mapa)
   8BDE 16 00         [ 7]  259 	ld	d,#0x00
   8BE0 7B            [ 4]  260 	ld	a,e
   8BE1 C6 E8         [ 7]  261 	add	a,#0xE8
   8BE3 DD 77 FE      [19]  262 	ld	-2 (ix),a
   8BE6 7A            [ 4]  263 	ld	a,d
   8BE7 CE FF         [ 7]  264 	adc	a,#0xFF
   8BE9 DD 77 FF      [19]  265 	ld	-1 (ix),a
   8BEC DD 6E FE      [19]  266 	ld	l,-2 (ix)
   8BEF DD 66 FF      [19]  267 	ld	h,-1 (ix)
   8BF2 DD CB FF 7E   [20]  268 	bit	7, -1 (ix)
   8BF6 28 04         [12]  269 	jr	Z,00105$
   8BF8 21 EB FF      [10]  270 	ld	hl,#0xFFEB
   8BFB 19            [11]  271 	add	hl,de
   8BFC                     272 00105$:
   8BFC CB 2C         [ 8]  273 	sra	h
   8BFE CB 1D         [ 8]  274 	rr	l
   8C00 CB 2C         [ 8]  275 	sra	h
   8C02 CB 1D         [ 8]  276 	rr	l
   8C04 55            [ 4]  277 	ld	d,l
   8C05 CB 39         [ 8]  278 	srl	c
   8C07 FD E5         [15]  279 	push	iy
   8C09 21 F0 C0      [10]  280 	ld	hl,#0xC0F0
   8C0C E5            [11]  281 	push	hl
   8C0D 3E 28         [ 7]  282 	ld	a,#0x28
   8C0F F5            [11]  283 	push	af
   8C10 33            [ 6]  284 	inc	sp
   8C11 DD 7E FD      [19]  285 	ld	a,-3 (ix)
   8C14 F5            [11]  286 	push	af
   8C15 33            [ 6]  287 	inc	sp
   8C16 C5            [11]  288 	push	bc
   8C17 33            [ 6]  289 	inc	sp
   8C18 D5            [11]  290 	push	de
   8C19 33            [ 6]  291 	inc	sp
   8C1A 79            [ 4]  292 	ld	a,c
   8C1B F5            [11]  293 	push	af
   8C1C 33            [ 6]  294 	inc	sp
   8C1D CD 73 7F      [17]  295 	call	_cpct_etm_drawTileBox2x4
   8C20 DD F9         [10]  296 	ld	sp, ix
   8C22 DD E1         [14]  297 	pop	ix
   8C24 C9            [10]  298 	ret
                            299 ;src/main.c:118: void redibujarProta() {
                            300 ;	---------------------------------
                            301 ; Function redibujarProta
                            302 ; ---------------------------------
   8C25                     303 _redibujarProta::
                            304 ;src/main.c:119: borrarProta();
   8C25 CD B1 8B      [17]  305 	call	_borrarProta
                            306 ;src/main.c:120: prota.px = prota.x;
   8C28 01 4A 8B      [10]  307 	ld	bc,#_prota + 2
   8C2B 3A 48 8B      [13]  308 	ld	a, (#_prota + 0)
   8C2E 02            [ 7]  309 	ld	(bc),a
                            310 ;src/main.c:121: prota.py = prota.y;
   8C2F 01 4B 8B      [10]  311 	ld	bc,#_prota + 3
   8C32 3A 49 8B      [13]  312 	ld	a, (#_prota + 1)
   8C35 02            [ 7]  313 	ld	(bc),a
                            314 ;src/main.c:122: dibujarProta();
   8C36 C3 8B 8B      [10]  315 	jp  _dibujarProta
                            316 ;src/main.c:125: void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
                            317 ;	---------------------------------
                            318 ; Function comprobarTeclado
                            319 ; ---------------------------------
   8C39                     320 _comprobarTeclado::
                            321 ;src/main.c:126: cpct_scanKeyboard_if();
   8C39 CD CB 80      [17]  322 	call	_cpct_scanKeyboard_if
                            323 ;src/main.c:128: if (cpct_isAnyKeyPressed()) {
   8C3C CD BE 80      [17]  324 	call	_cpct_isAnyKeyPressed
   8C3F 7D            [ 4]  325 	ld	a,l
   8C40 B7            [ 4]  326 	or	a, a
   8C41 C8            [11]  327 	ret	Z
                            328 ;src/main.c:129: if (cpct_isKeyPressed(Key_CursorLeft))
   8C42 21 01 01      [10]  329 	ld	hl,#0x0101
   8C45 CD 92 7E      [17]  330 	call	_cpct_isKeyPressed
   8C48 7D            [ 4]  331 	ld	a,l
   8C49 B7            [ 4]  332 	or	a, a
                            333 ;src/main.c:130: moverIzquierda();
   8C4A C2 2B 95      [10]  334 	jp	NZ,_moverIzquierda
                            335 ;src/main.c:131: else if (cpct_isKeyPressed(Key_CursorRight))
   8C4D 21 00 02      [10]  336 	ld	hl,#0x0200
   8C50 CD 92 7E      [17]  337 	call	_cpct_isKeyPressed
   8C53 7D            [ 4]  338 	ld	a,l
   8C54 B7            [ 4]  339 	or	a, a
                            340 ;src/main.c:132: moverDerecha();
   8C55 C2 50 95      [10]  341 	jp	NZ,_moverDerecha
                            342 ;src/main.c:133: else if (cpct_isKeyPressed(Key_CursorUp))
   8C58 21 00 01      [10]  343 	ld	hl,#0x0100
   8C5B CD 92 7E      [17]  344 	call	_cpct_isKeyPressed
   8C5E 7D            [ 4]  345 	ld	a,l
   8C5F B7            [ 4]  346 	or	a, a
                            347 ;src/main.c:134: moverArriba();
   8C60 C2 95 95      [10]  348 	jp	NZ,_moverArriba
                            349 ;src/main.c:135: else if (cpct_isKeyPressed(Key_CursorDown))
   8C63 21 00 04      [10]  350 	ld	hl,#0x0400
   8C66 CD 92 7E      [17]  351 	call	_cpct_isKeyPressed
   8C69 7D            [ 4]  352 	ld	a,l
   8C6A B7            [ 4]  353 	or	a, a
                            354 ;src/main.c:136: moverAbajo();
   8C6B C2 B9 95      [10]  355 	jp	NZ,_moverAbajo
                            356 ;src/main.c:137: else if (cpct_isKeyPressed(Key_Space))
   8C6E 21 05 80      [10]  357 	ld	hl,#0x8005
   8C71 CD 92 7E      [17]  358 	call	_cpct_isKeyPressed
   8C74 7D            [ 4]  359 	ld	a,l
   8C75 B7            [ 4]  360 	or	a, a
   8C76 C8            [11]  361 	ret	Z
                            362 ;src/main.c:138: lanzarCuchillo(cu, prota, mapa, g_tablatrans);
   8C77 21 08 00      [10]  363 	ld	hl, #8
   8C7A 39            [11]  364 	add	hl, sp
   8C7B 4E            [ 7]  365 	ld	c, (hl)
   8C7C 23            [ 6]  366 	inc	hl
   8C7D 46            [ 7]  367 	ld	b, (hl)
   8C7E C5            [11]  368 	push	bc
   8C7F 21 08 00      [10]  369 	ld	hl, #8
   8C82 39            [11]  370 	add	hl, sp
   8C83 4E            [ 7]  371 	ld	c, (hl)
   8C84 23            [ 6]  372 	inc	hl
   8C85 46            [ 7]  373 	ld	b, (hl)
   8C86 C5            [11]  374 	push	bc
   8C87 21 08 00      [10]  375 	ld	hl, #8
   8C8A 39            [11]  376 	add	hl, sp
   8C8B 4E            [ 7]  377 	ld	c, (hl)
   8C8C 23            [ 6]  378 	inc	hl
   8C8D 46            [ 7]  379 	ld	b, (hl)
   8C8E C5            [11]  380 	push	bc
   8C8F 21 08 00      [10]  381 	ld	hl, #8
   8C92 39            [11]  382 	add	hl, sp
   8C93 4E            [ 7]  383 	ld	c, (hl)
   8C94 23            [ 6]  384 	inc	hl
   8C95 46            [ 7]  385 	ld	b, (hl)
   8C96 C5            [11]  386 	push	bc
   8C97 CD 77 72      [17]  387 	call	_lanzarCuchillo
   8C9A 21 08 00      [10]  388 	ld	hl,#8
   8C9D 39            [11]  389 	add	hl,sp
   8C9E F9            [ 6]  390 	ld	sp,hl
   8C9F C9            [10]  391 	ret
                            392 ;src/main.c:142: u8 checkCollision(u8 direction) { // check optimization
                            393 ;	---------------------------------
                            394 ; Function checkCollision
                            395 ; ---------------------------------
   8CA0                     396 _checkCollision::
   8CA0 DD E5         [15]  397 	push	ix
   8CA2 DD 21 00 00   [14]  398 	ld	ix,#0
   8CA6 DD 39         [15]  399 	add	ix,sp
   8CA8 F5            [11]  400 	push	af
                            401 ;src/main.c:143: u8 *headTile=0, *feetTile=0, *waistTile=0;
   8CA9 21 00 00      [10]  402 	ld	hl,#0x0000
   8CAC E3            [19]  403 	ex	(sp), hl
   8CAD 11 00 00      [10]  404 	ld	de,#0x0000
   8CB0 01 00 00      [10]  405 	ld	bc,#0x0000
                            406 ;src/main.c:145: switch (direction) {
   8CB3 3E 03         [ 7]  407 	ld	a,#0x03
   8CB5 DD 96 04      [19]  408 	sub	a, 4 (ix)
   8CB8 DA F4 8D      [10]  409 	jp	C,00105$
   8CBB DD 5E 04      [19]  410 	ld	e,4 (ix)
   8CBE 16 00         [ 7]  411 	ld	d,#0x00
   8CC0 21 C7 8C      [10]  412 	ld	hl,#00124$
   8CC3 19            [11]  413 	add	hl,de
   8CC4 19            [11]  414 	add	hl,de
   8CC5 19            [11]  415 	add	hl,de
   8CC6 E9            [ 4]  416 	jp	(hl)
   8CC7                     417 00124$:
   8CC7 C3 D3 8C      [10]  418 	jp	00101$
   8CCA C3 2C 8D      [10]  419 	jp	00102$
   8CCD C3 7C 8D      [10]  420 	jp	00103$
   8CD0 C3 B9 8D      [10]  421 	jp	00104$
                            422 ;src/main.c:146: case 0:
   8CD3                     423 00101$:
                            424 ;src/main.c:147: headTile  = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y);
   8CD3 21 49 8B      [10]  425 	ld	hl, #(_prota + 0x0001) + 0
   8CD6 4E            [ 7]  426 	ld	c,(hl)
   8CD7 3A 48 8B      [13]  427 	ld	a, (#_prota + 0)
   8CDA 47            [ 4]  428 	ld	b,a
   8CDB 04            [ 4]  429 	inc	b
   8CDC 04            [ 4]  430 	inc	b
   8CDD 04            [ 4]  431 	inc	b
   8CDE 04            [ 4]  432 	inc	b
   8CDF 79            [ 4]  433 	ld	a,c
   8CE0 F5            [11]  434 	push	af
   8CE1 33            [ 6]  435 	inc	sp
   8CE2 C5            [11]  436 	push	bc
   8CE3 33            [ 6]  437 	inc	sp
   8CE4 2A 5B 8B      [16]  438 	ld	hl,(_mapa)
   8CE7 E5            [11]  439 	push	hl
   8CE8 CD E8 75      [17]  440 	call	_getTilePtr
   8CEB F1            [10]  441 	pop	af
   8CEC F1            [10]  442 	pop	af
   8CED 33            [ 6]  443 	inc	sp
   8CEE 33            [ 6]  444 	inc	sp
   8CEF E5            [11]  445 	push	hl
                            446 ;src/main.c:148: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   8CF0 3A 49 8B      [13]  447 	ld	a, (#(_prota + 0x0001) + 0)
   8CF3 C6 14         [ 7]  448 	add	a, #0x14
   8CF5 4F            [ 4]  449 	ld	c,a
   8CF6 21 48 8B      [10]  450 	ld	hl, #_prota + 0
   8CF9 46            [ 7]  451 	ld	b,(hl)
   8CFA 04            [ 4]  452 	inc	b
   8CFB 04            [ 4]  453 	inc	b
   8CFC 04            [ 4]  454 	inc	b
   8CFD 04            [ 4]  455 	inc	b
   8CFE 79            [ 4]  456 	ld	a,c
   8CFF F5            [11]  457 	push	af
   8D00 33            [ 6]  458 	inc	sp
   8D01 C5            [11]  459 	push	bc
   8D02 33            [ 6]  460 	inc	sp
   8D03 2A 5B 8B      [16]  461 	ld	hl,(_mapa)
   8D06 E5            [11]  462 	push	hl
   8D07 CD E8 75      [17]  463 	call	_getTilePtr
   8D0A F1            [10]  464 	pop	af
   8D0B F1            [10]  465 	pop	af
   8D0C EB            [ 4]  466 	ex	de,hl
                            467 ;src/main.c:149: waistTile = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   8D0D 3A 49 8B      [13]  468 	ld	a, (#(_prota + 0x0001) + 0)
   8D10 C6 0B         [ 7]  469 	add	a, #0x0B
   8D12 47            [ 4]  470 	ld	b,a
   8D13 3A 48 8B      [13]  471 	ld	a, (#_prota + 0)
   8D16 C6 04         [ 7]  472 	add	a, #0x04
   8D18 D5            [11]  473 	push	de
   8D19 C5            [11]  474 	push	bc
   8D1A 33            [ 6]  475 	inc	sp
   8D1B F5            [11]  476 	push	af
   8D1C 33            [ 6]  477 	inc	sp
   8D1D 2A 5B 8B      [16]  478 	ld	hl,(_mapa)
   8D20 E5            [11]  479 	push	hl
   8D21 CD E8 75      [17]  480 	call	_getTilePtr
   8D24 F1            [10]  481 	pop	af
   8D25 F1            [10]  482 	pop	af
   8D26 4D            [ 4]  483 	ld	c,l
   8D27 44            [ 4]  484 	ld	b,h
   8D28 D1            [10]  485 	pop	de
                            486 ;src/main.c:150: break;
   8D29 C3 F4 8D      [10]  487 	jp	00105$
                            488 ;src/main.c:151: case 1:
   8D2C                     489 00102$:
                            490 ;src/main.c:152: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
   8D2C 21 49 8B      [10]  491 	ld	hl, #(_prota + 0x0001) + 0
   8D2F 56            [ 7]  492 	ld	d,(hl)
   8D30 21 48 8B      [10]  493 	ld	hl, #_prota + 0
   8D33 46            [ 7]  494 	ld	b,(hl)
   8D34 05            [ 4]  495 	dec	b
   8D35 D5            [11]  496 	push	de
   8D36 33            [ 6]  497 	inc	sp
   8D37 C5            [11]  498 	push	bc
   8D38 33            [ 6]  499 	inc	sp
   8D39 2A 5B 8B      [16]  500 	ld	hl,(_mapa)
   8D3C E5            [11]  501 	push	hl
   8D3D CD E8 75      [17]  502 	call	_getTilePtr
   8D40 F1            [10]  503 	pop	af
   8D41 F1            [10]  504 	pop	af
   8D42 33            [ 6]  505 	inc	sp
   8D43 33            [ 6]  506 	inc	sp
   8D44 E5            [11]  507 	push	hl
                            508 ;src/main.c:153: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
   8D45 3A 49 8B      [13]  509 	ld	a, (#(_prota + 0x0001) + 0)
   8D48 C6 14         [ 7]  510 	add	a, #0x14
   8D4A 57            [ 4]  511 	ld	d,a
   8D4B 21 48 8B      [10]  512 	ld	hl, #_prota + 0
   8D4E 46            [ 7]  513 	ld	b,(hl)
   8D4F 05            [ 4]  514 	dec	b
   8D50 D5            [11]  515 	push	de
   8D51 33            [ 6]  516 	inc	sp
   8D52 C5            [11]  517 	push	bc
   8D53 33            [ 6]  518 	inc	sp
   8D54 2A 5B 8B      [16]  519 	ld	hl,(_mapa)
   8D57 E5            [11]  520 	push	hl
   8D58 CD E8 75      [17]  521 	call	_getTilePtr
   8D5B F1            [10]  522 	pop	af
   8D5C F1            [10]  523 	pop	af
   8D5D EB            [ 4]  524 	ex	de,hl
                            525 ;src/main.c:154: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
   8D5E 3A 49 8B      [13]  526 	ld	a, (#(_prota + 0x0001) + 0)
   8D61 C6 0B         [ 7]  527 	add	a, #0x0B
   8D63 47            [ 4]  528 	ld	b,a
   8D64 3A 48 8B      [13]  529 	ld	a, (#_prota + 0)
   8D67 C6 FF         [ 7]  530 	add	a,#0xFF
   8D69 D5            [11]  531 	push	de
   8D6A C5            [11]  532 	push	bc
   8D6B 33            [ 6]  533 	inc	sp
   8D6C F5            [11]  534 	push	af
   8D6D 33            [ 6]  535 	inc	sp
   8D6E 2A 5B 8B      [16]  536 	ld	hl,(_mapa)
   8D71 E5            [11]  537 	push	hl
   8D72 CD E8 75      [17]  538 	call	_getTilePtr
   8D75 F1            [10]  539 	pop	af
   8D76 F1            [10]  540 	pop	af
   8D77 4D            [ 4]  541 	ld	c,l
   8D78 44            [ 4]  542 	ld	b,h
   8D79 D1            [10]  543 	pop	de
                            544 ;src/main.c:155: break;
   8D7A 18 78         [12]  545 	jr	00105$
                            546 ;src/main.c:156: case 2:
   8D7C                     547 00103$:
                            548 ;src/main.c:157: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
   8D7C 3A 49 8B      [13]  549 	ld	a, (#(_prota + 0x0001) + 0)
   8D7F C6 FE         [ 7]  550 	add	a,#0xFE
   8D81 21 48 8B      [10]  551 	ld	hl, #_prota + 0
   8D84 56            [ 7]  552 	ld	d,(hl)
   8D85 C5            [11]  553 	push	bc
   8D86 F5            [11]  554 	push	af
   8D87 33            [ 6]  555 	inc	sp
   8D88 D5            [11]  556 	push	de
   8D89 33            [ 6]  557 	inc	sp
   8D8A 2A 5B 8B      [16]  558 	ld	hl,(_mapa)
   8D8D E5            [11]  559 	push	hl
   8D8E CD E8 75      [17]  560 	call	_getTilePtr
   8D91 F1            [10]  561 	pop	af
   8D92 F1            [10]  562 	pop	af
   8D93 C1            [10]  563 	pop	bc
   8D94 33            [ 6]  564 	inc	sp
   8D95 33            [ 6]  565 	inc	sp
   8D96 E5            [11]  566 	push	hl
                            567 ;src/main.c:158: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
   8D97 21 49 8B      [10]  568 	ld	hl, #(_prota + 0x0001) + 0
   8D9A 56            [ 7]  569 	ld	d,(hl)
   8D9B 15            [ 4]  570 	dec	d
   8D9C 15            [ 4]  571 	dec	d
   8D9D 3A 48 8B      [13]  572 	ld	a, (#_prota + 0)
   8DA0 C6 03         [ 7]  573 	add	a, #0x03
   8DA2 C5            [11]  574 	push	bc
   8DA3 D5            [11]  575 	push	de
   8DA4 33            [ 6]  576 	inc	sp
   8DA5 F5            [11]  577 	push	af
   8DA6 33            [ 6]  578 	inc	sp
   8DA7 2A 5B 8B      [16]  579 	ld	hl,(_mapa)
   8DAA E5            [11]  580 	push	hl
   8DAB CD E8 75      [17]  581 	call	_getTilePtr
   8DAE F1            [10]  582 	pop	af
   8DAF F1            [10]  583 	pop	af
   8DB0 EB            [ 4]  584 	ex	de,hl
   8DB1 C1            [10]  585 	pop	bc
                            586 ;src/main.c:159: *waistTile = 0;
   8DB2 21 00 00      [10]  587 	ld	hl,#0x0000
   8DB5 36 00         [10]  588 	ld	(hl),#0x00
                            589 ;src/main.c:160: break;
   8DB7 18 3B         [12]  590 	jr	00105$
                            591 ;src/main.c:161: case 3:
   8DB9                     592 00104$:
                            593 ;src/main.c:162: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
   8DB9 3A 49 8B      [13]  594 	ld	a, (#(_prota + 0x0001) + 0)
   8DBC C6 16         [ 7]  595 	add	a, #0x16
   8DBE 21 48 8B      [10]  596 	ld	hl, #_prota + 0
   8DC1 56            [ 7]  597 	ld	d,(hl)
   8DC2 C5            [11]  598 	push	bc
   8DC3 F5            [11]  599 	push	af
   8DC4 33            [ 6]  600 	inc	sp
   8DC5 D5            [11]  601 	push	de
   8DC6 33            [ 6]  602 	inc	sp
   8DC7 2A 5B 8B      [16]  603 	ld	hl,(_mapa)
   8DCA E5            [11]  604 	push	hl
   8DCB CD E8 75      [17]  605 	call	_getTilePtr
   8DCE F1            [10]  606 	pop	af
   8DCF F1            [10]  607 	pop	af
   8DD0 C1            [10]  608 	pop	bc
   8DD1 33            [ 6]  609 	inc	sp
   8DD2 33            [ 6]  610 	inc	sp
   8DD3 E5            [11]  611 	push	hl
                            612 ;src/main.c:163: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   8DD4 3A 49 8B      [13]  613 	ld	a, (#(_prota + 0x0001) + 0)
   8DD7 C6 16         [ 7]  614 	add	a, #0x16
   8DD9 57            [ 4]  615 	ld	d,a
   8DDA 3A 48 8B      [13]  616 	ld	a, (#_prota + 0)
   8DDD C6 03         [ 7]  617 	add	a, #0x03
   8DDF C5            [11]  618 	push	bc
   8DE0 D5            [11]  619 	push	de
   8DE1 33            [ 6]  620 	inc	sp
   8DE2 F5            [11]  621 	push	af
   8DE3 33            [ 6]  622 	inc	sp
   8DE4 2A 5B 8B      [16]  623 	ld	hl,(_mapa)
   8DE7 E5            [11]  624 	push	hl
   8DE8 CD E8 75      [17]  625 	call	_getTilePtr
   8DEB F1            [10]  626 	pop	af
   8DEC F1            [10]  627 	pop	af
   8DED EB            [ 4]  628 	ex	de,hl
   8DEE C1            [10]  629 	pop	bc
                            630 ;src/main.c:164: *waistTile = 0;
   8DEF 21 00 00      [10]  631 	ld	hl,#0x0000
   8DF2 36 00         [10]  632 	ld	(hl),#0x00
                            633 ;src/main.c:166: }
   8DF4                     634 00105$:
                            635 ;src/main.c:168: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   8DF4 E1            [10]  636 	pop	hl
   8DF5 E5            [11]  637 	push	hl
   8DF6 6E            [ 7]  638 	ld	l,(hl)
   8DF7 3E 02         [ 7]  639 	ld	a,#0x02
   8DF9 95            [ 4]  640 	sub	a, l
   8DFA 38 0E         [12]  641 	jr	C,00106$
   8DFC 1A            [ 7]  642 	ld	a,(de)
   8DFD 5F            [ 4]  643 	ld	e,a
   8DFE 3E 02         [ 7]  644 	ld	a,#0x02
   8E00 93            [ 4]  645 	sub	a, e
   8E01 38 07         [12]  646 	jr	C,00106$
   8E03 0A            [ 7]  647 	ld	a,(bc)
   8E04 4F            [ 4]  648 	ld	c,a
   8E05 3E 02         [ 7]  649 	ld	a,#0x02
   8E07 91            [ 4]  650 	sub	a, c
   8E08 30 04         [12]  651 	jr	NC,00107$
   8E0A                     652 00106$:
                            653 ;src/main.c:169: return 1;
   8E0A 2E 01         [ 7]  654 	ld	l,#0x01
   8E0C 18 02         [12]  655 	jr	00110$
   8E0E                     656 00107$:
                            657 ;src/main.c:171: return 0;
   8E0E 2E 00         [ 7]  658 	ld	l,#0x00
   8E10                     659 00110$:
   8E10 DD F9         [10]  660 	ld	sp, ix
   8E12 DD E1         [14]  661 	pop	ix
   8E14 C9            [10]  662 	ret
                            663 ;src/main.c:174: void dibujarEnemigo(TEnemy *enemy) {
                            664 ;	---------------------------------
                            665 ; Function dibujarEnemigo
                            666 ; ---------------------------------
   8E15                     667 _dibujarEnemigo::
   8E15 DD E5         [15]  668 	push	ix
   8E17 DD 21 00 00   [14]  669 	ld	ix,#0
   8E1B DD 39         [15]  670 	add	ix,sp
                            671 ;src/main.c:175: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   8E1D DD 4E 04      [19]  672 	ld	c,4 (ix)
   8E20 DD 46 05      [19]  673 	ld	b,5 (ix)
   8E23 69            [ 4]  674 	ld	l, c
   8E24 60            [ 4]  675 	ld	h, b
   8E25 23            [ 6]  676 	inc	hl
   8E26 56            [ 7]  677 	ld	d,(hl)
   8E27 0A            [ 7]  678 	ld	a,(bc)
   8E28 C5            [11]  679 	push	bc
   8E29 D5            [11]  680 	push	de
   8E2A 33            [ 6]  681 	inc	sp
   8E2B F5            [11]  682 	push	af
   8E2C 33            [ 6]  683 	inc	sp
   8E2D 21 00 C0      [10]  684 	ld	hl,#0xC000
   8E30 E5            [11]  685 	push	hl
   8E31 CD 91 8A      [17]  686 	call	_cpct_getScreenPtr
   8E34 EB            [ 4]  687 	ex	de,hl
                            688 ;src/main.c:176: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   8E35 E1            [10]  689 	pop	hl
   8E36 01 04 00      [10]  690 	ld	bc, #0x0004
   8E39 09            [11]  691 	add	hl, bc
   8E3A 4E            [ 7]  692 	ld	c,(hl)
   8E3B 23            [ 6]  693 	inc	hl
   8E3C 46            [ 7]  694 	ld	b,(hl)
   8E3D 21 00 2E      [10]  695 	ld	hl,#_g_tablatrans
   8E40 E5            [11]  696 	push	hl
   8E41 21 04 16      [10]  697 	ld	hl,#0x1604
   8E44 E5            [11]  698 	push	hl
   8E45 D5            [11]  699 	push	de
   8E46 C5            [11]  700 	push	bc
   8E47 CD B1 8A      [17]  701 	call	_cpct_drawSpriteMaskedAlignedTable
   8E4A DD E1         [14]  702 	pop	ix
   8E4C C9            [10]  703 	ret
                            704 ;src/main.c:179: void dibujarExplosion(TEnemy *enemy) {
                            705 ;	---------------------------------
                            706 ; Function dibujarExplosion
                            707 ; ---------------------------------
   8E4D                     708 _dibujarExplosion::
   8E4D DD E5         [15]  709 	push	ix
   8E4F DD 21 00 00   [14]  710 	ld	ix,#0
   8E53 DD 39         [15]  711 	add	ix,sp
                            712 ;src/main.c:180: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   8E55 DD 4E 04      [19]  713 	ld	c,4 (ix)
   8E58 DD 46 05      [19]  714 	ld	b,5 (ix)
   8E5B 69            [ 4]  715 	ld	l, c
   8E5C 60            [ 4]  716 	ld	h, b
   8E5D 23            [ 6]  717 	inc	hl
   8E5E 56            [ 7]  718 	ld	d,(hl)
   8E5F 0A            [ 7]  719 	ld	a,(bc)
   8E60 47            [ 4]  720 	ld	b,a
   8E61 D5            [11]  721 	push	de
   8E62 33            [ 6]  722 	inc	sp
   8E63 C5            [11]  723 	push	bc
   8E64 33            [ 6]  724 	inc	sp
   8E65 21 00 C0      [10]  725 	ld	hl,#0xC000
   8E68 E5            [11]  726 	push	hl
   8E69 CD 91 8A      [17]  727 	call	_cpct_getScreenPtr
   8E6C 4D            [ 4]  728 	ld	c,l
   8E6D 44            [ 4]  729 	ld	b,h
                            730 ;src/main.c:181: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   8E6E 11 00 2E      [10]  731 	ld	de,#_g_tablatrans+0
   8E71 D5            [11]  732 	push	de
   8E72 21 04 16      [10]  733 	ld	hl,#0x1604
   8E75 E5            [11]  734 	push	hl
   8E76 C5            [11]  735 	push	bc
   8E77 21 70 4B      [10]  736 	ld	hl,#_g_explosion
   8E7A E5            [11]  737 	push	hl
   8E7B CD B1 8A      [17]  738 	call	_cpct_drawSpriteMaskedAlignedTable
   8E7E DD E1         [14]  739 	pop	ix
   8E80 C9            [10]  740 	ret
                            741 ;src/main.c:184: void borrarExplosion() {
                            742 ;	---------------------------------
                            743 ; Function borrarExplosion
                            744 ; ---------------------------------
   8E81                     745 _borrarExplosion::
   8E81 DD E5         [15]  746 	push	ix
   8E83 DD 21 00 00   [14]  747 	ld	ix,#0
   8E87 DD 39         [15]  748 	add	ix,sp
   8E89 F5            [11]  749 	push	af
   8E8A 3B            [ 6]  750 	dec	sp
                            751 ;src/main.c:187: u8 w = 4 + (enemy->px & 1);
   8E8B 21 16 8B      [10]  752 	ld	hl, #_enemy + 2
   8E8E 4E            [ 7]  753 	ld	c,(hl)
   8E8F 79            [ 4]  754 	ld	a,c
   8E90 E6 01         [ 7]  755 	and	a, #0x01
   8E92 47            [ 4]  756 	ld	b,a
   8E93 04            [ 4]  757 	inc	b
   8E94 04            [ 4]  758 	inc	b
   8E95 04            [ 4]  759 	inc	b
   8E96 04            [ 4]  760 	inc	b
                            761 ;src/main.c:190: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   8E97 21 17 8B      [10]  762 	ld	hl, #_enemy + 3
   8E9A 5E            [ 7]  763 	ld	e,(hl)
   8E9B CB 4B         [ 8]  764 	bit	1, e
   8E9D 28 04         [12]  765 	jr	Z,00103$
   8E9F 3E 01         [ 7]  766 	ld	a,#0x01
   8EA1 18 02         [12]  767 	jr	00104$
   8EA3                     768 00103$:
   8EA3 3E 00         [ 7]  769 	ld	a,#0x00
   8EA5                     770 00104$:
   8EA5 C6 07         [ 7]  771 	add	a, #0x07
   8EA7 DD 77 FD      [19]  772 	ld	-3 (ix),a
                            773 ;src/main.c:192: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   8EAA FD 2A 5B 8B   [20]  774 	ld	iy,(_mapa)
   8EAE 16 00         [ 7]  775 	ld	d,#0x00
   8EB0 7B            [ 4]  776 	ld	a,e
   8EB1 C6 E8         [ 7]  777 	add	a,#0xE8
   8EB3 DD 77 FE      [19]  778 	ld	-2 (ix),a
   8EB6 7A            [ 4]  779 	ld	a,d
   8EB7 CE FF         [ 7]  780 	adc	a,#0xFF
   8EB9 DD 77 FF      [19]  781 	ld	-1 (ix),a
   8EBC DD 6E FE      [19]  782 	ld	l,-2 (ix)
   8EBF DD 66 FF      [19]  783 	ld	h,-1 (ix)
   8EC2 DD CB FF 7E   [20]  784 	bit	7, -1 (ix)
   8EC6 28 04         [12]  785 	jr	Z,00105$
   8EC8 21 EB FF      [10]  786 	ld	hl,#0xFFEB
   8ECB 19            [11]  787 	add	hl,de
   8ECC                     788 00105$:
   8ECC CB 2C         [ 8]  789 	sra	h
   8ECE CB 1D         [ 8]  790 	rr	l
   8ED0 CB 2C         [ 8]  791 	sra	h
   8ED2 CB 1D         [ 8]  792 	rr	l
   8ED4 55            [ 4]  793 	ld	d,l
   8ED5 CB 39         [ 8]  794 	srl	c
   8ED7 FD E5         [15]  795 	push	iy
   8ED9 21 F0 C0      [10]  796 	ld	hl,#0xC0F0
   8EDC E5            [11]  797 	push	hl
   8EDD 3E 28         [ 7]  798 	ld	a,#0x28
   8EDF F5            [11]  799 	push	af
   8EE0 33            [ 6]  800 	inc	sp
   8EE1 DD 7E FD      [19]  801 	ld	a,-3 (ix)
   8EE4 F5            [11]  802 	push	af
   8EE5 33            [ 6]  803 	inc	sp
   8EE6 C5            [11]  804 	push	bc
   8EE7 33            [ 6]  805 	inc	sp
   8EE8 D5            [11]  806 	push	de
   8EE9 33            [ 6]  807 	inc	sp
   8EEA 79            [ 4]  808 	ld	a,c
   8EEB F5            [11]  809 	push	af
   8EEC 33            [ 6]  810 	inc	sp
   8EED CD 73 7F      [17]  811 	call	_cpct_etm_drawTileBox2x4
   8EF0 DD F9         [10]  812 	ld	sp, ix
   8EF2 DD E1         [14]  813 	pop	ix
   8EF4 C9            [10]  814 	ret
                            815 ;src/main.c:196: void borrarEnemigo(TEnemy *enemy) {
                            816 ;	---------------------------------
                            817 ; Function borrarEnemigo
                            818 ; ---------------------------------
   8EF5                     819 _borrarEnemigo::
   8EF5 DD E5         [15]  820 	push	ix
   8EF7 DD 21 00 00   [14]  821 	ld	ix,#0
   8EFB DD 39         [15]  822 	add	ix,sp
   8EFD 21 FA FF      [10]  823 	ld	hl,#-6
   8F00 39            [11]  824 	add	hl,sp
   8F01 F9            [ 6]  825 	ld	sp,hl
                            826 ;src/main.c:200: u8 w = 4 + (enemy->px & 1);
   8F02 DD 4E 04      [19]  827 	ld	c,4 (ix)
   8F05 DD 46 05      [19]  828 	ld	b,5 (ix)
   8F08 69            [ 4]  829 	ld	l, c
   8F09 60            [ 4]  830 	ld	h, b
   8F0A 23            [ 6]  831 	inc	hl
   8F0B 23            [ 6]  832 	inc	hl
   8F0C 5E            [ 7]  833 	ld	e,(hl)
   8F0D 7B            [ 4]  834 	ld	a,e
   8F0E E6 01         [ 7]  835 	and	a, #0x01
   8F10 C6 04         [ 7]  836 	add	a, #0x04
   8F12 DD 77 FB      [19]  837 	ld	-5 (ix),a
                            838 ;src/main.c:203: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   8F15 69            [ 4]  839 	ld	l, c
   8F16 60            [ 4]  840 	ld	h, b
   8F17 23            [ 6]  841 	inc	hl
   8F18 23            [ 6]  842 	inc	hl
   8F19 23            [ 6]  843 	inc	hl
   8F1A 56            [ 7]  844 	ld	d,(hl)
   8F1B CB 4A         [ 8]  845 	bit	1, d
   8F1D 28 04         [12]  846 	jr	Z,00103$
   8F1F 3E 01         [ 7]  847 	ld	a,#0x01
   8F21 18 02         [12]  848 	jr	00104$
   8F23                     849 00103$:
   8F23 3E 00         [ 7]  850 	ld	a,#0x00
   8F25                     851 00104$:
   8F25 C6 07         [ 7]  852 	add	a, #0x07
   8F27 DD 77 FA      [19]  853 	ld	-6 (ix),a
                            854 ;src/main.c:205: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   8F2A FD 2A 5B 8B   [20]  855 	ld	iy,(_mapa)
   8F2E DD 72 FE      [19]  856 	ld	-2 (ix),d
   8F31 DD 36 FF 00   [19]  857 	ld	-1 (ix),#0x00
   8F35 DD 7E FE      [19]  858 	ld	a,-2 (ix)
   8F38 C6 E8         [ 7]  859 	add	a,#0xE8
   8F3A DD 77 FC      [19]  860 	ld	-4 (ix),a
   8F3D DD 7E FF      [19]  861 	ld	a,-1 (ix)
   8F40 CE FF         [ 7]  862 	adc	a,#0xFF
   8F42 DD 77 FD      [19]  863 	ld	-3 (ix),a
   8F45 DD 56 FC      [19]  864 	ld	d,-4 (ix)
   8F48 DD 6E FD      [19]  865 	ld	l,-3 (ix)
   8F4B DD CB FD 7E   [20]  866 	bit	7, -3 (ix)
   8F4F 28 0C         [12]  867 	jr	Z,00105$
   8F51 DD 7E FE      [19]  868 	ld	a,-2 (ix)
   8F54 C6 EB         [ 7]  869 	add	a, #0xEB
   8F56 57            [ 4]  870 	ld	d,a
   8F57 DD 7E FF      [19]  871 	ld	a,-1 (ix)
   8F5A CE FF         [ 7]  872 	adc	a, #0xFF
   8F5C 6F            [ 4]  873 	ld	l,a
   8F5D                     874 00105$:
   8F5D CB 2D         [ 8]  875 	sra	l
   8F5F CB 1A         [ 8]  876 	rr	d
   8F61 CB 2D         [ 8]  877 	sra	l
   8F63 CB 1A         [ 8]  878 	rr	d
   8F65 CB 3B         [ 8]  879 	srl	e
   8F67 C5            [11]  880 	push	bc
   8F68 FD E5         [15]  881 	push	iy
   8F6A 21 F0 C0      [10]  882 	ld	hl,#0xC0F0
   8F6D E5            [11]  883 	push	hl
   8F6E 3E 28         [ 7]  884 	ld	a,#0x28
   8F70 F5            [11]  885 	push	af
   8F71 33            [ 6]  886 	inc	sp
   8F72 DD 66 FA      [19]  887 	ld	h,-6 (ix)
   8F75 DD 6E FB      [19]  888 	ld	l,-5 (ix)
   8F78 E5            [11]  889 	push	hl
   8F79 D5            [11]  890 	push	de
   8F7A CD 73 7F      [17]  891 	call	_cpct_etm_drawTileBox2x4
   8F7D C1            [10]  892 	pop	bc
                            893 ;src/main.c:207: enemy->mover = NO;
   8F7E 21 06 00      [10]  894 	ld	hl,#0x0006
   8F81 09            [11]  895 	add	hl,bc
   8F82 36 00         [10]  896 	ld	(hl),#0x00
   8F84 DD F9         [10]  897 	ld	sp, ix
   8F86 DD E1         [14]  898 	pop	ix
   8F88 C9            [10]  899 	ret
                            900 ;src/main.c:210: void redibujarEnemigo(TEnemy *enemy) {
                            901 ;	---------------------------------
                            902 ; Function redibujarEnemigo
                            903 ; ---------------------------------
   8F89                     904 _redibujarEnemigo::
   8F89 DD E5         [15]  905 	push	ix
   8F8B DD 21 00 00   [14]  906 	ld	ix,#0
   8F8F DD 39         [15]  907 	add	ix,sp
                            908 ;src/main.c:211: borrarEnemigo(enemy);
   8F91 DD 6E 04      [19]  909 	ld	l,4 (ix)
   8F94 DD 66 05      [19]  910 	ld	h,5 (ix)
   8F97 E5            [11]  911 	push	hl
   8F98 CD F5 8E      [17]  912 	call	_borrarEnemigo
   8F9B F1            [10]  913 	pop	af
                            914 ;src/main.c:212: enemy->px = enemy->x;
   8F9C DD 4E 04      [19]  915 	ld	c,4 (ix)
   8F9F DD 46 05      [19]  916 	ld	b,5 (ix)
   8FA2 59            [ 4]  917 	ld	e, c
   8FA3 50            [ 4]  918 	ld	d, b
   8FA4 13            [ 6]  919 	inc	de
   8FA5 13            [ 6]  920 	inc	de
   8FA6 0A            [ 7]  921 	ld	a,(bc)
   8FA7 12            [ 7]  922 	ld	(de),a
                            923 ;src/main.c:213: enemy->py = enemy->y;
   8FA8 59            [ 4]  924 	ld	e, c
   8FA9 50            [ 4]  925 	ld	d, b
   8FAA 13            [ 6]  926 	inc	de
   8FAB 13            [ 6]  927 	inc	de
   8FAC 13            [ 6]  928 	inc	de
   8FAD 69            [ 4]  929 	ld	l, c
   8FAE 60            [ 4]  930 	ld	h, b
   8FAF 23            [ 6]  931 	inc	hl
   8FB0 7E            [ 7]  932 	ld	a,(hl)
   8FB1 12            [ 7]  933 	ld	(de),a
                            934 ;src/main.c:214: dibujarEnemigo(enemy);
   8FB2 C5            [11]  935 	push	bc
   8FB3 CD 15 8E      [17]  936 	call	_dibujarEnemigo
   8FB6 F1            [10]  937 	pop	af
   8FB7 DD E1         [14]  938 	pop	ix
   8FB9 C9            [10]  939 	ret
                            940 ;src/main.c:217: u8 checkEnemyCollision(u8 direction, TEnemy *enemy){
                            941 ;	---------------------------------
                            942 ; Function checkEnemyCollision
                            943 ; ---------------------------------
   8FBA                     944 _checkEnemyCollision::
   8FBA DD E5         [15]  945 	push	ix
   8FBC DD 21 00 00   [14]  946 	ld	ix,#0
   8FC0 DD 39         [15]  947 	add	ix,sp
   8FC2 21 F7 FF      [10]  948 	ld	hl,#-9
   8FC5 39            [11]  949 	add	hl,sp
   8FC6 F9            [ 6]  950 	ld	sp,hl
                            951 ;src/main.c:219: u8 colisiona = 1;
   8FC7 DD 36 F7 01   [19]  952 	ld	-9 (ix),#0x01
                            953 ;src/main.c:221: switch (direction) {
   8FCB 3E 03         [ 7]  954 	ld	a,#0x03
   8FCD DD 96 04      [19]  955 	sub	a, 4 (ix)
   8FD0 DA AD 93      [10]  956 	jp	C,00165$
                            957 ;src/main.c:223: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   8FD3 DD 4E 05      [19]  958 	ld	c,5 (ix)
   8FD6 DD 46 06      [19]  959 	ld	b,6 (ix)
   8FD9 0A            [ 7]  960 	ld	a,(bc)
   8FDA 5F            [ 4]  961 	ld	e,a
   8FDB 21 01 00      [10]  962 	ld	hl,#0x0001
   8FDE 09            [11]  963 	add	hl,bc
   8FDF DD 75 F8      [19]  964 	ld	-8 (ix),l
   8FE2 DD 74 F9      [19]  965 	ld	-7 (ix),h
   8FE5 DD 6E F8      [19]  966 	ld	l,-8 (ix)
   8FE8 DD 66 F9      [19]  967 	ld	h,-7 (ix)
   8FEB 56            [ 7]  968 	ld	d,(hl)
                            969 ;src/main.c:236: enemy->muerto = SI;
   8FEC 21 08 00      [10]  970 	ld	hl,#0x0008
   8FEF 09            [11]  971 	add	hl,bc
   8FF0 DD 75 FA      [19]  972 	ld	-6 (ix),l
   8FF3 DD 74 FB      [19]  973 	ld	-5 (ix),h
                            974 ;src/main.c:243: enemy->mira = M_izquierda;
   8FF6 21 07 00      [10]  975 	ld	hl,#0x0007
   8FF9 09            [11]  976 	add	hl,bc
   8FFA DD 75 FC      [19]  977 	ld	-4 (ix),l
   8FFD DD 74 FD      [19]  978 	ld	-3 (ix),h
                            979 ;src/main.c:221: switch (direction) {
   9000 D5            [11]  980 	push	de
   9001 DD 5E 04      [19]  981 	ld	e,4 (ix)
   9004 16 00         [ 7]  982 	ld	d,#0x00
   9006 21 0E 90      [10]  983 	ld	hl,#00268$
   9009 19            [11]  984 	add	hl,de
   900A 19            [11]  985 	add	hl,de
   900B 19            [11]  986 	add	hl,de
   900C D1            [10]  987 	pop	de
   900D E9            [ 4]  988 	jp	(hl)
   900E                     989 00268$:
   900E C3 1A 90      [10]  990 	jp	00101$
   9011 C3 02 91      [10]  991 	jp	00117$
   9014 C3 E6 91      [10]  992 	jp	00133$
   9017 C3 C4 92      [10]  993 	jp	00149$
                            994 ;src/main.c:222: case 0:
   901A                     995 00101$:
                            996 ;src/main.c:223: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   901A 7B            [ 4]  997 	ld	a,e
   901B C6 05         [ 7]  998 	add	a, #0x05
   901D C5            [11]  999 	push	bc
   901E D5            [11] 1000 	push	de
   901F 33            [ 6] 1001 	inc	sp
   9020 F5            [11] 1002 	push	af
   9021 33            [ 6] 1003 	inc	sp
   9022 2A 5B 8B      [16] 1004 	ld	hl,(_mapa)
   9025 E5            [11] 1005 	push	hl
   9026 CD E8 75      [17] 1006 	call	_getTilePtr
   9029 F1            [10] 1007 	pop	af
   902A F1            [10] 1008 	pop	af
   902B C1            [10] 1009 	pop	bc
   902C 5E            [ 7] 1010 	ld	e,(hl)
   902D 3E 02         [ 7] 1011 	ld	a,#0x02
   902F 93            [ 4] 1012 	sub	a, e
   9030 DA F7 90      [10] 1013 	jp	C,00113$
                           1014 ;src/main.c:224: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   9033 DD 6E F8      [19] 1015 	ld	l,-8 (ix)
   9036 DD 66 F9      [19] 1016 	ld	h,-7 (ix)
   9039 7E            [ 7] 1017 	ld	a,(hl)
   903A C6 0B         [ 7] 1018 	add	a, #0x0B
   903C 57            [ 4] 1019 	ld	d,a
   903D 0A            [ 7] 1020 	ld	a,(bc)
   903E C6 05         [ 7] 1021 	add	a, #0x05
   9040 C5            [11] 1022 	push	bc
   9041 D5            [11] 1023 	push	de
   9042 33            [ 6] 1024 	inc	sp
   9043 F5            [11] 1025 	push	af
   9044 33            [ 6] 1026 	inc	sp
   9045 2A 5B 8B      [16] 1027 	ld	hl,(_mapa)
   9048 E5            [11] 1028 	push	hl
   9049 CD E8 75      [17] 1029 	call	_getTilePtr
   904C F1            [10] 1030 	pop	af
   904D F1            [10] 1031 	pop	af
   904E C1            [10] 1032 	pop	bc
   904F 5E            [ 7] 1033 	ld	e,(hl)
   9050 3E 02         [ 7] 1034 	ld	a,#0x02
   9052 93            [ 4] 1035 	sub	a, e
   9053 DA F7 90      [10] 1036 	jp	C,00113$
                           1037 ;src/main.c:225: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   9056 DD 6E F8      [19] 1038 	ld	l,-8 (ix)
   9059 DD 66 F9      [19] 1039 	ld	h,-7 (ix)
   905C 7E            [ 7] 1040 	ld	a,(hl)
   905D C6 16         [ 7] 1041 	add	a, #0x16
   905F 57            [ 4] 1042 	ld	d,a
   9060 0A            [ 7] 1043 	ld	a,(bc)
   9061 C6 05         [ 7] 1044 	add	a, #0x05
   9063 C5            [11] 1045 	push	bc
   9064 D5            [11] 1046 	push	de
   9065 33            [ 6] 1047 	inc	sp
   9066 F5            [11] 1048 	push	af
   9067 33            [ 6] 1049 	inc	sp
   9068 2A 5B 8B      [16] 1050 	ld	hl,(_mapa)
   906B E5            [11] 1051 	push	hl
   906C CD E8 75      [17] 1052 	call	_getTilePtr
   906F F1            [10] 1053 	pop	af
   9070 F1            [10] 1054 	pop	af
   9071 C1            [10] 1055 	pop	bc
   9072 5E            [ 7] 1056 	ld	e,(hl)
   9073 3E 02         [ 7] 1057 	ld	a,#0x02
   9075 93            [ 4] 1058 	sub	a, e
   9076 DA F7 90      [10] 1059 	jp	C,00113$
                           1060 ;src/main.c:227: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   9079 21 51 8B      [10] 1061 	ld	hl, #_cu + 1
   907C 5E            [ 7] 1062 	ld	e,(hl)
   907D 16 00         [ 7] 1063 	ld	d,#0x00
   907F 21 04 00      [10] 1064 	ld	hl,#0x0004
   9082 19            [11] 1065 	add	hl,de
   9083 DD 75 FE      [19] 1066 	ld	-2 (ix),l
   9086 DD 74 FF      [19] 1067 	ld	-1 (ix),h
   9089 DD 6E F8      [19] 1068 	ld	l,-8 (ix)
   908C DD 66 F9      [19] 1069 	ld	h,-7 (ix)
   908F 6E            [ 7] 1070 	ld	l,(hl)
   9090 26 00         [ 7] 1071 	ld	h,#0x00
   9092 DD 7E FE      [19] 1072 	ld	a,-2 (ix)
   9095 95            [ 4] 1073 	sub	a, l
   9096 DD 7E FF      [19] 1074 	ld	a,-1 (ix)
   9099 9C            [ 4] 1075 	sbc	a, h
   909A E2 9F 90      [10] 1076 	jp	PO, 00269$
   909D EE 80         [ 7] 1077 	xor	a, #0x80
   909F                    1078 00269$:
   909F FA B4 90      [10] 1079 	jp	M,00108$
   90A2 D5            [11] 1080 	push	de
   90A3 11 16 00      [10] 1081 	ld	de,#0x0016
   90A6 19            [11] 1082 	add	hl, de
   90A7 D1            [10] 1083 	pop	de
   90A8 7D            [ 4] 1084 	ld	a,l
   90A9 93            [ 4] 1085 	sub	a, e
   90AA 7C            [ 4] 1086 	ld	a,h
   90AB 9A            [ 4] 1087 	sbc	a, d
   90AC E2 B1 90      [10] 1088 	jp	PO, 00270$
   90AF EE 80         [ 7] 1089 	xor	a, #0x80
   90B1                    1090 00270$:
   90B1 F2 BB 90      [10] 1091 	jp	P,00109$
   90B4                    1092 00108$:
                           1093 ;src/main.c:228: colisiona = 0;
   90B4 DD 36 F7 00   [19] 1094 	ld	-9 (ix),#0x00
   90B8 C3 AD 93      [10] 1095 	jp	00165$
   90BB                    1096 00109$:
                           1097 ;src/main.c:231: if(cu.x > enemy->x){ //si el cu esta abajo
   90BB 21 50 8B      [10] 1098 	ld	hl, #_cu + 0
   90BE 5E            [ 7] 1099 	ld	e,(hl)
   90BF 0A            [ 7] 1100 	ld	a,(bc)
   90C0 4F            [ 4] 1101 	ld	c,a
   90C1 93            [ 4] 1102 	sub	a, e
   90C2 30 2C         [12] 1103 	jr	NC,00106$
                           1104 ;src/main.c:232: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
   90C4 6B            [ 4] 1105 	ld	l,e
   90C5 26 00         [ 7] 1106 	ld	h,#0x00
   90C7 06 00         [ 7] 1107 	ld	b,#0x00
   90C9 03            [ 6] 1108 	inc	bc
   90CA 03            [ 6] 1109 	inc	bc
   90CB 03            [ 6] 1110 	inc	bc
   90CC 03            [ 6] 1111 	inc	bc
   90CD BF            [ 4] 1112 	cp	a, a
   90CE ED 42         [15] 1113 	sbc	hl, bc
   90D0 3E 01         [ 7] 1114 	ld	a,#0x01
   90D2 BD            [ 4] 1115 	cp	a, l
   90D3 3E 00         [ 7] 1116 	ld	a,#0x00
   90D5 9C            [ 4] 1117 	sbc	a, h
   90D6 E2 DB 90      [10] 1118 	jp	PO, 00271$
   90D9 EE 80         [ 7] 1119 	xor	a, #0x80
   90DB                    1120 00271$:
   90DB F2 E5 90      [10] 1121 	jp	P,00103$
                           1122 ;src/main.c:233: colisiona = 0;
   90DE DD 36 F7 00   [19] 1123 	ld	-9 (ix),#0x00
   90E2 C3 AD 93      [10] 1124 	jp	00165$
   90E5                    1125 00103$:
                           1126 ;src/main.c:236: enemy->muerto = SI;
   90E5 DD 6E FA      [19] 1127 	ld	l,-6 (ix)
   90E8 DD 66 FB      [19] 1128 	ld	h,-5 (ix)
   90EB 36 01         [10] 1129 	ld	(hl),#0x01
   90ED C3 AD 93      [10] 1130 	jp	00165$
   90F0                    1131 00106$:
                           1132 ;src/main.c:239: colisiona = 0;
   90F0 DD 36 F7 00   [19] 1133 	ld	-9 (ix),#0x00
   90F4 C3 AD 93      [10] 1134 	jp	00165$
   90F7                    1135 00113$:
                           1136 ;src/main.c:243: enemy->mira = M_izquierda;
   90F7 DD 6E FC      [19] 1137 	ld	l,-4 (ix)
   90FA DD 66 FD      [19] 1138 	ld	h,-3 (ix)
   90FD 36 01         [10] 1139 	ld	(hl),#0x01
                           1140 ;src/main.c:245: break;
   90FF C3 AD 93      [10] 1141 	jp	00165$
                           1142 ;src/main.c:246: case 1:
   9102                    1143 00117$:
                           1144 ;src/main.c:247: if( *getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   9102 1D            [ 4] 1145 	dec	e
   9103 C5            [11] 1146 	push	bc
   9104 D5            [11] 1147 	push	de
   9105 2A 5B 8B      [16] 1148 	ld	hl,(_mapa)
   9108 E5            [11] 1149 	push	hl
   9109 CD E8 75      [17] 1150 	call	_getTilePtr
   910C F1            [10] 1151 	pop	af
   910D F1            [10] 1152 	pop	af
   910E C1            [10] 1153 	pop	bc
   910F 5E            [ 7] 1154 	ld	e,(hl)
   9110 3E 02         [ 7] 1155 	ld	a,#0x02
   9112 93            [ 4] 1156 	sub	a, e
   9113 DA DB 91      [10] 1157 	jp	C,00129$
                           1158 ;src/main.c:248: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   9116 DD 6E F8      [19] 1159 	ld	l,-8 (ix)
   9119 DD 66 F9      [19] 1160 	ld	h,-7 (ix)
   911C 7E            [ 7] 1161 	ld	a,(hl)
   911D C6 0B         [ 7] 1162 	add	a, #0x0B
   911F 57            [ 4] 1163 	ld	d,a
   9120 0A            [ 7] 1164 	ld	a,(bc)
   9121 C6 FF         [ 7] 1165 	add	a,#0xFF
   9123 C5            [11] 1166 	push	bc
   9124 D5            [11] 1167 	push	de
   9125 33            [ 6] 1168 	inc	sp
   9126 F5            [11] 1169 	push	af
   9127 33            [ 6] 1170 	inc	sp
   9128 2A 5B 8B      [16] 1171 	ld	hl,(_mapa)
   912B E5            [11] 1172 	push	hl
   912C CD E8 75      [17] 1173 	call	_getTilePtr
   912F F1            [10] 1174 	pop	af
   9130 F1            [10] 1175 	pop	af
   9131 C1            [10] 1176 	pop	bc
   9132 5E            [ 7] 1177 	ld	e,(hl)
   9133 3E 02         [ 7] 1178 	ld	a,#0x02
   9135 93            [ 4] 1179 	sub	a, e
   9136 DA DB 91      [10] 1180 	jp	C,00129$
                           1181 ;src/main.c:249: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   9139 DD 6E F8      [19] 1182 	ld	l,-8 (ix)
   913C DD 66 F9      [19] 1183 	ld	h,-7 (ix)
   913F 7E            [ 7] 1184 	ld	a,(hl)
   9140 C6 16         [ 7] 1185 	add	a, #0x16
   9142 57            [ 4] 1186 	ld	d,a
   9143 0A            [ 7] 1187 	ld	a,(bc)
   9144 C6 FF         [ 7] 1188 	add	a,#0xFF
   9146 C5            [11] 1189 	push	bc
   9147 D5            [11] 1190 	push	de
   9148 33            [ 6] 1191 	inc	sp
   9149 F5            [11] 1192 	push	af
   914A 33            [ 6] 1193 	inc	sp
   914B 2A 5B 8B      [16] 1194 	ld	hl,(_mapa)
   914E E5            [11] 1195 	push	hl
   914F CD E8 75      [17] 1196 	call	_getTilePtr
   9152 F1            [10] 1197 	pop	af
   9153 F1            [10] 1198 	pop	af
   9154 C1            [10] 1199 	pop	bc
   9155 5E            [ 7] 1200 	ld	e,(hl)
   9156 3E 02         [ 7] 1201 	ld	a,#0x02
   9158 93            [ 4] 1202 	sub	a, e
   9159 DA DB 91      [10] 1203 	jp	C,00129$
                           1204 ;src/main.c:251: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   915C 21 51 8B      [10] 1205 	ld	hl, #_cu + 1
   915F 5E            [ 7] 1206 	ld	e,(hl)
   9160 16 00         [ 7] 1207 	ld	d,#0x00
   9162 21 04 00      [10] 1208 	ld	hl,#0x0004
   9165 19            [11] 1209 	add	hl,de
   9166 DD 75 FE      [19] 1210 	ld	-2 (ix),l
   9169 DD 74 FF      [19] 1211 	ld	-1 (ix),h
   916C DD 6E F8      [19] 1212 	ld	l,-8 (ix)
   916F DD 66 F9      [19] 1213 	ld	h,-7 (ix)
   9172 6E            [ 7] 1214 	ld	l,(hl)
   9173 26 00         [ 7] 1215 	ld	h,#0x00
   9175 DD 7E FE      [19] 1216 	ld	a,-2 (ix)
   9178 95            [ 4] 1217 	sub	a, l
   9179 DD 7E FF      [19] 1218 	ld	a,-1 (ix)
   917C 9C            [ 4] 1219 	sbc	a, h
   917D E2 82 91      [10] 1220 	jp	PO, 00272$
   9180 EE 80         [ 7] 1221 	xor	a, #0x80
   9182                    1222 00272$:
   9182 FA 97 91      [10] 1223 	jp	M,00124$
   9185 D5            [11] 1224 	push	de
   9186 11 16 00      [10] 1225 	ld	de,#0x0016
   9189 19            [11] 1226 	add	hl, de
   918A D1            [10] 1227 	pop	de
   918B 7D            [ 4] 1228 	ld	a,l
   918C 93            [ 4] 1229 	sub	a, e
   918D 7C            [ 4] 1230 	ld	a,h
   918E 9A            [ 4] 1231 	sbc	a, d
   918F E2 94 91      [10] 1232 	jp	PO, 00273$
   9192 EE 80         [ 7] 1233 	xor	a, #0x80
   9194                    1234 00273$:
   9194 F2 9E 91      [10] 1235 	jp	P,00125$
   9197                    1236 00124$:
                           1237 ;src/main.c:252: colisiona = 0;
   9197 DD 36 F7 00   [19] 1238 	ld	-9 (ix),#0x00
   919B C3 AD 93      [10] 1239 	jp	00165$
   919E                    1240 00125$:
                           1241 ;src/main.c:255: if(enemy->x > cu.x){ //si el cu esta abajo
   919E 0A            [ 7] 1242 	ld	a,(bc)
   919F 5F            [ 4] 1243 	ld	e,a
   91A0 21 50 8B      [10] 1244 	ld	hl, #_cu + 0
   91A3 4E            [ 7] 1245 	ld	c,(hl)
   91A4 79            [ 4] 1246 	ld	a,c
   91A5 93            [ 4] 1247 	sub	a, e
   91A6 30 2C         [12] 1248 	jr	NC,00122$
                           1249 ;src/main.c:256: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
   91A8 6B            [ 4] 1250 	ld	l,e
   91A9 26 00         [ 7] 1251 	ld	h,#0x00
   91AB 06 00         [ 7] 1252 	ld	b,#0x00
   91AD 03            [ 6] 1253 	inc	bc
   91AE 03            [ 6] 1254 	inc	bc
   91AF 03            [ 6] 1255 	inc	bc
   91B0 03            [ 6] 1256 	inc	bc
   91B1 BF            [ 4] 1257 	cp	a, a
   91B2 ED 42         [15] 1258 	sbc	hl, bc
   91B4 3E 01         [ 7] 1259 	ld	a,#0x01
   91B6 BD            [ 4] 1260 	cp	a, l
   91B7 3E 00         [ 7] 1261 	ld	a,#0x00
   91B9 9C            [ 4] 1262 	sbc	a, h
   91BA E2 BF 91      [10] 1263 	jp	PO, 00274$
   91BD EE 80         [ 7] 1264 	xor	a, #0x80
   91BF                    1265 00274$:
   91BF F2 C9 91      [10] 1266 	jp	P,00119$
                           1267 ;src/main.c:257: colisiona = 0;
   91C2 DD 36 F7 00   [19] 1268 	ld	-9 (ix),#0x00
   91C6 C3 AD 93      [10] 1269 	jp	00165$
   91C9                    1270 00119$:
                           1271 ;src/main.c:260: enemy->muerto = SI;
   91C9 DD 6E FA      [19] 1272 	ld	l,-6 (ix)
   91CC DD 66 FB      [19] 1273 	ld	h,-5 (ix)
   91CF 36 01         [10] 1274 	ld	(hl),#0x01
   91D1 C3 AD 93      [10] 1275 	jp	00165$
   91D4                    1276 00122$:
                           1277 ;src/main.c:263: colisiona = 0;
   91D4 DD 36 F7 00   [19] 1278 	ld	-9 (ix),#0x00
   91D8 C3 AD 93      [10] 1279 	jp	00165$
   91DB                    1280 00129$:
                           1281 ;src/main.c:267: enemy->mira = M_derecha;
   91DB DD 6E FC      [19] 1282 	ld	l,-4 (ix)
   91DE DD 66 FD      [19] 1283 	ld	h,-3 (ix)
   91E1 36 00         [10] 1284 	ld	(hl),#0x00
                           1285 ;src/main.c:269: break;
   91E3 C3 AD 93      [10] 1286 	jp	00165$
                           1287 ;src/main.c:270: case 2:
   91E6                    1288 00133$:
                           1289 ;src/main.c:271: if( *getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   91E6 15            [ 4] 1290 	dec	d
   91E7 15            [ 4] 1291 	dec	d
   91E8 C5            [11] 1292 	push	bc
   91E9 D5            [11] 1293 	push	de
   91EA 2A 5B 8B      [16] 1294 	ld	hl,(_mapa)
   91ED E5            [11] 1295 	push	hl
   91EE CD E8 75      [17] 1296 	call	_getTilePtr
   91F1 F1            [10] 1297 	pop	af
   91F2 F1            [10] 1298 	pop	af
   91F3 C1            [10] 1299 	pop	bc
   91F4 5E            [ 7] 1300 	ld	e,(hl)
   91F5 3E 02         [ 7] 1301 	ld	a,#0x02
   91F7 93            [ 4] 1302 	sub	a, e
   91F8 DA BC 92      [10] 1303 	jp	C,00145$
                           1304 ;src/main.c:272: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   91FB DD 6E F8      [19] 1305 	ld	l,-8 (ix)
   91FE DD 66 F9      [19] 1306 	ld	h,-7 (ix)
   9201 56            [ 7] 1307 	ld	d,(hl)
   9202 15            [ 4] 1308 	dec	d
   9203 15            [ 4] 1309 	dec	d
   9204 0A            [ 7] 1310 	ld	a,(bc)
   9205 C6 02         [ 7] 1311 	add	a, #0x02
   9207 C5            [11] 1312 	push	bc
   9208 D5            [11] 1313 	push	de
   9209 33            [ 6] 1314 	inc	sp
   920A F5            [11] 1315 	push	af
   920B 33            [ 6] 1316 	inc	sp
   920C 2A 5B 8B      [16] 1317 	ld	hl,(_mapa)
   920F E5            [11] 1318 	push	hl
   9210 CD E8 75      [17] 1319 	call	_getTilePtr
   9213 F1            [10] 1320 	pop	af
   9214 F1            [10] 1321 	pop	af
   9215 C1            [10] 1322 	pop	bc
   9216 5E            [ 7] 1323 	ld	e,(hl)
   9217 3E 02         [ 7] 1324 	ld	a,#0x02
   9219 93            [ 4] 1325 	sub	a, e
   921A DA BC 92      [10] 1326 	jp	C,00145$
                           1327 ;src/main.c:273: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   921D DD 6E F8      [19] 1328 	ld	l,-8 (ix)
   9220 DD 66 F9      [19] 1329 	ld	h,-7 (ix)
   9223 56            [ 7] 1330 	ld	d,(hl)
   9224 15            [ 4] 1331 	dec	d
   9225 15            [ 4] 1332 	dec	d
   9226 0A            [ 7] 1333 	ld	a,(bc)
   9227 C6 04         [ 7] 1334 	add	a, #0x04
   9229 C5            [11] 1335 	push	bc
   922A D5            [11] 1336 	push	de
   922B 33            [ 6] 1337 	inc	sp
   922C F5            [11] 1338 	push	af
   922D 33            [ 6] 1339 	inc	sp
   922E 2A 5B 8B      [16] 1340 	ld	hl,(_mapa)
   9231 E5            [11] 1341 	push	hl
   9232 CD E8 75      [17] 1342 	call	_getTilePtr
   9235 F1            [10] 1343 	pop	af
   9236 F1            [10] 1344 	pop	af
   9237 C1            [10] 1345 	pop	bc
   9238 5E            [ 7] 1346 	ld	e,(hl)
   9239 3E 02         [ 7] 1347 	ld	a,#0x02
   923B 93            [ 4] 1348 	sub	a, e
   923C DA BC 92      [10] 1349 	jp	C,00145$
                           1350 ;src/main.c:275: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   923F 21 50 8B      [10] 1351 	ld	hl, #_cu + 0
   9242 5E            [ 7] 1352 	ld	e,(hl)
   9243 16 00         [ 7] 1353 	ld	d,#0x00
   9245 21 02 00      [10] 1354 	ld	hl,#0x0002
   9248 19            [11] 1355 	add	hl,de
   9249 DD 75 FE      [19] 1356 	ld	-2 (ix),l
   924C DD 74 FF      [19] 1357 	ld	-1 (ix),h
   924F 0A            [ 7] 1358 	ld	a,(bc)
   9250 6F            [ 4] 1359 	ld	l,a
   9251 26 00         [ 7] 1360 	ld	h,#0x00
   9253 DD 7E FE      [19] 1361 	ld	a,-2 (ix)
   9256 95            [ 4] 1362 	sub	a, l
   9257 DD 7E FF      [19] 1363 	ld	a,-1 (ix)
   925A 9C            [ 4] 1364 	sbc	a, h
   925B E2 60 92      [10] 1365 	jp	PO, 00275$
   925E EE 80         [ 7] 1366 	xor	a, #0x80
   9260                    1367 00275$:
   9260 FA 73 92      [10] 1368 	jp	M,00140$
   9263 23            [ 6] 1369 	inc	hl
   9264 23            [ 6] 1370 	inc	hl
   9265 23            [ 6] 1371 	inc	hl
   9266 23            [ 6] 1372 	inc	hl
   9267 7D            [ 4] 1373 	ld	a,l
   9268 93            [ 4] 1374 	sub	a, e
   9269 7C            [ 4] 1375 	ld	a,h
   926A 9A            [ 4] 1376 	sbc	a, d
   926B E2 70 92      [10] 1377 	jp	PO, 00276$
   926E EE 80         [ 7] 1378 	xor	a, #0x80
   9270                    1379 00276$:
   9270 F2 79 92      [10] 1380 	jp	P,00141$
   9273                    1381 00140$:
                           1382 ;src/main.c:277: colisiona = 0;
   9273 DD 36 F7 00   [19] 1383 	ld	-9 (ix),#0x00
   9277 18 4B         [12] 1384 	jr	00149$
   9279                    1385 00141$:
                           1386 ;src/main.c:280: if(enemy->y>cu.y){
   9279 DD 6E F8      [19] 1387 	ld	l,-8 (ix)
   927C DD 66 F9      [19] 1388 	ld	h,-7 (ix)
   927F 5E            [ 7] 1389 	ld	e,(hl)
   9280 21 51 8B      [10] 1390 	ld	hl, #(_cu + 0x0001) + 0
   9283 6E            [ 7] 1391 	ld	l,(hl)
   9284 7D            [ 4] 1392 	ld	a,l
   9285 93            [ 4] 1393 	sub	a, e
   9286 30 2E         [12] 1394 	jr	NC,00138$
                           1395 ;src/main.c:281: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   9288 16 00         [ 7] 1396 	ld	d,#0x00
   928A 26 00         [ 7] 1397 	ld	h,#0x00
   928C D5            [11] 1398 	push	de
   928D 11 08 00      [10] 1399 	ld	de,#0x0008
   9290 19            [11] 1400 	add	hl, de
   9291 D1            [10] 1401 	pop	de
   9292 7B            [ 4] 1402 	ld	a,e
   9293 95            [ 4] 1403 	sub	a, l
   9294 5F            [ 4] 1404 	ld	e,a
   9295 7A            [ 4] 1405 	ld	a,d
   9296 9C            [ 4] 1406 	sbc	a, h
   9297 57            [ 4] 1407 	ld	d,a
   9298 3E 02         [ 7] 1408 	ld	a,#0x02
   929A BB            [ 4] 1409 	cp	a, e
   929B 3E 00         [ 7] 1410 	ld	a,#0x00
   929D 9A            [ 4] 1411 	sbc	a, d
   929E E2 A3 92      [10] 1412 	jp	PO, 00277$
   92A1 EE 80         [ 7] 1413 	xor	a, #0x80
   92A3                    1414 00277$:
   92A3 F2 AC 92      [10] 1415 	jp	P,00135$
                           1416 ;src/main.c:282: colisiona = 0;
   92A6 DD 36 F7 00   [19] 1417 	ld	-9 (ix),#0x00
   92AA 18 18         [12] 1418 	jr	00149$
   92AC                    1419 00135$:
                           1420 ;src/main.c:285: enemy->muerto = SI;
   92AC DD 6E FA      [19] 1421 	ld	l,-6 (ix)
   92AF DD 66 FB      [19] 1422 	ld	h,-5 (ix)
   92B2 36 01         [10] 1423 	ld	(hl),#0x01
   92B4 18 0E         [12] 1424 	jr	00149$
   92B6                    1425 00138$:
                           1426 ;src/main.c:289: colisiona = 0;
   92B6 DD 36 F7 00   [19] 1427 	ld	-9 (ix),#0x00
   92BA 18 08         [12] 1428 	jr	00149$
   92BC                    1429 00145$:
                           1430 ;src/main.c:295: enemy->mira = M_abajo;
   92BC DD 6E FC      [19] 1431 	ld	l,-4 (ix)
   92BF DD 66 FD      [19] 1432 	ld	h,-3 (ix)
   92C2 36 03         [10] 1433 	ld	(hl),#0x03
                           1434 ;src/main.c:298: case 3:
   92C4                    1435 00149$:
                           1436 ;src/main.c:301: if( *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   92C4 DD 6E F8      [19] 1437 	ld	l,-8 (ix)
   92C7 DD 66 F9      [19] 1438 	ld	h,-7 (ix)
   92CA 7E            [ 7] 1439 	ld	a,(hl)
   92CB C6 18         [ 7] 1440 	add	a, #0x18
   92CD 57            [ 4] 1441 	ld	d,a
   92CE 0A            [ 7] 1442 	ld	a,(bc)
   92CF C5            [11] 1443 	push	bc
   92D0 D5            [11] 1444 	push	de
   92D1 33            [ 6] 1445 	inc	sp
   92D2 F5            [11] 1446 	push	af
   92D3 33            [ 6] 1447 	inc	sp
   92D4 2A 5B 8B      [16] 1448 	ld	hl,(_mapa)
   92D7 E5            [11] 1449 	push	hl
   92D8 CD E8 75      [17] 1450 	call	_getTilePtr
   92DB F1            [10] 1451 	pop	af
   92DC F1            [10] 1452 	pop	af
   92DD C1            [10] 1453 	pop	bc
   92DE 5E            [ 7] 1454 	ld	e,(hl)
   92DF 3E 02         [ 7] 1455 	ld	a,#0x02
   92E1 93            [ 4] 1456 	sub	a, e
   92E2 DA A5 93      [10] 1457 	jp	C,00161$
                           1458 ;src/main.c:302: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   92E5 DD 6E F8      [19] 1459 	ld	l,-8 (ix)
   92E8 DD 66 F9      [19] 1460 	ld	h,-7 (ix)
   92EB 7E            [ 7] 1461 	ld	a,(hl)
   92EC C6 18         [ 7] 1462 	add	a, #0x18
   92EE 57            [ 4] 1463 	ld	d,a
   92EF 0A            [ 7] 1464 	ld	a,(bc)
   92F0 C6 02         [ 7] 1465 	add	a, #0x02
   92F2 C5            [11] 1466 	push	bc
   92F3 D5            [11] 1467 	push	de
   92F4 33            [ 6] 1468 	inc	sp
   92F5 F5            [11] 1469 	push	af
   92F6 33            [ 6] 1470 	inc	sp
   92F7 2A 5B 8B      [16] 1471 	ld	hl,(_mapa)
   92FA E5            [11] 1472 	push	hl
   92FB CD E8 75      [17] 1473 	call	_getTilePtr
   92FE F1            [10] 1474 	pop	af
   92FF F1            [10] 1475 	pop	af
   9300 C1            [10] 1476 	pop	bc
   9301 5E            [ 7] 1477 	ld	e,(hl)
   9302 3E 02         [ 7] 1478 	ld	a,#0x02
   9304 93            [ 4] 1479 	sub	a, e
   9305 DA A5 93      [10] 1480 	jp	C,00161$
                           1481 ;src/main.c:303: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   9308 DD 6E F8      [19] 1482 	ld	l,-8 (ix)
   930B DD 66 F9      [19] 1483 	ld	h,-7 (ix)
   930E 7E            [ 7] 1484 	ld	a,(hl)
   930F C6 18         [ 7] 1485 	add	a, #0x18
   9311 57            [ 4] 1486 	ld	d,a
   9312 0A            [ 7] 1487 	ld	a,(bc)
   9313 C6 04         [ 7] 1488 	add	a, #0x04
   9315 C5            [11] 1489 	push	bc
   9316 D5            [11] 1490 	push	de
   9317 33            [ 6] 1491 	inc	sp
   9318 F5            [11] 1492 	push	af
   9319 33            [ 6] 1493 	inc	sp
   931A 2A 5B 8B      [16] 1494 	ld	hl,(_mapa)
   931D E5            [11] 1495 	push	hl
   931E CD E8 75      [17] 1496 	call	_getTilePtr
   9321 F1            [10] 1497 	pop	af
   9322 F1            [10] 1498 	pop	af
   9323 C1            [10] 1499 	pop	bc
   9324 5E            [ 7] 1500 	ld	e,(hl)
   9325 3E 02         [ 7] 1501 	ld	a,#0x02
   9327 93            [ 4] 1502 	sub	a, e
   9328 38 7B         [12] 1503 	jr	C,00161$
                           1504 ;src/main.c:305: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   932A 21 50 8B      [10] 1505 	ld	hl, #_cu + 0
   932D 5E            [ 7] 1506 	ld	e,(hl)
   932E 16 00         [ 7] 1507 	ld	d,#0x00
   9330 21 02 00      [10] 1508 	ld	hl,#0x0002
   9333 19            [11] 1509 	add	hl,de
   9334 DD 75 FE      [19] 1510 	ld	-2 (ix),l
   9337 DD 74 FF      [19] 1511 	ld	-1 (ix),h
   933A 0A            [ 7] 1512 	ld	a,(bc)
   933B 4F            [ 4] 1513 	ld	c,a
   933C 06 00         [ 7] 1514 	ld	b,#0x00
   933E DD 7E FE      [19] 1515 	ld	a,-2 (ix)
   9341 91            [ 4] 1516 	sub	a, c
   9342 DD 7E FF      [19] 1517 	ld	a,-1 (ix)
   9345 98            [ 4] 1518 	sbc	a, b
   9346 E2 4B 93      [10] 1519 	jp	PO, 00278$
   9349 EE 80         [ 7] 1520 	xor	a, #0x80
   934B                    1521 00278$:
   934B FA 5E 93      [10] 1522 	jp	M,00156$
   934E 03            [ 6] 1523 	inc	bc
   934F 03            [ 6] 1524 	inc	bc
   9350 03            [ 6] 1525 	inc	bc
   9351 03            [ 6] 1526 	inc	bc
   9352 79            [ 4] 1527 	ld	a,c
   9353 93            [ 4] 1528 	sub	a, e
   9354 78            [ 4] 1529 	ld	a,b
   9355 9A            [ 4] 1530 	sbc	a, d
   9356 E2 5B 93      [10] 1531 	jp	PO, 00279$
   9359 EE 80         [ 7] 1532 	xor	a, #0x80
   935B                    1533 00279$:
   935B F2 64 93      [10] 1534 	jp	P,00157$
   935E                    1535 00156$:
                           1536 ;src/main.c:306: colisiona = 0;
   935E DD 36 F7 00   [19] 1537 	ld	-9 (ix),#0x00
   9362 18 49         [12] 1538 	jr	00165$
   9364                    1539 00157$:
                           1540 ;src/main.c:309: if(cu.y > enemy->y){ //si el cu esta abajo
   9364 21 51 8B      [10] 1541 	ld	hl, #(_cu + 0x0001) + 0
   9367 4E            [ 7] 1542 	ld	c,(hl)
   9368 DD 6E F8      [19] 1543 	ld	l,-8 (ix)
   936B DD 66 F9      [19] 1544 	ld	h,-7 (ix)
   936E 5E            [ 7] 1545 	ld	e,(hl)
   936F 7B            [ 4] 1546 	ld	a,e
   9370 91            [ 4] 1547 	sub	a, c
   9371 30 2C         [12] 1548 	jr	NC,00154$
                           1549 ;src/main.c:310: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   9373 06 00         [ 7] 1550 	ld	b,#0x00
   9375 16 00         [ 7] 1551 	ld	d,#0x00
   9377 21 16 00      [10] 1552 	ld	hl,#0x0016
   937A 19            [11] 1553 	add	hl,de
   937B 79            [ 4] 1554 	ld	a,c
   937C 95            [ 4] 1555 	sub	a, l
   937D 4F            [ 4] 1556 	ld	c,a
   937E 78            [ 4] 1557 	ld	a,b
   937F 9C            [ 4] 1558 	sbc	a, h
   9380 47            [ 4] 1559 	ld	b,a
   9381 3E 02         [ 7] 1560 	ld	a,#0x02
   9383 B9            [ 4] 1561 	cp	a, c
   9384 3E 00         [ 7] 1562 	ld	a,#0x00
   9386 98            [ 4] 1563 	sbc	a, b
   9387 E2 8C 93      [10] 1564 	jp	PO, 00280$
   938A EE 80         [ 7] 1565 	xor	a, #0x80
   938C                    1566 00280$:
   938C F2 95 93      [10] 1567 	jp	P,00151$
                           1568 ;src/main.c:311: colisiona = 0;
   938F DD 36 F7 00   [19] 1569 	ld	-9 (ix),#0x00
   9393 18 18         [12] 1570 	jr	00165$
   9395                    1571 00151$:
                           1572 ;src/main.c:314: enemy->muerto = SI;
   9395 DD 6E FA      [19] 1573 	ld	l,-6 (ix)
   9398 DD 66 FB      [19] 1574 	ld	h,-5 (ix)
   939B 36 01         [10] 1575 	ld	(hl),#0x01
   939D 18 0E         [12] 1576 	jr	00165$
   939F                    1577 00154$:
                           1578 ;src/main.c:318: colisiona = 0;
   939F DD 36 F7 00   [19] 1579 	ld	-9 (ix),#0x00
   93A3 18 08         [12] 1580 	jr	00165$
   93A5                    1581 00161$:
                           1582 ;src/main.c:322: enemy->mira = M_arriba;
   93A5 DD 6E FC      [19] 1583 	ld	l,-4 (ix)
   93A8 DD 66 FD      [19] 1584 	ld	h,-3 (ix)
   93AB 36 02         [10] 1585 	ld	(hl),#0x02
                           1586 ;src/main.c:325: }
   93AD                    1587 00165$:
                           1588 ;src/main.c:326: return colisiona;
   93AD DD 6E F7      [19] 1589 	ld	l,-9 (ix)
   93B0 DD F9         [10] 1590 	ld	sp, ix
   93B2 DD E1         [14] 1591 	pop	ix
   93B4 C9            [10] 1592 	ret
                           1593 ;src/main.c:329: void moverEnemigoArriba(TEnemy *enemy){
                           1594 ;	---------------------------------
                           1595 ; Function moverEnemigoArriba
                           1596 ; ---------------------------------
   93B5                    1597 _moverEnemigoArriba::
   93B5 DD E5         [15] 1598 	push	ix
   93B7 DD 21 00 00   [14] 1599 	ld	ix,#0
   93BB DD 39         [15] 1600 	add	ix,sp
                           1601 ;src/main.c:330: enemy->y--;
   93BD DD 4E 04      [19] 1602 	ld	c,4 (ix)
   93C0 DD 46 05      [19] 1603 	ld	b,5 (ix)
   93C3 69            [ 4] 1604 	ld	l, c
   93C4 60            [ 4] 1605 	ld	h, b
   93C5 23            [ 6] 1606 	inc	hl
   93C6 5E            [ 7] 1607 	ld	e,(hl)
   93C7 1D            [ 4] 1608 	dec	e
   93C8 73            [ 7] 1609 	ld	(hl),e
                           1610 ;src/main.c:331: enemy->y--;
   93C9 1D            [ 4] 1611 	dec	e
   93CA 73            [ 7] 1612 	ld	(hl),e
                           1613 ;src/main.c:332: enemy->mover = SI;
   93CB 21 06 00      [10] 1614 	ld	hl,#0x0006
   93CE 09            [11] 1615 	add	hl,bc
   93CF 36 01         [10] 1616 	ld	(hl),#0x01
   93D1 DD E1         [14] 1617 	pop	ix
   93D3 C9            [10] 1618 	ret
                           1619 ;src/main.c:335: void moverEnemigoAbajo(TEnemy *enemy){
                           1620 ;	---------------------------------
                           1621 ; Function moverEnemigoAbajo
                           1622 ; ---------------------------------
   93D4                    1623 _moverEnemigoAbajo::
   93D4 DD E5         [15] 1624 	push	ix
   93D6 DD 21 00 00   [14] 1625 	ld	ix,#0
   93DA DD 39         [15] 1626 	add	ix,sp
                           1627 ;src/main.c:336: enemy->y++;
   93DC DD 4E 04      [19] 1628 	ld	c,4 (ix)
   93DF DD 46 05      [19] 1629 	ld	b,5 (ix)
   93E2 59            [ 4] 1630 	ld	e, c
   93E3 50            [ 4] 1631 	ld	d, b
   93E4 13            [ 6] 1632 	inc	de
   93E5 1A            [ 7] 1633 	ld	a,(de)
   93E6 3C            [ 4] 1634 	inc	a
   93E7 12            [ 7] 1635 	ld	(de),a
                           1636 ;src/main.c:337: enemy->y++;
   93E8 3C            [ 4] 1637 	inc	a
   93E9 12            [ 7] 1638 	ld	(de),a
                           1639 ;src/main.c:338: enemy->mover = SI;
   93EA 21 06 00      [10] 1640 	ld	hl,#0x0006
   93ED 09            [11] 1641 	add	hl,bc
   93EE 36 01         [10] 1642 	ld	(hl),#0x01
   93F0 DD E1         [14] 1643 	pop	ix
   93F2 C9            [10] 1644 	ret
                           1645 ;src/main.c:341: void moverEnemigoDerecha(TEnemy *enemy){
                           1646 ;	---------------------------------
                           1647 ; Function moverEnemigoDerecha
                           1648 ; ---------------------------------
   93F3                    1649 _moverEnemigoDerecha::
                           1650 ;src/main.c:342: enemy->x++;
   93F3 D1            [10] 1651 	pop	de
   93F4 C1            [10] 1652 	pop	bc
   93F5 C5            [11] 1653 	push	bc
   93F6 D5            [11] 1654 	push	de
   93F7 0A            [ 7] 1655 	ld	a,(bc)
   93F8 3C            [ 4] 1656 	inc	a
   93F9 02            [ 7] 1657 	ld	(bc),a
                           1658 ;src/main.c:343: enemy->x++;
   93FA 3C            [ 4] 1659 	inc	a
   93FB 02            [ 7] 1660 	ld	(bc),a
                           1661 ;src/main.c:344: enemy->mover = SI;
   93FC 21 06 00      [10] 1662 	ld	hl,#0x0006
   93FF 09            [11] 1663 	add	hl,bc
   9400 36 01         [10] 1664 	ld	(hl),#0x01
   9402 C9            [10] 1665 	ret
                           1666 ;src/main.c:347: void moverEnemigoIzquierda(TEnemy *enemy){
                           1667 ;	---------------------------------
                           1668 ; Function moverEnemigoIzquierda
                           1669 ; ---------------------------------
   9403                    1670 _moverEnemigoIzquierda::
                           1671 ;src/main.c:348: enemy->x--;
   9403 D1            [10] 1672 	pop	de
   9404 C1            [10] 1673 	pop	bc
   9405 C5            [11] 1674 	push	bc
   9406 D5            [11] 1675 	push	de
   9407 0A            [ 7] 1676 	ld	a,(bc)
   9408 C6 FF         [ 7] 1677 	add	a,#0xFF
   940A 02            [ 7] 1678 	ld	(bc),a
                           1679 ;src/main.c:349: enemy->x--;
   940B C6 FF         [ 7] 1680 	add	a,#0xFF
   940D 02            [ 7] 1681 	ld	(bc),a
                           1682 ;src/main.c:350: enemy->mover = SI;
   940E 21 06 00      [10] 1683 	ld	hl,#0x0006
   9411 09            [11] 1684 	add	hl,bc
   9412 36 01         [10] 1685 	ld	(hl),#0x01
   9414 C9            [10] 1686 	ret
                           1687 ;src/main.c:353: void moverEnemigo(TEnemy *enemy){
                           1688 ;	---------------------------------
                           1689 ; Function moverEnemigo
                           1690 ; ---------------------------------
   9415                    1691 _moverEnemigo::
                           1692 ;src/main.c:354: if(!enemy->muerto){
   9415 D1            [10] 1693 	pop	de
   9416 C1            [10] 1694 	pop	bc
   9417 C5            [11] 1695 	push	bc
   9418 D5            [11] 1696 	push	de
   9419 C5            [11] 1697 	push	bc
   941A FD E1         [14] 1698 	pop	iy
   941C FD 7E 08      [19] 1699 	ld	a,8 (iy)
   941F B7            [ 4] 1700 	or	a, a
   9420 C0            [11] 1701 	ret	NZ
                           1702 ;src/main.c:355: if(!checkEnemyCollision(enemy->mira, enemy)){
   9421 21 07 00      [10] 1703 	ld	hl,#0x0007
   9424 09            [11] 1704 	add	hl,bc
   9425 56            [ 7] 1705 	ld	d,(hl)
   9426 E5            [11] 1706 	push	hl
   9427 C5            [11] 1707 	push	bc
   9428 C5            [11] 1708 	push	bc
   9429 D5            [11] 1709 	push	de
   942A 33            [ 6] 1710 	inc	sp
   942B CD BA 8F      [17] 1711 	call	_checkEnemyCollision
   942E F1            [10] 1712 	pop	af
   942F 33            [ 6] 1713 	inc	sp
   9430 7D            [ 4] 1714 	ld	a,l
   9431 C1            [10] 1715 	pop	bc
   9432 E1            [10] 1716 	pop	hl
   9433 B7            [ 4] 1717 	or	a, a
   9434 C0            [11] 1718 	ret	NZ
                           1719 ;src/main.c:357: switch (enemy->mira) {
   9435 5E            [ 7] 1720 	ld	e,(hl)
   9436 3E 03         [ 7] 1721 	ld	a,#0x03
   9438 93            [ 4] 1722 	sub	a, e
   9439 D8            [11] 1723 	ret	C
   943A 16 00         [ 7] 1724 	ld	d,#0x00
   943C 21 42 94      [10] 1725 	ld	hl,#00124$
   943F 19            [11] 1726 	add	hl,de
   9440 19            [11] 1727 	add	hl,de
                           1728 ;src/main.c:359: case 0:
   9441 E9            [ 4] 1729 	jp	(hl)
   9442                    1730 00124$:
   9442 18 06         [12] 1731 	jr	00101$
   9444 18 0A         [12] 1732 	jr	00102$
   9446 18 0E         [12] 1733 	jr	00103$
   9448 18 12         [12] 1734 	jr	00104$
   944A                    1735 00101$:
                           1736 ;src/main.c:360: moverEnemigoDerecha(enemy);
   944A C5            [11] 1737 	push	bc
   944B CD F3 93      [17] 1738 	call	_moverEnemigoDerecha
   944E F1            [10] 1739 	pop	af
                           1740 ;src/main.c:361: break;
   944F C9            [10] 1741 	ret
                           1742 ;src/main.c:362: case 1:
   9450                    1743 00102$:
                           1744 ;src/main.c:363: moverEnemigoIzquierda(enemy);
   9450 C5            [11] 1745 	push	bc
   9451 CD 03 94      [17] 1746 	call	_moverEnemigoIzquierda
   9454 F1            [10] 1747 	pop	af
                           1748 ;src/main.c:364: break;
   9455 C9            [10] 1749 	ret
                           1750 ;src/main.c:365: case 2:
   9456                    1751 00103$:
                           1752 ;src/main.c:366: moverEnemigoArriba(enemy);
   9456 C5            [11] 1753 	push	bc
   9457 CD B5 93      [17] 1754 	call	_moverEnemigoArriba
   945A F1            [10] 1755 	pop	af
                           1756 ;src/main.c:367: break;
   945B C9            [10] 1757 	ret
                           1758 ;src/main.c:368: case 3:
   945C                    1759 00104$:
                           1760 ;src/main.c:369: moverEnemigoAbajo(enemy);
   945C C5            [11] 1761 	push	bc
   945D CD D4 93      [17] 1762 	call	_moverEnemigoAbajo
   9460 F1            [10] 1763 	pop	af
                           1764 ;src/main.c:371: }
   9461 C9            [10] 1765 	ret
                           1766 ;src/main.c:376: void inicializarEnemy() {
                           1767 ;	---------------------------------
                           1768 ; Function inicializarEnemy
                           1769 ; ---------------------------------
   9462                    1770 _inicializarEnemy::
   9462 DD E5         [15] 1771 	push	ix
   9464 DD 21 00 00   [14] 1772 	ld	ix,#0
   9468 DD 39         [15] 1773 	add	ix,sp
   946A 3B            [ 6] 1774 	dec	sp
                           1775 ;src/main.c:377: u8 i = (2 + num_mapa) + 1; //sacar distinto numero dependiendo del mapa
   946B 3A 5D 8B      [13] 1776 	ld	a,(#_num_mapa + 0)
   946E C6 03         [ 7] 1777 	add	a, #0x03
   9470 DD 77 FF      [19] 1778 	ld	-1 (ix),a
                           1779 ;src/main.c:382: actual = enemy;
   9473 11 14 8B      [10] 1780 	ld	de,#_enemy+0
                           1781 ;src/main.c:383: while(--i){
   9476                    1782 00101$:
   9476 DD 35 FF      [23] 1783 	dec	-1 (ix)
   9479 DD 7E FF      [19] 1784 	ld	a,-1 (ix)
   947C B7            [ 4] 1785 	or	a, a
   947D 28 61         [12] 1786 	jr	Z,00104$
                           1787 ;src/main.c:384: actual->x = actual->px = spawnX[i];
   947F 4B            [ 4] 1788 	ld	c, e
   9480 42            [ 4] 1789 	ld	b, d
   9481 03            [ 6] 1790 	inc	bc
   9482 03            [ 6] 1791 	inc	bc
   9483 3E 81         [ 7] 1792 	ld	a,#<(_spawnX)
   9485 DD 86 FF      [19] 1793 	add	a, -1 (ix)
   9488 6F            [ 4] 1794 	ld	l,a
   9489 3E 8B         [ 7] 1795 	ld	a,#>(_spawnX)
   948B CE 00         [ 7] 1796 	adc	a, #0x00
   948D 67            [ 4] 1797 	ld	h,a
   948E 7E            [ 7] 1798 	ld	a,(hl)
   948F 02            [ 7] 1799 	ld	(bc),a
   9490 12            [ 7] 1800 	ld	(de),a
                           1801 ;src/main.c:385: actual->y = actual->py = spawnY[i];
   9491 D5            [11] 1802 	push	de
   9492 FD E1         [14] 1803 	pop	iy
   9494 FD 23         [10] 1804 	inc	iy
   9496 4B            [ 4] 1805 	ld	c, e
   9497 42            [ 4] 1806 	ld	b, d
   9498 03            [ 6] 1807 	inc	bc
   9499 03            [ 6] 1808 	inc	bc
   949A 03            [ 6] 1809 	inc	bc
   949B 3E 86         [ 7] 1810 	ld	a,#<(_spawnY)
   949D DD 86 FF      [19] 1811 	add	a, -1 (ix)
   94A0 6F            [ 4] 1812 	ld	l,a
   94A1 3E 8B         [ 7] 1813 	ld	a,#>(_spawnY)
   94A3 CE 00         [ 7] 1814 	adc	a, #0x00
   94A5 67            [ 4] 1815 	ld	h,a
   94A6 7E            [ 7] 1816 	ld	a,(hl)
   94A7 02            [ 7] 1817 	ld	(bc),a
   94A8 FD 77 00      [19] 1818 	ld	0 (iy), a
                           1819 ;src/main.c:386: actual->mover  = NO;
   94AB 21 06 00      [10] 1820 	ld	hl,#0x0006
   94AE 19            [11] 1821 	add	hl,de
   94AF 36 00         [10] 1822 	ld	(hl),#0x00
                           1823 ;src/main.c:387: actual->mira   = M_abajo;
   94B1 21 07 00      [10] 1824 	ld	hl,#0x0007
   94B4 19            [11] 1825 	add	hl,de
   94B5 36 03         [10] 1826 	ld	(hl),#0x03
                           1827 ;src/main.c:388: actual->sprite = g_enemy;
   94B7 21 04 00      [10] 1828 	ld	hl,#0x0004
   94BA 19            [11] 1829 	add	hl,de
   94BB 36 3A         [10] 1830 	ld	(hl),#<(_g_enemy)
   94BD 23            [ 6] 1831 	inc	hl
   94BE 36 6E         [10] 1832 	ld	(hl),#>(_g_enemy)
                           1833 ;src/main.c:389: actual->muerto = NO;
   94C0 21 08 00      [10] 1834 	ld	hl,#0x0008
   94C3 19            [11] 1835 	add	hl,de
   94C4 36 00         [10] 1836 	ld	(hl),#0x00
                           1837 ;src/main.c:390: actual->muertes = 0;
   94C6 21 0C 00      [10] 1838 	ld	hl,#0x000C
   94C9 19            [11] 1839 	add	hl,de
   94CA 36 00         [10] 1840 	ld	(hl),#0x00
                           1841 ;src/main.c:391: actual->patroling = SI;
   94CC 21 09 00      [10] 1842 	ld	hl,#0x0009
   94CF 19            [11] 1843 	add	hl,de
   94D0 36 01         [10] 1844 	ld	(hl),#0x01
                           1845 ;src/main.c:393: dibujarEnemigo(actual);
   94D2 D5            [11] 1846 	push	de
   94D3 D5            [11] 1847 	push	de
   94D4 CD 15 8E      [17] 1848 	call	_dibujarEnemigo
   94D7 F1            [10] 1849 	pop	af
   94D8 D1            [10] 1850 	pop	de
                           1851 ;src/main.c:395: ++actual;
   94D9 21 0D 00      [10] 1852 	ld	hl,#0x000D
   94DC 19            [11] 1853 	add	hl,de
   94DD EB            [ 4] 1854 	ex	de,hl
   94DE 18 96         [12] 1855 	jr	00101$
   94E0                    1856 00104$:
   94E0 33            [ 6] 1857 	inc	sp
   94E1 DD E1         [14] 1858 	pop	ix
   94E3 C9            [10] 1859 	ret
                           1860 ;src/main.c:399: void avanzarMapa() {
                           1861 ;	---------------------------------
                           1862 ; Function avanzarMapa
                           1863 ; ---------------------------------
   94E4                    1864 _avanzarMapa::
                           1865 ;src/main.c:400: if(num_mapa < NUM_MAPAS -1) {
   94E4 3A 5D 8B      [13] 1866 	ld	a,(#_num_mapa + 0)
   94E7 D6 02         [ 7] 1867 	sub	a, #0x02
   94E9 30 34         [12] 1868 	jr	NC,00102$
                           1869 ;src/main.c:401: mapa = mapas[++num_mapa];
   94EB 01 7B 8B      [10] 1870 	ld	bc,#_mapas+0
   94EE 21 5D 8B      [10] 1871 	ld	hl, #_num_mapa+0
   94F1 34            [11] 1872 	inc	(hl)
   94F2 FD 21 5D 8B   [14] 1873 	ld	iy,#_num_mapa
   94F6 FD 6E 00      [19] 1874 	ld	l,0 (iy)
   94F9 26 00         [ 7] 1875 	ld	h,#0x00
   94FB 29            [11] 1876 	add	hl, hl
   94FC 09            [11] 1877 	add	hl,bc
   94FD 7E            [ 7] 1878 	ld	a,(hl)
   94FE FD 21 5B 8B   [14] 1879 	ld	iy,#_mapa
   9502 FD 77 00      [19] 1880 	ld	0 (iy),a
   9505 23            [ 6] 1881 	inc	hl
   9506 7E            [ 7] 1882 	ld	a,(hl)
   9507 32 5C 8B      [13] 1883 	ld	(#_mapa + 1),a
                           1884 ;src/main.c:402: prota.x = prota.px = 2;
   950A 21 4A 8B      [10] 1885 	ld	hl,#(_prota + 0x0002)
   950D 36 02         [10] 1886 	ld	(hl),#0x02
   950F 21 48 8B      [10] 1887 	ld	hl,#_prota
   9512 36 02         [10] 1888 	ld	(hl),#0x02
                           1889 ;src/main.c:403: prota.mover = SI;
   9514 21 4E 8B      [10] 1890 	ld	hl,#(_prota + 0x0006)
   9517 36 01         [10] 1891 	ld	(hl),#0x01
                           1892 ;src/main.c:404: dibujarMapa();
   9519 CD 65 8B      [17] 1893 	call	_dibujarMapa
                           1894 ;src/main.c:405: inicializarEnemy();
   951C C3 62 94      [10] 1895 	jp  _inicializarEnemy
   951F                    1896 00102$:
                           1897 ;src/main.c:408: menuFin(puntuacion);
   951F FD 21 5E 8B   [14] 1898 	ld	iy,#_puntuacion
   9523 FD 6E 00      [19] 1899 	ld	l,0 (iy)
   9526 26 00         [ 7] 1900 	ld	h,#0x00
   9528 C3 2C 76      [10] 1901 	jp  _menuFin
                           1902 ;src/main.c:412: void moverIzquierda() {
                           1903 ;	---------------------------------
                           1904 ; Function moverIzquierda
                           1905 ; ---------------------------------
   952B                    1906 _moverIzquierda::
                           1907 ;src/main.c:413: prota.mira = M_izquierda;
   952B 01 48 8B      [10] 1908 	ld	bc,#_prota+0
   952E 21 4F 8B      [10] 1909 	ld	hl,#(_prota + 0x0007)
   9531 36 01         [10] 1910 	ld	(hl),#0x01
                           1911 ;src/main.c:414: if (!checkCollision(M_izquierda)) {
   9533 C5            [11] 1912 	push	bc
   9534 3E 01         [ 7] 1913 	ld	a,#0x01
   9536 F5            [11] 1914 	push	af
   9537 33            [ 6] 1915 	inc	sp
   9538 CD A0 8C      [17] 1916 	call	_checkCollision
   953B 33            [ 6] 1917 	inc	sp
   953C C1            [10] 1918 	pop	bc
   953D 7D            [ 4] 1919 	ld	a,l
   953E B7            [ 4] 1920 	or	a, a
   953F C0            [11] 1921 	ret	NZ
                           1922 ;src/main.c:415: prota.x--;
   9540 0A            [ 7] 1923 	ld	a,(bc)
   9541 C6 FF         [ 7] 1924 	add	a,#0xFF
   9543 02            [ 7] 1925 	ld	(bc),a
                           1926 ;src/main.c:416: prota.mover = SI;
   9544 21 4E 8B      [10] 1927 	ld	hl,#(_prota + 0x0006)
   9547 36 01         [10] 1928 	ld	(hl),#0x01
                           1929 ;src/main.c:417: prota.sprite = g_hero_left;
   9549 21 C6 6F      [10] 1930 	ld	hl,#_g_hero_left
   954C 22 4C 8B      [16] 1931 	ld	((_prota + 0x0004)), hl
   954F C9            [10] 1932 	ret
                           1933 ;src/main.c:421: void moverDerecha() {
                           1934 ;	---------------------------------
                           1935 ; Function moverDerecha
                           1936 ; ---------------------------------
   9550                    1937 _moverDerecha::
                           1938 ;src/main.c:422: prota.mira = M_derecha;
   9550 21 4F 8B      [10] 1939 	ld	hl,#(_prota + 0x0007)
   9553 36 00         [10] 1940 	ld	(hl),#0x00
                           1941 ;src/main.c:423: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   9555 AF            [ 4] 1942 	xor	a, a
   9556 F5            [11] 1943 	push	af
   9557 33            [ 6] 1944 	inc	sp
   9558 CD A0 8C      [17] 1945 	call	_checkCollision
   955B 33            [ 6] 1946 	inc	sp
   955C 45            [ 4] 1947 	ld	b,l
   955D 21 48 8B      [10] 1948 	ld	hl, #_prota + 0
   9560 4E            [ 7] 1949 	ld	c,(hl)
   9561 59            [ 4] 1950 	ld	e,c
   9562 16 00         [ 7] 1951 	ld	d,#0x00
   9564 21 07 00      [10] 1952 	ld	hl,#0x0007
   9567 19            [11] 1953 	add	hl,de
   9568 11 50 80      [10] 1954 	ld	de, #0x8050
   956B 29            [11] 1955 	add	hl, hl
   956C 3F            [ 4] 1956 	ccf
   956D CB 1C         [ 8] 1957 	rr	h
   956F CB 1D         [ 8] 1958 	rr	l
   9571 ED 52         [15] 1959 	sbc	hl, de
   9573 3E 00         [ 7] 1960 	ld	a,#0x00
   9575 17            [ 4] 1961 	rla
   9576 5F            [ 4] 1962 	ld	e,a
   9577 78            [ 4] 1963 	ld	a,b
   9578 B7            [ 4] 1964 	or	a,a
   9579 20 14         [12] 1965 	jr	NZ,00104$
   957B B3            [ 4] 1966 	or	a,e
   957C 28 11         [12] 1967 	jr	Z,00104$
                           1968 ;src/main.c:424: prota.x++;
   957E 0C            [ 4] 1969 	inc	c
   957F 21 48 8B      [10] 1970 	ld	hl,#_prota
   9582 71            [ 7] 1971 	ld	(hl),c
                           1972 ;src/main.c:425: prota.mover = SI;
   9583 21 4E 8B      [10] 1973 	ld	hl,#(_prota + 0x0006)
   9586 36 01         [10] 1974 	ld	(hl),#0x01
                           1975 ;src/main.c:426: prota.sprite = g_hero;
   9588 21 70 70      [10] 1976 	ld	hl,#_g_hero
   958B 22 4C 8B      [16] 1977 	ld	((_prota + 0x0004)), hl
   958E C9            [10] 1978 	ret
   958F                    1979 00104$:
                           1980 ;src/main.c:428: }else if( prota.x + G_HERO_W >= 80){
   958F 7B            [ 4] 1981 	ld	a,e
   9590 B7            [ 4] 1982 	or	a, a
   9591 C0            [11] 1983 	ret	NZ
                           1984 ;src/main.c:429: avanzarMapa();
   9592 C3 E4 94      [10] 1985 	jp  _avanzarMapa
                           1986 ;src/main.c:433: void moverArriba() {
                           1987 ;	---------------------------------
                           1988 ; Function moverArriba
                           1989 ; ---------------------------------
   9595                    1990 _moverArriba::
                           1991 ;src/main.c:434: prota.mira = M_arriba;
   9595 21 4F 8B      [10] 1992 	ld	hl,#(_prota + 0x0007)
   9598 36 02         [10] 1993 	ld	(hl),#0x02
                           1994 ;src/main.c:435: if (!checkCollision(M_arriba)) { 
   959A 3E 02         [ 7] 1995 	ld	a,#0x02
   959C F5            [11] 1996 	push	af
   959D 33            [ 6] 1997 	inc	sp
   959E CD A0 8C      [17] 1998 	call	_checkCollision
   95A1 33            [ 6] 1999 	inc	sp
   95A2 7D            [ 4] 2000 	ld	a,l
   95A3 B7            [ 4] 2001 	or	a, a
   95A4 C0            [11] 2002 	ret	NZ
                           2003 ;src/main.c:436: prota.y--;
   95A5 21 49 8B      [10] 2004 	ld	hl,#_prota + 1
   95A8 4E            [ 7] 2005 	ld	c,(hl)
   95A9 0D            [ 4] 2006 	dec	c
   95AA 71            [ 7] 2007 	ld	(hl),c
                           2008 ;src/main.c:437: prota.y--;
   95AB 0D            [ 4] 2009 	dec	c
   95AC 71            [ 7] 2010 	ld	(hl),c
                           2011 ;src/main.c:438: prota.mover  = SI;
   95AD 21 4E 8B      [10] 2012 	ld	hl,#(_prota + 0x0006)
   95B0 36 01         [10] 2013 	ld	(hl),#0x01
                           2014 ;src/main.c:439: prota.sprite = g_hero_up;
   95B2 21 2C 6F      [10] 2015 	ld	hl,#_g_hero_up
   95B5 22 4C 8B      [16] 2016 	ld	((_prota + 0x0004)), hl
   95B8 C9            [10] 2017 	ret
                           2018 ;src/main.c:443: void moverAbajo() {
                           2019 ;	---------------------------------
                           2020 ; Function moverAbajo
                           2021 ; ---------------------------------
   95B9                    2022 _moverAbajo::
                           2023 ;src/main.c:444: prota.mira = M_abajo;
   95B9 21 4F 8B      [10] 2024 	ld	hl,#(_prota + 0x0007)
   95BC 36 03         [10] 2025 	ld	(hl),#0x03
                           2026 ;src/main.c:445: if (!checkCollision(M_abajo) ) { 
   95BE 3E 03         [ 7] 2027 	ld	a,#0x03
   95C0 F5            [11] 2028 	push	af
   95C1 33            [ 6] 2029 	inc	sp
   95C2 CD A0 8C      [17] 2030 	call	_checkCollision
   95C5 33            [ 6] 2031 	inc	sp
   95C6 7D            [ 4] 2032 	ld	a,l
   95C7 B7            [ 4] 2033 	or	a, a
   95C8 C0            [11] 2034 	ret	NZ
                           2035 ;src/main.c:446: prota.y++;
   95C9 01 49 8B      [10] 2036 	ld	bc,#_prota + 1
   95CC 0A            [ 7] 2037 	ld	a,(bc)
   95CD 3C            [ 4] 2038 	inc	a
   95CE 02            [ 7] 2039 	ld	(bc),a
                           2040 ;src/main.c:447: prota.y++;
   95CF 3C            [ 4] 2041 	inc	a
   95D0 02            [ 7] 2042 	ld	(bc),a
                           2043 ;src/main.c:448: prota.mover  = SI;
   95D1 21 4E 8B      [10] 2044 	ld	hl,#(_prota + 0x0006)
   95D4 36 01         [10] 2045 	ld	(hl),#0x01
                           2046 ;src/main.c:449: prota.sprite = g_hero_down;
   95D6 21 92 6E      [10] 2047 	ld	hl,#_g_hero_down
   95D9 22 4C 8B      [16] 2048 	ld	((_prota + 0x0004)), hl
   95DC C9            [10] 2049 	ret
                           2050 ;src/main.c:456: void intHandler() {
                           2051 ;	---------------------------------
                           2052 ; Function intHandler
                           2053 ; ---------------------------------
   95DD                    2054 _intHandler::
                           2055 ;src/main.c:457: if (++i == 6) {
   95DD 21 5A 8B      [10] 2056 	ld	hl, #_i+0
   95E0 34            [11] 2057 	inc	(hl)
   95E1 3A 5A 8B      [13] 2058 	ld	a,(#_i + 0)
   95E4 D6 06         [ 7] 2059 	sub	a, #0x06
   95E6 C0            [11] 2060 	ret	NZ
                           2061 ;src/main.c:458: play();
   95E7 CD C0 7D      [17] 2062 	call	_play
                           2063 ;src/main.c:459: i=0;
   95EA 21 5A 8B      [10] 2064 	ld	hl,#_i + 0
   95ED 36 00         [10] 2065 	ld	(hl), #0x00
   95EF C9            [10] 2066 	ret
                           2067 ;src/main.c:463: void inicializarCPC() {
                           2068 ;	---------------------------------
                           2069 ; Function inicializarCPC
                           2070 ; ---------------------------------
   95F0                    2071 _inicializarCPC::
                           2072 ;src/main.c:464: cpct_disableFirmware();
   95F0 CD 90 89      [17] 2073 	call	_cpct_disableFirmware
                           2074 ;src/main.c:465: cpct_setVideoMode(0);
   95F3 2E 00         [ 7] 2075 	ld	l,#0x00
   95F5 CD 3B 81      [17] 2076 	call	_cpct_setVideoMode
                           2077 ;src/main.c:466: cpct_setBorder(HW_BLACK);
   95F8 21 10 14      [10] 2078 	ld	hl,#0x1410
   95FB E5            [11] 2079 	push	hl
   95FC CD 9E 7E      [17] 2080 	call	_cpct_setPALColour
                           2081 ;src/main.c:467: cpct_setPalette(g_palette, 16);
   95FF 21 10 00      [10] 2082 	ld	hl,#0x0010
   9602 E5            [11] 2083 	push	hl
   9603 21 60 70      [10] 2084 	ld	hl,#_g_palette
   9606 E5            [11] 2085 	push	hl
   9607 CD 7B 7E      [17] 2086 	call	_cpct_setPalette
                           2087 ;src/main.c:468: cpct_akp_musicInit(g_song);
   960A 21 00 30      [10] 2088 	ld	hl,#_g_song
   960D E5            [11] 2089 	push	hl
   960E CD 6C 88      [17] 2090 	call	_cpct_akp_musicInit
   9611 F1            [10] 2091 	pop	af
                           2092 ;src/main.c:469: cpct_setInterruptHandler(intHandler);
   9612 21 DD 95      [10] 2093 	ld	hl,#_intHandler
   9615 CD EC 8A      [17] 2094 	call	_cpct_setInterruptHandler
   9618 C9            [10] 2095 	ret
                           2096 ;src/main.c:472: void inicializarJuego() {
                           2097 ;	---------------------------------
                           2098 ; Function inicializarJuego
                           2099 ; ---------------------------------
   9619                    2100 _inicializarJuego::
                           2101 ;src/main.c:474: num_mapa = 0;
   9619 21 5D 8B      [10] 2102 	ld	hl,#_num_mapa + 0
   961C 36 00         [10] 2103 	ld	(hl), #0x00
                           2104 ;src/main.c:475: mapa = mapas[num_mapa];
   961E 21 7B 8B      [10] 2105 	ld	hl, #_mapas + 0
   9621 7E            [ 7] 2106 	ld	a,(hl)
   9622 FD 21 5B 8B   [14] 2107 	ld	iy,#_mapa
   9626 FD 77 00      [19] 2108 	ld	0 (iy),a
   9629 23            [ 6] 2109 	inc	hl
   962A 7E            [ 7] 2110 	ld	a,(hl)
   962B 32 5C 8B      [13] 2111 	ld	(#_mapa + 1),a
                           2112 ;src/main.c:476: cpct_etm_setTileset2x4(g_tileset);
   962E 21 E0 49      [10] 2113 	ld	hl,#_g_tileset
   9631 CD 8F 80      [17] 2114 	call	_cpct_etm_setTileset2x4
                           2115 ;src/main.c:478: dibujarMapa();
   9634 CD 65 8B      [17] 2116 	call	_dibujarMapa
                           2117 ;src/main.c:481: barraPuntuacionInicial();
   9637 CD CC 7B      [17] 2118 	call	_barraPuntuacionInicial
                           2119 ;src/main.c:484: prota.x = prota.px = 4;
   963A 21 4A 8B      [10] 2120 	ld	hl,#(_prota + 0x0002)
   963D 36 04         [10] 2121 	ld	(hl),#0x04
   963F 21 48 8B      [10] 2122 	ld	hl,#_prota
   9642 36 04         [10] 2123 	ld	(hl),#0x04
                           2124 ;src/main.c:485: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   9644 21 4B 8B      [10] 2125 	ld	hl,#(_prota + 0x0003)
   9647 36 68         [10] 2126 	ld	(hl),#0x68
   9649 21 49 8B      [10] 2127 	ld	hl,#(_prota + 0x0001)
   964C 36 68         [10] 2128 	ld	(hl),#0x68
                           2129 ;src/main.c:486: prota.mover  = NO;
   964E 21 4E 8B      [10] 2130 	ld	hl,#(_prota + 0x0006)
   9651 36 00         [10] 2131 	ld	(hl),#0x00
                           2132 ;src/main.c:487: prota.mira=M_derecha;
   9653 21 4F 8B      [10] 2133 	ld	hl,#(_prota + 0x0007)
   9656 36 00         [10] 2134 	ld	(hl),#0x00
                           2135 ;src/main.c:488: prota.sprite = g_hero;
   9658 21 70 70      [10] 2136 	ld	hl,#_g_hero
   965B 22 4C 8B      [16] 2137 	ld	((_prota + 0x0004)), hl
                           2138 ;src/main.c:492: cu.x = cu.px = 0;
   965E 21 52 8B      [10] 2139 	ld	hl,#(_cu + 0x0002)
   9661 36 00         [10] 2140 	ld	(hl),#0x00
   9663 21 50 8B      [10] 2141 	ld	hl,#_cu
   9666 36 00         [10] 2142 	ld	(hl),#0x00
                           2143 ;src/main.c:493: cu.y = cu.py = 0;
   9668 21 53 8B      [10] 2144 	ld	hl,#(_cu + 0x0003)
   966B 36 00         [10] 2145 	ld	(hl),#0x00
   966D 21 51 8B      [10] 2146 	ld	hl,#(_cu + 0x0001)
   9670 36 00         [10] 2147 	ld	(hl),#0x00
                           2148 ;src/main.c:494: cu.lanzado = NO;
   9672 21 56 8B      [10] 2149 	ld	hl,#(_cu + 0x0006)
   9675 36 00         [10] 2150 	ld	(hl),#0x00
                           2151 ;src/main.c:495: cu.mover = NO;
   9677 21 59 8B      [10] 2152 	ld	hl,#(_cu + 0x0009)
   967A 36 00         [10] 2153 	ld	(hl),#0x00
                           2154 ;src/main.c:497: inicializarEnemy();
   967C CD 62 94      [17] 2155 	call	_inicializarEnemy
                           2156 ;src/main.c:499: dibujarProta();
   967F C3 8B 8B      [10] 2157 	jp  _dibujarProta
                           2158 ;src/main.c:502: void main(void) {
                           2159 ;	---------------------------------
                           2160 ; Function main
                           2161 ; ---------------------------------
   9682                    2162 _main::
   9682 DD E5         [15] 2163 	push	ix
   9684 DD 21 00 00   [14] 2164 	ld	ix,#0
   9688 DD 39         [15] 2165 	add	ix,sp
   968A 3B            [ 6] 2166 	dec	sp
                           2167 ;src/main.c:507: inicializarCPC();
   968B CD F0 95      [17] 2168 	call	_inicializarCPC
                           2169 ;src/main.c:509: menuInicio();
   968E CD ED 7A      [17] 2170 	call	_menuInicio
                           2171 ;src/main.c:511: inicializarJuego();
   9691 CD 19 96      [17] 2172 	call	_inicializarJuego
                           2173 ;src/main.c:515: while (1) {
   9694                    2174 00122$:
                           2175 ;src/main.c:517: i = (2 + num_mapa) + 1;
   9694 3A 5D 8B      [13] 2176 	ld	a,(#_num_mapa + 0)
   9697 C6 03         [ 7] 2177 	add	a, #0x03
   9699 DD 77 FF      [19] 2178 	ld	-1 (ix),a
                           2179 ;src/main.c:518: actual = enemy;
                           2180 ;src/main.c:520: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   969C 21 00 2E      [10] 2181 	ld	hl,#_g_tablatrans
   969F E5            [11] 2182 	push	hl
   96A0 2A 5B 8B      [16] 2183 	ld	hl,(_mapa)
   96A3 E5            [11] 2184 	push	hl
   96A4 21 48 8B      [10] 2185 	ld	hl,#_prota
   96A7 E5            [11] 2186 	push	hl
   96A8 21 50 8B      [10] 2187 	ld	hl,#_cu
   96AB E5            [11] 2188 	push	hl
   96AC CD 39 8C      [17] 2189 	call	_comprobarTeclado
   96AF 21 08 00      [10] 2190 	ld	hl,#8
   96B2 39            [11] 2191 	add	hl,sp
   96B3 F9            [ 6] 2192 	ld	sp,hl
                           2193 ;src/main.c:521: moverCuchillo(&cu, mapa);
   96B4 2A 5B 8B      [16] 2194 	ld	hl,(_mapa)
   96B7 E5            [11] 2195 	push	hl
   96B8 21 50 8B      [10] 2196 	ld	hl,#_cu
   96BB E5            [11] 2197 	push	hl
   96BC CD F9 74      [17] 2198 	call	_moverCuchillo
   96BF F1            [10] 2199 	pop	af
   96C0 F1            [10] 2200 	pop	af
                           2201 ;src/main.c:523: while(--i){
   96C1 21 14 8B      [10] 2202 	ld	hl,#_enemy
   96C4 DD 4E FF      [19] 2203 	ld	c,-1 (ix)
   96C7                    2204 00101$:
   96C7 0D            [ 4] 2205 	dec	c
   96C8 79            [ 4] 2206 	ld	a,c
   96C9 B7            [ 4] 2207 	or	a, a
   96CA 28 0F         [12] 2208 	jr	Z,00103$
                           2209 ;src/main.c:524: moverEnemigo(actual);
   96CC E5            [11] 2210 	push	hl
   96CD C5            [11] 2211 	push	bc
   96CE E5            [11] 2212 	push	hl
   96CF CD 15 94      [17] 2213 	call	_moverEnemigo
   96D2 F1            [10] 2214 	pop	af
   96D3 C1            [10] 2215 	pop	bc
   96D4 E1            [10] 2216 	pop	hl
                           2217 ;src/main.c:525: ++actual;
   96D5 11 0D 00      [10] 2218 	ld	de,#0x000D
   96D8 19            [11] 2219 	add	hl,de
   96D9 18 EC         [12] 2220 	jr	00101$
   96DB                    2221 00103$:
                           2222 ;src/main.c:528: actual = enemy;
   96DB 01 14 8B      [10] 2223 	ld	bc,#_enemy
                           2224 ;src/main.c:530: cpct_waitVSYNC();
   96DE C5            [11] 2225 	push	bc
   96DF CD 33 81      [17] 2226 	call	_cpct_waitVSYNC
   96E2 C1            [10] 2227 	pop	bc
                           2228 ;src/main.c:533: if (prota.mover) {
   96E3 3A 4E 8B      [13] 2229 	ld	a, (#(_prota + 0x0006) + 0)
   96E6 B7            [ 4] 2230 	or	a, a
   96E7 28 0A         [12] 2231 	jr	Z,00105$
                           2232 ;src/main.c:534: redibujarProta();
   96E9 C5            [11] 2233 	push	bc
   96EA CD 25 8C      [17] 2234 	call	_redibujarProta
   96ED C1            [10] 2235 	pop	bc
                           2236 ;src/main.c:535: prota.mover = NO;
   96EE 21 4E 8B      [10] 2237 	ld	hl,#(_prota + 0x0006)
   96F1 36 00         [10] 2238 	ld	(hl),#0x00
   96F3                    2239 00105$:
                           2240 ;src/main.c:537: if(cu.lanzado && cu.mover){
   96F3 21 56 8B      [10] 2241 	ld	hl, #(_cu + 0x0006) + 0
   96F6 5E            [ 7] 2242 	ld	e,(hl)
   96F7 7B            [ 4] 2243 	ld	a,e
   96F8 B7            [ 4] 2244 	or	a, a
   96F9 28 1E         [12] 2245 	jr	Z,00110$
   96FB 3A 59 8B      [13] 2246 	ld	a, (#(_cu + 0x0009) + 0)
   96FE B7            [ 4] 2247 	or	a, a
   96FF 28 18         [12] 2248 	jr	Z,00110$
                           2249 ;src/main.c:538: redibujarCuchillo(&cu, g_tablatrans, mapa);
   9701 C5            [11] 2250 	push	bc
   9702 2A 5B 8B      [16] 2251 	ld	hl,(_mapa)
   9705 E5            [11] 2252 	push	hl
   9706 21 00 2E      [10] 2253 	ld	hl,#_g_tablatrans
   9709 E5            [11] 2254 	push	hl
   970A 21 50 8B      [10] 2255 	ld	hl,#_cu
   970D E5            [11] 2256 	push	hl
   970E CD 36 72      [17] 2257 	call	_redibujarCuchillo
   9711 21 06 00      [10] 2258 	ld	hl,#6
   9714 39            [11] 2259 	add	hl,sp
   9715 F9            [ 6] 2260 	ld	sp,hl
   9716 C1            [10] 2261 	pop	bc
   9717 18 23         [12] 2262 	jr	00137$
   9719                    2263 00110$:
                           2264 ;src/main.c:539: }else if (cu.lanzado && !cu.mover){
   9719 7B            [ 4] 2265 	ld	a,e
   971A B7            [ 4] 2266 	or	a, a
   971B 28 1F         [12] 2267 	jr	Z,00137$
   971D 3A 59 8B      [13] 2268 	ld	a, (#(_cu + 0x0009) + 0)
   9720 B7            [ 4] 2269 	or	a, a
   9721 20 19         [12] 2270 	jr	NZ,00137$
                           2271 ;src/main.c:540: borrarCuchillo(&cu, mapa);
   9723 C5            [11] 2272 	push	bc
   9724 2A 5B 8B      [16] 2273 	ld	hl,(_mapa)
   9727 E5            [11] 2274 	push	hl
   9728 21 50 8B      [10] 2275 	ld	hl,#_cu
   972B E5            [11] 2276 	push	hl
   972C CD 92 71      [17] 2277 	call	_borrarCuchillo
   972F F1            [10] 2278 	pop	af
   9730 F1            [10] 2279 	pop	af
   9731 C1            [10] 2280 	pop	bc
                           2281 ;src/main.c:541: cu.x = 0;
   9732 21 50 8B      [10] 2282 	ld	hl,#_cu
   9735 36 00         [10] 2283 	ld	(hl),#0x00
                           2284 ;src/main.c:542: cu.y = 0;
   9737 21 51 8B      [10] 2285 	ld	hl,#(_cu + 0x0001)
   973A 36 00         [10] 2286 	ld	(hl),#0x00
                           2287 ;src/main.c:545: while(--i){
   973C                    2288 00137$:
   973C DD 36 FF 05   [19] 2289 	ld	-1 (ix),#0x05
   9740                    2290 00118$:
   9740 DD 35 FF      [23] 2291 	dec	-1 (ix)
   9743 DD 7E FF      [19] 2292 	ld	a,-1 (ix)
   9746 B7            [ 4] 2293 	or	a, a
   9747 28 71         [12] 2294 	jr	Z,00120$
                           2295 ;src/main.c:546: if(actual->mover){
   9749 C5            [11] 2296 	push	bc
   974A FD E1         [14] 2297 	pop	iy
   974C FD 7E 06      [19] 2298 	ld	a,6 (iy)
   974F B7            [ 4] 2299 	or	a, a
   9750 28 07         [12] 2300 	jr	Z,00114$
                           2301 ;src/main.c:547: redibujarEnemigo(actual);
   9752 C5            [11] 2302 	push	bc
   9753 C5            [11] 2303 	push	bc
   9754 CD 89 8F      [17] 2304 	call	_redibujarEnemigo
   9757 F1            [10] 2305 	pop	af
   9758 C1            [10] 2306 	pop	bc
   9759                    2307 00114$:
                           2308 ;src/main.c:549: if (actual->muerto && actual->muertes == 0){
   9759 C5            [11] 2309 	push	bc
   975A FD E1         [14] 2310 	pop	iy
   975C FD 7E 08      [19] 2311 	ld	a,8 (iy)
   975F B7            [ 4] 2312 	or	a, a
   9760 28 50         [12] 2313 	jr	Z,00116$
   9762 21 0C 00      [10] 2314 	ld	hl,#0x000C
   9765 09            [11] 2315 	add	hl,bc
   9766 EB            [ 4] 2316 	ex	de,hl
   9767 1A            [ 7] 2317 	ld	a,(de)
   9768 B7            [ 4] 2318 	or	a, a
   9769 20 47         [12] 2319 	jr	NZ,00116$
                           2320 ;src/main.c:550: borrarEnemigo(actual);
   976B C5            [11] 2321 	push	bc
   976C D5            [11] 2322 	push	de
   976D C5            [11] 2323 	push	bc
   976E CD F5 8E      [17] 2324 	call	_borrarEnemigo
   9771 F1            [10] 2325 	pop	af
   9772 D1            [10] 2326 	pop	de
   9773 C1            [10] 2327 	pop	bc
                           2328 ;src/main.c:551: dibujarExplosion(actual);
   9774 C5            [11] 2329 	push	bc
   9775 D5            [11] 2330 	push	de
   9776 C5            [11] 2331 	push	bc
   9777 CD 4D 8E      [17] 2332 	call	_dibujarExplosion
   977A F1            [10] 2333 	pop	af
   977B D1            [10] 2334 	pop	de
   977C C1            [10] 2335 	pop	bc
                           2336 ;src/main.c:552: puntuacion_aux = puntuacion;
   977D FD 21 5E 8B   [14] 2337 	ld	iy,#_puntuacion
   9781 FD 6E 00      [19] 2338 	ld	l,0 (iy)
   9784 26 00         [ 7] 2339 	ld	h,#0x00
                           2340 ;src/main.c:553: puntuacion = aumentarPuntuacion(puntuacion_aux);
   9786 C5            [11] 2341 	push	bc
   9787 D5            [11] 2342 	push	de
   9788 E5            [11] 2343 	push	hl
   9789 CD A5 7D      [17] 2344 	call	_aumentarPuntuacion
   978C F1            [10] 2345 	pop	af
   978D D1            [10] 2346 	pop	de
   978E C1            [10] 2347 	pop	bc
   978F FD 21 5E 8B   [14] 2348 	ld	iy,#_puntuacion
   9793 FD 75 00      [19] 2349 	ld	0 (iy),l
                           2350 ;src/main.c:554: modificarPuntuacion(puntuacion);
   9796 FD 21 5E 8B   [14] 2351 	ld	iy,#_puntuacion
   979A FD 6E 00      [19] 2352 	ld	l,0 (iy)
   979D 26 00         [ 7] 2353 	ld	h,#0x00
   979F C5            [11] 2354 	push	bc
   97A0 D5            [11] 2355 	push	de
   97A1 E5            [11] 2356 	push	hl
   97A2 CD 68 7C      [17] 2357 	call	_modificarPuntuacion
   97A5 F1            [10] 2358 	pop	af
   97A6 D1            [10] 2359 	pop	de
   97A7 C1            [10] 2360 	pop	bc
                           2361 ;src/main.c:556: actual->muertes++;
   97A8 1A            [ 7] 2362 	ld	a,(de)
   97A9 3C            [ 4] 2363 	inc	a
   97AA 12            [ 7] 2364 	ld	(de),a
                           2365 ;src/main.c:557: actual->x = 0;
   97AB AF            [ 4] 2366 	xor	a, a
   97AC 02            [ 7] 2367 	ld	(bc),a
                           2368 ;src/main.c:558: actual->y = 0;
   97AD 59            [ 4] 2369 	ld	e, c
   97AE 50            [ 4] 2370 	ld	d, b
   97AF 13            [ 6] 2371 	inc	de
   97B0 AF            [ 4] 2372 	xor	a, a
   97B1 12            [ 7] 2373 	ld	(de),a
   97B2                    2374 00116$:
                           2375 ;src/main.c:560: ++actual;
   97B2 21 0D 00      [10] 2376 	ld	hl,#0x000D
   97B5 09            [11] 2377 	add	hl,bc
   97B6 4D            [ 4] 2378 	ld	c,l
   97B7 44            [ 4] 2379 	ld	b,h
   97B8 18 86         [12] 2380 	jr	00118$
   97BA                    2381 00120$:
                           2382 ;src/main.c:562: cpct_waitVSYNC();
   97BA CD 33 81      [17] 2383 	call	_cpct_waitVSYNC
   97BD C3 94 96      [10] 2384 	jp	00122$
   97C0 33            [ 6] 2385 	inc	sp
   97C1 DD E1         [14] 2386 	pop	ix
   97C3 C9            [10] 2387 	ret
                           2388 	.area _CODE
                           2389 	.area _INITIALIZER
   8B60                    2390 __xinit__mapa:
   8B60 00 00              2391 	.dw #0x0000
   8B62                    2392 __xinit__num_mapa:
   8B62 00                 2393 	.db #0x00	; 0
   8B63                    2394 __xinit__puntuacion:
   8B63 00                 2395 	.db #0x00	; 0
   8B64                    2396 __xinit__vidas:
   8B64 05                 2397 	.db #0x05	; 5
                           2398 	.area _CABS (ABS)
