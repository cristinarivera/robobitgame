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
   615A C2 4B 76      [10]  378 	jp	NZ,_moverIzquierda
                            379 ;src/main.c:147: }else if (cpct_isKeyPressed(Key_CursorRight)){
   615D 21 00 02      [10]  380 	ld	hl,#0x0200
   6160 CD 9F 52      [17]  381 	call	_cpct_isKeyPressed
   6163 7D            [ 4]  382 	ld	a,l
   6164 B7            [ 4]  383 	or	a, a
                            384 ;src/main.c:148: moverDerecha();
   6165 C2 70 76      [10]  385 	jp	NZ,_moverDerecha
                            386 ;src/main.c:149: }else if (cpct_isKeyPressed(Key_CursorUp)){
   6168 21 00 01      [10]  387 	ld	hl,#0x0100
   616B CD 9F 52      [17]  388 	call	_cpct_isKeyPressed
   616E 7D            [ 4]  389 	ld	a,l
   616F B7            [ 4]  390 	or	a, a
                            391 ;src/main.c:150: moverArriba();
   6170 C2 B5 76      [10]  392 	jp	NZ,_moverArriba
                            393 ;src/main.c:151: }else if (cpct_isKeyPressed(Key_CursorDown)){
   6173 21 00 04      [10]  394 	ld	hl,#0x0400
   6176 CD 9F 52      [17]  395 	call	_cpct_isKeyPressed
   6179 7D            [ 4]  396 	ld	a,l
   617A B7            [ 4]  397 	or	a, a
                            398 ;src/main.c:152: moverAbajo();
   617B C2 D9 76      [10]  399 	jp	NZ,_moverAbajo
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
   61C8 DA 00 63      [10]  453 	jp	C,00105$
   61CB DD 5E 04      [19]  454 	ld	e,4 (ix)
   61CE 16 00         [ 7]  455 	ld	d,#0x00
   61D0 21 D7 61      [10]  456 	ld	hl,#00124$
   61D3 19            [11]  457 	add	hl,de
   61D4 19            [11]  458 	add	hl,de
   61D5 19            [11]  459 	add	hl,de
   61D6 E9            [ 4]  460 	jp	(hl)
   61D7                     461 00124$:
   61D7 C3 E3 61      [10]  462 	jp	00101$
   61DA C3 38 62      [10]  463 	jp	00102$
   61DD C3 88 62      [10]  464 	jp	00103$
   61E0 C3 C5 62      [10]  465 	jp	00104$
                            466 ;src/main.c:163: case 0:
   61E3                     467 00101$:
                            468 ;src/main.c:164: headTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y);
   61E3 21 6A 5F      [10]  469 	ld	hl, #(_prota + 0x0001) + 0
   61E6 4E            [ 7]  470 	ld	c,(hl)
   61E7 3A 69 5F      [13]  471 	ld	a, (#_prota + 0)
   61EA C6 07         [ 7]  472 	add	a, #0x07
   61EC 47            [ 4]  473 	ld	b,a
   61ED 79            [ 4]  474 	ld	a,c
   61EE F5            [11]  475 	push	af
   61EF 33            [ 6]  476 	inc	sp
   61F0 C5            [11]  477 	push	bc
   61F1 33            [ 6]  478 	inc	sp
   61F2 2A 45 60      [16]  479 	ld	hl,(_mapa)
   61F5 E5            [11]  480 	push	hl
   61F6 CD B5 49      [17]  481 	call	_getTilePtr
   61F9 F1            [10]  482 	pop	af
   61FA F1            [10]  483 	pop	af
   61FB 33            [ 6]  484 	inc	sp
   61FC 33            [ 6]  485 	inc	sp
   61FD E5            [11]  486 	push	hl
                            487 ;src/main.c:165: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA - 2);
   61FE 3A 6A 5F      [13]  488 	ld	a, (#(_prota + 0x0001) + 0)
   6201 C6 14         [ 7]  489 	add	a, #0x14
   6203 4F            [ 4]  490 	ld	c,a
   6204 3A 69 5F      [13]  491 	ld	a, (#_prota + 0)
   6207 C6 07         [ 7]  492 	add	a, #0x07
   6209 47            [ 4]  493 	ld	b,a
   620A 79            [ 4]  494 	ld	a,c
   620B F5            [11]  495 	push	af
   620C 33            [ 6]  496 	inc	sp
   620D C5            [11]  497 	push	bc
   620E 33            [ 6]  498 	inc	sp
   620F 2A 45 60      [16]  499 	ld	hl,(_mapa)
   6212 E5            [11]  500 	push	hl
   6213 CD B5 49      [17]  501 	call	_getTilePtr
   6216 F1            [10]  502 	pop	af
   6217 F1            [10]  503 	pop	af
   6218 EB            [ 4]  504 	ex	de,hl
                            505 ;src/main.c:166: waistTile = getTilePtr(mapa, prota.x + G_HERO_W, prota.y + ALTO_PROTA/2);
   6219 3A 6A 5F      [13]  506 	ld	a, (#(_prota + 0x0001) + 0)
   621C C6 0B         [ 7]  507 	add	a, #0x0B
   621E 47            [ 4]  508 	ld	b,a
   621F 3A 69 5F      [13]  509 	ld	a, (#_prota + 0)
   6222 C6 07         [ 7]  510 	add	a, #0x07
   6224 D5            [11]  511 	push	de
   6225 C5            [11]  512 	push	bc
   6226 33            [ 6]  513 	inc	sp
   6227 F5            [11]  514 	push	af
   6228 33            [ 6]  515 	inc	sp
   6229 2A 45 60      [16]  516 	ld	hl,(_mapa)
   622C E5            [11]  517 	push	hl
   622D CD B5 49      [17]  518 	call	_getTilePtr
   6230 F1            [10]  519 	pop	af
   6231 F1            [10]  520 	pop	af
   6232 4D            [ 4]  521 	ld	c,l
   6233 44            [ 4]  522 	ld	b,h
   6234 D1            [10]  523 	pop	de
                            524 ;src/main.c:167: break;
   6235 C3 00 63      [10]  525 	jp	00105$
                            526 ;src/main.c:168: case 1:
   6238                     527 00102$:
                            528 ;src/main.c:169: headTile  = getTilePtr(mapa, prota.x - 1, prota.y);
   6238 21 6A 5F      [10]  529 	ld	hl, #(_prota + 0x0001) + 0
   623B 56            [ 7]  530 	ld	d,(hl)
   623C 21 69 5F      [10]  531 	ld	hl, #_prota + 0
   623F 46            [ 7]  532 	ld	b,(hl)
   6240 05            [ 4]  533 	dec	b
   6241 D5            [11]  534 	push	de
   6242 33            [ 6]  535 	inc	sp
   6243 C5            [11]  536 	push	bc
   6244 33            [ 6]  537 	inc	sp
   6245 2A 45 60      [16]  538 	ld	hl,(_mapa)
   6248 E5            [11]  539 	push	hl
   6249 CD B5 49      [17]  540 	call	_getTilePtr
   624C F1            [10]  541 	pop	af
   624D F1            [10]  542 	pop	af
   624E 33            [ 6]  543 	inc	sp
   624F 33            [ 6]  544 	inc	sp
   6250 E5            [11]  545 	push	hl
                            546 ;src/main.c:170: feetTile  = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA - 2);
   6251 3A 6A 5F      [13]  547 	ld	a, (#(_prota + 0x0001) + 0)
   6254 C6 14         [ 7]  548 	add	a, #0x14
   6256 57            [ 4]  549 	ld	d,a
   6257 21 69 5F      [10]  550 	ld	hl, #_prota + 0
   625A 46            [ 7]  551 	ld	b,(hl)
   625B 05            [ 4]  552 	dec	b
   625C D5            [11]  553 	push	de
   625D 33            [ 6]  554 	inc	sp
   625E C5            [11]  555 	push	bc
   625F 33            [ 6]  556 	inc	sp
   6260 2A 45 60      [16]  557 	ld	hl,(_mapa)
   6263 E5            [11]  558 	push	hl
   6264 CD B5 49      [17]  559 	call	_getTilePtr
   6267 F1            [10]  560 	pop	af
   6268 F1            [10]  561 	pop	af
   6269 EB            [ 4]  562 	ex	de,hl
                            563 ;src/main.c:171: waistTile = getTilePtr(mapa, prota.x - 1, prota.y + ALTO_PROTA/2);
   626A 3A 6A 5F      [13]  564 	ld	a, (#(_prota + 0x0001) + 0)
   626D C6 0B         [ 7]  565 	add	a, #0x0B
   626F 47            [ 4]  566 	ld	b,a
   6270 3A 69 5F      [13]  567 	ld	a, (#_prota + 0)
   6273 C6 FF         [ 7]  568 	add	a,#0xFF
   6275 D5            [11]  569 	push	de
   6276 C5            [11]  570 	push	bc
   6277 33            [ 6]  571 	inc	sp
   6278 F5            [11]  572 	push	af
   6279 33            [ 6]  573 	inc	sp
   627A 2A 45 60      [16]  574 	ld	hl,(_mapa)
   627D E5            [11]  575 	push	hl
   627E CD B5 49      [17]  576 	call	_getTilePtr
   6281 F1            [10]  577 	pop	af
   6282 F1            [10]  578 	pop	af
   6283 4D            [ 4]  579 	ld	c,l
   6284 44            [ 4]  580 	ld	b,h
   6285 D1            [10]  581 	pop	de
                            582 ;src/main.c:172: break;
   6286 18 78         [12]  583 	jr	00105$
                            584 ;src/main.c:173: case 2:
   6288                     585 00103$:
                            586 ;src/main.c:174: headTile   = getTilePtr(mapa, prota.x, prota.y - 2);
   6288 3A 6A 5F      [13]  587 	ld	a, (#(_prota + 0x0001) + 0)
   628B C6 FE         [ 7]  588 	add	a,#0xFE
   628D 21 69 5F      [10]  589 	ld	hl, #_prota + 0
   6290 56            [ 7]  590 	ld	d,(hl)
   6291 C5            [11]  591 	push	bc
   6292 F5            [11]  592 	push	af
   6293 33            [ 6]  593 	inc	sp
   6294 D5            [11]  594 	push	de
   6295 33            [ 6]  595 	inc	sp
   6296 2A 45 60      [16]  596 	ld	hl,(_mapa)
   6299 E5            [11]  597 	push	hl
   629A CD B5 49      [17]  598 	call	_getTilePtr
   629D F1            [10]  599 	pop	af
   629E F1            [10]  600 	pop	af
   629F C1            [10]  601 	pop	bc
   62A0 33            [ 6]  602 	inc	sp
   62A1 33            [ 6]  603 	inc	sp
   62A2 E5            [11]  604 	push	hl
                            605 ;src/main.c:175: feetTile   = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y - 2);
   62A3 21 6A 5F      [10]  606 	ld	hl, #(_prota + 0x0001) + 0
   62A6 56            [ 7]  607 	ld	d,(hl)
   62A7 15            [ 4]  608 	dec	d
   62A8 15            [ 4]  609 	dec	d
   62A9 3A 69 5F      [13]  610 	ld	a, (#_prota + 0)
   62AC C6 03         [ 7]  611 	add	a, #0x03
   62AE C5            [11]  612 	push	bc
   62AF D5            [11]  613 	push	de
   62B0 33            [ 6]  614 	inc	sp
   62B1 F5            [11]  615 	push	af
   62B2 33            [ 6]  616 	inc	sp
   62B3 2A 45 60      [16]  617 	ld	hl,(_mapa)
   62B6 E5            [11]  618 	push	hl
   62B7 CD B5 49      [17]  619 	call	_getTilePtr
   62BA F1            [10]  620 	pop	af
   62BB F1            [10]  621 	pop	af
   62BC EB            [ 4]  622 	ex	de,hl
   62BD C1            [10]  623 	pop	bc
                            624 ;src/main.c:176: *waistTile = 0;
   62BE 21 00 00      [10]  625 	ld	hl,#0x0000
   62C1 36 00         [10]  626 	ld	(hl),#0x00
                            627 ;src/main.c:177: break;
   62C3 18 3B         [12]  628 	jr	00105$
                            629 ;src/main.c:178: case 3:
   62C5                     630 00104$:
                            631 ;src/main.c:179: headTile  = getTilePtr(mapa, prota.x, prota.y + ALTO_PROTA  );
   62C5 3A 6A 5F      [13]  632 	ld	a, (#(_prota + 0x0001) + 0)
   62C8 C6 16         [ 7]  633 	add	a, #0x16
   62CA 21 69 5F      [10]  634 	ld	hl, #_prota + 0
   62CD 56            [ 7]  635 	ld	d,(hl)
   62CE C5            [11]  636 	push	bc
   62CF F5            [11]  637 	push	af
   62D0 33            [ 6]  638 	inc	sp
   62D1 D5            [11]  639 	push	de
   62D2 33            [ 6]  640 	inc	sp
   62D3 2A 45 60      [16]  641 	ld	hl,(_mapa)
   62D6 E5            [11]  642 	push	hl
   62D7 CD B5 49      [17]  643 	call	_getTilePtr
   62DA F1            [10]  644 	pop	af
   62DB F1            [10]  645 	pop	af
   62DC C1            [10]  646 	pop	bc
   62DD 33            [ 6]  647 	inc	sp
   62DE 33            [ 6]  648 	inc	sp
   62DF E5            [11]  649 	push	hl
                            650 ;src/main.c:180: feetTile  = getTilePtr(mapa, prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   62E0 3A 6A 5F      [13]  651 	ld	a, (#(_prota + 0x0001) + 0)
   62E3 C6 16         [ 7]  652 	add	a, #0x16
   62E5 57            [ 4]  653 	ld	d,a
   62E6 3A 69 5F      [13]  654 	ld	a, (#_prota + 0)
   62E9 C6 03         [ 7]  655 	add	a, #0x03
   62EB C5            [11]  656 	push	bc
   62EC D5            [11]  657 	push	de
   62ED 33            [ 6]  658 	inc	sp
   62EE F5            [11]  659 	push	af
   62EF 33            [ 6]  660 	inc	sp
   62F0 2A 45 60      [16]  661 	ld	hl,(_mapa)
   62F3 E5            [11]  662 	push	hl
   62F4 CD B5 49      [17]  663 	call	_getTilePtr
   62F7 F1            [10]  664 	pop	af
   62F8 F1            [10]  665 	pop	af
   62F9 EB            [ 4]  666 	ex	de,hl
   62FA C1            [10]  667 	pop	bc
                            668 ;src/main.c:181: *waistTile = 0;
   62FB 21 00 00      [10]  669 	ld	hl,#0x0000
   62FE 36 00         [10]  670 	ld	(hl),#0x00
                            671 ;src/main.c:183: }
   6300                     672 00105$:
                            673 ;src/main.c:185: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   6300 E1            [10]  674 	pop	hl
   6301 E5            [11]  675 	push	hl
   6302 6E            [ 7]  676 	ld	l,(hl)
   6303 3E 02         [ 7]  677 	ld	a,#0x02
   6305 95            [ 4]  678 	sub	a, l
   6306 38 0E         [12]  679 	jr	C,00106$
   6308 1A            [ 7]  680 	ld	a,(de)
   6309 5F            [ 4]  681 	ld	e,a
   630A 3E 02         [ 7]  682 	ld	a,#0x02
   630C 93            [ 4]  683 	sub	a, e
   630D 38 07         [12]  684 	jr	C,00106$
   630F 0A            [ 7]  685 	ld	a,(bc)
   6310 4F            [ 4]  686 	ld	c,a
   6311 3E 02         [ 7]  687 	ld	a,#0x02
   6313 91            [ 4]  688 	sub	a, c
   6314 30 04         [12]  689 	jr	NC,00107$
   6316                     690 00106$:
                            691 ;src/main.c:186: return 1;
   6316 2E 01         [ 7]  692 	ld	l,#0x01
   6318 18 02         [12]  693 	jr	00110$
   631A                     694 00107$:
                            695 ;src/main.c:188: return 0;
   631A 2E 00         [ 7]  696 	ld	l,#0x00
   631C                     697 00110$:
   631C DD F9         [10]  698 	ld	sp, ix
   631E DD E1         [14]  699 	pop	ix
   6320 C9            [10]  700 	ret
                            701 ;src/main.c:191: void dibujarEnemigo(TEnemy *enemy) {
                            702 ;	---------------------------------
                            703 ; Function dibujarEnemigo
                            704 ; ---------------------------------
   6321                     705 _dibujarEnemigo::
   6321 DD E5         [15]  706 	push	ix
   6323 DD 21 00 00   [14]  707 	ld	ix,#0
   6327 DD 39         [15]  708 	add	ix,sp
                            709 ;src/main.c:192: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   6329 DD 4E 04      [19]  710 	ld	c,4 (ix)
   632C DD 46 05      [19]  711 	ld	b,5 (ix)
   632F 69            [ 4]  712 	ld	l, c
   6330 60            [ 4]  713 	ld	h, b
   6331 23            [ 6]  714 	inc	hl
   6332 56            [ 7]  715 	ld	d,(hl)
   6333 0A            [ 7]  716 	ld	a,(bc)
   6334 C5            [11]  717 	push	bc
   6335 D5            [11]  718 	push	de
   6336 33            [ 6]  719 	inc	sp
   6337 F5            [11]  720 	push	af
   6338 33            [ 6]  721 	inc	sp
   6339 21 00 C0      [10]  722 	ld	hl,#0xC000
   633C E5            [11]  723 	push	hl
   633D CD 9E 5E      [17]  724 	call	_cpct_getScreenPtr
   6340 EB            [ 4]  725 	ex	de,hl
                            726 ;src/main.c:193: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   6341 E1            [10]  727 	pop	hl
   6342 01 04 00      [10]  728 	ld	bc, #0x0004
   6345 09            [11]  729 	add	hl, bc
   6346 4E            [ 7]  730 	ld	c,(hl)
   6347 23            [ 6]  731 	inc	hl
   6348 46            [ 7]  732 	ld	b,(hl)
   6349 21 00 01      [10]  733 	ld	hl,#_g_tablatrans
   634C E5            [11]  734 	push	hl
   634D 21 04 16      [10]  735 	ld	hl,#0x1604
   6350 E5            [11]  736 	push	hl
   6351 D5            [11]  737 	push	de
   6352 C5            [11]  738 	push	bc
   6353 CD BE 5E      [17]  739 	call	_cpct_drawSpriteMaskedAlignedTable
   6356 DD E1         [14]  740 	pop	ix
   6358 C9            [10]  741 	ret
                            742 ;src/main.c:196: void dibujarExplosion(TEnemy *enemy) {
                            743 ;	---------------------------------
                            744 ; Function dibujarExplosion
                            745 ; ---------------------------------
   6359                     746 _dibujarExplosion::
   6359 DD E5         [15]  747 	push	ix
   635B DD 21 00 00   [14]  748 	ld	ix,#0
   635F DD 39         [15]  749 	add	ix,sp
                            750 ;src/main.c:197: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   6361 DD 4E 04      [19]  751 	ld	c,4 (ix)
   6364 DD 46 05      [19]  752 	ld	b,5 (ix)
   6367 69            [ 4]  753 	ld	l, c
   6368 60            [ 4]  754 	ld	h, b
   6369 23            [ 6]  755 	inc	hl
   636A 56            [ 7]  756 	ld	d,(hl)
   636B 0A            [ 7]  757 	ld	a,(bc)
   636C 47            [ 4]  758 	ld	b,a
   636D D5            [11]  759 	push	de
   636E 33            [ 6]  760 	inc	sp
   636F C5            [11]  761 	push	bc
   6370 33            [ 6]  762 	inc	sp
   6371 21 00 C0      [10]  763 	ld	hl,#0xC000
   6374 E5            [11]  764 	push	hl
   6375 CD 9E 5E      [17]  765 	call	_cpct_getScreenPtr
   6378 4D            [ 4]  766 	ld	c,l
   6379 44            [ 4]  767 	ld	b,h
                            768 ;src/main.c:198: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   637A 11 00 01      [10]  769 	ld	de,#_g_tablatrans+0
   637D D5            [11]  770 	push	de
   637E 21 04 16      [10]  771 	ld	hl,#0x1604
   6381 E5            [11]  772 	push	hl
   6382 C5            [11]  773 	push	bc
   6383 21 70 19      [10]  774 	ld	hl,#_g_explosion
   6386 E5            [11]  775 	push	hl
   6387 CD BE 5E      [17]  776 	call	_cpct_drawSpriteMaskedAlignedTable
   638A DD E1         [14]  777 	pop	ix
   638C C9            [10]  778 	ret
                            779 ;src/main.c:201: void borrarExplosion(TEnemy *enemy) {
                            780 ;	---------------------------------
                            781 ; Function borrarExplosion
                            782 ; ---------------------------------
   638D                     783 _borrarExplosion::
   638D DD E5         [15]  784 	push	ix
   638F DD 21 00 00   [14]  785 	ld	ix,#0
   6393 DD 39         [15]  786 	add	ix,sp
   6395 F5            [11]  787 	push	af
   6396 3B            [ 6]  788 	dec	sp
                            789 ;src/main.c:204: u8 w = 4 + (enemy->px & 1);
   6397 DD 5E 04      [19]  790 	ld	e,4 (ix)
   639A DD 56 05      [19]  791 	ld	d,5 (ix)
   639D 6B            [ 4]  792 	ld	l, e
   639E 62            [ 4]  793 	ld	h, d
   639F 23            [ 6]  794 	inc	hl
   63A0 23            [ 6]  795 	inc	hl
   63A1 4E            [ 7]  796 	ld	c,(hl)
   63A2 79            [ 4]  797 	ld	a,c
   63A3 E6 01         [ 7]  798 	and	a, #0x01
   63A5 47            [ 4]  799 	ld	b,a
   63A6 04            [ 4]  800 	inc	b
   63A7 04            [ 4]  801 	inc	b
   63A8 04            [ 4]  802 	inc	b
   63A9 04            [ 4]  803 	inc	b
                            804 ;src/main.c:207: u8 h = 6 + (enemy->py & 2 ? 1 : 0);
   63AA EB            [ 4]  805 	ex	de,hl
   63AB 23            [ 6]  806 	inc	hl
   63AC 23            [ 6]  807 	inc	hl
   63AD 23            [ 6]  808 	inc	hl
   63AE 5E            [ 7]  809 	ld	e,(hl)
   63AF CB 4B         [ 8]  810 	bit	1, e
   63B1 28 04         [12]  811 	jr	Z,00103$
   63B3 3E 01         [ 7]  812 	ld	a,#0x01
   63B5 18 02         [12]  813 	jr	00104$
   63B7                     814 00103$:
   63B7 3E 00         [ 7]  815 	ld	a,#0x00
   63B9                     816 00104$:
   63B9 C6 06         [ 7]  817 	add	a, #0x06
   63BB DD 77 FD      [19]  818 	ld	-3 (ix),a
                            819 ;src/main.c:209: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   63BE FD 2A 45 60   [20]  820 	ld	iy,(_mapa)
   63C2 16 00         [ 7]  821 	ld	d,#0x00
   63C4 7B            [ 4]  822 	ld	a,e
   63C5 C6 E8         [ 7]  823 	add	a,#0xE8
   63C7 DD 77 FE      [19]  824 	ld	-2 (ix),a
   63CA 7A            [ 4]  825 	ld	a,d
   63CB CE FF         [ 7]  826 	adc	a,#0xFF
   63CD DD 77 FF      [19]  827 	ld	-1 (ix),a
   63D0 DD 6E FE      [19]  828 	ld	l,-2 (ix)
   63D3 DD 66 FF      [19]  829 	ld	h,-1 (ix)
   63D6 DD CB FF 7E   [20]  830 	bit	7, -1 (ix)
   63DA 28 04         [12]  831 	jr	Z,00105$
   63DC 21 EB FF      [10]  832 	ld	hl,#0xFFEB
   63DF 19            [11]  833 	add	hl,de
   63E0                     834 00105$:
   63E0 CB 2C         [ 8]  835 	sra	h
   63E2 CB 1D         [ 8]  836 	rr	l
   63E4 CB 2C         [ 8]  837 	sra	h
   63E6 CB 1D         [ 8]  838 	rr	l
   63E8 55            [ 4]  839 	ld	d,l
   63E9 CB 39         [ 8]  840 	srl	c
   63EB FD E5         [15]  841 	push	iy
   63ED 21 F0 C0      [10]  842 	ld	hl,#0xC0F0
   63F0 E5            [11]  843 	push	hl
   63F1 3E 28         [ 7]  844 	ld	a,#0x28
   63F3 F5            [11]  845 	push	af
   63F4 33            [ 6]  846 	inc	sp
   63F5 DD 7E FD      [19]  847 	ld	a,-3 (ix)
   63F8 F5            [11]  848 	push	af
   63F9 33            [ 6]  849 	inc	sp
   63FA C5            [11]  850 	push	bc
   63FB 33            [ 6]  851 	inc	sp
   63FC D5            [11]  852 	push	de
   63FD 33            [ 6]  853 	inc	sp
   63FE 79            [ 4]  854 	ld	a,c
   63FF F5            [11]  855 	push	af
   6400 33            [ 6]  856 	inc	sp
   6401 CD 80 53      [17]  857 	call	_cpct_etm_drawTileBox2x4
   6404 DD F9         [10]  858 	ld	sp, ix
   6406 DD E1         [14]  859 	pop	ix
   6408 C9            [10]  860 	ret
                            861 ;src/main.c:213: void borrarEnemigo(u8 x, u8 y) {
                            862 ;	---------------------------------
                            863 ; Function borrarEnemigo
                            864 ; ---------------------------------
   6409                     865 _borrarEnemigo::
   6409 DD E5         [15]  866 	push	ix
   640B DD 21 00 00   [14]  867 	ld	ix,#0
   640F DD 39         [15]  868 	add	ix,sp
   6411 F5            [11]  869 	push	af
   6412 F5            [11]  870 	push	af
                            871 ;src/main.c:217: u8 w = 4 + (x & 1);
   6413 DD 7E 04      [19]  872 	ld	a,4 (ix)
   6416 E6 01         [ 7]  873 	and	a, #0x01
   6418 5F            [ 4]  874 	ld	e,a
   6419 1C            [ 4]  875 	inc	e
   641A 1C            [ 4]  876 	inc	e
   641B 1C            [ 4]  877 	inc	e
   641C 1C            [ 4]  878 	inc	e
                            879 ;src/main.c:220: u8 h = 6 + (y & 3 ? 1 : 0);
   641D DD 7E 05      [19]  880 	ld	a,5 (ix)
   6420 E6 03         [ 7]  881 	and	a, #0x03
   6422 28 04         [12]  882 	jr	Z,00103$
   6424 3E 01         [ 7]  883 	ld	a,#0x01
   6426 18 02         [12]  884 	jr	00104$
   6428                     885 00103$:
   6428 3E 00         [ 7]  886 	ld	a,#0x00
   642A                     887 00104$:
   642A C6 06         [ 7]  888 	add	a, #0x06
   642C 57            [ 4]  889 	ld	d,a
                            890 ;src/main.c:222: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   642D 2A 45 60      [16]  891 	ld	hl,(_mapa)
   6430 DD 75 FE      [19]  892 	ld	-2 (ix),l
   6433 DD 74 FF      [19]  893 	ld	-1 (ix),h
   6436 DD 4E 05      [19]  894 	ld	c,5 (ix)
   6439 06 00         [ 7]  895 	ld	b,#0x00
   643B 79            [ 4]  896 	ld	a,c
   643C C6 E8         [ 7]  897 	add	a,#0xE8
   643E DD 77 FC      [19]  898 	ld	-4 (ix),a
   6441 78            [ 4]  899 	ld	a,b
   6442 CE FF         [ 7]  900 	adc	a,#0xFF
   6444 DD 77 FD      [19]  901 	ld	-3 (ix),a
   6447 E1            [10]  902 	pop	hl
   6448 E5            [11]  903 	push	hl
   6449 DD CB FD 7E   [20]  904 	bit	7, -3 (ix)
   644D 28 04         [12]  905 	jr	Z,00105$
   644F 21 EB FF      [10]  906 	ld	hl,#0xFFEB
   6452 09            [11]  907 	add	hl,bc
   6453                     908 00105$:
   6453 CB 2C         [ 8]  909 	sra	h
   6455 CB 1D         [ 8]  910 	rr	l
   6457 CB 2C         [ 8]  911 	sra	h
   6459 CB 1D         [ 8]  912 	rr	l
   645B 45            [ 4]  913 	ld	b,l
   645C DD 4E 04      [19]  914 	ld	c,4 (ix)
   645F CB 39         [ 8]  915 	srl	c
   6461 DD 6E FE      [19]  916 	ld	l,-2 (ix)
   6464 DD 66 FF      [19]  917 	ld	h,-1 (ix)
   6467 E5            [11]  918 	push	hl
   6468 21 F0 C0      [10]  919 	ld	hl,#0xC0F0
   646B E5            [11]  920 	push	hl
   646C 3E 28         [ 7]  921 	ld	a,#0x28
   646E F5            [11]  922 	push	af
   646F 33            [ 6]  923 	inc	sp
   6470 D5            [11]  924 	push	de
   6471 C5            [11]  925 	push	bc
   6472 CD 80 53      [17]  926 	call	_cpct_etm_drawTileBox2x4
                            927 ;src/main.c:224: enemy->mover = NO;
   6475 21 FF 5E      [10]  928 	ld	hl,#(_enemy + 0x0006)
   6478 36 00         [10]  929 	ld	(hl),#0x00
   647A DD F9         [10]  930 	ld	sp, ix
   647C DD E1         [14]  931 	pop	ix
   647E C9            [10]  932 	ret
                            933 ;src/main.c:227: void redibujarEnemigo(u8 x, u8 y, TEnemy *enemy) {
                            934 ;	---------------------------------
                            935 ; Function redibujarEnemigo
                            936 ; ---------------------------------
   647F                     937 _redibujarEnemigo::
   647F DD E5         [15]  938 	push	ix
   6481 DD 21 00 00   [14]  939 	ld	ix,#0
   6485 DD 39         [15]  940 	add	ix,sp
                            941 ;src/main.c:228: borrarEnemigo(x, y);
   6487 DD 66 05      [19]  942 	ld	h,5 (ix)
   648A DD 6E 04      [19]  943 	ld	l,4 (ix)
   648D E5            [11]  944 	push	hl
   648E CD 09 64      [17]  945 	call	_borrarEnemigo
   6491 F1            [10]  946 	pop	af
                            947 ;src/main.c:229: enemy->px = enemy->x;
   6492 DD 4E 06      [19]  948 	ld	c,6 (ix)
   6495 DD 46 07      [19]  949 	ld	b,7 (ix)
   6498 59            [ 4]  950 	ld	e, c
   6499 50            [ 4]  951 	ld	d, b
   649A 13            [ 6]  952 	inc	de
   649B 13            [ 6]  953 	inc	de
   649C 0A            [ 7]  954 	ld	a,(bc)
   649D 12            [ 7]  955 	ld	(de),a
                            956 ;src/main.c:230: enemy->py = enemy->y;
   649E 59            [ 4]  957 	ld	e, c
   649F 50            [ 4]  958 	ld	d, b
   64A0 13            [ 6]  959 	inc	de
   64A1 13            [ 6]  960 	inc	de
   64A2 13            [ 6]  961 	inc	de
   64A3 69            [ 4]  962 	ld	l, c
   64A4 60            [ 4]  963 	ld	h, b
   64A5 23            [ 6]  964 	inc	hl
   64A6 7E            [ 7]  965 	ld	a,(hl)
   64A7 12            [ 7]  966 	ld	(de),a
                            967 ;src/main.c:231: dibujarEnemigo(enemy);
   64A8 C5            [11]  968 	push	bc
   64A9 CD 21 63      [17]  969 	call	_dibujarEnemigo
   64AC F1            [10]  970 	pop	af
   64AD DD E1         [14]  971 	pop	ix
   64AF C9            [10]  972 	ret
                            973 ;src/main.c:234: u8 checkEnemyCollision(u8 direction, TEnemy *enemy){
                            974 ;	---------------------------------
                            975 ; Function checkEnemyCollision
                            976 ; ---------------------------------
   64B0                     977 _checkEnemyCollision::
   64B0 DD E5         [15]  978 	push	ix
   64B2 DD 21 00 00   [14]  979 	ld	ix,#0
   64B6 DD 39         [15]  980 	add	ix,sp
   64B8 21 F7 FF      [10]  981 	ld	hl,#-9
   64BB 39            [11]  982 	add	hl,sp
   64BC F9            [ 6]  983 	ld	sp,hl
                            984 ;src/main.c:236: u8 colisiona = 1;
   64BD DD 36 F7 01   [19]  985 	ld	-9 (ix),#0x01
                            986 ;src/main.c:238: switch (direction) {
   64C1 3E 03         [ 7]  987 	ld	a,#0x03
   64C3 DD 96 04      [19]  988 	sub	a, 4 (ix)
   64C6 DA A3 68      [10]  989 	jp	C,00165$
                            990 ;src/main.c:240: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   64C9 DD 4E 05      [19]  991 	ld	c,5 (ix)
   64CC DD 46 06      [19]  992 	ld	b,6 (ix)
   64CF 0A            [ 7]  993 	ld	a,(bc)
   64D0 5F            [ 4]  994 	ld	e,a
   64D1 21 01 00      [10]  995 	ld	hl,#0x0001
   64D4 09            [11]  996 	add	hl,bc
   64D5 DD 75 F8      [19]  997 	ld	-8 (ix),l
   64D8 DD 74 F9      [19]  998 	ld	-7 (ix),h
   64DB DD 6E F8      [19]  999 	ld	l,-8 (ix)
   64DE DD 66 F9      [19] 1000 	ld	h,-7 (ix)
   64E1 56            [ 7] 1001 	ld	d,(hl)
                           1002 ;src/main.c:253: enemy->muerto = SI;
   64E2 21 08 00      [10] 1003 	ld	hl,#0x0008
   64E5 09            [11] 1004 	add	hl,bc
   64E6 DD 75 FA      [19] 1005 	ld	-6 (ix),l
   64E9 DD 74 FB      [19] 1006 	ld	-5 (ix),h
                           1007 ;src/main.c:260: enemy->mira = M_izquierda;
   64EC 21 07 00      [10] 1008 	ld	hl,#0x0007
   64EF 09            [11] 1009 	add	hl,bc
   64F0 DD 75 FC      [19] 1010 	ld	-4 (ix),l
   64F3 DD 74 FD      [19] 1011 	ld	-3 (ix),h
                           1012 ;src/main.c:238: switch (direction) {
   64F6 D5            [11] 1013 	push	de
   64F7 DD 5E 04      [19] 1014 	ld	e,4 (ix)
   64FA 16 00         [ 7] 1015 	ld	d,#0x00
   64FC 21 04 65      [10] 1016 	ld	hl,#00268$
   64FF 19            [11] 1017 	add	hl,de
   6500 19            [11] 1018 	add	hl,de
   6501 19            [11] 1019 	add	hl,de
   6502 D1            [10] 1020 	pop	de
   6503 E9            [ 4] 1021 	jp	(hl)
   6504                    1022 00268$:
   6504 C3 10 65      [10] 1023 	jp	00101$
   6507 C3 F8 65      [10] 1024 	jp	00117$
   650A C3 DC 66      [10] 1025 	jp	00133$
   650D C3 BA 67      [10] 1026 	jp	00149$
                           1027 ;src/main.c:239: case 0:
   6510                    1028 00101$:
                           1029 ;src/main.c:240: if( *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   6510 7B            [ 4] 1030 	ld	a,e
   6511 C6 05         [ 7] 1031 	add	a, #0x05
   6513 C5            [11] 1032 	push	bc
   6514 D5            [11] 1033 	push	de
   6515 33            [ 6] 1034 	inc	sp
   6516 F5            [11] 1035 	push	af
   6517 33            [ 6] 1036 	inc	sp
   6518 2A 45 60      [16] 1037 	ld	hl,(_mapa)
   651B E5            [11] 1038 	push	hl
   651C CD B5 49      [17] 1039 	call	_getTilePtr
   651F F1            [10] 1040 	pop	af
   6520 F1            [10] 1041 	pop	af
   6521 C1            [10] 1042 	pop	bc
   6522 5E            [ 7] 1043 	ld	e,(hl)
   6523 3E 02         [ 7] 1044 	ld	a,#0x02
   6525 93            [ 4] 1045 	sub	a, e
   6526 DA ED 65      [10] 1046 	jp	C,00113$
                           1047 ;src/main.c:241: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   6529 DD 6E F8      [19] 1048 	ld	l,-8 (ix)
   652C DD 66 F9      [19] 1049 	ld	h,-7 (ix)
   652F 7E            [ 7] 1050 	ld	a,(hl)
   6530 C6 0B         [ 7] 1051 	add	a, #0x0B
   6532 57            [ 4] 1052 	ld	d,a
   6533 0A            [ 7] 1053 	ld	a,(bc)
   6534 C6 05         [ 7] 1054 	add	a, #0x05
   6536 C5            [11] 1055 	push	bc
   6537 D5            [11] 1056 	push	de
   6538 33            [ 6] 1057 	inc	sp
   6539 F5            [11] 1058 	push	af
   653A 33            [ 6] 1059 	inc	sp
   653B 2A 45 60      [16] 1060 	ld	hl,(_mapa)
   653E E5            [11] 1061 	push	hl
   653F CD B5 49      [17] 1062 	call	_getTilePtr
   6542 F1            [10] 1063 	pop	af
   6543 F1            [10] 1064 	pop	af
   6544 C1            [10] 1065 	pop	bc
   6545 5E            [ 7] 1066 	ld	e,(hl)
   6546 3E 02         [ 7] 1067 	ld	a,#0x02
   6548 93            [ 4] 1068 	sub	a, e
   6549 DA ED 65      [10] 1069 	jp	C,00113$
                           1070 ;src/main.c:242: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   654C DD 6E F8      [19] 1071 	ld	l,-8 (ix)
   654F DD 66 F9      [19] 1072 	ld	h,-7 (ix)
   6552 7E            [ 7] 1073 	ld	a,(hl)
   6553 C6 16         [ 7] 1074 	add	a, #0x16
   6555 57            [ 4] 1075 	ld	d,a
   6556 0A            [ 7] 1076 	ld	a,(bc)
   6557 C6 05         [ 7] 1077 	add	a, #0x05
   6559 C5            [11] 1078 	push	bc
   655A D5            [11] 1079 	push	de
   655B 33            [ 6] 1080 	inc	sp
   655C F5            [11] 1081 	push	af
   655D 33            [ 6] 1082 	inc	sp
   655E 2A 45 60      [16] 1083 	ld	hl,(_mapa)
   6561 E5            [11] 1084 	push	hl
   6562 CD B5 49      [17] 1085 	call	_getTilePtr
   6565 F1            [10] 1086 	pop	af
   6566 F1            [10] 1087 	pop	af
   6567 C1            [10] 1088 	pop	bc
   6568 5E            [ 7] 1089 	ld	e,(hl)
   6569 3E 02         [ 7] 1090 	ld	a,#0x02
   656B 93            [ 4] 1091 	sub	a, e
   656C DA ED 65      [10] 1092 	jp	C,00113$
                           1093 ;src/main.c:244: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   656F 21 72 5F      [10] 1094 	ld	hl, #_cu + 1
   6572 5E            [ 7] 1095 	ld	e,(hl)
   6573 16 00         [ 7] 1096 	ld	d,#0x00
   6575 21 04 00      [10] 1097 	ld	hl,#0x0004
   6578 19            [11] 1098 	add	hl,de
   6579 DD 75 FE      [19] 1099 	ld	-2 (ix),l
   657C DD 74 FF      [19] 1100 	ld	-1 (ix),h
   657F DD 6E F8      [19] 1101 	ld	l,-8 (ix)
   6582 DD 66 F9      [19] 1102 	ld	h,-7 (ix)
   6585 6E            [ 7] 1103 	ld	l,(hl)
   6586 26 00         [ 7] 1104 	ld	h,#0x00
   6588 DD 7E FE      [19] 1105 	ld	a,-2 (ix)
   658B 95            [ 4] 1106 	sub	a, l
   658C DD 7E FF      [19] 1107 	ld	a,-1 (ix)
   658F 9C            [ 4] 1108 	sbc	a, h
   6590 E2 95 65      [10] 1109 	jp	PO, 00269$
   6593 EE 80         [ 7] 1110 	xor	a, #0x80
   6595                    1111 00269$:
   6595 FA AA 65      [10] 1112 	jp	M,00108$
   6598 D5            [11] 1113 	push	de
   6599 11 16 00      [10] 1114 	ld	de,#0x0016
   659C 19            [11] 1115 	add	hl, de
   659D D1            [10] 1116 	pop	de
   659E 7D            [ 4] 1117 	ld	a,l
   659F 93            [ 4] 1118 	sub	a, e
   65A0 7C            [ 4] 1119 	ld	a,h
   65A1 9A            [ 4] 1120 	sbc	a, d
   65A2 E2 A7 65      [10] 1121 	jp	PO, 00270$
   65A5 EE 80         [ 7] 1122 	xor	a, #0x80
   65A7                    1123 00270$:
   65A7 F2 B1 65      [10] 1124 	jp	P,00109$
   65AA                    1125 00108$:
                           1126 ;src/main.c:245: colisiona = 0;
   65AA DD 36 F7 00   [19] 1127 	ld	-9 (ix),#0x00
   65AE C3 A3 68      [10] 1128 	jp	00165$
   65B1                    1129 00109$:
                           1130 ;src/main.c:248: if(cu.x > enemy->x){ //si el cu esta abajo
   65B1 21 71 5F      [10] 1131 	ld	hl, #_cu + 0
   65B4 5E            [ 7] 1132 	ld	e,(hl)
   65B5 0A            [ 7] 1133 	ld	a,(bc)
   65B6 4F            [ 4] 1134 	ld	c,a
   65B7 93            [ 4] 1135 	sub	a, e
   65B8 30 2C         [12] 1136 	jr	NC,00106$
                           1137 ;src/main.c:249: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
   65BA 6B            [ 4] 1138 	ld	l,e
   65BB 26 00         [ 7] 1139 	ld	h,#0x00
   65BD 06 00         [ 7] 1140 	ld	b,#0x00
   65BF 03            [ 6] 1141 	inc	bc
   65C0 03            [ 6] 1142 	inc	bc
   65C1 03            [ 6] 1143 	inc	bc
   65C2 03            [ 6] 1144 	inc	bc
   65C3 BF            [ 4] 1145 	cp	a, a
   65C4 ED 42         [15] 1146 	sbc	hl, bc
   65C6 3E 01         [ 7] 1147 	ld	a,#0x01
   65C8 BD            [ 4] 1148 	cp	a, l
   65C9 3E 00         [ 7] 1149 	ld	a,#0x00
   65CB 9C            [ 4] 1150 	sbc	a, h
   65CC E2 D1 65      [10] 1151 	jp	PO, 00271$
   65CF EE 80         [ 7] 1152 	xor	a, #0x80
   65D1                    1153 00271$:
   65D1 F2 DB 65      [10] 1154 	jp	P,00103$
                           1155 ;src/main.c:250: colisiona = 0;
   65D4 DD 36 F7 00   [19] 1156 	ld	-9 (ix),#0x00
   65D8 C3 A3 68      [10] 1157 	jp	00165$
   65DB                    1158 00103$:
                           1159 ;src/main.c:253: enemy->muerto = SI;
   65DB DD 6E FA      [19] 1160 	ld	l,-6 (ix)
   65DE DD 66 FB      [19] 1161 	ld	h,-5 (ix)
   65E1 36 01         [10] 1162 	ld	(hl),#0x01
   65E3 C3 A3 68      [10] 1163 	jp	00165$
   65E6                    1164 00106$:
                           1165 ;src/main.c:256: colisiona = 0;
   65E6 DD 36 F7 00   [19] 1166 	ld	-9 (ix),#0x00
   65EA C3 A3 68      [10] 1167 	jp	00165$
   65ED                    1168 00113$:
                           1169 ;src/main.c:260: enemy->mira = M_izquierda;
   65ED DD 6E FC      [19] 1170 	ld	l,-4 (ix)
   65F0 DD 66 FD      [19] 1171 	ld	h,-3 (ix)
   65F3 36 01         [10] 1172 	ld	(hl),#0x01
                           1173 ;src/main.c:262: break;
   65F5 C3 A3 68      [10] 1174 	jp	00165$
                           1175 ;src/main.c:263: case 1:
   65F8                    1176 00117$:
                           1177 ;src/main.c:264: if( *getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   65F8 1D            [ 4] 1178 	dec	e
   65F9 C5            [11] 1179 	push	bc
   65FA D5            [11] 1180 	push	de
   65FB 2A 45 60      [16] 1181 	ld	hl,(_mapa)
   65FE E5            [11] 1182 	push	hl
   65FF CD B5 49      [17] 1183 	call	_getTilePtr
   6602 F1            [10] 1184 	pop	af
   6603 F1            [10] 1185 	pop	af
   6604 C1            [10] 1186 	pop	bc
   6605 5E            [ 7] 1187 	ld	e,(hl)
   6606 3E 02         [ 7] 1188 	ld	a,#0x02
   6608 93            [ 4] 1189 	sub	a, e
   6609 DA D1 66      [10] 1190 	jp	C,00129$
                           1191 ;src/main.c:265: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   660C DD 6E F8      [19] 1192 	ld	l,-8 (ix)
   660F DD 66 F9      [19] 1193 	ld	h,-7 (ix)
   6612 7E            [ 7] 1194 	ld	a,(hl)
   6613 C6 0B         [ 7] 1195 	add	a, #0x0B
   6615 57            [ 4] 1196 	ld	d,a
   6616 0A            [ 7] 1197 	ld	a,(bc)
   6617 C6 FF         [ 7] 1198 	add	a,#0xFF
   6619 C5            [11] 1199 	push	bc
   661A D5            [11] 1200 	push	de
   661B 33            [ 6] 1201 	inc	sp
   661C F5            [11] 1202 	push	af
   661D 33            [ 6] 1203 	inc	sp
   661E 2A 45 60      [16] 1204 	ld	hl,(_mapa)
   6621 E5            [11] 1205 	push	hl
   6622 CD B5 49      [17] 1206 	call	_getTilePtr
   6625 F1            [10] 1207 	pop	af
   6626 F1            [10] 1208 	pop	af
   6627 C1            [10] 1209 	pop	bc
   6628 5E            [ 7] 1210 	ld	e,(hl)
   6629 3E 02         [ 7] 1211 	ld	a,#0x02
   662B 93            [ 4] 1212 	sub	a, e
   662C DA D1 66      [10] 1213 	jp	C,00129$
                           1214 ;src/main.c:266: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   662F DD 6E F8      [19] 1215 	ld	l,-8 (ix)
   6632 DD 66 F9      [19] 1216 	ld	h,-7 (ix)
   6635 7E            [ 7] 1217 	ld	a,(hl)
   6636 C6 16         [ 7] 1218 	add	a, #0x16
   6638 57            [ 4] 1219 	ld	d,a
   6639 0A            [ 7] 1220 	ld	a,(bc)
   663A C6 FF         [ 7] 1221 	add	a,#0xFF
   663C C5            [11] 1222 	push	bc
   663D D5            [11] 1223 	push	de
   663E 33            [ 6] 1224 	inc	sp
   663F F5            [11] 1225 	push	af
   6640 33            [ 6] 1226 	inc	sp
   6641 2A 45 60      [16] 1227 	ld	hl,(_mapa)
   6644 E5            [11] 1228 	push	hl
   6645 CD B5 49      [17] 1229 	call	_getTilePtr
   6648 F1            [10] 1230 	pop	af
   6649 F1            [10] 1231 	pop	af
   664A C1            [10] 1232 	pop	bc
   664B 5E            [ 7] 1233 	ld	e,(hl)
   664C 3E 02         [ 7] 1234 	ld	a,#0x02
   664E 93            [ 4] 1235 	sub	a, e
   664F DA D1 66      [10] 1236 	jp	C,00129$
                           1237 ;src/main.c:268: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   6652 21 72 5F      [10] 1238 	ld	hl, #_cu + 1
   6655 5E            [ 7] 1239 	ld	e,(hl)
   6656 16 00         [ 7] 1240 	ld	d,#0x00
   6658 21 04 00      [10] 1241 	ld	hl,#0x0004
   665B 19            [11] 1242 	add	hl,de
   665C DD 75 FE      [19] 1243 	ld	-2 (ix),l
   665F DD 74 FF      [19] 1244 	ld	-1 (ix),h
   6662 DD 6E F8      [19] 1245 	ld	l,-8 (ix)
   6665 DD 66 F9      [19] 1246 	ld	h,-7 (ix)
   6668 6E            [ 7] 1247 	ld	l,(hl)
   6669 26 00         [ 7] 1248 	ld	h,#0x00
   666B DD 7E FE      [19] 1249 	ld	a,-2 (ix)
   666E 95            [ 4] 1250 	sub	a, l
   666F DD 7E FF      [19] 1251 	ld	a,-1 (ix)
   6672 9C            [ 4] 1252 	sbc	a, h
   6673 E2 78 66      [10] 1253 	jp	PO, 00272$
   6676 EE 80         [ 7] 1254 	xor	a, #0x80
   6678                    1255 00272$:
   6678 FA 8D 66      [10] 1256 	jp	M,00124$
   667B D5            [11] 1257 	push	de
   667C 11 16 00      [10] 1258 	ld	de,#0x0016
   667F 19            [11] 1259 	add	hl, de
   6680 D1            [10] 1260 	pop	de
   6681 7D            [ 4] 1261 	ld	a,l
   6682 93            [ 4] 1262 	sub	a, e
   6683 7C            [ 4] 1263 	ld	a,h
   6684 9A            [ 4] 1264 	sbc	a, d
   6685 E2 8A 66      [10] 1265 	jp	PO, 00273$
   6688 EE 80         [ 7] 1266 	xor	a, #0x80
   668A                    1267 00273$:
   668A F2 94 66      [10] 1268 	jp	P,00125$
   668D                    1269 00124$:
                           1270 ;src/main.c:269: colisiona = 0;
   668D DD 36 F7 00   [19] 1271 	ld	-9 (ix),#0x00
   6691 C3 A3 68      [10] 1272 	jp	00165$
   6694                    1273 00125$:
                           1274 ;src/main.c:272: if(enemy->x > cu.x){ //si el cu esta abajo
   6694 0A            [ 7] 1275 	ld	a,(bc)
   6695 5F            [ 4] 1276 	ld	e,a
   6696 21 71 5F      [10] 1277 	ld	hl, #_cu + 0
   6699 4E            [ 7] 1278 	ld	c,(hl)
   669A 79            [ 4] 1279 	ld	a,c
   669B 93            [ 4] 1280 	sub	a, e
   669C 30 2C         [12] 1281 	jr	NC,00122$
                           1282 ;src/main.c:273: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
   669E 6B            [ 4] 1283 	ld	l,e
   669F 26 00         [ 7] 1284 	ld	h,#0x00
   66A1 06 00         [ 7] 1285 	ld	b,#0x00
   66A3 03            [ 6] 1286 	inc	bc
   66A4 03            [ 6] 1287 	inc	bc
   66A5 03            [ 6] 1288 	inc	bc
   66A6 03            [ 6] 1289 	inc	bc
   66A7 BF            [ 4] 1290 	cp	a, a
   66A8 ED 42         [15] 1291 	sbc	hl, bc
   66AA 3E 01         [ 7] 1292 	ld	a,#0x01
   66AC BD            [ 4] 1293 	cp	a, l
   66AD 3E 00         [ 7] 1294 	ld	a,#0x00
   66AF 9C            [ 4] 1295 	sbc	a, h
   66B0 E2 B5 66      [10] 1296 	jp	PO, 00274$
   66B3 EE 80         [ 7] 1297 	xor	a, #0x80
   66B5                    1298 00274$:
   66B5 F2 BF 66      [10] 1299 	jp	P,00119$
                           1300 ;src/main.c:274: colisiona = 0;
   66B8 DD 36 F7 00   [19] 1301 	ld	-9 (ix),#0x00
   66BC C3 A3 68      [10] 1302 	jp	00165$
   66BF                    1303 00119$:
                           1304 ;src/main.c:277: enemy->muerto = SI;
   66BF DD 6E FA      [19] 1305 	ld	l,-6 (ix)
   66C2 DD 66 FB      [19] 1306 	ld	h,-5 (ix)
   66C5 36 01         [10] 1307 	ld	(hl),#0x01
   66C7 C3 A3 68      [10] 1308 	jp	00165$
   66CA                    1309 00122$:
                           1310 ;src/main.c:280: colisiona = 0;
   66CA DD 36 F7 00   [19] 1311 	ld	-9 (ix),#0x00
   66CE C3 A3 68      [10] 1312 	jp	00165$
   66D1                    1313 00129$:
                           1314 ;src/main.c:284: enemy->mira = M_derecha;
   66D1 DD 6E FC      [19] 1315 	ld	l,-4 (ix)
   66D4 DD 66 FD      [19] 1316 	ld	h,-3 (ix)
   66D7 36 00         [10] 1317 	ld	(hl),#0x00
                           1318 ;src/main.c:286: break;
   66D9 C3 A3 68      [10] 1319 	jp	00165$
                           1320 ;src/main.c:287: case 2:
   66DC                    1321 00133$:
                           1322 ;src/main.c:288: if( *getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   66DC 15            [ 4] 1323 	dec	d
   66DD 15            [ 4] 1324 	dec	d
   66DE C5            [11] 1325 	push	bc
   66DF D5            [11] 1326 	push	de
   66E0 2A 45 60      [16] 1327 	ld	hl,(_mapa)
   66E3 E5            [11] 1328 	push	hl
   66E4 CD B5 49      [17] 1329 	call	_getTilePtr
   66E7 F1            [10] 1330 	pop	af
   66E8 F1            [10] 1331 	pop	af
   66E9 C1            [10] 1332 	pop	bc
   66EA 5E            [ 7] 1333 	ld	e,(hl)
   66EB 3E 02         [ 7] 1334 	ld	a,#0x02
   66ED 93            [ 4] 1335 	sub	a, e
   66EE DA B2 67      [10] 1336 	jp	C,00145$
                           1337 ;src/main.c:289: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   66F1 DD 6E F8      [19] 1338 	ld	l,-8 (ix)
   66F4 DD 66 F9      [19] 1339 	ld	h,-7 (ix)
   66F7 56            [ 7] 1340 	ld	d,(hl)
   66F8 15            [ 4] 1341 	dec	d
   66F9 15            [ 4] 1342 	dec	d
   66FA 0A            [ 7] 1343 	ld	a,(bc)
   66FB C6 02         [ 7] 1344 	add	a, #0x02
   66FD C5            [11] 1345 	push	bc
   66FE D5            [11] 1346 	push	de
   66FF 33            [ 6] 1347 	inc	sp
   6700 F5            [11] 1348 	push	af
   6701 33            [ 6] 1349 	inc	sp
   6702 2A 45 60      [16] 1350 	ld	hl,(_mapa)
   6705 E5            [11] 1351 	push	hl
   6706 CD B5 49      [17] 1352 	call	_getTilePtr
   6709 F1            [10] 1353 	pop	af
   670A F1            [10] 1354 	pop	af
   670B C1            [10] 1355 	pop	bc
   670C 5E            [ 7] 1356 	ld	e,(hl)
   670D 3E 02         [ 7] 1357 	ld	a,#0x02
   670F 93            [ 4] 1358 	sub	a, e
   6710 DA B2 67      [10] 1359 	jp	C,00145$
                           1360 ;src/main.c:290: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   6713 DD 6E F8      [19] 1361 	ld	l,-8 (ix)
   6716 DD 66 F9      [19] 1362 	ld	h,-7 (ix)
   6719 56            [ 7] 1363 	ld	d,(hl)
   671A 15            [ 4] 1364 	dec	d
   671B 15            [ 4] 1365 	dec	d
   671C 0A            [ 7] 1366 	ld	a,(bc)
   671D C6 04         [ 7] 1367 	add	a, #0x04
   671F C5            [11] 1368 	push	bc
   6720 D5            [11] 1369 	push	de
   6721 33            [ 6] 1370 	inc	sp
   6722 F5            [11] 1371 	push	af
   6723 33            [ 6] 1372 	inc	sp
   6724 2A 45 60      [16] 1373 	ld	hl,(_mapa)
   6727 E5            [11] 1374 	push	hl
   6728 CD B5 49      [17] 1375 	call	_getTilePtr
   672B F1            [10] 1376 	pop	af
   672C F1            [10] 1377 	pop	af
   672D C1            [10] 1378 	pop	bc
   672E 5E            [ 7] 1379 	ld	e,(hl)
   672F 3E 02         [ 7] 1380 	ld	a,#0x02
   6731 93            [ 4] 1381 	sub	a, e
   6732 DA B2 67      [10] 1382 	jp	C,00145$
                           1383 ;src/main.c:292: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   6735 21 71 5F      [10] 1384 	ld	hl, #_cu + 0
   6738 5E            [ 7] 1385 	ld	e,(hl)
   6739 16 00         [ 7] 1386 	ld	d,#0x00
   673B 21 02 00      [10] 1387 	ld	hl,#0x0002
   673E 19            [11] 1388 	add	hl,de
   673F DD 75 FE      [19] 1389 	ld	-2 (ix),l
   6742 DD 74 FF      [19] 1390 	ld	-1 (ix),h
   6745 0A            [ 7] 1391 	ld	a,(bc)
   6746 6F            [ 4] 1392 	ld	l,a
   6747 26 00         [ 7] 1393 	ld	h,#0x00
   6749 DD 7E FE      [19] 1394 	ld	a,-2 (ix)
   674C 95            [ 4] 1395 	sub	a, l
   674D DD 7E FF      [19] 1396 	ld	a,-1 (ix)
   6750 9C            [ 4] 1397 	sbc	a, h
   6751 E2 56 67      [10] 1398 	jp	PO, 00275$
   6754 EE 80         [ 7] 1399 	xor	a, #0x80
   6756                    1400 00275$:
   6756 FA 69 67      [10] 1401 	jp	M,00140$
   6759 23            [ 6] 1402 	inc	hl
   675A 23            [ 6] 1403 	inc	hl
   675B 23            [ 6] 1404 	inc	hl
   675C 23            [ 6] 1405 	inc	hl
   675D 7D            [ 4] 1406 	ld	a,l
   675E 93            [ 4] 1407 	sub	a, e
   675F 7C            [ 4] 1408 	ld	a,h
   6760 9A            [ 4] 1409 	sbc	a, d
   6761 E2 66 67      [10] 1410 	jp	PO, 00276$
   6764 EE 80         [ 7] 1411 	xor	a, #0x80
   6766                    1412 00276$:
   6766 F2 6F 67      [10] 1413 	jp	P,00141$
   6769                    1414 00140$:
                           1415 ;src/main.c:294: colisiona = 0;
   6769 DD 36 F7 00   [19] 1416 	ld	-9 (ix),#0x00
   676D 18 4B         [12] 1417 	jr	00149$
   676F                    1418 00141$:
                           1419 ;src/main.c:297: if(enemy->y>cu.y){
   676F DD 6E F8      [19] 1420 	ld	l,-8 (ix)
   6772 DD 66 F9      [19] 1421 	ld	h,-7 (ix)
   6775 5E            [ 7] 1422 	ld	e,(hl)
   6776 21 72 5F      [10] 1423 	ld	hl, #(_cu + 0x0001) + 0
   6779 6E            [ 7] 1424 	ld	l,(hl)
   677A 7D            [ 4] 1425 	ld	a,l
   677B 93            [ 4] 1426 	sub	a, e
   677C 30 2E         [12] 1427 	jr	NC,00138$
                           1428 ;src/main.c:298: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   677E 16 00         [ 7] 1429 	ld	d,#0x00
   6780 26 00         [ 7] 1430 	ld	h,#0x00
   6782 D5            [11] 1431 	push	de
   6783 11 08 00      [10] 1432 	ld	de,#0x0008
   6786 19            [11] 1433 	add	hl, de
   6787 D1            [10] 1434 	pop	de
   6788 7B            [ 4] 1435 	ld	a,e
   6789 95            [ 4] 1436 	sub	a, l
   678A 5F            [ 4] 1437 	ld	e,a
   678B 7A            [ 4] 1438 	ld	a,d
   678C 9C            [ 4] 1439 	sbc	a, h
   678D 57            [ 4] 1440 	ld	d,a
   678E 3E 02         [ 7] 1441 	ld	a,#0x02
   6790 BB            [ 4] 1442 	cp	a, e
   6791 3E 00         [ 7] 1443 	ld	a,#0x00
   6793 9A            [ 4] 1444 	sbc	a, d
   6794 E2 99 67      [10] 1445 	jp	PO, 00277$
   6797 EE 80         [ 7] 1446 	xor	a, #0x80
   6799                    1447 00277$:
   6799 F2 A2 67      [10] 1448 	jp	P,00135$
                           1449 ;src/main.c:299: colisiona = 0;
   679C DD 36 F7 00   [19] 1450 	ld	-9 (ix),#0x00
   67A0 18 18         [12] 1451 	jr	00149$
   67A2                    1452 00135$:
                           1453 ;src/main.c:302: enemy->muerto = SI;
   67A2 DD 6E FA      [19] 1454 	ld	l,-6 (ix)
   67A5 DD 66 FB      [19] 1455 	ld	h,-5 (ix)
   67A8 36 01         [10] 1456 	ld	(hl),#0x01
   67AA 18 0E         [12] 1457 	jr	00149$
   67AC                    1458 00138$:
                           1459 ;src/main.c:306: colisiona = 0;
   67AC DD 36 F7 00   [19] 1460 	ld	-9 (ix),#0x00
   67B0 18 08         [12] 1461 	jr	00149$
   67B2                    1462 00145$:
                           1463 ;src/main.c:312: enemy->mira = M_abajo;
   67B2 DD 6E FC      [19] 1464 	ld	l,-4 (ix)
   67B5 DD 66 FD      [19] 1465 	ld	h,-3 (ix)
   67B8 36 03         [10] 1466 	ld	(hl),#0x03
                           1467 ;src/main.c:315: case 3:
   67BA                    1468 00149$:
                           1469 ;src/main.c:318: if( *getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   67BA DD 6E F8      [19] 1470 	ld	l,-8 (ix)
   67BD DD 66 F9      [19] 1471 	ld	h,-7 (ix)
   67C0 7E            [ 7] 1472 	ld	a,(hl)
   67C1 C6 18         [ 7] 1473 	add	a, #0x18
   67C3 57            [ 4] 1474 	ld	d,a
   67C4 0A            [ 7] 1475 	ld	a,(bc)
   67C5 C5            [11] 1476 	push	bc
   67C6 D5            [11] 1477 	push	de
   67C7 33            [ 6] 1478 	inc	sp
   67C8 F5            [11] 1479 	push	af
   67C9 33            [ 6] 1480 	inc	sp
   67CA 2A 45 60      [16] 1481 	ld	hl,(_mapa)
   67CD E5            [11] 1482 	push	hl
   67CE CD B5 49      [17] 1483 	call	_getTilePtr
   67D1 F1            [10] 1484 	pop	af
   67D2 F1            [10] 1485 	pop	af
   67D3 C1            [10] 1486 	pop	bc
   67D4 5E            [ 7] 1487 	ld	e,(hl)
   67D5 3E 02         [ 7] 1488 	ld	a,#0x02
   67D7 93            [ 4] 1489 	sub	a, e
   67D8 DA 9B 68      [10] 1490 	jp	C,00161$
                           1491 ;src/main.c:319: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   67DB DD 6E F8      [19] 1492 	ld	l,-8 (ix)
   67DE DD 66 F9      [19] 1493 	ld	h,-7 (ix)
   67E1 7E            [ 7] 1494 	ld	a,(hl)
   67E2 C6 18         [ 7] 1495 	add	a, #0x18
   67E4 57            [ 4] 1496 	ld	d,a
   67E5 0A            [ 7] 1497 	ld	a,(bc)
   67E6 C6 02         [ 7] 1498 	add	a, #0x02
   67E8 C5            [11] 1499 	push	bc
   67E9 D5            [11] 1500 	push	de
   67EA 33            [ 6] 1501 	inc	sp
   67EB F5            [11] 1502 	push	af
   67EC 33            [ 6] 1503 	inc	sp
   67ED 2A 45 60      [16] 1504 	ld	hl,(_mapa)
   67F0 E5            [11] 1505 	push	hl
   67F1 CD B5 49      [17] 1506 	call	_getTilePtr
   67F4 F1            [10] 1507 	pop	af
   67F5 F1            [10] 1508 	pop	af
   67F6 C1            [10] 1509 	pop	bc
   67F7 5E            [ 7] 1510 	ld	e,(hl)
   67F8 3E 02         [ 7] 1511 	ld	a,#0x02
   67FA 93            [ 4] 1512 	sub	a, e
   67FB DA 9B 68      [10] 1513 	jp	C,00161$
                           1514 ;src/main.c:320: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   67FE DD 6E F8      [19] 1515 	ld	l,-8 (ix)
   6801 DD 66 F9      [19] 1516 	ld	h,-7 (ix)
   6804 7E            [ 7] 1517 	ld	a,(hl)
   6805 C6 18         [ 7] 1518 	add	a, #0x18
   6807 57            [ 4] 1519 	ld	d,a
   6808 0A            [ 7] 1520 	ld	a,(bc)
   6809 C6 04         [ 7] 1521 	add	a, #0x04
   680B C5            [11] 1522 	push	bc
   680C D5            [11] 1523 	push	de
   680D 33            [ 6] 1524 	inc	sp
   680E F5            [11] 1525 	push	af
   680F 33            [ 6] 1526 	inc	sp
   6810 2A 45 60      [16] 1527 	ld	hl,(_mapa)
   6813 E5            [11] 1528 	push	hl
   6814 CD B5 49      [17] 1529 	call	_getTilePtr
   6817 F1            [10] 1530 	pop	af
   6818 F1            [10] 1531 	pop	af
   6819 C1            [10] 1532 	pop	bc
   681A 5E            [ 7] 1533 	ld	e,(hl)
   681B 3E 02         [ 7] 1534 	ld	a,#0x02
   681D 93            [ 4] 1535 	sub	a, e
   681E 38 7B         [12] 1536 	jr	C,00161$
                           1537 ;src/main.c:322: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   6820 21 71 5F      [10] 1538 	ld	hl, #_cu + 0
   6823 5E            [ 7] 1539 	ld	e,(hl)
   6824 16 00         [ 7] 1540 	ld	d,#0x00
   6826 21 02 00      [10] 1541 	ld	hl,#0x0002
   6829 19            [11] 1542 	add	hl,de
   682A DD 75 FE      [19] 1543 	ld	-2 (ix),l
   682D DD 74 FF      [19] 1544 	ld	-1 (ix),h
   6830 0A            [ 7] 1545 	ld	a,(bc)
   6831 4F            [ 4] 1546 	ld	c,a
   6832 06 00         [ 7] 1547 	ld	b,#0x00
   6834 DD 7E FE      [19] 1548 	ld	a,-2 (ix)
   6837 91            [ 4] 1549 	sub	a, c
   6838 DD 7E FF      [19] 1550 	ld	a,-1 (ix)
   683B 98            [ 4] 1551 	sbc	a, b
   683C E2 41 68      [10] 1552 	jp	PO, 00278$
   683F EE 80         [ 7] 1553 	xor	a, #0x80
   6841                    1554 00278$:
   6841 FA 54 68      [10] 1555 	jp	M,00156$
   6844 03            [ 6] 1556 	inc	bc
   6845 03            [ 6] 1557 	inc	bc
   6846 03            [ 6] 1558 	inc	bc
   6847 03            [ 6] 1559 	inc	bc
   6848 79            [ 4] 1560 	ld	a,c
   6849 93            [ 4] 1561 	sub	a, e
   684A 78            [ 4] 1562 	ld	a,b
   684B 9A            [ 4] 1563 	sbc	a, d
   684C E2 51 68      [10] 1564 	jp	PO, 00279$
   684F EE 80         [ 7] 1565 	xor	a, #0x80
   6851                    1566 00279$:
   6851 F2 5A 68      [10] 1567 	jp	P,00157$
   6854                    1568 00156$:
                           1569 ;src/main.c:323: colisiona = 0;
   6854 DD 36 F7 00   [19] 1570 	ld	-9 (ix),#0x00
   6858 18 49         [12] 1571 	jr	00165$
   685A                    1572 00157$:
                           1573 ;src/main.c:326: if(cu.y > enemy->y){ //si el cu esta abajo
   685A 21 72 5F      [10] 1574 	ld	hl, #(_cu + 0x0001) + 0
   685D 4E            [ 7] 1575 	ld	c,(hl)
   685E DD 6E F8      [19] 1576 	ld	l,-8 (ix)
   6861 DD 66 F9      [19] 1577 	ld	h,-7 (ix)
   6864 5E            [ 7] 1578 	ld	e,(hl)
   6865 7B            [ 4] 1579 	ld	a,e
   6866 91            [ 4] 1580 	sub	a, c
   6867 30 2C         [12] 1581 	jr	NC,00154$
                           1582 ;src/main.c:327: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   6869 06 00         [ 7] 1583 	ld	b,#0x00
   686B 16 00         [ 7] 1584 	ld	d,#0x00
   686D 21 16 00      [10] 1585 	ld	hl,#0x0016
   6870 19            [11] 1586 	add	hl,de
   6871 79            [ 4] 1587 	ld	a,c
   6872 95            [ 4] 1588 	sub	a, l
   6873 4F            [ 4] 1589 	ld	c,a
   6874 78            [ 4] 1590 	ld	a,b
   6875 9C            [ 4] 1591 	sbc	a, h
   6876 47            [ 4] 1592 	ld	b,a
   6877 3E 02         [ 7] 1593 	ld	a,#0x02
   6879 B9            [ 4] 1594 	cp	a, c
   687A 3E 00         [ 7] 1595 	ld	a,#0x00
   687C 98            [ 4] 1596 	sbc	a, b
   687D E2 82 68      [10] 1597 	jp	PO, 00280$
   6880 EE 80         [ 7] 1598 	xor	a, #0x80
   6882                    1599 00280$:
   6882 F2 8B 68      [10] 1600 	jp	P,00151$
                           1601 ;src/main.c:328: colisiona = 0;
   6885 DD 36 F7 00   [19] 1602 	ld	-9 (ix),#0x00
   6889 18 18         [12] 1603 	jr	00165$
   688B                    1604 00151$:
                           1605 ;src/main.c:331: enemy->muerto = SI;
   688B DD 6E FA      [19] 1606 	ld	l,-6 (ix)
   688E DD 66 FB      [19] 1607 	ld	h,-5 (ix)
   6891 36 01         [10] 1608 	ld	(hl),#0x01
   6893 18 0E         [12] 1609 	jr	00165$
   6895                    1610 00154$:
                           1611 ;src/main.c:335: colisiona = 0;
   6895 DD 36 F7 00   [19] 1612 	ld	-9 (ix),#0x00
   6899 18 08         [12] 1613 	jr	00165$
   689B                    1614 00161$:
                           1615 ;src/main.c:339: enemy->mira = M_arriba;
   689B DD 6E FC      [19] 1616 	ld	l,-4 (ix)
   689E DD 66 FD      [19] 1617 	ld	h,-3 (ix)
   68A1 36 02         [10] 1618 	ld	(hl),#0x02
                           1619 ;src/main.c:342: }
   68A3                    1620 00165$:
                           1621 ;src/main.c:343: return colisiona;
   68A3 DD 6E F7      [19] 1622 	ld	l,-9 (ix)
   68A6 DD F9         [10] 1623 	ld	sp, ix
   68A8 DD E1         [14] 1624 	pop	ix
   68AA C9            [10] 1625 	ret
                           1626 ;src/main.c:346: void moverEnemigoArriba(TEnemy *enemy){
                           1627 ;	---------------------------------
                           1628 ; Function moverEnemigoArriba
                           1629 ; ---------------------------------
   68AB                    1630 _moverEnemigoArriba::
   68AB DD E5         [15] 1631 	push	ix
   68AD DD 21 00 00   [14] 1632 	ld	ix,#0
   68B1 DD 39         [15] 1633 	add	ix,sp
                           1634 ;src/main.c:347: enemy->y--;
   68B3 DD 4E 04      [19] 1635 	ld	c,4 (ix)
   68B6 DD 46 05      [19] 1636 	ld	b,5 (ix)
   68B9 69            [ 4] 1637 	ld	l, c
   68BA 60            [ 4] 1638 	ld	h, b
   68BB 23            [ 6] 1639 	inc	hl
   68BC 5E            [ 7] 1640 	ld	e,(hl)
   68BD 1D            [ 4] 1641 	dec	e
   68BE 73            [ 7] 1642 	ld	(hl),e
                           1643 ;src/main.c:348: enemy->y--;
   68BF 1D            [ 4] 1644 	dec	e
   68C0 73            [ 7] 1645 	ld	(hl),e
                           1646 ;src/main.c:349: enemy->mover = SI;
   68C1 21 06 00      [10] 1647 	ld	hl,#0x0006
   68C4 09            [11] 1648 	add	hl,bc
   68C5 36 01         [10] 1649 	ld	(hl),#0x01
   68C7 DD E1         [14] 1650 	pop	ix
   68C9 C9            [10] 1651 	ret
                           1652 ;src/main.c:352: void moverEnemigoAbajo(TEnemy *enemy){
                           1653 ;	---------------------------------
                           1654 ; Function moverEnemigoAbajo
                           1655 ; ---------------------------------
   68CA                    1656 _moverEnemigoAbajo::
   68CA DD E5         [15] 1657 	push	ix
   68CC DD 21 00 00   [14] 1658 	ld	ix,#0
   68D0 DD 39         [15] 1659 	add	ix,sp
                           1660 ;src/main.c:353: enemy->y++;
   68D2 DD 4E 04      [19] 1661 	ld	c,4 (ix)
   68D5 DD 46 05      [19] 1662 	ld	b,5 (ix)
   68D8 59            [ 4] 1663 	ld	e, c
   68D9 50            [ 4] 1664 	ld	d, b
   68DA 13            [ 6] 1665 	inc	de
   68DB 1A            [ 7] 1666 	ld	a,(de)
   68DC 3C            [ 4] 1667 	inc	a
   68DD 12            [ 7] 1668 	ld	(de),a
                           1669 ;src/main.c:354: enemy->y++;
   68DE 3C            [ 4] 1670 	inc	a
   68DF 12            [ 7] 1671 	ld	(de),a
                           1672 ;src/main.c:355: enemy->mover = SI;
   68E0 21 06 00      [10] 1673 	ld	hl,#0x0006
   68E3 09            [11] 1674 	add	hl,bc
   68E4 36 01         [10] 1675 	ld	(hl),#0x01
   68E6 DD E1         [14] 1676 	pop	ix
   68E8 C9            [10] 1677 	ret
                           1678 ;src/main.c:358: void moverEnemigoDerecha(TEnemy *enemy){
                           1679 ;	---------------------------------
                           1680 ; Function moverEnemigoDerecha
                           1681 ; ---------------------------------
   68E9                    1682 _moverEnemigoDerecha::
                           1683 ;src/main.c:359: enemy->x++;
   68E9 D1            [10] 1684 	pop	de
   68EA C1            [10] 1685 	pop	bc
   68EB C5            [11] 1686 	push	bc
   68EC D5            [11] 1687 	push	de
   68ED 0A            [ 7] 1688 	ld	a,(bc)
   68EE 3C            [ 4] 1689 	inc	a
   68EF 02            [ 7] 1690 	ld	(bc),a
                           1691 ;src/main.c:360: enemy->x++;
   68F0 3C            [ 4] 1692 	inc	a
   68F1 02            [ 7] 1693 	ld	(bc),a
                           1694 ;src/main.c:361: enemy->mover = SI;
   68F2 21 06 00      [10] 1695 	ld	hl,#0x0006
   68F5 09            [11] 1696 	add	hl,bc
   68F6 36 01         [10] 1697 	ld	(hl),#0x01
   68F8 C9            [10] 1698 	ret
                           1699 ;src/main.c:364: void moverEnemigoIzquierda(TEnemy *enemy){
                           1700 ;	---------------------------------
                           1701 ; Function moverEnemigoIzquierda
                           1702 ; ---------------------------------
   68F9                    1703 _moverEnemigoIzquierda::
                           1704 ;src/main.c:365: enemy->x--;
   68F9 D1            [10] 1705 	pop	de
   68FA C1            [10] 1706 	pop	bc
   68FB C5            [11] 1707 	push	bc
   68FC D5            [11] 1708 	push	de
   68FD 0A            [ 7] 1709 	ld	a,(bc)
   68FE C6 FF         [ 7] 1710 	add	a,#0xFF
   6900 02            [ 7] 1711 	ld	(bc),a
                           1712 ;src/main.c:366: enemy->x--;
   6901 C6 FF         [ 7] 1713 	add	a,#0xFF
   6903 02            [ 7] 1714 	ld	(bc),a
                           1715 ;src/main.c:367: enemy->mover = SI;
   6904 21 06 00      [10] 1716 	ld	hl,#0x0006
   6907 09            [11] 1717 	add	hl,bc
   6908 36 01         [10] 1718 	ld	(hl),#0x01
   690A C9            [10] 1719 	ret
                           1720 ;src/main.c:370: void moverEnemigoPatrol(TEnemy *enemy){
                           1721 ;	---------------------------------
                           1722 ; Function moverEnemigoPatrol
                           1723 ; ---------------------------------
   690B                    1724 _moverEnemigoPatrol::
   690B DD E5         [15] 1725 	push	ix
   690D DD 21 00 00   [14] 1726 	ld	ix,#0
   6911 DD 39         [15] 1727 	add	ix,sp
   6913 21 F5 FF      [10] 1728 	ld	hl,#-11
   6916 39            [11] 1729 	add	hl,sp
   6917 F9            [ 6] 1730 	ld	sp,hl
                           1731 ;src/main.c:371: if(!enemy->muerto){
   6918 DD 4E 04      [19] 1732 	ld	c,4 (ix)
   691B DD 46 05      [19] 1733 	ld	b,5 (ix)
   691E C5            [11] 1734 	push	bc
   691F FD E1         [14] 1735 	pop	iy
   6921 FD 7E 08      [19] 1736 	ld	a,8 (iy)
   6924 B7            [ 4] 1737 	or	a, a
   6925 C2 1C 6B      [10] 1738 	jp	NZ,00118$
                           1739 ;src/main.c:373: if (!enemy->reversePatrol) {
   6928 21 0C 00      [10] 1740 	ld	hl,#0x000C
   692B 09            [11] 1741 	add	hl,bc
   692C EB            [ 4] 1742 	ex	de,hl
   692D 1A            [ 7] 1743 	ld	a,(de)
   692E DD 77 F5      [19] 1744 	ld	-11 (ix),a
                           1745 ;src/main.c:374: if(enemy->iter < enemy->longitud_camino){
   6931 FD 21 0E 00   [14] 1746 	ld	iy,#0x000E
   6935 FD 09         [15] 1747 	add	iy, bc
   6937 FD 7E 00      [19] 1748 	ld	a,0 (iy)
   693A DD 77 FE      [19] 1749 	ld	-2 (ix),a
   693D FD 7E 01      [19] 1750 	ld	a,1 (iy)
   6940 DD 77 FF      [19] 1751 	ld	-1 (ix),a
   6943 21 1B 00      [10] 1752 	ld	hl,#0x001B
   6946 09            [11] 1753 	add	hl,bc
                           1754 ;src/main.c:377: enemy->x = enemy->camino[enemy->iter];
   6947 79            [ 4] 1755 	ld	a,c
   6948 C6 19         [ 7] 1756 	add	a, #0x19
   694A DD 77 FC      [19] 1757 	ld	-4 (ix),a
   694D 78            [ 4] 1758 	ld	a,b
   694E CE 00         [ 7] 1759 	adc	a, #0x00
   6950 DD 77 FD      [19] 1760 	ld	-3 (ix),a
                           1761 ;src/main.c:379: enemy->y = enemy->camino[enemy->iter];
   6953 79            [ 4] 1762 	ld	a,c
   6954 C6 01         [ 7] 1763 	add	a, #0x01
   6956 DD 77 FA      [19] 1764 	ld	-6 (ix),a
   6959 78            [ 4] 1765 	ld	a,b
   695A CE 00         [ 7] 1766 	adc	a, #0x00
   695C DD 77 FB      [19] 1767 	ld	-5 (ix),a
                           1768 ;src/main.c:381: enemy->mover = SI;
   695F 79            [ 4] 1769 	ld	a,c
   6960 C6 06         [ 7] 1770 	add	a, #0x06
   6962 DD 77 F8      [19] 1771 	ld	-8 (ix),a
   6965 78            [ 4] 1772 	ld	a,b
   6966 CE 00         [ 7] 1773 	adc	a, #0x00
   6968 DD 77 F9      [19] 1774 	ld	-7 (ix),a
                           1775 ;src/main.c:373: if (!enemy->reversePatrol) {
   696B DD 7E F5      [19] 1776 	ld	a,-11 (ix)
   696E B7            [ 4] 1777 	or	a, a
   696F C2 31 6A      [10] 1778 	jp	NZ,00114$
                           1779 ;src/main.c:374: if(enemy->iter < enemy->longitud_camino){
   6972 6E            [ 7] 1780 	ld	l,(hl)
   6973 26 00         [ 7] 1781 	ld	h,#0x00
   6975 DD 7E FE      [19] 1782 	ld	a,-2 (ix)
   6978 95            [ 4] 1783 	sub	a, l
   6979 DD 7E FF      [19] 1784 	ld	a,-1 (ix)
   697C 9C            [ 4] 1785 	sbc	a, h
   697D E2 82 69      [10] 1786 	jp	PO, 00144$
   6980 EE 80         [ 7] 1787 	xor	a, #0x80
   6982                    1788 00144$:
   6982 F2 1D 6A      [10] 1789 	jp	P,00105$
                           1790 ;src/main.c:375: if(enemy->iter == 0){
   6985 DD 7E FF      [19] 1791 	ld	a,-1 (ix)
   6988 DD B6 FE      [19] 1792 	or	a,-2 (ix)
   698B 20 4C         [12] 1793 	jr	NZ,00102$
                           1794 ;src/main.c:376: enemy->iter = 2;
   698D FD 36 00 02   [19] 1795 	ld	0 (iy),#0x02
   6991 FD 36 01 00   [19] 1796 	ld	1 (iy),#0x00
                           1797 ;src/main.c:377: enemy->x = enemy->camino[enemy->iter];
   6995 DD 6E FC      [19] 1798 	ld	l,-4 (ix)
   6998 DD 66 FD      [19] 1799 	ld	h,-3 (ix)
   699B 5E            [ 7] 1800 	ld	e,(hl)
   699C 23            [ 6] 1801 	inc	hl
   699D 56            [ 7] 1802 	ld	d,(hl)
   699E FD 6E 00      [19] 1803 	ld	l,0 (iy)
   69A1 FD 66 01      [19] 1804 	ld	h,1 (iy)
   69A4 19            [11] 1805 	add	hl,de
   69A5 7E            [ 7] 1806 	ld	a,(hl)
   69A6 02            [ 7] 1807 	ld	(bc),a
                           1808 ;src/main.c:378: ++enemy->iter;
   69A7 FD 4E 00      [19] 1809 	ld	c,0 (iy)
   69AA FD 46 01      [19] 1810 	ld	b,1 (iy)
   69AD 03            [ 6] 1811 	inc	bc
   69AE FD 71 00      [19] 1812 	ld	0 (iy),c
   69B1 FD 70 01      [19] 1813 	ld	1 (iy),b
                           1814 ;src/main.c:379: enemy->y = enemy->camino[enemy->iter];
   69B4 DD 6E FC      [19] 1815 	ld	l,-4 (ix)
   69B7 DD 66 FD      [19] 1816 	ld	h,-3 (ix)
   69BA 7E            [ 7] 1817 	ld	a, (hl)
   69BB 23            [ 6] 1818 	inc	hl
   69BC 66            [ 7] 1819 	ld	h,(hl)
   69BD 6F            [ 4] 1820 	ld	l,a
   69BE 09            [11] 1821 	add	hl,bc
   69BF 5E            [ 7] 1822 	ld	e,(hl)
   69C0 DD 6E FA      [19] 1823 	ld	l,-6 (ix)
   69C3 DD 66 FB      [19] 1824 	ld	h,-5 (ix)
   69C6 73            [ 7] 1825 	ld	(hl),e
                           1826 ;src/main.c:380: ++enemy->iter;
   69C7 03            [ 6] 1827 	inc	bc
   69C8 FD 71 00      [19] 1828 	ld	0 (iy),c
   69CB FD 70 01      [19] 1829 	ld	1 (iy),b
                           1830 ;src/main.c:381: enemy->mover = SI;
   69CE DD 6E F8      [19] 1831 	ld	l,-8 (ix)
   69D1 DD 66 F9      [19] 1832 	ld	h,-7 (ix)
   69D4 36 01         [10] 1833 	ld	(hl),#0x01
   69D6 C3 1C 6B      [10] 1834 	jp	00118$
   69D9                    1835 00102$:
                           1836 ;src/main.c:383: enemy->x = enemy->camino[enemy->iter];
   69D9 DD 6E FC      [19] 1837 	ld	l,-4 (ix)
   69DC DD 66 FD      [19] 1838 	ld	h,-3 (ix)
   69DF 5E            [ 7] 1839 	ld	e,(hl)
   69E0 23            [ 6] 1840 	inc	hl
   69E1 56            [ 7] 1841 	ld	d,(hl)
   69E2 DD 6E FE      [19] 1842 	ld	l,-2 (ix)
   69E5 DD 66 FF      [19] 1843 	ld	h,-1 (ix)
   69E8 19            [11] 1844 	add	hl,de
   69E9 7E            [ 7] 1845 	ld	a,(hl)
   69EA 02            [ 7] 1846 	ld	(bc),a
                           1847 ;src/main.c:384: ++enemy->iter;
   69EB FD 4E 00      [19] 1848 	ld	c,0 (iy)
   69EE FD 46 01      [19] 1849 	ld	b,1 (iy)
   69F1 03            [ 6] 1850 	inc	bc
   69F2 FD 71 00      [19] 1851 	ld	0 (iy),c
   69F5 FD 70 01      [19] 1852 	ld	1 (iy),b
                           1853 ;src/main.c:385: enemy->y = enemy->camino[enemy->iter];
   69F8 DD 6E FC      [19] 1854 	ld	l,-4 (ix)
   69FB DD 66 FD      [19] 1855 	ld	h,-3 (ix)
   69FE 7E            [ 7] 1856 	ld	a, (hl)
   69FF 23            [ 6] 1857 	inc	hl
   6A00 66            [ 7] 1858 	ld	h,(hl)
   6A01 6F            [ 4] 1859 	ld	l,a
   6A02 09            [11] 1860 	add	hl,bc
   6A03 5E            [ 7] 1861 	ld	e,(hl)
   6A04 DD 6E FA      [19] 1862 	ld	l,-6 (ix)
   6A07 DD 66 FB      [19] 1863 	ld	h,-5 (ix)
   6A0A 73            [ 7] 1864 	ld	(hl),e
                           1865 ;src/main.c:386: ++enemy->iter;
   6A0B 03            [ 6] 1866 	inc	bc
   6A0C FD 71 00      [19] 1867 	ld	0 (iy),c
   6A0F FD 70 01      [19] 1868 	ld	1 (iy),b
                           1869 ;src/main.c:387: enemy->mover = SI;
   6A12 DD 6E F8      [19] 1870 	ld	l,-8 (ix)
   6A15 DD 66 F9      [19] 1871 	ld	h,-7 (ix)
   6A18 36 01         [10] 1872 	ld	(hl),#0x01
   6A1A C3 1C 6B      [10] 1873 	jp	00118$
   6A1D                    1874 00105$:
                           1875 ;src/main.c:391: enemy->iter = enemy->longitud_camino;
   6A1D FD 75 00      [19] 1876 	ld	0 (iy),l
   6A20 FD 74 01      [19] 1877 	ld	1 (iy),h
                           1878 ;src/main.c:395: enemy->reversePatrol = 1;
   6A23 3E 01         [ 7] 1879 	ld	a,#0x01
   6A25 12            [ 7] 1880 	ld	(de),a
                           1881 ;src/main.c:396: enemy->mover = NO;
   6A26 DD 6E F8      [19] 1882 	ld	l,-8 (ix)
   6A29 DD 66 F9      [19] 1883 	ld	h,-7 (ix)
   6A2C 36 00         [10] 1884 	ld	(hl),#0x00
   6A2E C3 1C 6B      [10] 1885 	jp	00118$
   6A31                    1886 00114$:
                           1887 ;src/main.c:400: if(enemy->iter > 0){
   6A31 AF            [ 4] 1888 	xor	a, a
   6A32 DD BE FE      [19] 1889 	cp	a, -2 (ix)
   6A35 DD 9E FF      [19] 1890 	sbc	a, -1 (ix)
   6A38 E2 3D 6A      [10] 1891 	jp	PO, 00145$
   6A3B EE 80         [ 7] 1892 	xor	a, #0x80
   6A3D                    1893 00145$:
   6A3D F2 0A 6B      [10] 1894 	jp	P,00111$
                           1895 ;src/main.c:401: if(enemy->iter == enemy->longitud_camino){
   6A40 5E            [ 7] 1896 	ld	e,(hl)
   6A41 16 00         [ 7] 1897 	ld	d,#0x00
   6A43 DD 7E FE      [19] 1898 	ld	a,-2 (ix)
   6A46 93            [ 4] 1899 	sub	a, e
   6A47 C2 C7 6A      [10] 1900 	jp	NZ,00108$
   6A4A DD 7E FF      [19] 1901 	ld	a,-1 (ix)
   6A4D 92            [ 4] 1902 	sub	a, d
   6A4E 20 77         [12] 1903 	jr	NZ,00108$
                           1904 ;src/main.c:402: enemy->iter = enemy->iter - 1;
   6A50 DD 7E FE      [19] 1905 	ld	a,-2 (ix)
   6A53 C6 FF         [ 7] 1906 	add	a,#0xFF
   6A55 DD 77 F6      [19] 1907 	ld	-10 (ix),a
   6A58 DD 7E FF      [19] 1908 	ld	a,-1 (ix)
   6A5B CE FF         [ 7] 1909 	adc	a,#0xFF
   6A5D DD 77 F7      [19] 1910 	ld	-9 (ix),a
   6A60 DD 7E F6      [19] 1911 	ld	a,-10 (ix)
   6A63 FD 77 00      [19] 1912 	ld	0 (iy),a
   6A66 DD 7E F7      [19] 1913 	ld	a,-9 (ix)
   6A69 FD 77 01      [19] 1914 	ld	1 (iy),a
                           1915 ;src/main.c:403: enemy->iter = enemy->iter - 2;
   6A6C DD 5E F6      [19] 1916 	ld	e,-10 (ix)
   6A6F DD 56 F7      [19] 1917 	ld	d,-9 (ix)
   6A72 1B            [ 6] 1918 	dec	de
   6A73 1B            [ 6] 1919 	dec	de
   6A74 FD 73 00      [19] 1920 	ld	0 (iy),e
   6A77 FD 72 01      [19] 1921 	ld	1 (iy),d
                           1922 ;src/main.c:404: enemy->y = enemy->camino[enemy->iter];
   6A7A DD 6E FC      [19] 1923 	ld	l,-4 (ix)
   6A7D DD 66 FD      [19] 1924 	ld	h,-3 (ix)
   6A80 7E            [ 7] 1925 	ld	a, (hl)
   6A81 23            [ 6] 1926 	inc	hl
   6A82 66            [ 7] 1927 	ld	h,(hl)
   6A83 6F            [ 4] 1928 	ld	l,a
   6A84 19            [11] 1929 	add	hl,de
   6A85 5E            [ 7] 1930 	ld	e,(hl)
   6A86 DD 6E FA      [19] 1931 	ld	l,-6 (ix)
   6A89 DD 66 FB      [19] 1932 	ld	h,-5 (ix)
   6A8C 73            [ 7] 1933 	ld	(hl),e
                           1934 ;src/main.c:405: --enemy->iter;
   6A8D DD 7E F6      [19] 1935 	ld	a,-10 (ix)
   6A90 C6 FD         [ 7] 1936 	add	a,#0xFD
   6A92 5F            [ 4] 1937 	ld	e,a
   6A93 DD 7E F7      [19] 1938 	ld	a,-9 (ix)
   6A96 CE FF         [ 7] 1939 	adc	a,#0xFF
   6A98 57            [ 4] 1940 	ld	d,a
   6A99 FD 73 00      [19] 1941 	ld	0 (iy),e
   6A9C FD 72 01      [19] 1942 	ld	1 (iy),d
                           1943 ;src/main.c:406: enemy->x = enemy->camino[enemy->iter];
   6A9F DD 6E FC      [19] 1944 	ld	l,-4 (ix)
   6AA2 DD 66 FD      [19] 1945 	ld	h,-3 (ix)
   6AA5 7E            [ 7] 1946 	ld	a, (hl)
   6AA6 23            [ 6] 1947 	inc	hl
   6AA7 66            [ 7] 1948 	ld	h,(hl)
   6AA8 6F            [ 4] 1949 	ld	l,a
   6AA9 19            [11] 1950 	add	hl,de
   6AAA 7E            [ 7] 1951 	ld	a,(hl)
   6AAB 02            [ 7] 1952 	ld	(bc),a
                           1953 ;src/main.c:407: --enemy->iter;
   6AAC DD 7E F6      [19] 1954 	ld	a,-10 (ix)
   6AAF C6 FC         [ 7] 1955 	add	a,#0xFC
   6AB1 4F            [ 4] 1956 	ld	c,a
   6AB2 DD 7E F7      [19] 1957 	ld	a,-9 (ix)
   6AB5 CE FF         [ 7] 1958 	adc	a,#0xFF
   6AB7 FD 71 00      [19] 1959 	ld	0 (iy), c
   6ABA FD 77 01      [19] 1960 	ld	1 (iy), a
                           1961 ;src/main.c:408: enemy->mover = SI;
   6ABD DD 6E F8      [19] 1962 	ld	l,-8 (ix)
   6AC0 DD 66 F9      [19] 1963 	ld	h,-7 (ix)
   6AC3 36 01         [10] 1964 	ld	(hl),#0x01
   6AC5 18 55         [12] 1965 	jr	00118$
   6AC7                    1966 00108$:
                           1967 ;src/main.c:410: enemy->y = enemy->camino[enemy->iter];
   6AC7 DD 6E FC      [19] 1968 	ld	l,-4 (ix)
   6ACA DD 66 FD      [19] 1969 	ld	h,-3 (ix)
   6ACD 5E            [ 7] 1970 	ld	e,(hl)
   6ACE 23            [ 6] 1971 	inc	hl
   6ACF 56            [ 7] 1972 	ld	d,(hl)
   6AD0 DD 6E FE      [19] 1973 	ld	l,-2 (ix)
   6AD3 DD 66 FF      [19] 1974 	ld	h,-1 (ix)
   6AD6 19            [11] 1975 	add	hl,de
   6AD7 5E            [ 7] 1976 	ld	e,(hl)
   6AD8 DD 6E FA      [19] 1977 	ld	l,-6 (ix)
   6ADB DD 66 FB      [19] 1978 	ld	h,-5 (ix)
   6ADE 73            [ 7] 1979 	ld	(hl),e
                           1980 ;src/main.c:411: --enemy->iter;
   6ADF FD 5E 00      [19] 1981 	ld	e,0 (iy)
   6AE2 FD 56 01      [19] 1982 	ld	d,1 (iy)
   6AE5 1B            [ 6] 1983 	dec	de
   6AE6 FD 73 00      [19] 1984 	ld	0 (iy),e
   6AE9 FD 72 01      [19] 1985 	ld	1 (iy),d
                           1986 ;src/main.c:412: enemy->x = enemy->camino[enemy->iter];
   6AEC DD 6E FC      [19] 1987 	ld	l,-4 (ix)
   6AEF DD 66 FD      [19] 1988 	ld	h,-3 (ix)
   6AF2 7E            [ 7] 1989 	ld	a, (hl)
   6AF3 23            [ 6] 1990 	inc	hl
   6AF4 66            [ 7] 1991 	ld	h,(hl)
   6AF5 6F            [ 4] 1992 	ld	l,a
   6AF6 19            [11] 1993 	add	hl,de
   6AF7 7E            [ 7] 1994 	ld	a,(hl)
   6AF8 02            [ 7] 1995 	ld	(bc),a
                           1996 ;src/main.c:413: --enemy->iter;
   6AF9 1B            [ 6] 1997 	dec	de
   6AFA FD 73 00      [19] 1998 	ld	0 (iy),e
   6AFD FD 72 01      [19] 1999 	ld	1 (iy),d
                           2000 ;src/main.c:414: enemy->mover = SI;
   6B00 DD 6E F8      [19] 2001 	ld	l,-8 (ix)
   6B03 DD 66 F9      [19] 2002 	ld	h,-7 (ix)
   6B06 36 01         [10] 2003 	ld	(hl),#0x01
   6B08 18 12         [12] 2004 	jr	00118$
   6B0A                    2005 00111$:
                           2006 ;src/main.c:418: enemy->iter = 0;
   6B0A FD 36 00 00   [19] 2007 	ld	0 (iy),#0x00
   6B0E FD 36 01 00   [19] 2008 	ld	1 (iy),#0x00
                           2009 ;src/main.c:420: enemy->reversePatrol = 0;
   6B12 AF            [ 4] 2010 	xor	a, a
   6B13 12            [ 7] 2011 	ld	(de),a
                           2012 ;src/main.c:421: enemy->mover = NO;
   6B14 DD 6E F8      [19] 2013 	ld	l,-8 (ix)
   6B17 DD 66 F9      [19] 2014 	ld	h,-7 (ix)
   6B1A 36 00         [10] 2015 	ld	(hl),#0x00
   6B1C                    2016 00118$:
   6B1C DD F9         [10] 2017 	ld	sp, ix
   6B1E DD E1         [14] 2018 	pop	ix
   6B20 C9            [10] 2019 	ret
                           2020 ;src/main.c:427: void moverEnemigoSeek(TEnemy* enemy){
                           2021 ;	---------------------------------
                           2022 ; Function moverEnemigoSeek
                           2023 ; ---------------------------------
   6B21                    2024 _moverEnemigoSeek::
   6B21 DD E5         [15] 2025 	push	ix
   6B23 DD 21 00 00   [14] 2026 	ld	ix,#0
   6B27 DD 39         [15] 2027 	add	ix,sp
   6B29 F5            [11] 2028 	push	af
   6B2A F5            [11] 2029 	push	af
                           2030 ;src/main.c:428: if(!enemy->muerto){
   6B2B DD 4E 04      [19] 2031 	ld	c,4 (ix)
   6B2E DD 46 05      [19] 2032 	ld	b,5 (ix)
   6B31 C5            [11] 2033 	push	bc
   6B32 FD E1         [14] 2034 	pop	iy
   6B34 FD 7E 08      [19] 2035 	ld	a,8 (iy)
   6B37 B7            [ 4] 2036 	or	a, a
   6B38 C2 24 6C      [10] 2037 	jp	NZ,00108$
                           2038 ;src/main.c:430: if (!enemy->reversePatrol) {
   6B3B 21 0C 00      [10] 2039 	ld	hl,#0x000C
   6B3E 09            [11] 2040 	add	hl,bc
   6B3F EB            [ 4] 2041 	ex	de,hl
   6B40 1A            [ 7] 2042 	ld	a,(de)
   6B41 B7            [ 4] 2043 	or	a, a
   6B42 C2 24 6C      [10] 2044 	jp	NZ,00108$
                           2045 ;src/main.c:431: if(enemy->iter < enemy->longitud_camino - 8){
   6B45 FD 21 0E 00   [14] 2046 	ld	iy,#0x000E
   6B49 FD 09         [15] 2047 	add	iy, bc
   6B4B FD 7E 00      [19] 2048 	ld	a,0 (iy)
   6B4E DD 77 FC      [19] 2049 	ld	-4 (ix),a
   6B51 FD 7E 01      [19] 2050 	ld	a,1 (iy)
   6B54 DD 77 FD      [19] 2051 	ld	-3 (ix),a
   6B57 69            [ 4] 2052 	ld	l, c
   6B58 60            [ 4] 2053 	ld	h, b
   6B59 C5            [11] 2054 	push	bc
   6B5A 01 1B 00      [10] 2055 	ld	bc, #0x001B
   6B5D 09            [11] 2056 	add	hl, bc
   6B5E C1            [10] 2057 	pop	bc
   6B5F 6E            [ 7] 2058 	ld	l,(hl)
   6B60 26 00         [ 7] 2059 	ld	h,#0x00
   6B62 7D            [ 4] 2060 	ld	a,l
   6B63 C6 F8         [ 7] 2061 	add	a,#0xF8
   6B65 6F            [ 4] 2062 	ld	l,a
   6B66 7C            [ 4] 2063 	ld	a,h
   6B67 CE FF         [ 7] 2064 	adc	a,#0xFF
   6B69 67            [ 4] 2065 	ld	h,a
                           2066 ;src/main.c:434: enemy->y = enemy->camino[enemy->iter];
   6B6A 79            [ 4] 2067 	ld	a,c
   6B6B C6 01         [ 7] 2068 	add	a, #0x01
   6B6D DD 77 FE      [19] 2069 	ld	-2 (ix),a
   6B70 78            [ 4] 2070 	ld	a,b
   6B71 CE 00         [ 7] 2071 	adc	a, #0x00
   6B73 DD 77 FF      [19] 2072 	ld	-1 (ix),a
                           2073 ;src/main.c:431: if(enemy->iter < enemy->longitud_camino - 8){
   6B76 DD 7E FC      [19] 2074 	ld	a,-4 (ix)
   6B79 95            [ 4] 2075 	sub	a, l
   6B7A DD 7E FD      [19] 2076 	ld	a,-3 (ix)
   6B7D 9C            [ 4] 2077 	sbc	a, h
   6B7E E2 83 6B      [10] 2078 	jp	PO, 00122$
   6B81 EE 80         [ 7] 2079 	xor	a, #0x80
   6B83                    2080 00122$:
   6B83 F2 D0 6B      [10] 2081 	jp	P,00102$
                           2082 ;src/main.c:432: enemy->x = enemy->camino[enemy->iter];
   6B86 21 19 00      [10] 2083 	ld	hl,#0x0019
   6B89 09            [11] 2084 	add	hl,bc
   6B8A 5D            [ 4] 2085 	ld	e,l
   6B8B 54            [ 4] 2086 	ld	d,h
   6B8C 7E            [ 7] 2087 	ld	a, (hl)
   6B8D 23            [ 6] 2088 	inc	hl
   6B8E 66            [ 7] 2089 	ld	h,(hl)
   6B8F 6F            [ 4] 2090 	ld	l,a
   6B90 DD 7E FC      [19] 2091 	ld	a,-4 (ix)
   6B93 85            [ 4] 2092 	add	a, l
   6B94 6F            [ 4] 2093 	ld	l,a
   6B95 DD 7E FD      [19] 2094 	ld	a,-3 (ix)
   6B98 8C            [ 4] 2095 	adc	a, h
   6B99 67            [ 4] 2096 	ld	h,a
   6B9A 7E            [ 7] 2097 	ld	a,(hl)
   6B9B 02            [ 7] 2098 	ld	(bc),a
                           2099 ;src/main.c:433: enemy->iter++;
   6B9C FD 6E 00      [19] 2100 	ld	l,0 (iy)
   6B9F FD 66 01      [19] 2101 	ld	h,1 (iy)
   6BA2 23            [ 6] 2102 	inc	hl
   6BA3 E3            [19] 2103 	ex	(sp), hl
   6BA4 DD 7E FC      [19] 2104 	ld	a,-4 (ix)
   6BA7 FD 77 00      [19] 2105 	ld	0 (iy),a
   6BAA DD 7E FD      [19] 2106 	ld	a,-3 (ix)
   6BAD FD 77 01      [19] 2107 	ld	1 (iy),a
                           2108 ;src/main.c:434: enemy->y = enemy->camino[enemy->iter];
   6BB0 EB            [ 4] 2109 	ex	de,hl
   6BB1 5E            [ 7] 2110 	ld	e,(hl)
   6BB2 23            [ 6] 2111 	inc	hl
   6BB3 56            [ 7] 2112 	ld	d,(hl)
   6BB4 E1            [10] 2113 	pop	hl
   6BB5 E5            [11] 2114 	push	hl
   6BB6 19            [11] 2115 	add	hl,de
   6BB7 5E            [ 7] 2116 	ld	e,(hl)
   6BB8 DD 6E FE      [19] 2117 	ld	l,-2 (ix)
   6BBB DD 66 FF      [19] 2118 	ld	h,-1 (ix)
   6BBE 73            [ 7] 2119 	ld	(hl),e
                           2120 ;src/main.c:435: enemy->iter++;
   6BBF D1            [10] 2121 	pop	de
   6BC0 D5            [11] 2122 	push	de
   6BC1 13            [ 6] 2123 	inc	de
   6BC2 FD 73 00      [19] 2124 	ld	0 (iy),e
   6BC5 FD 72 01      [19] 2125 	ld	1 (iy),d
                           2126 ;src/main.c:436: enemy->mover = SI;
   6BC8 21 06 00      [10] 2127 	ld	hl,#0x0006
   6BCB 09            [11] 2128 	add	hl,bc
   6BCC 36 01         [10] 2129 	ld	(hl),#0x01
   6BCE 18 54         [12] 2130 	jr	00108$
   6BD0                    2131 00102$:
                           2132 ;src/main.c:439: enemy->reversePatrol = NO;
   6BD0 AF            [ 4] 2133 	xor	a, a
   6BD1 12            [ 7] 2134 	ld	(de),a
                           2135 ;src/main.c:440: enemy->patrolling = 1;
   6BD2 21 0B 00      [10] 2136 	ld	hl,#0x000B
   6BD5 09            [11] 2137 	add	hl,bc
   6BD6 36 01         [10] 2138 	ld	(hl),#0x01
                           2139 ;src/main.c:441: enemy->seek = 0;
   6BD8 21 14 00      [10] 2140 	ld	hl,#0x0014
   6BDB 09            [11] 2141 	add	hl,bc
   6BDC 36 00         [10] 2142 	ld	(hl),#0x00
                           2143 ;src/main.c:442: enemy->lastIter = enemy->iter - 1;
   6BDE 21 10 00      [10] 2144 	ld	hl,#0x0010
   6BE1 09            [11] 2145 	add	hl,bc
   6BE2 EB            [ 4] 2146 	ex	de,hl
   6BE3 FD 7E 00      [19] 2147 	ld	a, 0 (iy)
   6BE6 C6 FF         [ 7] 2148 	add	a,#0xFF
   6BE8 12            [ 7] 2149 	ld	(de),a
                           2150 ;src/main.c:443: enemy->iter = 0;
   6BE9 FD 36 00 00   [19] 2151 	ld	0 (iy),#0x00
   6BED FD 36 01 00   [19] 2152 	ld	1 (iy),#0x00
                           2153 ;src/main.c:444: pathFinding(enemy->x, enemy->y, enemy->p_seek_x, enemy->p_seek_y, enemy, mapa);
   6BF1 69            [ 4] 2154 	ld	l, c
   6BF2 60            [ 4] 2155 	ld	h, b
   6BF3 11 18 00      [10] 2156 	ld	de, #0x0018
   6BF6 19            [11] 2157 	add	hl, de
   6BF7 56            [ 7] 2158 	ld	d,(hl)
   6BF8 C5            [11] 2159 	push	bc
   6BF9 FD E1         [14] 2160 	pop	iy
   6BFB FD 7E 17      [19] 2161 	ld	a,23 (iy)
   6BFE DD 77 FC      [19] 2162 	ld	-4 (ix),a
   6C01 DD 6E FE      [19] 2163 	ld	l,-2 (ix)
   6C04 DD 66 FF      [19] 2164 	ld	h,-1 (ix)
   6C07 5E            [ 7] 2165 	ld	e,(hl)
   6C08 0A            [ 7] 2166 	ld	a,(bc)
   6C09 DD 77 FE      [19] 2167 	ld	-2 (ix),a
   6C0C 2A 45 60      [16] 2168 	ld	hl,(_mapa)
   6C0F E5            [11] 2169 	push	hl
   6C10 C5            [11] 2170 	push	bc
   6C11 D5            [11] 2171 	push	de
   6C12 33            [ 6] 2172 	inc	sp
   6C13 DD 56 FC      [19] 2173 	ld	d, -4 (ix)
   6C16 D5            [11] 2174 	push	de
   6C17 DD 7E FE      [19] 2175 	ld	a,-2 (ix)
   6C1A F5            [11] 2176 	push	af
   6C1B 33            [ 6] 2177 	inc	sp
   6C1C CD 27 48      [17] 2178 	call	_pathFinding
   6C1F 21 08 00      [10] 2179 	ld	hl,#8
   6C22 39            [11] 2180 	add	hl,sp
   6C23 F9            [ 6] 2181 	ld	sp,hl
   6C24                    2182 00108$:
   6C24 DD F9         [10] 2183 	ld	sp, ix
   6C26 DD E1         [14] 2184 	pop	ix
   6C28 C9            [10] 2185 	ret
                           2186 ;src/main.c:451: void lookFor(TEnemy* enemy){
                           2187 ;	---------------------------------
                           2188 ; Function lookFor
                           2189 ; ---------------------------------
   6C29                    2190 _lookFor::
   6C29 DD E5         [15] 2191 	push	ix
   6C2B DD 21 00 00   [14] 2192 	ld	ix,#0
   6C2F DD 39         [15] 2193 	add	ix,sp
                           2194 ;src/main.c:460: i16 difx = abs((i16)(enemy->x - prota.x));
   6C31 DD 4E 04      [19] 2195 	ld	c,4 (ix)
   6C34 DD 46 05      [19] 2196 	ld	b,5 (ix)
   6C37 0A            [ 7] 2197 	ld	a,(bc)
   6C38 5F            [ 4] 2198 	ld	e,a
   6C39 16 00         [ 7] 2199 	ld	d,#0x00
   6C3B 21 69 5F      [10] 2200 	ld	hl,#_prota+0
   6C3E 6E            [ 7] 2201 	ld	l,(hl)
   6C3F 26 00         [ 7] 2202 	ld	h,#0x00
   6C41 7B            [ 4] 2203 	ld	a,e
   6C42 95            [ 4] 2204 	sub	a, l
   6C43 5F            [ 4] 2205 	ld	e,a
   6C44 7A            [ 4] 2206 	ld	a,d
   6C45 9C            [ 4] 2207 	sbc	a, h
   6C46 57            [ 4] 2208 	ld	d,a
   6C47 C5            [11] 2209 	push	bc
   6C48 D5            [11] 2210 	push	de
   6C49 CD F9 49      [17] 2211 	call	_abs
   6C4C F1            [10] 2212 	pop	af
   6C4D C1            [10] 2213 	pop	bc
                           2214 ;src/main.c:461: i16 dify = abs((i16)(enemy->y - prota.y));
   6C4E 69            [ 4] 2215 	ld	l, c
   6C4F 60            [ 4] 2216 	ld	h, b
   6C50 23            [ 6] 2217 	inc	hl
   6C51 5E            [ 7] 2218 	ld	e,(hl)
   6C52 16 00         [ 7] 2219 	ld	d,#0x00
   6C54 21 6A 5F      [10] 2220 	ld	hl,#_prota+1
   6C57 6E            [ 7] 2221 	ld	l,(hl)
   6C58 26 00         [ 7] 2222 	ld	h,#0x00
   6C5A 7B            [ 4] 2223 	ld	a,e
   6C5B 95            [ 4] 2224 	sub	a, l
   6C5C 5F            [ 4] 2225 	ld	e,a
   6C5D 7A            [ 4] 2226 	ld	a,d
   6C5E 9C            [ 4] 2227 	sbc	a, h
   6C5F 57            [ 4] 2228 	ld	d,a
   6C60 C5            [11] 2229 	push	bc
   6C61 D5            [11] 2230 	push	de
   6C62 CD F9 49      [17] 2231 	call	_abs
   6C65 F1            [10] 2232 	pop	af
   6C66 C1            [10] 2233 	pop	bc
                           2234 ;src/main.c:464: enemy->seen = NO;
   6C67 21 12 00      [10] 2235 	ld	hl,#0x0012
   6C6A 09            [11] 2236 	add	hl,bc
   6C6B 36 00         [10] 2237 	ld	(hl),#0x00
                           2238 ;src/main.c:465: enemy->inRange = NO;
   6C6D 21 11 00      [10] 2239 	ld	hl,#0x0011
   6C70 09            [11] 2240 	add	hl,bc
   6C71 36 00         [10] 2241 	ld	(hl),#0x00
                           2242 ;src/main.c:466: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90);
   6C73 21 18 5A      [10] 2243 	ld	hl,#0x5A18
   6C76 E5            [11] 2244 	push	hl
   6C77 21 00 C0      [10] 2245 	ld	hl,#0xC000
   6C7A E5            [11] 2246 	push	hl
   6C7B CD 9E 5E      [17] 2247 	call	_cpct_getScreenPtr
   6C7E DD E1         [14] 2248 	pop	ix
   6C80 C9            [10] 2249 	ret
                           2250 ;src/main.c:479: void engage(TEnemy *enemy, u8 dx, u8 dy) {
                           2251 ;	---------------------------------
                           2252 ; Function engage
                           2253 ; ---------------------------------
   6C81                    2254 _engage::
   6C81 DD E5         [15] 2255 	push	ix
   6C83 DD 21 00 00   [14] 2256 	ld	ix,#0
   6C87 DD 39         [15] 2257 	add	ix,sp
   6C89 21 F3 FF      [10] 2258 	ld	hl,#-13
   6C8C 39            [11] 2259 	add	hl,sp
   6C8D F9            [ 6] 2260 	ld	sp,hl
                           2261 ;src/main.c:480: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   6C8E DD 7E 04      [19] 2262 	ld	a,4 (ix)
   6C91 DD 77 F7      [19] 2263 	ld	-9 (ix),a
   6C94 DD 7E 05      [19] 2264 	ld	a,5 (ix)
   6C97 DD 77 F8      [19] 2265 	ld	-8 (ix),a
   6C9A DD 6E F7      [19] 2266 	ld	l,-9 (ix)
   6C9D DD 66 F8      [19] 2267 	ld	h,-8 (ix)
   6CA0 4E            [ 7] 2268 	ld	c,(hl)
   6CA1 06 00         [ 7] 2269 	ld	b,#0x00
   6CA3 21 69 5F      [10] 2270 	ld	hl,#_prota+0
   6CA6 5E            [ 7] 2271 	ld	e,(hl)
   6CA7 16 00         [ 7] 2272 	ld	d,#0x00
   6CA9 79            [ 4] 2273 	ld	a,c
   6CAA 93            [ 4] 2274 	sub	a, e
   6CAB 4F            [ 4] 2275 	ld	c,a
   6CAC 78            [ 4] 2276 	ld	a,b
   6CAD 9A            [ 4] 2277 	sbc	a, d
   6CAE 47            [ 4] 2278 	ld	b,a
   6CAF C5            [11] 2279 	push	bc
   6CB0 CD F9 49      [17] 2280 	call	_abs
   6CB3 F1            [10] 2281 	pop	af
   6CB4 4D            [ 4] 2282 	ld	c,l
                           2283 ;src/main.c:481: u8 dify = abs(enemy->y - prota.y);
   6CB5 DD 7E F7      [19] 2284 	ld	a,-9 (ix)
   6CB8 C6 01         [ 7] 2285 	add	a, #0x01
   6CBA DD 77 F9      [19] 2286 	ld	-7 (ix),a
   6CBD DD 7E F8      [19] 2287 	ld	a,-8 (ix)
   6CC0 CE 00         [ 7] 2288 	adc	a, #0x00
   6CC2 DD 77 FA      [19] 2289 	ld	-6 (ix),a
   6CC5 DD 6E F9      [19] 2290 	ld	l,-7 (ix)
   6CC8 DD 66 FA      [19] 2291 	ld	h,-6 (ix)
   6CCB 5E            [ 7] 2292 	ld	e,(hl)
   6CCC 16 00         [ 7] 2293 	ld	d,#0x00
   6CCE 21 6A 5F      [10] 2294 	ld	hl,#_prota+1
   6CD1 6E            [ 7] 2295 	ld	l,(hl)
   6CD2 26 00         [ 7] 2296 	ld	h,#0x00
   6CD4 7B            [ 4] 2297 	ld	a,e
   6CD5 95            [ 4] 2298 	sub	a, l
   6CD6 5F            [ 4] 2299 	ld	e,a
   6CD7 7A            [ 4] 2300 	ld	a,d
   6CD8 9C            [ 4] 2301 	sbc	a, h
   6CD9 57            [ 4] 2302 	ld	d,a
   6CDA C5            [11] 2303 	push	bc
   6CDB D5            [11] 2304 	push	de
   6CDC CD F9 49      [17] 2305 	call	_abs
   6CDF F1            [10] 2306 	pop	af
   6CE0 C1            [10] 2307 	pop	bc
                           2308 ;src/main.c:482: u8 dist = difx + dify; // manhattan
   6CE1 09            [11] 2309 	add	hl, bc
   6CE2 DD 75 F6      [19] 2310 	ld	-10 (ix),l
                           2311 ;src/main.c:484: u8 movX = 0;
   6CE5 DD 36 F5 00   [19] 2312 	ld	-11 (ix),#0x00
                           2313 ;src/main.c:485: u8 movY = 0;
   6CE9 DD 36 F4 00   [19] 2314 	ld	-12 (ix),#0x00
                           2315 ;src/main.c:486: u8 mov = 0;
   6CED DD 36 F3 00   [19] 2316 	ld	-13 (ix),#0x00
                           2317 ;src/main.c:488: if (enemy->y == dy) { // alineado en el eje x
   6CF1 DD 6E F9      [19] 2318 	ld	l,-7 (ix)
   6CF4 DD 66 FA      [19] 2319 	ld	h,-6 (ix)
   6CF7 7E            [ 7] 2320 	ld	a,(hl)
   6CF8 DD 77 FB      [19] 2321 	ld	-5 (ix),a
                           2322 ;src/main.c:490: if (dist > 10) {
   6CFB 3E 0A         [ 7] 2323 	ld	a,#0x0A
   6CFD DD 96 F6      [19] 2324 	sub	a, -10 (ix)
   6D00 3E 00         [ 7] 2325 	ld	a,#0x00
   6D02 17            [ 4] 2326 	rla
   6D03 DD 77 FC      [19] 2327 	ld	-4 (ix),a
                           2328 ;src/main.c:488: if (enemy->y == dy) { // alineado en el eje x
   6D06 DD 7E 07      [19] 2329 	ld	a,7 (ix)
   6D09 DD 96 FB      [19] 2330 	sub	a, -5 (ix)
   6D0C C2 0E 6E      [10] 2331 	jp	NZ,00187$
                           2332 ;src/main.c:490: if (dist > 10) {
   6D0F DD 7E FC      [19] 2333 	ld	a,-4 (ix)
   6D12 B7            [ 4] 2334 	or	a, a
   6D13 CA 72 73      [10] 2335 	jp	Z,00189$
                           2336 ;src/main.c:491: if (dx < enemy->x) { // izquierda
   6D16 DD 6E F7      [19] 2337 	ld	l,-9 (ix)
   6D19 DD 66 F8      [19] 2338 	ld	h,-8 (ix)
   6D1C 46            [ 7] 2339 	ld	b,(hl)
   6D1D DD 7E 06      [19] 2340 	ld	a,6 (ix)
   6D20 90            [ 4] 2341 	sub	a, b
   6D21 30 72         [12] 2342 	jr	NC,00110$
                           2343 ;src/main.c:492: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   6D23 05            [ 4] 2344 	dec	b
   6D24 DD 7E FB      [19] 2345 	ld	a,-5 (ix)
   6D27 F5            [11] 2346 	push	af
   6D28 33            [ 6] 2347 	inc	sp
   6D29 C5            [11] 2348 	push	bc
   6D2A 33            [ 6] 2349 	inc	sp
   6D2B 2A 45 60      [16] 2350 	ld	hl,(_mapa)
   6D2E E5            [11] 2351 	push	hl
   6D2F CD B5 49      [17] 2352 	call	_getTilePtr
   6D32 F1            [10] 2353 	pop	af
   6D33 F1            [10] 2354 	pop	af
   6D34 4E            [ 7] 2355 	ld	c,(hl)
   6D35 3E 02         [ 7] 2356 	ld	a,#0x02
   6D37 91            [ 4] 2357 	sub	a, c
   6D38 DA 72 73      [10] 2358 	jp	C,00189$
                           2359 ;src/main.c:493: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   6D3B DD 6E F9      [19] 2360 	ld	l,-7 (ix)
   6D3E DD 66 FA      [19] 2361 	ld	h,-6 (ix)
   6D41 7E            [ 7] 2362 	ld	a,(hl)
   6D42 C6 0B         [ 7] 2363 	add	a, #0x0B
   6D44 57            [ 4] 2364 	ld	d,a
   6D45 DD 6E F7      [19] 2365 	ld	l,-9 (ix)
   6D48 DD 66 F8      [19] 2366 	ld	h,-8 (ix)
   6D4B 46            [ 7] 2367 	ld	b,(hl)
   6D4C 05            [ 4] 2368 	dec	b
   6D4D D5            [11] 2369 	push	de
   6D4E 33            [ 6] 2370 	inc	sp
   6D4F C5            [11] 2371 	push	bc
   6D50 33            [ 6] 2372 	inc	sp
   6D51 2A 45 60      [16] 2373 	ld	hl,(_mapa)
   6D54 E5            [11] 2374 	push	hl
   6D55 CD B5 49      [17] 2375 	call	_getTilePtr
   6D58 F1            [10] 2376 	pop	af
   6D59 F1            [10] 2377 	pop	af
   6D5A 4E            [ 7] 2378 	ld	c,(hl)
   6D5B 3E 02         [ 7] 2379 	ld	a,#0x02
   6D5D 91            [ 4] 2380 	sub	a, c
   6D5E DA 72 73      [10] 2381 	jp	C,00189$
                           2382 ;src/main.c:494: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   6D61 DD 6E F9      [19] 2383 	ld	l,-7 (ix)
   6D64 DD 66 FA      [19] 2384 	ld	h,-6 (ix)
   6D67 7E            [ 7] 2385 	ld	a,(hl)
   6D68 C6 16         [ 7] 2386 	add	a, #0x16
   6D6A 57            [ 4] 2387 	ld	d,a
   6D6B DD 6E F7      [19] 2388 	ld	l,-9 (ix)
   6D6E DD 66 F8      [19] 2389 	ld	h,-8 (ix)
   6D71 46            [ 7] 2390 	ld	b,(hl)
   6D72 05            [ 4] 2391 	dec	b
   6D73 D5            [11] 2392 	push	de
   6D74 33            [ 6] 2393 	inc	sp
   6D75 C5            [11] 2394 	push	bc
   6D76 33            [ 6] 2395 	inc	sp
   6D77 2A 45 60      [16] 2396 	ld	hl,(_mapa)
   6D7A E5            [11] 2397 	push	hl
   6D7B CD B5 49      [17] 2398 	call	_getTilePtr
   6D7E F1            [10] 2399 	pop	af
   6D7F F1            [10] 2400 	pop	af
   6D80 4E            [ 7] 2401 	ld	c,(hl)
   6D81 3E 02         [ 7] 2402 	ld	a,#0x02
   6D83 91            [ 4] 2403 	sub	a, c
   6D84 DA 72 73      [10] 2404 	jp	C,00189$
                           2405 ;src/main.c:495: moverEnemigoIzquierda(enemy);
   6D87 DD 6E F7      [19] 2406 	ld	l,-9 (ix)
   6D8A DD 66 F8      [19] 2407 	ld	h,-8 (ix)
   6D8D E5            [11] 2408 	push	hl
   6D8E CD F9 68      [17] 2409 	call	_moverEnemigoIzquierda
   6D91 F1            [10] 2410 	pop	af
                           2411 ;src/main.c:497: mov = 1;
   6D92 C3 72 73      [10] 2412 	jp	00189$
   6D95                    2413 00110$:
                           2414 ;src/main.c:500: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   6D95 78            [ 4] 2415 	ld	a,b
   6D96 C6 05         [ 7] 2416 	add	a, #0x05
   6D98 47            [ 4] 2417 	ld	b,a
   6D99 DD 7E FB      [19] 2418 	ld	a,-5 (ix)
   6D9C F5            [11] 2419 	push	af
   6D9D 33            [ 6] 2420 	inc	sp
   6D9E C5            [11] 2421 	push	bc
   6D9F 33            [ 6] 2422 	inc	sp
   6DA0 2A 45 60      [16] 2423 	ld	hl,(_mapa)
   6DA3 E5            [11] 2424 	push	hl
   6DA4 CD B5 49      [17] 2425 	call	_getTilePtr
   6DA7 F1            [10] 2426 	pop	af
   6DA8 F1            [10] 2427 	pop	af
   6DA9 4E            [ 7] 2428 	ld	c,(hl)
   6DAA 3E 02         [ 7] 2429 	ld	a,#0x02
   6DAC 91            [ 4] 2430 	sub	a, c
   6DAD DA 72 73      [10] 2431 	jp	C,00189$
                           2432 ;src/main.c:501: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   6DB0 DD 6E F9      [19] 2433 	ld	l,-7 (ix)
   6DB3 DD 66 FA      [19] 2434 	ld	h,-6 (ix)
   6DB6 7E            [ 7] 2435 	ld	a,(hl)
   6DB7 C6 0B         [ 7] 2436 	add	a, #0x0B
   6DB9 57            [ 4] 2437 	ld	d,a
   6DBA DD 6E F7      [19] 2438 	ld	l,-9 (ix)
   6DBD DD 66 F8      [19] 2439 	ld	h,-8 (ix)
   6DC0 7E            [ 7] 2440 	ld	a,(hl)
   6DC1 C6 05         [ 7] 2441 	add	a, #0x05
   6DC3 47            [ 4] 2442 	ld	b,a
   6DC4 D5            [11] 2443 	push	de
   6DC5 33            [ 6] 2444 	inc	sp
   6DC6 C5            [11] 2445 	push	bc
   6DC7 33            [ 6] 2446 	inc	sp
   6DC8 2A 45 60      [16] 2447 	ld	hl,(_mapa)
   6DCB E5            [11] 2448 	push	hl
   6DCC CD B5 49      [17] 2449 	call	_getTilePtr
   6DCF F1            [10] 2450 	pop	af
   6DD0 F1            [10] 2451 	pop	af
   6DD1 4E            [ 7] 2452 	ld	c,(hl)
   6DD2 3E 02         [ 7] 2453 	ld	a,#0x02
   6DD4 91            [ 4] 2454 	sub	a, c
   6DD5 DA 72 73      [10] 2455 	jp	C,00189$
                           2456 ;src/main.c:502: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   6DD8 DD 6E F9      [19] 2457 	ld	l,-7 (ix)
   6DDB DD 66 FA      [19] 2458 	ld	h,-6 (ix)
   6DDE 7E            [ 7] 2459 	ld	a,(hl)
   6DDF C6 16         [ 7] 2460 	add	a, #0x16
   6DE1 57            [ 4] 2461 	ld	d,a
   6DE2 DD 6E F7      [19] 2462 	ld	l,-9 (ix)
   6DE5 DD 66 F8      [19] 2463 	ld	h,-8 (ix)
   6DE8 7E            [ 7] 2464 	ld	a,(hl)
   6DE9 C6 05         [ 7] 2465 	add	a, #0x05
   6DEB 47            [ 4] 2466 	ld	b,a
   6DEC D5            [11] 2467 	push	de
   6DED 33            [ 6] 2468 	inc	sp
   6DEE C5            [11] 2469 	push	bc
   6DEF 33            [ 6] 2470 	inc	sp
   6DF0 2A 45 60      [16] 2471 	ld	hl,(_mapa)
   6DF3 E5            [11] 2472 	push	hl
   6DF4 CD B5 49      [17] 2473 	call	_getTilePtr
   6DF7 F1            [10] 2474 	pop	af
   6DF8 F1            [10] 2475 	pop	af
   6DF9 4E            [ 7] 2476 	ld	c,(hl)
   6DFA 3E 02         [ 7] 2477 	ld	a,#0x02
   6DFC 91            [ 4] 2478 	sub	a, c
   6DFD DA 72 73      [10] 2479 	jp	C,00189$
                           2480 ;src/main.c:503: moverEnemigoDerecha(enemy);
   6E00 DD 6E F7      [19] 2481 	ld	l,-9 (ix)
   6E03 DD 66 F8      [19] 2482 	ld	h,-8 (ix)
   6E06 E5            [11] 2483 	push	hl
   6E07 CD E9 68      [17] 2484 	call	_moverEnemigoDerecha
   6E0A F1            [10] 2485 	pop	af
                           2486 ;src/main.c:505: mov = 1;
   6E0B C3 72 73      [10] 2487 	jp	00189$
   6E0E                    2488 00187$:
                           2489 ;src/main.c:510: else if (enemy->x == dx) {
   6E0E DD 6E F7      [19] 2490 	ld	l,-9 (ix)
   6E11 DD 66 F8      [19] 2491 	ld	h,-8 (ix)
   6E14 7E            [ 7] 2492 	ld	a,(hl)
   6E15 DD 77 FD      [19] 2493 	ld	-3 (ix), a
   6E18 DD 96 06      [19] 2494 	sub	a, 6 (ix)
   6E1B C2 18 6F      [10] 2495 	jp	NZ,00184$
                           2496 ;src/main.c:512: if (dist > 10) {
   6E1E DD 7E FC      [19] 2497 	ld	a,-4 (ix)
   6E21 B7            [ 4] 2498 	or	a, a
   6E22 CA 72 73      [10] 2499 	jp	Z,00189$
                           2500 ;src/main.c:513: if (dy < enemy->y) {
   6E25 DD 7E 07      [19] 2501 	ld	a,7 (ix)
   6E28 DD 96 FB      [19] 2502 	sub	a, -5 (ix)
   6E2B 30 74         [12] 2503 	jr	NC,00123$
                           2504 ;src/main.c:514: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   6E2D DD 46 FB      [19] 2505 	ld	b,-5 (ix)
   6E30 05            [ 4] 2506 	dec	b
   6E31 05            [ 4] 2507 	dec	b
   6E32 C5            [11] 2508 	push	bc
   6E33 33            [ 6] 2509 	inc	sp
   6E34 DD 7E FD      [19] 2510 	ld	a,-3 (ix)
   6E37 F5            [11] 2511 	push	af
   6E38 33            [ 6] 2512 	inc	sp
   6E39 2A 45 60      [16] 2513 	ld	hl,(_mapa)
   6E3C E5            [11] 2514 	push	hl
   6E3D CD B5 49      [17] 2515 	call	_getTilePtr
   6E40 F1            [10] 2516 	pop	af
   6E41 F1            [10] 2517 	pop	af
   6E42 4E            [ 7] 2518 	ld	c,(hl)
   6E43 3E 02         [ 7] 2519 	ld	a,#0x02
   6E45 91            [ 4] 2520 	sub	a, c
   6E46 DA 72 73      [10] 2521 	jp	C,00189$
                           2522 ;src/main.c:515: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   6E49 DD 6E F9      [19] 2523 	ld	l,-7 (ix)
   6E4C DD 66 FA      [19] 2524 	ld	h,-6 (ix)
   6E4F 46            [ 7] 2525 	ld	b,(hl)
   6E50 05            [ 4] 2526 	dec	b
   6E51 05            [ 4] 2527 	dec	b
   6E52 DD 6E F7      [19] 2528 	ld	l,-9 (ix)
   6E55 DD 66 F8      [19] 2529 	ld	h,-8 (ix)
   6E58 56            [ 7] 2530 	ld	d,(hl)
   6E59 14            [ 4] 2531 	inc	d
   6E5A 14            [ 4] 2532 	inc	d
   6E5B 4A            [ 4] 2533 	ld	c, d
   6E5C C5            [11] 2534 	push	bc
   6E5D 2A 45 60      [16] 2535 	ld	hl,(_mapa)
   6E60 E5            [11] 2536 	push	hl
   6E61 CD B5 49      [17] 2537 	call	_getTilePtr
   6E64 F1            [10] 2538 	pop	af
   6E65 F1            [10] 2539 	pop	af
   6E66 4E            [ 7] 2540 	ld	c,(hl)
   6E67 3E 02         [ 7] 2541 	ld	a,#0x02
   6E69 91            [ 4] 2542 	sub	a, c
   6E6A DA 72 73      [10] 2543 	jp	C,00189$
                           2544 ;src/main.c:516: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   6E6D DD 6E F9      [19] 2545 	ld	l,-7 (ix)
   6E70 DD 66 FA      [19] 2546 	ld	h,-6 (ix)
   6E73 46            [ 7] 2547 	ld	b,(hl)
   6E74 05            [ 4] 2548 	dec	b
   6E75 05            [ 4] 2549 	dec	b
   6E76 DD 6E F7      [19] 2550 	ld	l,-9 (ix)
   6E79 DD 66 F8      [19] 2551 	ld	h,-8 (ix)
   6E7C 7E            [ 7] 2552 	ld	a,(hl)
   6E7D C6 04         [ 7] 2553 	add	a, #0x04
   6E7F C5            [11] 2554 	push	bc
   6E80 33            [ 6] 2555 	inc	sp
   6E81 F5            [11] 2556 	push	af
   6E82 33            [ 6] 2557 	inc	sp
   6E83 2A 45 60      [16] 2558 	ld	hl,(_mapa)
   6E86 E5            [11] 2559 	push	hl
   6E87 CD B5 49      [17] 2560 	call	_getTilePtr
   6E8A F1            [10] 2561 	pop	af
   6E8B F1            [10] 2562 	pop	af
   6E8C 4E            [ 7] 2563 	ld	c,(hl)
   6E8D 3E 02         [ 7] 2564 	ld	a,#0x02
   6E8F 91            [ 4] 2565 	sub	a, c
   6E90 DA 72 73      [10] 2566 	jp	C,00189$
                           2567 ;src/main.c:517: moverEnemigoArriba(enemy);
   6E93 DD 6E F7      [19] 2568 	ld	l,-9 (ix)
   6E96 DD 66 F8      [19] 2569 	ld	h,-8 (ix)
   6E99 E5            [11] 2570 	push	hl
   6E9A CD AB 68      [17] 2571 	call	_moverEnemigoArriba
   6E9D F1            [10] 2572 	pop	af
                           2573 ;src/main.c:519: mov = 1;
   6E9E C3 72 73      [10] 2574 	jp	00189$
   6EA1                    2575 00123$:
                           2576 ;src/main.c:522: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   6EA1 DD 7E FB      [19] 2577 	ld	a,-5 (ix)
   6EA4 C6 18         [ 7] 2578 	add	a, #0x18
   6EA6 47            [ 4] 2579 	ld	b,a
   6EA7 C5            [11] 2580 	push	bc
   6EA8 33            [ 6] 2581 	inc	sp
   6EA9 DD 7E FD      [19] 2582 	ld	a,-3 (ix)
   6EAC F5            [11] 2583 	push	af
   6EAD 33            [ 6] 2584 	inc	sp
   6EAE 2A 45 60      [16] 2585 	ld	hl,(_mapa)
   6EB1 E5            [11] 2586 	push	hl
   6EB2 CD B5 49      [17] 2587 	call	_getTilePtr
   6EB5 F1            [10] 2588 	pop	af
   6EB6 F1            [10] 2589 	pop	af
   6EB7 4E            [ 7] 2590 	ld	c,(hl)
   6EB8 3E 02         [ 7] 2591 	ld	a,#0x02
   6EBA 91            [ 4] 2592 	sub	a, c
   6EBB DA 72 73      [10] 2593 	jp	C,00189$
                           2594 ;src/main.c:523: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   6EBE DD 6E F9      [19] 2595 	ld	l,-7 (ix)
   6EC1 DD 66 FA      [19] 2596 	ld	h,-6 (ix)
   6EC4 7E            [ 7] 2597 	ld	a,(hl)
   6EC5 C6 18         [ 7] 2598 	add	a, #0x18
   6EC7 47            [ 4] 2599 	ld	b,a
   6EC8 DD 6E F7      [19] 2600 	ld	l,-9 (ix)
   6ECB DD 66 F8      [19] 2601 	ld	h,-8 (ix)
   6ECE 56            [ 7] 2602 	ld	d,(hl)
   6ECF 14            [ 4] 2603 	inc	d
   6ED0 14            [ 4] 2604 	inc	d
   6ED1 4A            [ 4] 2605 	ld	c, d
   6ED2 C5            [11] 2606 	push	bc
   6ED3 2A 45 60      [16] 2607 	ld	hl,(_mapa)
   6ED6 E5            [11] 2608 	push	hl
   6ED7 CD B5 49      [17] 2609 	call	_getTilePtr
   6EDA F1            [10] 2610 	pop	af
   6EDB F1            [10] 2611 	pop	af
   6EDC 4E            [ 7] 2612 	ld	c,(hl)
   6EDD 3E 02         [ 7] 2613 	ld	a,#0x02
   6EDF 91            [ 4] 2614 	sub	a, c
   6EE0 DA 72 73      [10] 2615 	jp	C,00189$
                           2616 ;src/main.c:524: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   6EE3 DD 6E F9      [19] 2617 	ld	l,-7 (ix)
   6EE6 DD 66 FA      [19] 2618 	ld	h,-6 (ix)
   6EE9 7E            [ 7] 2619 	ld	a,(hl)
   6EEA C6 18         [ 7] 2620 	add	a, #0x18
   6EEC 47            [ 4] 2621 	ld	b,a
   6EED DD 6E F7      [19] 2622 	ld	l,-9 (ix)
   6EF0 DD 66 F8      [19] 2623 	ld	h,-8 (ix)
   6EF3 7E            [ 7] 2624 	ld	a,(hl)
   6EF4 C6 04         [ 7] 2625 	add	a, #0x04
   6EF6 C5            [11] 2626 	push	bc
   6EF7 33            [ 6] 2627 	inc	sp
   6EF8 F5            [11] 2628 	push	af
   6EF9 33            [ 6] 2629 	inc	sp
   6EFA 2A 45 60      [16] 2630 	ld	hl,(_mapa)
   6EFD E5            [11] 2631 	push	hl
   6EFE CD B5 49      [17] 2632 	call	_getTilePtr
   6F01 F1            [10] 2633 	pop	af
   6F02 F1            [10] 2634 	pop	af
   6F03 4E            [ 7] 2635 	ld	c,(hl)
   6F04 3E 02         [ 7] 2636 	ld	a,#0x02
   6F06 91            [ 4] 2637 	sub	a, c
   6F07 DA 72 73      [10] 2638 	jp	C,00189$
                           2639 ;src/main.c:525: moverEnemigoAbajo(enemy);
   6F0A DD 6E F7      [19] 2640 	ld	l,-9 (ix)
   6F0D DD 66 F8      [19] 2641 	ld	h,-8 (ix)
   6F10 E5            [11] 2642 	push	hl
   6F11 CD CA 68      [17] 2643 	call	_moverEnemigoAbajo
   6F14 F1            [10] 2644 	pop	af
                           2645 ;src/main.c:527: mov = 1;
   6F15 C3 72 73      [10] 2646 	jp	00189$
   6F18                    2647 00184$:
                           2648 ;src/main.c:533: if (dist > 20) {
   6F18 3E 14         [ 7] 2649 	ld	a,#0x14
   6F1A DD 96 F6      [19] 2650 	sub	a, -10 (ix)
   6F1D D2 72 73      [10] 2651 	jp	NC,00189$
                           2652 ;src/main.c:534: if (dx < enemy->x) {
   6F20 DD 7E 06      [19] 2653 	ld	a,6 (ix)
   6F23 DD 96 FD      [19] 2654 	sub	a, -3 (ix)
   6F26 D2 A8 6F      [10] 2655 	jp	NC,00136$
                           2656 ;src/main.c:535: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   6F29 DD 46 FD      [19] 2657 	ld	b,-3 (ix)
   6F2C 05            [ 4] 2658 	dec	b
   6F2D DD 7E FB      [19] 2659 	ld	a,-5 (ix)
   6F30 F5            [11] 2660 	push	af
   6F31 33            [ 6] 2661 	inc	sp
   6F32 C5            [11] 2662 	push	bc
   6F33 33            [ 6] 2663 	inc	sp
   6F34 2A 45 60      [16] 2664 	ld	hl,(_mapa)
   6F37 E5            [11] 2665 	push	hl
   6F38 CD B5 49      [17] 2666 	call	_getTilePtr
   6F3B F1            [10] 2667 	pop	af
   6F3C F1            [10] 2668 	pop	af
   6F3D 4E            [ 7] 2669 	ld	c,(hl)
   6F3E 3E 02         [ 7] 2670 	ld	a,#0x02
   6F40 91            [ 4] 2671 	sub	a, c
   6F41 DA 25 70      [10] 2672 	jp	C,00137$
                           2673 ;src/main.c:536: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   6F44 DD 6E F9      [19] 2674 	ld	l,-7 (ix)
   6F47 DD 66 FA      [19] 2675 	ld	h,-6 (ix)
   6F4A 7E            [ 7] 2676 	ld	a,(hl)
   6F4B C6 0B         [ 7] 2677 	add	a, #0x0B
   6F4D 4F            [ 4] 2678 	ld	c,a
   6F4E DD 6E F7      [19] 2679 	ld	l,-9 (ix)
   6F51 DD 66 F8      [19] 2680 	ld	h,-8 (ix)
   6F54 46            [ 7] 2681 	ld	b,(hl)
   6F55 05            [ 4] 2682 	dec	b
   6F56 79            [ 4] 2683 	ld	a,c
   6F57 F5            [11] 2684 	push	af
   6F58 33            [ 6] 2685 	inc	sp
   6F59 C5            [11] 2686 	push	bc
   6F5A 33            [ 6] 2687 	inc	sp
   6F5B 2A 45 60      [16] 2688 	ld	hl,(_mapa)
   6F5E E5            [11] 2689 	push	hl
   6F5F CD B5 49      [17] 2690 	call	_getTilePtr
   6F62 F1            [10] 2691 	pop	af
   6F63 F1            [10] 2692 	pop	af
   6F64 4E            [ 7] 2693 	ld	c,(hl)
   6F65 3E 02         [ 7] 2694 	ld	a,#0x02
   6F67 91            [ 4] 2695 	sub	a, c
   6F68 DA 25 70      [10] 2696 	jp	C,00137$
                           2697 ;src/main.c:537: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   6F6B DD 6E F9      [19] 2698 	ld	l,-7 (ix)
   6F6E DD 66 FA      [19] 2699 	ld	h,-6 (ix)
   6F71 7E            [ 7] 2700 	ld	a,(hl)
   6F72 C6 16         [ 7] 2701 	add	a, #0x16
   6F74 4F            [ 4] 2702 	ld	c,a
   6F75 DD 6E F7      [19] 2703 	ld	l,-9 (ix)
   6F78 DD 66 F8      [19] 2704 	ld	h,-8 (ix)
   6F7B 46            [ 7] 2705 	ld	b,(hl)
   6F7C 05            [ 4] 2706 	dec	b
   6F7D 79            [ 4] 2707 	ld	a,c
   6F7E F5            [11] 2708 	push	af
   6F7F 33            [ 6] 2709 	inc	sp
   6F80 C5            [11] 2710 	push	bc
   6F81 33            [ 6] 2711 	inc	sp
   6F82 2A 45 60      [16] 2712 	ld	hl,(_mapa)
   6F85 E5            [11] 2713 	push	hl
   6F86 CD B5 49      [17] 2714 	call	_getTilePtr
   6F89 F1            [10] 2715 	pop	af
   6F8A F1            [10] 2716 	pop	af
   6F8B 4E            [ 7] 2717 	ld	c,(hl)
   6F8C 3E 02         [ 7] 2718 	ld	a,#0x02
   6F8E 91            [ 4] 2719 	sub	a, c
   6F8F DA 25 70      [10] 2720 	jp	C,00137$
                           2721 ;src/main.c:538: moverEnemigoIzquierda(enemy);
   6F92 DD 6E F7      [19] 2722 	ld	l,-9 (ix)
   6F95 DD 66 F8      [19] 2723 	ld	h,-8 (ix)
   6F98 E5            [11] 2724 	push	hl
   6F99 CD F9 68      [17] 2725 	call	_moverEnemigoIzquierda
   6F9C F1            [10] 2726 	pop	af
                           2727 ;src/main.c:539: movX = 1;
   6F9D DD 36 F5 01   [19] 2728 	ld	-11 (ix),#0x01
                           2729 ;src/main.c:540: mov = 1;
   6FA1 DD 36 F3 01   [19] 2730 	ld	-13 (ix),#0x01
   6FA5 C3 25 70      [10] 2731 	jp	00137$
   6FA8                    2732 00136$:
                           2733 ;src/main.c:543: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   6FA8 DD 7E FD      [19] 2734 	ld	a,-3 (ix)
   6FAB C6 05         [ 7] 2735 	add	a, #0x05
   6FAD 47            [ 4] 2736 	ld	b,a
   6FAE DD 7E FB      [19] 2737 	ld	a,-5 (ix)
   6FB1 F5            [11] 2738 	push	af
   6FB2 33            [ 6] 2739 	inc	sp
   6FB3 C5            [11] 2740 	push	bc
   6FB4 33            [ 6] 2741 	inc	sp
   6FB5 2A 45 60      [16] 2742 	ld	hl,(_mapa)
   6FB8 E5            [11] 2743 	push	hl
   6FB9 CD B5 49      [17] 2744 	call	_getTilePtr
   6FBC F1            [10] 2745 	pop	af
   6FBD F1            [10] 2746 	pop	af
   6FBE 4E            [ 7] 2747 	ld	c,(hl)
   6FBF 3E 02         [ 7] 2748 	ld	a,#0x02
   6FC1 91            [ 4] 2749 	sub	a, c
   6FC2 38 61         [12] 2750 	jr	C,00137$
                           2751 ;src/main.c:544: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   6FC4 DD 6E F9      [19] 2752 	ld	l,-7 (ix)
   6FC7 DD 66 FA      [19] 2753 	ld	h,-6 (ix)
   6FCA 7E            [ 7] 2754 	ld	a,(hl)
   6FCB C6 0B         [ 7] 2755 	add	a, #0x0B
   6FCD 57            [ 4] 2756 	ld	d,a
   6FCE DD 6E F7      [19] 2757 	ld	l,-9 (ix)
   6FD1 DD 66 F8      [19] 2758 	ld	h,-8 (ix)
   6FD4 7E            [ 7] 2759 	ld	a,(hl)
   6FD5 C6 05         [ 7] 2760 	add	a, #0x05
   6FD7 47            [ 4] 2761 	ld	b,a
   6FD8 D5            [11] 2762 	push	de
   6FD9 33            [ 6] 2763 	inc	sp
   6FDA C5            [11] 2764 	push	bc
   6FDB 33            [ 6] 2765 	inc	sp
   6FDC 2A 45 60      [16] 2766 	ld	hl,(_mapa)
   6FDF E5            [11] 2767 	push	hl
   6FE0 CD B5 49      [17] 2768 	call	_getTilePtr
   6FE3 F1            [10] 2769 	pop	af
   6FE4 F1            [10] 2770 	pop	af
   6FE5 4E            [ 7] 2771 	ld	c,(hl)
   6FE6 3E 02         [ 7] 2772 	ld	a,#0x02
   6FE8 91            [ 4] 2773 	sub	a, c
   6FE9 38 3A         [12] 2774 	jr	C,00137$
                           2775 ;src/main.c:545: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   6FEB DD 6E F9      [19] 2776 	ld	l,-7 (ix)
   6FEE DD 66 FA      [19] 2777 	ld	h,-6 (ix)
   6FF1 7E            [ 7] 2778 	ld	a,(hl)
   6FF2 C6 16         [ 7] 2779 	add	a, #0x16
   6FF4 57            [ 4] 2780 	ld	d,a
   6FF5 DD 6E F7      [19] 2781 	ld	l,-9 (ix)
   6FF8 DD 66 F8      [19] 2782 	ld	h,-8 (ix)
   6FFB 7E            [ 7] 2783 	ld	a,(hl)
   6FFC C6 05         [ 7] 2784 	add	a, #0x05
   6FFE 47            [ 4] 2785 	ld	b,a
   6FFF D5            [11] 2786 	push	de
   7000 33            [ 6] 2787 	inc	sp
   7001 C5            [11] 2788 	push	bc
   7002 33            [ 6] 2789 	inc	sp
   7003 2A 45 60      [16] 2790 	ld	hl,(_mapa)
   7006 E5            [11] 2791 	push	hl
   7007 CD B5 49      [17] 2792 	call	_getTilePtr
   700A F1            [10] 2793 	pop	af
   700B F1            [10] 2794 	pop	af
   700C 4E            [ 7] 2795 	ld	c,(hl)
   700D 3E 02         [ 7] 2796 	ld	a,#0x02
   700F 91            [ 4] 2797 	sub	a, c
   7010 38 13         [12] 2798 	jr	C,00137$
                           2799 ;src/main.c:546: moverEnemigoDerecha(enemy);
   7012 DD 6E F7      [19] 2800 	ld	l,-9 (ix)
   7015 DD 66 F8      [19] 2801 	ld	h,-8 (ix)
   7018 E5            [11] 2802 	push	hl
   7019 CD E9 68      [17] 2803 	call	_moverEnemigoDerecha
   701C F1            [10] 2804 	pop	af
                           2805 ;src/main.c:547: movX = 1;
   701D DD 36 F5 01   [19] 2806 	ld	-11 (ix),#0x01
                           2807 ;src/main.c:548: mov = 1;
   7021 DD 36 F3 01   [19] 2808 	ld	-13 (ix),#0x01
   7025                    2809 00137$:
                           2810 ;src/main.c:551: if (dy < enemy->y) {
   7025 DD 6E F9      [19] 2811 	ld	l,-7 (ix)
   7028 DD 66 FA      [19] 2812 	ld	h,-6 (ix)
   702B 7E            [ 7] 2813 	ld	a,(hl)
   702C DD 77 FD      [19] 2814 	ld	-3 (ix),a
                           2815 ;src/main.c:480: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   702F DD 6E F7      [19] 2816 	ld	l,-9 (ix)
   7032 DD 66 F8      [19] 2817 	ld	h,-8 (ix)
   7035 7E            [ 7] 2818 	ld	a,(hl)
   7036 DD 77 FC      [19] 2819 	ld	-4 (ix),a
                           2820 ;src/main.c:551: if (dy < enemy->y) {
   7039 DD 7E 07      [19] 2821 	ld	a,7 (ix)
   703C DD 96 FD      [19] 2822 	sub	a, -3 (ix)
   703F D2 D5 70      [10] 2823 	jp	NC,00147$
                           2824 ;src/main.c:552: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   7042 DD 7E FD      [19] 2825 	ld	a,-3 (ix)
   7045 C6 FE         [ 7] 2826 	add	a,#0xFE
   7047 DD 77 FB      [19] 2827 	ld	-5 (ix), a
   704A F5            [11] 2828 	push	af
   704B 33            [ 6] 2829 	inc	sp
   704C DD 7E FC      [19] 2830 	ld	a,-4 (ix)
   704F F5            [11] 2831 	push	af
   7050 33            [ 6] 2832 	inc	sp
   7051 2A 45 60      [16] 2833 	ld	hl,(_mapa)
   7054 E5            [11] 2834 	push	hl
   7055 CD B5 49      [17] 2835 	call	_getTilePtr
   7058 F1            [10] 2836 	pop	af
   7059 F1            [10] 2837 	pop	af
   705A DD 74 FF      [19] 2838 	ld	-1 (ix),h
   705D DD 75 FE      [19] 2839 	ld	-2 (ix), l
   7060 DD 66 FF      [19] 2840 	ld	h,-1 (ix)
   7063 4E            [ 7] 2841 	ld	c,(hl)
   7064 3E 02         [ 7] 2842 	ld	a,#0x02
   7066 91            [ 4] 2843 	sub	a, c
   7067 DA 50 71      [10] 2844 	jp	C,00148$
                           2845 ;src/main.c:553: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   706A DD 6E F9      [19] 2846 	ld	l,-7 (ix)
   706D DD 66 FA      [19] 2847 	ld	h,-6 (ix)
   7070 7E            [ 7] 2848 	ld	a,(hl)
   7071 DD 77 FE      [19] 2849 	ld	-2 (ix), a
   7074 C6 FE         [ 7] 2850 	add	a,#0xFE
   7076 DD 77 FE      [19] 2851 	ld	-2 (ix),a
   7079 DD 6E F7      [19] 2852 	ld	l,-9 (ix)
   707C DD 66 F8      [19] 2853 	ld	h,-8 (ix)
   707F 46            [ 7] 2854 	ld	b,(hl)
   7080 04            [ 4] 2855 	inc	b
   7081 04            [ 4] 2856 	inc	b
   7082 DD 7E FE      [19] 2857 	ld	a,-2 (ix)
   7085 F5            [11] 2858 	push	af
   7086 33            [ 6] 2859 	inc	sp
   7087 C5            [11] 2860 	push	bc
   7088 33            [ 6] 2861 	inc	sp
   7089 2A 45 60      [16] 2862 	ld	hl,(_mapa)
   708C E5            [11] 2863 	push	hl
   708D CD B5 49      [17] 2864 	call	_getTilePtr
   7090 F1            [10] 2865 	pop	af
   7091 F1            [10] 2866 	pop	af
   7092 4E            [ 7] 2867 	ld	c,(hl)
   7093 3E 02         [ 7] 2868 	ld	a,#0x02
   7095 91            [ 4] 2869 	sub	a, c
   7096 DA 50 71      [10] 2870 	jp	C,00148$
                           2871 ;src/main.c:554: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2) {
   7099 DD 6E F9      [19] 2872 	ld	l,-7 (ix)
   709C DD 66 FA      [19] 2873 	ld	h,-6 (ix)
   709F 46            [ 7] 2874 	ld	b,(hl)
   70A0 05            [ 4] 2875 	dec	b
   70A1 05            [ 4] 2876 	dec	b
   70A2 DD 6E F7      [19] 2877 	ld	l,-9 (ix)
   70A5 DD 66 F8      [19] 2878 	ld	h,-8 (ix)
   70A8 7E            [ 7] 2879 	ld	a,(hl)
   70A9 C6 04         [ 7] 2880 	add	a, #0x04
   70AB C5            [11] 2881 	push	bc
   70AC 33            [ 6] 2882 	inc	sp
   70AD F5            [11] 2883 	push	af
   70AE 33            [ 6] 2884 	inc	sp
   70AF 2A 45 60      [16] 2885 	ld	hl,(_mapa)
   70B2 E5            [11] 2886 	push	hl
   70B3 CD B5 49      [17] 2887 	call	_getTilePtr
   70B6 F1            [10] 2888 	pop	af
   70B7 F1            [10] 2889 	pop	af
   70B8 4E            [ 7] 2890 	ld	c,(hl)
   70B9 3E 02         [ 7] 2891 	ld	a,#0x02
   70BB 91            [ 4] 2892 	sub	a, c
   70BC DA 50 71      [10] 2893 	jp	C,00148$
                           2894 ;src/main.c:555: moverEnemigoArriba(enemy);
   70BF DD 6E F7      [19] 2895 	ld	l,-9 (ix)
   70C2 DD 66 F8      [19] 2896 	ld	h,-8 (ix)
   70C5 E5            [11] 2897 	push	hl
   70C6 CD AB 68      [17] 2898 	call	_moverEnemigoArriba
   70C9 F1            [10] 2899 	pop	af
                           2900 ;src/main.c:556: movY = 1;
   70CA DD 36 F4 01   [19] 2901 	ld	-12 (ix),#0x01
                           2902 ;src/main.c:557: mov = 1;
   70CE DD 36 F3 01   [19] 2903 	ld	-13 (ix),#0x01
   70D2 C3 50 71      [10] 2904 	jp	00148$
   70D5                    2905 00147$:
                           2906 ;src/main.c:560: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   70D5 DD 7E FD      [19] 2907 	ld	a,-3 (ix)
   70D8 C6 18         [ 7] 2908 	add	a, #0x18
   70DA 47            [ 4] 2909 	ld	b,a
   70DB C5            [11] 2910 	push	bc
   70DC 33            [ 6] 2911 	inc	sp
   70DD DD 7E FC      [19] 2912 	ld	a,-4 (ix)
   70E0 F5            [11] 2913 	push	af
   70E1 33            [ 6] 2914 	inc	sp
   70E2 2A 45 60      [16] 2915 	ld	hl,(_mapa)
   70E5 E5            [11] 2916 	push	hl
   70E6 CD B5 49      [17] 2917 	call	_getTilePtr
   70E9 F1            [10] 2918 	pop	af
   70EA F1            [10] 2919 	pop	af
   70EB 4E            [ 7] 2920 	ld	c,(hl)
   70EC 3E 02         [ 7] 2921 	ld	a,#0x02
   70EE 91            [ 4] 2922 	sub	a, c
   70EF 38 5F         [12] 2923 	jr	C,00148$
                           2924 ;src/main.c:561: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   70F1 DD 6E F9      [19] 2925 	ld	l,-7 (ix)
   70F4 DD 66 FA      [19] 2926 	ld	h,-6 (ix)
   70F7 7E            [ 7] 2927 	ld	a,(hl)
   70F8 C6 18         [ 7] 2928 	add	a, #0x18
   70FA 57            [ 4] 2929 	ld	d,a
   70FB DD 6E F7      [19] 2930 	ld	l,-9 (ix)
   70FE DD 66 F8      [19] 2931 	ld	h,-8 (ix)
   7101 46            [ 7] 2932 	ld	b,(hl)
   7102 04            [ 4] 2933 	inc	b
   7103 04            [ 4] 2934 	inc	b
   7104 D5            [11] 2935 	push	de
   7105 33            [ 6] 2936 	inc	sp
   7106 C5            [11] 2937 	push	bc
   7107 33            [ 6] 2938 	inc	sp
   7108 2A 45 60      [16] 2939 	ld	hl,(_mapa)
   710B E5            [11] 2940 	push	hl
   710C CD B5 49      [17] 2941 	call	_getTilePtr
   710F F1            [10] 2942 	pop	af
   7110 F1            [10] 2943 	pop	af
   7111 4E            [ 7] 2944 	ld	c,(hl)
   7112 3E 02         [ 7] 2945 	ld	a,#0x02
   7114 91            [ 4] 2946 	sub	a, c
   7115 38 39         [12] 2947 	jr	C,00148$
                           2948 ;src/main.c:562: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2) {
   7117 DD 6E F9      [19] 2949 	ld	l,-7 (ix)
   711A DD 66 FA      [19] 2950 	ld	h,-6 (ix)
   711D 7E            [ 7] 2951 	ld	a,(hl)
   711E C6 18         [ 7] 2952 	add	a, #0x18
   7120 47            [ 4] 2953 	ld	b,a
   7121 DD 6E F7      [19] 2954 	ld	l,-9 (ix)
   7124 DD 66 F8      [19] 2955 	ld	h,-8 (ix)
   7127 7E            [ 7] 2956 	ld	a,(hl)
   7128 C6 04         [ 7] 2957 	add	a, #0x04
   712A C5            [11] 2958 	push	bc
   712B 33            [ 6] 2959 	inc	sp
   712C F5            [11] 2960 	push	af
   712D 33            [ 6] 2961 	inc	sp
   712E 2A 45 60      [16] 2962 	ld	hl,(_mapa)
   7131 E5            [11] 2963 	push	hl
   7132 CD B5 49      [17] 2964 	call	_getTilePtr
   7135 F1            [10] 2965 	pop	af
   7136 F1            [10] 2966 	pop	af
   7137 4E            [ 7] 2967 	ld	c,(hl)
   7138 3E 02         [ 7] 2968 	ld	a,#0x02
   713A 91            [ 4] 2969 	sub	a, c
   713B 38 13         [12] 2970 	jr	C,00148$
                           2971 ;src/main.c:563: moverEnemigoAbajo(enemy);
   713D DD 6E F7      [19] 2972 	ld	l,-9 (ix)
   7140 DD 66 F8      [19] 2973 	ld	h,-8 (ix)
   7143 E5            [11] 2974 	push	hl
   7144 CD CA 68      [17] 2975 	call	_moverEnemigoAbajo
   7147 F1            [10] 2976 	pop	af
                           2977 ;src/main.c:564: movY = 1;
   7148 DD 36 F4 01   [19] 2978 	ld	-12 (ix),#0x01
                           2979 ;src/main.c:565: mov = 1;
   714C DD 36 F3 01   [19] 2980 	ld	-13 (ix),#0x01
   7150                    2981 00148$:
                           2982 ;src/main.c:568: if (!mov) {
   7150 DD 7E F3      [19] 2983 	ld	a,-13 (ix)
   7153 B7            [ 4] 2984 	or	a, a
   7154 C2 72 73      [10] 2985 	jp	NZ,00189$
                           2986 ;src/main.c:569: if (!movX) {
   7157 DD 7E F5      [19] 2987 	ld	a,-11 (ix)
   715A B7            [ 4] 2988 	or	a, a
   715B C2 62 72      [10] 2989 	jp	NZ,00163$
                           2990 ;src/main.c:570: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   715E DD 6E F9      [19] 2991 	ld	l,-7 (ix)
   7161 DD 66 FA      [19] 2992 	ld	h,-6 (ix)
   7164 5E            [ 7] 2993 	ld	e,(hl)
                           2994 ;src/main.c:480: u8 difx = abs(enemy->x - prota.x); // calculo distancia para mantener una dist
   7165 DD 6E F7      [19] 2995 	ld	l,-9 (ix)
   7168 DD 66 F8      [19] 2996 	ld	h,-8 (ix)
   716B 4E            [ 7] 2997 	ld	c,(hl)
                           2998 ;src/main.c:570: if (enemy->y > (ORIGEN_MAPA_Y + ALTO_MAPA/2)) {
   716C 3E 70         [ 7] 2999 	ld	a,#0x70
   716E 93            [ 4] 3000 	sub	a, e
   716F 30 7C         [12] 3001 	jr	NC,00160$
                           3002 ;src/main.c:571: if(*getTilePtr(mapa, enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   7171 7B            [ 4] 3003 	ld	a,e
   7172 C6 18         [ 7] 3004 	add	a, #0x18
   7174 47            [ 4] 3005 	ld	b,a
   7175 C5            [11] 3006 	push	bc
   7176 2A 45 60      [16] 3007 	ld	hl,(_mapa)
   7179 E5            [11] 3008 	push	hl
   717A CD B5 49      [17] 3009 	call	_getTilePtr
   717D F1            [10] 3010 	pop	af
   717E F1            [10] 3011 	pop	af
   717F 4E            [ 7] 3012 	ld	c,(hl)
   7180 3E 02         [ 7] 3013 	ld	a,#0x02
   7182 91            [ 4] 3014 	sub	a, c
   7183 38 5B         [12] 3015 	jr	C,00150$
                           3016 ;src/main.c:572: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   7185 DD 6E F9      [19] 3017 	ld	l,-7 (ix)
   7188 DD 66 FA      [19] 3018 	ld	h,-6 (ix)
   718B 7E            [ 7] 3019 	ld	a,(hl)
   718C C6 18         [ 7] 3020 	add	a, #0x18
   718E 57            [ 4] 3021 	ld	d,a
   718F DD 6E F7      [19] 3022 	ld	l,-9 (ix)
   7192 DD 66 F8      [19] 3023 	ld	h,-8 (ix)
   7195 4E            [ 7] 3024 	ld	c,(hl)
   7196 41            [ 4] 3025 	ld	b,c
   7197 04            [ 4] 3026 	inc	b
   7198 04            [ 4] 3027 	inc	b
   7199 D5            [11] 3028 	push	de
   719A 33            [ 6] 3029 	inc	sp
   719B C5            [11] 3030 	push	bc
   719C 33            [ 6] 3031 	inc	sp
   719D 2A 45 60      [16] 3032 	ld	hl,(_mapa)
   71A0 E5            [11] 3033 	push	hl
   71A1 CD B5 49      [17] 3034 	call	_getTilePtr
   71A4 F1            [10] 3035 	pop	af
   71A5 F1            [10] 3036 	pop	af
   71A6 4E            [ 7] 3037 	ld	c,(hl)
   71A7 3E 02         [ 7] 3038 	ld	a,#0x02
   71A9 91            [ 4] 3039 	sub	a, c
   71AA 38 34         [12] 3040 	jr	C,00150$
                           3041 ;src/main.c:573: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   71AC DD 6E F9      [19] 3042 	ld	l,-7 (ix)
   71AF DD 66 FA      [19] 3043 	ld	h,-6 (ix)
   71B2 7E            [ 7] 3044 	ld	a,(hl)
   71B3 C6 18         [ 7] 3045 	add	a, #0x18
   71B5 47            [ 4] 3046 	ld	b,a
   71B6 DD 6E F7      [19] 3047 	ld	l,-9 (ix)
   71B9 DD 66 F8      [19] 3048 	ld	h,-8 (ix)
   71BC 7E            [ 7] 3049 	ld	a,(hl)
   71BD C6 04         [ 7] 3050 	add	a, #0x04
   71BF C5            [11] 3051 	push	bc
   71C0 33            [ 6] 3052 	inc	sp
   71C1 F5            [11] 3053 	push	af
   71C2 33            [ 6] 3054 	inc	sp
   71C3 2A 45 60      [16] 3055 	ld	hl,(_mapa)
   71C6 E5            [11] 3056 	push	hl
   71C7 CD B5 49      [17] 3057 	call	_getTilePtr
   71CA F1            [10] 3058 	pop	af
   71CB F1            [10] 3059 	pop	af
   71CC 4E            [ 7] 3060 	ld	c,(hl)
   71CD 3E 02         [ 7] 3061 	ld	a,#0x02
   71CF 91            [ 4] 3062 	sub	a, c
   71D0 38 0E         [12] 3063 	jr	C,00150$
                           3064 ;src/main.c:574: moverEnemigoAbajo(enemy);
   71D2 DD 6E F7      [19] 3065 	ld	l,-9 (ix)
   71D5 DD 66 F8      [19] 3066 	ld	h,-8 (ix)
   71D8 E5            [11] 3067 	push	hl
   71D9 CD CA 68      [17] 3068 	call	_moverEnemigoAbajo
   71DC F1            [10] 3069 	pop	af
   71DD C3 62 72      [10] 3070 	jp	00163$
   71E0                    3071 00150$:
                           3072 ;src/main.c:576: moverEnemigoArriba(enemy);
   71E0 DD 6E F7      [19] 3073 	ld	l,-9 (ix)
   71E3 DD 66 F8      [19] 3074 	ld	h,-8 (ix)
   71E6 E5            [11] 3075 	push	hl
   71E7 CD AB 68      [17] 3076 	call	_moverEnemigoArriba
   71EA F1            [10] 3077 	pop	af
   71EB 18 75         [12] 3078 	jr	00163$
   71ED                    3079 00160$:
                           3080 ;src/main.c:578: if(*getTilePtr(mapa, enemy->x, enemy->y - 2) <= 2
   71ED 43            [ 4] 3081 	ld	b,e
   71EE 05            [ 4] 3082 	dec	b
   71EF 05            [ 4] 3083 	dec	b
   71F0 C5            [11] 3084 	push	bc
   71F1 2A 45 60      [16] 3085 	ld	hl,(_mapa)
   71F4 E5            [11] 3086 	push	hl
   71F5 CD B5 49      [17] 3087 	call	_getTilePtr
   71F8 F1            [10] 3088 	pop	af
   71F9 F1            [10] 3089 	pop	af
   71FA 4E            [ 7] 3090 	ld	c,(hl)
   71FB 3E 02         [ 7] 3091 	ld	a,#0x02
   71FD 91            [ 4] 3092 	sub	a, c
   71FE 38 57         [12] 3093 	jr	C,00155$
                           3094 ;src/main.c:579: && *getTilePtr(mapa, enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   7200 DD 6E F9      [19] 3095 	ld	l,-7 (ix)
   7203 DD 66 FA      [19] 3096 	ld	h,-6 (ix)
   7206 56            [ 7] 3097 	ld	d,(hl)
   7207 15            [ 4] 3098 	dec	d
   7208 15            [ 4] 3099 	dec	d
   7209 DD 6E F7      [19] 3100 	ld	l,-9 (ix)
   720C DD 66 F8      [19] 3101 	ld	h,-8 (ix)
   720F 46            [ 7] 3102 	ld	b,(hl)
   7210 04            [ 4] 3103 	inc	b
   7211 04            [ 4] 3104 	inc	b
   7212 D5            [11] 3105 	push	de
   7213 33            [ 6] 3106 	inc	sp
   7214 C5            [11] 3107 	push	bc
   7215 33            [ 6] 3108 	inc	sp
   7216 2A 45 60      [16] 3109 	ld	hl,(_mapa)
   7219 E5            [11] 3110 	push	hl
   721A CD B5 49      [17] 3111 	call	_getTilePtr
   721D F1            [10] 3112 	pop	af
   721E F1            [10] 3113 	pop	af
   721F 4E            [ 7] 3114 	ld	c,(hl)
   7220 3E 02         [ 7] 3115 	ld	a,#0x02
   7222 91            [ 4] 3116 	sub	a, c
   7223 38 32         [12] 3117 	jr	C,00155$
                           3118 ;src/main.c:580: && *getTilePtr(mapa, enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   7225 DD 6E F9      [19] 3119 	ld	l,-7 (ix)
   7228 DD 66 FA      [19] 3120 	ld	h,-6 (ix)
   722B 46            [ 7] 3121 	ld	b,(hl)
   722C 05            [ 4] 3122 	dec	b
   722D 05            [ 4] 3123 	dec	b
   722E DD 6E F7      [19] 3124 	ld	l,-9 (ix)
   7231 DD 66 F8      [19] 3125 	ld	h,-8 (ix)
   7234 7E            [ 7] 3126 	ld	a,(hl)
   7235 C6 04         [ 7] 3127 	add	a, #0x04
   7237 C5            [11] 3128 	push	bc
   7238 33            [ 6] 3129 	inc	sp
   7239 F5            [11] 3130 	push	af
   723A 33            [ 6] 3131 	inc	sp
   723B 2A 45 60      [16] 3132 	ld	hl,(_mapa)
   723E E5            [11] 3133 	push	hl
   723F CD B5 49      [17] 3134 	call	_getTilePtr
   7242 F1            [10] 3135 	pop	af
   7243 F1            [10] 3136 	pop	af
   7244 4E            [ 7] 3137 	ld	c,(hl)
   7245 3E 02         [ 7] 3138 	ld	a,#0x02
   7247 91            [ 4] 3139 	sub	a, c
   7248 38 0D         [12] 3140 	jr	C,00155$
                           3141 ;src/main.c:581: moverEnemigoArriba(enemy);
   724A DD 6E F7      [19] 3142 	ld	l,-9 (ix)
   724D DD 66 F8      [19] 3143 	ld	h,-8 (ix)
   7250 E5            [11] 3144 	push	hl
   7251 CD AB 68      [17] 3145 	call	_moverEnemigoArriba
   7254 F1            [10] 3146 	pop	af
   7255 18 0B         [12] 3147 	jr	00163$
   7257                    3148 00155$:
                           3149 ;src/main.c:583: moverEnemigoAbajo(enemy);
   7257 DD 6E F7      [19] 3150 	ld	l,-9 (ix)
   725A DD 66 F8      [19] 3151 	ld	h,-8 (ix)
   725D E5            [11] 3152 	push	hl
   725E CD CA 68      [17] 3153 	call	_moverEnemigoAbajo
   7261 F1            [10] 3154 	pop	af
   7262                    3155 00163$:
                           3156 ;src/main.c:587: if (!movY) {
   7262 DD 7E F4      [19] 3157 	ld	a,-12 (ix)
   7265 B7            [ 4] 3158 	or	a, a
   7266 C2 72 73      [10] 3159 	jp	NZ,00189$
                           3160 ;src/main.c:588: if (enemy->x < ANCHO_PANTALLA/2) {
   7269 DD 6E F7      [19] 3161 	ld	l,-9 (ix)
   726C DD 66 F8      [19] 3162 	ld	h,-8 (ix)
   726F 4E            [ 7] 3163 	ld	c,(hl)
                           3164 ;src/main.c:481: u8 dify = abs(enemy->y - prota.y);
   7270 DD 6E F9      [19] 3165 	ld	l,-7 (ix)
   7273 DD 66 FA      [19] 3166 	ld	h,-6 (ix)
   7276 5E            [ 7] 3167 	ld	e,(hl)
                           3168 ;src/main.c:588: if (enemy->x < ANCHO_PANTALLA/2) {
   7277 79            [ 4] 3169 	ld	a,c
   7278 D6 28         [ 7] 3170 	sub	a, #0x28
   727A D2 FA 72      [10] 3171 	jp	NC,00175$
                           3172 ;src/main.c:589: if(*getTilePtr(mapa, enemy->x - 1, enemy->y) <= 2
   727D 41            [ 4] 3173 	ld	b,c
   727E 05            [ 4] 3174 	dec	b
   727F 7B            [ 4] 3175 	ld	a,e
   7280 F5            [11] 3176 	push	af
   7281 33            [ 6] 3177 	inc	sp
   7282 C5            [11] 3178 	push	bc
   7283 33            [ 6] 3179 	inc	sp
   7284 2A 45 60      [16] 3180 	ld	hl,(_mapa)
   7287 E5            [11] 3181 	push	hl
   7288 CD B5 49      [17] 3182 	call	_getTilePtr
   728B F1            [10] 3183 	pop	af
   728C F1            [10] 3184 	pop	af
   728D 4E            [ 7] 3185 	ld	c,(hl)
   728E 3E 02         [ 7] 3186 	ld	a,#0x02
   7290 91            [ 4] 3187 	sub	a, c
   7291 38 5A         [12] 3188 	jr	C,00165$
                           3189 ;src/main.c:590: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   7293 DD 6E F9      [19] 3190 	ld	l,-7 (ix)
   7296 DD 66 FA      [19] 3191 	ld	h,-6 (ix)
   7299 7E            [ 7] 3192 	ld	a,(hl)
   729A C6 0B         [ 7] 3193 	add	a, #0x0B
   729C 4F            [ 4] 3194 	ld	c,a
   729D DD 6E F7      [19] 3195 	ld	l,-9 (ix)
   72A0 DD 66 F8      [19] 3196 	ld	h,-8 (ix)
   72A3 46            [ 7] 3197 	ld	b,(hl)
   72A4 05            [ 4] 3198 	dec	b
   72A5 79            [ 4] 3199 	ld	a,c
   72A6 F5            [11] 3200 	push	af
   72A7 33            [ 6] 3201 	inc	sp
   72A8 C5            [11] 3202 	push	bc
   72A9 33            [ 6] 3203 	inc	sp
   72AA 2A 45 60      [16] 3204 	ld	hl,(_mapa)
   72AD E5            [11] 3205 	push	hl
   72AE CD B5 49      [17] 3206 	call	_getTilePtr
   72B1 F1            [10] 3207 	pop	af
   72B2 F1            [10] 3208 	pop	af
   72B3 4E            [ 7] 3209 	ld	c,(hl)
   72B4 3E 02         [ 7] 3210 	ld	a,#0x02
   72B6 91            [ 4] 3211 	sub	a, c
   72B7 38 34         [12] 3212 	jr	C,00165$
                           3213 ;src/main.c:591: && *getTilePtr(mapa, enemy->x - 1, enemy->y + G_ENEMY_H) <= 2) {
   72B9 DD 6E F9      [19] 3214 	ld	l,-7 (ix)
   72BC DD 66 FA      [19] 3215 	ld	h,-6 (ix)
   72BF 7E            [ 7] 3216 	ld	a,(hl)
   72C0 C6 16         [ 7] 3217 	add	a, #0x16
   72C2 4F            [ 4] 3218 	ld	c,a
   72C3 DD 6E F7      [19] 3219 	ld	l,-9 (ix)
   72C6 DD 66 F8      [19] 3220 	ld	h,-8 (ix)
   72C9 46            [ 7] 3221 	ld	b,(hl)
   72CA 05            [ 4] 3222 	dec	b
   72CB 79            [ 4] 3223 	ld	a,c
   72CC F5            [11] 3224 	push	af
   72CD 33            [ 6] 3225 	inc	sp
   72CE C5            [11] 3226 	push	bc
   72CF 33            [ 6] 3227 	inc	sp
   72D0 2A 45 60      [16] 3228 	ld	hl,(_mapa)
   72D3 E5            [11] 3229 	push	hl
   72D4 CD B5 49      [17] 3230 	call	_getTilePtr
   72D7 F1            [10] 3231 	pop	af
   72D8 F1            [10] 3232 	pop	af
   72D9 4E            [ 7] 3233 	ld	c,(hl)
   72DA 3E 02         [ 7] 3234 	ld	a,#0x02
   72DC 91            [ 4] 3235 	sub	a, c
   72DD 38 0E         [12] 3236 	jr	C,00165$
                           3237 ;src/main.c:592: moverEnemigoIzquierda(enemy);
   72DF DD 6E F7      [19] 3238 	ld	l,-9 (ix)
   72E2 DD 66 F8      [19] 3239 	ld	h,-8 (ix)
   72E5 E5            [11] 3240 	push	hl
   72E6 CD F9 68      [17] 3241 	call	_moverEnemigoIzquierda
   72E9 F1            [10] 3242 	pop	af
   72EA C3 72 73      [10] 3243 	jp	00189$
   72ED                    3244 00165$:
                           3245 ;src/main.c:594: moverEnemigoDerecha(enemy);
   72ED DD 6E F7      [19] 3246 	ld	l,-9 (ix)
   72F0 DD 66 F8      [19] 3247 	ld	h,-8 (ix)
   72F3 E5            [11] 3248 	push	hl
   72F4 CD E9 68      [17] 3249 	call	_moverEnemigoDerecha
   72F7 F1            [10] 3250 	pop	af
   72F8 18 78         [12] 3251 	jr	00189$
   72FA                    3252 00175$:
                           3253 ;src/main.c:597: if(*getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   72FA 79            [ 4] 3254 	ld	a,c
   72FB C6 05         [ 7] 3255 	add	a, #0x05
   72FD 47            [ 4] 3256 	ld	b,a
   72FE 7B            [ 4] 3257 	ld	a,e
   72FF F5            [11] 3258 	push	af
   7300 33            [ 6] 3259 	inc	sp
   7301 C5            [11] 3260 	push	bc
   7302 33            [ 6] 3261 	inc	sp
   7303 2A 45 60      [16] 3262 	ld	hl,(_mapa)
   7306 E5            [11] 3263 	push	hl
   7307 CD B5 49      [17] 3264 	call	_getTilePtr
   730A F1            [10] 3265 	pop	af
   730B F1            [10] 3266 	pop	af
   730C 4E            [ 7] 3267 	ld	c,(hl)
   730D 3E 02         [ 7] 3268 	ld	a,#0x02
   730F 91            [ 4] 3269 	sub	a, c
   7310 38 55         [12] 3270 	jr	C,00170$
                           3271 ;src/main.c:598: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   7312 DD 6E F9      [19] 3272 	ld	l,-7 (ix)
   7315 DD 66 FA      [19] 3273 	ld	h,-6 (ix)
   7318 7E            [ 7] 3274 	ld	a,(hl)
   7319 C6 0B         [ 7] 3275 	add	a, #0x0B
   731B 47            [ 4] 3276 	ld	b,a
   731C DD 6E F7      [19] 3277 	ld	l,-9 (ix)
   731F DD 66 F8      [19] 3278 	ld	h,-8 (ix)
   7322 7E            [ 7] 3279 	ld	a,(hl)
   7323 C6 05         [ 7] 3280 	add	a, #0x05
   7325 4F            [ 4] 3281 	ld	c,a
   7326 C5            [11] 3282 	push	bc
   7327 2A 45 60      [16] 3283 	ld	hl,(_mapa)
   732A E5            [11] 3284 	push	hl
   732B CD B5 49      [17] 3285 	call	_getTilePtr
   732E F1            [10] 3286 	pop	af
   732F F1            [10] 3287 	pop	af
   7330 4E            [ 7] 3288 	ld	c,(hl)
   7331 3E 02         [ 7] 3289 	ld	a,#0x02
   7333 91            [ 4] 3290 	sub	a, c
   7334 38 31         [12] 3291 	jr	C,00170$
                           3292 ;src/main.c:599: && *getTilePtr(mapa, enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2) {
   7336 DD 6E F9      [19] 3293 	ld	l,-7 (ix)
   7339 DD 66 FA      [19] 3294 	ld	h,-6 (ix)
   733C 7E            [ 7] 3295 	ld	a,(hl)
   733D C6 16         [ 7] 3296 	add	a, #0x16
   733F 47            [ 4] 3297 	ld	b,a
   7340 DD 6E F7      [19] 3298 	ld	l,-9 (ix)
   7343 DD 66 F8      [19] 3299 	ld	h,-8 (ix)
   7346 7E            [ 7] 3300 	ld	a,(hl)
   7347 C6 05         [ 7] 3301 	add	a, #0x05
   7349 4F            [ 4] 3302 	ld	c,a
   734A C5            [11] 3303 	push	bc
   734B 2A 45 60      [16] 3304 	ld	hl,(_mapa)
   734E E5            [11] 3305 	push	hl
   734F CD B5 49      [17] 3306 	call	_getTilePtr
   7352 F1            [10] 3307 	pop	af
   7353 F1            [10] 3308 	pop	af
   7354 4E            [ 7] 3309 	ld	c,(hl)
   7355 3E 02         [ 7] 3310 	ld	a,#0x02
   7357 91            [ 4] 3311 	sub	a, c
   7358 38 0D         [12] 3312 	jr	C,00170$
                           3313 ;src/main.c:600: moverEnemigoDerecha(enemy);
   735A DD 6E F7      [19] 3314 	ld	l,-9 (ix)
   735D DD 66 F8      [19] 3315 	ld	h,-8 (ix)
   7360 E5            [11] 3316 	push	hl
   7361 CD E9 68      [17] 3317 	call	_moverEnemigoDerecha
   7364 F1            [10] 3318 	pop	af
   7365 18 0B         [12] 3319 	jr	00189$
   7367                    3320 00170$:
                           3321 ;src/main.c:603: moverEnemigoIzquierda(enemy);
   7367 DD 6E F7      [19] 3322 	ld	l,-9 (ix)
   736A DD 66 F8      [19] 3323 	ld	h,-8 (ix)
   736D E5            [11] 3324 	push	hl
   736E CD F9 68      [17] 3325 	call	_moverEnemigoIzquierda
   7371 F1            [10] 3326 	pop	af
   7372                    3327 00189$:
   7372 DD F9         [10] 3328 	ld	sp, ix
   7374 DD E1         [14] 3329 	pop	ix
   7376 C9            [10] 3330 	ret
                           3331 ;src/main.c:612: void updateEnemies() { // maquina de estados
                           3332 ;	---------------------------------
                           3333 ; Function updateEnemies
                           3334 ; ---------------------------------
   7377                    3335 _updateEnemies::
   7377 DD E5         [15] 3336 	push	ix
   7379 DD 21 00 00   [14] 3337 	ld	ix,#0
   737D DD 39         [15] 3338 	add	ix,sp
   737F 21 F3 FF      [10] 3339 	ld	hl,#-13
   7382 39            [11] 3340 	add	hl,sp
   7383 F9            [ 6] 3341 	ld	sp,hl
                           3342 ;src/main.c:618: actual = enemy;
                           3343 ;src/main.c:619: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   7384 21 18 5A      [10] 3344 	ld	hl,#0x5A18
   7387 E5            [11] 3345 	push	hl
   7388 21 00 C0      [10] 3346 	ld	hl,#0xC000
   738B E5            [11] 3347 	push	hl
   738C CD 9E 5E      [17] 3348 	call	_cpct_getScreenPtr
                           3349 ;src/main.c:622: while(i) {
   738F DD 36 F3 02   [19] 3350 	ld	-13 (ix),#0x02
   7393 11 F9 5E      [10] 3351 	ld	de,#_enemy
   7396                    3352 00119$:
   7396 DD 7E F3      [19] 3353 	ld	a,-13 (ix)
   7399 B7            [ 4] 3354 	or	a, a
   739A CA 01 75      [10] 3355 	jp	Z,00122$
                           3356 ;src/main.c:623: --i;
   739D DD 35 F3      [23] 3357 	dec	-13 (ix)
                           3358 ;src/main.c:624: if (actual->engage) { // prioridad a la persecucion, nunca te deja
   73A0 21 16 00      [10] 3359 	ld	hl,#0x0016
   73A3 19            [11] 3360 	add	hl,de
   73A4 DD 75 FE      [19] 3361 	ld	-2 (ix),l
   73A7 DD 74 FF      [19] 3362 	ld	-1 (ix),h
   73AA DD 6E FE      [19] 3363 	ld	l,-2 (ix)
   73AD DD 66 FF      [19] 3364 	ld	h,-1 (ix)
   73B0 7E            [ 7] 3365 	ld	a,(hl)
   73B1 B7            [ 4] 3366 	or	a, a
   73B2 28 16         [12] 3367 	jr	Z,00117$
                           3368 ;src/main.c:625: engage(actual, prota.x, prota.y);
   73B4 3A 6A 5F      [13] 3369 	ld	a, (#(_prota + 0x0001) + 0)
   73B7 21 69 5F      [10] 3370 	ld	hl, #_prota + 0
   73BA 46            [ 7] 3371 	ld	b,(hl)
   73BB D5            [11] 3372 	push	de
   73BC F5            [11] 3373 	push	af
   73BD 33            [ 6] 3374 	inc	sp
   73BE C5            [11] 3375 	push	bc
   73BF 33            [ 6] 3376 	inc	sp
   73C0 D5            [11] 3377 	push	de
   73C1 CD 81 6C      [17] 3378 	call	_engage
   73C4 F1            [10] 3379 	pop	af
   73C5 F1            [10] 3380 	pop	af
   73C6 D1            [10] 3381 	pop	de
   73C7 C3 F9 74      [10] 3382 	jp	00118$
   73CA                    3383 00117$:
                           3384 ;src/main.c:627: lookFor(actual); // actualiza si el enemigo tiene el prota al alcance o lo ha visto
   73CA D5            [11] 3385 	push	de
   73CB D5            [11] 3386 	push	de
   73CC CD 29 6C      [17] 3387 	call	_lookFor
   73CF F1            [10] 3388 	pop	af
   73D0 D1            [10] 3389 	pop	de
                           3390 ;src/main.c:628: if (actual->patrolling) { // esta patrullando
   73D1 21 0B 00      [10] 3391 	ld	hl,#0x000B
   73D4 19            [11] 3392 	add	hl,de
   73D5 DD 75 FC      [19] 3393 	ld	-4 (ix),l
   73D8 DD 74 FD      [19] 3394 	ld	-3 (ix),h
   73DB DD 6E FC      [19] 3395 	ld	l,-4 (ix)
   73DE DD 66 FD      [19] 3396 	ld	h,-3 (ix)
   73E1 6E            [ 7] 3397 	ld	l,(hl)
                           3398 ;src/main.c:630: if (actual->inRange) {
   73E2 7B            [ 4] 3399 	ld	a,e
   73E3 C6 11         [ 7] 3400 	add	a, #0x11
   73E5 4F            [ 4] 3401 	ld	c,a
   73E6 7A            [ 4] 3402 	ld	a,d
   73E7 CE 00         [ 7] 3403 	adc	a, #0x00
   73E9 47            [ 4] 3404 	ld	b,a
                           3405 ;src/main.c:639: actual->seek = 1;
   73EA 7B            [ 4] 3406 	ld	a,e
   73EB C6 14         [ 7] 3407 	add	a, #0x14
   73ED DD 77 FA      [19] 3408 	ld	-6 (ix),a
   73F0 7A            [ 4] 3409 	ld	a,d
   73F1 CE 00         [ 7] 3410 	adc	a, #0x00
   73F3 DD 77 FB      [19] 3411 	ld	-5 (ix),a
                           3412 ;src/main.c:628: if (actual->patrolling) { // esta patrullando
   73F6 7D            [ 4] 3413 	ld	a,l
   73F7 B7            [ 4] 3414 	or	a, a
   73F8 CA BE 74      [10] 3415 	jp	Z,00114$
                           3416 ;src/main.c:629: moverEnemigoPatrol(actual);
   73FB C5            [11] 3417 	push	bc
   73FC D5            [11] 3418 	push	de
   73FD D5            [11] 3419 	push	de
   73FE CD 0B 69      [17] 3420 	call	_moverEnemigoPatrol
   7401 F1            [10] 3421 	pop	af
   7402 D1            [10] 3422 	pop	de
   7403 C1            [10] 3423 	pop	bc
                           3424 ;src/main.c:630: if (actual->inRange) {
   7404 0A            [ 7] 3425 	ld	a,(bc)
   7405 B7            [ 4] 3426 	or	a, a
   7406 28 26         [12] 3427 	jr	Z,00104$
                           3428 ;src/main.c:631: engage(actual, prota.x, prota.y);
   7408 21 6A 5F      [10] 3429 	ld	hl, #(_prota + 0x0001) + 0
   740B 46            [ 7] 3430 	ld	b,(hl)
   740C 3A 69 5F      [13] 3431 	ld	a, (#_prota + 0)
   740F D5            [11] 3432 	push	de
   7410 C5            [11] 3433 	push	bc
   7411 33            [ 6] 3434 	inc	sp
   7412 F5            [11] 3435 	push	af
   7413 33            [ 6] 3436 	inc	sp
   7414 D5            [11] 3437 	push	de
   7415 CD 81 6C      [17] 3438 	call	_engage
   7418 F1            [10] 3439 	pop	af
   7419 F1            [10] 3440 	pop	af
   741A D1            [10] 3441 	pop	de
                           3442 ;src/main.c:632: actual->patrolling = 0;
   741B DD 6E FC      [19] 3443 	ld	l,-4 (ix)
   741E DD 66 FD      [19] 3444 	ld	h,-3 (ix)
   7421 36 00         [10] 3445 	ld	(hl),#0x00
                           3446 ;src/main.c:633: actual->engage = 1;
   7423 DD 6E FE      [19] 3447 	ld	l,-2 (ix)
   7426 DD 66 FF      [19] 3448 	ld	h,-1 (ix)
   7429 36 01         [10] 3449 	ld	(hl),#0x01
   742B C3 F9 74      [10] 3450 	jp	00118$
   742E                    3451 00104$:
                           3452 ;src/main.c:634: } else if (actual->seen) {
   742E 21 12 00      [10] 3453 	ld	hl,#0x0012
   7431 19            [11] 3454 	add	hl,de
   7432 DD 75 F8      [19] 3455 	ld	-8 (ix),l
   7435 DD 74 F9      [19] 3456 	ld	-7 (ix),h
   7438 DD 6E F8      [19] 3457 	ld	l,-8 (ix)
   743B DD 66 F9      [19] 3458 	ld	h,-7 (ix)
   743E 7E            [ 7] 3459 	ld	a,(hl)
   743F B7            [ 4] 3460 	or	a, a
   7440 CA F9 74      [10] 3461 	jp	Z,00118$
                           3462 ;src/main.c:636: pathFinding(actual->x, actual->y, prota.x, prota.y, actual, mapa);
   7443 3A 6A 5F      [13] 3463 	ld	a,(#(_prota + 0x0001) + 0)
   7446 DD 77 F7      [19] 3464 	ld	-9 (ix),a
   7449 21 69 5F      [10] 3465 	ld	hl, #_prota + 0
   744C 4E            [ 7] 3466 	ld	c,(hl)
   744D 21 01 00      [10] 3467 	ld	hl,#0x0001
   7450 19            [11] 3468 	add	hl,de
   7451 DD 75 F5      [19] 3469 	ld	-11 (ix),l
   7454 DD 74 F6      [19] 3470 	ld	-10 (ix),h
   7457 DD 6E F5      [19] 3471 	ld	l,-11 (ix)
   745A DD 66 F6      [19] 3472 	ld	h,-10 (ix)
   745D 46            [ 7] 3473 	ld	b,(hl)
   745E 1A            [ 7] 3474 	ld	a,(de)
   745F DD 77 F4      [19] 3475 	ld	-12 (ix),a
   7462 D5            [11] 3476 	push	de
   7463 2A 45 60      [16] 3477 	ld	hl,(_mapa)
   7466 E5            [11] 3478 	push	hl
   7467 D5            [11] 3479 	push	de
   7468 DD 7E F7      [19] 3480 	ld	a,-9 (ix)
   746B F5            [11] 3481 	push	af
   746C 33            [ 6] 3482 	inc	sp
   746D 79            [ 4] 3483 	ld	a,c
   746E F5            [11] 3484 	push	af
   746F 33            [ 6] 3485 	inc	sp
   7470 C5            [11] 3486 	push	bc
   7471 33            [ 6] 3487 	inc	sp
   7472 DD 7E F4      [19] 3488 	ld	a,-12 (ix)
   7475 F5            [11] 3489 	push	af
   7476 33            [ 6] 3490 	inc	sp
   7477 CD 27 48      [17] 3491 	call	_pathFinding
   747A 21 08 00      [10] 3492 	ld	hl,#8
   747D 39            [11] 3493 	add	hl,sp
   747E F9            [ 6] 3494 	ld	sp,hl
   747F D1            [10] 3495 	pop	de
                           3496 ;src/main.c:637: actual->p_seek_x = actual->x;
   7480 21 17 00      [10] 3497 	ld	hl,#0x0017
   7483 19            [11] 3498 	add	hl,de
   7484 4D            [ 4] 3499 	ld	c,l
   7485 44            [ 4] 3500 	ld	b,h
   7486 1A            [ 7] 3501 	ld	a,(de)
   7487 02            [ 7] 3502 	ld	(bc),a
                           3503 ;src/main.c:638: actual->p_seek_y = actual->y;
   7488 21 18 00      [10] 3504 	ld	hl,#0x0018
   748B 19            [11] 3505 	add	hl,de
   748C 4D            [ 4] 3506 	ld	c,l
   748D 44            [ 4] 3507 	ld	b,h
   748E DD 6E F5      [19] 3508 	ld	l,-11 (ix)
   7491 DD 66 F6      [19] 3509 	ld	h,-10 (ix)
   7494 7E            [ 7] 3510 	ld	a,(hl)
   7495 02            [ 7] 3511 	ld	(bc),a
                           3512 ;src/main.c:639: actual->seek = 1;
   7496 DD 6E FA      [19] 3513 	ld	l,-6 (ix)
   7499 DD 66 FB      [19] 3514 	ld	h,-5 (ix)
   749C 36 01         [10] 3515 	ld	(hl),#0x01
                           3516 ;src/main.c:640: actual->iter=0;
   749E 21 0E 00      [10] 3517 	ld	hl,#0x000E
   74A1 19            [11] 3518 	add	hl,de
   74A2 AF            [ 4] 3519 	xor	a, a
   74A3 77            [ 7] 3520 	ld	(hl), a
   74A4 23            [ 6] 3521 	inc	hl
   74A5 77            [ 7] 3522 	ld	(hl), a
                           3523 ;src/main.c:641: actual->reversePatrol = NO;
   74A6 21 0C 00      [10] 3524 	ld	hl,#0x000C
   74A9 19            [11] 3525 	add	hl,de
   74AA 36 00         [10] 3526 	ld	(hl),#0x00
                           3527 ;src/main.c:642: actual->patrolling = 0;
   74AC DD 6E FC      [19] 3528 	ld	l,-4 (ix)
   74AF DD 66 FD      [19] 3529 	ld	h,-3 (ix)
   74B2 36 00         [10] 3530 	ld	(hl),#0x00
                           3531 ;src/main.c:643: actual->seen = 0;
   74B4 DD 6E F8      [19] 3532 	ld	l,-8 (ix)
   74B7 DD 66 F9      [19] 3533 	ld	h,-7 (ix)
   74BA 36 00         [10] 3534 	ld	(hl),#0x00
   74BC 18 3B         [12] 3535 	jr	00118$
   74BE                    3536 00114$:
                           3537 ;src/main.c:645: } else if (actual->seek) {
   74BE DD 6E FA      [19] 3538 	ld	l,-6 (ix)
   74C1 DD 66 FB      [19] 3539 	ld	h,-5 (ix)
   74C4 7E            [ 7] 3540 	ld	a,(hl)
   74C5 B7            [ 4] 3541 	or	a, a
   74C6 28 31         [12] 3542 	jr	Z,00118$
                           3543 ;src/main.c:647: if (!actual->found /*&& actual->seekTimer <= 5*/) {
   74C8 D5            [11] 3544 	push	de
   74C9 FD E1         [14] 3545 	pop	iy
   74CB FD 7E 13      [19] 3546 	ld	a,19 (iy)
   74CE B7            [ 4] 3547 	or	a, a
   74CF 20 09         [12] 3548 	jr	NZ,00109$
                           3549 ;src/main.c:648: moverEnemigoSeek(actual); // buscar en posiciones cercanas a la actual
   74D1 D5            [11] 3550 	push	de
   74D2 D5            [11] 3551 	push	de
   74D3 CD 21 6B      [17] 3552 	call	_moverEnemigoSeek
   74D6 F1            [10] 3553 	pop	af
   74D7 D1            [10] 3554 	pop	de
   74D8 18 1F         [12] 3555 	jr	00118$
   74DA                    3556 00109$:
                           3557 ;src/main.c:649: } else if (actual->inRange) {
   74DA 0A            [ 7] 3558 	ld	a,(bc)
   74DB B7            [ 4] 3559 	or	a, a
   74DC 28 1B         [12] 3560 	jr	Z,00118$
                           3561 ;src/main.c:650: engage(actual, prota.x, prota.y);
   74DE 21 6A 5F      [10] 3562 	ld	hl, #(_prota + 0x0001) + 0
   74E1 46            [ 7] 3563 	ld	b,(hl)
   74E2 3A 69 5F      [13] 3564 	ld	a, (#_prota + 0)
   74E5 D5            [11] 3565 	push	de
   74E6 C5            [11] 3566 	push	bc
   74E7 33            [ 6] 3567 	inc	sp
   74E8 F5            [11] 3568 	push	af
   74E9 33            [ 6] 3569 	inc	sp
   74EA D5            [11] 3570 	push	de
   74EB CD 81 6C      [17] 3571 	call	_engage
   74EE F1            [10] 3572 	pop	af
   74EF F1            [10] 3573 	pop	af
   74F0 D1            [10] 3574 	pop	de
                           3575 ;src/main.c:651: actual->engage = 1;
   74F1 DD 6E FE      [19] 3576 	ld	l,-2 (ix)
   74F4 DD 66 FF      [19] 3577 	ld	h,-1 (ix)
   74F7 36 01         [10] 3578 	ld	(hl),#0x01
   74F9                    3579 00118$:
                           3580 ;src/main.c:655: actual++;
   74F9 21 1C 00      [10] 3581 	ld	hl,#0x001C
   74FC 19            [11] 3582 	add	hl,de
   74FD EB            [ 4] 3583 	ex	de,hl
   74FE C3 96 73      [10] 3584 	jp	00119$
   7501                    3585 00122$:
   7501 DD F9         [10] 3586 	ld	sp, ix
   7503 DD E1         [14] 3587 	pop	ix
   7505 C9            [10] 3588 	ret
                           3589 ;src/main.c:659: void inicializarEnemy() {
                           3590 ;	---------------------------------
                           3591 ; Function inicializarEnemy
                           3592 ; ---------------------------------
   7506                    3593 _inicializarEnemy::
   7506 DD E5         [15] 3594 	push	ix
   7508 DD 21 00 00   [14] 3595 	ld	ix,#0
   750C DD 39         [15] 3596 	add	ix,sp
   750E F5            [11] 3597 	push	af
   750F F5            [11] 3598 	push	af
                           3599 ;src/main.c:670: actual = enemy;
   7510 01 F9 5E      [10] 3600 	ld	bc,#_enemy+0
                           3601 ;src/main.c:671: while(i){
   7513 DD 36 FC 02   [19] 3602 	ld	-4 (ix),#0x02
   7517                    3603 00103$:
   7517 DD 7E FC      [19] 3604 	ld	a,-4 (ix)
   751A B7            [ 4] 3605 	or	a, a
   751B CA FF 75      [10] 3606 	jp	Z,00106$
                           3607 ;src/main.c:672: --i;
   751E DD 35 FC      [23] 3608 	dec	-4 (ix)
                           3609 ;src/main.c:673: actual->x = actual->px = spawnX[i];
   7521 59            [ 4] 3610 	ld	e, c
   7522 50            [ 4] 3611 	ld	d, b
   7523 13            [ 6] 3612 	inc	de
   7524 13            [ 6] 3613 	inc	de
   7525 3E 6B         [ 7] 3614 	ld	a,#<(_spawnX)
   7527 DD 86 FC      [19] 3615 	add	a, -4 (ix)
   752A 6F            [ 4] 3616 	ld	l,a
   752B 3E 60         [ 7] 3617 	ld	a,#>(_spawnX)
   752D CE 00         [ 7] 3618 	adc	a, #0x00
   752F 67            [ 4] 3619 	ld	h,a
   7530 7E            [ 7] 3620 	ld	a,(hl)
   7531 DD 77 FD      [19] 3621 	ld	-3 (ix), a
   7534 12            [ 7] 3622 	ld	(de),a
   7535 DD 7E FD      [19] 3623 	ld	a,-3 (ix)
   7538 02            [ 7] 3624 	ld	(bc),a
                           3625 ;src/main.c:674: actual->y = actual->py = spawnY[i];
   7539 C5            [11] 3626 	push	bc
   753A FD E1         [14] 3627 	pop	iy
   753C FD 23         [10] 3628 	inc	iy
   753E 59            [ 4] 3629 	ld	e, c
   753F 50            [ 4] 3630 	ld	d, b
   7540 13            [ 6] 3631 	inc	de
   7541 13            [ 6] 3632 	inc	de
   7542 13            [ 6] 3633 	inc	de
   7543 3E 6F         [ 7] 3634 	ld	a,#<(_spawnY)
   7545 DD 86 FC      [19] 3635 	add	a, -4 (ix)
   7548 6F            [ 4] 3636 	ld	l,a
   7549 3E 60         [ 7] 3637 	ld	a,#>(_spawnY)
   754B CE 00         [ 7] 3638 	adc	a, #0x00
   754D 67            [ 4] 3639 	ld	h,a
   754E 7E            [ 7] 3640 	ld	a,(hl)
   754F DD 77 FF      [19] 3641 	ld	-1 (ix), a
   7552 12            [ 7] 3642 	ld	(de),a
   7553 DD 7E FF      [19] 3643 	ld	a,-1 (ix)
   7556 FD 77 00      [19] 3644 	ld	0 (iy), a
                           3645 ;src/main.c:675: actual->mover  = NO;
   7559 21 06 00      [10] 3646 	ld	hl,#0x0006
   755C 09            [11] 3647 	add	hl,bc
   755D 36 00         [10] 3648 	ld	(hl),#0x00
                           3649 ;src/main.c:676: actual->mira   = M_abajo;
   755F 21 07 00      [10] 3650 	ld	hl,#0x0007
   7562 09            [11] 3651 	add	hl,bc
   7563 36 03         [10] 3652 	ld	(hl),#0x03
                           3653 ;src/main.c:677: actual->sprite = g_enemy;
   7565 21 04 00      [10] 3654 	ld	hl,#0x0004
   7568 09            [11] 3655 	add	hl,bc
   7569 36 3A         [10] 3656 	ld	(hl),#<(_g_enemy)
   756B 23            [ 6] 3657 	inc	hl
   756C 36 3C         [10] 3658 	ld	(hl),#>(_g_enemy)
                           3659 ;src/main.c:678: actual->muerto = NO;
   756E 21 08 00      [10] 3660 	ld	hl,#0x0008
   7571 09            [11] 3661 	add	hl,bc
   7572 36 00         [10] 3662 	ld	(hl),#0x00
                           3663 ;src/main.c:679: actual->muertes = 0;
   7574 21 0A 00      [10] 3664 	ld	hl,#0x000A
   7577 09            [11] 3665 	add	hl,bc
   7578 36 00         [10] 3666 	ld	(hl),#0x00
                           3667 ;src/main.c:680: actual->patrolling = SI;
   757A 21 0B 00      [10] 3668 	ld	hl,#0x000B
   757D 09            [11] 3669 	add	hl,bc
   757E 36 01         [10] 3670 	ld	(hl),#0x01
                           3671 ;src/main.c:681: actual->reversePatrol = NO;
   7580 21 0C 00      [10] 3672 	ld	hl,#0x000C
   7583 09            [11] 3673 	add	hl,bc
   7584 36 00         [10] 3674 	ld	(hl),#0x00
                           3675 ;src/main.c:682: actual->iter = 0;
   7586 21 0E 00      [10] 3676 	ld	hl,#0x000E
   7589 09            [11] 3677 	add	hl,bc
   758A AF            [ 4] 3678 	xor	a, a
   758B 77            [ 7] 3679 	ld	(hl), a
   758C 23            [ 6] 3680 	inc	hl
   758D 77            [ 7] 3681 	ld	(hl), a
                           3682 ;src/main.c:683: actual->lastIter = 0;
   758E 21 10 00      [10] 3683 	ld	hl,#0x0010
   7591 09            [11] 3684 	add	hl,bc
   7592 36 00         [10] 3685 	ld	(hl),#0x00
                           3686 ;src/main.c:684: actual->seen = 0;
   7594 21 12 00      [10] 3687 	ld	hl,#0x0012
   7597 09            [11] 3688 	add	hl,bc
   7598 36 00         [10] 3689 	ld	(hl),#0x00
                           3690 ;src/main.c:685: actual->found = 0;
   759A 21 13 00      [10] 3691 	ld	hl,#0x0013
   759D 09            [11] 3692 	add	hl,bc
   759E 36 00         [10] 3693 	ld	(hl),#0x00
                           3694 ;src/main.c:686: pathFinding(actual->x, actual->y, patrolX[num_mapa + 1][i], patrolY[num_mapa + 1][i], actual, mapa); // calculo rutas de patrulla
   75A0 21 47 60      [10] 3695 	ld	hl,#_num_mapa + 0
   75A3 5E            [ 7] 3696 	ld	e, (hl)
   75A4 1C            [ 4] 3697 	inc	e
   75A5 16 00         [ 7] 3698 	ld	d,#0x00
   75A7 6B            [ 4] 3699 	ld	l, e
   75A8 62            [ 4] 3700 	ld	h, d
   75A9 29            [11] 3701 	add	hl, hl
   75AA 29            [11] 3702 	add	hl, hl
   75AB 19            [11] 3703 	add	hl, de
   75AC EB            [ 4] 3704 	ex	de,hl
   75AD 21 87 60      [10] 3705 	ld	hl,#_patrolY
   75B0 19            [11] 3706 	add	hl,de
   75B1 DD 7E FC      [19] 3707 	ld	a,-4 (ix)
   75B4 85            [ 4] 3708 	add	a, l
   75B5 6F            [ 4] 3709 	ld	l,a
   75B6 3E 00         [ 7] 3710 	ld	a,#0x00
   75B8 8C            [ 4] 3711 	adc	a, h
   75B9 67            [ 4] 3712 	ld	h,a
   75BA 7E            [ 7] 3713 	ld	a,(hl)
   75BB DD 77 FE      [19] 3714 	ld	-2 (ix),a
   75BE 21 73 60      [10] 3715 	ld	hl,#_patrolX
   75C1 19            [11] 3716 	add	hl,de
   75C2 DD 5E FC      [19] 3717 	ld	e,-4 (ix)
   75C5 16 00         [ 7] 3718 	ld	d,#0x00
   75C7 19            [11] 3719 	add	hl,de
   75C8 56            [ 7] 3720 	ld	d,(hl)
   75C9 C5            [11] 3721 	push	bc
   75CA 2A 45 60      [16] 3722 	ld	hl,(_mapa)
   75CD E5            [11] 3723 	push	hl
   75CE C5            [11] 3724 	push	bc
   75CF DD 7E FE      [19] 3725 	ld	a,-2 (ix)
   75D2 F5            [11] 3726 	push	af
   75D3 33            [ 6] 3727 	inc	sp
   75D4 D5            [11] 3728 	push	de
   75D5 33            [ 6] 3729 	inc	sp
   75D6 DD 66 FF      [19] 3730 	ld	h,-1 (ix)
   75D9 DD 6E FD      [19] 3731 	ld	l,-3 (ix)
   75DC E5            [11] 3732 	push	hl
   75DD CD 27 48      [17] 3733 	call	_pathFinding
   75E0 21 08 00      [10] 3734 	ld	hl,#8
   75E3 39            [11] 3735 	add	hl,sp
   75E4 F9            [ 6] 3736 	ld	sp,hl
   75E5 C1            [10] 3737 	pop	bc
                           3738 ;src/main.c:709: if(actual->longitud_camino > 0){
   75E6 C5            [11] 3739 	push	bc
   75E7 FD E1         [14] 3740 	pop	iy
   75E9 FD 7E 1B      [19] 3741 	ld	a,27 (iy)
   75EC B7            [ 4] 3742 	or	a, a
   75ED 28 07         [12] 3743 	jr	Z,00102$
                           3744 ;src/main.c:710: dibujarEnemigo(actual);
   75EF C5            [11] 3745 	push	bc
   75F0 C5            [11] 3746 	push	bc
   75F1 CD 21 63      [17] 3747 	call	_dibujarEnemigo
   75F4 F1            [10] 3748 	pop	af
   75F5 C1            [10] 3749 	pop	bc
   75F6                    3750 00102$:
                           3751 ;src/main.c:712: ++actual;
   75F6 21 1C 00      [10] 3752 	ld	hl,#0x001C
   75F9 09            [11] 3753 	add	hl,bc
   75FA 4D            [ 4] 3754 	ld	c,l
   75FB 44            [ 4] 3755 	ld	b,h
   75FC C3 17 75      [10] 3756 	jp	00103$
   75FF                    3757 00106$:
   75FF DD F9         [10] 3758 	ld	sp, ix
   7601 DD E1         [14] 3759 	pop	ix
   7603 C9            [10] 3760 	ret
                           3761 ;src/main.c:716: void avanzarMapa() {
                           3762 ;	---------------------------------
                           3763 ; Function avanzarMapa
                           3764 ; ---------------------------------
   7604                    3765 _avanzarMapa::
                           3766 ;src/main.c:717: if(num_mapa < NUM_MAPAS -1) {
   7604 3A 47 60      [13] 3767 	ld	a,(#_num_mapa + 0)
   7607 D6 02         [ 7] 3768 	sub	a, #0x02
   7609 30 34         [12] 3769 	jr	NC,00102$
                           3770 ;src/main.c:718: mapa = mapas[++num_mapa];
   760B 01 65 60      [10] 3771 	ld	bc,#_mapas+0
   760E 21 47 60      [10] 3772 	ld	hl, #_num_mapa+0
   7611 34            [11] 3773 	inc	(hl)
   7612 FD 21 47 60   [14] 3774 	ld	iy,#_num_mapa
   7616 FD 6E 00      [19] 3775 	ld	l,0 (iy)
   7619 26 00         [ 7] 3776 	ld	h,#0x00
   761B 29            [11] 3777 	add	hl, hl
   761C 09            [11] 3778 	add	hl,bc
   761D 7E            [ 7] 3779 	ld	a,(hl)
   761E FD 21 45 60   [14] 3780 	ld	iy,#_mapa
   7622 FD 77 00      [19] 3781 	ld	0 (iy),a
   7625 23            [ 6] 3782 	inc	hl
   7626 7E            [ 7] 3783 	ld	a,(hl)
   7627 32 46 60      [13] 3784 	ld	(#_mapa + 1),a
                           3785 ;src/main.c:719: prota.x = prota.px = 2;
   762A 21 6B 5F      [10] 3786 	ld	hl,#(_prota + 0x0002)
   762D 36 02         [10] 3787 	ld	(hl),#0x02
   762F 21 69 5F      [10] 3788 	ld	hl,#_prota
   7632 36 02         [10] 3789 	ld	(hl),#0x02
                           3790 ;src/main.c:720: prota.mover = SI;
   7634 21 6F 5F      [10] 3791 	ld	hl,#(_prota + 0x0006)
   7637 36 01         [10] 3792 	ld	(hl),#0x01
                           3793 ;src/main.c:721: dibujarMapa();
   7639 CD 4F 60      [17] 3794 	call	_dibujarMapa
                           3795 ;src/main.c:722: inicializarEnemy();
   763C C3 06 75      [10] 3796 	jp  _inicializarEnemy
   763F                    3797 00102$:
                           3798 ;src/main.c:725: menuFin(puntuacion);
   763F FD 21 48 60   [14] 3799 	ld	iy,#_puntuacion
   7643 FD 6E 00      [19] 3800 	ld	l,0 (iy)
   7646 26 00         [ 7] 3801 	ld	h,#0x00
   7648 C3 39 4A      [10] 3802 	jp  _menuFin
                           3803 ;src/main.c:729: void moverIzquierda() {
                           3804 ;	---------------------------------
                           3805 ; Function moverIzquierda
                           3806 ; ---------------------------------
   764B                    3807 _moverIzquierda::
                           3808 ;src/main.c:730: prota.mira = M_izquierda;
   764B 01 69 5F      [10] 3809 	ld	bc,#_prota+0
   764E 21 70 5F      [10] 3810 	ld	hl,#(_prota + 0x0007)
   7651 36 01         [10] 3811 	ld	(hl),#0x01
                           3812 ;src/main.c:731: if (!checkCollision(M_izquierda)) {
   7653 C5            [11] 3813 	push	bc
   7654 3E 01         [ 7] 3814 	ld	a,#0x01
   7656 F5            [11] 3815 	push	af
   7657 33            [ 6] 3816 	inc	sp
   7658 CD B0 61      [17] 3817 	call	_checkCollision
   765B 33            [ 6] 3818 	inc	sp
   765C C1            [10] 3819 	pop	bc
   765D 7D            [ 4] 3820 	ld	a,l
   765E B7            [ 4] 3821 	or	a, a
   765F C0            [11] 3822 	ret	NZ
                           3823 ;src/main.c:732: prota.x--;
   7660 0A            [ 7] 3824 	ld	a,(bc)
   7661 C6 FF         [ 7] 3825 	add	a,#0xFF
   7663 02            [ 7] 3826 	ld	(bc),a
                           3827 ;src/main.c:733: prota.mover = SI;
   7664 21 6F 5F      [10] 3828 	ld	hl,#(_prota + 0x0006)
   7667 36 01         [10] 3829 	ld	(hl),#0x01
                           3830 ;src/main.c:734: prota.sprite = g_hero_left;
   7669 21 C6 3D      [10] 3831 	ld	hl,#_g_hero_left
   766C 22 6D 5F      [16] 3832 	ld	((_prota + 0x0004)), hl
   766F C9            [10] 3833 	ret
                           3834 ;src/main.c:738: void moverDerecha() {
                           3835 ;	---------------------------------
                           3836 ; Function moverDerecha
                           3837 ; ---------------------------------
   7670                    3838 _moverDerecha::
                           3839 ;src/main.c:739: prota.mira = M_derecha;
   7670 21 70 5F      [10] 3840 	ld	hl,#(_prota + 0x0007)
   7673 36 00         [10] 3841 	ld	(hl),#0x00
                           3842 ;src/main.c:740: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   7675 AF            [ 4] 3843 	xor	a, a
   7676 F5            [11] 3844 	push	af
   7677 33            [ 6] 3845 	inc	sp
   7678 CD B0 61      [17] 3846 	call	_checkCollision
   767B 33            [ 6] 3847 	inc	sp
   767C 45            [ 4] 3848 	ld	b,l
   767D 21 69 5F      [10] 3849 	ld	hl, #_prota + 0
   7680 4E            [ 7] 3850 	ld	c,(hl)
   7681 59            [ 4] 3851 	ld	e,c
   7682 16 00         [ 7] 3852 	ld	d,#0x00
   7684 21 07 00      [10] 3853 	ld	hl,#0x0007
   7687 19            [11] 3854 	add	hl,de
   7688 11 50 80      [10] 3855 	ld	de, #0x8050
   768B 29            [11] 3856 	add	hl, hl
   768C 3F            [ 4] 3857 	ccf
   768D CB 1C         [ 8] 3858 	rr	h
   768F CB 1D         [ 8] 3859 	rr	l
   7691 ED 52         [15] 3860 	sbc	hl, de
   7693 3E 00         [ 7] 3861 	ld	a,#0x00
   7695 17            [ 4] 3862 	rla
   7696 5F            [ 4] 3863 	ld	e,a
   7697 78            [ 4] 3864 	ld	a,b
   7698 B7            [ 4] 3865 	or	a,a
   7699 20 14         [12] 3866 	jr	NZ,00104$
   769B B3            [ 4] 3867 	or	a,e
   769C 28 11         [12] 3868 	jr	Z,00104$
                           3869 ;src/main.c:741: prota.x++;
   769E 0C            [ 4] 3870 	inc	c
   769F 21 69 5F      [10] 3871 	ld	hl,#_prota
   76A2 71            [ 7] 3872 	ld	(hl),c
                           3873 ;src/main.c:742: prota.mover = SI;
   76A3 21 6F 5F      [10] 3874 	ld	hl,#(_prota + 0x0006)
   76A6 36 01         [10] 3875 	ld	(hl),#0x01
                           3876 ;src/main.c:743: prota.sprite = g_hero;
   76A8 21 70 3E      [10] 3877 	ld	hl,#_g_hero
   76AB 22 6D 5F      [16] 3878 	ld	((_prota + 0x0004)), hl
   76AE C9            [10] 3879 	ret
   76AF                    3880 00104$:
                           3881 ;src/main.c:745: }else if( prota.x + G_HERO_W >= 80){
   76AF 7B            [ 4] 3882 	ld	a,e
   76B0 B7            [ 4] 3883 	or	a, a
   76B1 C0            [11] 3884 	ret	NZ
                           3885 ;src/main.c:746: avanzarMapa();
   76B2 C3 04 76      [10] 3886 	jp  _avanzarMapa
                           3887 ;src/main.c:750: void moverArriba() {
                           3888 ;	---------------------------------
                           3889 ; Function moverArriba
                           3890 ; ---------------------------------
   76B5                    3891 _moverArriba::
                           3892 ;src/main.c:751: prota.mira = M_arriba;
   76B5 21 70 5F      [10] 3893 	ld	hl,#(_prota + 0x0007)
   76B8 36 02         [10] 3894 	ld	(hl),#0x02
                           3895 ;src/main.c:752: if (!checkCollision(M_arriba)) {
   76BA 3E 02         [ 7] 3896 	ld	a,#0x02
   76BC F5            [11] 3897 	push	af
   76BD 33            [ 6] 3898 	inc	sp
   76BE CD B0 61      [17] 3899 	call	_checkCollision
   76C1 33            [ 6] 3900 	inc	sp
   76C2 7D            [ 4] 3901 	ld	a,l
   76C3 B7            [ 4] 3902 	or	a, a
   76C4 C0            [11] 3903 	ret	NZ
                           3904 ;src/main.c:753: prota.y--;
   76C5 21 6A 5F      [10] 3905 	ld	hl,#_prota + 1
   76C8 4E            [ 7] 3906 	ld	c,(hl)
   76C9 0D            [ 4] 3907 	dec	c
   76CA 71            [ 7] 3908 	ld	(hl),c
                           3909 ;src/main.c:754: prota.y--;
   76CB 0D            [ 4] 3910 	dec	c
   76CC 71            [ 7] 3911 	ld	(hl),c
                           3912 ;src/main.c:755: prota.mover  = SI;
   76CD 21 6F 5F      [10] 3913 	ld	hl,#(_prota + 0x0006)
   76D0 36 01         [10] 3914 	ld	(hl),#0x01
                           3915 ;src/main.c:756: prota.sprite = g_hero_up;
   76D2 21 2C 3D      [10] 3916 	ld	hl,#_g_hero_up
   76D5 22 6D 5F      [16] 3917 	ld	((_prota + 0x0004)), hl
   76D8 C9            [10] 3918 	ret
                           3919 ;src/main.c:760: void moverAbajo() {
                           3920 ;	---------------------------------
                           3921 ; Function moverAbajo
                           3922 ; ---------------------------------
   76D9                    3923 _moverAbajo::
                           3924 ;src/main.c:761: prota.mira = M_abajo;
   76D9 21 70 5F      [10] 3925 	ld	hl,#(_prota + 0x0007)
   76DC 36 03         [10] 3926 	ld	(hl),#0x03
                           3927 ;src/main.c:762: if (!checkCollision(M_abajo) ) {
   76DE 3E 03         [ 7] 3928 	ld	a,#0x03
   76E0 F5            [11] 3929 	push	af
   76E1 33            [ 6] 3930 	inc	sp
   76E2 CD B0 61      [17] 3931 	call	_checkCollision
   76E5 33            [ 6] 3932 	inc	sp
   76E6 7D            [ 4] 3933 	ld	a,l
   76E7 B7            [ 4] 3934 	or	a, a
   76E8 C0            [11] 3935 	ret	NZ
                           3936 ;src/main.c:763: prota.y++;
   76E9 01 6A 5F      [10] 3937 	ld	bc,#_prota + 1
   76EC 0A            [ 7] 3938 	ld	a,(bc)
   76ED 3C            [ 4] 3939 	inc	a
   76EE 02            [ 7] 3940 	ld	(bc),a
                           3941 ;src/main.c:764: prota.y++;
   76EF 3C            [ 4] 3942 	inc	a
   76F0 02            [ 7] 3943 	ld	(bc),a
                           3944 ;src/main.c:765: prota.mover  = SI;
   76F1 21 6F 5F      [10] 3945 	ld	hl,#(_prota + 0x0006)
   76F4 36 01         [10] 3946 	ld	(hl),#0x01
                           3947 ;src/main.c:766: prota.sprite = g_hero_down;
   76F6 21 92 3C      [10] 3948 	ld	hl,#_g_hero_down
   76F9 22 6D 5F      [16] 3949 	ld	((_prota + 0x0004)), hl
   76FC C9            [10] 3950 	ret
                           3951 ;src/main.c:773: void intHandler() {
                           3952 ;	---------------------------------
                           3953 ; Function intHandler
                           3954 ; ---------------------------------
   76FD                    3955 _intHandler::
                           3956 ;src/main.c:774: if (++i == 6) {
   76FD 21 7B 5F      [10] 3957 	ld	hl, #_i+0
   7700 34            [11] 3958 	inc	(hl)
   7701 3A 7B 5F      [13] 3959 	ld	a,(#_i + 0)
   7704 D6 06         [ 7] 3960 	sub	a, #0x06
   7706 C0            [11] 3961 	ret	NZ
                           3962 ;src/main.c:775: play();
   7707 CD CD 51      [17] 3963 	call	_play
                           3964 ;src/main.c:776: i=0;
   770A 21 7B 5F      [10] 3965 	ld	hl,#_i + 0
   770D 36 00         [10] 3966 	ld	(hl), #0x00
   770F C9            [10] 3967 	ret
                           3968 ;src/main.c:780: void inicializarCPC() {
                           3969 ;	---------------------------------
                           3970 ; Function inicializarCPC
                           3971 ; ---------------------------------
   7710                    3972 _inicializarCPC::
                           3973 ;src/main.c:781: cpct_disableFirmware();
   7710 CD 74 55      [17] 3974 	call	_cpct_disableFirmware
                           3975 ;src/main.c:782: cpct_setVideoMode(0);
   7713 2E 00         [ 7] 3976 	ld	l,#0x00
   7715 CD 48 55      [17] 3977 	call	_cpct_setVideoMode
                           3978 ;src/main.c:783: cpct_setBorder(HW_BLACK);
   7718 21 10 14      [10] 3979 	ld	hl,#0x1410
   771B E5            [11] 3980 	push	hl
   771C CD AB 52      [17] 3981 	call	_cpct_setPALColour
                           3982 ;src/main.c:784: cpct_setPalette(g_palette, 16);
   771F 21 10 00      [10] 3983 	ld	hl,#0x0010
   7722 E5            [11] 3984 	push	hl
   7723 21 60 3E      [10] 3985 	ld	hl,#_g_palette
   7726 E5            [11] 3986 	push	hl
   7727 CD 88 52      [17] 3987 	call	_cpct_setPalette
   772A C9            [10] 3988 	ret
                           3989 ;src/main.c:789: void inicializarJuego() {
                           3990 ;	---------------------------------
                           3991 ; Function inicializarJuego
                           3992 ; ---------------------------------
   772B                    3993 _inicializarJuego::
                           3994 ;src/main.c:791: num_mapa = 0;
   772B 21 47 60      [10] 3995 	ld	hl,#_num_mapa + 0
   772E 36 00         [10] 3996 	ld	(hl), #0x00
                           3997 ;src/main.c:792: mapa = mapas[num_mapa];
   7730 21 65 60      [10] 3998 	ld	hl, #_mapas + 0
   7733 7E            [ 7] 3999 	ld	a,(hl)
   7734 FD 21 45 60   [14] 4000 	ld	iy,#_mapa
   7738 FD 77 00      [19] 4001 	ld	0 (iy),a
   773B 23            [ 6] 4002 	inc	hl
   773C 7E            [ 7] 4003 	ld	a,(hl)
   773D 32 46 60      [13] 4004 	ld	(#_mapa + 1),a
                           4005 ;src/main.c:793: cpct_etm_setTileset2x4(g_tileset);
   7740 21 E0 17      [10] 4006 	ld	hl,#_g_tileset
   7743 CD 9C 54      [17] 4007 	call	_cpct_etm_setTileset2x4
                           4008 ;src/main.c:795: dibujarMapa();
   7746 CD 4F 60      [17] 4009 	call	_dibujarMapa
                           4010 ;src/main.c:798: barraPuntuacionInicial();
   7749 CD D9 4F      [17] 4011 	call	_barraPuntuacionInicial
                           4012 ;src/main.c:801: prota.x = prota.px = 4;
   774C 21 6B 5F      [10] 4013 	ld	hl,#(_prota + 0x0002)
   774F 36 04         [10] 4014 	ld	(hl),#0x04
   7751 21 69 5F      [10] 4015 	ld	hl,#_prota
   7754 36 04         [10] 4016 	ld	(hl),#0x04
                           4017 ;src/main.c:802: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   7756 21 6C 5F      [10] 4018 	ld	hl,#(_prota + 0x0003)
   7759 36 68         [10] 4019 	ld	(hl),#0x68
   775B 21 6A 5F      [10] 4020 	ld	hl,#(_prota + 0x0001)
   775E 36 68         [10] 4021 	ld	(hl),#0x68
                           4022 ;src/main.c:803: prota.mover  = NO;
   7760 21 6F 5F      [10] 4023 	ld	hl,#(_prota + 0x0006)
   7763 36 00         [10] 4024 	ld	(hl),#0x00
                           4025 ;src/main.c:804: prota.mira=M_derecha;
   7765 21 70 5F      [10] 4026 	ld	hl,#(_prota + 0x0007)
   7768 36 00         [10] 4027 	ld	(hl),#0x00
                           4028 ;src/main.c:805: prota.sprite = g_hero;
   776A 21 70 3E      [10] 4029 	ld	hl,#_g_hero
   776D 22 6D 5F      [16] 4030 	ld	((_prota + 0x0004)), hl
                           4031 ;src/main.c:809: cu.x = cu.px = 0;
   7770 21 73 5F      [10] 4032 	ld	hl,#(_cu + 0x0002)
   7773 36 00         [10] 4033 	ld	(hl),#0x00
   7775 21 71 5F      [10] 4034 	ld	hl,#_cu
   7778 36 00         [10] 4035 	ld	(hl),#0x00
                           4036 ;src/main.c:810: cu.y = cu.py = 0;
   777A 21 74 5F      [10] 4037 	ld	hl,#(_cu + 0x0003)
   777D 36 00         [10] 4038 	ld	(hl),#0x00
   777F 21 72 5F      [10] 4039 	ld	hl,#(_cu + 0x0001)
   7782 36 00         [10] 4040 	ld	(hl),#0x00
                           4041 ;src/main.c:811: cu.lanzado = NO;
   7784 21 77 5F      [10] 4042 	ld	hl,#(_cu + 0x0006)
   7787 36 00         [10] 4043 	ld	(hl),#0x00
                           4044 ;src/main.c:812: cu.mover = NO;
   7789 21 7A 5F      [10] 4045 	ld	hl,#(_cu + 0x0009)
   778C 36 00         [10] 4046 	ld	(hl),#0x00
                           4047 ;src/main.c:814: inicializarEnemy();
   778E CD 06 75      [17] 4048 	call	_inicializarEnemy
                           4049 ;src/main.c:816: dibujarProta();
   7791 C3 9B 60      [10] 4050 	jp  _dibujarProta
                           4051 ;src/main.c:819: void main(void) {
                           4052 ;	---------------------------------
                           4053 ; Function main
                           4054 ; ---------------------------------
   7794                    4055 _main::
   7794 DD E5         [15] 4056 	push	ix
   7796 DD 21 00 00   [14] 4057 	ld	ix,#0
   779A DD 39         [15] 4058 	add	ix,sp
   779C 3B            [ 6] 4059 	dec	sp
                           4060 ;src/main.c:824: inicializarCPC();
   779D CD 10 77      [17] 4061 	call	_inicializarCPC
                           4062 ;src/main.c:826: menuInicio();
   77A0 CD FA 4E      [17] 4063 	call	_menuInicio
                           4064 ;src/main.c:828: inicializarJuego();
   77A3 CD 2B 77      [17] 4065 	call	_inicializarJuego
                           4066 ;src/main.c:832: while (1) {
   77A6                    4067 00116$:
                           4068 ;src/main.c:835: actual = enemy;
                           4069 ;src/main.c:837: comprobarTeclado(&cu, &prota, mapa, g_tablatrans);
   77A6 21 00 01      [10] 4070 	ld	hl,#_g_tablatrans
   77A9 E5            [11] 4071 	push	hl
   77AA 2A 45 60      [16] 4072 	ld	hl,(_mapa)
   77AD E5            [11] 4073 	push	hl
   77AE 21 69 5F      [10] 4074 	ld	hl,#_prota
   77B1 E5            [11] 4075 	push	hl
   77B2 21 71 5F      [10] 4076 	ld	hl,#_cu
   77B5 E5            [11] 4077 	push	hl
   77B6 CD 49 61      [17] 4078 	call	_comprobarTeclado
   77B9 21 08 00      [10] 4079 	ld	hl,#8
   77BC 39            [11] 4080 	add	hl,sp
   77BD F9            [ 6] 4081 	ld	sp,hl
                           4082 ;src/main.c:838: moverCuchillo(&cu, mapa);
   77BE 2A 45 60      [16] 4083 	ld	hl,(_mapa)
   77C1 E5            [11] 4084 	push	hl
   77C2 21 71 5F      [10] 4085 	ld	hl,#_cu
   77C5 E5            [11] 4086 	push	hl
   77C6 CD 00 43      [17] 4087 	call	_moverCuchillo
   77C9 F1            [10] 4088 	pop	af
   77CA F1            [10] 4089 	pop	af
                           4090 ;src/main.c:839: updateEnemies();
   77CB CD 77 73      [17] 4091 	call	_updateEnemies
                           4092 ;src/main.c:841: cpct_waitVSYNC();
   77CE CD 40 55      [17] 4093 	call	_cpct_waitVSYNC
                           4094 ;src/main.c:844: if (prota.mover) {
   77D1 01 6F 5F      [10] 4095 	ld	bc,#_prota + 6
   77D4 0A            [ 7] 4096 	ld	a,(bc)
   77D5 B7            [ 4] 4097 	or	a, a
   77D6 28 07         [12] 4098 	jr	Z,00102$
                           4099 ;src/main.c:845: redibujarProta();
   77D8 C5            [11] 4100 	push	bc
   77D9 CD 35 61      [17] 4101 	call	_redibujarProta
   77DC C1            [10] 4102 	pop	bc
                           4103 ;src/main.c:846: prota.mover = NO;
   77DD AF            [ 4] 4104 	xor	a, a
   77DE 02            [ 7] 4105 	ld	(bc),a
   77DF                    4106 00102$:
                           4107 ;src/main.c:848: if(cu.lanzado && cu.mover){
   77DF 21 77 5F      [10] 4108 	ld	hl, #(_cu + 0x0006) + 0
   77E2 4E            [ 7] 4109 	ld	c,(hl)
                           4110 ;src/main.c:849: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
                           4111 ;src/main.c:848: if(cu.lanzado && cu.mover){
   77E3 79            [ 4] 4112 	ld	a,c
   77E4 B7            [ 4] 4113 	or	a, a
   77E5 28 30         [12] 4114 	jr	Z,00107$
   77E7 3A 7A 5F      [13] 4115 	ld	a, (#(_cu + 0x0009) + 0)
   77EA B7            [ 4] 4116 	or	a, a
   77EB 28 2A         [12] 4117 	jr	Z,00107$
                           4118 ;src/main.c:849: redibujarCuchillo(cu.eje, cu.x, cu.y, &cu, g_tablatrans, mapa);
   77ED 21 72 5F      [10] 4119 	ld	hl, #(_cu + 0x0001) + 0
   77F0 4E            [ 7] 4120 	ld	c,(hl)
   77F1 21 71 5F      [10] 4121 	ld	hl, #_cu + 0
   77F4 46            [ 7] 4122 	ld	b,(hl)
   77F5 21 79 5F      [10] 4123 	ld	hl, #(_cu + 0x0008) + 0
   77F8 5E            [ 7] 4124 	ld	e,(hl)
   77F9 2A 45 60      [16] 4125 	ld	hl,(_mapa)
   77FC E5            [11] 4126 	push	hl
   77FD 21 00 01      [10] 4127 	ld	hl,#_g_tablatrans
   7800 E5            [11] 4128 	push	hl
   7801 21 71 5F      [10] 4129 	ld	hl,#_cu
   7804 E5            [11] 4130 	push	hl
   7805 79            [ 4] 4131 	ld	a,c
   7806 F5            [11] 4132 	push	af
   7807 33            [ 6] 4133 	inc	sp
   7808 C5            [11] 4134 	push	bc
   7809 33            [ 6] 4135 	inc	sp
   780A 7B            [ 4] 4136 	ld	a,e
   780B F5            [11] 4137 	push	af
   780C 33            [ 6] 4138 	inc	sp
   780D CD 25 40      [17] 4139 	call	_redibujarCuchillo
   7810 21 09 00      [10] 4140 	ld	hl,#9
   7813 39            [11] 4141 	add	hl,sp
   7814 F9            [ 6] 4142 	ld	sp,hl
   7815 18 28         [12] 4143 	jr	00127$
   7817                    4144 00107$:
                           4145 ;src/main.c:850: }else if (cu.lanzado && !cu.mover){
   7817 79            [ 4] 4146 	ld	a,c
   7818 B7            [ 4] 4147 	or	a, a
   7819 28 24         [12] 4148 	jr	Z,00127$
   781B 3A 7A 5F      [13] 4149 	ld	a, (#(_cu + 0x0009) + 0)
   781E B7            [ 4] 4150 	or	a, a
   781F 20 1E         [12] 4151 	jr	NZ,00127$
                           4152 ;src/main.c:851: borrarCuchillo(cu.eje, cu.x, cu.y, mapa);
   7821 21 72 5F      [10] 4153 	ld	hl, #(_cu + 0x0001) + 0
   7824 46            [ 7] 4154 	ld	b,(hl)
   7825 21 71 5F      [10] 4155 	ld	hl, #_cu + 0
   7828 4E            [ 7] 4156 	ld	c,(hl)
   7829 21 79 5F      [10] 4157 	ld	hl, #(_cu + 0x0008) + 0
   782C 56            [ 7] 4158 	ld	d,(hl)
   782D 2A 45 60      [16] 4159 	ld	hl,(_mapa)
   7830 E5            [11] 4160 	push	hl
   7831 C5            [11] 4161 	push	bc
   7832 D5            [11] 4162 	push	de
   7833 33            [ 6] 4163 	inc	sp
   7834 CD 92 3F      [17] 4164 	call	_borrarCuchillo
   7837 F1            [10] 4165 	pop	af
   7838 F1            [10] 4166 	pop	af
   7839 33            [ 6] 4167 	inc	sp
                           4168 ;src/main.c:852: cu.lanzado = NO;
   783A 21 77 5F      [10] 4169 	ld	hl,#(_cu + 0x0006)
   783D 36 00         [10] 4170 	ld	(hl),#0x00
                           4171 ;src/main.c:855: while(i){
   783F                    4172 00127$:
   783F DD 36 FF 02   [19] 4173 	ld	-1 (ix),#0x02
   7843 01 F9 5E      [10] 4174 	ld	bc,#_enemy
   7846                    4175 00112$:
   7846 DD 7E FF      [19] 4176 	ld	a,-1 (ix)
   7849 B7            [ 4] 4177 	or	a, a
   784A 28 2C         [12] 4178 	jr	Z,00114$
                           4179 ;src/main.c:856: --i;
   784C DD 35 FF      [23] 4180 	dec	-1 (ix)
                           4181 ;src/main.c:857: if(actual->mover){
   784F C5            [11] 4182 	push	bc
   7850 FD E1         [14] 4183 	pop	iy
   7852 FD 7E 06      [19] 4184 	ld	a,6 (iy)
   7855 B7            [ 4] 4185 	or	a, a
   7856 28 18         [12] 4186 	jr	Z,00111$
                           4187 ;src/main.c:858: redibujarEnemigo((*actual).px, (*actual).py, actual);
   7858 69            [ 4] 4188 	ld	l, c
   7859 60            [ 4] 4189 	ld	h, b
   785A 23            [ 6] 4190 	inc	hl
   785B 23            [ 6] 4191 	inc	hl
   785C 23            [ 6] 4192 	inc	hl
   785D 5E            [ 7] 4193 	ld	e,(hl)
   785E 69            [ 4] 4194 	ld	l, c
   785F 60            [ 4] 4195 	ld	h, b
   7860 23            [ 6] 4196 	inc	hl
   7861 23            [ 6] 4197 	inc	hl
   7862 56            [ 7] 4198 	ld	d,(hl)
   7863 C5            [11] 4199 	push	bc
   7864 C5            [11] 4200 	push	bc
   7865 7B            [ 4] 4201 	ld	a,e
   7866 F5            [11] 4202 	push	af
   7867 33            [ 6] 4203 	inc	sp
   7868 D5            [11] 4204 	push	de
   7869 33            [ 6] 4205 	inc	sp
   786A CD 7F 64      [17] 4206 	call	_redibujarEnemigo
   786D F1            [10] 4207 	pop	af
   786E F1            [10] 4208 	pop	af
   786F C1            [10] 4209 	pop	bc
   7870                    4210 00111$:
                           4211 ;src/main.c:871: ++actual;
   7870 21 1C 00      [10] 4212 	ld	hl,#0x001C
   7873 09            [11] 4213 	add	hl,bc
   7874 4D            [ 4] 4214 	ld	c,l
   7875 44            [ 4] 4215 	ld	b,h
   7876 18 CE         [12] 4216 	jr	00112$
   7878                    4217 00114$:
                           4218 ;src/main.c:873: cpct_waitVSYNC();
   7878 CD 40 55      [17] 4219 	call	_cpct_waitVSYNC
   787B C3 A6 77      [10] 4220 	jp	00116$
   787E 33            [ 6] 4221 	inc	sp
   787F DD E1         [14] 4222 	pop	ix
   7881 C9            [10] 4223 	ret
                           4224 	.area _CODE
                           4225 	.area _INITIALIZER
   604A                    4226 __xinit__mapa:
   604A 00 00              4227 	.dw #0x0000
   604C                    4228 __xinit__num_mapa:
   604C 00                 4229 	.db #0x00	; 0
   604D                    4230 __xinit__puntuacion:
   604D 00                 4231 	.db #0x00	; 0
   604E                    4232 __xinit__vidas:
   604E 05                 4233 	.db #0x05	; 5
                           4234 	.area _CABS (ABS)
