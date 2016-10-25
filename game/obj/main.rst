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
                             21 	.globl _updateEnemies
                             22 	.globl _engage
                             23 	.globl _lookFor
                             24 	.globl _moverEnemigoSeek
                             25 	.globl _moverEnemigoPatrol
                             26 	.globl _moverEnemigoIzquierda
                             27 	.globl _moverEnemigoDerecha
                             28 	.globl _moverEnemigoAbajo
                             29 	.globl _moverEnemigoArriba
                             30 	.globl _checkEnemyCollision
                             31 	.globl _redibujarEnemigo
                             32 	.globl _borrarEnemigo
                             33 	.globl _borrarExplosion
                             34 	.globl _dibujarExplosion
                             35 	.globl _dibujarEnemigo
                             36 	.globl _checkCollision
                             37 	.globl _comprobarTeclado
                             38 	.globl _redibujarProta
                             39 	.globl _borrarProta
                             40 	.globl _dibujarProta
                             41 	.globl _dibujarMapa
                             42 	.globl _play
                             43 	.globl _pathFinding
                             44 	.globl _moverCuchillo
                             45 	.globl _lanzarCuchillo
                             46 	.globl _redibujarCuchillo
                             47 	.globl _borrarCuchillo
                             48 	.globl _abs
                             49 	.globl _getTilePtr
                             50 	.globl _barraPuntuacionInicial
                             51 	.globl _menuInicio
                             52 	.globl _menuFin
                             53 	.globl _cpct_etm_setTileset2x4
                             54 	.globl _cpct_etm_drawTileBox2x4
                             55 	.globl _cpct_getScreenPtr
                             56 	.globl _cpct_setPALColour
                             57 	.globl _cpct_setPalette
                             58 	.globl _cpct_waitVSYNC
                             59 	.globl _cpct_setVideoMode
                             60 	.globl _cpct_drawSpriteMaskedAlignedTable
                             61 	.globl _cpct_isAnyKeyPressed
                             62 	.globl _cpct_isKeyPressed
                             63 	.globl _cpct_scanKeyboard_if
                             64 	.globl _cpct_disableFirmware
                             65 	.globl _vidas
                             66 	.globl _puntuacion
                             67 	.globl _num_mapa
                             68 	.globl _mapa
                             69 	.globl _i
                             70 	.globl _cu
                             71 	.globl _prota
                             72 	.globl _enemy
                             73 	.globl _patrolY
                             74 	.globl _patrolX
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
   5EF9                      85 _enemy::
   5EF9                      86 	.ds 112
   5F69                      87 _prota::
   5F69                      88 	.ds 8
   5F71                      89 _cu::
   5F71                      90 	.ds 10
   5F7B                      91 _i::
   5F7B                      92 	.ds 1
                             93 ;--------------------------------------------------------
                             94 ; ram data
                             95 ;--------------------------------------------------------
                             96 	.area _INITIALIZED
   6045                      97 _mapa::
   6045                      98 	.ds 2
   6047                      99 _num_mapa::
   6047                     100 	.ds 1
   6048                     101 _puntuacion::
   6048                     102 	.ds 1
   6049                     103 _vidas::
   6049                     104 	.ds 1
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
                            125 ;src/main.c:108: cpctm_createTransparentMaskTable(g_tablatrans, 0x0100, M0, 0);
                            126 ;	---------------------------------
                            127 ; Function dummy_cpct_transparentMaskTable0M0_container
                            128 ; ---------------------------------
   43EF                     129 _dummy_cpct_transparentMaskTable0M0_container::
                            130 	.area _g_tablatrans_ (ABS) 
   0100                     131 	.org 0x0100 
   0100                     132 	 _g_tablatrans::
   0100 FF AA 55 00 AA AA   133 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0108 55 00 55 00 00 00   134 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0110 AA AA 00 00 AA AA   135 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0118 00 00 00 00 00 00   136 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0120 55 00 55 00 00 00   137 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0128 55 00 55 00 00 00   138 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0130 00 00 00 00 00 00   139 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0138 00 00 00 00 00 00   140 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0140 AA AA 00 00 AA AA   141 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0148 00 00 00 00 00 00   142 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0150 AA AA 00 00 AA AA   143 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0158 00 00 00 00 00 00   144 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0160 00 00 00 00 00 00   145 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0168 00 00 00 00 00 00   146 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0170 00 00 00 00 00 00   147 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0178 00 00 00 00 00 00   148 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0180 55 00 55 00 00 00   149 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0188 55 00 55 00 00 00   150 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0190 00 00 00 00 00 00   151 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0198 00 00 00 00 00 00   152 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A0 55 00 55 00 00 00   153 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A8 55 00 55 00 00 00   154 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B0 00 00 00 00 00 00   155 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B8 00 00 00 00 00 00   156 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C0 00 00 00 00 00 00   157 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C8 00 00 00 00 00 00   158 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D0 00 00 00 00 00 00   159 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D8 00 00 00 00 00 00   160 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E0 00 00 00 00 00 00   161 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E8 00 00 00 00 00 00   162 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F0 00 00 00 00 00 00   163 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F8 00 00 00 00 00 00   164 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            165 	.area _CSEG (REL, CON) 
                            166 ;src/main.c:111: void dibujarMapa() {
                            167 ;	---------------------------------
                            168 ; Function dibujarMapa
                            169 ; ---------------------------------
   604F                     170 _dibujarMapa::
                            171 ;src/main.c:114: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, p, mapa);
   604F 2A 45 60      [16]  172 	ld	hl,(_mapa)
   6052 E5            [11]  173 	push	hl
   6053 21 F0 C0      [10]  174 	ld	hl,#0xC0F0
   6056 E5            [11]  175 	push	hl
   6057 21 2C 28      [10]  176 	ld	hl,#0x282C
   605A E5            [11]  177 	push	hl
   605B 2E 00         [ 7]  178 	ld	l, #0x00
   605D E5            [11]  179 	push	hl
   605E AF            [ 4]  180 	xor	a, a
   605F F5            [11]  181 	push	af
   6060 33            [ 6]  182 	inc	sp
   6061 CD 80 53      [17]  183 	call	_cpct_etm_drawTileBox2x4
   6064 C9            [10]  184 	ret
   6065                     185 _mapas:
   6065 C0 10               186 	.dw _g_map1
   6067 E0 09               187 	.dw _g_map2
   6069 00 03               188 	.dw _g_map3
   606B                     189 _spawnX:
   606B 00                  190 	.db #0x00	; 0
   606C 24                  191 	.db #0x24	; 36
   606D 47                  192 	.db #0x47	; 71	'G'
   606E 32                  193 	.db #0x32	; 50	'2'
   606F 18                  194 	.db #0x18	; 24
   6070                     195 _spawnY:
   6070 00                  196 	.db #0x00	; 0
   6071 59                  197 	.db #0x59	; 89	'Y'
   6072 72                  198 	.db #0x72	; 114	'r'
   6073 9A                  199 	.db #0x9A	; 154
   6074 68                  200 	.db #0x68	; 104	'h'
   6075                     201 _patrolX:
   6075 00                  202 	.db #0x00	; 0
   6076 00                  203 	.db #0x00	; 0
   6077 00                  204 	.db #0x00	; 0
   6078 00                  205 	.db #0x00	; 0
   6079 00                  206 	.db #0x00	; 0
   607A 00                  207 	.db #0x00	; 0
   607B 14                  208 	.db #0x14	; 20
   607C 47                  209 	.db #0x47	; 71	'G'
   607D 00                  210 	.db #0x00	; 0
   607E 00                  211 	.db #0x00	; 0
   607F 00                  212 	.db #0x00	; 0
   6080 00                  213 	.db #0x00	; 0
   6081 00                  214 	.db #0x00	; 0
   6082 00                  215 	.db #0x00	; 0
   6083 00                  216 	.db #0x00	; 0
   6084 00                  217 	.db #0x00	; 0
   6085 00                  218 	.db #0x00	; 0
   6086 00                  219 	.db #0x00	; 0
   6087 00                  220 	.db #0x00	; 0
   6088 00                  221 	.db #0x00	; 0
   6089                     222 _patrolY:
   6089 00                  223 	.db #0x00	; 0
   608A 00                  224 	.db #0x00	; 0
   608B 00                  225 	.db #0x00	; 0
   608C 00                  226 	.db #0x00	; 0
   608D 00                  227 	.db #0x00	; 0
   608E 00                  228 	.db #0x00	; 0
   608F 59                  229 	.db #0x59	; 89	'Y'
   6090 9C                  230 	.db #0x9C	; 156
   6091 00                  231 	.db #0x00	; 0
   6092 00                  232 	.db #0x00	; 0
   6093 00                  233 	.db #0x00	; 0
   6094 00                  234 	.db #0x00	; 0
   6095 00                  235 	.db #0x00	; 0
   6096 00                  236 	.db #0x00	; 0
   6097 00                  237 	.db #0x00	; 0
   6098 00                  238 	.db #0x00	; 0
   6099 00                  239 	.db #0x00	; 0
   609A 00                  240 	.db #0x00	; 0
   609B 00                  241 	.db #0x00	; 0
   609C 00                  242 	.db #0x00	; 0
                            243 ;src/main.c:117: void dibujarProta() {
                            244 ;	---------------------------------
                            245 ; Function dibujarProta
                            246 ; ---------------------------------
   609D                     247 _dibujarProta::
                            248 ;src/main.c:118: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   609D 21 6A 5F      [10]  249 	ld	hl, #_prota + 1
   60A0 56            [ 7]  250 	ld	d,(hl)
   60A1 21 69 5F      [10]  251 	ld	hl, #_prota + 0
   60A4 46            [ 7]  252 	ld	b,(hl)
   60A5 D5            [11]  253 	push	de
   60A6 33            [ 6]  254 	inc	sp
   60A7 C5            [11]  255 	push	bc
   60A8 33            [ 6]  256 	inc	sp
   60A9 21 00 C0      [10]  257 	ld	hl,#0xC000
   60AC E5            [11]  258 	push	hl
   60AD CD 9E 5E      [17]  259 	call	_cpct_getScreenPtr
   60B0 EB            [ 4]  260 	ex	de,hl
                            261 ;src/main.c:119: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   60B1 ED 4B 6D 5F   [20]  262 	ld	bc, (#_prota + 4)
   60B5 21 00 01      [10]  263 	ld	hl,#_g_tablatrans
   60B8 E5            [11]  264 	push	hl
   60B9 21 07 16      [10]  265 	ld	hl,#0x1607
   60BC E5            [11]  266 	push	hl
   60BD D5            [11]  267 	push	de
   60BE C5            [11]  268 	push	bc
   60BF CD BE 5E      [17]  269 	call	_cpct_drawSpriteMaskedAlignedTable
   60C2 C9            [10]  270 	ret
                            271 ;src/main.c:122: void borrarProta() {
                            272 ;	---------------------------------
                            273 ; Function borrarProta
                            274 ; ---------------------------------
   60C3                     275 _borrarProta::
   60C3 DD E5         [15]  276 	push	ix
   60C5 DD 21 00 00   [14]  277 	ld	ix,#0
   60C9 DD 39         [15]  278 	add	ix,sp
   60CB F5            [11]  279 	push	af
   60CC 3B            [ 6]  280 	dec	sp
                            281 ;src/main.c:126: u8 w = 4 + (prota.px & 1);
   60CD 21 6B 5F      [10]  282 	ld	hl, #_prota + 2
   60D0 4E            [ 7]  283 	ld	c,(hl)
   60D1 79            [ 4]  284 	ld	a,c
   60D2 E6 01         [ 7]  285 	and	a, #0x01
   60D4 47            [ 4]  286 	ld	b,a
   60D5 04            [ 4]  287 	inc	b
   60D6 04            [ 4]  288 	inc	b
   60D7 04            [ 4]  289 	inc	b
   60D8 04            [ 4]  290 	inc	b
                            291 ;src/main.c:129: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   60D9 21 6C 5F      [10]  292 	ld	hl, #_prota + 3
   60DC 5E            [ 7]  293 	ld	e,(hl)
   60DD CB 4B         [ 8]  294 	bit	1, e
   60DF 28 04         [12]  295 	jr	Z,00103$
   60E1 3E 01         [ 7]  296 	ld	a,#0x01
   60E3 18 02         [12]  297 	jr	00104$
   60E5                     298 00103$:
   60E5 3E 00         [ 7]  299 	ld	a,#0x00
   60E7                     300 00104$:
   60E7 C6 06         [ 7]  301 	add	a, #0x06
   60E9 DD 77 FD      [19]  302 	ld	-3 (ix),a
                            303 ;src/main.c:131: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   60EC FD 2A 45 60   [20]  304 	ld	iy,(_mapa)
   60F0 16 00         [ 7]  305 	ld	d,#0x00
   60F2 7B            [ 4]  306 	ld	a,e
   60F3 C6 E8         [ 7]  307 	add	a,#0xE8
   60F5 DD 77 FE      [19]  308 	ld	-2 (ix),a
   60F8 7A            [ 4]  309 	ld	a,d
   60F9 CE FF         [ 7]  310 	adc	a,#0xFF
   60FB DD 77 FF      [19]  311 	ld	-1 (ix),a
   60FE DD 6E FE      [19]  312 	ld	l,-2 (ix)
   6101 DD 66 FF      [19]  313 	ld	h,-1 (ix)
   6104 DD CB FF 7E   [20]  314 	bit	7, -1 (ix)
   6108 28 04         [12]  315 	jr	Z,00105$
   610A 21 EB FF      [10]  316 	ld	hl,#0xFFEB
   610D 19            [11]  317 	add	hl,de
   610E                     318 00105$:
   610E CB 2C         [ 8]  319 	sra	h
   6110 CB 1D         [ 8]  320 	rr	l
   6112 CB 2C         [ 8]  321 	sra	h
   6114 CB 1D         [ 8]  322 	rr	l
   6116 55            [ 4]  323 	ld	d,l
   6117 CB 39         [ 8]  324 	srl	c
   6119 FD E5         [15]  325 	push	iy
   611B 21 F0 C0      [10]  326 	ld	hl,#0xC0F0
   611E E5            [11]  327 	push	hl
   611F 3E 28         [ 7]  328 	ld	a,#0x28
   6121 F5            [11]  329 	push	af
   6122 33            [ 6]  330 	inc	sp
   6123 DD 7E FD      [19]  331 	ld	a,-3 (ix)
   6126 F5            [11]  332 	push	af
   6127 33            [ 6]  333 	inc	sp
   6128 C5            [11]  334 	push	bc
   6129 33            [ 6]  335 	inc	sp
   612A D5            [11]  336 	push	de
   612B 33            [ 6]  337 	inc	sp
   612C 79            [ 4]  338 	ld	a,c
   612D F5            [11]  339 	push	af
   612E 33            [ 6]  340 	inc	sp
   612F CD 80 53      [17]  341 	call	_cpct_etm_drawTileBox2x4
   6132 DD F9         [10]  342 	ld	sp, ix
   6134 DD E1         [14]  343 	pop	ix
   6136 C9            [10]  344 	ret
                            345 ;src/main.c:134: void redibujarProta() {
                            346 ;	---------------------------------
                            347 ; Function redibujarProta
                            348 ; ---------------------------------
   6137                     349 _redibujarProta::
                            350 ;src/main.c:135: borrarProta();
   6137 CD C3 60      [17]  351 	call	_borrarProta
                            352 ;src/main.c:136: prota.px = prota.x;
   613A 01 6B 5F      [10]  353 	ld	bc,#_prota + 2
   613D 3A 69 5F      [13]  354 	ld	a, (#_prota + 0)
   6140 02            [ 7]  355 	ld	(bc),a
                            356 ;src/main.c:137: prota.py = prota.y;
   6141 01 6C 5F      [10]  357 	ld	bc,#_prota + 3
   6144 3A 6A 5F      [13]  358 	ld	a, (#_prota + 1)
   6147 02            [ 7]  359 	ld	(bc),a
                            360 ;src/main.c:138: dibujarProta();
   6148 C3 9D 60      [10]  361 	jp  _dibujarProta
                            362 ;src/main.c:141: void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
                            363 ;	---------------------------------
                            364 ; Function comprobarTeclado
                            365 ; ---------------------------------
   614B                     366 _comprobarTeclado::
                            367 ;src/main.c:142: cpct_scanKeyboard_if();
   614B CD D8 54      [17]  368 	call	_cpct_scanKeyboard_if
                            369 ;src/main.c:144: if (cpct_isAnyKeyPressed()) {
   614E CD CB 54      [17]  370 	call	_cpct_isAnyKeyPressed
   6151 7D            [ 4]  371 	ld	a,l
   6152 B7            [ 4]  372 	or	a, a
   6153 C8            [11]  373 	ret	Z
                            374 ;src/main.c:145: if (cpct_isKeyPressed(Key_CursorLeft)){
   6154 21 01 01      [10]  375 	ld	hl,#0x0101
   6157 CD 9F 52      [17]  376 	call	_cpct_isKeyPressed
   615A 7D            [ 4]  377 	ld	a,l
   615B B7            [ 4]  378 	or	a, a
                            379 ;src/main.c:146: moverIzquierda();
   615C C2 4E 76      [10]  380 	jp	NZ,_moverIzquierda
                            381 ;src/main.c:147: }else if (cpct_isKeyPressed(Key_CursorRight)){
   615F 21 00 02      [10]  382 	ld	hl,#0x0200
   6162 CD 9F 52      [17]  383 	call	_cpct_isKeyPressed
   6165 7D            [ 4]  384 	ld	a,l
   6166 B7            [ 4]  385 	or	a, a
                            386 ;src/main.c:148: moverDerecha();
   6167 C2 73 76      [10]  387 	jp	NZ,_moverDerecha
                            388 ;src/main.c:149: }else if (cpct_isKeyPressed(Key_CursorUp)){
   616A 21 00 01      [10]  389 	ld	hl,#0x0100
   616D CD 9F 52      [17]  390 	call	_cpct_isKeyPressed
   6170 7D            [ 4]  391 	ld	a,l
   6171 B7            [ 4]  392 	or	a, a
                            393 ;src/main.c:150: moverArriba();
   6172 C2 B8 76      [10]  394 	jp	NZ,_moverArriba
                            395 ;src/main.c:151: }else if (cpct_isKeyPressed(Key_CursorDown)){
   6175 21 00 04      [10]  396 	ld	hl,#0x0400
   6178 CD 9F 52      [17]  397 	call	_cpct_isKeyPressed
   617B 7D            [ 4]  398 	ld	a,l
   617C B7            [ 4]  399 	or	a, a
                            400 ;src/main.c:152: moverAbajo();
   617D C2 DC 76      [10]  401 	jp	NZ,_moverAbajo
                            402 ;src/main.c:153: }else if (cpct_isKeyPressed(Key_Space)){
   6180 21 05 80      [10]  403 	ld	hl,#0x8005
   6183 CD 9F 52      [17]  404 	call	_cpct_isKeyPressed
   6186 7D            [ 4]  405 	ld	a,l
   6187 B7            [ 4]  406 	or	a, a
   6188 C8            [11]  407 	ret	Z
                            408 ;src/main.c:154: lanzarCuchillo(cu, prota, mapa, g_tablatrans);
   6189 21 08 00      [10]  409 	ld	hl, #8
   618C 39            [11]  410 	add	hl, sp
   618D 4E            [ 7]  411 	ld	c, (hl)
   618E 23            [ 6]  412 	inc	hl
   618F 46            [ 7]  413 	ld	b, (hl)
   6190 C5            [11]  414 	push	bc
   6191 21 08 00      [10]  415 	ld	hl, #8
   6194 39            [11]  416 	add	hl, sp
   6195 4E            [ 7]  417 	ld	c, (hl)
   6196 23            [ 6]  418 	inc	hl
   6197 46            [ 7]  419 	ld	b, (hl)
   6198 C5            [11]  420 	push	bc
   6199 21 08 00      [10]  421 	ld	hl, #8
   619C 39            [11]  422 	add	hl, sp
   619D 4E            [ 7]  423 	ld	c, (hl)
   619E 23            [ 6]  424 	inc	hl
   619F 46            [ 7]  425 	ld	b, (hl)
   61A0 C5            [11]  426 	push	bc
   61A1 21 08 00      [10]  427 	ld	hl, #8
   61A4 39            [11]  428 	add	hl, sp
   61A5 4E            [ 7]  429 	ld	c, (hl)
   61A6 23            [ 6]  430 	inc	hl
   61A7 46            [ 7]  431 	ld	b, (hl)
   61A8 C5            [11]  432 	push	bc
   61A9 CD 6C 40      [17]  433 	call	_lanzarCuchillo
   61AC 21 08 00      [10]  434 	ld	hl,#8
   61AF 39            [11]  435 	add	hl,sp
   61B0 F9            [ 6]  436 	ld	sp,hl
   61B1 C9            [10]  437 	ret
                            438 ;src/main.c:159: u8 checkCollision(u8 direction) { // check optimization
                            439 ;	---------------------------------
                            440 ; Function checkCollision
                            441 ; ---------------------------------
   61B2                     442 _checkCollision::
   61B2 DD E5         [15]  443 	push	ix
   61B4 DD 21 00 00   [14]  444 	ld	ix,#0
   61B8 DD 39         [15]  445 	add	ix,sp
   61BA F5            [11]  446 	push	af
                            447 ;src/main.c:160: u8 *headTile=0, *feetTile=0, *waistTile=0;
   61BB 21 00 00      [10]  448 	ld	hl,#0x0000
   61BE E3            [19]  449 	ex	(sp), hl
   61BF 11 00 00      [10]  450 	ld	de,#0x0000
   61C2 01 00 00      [10]  451 	ld	bc,#0x0000
                            452 ;src/main.c:162: switch (direction) {
   61C5 3E 03         [ 7]  453 	ld	a,#0x03
   61C7 DD 96 04      [19]  454 	sub	a, 4 (ix)
   61CA DA 06 63      [10]  455 	jp	C,00105$
   61CD DD 5E 04      [19]  456 	ld	e,4 (ix)
   61D0 16 00         [ 7]  457 	ld	d,#0x00
   61D2 21 D9 61      [10]  458 	ld	hl,#00124$
   61D5 19            [11]  459 	add	hl,de
   61D6 19            [11]  460 	add	hl,de
   61D7 19            [11]  461 	add	hl,de
   61D8 E9            [ 4]  462 	jp	(hl)
   61D9                     463 00124$:
   61D9 C3 E5 61      [10]  464 	jp	00101$
   61DC C3 3E 62      [10]  465 	jp	00102$
   61DF C3 8E 62      [10]  466 	jp	00103$
   61E2 C3 CB 62      [10]  467 	jp	00104$
                            468 ;src/main.c:163: case 0:
   61E5                     469 00101$:
                            470 ;src/main.c:164: headTile  = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y);
   61E5 21 6A 5F      [10]  471 	ld	hl, #(_prota + 0x0001) + 0
   61E8 4E            [ 7]  472 	ld	c,(hl)
   61E9 3A 69 5F      [13]  473 	ld	a, (#_prota + 0)
   61EC 47            [ 4]  474 	ld	b,a
   61ED 04            [ 4]  475 	inc	b
   61EE 04            [ 4]  476 	inc	b
   61EF 04            [ 4]  477 	inc	b
   61F0 04            [ 4]  478 	inc	b
   61F1 79            [ 4]  479 	ld	a,c
   61F2 F5            [11]  480 	push	af
   61F3 33            [ 6]  481 	inc	sp
   61F4 C5            [11]  482 	push	bc
   61F5 33            [ 6]  483 	inc	sp
   61F6 2A 45 60      [16]  484 	ld	hl,(_mapa)
   61F9 E5            [11]  485 	push	hl
   61FA CD B5 49      [17]  486 	call	_getTilePtr
   61FD F1            [10]  487 	pop	af
   61FE F1            [10]  488 	pop	af
   61FF 33            [ 6]  489 	inc	sp
   6200 33            [ 6]  490 	inc	sp
   6201 E5            [11]  491 	push	hl
                            492 ;src/main.c:165: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   6202 3A 6A 5F      [13]  493 	ld	a, (#(_prota + 0x0001) + 0)
   6205 C6 14         [ 7]  494 	add	a, #0x14
   6207 4F            [ 4]  495 	ld	c,a
   6208 21 69 5F      [10]  496 	ld	hl, #_prota + 0
   620B 46            [ 7]  497 	ld	b,(hl)
   620C 04            [ 4]  498 	inc	b
   620D 04            [ 4]  499 	inc	b
   620E 04            [ 4]  500 	inc	b
   620F 04            [ 4]  501 	inc	b
   6210 79            [ 4]  502 	ld	a,c
   6211 F5            [11]  503 	push	af
   6212 33            [ 6]  504 	inc	sp
   6213 C5            [11]  505 	push	bc
   6214 33            [ 6]  506 	inc	sp
   6215 2A 45 60      [16]  507 	ld	hl,(_mapa)
   6218 E5            [11]  508 	push	hl
   6219 CD B5 49      [17]  509 	call	_getTilePtr
   621C F1            [10]  510 	pop	af
   621D F1            [10]  511 	pop	af
   621E EB            [ 4]  512 	ex	de,hl
                            513 ;src/main.c:166: waistTile = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   621F 3A 6A 5F      [13]  514 	ld	a, (#(_prota + 0x0001) + 0)
   6222 C6 0B         [ 7]  515 	add	a, #0x0B
   6224 47            [ 4]  516 	ld	b,a
   6225 3A 69 5F      [13]  517 	ld	a, (#_prota + 0)
   6228 C6 04         [ 7]  518 	add	a, #0x04
   622A D5            [11]  519 	push	de
   622B C5            [11]  520 	push	bc
   622C 33            [ 6]  521 	inc	sp
   622D F5            [11]  522 	push	af
   622E 33            [ 6]  523 	inc	sp
   622F 2A 45 60      [16]  524 	ld	hl,(_mapa)
   6232 E5            [11]  525 	push	hl
   6233 CD B5 49      [17]  526 	call	_getTilePtr
   6236 F1            [10]  527 	pop	af
   6237 F1            [10]  528 	pop	af
   6238 4D            [ 4]  529 	ld	c,l
   6239 44            [ 4]  530 	ld	b,h
   623A D1            [10]  531 	pop	de
                            532 ;src/main.c:167: break;
   623B C3 06 63      [10]  533 	jp	00105$
                            534 ;src/main.c:168: case 1:
   623E                     535 00102$:
                            536 ;src/main.c:169: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
   623E 21 6A 5F      [10]  537 	ld	hl, #(_prota + 0x0001) + 0
   6241 56            [ 7]  538 	ld	d,(hl)
   6242 21 69 5F      [10]  539 	ld	hl, #_prota + 0
   6245 46            [ 7]  540 	ld	b,(hl)
   6246 05            [ 4]  541 	dec	b
   6247 D5            [11]  542 	push	de
   6248 33            [ 6]  543 	inc	sp
   6249 C5            [11]  544 	push	bc
   624A 33            [ 6]  545 	inc	sp
   624B 2A 45 60      [16]  546 	ld	hl,(_mapa)
   624E E5            [11]  547 	push	hl
   624F CD B5 49      [17]  548 	call	_getTilePtr
   6252 F1            [10]  549 	pop	af
   6253 F1            [10]  550 	pop	af
   6254 33            [ 6]  551 	inc	sp
   6255 33            [ 6]  552 	inc	sp
   6256 E5            [11]  553 	push	hl
                            554 ;src/main.c:170: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
   6257 3A 6A 5F      [13]  555 	ld	a, (#(_prota + 0x0001) + 0)
   625A C6 14         [ 7]  556 	add	a, #0x14
   625C 57            [ 4]  557 	ld	d,a
   625D 21 69 5F      [10]  558 	ld	hl, #_prota + 0
   6260 46            [ 7]  559 	ld	b,(hl)
   6261 05            [ 4]  560 	dec	b
   6262 D5            [11]  561 	push	de
   6263 33            [ 6]  562 	inc	sp
   6264 C5            [11]  563 	push	bc
   6265 33            [ 6]  564 	inc	sp
   6266 2A 45 60      [16]  565 	ld	hl,(_mapa)
   6269 E5            [11]  566 	push	hl
   626A CD B5 49      [17]  567 	call	_getTilePtr
   626D F1            [10]  568 	pop	af
   626E F1            [10]  569 	pop	af
   626F EB            [ 4]  570 	ex	de,hl
                            571 ;src/main.c:171: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
   6270 3A 6A 5F      [13]  572 	ld	a, (#(_prota + 0x0001) + 0)
   6273 C6 0B         [ 7]  573 	add	a, #0x0B
   6275 47            [ 4]  574 	ld	b,a
   6276 3A 69 5F      [13]  575 	ld	a, (#_prota + 0)
   6279 C6 FF         [ 7]  576 	add	a,#0xFF
   627B D5            [11]  577 	push	de
   627C C5            [11]  578 	push	bc
   627D 33            [ 6]  579 	inc	sp
   627E F5            [11]  580 	push	af
   627F 33            [ 6]  581 	inc	sp
   6280 2A 45 60      [16]  582 	ld	hl,(_mapa)
   6283 E5            [11]  583 	push	hl
   6284 CD B5 49      [17]  584 	call	_getTilePtr
   6287 F1            [10]  585 	pop	af
   6288 F1            [10]  586 	pop	af
   6289 4D            [ 4]  587 	ld	c,l
   628A 44            [ 4]  588 	ld	b,h
   628B D1            [10]  589 	pop	de
                            590 ;src/main.c:172: break;
   628C 18 78         [12]  591 	jr	00105$
                            592 ;src/main.c:173: case 2:
   628E                     593 00103$:
                            594 ;src/main.c:174: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
   628E 3A 6A 5F      [13]  595 	ld	a, (#(_prota + 0x0001) + 0)
   6291 C6 FE         [ 7]  596 	add	a,#0xFE
   6293 21 69 5F      [10]  597 	ld	hl, #_prota + 0
   6296 56            [ 7]  598 	ld	d,(hl)
   6297 C5            [11]  599 	push	bc
   6298 F5            [11]  600 	push	af
   6299 33            [ 6]  601 	inc	sp
   629A D5            [11]  602 	push	de
   629B 33            [ 6]  603 	inc	sp
   629C 2A 45 60      [16]  604 	ld	hl,(_mapa)
   629F E5            [11]  605 	push	hl
   62A0 CD B5 49      [17]  606 	call	_getTilePtr
   62A3 F1            [10]  607 	pop	af
   62A4 F1            [10]  608 	pop	af
   62A5 C1            [10]  609 	pop	bc
   62A6 33            [ 6]  610 	inc	sp
   62A7 33            [ 6]  611 	inc	sp
   62A8 E5            [11]  612 	push	hl
                            613 ;src/main.c:175: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
   62A9 21 6A 5F      [10]  614 	ld	hl, #(_prota + 0x0001) + 0
   62AC 56            [ 7]  615 	ld	d,(hl)
   62AD 15            [ 4]  616 	dec	d
   62AE 15            [ 4]  617 	dec	d
   62AF 3A 69 5F      [13]  618 	ld	a, (#_prota + 0)
   62B2 C6 03         [ 7]  619 	add	a, #0x03
   62B4 C5            [11]  620 	push	bc
   62B5 D5            [11]  621 	push	de
   62B6 33            [ 6]  622 	inc	sp
   62B7 F5            [11]  623 	push	af
   62B8 33            [ 6]  624 	inc	sp
   62B9 2A 45 60      [16]  625 	ld	hl,(_mapa)
   62BC E5            [11]  626 	push	hl
   62BD CD B5 49      [17]  627 	call	_getTilePtr
   62C0 F1            [10]  628 	pop	af
   62C1 F1            [10]  629 	pop	af
   62C2 EB            [ 4]  630 	ex	de,hl
   62C3 C1            [10]  631 	pop	bc
                            632 ;src/main.c:176: *waistTile = 0;
   62C4 21 00 00      [10]  633 	ld	hl,#0x0000
   62C7 36 00         [10]  634 	ld	(hl),#0x00
                            635 ;src/main.c:177: break;
   62C9 18 3B         [12]  636 	jr	00105$
                            637 ;src/main.c:178: case 3:
   62CB                     638 00104$:
                            639 ;src/main.c:179: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
   62CB 3A 6A 5F      [13]  640 	ld	a, (#(_prota + 0x0001) + 0)
   62CE C6 16         [ 7]  641 	add	a, #0x16
   62D0 21 69 5F      [10]  642 	ld	hl, #_prota + 0
   62D3 56            [ 7]  643 	ld	d,(hl)
   62D4 C5            [11]  644 	push	bc
   62D5 F5            [11]  645 	push	af
   62D6 33            [ 6]  646 	inc	sp
   62D7 D5            [11]  647 	push	de
   62D8 33            [ 6]  648 	inc	sp
   62D9 2A 45 60      [16]  649 	ld	hl,(_mapa)
   62DC E5            [11]  650 	push	hl
   62DD CD B5 49      [17]  651 	call	_getTilePtr
   62E0 F1            [10]  652 	pop	af
   62E1 F1            [10]  653 	pop	af
   62E2 C1            [10]  654 	pop	bc
   62E3 33            [ 6]  655 	inc	sp
   62E4 33            [ 6]  656 	inc	sp
   62E5 E5            [11]  657 	push	hl
                            658 ;src/main.c:180: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   62E6 3A 6A 5F      [13]  659 	ld	a, (#(_prota + 0x0001) + 0)
   62E9 C6 16         [ 7]  660 	add	a, #0x16
   62EB 57            [ 4]  661 	ld	d,a
   62EC 3A 69 5F      [13]  662 	ld	a, (#_prota + 0)
   62EF C6 03         [ 7]  663 	add	a, #0x03
   62F1 C5            [11]  664 	push	bc
   62F2 D5            [11]  665 	push	de
   62F3 33            [ 6]  666 	inc	sp
   62F4 F5            [11]  667 	push	af
   62F5 33            [ 6]  668 	inc	sp
   62F6 2A 45 60      [16]  669 	ld	hl,(_mapa)
   62F9 E5            [11]  670 	push	hl
   62FA CD B5 49      [17]  671 	call	_getTilePtr
   62FD F1            [10]  672 	pop	af
   62FE F1            [10]  673 	pop	af
   62FF EB            [ 4]  674 	ex	de,hl
   6300 C1            [10]  675 	pop	bc
                            676 ;src/main.c:181: *waistTile = 0;
   6301 21 00 00      [10]  677 	ld	hl,#0x0000
   6304 36 00         [10]  678 	ld	(hl),#0x00
                            679 ;src/main.c:183: }
   6306                     680 00105$:
                            681 ;src/main.c:185: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   6306 E1            [10]  682 	pop	hl
   6307 E5            [11]  683 	push	hl
   6308 6E            [ 7]  684 	ld	l,(hl)
   6309 3E 02         [ 7]  685 	ld	a,#0x02
   630B 95            [ 4]  686 	sub	a, l
   630C 38 0E         [12]  687 	jr	C,00106$
   630E 1A            [ 7]  688 	ld	a,(de)
   630F 5F            [ 4]  689 	ld	e,a
   6310 3E 02         [ 7]  690 	ld	a,#0x02
   6312 93            [ 4]  691 	sub	a, e
   6313 38 07         [12]  692 	jr	C,00106$
   6315 0A            [ 7]  693 	ld	a,(bc)
   6316 4F            [ 4]  694 	ld	c,a
   6317 3E 02         [ 7]  695 	ld	a,#0x02
   6319 91            [ 4]  696 	sub	a, c
   631A 30 04         [12]  697 	jr	NC,00107$
   631C                     698 00106$:
                            699 ;src/main.c:186: return 1;
   631C 2E 01         [ 7]  700 	ld	l,#0x01
   631E 18 02         [12]  701 	jr	00110$
   6320                     702 00107$:
                            703 ;src/main.c:188: return 0;
   6320 2E 00         [ 7]  704 	ld	l,#0x00
   6322                     705 00110$:
   6322 DD F9         [10]  706 	ld	sp, ix
   6324 DD E1         [14]  707 	pop	ix
   6326 C9            [10]  708 	ret
                            709 ;src/main.c:191: void dibujarEnemigo(TEnemy *enemy) {
                            710 ;	---------------------------------
                            711 ; Function dibujarEnemigo
                            712 ; ---------------------------------
   6327                     713 _dibujarEnemigo::
   6327 DD E5         [15]  714 	push	ix
   6329 DD 21 00 00   [14]  715 	ld	ix,#0
   632D DD 39         [15]  716 	add	ix,sp
                            717 ;src/main.c:192: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   632F DD 4E 04      [19]  718 	ld	c,4 (ix)
   6332 DD 46 05      [19]  719 	ld	b,5 (ix)
   6335 69            [ 4]  720 	ld	l, c
   6336 60            [ 4]  721 	ld	h, b
   6337 23            [ 6]  722 	inc	hl
   6338 56            [ 7]  723 	ld	d,(hl)
   6339 0A            [ 7]  724 	ld	a,(bc)
   633A C5            [11]  725 	push	bc
   633B D5            [11]  726 	push	de
   633C 33            [ 6]  727 	inc	sp
   633D F5            [11]  728 	push	af
   633E 33            [ 6]  729 	inc	sp
   633F 21 00 C0      [10]  730 	ld	hl,#0xC000
   6342 E5            [11]  731 	push	hl
   6343 CD 9E 5E      [17]  732 	call	_cpct_getScreenPtr
   6346 EB            [ 4]  733 	ex	de,hl
                            734 ;src/main.c:193: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   6347 E1            [10]  735 	pop	hl
   6348 01 04 00      [10]  736 	ld	bc, #0x0004
   634B 09            [11]  737 	add	hl, bc
   634C 4E            [ 7]  738 	ld	c,(hl)
   634D 23            [ 6]  739 	inc	hl
   634E 46            [ 7]  740 	ld	b,(hl)
   634F 21 00 01      [10]  741 	ld	hl,#_g_tablatrans
   6352 E5            [11]  742 	push	hl
   6353 21 04 16      [10]  743 	ld	hl,#0x1604
   6356 E5            [11]  744 	push	hl
   6357 D5            [11]  745 	push	de
   6358 C5            [11]  746 	push	bc
   6359 CD BE 5E      [17]  747 	call	_cpct_drawSpriteMaskedAlignedTable
   635C DD E1         [14]  748 	pop	ix
   635E C9            [10]  749 	ret
                            750 ;src/main.c:196: void dibujarExplosion(TEnemy *enemy) {
                            751 ;	---------------------------------
                            752 ; Function dibujarExplosion
                            753 ; ---------------------------------
   635F                     754 _dibujarExplosion::
   635F DD E5         [15]  755 	push	ix
   6361 DD 21 00 00   [14]  756 	ld	ix,#0
   6365 DD 39         [15]  757 	add	ix,sp
                            758 ;src/main.c:197: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   6367 DD 4E 04      [19]  759 	ld	c,4 (ix)
   636A DD 46 05      [19]  760 	ld	b,5 (ix)
   636D 69            [ 4]  761 	ld	l, c
   636E 60            [ 4]  762 	ld	h, b
   636F 23            [ 6]  763 	inc	hl
   6370 56            [ 7]  764 	ld	d,(hl)
   6371 0A            [ 7]  765 	ld	a,(bc)
   6372 47            [ 4]  766 	ld	b,a
   6373 D5            [11]  767 	push	de
   6374 33            [ 6]  768 	inc	sp
   6375 C5            [11]  769 	push	bc
   6376 33            [ 6]  770 	inc	sp
   6377 21 00 C0      [10]  771 	ld	hl,#0xC000
   637A E5            [11]  772 	push	hl
   637B CD 9E 5E      [17]  773 	call	_cpct_getScreenPtr
   637E 4D            [ 4]  774 	ld	c,l
   637F 44            [ 4]  775 	ld	b,h
                            776 ;src/main.c:198: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   6380 11 00 01      [10]  777 	ld	de,#_g_tablatrans+0
   6383 D5            [11]  778 	push	de
   6384 21 04 16      [10]  779 	ld	hl,#0x1604
   6387 E5            [11]  780 	push	hl
   6388 C5            [11]  781 	push	bc
   6389 21 70 19      [10]  782 	ld	hl,#_g_explosion
   638C E5            [11]  783 	push	hl
   638D CD BE 5E      [17]  784 	call	_cpct_drawSpriteMaskedAlignedTable
   6390 DD E1         [14]  785 	pop	ix
   6392 C9            [10]  786 	ret
                            787 ;src/main.c:201: void borrarExplosion(TEnemy *enemy) {
                            788 ;	---------------------------------
                            789 ; Function borrarExplosion
                            790 ; ---------------------------------
   6393                     791 _borrarExplosion::
   6393 DD E5         [15]  792 	push	ix
   6395 DD 21 00 00   [14]  793 	ld	ix,#0
   6399 DD 39         [15]  794 	add	ix,sp
   639B F5            [11]  795 	push	af
   639C 3B            [ 6]  796 	dec	sp
                            797 ;src/main.c:204: u8 w = 4 + (enemy->px & 1);
   639D DD 5E 04      [19]  798 	ld	e,4 (ix)
   63A0 DD 56 05      [19]  799 	ld	d,5 (ix)
   63A3 6B            [ 4]  800 	ld	l, e
   63A4 62            [ 4]  801 	ld	h, d
   63A5 23            [ 6]  802 	inc	hl
   63A6 23            [ 6]  803 	inc	hl
   63A7 4E            [ 7]  804 	ld	c,(hl)
   63A8 79            [ 4]  805 	ld	a,c
   63A9 E6 01         [ 7]  806 	and	a, #0x01
   63AB 47            [ 4]  807 	ld	b,a
   63AC 04            [ 4]  808 	inc	b
   63AD 04            [ 4]  809 	inc	b
   63AE 04            [ 4]  810 	inc	b
   63AF 04            [ 4]  811 	inc	b
                            812 ;src/main.c:207: u8 h = 6 + (enemy->py & 2 ? 1 : 0);
   63B0 EB            [ 4]  813 	ex	de,hl
   63B1 23            [ 6]  814 	inc	hl
   63B2 23            [ 6]  815 	inc	hl
   63B3 23            [ 6]  816 	inc	hl
   63B4 5E            [ 7]  817 	ld	e,(hl)
   63B5 CB 4B         [ 8]  818 	bit	1, e
   63B7 28 04         [12]  819 	jr	Z,00103$
   63B9 3E 01         [ 7]  820 	ld	a,#0x01
   63BB 18 02         [12]  821 	jr	00104$
   63BD                     822 00103$:
   63BD 3E 00         [ 7]  823 	ld	a,#0x00
   63BF                     824 00104$:
   63BF C6 06         [ 7]  825 	add	a, #0x06
   63C1 DD 77 FD      [19]  826 	ld	-3 (ix),a
                            827 ;src/main.c:209: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   63C4 FD 2A 45 60   [20]  828 	ld	iy,(_mapa)
   63C8 16 00         [ 7]  829 	ld	d,#0x00
   63CA 7B            [ 4]  830 	ld	a,e
   63CB C6 E8         [ 7]  831 	add	a,#0xE8
   63CD DD 77 FE      [19]  832 	ld	-2 (ix),a
   63D0 7A            [ 4]  833 	ld	a,d
   63D1 CE FF         [ 7]  834 	adc	a,#0xFF
   63D3 DD 77 FF      [19]  835 	ld	-1 (ix),a
   63D6 DD 6E FE      [19]  836 	ld	l,-2 (ix)
   63D9 DD 66 FF      [19]  837 	ld	h,-1 (ix)
   63DC DD CB FF 7E   [20]  838 	bit	7, -1 (ix)
   63E0 28 04         [12]  839 	jr	Z,00105$
   63E2 21 EB FF      [10]  840 	ld	hl,#0xFFEB
   63E5 19            [11]  841 	add	hl,de
   63E6                     842 00105$:
   63E6 CB 2C         [ 8]  843 	sra	h
   63E8 CB 1D         [ 8]  844 	rr	l
   63EA CB 2C         [ 8]  845 	sra	h
   63EC CB 1D         [ 8]  846 	rr	l
   63EE 55            [ 4]  847 	ld	d,l
   63EF CB 39         [ 8]  848 	srl	c
   63F1 FD E5         [15]  849 	push	iy
   63F3 21 F0 C0      [10]  850 	ld	hl,#0xC0F0
   63F6 E5            [11]  851 	push	hl
   63F7 3E 28         [ 7]  852 	ld	a,#0x28
   63F9 F5            [11]  853 	push	af
   63FA 33            [ 6]  854 	inc	sp
   63FB DD 7E FD      [19]  855 	ld	a,-3 (ix)
   63FE F5            [11]  856 	push	af
   63FF 33            [ 6]  857 	inc	sp
   6400 C5            [11]  858 	push	bc
   6401 33            [ 6]  859 	inc	sp
   6402 D5            [11]  860 	push	de
   6403 33            [ 6]  861 	inc	sp
   6404 79            [ 4]  862 	ld	a,c
   6405 F5            [11]  863 	push	af
   6406 33            [ 6]  864 	inc	sp
   6407 CD 80 53      [17]  865 	call	_cpct_etm_drawTileBox2x4
   640A DD F9         [10]  866 	ld	sp, ix
   640C DD E1         [14]  867 	pop	ix
   640E C9            [10]  868 	ret
                            869 ;src/main.c:213: void borrarEnemigo(u8 x, u8 y) {
                            870 ;	---------------------------------
                            871 ; Function borrarEnemigo
                            872 ; ---------------------------------
   640F                     873 _borrarEnemigo::
   640F DD E5         [15]  874 	push	ix
   6411 DD 21 00 00   [14]  875 	ld	ix,#0
   6415 DD 39         [15]  876 	add	ix,sp
   6417 F5            [11]  877 	push	af
   6418 F5            [11]  878 	push	af
                            879 ;src/main.c:217: u8 w = 4 + (x & 1);
   6419 DD 7E 04      [19]  880 	ld	a,4 (ix)
   641C E6 01         [ 7]  881 	and	a, #0x01
   641E 5F            [ 4]  882 	ld	e,a
   641F 1C            [ 4]  883 	inc	e
   6420 1C            [ 4]  884 	inc	e
   6421 1C            [ 4]  885 	inc	e
   6422 1C            [ 4]  886 	inc	e
                            887 ;src/main.c:220: u8 h = 6 + (y & 3 ? 1 : 0);
   6423 DD 7E 05      [19]  888 	ld	a,5 (ix)
   6426 E6 03         [ 7]  889 	and	a, #0x03
   6428 28 04         [12]  890 	jr	Z,00103$
   642A 3E 01         [ 7]  891 	ld	a,#0x01
   642C 18 02         [12]  892 	jr	00104$
   642E                     893 00103$:
   642E 3E 00         [ 7]  894 	ld	a,#0x00
   6430                     895 00104$:
   6430 C6 06         [ 7]  896 	add	a, #0x06
   6432 57            [ 4]  897 	ld	d,a
                            898 ;src/main.c:222: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   6433 2A 45 60      [16]  899 	ld	hl,(_mapa)
   6436 DD 75 FE      [19]  900 	ld	-2 (ix),l
   6439 DD 74 FF      [19]  901 	ld	-1 (ix),h
   643C DD 4E 05      [19]  902 	ld	c,5 (ix)
   643F 06 00         [ 7]  903 	ld	b,#0x00
   6441 79            [ 4]  904 	ld	a,c
   6442 C6 E8         [ 7]  905 	add	a,#0xE8
   6444 DD 77 FC      [19]  906 	ld	-4 (ix),a
   6447 78            [ 4]  907 	ld	a,b
   6448 CE FF         [ 7]  908 	adc	a,#0xFF
   644A DD 77 FD      [19]  909 	ld	-3 (ix),a
   644D E1            [10]  910 	pop	hl
   644E E5            [11]  911 	push	hl
   644F DD CB FD 7E   [20]  912 	bit	7, -3 (ix)
   6453 28 04         [12]  913 	jr	Z,00105$
   6455 21 EB FF      [10]  914 	ld	hl,#0xFFEB
   6458 09            [11]  915 	add	hl,bc
   6459                     916 00105$:
   6459 CB 2C         [ 8]  917 	sra	h
   645B CB 1D         [ 8]  918 	rr	l
   645D CB 2C         [ 8]  919 	sra	h
   645F CB 1D         [ 8]  920 	rr	l
   6461 45            [ 4]  921 	ld	b,l
   6462 DD 4E 04      [19]  922 	ld	c,4 (ix)
   6465 CB 39         [ 8]  923 	srl	c
   6467 DD 6E FE      [19]  924 	ld	l,-2 (ix)
   646A DD 66 FF      [19]  925 	ld	h,-1 (ix)
   646D E5            [11]  926 	push	hl
   646E 21 F0 C0      [10]  927 	ld	hl,#0xC0F0
   6471 E5            [11]  928 	push	hl
   6472 3E 28         [ 7]  929 	ld	a,#0x28
   6474 F5            [11]  930 	push	af
   6475 33            [ 6]  931 	inc	sp
   6476 D5            [11]  932 	push	de
   6477 C5            [11]  933 	push	bc
   6478 CD 80 53      [17]  934 	call	_cpct_etm_drawTileBox2x4
                            935 ;src/main.c:224: enemy->mover = NO;
   647B 21 FF 5E      [10]  936 	ld	hl,#(_enemy + 0x0006)
   647E 36 00         [10]  937 	ld	(hl),#0x00
   6480 DD F9         [10]  938 	ld	sp, ix
   6482 DD E1         [14]  939 	pop	ix
   6484 C9            [10]  940 	ret
                            941 ;src/main.c:227: void redibujarEnemigo(u8 x, u8 y, TEnemy *enemy) {
                            942 ;	---------------------------------
                            943 ; Function redibujarEnemigo
                            944 ; ---------------------------------
   6485                     945 _redibujarEnemigo::
   6485 DD E5         [15]  946 	push	ix
   6487 DD 21 00 00   [14]  947 	ld	ix,#0
   648B DD 39         [15]  948 	add	ix,sp
                            949 ;src/main.c:228: borrarEnemigo(x, y);
   648D DD 66 05      [19]  950 	ld	h,5 (ix)
   6490 DD 6E 04      [19]  951 	ld	l,4 (ix)
   6493 E5            [11]  952 	push	hl
   6494 CD 0F 64      [17]  953 	call	_borrarEnemigo
   6497 F1            [10]  954 	pop	af
                            955 ;src/main.c:229: enemy->px = enemy->x;
   6498 DD 4E 06      [19]  956 	ld	c,6 (ix)
   649B DD 46 07      [19]  957 	ld	b,7 (ix)
   649E 59            [ 4]  958 	ld	e, c
   649F 50            [ 4]  959 	ld	d, b
   64A0 13            [ 6]  960 	inc	de
   64A1 13            [ 6]  961 	inc	de
   64A2 0A            [ 7]  962 	ld	a,(bc)
   64A3 12            [ 7]  963 	ld	(de),a
                            964 ;src/main.c:230: enemy->py = enemy->y;
   64A4 59            [ 4]  965 	ld	e, c
   64A5 50            [ 4]  966 	ld	d, b
   64A6 13            [ 6]  967 	inc	de
   64A7 13            [ 6]  968 	inc	de
   64A8 13            [ 6]  969 	inc	de
   64A9 69            [ 4]  970 	ld	l, c
   64AA 60            [ 4]  971 	ld	h, b
   64AB 23            [ 6]  972 	inc	hl
   64AC 7E            [ 7]  973 	ld	a,(hl)
   64AD 12            [ 7]  974 	ld	(de),a
                            975 ;src/main.c:231: dibujarEnemigo(enemy);
   64AE C5            [11]  976 	push	bc
   64AF CD 27 63      [17]  977 	call	_dibujarEnemigo
   64B2 F1            [10]  978 	pop	af
   64B3 DD E1         [14]  979 	pop	ix
   64B5 C9            [10]  980 	ret
                            981 ;src/main.c:234: u8 checkEnemyCollision(u8 direction, TEnemy *enemy){
                            982 ;	---------------------------------
                            983 ; Function checkEnemyCollision
                            984 ; ---------------------------------
   64B6                     985 _checkEnemyCollision::
   64B6 DD E5         [15]  986 	push	ix
   64B8 DD 21 00 00   [14]  987 	ld	ix,#0
   64BC DD 39         [15]  988 	add	ix,sp
   64BE 21 F7 FF      [10]  989 	ld	hl,#-9
   64C1 39            [11]  990 	add	hl,sp
   64C2 F9            [ 6]  991 	ld	sp,hl
                            992 ;src/main.c:236: u8 colisiona = 1;
   64C3 DD 36 F7 01   [19]  993 	ld	-9 (ix),#0x01
                            994 ;src/main.c:238: switch (direction) {
   64C7 3E 03         [ 7]  995 	ld	a,#0x03
   64C9 DD 96 04      [19]  996 	sub	a, 4 (ix)
   64CC DA A9 68      [10]  997 	jp	C,00165$
                            998 ;src/main.c:240: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   64CF DD 4E 05      [19]  999 	ld	c,5 (ix)
   64D2 DD 46 06      [19] 1000 	ld	b,6 (ix)
   64D5 0A            [ 7] 1001 	ld	a,(bc)
   64D6 5F            [ 4] 1002 	ld	e,a
   64D7 21 01 00      [10] 1003 	ld	hl,#0x0001
   64DA 09            [11] 1004 	add	hl,bc
   64DB DD 75 F8      [19] 1005 	ld	-8 (ix),l
   64DE DD 74 F9      [19] 1006 	ld	-7 (ix),h
   64E1 DD 6E F8      [19] 1007 	ld	l,-8 (ix)
   64E4 DD 66 F9      [19] 1008 	ld	h,-7 (ix)
   64E7 56            [ 7] 1009 	ld	d,(hl)
                           1010 ;src/main.c:253: enemy->muerto = SI;
   64E8 21 08 00      [10] 1011 	ld	hl,#0x0008
   64EB 09            [11] 1012 	add	hl,bc
   64EC DD 75 FA      [19] 1013 	ld	-6 (ix),l
   64EF DD 74 FB      [19] 1014 	ld	-5 (ix),h
                           1015 ;src/main.c:260: enemy->mira = M_izquierda;
   64F2 21 07 00      [10] 1016 	ld	hl,#0x0007
   64F5 09            [11] 1017 	add	hl,bc
   64F6 DD 75 FC      [19] 1018 	ld	-4 (ix),l
   64F9 DD 74 FD      [19] 1019 	ld	-3 (ix),h
                           1020 ;src/main.c:238: switch (direction) {
   64FC D5            [11] 1021 	push	de
   64FD DD 5E 04      [19] 1022 	ld	e,4 (ix)
   6500 16 00         [ 7] 1023 	ld	d,#0x00
   6502 21 0A 65      [10] 1024 	ld	hl,#00268$
   6505 19            [11] 1025 	add	hl,de
   6506 19            [11] 1026 	add	hl,de
   6507 19            [11] 1027 	add	hl,de
   6508 D1            [10] 1028 	pop	de
   6509 E9            [ 4] 1029 	jp	(hl)
   650A                    1030 00268$:
   650A C3 16 65      [10] 1031 	jp	00101$
   650D C3 FE 65      [10] 1032 	jp	00117$
   6510 C3 E2 66      [10] 1033 	jp	00133$
   6513 C3 C0 67      [10] 1034 	jp	00149$
                           1035 ;src/main.c:239: case 0:
   6516                    1036 00101$:
                           1037 ;src/main.c:240: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   6516 7B            [ 4] 1038 	ld	a,e
   6517 C6 05         [ 7] 1039 	add	a, #0x05
   6519 C5            [11] 1040 	push	bc
   651A D5            [11] 1041 	push	de
   651B 33            [ 6] 1042 	inc	sp
   651C F5            [11] 1043 	push	af
   651D 33            [ 6] 1044 	inc	sp
   651E 2A 45 60      [16] 1045 	ld	hl,(_mapa)
   6521 E5            [11] 1046 	push	hl
   6522 CD B5 49      [17] 1047 	call	_getTilePtr
   6525 F1            [10] 1048 	pop	af
   6526 F1            [10] 1049 	pop	af
   6527 C1            [10] 1050 	pop	bc
   6528 5E            [ 7] 1051 	ld	e,(hl)
   6529 3E 02         [ 7] 1052 	ld	a,#0x02
   652B 93            [ 4] 1053 	sub	a, e
   652C DA F3 65      [10] 1054 	jp	C,00113$
                           1055 ;src/main.c:241: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   652F DD 6E F8      [19] 1056 	ld	l,-8 (ix)
   6532 DD 66 F9      [19] 1057 	ld	h,-7 (ix)
   6535 7E            [ 7] 1058 	ld	a,(hl)
   6536 C6 0B         [ 7] 1059 	add	a, #0x0B
   6538 57            [ 4] 1060 	ld	d,a
   6539 0A            [ 7] 1061 	ld	a,(bc)
   653A C6 05         [ 7] 1062 	add	a, #0x05
   653C C5            [11] 1063 	push	bc
   653D D5            [11] 1064 	push	de
   653E 33            [ 6] 1065 	inc	sp
   653F F5            [11] 1066 	push	af
   6540 33            [ 6] 1067 	inc	sp
   6541 2A 45 60      [16] 1068 	ld	hl,(_mapa)
   6544 E5            [11] 1069 	push	hl
   6545 CD B5 49      [17] 1070 	call	_getTilePtr
   6548 F1            [10] 1071 	pop	af
   6549 F1            [10] 1072 	pop	af
   654A C1            [10] 1073 	pop	bc
   654B 5E            [ 7] 1074 	ld	e,(hl)
   654C 3E 02         [ 7] 1075 	ld	a,#0x02
   654E 93            [ 4] 1076 	sub	a, e
   654F DA F3 65      [10] 1077 	jp	C,00113$
                           1078 ;src/main.c:242: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   6552 DD 6E F8      [19] 1079 	ld	l,-8 (ix)
   6555 DD 66 F9      [19] 1080 	ld	h,-7 (ix)
   6558 7E            [ 7] 1081 	ld	a,(hl)
   6559 C6 16         [ 7] 1082 	add	a, #0x16
   655B 57            [ 4] 1083 	ld	d,a
   655C 0A            [ 7] 1084 	ld	a,(bc)
   655D C6 05         [ 7] 1085 	add	a, #0x05
   655F C5            [11] 1086 	push	bc
   6560 D5            [11] 1087 	push	de
   6561 33            [ 6] 1088 	inc	sp
   6562 F5            [11] 1089 	push	af
   6563 33            [ 6] 1090 	inc	sp
   6564 2A 45 60      [16] 1091 	ld	hl,(_mapa)
   6567 E5            [11] 1092 	push	hl
   6568 CD B5 49      [17] 1093 	call	_getTilePtr
   656B F1            [10] 1094 	pop	af
   656C F1            [10] 1095 	pop	af
   656D C1            [10] 1096 	pop	bc
   656E 5E            [ 7] 1097 	ld	e,(hl)
   656F 3E 02         [ 7] 1098 	ld	a,#0x02
   6571 93            [ 4] 1099 	sub	a, e
   6572 DA F3 65      [10] 1100 	jp	C,00113$
                           1101 ;src/main.c:244: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   6575 21 72 5F      [10] 1102 	ld	hl, #_cu + 1
   6578 5E            [ 7] 1103 	ld	e,(hl)
   6579 16 00         [ 7] 1104 	ld	d,#0x00
   657B 21 04 00      [10] 1105 	ld	hl,#0x0004
   657E 19            [11] 1106 	add	hl,de
   657F DD 75 FE      [19] 1107 	ld	-2 (ix),l
   6582 DD 74 FF      [19] 1108 	ld	-1 (ix),h
   6585 DD 6E F8      [19] 1109 	ld	l,-8 (ix)
   6588 DD 66 F9      [19] 1110 	ld	h,-7 (ix)
   658B 6E            [ 7] 1111 	ld	l,(hl)
   658C 26 00         [ 7] 1112 	ld	h,#0x00
   658E DD 7E FE      [19] 1113 	ld	a,-2 (ix)
   6591 95            [ 4] 1114 	sub	a, l
   6592 DD 7E FF      [19] 1115 	ld	a,-1 (ix)
   6595 9C            [ 4] 1116 	sbc	a, h
   6596 E2 9B 65      [10] 1117 	jp	PO, 00269$
   6599 EE 80         [ 7] 1118 	xor	a, #0x80
   659B                    1119 00269$:
   659B FA B0 65      [10] 1120 	jp	M,00108$
   659E D5            [11] 1121 	push	de
   659F 11 16 00      [10] 1122 	ld	de,#0x0016
   65A2 19            [11] 1123 	add	hl, de
   65A3 D1            [10] 1124 	pop	de
   65A4 7D            [ 4] 1125 	ld	a,l
   65A5 93            [ 4] 1126 	sub	a, e
   65A6 7C            [ 4] 1127 	ld	a,h
   65A7 9A            [ 4] 1128 	sbc	a, d
   65A8 E2 AD 65      [10] 1129 	jp	PO, 00270$
   65AB EE 80         [ 7] 1130 	xor	a, #0x80
   65AD                    1131 00270$:
   65AD F2 B7 65      [10] 1132 	jp	P,00109$
   65B0                    1133 00108$:
                           1134 ;src/main.c:245: colisiona = 0;
   65B0 DD 36 F7 00   [19] 1135 	ld	-9 (ix),#0x00
   65B4 C3 A9 68      [10] 1136 	jp	00165$
   65B7                    1137 00109$:
                           1138 ;src/main.c:248: if(cu.x > enemy->x){ //si el cu esta abajo
   65B7 21 71 5F      [10] 1139 	ld	hl, #_cu + 0
   65BA 5E            [ 7] 1140 	ld	e,(hl)
   65BB 0A            [ 7] 1141 	ld	a,(bc)
   65BC 4F            [ 4] 1142 	ld	c,a
   65BD 93            [ 4] 1143 	sub	a, e
   65BE 30 2C         [12] 1144 	jr	NC,00106$
                           1145 ;src/main.c:249: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
   65C0 6B            [ 4] 1146 	ld	l,e
   65C1 26 00         [ 7] 1147 	ld	h,#0x00
   65C3 06 00         [ 7] 1148 	ld	b,#0x00
   65C5 03            [ 6] 1149 	inc	bc
   65C6 03            [ 6] 1150 	inc	bc
   65C7 03            [ 6] 1151 	inc	bc
   65C8 03            [ 6] 1152 	inc	bc
   65C9 BF            [ 4] 1153 	cp	a, a
   65CA ED 42         [15] 1154 	sbc	hl, bc
   65CC 3E 01         [ 7] 1155 	ld	a,#0x01
   65CE BD            [ 4] 1156 	cp	a, l
   65CF 3E 00         [ 7] 1157 	ld	a,#0x00
   65D1 9C            [ 4] 1158 	sbc	a, h
   65D2 E2 D7 65      [10] 1159 	jp	PO, 00271$
   65D5 EE 80         [ 7] 1160 	xor	a, #0x80
   65D7                    1161 00271$:
   65D7 F2 E1 65      [10] 1162 	jp	P,00103$
                           1163 ;src/main.c:250: colisiona = 0;
   65DA DD 36 F7 00   [19] 1164 	ld	-9 (ix),#0x00
   65DE C3 A9 68      [10] 1165 	jp	00165$
   65E1                    1166 00103$:
                           1167 ;src/main.c:253: enemy->muerto = SI;
   65E1 DD 6E FA      [19] 1168 	ld	l,-6 (ix)
   65E4 DD 66 FB      [19] 1169 	ld	h,-5 (ix)
   65E7 36 01         [10] 1170 	ld	(hl),#0x01
   65E9 C3 A9 68      [10] 1171 	jp	00165$
   65EC                    1172 00106$:
                           1173 ;src/main.c:256: colisiona = 0;
   65EC DD 36 F7 00   [19] 1174 	ld	-9 (ix),#0x00
   65F0 C3 A9 68      [10] 1175 	jp	00165$
   65F3                    1176 00113$:
                           1177 ;src/main.c:260: enemy->mira = M_izquierda;
   65F3 DD 6E FC      [19] 1178 	ld	l,-4 (ix)
   65F6 DD 66 FD      [19] 1179 	ld	h,-3 (ix)
   65F9 36 01         [10] 1180 	ld	(hl),#0x01
                           1181 ;src/main.c:262: break;
   65FB C3 A9 68      [10] 1182 	jp	00165$
                           1183 ;src/main.c:263: case 1:
   65FE                    1184 00117$:
                           1185 ;src/main.c:264: if( *getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   65FE 1D            [ 4] 1186 	dec	e
   65FF C5            [11] 1187 	push	bc
   6600 D5            [11] 1188 	push	de
   6601 2A 45 60      [16] 1189 	ld	hl,(_mapa)
   6604 E5            [11] 1190 	push	hl
   6605 CD B5 49      [17] 1191 	call	_getTilePtr
   6608 F1            [10] 1192 	pop	af
   6609 F1            [10] 1193 	pop	af
   660A C1            [10] 1194 	pop	bc
   660B 5E            [ 7] 1195 	ld	e,(hl)
   660C 3E 02         [ 7] 1196 	ld	a,#0x02
   660E 93            [ 4] 1197 	sub	a, e
   660F DA D7 66      [10] 1198 	jp	C,00129$
                           1199 ;src/main.c:265: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   6612 DD 6E F8      [19] 1200 	ld	l,-8 (ix)
   6615 DD 66 F9      [19] 1201 	ld	h,-7 (ix)
   6618 7E            [ 7] 1202 	ld	a,(hl)
   6619 C6 0B         [ 7] 1203 	add	a, #0x0B
   661B 57            [ 4] 1204 	ld	d,a
   661C 0A            [ 7] 1205 	ld	a,(bc)
   661D C6 FF         [ 7] 1206 	add	a,#0xFF
   661F C5            [11] 1207 	push	bc
   6620 D5            [11] 1208 	push	de
   6621 33            [ 6] 1209 	inc	sp
   6622 F5            [11] 1210 	push	af
   6623 33            [ 6] 1211 	inc	sp
   6624 2A 45 60      [16] 1212 	ld	hl,(_mapa)
   6627 E5            [11] 1213 	push	hl
   6628 CD B5 49      [17] 1214 	call	_getTilePtr
   662B F1            [10] 1215 	pop	af
   662C F1            [10] 1216 	pop	af
   662D C1            [10] 1217 	pop	bc
   662E 5E            [ 7] 1218 	ld	e,(hl)
   662F 3E 02         [ 7] 1219 	ld	a,#0x02
   6631 93            [ 4] 1220 	sub	a, e
   6632 DA D7 66      [10] 1221 	jp	C,00129$
                           1222 ;src/main.c:266: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   6635 DD 6E F8      [19] 1223 	ld	l,-8 (ix)
   6638 DD 66 F9      [19] 1224 	ld	h,-7 (ix)
   663B 7E            [ 7] 1225 	ld	a,(hl)
   663C C6 16         [ 7] 1226 	add	a, #0x16
   663E 57            [ 4] 1227 	ld	d,a
   663F 0A            [ 7] 1228 	ld	a,(bc)
   6640 C6 FF         [ 7] 1229 	add	a,#0xFF
   6642 C5            [11] 1230 	push	bc
   6643 D5            [11] 1231 	push	de
   6644 33            [ 6] 1232 	inc	sp
   6645 F5            [11] 1233 	push	af
   6646 33            [ 6] 1234 	inc	sp
   6647 2A 45 60      [16] 1235 	ld	hl,(_mapa)
   664A E5            [11] 1236 	push	hl
   664B CD B5 49      [17] 1237 	call	_getTilePtr
   664E F1            [10] 1238 	pop	af
   664F F1            [10] 1239 	pop	af
   6650 C1            [10] 1240 	pop	bc
   6651 5E            [ 7] 1241 	ld	e,(hl)
   6652 3E 02         [ 7] 1242 	ld	a,#0x02
   6654 93            [ 4] 1243 	sub	a, e
   6655 DA D7 66      [10] 1244 	jp	C,00129$
                           1245 ;src/main.c:268: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   6658 21 72 5F      [10] 1246 	ld	hl, #_cu + 1
   665B 5E            [ 7] 1247 	ld	e,(hl)
   665C 16 00         [ 7] 1248 	ld	d,#0x00
   665E 21 04 00      [10] 1249 	ld	hl,#0x0004
   6661 19            [11] 1250 	add	hl,de
   6662 DD 75 FE      [19] 1251 	ld	-2 (ix),l
   6665 DD 74 FF      [19] 1252 	ld	-1 (ix),h
   6668 DD 6E F8      [19] 1253 	ld	l,-8 (ix)
   666B DD 66 F9      [19] 1254 	ld	h,-7 (ix)
   666E 6E            [ 7] 1255 	ld	l,(hl)
   666F 26 00         [ 7] 1256 	ld	h,#0x00
   6671 DD 7E FE      [19] 1257 	ld	a,-2 (ix)
   6674 95            [ 4] 1258 	sub	a, l
   6675 DD 7E FF      [19] 1259 	ld	a,-1 (ix)
   6678 9C            [ 4] 1260 	sbc	a, h
   6679 E2 7E 66      [10] 1261 	jp	PO, 00272$
   667C EE 80         [ 7] 1262 	xor	a, #0x80
   667E                    1263 00272$:
   667E FA 93 66      [10] 1264 	jp	M,00124$
   6681 D5            [11] 1265 	push	de
   6682 11 16 00      [10] 1266 	ld	de,#0x0016
   6685 19            [11] 1267 	add	hl, de
   6686 D1            [10] 1268 	pop	de
   6687 7D            [ 4] 1269 	ld	a,l
   6688 93            [ 4] 1270 	sub	a, e
   6689 7C            [ 4] 1271 	ld	a,h
   668A 9A            [ 4] 1272 	sbc	a, d
   668B E2 90 66      [10] 1273 	jp	PO, 00273$
   668E EE 80         [ 7] 1274 	xor	a, #0x80
   6690                    1275 00273$:
   6690 F2 9A 66      [10] 1276 	jp	P,00125$
   6693                    1277 00124$:
                           1278 ;src/main.c:269: colisiona = 0;
   6693 DD 36 F7 00   [19] 1279 	ld	-9 (ix),#0x00
   6697 C3 A9 68      [10] 1280 	jp	00165$
   669A                    1281 00125$:
                           1282 ;src/main.c:272: if(enemy->x > cu.x){ //si el cu esta abajo
   669A 0A            [ 7] 1283 	ld	a,(bc)
   669B 5F            [ 4] 1284 	ld	e,a
   669C 21 71 5F      [10] 1285 	ld	hl, #_cu + 0
   669F 4E            [ 7] 1286 	ld	c,(hl)
   66A0 79            [ 4] 1287 	ld	a,c
   66A1 93            [ 4] 1288 	sub	a, e
   66A2 30 2C         [12] 1289 	jr	NC,00122$
                           1290 ;src/main.c:273: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
   66A4 6B            [ 4] 1291 	ld	l,e
   66A5 26 00         [ 7] 1292 	ld	h,#0x00
   66A7 06 00         [ 7] 1293 	ld	b,#0x00
   66A9 03            [ 6] 1294 	inc	bc
   66AA 03            [ 6] 1295 	inc	bc
   66AB 03            [ 6] 1296 	inc	bc
   66AC 03            [ 6] 1297 	inc	bc
   66AD BF            [ 4] 1298 	cp	a, a
   66AE ED 42         [15] 1299 	sbc	hl, bc
   66B0 3E 01         [ 7] 1300 	ld	a,#0x01
   66B2 BD            [ 4] 1301 	cp	a, l
   66B3 3E 00         [ 7] 1302 	ld	a,#0x00
   66B5 9C            [ 4] 1303 	sbc	a, h
   66B6 E2 BB 66      [10] 1304 	jp	PO, 00274$
   66B9 EE 80         [ 7] 1305 	xor	a, #0x80
   66BB                    1306 00274$:
   66BB F2 C5 66      [10] 1307 	jp	P,00119$
                           1308 ;src/main.c:274: colisiona = 0;
   66BE DD 36 F7 00   [19] 1309 	ld	-9 (ix),#0x00
   66C2 C3 A9 68      [10] 1310 	jp	00165$
   66C5                    1311 00119$:
                           1312 ;src/main.c:277: enemy->muerto = SI;
   66C5 DD 6E FA      [19] 1313 	ld	l,-6 (ix)
   66C8 DD 66 FB      [19] 1314 	ld	h,-5 (ix)
   66CB 36 01         [10] 1315 	ld	(hl),#0x01
   66CD C3 A9 68      [10] 1316 	jp	00165$
   66D0                    1317 00122$:
                           1318 ;src/main.c:280: colisiona = 0;
   66D0 DD 36 F7 00   [19] 1319 	ld	-9 (ix),#0x00
   66D4 C3 A9 68      [10] 1320 	jp	00165$
   66D7                    1321 00129$:
                           1322 ;src/main.c:284: enemy->mira = M_derecha;
   66D7 DD 6E FC      [19] 1323 	ld	l,-4 (ix)
   66DA DD 66 FD      [19] 1324 	ld	h,-3 (ix)
   66DD 36 00         [10] 1325 	ld	(hl),#0x00
                           1326 ;src/main.c:286: break;
   66DF C3 A9 68      [10] 1327 	jp	00165$
                           1328 ;src/main.c:287: case 2:
   66E2                    1329 00133$:
                           1330 ;src/main.c:288: if( *getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   66E2 15            [ 4] 1331 	dec	d
   66E3 15            [ 4] 1332 	dec	d
   66E4 C5            [11] 1333 	push	bc
   66E5 D5            [11] 1334 	push	de
   66E6 2A 45 60      [16] 1335 	ld	hl,(_mapa)
   66E9 E5            [11] 1336 	push	hl
   66EA CD B5 49      [17] 1337 	call	_getTilePtr
   66ED F1            [10] 1338 	pop	af
   66EE F1            [10] 1339 	pop	af
   66EF C1            [10] 1340 	pop	bc
   66F0 5E            [ 7] 1341 	ld	e,(hl)
   66F1 3E 02         [ 7] 1342 	ld	a,#0x02
   66F3 93            [ 4] 1343 	sub	a, e
   66F4 DA B8 67      [10] 1344 	jp	C,00145$
                           1345 ;src/main.c:289: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   66F7 DD 6E F8      [19] 1346 	ld	l,-8 (ix)
   66FA DD 66 F9      [19] 1347 	ld	h,-7 (ix)
   66FD 56            [ 7] 1348 	ld	d,(hl)
   66FE 15            [ 4] 1349 	dec	d
   66FF 15            [ 4] 1350 	dec	d
   6700 0A            [ 7] 1351 	ld	a,(bc)
   6701 C6 02         [ 7] 1352 	add	a, #0x02
   6703 C5            [11] 1353 	push	bc
   6704 D5            [11] 1354 	push	de
   6705 33            [ 6] 1355 	inc	sp
   6706 F5            [11] 1356 	push	af
   6707 33            [ 6] 1357 	inc	sp
   6708 2A 45 60      [16] 1358 	ld	hl,(_mapa)
   670B E5            [11] 1359 	push	hl
   670C CD B5 49      [17] 1360 	call	_getTilePtr
   670F F1            [10] 1361 	pop	af
   6710 F1            [10] 1362 	pop	af
   6711 C1            [10] 1363 	pop	bc
   6712 5E            [ 7] 1364 	ld	e,(hl)
   6713 3E 02         [ 7] 1365 	ld	a,#0x02
   6715 93            [ 4] 1366 	sub	a, e
   6716 DA B8 67      [10] 1367 	jp	C,00145$
                           1368 ;src/main.c:290: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   6719 DD 6E F8      [19] 1369 	ld	l,-8 (ix)
   671C DD 66 F9      [19] 1370 	ld	h,-7 (ix)
   671F 56            [ 7] 1371 	ld	d,(hl)
   6720 15            [ 4] 1372 	dec	d
   6721 15            [ 4] 1373 	dec	d
   6722 0A            [ 7] 1374 	ld	a,(bc)
   6723 C6 04         [ 7] 1375 	add	a, #0x04
   6725 C5            [11] 1376 	push	bc
   6726 D5            [11] 1377 	push	de
   6727 33            [ 6] 1378 	inc	sp
   6728 F5            [11] 1379 	push	af
   6729 33            [ 6] 1380 	inc	sp
   672A 2A 45 60      [16] 1381 	ld	hl,(_mapa)
   672D E5            [11] 1382 	push	hl
   672E CD B5 49      [17] 1383 	call	_getTilePtr
   6731 F1            [10] 1384 	pop	af
   6732 F1            [10] 1385 	pop	af
   6733 C1            [10] 1386 	pop	bc
   6734 5E            [ 7] 1387 	ld	e,(hl)
   6735 3E 02         [ 7] 1388 	ld	a,#0x02
   6737 93            [ 4] 1389 	sub	a, e
   6738 DA B8 67      [10] 1390 	jp	C,00145$
                           1391 ;src/main.c:292: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   673B 21 71 5F      [10] 1392 	ld	hl, #_cu + 0
   673E 5E            [ 7] 1393 	ld	e,(hl)
   673F 16 00         [ 7] 1394 	ld	d,#0x00
   6741 21 02 00      [10] 1395 	ld	hl,#0x0002
   6744 19            [11] 1396 	add	hl,de
   6745 DD 75 FE      [19] 1397 	ld	-2 (ix),l
   6748 DD 74 FF      [19] 1398 	ld	-1 (ix),h
   674B 0A            [ 7] 1399 	ld	a,(bc)
   674C 6F            [ 4] 1400 	ld	l,a
   674D 26 00         [ 7] 1401 	ld	h,#0x00
   674F DD 7E FE      [19] 1402 	ld	a,-2 (ix)
   6752 95            [ 4] 1403 	sub	a, l
   6753 DD 7E FF      [19] 1404 	ld	a,-1 (ix)
   6756 9C            [ 4] 1405 	sbc	a, h
   6757 E2 5C 67      [10] 1406 	jp	PO, 00275$
   675A EE 80         [ 7] 1407 	xor	a, #0x80
   675C                    1408 00275$:
   675C FA 6F 67      [10] 1409 	jp	M,00140$
   675F 23            [ 6] 1410 	inc	hl
   6760 23            [ 6] 1411 	inc	hl
   6761 23            [ 6] 1412 	inc	hl
   6762 23            [ 6] 1413 	inc	hl
   6763 7D            [ 4] 1414 	ld	a,l
   6764 93            [ 4] 1415 	sub	a, e
   6765 7C            [ 4] 1416 	ld	a,h
   6766 9A            [ 4] 1417 	sbc	a, d
   6767 E2 6C 67      [10] 1418 	jp	PO, 00276$
   676A EE 80         [ 7] 1419 	xor	a, #0x80
   676C                    1420 00276$:
   676C F2 75 67      [10] 1421 	jp	P,00141$
   676F                    1422 00140$:
                           1423 ;src/main.c:294: colisiona = 0;
   676F DD 36 F7 00   [19] 1424 	ld	-9 (ix),#0x00
   6773 18 4B         [12] 1425 	jr	00149$
   6775                    1426 00141$:
                           1427 ;src/main.c:297: if(enemy->y>cu.y){
   6775 DD 6E F8      [19] 1428 	ld	l,-8 (ix)
   6778 DD 66 F9      [19] 1429 	ld	h,-7 (ix)
   677B 5E            [ 7] 1430 	ld	e,(hl)
   677C 21 72 5F      [10] 1431 	ld	hl, #(_cu + 0x0001) + 0
   677F 6E            [ 7] 1432 	ld	l,(hl)
   6780 7D            [ 4] 1433 	ld	a,l
   6781 93            [ 4] 1434 	sub	a, e
   6782 30 2E         [12] 1435 	jr	NC,00138$
                           1436 ;src/main.c:298: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   6784 16 00         [ 7] 1437 	ld	d,#0x00
   6786 26 00         [ 7] 1438 	ld	h,#0x00
   6788 D5            [11] 1439 	push	de
   6789 11 08 00      [10] 1440 	ld	de,#0x0008
   678C 19            [11] 1441 	add	hl, de
   678D D1            [10] 1442 	pop	de
   678E 7B            [ 4] 1443 	ld	a,e
   678F 95            [ 4] 1444 	sub	a, l
   6790 5F            [ 4] 1445 	ld	e,a
   6791 7A            [ 4] 1446 	ld	a,d
   6792 9C            [ 4] 1447 	sbc	a, h
   6793 57            [ 4] 1448 	ld	d,a
   6794 3E 02         [ 7] 1449 	ld	a,#0x02
   6796 BB            [ 4] 1450 	cp	a, e
   6797 3E 00         [ 7] 1451 	ld	a,#0x00
   6799 9A            [ 4] 1452 	sbc	a, d
   679A E2 9F 67      [10] 1453 	jp	PO, 00277$
   679D EE 80         [ 7] 1454 	xor	a, #0x80
   679F                    1455 00277$:
   679F F2 A8 67      [10] 1456 	jp	P,00135$
                           1457 ;src/main.c:299: colisiona = 0;
   67A2 DD 36 F7 00   [19] 1458 	ld	-9 (ix),#0x00
   67A6 18 18         [12] 1459 	jr	00149$
   67A8                    1460 00135$:
                           1461 ;src/main.c:302: enemy->muerto = SI;
   67A8 DD 6E FA      [19] 1462 	ld	l,-6 (ix)
   67AB DD 66 FB      [19] 1463 	ld	h,-5 (ix)
   67AE 36 01         [10] 1464 	ld	(hl),#0x01
   67B0 18 0E         [12] 1465 	jr	00149$
   67B2                    1466 00138$:
                           1467 ;src/main.c:306: colisiona = 0;
   67B2 DD 36 F7 00   [19] 1468 	ld	-9 (ix),#0x00
   67B6 18 08         [12] 1469 	jr	00149$
   67B8                    1470 00145$:
                           1471 ;src/main.c:312: enemy->mira = M_abajo;
   67B8 DD 6E FC      [19] 1472 	ld	l,-4 (ix)
   67BB DD 66 FD      [19] 1473 	ld	h,-3 (ix)
   67BE 36 03         [10] 1474 	ld	(hl),#0x03
                           1475 ;src/main.c:315: case 3:
   67C0                    1476 00149$:
                           1477 ;src/main.c:318: if( *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   67C0 DD 6E F8      [19] 1478 	ld	l,-8 (ix)
   67C3 DD 66 F9      [19] 1479 	ld	h,-7 (ix)
   67C6 7E            [ 7] 1480 	ld	a,(hl)
   67C7 C6 18         [ 7] 1481 	add	a, #0x18
   67C9 57            [ 4] 1482 	ld	d,a
   67CA 0A            [ 7] 1483 	ld	a,(bc)
   67CB C5            [11] 1484 	push	bc
   67CC D5            [11] 1485 	push	de
   67CD 33            [ 6] 1486 	inc	sp
   67CE F5            [11] 1487 	push	af
   67CF 33            [ 6] 1488 	inc	sp
   67D0 2A 45 60      [16] 1489 	ld	hl,(_mapa)
   67D3 E5            [11] 1490 	push	hl
   67D4 CD B5 49      [17] 1491 	call	_getTilePtr
   67D7 F1            [10] 1492 	pop	af
   67D8 F1            [10] 1493 	pop	af
   67D9 C1            [10] 1494 	pop	bc
   67DA 5E            [ 7] 1495 	ld	e,(hl)
   67DB 3E 02         [ 7] 1496 	ld	a,#0x02
   67DD 93            [ 4] 1497 	sub	a, e
   67DE DA A1 68      [10] 1498 	jp	C,00161$
                           1499 ;src/main.c:319: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   67E1 DD 6E F8      [19] 1500 	ld	l,-8 (ix)
   67E4 DD 66 F9      [19] 1501 	ld	h,-7 (ix)
   67E7 7E            [ 7] 1502 	ld	a,(hl)
   67E8 C6 18         [ 7] 1503 	add	a, #0x18
   67EA 57            [ 4] 1504 	ld	d,a
   67EB 0A            [ 7] 1505 	ld	a,(bc)
   67EC C6 02         [ 7] 1506 	add	a, #0x02
   67EE C5            [11] 1507 	push	bc
   67EF D5            [11] 1508 	push	de
   67F0 33            [ 6] 1509 	inc	sp
   67F1 F5            [11] 1510 	push	af
   67F2 33            [ 6] 1511 	inc	sp
   67F3 2A 45 60      [16] 1512 	ld	hl,(_mapa)
   67F6 E5            [11] 1513 	push	hl
   67F7 CD B5 49      [17] 1514 	call	_getTilePtr
   67FA F1            [10] 1515 	pop	af
   67FB F1            [10] 1516 	pop	af
   67FC C1            [10] 1517 	pop	bc
   67FD 5E            [ 7] 1518 	ld	e,(hl)
   67FE 3E 02         [ 7] 1519 	ld	a,#0x02
   6800 93            [ 4] 1520 	sub	a, e
   6801 DA A1 68      [10] 1521 	jp	C,00161$
                           1522 ;src/main.c:320: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   6804 DD 6E F8      [19] 1523 	ld	l,-8 (ix)
   6807 DD 66 F9      [19] 1524 	ld	h,-7 (ix)
   680A 7E            [ 7] 1525 	ld	a,(hl)
   680B C6 18         [ 7] 1526 	add	a, #0x18
   680D 57            [ 4] 1527 	ld	d,a
   680E 0A            [ 7] 1528 	ld	a,(bc)
   680F C6 04         [ 7] 1529 	add	a, #0x04
   6811 C5            [11] 1530 	push	bc
   6812 D5            [11] 1531 	push	de
   6813 33            [ 6] 1532 	inc	sp
   6814 F5            [11] 1533 	push	af
   6815 33            [ 6] 1534 	inc	sp
   6816 2A 45 60      [16] 1535 	ld	hl,(_mapa)
   6819 E5            [11] 1536 	push	hl
   681A CD B5 49      [17] 1537 	call	_getTilePtr
   681D F1            [10] 1538 	pop	af
   681E F1            [10] 1539 	pop	af
   681F C1            [10] 1540 	pop	bc
   6820 5E            [ 7] 1541 	ld	e,(hl)
   6821 3E 02         [ 7] 1542 	ld	a,#0x02
   6823 93            [ 4] 1543 	sub	a, e
   6824 38 7B         [12] 1544 	jr	C,00161$
                           1545 ;src/main.c:322: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   6826 21 71 5F      [10] 1546 	ld	hl, #_cu + 0
   6829 5E            [ 7] 1547 	ld	e,(hl)
   682A 16 00         [ 7] 1548 	ld	d,#0x00
   682C 21 02 00      [10] 1549 	ld	hl,#0x0002
   682F 19            [11] 1550 	add	hl,de
   6830 DD 75 FE      [19] 1551 	ld	-2 (ix),l
   6833 DD 74 FF      [19] 1552 	ld	-1 (ix),h
   6836 0A            [ 7] 1553 	ld	a,(bc)
   6837 4F            [ 4] 1554 	ld	c,a
   6838 06 00         [ 7] 1555 	ld	b,#0x00
   683A DD 7E FE      [19] 1556 	ld	a,-2 (ix)
   683D 91            [ 4] 1557 	sub	a, c
   683E DD 7E FF      [19] 1558 	ld	a,-1 (ix)
   6841 98            [ 4] 1559 	sbc	a, b
   6842 E2 47 68      [10] 1560 	jp	PO, 00278$
   6845 EE 80         [ 7] 1561 	xor	a, #0x80
   6847                    1562 00278$:
   6847 FA 5A 68      [10] 1563 	jp	M,00156$
   684A 03            [ 6] 1564 	inc	bc
   684B 03            [ 6] 1565 	inc	bc
   684C 03            [ 6] 1566 	inc	bc
   684D 03            [ 6] 1567 	inc	bc
   684E 79            [ 4] 1568 	ld	a,c
   684F 93            [ 4] 1569 	sub	a, e
   6850 78            [ 4] 1570 	ld	a,b
   6851 9A            [ 4] 1571 	sbc	a, d
   6852 E2 57 68      [10] 1572 	jp	PO, 00279$
   6855 EE 80         [ 7] 1573 	xor	a, #0x80
   6857                    1574 00279$:
   6857 F2 60 68      [10] 1575 	jp	P,00157$
   685A                    1576 00156$:
                           1577 ;src/main.c:323: colisiona = 0;
   685A DD 36 F7 00   [19] 1578 	ld	-9 (ix),#0x00
   685E 18 49         [12] 1579 	jr	00165$
   6860                    1580 00157$:
                           1581 ;src/main.c:326: if(cu.y > enemy->y){ //si el cu esta abajo
   6860 21 72 5F      [10] 1582 	ld	hl, #(_cu + 0x0001) + 0
   6863 4E            [ 7] 1583 	ld	c,(hl)
   6864 DD 6E F8      [19] 1584 	ld	l,-8 (ix)
   6867 DD 66 F9      [19] 1585 	ld	h,-7 (ix)
   686A 5E            [ 7] 1586 	ld	e,(hl)
   686B 7B            [ 4] 1587 	ld	a,e
   686C 91            [ 4] 1588 	sub	a, c
   686D 30 2C         [12] 1589 	jr	NC,00154$
                           1590 ;src/main.c:327: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   686F 06 00         [ 7] 1591 	ld	b,#0x00
   6871 16 00         [ 7] 1592 	ld	d,#0x00
   6873 21 16 00      [10] 1593 	ld	hl,#0x0016
   6876 19            [11] 1594 	add	hl,de
   6877 79            [ 4] 1595 	ld	a,c
   6878 95            [ 4] 1596 	sub	a, l
   6879 4F            [ 4] 1597 	ld	c,a
   687A 78            [ 4] 1598 	ld	a,b
   687B 9C            [ 4] 1599 	sbc	a, h
   687C 47            [ 4] 1600 	ld	b,a
   687D 3E 02         [ 7] 1601 	ld	a,#0x02
   687F B9            [ 4] 1602 	cp	a, c
   6880 3E 00         [ 7] 1603 	ld	a,#0x00
   6882 98            [ 4] 1604 	sbc	a, b
   6883 E2 88 68      [10] 1605 	jp	PO, 00280$
   6886 EE 80         [ 7] 1606 	xor	a, #0x80
   6888                    1607 00280$:
   6888 F2 91 68      [10] 1608 	jp	P,00151$
                           1609 ;src/main.c:328: colisiona = 0;
   688B DD 36 F7 00   [19] 1610 	ld	-9 (ix),#0x00
   688F 18 18         [12] 1611 	jr	00165$
   6891                    1612 00151$:
                           1613 ;src/main.c:331: enemy->muerto = SI;
   6891 DD 6E FA      [19] 1614 	ld	l,-6 (ix)
   6894 DD 66 FB      [19] 1615 	ld	h,-5 (ix)
   6897 36 01         [10] 1616 	ld	(hl),#0x01
   6899 18 0E         [12] 1617 	jr	00165$
   689B                    1618 00154$:
                           1619 ;src/main.c:335: colisiona = 0;
   689B DD 36 F7 00   [19] 1620 	ld	-9 (ix),#0x00
   689F 18 08         [12] 1621 	jr	00165$
   68A1                    1622 00161$:
                           1623 ;src/main.c:339: enemy->mira = M_arriba;
   68A1 DD 6E FC      [19] 1624 	ld	l,-4 (ix)
   68A4 DD 66 FD      [19] 1625 	ld	h,-3 (ix)
   68A7 36 02         [10] 1626 	ld	(hl),#0x02
                           1627 ;src/main.c:342: }
   68A9                    1628 00165$:
                           1629 ;src/main.c:343: return colisiona;
   68A9 DD 6E F7      [19] 1630 	ld	l,-9 (ix)
   68AC DD F9         [10] 1631 	ld	sp, ix
   68AE DD E1         [14] 1632 	pop	ix
   68B0 C9            [10] 1633 	ret
                           1634 ;src/main.c:346: void moverEnemigoArriba(TEnemy *enemy){
                           1635 ;	---------------------------------
                           1636 ; Function moverEnemigoArriba
                           1637 ; ---------------------------------
   68B1                    1638 _moverEnemigoArriba::
   68B1 DD E5         [15] 1639 	push	ix
   68B3 DD 21 00 00   [14] 1640 	ld	ix,#0
   68B7 DD 39         [15] 1641 	add	ix,sp
                           1642 ;src/main.c:347: enemy->y--;
   68B9 DD 4E 04      [19] 1643 	ld	c,4 (ix)
   68BC DD 46 05      [19] 1644 	ld	b,5 (ix)
   68BF 69            [ 4] 1645 	ld	l, c
   68C0 60            [ 4] 1646 	ld	h, b
   68C1 23            [ 6] 1647 	inc	hl
   68C2 5E            [ 7] 1648 	ld	e,(hl)
   68C3 1D            [ 4] 1649 	dec	e
   68C4 73            [ 7] 1650 	ld	(hl),e
                           1651 ;src/main.c:348: enemy->y--;
   68C5 1D            [ 4] 1652 	dec	e
   68C6 73            [ 7] 1653 	ld	(hl),e
                           1654 ;src/main.c:349: enemy->mover = SI;
   68C7 21 06 00      [10] 1655 	ld	hl,#0x0006
   68CA 09            [11] 1656 	add	hl,bc
   68CB 36 01         [10] 1657 	ld	(hl),#0x01
   68CD DD E1         [14] 1658 	pop	ix
   68CF C9            [10] 1659 	ret
                           1660 ;src/main.c:352: void moverEnemigoAbajo(TEnemy *enemy){
                           1661 ;	---------------------------------
                           1662 ; Function moverEnemigoAbajo
                           1663 ; ---------------------------------
   68D0                    1664 _moverEnemigoAbajo::
   68D0 DD E5         [15] 1665 	push	ix
   68D2 DD 21 00 00   [14] 1666 	ld	ix,#0
   68D6 DD 39         [15] 1667 	add	ix,sp
                           1668 ;src/main.c:353: enemy->y++;
   68D8 DD 4E 04      [19] 1669 	ld	c,4 (ix)
   68DB DD 46 05      [19] 1670 	ld	b,5 (ix)
   68DE 59            [ 4] 1671 	ld	e, c
   68DF 50            [ 4] 1672 	ld	d, b
   68E0 13            [ 6] 1673 	inc	de
   68E1 1A            [ 7] 1674 	ld	a,(de)
   68E2 3C            [ 4] 1675 	inc	a
   68E3 12            [ 7] 1676 	ld	(de),a
                           1677 ;src/main.c:354: enemy->y++;
   68E4 3C            [ 4] 1678 	inc	a
   68E5 12            [ 7] 1679 	ld	(de),a
                           1680 ;src/main.c:355: enemy->mover = SI;
   68E6 21 06 00      [10] 1681 	ld	hl,#0x0006
   68E9 09            [11] 1682 	add	hl,bc
   68EA 36 01         [10] 1683 	ld	(hl),#0x01
   68EC DD E1         [14] 1684 	pop	ix
   68EE C9            [10] 1685 	ret
                           1686 ;src/main.c:358: void moverEnemigoDerecha(TEnemy *enemy){
                           1687 ;	---------------------------------
                           1688 ; Function moverEnemigoDerecha
                           1689 ; ---------------------------------
   68EF                    1690 _moverEnemigoDerecha::
                           1691 ;src/main.c:359: enemy->x++;
   68EF D1            [10] 1692 	pop	de
   68F0 C1            [10] 1693 	pop	bc
   68F1 C5            [11] 1694 	push	bc
   68F2 D5            [11] 1695 	push	de
   68F3 0A            [ 7] 1696 	ld	a,(bc)
   68F4 3C            [ 4] 1697 	inc	a
   68F5 02            [ 7] 1698 	ld	(bc),a
                           1699 ;src/main.c:360: enemy->x++;
   68F6 3C            [ 4] 1700 	inc	a
   68F7 02            [ 7] 1701 	ld	(bc),a
                           1702 ;src/main.c:361: enemy->mover = SI;
   68F8 21 06 00      [10] 1703 	ld	hl,#0x0006
   68FB 09            [11] 1704 	add	hl,bc
   68FC 36 01         [10] 1705 	ld	(hl),#0x01
   68FE C9            [10] 1706 	ret
                           1707 ;src/main.c:364: void moverEnemigoIzquierda(TEnemy *enemy){
                           1708 ;	---------------------------------
                           1709 ; Function moverEnemigoIzquierda
                           1710 ; ---------------------------------
   68FF                    1711 _moverEnemigoIzquierda::
                           1712 ;src/main.c:365: enemy->x--;
   68FF D1            [10] 1713 	pop	de
   6900 C1            [10] 1714 	pop	bc
   6901 C5            [11] 1715 	push	bc
   6902 D5            [11] 1716 	push	de
   6903 0A            [ 7] 1717 	ld	a,(bc)
   6904 C6 FF         [ 7] 1718 	add	a,#0xFF
   6906 02            [ 7] 1719 	ld	(bc),a
                           1720 ;src/main.c:366: enemy->x--;
   6907 C6 FF         [ 7] 1721 	add	a,#0xFF
   6909 02            [ 7] 1722 	ld	(bc),a
                           1723 ;src/main.c:367: enemy->mover = SI;
   690A 21 06 00      [10] 1724 	ld	hl,#0x0006
   690D 09            [11] 1725 	add	hl,bc
   690E 36 01         [10] 1726 	ld	(hl),#0x01
   6910 C9            [10] 1727 	ret
                           1728 ;src/main.c:370: void moverEnemigoPatrol(TEnemy *enemy){
                           1729 ;	---------------------------------
                           1730 ; Function moverEnemigoPatrol
                           1731 ; ---------------------------------
   6911                    1732 _moverEnemigoPatrol::
   6911 DD E5         [15] 1733 	push	ix
   6913 DD 21 00 00   [14] 1734 	ld	ix,#0
   6917 DD 39         [15] 1735 	add	ix,sp
   6919 21 F5 FF      [10] 1736 	ld	hl,#-11
   691C 39            [11] 1737 	add	hl,sp
   691D F9            [ 6] 1738 	ld	sp,hl
                           1739 ;src/main.c:371: if(!enemy->muerto){
   691E DD 4E 04      [19] 1740 	ld	c,4 (ix)
   6921 DD 46 05      [19] 1741 	ld	b,5 (ix)
   6924 C5            [11] 1742 	push	bc
   6925 FD E1         [14] 1743 	pop	iy
   6927 FD 7E 08      [19] 1744 	ld	a,8 (iy)
   692A B7            [ 4] 1745 	or	a, a
   692B C2 22 6B      [10] 1746 	jp	NZ,00118$
                           1747 ;src/main.c:373: if (!enemy->reversePatrol) {
   692E 21 0C 00      [10] 1748 	ld	hl,#0x000C
   6931 09            [11] 1749 	add	hl,bc
   6932 EB            [ 4] 1750 	ex	de,hl
   6933 1A            [ 7] 1751 	ld	a,(de)
   6934 DD 77 F5      [19] 1752 	ld	-11 (ix),a
                           1753 ;src/main.c:374: if(enemy->iter < enemy->longitud_camino){
   6937 FD 21 0E 00   [14] 1754 	ld	iy,#0x000E
   693B FD 09         [15] 1755 	add	iy, bc
   693D FD 7E 00      [19] 1756 	ld	a,0 (iy)
   6940 DD 77 FE      [19] 1757 	ld	-2 (ix),a
   6943 FD 7E 01      [19] 1758 	ld	a,1 (iy)
   6946 DD 77 FF      [19] 1759 	ld	-1 (ix),a
   6949 21 1B 00      [10] 1760 	ld	hl,#0x001B
   694C 09            [11] 1761 	add	hl,bc
                           1762 ;src/main.c:377: enemy->x = enemy->camino[enemy->iter];
   694D 79            [ 4] 1763 	ld	a,c
   694E C6 19         [ 7] 1764 	add	a, #0x19
   6950 DD 77 FC      [19] 1765 	ld	-4 (ix),a
   6953 78            [ 4] 1766 	ld	a,b
   6954 CE 00         [ 7] 1767 	adc	a, #0x00
   6956 DD 77 FD      [19] 1768 	ld	-3 (ix),a
                           1769 ;src/main.c:379: enemy->y = enemy->camino[enemy->iter];
   6959 79            [ 4] 1770 	ld	a,c
   695A C6 01         [ 7] 1771 	add	a, #0x01
   695C DD 77 FA      [19] 1772 	ld	-6 (ix),a
   695F 78            [ 4] 1773 	ld	a,b
   6960 CE 00         [ 7] 1774 	adc	a, #0x00
   6962 DD 77 FB      [19] 1775 	ld	-5 (ix),a
                           1776 ;src/main.c:381: enemy->mover = SI;
   6965 79            [ 4] 1777 	ld	a,c
   6966 C6 06         [ 7] 1778 	add	a, #0x06
   6968 DD 77 F8      [19] 1779 	ld	-8 (ix),a
   696B 78            [ 4] 1780 	ld	a,b
   696C CE 00         [ 7] 1781 	adc	a, #0x00
   696E DD 77 F9      [19] 1782 	ld	-7 (ix),a
                           1783 ;src/main.c:373: if (!enemy->reversePatrol) {
   6971 DD 7E F5      [19] 1784 	ld	a,-11 (ix)
   6974 B7            [ 4] 1785 	or	a, a
   6975 C2 37 6A      [10] 1786 	jp	NZ,00114$
                           1787 ;src/main.c:374: if(enemy->iter < enemy->longitud_camino){
   6978 6E            [ 7] 1788 	ld	l,(hl)
   6979 26 00         [ 7] 1789 	ld	h,#0x00
   697B DD 7E FE      [19] 1790 	ld	a,-2 (ix)
   697E 95            [ 4] 1791 	sub	a, l
   697F DD 7E FF      [19] 1792 	ld	a,-1 (ix)
   6982 9C            [ 4] 1793 	sbc	a, h
   6983 E2 88 69      [10] 1794 	jp	PO, 00144$
   6986 EE 80         [ 7] 1795 	xor	a, #0x80
   6988                    1796 00144$:
   6988 F2 23 6A      [10] 1797 	jp	P,00105$
                           1798 ;src/main.c:375: if(enemy->iter == 0){
   698B DD 7E FF      [19] 1799 	ld	a,-1 (ix)
   698E DD B6 FE      [19] 1800 	or	a,-2 (ix)
   6991 20 4C         [12] 1801 	jr	NZ,00102$
                           1802 ;src/main.c:376: enemy->iter = 2;
   6993 FD 36 00 02   [19] 1803 	ld	0 (iy),#0x02
   6997 FD 36 01 00   [19] 1804 	ld	1 (iy),#0x00
                           1805 ;src/main.c:377: enemy->x = enemy->camino[enemy->iter];
   699B DD 6E FC      [19] 1806 	ld	l,-4 (ix)
   699E DD 66 FD      [19] 1807 	ld	h,-3 (ix)
   69A1 5E            [ 7] 1808 	ld	e,(hl)
   69A2 23            [ 6] 1809 	inc	hl
   69A3 56            [ 7] 1810 	ld	d,(hl)
   69A4 FD 6E 00      [19] 1811 	ld	l,0 (iy)
   69A7 FD 66 01      [19] 1812 	ld	h,1 (iy)
   69AA 19            [11] 1813 	add	hl,de
   69AB 7E            [ 7] 1814 	ld	a,(hl)
   69AC 02            [ 7] 1815 	ld	(bc),a
                           1816 ;src/main.c:378: ++enemy->iter;
   69AD FD 4E 00      [19] 1817 	ld	c,0 (iy)
   69B0 FD 46 01      [19] 1818 	ld	b,1 (iy)
   69B3 03            [ 6] 1819 	inc	bc
   69B4 FD 71 00      [19] 1820 	ld	0 (iy),c
   69B7 FD 70 01      [19] 1821 	ld	1 (iy),b
                           1822 ;src/main.c:379: enemy->y = enemy->camino[enemy->iter];
   69BA DD 6E FC      [19] 1823 	ld	l,-4 (ix)
   69BD DD 66 FD      [19] 1824 	ld	h,-3 (ix)
   69C0 7E            [ 7] 1825 	ld	a, (hl)
   69C1 23            [ 6] 1826 	inc	hl
   69C2 66            [ 7] 1827 	ld	h,(hl)
   69C3 6F            [ 4] 1828 	ld	l,a
   69C4 09            [11] 1829 	add	hl,bc
   69C5 5E            [ 7] 1830 	ld	e,(hl)
   69C6 DD 6E FA      [19] 1831 	ld	l,-6 (ix)
   69C9 DD 66 FB      [19] 1832 	ld	h,-5 (ix)
   69CC 73            [ 7] 1833 	ld	(hl),e
                           1834 ;src/main.c:380: ++enemy->iter;
   69CD 03            [ 6] 1835 	inc	bc
   69CE FD 71 00      [19] 1836 	ld	0 (iy),c
   69D1 FD 70 01      [19] 1837 	ld	1 (iy),b
                           1838 ;src/main.c:381: enemy->mover = SI;
   69D4 DD 6E F8      [19] 1839 	ld	l,-8 (ix)
   69D7 DD 66 F9      [19] 1840 	ld	h,-7 (ix)
   69DA 36 01         [10] 1841 	ld	(hl),#0x01
   69DC C3 22 6B      [10] 1842 	jp	00118$
   69DF                    1843 00102$:
                           1844 ;src/main.c:383: enemy->x = enemy->camino[enemy->iter];
   69DF DD 6E FC      [19] 1845 	ld	l,-4 (ix)
   69E2 DD 66 FD      [19] 1846 	ld	h,-3 (ix)
   69E5 5E            [ 7] 1847 	ld	e,(hl)
   69E6 23            [ 6] 1848 	inc	hl
   69E7 56            [ 7] 1849 	ld	d,(hl)
   69E8 DD 6E FE      [19] 1850 	ld	l,-2 (ix)
   69EB DD 66 FF      [19] 1851 	ld	h,-1 (ix)
   69EE 19            [11] 1852 	add	hl,de
   69EF 7E            [ 7] 1853 	ld	a,(hl)
   69F0 02            [ 7] 1854 	ld	(bc),a
                           1855 ;src/main.c:384: ++enemy->iter;
   69F1 FD 4E 00      [19] 1856 	ld	c,0 (iy)
   69F4 FD 46 01      [19] 1857 	ld	b,1 (iy)
   69F7 03            [ 6] 1858 	inc	bc
   69F8 FD 71 00      [19] 1859 	ld	0 (iy),c
   69FB FD 70 01      [19] 1860 	ld	1 (iy),b
                           1861 ;src/main.c:385: enemy->y = enemy->camino[enemy->iter];
   69FE DD 6E FC      [19] 1862 	ld	l,-4 (ix)
   6A01 DD 66 FD      [19] 1863 	ld	h,-3 (ix)
   6A04 7E            [ 7] 1864 	ld	a, (hl)
   6A05 23            [ 6] 1865 	inc	hl
   6A06 66            [ 7] 1866 	ld	h,(hl)
   6A07 6F            [ 4] 1867 	ld	l,a
   6A08 09            [11] 1868 	add	hl,bc
   6A09 5E            [ 7] 1869 	ld	e,(hl)
   6A0A DD 6E FA      [19] 1870 	ld	l,-6 (ix)
   6A0D DD 66 FB      [19] 1871 	ld	h,-5 (ix)
   6A10 73            [ 7] 1872 	ld	(hl),e
                           1873 ;src/main.c:386: ++enemy->iter;
   6A11 03            [ 6] 1874 	inc	bc
   6A12 FD 71 00      [19] 1875 	ld	0 (iy),c
   6A15 FD 70 01      [19] 1876 	ld	1 (iy),b
                           1877 ;src/main.c:387: enemy->mover = SI;
   6A18 DD 6E F8      [19] 1878 	ld	l,-8 (ix)
   6A1B DD 66 F9      [19] 1879 	ld	h,-7 (ix)
   6A1E 36 01         [10] 1880 	ld	(hl),#0x01
   6A20 C3 22 6B      [10] 1881 	jp	00118$
   6A23                    1882 00105$:
                           1883 ;src/main.c:391: enemy->iter = enemy->longitud_camino;
   6A23 FD 75 00      [19] 1884 	ld	0 (iy),l
   6A26 FD 74 01      [19] 1885 	ld	1 (iy),h
                           1886 ;src/main.c:395: enemy->reversePatrol = 1;
   6A29 3E 01         [ 7] 1887 	ld	a,#0x01
   6A2B 12            [ 7] 1888 	ld	(de),a
                           1889 ;src/main.c:396: enemy->mover = NO;
   6A2C DD 6E F8      [19] 1890 	ld	l,-8 (ix)
   6A2F DD 66 F9      [19] 1891 	ld	h,-7 (ix)
   6A32 36 00         [10] 1892 	ld	(hl),#0x00
   6A34 C3 22 6B      [10] 1893 	jp	00118$
   6A37                    1894 00114$:
                           1895 ;src/main.c:400: if(enemy->iter > 0){
   6A37 AF            [ 4] 1896 	xor	a, a
   6A38 DD BE FE      [19] 1897 	cp	a, -2 (ix)
   6A3B DD 9E FF      [19] 1898 	sbc	a, -1 (ix)
   6A3E E2 43 6A      [10] 1899 	jp	PO, 00145$
   6A41 EE 80         [ 7] 1900 	xor	a, #0x80
   6A43                    1901 00145$:
   6A43 F2 10 6B      [10] 1902 	jp	P,00111$
                           1903 ;src/main.c:401: if(enemy->iter == enemy->longitud_camino){
   6A46 5E            [ 7] 1904 	ld	e,(hl)
   6A47 16 00         [ 7] 1905 	ld	d,#0x00
   6A49 DD 7E FE      [19] 1906 	ld	a,-2 (ix)
   6A4C 93            [ 4] 1907 	sub	a, e
   6A4D C2 CD 6A      [10] 1908 	jp	NZ,00108$
   6A50 DD 7E FF      [19] 1909 	ld	a,-1 (ix)
   6A53 92            [ 4] 1910 	sub	a, d
   6A54 20 77         [12] 1911 	jr	NZ,00108$
                           1912 ;src/main.c:402: enemy->iter = enemy->iter - 1;
   6A56 DD 7E FE      [19] 1913 	ld	a,-2 (ix)
   6A59 C6 FF         [ 7] 1914 	add	a,#0xFF
   6A5B DD 77 F6      [19] 1915 	ld	-10 (ix),a
   6A5E DD 7E FF      [19] 1916 	ld	a,-1 (ix)
   6A61 CE FF         [ 7] 1917 	adc	a,#0xFF
   6A63 DD 77 F7      [19] 1918 	ld	-9 (ix),a
   6A66 DD 7E F6      [19] 1919 	ld	a,-10 (ix)
   6A69 FD 77 00      [19] 1920 	ld	0 (iy),a
   6A6C DD 7E F7      [19] 1921 	ld	a,-9 (ix)
   6A6F FD 77 01      [19] 1922 	ld	1 (iy),a
                           1923 ;src/main.c:403: enemy->iter = enemy->iter - 2;
   6A72 DD 5E F6      [19] 1924 	ld	e,-10 (ix)
   6A75 DD 56 F7      [19] 1925 	ld	d,-9 (ix)
   6A78 1B            [ 6] 1926 	dec	de
   6A79 1B            [ 6] 1927 	dec	de
   6A7A FD 73 00      [19] 1928 	ld	0 (iy),e
   6A7D FD 72 01      [19] 1929 	ld	1 (iy),d
                           1930 ;src/main.c:404: enemy->y = enemy->camino[enemy->iter];
   6A80 DD 6E FC      [19] 1931 	ld	l,-4 (ix)
   6A83 DD 66 FD      [19] 1932 	ld	h,-3 (ix)
   6A86 7E            [ 7] 1933 	ld	a, (hl)
   6A87 23            [ 6] 1934 	inc	hl
   6A88 66            [ 7] 1935 	ld	h,(hl)
   6A89 6F            [ 4] 1936 	ld	l,a
   6A8A 19            [11] 1937 	add	hl,de
   6A8B 5E            [ 7] 1938 	ld	e,(hl)
   6A8C DD 6E FA      [19] 1939 	ld	l,-6 (ix)
   6A8F DD 66 FB      [19] 1940 	ld	h,-5 (ix)
   6A92 73            [ 7] 1941 	ld	(hl),e
                           1942 ;src/main.c:405: --enemy->iter;
   6A93 DD 7E F6      [19] 1943 	ld	a,-10 (ix)
   6A96 C6 FD         [ 7] 1944 	add	a,#0xFD
   6A98 5F            [ 4] 1945 	ld	e,a
   6A99 DD 7E F7      [19] 1946 	ld	a,-9 (ix)
   6A9C CE FF         [ 7] 1947 	adc	a,#0xFF
   6A9E 57            [ 4] 1948 	ld	d,a
   6A9F FD 73 00      [19] 1949 	ld	0 (iy),e
   6AA2 FD 72 01      [19] 1950 	ld	1 (iy),d
                           1951 ;src/main.c:406: enemy->x = enemy->camino[enemy->iter];
   6AA5 DD 6E FC      [19] 1952 	ld	l,-4 (ix)
   6AA8 DD 66 FD      [19] 1953 	ld	h,-3 (ix)
   6AAB 7E            [ 7] 1954 	ld	a, (hl)
   6AAC 23            [ 6] 1955 	inc	hl
   6AAD 66            [ 7] 1956 	ld	h,(hl)
   6AAE 6F            [ 4] 1957 	ld	l,a
   6AAF 19            [11] 1958 	add	hl,de
   6AB0 7E            [ 7] 1959 	ld	a,(hl)
   6AB1 02            [ 7] 1960 	ld	(bc),a
                           1961 ;src/main.c:407: --enemy->iter;
   6AB2 DD 7E F6      [19] 1962 	ld	a,-10 (ix)
   6AB5 C6 FC         [ 7] 1963 	add	a,#0xFC
   6AB7 4F            [ 4] 1964 	ld	c,a
   6AB8 DD 7E F7      [19] 1965 	ld	a,-9 (ix)
   6ABB CE FF         [ 7] 1966 	adc	a,#0xFF
   6ABD FD 71 00      [19] 1967 	ld	0 (iy), c
   6AC0 FD 77 01      [19] 1968 	ld	1 (iy), a
                           1969 ;src/main.c:408: enemy->mover = SI;
   6AC3 DD 6E F8      [19] 1970 	ld	l,-8 (ix)
   6AC6 DD 66 F9      [19] 1971 	ld	h,-7 (ix)
   6AC9 36 01         [10] 1972 	ld	(hl),#0x01
   6ACB 18 55         [12] 1973 	jr	00118$
   6ACD                    1974 00108$:
                           1975 ;src/main.c:410: enemy->y = enemy->camino[enemy->iter];
   6ACD DD 6E FC      [19] 1976 	ld	l,-4 (ix)
   6AD0 DD 66 FD      [19] 1977 	ld	h,-3 (ix)
   6AD3 5E            [ 7] 1978 	ld	e,(hl)
   6AD4 23            [ 6] 1979 	inc	hl
   6AD5 56            [ 7] 1980 	ld	d,(hl)
   6AD6 DD 6E FE      [19] 1981 	ld	l,-2 (ix)
   6AD9 DD 66 FF      [19] 1982 	ld	h,-1 (ix)
   6ADC 19            [11] 1983 	add	hl,de
   6ADD 5E            [ 7] 1984 	ld	e,(hl)
   6ADE DD 6E FA      [19] 1985 	ld	l,-6 (ix)
   6AE1 DD 66 FB      [19] 1986 	ld	h,-5 (ix)
   6AE4 73            [ 7] 1987 	ld	(hl),e
                           1988 ;src/main.c:411: --enemy->iter;
   6AE5 FD 5E 00      [19] 1989 	ld	e,0 (iy)
   6AE8 FD 56 01      [19] 1990 	ld	d,1 (iy)
   6AEB 1B            [ 6] 1991 	dec	de
   6AEC FD 73 00      [19] 1992 	ld	0 (iy),e
   6AEF FD 72 01      [19] 1993 	ld	1 (iy),d
                           1994 ;src/main.c:412: enemy->x = enemy->camino[enemy->iter];
   6AF2 DD 6E FC      [19] 1995 	ld	l,-4 (ix)
   6AF5 DD 66 FD      [19] 1996 	ld	h,-3 (ix)
   6AF8 7E            [ 7] 1997 	ld	a, (hl)
   6AF9 23            [ 6] 1998 	inc	hl
   6AFA 66            [ 7] 1999 	ld	h,(hl)
   6AFB 6F            [ 4] 2000 	ld	l,a
   6AFC 19            [11] 2001 	add	hl,de
   6AFD 7E            [ 7] 2002 	ld	a,(hl)
   6AFE 02            [ 7] 2003 	ld	(bc),a
                           2004 ;src/main.c:413: --enemy->iter;
   6AFF 1B            [ 6] 2005 	dec	de
   6B00 FD 73 00      [19] 2006 	ld	0 (iy),e
   6B03 FD 72 01      [19] 2007 	ld	1 (iy),d
                           2008 ;src/main.c:414: enemy->mover = SI;
   6B06 DD 6E F8      [19] 2009 	ld	l,-8 (ix)
   6B09 DD 66 F9      [19] 2010 	ld	h,-7 (ix)
   6B0C 36 01         [10] 2011 	ld	(hl),#0x01
   6B0E 18 12         [12] 2012 	jr	00118$
   6B10                    2013 00111$:
                           2014 ;src/main.c:418: enemy->iter = 0;
   6B10 FD 36 00 00   [19] 2015 	ld	0 (iy),#0x00
   6B14 FD 36 01 00   [19] 2016 	ld	1 (iy),#0x00
                           2017 ;src/main.c:420: enemy->reversePatrol = 0;
   6B18 AF            [ 4] 2018 	xor	a, a
   6B19 12            [ 7] 2019 	ld	(de),a
                           2020 ;src/main.c:421: enemy->mover = NO;
   6B1A DD 6E F8      [19] 2021 	ld	l,-8 (ix)
   6B1D DD 66 F9      [19] 2022 	ld	h,-7 (ix)
   6B20 36 00         [10] 2023 	ld	(hl),#0x00
   6B22                    2024 00118$:
   6B22 DD F9         [10] 2025 	ld	sp, ix
   6B24 DD E1         [14] 2026 	pop	ix
   6B26 C9            [10] 2027 	ret
                           2028 ;src/main.c:427: void moverEnemigoSeek(TEnemy* enemy){
                           2029 ;	---------------------------------
                           2030 ; Function moverEnemigoSeek
                           2031 ; ---------------------------------
   6B27                    2032 _moverEnemigoSeek::
   6B27 DD E5         [15] 2033 	push	ix
   6B29 DD 21 00 00   [14] 2034 	ld	ix,#0
   6B2D DD 39         [15] 2035 	add	ix,sp
   6B2F F5            [11] 2036 	push	af
   6B30 F5            [11] 2037 	push	af
                           2038 ;src/main.c:428: if(!enemy->muerto){
   6B31 DD 4E 04      [19] 2039 	ld	c,4 (ix)
   6B34 DD 46 05      [19] 2040 	ld	b,5 (ix)
   6B37 C5            [11] 2041 	push	bc
   6B38 FD E1         [14] 2042 	pop	iy
   6B3A FD 7E 08      [19] 2043 	ld	a,8 (iy)
   6B3D B7            [ 4] 2044 	or	a, a
   6B3E C2 2A 6C      [10] 2045 	jp	NZ,00108$
                           2046 ;src/main.c:430: if (!enemy->reversePatrol) {
   6B41 21 0C 00      [10] 2047 	ld	hl,#0x000C
   6B44 09            [11] 2048 	add	hl,bc
   6B45 EB            [ 4] 2049 	ex	de,hl
   6B46 1A            [ 7] 2050 	ld	a,(de)
   6B47 B7            [ 4] 2051 	or	a, a
   6B48 C2 2A 6C      [10] 2052 	jp	NZ,00108$
                           2053 ;src/main.c:431: if(enemy->iter < enemy->longitud_camino - 8){
   6B4B FD 21 0E 00   [14] 2054 	ld	iy,#0x000E
   6B4F FD 09         [15] 2055 	add	iy, bc
   6B51 FD 7E 00      [19] 2056 	ld	a,0 (iy)
   6B54 DD 77 FC      [19] 2057 	ld	-4 (ix),a
   6B57 FD 7E 01      [19] 2058 	ld	a,1 (iy)
   6B5A DD 77 FD      [19] 2059 	ld	-3 (ix),a
   6B5D 69            [ 4] 2060 	ld	l, c
   6B5E 60            [ 4] 2061 	ld	h, b
   6B5F C5            [11] 2062 	push	bc
   6B60 01 1B 00      [10] 2063 	ld	bc, #0x001B
   6B63 09            [11] 2064 	add	hl, bc
   6B64 C1            [10] 2065 	pop	bc
   6B65 6E            [ 7] 2066 	ld	l,(hl)
   6B66 26 00         [ 7] 2067 	ld	h,#0x00
   6B68 7D            [ 4] 2068 	ld	a,l
   6B69 C6 F8         [ 7] 2069 	add	a,#0xF8
   6B6B 6F            [ 4] 2070 	ld	l,a
   6B6C 7C            [ 4] 2071 	ld	a,h
   6B6D CE FF         [ 7] 2072 	adc	a,#0xFF
   6B6F 67            [ 4] 2073 	ld	h,a
                           2074 ;src/main.c:434: enemy->y = enemy->camino[enemy->iter];
   6B70 79            [ 4] 2075 	ld	a,c
   6B71 C6 01         [ 7] 2076 	add	a, #0x01
   6B73 DD 77 FE      [19] 2077 	ld	-2 (ix),a
   6B76 78            [ 4] 2078 	ld	a,b
   6B77 CE 00         [ 7] 2079 	adc	a, #0x00
   6B79 DD 77 FF      [19] 2080 	ld	-1 (ix),a
                           2081 ;src/main.c:431: if(enemy->iter < enemy->longitud_camino - 8){
   6B7C DD 7E FC      [19] 2082 	ld	a,-4 (ix)
   6B7F 95            [ 4] 2083 	sub	a, l
   6B80 DD 7E FD      [19] 2084 	ld	a,-3 (ix)
   6B83 9C            [ 4] 2085 	sbc	a, h
   6B84 E2 89 6B      [10] 2086 	jp	PO, 00122$
   6B87 EE 80         [ 7] 2087 	xor	a, #0x80
   6B89                    2088 00122$:
   6B89 F2 D6 6B      [10] 2089 	jp	P,00102$
                           2090 ;src/main.c:432: enemy->x = enemy->camino[enemy->iter];
   6B8C 21 19 00      [10] 2091 	ld	hl,#0x0019
   6B8F 09            [11] 2092 	add	hl,bc
   6B90 5D            [ 4] 2093 	ld	e,l
   6B91 54            [ 4] 2094 	ld	d,h
   6B92 7E            [ 7] 2095 	ld	a, (hl)
   6B93 23            [ 6] 2096 	inc	hl
   6B94 66            [ 7] 2097 	ld	h,(hl)
   6B95 6F            [ 4] 2098 	ld	l,a
   6B96 DD 7E FC      [19] 2099 	ld	a,-4 (ix)
   6B99 85            [ 4] 2100 	add	a, l
   6B9A 6F            [ 4] 2101 	ld	l,a
   6B9B DD 7E FD      [19] 2102 	ld	a,-3 (ix)
   6B9E 8C            [ 4] 2103 	adc	a, h
   6B9F 67            [ 4] 2104 	ld	h,a
   6BA0 7E            [ 7] 2105 	ld	a,(hl)
   6BA1 02            [ 7] 2106 	ld	(bc),a
                           2107 ;src/main.c:433: enemy->iter++;
   6BA2 FD 6E 00      [19] 2108 	ld	l,0 (iy)
   6BA5 FD 66 01      [19] 2109 	ld	h,1 (iy)
   6BA8 23            [ 6] 2110 	inc	hl
   6BA9 E3            [19] 2111 	ex	(sp), hl
   6BAA DD 7E FC      [19] 2112 	ld	a,-4 (ix)
   6BAD FD 77 00      [19] 2113 	ld	0 (iy),a
   6BB0 DD 7E FD      [19] 2114 	ld	a,-3 (ix)
   6BB3 FD 77 01      [19] 2115 	ld	1 (iy),a
                           2116 ;src/main.c:434: enemy->y = enemy->camino[enemy->iter];
   6BB6 EB            [ 4] 2117 	ex	de,hl
   6BB7 5E            [ 7] 2118 	ld	e,(hl)
   6BB8 23            [ 6] 2119 	inc	hl
   6BB9 56            [ 7] 2120 	ld	d,(hl)
   6BBA E1            [10] 2121 	pop	hl
   6BBB E5            [11] 2122 	push	hl
   6BBC 19            [11] 2123 	add	hl,de
   6BBD 5E            [ 7] 2124 	ld	e,(hl)
   6BBE DD 6E FE      [19] 2125 	ld	l,-2 (ix)
   6BC1 DD 66 FF      [19] 2126 	ld	h,-1 (ix)
   6BC4 73            [ 7] 2127 	ld	(hl),e
                           2128 ;src/main.c:435: enemy->iter++;
   6BC5 D1            [10] 2129 	pop	de
   6BC6 D5            [11] 2130 	push	de
   6BC7 13            [ 6] 2131 	inc	de
   6BC8 FD 73 00      [19] 2132 	ld	0 (iy),e
   6BCB FD 72 01      [19] 2133 	ld	1 (iy),d
                           2134 ;src/main.c:436: enemy->mover = SI;
   6BCE 21 06 00      [10] 2135 	ld	hl,#0x0006
   6BD1 09            [11] 2136 	add	hl,bc
   6BD2 36 01         [10] 2137 	ld	(hl),#0x01
   6BD4 18 54         [12] 2138 	jr	00108$
   6BD6                    2139 00102$:
                           2140 ;src/main.c:439: enemy->reversePatrol = NO;
   6BD6 AF            [ 4] 2141 	xor	a, a
   6BD7 12            [ 7] 2142 	ld	(de),a
                           2143 ;src/main.c:440: enemy->patrolling = 1;
   6BD8 21 0B 00      [10] 2144 	ld	hl,#0x000B
   6BDB 09            [11] 2145 	add	hl,bc
   6BDC 36 01         [10] 2146 	ld	(hl),#0x01
                           2147 ;src/main.c:441: enemy->seek = 0;
   6BDE 21 14 00      [10] 2148 	ld	hl,#0x0014
   6BE1 09            [11] 2149 	add	hl,bc
   6BE2 36 00         [10] 2150 	ld	(hl),#0x00
                           2151 ;src/main.c:442: enemy->lastIter = enemy->iter - 1;
   6BE4 21 10 00      [10] 2152 	ld	hl,#0x0010
   6BE7 09            [11] 2153 	add	hl,bc
   6BE8 EB            [ 4] 2154 	ex	de,hl
   6BE9 FD 7E 00      [19] 2155 	ld	a, 0 (iy)
   6BEC C6 FF         [ 7] 2156 	add	a,#0xFF
   6BEE 12            [ 7] 2157 	ld	(de),a
                           2158 ;src/main.c:443: enemy->iter = 0;
   6BEF FD 36 00 00   [19] 2159 	ld	0 (iy),#0x00
   6BF3 FD 36 01 00   [19] 2160 	ld	1 (iy),#0x00
                           2161 ;src/main.c:444: pathFinding(enemy->x, enemy->y, enemy->p_seek_x, enemy->p_seek_y, enemy, mapa);
   6BF7 69            [ 4] 2162 	ld	l, c
   6BF8 60            [ 4] 2163 	ld	h, b
   6BF9 11 18 00      [10] 2164 	ld	de, #0x0018
   6BFC 19            [11] 2165 	add	hl, de
   6BFD 56            [ 7] 2166 	ld	d,(hl)
   6BFE C5            [11] 2167 	push	bc
   6BFF FD E1         [14] 2168 	pop	iy
   6C01 FD 7E 17      [19] 2169 	ld	a,23 (iy)
   6C04 DD 77 FC      [19] 2170 	ld	-4 (ix),a
   6C07 DD 6E FE      [19] 2171 	ld	l,-2 (ix)
   6C0A DD 66 FF      [19] 2172 	ld	h,-1 (ix)
   6C0D 5E            [ 7] 2173 	ld	e,(hl)
   6C0E 0A            [ 7] 2174 	ld	a,(bc)
   6C0F DD 77 FE      [19] 2175 	ld	-2 (ix),a
   6C12 2A 45 60      [16] 2176 	ld	hl,(_mapa)
   6C15 E5            [11] 2177 	push	hl
   6C16 C5            [11] 2178 	push	bc
   6C17 D5            [11] 2179 	push	de
   6C18 33            [ 6] 2180 	inc	sp
   6C19 DD 56 FC      [19] 2181 	ld	d, -4 (ix)
   6C1C D5            [11] 2182 	push	de
   6C1D DD 7E FE      [19] 2183 	ld	a,-2 (ix)
   6C20 F5            [11] 2184 	push	af
   6C21 33            [ 6] 2185 	inc	sp
   6C22 CD 27 48      [17] 2186 	call	_pathFinding
   6C25 21 08 00      [10] 2187 	ld	hl,#8
   6C28 39            [11] 2188 	add	hl,sp
   6C29 F9            [ 6] 2189 	ld	sp,hl
   6C2A                    2190 00108$:
   6C2A DD F9         [10] 2191 	ld	sp, ix
   6C2C DD E1         [14] 2192 	pop	ix
   6C2E C9            [10] 2193 	ret
                           2194 ;src/main.c:451: void lookFor(TEnemy* enemy){
                           2195 ;	---------------------------------
                           2196 ; Function lookFor
                           2197 ; ---------------------------------
   6C2F                    2198 _lookFor::
   6C2F DD E5         [15] 2199 	push	ix
   6C31 DD 21 00 00   [14] 2200 	ld	ix,#0
   6C35 DD 39         [15] 2201 	add	ix,sp
                           2202 ;src/main.c:460: i16 difx = abs((i16)(enemy->x - prota.x));
   6C37 DD 4E 04      [19] 2203 	ld	c,4 (ix)
   6C3A DD 46 05      [19] 2204 	ld	b,5 (ix)
   6C3D 0A            [ 7] 2205 	ld	a,(bc)
   6C3E 5F            [ 4] 2206 	ld	e,a
   6C3F 16 00         [ 7] 2207 	ld	d,#0x00
   6C41 21 69 5F      [10] 2208 	ld	hl,#_prota+0
   6C44 6E            [ 7] 2209 	ld	l,(hl)
   6C45 26 00         [ 7] 2210 	ld	h,#0x00
   6C47 7B            [ 4] 2211 	ld	a,e
   6C48 95            [ 4] 2212 	sub	a, l
   6C49 5F            [ 4] 2213 	ld	e,a
   6C4A 7A            [ 4] 2214 	ld	a,d
   6C4B 9C            [ 4] 2215 	sbc	a, h
   6C4C 57            [ 4] 2216 	ld	d,a
   6C4D C5            [11] 2217 	push	bc
   6C4E D5            [11] 2218 	push	de
   6C4F CD F9 49      [17] 2219 	call	_abs
   6C52 F1            [10] 2220 	pop	af
   6C53 C1            [10] 2221 	pop	bc
                           2222 ;src/main.c:461: i16 dify = abs((i16)(enemy->y - prota.y));
   6C54 69            [ 4] 2223 	ld	l, c
   6C55 60            [ 4] 2224 	ld	h, b
   6C56 23            [ 6] 2225 	inc	hl
   6C57 5E            [ 7] 2226 	ld	e,(hl)
   6C58 16 00         [ 7] 2227 	ld	d,#0x00
   6C5A 21 6A 5F      [10] 2228 	ld	hl,#_prota+1
   6C5D 6E            [ 7] 2229 	ld	l,(hl)
   6C5E 26 00         [ 7] 2230 	ld	h,#0x00
   6C60 7B            [ 4] 2231 	ld	a,e
   6C61 95            [ 4] 2232 	sub	a, l
   6C62 5F            [ 4] 2233 	ld	e,a
   6C63 7A            [ 4] 2234 	ld	a,d
   6C64 9C            [ 4] 2235 	sbc	a, h
   6C65 57            [ 4] 2236 	ld	d,a
   6C66 C5            [11] 2237 	push	bc
   6C67 D5            [11] 2238 	push	de
   6C68 CD F9 49      [17] 2239 	call	_abs
   6C6B F1            [10] 2240 	pop	af
   6C6C C1            [10] 2241 	pop	bc
                           2242 ;src/main.c:464: enemy->seen = NO;
   6C6D 21 12 00      [10] 2243 	ld	hl,#0x0012
   6C70 09            [11] 2244 	add	hl,bc
   6C71 36 00         [10] 2245 	ld	(hl),#0x00
                           2246 ;src/main.c:465: enemy->inRange = NO;
   6C73 21 11 00      [10] 2247 	ld	hl,#0x0011
   6C76 09            [11] 2248 	add	hl,bc
   6C77 36 00         [10] 2249 	ld	(hl),#0x00
                           2250 ;src/main.c:466: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90);
   6C79 21 18 5A      [10] 2251 	ld	hl,#0x5A18
   6C7C E5            [11] 2252 	push	hl
   6C7D 21 00 C0      [10] 2253 	ld	hl,#0xC000
   6C80 E5            [11] 2254 	push	hl
   6C81 CD 9E 5E      [17] 2255 	call	_cpct_getScreenPtr
   6C84 DD E1         [14] 2256 	pop	ix
   6C86 C9            [10] 2257 	ret
                           2258 ;src/main.c:479: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2259 ;	---------------------------------
                           2260 ; Function engage
                           2261 ; ---------------------------------
   6C87                    2262 _engage::
   6C87 DD E5         [15] 2263 	push	ix
   6C89 DD 21 00 00   [14] 2264 	ld	ix,#0
   6C8D DD 39         [15] 2265 	add	ix,sp
   6C8F 21 F3 FF      [10] 2266 	ld	hl,#-13
   6C92 39            [11] 2267 	add	hl,sp
   6C93 F9            [ 6] 2268 	ld	sp,hl
                           2269 ;src/main.c:480: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   6C94 DD 7E 04      [19] 2270 	ld	a,4 (ix)
   6C97 DD 77 F7      [19] 2271 	ld	-9 (ix),a
   6C9A DD 7E 05      [19] 2272 	ld	a,5 (ix)
   6C9D DD 77 F8      [19] 2273 	ld	-8 (ix),a
   6CA0 DD 6E F7      [19] 2274 	ld	l,-9 (ix)
   6CA3 DD 66 F8      [19] 2275 	ld	h,-8 (ix)
   6CA6 4E            [ 7] 2276 	ld	c,(hl)
   6CA7 06 00         [ 7] 2277 	ld	b,#0x00
   6CA9 21 69 5F      [10] 2278 	ld	hl,#_prota+0
   6CAC 5E            [ 7] 2279 	ld	e,(hl)
   6CAD 16 00         [ 7] 2280 	ld	d,#0x00
   6CAF 79            [ 4] 2281 	ld	a,c
   6CB0 93            [ 4] 2282 	sub	a, e
   6CB1 4F            [ 4] 2283 	ld	c,a
   6CB2 78            [ 4] 2284 	ld	a,b
   6CB3 9A            [ 4] 2285 	sbc	a, d
   6CB4 47            [ 4] 2286 	ld	b,a
   6CB5 C5            [11] 2287 	push	bc
   6CB6 CD F9 49      [17] 2288 	call	_abs
   6CB9 F1            [10] 2289 	pop	af
   6CBA 4D            [ 4] 2290 	ld	c,l
                           2291 ;src/main.c:481: u8 dify = abs(enemy->y - prota.y);
   6CBB DD 7E F7      [19] 2292 	ld	a,-9 (ix)
   6CBE C6 01         [ 7] 2293 	add	a, #0x01
   6CC0 DD 77 F9      [19] 2294 	ld	-7 (ix),a
   6CC3 DD 7E F8      [19] 2295 	ld	a,-8 (ix)
   6CC6 CE 00         [ 7] 2296 	adc	a, #0x00
   6CC8 DD 77 FA      [19] 2297 	ld	-6 (ix),a
   6CCB DD 6E F9      [19] 2298 	ld	l,-7 (ix)
   6CCE DD 66 FA      [19] 2299 	ld	h,-6 (ix)
   6CD1 5E            [ 7] 2300 	ld	e,(hl)
   6CD2 16 00         [ 7] 2301 	ld	d,#0x00
   6CD4 21 6A 5F      [10] 2302 	ld	hl,#_prota+1
   6CD7 6E            [ 7] 2303 	ld	l,(hl)
   6CD8 26 00         [ 7] 2304 	ld	h,#0x00
   6CDA 7B            [ 4] 2305 	ld	a,e
   6CDB 95            [ 4] 2306 	sub	a, l
   6CDC 5F            [ 4] 2307 	ld	e,a
   6CDD 7A            [ 4] 2308 	ld	a,d
   6CDE 9C            [ 4] 2309 	sbc	a, h
   6CDF 57            [ 4] 2310 	ld	d,a
   6CE0 C5            [11] 2311 	push	bc
   6CE1 D5            [11] 2312 	push	de
   6CE2 CD F9 49      [17] 2313 	call	_abs
   6CE5 F1            [10] 2314 	pop	af
   6CE6 C1            [10] 2315 	pop	bc
                           2316 ;src/main.c:482: u8 dist = difx + dify; // manhattan
   6CE7 09            [11] 2317 	add	hl, bc
   6CE8 DD 75 F3      [19] 2318 	ld	-13 (ix),l
                           2319 ;src/main.c:484: u8 movX = 0;
   6CEB DD 36 F6 00   [19] 2320 	ld	-10 (ix),#0x00
                           2321 ;src/main.c:485: u8 movY = 0;
   6CEF DD 36 F5 00   [19] 2322 	ld	-11 (ix),#0x00
                           2323 ;src/main.c:486: u8 mov = 0;
   6CF3 DD 36 F4 00   [19] 2324 	ld	-12 (ix),#0x00
                           2325 ;src/main.c:488: if (enemy->y == dy) { // alineado en el eje x
   6CF7 DD 6E F9      [19] 2326 	ld	l,-7 (ix)
   6CFA DD 66 FA      [19] 2327 	ld	h,-6 (ix)
   6CFD 7E            [ 7] 2328 	ld	a,(hl)
   6CFE DD 77 FB      [19] 2329 	ld	-5 (ix),a
                           2330 ;src/main.c:490: if (dist > 10) {
   6D01 3E 0A         [ 7] 2331 	ld	a,#0x0A
   6D03 DD 96 F3      [19] 2332 	sub	a, -13 (ix)
   6D06 3E 00         [ 7] 2333 	ld	a,#0x00
   6D08 17            [ 4] 2334 	rla
   6D09 DD 77 FC      [19] 2335 	ld	-4 (ix),a
                           2336 ;src/main.c:488: if (enemy->y == dy) { // alineado en el eje x
   6D0C DD 7E 07      [19] 2337 	ld	a,7 (ix)
   6D0F DD 96 FB      [19] 2338 	sub	a, -5 (ix)
   6D12 C2 14 6E      [10] 2339 	jp	NZ,00187$
                           2340 ;src/main.c:490: if (dist > 10) {
   6D15 DD 7E FC      [19] 2341 	ld	a,-4 (ix)
   6D18 B7            [ 4] 2342 	or	a, a
   6D19 CA 78 73      [10] 2343 	jp	Z,00189$
                           2344 ;src/main.c:491: if (dx < enemy->x) { // izquierda
   6D1C DD 6E F7      [19] 2345 	ld	l,-9 (ix)
   6D1F DD 66 F8      [19] 2346 	ld	h,-8 (ix)
   6D22 46            [ 7] 2347 	ld	b,(hl)
   6D23 DD 7E 06      [19] 2348 	ld	a,6 (ix)
   6D26 90            [ 4] 2349 	sub	a, b
   6D27 30 72         [12] 2350 	jr	NC,00110$
                           2351 ;src/main.c:492: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   6D29 05            [ 4] 2352 	dec	b
   6D2A DD 7E FB      [19] 2353 	ld	a,-5 (ix)
   6D2D F5            [11] 2354 	push	af
   6D2E 33            [ 6] 2355 	inc	sp
   6D2F C5            [11] 2356 	push	bc
   6D30 33            [ 6] 2357 	inc	sp
   6D31 2A 45 60      [16] 2358 	ld	hl,(_mapa)
   6D34 E5            [11] 2359 	push	hl
   6D35 CD B5 49      [17] 2360 	call	_getTilePtr
   6D38 F1            [10] 2361 	pop	af
   6D39 F1            [10] 2362 	pop	af
   6D3A 4E            [ 7] 2363 	ld	c,(hl)
   6D3B 3E 02         [ 7] 2364 	ld	a,#0x02
   6D3D 91            [ 4] 2365 	sub	a, c
   6D3E DA 78 73      [10] 2366 	jp	C,00189$
                           2367 ;src/main.c:493: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   6D41 DD 6E F9      [19] 2368 	ld	l,-7 (ix)
   6D44 DD 66 FA      [19] 2369 	ld	h,-6 (ix)
   6D47 7E            [ 7] 2370 	ld	a,(hl)
   6D48 C6 0B         [ 7] 2371 	add	a, #0x0B
   6D4A 57            [ 4] 2372 	ld	d,a
   6D4B DD 6E F7      [19] 2373 	ld	l,-9 (ix)
   6D4E DD 66 F8      [19] 2374 	ld	h,-8 (ix)
   6D51 46            [ 7] 2375 	ld	b,(hl)
   6D52 05            [ 4] 2376 	dec	b
   6D53 D5            [11] 2377 	push	de
   6D54 33            [ 6] 2378 	inc	sp
   6D55 C5            [11] 2379 	push	bc
   6D56 33            [ 6] 2380 	inc	sp
   6D57 2A 45 60      [16] 2381 	ld	hl,(_mapa)
   6D5A E5            [11] 2382 	push	hl
   6D5B CD B5 49      [17] 2383 	call	_getTilePtr
   6D5E F1            [10] 2384 	pop	af
   6D5F F1            [10] 2385 	pop	af
   6D60 4E            [ 7] 2386 	ld	c,(hl)
   6D61 3E 02         [ 7] 2387 	ld	a,#0x02
   6D63 91            [ 4] 2388 	sub	a, c
   6D64 DA 78 73      [10] 2389 	jp	C,00189$
                           2390 ;src/main.c:494: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   6D67 DD 6E F9      [19] 2391 	ld	l,-7 (ix)
   6D6A DD 66 FA      [19] 2392 	ld	h,-6 (ix)
   6D6D 7E            [ 7] 2393 	ld	a,(hl)
   6D6E C6 16         [ 7] 2394 	add	a, #0x16
   6D70 57            [ 4] 2395 	ld	d,a
   6D71 DD 6E F7      [19] 2396 	ld	l,-9 (ix)
   6D74 DD 66 F8      [19] 2397 	ld	h,-8 (ix)
   6D77 46            [ 7] 2398 	ld	b,(hl)
   6D78 05            [ 4] 2399 	dec	b
   6D79 D5            [11] 2400 	push	de
   6D7A 33            [ 6] 2401 	inc	sp
   6D7B C5            [11] 2402 	push	bc
   6D7C 33            [ 6] 2403 	inc	sp
   6D7D 2A 45 60      [16] 2404 	ld	hl,(_mapa)
   6D80 E5            [11] 2405 	push	hl
   6D81 CD B5 49      [17] 2406 	call	_getTilePtr
   6D84 F1            [10] 2407 	pop	af
   6D85 F1            [10] 2408 	pop	af
   6D86 4E            [ 7] 2409 	ld	c,(hl)
   6D87 3E 02         [ 7] 2410 	ld	a,#0x02
   6D89 91            [ 4] 2411 	sub	a, c
   6D8A DA 78 73      [10] 2412 	jp	C,00189$
                           2413 ;src/main.c:495: moverEnemigoIzquierda(enemy);
   6D8D DD 6E F7      [19] 2414 	ld	l,-9 (ix)
   6D90 DD 66 F8      [19] 2415 	ld	h,-8 (ix)
   6D93 E5            [11] 2416 	push	hl
   6D94 CD FF 68      [17] 2417 	call	_moverEnemigoIzquierda
   6D97 F1            [10] 2418 	pop	af
                           2419 ;src/main.c:497: mov = 1;
   6D98 C3 78 73      [10] 2420 	jp	00189$
   6D9B                    2421 00110$:
                           2422 ;src/main.c:500: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   6D9B 78            [ 4] 2423 	ld	a,b
   6D9C C6 05         [ 7] 2424 	add	a, #0x05
   6D9E 47            [ 4] 2425 	ld	b,a
   6D9F DD 7E FB      [19] 2426 	ld	a,-5 (ix)
   6DA2 F5            [11] 2427 	push	af
   6DA3 33            [ 6] 2428 	inc	sp
   6DA4 C5            [11] 2429 	push	bc
   6DA5 33            [ 6] 2430 	inc	sp
   6DA6 2A 45 60      [16] 2431 	ld	hl,(_mapa)
   6DA9 E5            [11] 2432 	push	hl
   6DAA CD B5 49      [17] 2433 	call	_getTilePtr
   6DAD F1            [10] 2434 	pop	af
   6DAE F1            [10] 2435 	pop	af
   6DAF 4E            [ 7] 2436 	ld	c,(hl)
   6DB0 3E 02         [ 7] 2437 	ld	a,#0x02
   6DB2 91            [ 4] 2438 	sub	a, c
   6DB3 DA 78 73      [10] 2439 	jp	C,00189$
                           2440 ;src/main.c:501: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   6DB6 DD 6E F9      [19] 2441 	ld	l,-7 (ix)
   6DB9 DD 66 FA      [19] 2442 	ld	h,-6 (ix)
   6DBC 7E            [ 7] 2443 	ld	a,(hl)
   6DBD C6 0B         [ 7] 2444 	add	a, #0x0B
   6DBF 57            [ 4] 2445 	ld	d,a
   6DC0 DD 6E F7      [19] 2446 	ld	l,-9 (ix)
   6DC3 DD 66 F8      [19] 2447 	ld	h,-8 (ix)
   6DC6 7E            [ 7] 2448 	ld	a,(hl)
   6DC7 C6 05         [ 7] 2449 	add	a, #0x05
   6DC9 47            [ 4] 2450 	ld	b,a
   6DCA D5            [11] 2451 	push	de
   6DCB 33            [ 6] 2452 	inc	sp
   6DCC C5            [11] 2453 	push	bc
   6DCD 33            [ 6] 2454 	inc	sp
   6DCE 2A 45 60      [16] 2455 	ld	hl,(_mapa)
   6DD1 E5            [11] 2456 	push	hl
   6DD2 CD B5 49      [17] 2457 	call	_getTilePtr
   6DD5 F1            [10] 2458 	pop	af
   6DD6 F1            [10] 2459 	pop	af
   6DD7 4E            [ 7] 2460 	ld	c,(hl)
   6DD8 3E 02         [ 7] 2461 	ld	a,#0x02
   6DDA 91            [ 4] 2462 	sub	a, c
   6DDB DA 78 73      [10] 2463 	jp	C,00189$
                           2464 ;src/main.c:502: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   6DDE DD 6E F9      [19] 2465 	ld	l,-7 (ix)
   6DE1 DD 66 FA      [19] 2466 	ld	h,-6 (ix)
   6DE4 7E            [ 7] 2467 	ld	a,(hl)
   6DE5 C6 16         [ 7] 2468 	add	a, #0x16
   6DE7 57            [ 4] 2469 	ld	d,a
   6DE8 DD 6E F7      [19] 2470 	ld	l,-9 (ix)
   6DEB DD 66 F8      [19] 2471 	ld	h,-8 (ix)
   6DEE 7E            [ 7] 2472 	ld	a,(hl)
   6DEF C6 05         [ 7] 2473 	add	a, #0x05
   6DF1 47            [ 4] 2474 	ld	b,a
   6DF2 D5            [11] 2475 	push	de
   6DF3 33            [ 6] 2476 	inc	sp
   6DF4 C5            [11] 2477 	push	bc
   6DF5 33            [ 6] 2478 	inc	sp
   6DF6 2A 45 60      [16] 2479 	ld	hl,(_mapa)
   6DF9 E5            [11] 2480 	push	hl
   6DFA CD B5 49      [17] 2481 	call	_getTilePtr
   6DFD F1            [10] 2482 	pop	af
   6DFE F1            [10] 2483 	pop	af
   6DFF 4E            [ 7] 2484 	ld	c,(hl)
   6E00 3E 02         [ 7] 2485 	ld	a,#0x02
   6E02 91            [ 4] 2486 	sub	a, c
   6E03 DA 78 73      [10] 2487 	jp	C,00189$
                           2488 ;src/main.c:503: moverEnemigoDerecha(enemy);
   6E06 DD 6E F7      [19] 2489 	ld	l,-9 (ix)
   6E09 DD 66 F8      [19] 2490 	ld	h,-8 (ix)
   6E0C E5            [11] 2491 	push	hl
   6E0D CD EF 68      [17] 2492 	call	_moverEnemigoDerecha
   6E10 F1            [10] 2493 	pop	af
                           2494 ;src/main.c:505: mov = 1;
   6E11 C3 78 73      [10] 2495 	jp	00189$
   6E14                    2496 00187$:
                           2497 ;src/main.c:510: else if (enemy->x == dx) {
   6E14 DD 6E F7      [19] 2498 	ld	l,-9 (ix)
   6E17 DD 66 F8      [19] 2499 	ld	h,-8 (ix)
   6E1A 7E            [ 7] 2500 	ld	a,(hl)
   6E1B DD 77 FD      [19] 2501 	ld	-3 (ix), a
   6E1E DD 96 06      [19] 2502 	sub	a, 6 (ix)
   6E21 C2 1E 6F      [10] 2503 	jp	NZ,00184$
                           2504 ;src/main.c:512: if (dist > 10) {
   6E24 DD 7E FC      [19] 2505 	ld	a,-4 (ix)
   6E27 B7            [ 4] 2506 	or	a, a
   6E28 CA 78 73      [10] 2507 	jp	Z,00189$
                           2508 ;src/main.c:513: if (dy < enemy->y) {
   6E2B DD 7E 07      [19] 2509 	ld	a,7 (ix)
   6E2E DD 96 FB      [19] 2510 	sub	a, -5 (ix)
   6E31 30 74         [12] 2511 	jr	NC,00123$
                           2512 ;src/main.c:514: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   6E33 DD 46 FB      [19] 2513 	ld	b,-5 (ix)
   6E36 05            [ 4] 2514 	dec	b
   6E37 05            [ 4] 2515 	dec	b
   6E38 C5            [11] 2516 	push	bc
   6E39 33            [ 6] 2517 	inc	sp
   6E3A DD 7E FD      [19] 2518 	ld	a,-3 (ix)
   6E3D F5            [11] 2519 	push	af
   6E3E 33            [ 6] 2520 	inc	sp
   6E3F 2A 45 60      [16] 2521 	ld	hl,(_mapa)
   6E42 E5            [11] 2522 	push	hl
   6E43 CD B5 49      [17] 2523 	call	_getTilePtr
   6E46 F1            [10] 2524 	pop	af
   6E47 F1            [10] 2525 	pop	af
   6E48 4E            [ 7] 2526 	ld	c,(hl)
   6E49 3E 02         [ 7] 2527 	ld	a,#0x02
   6E4B 91            [ 4] 2528 	sub	a, c
   6E4C DA 78 73      [10] 2529 	jp	C,00189$
                           2530 ;src/main.c:515: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   6E4F DD 6E F9      [19] 2531 	ld	l,-7 (ix)
   6E52 DD 66 FA      [19] 2532 	ld	h,-6 (ix)
   6E55 46            [ 7] 2533 	ld	b,(hl)
   6E56 05            [ 4] 2534 	dec	b
   6E57 05            [ 4] 2535 	dec	b
   6E58 DD 6E F7      [19] 2536 	ld	l,-9 (ix)
   6E5B DD 66 F8      [19] 2537 	ld	h,-8 (ix)
   6E5E 56            [ 7] 2538 	ld	d,(hl)
   6E5F 14            [ 4] 2539 	inc	d
   6E60 14            [ 4] 2540 	inc	d
   6E61 4A            [ 4] 2541 	ld	c, d
   6E62 C5            [11] 2542 	push	bc
   6E63 2A 45 60      [16] 2543 	ld	hl,(_mapa)
   6E66 E5            [11] 2544 	push	hl
   6E67 CD B5 49      [17] 2545 	call	_getTilePtr
   6E6A F1            [10] 2546 	pop	af
   6E6B F1            [10] 2547 	pop	af
   6E6C 4E            [ 7] 2548 	ld	c,(hl)
   6E6D 3E 02         [ 7] 2549 	ld	a,#0x02
   6E6F 91            [ 4] 2550 	sub	a, c
   6E70 DA 78 73      [10] 2551 	jp	C,00189$
                           2552 ;src/main.c:516: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   6E73 DD 6E F9      [19] 2553 	ld	l,-7 (ix)
   6E76 DD 66 FA      [19] 2554 	ld	h,-6 (ix)
   6E79 46            [ 7] 2555 	ld	b,(hl)
   6E7A 05            [ 4] 2556 	dec	b
   6E7B 05            [ 4] 2557 	dec	b
   6E7C DD 6E F7      [19] 2558 	ld	l,-9 (ix)
   6E7F DD 66 F8      [19] 2559 	ld	h,-8 (ix)
   6E82 7E            [ 7] 2560 	ld	a,(hl)
   6E83 C6 04         [ 7] 2561 	add	a, #0x04
   6E85 C5            [11] 2562 	push	bc
   6E86 33            [ 6] 2563 	inc	sp
   6E87 F5            [11] 2564 	push	af
   6E88 33            [ 6] 2565 	inc	sp
   6E89 2A 45 60      [16] 2566 	ld	hl,(_mapa)
   6E8C E5            [11] 2567 	push	hl
   6E8D CD B5 49      [17] 2568 	call	_getTilePtr
   6E90 F1            [10] 2569 	pop	af
   6E91 F1            [10] 2570 	pop	af
   6E92 4E            [ 7] 2571 	ld	c,(hl)
   6E93 3E 02         [ 7] 2572 	ld	a,#0x02
   6E95 91            [ 4] 2573 	sub	a, c
   6E96 DA 78 73      [10] 2574 	jp	C,00189$
                           2575 ;src/main.c:517: moverEnemigoArriba(enemy);
   6E99 DD 6E F7      [19] 2576 	ld	l,-9 (ix)
   6E9C DD 66 F8      [19] 2577 	ld	h,-8 (ix)
   6E9F E5            [11] 2578 	push	hl
   6EA0 CD B1 68      [17] 2579 	call	_moverEnemigoArriba
   6EA3 F1            [10] 2580 	pop	af
                           2581 ;src/main.c:519: mov = 1;
   6EA4 C3 78 73      [10] 2582 	jp	00189$
   6EA7                    2583 00123$:
                           2584 ;src/main.c:522: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   6EA7 DD 7E FB      [19] 2585 	ld	a,-5 (ix)
   6EAA C6 18         [ 7] 2586 	add	a, #0x18
   6EAC 47            [ 4] 2587 	ld	b,a
   6EAD C5            [11] 2588 	push	bc
   6EAE 33            [ 6] 2589 	inc	sp
   6EAF DD 7E FD      [19] 2590 	ld	a,-3 (ix)
   6EB2 F5            [11] 2591 	push	af
   6EB3 33            [ 6] 2592 	inc	sp
   6EB4 2A 45 60      [16] 2593 	ld	hl,(_mapa)
   6EB7 E5            [11] 2594 	push	hl
   6EB8 CD B5 49      [17] 2595 	call	_getTilePtr
   6EBB F1            [10] 2596 	pop	af
   6EBC F1            [10] 2597 	pop	af
   6EBD 4E            [ 7] 2598 	ld	c,(hl)
   6EBE 3E 02         [ 7] 2599 	ld	a,#0x02
   6EC0 91            [ 4] 2600 	sub	a, c
   6EC1 DA 78 73      [10] 2601 	jp	C,00189$
                           2602 ;src/main.c:523: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   6EC4 DD 6E F9      [19] 2603 	ld	l,-7 (ix)
   6EC7 DD 66 FA      [19] 2604 	ld	h,-6 (ix)
   6ECA 7E            [ 7] 2605 	ld	a,(hl)
   6ECB C6 18         [ 7] 2606 	add	a, #0x18
   6ECD 47            [ 4] 2607 	ld	b,a
   6ECE DD 6E F7      [19] 2608 	ld	l,-9 (ix)
   6ED1 DD 66 F8      [19] 2609 	ld	h,-8 (ix)
   6ED4 56            [ 7] 2610 	ld	d,(hl)
   6ED5 14            [ 4] 2611 	inc	d
   6ED6 14            [ 4] 2612 	inc	d
   6ED7 4A            [ 4] 2613 	ld	c, d
   6ED8 C5            [11] 2614 	push	bc
   6ED9 2A 45 60      [16] 2615 	ld	hl,(_mapa)
   6EDC E5            [11] 2616 	push	hl
   6EDD CD B5 49      [17] 2617 	call	_getTilePtr
   6EE0 F1            [10] 2618 	pop	af
   6EE1 F1            [10] 2619 	pop	af
   6EE2 4E            [ 7] 2620 	ld	c,(hl)
   6EE3 3E 02         [ 7] 2621 	ld	a,#0x02
   6EE5 91            [ 4] 2622 	sub	a, c
   6EE6 DA 78 73      [10] 2623 	jp	C,00189$
                           2624 ;src/main.c:524: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   6EE9 DD 6E F9      [19] 2625 	ld	l,-7 (ix)
   6EEC DD 66 FA      [19] 2626 	ld	h,-6 (ix)
   6EEF 7E            [ 7] 2627 	ld	a,(hl)
   6EF0 C6 18         [ 7] 2628 	add	a, #0x18
   6EF2 47            [ 4] 2629 	ld	b,a
   6EF3 DD 6E F7      [19] 2630 	ld	l,-9 (ix)
   6EF6 DD 66 F8      [19] 2631 	ld	h,-8 (ix)
   6EF9 7E            [ 7] 2632 	ld	a,(hl)
   6EFA C6 04         [ 7] 2633 	add	a, #0x04
   6EFC C5            [11] 2634 	push	bc
   6EFD 33            [ 6] 2635 	inc	sp
   6EFE F5            [11] 2636 	push	af
   6EFF 33            [ 6] 2637 	inc	sp
   6F00 2A 45 60      [16] 2638 	ld	hl,(_mapa)
   6F03 E5            [11] 2639 	push	hl
   6F04 CD B5 49      [17] 2640 	call	_getTilePtr
   6F07 F1            [10] 2641 	pop	af
   6F08 F1            [10] 2642 	pop	af
   6F09 4E            [ 7] 2643 	ld	c,(hl)
   6F0A 3E 02         [ 7] 2644 	ld	a,#0x02
   6F0C 91            [ 4] 2645 	sub	a, c
   6F0D DA 78 73      [10] 2646 	jp	C,00189$
                           2647 ;src/main.c:525: moverEnemigoAbajo(enemy);
   6F10 DD 6E F7      [19] 2648 	ld	l,-9 (ix)
   6F13 DD 66 F8      [19] 2649 	ld	h,-8 (ix)
   6F16 E5            [11] 2650 	push	hl
   6F17 CD D0 68      [17] 2651 	call	_moverEnemigoAbajo
   6F1A F1            [10] 2652 	pop	af
                           2653 ;src/main.c:527: mov = 1;
   6F1B C3 78 73      [10] 2654 	jp	00189$
   6F1E                    2655 00184$:
                           2656 ;src/main.c:533: if (dist > 20) {
   6F1E 3E 14         [ 7] 2657 	ld	a,#0x14
   6F20 DD 96 F3      [19] 2658 	sub	a, -13 (ix)
   6F23 D2 78 73      [10] 2659 	jp	NC,00189$
                           2660 ;src/main.c:534: if (dx < enemy->x) {
   6F26 DD 7E 06      [19] 2661 	ld	a,6 (ix)
   6F29 DD 96 FD      [19] 2662 	sub	a, -3 (ix)
   6F2C D2 AE 6F      [10] 2663 	jp	NC,00136$
                           2664 ;src/main.c:535: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   6F2F DD 46 FD      [19] 2665 	ld	b,-3 (ix)
   6F32 05            [ 4] 2666 	dec	b
   6F33 DD 7E FB      [19] 2667 	ld	a,-5 (ix)
   6F36 F5            [11] 2668 	push	af
   6F37 33            [ 6] 2669 	inc	sp
   6F38 C5            [11] 2670 	push	bc
   6F39 33            [ 6] 2671 	inc	sp
   6F3A 2A 45 60      [16] 2672 	ld	hl,(_mapa)
   6F3D E5            [11] 2673 	push	hl
   6F3E CD B5 49      [17] 2674 	call	_getTilePtr
   6F41 F1            [10] 2675 	pop	af
   6F42 F1            [10] 2676 	pop	af
   6F43 4E            [ 7] 2677 	ld	c,(hl)
   6F44 3E 02         [ 7] 2678 	ld	a,#0x02
   6F46 91            [ 4] 2679 	sub	a, c
   6F47 DA 2B 70      [10] 2680 	jp	C,00137$
                           2681 ;src/main.c:536: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   6F4A DD 6E F9      [19] 2682 	ld	l,-7 (ix)
   6F4D DD 66 FA      [19] 2683 	ld	h,-6 (ix)
   6F50 7E            [ 7] 2684 	ld	a,(hl)
   6F51 C6 0B         [ 7] 2685 	add	a, #0x0B
   6F53 4F            [ 4] 2686 	ld	c,a
   6F54 DD 6E F7      [19] 2687 	ld	l,-9 (ix)
   6F57 DD 66 F8      [19] 2688 	ld	h,-8 (ix)
   6F5A 46            [ 7] 2689 	ld	b,(hl)
   6F5B 05            [ 4] 2690 	dec	b
   6F5C 79            [ 4] 2691 	ld	a,c
   6F5D F5            [11] 2692 	push	af
   6F5E 33            [ 6] 2693 	inc	sp
   6F5F C5            [11] 2694 	push	bc
   6F60 33            [ 6] 2695 	inc	sp
   6F61 2A 45 60      [16] 2696 	ld	hl,(_mapa)
   6F64 E5            [11] 2697 	push	hl
   6F65 CD B5 49      [17] 2698 	call	_getTilePtr
   6F68 F1            [10] 2699 	pop	af
   6F69 F1            [10] 2700 	pop	af
   6F6A 4E            [ 7] 2701 	ld	c,(hl)
   6F6B 3E 02         [ 7] 2702 	ld	a,#0x02
   6F6D 91            [ 4] 2703 	sub	a, c
   6F6E DA 2B 70      [10] 2704 	jp	C,00137$
                           2705 ;src/main.c:537: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   6F71 DD 6E F9      [19] 2706 	ld	l,-7 (ix)
   6F74 DD 66 FA      [19] 2707 	ld	h,-6 (ix)
   6F77 7E            [ 7] 2708 	ld	a,(hl)
   6F78 C6 16         [ 7] 2709 	add	a, #0x16
   6F7A 4F            [ 4] 2710 	ld	c,a
   6F7B DD 6E F7      [19] 2711 	ld	l,-9 (ix)
   6F7E DD 66 F8      [19] 2712 	ld	h,-8 (ix)
   6F81 46            [ 7] 2713 	ld	b,(hl)
   6F82 05            [ 4] 2714 	dec	b
   6F83 79            [ 4] 2715 	ld	a,c
   6F84 F5            [11] 2716 	push	af
   6F85 33            [ 6] 2717 	inc	sp
   6F86 C5            [11] 2718 	push	bc
   6F87 33            [ 6] 2719 	inc	sp
   6F88 2A 45 60      [16] 2720 	ld	hl,(_mapa)
   6F8B E5            [11] 2721 	push	hl
   6F8C CD B5 49      [17] 2722 	call	_getTilePtr
   6F8F F1            [10] 2723 	pop	af
   6F90 F1            [10] 2724 	pop	af
   6F91 4E            [ 7] 2725 	ld	c,(hl)
   6F92 3E 02         [ 7] 2726 	ld	a,#0x02
   6F94 91            [ 4] 2727 	sub	a, c
   6F95 DA 2B 70      [10] 2728 	jp	C,00137$
                           2729 ;src/main.c:538: moverEnemigoIzquierda(enemy);
   6F98 DD 6E F7      [19] 2730 	ld	l,-9 (ix)
   6F9B DD 66 F8      [19] 2731 	ld	h,-8 (ix)
   6F9E E5            [11] 2732 	push	hl
   6F9F CD FF 68      [17] 2733 	call	_moverEnemigoIzquierda
   6FA2 F1            [10] 2734 	pop	af
                           2735 ;src/main.c:539: movX = 1;
   6FA3 DD 36 F6 01   [19] 2736 	ld	-10 (ix),#0x01
                           2737 ;src/main.c:540: mov = 1;
   6FA7 DD 36 F4 01   [19] 2738 	ld	-12 (ix),#0x01
   6FAB C3 2B 70      [10] 2739 	jp	00137$
   6FAE                    2740 00136$:
                           2741 ;src/main.c:543: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   6FAE DD 7E FD      [19] 2742 	ld	a,-3 (ix)
   6FB1 C6 05         [ 7] 2743 	add	a, #0x05
   6FB3 47            [ 4] 2744 	ld	b,a
   6FB4 DD 7E FB      [19] 2745 	ld	a,-5 (ix)
   6FB7 F5            [11] 2746 	push	af
   6FB8 33            [ 6] 2747 	inc	sp
   6FB9 C5            [11] 2748 	push	bc
   6FBA 33            [ 6] 2749 	inc	sp
   6FBB 2A 45 60      [16] 2750 	ld	hl,(_mapa)
   6FBE E5            [11] 2751 	push	hl
   6FBF CD B5 49      [17] 2752 	call	_getTilePtr
   6FC2 F1            [10] 2753 	pop	af
   6FC3 F1            [10] 2754 	pop	af
   6FC4 4E            [ 7] 2755 	ld	c,(hl)
   6FC5 3E 02         [ 7] 2756 	ld	a,#0x02
   6FC7 91            [ 4] 2757 	sub	a, c
   6FC8 38 61         [12] 2758 	jr	C,00137$
                           2759 ;src/main.c:544: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   6FCA DD 6E F9      [19] 2760 	ld	l,-7 (ix)
   6FCD DD 66 FA      [19] 2761 	ld	h,-6 (ix)
   6FD0 7E            [ 7] 2762 	ld	a,(hl)
   6FD1 C6 0B         [ 7] 2763 	add	a, #0x0B
   6FD3 57            [ 4] 2764 	ld	d,a
   6FD4 DD 6E F7      [19] 2765 	ld	l,-9 (ix)
   6FD7 DD 66 F8      [19] 2766 	ld	h,-8 (ix)
   6FDA 7E            [ 7] 2767 	ld	a,(hl)
   6FDB C6 05         [ 7] 2768 	add	a, #0x05
   6FDD 47            [ 4] 2769 	ld	b,a
   6FDE D5            [11] 2770 	push	de
   6FDF 33            [ 6] 2771 	inc	sp
   6FE0 C5            [11] 2772 	push	bc
   6FE1 33            [ 6] 2773 	inc	sp
   6FE2 2A 45 60      [16] 2774 	ld	hl,(_mapa)
   6FE5 E5            [11] 2775 	push	hl
   6FE6 CD B5 49      [17] 2776 	call	_getTilePtr
   6FE9 F1            [10] 2777 	pop	af
   6FEA F1            [10] 2778 	pop	af
   6FEB 4E            [ 7] 2779 	ld	c,(hl)
   6FEC 3E 02         [ 7] 2780 	ld	a,#0x02
   6FEE 91            [ 4] 2781 	sub	a, c
   6FEF 38 3A         [12] 2782 	jr	C,00137$
                           2783 ;src/main.c:545: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   6FF1 DD 6E F9      [19] 2784 	ld	l,-7 (ix)
   6FF4 DD 66 FA      [19] 2785 	ld	h,-6 (ix)
   6FF7 7E            [ 7] 2786 	ld	a,(hl)
   6FF8 C6 16         [ 7] 2787 	add	a, #0x16
   6FFA 57            [ 4] 2788 	ld	d,a
   6FFB DD 6E F7      [19] 2789 	ld	l,-9 (ix)
   6FFE DD 66 F8      [19] 2790 	ld	h,-8 (ix)
   7001 7E            [ 7] 2791 	ld	a,(hl)
   7002 C6 05         [ 7] 2792 	add	a, #0x05
   7004 47            [ 4] 2793 	ld	b,a
   7005 D5            [11] 2794 	push	de
   7006 33            [ 6] 2795 	inc	sp
   7007 C5            [11] 2796 	push	bc
   7008 33            [ 6] 2797 	inc	sp
   7009 2A 45 60      [16] 2798 	ld	hl,(_mapa)
   700C E5            [11] 2799 	push	hl
   700D CD B5 49      [17] 2800 	call	_getTilePtr
   7010 F1            [10] 2801 	pop	af
   7011 F1            [10] 2802 	pop	af
   7012 4E            [ 7] 2803 	ld	c,(hl)
   7013 3E 02         [ 7] 2804 	ld	a,#0x02
   7015 91            [ 4] 2805 	sub	a, c
   7016 38 13         [12] 2806 	jr	C,00137$
                           2807 ;src/main.c:546: moverEnemigoDerecha(enemy);
   7018 DD 6E F7      [19] 2808 	ld	l,-9 (ix)
   701B DD 66 F8      [19] 2809 	ld	h,-8 (ix)
   701E E5            [11] 2810 	push	hl
   701F CD EF 68      [17] 2811 	call	_moverEnemigoDerecha
   7022 F1            [10] 2812 	pop	af
                           2813 ;src/main.c:547: movX = 1;
   7023 DD 36 F6 01   [19] 2814 	ld	-10 (ix),#0x01
                           2815 ;src/main.c:548: mov = 1;
   7027 DD 36 F4 01   [19] 2816 	ld	-12 (ix),#0x01
   702B                    2817 00137$:
                           2818 ;src/main.c:551: if (dy < enemy->y) {
   702B DD 6E F9      [19] 2819 	ld	l,-7 (ix)
   702E DD 66 FA      [19] 2820 	ld	h,-6 (ix)
   7031 7E            [ 7] 2821 	ld	a,(hl)
   7032 DD 77 FD      [19] 2822 	ld	-3 (ix),a
                           2823 ;src/main.c:480: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7035 DD 6E F7      [19] 2824 	ld	l,-9 (ix)
   7038 DD 66 F8      [19] 2825 	ld	h,-8 (ix)
   703B 7E            [ 7] 2826 	ld	a,(hl)
   703C DD 77 FC      [19] 2827 	ld	-4 (ix),a
                           2828 ;src/main.c:551: if (dy < enemy->y) {
   703F DD 7E 07      [19] 2829 	ld	a,7 (ix)
   7042 DD 96 FD      [19] 2830 	sub	a, -3 (ix)
   7045 D2 DB 70      [10] 2831 	jp	NC,00147$
                           2832 ;src/main.c:552: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7048 DD 7E FD      [19] 2833 	ld	a,-3 (ix)
   704B C6 FE         [ 7] 2834 	add	a,#0xFE
   704D DD 77 FB      [19] 2835 	ld	-5 (ix), a
   7050 F5            [11] 2836 	push	af
   7051 33            [ 6] 2837 	inc	sp
   7052 DD 7E FC      [19] 2838 	ld	a,-4 (ix)
   7055 F5            [11] 2839 	push	af
   7056 33            [ 6] 2840 	inc	sp
   7057 2A 45 60      [16] 2841 	ld	hl,(_mapa)
   705A E5            [11] 2842 	push	hl
   705B CD B5 49      [17] 2843 	call	_getTilePtr
   705E F1            [10] 2844 	pop	af
   705F F1            [10] 2845 	pop	af
   7060 DD 74 FF      [19] 2846 	ld	-1 (ix),h
   7063 DD 75 FE      [19] 2847 	ld	-2 (ix), l
   7066 DD 66 FF      [19] 2848 	ld	h,-1 (ix)
   7069 4E            [ 7] 2849 	ld	c,(hl)
   706A 3E 02         [ 7] 2850 	ld	a,#0x02
   706C 91            [ 4] 2851 	sub	a, c
   706D DA 56 71      [10] 2852 	jp	C,00148$
                           2853 ;src/main.c:553: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7070 DD 6E F9      [19] 2854 	ld	l,-7 (ix)
   7073 DD 66 FA      [19] 2855 	ld	h,-6 (ix)
   7076 7E            [ 7] 2856 	ld	a,(hl)
   7077 DD 77 FE      [19] 2857 	ld	-2 (ix), a
   707A C6 FE         [ 7] 2858 	add	a,#0xFE
   707C DD 77 FE      [19] 2859 	ld	-2 (ix),a
   707F DD 6E F7      [19] 2860 	ld	l,-9 (ix)
   7082 DD 66 F8      [19] 2861 	ld	h,-8 (ix)
   7085 46            [ 7] 2862 	ld	b,(hl)
   7086 04            [ 4] 2863 	inc	b
   7087 04            [ 4] 2864 	inc	b
   7088 DD 7E FE      [19] 2865 	ld	a,-2 (ix)
   708B F5            [11] 2866 	push	af
   708C 33            [ 6] 2867 	inc	sp
   708D C5            [11] 2868 	push	bc
   708E 33            [ 6] 2869 	inc	sp
   708F 2A 45 60      [16] 2870 	ld	hl,(_mapa)
   7092 E5            [11] 2871 	push	hl
   7093 CD B5 49      [17] 2872 	call	_getTilePtr
   7096 F1            [10] 2873 	pop	af
   7097 F1            [10] 2874 	pop	af
   7098 4E            [ 7] 2875 	ld	c,(hl)
   7099 3E 02         [ 7] 2876 	ld	a,#0x02
   709B 91            [ 4] 2877 	sub	a, c
   709C DA 56 71      [10] 2878 	jp	C,00148$
                           2879 ;src/main.c:554: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   709F DD 6E F9      [19] 2880 	ld	l,-7 (ix)
   70A2 DD 66 FA      [19] 2881 	ld	h,-6 (ix)
   70A5 46            [ 7] 2882 	ld	b,(hl)
   70A6 05            [ 4] 2883 	dec	b
   70A7 05            [ 4] 2884 	dec	b
   70A8 DD 6E F7      [19] 2885 	ld	l,-9 (ix)
   70AB DD 66 F8      [19] 2886 	ld	h,-8 (ix)
   70AE 7E            [ 7] 2887 	ld	a,(hl)
   70AF C6 04         [ 7] 2888 	add	a, #0x04
   70B1 C5            [11] 2889 	push	bc
   70B2 33            [ 6] 2890 	inc	sp
   70B3 F5            [11] 2891 	push	af
   70B4 33            [ 6] 2892 	inc	sp
   70B5 2A 45 60      [16] 2893 	ld	hl,(_mapa)
   70B8 E5            [11] 2894 	push	hl
   70B9 CD B5 49      [17] 2895 	call	_getTilePtr
   70BC F1            [10] 2896 	pop	af
   70BD F1            [10] 2897 	pop	af
   70BE 4E            [ 7] 2898 	ld	c,(hl)
   70BF 3E 02         [ 7] 2899 	ld	a,#0x02
   70C1 91            [ 4] 2900 	sub	a, c
   70C2 DA 56 71      [10] 2901 	jp	C,00148$
                           2902 ;src/main.c:555: moverEnemigoArriba(enemy);
   70C5 DD 6E F7      [19] 2903 	ld	l,-9 (ix)
   70C8 DD 66 F8      [19] 2904 	ld	h,-8 (ix)
   70CB E5            [11] 2905 	push	hl
   70CC CD B1 68      [17] 2906 	call	_moverEnemigoArriba
   70CF F1            [10] 2907 	pop	af
                           2908 ;src/main.c:556: movY = 1;
   70D0 DD 36 F5 01   [19] 2909 	ld	-11 (ix),#0x01
                           2910 ;src/main.c:557: mov = 1;
   70D4 DD 36 F4 01   [19] 2911 	ld	-12 (ix),#0x01
   70D8 C3 56 71      [10] 2912 	jp	00148$
   70DB                    2913 00147$:
                           2914 ;src/main.c:560: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   70DB DD 7E FD      [19] 2915 	ld	a,-3 (ix)
   70DE C6 18         [ 7] 2916 	add	a, #0x18
   70E0 47            [ 4] 2917 	ld	b,a
   70E1 C5            [11] 2918 	push	bc
   70E2 33            [ 6] 2919 	inc	sp
   70E3 DD 7E FC      [19] 2920 	ld	a,-4 (ix)
   70E6 F5            [11] 2921 	push	af
   70E7 33            [ 6] 2922 	inc	sp
   70E8 2A 45 60      [16] 2923 	ld	hl,(_mapa)
   70EB E5            [11] 2924 	push	hl
   70EC CD B5 49      [17] 2925 	call	_getTilePtr
   70EF F1            [10] 2926 	pop	af
   70F0 F1            [10] 2927 	pop	af
   70F1 4E            [ 7] 2928 	ld	c,(hl)
   70F2 3E 02         [ 7] 2929 	ld	a,#0x02
   70F4 91            [ 4] 2930 	sub	a, c
   70F5 38 5F         [12] 2931 	jr	C,00148$
                           2932 ;src/main.c:561: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   70F7 DD 6E F9      [19] 2933 	ld	l,-7 (ix)
   70FA DD 66 FA      [19] 2934 	ld	h,-6 (ix)
   70FD 7E            [ 7] 2935 	ld	a,(hl)
   70FE C6 18         [ 7] 2936 	add	a, #0x18
   7100 57            [ 4] 2937 	ld	d,a
   7101 DD 6E F7      [19] 2938 	ld	l,-9 (ix)
   7104 DD 66 F8      [19] 2939 	ld	h,-8 (ix)
   7107 46            [ 7] 2940 	ld	b,(hl)
   7108 04            [ 4] 2941 	inc	b
   7109 04            [ 4] 2942 	inc	b
   710A D5            [11] 2943 	push	de
   710B 33            [ 6] 2944 	inc	sp
   710C C5            [11] 2945 	push	bc
   710D 33            [ 6] 2946 	inc	sp
   710E 2A 45 60      [16] 2947 	ld	hl,(_mapa)
   7111 E5            [11] 2948 	push	hl
   7112 CD B5 49      [17] 2949 	call	_getTilePtr
   7115 F1            [10] 2950 	pop	af
   7116 F1            [10] 2951 	pop	af
   7117 4E            [ 7] 2952 	ld	c,(hl)
   7118 3E 02         [ 7] 2953 	ld	a,#0x02
   711A 91            [ 4] 2954 	sub	a, c
   711B 38 39         [12] 2955 	jr	C,00148$
                           2956 ;src/main.c:562: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   711D DD 6E F9      [19] 2957 	ld	l,-7 (ix)
   7120 DD 66 FA      [19] 2958 	ld	h,-6 (ix)
   7123 7E            [ 7] 2959 	ld	a,(hl)
   7124 C6 18         [ 7] 2960 	add	a, #0x18
   7126 47            [ 4] 2961 	ld	b,a
   7127 DD 6E F7      [19] 2962 	ld	l,-9 (ix)
   712A DD 66 F8      [19] 2963 	ld	h,-8 (ix)
   712D 7E            [ 7] 2964 	ld	a,(hl)
   712E C6 04         [ 7] 2965 	add	a, #0x04
   7130 C5            [11] 2966 	push	bc
   7131 33            [ 6] 2967 	inc	sp
   7132 F5            [11] 2968 	push	af
   7133 33            [ 6] 2969 	inc	sp
   7134 2A 45 60      [16] 2970 	ld	hl,(_mapa)
   7137 E5            [11] 2971 	push	hl
   7138 CD B5 49      [17] 2972 	call	_getTilePtr
   713B F1            [10] 2973 	pop	af
   713C F1            [10] 2974 	pop	af
   713D 4E            [ 7] 2975 	ld	c,(hl)
   713E 3E 02         [ 7] 2976 	ld	a,#0x02
   7140 91            [ 4] 2977 	sub	a, c
   7141 38 13         [12] 2978 	jr	C,00148$
                           2979 ;src/main.c:563: moverEnemigoAbajo(enemy);
   7143 DD 6E F7      [19] 2980 	ld	l,-9 (ix)
   7146 DD 66 F8      [19] 2981 	ld	h,-8 (ix)
   7149 E5            [11] 2982 	push	hl
   714A CD D0 68      [17] 2983 	call	_moverEnemigoAbajo
   714D F1            [10] 2984 	pop	af
                           2985 ;src/main.c:564: movY = 1;
   714E DD 36 F5 01   [19] 2986 	ld	-11 (ix),#0x01
                           2987 ;src/main.c:565: mov = 1;
   7152 DD 36 F4 01   [19] 2988 	ld	-12 (ix),#0x01
   7156                    2989 00148$:
                           2990 ;src/main.c:568: if (!mov) {
   7156 DD 7E F4      [19] 2991 	ld	a,-12 (ix)
   7159 B7            [ 4] 2992 	or	a, a
   715A C2 78 73      [10] 2993 	jp	NZ,00189$
                           2994 ;src/main.c:569: if (!movX) {
   715D DD 7E F6      [19] 2995 	ld	a,-10 (ix)
   7160 B7            [ 4] 2996 	or	a, a
   7161 C2 68 72      [10] 2997 	jp	NZ,00163$
                           2998 ;src/main.c:570: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   7164 DD 6E F9      [19] 2999 	ld	l,-7 (ix)
   7167 DD 66 FA      [19] 3000 	ld	h,-6 (ix)
   716A 5E            [ 7] 3001 	ld	e,(hl)
                           3002 ;src/main.c:480: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   716B DD 6E F7      [19] 3003 	ld	l,-9 (ix)
   716E DD 66 F8      [19] 3004 	ld	h,-8 (ix)
   7171 4E            [ 7] 3005 	ld	c,(hl)
                           3006 ;src/main.c:570: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   7172 3E 70         [ 7] 3007 	ld	a,#0x70
   7174 93            [ 4] 3008 	sub	a, e
   7175 30 7C         [12] 3009 	jr	NC,00160$
                           3010 ;src/main.c:571: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7177 7B            [ 4] 3011 	ld	a,e
   7178 C6 18         [ 7] 3012 	add	a, #0x18
   717A 47            [ 4] 3013 	ld	b,a
   717B C5            [11] 3014 	push	bc
   717C 2A 45 60      [16] 3015 	ld	hl,(_mapa)
   717F E5            [11] 3016 	push	hl
   7180 CD B5 49      [17] 3017 	call	_getTilePtr
   7183 F1            [10] 3018 	pop	af
   7184 F1            [10] 3019 	pop	af
   7185 4E            [ 7] 3020 	ld	c,(hl)
   7186 3E 02         [ 7] 3021 	ld	a,#0x02
   7188 91            [ 4] 3022 	sub	a, c
   7189 38 5B         [12] 3023 	jr	C,00150$
                           3024 ;src/main.c:572: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   718B DD 6E F9      [19] 3025 	ld	l,-7 (ix)
   718E DD 66 FA      [19] 3026 	ld	h,-6 (ix)
   7191 7E            [ 7] 3027 	ld	a,(hl)
   7192 C6 18         [ 7] 3028 	add	a, #0x18
   7194 57            [ 4] 3029 	ld	d,a
   7195 DD 6E F7      [19] 3030 	ld	l,-9 (ix)
   7198 DD 66 F8      [19] 3031 	ld	h,-8 (ix)
   719B 4E            [ 7] 3032 	ld	c,(hl)
   719C 41            [ 4] 3033 	ld	b,c
   719D 04            [ 4] 3034 	inc	b
   719E 04            [ 4] 3035 	inc	b
   719F D5            [11] 3036 	push	de
   71A0 33            [ 6] 3037 	inc	sp
   71A1 C5            [11] 3038 	push	bc
   71A2 33            [ 6] 3039 	inc	sp
   71A3 2A 45 60      [16] 3040 	ld	hl,(_mapa)
   71A6 E5            [11] 3041 	push	hl
   71A7 CD B5 49      [17] 3042 	call	_getTilePtr
   71AA F1            [10] 3043 	pop	af
   71AB F1            [10] 3044 	pop	af
   71AC 4E            [ 7] 3045 	ld	c,(hl)
   71AD 3E 02         [ 7] 3046 	ld	a,#0x02
   71AF 91            [ 4] 3047 	sub	a, c
   71B0 38 34         [12] 3048 	jr	C,00150$
                           3049 ;src/main.c:573: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   71B2 DD 6E F9      [19] 3050 	ld	l,-7 (ix)
   71B5 DD 66 FA      [19] 3051 	ld	h,-6 (ix)
   71B8 7E            [ 7] 3052 	ld	a,(hl)
   71B9 C6 18         [ 7] 3053 	add	a, #0x18
   71BB 47            [ 4] 3054 	ld	b,a
   71BC DD 6E F7      [19] 3055 	ld	l,-9 (ix)
   71BF DD 66 F8      [19] 3056 	ld	h,-8 (ix)
   71C2 7E            [ 7] 3057 	ld	a,(hl)
   71C3 C6 04         [ 7] 3058 	add	a, #0x04
   71C5 C5            [11] 3059 	push	bc
   71C6 33            [ 6] 3060 	inc	sp
   71C7 F5            [11] 3061 	push	af
   71C8 33            [ 6] 3062 	inc	sp
   71C9 2A 45 60      [16] 3063 	ld	hl,(_mapa)
   71CC E5            [11] 3064 	push	hl
   71CD CD B5 49      [17] 3065 	call	_getTilePtr
   71D0 F1            [10] 3066 	pop	af
   71D1 F1            [10] 3067 	pop	af
   71D2 4E            [ 7] 3068 	ld	c,(hl)
   71D3 3E 02         [ 7] 3069 	ld	a,#0x02
   71D5 91            [ 4] 3070 	sub	a, c
   71D6 38 0E         [12] 3071 	jr	C,00150$
                           3072 ;src/main.c:574: moverEnemigoAbajo(enemy);
   71D8 DD 6E F7      [19] 3073 	ld	l,-9 (ix)
   71DB DD 66 F8      [19] 3074 	ld	h,-8 (ix)
   71DE E5            [11] 3075 	push	hl
   71DF CD D0 68      [17] 3076 	call	_moverEnemigoAbajo
   71E2 F1            [10] 3077 	pop	af
   71E3 C3 68 72      [10] 3078 	jp	00163$
   71E6                    3079 00150$:
                           3080 ;src/main.c:576: moverEnemigoArriba(enemy);
   71E6 DD 6E F7      [19] 3081 	ld	l,-9 (ix)
   71E9 DD 66 F8      [19] 3082 	ld	h,-8 (ix)
   71EC E5            [11] 3083 	push	hl
   71ED CD B1 68      [17] 3084 	call	_moverEnemigoArriba
   71F0 F1            [10] 3085 	pop	af
   71F1 18 75         [12] 3086 	jr	00163$
   71F3                    3087 00160$:
                           3088 ;src/main.c:578: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   71F3 43            [ 4] 3089 	ld	b,e
   71F4 05            [ 4] 3090 	dec	b
   71F5 05            [ 4] 3091 	dec	b
   71F6 C5            [11] 3092 	push	bc
   71F7 2A 45 60      [16] 3093 	ld	hl,(_mapa)
   71FA E5            [11] 3094 	push	hl
   71FB CD B5 49      [17] 3095 	call	_getTilePtr
   71FE F1            [10] 3096 	pop	af
   71FF F1            [10] 3097 	pop	af
   7200 4E            [ 7] 3098 	ld	c,(hl)
   7201 3E 02         [ 7] 3099 	ld	a,#0x02
   7203 91            [ 4] 3100 	sub	a, c
   7204 38 57         [12] 3101 	jr	C,00155$
                           3102 ;src/main.c:579: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7206 DD 6E F9      [19] 3103 	ld	l,-7 (ix)
   7209 DD 66 FA      [19] 3104 	ld	h,-6 (ix)
   720C 56            [ 7] 3105 	ld	d,(hl)
   720D 15            [ 4] 3106 	dec	d
   720E 15            [ 4] 3107 	dec	d
   720F DD 6E F7      [19] 3108 	ld	l,-9 (ix)
   7212 DD 66 F8      [19] 3109 	ld	h,-8 (ix)
   7215 46            [ 7] 3110 	ld	b,(hl)
   7216 04            [ 4] 3111 	inc	b
   7217 04            [ 4] 3112 	inc	b
   7218 D5            [11] 3113 	push	de
   7219 33            [ 6] 3114 	inc	sp
   721A C5            [11] 3115 	push	bc
   721B 33            [ 6] 3116 	inc	sp
   721C 2A 45 60      [16] 3117 	ld	hl,(_mapa)
   721F E5            [11] 3118 	push	hl
   7220 CD B5 49      [17] 3119 	call	_getTilePtr
   7223 F1            [10] 3120 	pop	af
   7224 F1            [10] 3121 	pop	af
   7225 4E            [ 7] 3122 	ld	c,(hl)
   7226 3E 02         [ 7] 3123 	ld	a,#0x02
   7228 91            [ 4] 3124 	sub	a, c
   7229 38 32         [12] 3125 	jr	C,00155$
                           3126 ;src/main.c:580: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   722B DD 6E F9      [19] 3127 	ld	l,-7 (ix)
   722E DD 66 FA      [19] 3128 	ld	h,-6 (ix)
   7231 46            [ 7] 3129 	ld	b,(hl)
   7232 05            [ 4] 3130 	dec	b
   7233 05            [ 4] 3131 	dec	b
   7234 DD 6E F7      [19] 3132 	ld	l,-9 (ix)
   7237 DD 66 F8      [19] 3133 	ld	h,-8 (ix)
   723A 7E            [ 7] 3134 	ld	a,(hl)
   723B C6 04         [ 7] 3135 	add	a, #0x04
   723D C5            [11] 3136 	push	bc
   723E 33            [ 6] 3137 	inc	sp
   723F F5            [11] 3138 	push	af
   7240 33            [ 6] 3139 	inc	sp
   7241 2A 45 60      [16] 3140 	ld	hl,(_mapa)
   7244 E5            [11] 3141 	push	hl
   7245 CD B5 49      [17] 3142 	call	_getTilePtr
   7248 F1            [10] 3143 	pop	af
   7249 F1            [10] 3144 	pop	af
   724A 4E            [ 7] 3145 	ld	c,(hl)
   724B 3E 02         [ 7] 3146 	ld	a,#0x02
   724D 91            [ 4] 3147 	sub	a, c
   724E 38 0D         [12] 3148 	jr	C,00155$
                           3149 ;src/main.c:581: moverEnemigoArriba(enemy);
   7250 DD 6E F7      [19] 3150 	ld	l,-9 (ix)
   7253 DD 66 F8      [19] 3151 	ld	h,-8 (ix)
   7256 E5            [11] 3152 	push	hl
   7257 CD B1 68      [17] 3153 	call	_moverEnemigoArriba
   725A F1            [10] 3154 	pop	af
   725B 18 0B         [12] 3155 	jr	00163$
   725D                    3156 00155$:
                           3157 ;src/main.c:583: moverEnemigoAbajo(enemy);
   725D DD 6E F7      [19] 3158 	ld	l,-9 (ix)
   7260 DD 66 F8      [19] 3159 	ld	h,-8 (ix)
   7263 E5            [11] 3160 	push	hl
   7264 CD D0 68      [17] 3161 	call	_moverEnemigoAbajo
   7267 F1            [10] 3162 	pop	af
   7268                    3163 00163$:
                           3164 ;src/main.c:587: if (!movY) {
   7268 DD 7E F5      [19] 3165 	ld	a,-11 (ix)
   726B B7            [ 4] 3166 	or	a, a
   726C C2 78 73      [10] 3167 	jp	NZ,00189$
                           3168 ;src/main.c:588: if (enemy->x < ANCHO_PANTALLA/2) {
   726F DD 6E F7      [19] 3169 	ld	l,-9 (ix)
   7272 DD 66 F8      [19] 3170 	ld	h,-8 (ix)
   7275 4E            [ 7] 3171 	ld	c,(hl)
                           3172 ;src/main.c:481: u8 dify = abs(enemy->y - prota.y);
   7276 DD 6E F9      [19] 3173 	ld	l,-7 (ix)
   7279 DD 66 FA      [19] 3174 	ld	h,-6 (ix)
   727C 5E            [ 7] 3175 	ld	e,(hl)
                           3176 ;src/main.c:588: if (enemy->x < ANCHO_PANTALLA/2) {
   727D 79            [ 4] 3177 	ld	a,c
   727E D6 28         [ 7] 3178 	sub	a, #0x28
   7280 D2 00 73      [10] 3179 	jp	NC,00175$
                           3180 ;src/main.c:589: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   7283 41            [ 4] 3181 	ld	b,c
   7284 05            [ 4] 3182 	dec	b
   7285 7B            [ 4] 3183 	ld	a,e
   7286 F5            [11] 3184 	push	af
   7287 33            [ 6] 3185 	inc	sp
   7288 C5            [11] 3186 	push	bc
   7289 33            [ 6] 3187 	inc	sp
   728A 2A 45 60      [16] 3188 	ld	hl,(_mapa)
   728D E5            [11] 3189 	push	hl
   728E CD B5 49      [17] 3190 	call	_getTilePtr
   7291 F1            [10] 3191 	pop	af
   7292 F1            [10] 3192 	pop	af
   7293 4E            [ 7] 3193 	ld	c,(hl)
   7294 3E 02         [ 7] 3194 	ld	a,#0x02
   7296 91            [ 4] 3195 	sub	a, c
   7297 38 5A         [12] 3196 	jr	C,00165$
                           3197 ;src/main.c:590: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   7299 DD 6E F9      [19] 3198 	ld	l,-7 (ix)
   729C DD 66 FA      [19] 3199 	ld	h,-6 (ix)
   729F 7E            [ 7] 3200 	ld	a,(hl)
   72A0 C6 0B         [ 7] 3201 	add	a, #0x0B
   72A2 4F            [ 4] 3202 	ld	c,a
   72A3 DD 6E F7      [19] 3203 	ld	l,-9 (ix)
   72A6 DD 66 F8      [19] 3204 	ld	h,-8 (ix)
   72A9 46            [ 7] 3205 	ld	b,(hl)
   72AA 05            [ 4] 3206 	dec	b
   72AB 79            [ 4] 3207 	ld	a,c
   72AC F5            [11] 3208 	push	af
   72AD 33            [ 6] 3209 	inc	sp
   72AE C5            [11] 3210 	push	bc
   72AF 33            [ 6] 3211 	inc	sp
   72B0 2A 45 60      [16] 3212 	ld	hl,(_mapa)
   72B3 E5            [11] 3213 	push	hl
   72B4 CD B5 49      [17] 3214 	call	_getTilePtr
   72B7 F1            [10] 3215 	pop	af
   72B8 F1            [10] 3216 	pop	af
   72B9 4E            [ 7] 3217 	ld	c,(hl)
   72BA 3E 02         [ 7] 3218 	ld	a,#0x02
   72BC 91            [ 4] 3219 	sub	a, c
   72BD 38 34         [12] 3220 	jr	C,00165$
                           3221 ;src/main.c:591: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   72BF DD 6E F9      [19] 3222 	ld	l,-7 (ix)
   72C2 DD 66 FA      [19] 3223 	ld	h,-6 (ix)
   72C5 7E            [ 7] 3224 	ld	a,(hl)
   72C6 C6 16         [ 7] 3225 	add	a, #0x16
   72C8 4F            [ 4] 3226 	ld	c,a
   72C9 DD 6E F7      [19] 3227 	ld	l,-9 (ix)
   72CC DD 66 F8      [19] 3228 	ld	h,-8 (ix)
   72CF 46            [ 7] 3229 	ld	b,(hl)
   72D0 05            [ 4] 3230 	dec	b
   72D1 79            [ 4] 3231 	ld	a,c
   72D2 F5            [11] 3232 	push	af
   72D3 33            [ 6] 3233 	inc	sp
   72D4 C5            [11] 3234 	push	bc
   72D5 33            [ 6] 3235 	inc	sp
   72D6 2A 45 60      [16] 3236 	ld	hl,(_mapa)
   72D9 E5            [11] 3237 	push	hl
   72DA CD B5 49      [17] 3238 	call	_getTilePtr
   72DD F1            [10] 3239 	pop	af
   72DE F1            [10] 3240 	pop	af
   72DF 4E            [ 7] 3241 	ld	c,(hl)
   72E0 3E 02         [ 7] 3242 	ld	a,#0x02
   72E2 91            [ 4] 3243 	sub	a, c
   72E3 38 0E         [12] 3244 	jr	C,00165$
                           3245 ;src/main.c:592: moverEnemigoIzquierda(enemy);
   72E5 DD 6E F7      [19] 3246 	ld	l,-9 (ix)
   72E8 DD 66 F8      [19] 3247 	ld	h,-8 (ix)
   72EB E5            [11] 3248 	push	hl
   72EC CD FF 68      [17] 3249 	call	_moverEnemigoIzquierda
   72EF F1            [10] 3250 	pop	af
   72F0 C3 78 73      [10] 3251 	jp	00189$
   72F3                    3252 00165$:
                           3253 ;src/main.c:594: moverEnemigoDerecha(enemy);
   72F3 DD 6E F7      [19] 3254 	ld	l,-9 (ix)
   72F6 DD 66 F8      [19] 3255 	ld	h,-8 (ix)
   72F9 E5            [11] 3256 	push	hl
   72FA CD EF 68      [17] 3257 	call	_moverEnemigoDerecha
   72FD F1            [10] 3258 	pop	af
   72FE 18 78         [12] 3259 	jr	00189$
   7300                    3260 00175$:
                           3261 ;src/main.c:597: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   7300 79            [ 4] 3262 	ld	a,c
   7301 C6 05         [ 7] 3263 	add	a, #0x05
   7303 47            [ 4] 3264 	ld	b,a
   7304 7B            [ 4] 3265 	ld	a,e
   7305 F5            [11] 3266 	push	af
   7306 33            [ 6] 3267 	inc	sp
   7307 C5            [11] 3268 	push	bc
   7308 33            [ 6] 3269 	inc	sp
   7309 2A 45 60      [16] 3270 	ld	hl,(_mapa)
   730C E5            [11] 3271 	push	hl
   730D CD B5 49      [17] 3272 	call	_getTilePtr
   7310 F1            [10] 3273 	pop	af
   7311 F1            [10] 3274 	pop	af
   7312 4E            [ 7] 3275 	ld	c,(hl)
   7313 3E 02         [ 7] 3276 	ld	a,#0x02
   7315 91            [ 4] 3277 	sub	a, c
   7316 38 55         [12] 3278 	jr	C,00170$
                           3279 ;src/main.c:598: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   7318 DD 6E F9      [19] 3280 	ld	l,-7 (ix)
   731B DD 66 FA      [19] 3281 	ld	h,-6 (ix)
   731E 7E            [ 7] 3282 	ld	a,(hl)
   731F C6 0B         [ 7] 3283 	add	a, #0x0B
   7321 47            [ 4] 3284 	ld	b,a
   7322 DD 6E F7      [19] 3285 	ld	l,-9 (ix)
   7325 DD 66 F8      [19] 3286 	ld	h,-8 (ix)
   7328 7E            [ 7] 3287 	ld	a,(hl)
   7329 C6 05         [ 7] 3288 	add	a, #0x05
   732B 4F            [ 4] 3289 	ld	c,a
   732C C5            [11] 3290 	push	bc
   732D 2A 45 60      [16] 3291 	ld	hl,(_mapa)
   7330 E5            [11] 3292 	push	hl
   7331 CD B5 49      [17] 3293 	call	_getTilePtr
   7334 F1            [10] 3294 	pop	af
   7335 F1            [10] 3295 	pop	af
   7336 4E            [ 7] 3296 	ld	c,(hl)
   7337 3E 02         [ 7] 3297 	ld	a,#0x02
   7339 91            [ 4] 3298 	sub	a, c
   733A 38 31         [12] 3299 	jr	C,00170$
                           3300 ;src/main.c:599: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   733C DD 6E F9      [19] 3301 	ld	l,-7 (ix)
   733F DD 66 FA      [19] 3302 	ld	h,-6 (ix)
   7342 7E            [ 7] 3303 	ld	a,(hl)
   7343 C6 16         [ 7] 3304 	add	a, #0x16
   7345 47            [ 4] 3305 	ld	b,a
   7346 DD 6E F7      [19] 3306 	ld	l,-9 (ix)
   7349 DD 66 F8      [19] 3307 	ld	h,-8 (ix)
   734C 7E            [ 7] 3308 	ld	a,(hl)
   734D C6 05         [ 7] 3309 	add	a, #0x05
   734F 4F            [ 4] 3310 	ld	c,a
   7350 C5            [11] 3311 	push	bc
   7351 2A 45 60      [16] 3312 	ld	hl,(_mapa)
   7354 E5            [11] 3313 	push	hl
   7355 CD B5 49      [17] 3314 	call	_getTilePtr
   7358 F1            [10] 3315 	pop	af
   7359 F1            [10] 3316 	pop	af
   735A 4E            [ 7] 3317 	ld	c,(hl)
   735B 3E 02         [ 7] 3318 	ld	a,#0x02
   735D 91            [ 4] 3319 	sub	a, c
   735E 38 0D         [12] 3320 	jr	C,00170$
                           3321 ;src/main.c:600: moverEnemigoDerecha(enemy);
   7360 DD 6E F7      [19] 3322 	ld	l,-9 (ix)
   7363 DD 66 F8      [19] 3323 	ld	h,-8 (ix)
   7366 E5            [11] 3324 	push	hl
   7367 CD EF 68      [17] 3325 	call	_moverEnemigoDerecha
   736A F1            [10] 3326 	pop	af
   736B 18 0B         [12] 3327 	jr	00189$
   736D                    3328 00170$:
                           3329 ;src/main.c:603: moverEnemigoIzquierda(enemy);
   736D DD 6E F7      [19] 3330 	ld	l,-9 (ix)
   7370 DD 66 F8      [19] 3331 	ld	h,-8 (ix)
   7373 E5            [11] 3332 	push	hl
   7374 CD FF 68      [17] 3333 	call	_moverEnemigoIzquierda
   7377 F1            [10] 3334 	pop	af
   7378                    3335 00189$:
   7378 DD F9         [10] 3336 	ld	sp, ix
   737A DD E1         [14] 3337 	pop	ix
   737C C9            [10] 3338 	ret
                           3339 ;src/main.c:612: void updateEnemies() { // maquina de estados
                           3340 ;	---------------------------------
                           3341 ; Function updateEnemies
                           3342 ; ---------------------------------
   737D                    3343 _updateEnemies::
   737D DD E5         [15] 3344 	push	ix
   737F DD 21 00 00   [14] 3345 	ld	ix,#0
   7383 DD 39         [15] 3346 	add	ix,sp
   7385 21 F3 FF      [10] 3347 	ld	hl,#-13
   7388 39            [11] 3348 	add	hl,sp
   7389 F9            [ 6] 3349 	ld	sp,hl
                           3350 ;src/main.c:615: u8 i = 2 + 1;
   738A DD 36 F3 03   [19] 3351 	ld	-13 (ix),#0x03
                           3352 ;src/main.c:618: actual = enemy;
                           3353 ;src/main.c:619: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   738E 21 18 5A      [10] 3354 	ld	hl,#0x5A18
   7391 E5            [11] 3355 	push	hl
   7392 21 00 C0      [10] 3356 	ld	hl,#0xC000
   7395 E5            [11] 3357 	push	hl
   7396 CD 9E 5E      [17] 3358 	call	_cpct_getScreenPtr
                           3359 ;src/main.c:622: while(--i) {
   7399 01 F9 5E      [10] 3360 	ld	bc,#_enemy
   739C                    3361 00119$:
   739C DD 35 F3      [23] 3362 	dec	-13 (ix)
   739F DD 5E F3      [19] 3363 	ld	e, -13 (ix)
   73A2 7B            [ 4] 3364 	ld	a,e
   73A3 B7            [ 4] 3365 	or	a, a
   73A4 CA 04 75      [10] 3366 	jp	Z,00122$
                           3367 ;src/main.c:623: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   73A7 21 16 00      [10] 3368 	ld	hl,#0x0016
   73AA 09            [11] 3369 	add	hl,bc
   73AB DD 75 F7      [19] 3370 	ld	-9 (ix),l
   73AE DD 74 F8      [19] 3371 	ld	-8 (ix),h
   73B1 DD 6E F7      [19] 3372 	ld	l,-9 (ix)
   73B4 DD 66 F8      [19] 3373 	ld	h,-8 (ix)
   73B7 7E            [ 7] 3374 	ld	a,(hl)
   73B8 B7            [ 4] 3375 	or	a, a
   73B9 28 16         [12] 3376 	jr	Z,00117$
                           3377 ;src/main.c:624: engage(actual, prota.x, prota.y);
   73BB 3A 6A 5F      [13] 3378 	ld	a, (#(_prota + 0x0001) + 0)
   73BE 21 69 5F      [10] 3379 	ld	hl, #_prota + 0
   73C1 56            [ 7] 3380 	ld	d,(hl)
   73C2 C5            [11] 3381 	push	bc
   73C3 F5            [11] 3382 	push	af
   73C4 33            [ 6] 3383 	inc	sp
   73C5 D5            [11] 3384 	push	de
   73C6 33            [ 6] 3385 	inc	sp
   73C7 C5            [11] 3386 	push	bc
   73C8 CD 87 6C      [17] 3387 	call	_engage
   73CB F1            [10] 3388 	pop	af
   73CC F1            [10] 3389 	pop	af
   73CD C1            [10] 3390 	pop	bc
   73CE C3 FB 74      [10] 3391 	jp	00118$
   73D1                    3392 00117$:
                           3393 ;src/main.c:626: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   73D1 C5            [11] 3394 	push	bc
   73D2 C5            [11] 3395 	push	bc
   73D3 CD 2F 6C      [17] 3396 	call	_lookFor
   73D6 F1            [10] 3397 	pop	af
   73D7 C1            [10] 3398 	pop	bc
                           3399 ;src/main.c:627: if (actual->patrolling) { // esta patrullando
   73D8 21 0B 00      [10] 3400 	ld	hl,#0x000B
   73DB 09            [11] 3401 	add	hl,bc
   73DC DD 75 F4      [19] 3402 	ld	-12 (ix),l
   73DF DD 74 F5      [19] 3403 	ld	-11 (ix),h
   73E2 DD 6E F4      [19] 3404 	ld	l,-12 (ix)
   73E5 DD 66 F5      [19] 3405 	ld	h,-11 (ix)
   73E8 6E            [ 7] 3406 	ld	l,(hl)
                           3407 ;src/main.c:629: if (actual->inRange) {
   73E9 79            [ 4] 3408 	ld	a,c
   73EA C6 11         [ 7] 3409 	add	a, #0x11
   73EC 5F            [ 4] 3410 	ld	e,a
   73ED 78            [ 4] 3411 	ld	a,b
   73EE CE 00         [ 7] 3412 	adc	a, #0x00
   73F0 57            [ 4] 3413 	ld	d,a
                           3414 ;src/main.c:638: actual->seek = 1;
   73F1 79            [ 4] 3415 	ld	a,c
   73F2 C6 14         [ 7] 3416 	add	a, #0x14
   73F4 DD 77 FE      [19] 3417 	ld	-2 (ix),a
   73F7 78            [ 4] 3418 	ld	a,b
   73F8 CE 00         [ 7] 3419 	adc	a, #0x00
   73FA DD 77 FF      [19] 3420 	ld	-1 (ix),a
                           3421 ;src/main.c:627: if (actual->patrolling) { // esta patrullando
   73FD 7D            [ 4] 3422 	ld	a,l
   73FE B7            [ 4] 3423 	or	a, a
   73FF CA C0 74      [10] 3424 	jp	Z,00114$
                           3425 ;src/main.c:628: moverEnemigoPatrol(actual);
   7402 C5            [11] 3426 	push	bc
   7403 D5            [11] 3427 	push	de
   7404 C5            [11] 3428 	push	bc
   7405 CD 11 69      [17] 3429 	call	_moverEnemigoPatrol
   7408 F1            [10] 3430 	pop	af
   7409 D1            [10] 3431 	pop	de
   740A C1            [10] 3432 	pop	bc
                           3433 ;src/main.c:629: if (actual->inRange) {
   740B 1A            [ 7] 3434 	ld	a,(de)
   740C B7            [ 4] 3435 	or	a, a
   740D 28 26         [12] 3436 	jr	Z,00104$
                           3437 ;src/main.c:630: engage(actual, prota.x, prota.y);
   740F 3A 6A 5F      [13] 3438 	ld	a, (#(_prota + 0x0001) + 0)
   7412 21 69 5F      [10] 3439 	ld	hl, #_prota + 0
   7415 56            [ 7] 3440 	ld	d,(hl)
   7416 C5            [11] 3441 	push	bc
   7417 F5            [11] 3442 	push	af
   7418 33            [ 6] 3443 	inc	sp
   7419 D5            [11] 3444 	push	de
   741A 33            [ 6] 3445 	inc	sp
   741B C5            [11] 3446 	push	bc
   741C CD 87 6C      [17] 3447 	call	_engage
   741F F1            [10] 3448 	pop	af
   7420 F1            [10] 3449 	pop	af
   7421 C1            [10] 3450 	pop	bc
                           3451 ;src/main.c:631: actual->patrolling = 0;
   7422 DD 6E F4      [19] 3452 	ld	l,-12 (ix)
   7425 DD 66 F5      [19] 3453 	ld	h,-11 (ix)
   7428 36 00         [10] 3454 	ld	(hl),#0x00
                           3455 ;src/main.c:632: actual->engage = 1;
   742A DD 6E F7      [19] 3456 	ld	l,-9 (ix)
   742D DD 66 F8      [19] 3457 	ld	h,-8 (ix)
   7430 36 01         [10] 3458 	ld	(hl),#0x01
   7432 C3 FB 74      [10] 3459 	jp	00118$
   7435                    3460 00104$:
                           3461 ;src/main.c:633: } else if (actual->seen) {
   7435 21 12 00      [10] 3462 	ld	hl,#0x0012
   7438 09            [11] 3463 	add	hl,bc
   7439 DD 75 FC      [19] 3464 	ld	-4 (ix),l
   743C DD 74 FD      [19] 3465 	ld	-3 (ix),h
   743F DD 6E FC      [19] 3466 	ld	l,-4 (ix)
   7442 DD 66 FD      [19] 3467 	ld	h,-3 (ix)
   7445 7E            [ 7] 3468 	ld	a,(hl)
   7446 B7            [ 4] 3469 	or	a, a
   7447 CA FB 74      [10] 3470 	jp	Z,00118$
                           3471 ;src/main.c:635: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   744A 3A 6A 5F      [13] 3472 	ld	a,(#(_prota + 0x0001) + 0)
   744D DD 77 F9      [19] 3473 	ld	-7 (ix),a
   7450 3A 69 5F      [13] 3474 	ld	a,(#_prota + 0)
   7453 DD 77 F6      [19] 3475 	ld	-10 (ix),a
   7456 21 01 00      [10] 3476 	ld	hl,#0x0001
   7459 09            [11] 3477 	add	hl,bc
   745A DD 75 FA      [19] 3478 	ld	-6 (ix),l
   745D DD 74 FB      [19] 3479 	ld	-5 (ix),h
   7460 DD 6E FA      [19] 3480 	ld	l,-6 (ix)
   7463 DD 66 FB      [19] 3481 	ld	h,-5 (ix)
   7466 5E            [ 7] 3482 	ld	e,(hl)
   7467 0A            [ 7] 3483 	ld	a,(bc)
   7468 57            [ 4] 3484 	ld	d,a
   7469 C5            [11] 3485 	push	bc
   746A 2A 45 60      [16] 3486 	ld	hl,(_mapa)
   746D E5            [11] 3487 	push	hl
   746E C5            [11] 3488 	push	bc
   746F DD 66 F9      [19] 3489 	ld	h,-7 (ix)
   7472 DD 6E F6      [19] 3490 	ld	l,-10 (ix)
   7475 E5            [11] 3491 	push	hl
   7476 7B            [ 4] 3492 	ld	a,e
   7477 F5            [11] 3493 	push	af
   7478 33            [ 6] 3494 	inc	sp
   7479 D5            [11] 3495 	push	de
   747A 33            [ 6] 3496 	inc	sp
   747B CD 27 48      [17] 3497 	call	_pathFinding
   747E 21 08 00      [10] 3498 	ld	hl,#8
   7481 39            [11] 3499 	add	hl,sp
   7482 F9            [ 6] 3500 	ld	sp,hl
   7483 C1            [10] 3501 	pop	bc
                           3502 ;src/main.c:636: actual->p_seek_x = actual->x;
   7484 21 17 00      [10] 3503 	ld	hl,#0x0017
   7487 09            [11] 3504 	add	hl,bc
   7488 EB            [ 4] 3505 	ex	de,hl
   7489 0A            [ 7] 3506 	ld	a,(bc)
   748A 12            [ 7] 3507 	ld	(de),a
                           3508 ;src/main.c:637: actual->p_seek_y = actual->y;
   748B 21 18 00      [10] 3509 	ld	hl,#0x0018
   748E 09            [11] 3510 	add	hl,bc
   748F EB            [ 4] 3511 	ex	de,hl
   7490 DD 6E FA      [19] 3512 	ld	l,-6 (ix)
   7493 DD 66 FB      [19] 3513 	ld	h,-5 (ix)
   7496 7E            [ 7] 3514 	ld	a,(hl)
   7497 12            [ 7] 3515 	ld	(de),a
                           3516 ;src/main.c:638: actual->seek = 1;
   7498 DD 6E FE      [19] 3517 	ld	l,-2 (ix)
   749B DD 66 FF      [19] 3518 	ld	h,-1 (ix)
   749E 36 01         [10] 3519 	ld	(hl),#0x01
                           3520 ;src/main.c:639: actual->iter=0;
   74A0 21 0E 00      [10] 3521 	ld	hl,#0x000E
   74A3 09            [11] 3522 	add	hl,bc
   74A4 AF            [ 4] 3523 	xor	a, a
   74A5 77            [ 7] 3524 	ld	(hl), a
   74A6 23            [ 6] 3525 	inc	hl
   74A7 77            [ 7] 3526 	ld	(hl), a
                           3527 ;src/main.c:640: actual->reversePatrol = NO;
   74A8 21 0C 00      [10] 3528 	ld	hl,#0x000C
   74AB 09            [11] 3529 	add	hl,bc
   74AC 36 00         [10] 3530 	ld	(hl),#0x00
                           3531 ;src/main.c:641: actual->patrolling = 0;
   74AE DD 6E F4      [19] 3532 	ld	l,-12 (ix)
   74B1 DD 66 F5      [19] 3533 	ld	h,-11 (ix)
   74B4 36 00         [10] 3534 	ld	(hl),#0x00
                           3535 ;src/main.c:642: actual->seen = 0;
   74B6 DD 6E FC      [19] 3536 	ld	l,-4 (ix)
   74B9 DD 66 FD      [19] 3537 	ld	h,-3 (ix)
   74BC 36 00         [10] 3538 	ld	(hl),#0x00
   74BE 18 3B         [12] 3539 	jr	00118$
   74C0                    3540 00114$:
                           3541 ;src/main.c:644: } else if (actual->seek) {
   74C0 DD 6E FE      [19] 3542 	ld	l,-2 (ix)
   74C3 DD 66 FF      [19] 3543 	ld	h,-1 (ix)
   74C6 7E            [ 7] 3544 	ld	a,(hl)
   74C7 B7            [ 4] 3545 	or	a, a
   74C8 28 31         [12] 3546 	jr	Z,00118$
                           3547 ;src/main.c:646: if (!actual->found /*&& actual->seekTimer <= 5*/) {
   74CA C5            [11] 3548 	push	bc
   74CB FD E1         [14] 3549 	pop	iy
   74CD FD 7E 13      [19] 3550 	ld	a,19 (iy)
   74D0 B7            [ 4] 3551 	or	a, a
   74D1 20 09         [12] 3552 	jr	NZ,00109$
                           3553 ;src/main.c:647: moverEnemigoSeek(actual); // buscar en posiciones cercanas a la actual
   74D3 C5            [11] 3554 	push	bc
   74D4 C5            [11] 3555 	push	bc
   74D5 CD 27 6B      [17] 3556 	call	_moverEnemigoSeek
   74D8 F1            [10] 3557 	pop	af
   74D9 C1            [10] 3558 	pop	bc
   74DA 18 1F         [12] 3559 	jr	00118$
   74DC                    3560 00109$:
                           3561 ;src/main.c:648: } else if (actual->inRange) {
   74DC 1A            [ 7] 3562 	ld	a,(de)
   74DD B7            [ 4] 3563 	or	a, a
   74DE 28 1B         [12] 3564 	jr	Z,00118$
                           3565 ;src/main.c:649: engage(actual, prota.x, prota.y);
   74E0 3A 6A 5F      [13] 3566 	ld	a, (#(_prota + 0x0001) + 0)
   74E3 21 69 5F      [10] 3567 	ld	hl, #_prota + 0
   74E6 56            [ 7] 3568 	ld	d,(hl)
   74E7 C5            [11] 3569 	push	bc
   74E8 F5            [11] 3570 	push	af
   74E9 33            [ 6] 3571 	inc	sp
   74EA D5            [11] 3572 	push	de
   74EB 33            [ 6] 3573 	inc	sp
   74EC C5            [11] 3574 	push	bc
   74ED CD 87 6C      [17] 3575 	call	_engage
   74F0 F1            [10] 3576 	pop	af
   74F1 F1            [10] 3577 	pop	af
   74F2 C1            [10] 3578 	pop	bc
                           3579 ;src/main.c:650: actual->engage = 1;
   74F3 DD 6E F7      [19] 3580 	ld	l,-9 (ix)
   74F6 DD 66 F8      [19] 3581 	ld	h,-8 (ix)
   74F9 36 01         [10] 3582 	ld	(hl),#0x01
   74FB                    3583 00118$:
                           3584 ;src/main.c:654: actual++;
   74FB 21 1C 00      [10] 3585 	ld	hl,#0x001C
   74FE 09            [11] 3586 	add	hl,bc
   74FF 4D            [ 4] 3587 	ld	c,l
   7500 44            [ 4] 3588 	ld	b,h
   7501 C3 9C 73      [10] 3589 	jp	00119$
   7504                    3590 00122$:
   7504 DD F9         [10] 3591 	ld	sp, ix
   7506 DD E1         [14] 3592 	pop	ix
   7508 C9            [10] 3593 	ret
                           3594 ;src/main.c:658: void inicializarEnemy() {
                           3595 ;	---------------------------------
                           3596 ; Function inicializarEnemy
                           3597 ; ---------------------------------
   7509                    3598 _inicializarEnemy::
   7509 DD E5         [15] 3599 	push	ix
   750B DD 21 00 00   [14] 3600 	ld	ix,#0
   750F DD 39         [15] 3601 	add	ix,sp
   7511 F5            [11] 3602 	push	af
   7512 F5            [11] 3603 	push	af
                           3604 ;src/main.c:669: actual = enemy;
   7513 01 F9 5E      [10] 3605 	ld	bc,#_enemy+0
                           3606 ;src/main.c:670: while(--i){
   7516 DD 36 FC 03   [19] 3607 	ld	-4 (ix),#0x03
   751A                    3608 00103$:
   751A DD 35 FC      [23] 3609 	dec	-4 (ix)
   751D DD 7E FC      [19] 3610 	ld	a,-4 (ix)
   7520 B7            [ 4] 3611 	or	a, a
   7521 CA 02 76      [10] 3612 	jp	Z,00106$
                           3613 ;src/main.c:671: actual->x = actual->px = spawnX[i];
   7524 59            [ 4] 3614 	ld	e, c
   7525 50            [ 4] 3615 	ld	d, b
   7526 13            [ 6] 3616 	inc	de
   7527 13            [ 6] 3617 	inc	de
   7528 3E 6B         [ 7] 3618 	ld	a,#<(_spawnX)
   752A DD 86 FC      [19] 3619 	add	a, -4 (ix)
   752D 6F            [ 4] 3620 	ld	l,a
   752E 3E 60         [ 7] 3621 	ld	a,#>(_spawnX)
   7530 CE 00         [ 7] 3622 	adc	a, #0x00
   7532 67            [ 4] 3623 	ld	h,a
   7533 7E            [ 7] 3624 	ld	a,(hl)
   7534 DD 77 FD      [19] 3625 	ld	-3 (ix), a
   7537 12            [ 7] 3626 	ld	(de),a
   7538 DD 7E FD      [19] 3627 	ld	a,-3 (ix)
   753B 02            [ 7] 3628 	ld	(bc),a
                           3629 ;src/main.c:672: actual->y = actual->py = spawnY[i];
   753C C5            [11] 3630 	push	bc
   753D FD E1         [14] 3631 	pop	iy
   753F FD 23         [10] 3632 	inc	iy
   7541 59            [ 4] 3633 	ld	e, c
   7542 50            [ 4] 3634 	ld	d, b
   7543 13            [ 6] 3635 	inc	de
   7544 13            [ 6] 3636 	inc	de
   7545 13            [ 6] 3637 	inc	de
   7546 3E 70         [ 7] 3638 	ld	a,#<(_spawnY)
   7548 DD 86 FC      [19] 3639 	add	a, -4 (ix)
   754B 6F            [ 4] 3640 	ld	l,a
   754C 3E 60         [ 7] 3641 	ld	a,#>(_spawnY)
   754E CE 00         [ 7] 3642 	adc	a, #0x00
   7550 67            [ 4] 3643 	ld	h,a
   7551 7E            [ 7] 3644 	ld	a,(hl)
   7552 DD 77 FF      [19] 3645 	ld	-1 (ix), a
   7555 12            [ 7] 3646 	ld	(de),a
   7556 DD 7E FF      [19] 3647 	ld	a,-1 (ix)
   7559 FD 77 00      [19] 3648 	ld	0 (iy), a
                           3649 ;src/main.c:673: actual->mover  = NO;
   755C 21 06 00      [10] 3650 	ld	hl,#0x0006
   755F 09            [11] 3651 	add	hl,bc
   7560 36 00         [10] 3652 	ld	(hl),#0x00
                           3653 ;src/main.c:674: actual->mira   = M_abajo;
   7562 21 07 00      [10] 3654 	ld	hl,#0x0007
   7565 09            [11] 3655 	add	hl,bc
   7566 36 03         [10] 3656 	ld	(hl),#0x03
                           3657 ;src/main.c:675: actual->sprite = g_enemy;
   7568 21 04 00      [10] 3658 	ld	hl,#0x0004
   756B 09            [11] 3659 	add	hl,bc
   756C 36 3A         [10] 3660 	ld	(hl),#<(_g_enemy)
   756E 23            [ 6] 3661 	inc	hl
   756F 36 3C         [10] 3662 	ld	(hl),#>(_g_enemy)
                           3663 ;src/main.c:676: actual->muerto = NO;
   7571 21 08 00      [10] 3664 	ld	hl,#0x0008
   7574 09            [11] 3665 	add	hl,bc
   7575 36 00         [10] 3666 	ld	(hl),#0x00
                           3667 ;src/main.c:677: actual->muertes = 0;
   7577 21 0A 00      [10] 3668 	ld	hl,#0x000A
   757A 09            [11] 3669 	add	hl,bc
   757B 36 00         [10] 3670 	ld	(hl),#0x00
                           3671 ;src/main.c:678: actual->patrolling = SI;
   757D 21 0B 00      [10] 3672 	ld	hl,#0x000B
   7580 09            [11] 3673 	add	hl,bc
   7581 36 01         [10] 3674 	ld	(hl),#0x01
                           3675 ;src/main.c:679: actual->reversePatrol = NO;
   7583 21 0C 00      [10] 3676 	ld	hl,#0x000C
   7586 09            [11] 3677 	add	hl,bc
   7587 36 00         [10] 3678 	ld	(hl),#0x00
                           3679 ;src/main.c:680: actual->iter = 0;
   7589 21 0E 00      [10] 3680 	ld	hl,#0x000E
   758C 09            [11] 3681 	add	hl,bc
   758D AF            [ 4] 3682 	xor	a, a
   758E 77            [ 7] 3683 	ld	(hl), a
   758F 23            [ 6] 3684 	inc	hl
   7590 77            [ 7] 3685 	ld	(hl), a
                           3686 ;src/main.c:681: actual->lastIter = 0;
   7591 21 10 00      [10] 3687 	ld	hl,#0x0010
   7594 09            [11] 3688 	add	hl,bc
   7595 36 00         [10] 3689 	ld	(hl),#0x00
                           3690 ;src/main.c:682: actual->seen = 0;
   7597 21 12 00      [10] 3691 	ld	hl,#0x0012
   759A 09            [11] 3692 	add	hl,bc
   759B 36 00         [10] 3693 	ld	(hl),#0x00
                           3694 ;src/main.c:683: actual->found = 0;
   759D 21 13 00      [10] 3695 	ld	hl,#0x0013
   75A0 09            [11] 3696 	add	hl,bc
   75A1 36 00         [10] 3697 	ld	(hl),#0x00
                           3698 ;src/main.c:684: pathFinding(actual->x, actual->y, patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
   75A3 21 47 60      [10] 3699 	ld	hl,#_num_mapa + 0
   75A6 5E            [ 7] 3700 	ld	e, (hl)
   75A7 1C            [ 4] 3701 	inc	e
   75A8 16 00         [ 7] 3702 	ld	d,#0x00
   75AA 6B            [ 4] 3703 	ld	l, e
   75AB 62            [ 4] 3704 	ld	h, d
   75AC 29            [11] 3705 	add	hl, hl
   75AD 29            [11] 3706 	add	hl, hl
   75AE 19            [11] 3707 	add	hl, de
   75AF EB            [ 4] 3708 	ex	de,hl
   75B0 21 89 60      [10] 3709 	ld	hl,#_patrolY
   75B3 19            [11] 3710 	add	hl,de
   75B4 DD 7E FC      [19] 3711 	ld	a,-4 (ix)
   75B7 85            [ 4] 3712 	add	a, l
   75B8 6F            [ 4] 3713 	ld	l,a
   75B9 3E 00         [ 7] 3714 	ld	a,#0x00
   75BB 8C            [ 4] 3715 	adc	a, h
   75BC 67            [ 4] 3716 	ld	h,a
   75BD 7E            [ 7] 3717 	ld	a,(hl)
   75BE DD 77 FE      [19] 3718 	ld	-2 (ix),a
   75C1 21 75 60      [10] 3719 	ld	hl,#_patrolX
   75C4 19            [11] 3720 	add	hl,de
   75C5 DD 5E FC      [19] 3721 	ld	e,-4 (ix)
   75C8 16 00         [ 7] 3722 	ld	d,#0x00
   75CA 19            [11] 3723 	add	hl,de
   75CB 56            [ 7] 3724 	ld	d,(hl)
   75CC C5            [11] 3725 	push	bc
   75CD 2A 45 60      [16] 3726 	ld	hl,(_mapa)
   75D0 E5            [11] 3727 	push	hl
   75D1 C5            [11] 3728 	push	bc
   75D2 DD 7E FE      [19] 3729 	ld	a,-2 (ix)
   75D5 F5            [11] 3730 	push	af
   75D6 33            [ 6] 3731 	inc	sp
   75D7 D5            [11] 3732 	push	de
   75D8 33            [ 6] 3733 	inc	sp
   75D9 DD 66 FF      [19] 3734 	ld	h,-1 (ix)
   75DC DD 6E FD      [19] 3735 	ld	l,-3 (ix)
   75DF E5            [11] 3736 	push	hl
   75E0 CD 27 48      [17] 3737 	call	_pathFinding
   75E3 21 08 00      [10] 3738 	ld	hl,#8
   75E6 39            [11] 3739 	add	hl,sp
   75E7 F9            [ 6] 3740 	ld	sp,hl
   75E8 C1            [10] 3741 	pop	bc
                           3742 ;src/main.c:707: if(actual->longitud_camino > 0){
   75E9 C5            [11] 3743 	push	bc
   75EA FD E1         [14] 3744 	pop	iy
   75EC FD 7E 1B      [19] 3745 	ld	a,27 (iy)
   75EF B7            [ 4] 3746 	or	a, a
   75F0 28 07         [12] 3747 	jr	Z,00102$
                           3748 ;src/main.c:708: dibujarEnemigo(actual);
   75F2 C5            [11] 3749 	push	bc
   75F3 C5            [11] 3750 	push	bc
   75F4 CD 27 63      [17] 3751 	call	_dibujarEnemigo
   75F7 F1            [10] 3752 	pop	af
   75F8 C1            [10] 3753 	pop	bc
   75F9                    3754 00102$:
                           3755 ;src/main.c:710: ++actual;
   75F9 21 1C 00      [10] 3756 	ld	hl,#0x001C
   75FC 09            [11] 3757 	add	hl,bc
   75FD 4D            [ 4] 3758 	ld	c,l
   75FE 44            [ 4] 3759 	ld	b,h
   75FF C3 1A 75      [10] 3760 	jp	00103$
   7602                    3761 00106$:
   7602 DD F9         [10] 3762 	ld	sp, ix
   7604 DD E1         [14] 3763 	pop	ix
   7606 C9            [10] 3764 	ret
                           3765 ;src/main.c:714: void avanzarMapa() {
                           3766 ;	---------------------------------
                           3767 ; Function avanzarMapa
                           3768 ; ---------------------------------
   7607                    3769 _avanzarMapa::
                           3770 ;src/main.c:715: if(num_mapa < NUM_MAPAS -1) {
   7607 3A 47 60      [13] 3771 	ld	a,(#_num_mapa + 0)
   760A D6 02         [ 7] 3772 	sub	a, #0x02
   760C 30 34         [12] 3773 	jr	NC,00102$
                           3774 ;src/main.c:716: mapa = mapas[++num_mapa];
   760E 01 65 60      [10] 3775 	ld	bc,#_mapas+0
   7611 21 47 60      [10] 3776 	ld	hl, #_num_mapa+0
   7614 34            [11] 3777 	inc	(hl)
   7615 FD 21 47 60   [14] 3778 	ld	iy,#_num_mapa
   7619 FD 6E 00      [19] 3779 	ld	l,0 (iy)
   761C 26 00         [ 7] 3780 	ld	h,#0x00
   761E 29            [11] 3781 	add	hl, hl
   761F 09            [11] 3782 	add	hl,bc
   7620 7E            [ 7] 3783 	ld	a,(hl)
   7621 FD 21 45 60   [14] 3784 	ld	iy,#_mapa
   7625 FD 77 00      [19] 3785 	ld	0 (iy),a
   7628 23            [ 6] 3786 	inc	hl
   7629 7E            [ 7] 3787 	ld	a,(hl)
   762A 32 46 60      [13] 3788 	ld	(#_mapa + 1),a
                           3789 ;src/main.c:717: prota.x = prota.px = 2;
   762D 21 6B 5F      [10] 3790 	ld	hl,#(_prota + 0x0002)
   7630 36 02         [10] 3791 	ld	(hl),#0x02
   7632 21 69 5F      [10] 3792 	ld	hl,#_prota
   7635 36 02         [10] 3793 	ld	(hl),#0x02
                           3794 ;src/main.c:718: prota.mover = SI;
   7637 21 6F 5F      [10] 3795 	ld	hl,#(_prota + 0x0006)
   763A 36 01         [10] 3796 	ld	(hl),#0x01
                           3797 ;src/main.c:719: dibujarMapa();
   763C CD 4F 60      [17] 3798 	call	_dibujarMapa
                           3799 ;src/main.c:720: inicializarEnemy();
   763F C3 09 75      [10] 3800 	jp  _inicializarEnemy
   7642                    3801 00102$:
                           3802 ;src/main.c:723: menuFin(puntuacion);
   7642 FD 21 48 60   [14] 3803 	ld	iy,#_puntuacion
   7646 FD 6E 00      [19] 3804 	ld	l,0 (iy)
   7649 26 00         [ 7] 3805 	ld	h,#0x00
   764B C3 39 4A      [10] 3806 	jp  _menuFin
                           3807 ;src/main.c:727: void moverIzquierda() {
                           3808 ;	---------------------------------
                           3809 ; Function moverIzquierda
                           3810 ; ---------------------------------
   764E                    3811 _moverIzquierda::
                           3812 ;src/main.c:728: prota.mira = M_izquierda;
   764E 01 69 5F      [10] 3813 	ld	bc,#_prota+0
   7651 21 70 5F      [10] 3814 	ld	hl,#(_prota + 0x0007)
   7654 36 01         [10] 3815 	ld	(hl),#0x01
                           3816 ;src/main.c:729: if (!checkCollision(M_izquierda)) {
   7656 C5            [11] 3817 	push	bc
   7657 3E 01         [ 7] 3818 	ld	a,#0x01
   7659 F5            [11] 3819 	push	af
   765A 33            [ 6] 3820 	inc	sp
   765B CD B2 61      [17] 3821 	call	_checkCollision
   765E 33            [ 6] 3822 	inc	sp
   765F C1            [10] 3823 	pop	bc
   7660 7D            [ 4] 3824 	ld	a,l
   7661 B7            [ 4] 3825 	or	a, a
   7662 C0            [11] 3826 	ret	NZ
                           3827 ;src/main.c:730: prota.x--;
   7663 0A            [ 7] 3828 	ld	a,(bc)
   7664 C6 FF         [ 7] 3829 	add	a,#0xFF
   7666 02            [ 7] 3830 	ld	(bc),a
                           3831 ;src/main.c:731: prota.mover = SI;
   7667 21 6F 5F      [10] 3832 	ld	hl,#(_prota + 0x0006)
   766A 36 01         [10] 3833 	ld	(hl),#0x01
                           3834 ;src/main.c:732: prota.sprite = g_hero_left;
   766C 21 C6 3D      [10] 3835 	ld	hl,#_g_hero_left
   766F 22 6D 5F      [16] 3836 	ld	((_prota + 0x0004)), hl
   7672 C9            [10] 3837 	ret
                           3838 ;src/main.c:736: void moverDerecha() {
                           3839 ;	---------------------------------
                           3840 ; Function moverDerecha
                           3841 ; ---------------------------------
   7673                    3842 _moverDerecha::
                           3843 ;src/main.c:737: prota.mira = M_derecha;
   7673 21 70 5F      [10] 3844 	ld	hl,#(_prota + 0x0007)
   7676 36 00         [10] 3845 	ld	(hl),#0x00
                           3846 ;src/main.c:738: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7678 AF            [ 4] 3847 	xor	a, a
   7679 F5            [11] 3848 	push	af
   767A 33            [ 6] 3849 	inc	sp
   767B CD B2 61      [17] 3850 	call	_checkCollision
   767E 33            [ 6] 3851 	inc	sp
   767F 45            [ 4] 3852 	ld	b,l
   7680 21 69 5F      [10] 3853 	ld	hl, #_prota + 0
   7683 4E            [ 7] 3854 	ld	c,(hl)
   7684 59            [ 4] 3855 	ld	e,c
   7685 16 00         [ 7] 3856 	ld	d,#0x00
   7687 21 07 00      [10] 3857 	ld	hl,#0x0007
   768A 19            [11] 3858 	add	hl,de
   768B 11 50 80      [10] 3859 	ld	de, #0x8050
   768E 29            [11] 3860 	add	hl, hl
   768F 3F            [ 4] 3861 	ccf
   7690 CB 1C         [ 8] 3862 	rr	h
   7692 CB 1D         [ 8] 3863 	rr	l
   7694 ED 52         [15] 3864 	sbc	hl, de
   7696 3E 00         [ 7] 3865 	ld	a,#0x00
   7698 17            [ 4] 3866 	rla
   7699 5F            [ 4] 3867 	ld	e,a
   769A 78            [ 4] 3868 	ld	a,b
   769B B7            [ 4] 3869 	or	a,a
   769C 20 14         [12] 3870 	jr	NZ,00104$
   769E B3            [ 4] 3871 	or	a,e
   769F 28 11         [12] 3872 	jr	Z,00104$
                           3873 ;src/main.c:739: prota.x++;
   76A1 0C            [ 4] 3874 	inc	c
   76A2 21 69 5F      [10] 3875 	ld	hl,#_prota
   76A5 71            [ 7] 3876 	ld	(hl),c
                           3877 ;src/main.c:740: prota.mover = SI;
   76A6 21 6F 5F      [10] 3878 	ld	hl,#(_prota + 0x0006)
   76A9 36 01         [10] 3879 	ld	(hl),#0x01
                           3880 ;src/main.c:741: prota.sprite = g_hero;
   76AB 21 70 3E      [10] 3881 	ld	hl,#_g_hero
   76AE 22 6D 5F      [16] 3882 	ld	((_prota + 0x0004)), hl
   76B1 C9            [10] 3883 	ret
   76B2                    3884 00104$:
                           3885 ;src/main.c:743: }else if( prota.x + G_HERO_W >= 80){
   76B2 7B            [ 4] 3886 	ld	a,e
   76B3 B7            [ 4] 3887 	or	a, a
   76B4 C0            [11] 3888 	ret	NZ
                           3889 ;src/main.c:744: avanzarMapa();
   76B5 C3 07 76      [10] 3890 	jp  _avanzarMapa
                           3891 ;src/main.c:748: void moverArriba() {
                           3892 ;	---------------------------------
                           3893 ; Function moverArriba
                           3894 ; ---------------------------------
   76B8                    3895 _moverArriba::
                           3896 ;src/main.c:749: prota.mira = M_arriba;
   76B8 21 70 5F      [10] 3897 	ld	hl,#(_prota + 0x0007)
   76BB 36 02         [10] 3898 	ld	(hl),#0x02
                           3899 ;src/main.c:750: if (!checkCollision(M_arriba)) {
   76BD 3E 02         [ 7] 3900 	ld	a,#0x02
   76BF F5            [11] 3901 	push	af
   76C0 33            [ 6] 3902 	inc	sp
   76C1 CD B2 61      [17] 3903 	call	_checkCollision
   76C4 33            [ 6] 3904 	inc	sp
   76C5 7D            [ 4] 3905 	ld	a,l
   76C6 B7            [ 4] 3906 	or	a, a
   76C7 C0            [11] 3907 	ret	NZ
                           3908 ;src/main.c:751: prota.y--;
   76C8 21 6A 5F      [10] 3909 	ld	hl,#_prota + 1
   76CB 4E            [ 7] 3910 	ld	c,(hl)
   76CC 0D            [ 4] 3911 	dec	c
   76CD 71            [ 7] 3912 	ld	(hl),c
                           3913 ;src/main.c:752: prota.y--;
   76CE 0D            [ 4] 3914 	dec	c
   76CF 71            [ 7] 3915 	ld	(hl),c
                           3916 ;src/main.c:753: prota.mover  = SI;
   76D0 21 6F 5F      [10] 3917 	ld	hl,#(_prota + 0x0006)
   76D3 36 01         [10] 3918 	ld	(hl),#0x01
                           3919 ;src/main.c:754: prota.sprite = g_hero_up;
   76D5 21 2C 3D      [10] 3920 	ld	hl,#_g_hero_up
   76D8 22 6D 5F      [16] 3921 	ld	((_prota + 0x0004)), hl
   76DB C9            [10] 3922 	ret
                           3923 ;src/main.c:758: void moverAbajo() {
                           3924 ;	---------------------------------
                           3925 ; Function moverAbajo
                           3926 ; ---------------------------------
   76DC                    3927 _moverAbajo::
                           3928 ;src/main.c:759: prota.mira = M_abajo;
   76DC 21 70 5F      [10] 3929 	ld	hl,#(_prota + 0x0007)
   76DF 36 03         [10] 3930 	ld	(hl),#0x03
                           3931 ;src/main.c:760: if (!checkCollision(M_abajo) ) {
   76E1 3E 03         [ 7] 3932 	ld	a,#0x03
   76E3 F5            [11] 3933 	push	af
   76E4 33            [ 6] 3934 	inc	sp
   76E5 CD B2 61      [17] 3935 	call	_checkCollision
   76E8 33            [ 6] 3936 	inc	sp
   76E9 7D            [ 4] 3937 	ld	a,l
   76EA B7            [ 4] 3938 	or	a, a
   76EB C0            [11] 3939 	ret	NZ
                           3940 ;src/main.c:761: prota.y++;
   76EC 01 6A 5F      [10] 3941 	ld	bc,#_prota + 1
   76EF 0A            [ 7] 3942 	ld	a,(bc)
   76F0 3C            [ 4] 3943 	inc	a
   76F1 02            [ 7] 3944 	ld	(bc),a
                           3945 ;src/main.c:762: prota.y++;
   76F2 3C            [ 4] 3946 	inc	a
   76F3 02            [ 7] 3947 	ld	(bc),a
                           3948 ;src/main.c:763: prota.mover  = SI;
   76F4 21 6F 5F      [10] 3949 	ld	hl,#(_prota + 0x0006)
   76F7 36 01         [10] 3950 	ld	(hl),#0x01
                           3951 ;src/main.c:764: prota.sprite = g_hero_down;
   76F9 21 92 3C      [10] 3952 	ld	hl,#_g_hero_down
   76FC 22 6D 5F      [16] 3953 	ld	((_prota + 0x0004)), hl
   76FF C9            [10] 3954 	ret
                           3955 ;src/main.c:771: void intHandler() {
                           3956 ;	---------------------------------
                           3957 ; Function intHandler
                           3958 ; ---------------------------------
   7700                    3959 _intHandler::
                           3960 ;src/main.c:772: if (++i == 6) {
   7700 21 7B 5F      [10] 3961 	ld	hl, #_i+0
   7703 34            [11] 3962 	inc	(hl)
   7704 3A 7B 5F      [13] 3963 	ld	a,(#_i + 0)
   7707 D6 06         [ 7] 3964 	sub	a, #0x06
   7709 C0            [11] 3965 	ret	NZ
                           3966 ;src/main.c:773: play();
   770A CD CD 51      [17] 3967 	call	_play
                           3968 ;src/main.c:774: i=0;
   770D 21 7B 5F      [10] 3969 	ld	hl,#_i + 0
   7710 36 00         [10] 3970 	ld	(hl), #0x00
   7712 C9            [10] 3971 	ret
                           3972 ;src/main.c:778: void inicializarCPC() {
                           3973 ;	---------------------------------
                           3974 ; Function inicializarCPC
                           3975 ; ---------------------------------
   7713                    3976 _inicializarCPC::
                           3977 ;src/main.c:779: cpct_disableFirmware();
   7713 CD 74 55      [17] 3978 	call	_cpct_disableFirmware
                           3979 ;src/main.c:780: cpct_setVideoMode(0);
   7716 2E 00         [ 7] 3980 	ld	l,#0x00
   7718 CD 48 55      [17] 3981 	call	_cpct_setVideoMode
                           3982 ;src/main.c:781: cpct_setBorder(HW_BLACK);
   771B 21 10 14      [10] 3983 	ld	hl,#0x1410
   771E E5            [11] 3984 	push	hl
   771F CD AB 52      [17] 3985 	call	_cpct_setPALColour
                           3986 ;src/main.c:782: cpct_setPalette(g_palette, 16);
   7722 21 10 00      [10] 3987 	ld	hl,#0x0010
   7725 E5            [11] 3988 	push	hl
   7726 21 60 3E      [10] 3989 	ld	hl,#_g_palette
   7729 E5            [11] 3990 	push	hl
   772A CD 88 52      [17] 3991 	call	_cpct_setPalette
   772D C9            [10] 3992 	ret
                           3993 ;src/main.c:787: void inicializarJuego() {
                           3994 ;	---------------------------------
                           3995 ; Function inicializarJuego
                           3996 ; ---------------------------------
   772E                    3997 _inicializarJuego::
                           3998 ;src/main.c:789: num_mapa = 0;
   772E 21 47 60      [10] 3999 	ld	hl,#_num_mapa + 0
   7731 36 00         [10] 4000 	ld	(hl), #0x00
                           4001 ;src/main.c:790: mapa = mapas[num_mapa];
   7733 21 65 60      [10] 4002 	ld	hl, #_mapas + 0
   7736 7E            [ 7] 4003 	ld	a,(hl)
   7737 FD 21 45 60   [14] 4004 	ld	iy,#_mapa
   773B FD 77 00      [19] 4005 	ld	0 (iy),a
   773E 23            [ 6] 4006 	inc	hl
   773F 7E            [ 7] 4007 	ld	a,(hl)
   7740 32 46 60      [13] 4008 	ld	(#_mapa + 1),a
                           4009 ;src/main.c:791: cpct_etm_setTileset2x4(g_tileset);
   7743 21 E0 17      [10] 4010 	ld	hl,#_g_tileset
   7746 CD 9C 54      [17] 4011 	call	_cpct_etm_setTileset2x4
                           4012 ;src/main.c:793: dibujarMapa();
   7749 CD 4F 60      [17] 4013 	call	_dibujarMapa
                           4014 ;src/main.c:796: barraPuntuacionInicial();
   774C CD D9 4F      [17] 4015 	call	_barraPuntuacionInicial
                           4016 ;src/main.c:799: prota.x = prota.px = 4;
   774F 21 6B 5F      [10] 4017 	ld	hl,#(_prota + 0x0002)
   7752 36 04         [10] 4018 	ld	(hl),#0x04
   7754 21 69 5F      [10] 4019 	ld	hl,#_prota
   7757 36 04         [10] 4020 	ld	(hl),#0x04
                           4021 ;src/main.c:800: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   7759 21 6C 5F      [10] 4022 	ld	hl,#(_prota + 0x0003)
   775C 36 68         [10] 4023 	ld	(hl),#0x68
   775E 21 6A 5F      [10] 4024 	ld	hl,#(_prota + 0x0001)
   7761 36 68         [10] 4025 	ld	(hl),#0x68
                           4026 ;src/main.c:801: prota.mover  = NO;
   7763 21 6F 5F      [10] 4027 	ld	hl,#(_prota + 0x0006)
   7766 36 00         [10] 4028 	ld	(hl),#0x00
                           4029 ;src/main.c:802: prota.mira=M_derecha;
   7768 21 70 5F      [10] 4030 	ld	hl,#(_prota + 0x0007)
   776B 36 00         [10] 4031 	ld	(hl),#0x00
                           4032 ;src/main.c:803: prota.sprite = g_hero;
   776D 21 70 3E      [10] 4033 	ld	hl,#_g_hero
   7770 22 6D 5F      [16] 4034 	ld	((_prota + 0x0004)), hl
                           4035 ;src/main.c:807: cu.x = cu.px = 0;
   7773 21 73 5F      [10] 4036 	ld	hl,#(_cu + 0x0002)
   7776 36 00         [10] 4037 	ld	(hl),#0x00
   7778 21 71 5F      [10] 4038 	ld	hl,#_cu
   777B 36 00         [10] 4039 	ld	(hl),#0x00
                           4040 ;src/main.c:808: cu.y = cu.py = 0;
   777D 21 74 5F      [10] 4041 	ld	hl,#(_cu + 0x0003)
   7780 36 00         [10] 4042 	ld	(hl),#0x00
   7782 21 72 5F      [10] 4043 	ld	hl,#(_cu + 0x0001)
   7785 36 00         [10] 4044 	ld	(hl),#0x00
                           4045 ;src/main.c:809: cu.lanzado = NO;
   7787 21 77 5F      [10] 4046 	ld	hl,#(_cu + 0x0006)
   778A 36 00         [10] 4047 	ld	(hl),#0x00
                           4048 ;src/main.c:810: cu.mover = NO;
   778C 21 7A 5F      [10] 4049 	ld	hl,#(_cu + 0x0009)
   778F 36 00         [10] 4050 	ld	(hl),#0x00
                           4051 ;src/main.c:812: inicializarEnemy();
   7791 CD 09 75      [17] 4052 	call	_inicializarEnemy
                           4053 ;src/main.c:814: dibujarProta();
   7794 C3 9D 60      [10] 4054 	jp  _dibujarProta
                           4055 ;src/main.c:817: void main(void) {
                           4056 ;	---------------------------------
                           4057 ; Function main
                           4058 ; ---------------------------------
   7797                    4059 _main::
   7797 DD E5         [15] 4060 	push	ix
   7799 DD 21 00 00   [14] 4061 	ld	ix,#0
   779D DD 39         [15] 4062 	add	ix,sp
   779F 3B            [ 6] 4063 	dec	sp
                           4064 ;src/main.c:822: inicializarCPC();
   77A0 CD 13 77      [17] 4065 	call	_inicializarCPC
                           4066 ;src/main.c:824: menuInicio();
   77A3 CD FA 4E      [17] 4067 	call	_menuInicio
                           4068 ;src/main.c:826: inicializarJuego();
   77A6 CD 2E 77      [17] 4069 	call	_inicializarJuego
                           4070 ;src/main.c:830: while (1) {
   77A9                    4071 00116$:
                           4072 ;src/main.c:832: i = 2 + 1;
   77A9 DD 36 FF 03   [19] 4073 	ld	-1 (ix),#0x03
                           4074 ;src/main.c:833: actual = enemy;
                           4075 ;src/main.c:835: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   77AD 21 00 01      [10] 4076 	ld	hl,#_g_tablatrans
   77B0 E5            [11] 4077 	push	hl
   77B1 2A 45 60      [16] 4078 	ld	hl,(_mapa)
   77B4 E5            [11] 4079 	push	hl
   77B5 21 69 5F      [10] 4080 	ld	hl,#_prota
   77B8 E5            [11] 4081 	push	hl
   77B9 21 71 5F      [10] 4082 	ld	hl,#_cu
   77BC E5            [11] 4083 	push	hl
   77BD CD 4B 61      [17] 4084 	call	_comprobarTeclado
   77C0 21 08 00      [10] 4085 	ld	hl,#8
   77C3 39            [11] 4086 	add	hl,sp
   77C4 F9            [ 6] 4087 	ld	sp,hl
                           4088 ;src/main.c:836: moverCuchillo(&cu, mapa);
   77C5 2A 45 60      [16] 4089 	ld	hl,(_mapa)
   77C8 E5            [11] 4090 	push	hl
   77C9 21 71 5F      [10] 4091 	ld	hl,#_cu
   77CC E5            [11] 4092 	push	hl
   77CD CD 00 43      [17] 4093 	call	_moverCuchillo
   77D0 F1            [10] 4094 	pop	af
   77D1 F1            [10] 4095 	pop	af
                           4096 ;src/main.c:837: updateEnemies();
   77D2 CD 7D 73      [17] 4097 	call	_updateEnemies
                           4098 ;src/main.c:839: cpct_waitVSYNC();
   77D5 CD 40 55      [17] 4099 	call	_cpct_waitVSYNC
                           4100 ;src/main.c:842: if (prota.mover) {
   77D8 01 6F 5F      [10] 4101 	ld	bc,#_prota + 6
   77DB 0A            [ 7] 4102 	ld	a,(bc)
   77DC B7            [ 4] 4103 	or	a, a
   77DD 28 07         [12] 4104 	jr	Z,00102$
                           4105 ;src/main.c:843: redibujarProta();
   77DF C5            [11] 4106 	push	bc
   77E0 CD 37 61      [17] 4107 	call	_redibujarProta
   77E3 C1            [10] 4108 	pop	bc
                           4109 ;src/main.c:844: prota.mover = NO;
   77E4 AF            [ 4] 4110 	xor	a, a
   77E5 02            [ 7] 4111 	ld	(bc),a
   77E6                    4112 00102$:
                           4113 ;src/main.c:846: if(cu.lanzado && cu.mover){
   77E6 21 77 5F      [10] 4114 	ld	hl, #(_cu + 0x0006) + 0
   77E9 4E            [ 7] 4115 	ld	c,(hl)
                           4116 ;src/main.c:847: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4117 ;src/main.c:846: if(cu.lanzado && cu.mover){
   77EA 79            [ 4] 4118 	ld	a,c
   77EB B7            [ 4] 4119 	or	a, a
   77EC 28 30         [12] 4120 	jr	Z,00107$
   77EE 3A 7A 5F      [13] 4121 	ld	a, (#(_cu + 0x0009) + 0)
   77F1 B7            [ 4] 4122 	or	a, a
   77F2 28 2A         [12] 4123 	jr	Z,00107$
                           4124 ;src/main.c:847: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   77F4 21 72 5F      [10] 4125 	ld	hl, #(_cu + 0x0001) + 0
   77F7 4E            [ 7] 4126 	ld	c,(hl)
   77F8 21 71 5F      [10] 4127 	ld	hl, #_cu + 0
   77FB 46            [ 7] 4128 	ld	b,(hl)
   77FC 21 79 5F      [10] 4129 	ld	hl, #(_cu + 0x0008) + 0
   77FF 5E            [ 7] 4130 	ld	e,(hl)
   7800 2A 45 60      [16] 4131 	ld	hl,(_mapa)
   7803 E5            [11] 4132 	push	hl
   7804 21 00 01      [10] 4133 	ld	hl,#_g_tablatrans
   7807 E5            [11] 4134 	push	hl
   7808 21 71 5F      [10] 4135 	ld	hl,#_cu
   780B E5            [11] 4136 	push	hl
   780C 79            [ 4] 4137 	ld	a,c
   780D F5            [11] 4138 	push	af
   780E 33            [ 6] 4139 	inc	sp
   780F C5            [11] 4140 	push	bc
   7810 33            [ 6] 4141 	inc	sp
   7811 7B            [ 4] 4142 	ld	a,e
   7812 F5            [11] 4143 	push	af
   7813 33            [ 6] 4144 	inc	sp
   7814 CD 25 40      [17] 4145 	call	_redibujarCuchillo
   7817 21 09 00      [10] 4146 	ld	hl,#9
   781A 39            [11] 4147 	add	hl,sp
   781B F9            [ 6] 4148 	ld	sp,hl
   781C 18 28         [12] 4149 	jr	00127$
   781E                    4150 00107$:
                           4151 ;src/main.c:848: }else if (cu.lanzado && !cu.mover){
   781E 79            [ 4] 4152 	ld	a,c
   781F B7            [ 4] 4153 	or	a, a
   7820 28 24         [12] 4154 	jr	Z,00127$
   7822 3A 7A 5F      [13] 4155 	ld	a, (#(_cu + 0x0009) + 0)
   7825 B7            [ 4] 4156 	or	a, a
   7826 20 1E         [12] 4157 	jr	NZ,00127$
                           4158 ;src/main.c:849: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   7828 21 72 5F      [10] 4159 	ld	hl, #(_cu + 0x0001) + 0
   782B 46            [ 7] 4160 	ld	b,(hl)
   782C 21 71 5F      [10] 4161 	ld	hl, #_cu + 0
   782F 4E            [ 7] 4162 	ld	c,(hl)
   7830 21 79 5F      [10] 4163 	ld	hl, #(_cu + 0x0008) + 0
   7833 56            [ 7] 4164 	ld	d,(hl)
   7834 2A 45 60      [16] 4165 	ld	hl,(_mapa)
   7837 E5            [11] 4166 	push	hl
   7838 C5            [11] 4167 	push	bc
   7839 D5            [11] 4168 	push	de
   783A 33            [ 6] 4169 	inc	sp
   783B CD 92 3F      [17] 4170 	call	_borrarCuchillo
   783E F1            [10] 4171 	pop	af
   783F F1            [10] 4172 	pop	af
   7840 33            [ 6] 4173 	inc	sp
                           4174 ;src/main.c:850: cu.lanzado = NO;
   7841 21 77 5F      [10] 4175 	ld	hl,#(_cu + 0x0006)
   7844 36 00         [10] 4176 	ld	(hl),#0x00
                           4177 ;src/main.c:853: while(--i){
   7846                    4178 00127$:
   7846 01 F9 5E      [10] 4179 	ld	bc,#_enemy
   7849                    4180 00112$:
   7849 DD 35 FF      [23] 4181 	dec	-1 (ix)
   784C DD 5E FF      [19] 4182 	ld	e, -1 (ix)
   784F 7B            [ 4] 4183 	ld	a,e
   7850 B7            [ 4] 4184 	or	a, a
   7851 28 28         [12] 4185 	jr	Z,00114$
                           4186 ;src/main.c:854: if(actual->mover){
   7853 C5            [11] 4187 	push	bc
   7854 FD E1         [14] 4188 	pop	iy
   7856 FD 7E 06      [19] 4189 	ld	a,6 (iy)
   7859 B7            [ 4] 4190 	or	a, a
   785A 28 17         [12] 4191 	jr	Z,00111$
                           4192 ;src/main.c:855: redibujarEnemigo((*actual).px, (*actual).py, actual);
   785C 69            [ 4] 4193 	ld	l, c
   785D 60            [ 4] 4194 	ld	h, b
   785E 23            [ 6] 4195 	inc	hl
   785F 23            [ 6] 4196 	inc	hl
   7860 23            [ 6] 4197 	inc	hl
   7861 56            [ 7] 4198 	ld	d,(hl)
   7862 69            [ 4] 4199 	ld	l, c
   7863 60            [ 4] 4200 	ld	h, b
   7864 23            [ 6] 4201 	inc	hl
   7865 23            [ 6] 4202 	inc	hl
   7866 7E            [ 7] 4203 	ld	a,(hl)
   7867 C5            [11] 4204 	push	bc
   7868 C5            [11] 4205 	push	bc
   7869 D5            [11] 4206 	push	de
   786A 33            [ 6] 4207 	inc	sp
   786B F5            [11] 4208 	push	af
   786C 33            [ 6] 4209 	inc	sp
   786D CD 85 64      [17] 4210 	call	_redibujarEnemigo
   7870 F1            [10] 4211 	pop	af
   7871 F1            [10] 4212 	pop	af
   7872 C1            [10] 4213 	pop	bc
   7873                    4214 00111$:
                           4215 ;src/main.c:868: ++actual;
   7873 21 1C 00      [10] 4216 	ld	hl,#0x001C
   7876 09            [11] 4217 	add	hl,bc
   7877 4D            [ 4] 4218 	ld	c,l
   7878 44            [ 4] 4219 	ld	b,h
   7879 18 CE         [12] 4220 	jr	00112$
   787B                    4221 00114$:
                           4222 ;src/main.c:870: cpct_waitVSYNC();
   787B CD 40 55      [17] 4223 	call	_cpct_waitVSYNC
   787E C3 A9 77      [10] 4224 	jp	00116$
   7881 33            [ 6] 4225 	inc	sp
   7882 DD E1         [14] 4226 	pop	ix
   7884 C9            [10] 4227 	ret
                           4228 	.area _CODE
                           4229 	.area _INITIALIZER
   604A                    4230 __xinit__mapa:
   604A 00 00              4231 	.dw #0x0000
   604C                    4232 __xinit__num_mapa:
   604C 00                 4233 	.db #0x00	; 0
   604D                    4234 __xinit__puntuacion:
   604D 00                 4235 	.db #0x00	; 0
   604E                    4236 __xinit__vidas:
   604E 05                 4237 	.db #0x05	; 5
                           4238 	.area _CABS (ABS)
