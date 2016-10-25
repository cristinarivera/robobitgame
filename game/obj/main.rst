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
   606B 24                  190 	.db #0x24	; 36
   606C 47                  191 	.db #0x47	; 71	'G'
   606D 32                  192 	.db #0x32	; 50	'2'
   606E 18                  193 	.db #0x18	; 24
   606F                     194 _spawnY:
   606F 59                  195 	.db #0x59	; 89	'Y'
   6070 72                  196 	.db #0x72	; 114	'r'
   6071 9A                  197 	.db #0x9A	; 154
   6072 68                  198 	.db #0x68	; 104	'h'
   6073                     199 _patrolX:
   6073 00                  200 	.db #0x00	; 0
   6074 00                  201 	.db #0x00	; 0
   6075 00                  202 	.db #0x00	; 0
   6076 00                  203 	.db #0x00	; 0
   6077 00                  204 	.db #0x00	; 0
   6078 14                  205 	.db #0x14	; 20
   6079 47                  206 	.db #0x47	; 71	'G'
   607A 00                  207 	.db #0x00	; 0
   607B 00                  208 	.db #0x00	; 0
   607C 00                  209 	.db 0x00
   607D 00                  210 	.db #0x00	; 0
   607E 00                  211 	.db #0x00	; 0
   607F 00                  212 	.db #0x00	; 0
   6080 00                  213 	.db #0x00	; 0
   6081 00                  214 	.db 0x00
   6082 00                  215 	.db #0x00	; 0
   6083 00                  216 	.db #0x00	; 0
   6084 00                  217 	.db #0x00	; 0
   6085 00                  218 	.db #0x00	; 0
   6086 00                  219 	.db 0x00
   6087                     220 _patrolY:
   6087 00                  221 	.db #0x00	; 0
   6088 00                  222 	.db #0x00	; 0
   6089 00                  223 	.db #0x00	; 0
   608A 00                  224 	.db #0x00	; 0
   608B 00                  225 	.db 0x00
   608C 59                  226 	.db #0x59	; 89	'Y'
   608D 9C                  227 	.db #0x9C	; 156
   608E 00                  228 	.db #0x00	; 0
   608F 00                  229 	.db #0x00	; 0
   6090 00                  230 	.db 0x00
   6091 00                  231 	.db #0x00	; 0
   6092 00                  232 	.db #0x00	; 0
   6093 00                  233 	.db #0x00	; 0
   6094 00                  234 	.db #0x00	; 0
   6095 00                  235 	.db 0x00
   6096 00                  236 	.db #0x00	; 0
   6097 00                  237 	.db #0x00	; 0
   6098 00                  238 	.db #0x00	; 0
   6099 00                  239 	.db #0x00	; 0
   609A 00                  240 	.db 0x00
                            241 ;src/main.c:117: void dibujarProta() {
                            242 ;	---------------------------------
                            243 ; Function dibujarProta
                            244 ; ---------------------------------
   609B                     245 _dibujarProta::
                            246 ;src/main.c:118: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   609B 21 6A 5F      [10]  247 	ld	hl, #_prota + 1
   609E 56            [ 7]  248 	ld	d,(hl)
   609F 21 69 5F      [10]  249 	ld	hl, #_prota + 0
   60A2 46            [ 7]  250 	ld	b,(hl)
   60A3 D5            [11]  251 	push	de
   60A4 33            [ 6]  252 	inc	sp
   60A5 C5            [11]  253 	push	bc
   60A6 33            [ 6]  254 	inc	sp
   60A7 21 00 C0      [10]  255 	ld	hl,#0xC000
   60AA E5            [11]  256 	push	hl
   60AB CD 9E 5E      [17]  257 	call	_cpct_getScreenPtr
   60AE EB            [ 4]  258 	ex	de,hl
                            259 ;src/main.c:119: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   60AF ED 4B 6D 5F   [20]  260 	ld	bc, (#_prota + 4)
   60B3 21 00 01      [10]  261 	ld	hl,#_g_tablatrans
   60B6 E5            [11]  262 	push	hl
   60B7 21 07 16      [10]  263 	ld	hl,#0x1607
   60BA E5            [11]  264 	push	hl
   60BB D5            [11]  265 	push	de
   60BC C5            [11]  266 	push	bc
   60BD CD BE 5E      [17]  267 	call	_cpct_drawSpriteMaskedAlignedTable
   60C0 C9            [10]  268 	ret
                            269 ;src/main.c:122: void borrarProta() {
                            270 ;	---------------------------------
                            271 ; Function borrarProta
                            272 ; ---------------------------------
   60C1                     273 _borrarProta::
   60C1 DD E5         [15]  274 	push	ix
   60C3 DD 21 00 00   [14]  275 	ld	ix,#0
   60C7 DD 39         [15]  276 	add	ix,sp
   60C9 F5            [11]  277 	push	af
   60CA 3B            [ 6]  278 	dec	sp
                            279 ;src/main.c:126: u8 w = 4 + (prota.px & 1);
   60CB 21 6B 5F      [10]  280 	ld	hl, #_prota + 2
   60CE 4E            [ 7]  281 	ld	c,(hl)
   60CF 79            [ 4]  282 	ld	a,c
   60D0 E6 01         [ 7]  283 	and	a, #0x01
   60D2 47            [ 4]  284 	ld	b,a
   60D3 04            [ 4]  285 	inc	b
   60D4 04            [ 4]  286 	inc	b
   60D5 04            [ 4]  287 	inc	b
   60D6 04            [ 4]  288 	inc	b
                            289 ;src/main.c:129: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   60D7 21 6C 5F      [10]  290 	ld	hl, #_prota + 3
   60DA 5E            [ 7]  291 	ld	e,(hl)
   60DB CB 4B         [ 8]  292 	bit	1, e
   60DD 28 04         [12]  293 	jr	Z,00103$
   60DF 3E 01         [ 7]  294 	ld	a,#0x01
   60E1 18 02         [12]  295 	jr	00104$
   60E3                     296 00103$:
   60E3 3E 00         [ 7]  297 	ld	a,#0x00
   60E5                     298 00104$:
   60E5 C6 06         [ 7]  299 	add	a, #0x06
   60E7 DD 77 FD      [19]  300 	ld	-3 (ix),a
                            301 ;src/main.c:131: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   60EA FD 2A 45 60   [20]  302 	ld	iy,(_mapa)
   60EE 16 00         [ 7]  303 	ld	d,#0x00
   60F0 7B            [ 4]  304 	ld	a,e
   60F1 C6 E8         [ 7]  305 	add	a,#0xE8
   60F3 DD 77 FE      [19]  306 	ld	-2 (ix),a
   60F6 7A            [ 4]  307 	ld	a,d
   60F7 CE FF         [ 7]  308 	adc	a,#0xFF
   60F9 DD 77 FF      [19]  309 	ld	-1 (ix),a
   60FC DD 6E FE      [19]  310 	ld	l,-2 (ix)
   60FF DD 66 FF      [19]  311 	ld	h,-1 (ix)
   6102 DD CB FF 7E   [20]  312 	bit	7, -1 (ix)
   6106 28 04         [12]  313 	jr	Z,00105$
   6108 21 EB FF      [10]  314 	ld	hl,#0xFFEB
   610B 19            [11]  315 	add	hl,de
   610C                     316 00105$:
   610C CB 2C         [ 8]  317 	sra	h
   610E CB 1D         [ 8]  318 	rr	l
   6110 CB 2C         [ 8]  319 	sra	h
   6112 CB 1D         [ 8]  320 	rr	l
   6114 55            [ 4]  321 	ld	d,l
   6115 CB 39         [ 8]  322 	srl	c
   6117 FD E5         [15]  323 	push	iy
   6119 21 F0 C0      [10]  324 	ld	hl,#0xC0F0
   611C E5            [11]  325 	push	hl
   611D 3E 28         [ 7]  326 	ld	a,#0x28
   611F F5            [11]  327 	push	af
   6120 33            [ 6]  328 	inc	sp
   6121 DD 7E FD      [19]  329 	ld	a,-3 (ix)
   6124 F5            [11]  330 	push	af
   6125 33            [ 6]  331 	inc	sp
   6126 C5            [11]  332 	push	bc
   6127 33            [ 6]  333 	inc	sp
   6128 D5            [11]  334 	push	de
   6129 33            [ 6]  335 	inc	sp
   612A 79            [ 4]  336 	ld	a,c
   612B F5            [11]  337 	push	af
   612C 33            [ 6]  338 	inc	sp
   612D CD 80 53      [17]  339 	call	_cpct_etm_drawTileBox2x4
   6130 DD F9         [10]  340 	ld	sp, ix
   6132 DD E1         [14]  341 	pop	ix
   6134 C9            [10]  342 	ret
                            343 ;src/main.c:134: void redibujarProta() {
                            344 ;	---------------------------------
                            345 ; Function redibujarProta
                            346 ; ---------------------------------
   6135                     347 _redibujarProta::
                            348 ;src/main.c:135: borrarProta();
   6135 CD C1 60      [17]  349 	call	_borrarProta
                            350 ;src/main.c:136: prota.px = prota.x;
   6138 01 6B 5F      [10]  351 	ld	bc,#_prota + 2
   613B 3A 69 5F      [13]  352 	ld	a, (#_prota + 0)
   613E 02            [ 7]  353 	ld	(bc),a
                            354 ;src/main.c:137: prota.py = prota.y;
   613F 01 6C 5F      [10]  355 	ld	bc,#_prota + 3
   6142 3A 6A 5F      [13]  356 	ld	a, (#_prota + 1)
   6145 02            [ 7]  357 	ld	(bc),a
                            358 ;src/main.c:138: dibujarProta();
   6146 C3 9B 60      [10]  359 	jp  _dibujarProta
                            360 ;src/main.c:141: void comprobarTeclado(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans) {
                            361 ;	---------------------------------
                            362 ; Function comprobarTeclado
                            363 ; ---------------------------------
   6149                     364 _comprobarTeclado::
                            365 ;src/main.c:142: cpct_scanKeyboard_if();
   6149 CD D8 54      [17]  366 	call	_cpct_scanKeyboard_if
                            367 ;src/main.c:144: if (cpct_isAnyKeyPressed()) {
   614C CD CB 54      [17]  368 	call	_cpct_isAnyKeyPressed
   614F 7D            [ 4]  369 	ld	a,l
   6150 B7            [ 4]  370 	or	a, a
   6151 C8            [11]  371 	ret	Z
                            372 ;src/main.c:145: if (cpct_isKeyPressed(Key_CursorLeft)){
   6152 21 01 01      [10]  373 	ld	hl,#0x0101
   6155 CD 9F 52      [17]  374 	call	_cpct_isKeyPressed
   6158 7D            [ 4]  375 	ld	a,l
   6159 B7            [ 4]  376 	or	a, a
                            377 ;src/main.c:146: moverIzquierda();
   615A C2 4A 76      [10]  378 	jp	NZ,_moverIzquierda
                            379 ;src/main.c:147: }else if (cpct_isKeyPressed(Key_CursorRight)){
   615D 21 00 02      [10]  380 	ld	hl,#0x0200
   6160 CD 9F 52      [17]  381 	call	_cpct_isKeyPressed
   6163 7D            [ 4]  382 	ld	a,l
   6164 B7            [ 4]  383 	or	a, a
                            384 ;src/main.c:148: moverDerecha();
   6165 C2 6F 76      [10]  385 	jp	NZ,_moverDerecha
                            386 ;src/main.c:149: }else if (cpct_isKeyPressed(Key_CursorUp)){
   6168 21 00 01      [10]  387 	ld	hl,#0x0100
   616B CD 9F 52      [17]  388 	call	_cpct_isKeyPressed
   616E 7D            [ 4]  389 	ld	a,l
   616F B7            [ 4]  390 	or	a, a
                            391 ;src/main.c:150: moverArriba();
   6170 C2 B4 76      [10]  392 	jp	NZ,_moverArriba
                            393 ;src/main.c:151: }else if (cpct_isKeyPressed(Key_CursorDown)){
   6173 21 00 04      [10]  394 	ld	hl,#0x0400
   6176 CD 9F 52      [17]  395 	call	_cpct_isKeyPressed
   6179 7D            [ 4]  396 	ld	a,l
   617A B7            [ 4]  397 	or	a, a
                            398 ;src/main.c:152: moverAbajo();
   617B C2 D8 76      [10]  399 	jp	NZ,_moverAbajo
                            400 ;src/main.c:153: }else if (cpct_isKeyPressed(Key_Space)){
   617E 21 05 80      [10]  401 	ld	hl,#0x8005
   6181 CD 9F 52      [17]  402 	call	_cpct_isKeyPressed
   6184 7D            [ 4]  403 	ld	a,l
   6185 B7            [ 4]  404 	or	a, a
   6186 C8            [11]  405 	ret	Z
                            406 ;src/main.c:154: lanzarCuchillo(cu, prota, mapa, g_tablatrans);
   6187 21 08 00      [10]  407 	ld	hl, #8
   618A 39            [11]  408 	add	hl, sp
   618B 4E            [ 7]  409 	ld	c, (hl)
   618C 23            [ 6]  410 	inc	hl
   618D 46            [ 7]  411 	ld	b, (hl)
   618E C5            [11]  412 	push	bc
   618F 21 08 00      [10]  413 	ld	hl, #8
   6192 39            [11]  414 	add	hl, sp
   6193 4E            [ 7]  415 	ld	c, (hl)
   6194 23            [ 6]  416 	inc	hl
   6195 46            [ 7]  417 	ld	b, (hl)
   6196 C5            [11]  418 	push	bc
   6197 21 08 00      [10]  419 	ld	hl, #8
   619A 39            [11]  420 	add	hl, sp
   619B 4E            [ 7]  421 	ld	c, (hl)
   619C 23            [ 6]  422 	inc	hl
   619D 46            [ 7]  423 	ld	b, (hl)
   619E C5            [11]  424 	push	bc
   619F 21 08 00      [10]  425 	ld	hl, #8
   61A2 39            [11]  426 	add	hl, sp
   61A3 4E            [ 7]  427 	ld	c, (hl)
   61A4 23            [ 6]  428 	inc	hl
   61A5 46            [ 7]  429 	ld	b, (hl)
   61A6 C5            [11]  430 	push	bc
   61A7 CD 6C 40      [17]  431 	call	_lanzarCuchillo
   61AA 21 08 00      [10]  432 	ld	hl,#8
   61AD 39            [11]  433 	add	hl,sp
   61AE F9            [ 6]  434 	ld	sp,hl
   61AF C9            [10]  435 	ret
                            436 ;src/main.c:159: u8 checkCollision(u8 direction) { // check optimization
                            437 ;	---------------------------------
                            438 ; Function checkCollision
                            439 ; ---------------------------------
   61B0                     440 _checkCollision::
   61B0 DD E5         [15]  441 	push	ix
   61B2 DD 21 00 00   [14]  442 	ld	ix,#0
   61B6 DD 39         [15]  443 	add	ix,sp
   61B8 F5            [11]  444 	push	af
                            445 ;src/main.c:160: u8 *headTile=0, *feetTile=0, *waistTile=0;
   61B9 21 00 00      [10]  446 	ld	hl,#0x0000
   61BC E3            [19]  447 	ex	(sp), hl
   61BD 11 00 00      [10]  448 	ld	de,#0x0000
   61C0 01 00 00      [10]  449 	ld	bc,#0x0000
                            450 ;src/main.c:162: switch (direction) {
   61C3 3E 03         [ 7]  451 	ld	a,#0x03
   61C5 DD 96 04      [19]  452 	sub	a, 4 (ix)
   61C8 DA 04 63      [10]  453 	jp	C,00105$
   61CB DD 5E 04      [19]  454 	ld	e,4 (ix)
   61CE 16 00         [ 7]  455 	ld	d,#0x00
   61D0 21 D7 61      [10]  456 	ld	hl,#00124$
   61D3 19            [11]  457 	add	hl,de
   61D4 19            [11]  458 	add	hl,de
   61D5 19            [11]  459 	add	hl,de
   61D6 E9            [ 4]  460 	jp	(hl)
   61D7                     461 00124$:
   61D7 C3 E3 61      [10]  462 	jp	00101$
   61DA C3 3C 62      [10]  463 	jp	00102$
   61DD C3 8C 62      [10]  464 	jp	00103$
   61E0 C3 C9 62      [10]  465 	jp	00104$
                            466 ;src/main.c:163: case 0:
   61E3                     467 00101$:
                            468 ;src/main.c:164: headTile  = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y);
   61E3 21 6A 5F      [10]  469 	ld	hl, #(_prota + 0x0001) + 0
   61E6 4E            [ 7]  470 	ld	c,(hl)
   61E7 3A 69 5F      [13]  471 	ld	a, (#_prota + 0)
   61EA 47            [ 4]  472 	ld	b,a
   61EB 04            [ 4]  473 	inc	b
   61EC 04            [ 4]  474 	inc	b
   61ED 04            [ 4]  475 	inc	b
   61EE 04            [ 4]  476 	inc	b
   61EF 79            [ 4]  477 	ld	a,c
   61F0 F5            [11]  478 	push	af
   61F1 33            [ 6]  479 	inc	sp
   61F2 C5            [11]  480 	push	bc
   61F3 33            [ 6]  481 	inc	sp
   61F4 2A 45 60      [16]  482 	ld	hl,(_mapa)
   61F7 E5            [11]  483 	push	hl
   61F8 CD B5 49      [17]  484 	call	_getTilePtr
   61FB F1            [10]  485 	pop	af
   61FC F1            [10]  486 	pop	af
   61FD 33            [ 6]  487 	inc	sp
   61FE 33            [ 6]  488 	inc	sp
   61FF E5            [11]  489 	push	hl
                            490 ;src/main.c:165: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   6200 3A 6A 5F      [13]  491 	ld	a, (#(_prota + 0x0001) + 0)
   6203 C6 14         [ 7]  492 	add	a, #0x14
   6205 4F            [ 4]  493 	ld	c,a
   6206 21 69 5F      [10]  494 	ld	hl, #_prota + 0
   6209 46            [ 7]  495 	ld	b,(hl)
   620A 04            [ 4]  496 	inc	b
   620B 04            [ 4]  497 	inc	b
   620C 04            [ 4]  498 	inc	b
   620D 04            [ 4]  499 	inc	b
   620E 79            [ 4]  500 	ld	a,c
   620F F5            [11]  501 	push	af
   6210 33            [ 6]  502 	inc	sp
   6211 C5            [11]  503 	push	bc
   6212 33            [ 6]  504 	inc	sp
   6213 2A 45 60      [16]  505 	ld	hl,(_mapa)
   6216 E5            [11]  506 	push	hl
   6217 CD B5 49      [17]  507 	call	_getTilePtr
   621A F1            [10]  508 	pop	af
   621B F1            [10]  509 	pop	af
   621C EB            [ 4]  510 	ex	de,hl
                            511 ;src/main.c:166: waistTile = getTilePtr(mapa, prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   621D 3A 6A 5F      [13]  512 	ld	a, (#(_prota + 0x0001) + 0)
   6220 C6 0B         [ 7]  513 	add	a, #0x0B
   6222 47            [ 4]  514 	ld	b,a
   6223 3A 69 5F      [13]  515 	ld	a, (#_prota + 0)
   6226 C6 04         [ 7]  516 	add	a, #0x04
   6228 D5            [11]  517 	push	de
   6229 C5            [11]  518 	push	bc
   622A 33            [ 6]  519 	inc	sp
   622B F5            [11]  520 	push	af
   622C 33            [ 6]  521 	inc	sp
   622D 2A 45 60      [16]  522 	ld	hl,(_mapa)
   6230 E5            [11]  523 	push	hl
   6231 CD B5 49      [17]  524 	call	_getTilePtr
   6234 F1            [10]  525 	pop	af
   6235 F1            [10]  526 	pop	af
   6236 4D            [ 4]  527 	ld	c,l
   6237 44            [ 4]  528 	ld	b,h
   6238 D1            [10]  529 	pop	de
                            530 ;src/main.c:167: break;
   6239 C3 04 63      [10]  531 	jp	00105$
                            532 ;src/main.c:168: case 1:
   623C                     533 00102$:
                            534 ;src/main.c:169: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
   623C 21 6A 5F      [10]  535 	ld	hl, #(_prota + 0x0001) + 0
   623F 56            [ 7]  536 	ld	d,(hl)
   6240 21 69 5F      [10]  537 	ld	hl, #_prota + 0
   6243 46            [ 7]  538 	ld	b,(hl)
   6244 05            [ 4]  539 	dec	b
   6245 D5            [11]  540 	push	de
   6246 33            [ 6]  541 	inc	sp
   6247 C5            [11]  542 	push	bc
   6248 33            [ 6]  543 	inc	sp
   6249 2A 45 60      [16]  544 	ld	hl,(_mapa)
   624C E5            [11]  545 	push	hl
   624D CD B5 49      [17]  546 	call	_getTilePtr
   6250 F1            [10]  547 	pop	af
   6251 F1            [10]  548 	pop	af
   6252 33            [ 6]  549 	inc	sp
   6253 33            [ 6]  550 	inc	sp
   6254 E5            [11]  551 	push	hl
                            552 ;src/main.c:170: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
   6255 3A 6A 5F      [13]  553 	ld	a, (#(_prota + 0x0001) + 0)
   6258 C6 14         [ 7]  554 	add	a, #0x14
   625A 57            [ 4]  555 	ld	d,a
   625B 21 69 5F      [10]  556 	ld	hl, #_prota + 0
   625E 46            [ 7]  557 	ld	b,(hl)
   625F 05            [ 4]  558 	dec	b
   6260 D5            [11]  559 	push	de
   6261 33            [ 6]  560 	inc	sp
   6262 C5            [11]  561 	push	bc
   6263 33            [ 6]  562 	inc	sp
   6264 2A 45 60      [16]  563 	ld	hl,(_mapa)
   6267 E5            [11]  564 	push	hl
   6268 CD B5 49      [17]  565 	call	_getTilePtr
   626B F1            [10]  566 	pop	af
   626C F1            [10]  567 	pop	af
   626D EB            [ 4]  568 	ex	de,hl
                            569 ;src/main.c:171: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
   626E 3A 6A 5F      [13]  570 	ld	a, (#(_prota + 0x0001) + 0)
   6271 C6 0B         [ 7]  571 	add	a, #0x0B
   6273 47            [ 4]  572 	ld	b,a
   6274 3A 69 5F      [13]  573 	ld	a, (#_prota + 0)
   6277 C6 FF         [ 7]  574 	add	a,#0xFF
   6279 D5            [11]  575 	push	de
   627A C5            [11]  576 	push	bc
   627B 33            [ 6]  577 	inc	sp
   627C F5            [11]  578 	push	af
   627D 33            [ 6]  579 	inc	sp
   627E 2A 45 60      [16]  580 	ld	hl,(_mapa)
   6281 E5            [11]  581 	push	hl
   6282 CD B5 49      [17]  582 	call	_getTilePtr
   6285 F1            [10]  583 	pop	af
   6286 F1            [10]  584 	pop	af
   6287 4D            [ 4]  585 	ld	c,l
   6288 44            [ 4]  586 	ld	b,h
   6289 D1            [10]  587 	pop	de
                            588 ;src/main.c:172: break;
   628A 18 78         [12]  589 	jr	00105$
                            590 ;src/main.c:173: case 2:
   628C                     591 00103$:
                            592 ;src/main.c:174: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
   628C 3A 6A 5F      [13]  593 	ld	a, (#(_prota + 0x0001) + 0)
   628F C6 FE         [ 7]  594 	add	a,#0xFE
   6291 21 69 5F      [10]  595 	ld	hl, #_prota + 0
   6294 56            [ 7]  596 	ld	d,(hl)
   6295 C5            [11]  597 	push	bc
   6296 F5            [11]  598 	push	af
   6297 33            [ 6]  599 	inc	sp
   6298 D5            [11]  600 	push	de
   6299 33            [ 6]  601 	inc	sp
   629A 2A 45 60      [16]  602 	ld	hl,(_mapa)
   629D E5            [11]  603 	push	hl
   629E CD B5 49      [17]  604 	call	_getTilePtr
   62A1 F1            [10]  605 	pop	af
   62A2 F1            [10]  606 	pop	af
   62A3 C1            [10]  607 	pop	bc
   62A4 33            [ 6]  608 	inc	sp
   62A5 33            [ 6]  609 	inc	sp
   62A6 E5            [11]  610 	push	hl
                            611 ;src/main.c:175: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
   62A7 21 6A 5F      [10]  612 	ld	hl, #(_prota + 0x0001) + 0
   62AA 56            [ 7]  613 	ld	d,(hl)
   62AB 15            [ 4]  614 	dec	d
   62AC 15            [ 4]  615 	dec	d
   62AD 3A 69 5F      [13]  616 	ld	a, (#_prota + 0)
   62B0 C6 03         [ 7]  617 	add	a, #0x03
   62B2 C5            [11]  618 	push	bc
   62B3 D5            [11]  619 	push	de
   62B4 33            [ 6]  620 	inc	sp
   62B5 F5            [11]  621 	push	af
   62B6 33            [ 6]  622 	inc	sp
   62B7 2A 45 60      [16]  623 	ld	hl,(_mapa)
   62BA E5            [11]  624 	push	hl
   62BB CD B5 49      [17]  625 	call	_getTilePtr
   62BE F1            [10]  626 	pop	af
   62BF F1            [10]  627 	pop	af
   62C0 EB            [ 4]  628 	ex	de,hl
   62C1 C1            [10]  629 	pop	bc
                            630 ;src/main.c:176: *waistTile = 0;
   62C2 21 00 00      [10]  631 	ld	hl,#0x0000
   62C5 36 00         [10]  632 	ld	(hl),#0x00
                            633 ;src/main.c:177: break;
   62C7 18 3B         [12]  634 	jr	00105$
                            635 ;src/main.c:178: case 3:
   62C9                     636 00104$:
                            637 ;src/main.c:179: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
   62C9 3A 6A 5F      [13]  638 	ld	a, (#(_prota + 0x0001) + 0)
   62CC C6 16         [ 7]  639 	add	a, #0x16
   62CE 21 69 5F      [10]  640 	ld	hl, #_prota + 0
   62D1 56            [ 7]  641 	ld	d,(hl)
   62D2 C5            [11]  642 	push	bc
   62D3 F5            [11]  643 	push	af
   62D4 33            [ 6]  644 	inc	sp
   62D5 D5            [11]  645 	push	de
   62D6 33            [ 6]  646 	inc	sp
   62D7 2A 45 60      [16]  647 	ld	hl,(_mapa)
   62DA E5            [11]  648 	push	hl
   62DB CD B5 49      [17]  649 	call	_getTilePtr
   62DE F1            [10]  650 	pop	af
   62DF F1            [10]  651 	pop	af
   62E0 C1            [10]  652 	pop	bc
   62E1 33            [ 6]  653 	inc	sp
   62E2 33            [ 6]  654 	inc	sp
   62E3 E5            [11]  655 	push	hl
                            656 ;src/main.c:180: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   62E4 3A 6A 5F      [13]  657 	ld	a, (#(_prota + 0x0001) + 0)
   62E7 C6 16         [ 7]  658 	add	a, #0x16
   62E9 57            [ 4]  659 	ld	d,a
   62EA 3A 69 5F      [13]  660 	ld	a, (#_prota + 0)
   62ED C6 03         [ 7]  661 	add	a, #0x03
   62EF C5            [11]  662 	push	bc
   62F0 D5            [11]  663 	push	de
   62F1 33            [ 6]  664 	inc	sp
   62F2 F5            [11]  665 	push	af
   62F3 33            [ 6]  666 	inc	sp
   62F4 2A 45 60      [16]  667 	ld	hl,(_mapa)
   62F7 E5            [11]  668 	push	hl
   62F8 CD B5 49      [17]  669 	call	_getTilePtr
   62FB F1            [10]  670 	pop	af
   62FC F1            [10]  671 	pop	af
   62FD EB            [ 4]  672 	ex	de,hl
   62FE C1            [10]  673 	pop	bc
                            674 ;src/main.c:181: *waistTile = 0;
   62FF 21 00 00      [10]  675 	ld	hl,#0x0000
   6302 36 00         [10]  676 	ld	(hl),#0x00
                            677 ;src/main.c:183: }
   6304                     678 00105$:
                            679 ;src/main.c:185: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   6304 E1            [10]  680 	pop	hl
   6305 E5            [11]  681 	push	hl
   6306 6E            [ 7]  682 	ld	l,(hl)
   6307 3E 02         [ 7]  683 	ld	a,#0x02
   6309 95            [ 4]  684 	sub	a, l
   630A 38 0E         [12]  685 	jr	C,00106$
   630C 1A            [ 7]  686 	ld	a,(de)
   630D 5F            [ 4]  687 	ld	e,a
   630E 3E 02         [ 7]  688 	ld	a,#0x02
   6310 93            [ 4]  689 	sub	a, e
   6311 38 07         [12]  690 	jr	C,00106$
   6313 0A            [ 7]  691 	ld	a,(bc)
   6314 4F            [ 4]  692 	ld	c,a
   6315 3E 02         [ 7]  693 	ld	a,#0x02
   6317 91            [ 4]  694 	sub	a, c
   6318 30 04         [12]  695 	jr	NC,00107$
   631A                     696 00106$:
                            697 ;src/main.c:186: return 1;
   631A 2E 01         [ 7]  698 	ld	l,#0x01
   631C 18 02         [12]  699 	jr	00110$
   631E                     700 00107$:
                            701 ;src/main.c:188: return 0;
   631E 2E 00         [ 7]  702 	ld	l,#0x00
   6320                     703 00110$:
   6320 DD F9         [10]  704 	ld	sp, ix
   6322 DD E1         [14]  705 	pop	ix
   6324 C9            [10]  706 	ret
                            707 ;src/main.c:191: void dibujarEnemigo(TEnemy *enemy) {
                            708 ;	---------------------------------
                            709 ; Function dibujarEnemigo
                            710 ; ---------------------------------
   6325                     711 _dibujarEnemigo::
   6325 DD E5         [15]  712 	push	ix
   6327 DD 21 00 00   [14]  713 	ld	ix,#0
   632B DD 39         [15]  714 	add	ix,sp
                            715 ;src/main.c:192: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   632D DD 4E 04      [19]  716 	ld	c,4 (ix)
   6330 DD 46 05      [19]  717 	ld	b,5 (ix)
   6333 69            [ 4]  718 	ld	l, c
   6334 60            [ 4]  719 	ld	h, b
   6335 23            [ 6]  720 	inc	hl
   6336 56            [ 7]  721 	ld	d,(hl)
   6337 0A            [ 7]  722 	ld	a,(bc)
   6338 C5            [11]  723 	push	bc
   6339 D5            [11]  724 	push	de
   633A 33            [ 6]  725 	inc	sp
   633B F5            [11]  726 	push	af
   633C 33            [ 6]  727 	inc	sp
   633D 21 00 C0      [10]  728 	ld	hl,#0xC000
   6340 E5            [11]  729 	push	hl
   6341 CD 9E 5E      [17]  730 	call	_cpct_getScreenPtr
   6344 EB            [ 4]  731 	ex	de,hl
                            732 ;src/main.c:193: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   6345 E1            [10]  733 	pop	hl
   6346 01 04 00      [10]  734 	ld	bc, #0x0004
   6349 09            [11]  735 	add	hl, bc
   634A 4E            [ 7]  736 	ld	c,(hl)
   634B 23            [ 6]  737 	inc	hl
   634C 46            [ 7]  738 	ld	b,(hl)
   634D 21 00 01      [10]  739 	ld	hl,#_g_tablatrans
   6350 E5            [11]  740 	push	hl
   6351 21 04 16      [10]  741 	ld	hl,#0x1604
   6354 E5            [11]  742 	push	hl
   6355 D5            [11]  743 	push	de
   6356 C5            [11]  744 	push	bc
   6357 CD BE 5E      [17]  745 	call	_cpct_drawSpriteMaskedAlignedTable
   635A DD E1         [14]  746 	pop	ix
   635C C9            [10]  747 	ret
                            748 ;src/main.c:196: void dibujarExplosion(TEnemy *enemy) {
                            749 ;	---------------------------------
                            750 ; Function dibujarExplosion
                            751 ; ---------------------------------
   635D                     752 _dibujarExplosion::
   635D DD E5         [15]  753 	push	ix
   635F DD 21 00 00   [14]  754 	ld	ix,#0
   6363 DD 39         [15]  755 	add	ix,sp
                            756 ;src/main.c:197: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   6365 DD 4E 04      [19]  757 	ld	c,4 (ix)
   6368 DD 46 05      [19]  758 	ld	b,5 (ix)
   636B 69            [ 4]  759 	ld	l, c
   636C 60            [ 4]  760 	ld	h, b
   636D 23            [ 6]  761 	inc	hl
   636E 56            [ 7]  762 	ld	d,(hl)
   636F 0A            [ 7]  763 	ld	a,(bc)
   6370 47            [ 4]  764 	ld	b,a
   6371 D5            [11]  765 	push	de
   6372 33            [ 6]  766 	inc	sp
   6373 C5            [11]  767 	push	bc
   6374 33            [ 6]  768 	inc	sp
   6375 21 00 C0      [10]  769 	ld	hl,#0xC000
   6378 E5            [11]  770 	push	hl
   6379 CD 9E 5E      [17]  771 	call	_cpct_getScreenPtr
   637C 4D            [ 4]  772 	ld	c,l
   637D 44            [ 4]  773 	ld	b,h
                            774 ;src/main.c:198: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   637E 11 00 01      [10]  775 	ld	de,#_g_tablatrans+0
   6381 D5            [11]  776 	push	de
   6382 21 04 16      [10]  777 	ld	hl,#0x1604
   6385 E5            [11]  778 	push	hl
   6386 C5            [11]  779 	push	bc
   6387 21 70 19      [10]  780 	ld	hl,#_g_explosion
   638A E5            [11]  781 	push	hl
   638B CD BE 5E      [17]  782 	call	_cpct_drawSpriteMaskedAlignedTable
   638E DD E1         [14]  783 	pop	ix
   6390 C9            [10]  784 	ret
                            785 ;src/main.c:201: void borrarExplosion(TEnemy *enemy) {
                            786 ;	---------------------------------
                            787 ; Function borrarExplosion
                            788 ; ---------------------------------
   6391                     789 _borrarExplosion::
   6391 DD E5         [15]  790 	push	ix
   6393 DD 21 00 00   [14]  791 	ld	ix,#0
   6397 DD 39         [15]  792 	add	ix,sp
   6399 F5            [11]  793 	push	af
   639A 3B            [ 6]  794 	dec	sp
                            795 ;src/main.c:204: u8 w = 4 + (enemy->px & 1);
   639B DD 5E 04      [19]  796 	ld	e,4 (ix)
   639E DD 56 05      [19]  797 	ld	d,5 (ix)
   63A1 6B            [ 4]  798 	ld	l, e
   63A2 62            [ 4]  799 	ld	h, d
   63A3 23            [ 6]  800 	inc	hl
   63A4 23            [ 6]  801 	inc	hl
   63A5 4E            [ 7]  802 	ld	c,(hl)
   63A6 79            [ 4]  803 	ld	a,c
   63A7 E6 01         [ 7]  804 	and	a, #0x01
   63A9 47            [ 4]  805 	ld	b,a
   63AA 04            [ 4]  806 	inc	b
   63AB 04            [ 4]  807 	inc	b
   63AC 04            [ 4]  808 	inc	b
   63AD 04            [ 4]  809 	inc	b
                            810 ;src/main.c:207: u8 h = 6 + (enemy->py & 2 ? 1 : 0);
   63AE EB            [ 4]  811 	ex	de,hl
   63AF 23            [ 6]  812 	inc	hl
   63B0 23            [ 6]  813 	inc	hl
   63B1 23            [ 6]  814 	inc	hl
   63B2 5E            [ 7]  815 	ld	e,(hl)
   63B3 CB 4B         [ 8]  816 	bit	1, e
   63B5 28 04         [12]  817 	jr	Z,00103$
   63B7 3E 01         [ 7]  818 	ld	a,#0x01
   63B9 18 02         [12]  819 	jr	00104$
   63BB                     820 00103$:
   63BB 3E 00         [ 7]  821 	ld	a,#0x00
   63BD                     822 00104$:
   63BD C6 06         [ 7]  823 	add	a, #0x06
   63BF DD 77 FD      [19]  824 	ld	-3 (ix),a
                            825 ;src/main.c:209: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   63C2 FD 2A 45 60   [20]  826 	ld	iy,(_mapa)
   63C6 16 00         [ 7]  827 	ld	d,#0x00
   63C8 7B            [ 4]  828 	ld	a,e
   63C9 C6 E8         [ 7]  829 	add	a,#0xE8
   63CB DD 77 FE      [19]  830 	ld	-2 (ix),a
   63CE 7A            [ 4]  831 	ld	a,d
   63CF CE FF         [ 7]  832 	adc	a,#0xFF
   63D1 DD 77 FF      [19]  833 	ld	-1 (ix),a
   63D4 DD 6E FE      [19]  834 	ld	l,-2 (ix)
   63D7 DD 66 FF      [19]  835 	ld	h,-1 (ix)
   63DA DD CB FF 7E   [20]  836 	bit	7, -1 (ix)
   63DE 28 04         [12]  837 	jr	Z,00105$
   63E0 21 EB FF      [10]  838 	ld	hl,#0xFFEB
   63E3 19            [11]  839 	add	hl,de
   63E4                     840 00105$:
   63E4 CB 2C         [ 8]  841 	sra	h
   63E6 CB 1D         [ 8]  842 	rr	l
   63E8 CB 2C         [ 8]  843 	sra	h
   63EA CB 1D         [ 8]  844 	rr	l
   63EC 55            [ 4]  845 	ld	d,l
   63ED CB 39         [ 8]  846 	srl	c
   63EF FD E5         [15]  847 	push	iy
   63F1 21 F0 C0      [10]  848 	ld	hl,#0xC0F0
   63F4 E5            [11]  849 	push	hl
   63F5 3E 28         [ 7]  850 	ld	a,#0x28
   63F7 F5            [11]  851 	push	af
   63F8 33            [ 6]  852 	inc	sp
   63F9 DD 7E FD      [19]  853 	ld	a,-3 (ix)
   63FC F5            [11]  854 	push	af
   63FD 33            [ 6]  855 	inc	sp
   63FE C5            [11]  856 	push	bc
   63FF 33            [ 6]  857 	inc	sp
   6400 D5            [11]  858 	push	de
   6401 33            [ 6]  859 	inc	sp
   6402 79            [ 4]  860 	ld	a,c
   6403 F5            [11]  861 	push	af
   6404 33            [ 6]  862 	inc	sp
   6405 CD 80 53      [17]  863 	call	_cpct_etm_drawTileBox2x4
   6408 DD F9         [10]  864 	ld	sp, ix
   640A DD E1         [14]  865 	pop	ix
   640C C9            [10]  866 	ret
                            867 ;src/main.c:213: void borrarEnemigo(u8 x, u8 y) {
                            868 ;	---------------------------------
                            869 ; Function borrarEnemigo
                            870 ; ---------------------------------
   640D                     871 _borrarEnemigo::
   640D DD E5         [15]  872 	push	ix
   640F DD 21 00 00   [14]  873 	ld	ix,#0
   6413 DD 39         [15]  874 	add	ix,sp
   6415 F5            [11]  875 	push	af
   6416 F5            [11]  876 	push	af
                            877 ;src/main.c:217: u8 w = 4 + (x & 1);
   6417 DD 7E 04      [19]  878 	ld	a,4 (ix)
   641A E6 01         [ 7]  879 	and	a, #0x01
   641C 5F            [ 4]  880 	ld	e,a
   641D 1C            [ 4]  881 	inc	e
   641E 1C            [ 4]  882 	inc	e
   641F 1C            [ 4]  883 	inc	e
   6420 1C            [ 4]  884 	inc	e
                            885 ;src/main.c:220: u8 h = 6 + (y & 3 ? 1 : 0);
   6421 DD 7E 05      [19]  886 	ld	a,5 (ix)
   6424 E6 03         [ 7]  887 	and	a, #0x03
   6426 28 04         [12]  888 	jr	Z,00103$
   6428 3E 01         [ 7]  889 	ld	a,#0x01
   642A 18 02         [12]  890 	jr	00104$
   642C                     891 00103$:
   642C 3E 00         [ 7]  892 	ld	a,#0x00
   642E                     893 00104$:
   642E C6 06         [ 7]  894 	add	a, #0x06
   6430 57            [ 4]  895 	ld	d,a
                            896 ;src/main.c:222: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   6431 2A 45 60      [16]  897 	ld	hl,(_mapa)
   6434 E3            [19]  898 	ex	(sp), hl
   6435 DD 4E 05      [19]  899 	ld	c,5 (ix)
   6438 06 00         [ 7]  900 	ld	b,#0x00
   643A 79            [ 4]  901 	ld	a,c
   643B C6 E8         [ 7]  902 	add	a,#0xE8
   643D DD 77 FE      [19]  903 	ld	-2 (ix),a
   6440 78            [ 4]  904 	ld	a,b
   6441 CE FF         [ 7]  905 	adc	a,#0xFF
   6443 DD 77 FF      [19]  906 	ld	-1 (ix),a
   6446 DD 6E FE      [19]  907 	ld	l,-2 (ix)
   6449 DD 66 FF      [19]  908 	ld	h,-1 (ix)
   644C DD CB FF 7E   [20]  909 	bit	7, -1 (ix)
   6450 28 04         [12]  910 	jr	Z,00105$
   6452 21 EB FF      [10]  911 	ld	hl,#0xFFEB
   6455 09            [11]  912 	add	hl,bc
   6456                     913 00105$:
   6456 CB 2C         [ 8]  914 	sra	h
   6458 CB 1D         [ 8]  915 	rr	l
   645A CB 2C         [ 8]  916 	sra	h
   645C CB 1D         [ 8]  917 	rr	l
   645E 45            [ 4]  918 	ld	b,l
   645F DD 4E 04      [19]  919 	ld	c,4 (ix)
   6462 CB 39         [ 8]  920 	srl	c
   6464 E1            [10]  921 	pop	hl
   6465 E5            [11]  922 	push	hl
   6466 E5            [11]  923 	push	hl
   6467 21 F0 C0      [10]  924 	ld	hl,#0xC0F0
   646A E5            [11]  925 	push	hl
   646B 3E 28         [ 7]  926 	ld	a,#0x28
   646D F5            [11]  927 	push	af
   646E 33            [ 6]  928 	inc	sp
   646F D5            [11]  929 	push	de
   6470 C5            [11]  930 	push	bc
   6471 CD 80 53      [17]  931 	call	_cpct_etm_drawTileBox2x4
                            932 ;src/main.c:224: enemy->mover = NO;
   6474 21 FF 5E      [10]  933 	ld	hl,#(_enemy + 0x0006)
   6477 36 00         [10]  934 	ld	(hl),#0x00
   6479 DD F9         [10]  935 	ld	sp, ix
   647B DD E1         [14]  936 	pop	ix
   647D C9            [10]  937 	ret
                            938 ;src/main.c:227: void redibujarEnemigo(u8 x, u8 y, TEnemy *enemy) {
                            939 ;	---------------------------------
                            940 ; Function redibujarEnemigo
                            941 ; ---------------------------------
   647E                     942 _redibujarEnemigo::
   647E DD E5         [15]  943 	push	ix
   6480 DD 21 00 00   [14]  944 	ld	ix,#0
   6484 DD 39         [15]  945 	add	ix,sp
                            946 ;src/main.c:228: borrarEnemigo(x, y);
   6486 DD 66 05      [19]  947 	ld	h,5 (ix)
   6489 DD 6E 04      [19]  948 	ld	l,4 (ix)
   648C E5            [11]  949 	push	hl
   648D CD 0D 64      [17]  950 	call	_borrarEnemigo
   6490 F1            [10]  951 	pop	af
                            952 ;src/main.c:229: enemy->px = enemy->x;
   6491 DD 4E 06      [19]  953 	ld	c,6 (ix)
   6494 DD 46 07      [19]  954 	ld	b,7 (ix)
   6497 59            [ 4]  955 	ld	e, c
   6498 50            [ 4]  956 	ld	d, b
   6499 13            [ 6]  957 	inc	de
   649A 13            [ 6]  958 	inc	de
   649B 0A            [ 7]  959 	ld	a,(bc)
   649C 12            [ 7]  960 	ld	(de),a
                            961 ;src/main.c:230: enemy->py = enemy->y;
   649D 59            [ 4]  962 	ld	e, c
   649E 50            [ 4]  963 	ld	d, b
   649F 13            [ 6]  964 	inc	de
   64A0 13            [ 6]  965 	inc	de
   64A1 13            [ 6]  966 	inc	de
   64A2 69            [ 4]  967 	ld	l, c
   64A3 60            [ 4]  968 	ld	h, b
   64A4 23            [ 6]  969 	inc	hl
   64A5 7E            [ 7]  970 	ld	a,(hl)
   64A6 12            [ 7]  971 	ld	(de),a
                            972 ;src/main.c:231: dibujarEnemigo(enemy);
   64A7 C5            [11]  973 	push	bc
   64A8 CD 25 63      [17]  974 	call	_dibujarEnemigo
   64AB F1            [10]  975 	pop	af
   64AC DD E1         [14]  976 	pop	ix
   64AE C9            [10]  977 	ret
                            978 ;src/main.c:234: u8 checkEnemyCollision(u8 direction, TEnemy *enemy){
                            979 ;	---------------------------------
                            980 ; Function checkEnemyCollision
                            981 ; ---------------------------------
   64AF                     982 _checkEnemyCollision::
   64AF DD E5         [15]  983 	push	ix
   64B1 DD 21 00 00   [14]  984 	ld	ix,#0
   64B5 DD 39         [15]  985 	add	ix,sp
   64B7 21 F7 FF      [10]  986 	ld	hl,#-9
   64BA 39            [11]  987 	add	hl,sp
   64BB F9            [ 6]  988 	ld	sp,hl
                            989 ;src/main.c:236: u8 colisiona = 1;
   64BC DD 36 F7 01   [19]  990 	ld	-9 (ix),#0x01
                            991 ;src/main.c:238: switch (direction) {
   64C0 3E 03         [ 7]  992 	ld	a,#0x03
   64C2 DD 96 04      [19]  993 	sub	a, 4 (ix)
   64C5 DA A2 68      [10]  994 	jp	C,00165$
                            995 ;src/main.c:240: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   64C8 DD 4E 05      [19]  996 	ld	c,5 (ix)
   64CB DD 46 06      [19]  997 	ld	b,6 (ix)
   64CE 0A            [ 7]  998 	ld	a,(bc)
   64CF 5F            [ 4]  999 	ld	e,a
   64D0 21 01 00      [10] 1000 	ld	hl,#0x0001
   64D3 09            [11] 1001 	add	hl,bc
   64D4 DD 75 F8      [19] 1002 	ld	-8 (ix),l
   64D7 DD 74 F9      [19] 1003 	ld	-7 (ix),h
   64DA DD 6E F8      [19] 1004 	ld	l,-8 (ix)
   64DD DD 66 F9      [19] 1005 	ld	h,-7 (ix)
   64E0 56            [ 7] 1006 	ld	d,(hl)
                           1007 ;src/main.c:253: enemy->muerto = SI;
   64E1 21 08 00      [10] 1008 	ld	hl,#0x0008
   64E4 09            [11] 1009 	add	hl,bc
   64E5 DD 75 FA      [19] 1010 	ld	-6 (ix),l
   64E8 DD 74 FB      [19] 1011 	ld	-5 (ix),h
                           1012 ;src/main.c:260: enemy->mira = M_izquierda;
   64EB 21 07 00      [10] 1013 	ld	hl,#0x0007
   64EE 09            [11] 1014 	add	hl,bc
   64EF DD 75 FC      [19] 1015 	ld	-4 (ix),l
   64F2 DD 74 FD      [19] 1016 	ld	-3 (ix),h
                           1017 ;src/main.c:238: switch (direction) {
   64F5 D5            [11] 1018 	push	de
   64F6 DD 5E 04      [19] 1019 	ld	e,4 (ix)
   64F9 16 00         [ 7] 1020 	ld	d,#0x00
   64FB 21 03 65      [10] 1021 	ld	hl,#00268$
   64FE 19            [11] 1022 	add	hl,de
   64FF 19            [11] 1023 	add	hl,de
   6500 19            [11] 1024 	add	hl,de
   6501 D1            [10] 1025 	pop	de
   6502 E9            [ 4] 1026 	jp	(hl)
   6503                    1027 00268$:
   6503 C3 0F 65      [10] 1028 	jp	00101$
   6506 C3 F7 65      [10] 1029 	jp	00117$
   6509 C3 DB 66      [10] 1030 	jp	00133$
   650C C3 B9 67      [10] 1031 	jp	00149$
                           1032 ;src/main.c:239: case 0:
   650F                    1033 00101$:
                           1034 ;src/main.c:240: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   650F 7B            [ 4] 1035 	ld	a,e
   6510 C6 05         [ 7] 1036 	add	a, #0x05
   6512 C5            [11] 1037 	push	bc
   6513 D5            [11] 1038 	push	de
   6514 33            [ 6] 1039 	inc	sp
   6515 F5            [11] 1040 	push	af
   6516 33            [ 6] 1041 	inc	sp
   6517 2A 45 60      [16] 1042 	ld	hl,(_mapa)
   651A E5            [11] 1043 	push	hl
   651B CD B5 49      [17] 1044 	call	_getTilePtr
   651E F1            [10] 1045 	pop	af
   651F F1            [10] 1046 	pop	af
   6520 C1            [10] 1047 	pop	bc
   6521 5E            [ 7] 1048 	ld	e,(hl)
   6522 3E 02         [ 7] 1049 	ld	a,#0x02
   6524 93            [ 4] 1050 	sub	a, e
   6525 DA EC 65      [10] 1051 	jp	C,00113$
                           1052 ;src/main.c:241: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   6528 DD 6E F8      [19] 1053 	ld	l,-8 (ix)
   652B DD 66 F9      [19] 1054 	ld	h,-7 (ix)
   652E 7E            [ 7] 1055 	ld	a,(hl)
   652F C6 0B         [ 7] 1056 	add	a, #0x0B
   6531 57            [ 4] 1057 	ld	d,a
   6532 0A            [ 7] 1058 	ld	a,(bc)
   6533 C6 05         [ 7] 1059 	add	a, #0x05
   6535 C5            [11] 1060 	push	bc
   6536 D5            [11] 1061 	push	de
   6537 33            [ 6] 1062 	inc	sp
   6538 F5            [11] 1063 	push	af
   6539 33            [ 6] 1064 	inc	sp
   653A 2A 45 60      [16] 1065 	ld	hl,(_mapa)
   653D E5            [11] 1066 	push	hl
   653E CD B5 49      [17] 1067 	call	_getTilePtr
   6541 F1            [10] 1068 	pop	af
   6542 F1            [10] 1069 	pop	af
   6543 C1            [10] 1070 	pop	bc
   6544 5E            [ 7] 1071 	ld	e,(hl)
   6545 3E 02         [ 7] 1072 	ld	a,#0x02
   6547 93            [ 4] 1073 	sub	a, e
   6548 DA EC 65      [10] 1074 	jp	C,00113$
                           1075 ;src/main.c:242: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   654B DD 6E F8      [19] 1076 	ld	l,-8 (ix)
   654E DD 66 F9      [19] 1077 	ld	h,-7 (ix)
   6551 7E            [ 7] 1078 	ld	a,(hl)
   6552 C6 16         [ 7] 1079 	add	a, #0x16
   6554 57            [ 4] 1080 	ld	d,a
   6555 0A            [ 7] 1081 	ld	a,(bc)
   6556 C6 05         [ 7] 1082 	add	a, #0x05
   6558 C5            [11] 1083 	push	bc
   6559 D5            [11] 1084 	push	de
   655A 33            [ 6] 1085 	inc	sp
   655B F5            [11] 1086 	push	af
   655C 33            [ 6] 1087 	inc	sp
   655D 2A 45 60      [16] 1088 	ld	hl,(_mapa)
   6560 E5            [11] 1089 	push	hl
   6561 CD B5 49      [17] 1090 	call	_getTilePtr
   6564 F1            [10] 1091 	pop	af
   6565 F1            [10] 1092 	pop	af
   6566 C1            [10] 1093 	pop	bc
   6567 5E            [ 7] 1094 	ld	e,(hl)
   6568 3E 02         [ 7] 1095 	ld	a,#0x02
   656A 93            [ 4] 1096 	sub	a, e
   656B DA EC 65      [10] 1097 	jp	C,00113$
                           1098 ;src/main.c:244: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   656E 21 72 5F      [10] 1099 	ld	hl, #_cu + 1
   6571 5E            [ 7] 1100 	ld	e,(hl)
   6572 16 00         [ 7] 1101 	ld	d,#0x00
   6574 21 04 00      [10] 1102 	ld	hl,#0x0004
   6577 19            [11] 1103 	add	hl,de
   6578 DD 75 FE      [19] 1104 	ld	-2 (ix),l
   657B DD 74 FF      [19] 1105 	ld	-1 (ix),h
   657E DD 6E F8      [19] 1106 	ld	l,-8 (ix)
   6581 DD 66 F9      [19] 1107 	ld	h,-7 (ix)
   6584 6E            [ 7] 1108 	ld	l,(hl)
   6585 26 00         [ 7] 1109 	ld	h,#0x00
   6587 DD 7E FE      [19] 1110 	ld	a,-2 (ix)
   658A 95            [ 4] 1111 	sub	a, l
   658B DD 7E FF      [19] 1112 	ld	a,-1 (ix)
   658E 9C            [ 4] 1113 	sbc	a, h
   658F E2 94 65      [10] 1114 	jp	PO, 00269$
   6592 EE 80         [ 7] 1115 	xor	a, #0x80
   6594                    1116 00269$:
   6594 FA A9 65      [10] 1117 	jp	M,00108$
   6597 D5            [11] 1118 	push	de
   6598 11 16 00      [10] 1119 	ld	de,#0x0016
   659B 19            [11] 1120 	add	hl, de
   659C D1            [10] 1121 	pop	de
   659D 7D            [ 4] 1122 	ld	a,l
   659E 93            [ 4] 1123 	sub	a, e
   659F 7C            [ 4] 1124 	ld	a,h
   65A0 9A            [ 4] 1125 	sbc	a, d
   65A1 E2 A6 65      [10] 1126 	jp	PO, 00270$
   65A4 EE 80         [ 7] 1127 	xor	a, #0x80
   65A6                    1128 00270$:
   65A6 F2 B0 65      [10] 1129 	jp	P,00109$
   65A9                    1130 00108$:
                           1131 ;src/main.c:245: colisiona = 0;
   65A9 DD 36 F7 00   [19] 1132 	ld	-9 (ix),#0x00
   65AD C3 A2 68      [10] 1133 	jp	00165$
   65B0                    1134 00109$:
                           1135 ;src/main.c:248: if(cu.x > enemy->x){ //si el cu esta abajo
   65B0 21 71 5F      [10] 1136 	ld	hl, #_cu + 0
   65B3 5E            [ 7] 1137 	ld	e,(hl)
   65B4 0A            [ 7] 1138 	ld	a,(bc)
   65B5 4F            [ 4] 1139 	ld	c,a
   65B6 93            [ 4] 1140 	sub	a, e
   65B7 30 2C         [12] 1141 	jr	NC,00106$
                           1142 ;src/main.c:249: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
   65B9 6B            [ 4] 1143 	ld	l,e
   65BA 26 00         [ 7] 1144 	ld	h,#0x00
   65BC 06 00         [ 7] 1145 	ld	b,#0x00
   65BE 03            [ 6] 1146 	inc	bc
   65BF 03            [ 6] 1147 	inc	bc
   65C0 03            [ 6] 1148 	inc	bc
   65C1 03            [ 6] 1149 	inc	bc
   65C2 BF            [ 4] 1150 	cp	a, a
   65C3 ED 42         [15] 1151 	sbc	hl, bc
   65C5 3E 01         [ 7] 1152 	ld	a,#0x01
   65C7 BD            [ 4] 1153 	cp	a, l
   65C8 3E 00         [ 7] 1154 	ld	a,#0x00
   65CA 9C            [ 4] 1155 	sbc	a, h
   65CB E2 D0 65      [10] 1156 	jp	PO, 00271$
   65CE EE 80         [ 7] 1157 	xor	a, #0x80
   65D0                    1158 00271$:
   65D0 F2 DA 65      [10] 1159 	jp	P,00103$
                           1160 ;src/main.c:250: colisiona = 0;
   65D3 DD 36 F7 00   [19] 1161 	ld	-9 (ix),#0x00
   65D7 C3 A2 68      [10] 1162 	jp	00165$
   65DA                    1163 00103$:
                           1164 ;src/main.c:253: enemy->muerto = SI;
   65DA DD 6E FA      [19] 1165 	ld	l,-6 (ix)
   65DD DD 66 FB      [19] 1166 	ld	h,-5 (ix)
   65E0 36 01         [10] 1167 	ld	(hl),#0x01
   65E2 C3 A2 68      [10] 1168 	jp	00165$
   65E5                    1169 00106$:
                           1170 ;src/main.c:256: colisiona = 0;
   65E5 DD 36 F7 00   [19] 1171 	ld	-9 (ix),#0x00
   65E9 C3 A2 68      [10] 1172 	jp	00165$
   65EC                    1173 00113$:
                           1174 ;src/main.c:260: enemy->mira = M_izquierda;
   65EC DD 6E FC      [19] 1175 	ld	l,-4 (ix)
   65EF DD 66 FD      [19] 1176 	ld	h,-3 (ix)
   65F2 36 01         [10] 1177 	ld	(hl),#0x01
                           1178 ;src/main.c:262: break;
   65F4 C3 A2 68      [10] 1179 	jp	00165$
                           1180 ;src/main.c:263: case 1:
   65F7                    1181 00117$:
                           1182 ;src/main.c:264: if( *getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   65F7 1D            [ 4] 1183 	dec	e
   65F8 C5            [11] 1184 	push	bc
   65F9 D5            [11] 1185 	push	de
   65FA 2A 45 60      [16] 1186 	ld	hl,(_mapa)
   65FD E5            [11] 1187 	push	hl
   65FE CD B5 49      [17] 1188 	call	_getTilePtr
   6601 F1            [10] 1189 	pop	af
   6602 F1            [10] 1190 	pop	af
   6603 C1            [10] 1191 	pop	bc
   6604 5E            [ 7] 1192 	ld	e,(hl)
   6605 3E 02         [ 7] 1193 	ld	a,#0x02
   6607 93            [ 4] 1194 	sub	a, e
   6608 DA D0 66      [10] 1195 	jp	C,00129$
                           1196 ;src/main.c:265: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   660B DD 6E F8      [19] 1197 	ld	l,-8 (ix)
   660E DD 66 F9      [19] 1198 	ld	h,-7 (ix)
   6611 7E            [ 7] 1199 	ld	a,(hl)
   6612 C6 0B         [ 7] 1200 	add	a, #0x0B
   6614 57            [ 4] 1201 	ld	d,a
   6615 0A            [ 7] 1202 	ld	a,(bc)
   6616 C6 FF         [ 7] 1203 	add	a,#0xFF
   6618 C5            [11] 1204 	push	bc
   6619 D5            [11] 1205 	push	de
   661A 33            [ 6] 1206 	inc	sp
   661B F5            [11] 1207 	push	af
   661C 33            [ 6] 1208 	inc	sp
   661D 2A 45 60      [16] 1209 	ld	hl,(_mapa)
   6620 E5            [11] 1210 	push	hl
   6621 CD B5 49      [17] 1211 	call	_getTilePtr
   6624 F1            [10] 1212 	pop	af
   6625 F1            [10] 1213 	pop	af
   6626 C1            [10] 1214 	pop	bc
   6627 5E            [ 7] 1215 	ld	e,(hl)
   6628 3E 02         [ 7] 1216 	ld	a,#0x02
   662A 93            [ 4] 1217 	sub	a, e
   662B DA D0 66      [10] 1218 	jp	C,00129$
                           1219 ;src/main.c:266: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   662E DD 6E F8      [19] 1220 	ld	l,-8 (ix)
   6631 DD 66 F9      [19] 1221 	ld	h,-7 (ix)
   6634 7E            [ 7] 1222 	ld	a,(hl)
   6635 C6 16         [ 7] 1223 	add	a, #0x16
   6637 57            [ 4] 1224 	ld	d,a
   6638 0A            [ 7] 1225 	ld	a,(bc)
   6639 C6 FF         [ 7] 1226 	add	a,#0xFF
   663B C5            [11] 1227 	push	bc
   663C D5            [11] 1228 	push	de
   663D 33            [ 6] 1229 	inc	sp
   663E F5            [11] 1230 	push	af
   663F 33            [ 6] 1231 	inc	sp
   6640 2A 45 60      [16] 1232 	ld	hl,(_mapa)
   6643 E5            [11] 1233 	push	hl
   6644 CD B5 49      [17] 1234 	call	_getTilePtr
   6647 F1            [10] 1235 	pop	af
   6648 F1            [10] 1236 	pop	af
   6649 C1            [10] 1237 	pop	bc
   664A 5E            [ 7] 1238 	ld	e,(hl)
   664B 3E 02         [ 7] 1239 	ld	a,#0x02
   664D 93            [ 4] 1240 	sub	a, e
   664E DA D0 66      [10] 1241 	jp	C,00129$
                           1242 ;src/main.c:268: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   6651 21 72 5F      [10] 1243 	ld	hl, #_cu + 1
   6654 5E            [ 7] 1244 	ld	e,(hl)
   6655 16 00         [ 7] 1245 	ld	d,#0x00
   6657 21 04 00      [10] 1246 	ld	hl,#0x0004
   665A 19            [11] 1247 	add	hl,de
   665B DD 75 FE      [19] 1248 	ld	-2 (ix),l
   665E DD 74 FF      [19] 1249 	ld	-1 (ix),h
   6661 DD 6E F8      [19] 1250 	ld	l,-8 (ix)
   6664 DD 66 F9      [19] 1251 	ld	h,-7 (ix)
   6667 6E            [ 7] 1252 	ld	l,(hl)
   6668 26 00         [ 7] 1253 	ld	h,#0x00
   666A DD 7E FE      [19] 1254 	ld	a,-2 (ix)
   666D 95            [ 4] 1255 	sub	a, l
   666E DD 7E FF      [19] 1256 	ld	a,-1 (ix)
   6671 9C            [ 4] 1257 	sbc	a, h
   6672 E2 77 66      [10] 1258 	jp	PO, 00272$
   6675 EE 80         [ 7] 1259 	xor	a, #0x80
   6677                    1260 00272$:
   6677 FA 8C 66      [10] 1261 	jp	M,00124$
   667A D5            [11] 1262 	push	de
   667B 11 16 00      [10] 1263 	ld	de,#0x0016
   667E 19            [11] 1264 	add	hl, de
   667F D1            [10] 1265 	pop	de
   6680 7D            [ 4] 1266 	ld	a,l
   6681 93            [ 4] 1267 	sub	a, e
   6682 7C            [ 4] 1268 	ld	a,h
   6683 9A            [ 4] 1269 	sbc	a, d
   6684 E2 89 66      [10] 1270 	jp	PO, 00273$
   6687 EE 80         [ 7] 1271 	xor	a, #0x80
   6689                    1272 00273$:
   6689 F2 93 66      [10] 1273 	jp	P,00125$
   668C                    1274 00124$:
                           1275 ;src/main.c:269: colisiona = 0;
   668C DD 36 F7 00   [19] 1276 	ld	-9 (ix),#0x00
   6690 C3 A2 68      [10] 1277 	jp	00165$
   6693                    1278 00125$:
                           1279 ;src/main.c:272: if(enemy->x > cu.x){ //si el cu esta abajo
   6693 0A            [ 7] 1280 	ld	a,(bc)
   6694 5F            [ 4] 1281 	ld	e,a
   6695 21 71 5F      [10] 1282 	ld	hl, #_cu + 0
   6698 4E            [ 7] 1283 	ld	c,(hl)
   6699 79            [ 4] 1284 	ld	a,c
   669A 93            [ 4] 1285 	sub	a, e
   669B 30 2C         [12] 1286 	jr	NC,00122$
                           1287 ;src/main.c:273: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
   669D 6B            [ 4] 1288 	ld	l,e
   669E 26 00         [ 7] 1289 	ld	h,#0x00
   66A0 06 00         [ 7] 1290 	ld	b,#0x00
   66A2 03            [ 6] 1291 	inc	bc
   66A3 03            [ 6] 1292 	inc	bc
   66A4 03            [ 6] 1293 	inc	bc
   66A5 03            [ 6] 1294 	inc	bc
   66A6 BF            [ 4] 1295 	cp	a, a
   66A7 ED 42         [15] 1296 	sbc	hl, bc
   66A9 3E 01         [ 7] 1297 	ld	a,#0x01
   66AB BD            [ 4] 1298 	cp	a, l
   66AC 3E 00         [ 7] 1299 	ld	a,#0x00
   66AE 9C            [ 4] 1300 	sbc	a, h
   66AF E2 B4 66      [10] 1301 	jp	PO, 00274$
   66B2 EE 80         [ 7] 1302 	xor	a, #0x80
   66B4                    1303 00274$:
   66B4 F2 BE 66      [10] 1304 	jp	P,00119$
                           1305 ;src/main.c:274: colisiona = 0;
   66B7 DD 36 F7 00   [19] 1306 	ld	-9 (ix),#0x00
   66BB C3 A2 68      [10] 1307 	jp	00165$
   66BE                    1308 00119$:
                           1309 ;src/main.c:277: enemy->muerto = SI;
   66BE DD 6E FA      [19] 1310 	ld	l,-6 (ix)
   66C1 DD 66 FB      [19] 1311 	ld	h,-5 (ix)
   66C4 36 01         [10] 1312 	ld	(hl),#0x01
   66C6 C3 A2 68      [10] 1313 	jp	00165$
   66C9                    1314 00122$:
                           1315 ;src/main.c:280: colisiona = 0;
   66C9 DD 36 F7 00   [19] 1316 	ld	-9 (ix),#0x00
   66CD C3 A2 68      [10] 1317 	jp	00165$
   66D0                    1318 00129$:
                           1319 ;src/main.c:284: enemy->mira = M_derecha;
   66D0 DD 6E FC      [19] 1320 	ld	l,-4 (ix)
   66D3 DD 66 FD      [19] 1321 	ld	h,-3 (ix)
   66D6 36 00         [10] 1322 	ld	(hl),#0x00
                           1323 ;src/main.c:286: break;
   66D8 C3 A2 68      [10] 1324 	jp	00165$
                           1325 ;src/main.c:287: case 2:
   66DB                    1326 00133$:
                           1327 ;src/main.c:288: if( *getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   66DB 15            [ 4] 1328 	dec	d
   66DC 15            [ 4] 1329 	dec	d
   66DD C5            [11] 1330 	push	bc
   66DE D5            [11] 1331 	push	de
   66DF 2A 45 60      [16] 1332 	ld	hl,(_mapa)
   66E2 E5            [11] 1333 	push	hl
   66E3 CD B5 49      [17] 1334 	call	_getTilePtr
   66E6 F1            [10] 1335 	pop	af
   66E7 F1            [10] 1336 	pop	af
   66E8 C1            [10] 1337 	pop	bc
   66E9 5E            [ 7] 1338 	ld	e,(hl)
   66EA 3E 02         [ 7] 1339 	ld	a,#0x02
   66EC 93            [ 4] 1340 	sub	a, e
   66ED DA B1 67      [10] 1341 	jp	C,00145$
                           1342 ;src/main.c:289: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   66F0 DD 6E F8      [19] 1343 	ld	l,-8 (ix)
   66F3 DD 66 F9      [19] 1344 	ld	h,-7 (ix)
   66F6 56            [ 7] 1345 	ld	d,(hl)
   66F7 15            [ 4] 1346 	dec	d
   66F8 15            [ 4] 1347 	dec	d
   66F9 0A            [ 7] 1348 	ld	a,(bc)
   66FA C6 02         [ 7] 1349 	add	a, #0x02
   66FC C5            [11] 1350 	push	bc
   66FD D5            [11] 1351 	push	de
   66FE 33            [ 6] 1352 	inc	sp
   66FF F5            [11] 1353 	push	af
   6700 33            [ 6] 1354 	inc	sp
   6701 2A 45 60      [16] 1355 	ld	hl,(_mapa)
   6704 E5            [11] 1356 	push	hl
   6705 CD B5 49      [17] 1357 	call	_getTilePtr
   6708 F1            [10] 1358 	pop	af
   6709 F1            [10] 1359 	pop	af
   670A C1            [10] 1360 	pop	bc
   670B 5E            [ 7] 1361 	ld	e,(hl)
   670C 3E 02         [ 7] 1362 	ld	a,#0x02
   670E 93            [ 4] 1363 	sub	a, e
   670F DA B1 67      [10] 1364 	jp	C,00145$
                           1365 ;src/main.c:290: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   6712 DD 6E F8      [19] 1366 	ld	l,-8 (ix)
   6715 DD 66 F9      [19] 1367 	ld	h,-7 (ix)
   6718 56            [ 7] 1368 	ld	d,(hl)
   6719 15            [ 4] 1369 	dec	d
   671A 15            [ 4] 1370 	dec	d
   671B 0A            [ 7] 1371 	ld	a,(bc)
   671C C6 04         [ 7] 1372 	add	a, #0x04
   671E C5            [11] 1373 	push	bc
   671F D5            [11] 1374 	push	de
   6720 33            [ 6] 1375 	inc	sp
   6721 F5            [11] 1376 	push	af
   6722 33            [ 6] 1377 	inc	sp
   6723 2A 45 60      [16] 1378 	ld	hl,(_mapa)
   6726 E5            [11] 1379 	push	hl
   6727 CD B5 49      [17] 1380 	call	_getTilePtr
   672A F1            [10] 1381 	pop	af
   672B F1            [10] 1382 	pop	af
   672C C1            [10] 1383 	pop	bc
   672D 5E            [ 7] 1384 	ld	e,(hl)
   672E 3E 02         [ 7] 1385 	ld	a,#0x02
   6730 93            [ 4] 1386 	sub	a, e
   6731 DA B1 67      [10] 1387 	jp	C,00145$
                           1388 ;src/main.c:292: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   6734 21 71 5F      [10] 1389 	ld	hl, #_cu + 0
   6737 5E            [ 7] 1390 	ld	e,(hl)
   6738 16 00         [ 7] 1391 	ld	d,#0x00
   673A 21 02 00      [10] 1392 	ld	hl,#0x0002
   673D 19            [11] 1393 	add	hl,de
   673E DD 75 FE      [19] 1394 	ld	-2 (ix),l
   6741 DD 74 FF      [19] 1395 	ld	-1 (ix),h
   6744 0A            [ 7] 1396 	ld	a,(bc)
   6745 6F            [ 4] 1397 	ld	l,a
   6746 26 00         [ 7] 1398 	ld	h,#0x00
   6748 DD 7E FE      [19] 1399 	ld	a,-2 (ix)
   674B 95            [ 4] 1400 	sub	a, l
   674C DD 7E FF      [19] 1401 	ld	a,-1 (ix)
   674F 9C            [ 4] 1402 	sbc	a, h
   6750 E2 55 67      [10] 1403 	jp	PO, 00275$
   6753 EE 80         [ 7] 1404 	xor	a, #0x80
   6755                    1405 00275$:
   6755 FA 68 67      [10] 1406 	jp	M,00140$
   6758 23            [ 6] 1407 	inc	hl
   6759 23            [ 6] 1408 	inc	hl
   675A 23            [ 6] 1409 	inc	hl
   675B 23            [ 6] 1410 	inc	hl
   675C 7D            [ 4] 1411 	ld	a,l
   675D 93            [ 4] 1412 	sub	a, e
   675E 7C            [ 4] 1413 	ld	a,h
   675F 9A            [ 4] 1414 	sbc	a, d
   6760 E2 65 67      [10] 1415 	jp	PO, 00276$
   6763 EE 80         [ 7] 1416 	xor	a, #0x80
   6765                    1417 00276$:
   6765 F2 6E 67      [10] 1418 	jp	P,00141$
   6768                    1419 00140$:
                           1420 ;src/main.c:294: colisiona = 0;
   6768 DD 36 F7 00   [19] 1421 	ld	-9 (ix),#0x00
   676C 18 4B         [12] 1422 	jr	00149$
   676E                    1423 00141$:
                           1424 ;src/main.c:297: if(enemy->y>cu.y){
   676E DD 6E F8      [19] 1425 	ld	l,-8 (ix)
   6771 DD 66 F9      [19] 1426 	ld	h,-7 (ix)
   6774 5E            [ 7] 1427 	ld	e,(hl)
   6775 21 72 5F      [10] 1428 	ld	hl, #(_cu + 0x0001) + 0
   6778 6E            [ 7] 1429 	ld	l,(hl)
   6779 7D            [ 4] 1430 	ld	a,l
   677A 93            [ 4] 1431 	sub	a, e
   677B 30 2E         [12] 1432 	jr	NC,00138$
                           1433 ;src/main.c:298: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   677D 16 00         [ 7] 1434 	ld	d,#0x00
   677F 26 00         [ 7] 1435 	ld	h,#0x00
   6781 D5            [11] 1436 	push	de
   6782 11 08 00      [10] 1437 	ld	de,#0x0008
   6785 19            [11] 1438 	add	hl, de
   6786 D1            [10] 1439 	pop	de
   6787 7B            [ 4] 1440 	ld	a,e
   6788 95            [ 4] 1441 	sub	a, l
   6789 5F            [ 4] 1442 	ld	e,a
   678A 7A            [ 4] 1443 	ld	a,d
   678B 9C            [ 4] 1444 	sbc	a, h
   678C 57            [ 4] 1445 	ld	d,a
   678D 3E 02         [ 7] 1446 	ld	a,#0x02
   678F BB            [ 4] 1447 	cp	a, e
   6790 3E 00         [ 7] 1448 	ld	a,#0x00
   6792 9A            [ 4] 1449 	sbc	a, d
   6793 E2 98 67      [10] 1450 	jp	PO, 00277$
   6796 EE 80         [ 7] 1451 	xor	a, #0x80
   6798                    1452 00277$:
   6798 F2 A1 67      [10] 1453 	jp	P,00135$
                           1454 ;src/main.c:299: colisiona = 0;
   679B DD 36 F7 00   [19] 1455 	ld	-9 (ix),#0x00
   679F 18 18         [12] 1456 	jr	00149$
   67A1                    1457 00135$:
                           1458 ;src/main.c:302: enemy->muerto = SI;
   67A1 DD 6E FA      [19] 1459 	ld	l,-6 (ix)
   67A4 DD 66 FB      [19] 1460 	ld	h,-5 (ix)
   67A7 36 01         [10] 1461 	ld	(hl),#0x01
   67A9 18 0E         [12] 1462 	jr	00149$
   67AB                    1463 00138$:
                           1464 ;src/main.c:306: colisiona = 0;
   67AB DD 36 F7 00   [19] 1465 	ld	-9 (ix),#0x00
   67AF 18 08         [12] 1466 	jr	00149$
   67B1                    1467 00145$:
                           1468 ;src/main.c:312: enemy->mira = M_abajo;
   67B1 DD 6E FC      [19] 1469 	ld	l,-4 (ix)
   67B4 DD 66 FD      [19] 1470 	ld	h,-3 (ix)
   67B7 36 03         [10] 1471 	ld	(hl),#0x03
                           1472 ;src/main.c:315: case 3:
   67B9                    1473 00149$:
                           1474 ;src/main.c:318: if( *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   67B9 DD 6E F8      [19] 1475 	ld	l,-8 (ix)
   67BC DD 66 F9      [19] 1476 	ld	h,-7 (ix)
   67BF 7E            [ 7] 1477 	ld	a,(hl)
   67C0 C6 18         [ 7] 1478 	add	a, #0x18
   67C2 57            [ 4] 1479 	ld	d,a
   67C3 0A            [ 7] 1480 	ld	a,(bc)
   67C4 C5            [11] 1481 	push	bc
   67C5 D5            [11] 1482 	push	de
   67C6 33            [ 6] 1483 	inc	sp
   67C7 F5            [11] 1484 	push	af
   67C8 33            [ 6] 1485 	inc	sp
   67C9 2A 45 60      [16] 1486 	ld	hl,(_mapa)
   67CC E5            [11] 1487 	push	hl
   67CD CD B5 49      [17] 1488 	call	_getTilePtr
   67D0 F1            [10] 1489 	pop	af
   67D1 F1            [10] 1490 	pop	af
   67D2 C1            [10] 1491 	pop	bc
   67D3 5E            [ 7] 1492 	ld	e,(hl)
   67D4 3E 02         [ 7] 1493 	ld	a,#0x02
   67D6 93            [ 4] 1494 	sub	a, e
   67D7 DA 9A 68      [10] 1495 	jp	C,00161$
                           1496 ;src/main.c:319: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   67DA DD 6E F8      [19] 1497 	ld	l,-8 (ix)
   67DD DD 66 F9      [19] 1498 	ld	h,-7 (ix)
   67E0 7E            [ 7] 1499 	ld	a,(hl)
   67E1 C6 18         [ 7] 1500 	add	a, #0x18
   67E3 57            [ 4] 1501 	ld	d,a
   67E4 0A            [ 7] 1502 	ld	a,(bc)
   67E5 C6 02         [ 7] 1503 	add	a, #0x02
   67E7 C5            [11] 1504 	push	bc
   67E8 D5            [11] 1505 	push	de
   67E9 33            [ 6] 1506 	inc	sp
   67EA F5            [11] 1507 	push	af
   67EB 33            [ 6] 1508 	inc	sp
   67EC 2A 45 60      [16] 1509 	ld	hl,(_mapa)
   67EF E5            [11] 1510 	push	hl
   67F0 CD B5 49      [17] 1511 	call	_getTilePtr
   67F3 F1            [10] 1512 	pop	af
   67F4 F1            [10] 1513 	pop	af
   67F5 C1            [10] 1514 	pop	bc
   67F6 5E            [ 7] 1515 	ld	e,(hl)
   67F7 3E 02         [ 7] 1516 	ld	a,#0x02
   67F9 93            [ 4] 1517 	sub	a, e
   67FA DA 9A 68      [10] 1518 	jp	C,00161$
                           1519 ;src/main.c:320: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   67FD DD 6E F8      [19] 1520 	ld	l,-8 (ix)
   6800 DD 66 F9      [19] 1521 	ld	h,-7 (ix)
   6803 7E            [ 7] 1522 	ld	a,(hl)
   6804 C6 18         [ 7] 1523 	add	a, #0x18
   6806 57            [ 4] 1524 	ld	d,a
   6807 0A            [ 7] 1525 	ld	a,(bc)
   6808 C6 04         [ 7] 1526 	add	a, #0x04
   680A C5            [11] 1527 	push	bc
   680B D5            [11] 1528 	push	de
   680C 33            [ 6] 1529 	inc	sp
   680D F5            [11] 1530 	push	af
   680E 33            [ 6] 1531 	inc	sp
   680F 2A 45 60      [16] 1532 	ld	hl,(_mapa)
   6812 E5            [11] 1533 	push	hl
   6813 CD B5 49      [17] 1534 	call	_getTilePtr
   6816 F1            [10] 1535 	pop	af
   6817 F1            [10] 1536 	pop	af
   6818 C1            [10] 1537 	pop	bc
   6819 5E            [ 7] 1538 	ld	e,(hl)
   681A 3E 02         [ 7] 1539 	ld	a,#0x02
   681C 93            [ 4] 1540 	sub	a, e
   681D 38 7B         [12] 1541 	jr	C,00161$
                           1542 ;src/main.c:322: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   681F 21 71 5F      [10] 1543 	ld	hl, #_cu + 0
   6822 5E            [ 7] 1544 	ld	e,(hl)
   6823 16 00         [ 7] 1545 	ld	d,#0x00
   6825 21 02 00      [10] 1546 	ld	hl,#0x0002
   6828 19            [11] 1547 	add	hl,de
   6829 DD 75 FE      [19] 1548 	ld	-2 (ix),l
   682C DD 74 FF      [19] 1549 	ld	-1 (ix),h
   682F 0A            [ 7] 1550 	ld	a,(bc)
   6830 4F            [ 4] 1551 	ld	c,a
   6831 06 00         [ 7] 1552 	ld	b,#0x00
   6833 DD 7E FE      [19] 1553 	ld	a,-2 (ix)
   6836 91            [ 4] 1554 	sub	a, c
   6837 DD 7E FF      [19] 1555 	ld	a,-1 (ix)
   683A 98            [ 4] 1556 	sbc	a, b
   683B E2 40 68      [10] 1557 	jp	PO, 00278$
   683E EE 80         [ 7] 1558 	xor	a, #0x80
   6840                    1559 00278$:
   6840 FA 53 68      [10] 1560 	jp	M,00156$
   6843 03            [ 6] 1561 	inc	bc
   6844 03            [ 6] 1562 	inc	bc
   6845 03            [ 6] 1563 	inc	bc
   6846 03            [ 6] 1564 	inc	bc
   6847 79            [ 4] 1565 	ld	a,c
   6848 93            [ 4] 1566 	sub	a, e
   6849 78            [ 4] 1567 	ld	a,b
   684A 9A            [ 4] 1568 	sbc	a, d
   684B E2 50 68      [10] 1569 	jp	PO, 00279$
   684E EE 80         [ 7] 1570 	xor	a, #0x80
   6850                    1571 00279$:
   6850 F2 59 68      [10] 1572 	jp	P,00157$
   6853                    1573 00156$:
                           1574 ;src/main.c:323: colisiona = 0;
   6853 DD 36 F7 00   [19] 1575 	ld	-9 (ix),#0x00
   6857 18 49         [12] 1576 	jr	00165$
   6859                    1577 00157$:
                           1578 ;src/main.c:326: if(cu.y > enemy->y){ //si el cu esta abajo
   6859 21 72 5F      [10] 1579 	ld	hl, #(_cu + 0x0001) + 0
   685C 4E            [ 7] 1580 	ld	c,(hl)
   685D DD 6E F8      [19] 1581 	ld	l,-8 (ix)
   6860 DD 66 F9      [19] 1582 	ld	h,-7 (ix)
   6863 5E            [ 7] 1583 	ld	e,(hl)
   6864 7B            [ 4] 1584 	ld	a,e
   6865 91            [ 4] 1585 	sub	a, c
   6866 30 2C         [12] 1586 	jr	NC,00154$
                           1587 ;src/main.c:327: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   6868 06 00         [ 7] 1588 	ld	b,#0x00
   686A 16 00         [ 7] 1589 	ld	d,#0x00
   686C 21 16 00      [10] 1590 	ld	hl,#0x0016
   686F 19            [11] 1591 	add	hl,de
   6870 79            [ 4] 1592 	ld	a,c
   6871 95            [ 4] 1593 	sub	a, l
   6872 4F            [ 4] 1594 	ld	c,a
   6873 78            [ 4] 1595 	ld	a,b
   6874 9C            [ 4] 1596 	sbc	a, h
   6875 47            [ 4] 1597 	ld	b,a
   6876 3E 02         [ 7] 1598 	ld	a,#0x02
   6878 B9            [ 4] 1599 	cp	a, c
   6879 3E 00         [ 7] 1600 	ld	a,#0x00
   687B 98            [ 4] 1601 	sbc	a, b
   687C E2 81 68      [10] 1602 	jp	PO, 00280$
   687F EE 80         [ 7] 1603 	xor	a, #0x80
   6881                    1604 00280$:
   6881 F2 8A 68      [10] 1605 	jp	P,00151$
                           1606 ;src/main.c:328: colisiona = 0;
   6884 DD 36 F7 00   [19] 1607 	ld	-9 (ix),#0x00
   6888 18 18         [12] 1608 	jr	00165$
   688A                    1609 00151$:
                           1610 ;src/main.c:331: enemy->muerto = SI;
   688A DD 6E FA      [19] 1611 	ld	l,-6 (ix)
   688D DD 66 FB      [19] 1612 	ld	h,-5 (ix)
   6890 36 01         [10] 1613 	ld	(hl),#0x01
   6892 18 0E         [12] 1614 	jr	00165$
   6894                    1615 00154$:
                           1616 ;src/main.c:335: colisiona = 0;
   6894 DD 36 F7 00   [19] 1617 	ld	-9 (ix),#0x00
   6898 18 08         [12] 1618 	jr	00165$
   689A                    1619 00161$:
                           1620 ;src/main.c:339: enemy->mira = M_arriba;
   689A DD 6E FC      [19] 1621 	ld	l,-4 (ix)
   689D DD 66 FD      [19] 1622 	ld	h,-3 (ix)
   68A0 36 02         [10] 1623 	ld	(hl),#0x02
                           1624 ;src/main.c:342: }
   68A2                    1625 00165$:
                           1626 ;src/main.c:343: return colisiona;
   68A2 DD 6E F7      [19] 1627 	ld	l,-9 (ix)
   68A5 DD F9         [10] 1628 	ld	sp, ix
   68A7 DD E1         [14] 1629 	pop	ix
   68A9 C9            [10] 1630 	ret
                           1631 ;src/main.c:346: void moverEnemigoArriba(TEnemy *enemy){
                           1632 ;	---------------------------------
                           1633 ; Function moverEnemigoArriba
                           1634 ; ---------------------------------
   68AA                    1635 _moverEnemigoArriba::
   68AA DD E5         [15] 1636 	push	ix
   68AC DD 21 00 00   [14] 1637 	ld	ix,#0
   68B0 DD 39         [15] 1638 	add	ix,sp
                           1639 ;src/main.c:347: enemy->y--;
   68B2 DD 4E 04      [19] 1640 	ld	c,4 (ix)
   68B5 DD 46 05      [19] 1641 	ld	b,5 (ix)
   68B8 69            [ 4] 1642 	ld	l, c
   68B9 60            [ 4] 1643 	ld	h, b
   68BA 23            [ 6] 1644 	inc	hl
   68BB 5E            [ 7] 1645 	ld	e,(hl)
   68BC 1D            [ 4] 1646 	dec	e
   68BD 73            [ 7] 1647 	ld	(hl),e
                           1648 ;src/main.c:348: enemy->y--;
   68BE 1D            [ 4] 1649 	dec	e
   68BF 73            [ 7] 1650 	ld	(hl),e
                           1651 ;src/main.c:349: enemy->mover = SI;
   68C0 21 06 00      [10] 1652 	ld	hl,#0x0006
   68C3 09            [11] 1653 	add	hl,bc
   68C4 36 01         [10] 1654 	ld	(hl),#0x01
   68C6 DD E1         [14] 1655 	pop	ix
   68C8 C9            [10] 1656 	ret
                           1657 ;src/main.c:352: void moverEnemigoAbajo(TEnemy *enemy){
                           1658 ;	---------------------------------
                           1659 ; Function moverEnemigoAbajo
                           1660 ; ---------------------------------
   68C9                    1661 _moverEnemigoAbajo::
   68C9 DD E5         [15] 1662 	push	ix
   68CB DD 21 00 00   [14] 1663 	ld	ix,#0
   68CF DD 39         [15] 1664 	add	ix,sp
                           1665 ;src/main.c:353: enemy->y++;
   68D1 DD 4E 04      [19] 1666 	ld	c,4 (ix)
   68D4 DD 46 05      [19] 1667 	ld	b,5 (ix)
   68D7 59            [ 4] 1668 	ld	e, c
   68D8 50            [ 4] 1669 	ld	d, b
   68D9 13            [ 6] 1670 	inc	de
   68DA 1A            [ 7] 1671 	ld	a,(de)
   68DB 3C            [ 4] 1672 	inc	a
   68DC 12            [ 7] 1673 	ld	(de),a
                           1674 ;src/main.c:354: enemy->y++;
   68DD 3C            [ 4] 1675 	inc	a
   68DE 12            [ 7] 1676 	ld	(de),a
                           1677 ;src/main.c:355: enemy->mover = SI;
   68DF 21 06 00      [10] 1678 	ld	hl,#0x0006
   68E2 09            [11] 1679 	add	hl,bc
   68E3 36 01         [10] 1680 	ld	(hl),#0x01
   68E5 DD E1         [14] 1681 	pop	ix
   68E7 C9            [10] 1682 	ret
                           1683 ;src/main.c:358: void moverEnemigoDerecha(TEnemy *enemy){
                           1684 ;	---------------------------------
                           1685 ; Function moverEnemigoDerecha
                           1686 ; ---------------------------------
   68E8                    1687 _moverEnemigoDerecha::
                           1688 ;src/main.c:359: enemy->x++;
   68E8 D1            [10] 1689 	pop	de
   68E9 C1            [10] 1690 	pop	bc
   68EA C5            [11] 1691 	push	bc
   68EB D5            [11] 1692 	push	de
   68EC 0A            [ 7] 1693 	ld	a,(bc)
   68ED 3C            [ 4] 1694 	inc	a
   68EE 02            [ 7] 1695 	ld	(bc),a
                           1696 ;src/main.c:360: enemy->x++;
   68EF 3C            [ 4] 1697 	inc	a
   68F0 02            [ 7] 1698 	ld	(bc),a
                           1699 ;src/main.c:361: enemy->mover = SI;
   68F1 21 06 00      [10] 1700 	ld	hl,#0x0006
   68F4 09            [11] 1701 	add	hl,bc
   68F5 36 01         [10] 1702 	ld	(hl),#0x01
   68F7 C9            [10] 1703 	ret
                           1704 ;src/main.c:364: void moverEnemigoIzquierda(TEnemy *enemy){
                           1705 ;	---------------------------------
                           1706 ; Function moverEnemigoIzquierda
                           1707 ; ---------------------------------
   68F8                    1708 _moverEnemigoIzquierda::
                           1709 ;src/main.c:365: enemy->x--;
   68F8 D1            [10] 1710 	pop	de
   68F9 C1            [10] 1711 	pop	bc
   68FA C5            [11] 1712 	push	bc
   68FB D5            [11] 1713 	push	de
   68FC 0A            [ 7] 1714 	ld	a,(bc)
   68FD C6 FF         [ 7] 1715 	add	a,#0xFF
   68FF 02            [ 7] 1716 	ld	(bc),a
                           1717 ;src/main.c:366: enemy->x--;
   6900 C6 FF         [ 7] 1718 	add	a,#0xFF
   6902 02            [ 7] 1719 	ld	(bc),a
                           1720 ;src/main.c:367: enemy->mover = SI;
   6903 21 06 00      [10] 1721 	ld	hl,#0x0006
   6906 09            [11] 1722 	add	hl,bc
   6907 36 01         [10] 1723 	ld	(hl),#0x01
   6909 C9            [10] 1724 	ret
                           1725 ;src/main.c:370: void moverEnemigoPatrol(TEnemy *enemy){
                           1726 ;	---------------------------------
                           1727 ; Function moverEnemigoPatrol
                           1728 ; ---------------------------------
   690A                    1729 _moverEnemigoPatrol::
   690A DD E5         [15] 1730 	push	ix
   690C DD 21 00 00   [14] 1731 	ld	ix,#0
   6910 DD 39         [15] 1732 	add	ix,sp
   6912 21 F5 FF      [10] 1733 	ld	hl,#-11
   6915 39            [11] 1734 	add	hl,sp
   6916 F9            [ 6] 1735 	ld	sp,hl
                           1736 ;src/main.c:371: if(!enemy->muerto){
   6917 DD 4E 04      [19] 1737 	ld	c,4 (ix)
   691A DD 46 05      [19] 1738 	ld	b,5 (ix)
   691D C5            [11] 1739 	push	bc
   691E FD E1         [14] 1740 	pop	iy
   6920 FD 7E 08      [19] 1741 	ld	a,8 (iy)
   6923 B7            [ 4] 1742 	or	a, a
   6924 C2 1B 6B      [10] 1743 	jp	NZ,00118$
                           1744 ;src/main.c:373: if (!enemy->reversePatrol) {
   6927 21 0C 00      [10] 1745 	ld	hl,#0x000C
   692A 09            [11] 1746 	add	hl,bc
   692B EB            [ 4] 1747 	ex	de,hl
   692C 1A            [ 7] 1748 	ld	a,(de)
   692D DD 77 F5      [19] 1749 	ld	-11 (ix),a
                           1750 ;src/main.c:374: if(enemy->iter < enemy->longitud_camino){
   6930 FD 21 0E 00   [14] 1751 	ld	iy,#0x000E
   6934 FD 09         [15] 1752 	add	iy, bc
   6936 FD 7E 00      [19] 1753 	ld	a,0 (iy)
   6939 DD 77 FA      [19] 1754 	ld	-6 (ix),a
   693C FD 7E 01      [19] 1755 	ld	a,1 (iy)
   693F DD 77 FB      [19] 1756 	ld	-5 (ix),a
   6942 21 1B 00      [10] 1757 	ld	hl,#0x001B
   6945 09            [11] 1758 	add	hl,bc
                           1759 ;src/main.c:377: enemy->x = enemy->camino[enemy->iter];
   6946 79            [ 4] 1760 	ld	a,c
   6947 C6 19         [ 7] 1761 	add	a, #0x19
   6949 DD 77 F8      [19] 1762 	ld	-8 (ix),a
   694C 78            [ 4] 1763 	ld	a,b
   694D CE 00         [ 7] 1764 	adc	a, #0x00
   694F DD 77 F9      [19] 1765 	ld	-7 (ix),a
                           1766 ;src/main.c:379: enemy->y = enemy->camino[enemy->iter];
   6952 79            [ 4] 1767 	ld	a,c
   6953 C6 01         [ 7] 1768 	add	a, #0x01
   6955 DD 77 F6      [19] 1769 	ld	-10 (ix),a
   6958 78            [ 4] 1770 	ld	a,b
   6959 CE 00         [ 7] 1771 	adc	a, #0x00
   695B DD 77 F7      [19] 1772 	ld	-9 (ix),a
                           1773 ;src/main.c:381: enemy->mover = SI;
   695E 79            [ 4] 1774 	ld	a,c
   695F C6 06         [ 7] 1775 	add	a, #0x06
   6961 DD 77 FE      [19] 1776 	ld	-2 (ix),a
   6964 78            [ 4] 1777 	ld	a,b
   6965 CE 00         [ 7] 1778 	adc	a, #0x00
   6967 DD 77 FF      [19] 1779 	ld	-1 (ix),a
                           1780 ;src/main.c:373: if (!enemy->reversePatrol) {
   696A DD 7E F5      [19] 1781 	ld	a,-11 (ix)
   696D B7            [ 4] 1782 	or	a, a
   696E C2 30 6A      [10] 1783 	jp	NZ,00114$
                           1784 ;src/main.c:374: if(enemy->iter < enemy->longitud_camino){
   6971 6E            [ 7] 1785 	ld	l,(hl)
   6972 26 00         [ 7] 1786 	ld	h,#0x00
   6974 DD 7E FA      [19] 1787 	ld	a,-6 (ix)
   6977 95            [ 4] 1788 	sub	a, l
   6978 DD 7E FB      [19] 1789 	ld	a,-5 (ix)
   697B 9C            [ 4] 1790 	sbc	a, h
   697C E2 81 69      [10] 1791 	jp	PO, 00144$
   697F EE 80         [ 7] 1792 	xor	a, #0x80
   6981                    1793 00144$:
   6981 F2 1C 6A      [10] 1794 	jp	P,00105$
                           1795 ;src/main.c:375: if(enemy->iter == 0){
   6984 DD 7E FB      [19] 1796 	ld	a,-5 (ix)
   6987 DD B6 FA      [19] 1797 	or	a,-6 (ix)
   698A 20 4C         [12] 1798 	jr	NZ,00102$
                           1799 ;src/main.c:376: enemy->iter = 2;
   698C FD 36 00 02   [19] 1800 	ld	0 (iy),#0x02
   6990 FD 36 01 00   [19] 1801 	ld	1 (iy),#0x00
                           1802 ;src/main.c:377: enemy->x = enemy->camino[enemy->iter];
   6994 DD 6E F8      [19] 1803 	ld	l,-8 (ix)
   6997 DD 66 F9      [19] 1804 	ld	h,-7 (ix)
   699A 5E            [ 7] 1805 	ld	e,(hl)
   699B 23            [ 6] 1806 	inc	hl
   699C 56            [ 7] 1807 	ld	d,(hl)
   699D FD 6E 00      [19] 1808 	ld	l,0 (iy)
   69A0 FD 66 01      [19] 1809 	ld	h,1 (iy)
   69A3 19            [11] 1810 	add	hl,de
   69A4 7E            [ 7] 1811 	ld	a,(hl)
   69A5 02            [ 7] 1812 	ld	(bc),a
                           1813 ;src/main.c:378: ++enemy->iter;
   69A6 FD 4E 00      [19] 1814 	ld	c,0 (iy)
   69A9 FD 46 01      [19] 1815 	ld	b,1 (iy)
   69AC 03            [ 6] 1816 	inc	bc
   69AD FD 71 00      [19] 1817 	ld	0 (iy),c
   69B0 FD 70 01      [19] 1818 	ld	1 (iy),b
                           1819 ;src/main.c:379: enemy->y = enemy->camino[enemy->iter];
   69B3 DD 6E F8      [19] 1820 	ld	l,-8 (ix)
   69B6 DD 66 F9      [19] 1821 	ld	h,-7 (ix)
   69B9 7E            [ 7] 1822 	ld	a, (hl)
   69BA 23            [ 6] 1823 	inc	hl
   69BB 66            [ 7] 1824 	ld	h,(hl)
   69BC 6F            [ 4] 1825 	ld	l,a
   69BD 09            [11] 1826 	add	hl,bc
   69BE 5E            [ 7] 1827 	ld	e,(hl)
   69BF DD 6E F6      [19] 1828 	ld	l,-10 (ix)
   69C2 DD 66 F7      [19] 1829 	ld	h,-9 (ix)
   69C5 73            [ 7] 1830 	ld	(hl),e
                           1831 ;src/main.c:380: ++enemy->iter;
   69C6 03            [ 6] 1832 	inc	bc
   69C7 FD 71 00      [19] 1833 	ld	0 (iy),c
   69CA FD 70 01      [19] 1834 	ld	1 (iy),b
                           1835 ;src/main.c:381: enemy->mover = SI;
   69CD DD 6E FE      [19] 1836 	ld	l,-2 (ix)
   69D0 DD 66 FF      [19] 1837 	ld	h,-1 (ix)
   69D3 36 01         [10] 1838 	ld	(hl),#0x01
   69D5 C3 1B 6B      [10] 1839 	jp	00118$
   69D8                    1840 00102$:
                           1841 ;src/main.c:383: enemy->x = enemy->camino[enemy->iter];
   69D8 DD 6E F8      [19] 1842 	ld	l,-8 (ix)
   69DB DD 66 F9      [19] 1843 	ld	h,-7 (ix)
   69DE 5E            [ 7] 1844 	ld	e,(hl)
   69DF 23            [ 6] 1845 	inc	hl
   69E0 56            [ 7] 1846 	ld	d,(hl)
   69E1 DD 6E FA      [19] 1847 	ld	l,-6 (ix)
   69E4 DD 66 FB      [19] 1848 	ld	h,-5 (ix)
   69E7 19            [11] 1849 	add	hl,de
   69E8 7E            [ 7] 1850 	ld	a,(hl)
   69E9 02            [ 7] 1851 	ld	(bc),a
                           1852 ;src/main.c:384: ++enemy->iter;
   69EA FD 4E 00      [19] 1853 	ld	c,0 (iy)
   69ED FD 46 01      [19] 1854 	ld	b,1 (iy)
   69F0 03            [ 6] 1855 	inc	bc
   69F1 FD 71 00      [19] 1856 	ld	0 (iy),c
   69F4 FD 70 01      [19] 1857 	ld	1 (iy),b
                           1858 ;src/main.c:385: enemy->y = enemy->camino[enemy->iter];
   69F7 DD 6E F8      [19] 1859 	ld	l,-8 (ix)
   69FA DD 66 F9      [19] 1860 	ld	h,-7 (ix)
   69FD 7E            [ 7] 1861 	ld	a, (hl)
   69FE 23            [ 6] 1862 	inc	hl
   69FF 66            [ 7] 1863 	ld	h,(hl)
   6A00 6F            [ 4] 1864 	ld	l,a
   6A01 09            [11] 1865 	add	hl,bc
   6A02 5E            [ 7] 1866 	ld	e,(hl)
   6A03 DD 6E F6      [19] 1867 	ld	l,-10 (ix)
   6A06 DD 66 F7      [19] 1868 	ld	h,-9 (ix)
   6A09 73            [ 7] 1869 	ld	(hl),e
                           1870 ;src/main.c:386: ++enemy->iter;
   6A0A 03            [ 6] 1871 	inc	bc
   6A0B FD 71 00      [19] 1872 	ld	0 (iy),c
   6A0E FD 70 01      [19] 1873 	ld	1 (iy),b
                           1874 ;src/main.c:387: enemy->mover = SI;
   6A11 DD 6E FE      [19] 1875 	ld	l,-2 (ix)
   6A14 DD 66 FF      [19] 1876 	ld	h,-1 (ix)
   6A17 36 01         [10] 1877 	ld	(hl),#0x01
   6A19 C3 1B 6B      [10] 1878 	jp	00118$
   6A1C                    1879 00105$:
                           1880 ;src/main.c:391: enemy->iter = enemy->longitud_camino;
   6A1C FD 75 00      [19] 1881 	ld	0 (iy),l
   6A1F FD 74 01      [19] 1882 	ld	1 (iy),h
                           1883 ;src/main.c:395: enemy->reversePatrol = 1;
   6A22 3E 01         [ 7] 1884 	ld	a,#0x01
   6A24 12            [ 7] 1885 	ld	(de),a
                           1886 ;src/main.c:396: enemy->mover = NO;
   6A25 DD 6E FE      [19] 1887 	ld	l,-2 (ix)
   6A28 DD 66 FF      [19] 1888 	ld	h,-1 (ix)
   6A2B 36 00         [10] 1889 	ld	(hl),#0x00
   6A2D C3 1B 6B      [10] 1890 	jp	00118$
   6A30                    1891 00114$:
                           1892 ;src/main.c:400: if(enemy->iter > 0){
   6A30 AF            [ 4] 1893 	xor	a, a
   6A31 DD BE FA      [19] 1894 	cp	a, -6 (ix)
   6A34 DD 9E FB      [19] 1895 	sbc	a, -5 (ix)
   6A37 E2 3C 6A      [10] 1896 	jp	PO, 00145$
   6A3A EE 80         [ 7] 1897 	xor	a, #0x80
   6A3C                    1898 00145$:
   6A3C F2 09 6B      [10] 1899 	jp	P,00111$
                           1900 ;src/main.c:401: if(enemy->iter == enemy->longitud_camino){
   6A3F 5E            [ 7] 1901 	ld	e,(hl)
   6A40 16 00         [ 7] 1902 	ld	d,#0x00
   6A42 DD 7E FA      [19] 1903 	ld	a,-6 (ix)
   6A45 93            [ 4] 1904 	sub	a, e
   6A46 C2 C6 6A      [10] 1905 	jp	NZ,00108$
   6A49 DD 7E FB      [19] 1906 	ld	a,-5 (ix)
   6A4C 92            [ 4] 1907 	sub	a, d
   6A4D 20 77         [12] 1908 	jr	NZ,00108$
                           1909 ;src/main.c:402: enemy->iter = enemy->iter - 1;
   6A4F DD 7E FA      [19] 1910 	ld	a,-6 (ix)
   6A52 C6 FF         [ 7] 1911 	add	a,#0xFF
   6A54 DD 77 FC      [19] 1912 	ld	-4 (ix),a
   6A57 DD 7E FB      [19] 1913 	ld	a,-5 (ix)
   6A5A CE FF         [ 7] 1914 	adc	a,#0xFF
   6A5C DD 77 FD      [19] 1915 	ld	-3 (ix),a
   6A5F DD 7E FC      [19] 1916 	ld	a,-4 (ix)
   6A62 FD 77 00      [19] 1917 	ld	0 (iy),a
   6A65 DD 7E FD      [19] 1918 	ld	a,-3 (ix)
   6A68 FD 77 01      [19] 1919 	ld	1 (iy),a
                           1920 ;src/main.c:403: enemy->iter = enemy->iter - 2;
   6A6B DD 5E FC      [19] 1921 	ld	e,-4 (ix)
   6A6E DD 56 FD      [19] 1922 	ld	d,-3 (ix)
   6A71 1B            [ 6] 1923 	dec	de
   6A72 1B            [ 6] 1924 	dec	de
   6A73 FD 73 00      [19] 1925 	ld	0 (iy),e
   6A76 FD 72 01      [19] 1926 	ld	1 (iy),d
                           1927 ;src/main.c:404: enemy->y = enemy->camino[enemy->iter];
   6A79 DD 6E F8      [19] 1928 	ld	l,-8 (ix)
   6A7C DD 66 F9      [19] 1929 	ld	h,-7 (ix)
   6A7F 7E            [ 7] 1930 	ld	a, (hl)
   6A80 23            [ 6] 1931 	inc	hl
   6A81 66            [ 7] 1932 	ld	h,(hl)
   6A82 6F            [ 4] 1933 	ld	l,a
   6A83 19            [11] 1934 	add	hl,de
   6A84 5E            [ 7] 1935 	ld	e,(hl)
   6A85 DD 6E F6      [19] 1936 	ld	l,-10 (ix)
   6A88 DD 66 F7      [19] 1937 	ld	h,-9 (ix)
   6A8B 73            [ 7] 1938 	ld	(hl),e
                           1939 ;src/main.c:405: --enemy->iter;
   6A8C DD 7E FC      [19] 1940 	ld	a,-4 (ix)
   6A8F C6 FD         [ 7] 1941 	add	a,#0xFD
   6A91 5F            [ 4] 1942 	ld	e,a
   6A92 DD 7E FD      [19] 1943 	ld	a,-3 (ix)
   6A95 CE FF         [ 7] 1944 	adc	a,#0xFF
   6A97 57            [ 4] 1945 	ld	d,a
   6A98 FD 73 00      [19] 1946 	ld	0 (iy),e
   6A9B FD 72 01      [19] 1947 	ld	1 (iy),d
                           1948 ;src/main.c:406: enemy->x = enemy->camino[enemy->iter];
   6A9E DD 6E F8      [19] 1949 	ld	l,-8 (ix)
   6AA1 DD 66 F9      [19] 1950 	ld	h,-7 (ix)
   6AA4 7E            [ 7] 1951 	ld	a, (hl)
   6AA5 23            [ 6] 1952 	inc	hl
   6AA6 66            [ 7] 1953 	ld	h,(hl)
   6AA7 6F            [ 4] 1954 	ld	l,a
   6AA8 19            [11] 1955 	add	hl,de
   6AA9 7E            [ 7] 1956 	ld	a,(hl)
   6AAA 02            [ 7] 1957 	ld	(bc),a
                           1958 ;src/main.c:407: --enemy->iter;
   6AAB DD 7E FC      [19] 1959 	ld	a,-4 (ix)
   6AAE C6 FC         [ 7] 1960 	add	a,#0xFC
   6AB0 4F            [ 4] 1961 	ld	c,a
   6AB1 DD 7E FD      [19] 1962 	ld	a,-3 (ix)
   6AB4 CE FF         [ 7] 1963 	adc	a,#0xFF
   6AB6 FD 71 00      [19] 1964 	ld	0 (iy), c
   6AB9 FD 77 01      [19] 1965 	ld	1 (iy), a
                           1966 ;src/main.c:408: enemy->mover = SI;
   6ABC DD 6E FE      [19] 1967 	ld	l,-2 (ix)
   6ABF DD 66 FF      [19] 1968 	ld	h,-1 (ix)
   6AC2 36 01         [10] 1969 	ld	(hl),#0x01
   6AC4 18 55         [12] 1970 	jr	00118$
   6AC6                    1971 00108$:
                           1972 ;src/main.c:410: enemy->y = enemy->camino[enemy->iter];
   6AC6 DD 6E F8      [19] 1973 	ld	l,-8 (ix)
   6AC9 DD 66 F9      [19] 1974 	ld	h,-7 (ix)
   6ACC 5E            [ 7] 1975 	ld	e,(hl)
   6ACD 23            [ 6] 1976 	inc	hl
   6ACE 56            [ 7] 1977 	ld	d,(hl)
   6ACF DD 6E FA      [19] 1978 	ld	l,-6 (ix)
   6AD2 DD 66 FB      [19] 1979 	ld	h,-5 (ix)
   6AD5 19            [11] 1980 	add	hl,de
   6AD6 5E            [ 7] 1981 	ld	e,(hl)
   6AD7 DD 6E F6      [19] 1982 	ld	l,-10 (ix)
   6ADA DD 66 F7      [19] 1983 	ld	h,-9 (ix)
   6ADD 73            [ 7] 1984 	ld	(hl),e
                           1985 ;src/main.c:411: --enemy->iter;
   6ADE FD 5E 00      [19] 1986 	ld	e,0 (iy)
   6AE1 FD 56 01      [19] 1987 	ld	d,1 (iy)
   6AE4 1B            [ 6] 1988 	dec	de
   6AE5 FD 73 00      [19] 1989 	ld	0 (iy),e
   6AE8 FD 72 01      [19] 1990 	ld	1 (iy),d
                           1991 ;src/main.c:412: enemy->x = enemy->camino[enemy->iter];
   6AEB DD 6E F8      [19] 1992 	ld	l,-8 (ix)
   6AEE DD 66 F9      [19] 1993 	ld	h,-7 (ix)
   6AF1 7E            [ 7] 1994 	ld	a, (hl)
   6AF2 23            [ 6] 1995 	inc	hl
   6AF3 66            [ 7] 1996 	ld	h,(hl)
   6AF4 6F            [ 4] 1997 	ld	l,a
   6AF5 19            [11] 1998 	add	hl,de
   6AF6 7E            [ 7] 1999 	ld	a,(hl)
   6AF7 02            [ 7] 2000 	ld	(bc),a
                           2001 ;src/main.c:413: --enemy->iter;
   6AF8 1B            [ 6] 2002 	dec	de
   6AF9 FD 73 00      [19] 2003 	ld	0 (iy),e
   6AFC FD 72 01      [19] 2004 	ld	1 (iy),d
                           2005 ;src/main.c:414: enemy->mover = SI;
   6AFF DD 6E FE      [19] 2006 	ld	l,-2 (ix)
   6B02 DD 66 FF      [19] 2007 	ld	h,-1 (ix)
   6B05 36 01         [10] 2008 	ld	(hl),#0x01
   6B07 18 12         [12] 2009 	jr	00118$
   6B09                    2010 00111$:
                           2011 ;src/main.c:418: enemy->iter = 0;
   6B09 FD 36 00 00   [19] 2012 	ld	0 (iy),#0x00
   6B0D FD 36 01 00   [19] 2013 	ld	1 (iy),#0x00
                           2014 ;src/main.c:420: enemy->reversePatrol = 0;
   6B11 AF            [ 4] 2015 	xor	a, a
   6B12 12            [ 7] 2016 	ld	(de),a
                           2017 ;src/main.c:421: enemy->mover = NO;
   6B13 DD 6E FE      [19] 2018 	ld	l,-2 (ix)
   6B16 DD 66 FF      [19] 2019 	ld	h,-1 (ix)
   6B19 36 00         [10] 2020 	ld	(hl),#0x00
   6B1B                    2021 00118$:
   6B1B DD F9         [10] 2022 	ld	sp, ix
   6B1D DD E1         [14] 2023 	pop	ix
   6B1F C9            [10] 2024 	ret
                           2025 ;src/main.c:427: void moverEnemigoSeek(TEnemy* enemy){
                           2026 ;	---------------------------------
                           2027 ; Function moverEnemigoSeek
                           2028 ; ---------------------------------
   6B20                    2029 _moverEnemigoSeek::
   6B20 DD E5         [15] 2030 	push	ix
   6B22 DD 21 00 00   [14] 2031 	ld	ix,#0
   6B26 DD 39         [15] 2032 	add	ix,sp
   6B28 F5            [11] 2033 	push	af
   6B29 F5            [11] 2034 	push	af
                           2035 ;src/main.c:428: if(!enemy->muerto){
   6B2A DD 4E 04      [19] 2036 	ld	c,4 (ix)
   6B2D DD 46 05      [19] 2037 	ld	b,5 (ix)
   6B30 C5            [11] 2038 	push	bc
   6B31 FD E1         [14] 2039 	pop	iy
   6B33 FD 7E 08      [19] 2040 	ld	a,8 (iy)
   6B36 B7            [ 4] 2041 	or	a, a
   6B37 C2 23 6C      [10] 2042 	jp	NZ,00108$
                           2043 ;src/main.c:430: if (!enemy->reversePatrol) {
   6B3A 21 0C 00      [10] 2044 	ld	hl,#0x000C
   6B3D 09            [11] 2045 	add	hl,bc
   6B3E EB            [ 4] 2046 	ex	de,hl
   6B3F 1A            [ 7] 2047 	ld	a,(de)
   6B40 B7            [ 4] 2048 	or	a, a
   6B41 C2 23 6C      [10] 2049 	jp	NZ,00108$
                           2050 ;src/main.c:431: if(enemy->iter < enemy->longitud_camino - 8){
   6B44 FD 21 0E 00   [14] 2051 	ld	iy,#0x000E
   6B48 FD 09         [15] 2052 	add	iy, bc
   6B4A FD 7E 00      [19] 2053 	ld	a,0 (iy)
   6B4D DD 77 FC      [19] 2054 	ld	-4 (ix),a
   6B50 FD 7E 01      [19] 2055 	ld	a,1 (iy)
   6B53 DD 77 FD      [19] 2056 	ld	-3 (ix),a
   6B56 69            [ 4] 2057 	ld	l, c
   6B57 60            [ 4] 2058 	ld	h, b
   6B58 C5            [11] 2059 	push	bc
   6B59 01 1B 00      [10] 2060 	ld	bc, #0x001B
   6B5C 09            [11] 2061 	add	hl, bc
   6B5D C1            [10] 2062 	pop	bc
   6B5E 6E            [ 7] 2063 	ld	l,(hl)
   6B5F 26 00         [ 7] 2064 	ld	h,#0x00
   6B61 7D            [ 4] 2065 	ld	a,l
   6B62 C6 F8         [ 7] 2066 	add	a,#0xF8
   6B64 6F            [ 4] 2067 	ld	l,a
   6B65 7C            [ 4] 2068 	ld	a,h
   6B66 CE FF         [ 7] 2069 	adc	a,#0xFF
   6B68 67            [ 4] 2070 	ld	h,a
                           2071 ;src/main.c:434: enemy->y = enemy->camino[enemy->iter];
   6B69 79            [ 4] 2072 	ld	a,c
   6B6A C6 01         [ 7] 2073 	add	a, #0x01
   6B6C DD 77 FE      [19] 2074 	ld	-2 (ix),a
   6B6F 78            [ 4] 2075 	ld	a,b
   6B70 CE 00         [ 7] 2076 	adc	a, #0x00
   6B72 DD 77 FF      [19] 2077 	ld	-1 (ix),a
                           2078 ;src/main.c:431: if(enemy->iter < enemy->longitud_camino - 8){
   6B75 DD 7E FC      [19] 2079 	ld	a,-4 (ix)
   6B78 95            [ 4] 2080 	sub	a, l
   6B79 DD 7E FD      [19] 2081 	ld	a,-3 (ix)
   6B7C 9C            [ 4] 2082 	sbc	a, h
   6B7D E2 82 6B      [10] 2083 	jp	PO, 00122$
   6B80 EE 80         [ 7] 2084 	xor	a, #0x80
   6B82                    2085 00122$:
   6B82 F2 CF 6B      [10] 2086 	jp	P,00102$
                           2087 ;src/main.c:432: enemy->x = enemy->camino[enemy->iter];
   6B85 21 19 00      [10] 2088 	ld	hl,#0x0019
   6B88 09            [11] 2089 	add	hl,bc
   6B89 5D            [ 4] 2090 	ld	e,l
   6B8A 54            [ 4] 2091 	ld	d,h
   6B8B 7E            [ 7] 2092 	ld	a, (hl)
   6B8C 23            [ 6] 2093 	inc	hl
   6B8D 66            [ 7] 2094 	ld	h,(hl)
   6B8E 6F            [ 4] 2095 	ld	l,a
   6B8F DD 7E FC      [19] 2096 	ld	a,-4 (ix)
   6B92 85            [ 4] 2097 	add	a, l
   6B93 6F            [ 4] 2098 	ld	l,a
   6B94 DD 7E FD      [19] 2099 	ld	a,-3 (ix)
   6B97 8C            [ 4] 2100 	adc	a, h
   6B98 67            [ 4] 2101 	ld	h,a
   6B99 7E            [ 7] 2102 	ld	a,(hl)
   6B9A 02            [ 7] 2103 	ld	(bc),a
                           2104 ;src/main.c:433: enemy->iter++;
   6B9B FD 6E 00      [19] 2105 	ld	l,0 (iy)
   6B9E FD 66 01      [19] 2106 	ld	h,1 (iy)
   6BA1 23            [ 6] 2107 	inc	hl
   6BA2 E3            [19] 2108 	ex	(sp), hl
   6BA3 DD 7E FC      [19] 2109 	ld	a,-4 (ix)
   6BA6 FD 77 00      [19] 2110 	ld	0 (iy),a
   6BA9 DD 7E FD      [19] 2111 	ld	a,-3 (ix)
   6BAC FD 77 01      [19] 2112 	ld	1 (iy),a
                           2113 ;src/main.c:434: enemy->y = enemy->camino[enemy->iter];
   6BAF EB            [ 4] 2114 	ex	de,hl
   6BB0 5E            [ 7] 2115 	ld	e,(hl)
   6BB1 23            [ 6] 2116 	inc	hl
   6BB2 56            [ 7] 2117 	ld	d,(hl)
   6BB3 E1            [10] 2118 	pop	hl
   6BB4 E5            [11] 2119 	push	hl
   6BB5 19            [11] 2120 	add	hl,de
   6BB6 5E            [ 7] 2121 	ld	e,(hl)
   6BB7 DD 6E FE      [19] 2122 	ld	l,-2 (ix)
   6BBA DD 66 FF      [19] 2123 	ld	h,-1 (ix)
   6BBD 73            [ 7] 2124 	ld	(hl),e
                           2125 ;src/main.c:435: enemy->iter++;
   6BBE D1            [10] 2126 	pop	de
   6BBF D5            [11] 2127 	push	de
   6BC0 13            [ 6] 2128 	inc	de
   6BC1 FD 73 00      [19] 2129 	ld	0 (iy),e
   6BC4 FD 72 01      [19] 2130 	ld	1 (iy),d
                           2131 ;src/main.c:436: enemy->mover = SI;
   6BC7 21 06 00      [10] 2132 	ld	hl,#0x0006
   6BCA 09            [11] 2133 	add	hl,bc
   6BCB 36 01         [10] 2134 	ld	(hl),#0x01
   6BCD 18 54         [12] 2135 	jr	00108$
   6BCF                    2136 00102$:
                           2137 ;src/main.c:439: enemy->reversePatrol = NO;
   6BCF AF            [ 4] 2138 	xor	a, a
   6BD0 12            [ 7] 2139 	ld	(de),a
                           2140 ;src/main.c:440: enemy->patrolling = 1;
   6BD1 21 0B 00      [10] 2141 	ld	hl,#0x000B
   6BD4 09            [11] 2142 	add	hl,bc
   6BD5 36 01         [10] 2143 	ld	(hl),#0x01
                           2144 ;src/main.c:441: enemy->seek = 0;
   6BD7 21 14 00      [10] 2145 	ld	hl,#0x0014
   6BDA 09            [11] 2146 	add	hl,bc
   6BDB 36 00         [10] 2147 	ld	(hl),#0x00
                           2148 ;src/main.c:442: enemy->lastIter = enemy->iter - 1;
   6BDD 21 10 00      [10] 2149 	ld	hl,#0x0010
   6BE0 09            [11] 2150 	add	hl,bc
   6BE1 EB            [ 4] 2151 	ex	de,hl
   6BE2 FD 7E 00      [19] 2152 	ld	a, 0 (iy)
   6BE5 C6 FF         [ 7] 2153 	add	a,#0xFF
   6BE7 12            [ 7] 2154 	ld	(de),a
                           2155 ;src/main.c:443: enemy->iter = 0;
   6BE8 FD 36 00 00   [19] 2156 	ld	0 (iy),#0x00
   6BEC FD 36 01 00   [19] 2157 	ld	1 (iy),#0x00
                           2158 ;src/main.c:444: pathFinding(enemy->x, enemy->y, enemy->p_seek_x, enemy->p_seek_y, enemy, mapa);
   6BF0 69            [ 4] 2159 	ld	l, c
   6BF1 60            [ 4] 2160 	ld	h, b
   6BF2 11 18 00      [10] 2161 	ld	de, #0x0018
   6BF5 19            [11] 2162 	add	hl, de
   6BF6 56            [ 7] 2163 	ld	d,(hl)
   6BF7 C5            [11] 2164 	push	bc
   6BF8 FD E1         [14] 2165 	pop	iy
   6BFA FD 7E 17      [19] 2166 	ld	a,23 (iy)
   6BFD DD 77 FC      [19] 2167 	ld	-4 (ix),a
   6C00 DD 6E FE      [19] 2168 	ld	l,-2 (ix)
   6C03 DD 66 FF      [19] 2169 	ld	h,-1 (ix)
   6C06 5E            [ 7] 2170 	ld	e,(hl)
   6C07 0A            [ 7] 2171 	ld	a,(bc)
   6C08 DD 77 FE      [19] 2172 	ld	-2 (ix),a
   6C0B 2A 45 60      [16] 2173 	ld	hl,(_mapa)
   6C0E E5            [11] 2174 	push	hl
   6C0F C5            [11] 2175 	push	bc
   6C10 D5            [11] 2176 	push	de
   6C11 33            [ 6] 2177 	inc	sp
   6C12 DD 56 FC      [19] 2178 	ld	d, -4 (ix)
   6C15 D5            [11] 2179 	push	de
   6C16 DD 7E FE      [19] 2180 	ld	a,-2 (ix)
   6C19 F5            [11] 2181 	push	af
   6C1A 33            [ 6] 2182 	inc	sp
   6C1B CD 27 48      [17] 2183 	call	_pathFinding
   6C1E 21 08 00      [10] 2184 	ld	hl,#8
   6C21 39            [11] 2185 	add	hl,sp
   6C22 F9            [ 6] 2186 	ld	sp,hl
   6C23                    2187 00108$:
   6C23 DD F9         [10] 2188 	ld	sp, ix
   6C25 DD E1         [14] 2189 	pop	ix
   6C27 C9            [10] 2190 	ret
                           2191 ;src/main.c:451: void lookFor(TEnemy* enemy){
                           2192 ;	---------------------------------
                           2193 ; Function lookFor
                           2194 ; ---------------------------------
   6C28                    2195 _lookFor::
   6C28 DD E5         [15] 2196 	push	ix
   6C2A DD 21 00 00   [14] 2197 	ld	ix,#0
   6C2E DD 39         [15] 2198 	add	ix,sp
                           2199 ;src/main.c:460: i16 difx = abs((i16)(enemy->x - prota.x));
   6C30 DD 4E 04      [19] 2200 	ld	c,4 (ix)
   6C33 DD 46 05      [19] 2201 	ld	b,5 (ix)
   6C36 0A            [ 7] 2202 	ld	a,(bc)
   6C37 5F            [ 4] 2203 	ld	e,a
   6C38 16 00         [ 7] 2204 	ld	d,#0x00
   6C3A 21 69 5F      [10] 2205 	ld	hl,#_prota+0
   6C3D 6E            [ 7] 2206 	ld	l,(hl)
   6C3E 26 00         [ 7] 2207 	ld	h,#0x00
   6C40 7B            [ 4] 2208 	ld	a,e
   6C41 95            [ 4] 2209 	sub	a, l
   6C42 5F            [ 4] 2210 	ld	e,a
   6C43 7A            [ 4] 2211 	ld	a,d
   6C44 9C            [ 4] 2212 	sbc	a, h
   6C45 57            [ 4] 2213 	ld	d,a
   6C46 C5            [11] 2214 	push	bc
   6C47 D5            [11] 2215 	push	de
   6C48 CD F9 49      [17] 2216 	call	_abs
   6C4B F1            [10] 2217 	pop	af
   6C4C C1            [10] 2218 	pop	bc
                           2219 ;src/main.c:461: i16 dify = abs((i16)(enemy->y - prota.y));
   6C4D 69            [ 4] 2220 	ld	l, c
   6C4E 60            [ 4] 2221 	ld	h, b
   6C4F 23            [ 6] 2222 	inc	hl
   6C50 5E            [ 7] 2223 	ld	e,(hl)
   6C51 16 00         [ 7] 2224 	ld	d,#0x00
   6C53 21 6A 5F      [10] 2225 	ld	hl,#_prota+1
   6C56 6E            [ 7] 2226 	ld	l,(hl)
   6C57 26 00         [ 7] 2227 	ld	h,#0x00
   6C59 7B            [ 4] 2228 	ld	a,e
   6C5A 95            [ 4] 2229 	sub	a, l
   6C5B 5F            [ 4] 2230 	ld	e,a
   6C5C 7A            [ 4] 2231 	ld	a,d
   6C5D 9C            [ 4] 2232 	sbc	a, h
   6C5E 57            [ 4] 2233 	ld	d,a
   6C5F C5            [11] 2234 	push	bc
   6C60 D5            [11] 2235 	push	de
   6C61 CD F9 49      [17] 2236 	call	_abs
   6C64 F1            [10] 2237 	pop	af
   6C65 C1            [10] 2238 	pop	bc
                           2239 ;src/main.c:464: enemy->seen = NO;
   6C66 21 12 00      [10] 2240 	ld	hl,#0x0012
   6C69 09            [11] 2241 	add	hl,bc
   6C6A 36 00         [10] 2242 	ld	(hl),#0x00
                           2243 ;src/main.c:465: enemy->inRange = NO;
   6C6C 21 11 00      [10] 2244 	ld	hl,#0x0011
   6C6F 09            [11] 2245 	add	hl,bc
   6C70 36 00         [10] 2246 	ld	(hl),#0x00
                           2247 ;src/main.c:466: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90);
   6C72 21 18 5A      [10] 2248 	ld	hl,#0x5A18
   6C75 E5            [11] 2249 	push	hl
   6C76 21 00 C0      [10] 2250 	ld	hl,#0xC000
   6C79 E5            [11] 2251 	push	hl
   6C7A CD 9E 5E      [17] 2252 	call	_cpct_getScreenPtr
   6C7D DD E1         [14] 2253 	pop	ix
   6C7F C9            [10] 2254 	ret
                           2255 ;src/main.c:479: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2256 ;	---------------------------------
                           2257 ; Function engage
                           2258 ; ---------------------------------
   6C80                    2259 _engage::
   6C80 DD E5         [15] 2260 	push	ix
   6C82 DD 21 00 00   [14] 2261 	ld	ix,#0
   6C86 DD 39         [15] 2262 	add	ix,sp
   6C88 21 F3 FF      [10] 2263 	ld	hl,#-13
   6C8B 39            [11] 2264 	add	hl,sp
   6C8C F9            [ 6] 2265 	ld	sp,hl
                           2266 ;src/main.c:480: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   6C8D DD 7E 04      [19] 2267 	ld	a,4 (ix)
   6C90 DD 77 F7      [19] 2268 	ld	-9 (ix),a
   6C93 DD 7E 05      [19] 2269 	ld	a,5 (ix)
   6C96 DD 77 F8      [19] 2270 	ld	-8 (ix),a
   6C99 DD 6E F7      [19] 2271 	ld	l,-9 (ix)
   6C9C DD 66 F8      [19] 2272 	ld	h,-8 (ix)
   6C9F 4E            [ 7] 2273 	ld	c,(hl)
   6CA0 06 00         [ 7] 2274 	ld	b,#0x00
   6CA2 21 69 5F      [10] 2275 	ld	hl,#_prota+0
   6CA5 5E            [ 7] 2276 	ld	e,(hl)
   6CA6 16 00         [ 7] 2277 	ld	d,#0x00
   6CA8 79            [ 4] 2278 	ld	a,c
   6CA9 93            [ 4] 2279 	sub	a, e
   6CAA 4F            [ 4] 2280 	ld	c,a
   6CAB 78            [ 4] 2281 	ld	a,b
   6CAC 9A            [ 4] 2282 	sbc	a, d
   6CAD 47            [ 4] 2283 	ld	b,a
   6CAE C5            [11] 2284 	push	bc
   6CAF CD F9 49      [17] 2285 	call	_abs
   6CB2 F1            [10] 2286 	pop	af
   6CB3 4D            [ 4] 2287 	ld	c,l
                           2288 ;src/main.c:481: u8 dify = abs(enemy->y - prota.y);
   6CB4 DD 7E F7      [19] 2289 	ld	a,-9 (ix)
   6CB7 C6 01         [ 7] 2290 	add	a, #0x01
   6CB9 DD 77 F9      [19] 2291 	ld	-7 (ix),a
   6CBC DD 7E F8      [19] 2292 	ld	a,-8 (ix)
   6CBF CE 00         [ 7] 2293 	adc	a, #0x00
   6CC1 DD 77 FA      [19] 2294 	ld	-6 (ix),a
   6CC4 DD 6E F9      [19] 2295 	ld	l,-7 (ix)
   6CC7 DD 66 FA      [19] 2296 	ld	h,-6 (ix)
   6CCA 5E            [ 7] 2297 	ld	e,(hl)
   6CCB 16 00         [ 7] 2298 	ld	d,#0x00
   6CCD 21 6A 5F      [10] 2299 	ld	hl,#_prota+1
   6CD0 6E            [ 7] 2300 	ld	l,(hl)
   6CD1 26 00         [ 7] 2301 	ld	h,#0x00
   6CD3 7B            [ 4] 2302 	ld	a,e
   6CD4 95            [ 4] 2303 	sub	a, l
   6CD5 5F            [ 4] 2304 	ld	e,a
   6CD6 7A            [ 4] 2305 	ld	a,d
   6CD7 9C            [ 4] 2306 	sbc	a, h
   6CD8 57            [ 4] 2307 	ld	d,a
   6CD9 C5            [11] 2308 	push	bc
   6CDA D5            [11] 2309 	push	de
   6CDB CD F9 49      [17] 2310 	call	_abs
   6CDE F1            [10] 2311 	pop	af
   6CDF C1            [10] 2312 	pop	bc
                           2313 ;src/main.c:482: u8 dist = difx + dify; // manhattan
   6CE0 09            [11] 2314 	add	hl, bc
   6CE1 DD 75 F6      [19] 2315 	ld	-10 (ix),l
                           2316 ;src/main.c:484: u8 movX = 0;
   6CE4 DD 36 F5 00   [19] 2317 	ld	-11 (ix),#0x00
                           2318 ;src/main.c:485: u8 movY = 0;
   6CE8 DD 36 F4 00   [19] 2319 	ld	-12 (ix),#0x00
                           2320 ;src/main.c:486: u8 mov = 0;
   6CEC DD 36 F3 00   [19] 2321 	ld	-13 (ix),#0x00
                           2322 ;src/main.c:488: if (enemy->y == dy) { // alineado en el eje x
   6CF0 DD 6E F9      [19] 2323 	ld	l,-7 (ix)
   6CF3 DD 66 FA      [19] 2324 	ld	h,-6 (ix)
   6CF6 7E            [ 7] 2325 	ld	a,(hl)
   6CF7 DD 77 FB      [19] 2326 	ld	-5 (ix),a
                           2327 ;src/main.c:490: if (dist > 10) {
   6CFA 3E 0A         [ 7] 2328 	ld	a,#0x0A
   6CFC DD 96 F6      [19] 2329 	sub	a, -10 (ix)
   6CFF 3E 00         [ 7] 2330 	ld	a,#0x00
   6D01 17            [ 4] 2331 	rla
   6D02 DD 77 FC      [19] 2332 	ld	-4 (ix),a
                           2333 ;src/main.c:488: if (enemy->y == dy) { // alineado en el eje x
   6D05 DD 7E 07      [19] 2334 	ld	a,7 (ix)
   6D08 DD 96 FB      [19] 2335 	sub	a, -5 (ix)
   6D0B C2 0D 6E      [10] 2336 	jp	NZ,00187$
                           2337 ;src/main.c:490: if (dist > 10) {
   6D0E DD 7E FC      [19] 2338 	ld	a,-4 (ix)
   6D11 B7            [ 4] 2339 	or	a, a
   6D12 CA 71 73      [10] 2340 	jp	Z,00189$
                           2341 ;src/main.c:491: if (dx < enemy->x) { // izquierda
   6D15 DD 6E F7      [19] 2342 	ld	l,-9 (ix)
   6D18 DD 66 F8      [19] 2343 	ld	h,-8 (ix)
   6D1B 46            [ 7] 2344 	ld	b,(hl)
   6D1C DD 7E 06      [19] 2345 	ld	a,6 (ix)
   6D1F 90            [ 4] 2346 	sub	a, b
   6D20 30 72         [12] 2347 	jr	NC,00110$
                           2348 ;src/main.c:492: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   6D22 05            [ 4] 2349 	dec	b
   6D23 DD 7E FB      [19] 2350 	ld	a,-5 (ix)
   6D26 F5            [11] 2351 	push	af
   6D27 33            [ 6] 2352 	inc	sp
   6D28 C5            [11] 2353 	push	bc
   6D29 33            [ 6] 2354 	inc	sp
   6D2A 2A 45 60      [16] 2355 	ld	hl,(_mapa)
   6D2D E5            [11] 2356 	push	hl
   6D2E CD B5 49      [17] 2357 	call	_getTilePtr
   6D31 F1            [10] 2358 	pop	af
   6D32 F1            [10] 2359 	pop	af
   6D33 4E            [ 7] 2360 	ld	c,(hl)
   6D34 3E 02         [ 7] 2361 	ld	a,#0x02
   6D36 91            [ 4] 2362 	sub	a, c
   6D37 DA 71 73      [10] 2363 	jp	C,00189$
                           2364 ;src/main.c:493: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   6D3A DD 6E F9      [19] 2365 	ld	l,-7 (ix)
   6D3D DD 66 FA      [19] 2366 	ld	h,-6 (ix)
   6D40 7E            [ 7] 2367 	ld	a,(hl)
   6D41 C6 0B         [ 7] 2368 	add	a, #0x0B
   6D43 57            [ 4] 2369 	ld	d,a
   6D44 DD 6E F7      [19] 2370 	ld	l,-9 (ix)
   6D47 DD 66 F8      [19] 2371 	ld	h,-8 (ix)
   6D4A 46            [ 7] 2372 	ld	b,(hl)
   6D4B 05            [ 4] 2373 	dec	b
   6D4C D5            [11] 2374 	push	de
   6D4D 33            [ 6] 2375 	inc	sp
   6D4E C5            [11] 2376 	push	bc
   6D4F 33            [ 6] 2377 	inc	sp
   6D50 2A 45 60      [16] 2378 	ld	hl,(_mapa)
   6D53 E5            [11] 2379 	push	hl
   6D54 CD B5 49      [17] 2380 	call	_getTilePtr
   6D57 F1            [10] 2381 	pop	af
   6D58 F1            [10] 2382 	pop	af
   6D59 4E            [ 7] 2383 	ld	c,(hl)
   6D5A 3E 02         [ 7] 2384 	ld	a,#0x02
   6D5C 91            [ 4] 2385 	sub	a, c
   6D5D DA 71 73      [10] 2386 	jp	C,00189$
                           2387 ;src/main.c:494: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   6D60 DD 6E F9      [19] 2388 	ld	l,-7 (ix)
   6D63 DD 66 FA      [19] 2389 	ld	h,-6 (ix)
   6D66 7E            [ 7] 2390 	ld	a,(hl)
   6D67 C6 16         [ 7] 2391 	add	a, #0x16
   6D69 57            [ 4] 2392 	ld	d,a
   6D6A DD 6E F7      [19] 2393 	ld	l,-9 (ix)
   6D6D DD 66 F8      [19] 2394 	ld	h,-8 (ix)
   6D70 46            [ 7] 2395 	ld	b,(hl)
   6D71 05            [ 4] 2396 	dec	b
   6D72 D5            [11] 2397 	push	de
   6D73 33            [ 6] 2398 	inc	sp
   6D74 C5            [11] 2399 	push	bc
   6D75 33            [ 6] 2400 	inc	sp
   6D76 2A 45 60      [16] 2401 	ld	hl,(_mapa)
   6D79 E5            [11] 2402 	push	hl
   6D7A CD B5 49      [17] 2403 	call	_getTilePtr
   6D7D F1            [10] 2404 	pop	af
   6D7E F1            [10] 2405 	pop	af
   6D7F 4E            [ 7] 2406 	ld	c,(hl)
   6D80 3E 02         [ 7] 2407 	ld	a,#0x02
   6D82 91            [ 4] 2408 	sub	a, c
   6D83 DA 71 73      [10] 2409 	jp	C,00189$
                           2410 ;src/main.c:495: moverEnemigoIzquierda(enemy);
   6D86 DD 6E F7      [19] 2411 	ld	l,-9 (ix)
   6D89 DD 66 F8      [19] 2412 	ld	h,-8 (ix)
   6D8C E5            [11] 2413 	push	hl
   6D8D CD F8 68      [17] 2414 	call	_moverEnemigoIzquierda
   6D90 F1            [10] 2415 	pop	af
                           2416 ;src/main.c:497: mov = 1;
   6D91 C3 71 73      [10] 2417 	jp	00189$
   6D94                    2418 00110$:
                           2419 ;src/main.c:500: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   6D94 78            [ 4] 2420 	ld	a,b
   6D95 C6 05         [ 7] 2421 	add	a, #0x05
   6D97 47            [ 4] 2422 	ld	b,a
   6D98 DD 7E FB      [19] 2423 	ld	a,-5 (ix)
   6D9B F5            [11] 2424 	push	af
   6D9C 33            [ 6] 2425 	inc	sp
   6D9D C5            [11] 2426 	push	bc
   6D9E 33            [ 6] 2427 	inc	sp
   6D9F 2A 45 60      [16] 2428 	ld	hl,(_mapa)
   6DA2 E5            [11] 2429 	push	hl
   6DA3 CD B5 49      [17] 2430 	call	_getTilePtr
   6DA6 F1            [10] 2431 	pop	af
   6DA7 F1            [10] 2432 	pop	af
   6DA8 4E            [ 7] 2433 	ld	c,(hl)
   6DA9 3E 02         [ 7] 2434 	ld	a,#0x02
   6DAB 91            [ 4] 2435 	sub	a, c
   6DAC DA 71 73      [10] 2436 	jp	C,00189$
                           2437 ;src/main.c:501: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   6DAF DD 6E F9      [19] 2438 	ld	l,-7 (ix)
   6DB2 DD 66 FA      [19] 2439 	ld	h,-6 (ix)
   6DB5 7E            [ 7] 2440 	ld	a,(hl)
   6DB6 C6 0B         [ 7] 2441 	add	a, #0x0B
   6DB8 57            [ 4] 2442 	ld	d,a
   6DB9 DD 6E F7      [19] 2443 	ld	l,-9 (ix)
   6DBC DD 66 F8      [19] 2444 	ld	h,-8 (ix)
   6DBF 7E            [ 7] 2445 	ld	a,(hl)
   6DC0 C6 05         [ 7] 2446 	add	a, #0x05
   6DC2 47            [ 4] 2447 	ld	b,a
   6DC3 D5            [11] 2448 	push	de
   6DC4 33            [ 6] 2449 	inc	sp
   6DC5 C5            [11] 2450 	push	bc
   6DC6 33            [ 6] 2451 	inc	sp
   6DC7 2A 45 60      [16] 2452 	ld	hl,(_mapa)
   6DCA E5            [11] 2453 	push	hl
   6DCB CD B5 49      [17] 2454 	call	_getTilePtr
   6DCE F1            [10] 2455 	pop	af
   6DCF F1            [10] 2456 	pop	af
   6DD0 4E            [ 7] 2457 	ld	c,(hl)
   6DD1 3E 02         [ 7] 2458 	ld	a,#0x02
   6DD3 91            [ 4] 2459 	sub	a, c
   6DD4 DA 71 73      [10] 2460 	jp	C,00189$
                           2461 ;src/main.c:502: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   6DD7 DD 6E F9      [19] 2462 	ld	l,-7 (ix)
   6DDA DD 66 FA      [19] 2463 	ld	h,-6 (ix)
   6DDD 7E            [ 7] 2464 	ld	a,(hl)
   6DDE C6 16         [ 7] 2465 	add	a, #0x16
   6DE0 57            [ 4] 2466 	ld	d,a
   6DE1 DD 6E F7      [19] 2467 	ld	l,-9 (ix)
   6DE4 DD 66 F8      [19] 2468 	ld	h,-8 (ix)
   6DE7 7E            [ 7] 2469 	ld	a,(hl)
   6DE8 C6 05         [ 7] 2470 	add	a, #0x05
   6DEA 47            [ 4] 2471 	ld	b,a
   6DEB D5            [11] 2472 	push	de
   6DEC 33            [ 6] 2473 	inc	sp
   6DED C5            [11] 2474 	push	bc
   6DEE 33            [ 6] 2475 	inc	sp
   6DEF 2A 45 60      [16] 2476 	ld	hl,(_mapa)
   6DF2 E5            [11] 2477 	push	hl
   6DF3 CD B5 49      [17] 2478 	call	_getTilePtr
   6DF6 F1            [10] 2479 	pop	af
   6DF7 F1            [10] 2480 	pop	af
   6DF8 4E            [ 7] 2481 	ld	c,(hl)
   6DF9 3E 02         [ 7] 2482 	ld	a,#0x02
   6DFB 91            [ 4] 2483 	sub	a, c
   6DFC DA 71 73      [10] 2484 	jp	C,00189$
                           2485 ;src/main.c:503: moverEnemigoDerecha(enemy);
   6DFF DD 6E F7      [19] 2486 	ld	l,-9 (ix)
   6E02 DD 66 F8      [19] 2487 	ld	h,-8 (ix)
   6E05 E5            [11] 2488 	push	hl
   6E06 CD E8 68      [17] 2489 	call	_moverEnemigoDerecha
   6E09 F1            [10] 2490 	pop	af
                           2491 ;src/main.c:505: mov = 1;
   6E0A C3 71 73      [10] 2492 	jp	00189$
   6E0D                    2493 00187$:
                           2494 ;src/main.c:510: else if (enemy->x == dx) {
   6E0D DD 6E F7      [19] 2495 	ld	l,-9 (ix)
   6E10 DD 66 F8      [19] 2496 	ld	h,-8 (ix)
   6E13 7E            [ 7] 2497 	ld	a,(hl)
   6E14 DD 77 FD      [19] 2498 	ld	-3 (ix), a
   6E17 DD 96 06      [19] 2499 	sub	a, 6 (ix)
   6E1A C2 17 6F      [10] 2500 	jp	NZ,00184$
                           2501 ;src/main.c:512: if (dist > 10) {
   6E1D DD 7E FC      [19] 2502 	ld	a,-4 (ix)
   6E20 B7            [ 4] 2503 	or	a, a
   6E21 CA 71 73      [10] 2504 	jp	Z,00189$
                           2505 ;src/main.c:513: if (dy < enemy->y) {
   6E24 DD 7E 07      [19] 2506 	ld	a,7 (ix)
   6E27 DD 96 FB      [19] 2507 	sub	a, -5 (ix)
   6E2A 30 74         [12] 2508 	jr	NC,00123$
                           2509 ;src/main.c:514: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   6E2C DD 46 FB      [19] 2510 	ld	b,-5 (ix)
   6E2F 05            [ 4] 2511 	dec	b
   6E30 05            [ 4] 2512 	dec	b
   6E31 C5            [11] 2513 	push	bc
   6E32 33            [ 6] 2514 	inc	sp
   6E33 DD 7E FD      [19] 2515 	ld	a,-3 (ix)
   6E36 F5            [11] 2516 	push	af
   6E37 33            [ 6] 2517 	inc	sp
   6E38 2A 45 60      [16] 2518 	ld	hl,(_mapa)
   6E3B E5            [11] 2519 	push	hl
   6E3C CD B5 49      [17] 2520 	call	_getTilePtr
   6E3F F1            [10] 2521 	pop	af
   6E40 F1            [10] 2522 	pop	af
   6E41 4E            [ 7] 2523 	ld	c,(hl)
   6E42 3E 02         [ 7] 2524 	ld	a,#0x02
   6E44 91            [ 4] 2525 	sub	a, c
   6E45 DA 71 73      [10] 2526 	jp	C,00189$
                           2527 ;src/main.c:515: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   6E48 DD 6E F9      [19] 2528 	ld	l,-7 (ix)
   6E4B DD 66 FA      [19] 2529 	ld	h,-6 (ix)
   6E4E 46            [ 7] 2530 	ld	b,(hl)
   6E4F 05            [ 4] 2531 	dec	b
   6E50 05            [ 4] 2532 	dec	b
   6E51 DD 6E F7      [19] 2533 	ld	l,-9 (ix)
   6E54 DD 66 F8      [19] 2534 	ld	h,-8 (ix)
   6E57 56            [ 7] 2535 	ld	d,(hl)
   6E58 14            [ 4] 2536 	inc	d
   6E59 14            [ 4] 2537 	inc	d
   6E5A 4A            [ 4] 2538 	ld	c, d
   6E5B C5            [11] 2539 	push	bc
   6E5C 2A 45 60      [16] 2540 	ld	hl,(_mapa)
   6E5F E5            [11] 2541 	push	hl
   6E60 CD B5 49      [17] 2542 	call	_getTilePtr
   6E63 F1            [10] 2543 	pop	af
   6E64 F1            [10] 2544 	pop	af
   6E65 4E            [ 7] 2545 	ld	c,(hl)
   6E66 3E 02         [ 7] 2546 	ld	a,#0x02
   6E68 91            [ 4] 2547 	sub	a, c
   6E69 DA 71 73      [10] 2548 	jp	C,00189$
                           2549 ;src/main.c:516: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   6E6C DD 6E F9      [19] 2550 	ld	l,-7 (ix)
   6E6F DD 66 FA      [19] 2551 	ld	h,-6 (ix)
   6E72 46            [ 7] 2552 	ld	b,(hl)
   6E73 05            [ 4] 2553 	dec	b
   6E74 05            [ 4] 2554 	dec	b
   6E75 DD 6E F7      [19] 2555 	ld	l,-9 (ix)
   6E78 DD 66 F8      [19] 2556 	ld	h,-8 (ix)
   6E7B 7E            [ 7] 2557 	ld	a,(hl)
   6E7C C6 04         [ 7] 2558 	add	a, #0x04
   6E7E C5            [11] 2559 	push	bc
   6E7F 33            [ 6] 2560 	inc	sp
   6E80 F5            [11] 2561 	push	af
   6E81 33            [ 6] 2562 	inc	sp
   6E82 2A 45 60      [16] 2563 	ld	hl,(_mapa)
   6E85 E5            [11] 2564 	push	hl
   6E86 CD B5 49      [17] 2565 	call	_getTilePtr
   6E89 F1            [10] 2566 	pop	af
   6E8A F1            [10] 2567 	pop	af
   6E8B 4E            [ 7] 2568 	ld	c,(hl)
   6E8C 3E 02         [ 7] 2569 	ld	a,#0x02
   6E8E 91            [ 4] 2570 	sub	a, c
   6E8F DA 71 73      [10] 2571 	jp	C,00189$
                           2572 ;src/main.c:517: moverEnemigoArriba(enemy);
   6E92 DD 6E F7      [19] 2573 	ld	l,-9 (ix)
   6E95 DD 66 F8      [19] 2574 	ld	h,-8 (ix)
   6E98 E5            [11] 2575 	push	hl
   6E99 CD AA 68      [17] 2576 	call	_moverEnemigoArriba
   6E9C F1            [10] 2577 	pop	af
                           2578 ;src/main.c:519: mov = 1;
   6E9D C3 71 73      [10] 2579 	jp	00189$
   6EA0                    2580 00123$:
                           2581 ;src/main.c:522: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   6EA0 DD 7E FB      [19] 2582 	ld	a,-5 (ix)
   6EA3 C6 18         [ 7] 2583 	add	a, #0x18
   6EA5 47            [ 4] 2584 	ld	b,a
   6EA6 C5            [11] 2585 	push	bc
   6EA7 33            [ 6] 2586 	inc	sp
   6EA8 DD 7E FD      [19] 2587 	ld	a,-3 (ix)
   6EAB F5            [11] 2588 	push	af
   6EAC 33            [ 6] 2589 	inc	sp
   6EAD 2A 45 60      [16] 2590 	ld	hl,(_mapa)
   6EB0 E5            [11] 2591 	push	hl
   6EB1 CD B5 49      [17] 2592 	call	_getTilePtr
   6EB4 F1            [10] 2593 	pop	af
   6EB5 F1            [10] 2594 	pop	af
   6EB6 4E            [ 7] 2595 	ld	c,(hl)
   6EB7 3E 02         [ 7] 2596 	ld	a,#0x02
   6EB9 91            [ 4] 2597 	sub	a, c
   6EBA DA 71 73      [10] 2598 	jp	C,00189$
                           2599 ;src/main.c:523: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   6EBD DD 6E F9      [19] 2600 	ld	l,-7 (ix)
   6EC0 DD 66 FA      [19] 2601 	ld	h,-6 (ix)
   6EC3 7E            [ 7] 2602 	ld	a,(hl)
   6EC4 C6 18         [ 7] 2603 	add	a, #0x18
   6EC6 47            [ 4] 2604 	ld	b,a
   6EC7 DD 6E F7      [19] 2605 	ld	l,-9 (ix)
   6ECA DD 66 F8      [19] 2606 	ld	h,-8 (ix)
   6ECD 56            [ 7] 2607 	ld	d,(hl)
   6ECE 14            [ 4] 2608 	inc	d
   6ECF 14            [ 4] 2609 	inc	d
   6ED0 4A            [ 4] 2610 	ld	c, d
   6ED1 C5            [11] 2611 	push	bc
   6ED2 2A 45 60      [16] 2612 	ld	hl,(_mapa)
   6ED5 E5            [11] 2613 	push	hl
   6ED6 CD B5 49      [17] 2614 	call	_getTilePtr
   6ED9 F1            [10] 2615 	pop	af
   6EDA F1            [10] 2616 	pop	af
   6EDB 4E            [ 7] 2617 	ld	c,(hl)
   6EDC 3E 02         [ 7] 2618 	ld	a,#0x02
   6EDE 91            [ 4] 2619 	sub	a, c
   6EDF DA 71 73      [10] 2620 	jp	C,00189$
                           2621 ;src/main.c:524: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   6EE2 DD 6E F9      [19] 2622 	ld	l,-7 (ix)
   6EE5 DD 66 FA      [19] 2623 	ld	h,-6 (ix)
   6EE8 7E            [ 7] 2624 	ld	a,(hl)
   6EE9 C6 18         [ 7] 2625 	add	a, #0x18
   6EEB 47            [ 4] 2626 	ld	b,a
   6EEC DD 6E F7      [19] 2627 	ld	l,-9 (ix)
   6EEF DD 66 F8      [19] 2628 	ld	h,-8 (ix)
   6EF2 7E            [ 7] 2629 	ld	a,(hl)
   6EF3 C6 04         [ 7] 2630 	add	a, #0x04
   6EF5 C5            [11] 2631 	push	bc
   6EF6 33            [ 6] 2632 	inc	sp
   6EF7 F5            [11] 2633 	push	af
   6EF8 33            [ 6] 2634 	inc	sp
   6EF9 2A 45 60      [16] 2635 	ld	hl,(_mapa)
   6EFC E5            [11] 2636 	push	hl
   6EFD CD B5 49      [17] 2637 	call	_getTilePtr
   6F00 F1            [10] 2638 	pop	af
   6F01 F1            [10] 2639 	pop	af
   6F02 4E            [ 7] 2640 	ld	c,(hl)
   6F03 3E 02         [ 7] 2641 	ld	a,#0x02
   6F05 91            [ 4] 2642 	sub	a, c
   6F06 DA 71 73      [10] 2643 	jp	C,00189$
                           2644 ;src/main.c:525: moverEnemigoAbajo(enemy);
   6F09 DD 6E F7      [19] 2645 	ld	l,-9 (ix)
   6F0C DD 66 F8      [19] 2646 	ld	h,-8 (ix)
   6F0F E5            [11] 2647 	push	hl
   6F10 CD C9 68      [17] 2648 	call	_moverEnemigoAbajo
   6F13 F1            [10] 2649 	pop	af
                           2650 ;src/main.c:527: mov = 1;
   6F14 C3 71 73      [10] 2651 	jp	00189$
   6F17                    2652 00184$:
                           2653 ;src/main.c:533: if (dist > 20) {
   6F17 3E 14         [ 7] 2654 	ld	a,#0x14
   6F19 DD 96 F6      [19] 2655 	sub	a, -10 (ix)
   6F1C D2 71 73      [10] 2656 	jp	NC,00189$
                           2657 ;src/main.c:534: if (dx < enemy->x) {
   6F1F DD 7E 06      [19] 2658 	ld	a,6 (ix)
   6F22 DD 96 FD      [19] 2659 	sub	a, -3 (ix)
   6F25 D2 A7 6F      [10] 2660 	jp	NC,00136$
                           2661 ;src/main.c:535: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   6F28 DD 46 FD      [19] 2662 	ld	b,-3 (ix)
   6F2B 05            [ 4] 2663 	dec	b
   6F2C DD 7E FB      [19] 2664 	ld	a,-5 (ix)
   6F2F F5            [11] 2665 	push	af
   6F30 33            [ 6] 2666 	inc	sp
   6F31 C5            [11] 2667 	push	bc
   6F32 33            [ 6] 2668 	inc	sp
   6F33 2A 45 60      [16] 2669 	ld	hl,(_mapa)
   6F36 E5            [11] 2670 	push	hl
   6F37 CD B5 49      [17] 2671 	call	_getTilePtr
   6F3A F1            [10] 2672 	pop	af
   6F3B F1            [10] 2673 	pop	af
   6F3C 4E            [ 7] 2674 	ld	c,(hl)
   6F3D 3E 02         [ 7] 2675 	ld	a,#0x02
   6F3F 91            [ 4] 2676 	sub	a, c
   6F40 DA 24 70      [10] 2677 	jp	C,00137$
                           2678 ;src/main.c:536: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   6F43 DD 6E F9      [19] 2679 	ld	l,-7 (ix)
   6F46 DD 66 FA      [19] 2680 	ld	h,-6 (ix)
   6F49 7E            [ 7] 2681 	ld	a,(hl)
   6F4A C6 0B         [ 7] 2682 	add	a, #0x0B
   6F4C 4F            [ 4] 2683 	ld	c,a
   6F4D DD 6E F7      [19] 2684 	ld	l,-9 (ix)
   6F50 DD 66 F8      [19] 2685 	ld	h,-8 (ix)
   6F53 46            [ 7] 2686 	ld	b,(hl)
   6F54 05            [ 4] 2687 	dec	b
   6F55 79            [ 4] 2688 	ld	a,c
   6F56 F5            [11] 2689 	push	af
   6F57 33            [ 6] 2690 	inc	sp
   6F58 C5            [11] 2691 	push	bc
   6F59 33            [ 6] 2692 	inc	sp
   6F5A 2A 45 60      [16] 2693 	ld	hl,(_mapa)
   6F5D E5            [11] 2694 	push	hl
   6F5E CD B5 49      [17] 2695 	call	_getTilePtr
   6F61 F1            [10] 2696 	pop	af
   6F62 F1            [10] 2697 	pop	af
   6F63 4E            [ 7] 2698 	ld	c,(hl)
   6F64 3E 02         [ 7] 2699 	ld	a,#0x02
   6F66 91            [ 4] 2700 	sub	a, c
   6F67 DA 24 70      [10] 2701 	jp	C,00137$
                           2702 ;src/main.c:537: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   6F6A DD 6E F9      [19] 2703 	ld	l,-7 (ix)
   6F6D DD 66 FA      [19] 2704 	ld	h,-6 (ix)
   6F70 7E            [ 7] 2705 	ld	a,(hl)
   6F71 C6 16         [ 7] 2706 	add	a, #0x16
   6F73 4F            [ 4] 2707 	ld	c,a
   6F74 DD 6E F7      [19] 2708 	ld	l,-9 (ix)
   6F77 DD 66 F8      [19] 2709 	ld	h,-8 (ix)
   6F7A 46            [ 7] 2710 	ld	b,(hl)
   6F7B 05            [ 4] 2711 	dec	b
   6F7C 79            [ 4] 2712 	ld	a,c
   6F7D F5            [11] 2713 	push	af
   6F7E 33            [ 6] 2714 	inc	sp
   6F7F C5            [11] 2715 	push	bc
   6F80 33            [ 6] 2716 	inc	sp
   6F81 2A 45 60      [16] 2717 	ld	hl,(_mapa)
   6F84 E5            [11] 2718 	push	hl
   6F85 CD B5 49      [17] 2719 	call	_getTilePtr
   6F88 F1            [10] 2720 	pop	af
   6F89 F1            [10] 2721 	pop	af
   6F8A 4E            [ 7] 2722 	ld	c,(hl)
   6F8B 3E 02         [ 7] 2723 	ld	a,#0x02
   6F8D 91            [ 4] 2724 	sub	a, c
   6F8E DA 24 70      [10] 2725 	jp	C,00137$
                           2726 ;src/main.c:538: moverEnemigoIzquierda(enemy);
   6F91 DD 6E F7      [19] 2727 	ld	l,-9 (ix)
   6F94 DD 66 F8      [19] 2728 	ld	h,-8 (ix)
   6F97 E5            [11] 2729 	push	hl
   6F98 CD F8 68      [17] 2730 	call	_moverEnemigoIzquierda
   6F9B F1            [10] 2731 	pop	af
                           2732 ;src/main.c:539: movX = 1;
   6F9C DD 36 F5 01   [19] 2733 	ld	-11 (ix),#0x01
                           2734 ;src/main.c:540: mov = 1;
   6FA0 DD 36 F3 01   [19] 2735 	ld	-13 (ix),#0x01
   6FA4 C3 24 70      [10] 2736 	jp	00137$
   6FA7                    2737 00136$:
                           2738 ;src/main.c:543: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   6FA7 DD 7E FD      [19] 2739 	ld	a,-3 (ix)
   6FAA C6 05         [ 7] 2740 	add	a, #0x05
   6FAC 47            [ 4] 2741 	ld	b,a
   6FAD DD 7E FB      [19] 2742 	ld	a,-5 (ix)
   6FB0 F5            [11] 2743 	push	af
   6FB1 33            [ 6] 2744 	inc	sp
   6FB2 C5            [11] 2745 	push	bc
   6FB3 33            [ 6] 2746 	inc	sp
   6FB4 2A 45 60      [16] 2747 	ld	hl,(_mapa)
   6FB7 E5            [11] 2748 	push	hl
   6FB8 CD B5 49      [17] 2749 	call	_getTilePtr
   6FBB F1            [10] 2750 	pop	af
   6FBC F1            [10] 2751 	pop	af
   6FBD 4E            [ 7] 2752 	ld	c,(hl)
   6FBE 3E 02         [ 7] 2753 	ld	a,#0x02
   6FC0 91            [ 4] 2754 	sub	a, c
   6FC1 38 61         [12] 2755 	jr	C,00137$
                           2756 ;src/main.c:544: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   6FC3 DD 6E F9      [19] 2757 	ld	l,-7 (ix)
   6FC6 DD 66 FA      [19] 2758 	ld	h,-6 (ix)
   6FC9 7E            [ 7] 2759 	ld	a,(hl)
   6FCA C6 0B         [ 7] 2760 	add	a, #0x0B
   6FCC 57            [ 4] 2761 	ld	d,a
   6FCD DD 6E F7      [19] 2762 	ld	l,-9 (ix)
   6FD0 DD 66 F8      [19] 2763 	ld	h,-8 (ix)
   6FD3 7E            [ 7] 2764 	ld	a,(hl)
   6FD4 C6 05         [ 7] 2765 	add	a, #0x05
   6FD6 47            [ 4] 2766 	ld	b,a
   6FD7 D5            [11] 2767 	push	de
   6FD8 33            [ 6] 2768 	inc	sp
   6FD9 C5            [11] 2769 	push	bc
   6FDA 33            [ 6] 2770 	inc	sp
   6FDB 2A 45 60      [16] 2771 	ld	hl,(_mapa)
   6FDE E5            [11] 2772 	push	hl
   6FDF CD B5 49      [17] 2773 	call	_getTilePtr
   6FE2 F1            [10] 2774 	pop	af
   6FE3 F1            [10] 2775 	pop	af
   6FE4 4E            [ 7] 2776 	ld	c,(hl)
   6FE5 3E 02         [ 7] 2777 	ld	a,#0x02
   6FE7 91            [ 4] 2778 	sub	a, c
   6FE8 38 3A         [12] 2779 	jr	C,00137$
                           2780 ;src/main.c:545: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   6FEA DD 6E F9      [19] 2781 	ld	l,-7 (ix)
   6FED DD 66 FA      [19] 2782 	ld	h,-6 (ix)
   6FF0 7E            [ 7] 2783 	ld	a,(hl)
   6FF1 C6 16         [ 7] 2784 	add	a, #0x16
   6FF3 57            [ 4] 2785 	ld	d,a
   6FF4 DD 6E F7      [19] 2786 	ld	l,-9 (ix)
   6FF7 DD 66 F8      [19] 2787 	ld	h,-8 (ix)
   6FFA 7E            [ 7] 2788 	ld	a,(hl)
   6FFB C6 05         [ 7] 2789 	add	a, #0x05
   6FFD 47            [ 4] 2790 	ld	b,a
   6FFE D5            [11] 2791 	push	de
   6FFF 33            [ 6] 2792 	inc	sp
   7000 C5            [11] 2793 	push	bc
   7001 33            [ 6] 2794 	inc	sp
   7002 2A 45 60      [16] 2795 	ld	hl,(_mapa)
   7005 E5            [11] 2796 	push	hl
   7006 CD B5 49      [17] 2797 	call	_getTilePtr
   7009 F1            [10] 2798 	pop	af
   700A F1            [10] 2799 	pop	af
   700B 4E            [ 7] 2800 	ld	c,(hl)
   700C 3E 02         [ 7] 2801 	ld	a,#0x02
   700E 91            [ 4] 2802 	sub	a, c
   700F 38 13         [12] 2803 	jr	C,00137$
                           2804 ;src/main.c:546: moverEnemigoDerecha(enemy);
   7011 DD 6E F7      [19] 2805 	ld	l,-9 (ix)
   7014 DD 66 F8      [19] 2806 	ld	h,-8 (ix)
   7017 E5            [11] 2807 	push	hl
   7018 CD E8 68      [17] 2808 	call	_moverEnemigoDerecha
   701B F1            [10] 2809 	pop	af
                           2810 ;src/main.c:547: movX = 1;
   701C DD 36 F5 01   [19] 2811 	ld	-11 (ix),#0x01
                           2812 ;src/main.c:548: mov = 1;
   7020 DD 36 F3 01   [19] 2813 	ld	-13 (ix),#0x01
   7024                    2814 00137$:
                           2815 ;src/main.c:551: if (dy < enemy->y) {
   7024 DD 6E F9      [19] 2816 	ld	l,-7 (ix)
   7027 DD 66 FA      [19] 2817 	ld	h,-6 (ix)
   702A 7E            [ 7] 2818 	ld	a,(hl)
   702B DD 77 FD      [19] 2819 	ld	-3 (ix),a
                           2820 ;src/main.c:480: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   702E DD 6E F7      [19] 2821 	ld	l,-9 (ix)
   7031 DD 66 F8      [19] 2822 	ld	h,-8 (ix)
   7034 7E            [ 7] 2823 	ld	a,(hl)
   7035 DD 77 FC      [19] 2824 	ld	-4 (ix),a
                           2825 ;src/main.c:551: if (dy < enemy->y) {
   7038 DD 7E 07      [19] 2826 	ld	a,7 (ix)
   703B DD 96 FD      [19] 2827 	sub	a, -3 (ix)
   703E D2 D4 70      [10] 2828 	jp	NC,00147$
                           2829 ;src/main.c:552: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7041 DD 7E FD      [19] 2830 	ld	a,-3 (ix)
   7044 C6 FE         [ 7] 2831 	add	a,#0xFE
   7046 DD 77 FB      [19] 2832 	ld	-5 (ix), a
   7049 F5            [11] 2833 	push	af
   704A 33            [ 6] 2834 	inc	sp
   704B DD 7E FC      [19] 2835 	ld	a,-4 (ix)
   704E F5            [11] 2836 	push	af
   704F 33            [ 6] 2837 	inc	sp
   7050 2A 45 60      [16] 2838 	ld	hl,(_mapa)
   7053 E5            [11] 2839 	push	hl
   7054 CD B5 49      [17] 2840 	call	_getTilePtr
   7057 F1            [10] 2841 	pop	af
   7058 F1            [10] 2842 	pop	af
   7059 DD 74 FF      [19] 2843 	ld	-1 (ix),h
   705C DD 75 FE      [19] 2844 	ld	-2 (ix), l
   705F DD 66 FF      [19] 2845 	ld	h,-1 (ix)
   7062 4E            [ 7] 2846 	ld	c,(hl)
   7063 3E 02         [ 7] 2847 	ld	a,#0x02
   7065 91            [ 4] 2848 	sub	a, c
   7066 DA 4F 71      [10] 2849 	jp	C,00148$
                           2850 ;src/main.c:553: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7069 DD 6E F9      [19] 2851 	ld	l,-7 (ix)
   706C DD 66 FA      [19] 2852 	ld	h,-6 (ix)
   706F 7E            [ 7] 2853 	ld	a,(hl)
   7070 DD 77 FE      [19] 2854 	ld	-2 (ix), a
   7073 C6 FE         [ 7] 2855 	add	a,#0xFE
   7075 DD 77 FE      [19] 2856 	ld	-2 (ix),a
   7078 DD 6E F7      [19] 2857 	ld	l,-9 (ix)
   707B DD 66 F8      [19] 2858 	ld	h,-8 (ix)
   707E 46            [ 7] 2859 	ld	b,(hl)
   707F 04            [ 4] 2860 	inc	b
   7080 04            [ 4] 2861 	inc	b
   7081 DD 7E FE      [19] 2862 	ld	a,-2 (ix)
   7084 F5            [11] 2863 	push	af
   7085 33            [ 6] 2864 	inc	sp
   7086 C5            [11] 2865 	push	bc
   7087 33            [ 6] 2866 	inc	sp
   7088 2A 45 60      [16] 2867 	ld	hl,(_mapa)
   708B E5            [11] 2868 	push	hl
   708C CD B5 49      [17] 2869 	call	_getTilePtr
   708F F1            [10] 2870 	pop	af
   7090 F1            [10] 2871 	pop	af
   7091 4E            [ 7] 2872 	ld	c,(hl)
   7092 3E 02         [ 7] 2873 	ld	a,#0x02
   7094 91            [ 4] 2874 	sub	a, c
   7095 DA 4F 71      [10] 2875 	jp	C,00148$
                           2876 ;src/main.c:554: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   7098 DD 6E F9      [19] 2877 	ld	l,-7 (ix)
   709B DD 66 FA      [19] 2878 	ld	h,-6 (ix)
   709E 46            [ 7] 2879 	ld	b,(hl)
   709F 05            [ 4] 2880 	dec	b
   70A0 05            [ 4] 2881 	dec	b
   70A1 DD 6E F7      [19] 2882 	ld	l,-9 (ix)
   70A4 DD 66 F8      [19] 2883 	ld	h,-8 (ix)
   70A7 7E            [ 7] 2884 	ld	a,(hl)
   70A8 C6 04         [ 7] 2885 	add	a, #0x04
   70AA C5            [11] 2886 	push	bc
   70AB 33            [ 6] 2887 	inc	sp
   70AC F5            [11] 2888 	push	af
   70AD 33            [ 6] 2889 	inc	sp
   70AE 2A 45 60      [16] 2890 	ld	hl,(_mapa)
   70B1 E5            [11] 2891 	push	hl
   70B2 CD B5 49      [17] 2892 	call	_getTilePtr
   70B5 F1            [10] 2893 	pop	af
   70B6 F1            [10] 2894 	pop	af
   70B7 4E            [ 7] 2895 	ld	c,(hl)
   70B8 3E 02         [ 7] 2896 	ld	a,#0x02
   70BA 91            [ 4] 2897 	sub	a, c
   70BB DA 4F 71      [10] 2898 	jp	C,00148$
                           2899 ;src/main.c:555: moverEnemigoArriba(enemy);
   70BE DD 6E F7      [19] 2900 	ld	l,-9 (ix)
   70C1 DD 66 F8      [19] 2901 	ld	h,-8 (ix)
   70C4 E5            [11] 2902 	push	hl
   70C5 CD AA 68      [17] 2903 	call	_moverEnemigoArriba
   70C8 F1            [10] 2904 	pop	af
                           2905 ;src/main.c:556: movY = 1;
   70C9 DD 36 F4 01   [19] 2906 	ld	-12 (ix),#0x01
                           2907 ;src/main.c:557: mov = 1;
   70CD DD 36 F3 01   [19] 2908 	ld	-13 (ix),#0x01
   70D1 C3 4F 71      [10] 2909 	jp	00148$
   70D4                    2910 00147$:
                           2911 ;src/main.c:560: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   70D4 DD 7E FD      [19] 2912 	ld	a,-3 (ix)
   70D7 C6 18         [ 7] 2913 	add	a, #0x18
   70D9 47            [ 4] 2914 	ld	b,a
   70DA C5            [11] 2915 	push	bc
   70DB 33            [ 6] 2916 	inc	sp
   70DC DD 7E FC      [19] 2917 	ld	a,-4 (ix)
   70DF F5            [11] 2918 	push	af
   70E0 33            [ 6] 2919 	inc	sp
   70E1 2A 45 60      [16] 2920 	ld	hl,(_mapa)
   70E4 E5            [11] 2921 	push	hl
   70E5 CD B5 49      [17] 2922 	call	_getTilePtr
   70E8 F1            [10] 2923 	pop	af
   70E9 F1            [10] 2924 	pop	af
   70EA 4E            [ 7] 2925 	ld	c,(hl)
   70EB 3E 02         [ 7] 2926 	ld	a,#0x02
   70ED 91            [ 4] 2927 	sub	a, c
   70EE 38 5F         [12] 2928 	jr	C,00148$
                           2929 ;src/main.c:561: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   70F0 DD 6E F9      [19] 2930 	ld	l,-7 (ix)
   70F3 DD 66 FA      [19] 2931 	ld	h,-6 (ix)
   70F6 7E            [ 7] 2932 	ld	a,(hl)
   70F7 C6 18         [ 7] 2933 	add	a, #0x18
   70F9 57            [ 4] 2934 	ld	d,a
   70FA DD 6E F7      [19] 2935 	ld	l,-9 (ix)
   70FD DD 66 F8      [19] 2936 	ld	h,-8 (ix)
   7100 46            [ 7] 2937 	ld	b,(hl)
   7101 04            [ 4] 2938 	inc	b
   7102 04            [ 4] 2939 	inc	b
   7103 D5            [11] 2940 	push	de
   7104 33            [ 6] 2941 	inc	sp
   7105 C5            [11] 2942 	push	bc
   7106 33            [ 6] 2943 	inc	sp
   7107 2A 45 60      [16] 2944 	ld	hl,(_mapa)
   710A E5            [11] 2945 	push	hl
   710B CD B5 49      [17] 2946 	call	_getTilePtr
   710E F1            [10] 2947 	pop	af
   710F F1            [10] 2948 	pop	af
   7110 4E            [ 7] 2949 	ld	c,(hl)
   7111 3E 02         [ 7] 2950 	ld	a,#0x02
   7113 91            [ 4] 2951 	sub	a, c
   7114 38 39         [12] 2952 	jr	C,00148$
                           2953 ;src/main.c:562: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7116 DD 6E F9      [19] 2954 	ld	l,-7 (ix)
   7119 DD 66 FA      [19] 2955 	ld	h,-6 (ix)
   711C 7E            [ 7] 2956 	ld	a,(hl)
   711D C6 18         [ 7] 2957 	add	a, #0x18
   711F 47            [ 4] 2958 	ld	b,a
   7120 DD 6E F7      [19] 2959 	ld	l,-9 (ix)
   7123 DD 66 F8      [19] 2960 	ld	h,-8 (ix)
   7126 7E            [ 7] 2961 	ld	a,(hl)
   7127 C6 04         [ 7] 2962 	add	a, #0x04
   7129 C5            [11] 2963 	push	bc
   712A 33            [ 6] 2964 	inc	sp
   712B F5            [11] 2965 	push	af
   712C 33            [ 6] 2966 	inc	sp
   712D 2A 45 60      [16] 2967 	ld	hl,(_mapa)
   7130 E5            [11] 2968 	push	hl
   7131 CD B5 49      [17] 2969 	call	_getTilePtr
   7134 F1            [10] 2970 	pop	af
   7135 F1            [10] 2971 	pop	af
   7136 4E            [ 7] 2972 	ld	c,(hl)
   7137 3E 02         [ 7] 2973 	ld	a,#0x02
   7139 91            [ 4] 2974 	sub	a, c
   713A 38 13         [12] 2975 	jr	C,00148$
                           2976 ;src/main.c:563: moverEnemigoAbajo(enemy);
   713C DD 6E F7      [19] 2977 	ld	l,-9 (ix)
   713F DD 66 F8      [19] 2978 	ld	h,-8 (ix)
   7142 E5            [11] 2979 	push	hl
   7143 CD C9 68      [17] 2980 	call	_moverEnemigoAbajo
   7146 F1            [10] 2981 	pop	af
                           2982 ;src/main.c:564: movY = 1;
   7147 DD 36 F4 01   [19] 2983 	ld	-12 (ix),#0x01
                           2984 ;src/main.c:565: mov = 1;
   714B DD 36 F3 01   [19] 2985 	ld	-13 (ix),#0x01
   714F                    2986 00148$:
                           2987 ;src/main.c:568: if (!mov) {
   714F DD 7E F3      [19] 2988 	ld	a,-13 (ix)
   7152 B7            [ 4] 2989 	or	a, a
   7153 C2 71 73      [10] 2990 	jp	NZ,00189$
                           2991 ;src/main.c:569: if (!movX) {
   7156 DD 7E F5      [19] 2992 	ld	a,-11 (ix)
   7159 B7            [ 4] 2993 	or	a, a
   715A C2 61 72      [10] 2994 	jp	NZ,00163$
                           2995 ;src/main.c:570: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   715D DD 6E F9      [19] 2996 	ld	l,-7 (ix)
   7160 DD 66 FA      [19] 2997 	ld	h,-6 (ix)
   7163 5E            [ 7] 2998 	ld	e,(hl)
                           2999 ;src/main.c:480: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7164 DD 6E F7      [19] 3000 	ld	l,-9 (ix)
   7167 DD 66 F8      [19] 3001 	ld	h,-8 (ix)
   716A 4E            [ 7] 3002 	ld	c,(hl)
                           3003 ;src/main.c:570: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   716B 3E 70         [ 7] 3004 	ld	a,#0x70
   716D 93            [ 4] 3005 	sub	a, e
   716E 30 7C         [12] 3006 	jr	NC,00160$
                           3007 ;src/main.c:571: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7170 7B            [ 4] 3008 	ld	a,e
   7171 C6 18         [ 7] 3009 	add	a, #0x18
   7173 47            [ 4] 3010 	ld	b,a
   7174 C5            [11] 3011 	push	bc
   7175 2A 45 60      [16] 3012 	ld	hl,(_mapa)
   7178 E5            [11] 3013 	push	hl
   7179 CD B5 49      [17] 3014 	call	_getTilePtr
   717C F1            [10] 3015 	pop	af
   717D F1            [10] 3016 	pop	af
   717E 4E            [ 7] 3017 	ld	c,(hl)
   717F 3E 02         [ 7] 3018 	ld	a,#0x02
   7181 91            [ 4] 3019 	sub	a, c
   7182 38 5B         [12] 3020 	jr	C,00150$
                           3021 ;src/main.c:572: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7184 DD 6E F9      [19] 3022 	ld	l,-7 (ix)
   7187 DD 66 FA      [19] 3023 	ld	h,-6 (ix)
   718A 7E            [ 7] 3024 	ld	a,(hl)
   718B C6 18         [ 7] 3025 	add	a, #0x18
   718D 57            [ 4] 3026 	ld	d,a
   718E DD 6E F7      [19] 3027 	ld	l,-9 (ix)
   7191 DD 66 F8      [19] 3028 	ld	h,-8 (ix)
   7194 4E            [ 7] 3029 	ld	c,(hl)
   7195 41            [ 4] 3030 	ld	b,c
   7196 04            [ 4] 3031 	inc	b
   7197 04            [ 4] 3032 	inc	b
   7198 D5            [11] 3033 	push	de
   7199 33            [ 6] 3034 	inc	sp
   719A C5            [11] 3035 	push	bc
   719B 33            [ 6] 3036 	inc	sp
   719C 2A 45 60      [16] 3037 	ld	hl,(_mapa)
   719F E5            [11] 3038 	push	hl
   71A0 CD B5 49      [17] 3039 	call	_getTilePtr
   71A3 F1            [10] 3040 	pop	af
   71A4 F1            [10] 3041 	pop	af
   71A5 4E            [ 7] 3042 	ld	c,(hl)
   71A6 3E 02         [ 7] 3043 	ld	a,#0x02
   71A8 91            [ 4] 3044 	sub	a, c
   71A9 38 34         [12] 3045 	jr	C,00150$
                           3046 ;src/main.c:573: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   71AB DD 6E F9      [19] 3047 	ld	l,-7 (ix)
   71AE DD 66 FA      [19] 3048 	ld	h,-6 (ix)
   71B1 7E            [ 7] 3049 	ld	a,(hl)
   71B2 C6 18         [ 7] 3050 	add	a, #0x18
   71B4 47            [ 4] 3051 	ld	b,a
   71B5 DD 6E F7      [19] 3052 	ld	l,-9 (ix)
   71B8 DD 66 F8      [19] 3053 	ld	h,-8 (ix)
   71BB 7E            [ 7] 3054 	ld	a,(hl)
   71BC C6 04         [ 7] 3055 	add	a, #0x04
   71BE C5            [11] 3056 	push	bc
   71BF 33            [ 6] 3057 	inc	sp
   71C0 F5            [11] 3058 	push	af
   71C1 33            [ 6] 3059 	inc	sp
   71C2 2A 45 60      [16] 3060 	ld	hl,(_mapa)
   71C5 E5            [11] 3061 	push	hl
   71C6 CD B5 49      [17] 3062 	call	_getTilePtr
   71C9 F1            [10] 3063 	pop	af
   71CA F1            [10] 3064 	pop	af
   71CB 4E            [ 7] 3065 	ld	c,(hl)
   71CC 3E 02         [ 7] 3066 	ld	a,#0x02
   71CE 91            [ 4] 3067 	sub	a, c
   71CF 38 0E         [12] 3068 	jr	C,00150$
                           3069 ;src/main.c:574: moverEnemigoAbajo(enemy);
   71D1 DD 6E F7      [19] 3070 	ld	l,-9 (ix)
   71D4 DD 66 F8      [19] 3071 	ld	h,-8 (ix)
   71D7 E5            [11] 3072 	push	hl
   71D8 CD C9 68      [17] 3073 	call	_moverEnemigoAbajo
   71DB F1            [10] 3074 	pop	af
   71DC C3 61 72      [10] 3075 	jp	00163$
   71DF                    3076 00150$:
                           3077 ;src/main.c:576: moverEnemigoArriba(enemy);
   71DF DD 6E F7      [19] 3078 	ld	l,-9 (ix)
   71E2 DD 66 F8      [19] 3079 	ld	h,-8 (ix)
   71E5 E5            [11] 3080 	push	hl
   71E6 CD AA 68      [17] 3081 	call	_moverEnemigoArriba
   71E9 F1            [10] 3082 	pop	af
   71EA 18 75         [12] 3083 	jr	00163$
   71EC                    3084 00160$:
                           3085 ;src/main.c:578: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   71EC 43            [ 4] 3086 	ld	b,e
   71ED 05            [ 4] 3087 	dec	b
   71EE 05            [ 4] 3088 	dec	b
   71EF C5            [11] 3089 	push	bc
   71F0 2A 45 60      [16] 3090 	ld	hl,(_mapa)
   71F3 E5            [11] 3091 	push	hl
   71F4 CD B5 49      [17] 3092 	call	_getTilePtr
   71F7 F1            [10] 3093 	pop	af
   71F8 F1            [10] 3094 	pop	af
   71F9 4E            [ 7] 3095 	ld	c,(hl)
   71FA 3E 02         [ 7] 3096 	ld	a,#0x02
   71FC 91            [ 4] 3097 	sub	a, c
   71FD 38 57         [12] 3098 	jr	C,00155$
                           3099 ;src/main.c:579: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   71FF DD 6E F9      [19] 3100 	ld	l,-7 (ix)
   7202 DD 66 FA      [19] 3101 	ld	h,-6 (ix)
   7205 56            [ 7] 3102 	ld	d,(hl)
   7206 15            [ 4] 3103 	dec	d
   7207 15            [ 4] 3104 	dec	d
   7208 DD 6E F7      [19] 3105 	ld	l,-9 (ix)
   720B DD 66 F8      [19] 3106 	ld	h,-8 (ix)
   720E 46            [ 7] 3107 	ld	b,(hl)
   720F 04            [ 4] 3108 	inc	b
   7210 04            [ 4] 3109 	inc	b
   7211 D5            [11] 3110 	push	de
   7212 33            [ 6] 3111 	inc	sp
   7213 C5            [11] 3112 	push	bc
   7214 33            [ 6] 3113 	inc	sp
   7215 2A 45 60      [16] 3114 	ld	hl,(_mapa)
   7218 E5            [11] 3115 	push	hl
   7219 CD B5 49      [17] 3116 	call	_getTilePtr
   721C F1            [10] 3117 	pop	af
   721D F1            [10] 3118 	pop	af
   721E 4E            [ 7] 3119 	ld	c,(hl)
   721F 3E 02         [ 7] 3120 	ld	a,#0x02
   7221 91            [ 4] 3121 	sub	a, c
   7222 38 32         [12] 3122 	jr	C,00155$
                           3123 ;src/main.c:580: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   7224 DD 6E F9      [19] 3124 	ld	l,-7 (ix)
   7227 DD 66 FA      [19] 3125 	ld	h,-6 (ix)
   722A 46            [ 7] 3126 	ld	b,(hl)
   722B 05            [ 4] 3127 	dec	b
   722C 05            [ 4] 3128 	dec	b
   722D DD 6E F7      [19] 3129 	ld	l,-9 (ix)
   7230 DD 66 F8      [19] 3130 	ld	h,-8 (ix)
   7233 7E            [ 7] 3131 	ld	a,(hl)
   7234 C6 04         [ 7] 3132 	add	a, #0x04
   7236 C5            [11] 3133 	push	bc
   7237 33            [ 6] 3134 	inc	sp
   7238 F5            [11] 3135 	push	af
   7239 33            [ 6] 3136 	inc	sp
   723A 2A 45 60      [16] 3137 	ld	hl,(_mapa)
   723D E5            [11] 3138 	push	hl
   723E CD B5 49      [17] 3139 	call	_getTilePtr
   7241 F1            [10] 3140 	pop	af
   7242 F1            [10] 3141 	pop	af
   7243 4E            [ 7] 3142 	ld	c,(hl)
   7244 3E 02         [ 7] 3143 	ld	a,#0x02
   7246 91            [ 4] 3144 	sub	a, c
   7247 38 0D         [12] 3145 	jr	C,00155$
                           3146 ;src/main.c:581: moverEnemigoArriba(enemy);
   7249 DD 6E F7      [19] 3147 	ld	l,-9 (ix)
   724C DD 66 F8      [19] 3148 	ld	h,-8 (ix)
   724F E5            [11] 3149 	push	hl
   7250 CD AA 68      [17] 3150 	call	_moverEnemigoArriba
   7253 F1            [10] 3151 	pop	af
   7254 18 0B         [12] 3152 	jr	00163$
   7256                    3153 00155$:
                           3154 ;src/main.c:583: moverEnemigoAbajo(enemy);
   7256 DD 6E F7      [19] 3155 	ld	l,-9 (ix)
   7259 DD 66 F8      [19] 3156 	ld	h,-8 (ix)
   725C E5            [11] 3157 	push	hl
   725D CD C9 68      [17] 3158 	call	_moverEnemigoAbajo
   7260 F1            [10] 3159 	pop	af
   7261                    3160 00163$:
                           3161 ;src/main.c:587: if (!movY) {
   7261 DD 7E F4      [19] 3162 	ld	a,-12 (ix)
   7264 B7            [ 4] 3163 	or	a, a
   7265 C2 71 73      [10] 3164 	jp	NZ,00189$
                           3165 ;src/main.c:588: if (enemy->x < ANCHO_PANTALLA/2) {
   7268 DD 6E F7      [19] 3166 	ld	l,-9 (ix)
   726B DD 66 F8      [19] 3167 	ld	h,-8 (ix)
   726E 4E            [ 7] 3168 	ld	c,(hl)
                           3169 ;src/main.c:481: u8 dify = abs(enemy->y - prota.y);
   726F DD 6E F9      [19] 3170 	ld	l,-7 (ix)
   7272 DD 66 FA      [19] 3171 	ld	h,-6 (ix)
   7275 5E            [ 7] 3172 	ld	e,(hl)
                           3173 ;src/main.c:588: if (enemy->x < ANCHO_PANTALLA/2) {
   7276 79            [ 4] 3174 	ld	a,c
   7277 D6 28         [ 7] 3175 	sub	a, #0x28
   7279 D2 F9 72      [10] 3176 	jp	NC,00175$
                           3177 ;src/main.c:589: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   727C 41            [ 4] 3178 	ld	b,c
   727D 05            [ 4] 3179 	dec	b
   727E 7B            [ 4] 3180 	ld	a,e
   727F F5            [11] 3181 	push	af
   7280 33            [ 6] 3182 	inc	sp
   7281 C5            [11] 3183 	push	bc
   7282 33            [ 6] 3184 	inc	sp
   7283 2A 45 60      [16] 3185 	ld	hl,(_mapa)
   7286 E5            [11] 3186 	push	hl
   7287 CD B5 49      [17] 3187 	call	_getTilePtr
   728A F1            [10] 3188 	pop	af
   728B F1            [10] 3189 	pop	af
   728C 4E            [ 7] 3190 	ld	c,(hl)
   728D 3E 02         [ 7] 3191 	ld	a,#0x02
   728F 91            [ 4] 3192 	sub	a, c
   7290 38 5A         [12] 3193 	jr	C,00165$
                           3194 ;src/main.c:590: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   7292 DD 6E F9      [19] 3195 	ld	l,-7 (ix)
   7295 DD 66 FA      [19] 3196 	ld	h,-6 (ix)
   7298 7E            [ 7] 3197 	ld	a,(hl)
   7299 C6 0B         [ 7] 3198 	add	a, #0x0B
   729B 4F            [ 4] 3199 	ld	c,a
   729C DD 6E F7      [19] 3200 	ld	l,-9 (ix)
   729F DD 66 F8      [19] 3201 	ld	h,-8 (ix)
   72A2 46            [ 7] 3202 	ld	b,(hl)
   72A3 05            [ 4] 3203 	dec	b
   72A4 79            [ 4] 3204 	ld	a,c
   72A5 F5            [11] 3205 	push	af
   72A6 33            [ 6] 3206 	inc	sp
   72A7 C5            [11] 3207 	push	bc
   72A8 33            [ 6] 3208 	inc	sp
   72A9 2A 45 60      [16] 3209 	ld	hl,(_mapa)
   72AC E5            [11] 3210 	push	hl
   72AD CD B5 49      [17] 3211 	call	_getTilePtr
   72B0 F1            [10] 3212 	pop	af
   72B1 F1            [10] 3213 	pop	af
   72B2 4E            [ 7] 3214 	ld	c,(hl)
   72B3 3E 02         [ 7] 3215 	ld	a,#0x02
   72B5 91            [ 4] 3216 	sub	a, c
   72B6 38 34         [12] 3217 	jr	C,00165$
                           3218 ;src/main.c:591: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   72B8 DD 6E F9      [19] 3219 	ld	l,-7 (ix)
   72BB DD 66 FA      [19] 3220 	ld	h,-6 (ix)
   72BE 7E            [ 7] 3221 	ld	a,(hl)
   72BF C6 16         [ 7] 3222 	add	a, #0x16
   72C1 4F            [ 4] 3223 	ld	c,a
   72C2 DD 6E F7      [19] 3224 	ld	l,-9 (ix)
   72C5 DD 66 F8      [19] 3225 	ld	h,-8 (ix)
   72C8 46            [ 7] 3226 	ld	b,(hl)
   72C9 05            [ 4] 3227 	dec	b
   72CA 79            [ 4] 3228 	ld	a,c
   72CB F5            [11] 3229 	push	af
   72CC 33            [ 6] 3230 	inc	sp
   72CD C5            [11] 3231 	push	bc
   72CE 33            [ 6] 3232 	inc	sp
   72CF 2A 45 60      [16] 3233 	ld	hl,(_mapa)
   72D2 E5            [11] 3234 	push	hl
   72D3 CD B5 49      [17] 3235 	call	_getTilePtr
   72D6 F1            [10] 3236 	pop	af
   72D7 F1            [10] 3237 	pop	af
   72D8 4E            [ 7] 3238 	ld	c,(hl)
   72D9 3E 02         [ 7] 3239 	ld	a,#0x02
   72DB 91            [ 4] 3240 	sub	a, c
   72DC 38 0E         [12] 3241 	jr	C,00165$
                           3242 ;src/main.c:592: moverEnemigoIzquierda(enemy);
   72DE DD 6E F7      [19] 3243 	ld	l,-9 (ix)
   72E1 DD 66 F8      [19] 3244 	ld	h,-8 (ix)
   72E4 E5            [11] 3245 	push	hl
   72E5 CD F8 68      [17] 3246 	call	_moverEnemigoIzquierda
   72E8 F1            [10] 3247 	pop	af
   72E9 C3 71 73      [10] 3248 	jp	00189$
   72EC                    3249 00165$:
                           3250 ;src/main.c:594: moverEnemigoDerecha(enemy);
   72EC DD 6E F7      [19] 3251 	ld	l,-9 (ix)
   72EF DD 66 F8      [19] 3252 	ld	h,-8 (ix)
   72F2 E5            [11] 3253 	push	hl
   72F3 CD E8 68      [17] 3254 	call	_moverEnemigoDerecha
   72F6 F1            [10] 3255 	pop	af
   72F7 18 78         [12] 3256 	jr	00189$
   72F9                    3257 00175$:
                           3258 ;src/main.c:597: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   72F9 79            [ 4] 3259 	ld	a,c
   72FA C6 05         [ 7] 3260 	add	a, #0x05
   72FC 47            [ 4] 3261 	ld	b,a
   72FD 7B            [ 4] 3262 	ld	a,e
   72FE F5            [11] 3263 	push	af
   72FF 33            [ 6] 3264 	inc	sp
   7300 C5            [11] 3265 	push	bc
   7301 33            [ 6] 3266 	inc	sp
   7302 2A 45 60      [16] 3267 	ld	hl,(_mapa)
   7305 E5            [11] 3268 	push	hl
   7306 CD B5 49      [17] 3269 	call	_getTilePtr
   7309 F1            [10] 3270 	pop	af
   730A F1            [10] 3271 	pop	af
   730B 4E            [ 7] 3272 	ld	c,(hl)
   730C 3E 02         [ 7] 3273 	ld	a,#0x02
   730E 91            [ 4] 3274 	sub	a, c
   730F 38 55         [12] 3275 	jr	C,00170$
                           3276 ;src/main.c:598: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   7311 DD 6E F9      [19] 3277 	ld	l,-7 (ix)
   7314 DD 66 FA      [19] 3278 	ld	h,-6 (ix)
   7317 7E            [ 7] 3279 	ld	a,(hl)
   7318 C6 0B         [ 7] 3280 	add	a, #0x0B
   731A 47            [ 4] 3281 	ld	b,a
   731B DD 6E F7      [19] 3282 	ld	l,-9 (ix)
   731E DD 66 F8      [19] 3283 	ld	h,-8 (ix)
   7321 7E            [ 7] 3284 	ld	a,(hl)
   7322 C6 05         [ 7] 3285 	add	a, #0x05
   7324 4F            [ 4] 3286 	ld	c,a
   7325 C5            [11] 3287 	push	bc
   7326 2A 45 60      [16] 3288 	ld	hl,(_mapa)
   7329 E5            [11] 3289 	push	hl
   732A CD B5 49      [17] 3290 	call	_getTilePtr
   732D F1            [10] 3291 	pop	af
   732E F1            [10] 3292 	pop	af
   732F 4E            [ 7] 3293 	ld	c,(hl)
   7330 3E 02         [ 7] 3294 	ld	a,#0x02
   7332 91            [ 4] 3295 	sub	a, c
   7333 38 31         [12] 3296 	jr	C,00170$
                           3297 ;src/main.c:599: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   7335 DD 6E F9      [19] 3298 	ld	l,-7 (ix)
   7338 DD 66 FA      [19] 3299 	ld	h,-6 (ix)
   733B 7E            [ 7] 3300 	ld	a,(hl)
   733C C6 16         [ 7] 3301 	add	a, #0x16
   733E 47            [ 4] 3302 	ld	b,a
   733F DD 6E F7      [19] 3303 	ld	l,-9 (ix)
   7342 DD 66 F8      [19] 3304 	ld	h,-8 (ix)
   7345 7E            [ 7] 3305 	ld	a,(hl)
   7346 C6 05         [ 7] 3306 	add	a, #0x05
   7348 4F            [ 4] 3307 	ld	c,a
   7349 C5            [11] 3308 	push	bc
   734A 2A 45 60      [16] 3309 	ld	hl,(_mapa)
   734D E5            [11] 3310 	push	hl
   734E CD B5 49      [17] 3311 	call	_getTilePtr
   7351 F1            [10] 3312 	pop	af
   7352 F1            [10] 3313 	pop	af
   7353 4E            [ 7] 3314 	ld	c,(hl)
   7354 3E 02         [ 7] 3315 	ld	a,#0x02
   7356 91            [ 4] 3316 	sub	a, c
   7357 38 0D         [12] 3317 	jr	C,00170$
                           3318 ;src/main.c:600: moverEnemigoDerecha(enemy);
   7359 DD 6E F7      [19] 3319 	ld	l,-9 (ix)
   735C DD 66 F8      [19] 3320 	ld	h,-8 (ix)
   735F E5            [11] 3321 	push	hl
   7360 CD E8 68      [17] 3322 	call	_moverEnemigoDerecha
   7363 F1            [10] 3323 	pop	af
   7364 18 0B         [12] 3324 	jr	00189$
   7366                    3325 00170$:
                           3326 ;src/main.c:603: moverEnemigoIzquierda(enemy);
   7366 DD 6E F7      [19] 3327 	ld	l,-9 (ix)
   7369 DD 66 F8      [19] 3328 	ld	h,-8 (ix)
   736C E5            [11] 3329 	push	hl
   736D CD F8 68      [17] 3330 	call	_moverEnemigoIzquierda
   7370 F1            [10] 3331 	pop	af
   7371                    3332 00189$:
   7371 DD F9         [10] 3333 	ld	sp, ix
   7373 DD E1         [14] 3334 	pop	ix
   7375 C9            [10] 3335 	ret
                           3336 ;src/main.c:612: void updateEnemies() { // maquina de estados
                           3337 ;	---------------------------------
                           3338 ; Function updateEnemies
                           3339 ; ---------------------------------
   7376                    3340 _updateEnemies::
   7376 DD E5         [15] 3341 	push	ix
   7378 DD 21 00 00   [14] 3342 	ld	ix,#0
   737C DD 39         [15] 3343 	add	ix,sp
   737E 21 F3 FF      [10] 3344 	ld	hl,#-13
   7381 39            [11] 3345 	add	hl,sp
   7382 F9            [ 6] 3346 	ld	sp,hl
                           3347 ;src/main.c:618: actual = enemy;
                           3348 ;src/main.c:619: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   7383 21 18 5A      [10] 3349 	ld	hl,#0x5A18
   7386 E5            [11] 3350 	push	hl
   7387 21 00 C0      [10] 3351 	ld	hl,#0xC000
   738A E5            [11] 3352 	push	hl
   738B CD 9E 5E      [17] 3353 	call	_cpct_getScreenPtr
                           3354 ;src/main.c:622: while(i) {
   738E DD 36 F3 02   [19] 3355 	ld	-13 (ix),#0x02
   7392 11 F9 5E      [10] 3356 	ld	de,#_enemy
   7395                    3357 00119$:
   7395 DD 7E F3      [19] 3358 	ld	a,-13 (ix)
   7398 B7            [ 4] 3359 	or	a, a
   7399 CA 00 75      [10] 3360 	jp	Z,00122$
                           3361 ;src/main.c:623: --i;
   739C DD 35 F3      [23] 3362 	dec	-13 (ix)
                           3363 ;src/main.c:624: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   739F 21 16 00      [10] 3364 	ld	hl,#0x0016
   73A2 19            [11] 3365 	add	hl,de
   73A3 DD 75 FE      [19] 3366 	ld	-2 (ix),l
   73A6 DD 74 FF      [19] 3367 	ld	-1 (ix),h
   73A9 DD 6E FE      [19] 3368 	ld	l,-2 (ix)
   73AC DD 66 FF      [19] 3369 	ld	h,-1 (ix)
   73AF 7E            [ 7] 3370 	ld	a,(hl)
   73B0 B7            [ 4] 3371 	or	a, a
   73B1 28 16         [12] 3372 	jr	Z,00117$
                           3373 ;src/main.c:625: engage(actual, prota.x, prota.y);
   73B3 3A 6A 5F      [13] 3374 	ld	a, (#(_prota + 0x0001) + 0)
   73B6 21 69 5F      [10] 3375 	ld	hl, #_prota + 0
   73B9 46            [ 7] 3376 	ld	b,(hl)
   73BA D5            [11] 3377 	push	de
   73BB F5            [11] 3378 	push	af
   73BC 33            [ 6] 3379 	inc	sp
   73BD C5            [11] 3380 	push	bc
   73BE 33            [ 6] 3381 	inc	sp
   73BF D5            [11] 3382 	push	de
   73C0 CD 80 6C      [17] 3383 	call	_engage
   73C3 F1            [10] 3384 	pop	af
   73C4 F1            [10] 3385 	pop	af
   73C5 D1            [10] 3386 	pop	de
   73C6 C3 F8 74      [10] 3387 	jp	00118$
   73C9                    3388 00117$:
                           3389 ;src/main.c:627: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   73C9 D5            [11] 3390 	push	de
   73CA D5            [11] 3391 	push	de
   73CB CD 28 6C      [17] 3392 	call	_lookFor
   73CE F1            [10] 3393 	pop	af
   73CF D1            [10] 3394 	pop	de
                           3395 ;src/main.c:628: if (actual->patrolling) { // esta patrullando
   73D0 21 0B 00      [10] 3396 	ld	hl,#0x000B
   73D3 19            [11] 3397 	add	hl,de
   73D4 DD 75 FC      [19] 3398 	ld	-4 (ix),l
   73D7 DD 74 FD      [19] 3399 	ld	-3 (ix),h
   73DA DD 6E FC      [19] 3400 	ld	l,-4 (ix)
   73DD DD 66 FD      [19] 3401 	ld	h,-3 (ix)
   73E0 6E            [ 7] 3402 	ld	l,(hl)
                           3403 ;src/main.c:630: if (actual->inRange) {
   73E1 7B            [ 4] 3404 	ld	a,e
   73E2 C6 11         [ 7] 3405 	add	a, #0x11
   73E4 4F            [ 4] 3406 	ld	c,a
   73E5 7A            [ 4] 3407 	ld	a,d
   73E6 CE 00         [ 7] 3408 	adc	a, #0x00
   73E8 47            [ 4] 3409 	ld	b,a
                           3410 ;src/main.c:639: actual->seek = 1;
   73E9 7B            [ 4] 3411 	ld	a,e
   73EA C6 14         [ 7] 3412 	add	a, #0x14
   73EC DD 77 FA      [19] 3413 	ld	-6 (ix),a
   73EF 7A            [ 4] 3414 	ld	a,d
   73F0 CE 00         [ 7] 3415 	adc	a, #0x00
   73F2 DD 77 FB      [19] 3416 	ld	-5 (ix),a
                           3417 ;src/main.c:628: if (actual->patrolling) { // esta patrullando
   73F5 7D            [ 4] 3418 	ld	a,l
   73F6 B7            [ 4] 3419 	or	a, a
   73F7 CA BD 74      [10] 3420 	jp	Z,00114$
                           3421 ;src/main.c:629: moverEnemigoPatrol(actual);
   73FA C5            [11] 3422 	push	bc
   73FB D5            [11] 3423 	push	de
   73FC D5            [11] 3424 	push	de
   73FD CD 0A 69      [17] 3425 	call	_moverEnemigoPatrol
   7400 F1            [10] 3426 	pop	af
   7401 D1            [10] 3427 	pop	de
   7402 C1            [10] 3428 	pop	bc
                           3429 ;src/main.c:630: if (actual->inRange) {
   7403 0A            [ 7] 3430 	ld	a,(bc)
   7404 B7            [ 4] 3431 	or	a, a
   7405 28 26         [12] 3432 	jr	Z,00104$
                           3433 ;src/main.c:631: engage(actual, prota.x, prota.y);
   7407 21 6A 5F      [10] 3434 	ld	hl, #(_prota + 0x0001) + 0
   740A 46            [ 7] 3435 	ld	b,(hl)
   740B 3A 69 5F      [13] 3436 	ld	a, (#_prota + 0)
   740E D5            [11] 3437 	push	de
   740F C5            [11] 3438 	push	bc
   7410 33            [ 6] 3439 	inc	sp
   7411 F5            [11] 3440 	push	af
   7412 33            [ 6] 3441 	inc	sp
   7413 D5            [11] 3442 	push	de
   7414 CD 80 6C      [17] 3443 	call	_engage
   7417 F1            [10] 3444 	pop	af
   7418 F1            [10] 3445 	pop	af
   7419 D1            [10] 3446 	pop	de
                           3447 ;src/main.c:632: actual->patrolling = 0;
   741A DD 6E FC      [19] 3448 	ld	l,-4 (ix)
   741D DD 66 FD      [19] 3449 	ld	h,-3 (ix)
   7420 36 00         [10] 3450 	ld	(hl),#0x00
                           3451 ;src/main.c:633: actual->engage = 1;
   7422 DD 6E FE      [19] 3452 	ld	l,-2 (ix)
   7425 DD 66 FF      [19] 3453 	ld	h,-1 (ix)
   7428 36 01         [10] 3454 	ld	(hl),#0x01
   742A C3 F8 74      [10] 3455 	jp	00118$
   742D                    3456 00104$:
                           3457 ;src/main.c:634: } else if (actual->seen) {
   742D 21 12 00      [10] 3458 	ld	hl,#0x0012
   7430 19            [11] 3459 	add	hl,de
   7431 DD 75 F8      [19] 3460 	ld	-8 (ix),l
   7434 DD 74 F9      [19] 3461 	ld	-7 (ix),h
   7437 DD 6E F8      [19] 3462 	ld	l,-8 (ix)
   743A DD 66 F9      [19] 3463 	ld	h,-7 (ix)
   743D 7E            [ 7] 3464 	ld	a,(hl)
   743E B7            [ 4] 3465 	or	a, a
   743F CA F8 74      [10] 3466 	jp	Z,00118$
                           3467 ;src/main.c:636: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   7442 3A 6A 5F      [13] 3468 	ld	a,(#(_prota + 0x0001) + 0)
   7445 DD 77 F7      [19] 3469 	ld	-9 (ix),a
   7448 21 69 5F      [10] 3470 	ld	hl, #_prota + 0
   744B 4E            [ 7] 3471 	ld	c,(hl)
   744C 21 01 00      [10] 3472 	ld	hl,#0x0001
   744F 19            [11] 3473 	add	hl,de
   7450 DD 75 F5      [19] 3474 	ld	-11 (ix),l
   7453 DD 74 F6      [19] 3475 	ld	-10 (ix),h
   7456 DD 6E F5      [19] 3476 	ld	l,-11 (ix)
   7459 DD 66 F6      [19] 3477 	ld	h,-10 (ix)
   745C 46            [ 7] 3478 	ld	b,(hl)
   745D 1A            [ 7] 3479 	ld	a,(de)
   745E DD 77 F4      [19] 3480 	ld	-12 (ix),a
   7461 D5            [11] 3481 	push	de
   7462 2A 45 60      [16] 3482 	ld	hl,(_mapa)
   7465 E5            [11] 3483 	push	hl
   7466 D5            [11] 3484 	push	de
   7467 DD 7E F7      [19] 3485 	ld	a,-9 (ix)
   746A F5            [11] 3486 	push	af
   746B 33            [ 6] 3487 	inc	sp
   746C 79            [ 4] 3488 	ld	a,c
   746D F5            [11] 3489 	push	af
   746E 33            [ 6] 3490 	inc	sp
   746F C5            [11] 3491 	push	bc
   7470 33            [ 6] 3492 	inc	sp
   7471 DD 7E F4      [19] 3493 	ld	a,-12 (ix)
   7474 F5            [11] 3494 	push	af
   7475 33            [ 6] 3495 	inc	sp
   7476 CD 27 48      [17] 3496 	call	_pathFinding
   7479 21 08 00      [10] 3497 	ld	hl,#8
   747C 39            [11] 3498 	add	hl,sp
   747D F9            [ 6] 3499 	ld	sp,hl
   747E D1            [10] 3500 	pop	de
                           3501 ;src/main.c:637: actual->p_seek_x = actual->x;
   747F 21 17 00      [10] 3502 	ld	hl,#0x0017
   7482 19            [11] 3503 	add	hl,de
   7483 4D            [ 4] 3504 	ld	c,l
   7484 44            [ 4] 3505 	ld	b,h
   7485 1A            [ 7] 3506 	ld	a,(de)
   7486 02            [ 7] 3507 	ld	(bc),a
                           3508 ;src/main.c:638: actual->p_seek_y = actual->y;
   7487 21 18 00      [10] 3509 	ld	hl,#0x0018
   748A 19            [11] 3510 	add	hl,de
   748B 4D            [ 4] 3511 	ld	c,l
   748C 44            [ 4] 3512 	ld	b,h
   748D DD 6E F5      [19] 3513 	ld	l,-11 (ix)
   7490 DD 66 F6      [19] 3514 	ld	h,-10 (ix)
   7493 7E            [ 7] 3515 	ld	a,(hl)
   7494 02            [ 7] 3516 	ld	(bc),a
                           3517 ;src/main.c:639: actual->seek = 1;
   7495 DD 6E FA      [19] 3518 	ld	l,-6 (ix)
   7498 DD 66 FB      [19] 3519 	ld	h,-5 (ix)
   749B 36 01         [10] 3520 	ld	(hl),#0x01
                           3521 ;src/main.c:640: actual->iter=0;
   749D 21 0E 00      [10] 3522 	ld	hl,#0x000E
   74A0 19            [11] 3523 	add	hl,de
   74A1 AF            [ 4] 3524 	xor	a, a
   74A2 77            [ 7] 3525 	ld	(hl), a
   74A3 23            [ 6] 3526 	inc	hl
   74A4 77            [ 7] 3527 	ld	(hl), a
                           3528 ;src/main.c:641: actual->reversePatrol = NO;
   74A5 21 0C 00      [10] 3529 	ld	hl,#0x000C
   74A8 19            [11] 3530 	add	hl,de
   74A9 36 00         [10] 3531 	ld	(hl),#0x00
                           3532 ;src/main.c:642: actual->patrolling = 0;
   74AB DD 6E FC      [19] 3533 	ld	l,-4 (ix)
   74AE DD 66 FD      [19] 3534 	ld	h,-3 (ix)
   74B1 36 00         [10] 3535 	ld	(hl),#0x00
                           3536 ;src/main.c:643: actual->seen = 0;
   74B3 DD 6E F8      [19] 3537 	ld	l,-8 (ix)
   74B6 DD 66 F9      [19] 3538 	ld	h,-7 (ix)
   74B9 36 00         [10] 3539 	ld	(hl),#0x00
   74BB 18 3B         [12] 3540 	jr	00118$
   74BD                    3541 00114$:
                           3542 ;src/main.c:645: } else if (actual->seek) {
   74BD DD 6E FA      [19] 3543 	ld	l,-6 (ix)
   74C0 DD 66 FB      [19] 3544 	ld	h,-5 (ix)
   74C3 7E            [ 7] 3545 	ld	a,(hl)
   74C4 B7            [ 4] 3546 	or	a, a
   74C5 28 31         [12] 3547 	jr	Z,00118$
                           3548 ;src/main.c:647: if (!actual->found /*&& actual->seekTimer <= 5*/) {
   74C7 D5            [11] 3549 	push	de
   74C8 FD E1         [14] 3550 	pop	iy
   74CA FD 7E 13      [19] 3551 	ld	a,19 (iy)
   74CD B7            [ 4] 3552 	or	a, a
   74CE 20 09         [12] 3553 	jr	NZ,00109$
                           3554 ;src/main.c:648: moverEnemigoSeek(actual); // buscar en posiciones cercanas a la actual
   74D0 D5            [11] 3555 	push	de
   74D1 D5            [11] 3556 	push	de
   74D2 CD 20 6B      [17] 3557 	call	_moverEnemigoSeek
   74D5 F1            [10] 3558 	pop	af
   74D6 D1            [10] 3559 	pop	de
   74D7 18 1F         [12] 3560 	jr	00118$
   74D9                    3561 00109$:
                           3562 ;src/main.c:649: } else if (actual->inRange) {
   74D9 0A            [ 7] 3563 	ld	a,(bc)
   74DA B7            [ 4] 3564 	or	a, a
   74DB 28 1B         [12] 3565 	jr	Z,00118$
                           3566 ;src/main.c:650: engage(actual, prota.x, prota.y);
   74DD 21 6A 5F      [10] 3567 	ld	hl, #(_prota + 0x0001) + 0
   74E0 46            [ 7] 3568 	ld	b,(hl)
   74E1 3A 69 5F      [13] 3569 	ld	a, (#_prota + 0)
   74E4 D5            [11] 3570 	push	de
   74E5 C5            [11] 3571 	push	bc
   74E6 33            [ 6] 3572 	inc	sp
   74E7 F5            [11] 3573 	push	af
   74E8 33            [ 6] 3574 	inc	sp
   74E9 D5            [11] 3575 	push	de
   74EA CD 80 6C      [17] 3576 	call	_engage
   74ED F1            [10] 3577 	pop	af
   74EE F1            [10] 3578 	pop	af
   74EF D1            [10] 3579 	pop	de
                           3580 ;src/main.c:651: actual->engage = 1;
   74F0 DD 6E FE      [19] 3581 	ld	l,-2 (ix)
   74F3 DD 66 FF      [19] 3582 	ld	h,-1 (ix)
   74F6 36 01         [10] 3583 	ld	(hl),#0x01
   74F8                    3584 00118$:
                           3585 ;src/main.c:655: actual++;
   74F8 21 1C 00      [10] 3586 	ld	hl,#0x001C
   74FB 19            [11] 3587 	add	hl,de
   74FC EB            [ 4] 3588 	ex	de,hl
   74FD C3 95 73      [10] 3589 	jp	00119$
   7500                    3590 00122$:
   7500 DD F9         [10] 3591 	ld	sp, ix
   7502 DD E1         [14] 3592 	pop	ix
   7504 C9            [10] 3593 	ret
                           3594 ;src/main.c:659: void inicializarEnemy() {
                           3595 ;	---------------------------------
                           3596 ; Function inicializarEnemy
                           3597 ; ---------------------------------
   7505                    3598 _inicializarEnemy::
   7505 DD E5         [15] 3599 	push	ix
   7507 DD 21 00 00   [14] 3600 	ld	ix,#0
   750B DD 39         [15] 3601 	add	ix,sp
   750D F5            [11] 3602 	push	af
   750E F5            [11] 3603 	push	af
                           3604 ;src/main.c:670: actual = enemy;
   750F 01 F9 5E      [10] 3605 	ld	bc,#_enemy+0
                           3606 ;src/main.c:671: while(i){
   7512 DD 36 FC 02   [19] 3607 	ld	-4 (ix),#0x02
   7516                    3608 00103$:
   7516 DD 7E FC      [19] 3609 	ld	a,-4 (ix)
   7519 B7            [ 4] 3610 	or	a, a
   751A CA FE 75      [10] 3611 	jp	Z,00106$
                           3612 ;src/main.c:672: --i;
   751D DD 35 FC      [23] 3613 	dec	-4 (ix)
                           3614 ;src/main.c:673: actual->x = actual->px = spawnX[i];
   7520 59            [ 4] 3615 	ld	e, c
   7521 50            [ 4] 3616 	ld	d, b
   7522 13            [ 6] 3617 	inc	de
   7523 13            [ 6] 3618 	inc	de
   7524 3E 6B         [ 7] 3619 	ld	a,#<(_spawnX)
   7526 DD 86 FC      [19] 3620 	add	a, -4 (ix)
   7529 6F            [ 4] 3621 	ld	l,a
   752A 3E 60         [ 7] 3622 	ld	a,#>(_spawnX)
   752C CE 00         [ 7] 3623 	adc	a, #0x00
   752E 67            [ 4] 3624 	ld	h,a
   752F 7E            [ 7] 3625 	ld	a,(hl)
   7530 DD 77 FF      [19] 3626 	ld	-1 (ix), a
   7533 12            [ 7] 3627 	ld	(de),a
   7534 DD 7E FF      [19] 3628 	ld	a,-1 (ix)
   7537 02            [ 7] 3629 	ld	(bc),a
                           3630 ;src/main.c:674: actual->y = actual->py = spawnY[i];
   7538 C5            [11] 3631 	push	bc
   7539 FD E1         [14] 3632 	pop	iy
   753B FD 23         [10] 3633 	inc	iy
   753D 59            [ 4] 3634 	ld	e, c
   753E 50            [ 4] 3635 	ld	d, b
   753F 13            [ 6] 3636 	inc	de
   7540 13            [ 6] 3637 	inc	de
   7541 13            [ 6] 3638 	inc	de
   7542 3E 6F         [ 7] 3639 	ld	a,#<(_spawnY)
   7544 DD 86 FC      [19] 3640 	add	a, -4 (ix)
   7547 6F            [ 4] 3641 	ld	l,a
   7548 3E 60         [ 7] 3642 	ld	a,#>(_spawnY)
   754A CE 00         [ 7] 3643 	adc	a, #0x00
   754C 67            [ 4] 3644 	ld	h,a
   754D 7E            [ 7] 3645 	ld	a,(hl)
   754E DD 77 FE      [19] 3646 	ld	-2 (ix), a
   7551 12            [ 7] 3647 	ld	(de),a
   7552 DD 7E FE      [19] 3648 	ld	a,-2 (ix)
   7555 FD 77 00      [19] 3649 	ld	0 (iy), a
                           3650 ;src/main.c:675: actual->mover  = NO;
   7558 21 06 00      [10] 3651 	ld	hl,#0x0006
   755B 09            [11] 3652 	add	hl,bc
   755C 36 00         [10] 3653 	ld	(hl),#0x00
                           3654 ;src/main.c:676: actual->mira   = M_abajo;
   755E 21 07 00      [10] 3655 	ld	hl,#0x0007
   7561 09            [11] 3656 	add	hl,bc
   7562 36 03         [10] 3657 	ld	(hl),#0x03
                           3658 ;src/main.c:677: actual->sprite = g_enemy;
   7564 21 04 00      [10] 3659 	ld	hl,#0x0004
   7567 09            [11] 3660 	add	hl,bc
   7568 36 3A         [10] 3661 	ld	(hl),#<(_g_enemy)
   756A 23            [ 6] 3662 	inc	hl
   756B 36 3C         [10] 3663 	ld	(hl),#>(_g_enemy)
                           3664 ;src/main.c:678: actual->muerto = NO;
   756D 21 08 00      [10] 3665 	ld	hl,#0x0008
   7570 09            [11] 3666 	add	hl,bc
   7571 36 00         [10] 3667 	ld	(hl),#0x00
                           3668 ;src/main.c:679: actual->muertes = 0;
   7573 21 0A 00      [10] 3669 	ld	hl,#0x000A
   7576 09            [11] 3670 	add	hl,bc
   7577 36 00         [10] 3671 	ld	(hl),#0x00
                           3672 ;src/main.c:680: actual->patrolling = SI;
   7579 21 0B 00      [10] 3673 	ld	hl,#0x000B
   757C 09            [11] 3674 	add	hl,bc
   757D 36 01         [10] 3675 	ld	(hl),#0x01
                           3676 ;src/main.c:681: actual->reversePatrol = NO;
   757F 21 0C 00      [10] 3677 	ld	hl,#0x000C
   7582 09            [11] 3678 	add	hl,bc
   7583 36 00         [10] 3679 	ld	(hl),#0x00
                           3680 ;src/main.c:682: actual->iter = 0;
   7585 21 0E 00      [10] 3681 	ld	hl,#0x000E
   7588 09            [11] 3682 	add	hl,bc
   7589 AF            [ 4] 3683 	xor	a, a
   758A 77            [ 7] 3684 	ld	(hl), a
   758B 23            [ 6] 3685 	inc	hl
   758C 77            [ 7] 3686 	ld	(hl), a
                           3687 ;src/main.c:683: actual->lastIter = 0;
   758D 21 10 00      [10] 3688 	ld	hl,#0x0010
   7590 09            [11] 3689 	add	hl,bc
   7591 36 00         [10] 3690 	ld	(hl),#0x00
                           3691 ;src/main.c:684: actual->seen = 0;
   7593 21 12 00      [10] 3692 	ld	hl,#0x0012
   7596 09            [11] 3693 	add	hl,bc
   7597 36 00         [10] 3694 	ld	(hl),#0x00
                           3695 ;src/main.c:685: actual->found = 0;
   7599 21 13 00      [10] 3696 	ld	hl,#0x0013
   759C 09            [11] 3697 	add	hl,bc
   759D 36 00         [10] 3698 	ld	(hl),#0x00
                           3699 ;src/main.c:686: pathFinding(actual->x, actual->y, patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
   759F 21 47 60      [10] 3700 	ld	hl,#_num_mapa + 0
   75A2 5E            [ 7] 3701 	ld	e, (hl)
   75A3 1C            [ 4] 3702 	inc	e
   75A4 16 00         [ 7] 3703 	ld	d,#0x00
   75A6 6B            [ 4] 3704 	ld	l, e
   75A7 62            [ 4] 3705 	ld	h, d
   75A8 29            [11] 3706 	add	hl, hl
   75A9 29            [11] 3707 	add	hl, hl
   75AA 19            [11] 3708 	add	hl, de
   75AB EB            [ 4] 3709 	ex	de,hl
   75AC 21 87 60      [10] 3710 	ld	hl,#_patrolY
   75AF 19            [11] 3711 	add	hl,de
   75B0 DD 7E FC      [19] 3712 	ld	a,-4 (ix)
   75B3 85            [ 4] 3713 	add	a, l
   75B4 6F            [ 4] 3714 	ld	l,a
   75B5 3E 00         [ 7] 3715 	ld	a,#0x00
   75B7 8C            [ 4] 3716 	adc	a, h
   75B8 67            [ 4] 3717 	ld	h,a
   75B9 7E            [ 7] 3718 	ld	a,(hl)
   75BA DD 77 FD      [19] 3719 	ld	-3 (ix),a
   75BD 21 73 60      [10] 3720 	ld	hl,#_patrolX
   75C0 19            [11] 3721 	add	hl,de
   75C1 DD 5E FC      [19] 3722 	ld	e,-4 (ix)
   75C4 16 00         [ 7] 3723 	ld	d,#0x00
   75C6 19            [11] 3724 	add	hl,de
   75C7 56            [ 7] 3725 	ld	d,(hl)
   75C8 C5            [11] 3726 	push	bc
   75C9 2A 45 60      [16] 3727 	ld	hl,(_mapa)
   75CC E5            [11] 3728 	push	hl
   75CD C5            [11] 3729 	push	bc
   75CE DD 7E FD      [19] 3730 	ld	a,-3 (ix)
   75D1 F5            [11] 3731 	push	af
   75D2 33            [ 6] 3732 	inc	sp
   75D3 D5            [11] 3733 	push	de
   75D4 33            [ 6] 3734 	inc	sp
   75D5 DD 66 FE      [19] 3735 	ld	h,-2 (ix)
   75D8 DD 6E FF      [19] 3736 	ld	l,-1 (ix)
   75DB E5            [11] 3737 	push	hl
   75DC CD 27 48      [17] 3738 	call	_pathFinding
   75DF 21 08 00      [10] 3739 	ld	hl,#8
   75E2 39            [11] 3740 	add	hl,sp
   75E3 F9            [ 6] 3741 	ld	sp,hl
   75E4 C1            [10] 3742 	pop	bc
                           3743 ;src/main.c:709: if(actual->longitud_camino > 0){
   75E5 C5            [11] 3744 	push	bc
   75E6 FD E1         [14] 3745 	pop	iy
   75E8 FD 7E 1B      [19] 3746 	ld	a,27 (iy)
   75EB B7            [ 4] 3747 	or	a, a
   75EC 28 07         [12] 3748 	jr	Z,00102$
                           3749 ;src/main.c:710: dibujarEnemigo(actual);
   75EE C5            [11] 3750 	push	bc
   75EF C5            [11] 3751 	push	bc
   75F0 CD 25 63      [17] 3752 	call	_dibujarEnemigo
   75F3 F1            [10] 3753 	pop	af
   75F4 C1            [10] 3754 	pop	bc
   75F5                    3755 00102$:
                           3756 ;src/main.c:712: ++actual;
   75F5 21 1C 00      [10] 3757 	ld	hl,#0x001C
   75F8 09            [11] 3758 	add	hl,bc
   75F9 4D            [ 4] 3759 	ld	c,l
   75FA 44            [ 4] 3760 	ld	b,h
   75FB C3 16 75      [10] 3761 	jp	00103$
   75FE                    3762 00106$:
   75FE DD F9         [10] 3763 	ld	sp, ix
   7600 DD E1         [14] 3764 	pop	ix
   7602 C9            [10] 3765 	ret
                           3766 ;src/main.c:716: void avanzarMapa() {
                           3767 ;	---------------------------------
                           3768 ; Function avanzarMapa
                           3769 ; ---------------------------------
   7603                    3770 _avanzarMapa::
                           3771 ;src/main.c:717: if(num_mapa < NUM_MAPAS -1) {
   7603 3A 47 60      [13] 3772 	ld	a,(#_num_mapa + 0)
   7606 D6 02         [ 7] 3773 	sub	a, #0x02
   7608 30 34         [12] 3774 	jr	NC,00102$
                           3775 ;src/main.c:718: mapa = mapas[++num_mapa];
   760A 01 65 60      [10] 3776 	ld	bc,#_mapas+0
   760D 21 47 60      [10] 3777 	ld	hl, #_num_mapa+0
   7610 34            [11] 3778 	inc	(hl)
   7611 FD 21 47 60   [14] 3779 	ld	iy,#_num_mapa
   7615 FD 6E 00      [19] 3780 	ld	l,0 (iy)
   7618 26 00         [ 7] 3781 	ld	h,#0x00
   761A 29            [11] 3782 	add	hl, hl
   761B 09            [11] 3783 	add	hl,bc
   761C 7E            [ 7] 3784 	ld	a,(hl)
   761D FD 21 45 60   [14] 3785 	ld	iy,#_mapa
   7621 FD 77 00      [19] 3786 	ld	0 (iy),a
   7624 23            [ 6] 3787 	inc	hl
   7625 7E            [ 7] 3788 	ld	a,(hl)
   7626 32 46 60      [13] 3789 	ld	(#_mapa + 1),a
                           3790 ;src/main.c:719: prota.x = prota.px = 2;
   7629 21 6B 5F      [10] 3791 	ld	hl,#(_prota + 0x0002)
   762C 36 02         [10] 3792 	ld	(hl),#0x02
   762E 21 69 5F      [10] 3793 	ld	hl,#_prota
   7631 36 02         [10] 3794 	ld	(hl),#0x02
                           3795 ;src/main.c:720: prota.mover = SI;
   7633 21 6F 5F      [10] 3796 	ld	hl,#(_prota + 0x0006)
   7636 36 01         [10] 3797 	ld	(hl),#0x01
                           3798 ;src/main.c:721: dibujarMapa();
   7638 CD 4F 60      [17] 3799 	call	_dibujarMapa
                           3800 ;src/main.c:722: inicializarEnemy();
   763B C3 05 75      [10] 3801 	jp  _inicializarEnemy
   763E                    3802 00102$:
                           3803 ;src/main.c:725: menuFin(puntuacion);
   763E FD 21 48 60   [14] 3804 	ld	iy,#_puntuacion
   7642 FD 6E 00      [19] 3805 	ld	l,0 (iy)
   7645 26 00         [ 7] 3806 	ld	h,#0x00
   7647 C3 39 4A      [10] 3807 	jp  _menuFin
                           3808 ;src/main.c:729: void moverIzquierda() {
                           3809 ;	---------------------------------
                           3810 ; Function moverIzquierda
                           3811 ; ---------------------------------
   764A                    3812 _moverIzquierda::
                           3813 ;src/main.c:730: prota.mira = M_izquierda;
   764A 01 69 5F      [10] 3814 	ld	bc,#_prota+0
   764D 21 70 5F      [10] 3815 	ld	hl,#(_prota + 0x0007)
   7650 36 01         [10] 3816 	ld	(hl),#0x01
                           3817 ;src/main.c:731: if (!checkCollision(M_izquierda)) {
   7652 C5            [11] 3818 	push	bc
   7653 3E 01         [ 7] 3819 	ld	a,#0x01
   7655 F5            [11] 3820 	push	af
   7656 33            [ 6] 3821 	inc	sp
   7657 CD B0 61      [17] 3822 	call	_checkCollision
   765A 33            [ 6] 3823 	inc	sp
   765B C1            [10] 3824 	pop	bc
   765C 7D            [ 4] 3825 	ld	a,l
   765D B7            [ 4] 3826 	or	a, a
   765E C0            [11] 3827 	ret	NZ
                           3828 ;src/main.c:732: prota.x--;
   765F 0A            [ 7] 3829 	ld	a,(bc)
   7660 C6 FF         [ 7] 3830 	add	a,#0xFF
   7662 02            [ 7] 3831 	ld	(bc),a
                           3832 ;src/main.c:733: prota.mover = SI;
   7663 21 6F 5F      [10] 3833 	ld	hl,#(_prota + 0x0006)
   7666 36 01         [10] 3834 	ld	(hl),#0x01
                           3835 ;src/main.c:734: prota.sprite = g_hero_left;
   7668 21 C6 3D      [10] 3836 	ld	hl,#_g_hero_left
   766B 22 6D 5F      [16] 3837 	ld	((_prota + 0x0004)), hl
   766E C9            [10] 3838 	ret
                           3839 ;src/main.c:738: void moverDerecha() {
                           3840 ;	---------------------------------
                           3841 ; Function moverDerecha
                           3842 ; ---------------------------------
   766F                    3843 _moverDerecha::
                           3844 ;src/main.c:739: prota.mira = M_derecha;
   766F 21 70 5F      [10] 3845 	ld	hl,#(_prota + 0x0007)
   7672 36 00         [10] 3846 	ld	(hl),#0x00
                           3847 ;src/main.c:740: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7674 AF            [ 4] 3848 	xor	a, a
   7675 F5            [11] 3849 	push	af
   7676 33            [ 6] 3850 	inc	sp
   7677 CD B0 61      [17] 3851 	call	_checkCollision
   767A 33            [ 6] 3852 	inc	sp
   767B 45            [ 4] 3853 	ld	b,l
   767C 21 69 5F      [10] 3854 	ld	hl, #_prota + 0
   767F 4E            [ 7] 3855 	ld	c,(hl)
   7680 59            [ 4] 3856 	ld	e,c
   7681 16 00         [ 7] 3857 	ld	d,#0x00
   7683 21 07 00      [10] 3858 	ld	hl,#0x0007
   7686 19            [11] 3859 	add	hl,de
   7687 11 50 80      [10] 3860 	ld	de, #0x8050
   768A 29            [11] 3861 	add	hl, hl
   768B 3F            [ 4] 3862 	ccf
   768C CB 1C         [ 8] 3863 	rr	h
   768E CB 1D         [ 8] 3864 	rr	l
   7690 ED 52         [15] 3865 	sbc	hl, de
   7692 3E 00         [ 7] 3866 	ld	a,#0x00
   7694 17            [ 4] 3867 	rla
   7695 5F            [ 4] 3868 	ld	e,a
   7696 78            [ 4] 3869 	ld	a,b
   7697 B7            [ 4] 3870 	or	a,a
   7698 20 14         [12] 3871 	jr	NZ,00104$
   769A B3            [ 4] 3872 	or	a,e
   769B 28 11         [12] 3873 	jr	Z,00104$
                           3874 ;src/main.c:741: prota.x++;
   769D 0C            [ 4] 3875 	inc	c
   769E 21 69 5F      [10] 3876 	ld	hl,#_prota
   76A1 71            [ 7] 3877 	ld	(hl),c
                           3878 ;src/main.c:742: prota.mover = SI;
   76A2 21 6F 5F      [10] 3879 	ld	hl,#(_prota + 0x0006)
   76A5 36 01         [10] 3880 	ld	(hl),#0x01
                           3881 ;src/main.c:743: prota.sprite = g_hero;
   76A7 21 70 3E      [10] 3882 	ld	hl,#_g_hero
   76AA 22 6D 5F      [16] 3883 	ld	((_prota + 0x0004)), hl
   76AD C9            [10] 3884 	ret
   76AE                    3885 00104$:
                           3886 ;src/main.c:745: }else if( prota.x + G_HERO_W >= 80){
   76AE 7B            [ 4] 3887 	ld	a,e
   76AF B7            [ 4] 3888 	or	a, a
   76B0 C0            [11] 3889 	ret	NZ
                           3890 ;src/main.c:746: avanzarMapa();
   76B1 C3 03 76      [10] 3891 	jp  _avanzarMapa
                           3892 ;src/main.c:750: void moverArriba() {
                           3893 ;	---------------------------------
                           3894 ; Function moverArriba
                           3895 ; ---------------------------------
   76B4                    3896 _moverArriba::
                           3897 ;src/main.c:751: prota.mira = M_arriba;
   76B4 21 70 5F      [10] 3898 	ld	hl,#(_prota + 0x0007)
   76B7 36 02         [10] 3899 	ld	(hl),#0x02
                           3900 ;src/main.c:752: if (!checkCollision(M_arriba)) {
   76B9 3E 02         [ 7] 3901 	ld	a,#0x02
   76BB F5            [11] 3902 	push	af
   76BC 33            [ 6] 3903 	inc	sp
   76BD CD B0 61      [17] 3904 	call	_checkCollision
   76C0 33            [ 6] 3905 	inc	sp
   76C1 7D            [ 4] 3906 	ld	a,l
   76C2 B7            [ 4] 3907 	or	a, a
   76C3 C0            [11] 3908 	ret	NZ
                           3909 ;src/main.c:753: prota.y--;
   76C4 21 6A 5F      [10] 3910 	ld	hl,#_prota + 1
   76C7 4E            [ 7] 3911 	ld	c,(hl)
   76C8 0D            [ 4] 3912 	dec	c
   76C9 71            [ 7] 3913 	ld	(hl),c
                           3914 ;src/main.c:754: prota.y--;
   76CA 0D            [ 4] 3915 	dec	c
   76CB 71            [ 7] 3916 	ld	(hl),c
                           3917 ;src/main.c:755: prota.mover  = SI;
   76CC 21 6F 5F      [10] 3918 	ld	hl,#(_prota + 0x0006)
   76CF 36 01         [10] 3919 	ld	(hl),#0x01
                           3920 ;src/main.c:756: prota.sprite = g_hero_up;
   76D1 21 2C 3D      [10] 3921 	ld	hl,#_g_hero_up
   76D4 22 6D 5F      [16] 3922 	ld	((_prota + 0x0004)), hl
   76D7 C9            [10] 3923 	ret
                           3924 ;src/main.c:760: void moverAbajo() {
                           3925 ;	---------------------------------
                           3926 ; Function moverAbajo
                           3927 ; ---------------------------------
   76D8                    3928 _moverAbajo::
                           3929 ;src/main.c:761: prota.mira = M_abajo;
   76D8 21 70 5F      [10] 3930 	ld	hl,#(_prota + 0x0007)
   76DB 36 03         [10] 3931 	ld	(hl),#0x03
                           3932 ;src/main.c:762: if (!checkCollision(M_abajo) ) {
   76DD 3E 03         [ 7] 3933 	ld	a,#0x03
   76DF F5            [11] 3934 	push	af
   76E0 33            [ 6] 3935 	inc	sp
   76E1 CD B0 61      [17] 3936 	call	_checkCollision
   76E4 33            [ 6] 3937 	inc	sp
   76E5 7D            [ 4] 3938 	ld	a,l
   76E6 B7            [ 4] 3939 	or	a, a
   76E7 C0            [11] 3940 	ret	NZ
                           3941 ;src/main.c:763: prota.y++;
   76E8 01 6A 5F      [10] 3942 	ld	bc,#_prota + 1
   76EB 0A            [ 7] 3943 	ld	a,(bc)
   76EC 3C            [ 4] 3944 	inc	a
   76ED 02            [ 7] 3945 	ld	(bc),a
                           3946 ;src/main.c:764: prota.y++;
   76EE 3C            [ 4] 3947 	inc	a
   76EF 02            [ 7] 3948 	ld	(bc),a
                           3949 ;src/main.c:765: prota.mover  = SI;
   76F0 21 6F 5F      [10] 3950 	ld	hl,#(_prota + 0x0006)
   76F3 36 01         [10] 3951 	ld	(hl),#0x01
                           3952 ;src/main.c:766: prota.sprite = g_hero_down;
   76F5 21 92 3C      [10] 3953 	ld	hl,#_g_hero_down
   76F8 22 6D 5F      [16] 3954 	ld	((_prota + 0x0004)), hl
   76FB C9            [10] 3955 	ret
                           3956 ;src/main.c:773: void intHandler() {
                           3957 ;	---------------------------------
                           3958 ; Function intHandler
                           3959 ; ---------------------------------
   76FC                    3960 _intHandler::
                           3961 ;src/main.c:774: if (++i == 6) {
   76FC 21 7B 5F      [10] 3962 	ld	hl, #_i+0
   76FF 34            [11] 3963 	inc	(hl)
   7700 3A 7B 5F      [13] 3964 	ld	a,(#_i + 0)
   7703 D6 06         [ 7] 3965 	sub	a, #0x06
   7705 C0            [11] 3966 	ret	NZ
                           3967 ;src/main.c:775: play();
   7706 CD CD 51      [17] 3968 	call	_play
                           3969 ;src/main.c:776: i=0;
   7709 21 7B 5F      [10] 3970 	ld	hl,#_i + 0
   770C 36 00         [10] 3971 	ld	(hl), #0x00
   770E C9            [10] 3972 	ret
                           3973 ;src/main.c:780: void inicializarCPC() {
                           3974 ;	---------------------------------
                           3975 ; Function inicializarCPC
                           3976 ; ---------------------------------
   770F                    3977 _inicializarCPC::
                           3978 ;src/main.c:781: cpct_disableFirmware();
   770F CD 74 55      [17] 3979 	call	_cpct_disableFirmware
                           3980 ;src/main.c:782: cpct_setVideoMode(0);
   7712 2E 00         [ 7] 3981 	ld	l,#0x00
   7714 CD 48 55      [17] 3982 	call	_cpct_setVideoMode
                           3983 ;src/main.c:783: cpct_setBorder(HW_BLACK);
   7717 21 10 14      [10] 3984 	ld	hl,#0x1410
   771A E5            [11] 3985 	push	hl
   771B CD AB 52      [17] 3986 	call	_cpct_setPALColour
                           3987 ;src/main.c:784: cpct_setPalette(g_palette, 16);
   771E 21 10 00      [10] 3988 	ld	hl,#0x0010
   7721 E5            [11] 3989 	push	hl
   7722 21 60 3E      [10] 3990 	ld	hl,#_g_palette
   7725 E5            [11] 3991 	push	hl
   7726 CD 88 52      [17] 3992 	call	_cpct_setPalette
   7729 C9            [10] 3993 	ret
                           3994 ;src/main.c:789: void inicializarJuego() {
                           3995 ;	---------------------------------
                           3996 ; Function inicializarJuego
                           3997 ; ---------------------------------
   772A                    3998 _inicializarJuego::
                           3999 ;src/main.c:791: num_mapa = 0;
   772A 21 47 60      [10] 4000 	ld	hl,#_num_mapa + 0
   772D 36 00         [10] 4001 	ld	(hl), #0x00
                           4002 ;src/main.c:792: mapa = mapas[num_mapa];
   772F 21 65 60      [10] 4003 	ld	hl, #_mapas + 0
   7732 7E            [ 7] 4004 	ld	a,(hl)
   7733 FD 21 45 60   [14] 4005 	ld	iy,#_mapa
   7737 FD 77 00      [19] 4006 	ld	0 (iy),a
   773A 23            [ 6] 4007 	inc	hl
   773B 7E            [ 7] 4008 	ld	a,(hl)
   773C 32 46 60      [13] 4009 	ld	(#_mapa + 1),a
                           4010 ;src/main.c:793: cpct_etm_setTileset2x4(g_tileset);
   773F 21 E0 17      [10] 4011 	ld	hl,#_g_tileset
   7742 CD 9C 54      [17] 4012 	call	_cpct_etm_setTileset2x4
                           4013 ;src/main.c:795: dibujarMapa();
   7745 CD 4F 60      [17] 4014 	call	_dibujarMapa
                           4015 ;src/main.c:798: barraPuntuacionInicial();
   7748 CD D9 4F      [17] 4016 	call	_barraPuntuacionInicial
                           4017 ;src/main.c:801: prota.x = prota.px = 4;
   774B 21 6B 5F      [10] 4018 	ld	hl,#(_prota + 0x0002)
   774E 36 04         [10] 4019 	ld	(hl),#0x04
   7750 21 69 5F      [10] 4020 	ld	hl,#_prota
   7753 36 04         [10] 4021 	ld	(hl),#0x04
                           4022 ;src/main.c:802: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   7755 21 6C 5F      [10] 4023 	ld	hl,#(_prota + 0x0003)
   7758 36 68         [10] 4024 	ld	(hl),#0x68
   775A 21 6A 5F      [10] 4025 	ld	hl,#(_prota + 0x0001)
   775D 36 68         [10] 4026 	ld	(hl),#0x68
                           4027 ;src/main.c:803: prota.mover  = NO;
   775F 21 6F 5F      [10] 4028 	ld	hl,#(_prota + 0x0006)
   7762 36 00         [10] 4029 	ld	(hl),#0x00
                           4030 ;src/main.c:804: prota.mira=M_derecha;
   7764 21 70 5F      [10] 4031 	ld	hl,#(_prota + 0x0007)
   7767 36 00         [10] 4032 	ld	(hl),#0x00
                           4033 ;src/main.c:805: prota.sprite = g_hero;
   7769 21 70 3E      [10] 4034 	ld	hl,#_g_hero
   776C 22 6D 5F      [16] 4035 	ld	((_prota + 0x0004)), hl
                           4036 ;src/main.c:809: cu.x = cu.px = 0;
   776F 21 73 5F      [10] 4037 	ld	hl,#(_cu + 0x0002)
   7772 36 00         [10] 4038 	ld	(hl),#0x00
   7774 21 71 5F      [10] 4039 	ld	hl,#_cu
   7777 36 00         [10] 4040 	ld	(hl),#0x00
                           4041 ;src/main.c:810: cu.y = cu.py = 0;
   7779 21 74 5F      [10] 4042 	ld	hl,#(_cu + 0x0003)
   777C 36 00         [10] 4043 	ld	(hl),#0x00
   777E 21 72 5F      [10] 4044 	ld	hl,#(_cu + 0x0001)
   7781 36 00         [10] 4045 	ld	(hl),#0x00
                           4046 ;src/main.c:811: cu.lanzado = NO;
   7783 21 77 5F      [10] 4047 	ld	hl,#(_cu + 0x0006)
   7786 36 00         [10] 4048 	ld	(hl),#0x00
                           4049 ;src/main.c:812: cu.mover = NO;
   7788 21 7A 5F      [10] 4050 	ld	hl,#(_cu + 0x0009)
   778B 36 00         [10] 4051 	ld	(hl),#0x00
                           4052 ;src/main.c:814: inicializarEnemy();
   778D CD 05 75      [17] 4053 	call	_inicializarEnemy
                           4054 ;src/main.c:816: dibujarProta();
   7790 C3 9B 60      [10] 4055 	jp  _dibujarProta
                           4056 ;src/main.c:819: void main(void) {
                           4057 ;	---------------------------------
                           4058 ; Function main
                           4059 ; ---------------------------------
   7793                    4060 _main::
   7793 DD E5         [15] 4061 	push	ix
   7795 DD 21 00 00   [14] 4062 	ld	ix,#0
   7799 DD 39         [15] 4063 	add	ix,sp
   779B 3B            [ 6] 4064 	dec	sp
                           4065 ;src/main.c:824: inicializarCPC();
   779C CD 0F 77      [17] 4066 	call	_inicializarCPC
                           4067 ;src/main.c:826: menuInicio();
   779F CD FA 4E      [17] 4068 	call	_menuInicio
                           4069 ;src/main.c:828: inicializarJuego();
   77A2 CD 2A 77      [17] 4070 	call	_inicializarJuego
                           4071 ;src/main.c:832: while (1) {
   77A5                    4072 00116$:
                           4073 ;src/main.c:835: actual = enemy;
                           4074 ;src/main.c:837: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   77A5 21 00 01      [10] 4075 	ld	hl,#_g_tablatrans
   77A8 E5            [11] 4076 	push	hl
   77A9 2A 45 60      [16] 4077 	ld	hl,(_mapa)
   77AC E5            [11] 4078 	push	hl
   77AD 21 69 5F      [10] 4079 	ld	hl,#_prota
   77B0 E5            [11] 4080 	push	hl
   77B1 21 71 5F      [10] 4081 	ld	hl,#_cu
   77B4 E5            [11] 4082 	push	hl
   77B5 CD 49 61      [17] 4083 	call	_comprobarTeclado
   77B8 21 08 00      [10] 4084 	ld	hl,#8
   77BB 39            [11] 4085 	add	hl,sp
   77BC F9            [ 6] 4086 	ld	sp,hl
                           4087 ;src/main.c:838: moverCuchillo(&cu, mapa);
   77BD 2A 45 60      [16] 4088 	ld	hl,(_mapa)
   77C0 E5            [11] 4089 	push	hl
   77C1 21 71 5F      [10] 4090 	ld	hl,#_cu
   77C4 E5            [11] 4091 	push	hl
   77C5 CD 00 43      [17] 4092 	call	_moverCuchillo
   77C8 F1            [10] 4093 	pop	af
   77C9 F1            [10] 4094 	pop	af
                           4095 ;src/main.c:839: updateEnemies();
   77CA CD 76 73      [17] 4096 	call	_updateEnemies
                           4097 ;src/main.c:841: cpct_waitVSYNC();
   77CD CD 40 55      [17] 4098 	call	_cpct_waitVSYNC
                           4099 ;src/main.c:844: if (prota.mover) {
   77D0 01 6F 5F      [10] 4100 	ld	bc,#_prota + 6
   77D3 0A            [ 7] 4101 	ld	a,(bc)
   77D4 B7            [ 4] 4102 	or	a, a
   77D5 28 07         [12] 4103 	jr	Z,00102$
                           4104 ;src/main.c:845: redibujarProta();
   77D7 C5            [11] 4105 	push	bc
   77D8 CD 35 61      [17] 4106 	call	_redibujarProta
   77DB C1            [10] 4107 	pop	bc
                           4108 ;src/main.c:846: prota.mover = NO;
   77DC AF            [ 4] 4109 	xor	a, a
   77DD 02            [ 7] 4110 	ld	(bc),a
   77DE                    4111 00102$:
                           4112 ;src/main.c:848: if(cu.lanzado && cu.mover){
   77DE 21 77 5F      [10] 4113 	ld	hl, #(_cu + 0x0006) + 0
   77E1 4E            [ 7] 4114 	ld	c,(hl)
                           4115 ;src/main.c:849: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4116 ;src/main.c:848: if(cu.lanzado && cu.mover){
   77E2 79            [ 4] 4117 	ld	a,c
   77E3 B7            [ 4] 4118 	or	a, a
   77E4 28 30         [12] 4119 	jr	Z,00107$
   77E6 3A 7A 5F      [13] 4120 	ld	a, (#(_cu + 0x0009) + 0)
   77E9 B7            [ 4] 4121 	or	a, a
   77EA 28 2A         [12] 4122 	jr	Z,00107$
                           4123 ;src/main.c:849: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   77EC 21 72 5F      [10] 4124 	ld	hl, #(_cu + 0x0001) + 0
   77EF 4E            [ 7] 4125 	ld	c,(hl)
   77F0 21 71 5F      [10] 4126 	ld	hl, #_cu + 0
   77F3 46            [ 7] 4127 	ld	b,(hl)
   77F4 21 79 5F      [10] 4128 	ld	hl, #(_cu + 0x0008) + 0
   77F7 5E            [ 7] 4129 	ld	e,(hl)
   77F8 2A 45 60      [16] 4130 	ld	hl,(_mapa)
   77FB E5            [11] 4131 	push	hl
   77FC 21 00 01      [10] 4132 	ld	hl,#_g_tablatrans
   77FF E5            [11] 4133 	push	hl
   7800 21 71 5F      [10] 4134 	ld	hl,#_cu
   7803 E5            [11] 4135 	push	hl
   7804 79            [ 4] 4136 	ld	a,c
   7805 F5            [11] 4137 	push	af
   7806 33            [ 6] 4138 	inc	sp
   7807 C5            [11] 4139 	push	bc
   7808 33            [ 6] 4140 	inc	sp
   7809 7B            [ 4] 4141 	ld	a,e
   780A F5            [11] 4142 	push	af
   780B 33            [ 6] 4143 	inc	sp
   780C CD 25 40      [17] 4144 	call	_redibujarCuchillo
   780F 21 09 00      [10] 4145 	ld	hl,#9
   7812 39            [11] 4146 	add	hl,sp
   7813 F9            [ 6] 4147 	ld	sp,hl
   7814 18 28         [12] 4148 	jr	00127$
   7816                    4149 00107$:
                           4150 ;src/main.c:850: }else if (cu.lanzado && !cu.mover){
   7816 79            [ 4] 4151 	ld	a,c
   7817 B7            [ 4] 4152 	or	a, a
   7818 28 24         [12] 4153 	jr	Z,00127$
   781A 3A 7A 5F      [13] 4154 	ld	a, (#(_cu + 0x0009) + 0)
   781D B7            [ 4] 4155 	or	a, a
   781E 20 1E         [12] 4156 	jr	NZ,00127$
                           4157 ;src/main.c:851: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   7820 21 72 5F      [10] 4158 	ld	hl, #(_cu + 0x0001) + 0
   7823 46            [ 7] 4159 	ld	b,(hl)
   7824 21 71 5F      [10] 4160 	ld	hl, #_cu + 0
   7827 4E            [ 7] 4161 	ld	c,(hl)
   7828 21 79 5F      [10] 4162 	ld	hl, #(_cu + 0x0008) + 0
   782B 56            [ 7] 4163 	ld	d,(hl)
   782C 2A 45 60      [16] 4164 	ld	hl,(_mapa)
   782F E5            [11] 4165 	push	hl
   7830 C5            [11] 4166 	push	bc
   7831 D5            [11] 4167 	push	de
   7832 33            [ 6] 4168 	inc	sp
   7833 CD 92 3F      [17] 4169 	call	_borrarCuchillo
   7836 F1            [10] 4170 	pop	af
   7837 F1            [10] 4171 	pop	af
   7838 33            [ 6] 4172 	inc	sp
                           4173 ;src/main.c:852: cu.lanzado = NO;
   7839 21 77 5F      [10] 4174 	ld	hl,#(_cu + 0x0006)
   783C 36 00         [10] 4175 	ld	(hl),#0x00
                           4176 ;src/main.c:855: while(i){
   783E                    4177 00127$:
   783E DD 36 FF 02   [19] 4178 	ld	-1 (ix),#0x02
   7842 01 F9 5E      [10] 4179 	ld	bc,#_enemy
   7845                    4180 00112$:
   7845 DD 7E FF      [19] 4181 	ld	a,-1 (ix)
   7848 B7            [ 4] 4182 	or	a, a
   7849 28 2C         [12] 4183 	jr	Z,00114$
                           4184 ;src/main.c:856: --i;
   784B DD 35 FF      [23] 4185 	dec	-1 (ix)
                           4186 ;src/main.c:857: if(actual->mover){
   784E C5            [11] 4187 	push	bc
   784F FD E1         [14] 4188 	pop	iy
   7851 FD 7E 06      [19] 4189 	ld	a,6 (iy)
   7854 B7            [ 4] 4190 	or	a, a
   7855 28 18         [12] 4191 	jr	Z,00111$
                           4192 ;src/main.c:858: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7857 69            [ 4] 4193 	ld	l, c
   7858 60            [ 4] 4194 	ld	h, b
   7859 23            [ 6] 4195 	inc	hl
   785A 23            [ 6] 4196 	inc	hl
   785B 23            [ 6] 4197 	inc	hl
   785C 5E            [ 7] 4198 	ld	e,(hl)
   785D 69            [ 4] 4199 	ld	l, c
   785E 60            [ 4] 4200 	ld	h, b
   785F 23            [ 6] 4201 	inc	hl
   7860 23            [ 6] 4202 	inc	hl
   7861 56            [ 7] 4203 	ld	d,(hl)
   7862 C5            [11] 4204 	push	bc
   7863 C5            [11] 4205 	push	bc
   7864 7B            [ 4] 4206 	ld	a,e
   7865 F5            [11] 4207 	push	af
   7866 33            [ 6] 4208 	inc	sp
   7867 D5            [11] 4209 	push	de
   7868 33            [ 6] 4210 	inc	sp
   7869 CD 7E 64      [17] 4211 	call	_redibujarEnemigo
   786C F1            [10] 4212 	pop	af
   786D F1            [10] 4213 	pop	af
   786E C1            [10] 4214 	pop	bc
   786F                    4215 00111$:
                           4216 ;src/main.c:871: ++actual;
   786F 21 1C 00      [10] 4217 	ld	hl,#0x001C
   7872 09            [11] 4218 	add	hl,bc
   7873 4D            [ 4] 4219 	ld	c,l
   7874 44            [ 4] 4220 	ld	b,h
   7875 18 CE         [12] 4221 	jr	00112$
   7877                    4222 00114$:
                           4223 ;src/main.c:873: cpct_waitVSYNC();
   7877 CD 40 55      [17] 4224 	call	_cpct_waitVSYNC
   787A C3 A5 77      [10] 4225 	jp	00116$
   787D 33            [ 6] 4226 	inc	sp
   787E DD E1         [14] 4227 	pop	ix
   7880 C9            [10] 4228 	ret
                           4229 	.area _CODE
                           4230 	.area _INITIALIZER
   604A                    4231 __xinit__mapa:
   604A 00 00              4232 	.dw #0x0000
   604C                    4233 __xinit__num_mapa:
   604C 00                 4234 	.db #0x00	; 0
   604D                    4235 __xinit__puntuacion:
   604D 00                 4236 	.db #0x00	; 0
   604E                    4237 __xinit__vidas:
   604E 05                 4238 	.db #0x05	; 5
                           4239 	.area _CABS (ABS)
