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
   5EDA                      85 _enemy::
   5EDA                      86 	.ds 112
   5F4A                      87 _prota::
   5F4A                      88 	.ds 8
   5F52                      89 _cu::
   5F52                      90 	.ds 10
   5F5C                      91 _i::
   5F5C                      92 	.ds 1
                             93 ;--------------------------------------------------------
                             94 ; ram data
                             95 ;--------------------------------------------------------
                             96 	.area _INITIALIZED
   6026                      97 _mapa::
   6026                      98 	.ds 2
   6028                      99 _num_mapa::
   6028                     100 	.ds 1
   6029                     101 _puntuacion::
   6029                     102 	.ds 1
   602A                     103 _vidas::
   602A                     104 	.ds 1
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
   3F0A                     129 _dummy_cpct_transparentMaskTable0M0_container::
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
   6030                     170 _dibujarMapa::
                            171 ;src/main.c:114: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, p, mapa);
   6030 2A 26 60      [16]  172 	ld	hl,(_mapa)
   6033 E5            [11]  173 	push	hl
   6034 21 F0 C0      [10]  174 	ld	hl,#0xC0F0
   6037 E5            [11]  175 	push	hl
   6038 21 2C 28      [10]  176 	ld	hl,#0x282C
   603B E5            [11]  177 	push	hl
   603C 2E 00         [ 7]  178 	ld	l, #0x00
   603E E5            [11]  179 	push	hl
   603F AF            [ 4]  180 	xor	a, a
   6040 F5            [11]  181 	push	af
   6041 33            [ 6]  182 	inc	sp
   6042 CD 61 53      [17]  183 	call	_cpct_etm_drawTileBox2x4
   6045 C9            [10]  184 	ret
   6046                     185 _mapas:
   6046 C0 10               186 	.dw _g_map1
   6048 E0 09               187 	.dw _g_map2
   604A 00 03               188 	.dw _g_map3
   604C                     189 _spawnX:
   604C 00                  190 	.db #0x00	; 0
   604D 24                  191 	.db #0x24	; 36
   604E 47                  192 	.db #0x47	; 71	'G'
   604F 32                  193 	.db #0x32	; 50	'2'
   6050 18                  194 	.db #0x18	; 24
   6051                     195 _spawnY:
   6051 00                  196 	.db #0x00	; 0
   6052 59                  197 	.db #0x59	; 89	'Y'
   6053 72                  198 	.db #0x72	; 114	'r'
   6054 9A                  199 	.db #0x9A	; 154
   6055 68                  200 	.db #0x68	; 104	'h'
   6056                     201 _patrolX:
   6056 00                  202 	.db #0x00	; 0
   6057 00                  203 	.db #0x00	; 0
   6058 00                  204 	.db #0x00	; 0
   6059 00                  205 	.db #0x00	; 0
   605A 00                  206 	.db #0x00	; 0
   605B 00                  207 	.db #0x00	; 0
   605C 14                  208 	.db #0x14	; 20
   605D 47                  209 	.db #0x47	; 71	'G'
   605E 00                  210 	.db #0x00	; 0
   605F 00                  211 	.db #0x00	; 0
   6060 00                  212 	.db #0x00	; 0
   6061 00                  213 	.db #0x00	; 0
   6062 00                  214 	.db #0x00	; 0
   6063 00                  215 	.db #0x00	; 0
   6064 00                  216 	.db #0x00	; 0
   6065 00                  217 	.db #0x00	; 0
   6066 00                  218 	.db #0x00	; 0
   6067 00                  219 	.db #0x00	; 0
   6068 00                  220 	.db #0x00	; 0
   6069 00                  221 	.db #0x00	; 0
   606A                     222 _patrolY:
   606A 00                  223 	.db #0x00	; 0
   606B 00                  224 	.db #0x00	; 0
   606C 00                  225 	.db #0x00	; 0
   606D 00                  226 	.db #0x00	; 0
   606E 00                  227 	.db #0x00	; 0
   606F 00                  228 	.db #0x00	; 0
   6070 59                  229 	.db #0x59	; 89	'Y'
   6071 9C                  230 	.db #0x9C	; 156
   6072 00                  231 	.db #0x00	; 0
   6073 00                  232 	.db #0x00	; 0
   6074 00                  233 	.db #0x00	; 0
   6075 00                  234 	.db #0x00	; 0
   6076 00                  235 	.db #0x00	; 0
   6077 00                  236 	.db #0x00	; 0
   6078 00                  237 	.db #0x00	; 0
   6079 00                  238 	.db #0x00	; 0
   607A 00                  239 	.db #0x00	; 0
   607B 00                  240 	.db #0x00	; 0
   607C 00                  241 	.db #0x00	; 0
   607D 00                  242 	.db #0x00	; 0
                            243 ;src/main.c:117: void dibujarProta() {
                            244 ;	---------------------------------
                            245 ; Function dibujarProta
                            246 ; ---------------------------------
   607E                     247 _dibujarProta::
                            248 ;src/main.c:118: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   607E 21 4B 5F      [10]  249 	ld	hl, #_prota + 1
   6081 56            [ 7]  250 	ld	d,(hl)
   6082 21 4A 5F      [10]  251 	ld	hl, #_prota + 0
   6085 46            [ 7]  252 	ld	b,(hl)
   6086 D5            [11]  253 	push	de
   6087 33            [ 6]  254 	inc	sp
   6088 C5            [11]  255 	push	bc
   6089 33            [ 6]  256 	inc	sp
   608A 21 00 C0      [10]  257 	ld	hl,#0xC000
   608D E5            [11]  258 	push	hl
   608E CD 7F 5E      [17]  259 	call	_cpct_getScreenPtr
   6091 EB            [ 4]  260 	ex	de,hl
                            261 ;src/main.c:119: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   6092 ED 4B 4E 5F   [20]  262 	ld	bc, (#_prota + 4)
   6096 21 00 01      [10]  263 	ld	hl,#_g_tablatrans
   6099 E5            [11]  264 	push	hl
   609A 21 07 16      [10]  265 	ld	hl,#0x1607
   609D E5            [11]  266 	push	hl
   609E D5            [11]  267 	push	de
   609F C5            [11]  268 	push	bc
   60A0 CD 9F 5E      [17]  269 	call	_cpct_drawSpriteMaskedAlignedTable
   60A3 C9            [10]  270 	ret
                            271 ;src/main.c:122: void borrarProta() {
                            272 ;	---------------------------------
                            273 ; Function borrarProta
                            274 ; ---------------------------------
   60A4                     275 _borrarProta::
   60A4 DD E5         [15]  276 	push	ix
   60A6 DD 21 00 00   [14]  277 	ld	ix,#0
   60AA DD 39         [15]  278 	add	ix,sp
   60AC F5            [11]  279 	push	af
   60AD 3B            [ 6]  280 	dec	sp
                            281 ;src/main.c:126: u8 w = 4 + (prota.px & 1);
   60AE 21 4C 5F      [10]  282 	ld	hl, #_prota + 2
   60B1 4E            [ 7]  283 	ld	c,(hl)
   60B2 79            [ 4]  284 	ld	a,c
   60B3 E6 01         [ 7]  285 	and	a, #0x01
   60B5 47            [ 4]  286 	ld	b,a
   60B6 04            [ 4]  287 	inc	b
   60B7 04            [ 4]  288 	inc	b
   60B8 04            [ 4]  289 	inc	b
   60B9 04            [ 4]  290 	inc	b
                            291 ;src/main.c:129: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   60BA 21 4D 5F      [10]  292 	ld	hl, #_prota + 3
   60BD 5E            [ 7]  293 	ld	e,(hl)
   60BE CB 4B         [ 8]  294 	bit	1, e
   60C0 28 04         [12]  295 	jr	Z,00103$
   60C2 3E 01         [ 7]  296 	ld	a,#0x01
   60C4 18 02         [12]  297 	jr	00104$
   60C6                     298 00103$:
   60C6 3E 00         [ 7]  299 	ld	a,#0x00
   60C8                     300 00104$:
   60C8 C6 06         [ 7]  301 	add	a, #0x06
   60CA DD 77 FD      [19]  302 	ld	-3 (ix),a
                            303 ;src/main.c:131: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   60CD FD 2A 26 60   [20]  304 	ld	iy,(_mapa)
   60D1 16 00         [ 7]  305 	ld	d,#0x00
   60D3 7B            [ 4]  306 	ld	a,e
   60D4 C6 E8         [ 7]  307 	add	a,#0xE8
   60D6 DD 77 FE      [19]  308 	ld	-2 (ix),a
   60D9 7A            [ 4]  309 	ld	a,d
   60DA CE FF         [ 7]  310 	adc	a,#0xFF
   60DC DD 77 FF      [19]  311 	ld	-1 (ix),a
   60DF DD 6E FE      [19]  312 	ld	l,-2 (ix)
   60E2 DD 66 FF      [19]  313 	ld	h,-1 (ix)
   60E5 DD CB FF 7E   [20]  314 	bit	7, -1 (ix)
   60E9 28 04         [12]  315 	jr	Z,00105$
   60EB 21 EB FF      [10]  316 	ld	hl,#0xFFEB
   60EE 19            [11]  317 	add	hl,de
   60EF                     318 00105$:
   60EF CB 2C         [ 8]  319 	sra	h
   60F1 CB 1D         [ 8]  320 	rr	l
   60F3 CB 2C         [ 8]  321 	sra	h
   60F5 CB 1D         [ 8]  322 	rr	l
   60F7 55            [ 4]  323 	ld	d,l
   60F8 CB 39         [ 8]  324 	srl	c
   60FA FD E5         [15]  325 	push	iy
   60FC 21 F0 C0      [10]  326 	ld	hl,#0xC0F0
   60FF E5            [11]  327 	push	hl
   6100 3E 28         [ 7]  328 	ld	a,#0x28
   6102 F5            [11]  329 	push	af
   6103 33            [ 6]  330 	inc	sp
   6104 DD 7E FD      [19]  331 	ld	a,-3 (ix)
   6107 F5            [11]  332 	push	af
   6108 33            [ 6]  333 	inc	sp
   6109 C5            [11]  334 	push	bc
   610A 33            [ 6]  335 	inc	sp
   610B D5            [11]  336 	push	de
   610C 33            [ 6]  337 	inc	sp
   610D 79            [ 4]  338 	ld	a,c
   610E F5            [11]  339 	push	af
   610F 33            [ 6]  340 	inc	sp
   6110 CD 61 53      [17]  341 	call	_cpct_etm_drawTileBox2x4
   6113 DD F9         [10]  342 	ld	sp, ix
   6115 DD E1         [14]  343 	pop	ix
   6117 C9            [10]  344 	ret
                            345 ;src/main.c:134: void redibujarProta() {
                            346 ;	---------------------------------
                            347 ; Function redibujarProta
                            348 ; ---------------------------------
   6118                     349 _redibujarProta::
                            350 ;src/main.c:135: borrarProta();
   6118 CD A4 60      [17]  351 	call	_borrarProta
                            352 ;src/main.c:136: prota.px = prota.x;
   611B 01 4C 5F      [10]  353 	ld	bc,#_prota + 2
   611E 3A 4A 5F      [13]  354 	ld	a, (#_prota + 0)
   6121 02            [ 7]  355 	ld	(bc),a
                            356 ;src/main.c:137: prota.py = prota.y;
   6122 01 4D 5F      [10]  357 	ld	bc,#_prota + 3
   6125 3A 4B 5F      [13]  358 	ld	a, (#_prota + 1)
   6128 02            [ 7]  359 	ld	(bc),a
                            360 ;src/main.c:138: dibujarProta();
   6129 C3 7E 60      [10]  361 	jp  _dibujarProta
                            362 ;src/main.c:141: void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
                            363 ;	---------------------------------
                            364 ; Function comprobarTeclado
                            365 ; ---------------------------------
   612C                     366 _comprobarTeclado::
                            367 ;src/main.c:142: cpct_scanKeyboard_if();
   612C CD B9 54      [17]  368 	call	_cpct_scanKeyboard_if
                            369 ;src/main.c:144: if (cpct_isAnyKeyPressed()) {
   612F CD AC 54      [17]  370 	call	_cpct_isAnyKeyPressed
   6132 7D            [ 4]  371 	ld	a,l
   6133 B7            [ 4]  372 	or	a, a
   6134 C8            [11]  373 	ret	Z
                            374 ;src/main.c:145: if (cpct_isKeyPressed(Key_CursorLeft)){
   6135 21 01 01      [10]  375 	ld	hl,#0x0101
   6138 CD 80 52      [17]  376 	call	_cpct_isKeyPressed
   613B 7D            [ 4]  377 	ld	a,l
   613C B7            [ 4]  378 	or	a, a
                            379 ;src/main.c:146: moverIzquierda();
   613D C2 28 76      [10]  380 	jp	NZ,_moverIzquierda
                            381 ;src/main.c:147: }else if (cpct_isKeyPressed(Key_CursorRight)){
   6140 21 00 02      [10]  382 	ld	hl,#0x0200
   6143 CD 80 52      [17]  383 	call	_cpct_isKeyPressed
   6146 7D            [ 4]  384 	ld	a,l
   6147 B7            [ 4]  385 	or	a, a
                            386 ;src/main.c:148: moverDerecha();
   6148 C2 4D 76      [10]  387 	jp	NZ,_moverDerecha
                            388 ;src/main.c:149: }else if (cpct_isKeyPressed(Key_CursorUp)){
   614B 21 00 01      [10]  389 	ld	hl,#0x0100
   614E CD 80 52      [17]  390 	call	_cpct_isKeyPressed
   6151 7D            [ 4]  391 	ld	a,l
   6152 B7            [ 4]  392 	or	a, a
                            393 ;src/main.c:150: moverArriba();
   6153 C2 92 76      [10]  394 	jp	NZ,_moverArriba
                            395 ;src/main.c:151: }else if (cpct_isKeyPressed(Key_CursorDown)){
   6156 21 00 04      [10]  396 	ld	hl,#0x0400
   6159 CD 80 52      [17]  397 	call	_cpct_isKeyPressed
   615C 7D            [ 4]  398 	ld	a,l
   615D B7            [ 4]  399 	or	a, a
                            400 ;src/main.c:152: moverAbajo();
   615E C2 B6 76      [10]  401 	jp	NZ,_moverAbajo
                            402 ;src/main.c:153: }else if (cpct_isKeyPressed(Key_Space)){
   6161 21 05 80      [10]  403 	ld	hl,#0x8005
   6164 CD 80 52      [17]  404 	call	_cpct_isKeyPressed
   6167 7D            [ 4]  405 	ld	a,l
   6168 B7            [ 4]  406 	or	a, a
   6169 C8            [11]  407 	ret	Z
                            408 ;src/main.c:154: lanzarCuchillo(cu, prota, mapa, g_tablatrans);
   616A 21 08 00      [10]  409 	ld	hl, #8
   616D 39            [11]  410 	add	hl, sp
   616E 4E            [ 7]  411 	ld	c, (hl)
   616F 23            [ 6]  412 	inc	hl
   6170 46            [ 7]  413 	ld	b, (hl)
   6171 C5            [11]  414 	push	bc
   6172 21 08 00      [10]  415 	ld	hl, #8
   6175 39            [11]  416 	add	hl, sp
   6176 4E            [ 7]  417 	ld	c, (hl)
   6177 23            [ 6]  418 	inc	hl
   6178 46            [ 7]  419 	ld	b, (hl)
   6179 C5            [11]  420 	push	bc
   617A 21 08 00      [10]  421 	ld	hl, #8
   617D 39            [11]  422 	add	hl, sp
   617E 4E            [ 7]  423 	ld	c, (hl)
   617F 23            [ 6]  424 	inc	hl
   6180 46            [ 7]  425 	ld	b, (hl)
   6181 C5            [11]  426 	push	bc
   6182 21 08 00      [10]  427 	ld	hl, #8
   6185 39            [11]  428 	add	hl, sp
   6186 4E            [ 7]  429 	ld	c, (hl)
   6187 23            [ 6]  430 	inc	hl
   6188 46            [ 7]  431 	ld	b, (hl)
   6189 C5            [11]  432 	push	bc
   618A CD 33 46      [17]  433 	call	_lanzarCuchillo
   618D 21 08 00      [10]  434 	ld	hl,#8
   6190 39            [11]  435 	add	hl,sp
   6191 F9            [ 6]  436 	ld	sp,hl
   6192 C9            [10]  437 	ret
                            438 ;src/main.c:159: u8 checkCollision(u8 direction) { // check optimization
                            439 ;	---------------------------------
                            440 ; Function checkCollision
                            441 ; ---------------------------------
   6193                     442 _checkCollision::
   6193 DD E5         [15]  443 	push	ix
   6195 DD 21 00 00   [14]  444 	ld	ix,#0
   6199 DD 39         [15]  445 	add	ix,sp
   619B F5            [11]  446 	push	af
                            447 ;src/main.c:160: u8 *headTile=0, *feetTile=0, *waistTile=0;
   619C 21 00 00      [10]  448 	ld	hl,#0x0000
   619F E3            [19]  449 	ex	(sp), hl
   61A0 11 00 00      [10]  450 	ld	de,#0x0000
   61A3 01 00 00      [10]  451 	ld	bc,#0x0000
                            452 ;src/main.c:162: switch (direction) {
   61A6 3E 03         [ 7]  453 	ld	a,#0x03
   61A8 DD 96 04      [19]  454 	sub	a, 4 (ix)
   61AB DA E3 62      [10]  455 	jp	C,00105$
   61AE DD 5E 04      [19]  456 	ld	e,4 (ix)
   61B1 16 00         [ 7]  457 	ld	d,#0x00
   61B3 21 BA 61      [10]  458 	ld	hl,#00124$
   61B6 19            [11]  459 	add	hl,de
   61B7 19            [11]  460 	add	hl,de
   61B8 19            [11]  461 	add	hl,de
   61B9 E9            [ 4]  462 	jp	(hl)
   61BA                     463 00124$:
   61BA C3 C6 61      [10]  464 	jp	00101$
   61BD C3 1B 62      [10]  465 	jp	00102$
   61C0 C3 6B 62      [10]  466 	jp	00103$
   61C3 C3 A8 62      [10]  467 	jp	00104$
                            468 ;src/main.c:163: case 0:
   61C6                     469 00101$:
                            470 ;src/main.c:164: headTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y);
   61C6 21 4B 5F      [10]  471 	ld	hl, #(_prota + 0x0001) + 0
   61C9 4E            [ 7]  472 	ld	c,(hl)
   61CA 3A 4A 5F      [13]  473 	ld	a, (#_prota + 0)
   61CD C6 07         [ 7]  474 	add	a, #0x07
   61CF 47            [ 4]  475 	ld	b,a
   61D0 79            [ 4]  476 	ld	a,c
   61D1 F5            [11]  477 	push	af
   61D2 33            [ 6]  478 	inc	sp
   61D3 C5            [11]  479 	push	bc
   61D4 33            [ 6]  480 	inc	sp
   61D5 2A 26 60      [16]  481 	ld	hl,(_mapa)
   61D8 E5            [11]  482 	push	hl
   61D9 CD 96 49      [17]  483 	call	_getTilePtr
   61DC F1            [10]  484 	pop	af
   61DD F1            [10]  485 	pop	af
   61DE 33            [ 6]  486 	inc	sp
   61DF 33            [ 6]  487 	inc	sp
   61E0 E5            [11]  488 	push	hl
                            489 ;src/main.c:165: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA - 2);
   61E1 3A 4B 5F      [13]  490 	ld	a, (#(_prota + 0x0001) + 0)
   61E4 C6 14         [ 7]  491 	add	a, #0x14
   61E6 4F            [ 4]  492 	ld	c,a
   61E7 3A 4A 5F      [13]  493 	ld	a, (#_prota + 0)
   61EA C6 07         [ 7]  494 	add	a, #0x07
   61EC 47            [ 4]  495 	ld	b,a
   61ED 79            [ 4]  496 	ld	a,c
   61EE F5            [11]  497 	push	af
   61EF 33            [ 6]  498 	inc	sp
   61F0 C5            [11]  499 	push	bc
   61F1 33            [ 6]  500 	inc	sp
   61F2 2A 26 60      [16]  501 	ld	hl,(_mapa)
   61F5 E5            [11]  502 	push	hl
   61F6 CD 96 49      [17]  503 	call	_getTilePtr
   61F9 F1            [10]  504 	pop	af
   61FA F1            [10]  505 	pop	af
   61FB EB            [ 4]  506 	ex	de,hl
                            507 ;src/main.c:166: waistTile = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA/2);
   61FC 3A 4B 5F      [13]  508 	ld	a, (#(_prota + 0x0001) + 0)
   61FF C6 0B         [ 7]  509 	add	a, #0x0B
   6201 47            [ 4]  510 	ld	b,a
   6202 3A 4A 5F      [13]  511 	ld	a, (#_prota + 0)
   6205 C6 07         [ 7]  512 	add	a, #0x07
   6207 D5            [11]  513 	push	de
   6208 C5            [11]  514 	push	bc
   6209 33            [ 6]  515 	inc	sp
   620A F5            [11]  516 	push	af
   620B 33            [ 6]  517 	inc	sp
   620C 2A 26 60      [16]  518 	ld	hl,(_mapa)
   620F E5            [11]  519 	push	hl
   6210 CD 96 49      [17]  520 	call	_getTilePtr
   6213 F1            [10]  521 	pop	af
   6214 F1            [10]  522 	pop	af
   6215 4D            [ 4]  523 	ld	c,l
   6216 44            [ 4]  524 	ld	b,h
   6217 D1            [10]  525 	pop	de
                            526 ;src/main.c:167: break;
   6218 C3 E3 62      [10]  527 	jp	00105$
                            528 ;src/main.c:168: case 1:
   621B                     529 00102$:
                            530 ;src/main.c:169: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
   621B 21 4B 5F      [10]  531 	ld	hl, #(_prota + 0x0001) + 0
   621E 56            [ 7]  532 	ld	d,(hl)
   621F 21 4A 5F      [10]  533 	ld	hl, #_prota + 0
   6222 46            [ 7]  534 	ld	b,(hl)
   6223 05            [ 4]  535 	dec	b
   6224 D5            [11]  536 	push	de
   6225 33            [ 6]  537 	inc	sp
   6226 C5            [11]  538 	push	bc
   6227 33            [ 6]  539 	inc	sp
   6228 2A 26 60      [16]  540 	ld	hl,(_mapa)
   622B E5            [11]  541 	push	hl
   622C CD 96 49      [17]  542 	call	_getTilePtr
   622F F1            [10]  543 	pop	af
   6230 F1            [10]  544 	pop	af
   6231 33            [ 6]  545 	inc	sp
   6232 33            [ 6]  546 	inc	sp
   6233 E5            [11]  547 	push	hl
                            548 ;src/main.c:170: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
   6234 3A 4B 5F      [13]  549 	ld	a, (#(_prota + 0x0001) + 0)
   6237 C6 14         [ 7]  550 	add	a, #0x14
   6239 57            [ 4]  551 	ld	d,a
   623A 21 4A 5F      [10]  552 	ld	hl, #_prota + 0
   623D 46            [ 7]  553 	ld	b,(hl)
   623E 05            [ 4]  554 	dec	b
   623F D5            [11]  555 	push	de
   6240 33            [ 6]  556 	inc	sp
   6241 C5            [11]  557 	push	bc
   6242 33            [ 6]  558 	inc	sp
   6243 2A 26 60      [16]  559 	ld	hl,(_mapa)
   6246 E5            [11]  560 	push	hl
   6247 CD 96 49      [17]  561 	call	_getTilePtr
   624A F1            [10]  562 	pop	af
   624B F1            [10]  563 	pop	af
   624C EB            [ 4]  564 	ex	de,hl
                            565 ;src/main.c:171: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
   624D 3A 4B 5F      [13]  566 	ld	a, (#(_prota + 0x0001) + 0)
   6250 C6 0B         [ 7]  567 	add	a, #0x0B
   6252 47            [ 4]  568 	ld	b,a
   6253 3A 4A 5F      [13]  569 	ld	a, (#_prota + 0)
   6256 C6 FF         [ 7]  570 	add	a,#0xFF
   6258 D5            [11]  571 	push	de
   6259 C5            [11]  572 	push	bc
   625A 33            [ 6]  573 	inc	sp
   625B F5            [11]  574 	push	af
   625C 33            [ 6]  575 	inc	sp
   625D 2A 26 60      [16]  576 	ld	hl,(_mapa)
   6260 E5            [11]  577 	push	hl
   6261 CD 96 49      [17]  578 	call	_getTilePtr
   6264 F1            [10]  579 	pop	af
   6265 F1            [10]  580 	pop	af
   6266 4D            [ 4]  581 	ld	c,l
   6267 44            [ 4]  582 	ld	b,h
   6268 D1            [10]  583 	pop	de
                            584 ;src/main.c:172: break;
   6269 18 78         [12]  585 	jr	00105$
                            586 ;src/main.c:173: case 2:
   626B                     587 00103$:
                            588 ;src/main.c:174: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
   626B 3A 4B 5F      [13]  589 	ld	a, (#(_prota + 0x0001) + 0)
   626E C6 FE         [ 7]  590 	add	a,#0xFE
   6270 21 4A 5F      [10]  591 	ld	hl, #_prota + 0
   6273 56            [ 7]  592 	ld	d,(hl)
   6274 C5            [11]  593 	push	bc
   6275 F5            [11]  594 	push	af
   6276 33            [ 6]  595 	inc	sp
   6277 D5            [11]  596 	push	de
   6278 33            [ 6]  597 	inc	sp
   6279 2A 26 60      [16]  598 	ld	hl,(_mapa)
   627C E5            [11]  599 	push	hl
   627D CD 96 49      [17]  600 	call	_getTilePtr
   6280 F1            [10]  601 	pop	af
   6281 F1            [10]  602 	pop	af
   6282 C1            [10]  603 	pop	bc
   6283 33            [ 6]  604 	inc	sp
   6284 33            [ 6]  605 	inc	sp
   6285 E5            [11]  606 	push	hl
                            607 ;src/main.c:175: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
   6286 21 4B 5F      [10]  608 	ld	hl, #(_prota + 0x0001) + 0
   6289 56            [ 7]  609 	ld	d,(hl)
   628A 15            [ 4]  610 	dec	d
   628B 15            [ 4]  611 	dec	d
   628C 3A 4A 5F      [13]  612 	ld	a, (#_prota + 0)
   628F C6 03         [ 7]  613 	add	a, #0x03
   6291 C5            [11]  614 	push	bc
   6292 D5            [11]  615 	push	de
   6293 33            [ 6]  616 	inc	sp
   6294 F5            [11]  617 	push	af
   6295 33            [ 6]  618 	inc	sp
   6296 2A 26 60      [16]  619 	ld	hl,(_mapa)
   6299 E5            [11]  620 	push	hl
   629A CD 96 49      [17]  621 	call	_getTilePtr
   629D F1            [10]  622 	pop	af
   629E F1            [10]  623 	pop	af
   629F EB            [ 4]  624 	ex	de,hl
   62A0 C1            [10]  625 	pop	bc
                            626 ;src/main.c:176: *waistTile = 0;
   62A1 21 00 00      [10]  627 	ld	hl,#0x0000
   62A4 36 00         [10]  628 	ld	(hl),#0x00
                            629 ;src/main.c:177: break;
   62A6 18 3B         [12]  630 	jr	00105$
                            631 ;src/main.c:178: case 3:
   62A8                     632 00104$:
                            633 ;src/main.c:179: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
   62A8 3A 4B 5F      [13]  634 	ld	a, (#(_prota + 0x0001) + 0)
   62AB C6 16         [ 7]  635 	add	a, #0x16
   62AD 21 4A 5F      [10]  636 	ld	hl, #_prota + 0
   62B0 56            [ 7]  637 	ld	d,(hl)
   62B1 C5            [11]  638 	push	bc
   62B2 F5            [11]  639 	push	af
   62B3 33            [ 6]  640 	inc	sp
   62B4 D5            [11]  641 	push	de
   62B5 33            [ 6]  642 	inc	sp
   62B6 2A 26 60      [16]  643 	ld	hl,(_mapa)
   62B9 E5            [11]  644 	push	hl
   62BA CD 96 49      [17]  645 	call	_getTilePtr
   62BD F1            [10]  646 	pop	af
   62BE F1            [10]  647 	pop	af
   62BF C1            [10]  648 	pop	bc
   62C0 33            [ 6]  649 	inc	sp
   62C1 33            [ 6]  650 	inc	sp
   62C2 E5            [11]  651 	push	hl
                            652 ;src/main.c:180: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   62C3 3A 4B 5F      [13]  653 	ld	a, (#(_prota + 0x0001) + 0)
   62C6 C6 16         [ 7]  654 	add	a, #0x16
   62C8 57            [ 4]  655 	ld	d,a
   62C9 3A 4A 5F      [13]  656 	ld	a, (#_prota + 0)
   62CC C6 03         [ 7]  657 	add	a, #0x03
   62CE C5            [11]  658 	push	bc
   62CF D5            [11]  659 	push	de
   62D0 33            [ 6]  660 	inc	sp
   62D1 F5            [11]  661 	push	af
   62D2 33            [ 6]  662 	inc	sp
   62D3 2A 26 60      [16]  663 	ld	hl,(_mapa)
   62D6 E5            [11]  664 	push	hl
   62D7 CD 96 49      [17]  665 	call	_getTilePtr
   62DA F1            [10]  666 	pop	af
   62DB F1            [10]  667 	pop	af
   62DC EB            [ 4]  668 	ex	de,hl
   62DD C1            [10]  669 	pop	bc
                            670 ;src/main.c:181: *waistTile = 0;
   62DE 21 00 00      [10]  671 	ld	hl,#0x0000
   62E1 36 00         [10]  672 	ld	(hl),#0x00
                            673 ;src/main.c:183: }
   62E3                     674 00105$:
                            675 ;src/main.c:185: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   62E3 E1            [10]  676 	pop	hl
   62E4 E5            [11]  677 	push	hl
   62E5 6E            [ 7]  678 	ld	l,(hl)
   62E6 3E 02         [ 7]  679 	ld	a,#0x02
   62E8 95            [ 4]  680 	sub	a, l
   62E9 38 0E         [12]  681 	jr	C,00106$
   62EB 1A            [ 7]  682 	ld	a,(de)
   62EC 5F            [ 4]  683 	ld	e,a
   62ED 3E 02         [ 7]  684 	ld	a,#0x02
   62EF 93            [ 4]  685 	sub	a, e
   62F0 38 07         [12]  686 	jr	C,00106$
   62F2 0A            [ 7]  687 	ld	a,(bc)
   62F3 4F            [ 4]  688 	ld	c,a
   62F4 3E 02         [ 7]  689 	ld	a,#0x02
   62F6 91            [ 4]  690 	sub	a, c
   62F7 30 04         [12]  691 	jr	NC,00107$
   62F9                     692 00106$:
                            693 ;src/main.c:186: return 1;
   62F9 2E 01         [ 7]  694 	ld	l,#0x01
   62FB 18 02         [12]  695 	jr	00110$
   62FD                     696 00107$:
                            697 ;src/main.c:188: return 0;
   62FD 2E 00         [ 7]  698 	ld	l,#0x00
   62FF                     699 00110$:
   62FF DD F9         [10]  700 	ld	sp, ix
   6301 DD E1         [14]  701 	pop	ix
   6303 C9            [10]  702 	ret
                            703 ;src/main.c:191: void dibujarEnemigo(TEnemy *enemy) {
                            704 ;	---------------------------------
                            705 ; Function dibujarEnemigo
                            706 ; ---------------------------------
   6304                     707 _dibujarEnemigo::
   6304 DD E5         [15]  708 	push	ix
   6306 DD 21 00 00   [14]  709 	ld	ix,#0
   630A DD 39         [15]  710 	add	ix,sp
                            711 ;src/main.c:192: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   630C DD 4E 04      [19]  712 	ld	c,4 (ix)
   630F DD 46 05      [19]  713 	ld	b,5 (ix)
   6312 69            [ 4]  714 	ld	l, c
   6313 60            [ 4]  715 	ld	h, b
   6314 23            [ 6]  716 	inc	hl
   6315 56            [ 7]  717 	ld	d,(hl)
   6316 0A            [ 7]  718 	ld	a,(bc)
   6317 C5            [11]  719 	push	bc
   6318 D5            [11]  720 	push	de
   6319 33            [ 6]  721 	inc	sp
   631A F5            [11]  722 	push	af
   631B 33            [ 6]  723 	inc	sp
   631C 21 00 C0      [10]  724 	ld	hl,#0xC000
   631F E5            [11]  725 	push	hl
   6320 CD 7F 5E      [17]  726 	call	_cpct_getScreenPtr
   6323 EB            [ 4]  727 	ex	de,hl
                            728 ;src/main.c:193: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   6324 E1            [10]  729 	pop	hl
   6325 01 04 00      [10]  730 	ld	bc, #0x0004
   6328 09            [11]  731 	add	hl, bc
   6329 4E            [ 7]  732 	ld	c,(hl)
   632A 23            [ 6]  733 	inc	hl
   632B 46            [ 7]  734 	ld	b,(hl)
   632C 21 00 01      [10]  735 	ld	hl,#_g_tablatrans
   632F E5            [11]  736 	push	hl
   6330 21 04 16      [10]  737 	ld	hl,#0x1604
   6333 E5            [11]  738 	push	hl
   6334 D5            [11]  739 	push	de
   6335 C5            [11]  740 	push	bc
   6336 CD 9F 5E      [17]  741 	call	_cpct_drawSpriteMaskedAlignedTable
   6339 DD E1         [14]  742 	pop	ix
   633B C9            [10]  743 	ret
                            744 ;src/main.c:196: void dibujarExplosion(TEnemy *enemy) {
                            745 ;	---------------------------------
                            746 ; Function dibujarExplosion
                            747 ; ---------------------------------
   633C                     748 _dibujarExplosion::
   633C DD E5         [15]  749 	push	ix
   633E DD 21 00 00   [14]  750 	ld	ix,#0
   6342 DD 39         [15]  751 	add	ix,sp
                            752 ;src/main.c:197: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   6344 DD 4E 04      [19]  753 	ld	c,4 (ix)
   6347 DD 46 05      [19]  754 	ld	b,5 (ix)
   634A 69            [ 4]  755 	ld	l, c
   634B 60            [ 4]  756 	ld	h, b
   634C 23            [ 6]  757 	inc	hl
   634D 56            [ 7]  758 	ld	d,(hl)
   634E 0A            [ 7]  759 	ld	a,(bc)
   634F 47            [ 4]  760 	ld	b,a
   6350 D5            [11]  761 	push	de
   6351 33            [ 6]  762 	inc	sp
   6352 C5            [11]  763 	push	bc
   6353 33            [ 6]  764 	inc	sp
   6354 21 00 C0      [10]  765 	ld	hl,#0xC000
   6357 E5            [11]  766 	push	hl
   6358 CD 7F 5E      [17]  767 	call	_cpct_getScreenPtr
   635B 4D            [ 4]  768 	ld	c,l
   635C 44            [ 4]  769 	ld	b,h
                            770 ;src/main.c:198: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   635D 11 00 01      [10]  771 	ld	de,#_g_tablatrans+0
   6360 D5            [11]  772 	push	de
   6361 21 04 16      [10]  773 	ld	hl,#0x1604
   6364 E5            [11]  774 	push	hl
   6365 C5            [11]  775 	push	bc
   6366 21 70 19      [10]  776 	ld	hl,#_g_explosion
   6369 E5            [11]  777 	push	hl
   636A CD 9F 5E      [17]  778 	call	_cpct_drawSpriteMaskedAlignedTable
   636D DD E1         [14]  779 	pop	ix
   636F C9            [10]  780 	ret
                            781 ;src/main.c:201: void borrarExplosion(TEnemy *enemy) {
                            782 ;	---------------------------------
                            783 ; Function borrarExplosion
                            784 ; ---------------------------------
   6370                     785 _borrarExplosion::
   6370 DD E5         [15]  786 	push	ix
   6372 DD 21 00 00   [14]  787 	ld	ix,#0
   6376 DD 39         [15]  788 	add	ix,sp
   6378 F5            [11]  789 	push	af
   6379 3B            [ 6]  790 	dec	sp
                            791 ;src/main.c:204: u8 w = 4 + (enemy->px & 1);
   637A DD 5E 04      [19]  792 	ld	e,4 (ix)
   637D DD 56 05      [19]  793 	ld	d,5 (ix)
   6380 6B            [ 4]  794 	ld	l, e
   6381 62            [ 4]  795 	ld	h, d
   6382 23            [ 6]  796 	inc	hl
   6383 23            [ 6]  797 	inc	hl
   6384 4E            [ 7]  798 	ld	c,(hl)
   6385 79            [ 4]  799 	ld	a,c
   6386 E6 01         [ 7]  800 	and	a, #0x01
   6388 47            [ 4]  801 	ld	b,a
   6389 04            [ 4]  802 	inc	b
   638A 04            [ 4]  803 	inc	b
   638B 04            [ 4]  804 	inc	b
   638C 04            [ 4]  805 	inc	b
                            806 ;src/main.c:207: u8 h = 6 + (enemy->py & 2 ? 1 : 0);
   638D EB            [ 4]  807 	ex	de,hl
   638E 23            [ 6]  808 	inc	hl
   638F 23            [ 6]  809 	inc	hl
   6390 23            [ 6]  810 	inc	hl
   6391 5E            [ 7]  811 	ld	e,(hl)
   6392 CB 4B         [ 8]  812 	bit	1, e
   6394 28 04         [12]  813 	jr	Z,00103$
   6396 3E 01         [ 7]  814 	ld	a,#0x01
   6398 18 02         [12]  815 	jr	00104$
   639A                     816 00103$:
   639A 3E 00         [ 7]  817 	ld	a,#0x00
   639C                     818 00104$:
   639C C6 06         [ 7]  819 	add	a, #0x06
   639E DD 77 FD      [19]  820 	ld	-3 (ix),a
                            821 ;src/main.c:209: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   63A1 FD 2A 26 60   [20]  822 	ld	iy,(_mapa)
   63A5 16 00         [ 7]  823 	ld	d,#0x00
   63A7 7B            [ 4]  824 	ld	a,e
   63A8 C6 E8         [ 7]  825 	add	a,#0xE8
   63AA DD 77 FE      [19]  826 	ld	-2 (ix),a
   63AD 7A            [ 4]  827 	ld	a,d
   63AE CE FF         [ 7]  828 	adc	a,#0xFF
   63B0 DD 77 FF      [19]  829 	ld	-1 (ix),a
   63B3 DD 6E FE      [19]  830 	ld	l,-2 (ix)
   63B6 DD 66 FF      [19]  831 	ld	h,-1 (ix)
   63B9 DD CB FF 7E   [20]  832 	bit	7, -1 (ix)
   63BD 28 04         [12]  833 	jr	Z,00105$
   63BF 21 EB FF      [10]  834 	ld	hl,#0xFFEB
   63C2 19            [11]  835 	add	hl,de
   63C3                     836 00105$:
   63C3 CB 2C         [ 8]  837 	sra	h
   63C5 CB 1D         [ 8]  838 	rr	l
   63C7 CB 2C         [ 8]  839 	sra	h
   63C9 CB 1D         [ 8]  840 	rr	l
   63CB 55            [ 4]  841 	ld	d,l
   63CC CB 39         [ 8]  842 	srl	c
   63CE FD E5         [15]  843 	push	iy
   63D0 21 F0 C0      [10]  844 	ld	hl,#0xC0F0
   63D3 E5            [11]  845 	push	hl
   63D4 3E 28         [ 7]  846 	ld	a,#0x28
   63D6 F5            [11]  847 	push	af
   63D7 33            [ 6]  848 	inc	sp
   63D8 DD 7E FD      [19]  849 	ld	a,-3 (ix)
   63DB F5            [11]  850 	push	af
   63DC 33            [ 6]  851 	inc	sp
   63DD C5            [11]  852 	push	bc
   63DE 33            [ 6]  853 	inc	sp
   63DF D5            [11]  854 	push	de
   63E0 33            [ 6]  855 	inc	sp
   63E1 79            [ 4]  856 	ld	a,c
   63E2 F5            [11]  857 	push	af
   63E3 33            [ 6]  858 	inc	sp
   63E4 CD 61 53      [17]  859 	call	_cpct_etm_drawTileBox2x4
   63E7 DD F9         [10]  860 	ld	sp, ix
   63E9 DD E1         [14]  861 	pop	ix
   63EB C9            [10]  862 	ret
                            863 ;src/main.c:213: void borrarEnemigo(u8 x, u8 y) {
                            864 ;	---------------------------------
                            865 ; Function borrarEnemigo
                            866 ; ---------------------------------
   63EC                     867 _borrarEnemigo::
   63EC DD E5         [15]  868 	push	ix
   63EE DD 21 00 00   [14]  869 	ld	ix,#0
   63F2 DD 39         [15]  870 	add	ix,sp
   63F4 F5            [11]  871 	push	af
   63F5 F5            [11]  872 	push	af
                            873 ;src/main.c:217: u8 w = 4 + (x & 1);
   63F6 DD 7E 04      [19]  874 	ld	a,4 (ix)
   63F9 E6 01         [ 7]  875 	and	a, #0x01
   63FB 5F            [ 4]  876 	ld	e,a
   63FC 1C            [ 4]  877 	inc	e
   63FD 1C            [ 4]  878 	inc	e
   63FE 1C            [ 4]  879 	inc	e
   63FF 1C            [ 4]  880 	inc	e
                            881 ;src/main.c:220: u8 h = 6 + (y & 3 ? 1 : 0);
   6400 DD 7E 05      [19]  882 	ld	a,5 (ix)
   6403 E6 03         [ 7]  883 	and	a, #0x03
   6405 28 04         [12]  884 	jr	Z,00103$
   6407 3E 01         [ 7]  885 	ld	a,#0x01
   6409 18 02         [12]  886 	jr	00104$
   640B                     887 00103$:
   640B 3E 00         [ 7]  888 	ld	a,#0x00
   640D                     889 00104$:
   640D C6 06         [ 7]  890 	add	a, #0x06
   640F 57            [ 4]  891 	ld	d,a
                            892 ;src/main.c:222: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   6410 2A 26 60      [16]  893 	ld	hl,(_mapa)
   6413 DD 75 FE      [19]  894 	ld	-2 (ix),l
   6416 DD 74 FF      [19]  895 	ld	-1 (ix),h
   6419 DD 4E 05      [19]  896 	ld	c,5 (ix)
   641C 06 00         [ 7]  897 	ld	b,#0x00
   641E 79            [ 4]  898 	ld	a,c
   641F C6 E8         [ 7]  899 	add	a,#0xE8
   6421 DD 77 FC      [19]  900 	ld	-4 (ix),a
   6424 78            [ 4]  901 	ld	a,b
   6425 CE FF         [ 7]  902 	adc	a,#0xFF
   6427 DD 77 FD      [19]  903 	ld	-3 (ix),a
   642A E1            [10]  904 	pop	hl
   642B E5            [11]  905 	push	hl
   642C DD CB FD 7E   [20]  906 	bit	7, -3 (ix)
   6430 28 04         [12]  907 	jr	Z,00105$
   6432 21 EB FF      [10]  908 	ld	hl,#0xFFEB
   6435 09            [11]  909 	add	hl,bc
   6436                     910 00105$:
   6436 CB 2C         [ 8]  911 	sra	h
   6438 CB 1D         [ 8]  912 	rr	l
   643A CB 2C         [ 8]  913 	sra	h
   643C CB 1D         [ 8]  914 	rr	l
   643E 45            [ 4]  915 	ld	b,l
   643F DD 4E 04      [19]  916 	ld	c,4 (ix)
   6442 CB 39         [ 8]  917 	srl	c
   6444 DD 6E FE      [19]  918 	ld	l,-2 (ix)
   6447 DD 66 FF      [19]  919 	ld	h,-1 (ix)
   644A E5            [11]  920 	push	hl
   644B 21 F0 C0      [10]  921 	ld	hl,#0xC0F0
   644E E5            [11]  922 	push	hl
   644F 3E 28         [ 7]  923 	ld	a,#0x28
   6451 F5            [11]  924 	push	af
   6452 33            [ 6]  925 	inc	sp
   6453 D5            [11]  926 	push	de
   6454 C5            [11]  927 	push	bc
   6455 CD 61 53      [17]  928 	call	_cpct_etm_drawTileBox2x4
                            929 ;src/main.c:224: enemy->mover = NO;
   6458 21 E0 5E      [10]  930 	ld	hl,#(_enemy + 0x0006)
   645B 36 00         [10]  931 	ld	(hl),#0x00
   645D DD F9         [10]  932 	ld	sp, ix
   645F DD E1         [14]  933 	pop	ix
   6461 C9            [10]  934 	ret
                            935 ;src/main.c:227: void redibujarEnemigo(u8 x, u8 y, TEnemy *enemy) {
                            936 ;	---------------------------------
                            937 ; Function redibujarEnemigo
                            938 ; ---------------------------------
   6462                     939 _redibujarEnemigo::
   6462 DD E5         [15]  940 	push	ix
   6464 DD 21 00 00   [14]  941 	ld	ix,#0
   6468 DD 39         [15]  942 	add	ix,sp
                            943 ;src/main.c:228: borrarEnemigo(x, y);
   646A DD 66 05      [19]  944 	ld	h,5 (ix)
   646D DD 6E 04      [19]  945 	ld	l,4 (ix)
   6470 E5            [11]  946 	push	hl
   6471 CD EC 63      [17]  947 	call	_borrarEnemigo
   6474 F1            [10]  948 	pop	af
                            949 ;src/main.c:229: enemy->px = enemy->x;
   6475 DD 4E 06      [19]  950 	ld	c,6 (ix)
   6478 DD 46 07      [19]  951 	ld	b,7 (ix)
   647B 59            [ 4]  952 	ld	e, c
   647C 50            [ 4]  953 	ld	d, b
   647D 13            [ 6]  954 	inc	de
   647E 13            [ 6]  955 	inc	de
   647F 0A            [ 7]  956 	ld	a,(bc)
   6480 12            [ 7]  957 	ld	(de),a
                            958 ;src/main.c:230: enemy->py = enemy->y;
   6481 59            [ 4]  959 	ld	e, c
   6482 50            [ 4]  960 	ld	d, b
   6483 13            [ 6]  961 	inc	de
   6484 13            [ 6]  962 	inc	de
   6485 13            [ 6]  963 	inc	de
   6486 69            [ 4]  964 	ld	l, c
   6487 60            [ 4]  965 	ld	h, b
   6488 23            [ 6]  966 	inc	hl
   6489 7E            [ 7]  967 	ld	a,(hl)
   648A 12            [ 7]  968 	ld	(de),a
                            969 ;src/main.c:231: dibujarEnemigo(enemy);
   648B C5            [11]  970 	push	bc
   648C CD 04 63      [17]  971 	call	_dibujarEnemigo
   648F F1            [10]  972 	pop	af
   6490 DD E1         [14]  973 	pop	ix
   6492 C9            [10]  974 	ret
                            975 ;src/main.c:234: u8 checkEnemyCollision(u8 direction, TEnemy *enemy){
                            976 ;	---------------------------------
                            977 ; Function checkEnemyCollision
                            978 ; ---------------------------------
   6493                     979 _checkEnemyCollision::
   6493 DD E5         [15]  980 	push	ix
   6495 DD 21 00 00   [14]  981 	ld	ix,#0
   6499 DD 39         [15]  982 	add	ix,sp
   649B 21 F7 FF      [10]  983 	ld	hl,#-9
   649E 39            [11]  984 	add	hl,sp
   649F F9            [ 6]  985 	ld	sp,hl
                            986 ;src/main.c:236: u8 colisiona = 1;
   64A0 DD 36 F7 01   [19]  987 	ld	-9 (ix),#0x01
                            988 ;src/main.c:238: switch (direction) {
   64A4 3E 03         [ 7]  989 	ld	a,#0x03
   64A6 DD 96 04      [19]  990 	sub	a, 4 (ix)
   64A9 DA 86 68      [10]  991 	jp	C,00165$
                            992 ;src/main.c:240: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   64AC DD 4E 05      [19]  993 	ld	c,5 (ix)
   64AF DD 46 06      [19]  994 	ld	b,6 (ix)
   64B2 0A            [ 7]  995 	ld	a,(bc)
   64B3 5F            [ 4]  996 	ld	e,a
   64B4 21 01 00      [10]  997 	ld	hl,#0x0001
   64B7 09            [11]  998 	add	hl,bc
   64B8 DD 75 F8      [19]  999 	ld	-8 (ix),l
   64BB DD 74 F9      [19] 1000 	ld	-7 (ix),h
   64BE DD 6E F8      [19] 1001 	ld	l,-8 (ix)
   64C1 DD 66 F9      [19] 1002 	ld	h,-7 (ix)
   64C4 56            [ 7] 1003 	ld	d,(hl)
                           1004 ;src/main.c:253: enemy->muerto = SI;
   64C5 21 08 00      [10] 1005 	ld	hl,#0x0008
   64C8 09            [11] 1006 	add	hl,bc
   64C9 DD 75 FA      [19] 1007 	ld	-6 (ix),l
   64CC DD 74 FB      [19] 1008 	ld	-5 (ix),h
                           1009 ;src/main.c:260: enemy->mira = M_izquierda;
   64CF 21 07 00      [10] 1010 	ld	hl,#0x0007
   64D2 09            [11] 1011 	add	hl,bc
   64D3 DD 75 FC      [19] 1012 	ld	-4 (ix),l
   64D6 DD 74 FD      [19] 1013 	ld	-3 (ix),h
                           1014 ;src/main.c:238: switch (direction) {
   64D9 D5            [11] 1015 	push	de
   64DA DD 5E 04      [19] 1016 	ld	e,4 (ix)
   64DD 16 00         [ 7] 1017 	ld	d,#0x00
   64DF 21 E7 64      [10] 1018 	ld	hl,#00268$
   64E2 19            [11] 1019 	add	hl,de
   64E3 19            [11] 1020 	add	hl,de
   64E4 19            [11] 1021 	add	hl,de
   64E5 D1            [10] 1022 	pop	de
   64E6 E9            [ 4] 1023 	jp	(hl)
   64E7                    1024 00268$:
   64E7 C3 F3 64      [10] 1025 	jp	00101$
   64EA C3 DB 65      [10] 1026 	jp	00117$
   64ED C3 BF 66      [10] 1027 	jp	00133$
   64F0 C3 9D 67      [10] 1028 	jp	00149$
                           1029 ;src/main.c:239: case 0:
   64F3                    1030 00101$:
                           1031 ;src/main.c:240: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   64F3 7B            [ 4] 1032 	ld	a,e
   64F4 C6 05         [ 7] 1033 	add	a, #0x05
   64F6 C5            [11] 1034 	push	bc
   64F7 D5            [11] 1035 	push	de
   64F8 33            [ 6] 1036 	inc	sp
   64F9 F5            [11] 1037 	push	af
   64FA 33            [ 6] 1038 	inc	sp
   64FB 2A 26 60      [16] 1039 	ld	hl,(_mapa)
   64FE E5            [11] 1040 	push	hl
   64FF CD 96 49      [17] 1041 	call	_getTilePtr
   6502 F1            [10] 1042 	pop	af
   6503 F1            [10] 1043 	pop	af
   6504 C1            [10] 1044 	pop	bc
   6505 5E            [ 7] 1045 	ld	e,(hl)
   6506 3E 02         [ 7] 1046 	ld	a,#0x02
   6508 93            [ 4] 1047 	sub	a, e
   6509 DA D0 65      [10] 1048 	jp	C,00113$
                           1049 ;src/main.c:241: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   650C DD 6E F8      [19] 1050 	ld	l,-8 (ix)
   650F DD 66 F9      [19] 1051 	ld	h,-7 (ix)
   6512 7E            [ 7] 1052 	ld	a,(hl)
   6513 C6 0B         [ 7] 1053 	add	a, #0x0B
   6515 57            [ 4] 1054 	ld	d,a
   6516 0A            [ 7] 1055 	ld	a,(bc)
   6517 C6 05         [ 7] 1056 	add	a, #0x05
   6519 C5            [11] 1057 	push	bc
   651A D5            [11] 1058 	push	de
   651B 33            [ 6] 1059 	inc	sp
   651C F5            [11] 1060 	push	af
   651D 33            [ 6] 1061 	inc	sp
   651E 2A 26 60      [16] 1062 	ld	hl,(_mapa)
   6521 E5            [11] 1063 	push	hl
   6522 CD 96 49      [17] 1064 	call	_getTilePtr
   6525 F1            [10] 1065 	pop	af
   6526 F1            [10] 1066 	pop	af
   6527 C1            [10] 1067 	pop	bc
   6528 5E            [ 7] 1068 	ld	e,(hl)
   6529 3E 02         [ 7] 1069 	ld	a,#0x02
   652B 93            [ 4] 1070 	sub	a, e
   652C DA D0 65      [10] 1071 	jp	C,00113$
                           1072 ;src/main.c:242: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   652F DD 6E F8      [19] 1073 	ld	l,-8 (ix)
   6532 DD 66 F9      [19] 1074 	ld	h,-7 (ix)
   6535 7E            [ 7] 1075 	ld	a,(hl)
   6536 C6 16         [ 7] 1076 	add	a, #0x16
   6538 57            [ 4] 1077 	ld	d,a
   6539 0A            [ 7] 1078 	ld	a,(bc)
   653A C6 05         [ 7] 1079 	add	a, #0x05
   653C C5            [11] 1080 	push	bc
   653D D5            [11] 1081 	push	de
   653E 33            [ 6] 1082 	inc	sp
   653F F5            [11] 1083 	push	af
   6540 33            [ 6] 1084 	inc	sp
   6541 2A 26 60      [16] 1085 	ld	hl,(_mapa)
   6544 E5            [11] 1086 	push	hl
   6545 CD 96 49      [17] 1087 	call	_getTilePtr
   6548 F1            [10] 1088 	pop	af
   6549 F1            [10] 1089 	pop	af
   654A C1            [10] 1090 	pop	bc
   654B 5E            [ 7] 1091 	ld	e,(hl)
   654C 3E 02         [ 7] 1092 	ld	a,#0x02
   654E 93            [ 4] 1093 	sub	a, e
   654F DA D0 65      [10] 1094 	jp	C,00113$
                           1095 ;src/main.c:244: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   6552 21 53 5F      [10] 1096 	ld	hl, #_cu + 1
   6555 5E            [ 7] 1097 	ld	e,(hl)
   6556 16 00         [ 7] 1098 	ld	d,#0x00
   6558 21 04 00      [10] 1099 	ld	hl,#0x0004
   655B 19            [11] 1100 	add	hl,de
   655C DD 75 FE      [19] 1101 	ld	-2 (ix),l
   655F DD 74 FF      [19] 1102 	ld	-1 (ix),h
   6562 DD 6E F8      [19] 1103 	ld	l,-8 (ix)
   6565 DD 66 F9      [19] 1104 	ld	h,-7 (ix)
   6568 6E            [ 7] 1105 	ld	l,(hl)
   6569 26 00         [ 7] 1106 	ld	h,#0x00
   656B DD 7E FE      [19] 1107 	ld	a,-2 (ix)
   656E 95            [ 4] 1108 	sub	a, l
   656F DD 7E FF      [19] 1109 	ld	a,-1 (ix)
   6572 9C            [ 4] 1110 	sbc	a, h
   6573 E2 78 65      [10] 1111 	jp	PO, 00269$
   6576 EE 80         [ 7] 1112 	xor	a, #0x80
   6578                    1113 00269$:
   6578 FA 8D 65      [10] 1114 	jp	M,00108$
   657B D5            [11] 1115 	push	de
   657C 11 16 00      [10] 1116 	ld	de,#0x0016
   657F 19            [11] 1117 	add	hl, de
   6580 D1            [10] 1118 	pop	de
   6581 7D            [ 4] 1119 	ld	a,l
   6582 93            [ 4] 1120 	sub	a, e
   6583 7C            [ 4] 1121 	ld	a,h
   6584 9A            [ 4] 1122 	sbc	a, d
   6585 E2 8A 65      [10] 1123 	jp	PO, 00270$
   6588 EE 80         [ 7] 1124 	xor	a, #0x80
   658A                    1125 00270$:
   658A F2 94 65      [10] 1126 	jp	P,00109$
   658D                    1127 00108$:
                           1128 ;src/main.c:245: colisiona = 0;
   658D DD 36 F7 00   [19] 1129 	ld	-9 (ix),#0x00
   6591 C3 86 68      [10] 1130 	jp	00165$
   6594                    1131 00109$:
                           1132 ;src/main.c:248: if(cu.x > enemy->x){ //si el cu esta abajo
   6594 21 52 5F      [10] 1133 	ld	hl, #_cu + 0
   6597 5E            [ 7] 1134 	ld	e,(hl)
   6598 0A            [ 7] 1135 	ld	a,(bc)
   6599 4F            [ 4] 1136 	ld	c,a
   659A 93            [ 4] 1137 	sub	a, e
   659B 30 2C         [12] 1138 	jr	NC,00106$
                           1139 ;src/main.c:249: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
   659D 6B            [ 4] 1140 	ld	l,e
   659E 26 00         [ 7] 1141 	ld	h,#0x00
   65A0 06 00         [ 7] 1142 	ld	b,#0x00
   65A2 03            [ 6] 1143 	inc	bc
   65A3 03            [ 6] 1144 	inc	bc
   65A4 03            [ 6] 1145 	inc	bc
   65A5 03            [ 6] 1146 	inc	bc
   65A6 BF            [ 4] 1147 	cp	a, a
   65A7 ED 42         [15] 1148 	sbc	hl, bc
   65A9 3E 01         [ 7] 1149 	ld	a,#0x01
   65AB BD            [ 4] 1150 	cp	a, l
   65AC 3E 00         [ 7] 1151 	ld	a,#0x00
   65AE 9C            [ 4] 1152 	sbc	a, h
   65AF E2 B4 65      [10] 1153 	jp	PO, 00271$
   65B2 EE 80         [ 7] 1154 	xor	a, #0x80
   65B4                    1155 00271$:
   65B4 F2 BE 65      [10] 1156 	jp	P,00103$
                           1157 ;src/main.c:250: colisiona = 0;
   65B7 DD 36 F7 00   [19] 1158 	ld	-9 (ix),#0x00
   65BB C3 86 68      [10] 1159 	jp	00165$
   65BE                    1160 00103$:
                           1161 ;src/main.c:253: enemy->muerto = SI;
   65BE DD 6E FA      [19] 1162 	ld	l,-6 (ix)
   65C1 DD 66 FB      [19] 1163 	ld	h,-5 (ix)
   65C4 36 01         [10] 1164 	ld	(hl),#0x01
   65C6 C3 86 68      [10] 1165 	jp	00165$
   65C9                    1166 00106$:
                           1167 ;src/main.c:256: colisiona = 0;
   65C9 DD 36 F7 00   [19] 1168 	ld	-9 (ix),#0x00
   65CD C3 86 68      [10] 1169 	jp	00165$
   65D0                    1170 00113$:
                           1171 ;src/main.c:260: enemy->mira = M_izquierda;
   65D0 DD 6E FC      [19] 1172 	ld	l,-4 (ix)
   65D3 DD 66 FD      [19] 1173 	ld	h,-3 (ix)
   65D6 36 01         [10] 1174 	ld	(hl),#0x01
                           1175 ;src/main.c:262: break;
   65D8 C3 86 68      [10] 1176 	jp	00165$
                           1177 ;src/main.c:263: case 1:
   65DB                    1178 00117$:
                           1179 ;src/main.c:264: if( *getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   65DB 1D            [ 4] 1180 	dec	e
   65DC C5            [11] 1181 	push	bc
   65DD D5            [11] 1182 	push	de
   65DE 2A 26 60      [16] 1183 	ld	hl,(_mapa)
   65E1 E5            [11] 1184 	push	hl
   65E2 CD 96 49      [17] 1185 	call	_getTilePtr
   65E5 F1            [10] 1186 	pop	af
   65E6 F1            [10] 1187 	pop	af
   65E7 C1            [10] 1188 	pop	bc
   65E8 5E            [ 7] 1189 	ld	e,(hl)
   65E9 3E 02         [ 7] 1190 	ld	a,#0x02
   65EB 93            [ 4] 1191 	sub	a, e
   65EC DA B4 66      [10] 1192 	jp	C,00129$
                           1193 ;src/main.c:265: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   65EF DD 6E F8      [19] 1194 	ld	l,-8 (ix)
   65F2 DD 66 F9      [19] 1195 	ld	h,-7 (ix)
   65F5 7E            [ 7] 1196 	ld	a,(hl)
   65F6 C6 0B         [ 7] 1197 	add	a, #0x0B
   65F8 57            [ 4] 1198 	ld	d,a
   65F9 0A            [ 7] 1199 	ld	a,(bc)
   65FA C6 FF         [ 7] 1200 	add	a,#0xFF
   65FC C5            [11] 1201 	push	bc
   65FD D5            [11] 1202 	push	de
   65FE 33            [ 6] 1203 	inc	sp
   65FF F5            [11] 1204 	push	af
   6600 33            [ 6] 1205 	inc	sp
   6601 2A 26 60      [16] 1206 	ld	hl,(_mapa)
   6604 E5            [11] 1207 	push	hl
   6605 CD 96 49      [17] 1208 	call	_getTilePtr
   6608 F1            [10] 1209 	pop	af
   6609 F1            [10] 1210 	pop	af
   660A C1            [10] 1211 	pop	bc
   660B 5E            [ 7] 1212 	ld	e,(hl)
   660C 3E 02         [ 7] 1213 	ld	a,#0x02
   660E 93            [ 4] 1214 	sub	a, e
   660F DA B4 66      [10] 1215 	jp	C,00129$
                           1216 ;src/main.c:266: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   6612 DD 6E F8      [19] 1217 	ld	l,-8 (ix)
   6615 DD 66 F9      [19] 1218 	ld	h,-7 (ix)
   6618 7E            [ 7] 1219 	ld	a,(hl)
   6619 C6 16         [ 7] 1220 	add	a, #0x16
   661B 57            [ 4] 1221 	ld	d,a
   661C 0A            [ 7] 1222 	ld	a,(bc)
   661D C6 FF         [ 7] 1223 	add	a,#0xFF
   661F C5            [11] 1224 	push	bc
   6620 D5            [11] 1225 	push	de
   6621 33            [ 6] 1226 	inc	sp
   6622 F5            [11] 1227 	push	af
   6623 33            [ 6] 1228 	inc	sp
   6624 2A 26 60      [16] 1229 	ld	hl,(_mapa)
   6627 E5            [11] 1230 	push	hl
   6628 CD 96 49      [17] 1231 	call	_getTilePtr
   662B F1            [10] 1232 	pop	af
   662C F1            [10] 1233 	pop	af
   662D C1            [10] 1234 	pop	bc
   662E 5E            [ 7] 1235 	ld	e,(hl)
   662F 3E 02         [ 7] 1236 	ld	a,#0x02
   6631 93            [ 4] 1237 	sub	a, e
   6632 DA B4 66      [10] 1238 	jp	C,00129$
                           1239 ;src/main.c:268: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   6635 21 53 5F      [10] 1240 	ld	hl, #_cu + 1
   6638 5E            [ 7] 1241 	ld	e,(hl)
   6639 16 00         [ 7] 1242 	ld	d,#0x00
   663B 21 04 00      [10] 1243 	ld	hl,#0x0004
   663E 19            [11] 1244 	add	hl,de
   663F DD 75 FE      [19] 1245 	ld	-2 (ix),l
   6642 DD 74 FF      [19] 1246 	ld	-1 (ix),h
   6645 DD 6E F8      [19] 1247 	ld	l,-8 (ix)
   6648 DD 66 F9      [19] 1248 	ld	h,-7 (ix)
   664B 6E            [ 7] 1249 	ld	l,(hl)
   664C 26 00         [ 7] 1250 	ld	h,#0x00
   664E DD 7E FE      [19] 1251 	ld	a,-2 (ix)
   6651 95            [ 4] 1252 	sub	a, l
   6652 DD 7E FF      [19] 1253 	ld	a,-1 (ix)
   6655 9C            [ 4] 1254 	sbc	a, h
   6656 E2 5B 66      [10] 1255 	jp	PO, 00272$
   6659 EE 80         [ 7] 1256 	xor	a, #0x80
   665B                    1257 00272$:
   665B FA 70 66      [10] 1258 	jp	M,00124$
   665E D5            [11] 1259 	push	de
   665F 11 16 00      [10] 1260 	ld	de,#0x0016
   6662 19            [11] 1261 	add	hl, de
   6663 D1            [10] 1262 	pop	de
   6664 7D            [ 4] 1263 	ld	a,l
   6665 93            [ 4] 1264 	sub	a, e
   6666 7C            [ 4] 1265 	ld	a,h
   6667 9A            [ 4] 1266 	sbc	a, d
   6668 E2 6D 66      [10] 1267 	jp	PO, 00273$
   666B EE 80         [ 7] 1268 	xor	a, #0x80
   666D                    1269 00273$:
   666D F2 77 66      [10] 1270 	jp	P,00125$
   6670                    1271 00124$:
                           1272 ;src/main.c:269: colisiona = 0;
   6670 DD 36 F7 00   [19] 1273 	ld	-9 (ix),#0x00
   6674 C3 86 68      [10] 1274 	jp	00165$
   6677                    1275 00125$:
                           1276 ;src/main.c:272: if(enemy->x > cu.x){ //si el cu esta abajo
   6677 0A            [ 7] 1277 	ld	a,(bc)
   6678 5F            [ 4] 1278 	ld	e,a
   6679 21 52 5F      [10] 1279 	ld	hl, #_cu + 0
   667C 4E            [ 7] 1280 	ld	c,(hl)
   667D 79            [ 4] 1281 	ld	a,c
   667E 93            [ 4] 1282 	sub	a, e
   667F 30 2C         [12] 1283 	jr	NC,00122$
                           1284 ;src/main.c:273: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
   6681 6B            [ 4] 1285 	ld	l,e
   6682 26 00         [ 7] 1286 	ld	h,#0x00
   6684 06 00         [ 7] 1287 	ld	b,#0x00
   6686 03            [ 6] 1288 	inc	bc
   6687 03            [ 6] 1289 	inc	bc
   6688 03            [ 6] 1290 	inc	bc
   6689 03            [ 6] 1291 	inc	bc
   668A BF            [ 4] 1292 	cp	a, a
   668B ED 42         [15] 1293 	sbc	hl, bc
   668D 3E 01         [ 7] 1294 	ld	a,#0x01
   668F BD            [ 4] 1295 	cp	a, l
   6690 3E 00         [ 7] 1296 	ld	a,#0x00
   6692 9C            [ 4] 1297 	sbc	a, h
   6693 E2 98 66      [10] 1298 	jp	PO, 00274$
   6696 EE 80         [ 7] 1299 	xor	a, #0x80
   6698                    1300 00274$:
   6698 F2 A2 66      [10] 1301 	jp	P,00119$
                           1302 ;src/main.c:274: colisiona = 0;
   669B DD 36 F7 00   [19] 1303 	ld	-9 (ix),#0x00
   669F C3 86 68      [10] 1304 	jp	00165$
   66A2                    1305 00119$:
                           1306 ;src/main.c:277: enemy->muerto = SI;
   66A2 DD 6E FA      [19] 1307 	ld	l,-6 (ix)
   66A5 DD 66 FB      [19] 1308 	ld	h,-5 (ix)
   66A8 36 01         [10] 1309 	ld	(hl),#0x01
   66AA C3 86 68      [10] 1310 	jp	00165$
   66AD                    1311 00122$:
                           1312 ;src/main.c:280: colisiona = 0;
   66AD DD 36 F7 00   [19] 1313 	ld	-9 (ix),#0x00
   66B1 C3 86 68      [10] 1314 	jp	00165$
   66B4                    1315 00129$:
                           1316 ;src/main.c:284: enemy->mira = M_derecha;
   66B4 DD 6E FC      [19] 1317 	ld	l,-4 (ix)
   66B7 DD 66 FD      [19] 1318 	ld	h,-3 (ix)
   66BA 36 00         [10] 1319 	ld	(hl),#0x00
                           1320 ;src/main.c:286: break;
   66BC C3 86 68      [10] 1321 	jp	00165$
                           1322 ;src/main.c:287: case 2:
   66BF                    1323 00133$:
                           1324 ;src/main.c:288: if( *getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   66BF 15            [ 4] 1325 	dec	d
   66C0 15            [ 4] 1326 	dec	d
   66C1 C5            [11] 1327 	push	bc
   66C2 D5            [11] 1328 	push	de
   66C3 2A 26 60      [16] 1329 	ld	hl,(_mapa)
   66C6 E5            [11] 1330 	push	hl
   66C7 CD 96 49      [17] 1331 	call	_getTilePtr
   66CA F1            [10] 1332 	pop	af
   66CB F1            [10] 1333 	pop	af
   66CC C1            [10] 1334 	pop	bc
   66CD 5E            [ 7] 1335 	ld	e,(hl)
   66CE 3E 02         [ 7] 1336 	ld	a,#0x02
   66D0 93            [ 4] 1337 	sub	a, e
   66D1 DA 95 67      [10] 1338 	jp	C,00145$
                           1339 ;src/main.c:289: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   66D4 DD 6E F8      [19] 1340 	ld	l,-8 (ix)
   66D7 DD 66 F9      [19] 1341 	ld	h,-7 (ix)
   66DA 56            [ 7] 1342 	ld	d,(hl)
   66DB 15            [ 4] 1343 	dec	d
   66DC 15            [ 4] 1344 	dec	d
   66DD 0A            [ 7] 1345 	ld	a,(bc)
   66DE C6 02         [ 7] 1346 	add	a, #0x02
   66E0 C5            [11] 1347 	push	bc
   66E1 D5            [11] 1348 	push	de
   66E2 33            [ 6] 1349 	inc	sp
   66E3 F5            [11] 1350 	push	af
   66E4 33            [ 6] 1351 	inc	sp
   66E5 2A 26 60      [16] 1352 	ld	hl,(_mapa)
   66E8 E5            [11] 1353 	push	hl
   66E9 CD 96 49      [17] 1354 	call	_getTilePtr
   66EC F1            [10] 1355 	pop	af
   66ED F1            [10] 1356 	pop	af
   66EE C1            [10] 1357 	pop	bc
   66EF 5E            [ 7] 1358 	ld	e,(hl)
   66F0 3E 02         [ 7] 1359 	ld	a,#0x02
   66F2 93            [ 4] 1360 	sub	a, e
   66F3 DA 95 67      [10] 1361 	jp	C,00145$
                           1362 ;src/main.c:290: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   66F6 DD 6E F8      [19] 1363 	ld	l,-8 (ix)
   66F9 DD 66 F9      [19] 1364 	ld	h,-7 (ix)
   66FC 56            [ 7] 1365 	ld	d,(hl)
   66FD 15            [ 4] 1366 	dec	d
   66FE 15            [ 4] 1367 	dec	d
   66FF 0A            [ 7] 1368 	ld	a,(bc)
   6700 C6 04         [ 7] 1369 	add	a, #0x04
   6702 C5            [11] 1370 	push	bc
   6703 D5            [11] 1371 	push	de
   6704 33            [ 6] 1372 	inc	sp
   6705 F5            [11] 1373 	push	af
   6706 33            [ 6] 1374 	inc	sp
   6707 2A 26 60      [16] 1375 	ld	hl,(_mapa)
   670A E5            [11] 1376 	push	hl
   670B CD 96 49      [17] 1377 	call	_getTilePtr
   670E F1            [10] 1378 	pop	af
   670F F1            [10] 1379 	pop	af
   6710 C1            [10] 1380 	pop	bc
   6711 5E            [ 7] 1381 	ld	e,(hl)
   6712 3E 02         [ 7] 1382 	ld	a,#0x02
   6714 93            [ 4] 1383 	sub	a, e
   6715 DA 95 67      [10] 1384 	jp	C,00145$
                           1385 ;src/main.c:292: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   6718 21 52 5F      [10] 1386 	ld	hl, #_cu + 0
   671B 5E            [ 7] 1387 	ld	e,(hl)
   671C 16 00         [ 7] 1388 	ld	d,#0x00
   671E 21 02 00      [10] 1389 	ld	hl,#0x0002
   6721 19            [11] 1390 	add	hl,de
   6722 DD 75 FE      [19] 1391 	ld	-2 (ix),l
   6725 DD 74 FF      [19] 1392 	ld	-1 (ix),h
   6728 0A            [ 7] 1393 	ld	a,(bc)
   6729 6F            [ 4] 1394 	ld	l,a
   672A 26 00         [ 7] 1395 	ld	h,#0x00
   672C DD 7E FE      [19] 1396 	ld	a,-2 (ix)
   672F 95            [ 4] 1397 	sub	a, l
   6730 DD 7E FF      [19] 1398 	ld	a,-1 (ix)
   6733 9C            [ 4] 1399 	sbc	a, h
   6734 E2 39 67      [10] 1400 	jp	PO, 00275$
   6737 EE 80         [ 7] 1401 	xor	a, #0x80
   6739                    1402 00275$:
   6739 FA 4C 67      [10] 1403 	jp	M,00140$
   673C 23            [ 6] 1404 	inc	hl
   673D 23            [ 6] 1405 	inc	hl
   673E 23            [ 6] 1406 	inc	hl
   673F 23            [ 6] 1407 	inc	hl
   6740 7D            [ 4] 1408 	ld	a,l
   6741 93            [ 4] 1409 	sub	a, e
   6742 7C            [ 4] 1410 	ld	a,h
   6743 9A            [ 4] 1411 	sbc	a, d
   6744 E2 49 67      [10] 1412 	jp	PO, 00276$
   6747 EE 80         [ 7] 1413 	xor	a, #0x80
   6749                    1414 00276$:
   6749 F2 52 67      [10] 1415 	jp	P,00141$
   674C                    1416 00140$:
                           1417 ;src/main.c:294: colisiona = 0;
   674C DD 36 F7 00   [19] 1418 	ld	-9 (ix),#0x00
   6750 18 4B         [12] 1419 	jr	00149$
   6752                    1420 00141$:
                           1421 ;src/main.c:297: if(enemy->y>cu.y){
   6752 DD 6E F8      [19] 1422 	ld	l,-8 (ix)
   6755 DD 66 F9      [19] 1423 	ld	h,-7 (ix)
   6758 5E            [ 7] 1424 	ld	e,(hl)
   6759 21 53 5F      [10] 1425 	ld	hl, #(_cu + 0x0001) + 0
   675C 6E            [ 7] 1426 	ld	l,(hl)
   675D 7D            [ 4] 1427 	ld	a,l
   675E 93            [ 4] 1428 	sub	a, e
   675F 30 2E         [12] 1429 	jr	NC,00138$
                           1430 ;src/main.c:298: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   6761 16 00         [ 7] 1431 	ld	d,#0x00
   6763 26 00         [ 7] 1432 	ld	h,#0x00
   6765 D5            [11] 1433 	push	de
   6766 11 08 00      [10] 1434 	ld	de,#0x0008
   6769 19            [11] 1435 	add	hl, de
   676A D1            [10] 1436 	pop	de
   676B 7B            [ 4] 1437 	ld	a,e
   676C 95            [ 4] 1438 	sub	a, l
   676D 5F            [ 4] 1439 	ld	e,a
   676E 7A            [ 4] 1440 	ld	a,d
   676F 9C            [ 4] 1441 	sbc	a, h
   6770 57            [ 4] 1442 	ld	d,a
   6771 3E 02         [ 7] 1443 	ld	a,#0x02
   6773 BB            [ 4] 1444 	cp	a, e
   6774 3E 00         [ 7] 1445 	ld	a,#0x00
   6776 9A            [ 4] 1446 	sbc	a, d
   6777 E2 7C 67      [10] 1447 	jp	PO, 00277$
   677A EE 80         [ 7] 1448 	xor	a, #0x80
   677C                    1449 00277$:
   677C F2 85 67      [10] 1450 	jp	P,00135$
                           1451 ;src/main.c:299: colisiona = 0;
   677F DD 36 F7 00   [19] 1452 	ld	-9 (ix),#0x00
   6783 18 18         [12] 1453 	jr	00149$
   6785                    1454 00135$:
                           1455 ;src/main.c:302: enemy->muerto = SI;
   6785 DD 6E FA      [19] 1456 	ld	l,-6 (ix)
   6788 DD 66 FB      [19] 1457 	ld	h,-5 (ix)
   678B 36 01         [10] 1458 	ld	(hl),#0x01
   678D 18 0E         [12] 1459 	jr	00149$
   678F                    1460 00138$:
                           1461 ;src/main.c:306: colisiona = 0;
   678F DD 36 F7 00   [19] 1462 	ld	-9 (ix),#0x00
   6793 18 08         [12] 1463 	jr	00149$
   6795                    1464 00145$:
                           1465 ;src/main.c:312: enemy->mira = M_abajo;
   6795 DD 6E FC      [19] 1466 	ld	l,-4 (ix)
   6798 DD 66 FD      [19] 1467 	ld	h,-3 (ix)
   679B 36 03         [10] 1468 	ld	(hl),#0x03
                           1469 ;src/main.c:315: case 3:
   679D                    1470 00149$:
                           1471 ;src/main.c:318: if( *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   679D DD 6E F8      [19] 1472 	ld	l,-8 (ix)
   67A0 DD 66 F9      [19] 1473 	ld	h,-7 (ix)
   67A3 7E            [ 7] 1474 	ld	a,(hl)
   67A4 C6 18         [ 7] 1475 	add	a, #0x18
   67A6 57            [ 4] 1476 	ld	d,a
   67A7 0A            [ 7] 1477 	ld	a,(bc)
   67A8 C5            [11] 1478 	push	bc
   67A9 D5            [11] 1479 	push	de
   67AA 33            [ 6] 1480 	inc	sp
   67AB F5            [11] 1481 	push	af
   67AC 33            [ 6] 1482 	inc	sp
   67AD 2A 26 60      [16] 1483 	ld	hl,(_mapa)
   67B0 E5            [11] 1484 	push	hl
   67B1 CD 96 49      [17] 1485 	call	_getTilePtr
   67B4 F1            [10] 1486 	pop	af
   67B5 F1            [10] 1487 	pop	af
   67B6 C1            [10] 1488 	pop	bc
   67B7 5E            [ 7] 1489 	ld	e,(hl)
   67B8 3E 02         [ 7] 1490 	ld	a,#0x02
   67BA 93            [ 4] 1491 	sub	a, e
   67BB DA 7E 68      [10] 1492 	jp	C,00161$
                           1493 ;src/main.c:319: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   67BE DD 6E F8      [19] 1494 	ld	l,-8 (ix)
   67C1 DD 66 F9      [19] 1495 	ld	h,-7 (ix)
   67C4 7E            [ 7] 1496 	ld	a,(hl)
   67C5 C6 18         [ 7] 1497 	add	a, #0x18
   67C7 57            [ 4] 1498 	ld	d,a
   67C8 0A            [ 7] 1499 	ld	a,(bc)
   67C9 C6 02         [ 7] 1500 	add	a, #0x02
   67CB C5            [11] 1501 	push	bc
   67CC D5            [11] 1502 	push	de
   67CD 33            [ 6] 1503 	inc	sp
   67CE F5            [11] 1504 	push	af
   67CF 33            [ 6] 1505 	inc	sp
   67D0 2A 26 60      [16] 1506 	ld	hl,(_mapa)
   67D3 E5            [11] 1507 	push	hl
   67D4 CD 96 49      [17] 1508 	call	_getTilePtr
   67D7 F1            [10] 1509 	pop	af
   67D8 F1            [10] 1510 	pop	af
   67D9 C1            [10] 1511 	pop	bc
   67DA 5E            [ 7] 1512 	ld	e,(hl)
   67DB 3E 02         [ 7] 1513 	ld	a,#0x02
   67DD 93            [ 4] 1514 	sub	a, e
   67DE DA 7E 68      [10] 1515 	jp	C,00161$
                           1516 ;src/main.c:320: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   67E1 DD 6E F8      [19] 1517 	ld	l,-8 (ix)
   67E4 DD 66 F9      [19] 1518 	ld	h,-7 (ix)
   67E7 7E            [ 7] 1519 	ld	a,(hl)
   67E8 C6 18         [ 7] 1520 	add	a, #0x18
   67EA 57            [ 4] 1521 	ld	d,a
   67EB 0A            [ 7] 1522 	ld	a,(bc)
   67EC C6 04         [ 7] 1523 	add	a, #0x04
   67EE C5            [11] 1524 	push	bc
   67EF D5            [11] 1525 	push	de
   67F0 33            [ 6] 1526 	inc	sp
   67F1 F5            [11] 1527 	push	af
   67F2 33            [ 6] 1528 	inc	sp
   67F3 2A 26 60      [16] 1529 	ld	hl,(_mapa)
   67F6 E5            [11] 1530 	push	hl
   67F7 CD 96 49      [17] 1531 	call	_getTilePtr
   67FA F1            [10] 1532 	pop	af
   67FB F1            [10] 1533 	pop	af
   67FC C1            [10] 1534 	pop	bc
   67FD 5E            [ 7] 1535 	ld	e,(hl)
   67FE 3E 02         [ 7] 1536 	ld	a,#0x02
   6800 93            [ 4] 1537 	sub	a, e
   6801 38 7B         [12] 1538 	jr	C,00161$
                           1539 ;src/main.c:322: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   6803 21 52 5F      [10] 1540 	ld	hl, #_cu + 0
   6806 5E            [ 7] 1541 	ld	e,(hl)
   6807 16 00         [ 7] 1542 	ld	d,#0x00
   6809 21 02 00      [10] 1543 	ld	hl,#0x0002
   680C 19            [11] 1544 	add	hl,de
   680D DD 75 FE      [19] 1545 	ld	-2 (ix),l
   6810 DD 74 FF      [19] 1546 	ld	-1 (ix),h
   6813 0A            [ 7] 1547 	ld	a,(bc)
   6814 4F            [ 4] 1548 	ld	c,a
   6815 06 00         [ 7] 1549 	ld	b,#0x00
   6817 DD 7E FE      [19] 1550 	ld	a,-2 (ix)
   681A 91            [ 4] 1551 	sub	a, c
   681B DD 7E FF      [19] 1552 	ld	a,-1 (ix)
   681E 98            [ 4] 1553 	sbc	a, b
   681F E2 24 68      [10] 1554 	jp	PO, 00278$
   6822 EE 80         [ 7] 1555 	xor	a, #0x80
   6824                    1556 00278$:
   6824 FA 37 68      [10] 1557 	jp	M,00156$
   6827 03            [ 6] 1558 	inc	bc
   6828 03            [ 6] 1559 	inc	bc
   6829 03            [ 6] 1560 	inc	bc
   682A 03            [ 6] 1561 	inc	bc
   682B 79            [ 4] 1562 	ld	a,c
   682C 93            [ 4] 1563 	sub	a, e
   682D 78            [ 4] 1564 	ld	a,b
   682E 9A            [ 4] 1565 	sbc	a, d
   682F E2 34 68      [10] 1566 	jp	PO, 00279$
   6832 EE 80         [ 7] 1567 	xor	a, #0x80
   6834                    1568 00279$:
   6834 F2 3D 68      [10] 1569 	jp	P,00157$
   6837                    1570 00156$:
                           1571 ;src/main.c:323: colisiona = 0;
   6837 DD 36 F7 00   [19] 1572 	ld	-9 (ix),#0x00
   683B 18 49         [12] 1573 	jr	00165$
   683D                    1574 00157$:
                           1575 ;src/main.c:326: if(cu.y > enemy->y){ //si el cu esta abajo
   683D 21 53 5F      [10] 1576 	ld	hl, #(_cu + 0x0001) + 0
   6840 4E            [ 7] 1577 	ld	c,(hl)
   6841 DD 6E F8      [19] 1578 	ld	l,-8 (ix)
   6844 DD 66 F9      [19] 1579 	ld	h,-7 (ix)
   6847 5E            [ 7] 1580 	ld	e,(hl)
   6848 7B            [ 4] 1581 	ld	a,e
   6849 91            [ 4] 1582 	sub	a, c
   684A 30 2C         [12] 1583 	jr	NC,00154$
                           1584 ;src/main.c:327: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   684C 06 00         [ 7] 1585 	ld	b,#0x00
   684E 16 00         [ 7] 1586 	ld	d,#0x00
   6850 21 16 00      [10] 1587 	ld	hl,#0x0016
   6853 19            [11] 1588 	add	hl,de
   6854 79            [ 4] 1589 	ld	a,c
   6855 95            [ 4] 1590 	sub	a, l
   6856 4F            [ 4] 1591 	ld	c,a
   6857 78            [ 4] 1592 	ld	a,b
   6858 9C            [ 4] 1593 	sbc	a, h
   6859 47            [ 4] 1594 	ld	b,a
   685A 3E 02         [ 7] 1595 	ld	a,#0x02
   685C B9            [ 4] 1596 	cp	a, c
   685D 3E 00         [ 7] 1597 	ld	a,#0x00
   685F 98            [ 4] 1598 	sbc	a, b
   6860 E2 65 68      [10] 1599 	jp	PO, 00280$
   6863 EE 80         [ 7] 1600 	xor	a, #0x80
   6865                    1601 00280$:
   6865 F2 6E 68      [10] 1602 	jp	P,00151$
                           1603 ;src/main.c:328: colisiona = 0;
   6868 DD 36 F7 00   [19] 1604 	ld	-9 (ix),#0x00
   686C 18 18         [12] 1605 	jr	00165$
   686E                    1606 00151$:
                           1607 ;src/main.c:331: enemy->muerto = SI;
   686E DD 6E FA      [19] 1608 	ld	l,-6 (ix)
   6871 DD 66 FB      [19] 1609 	ld	h,-5 (ix)
   6874 36 01         [10] 1610 	ld	(hl),#0x01
   6876 18 0E         [12] 1611 	jr	00165$
   6878                    1612 00154$:
                           1613 ;src/main.c:335: colisiona = 0;
   6878 DD 36 F7 00   [19] 1614 	ld	-9 (ix),#0x00
   687C 18 08         [12] 1615 	jr	00165$
   687E                    1616 00161$:
                           1617 ;src/main.c:339: enemy->mira = M_arriba;
   687E DD 6E FC      [19] 1618 	ld	l,-4 (ix)
   6881 DD 66 FD      [19] 1619 	ld	h,-3 (ix)
   6884 36 02         [10] 1620 	ld	(hl),#0x02
                           1621 ;src/main.c:342: }
   6886                    1622 00165$:
                           1623 ;src/main.c:343: return colisiona;
   6886 DD 6E F7      [19] 1624 	ld	l,-9 (ix)
   6889 DD F9         [10] 1625 	ld	sp, ix
   688B DD E1         [14] 1626 	pop	ix
   688D C9            [10] 1627 	ret
                           1628 ;src/main.c:346: void moverEnemigoArriba(TEnemy *enemy){
                           1629 ;	---------------------------------
                           1630 ; Function moverEnemigoArriba
                           1631 ; ---------------------------------
   688E                    1632 _moverEnemigoArriba::
   688E DD E5         [15] 1633 	push	ix
   6890 DD 21 00 00   [14] 1634 	ld	ix,#0
   6894 DD 39         [15] 1635 	add	ix,sp
                           1636 ;src/main.c:347: enemy->y--;
   6896 DD 4E 04      [19] 1637 	ld	c,4 (ix)
   6899 DD 46 05      [19] 1638 	ld	b,5 (ix)
   689C 69            [ 4] 1639 	ld	l, c
   689D 60            [ 4] 1640 	ld	h, b
   689E 23            [ 6] 1641 	inc	hl
   689F 5E            [ 7] 1642 	ld	e,(hl)
   68A0 1D            [ 4] 1643 	dec	e
   68A1 73            [ 7] 1644 	ld	(hl),e
                           1645 ;src/main.c:348: enemy->y--;
   68A2 1D            [ 4] 1646 	dec	e
   68A3 73            [ 7] 1647 	ld	(hl),e
                           1648 ;src/main.c:349: enemy->mover = SI;
   68A4 21 06 00      [10] 1649 	ld	hl,#0x0006
   68A7 09            [11] 1650 	add	hl,bc
   68A8 36 01         [10] 1651 	ld	(hl),#0x01
   68AA DD E1         [14] 1652 	pop	ix
   68AC C9            [10] 1653 	ret
                           1654 ;src/main.c:352: void moverEnemigoAbajo(TEnemy *enemy){
                           1655 ;	---------------------------------
                           1656 ; Function moverEnemigoAbajo
                           1657 ; ---------------------------------
   68AD                    1658 _moverEnemigoAbajo::
   68AD DD E5         [15] 1659 	push	ix
   68AF DD 21 00 00   [14] 1660 	ld	ix,#0
   68B3 DD 39         [15] 1661 	add	ix,sp
                           1662 ;src/main.c:353: enemy->y++;
   68B5 DD 4E 04      [19] 1663 	ld	c,4 (ix)
   68B8 DD 46 05      [19] 1664 	ld	b,5 (ix)
   68BB 59            [ 4] 1665 	ld	e, c
   68BC 50            [ 4] 1666 	ld	d, b
   68BD 13            [ 6] 1667 	inc	de
   68BE 1A            [ 7] 1668 	ld	a,(de)
   68BF 3C            [ 4] 1669 	inc	a
   68C0 12            [ 7] 1670 	ld	(de),a
                           1671 ;src/main.c:354: enemy->y++;
   68C1 3C            [ 4] 1672 	inc	a
   68C2 12            [ 7] 1673 	ld	(de),a
                           1674 ;src/main.c:355: enemy->mover = SI;
   68C3 21 06 00      [10] 1675 	ld	hl,#0x0006
   68C6 09            [11] 1676 	add	hl,bc
   68C7 36 01         [10] 1677 	ld	(hl),#0x01
   68C9 DD E1         [14] 1678 	pop	ix
   68CB C9            [10] 1679 	ret
                           1680 ;src/main.c:358: void moverEnemigoDerecha(TEnemy *enemy){
                           1681 ;	---------------------------------
                           1682 ; Function moverEnemigoDerecha
                           1683 ; ---------------------------------
   68CC                    1684 _moverEnemigoDerecha::
                           1685 ;src/main.c:359: enemy->x++;
   68CC D1            [10] 1686 	pop	de
   68CD C1            [10] 1687 	pop	bc
   68CE C5            [11] 1688 	push	bc
   68CF D5            [11] 1689 	push	de
   68D0 0A            [ 7] 1690 	ld	a,(bc)
   68D1 3C            [ 4] 1691 	inc	a
   68D2 02            [ 7] 1692 	ld	(bc),a
                           1693 ;src/main.c:360: enemy->x++;
   68D3 3C            [ 4] 1694 	inc	a
   68D4 02            [ 7] 1695 	ld	(bc),a
                           1696 ;src/main.c:361: enemy->mover = SI;
   68D5 21 06 00      [10] 1697 	ld	hl,#0x0006
   68D8 09            [11] 1698 	add	hl,bc
   68D9 36 01         [10] 1699 	ld	(hl),#0x01
   68DB C9            [10] 1700 	ret
                           1701 ;src/main.c:364: void moverEnemigoIzquierda(TEnemy *enemy){
                           1702 ;	---------------------------------
                           1703 ; Function moverEnemigoIzquierda
                           1704 ; ---------------------------------
   68DC                    1705 _moverEnemigoIzquierda::
                           1706 ;src/main.c:365: enemy->x--;
   68DC D1            [10] 1707 	pop	de
   68DD C1            [10] 1708 	pop	bc
   68DE C5            [11] 1709 	push	bc
   68DF D5            [11] 1710 	push	de
   68E0 0A            [ 7] 1711 	ld	a,(bc)
   68E1 C6 FF         [ 7] 1712 	add	a,#0xFF
   68E3 02            [ 7] 1713 	ld	(bc),a
                           1714 ;src/main.c:366: enemy->x--;
   68E4 C6 FF         [ 7] 1715 	add	a,#0xFF
   68E6 02            [ 7] 1716 	ld	(bc),a
                           1717 ;src/main.c:367: enemy->mover = SI;
   68E7 21 06 00      [10] 1718 	ld	hl,#0x0006
   68EA 09            [11] 1719 	add	hl,bc
   68EB 36 01         [10] 1720 	ld	(hl),#0x01
   68ED C9            [10] 1721 	ret
                           1722 ;src/main.c:370: void moverEnemigoPatrol(TEnemy *enemy){
                           1723 ;	---------------------------------
                           1724 ; Function moverEnemigoPatrol
                           1725 ; ---------------------------------
   68EE                    1726 _moverEnemigoPatrol::
   68EE DD E5         [15] 1727 	push	ix
   68F0 DD 21 00 00   [14] 1728 	ld	ix,#0
   68F4 DD 39         [15] 1729 	add	ix,sp
   68F6 21 F5 FF      [10] 1730 	ld	hl,#-11
   68F9 39            [11] 1731 	add	hl,sp
   68FA F9            [ 6] 1732 	ld	sp,hl
                           1733 ;src/main.c:371: if(!enemy->muerto){
   68FB DD 4E 04      [19] 1734 	ld	c,4 (ix)
   68FE DD 46 05      [19] 1735 	ld	b,5 (ix)
   6901 C5            [11] 1736 	push	bc
   6902 FD E1         [14] 1737 	pop	iy
   6904 FD 7E 08      [19] 1738 	ld	a,8 (iy)
   6907 B7            [ 4] 1739 	or	a, a
   6908 C2 F7 6A      [10] 1740 	jp	NZ,00118$
                           1741 ;src/main.c:373: if (!enemy->reversePatrol) {
   690B 21 0C 00      [10] 1742 	ld	hl,#0x000C
   690E 09            [11] 1743 	add	hl,bc
   690F EB            [ 4] 1744 	ex	de,hl
   6910 1A            [ 7] 1745 	ld	a,(de)
   6911 DD 77 F9      [19] 1746 	ld	-7 (ix),a
                           1747 ;src/main.c:374: if(enemy->iter < enemy->longitud_camino){
   6914 FD 21 0E 00   [14] 1748 	ld	iy,#0x000E
   6918 FD 09         [15] 1749 	add	iy, bc
   691A FD 7E 00      [19] 1750 	ld	a,0 (iy)
   691D DD 77 F5      [19] 1751 	ld	-11 (ix),a
   6920 FD 7E 01      [19] 1752 	ld	a,1 (iy)
   6923 DD 77 F6      [19] 1753 	ld	-10 (ix),a
   6926 21 1B 00      [10] 1754 	ld	hl,#0x001B
   6929 09            [11] 1755 	add	hl,bc
                           1756 ;src/main.c:377: enemy->x = enemy->camino[enemy->iter];
   692A 79            [ 4] 1757 	ld	a,c
   692B C6 19         [ 7] 1758 	add	a, #0x19
   692D DD 77 F7      [19] 1759 	ld	-9 (ix),a
   6930 78            [ 4] 1760 	ld	a,b
   6931 CE 00         [ 7] 1761 	adc	a, #0x00
   6933 DD 77 F8      [19] 1762 	ld	-8 (ix),a
                           1763 ;src/main.c:379: enemy->y = enemy->camino[enemy->iter];
   6936 79            [ 4] 1764 	ld	a,c
   6937 C6 01         [ 7] 1765 	add	a, #0x01
   6939 DD 77 FA      [19] 1766 	ld	-6 (ix),a
   693C 78            [ 4] 1767 	ld	a,b
   693D CE 00         [ 7] 1768 	adc	a, #0x00
   693F DD 77 FB      [19] 1769 	ld	-5 (ix),a
                           1770 ;src/main.c:381: enemy->mover = SI;
   6942 79            [ 4] 1771 	ld	a,c
   6943 C6 06         [ 7] 1772 	add	a, #0x06
   6945 DD 77 FE      [19] 1773 	ld	-2 (ix),a
   6948 78            [ 4] 1774 	ld	a,b
   6949 CE 00         [ 7] 1775 	adc	a, #0x00
   694B DD 77 FF      [19] 1776 	ld	-1 (ix),a
                           1777 ;src/main.c:373: if (!enemy->reversePatrol) {
   694E DD 7E F9      [19] 1778 	ld	a,-7 (ix)
   6951 B7            [ 4] 1779 	or	a, a
   6952 C2 10 6A      [10] 1780 	jp	NZ,00114$
                           1781 ;src/main.c:374: if(enemy->iter < enemy->longitud_camino){
   6955 6E            [ 7] 1782 	ld	l,(hl)
   6956 26 00         [ 7] 1783 	ld	h,#0x00
   6958 DD 7E F5      [19] 1784 	ld	a,-11 (ix)
   695B 95            [ 4] 1785 	sub	a, l
   695C DD 7E F6      [19] 1786 	ld	a,-10 (ix)
   695F 9C            [ 4] 1787 	sbc	a, h
   6960 E2 65 69      [10] 1788 	jp	PO, 00144$
   6963 EE 80         [ 7] 1789 	xor	a, #0x80
   6965                    1790 00144$:
   6965 F2 FC 69      [10] 1791 	jp	P,00105$
                           1792 ;src/main.c:375: if(enemy->iter == 0){
   6968 DD 7E F6      [19] 1793 	ld	a,-10 (ix)
   696B DD B6 F5      [19] 1794 	or	a,-11 (ix)
   696E 20 4C         [12] 1795 	jr	NZ,00102$
                           1796 ;src/main.c:376: enemy->iter = 2;
   6970 FD 36 00 02   [19] 1797 	ld	0 (iy),#0x02
   6974 FD 36 01 00   [19] 1798 	ld	1 (iy),#0x00
                           1799 ;src/main.c:377: enemy->x = enemy->camino[enemy->iter];
   6978 DD 6E F7      [19] 1800 	ld	l,-9 (ix)
   697B DD 66 F8      [19] 1801 	ld	h,-8 (ix)
   697E 5E            [ 7] 1802 	ld	e,(hl)
   697F 23            [ 6] 1803 	inc	hl
   6980 56            [ 7] 1804 	ld	d,(hl)
   6981 FD 6E 00      [19] 1805 	ld	l,0 (iy)
   6984 FD 66 01      [19] 1806 	ld	h,1 (iy)
   6987 19            [11] 1807 	add	hl,de
   6988 7E            [ 7] 1808 	ld	a,(hl)
   6989 02            [ 7] 1809 	ld	(bc),a
                           1810 ;src/main.c:378: ++enemy->iter;
   698A FD 4E 00      [19] 1811 	ld	c,0 (iy)
   698D FD 46 01      [19] 1812 	ld	b,1 (iy)
   6990 03            [ 6] 1813 	inc	bc
   6991 FD 71 00      [19] 1814 	ld	0 (iy),c
   6994 FD 70 01      [19] 1815 	ld	1 (iy),b
                           1816 ;src/main.c:379: enemy->y = enemy->camino[enemy->iter];
   6997 DD 6E F7      [19] 1817 	ld	l,-9 (ix)
   699A DD 66 F8      [19] 1818 	ld	h,-8 (ix)
   699D 7E            [ 7] 1819 	ld	a, (hl)
   699E 23            [ 6] 1820 	inc	hl
   699F 66            [ 7] 1821 	ld	h,(hl)
   69A0 6F            [ 4] 1822 	ld	l,a
   69A1 09            [11] 1823 	add	hl,bc
   69A2 5E            [ 7] 1824 	ld	e,(hl)
   69A3 DD 6E FA      [19] 1825 	ld	l,-6 (ix)
   69A6 DD 66 FB      [19] 1826 	ld	h,-5 (ix)
   69A9 73            [ 7] 1827 	ld	(hl),e
                           1828 ;src/main.c:380: ++enemy->iter;
   69AA 03            [ 6] 1829 	inc	bc
   69AB FD 71 00      [19] 1830 	ld	0 (iy),c
   69AE FD 70 01      [19] 1831 	ld	1 (iy),b
                           1832 ;src/main.c:381: enemy->mover = SI;
   69B1 DD 6E FE      [19] 1833 	ld	l,-2 (ix)
   69B4 DD 66 FF      [19] 1834 	ld	h,-1 (ix)
   69B7 36 01         [10] 1835 	ld	(hl),#0x01
   69B9 C3 F7 6A      [10] 1836 	jp	00118$
   69BC                    1837 00102$:
                           1838 ;src/main.c:383: enemy->x = enemy->camino[enemy->iter];
   69BC DD 6E F7      [19] 1839 	ld	l,-9 (ix)
   69BF DD 66 F8      [19] 1840 	ld	h,-8 (ix)
   69C2 5E            [ 7] 1841 	ld	e,(hl)
   69C3 23            [ 6] 1842 	inc	hl
   69C4 56            [ 7] 1843 	ld	d,(hl)
   69C5 E1            [10] 1844 	pop	hl
   69C6 E5            [11] 1845 	push	hl
   69C7 19            [11] 1846 	add	hl,de
   69C8 7E            [ 7] 1847 	ld	a,(hl)
   69C9 02            [ 7] 1848 	ld	(bc),a
                           1849 ;src/main.c:384: ++enemy->iter;
   69CA FD 4E 00      [19] 1850 	ld	c,0 (iy)
   69CD FD 46 01      [19] 1851 	ld	b,1 (iy)
   69D0 03            [ 6] 1852 	inc	bc
   69D1 FD 71 00      [19] 1853 	ld	0 (iy),c
   69D4 FD 70 01      [19] 1854 	ld	1 (iy),b
                           1855 ;src/main.c:385: enemy->y = enemy->camino[enemy->iter];
   69D7 DD 6E F7      [19] 1856 	ld	l,-9 (ix)
   69DA DD 66 F8      [19] 1857 	ld	h,-8 (ix)
   69DD 7E            [ 7] 1858 	ld	a, (hl)
   69DE 23            [ 6] 1859 	inc	hl
   69DF 66            [ 7] 1860 	ld	h,(hl)
   69E0 6F            [ 4] 1861 	ld	l,a
   69E1 09            [11] 1862 	add	hl,bc
   69E2 5E            [ 7] 1863 	ld	e,(hl)
   69E3 DD 6E FA      [19] 1864 	ld	l,-6 (ix)
   69E6 DD 66 FB      [19] 1865 	ld	h,-5 (ix)
   69E9 73            [ 7] 1866 	ld	(hl),e
                           1867 ;src/main.c:386: ++enemy->iter;
   69EA 03            [ 6] 1868 	inc	bc
   69EB FD 71 00      [19] 1869 	ld	0 (iy),c
   69EE FD 70 01      [19] 1870 	ld	1 (iy),b
                           1871 ;src/main.c:387: enemy->mover = SI;
   69F1 DD 6E FE      [19] 1872 	ld	l,-2 (ix)
   69F4 DD 66 FF      [19] 1873 	ld	h,-1 (ix)
   69F7 36 01         [10] 1874 	ld	(hl),#0x01
   69F9 C3 F7 6A      [10] 1875 	jp	00118$
   69FC                    1876 00105$:
                           1877 ;src/main.c:391: enemy->iter = enemy->longitud_camino;
   69FC FD 75 00      [19] 1878 	ld	0 (iy),l
   69FF FD 74 01      [19] 1879 	ld	1 (iy),h
                           1880 ;src/main.c:395: enemy->reversePatrol = 1;
   6A02 3E 01         [ 7] 1881 	ld	a,#0x01
   6A04 12            [ 7] 1882 	ld	(de),a
                           1883 ;src/main.c:396: enemy->mover = NO;
   6A05 DD 6E FE      [19] 1884 	ld	l,-2 (ix)
   6A08 DD 66 FF      [19] 1885 	ld	h,-1 (ix)
   6A0B 36 00         [10] 1886 	ld	(hl),#0x00
   6A0D C3 F7 6A      [10] 1887 	jp	00118$
   6A10                    1888 00114$:
                           1889 ;src/main.c:400: if(enemy->iter > 0){
   6A10 AF            [ 4] 1890 	xor	a, a
   6A11 DD BE F5      [19] 1891 	cp	a, -11 (ix)
   6A14 DD 9E F6      [19] 1892 	sbc	a, -10 (ix)
   6A17 E2 1C 6A      [10] 1893 	jp	PO, 00145$
   6A1A EE 80         [ 7] 1894 	xor	a, #0x80
   6A1C                    1895 00145$:
   6A1C F2 E5 6A      [10] 1896 	jp	P,00111$
                           1897 ;src/main.c:401: if(enemy->iter == enemy->longitud_camino){
   6A1F 5E            [ 7] 1898 	ld	e,(hl)
   6A20 16 00         [ 7] 1899 	ld	d,#0x00
   6A22 DD 7E F5      [19] 1900 	ld	a,-11 (ix)
   6A25 93            [ 4] 1901 	sub	a, e
   6A26 C2 A6 6A      [10] 1902 	jp	NZ,00108$
   6A29 DD 7E F6      [19] 1903 	ld	a,-10 (ix)
   6A2C 92            [ 4] 1904 	sub	a, d
   6A2D 20 77         [12] 1905 	jr	NZ,00108$
                           1906 ;src/main.c:402: enemy->iter = enemy->iter - 1;
   6A2F DD 7E F5      [19] 1907 	ld	a,-11 (ix)
   6A32 C6 FF         [ 7] 1908 	add	a,#0xFF
   6A34 DD 77 FC      [19] 1909 	ld	-4 (ix),a
   6A37 DD 7E F6      [19] 1910 	ld	a,-10 (ix)
   6A3A CE FF         [ 7] 1911 	adc	a,#0xFF
   6A3C DD 77 FD      [19] 1912 	ld	-3 (ix),a
   6A3F DD 7E FC      [19] 1913 	ld	a,-4 (ix)
   6A42 FD 77 00      [19] 1914 	ld	0 (iy),a
   6A45 DD 7E FD      [19] 1915 	ld	a,-3 (ix)
   6A48 FD 77 01      [19] 1916 	ld	1 (iy),a
                           1917 ;src/main.c:403: enemy->iter = enemy->iter - 2;
   6A4B DD 5E FC      [19] 1918 	ld	e,-4 (ix)
   6A4E DD 56 FD      [19] 1919 	ld	d,-3 (ix)
   6A51 1B            [ 6] 1920 	dec	de
   6A52 1B            [ 6] 1921 	dec	de
   6A53 FD 73 00      [19] 1922 	ld	0 (iy),e
   6A56 FD 72 01      [19] 1923 	ld	1 (iy),d
                           1924 ;src/main.c:404: enemy->y = enemy->camino[enemy->iter];
   6A59 DD 6E F7      [19] 1925 	ld	l,-9 (ix)
   6A5C DD 66 F8      [19] 1926 	ld	h,-8 (ix)
   6A5F 7E            [ 7] 1927 	ld	a, (hl)
   6A60 23            [ 6] 1928 	inc	hl
   6A61 66            [ 7] 1929 	ld	h,(hl)
   6A62 6F            [ 4] 1930 	ld	l,a
   6A63 19            [11] 1931 	add	hl,de
   6A64 5E            [ 7] 1932 	ld	e,(hl)
   6A65 DD 6E FA      [19] 1933 	ld	l,-6 (ix)
   6A68 DD 66 FB      [19] 1934 	ld	h,-5 (ix)
   6A6B 73            [ 7] 1935 	ld	(hl),e
                           1936 ;src/main.c:405: --enemy->iter;
   6A6C DD 7E FC      [19] 1937 	ld	a,-4 (ix)
   6A6F C6 FD         [ 7] 1938 	add	a,#0xFD
   6A71 5F            [ 4] 1939 	ld	e,a
   6A72 DD 7E FD      [19] 1940 	ld	a,-3 (ix)
   6A75 CE FF         [ 7] 1941 	adc	a,#0xFF
   6A77 57            [ 4] 1942 	ld	d,a
   6A78 FD 73 00      [19] 1943 	ld	0 (iy),e
   6A7B FD 72 01      [19] 1944 	ld	1 (iy),d
                           1945 ;src/main.c:406: enemy->x = enemy->camino[enemy->iter];
   6A7E DD 6E F7      [19] 1946 	ld	l,-9 (ix)
   6A81 DD 66 F8      [19] 1947 	ld	h,-8 (ix)
   6A84 7E            [ 7] 1948 	ld	a, (hl)
   6A85 23            [ 6] 1949 	inc	hl
   6A86 66            [ 7] 1950 	ld	h,(hl)
   6A87 6F            [ 4] 1951 	ld	l,a
   6A88 19            [11] 1952 	add	hl,de
   6A89 7E            [ 7] 1953 	ld	a,(hl)
   6A8A 02            [ 7] 1954 	ld	(bc),a
                           1955 ;src/main.c:407: --enemy->iter;
   6A8B DD 7E FC      [19] 1956 	ld	a,-4 (ix)
   6A8E C6 FC         [ 7] 1957 	add	a,#0xFC
   6A90 4F            [ 4] 1958 	ld	c,a
   6A91 DD 7E FD      [19] 1959 	ld	a,-3 (ix)
   6A94 CE FF         [ 7] 1960 	adc	a,#0xFF
   6A96 FD 71 00      [19] 1961 	ld	0 (iy), c
   6A99 FD 77 01      [19] 1962 	ld	1 (iy), a
                           1963 ;src/main.c:408: enemy->mover = SI;
   6A9C DD 6E FE      [19] 1964 	ld	l,-2 (ix)
   6A9F DD 66 FF      [19] 1965 	ld	h,-1 (ix)
   6AA2 36 01         [10] 1966 	ld	(hl),#0x01
   6AA4 18 51         [12] 1967 	jr	00118$
   6AA6                    1968 00108$:
                           1969 ;src/main.c:410: enemy->y = enemy->camino[enemy->iter];
   6AA6 DD 6E F7      [19] 1970 	ld	l,-9 (ix)
   6AA9 DD 66 F8      [19] 1971 	ld	h,-8 (ix)
   6AAC 5E            [ 7] 1972 	ld	e,(hl)
   6AAD 23            [ 6] 1973 	inc	hl
   6AAE 56            [ 7] 1974 	ld	d,(hl)
   6AAF E1            [10] 1975 	pop	hl
   6AB0 E5            [11] 1976 	push	hl
   6AB1 19            [11] 1977 	add	hl,de
   6AB2 5E            [ 7] 1978 	ld	e,(hl)
   6AB3 DD 6E FA      [19] 1979 	ld	l,-6 (ix)
   6AB6 DD 66 FB      [19] 1980 	ld	h,-5 (ix)
   6AB9 73            [ 7] 1981 	ld	(hl),e
                           1982 ;src/main.c:411: --enemy->iter;
   6ABA FD 5E 00      [19] 1983 	ld	e,0 (iy)
   6ABD FD 56 01      [19] 1984 	ld	d,1 (iy)
   6AC0 1B            [ 6] 1985 	dec	de
   6AC1 FD 73 00      [19] 1986 	ld	0 (iy),e
   6AC4 FD 72 01      [19] 1987 	ld	1 (iy),d
                           1988 ;src/main.c:412: enemy->x = enemy->camino[enemy->iter];
   6AC7 DD 6E F7      [19] 1989 	ld	l,-9 (ix)
   6ACA DD 66 F8      [19] 1990 	ld	h,-8 (ix)
   6ACD 7E            [ 7] 1991 	ld	a, (hl)
   6ACE 23            [ 6] 1992 	inc	hl
   6ACF 66            [ 7] 1993 	ld	h,(hl)
   6AD0 6F            [ 4] 1994 	ld	l,a
   6AD1 19            [11] 1995 	add	hl,de
   6AD2 7E            [ 7] 1996 	ld	a,(hl)
   6AD3 02            [ 7] 1997 	ld	(bc),a
                           1998 ;src/main.c:413: --enemy->iter;
   6AD4 1B            [ 6] 1999 	dec	de
   6AD5 FD 73 00      [19] 2000 	ld	0 (iy),e
   6AD8 FD 72 01      [19] 2001 	ld	1 (iy),d
                           2002 ;src/main.c:414: enemy->mover = SI;
   6ADB DD 6E FE      [19] 2003 	ld	l,-2 (ix)
   6ADE DD 66 FF      [19] 2004 	ld	h,-1 (ix)
   6AE1 36 01         [10] 2005 	ld	(hl),#0x01
   6AE3 18 12         [12] 2006 	jr	00118$
   6AE5                    2007 00111$:
                           2008 ;src/main.c:418: enemy->iter = 0;
   6AE5 FD 36 00 00   [19] 2009 	ld	0 (iy),#0x00
   6AE9 FD 36 01 00   [19] 2010 	ld	1 (iy),#0x00
                           2011 ;src/main.c:420: enemy->reversePatrol = 0;
   6AED AF            [ 4] 2012 	xor	a, a
   6AEE 12            [ 7] 2013 	ld	(de),a
                           2014 ;src/main.c:421: enemy->mover = NO;
   6AEF DD 6E FE      [19] 2015 	ld	l,-2 (ix)
   6AF2 DD 66 FF      [19] 2016 	ld	h,-1 (ix)
   6AF5 36 00         [10] 2017 	ld	(hl),#0x00
   6AF7                    2018 00118$:
   6AF7 DD F9         [10] 2019 	ld	sp, ix
   6AF9 DD E1         [14] 2020 	pop	ix
   6AFB C9            [10] 2021 	ret
                           2022 ;src/main.c:427: void moverEnemigoSeek(TEnemy* enemy){
                           2023 ;	---------------------------------
                           2024 ; Function moverEnemigoSeek
                           2025 ; ---------------------------------
   6AFC                    2026 _moverEnemigoSeek::
   6AFC DD E5         [15] 2027 	push	ix
   6AFE DD 21 00 00   [14] 2028 	ld	ix,#0
   6B02 DD 39         [15] 2029 	add	ix,sp
   6B04 F5            [11] 2030 	push	af
   6B05 F5            [11] 2031 	push	af
                           2032 ;src/main.c:428: if(!enemy->muerto){
   6B06 DD 4E 04      [19] 2033 	ld	c,4 (ix)
   6B09 DD 46 05      [19] 2034 	ld	b,5 (ix)
   6B0C C5            [11] 2035 	push	bc
   6B0D FD E1         [14] 2036 	pop	iy
   6B0F FD 7E 08      [19] 2037 	ld	a,8 (iy)
   6B12 B7            [ 4] 2038 	or	a, a
   6B13 C2 04 6C      [10] 2039 	jp	NZ,00108$
                           2040 ;src/main.c:430: if (!enemy->reversePatrol) {
   6B16 21 0C 00      [10] 2041 	ld	hl,#0x000C
   6B19 09            [11] 2042 	add	hl,bc
   6B1A EB            [ 4] 2043 	ex	de,hl
   6B1B 1A            [ 7] 2044 	ld	a,(de)
   6B1C B7            [ 4] 2045 	or	a, a
   6B1D C2 04 6C      [10] 2046 	jp	NZ,00108$
                           2047 ;src/main.c:431: if(enemy->iter < enemy->longitud_camino - 8){
   6B20 FD 21 0E 00   [14] 2048 	ld	iy,#0x000E
   6B24 FD 09         [15] 2049 	add	iy, bc
   6B26 FD 7E 00      [19] 2050 	ld	a,0 (iy)
   6B29 DD 77 FE      [19] 2051 	ld	-2 (ix),a
   6B2C FD 7E 01      [19] 2052 	ld	a,1 (iy)
   6B2F DD 77 FF      [19] 2053 	ld	-1 (ix),a
   6B32 69            [ 4] 2054 	ld	l, c
   6B33 60            [ 4] 2055 	ld	h, b
   6B34 C5            [11] 2056 	push	bc
   6B35 01 1B 00      [10] 2057 	ld	bc, #0x001B
   6B38 09            [11] 2058 	add	hl, bc
   6B39 C1            [10] 2059 	pop	bc
   6B3A 6E            [ 7] 2060 	ld	l,(hl)
   6B3B 26 00         [ 7] 2061 	ld	h,#0x00
   6B3D 7D            [ 4] 2062 	ld	a,l
   6B3E C6 F8         [ 7] 2063 	add	a,#0xF8
   6B40 6F            [ 4] 2064 	ld	l,a
   6B41 7C            [ 4] 2065 	ld	a,h
   6B42 CE FF         [ 7] 2066 	adc	a,#0xFF
   6B44 67            [ 4] 2067 	ld	h,a
                           2068 ;src/main.c:434: enemy->y = enemy->camino[enemy->iter];
   6B45 79            [ 4] 2069 	ld	a,c
   6B46 C6 01         [ 7] 2070 	add	a, #0x01
   6B48 DD 77 FC      [19] 2071 	ld	-4 (ix),a
   6B4B 78            [ 4] 2072 	ld	a,b
   6B4C CE 00         [ 7] 2073 	adc	a, #0x00
   6B4E DD 77 FD      [19] 2074 	ld	-3 (ix),a
                           2075 ;src/main.c:431: if(enemy->iter < enemy->longitud_camino - 8){
   6B51 DD 7E FE      [19] 2076 	ld	a,-2 (ix)
   6B54 95            [ 4] 2077 	sub	a, l
   6B55 DD 7E FF      [19] 2078 	ld	a,-1 (ix)
   6B58 9C            [ 4] 2079 	sbc	a, h
   6B59 E2 5E 6B      [10] 2080 	jp	PO, 00122$
   6B5C EE 80         [ 7] 2081 	xor	a, #0x80
   6B5E                    2082 00122$:
   6B5E F2 B4 6B      [10] 2083 	jp	P,00102$
                           2084 ;src/main.c:432: enemy->x = enemy->camino[enemy->iter];
   6B61 21 19 00      [10] 2085 	ld	hl,#0x0019
   6B64 09            [11] 2086 	add	hl,bc
   6B65 5D            [ 4] 2087 	ld	e,l
   6B66 54            [ 4] 2088 	ld	d,h
   6B67 7E            [ 7] 2089 	ld	a, (hl)
   6B68 23            [ 6] 2090 	inc	hl
   6B69 66            [ 7] 2091 	ld	h,(hl)
   6B6A 6F            [ 4] 2092 	ld	l,a
   6B6B DD 7E FE      [19] 2093 	ld	a,-2 (ix)
   6B6E 85            [ 4] 2094 	add	a, l
   6B6F 6F            [ 4] 2095 	ld	l,a
   6B70 DD 7E FF      [19] 2096 	ld	a,-1 (ix)
   6B73 8C            [ 4] 2097 	adc	a, h
   6B74 67            [ 4] 2098 	ld	h,a
   6B75 7E            [ 7] 2099 	ld	a,(hl)
   6B76 02            [ 7] 2100 	ld	(bc),a
                           2101 ;src/main.c:433: enemy->iter++;
   6B77 FD 6E 00      [19] 2102 	ld	l,0 (iy)
   6B7A FD 66 01      [19] 2103 	ld	h,1 (iy)
   6B7D 23            [ 6] 2104 	inc	hl
   6B7E DD 75 FE      [19] 2105 	ld	-2 (ix),l
   6B81 DD 74 FF      [19] 2106 	ld	-1 (ix),h
   6B84 DD 7E FE      [19] 2107 	ld	a,-2 (ix)
   6B87 FD 77 00      [19] 2108 	ld	0 (iy),a
   6B8A DD 7E FF      [19] 2109 	ld	a,-1 (ix)
   6B8D FD 77 01      [19] 2110 	ld	1 (iy),a
                           2111 ;src/main.c:434: enemy->y = enemy->camino[enemy->iter];
   6B90 EB            [ 4] 2112 	ex	de,hl
   6B91 5E            [ 7] 2113 	ld	e,(hl)
   6B92 23            [ 6] 2114 	inc	hl
   6B93 56            [ 7] 2115 	ld	d,(hl)
   6B94 DD 6E FE      [19] 2116 	ld	l,-2 (ix)
   6B97 DD 66 FF      [19] 2117 	ld	h,-1 (ix)
   6B9A 19            [11] 2118 	add	hl,de
   6B9B 5E            [ 7] 2119 	ld	e,(hl)
   6B9C E1            [10] 2120 	pop	hl
   6B9D E5            [11] 2121 	push	hl
   6B9E 73            [ 7] 2122 	ld	(hl),e
                           2123 ;src/main.c:435: enemy->iter++;
   6B9F DD 5E FE      [19] 2124 	ld	e,-2 (ix)
   6BA2 DD 56 FF      [19] 2125 	ld	d,-1 (ix)
   6BA5 13            [ 6] 2126 	inc	de
   6BA6 FD 73 00      [19] 2127 	ld	0 (iy),e
   6BA9 FD 72 01      [19] 2128 	ld	1 (iy),d
                           2129 ;src/main.c:436: enemy->mover = SI;
   6BAC 21 06 00      [10] 2130 	ld	hl,#0x0006
   6BAF 09            [11] 2131 	add	hl,bc
   6BB0 36 01         [10] 2132 	ld	(hl),#0x01
   6BB2 18 50         [12] 2133 	jr	00108$
   6BB4                    2134 00102$:
                           2135 ;src/main.c:439: enemy->reversePatrol = NO;
   6BB4 AF            [ 4] 2136 	xor	a, a
   6BB5 12            [ 7] 2137 	ld	(de),a
                           2138 ;src/main.c:440: enemy->patrolling = 1;
   6BB6 21 0B 00      [10] 2139 	ld	hl,#0x000B
   6BB9 09            [11] 2140 	add	hl,bc
   6BBA 36 01         [10] 2141 	ld	(hl),#0x01
                           2142 ;src/main.c:441: enemy->seek = 0;
   6BBC 21 14 00      [10] 2143 	ld	hl,#0x0014
   6BBF 09            [11] 2144 	add	hl,bc
   6BC0 36 00         [10] 2145 	ld	(hl),#0x00
                           2146 ;src/main.c:442: enemy->lastIter = enemy->iter - 1;
   6BC2 21 10 00      [10] 2147 	ld	hl,#0x0010
   6BC5 09            [11] 2148 	add	hl,bc
   6BC6 EB            [ 4] 2149 	ex	de,hl
   6BC7 FD 7E 00      [19] 2150 	ld	a, 0 (iy)
   6BCA C6 FF         [ 7] 2151 	add	a,#0xFF
   6BCC 12            [ 7] 2152 	ld	(de),a
                           2153 ;src/main.c:443: enemy->iter = 0;
   6BCD FD 36 00 00   [19] 2154 	ld	0 (iy),#0x00
   6BD1 FD 36 01 00   [19] 2155 	ld	1 (iy),#0x00
                           2156 ;src/main.c:444: pathFinding(enemy->x, enemy->y, enemy->p_seek_x, enemy->p_seek_y, enemy, mapa);
   6BD5 69            [ 4] 2157 	ld	l, c
   6BD6 60            [ 4] 2158 	ld	h, b
   6BD7 11 18 00      [10] 2159 	ld	de, #0x0018
   6BDA 19            [11] 2160 	add	hl, de
   6BDB 56            [ 7] 2161 	ld	d,(hl)
   6BDC C5            [11] 2162 	push	bc
   6BDD FD E1         [14] 2163 	pop	iy
   6BDF FD 7E 17      [19] 2164 	ld	a,23 (iy)
   6BE2 DD 77 FE      [19] 2165 	ld	-2 (ix),a
   6BE5 E1            [10] 2166 	pop	hl
   6BE6 E5            [11] 2167 	push	hl
   6BE7 5E            [ 7] 2168 	ld	e,(hl)
   6BE8 0A            [ 7] 2169 	ld	a,(bc)
   6BE9 DD 77 FC      [19] 2170 	ld	-4 (ix),a
   6BEC 2A 26 60      [16] 2171 	ld	hl,(_mapa)
   6BEF E5            [11] 2172 	push	hl
   6BF0 C5            [11] 2173 	push	bc
   6BF1 D5            [11] 2174 	push	de
   6BF2 33            [ 6] 2175 	inc	sp
   6BF3 DD 56 FE      [19] 2176 	ld	d, -2 (ix)
   6BF6 D5            [11] 2177 	push	de
   6BF7 DD 7E FC      [19] 2178 	ld	a,-4 (ix)
   6BFA F5            [11] 2179 	push	af
   6BFB 33            [ 6] 2180 	inc	sp
   6BFC CD 43 43      [17] 2181 	call	_pathFinding
   6BFF 21 08 00      [10] 2182 	ld	hl,#8
   6C02 39            [11] 2183 	add	hl,sp
   6C03 F9            [ 6] 2184 	ld	sp,hl
   6C04                    2185 00108$:
   6C04 DD F9         [10] 2186 	ld	sp, ix
   6C06 DD E1         [14] 2187 	pop	ix
   6C08 C9            [10] 2188 	ret
                           2189 ;src/main.c:451: void lookFor(TEnemy* enemy){
                           2190 ;	---------------------------------
                           2191 ; Function lookFor
                           2192 ; ---------------------------------
   6C09                    2193 _lookFor::
   6C09 DD E5         [15] 2194 	push	ix
   6C0B DD 21 00 00   [14] 2195 	ld	ix,#0
   6C0F DD 39         [15] 2196 	add	ix,sp
                           2197 ;src/main.c:460: i16 difx = abs((i16)(enemy->x - prota.x));
   6C11 DD 4E 04      [19] 2198 	ld	c,4 (ix)
   6C14 DD 46 05      [19] 2199 	ld	b,5 (ix)
   6C17 0A            [ 7] 2200 	ld	a,(bc)
   6C18 5F            [ 4] 2201 	ld	e,a
   6C19 16 00         [ 7] 2202 	ld	d,#0x00
   6C1B 21 4A 5F      [10] 2203 	ld	hl,#_prota+0
   6C1E 6E            [ 7] 2204 	ld	l,(hl)
   6C1F 26 00         [ 7] 2205 	ld	h,#0x00
   6C21 7B            [ 4] 2206 	ld	a,e
   6C22 95            [ 4] 2207 	sub	a, l
   6C23 5F            [ 4] 2208 	ld	e,a
   6C24 7A            [ 4] 2209 	ld	a,d
   6C25 9C            [ 4] 2210 	sbc	a, h
   6C26 57            [ 4] 2211 	ld	d,a
   6C27 C5            [11] 2212 	push	bc
   6C28 D5            [11] 2213 	push	de
   6C29 CD DA 49      [17] 2214 	call	_abs
   6C2C F1            [10] 2215 	pop	af
   6C2D C1            [10] 2216 	pop	bc
                           2217 ;src/main.c:461: i16 dify = abs((i16)(enemy->y - prota.y));
   6C2E 69            [ 4] 2218 	ld	l, c
   6C2F 60            [ 4] 2219 	ld	h, b
   6C30 23            [ 6] 2220 	inc	hl
   6C31 5E            [ 7] 2221 	ld	e,(hl)
   6C32 16 00         [ 7] 2222 	ld	d,#0x00
   6C34 21 4B 5F      [10] 2223 	ld	hl,#_prota+1
   6C37 6E            [ 7] 2224 	ld	l,(hl)
   6C38 26 00         [ 7] 2225 	ld	h,#0x00
   6C3A 7B            [ 4] 2226 	ld	a,e
   6C3B 95            [ 4] 2227 	sub	a, l
   6C3C 5F            [ 4] 2228 	ld	e,a
   6C3D 7A            [ 4] 2229 	ld	a,d
   6C3E 9C            [ 4] 2230 	sbc	a, h
   6C3F 57            [ 4] 2231 	ld	d,a
   6C40 C5            [11] 2232 	push	bc
   6C41 D5            [11] 2233 	push	de
   6C42 CD DA 49      [17] 2234 	call	_abs
   6C45 F1            [10] 2235 	pop	af
   6C46 C1            [10] 2236 	pop	bc
                           2237 ;src/main.c:464: enemy->seen = NO;
   6C47 21 12 00      [10] 2238 	ld	hl,#0x0012
   6C4A 09            [11] 2239 	add	hl,bc
   6C4B 36 00         [10] 2240 	ld	(hl),#0x00
                           2241 ;src/main.c:465: enemy->inRange = NO;
   6C4D 21 11 00      [10] 2242 	ld	hl,#0x0011
   6C50 09            [11] 2243 	add	hl,bc
   6C51 36 00         [10] 2244 	ld	(hl),#0x00
                           2245 ;src/main.c:466: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90);
   6C53 21 18 5A      [10] 2246 	ld	hl,#0x5A18
   6C56 E5            [11] 2247 	push	hl
   6C57 21 00 C0      [10] 2248 	ld	hl,#0xC000
   6C5A E5            [11] 2249 	push	hl
   6C5B CD 7F 5E      [17] 2250 	call	_cpct_getScreenPtr
   6C5E DD E1         [14] 2251 	pop	ix
   6C60 C9            [10] 2252 	ret
                           2253 ;src/main.c:479: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2254 ;	---------------------------------
                           2255 ; Function engage
                           2256 ; ---------------------------------
   6C61                    2257 _engage::
   6C61 DD E5         [15] 2258 	push	ix
   6C63 DD 21 00 00   [14] 2259 	ld	ix,#0
   6C67 DD 39         [15] 2260 	add	ix,sp
   6C69 21 F3 FF      [10] 2261 	ld	hl,#-13
   6C6C 39            [11] 2262 	add	hl,sp
   6C6D F9            [ 6] 2263 	ld	sp,hl
                           2264 ;src/main.c:480: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   6C6E DD 7E 04      [19] 2265 	ld	a,4 (ix)
   6C71 DD 77 F7      [19] 2266 	ld	-9 (ix),a
   6C74 DD 7E 05      [19] 2267 	ld	a,5 (ix)
   6C77 DD 77 F8      [19] 2268 	ld	-8 (ix),a
   6C7A DD 6E F7      [19] 2269 	ld	l,-9 (ix)
   6C7D DD 66 F8      [19] 2270 	ld	h,-8 (ix)
   6C80 4E            [ 7] 2271 	ld	c,(hl)
   6C81 06 00         [ 7] 2272 	ld	b,#0x00
   6C83 21 4A 5F      [10] 2273 	ld	hl,#_prota+0
   6C86 5E            [ 7] 2274 	ld	e,(hl)
   6C87 16 00         [ 7] 2275 	ld	d,#0x00
   6C89 79            [ 4] 2276 	ld	a,c
   6C8A 93            [ 4] 2277 	sub	a, e
   6C8B 4F            [ 4] 2278 	ld	c,a
   6C8C 78            [ 4] 2279 	ld	a,b
   6C8D 9A            [ 4] 2280 	sbc	a, d
   6C8E 47            [ 4] 2281 	ld	b,a
   6C8F C5            [11] 2282 	push	bc
   6C90 CD DA 49      [17] 2283 	call	_abs
   6C93 F1            [10] 2284 	pop	af
   6C94 4D            [ 4] 2285 	ld	c,l
                           2286 ;src/main.c:481: u8 dify = abs(enemy->y - prota.y);
   6C95 DD 7E F7      [19] 2287 	ld	a,-9 (ix)
   6C98 C6 01         [ 7] 2288 	add	a, #0x01
   6C9A DD 77 F9      [19] 2289 	ld	-7 (ix),a
   6C9D DD 7E F8      [19] 2290 	ld	a,-8 (ix)
   6CA0 CE 00         [ 7] 2291 	adc	a, #0x00
   6CA2 DD 77 FA      [19] 2292 	ld	-6 (ix),a
   6CA5 DD 6E F9      [19] 2293 	ld	l,-7 (ix)
   6CA8 DD 66 FA      [19] 2294 	ld	h,-6 (ix)
   6CAB 5E            [ 7] 2295 	ld	e,(hl)
   6CAC 16 00         [ 7] 2296 	ld	d,#0x00
   6CAE 21 4B 5F      [10] 2297 	ld	hl,#_prota+1
   6CB1 6E            [ 7] 2298 	ld	l,(hl)
   6CB2 26 00         [ 7] 2299 	ld	h,#0x00
   6CB4 7B            [ 4] 2300 	ld	a,e
   6CB5 95            [ 4] 2301 	sub	a, l
   6CB6 5F            [ 4] 2302 	ld	e,a
   6CB7 7A            [ 4] 2303 	ld	a,d
   6CB8 9C            [ 4] 2304 	sbc	a, h
   6CB9 57            [ 4] 2305 	ld	d,a
   6CBA C5            [11] 2306 	push	bc
   6CBB D5            [11] 2307 	push	de
   6CBC CD DA 49      [17] 2308 	call	_abs
   6CBF F1            [10] 2309 	pop	af
   6CC0 C1            [10] 2310 	pop	bc
                           2311 ;src/main.c:482: u8 dist = difx + dify; // manhattan
   6CC1 09            [11] 2312 	add	hl, bc
   6CC2 DD 75 F6      [19] 2313 	ld	-10 (ix),l
                           2314 ;src/main.c:484: u8 movX = 0;
   6CC5 DD 36 F5 00   [19] 2315 	ld	-11 (ix),#0x00
                           2316 ;src/main.c:485: u8 movY = 0;
   6CC9 DD 36 F4 00   [19] 2317 	ld	-12 (ix),#0x00
                           2318 ;src/main.c:486: u8 mov = 0;
   6CCD DD 36 F3 00   [19] 2319 	ld	-13 (ix),#0x00
                           2320 ;src/main.c:488: if (enemy->y == dy) { // alineado en el eje x
   6CD1 DD 6E F9      [19] 2321 	ld	l,-7 (ix)
   6CD4 DD 66 FA      [19] 2322 	ld	h,-6 (ix)
   6CD7 7E            [ 7] 2323 	ld	a,(hl)
   6CD8 DD 77 FB      [19] 2324 	ld	-5 (ix),a
                           2325 ;src/main.c:490: if (dist > 10) {
   6CDB 3E 0A         [ 7] 2326 	ld	a,#0x0A
   6CDD DD 96 F6      [19] 2327 	sub	a, -10 (ix)
   6CE0 3E 00         [ 7] 2328 	ld	a,#0x00
   6CE2 17            [ 4] 2329 	rla
   6CE3 DD 77 FC      [19] 2330 	ld	-4 (ix),a
                           2331 ;src/main.c:488: if (enemy->y == dy) { // alineado en el eje x
   6CE6 DD 7E 07      [19] 2332 	ld	a,7 (ix)
   6CE9 DD 96 FB      [19] 2333 	sub	a, -5 (ix)
   6CEC C2 EE 6D      [10] 2334 	jp	NZ,00187$
                           2335 ;src/main.c:490: if (dist > 10) {
   6CEF DD 7E FC      [19] 2336 	ld	a,-4 (ix)
   6CF2 B7            [ 4] 2337 	or	a, a
   6CF3 CA 52 73      [10] 2338 	jp	Z,00189$
                           2339 ;src/main.c:491: if (dx < enemy->x) { // izquierda
   6CF6 DD 6E F7      [19] 2340 	ld	l,-9 (ix)
   6CF9 DD 66 F8      [19] 2341 	ld	h,-8 (ix)
   6CFC 46            [ 7] 2342 	ld	b,(hl)
   6CFD DD 7E 06      [19] 2343 	ld	a,6 (ix)
   6D00 90            [ 4] 2344 	sub	a, b
   6D01 30 72         [12] 2345 	jr	NC,00110$
                           2346 ;src/main.c:492: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   6D03 05            [ 4] 2347 	dec	b
   6D04 DD 7E FB      [19] 2348 	ld	a,-5 (ix)
   6D07 F5            [11] 2349 	push	af
   6D08 33            [ 6] 2350 	inc	sp
   6D09 C5            [11] 2351 	push	bc
   6D0A 33            [ 6] 2352 	inc	sp
   6D0B 2A 26 60      [16] 2353 	ld	hl,(_mapa)
   6D0E E5            [11] 2354 	push	hl
   6D0F CD 96 49      [17] 2355 	call	_getTilePtr
   6D12 F1            [10] 2356 	pop	af
   6D13 F1            [10] 2357 	pop	af
   6D14 4E            [ 7] 2358 	ld	c,(hl)
   6D15 3E 02         [ 7] 2359 	ld	a,#0x02
   6D17 91            [ 4] 2360 	sub	a, c
   6D18 DA 52 73      [10] 2361 	jp	C,00189$
                           2362 ;src/main.c:493: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   6D1B DD 6E F9      [19] 2363 	ld	l,-7 (ix)
   6D1E DD 66 FA      [19] 2364 	ld	h,-6 (ix)
   6D21 7E            [ 7] 2365 	ld	a,(hl)
   6D22 C6 0B         [ 7] 2366 	add	a, #0x0B
   6D24 57            [ 4] 2367 	ld	d,a
   6D25 DD 6E F7      [19] 2368 	ld	l,-9 (ix)
   6D28 DD 66 F8      [19] 2369 	ld	h,-8 (ix)
   6D2B 46            [ 7] 2370 	ld	b,(hl)
   6D2C 05            [ 4] 2371 	dec	b
   6D2D D5            [11] 2372 	push	de
   6D2E 33            [ 6] 2373 	inc	sp
   6D2F C5            [11] 2374 	push	bc
   6D30 33            [ 6] 2375 	inc	sp
   6D31 2A 26 60      [16] 2376 	ld	hl,(_mapa)
   6D34 E5            [11] 2377 	push	hl
   6D35 CD 96 49      [17] 2378 	call	_getTilePtr
   6D38 F1            [10] 2379 	pop	af
   6D39 F1            [10] 2380 	pop	af
   6D3A 4E            [ 7] 2381 	ld	c,(hl)
   6D3B 3E 02         [ 7] 2382 	ld	a,#0x02
   6D3D 91            [ 4] 2383 	sub	a, c
   6D3E DA 52 73      [10] 2384 	jp	C,00189$
                           2385 ;src/main.c:494: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   6D41 DD 6E F9      [19] 2386 	ld	l,-7 (ix)
   6D44 DD 66 FA      [19] 2387 	ld	h,-6 (ix)
   6D47 7E            [ 7] 2388 	ld	a,(hl)
   6D48 C6 16         [ 7] 2389 	add	a, #0x16
   6D4A 57            [ 4] 2390 	ld	d,a
   6D4B DD 6E F7      [19] 2391 	ld	l,-9 (ix)
   6D4E DD 66 F8      [19] 2392 	ld	h,-8 (ix)
   6D51 46            [ 7] 2393 	ld	b,(hl)
   6D52 05            [ 4] 2394 	dec	b
   6D53 D5            [11] 2395 	push	de
   6D54 33            [ 6] 2396 	inc	sp
   6D55 C5            [11] 2397 	push	bc
   6D56 33            [ 6] 2398 	inc	sp
   6D57 2A 26 60      [16] 2399 	ld	hl,(_mapa)
   6D5A E5            [11] 2400 	push	hl
   6D5B CD 96 49      [17] 2401 	call	_getTilePtr
   6D5E F1            [10] 2402 	pop	af
   6D5F F1            [10] 2403 	pop	af
   6D60 4E            [ 7] 2404 	ld	c,(hl)
   6D61 3E 02         [ 7] 2405 	ld	a,#0x02
   6D63 91            [ 4] 2406 	sub	a, c
   6D64 DA 52 73      [10] 2407 	jp	C,00189$
                           2408 ;src/main.c:495: moverEnemigoIzquierda(enemy);
   6D67 DD 6E F7      [19] 2409 	ld	l,-9 (ix)
   6D6A DD 66 F8      [19] 2410 	ld	h,-8 (ix)
   6D6D E5            [11] 2411 	push	hl
   6D6E CD DC 68      [17] 2412 	call	_moverEnemigoIzquierda
   6D71 F1            [10] 2413 	pop	af
                           2414 ;src/main.c:497: mov = 1;
   6D72 C3 52 73      [10] 2415 	jp	00189$
   6D75                    2416 00110$:
                           2417 ;src/main.c:500: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   6D75 78            [ 4] 2418 	ld	a,b
   6D76 C6 05         [ 7] 2419 	add	a, #0x05
   6D78 47            [ 4] 2420 	ld	b,a
   6D79 DD 7E FB      [19] 2421 	ld	a,-5 (ix)
   6D7C F5            [11] 2422 	push	af
   6D7D 33            [ 6] 2423 	inc	sp
   6D7E C5            [11] 2424 	push	bc
   6D7F 33            [ 6] 2425 	inc	sp
   6D80 2A 26 60      [16] 2426 	ld	hl,(_mapa)
   6D83 E5            [11] 2427 	push	hl
   6D84 CD 96 49      [17] 2428 	call	_getTilePtr
   6D87 F1            [10] 2429 	pop	af
   6D88 F1            [10] 2430 	pop	af
   6D89 4E            [ 7] 2431 	ld	c,(hl)
   6D8A 3E 02         [ 7] 2432 	ld	a,#0x02
   6D8C 91            [ 4] 2433 	sub	a, c
   6D8D DA 52 73      [10] 2434 	jp	C,00189$
                           2435 ;src/main.c:501: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   6D90 DD 6E F9      [19] 2436 	ld	l,-7 (ix)
   6D93 DD 66 FA      [19] 2437 	ld	h,-6 (ix)
   6D96 7E            [ 7] 2438 	ld	a,(hl)
   6D97 C6 0B         [ 7] 2439 	add	a, #0x0B
   6D99 57            [ 4] 2440 	ld	d,a
   6D9A DD 6E F7      [19] 2441 	ld	l,-9 (ix)
   6D9D DD 66 F8      [19] 2442 	ld	h,-8 (ix)
   6DA0 7E            [ 7] 2443 	ld	a,(hl)
   6DA1 C6 05         [ 7] 2444 	add	a, #0x05
   6DA3 47            [ 4] 2445 	ld	b,a
   6DA4 D5            [11] 2446 	push	de
   6DA5 33            [ 6] 2447 	inc	sp
   6DA6 C5            [11] 2448 	push	bc
   6DA7 33            [ 6] 2449 	inc	sp
   6DA8 2A 26 60      [16] 2450 	ld	hl,(_mapa)
   6DAB E5            [11] 2451 	push	hl
   6DAC CD 96 49      [17] 2452 	call	_getTilePtr
   6DAF F1            [10] 2453 	pop	af
   6DB0 F1            [10] 2454 	pop	af
   6DB1 4E            [ 7] 2455 	ld	c,(hl)
   6DB2 3E 02         [ 7] 2456 	ld	a,#0x02
   6DB4 91            [ 4] 2457 	sub	a, c
   6DB5 DA 52 73      [10] 2458 	jp	C,00189$
                           2459 ;src/main.c:502: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   6DB8 DD 6E F9      [19] 2460 	ld	l,-7 (ix)
   6DBB DD 66 FA      [19] 2461 	ld	h,-6 (ix)
   6DBE 7E            [ 7] 2462 	ld	a,(hl)
   6DBF C6 16         [ 7] 2463 	add	a, #0x16
   6DC1 57            [ 4] 2464 	ld	d,a
   6DC2 DD 6E F7      [19] 2465 	ld	l,-9 (ix)
   6DC5 DD 66 F8      [19] 2466 	ld	h,-8 (ix)
   6DC8 7E            [ 7] 2467 	ld	a,(hl)
   6DC9 C6 05         [ 7] 2468 	add	a, #0x05
   6DCB 47            [ 4] 2469 	ld	b,a
   6DCC D5            [11] 2470 	push	de
   6DCD 33            [ 6] 2471 	inc	sp
   6DCE C5            [11] 2472 	push	bc
   6DCF 33            [ 6] 2473 	inc	sp
   6DD0 2A 26 60      [16] 2474 	ld	hl,(_mapa)
   6DD3 E5            [11] 2475 	push	hl
   6DD4 CD 96 49      [17] 2476 	call	_getTilePtr
   6DD7 F1            [10] 2477 	pop	af
   6DD8 F1            [10] 2478 	pop	af
   6DD9 4E            [ 7] 2479 	ld	c,(hl)
   6DDA 3E 02         [ 7] 2480 	ld	a,#0x02
   6DDC 91            [ 4] 2481 	sub	a, c
   6DDD DA 52 73      [10] 2482 	jp	C,00189$
                           2483 ;src/main.c:503: moverEnemigoDerecha(enemy);
   6DE0 DD 6E F7      [19] 2484 	ld	l,-9 (ix)
   6DE3 DD 66 F8      [19] 2485 	ld	h,-8 (ix)
   6DE6 E5            [11] 2486 	push	hl
   6DE7 CD CC 68      [17] 2487 	call	_moverEnemigoDerecha
   6DEA F1            [10] 2488 	pop	af
                           2489 ;src/main.c:505: mov = 1;
   6DEB C3 52 73      [10] 2490 	jp	00189$
   6DEE                    2491 00187$:
                           2492 ;src/main.c:510: else if (enemy->x == dx) {
   6DEE DD 6E F7      [19] 2493 	ld	l,-9 (ix)
   6DF1 DD 66 F8      [19] 2494 	ld	h,-8 (ix)
   6DF4 7E            [ 7] 2495 	ld	a,(hl)
   6DF5 DD 77 FD      [19] 2496 	ld	-3 (ix), a
   6DF8 DD 96 06      [19] 2497 	sub	a, 6 (ix)
   6DFB C2 F8 6E      [10] 2498 	jp	NZ,00184$
                           2499 ;src/main.c:512: if (dist > 10) {
   6DFE DD 7E FC      [19] 2500 	ld	a,-4 (ix)
   6E01 B7            [ 4] 2501 	or	a, a
   6E02 CA 52 73      [10] 2502 	jp	Z,00189$
                           2503 ;src/main.c:513: if (dy < enemy->y) {
   6E05 DD 7E 07      [19] 2504 	ld	a,7 (ix)
   6E08 DD 96 FB      [19] 2505 	sub	a, -5 (ix)
   6E0B 30 74         [12] 2506 	jr	NC,00123$
                           2507 ;src/main.c:514: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   6E0D DD 46 FB      [19] 2508 	ld	b,-5 (ix)
   6E10 05            [ 4] 2509 	dec	b
   6E11 05            [ 4] 2510 	dec	b
   6E12 C5            [11] 2511 	push	bc
   6E13 33            [ 6] 2512 	inc	sp
   6E14 DD 7E FD      [19] 2513 	ld	a,-3 (ix)
   6E17 F5            [11] 2514 	push	af
   6E18 33            [ 6] 2515 	inc	sp
   6E19 2A 26 60      [16] 2516 	ld	hl,(_mapa)
   6E1C E5            [11] 2517 	push	hl
   6E1D CD 96 49      [17] 2518 	call	_getTilePtr
   6E20 F1            [10] 2519 	pop	af
   6E21 F1            [10] 2520 	pop	af
   6E22 4E            [ 7] 2521 	ld	c,(hl)
   6E23 3E 02         [ 7] 2522 	ld	a,#0x02
   6E25 91            [ 4] 2523 	sub	a, c
   6E26 DA 52 73      [10] 2524 	jp	C,00189$
                           2525 ;src/main.c:515: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   6E29 DD 6E F9      [19] 2526 	ld	l,-7 (ix)
   6E2C DD 66 FA      [19] 2527 	ld	h,-6 (ix)
   6E2F 46            [ 7] 2528 	ld	b,(hl)
   6E30 05            [ 4] 2529 	dec	b
   6E31 05            [ 4] 2530 	dec	b
   6E32 DD 6E F7      [19] 2531 	ld	l,-9 (ix)
   6E35 DD 66 F8      [19] 2532 	ld	h,-8 (ix)
   6E38 56            [ 7] 2533 	ld	d,(hl)
   6E39 14            [ 4] 2534 	inc	d
   6E3A 14            [ 4] 2535 	inc	d
   6E3B 4A            [ 4] 2536 	ld	c, d
   6E3C C5            [11] 2537 	push	bc
   6E3D 2A 26 60      [16] 2538 	ld	hl,(_mapa)
   6E40 E5            [11] 2539 	push	hl
   6E41 CD 96 49      [17] 2540 	call	_getTilePtr
   6E44 F1            [10] 2541 	pop	af
   6E45 F1            [10] 2542 	pop	af
   6E46 4E            [ 7] 2543 	ld	c,(hl)
   6E47 3E 02         [ 7] 2544 	ld	a,#0x02
   6E49 91            [ 4] 2545 	sub	a, c
   6E4A DA 52 73      [10] 2546 	jp	C,00189$
                           2547 ;src/main.c:516: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   6E4D DD 6E F9      [19] 2548 	ld	l,-7 (ix)
   6E50 DD 66 FA      [19] 2549 	ld	h,-6 (ix)
   6E53 46            [ 7] 2550 	ld	b,(hl)
   6E54 05            [ 4] 2551 	dec	b
   6E55 05            [ 4] 2552 	dec	b
   6E56 DD 6E F7      [19] 2553 	ld	l,-9 (ix)
   6E59 DD 66 F8      [19] 2554 	ld	h,-8 (ix)
   6E5C 7E            [ 7] 2555 	ld	a,(hl)
   6E5D C6 04         [ 7] 2556 	add	a, #0x04
   6E5F C5            [11] 2557 	push	bc
   6E60 33            [ 6] 2558 	inc	sp
   6E61 F5            [11] 2559 	push	af
   6E62 33            [ 6] 2560 	inc	sp
   6E63 2A 26 60      [16] 2561 	ld	hl,(_mapa)
   6E66 E5            [11] 2562 	push	hl
   6E67 CD 96 49      [17] 2563 	call	_getTilePtr
   6E6A F1            [10] 2564 	pop	af
   6E6B F1            [10] 2565 	pop	af
   6E6C 4E            [ 7] 2566 	ld	c,(hl)
   6E6D 3E 02         [ 7] 2567 	ld	a,#0x02
   6E6F 91            [ 4] 2568 	sub	a, c
   6E70 DA 52 73      [10] 2569 	jp	C,00189$
                           2570 ;src/main.c:517: moverEnemigoArriba(enemy);
   6E73 DD 6E F7      [19] 2571 	ld	l,-9 (ix)
   6E76 DD 66 F8      [19] 2572 	ld	h,-8 (ix)
   6E79 E5            [11] 2573 	push	hl
   6E7A CD 8E 68      [17] 2574 	call	_moverEnemigoArriba
   6E7D F1            [10] 2575 	pop	af
                           2576 ;src/main.c:519: mov = 1;
   6E7E C3 52 73      [10] 2577 	jp	00189$
   6E81                    2578 00123$:
                           2579 ;src/main.c:522: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   6E81 DD 7E FB      [19] 2580 	ld	a,-5 (ix)
   6E84 C6 18         [ 7] 2581 	add	a, #0x18
   6E86 47            [ 4] 2582 	ld	b,a
   6E87 C5            [11] 2583 	push	bc
   6E88 33            [ 6] 2584 	inc	sp
   6E89 DD 7E FD      [19] 2585 	ld	a,-3 (ix)
   6E8C F5            [11] 2586 	push	af
   6E8D 33            [ 6] 2587 	inc	sp
   6E8E 2A 26 60      [16] 2588 	ld	hl,(_mapa)
   6E91 E5            [11] 2589 	push	hl
   6E92 CD 96 49      [17] 2590 	call	_getTilePtr
   6E95 F1            [10] 2591 	pop	af
   6E96 F1            [10] 2592 	pop	af
   6E97 4E            [ 7] 2593 	ld	c,(hl)
   6E98 3E 02         [ 7] 2594 	ld	a,#0x02
   6E9A 91            [ 4] 2595 	sub	a, c
   6E9B DA 52 73      [10] 2596 	jp	C,00189$
                           2597 ;src/main.c:523: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   6E9E DD 6E F9      [19] 2598 	ld	l,-7 (ix)
   6EA1 DD 66 FA      [19] 2599 	ld	h,-6 (ix)
   6EA4 7E            [ 7] 2600 	ld	a,(hl)
   6EA5 C6 18         [ 7] 2601 	add	a, #0x18
   6EA7 47            [ 4] 2602 	ld	b,a
   6EA8 DD 6E F7      [19] 2603 	ld	l,-9 (ix)
   6EAB DD 66 F8      [19] 2604 	ld	h,-8 (ix)
   6EAE 56            [ 7] 2605 	ld	d,(hl)
   6EAF 14            [ 4] 2606 	inc	d
   6EB0 14            [ 4] 2607 	inc	d
   6EB1 4A            [ 4] 2608 	ld	c, d
   6EB2 C5            [11] 2609 	push	bc
   6EB3 2A 26 60      [16] 2610 	ld	hl,(_mapa)
   6EB6 E5            [11] 2611 	push	hl
   6EB7 CD 96 49      [17] 2612 	call	_getTilePtr
   6EBA F1            [10] 2613 	pop	af
   6EBB F1            [10] 2614 	pop	af
   6EBC 4E            [ 7] 2615 	ld	c,(hl)
   6EBD 3E 02         [ 7] 2616 	ld	a,#0x02
   6EBF 91            [ 4] 2617 	sub	a, c
   6EC0 DA 52 73      [10] 2618 	jp	C,00189$
                           2619 ;src/main.c:524: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   6EC3 DD 6E F9      [19] 2620 	ld	l,-7 (ix)
   6EC6 DD 66 FA      [19] 2621 	ld	h,-6 (ix)
   6EC9 7E            [ 7] 2622 	ld	a,(hl)
   6ECA C6 18         [ 7] 2623 	add	a, #0x18
   6ECC 47            [ 4] 2624 	ld	b,a
   6ECD DD 6E F7      [19] 2625 	ld	l,-9 (ix)
   6ED0 DD 66 F8      [19] 2626 	ld	h,-8 (ix)
   6ED3 7E            [ 7] 2627 	ld	a,(hl)
   6ED4 C6 04         [ 7] 2628 	add	a, #0x04
   6ED6 C5            [11] 2629 	push	bc
   6ED7 33            [ 6] 2630 	inc	sp
   6ED8 F5            [11] 2631 	push	af
   6ED9 33            [ 6] 2632 	inc	sp
   6EDA 2A 26 60      [16] 2633 	ld	hl,(_mapa)
   6EDD E5            [11] 2634 	push	hl
   6EDE CD 96 49      [17] 2635 	call	_getTilePtr
   6EE1 F1            [10] 2636 	pop	af
   6EE2 F1            [10] 2637 	pop	af
   6EE3 4E            [ 7] 2638 	ld	c,(hl)
   6EE4 3E 02         [ 7] 2639 	ld	a,#0x02
   6EE6 91            [ 4] 2640 	sub	a, c
   6EE7 DA 52 73      [10] 2641 	jp	C,00189$
                           2642 ;src/main.c:525: moverEnemigoAbajo(enemy);
   6EEA DD 6E F7      [19] 2643 	ld	l,-9 (ix)
   6EED DD 66 F8      [19] 2644 	ld	h,-8 (ix)
   6EF0 E5            [11] 2645 	push	hl
   6EF1 CD AD 68      [17] 2646 	call	_moverEnemigoAbajo
   6EF4 F1            [10] 2647 	pop	af
                           2648 ;src/main.c:527: mov = 1;
   6EF5 C3 52 73      [10] 2649 	jp	00189$
   6EF8                    2650 00184$:
                           2651 ;src/main.c:533: if (dist > 20) {
   6EF8 3E 14         [ 7] 2652 	ld	a,#0x14
   6EFA DD 96 F6      [19] 2653 	sub	a, -10 (ix)
   6EFD D2 52 73      [10] 2654 	jp	NC,00189$
                           2655 ;src/main.c:534: if (dx < enemy->x) {
   6F00 DD 7E 06      [19] 2656 	ld	a,6 (ix)
   6F03 DD 96 FD      [19] 2657 	sub	a, -3 (ix)
   6F06 D2 88 6F      [10] 2658 	jp	NC,00136$
                           2659 ;src/main.c:535: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   6F09 DD 46 FD      [19] 2660 	ld	b,-3 (ix)
   6F0C 05            [ 4] 2661 	dec	b
   6F0D DD 7E FB      [19] 2662 	ld	a,-5 (ix)
   6F10 F5            [11] 2663 	push	af
   6F11 33            [ 6] 2664 	inc	sp
   6F12 C5            [11] 2665 	push	bc
   6F13 33            [ 6] 2666 	inc	sp
   6F14 2A 26 60      [16] 2667 	ld	hl,(_mapa)
   6F17 E5            [11] 2668 	push	hl
   6F18 CD 96 49      [17] 2669 	call	_getTilePtr
   6F1B F1            [10] 2670 	pop	af
   6F1C F1            [10] 2671 	pop	af
   6F1D 4E            [ 7] 2672 	ld	c,(hl)
   6F1E 3E 02         [ 7] 2673 	ld	a,#0x02
   6F20 91            [ 4] 2674 	sub	a, c
   6F21 DA 05 70      [10] 2675 	jp	C,00137$
                           2676 ;src/main.c:536: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   6F24 DD 6E F9      [19] 2677 	ld	l,-7 (ix)
   6F27 DD 66 FA      [19] 2678 	ld	h,-6 (ix)
   6F2A 7E            [ 7] 2679 	ld	a,(hl)
   6F2B C6 0B         [ 7] 2680 	add	a, #0x0B
   6F2D 4F            [ 4] 2681 	ld	c,a
   6F2E DD 6E F7      [19] 2682 	ld	l,-9 (ix)
   6F31 DD 66 F8      [19] 2683 	ld	h,-8 (ix)
   6F34 46            [ 7] 2684 	ld	b,(hl)
   6F35 05            [ 4] 2685 	dec	b
   6F36 79            [ 4] 2686 	ld	a,c
   6F37 F5            [11] 2687 	push	af
   6F38 33            [ 6] 2688 	inc	sp
   6F39 C5            [11] 2689 	push	bc
   6F3A 33            [ 6] 2690 	inc	sp
   6F3B 2A 26 60      [16] 2691 	ld	hl,(_mapa)
   6F3E E5            [11] 2692 	push	hl
   6F3F CD 96 49      [17] 2693 	call	_getTilePtr
   6F42 F1            [10] 2694 	pop	af
   6F43 F1            [10] 2695 	pop	af
   6F44 4E            [ 7] 2696 	ld	c,(hl)
   6F45 3E 02         [ 7] 2697 	ld	a,#0x02
   6F47 91            [ 4] 2698 	sub	a, c
   6F48 DA 05 70      [10] 2699 	jp	C,00137$
                           2700 ;src/main.c:537: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   6F4B DD 6E F9      [19] 2701 	ld	l,-7 (ix)
   6F4E DD 66 FA      [19] 2702 	ld	h,-6 (ix)
   6F51 7E            [ 7] 2703 	ld	a,(hl)
   6F52 C6 16         [ 7] 2704 	add	a, #0x16
   6F54 4F            [ 4] 2705 	ld	c,a
   6F55 DD 6E F7      [19] 2706 	ld	l,-9 (ix)
   6F58 DD 66 F8      [19] 2707 	ld	h,-8 (ix)
   6F5B 46            [ 7] 2708 	ld	b,(hl)
   6F5C 05            [ 4] 2709 	dec	b
   6F5D 79            [ 4] 2710 	ld	a,c
   6F5E F5            [11] 2711 	push	af
   6F5F 33            [ 6] 2712 	inc	sp
   6F60 C5            [11] 2713 	push	bc
   6F61 33            [ 6] 2714 	inc	sp
   6F62 2A 26 60      [16] 2715 	ld	hl,(_mapa)
   6F65 E5            [11] 2716 	push	hl
   6F66 CD 96 49      [17] 2717 	call	_getTilePtr
   6F69 F1            [10] 2718 	pop	af
   6F6A F1            [10] 2719 	pop	af
   6F6B 4E            [ 7] 2720 	ld	c,(hl)
   6F6C 3E 02         [ 7] 2721 	ld	a,#0x02
   6F6E 91            [ 4] 2722 	sub	a, c
   6F6F DA 05 70      [10] 2723 	jp	C,00137$
                           2724 ;src/main.c:538: moverEnemigoIzquierda(enemy);
   6F72 DD 6E F7      [19] 2725 	ld	l,-9 (ix)
   6F75 DD 66 F8      [19] 2726 	ld	h,-8 (ix)
   6F78 E5            [11] 2727 	push	hl
   6F79 CD DC 68      [17] 2728 	call	_moverEnemigoIzquierda
   6F7C F1            [10] 2729 	pop	af
                           2730 ;src/main.c:539: movX = 1;
   6F7D DD 36 F5 01   [19] 2731 	ld	-11 (ix),#0x01
                           2732 ;src/main.c:540: mov = 1;
   6F81 DD 36 F3 01   [19] 2733 	ld	-13 (ix),#0x01
   6F85 C3 05 70      [10] 2734 	jp	00137$
   6F88                    2735 00136$:
                           2736 ;src/main.c:543: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   6F88 DD 7E FD      [19] 2737 	ld	a,-3 (ix)
   6F8B C6 05         [ 7] 2738 	add	a, #0x05
   6F8D 47            [ 4] 2739 	ld	b,a
   6F8E DD 7E FB      [19] 2740 	ld	a,-5 (ix)
   6F91 F5            [11] 2741 	push	af
   6F92 33            [ 6] 2742 	inc	sp
   6F93 C5            [11] 2743 	push	bc
   6F94 33            [ 6] 2744 	inc	sp
   6F95 2A 26 60      [16] 2745 	ld	hl,(_mapa)
   6F98 E5            [11] 2746 	push	hl
   6F99 CD 96 49      [17] 2747 	call	_getTilePtr
   6F9C F1            [10] 2748 	pop	af
   6F9D F1            [10] 2749 	pop	af
   6F9E 4E            [ 7] 2750 	ld	c,(hl)
   6F9F 3E 02         [ 7] 2751 	ld	a,#0x02
   6FA1 91            [ 4] 2752 	sub	a, c
   6FA2 38 61         [12] 2753 	jr	C,00137$
                           2754 ;src/main.c:544: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   6FA4 DD 6E F9      [19] 2755 	ld	l,-7 (ix)
   6FA7 DD 66 FA      [19] 2756 	ld	h,-6 (ix)
   6FAA 7E            [ 7] 2757 	ld	a,(hl)
   6FAB C6 0B         [ 7] 2758 	add	a, #0x0B
   6FAD 57            [ 4] 2759 	ld	d,a
   6FAE DD 6E F7      [19] 2760 	ld	l,-9 (ix)
   6FB1 DD 66 F8      [19] 2761 	ld	h,-8 (ix)
   6FB4 7E            [ 7] 2762 	ld	a,(hl)
   6FB5 C6 05         [ 7] 2763 	add	a, #0x05
   6FB7 47            [ 4] 2764 	ld	b,a
   6FB8 D5            [11] 2765 	push	de
   6FB9 33            [ 6] 2766 	inc	sp
   6FBA C5            [11] 2767 	push	bc
   6FBB 33            [ 6] 2768 	inc	sp
   6FBC 2A 26 60      [16] 2769 	ld	hl,(_mapa)
   6FBF E5            [11] 2770 	push	hl
   6FC0 CD 96 49      [17] 2771 	call	_getTilePtr
   6FC3 F1            [10] 2772 	pop	af
   6FC4 F1            [10] 2773 	pop	af
   6FC5 4E            [ 7] 2774 	ld	c,(hl)
   6FC6 3E 02         [ 7] 2775 	ld	a,#0x02
   6FC8 91            [ 4] 2776 	sub	a, c
   6FC9 38 3A         [12] 2777 	jr	C,00137$
                           2778 ;src/main.c:545: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   6FCB DD 6E F9      [19] 2779 	ld	l,-7 (ix)
   6FCE DD 66 FA      [19] 2780 	ld	h,-6 (ix)
   6FD1 7E            [ 7] 2781 	ld	a,(hl)
   6FD2 C6 16         [ 7] 2782 	add	a, #0x16
   6FD4 57            [ 4] 2783 	ld	d,a
   6FD5 DD 6E F7      [19] 2784 	ld	l,-9 (ix)
   6FD8 DD 66 F8      [19] 2785 	ld	h,-8 (ix)
   6FDB 7E            [ 7] 2786 	ld	a,(hl)
   6FDC C6 05         [ 7] 2787 	add	a, #0x05
   6FDE 47            [ 4] 2788 	ld	b,a
   6FDF D5            [11] 2789 	push	de
   6FE0 33            [ 6] 2790 	inc	sp
   6FE1 C5            [11] 2791 	push	bc
   6FE2 33            [ 6] 2792 	inc	sp
   6FE3 2A 26 60      [16] 2793 	ld	hl,(_mapa)
   6FE6 E5            [11] 2794 	push	hl
   6FE7 CD 96 49      [17] 2795 	call	_getTilePtr
   6FEA F1            [10] 2796 	pop	af
   6FEB F1            [10] 2797 	pop	af
   6FEC 4E            [ 7] 2798 	ld	c,(hl)
   6FED 3E 02         [ 7] 2799 	ld	a,#0x02
   6FEF 91            [ 4] 2800 	sub	a, c
   6FF0 38 13         [12] 2801 	jr	C,00137$
                           2802 ;src/main.c:546: moverEnemigoDerecha(enemy);
   6FF2 DD 6E F7      [19] 2803 	ld	l,-9 (ix)
   6FF5 DD 66 F8      [19] 2804 	ld	h,-8 (ix)
   6FF8 E5            [11] 2805 	push	hl
   6FF9 CD CC 68      [17] 2806 	call	_moverEnemigoDerecha
   6FFC F1            [10] 2807 	pop	af
                           2808 ;src/main.c:547: movX = 1;
   6FFD DD 36 F5 01   [19] 2809 	ld	-11 (ix),#0x01
                           2810 ;src/main.c:548: mov = 1;
   7001 DD 36 F3 01   [19] 2811 	ld	-13 (ix),#0x01
   7005                    2812 00137$:
                           2813 ;src/main.c:551: if (dy < enemy->y) {
   7005 DD 6E F9      [19] 2814 	ld	l,-7 (ix)
   7008 DD 66 FA      [19] 2815 	ld	h,-6 (ix)
   700B 7E            [ 7] 2816 	ld	a,(hl)
   700C DD 77 FD      [19] 2817 	ld	-3 (ix),a
                           2818 ;src/main.c:480: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   700F DD 6E F7      [19] 2819 	ld	l,-9 (ix)
   7012 DD 66 F8      [19] 2820 	ld	h,-8 (ix)
   7015 7E            [ 7] 2821 	ld	a,(hl)
   7016 DD 77 FC      [19] 2822 	ld	-4 (ix),a
                           2823 ;src/main.c:551: if (dy < enemy->y) {
   7019 DD 7E 07      [19] 2824 	ld	a,7 (ix)
   701C DD 96 FD      [19] 2825 	sub	a, -3 (ix)
   701F D2 B5 70      [10] 2826 	jp	NC,00147$
                           2827 ;src/main.c:552: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7022 DD 7E FD      [19] 2828 	ld	a,-3 (ix)
   7025 C6 FE         [ 7] 2829 	add	a,#0xFE
   7027 DD 77 FB      [19] 2830 	ld	-5 (ix), a
   702A F5            [11] 2831 	push	af
   702B 33            [ 6] 2832 	inc	sp
   702C DD 7E FC      [19] 2833 	ld	a,-4 (ix)
   702F F5            [11] 2834 	push	af
   7030 33            [ 6] 2835 	inc	sp
   7031 2A 26 60      [16] 2836 	ld	hl,(_mapa)
   7034 E5            [11] 2837 	push	hl
   7035 CD 96 49      [17] 2838 	call	_getTilePtr
   7038 F1            [10] 2839 	pop	af
   7039 F1            [10] 2840 	pop	af
   703A DD 74 FF      [19] 2841 	ld	-1 (ix),h
   703D DD 75 FE      [19] 2842 	ld	-2 (ix), l
   7040 DD 66 FF      [19] 2843 	ld	h,-1 (ix)
   7043 4E            [ 7] 2844 	ld	c,(hl)
   7044 3E 02         [ 7] 2845 	ld	a,#0x02
   7046 91            [ 4] 2846 	sub	a, c
   7047 DA 30 71      [10] 2847 	jp	C,00148$
                           2848 ;src/main.c:553: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   704A DD 6E F9      [19] 2849 	ld	l,-7 (ix)
   704D DD 66 FA      [19] 2850 	ld	h,-6 (ix)
   7050 7E            [ 7] 2851 	ld	a,(hl)
   7051 DD 77 FE      [19] 2852 	ld	-2 (ix), a
   7054 C6 FE         [ 7] 2853 	add	a,#0xFE
   7056 DD 77 FE      [19] 2854 	ld	-2 (ix),a
   7059 DD 6E F7      [19] 2855 	ld	l,-9 (ix)
   705C DD 66 F8      [19] 2856 	ld	h,-8 (ix)
   705F 46            [ 7] 2857 	ld	b,(hl)
   7060 04            [ 4] 2858 	inc	b
   7061 04            [ 4] 2859 	inc	b
   7062 DD 7E FE      [19] 2860 	ld	a,-2 (ix)
   7065 F5            [11] 2861 	push	af
   7066 33            [ 6] 2862 	inc	sp
   7067 C5            [11] 2863 	push	bc
   7068 33            [ 6] 2864 	inc	sp
   7069 2A 26 60      [16] 2865 	ld	hl,(_mapa)
   706C E5            [11] 2866 	push	hl
   706D CD 96 49      [17] 2867 	call	_getTilePtr
   7070 F1            [10] 2868 	pop	af
   7071 F1            [10] 2869 	pop	af
   7072 4E            [ 7] 2870 	ld	c,(hl)
   7073 3E 02         [ 7] 2871 	ld	a,#0x02
   7075 91            [ 4] 2872 	sub	a, c
   7076 DA 30 71      [10] 2873 	jp	C,00148$
                           2874 ;src/main.c:554: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   7079 DD 6E F9      [19] 2875 	ld	l,-7 (ix)
   707C DD 66 FA      [19] 2876 	ld	h,-6 (ix)
   707F 46            [ 7] 2877 	ld	b,(hl)
   7080 05            [ 4] 2878 	dec	b
   7081 05            [ 4] 2879 	dec	b
   7082 DD 6E F7      [19] 2880 	ld	l,-9 (ix)
   7085 DD 66 F8      [19] 2881 	ld	h,-8 (ix)
   7088 7E            [ 7] 2882 	ld	a,(hl)
   7089 C6 04         [ 7] 2883 	add	a, #0x04
   708B C5            [11] 2884 	push	bc
   708C 33            [ 6] 2885 	inc	sp
   708D F5            [11] 2886 	push	af
   708E 33            [ 6] 2887 	inc	sp
   708F 2A 26 60      [16] 2888 	ld	hl,(_mapa)
   7092 E5            [11] 2889 	push	hl
   7093 CD 96 49      [17] 2890 	call	_getTilePtr
   7096 F1            [10] 2891 	pop	af
   7097 F1            [10] 2892 	pop	af
   7098 4E            [ 7] 2893 	ld	c,(hl)
   7099 3E 02         [ 7] 2894 	ld	a,#0x02
   709B 91            [ 4] 2895 	sub	a, c
   709C DA 30 71      [10] 2896 	jp	C,00148$
                           2897 ;src/main.c:555: moverEnemigoArriba(enemy);
   709F DD 6E F7      [19] 2898 	ld	l,-9 (ix)
   70A2 DD 66 F8      [19] 2899 	ld	h,-8 (ix)
   70A5 E5            [11] 2900 	push	hl
   70A6 CD 8E 68      [17] 2901 	call	_moverEnemigoArriba
   70A9 F1            [10] 2902 	pop	af
                           2903 ;src/main.c:556: movY = 1;
   70AA DD 36 F4 01   [19] 2904 	ld	-12 (ix),#0x01
                           2905 ;src/main.c:557: mov = 1;
   70AE DD 36 F3 01   [19] 2906 	ld	-13 (ix),#0x01
   70B2 C3 30 71      [10] 2907 	jp	00148$
   70B5                    2908 00147$:
                           2909 ;src/main.c:560: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   70B5 DD 7E FD      [19] 2910 	ld	a,-3 (ix)
   70B8 C6 18         [ 7] 2911 	add	a, #0x18
   70BA 47            [ 4] 2912 	ld	b,a
   70BB C5            [11] 2913 	push	bc
   70BC 33            [ 6] 2914 	inc	sp
   70BD DD 7E FC      [19] 2915 	ld	a,-4 (ix)
   70C0 F5            [11] 2916 	push	af
   70C1 33            [ 6] 2917 	inc	sp
   70C2 2A 26 60      [16] 2918 	ld	hl,(_mapa)
   70C5 E5            [11] 2919 	push	hl
   70C6 CD 96 49      [17] 2920 	call	_getTilePtr
   70C9 F1            [10] 2921 	pop	af
   70CA F1            [10] 2922 	pop	af
   70CB 4E            [ 7] 2923 	ld	c,(hl)
   70CC 3E 02         [ 7] 2924 	ld	a,#0x02
   70CE 91            [ 4] 2925 	sub	a, c
   70CF 38 5F         [12] 2926 	jr	C,00148$
                           2927 ;src/main.c:561: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   70D1 DD 6E F9      [19] 2928 	ld	l,-7 (ix)
   70D4 DD 66 FA      [19] 2929 	ld	h,-6 (ix)
   70D7 7E            [ 7] 2930 	ld	a,(hl)
   70D8 C6 18         [ 7] 2931 	add	a, #0x18
   70DA 57            [ 4] 2932 	ld	d,a
   70DB DD 6E F7      [19] 2933 	ld	l,-9 (ix)
   70DE DD 66 F8      [19] 2934 	ld	h,-8 (ix)
   70E1 46            [ 7] 2935 	ld	b,(hl)
   70E2 04            [ 4] 2936 	inc	b
   70E3 04            [ 4] 2937 	inc	b
   70E4 D5            [11] 2938 	push	de
   70E5 33            [ 6] 2939 	inc	sp
   70E6 C5            [11] 2940 	push	bc
   70E7 33            [ 6] 2941 	inc	sp
   70E8 2A 26 60      [16] 2942 	ld	hl,(_mapa)
   70EB E5            [11] 2943 	push	hl
   70EC CD 96 49      [17] 2944 	call	_getTilePtr
   70EF F1            [10] 2945 	pop	af
   70F0 F1            [10] 2946 	pop	af
   70F1 4E            [ 7] 2947 	ld	c,(hl)
   70F2 3E 02         [ 7] 2948 	ld	a,#0x02
   70F4 91            [ 4] 2949 	sub	a, c
   70F5 38 39         [12] 2950 	jr	C,00148$
                           2951 ;src/main.c:562: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   70F7 DD 6E F9      [19] 2952 	ld	l,-7 (ix)
   70FA DD 66 FA      [19] 2953 	ld	h,-6 (ix)
   70FD 7E            [ 7] 2954 	ld	a,(hl)
   70FE C6 18         [ 7] 2955 	add	a, #0x18
   7100 47            [ 4] 2956 	ld	b,a
   7101 DD 6E F7      [19] 2957 	ld	l,-9 (ix)
   7104 DD 66 F8      [19] 2958 	ld	h,-8 (ix)
   7107 7E            [ 7] 2959 	ld	a,(hl)
   7108 C6 04         [ 7] 2960 	add	a, #0x04
   710A C5            [11] 2961 	push	bc
   710B 33            [ 6] 2962 	inc	sp
   710C F5            [11] 2963 	push	af
   710D 33            [ 6] 2964 	inc	sp
   710E 2A 26 60      [16] 2965 	ld	hl,(_mapa)
   7111 E5            [11] 2966 	push	hl
   7112 CD 96 49      [17] 2967 	call	_getTilePtr
   7115 F1            [10] 2968 	pop	af
   7116 F1            [10] 2969 	pop	af
   7117 4E            [ 7] 2970 	ld	c,(hl)
   7118 3E 02         [ 7] 2971 	ld	a,#0x02
   711A 91            [ 4] 2972 	sub	a, c
   711B 38 13         [12] 2973 	jr	C,00148$
                           2974 ;src/main.c:563: moverEnemigoAbajo(enemy);
   711D DD 6E F7      [19] 2975 	ld	l,-9 (ix)
   7120 DD 66 F8      [19] 2976 	ld	h,-8 (ix)
   7123 E5            [11] 2977 	push	hl
   7124 CD AD 68      [17] 2978 	call	_moverEnemigoAbajo
   7127 F1            [10] 2979 	pop	af
                           2980 ;src/main.c:564: movY = 1;
   7128 DD 36 F4 01   [19] 2981 	ld	-12 (ix),#0x01
                           2982 ;src/main.c:565: mov = 1;
   712C DD 36 F3 01   [19] 2983 	ld	-13 (ix),#0x01
   7130                    2984 00148$:
                           2985 ;src/main.c:568: if (!mov) {
   7130 DD 7E F3      [19] 2986 	ld	a,-13 (ix)
   7133 B7            [ 4] 2987 	or	a, a
   7134 C2 52 73      [10] 2988 	jp	NZ,00189$
                           2989 ;src/main.c:569: if (!movX) {
   7137 DD 7E F5      [19] 2990 	ld	a,-11 (ix)
   713A B7            [ 4] 2991 	or	a, a
   713B C2 42 72      [10] 2992 	jp	NZ,00163$
                           2993 ;src/main.c:570: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   713E DD 6E F9      [19] 2994 	ld	l,-7 (ix)
   7141 DD 66 FA      [19] 2995 	ld	h,-6 (ix)
   7144 5E            [ 7] 2996 	ld	e,(hl)
                           2997 ;src/main.c:480: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7145 DD 6E F7      [19] 2998 	ld	l,-9 (ix)
   7148 DD 66 F8      [19] 2999 	ld	h,-8 (ix)
   714B 4E            [ 7] 3000 	ld	c,(hl)
                           3001 ;src/main.c:570: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   714C 3E 70         [ 7] 3002 	ld	a,#0x70
   714E 93            [ 4] 3003 	sub	a, e
   714F 30 7C         [12] 3004 	jr	NC,00160$
                           3005 ;src/main.c:571: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7151 7B            [ 4] 3006 	ld	a,e
   7152 C6 18         [ 7] 3007 	add	a, #0x18
   7154 47            [ 4] 3008 	ld	b,a
   7155 C5            [11] 3009 	push	bc
   7156 2A 26 60      [16] 3010 	ld	hl,(_mapa)
   7159 E5            [11] 3011 	push	hl
   715A CD 96 49      [17] 3012 	call	_getTilePtr
   715D F1            [10] 3013 	pop	af
   715E F1            [10] 3014 	pop	af
   715F 4E            [ 7] 3015 	ld	c,(hl)
   7160 3E 02         [ 7] 3016 	ld	a,#0x02
   7162 91            [ 4] 3017 	sub	a, c
   7163 38 5B         [12] 3018 	jr	C,00150$
                           3019 ;src/main.c:572: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7165 DD 6E F9      [19] 3020 	ld	l,-7 (ix)
   7168 DD 66 FA      [19] 3021 	ld	h,-6 (ix)
   716B 7E            [ 7] 3022 	ld	a,(hl)
   716C C6 18         [ 7] 3023 	add	a, #0x18
   716E 57            [ 4] 3024 	ld	d,a
   716F DD 6E F7      [19] 3025 	ld	l,-9 (ix)
   7172 DD 66 F8      [19] 3026 	ld	h,-8 (ix)
   7175 4E            [ 7] 3027 	ld	c,(hl)
   7176 41            [ 4] 3028 	ld	b,c
   7177 04            [ 4] 3029 	inc	b
   7178 04            [ 4] 3030 	inc	b
   7179 D5            [11] 3031 	push	de
   717A 33            [ 6] 3032 	inc	sp
   717B C5            [11] 3033 	push	bc
   717C 33            [ 6] 3034 	inc	sp
   717D 2A 26 60      [16] 3035 	ld	hl,(_mapa)
   7180 E5            [11] 3036 	push	hl
   7181 CD 96 49      [17] 3037 	call	_getTilePtr
   7184 F1            [10] 3038 	pop	af
   7185 F1            [10] 3039 	pop	af
   7186 4E            [ 7] 3040 	ld	c,(hl)
   7187 3E 02         [ 7] 3041 	ld	a,#0x02
   7189 91            [ 4] 3042 	sub	a, c
   718A 38 34         [12] 3043 	jr	C,00150$
                           3044 ;src/main.c:573: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   718C DD 6E F9      [19] 3045 	ld	l,-7 (ix)
   718F DD 66 FA      [19] 3046 	ld	h,-6 (ix)
   7192 7E            [ 7] 3047 	ld	a,(hl)
   7193 C6 18         [ 7] 3048 	add	a, #0x18
   7195 47            [ 4] 3049 	ld	b,a
   7196 DD 6E F7      [19] 3050 	ld	l,-9 (ix)
   7199 DD 66 F8      [19] 3051 	ld	h,-8 (ix)
   719C 7E            [ 7] 3052 	ld	a,(hl)
   719D C6 04         [ 7] 3053 	add	a, #0x04
   719F C5            [11] 3054 	push	bc
   71A0 33            [ 6] 3055 	inc	sp
   71A1 F5            [11] 3056 	push	af
   71A2 33            [ 6] 3057 	inc	sp
   71A3 2A 26 60      [16] 3058 	ld	hl,(_mapa)
   71A6 E5            [11] 3059 	push	hl
   71A7 CD 96 49      [17] 3060 	call	_getTilePtr
   71AA F1            [10] 3061 	pop	af
   71AB F1            [10] 3062 	pop	af
   71AC 4E            [ 7] 3063 	ld	c,(hl)
   71AD 3E 02         [ 7] 3064 	ld	a,#0x02
   71AF 91            [ 4] 3065 	sub	a, c
   71B0 38 0E         [12] 3066 	jr	C,00150$
                           3067 ;src/main.c:574: moverEnemigoAbajo(enemy);
   71B2 DD 6E F7      [19] 3068 	ld	l,-9 (ix)
   71B5 DD 66 F8      [19] 3069 	ld	h,-8 (ix)
   71B8 E5            [11] 3070 	push	hl
   71B9 CD AD 68      [17] 3071 	call	_moverEnemigoAbajo
   71BC F1            [10] 3072 	pop	af
   71BD C3 42 72      [10] 3073 	jp	00163$
   71C0                    3074 00150$:
                           3075 ;src/main.c:576: moverEnemigoArriba(enemy);
   71C0 DD 6E F7      [19] 3076 	ld	l,-9 (ix)
   71C3 DD 66 F8      [19] 3077 	ld	h,-8 (ix)
   71C6 E5            [11] 3078 	push	hl
   71C7 CD 8E 68      [17] 3079 	call	_moverEnemigoArriba
   71CA F1            [10] 3080 	pop	af
   71CB 18 75         [12] 3081 	jr	00163$
   71CD                    3082 00160$:
                           3083 ;src/main.c:578: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   71CD 43            [ 4] 3084 	ld	b,e
   71CE 05            [ 4] 3085 	dec	b
   71CF 05            [ 4] 3086 	dec	b
   71D0 C5            [11] 3087 	push	bc
   71D1 2A 26 60      [16] 3088 	ld	hl,(_mapa)
   71D4 E5            [11] 3089 	push	hl
   71D5 CD 96 49      [17] 3090 	call	_getTilePtr
   71D8 F1            [10] 3091 	pop	af
   71D9 F1            [10] 3092 	pop	af
   71DA 4E            [ 7] 3093 	ld	c,(hl)
   71DB 3E 02         [ 7] 3094 	ld	a,#0x02
   71DD 91            [ 4] 3095 	sub	a, c
   71DE 38 57         [12] 3096 	jr	C,00155$
                           3097 ;src/main.c:579: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   71E0 DD 6E F9      [19] 3098 	ld	l,-7 (ix)
   71E3 DD 66 FA      [19] 3099 	ld	h,-6 (ix)
   71E6 56            [ 7] 3100 	ld	d,(hl)
   71E7 15            [ 4] 3101 	dec	d
   71E8 15            [ 4] 3102 	dec	d
   71E9 DD 6E F7      [19] 3103 	ld	l,-9 (ix)
   71EC DD 66 F8      [19] 3104 	ld	h,-8 (ix)
   71EF 46            [ 7] 3105 	ld	b,(hl)
   71F0 04            [ 4] 3106 	inc	b
   71F1 04            [ 4] 3107 	inc	b
   71F2 D5            [11] 3108 	push	de
   71F3 33            [ 6] 3109 	inc	sp
   71F4 C5            [11] 3110 	push	bc
   71F5 33            [ 6] 3111 	inc	sp
   71F6 2A 26 60      [16] 3112 	ld	hl,(_mapa)
   71F9 E5            [11] 3113 	push	hl
   71FA CD 96 49      [17] 3114 	call	_getTilePtr
   71FD F1            [10] 3115 	pop	af
   71FE F1            [10] 3116 	pop	af
   71FF 4E            [ 7] 3117 	ld	c,(hl)
   7200 3E 02         [ 7] 3118 	ld	a,#0x02
   7202 91            [ 4] 3119 	sub	a, c
   7203 38 32         [12] 3120 	jr	C,00155$
                           3121 ;src/main.c:580: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   7205 DD 6E F9      [19] 3122 	ld	l,-7 (ix)
   7208 DD 66 FA      [19] 3123 	ld	h,-6 (ix)
   720B 46            [ 7] 3124 	ld	b,(hl)
   720C 05            [ 4] 3125 	dec	b
   720D 05            [ 4] 3126 	dec	b
   720E DD 6E F7      [19] 3127 	ld	l,-9 (ix)
   7211 DD 66 F8      [19] 3128 	ld	h,-8 (ix)
   7214 7E            [ 7] 3129 	ld	a,(hl)
   7215 C6 04         [ 7] 3130 	add	a, #0x04
   7217 C5            [11] 3131 	push	bc
   7218 33            [ 6] 3132 	inc	sp
   7219 F5            [11] 3133 	push	af
   721A 33            [ 6] 3134 	inc	sp
   721B 2A 26 60      [16] 3135 	ld	hl,(_mapa)
   721E E5            [11] 3136 	push	hl
   721F CD 96 49      [17] 3137 	call	_getTilePtr
   7222 F1            [10] 3138 	pop	af
   7223 F1            [10] 3139 	pop	af
   7224 4E            [ 7] 3140 	ld	c,(hl)
   7225 3E 02         [ 7] 3141 	ld	a,#0x02
   7227 91            [ 4] 3142 	sub	a, c
   7228 38 0D         [12] 3143 	jr	C,00155$
                           3144 ;src/main.c:581: moverEnemigoArriba(enemy);
   722A DD 6E F7      [19] 3145 	ld	l,-9 (ix)
   722D DD 66 F8      [19] 3146 	ld	h,-8 (ix)
   7230 E5            [11] 3147 	push	hl
   7231 CD 8E 68      [17] 3148 	call	_moverEnemigoArriba
   7234 F1            [10] 3149 	pop	af
   7235 18 0B         [12] 3150 	jr	00163$
   7237                    3151 00155$:
                           3152 ;src/main.c:583: moverEnemigoAbajo(enemy);
   7237 DD 6E F7      [19] 3153 	ld	l,-9 (ix)
   723A DD 66 F8      [19] 3154 	ld	h,-8 (ix)
   723D E5            [11] 3155 	push	hl
   723E CD AD 68      [17] 3156 	call	_moverEnemigoAbajo
   7241 F1            [10] 3157 	pop	af
   7242                    3158 00163$:
                           3159 ;src/main.c:587: if (!movY) {
   7242 DD 7E F4      [19] 3160 	ld	a,-12 (ix)
   7245 B7            [ 4] 3161 	or	a, a
   7246 C2 52 73      [10] 3162 	jp	NZ,00189$
                           3163 ;src/main.c:588: if (enemy->x < ANCHO_PANTALLA/2) {
   7249 DD 6E F7      [19] 3164 	ld	l,-9 (ix)
   724C DD 66 F8      [19] 3165 	ld	h,-8 (ix)
   724F 4E            [ 7] 3166 	ld	c,(hl)
                           3167 ;src/main.c:481: u8 dify = abs(enemy->y - prota.y);
   7250 DD 6E F9      [19] 3168 	ld	l,-7 (ix)
   7253 DD 66 FA      [19] 3169 	ld	h,-6 (ix)
   7256 5E            [ 7] 3170 	ld	e,(hl)
                           3171 ;src/main.c:588: if (enemy->x < ANCHO_PANTALLA/2) {
   7257 79            [ 4] 3172 	ld	a,c
   7258 D6 28         [ 7] 3173 	sub	a, #0x28
   725A D2 DA 72      [10] 3174 	jp	NC,00175$
                           3175 ;src/main.c:589: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   725D 41            [ 4] 3176 	ld	b,c
   725E 05            [ 4] 3177 	dec	b
   725F 7B            [ 4] 3178 	ld	a,e
   7260 F5            [11] 3179 	push	af
   7261 33            [ 6] 3180 	inc	sp
   7262 C5            [11] 3181 	push	bc
   7263 33            [ 6] 3182 	inc	sp
   7264 2A 26 60      [16] 3183 	ld	hl,(_mapa)
   7267 E5            [11] 3184 	push	hl
   7268 CD 96 49      [17] 3185 	call	_getTilePtr
   726B F1            [10] 3186 	pop	af
   726C F1            [10] 3187 	pop	af
   726D 4E            [ 7] 3188 	ld	c,(hl)
   726E 3E 02         [ 7] 3189 	ld	a,#0x02
   7270 91            [ 4] 3190 	sub	a, c
   7271 38 5A         [12] 3191 	jr	C,00165$
                           3192 ;src/main.c:590: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   7273 DD 6E F9      [19] 3193 	ld	l,-7 (ix)
   7276 DD 66 FA      [19] 3194 	ld	h,-6 (ix)
   7279 7E            [ 7] 3195 	ld	a,(hl)
   727A C6 0B         [ 7] 3196 	add	a, #0x0B
   727C 4F            [ 4] 3197 	ld	c,a
   727D DD 6E F7      [19] 3198 	ld	l,-9 (ix)
   7280 DD 66 F8      [19] 3199 	ld	h,-8 (ix)
   7283 46            [ 7] 3200 	ld	b,(hl)
   7284 05            [ 4] 3201 	dec	b
   7285 79            [ 4] 3202 	ld	a,c
   7286 F5            [11] 3203 	push	af
   7287 33            [ 6] 3204 	inc	sp
   7288 C5            [11] 3205 	push	bc
   7289 33            [ 6] 3206 	inc	sp
   728A 2A 26 60      [16] 3207 	ld	hl,(_mapa)
   728D E5            [11] 3208 	push	hl
   728E CD 96 49      [17] 3209 	call	_getTilePtr
   7291 F1            [10] 3210 	pop	af
   7292 F1            [10] 3211 	pop	af
   7293 4E            [ 7] 3212 	ld	c,(hl)
   7294 3E 02         [ 7] 3213 	ld	a,#0x02
   7296 91            [ 4] 3214 	sub	a, c
   7297 38 34         [12] 3215 	jr	C,00165$
                           3216 ;src/main.c:591: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   7299 DD 6E F9      [19] 3217 	ld	l,-7 (ix)
   729C DD 66 FA      [19] 3218 	ld	h,-6 (ix)
   729F 7E            [ 7] 3219 	ld	a,(hl)
   72A0 C6 16         [ 7] 3220 	add	a, #0x16
   72A2 4F            [ 4] 3221 	ld	c,a
   72A3 DD 6E F7      [19] 3222 	ld	l,-9 (ix)
   72A6 DD 66 F8      [19] 3223 	ld	h,-8 (ix)
   72A9 46            [ 7] 3224 	ld	b,(hl)
   72AA 05            [ 4] 3225 	dec	b
   72AB 79            [ 4] 3226 	ld	a,c
   72AC F5            [11] 3227 	push	af
   72AD 33            [ 6] 3228 	inc	sp
   72AE C5            [11] 3229 	push	bc
   72AF 33            [ 6] 3230 	inc	sp
   72B0 2A 26 60      [16] 3231 	ld	hl,(_mapa)
   72B3 E5            [11] 3232 	push	hl
   72B4 CD 96 49      [17] 3233 	call	_getTilePtr
   72B7 F1            [10] 3234 	pop	af
   72B8 F1            [10] 3235 	pop	af
   72B9 4E            [ 7] 3236 	ld	c,(hl)
   72BA 3E 02         [ 7] 3237 	ld	a,#0x02
   72BC 91            [ 4] 3238 	sub	a, c
   72BD 38 0E         [12] 3239 	jr	C,00165$
                           3240 ;src/main.c:592: moverEnemigoIzquierda(enemy);
   72BF DD 6E F7      [19] 3241 	ld	l,-9 (ix)
   72C2 DD 66 F8      [19] 3242 	ld	h,-8 (ix)
   72C5 E5            [11] 3243 	push	hl
   72C6 CD DC 68      [17] 3244 	call	_moverEnemigoIzquierda
   72C9 F1            [10] 3245 	pop	af
   72CA C3 52 73      [10] 3246 	jp	00189$
   72CD                    3247 00165$:
                           3248 ;src/main.c:594: moverEnemigoDerecha(enemy);
   72CD DD 6E F7      [19] 3249 	ld	l,-9 (ix)
   72D0 DD 66 F8      [19] 3250 	ld	h,-8 (ix)
   72D3 E5            [11] 3251 	push	hl
   72D4 CD CC 68      [17] 3252 	call	_moverEnemigoDerecha
   72D7 F1            [10] 3253 	pop	af
   72D8 18 78         [12] 3254 	jr	00189$
   72DA                    3255 00175$:
                           3256 ;src/main.c:597: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   72DA 79            [ 4] 3257 	ld	a,c
   72DB C6 05         [ 7] 3258 	add	a, #0x05
   72DD 47            [ 4] 3259 	ld	b,a
   72DE 7B            [ 4] 3260 	ld	a,e
   72DF F5            [11] 3261 	push	af
   72E0 33            [ 6] 3262 	inc	sp
   72E1 C5            [11] 3263 	push	bc
   72E2 33            [ 6] 3264 	inc	sp
   72E3 2A 26 60      [16] 3265 	ld	hl,(_mapa)
   72E6 E5            [11] 3266 	push	hl
   72E7 CD 96 49      [17] 3267 	call	_getTilePtr
   72EA F1            [10] 3268 	pop	af
   72EB F1            [10] 3269 	pop	af
   72EC 4E            [ 7] 3270 	ld	c,(hl)
   72ED 3E 02         [ 7] 3271 	ld	a,#0x02
   72EF 91            [ 4] 3272 	sub	a, c
   72F0 38 55         [12] 3273 	jr	C,00170$
                           3274 ;src/main.c:598: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   72F2 DD 6E F9      [19] 3275 	ld	l,-7 (ix)
   72F5 DD 66 FA      [19] 3276 	ld	h,-6 (ix)
   72F8 7E            [ 7] 3277 	ld	a,(hl)
   72F9 C6 0B         [ 7] 3278 	add	a, #0x0B
   72FB 47            [ 4] 3279 	ld	b,a
   72FC DD 6E F7      [19] 3280 	ld	l,-9 (ix)
   72FF DD 66 F8      [19] 3281 	ld	h,-8 (ix)
   7302 7E            [ 7] 3282 	ld	a,(hl)
   7303 C6 05         [ 7] 3283 	add	a, #0x05
   7305 4F            [ 4] 3284 	ld	c,a
   7306 C5            [11] 3285 	push	bc
   7307 2A 26 60      [16] 3286 	ld	hl,(_mapa)
   730A E5            [11] 3287 	push	hl
   730B CD 96 49      [17] 3288 	call	_getTilePtr
   730E F1            [10] 3289 	pop	af
   730F F1            [10] 3290 	pop	af
   7310 4E            [ 7] 3291 	ld	c,(hl)
   7311 3E 02         [ 7] 3292 	ld	a,#0x02
   7313 91            [ 4] 3293 	sub	a, c
   7314 38 31         [12] 3294 	jr	C,00170$
                           3295 ;src/main.c:599: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   7316 DD 6E F9      [19] 3296 	ld	l,-7 (ix)
   7319 DD 66 FA      [19] 3297 	ld	h,-6 (ix)
   731C 7E            [ 7] 3298 	ld	a,(hl)
   731D C6 16         [ 7] 3299 	add	a, #0x16
   731F 47            [ 4] 3300 	ld	b,a
   7320 DD 6E F7      [19] 3301 	ld	l,-9 (ix)
   7323 DD 66 F8      [19] 3302 	ld	h,-8 (ix)
   7326 7E            [ 7] 3303 	ld	a,(hl)
   7327 C6 05         [ 7] 3304 	add	a, #0x05
   7329 4F            [ 4] 3305 	ld	c,a
   732A C5            [11] 3306 	push	bc
   732B 2A 26 60      [16] 3307 	ld	hl,(_mapa)
   732E E5            [11] 3308 	push	hl
   732F CD 96 49      [17] 3309 	call	_getTilePtr
   7332 F1            [10] 3310 	pop	af
   7333 F1            [10] 3311 	pop	af
   7334 4E            [ 7] 3312 	ld	c,(hl)
   7335 3E 02         [ 7] 3313 	ld	a,#0x02
   7337 91            [ 4] 3314 	sub	a, c
   7338 38 0D         [12] 3315 	jr	C,00170$
                           3316 ;src/main.c:600: moverEnemigoDerecha(enemy);
   733A DD 6E F7      [19] 3317 	ld	l,-9 (ix)
   733D DD 66 F8      [19] 3318 	ld	h,-8 (ix)
   7340 E5            [11] 3319 	push	hl
   7341 CD CC 68      [17] 3320 	call	_moverEnemigoDerecha
   7344 F1            [10] 3321 	pop	af
   7345 18 0B         [12] 3322 	jr	00189$
   7347                    3323 00170$:
                           3324 ;src/main.c:603: moverEnemigoIzquierda(enemy);
   7347 DD 6E F7      [19] 3325 	ld	l,-9 (ix)
   734A DD 66 F8      [19] 3326 	ld	h,-8 (ix)
   734D E5            [11] 3327 	push	hl
   734E CD DC 68      [17] 3328 	call	_moverEnemigoIzquierda
   7351 F1            [10] 3329 	pop	af
   7352                    3330 00189$:
   7352 DD F9         [10] 3331 	ld	sp, ix
   7354 DD E1         [14] 3332 	pop	ix
   7356 C9            [10] 3333 	ret
                           3334 ;src/main.c:612: void updateEnemies() { // maquina de estados
                           3335 ;	---------------------------------
                           3336 ; Function updateEnemies
                           3337 ; ---------------------------------
   7357                    3338 _updateEnemies::
   7357 DD E5         [15] 3339 	push	ix
   7359 DD 21 00 00   [14] 3340 	ld	ix,#0
   735D DD 39         [15] 3341 	add	ix,sp
   735F 21 F3 FF      [10] 3342 	ld	hl,#-13
   7362 39            [11] 3343 	add	hl,sp
   7363 F9            [ 6] 3344 	ld	sp,hl
                           3345 ;src/main.c:615: u8 i = 2 + 1;
   7364 DD 36 F3 03   [19] 3346 	ld	-13 (ix),#0x03
                           3347 ;src/main.c:618: actual = enemy;
                           3348 ;src/main.c:619: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   7368 21 18 5A      [10] 3349 	ld	hl,#0x5A18
   736B E5            [11] 3350 	push	hl
   736C 21 00 C0      [10] 3351 	ld	hl,#0xC000
   736F E5            [11] 3352 	push	hl
   7370 CD 7F 5E      [17] 3353 	call	_cpct_getScreenPtr
                           3354 ;src/main.c:622: while(--i) {
   7373 01 DA 5E      [10] 3355 	ld	bc,#_enemy
   7376                    3356 00119$:
   7376 DD 35 F3      [23] 3357 	dec	-13 (ix)
   7379 DD 5E F3      [19] 3358 	ld	e, -13 (ix)
   737C 7B            [ 4] 3359 	ld	a,e
   737D B7            [ 4] 3360 	or	a, a
   737E CA DE 74      [10] 3361 	jp	Z,00122$
                           3362 ;src/main.c:623: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   7381 21 16 00      [10] 3363 	ld	hl,#0x0016
   7384 09            [11] 3364 	add	hl,bc
   7385 DD 75 FE      [19] 3365 	ld	-2 (ix),l
   7388 DD 74 FF      [19] 3366 	ld	-1 (ix),h
   738B DD 6E FE      [19] 3367 	ld	l,-2 (ix)
   738E DD 66 FF      [19] 3368 	ld	h,-1 (ix)
   7391 7E            [ 7] 3369 	ld	a,(hl)
   7392 B7            [ 4] 3370 	or	a, a
   7393 28 16         [12] 3371 	jr	Z,00117$
                           3372 ;src/main.c:624: engage(actual, prota.x, prota.y);
   7395 3A 4B 5F      [13] 3373 	ld	a, (#(_prota + 0x0001) + 0)
   7398 21 4A 5F      [10] 3374 	ld	hl, #_prota + 0
   739B 56            [ 7] 3375 	ld	d,(hl)
   739C C5            [11] 3376 	push	bc
   739D F5            [11] 3377 	push	af
   739E 33            [ 6] 3378 	inc	sp
   739F D5            [11] 3379 	push	de
   73A0 33            [ 6] 3380 	inc	sp
   73A1 C5            [11] 3381 	push	bc
   73A2 CD 61 6C      [17] 3382 	call	_engage
   73A5 F1            [10] 3383 	pop	af
   73A6 F1            [10] 3384 	pop	af
   73A7 C1            [10] 3385 	pop	bc
   73A8 C3 D5 74      [10] 3386 	jp	00118$
   73AB                    3387 00117$:
                           3388 ;src/main.c:626: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   73AB C5            [11] 3389 	push	bc
   73AC C5            [11] 3390 	push	bc
   73AD CD 09 6C      [17] 3391 	call	_lookFor
   73B0 F1            [10] 3392 	pop	af
   73B1 C1            [10] 3393 	pop	bc
                           3394 ;src/main.c:627: if (actual->patrolling) { // esta patrullando
   73B2 21 0B 00      [10] 3395 	ld	hl,#0x000B
   73B5 09            [11] 3396 	add	hl,bc
   73B6 DD 75 F9      [19] 3397 	ld	-7 (ix),l
   73B9 DD 74 FA      [19] 3398 	ld	-6 (ix),h
   73BC DD 6E F9      [19] 3399 	ld	l,-7 (ix)
   73BF DD 66 FA      [19] 3400 	ld	h,-6 (ix)
   73C2 6E            [ 7] 3401 	ld	l,(hl)
                           3402 ;src/main.c:629: if (actual->inRange) {
   73C3 79            [ 4] 3403 	ld	a,c
   73C4 C6 11         [ 7] 3404 	add	a, #0x11
   73C6 5F            [ 4] 3405 	ld	e,a
   73C7 78            [ 4] 3406 	ld	a,b
   73C8 CE 00         [ 7] 3407 	adc	a, #0x00
   73CA 57            [ 4] 3408 	ld	d,a
                           3409 ;src/main.c:638: actual->seek = 1;
   73CB 79            [ 4] 3410 	ld	a,c
   73CC C6 14         [ 7] 3411 	add	a, #0x14
   73CE DD 77 F6      [19] 3412 	ld	-10 (ix),a
   73D1 78            [ 4] 3413 	ld	a,b
   73D2 CE 00         [ 7] 3414 	adc	a, #0x00
   73D4 DD 77 F7      [19] 3415 	ld	-9 (ix),a
                           3416 ;src/main.c:627: if (actual->patrolling) { // esta patrullando
   73D7 7D            [ 4] 3417 	ld	a,l
   73D8 B7            [ 4] 3418 	or	a, a
   73D9 CA 9A 74      [10] 3419 	jp	Z,00114$
                           3420 ;src/main.c:628: moverEnemigoPatrol(actual);
   73DC C5            [11] 3421 	push	bc
   73DD D5            [11] 3422 	push	de
   73DE C5            [11] 3423 	push	bc
   73DF CD EE 68      [17] 3424 	call	_moverEnemigoPatrol
   73E2 F1            [10] 3425 	pop	af
   73E3 D1            [10] 3426 	pop	de
   73E4 C1            [10] 3427 	pop	bc
                           3428 ;src/main.c:629: if (actual->inRange) {
   73E5 1A            [ 7] 3429 	ld	a,(de)
   73E6 B7            [ 4] 3430 	or	a, a
   73E7 28 26         [12] 3431 	jr	Z,00104$
                           3432 ;src/main.c:630: engage(actual, prota.x, prota.y);
   73E9 3A 4B 5F      [13] 3433 	ld	a, (#(_prota + 0x0001) + 0)
   73EC 21 4A 5F      [10] 3434 	ld	hl, #_prota + 0
   73EF 56            [ 7] 3435 	ld	d,(hl)
   73F0 C5            [11] 3436 	push	bc
   73F1 F5            [11] 3437 	push	af
   73F2 33            [ 6] 3438 	inc	sp
   73F3 D5            [11] 3439 	push	de
   73F4 33            [ 6] 3440 	inc	sp
   73F5 C5            [11] 3441 	push	bc
   73F6 CD 61 6C      [17] 3442 	call	_engage
   73F9 F1            [10] 3443 	pop	af
   73FA F1            [10] 3444 	pop	af
   73FB C1            [10] 3445 	pop	bc
                           3446 ;src/main.c:631: actual->patrolling = 0;
   73FC DD 6E F9      [19] 3447 	ld	l,-7 (ix)
   73FF DD 66 FA      [19] 3448 	ld	h,-6 (ix)
   7402 36 00         [10] 3449 	ld	(hl),#0x00
                           3450 ;src/main.c:632: actual->engage = 1;
   7404 DD 6E FE      [19] 3451 	ld	l,-2 (ix)
   7407 DD 66 FF      [19] 3452 	ld	h,-1 (ix)
   740A 36 01         [10] 3453 	ld	(hl),#0x01
   740C C3 D5 74      [10] 3454 	jp	00118$
   740F                    3455 00104$:
                           3456 ;src/main.c:633: } else if (actual->seen) {
   740F 21 12 00      [10] 3457 	ld	hl,#0x0012
   7412 09            [11] 3458 	add	hl,bc
   7413 DD 75 F4      [19] 3459 	ld	-12 (ix),l
   7416 DD 74 F5      [19] 3460 	ld	-11 (ix),h
   7419 DD 6E F4      [19] 3461 	ld	l,-12 (ix)
   741C DD 66 F5      [19] 3462 	ld	h,-11 (ix)
   741F 7E            [ 7] 3463 	ld	a,(hl)
   7420 B7            [ 4] 3464 	or	a, a
   7421 CA D5 74      [10] 3465 	jp	Z,00118$
                           3466 ;src/main.c:635: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   7424 3A 4B 5F      [13] 3467 	ld	a,(#(_prota + 0x0001) + 0)
   7427 DD 77 FB      [19] 3468 	ld	-5 (ix),a
   742A 3A 4A 5F      [13] 3469 	ld	a,(#_prota + 0)
   742D DD 77 F8      [19] 3470 	ld	-8 (ix),a
   7430 21 01 00      [10] 3471 	ld	hl,#0x0001
   7433 09            [11] 3472 	add	hl,bc
   7434 DD 75 FC      [19] 3473 	ld	-4 (ix),l
   7437 DD 74 FD      [19] 3474 	ld	-3 (ix),h
   743A DD 6E FC      [19] 3475 	ld	l,-4 (ix)
   743D DD 66 FD      [19] 3476 	ld	h,-3 (ix)
   7440 5E            [ 7] 3477 	ld	e,(hl)
   7441 0A            [ 7] 3478 	ld	a,(bc)
   7442 57            [ 4] 3479 	ld	d,a
   7443 C5            [11] 3480 	push	bc
   7444 2A 26 60      [16] 3481 	ld	hl,(_mapa)
   7447 E5            [11] 3482 	push	hl
   7448 C5            [11] 3483 	push	bc
   7449 DD 66 FB      [19] 3484 	ld	h,-5 (ix)
   744C DD 6E F8      [19] 3485 	ld	l,-8 (ix)
   744F E5            [11] 3486 	push	hl
   7450 7B            [ 4] 3487 	ld	a,e
   7451 F5            [11] 3488 	push	af
   7452 33            [ 6] 3489 	inc	sp
   7453 D5            [11] 3490 	push	de
   7454 33            [ 6] 3491 	inc	sp
   7455 CD 43 43      [17] 3492 	call	_pathFinding
   7458 21 08 00      [10] 3493 	ld	hl,#8
   745B 39            [11] 3494 	add	hl,sp
   745C F9            [ 6] 3495 	ld	sp,hl
   745D C1            [10] 3496 	pop	bc
                           3497 ;src/main.c:636: actual->p_seek_x = actual->x;
   745E 21 17 00      [10] 3498 	ld	hl,#0x0017
   7461 09            [11] 3499 	add	hl,bc
   7462 EB            [ 4] 3500 	ex	de,hl
   7463 0A            [ 7] 3501 	ld	a,(bc)
   7464 12            [ 7] 3502 	ld	(de),a
                           3503 ;src/main.c:637: actual->p_seek_y = actual->y;
   7465 21 18 00      [10] 3504 	ld	hl,#0x0018
   7468 09            [11] 3505 	add	hl,bc
   7469 EB            [ 4] 3506 	ex	de,hl
   746A DD 6E FC      [19] 3507 	ld	l,-4 (ix)
   746D DD 66 FD      [19] 3508 	ld	h,-3 (ix)
   7470 7E            [ 7] 3509 	ld	a,(hl)
   7471 12            [ 7] 3510 	ld	(de),a
                           3511 ;src/main.c:638: actual->seek = 1;
   7472 DD 6E F6      [19] 3512 	ld	l,-10 (ix)
   7475 DD 66 F7      [19] 3513 	ld	h,-9 (ix)
   7478 36 01         [10] 3514 	ld	(hl),#0x01
                           3515 ;src/main.c:639: actual->iter=0;
   747A 21 0E 00      [10] 3516 	ld	hl,#0x000E
   747D 09            [11] 3517 	add	hl,bc
   747E AF            [ 4] 3518 	xor	a, a
   747F 77            [ 7] 3519 	ld	(hl), a
   7480 23            [ 6] 3520 	inc	hl
   7481 77            [ 7] 3521 	ld	(hl), a
                           3522 ;src/main.c:640: actual->reversePatrol = NO;
   7482 21 0C 00      [10] 3523 	ld	hl,#0x000C
   7485 09            [11] 3524 	add	hl,bc
   7486 36 00         [10] 3525 	ld	(hl),#0x00
                           3526 ;src/main.c:641: actual->patrolling = 0;
   7488 DD 6E F9      [19] 3527 	ld	l,-7 (ix)
   748B DD 66 FA      [19] 3528 	ld	h,-6 (ix)
   748E 36 00         [10] 3529 	ld	(hl),#0x00
                           3530 ;src/main.c:642: actual->seen = 0;
   7490 DD 6E F4      [19] 3531 	ld	l,-12 (ix)
   7493 DD 66 F5      [19] 3532 	ld	h,-11 (ix)
   7496 36 00         [10] 3533 	ld	(hl),#0x00
   7498 18 3B         [12] 3534 	jr	00118$
   749A                    3535 00114$:
                           3536 ;src/main.c:644: } else if (actual->seek) {
   749A DD 6E F6      [19] 3537 	ld	l,-10 (ix)
   749D DD 66 F7      [19] 3538 	ld	h,-9 (ix)
   74A0 7E            [ 7] 3539 	ld	a,(hl)
   74A1 B7            [ 4] 3540 	or	a, a
   74A2 28 31         [12] 3541 	jr	Z,00118$
                           3542 ;src/main.c:646: if (!actual->found /*&& actual->seekTimer <= 5*/) {
   74A4 C5            [11] 3543 	push	bc
   74A5 FD E1         [14] 3544 	pop	iy
   74A7 FD 7E 13      [19] 3545 	ld	a,19 (iy)
   74AA B7            [ 4] 3546 	or	a, a
   74AB 20 09         [12] 3547 	jr	NZ,00109$
                           3548 ;src/main.c:647: moverEnemigoSeek(actual); // buscar en posiciones cercanas a la actual
   74AD C5            [11] 3549 	push	bc
   74AE C5            [11] 3550 	push	bc
   74AF CD FC 6A      [17] 3551 	call	_moverEnemigoSeek
   74B2 F1            [10] 3552 	pop	af
   74B3 C1            [10] 3553 	pop	bc
   74B4 18 1F         [12] 3554 	jr	00118$
   74B6                    3555 00109$:
                           3556 ;src/main.c:648: } else if (actual->inRange) {
   74B6 1A            [ 7] 3557 	ld	a,(de)
   74B7 B7            [ 4] 3558 	or	a, a
   74B8 28 1B         [12] 3559 	jr	Z,00118$
                           3560 ;src/main.c:649: engage(actual, prota.x, prota.y);
   74BA 3A 4B 5F      [13] 3561 	ld	a, (#(_prota + 0x0001) + 0)
   74BD 21 4A 5F      [10] 3562 	ld	hl, #_prota + 0
   74C0 56            [ 7] 3563 	ld	d,(hl)
   74C1 C5            [11] 3564 	push	bc
   74C2 F5            [11] 3565 	push	af
   74C3 33            [ 6] 3566 	inc	sp
   74C4 D5            [11] 3567 	push	de
   74C5 33            [ 6] 3568 	inc	sp
   74C6 C5            [11] 3569 	push	bc
   74C7 CD 61 6C      [17] 3570 	call	_engage
   74CA F1            [10] 3571 	pop	af
   74CB F1            [10] 3572 	pop	af
   74CC C1            [10] 3573 	pop	bc
                           3574 ;src/main.c:650: actual->engage = 1;
   74CD DD 6E FE      [19] 3575 	ld	l,-2 (ix)
   74D0 DD 66 FF      [19] 3576 	ld	h,-1 (ix)
   74D3 36 01         [10] 3577 	ld	(hl),#0x01
   74D5                    3578 00118$:
                           3579 ;src/main.c:654: actual++;
   74D5 21 1C 00      [10] 3580 	ld	hl,#0x001C
   74D8 09            [11] 3581 	add	hl,bc
   74D9 4D            [ 4] 3582 	ld	c,l
   74DA 44            [ 4] 3583 	ld	b,h
   74DB C3 76 73      [10] 3584 	jp	00119$
   74DE                    3585 00122$:
   74DE DD F9         [10] 3586 	ld	sp, ix
   74E0 DD E1         [14] 3587 	pop	ix
   74E2 C9            [10] 3588 	ret
                           3589 ;src/main.c:658: void inicializarEnemy() {
                           3590 ;	---------------------------------
                           3591 ; Function inicializarEnemy
                           3592 ; ---------------------------------
   74E3                    3593 _inicializarEnemy::
   74E3 DD E5         [15] 3594 	push	ix
   74E5 DD 21 00 00   [14] 3595 	ld	ix,#0
   74E9 DD 39         [15] 3596 	add	ix,sp
   74EB F5            [11] 3597 	push	af
   74EC F5            [11] 3598 	push	af
                           3599 ;src/main.c:669: actual = enemy;
   74ED 01 DA 5E      [10] 3600 	ld	bc,#_enemy+0
                           3601 ;src/main.c:670: while(--i){
   74F0 DD 36 FC 03   [19] 3602 	ld	-4 (ix),#0x03
   74F4                    3603 00103$:
   74F4 DD 35 FC      [23] 3604 	dec	-4 (ix)
   74F7 DD 7E FC      [19] 3605 	ld	a,-4 (ix)
   74FA B7            [ 4] 3606 	or	a, a
   74FB CA DC 75      [10] 3607 	jp	Z,00106$
                           3608 ;src/main.c:671: actual->x = actual->px = spawnX[i];
   74FE 59            [ 4] 3609 	ld	e, c
   74FF 50            [ 4] 3610 	ld	d, b
   7500 13            [ 6] 3611 	inc	de
   7501 13            [ 6] 3612 	inc	de
   7502 3E 4C         [ 7] 3613 	ld	a,#<(_spawnX)
   7504 DD 86 FC      [19] 3614 	add	a, -4 (ix)
   7507 6F            [ 4] 3615 	ld	l,a
   7508 3E 60         [ 7] 3616 	ld	a,#>(_spawnX)
   750A CE 00         [ 7] 3617 	adc	a, #0x00
   750C 67            [ 4] 3618 	ld	h,a
   750D 7E            [ 7] 3619 	ld	a,(hl)
   750E DD 77 FF      [19] 3620 	ld	-1 (ix), a
   7511 12            [ 7] 3621 	ld	(de),a
   7512 DD 7E FF      [19] 3622 	ld	a,-1 (ix)
   7515 02            [ 7] 3623 	ld	(bc),a
                           3624 ;src/main.c:672: actual->y = actual->py = spawnY[i];
   7516 C5            [11] 3625 	push	bc
   7517 FD E1         [14] 3626 	pop	iy
   7519 FD 23         [10] 3627 	inc	iy
   751B 59            [ 4] 3628 	ld	e, c
   751C 50            [ 4] 3629 	ld	d, b
   751D 13            [ 6] 3630 	inc	de
   751E 13            [ 6] 3631 	inc	de
   751F 13            [ 6] 3632 	inc	de
   7520 3E 51         [ 7] 3633 	ld	a,#<(_spawnY)
   7522 DD 86 FC      [19] 3634 	add	a, -4 (ix)
   7525 6F            [ 4] 3635 	ld	l,a
   7526 3E 60         [ 7] 3636 	ld	a,#>(_spawnY)
   7528 CE 00         [ 7] 3637 	adc	a, #0x00
   752A 67            [ 4] 3638 	ld	h,a
   752B 7E            [ 7] 3639 	ld	a,(hl)
   752C DD 77 FE      [19] 3640 	ld	-2 (ix), a
   752F 12            [ 7] 3641 	ld	(de),a
   7530 DD 7E FE      [19] 3642 	ld	a,-2 (ix)
   7533 FD 77 00      [19] 3643 	ld	0 (iy), a
                           3644 ;src/main.c:673: actual->mover  = NO;
   7536 21 06 00      [10] 3645 	ld	hl,#0x0006
   7539 09            [11] 3646 	add	hl,bc
   753A 36 00         [10] 3647 	ld	(hl),#0x00
                           3648 ;src/main.c:674: actual->mira   = M_abajo;
   753C 21 07 00      [10] 3649 	ld	hl,#0x0007
   753F 09            [11] 3650 	add	hl,bc
   7540 36 03         [10] 3651 	ld	(hl),#0x03
                           3652 ;src/main.c:675: actual->sprite = g_enemy;
   7542 21 04 00      [10] 3653 	ld	hl,#0x0004
   7545 09            [11] 3654 	add	hl,bc
   7546 36 3A         [10] 3655 	ld	(hl),#<(_g_enemy)
   7548 23            [ 6] 3656 	inc	hl
   7549 36 3C         [10] 3657 	ld	(hl),#>(_g_enemy)
                           3658 ;src/main.c:676: actual->muerto = NO;
   754B 21 08 00      [10] 3659 	ld	hl,#0x0008
   754E 09            [11] 3660 	add	hl,bc
   754F 36 00         [10] 3661 	ld	(hl),#0x00
                           3662 ;src/main.c:677: actual->muertes = 0;
   7551 21 0A 00      [10] 3663 	ld	hl,#0x000A
   7554 09            [11] 3664 	add	hl,bc
   7555 36 00         [10] 3665 	ld	(hl),#0x00
                           3666 ;src/main.c:678: actual->patrolling = SI;
   7557 21 0B 00      [10] 3667 	ld	hl,#0x000B
   755A 09            [11] 3668 	add	hl,bc
   755B 36 01         [10] 3669 	ld	(hl),#0x01
                           3670 ;src/main.c:679: actual->reversePatrol = NO;
   755D 21 0C 00      [10] 3671 	ld	hl,#0x000C
   7560 09            [11] 3672 	add	hl,bc
   7561 36 00         [10] 3673 	ld	(hl),#0x00
                           3674 ;src/main.c:680: actual->iter = 0;
   7563 21 0E 00      [10] 3675 	ld	hl,#0x000E
   7566 09            [11] 3676 	add	hl,bc
   7567 AF            [ 4] 3677 	xor	a, a
   7568 77            [ 7] 3678 	ld	(hl), a
   7569 23            [ 6] 3679 	inc	hl
   756A 77            [ 7] 3680 	ld	(hl), a
                           3681 ;src/main.c:681: actual->lastIter = 0;
   756B 21 10 00      [10] 3682 	ld	hl,#0x0010
   756E 09            [11] 3683 	add	hl,bc
   756F 36 00         [10] 3684 	ld	(hl),#0x00
                           3685 ;src/main.c:682: actual->seen = 0;
   7571 21 12 00      [10] 3686 	ld	hl,#0x0012
   7574 09            [11] 3687 	add	hl,bc
   7575 36 00         [10] 3688 	ld	(hl),#0x00
                           3689 ;src/main.c:683: actual->found = 0;
   7577 21 13 00      [10] 3690 	ld	hl,#0x0013
   757A 09            [11] 3691 	add	hl,bc
   757B 36 00         [10] 3692 	ld	(hl),#0x00
                           3693 ;src/main.c:684: pathFinding(actual->x, actual->y, patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
   757D 21 28 60      [10] 3694 	ld	hl,#_num_mapa + 0
   7580 5E            [ 7] 3695 	ld	e, (hl)
   7581 1C            [ 4] 3696 	inc	e
   7582 16 00         [ 7] 3697 	ld	d,#0x00
   7584 6B            [ 4] 3698 	ld	l, e
   7585 62            [ 4] 3699 	ld	h, d
   7586 29            [11] 3700 	add	hl, hl
   7587 29            [11] 3701 	add	hl, hl
   7588 19            [11] 3702 	add	hl, de
   7589 EB            [ 4] 3703 	ex	de,hl
   758A 21 6A 60      [10] 3704 	ld	hl,#_patrolY
   758D 19            [11] 3705 	add	hl,de
   758E DD 7E FC      [19] 3706 	ld	a,-4 (ix)
   7591 85            [ 4] 3707 	add	a, l
   7592 6F            [ 4] 3708 	ld	l,a
   7593 3E 00         [ 7] 3709 	ld	a,#0x00
   7595 8C            [ 4] 3710 	adc	a, h
   7596 67            [ 4] 3711 	ld	h,a
   7597 7E            [ 7] 3712 	ld	a,(hl)
   7598 DD 77 FD      [19] 3713 	ld	-3 (ix),a
   759B 21 56 60      [10] 3714 	ld	hl,#_patrolX
   759E 19            [11] 3715 	add	hl,de
   759F DD 5E FC      [19] 3716 	ld	e,-4 (ix)
   75A2 16 00         [ 7] 3717 	ld	d,#0x00
   75A4 19            [11] 3718 	add	hl,de
   75A5 56            [ 7] 3719 	ld	d,(hl)
   75A6 C5            [11] 3720 	push	bc
   75A7 2A 26 60      [16] 3721 	ld	hl,(_mapa)
   75AA E5            [11] 3722 	push	hl
   75AB C5            [11] 3723 	push	bc
   75AC DD 7E FD      [19] 3724 	ld	a,-3 (ix)
   75AF F5            [11] 3725 	push	af
   75B0 33            [ 6] 3726 	inc	sp
   75B1 D5            [11] 3727 	push	de
   75B2 33            [ 6] 3728 	inc	sp
   75B3 DD 66 FE      [19] 3729 	ld	h,-2 (ix)
   75B6 DD 6E FF      [19] 3730 	ld	l,-1 (ix)
   75B9 E5            [11] 3731 	push	hl
   75BA CD 43 43      [17] 3732 	call	_pathFinding
   75BD 21 08 00      [10] 3733 	ld	hl,#8
   75C0 39            [11] 3734 	add	hl,sp
   75C1 F9            [ 6] 3735 	ld	sp,hl
   75C2 C1            [10] 3736 	pop	bc
                           3737 ;src/main.c:707: if(actual->longitud_camino > 0){
   75C3 C5            [11] 3738 	push	bc
   75C4 FD E1         [14] 3739 	pop	iy
   75C6 FD 7E 1B      [19] 3740 	ld	a,27 (iy)
   75C9 B7            [ 4] 3741 	or	a, a
   75CA 28 07         [12] 3742 	jr	Z,00102$
                           3743 ;src/main.c:708: dibujarEnemigo(actual);
   75CC C5            [11] 3744 	push	bc
   75CD C5            [11] 3745 	push	bc
   75CE CD 04 63      [17] 3746 	call	_dibujarEnemigo
   75D1 F1            [10] 3747 	pop	af
   75D2 C1            [10] 3748 	pop	bc
   75D3                    3749 00102$:
                           3750 ;src/main.c:710: ++actual;
   75D3 21 1C 00      [10] 3751 	ld	hl,#0x001C
   75D6 09            [11] 3752 	add	hl,bc
   75D7 4D            [ 4] 3753 	ld	c,l
   75D8 44            [ 4] 3754 	ld	b,h
   75D9 C3 F4 74      [10] 3755 	jp	00103$
   75DC                    3756 00106$:
   75DC DD F9         [10] 3757 	ld	sp, ix
   75DE DD E1         [14] 3758 	pop	ix
   75E0 C9            [10] 3759 	ret
                           3760 ;src/main.c:714: void avanzarMapa() {
                           3761 ;	---------------------------------
                           3762 ; Function avanzarMapa
                           3763 ; ---------------------------------
   75E1                    3764 _avanzarMapa::
                           3765 ;src/main.c:715: if(num_mapa < NUM_MAPAS -1) {
   75E1 3A 28 60      [13] 3766 	ld	a,(#_num_mapa + 0)
   75E4 D6 02         [ 7] 3767 	sub	a, #0x02
   75E6 30 34         [12] 3768 	jr	NC,00102$
                           3769 ;src/main.c:716: mapa = mapas[++num_mapa];
   75E8 01 46 60      [10] 3770 	ld	bc,#_mapas+0
   75EB 21 28 60      [10] 3771 	ld	hl, #_num_mapa+0
   75EE 34            [11] 3772 	inc	(hl)
   75EF FD 21 28 60   [14] 3773 	ld	iy,#_num_mapa
   75F3 FD 6E 00      [19] 3774 	ld	l,0 (iy)
   75F6 26 00         [ 7] 3775 	ld	h,#0x00
   75F8 29            [11] 3776 	add	hl, hl
   75F9 09            [11] 3777 	add	hl,bc
   75FA 7E            [ 7] 3778 	ld	a,(hl)
   75FB FD 21 26 60   [14] 3779 	ld	iy,#_mapa
   75FF FD 77 00      [19] 3780 	ld	0 (iy),a
   7602 23            [ 6] 3781 	inc	hl
   7603 7E            [ 7] 3782 	ld	a,(hl)
   7604 32 27 60      [13] 3783 	ld	(#_mapa + 1),a
                           3784 ;src/main.c:717: prota.x = prota.px = 2;
   7607 21 4C 5F      [10] 3785 	ld	hl,#(_prota + 0x0002)
   760A 36 02         [10] 3786 	ld	(hl),#0x02
   760C 21 4A 5F      [10] 3787 	ld	hl,#_prota
   760F 36 02         [10] 3788 	ld	(hl),#0x02
                           3789 ;src/main.c:718: prota.mover = SI;
   7611 21 50 5F      [10] 3790 	ld	hl,#(_prota + 0x0006)
   7614 36 01         [10] 3791 	ld	(hl),#0x01
                           3792 ;src/main.c:719: dibujarMapa();
   7616 CD 30 60      [17] 3793 	call	_dibujarMapa
                           3794 ;src/main.c:720: inicializarEnemy();
   7619 C3 E3 74      [10] 3795 	jp  _inicializarEnemy
   761C                    3796 00102$:
                           3797 ;src/main.c:723: menuFin(puntuacion);
   761C FD 21 29 60   [14] 3798 	ld	iy,#_puntuacion
   7620 FD 6E 00      [19] 3799 	ld	l,0 (iy)
   7623 26 00         [ 7] 3800 	ld	h,#0x00
   7625 C3 1A 4A      [10] 3801 	jp  _menuFin
                           3802 ;src/main.c:727: void moverIzquierda() {
                           3803 ;	---------------------------------
                           3804 ; Function moverIzquierda
                           3805 ; ---------------------------------
   7628                    3806 _moverIzquierda::
                           3807 ;src/main.c:728: prota.mira = M_izquierda;
   7628 01 4A 5F      [10] 3808 	ld	bc,#_prota+0
   762B 21 51 5F      [10] 3809 	ld	hl,#(_prota + 0x0007)
   762E 36 01         [10] 3810 	ld	(hl),#0x01
                           3811 ;src/main.c:729: if (!checkCollision(M_izquierda)) {
   7630 C5            [11] 3812 	push	bc
   7631 3E 01         [ 7] 3813 	ld	a,#0x01
   7633 F5            [11] 3814 	push	af
   7634 33            [ 6] 3815 	inc	sp
   7635 CD 93 61      [17] 3816 	call	_checkCollision
   7638 33            [ 6] 3817 	inc	sp
   7639 C1            [10] 3818 	pop	bc
   763A 7D            [ 4] 3819 	ld	a,l
   763B B7            [ 4] 3820 	or	a, a
   763C C0            [11] 3821 	ret	NZ
                           3822 ;src/main.c:730: prota.x--;
   763D 0A            [ 7] 3823 	ld	a,(bc)
   763E C6 FF         [ 7] 3824 	add	a,#0xFF
   7640 02            [ 7] 3825 	ld	(bc),a
                           3826 ;src/main.c:731: prota.mover = SI;
   7641 21 50 5F      [10] 3827 	ld	hl,#(_prota + 0x0006)
   7644 36 01         [10] 3828 	ld	(hl),#0x01
                           3829 ;src/main.c:732: prota.sprite = g_hero_left;
   7646 21 C6 3D      [10] 3830 	ld	hl,#_g_hero_left
   7649 22 4E 5F      [16] 3831 	ld	((_prota + 0x0004)), hl
   764C C9            [10] 3832 	ret
                           3833 ;src/main.c:736: void moverDerecha() {
                           3834 ;	---------------------------------
                           3835 ; Function moverDerecha
                           3836 ; ---------------------------------
   764D                    3837 _moverDerecha::
                           3838 ;src/main.c:737: prota.mira = M_derecha;
   764D 21 51 5F      [10] 3839 	ld	hl,#(_prota + 0x0007)
   7650 36 00         [10] 3840 	ld	(hl),#0x00
                           3841 ;src/main.c:738: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7652 AF            [ 4] 3842 	xor	a, a
   7653 F5            [11] 3843 	push	af
   7654 33            [ 6] 3844 	inc	sp
   7655 CD 93 61      [17] 3845 	call	_checkCollision
   7658 33            [ 6] 3846 	inc	sp
   7659 45            [ 4] 3847 	ld	b,l
   765A 21 4A 5F      [10] 3848 	ld	hl, #_prota + 0
   765D 4E            [ 7] 3849 	ld	c,(hl)
   765E 59            [ 4] 3850 	ld	e,c
   765F 16 00         [ 7] 3851 	ld	d,#0x00
   7661 21 07 00      [10] 3852 	ld	hl,#0x0007
   7664 19            [11] 3853 	add	hl,de
   7665 11 50 80      [10] 3854 	ld	de, #0x8050
   7668 29            [11] 3855 	add	hl, hl
   7669 3F            [ 4] 3856 	ccf
   766A CB 1C         [ 8] 3857 	rr	h
   766C CB 1D         [ 8] 3858 	rr	l
   766E ED 52         [15] 3859 	sbc	hl, de
   7670 3E 00         [ 7] 3860 	ld	a,#0x00
   7672 17            [ 4] 3861 	rla
   7673 5F            [ 4] 3862 	ld	e,a
   7674 78            [ 4] 3863 	ld	a,b
   7675 B7            [ 4] 3864 	or	a,a
   7676 20 14         [12] 3865 	jr	NZ,00104$
   7678 B3            [ 4] 3866 	or	a,e
   7679 28 11         [12] 3867 	jr	Z,00104$
                           3868 ;src/main.c:739: prota.x++;
   767B 0C            [ 4] 3869 	inc	c
   767C 21 4A 5F      [10] 3870 	ld	hl,#_prota
   767F 71            [ 7] 3871 	ld	(hl),c
                           3872 ;src/main.c:740: prota.mover = SI;
   7680 21 50 5F      [10] 3873 	ld	hl,#(_prota + 0x0006)
   7683 36 01         [10] 3874 	ld	(hl),#0x01
                           3875 ;src/main.c:741: prota.sprite = g_hero;
   7685 21 70 3E      [10] 3876 	ld	hl,#_g_hero
   7688 22 4E 5F      [16] 3877 	ld	((_prota + 0x0004)), hl
   768B C9            [10] 3878 	ret
   768C                    3879 00104$:
                           3880 ;src/main.c:743: }else if( prota.x + G_HERO_W >= 80){
   768C 7B            [ 4] 3881 	ld	a,e
   768D B7            [ 4] 3882 	or	a, a
   768E C0            [11] 3883 	ret	NZ
                           3884 ;src/main.c:744: avanzarMapa();
   768F C3 E1 75      [10] 3885 	jp  _avanzarMapa
                           3886 ;src/main.c:748: void moverArriba() {
                           3887 ;	---------------------------------
                           3888 ; Function moverArriba
                           3889 ; ---------------------------------
   7692                    3890 _moverArriba::
                           3891 ;src/main.c:749: prota.mira = M_arriba;
   7692 21 51 5F      [10] 3892 	ld	hl,#(_prota + 0x0007)
   7695 36 02         [10] 3893 	ld	(hl),#0x02
                           3894 ;src/main.c:750: if (!checkCollision(M_arriba)) {
   7697 3E 02         [ 7] 3895 	ld	a,#0x02
   7699 F5            [11] 3896 	push	af
   769A 33            [ 6] 3897 	inc	sp
   769B CD 93 61      [17] 3898 	call	_checkCollision
   769E 33            [ 6] 3899 	inc	sp
   769F 7D            [ 4] 3900 	ld	a,l
   76A0 B7            [ 4] 3901 	or	a, a
   76A1 C0            [11] 3902 	ret	NZ
                           3903 ;src/main.c:751: prota.y--;
   76A2 21 4B 5F      [10] 3904 	ld	hl,#_prota + 1
   76A5 4E            [ 7] 3905 	ld	c,(hl)
   76A6 0D            [ 4] 3906 	dec	c
   76A7 71            [ 7] 3907 	ld	(hl),c
                           3908 ;src/main.c:752: prota.y--;
   76A8 0D            [ 4] 3909 	dec	c
   76A9 71            [ 7] 3910 	ld	(hl),c
                           3911 ;src/main.c:753: prota.mover  = SI;
   76AA 21 50 5F      [10] 3912 	ld	hl,#(_prota + 0x0006)
   76AD 36 01         [10] 3913 	ld	(hl),#0x01
                           3914 ;src/main.c:754: prota.sprite = g_hero_up;
   76AF 21 2C 3D      [10] 3915 	ld	hl,#_g_hero_up
   76B2 22 4E 5F      [16] 3916 	ld	((_prota + 0x0004)), hl
   76B5 C9            [10] 3917 	ret
                           3918 ;src/main.c:758: void moverAbajo() {
                           3919 ;	---------------------------------
                           3920 ; Function moverAbajo
                           3921 ; ---------------------------------
   76B6                    3922 _moverAbajo::
                           3923 ;src/main.c:759: prota.mira = M_abajo;
   76B6 21 51 5F      [10] 3924 	ld	hl,#(_prota + 0x0007)
   76B9 36 03         [10] 3925 	ld	(hl),#0x03
                           3926 ;src/main.c:760: if (!checkCollision(M_abajo) ) {
   76BB 3E 03         [ 7] 3927 	ld	a,#0x03
   76BD F5            [11] 3928 	push	af
   76BE 33            [ 6] 3929 	inc	sp
   76BF CD 93 61      [17] 3930 	call	_checkCollision
   76C2 33            [ 6] 3931 	inc	sp
   76C3 7D            [ 4] 3932 	ld	a,l
   76C4 B7            [ 4] 3933 	or	a, a
   76C5 C0            [11] 3934 	ret	NZ
                           3935 ;src/main.c:761: prota.y++;
   76C6 01 4B 5F      [10] 3936 	ld	bc,#_prota + 1
   76C9 0A            [ 7] 3937 	ld	a,(bc)
   76CA 3C            [ 4] 3938 	inc	a
   76CB 02            [ 7] 3939 	ld	(bc),a
                           3940 ;src/main.c:762: prota.y++;
   76CC 3C            [ 4] 3941 	inc	a
   76CD 02            [ 7] 3942 	ld	(bc),a
                           3943 ;src/main.c:763: prota.mover  = SI;
   76CE 21 50 5F      [10] 3944 	ld	hl,#(_prota + 0x0006)
   76D1 36 01         [10] 3945 	ld	(hl),#0x01
                           3946 ;src/main.c:764: prota.sprite = g_hero_down;
   76D3 21 92 3C      [10] 3947 	ld	hl,#_g_hero_down
   76D6 22 4E 5F      [16] 3948 	ld	((_prota + 0x0004)), hl
   76D9 C9            [10] 3949 	ret
                           3950 ;src/main.c:771: void intHandler() {
                           3951 ;	---------------------------------
                           3952 ; Function intHandler
                           3953 ; ---------------------------------
   76DA                    3954 _intHandler::
                           3955 ;src/main.c:772: if (++i == 6) {
   76DA 21 5C 5F      [10] 3956 	ld	hl, #_i+0
   76DD 34            [11] 3957 	inc	(hl)
   76DE 3A 5C 5F      [13] 3958 	ld	a,(#_i + 0)
   76E1 D6 06         [ 7] 3959 	sub	a, #0x06
   76E3 C0            [11] 3960 	ret	NZ
                           3961 ;src/main.c:773: play();
   76E4 CD AE 51      [17] 3962 	call	_play
                           3963 ;src/main.c:774: i=0;
   76E7 21 5C 5F      [10] 3964 	ld	hl,#_i + 0
   76EA 36 00         [10] 3965 	ld	(hl), #0x00
   76EC C9            [10] 3966 	ret
                           3967 ;src/main.c:778: void inicializarCPC() {
                           3968 ;	---------------------------------
                           3969 ; Function inicializarCPC
                           3970 ; ---------------------------------
   76ED                    3971 _inicializarCPC::
                           3972 ;src/main.c:779: cpct_disableFirmware();
   76ED CD 55 55      [17] 3973 	call	_cpct_disableFirmware
                           3974 ;src/main.c:780: cpct_setVideoMode(0);
   76F0 2E 00         [ 7] 3975 	ld	l,#0x00
   76F2 CD 29 55      [17] 3976 	call	_cpct_setVideoMode
                           3977 ;src/main.c:781: cpct_setBorder(HW_BLACK);
   76F5 21 10 14      [10] 3978 	ld	hl,#0x1410
   76F8 E5            [11] 3979 	push	hl
   76F9 CD 8C 52      [17] 3980 	call	_cpct_setPALColour
                           3981 ;src/main.c:782: cpct_setPalette(g_palette, 16);
   76FC 21 10 00      [10] 3982 	ld	hl,#0x0010
   76FF E5            [11] 3983 	push	hl
   7700 21 60 3E      [10] 3984 	ld	hl,#_g_palette
   7703 E5            [11] 3985 	push	hl
   7704 CD 69 52      [17] 3986 	call	_cpct_setPalette
   7707 C9            [10] 3987 	ret
                           3988 ;src/main.c:787: void inicializarJuego() {
                           3989 ;	---------------------------------
                           3990 ; Function inicializarJuego
                           3991 ; ---------------------------------
   7708                    3992 _inicializarJuego::
                           3993 ;src/main.c:789: num_mapa = 0;
   7708 21 28 60      [10] 3994 	ld	hl,#_num_mapa + 0
   770B 36 00         [10] 3995 	ld	(hl), #0x00
                           3996 ;src/main.c:790: mapa = mapas[num_mapa];
   770D 21 46 60      [10] 3997 	ld	hl, #_mapas + 0
   7710 7E            [ 7] 3998 	ld	a,(hl)
   7711 FD 21 26 60   [14] 3999 	ld	iy,#_mapa
   7715 FD 77 00      [19] 4000 	ld	0 (iy),a
   7718 23            [ 6] 4001 	inc	hl
   7719 7E            [ 7] 4002 	ld	a,(hl)
   771A 32 27 60      [13] 4003 	ld	(#_mapa + 1),a
                           4004 ;src/main.c:791: cpct_etm_setTileset2x4(g_tileset);
   771D 21 E0 17      [10] 4005 	ld	hl,#_g_tileset
   7720 CD 7D 54      [17] 4006 	call	_cpct_etm_setTileset2x4
                           4007 ;src/main.c:793: dibujarMapa();
   7723 CD 30 60      [17] 4008 	call	_dibujarMapa
                           4009 ;src/main.c:796: barraPuntuacionInicial();
   7726 CD BA 4F      [17] 4010 	call	_barraPuntuacionInicial
                           4011 ;src/main.c:799: prota.x = prota.px = 4;
   7729 21 4C 5F      [10] 4012 	ld	hl,#(_prota + 0x0002)
   772C 36 04         [10] 4013 	ld	(hl),#0x04
   772E 21 4A 5F      [10] 4014 	ld	hl,#_prota
   7731 36 04         [10] 4015 	ld	(hl),#0x04
                           4016 ;src/main.c:800: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   7733 21 4D 5F      [10] 4017 	ld	hl,#(_prota + 0x0003)
   7736 36 68         [10] 4018 	ld	(hl),#0x68
   7738 21 4B 5F      [10] 4019 	ld	hl,#(_prota + 0x0001)
   773B 36 68         [10] 4020 	ld	(hl),#0x68
                           4021 ;src/main.c:801: prota.mover  = NO;
   773D 21 50 5F      [10] 4022 	ld	hl,#(_prota + 0x0006)
   7740 36 00         [10] 4023 	ld	(hl),#0x00
                           4024 ;src/main.c:802: prota.mira=M_derecha;
   7742 21 51 5F      [10] 4025 	ld	hl,#(_prota + 0x0007)
   7745 36 00         [10] 4026 	ld	(hl),#0x00
                           4027 ;src/main.c:803: prota.sprite = g_hero;
   7747 21 70 3E      [10] 4028 	ld	hl,#_g_hero
   774A 22 4E 5F      [16] 4029 	ld	((_prota + 0x0004)), hl
                           4030 ;src/main.c:807: cu.x = cu.px = 0;
   774D 21 54 5F      [10] 4031 	ld	hl,#(_cu + 0x0002)
   7750 36 00         [10] 4032 	ld	(hl),#0x00
   7752 21 52 5F      [10] 4033 	ld	hl,#_cu
   7755 36 00         [10] 4034 	ld	(hl),#0x00
                           4035 ;src/main.c:808: cu.y = cu.py = 0;
   7757 21 55 5F      [10] 4036 	ld	hl,#(_cu + 0x0003)
   775A 36 00         [10] 4037 	ld	(hl),#0x00
   775C 21 53 5F      [10] 4038 	ld	hl,#(_cu + 0x0001)
   775F 36 00         [10] 4039 	ld	(hl),#0x00
                           4040 ;src/main.c:809: cu.lanzado = NO;
   7761 21 58 5F      [10] 4041 	ld	hl,#(_cu + 0x0006)
   7764 36 00         [10] 4042 	ld	(hl),#0x00
                           4043 ;src/main.c:810: cu.mover = NO;
   7766 21 5B 5F      [10] 4044 	ld	hl,#(_cu + 0x0009)
   7769 36 00         [10] 4045 	ld	(hl),#0x00
                           4046 ;src/main.c:812: inicializarEnemy();
   776B CD E3 74      [17] 4047 	call	_inicializarEnemy
                           4048 ;src/main.c:814: dibujarProta();
   776E C3 7E 60      [10] 4049 	jp  _dibujarProta
                           4050 ;src/main.c:817: void main(void) {
                           4051 ;	---------------------------------
                           4052 ; Function main
                           4053 ; ---------------------------------
   7771                    4054 _main::
   7771 DD E5         [15] 4055 	push	ix
   7773 DD 21 00 00   [14] 4056 	ld	ix,#0
   7777 DD 39         [15] 4057 	add	ix,sp
   7779 3B            [ 6] 4058 	dec	sp
                           4059 ;src/main.c:822: inicializarCPC();
   777A CD ED 76      [17] 4060 	call	_inicializarCPC
                           4061 ;src/main.c:824: menuInicio();
   777D CD DB 4E      [17] 4062 	call	_menuInicio
                           4063 ;src/main.c:826: inicializarJuego();
   7780 CD 08 77      [17] 4064 	call	_inicializarJuego
                           4065 ;src/main.c:830: while (1) {
   7783                    4066 00116$:
                           4067 ;src/main.c:832: i = 2 + 1;
   7783 DD 36 FF 03   [19] 4068 	ld	-1 (ix),#0x03
                           4069 ;src/main.c:833: actual = enemy;
                           4070 ;src/main.c:835: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   7787 21 00 01      [10] 4071 	ld	hl,#_g_tablatrans
   778A E5            [11] 4072 	push	hl
   778B 2A 26 60      [16] 4073 	ld	hl,(_mapa)
   778E E5            [11] 4074 	push	hl
   778F 21 4A 5F      [10] 4075 	ld	hl,#_prota
   7792 E5            [11] 4076 	push	hl
   7793 21 52 5F      [10] 4077 	ld	hl,#_cu
   7796 E5            [11] 4078 	push	hl
   7797 CD 2C 61      [17] 4079 	call	_comprobarTeclado
   779A 21 08 00      [10] 4080 	ld	hl,#8
   779D 39            [11] 4081 	add	hl,sp
   779E F9            [ 6] 4082 	ld	sp,hl
                           4083 ;src/main.c:836: moverCuchillo(&cu, mapa);
   779F 2A 26 60      [16] 4084 	ld	hl,(_mapa)
   77A2 E5            [11] 4085 	push	hl
   77A3 21 52 5F      [10] 4086 	ld	hl,#_cu
   77A6 E5            [11] 4087 	push	hl
   77A7 CD A7 48      [17] 4088 	call	_moverCuchillo
   77AA F1            [10] 4089 	pop	af
   77AB F1            [10] 4090 	pop	af
                           4091 ;src/main.c:837: updateEnemies();
   77AC CD 57 73      [17] 4092 	call	_updateEnemies
                           4093 ;src/main.c:839: cpct_waitVSYNC();
   77AF CD 21 55      [17] 4094 	call	_cpct_waitVSYNC
                           4095 ;src/main.c:842: if (prota.mover) {
   77B2 01 50 5F      [10] 4096 	ld	bc,#_prota + 6
   77B5 0A            [ 7] 4097 	ld	a,(bc)
   77B6 B7            [ 4] 4098 	or	a, a
   77B7 28 07         [12] 4099 	jr	Z,00102$
                           4100 ;src/main.c:843: redibujarProta();
   77B9 C5            [11] 4101 	push	bc
   77BA CD 18 61      [17] 4102 	call	_redibujarProta
   77BD C1            [10] 4103 	pop	bc
                           4104 ;src/main.c:844: prota.mover = NO;
   77BE AF            [ 4] 4105 	xor	a, a
   77BF 02            [ 7] 4106 	ld	(bc),a
   77C0                    4107 00102$:
                           4108 ;src/main.c:846: if(cu.lanzado && cu.mover){
   77C0 21 58 5F      [10] 4109 	ld	hl, #(_cu + 0x0006) + 0
   77C3 4E            [ 7] 4110 	ld	c,(hl)
                           4111 ;src/main.c:847: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4112 ;src/main.c:846: if(cu.lanzado && cu.mover){
   77C4 79            [ 4] 4113 	ld	a,c
   77C5 B7            [ 4] 4114 	or	a, a
   77C6 28 30         [12] 4115 	jr	Z,00107$
   77C8 3A 5B 5F      [13] 4116 	ld	a, (#(_cu + 0x0009) + 0)
   77CB B7            [ 4] 4117 	or	a, a
   77CC 28 2A         [12] 4118 	jr	Z,00107$
                           4119 ;src/main.c:847: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   77CE 21 53 5F      [10] 4120 	ld	hl, #(_cu + 0x0001) + 0
   77D1 4E            [ 7] 4121 	ld	c,(hl)
   77D2 21 52 5F      [10] 4122 	ld	hl, #_cu + 0
   77D5 46            [ 7] 4123 	ld	b,(hl)
   77D6 21 5A 5F      [10] 4124 	ld	hl, #(_cu + 0x0008) + 0
   77D9 5E            [ 7] 4125 	ld	e,(hl)
   77DA 2A 26 60      [16] 4126 	ld	hl,(_mapa)
   77DD E5            [11] 4127 	push	hl
   77DE 21 00 01      [10] 4128 	ld	hl,#_g_tablatrans
   77E1 E5            [11] 4129 	push	hl
   77E2 21 52 5F      [10] 4130 	ld	hl,#_cu
   77E5 E5            [11] 4131 	push	hl
   77E6 79            [ 4] 4132 	ld	a,c
   77E7 F5            [11] 4133 	push	af
   77E8 33            [ 6] 4134 	inc	sp
   77E9 C5            [11] 4135 	push	bc
   77EA 33            [ 6] 4136 	inc	sp
   77EB 7B            [ 4] 4137 	ld	a,e
   77EC F5            [11] 4138 	push	af
   77ED 33            [ 6] 4139 	inc	sp
   77EE CD EC 45      [17] 4140 	call	_redibujarCuchillo
   77F1 21 09 00      [10] 4141 	ld	hl,#9
   77F4 39            [11] 4142 	add	hl,sp
   77F5 F9            [ 6] 4143 	ld	sp,hl
   77F6 18 28         [12] 4144 	jr	00127$
   77F8                    4145 00107$:
                           4146 ;src/main.c:848: }else if (cu.lanzado && !cu.mover){
   77F8 79            [ 4] 4147 	ld	a,c
   77F9 B7            [ 4] 4148 	or	a, a
   77FA 28 24         [12] 4149 	jr	Z,00127$
   77FC 3A 5B 5F      [13] 4150 	ld	a, (#(_cu + 0x0009) + 0)
   77FF B7            [ 4] 4151 	or	a, a
   7800 20 1E         [12] 4152 	jr	NZ,00127$
                           4153 ;src/main.c:849: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   7802 21 53 5F      [10] 4154 	ld	hl, #(_cu + 0x0001) + 0
   7805 46            [ 7] 4155 	ld	b,(hl)
   7806 21 52 5F      [10] 4156 	ld	hl, #_cu + 0
   7809 4E            [ 7] 4157 	ld	c,(hl)
   780A 21 5A 5F      [10] 4158 	ld	hl, #(_cu + 0x0008) + 0
   780D 56            [ 7] 4159 	ld	d,(hl)
   780E 2A 26 60      [16] 4160 	ld	hl,(_mapa)
   7811 E5            [11] 4161 	push	hl
   7812 C5            [11] 4162 	push	bc
   7813 D5            [11] 4163 	push	de
   7814 33            [ 6] 4164 	inc	sp
   7815 CD 59 45      [17] 4165 	call	_borrarCuchillo
   7818 F1            [10] 4166 	pop	af
   7819 F1            [10] 4167 	pop	af
   781A 33            [ 6] 4168 	inc	sp
                           4169 ;src/main.c:850: cu.lanzado = NO;
   781B 21 58 5F      [10] 4170 	ld	hl,#(_cu + 0x0006)
   781E 36 00         [10] 4171 	ld	(hl),#0x00
                           4172 ;src/main.c:853: while(--i){
   7820                    4173 00127$:
   7820 01 DA 5E      [10] 4174 	ld	bc,#_enemy
   7823                    4175 00112$:
   7823 DD 35 FF      [23] 4176 	dec	-1 (ix)
   7826 DD 5E FF      [19] 4177 	ld	e, -1 (ix)
   7829 7B            [ 4] 4178 	ld	a,e
   782A B7            [ 4] 4179 	or	a, a
   782B 28 28         [12] 4180 	jr	Z,00114$
                           4181 ;src/main.c:854: if(actual->mover){
   782D C5            [11] 4182 	push	bc
   782E FD E1         [14] 4183 	pop	iy
   7830 FD 7E 06      [19] 4184 	ld	a,6 (iy)
   7833 B7            [ 4] 4185 	or	a, a
   7834 28 17         [12] 4186 	jr	Z,00111$
                           4187 ;src/main.c:855: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7836 69            [ 4] 4188 	ld	l, c
   7837 60            [ 4] 4189 	ld	h, b
   7838 23            [ 6] 4190 	inc	hl
   7839 23            [ 6] 4191 	inc	hl
   783A 23            [ 6] 4192 	inc	hl
   783B 56            [ 7] 4193 	ld	d,(hl)
   783C 69            [ 4] 4194 	ld	l, c
   783D 60            [ 4] 4195 	ld	h, b
   783E 23            [ 6] 4196 	inc	hl
   783F 23            [ 6] 4197 	inc	hl
   7840 7E            [ 7] 4198 	ld	a,(hl)
   7841 C5            [11] 4199 	push	bc
   7842 C5            [11] 4200 	push	bc
   7843 D5            [11] 4201 	push	de
   7844 33            [ 6] 4202 	inc	sp
   7845 F5            [11] 4203 	push	af
   7846 33            [ 6] 4204 	inc	sp
   7847 CD 62 64      [17] 4205 	call	_redibujarEnemigo
   784A F1            [10] 4206 	pop	af
   784B F1            [10] 4207 	pop	af
   784C C1            [10] 4208 	pop	bc
   784D                    4209 00111$:
                           4210 ;src/main.c:868: ++actual;
   784D 21 1C 00      [10] 4211 	ld	hl,#0x001C
   7850 09            [11] 4212 	add	hl,bc
   7851 4D            [ 4] 4213 	ld	c,l
   7852 44            [ 4] 4214 	ld	b,h
   7853 18 CE         [12] 4215 	jr	00112$
   7855                    4216 00114$:
                           4217 ;src/main.c:870: cpct_waitVSYNC();
   7855 CD 21 55      [17] 4218 	call	_cpct_waitVSYNC
   7858 C3 83 77      [10] 4219 	jp	00116$
   785B 33            [ 6] 4220 	inc	sp
   785C DD E1         [14] 4221 	pop	ix
   785E C9            [10] 4222 	ret
                           4223 	.area _CODE
                           4224 	.area _INITIALIZER
   602B                    4225 __xinit__mapa:
   602B 00 00              4226 	.dw #0x0000
   602D                    4227 __xinit__num_mapa:
   602D 00                 4228 	.db #0x00	; 0
   602E                    4229 __xinit__puntuacion:
   602E 00                 4230 	.db #0x00	; 0
   602F                    4231 __xinit__vidas:
   602F 05                 4232 	.db #0x05	; 5
                           4233 	.area _CABS (ABS)
