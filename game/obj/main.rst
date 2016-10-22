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
                             14 	.globl _inicializarCPC
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
                             45 	.globl _barraPuntuacionInicial
                             46 	.globl _menuInicio
                             47 	.globl _menuFin
                             48 	.globl _cpct_etm_setTileset2x4
                             49 	.globl _cpct_etm_drawTileBox2x4
                             50 	.globl _cpct_akp_musicPlay
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
                             61 	.globl _cpct_disableFirmware
                             62 	.globl _num_mapa
                             63 	.globl _mapa
                             64 	.globl _cu
                             65 	.globl _prota
                             66 	.globl _enemy
                             67 	.globl _EEje
                             68 	.globl _EMirar
                             69 	.globl _spawnY
                             70 	.globl _spawnX
                             71 	.globl _mapas
                             72 ;--------------------------------------------------------
                             73 ; special function registers
                             74 ;--------------------------------------------------------
                             75 ;--------------------------------------------------------
                             76 ; ram data
                             77 ;--------------------------------------------------------
                             78 	.area _DATA
   8DCD                      79 _EMirar::
   8DCD                      80 	.ds 1
   8DCE                      81 _EEje::
   8DCE                      82 	.ds 1
   8DCF                      83 _enemy::
   8DCF                      84 	.ds 52
   8E03                      85 _prota::
   8E03                      86 	.ds 8
   8E0B                      87 _cu::
   8E0B                      88 	.ds 10
                             89 ;--------------------------------------------------------
                             90 ; ram data
                             91 ;--------------------------------------------------------
                             92 	.area _INITIALIZED
   8E15                      93 _mapa::
   8E15                      94 	.ds 2
   8E17                      95 _num_mapa::
   8E17                      96 	.ds 1
                             97 ;--------------------------------------------------------
                             98 ; absolute external ram data
                             99 ;--------------------------------------------------------
                            100 	.area _DABS (ABS)
                            101 ;--------------------------------------------------------
                            102 ; global & static initialisations
                            103 ;--------------------------------------------------------
                            104 	.area _HOME
                            105 	.area _GSINIT
                            106 	.area _GSFINAL
                            107 	.area _GSINIT
                            108 ;--------------------------------------------------------
                            109 ; Home
                            110 ;--------------------------------------------------------
                            111 	.area _HOME
                            112 	.area _HOME
                            113 ;--------------------------------------------------------
                            114 ; code
                            115 ;--------------------------------------------------------
                            116 	.area _CODE
                            117 ;src/main.c:108: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
                            118 ;	---------------------------------
                            119 ; Function dummy_cpct_transparentMaskTable0M0_container
                            120 ; ---------------------------------
   7C0A                     121 _dummy_cpct_transparentMaskTable0M0_container::
                            122 	.area _g_tablatrans_ (ABS) 
   3E00                     123 	.org 0x3E00 
   3E00                     124 	 _g_tablatrans::
   3E00 FF AA 55 00 AA AA   125 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E08 55 00 55 00 00 00   126 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E10 AA AA 00 00 AA AA   127 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E18 00 00 00 00 00 00   128 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E20 55 00 55 00 00 00   129 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E28 55 00 55 00 00 00   130 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E30 00 00 00 00 00 00   131 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E38 00 00 00 00 00 00   132 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E40 AA AA 00 00 AA AA   133 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E48 00 00 00 00 00 00   134 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E50 AA AA 00 00 AA AA   135 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E58 00 00 00 00 00 00   136 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E60 00 00 00 00 00 00   137 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E68 00 00 00 00 00 00   138 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E70 00 00 00 00 00 00   139 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E78 00 00 00 00 00 00   140 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E80 55 00 55 00 00 00   141 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E88 55 00 55 00 00 00   142 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E90 00 00 00 00 00 00   143 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E98 00 00 00 00 00 00   144 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA0 55 00 55 00 00 00   145 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA8 55 00 55 00 00 00   146 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB0 00 00 00 00 00 00   147 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB8 00 00 00 00 00 00   148 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC0 00 00 00 00 00 00   149 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC8 00 00 00 00 00 00   150 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED0 00 00 00 00 00 00   151 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED8 00 00 00 00 00 00   152 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE0 00 00 00 00 00 00   153 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE8 00 00 00 00 00 00   154 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF0 00 00 00 00 00 00   155 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF8 00 00 00 00 00 00   156 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            157 	.area _CSEG (REL, CON) 
                            158 ;src/main.c:111: void dibujarMapa() {
                            159 ;	---------------------------------
                            160 ; Function dibujarMapa
                            161 ; ---------------------------------
   8E1B                     162 _dibujarMapa::
                            163 ;src/main.c:112: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   8E1B 2A 15 8E      [16]  164 	ld	hl,(_mapa)
   8E1E E5            [11]  165 	push	hl
   8E1F 21 F0 C0      [10]  166 	ld	hl,#0xC0F0
   8E22 E5            [11]  167 	push	hl
   8E23 21 2C 28      [10]  168 	ld	hl,#0x282C
   8E26 E5            [11]  169 	push	hl
   8E27 2E 00         [ 7]  170 	ld	l, #0x00
   8E29 E5            [11]  171 	push	hl
   8E2A AF            [ 4]  172 	xor	a, a
   8E2B F5            [11]  173 	push	af
   8E2C 33            [ 6]  174 	inc	sp
   8E2D CD 6B 82      [17]  175 	call	_cpct_etm_drawTileBox2x4
   8E30 C9            [10]  176 	ret
   8E31                     177 _mapas:
   8E31 C0 4D               178 	.dw _g_map1
   8E33 E0 46               179 	.dw _g_map2
   8E35 00 40               180 	.dw _g_map3
   8E37                     181 _spawnX:
   8E37 00                  182 	.db #0x00	; 0
   8E38 28                  183 	.db #0x28	; 40
   8E39 47                  184 	.db #0x47	; 71	'G'
   8E3A 14                  185 	.db #0x14	; 20
   8E3B 3C                  186 	.db #0x3C	; 60
   8E3C                     187 _spawnY:
   8E3C 00                  188 	.db #0x00	; 0
   8E3D 2C                  189 	.db #0x2C	; 44
   8E3E 72                  190 	.db #0x72	; 114	'r'
   8E3F 8A                  191 	.db #0x8A	; 138
   8E40 8A                  192 	.db #0x8A	; 138
                            193 ;src/main.c:115: void dibujarProta() {
                            194 ;	---------------------------------
                            195 ; Function dibujarProta
                            196 ; ---------------------------------
   8E41                     197 _dibujarProta::
                            198 ;src/main.c:116: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   8E41 21 04 8E      [10]  199 	ld	hl, #_prota + 1
   8E44 56            [ 7]  200 	ld	d,(hl)
   8E45 21 03 8E      [10]  201 	ld	hl, #_prota + 0
   8E48 46            [ 7]  202 	ld	b,(hl)
   8E49 D5            [11]  203 	push	de
   8E4A 33            [ 6]  204 	inc	sp
   8E4B C5            [11]  205 	push	bc
   8E4C 33            [ 6]  206 	inc	sp
   8E4D 21 00 C0      [10]  207 	ld	hl,#0xC000
   8E50 E5            [11]  208 	push	hl
   8E51 CD 72 8D      [17]  209 	call	_cpct_getScreenPtr
   8E54 EB            [ 4]  210 	ex	de,hl
                            211 ;src/main.c:117: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   8E55 ED 4B 07 8E   [20]  212 	ld	bc, (#_prota + 4)
   8E59 21 00 3E      [10]  213 	ld	hl,#_g_tablatrans
   8E5C E5            [11]  214 	push	hl
   8E5D 21 07 16      [10]  215 	ld	hl,#0x1607
   8E60 E5            [11]  216 	push	hl
   8E61 D5            [11]  217 	push	de
   8E62 C5            [11]  218 	push	bc
   8E63 CD 92 8D      [17]  219 	call	_cpct_drawSpriteMaskedAlignedTable
   8E66 C9            [10]  220 	ret
                            221 ;src/main.c:120: void borrarProta() {
                            222 ;	---------------------------------
                            223 ; Function borrarProta
                            224 ; ---------------------------------
   8E67                     225 _borrarProta::
   8E67 DD E5         [15]  226 	push	ix
   8E69 DD 21 00 00   [14]  227 	ld	ix,#0
   8E6D DD 39         [15]  228 	add	ix,sp
   8E6F F5            [11]  229 	push	af
   8E70 3B            [ 6]  230 	dec	sp
                            231 ;src/main.c:122: u8 w = 4 + (prota.px & 1);
   8E71 21 05 8E      [10]  232 	ld	hl, #_prota + 2
   8E74 4E            [ 7]  233 	ld	c,(hl)
   8E75 79            [ 4]  234 	ld	a,c
   8E76 E6 01         [ 7]  235 	and	a, #0x01
   8E78 47            [ 4]  236 	ld	b,a
   8E79 04            [ 4]  237 	inc	b
   8E7A 04            [ 4]  238 	inc	b
   8E7B 04            [ 4]  239 	inc	b
   8E7C 04            [ 4]  240 	inc	b
                            241 ;src/main.c:125: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   8E7D 21 06 8E      [10]  242 	ld	hl, #_prota + 3
   8E80 5E            [ 7]  243 	ld	e,(hl)
   8E81 CB 4B         [ 8]  244 	bit	1, e
   8E83 28 04         [12]  245 	jr	Z,00103$
   8E85 3E 01         [ 7]  246 	ld	a,#0x01
   8E87 18 02         [12]  247 	jr	00104$
   8E89                     248 00103$:
   8E89 3E 00         [ 7]  249 	ld	a,#0x00
   8E8B                     250 00104$:
   8E8B C6 06         [ 7]  251 	add	a, #0x06
   8E8D DD 77 FD      [19]  252 	ld	-3 (ix),a
                            253 ;src/main.c:127: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   8E90 FD 2A 15 8E   [20]  254 	ld	iy,(_mapa)
   8E94 16 00         [ 7]  255 	ld	d,#0x00
   8E96 7B            [ 4]  256 	ld	a,e
   8E97 C6 E8         [ 7]  257 	add	a,#0xE8
   8E99 DD 77 FE      [19]  258 	ld	-2 (ix),a
   8E9C 7A            [ 4]  259 	ld	a,d
   8E9D CE FF         [ 7]  260 	adc	a,#0xFF
   8E9F DD 77 FF      [19]  261 	ld	-1 (ix),a
   8EA2 DD 6E FE      [19]  262 	ld	l,-2 (ix)
   8EA5 DD 66 FF      [19]  263 	ld	h,-1 (ix)
   8EA8 DD CB FF 7E   [20]  264 	bit	7, -1 (ix)
   8EAC 28 04         [12]  265 	jr	Z,00105$
   8EAE 21 EB FF      [10]  266 	ld	hl,#0xFFEB
   8EB1 19            [11]  267 	add	hl,de
   8EB2                     268 00105$:
   8EB2 CB 2C         [ 8]  269 	sra	h
   8EB4 CB 1D         [ 8]  270 	rr	l
   8EB6 CB 2C         [ 8]  271 	sra	h
   8EB8 CB 1D         [ 8]  272 	rr	l
   8EBA 55            [ 4]  273 	ld	d,l
   8EBB CB 39         [ 8]  274 	srl	c
   8EBD FD E5         [15]  275 	push	iy
   8EBF 21 F0 C0      [10]  276 	ld	hl,#0xC0F0
   8EC2 E5            [11]  277 	push	hl
   8EC3 3E 28         [ 7]  278 	ld	a,#0x28
   8EC5 F5            [11]  279 	push	af
   8EC6 33            [ 6]  280 	inc	sp
   8EC7 DD 7E FD      [19]  281 	ld	a,-3 (ix)
   8ECA F5            [11]  282 	push	af
   8ECB 33            [ 6]  283 	inc	sp
   8ECC C5            [11]  284 	push	bc
   8ECD 33            [ 6]  285 	inc	sp
   8ECE D5            [11]  286 	push	de
   8ECF 33            [ 6]  287 	inc	sp
   8ED0 79            [ 4]  288 	ld	a,c
   8ED1 F5            [11]  289 	push	af
   8ED2 33            [ 6]  290 	inc	sp
   8ED3 CD 6B 82      [17]  291 	call	_cpct_etm_drawTileBox2x4
   8ED6 DD F9         [10]  292 	ld	sp, ix
   8ED8 DD E1         [14]  293 	pop	ix
   8EDA C9            [10]  294 	ret
                            295 ;src/main.c:130: void redibujarProta() {
                            296 ;	---------------------------------
                            297 ; Function redibujarProta
                            298 ; ---------------------------------
   8EDB                     299 _redibujarProta::
                            300 ;src/main.c:131: borrarProta();
   8EDB CD 67 8E      [17]  301 	call	_borrarProta
                            302 ;src/main.c:132: prota.px = prota.x;
   8EDE 01 05 8E      [10]  303 	ld	bc,#_prota + 2
   8EE1 3A 03 8E      [13]  304 	ld	a, (#_prota + 0)
   8EE4 02            [ 7]  305 	ld	(bc),a
                            306 ;src/main.c:133: prota.py = prota.y;
   8EE5 01 06 8E      [10]  307 	ld	bc,#_prota + 3
   8EE8 3A 04 8E      [13]  308 	ld	a, (#_prota + 1)
   8EEB 02            [ 7]  309 	ld	(bc),a
                            310 ;src/main.c:134: dibujarProta();
   8EEC C3 41 8E      [10]  311 	jp  _dibujarProta
                            312 ;src/main.c:137: u8* getTilePtr(u8 x, u8 y) {
                            313 ;	---------------------------------
                            314 ; Function getTilePtr
                            315 ; ---------------------------------
   8EEF                     316 _getTilePtr::
   8EEF DD E5         [15]  317 	push	ix
   8EF1 DD 21 00 00   [14]  318 	ld	ix,#0
   8EF5 DD 39         [15]  319 	add	ix,sp
                            320 ;src/main.c:138: return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
   8EF7 DD 4E 05      [19]  321 	ld	c,5 (ix)
   8EFA 06 00         [ 7]  322 	ld	b,#0x00
   8EFC 79            [ 4]  323 	ld	a,c
   8EFD C6 E8         [ 7]  324 	add	a,#0xE8
   8EFF 5F            [ 4]  325 	ld	e,a
   8F00 78            [ 4]  326 	ld	a,b
   8F01 CE FF         [ 7]  327 	adc	a,#0xFF
   8F03 57            [ 4]  328 	ld	d,a
   8F04 6B            [ 4]  329 	ld	l, e
   8F05 62            [ 4]  330 	ld	h, d
   8F06 CB 7A         [ 8]  331 	bit	7, d
   8F08 28 04         [12]  332 	jr	Z,00103$
   8F0A 21 EB FF      [10]  333 	ld	hl,#0xFFEB
   8F0D 09            [11]  334 	add	hl,bc
   8F0E                     335 00103$:
   8F0E CB 2C         [ 8]  336 	sra	h
   8F10 CB 1D         [ 8]  337 	rr	l
   8F12 CB 2C         [ 8]  338 	sra	h
   8F14 CB 1D         [ 8]  339 	rr	l
   8F16 4D            [ 4]  340 	ld	c, l
   8F17 44            [ 4]  341 	ld	b, h
   8F18 29            [11]  342 	add	hl, hl
   8F19 29            [11]  343 	add	hl, hl
   8F1A 09            [11]  344 	add	hl, bc
   8F1B 29            [11]  345 	add	hl, hl
   8F1C 29            [11]  346 	add	hl, hl
   8F1D 29            [11]  347 	add	hl, hl
   8F1E 4D            [ 4]  348 	ld	c,l
   8F1F 44            [ 4]  349 	ld	b,h
   8F20 2A 15 8E      [16]  350 	ld	hl,(_mapa)
   8F23 09            [11]  351 	add	hl,bc
   8F24 DD 4E 04      [19]  352 	ld	c,4 (ix)
   8F27 CB 39         [ 8]  353 	srl	c
   8F29 59            [ 4]  354 	ld	e,c
   8F2A 16 00         [ 7]  355 	ld	d,#0x00
   8F2C 19            [11]  356 	add	hl,de
   8F2D DD E1         [14]  357 	pop	ix
   8F2F C9            [10]  358 	ret
                            359 ;src/main.c:141: u8 checkCollision(int direction) { // check optimization
                            360 ;	---------------------------------
                            361 ; Function checkCollision
                            362 ; ---------------------------------
   8F30                     363 _checkCollision::
   8F30 DD E5         [15]  364 	push	ix
   8F32 DD 21 00 00   [14]  365 	ld	ix,#0
   8F36 DD 39         [15]  366 	add	ix,sp
   8F38 F5            [11]  367 	push	af
                            368 ;src/main.c:142: u8 *headTile=0, *feetTile=0, *waistTile=0;
   8F39 21 00 00      [10]  369 	ld	hl,#0x0000
   8F3C E3            [19]  370 	ex	(sp), hl
   8F3D 11 00 00      [10]  371 	ld	de,#0x0000
   8F40 01 00 00      [10]  372 	ld	bc,#0x0000
                            373 ;src/main.c:144: switch (direction) {
   8F43 DD CB 05 7E   [20]  374 	bit	7, 5 (ix)
   8F47 C2 64 90      [10]  375 	jp	NZ,00105$
   8F4A 3E 03         [ 7]  376 	ld	a,#0x03
   8F4C DD BE 04      [19]  377 	cp	a, 4 (ix)
   8F4F 3E 00         [ 7]  378 	ld	a,#0x00
   8F51 DD 9E 05      [19]  379 	sbc	a, 5 (ix)
   8F54 E2 59 8F      [10]  380 	jp	PO, 00128$
   8F57 EE 80         [ 7]  381 	xor	a, #0x80
   8F59                     382 00128$:
   8F59 FA 64 90      [10]  383 	jp	M,00105$
   8F5C DD 5E 04      [19]  384 	ld	e,4 (ix)
   8F5F 16 00         [ 7]  385 	ld	d,#0x00
   8F61 21 68 8F      [10]  386 	ld	hl,#00129$
   8F64 19            [11]  387 	add	hl,de
   8F65 19            [11]  388 	add	hl,de
   8F66 19            [11]  389 	add	hl,de
   8F67 E9            [ 4]  390 	jp	(hl)
   8F68                     391 00129$:
   8F68 C3 74 8F      [10]  392 	jp	00101$
   8F6B C3 BF 8F      [10]  393 	jp	00102$
   8F6E C3 00 90      [10]  394 	jp	00103$
   8F71 C3 33 90      [10]  395 	jp	00104$
                            396 ;src/main.c:145: case 0:
   8F74                     397 00101$:
                            398 ;src/main.c:146: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   8F74 21 04 8E      [10]  399 	ld	hl, #(_prota + 0x0001) + 0
   8F77 5E            [ 7]  400 	ld	e,(hl)
   8F78 21 03 8E      [10]  401 	ld	hl, #_prota + 0
   8F7B 4E            [ 7]  402 	ld	c,(hl)
   8F7C 0C            [ 4]  403 	inc	c
   8F7D 0C            [ 4]  404 	inc	c
   8F7E 0C            [ 4]  405 	inc	c
   8F7F 0C            [ 4]  406 	inc	c
   8F80 7B            [ 4]  407 	ld	a,e
   8F81 F5            [11]  408 	push	af
   8F82 33            [ 6]  409 	inc	sp
   8F83 79            [ 4]  410 	ld	a,c
   8F84 F5            [11]  411 	push	af
   8F85 33            [ 6]  412 	inc	sp
   8F86 CD EF 8E      [17]  413 	call	_getTilePtr
   8F89 F1            [10]  414 	pop	af
   8F8A 33            [ 6]  415 	inc	sp
   8F8B 33            [ 6]  416 	inc	sp
   8F8C E5            [11]  417 	push	hl
                            418 ;src/main.c:147: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   8F8D 3A 04 8E      [13]  419 	ld	a, (#(_prota + 0x0001) + 0)
   8F90 C6 14         [ 7]  420 	add	a, #0x14
   8F92 4F            [ 4]  421 	ld	c,a
   8F93 21 03 8E      [10]  422 	ld	hl, #_prota + 0
   8F96 46            [ 7]  423 	ld	b,(hl)
   8F97 04            [ 4]  424 	inc	b
   8F98 04            [ 4]  425 	inc	b
   8F99 04            [ 4]  426 	inc	b
   8F9A 04            [ 4]  427 	inc	b
   8F9B 79            [ 4]  428 	ld	a,c
   8F9C F5            [11]  429 	push	af
   8F9D 33            [ 6]  430 	inc	sp
   8F9E C5            [11]  431 	push	bc
   8F9F 33            [ 6]  432 	inc	sp
   8FA0 CD EF 8E      [17]  433 	call	_getTilePtr
   8FA3 F1            [10]  434 	pop	af
   8FA4 EB            [ 4]  435 	ex	de,hl
                            436 ;src/main.c:148: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   8FA5 3A 04 8E      [13]  437 	ld	a, (#(_prota + 0x0001) + 0)
   8FA8 C6 0B         [ 7]  438 	add	a, #0x0B
   8FAA 47            [ 4]  439 	ld	b,a
   8FAB 3A 03 8E      [13]  440 	ld	a, (#_prota + 0)
   8FAE C6 04         [ 7]  441 	add	a, #0x04
   8FB0 D5            [11]  442 	push	de
   8FB1 C5            [11]  443 	push	bc
   8FB2 33            [ 6]  444 	inc	sp
   8FB3 F5            [11]  445 	push	af
   8FB4 33            [ 6]  446 	inc	sp
   8FB5 CD EF 8E      [17]  447 	call	_getTilePtr
   8FB8 F1            [10]  448 	pop	af
   8FB9 4D            [ 4]  449 	ld	c,l
   8FBA 44            [ 4]  450 	ld	b,h
   8FBB D1            [10]  451 	pop	de
                            452 ;src/main.c:149: break;
   8FBC C3 64 90      [10]  453 	jp	00105$
                            454 ;src/main.c:150: case 1:
   8FBF                     455 00102$:
                            456 ;src/main.c:151: headTile  = getTilePtr(prota.x - 1, prota.y);
   8FBF 21 04 8E      [10]  457 	ld	hl, #(_prota + 0x0001) + 0
   8FC2 56            [ 7]  458 	ld	d,(hl)
   8FC3 21 03 8E      [10]  459 	ld	hl, #_prota + 0
   8FC6 46            [ 7]  460 	ld	b,(hl)
   8FC7 05            [ 4]  461 	dec	b
   8FC8 D5            [11]  462 	push	de
   8FC9 33            [ 6]  463 	inc	sp
   8FCA C5            [11]  464 	push	bc
   8FCB 33            [ 6]  465 	inc	sp
   8FCC CD EF 8E      [17]  466 	call	_getTilePtr
   8FCF F1            [10]  467 	pop	af
   8FD0 33            [ 6]  468 	inc	sp
   8FD1 33            [ 6]  469 	inc	sp
   8FD2 E5            [11]  470 	push	hl
                            471 ;src/main.c:152: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
   8FD3 3A 04 8E      [13]  472 	ld	a, (#(_prota + 0x0001) + 0)
   8FD6 C6 14         [ 7]  473 	add	a, #0x14
   8FD8 57            [ 4]  474 	ld	d,a
   8FD9 21 03 8E      [10]  475 	ld	hl, #_prota + 0
   8FDC 46            [ 7]  476 	ld	b,(hl)
   8FDD 05            [ 4]  477 	dec	b
   8FDE D5            [11]  478 	push	de
   8FDF 33            [ 6]  479 	inc	sp
   8FE0 C5            [11]  480 	push	bc
   8FE1 33            [ 6]  481 	inc	sp
   8FE2 CD EF 8E      [17]  482 	call	_getTilePtr
   8FE5 F1            [10]  483 	pop	af
   8FE6 EB            [ 4]  484 	ex	de,hl
                            485 ;src/main.c:153: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
   8FE7 3A 04 8E      [13]  486 	ld	a, (#(_prota + 0x0001) + 0)
   8FEA C6 0B         [ 7]  487 	add	a, #0x0B
   8FEC 47            [ 4]  488 	ld	b,a
   8FED 3A 03 8E      [13]  489 	ld	a, (#_prota + 0)
   8FF0 C6 FF         [ 7]  490 	add	a,#0xFF
   8FF2 D5            [11]  491 	push	de
   8FF3 C5            [11]  492 	push	bc
   8FF4 33            [ 6]  493 	inc	sp
   8FF5 F5            [11]  494 	push	af
   8FF6 33            [ 6]  495 	inc	sp
   8FF7 CD EF 8E      [17]  496 	call	_getTilePtr
   8FFA F1            [10]  497 	pop	af
   8FFB 4D            [ 4]  498 	ld	c,l
   8FFC 44            [ 4]  499 	ld	b,h
   8FFD D1            [10]  500 	pop	de
                            501 ;src/main.c:154: break;
   8FFE 18 64         [12]  502 	jr	00105$
                            503 ;src/main.c:155: case 2:
   9000                     504 00103$:
                            505 ;src/main.c:156: headTile   = getTilePtr(prota.x, prota.y - 2);
   9000 3A 04 8E      [13]  506 	ld	a, (#(_prota + 0x0001) + 0)
   9003 C6 FE         [ 7]  507 	add	a,#0xFE
   9005 21 03 8E      [10]  508 	ld	hl, #_prota + 0
   9008 56            [ 7]  509 	ld	d,(hl)
   9009 C5            [11]  510 	push	bc
   900A F5            [11]  511 	push	af
   900B 33            [ 6]  512 	inc	sp
   900C D5            [11]  513 	push	de
   900D 33            [ 6]  514 	inc	sp
   900E CD EF 8E      [17]  515 	call	_getTilePtr
   9011 F1            [10]  516 	pop	af
   9012 C1            [10]  517 	pop	bc
   9013 33            [ 6]  518 	inc	sp
   9014 33            [ 6]  519 	inc	sp
   9015 E5            [11]  520 	push	hl
                            521 ;src/main.c:157: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
   9016 21 04 8E      [10]  522 	ld	hl, #(_prota + 0x0001) + 0
   9019 56            [ 7]  523 	ld	d,(hl)
   901A 15            [ 4]  524 	dec	d
   901B 15            [ 4]  525 	dec	d
   901C 3A 03 8E      [13]  526 	ld	a, (#_prota + 0)
   901F C6 03         [ 7]  527 	add	a, #0x03
   9021 C5            [11]  528 	push	bc
   9022 D5            [11]  529 	push	de
   9023 33            [ 6]  530 	inc	sp
   9024 F5            [11]  531 	push	af
   9025 33            [ 6]  532 	inc	sp
   9026 CD EF 8E      [17]  533 	call	_getTilePtr
   9029 F1            [10]  534 	pop	af
   902A EB            [ 4]  535 	ex	de,hl
   902B C1            [10]  536 	pop	bc
                            537 ;src/main.c:158: *waistTile = 0;
   902C 21 00 00      [10]  538 	ld	hl,#0x0000
   902F 36 00         [10]  539 	ld	(hl),#0x00
                            540 ;src/main.c:159: break;
   9031 18 31         [12]  541 	jr	00105$
                            542 ;src/main.c:160: case 3:
   9033                     543 00104$:
                            544 ;src/main.c:161: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
   9033 3A 04 8E      [13]  545 	ld	a, (#(_prota + 0x0001) + 0)
   9036 C6 16         [ 7]  546 	add	a, #0x16
   9038 21 03 8E      [10]  547 	ld	hl, #_prota + 0
   903B 56            [ 7]  548 	ld	d,(hl)
   903C C5            [11]  549 	push	bc
   903D F5            [11]  550 	push	af
   903E 33            [ 6]  551 	inc	sp
   903F D5            [11]  552 	push	de
   9040 33            [ 6]  553 	inc	sp
   9041 CD EF 8E      [17]  554 	call	_getTilePtr
   9044 F1            [10]  555 	pop	af
   9045 C1            [10]  556 	pop	bc
   9046 33            [ 6]  557 	inc	sp
   9047 33            [ 6]  558 	inc	sp
   9048 E5            [11]  559 	push	hl
                            560 ;src/main.c:162: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   9049 3A 04 8E      [13]  561 	ld	a, (#(_prota + 0x0001) + 0)
   904C C6 16         [ 7]  562 	add	a, #0x16
   904E 57            [ 4]  563 	ld	d,a
   904F 3A 03 8E      [13]  564 	ld	a, (#_prota + 0)
   9052 C6 03         [ 7]  565 	add	a, #0x03
   9054 C5            [11]  566 	push	bc
   9055 D5            [11]  567 	push	de
   9056 33            [ 6]  568 	inc	sp
   9057 F5            [11]  569 	push	af
   9058 33            [ 6]  570 	inc	sp
   9059 CD EF 8E      [17]  571 	call	_getTilePtr
   905C F1            [10]  572 	pop	af
   905D EB            [ 4]  573 	ex	de,hl
   905E C1            [10]  574 	pop	bc
                            575 ;src/main.c:163: *waistTile = 0;
   905F 21 00 00      [10]  576 	ld	hl,#0x0000
   9062 36 00         [10]  577 	ld	(hl),#0x00
                            578 ;src/main.c:165: }
   9064                     579 00105$:
                            580 ;src/main.c:167: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   9064 E1            [10]  581 	pop	hl
   9065 E5            [11]  582 	push	hl
   9066 6E            [ 7]  583 	ld	l,(hl)
   9067 3E 02         [ 7]  584 	ld	a,#0x02
   9069 95            [ 4]  585 	sub	a, l
   906A 38 0E         [12]  586 	jr	C,00106$
   906C 1A            [ 7]  587 	ld	a,(de)
   906D 5F            [ 4]  588 	ld	e,a
   906E 3E 02         [ 7]  589 	ld	a,#0x02
   9070 93            [ 4]  590 	sub	a, e
   9071 38 07         [12]  591 	jr	C,00106$
   9073 0A            [ 7]  592 	ld	a,(bc)
   9074 4F            [ 4]  593 	ld	c,a
   9075 3E 02         [ 7]  594 	ld	a,#0x02
   9077 91            [ 4]  595 	sub	a, c
   9078 30 04         [12]  596 	jr	NC,00107$
   907A                     597 00106$:
                            598 ;src/main.c:168: return 1;
   907A 2E 01         [ 7]  599 	ld	l,#0x01
   907C 18 02         [12]  600 	jr	00110$
   907E                     601 00107$:
                            602 ;src/main.c:170: return 0;
   907E 2E 00         [ 7]  603 	ld	l,#0x00
   9080                     604 00110$:
   9080 DD F9         [10]  605 	ld	sp, ix
   9082 DD E1         [14]  606 	pop	ix
   9084 C9            [10]  607 	ret
                            608 ;src/main.c:173: void dibujarEnemigo(TEnemy *enemy) {
                            609 ;	---------------------------------
                            610 ; Function dibujarEnemigo
                            611 ; ---------------------------------
   9085                     612 _dibujarEnemigo::
   9085 DD E5         [15]  613 	push	ix
   9087 DD 21 00 00   [14]  614 	ld	ix,#0
   908B DD 39         [15]  615 	add	ix,sp
                            616 ;src/main.c:174: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   908D DD 4E 04      [19]  617 	ld	c,4 (ix)
   9090 DD 46 05      [19]  618 	ld	b,5 (ix)
   9093 69            [ 4]  619 	ld	l, c
   9094 60            [ 4]  620 	ld	h, b
   9095 23            [ 6]  621 	inc	hl
   9096 56            [ 7]  622 	ld	d,(hl)
   9097 0A            [ 7]  623 	ld	a,(bc)
   9098 C5            [11]  624 	push	bc
   9099 D5            [11]  625 	push	de
   909A 33            [ 6]  626 	inc	sp
   909B F5            [11]  627 	push	af
   909C 33            [ 6]  628 	inc	sp
   909D 21 00 C0      [10]  629 	ld	hl,#0xC000
   90A0 E5            [11]  630 	push	hl
   90A1 CD 72 8D      [17]  631 	call	_cpct_getScreenPtr
   90A4 EB            [ 4]  632 	ex	de,hl
                            633 ;src/main.c:175: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   90A5 E1            [10]  634 	pop	hl
   90A6 01 04 00      [10]  635 	ld	bc, #0x0004
   90A9 09            [11]  636 	add	hl, bc
   90AA 4E            [ 7]  637 	ld	c,(hl)
   90AB 23            [ 6]  638 	inc	hl
   90AC 46            [ 7]  639 	ld	b,(hl)
   90AD 21 00 3E      [10]  640 	ld	hl,#_g_tablatrans
   90B0 E5            [11]  641 	push	hl
   90B1 21 04 16      [10]  642 	ld	hl,#0x1604
   90B4 E5            [11]  643 	push	hl
   90B5 D5            [11]  644 	push	de
   90B6 C5            [11]  645 	push	bc
   90B7 CD 92 8D      [17]  646 	call	_cpct_drawSpriteMaskedAlignedTable
   90BA DD E1         [14]  647 	pop	ix
   90BC C9            [10]  648 	ret
                            649 ;src/main.c:178: void dibujarExplosion(TEnemy *enemy) {
                            650 ;	---------------------------------
                            651 ; Function dibujarExplosion
                            652 ; ---------------------------------
   90BD                     653 _dibujarExplosion::
   90BD DD E5         [15]  654 	push	ix
   90BF DD 21 00 00   [14]  655 	ld	ix,#0
   90C3 DD 39         [15]  656 	add	ix,sp
                            657 ;src/main.c:179: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   90C5 DD 4E 04      [19]  658 	ld	c,4 (ix)
   90C8 DD 46 05      [19]  659 	ld	b,5 (ix)
   90CB 69            [ 4]  660 	ld	l, c
   90CC 60            [ 4]  661 	ld	h, b
   90CD 23            [ 6]  662 	inc	hl
   90CE 56            [ 7]  663 	ld	d,(hl)
   90CF 0A            [ 7]  664 	ld	a,(bc)
   90D0 47            [ 4]  665 	ld	b,a
   90D1 D5            [11]  666 	push	de
   90D2 33            [ 6]  667 	inc	sp
   90D3 C5            [11]  668 	push	bc
   90D4 33            [ 6]  669 	inc	sp
   90D5 21 00 C0      [10]  670 	ld	hl,#0xC000
   90D8 E5            [11]  671 	push	hl
   90D9 CD 72 8D      [17]  672 	call	_cpct_getScreenPtr
   90DC 4D            [ 4]  673 	ld	c,l
   90DD 44            [ 4]  674 	ld	b,h
                            675 ;src/main.c:180: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   90DE 11 00 3E      [10]  676 	ld	de,#_g_tablatrans+0
   90E1 D5            [11]  677 	push	de
   90E2 21 04 16      [10]  678 	ld	hl,#0x1604
   90E5 E5            [11]  679 	push	hl
   90E6 C5            [11]  680 	push	bc
   90E7 21 70 56      [10]  681 	ld	hl,#_g_explosion
   90EA E5            [11]  682 	push	hl
   90EB CD 92 8D      [17]  683 	call	_cpct_drawSpriteMaskedAlignedTable
   90EE DD E1         [14]  684 	pop	ix
   90F0 C9            [10]  685 	ret
                            686 ;src/main.c:183: void borrarExplosion() {
                            687 ;	---------------------------------
                            688 ; Function borrarExplosion
                            689 ; ---------------------------------
   90F1                     690 _borrarExplosion::
   90F1 DD E5         [15]  691 	push	ix
   90F3 DD 21 00 00   [14]  692 	ld	ix,#0
   90F7 DD 39         [15]  693 	add	ix,sp
   90F9 F5            [11]  694 	push	af
   90FA 3B            [ 6]  695 	dec	sp
                            696 ;src/main.c:184: u8 w = 4 + (enemy->px & 1);
   90FB 21 D1 8D      [10]  697 	ld	hl, #_enemy + 2
   90FE 4E            [ 7]  698 	ld	c,(hl)
   90FF 79            [ 4]  699 	ld	a,c
   9100 E6 01         [ 7]  700 	and	a, #0x01
   9102 47            [ 4]  701 	ld	b,a
   9103 04            [ 4]  702 	inc	b
   9104 04            [ 4]  703 	inc	b
   9105 04            [ 4]  704 	inc	b
   9106 04            [ 4]  705 	inc	b
                            706 ;src/main.c:187: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   9107 21 D2 8D      [10]  707 	ld	hl, #_enemy + 3
   910A 5E            [ 7]  708 	ld	e,(hl)
   910B CB 4B         [ 8]  709 	bit	1, e
   910D 28 04         [12]  710 	jr	Z,00103$
   910F 3E 01         [ 7]  711 	ld	a,#0x01
   9111 18 02         [12]  712 	jr	00104$
   9113                     713 00103$:
   9113 3E 00         [ 7]  714 	ld	a,#0x00
   9115                     715 00104$:
   9115 C6 07         [ 7]  716 	add	a, #0x07
   9117 DD 77 FD      [19]  717 	ld	-3 (ix),a
                            718 ;src/main.c:189: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   911A FD 2A 15 8E   [20]  719 	ld	iy,(_mapa)
   911E 16 00         [ 7]  720 	ld	d,#0x00
   9120 7B            [ 4]  721 	ld	a,e
   9121 C6 E8         [ 7]  722 	add	a,#0xE8
   9123 DD 77 FE      [19]  723 	ld	-2 (ix),a
   9126 7A            [ 4]  724 	ld	a,d
   9127 CE FF         [ 7]  725 	adc	a,#0xFF
   9129 DD 77 FF      [19]  726 	ld	-1 (ix),a
   912C DD 6E FE      [19]  727 	ld	l,-2 (ix)
   912F DD 66 FF      [19]  728 	ld	h,-1 (ix)
   9132 DD CB FF 7E   [20]  729 	bit	7, -1 (ix)
   9136 28 04         [12]  730 	jr	Z,00105$
   9138 21 EB FF      [10]  731 	ld	hl,#0xFFEB
   913B 19            [11]  732 	add	hl,de
   913C                     733 00105$:
   913C CB 2C         [ 8]  734 	sra	h
   913E CB 1D         [ 8]  735 	rr	l
   9140 CB 2C         [ 8]  736 	sra	h
   9142 CB 1D         [ 8]  737 	rr	l
   9144 55            [ 4]  738 	ld	d,l
   9145 CB 39         [ 8]  739 	srl	c
   9147 FD E5         [15]  740 	push	iy
   9149 21 F0 C0      [10]  741 	ld	hl,#0xC0F0
   914C E5            [11]  742 	push	hl
   914D 3E 28         [ 7]  743 	ld	a,#0x28
   914F F5            [11]  744 	push	af
   9150 33            [ 6]  745 	inc	sp
   9151 DD 7E FD      [19]  746 	ld	a,-3 (ix)
   9154 F5            [11]  747 	push	af
   9155 33            [ 6]  748 	inc	sp
   9156 C5            [11]  749 	push	bc
   9157 33            [ 6]  750 	inc	sp
   9158 D5            [11]  751 	push	de
   9159 33            [ 6]  752 	inc	sp
   915A 79            [ 4]  753 	ld	a,c
   915B F5            [11]  754 	push	af
   915C 33            [ 6]  755 	inc	sp
   915D CD 6B 82      [17]  756 	call	_cpct_etm_drawTileBox2x4
   9160 DD F9         [10]  757 	ld	sp, ix
   9162 DD E1         [14]  758 	pop	ix
   9164 C9            [10]  759 	ret
                            760 ;src/main.c:193: void borrarEnemigo(TEnemy *enemy) {
                            761 ;	---------------------------------
                            762 ; Function borrarEnemigo
                            763 ; ---------------------------------
   9165                     764 _borrarEnemigo::
   9165 DD E5         [15]  765 	push	ix
   9167 DD 21 00 00   [14]  766 	ld	ix,#0
   916B DD 39         [15]  767 	add	ix,sp
   916D 21 FA FF      [10]  768 	ld	hl,#-6
   9170 39            [11]  769 	add	hl,sp
   9171 F9            [ 6]  770 	ld	sp,hl
                            771 ;src/main.c:195: u8 w = 4 + (enemy->px & 1);
   9172 DD 4E 04      [19]  772 	ld	c,4 (ix)
   9175 DD 46 05      [19]  773 	ld	b,5 (ix)
   9178 69            [ 4]  774 	ld	l, c
   9179 60            [ 4]  775 	ld	h, b
   917A 23            [ 6]  776 	inc	hl
   917B 23            [ 6]  777 	inc	hl
   917C 5E            [ 7]  778 	ld	e,(hl)
   917D 7B            [ 4]  779 	ld	a,e
   917E E6 01         [ 7]  780 	and	a, #0x01
   9180 C6 04         [ 7]  781 	add	a, #0x04
   9182 DD 77 FB      [19]  782 	ld	-5 (ix),a
                            783 ;src/main.c:198: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   9185 69            [ 4]  784 	ld	l, c
   9186 60            [ 4]  785 	ld	h, b
   9187 23            [ 6]  786 	inc	hl
   9188 23            [ 6]  787 	inc	hl
   9189 23            [ 6]  788 	inc	hl
   918A 56            [ 7]  789 	ld	d,(hl)
   918B CB 4A         [ 8]  790 	bit	1, d
   918D 28 04         [12]  791 	jr	Z,00103$
   918F 3E 01         [ 7]  792 	ld	a,#0x01
   9191 18 02         [12]  793 	jr	00104$
   9193                     794 00103$:
   9193 3E 00         [ 7]  795 	ld	a,#0x00
   9195                     796 00104$:
   9195 C6 07         [ 7]  797 	add	a, #0x07
   9197 DD 77 FA      [19]  798 	ld	-6 (ix),a
                            799 ;src/main.c:200: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   919A FD 2A 15 8E   [20]  800 	ld	iy,(_mapa)
   919E DD 72 FE      [19]  801 	ld	-2 (ix),d
   91A1 DD 36 FF 00   [19]  802 	ld	-1 (ix),#0x00
   91A5 DD 7E FE      [19]  803 	ld	a,-2 (ix)
   91A8 C6 E8         [ 7]  804 	add	a,#0xE8
   91AA DD 77 FC      [19]  805 	ld	-4 (ix),a
   91AD DD 7E FF      [19]  806 	ld	a,-1 (ix)
   91B0 CE FF         [ 7]  807 	adc	a,#0xFF
   91B2 DD 77 FD      [19]  808 	ld	-3 (ix),a
   91B5 DD 56 FC      [19]  809 	ld	d,-4 (ix)
   91B8 DD 6E FD      [19]  810 	ld	l,-3 (ix)
   91BB DD CB FD 7E   [20]  811 	bit	7, -3 (ix)
   91BF 28 0C         [12]  812 	jr	Z,00105$
   91C1 DD 7E FE      [19]  813 	ld	a,-2 (ix)
   91C4 C6 EB         [ 7]  814 	add	a, #0xEB
   91C6 57            [ 4]  815 	ld	d,a
   91C7 DD 7E FF      [19]  816 	ld	a,-1 (ix)
   91CA CE FF         [ 7]  817 	adc	a, #0xFF
   91CC 6F            [ 4]  818 	ld	l,a
   91CD                     819 00105$:
   91CD CB 2D         [ 8]  820 	sra	l
   91CF CB 1A         [ 8]  821 	rr	d
   91D1 CB 2D         [ 8]  822 	sra	l
   91D3 CB 1A         [ 8]  823 	rr	d
   91D5 CB 3B         [ 8]  824 	srl	e
   91D7 C5            [11]  825 	push	bc
   91D8 FD E5         [15]  826 	push	iy
   91DA 21 F0 C0      [10]  827 	ld	hl,#0xC0F0
   91DD E5            [11]  828 	push	hl
   91DE 3E 28         [ 7]  829 	ld	a,#0x28
   91E0 F5            [11]  830 	push	af
   91E1 33            [ 6]  831 	inc	sp
   91E2 DD 66 FA      [19]  832 	ld	h,-6 (ix)
   91E5 DD 6E FB      [19]  833 	ld	l,-5 (ix)
   91E8 E5            [11]  834 	push	hl
   91E9 D5            [11]  835 	push	de
   91EA CD 6B 82      [17]  836 	call	_cpct_etm_drawTileBox2x4
   91ED C1            [10]  837 	pop	bc
                            838 ;src/main.c:202: enemy->mover = NO;
   91EE 21 06 00      [10]  839 	ld	hl,#0x0006
   91F1 09            [11]  840 	add	hl,bc
   91F2 36 00         [10]  841 	ld	(hl),#0x00
   91F4 DD F9         [10]  842 	ld	sp, ix
   91F6 DD E1         [14]  843 	pop	ix
   91F8 C9            [10]  844 	ret
                            845 ;src/main.c:205: void redibujarEnemigo(TEnemy *enemy) {
                            846 ;	---------------------------------
                            847 ; Function redibujarEnemigo
                            848 ; ---------------------------------
   91F9                     849 _redibujarEnemigo::
   91F9 DD E5         [15]  850 	push	ix
   91FB DD 21 00 00   [14]  851 	ld	ix,#0
   91FF DD 39         [15]  852 	add	ix,sp
                            853 ;src/main.c:206: borrarEnemigo(enemy);
   9201 DD 6E 04      [19]  854 	ld	l,4 (ix)
   9204 DD 66 05      [19]  855 	ld	h,5 (ix)
   9207 E5            [11]  856 	push	hl
   9208 CD 65 91      [17]  857 	call	_borrarEnemigo
   920B F1            [10]  858 	pop	af
                            859 ;src/main.c:207: enemy->px = enemy->x;
   920C DD 4E 04      [19]  860 	ld	c,4 (ix)
   920F DD 46 05      [19]  861 	ld	b,5 (ix)
   9212 59            [ 4]  862 	ld	e, c
   9213 50            [ 4]  863 	ld	d, b
   9214 13            [ 6]  864 	inc	de
   9215 13            [ 6]  865 	inc	de
   9216 0A            [ 7]  866 	ld	a,(bc)
   9217 12            [ 7]  867 	ld	(de),a
                            868 ;src/main.c:208: enemy->py = enemy->y;
   9218 59            [ 4]  869 	ld	e, c
   9219 50            [ 4]  870 	ld	d, b
   921A 13            [ 6]  871 	inc	de
   921B 13            [ 6]  872 	inc	de
   921C 13            [ 6]  873 	inc	de
   921D 69            [ 4]  874 	ld	l, c
   921E 60            [ 4]  875 	ld	h, b
   921F 23            [ 6]  876 	inc	hl
   9220 7E            [ 7]  877 	ld	a,(hl)
   9221 12            [ 7]  878 	ld	(de),a
                            879 ;src/main.c:209: dibujarEnemigo(enemy);
   9222 C5            [11]  880 	push	bc
   9223 CD 85 90      [17]  881 	call	_dibujarEnemigo
   9226 F1            [10]  882 	pop	af
   9227 DD E1         [14]  883 	pop	ix
   9229 C9            [10]  884 	ret
                            885 ;src/main.c:212: u8 checkEnemyCollision(int direction, TEnemy *enemy){
                            886 ;	---------------------------------
                            887 ; Function checkEnemyCollision
                            888 ; ---------------------------------
   922A                     889 _checkEnemyCollision::
   922A DD E5         [15]  890 	push	ix
   922C DD 21 00 00   [14]  891 	ld	ix,#0
   9230 DD 39         [15]  892 	add	ix,sp
   9232 21 F7 FF      [10]  893 	ld	hl,#-9
   9235 39            [11]  894 	add	hl,sp
   9236 F9            [ 6]  895 	ld	sp,hl
                            896 ;src/main.c:214: u8 colisiona = 1;
   9237 DD 36 F7 01   [19]  897 	ld	-9 (ix),#0x01
                            898 ;src/main.c:216: switch (direction) {
   923B DD CB 05 7E   [20]  899 	bit	7, 5 (ix)
   923F C2 F2 95      [10]  900 	jp	NZ,00165$
   9242 3E 03         [ 7]  901 	ld	a,#0x03
   9244 DD BE 04      [19]  902 	cp	a, 4 (ix)
   9247 3E 00         [ 7]  903 	ld	a,#0x00
   9249 DD 9E 05      [19]  904 	sbc	a, 5 (ix)
   924C E2 51 92      [10]  905 	jp	PO, 00272$
   924F EE 80         [ 7]  906 	xor	a, #0x80
   9251                     907 00272$:
   9251 FA F2 95      [10]  908 	jp	M,00165$
                            909 ;src/main.c:218: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   9254 DD 4E 06      [19]  910 	ld	c,6 (ix)
   9257 DD 46 07      [19]  911 	ld	b,7 (ix)
   925A 0A            [ 7]  912 	ld	a,(bc)
   925B 5F            [ 4]  913 	ld	e,a
   925C 21 01 00      [10]  914 	ld	hl,#0x0001
   925F 09            [11]  915 	add	hl,bc
   9260 DD 75 F8      [19]  916 	ld	-8 (ix),l
   9263 DD 74 F9      [19]  917 	ld	-7 (ix),h
   9266 DD 6E F8      [19]  918 	ld	l,-8 (ix)
   9269 DD 66 F9      [19]  919 	ld	h,-7 (ix)
   926C 56            [ 7]  920 	ld	d,(hl)
                            921 ;src/main.c:231: enemy->muerto = SI;
   926D 21 08 00      [10]  922 	ld	hl,#0x0008
   9270 09            [11]  923 	add	hl,bc
   9271 DD 75 FA      [19]  924 	ld	-6 (ix),l
   9274 DD 74 FB      [19]  925 	ld	-5 (ix),h
                            926 ;src/main.c:238: enemy->mira = M_izquierda;
   9277 21 07 00      [10]  927 	ld	hl,#0x0007
   927A 09            [11]  928 	add	hl,bc
   927B DD 75 FC      [19]  929 	ld	-4 (ix),l
   927E DD 74 FD      [19]  930 	ld	-3 (ix),h
                            931 ;src/main.c:216: switch (direction) {
   9281 D5            [11]  932 	push	de
   9282 DD 5E 04      [19]  933 	ld	e,4 (ix)
   9285 16 00         [ 7]  934 	ld	d,#0x00
   9287 21 8F 92      [10]  935 	ld	hl,#00273$
   928A 19            [11]  936 	add	hl,de
   928B 19            [11]  937 	add	hl,de
   928C 19            [11]  938 	add	hl,de
   928D D1            [10]  939 	pop	de
   928E E9            [ 4]  940 	jp	(hl)
   928F                     941 00273$:
   928F C3 9B 92      [10]  942 	jp	00101$
   9292 C3 74 93      [10]  943 	jp	00117$
   9295 C3 49 94      [10]  944 	jp	00133$
   9298 C3 18 95      [10]  945 	jp	00149$
                            946 ;src/main.c:217: case 0:
   929B                     947 00101$:
                            948 ;src/main.c:218: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   929B 7B            [ 4]  949 	ld	a,e
   929C C6 05         [ 7]  950 	add	a, #0x05
   929E C5            [11]  951 	push	bc
   929F D5            [11]  952 	push	de
   92A0 33            [ 6]  953 	inc	sp
   92A1 F5            [11]  954 	push	af
   92A2 33            [ 6]  955 	inc	sp
   92A3 CD EF 8E      [17]  956 	call	_getTilePtr
   92A6 F1            [10]  957 	pop	af
   92A7 C1            [10]  958 	pop	bc
   92A8 5E            [ 7]  959 	ld	e,(hl)
   92A9 3E 02         [ 7]  960 	ld	a,#0x02
   92AB 93            [ 4]  961 	sub	a, e
   92AC DA 69 93      [10]  962 	jp	C,00113$
                            963 ;src/main.c:219: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   92AF DD 6E F8      [19]  964 	ld	l,-8 (ix)
   92B2 DD 66 F9      [19]  965 	ld	h,-7 (ix)
   92B5 7E            [ 7]  966 	ld	a,(hl)
   92B6 C6 0B         [ 7]  967 	add	a, #0x0B
   92B8 57            [ 4]  968 	ld	d,a
   92B9 0A            [ 7]  969 	ld	a,(bc)
   92BA C6 05         [ 7]  970 	add	a, #0x05
   92BC C5            [11]  971 	push	bc
   92BD D5            [11]  972 	push	de
   92BE 33            [ 6]  973 	inc	sp
   92BF F5            [11]  974 	push	af
   92C0 33            [ 6]  975 	inc	sp
   92C1 CD EF 8E      [17]  976 	call	_getTilePtr
   92C4 F1            [10]  977 	pop	af
   92C5 C1            [10]  978 	pop	bc
   92C6 5E            [ 7]  979 	ld	e,(hl)
   92C7 3E 02         [ 7]  980 	ld	a,#0x02
   92C9 93            [ 4]  981 	sub	a, e
   92CA DA 69 93      [10]  982 	jp	C,00113$
                            983 ;src/main.c:220: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   92CD DD 6E F8      [19]  984 	ld	l,-8 (ix)
   92D0 DD 66 F9      [19]  985 	ld	h,-7 (ix)
   92D3 7E            [ 7]  986 	ld	a,(hl)
   92D4 C6 16         [ 7]  987 	add	a, #0x16
   92D6 57            [ 4]  988 	ld	d,a
   92D7 0A            [ 7]  989 	ld	a,(bc)
   92D8 C6 05         [ 7]  990 	add	a, #0x05
   92DA C5            [11]  991 	push	bc
   92DB D5            [11]  992 	push	de
   92DC 33            [ 6]  993 	inc	sp
   92DD F5            [11]  994 	push	af
   92DE 33            [ 6]  995 	inc	sp
   92DF CD EF 8E      [17]  996 	call	_getTilePtr
   92E2 F1            [10]  997 	pop	af
   92E3 C1            [10]  998 	pop	bc
   92E4 5E            [ 7]  999 	ld	e,(hl)
   92E5 3E 02         [ 7] 1000 	ld	a,#0x02
   92E7 93            [ 4] 1001 	sub	a, e
   92E8 DA 69 93      [10] 1002 	jp	C,00113$
                           1003 ;src/main.c:222: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   92EB 21 0C 8E      [10] 1004 	ld	hl, #_cu + 1
   92EE 5E            [ 7] 1005 	ld	e,(hl)
   92EF 16 00         [ 7] 1006 	ld	d,#0x00
   92F1 21 04 00      [10] 1007 	ld	hl,#0x0004
   92F4 19            [11] 1008 	add	hl,de
   92F5 DD 75 FE      [19] 1009 	ld	-2 (ix),l
   92F8 DD 74 FF      [19] 1010 	ld	-1 (ix),h
   92FB DD 6E F8      [19] 1011 	ld	l,-8 (ix)
   92FE DD 66 F9      [19] 1012 	ld	h,-7 (ix)
   9301 6E            [ 7] 1013 	ld	l,(hl)
   9302 26 00         [ 7] 1014 	ld	h,#0x00
   9304 DD 7E FE      [19] 1015 	ld	a,-2 (ix)
   9307 95            [ 4] 1016 	sub	a, l
   9308 DD 7E FF      [19] 1017 	ld	a,-1 (ix)
   930B 9C            [ 4] 1018 	sbc	a, h
   930C E2 11 93      [10] 1019 	jp	PO, 00274$
   930F EE 80         [ 7] 1020 	xor	a, #0x80
   9311                    1021 00274$:
   9311 FA 26 93      [10] 1022 	jp	M,00108$
   9314 D5            [11] 1023 	push	de
   9315 11 16 00      [10] 1024 	ld	de,#0x0016
   9318 19            [11] 1025 	add	hl, de
   9319 D1            [10] 1026 	pop	de
   931A 7D            [ 4] 1027 	ld	a,l
   931B 93            [ 4] 1028 	sub	a, e
   931C 7C            [ 4] 1029 	ld	a,h
   931D 9A            [ 4] 1030 	sbc	a, d
   931E E2 23 93      [10] 1031 	jp	PO, 00275$
   9321 EE 80         [ 7] 1032 	xor	a, #0x80
   9323                    1033 00275$:
   9323 F2 2D 93      [10] 1034 	jp	P,00109$
   9326                    1035 00108$:
                           1036 ;src/main.c:223: colisiona = 0;
   9326 DD 36 F7 00   [19] 1037 	ld	-9 (ix),#0x00
   932A C3 F2 95      [10] 1038 	jp	00165$
   932D                    1039 00109$:
                           1040 ;src/main.c:226: if(cu.x > enemy->x){ //si el cu esta abajo
   932D 21 0B 8E      [10] 1041 	ld	hl, #_cu + 0
   9330 5E            [ 7] 1042 	ld	e,(hl)
   9331 0A            [ 7] 1043 	ld	a,(bc)
   9332 4F            [ 4] 1044 	ld	c,a
   9333 93            [ 4] 1045 	sub	a, e
   9334 30 2C         [12] 1046 	jr	NC,00106$
                           1047 ;src/main.c:227: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
   9336 6B            [ 4] 1048 	ld	l,e
   9337 26 00         [ 7] 1049 	ld	h,#0x00
   9339 06 00         [ 7] 1050 	ld	b,#0x00
   933B 03            [ 6] 1051 	inc	bc
   933C 03            [ 6] 1052 	inc	bc
   933D 03            [ 6] 1053 	inc	bc
   933E 03            [ 6] 1054 	inc	bc
   933F BF            [ 4] 1055 	cp	a, a
   9340 ED 42         [15] 1056 	sbc	hl, bc
   9342 3E 01         [ 7] 1057 	ld	a,#0x01
   9344 BD            [ 4] 1058 	cp	a, l
   9345 3E 00         [ 7] 1059 	ld	a,#0x00
   9347 9C            [ 4] 1060 	sbc	a, h
   9348 E2 4D 93      [10] 1061 	jp	PO, 00276$
   934B EE 80         [ 7] 1062 	xor	a, #0x80
   934D                    1063 00276$:
   934D F2 57 93      [10] 1064 	jp	P,00103$
                           1065 ;src/main.c:228: colisiona = 0;
   9350 DD 36 F7 00   [19] 1066 	ld	-9 (ix),#0x00
   9354 C3 F2 95      [10] 1067 	jp	00165$
   9357                    1068 00103$:
                           1069 ;src/main.c:231: enemy->muerto = SI;
   9357 DD 6E FA      [19] 1070 	ld	l,-6 (ix)
   935A DD 66 FB      [19] 1071 	ld	h,-5 (ix)
   935D 36 01         [10] 1072 	ld	(hl),#0x01
   935F C3 F2 95      [10] 1073 	jp	00165$
   9362                    1074 00106$:
                           1075 ;src/main.c:234: colisiona = 0;
   9362 DD 36 F7 00   [19] 1076 	ld	-9 (ix),#0x00
   9366 C3 F2 95      [10] 1077 	jp	00165$
   9369                    1078 00113$:
                           1079 ;src/main.c:238: enemy->mira = M_izquierda;
   9369 DD 6E FC      [19] 1080 	ld	l,-4 (ix)
   936C DD 66 FD      [19] 1081 	ld	h,-3 (ix)
   936F 36 01         [10] 1082 	ld	(hl),#0x01
                           1083 ;src/main.c:240: break;
   9371 C3 F2 95      [10] 1084 	jp	00165$
                           1085 ;src/main.c:241: case 1:
   9374                    1086 00117$:
                           1087 ;src/main.c:242: if( *getTilePtr(enemy->x - 1, enemy->y) <= 2
   9374 1D            [ 4] 1088 	dec	e
   9375 C5            [11] 1089 	push	bc
   9376 D5            [11] 1090 	push	de
   9377 CD EF 8E      [17] 1091 	call	_getTilePtr
   937A F1            [10] 1092 	pop	af
   937B C1            [10] 1093 	pop	bc
   937C 5E            [ 7] 1094 	ld	e,(hl)
   937D 3E 02         [ 7] 1095 	ld	a,#0x02
   937F 93            [ 4] 1096 	sub	a, e
   9380 DA 3E 94      [10] 1097 	jp	C,00129$
                           1098 ;src/main.c:243: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   9383 DD 6E F8      [19] 1099 	ld	l,-8 (ix)
   9386 DD 66 F9      [19] 1100 	ld	h,-7 (ix)
   9389 7E            [ 7] 1101 	ld	a,(hl)
   938A C6 0B         [ 7] 1102 	add	a, #0x0B
   938C 57            [ 4] 1103 	ld	d,a
   938D 0A            [ 7] 1104 	ld	a,(bc)
   938E C6 FF         [ 7] 1105 	add	a,#0xFF
   9390 C5            [11] 1106 	push	bc
   9391 D5            [11] 1107 	push	de
   9392 33            [ 6] 1108 	inc	sp
   9393 F5            [11] 1109 	push	af
   9394 33            [ 6] 1110 	inc	sp
   9395 CD EF 8E      [17] 1111 	call	_getTilePtr
   9398 F1            [10] 1112 	pop	af
   9399 C1            [10] 1113 	pop	bc
   939A 5E            [ 7] 1114 	ld	e,(hl)
   939B 3E 02         [ 7] 1115 	ld	a,#0x02
   939D 93            [ 4] 1116 	sub	a, e
   939E DA 3E 94      [10] 1117 	jp	C,00129$
                           1118 ;src/main.c:244: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   93A1 DD 6E F8      [19] 1119 	ld	l,-8 (ix)
   93A4 DD 66 F9      [19] 1120 	ld	h,-7 (ix)
   93A7 7E            [ 7] 1121 	ld	a,(hl)
   93A8 C6 16         [ 7] 1122 	add	a, #0x16
   93AA 57            [ 4] 1123 	ld	d,a
   93AB 0A            [ 7] 1124 	ld	a,(bc)
   93AC C6 FF         [ 7] 1125 	add	a,#0xFF
   93AE C5            [11] 1126 	push	bc
   93AF D5            [11] 1127 	push	de
   93B0 33            [ 6] 1128 	inc	sp
   93B1 F5            [11] 1129 	push	af
   93B2 33            [ 6] 1130 	inc	sp
   93B3 CD EF 8E      [17] 1131 	call	_getTilePtr
   93B6 F1            [10] 1132 	pop	af
   93B7 C1            [10] 1133 	pop	bc
   93B8 5E            [ 7] 1134 	ld	e,(hl)
   93B9 3E 02         [ 7] 1135 	ld	a,#0x02
   93BB 93            [ 4] 1136 	sub	a, e
   93BC DA 3E 94      [10] 1137 	jp	C,00129$
                           1138 ;src/main.c:246: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   93BF 21 0C 8E      [10] 1139 	ld	hl, #_cu + 1
   93C2 5E            [ 7] 1140 	ld	e,(hl)
   93C3 16 00         [ 7] 1141 	ld	d,#0x00
   93C5 21 04 00      [10] 1142 	ld	hl,#0x0004
   93C8 19            [11] 1143 	add	hl,de
   93C9 DD 75 FE      [19] 1144 	ld	-2 (ix),l
   93CC DD 74 FF      [19] 1145 	ld	-1 (ix),h
   93CF DD 6E F8      [19] 1146 	ld	l,-8 (ix)
   93D2 DD 66 F9      [19] 1147 	ld	h,-7 (ix)
   93D5 6E            [ 7] 1148 	ld	l,(hl)
   93D6 26 00         [ 7] 1149 	ld	h,#0x00
   93D8 DD 7E FE      [19] 1150 	ld	a,-2 (ix)
   93DB 95            [ 4] 1151 	sub	a, l
   93DC DD 7E FF      [19] 1152 	ld	a,-1 (ix)
   93DF 9C            [ 4] 1153 	sbc	a, h
   93E0 E2 E5 93      [10] 1154 	jp	PO, 00277$
   93E3 EE 80         [ 7] 1155 	xor	a, #0x80
   93E5                    1156 00277$:
   93E5 FA FA 93      [10] 1157 	jp	M,00124$
   93E8 D5            [11] 1158 	push	de
   93E9 11 16 00      [10] 1159 	ld	de,#0x0016
   93EC 19            [11] 1160 	add	hl, de
   93ED D1            [10] 1161 	pop	de
   93EE 7D            [ 4] 1162 	ld	a,l
   93EF 93            [ 4] 1163 	sub	a, e
   93F0 7C            [ 4] 1164 	ld	a,h
   93F1 9A            [ 4] 1165 	sbc	a, d
   93F2 E2 F7 93      [10] 1166 	jp	PO, 00278$
   93F5 EE 80         [ 7] 1167 	xor	a, #0x80
   93F7                    1168 00278$:
   93F7 F2 01 94      [10] 1169 	jp	P,00125$
   93FA                    1170 00124$:
                           1171 ;src/main.c:247: colisiona = 0;
   93FA DD 36 F7 00   [19] 1172 	ld	-9 (ix),#0x00
   93FE C3 F2 95      [10] 1173 	jp	00165$
   9401                    1174 00125$:
                           1175 ;src/main.c:250: if(enemy->x > cu.x){ //si el cu esta abajo
   9401 0A            [ 7] 1176 	ld	a,(bc)
   9402 5F            [ 4] 1177 	ld	e,a
   9403 21 0B 8E      [10] 1178 	ld	hl, #_cu + 0
   9406 4E            [ 7] 1179 	ld	c,(hl)
   9407 79            [ 4] 1180 	ld	a,c
   9408 93            [ 4] 1181 	sub	a, e
   9409 30 2C         [12] 1182 	jr	NC,00122$
                           1183 ;src/main.c:251: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
   940B 6B            [ 4] 1184 	ld	l,e
   940C 26 00         [ 7] 1185 	ld	h,#0x00
   940E 06 00         [ 7] 1186 	ld	b,#0x00
   9410 03            [ 6] 1187 	inc	bc
   9411 03            [ 6] 1188 	inc	bc
   9412 03            [ 6] 1189 	inc	bc
   9413 03            [ 6] 1190 	inc	bc
   9414 BF            [ 4] 1191 	cp	a, a
   9415 ED 42         [15] 1192 	sbc	hl, bc
   9417 3E 01         [ 7] 1193 	ld	a,#0x01
   9419 BD            [ 4] 1194 	cp	a, l
   941A 3E 00         [ 7] 1195 	ld	a,#0x00
   941C 9C            [ 4] 1196 	sbc	a, h
   941D E2 22 94      [10] 1197 	jp	PO, 00279$
   9420 EE 80         [ 7] 1198 	xor	a, #0x80
   9422                    1199 00279$:
   9422 F2 2C 94      [10] 1200 	jp	P,00119$
                           1201 ;src/main.c:252: colisiona = 0;
   9425 DD 36 F7 00   [19] 1202 	ld	-9 (ix),#0x00
   9429 C3 F2 95      [10] 1203 	jp	00165$
   942C                    1204 00119$:
                           1205 ;src/main.c:255: enemy->muerto = SI;
   942C DD 6E FA      [19] 1206 	ld	l,-6 (ix)
   942F DD 66 FB      [19] 1207 	ld	h,-5 (ix)
   9432 36 01         [10] 1208 	ld	(hl),#0x01
   9434 C3 F2 95      [10] 1209 	jp	00165$
   9437                    1210 00122$:
                           1211 ;src/main.c:258: colisiona = 0;
   9437 DD 36 F7 00   [19] 1212 	ld	-9 (ix),#0x00
   943B C3 F2 95      [10] 1213 	jp	00165$
   943E                    1214 00129$:
                           1215 ;src/main.c:262: enemy->mira = M_derecha;
   943E DD 6E FC      [19] 1216 	ld	l,-4 (ix)
   9441 DD 66 FD      [19] 1217 	ld	h,-3 (ix)
   9444 36 00         [10] 1218 	ld	(hl),#0x00
                           1219 ;src/main.c:264: break;
   9446 C3 F2 95      [10] 1220 	jp	00165$
                           1221 ;src/main.c:265: case 2:
   9449                    1222 00133$:
                           1223 ;src/main.c:266: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   9449 15            [ 4] 1224 	dec	d
   944A 15            [ 4] 1225 	dec	d
   944B C5            [11] 1226 	push	bc
   944C D5            [11] 1227 	push	de
   944D CD EF 8E      [17] 1228 	call	_getTilePtr
   9450 F1            [10] 1229 	pop	af
   9451 C1            [10] 1230 	pop	bc
   9452 5E            [ 7] 1231 	ld	e,(hl)
   9453 3E 02         [ 7] 1232 	ld	a,#0x02
   9455 93            [ 4] 1233 	sub	a, e
   9456 DA 10 95      [10] 1234 	jp	C,00145$
                           1235 ;src/main.c:267: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   9459 DD 6E F8      [19] 1236 	ld	l,-8 (ix)
   945C DD 66 F9      [19] 1237 	ld	h,-7 (ix)
   945F 56            [ 7] 1238 	ld	d,(hl)
   9460 15            [ 4] 1239 	dec	d
   9461 15            [ 4] 1240 	dec	d
   9462 0A            [ 7] 1241 	ld	a,(bc)
   9463 C6 02         [ 7] 1242 	add	a, #0x02
   9465 C5            [11] 1243 	push	bc
   9466 D5            [11] 1244 	push	de
   9467 33            [ 6] 1245 	inc	sp
   9468 F5            [11] 1246 	push	af
   9469 33            [ 6] 1247 	inc	sp
   946A CD EF 8E      [17] 1248 	call	_getTilePtr
   946D F1            [10] 1249 	pop	af
   946E C1            [10] 1250 	pop	bc
   946F 5E            [ 7] 1251 	ld	e,(hl)
   9470 3E 02         [ 7] 1252 	ld	a,#0x02
   9472 93            [ 4] 1253 	sub	a, e
   9473 DA 10 95      [10] 1254 	jp	C,00145$
                           1255 ;src/main.c:268: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   9476 DD 6E F8      [19] 1256 	ld	l,-8 (ix)
   9479 DD 66 F9      [19] 1257 	ld	h,-7 (ix)
   947C 56            [ 7] 1258 	ld	d,(hl)
   947D 15            [ 4] 1259 	dec	d
   947E 15            [ 4] 1260 	dec	d
   947F 0A            [ 7] 1261 	ld	a,(bc)
   9480 C6 04         [ 7] 1262 	add	a, #0x04
   9482 C5            [11] 1263 	push	bc
   9483 D5            [11] 1264 	push	de
   9484 33            [ 6] 1265 	inc	sp
   9485 F5            [11] 1266 	push	af
   9486 33            [ 6] 1267 	inc	sp
   9487 CD EF 8E      [17] 1268 	call	_getTilePtr
   948A F1            [10] 1269 	pop	af
   948B C1            [10] 1270 	pop	bc
   948C 5E            [ 7] 1271 	ld	e,(hl)
   948D 3E 02         [ 7] 1272 	ld	a,#0x02
   948F 93            [ 4] 1273 	sub	a, e
   9490 DA 10 95      [10] 1274 	jp	C,00145$
                           1275 ;src/main.c:270: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   9493 21 0B 8E      [10] 1276 	ld	hl, #_cu + 0
   9496 5E            [ 7] 1277 	ld	e,(hl)
   9497 16 00         [ 7] 1278 	ld	d,#0x00
   9499 21 02 00      [10] 1279 	ld	hl,#0x0002
   949C 19            [11] 1280 	add	hl,de
   949D DD 75 FE      [19] 1281 	ld	-2 (ix),l
   94A0 DD 74 FF      [19] 1282 	ld	-1 (ix),h
   94A3 0A            [ 7] 1283 	ld	a,(bc)
   94A4 6F            [ 4] 1284 	ld	l,a
   94A5 26 00         [ 7] 1285 	ld	h,#0x00
   94A7 DD 7E FE      [19] 1286 	ld	a,-2 (ix)
   94AA 95            [ 4] 1287 	sub	a, l
   94AB DD 7E FF      [19] 1288 	ld	a,-1 (ix)
   94AE 9C            [ 4] 1289 	sbc	a, h
   94AF E2 B4 94      [10] 1290 	jp	PO, 00280$
   94B2 EE 80         [ 7] 1291 	xor	a, #0x80
   94B4                    1292 00280$:
   94B4 FA C7 94      [10] 1293 	jp	M,00140$
   94B7 23            [ 6] 1294 	inc	hl
   94B8 23            [ 6] 1295 	inc	hl
   94B9 23            [ 6] 1296 	inc	hl
   94BA 23            [ 6] 1297 	inc	hl
   94BB 7D            [ 4] 1298 	ld	a,l
   94BC 93            [ 4] 1299 	sub	a, e
   94BD 7C            [ 4] 1300 	ld	a,h
   94BE 9A            [ 4] 1301 	sbc	a, d
   94BF E2 C4 94      [10] 1302 	jp	PO, 00281$
   94C2 EE 80         [ 7] 1303 	xor	a, #0x80
   94C4                    1304 00281$:
   94C4 F2 CD 94      [10] 1305 	jp	P,00141$
   94C7                    1306 00140$:
                           1307 ;src/main.c:272: colisiona = 0;
   94C7 DD 36 F7 00   [19] 1308 	ld	-9 (ix),#0x00
   94CB 18 4B         [12] 1309 	jr	00149$
   94CD                    1310 00141$:
                           1311 ;src/main.c:275: if(enemy->y>cu.y){
   94CD DD 6E F8      [19] 1312 	ld	l,-8 (ix)
   94D0 DD 66 F9      [19] 1313 	ld	h,-7 (ix)
   94D3 5E            [ 7] 1314 	ld	e,(hl)
   94D4 21 0C 8E      [10] 1315 	ld	hl, #(_cu + 0x0001) + 0
   94D7 6E            [ 7] 1316 	ld	l,(hl)
   94D8 7D            [ 4] 1317 	ld	a,l
   94D9 93            [ 4] 1318 	sub	a, e
   94DA 30 2E         [12] 1319 	jr	NC,00138$
                           1320 ;src/main.c:276: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   94DC 16 00         [ 7] 1321 	ld	d,#0x00
   94DE 26 00         [ 7] 1322 	ld	h,#0x00
   94E0 D5            [11] 1323 	push	de
   94E1 11 08 00      [10] 1324 	ld	de,#0x0008
   94E4 19            [11] 1325 	add	hl, de
   94E5 D1            [10] 1326 	pop	de
   94E6 7B            [ 4] 1327 	ld	a,e
   94E7 95            [ 4] 1328 	sub	a, l
   94E8 5F            [ 4] 1329 	ld	e,a
   94E9 7A            [ 4] 1330 	ld	a,d
   94EA 9C            [ 4] 1331 	sbc	a, h
   94EB 57            [ 4] 1332 	ld	d,a
   94EC 3E 02         [ 7] 1333 	ld	a,#0x02
   94EE BB            [ 4] 1334 	cp	a, e
   94EF 3E 00         [ 7] 1335 	ld	a,#0x00
   94F1 9A            [ 4] 1336 	sbc	a, d
   94F2 E2 F7 94      [10] 1337 	jp	PO, 00282$
   94F5 EE 80         [ 7] 1338 	xor	a, #0x80
   94F7                    1339 00282$:
   94F7 F2 00 95      [10] 1340 	jp	P,00135$
                           1341 ;src/main.c:277: colisiona = 0;
   94FA DD 36 F7 00   [19] 1342 	ld	-9 (ix),#0x00
   94FE 18 18         [12] 1343 	jr	00149$
   9500                    1344 00135$:
                           1345 ;src/main.c:280: enemy->muerto = SI;
   9500 DD 6E FA      [19] 1346 	ld	l,-6 (ix)
   9503 DD 66 FB      [19] 1347 	ld	h,-5 (ix)
   9506 36 01         [10] 1348 	ld	(hl),#0x01
   9508 18 0E         [12] 1349 	jr	00149$
   950A                    1350 00138$:
                           1351 ;src/main.c:284: colisiona = 0;
   950A DD 36 F7 00   [19] 1352 	ld	-9 (ix),#0x00
   950E 18 08         [12] 1353 	jr	00149$
   9510                    1354 00145$:
                           1355 ;src/main.c:290: enemy->mira = M_abajo;
   9510 DD 6E FC      [19] 1356 	ld	l,-4 (ix)
   9513 DD 66 FD      [19] 1357 	ld	h,-3 (ix)
   9516 36 03         [10] 1358 	ld	(hl),#0x03
                           1359 ;src/main.c:293: case 3:
   9518                    1360 00149$:
                           1361 ;src/main.c:296: if( *getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   9518 DD 6E F8      [19] 1362 	ld	l,-8 (ix)
   951B DD 66 F9      [19] 1363 	ld	h,-7 (ix)
   951E 7E            [ 7] 1364 	ld	a,(hl)
   951F C6 18         [ 7] 1365 	add	a, #0x18
   9521 57            [ 4] 1366 	ld	d,a
   9522 0A            [ 7] 1367 	ld	a,(bc)
   9523 C5            [11] 1368 	push	bc
   9524 D5            [11] 1369 	push	de
   9525 33            [ 6] 1370 	inc	sp
   9526 F5            [11] 1371 	push	af
   9527 33            [ 6] 1372 	inc	sp
   9528 CD EF 8E      [17] 1373 	call	_getTilePtr
   952B F1            [10] 1374 	pop	af
   952C C1            [10] 1375 	pop	bc
   952D 5E            [ 7] 1376 	ld	e,(hl)
   952E 3E 02         [ 7] 1377 	ld	a,#0x02
   9530 93            [ 4] 1378 	sub	a, e
   9531 DA EA 95      [10] 1379 	jp	C,00161$
                           1380 ;src/main.c:297: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   9534 DD 6E F8      [19] 1381 	ld	l,-8 (ix)
   9537 DD 66 F9      [19] 1382 	ld	h,-7 (ix)
   953A 7E            [ 7] 1383 	ld	a,(hl)
   953B C6 18         [ 7] 1384 	add	a, #0x18
   953D 57            [ 4] 1385 	ld	d,a
   953E 0A            [ 7] 1386 	ld	a,(bc)
   953F C6 02         [ 7] 1387 	add	a, #0x02
   9541 C5            [11] 1388 	push	bc
   9542 D5            [11] 1389 	push	de
   9543 33            [ 6] 1390 	inc	sp
   9544 F5            [11] 1391 	push	af
   9545 33            [ 6] 1392 	inc	sp
   9546 CD EF 8E      [17] 1393 	call	_getTilePtr
   9549 F1            [10] 1394 	pop	af
   954A C1            [10] 1395 	pop	bc
   954B 5E            [ 7] 1396 	ld	e,(hl)
   954C 3E 02         [ 7] 1397 	ld	a,#0x02
   954E 93            [ 4] 1398 	sub	a, e
   954F DA EA 95      [10] 1399 	jp	C,00161$
                           1400 ;src/main.c:298: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   9552 DD 6E F8      [19] 1401 	ld	l,-8 (ix)
   9555 DD 66 F9      [19] 1402 	ld	h,-7 (ix)
   9558 7E            [ 7] 1403 	ld	a,(hl)
   9559 C6 18         [ 7] 1404 	add	a, #0x18
   955B 57            [ 4] 1405 	ld	d,a
   955C 0A            [ 7] 1406 	ld	a,(bc)
   955D C6 04         [ 7] 1407 	add	a, #0x04
   955F C5            [11] 1408 	push	bc
   9560 D5            [11] 1409 	push	de
   9561 33            [ 6] 1410 	inc	sp
   9562 F5            [11] 1411 	push	af
   9563 33            [ 6] 1412 	inc	sp
   9564 CD EF 8E      [17] 1413 	call	_getTilePtr
   9567 F1            [10] 1414 	pop	af
   9568 C1            [10] 1415 	pop	bc
   9569 5E            [ 7] 1416 	ld	e,(hl)
   956A 3E 02         [ 7] 1417 	ld	a,#0x02
   956C 93            [ 4] 1418 	sub	a, e
   956D 38 7B         [12] 1419 	jr	C,00161$
                           1420 ;src/main.c:300: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   956F 21 0B 8E      [10] 1421 	ld	hl, #_cu + 0
   9572 5E            [ 7] 1422 	ld	e,(hl)
   9573 16 00         [ 7] 1423 	ld	d,#0x00
   9575 21 02 00      [10] 1424 	ld	hl,#0x0002
   9578 19            [11] 1425 	add	hl,de
   9579 DD 75 FE      [19] 1426 	ld	-2 (ix),l
   957C DD 74 FF      [19] 1427 	ld	-1 (ix),h
   957F 0A            [ 7] 1428 	ld	a,(bc)
   9580 4F            [ 4] 1429 	ld	c,a
   9581 06 00         [ 7] 1430 	ld	b,#0x00
   9583 DD 7E FE      [19] 1431 	ld	a,-2 (ix)
   9586 91            [ 4] 1432 	sub	a, c
   9587 DD 7E FF      [19] 1433 	ld	a,-1 (ix)
   958A 98            [ 4] 1434 	sbc	a, b
   958B E2 90 95      [10] 1435 	jp	PO, 00283$
   958E EE 80         [ 7] 1436 	xor	a, #0x80
   9590                    1437 00283$:
   9590 FA A3 95      [10] 1438 	jp	M,00156$
   9593 03            [ 6] 1439 	inc	bc
   9594 03            [ 6] 1440 	inc	bc
   9595 03            [ 6] 1441 	inc	bc
   9596 03            [ 6] 1442 	inc	bc
   9597 79            [ 4] 1443 	ld	a,c
   9598 93            [ 4] 1444 	sub	a, e
   9599 78            [ 4] 1445 	ld	a,b
   959A 9A            [ 4] 1446 	sbc	a, d
   959B E2 A0 95      [10] 1447 	jp	PO, 00284$
   959E EE 80         [ 7] 1448 	xor	a, #0x80
   95A0                    1449 00284$:
   95A0 F2 A9 95      [10] 1450 	jp	P,00157$
   95A3                    1451 00156$:
                           1452 ;src/main.c:301: colisiona = 0;
   95A3 DD 36 F7 00   [19] 1453 	ld	-9 (ix),#0x00
   95A7 18 49         [12] 1454 	jr	00165$
   95A9                    1455 00157$:
                           1456 ;src/main.c:304: if(cu.y > enemy->y){ //si el cu esta abajo
   95A9 21 0C 8E      [10] 1457 	ld	hl, #(_cu + 0x0001) + 0
   95AC 4E            [ 7] 1458 	ld	c,(hl)
   95AD DD 6E F8      [19] 1459 	ld	l,-8 (ix)
   95B0 DD 66 F9      [19] 1460 	ld	h,-7 (ix)
   95B3 5E            [ 7] 1461 	ld	e,(hl)
   95B4 7B            [ 4] 1462 	ld	a,e
   95B5 91            [ 4] 1463 	sub	a, c
   95B6 30 2C         [12] 1464 	jr	NC,00154$
                           1465 ;src/main.c:305: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   95B8 06 00         [ 7] 1466 	ld	b,#0x00
   95BA 16 00         [ 7] 1467 	ld	d,#0x00
   95BC 21 16 00      [10] 1468 	ld	hl,#0x0016
   95BF 19            [11] 1469 	add	hl,de
   95C0 79            [ 4] 1470 	ld	a,c
   95C1 95            [ 4] 1471 	sub	a, l
   95C2 4F            [ 4] 1472 	ld	c,a
   95C3 78            [ 4] 1473 	ld	a,b
   95C4 9C            [ 4] 1474 	sbc	a, h
   95C5 47            [ 4] 1475 	ld	b,a
   95C6 3E 02         [ 7] 1476 	ld	a,#0x02
   95C8 B9            [ 4] 1477 	cp	a, c
   95C9 3E 00         [ 7] 1478 	ld	a,#0x00
   95CB 98            [ 4] 1479 	sbc	a, b
   95CC E2 D1 95      [10] 1480 	jp	PO, 00285$
   95CF EE 80         [ 7] 1481 	xor	a, #0x80
   95D1                    1482 00285$:
   95D1 F2 DA 95      [10] 1483 	jp	P,00151$
                           1484 ;src/main.c:306: colisiona = 0;
   95D4 DD 36 F7 00   [19] 1485 	ld	-9 (ix),#0x00
   95D8 18 18         [12] 1486 	jr	00165$
   95DA                    1487 00151$:
                           1488 ;src/main.c:309: enemy->muerto = SI;
   95DA DD 6E FA      [19] 1489 	ld	l,-6 (ix)
   95DD DD 66 FB      [19] 1490 	ld	h,-5 (ix)
   95E0 36 01         [10] 1491 	ld	(hl),#0x01
   95E2 18 0E         [12] 1492 	jr	00165$
   95E4                    1493 00154$:
                           1494 ;src/main.c:313: colisiona = 0;
   95E4 DD 36 F7 00   [19] 1495 	ld	-9 (ix),#0x00
   95E8 18 08         [12] 1496 	jr	00165$
   95EA                    1497 00161$:
                           1498 ;src/main.c:317: enemy->mira = M_arriba;
   95EA DD 6E FC      [19] 1499 	ld	l,-4 (ix)
   95ED DD 66 FD      [19] 1500 	ld	h,-3 (ix)
   95F0 36 02         [10] 1501 	ld	(hl),#0x02
                           1502 ;src/main.c:320: }
   95F2                    1503 00165$:
                           1504 ;src/main.c:321: return colisiona;
   95F2 DD 6E F7      [19] 1505 	ld	l,-9 (ix)
   95F5 DD F9         [10] 1506 	ld	sp, ix
   95F7 DD E1         [14] 1507 	pop	ix
   95F9 C9            [10] 1508 	ret
                           1509 ;src/main.c:324: void moverEnemigoArriba(TEnemy *enemy){
                           1510 ;	---------------------------------
                           1511 ; Function moverEnemigoArriba
                           1512 ; ---------------------------------
   95FA                    1513 _moverEnemigoArriba::
   95FA DD E5         [15] 1514 	push	ix
   95FC DD 21 00 00   [14] 1515 	ld	ix,#0
   9600 DD 39         [15] 1516 	add	ix,sp
                           1517 ;src/main.c:325: enemy->y--;
   9602 DD 4E 04      [19] 1518 	ld	c,4 (ix)
   9605 DD 46 05      [19] 1519 	ld	b,5 (ix)
   9608 69            [ 4] 1520 	ld	l, c
   9609 60            [ 4] 1521 	ld	h, b
   960A 23            [ 6] 1522 	inc	hl
   960B 5E            [ 7] 1523 	ld	e,(hl)
   960C 1D            [ 4] 1524 	dec	e
   960D 73            [ 7] 1525 	ld	(hl),e
                           1526 ;src/main.c:326: enemy->y--;
   960E 1D            [ 4] 1527 	dec	e
   960F 73            [ 7] 1528 	ld	(hl),e
                           1529 ;src/main.c:327: enemy->mover = SI;
   9610 21 06 00      [10] 1530 	ld	hl,#0x0006
   9613 09            [11] 1531 	add	hl,bc
   9614 36 01         [10] 1532 	ld	(hl),#0x01
   9616 DD E1         [14] 1533 	pop	ix
   9618 C9            [10] 1534 	ret
                           1535 ;src/main.c:330: void moverEnemigoAbajo(TEnemy *enemy){
                           1536 ;	---------------------------------
                           1537 ; Function moverEnemigoAbajo
                           1538 ; ---------------------------------
   9619                    1539 _moverEnemigoAbajo::
   9619 DD E5         [15] 1540 	push	ix
   961B DD 21 00 00   [14] 1541 	ld	ix,#0
   961F DD 39         [15] 1542 	add	ix,sp
                           1543 ;src/main.c:331: enemy->y++;
   9621 DD 4E 04      [19] 1544 	ld	c,4 (ix)
   9624 DD 46 05      [19] 1545 	ld	b,5 (ix)
   9627 59            [ 4] 1546 	ld	e, c
   9628 50            [ 4] 1547 	ld	d, b
   9629 13            [ 6] 1548 	inc	de
   962A 1A            [ 7] 1549 	ld	a,(de)
   962B 3C            [ 4] 1550 	inc	a
   962C 12            [ 7] 1551 	ld	(de),a
                           1552 ;src/main.c:332: enemy->y++;
   962D 3C            [ 4] 1553 	inc	a
   962E 12            [ 7] 1554 	ld	(de),a
                           1555 ;src/main.c:333: enemy->mover = SI;
   962F 21 06 00      [10] 1556 	ld	hl,#0x0006
   9632 09            [11] 1557 	add	hl,bc
   9633 36 01         [10] 1558 	ld	(hl),#0x01
   9635 DD E1         [14] 1559 	pop	ix
   9637 C9            [10] 1560 	ret
                           1561 ;src/main.c:336: void moverEnemigoDerecha(TEnemy *enemy){
                           1562 ;	---------------------------------
                           1563 ; Function moverEnemigoDerecha
                           1564 ; ---------------------------------
   9638                    1565 _moverEnemigoDerecha::
                           1566 ;src/main.c:337: enemy->x++;
   9638 D1            [10] 1567 	pop	de
   9639 C1            [10] 1568 	pop	bc
   963A C5            [11] 1569 	push	bc
   963B D5            [11] 1570 	push	de
   963C 0A            [ 7] 1571 	ld	a,(bc)
   963D 3C            [ 4] 1572 	inc	a
   963E 02            [ 7] 1573 	ld	(bc),a
                           1574 ;src/main.c:338: enemy->x++;
   963F 3C            [ 4] 1575 	inc	a
   9640 02            [ 7] 1576 	ld	(bc),a
                           1577 ;src/main.c:339: enemy->mover = SI;
   9641 21 06 00      [10] 1578 	ld	hl,#0x0006
   9644 09            [11] 1579 	add	hl,bc
   9645 36 01         [10] 1580 	ld	(hl),#0x01
   9647 C9            [10] 1581 	ret
                           1582 ;src/main.c:342: void moverEnemigoIzquierda(TEnemy *enemy){
                           1583 ;	---------------------------------
                           1584 ; Function moverEnemigoIzquierda
                           1585 ; ---------------------------------
   9648                    1586 _moverEnemigoIzquierda::
                           1587 ;src/main.c:343: enemy->x--;
   9648 D1            [10] 1588 	pop	de
   9649 C1            [10] 1589 	pop	bc
   964A C5            [11] 1590 	push	bc
   964B D5            [11] 1591 	push	de
   964C 0A            [ 7] 1592 	ld	a,(bc)
   964D C6 FF         [ 7] 1593 	add	a,#0xFF
   964F 02            [ 7] 1594 	ld	(bc),a
                           1595 ;src/main.c:344: enemy->x--;
   9650 C6 FF         [ 7] 1596 	add	a,#0xFF
   9652 02            [ 7] 1597 	ld	(bc),a
                           1598 ;src/main.c:345: enemy->mover = SI;
   9653 21 06 00      [10] 1599 	ld	hl,#0x0006
   9656 09            [11] 1600 	add	hl,bc
   9657 36 01         [10] 1601 	ld	(hl),#0x01
   9659 C9            [10] 1602 	ret
                           1603 ;src/main.c:348: void moverEnemigo(TEnemy *enemy){
                           1604 ;	---------------------------------
                           1605 ; Function moverEnemigo
                           1606 ; ---------------------------------
   965A                    1607 _moverEnemigo::
   965A DD E5         [15] 1608 	push	ix
   965C DD 21 00 00   [14] 1609 	ld	ix,#0
   9660 DD 39         [15] 1610 	add	ix,sp
                           1611 ;src/main.c:349: if(!enemy->muerto){
   9662 DD 4E 04      [19] 1612 	ld	c,4 (ix)
   9665 DD 46 05      [19] 1613 	ld	b,5 (ix)
   9668 C5            [11] 1614 	push	bc
   9669 FD E1         [14] 1615 	pop	iy
   966B FD 7E 08      [19] 1616 	ld	a,8 (iy)
   966E B7            [ 4] 1617 	or	a, a
   966F 20 46         [12] 1618 	jr	NZ,00110$
                           1619 ;src/main.c:350: if(!checkEnemyCollision(enemy->mira, enemy)){
   9671 21 07 00      [10] 1620 	ld	hl,#0x0007
   9674 09            [11] 1621 	add	hl,bc
   9675 5E            [ 7] 1622 	ld	e,(hl)
   9676 16 00         [ 7] 1623 	ld	d,#0x00
   9678 E5            [11] 1624 	push	hl
   9679 C5            [11] 1625 	push	bc
   967A C5            [11] 1626 	push	bc
   967B D5            [11] 1627 	push	de
   967C CD 2A 92      [17] 1628 	call	_checkEnemyCollision
   967F F1            [10] 1629 	pop	af
   9680 F1            [10] 1630 	pop	af
   9681 7D            [ 4] 1631 	ld	a,l
   9682 C1            [10] 1632 	pop	bc
   9683 E1            [10] 1633 	pop	hl
   9684 B7            [ 4] 1634 	or	a, a
   9685 20 30         [12] 1635 	jr	NZ,00110$
                           1636 ;src/main.c:352: switch (enemy->mira) {
   9687 5E            [ 7] 1637 	ld	e,(hl)
   9688 3E 03         [ 7] 1638 	ld	a,#0x03
   968A 93            [ 4] 1639 	sub	a, e
   968B 38 2A         [12] 1640 	jr	C,00110$
   968D 16 00         [ 7] 1641 	ld	d,#0x00
   968F 21 95 96      [10] 1642 	ld	hl,#00124$
   9692 19            [11] 1643 	add	hl,de
   9693 19            [11] 1644 	add	hl,de
                           1645 ;src/main.c:354: case 0:
   9694 E9            [ 4] 1646 	jp	(hl)
   9695                    1647 00124$:
   9695 18 06         [12] 1648 	jr	00101$
   9697 18 0B         [12] 1649 	jr	00102$
   9699 18 10         [12] 1650 	jr	00103$
   969B 18 15         [12] 1651 	jr	00104$
   969D                    1652 00101$:
                           1653 ;src/main.c:355: moverEnemigoDerecha(enemy);
   969D C5            [11] 1654 	push	bc
   969E CD 38 96      [17] 1655 	call	_moverEnemigoDerecha
   96A1 F1            [10] 1656 	pop	af
                           1657 ;src/main.c:356: break;
   96A2 18 13         [12] 1658 	jr	00110$
                           1659 ;src/main.c:357: case 1:
   96A4                    1660 00102$:
                           1661 ;src/main.c:358: moverEnemigoIzquierda(enemy);
   96A4 C5            [11] 1662 	push	bc
   96A5 CD 48 96      [17] 1663 	call	_moverEnemigoIzquierda
   96A8 F1            [10] 1664 	pop	af
                           1665 ;src/main.c:359: break;
   96A9 18 0C         [12] 1666 	jr	00110$
                           1667 ;src/main.c:360: case 2:
   96AB                    1668 00103$:
                           1669 ;src/main.c:361: moverEnemigoArriba(enemy);
   96AB C5            [11] 1670 	push	bc
   96AC CD FA 95      [17] 1671 	call	_moverEnemigoArriba
   96AF F1            [10] 1672 	pop	af
                           1673 ;src/main.c:362: break;
   96B0 18 05         [12] 1674 	jr	00110$
                           1675 ;src/main.c:363: case 3:
   96B2                    1676 00104$:
                           1677 ;src/main.c:364: moverEnemigoAbajo(enemy);
   96B2 C5            [11] 1678 	push	bc
   96B3 CD 19 96      [17] 1679 	call	_moverEnemigoAbajo
   96B6 F1            [10] 1680 	pop	af
                           1681 ;src/main.c:366: }
   96B7                    1682 00110$:
   96B7 DD E1         [14] 1683 	pop	ix
   96B9 C9            [10] 1684 	ret
                           1685 ;src/main.c:371: void inicializarEnemy() {
                           1686 ;	---------------------------------
                           1687 ; Function inicializarEnemy
                           1688 ; ---------------------------------
   96BA                    1689 _inicializarEnemy::
   96BA DD E5         [15] 1690 	push	ix
   96BC DD 21 00 00   [14] 1691 	ld	ix,#0
   96C0 DD 39         [15] 1692 	add	ix,sp
   96C2 3B            [ 6] 1693 	dec	sp
                           1694 ;src/main.c:372: u8 i = (2 + num_mapa) + 1; //sacar distinto numero dependiendo del mapa
   96C3 3A 17 8E      [13] 1695 	ld	a,(#_num_mapa + 0)
   96C6 C6 03         [ 7] 1696 	add	a, #0x03
   96C8 DD 77 FF      [19] 1697 	ld	-1 (ix),a
                           1698 ;src/main.c:377: actual = enemy;
   96CB 11 CF 8D      [10] 1699 	ld	de,#_enemy+0
                           1700 ;src/main.c:378: while(--i){
   96CE                    1701 00101$:
   96CE DD 35 FF      [23] 1702 	dec	-1 (ix)
   96D1 DD 7E FF      [19] 1703 	ld	a,-1 (ix)
   96D4 B7            [ 4] 1704 	or	a, a
   96D5 28 61         [12] 1705 	jr	Z,00104$
                           1706 ;src/main.c:379: actual->x = actual->px = spawnX[i];
   96D7 4B            [ 4] 1707 	ld	c, e
   96D8 42            [ 4] 1708 	ld	b, d
   96D9 03            [ 6] 1709 	inc	bc
   96DA 03            [ 6] 1710 	inc	bc
   96DB 3E 37         [ 7] 1711 	ld	a,#<(_spawnX)
   96DD DD 86 FF      [19] 1712 	add	a, -1 (ix)
   96E0 6F            [ 4] 1713 	ld	l,a
   96E1 3E 8E         [ 7] 1714 	ld	a,#>(_spawnX)
   96E3 CE 00         [ 7] 1715 	adc	a, #0x00
   96E5 67            [ 4] 1716 	ld	h,a
   96E6 7E            [ 7] 1717 	ld	a,(hl)
   96E7 02            [ 7] 1718 	ld	(bc),a
   96E8 12            [ 7] 1719 	ld	(de),a
                           1720 ;src/main.c:380: actual->y = actual->py = spawnY[i];
   96E9 D5            [11] 1721 	push	de
   96EA FD E1         [14] 1722 	pop	iy
   96EC FD 23         [10] 1723 	inc	iy
   96EE 4B            [ 4] 1724 	ld	c, e
   96EF 42            [ 4] 1725 	ld	b, d
   96F0 03            [ 6] 1726 	inc	bc
   96F1 03            [ 6] 1727 	inc	bc
   96F2 03            [ 6] 1728 	inc	bc
   96F3 3E 3C         [ 7] 1729 	ld	a,#<(_spawnY)
   96F5 DD 86 FF      [19] 1730 	add	a, -1 (ix)
   96F8 6F            [ 4] 1731 	ld	l,a
   96F9 3E 8E         [ 7] 1732 	ld	a,#>(_spawnY)
   96FB CE 00         [ 7] 1733 	adc	a, #0x00
   96FD 67            [ 4] 1734 	ld	h,a
   96FE 7E            [ 7] 1735 	ld	a,(hl)
   96FF 02            [ 7] 1736 	ld	(bc),a
   9700 FD 77 00      [19] 1737 	ld	0 (iy), a
                           1738 ;src/main.c:381: actual->mover  = NO;
   9703 21 06 00      [10] 1739 	ld	hl,#0x0006
   9706 19            [11] 1740 	add	hl,de
   9707 36 00         [10] 1741 	ld	(hl),#0x00
                           1742 ;src/main.c:382: actual->mira   = M_abajo;
   9709 21 07 00      [10] 1743 	ld	hl,#0x0007
   970C 19            [11] 1744 	add	hl,de
   970D 36 03         [10] 1745 	ld	(hl),#0x03
                           1746 ;src/main.c:383: actual->sprite = g_enemy;
   970F 21 04 00      [10] 1747 	ld	hl,#0x0004
   9712 19            [11] 1748 	add	hl,de
   9713 36 3A         [10] 1749 	ld	(hl),#<(_g_enemy)
   9715 23            [ 6] 1750 	inc	hl
   9716 36 79         [10] 1751 	ld	(hl),#>(_g_enemy)
                           1752 ;src/main.c:384: actual->muerto = NO;
   9718 21 08 00      [10] 1753 	ld	hl,#0x0008
   971B 19            [11] 1754 	add	hl,de
   971C 36 00         [10] 1755 	ld	(hl),#0x00
                           1756 ;src/main.c:385: actual->muertes = 0;
   971E 21 0C 00      [10] 1757 	ld	hl,#0x000C
   9721 19            [11] 1758 	add	hl,de
   9722 36 00         [10] 1759 	ld	(hl),#0x00
                           1760 ;src/main.c:386: actual->patroling = SI;
   9724 21 09 00      [10] 1761 	ld	hl,#0x0009
   9727 19            [11] 1762 	add	hl,de
   9728 36 01         [10] 1763 	ld	(hl),#0x01
                           1764 ;src/main.c:388: dibujarEnemigo(actual);
   972A D5            [11] 1765 	push	de
   972B D5            [11] 1766 	push	de
   972C CD 85 90      [17] 1767 	call	_dibujarEnemigo
   972F F1            [10] 1768 	pop	af
   9730 D1            [10] 1769 	pop	de
                           1770 ;src/main.c:390: ++actual;
   9731 21 0D 00      [10] 1771 	ld	hl,#0x000D
   9734 19            [11] 1772 	add	hl,de
   9735 EB            [ 4] 1773 	ex	de,hl
   9736 18 96         [12] 1774 	jr	00101$
   9738                    1775 00104$:
   9738 33            [ 6] 1776 	inc	sp
   9739 DD E1         [14] 1777 	pop	ix
   973B C9            [10] 1778 	ret
                           1779 ;src/main.c:394: void avanzarMapa() {
                           1780 ;	---------------------------------
                           1781 ; Function avanzarMapa
                           1782 ; ---------------------------------
   973C                    1783 _avanzarMapa::
                           1784 ;src/main.c:395: if(num_mapa < NUM_MAPAS -1) {
   973C 3A 17 8E      [13] 1785 	ld	a,(#_num_mapa + 0)
   973F D6 02         [ 7] 1786 	sub	a, #0x02
   9741 D2 0A 7C      [10] 1787 	jp	NC,_menuFin
                           1788 ;src/main.c:396: mapa = mapas[++num_mapa];
   9744 21 17 8E      [10] 1789 	ld	hl, #_num_mapa+0
   9747 34            [11] 1790 	inc	(hl)
   9748 FD 21 17 8E   [14] 1791 	ld	iy,#_num_mapa
   974C FD 6E 00      [19] 1792 	ld	l,0 (iy)
   974F 26 00         [ 7] 1793 	ld	h,#0x00
   9751 29            [11] 1794 	add	hl, hl
   9752 11 31 8E      [10] 1795 	ld	de,#_mapas
   9755 19            [11] 1796 	add	hl,de
   9756 7E            [ 7] 1797 	ld	a,(hl)
   9757 FD 21 15 8E   [14] 1798 	ld	iy,#_mapa
   975B FD 77 00      [19] 1799 	ld	0 (iy),a
   975E 23            [ 6] 1800 	inc	hl
   975F 7E            [ 7] 1801 	ld	a,(hl)
   9760 32 16 8E      [13] 1802 	ld	(#_mapa + 1),a
                           1803 ;src/main.c:397: prota.x = prota.px = 2;
   9763 21 05 8E      [10] 1804 	ld	hl,#(_prota + 0x0002)
   9766 36 02         [10] 1805 	ld	(hl),#0x02
   9768 21 03 8E      [10] 1806 	ld	hl,#_prota
   976B 36 02         [10] 1807 	ld	(hl),#0x02
                           1808 ;src/main.c:398: prota.mover = SI;
   976D 21 09 8E      [10] 1809 	ld	hl,#(_prota + 0x0006)
   9770 36 01         [10] 1810 	ld	(hl),#0x01
                           1811 ;src/main.c:399: dibujarMapa();
   9772 CD 1B 8E      [17] 1812 	call	_dibujarMapa
                           1813 ;src/main.c:400: inicializarEnemy();
   9775 C3 BA 96      [10] 1814 	jp  _inicializarEnemy
                           1815 ;src/main.c:404: menuFin();
   9778 C3 0A 7C      [10] 1816 	jp  _menuFin
                           1817 ;src/main.c:408: void moverIzquierda() {
                           1818 ;	---------------------------------
                           1819 ; Function moverIzquierda
                           1820 ; ---------------------------------
   977B                    1821 _moverIzquierda::
                           1822 ;src/main.c:409: prota.mira = M_izquierda;
   977B 01 03 8E      [10] 1823 	ld	bc,#_prota+0
   977E 21 0A 8E      [10] 1824 	ld	hl,#(_prota + 0x0007)
   9781 36 01         [10] 1825 	ld	(hl),#0x01
                           1826 ;src/main.c:410: if (!checkCollision(M_izquierda)) {
   9783 C5            [11] 1827 	push	bc
   9784 21 01 00      [10] 1828 	ld	hl,#0x0001
   9787 E5            [11] 1829 	push	hl
   9788 CD 30 8F      [17] 1830 	call	_checkCollision
   978B F1            [10] 1831 	pop	af
   978C C1            [10] 1832 	pop	bc
   978D 7D            [ 4] 1833 	ld	a,l
   978E B7            [ 4] 1834 	or	a, a
   978F C0            [11] 1835 	ret	NZ
                           1836 ;src/main.c:411: prota.x--;
   9790 0A            [ 7] 1837 	ld	a,(bc)
   9791 C6 FF         [ 7] 1838 	add	a,#0xFF
   9793 02            [ 7] 1839 	ld	(bc),a
                           1840 ;src/main.c:412: prota.mover = SI;
   9794 21 09 8E      [10] 1841 	ld	hl,#(_prota + 0x0006)
   9797 36 01         [10] 1842 	ld	(hl),#0x01
                           1843 ;src/main.c:413: prota.sprite = g_hero_left;
   9799 21 C6 7A      [10] 1844 	ld	hl,#_g_hero_left
   979C 22 07 8E      [16] 1845 	ld	((_prota + 0x0004)), hl
   979F C9            [10] 1846 	ret
                           1847 ;src/main.c:417: void moverDerecha() {
                           1848 ;	---------------------------------
                           1849 ; Function moverDerecha
                           1850 ; ---------------------------------
   97A0                    1851 _moverDerecha::
                           1852 ;src/main.c:418: prota.mira = M_derecha;
   97A0 21 0A 8E      [10] 1853 	ld	hl,#(_prota + 0x0007)
   97A3 36 00         [10] 1854 	ld	(hl),#0x00
                           1855 ;src/main.c:419: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   97A5 21 00 00      [10] 1856 	ld	hl,#0x0000
   97A8 E5            [11] 1857 	push	hl
   97A9 CD 30 8F      [17] 1858 	call	_checkCollision
   97AC F1            [10] 1859 	pop	af
   97AD 45            [ 4] 1860 	ld	b,l
   97AE 21 03 8E      [10] 1861 	ld	hl, #_prota + 0
   97B1 4E            [ 7] 1862 	ld	c,(hl)
   97B2 59            [ 4] 1863 	ld	e,c
   97B3 16 00         [ 7] 1864 	ld	d,#0x00
   97B5 21 07 00      [10] 1865 	ld	hl,#0x0007
   97B8 19            [11] 1866 	add	hl,de
   97B9 11 50 80      [10] 1867 	ld	de, #0x8050
   97BC 29            [11] 1868 	add	hl, hl
   97BD 3F            [ 4] 1869 	ccf
   97BE CB 1C         [ 8] 1870 	rr	h
   97C0 CB 1D         [ 8] 1871 	rr	l
   97C2 ED 52         [15] 1872 	sbc	hl, de
   97C4 3E 00         [ 7] 1873 	ld	a,#0x00
   97C6 17            [ 4] 1874 	rla
   97C7 5F            [ 4] 1875 	ld	e,a
   97C8 78            [ 4] 1876 	ld	a,b
   97C9 B7            [ 4] 1877 	or	a,a
   97CA 20 14         [12] 1878 	jr	NZ,00104$
   97CC B3            [ 4] 1879 	or	a,e
   97CD 28 11         [12] 1880 	jr	Z,00104$
                           1881 ;src/main.c:420: prota.x++;
   97CF 0C            [ 4] 1882 	inc	c
   97D0 21 03 8E      [10] 1883 	ld	hl,#_prota
   97D3 71            [ 7] 1884 	ld	(hl),c
                           1885 ;src/main.c:421: prota.mover = SI;
   97D4 21 09 8E      [10] 1886 	ld	hl,#(_prota + 0x0006)
   97D7 36 01         [10] 1887 	ld	(hl),#0x01
                           1888 ;src/main.c:422: prota.sprite = g_hero;
   97D9 21 70 7B      [10] 1889 	ld	hl,#_g_hero
   97DC 22 07 8E      [16] 1890 	ld	((_prota + 0x0004)), hl
   97DF C9            [10] 1891 	ret
   97E0                    1892 00104$:
                           1893 ;src/main.c:424: }else if( prota.x + G_HERO_W >= 80){
   97E0 7B            [ 4] 1894 	ld	a,e
   97E1 B7            [ 4] 1895 	or	a, a
   97E2 C0            [11] 1896 	ret	NZ
                           1897 ;src/main.c:425: avanzarMapa();
   97E3 C3 3C 97      [10] 1898 	jp  _avanzarMapa
                           1899 ;src/main.c:429: void moverArriba() {
                           1900 ;	---------------------------------
                           1901 ; Function moverArriba
                           1902 ; ---------------------------------
   97E6                    1903 _moverArriba::
                           1904 ;src/main.c:430: prota.mira = M_arriba;
   97E6 21 0A 8E      [10] 1905 	ld	hl,#(_prota + 0x0007)
   97E9 36 02         [10] 1906 	ld	(hl),#0x02
                           1907 ;src/main.c:431: if (!checkCollision(M_arriba)) { 
   97EB 21 02 00      [10] 1908 	ld	hl,#0x0002
   97EE E5            [11] 1909 	push	hl
   97EF CD 30 8F      [17] 1910 	call	_checkCollision
   97F2 F1            [10] 1911 	pop	af
   97F3 7D            [ 4] 1912 	ld	a,l
   97F4 B7            [ 4] 1913 	or	a, a
   97F5 C0            [11] 1914 	ret	NZ
                           1915 ;src/main.c:432: prota.y--;
   97F6 21 04 8E      [10] 1916 	ld	hl,#_prota + 1
   97F9 4E            [ 7] 1917 	ld	c,(hl)
   97FA 0D            [ 4] 1918 	dec	c
   97FB 71            [ 7] 1919 	ld	(hl),c
                           1920 ;src/main.c:433: prota.y--;
   97FC 0D            [ 4] 1921 	dec	c
   97FD 71            [ 7] 1922 	ld	(hl),c
                           1923 ;src/main.c:434: prota.mover  = SI;
   97FE 21 09 8E      [10] 1924 	ld	hl,#(_prota + 0x0006)
   9801 36 01         [10] 1925 	ld	(hl),#0x01
                           1926 ;src/main.c:435: prota.sprite = g_hero_up;
   9803 21 2C 7A      [10] 1927 	ld	hl,#_g_hero_up
   9806 22 07 8E      [16] 1928 	ld	((_prota + 0x0004)), hl
   9809 C9            [10] 1929 	ret
                           1930 ;src/main.c:439: void moverAbajo() {
                           1931 ;	---------------------------------
                           1932 ; Function moverAbajo
                           1933 ; ---------------------------------
   980A                    1934 _moverAbajo::
                           1935 ;src/main.c:440: prota.mira = M_abajo;
   980A 21 0A 8E      [10] 1936 	ld	hl,#(_prota + 0x0007)
   980D 36 03         [10] 1937 	ld	(hl),#0x03
                           1938 ;src/main.c:441: if (!checkCollision(M_abajo) ) { 
   980F 21 03 00      [10] 1939 	ld	hl,#0x0003
   9812 E5            [11] 1940 	push	hl
   9813 CD 30 8F      [17] 1941 	call	_checkCollision
   9816 F1            [10] 1942 	pop	af
   9817 7D            [ 4] 1943 	ld	a,l
   9818 B7            [ 4] 1944 	or	a, a
   9819 C0            [11] 1945 	ret	NZ
                           1946 ;src/main.c:442: prota.y++;
   981A 01 04 8E      [10] 1947 	ld	bc,#_prota + 1
   981D 0A            [ 7] 1948 	ld	a,(bc)
   981E 3C            [ 4] 1949 	inc	a
   981F 02            [ 7] 1950 	ld	(bc),a
                           1951 ;src/main.c:443: prota.y++;
   9820 3C            [ 4] 1952 	inc	a
   9821 02            [ 7] 1953 	ld	(bc),a
                           1954 ;src/main.c:444: prota.mover  = SI;
   9822 21 09 8E      [10] 1955 	ld	hl,#(_prota + 0x0006)
   9825 36 01         [10] 1956 	ld	(hl),#0x01
                           1957 ;src/main.c:445: prota.sprite = g_hero_down;
   9827 21 92 79      [10] 1958 	ld	hl,#_g_hero_down
   982A 22 07 8E      [16] 1959 	ld	((_prota + 0x0004)), hl
   982D C9            [10] 1960 	ret
                           1961 ;src/main.c:449: void dibujarCuchillo() {
                           1962 ;	---------------------------------
                           1963 ; Function dibujarCuchillo
                           1964 ; ---------------------------------
   982E                    1965 _dibujarCuchillo::
   982E DD E5         [15] 1966 	push	ix
   9830 DD 21 00 00   [14] 1967 	ld	ix,#0
   9834 DD 39         [15] 1968 	add	ix,sp
   9836 F5            [11] 1969 	push	af
                           1970 ;src/main.c:450: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   9837 21 0C 8E      [10] 1971 	ld	hl, #_cu + 1
   983A 56            [ 7] 1972 	ld	d,(hl)
   983B 21 0B 8E      [10] 1973 	ld	hl, #_cu + 0
   983E 46            [ 7] 1974 	ld	b,(hl)
   983F D5            [11] 1975 	push	de
   9840 33            [ 6] 1976 	inc	sp
   9841 C5            [11] 1977 	push	bc
   9842 33            [ 6] 1978 	inc	sp
   9843 21 00 C0      [10] 1979 	ld	hl,#0xC000
   9846 E5            [11] 1980 	push	hl
   9847 CD 72 8D      [17] 1981 	call	_cpct_getScreenPtr
   984A 45            [ 4] 1982 	ld	b,l
   984B 5C            [ 4] 1983 	ld	e,h
                           1984 ;src/main.c:451: if(cu.eje == E_X){
   984C 21 13 8E      [10] 1985 	ld	hl, #_cu + 8
   984F 4E            [ 7] 1986 	ld	c,(hl)
                           1987 ;src/main.c:452: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   9850 DD 70 FE      [19] 1988 	ld	-2 (ix),b
   9853 DD 73 FF      [19] 1989 	ld	-1 (ix),e
                           1990 ;src/main.c:451: if(cu.eje == E_X){
   9856 79            [ 4] 1991 	ld	a,c
   9857 B7            [ 4] 1992 	or	a, a
   9858 20 19         [12] 1993 	jr	NZ,00104$
                           1994 ;src/main.c:452: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   985A 11 00 3E      [10] 1995 	ld	de,#_g_tablatrans+0
   985D ED 4B 0F 8E   [20] 1996 	ld	bc, (#(_cu + 0x0004) + 0)
   9861 D5            [11] 1997 	push	de
   9862 21 04 04      [10] 1998 	ld	hl,#0x0404
   9865 E5            [11] 1999 	push	hl
   9866 DD 6E FE      [19] 2000 	ld	l,-2 (ix)
   9869 DD 66 FF      [19] 2001 	ld	h,-1 (ix)
   986C E5            [11] 2002 	push	hl
   986D C5            [11] 2003 	push	bc
   986E CD 92 8D      [17] 2004 	call	_cpct_drawSpriteMaskedAlignedTable
   9871 18 1A         [12] 2005 	jr	00106$
   9873                    2006 00104$:
                           2007 ;src/main.c:455: else if(cu.eje == E_Y){
   9873 0D            [ 4] 2008 	dec	c
   9874 20 17         [12] 2009 	jr	NZ,00106$
                           2010 ;src/main.c:456: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   9876 11 00 3E      [10] 2011 	ld	de,#_g_tablatrans+0
   9879 ED 4B 0F 8E   [20] 2012 	ld	bc, (#(_cu + 0x0004) + 0)
   987D D5            [11] 2013 	push	de
   987E 21 02 08      [10] 2014 	ld	hl,#0x0802
   9881 E5            [11] 2015 	push	hl
   9882 DD 6E FE      [19] 2016 	ld	l,-2 (ix)
   9885 DD 66 FF      [19] 2017 	ld	h,-1 (ix)
   9888 E5            [11] 2018 	push	hl
   9889 C5            [11] 2019 	push	bc
   988A CD 92 8D      [17] 2020 	call	_cpct_drawSpriteMaskedAlignedTable
   988D                    2021 00106$:
   988D DD F9         [10] 2022 	ld	sp, ix
   988F DD E1         [14] 2023 	pop	ix
   9891 C9            [10] 2024 	ret
                           2025 ;src/main.c:460: void borrarCuchillo() {
                           2026 ;	---------------------------------
                           2027 ; Function borrarCuchillo
                           2028 ; ---------------------------------
   9892                    2029 _borrarCuchillo::
   9892 DD E5         [15] 2030 	push	ix
   9894 DD 21 00 00   [14] 2031 	ld	ix,#0
   9898 DD 39         [15] 2032 	add	ix,sp
   989A F5            [11] 2033 	push	af
   989B 3B            [ 6] 2034 	dec	sp
                           2035 ;src/main.c:462: u8 w = 2 + (cu.px & 1);
   989C 21 0D 8E      [10] 2036 	ld	hl, #_cu + 2
   989F 4E            [ 7] 2037 	ld	c,(hl)
   98A0 79            [ 4] 2038 	ld	a,c
   98A1 E6 01         [ 7] 2039 	and	a, #0x01
   98A3 47            [ 4] 2040 	ld	b,a
   98A4 04            [ 4] 2041 	inc	b
   98A5 04            [ 4] 2042 	inc	b
                           2043 ;src/main.c:463: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   98A6 21 0E 8E      [10] 2044 	ld	hl, #_cu + 3
   98A9 5E            [ 7] 2045 	ld	e,(hl)
   98AA 7B            [ 4] 2046 	ld	a,e
   98AB E6 03         [ 7] 2047 	and	a, #0x03
   98AD 28 04         [12] 2048 	jr	Z,00105$
   98AF 3E 01         [ 7] 2049 	ld	a,#0x01
   98B1 18 02         [12] 2050 	jr	00106$
   98B3                    2051 00105$:
   98B3 3E 00         [ 7] 2052 	ld	a,#0x00
   98B5                    2053 00106$:
   98B5 C6 02         [ 7] 2054 	add	a, #0x02
   98B7 DD 77 FD      [19] 2055 	ld	-3 (ix),a
                           2056 ;src/main.c:464: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   98BA FD 2A 15 8E   [20] 2057 	ld	iy,(_mapa)
   98BE 16 00         [ 7] 2058 	ld	d,#0x00
   98C0 7B            [ 4] 2059 	ld	a,e
   98C1 C6 E8         [ 7] 2060 	add	a,#0xE8
   98C3 DD 77 FE      [19] 2061 	ld	-2 (ix),a
   98C6 7A            [ 4] 2062 	ld	a,d
   98C7 CE FF         [ 7] 2063 	adc	a,#0xFF
   98C9 DD 77 FF      [19] 2064 	ld	-1 (ix),a
   98CC DD 6E FE      [19] 2065 	ld	l,-2 (ix)
   98CF DD 66 FF      [19] 2066 	ld	h,-1 (ix)
   98D2 DD CB FF 7E   [20] 2067 	bit	7, -1 (ix)
   98D6 28 04         [12] 2068 	jr	Z,00107$
   98D8 21 EB FF      [10] 2069 	ld	hl,#0xFFEB
   98DB 19            [11] 2070 	add	hl,de
   98DC                    2071 00107$:
   98DC CB 2C         [ 8] 2072 	sra	h
   98DE CB 1D         [ 8] 2073 	rr	l
   98E0 CB 2C         [ 8] 2074 	sra	h
   98E2 CB 1D         [ 8] 2075 	rr	l
   98E4 55            [ 4] 2076 	ld	d,l
   98E5 CB 39         [ 8] 2077 	srl	c
   98E7 FD E5         [15] 2078 	push	iy
   98E9 21 F0 C0      [10] 2079 	ld	hl,#0xC0F0
   98EC E5            [11] 2080 	push	hl
   98ED 3E 28         [ 7] 2081 	ld	a,#0x28
   98EF F5            [11] 2082 	push	af
   98F0 33            [ 6] 2083 	inc	sp
   98F1 DD 7E FD      [19] 2084 	ld	a,-3 (ix)
   98F4 F5            [11] 2085 	push	af
   98F5 33            [ 6] 2086 	inc	sp
   98F6 C5            [11] 2087 	push	bc
   98F7 33            [ 6] 2088 	inc	sp
   98F8 D5            [11] 2089 	push	de
   98F9 33            [ 6] 2090 	inc	sp
   98FA 79            [ 4] 2091 	ld	a,c
   98FB F5            [11] 2092 	push	af
   98FC 33            [ 6] 2093 	inc	sp
   98FD CD 6B 82      [17] 2094 	call	_cpct_etm_drawTileBox2x4
                           2095 ;src/main.c:465: if(!cu.mover){
   9900 3A 14 8E      [13] 2096 	ld	a, (#_cu + 9)
   9903 B7            [ 4] 2097 	or	a, a
   9904 20 05         [12] 2098 	jr	NZ,00103$
                           2099 ;src/main.c:466: cu.lanzado = NO;
   9906 21 11 8E      [10] 2100 	ld	hl,#(_cu + 0x0006)
   9909 36 00         [10] 2101 	ld	(hl),#0x00
   990B                    2102 00103$:
   990B DD F9         [10] 2103 	ld	sp, ix
   990D DD E1         [14] 2104 	pop	ix
   990F C9            [10] 2105 	ret
                           2106 ;src/main.c:470: void redibujarCuchillo( ) {
                           2107 ;	---------------------------------
                           2108 ; Function redibujarCuchillo
                           2109 ; ---------------------------------
   9910                    2110 _redibujarCuchillo::
                           2111 ;src/main.c:471: borrarCuchillo();
   9910 CD 92 98      [17] 2112 	call	_borrarCuchillo
                           2113 ;src/main.c:472: cu.px = cu.x;
   9913 01 0D 8E      [10] 2114 	ld	bc,#_cu + 2
   9916 3A 0B 8E      [13] 2115 	ld	a, (#_cu + 0)
   9919 02            [ 7] 2116 	ld	(bc),a
                           2117 ;src/main.c:473: cu.py = cu.y;
   991A 01 0E 8E      [10] 2118 	ld	bc,#_cu + 3
   991D 3A 0C 8E      [13] 2119 	ld	a, (#_cu + 1)
   9920 02            [ 7] 2120 	ld	(bc),a
                           2121 ;src/main.c:474: dibujarCuchillo();
   9921 C3 2E 98      [10] 2122 	jp  _dibujarCuchillo
                           2123 ;src/main.c:477: void lanzarCuchillo(){
                           2124 ;	---------------------------------
                           2125 ; Function lanzarCuchillo
                           2126 ; ---------------------------------
   9924                    2127 _lanzarCuchillo::
                           2128 ;src/main.c:479: if(!cu.lanzado){
   9924 3A 11 8E      [13] 2129 	ld	a, (#(_cu + 0x0006) + 0)
   9927 B7            [ 4] 2130 	or	a, a
   9928 C0            [11] 2131 	ret	NZ
                           2132 ;src/main.c:481: if(prota.mira == M_derecha){
   9929 21 0A 8E      [10] 2133 	ld	hl, #_prota + 7
   992C 5E            [ 7] 2134 	ld	e,(hl)
                           2135 ;src/main.c:482: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   992D 01 04 8E      [10] 2136 	ld	bc,#_prota + 1
                           2137 ;src/main.c:484: cu.direccion = M_derecha;
                           2138 ;src/main.c:486: cu.y=prota.y + G_HERO_H /2;
                           2139 ;src/main.c:487: cu.sprite=g_knifeX_0;
                           2140 ;src/main.c:488: cu.eje = E_X;
                           2141 ;src/main.c:481: if(prota.mira == M_derecha){
   9930 7B            [ 4] 2142 	ld	a,e
   9931 B7            [ 4] 2143 	or	a, a
   9932 20 41         [12] 2144 	jr	NZ,00118$
                           2145 ;src/main.c:482: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   9934 0A            [ 7] 2146 	ld	a,(bc)
   9935 C6 0B         [ 7] 2147 	add	a, #0x0B
   9937 5F            [ 4] 2148 	ld	e,a
   9938 3A 03 8E      [13] 2149 	ld	a, (#_prota + 0)
   993B C6 0C         [ 7] 2150 	add	a, #0x0C
   993D 6F            [ 4] 2151 	ld	l,a
   993E C5            [11] 2152 	push	bc
   993F 7B            [ 4] 2153 	ld	a,e
   9940 F5            [11] 2154 	push	af
   9941 33            [ 6] 2155 	inc	sp
   9942 7D            [ 4] 2156 	ld	a,l
   9943 F5            [11] 2157 	push	af
   9944 33            [ 6] 2158 	inc	sp
   9945 CD EF 8E      [17] 2159 	call	_getTilePtr
   9948 F1            [10] 2160 	pop	af
   9949 C1            [10] 2161 	pop	bc
   994A 5E            [ 7] 2162 	ld	e,(hl)
   994B 3E 02         [ 7] 2163 	ld	a,#0x02
   994D 93            [ 4] 2164 	sub	a, e
   994E D8            [11] 2165 	ret	C
                           2166 ;src/main.c:483: cu.lanzado = SI;
   994F 21 11 8E      [10] 2167 	ld	hl,#(_cu + 0x0006)
   9952 36 01         [10] 2168 	ld	(hl),#0x01
                           2169 ;src/main.c:484: cu.direccion = M_derecha;
   9954 21 12 8E      [10] 2170 	ld	hl,#(_cu + 0x0007)
   9957 36 00         [10] 2171 	ld	(hl),#0x00
                           2172 ;src/main.c:485: cu.x=prota.x + G_HERO_W;
   9959 3A 03 8E      [13] 2173 	ld	a, (#_prota + 0)
   995C C6 07         [ 7] 2174 	add	a, #0x07
   995E 32 0B 8E      [13] 2175 	ld	(#_cu),a
                           2176 ;src/main.c:486: cu.y=prota.y + G_HERO_H /2;
   9961 0A            [ 7] 2177 	ld	a,(bc)
   9962 C6 0B         [ 7] 2178 	add	a, #0x0B
   9964 32 0C 8E      [13] 2179 	ld	(#(_cu + 0x0001)),a
                           2180 ;src/main.c:487: cu.sprite=g_knifeX_0;
   9967 21 C0 54      [10] 2181 	ld	hl,#_g_knifeX_0
   996A 22 0F 8E      [16] 2182 	ld	((_cu + 0x0004)), hl
                           2183 ;src/main.c:488: cu.eje = E_X;
   996D 21 13 8E      [10] 2184 	ld	hl,#(_cu + 0x0008)
   9970 36 00         [10] 2185 	ld	(hl),#0x00
                           2186 ;src/main.c:489: dibujarCuchillo();
   9972 C3 2E 98      [10] 2187 	jp  _dibujarCuchillo
   9975                    2188 00118$:
                           2189 ;src/main.c:492: else if(prota.mira == M_izquierda){
   9975 7B            [ 4] 2190 	ld	a,e
   9976 3D            [ 4] 2191 	dec	a
   9977 20 41         [12] 2192 	jr	NZ,00115$
                           2193 ;src/main.c:493: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   9979 0A            [ 7] 2194 	ld	a,(bc)
   997A C6 0B         [ 7] 2195 	add	a, #0x0B
   997C 5F            [ 4] 2196 	ld	e,a
   997D 3A 03 8E      [13] 2197 	ld	a, (#_prota + 0)
   9980 C6 F6         [ 7] 2198 	add	a,#0xF6
   9982 6F            [ 4] 2199 	ld	l,a
   9983 C5            [11] 2200 	push	bc
   9984 7B            [ 4] 2201 	ld	a,e
   9985 F5            [11] 2202 	push	af
   9986 33            [ 6] 2203 	inc	sp
   9987 7D            [ 4] 2204 	ld	a,l
   9988 F5            [11] 2205 	push	af
   9989 33            [ 6] 2206 	inc	sp
   998A CD EF 8E      [17] 2207 	call	_getTilePtr
   998D F1            [10] 2208 	pop	af
   998E C1            [10] 2209 	pop	bc
   998F 5E            [ 7] 2210 	ld	e,(hl)
   9990 3E 02         [ 7] 2211 	ld	a,#0x02
   9992 93            [ 4] 2212 	sub	a, e
   9993 D8            [11] 2213 	ret	C
                           2214 ;src/main.c:494: cu.lanzado = SI;
   9994 21 11 8E      [10] 2215 	ld	hl,#(_cu + 0x0006)
   9997 36 01         [10] 2216 	ld	(hl),#0x01
                           2217 ;src/main.c:495: cu.direccion = M_izquierda;
   9999 21 12 8E      [10] 2218 	ld	hl,#(_cu + 0x0007)
   999C 36 01         [10] 2219 	ld	(hl),#0x01
                           2220 ;src/main.c:496: cu.x = prota.x - G_KNIFEX_0_W;
   999E 3A 03 8E      [13] 2221 	ld	a, (#_prota + 0)
   99A1 C6 FC         [ 7] 2222 	add	a,#0xFC
   99A3 32 0B 8E      [13] 2223 	ld	(#_cu),a
                           2224 ;src/main.c:497: cu.y = prota.y + G_HERO_H /2;
   99A6 0A            [ 7] 2225 	ld	a,(bc)
   99A7 C6 0B         [ 7] 2226 	add	a, #0x0B
   99A9 32 0C 8E      [13] 2227 	ld	(#(_cu + 0x0001)),a
                           2228 ;src/main.c:498: cu.sprite = g_knifeX_1;
   99AC 21 D0 54      [10] 2229 	ld	hl,#_g_knifeX_1
   99AF 22 0F 8E      [16] 2230 	ld	((_cu + 0x0004)), hl
                           2231 ;src/main.c:499: cu.eje = E_X;
   99B2 21 13 8E      [10] 2232 	ld	hl,#(_cu + 0x0008)
   99B5 36 00         [10] 2233 	ld	(hl),#0x00
                           2234 ;src/main.c:500: dibujarCuchillo();
   99B7 C3 2E 98      [10] 2235 	jp  _dibujarCuchillo
   99BA                    2236 00115$:
                           2237 ;src/main.c:503: else if(prota.mira == M_abajo){
   99BA 7B            [ 4] 2238 	ld	a,e
   99BB D6 03         [ 7] 2239 	sub	a, #0x03
   99BD 20 41         [12] 2240 	jr	NZ,00112$
                           2241 ;src/main.c:505: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   99BF 0A            [ 7] 2242 	ld	a,(bc)
   99C0 C6 1F         [ 7] 2243 	add	a, #0x1F
   99C2 5F            [ 4] 2244 	ld	e,a
   99C3 3A 03 8E      [13] 2245 	ld	a, (#_prota + 0)
   99C6 57            [ 4] 2246 	ld	d,a
   99C7 14            [ 4] 2247 	inc	d
   99C8 14            [ 4] 2248 	inc	d
   99C9 14            [ 4] 2249 	inc	d
   99CA C5            [11] 2250 	push	bc
   99CB 7B            [ 4] 2251 	ld	a,e
   99CC F5            [11] 2252 	push	af
   99CD 33            [ 6] 2253 	inc	sp
   99CE D5            [11] 2254 	push	de
   99CF 33            [ 6] 2255 	inc	sp
   99D0 CD EF 8E      [17] 2256 	call	_getTilePtr
   99D3 F1            [10] 2257 	pop	af
   99D4 C1            [10] 2258 	pop	bc
   99D5 5E            [ 7] 2259 	ld	e,(hl)
   99D6 3E 02         [ 7] 2260 	ld	a,#0x02
   99D8 93            [ 4] 2261 	sub	a, e
   99D9 D8            [11] 2262 	ret	C
                           2263 ;src/main.c:506: cu.lanzado = SI;
   99DA 21 11 8E      [10] 2264 	ld	hl,#(_cu + 0x0006)
   99DD 36 01         [10] 2265 	ld	(hl),#0x01
                           2266 ;src/main.c:507: cu.direccion = M_abajo;
   99DF 21 12 8E      [10] 2267 	ld	hl,#(_cu + 0x0007)
   99E2 36 03         [10] 2268 	ld	(hl),#0x03
                           2269 ;src/main.c:508: cu.x = prota.x + G_HERO_W / 2;
   99E4 3A 03 8E      [13] 2270 	ld	a, (#_prota + 0)
   99E7 C6 03         [ 7] 2271 	add	a, #0x03
   99E9 32 0B 8E      [13] 2272 	ld	(#_cu),a
                           2273 ;src/main.c:509: cu.y = prota.y + G_HERO_H;
   99EC 0A            [ 7] 2274 	ld	a,(bc)
   99ED C6 16         [ 7] 2275 	add	a, #0x16
   99EF 32 0C 8E      [13] 2276 	ld	(#(_cu + 0x0001)),a
                           2277 ;src/main.c:510: cu.sprite = g_knifeY_0;
   99F2 21 A0 54      [10] 2278 	ld	hl,#_g_knifeY_0
   99F5 22 0F 8E      [16] 2279 	ld	((_cu + 0x0004)), hl
                           2280 ;src/main.c:511: cu.eje = E_Y;
   99F8 21 13 8E      [10] 2281 	ld	hl,#(_cu + 0x0008)
   99FB 36 01         [10] 2282 	ld	(hl),#0x01
                           2283 ;src/main.c:512: dibujarCuchillo();
   99FD C3 2E 98      [10] 2284 	jp  _dibujarCuchillo
   9A00                    2285 00112$:
                           2286 ;src/main.c:515: else if(prota.mira == M_arriba){
   9A00 7B            [ 4] 2287 	ld	a,e
   9A01 D6 02         [ 7] 2288 	sub	a, #0x02
   9A03 C0            [11] 2289 	ret	NZ
                           2290 ;src/main.c:516: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   9A04 0A            [ 7] 2291 	ld	a,(bc)
   9A05 C6 F7         [ 7] 2292 	add	a,#0xF7
   9A07 57            [ 4] 2293 	ld	d,a
   9A08 3A 03 8E      [13] 2294 	ld	a, (#_prota + 0)
   9A0B C6 03         [ 7] 2295 	add	a, #0x03
   9A0D C5            [11] 2296 	push	bc
   9A0E D5            [11] 2297 	push	de
   9A0F 33            [ 6] 2298 	inc	sp
   9A10 F5            [11] 2299 	push	af
   9A11 33            [ 6] 2300 	inc	sp
   9A12 CD EF 8E      [17] 2301 	call	_getTilePtr
   9A15 F1            [10] 2302 	pop	af
   9A16 C1            [10] 2303 	pop	bc
   9A17 5E            [ 7] 2304 	ld	e,(hl)
   9A18 3E 02         [ 7] 2305 	ld	a,#0x02
   9A1A 93            [ 4] 2306 	sub	a, e
   9A1B D8            [11] 2307 	ret	C
                           2308 ;src/main.c:517: cu.lanzado = SI;
   9A1C 21 11 8E      [10] 2309 	ld	hl,#(_cu + 0x0006)
   9A1F 36 01         [10] 2310 	ld	(hl),#0x01
                           2311 ;src/main.c:518: cu.direccion = M_arriba;
   9A21 21 12 8E      [10] 2312 	ld	hl,#(_cu + 0x0007)
   9A24 36 02         [10] 2313 	ld	(hl),#0x02
                           2314 ;src/main.c:519: cu.x = prota.x + G_HERO_W / 2;
   9A26 3A 03 8E      [13] 2315 	ld	a, (#_prota + 0)
   9A29 C6 03         [ 7] 2316 	add	a, #0x03
   9A2B 32 0B 8E      [13] 2317 	ld	(#_cu),a
                           2318 ;src/main.c:520: cu.y = prota.y;
   9A2E 0A            [ 7] 2319 	ld	a,(bc)
   9A2F 32 0C 8E      [13] 2320 	ld	(#(_cu + 0x0001)),a
                           2321 ;src/main.c:521: cu.sprite = g_knifeY_1;
   9A32 21 B0 54      [10] 2322 	ld	hl,#_g_knifeY_1
   9A35 22 0F 8E      [16] 2323 	ld	((_cu + 0x0004)), hl
                           2324 ;src/main.c:522: cu.eje = E_Y;
   9A38 21 13 8E      [10] 2325 	ld	hl,#(_cu + 0x0008)
   9A3B 36 01         [10] 2326 	ld	(hl),#0x01
                           2327 ;src/main.c:523: dibujarCuchillo();
   9A3D C3 2E 98      [10] 2328 	jp  _dibujarCuchillo
                           2329 ;src/main.c:529: void comprobarTeclado() {
                           2330 ;	---------------------------------
                           2331 ; Function comprobarTeclado
                           2332 ; ---------------------------------
   9A40                    2333 _comprobarTeclado::
                           2334 ;src/main.c:530: cpct_scanKeyboard_if();
   9A40 CD C3 83      [17] 2335 	call	_cpct_scanKeyboard_if
                           2336 ;src/main.c:532: if (cpct_isAnyKeyPressed()) {
   9A43 CD B6 83      [17] 2337 	call	_cpct_isAnyKeyPressed
   9A46 7D            [ 4] 2338 	ld	a,l
   9A47 B7            [ 4] 2339 	or	a, a
   9A48 C8            [11] 2340 	ret	Z
                           2341 ;src/main.c:533: if (cpct_isKeyPressed(Key_CursorLeft))
   9A49 21 01 01      [10] 2342 	ld	hl,#0x0101
   9A4C CD 8A 81      [17] 2343 	call	_cpct_isKeyPressed
   9A4F 7D            [ 4] 2344 	ld	a,l
   9A50 B7            [ 4] 2345 	or	a, a
                           2346 ;src/main.c:534: moverIzquierda();
   9A51 C2 7B 97      [10] 2347 	jp	NZ,_moverIzquierda
                           2348 ;src/main.c:535: else if (cpct_isKeyPressed(Key_CursorRight))
   9A54 21 00 02      [10] 2349 	ld	hl,#0x0200
   9A57 CD 8A 81      [17] 2350 	call	_cpct_isKeyPressed
   9A5A 7D            [ 4] 2351 	ld	a,l
   9A5B B7            [ 4] 2352 	or	a, a
                           2353 ;src/main.c:536: moverDerecha();
   9A5C C2 A0 97      [10] 2354 	jp	NZ,_moverDerecha
                           2355 ;src/main.c:537: else if (cpct_isKeyPressed(Key_CursorUp))
   9A5F 21 00 01      [10] 2356 	ld	hl,#0x0100
   9A62 CD 8A 81      [17] 2357 	call	_cpct_isKeyPressed
   9A65 7D            [ 4] 2358 	ld	a,l
   9A66 B7            [ 4] 2359 	or	a, a
                           2360 ;src/main.c:538: moverArriba();
   9A67 C2 E6 97      [10] 2361 	jp	NZ,_moverArriba
                           2362 ;src/main.c:539: else if (cpct_isKeyPressed(Key_CursorDown))
   9A6A 21 00 04      [10] 2363 	ld	hl,#0x0400
   9A6D CD 8A 81      [17] 2364 	call	_cpct_isKeyPressed
   9A70 7D            [ 4] 2365 	ld	a,l
   9A71 B7            [ 4] 2366 	or	a, a
                           2367 ;src/main.c:540: moverAbajo();
   9A72 C2 0A 98      [10] 2368 	jp	NZ,_moverAbajo
                           2369 ;src/main.c:541: else if (cpct_isKeyPressed(Key_Space))
   9A75 21 05 80      [10] 2370 	ld	hl,#0x8005
   9A78 CD 8A 81      [17] 2371 	call	_cpct_isKeyPressed
   9A7B 7D            [ 4] 2372 	ld	a,l
   9A7C B7            [ 4] 2373 	or	a, a
   9A7D C8            [11] 2374 	ret	Z
                           2375 ;src/main.c:542: lanzarCuchillo();
   9A7E C3 24 99      [10] 2376 	jp  _lanzarCuchillo
                           2377 ;src/main.c:546: u8 checkKnifeCollision(int direction, u8 xoff, u8 yoff){
                           2378 ;	---------------------------------
                           2379 ; Function checkKnifeCollision
                           2380 ; ---------------------------------
   9A81                    2381 _checkKnifeCollision::
                           2382 ;src/main.c:548: return *getTilePtr(cu.x + xoff, cu.y + yoff) <= 2;
   9A81 3A 0C 8E      [13] 2383 	ld	a,(#_cu + 1)
   9A84 21 05 00      [10] 2384 	ld	hl,#5
   9A87 39            [11] 2385 	add	hl,sp
   9A88 86            [ 7] 2386 	add	a, (hl)
   9A89 47            [ 4] 2387 	ld	b,a
   9A8A 3A 0B 8E      [13] 2388 	ld	a,(#_cu + 0)
   9A8D 21 04 00      [10] 2389 	ld	hl,#4
   9A90 39            [11] 2390 	add	hl,sp
   9A91 86            [ 7] 2391 	add	a, (hl)
   9A92 4F            [ 4] 2392 	ld	c,a
   9A93 C5            [11] 2393 	push	bc
   9A94 CD EF 8E      [17] 2394 	call	_getTilePtr
   9A97 F1            [10] 2395 	pop	af
   9A98 4E            [ 7] 2396 	ld	c,(hl)
   9A99 3E 02         [ 7] 2397 	ld	a,#0x02
   9A9B 91            [ 4] 2398 	sub	a, c
   9A9C 3E 00         [ 7] 2399 	ld	a,#0x00
   9A9E 17            [ 4] 2400 	rla
   9A9F EE 01         [ 7] 2401 	xor	a, #0x01
   9AA1 6F            [ 4] 2402 	ld	l, a
   9AA2 C9            [10] 2403 	ret
                           2404 ;src/main.c:551: void moverCuchillo(){
                           2405 ;	---------------------------------
                           2406 ; Function moverCuchillo
                           2407 ; ---------------------------------
   9AA3                    2408 _moverCuchillo::
                           2409 ;src/main.c:552: if(cu.lanzado){
   9AA3 01 0B 8E      [10] 2410 	ld	bc,#_cu+0
   9AA6 3A 11 8E      [13] 2411 	ld	a, (#_cu + 6)
   9AA9 B7            [ 4] 2412 	or	a, a
   9AAA C8            [11] 2413 	ret	Z
                           2414 ;src/main.c:553: cu.mover = SI;
   9AAB 21 09 00      [10] 2415 	ld	hl,#0x0009
   9AAE 09            [11] 2416 	add	hl,bc
   9AAF EB            [ 4] 2417 	ex	de,hl
   9AB0 3E 01         [ 7] 2418 	ld	a,#0x01
   9AB2 12            [ 7] 2419 	ld	(de),a
                           2420 ;src/main.c:554: if(cu.direccion == M_derecha){
   9AB3 21 12 8E      [10] 2421 	ld	hl, #_cu + 7
   9AB6 6E            [ 7] 2422 	ld	l,(hl)
   9AB7 7D            [ 4] 2423 	ld	a,l
   9AB8 B7            [ 4] 2424 	or	a, a
   9AB9 20 1E         [12] 2425 	jr	NZ,00122$
                           2426 ;src/main.c:556: if(checkKnifeCollision(M_derecha, G_KNIFEX_0_W + 1, 0)){
   9ABB C5            [11] 2427 	push	bc
   9ABC D5            [11] 2428 	push	de
   9ABD 21 05 00      [10] 2429 	ld	hl,#0x0005
   9AC0 E5            [11] 2430 	push	hl
   9AC1 2E 00         [ 7] 2431 	ld	l, #0x00
   9AC3 E5            [11] 2432 	push	hl
   9AC4 CD 81 9A      [17] 2433 	call	_checkKnifeCollision
   9AC7 F1            [10] 2434 	pop	af
   9AC8 F1            [10] 2435 	pop	af
   9AC9 D1            [10] 2436 	pop	de
   9ACA C1            [10] 2437 	pop	bc
   9ACB 7D            [ 4] 2438 	ld	a,l
   9ACC B7            [ 4] 2439 	or	a, a
   9ACD 28 07         [12] 2440 	jr	Z,00102$
                           2441 ;src/main.c:557: cu.mover = SI;
   9ACF 3E 01         [ 7] 2442 	ld	a,#0x01
   9AD1 12            [ 7] 2443 	ld	(de),a
                           2444 ;src/main.c:558: cu.x++;
   9AD2 0A            [ 7] 2445 	ld	a,(bc)
   9AD3 3C            [ 4] 2446 	inc	a
   9AD4 02            [ 7] 2447 	ld	(bc),a
   9AD5 C9            [10] 2448 	ret
   9AD6                    2449 00102$:
                           2450 ;src/main.c:561: cu.mover=NO;
   9AD6 AF            [ 4] 2451 	xor	a, a
   9AD7 12            [ 7] 2452 	ld	(de),a
   9AD8 C9            [10] 2453 	ret
   9AD9                    2454 00122$:
                           2455 ;src/main.c:564: else if(cu.direccion == M_izquierda){
   9AD9 7D            [ 4] 2456 	ld	a,l
   9ADA 3D            [ 4] 2457 	dec	a
   9ADB 20 1F         [12] 2458 	jr	NZ,00119$
                           2459 ;src/main.c:565: if(checkKnifeCollision(M_derecha, -1, 0)){
   9ADD C5            [11] 2460 	push	bc
   9ADE D5            [11] 2461 	push	de
   9ADF 21 FF 00      [10] 2462 	ld	hl,#0x00FF
   9AE2 E5            [11] 2463 	push	hl
   9AE3 2E 00         [ 7] 2464 	ld	l, #0x00
   9AE5 E5            [11] 2465 	push	hl
   9AE6 CD 81 9A      [17] 2466 	call	_checkKnifeCollision
   9AE9 F1            [10] 2467 	pop	af
   9AEA F1            [10] 2468 	pop	af
   9AEB D1            [10] 2469 	pop	de
   9AEC C1            [10] 2470 	pop	bc
   9AED 7D            [ 4] 2471 	ld	a,l
   9AEE B7            [ 4] 2472 	or	a, a
   9AEF 28 08         [12] 2473 	jr	Z,00105$
                           2474 ;src/main.c:566: cu.mover = SI;
   9AF1 3E 01         [ 7] 2475 	ld	a,#0x01
   9AF3 12            [ 7] 2476 	ld	(de),a
                           2477 ;src/main.c:567: cu.x--;
   9AF4 0A            [ 7] 2478 	ld	a,(bc)
   9AF5 C6 FF         [ 7] 2479 	add	a,#0xFF
   9AF7 02            [ 7] 2480 	ld	(bc),a
   9AF8 C9            [10] 2481 	ret
   9AF9                    2482 00105$:
                           2483 ;src/main.c:569: cu.mover=NO;
   9AF9 AF            [ 4] 2484 	xor	a, a
   9AFA 12            [ 7] 2485 	ld	(de),a
   9AFB C9            [10] 2486 	ret
   9AFC                    2487 00119$:
                           2488 ;src/main.c:575: cu.y--;
   9AFC 03            [ 6] 2489 	inc	bc
                           2490 ;src/main.c:572: else if(cu.direccion == M_arriba){
   9AFD 7D            [ 4] 2491 	ld	a,l
   9AFE D6 02         [ 7] 2492 	sub	a, #0x02
   9B00 20 22         [12] 2493 	jr	NZ,00116$
                           2494 ;src/main.c:573: if(checkKnifeCollision(M_derecha, 0, -2)){
   9B02 C5            [11] 2495 	push	bc
   9B03 D5            [11] 2496 	push	de
   9B04 21 00 FE      [10] 2497 	ld	hl,#0xFE00
   9B07 E5            [11] 2498 	push	hl
   9B08 26 00         [ 7] 2499 	ld	h, #0x00
   9B0A E5            [11] 2500 	push	hl
   9B0B CD 81 9A      [17] 2501 	call	_checkKnifeCollision
   9B0E F1            [10] 2502 	pop	af
   9B0F F1            [10] 2503 	pop	af
   9B10 D1            [10] 2504 	pop	de
   9B11 C1            [10] 2505 	pop	bc
   9B12 7D            [ 4] 2506 	ld	a,l
   9B13 B7            [ 4] 2507 	or	a, a
   9B14 28 0B         [12] 2508 	jr	Z,00108$
                           2509 ;src/main.c:574: cu.mover = SI;
   9B16 3E 01         [ 7] 2510 	ld	a,#0x01
   9B18 12            [ 7] 2511 	ld	(de),a
                           2512 ;src/main.c:575: cu.y--;
   9B19 0A            [ 7] 2513 	ld	a,(bc)
   9B1A C6 FF         [ 7] 2514 	add	a,#0xFF
   9B1C 02            [ 7] 2515 	ld	(bc),a
                           2516 ;src/main.c:576: cu.y--;
   9B1D C6 FF         [ 7] 2517 	add	a,#0xFF
   9B1F 02            [ 7] 2518 	ld	(bc),a
   9B20 C9            [10] 2519 	ret
   9B21                    2520 00108$:
                           2521 ;src/main.c:579: cu.mover=NO;
   9B21 AF            [ 4] 2522 	xor	a, a
   9B22 12            [ 7] 2523 	ld	(de),a
   9B23 C9            [10] 2524 	ret
   9B24                    2525 00116$:
                           2526 ;src/main.c:582: else if(cu.direccion == M_abajo){
   9B24 7D            [ 4] 2527 	ld	a,l
   9B25 D6 03         [ 7] 2528 	sub	a, #0x03
   9B27 C0            [11] 2529 	ret	NZ
                           2530 ;src/main.c:583: if(checkKnifeCollision(M_derecha, 0, G_KNIFEY_0_H + 2)){
   9B28 C5            [11] 2531 	push	bc
   9B29 D5            [11] 2532 	push	de
   9B2A 21 00 0A      [10] 2533 	ld	hl,#0x0A00
   9B2D E5            [11] 2534 	push	hl
   9B2E 26 00         [ 7] 2535 	ld	h, #0x00
   9B30 E5            [11] 2536 	push	hl
   9B31 CD 81 9A      [17] 2537 	call	_checkKnifeCollision
   9B34 F1            [10] 2538 	pop	af
   9B35 F1            [10] 2539 	pop	af
   9B36 D1            [10] 2540 	pop	de
   9B37 C1            [10] 2541 	pop	bc
   9B38 7D            [ 4] 2542 	ld	a,l
   9B39 B7            [ 4] 2543 	or	a, a
   9B3A 28 09         [12] 2544 	jr	Z,00111$
                           2545 ;src/main.c:584: cu.mover = SI;
   9B3C 3E 01         [ 7] 2546 	ld	a,#0x01
   9B3E 12            [ 7] 2547 	ld	(de),a
                           2548 ;src/main.c:585: cu.y++;
   9B3F 0A            [ 7] 2549 	ld	a,(bc)
   9B40 3C            [ 4] 2550 	inc	a
   9B41 02            [ 7] 2551 	ld	(bc),a
                           2552 ;src/main.c:586: cu.y++;
   9B42 3C            [ 4] 2553 	inc	a
   9B43 02            [ 7] 2554 	ld	(bc),a
   9B44 C9            [10] 2555 	ret
   9B45                    2556 00111$:
                           2557 ;src/main.c:589: cu.mover=NO;
   9B45 AF            [ 4] 2558 	xor	a, a
   9B46 12            [ 7] 2559 	ld	(de),a
   9B47 C9            [10] 2560 	ret
                           2561 ;src/main.c:595: void inicializarCPC() {
                           2562 ;	---------------------------------
                           2563 ; Function inicializarCPC
                           2564 ; ---------------------------------
   9B48                    2565 _inicializarCPC::
                           2566 ;src/main.c:596: cpct_disableFirmware();
   9B48 CD 88 8C      [17] 2567 	call	_cpct_disableFirmware
                           2568 ;src/main.c:597: cpct_setVideoMode(0);
   9B4B 2E 00         [ 7] 2569 	ld	l,#0x00
   9B4D CD 33 84      [17] 2570 	call	_cpct_setVideoMode
                           2571 ;src/main.c:598: cpct_setBorder(HW_BLACK);
   9B50 21 10 14      [10] 2572 	ld	hl,#0x1410
   9B53 E5            [11] 2573 	push	hl
   9B54 CD 96 81      [17] 2574 	call	_cpct_setPALColour
                           2575 ;src/main.c:599: cpct_setPalette(g_palette, 16);
   9B57 21 10 00      [10] 2576 	ld	hl,#0x0010
   9B5A E5            [11] 2577 	push	hl
   9B5B 21 60 7B      [10] 2578 	ld	hl,#_g_palette
   9B5E E5            [11] 2579 	push	hl
   9B5F CD 73 81      [17] 2580 	call	_cpct_setPalette
                           2581 ;src/main.c:600: cpct_akp_musicInit(G_song);
   9B62 21 00 3F      [10] 2582 	ld	hl,#_G_song
   9B65 E5            [11] 2583 	push	hl
   9B66 CD 64 8B      [17] 2584 	call	_cpct_akp_musicInit
   9B69 F1            [10] 2585 	pop	af
   9B6A C9            [10] 2586 	ret
                           2587 ;src/main.c:603: void inicializarJuego() {
                           2588 ;	---------------------------------
                           2589 ; Function inicializarJuego
                           2590 ; ---------------------------------
   9B6B                    2591 _inicializarJuego::
                           2592 ;src/main.c:605: num_mapa = 0;
   9B6B 21 17 8E      [10] 2593 	ld	hl,#_num_mapa + 0
   9B6E 36 00         [10] 2594 	ld	(hl), #0x00
                           2595 ;src/main.c:606: mapa = mapas[num_mapa];
   9B70 21 31 8E      [10] 2596 	ld	hl, #_mapas + 0
   9B73 7E            [ 7] 2597 	ld	a,(hl)
   9B74 FD 21 15 8E   [14] 2598 	ld	iy,#_mapa
   9B78 FD 77 00      [19] 2599 	ld	0 (iy),a
   9B7B 23            [ 6] 2600 	inc	hl
   9B7C 7E            [ 7] 2601 	ld	a,(hl)
   9B7D 32 16 8E      [13] 2602 	ld	(#_mapa + 1),a
                           2603 ;src/main.c:607: cpct_etm_setTileset2x4(g_tileset);
   9B80 21 E0 54      [10] 2604 	ld	hl,#_g_tileset
   9B83 CD FA 82      [17] 2605 	call	_cpct_etm_setTileset2x4
                           2606 ;src/main.c:609: dibujarMapa();
   9B86 CD 1B 8E      [17] 2607 	call	_dibujarMapa
                           2608 ;src/main.c:612: barraPuntuacionInicial();
   9B89 CD 6D 80      [17] 2609 	call	_barraPuntuacionInicial
                           2610 ;src/main.c:615: prota.x = prota.px = 4;
   9B8C 21 05 8E      [10] 2611 	ld	hl,#(_prota + 0x0002)
   9B8F 36 04         [10] 2612 	ld	(hl),#0x04
   9B91 21 03 8E      [10] 2613 	ld	hl,#_prota
   9B94 36 04         [10] 2614 	ld	(hl),#0x04
                           2615 ;src/main.c:616: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   9B96 21 06 8E      [10] 2616 	ld	hl,#(_prota + 0x0003)
   9B99 36 68         [10] 2617 	ld	(hl),#0x68
   9B9B 21 04 8E      [10] 2618 	ld	hl,#(_prota + 0x0001)
   9B9E 36 68         [10] 2619 	ld	(hl),#0x68
                           2620 ;src/main.c:617: prota.mover  = NO;
   9BA0 21 09 8E      [10] 2621 	ld	hl,#(_prota + 0x0006)
   9BA3 36 00         [10] 2622 	ld	(hl),#0x00
                           2623 ;src/main.c:618: prota.mira=M_derecha;
   9BA5 21 0A 8E      [10] 2624 	ld	hl,#(_prota + 0x0007)
   9BA8 36 00         [10] 2625 	ld	(hl),#0x00
                           2626 ;src/main.c:619: prota.sprite = g_hero;
   9BAA 21 70 7B      [10] 2627 	ld	hl,#_g_hero
   9BAD 22 07 8E      [16] 2628 	ld	((_prota + 0x0004)), hl
                           2629 ;src/main.c:623: cu.x = cu.px = 0;
   9BB0 21 0D 8E      [10] 2630 	ld	hl,#(_cu + 0x0002)
   9BB3 36 00         [10] 2631 	ld	(hl),#0x00
   9BB5 21 0B 8E      [10] 2632 	ld	hl,#_cu
   9BB8 36 00         [10] 2633 	ld	(hl),#0x00
                           2634 ;src/main.c:624: cu.y = cu.py = 0;
   9BBA 21 0E 8E      [10] 2635 	ld	hl,#(_cu + 0x0003)
   9BBD 36 00         [10] 2636 	ld	(hl),#0x00
   9BBF 21 0C 8E      [10] 2637 	ld	hl,#(_cu + 0x0001)
   9BC2 36 00         [10] 2638 	ld	(hl),#0x00
                           2639 ;src/main.c:625: cu.lanzado = NO;
   9BC4 21 11 8E      [10] 2640 	ld	hl,#(_cu + 0x0006)
   9BC7 36 00         [10] 2641 	ld	(hl),#0x00
                           2642 ;src/main.c:626: cu.mover = NO;
   9BC9 21 14 8E      [10] 2643 	ld	hl,#(_cu + 0x0009)
   9BCC 36 00         [10] 2644 	ld	(hl),#0x00
                           2645 ;src/main.c:628: inicializarEnemy();
   9BCE CD BA 96      [17] 2646 	call	_inicializarEnemy
                           2647 ;src/main.c:630: dibujarProta();
   9BD1 C3 41 8E      [10] 2648 	jp  _dibujarProta
                           2649 ;src/main.c:633: void main(void) {
                           2650 ;	---------------------------------
                           2651 ; Function main
                           2652 ; ---------------------------------
   9BD4                    2653 _main::
                           2654 ;src/main.c:637: inicializarCPC();
   9BD4 CD 48 9B      [17] 2655 	call	_inicializarCPC
                           2656 ;src/main.c:638: menuInicio();
   9BD7 CD 8E 7F      [17] 2657 	call	_menuInicio
                           2658 ;src/main.c:640: inicializarJuego();
   9BDA CD 6B 9B      [17] 2659 	call	_inicializarJuego
                           2660 ;src/main.c:641: cpct_akp_musicPlay();
   9BDD CD 61 84      [17] 2661 	call	_cpct_akp_musicPlay
                           2662 ;src/main.c:643: while (1) {
   9BE0                    2663 00122$:
                           2664 ;src/main.c:645: i = (2 + num_mapa) + 1;
   9BE0 21 17 8E      [10] 2665 	ld	hl,#_num_mapa + 0
   9BE3 4E            [ 7] 2666 	ld	c, (hl)
   9BE4 0C            [ 4] 2667 	inc	c
   9BE5 0C            [ 4] 2668 	inc	c
   9BE6 0C            [ 4] 2669 	inc	c
                           2670 ;src/main.c:646: actual = enemy;
                           2671 ;src/main.c:648: comprobarTeclado();
   9BE7 C5            [11] 2672 	push	bc
   9BE8 CD 40 9A      [17] 2673 	call	_comprobarTeclado
   9BEB CD A3 9A      [17] 2674 	call	_moverCuchillo
   9BEE C1            [10] 2675 	pop	bc
                           2676 ;src/main.c:651: while(--i){
   9BEF 11 CF 8D      [10] 2677 	ld	de,#_enemy
   9BF2                    2678 00101$:
   9BF2 0D            [ 4] 2679 	dec c
   9BF3 28 11         [12] 2680 	jr	Z,00103$
                           2681 ;src/main.c:652: moverEnemigo(actual);
   9BF5 C5            [11] 2682 	push	bc
   9BF6 D5            [11] 2683 	push	de
   9BF7 D5            [11] 2684 	push	de
   9BF8 CD 5A 96      [17] 2685 	call	_moverEnemigo
   9BFB F1            [10] 2686 	pop	af
   9BFC D1            [10] 2687 	pop	de
   9BFD C1            [10] 2688 	pop	bc
                           2689 ;src/main.c:653: ++actual;
   9BFE 21 0D 00      [10] 2690 	ld	hl,#0x000D
   9C01 19            [11] 2691 	add	hl,de
   9C02 5D            [ 4] 2692 	ld	e,l
   9C03 54            [ 4] 2693 	ld	d,h
   9C04 18 EC         [12] 2694 	jr	00101$
   9C06                    2695 00103$:
                           2696 ;src/main.c:656: actual = enemy;
   9C06 01 CF 8D      [10] 2697 	ld	bc,#_enemy
                           2698 ;src/main.c:658: cpct_waitVSYNC();
   9C09 C5            [11] 2699 	push	bc
   9C0A CD 2B 84      [17] 2700 	call	_cpct_waitVSYNC
   9C0D C1            [10] 2701 	pop	bc
                           2702 ;src/main.c:660: if (prota.mover) {
   9C0E 11 09 8E      [10] 2703 	ld	de,#_prota+6
   9C11 1A            [ 7] 2704 	ld	a,(de)
   9C12 B7            [ 4] 2705 	or	a, a
   9C13 28 09         [12] 2706 	jr	Z,00105$
                           2707 ;src/main.c:661: redibujarProta();
   9C15 C5            [11] 2708 	push	bc
   9C16 D5            [11] 2709 	push	de
   9C17 CD DB 8E      [17] 2710 	call	_redibujarProta
   9C1A D1            [10] 2711 	pop	de
   9C1B C1            [10] 2712 	pop	bc
                           2713 ;src/main.c:662: prota.mover = NO;
   9C1C AF            [ 4] 2714 	xor	a, a
   9C1D 12            [ 7] 2715 	ld	(de),a
   9C1E                    2716 00105$:
                           2717 ;src/main.c:664: if(cu.lanzado && cu.mover){
   9C1E 21 11 8E      [10] 2718 	ld	hl,#_cu + 6
   9C21 5E            [ 7] 2719 	ld	e,(hl)
   9C22 21 14 8E      [10] 2720 	ld	hl,#_cu + 9
   9C25 7B            [ 4] 2721 	ld	a,e
   9C26 B7            [ 4] 2722 	or	a, a
   9C27 28 0B         [12] 2723 	jr	Z,00110$
   9C29 7E            [ 7] 2724 	ld	a,(hl)
   9C2A B7            [ 4] 2725 	or	a, a
   9C2B 28 07         [12] 2726 	jr	Z,00110$
                           2727 ;src/main.c:665: redibujarCuchillo();
   9C2D C5            [11] 2728 	push	bc
   9C2E CD 10 99      [17] 2729 	call	_redibujarCuchillo
   9C31 C1            [10] 2730 	pop	bc
   9C32 18 0D         [12] 2731 	jr	00137$
   9C34                    2732 00110$:
                           2733 ;src/main.c:666: }else if (cu.lanzado && !cu.mover){
   9C34 7B            [ 4] 2734 	ld	a,e
   9C35 B7            [ 4] 2735 	or	a, a
   9C36 28 09         [12] 2736 	jr	Z,00137$
   9C38 7E            [ 7] 2737 	ld	a,(hl)
   9C39 B7            [ 4] 2738 	or	a, a
   9C3A 20 05         [12] 2739 	jr	NZ,00137$
                           2740 ;src/main.c:667: borrarCuchillo();
   9C3C C5            [11] 2741 	push	bc
   9C3D CD 92 98      [17] 2742 	call	_borrarCuchillo
   9C40 C1            [10] 2743 	pop	bc
                           2744 ;src/main.c:670: while(--i){
   9C41                    2745 00137$:
   9C41 1E 05         [ 7] 2746 	ld	e,#0x05
   9C43                    2747 00118$:
   9C43 1D            [ 4] 2748 	dec	e
   9C44 7B            [ 4] 2749 	ld	a,e
   9C45 B7            [ 4] 2750 	or	a, a
   9C46 28 49         [12] 2751 	jr	Z,00120$
                           2752 ;src/main.c:671: if(actual->mover){
   9C48 C5            [11] 2753 	push	bc
   9C49 FD E1         [14] 2754 	pop	iy
   9C4B FD 7E 06      [19] 2755 	ld	a,6 (iy)
   9C4E B7            [ 4] 2756 	or	a, a
   9C4F 28 09         [12] 2757 	jr	Z,00114$
                           2758 ;src/main.c:672: redibujarEnemigo(actual);
   9C51 C5            [11] 2759 	push	bc
   9C52 D5            [11] 2760 	push	de
   9C53 C5            [11] 2761 	push	bc
   9C54 CD F9 91      [17] 2762 	call	_redibujarEnemigo
   9C57 F1            [10] 2763 	pop	af
   9C58 D1            [10] 2764 	pop	de
   9C59 C1            [10] 2765 	pop	bc
   9C5A                    2766 00114$:
                           2767 ;src/main.c:674: if (actual->muerto && actual->muertes == 0){
   9C5A C5            [11] 2768 	push	bc
   9C5B FD E1         [14] 2769 	pop	iy
   9C5D FD 7E 08      [19] 2770 	ld	a,8 (iy)
   9C60 B7            [ 4] 2771 	or	a, a
   9C61 28 26         [12] 2772 	jr	Z,00116$
   9C63 21 0C 00      [10] 2773 	ld	hl,#0x000C
   9C66 09            [11] 2774 	add	hl,bc
   9C67 7E            [ 7] 2775 	ld	a,(hl)
   9C68 B7            [ 4] 2776 	or	a, a
   9C69 20 1E         [12] 2777 	jr	NZ,00116$
                           2778 ;src/main.c:675: borrarEnemigo(actual);
   9C6B E5            [11] 2779 	push	hl
   9C6C C5            [11] 2780 	push	bc
   9C6D D5            [11] 2781 	push	de
   9C6E C5            [11] 2782 	push	bc
   9C6F CD 65 91      [17] 2783 	call	_borrarEnemigo
   9C72 F1            [10] 2784 	pop	af
   9C73 D1            [10] 2785 	pop	de
   9C74 C1            [10] 2786 	pop	bc
   9C75 C5            [11] 2787 	push	bc
   9C76 D5            [11] 2788 	push	de
   9C77 C5            [11] 2789 	push	bc
   9C78 CD BD 90      [17] 2790 	call	_dibujarExplosion
   9C7B F1            [10] 2791 	pop	af
   9C7C D1            [10] 2792 	pop	de
   9C7D C1            [10] 2793 	pop	bc
   9C7E E1            [10] 2794 	pop	hl
                           2795 ;src/main.c:678: actual->muertes++;
   9C7F 56            [ 7] 2796 	ld	d,(hl)
   9C80 14            [ 4] 2797 	inc	d
   9C81 72            [ 7] 2798 	ld	(hl),d
                           2799 ;src/main.c:679: actual->x = 0;
   9C82 AF            [ 4] 2800 	xor	a, a
   9C83 02            [ 7] 2801 	ld	(bc),a
                           2802 ;src/main.c:680: actual->y = 0;
   9C84 69            [ 4] 2803 	ld	l, c
   9C85 60            [ 4] 2804 	ld	h, b
   9C86 23            [ 6] 2805 	inc	hl
   9C87 36 00         [10] 2806 	ld	(hl),#0x00
   9C89                    2807 00116$:
                           2808 ;src/main.c:682: ++actual;
   9C89 21 0D 00      [10] 2809 	ld	hl,#0x000D
   9C8C 09            [11] 2810 	add	hl,bc
   9C8D 4D            [ 4] 2811 	ld	c,l
   9C8E 44            [ 4] 2812 	ld	b,h
   9C8F 18 B2         [12] 2813 	jr	00118$
   9C91                    2814 00120$:
                           2815 ;src/main.c:684: cpct_waitVSYNC();
   9C91 CD 2B 84      [17] 2816 	call	_cpct_waitVSYNC
   9C94 C3 E0 9B      [10] 2817 	jp	00122$
                           2818 	.area _CODE
                           2819 	.area _INITIALIZER
   8E18                    2820 __xinit__mapa:
   8E18 00 00              2821 	.dw #0x0000
   8E1A                    2822 __xinit__num_mapa:
   8E1A 00                 2823 	.db #0x00	; 0
                           2824 	.area _CABS (ABS)
   3F00                    2825 	.org 0x3F00
   3F00                    2826 _G_song:
   3F00 41                 2827 	.db #0x41	; 65	'A'
   3F01 54                 2828 	.db #0x54	; 84	'T'
   3F02 31                 2829 	.db #0x31	; 49	'1'
   3F03 30                 2830 	.db #0x30	; 48	'0'
   3F04 01                 2831 	.db #0x01	; 1
   3F05 40                 2832 	.db #0x40	; 64
   3F06 42                 2833 	.db #0x42	; 66	'B'
   3F07 0F                 2834 	.db #0x0F	; 15
   3F08 02                 2835 	.db #0x02	; 2
   3F09 06                 2836 	.db #0x06	; 6
   3F0A 1D                 2837 	.db #0x1D	; 29
   3F0B 00                 2838 	.db #0x00	; 0
   3F0C 10                 2839 	.db #0x10	; 16
   3F0D 40                 2840 	.db #0x40	; 64
   3F0E 19                 2841 	.db #0x19	; 25
   3F0F 40                 2842 	.db #0x40	; 64
   3F10 00                 2843 	.db #0x00	; 0
   3F11 00                 2844 	.db #0x00	; 0
   3F12 00                 2845 	.db #0x00	; 0
   3F13 00                 2846 	.db #0x00	; 0
   3F14 00                 2847 	.db #0x00	; 0
   3F15 00                 2848 	.db #0x00	; 0
   3F16 0D                 2849 	.db #0x0D	; 13
   3F17 12                 2850 	.db #0x12	; 18
   3F18 40                 2851 	.db #0x40	; 64
   3F19 01                 2852 	.db #0x01	; 1
   3F1A 00                 2853 	.db #0x00	; 0
   3F1B 7C                 2854 	.db #0x7C	; 124
   3F1C 18                 2855 	.db #0x18	; 24
   3F1D 78                 2856 	.db #0x78	; 120	'x'
   3F1E 0C                 2857 	.db #0x0C	; 12
   3F1F 34                 2858 	.db #0x34	; 52	'4'
   3F20 30                 2859 	.db #0x30	; 48	'0'
   3F21 2C                 2860 	.db #0x2C	; 44
   3F22 28                 2861 	.db #0x28	; 40
   3F23 24                 2862 	.db #0x24	; 36
   3F24 20                 2863 	.db #0x20	; 32
   3F25 1C                 2864 	.db #0x1C	; 28
   3F26 0D                 2865 	.db #0x0D	; 13
   3F27 25                 2866 	.db #0x25	; 37
   3F28 40                 2867 	.db #0x40	; 64
   3F29 20                 2868 	.db #0x20	; 32
   3F2A 00                 2869 	.db #0x00	; 0
   3F2B 00                 2870 	.db #0x00	; 0
   3F2C 00                 2871 	.db #0x00	; 0
   3F2D 39                 2872 	.db #0x39	; 57	'9'
   3F2E 40                 2873 	.db #0x40	; 64
   3F2F 00                 2874 	.db #0x00	; 0
   3F30 57                 2875 	.db #0x57	; 87	'W'
   3F31 40                 2876 	.db #0x40	; 64
   3F32 3B                 2877 	.db #0x3B	; 59
   3F33 40                 2878 	.db #0x40	; 64
   3F34 57                 2879 	.db #0x57	; 87	'W'
   3F35 40                 2880 	.db #0x40	; 64
   3F36 01                 2881 	.db #0x01	; 1
   3F37 2F                 2882 	.db #0x2F	; 47
   3F38 40                 2883 	.db #0x40	; 64
   3F39 19                 2884 	.db #0x19	; 25
   3F3A 00                 2885 	.db #0x00	; 0
   3F3B 76                 2886 	.db #0x76	; 118	'v'
   3F3C E1                 2887 	.db #0xE1	; 225
   3F3D 00                 2888 	.db #0x00	; 0
   3F3E 00                 2889 	.db #0x00	; 0
   3F3F 01                 2890 	.db #0x01	; 1
   3F40 04                 2891 	.db #0x04	; 4
   3F41 51                 2892 	.db #0x51	; 81	'Q'
   3F42 04                 2893 	.db #0x04	; 4
   3F43 37                 2894 	.db #0x37	; 55	'7'
   3F44 04                 2895 	.db #0x04	; 4
   3F45 4F                 2896 	.db #0x4F	; 79	'O'
   3F46 04                 2897 	.db #0x04	; 4
   3F47 37                 2898 	.db #0x37	; 55	'7'
   3F48 02                 2899 	.db #0x02	; 2
   3F49 4B                 2900 	.db #0x4B	; 75	'K'
   3F4A 02                 2901 	.db #0x02	; 2
   3F4B 37                 2902 	.db #0x37	; 55	'7'
   3F4C 04                 2903 	.db #0x04	; 4
   3F4D 4F                 2904 	.db #0x4F	; 79	'O'
   3F4E 04                 2905 	.db #0x04	; 4
   3F4F 37                 2906 	.db #0x37	; 55	'7'
   3F50 04                 2907 	.db #0x04	; 4
   3F51 4F                 2908 	.db #0x4F	; 79	'O'
   3F52 04                 2909 	.db #0x04	; 4
   3F53 37                 2910 	.db #0x37	; 55	'7'
   3F54 02                 2911 	.db #0x02	; 2
   3F55 4B                 2912 	.db #0x4B	; 75	'K'
   3F56 00                 2913 	.db #0x00	; 0
   3F57 42                 2914 	.db #0x42	; 66	'B'
   3F58 60                 2915 	.db #0x60	; 96
   3F59 00                 2916 	.db #0x00	; 0
   3F5A 42                 2917 	.db #0x42	; 66	'B'
   3F5B 80                 2918 	.db #0x80	; 128
   3F5C 00                 2919 	.db #0x00	; 0
   3F5D 00                 2920 	.db #0x00	; 0
   3F5E 42                 2921 	.db #0x42	; 66	'B'
   3F5F 00                 2922 	.db #0x00	; 0
   3F60 00                 2923 	.db #0x00	; 0
