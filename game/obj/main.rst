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
                             15 	.globl _moverCuchillo
                             16 	.globl _checkKnifeCollision
                             17 	.globl _comprobarTeclado
                             18 	.globl _lanzarCuchillo
                             19 	.globl _redibujarCuchillo
                             20 	.globl _borrarCuchillo
                             21 	.globl _dibujarCuchillo
                             22 	.globl _moverAbajo
                             23 	.globl _moverArriba
                             24 	.globl _moverDerecha
                             25 	.globl _moverIzquierda
                             26 	.globl _avanzarMapa
                             27 	.globl _inicializarEnemy
                             28 	.globl _moverEnemigo
                             29 	.globl _moverEnemigoIzquierda
                             30 	.globl _moverEnemigoDerecha
                             31 	.globl _moverEnemigoAbajo
                             32 	.globl _moverEnemigoArriba
                             33 	.globl _checkEnemyCollision
                             34 	.globl _redibujarEnemigo
                             35 	.globl _borrarEnemigo
                             36 	.globl _borrarExplosion
                             37 	.globl _dibujarExplosion
                             38 	.globl _dibujarEnemigo
                             39 	.globl _checkCollision
                             40 	.globl _getTilePtr
                             41 	.globl _redibujarProta
                             42 	.globl _borrarProta
                             43 	.globl _dibujarProta
                             44 	.globl _dibujarMapa
                             45 	.globl _play
                             46 	.globl _aumentarPuntuacion
                             47 	.globl _modificarPuntuacion
                             48 	.globl _barraPuntuacionInicial
                             49 	.globl _menuInicio
                             50 	.globl _menuFin
                             51 	.globl _cpct_etm_setTileset2x4
                             52 	.globl _cpct_etm_drawTileBox2x4
                             53 	.globl _cpct_akp_musicPlay
                             54 	.globl _cpct_akp_musicInit
                             55 	.globl _cpct_getScreenPtr
                             56 	.globl _cpct_setPALColour
                             57 	.globl _cpct_setPalette
                             58 	.globl _cpct_waitVSYNC
                             59 	.globl _cpct_setVideoMode
                             60 	.globl _cpct_drawSpriteMaskedAlignedTable
                             61 	.globl _cpct_isAnyKeyPressed
                             62 	.globl _cpct_isKeyPressed
                             63 	.globl _cpct_scanKeyboard_if
                             64 	.globl _cpct_setInterruptHandler
                             65 	.globl _cpct_disableFirmware
                             66 	.globl _vidas
                             67 	.globl _puntuacion
                             68 	.globl _num_mapa
                             69 	.globl _mapa
                             70 	.globl _i
                             71 	.globl _cu
                             72 	.globl _prota
                             73 	.globl _enemy
                             74 	.globl _EEje
                             75 	.globl _EMirar
                             76 	.globl _spawnY
                             77 	.globl _spawnX
                             78 	.globl _mapas
                             79 ;--------------------------------------------------------
                             80 ; special function registers
                             81 ;--------------------------------------------------------
                             82 ;--------------------------------------------------------
                             83 ; ram data
                             84 ;--------------------------------------------------------
                             85 	.area _DATA
   90F2                      86 _EMirar::
   90F2                      87 	.ds 1
   90F3                      88 _EEje::
   90F3                      89 	.ds 1
   90F4                      90 _enemy::
   90F4                      91 	.ds 52
   9128                      92 _prota::
   9128                      93 	.ds 8
   9130                      94 _cu::
   9130                      95 	.ds 10
   913A                      96 _i::
   913A                      97 	.ds 1
                             98 ;--------------------------------------------------------
                             99 ; ram data
                            100 ;--------------------------------------------------------
                            101 	.area _INITIALIZED
   913B                     102 _mapa::
   913B                     103 	.ds 2
   913D                     104 _num_mapa::
   913D                     105 	.ds 1
   913E                     106 _puntuacion::
   913E                     107 	.ds 1
   913F                     108 _vidas::
   913F                     109 	.ds 1
                            110 ;--------------------------------------------------------
                            111 ; absolute external ram data
                            112 ;--------------------------------------------------------
                            113 	.area _DABS (ABS)
                            114 ;--------------------------------------------------------
                            115 ; global & static initialisations
                            116 ;--------------------------------------------------------
                            117 	.area _HOME
                            118 	.area _GSINIT
                            119 	.area _GSFINAL
                            120 	.area _GSINIT
                            121 ;--------------------------------------------------------
                            122 ; Home
                            123 ;--------------------------------------------------------
                            124 	.area _HOME
                            125 	.area _HOME
                            126 ;--------------------------------------------------------
                            127 ; code
                            128 ;--------------------------------------------------------
                            129 	.area _CODE
                            130 ;src/main.c:108: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
                            131 ;	---------------------------------
                            132 ; Function dummy_cpct_transparentMaskTable0M0_container
                            133 ; ---------------------------------
   7C0A                     134 _dummy_cpct_transparentMaskTable0M0_container::
                            135 	.area _g_tablatrans_ (ABS) 
   3E00                     136 	.org 0x3E00 
   3E00                     137 	 _g_tablatrans::
   3E00 FF AA 55 00 AA AA   138 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E08 55 00 55 00 00 00   139 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E10 AA AA 00 00 AA AA   140 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E18 00 00 00 00 00 00   141 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E20 55 00 55 00 00 00   142 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E28 55 00 55 00 00 00   143 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E30 00 00 00 00 00 00   144 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E38 00 00 00 00 00 00   145 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E40 AA AA 00 00 AA AA   146 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E48 00 00 00 00 00 00   147 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E50 AA AA 00 00 AA AA   148 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E58 00 00 00 00 00 00   149 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E60 00 00 00 00 00 00   150 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E68 00 00 00 00 00 00   151 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E70 00 00 00 00 00 00   152 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E78 00 00 00 00 00 00   153 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E80 55 00 55 00 00 00   154 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E88 55 00 55 00 00 00   155 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E90 00 00 00 00 00 00   156 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E98 00 00 00 00 00 00   157 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA0 55 00 55 00 00 00   158 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA8 55 00 55 00 00 00   159 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB0 00 00 00 00 00 00   160 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB8 00 00 00 00 00 00   161 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC0 00 00 00 00 00 00   162 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC8 00 00 00 00 00 00   163 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED0 00 00 00 00 00 00   164 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED8 00 00 00 00 00 00   165 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE0 00 00 00 00 00 00   166 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE8 00 00 00 00 00 00   167 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF0 00 00 00 00 00 00   168 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF8 00 00 00 00 00 00   169 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            170 	.area _CSEG (REL, CON) 
                            171 ;src/main.c:116: void dibujarMapa() {
                            172 ;	---------------------------------
                            173 ; Function dibujarMapa
                            174 ; ---------------------------------
   9145                     175 _dibujarMapa::
                            176 ;src/main.c:117: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   9145 2A 3B 91      [16]  177 	ld	hl,(_mapa)
   9148 E5            [11]  178 	push	hl
   9149 21 F0 C0      [10]  179 	ld	hl,#0xC0F0
   914C E5            [11]  180 	push	hl
   914D 21 2C 28      [10]  181 	ld	hl,#0x282C
   9150 E5            [11]  182 	push	hl
   9151 2E 00         [ 7]  183 	ld	l, #0x00
   9153 E5            [11]  184 	push	hl
   9154 AF            [ 4]  185 	xor	a, a
   9155 F5            [11]  186 	push	af
   9156 33            [ 6]  187 	inc	sp
   9157 CD 51 85      [17]  188 	call	_cpct_etm_drawTileBox2x4
   915A C9            [10]  189 	ret
   915B                     190 _mapas:
   915B C0 4D               191 	.dw _g_map1
   915D E0 46               192 	.dw _g_map2
   915F 00 40               193 	.dw _g_map3
   9161                     194 _spawnX:
   9161 00                  195 	.db #0x00	; 0
   9162 28                  196 	.db #0x28	; 40
   9163 47                  197 	.db #0x47	; 71	'G'
   9164 14                  198 	.db #0x14	; 20
   9165 3C                  199 	.db #0x3C	; 60
   9166                     200 _spawnY:
   9166 00                  201 	.db #0x00	; 0
   9167 2C                  202 	.db #0x2C	; 44
   9168 72                  203 	.db #0x72	; 114	'r'
   9169 8A                  204 	.db #0x8A	; 138
   916A 8A                  205 	.db #0x8A	; 138
                            206 ;src/main.c:120: void dibujarProta() {
                            207 ;	---------------------------------
                            208 ; Function dibujarProta
                            209 ; ---------------------------------
   916B                     210 _dibujarProta::
                            211 ;src/main.c:121: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   916B 21 29 91      [10]  212 	ld	hl, #_prota + 1
   916E 56            [ 7]  213 	ld	d,(hl)
   916F 21 28 91      [10]  214 	ld	hl, #_prota + 0
   9172 46            [ 7]  215 	ld	b,(hl)
   9173 D5            [11]  216 	push	de
   9174 33            [ 6]  217 	inc	sp
   9175 C5            [11]  218 	push	bc
   9176 33            [ 6]  219 	inc	sp
   9177 21 00 C0      [10]  220 	ld	hl,#0xC000
   917A E5            [11]  221 	push	hl
   917B CD 6F 90      [17]  222 	call	_cpct_getScreenPtr
   917E EB            [ 4]  223 	ex	de,hl
                            224 ;src/main.c:122: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   917F ED 4B 2C 91   [20]  225 	ld	bc, (#_prota + 4)
   9183 21 00 3E      [10]  226 	ld	hl,#_g_tablatrans
   9186 E5            [11]  227 	push	hl
   9187 21 07 16      [10]  228 	ld	hl,#0x1607
   918A E5            [11]  229 	push	hl
   918B D5            [11]  230 	push	de
   918C C5            [11]  231 	push	bc
   918D CD 8F 90      [17]  232 	call	_cpct_drawSpriteMaskedAlignedTable
   9190 C9            [10]  233 	ret
                            234 ;src/main.c:125: void borrarProta() {
                            235 ;	---------------------------------
                            236 ; Function borrarProta
                            237 ; ---------------------------------
   9191                     238 _borrarProta::
   9191 DD E5         [15]  239 	push	ix
   9193 DD 21 00 00   [14]  240 	ld	ix,#0
   9197 DD 39         [15]  241 	add	ix,sp
   9199 F5            [11]  242 	push	af
   919A 3B            [ 6]  243 	dec	sp
                            244 ;src/main.c:127: u8 w = 4 + (prota.px & 1);
   919B 21 2A 91      [10]  245 	ld	hl, #_prota + 2
   919E 4E            [ 7]  246 	ld	c,(hl)
   919F 79            [ 4]  247 	ld	a,c
   91A0 E6 01         [ 7]  248 	and	a, #0x01
   91A2 47            [ 4]  249 	ld	b,a
   91A3 04            [ 4]  250 	inc	b
   91A4 04            [ 4]  251 	inc	b
   91A5 04            [ 4]  252 	inc	b
   91A6 04            [ 4]  253 	inc	b
                            254 ;src/main.c:130: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   91A7 21 2B 91      [10]  255 	ld	hl, #_prota + 3
   91AA 5E            [ 7]  256 	ld	e,(hl)
   91AB CB 4B         [ 8]  257 	bit	1, e
   91AD 28 04         [12]  258 	jr	Z,00103$
   91AF 3E 01         [ 7]  259 	ld	a,#0x01
   91B1 18 02         [12]  260 	jr	00104$
   91B3                     261 00103$:
   91B3 3E 00         [ 7]  262 	ld	a,#0x00
   91B5                     263 00104$:
   91B5 C6 06         [ 7]  264 	add	a, #0x06
   91B7 DD 77 FD      [19]  265 	ld	-3 (ix),a
                            266 ;src/main.c:132: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   91BA FD 2A 3B 91   [20]  267 	ld	iy,(_mapa)
   91BE 16 00         [ 7]  268 	ld	d,#0x00
   91C0 7B            [ 4]  269 	ld	a,e
   91C1 C6 E8         [ 7]  270 	add	a,#0xE8
   91C3 DD 77 FE      [19]  271 	ld	-2 (ix),a
   91C6 7A            [ 4]  272 	ld	a,d
   91C7 CE FF         [ 7]  273 	adc	a,#0xFF
   91C9 DD 77 FF      [19]  274 	ld	-1 (ix),a
   91CC DD 6E FE      [19]  275 	ld	l,-2 (ix)
   91CF DD 66 FF      [19]  276 	ld	h,-1 (ix)
   91D2 DD CB FF 7E   [20]  277 	bit	7, -1 (ix)
   91D6 28 04         [12]  278 	jr	Z,00105$
   91D8 21 EB FF      [10]  279 	ld	hl,#0xFFEB
   91DB 19            [11]  280 	add	hl,de
   91DC                     281 00105$:
   91DC CB 2C         [ 8]  282 	sra	h
   91DE CB 1D         [ 8]  283 	rr	l
   91E0 CB 2C         [ 8]  284 	sra	h
   91E2 CB 1D         [ 8]  285 	rr	l
   91E4 55            [ 4]  286 	ld	d,l
   91E5 CB 39         [ 8]  287 	srl	c
   91E7 FD E5         [15]  288 	push	iy
   91E9 21 F0 C0      [10]  289 	ld	hl,#0xC0F0
   91EC E5            [11]  290 	push	hl
   91ED 3E 28         [ 7]  291 	ld	a,#0x28
   91EF F5            [11]  292 	push	af
   91F0 33            [ 6]  293 	inc	sp
   91F1 DD 7E FD      [19]  294 	ld	a,-3 (ix)
   91F4 F5            [11]  295 	push	af
   91F5 33            [ 6]  296 	inc	sp
   91F6 C5            [11]  297 	push	bc
   91F7 33            [ 6]  298 	inc	sp
   91F8 D5            [11]  299 	push	de
   91F9 33            [ 6]  300 	inc	sp
   91FA 79            [ 4]  301 	ld	a,c
   91FB F5            [11]  302 	push	af
   91FC 33            [ 6]  303 	inc	sp
   91FD CD 51 85      [17]  304 	call	_cpct_etm_drawTileBox2x4
   9200 DD F9         [10]  305 	ld	sp, ix
   9202 DD E1         [14]  306 	pop	ix
   9204 C9            [10]  307 	ret
                            308 ;src/main.c:135: void redibujarProta() {
                            309 ;	---------------------------------
                            310 ; Function redibujarProta
                            311 ; ---------------------------------
   9205                     312 _redibujarProta::
                            313 ;src/main.c:136: borrarProta();
   9205 CD 91 91      [17]  314 	call	_borrarProta
                            315 ;src/main.c:137: prota.px = prota.x;
   9208 01 2A 91      [10]  316 	ld	bc,#_prota + 2
   920B 3A 28 91      [13]  317 	ld	a, (#_prota + 0)
   920E 02            [ 7]  318 	ld	(bc),a
                            319 ;src/main.c:138: prota.py = prota.y;
   920F 01 2B 91      [10]  320 	ld	bc,#_prota + 3
   9212 3A 29 91      [13]  321 	ld	a, (#_prota + 1)
   9215 02            [ 7]  322 	ld	(bc),a
                            323 ;src/main.c:139: dibujarProta();
   9216 C3 6B 91      [10]  324 	jp  _dibujarProta
                            325 ;src/main.c:142: u8* getTilePtr(u8 x, u8 y) {
                            326 ;	---------------------------------
                            327 ; Function getTilePtr
                            328 ; ---------------------------------
   9219                     329 _getTilePtr::
   9219 DD E5         [15]  330 	push	ix
   921B DD 21 00 00   [14]  331 	ld	ix,#0
   921F DD 39         [15]  332 	add	ix,sp
                            333 ;src/main.c:143: return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
   9221 DD 4E 05      [19]  334 	ld	c,5 (ix)
   9224 06 00         [ 7]  335 	ld	b,#0x00
   9226 79            [ 4]  336 	ld	a,c
   9227 C6 E8         [ 7]  337 	add	a,#0xE8
   9229 5F            [ 4]  338 	ld	e,a
   922A 78            [ 4]  339 	ld	a,b
   922B CE FF         [ 7]  340 	adc	a,#0xFF
   922D 57            [ 4]  341 	ld	d,a
   922E 6B            [ 4]  342 	ld	l, e
   922F 62            [ 4]  343 	ld	h, d
   9230 CB 7A         [ 8]  344 	bit	7, d
   9232 28 04         [12]  345 	jr	Z,00103$
   9234 21 EB FF      [10]  346 	ld	hl,#0xFFEB
   9237 09            [11]  347 	add	hl,bc
   9238                     348 00103$:
   9238 CB 2C         [ 8]  349 	sra	h
   923A CB 1D         [ 8]  350 	rr	l
   923C CB 2C         [ 8]  351 	sra	h
   923E CB 1D         [ 8]  352 	rr	l
   9240 4D            [ 4]  353 	ld	c, l
   9241 44            [ 4]  354 	ld	b, h
   9242 29            [11]  355 	add	hl, hl
   9243 29            [11]  356 	add	hl, hl
   9244 09            [11]  357 	add	hl, bc
   9245 29            [11]  358 	add	hl, hl
   9246 29            [11]  359 	add	hl, hl
   9247 29            [11]  360 	add	hl, hl
   9248 4D            [ 4]  361 	ld	c,l
   9249 44            [ 4]  362 	ld	b,h
   924A 2A 3B 91      [16]  363 	ld	hl,(_mapa)
   924D 09            [11]  364 	add	hl,bc
   924E DD 4E 04      [19]  365 	ld	c,4 (ix)
   9251 CB 39         [ 8]  366 	srl	c
   9253 59            [ 4]  367 	ld	e,c
   9254 16 00         [ 7]  368 	ld	d,#0x00
   9256 19            [11]  369 	add	hl,de
   9257 DD E1         [14]  370 	pop	ix
   9259 C9            [10]  371 	ret
                            372 ;src/main.c:146: u8 checkCollision(int direction) { // check optimization
                            373 ;	---------------------------------
                            374 ; Function checkCollision
                            375 ; ---------------------------------
   925A                     376 _checkCollision::
   925A DD E5         [15]  377 	push	ix
   925C DD 21 00 00   [14]  378 	ld	ix,#0
   9260 DD 39         [15]  379 	add	ix,sp
   9262 F5            [11]  380 	push	af
                            381 ;src/main.c:147: u8 *headTile=0, *feetTile=0, *waistTile=0;
   9263 21 00 00      [10]  382 	ld	hl,#0x0000
   9266 E3            [19]  383 	ex	(sp), hl
   9267 11 00 00      [10]  384 	ld	de,#0x0000
   926A 01 00 00      [10]  385 	ld	bc,#0x0000
                            386 ;src/main.c:149: switch (direction) {
   926D DD CB 05 7E   [20]  387 	bit	7, 5 (ix)
   9271 C2 8E 93      [10]  388 	jp	NZ,00105$
   9274 3E 03         [ 7]  389 	ld	a,#0x03
   9276 DD BE 04      [19]  390 	cp	a, 4 (ix)
   9279 3E 00         [ 7]  391 	ld	a,#0x00
   927B DD 9E 05      [19]  392 	sbc	a, 5 (ix)
   927E E2 83 92      [10]  393 	jp	PO, 00128$
   9281 EE 80         [ 7]  394 	xor	a, #0x80
   9283                     395 00128$:
   9283 FA 8E 93      [10]  396 	jp	M,00105$
   9286 DD 5E 04      [19]  397 	ld	e,4 (ix)
   9289 16 00         [ 7]  398 	ld	d,#0x00
   928B 21 92 92      [10]  399 	ld	hl,#00129$
   928E 19            [11]  400 	add	hl,de
   928F 19            [11]  401 	add	hl,de
   9290 19            [11]  402 	add	hl,de
   9291 E9            [ 4]  403 	jp	(hl)
   9292                     404 00129$:
   9292 C3 9E 92      [10]  405 	jp	00101$
   9295 C3 E9 92      [10]  406 	jp	00102$
   9298 C3 2A 93      [10]  407 	jp	00103$
   929B C3 5D 93      [10]  408 	jp	00104$
                            409 ;src/main.c:150: case 0:
   929E                     410 00101$:
                            411 ;src/main.c:151: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   929E 21 29 91      [10]  412 	ld	hl, #(_prota + 0x0001) + 0
   92A1 5E            [ 7]  413 	ld	e,(hl)
   92A2 21 28 91      [10]  414 	ld	hl, #_prota + 0
   92A5 4E            [ 7]  415 	ld	c,(hl)
   92A6 0C            [ 4]  416 	inc	c
   92A7 0C            [ 4]  417 	inc	c
   92A8 0C            [ 4]  418 	inc	c
   92A9 0C            [ 4]  419 	inc	c
   92AA 7B            [ 4]  420 	ld	a,e
   92AB F5            [11]  421 	push	af
   92AC 33            [ 6]  422 	inc	sp
   92AD 79            [ 4]  423 	ld	a,c
   92AE F5            [11]  424 	push	af
   92AF 33            [ 6]  425 	inc	sp
   92B0 CD 19 92      [17]  426 	call	_getTilePtr
   92B3 F1            [10]  427 	pop	af
   92B4 33            [ 6]  428 	inc	sp
   92B5 33            [ 6]  429 	inc	sp
   92B6 E5            [11]  430 	push	hl
                            431 ;src/main.c:152: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   92B7 3A 29 91      [13]  432 	ld	a, (#(_prota + 0x0001) + 0)
   92BA C6 14         [ 7]  433 	add	a, #0x14
   92BC 4F            [ 4]  434 	ld	c,a
   92BD 21 28 91      [10]  435 	ld	hl, #_prota + 0
   92C0 46            [ 7]  436 	ld	b,(hl)
   92C1 04            [ 4]  437 	inc	b
   92C2 04            [ 4]  438 	inc	b
   92C3 04            [ 4]  439 	inc	b
   92C4 04            [ 4]  440 	inc	b
   92C5 79            [ 4]  441 	ld	a,c
   92C6 F5            [11]  442 	push	af
   92C7 33            [ 6]  443 	inc	sp
   92C8 C5            [11]  444 	push	bc
   92C9 33            [ 6]  445 	inc	sp
   92CA CD 19 92      [17]  446 	call	_getTilePtr
   92CD F1            [10]  447 	pop	af
   92CE EB            [ 4]  448 	ex	de,hl
                            449 ;src/main.c:153: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   92CF 3A 29 91      [13]  450 	ld	a, (#(_prota + 0x0001) + 0)
   92D2 C6 0B         [ 7]  451 	add	a, #0x0B
   92D4 47            [ 4]  452 	ld	b,a
   92D5 3A 28 91      [13]  453 	ld	a, (#_prota + 0)
   92D8 C6 04         [ 7]  454 	add	a, #0x04
   92DA D5            [11]  455 	push	de
   92DB C5            [11]  456 	push	bc
   92DC 33            [ 6]  457 	inc	sp
   92DD F5            [11]  458 	push	af
   92DE 33            [ 6]  459 	inc	sp
   92DF CD 19 92      [17]  460 	call	_getTilePtr
   92E2 F1            [10]  461 	pop	af
   92E3 4D            [ 4]  462 	ld	c,l
   92E4 44            [ 4]  463 	ld	b,h
   92E5 D1            [10]  464 	pop	de
                            465 ;src/main.c:154: break;
   92E6 C3 8E 93      [10]  466 	jp	00105$
                            467 ;src/main.c:155: case 1:
   92E9                     468 00102$:
                            469 ;src/main.c:156: headTile  = getTilePtr(prota.x - 1, prota.y);
   92E9 21 29 91      [10]  470 	ld	hl, #(_prota + 0x0001) + 0
   92EC 56            [ 7]  471 	ld	d,(hl)
   92ED 21 28 91      [10]  472 	ld	hl, #_prota + 0
   92F0 46            [ 7]  473 	ld	b,(hl)
   92F1 05            [ 4]  474 	dec	b
   92F2 D5            [11]  475 	push	de
   92F3 33            [ 6]  476 	inc	sp
   92F4 C5            [11]  477 	push	bc
   92F5 33            [ 6]  478 	inc	sp
   92F6 CD 19 92      [17]  479 	call	_getTilePtr
   92F9 F1            [10]  480 	pop	af
   92FA 33            [ 6]  481 	inc	sp
   92FB 33            [ 6]  482 	inc	sp
   92FC E5            [11]  483 	push	hl
                            484 ;src/main.c:157: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
   92FD 3A 29 91      [13]  485 	ld	a, (#(_prota + 0x0001) + 0)
   9300 C6 14         [ 7]  486 	add	a, #0x14
   9302 57            [ 4]  487 	ld	d,a
   9303 21 28 91      [10]  488 	ld	hl, #_prota + 0
   9306 46            [ 7]  489 	ld	b,(hl)
   9307 05            [ 4]  490 	dec	b
   9308 D5            [11]  491 	push	de
   9309 33            [ 6]  492 	inc	sp
   930A C5            [11]  493 	push	bc
   930B 33            [ 6]  494 	inc	sp
   930C CD 19 92      [17]  495 	call	_getTilePtr
   930F F1            [10]  496 	pop	af
   9310 EB            [ 4]  497 	ex	de,hl
                            498 ;src/main.c:158: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
   9311 3A 29 91      [13]  499 	ld	a, (#(_prota + 0x0001) + 0)
   9314 C6 0B         [ 7]  500 	add	a, #0x0B
   9316 47            [ 4]  501 	ld	b,a
   9317 3A 28 91      [13]  502 	ld	a, (#_prota + 0)
   931A C6 FF         [ 7]  503 	add	a,#0xFF
   931C D5            [11]  504 	push	de
   931D C5            [11]  505 	push	bc
   931E 33            [ 6]  506 	inc	sp
   931F F5            [11]  507 	push	af
   9320 33            [ 6]  508 	inc	sp
   9321 CD 19 92      [17]  509 	call	_getTilePtr
   9324 F1            [10]  510 	pop	af
   9325 4D            [ 4]  511 	ld	c,l
   9326 44            [ 4]  512 	ld	b,h
   9327 D1            [10]  513 	pop	de
                            514 ;src/main.c:159: break;
   9328 18 64         [12]  515 	jr	00105$
                            516 ;src/main.c:160: case 2:
   932A                     517 00103$:
                            518 ;src/main.c:161: headTile   = getTilePtr(prota.x, prota.y - 2);
   932A 3A 29 91      [13]  519 	ld	a, (#(_prota + 0x0001) + 0)
   932D C6 FE         [ 7]  520 	add	a,#0xFE
   932F 21 28 91      [10]  521 	ld	hl, #_prota + 0
   9332 56            [ 7]  522 	ld	d,(hl)
   9333 C5            [11]  523 	push	bc
   9334 F5            [11]  524 	push	af
   9335 33            [ 6]  525 	inc	sp
   9336 D5            [11]  526 	push	de
   9337 33            [ 6]  527 	inc	sp
   9338 CD 19 92      [17]  528 	call	_getTilePtr
   933B F1            [10]  529 	pop	af
   933C C1            [10]  530 	pop	bc
   933D 33            [ 6]  531 	inc	sp
   933E 33            [ 6]  532 	inc	sp
   933F E5            [11]  533 	push	hl
                            534 ;src/main.c:162: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
   9340 21 29 91      [10]  535 	ld	hl, #(_prota + 0x0001) + 0
   9343 56            [ 7]  536 	ld	d,(hl)
   9344 15            [ 4]  537 	dec	d
   9345 15            [ 4]  538 	dec	d
   9346 3A 28 91      [13]  539 	ld	a, (#_prota + 0)
   9349 C6 03         [ 7]  540 	add	a, #0x03
   934B C5            [11]  541 	push	bc
   934C D5            [11]  542 	push	de
   934D 33            [ 6]  543 	inc	sp
   934E F5            [11]  544 	push	af
   934F 33            [ 6]  545 	inc	sp
   9350 CD 19 92      [17]  546 	call	_getTilePtr
   9353 F1            [10]  547 	pop	af
   9354 EB            [ 4]  548 	ex	de,hl
   9355 C1            [10]  549 	pop	bc
                            550 ;src/main.c:163: *waistTile = 0;
   9356 21 00 00      [10]  551 	ld	hl,#0x0000
   9359 36 00         [10]  552 	ld	(hl),#0x00
                            553 ;src/main.c:164: break;
   935B 18 31         [12]  554 	jr	00105$
                            555 ;src/main.c:165: case 3:
   935D                     556 00104$:
                            557 ;src/main.c:166: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
   935D 3A 29 91      [13]  558 	ld	a, (#(_prota + 0x0001) + 0)
   9360 C6 16         [ 7]  559 	add	a, #0x16
   9362 21 28 91      [10]  560 	ld	hl, #_prota + 0
   9365 56            [ 7]  561 	ld	d,(hl)
   9366 C5            [11]  562 	push	bc
   9367 F5            [11]  563 	push	af
   9368 33            [ 6]  564 	inc	sp
   9369 D5            [11]  565 	push	de
   936A 33            [ 6]  566 	inc	sp
   936B CD 19 92      [17]  567 	call	_getTilePtr
   936E F1            [10]  568 	pop	af
   936F C1            [10]  569 	pop	bc
   9370 33            [ 6]  570 	inc	sp
   9371 33            [ 6]  571 	inc	sp
   9372 E5            [11]  572 	push	hl
                            573 ;src/main.c:167: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   9373 3A 29 91      [13]  574 	ld	a, (#(_prota + 0x0001) + 0)
   9376 C6 16         [ 7]  575 	add	a, #0x16
   9378 57            [ 4]  576 	ld	d,a
   9379 3A 28 91      [13]  577 	ld	a, (#_prota + 0)
   937C C6 03         [ 7]  578 	add	a, #0x03
   937E C5            [11]  579 	push	bc
   937F D5            [11]  580 	push	de
   9380 33            [ 6]  581 	inc	sp
   9381 F5            [11]  582 	push	af
   9382 33            [ 6]  583 	inc	sp
   9383 CD 19 92      [17]  584 	call	_getTilePtr
   9386 F1            [10]  585 	pop	af
   9387 EB            [ 4]  586 	ex	de,hl
   9388 C1            [10]  587 	pop	bc
                            588 ;src/main.c:168: *waistTile = 0;
   9389 21 00 00      [10]  589 	ld	hl,#0x0000
   938C 36 00         [10]  590 	ld	(hl),#0x00
                            591 ;src/main.c:170: }
   938E                     592 00105$:
                            593 ;src/main.c:172: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   938E E1            [10]  594 	pop	hl
   938F E5            [11]  595 	push	hl
   9390 6E            [ 7]  596 	ld	l,(hl)
   9391 3E 02         [ 7]  597 	ld	a,#0x02
   9393 95            [ 4]  598 	sub	a, l
   9394 38 0E         [12]  599 	jr	C,00106$
   9396 1A            [ 7]  600 	ld	a,(de)
   9397 5F            [ 4]  601 	ld	e,a
   9398 3E 02         [ 7]  602 	ld	a,#0x02
   939A 93            [ 4]  603 	sub	a, e
   939B 38 07         [12]  604 	jr	C,00106$
   939D 0A            [ 7]  605 	ld	a,(bc)
   939E 4F            [ 4]  606 	ld	c,a
   939F 3E 02         [ 7]  607 	ld	a,#0x02
   93A1 91            [ 4]  608 	sub	a, c
   93A2 30 04         [12]  609 	jr	NC,00107$
   93A4                     610 00106$:
                            611 ;src/main.c:173: return 1;
   93A4 2E 01         [ 7]  612 	ld	l,#0x01
   93A6 18 02         [12]  613 	jr	00110$
   93A8                     614 00107$:
                            615 ;src/main.c:175: return 0;
   93A8 2E 00         [ 7]  616 	ld	l,#0x00
   93AA                     617 00110$:
   93AA DD F9         [10]  618 	ld	sp, ix
   93AC DD E1         [14]  619 	pop	ix
   93AE C9            [10]  620 	ret
                            621 ;src/main.c:178: void dibujarEnemigo(TEnemy *enemy) {
                            622 ;	---------------------------------
                            623 ; Function dibujarEnemigo
                            624 ; ---------------------------------
   93AF                     625 _dibujarEnemigo::
   93AF DD E5         [15]  626 	push	ix
   93B1 DD 21 00 00   [14]  627 	ld	ix,#0
   93B5 DD 39         [15]  628 	add	ix,sp
                            629 ;src/main.c:179: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   93B7 DD 4E 04      [19]  630 	ld	c,4 (ix)
   93BA DD 46 05      [19]  631 	ld	b,5 (ix)
   93BD 69            [ 4]  632 	ld	l, c
   93BE 60            [ 4]  633 	ld	h, b
   93BF 23            [ 6]  634 	inc	hl
   93C0 56            [ 7]  635 	ld	d,(hl)
   93C1 0A            [ 7]  636 	ld	a,(bc)
   93C2 C5            [11]  637 	push	bc
   93C3 D5            [11]  638 	push	de
   93C4 33            [ 6]  639 	inc	sp
   93C5 F5            [11]  640 	push	af
   93C6 33            [ 6]  641 	inc	sp
   93C7 21 00 C0      [10]  642 	ld	hl,#0xC000
   93CA E5            [11]  643 	push	hl
   93CB CD 6F 90      [17]  644 	call	_cpct_getScreenPtr
   93CE EB            [ 4]  645 	ex	de,hl
                            646 ;src/main.c:180: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   93CF E1            [10]  647 	pop	hl
   93D0 01 04 00      [10]  648 	ld	bc, #0x0004
   93D3 09            [11]  649 	add	hl, bc
   93D4 4E            [ 7]  650 	ld	c,(hl)
   93D5 23            [ 6]  651 	inc	hl
   93D6 46            [ 7]  652 	ld	b,(hl)
   93D7 21 00 3E      [10]  653 	ld	hl,#_g_tablatrans
   93DA E5            [11]  654 	push	hl
   93DB 21 04 16      [10]  655 	ld	hl,#0x1604
   93DE E5            [11]  656 	push	hl
   93DF D5            [11]  657 	push	de
   93E0 C5            [11]  658 	push	bc
   93E1 CD 8F 90      [17]  659 	call	_cpct_drawSpriteMaskedAlignedTable
   93E4 DD E1         [14]  660 	pop	ix
   93E6 C9            [10]  661 	ret
                            662 ;src/main.c:183: void dibujarExplosion(TEnemy *enemy) {
                            663 ;	---------------------------------
                            664 ; Function dibujarExplosion
                            665 ; ---------------------------------
   93E7                     666 _dibujarExplosion::
   93E7 DD E5         [15]  667 	push	ix
   93E9 DD 21 00 00   [14]  668 	ld	ix,#0
   93ED DD 39         [15]  669 	add	ix,sp
                            670 ;src/main.c:184: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   93EF DD 4E 04      [19]  671 	ld	c,4 (ix)
   93F2 DD 46 05      [19]  672 	ld	b,5 (ix)
   93F5 69            [ 4]  673 	ld	l, c
   93F6 60            [ 4]  674 	ld	h, b
   93F7 23            [ 6]  675 	inc	hl
   93F8 56            [ 7]  676 	ld	d,(hl)
   93F9 0A            [ 7]  677 	ld	a,(bc)
   93FA 47            [ 4]  678 	ld	b,a
   93FB D5            [11]  679 	push	de
   93FC 33            [ 6]  680 	inc	sp
   93FD C5            [11]  681 	push	bc
   93FE 33            [ 6]  682 	inc	sp
   93FF 21 00 C0      [10]  683 	ld	hl,#0xC000
   9402 E5            [11]  684 	push	hl
   9403 CD 6F 90      [17]  685 	call	_cpct_getScreenPtr
   9406 4D            [ 4]  686 	ld	c,l
   9407 44            [ 4]  687 	ld	b,h
                            688 ;src/main.c:185: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   9408 11 00 3E      [10]  689 	ld	de,#_g_tablatrans+0
   940B D5            [11]  690 	push	de
   940C 21 04 16      [10]  691 	ld	hl,#0x1604
   940F E5            [11]  692 	push	hl
   9410 C5            [11]  693 	push	bc
   9411 21 70 56      [10]  694 	ld	hl,#_g_explosion
   9414 E5            [11]  695 	push	hl
   9415 CD 8F 90      [17]  696 	call	_cpct_drawSpriteMaskedAlignedTable
   9418 DD E1         [14]  697 	pop	ix
   941A C9            [10]  698 	ret
                            699 ;src/main.c:188: void borrarExplosion() {
                            700 ;	---------------------------------
                            701 ; Function borrarExplosion
                            702 ; ---------------------------------
   941B                     703 _borrarExplosion::
   941B DD E5         [15]  704 	push	ix
   941D DD 21 00 00   [14]  705 	ld	ix,#0
   9421 DD 39         [15]  706 	add	ix,sp
   9423 F5            [11]  707 	push	af
   9424 3B            [ 6]  708 	dec	sp
                            709 ;src/main.c:189: u8 w = 4 + (enemy->px & 1);
   9425 21 F6 90      [10]  710 	ld	hl, #_enemy + 2
   9428 4E            [ 7]  711 	ld	c,(hl)
   9429 79            [ 4]  712 	ld	a,c
   942A E6 01         [ 7]  713 	and	a, #0x01
   942C 47            [ 4]  714 	ld	b,a
   942D 04            [ 4]  715 	inc	b
   942E 04            [ 4]  716 	inc	b
   942F 04            [ 4]  717 	inc	b
   9430 04            [ 4]  718 	inc	b
                            719 ;src/main.c:192: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   9431 21 F7 90      [10]  720 	ld	hl, #_enemy + 3
   9434 5E            [ 7]  721 	ld	e,(hl)
   9435 CB 4B         [ 8]  722 	bit	1, e
   9437 28 04         [12]  723 	jr	Z,00103$
   9439 3E 01         [ 7]  724 	ld	a,#0x01
   943B 18 02         [12]  725 	jr	00104$
   943D                     726 00103$:
   943D 3E 00         [ 7]  727 	ld	a,#0x00
   943F                     728 00104$:
   943F C6 07         [ 7]  729 	add	a, #0x07
   9441 DD 77 FD      [19]  730 	ld	-3 (ix),a
                            731 ;src/main.c:194: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   9444 FD 2A 3B 91   [20]  732 	ld	iy,(_mapa)
   9448 16 00         [ 7]  733 	ld	d,#0x00
   944A 7B            [ 4]  734 	ld	a,e
   944B C6 E8         [ 7]  735 	add	a,#0xE8
   944D DD 77 FE      [19]  736 	ld	-2 (ix),a
   9450 7A            [ 4]  737 	ld	a,d
   9451 CE FF         [ 7]  738 	adc	a,#0xFF
   9453 DD 77 FF      [19]  739 	ld	-1 (ix),a
   9456 DD 6E FE      [19]  740 	ld	l,-2 (ix)
   9459 DD 66 FF      [19]  741 	ld	h,-1 (ix)
   945C DD CB FF 7E   [20]  742 	bit	7, -1 (ix)
   9460 28 04         [12]  743 	jr	Z,00105$
   9462 21 EB FF      [10]  744 	ld	hl,#0xFFEB
   9465 19            [11]  745 	add	hl,de
   9466                     746 00105$:
   9466 CB 2C         [ 8]  747 	sra	h
   9468 CB 1D         [ 8]  748 	rr	l
   946A CB 2C         [ 8]  749 	sra	h
   946C CB 1D         [ 8]  750 	rr	l
   946E 55            [ 4]  751 	ld	d,l
   946F CB 39         [ 8]  752 	srl	c
   9471 FD E5         [15]  753 	push	iy
   9473 21 F0 C0      [10]  754 	ld	hl,#0xC0F0
   9476 E5            [11]  755 	push	hl
   9477 3E 28         [ 7]  756 	ld	a,#0x28
   9479 F5            [11]  757 	push	af
   947A 33            [ 6]  758 	inc	sp
   947B DD 7E FD      [19]  759 	ld	a,-3 (ix)
   947E F5            [11]  760 	push	af
   947F 33            [ 6]  761 	inc	sp
   9480 C5            [11]  762 	push	bc
   9481 33            [ 6]  763 	inc	sp
   9482 D5            [11]  764 	push	de
   9483 33            [ 6]  765 	inc	sp
   9484 79            [ 4]  766 	ld	a,c
   9485 F5            [11]  767 	push	af
   9486 33            [ 6]  768 	inc	sp
   9487 CD 51 85      [17]  769 	call	_cpct_etm_drawTileBox2x4
   948A DD F9         [10]  770 	ld	sp, ix
   948C DD E1         [14]  771 	pop	ix
   948E C9            [10]  772 	ret
                            773 ;src/main.c:198: void borrarEnemigo(TEnemy *enemy) {
                            774 ;	---------------------------------
                            775 ; Function borrarEnemigo
                            776 ; ---------------------------------
   948F                     777 _borrarEnemigo::
   948F DD E5         [15]  778 	push	ix
   9491 DD 21 00 00   [14]  779 	ld	ix,#0
   9495 DD 39         [15]  780 	add	ix,sp
   9497 21 FA FF      [10]  781 	ld	hl,#-6
   949A 39            [11]  782 	add	hl,sp
   949B F9            [ 6]  783 	ld	sp,hl
                            784 ;src/main.c:200: u8 w = 4 + (enemy->px & 1);
   949C DD 4E 04      [19]  785 	ld	c,4 (ix)
   949F DD 46 05      [19]  786 	ld	b,5 (ix)
   94A2 69            [ 4]  787 	ld	l, c
   94A3 60            [ 4]  788 	ld	h, b
   94A4 23            [ 6]  789 	inc	hl
   94A5 23            [ 6]  790 	inc	hl
   94A6 5E            [ 7]  791 	ld	e,(hl)
   94A7 7B            [ 4]  792 	ld	a,e
   94A8 E6 01         [ 7]  793 	and	a, #0x01
   94AA C6 04         [ 7]  794 	add	a, #0x04
   94AC DD 77 FB      [19]  795 	ld	-5 (ix),a
                            796 ;src/main.c:203: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   94AF 69            [ 4]  797 	ld	l, c
   94B0 60            [ 4]  798 	ld	h, b
   94B1 23            [ 6]  799 	inc	hl
   94B2 23            [ 6]  800 	inc	hl
   94B3 23            [ 6]  801 	inc	hl
   94B4 56            [ 7]  802 	ld	d,(hl)
   94B5 CB 4A         [ 8]  803 	bit	1, d
   94B7 28 04         [12]  804 	jr	Z,00103$
   94B9 3E 01         [ 7]  805 	ld	a,#0x01
   94BB 18 02         [12]  806 	jr	00104$
   94BD                     807 00103$:
   94BD 3E 00         [ 7]  808 	ld	a,#0x00
   94BF                     809 00104$:
   94BF C6 07         [ 7]  810 	add	a, #0x07
   94C1 DD 77 FA      [19]  811 	ld	-6 (ix),a
                            812 ;src/main.c:205: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   94C4 FD 2A 3B 91   [20]  813 	ld	iy,(_mapa)
   94C8 DD 72 FE      [19]  814 	ld	-2 (ix),d
   94CB DD 36 FF 00   [19]  815 	ld	-1 (ix),#0x00
   94CF DD 7E FE      [19]  816 	ld	a,-2 (ix)
   94D2 C6 E8         [ 7]  817 	add	a,#0xE8
   94D4 DD 77 FC      [19]  818 	ld	-4 (ix),a
   94D7 DD 7E FF      [19]  819 	ld	a,-1 (ix)
   94DA CE FF         [ 7]  820 	adc	a,#0xFF
   94DC DD 77 FD      [19]  821 	ld	-3 (ix),a
   94DF DD 56 FC      [19]  822 	ld	d,-4 (ix)
   94E2 DD 6E FD      [19]  823 	ld	l,-3 (ix)
   94E5 DD CB FD 7E   [20]  824 	bit	7, -3 (ix)
   94E9 28 0C         [12]  825 	jr	Z,00105$
   94EB DD 7E FE      [19]  826 	ld	a,-2 (ix)
   94EE C6 EB         [ 7]  827 	add	a, #0xEB
   94F0 57            [ 4]  828 	ld	d,a
   94F1 DD 7E FF      [19]  829 	ld	a,-1 (ix)
   94F4 CE FF         [ 7]  830 	adc	a, #0xFF
   94F6 6F            [ 4]  831 	ld	l,a
   94F7                     832 00105$:
   94F7 CB 2D         [ 8]  833 	sra	l
   94F9 CB 1A         [ 8]  834 	rr	d
   94FB CB 2D         [ 8]  835 	sra	l
   94FD CB 1A         [ 8]  836 	rr	d
   94FF CB 3B         [ 8]  837 	srl	e
   9501 C5            [11]  838 	push	bc
   9502 FD E5         [15]  839 	push	iy
   9504 21 F0 C0      [10]  840 	ld	hl,#0xC0F0
   9507 E5            [11]  841 	push	hl
   9508 3E 28         [ 7]  842 	ld	a,#0x28
   950A F5            [11]  843 	push	af
   950B 33            [ 6]  844 	inc	sp
   950C DD 66 FA      [19]  845 	ld	h,-6 (ix)
   950F DD 6E FB      [19]  846 	ld	l,-5 (ix)
   9512 E5            [11]  847 	push	hl
   9513 D5            [11]  848 	push	de
   9514 CD 51 85      [17]  849 	call	_cpct_etm_drawTileBox2x4
   9517 C1            [10]  850 	pop	bc
                            851 ;src/main.c:207: enemy->mover = NO;
   9518 21 06 00      [10]  852 	ld	hl,#0x0006
   951B 09            [11]  853 	add	hl,bc
   951C 36 00         [10]  854 	ld	(hl),#0x00
   951E DD F9         [10]  855 	ld	sp, ix
   9520 DD E1         [14]  856 	pop	ix
   9522 C9            [10]  857 	ret
                            858 ;src/main.c:210: void redibujarEnemigo(TEnemy *enemy) {
                            859 ;	---------------------------------
                            860 ; Function redibujarEnemigo
                            861 ; ---------------------------------
   9523                     862 _redibujarEnemigo::
   9523 DD E5         [15]  863 	push	ix
   9525 DD 21 00 00   [14]  864 	ld	ix,#0
   9529 DD 39         [15]  865 	add	ix,sp
                            866 ;src/main.c:211: borrarEnemigo(enemy);
   952B DD 6E 04      [19]  867 	ld	l,4 (ix)
   952E DD 66 05      [19]  868 	ld	h,5 (ix)
   9531 E5            [11]  869 	push	hl
   9532 CD 8F 94      [17]  870 	call	_borrarEnemigo
   9535 F1            [10]  871 	pop	af
                            872 ;src/main.c:212: enemy->px = enemy->x;
   9536 DD 4E 04      [19]  873 	ld	c,4 (ix)
   9539 DD 46 05      [19]  874 	ld	b,5 (ix)
   953C 59            [ 4]  875 	ld	e, c
   953D 50            [ 4]  876 	ld	d, b
   953E 13            [ 6]  877 	inc	de
   953F 13            [ 6]  878 	inc	de
   9540 0A            [ 7]  879 	ld	a,(bc)
   9541 12            [ 7]  880 	ld	(de),a
                            881 ;src/main.c:213: enemy->py = enemy->y;
   9542 59            [ 4]  882 	ld	e, c
   9543 50            [ 4]  883 	ld	d, b
   9544 13            [ 6]  884 	inc	de
   9545 13            [ 6]  885 	inc	de
   9546 13            [ 6]  886 	inc	de
   9547 69            [ 4]  887 	ld	l, c
   9548 60            [ 4]  888 	ld	h, b
   9549 23            [ 6]  889 	inc	hl
   954A 7E            [ 7]  890 	ld	a,(hl)
   954B 12            [ 7]  891 	ld	(de),a
                            892 ;src/main.c:214: dibujarEnemigo(enemy);
   954C C5            [11]  893 	push	bc
   954D CD AF 93      [17]  894 	call	_dibujarEnemigo
   9550 F1            [10]  895 	pop	af
   9551 DD E1         [14]  896 	pop	ix
   9553 C9            [10]  897 	ret
                            898 ;src/main.c:217: u8 checkEnemyCollision(int direction, TEnemy *enemy){
                            899 ;	---------------------------------
                            900 ; Function checkEnemyCollision
                            901 ; ---------------------------------
   9554                     902 _checkEnemyCollision::
   9554 DD E5         [15]  903 	push	ix
   9556 DD 21 00 00   [14]  904 	ld	ix,#0
   955A DD 39         [15]  905 	add	ix,sp
   955C 21 F7 FF      [10]  906 	ld	hl,#-9
   955F 39            [11]  907 	add	hl,sp
   9560 F9            [ 6]  908 	ld	sp,hl
                            909 ;src/main.c:219: u8 colisiona = 1;
   9561 DD 36 F7 01   [19]  910 	ld	-9 (ix),#0x01
                            911 ;src/main.c:221: switch (direction) {
   9565 DD CB 05 7E   [20]  912 	bit	7, 5 (ix)
   9569 C2 1C 99      [10]  913 	jp	NZ,00165$
   956C 3E 03         [ 7]  914 	ld	a,#0x03
   956E DD BE 04      [19]  915 	cp	a, 4 (ix)
   9571 3E 00         [ 7]  916 	ld	a,#0x00
   9573 DD 9E 05      [19]  917 	sbc	a, 5 (ix)
   9576 E2 7B 95      [10]  918 	jp	PO, 00272$
   9579 EE 80         [ 7]  919 	xor	a, #0x80
   957B                     920 00272$:
   957B FA 1C 99      [10]  921 	jp	M,00165$
                            922 ;src/main.c:223: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   957E DD 4E 06      [19]  923 	ld	c,6 (ix)
   9581 DD 46 07      [19]  924 	ld	b,7 (ix)
   9584 0A            [ 7]  925 	ld	a,(bc)
   9585 5F            [ 4]  926 	ld	e,a
   9586 21 01 00      [10]  927 	ld	hl,#0x0001
   9589 09            [11]  928 	add	hl,bc
   958A DD 75 F8      [19]  929 	ld	-8 (ix),l
   958D DD 74 F9      [19]  930 	ld	-7 (ix),h
   9590 DD 6E F8      [19]  931 	ld	l,-8 (ix)
   9593 DD 66 F9      [19]  932 	ld	h,-7 (ix)
   9596 56            [ 7]  933 	ld	d,(hl)
                            934 ;src/main.c:236: enemy->muerto = SI;
   9597 21 08 00      [10]  935 	ld	hl,#0x0008
   959A 09            [11]  936 	add	hl,bc
   959B DD 75 FA      [19]  937 	ld	-6 (ix),l
   959E DD 74 FB      [19]  938 	ld	-5 (ix),h
                            939 ;src/main.c:243: enemy->mira = M_izquierda;
   95A1 21 07 00      [10]  940 	ld	hl,#0x0007
   95A4 09            [11]  941 	add	hl,bc
   95A5 DD 75 FC      [19]  942 	ld	-4 (ix),l
   95A8 DD 74 FD      [19]  943 	ld	-3 (ix),h
                            944 ;src/main.c:221: switch (direction) {
   95AB D5            [11]  945 	push	de
   95AC DD 5E 04      [19]  946 	ld	e,4 (ix)
   95AF 16 00         [ 7]  947 	ld	d,#0x00
   95B1 21 B9 95      [10]  948 	ld	hl,#00273$
   95B4 19            [11]  949 	add	hl,de
   95B5 19            [11]  950 	add	hl,de
   95B6 19            [11]  951 	add	hl,de
   95B7 D1            [10]  952 	pop	de
   95B8 E9            [ 4]  953 	jp	(hl)
   95B9                     954 00273$:
   95B9 C3 C5 95      [10]  955 	jp	00101$
   95BC C3 9E 96      [10]  956 	jp	00117$
   95BF C3 73 97      [10]  957 	jp	00133$
   95C2 C3 42 98      [10]  958 	jp	00149$
                            959 ;src/main.c:222: case 0:
   95C5                     960 00101$:
                            961 ;src/main.c:223: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   95C5 7B            [ 4]  962 	ld	a,e
   95C6 C6 05         [ 7]  963 	add	a, #0x05
   95C8 C5            [11]  964 	push	bc
   95C9 D5            [11]  965 	push	de
   95CA 33            [ 6]  966 	inc	sp
   95CB F5            [11]  967 	push	af
   95CC 33            [ 6]  968 	inc	sp
   95CD CD 19 92      [17]  969 	call	_getTilePtr
   95D0 F1            [10]  970 	pop	af
   95D1 C1            [10]  971 	pop	bc
   95D2 5E            [ 7]  972 	ld	e,(hl)
   95D3 3E 02         [ 7]  973 	ld	a,#0x02
   95D5 93            [ 4]  974 	sub	a, e
   95D6 DA 93 96      [10]  975 	jp	C,00113$
                            976 ;src/main.c:224: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   95D9 DD 6E F8      [19]  977 	ld	l,-8 (ix)
   95DC DD 66 F9      [19]  978 	ld	h,-7 (ix)
   95DF 7E            [ 7]  979 	ld	a,(hl)
   95E0 C6 0B         [ 7]  980 	add	a, #0x0B
   95E2 57            [ 4]  981 	ld	d,a
   95E3 0A            [ 7]  982 	ld	a,(bc)
   95E4 C6 05         [ 7]  983 	add	a, #0x05
   95E6 C5            [11]  984 	push	bc
   95E7 D5            [11]  985 	push	de
   95E8 33            [ 6]  986 	inc	sp
   95E9 F5            [11]  987 	push	af
   95EA 33            [ 6]  988 	inc	sp
   95EB CD 19 92      [17]  989 	call	_getTilePtr
   95EE F1            [10]  990 	pop	af
   95EF C1            [10]  991 	pop	bc
   95F0 5E            [ 7]  992 	ld	e,(hl)
   95F1 3E 02         [ 7]  993 	ld	a,#0x02
   95F3 93            [ 4]  994 	sub	a, e
   95F4 DA 93 96      [10]  995 	jp	C,00113$
                            996 ;src/main.c:225: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   95F7 DD 6E F8      [19]  997 	ld	l,-8 (ix)
   95FA DD 66 F9      [19]  998 	ld	h,-7 (ix)
   95FD 7E            [ 7]  999 	ld	a,(hl)
   95FE C6 16         [ 7] 1000 	add	a, #0x16
   9600 57            [ 4] 1001 	ld	d,a
   9601 0A            [ 7] 1002 	ld	a,(bc)
   9602 C6 05         [ 7] 1003 	add	a, #0x05
   9604 C5            [11] 1004 	push	bc
   9605 D5            [11] 1005 	push	de
   9606 33            [ 6] 1006 	inc	sp
   9607 F5            [11] 1007 	push	af
   9608 33            [ 6] 1008 	inc	sp
   9609 CD 19 92      [17] 1009 	call	_getTilePtr
   960C F1            [10] 1010 	pop	af
   960D C1            [10] 1011 	pop	bc
   960E 5E            [ 7] 1012 	ld	e,(hl)
   960F 3E 02         [ 7] 1013 	ld	a,#0x02
   9611 93            [ 4] 1014 	sub	a, e
   9612 DA 93 96      [10] 1015 	jp	C,00113$
                           1016 ;src/main.c:227: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   9615 21 31 91      [10] 1017 	ld	hl, #_cu + 1
   9618 5E            [ 7] 1018 	ld	e,(hl)
   9619 16 00         [ 7] 1019 	ld	d,#0x00
   961B 21 04 00      [10] 1020 	ld	hl,#0x0004
   961E 19            [11] 1021 	add	hl,de
   961F DD 75 FE      [19] 1022 	ld	-2 (ix),l
   9622 DD 74 FF      [19] 1023 	ld	-1 (ix),h
   9625 DD 6E F8      [19] 1024 	ld	l,-8 (ix)
   9628 DD 66 F9      [19] 1025 	ld	h,-7 (ix)
   962B 6E            [ 7] 1026 	ld	l,(hl)
   962C 26 00         [ 7] 1027 	ld	h,#0x00
   962E DD 7E FE      [19] 1028 	ld	a,-2 (ix)
   9631 95            [ 4] 1029 	sub	a, l
   9632 DD 7E FF      [19] 1030 	ld	a,-1 (ix)
   9635 9C            [ 4] 1031 	sbc	a, h
   9636 E2 3B 96      [10] 1032 	jp	PO, 00274$
   9639 EE 80         [ 7] 1033 	xor	a, #0x80
   963B                    1034 00274$:
   963B FA 50 96      [10] 1035 	jp	M,00108$
   963E D5            [11] 1036 	push	de
   963F 11 16 00      [10] 1037 	ld	de,#0x0016
   9642 19            [11] 1038 	add	hl, de
   9643 D1            [10] 1039 	pop	de
   9644 7D            [ 4] 1040 	ld	a,l
   9645 93            [ 4] 1041 	sub	a, e
   9646 7C            [ 4] 1042 	ld	a,h
   9647 9A            [ 4] 1043 	sbc	a, d
   9648 E2 4D 96      [10] 1044 	jp	PO, 00275$
   964B EE 80         [ 7] 1045 	xor	a, #0x80
   964D                    1046 00275$:
   964D F2 57 96      [10] 1047 	jp	P,00109$
   9650                    1048 00108$:
                           1049 ;src/main.c:228: colisiona = 0;
   9650 DD 36 F7 00   [19] 1050 	ld	-9 (ix),#0x00
   9654 C3 1C 99      [10] 1051 	jp	00165$
   9657                    1052 00109$:
                           1053 ;src/main.c:231: if(cu.x > enemy->x){ //si el cu esta abajo
   9657 21 30 91      [10] 1054 	ld	hl, #_cu + 0
   965A 5E            [ 7] 1055 	ld	e,(hl)
   965B 0A            [ 7] 1056 	ld	a,(bc)
   965C 4F            [ 4] 1057 	ld	c,a
   965D 93            [ 4] 1058 	sub	a, e
   965E 30 2C         [12] 1059 	jr	NC,00106$
                           1060 ;src/main.c:232: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
   9660 6B            [ 4] 1061 	ld	l,e
   9661 26 00         [ 7] 1062 	ld	h,#0x00
   9663 06 00         [ 7] 1063 	ld	b,#0x00
   9665 03            [ 6] 1064 	inc	bc
   9666 03            [ 6] 1065 	inc	bc
   9667 03            [ 6] 1066 	inc	bc
   9668 03            [ 6] 1067 	inc	bc
   9669 BF            [ 4] 1068 	cp	a, a
   966A ED 42         [15] 1069 	sbc	hl, bc
   966C 3E 01         [ 7] 1070 	ld	a,#0x01
   966E BD            [ 4] 1071 	cp	a, l
   966F 3E 00         [ 7] 1072 	ld	a,#0x00
   9671 9C            [ 4] 1073 	sbc	a, h
   9672 E2 77 96      [10] 1074 	jp	PO, 00276$
   9675 EE 80         [ 7] 1075 	xor	a, #0x80
   9677                    1076 00276$:
   9677 F2 81 96      [10] 1077 	jp	P,00103$
                           1078 ;src/main.c:233: colisiona = 0;
   967A DD 36 F7 00   [19] 1079 	ld	-9 (ix),#0x00
   967E C3 1C 99      [10] 1080 	jp	00165$
   9681                    1081 00103$:
                           1082 ;src/main.c:236: enemy->muerto = SI;
   9681 DD 6E FA      [19] 1083 	ld	l,-6 (ix)
   9684 DD 66 FB      [19] 1084 	ld	h,-5 (ix)
   9687 36 01         [10] 1085 	ld	(hl),#0x01
   9689 C3 1C 99      [10] 1086 	jp	00165$
   968C                    1087 00106$:
                           1088 ;src/main.c:239: colisiona = 0;
   968C DD 36 F7 00   [19] 1089 	ld	-9 (ix),#0x00
   9690 C3 1C 99      [10] 1090 	jp	00165$
   9693                    1091 00113$:
                           1092 ;src/main.c:243: enemy->mira = M_izquierda;
   9693 DD 6E FC      [19] 1093 	ld	l,-4 (ix)
   9696 DD 66 FD      [19] 1094 	ld	h,-3 (ix)
   9699 36 01         [10] 1095 	ld	(hl),#0x01
                           1096 ;src/main.c:245: break;
   969B C3 1C 99      [10] 1097 	jp	00165$
                           1098 ;src/main.c:246: case 1:
   969E                    1099 00117$:
                           1100 ;src/main.c:247: if( *getTilePtr(enemy->x - 1, enemy->y) <= 2
   969E 1D            [ 4] 1101 	dec	e
   969F C5            [11] 1102 	push	bc
   96A0 D5            [11] 1103 	push	de
   96A1 CD 19 92      [17] 1104 	call	_getTilePtr
   96A4 F1            [10] 1105 	pop	af
   96A5 C1            [10] 1106 	pop	bc
   96A6 5E            [ 7] 1107 	ld	e,(hl)
   96A7 3E 02         [ 7] 1108 	ld	a,#0x02
   96A9 93            [ 4] 1109 	sub	a, e
   96AA DA 68 97      [10] 1110 	jp	C,00129$
                           1111 ;src/main.c:248: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   96AD DD 6E F8      [19] 1112 	ld	l,-8 (ix)
   96B0 DD 66 F9      [19] 1113 	ld	h,-7 (ix)
   96B3 7E            [ 7] 1114 	ld	a,(hl)
   96B4 C6 0B         [ 7] 1115 	add	a, #0x0B
   96B6 57            [ 4] 1116 	ld	d,a
   96B7 0A            [ 7] 1117 	ld	a,(bc)
   96B8 C6 FF         [ 7] 1118 	add	a,#0xFF
   96BA C5            [11] 1119 	push	bc
   96BB D5            [11] 1120 	push	de
   96BC 33            [ 6] 1121 	inc	sp
   96BD F5            [11] 1122 	push	af
   96BE 33            [ 6] 1123 	inc	sp
   96BF CD 19 92      [17] 1124 	call	_getTilePtr
   96C2 F1            [10] 1125 	pop	af
   96C3 C1            [10] 1126 	pop	bc
   96C4 5E            [ 7] 1127 	ld	e,(hl)
   96C5 3E 02         [ 7] 1128 	ld	a,#0x02
   96C7 93            [ 4] 1129 	sub	a, e
   96C8 DA 68 97      [10] 1130 	jp	C,00129$
                           1131 ;src/main.c:249: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   96CB DD 6E F8      [19] 1132 	ld	l,-8 (ix)
   96CE DD 66 F9      [19] 1133 	ld	h,-7 (ix)
   96D1 7E            [ 7] 1134 	ld	a,(hl)
   96D2 C6 16         [ 7] 1135 	add	a, #0x16
   96D4 57            [ 4] 1136 	ld	d,a
   96D5 0A            [ 7] 1137 	ld	a,(bc)
   96D6 C6 FF         [ 7] 1138 	add	a,#0xFF
   96D8 C5            [11] 1139 	push	bc
   96D9 D5            [11] 1140 	push	de
   96DA 33            [ 6] 1141 	inc	sp
   96DB F5            [11] 1142 	push	af
   96DC 33            [ 6] 1143 	inc	sp
   96DD CD 19 92      [17] 1144 	call	_getTilePtr
   96E0 F1            [10] 1145 	pop	af
   96E1 C1            [10] 1146 	pop	bc
   96E2 5E            [ 7] 1147 	ld	e,(hl)
   96E3 3E 02         [ 7] 1148 	ld	a,#0x02
   96E5 93            [ 4] 1149 	sub	a, e
   96E6 DA 68 97      [10] 1150 	jp	C,00129$
                           1151 ;src/main.c:251: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   96E9 21 31 91      [10] 1152 	ld	hl, #_cu + 1
   96EC 5E            [ 7] 1153 	ld	e,(hl)
   96ED 16 00         [ 7] 1154 	ld	d,#0x00
   96EF 21 04 00      [10] 1155 	ld	hl,#0x0004
   96F2 19            [11] 1156 	add	hl,de
   96F3 DD 75 FE      [19] 1157 	ld	-2 (ix),l
   96F6 DD 74 FF      [19] 1158 	ld	-1 (ix),h
   96F9 DD 6E F8      [19] 1159 	ld	l,-8 (ix)
   96FC DD 66 F9      [19] 1160 	ld	h,-7 (ix)
   96FF 6E            [ 7] 1161 	ld	l,(hl)
   9700 26 00         [ 7] 1162 	ld	h,#0x00
   9702 DD 7E FE      [19] 1163 	ld	a,-2 (ix)
   9705 95            [ 4] 1164 	sub	a, l
   9706 DD 7E FF      [19] 1165 	ld	a,-1 (ix)
   9709 9C            [ 4] 1166 	sbc	a, h
   970A E2 0F 97      [10] 1167 	jp	PO, 00277$
   970D EE 80         [ 7] 1168 	xor	a, #0x80
   970F                    1169 00277$:
   970F FA 24 97      [10] 1170 	jp	M,00124$
   9712 D5            [11] 1171 	push	de
   9713 11 16 00      [10] 1172 	ld	de,#0x0016
   9716 19            [11] 1173 	add	hl, de
   9717 D1            [10] 1174 	pop	de
   9718 7D            [ 4] 1175 	ld	a,l
   9719 93            [ 4] 1176 	sub	a, e
   971A 7C            [ 4] 1177 	ld	a,h
   971B 9A            [ 4] 1178 	sbc	a, d
   971C E2 21 97      [10] 1179 	jp	PO, 00278$
   971F EE 80         [ 7] 1180 	xor	a, #0x80
   9721                    1181 00278$:
   9721 F2 2B 97      [10] 1182 	jp	P,00125$
   9724                    1183 00124$:
                           1184 ;src/main.c:252: colisiona = 0;
   9724 DD 36 F7 00   [19] 1185 	ld	-9 (ix),#0x00
   9728 C3 1C 99      [10] 1186 	jp	00165$
   972B                    1187 00125$:
                           1188 ;src/main.c:255: if(enemy->x > cu.x){ //si el cu esta abajo
   972B 0A            [ 7] 1189 	ld	a,(bc)
   972C 5F            [ 4] 1190 	ld	e,a
   972D 21 30 91      [10] 1191 	ld	hl, #_cu + 0
   9730 4E            [ 7] 1192 	ld	c,(hl)
   9731 79            [ 4] 1193 	ld	a,c
   9732 93            [ 4] 1194 	sub	a, e
   9733 30 2C         [12] 1195 	jr	NC,00122$
                           1196 ;src/main.c:256: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
   9735 6B            [ 4] 1197 	ld	l,e
   9736 26 00         [ 7] 1198 	ld	h,#0x00
   9738 06 00         [ 7] 1199 	ld	b,#0x00
   973A 03            [ 6] 1200 	inc	bc
   973B 03            [ 6] 1201 	inc	bc
   973C 03            [ 6] 1202 	inc	bc
   973D 03            [ 6] 1203 	inc	bc
   973E BF            [ 4] 1204 	cp	a, a
   973F ED 42         [15] 1205 	sbc	hl, bc
   9741 3E 01         [ 7] 1206 	ld	a,#0x01
   9743 BD            [ 4] 1207 	cp	a, l
   9744 3E 00         [ 7] 1208 	ld	a,#0x00
   9746 9C            [ 4] 1209 	sbc	a, h
   9747 E2 4C 97      [10] 1210 	jp	PO, 00279$
   974A EE 80         [ 7] 1211 	xor	a, #0x80
   974C                    1212 00279$:
   974C F2 56 97      [10] 1213 	jp	P,00119$
                           1214 ;src/main.c:257: colisiona = 0;
   974F DD 36 F7 00   [19] 1215 	ld	-9 (ix),#0x00
   9753 C3 1C 99      [10] 1216 	jp	00165$
   9756                    1217 00119$:
                           1218 ;src/main.c:260: enemy->muerto = SI;
   9756 DD 6E FA      [19] 1219 	ld	l,-6 (ix)
   9759 DD 66 FB      [19] 1220 	ld	h,-5 (ix)
   975C 36 01         [10] 1221 	ld	(hl),#0x01
   975E C3 1C 99      [10] 1222 	jp	00165$
   9761                    1223 00122$:
                           1224 ;src/main.c:263: colisiona = 0;
   9761 DD 36 F7 00   [19] 1225 	ld	-9 (ix),#0x00
   9765 C3 1C 99      [10] 1226 	jp	00165$
   9768                    1227 00129$:
                           1228 ;src/main.c:267: enemy->mira = M_derecha;
   9768 DD 6E FC      [19] 1229 	ld	l,-4 (ix)
   976B DD 66 FD      [19] 1230 	ld	h,-3 (ix)
   976E 36 00         [10] 1231 	ld	(hl),#0x00
                           1232 ;src/main.c:269: break;
   9770 C3 1C 99      [10] 1233 	jp	00165$
                           1234 ;src/main.c:270: case 2:
   9773                    1235 00133$:
                           1236 ;src/main.c:271: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   9773 15            [ 4] 1237 	dec	d
   9774 15            [ 4] 1238 	dec	d
   9775 C5            [11] 1239 	push	bc
   9776 D5            [11] 1240 	push	de
   9777 CD 19 92      [17] 1241 	call	_getTilePtr
   977A F1            [10] 1242 	pop	af
   977B C1            [10] 1243 	pop	bc
   977C 5E            [ 7] 1244 	ld	e,(hl)
   977D 3E 02         [ 7] 1245 	ld	a,#0x02
   977F 93            [ 4] 1246 	sub	a, e
   9780 DA 3A 98      [10] 1247 	jp	C,00145$
                           1248 ;src/main.c:272: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   9783 DD 6E F8      [19] 1249 	ld	l,-8 (ix)
   9786 DD 66 F9      [19] 1250 	ld	h,-7 (ix)
   9789 56            [ 7] 1251 	ld	d,(hl)
   978A 15            [ 4] 1252 	dec	d
   978B 15            [ 4] 1253 	dec	d
   978C 0A            [ 7] 1254 	ld	a,(bc)
   978D C6 02         [ 7] 1255 	add	a, #0x02
   978F C5            [11] 1256 	push	bc
   9790 D5            [11] 1257 	push	de
   9791 33            [ 6] 1258 	inc	sp
   9792 F5            [11] 1259 	push	af
   9793 33            [ 6] 1260 	inc	sp
   9794 CD 19 92      [17] 1261 	call	_getTilePtr
   9797 F1            [10] 1262 	pop	af
   9798 C1            [10] 1263 	pop	bc
   9799 5E            [ 7] 1264 	ld	e,(hl)
   979A 3E 02         [ 7] 1265 	ld	a,#0x02
   979C 93            [ 4] 1266 	sub	a, e
   979D DA 3A 98      [10] 1267 	jp	C,00145$
                           1268 ;src/main.c:273: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   97A0 DD 6E F8      [19] 1269 	ld	l,-8 (ix)
   97A3 DD 66 F9      [19] 1270 	ld	h,-7 (ix)
   97A6 56            [ 7] 1271 	ld	d,(hl)
   97A7 15            [ 4] 1272 	dec	d
   97A8 15            [ 4] 1273 	dec	d
   97A9 0A            [ 7] 1274 	ld	a,(bc)
   97AA C6 04         [ 7] 1275 	add	a, #0x04
   97AC C5            [11] 1276 	push	bc
   97AD D5            [11] 1277 	push	de
   97AE 33            [ 6] 1278 	inc	sp
   97AF F5            [11] 1279 	push	af
   97B0 33            [ 6] 1280 	inc	sp
   97B1 CD 19 92      [17] 1281 	call	_getTilePtr
   97B4 F1            [10] 1282 	pop	af
   97B5 C1            [10] 1283 	pop	bc
   97B6 5E            [ 7] 1284 	ld	e,(hl)
   97B7 3E 02         [ 7] 1285 	ld	a,#0x02
   97B9 93            [ 4] 1286 	sub	a, e
   97BA DA 3A 98      [10] 1287 	jp	C,00145$
                           1288 ;src/main.c:275: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   97BD 21 30 91      [10] 1289 	ld	hl, #_cu + 0
   97C0 5E            [ 7] 1290 	ld	e,(hl)
   97C1 16 00         [ 7] 1291 	ld	d,#0x00
   97C3 21 02 00      [10] 1292 	ld	hl,#0x0002
   97C6 19            [11] 1293 	add	hl,de
   97C7 DD 75 FE      [19] 1294 	ld	-2 (ix),l
   97CA DD 74 FF      [19] 1295 	ld	-1 (ix),h
   97CD 0A            [ 7] 1296 	ld	a,(bc)
   97CE 6F            [ 4] 1297 	ld	l,a
   97CF 26 00         [ 7] 1298 	ld	h,#0x00
   97D1 DD 7E FE      [19] 1299 	ld	a,-2 (ix)
   97D4 95            [ 4] 1300 	sub	a, l
   97D5 DD 7E FF      [19] 1301 	ld	a,-1 (ix)
   97D8 9C            [ 4] 1302 	sbc	a, h
   97D9 E2 DE 97      [10] 1303 	jp	PO, 00280$
   97DC EE 80         [ 7] 1304 	xor	a, #0x80
   97DE                    1305 00280$:
   97DE FA F1 97      [10] 1306 	jp	M,00140$
   97E1 23            [ 6] 1307 	inc	hl
   97E2 23            [ 6] 1308 	inc	hl
   97E3 23            [ 6] 1309 	inc	hl
   97E4 23            [ 6] 1310 	inc	hl
   97E5 7D            [ 4] 1311 	ld	a,l
   97E6 93            [ 4] 1312 	sub	a, e
   97E7 7C            [ 4] 1313 	ld	a,h
   97E8 9A            [ 4] 1314 	sbc	a, d
   97E9 E2 EE 97      [10] 1315 	jp	PO, 00281$
   97EC EE 80         [ 7] 1316 	xor	a, #0x80
   97EE                    1317 00281$:
   97EE F2 F7 97      [10] 1318 	jp	P,00141$
   97F1                    1319 00140$:
                           1320 ;src/main.c:277: colisiona = 0;
   97F1 DD 36 F7 00   [19] 1321 	ld	-9 (ix),#0x00
   97F5 18 4B         [12] 1322 	jr	00149$
   97F7                    1323 00141$:
                           1324 ;src/main.c:280: if(enemy->y>cu.y){
   97F7 DD 6E F8      [19] 1325 	ld	l,-8 (ix)
   97FA DD 66 F9      [19] 1326 	ld	h,-7 (ix)
   97FD 5E            [ 7] 1327 	ld	e,(hl)
   97FE 21 31 91      [10] 1328 	ld	hl, #(_cu + 0x0001) + 0
   9801 6E            [ 7] 1329 	ld	l,(hl)
   9802 7D            [ 4] 1330 	ld	a,l
   9803 93            [ 4] 1331 	sub	a, e
   9804 30 2E         [12] 1332 	jr	NC,00138$
                           1333 ;src/main.c:281: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   9806 16 00         [ 7] 1334 	ld	d,#0x00
   9808 26 00         [ 7] 1335 	ld	h,#0x00
   980A D5            [11] 1336 	push	de
   980B 11 08 00      [10] 1337 	ld	de,#0x0008
   980E 19            [11] 1338 	add	hl, de
   980F D1            [10] 1339 	pop	de
   9810 7B            [ 4] 1340 	ld	a,e
   9811 95            [ 4] 1341 	sub	a, l
   9812 5F            [ 4] 1342 	ld	e,a
   9813 7A            [ 4] 1343 	ld	a,d
   9814 9C            [ 4] 1344 	sbc	a, h
   9815 57            [ 4] 1345 	ld	d,a
   9816 3E 02         [ 7] 1346 	ld	a,#0x02
   9818 BB            [ 4] 1347 	cp	a, e
   9819 3E 00         [ 7] 1348 	ld	a,#0x00
   981B 9A            [ 4] 1349 	sbc	a, d
   981C E2 21 98      [10] 1350 	jp	PO, 00282$
   981F EE 80         [ 7] 1351 	xor	a, #0x80
   9821                    1352 00282$:
   9821 F2 2A 98      [10] 1353 	jp	P,00135$
                           1354 ;src/main.c:282: colisiona = 0;
   9824 DD 36 F7 00   [19] 1355 	ld	-9 (ix),#0x00
   9828 18 18         [12] 1356 	jr	00149$
   982A                    1357 00135$:
                           1358 ;src/main.c:285: enemy->muerto = SI;
   982A DD 6E FA      [19] 1359 	ld	l,-6 (ix)
   982D DD 66 FB      [19] 1360 	ld	h,-5 (ix)
   9830 36 01         [10] 1361 	ld	(hl),#0x01
   9832 18 0E         [12] 1362 	jr	00149$
   9834                    1363 00138$:
                           1364 ;src/main.c:289: colisiona = 0;
   9834 DD 36 F7 00   [19] 1365 	ld	-9 (ix),#0x00
   9838 18 08         [12] 1366 	jr	00149$
   983A                    1367 00145$:
                           1368 ;src/main.c:295: enemy->mira = M_abajo;
   983A DD 6E FC      [19] 1369 	ld	l,-4 (ix)
   983D DD 66 FD      [19] 1370 	ld	h,-3 (ix)
   9840 36 03         [10] 1371 	ld	(hl),#0x03
                           1372 ;src/main.c:298: case 3:
   9842                    1373 00149$:
                           1374 ;src/main.c:301: if( *getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   9842 DD 6E F8      [19] 1375 	ld	l,-8 (ix)
   9845 DD 66 F9      [19] 1376 	ld	h,-7 (ix)
   9848 7E            [ 7] 1377 	ld	a,(hl)
   9849 C6 18         [ 7] 1378 	add	a, #0x18
   984B 57            [ 4] 1379 	ld	d,a
   984C 0A            [ 7] 1380 	ld	a,(bc)
   984D C5            [11] 1381 	push	bc
   984E D5            [11] 1382 	push	de
   984F 33            [ 6] 1383 	inc	sp
   9850 F5            [11] 1384 	push	af
   9851 33            [ 6] 1385 	inc	sp
   9852 CD 19 92      [17] 1386 	call	_getTilePtr
   9855 F1            [10] 1387 	pop	af
   9856 C1            [10] 1388 	pop	bc
   9857 5E            [ 7] 1389 	ld	e,(hl)
   9858 3E 02         [ 7] 1390 	ld	a,#0x02
   985A 93            [ 4] 1391 	sub	a, e
   985B DA 14 99      [10] 1392 	jp	C,00161$
                           1393 ;src/main.c:302: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   985E DD 6E F8      [19] 1394 	ld	l,-8 (ix)
   9861 DD 66 F9      [19] 1395 	ld	h,-7 (ix)
   9864 7E            [ 7] 1396 	ld	a,(hl)
   9865 C6 18         [ 7] 1397 	add	a, #0x18
   9867 57            [ 4] 1398 	ld	d,a
   9868 0A            [ 7] 1399 	ld	a,(bc)
   9869 C6 02         [ 7] 1400 	add	a, #0x02
   986B C5            [11] 1401 	push	bc
   986C D5            [11] 1402 	push	de
   986D 33            [ 6] 1403 	inc	sp
   986E F5            [11] 1404 	push	af
   986F 33            [ 6] 1405 	inc	sp
   9870 CD 19 92      [17] 1406 	call	_getTilePtr
   9873 F1            [10] 1407 	pop	af
   9874 C1            [10] 1408 	pop	bc
   9875 5E            [ 7] 1409 	ld	e,(hl)
   9876 3E 02         [ 7] 1410 	ld	a,#0x02
   9878 93            [ 4] 1411 	sub	a, e
   9879 DA 14 99      [10] 1412 	jp	C,00161$
                           1413 ;src/main.c:303: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   987C DD 6E F8      [19] 1414 	ld	l,-8 (ix)
   987F DD 66 F9      [19] 1415 	ld	h,-7 (ix)
   9882 7E            [ 7] 1416 	ld	a,(hl)
   9883 C6 18         [ 7] 1417 	add	a, #0x18
   9885 57            [ 4] 1418 	ld	d,a
   9886 0A            [ 7] 1419 	ld	a,(bc)
   9887 C6 04         [ 7] 1420 	add	a, #0x04
   9889 C5            [11] 1421 	push	bc
   988A D5            [11] 1422 	push	de
   988B 33            [ 6] 1423 	inc	sp
   988C F5            [11] 1424 	push	af
   988D 33            [ 6] 1425 	inc	sp
   988E CD 19 92      [17] 1426 	call	_getTilePtr
   9891 F1            [10] 1427 	pop	af
   9892 C1            [10] 1428 	pop	bc
   9893 5E            [ 7] 1429 	ld	e,(hl)
   9894 3E 02         [ 7] 1430 	ld	a,#0x02
   9896 93            [ 4] 1431 	sub	a, e
   9897 38 7B         [12] 1432 	jr	C,00161$
                           1433 ;src/main.c:305: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   9899 21 30 91      [10] 1434 	ld	hl, #_cu + 0
   989C 5E            [ 7] 1435 	ld	e,(hl)
   989D 16 00         [ 7] 1436 	ld	d,#0x00
   989F 21 02 00      [10] 1437 	ld	hl,#0x0002
   98A2 19            [11] 1438 	add	hl,de
   98A3 DD 75 FE      [19] 1439 	ld	-2 (ix),l
   98A6 DD 74 FF      [19] 1440 	ld	-1 (ix),h
   98A9 0A            [ 7] 1441 	ld	a,(bc)
   98AA 4F            [ 4] 1442 	ld	c,a
   98AB 06 00         [ 7] 1443 	ld	b,#0x00
   98AD DD 7E FE      [19] 1444 	ld	a,-2 (ix)
   98B0 91            [ 4] 1445 	sub	a, c
   98B1 DD 7E FF      [19] 1446 	ld	a,-1 (ix)
   98B4 98            [ 4] 1447 	sbc	a, b
   98B5 E2 BA 98      [10] 1448 	jp	PO, 00283$
   98B8 EE 80         [ 7] 1449 	xor	a, #0x80
   98BA                    1450 00283$:
   98BA FA CD 98      [10] 1451 	jp	M,00156$
   98BD 03            [ 6] 1452 	inc	bc
   98BE 03            [ 6] 1453 	inc	bc
   98BF 03            [ 6] 1454 	inc	bc
   98C0 03            [ 6] 1455 	inc	bc
   98C1 79            [ 4] 1456 	ld	a,c
   98C2 93            [ 4] 1457 	sub	a, e
   98C3 78            [ 4] 1458 	ld	a,b
   98C4 9A            [ 4] 1459 	sbc	a, d
   98C5 E2 CA 98      [10] 1460 	jp	PO, 00284$
   98C8 EE 80         [ 7] 1461 	xor	a, #0x80
   98CA                    1462 00284$:
   98CA F2 D3 98      [10] 1463 	jp	P,00157$
   98CD                    1464 00156$:
                           1465 ;src/main.c:306: colisiona = 0;
   98CD DD 36 F7 00   [19] 1466 	ld	-9 (ix),#0x00
   98D1 18 49         [12] 1467 	jr	00165$
   98D3                    1468 00157$:
                           1469 ;src/main.c:309: if(cu.y > enemy->y){ //si el cu esta abajo
   98D3 21 31 91      [10] 1470 	ld	hl, #(_cu + 0x0001) + 0
   98D6 4E            [ 7] 1471 	ld	c,(hl)
   98D7 DD 6E F8      [19] 1472 	ld	l,-8 (ix)
   98DA DD 66 F9      [19] 1473 	ld	h,-7 (ix)
   98DD 5E            [ 7] 1474 	ld	e,(hl)
   98DE 7B            [ 4] 1475 	ld	a,e
   98DF 91            [ 4] 1476 	sub	a, c
   98E0 30 2C         [12] 1477 	jr	NC,00154$
                           1478 ;src/main.c:310: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   98E2 06 00         [ 7] 1479 	ld	b,#0x00
   98E4 16 00         [ 7] 1480 	ld	d,#0x00
   98E6 21 16 00      [10] 1481 	ld	hl,#0x0016
   98E9 19            [11] 1482 	add	hl,de
   98EA 79            [ 4] 1483 	ld	a,c
   98EB 95            [ 4] 1484 	sub	a, l
   98EC 4F            [ 4] 1485 	ld	c,a
   98ED 78            [ 4] 1486 	ld	a,b
   98EE 9C            [ 4] 1487 	sbc	a, h
   98EF 47            [ 4] 1488 	ld	b,a
   98F0 3E 02         [ 7] 1489 	ld	a,#0x02
   98F2 B9            [ 4] 1490 	cp	a, c
   98F3 3E 00         [ 7] 1491 	ld	a,#0x00
   98F5 98            [ 4] 1492 	sbc	a, b
   98F6 E2 FB 98      [10] 1493 	jp	PO, 00285$
   98F9 EE 80         [ 7] 1494 	xor	a, #0x80
   98FB                    1495 00285$:
   98FB F2 04 99      [10] 1496 	jp	P,00151$
                           1497 ;src/main.c:311: colisiona = 0;
   98FE DD 36 F7 00   [19] 1498 	ld	-9 (ix),#0x00
   9902 18 18         [12] 1499 	jr	00165$
   9904                    1500 00151$:
                           1501 ;src/main.c:314: enemy->muerto = SI;
   9904 DD 6E FA      [19] 1502 	ld	l,-6 (ix)
   9907 DD 66 FB      [19] 1503 	ld	h,-5 (ix)
   990A 36 01         [10] 1504 	ld	(hl),#0x01
   990C 18 0E         [12] 1505 	jr	00165$
   990E                    1506 00154$:
                           1507 ;src/main.c:318: colisiona = 0;
   990E DD 36 F7 00   [19] 1508 	ld	-9 (ix),#0x00
   9912 18 08         [12] 1509 	jr	00165$
   9914                    1510 00161$:
                           1511 ;src/main.c:322: enemy->mira = M_arriba;
   9914 DD 6E FC      [19] 1512 	ld	l,-4 (ix)
   9917 DD 66 FD      [19] 1513 	ld	h,-3 (ix)
   991A 36 02         [10] 1514 	ld	(hl),#0x02
                           1515 ;src/main.c:325: }
   991C                    1516 00165$:
                           1517 ;src/main.c:326: return colisiona;
   991C DD 6E F7      [19] 1518 	ld	l,-9 (ix)
   991F DD F9         [10] 1519 	ld	sp, ix
   9921 DD E1         [14] 1520 	pop	ix
   9923 C9            [10] 1521 	ret
                           1522 ;src/main.c:329: void moverEnemigoArriba(TEnemy *enemy){
                           1523 ;	---------------------------------
                           1524 ; Function moverEnemigoArriba
                           1525 ; ---------------------------------
   9924                    1526 _moverEnemigoArriba::
   9924 DD E5         [15] 1527 	push	ix
   9926 DD 21 00 00   [14] 1528 	ld	ix,#0
   992A DD 39         [15] 1529 	add	ix,sp
                           1530 ;src/main.c:330: enemy->y--;
   992C DD 4E 04      [19] 1531 	ld	c,4 (ix)
   992F DD 46 05      [19] 1532 	ld	b,5 (ix)
   9932 69            [ 4] 1533 	ld	l, c
   9933 60            [ 4] 1534 	ld	h, b
   9934 23            [ 6] 1535 	inc	hl
   9935 5E            [ 7] 1536 	ld	e,(hl)
   9936 1D            [ 4] 1537 	dec	e
   9937 73            [ 7] 1538 	ld	(hl),e
                           1539 ;src/main.c:331: enemy->y--;
   9938 1D            [ 4] 1540 	dec	e
   9939 73            [ 7] 1541 	ld	(hl),e
                           1542 ;src/main.c:332: enemy->mover = SI;
   993A 21 06 00      [10] 1543 	ld	hl,#0x0006
   993D 09            [11] 1544 	add	hl,bc
   993E 36 01         [10] 1545 	ld	(hl),#0x01
   9940 DD E1         [14] 1546 	pop	ix
   9942 C9            [10] 1547 	ret
                           1548 ;src/main.c:335: void moverEnemigoAbajo(TEnemy *enemy){
                           1549 ;	---------------------------------
                           1550 ; Function moverEnemigoAbajo
                           1551 ; ---------------------------------
   9943                    1552 _moverEnemigoAbajo::
   9943 DD E5         [15] 1553 	push	ix
   9945 DD 21 00 00   [14] 1554 	ld	ix,#0
   9949 DD 39         [15] 1555 	add	ix,sp
                           1556 ;src/main.c:336: enemy->y++;
   994B DD 4E 04      [19] 1557 	ld	c,4 (ix)
   994E DD 46 05      [19] 1558 	ld	b,5 (ix)
   9951 59            [ 4] 1559 	ld	e, c
   9952 50            [ 4] 1560 	ld	d, b
   9953 13            [ 6] 1561 	inc	de
   9954 1A            [ 7] 1562 	ld	a,(de)
   9955 3C            [ 4] 1563 	inc	a
   9956 12            [ 7] 1564 	ld	(de),a
                           1565 ;src/main.c:337: enemy->y++;
   9957 3C            [ 4] 1566 	inc	a
   9958 12            [ 7] 1567 	ld	(de),a
                           1568 ;src/main.c:338: enemy->mover = SI;
   9959 21 06 00      [10] 1569 	ld	hl,#0x0006
   995C 09            [11] 1570 	add	hl,bc
   995D 36 01         [10] 1571 	ld	(hl),#0x01
   995F DD E1         [14] 1572 	pop	ix
   9961 C9            [10] 1573 	ret
                           1574 ;src/main.c:341: void moverEnemigoDerecha(TEnemy *enemy){
                           1575 ;	---------------------------------
                           1576 ; Function moverEnemigoDerecha
                           1577 ; ---------------------------------
   9962                    1578 _moverEnemigoDerecha::
                           1579 ;src/main.c:342: enemy->x++;
   9962 D1            [10] 1580 	pop	de
   9963 C1            [10] 1581 	pop	bc
   9964 C5            [11] 1582 	push	bc
   9965 D5            [11] 1583 	push	de
   9966 0A            [ 7] 1584 	ld	a,(bc)
   9967 3C            [ 4] 1585 	inc	a
   9968 02            [ 7] 1586 	ld	(bc),a
                           1587 ;src/main.c:343: enemy->x++;
   9969 3C            [ 4] 1588 	inc	a
   996A 02            [ 7] 1589 	ld	(bc),a
                           1590 ;src/main.c:344: enemy->mover = SI;
   996B 21 06 00      [10] 1591 	ld	hl,#0x0006
   996E 09            [11] 1592 	add	hl,bc
   996F 36 01         [10] 1593 	ld	(hl),#0x01
   9971 C9            [10] 1594 	ret
                           1595 ;src/main.c:347: void moverEnemigoIzquierda(TEnemy *enemy){
                           1596 ;	---------------------------------
                           1597 ; Function moverEnemigoIzquierda
                           1598 ; ---------------------------------
   9972                    1599 _moverEnemigoIzquierda::
                           1600 ;src/main.c:348: enemy->x--;
   9972 D1            [10] 1601 	pop	de
   9973 C1            [10] 1602 	pop	bc
   9974 C5            [11] 1603 	push	bc
   9975 D5            [11] 1604 	push	de
   9976 0A            [ 7] 1605 	ld	a,(bc)
   9977 C6 FF         [ 7] 1606 	add	a,#0xFF
   9979 02            [ 7] 1607 	ld	(bc),a
                           1608 ;src/main.c:349: enemy->x--;
   997A C6 FF         [ 7] 1609 	add	a,#0xFF
   997C 02            [ 7] 1610 	ld	(bc),a
                           1611 ;src/main.c:350: enemy->mover = SI;
   997D 21 06 00      [10] 1612 	ld	hl,#0x0006
   9980 09            [11] 1613 	add	hl,bc
   9981 36 01         [10] 1614 	ld	(hl),#0x01
   9983 C9            [10] 1615 	ret
                           1616 ;src/main.c:353: void moverEnemigo(TEnemy *enemy){
                           1617 ;	---------------------------------
                           1618 ; Function moverEnemigo
                           1619 ; ---------------------------------
   9984                    1620 _moverEnemigo::
   9984 DD E5         [15] 1621 	push	ix
   9986 DD 21 00 00   [14] 1622 	ld	ix,#0
   998A DD 39         [15] 1623 	add	ix,sp
                           1624 ;src/main.c:354: if(!enemy->muerto){
   998C DD 4E 04      [19] 1625 	ld	c,4 (ix)
   998F DD 46 05      [19] 1626 	ld	b,5 (ix)
   9992 C5            [11] 1627 	push	bc
   9993 FD E1         [14] 1628 	pop	iy
   9995 FD 7E 08      [19] 1629 	ld	a,8 (iy)
   9998 B7            [ 4] 1630 	or	a, a
   9999 20 46         [12] 1631 	jr	NZ,00110$
                           1632 ;src/main.c:355: if(!checkEnemyCollision(enemy->mira, enemy)){
   999B 21 07 00      [10] 1633 	ld	hl,#0x0007
   999E 09            [11] 1634 	add	hl,bc
   999F 5E            [ 7] 1635 	ld	e,(hl)
   99A0 16 00         [ 7] 1636 	ld	d,#0x00
   99A2 E5            [11] 1637 	push	hl
   99A3 C5            [11] 1638 	push	bc
   99A4 C5            [11] 1639 	push	bc
   99A5 D5            [11] 1640 	push	de
   99A6 CD 54 95      [17] 1641 	call	_checkEnemyCollision
   99A9 F1            [10] 1642 	pop	af
   99AA F1            [10] 1643 	pop	af
   99AB 7D            [ 4] 1644 	ld	a,l
   99AC C1            [10] 1645 	pop	bc
   99AD E1            [10] 1646 	pop	hl
   99AE B7            [ 4] 1647 	or	a, a
   99AF 20 30         [12] 1648 	jr	NZ,00110$
                           1649 ;src/main.c:357: switch (enemy->mira) {
   99B1 5E            [ 7] 1650 	ld	e,(hl)
   99B2 3E 03         [ 7] 1651 	ld	a,#0x03
   99B4 93            [ 4] 1652 	sub	a, e
   99B5 38 2A         [12] 1653 	jr	C,00110$
   99B7 16 00         [ 7] 1654 	ld	d,#0x00
   99B9 21 BF 99      [10] 1655 	ld	hl,#00124$
   99BC 19            [11] 1656 	add	hl,de
   99BD 19            [11] 1657 	add	hl,de
                           1658 ;src/main.c:359: case 0:
   99BE E9            [ 4] 1659 	jp	(hl)
   99BF                    1660 00124$:
   99BF 18 06         [12] 1661 	jr	00101$
   99C1 18 0B         [12] 1662 	jr	00102$
   99C3 18 10         [12] 1663 	jr	00103$
   99C5 18 15         [12] 1664 	jr	00104$
   99C7                    1665 00101$:
                           1666 ;src/main.c:360: moverEnemigoDerecha(enemy);
   99C7 C5            [11] 1667 	push	bc
   99C8 CD 62 99      [17] 1668 	call	_moverEnemigoDerecha
   99CB F1            [10] 1669 	pop	af
                           1670 ;src/main.c:361: break;
   99CC 18 13         [12] 1671 	jr	00110$
                           1672 ;src/main.c:362: case 1:
   99CE                    1673 00102$:
                           1674 ;src/main.c:363: moverEnemigoIzquierda(enemy);
   99CE C5            [11] 1675 	push	bc
   99CF CD 72 99      [17] 1676 	call	_moverEnemigoIzquierda
   99D2 F1            [10] 1677 	pop	af
                           1678 ;src/main.c:364: break;
   99D3 18 0C         [12] 1679 	jr	00110$
                           1680 ;src/main.c:365: case 2:
   99D5                    1681 00103$:
                           1682 ;src/main.c:366: moverEnemigoArriba(enemy);
   99D5 C5            [11] 1683 	push	bc
   99D6 CD 24 99      [17] 1684 	call	_moverEnemigoArriba
   99D9 F1            [10] 1685 	pop	af
                           1686 ;src/main.c:367: break;
   99DA 18 05         [12] 1687 	jr	00110$
                           1688 ;src/main.c:368: case 3:
   99DC                    1689 00104$:
                           1690 ;src/main.c:369: moverEnemigoAbajo(enemy);
   99DC C5            [11] 1691 	push	bc
   99DD CD 43 99      [17] 1692 	call	_moverEnemigoAbajo
   99E0 F1            [10] 1693 	pop	af
                           1694 ;src/main.c:371: }
   99E1                    1695 00110$:
   99E1 DD E1         [14] 1696 	pop	ix
   99E3 C9            [10] 1697 	ret
                           1698 ;src/main.c:376: void inicializarEnemy() {
                           1699 ;	---------------------------------
                           1700 ; Function inicializarEnemy
                           1701 ; ---------------------------------
   99E4                    1702 _inicializarEnemy::
   99E4 DD E5         [15] 1703 	push	ix
   99E6 DD 21 00 00   [14] 1704 	ld	ix,#0
   99EA DD 39         [15] 1705 	add	ix,sp
   99EC 3B            [ 6] 1706 	dec	sp
                           1707 ;src/main.c:377: u8 i = (2 + num_mapa) + 1; //sacar distinto numero dependiendo del mapa
   99ED 3A 3D 91      [13] 1708 	ld	a,(#_num_mapa + 0)
   99F0 C6 03         [ 7] 1709 	add	a, #0x03
   99F2 DD 77 FF      [19] 1710 	ld	-1 (ix),a
                           1711 ;src/main.c:382: actual = enemy;
   99F5 11 F4 90      [10] 1712 	ld	de,#_enemy+0
                           1713 ;src/main.c:383: while(--i){
   99F8                    1714 00101$:
   99F8 DD 35 FF      [23] 1715 	dec	-1 (ix)
   99FB DD 7E FF      [19] 1716 	ld	a,-1 (ix)
   99FE B7            [ 4] 1717 	or	a, a
   99FF 28 61         [12] 1718 	jr	Z,00104$
                           1719 ;src/main.c:384: actual->x = actual->px = spawnX[i];
   9A01 4B            [ 4] 1720 	ld	c, e
   9A02 42            [ 4] 1721 	ld	b, d
   9A03 03            [ 6] 1722 	inc	bc
   9A04 03            [ 6] 1723 	inc	bc
   9A05 3E 61         [ 7] 1724 	ld	a,#<(_spawnX)
   9A07 DD 86 FF      [19] 1725 	add	a, -1 (ix)
   9A0A 6F            [ 4] 1726 	ld	l,a
   9A0B 3E 91         [ 7] 1727 	ld	a,#>(_spawnX)
   9A0D CE 00         [ 7] 1728 	adc	a, #0x00
   9A0F 67            [ 4] 1729 	ld	h,a
   9A10 7E            [ 7] 1730 	ld	a,(hl)
   9A11 02            [ 7] 1731 	ld	(bc),a
   9A12 12            [ 7] 1732 	ld	(de),a
                           1733 ;src/main.c:385: actual->y = actual->py = spawnY[i];
   9A13 D5            [11] 1734 	push	de
   9A14 FD E1         [14] 1735 	pop	iy
   9A16 FD 23         [10] 1736 	inc	iy
   9A18 4B            [ 4] 1737 	ld	c, e
   9A19 42            [ 4] 1738 	ld	b, d
   9A1A 03            [ 6] 1739 	inc	bc
   9A1B 03            [ 6] 1740 	inc	bc
   9A1C 03            [ 6] 1741 	inc	bc
   9A1D 3E 66         [ 7] 1742 	ld	a,#<(_spawnY)
   9A1F DD 86 FF      [19] 1743 	add	a, -1 (ix)
   9A22 6F            [ 4] 1744 	ld	l,a
   9A23 3E 91         [ 7] 1745 	ld	a,#>(_spawnY)
   9A25 CE 00         [ 7] 1746 	adc	a, #0x00
   9A27 67            [ 4] 1747 	ld	h,a
   9A28 7E            [ 7] 1748 	ld	a,(hl)
   9A29 02            [ 7] 1749 	ld	(bc),a
   9A2A FD 77 00      [19] 1750 	ld	0 (iy), a
                           1751 ;src/main.c:386: actual->mover  = NO;
   9A2D 21 06 00      [10] 1752 	ld	hl,#0x0006
   9A30 19            [11] 1753 	add	hl,de
   9A31 36 00         [10] 1754 	ld	(hl),#0x00
                           1755 ;src/main.c:387: actual->mira   = M_abajo;
   9A33 21 07 00      [10] 1756 	ld	hl,#0x0007
   9A36 19            [11] 1757 	add	hl,de
   9A37 36 03         [10] 1758 	ld	(hl),#0x03
                           1759 ;src/main.c:388: actual->sprite = g_enemy;
   9A39 21 04 00      [10] 1760 	ld	hl,#0x0004
   9A3C 19            [11] 1761 	add	hl,de
   9A3D 36 3A         [10] 1762 	ld	(hl),#<(_g_enemy)
   9A3F 23            [ 6] 1763 	inc	hl
   9A40 36 79         [10] 1764 	ld	(hl),#>(_g_enemy)
                           1765 ;src/main.c:389: actual->muerto = NO;
   9A42 21 08 00      [10] 1766 	ld	hl,#0x0008
   9A45 19            [11] 1767 	add	hl,de
   9A46 36 00         [10] 1768 	ld	(hl),#0x00
                           1769 ;src/main.c:390: actual->muertes = 0;
   9A48 21 0C 00      [10] 1770 	ld	hl,#0x000C
   9A4B 19            [11] 1771 	add	hl,de
   9A4C 36 00         [10] 1772 	ld	(hl),#0x00
                           1773 ;src/main.c:391: actual->patroling = SI;
   9A4E 21 09 00      [10] 1774 	ld	hl,#0x0009
   9A51 19            [11] 1775 	add	hl,de
   9A52 36 01         [10] 1776 	ld	(hl),#0x01
                           1777 ;src/main.c:393: dibujarEnemigo(actual);
   9A54 D5            [11] 1778 	push	de
   9A55 D5            [11] 1779 	push	de
   9A56 CD AF 93      [17] 1780 	call	_dibujarEnemigo
   9A59 F1            [10] 1781 	pop	af
   9A5A D1            [10] 1782 	pop	de
                           1783 ;src/main.c:395: ++actual;
   9A5B 21 0D 00      [10] 1784 	ld	hl,#0x000D
   9A5E 19            [11] 1785 	add	hl,de
   9A5F EB            [ 4] 1786 	ex	de,hl
   9A60 18 96         [12] 1787 	jr	00101$
   9A62                    1788 00104$:
   9A62 33            [ 6] 1789 	inc	sp
   9A63 DD E1         [14] 1790 	pop	ix
   9A65 C9            [10] 1791 	ret
                           1792 ;src/main.c:399: void avanzarMapa() {
                           1793 ;	---------------------------------
                           1794 ; Function avanzarMapa
                           1795 ; ---------------------------------
   9A66                    1796 _avanzarMapa::
                           1797 ;src/main.c:400: if(num_mapa < NUM_MAPAS -1) {
   9A66 3A 3D 91      [13] 1798 	ld	a,(#_num_mapa + 0)
   9A69 D6 02         [ 7] 1799 	sub	a, #0x02
   9A6B 30 34         [12] 1800 	jr	NC,00102$
                           1801 ;src/main.c:401: mapa = mapas[++num_mapa];
   9A6D 01 5B 91      [10] 1802 	ld	bc,#_mapas+0
   9A70 21 3D 91      [10] 1803 	ld	hl, #_num_mapa+0
   9A73 34            [11] 1804 	inc	(hl)
   9A74 FD 21 3D 91   [14] 1805 	ld	iy,#_num_mapa
   9A78 FD 6E 00      [19] 1806 	ld	l,0 (iy)
   9A7B 26 00         [ 7] 1807 	ld	h,#0x00
   9A7D 29            [11] 1808 	add	hl, hl
   9A7E 09            [11] 1809 	add	hl,bc
   9A7F 7E            [ 7] 1810 	ld	a,(hl)
   9A80 FD 21 3B 91   [14] 1811 	ld	iy,#_mapa
   9A84 FD 77 00      [19] 1812 	ld	0 (iy),a
   9A87 23            [ 6] 1813 	inc	hl
   9A88 7E            [ 7] 1814 	ld	a,(hl)
   9A89 32 3C 91      [13] 1815 	ld	(#_mapa + 1),a
                           1816 ;src/main.c:402: prota.x = prota.px = 2;
   9A8C 21 2A 91      [10] 1817 	ld	hl,#(_prota + 0x0002)
   9A8F 36 02         [10] 1818 	ld	(hl),#0x02
   9A91 21 28 91      [10] 1819 	ld	hl,#_prota
   9A94 36 02         [10] 1820 	ld	(hl),#0x02
                           1821 ;src/main.c:403: prota.mover = SI;
   9A96 21 2E 91      [10] 1822 	ld	hl,#(_prota + 0x0006)
   9A99 36 01         [10] 1823 	ld	(hl),#0x01
                           1824 ;src/main.c:404: dibujarMapa();
   9A9B CD 45 91      [17] 1825 	call	_dibujarMapa
                           1826 ;src/main.c:405: inicializarEnemy();
   9A9E C3 E4 99      [10] 1827 	jp  _inicializarEnemy
   9AA1                    1828 00102$:
                           1829 ;src/main.c:408: menuFin(puntuacion);
   9AA1 FD 21 3E 91   [14] 1830 	ld	iy,#_puntuacion
   9AA5 FD 6E 00      [19] 1831 	ld	l,0 (iy)
   9AA8 26 00         [ 7] 1832 	ld	h,#0x00
   9AAA C3 0A 7C      [10] 1833 	jp  _menuFin
                           1834 ;src/main.c:412: void moverIzquierda() {
                           1835 ;	---------------------------------
                           1836 ; Function moverIzquierda
                           1837 ; ---------------------------------
   9AAD                    1838 _moverIzquierda::
                           1839 ;src/main.c:413: prota.mira = M_izquierda;
   9AAD 01 28 91      [10] 1840 	ld	bc,#_prota+0
   9AB0 21 2F 91      [10] 1841 	ld	hl,#(_prota + 0x0007)
   9AB3 36 01         [10] 1842 	ld	(hl),#0x01
                           1843 ;src/main.c:414: if (!checkCollision(M_izquierda)) {
   9AB5 C5            [11] 1844 	push	bc
   9AB6 21 01 00      [10] 1845 	ld	hl,#0x0001
   9AB9 E5            [11] 1846 	push	hl
   9ABA CD 5A 92      [17] 1847 	call	_checkCollision
   9ABD F1            [10] 1848 	pop	af
   9ABE C1            [10] 1849 	pop	bc
   9ABF 7D            [ 4] 1850 	ld	a,l
   9AC0 B7            [ 4] 1851 	or	a, a
   9AC1 C0            [11] 1852 	ret	NZ
                           1853 ;src/main.c:415: prota.x--;
   9AC2 0A            [ 7] 1854 	ld	a,(bc)
   9AC3 C6 FF         [ 7] 1855 	add	a,#0xFF
   9AC5 02            [ 7] 1856 	ld	(bc),a
                           1857 ;src/main.c:416: prota.mover = SI;
   9AC6 21 2E 91      [10] 1858 	ld	hl,#(_prota + 0x0006)
   9AC9 36 01         [10] 1859 	ld	(hl),#0x01
                           1860 ;src/main.c:417: prota.sprite = g_hero_left;
   9ACB 21 C6 7A      [10] 1861 	ld	hl,#_g_hero_left
   9ACE 22 2C 91      [16] 1862 	ld	((_prota + 0x0004)), hl
   9AD1 C9            [10] 1863 	ret
                           1864 ;src/main.c:421: void moverDerecha() {
                           1865 ;	---------------------------------
                           1866 ; Function moverDerecha
                           1867 ; ---------------------------------
   9AD2                    1868 _moverDerecha::
                           1869 ;src/main.c:422: prota.mira = M_derecha;
   9AD2 21 2F 91      [10] 1870 	ld	hl,#(_prota + 0x0007)
   9AD5 36 00         [10] 1871 	ld	(hl),#0x00
                           1872 ;src/main.c:423: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   9AD7 21 00 00      [10] 1873 	ld	hl,#0x0000
   9ADA E5            [11] 1874 	push	hl
   9ADB CD 5A 92      [17] 1875 	call	_checkCollision
   9ADE F1            [10] 1876 	pop	af
   9ADF 45            [ 4] 1877 	ld	b,l
   9AE0 21 28 91      [10] 1878 	ld	hl, #_prota + 0
   9AE3 4E            [ 7] 1879 	ld	c,(hl)
   9AE4 59            [ 4] 1880 	ld	e,c
   9AE5 16 00         [ 7] 1881 	ld	d,#0x00
   9AE7 21 07 00      [10] 1882 	ld	hl,#0x0007
   9AEA 19            [11] 1883 	add	hl,de
   9AEB 11 50 80      [10] 1884 	ld	de, #0x8050
   9AEE 29            [11] 1885 	add	hl, hl
   9AEF 3F            [ 4] 1886 	ccf
   9AF0 CB 1C         [ 8] 1887 	rr	h
   9AF2 CB 1D         [ 8] 1888 	rr	l
   9AF4 ED 52         [15] 1889 	sbc	hl, de
   9AF6 3E 00         [ 7] 1890 	ld	a,#0x00
   9AF8 17            [ 4] 1891 	rla
   9AF9 5F            [ 4] 1892 	ld	e,a
   9AFA 78            [ 4] 1893 	ld	a,b
   9AFB B7            [ 4] 1894 	or	a,a
   9AFC 20 14         [12] 1895 	jr	NZ,00104$
   9AFE B3            [ 4] 1896 	or	a,e
   9AFF 28 11         [12] 1897 	jr	Z,00104$
                           1898 ;src/main.c:424: prota.x++;
   9B01 0C            [ 4] 1899 	inc	c
   9B02 21 28 91      [10] 1900 	ld	hl,#_prota
   9B05 71            [ 7] 1901 	ld	(hl),c
                           1902 ;src/main.c:425: prota.mover = SI;
   9B06 21 2E 91      [10] 1903 	ld	hl,#(_prota + 0x0006)
   9B09 36 01         [10] 1904 	ld	(hl),#0x01
                           1905 ;src/main.c:426: prota.sprite = g_hero;
   9B0B 21 70 7B      [10] 1906 	ld	hl,#_g_hero
   9B0E 22 2C 91      [16] 1907 	ld	((_prota + 0x0004)), hl
   9B11 C9            [10] 1908 	ret
   9B12                    1909 00104$:
                           1910 ;src/main.c:428: }else if( prota.x + G_HERO_W >= 80){
   9B12 7B            [ 4] 1911 	ld	a,e
   9B13 B7            [ 4] 1912 	or	a, a
   9B14 C0            [11] 1913 	ret	NZ
                           1914 ;src/main.c:429: avanzarMapa();
   9B15 C3 66 9A      [10] 1915 	jp  _avanzarMapa
                           1916 ;src/main.c:433: void moverArriba() {
                           1917 ;	---------------------------------
                           1918 ; Function moverArriba
                           1919 ; ---------------------------------
   9B18                    1920 _moverArriba::
                           1921 ;src/main.c:434: prota.mira = M_arriba;
   9B18 21 2F 91      [10] 1922 	ld	hl,#(_prota + 0x0007)
   9B1B 36 02         [10] 1923 	ld	(hl),#0x02
                           1924 ;src/main.c:435: if (!checkCollision(M_arriba)) { 
   9B1D 21 02 00      [10] 1925 	ld	hl,#0x0002
   9B20 E5            [11] 1926 	push	hl
   9B21 CD 5A 92      [17] 1927 	call	_checkCollision
   9B24 F1            [10] 1928 	pop	af
   9B25 7D            [ 4] 1929 	ld	a,l
   9B26 B7            [ 4] 1930 	or	a, a
   9B27 C0            [11] 1931 	ret	NZ
                           1932 ;src/main.c:436: prota.y--;
   9B28 21 29 91      [10] 1933 	ld	hl,#_prota + 1
   9B2B 4E            [ 7] 1934 	ld	c,(hl)
   9B2C 0D            [ 4] 1935 	dec	c
   9B2D 71            [ 7] 1936 	ld	(hl),c
                           1937 ;src/main.c:437: prota.y--;
   9B2E 0D            [ 4] 1938 	dec	c
   9B2F 71            [ 7] 1939 	ld	(hl),c
                           1940 ;src/main.c:438: prota.mover  = SI;
   9B30 21 2E 91      [10] 1941 	ld	hl,#(_prota + 0x0006)
   9B33 36 01         [10] 1942 	ld	(hl),#0x01
                           1943 ;src/main.c:439: prota.sprite = g_hero_up;
   9B35 21 2C 7A      [10] 1944 	ld	hl,#_g_hero_up
   9B38 22 2C 91      [16] 1945 	ld	((_prota + 0x0004)), hl
   9B3B C9            [10] 1946 	ret
                           1947 ;src/main.c:443: void moverAbajo() {
                           1948 ;	---------------------------------
                           1949 ; Function moverAbajo
                           1950 ; ---------------------------------
   9B3C                    1951 _moverAbajo::
                           1952 ;src/main.c:444: prota.mira = M_abajo;
   9B3C 21 2F 91      [10] 1953 	ld	hl,#(_prota + 0x0007)
   9B3F 36 03         [10] 1954 	ld	(hl),#0x03
                           1955 ;src/main.c:445: if (!checkCollision(M_abajo) ) { 
   9B41 21 03 00      [10] 1956 	ld	hl,#0x0003
   9B44 E5            [11] 1957 	push	hl
   9B45 CD 5A 92      [17] 1958 	call	_checkCollision
   9B48 F1            [10] 1959 	pop	af
   9B49 7D            [ 4] 1960 	ld	a,l
   9B4A B7            [ 4] 1961 	or	a, a
   9B4B C0            [11] 1962 	ret	NZ
                           1963 ;src/main.c:446: prota.y++;
   9B4C 01 29 91      [10] 1964 	ld	bc,#_prota + 1
   9B4F 0A            [ 7] 1965 	ld	a,(bc)
   9B50 3C            [ 4] 1966 	inc	a
   9B51 02            [ 7] 1967 	ld	(bc),a
                           1968 ;src/main.c:447: prota.y++;
   9B52 3C            [ 4] 1969 	inc	a
   9B53 02            [ 7] 1970 	ld	(bc),a
                           1971 ;src/main.c:448: prota.mover  = SI;
   9B54 21 2E 91      [10] 1972 	ld	hl,#(_prota + 0x0006)
   9B57 36 01         [10] 1973 	ld	(hl),#0x01
                           1974 ;src/main.c:449: prota.sprite = g_hero_down;
   9B59 21 92 79      [10] 1975 	ld	hl,#_g_hero_down
   9B5C 22 2C 91      [16] 1976 	ld	((_prota + 0x0004)), hl
   9B5F C9            [10] 1977 	ret
                           1978 ;src/main.c:453: void dibujarCuchillo() {
                           1979 ;	---------------------------------
                           1980 ; Function dibujarCuchillo
                           1981 ; ---------------------------------
   9B60                    1982 _dibujarCuchillo::
   9B60 DD E5         [15] 1983 	push	ix
   9B62 DD 21 00 00   [14] 1984 	ld	ix,#0
   9B66 DD 39         [15] 1985 	add	ix,sp
   9B68 F5            [11] 1986 	push	af
                           1987 ;src/main.c:454: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   9B69 21 31 91      [10] 1988 	ld	hl, #_cu + 1
   9B6C 56            [ 7] 1989 	ld	d,(hl)
   9B6D 21 30 91      [10] 1990 	ld	hl, #_cu + 0
   9B70 46            [ 7] 1991 	ld	b,(hl)
   9B71 D5            [11] 1992 	push	de
   9B72 33            [ 6] 1993 	inc	sp
   9B73 C5            [11] 1994 	push	bc
   9B74 33            [ 6] 1995 	inc	sp
   9B75 21 00 C0      [10] 1996 	ld	hl,#0xC000
   9B78 E5            [11] 1997 	push	hl
   9B79 CD 6F 90      [17] 1998 	call	_cpct_getScreenPtr
   9B7C 45            [ 4] 1999 	ld	b,l
   9B7D 5C            [ 4] 2000 	ld	e,h
                           2001 ;src/main.c:455: if(cu.eje == E_X){
   9B7E 21 38 91      [10] 2002 	ld	hl, #_cu + 8
   9B81 4E            [ 7] 2003 	ld	c,(hl)
                           2004 ;src/main.c:456: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   9B82 DD 70 FE      [19] 2005 	ld	-2 (ix),b
   9B85 DD 73 FF      [19] 2006 	ld	-1 (ix),e
                           2007 ;src/main.c:455: if(cu.eje == E_X){
   9B88 79            [ 4] 2008 	ld	a,c
   9B89 B7            [ 4] 2009 	or	a, a
   9B8A 20 19         [12] 2010 	jr	NZ,00104$
                           2011 ;src/main.c:456: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   9B8C 11 00 3E      [10] 2012 	ld	de,#_g_tablatrans+0
   9B8F ED 4B 34 91   [20] 2013 	ld	bc, (#(_cu + 0x0004) + 0)
   9B93 D5            [11] 2014 	push	de
   9B94 21 04 04      [10] 2015 	ld	hl,#0x0404
   9B97 E5            [11] 2016 	push	hl
   9B98 DD 6E FE      [19] 2017 	ld	l,-2 (ix)
   9B9B DD 66 FF      [19] 2018 	ld	h,-1 (ix)
   9B9E E5            [11] 2019 	push	hl
   9B9F C5            [11] 2020 	push	bc
   9BA0 CD 8F 90      [17] 2021 	call	_cpct_drawSpriteMaskedAlignedTable
   9BA3 18 1A         [12] 2022 	jr	00106$
   9BA5                    2023 00104$:
                           2024 ;src/main.c:459: else if(cu.eje == E_Y){
   9BA5 0D            [ 4] 2025 	dec	c
   9BA6 20 17         [12] 2026 	jr	NZ,00106$
                           2027 ;src/main.c:460: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   9BA8 11 00 3E      [10] 2028 	ld	de,#_g_tablatrans+0
   9BAB ED 4B 34 91   [20] 2029 	ld	bc, (#(_cu + 0x0004) + 0)
   9BAF D5            [11] 2030 	push	de
   9BB0 21 02 08      [10] 2031 	ld	hl,#0x0802
   9BB3 E5            [11] 2032 	push	hl
   9BB4 DD 6E FE      [19] 2033 	ld	l,-2 (ix)
   9BB7 DD 66 FF      [19] 2034 	ld	h,-1 (ix)
   9BBA E5            [11] 2035 	push	hl
   9BBB C5            [11] 2036 	push	bc
   9BBC CD 8F 90      [17] 2037 	call	_cpct_drawSpriteMaskedAlignedTable
   9BBF                    2038 00106$:
   9BBF DD F9         [10] 2039 	ld	sp, ix
   9BC1 DD E1         [14] 2040 	pop	ix
   9BC3 C9            [10] 2041 	ret
                           2042 ;src/main.c:464: void borrarCuchillo() {
                           2043 ;	---------------------------------
                           2044 ; Function borrarCuchillo
                           2045 ; ---------------------------------
   9BC4                    2046 _borrarCuchillo::
   9BC4 DD E5         [15] 2047 	push	ix
   9BC6 DD 21 00 00   [14] 2048 	ld	ix,#0
   9BCA DD 39         [15] 2049 	add	ix,sp
   9BCC F5            [11] 2050 	push	af
   9BCD 3B            [ 6] 2051 	dec	sp
                           2052 ;src/main.c:466: u8 w = 2 + (cu.px & 1);
   9BCE 21 32 91      [10] 2053 	ld	hl, #_cu + 2
   9BD1 4E            [ 7] 2054 	ld	c,(hl)
   9BD2 79            [ 4] 2055 	ld	a,c
   9BD3 E6 01         [ 7] 2056 	and	a, #0x01
   9BD5 47            [ 4] 2057 	ld	b,a
   9BD6 04            [ 4] 2058 	inc	b
   9BD7 04            [ 4] 2059 	inc	b
                           2060 ;src/main.c:467: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   9BD8 21 33 91      [10] 2061 	ld	hl, #_cu + 3
   9BDB 5E            [ 7] 2062 	ld	e,(hl)
   9BDC 7B            [ 4] 2063 	ld	a,e
   9BDD E6 03         [ 7] 2064 	and	a, #0x03
   9BDF 28 04         [12] 2065 	jr	Z,00105$
   9BE1 3E 01         [ 7] 2066 	ld	a,#0x01
   9BE3 18 02         [12] 2067 	jr	00106$
   9BE5                    2068 00105$:
   9BE5 3E 00         [ 7] 2069 	ld	a,#0x00
   9BE7                    2070 00106$:
   9BE7 C6 02         [ 7] 2071 	add	a, #0x02
   9BE9 DD 77 FD      [19] 2072 	ld	-3 (ix),a
                           2073 ;src/main.c:468: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   9BEC FD 2A 3B 91   [20] 2074 	ld	iy,(_mapa)
   9BF0 16 00         [ 7] 2075 	ld	d,#0x00
   9BF2 7B            [ 4] 2076 	ld	a,e
   9BF3 C6 E8         [ 7] 2077 	add	a,#0xE8
   9BF5 DD 77 FE      [19] 2078 	ld	-2 (ix),a
   9BF8 7A            [ 4] 2079 	ld	a,d
   9BF9 CE FF         [ 7] 2080 	adc	a,#0xFF
   9BFB DD 77 FF      [19] 2081 	ld	-1 (ix),a
   9BFE DD 6E FE      [19] 2082 	ld	l,-2 (ix)
   9C01 DD 66 FF      [19] 2083 	ld	h,-1 (ix)
   9C04 DD CB FF 7E   [20] 2084 	bit	7, -1 (ix)
   9C08 28 04         [12] 2085 	jr	Z,00107$
   9C0A 21 EB FF      [10] 2086 	ld	hl,#0xFFEB
   9C0D 19            [11] 2087 	add	hl,de
   9C0E                    2088 00107$:
   9C0E CB 2C         [ 8] 2089 	sra	h
   9C10 CB 1D         [ 8] 2090 	rr	l
   9C12 CB 2C         [ 8] 2091 	sra	h
   9C14 CB 1D         [ 8] 2092 	rr	l
   9C16 55            [ 4] 2093 	ld	d,l
   9C17 CB 39         [ 8] 2094 	srl	c
   9C19 FD E5         [15] 2095 	push	iy
   9C1B 21 F0 C0      [10] 2096 	ld	hl,#0xC0F0
   9C1E E5            [11] 2097 	push	hl
   9C1F 3E 28         [ 7] 2098 	ld	a,#0x28
   9C21 F5            [11] 2099 	push	af
   9C22 33            [ 6] 2100 	inc	sp
   9C23 DD 7E FD      [19] 2101 	ld	a,-3 (ix)
   9C26 F5            [11] 2102 	push	af
   9C27 33            [ 6] 2103 	inc	sp
   9C28 C5            [11] 2104 	push	bc
   9C29 33            [ 6] 2105 	inc	sp
   9C2A D5            [11] 2106 	push	de
   9C2B 33            [ 6] 2107 	inc	sp
   9C2C 79            [ 4] 2108 	ld	a,c
   9C2D F5            [11] 2109 	push	af
   9C2E 33            [ 6] 2110 	inc	sp
   9C2F CD 51 85      [17] 2111 	call	_cpct_etm_drawTileBox2x4
                           2112 ;src/main.c:469: if(!cu.mover){
   9C32 3A 39 91      [13] 2113 	ld	a, (#_cu + 9)
   9C35 B7            [ 4] 2114 	or	a, a
   9C36 20 05         [12] 2115 	jr	NZ,00103$
                           2116 ;src/main.c:470: cu.lanzado = NO;
   9C38 21 36 91      [10] 2117 	ld	hl,#(_cu + 0x0006)
   9C3B 36 00         [10] 2118 	ld	(hl),#0x00
   9C3D                    2119 00103$:
   9C3D DD F9         [10] 2120 	ld	sp, ix
   9C3F DD E1         [14] 2121 	pop	ix
   9C41 C9            [10] 2122 	ret
                           2123 ;src/main.c:474: void redibujarCuchillo( ) {
                           2124 ;	---------------------------------
                           2125 ; Function redibujarCuchillo
                           2126 ; ---------------------------------
   9C42                    2127 _redibujarCuchillo::
                           2128 ;src/main.c:475: borrarCuchillo();
   9C42 CD C4 9B      [17] 2129 	call	_borrarCuchillo
                           2130 ;src/main.c:476: cu.px = cu.x;
   9C45 01 32 91      [10] 2131 	ld	bc,#_cu + 2
   9C48 3A 30 91      [13] 2132 	ld	a, (#_cu + 0)
   9C4B 02            [ 7] 2133 	ld	(bc),a
                           2134 ;src/main.c:477: cu.py = cu.y;
   9C4C 01 33 91      [10] 2135 	ld	bc,#_cu + 3
   9C4F 3A 31 91      [13] 2136 	ld	a, (#_cu + 1)
   9C52 02            [ 7] 2137 	ld	(bc),a
                           2138 ;src/main.c:478: dibujarCuchillo();
   9C53 C3 60 9B      [10] 2139 	jp  _dibujarCuchillo
                           2140 ;src/main.c:481: void lanzarCuchillo(){
                           2141 ;	---------------------------------
                           2142 ; Function lanzarCuchillo
                           2143 ; ---------------------------------
   9C56                    2144 _lanzarCuchillo::
                           2145 ;src/main.c:483: if(!cu.lanzado){
   9C56 3A 36 91      [13] 2146 	ld	a, (#(_cu + 0x0006) + 0)
   9C59 B7            [ 4] 2147 	or	a, a
   9C5A C0            [11] 2148 	ret	NZ
                           2149 ;src/main.c:485: if(prota.mira == M_derecha){
   9C5B 21 2F 91      [10] 2150 	ld	hl, #_prota + 7
   9C5E 5E            [ 7] 2151 	ld	e,(hl)
                           2152 ;src/main.c:486: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   9C5F 01 29 91      [10] 2153 	ld	bc,#_prota + 1
                           2154 ;src/main.c:488: cu.direccion = M_derecha;
                           2155 ;src/main.c:490: cu.y=prota.y + G_HERO_H /2;
                           2156 ;src/main.c:491: cu.sprite=g_knifeX_0;
                           2157 ;src/main.c:492: cu.eje = E_X;
                           2158 ;src/main.c:485: if(prota.mira == M_derecha){
   9C62 7B            [ 4] 2159 	ld	a,e
   9C63 B7            [ 4] 2160 	or	a, a
   9C64 20 41         [12] 2161 	jr	NZ,00118$
                           2162 ;src/main.c:486: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   9C66 0A            [ 7] 2163 	ld	a,(bc)
   9C67 C6 0B         [ 7] 2164 	add	a, #0x0B
   9C69 5F            [ 4] 2165 	ld	e,a
   9C6A 3A 28 91      [13] 2166 	ld	a, (#_prota + 0)
   9C6D C6 0C         [ 7] 2167 	add	a, #0x0C
   9C6F 6F            [ 4] 2168 	ld	l,a
   9C70 C5            [11] 2169 	push	bc
   9C71 7B            [ 4] 2170 	ld	a,e
   9C72 F5            [11] 2171 	push	af
   9C73 33            [ 6] 2172 	inc	sp
   9C74 7D            [ 4] 2173 	ld	a,l
   9C75 F5            [11] 2174 	push	af
   9C76 33            [ 6] 2175 	inc	sp
   9C77 CD 19 92      [17] 2176 	call	_getTilePtr
   9C7A F1            [10] 2177 	pop	af
   9C7B C1            [10] 2178 	pop	bc
   9C7C 5E            [ 7] 2179 	ld	e,(hl)
   9C7D 3E 02         [ 7] 2180 	ld	a,#0x02
   9C7F 93            [ 4] 2181 	sub	a, e
   9C80 D8            [11] 2182 	ret	C
                           2183 ;src/main.c:487: cu.lanzado = SI;
   9C81 21 36 91      [10] 2184 	ld	hl,#(_cu + 0x0006)
   9C84 36 01         [10] 2185 	ld	(hl),#0x01
                           2186 ;src/main.c:488: cu.direccion = M_derecha;
   9C86 21 37 91      [10] 2187 	ld	hl,#(_cu + 0x0007)
   9C89 36 00         [10] 2188 	ld	(hl),#0x00
                           2189 ;src/main.c:489: cu.x=prota.x + G_HERO_W;
   9C8B 3A 28 91      [13] 2190 	ld	a, (#_prota + 0)
   9C8E C6 07         [ 7] 2191 	add	a, #0x07
   9C90 32 30 91      [13] 2192 	ld	(#_cu),a
                           2193 ;src/main.c:490: cu.y=prota.y + G_HERO_H /2;
   9C93 0A            [ 7] 2194 	ld	a,(bc)
   9C94 C6 0B         [ 7] 2195 	add	a, #0x0B
   9C96 32 31 91      [13] 2196 	ld	(#(_cu + 0x0001)),a
                           2197 ;src/main.c:491: cu.sprite=g_knifeX_0;
   9C99 21 C0 54      [10] 2198 	ld	hl,#_g_knifeX_0
   9C9C 22 34 91      [16] 2199 	ld	((_cu + 0x0004)), hl
                           2200 ;src/main.c:492: cu.eje = E_X;
   9C9F 21 38 91      [10] 2201 	ld	hl,#(_cu + 0x0008)
   9CA2 36 00         [10] 2202 	ld	(hl),#0x00
                           2203 ;src/main.c:493: dibujarCuchillo();
   9CA4 C3 60 9B      [10] 2204 	jp  _dibujarCuchillo
   9CA7                    2205 00118$:
                           2206 ;src/main.c:496: else if(prota.mira == M_izquierda){
   9CA7 7B            [ 4] 2207 	ld	a,e
   9CA8 3D            [ 4] 2208 	dec	a
   9CA9 20 41         [12] 2209 	jr	NZ,00115$
                           2210 ;src/main.c:497: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   9CAB 0A            [ 7] 2211 	ld	a,(bc)
   9CAC C6 0B         [ 7] 2212 	add	a, #0x0B
   9CAE 5F            [ 4] 2213 	ld	e,a
   9CAF 3A 28 91      [13] 2214 	ld	a, (#_prota + 0)
   9CB2 C6 F6         [ 7] 2215 	add	a,#0xF6
   9CB4 6F            [ 4] 2216 	ld	l,a
   9CB5 C5            [11] 2217 	push	bc
   9CB6 7B            [ 4] 2218 	ld	a,e
   9CB7 F5            [11] 2219 	push	af
   9CB8 33            [ 6] 2220 	inc	sp
   9CB9 7D            [ 4] 2221 	ld	a,l
   9CBA F5            [11] 2222 	push	af
   9CBB 33            [ 6] 2223 	inc	sp
   9CBC CD 19 92      [17] 2224 	call	_getTilePtr
   9CBF F1            [10] 2225 	pop	af
   9CC0 C1            [10] 2226 	pop	bc
   9CC1 5E            [ 7] 2227 	ld	e,(hl)
   9CC2 3E 02         [ 7] 2228 	ld	a,#0x02
   9CC4 93            [ 4] 2229 	sub	a, e
   9CC5 D8            [11] 2230 	ret	C
                           2231 ;src/main.c:498: cu.lanzado = SI;
   9CC6 21 36 91      [10] 2232 	ld	hl,#(_cu + 0x0006)
   9CC9 36 01         [10] 2233 	ld	(hl),#0x01
                           2234 ;src/main.c:499: cu.direccion = M_izquierda;
   9CCB 21 37 91      [10] 2235 	ld	hl,#(_cu + 0x0007)
   9CCE 36 01         [10] 2236 	ld	(hl),#0x01
                           2237 ;src/main.c:500: cu.x = prota.x - G_KNIFEX_0_W;
   9CD0 3A 28 91      [13] 2238 	ld	a, (#_prota + 0)
   9CD3 C6 FC         [ 7] 2239 	add	a,#0xFC
   9CD5 32 30 91      [13] 2240 	ld	(#_cu),a
                           2241 ;src/main.c:501: cu.y = prota.y + G_HERO_H /2;
   9CD8 0A            [ 7] 2242 	ld	a,(bc)
   9CD9 C6 0B         [ 7] 2243 	add	a, #0x0B
   9CDB 32 31 91      [13] 2244 	ld	(#(_cu + 0x0001)),a
                           2245 ;src/main.c:502: cu.sprite = g_knifeX_1;
   9CDE 21 D0 54      [10] 2246 	ld	hl,#_g_knifeX_1
   9CE1 22 34 91      [16] 2247 	ld	((_cu + 0x0004)), hl
                           2248 ;src/main.c:503: cu.eje = E_X;
   9CE4 21 38 91      [10] 2249 	ld	hl,#(_cu + 0x0008)
   9CE7 36 00         [10] 2250 	ld	(hl),#0x00
                           2251 ;src/main.c:504: dibujarCuchillo();
   9CE9 C3 60 9B      [10] 2252 	jp  _dibujarCuchillo
   9CEC                    2253 00115$:
                           2254 ;src/main.c:507: else if(prota.mira == M_abajo){
   9CEC 7B            [ 4] 2255 	ld	a,e
   9CED D6 03         [ 7] 2256 	sub	a, #0x03
   9CEF 20 41         [12] 2257 	jr	NZ,00112$
                           2258 ;src/main.c:509: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   9CF1 0A            [ 7] 2259 	ld	a,(bc)
   9CF2 C6 1F         [ 7] 2260 	add	a, #0x1F
   9CF4 5F            [ 4] 2261 	ld	e,a
   9CF5 3A 28 91      [13] 2262 	ld	a, (#_prota + 0)
   9CF8 57            [ 4] 2263 	ld	d,a
   9CF9 14            [ 4] 2264 	inc	d
   9CFA 14            [ 4] 2265 	inc	d
   9CFB 14            [ 4] 2266 	inc	d
   9CFC C5            [11] 2267 	push	bc
   9CFD 7B            [ 4] 2268 	ld	a,e
   9CFE F5            [11] 2269 	push	af
   9CFF 33            [ 6] 2270 	inc	sp
   9D00 D5            [11] 2271 	push	de
   9D01 33            [ 6] 2272 	inc	sp
   9D02 CD 19 92      [17] 2273 	call	_getTilePtr
   9D05 F1            [10] 2274 	pop	af
   9D06 C1            [10] 2275 	pop	bc
   9D07 5E            [ 7] 2276 	ld	e,(hl)
   9D08 3E 02         [ 7] 2277 	ld	a,#0x02
   9D0A 93            [ 4] 2278 	sub	a, e
   9D0B D8            [11] 2279 	ret	C
                           2280 ;src/main.c:510: cu.lanzado = SI;
   9D0C 21 36 91      [10] 2281 	ld	hl,#(_cu + 0x0006)
   9D0F 36 01         [10] 2282 	ld	(hl),#0x01
                           2283 ;src/main.c:511: cu.direccion = M_abajo;
   9D11 21 37 91      [10] 2284 	ld	hl,#(_cu + 0x0007)
   9D14 36 03         [10] 2285 	ld	(hl),#0x03
                           2286 ;src/main.c:512: cu.x = prota.x + G_HERO_W / 2;
   9D16 3A 28 91      [13] 2287 	ld	a, (#_prota + 0)
   9D19 C6 03         [ 7] 2288 	add	a, #0x03
   9D1B 32 30 91      [13] 2289 	ld	(#_cu),a
                           2290 ;src/main.c:513: cu.y = prota.y + G_HERO_H;
   9D1E 0A            [ 7] 2291 	ld	a,(bc)
   9D1F C6 16         [ 7] 2292 	add	a, #0x16
   9D21 32 31 91      [13] 2293 	ld	(#(_cu + 0x0001)),a
                           2294 ;src/main.c:514: cu.sprite = g_knifeY_0;
   9D24 21 A0 54      [10] 2295 	ld	hl,#_g_knifeY_0
   9D27 22 34 91      [16] 2296 	ld	((_cu + 0x0004)), hl
                           2297 ;src/main.c:515: cu.eje = E_Y;
   9D2A 21 38 91      [10] 2298 	ld	hl,#(_cu + 0x0008)
   9D2D 36 01         [10] 2299 	ld	(hl),#0x01
                           2300 ;src/main.c:516: dibujarCuchillo();
   9D2F C3 60 9B      [10] 2301 	jp  _dibujarCuchillo
   9D32                    2302 00112$:
                           2303 ;src/main.c:519: else if(prota.mira == M_arriba){
   9D32 7B            [ 4] 2304 	ld	a,e
   9D33 D6 02         [ 7] 2305 	sub	a, #0x02
   9D35 C0            [11] 2306 	ret	NZ
                           2307 ;src/main.c:520: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   9D36 0A            [ 7] 2308 	ld	a,(bc)
   9D37 C6 F7         [ 7] 2309 	add	a,#0xF7
   9D39 57            [ 4] 2310 	ld	d,a
   9D3A 3A 28 91      [13] 2311 	ld	a, (#_prota + 0)
   9D3D C6 03         [ 7] 2312 	add	a, #0x03
   9D3F C5            [11] 2313 	push	bc
   9D40 D5            [11] 2314 	push	de
   9D41 33            [ 6] 2315 	inc	sp
   9D42 F5            [11] 2316 	push	af
   9D43 33            [ 6] 2317 	inc	sp
   9D44 CD 19 92      [17] 2318 	call	_getTilePtr
   9D47 F1            [10] 2319 	pop	af
   9D48 C1            [10] 2320 	pop	bc
   9D49 5E            [ 7] 2321 	ld	e,(hl)
   9D4A 3E 02         [ 7] 2322 	ld	a,#0x02
   9D4C 93            [ 4] 2323 	sub	a, e
   9D4D D8            [11] 2324 	ret	C
                           2325 ;src/main.c:521: cu.lanzado = SI;
   9D4E 21 36 91      [10] 2326 	ld	hl,#(_cu + 0x0006)
   9D51 36 01         [10] 2327 	ld	(hl),#0x01
                           2328 ;src/main.c:522: cu.direccion = M_arriba;
   9D53 21 37 91      [10] 2329 	ld	hl,#(_cu + 0x0007)
   9D56 36 02         [10] 2330 	ld	(hl),#0x02
                           2331 ;src/main.c:523: cu.x = prota.x + G_HERO_W / 2;
   9D58 3A 28 91      [13] 2332 	ld	a, (#_prota + 0)
   9D5B C6 03         [ 7] 2333 	add	a, #0x03
   9D5D 32 30 91      [13] 2334 	ld	(#_cu),a
                           2335 ;src/main.c:524: cu.y = prota.y;
   9D60 0A            [ 7] 2336 	ld	a,(bc)
   9D61 32 31 91      [13] 2337 	ld	(#(_cu + 0x0001)),a
                           2338 ;src/main.c:525: cu.sprite = g_knifeY_1;
   9D64 21 B0 54      [10] 2339 	ld	hl,#_g_knifeY_1
   9D67 22 34 91      [16] 2340 	ld	((_cu + 0x0004)), hl
                           2341 ;src/main.c:526: cu.eje = E_Y;
   9D6A 21 38 91      [10] 2342 	ld	hl,#(_cu + 0x0008)
   9D6D 36 01         [10] 2343 	ld	(hl),#0x01
                           2344 ;src/main.c:527: dibujarCuchillo();
   9D6F C3 60 9B      [10] 2345 	jp  _dibujarCuchillo
                           2346 ;src/main.c:533: void comprobarTeclado() {
                           2347 ;	---------------------------------
                           2348 ; Function comprobarTeclado
                           2349 ; ---------------------------------
   9D72                    2350 _comprobarTeclado::
                           2351 ;src/main.c:534: cpct_scanKeyboard_if();
   9D72 CD A9 86      [17] 2352 	call	_cpct_scanKeyboard_if
                           2353 ;src/main.c:536: if (cpct_isAnyKeyPressed()) {
   9D75 CD 9C 86      [17] 2354 	call	_cpct_isAnyKeyPressed
   9D78 7D            [ 4] 2355 	ld	a,l
   9D79 B7            [ 4] 2356 	or	a, a
   9D7A C8            [11] 2357 	ret	Z
                           2358 ;src/main.c:537: if (cpct_isKeyPressed(Key_CursorLeft))
   9D7B 21 01 01      [10] 2359 	ld	hl,#0x0101
   9D7E CD 70 84      [17] 2360 	call	_cpct_isKeyPressed
   9D81 7D            [ 4] 2361 	ld	a,l
   9D82 B7            [ 4] 2362 	or	a, a
                           2363 ;src/main.c:538: moverIzquierda();
   9D83 C2 AD 9A      [10] 2364 	jp	NZ,_moverIzquierda
                           2365 ;src/main.c:539: else if (cpct_isKeyPressed(Key_CursorRight))
   9D86 21 00 02      [10] 2366 	ld	hl,#0x0200
   9D89 CD 70 84      [17] 2367 	call	_cpct_isKeyPressed
   9D8C 7D            [ 4] 2368 	ld	a,l
   9D8D B7            [ 4] 2369 	or	a, a
                           2370 ;src/main.c:540: moverDerecha();
   9D8E C2 D2 9A      [10] 2371 	jp	NZ,_moverDerecha
                           2372 ;src/main.c:541: else if (cpct_isKeyPressed(Key_CursorUp))
   9D91 21 00 01      [10] 2373 	ld	hl,#0x0100
   9D94 CD 70 84      [17] 2374 	call	_cpct_isKeyPressed
   9D97 7D            [ 4] 2375 	ld	a,l
   9D98 B7            [ 4] 2376 	or	a, a
                           2377 ;src/main.c:542: moverArriba();
   9D99 C2 18 9B      [10] 2378 	jp	NZ,_moverArriba
                           2379 ;src/main.c:543: else if (cpct_isKeyPressed(Key_CursorDown))
   9D9C 21 00 04      [10] 2380 	ld	hl,#0x0400
   9D9F CD 70 84      [17] 2381 	call	_cpct_isKeyPressed
   9DA2 7D            [ 4] 2382 	ld	a,l
   9DA3 B7            [ 4] 2383 	or	a, a
                           2384 ;src/main.c:544: moverAbajo();
   9DA4 C2 3C 9B      [10] 2385 	jp	NZ,_moverAbajo
                           2386 ;src/main.c:545: else if (cpct_isKeyPressed(Key_Space))
   9DA7 21 05 80      [10] 2387 	ld	hl,#0x8005
   9DAA CD 70 84      [17] 2388 	call	_cpct_isKeyPressed
   9DAD 7D            [ 4] 2389 	ld	a,l
   9DAE B7            [ 4] 2390 	or	a, a
   9DAF C8            [11] 2391 	ret	Z
                           2392 ;src/main.c:546: lanzarCuchillo();
   9DB0 C3 56 9C      [10] 2393 	jp  _lanzarCuchillo
                           2394 ;src/main.c:550: u8 checkKnifeCollision(int direction, u8 xoff, u8 yoff){ // TODO: el parámetro direction no se usa
                           2395 ;	---------------------------------
                           2396 ; Function checkKnifeCollision
                           2397 ; ---------------------------------
   9DB3                    2398 _checkKnifeCollision::
                           2399 ;src/main.c:552: return *getTilePtr(cu.x + xoff, cu.y + yoff) <= 2;
   9DB3 3A 31 91      [13] 2400 	ld	a,(#_cu + 1)
   9DB6 21 05 00      [10] 2401 	ld	hl,#5
   9DB9 39            [11] 2402 	add	hl,sp
   9DBA 86            [ 7] 2403 	add	a, (hl)
   9DBB 47            [ 4] 2404 	ld	b,a
   9DBC 3A 30 91      [13] 2405 	ld	a,(#_cu + 0)
   9DBF 21 04 00      [10] 2406 	ld	hl,#4
   9DC2 39            [11] 2407 	add	hl,sp
   9DC3 86            [ 7] 2408 	add	a, (hl)
   9DC4 4F            [ 4] 2409 	ld	c,a
   9DC5 C5            [11] 2410 	push	bc
   9DC6 CD 19 92      [17] 2411 	call	_getTilePtr
   9DC9 F1            [10] 2412 	pop	af
   9DCA 4E            [ 7] 2413 	ld	c,(hl)
   9DCB 3E 02         [ 7] 2414 	ld	a,#0x02
   9DCD 91            [ 4] 2415 	sub	a, c
   9DCE 3E 00         [ 7] 2416 	ld	a,#0x00
   9DD0 17            [ 4] 2417 	rla
   9DD1 EE 01         [ 7] 2418 	xor	a, #0x01
   9DD3 6F            [ 4] 2419 	ld	l, a
   9DD4 C9            [10] 2420 	ret
                           2421 ;src/main.c:555: void moverCuchillo(){
                           2422 ;	---------------------------------
                           2423 ; Function moverCuchillo
                           2424 ; ---------------------------------
   9DD5                    2425 _moverCuchillo::
                           2426 ;src/main.c:556: if(cu.lanzado){
   9DD5 01 30 91      [10] 2427 	ld	bc,#_cu+0
   9DD8 3A 36 91      [13] 2428 	ld	a, (#_cu + 6)
   9DDB B7            [ 4] 2429 	or	a, a
   9DDC C8            [11] 2430 	ret	Z
                           2431 ;src/main.c:557: cu.mover = SI;
   9DDD 21 09 00      [10] 2432 	ld	hl,#0x0009
   9DE0 09            [11] 2433 	add	hl,bc
   9DE1 EB            [ 4] 2434 	ex	de,hl
   9DE2 3E 01         [ 7] 2435 	ld	a,#0x01
   9DE4 12            [ 7] 2436 	ld	(de),a
                           2437 ;src/main.c:558: if(cu.direccion == M_derecha){
   9DE5 21 37 91      [10] 2438 	ld	hl, #_cu + 7
   9DE8 6E            [ 7] 2439 	ld	l,(hl)
   9DE9 7D            [ 4] 2440 	ld	a,l
   9DEA B7            [ 4] 2441 	or	a, a
   9DEB 20 1E         [12] 2442 	jr	NZ,00122$
                           2443 ;src/main.c:560: if(checkKnifeCollision(M_derecha, G_KNIFEX_0_W + 1, 0)){
   9DED C5            [11] 2444 	push	bc
   9DEE D5            [11] 2445 	push	de
   9DEF 21 05 00      [10] 2446 	ld	hl,#0x0005
   9DF2 E5            [11] 2447 	push	hl
   9DF3 2E 00         [ 7] 2448 	ld	l, #0x00
   9DF5 E5            [11] 2449 	push	hl
   9DF6 CD B3 9D      [17] 2450 	call	_checkKnifeCollision
   9DF9 F1            [10] 2451 	pop	af
   9DFA F1            [10] 2452 	pop	af
   9DFB D1            [10] 2453 	pop	de
   9DFC C1            [10] 2454 	pop	bc
   9DFD 7D            [ 4] 2455 	ld	a,l
   9DFE B7            [ 4] 2456 	or	a, a
   9DFF 28 07         [12] 2457 	jr	Z,00102$
                           2458 ;src/main.c:561: cu.mover = SI;
   9E01 3E 01         [ 7] 2459 	ld	a,#0x01
   9E03 12            [ 7] 2460 	ld	(de),a
                           2461 ;src/main.c:562: cu.x++;
   9E04 0A            [ 7] 2462 	ld	a,(bc)
   9E05 3C            [ 4] 2463 	inc	a
   9E06 02            [ 7] 2464 	ld	(bc),a
   9E07 C9            [10] 2465 	ret
   9E08                    2466 00102$:
                           2467 ;src/main.c:565: cu.mover=NO;
   9E08 AF            [ 4] 2468 	xor	a, a
   9E09 12            [ 7] 2469 	ld	(de),a
   9E0A C9            [10] 2470 	ret
   9E0B                    2471 00122$:
                           2472 ;src/main.c:568: else if(cu.direccion == M_izquierda){
   9E0B 7D            [ 4] 2473 	ld	a,l
   9E0C 3D            [ 4] 2474 	dec	a
   9E0D 20 1F         [12] 2475 	jr	NZ,00119$
                           2476 ;src/main.c:569: if(checkKnifeCollision(M_derecha, -1, 0)){
   9E0F C5            [11] 2477 	push	bc
   9E10 D5            [11] 2478 	push	de
   9E11 21 FF 00      [10] 2479 	ld	hl,#0x00FF
   9E14 E5            [11] 2480 	push	hl
   9E15 2E 00         [ 7] 2481 	ld	l, #0x00
   9E17 E5            [11] 2482 	push	hl
   9E18 CD B3 9D      [17] 2483 	call	_checkKnifeCollision
   9E1B F1            [10] 2484 	pop	af
   9E1C F1            [10] 2485 	pop	af
   9E1D D1            [10] 2486 	pop	de
   9E1E C1            [10] 2487 	pop	bc
   9E1F 7D            [ 4] 2488 	ld	a,l
   9E20 B7            [ 4] 2489 	or	a, a
   9E21 28 08         [12] 2490 	jr	Z,00105$
                           2491 ;src/main.c:570: cu.mover = SI;
   9E23 3E 01         [ 7] 2492 	ld	a,#0x01
   9E25 12            [ 7] 2493 	ld	(de),a
                           2494 ;src/main.c:571: cu.x--;
   9E26 0A            [ 7] 2495 	ld	a,(bc)
   9E27 C6 FF         [ 7] 2496 	add	a,#0xFF
   9E29 02            [ 7] 2497 	ld	(bc),a
   9E2A C9            [10] 2498 	ret
   9E2B                    2499 00105$:
                           2500 ;src/main.c:573: cu.mover=NO;
   9E2B AF            [ 4] 2501 	xor	a, a
   9E2C 12            [ 7] 2502 	ld	(de),a
   9E2D C9            [10] 2503 	ret
   9E2E                    2504 00119$:
                           2505 ;src/main.c:579: cu.y--;
   9E2E 03            [ 6] 2506 	inc	bc
                           2507 ;src/main.c:576: else if(cu.direccion == M_arriba){
   9E2F 7D            [ 4] 2508 	ld	a,l
   9E30 D6 02         [ 7] 2509 	sub	a, #0x02
   9E32 20 22         [12] 2510 	jr	NZ,00116$
                           2511 ;src/main.c:577: if(checkKnifeCollision(M_derecha, 0, -2)){
   9E34 C5            [11] 2512 	push	bc
   9E35 D5            [11] 2513 	push	de
   9E36 21 00 FE      [10] 2514 	ld	hl,#0xFE00
   9E39 E5            [11] 2515 	push	hl
   9E3A 26 00         [ 7] 2516 	ld	h, #0x00
   9E3C E5            [11] 2517 	push	hl
   9E3D CD B3 9D      [17] 2518 	call	_checkKnifeCollision
   9E40 F1            [10] 2519 	pop	af
   9E41 F1            [10] 2520 	pop	af
   9E42 D1            [10] 2521 	pop	de
   9E43 C1            [10] 2522 	pop	bc
   9E44 7D            [ 4] 2523 	ld	a,l
   9E45 B7            [ 4] 2524 	or	a, a
   9E46 28 0B         [12] 2525 	jr	Z,00108$
                           2526 ;src/main.c:578: cu.mover = SI;
   9E48 3E 01         [ 7] 2527 	ld	a,#0x01
   9E4A 12            [ 7] 2528 	ld	(de),a
                           2529 ;src/main.c:579: cu.y--;
   9E4B 0A            [ 7] 2530 	ld	a,(bc)
   9E4C C6 FF         [ 7] 2531 	add	a,#0xFF
   9E4E 02            [ 7] 2532 	ld	(bc),a
                           2533 ;src/main.c:580: cu.y--;
   9E4F C6 FF         [ 7] 2534 	add	a,#0xFF
   9E51 02            [ 7] 2535 	ld	(bc),a
   9E52 C9            [10] 2536 	ret
   9E53                    2537 00108$:
                           2538 ;src/main.c:583: cu.mover=NO;
   9E53 AF            [ 4] 2539 	xor	a, a
   9E54 12            [ 7] 2540 	ld	(de),a
   9E55 C9            [10] 2541 	ret
   9E56                    2542 00116$:
                           2543 ;src/main.c:586: else if(cu.direccion == M_abajo){
   9E56 7D            [ 4] 2544 	ld	a,l
   9E57 D6 03         [ 7] 2545 	sub	a, #0x03
   9E59 C0            [11] 2546 	ret	NZ
                           2547 ;src/main.c:587: if(checkKnifeCollision(M_derecha, 0, G_KNIFEY_0_H + 2)){
   9E5A C5            [11] 2548 	push	bc
   9E5B D5            [11] 2549 	push	de
   9E5C 21 00 0A      [10] 2550 	ld	hl,#0x0A00
   9E5F E5            [11] 2551 	push	hl
   9E60 26 00         [ 7] 2552 	ld	h, #0x00
   9E62 E5            [11] 2553 	push	hl
   9E63 CD B3 9D      [17] 2554 	call	_checkKnifeCollision
   9E66 F1            [10] 2555 	pop	af
   9E67 F1            [10] 2556 	pop	af
   9E68 D1            [10] 2557 	pop	de
   9E69 C1            [10] 2558 	pop	bc
   9E6A 7D            [ 4] 2559 	ld	a,l
   9E6B B7            [ 4] 2560 	or	a, a
   9E6C 28 09         [12] 2561 	jr	Z,00111$
                           2562 ;src/main.c:588: cu.mover = SI;
   9E6E 3E 01         [ 7] 2563 	ld	a,#0x01
   9E70 12            [ 7] 2564 	ld	(de),a
                           2565 ;src/main.c:589: cu.y++;
   9E71 0A            [ 7] 2566 	ld	a,(bc)
   9E72 3C            [ 4] 2567 	inc	a
   9E73 02            [ 7] 2568 	ld	(bc),a
                           2569 ;src/main.c:590: cu.y++;
   9E74 3C            [ 4] 2570 	inc	a
   9E75 02            [ 7] 2571 	ld	(bc),a
   9E76 C9            [10] 2572 	ret
   9E77                    2573 00111$:
                           2574 ;src/main.c:593: cu.mover=NO;
   9E77 AF            [ 4] 2575 	xor	a, a
   9E78 12            [ 7] 2576 	ld	(de),a
   9E79 C9            [10] 2577 	ret
                           2578 ;src/main.c:600: void intHandler() {
                           2579 ;	---------------------------------
                           2580 ; Function intHandler
                           2581 ; ---------------------------------
   9E7A                    2582 _intHandler::
                           2583 ;src/main.c:601: if (++i == 6) {
   9E7A 21 3A 91      [10] 2584 	ld	hl, #_i+0
   9E7D 34            [11] 2585 	inc	(hl)
   9E7E 3A 3A 91      [13] 2586 	ld	a,(#_i + 0)
   9E81 D6 06         [ 7] 2587 	sub	a, #0x06
   9E83 C0            [11] 2588 	ret	NZ
                           2589 ;src/main.c:602: play();
   9E84 CD 9E 83      [17] 2590 	call	_play
                           2591 ;src/main.c:603: i=0;
   9E87 21 3A 91      [10] 2592 	ld	hl,#_i + 0
   9E8A 36 00         [10] 2593 	ld	(hl), #0x00
   9E8C C9            [10] 2594 	ret
                           2595 ;src/main.c:607: void inicializarCPC() {
                           2596 ;	---------------------------------
                           2597 ; Function inicializarCPC
                           2598 ; ---------------------------------
   9E8D                    2599 _inicializarCPC::
                           2600 ;src/main.c:608: cpct_disableFirmware();
   9E8D CD 6E 8F      [17] 2601 	call	_cpct_disableFirmware
                           2602 ;src/main.c:609: cpct_setVideoMode(0);
   9E90 2E 00         [ 7] 2603 	ld	l,#0x00
   9E92 CD 19 87      [17] 2604 	call	_cpct_setVideoMode
                           2605 ;src/main.c:610: cpct_setBorder(HW_BLACK);
   9E95 21 10 14      [10] 2606 	ld	hl,#0x1410
   9E98 E5            [11] 2607 	push	hl
   9E99 CD 7C 84      [17] 2608 	call	_cpct_setPALColour
                           2609 ;src/main.c:611: cpct_setPalette(g_palette, 16);
   9E9C 21 10 00      [10] 2610 	ld	hl,#0x0010
   9E9F E5            [11] 2611 	push	hl
   9EA0 21 60 7B      [10] 2612 	ld	hl,#_g_palette
   9EA3 E5            [11] 2613 	push	hl
   9EA4 CD 59 84      [17] 2614 	call	_cpct_setPalette
                           2615 ;src/main.c:612: cpct_akp_musicInit(g_song);
   9EA7 21 00 30      [10] 2616 	ld	hl,#_g_song
   9EAA E5            [11] 2617 	push	hl
   9EAB CD 4A 8E      [17] 2618 	call	_cpct_akp_musicInit
   9EAE F1            [10] 2619 	pop	af
                           2620 ;src/main.c:613: cpct_setInterruptHandler(intHandler);
   9EAF 21 7A 9E      [10] 2621 	ld	hl,#_intHandler
   9EB2 CD CA 90      [17] 2622 	call	_cpct_setInterruptHandler
   9EB5 C9            [10] 2623 	ret
                           2624 ;src/main.c:616: void inicializarJuego() {
                           2625 ;	---------------------------------
                           2626 ; Function inicializarJuego
                           2627 ; ---------------------------------
   9EB6                    2628 _inicializarJuego::
                           2629 ;src/main.c:618: num_mapa = 0;
   9EB6 21 3D 91      [10] 2630 	ld	hl,#_num_mapa + 0
   9EB9 36 00         [10] 2631 	ld	(hl), #0x00
                           2632 ;src/main.c:619: mapa = mapas[num_mapa];
   9EBB 21 5B 91      [10] 2633 	ld	hl, #_mapas + 0
   9EBE 7E            [ 7] 2634 	ld	a,(hl)
   9EBF FD 21 3B 91   [14] 2635 	ld	iy,#_mapa
   9EC3 FD 77 00      [19] 2636 	ld	0 (iy),a
   9EC6 23            [ 6] 2637 	inc	hl
   9EC7 7E            [ 7] 2638 	ld	a,(hl)
   9EC8 32 3C 91      [13] 2639 	ld	(#_mapa + 1),a
                           2640 ;src/main.c:620: cpct_etm_setTileset2x4(g_tileset);
   9ECB 21 E0 54      [10] 2641 	ld	hl,#_g_tileset
   9ECE CD 6D 86      [17] 2642 	call	_cpct_etm_setTileset2x4
                           2643 ;src/main.c:622: dibujarMapa();
   9ED1 CD 45 91      [17] 2644 	call	_dibujarMapa
                           2645 ;src/main.c:625: barraPuntuacionInicial();
   9ED4 CD AA 81      [17] 2646 	call	_barraPuntuacionInicial
                           2647 ;src/main.c:628: prota.x = prota.px = 4;
   9ED7 21 2A 91      [10] 2648 	ld	hl,#(_prota + 0x0002)
   9EDA 36 04         [10] 2649 	ld	(hl),#0x04
   9EDC 21 28 91      [10] 2650 	ld	hl,#_prota
   9EDF 36 04         [10] 2651 	ld	(hl),#0x04
                           2652 ;src/main.c:629: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   9EE1 21 2B 91      [10] 2653 	ld	hl,#(_prota + 0x0003)
   9EE4 36 68         [10] 2654 	ld	(hl),#0x68
   9EE6 21 29 91      [10] 2655 	ld	hl,#(_prota + 0x0001)
   9EE9 36 68         [10] 2656 	ld	(hl),#0x68
                           2657 ;src/main.c:630: prota.mover  = NO;
   9EEB 21 2E 91      [10] 2658 	ld	hl,#(_prota + 0x0006)
   9EEE 36 00         [10] 2659 	ld	(hl),#0x00
                           2660 ;src/main.c:631: prota.mira=M_derecha;
   9EF0 21 2F 91      [10] 2661 	ld	hl,#(_prota + 0x0007)
   9EF3 36 00         [10] 2662 	ld	(hl),#0x00
                           2663 ;src/main.c:632: prota.sprite = g_hero;
   9EF5 21 70 7B      [10] 2664 	ld	hl,#_g_hero
   9EF8 22 2C 91      [16] 2665 	ld	((_prota + 0x0004)), hl
                           2666 ;src/main.c:636: cu.x = cu.px = 0;
   9EFB 21 32 91      [10] 2667 	ld	hl,#(_cu + 0x0002)
   9EFE 36 00         [10] 2668 	ld	(hl),#0x00
   9F00 21 30 91      [10] 2669 	ld	hl,#_cu
   9F03 36 00         [10] 2670 	ld	(hl),#0x00
                           2671 ;src/main.c:637: cu.y = cu.py = 0;
   9F05 21 33 91      [10] 2672 	ld	hl,#(_cu + 0x0003)
   9F08 36 00         [10] 2673 	ld	(hl),#0x00
   9F0A 21 31 91      [10] 2674 	ld	hl,#(_cu + 0x0001)
   9F0D 36 00         [10] 2675 	ld	(hl),#0x00
                           2676 ;src/main.c:638: cu.lanzado = NO;
   9F0F 21 36 91      [10] 2677 	ld	hl,#(_cu + 0x0006)
   9F12 36 00         [10] 2678 	ld	(hl),#0x00
                           2679 ;src/main.c:639: cu.mover = NO;
   9F14 21 39 91      [10] 2680 	ld	hl,#(_cu + 0x0009)
   9F17 36 00         [10] 2681 	ld	(hl),#0x00
                           2682 ;src/main.c:641: inicializarEnemy();
   9F19 CD E4 99      [17] 2683 	call	_inicializarEnemy
                           2684 ;src/main.c:643: dibujarProta();
   9F1C C3 6B 91      [10] 2685 	jp  _dibujarProta
                           2686 ;src/main.c:646: void main(void) {
                           2687 ;	---------------------------------
                           2688 ; Function main
                           2689 ; ---------------------------------
   9F1F                    2690 _main::
   9F1F DD E5         [15] 2691 	push	ix
   9F21 DD 21 00 00   [14] 2692 	ld	ix,#0
   9F25 DD 39         [15] 2693 	add	ix,sp
   9F27 3B            [ 6] 2694 	dec	sp
                           2695 ;src/main.c:651: inicializarCPC();
   9F28 CD 8D 9E      [17] 2696 	call	_inicializarCPC
                           2697 ;src/main.c:653: menuInicio();
   9F2B CD CB 80      [17] 2698 	call	_menuInicio
                           2699 ;src/main.c:655: inicializarJuego();
   9F2E CD B6 9E      [17] 2700 	call	_inicializarJuego
                           2701 ;src/main.c:659: while (1) {
   9F31                    2702 00122$:
                           2703 ;src/main.c:661: i = (2 + num_mapa) + 1;
   9F31 21 3D 91      [10] 2704 	ld	hl,#_num_mapa + 0
   9F34 4E            [ 7] 2705 	ld	c, (hl)
   9F35 0C            [ 4] 2706 	inc	c
   9F36 0C            [ 4] 2707 	inc	c
   9F37 0C            [ 4] 2708 	inc	c
                           2709 ;src/main.c:662: actual = enemy;
                           2710 ;src/main.c:664: comprobarTeclado();
   9F38 C5            [11] 2711 	push	bc
   9F39 CD 72 9D      [17] 2712 	call	_comprobarTeclado
   9F3C CD D5 9D      [17] 2713 	call	_moverCuchillo
   9F3F C1            [10] 2714 	pop	bc
                           2715 ;src/main.c:667: while(--i){
   9F40 11 F4 90      [10] 2716 	ld	de,#_enemy
   9F43                    2717 00101$:
   9F43 0D            [ 4] 2718 	dec c
   9F44 28 11         [12] 2719 	jr	Z,00103$
                           2720 ;src/main.c:668: moverEnemigo(actual);
   9F46 C5            [11] 2721 	push	bc
   9F47 D5            [11] 2722 	push	de
   9F48 D5            [11] 2723 	push	de
   9F49 CD 84 99      [17] 2724 	call	_moverEnemigo
   9F4C F1            [10] 2725 	pop	af
   9F4D D1            [10] 2726 	pop	de
   9F4E C1            [10] 2727 	pop	bc
                           2728 ;src/main.c:669: ++actual;
   9F4F 21 0D 00      [10] 2729 	ld	hl,#0x000D
   9F52 19            [11] 2730 	add	hl,de
   9F53 5D            [ 4] 2731 	ld	e,l
   9F54 54            [ 4] 2732 	ld	d,h
   9F55 18 EC         [12] 2733 	jr	00101$
   9F57                    2734 00103$:
                           2735 ;src/main.c:672: actual = enemy;
   9F57 01 F4 90      [10] 2736 	ld	bc,#_enemy
                           2737 ;src/main.c:674: cpct_waitVSYNC();
   9F5A C5            [11] 2738 	push	bc
   9F5B CD 11 87      [17] 2739 	call	_cpct_waitVSYNC
   9F5E CD 47 87      [17] 2740 	call	_cpct_akp_musicPlay
   9F61 C1            [10] 2741 	pop	bc
                           2742 ;src/main.c:677: if (prota.mover) {
   9F62 11 2E 91      [10] 2743 	ld	de,#_prota+6
   9F65 1A            [ 7] 2744 	ld	a,(de)
   9F66 B7            [ 4] 2745 	or	a, a
   9F67 28 09         [12] 2746 	jr	Z,00105$
                           2747 ;src/main.c:678: redibujarProta();
   9F69 C5            [11] 2748 	push	bc
   9F6A D5            [11] 2749 	push	de
   9F6B CD 05 92      [17] 2750 	call	_redibujarProta
   9F6E D1            [10] 2751 	pop	de
   9F6F C1            [10] 2752 	pop	bc
                           2753 ;src/main.c:679: prota.mover = NO;
   9F70 AF            [ 4] 2754 	xor	a, a
   9F71 12            [ 7] 2755 	ld	(de),a
   9F72                    2756 00105$:
                           2757 ;src/main.c:681: if(cu.lanzado && cu.mover){
   9F72 21 36 91      [10] 2758 	ld	hl,#_cu + 6
   9F75 5E            [ 7] 2759 	ld	e,(hl)
   9F76 7B            [ 4] 2760 	ld	a,e
   9F77 B7            [ 4] 2761 	or	a, a
   9F78 28 0D         [12] 2762 	jr	Z,00110$
   9F7A 3A 39 91      [13] 2763 	ld	a, (#(_cu + 0x0009) + 0)
   9F7D B7            [ 4] 2764 	or	a, a
   9F7E 28 07         [12] 2765 	jr	Z,00110$
                           2766 ;src/main.c:682: redibujarCuchillo();
   9F80 C5            [11] 2767 	push	bc
   9F81 CD 42 9C      [17] 2768 	call	_redibujarCuchillo
   9F84 C1            [10] 2769 	pop	bc
   9F85 18 0F         [12] 2770 	jr	00137$
   9F87                    2771 00110$:
                           2772 ;src/main.c:683: }else if (cu.lanzado && !cu.mover){
   9F87 7B            [ 4] 2773 	ld	a,e
   9F88 B7            [ 4] 2774 	or	a, a
   9F89 28 0B         [12] 2775 	jr	Z,00137$
   9F8B 3A 39 91      [13] 2776 	ld	a, (#(_cu + 0x0009) + 0)
   9F8E B7            [ 4] 2777 	or	a, a
   9F8F 20 05         [12] 2778 	jr	NZ,00137$
                           2779 ;src/main.c:684: borrarCuchillo();
   9F91 C5            [11] 2780 	push	bc
   9F92 CD C4 9B      [17] 2781 	call	_borrarCuchillo
   9F95 C1            [10] 2782 	pop	bc
                           2783 ;src/main.c:687: while(--i){
   9F96                    2784 00137$:
   9F96 DD 36 FF 05   [19] 2785 	ld	-1 (ix),#0x05
   9F9A                    2786 00118$:
   9F9A DD 35 FF      [23] 2787 	dec	-1 (ix)
   9F9D DD 7E FF      [19] 2788 	ld	a,-1 (ix)
   9FA0 B7            [ 4] 2789 	or	a, a
   9FA1 28 71         [12] 2790 	jr	Z,00120$
                           2791 ;src/main.c:688: if(actual->mover){
   9FA3 C5            [11] 2792 	push	bc
   9FA4 FD E1         [14] 2793 	pop	iy
   9FA6 FD 7E 06      [19] 2794 	ld	a,6 (iy)
   9FA9 B7            [ 4] 2795 	or	a, a
   9FAA 28 07         [12] 2796 	jr	Z,00114$
                           2797 ;src/main.c:689: redibujarEnemigo(actual);
   9FAC C5            [11] 2798 	push	bc
   9FAD C5            [11] 2799 	push	bc
   9FAE CD 23 95      [17] 2800 	call	_redibujarEnemigo
   9FB1 F1            [10] 2801 	pop	af
   9FB2 C1            [10] 2802 	pop	bc
   9FB3                    2803 00114$:
                           2804 ;src/main.c:691: if (actual->muerto && actual->muertes == 0){
   9FB3 C5            [11] 2805 	push	bc
   9FB4 FD E1         [14] 2806 	pop	iy
   9FB6 FD 7E 08      [19] 2807 	ld	a,8 (iy)
   9FB9 B7            [ 4] 2808 	or	a, a
   9FBA 28 50         [12] 2809 	jr	Z,00116$
   9FBC 21 0C 00      [10] 2810 	ld	hl,#0x000C
   9FBF 09            [11] 2811 	add	hl,bc
   9FC0 EB            [ 4] 2812 	ex	de,hl
   9FC1 1A            [ 7] 2813 	ld	a,(de)
   9FC2 B7            [ 4] 2814 	or	a, a
   9FC3 20 47         [12] 2815 	jr	NZ,00116$
                           2816 ;src/main.c:692: borrarEnemigo(actual);
   9FC5 C5            [11] 2817 	push	bc
   9FC6 D5            [11] 2818 	push	de
   9FC7 C5            [11] 2819 	push	bc
   9FC8 CD 8F 94      [17] 2820 	call	_borrarEnemigo
   9FCB F1            [10] 2821 	pop	af
   9FCC D1            [10] 2822 	pop	de
   9FCD C1            [10] 2823 	pop	bc
                           2824 ;src/main.c:693: dibujarExplosion(actual);
   9FCE C5            [11] 2825 	push	bc
   9FCF D5            [11] 2826 	push	de
   9FD0 C5            [11] 2827 	push	bc
   9FD1 CD E7 93      [17] 2828 	call	_dibujarExplosion
   9FD4 F1            [10] 2829 	pop	af
   9FD5 D1            [10] 2830 	pop	de
   9FD6 C1            [10] 2831 	pop	bc
                           2832 ;src/main.c:694: puntuacion_aux = puntuacion;
   9FD7 FD 21 3E 91   [14] 2833 	ld	iy,#_puntuacion
   9FDB FD 6E 00      [19] 2834 	ld	l,0 (iy)
   9FDE 26 00         [ 7] 2835 	ld	h,#0x00
                           2836 ;src/main.c:695: puntuacion = aumentarPuntuacion(puntuacion_aux);
   9FE0 C5            [11] 2837 	push	bc
   9FE1 D5            [11] 2838 	push	de
   9FE2 E5            [11] 2839 	push	hl
   9FE3 CD 83 83      [17] 2840 	call	_aumentarPuntuacion
   9FE6 F1            [10] 2841 	pop	af
   9FE7 D1            [10] 2842 	pop	de
   9FE8 C1            [10] 2843 	pop	bc
   9FE9 FD 21 3E 91   [14] 2844 	ld	iy,#_puntuacion
   9FED FD 75 00      [19] 2845 	ld	0 (iy),l
                           2846 ;src/main.c:696: modificarPuntuacion(puntuacion);
   9FF0 FD 21 3E 91   [14] 2847 	ld	iy,#_puntuacion
   9FF4 FD 6E 00      [19] 2848 	ld	l,0 (iy)
   9FF7 26 00         [ 7] 2849 	ld	h,#0x00
   9FF9 C5            [11] 2850 	push	bc
   9FFA D5            [11] 2851 	push	de
   9FFB E5            [11] 2852 	push	hl
   9FFC CD 46 82      [17] 2853 	call	_modificarPuntuacion
   9FFF F1            [10] 2854 	pop	af
   A000 D1            [10] 2855 	pop	de
   A001 C1            [10] 2856 	pop	bc
                           2857 ;src/main.c:698: actual->muertes++;
   A002 1A            [ 7] 2858 	ld	a,(de)
   A003 3C            [ 4] 2859 	inc	a
   A004 12            [ 7] 2860 	ld	(de),a
                           2861 ;src/main.c:699: actual->x = 0;
   A005 AF            [ 4] 2862 	xor	a, a
   A006 02            [ 7] 2863 	ld	(bc),a
                           2864 ;src/main.c:700: actual->y = 0;
   A007 59            [ 4] 2865 	ld	e, c
   A008 50            [ 4] 2866 	ld	d, b
   A009 13            [ 6] 2867 	inc	de
   A00A AF            [ 4] 2868 	xor	a, a
   A00B 12            [ 7] 2869 	ld	(de),a
   A00C                    2870 00116$:
                           2871 ;src/main.c:702: ++actual;
   A00C 21 0D 00      [10] 2872 	ld	hl,#0x000D
   A00F 09            [11] 2873 	add	hl,bc
   A010 4D            [ 4] 2874 	ld	c,l
   A011 44            [ 4] 2875 	ld	b,h
   A012 18 86         [12] 2876 	jr	00118$
   A014                    2877 00120$:
                           2878 ;src/main.c:704: cpct_waitVSYNC();
   A014 CD 11 87      [17] 2879 	call	_cpct_waitVSYNC
   A017 C3 31 9F      [10] 2880 	jp	00122$
   A01A 33            [ 6] 2881 	inc	sp
   A01B DD E1         [14] 2882 	pop	ix
   A01D C9            [10] 2883 	ret
                           2884 	.area _CODE
                           2885 	.area _INITIALIZER
   9140                    2886 __xinit__mapa:
   9140 00 00              2887 	.dw #0x0000
   9142                    2888 __xinit__num_mapa:
   9142 00                 2889 	.db #0x00	; 0
   9143                    2890 __xinit__puntuacion:
   9143 00                 2891 	.db #0x00	; 0
   9144                    2892 __xinit__vidas:
   9144 05                 2893 	.db #0x05	; 5
                           2894 	.area _CABS (ABS)
