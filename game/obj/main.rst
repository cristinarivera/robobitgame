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
                             31 	.globl _moverEnemigo
                             32 	.globl _moverEnemigoIzquierda
                             33 	.globl _moverEnemigoDerecha
                             34 	.globl _moverEnemigoAbajo
                             35 	.globl _moverEnemigoArriba
                             36 	.globl _checkEnemyCollision
                             37 	.globl _redibujarEnemigo
                             38 	.globl _borrarEnemigo
                             39 	.globl _borrarExplosion
                             40 	.globl _dibujarExplosion
                             41 	.globl _dibujarEnemigo
                             42 	.globl _checkCollision
                             43 	.globl _getTilePtr
                             44 	.globl _redibujarProta
                             45 	.globl _menuFin
                             46 	.globl _borrarProta
                             47 	.globl _dibujarProta
                             48 	.globl _dibujarMapa
                             49 	.globl _cpct_etm_setTileset2x4
                             50 	.globl _cpct_etm_drawTileBox2x4
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
   88A6                      85 _EMirar::
   88A6                      86 	.ds 1
   88A7                      87 _EEje::
   88A7                      88 	.ds 1
   88A8                      89 _enemy::
   88A8                      90 	.ds 52
   88DC                      91 _prota::
   88DC                      92 	.ds 8
   88E4                      93 _cu::
   88E4                      94 	.ds 10
   88EE                      95 _mapa::
   88EE                      96 	.ds 2
   88F0                      97 _num_mapa::
   88F0                      98 	.ds 1
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
                            123 ;src/main.c:108: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
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
                            164 ;src/main.c:111: void dibujarMapa() {
                            165 ;	---------------------------------
                            166 ; Function dibujarMapa
                            167 ; ---------------------------------
   88F1                     168 _dibujarMapa::
                            169 ;src/main.c:112: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   88F1 2A EE 88      [16]  170 	ld	hl,(_mapa)
   88F4 E5            [11]  171 	push	hl
   88F5 21 F0 C0      [10]  172 	ld	hl,#0xC0F0
   88F8 E5            [11]  173 	push	hl
   88F9 21 2C 28      [10]  174 	ld	hl,#0x282C
   88FC E5            [11]  175 	push	hl
   88FD 2E 00         [ 7]  176 	ld	l, #0x00
   88FF E5            [11]  177 	push	hl
   8900 AF            [ 4]  178 	xor	a, a
   8901 F5            [11]  179 	push	af
   8902 33            [ 6]  180 	inc	sp
   8903 CD 44 7D      [17]  181 	call	_cpct_etm_drawTileBox2x4
   8906 C9            [10]  182 	ret
   8907                     183 _mapas:
   8907 C0 4D               184 	.dw _g_map1
   8909 E0 46               185 	.dw _g_map2
   890B 00 40               186 	.dw _g_map3
   890D                     187 _spawnX:
   890D 00                  188 	.db #0x00	; 0
   890E 28                  189 	.db #0x28	; 40
   890F 47                  190 	.db #0x47	; 71	'G'
   8910 14                  191 	.db #0x14	; 20
   8911 3C                  192 	.db #0x3C	; 60
   8912                     193 _spawnY:
   8912 00                  194 	.db #0x00	; 0
   8913 2C                  195 	.db #0x2C	; 44
   8914 72                  196 	.db #0x72	; 114	'r'
   8915 8A                  197 	.db #0x8A	; 138
   8916 8A                  198 	.db #0x8A	; 138
                            199 ;src/main.c:115: void dibujarProta() {
                            200 ;	---------------------------------
                            201 ; Function dibujarProta
                            202 ; ---------------------------------
   8917                     203 _dibujarProta::
                            204 ;src/main.c:116: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   8917 21 DD 88      [10]  205 	ld	hl, #_prota + 1
   891A 56            [ 7]  206 	ld	d,(hl)
   891B 21 DC 88      [10]  207 	ld	hl, #_prota + 0
   891E 46            [ 7]  208 	ld	b,(hl)
   891F D5            [11]  209 	push	de
   8920 33            [ 6]  210 	inc	sp
   8921 C5            [11]  211 	push	bc
   8922 33            [ 6]  212 	inc	sp
   8923 21 00 C0      [10]  213 	ld	hl,#0xC000
   8926 E5            [11]  214 	push	hl
   8927 CD 4B 88      [17]  215 	call	_cpct_getScreenPtr
   892A EB            [ 4]  216 	ex	de,hl
                            217 ;src/main.c:117: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   892B ED 4B E0 88   [20]  218 	ld	bc, (#_prota + 4)
   892F 21 00 3E      [10]  219 	ld	hl,#_g_tablatrans
   8932 E5            [11]  220 	push	hl
   8933 21 07 16      [10]  221 	ld	hl,#0x1607
   8936 E5            [11]  222 	push	hl
   8937 D5            [11]  223 	push	de
   8938 C5            [11]  224 	push	bc
   8939 CD 6B 88      [17]  225 	call	_cpct_drawSpriteMaskedAlignedTable
   893C C9            [10]  226 	ret
                            227 ;src/main.c:120: void borrarProta() {
                            228 ;	---------------------------------
                            229 ; Function borrarProta
                            230 ; ---------------------------------
   893D                     231 _borrarProta::
   893D DD E5         [15]  232 	push	ix
   893F DD 21 00 00   [14]  233 	ld	ix,#0
   8943 DD 39         [15]  234 	add	ix,sp
   8945 F5            [11]  235 	push	af
   8946 3B            [ 6]  236 	dec	sp
                            237 ;src/main.c:122: u8 w = 4 + (prota.px & 1);
   8947 21 DE 88      [10]  238 	ld	hl, #_prota + 2
   894A 4E            [ 7]  239 	ld	c,(hl)
   894B 79            [ 4]  240 	ld	a,c
   894C E6 01         [ 7]  241 	and	a, #0x01
   894E 47            [ 4]  242 	ld	b,a
   894F 04            [ 4]  243 	inc	b
   8950 04            [ 4]  244 	inc	b
   8951 04            [ 4]  245 	inc	b
   8952 04            [ 4]  246 	inc	b
                            247 ;src/main.c:125: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   8953 21 DF 88      [10]  248 	ld	hl, #_prota + 3
   8956 5E            [ 7]  249 	ld	e,(hl)
   8957 CB 4B         [ 8]  250 	bit	1, e
   8959 28 04         [12]  251 	jr	Z,00103$
   895B 3E 01         [ 7]  252 	ld	a,#0x01
   895D 18 02         [12]  253 	jr	00104$
   895F                     254 00103$:
   895F 3E 00         [ 7]  255 	ld	a,#0x00
   8961                     256 00104$:
   8961 C6 06         [ 7]  257 	add	a, #0x06
   8963 DD 77 FD      [19]  258 	ld	-3 (ix),a
                            259 ;src/main.c:127: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   8966 FD 2A EE 88   [20]  260 	ld	iy,(_mapa)
   896A 16 00         [ 7]  261 	ld	d,#0x00
   896C 7B            [ 4]  262 	ld	a,e
   896D C6 E8         [ 7]  263 	add	a,#0xE8
   896F DD 77 FE      [19]  264 	ld	-2 (ix),a
   8972 7A            [ 4]  265 	ld	a,d
   8973 CE FF         [ 7]  266 	adc	a,#0xFF
   8975 DD 77 FF      [19]  267 	ld	-1 (ix),a
   8978 DD 6E FE      [19]  268 	ld	l,-2 (ix)
   897B DD 66 FF      [19]  269 	ld	h,-1 (ix)
   897E DD CB FF 7E   [20]  270 	bit	7, -1 (ix)
   8982 28 04         [12]  271 	jr	Z,00105$
   8984 21 EB FF      [10]  272 	ld	hl,#0xFFEB
   8987 19            [11]  273 	add	hl,de
   8988                     274 00105$:
   8988 CB 2C         [ 8]  275 	sra	h
   898A CB 1D         [ 8]  276 	rr	l
   898C CB 2C         [ 8]  277 	sra	h
   898E CB 1D         [ 8]  278 	rr	l
   8990 55            [ 4]  279 	ld	d,l
   8991 CB 39         [ 8]  280 	srl	c
   8993 FD E5         [15]  281 	push	iy
   8995 21 F0 C0      [10]  282 	ld	hl,#0xC0F0
   8998 E5            [11]  283 	push	hl
   8999 3E 28         [ 7]  284 	ld	a,#0x28
   899B F5            [11]  285 	push	af
   899C 33            [ 6]  286 	inc	sp
   899D DD 7E FD      [19]  287 	ld	a,-3 (ix)
   89A0 F5            [11]  288 	push	af
   89A1 33            [ 6]  289 	inc	sp
   89A2 C5            [11]  290 	push	bc
   89A3 33            [ 6]  291 	inc	sp
   89A4 D5            [11]  292 	push	de
   89A5 33            [ 6]  293 	inc	sp
   89A6 79            [ 4]  294 	ld	a,c
   89A7 F5            [11]  295 	push	af
   89A8 33            [ 6]  296 	inc	sp
   89A9 CD 44 7D      [17]  297 	call	_cpct_etm_drawTileBox2x4
   89AC DD F9         [10]  298 	ld	sp, ix
   89AE DD E1         [14]  299 	pop	ix
   89B0 C9            [10]  300 	ret
                            301 ;src/main.c:130: void menuFin(){
                            302 ;	---------------------------------
                            303 ; Function menuFin
                            304 ; ---------------------------------
   89B1                     305 _menuFin::
                            306 ;src/main.c:133: cpct_clearScreen(0);
   89B1 21 00 40      [10]  307 	ld	hl,#0x4000
   89B4 E5            [11]  308 	push	hl
   89B5 AF            [ 4]  309 	xor	a, a
   89B6 F5            [11]  310 	push	af
   89B7 33            [ 6]  311 	inc	sp
   89B8 26 C0         [ 7]  312 	ld	h, #0xC0
   89BA E5            [11]  313 	push	hl
   89BB CD 2A 7F      [17]  314 	call	_cpct_memset
                            315 ;src/main.c:135: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   89BE 21 18 5A      [10]  316 	ld	hl,#0x5A18
   89C1 E5            [11]  317 	push	hl
   89C2 21 00 C0      [10]  318 	ld	hl,#0xC000
   89C5 E5            [11]  319 	push	hl
   89C6 CD 4B 88      [17]  320 	call	_cpct_getScreenPtr
   89C9 4D            [ 4]  321 	ld	c,l
   89CA 44            [ 4]  322 	ld	b,h
                            323 ;src/main.c:136: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   89CB 21 02 00      [10]  324 	ld	hl,#0x0002
   89CE E5            [11]  325 	push	hl
   89CF C5            [11]  326 	push	bc
   89D0 21 DE 89      [10]  327 	ld	hl,#___str_0
   89D3 E5            [11]  328 	push	hl
   89D4 CD 7B 7C      [17]  329 	call	_cpct_drawStringM0
   89D7 21 06 00      [10]  330 	ld	hl,#6
   89DA 39            [11]  331 	add	hl,sp
   89DB F9            [ 6]  332 	ld	sp,hl
                            333 ;src/main.c:138: while(1){}
   89DC                     334 00102$:
   89DC 18 FE         [12]  335 	jr	00102$
   89DE                     336 ___str_0:
   89DE 47 41 4D 45 20 4F   337 	.ascii "GAME OVER"
        56 45 52
   89E7 00                  338 	.db 0x00
                            339 ;src/main.c:141: void redibujarProta() {
                            340 ;	---------------------------------
                            341 ; Function redibujarProta
                            342 ; ---------------------------------
   89E8                     343 _redibujarProta::
                            344 ;src/main.c:142: borrarProta();
   89E8 CD 3D 89      [17]  345 	call	_borrarProta
                            346 ;src/main.c:143: prota.px = prota.x;
   89EB 01 DE 88      [10]  347 	ld	bc,#_prota + 2
   89EE 3A DC 88      [13]  348 	ld	a, (#_prota + 0)
   89F1 02            [ 7]  349 	ld	(bc),a
                            350 ;src/main.c:144: prota.py = prota.y;
   89F2 01 DF 88      [10]  351 	ld	bc,#_prota + 3
   89F5 3A DD 88      [13]  352 	ld	a, (#_prota + 1)
   89F8 02            [ 7]  353 	ld	(bc),a
                            354 ;src/main.c:145: dibujarProta();
   89F9 C3 17 89      [10]  355 	jp  _dibujarProta
                            356 ;src/main.c:148: u8* getTilePtr(u8 x, u8 y) {
                            357 ;	---------------------------------
                            358 ; Function getTilePtr
                            359 ; ---------------------------------
   89FC                     360 _getTilePtr::
   89FC DD E5         [15]  361 	push	ix
   89FE DD 21 00 00   [14]  362 	ld	ix,#0
   8A02 DD 39         [15]  363 	add	ix,sp
                            364 ;src/main.c:149: return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
   8A04 DD 4E 05      [19]  365 	ld	c,5 (ix)
   8A07 06 00         [ 7]  366 	ld	b,#0x00
   8A09 79            [ 4]  367 	ld	a,c
   8A0A C6 E8         [ 7]  368 	add	a,#0xE8
   8A0C 5F            [ 4]  369 	ld	e,a
   8A0D 78            [ 4]  370 	ld	a,b
   8A0E CE FF         [ 7]  371 	adc	a,#0xFF
   8A10 57            [ 4]  372 	ld	d,a
   8A11 6B            [ 4]  373 	ld	l, e
   8A12 62            [ 4]  374 	ld	h, d
   8A13 CB 7A         [ 8]  375 	bit	7, d
   8A15 28 04         [12]  376 	jr	Z,00103$
   8A17 21 EB FF      [10]  377 	ld	hl,#0xFFEB
   8A1A 09            [11]  378 	add	hl,bc
   8A1B                     379 00103$:
   8A1B CB 2C         [ 8]  380 	sra	h
   8A1D CB 1D         [ 8]  381 	rr	l
   8A1F CB 2C         [ 8]  382 	sra	h
   8A21 CB 1D         [ 8]  383 	rr	l
   8A23 4D            [ 4]  384 	ld	c, l
   8A24 44            [ 4]  385 	ld	b, h
   8A25 29            [11]  386 	add	hl, hl
   8A26 29            [11]  387 	add	hl, hl
   8A27 09            [11]  388 	add	hl, bc
   8A28 29            [11]  389 	add	hl, hl
   8A29 29            [11]  390 	add	hl, hl
   8A2A 29            [11]  391 	add	hl, hl
   8A2B 4D            [ 4]  392 	ld	c,l
   8A2C 44            [ 4]  393 	ld	b,h
   8A2D 2A EE 88      [16]  394 	ld	hl,(_mapa)
   8A30 09            [11]  395 	add	hl,bc
   8A31 DD 4E 04      [19]  396 	ld	c,4 (ix)
   8A34 CB 39         [ 8]  397 	srl	c
   8A36 59            [ 4]  398 	ld	e,c
   8A37 16 00         [ 7]  399 	ld	d,#0x00
   8A39 19            [11]  400 	add	hl,de
   8A3A DD E1         [14]  401 	pop	ix
   8A3C C9            [10]  402 	ret
                            403 ;src/main.c:152: u8 checkCollision(int direction) { // check optimization
                            404 ;	---------------------------------
                            405 ; Function checkCollision
                            406 ; ---------------------------------
   8A3D                     407 _checkCollision::
   8A3D DD E5         [15]  408 	push	ix
   8A3F DD 21 00 00   [14]  409 	ld	ix,#0
   8A43 DD 39         [15]  410 	add	ix,sp
   8A45 F5            [11]  411 	push	af
                            412 ;src/main.c:153: u8 *headTile=0, *feetTile=0, *waistTile=0;
   8A46 21 00 00      [10]  413 	ld	hl,#0x0000
   8A49 E3            [19]  414 	ex	(sp), hl
   8A4A 11 00 00      [10]  415 	ld	de,#0x0000
   8A4D 01 00 00      [10]  416 	ld	bc,#0x0000
                            417 ;src/main.c:155: switch (direction) {
   8A50 DD CB 05 7E   [20]  418 	bit	7, 5 (ix)
   8A54 C2 71 8B      [10]  419 	jp	NZ,00105$
   8A57 3E 03         [ 7]  420 	ld	a,#0x03
   8A59 DD BE 04      [19]  421 	cp	a, 4 (ix)
   8A5C 3E 00         [ 7]  422 	ld	a,#0x00
   8A5E DD 9E 05      [19]  423 	sbc	a, 5 (ix)
   8A61 E2 66 8A      [10]  424 	jp	PO, 00128$
   8A64 EE 80         [ 7]  425 	xor	a, #0x80
   8A66                     426 00128$:
   8A66 FA 71 8B      [10]  427 	jp	M,00105$
   8A69 DD 5E 04      [19]  428 	ld	e,4 (ix)
   8A6C 16 00         [ 7]  429 	ld	d,#0x00
   8A6E 21 75 8A      [10]  430 	ld	hl,#00129$
   8A71 19            [11]  431 	add	hl,de
   8A72 19            [11]  432 	add	hl,de
   8A73 19            [11]  433 	add	hl,de
   8A74 E9            [ 4]  434 	jp	(hl)
   8A75                     435 00129$:
   8A75 C3 81 8A      [10]  436 	jp	00101$
   8A78 C3 CC 8A      [10]  437 	jp	00102$
   8A7B C3 0D 8B      [10]  438 	jp	00103$
   8A7E C3 40 8B      [10]  439 	jp	00104$
                            440 ;src/main.c:156: case 0:
   8A81                     441 00101$:
                            442 ;src/main.c:157: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   8A81 21 DD 88      [10]  443 	ld	hl, #(_prota + 0x0001) + 0
   8A84 5E            [ 7]  444 	ld	e,(hl)
   8A85 21 DC 88      [10]  445 	ld	hl, #_prota + 0
   8A88 4E            [ 7]  446 	ld	c,(hl)
   8A89 0C            [ 4]  447 	inc	c
   8A8A 0C            [ 4]  448 	inc	c
   8A8B 0C            [ 4]  449 	inc	c
   8A8C 0C            [ 4]  450 	inc	c
   8A8D 7B            [ 4]  451 	ld	a,e
   8A8E F5            [11]  452 	push	af
   8A8F 33            [ 6]  453 	inc	sp
   8A90 79            [ 4]  454 	ld	a,c
   8A91 F5            [11]  455 	push	af
   8A92 33            [ 6]  456 	inc	sp
   8A93 CD FC 89      [17]  457 	call	_getTilePtr
   8A96 F1            [10]  458 	pop	af
   8A97 33            [ 6]  459 	inc	sp
   8A98 33            [ 6]  460 	inc	sp
   8A99 E5            [11]  461 	push	hl
                            462 ;src/main.c:158: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   8A9A 3A DD 88      [13]  463 	ld	a, (#(_prota + 0x0001) + 0)
   8A9D C6 14         [ 7]  464 	add	a, #0x14
   8A9F 4F            [ 4]  465 	ld	c,a
   8AA0 21 DC 88      [10]  466 	ld	hl, #_prota + 0
   8AA3 46            [ 7]  467 	ld	b,(hl)
   8AA4 04            [ 4]  468 	inc	b
   8AA5 04            [ 4]  469 	inc	b
   8AA6 04            [ 4]  470 	inc	b
   8AA7 04            [ 4]  471 	inc	b
   8AA8 79            [ 4]  472 	ld	a,c
   8AA9 F5            [11]  473 	push	af
   8AAA 33            [ 6]  474 	inc	sp
   8AAB C5            [11]  475 	push	bc
   8AAC 33            [ 6]  476 	inc	sp
   8AAD CD FC 89      [17]  477 	call	_getTilePtr
   8AB0 F1            [10]  478 	pop	af
   8AB1 EB            [ 4]  479 	ex	de,hl
                            480 ;src/main.c:159: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   8AB2 3A DD 88      [13]  481 	ld	a, (#(_prota + 0x0001) + 0)
   8AB5 C6 0B         [ 7]  482 	add	a, #0x0B
   8AB7 47            [ 4]  483 	ld	b,a
   8AB8 3A DC 88      [13]  484 	ld	a, (#_prota + 0)
   8ABB C6 04         [ 7]  485 	add	a, #0x04
   8ABD D5            [11]  486 	push	de
   8ABE C5            [11]  487 	push	bc
   8ABF 33            [ 6]  488 	inc	sp
   8AC0 F5            [11]  489 	push	af
   8AC1 33            [ 6]  490 	inc	sp
   8AC2 CD FC 89      [17]  491 	call	_getTilePtr
   8AC5 F1            [10]  492 	pop	af
   8AC6 4D            [ 4]  493 	ld	c,l
   8AC7 44            [ 4]  494 	ld	b,h
   8AC8 D1            [10]  495 	pop	de
                            496 ;src/main.c:160: break;
   8AC9 C3 71 8B      [10]  497 	jp	00105$
                            498 ;src/main.c:161: case 1:
   8ACC                     499 00102$:
                            500 ;src/main.c:162: headTile  = getTilePtr(prota.x - 1, prota.y);
   8ACC 21 DD 88      [10]  501 	ld	hl, #(_prota + 0x0001) + 0
   8ACF 56            [ 7]  502 	ld	d,(hl)
   8AD0 21 DC 88      [10]  503 	ld	hl, #_prota + 0
   8AD3 46            [ 7]  504 	ld	b,(hl)
   8AD4 05            [ 4]  505 	dec	b
   8AD5 D5            [11]  506 	push	de
   8AD6 33            [ 6]  507 	inc	sp
   8AD7 C5            [11]  508 	push	bc
   8AD8 33            [ 6]  509 	inc	sp
   8AD9 CD FC 89      [17]  510 	call	_getTilePtr
   8ADC F1            [10]  511 	pop	af
   8ADD 33            [ 6]  512 	inc	sp
   8ADE 33            [ 6]  513 	inc	sp
   8ADF E5            [11]  514 	push	hl
                            515 ;src/main.c:163: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
   8AE0 3A DD 88      [13]  516 	ld	a, (#(_prota + 0x0001) + 0)
   8AE3 C6 14         [ 7]  517 	add	a, #0x14
   8AE5 57            [ 4]  518 	ld	d,a
   8AE6 21 DC 88      [10]  519 	ld	hl, #_prota + 0
   8AE9 46            [ 7]  520 	ld	b,(hl)
   8AEA 05            [ 4]  521 	dec	b
   8AEB D5            [11]  522 	push	de
   8AEC 33            [ 6]  523 	inc	sp
   8AED C5            [11]  524 	push	bc
   8AEE 33            [ 6]  525 	inc	sp
   8AEF CD FC 89      [17]  526 	call	_getTilePtr
   8AF2 F1            [10]  527 	pop	af
   8AF3 EB            [ 4]  528 	ex	de,hl
                            529 ;src/main.c:164: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
   8AF4 3A DD 88      [13]  530 	ld	a, (#(_prota + 0x0001) + 0)
   8AF7 C6 0B         [ 7]  531 	add	a, #0x0B
   8AF9 47            [ 4]  532 	ld	b,a
   8AFA 3A DC 88      [13]  533 	ld	a, (#_prota + 0)
   8AFD C6 FF         [ 7]  534 	add	a,#0xFF
   8AFF D5            [11]  535 	push	de
   8B00 C5            [11]  536 	push	bc
   8B01 33            [ 6]  537 	inc	sp
   8B02 F5            [11]  538 	push	af
   8B03 33            [ 6]  539 	inc	sp
   8B04 CD FC 89      [17]  540 	call	_getTilePtr
   8B07 F1            [10]  541 	pop	af
   8B08 4D            [ 4]  542 	ld	c,l
   8B09 44            [ 4]  543 	ld	b,h
   8B0A D1            [10]  544 	pop	de
                            545 ;src/main.c:165: break;
   8B0B 18 64         [12]  546 	jr	00105$
                            547 ;src/main.c:166: case 2:
   8B0D                     548 00103$:
                            549 ;src/main.c:167: headTile   = getTilePtr(prota.x, prota.y - 2);
   8B0D 3A DD 88      [13]  550 	ld	a, (#(_prota + 0x0001) + 0)
   8B10 C6 FE         [ 7]  551 	add	a,#0xFE
   8B12 21 DC 88      [10]  552 	ld	hl, #_prota + 0
   8B15 56            [ 7]  553 	ld	d,(hl)
   8B16 C5            [11]  554 	push	bc
   8B17 F5            [11]  555 	push	af
   8B18 33            [ 6]  556 	inc	sp
   8B19 D5            [11]  557 	push	de
   8B1A 33            [ 6]  558 	inc	sp
   8B1B CD FC 89      [17]  559 	call	_getTilePtr
   8B1E F1            [10]  560 	pop	af
   8B1F C1            [10]  561 	pop	bc
   8B20 33            [ 6]  562 	inc	sp
   8B21 33            [ 6]  563 	inc	sp
   8B22 E5            [11]  564 	push	hl
                            565 ;src/main.c:168: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
   8B23 21 DD 88      [10]  566 	ld	hl, #(_prota + 0x0001) + 0
   8B26 56            [ 7]  567 	ld	d,(hl)
   8B27 15            [ 4]  568 	dec	d
   8B28 15            [ 4]  569 	dec	d
   8B29 3A DC 88      [13]  570 	ld	a, (#_prota + 0)
   8B2C C6 03         [ 7]  571 	add	a, #0x03
   8B2E C5            [11]  572 	push	bc
   8B2F D5            [11]  573 	push	de
   8B30 33            [ 6]  574 	inc	sp
   8B31 F5            [11]  575 	push	af
   8B32 33            [ 6]  576 	inc	sp
   8B33 CD FC 89      [17]  577 	call	_getTilePtr
   8B36 F1            [10]  578 	pop	af
   8B37 EB            [ 4]  579 	ex	de,hl
   8B38 C1            [10]  580 	pop	bc
                            581 ;src/main.c:169: *waistTile = 0;
   8B39 21 00 00      [10]  582 	ld	hl,#0x0000
   8B3C 36 00         [10]  583 	ld	(hl),#0x00
                            584 ;src/main.c:170: break;
   8B3E 18 31         [12]  585 	jr	00105$
                            586 ;src/main.c:171: case 3:
   8B40                     587 00104$:
                            588 ;src/main.c:172: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
   8B40 3A DD 88      [13]  589 	ld	a, (#(_prota + 0x0001) + 0)
   8B43 C6 16         [ 7]  590 	add	a, #0x16
   8B45 21 DC 88      [10]  591 	ld	hl, #_prota + 0
   8B48 56            [ 7]  592 	ld	d,(hl)
   8B49 C5            [11]  593 	push	bc
   8B4A F5            [11]  594 	push	af
   8B4B 33            [ 6]  595 	inc	sp
   8B4C D5            [11]  596 	push	de
   8B4D 33            [ 6]  597 	inc	sp
   8B4E CD FC 89      [17]  598 	call	_getTilePtr
   8B51 F1            [10]  599 	pop	af
   8B52 C1            [10]  600 	pop	bc
   8B53 33            [ 6]  601 	inc	sp
   8B54 33            [ 6]  602 	inc	sp
   8B55 E5            [11]  603 	push	hl
                            604 ;src/main.c:173: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   8B56 3A DD 88      [13]  605 	ld	a, (#(_prota + 0x0001) + 0)
   8B59 C6 16         [ 7]  606 	add	a, #0x16
   8B5B 57            [ 4]  607 	ld	d,a
   8B5C 3A DC 88      [13]  608 	ld	a, (#_prota + 0)
   8B5F C6 03         [ 7]  609 	add	a, #0x03
   8B61 C5            [11]  610 	push	bc
   8B62 D5            [11]  611 	push	de
   8B63 33            [ 6]  612 	inc	sp
   8B64 F5            [11]  613 	push	af
   8B65 33            [ 6]  614 	inc	sp
   8B66 CD FC 89      [17]  615 	call	_getTilePtr
   8B69 F1            [10]  616 	pop	af
   8B6A EB            [ 4]  617 	ex	de,hl
   8B6B C1            [10]  618 	pop	bc
                            619 ;src/main.c:174: *waistTile = 0;
   8B6C 21 00 00      [10]  620 	ld	hl,#0x0000
   8B6F 36 00         [10]  621 	ld	(hl),#0x00
                            622 ;src/main.c:176: }
   8B71                     623 00105$:
                            624 ;src/main.c:178: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   8B71 E1            [10]  625 	pop	hl
   8B72 E5            [11]  626 	push	hl
   8B73 6E            [ 7]  627 	ld	l,(hl)
   8B74 3E 02         [ 7]  628 	ld	a,#0x02
   8B76 95            [ 4]  629 	sub	a, l
   8B77 38 0E         [12]  630 	jr	C,00106$
   8B79 1A            [ 7]  631 	ld	a,(de)
   8B7A 5F            [ 4]  632 	ld	e,a
   8B7B 3E 02         [ 7]  633 	ld	a,#0x02
   8B7D 93            [ 4]  634 	sub	a, e
   8B7E 38 07         [12]  635 	jr	C,00106$
   8B80 0A            [ 7]  636 	ld	a,(bc)
   8B81 4F            [ 4]  637 	ld	c,a
   8B82 3E 02         [ 7]  638 	ld	a,#0x02
   8B84 91            [ 4]  639 	sub	a, c
   8B85 30 04         [12]  640 	jr	NC,00107$
   8B87                     641 00106$:
                            642 ;src/main.c:179: return 1;
   8B87 2E 01         [ 7]  643 	ld	l,#0x01
   8B89 18 02         [12]  644 	jr	00110$
   8B8B                     645 00107$:
                            646 ;src/main.c:181: return 0;
   8B8B 2E 00         [ 7]  647 	ld	l,#0x00
   8B8D                     648 00110$:
   8B8D DD F9         [10]  649 	ld	sp, ix
   8B8F DD E1         [14]  650 	pop	ix
   8B91 C9            [10]  651 	ret
                            652 ;src/main.c:184: void dibujarEnemigo(TEnemy *enemy) {
                            653 ;	---------------------------------
                            654 ; Function dibujarEnemigo
                            655 ; ---------------------------------
   8B92                     656 _dibujarEnemigo::
   8B92 DD E5         [15]  657 	push	ix
   8B94 DD 21 00 00   [14]  658 	ld	ix,#0
   8B98 DD 39         [15]  659 	add	ix,sp
                            660 ;src/main.c:185: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   8B9A DD 4E 04      [19]  661 	ld	c,4 (ix)
   8B9D DD 46 05      [19]  662 	ld	b,5 (ix)
   8BA0 69            [ 4]  663 	ld	l, c
   8BA1 60            [ 4]  664 	ld	h, b
   8BA2 23            [ 6]  665 	inc	hl
   8BA3 56            [ 7]  666 	ld	d,(hl)
   8BA4 0A            [ 7]  667 	ld	a,(bc)
   8BA5 C5            [11]  668 	push	bc
   8BA6 D5            [11]  669 	push	de
   8BA7 33            [ 6]  670 	inc	sp
   8BA8 F5            [11]  671 	push	af
   8BA9 33            [ 6]  672 	inc	sp
   8BAA 21 00 C0      [10]  673 	ld	hl,#0xC000
   8BAD E5            [11]  674 	push	hl
   8BAE CD 4B 88      [17]  675 	call	_cpct_getScreenPtr
   8BB1 EB            [ 4]  676 	ex	de,hl
                            677 ;src/main.c:186: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   8BB2 E1            [10]  678 	pop	hl
   8BB3 01 04 00      [10]  679 	ld	bc, #0x0004
   8BB6 09            [11]  680 	add	hl, bc
   8BB7 4E            [ 7]  681 	ld	c,(hl)
   8BB8 23            [ 6]  682 	inc	hl
   8BB9 46            [ 7]  683 	ld	b,(hl)
   8BBA 21 00 3E      [10]  684 	ld	hl,#_g_tablatrans
   8BBD E5            [11]  685 	push	hl
   8BBE 21 04 16      [10]  686 	ld	hl,#0x1604
   8BC1 E5            [11]  687 	push	hl
   8BC2 D5            [11]  688 	push	de
   8BC3 C5            [11]  689 	push	bc
   8BC4 CD 6B 88      [17]  690 	call	_cpct_drawSpriteMaskedAlignedTable
   8BC7 DD E1         [14]  691 	pop	ix
   8BC9 C9            [10]  692 	ret
                            693 ;src/main.c:189: void dibujarExplosion(TEnemy *enemy) {
                            694 ;	---------------------------------
                            695 ; Function dibujarExplosion
                            696 ; ---------------------------------
   8BCA                     697 _dibujarExplosion::
   8BCA DD E5         [15]  698 	push	ix
   8BCC DD 21 00 00   [14]  699 	ld	ix,#0
   8BD0 DD 39         [15]  700 	add	ix,sp
                            701 ;src/main.c:190: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   8BD2 DD 4E 04      [19]  702 	ld	c,4 (ix)
   8BD5 DD 46 05      [19]  703 	ld	b,5 (ix)
   8BD8 69            [ 4]  704 	ld	l, c
   8BD9 60            [ 4]  705 	ld	h, b
   8BDA 23            [ 6]  706 	inc	hl
   8BDB 56            [ 7]  707 	ld	d,(hl)
   8BDC 0A            [ 7]  708 	ld	a,(bc)
   8BDD 47            [ 4]  709 	ld	b,a
   8BDE D5            [11]  710 	push	de
   8BDF 33            [ 6]  711 	inc	sp
   8BE0 C5            [11]  712 	push	bc
   8BE1 33            [ 6]  713 	inc	sp
   8BE2 21 00 C0      [10]  714 	ld	hl,#0xC000
   8BE5 E5            [11]  715 	push	hl
   8BE6 CD 4B 88      [17]  716 	call	_cpct_getScreenPtr
   8BE9 4D            [ 4]  717 	ld	c,l
   8BEA 44            [ 4]  718 	ld	b,h
                            719 ;src/main.c:191: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   8BEB 11 00 3E      [10]  720 	ld	de,#_g_tablatrans+0
   8BEE D5            [11]  721 	push	de
   8BEF 21 04 16      [10]  722 	ld	hl,#0x1604
   8BF2 E5            [11]  723 	push	hl
   8BF3 C5            [11]  724 	push	bc
   8BF4 21 A8 55      [10]  725 	ld	hl,#_g_explosion
   8BF7 E5            [11]  726 	push	hl
   8BF8 CD 6B 88      [17]  727 	call	_cpct_drawSpriteMaskedAlignedTable
   8BFB DD E1         [14]  728 	pop	ix
   8BFD C9            [10]  729 	ret
                            730 ;src/main.c:194: void borrarExplosion() {
                            731 ;	---------------------------------
                            732 ; Function borrarExplosion
                            733 ; ---------------------------------
   8BFE                     734 _borrarExplosion::
   8BFE DD E5         [15]  735 	push	ix
   8C00 DD 21 00 00   [14]  736 	ld	ix,#0
   8C04 DD 39         [15]  737 	add	ix,sp
   8C06 F5            [11]  738 	push	af
   8C07 3B            [ 6]  739 	dec	sp
                            740 ;src/main.c:195: u8 w = 4 + (enemy->px & 1);
   8C08 21 AA 88      [10]  741 	ld	hl, #_enemy + 2
   8C0B 4E            [ 7]  742 	ld	c,(hl)
   8C0C 79            [ 4]  743 	ld	a,c
   8C0D E6 01         [ 7]  744 	and	a, #0x01
   8C0F 47            [ 4]  745 	ld	b,a
   8C10 04            [ 4]  746 	inc	b
   8C11 04            [ 4]  747 	inc	b
   8C12 04            [ 4]  748 	inc	b
   8C13 04            [ 4]  749 	inc	b
                            750 ;src/main.c:198: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   8C14 21 AB 88      [10]  751 	ld	hl, #_enemy + 3
   8C17 5E            [ 7]  752 	ld	e,(hl)
   8C18 CB 4B         [ 8]  753 	bit	1, e
   8C1A 28 04         [12]  754 	jr	Z,00103$
   8C1C 3E 01         [ 7]  755 	ld	a,#0x01
   8C1E 18 02         [12]  756 	jr	00104$
   8C20                     757 00103$:
   8C20 3E 00         [ 7]  758 	ld	a,#0x00
   8C22                     759 00104$:
   8C22 C6 07         [ 7]  760 	add	a, #0x07
   8C24 DD 77 FD      [19]  761 	ld	-3 (ix),a
                            762 ;src/main.c:200: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   8C27 FD 2A EE 88   [20]  763 	ld	iy,(_mapa)
   8C2B 16 00         [ 7]  764 	ld	d,#0x00
   8C2D 7B            [ 4]  765 	ld	a,e
   8C2E C6 E8         [ 7]  766 	add	a,#0xE8
   8C30 DD 77 FE      [19]  767 	ld	-2 (ix),a
   8C33 7A            [ 4]  768 	ld	a,d
   8C34 CE FF         [ 7]  769 	adc	a,#0xFF
   8C36 DD 77 FF      [19]  770 	ld	-1 (ix),a
   8C39 DD 6E FE      [19]  771 	ld	l,-2 (ix)
   8C3C DD 66 FF      [19]  772 	ld	h,-1 (ix)
   8C3F DD CB FF 7E   [20]  773 	bit	7, -1 (ix)
   8C43 28 04         [12]  774 	jr	Z,00105$
   8C45 21 EB FF      [10]  775 	ld	hl,#0xFFEB
   8C48 19            [11]  776 	add	hl,de
   8C49                     777 00105$:
   8C49 CB 2C         [ 8]  778 	sra	h
   8C4B CB 1D         [ 8]  779 	rr	l
   8C4D CB 2C         [ 8]  780 	sra	h
   8C4F CB 1D         [ 8]  781 	rr	l
   8C51 55            [ 4]  782 	ld	d,l
   8C52 CB 39         [ 8]  783 	srl	c
   8C54 FD E5         [15]  784 	push	iy
   8C56 21 F0 C0      [10]  785 	ld	hl,#0xC0F0
   8C59 E5            [11]  786 	push	hl
   8C5A 3E 28         [ 7]  787 	ld	a,#0x28
   8C5C F5            [11]  788 	push	af
   8C5D 33            [ 6]  789 	inc	sp
   8C5E DD 7E FD      [19]  790 	ld	a,-3 (ix)
   8C61 F5            [11]  791 	push	af
   8C62 33            [ 6]  792 	inc	sp
   8C63 C5            [11]  793 	push	bc
   8C64 33            [ 6]  794 	inc	sp
   8C65 D5            [11]  795 	push	de
   8C66 33            [ 6]  796 	inc	sp
   8C67 79            [ 4]  797 	ld	a,c
   8C68 F5            [11]  798 	push	af
   8C69 33            [ 6]  799 	inc	sp
   8C6A CD 44 7D      [17]  800 	call	_cpct_etm_drawTileBox2x4
   8C6D DD F9         [10]  801 	ld	sp, ix
   8C6F DD E1         [14]  802 	pop	ix
   8C71 C9            [10]  803 	ret
                            804 ;src/main.c:204: void borrarEnemigo(TEnemy *enemy) {
                            805 ;	---------------------------------
                            806 ; Function borrarEnemigo
                            807 ; ---------------------------------
   8C72                     808 _borrarEnemigo::
   8C72 DD E5         [15]  809 	push	ix
   8C74 DD 21 00 00   [14]  810 	ld	ix,#0
   8C78 DD 39         [15]  811 	add	ix,sp
   8C7A 21 FA FF      [10]  812 	ld	hl,#-6
   8C7D 39            [11]  813 	add	hl,sp
   8C7E F9            [ 6]  814 	ld	sp,hl
                            815 ;src/main.c:206: u8 w = 4 + (enemy->px & 1);
   8C7F DD 4E 04      [19]  816 	ld	c,4 (ix)
   8C82 DD 46 05      [19]  817 	ld	b,5 (ix)
   8C85 69            [ 4]  818 	ld	l, c
   8C86 60            [ 4]  819 	ld	h, b
   8C87 23            [ 6]  820 	inc	hl
   8C88 23            [ 6]  821 	inc	hl
   8C89 5E            [ 7]  822 	ld	e,(hl)
   8C8A 7B            [ 4]  823 	ld	a,e
   8C8B E6 01         [ 7]  824 	and	a, #0x01
   8C8D C6 04         [ 7]  825 	add	a, #0x04
   8C8F DD 77 FA      [19]  826 	ld	-6 (ix),a
                            827 ;src/main.c:209: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   8C92 69            [ 4]  828 	ld	l, c
   8C93 60            [ 4]  829 	ld	h, b
   8C94 23            [ 6]  830 	inc	hl
   8C95 23            [ 6]  831 	inc	hl
   8C96 23            [ 6]  832 	inc	hl
   8C97 56            [ 7]  833 	ld	d,(hl)
   8C98 CB 4A         [ 8]  834 	bit	1, d
   8C9A 28 04         [12]  835 	jr	Z,00103$
   8C9C 3E 01         [ 7]  836 	ld	a,#0x01
   8C9E 18 02         [12]  837 	jr	00104$
   8CA0                     838 00103$:
   8CA0 3E 00         [ 7]  839 	ld	a,#0x00
   8CA2                     840 00104$:
   8CA2 C6 07         [ 7]  841 	add	a, #0x07
   8CA4 DD 77 FB      [19]  842 	ld	-5 (ix),a
                            843 ;src/main.c:211: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   8CA7 FD 2A EE 88   [20]  844 	ld	iy,(_mapa)
   8CAB DD 72 FC      [19]  845 	ld	-4 (ix),d
   8CAE DD 36 FD 00   [19]  846 	ld	-3 (ix),#0x00
   8CB2 DD 7E FC      [19]  847 	ld	a,-4 (ix)
   8CB5 C6 E8         [ 7]  848 	add	a,#0xE8
   8CB7 DD 77 FE      [19]  849 	ld	-2 (ix),a
   8CBA DD 7E FD      [19]  850 	ld	a,-3 (ix)
   8CBD CE FF         [ 7]  851 	adc	a,#0xFF
   8CBF DD 77 FF      [19]  852 	ld	-1 (ix),a
   8CC2 DD 56 FE      [19]  853 	ld	d,-2 (ix)
   8CC5 DD 6E FF      [19]  854 	ld	l,-1 (ix)
   8CC8 DD CB FF 7E   [20]  855 	bit	7, -1 (ix)
   8CCC 28 0C         [12]  856 	jr	Z,00105$
   8CCE DD 7E FC      [19]  857 	ld	a,-4 (ix)
   8CD1 C6 EB         [ 7]  858 	add	a, #0xEB
   8CD3 57            [ 4]  859 	ld	d,a
   8CD4 DD 7E FD      [19]  860 	ld	a,-3 (ix)
   8CD7 CE FF         [ 7]  861 	adc	a, #0xFF
   8CD9 6F            [ 4]  862 	ld	l,a
   8CDA                     863 00105$:
   8CDA CB 2D         [ 8]  864 	sra	l
   8CDC CB 1A         [ 8]  865 	rr	d
   8CDE CB 2D         [ 8]  866 	sra	l
   8CE0 CB 1A         [ 8]  867 	rr	d
   8CE2 CB 3B         [ 8]  868 	srl	e
   8CE4 C5            [11]  869 	push	bc
   8CE5 FD E5         [15]  870 	push	iy
   8CE7 21 F0 C0      [10]  871 	ld	hl,#0xC0F0
   8CEA E5            [11]  872 	push	hl
   8CEB 3E 28         [ 7]  873 	ld	a,#0x28
   8CED F5            [11]  874 	push	af
   8CEE 33            [ 6]  875 	inc	sp
   8CEF DD 66 FB      [19]  876 	ld	h,-5 (ix)
   8CF2 DD 6E FA      [19]  877 	ld	l,-6 (ix)
   8CF5 E5            [11]  878 	push	hl
   8CF6 D5            [11]  879 	push	de
   8CF7 CD 44 7D      [17]  880 	call	_cpct_etm_drawTileBox2x4
   8CFA C1            [10]  881 	pop	bc
                            882 ;src/main.c:213: enemy->mover = NO;
   8CFB 21 06 00      [10]  883 	ld	hl,#0x0006
   8CFE 09            [11]  884 	add	hl,bc
   8CFF 36 00         [10]  885 	ld	(hl),#0x00
   8D01 DD F9         [10]  886 	ld	sp, ix
   8D03 DD E1         [14]  887 	pop	ix
   8D05 C9            [10]  888 	ret
                            889 ;src/main.c:216: void redibujarEnemigo(TEnemy *enemy) {
                            890 ;	---------------------------------
                            891 ; Function redibujarEnemigo
                            892 ; ---------------------------------
   8D06                     893 _redibujarEnemigo::
   8D06 DD E5         [15]  894 	push	ix
   8D08 DD 21 00 00   [14]  895 	ld	ix,#0
   8D0C DD 39         [15]  896 	add	ix,sp
                            897 ;src/main.c:217: borrarEnemigo(enemy);
   8D0E DD 6E 04      [19]  898 	ld	l,4 (ix)
   8D11 DD 66 05      [19]  899 	ld	h,5 (ix)
   8D14 E5            [11]  900 	push	hl
   8D15 CD 72 8C      [17]  901 	call	_borrarEnemigo
   8D18 F1            [10]  902 	pop	af
                            903 ;src/main.c:218: enemy->px = enemy->x;
   8D19 DD 4E 04      [19]  904 	ld	c,4 (ix)
   8D1C DD 46 05      [19]  905 	ld	b,5 (ix)
   8D1F 59            [ 4]  906 	ld	e, c
   8D20 50            [ 4]  907 	ld	d, b
   8D21 13            [ 6]  908 	inc	de
   8D22 13            [ 6]  909 	inc	de
   8D23 0A            [ 7]  910 	ld	a,(bc)
   8D24 12            [ 7]  911 	ld	(de),a
                            912 ;src/main.c:219: enemy->py = enemy->y;
   8D25 59            [ 4]  913 	ld	e, c
   8D26 50            [ 4]  914 	ld	d, b
   8D27 13            [ 6]  915 	inc	de
   8D28 13            [ 6]  916 	inc	de
   8D29 13            [ 6]  917 	inc	de
   8D2A 69            [ 4]  918 	ld	l, c
   8D2B 60            [ 4]  919 	ld	h, b
   8D2C 23            [ 6]  920 	inc	hl
   8D2D 7E            [ 7]  921 	ld	a,(hl)
   8D2E 12            [ 7]  922 	ld	(de),a
                            923 ;src/main.c:220: dibujarEnemigo(enemy);
   8D2F C5            [11]  924 	push	bc
   8D30 CD 92 8B      [17]  925 	call	_dibujarEnemigo
   8D33 F1            [10]  926 	pop	af
   8D34 DD E1         [14]  927 	pop	ix
   8D36 C9            [10]  928 	ret
                            929 ;src/main.c:223: u8 checkEnemyCollision(int direction, TEnemy *enemy){
                            930 ;	---------------------------------
                            931 ; Function checkEnemyCollision
                            932 ; ---------------------------------
   8D37                     933 _checkEnemyCollision::
   8D37 DD E5         [15]  934 	push	ix
   8D39 DD 21 00 00   [14]  935 	ld	ix,#0
   8D3D DD 39         [15]  936 	add	ix,sp
   8D3F 21 F7 FF      [10]  937 	ld	hl,#-9
   8D42 39            [11]  938 	add	hl,sp
   8D43 F9            [ 6]  939 	ld	sp,hl
                            940 ;src/main.c:225: u8 colisiona = 1;
   8D44 DD 36 F7 01   [19]  941 	ld	-9 (ix),#0x01
                            942 ;src/main.c:227: switch (direction) {
   8D48 DD CB 05 7E   [20]  943 	bit	7, 5 (ix)
   8D4C C2 FF 90      [10]  944 	jp	NZ,00165$
   8D4F 3E 03         [ 7]  945 	ld	a,#0x03
   8D51 DD BE 04      [19]  946 	cp	a, 4 (ix)
   8D54 3E 00         [ 7]  947 	ld	a,#0x00
   8D56 DD 9E 05      [19]  948 	sbc	a, 5 (ix)
   8D59 E2 5E 8D      [10]  949 	jp	PO, 00272$
   8D5C EE 80         [ 7]  950 	xor	a, #0x80
   8D5E                     951 00272$:
   8D5E FA FF 90      [10]  952 	jp	M,00165$
                            953 ;src/main.c:229: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   8D61 DD 4E 06      [19]  954 	ld	c,6 (ix)
   8D64 DD 46 07      [19]  955 	ld	b,7 (ix)
   8D67 0A            [ 7]  956 	ld	a,(bc)
   8D68 5F            [ 4]  957 	ld	e,a
   8D69 21 01 00      [10]  958 	ld	hl,#0x0001
   8D6C 09            [11]  959 	add	hl,bc
   8D6D DD 75 F8      [19]  960 	ld	-8 (ix),l
   8D70 DD 74 F9      [19]  961 	ld	-7 (ix),h
   8D73 DD 6E F8      [19]  962 	ld	l,-8 (ix)
   8D76 DD 66 F9      [19]  963 	ld	h,-7 (ix)
   8D79 56            [ 7]  964 	ld	d,(hl)
                            965 ;src/main.c:242: enemy->muerto = SI;
   8D7A 21 08 00      [10]  966 	ld	hl,#0x0008
   8D7D 09            [11]  967 	add	hl,bc
   8D7E DD 75 FA      [19]  968 	ld	-6 (ix),l
   8D81 DD 74 FB      [19]  969 	ld	-5 (ix),h
                            970 ;src/main.c:249: enemy->mira = M_izquierda;
   8D84 21 07 00      [10]  971 	ld	hl,#0x0007
   8D87 09            [11]  972 	add	hl,bc
   8D88 DD 75 FC      [19]  973 	ld	-4 (ix),l
   8D8B DD 74 FD      [19]  974 	ld	-3 (ix),h
                            975 ;src/main.c:227: switch (direction) {
   8D8E D5            [11]  976 	push	de
   8D8F DD 5E 04      [19]  977 	ld	e,4 (ix)
   8D92 16 00         [ 7]  978 	ld	d,#0x00
   8D94 21 9C 8D      [10]  979 	ld	hl,#00273$
   8D97 19            [11]  980 	add	hl,de
   8D98 19            [11]  981 	add	hl,de
   8D99 19            [11]  982 	add	hl,de
   8D9A D1            [10]  983 	pop	de
   8D9B E9            [ 4]  984 	jp	(hl)
   8D9C                     985 00273$:
   8D9C C3 A8 8D      [10]  986 	jp	00101$
   8D9F C3 81 8E      [10]  987 	jp	00117$
   8DA2 C3 56 8F      [10]  988 	jp	00133$
   8DA5 C3 25 90      [10]  989 	jp	00149$
                            990 ;src/main.c:228: case 0:
   8DA8                     991 00101$:
                            992 ;src/main.c:229: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   8DA8 7B            [ 4]  993 	ld	a,e
   8DA9 C6 05         [ 7]  994 	add	a, #0x05
   8DAB C5            [11]  995 	push	bc
   8DAC D5            [11]  996 	push	de
   8DAD 33            [ 6]  997 	inc	sp
   8DAE F5            [11]  998 	push	af
   8DAF 33            [ 6]  999 	inc	sp
   8DB0 CD FC 89      [17] 1000 	call	_getTilePtr
   8DB3 F1            [10] 1001 	pop	af
   8DB4 C1            [10] 1002 	pop	bc
   8DB5 5E            [ 7] 1003 	ld	e,(hl)
   8DB6 3E 02         [ 7] 1004 	ld	a,#0x02
   8DB8 93            [ 4] 1005 	sub	a, e
   8DB9 DA 76 8E      [10] 1006 	jp	C,00113$
                           1007 ;src/main.c:230: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   8DBC DD 6E F8      [19] 1008 	ld	l,-8 (ix)
   8DBF DD 66 F9      [19] 1009 	ld	h,-7 (ix)
   8DC2 7E            [ 7] 1010 	ld	a,(hl)
   8DC3 C6 0B         [ 7] 1011 	add	a, #0x0B
   8DC5 57            [ 4] 1012 	ld	d,a
   8DC6 0A            [ 7] 1013 	ld	a,(bc)
   8DC7 C6 05         [ 7] 1014 	add	a, #0x05
   8DC9 C5            [11] 1015 	push	bc
   8DCA D5            [11] 1016 	push	de
   8DCB 33            [ 6] 1017 	inc	sp
   8DCC F5            [11] 1018 	push	af
   8DCD 33            [ 6] 1019 	inc	sp
   8DCE CD FC 89      [17] 1020 	call	_getTilePtr
   8DD1 F1            [10] 1021 	pop	af
   8DD2 C1            [10] 1022 	pop	bc
   8DD3 5E            [ 7] 1023 	ld	e,(hl)
   8DD4 3E 02         [ 7] 1024 	ld	a,#0x02
   8DD6 93            [ 4] 1025 	sub	a, e
   8DD7 DA 76 8E      [10] 1026 	jp	C,00113$
                           1027 ;src/main.c:231: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   8DDA DD 6E F8      [19] 1028 	ld	l,-8 (ix)
   8DDD DD 66 F9      [19] 1029 	ld	h,-7 (ix)
   8DE0 7E            [ 7] 1030 	ld	a,(hl)
   8DE1 C6 16         [ 7] 1031 	add	a, #0x16
   8DE3 57            [ 4] 1032 	ld	d,a
   8DE4 0A            [ 7] 1033 	ld	a,(bc)
   8DE5 C6 05         [ 7] 1034 	add	a, #0x05
   8DE7 C5            [11] 1035 	push	bc
   8DE8 D5            [11] 1036 	push	de
   8DE9 33            [ 6] 1037 	inc	sp
   8DEA F5            [11] 1038 	push	af
   8DEB 33            [ 6] 1039 	inc	sp
   8DEC CD FC 89      [17] 1040 	call	_getTilePtr
   8DEF F1            [10] 1041 	pop	af
   8DF0 C1            [10] 1042 	pop	bc
   8DF1 5E            [ 7] 1043 	ld	e,(hl)
   8DF2 3E 02         [ 7] 1044 	ld	a,#0x02
   8DF4 93            [ 4] 1045 	sub	a, e
   8DF5 DA 76 8E      [10] 1046 	jp	C,00113$
                           1047 ;src/main.c:233: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   8DF8 21 E5 88      [10] 1048 	ld	hl, #_cu + 1
   8DFB 5E            [ 7] 1049 	ld	e,(hl)
   8DFC 16 00         [ 7] 1050 	ld	d,#0x00
   8DFE 21 04 00      [10] 1051 	ld	hl,#0x0004
   8E01 19            [11] 1052 	add	hl,de
   8E02 DD 75 FE      [19] 1053 	ld	-2 (ix),l
   8E05 DD 74 FF      [19] 1054 	ld	-1 (ix),h
   8E08 DD 6E F8      [19] 1055 	ld	l,-8 (ix)
   8E0B DD 66 F9      [19] 1056 	ld	h,-7 (ix)
   8E0E 6E            [ 7] 1057 	ld	l,(hl)
   8E0F 26 00         [ 7] 1058 	ld	h,#0x00
   8E11 DD 7E FE      [19] 1059 	ld	a,-2 (ix)
   8E14 95            [ 4] 1060 	sub	a, l
   8E15 DD 7E FF      [19] 1061 	ld	a,-1 (ix)
   8E18 9C            [ 4] 1062 	sbc	a, h
   8E19 E2 1E 8E      [10] 1063 	jp	PO, 00274$
   8E1C EE 80         [ 7] 1064 	xor	a, #0x80
   8E1E                    1065 00274$:
   8E1E FA 33 8E      [10] 1066 	jp	M,00108$
   8E21 D5            [11] 1067 	push	de
   8E22 11 16 00      [10] 1068 	ld	de,#0x0016
   8E25 19            [11] 1069 	add	hl, de
   8E26 D1            [10] 1070 	pop	de
   8E27 7D            [ 4] 1071 	ld	a,l
   8E28 93            [ 4] 1072 	sub	a, e
   8E29 7C            [ 4] 1073 	ld	a,h
   8E2A 9A            [ 4] 1074 	sbc	a, d
   8E2B E2 30 8E      [10] 1075 	jp	PO, 00275$
   8E2E EE 80         [ 7] 1076 	xor	a, #0x80
   8E30                    1077 00275$:
   8E30 F2 3A 8E      [10] 1078 	jp	P,00109$
   8E33                    1079 00108$:
                           1080 ;src/main.c:234: colisiona = 0;
   8E33 DD 36 F7 00   [19] 1081 	ld	-9 (ix),#0x00
   8E37 C3 FF 90      [10] 1082 	jp	00165$
   8E3A                    1083 00109$:
                           1084 ;src/main.c:237: if(cu.x > enemy->x){ //si el cu esta abajo
   8E3A 21 E4 88      [10] 1085 	ld	hl, #_cu + 0
   8E3D 5E            [ 7] 1086 	ld	e,(hl)
   8E3E 0A            [ 7] 1087 	ld	a,(bc)
   8E3F 4F            [ 4] 1088 	ld	c,a
   8E40 93            [ 4] 1089 	sub	a, e
   8E41 30 2C         [12] 1090 	jr	NC,00106$
                           1091 ;src/main.c:238: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
   8E43 6B            [ 4] 1092 	ld	l,e
   8E44 26 00         [ 7] 1093 	ld	h,#0x00
   8E46 06 00         [ 7] 1094 	ld	b,#0x00
   8E48 03            [ 6] 1095 	inc	bc
   8E49 03            [ 6] 1096 	inc	bc
   8E4A 03            [ 6] 1097 	inc	bc
   8E4B 03            [ 6] 1098 	inc	bc
   8E4C BF            [ 4] 1099 	cp	a, a
   8E4D ED 42         [15] 1100 	sbc	hl, bc
   8E4F 3E 01         [ 7] 1101 	ld	a,#0x01
   8E51 BD            [ 4] 1102 	cp	a, l
   8E52 3E 00         [ 7] 1103 	ld	a,#0x00
   8E54 9C            [ 4] 1104 	sbc	a, h
   8E55 E2 5A 8E      [10] 1105 	jp	PO, 00276$
   8E58 EE 80         [ 7] 1106 	xor	a, #0x80
   8E5A                    1107 00276$:
   8E5A F2 64 8E      [10] 1108 	jp	P,00103$
                           1109 ;src/main.c:239: colisiona = 0;
   8E5D DD 36 F7 00   [19] 1110 	ld	-9 (ix),#0x00
   8E61 C3 FF 90      [10] 1111 	jp	00165$
   8E64                    1112 00103$:
                           1113 ;src/main.c:242: enemy->muerto = SI;
   8E64 DD 6E FA      [19] 1114 	ld	l,-6 (ix)
   8E67 DD 66 FB      [19] 1115 	ld	h,-5 (ix)
   8E6A 36 01         [10] 1116 	ld	(hl),#0x01
   8E6C C3 FF 90      [10] 1117 	jp	00165$
   8E6F                    1118 00106$:
                           1119 ;src/main.c:245: colisiona = 0;
   8E6F DD 36 F7 00   [19] 1120 	ld	-9 (ix),#0x00
   8E73 C3 FF 90      [10] 1121 	jp	00165$
   8E76                    1122 00113$:
                           1123 ;src/main.c:249: enemy->mira = M_izquierda;
   8E76 DD 6E FC      [19] 1124 	ld	l,-4 (ix)
   8E79 DD 66 FD      [19] 1125 	ld	h,-3 (ix)
   8E7C 36 01         [10] 1126 	ld	(hl),#0x01
                           1127 ;src/main.c:251: break;
   8E7E C3 FF 90      [10] 1128 	jp	00165$
                           1129 ;src/main.c:252: case 1:
   8E81                    1130 00117$:
                           1131 ;src/main.c:253: if( *getTilePtr(enemy->x - 1, enemy->y) <= 2
   8E81 1D            [ 4] 1132 	dec	e
   8E82 C5            [11] 1133 	push	bc
   8E83 D5            [11] 1134 	push	de
   8E84 CD FC 89      [17] 1135 	call	_getTilePtr
   8E87 F1            [10] 1136 	pop	af
   8E88 C1            [10] 1137 	pop	bc
   8E89 5E            [ 7] 1138 	ld	e,(hl)
   8E8A 3E 02         [ 7] 1139 	ld	a,#0x02
   8E8C 93            [ 4] 1140 	sub	a, e
   8E8D DA 4B 8F      [10] 1141 	jp	C,00129$
                           1142 ;src/main.c:254: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   8E90 DD 6E F8      [19] 1143 	ld	l,-8 (ix)
   8E93 DD 66 F9      [19] 1144 	ld	h,-7 (ix)
   8E96 7E            [ 7] 1145 	ld	a,(hl)
   8E97 C6 0B         [ 7] 1146 	add	a, #0x0B
   8E99 57            [ 4] 1147 	ld	d,a
   8E9A 0A            [ 7] 1148 	ld	a,(bc)
   8E9B C6 FF         [ 7] 1149 	add	a,#0xFF
   8E9D C5            [11] 1150 	push	bc
   8E9E D5            [11] 1151 	push	de
   8E9F 33            [ 6] 1152 	inc	sp
   8EA0 F5            [11] 1153 	push	af
   8EA1 33            [ 6] 1154 	inc	sp
   8EA2 CD FC 89      [17] 1155 	call	_getTilePtr
   8EA5 F1            [10] 1156 	pop	af
   8EA6 C1            [10] 1157 	pop	bc
   8EA7 5E            [ 7] 1158 	ld	e,(hl)
   8EA8 3E 02         [ 7] 1159 	ld	a,#0x02
   8EAA 93            [ 4] 1160 	sub	a, e
   8EAB DA 4B 8F      [10] 1161 	jp	C,00129$
                           1162 ;src/main.c:255: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   8EAE DD 6E F8      [19] 1163 	ld	l,-8 (ix)
   8EB1 DD 66 F9      [19] 1164 	ld	h,-7 (ix)
   8EB4 7E            [ 7] 1165 	ld	a,(hl)
   8EB5 C6 16         [ 7] 1166 	add	a, #0x16
   8EB7 57            [ 4] 1167 	ld	d,a
   8EB8 0A            [ 7] 1168 	ld	a,(bc)
   8EB9 C6 FF         [ 7] 1169 	add	a,#0xFF
   8EBB C5            [11] 1170 	push	bc
   8EBC D5            [11] 1171 	push	de
   8EBD 33            [ 6] 1172 	inc	sp
   8EBE F5            [11] 1173 	push	af
   8EBF 33            [ 6] 1174 	inc	sp
   8EC0 CD FC 89      [17] 1175 	call	_getTilePtr
   8EC3 F1            [10] 1176 	pop	af
   8EC4 C1            [10] 1177 	pop	bc
   8EC5 5E            [ 7] 1178 	ld	e,(hl)
   8EC6 3E 02         [ 7] 1179 	ld	a,#0x02
   8EC8 93            [ 4] 1180 	sub	a, e
   8EC9 DA 4B 8F      [10] 1181 	jp	C,00129$
                           1182 ;src/main.c:257: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   8ECC 21 E5 88      [10] 1183 	ld	hl, #_cu + 1
   8ECF 5E            [ 7] 1184 	ld	e,(hl)
   8ED0 16 00         [ 7] 1185 	ld	d,#0x00
   8ED2 21 04 00      [10] 1186 	ld	hl,#0x0004
   8ED5 19            [11] 1187 	add	hl,de
   8ED6 DD 75 FE      [19] 1188 	ld	-2 (ix),l
   8ED9 DD 74 FF      [19] 1189 	ld	-1 (ix),h
   8EDC DD 6E F8      [19] 1190 	ld	l,-8 (ix)
   8EDF DD 66 F9      [19] 1191 	ld	h,-7 (ix)
   8EE2 6E            [ 7] 1192 	ld	l,(hl)
   8EE3 26 00         [ 7] 1193 	ld	h,#0x00
   8EE5 DD 7E FE      [19] 1194 	ld	a,-2 (ix)
   8EE8 95            [ 4] 1195 	sub	a, l
   8EE9 DD 7E FF      [19] 1196 	ld	a,-1 (ix)
   8EEC 9C            [ 4] 1197 	sbc	a, h
   8EED E2 F2 8E      [10] 1198 	jp	PO, 00277$
   8EF0 EE 80         [ 7] 1199 	xor	a, #0x80
   8EF2                    1200 00277$:
   8EF2 FA 07 8F      [10] 1201 	jp	M,00124$
   8EF5 D5            [11] 1202 	push	de
   8EF6 11 16 00      [10] 1203 	ld	de,#0x0016
   8EF9 19            [11] 1204 	add	hl, de
   8EFA D1            [10] 1205 	pop	de
   8EFB 7D            [ 4] 1206 	ld	a,l
   8EFC 93            [ 4] 1207 	sub	a, e
   8EFD 7C            [ 4] 1208 	ld	a,h
   8EFE 9A            [ 4] 1209 	sbc	a, d
   8EFF E2 04 8F      [10] 1210 	jp	PO, 00278$
   8F02 EE 80         [ 7] 1211 	xor	a, #0x80
   8F04                    1212 00278$:
   8F04 F2 0E 8F      [10] 1213 	jp	P,00125$
   8F07                    1214 00124$:
                           1215 ;src/main.c:258: colisiona = 0;
   8F07 DD 36 F7 00   [19] 1216 	ld	-9 (ix),#0x00
   8F0B C3 FF 90      [10] 1217 	jp	00165$
   8F0E                    1218 00125$:
                           1219 ;src/main.c:261: if(enemy->x > cu.x){ //si el cu esta abajo
   8F0E 0A            [ 7] 1220 	ld	a,(bc)
   8F0F 5F            [ 4] 1221 	ld	e,a
   8F10 21 E4 88      [10] 1222 	ld	hl, #_cu + 0
   8F13 4E            [ 7] 1223 	ld	c,(hl)
   8F14 79            [ 4] 1224 	ld	a,c
   8F15 93            [ 4] 1225 	sub	a, e
   8F16 30 2C         [12] 1226 	jr	NC,00122$
                           1227 ;src/main.c:262: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
   8F18 6B            [ 4] 1228 	ld	l,e
   8F19 26 00         [ 7] 1229 	ld	h,#0x00
   8F1B 06 00         [ 7] 1230 	ld	b,#0x00
   8F1D 03            [ 6] 1231 	inc	bc
   8F1E 03            [ 6] 1232 	inc	bc
   8F1F 03            [ 6] 1233 	inc	bc
   8F20 03            [ 6] 1234 	inc	bc
   8F21 BF            [ 4] 1235 	cp	a, a
   8F22 ED 42         [15] 1236 	sbc	hl, bc
   8F24 3E 01         [ 7] 1237 	ld	a,#0x01
   8F26 BD            [ 4] 1238 	cp	a, l
   8F27 3E 00         [ 7] 1239 	ld	a,#0x00
   8F29 9C            [ 4] 1240 	sbc	a, h
   8F2A E2 2F 8F      [10] 1241 	jp	PO, 00279$
   8F2D EE 80         [ 7] 1242 	xor	a, #0x80
   8F2F                    1243 00279$:
   8F2F F2 39 8F      [10] 1244 	jp	P,00119$
                           1245 ;src/main.c:263: colisiona = 0;
   8F32 DD 36 F7 00   [19] 1246 	ld	-9 (ix),#0x00
   8F36 C3 FF 90      [10] 1247 	jp	00165$
   8F39                    1248 00119$:
                           1249 ;src/main.c:266: enemy->muerto = SI;
   8F39 DD 6E FA      [19] 1250 	ld	l,-6 (ix)
   8F3C DD 66 FB      [19] 1251 	ld	h,-5 (ix)
   8F3F 36 01         [10] 1252 	ld	(hl),#0x01
   8F41 C3 FF 90      [10] 1253 	jp	00165$
   8F44                    1254 00122$:
                           1255 ;src/main.c:269: colisiona = 0;
   8F44 DD 36 F7 00   [19] 1256 	ld	-9 (ix),#0x00
   8F48 C3 FF 90      [10] 1257 	jp	00165$
   8F4B                    1258 00129$:
                           1259 ;src/main.c:273: enemy->mira = M_derecha;
   8F4B DD 6E FC      [19] 1260 	ld	l,-4 (ix)
   8F4E DD 66 FD      [19] 1261 	ld	h,-3 (ix)
   8F51 36 00         [10] 1262 	ld	(hl),#0x00
                           1263 ;src/main.c:275: break;
   8F53 C3 FF 90      [10] 1264 	jp	00165$
                           1265 ;src/main.c:276: case 2:
   8F56                    1266 00133$:
                           1267 ;src/main.c:277: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   8F56 15            [ 4] 1268 	dec	d
   8F57 15            [ 4] 1269 	dec	d
   8F58 C5            [11] 1270 	push	bc
   8F59 D5            [11] 1271 	push	de
   8F5A CD FC 89      [17] 1272 	call	_getTilePtr
   8F5D F1            [10] 1273 	pop	af
   8F5E C1            [10] 1274 	pop	bc
   8F5F 5E            [ 7] 1275 	ld	e,(hl)
   8F60 3E 02         [ 7] 1276 	ld	a,#0x02
   8F62 93            [ 4] 1277 	sub	a, e
   8F63 DA 1D 90      [10] 1278 	jp	C,00145$
                           1279 ;src/main.c:278: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   8F66 DD 6E F8      [19] 1280 	ld	l,-8 (ix)
   8F69 DD 66 F9      [19] 1281 	ld	h,-7 (ix)
   8F6C 56            [ 7] 1282 	ld	d,(hl)
   8F6D 15            [ 4] 1283 	dec	d
   8F6E 15            [ 4] 1284 	dec	d
   8F6F 0A            [ 7] 1285 	ld	a,(bc)
   8F70 C6 02         [ 7] 1286 	add	a, #0x02
   8F72 C5            [11] 1287 	push	bc
   8F73 D5            [11] 1288 	push	de
   8F74 33            [ 6] 1289 	inc	sp
   8F75 F5            [11] 1290 	push	af
   8F76 33            [ 6] 1291 	inc	sp
   8F77 CD FC 89      [17] 1292 	call	_getTilePtr
   8F7A F1            [10] 1293 	pop	af
   8F7B C1            [10] 1294 	pop	bc
   8F7C 5E            [ 7] 1295 	ld	e,(hl)
   8F7D 3E 02         [ 7] 1296 	ld	a,#0x02
   8F7F 93            [ 4] 1297 	sub	a, e
   8F80 DA 1D 90      [10] 1298 	jp	C,00145$
                           1299 ;src/main.c:279: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   8F83 DD 6E F8      [19] 1300 	ld	l,-8 (ix)
   8F86 DD 66 F9      [19] 1301 	ld	h,-7 (ix)
   8F89 56            [ 7] 1302 	ld	d,(hl)
   8F8A 15            [ 4] 1303 	dec	d
   8F8B 15            [ 4] 1304 	dec	d
   8F8C 0A            [ 7] 1305 	ld	a,(bc)
   8F8D C6 04         [ 7] 1306 	add	a, #0x04
   8F8F C5            [11] 1307 	push	bc
   8F90 D5            [11] 1308 	push	de
   8F91 33            [ 6] 1309 	inc	sp
   8F92 F5            [11] 1310 	push	af
   8F93 33            [ 6] 1311 	inc	sp
   8F94 CD FC 89      [17] 1312 	call	_getTilePtr
   8F97 F1            [10] 1313 	pop	af
   8F98 C1            [10] 1314 	pop	bc
   8F99 5E            [ 7] 1315 	ld	e,(hl)
   8F9A 3E 02         [ 7] 1316 	ld	a,#0x02
   8F9C 93            [ 4] 1317 	sub	a, e
   8F9D DA 1D 90      [10] 1318 	jp	C,00145$
                           1319 ;src/main.c:281: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   8FA0 21 E4 88      [10] 1320 	ld	hl, #_cu + 0
   8FA3 5E            [ 7] 1321 	ld	e,(hl)
   8FA4 16 00         [ 7] 1322 	ld	d,#0x00
   8FA6 21 02 00      [10] 1323 	ld	hl,#0x0002
   8FA9 19            [11] 1324 	add	hl,de
   8FAA DD 75 FE      [19] 1325 	ld	-2 (ix),l
   8FAD DD 74 FF      [19] 1326 	ld	-1 (ix),h
   8FB0 0A            [ 7] 1327 	ld	a,(bc)
   8FB1 6F            [ 4] 1328 	ld	l,a
   8FB2 26 00         [ 7] 1329 	ld	h,#0x00
   8FB4 DD 7E FE      [19] 1330 	ld	a,-2 (ix)
   8FB7 95            [ 4] 1331 	sub	a, l
   8FB8 DD 7E FF      [19] 1332 	ld	a,-1 (ix)
   8FBB 9C            [ 4] 1333 	sbc	a, h
   8FBC E2 C1 8F      [10] 1334 	jp	PO, 00280$
   8FBF EE 80         [ 7] 1335 	xor	a, #0x80
   8FC1                    1336 00280$:
   8FC1 FA D4 8F      [10] 1337 	jp	M,00140$
   8FC4 23            [ 6] 1338 	inc	hl
   8FC5 23            [ 6] 1339 	inc	hl
   8FC6 23            [ 6] 1340 	inc	hl
   8FC7 23            [ 6] 1341 	inc	hl
   8FC8 7D            [ 4] 1342 	ld	a,l
   8FC9 93            [ 4] 1343 	sub	a, e
   8FCA 7C            [ 4] 1344 	ld	a,h
   8FCB 9A            [ 4] 1345 	sbc	a, d
   8FCC E2 D1 8F      [10] 1346 	jp	PO, 00281$
   8FCF EE 80         [ 7] 1347 	xor	a, #0x80
   8FD1                    1348 00281$:
   8FD1 F2 DA 8F      [10] 1349 	jp	P,00141$
   8FD4                    1350 00140$:
                           1351 ;src/main.c:283: colisiona = 0;
   8FD4 DD 36 F7 00   [19] 1352 	ld	-9 (ix),#0x00
   8FD8 18 4B         [12] 1353 	jr	00149$
   8FDA                    1354 00141$:
                           1355 ;src/main.c:286: if(enemy->y>cu.y){
   8FDA DD 6E F8      [19] 1356 	ld	l,-8 (ix)
   8FDD DD 66 F9      [19] 1357 	ld	h,-7 (ix)
   8FE0 5E            [ 7] 1358 	ld	e,(hl)
   8FE1 21 E5 88      [10] 1359 	ld	hl, #(_cu + 0x0001) + 0
   8FE4 6E            [ 7] 1360 	ld	l,(hl)
   8FE5 7D            [ 4] 1361 	ld	a,l
   8FE6 93            [ 4] 1362 	sub	a, e
   8FE7 30 2E         [12] 1363 	jr	NC,00138$
                           1364 ;src/main.c:287: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   8FE9 16 00         [ 7] 1365 	ld	d,#0x00
   8FEB 26 00         [ 7] 1366 	ld	h,#0x00
   8FED D5            [11] 1367 	push	de
   8FEE 11 08 00      [10] 1368 	ld	de,#0x0008
   8FF1 19            [11] 1369 	add	hl, de
   8FF2 D1            [10] 1370 	pop	de
   8FF3 7B            [ 4] 1371 	ld	a,e
   8FF4 95            [ 4] 1372 	sub	a, l
   8FF5 5F            [ 4] 1373 	ld	e,a
   8FF6 7A            [ 4] 1374 	ld	a,d
   8FF7 9C            [ 4] 1375 	sbc	a, h
   8FF8 57            [ 4] 1376 	ld	d,a
   8FF9 3E 02         [ 7] 1377 	ld	a,#0x02
   8FFB BB            [ 4] 1378 	cp	a, e
   8FFC 3E 00         [ 7] 1379 	ld	a,#0x00
   8FFE 9A            [ 4] 1380 	sbc	a, d
   8FFF E2 04 90      [10] 1381 	jp	PO, 00282$
   9002 EE 80         [ 7] 1382 	xor	a, #0x80
   9004                    1383 00282$:
   9004 F2 0D 90      [10] 1384 	jp	P,00135$
                           1385 ;src/main.c:288: colisiona = 0;
   9007 DD 36 F7 00   [19] 1386 	ld	-9 (ix),#0x00
   900B 18 18         [12] 1387 	jr	00149$
   900D                    1388 00135$:
                           1389 ;src/main.c:291: enemy->muerto = SI;
   900D DD 6E FA      [19] 1390 	ld	l,-6 (ix)
   9010 DD 66 FB      [19] 1391 	ld	h,-5 (ix)
   9013 36 01         [10] 1392 	ld	(hl),#0x01
   9015 18 0E         [12] 1393 	jr	00149$
   9017                    1394 00138$:
                           1395 ;src/main.c:295: colisiona = 0;
   9017 DD 36 F7 00   [19] 1396 	ld	-9 (ix),#0x00
   901B 18 08         [12] 1397 	jr	00149$
   901D                    1398 00145$:
                           1399 ;src/main.c:301: enemy->mira = M_abajo;
   901D DD 6E FC      [19] 1400 	ld	l,-4 (ix)
   9020 DD 66 FD      [19] 1401 	ld	h,-3 (ix)
   9023 36 03         [10] 1402 	ld	(hl),#0x03
                           1403 ;src/main.c:304: case 3:
   9025                    1404 00149$:
                           1405 ;src/main.c:307: if( *getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   9025 DD 6E F8      [19] 1406 	ld	l,-8 (ix)
   9028 DD 66 F9      [19] 1407 	ld	h,-7 (ix)
   902B 7E            [ 7] 1408 	ld	a,(hl)
   902C C6 18         [ 7] 1409 	add	a, #0x18
   902E 57            [ 4] 1410 	ld	d,a
   902F 0A            [ 7] 1411 	ld	a,(bc)
   9030 C5            [11] 1412 	push	bc
   9031 D5            [11] 1413 	push	de
   9032 33            [ 6] 1414 	inc	sp
   9033 F5            [11] 1415 	push	af
   9034 33            [ 6] 1416 	inc	sp
   9035 CD FC 89      [17] 1417 	call	_getTilePtr
   9038 F1            [10] 1418 	pop	af
   9039 C1            [10] 1419 	pop	bc
   903A 5E            [ 7] 1420 	ld	e,(hl)
   903B 3E 02         [ 7] 1421 	ld	a,#0x02
   903D 93            [ 4] 1422 	sub	a, e
   903E DA F7 90      [10] 1423 	jp	C,00161$
                           1424 ;src/main.c:308: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   9041 DD 6E F8      [19] 1425 	ld	l,-8 (ix)
   9044 DD 66 F9      [19] 1426 	ld	h,-7 (ix)
   9047 7E            [ 7] 1427 	ld	a,(hl)
   9048 C6 18         [ 7] 1428 	add	a, #0x18
   904A 57            [ 4] 1429 	ld	d,a
   904B 0A            [ 7] 1430 	ld	a,(bc)
   904C C6 02         [ 7] 1431 	add	a, #0x02
   904E C5            [11] 1432 	push	bc
   904F D5            [11] 1433 	push	de
   9050 33            [ 6] 1434 	inc	sp
   9051 F5            [11] 1435 	push	af
   9052 33            [ 6] 1436 	inc	sp
   9053 CD FC 89      [17] 1437 	call	_getTilePtr
   9056 F1            [10] 1438 	pop	af
   9057 C1            [10] 1439 	pop	bc
   9058 5E            [ 7] 1440 	ld	e,(hl)
   9059 3E 02         [ 7] 1441 	ld	a,#0x02
   905B 93            [ 4] 1442 	sub	a, e
   905C DA F7 90      [10] 1443 	jp	C,00161$
                           1444 ;src/main.c:309: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   905F DD 6E F8      [19] 1445 	ld	l,-8 (ix)
   9062 DD 66 F9      [19] 1446 	ld	h,-7 (ix)
   9065 7E            [ 7] 1447 	ld	a,(hl)
   9066 C6 18         [ 7] 1448 	add	a, #0x18
   9068 57            [ 4] 1449 	ld	d,a
   9069 0A            [ 7] 1450 	ld	a,(bc)
   906A C6 04         [ 7] 1451 	add	a, #0x04
   906C C5            [11] 1452 	push	bc
   906D D5            [11] 1453 	push	de
   906E 33            [ 6] 1454 	inc	sp
   906F F5            [11] 1455 	push	af
   9070 33            [ 6] 1456 	inc	sp
   9071 CD FC 89      [17] 1457 	call	_getTilePtr
   9074 F1            [10] 1458 	pop	af
   9075 C1            [10] 1459 	pop	bc
   9076 5E            [ 7] 1460 	ld	e,(hl)
   9077 3E 02         [ 7] 1461 	ld	a,#0x02
   9079 93            [ 4] 1462 	sub	a, e
   907A 38 7B         [12] 1463 	jr	C,00161$
                           1464 ;src/main.c:311: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   907C 21 E4 88      [10] 1465 	ld	hl, #_cu + 0
   907F 5E            [ 7] 1466 	ld	e,(hl)
   9080 16 00         [ 7] 1467 	ld	d,#0x00
   9082 21 02 00      [10] 1468 	ld	hl,#0x0002
   9085 19            [11] 1469 	add	hl,de
   9086 DD 75 FE      [19] 1470 	ld	-2 (ix),l
   9089 DD 74 FF      [19] 1471 	ld	-1 (ix),h
   908C 0A            [ 7] 1472 	ld	a,(bc)
   908D 4F            [ 4] 1473 	ld	c,a
   908E 06 00         [ 7] 1474 	ld	b,#0x00
   9090 DD 7E FE      [19] 1475 	ld	a,-2 (ix)
   9093 91            [ 4] 1476 	sub	a, c
   9094 DD 7E FF      [19] 1477 	ld	a,-1 (ix)
   9097 98            [ 4] 1478 	sbc	a, b
   9098 E2 9D 90      [10] 1479 	jp	PO, 00283$
   909B EE 80         [ 7] 1480 	xor	a, #0x80
   909D                    1481 00283$:
   909D FA B0 90      [10] 1482 	jp	M,00156$
   90A0 03            [ 6] 1483 	inc	bc
   90A1 03            [ 6] 1484 	inc	bc
   90A2 03            [ 6] 1485 	inc	bc
   90A3 03            [ 6] 1486 	inc	bc
   90A4 79            [ 4] 1487 	ld	a,c
   90A5 93            [ 4] 1488 	sub	a, e
   90A6 78            [ 4] 1489 	ld	a,b
   90A7 9A            [ 4] 1490 	sbc	a, d
   90A8 E2 AD 90      [10] 1491 	jp	PO, 00284$
   90AB EE 80         [ 7] 1492 	xor	a, #0x80
   90AD                    1493 00284$:
   90AD F2 B6 90      [10] 1494 	jp	P,00157$
   90B0                    1495 00156$:
                           1496 ;src/main.c:312: colisiona = 0;
   90B0 DD 36 F7 00   [19] 1497 	ld	-9 (ix),#0x00
   90B4 18 49         [12] 1498 	jr	00165$
   90B6                    1499 00157$:
                           1500 ;src/main.c:315: if(cu.y > enemy->y){ //si el cu esta abajo
   90B6 21 E5 88      [10] 1501 	ld	hl, #(_cu + 0x0001) + 0
   90B9 4E            [ 7] 1502 	ld	c,(hl)
   90BA DD 6E F8      [19] 1503 	ld	l,-8 (ix)
   90BD DD 66 F9      [19] 1504 	ld	h,-7 (ix)
   90C0 5E            [ 7] 1505 	ld	e,(hl)
   90C1 7B            [ 4] 1506 	ld	a,e
   90C2 91            [ 4] 1507 	sub	a, c
   90C3 30 2C         [12] 1508 	jr	NC,00154$
                           1509 ;src/main.c:316: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   90C5 06 00         [ 7] 1510 	ld	b,#0x00
   90C7 16 00         [ 7] 1511 	ld	d,#0x00
   90C9 21 16 00      [10] 1512 	ld	hl,#0x0016
   90CC 19            [11] 1513 	add	hl,de
   90CD 79            [ 4] 1514 	ld	a,c
   90CE 95            [ 4] 1515 	sub	a, l
   90CF 4F            [ 4] 1516 	ld	c,a
   90D0 78            [ 4] 1517 	ld	a,b
   90D1 9C            [ 4] 1518 	sbc	a, h
   90D2 47            [ 4] 1519 	ld	b,a
   90D3 3E 02         [ 7] 1520 	ld	a,#0x02
   90D5 B9            [ 4] 1521 	cp	a, c
   90D6 3E 00         [ 7] 1522 	ld	a,#0x00
   90D8 98            [ 4] 1523 	sbc	a, b
   90D9 E2 DE 90      [10] 1524 	jp	PO, 00285$
   90DC EE 80         [ 7] 1525 	xor	a, #0x80
   90DE                    1526 00285$:
   90DE F2 E7 90      [10] 1527 	jp	P,00151$
                           1528 ;src/main.c:317: colisiona = 0;
   90E1 DD 36 F7 00   [19] 1529 	ld	-9 (ix),#0x00
   90E5 18 18         [12] 1530 	jr	00165$
   90E7                    1531 00151$:
                           1532 ;src/main.c:320: enemy->muerto = SI;
   90E7 DD 6E FA      [19] 1533 	ld	l,-6 (ix)
   90EA DD 66 FB      [19] 1534 	ld	h,-5 (ix)
   90ED 36 01         [10] 1535 	ld	(hl),#0x01
   90EF 18 0E         [12] 1536 	jr	00165$
   90F1                    1537 00154$:
                           1538 ;src/main.c:324: colisiona = 0;
   90F1 DD 36 F7 00   [19] 1539 	ld	-9 (ix),#0x00
   90F5 18 08         [12] 1540 	jr	00165$
   90F7                    1541 00161$:
                           1542 ;src/main.c:328: enemy->mira = M_arriba;
   90F7 DD 6E FC      [19] 1543 	ld	l,-4 (ix)
   90FA DD 66 FD      [19] 1544 	ld	h,-3 (ix)
   90FD 36 02         [10] 1545 	ld	(hl),#0x02
                           1546 ;src/main.c:331: }
   90FF                    1547 00165$:
                           1548 ;src/main.c:332: return colisiona;
   90FF DD 6E F7      [19] 1549 	ld	l,-9 (ix)
   9102 DD F9         [10] 1550 	ld	sp, ix
   9104 DD E1         [14] 1551 	pop	ix
   9106 C9            [10] 1552 	ret
                           1553 ;src/main.c:335: void moverEnemigoArriba(TEnemy *enemy){
                           1554 ;	---------------------------------
                           1555 ; Function moverEnemigoArriba
                           1556 ; ---------------------------------
   9107                    1557 _moverEnemigoArriba::
   9107 DD E5         [15] 1558 	push	ix
   9109 DD 21 00 00   [14] 1559 	ld	ix,#0
   910D DD 39         [15] 1560 	add	ix,sp
                           1561 ;src/main.c:336: enemy->y--;
   910F DD 4E 04      [19] 1562 	ld	c,4 (ix)
   9112 DD 46 05      [19] 1563 	ld	b,5 (ix)
   9115 69            [ 4] 1564 	ld	l, c
   9116 60            [ 4] 1565 	ld	h, b
   9117 23            [ 6] 1566 	inc	hl
   9118 5E            [ 7] 1567 	ld	e,(hl)
   9119 1D            [ 4] 1568 	dec	e
   911A 73            [ 7] 1569 	ld	(hl),e
                           1570 ;src/main.c:337: enemy->y--;
   911B 1D            [ 4] 1571 	dec	e
   911C 73            [ 7] 1572 	ld	(hl),e
                           1573 ;src/main.c:338: enemy->mover = SI;
   911D 21 06 00      [10] 1574 	ld	hl,#0x0006
   9120 09            [11] 1575 	add	hl,bc
   9121 36 01         [10] 1576 	ld	(hl),#0x01
   9123 DD E1         [14] 1577 	pop	ix
   9125 C9            [10] 1578 	ret
                           1579 ;src/main.c:341: void moverEnemigoAbajo(TEnemy *enemy){
                           1580 ;	---------------------------------
                           1581 ; Function moverEnemigoAbajo
                           1582 ; ---------------------------------
   9126                    1583 _moverEnemigoAbajo::
   9126 DD E5         [15] 1584 	push	ix
   9128 DD 21 00 00   [14] 1585 	ld	ix,#0
   912C DD 39         [15] 1586 	add	ix,sp
                           1587 ;src/main.c:342: enemy->y++;
   912E DD 4E 04      [19] 1588 	ld	c,4 (ix)
   9131 DD 46 05      [19] 1589 	ld	b,5 (ix)
   9134 59            [ 4] 1590 	ld	e, c
   9135 50            [ 4] 1591 	ld	d, b
   9136 13            [ 6] 1592 	inc	de
   9137 1A            [ 7] 1593 	ld	a,(de)
   9138 3C            [ 4] 1594 	inc	a
   9139 12            [ 7] 1595 	ld	(de),a
                           1596 ;src/main.c:343: enemy->y++;
   913A 3C            [ 4] 1597 	inc	a
   913B 12            [ 7] 1598 	ld	(de),a
                           1599 ;src/main.c:344: enemy->mover = SI;
   913C 21 06 00      [10] 1600 	ld	hl,#0x0006
   913F 09            [11] 1601 	add	hl,bc
   9140 36 01         [10] 1602 	ld	(hl),#0x01
   9142 DD E1         [14] 1603 	pop	ix
   9144 C9            [10] 1604 	ret
                           1605 ;src/main.c:347: void moverEnemigoDerecha(TEnemy *enemy){
                           1606 ;	---------------------------------
                           1607 ; Function moverEnemigoDerecha
                           1608 ; ---------------------------------
   9145                    1609 _moverEnemigoDerecha::
                           1610 ;src/main.c:348: enemy->x++;
   9145 D1            [10] 1611 	pop	de
   9146 C1            [10] 1612 	pop	bc
   9147 C5            [11] 1613 	push	bc
   9148 D5            [11] 1614 	push	de
   9149 0A            [ 7] 1615 	ld	a,(bc)
   914A 3C            [ 4] 1616 	inc	a
   914B 02            [ 7] 1617 	ld	(bc),a
                           1618 ;src/main.c:349: enemy->x++;
   914C 3C            [ 4] 1619 	inc	a
   914D 02            [ 7] 1620 	ld	(bc),a
                           1621 ;src/main.c:350: enemy->mover = SI;
   914E 21 06 00      [10] 1622 	ld	hl,#0x0006
   9151 09            [11] 1623 	add	hl,bc
   9152 36 01         [10] 1624 	ld	(hl),#0x01
   9154 C9            [10] 1625 	ret
                           1626 ;src/main.c:353: void moverEnemigoIzquierda(TEnemy *enemy){
                           1627 ;	---------------------------------
                           1628 ; Function moverEnemigoIzquierda
                           1629 ; ---------------------------------
   9155                    1630 _moverEnemigoIzquierda::
                           1631 ;src/main.c:354: enemy->x--;
   9155 D1            [10] 1632 	pop	de
   9156 C1            [10] 1633 	pop	bc
   9157 C5            [11] 1634 	push	bc
   9158 D5            [11] 1635 	push	de
   9159 0A            [ 7] 1636 	ld	a,(bc)
   915A C6 FF         [ 7] 1637 	add	a,#0xFF
   915C 02            [ 7] 1638 	ld	(bc),a
                           1639 ;src/main.c:355: enemy->x--;
   915D C6 FF         [ 7] 1640 	add	a,#0xFF
   915F 02            [ 7] 1641 	ld	(bc),a
                           1642 ;src/main.c:356: enemy->mover = SI;
   9160 21 06 00      [10] 1643 	ld	hl,#0x0006
   9163 09            [11] 1644 	add	hl,bc
   9164 36 01         [10] 1645 	ld	(hl),#0x01
   9166 C9            [10] 1646 	ret
                           1647 ;src/main.c:359: void moverEnemigo(TEnemy *enemy){
                           1648 ;	---------------------------------
                           1649 ; Function moverEnemigo
                           1650 ; ---------------------------------
   9167                    1651 _moverEnemigo::
   9167 DD E5         [15] 1652 	push	ix
   9169 DD 21 00 00   [14] 1653 	ld	ix,#0
   916D DD 39         [15] 1654 	add	ix,sp
                           1655 ;src/main.c:360: if(!enemy->muerto){
   916F DD 4E 04      [19] 1656 	ld	c,4 (ix)
   9172 DD 46 05      [19] 1657 	ld	b,5 (ix)
   9175 C5            [11] 1658 	push	bc
   9176 FD E1         [14] 1659 	pop	iy
   9178 FD 7E 08      [19] 1660 	ld	a,8 (iy)
   917B B7            [ 4] 1661 	or	a, a
   917C 20 46         [12] 1662 	jr	NZ,00110$
                           1663 ;src/main.c:361: if(!checkEnemyCollision(enemy->mira, enemy)){
   917E 21 07 00      [10] 1664 	ld	hl,#0x0007
   9181 09            [11] 1665 	add	hl,bc
   9182 5E            [ 7] 1666 	ld	e,(hl)
   9183 16 00         [ 7] 1667 	ld	d,#0x00
   9185 E5            [11] 1668 	push	hl
   9186 C5            [11] 1669 	push	bc
   9187 C5            [11] 1670 	push	bc
   9188 D5            [11] 1671 	push	de
   9189 CD 37 8D      [17] 1672 	call	_checkEnemyCollision
   918C F1            [10] 1673 	pop	af
   918D F1            [10] 1674 	pop	af
   918E 7D            [ 4] 1675 	ld	a,l
   918F C1            [10] 1676 	pop	bc
   9190 E1            [10] 1677 	pop	hl
   9191 B7            [ 4] 1678 	or	a, a
   9192 20 30         [12] 1679 	jr	NZ,00110$
                           1680 ;src/main.c:363: switch (enemy->mira) {
   9194 5E            [ 7] 1681 	ld	e,(hl)
   9195 3E 03         [ 7] 1682 	ld	a,#0x03
   9197 93            [ 4] 1683 	sub	a, e
   9198 38 2A         [12] 1684 	jr	C,00110$
   919A 16 00         [ 7] 1685 	ld	d,#0x00
   919C 21 A2 91      [10] 1686 	ld	hl,#00124$
   919F 19            [11] 1687 	add	hl,de
   91A0 19            [11] 1688 	add	hl,de
                           1689 ;src/main.c:365: case 0:
   91A1 E9            [ 4] 1690 	jp	(hl)
   91A2                    1691 00124$:
   91A2 18 06         [12] 1692 	jr	00101$
   91A4 18 0B         [12] 1693 	jr	00102$
   91A6 18 10         [12] 1694 	jr	00103$
   91A8 18 15         [12] 1695 	jr	00104$
   91AA                    1696 00101$:
                           1697 ;src/main.c:366: moverEnemigoDerecha(enemy);
   91AA C5            [11] 1698 	push	bc
   91AB CD 45 91      [17] 1699 	call	_moverEnemigoDerecha
   91AE F1            [10] 1700 	pop	af
                           1701 ;src/main.c:367: break;
   91AF 18 13         [12] 1702 	jr	00110$
                           1703 ;src/main.c:368: case 1:
   91B1                    1704 00102$:
                           1705 ;src/main.c:369: moverEnemigoIzquierda(enemy);
   91B1 C5            [11] 1706 	push	bc
   91B2 CD 55 91      [17] 1707 	call	_moverEnemigoIzquierda
   91B5 F1            [10] 1708 	pop	af
                           1709 ;src/main.c:370: break;
   91B6 18 0C         [12] 1710 	jr	00110$
                           1711 ;src/main.c:371: case 2:
   91B8                    1712 00103$:
                           1713 ;src/main.c:372: moverEnemigoArriba(enemy);
   91B8 C5            [11] 1714 	push	bc
   91B9 CD 07 91      [17] 1715 	call	_moverEnemigoArriba
   91BC F1            [10] 1716 	pop	af
                           1717 ;src/main.c:373: break;
   91BD 18 05         [12] 1718 	jr	00110$
                           1719 ;src/main.c:374: case 3:
   91BF                    1720 00104$:
                           1721 ;src/main.c:375: moverEnemigoAbajo(enemy);
   91BF C5            [11] 1722 	push	bc
   91C0 CD 26 91      [17] 1723 	call	_moverEnemigoAbajo
   91C3 F1            [10] 1724 	pop	af
                           1725 ;src/main.c:377: }
   91C4                    1726 00110$:
   91C4 DD E1         [14] 1727 	pop	ix
   91C6 C9            [10] 1728 	ret
                           1729 ;src/main.c:382: void avanzarMapa() {
                           1730 ;	---------------------------------
                           1731 ; Function avanzarMapa
                           1732 ; ---------------------------------
   91C7                    1733 _avanzarMapa::
                           1734 ;src/main.c:383: if(num_mapa < NUM_MAPAS -1) {
   91C7 3A F0 88      [13] 1735 	ld	a,(#_num_mapa + 0)
   91CA D6 02         [ 7] 1736 	sub	a, #0x02
   91CC D2 B1 89      [10] 1737 	jp	NC,_menuFin
                           1738 ;src/main.c:384: mapa = mapas[++num_mapa];
   91CF 21 F0 88      [10] 1739 	ld	hl, #_num_mapa+0
   91D2 34            [11] 1740 	inc	(hl)
   91D3 FD 21 F0 88   [14] 1741 	ld	iy,#_num_mapa
   91D7 FD 6E 00      [19] 1742 	ld	l,0 (iy)
   91DA 26 00         [ 7] 1743 	ld	h,#0x00
   91DC 29            [11] 1744 	add	hl, hl
   91DD 11 07 89      [10] 1745 	ld	de,#_mapas
   91E0 19            [11] 1746 	add	hl,de
   91E1 7E            [ 7] 1747 	ld	a,(hl)
   91E2 FD 21 EE 88   [14] 1748 	ld	iy,#_mapa
   91E6 FD 77 00      [19] 1749 	ld	0 (iy),a
   91E9 23            [ 6] 1750 	inc	hl
   91EA 7E            [ 7] 1751 	ld	a,(hl)
   91EB 32 EF 88      [13] 1752 	ld	(#_mapa + 1),a
                           1753 ;src/main.c:385: prota.x = prota.px = 2;
   91EE 21 DE 88      [10] 1754 	ld	hl,#(_prota + 0x0002)
   91F1 36 02         [10] 1755 	ld	(hl),#0x02
   91F3 21 DC 88      [10] 1756 	ld	hl,#_prota
   91F6 36 02         [10] 1757 	ld	(hl),#0x02
                           1758 ;src/main.c:386: prota.mover = SI;
   91F8 21 E2 88      [10] 1759 	ld	hl,#(_prota + 0x0006)
   91FB 36 01         [10] 1760 	ld	(hl),#0x01
                           1761 ;src/main.c:387: dibujarMapa();
   91FD CD F1 88      [17] 1762 	call	_dibujarMapa
                           1763 ;src/main.c:388: inicializarEnemy();
   9200 C3 E7 97      [10] 1764 	jp  _inicializarEnemy
                           1765 ;src/main.c:392: menuFin();
   9203 C3 B1 89      [10] 1766 	jp  _menuFin
                           1767 ;src/main.c:396: void moverIzquierda() {
                           1768 ;	---------------------------------
                           1769 ; Function moverIzquierda
                           1770 ; ---------------------------------
   9206                    1771 _moverIzquierda::
                           1772 ;src/main.c:397: prota.mira = M_izquierda;
   9206 01 DC 88      [10] 1773 	ld	bc,#_prota+0
   9209 21 E3 88      [10] 1774 	ld	hl,#(_prota + 0x0007)
   920C 36 01         [10] 1775 	ld	(hl),#0x01
                           1776 ;src/main.c:398: if (!checkCollision(M_izquierda)) {
   920E C5            [11] 1777 	push	bc
   920F 21 01 00      [10] 1778 	ld	hl,#0x0001
   9212 E5            [11] 1779 	push	hl
   9213 CD 3D 8A      [17] 1780 	call	_checkCollision
   9216 F1            [10] 1781 	pop	af
   9217 C1            [10] 1782 	pop	bc
   9218 7D            [ 4] 1783 	ld	a,l
   9219 B7            [ 4] 1784 	or	a, a
   921A C0            [11] 1785 	ret	NZ
                           1786 ;src/main.c:399: prota.x--;
   921B 0A            [ 7] 1787 	ld	a,(bc)
   921C C6 FF         [ 7] 1788 	add	a,#0xFF
   921E 02            [ 7] 1789 	ld	(bc),a
                           1790 ;src/main.c:400: prota.mover = SI;
   921F 21 E2 88      [10] 1791 	ld	hl,#(_prota + 0x0006)
   9222 36 01         [10] 1792 	ld	(hl),#0x01
                           1793 ;src/main.c:401: prota.sprite = g_hero_left;
   9224 21 FE 79      [10] 1794 	ld	hl,#_g_hero_left
   9227 22 E0 88      [16] 1795 	ld	((_prota + 0x0004)), hl
   922A C9            [10] 1796 	ret
                           1797 ;src/main.c:405: void moverDerecha() {
                           1798 ;	---------------------------------
                           1799 ; Function moverDerecha
                           1800 ; ---------------------------------
   922B                    1801 _moverDerecha::
                           1802 ;src/main.c:406: prota.mira = M_derecha;
   922B 21 E3 88      [10] 1803 	ld	hl,#(_prota + 0x0007)
   922E 36 00         [10] 1804 	ld	(hl),#0x00
                           1805 ;src/main.c:407: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   9230 21 00 00      [10] 1806 	ld	hl,#0x0000
   9233 E5            [11] 1807 	push	hl
   9234 CD 3D 8A      [17] 1808 	call	_checkCollision
   9237 F1            [10] 1809 	pop	af
   9238 45            [ 4] 1810 	ld	b,l
   9239 21 DC 88      [10] 1811 	ld	hl, #_prota + 0
   923C 4E            [ 7] 1812 	ld	c,(hl)
   923D 59            [ 4] 1813 	ld	e,c
   923E 16 00         [ 7] 1814 	ld	d,#0x00
   9240 21 07 00      [10] 1815 	ld	hl,#0x0007
   9243 19            [11] 1816 	add	hl,de
   9244 11 50 80      [10] 1817 	ld	de, #0x8050
   9247 29            [11] 1818 	add	hl, hl
   9248 3F            [ 4] 1819 	ccf
   9249 CB 1C         [ 8] 1820 	rr	h
   924B CB 1D         [ 8] 1821 	rr	l
   924D ED 52         [15] 1822 	sbc	hl, de
   924F 3E 00         [ 7] 1823 	ld	a,#0x00
   9251 17            [ 4] 1824 	rla
   9252 5F            [ 4] 1825 	ld	e,a
   9253 78            [ 4] 1826 	ld	a,b
   9254 B7            [ 4] 1827 	or	a,a
   9255 20 14         [12] 1828 	jr	NZ,00104$
   9257 B3            [ 4] 1829 	or	a,e
   9258 28 11         [12] 1830 	jr	Z,00104$
                           1831 ;src/main.c:408: prota.x++;
   925A 0C            [ 4] 1832 	inc	c
   925B 21 DC 88      [10] 1833 	ld	hl,#_prota
   925E 71            [ 7] 1834 	ld	(hl),c
                           1835 ;src/main.c:409: prota.mover = SI;
   925F 21 E2 88      [10] 1836 	ld	hl,#(_prota + 0x0006)
   9262 36 01         [10] 1837 	ld	(hl),#0x01
                           1838 ;src/main.c:410: prota.sprite = g_hero;
   9264 21 A8 7A      [10] 1839 	ld	hl,#_g_hero
   9267 22 E0 88      [16] 1840 	ld	((_prota + 0x0004)), hl
   926A C9            [10] 1841 	ret
   926B                    1842 00104$:
                           1843 ;src/main.c:412: }else if( prota.x + G_HERO_W >= 80){
   926B 7B            [ 4] 1844 	ld	a,e
   926C B7            [ 4] 1845 	or	a, a
   926D C0            [11] 1846 	ret	NZ
                           1847 ;src/main.c:413: avanzarMapa();
   926E C3 C7 91      [10] 1848 	jp  _avanzarMapa
                           1849 ;src/main.c:417: void moverArriba() {
                           1850 ;	---------------------------------
                           1851 ; Function moverArriba
                           1852 ; ---------------------------------
   9271                    1853 _moverArriba::
                           1854 ;src/main.c:418: prota.mira = M_arriba;
   9271 21 E3 88      [10] 1855 	ld	hl,#(_prota + 0x0007)
   9274 36 02         [10] 1856 	ld	(hl),#0x02
                           1857 ;src/main.c:419: if (!checkCollision(M_arriba)) { // TODO: COMPROBAR
   9276 21 02 00      [10] 1858 	ld	hl,#0x0002
   9279 E5            [11] 1859 	push	hl
   927A CD 3D 8A      [17] 1860 	call	_checkCollision
   927D F1            [10] 1861 	pop	af
   927E 7D            [ 4] 1862 	ld	a,l
   927F B7            [ 4] 1863 	or	a, a
   9280 C0            [11] 1864 	ret	NZ
                           1865 ;src/main.c:420: prota.y--;
   9281 21 DD 88      [10] 1866 	ld	hl,#_prota + 1
   9284 4E            [ 7] 1867 	ld	c,(hl)
   9285 0D            [ 4] 1868 	dec	c
   9286 71            [ 7] 1869 	ld	(hl),c
                           1870 ;src/main.c:421: prota.y--;
   9287 0D            [ 4] 1871 	dec	c
   9288 71            [ 7] 1872 	ld	(hl),c
                           1873 ;src/main.c:422: prota.mover  = SI;
   9289 21 E2 88      [10] 1874 	ld	hl,#(_prota + 0x0006)
   928C 36 01         [10] 1875 	ld	(hl),#0x01
                           1876 ;src/main.c:423: prota.sprite = g_hero_up;
   928E 21 64 79      [10] 1877 	ld	hl,#_g_hero_up
   9291 22 E0 88      [16] 1878 	ld	((_prota + 0x0004)), hl
   9294 C9            [10] 1879 	ret
                           1880 ;src/main.c:427: void moverAbajo() {
                           1881 ;	---------------------------------
                           1882 ; Function moverAbajo
                           1883 ; ---------------------------------
   9295                    1884 _moverAbajo::
                           1885 ;src/main.c:428: prota.mira = M_abajo;
   9295 21 E3 88      [10] 1886 	ld	hl,#(_prota + 0x0007)
   9298 36 03         [10] 1887 	ld	(hl),#0x03
                           1888 ;src/main.c:429: if (!checkCollision(M_abajo) ) { // TODO: COMPROBAR
   929A 21 03 00      [10] 1889 	ld	hl,#0x0003
   929D E5            [11] 1890 	push	hl
   929E CD 3D 8A      [17] 1891 	call	_checkCollision
   92A1 F1            [10] 1892 	pop	af
   92A2 7D            [ 4] 1893 	ld	a,l
   92A3 B7            [ 4] 1894 	or	a, a
   92A4 C0            [11] 1895 	ret	NZ
                           1896 ;src/main.c:430: prota.y++;
   92A5 01 DD 88      [10] 1897 	ld	bc,#_prota + 1
   92A8 0A            [ 7] 1898 	ld	a,(bc)
   92A9 3C            [ 4] 1899 	inc	a
   92AA 02            [ 7] 1900 	ld	(bc),a
                           1901 ;src/main.c:431: prota.y++;
   92AB 3C            [ 4] 1902 	inc	a
   92AC 02            [ 7] 1903 	ld	(bc),a
                           1904 ;src/main.c:432: prota.mover  = SI;
   92AD 21 E2 88      [10] 1905 	ld	hl,#(_prota + 0x0006)
   92B0 36 01         [10] 1906 	ld	(hl),#0x01
                           1907 ;src/main.c:433: prota.sprite = g_hero_down;
   92B2 21 CA 78      [10] 1908 	ld	hl,#_g_hero_down
   92B5 22 E0 88      [16] 1909 	ld	((_prota + 0x0004)), hl
   92B8 C9            [10] 1910 	ret
                           1911 ;src/main.c:437: void dibujarCuchillo() {
                           1912 ;	---------------------------------
                           1913 ; Function dibujarCuchillo
                           1914 ; ---------------------------------
   92B9                    1915 _dibujarCuchillo::
   92B9 DD E5         [15] 1916 	push	ix
   92BB DD 21 00 00   [14] 1917 	ld	ix,#0
   92BF DD 39         [15] 1918 	add	ix,sp
   92C1 F5            [11] 1919 	push	af
                           1920 ;src/main.c:438: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   92C2 21 E5 88      [10] 1921 	ld	hl, #_cu + 1
   92C5 56            [ 7] 1922 	ld	d,(hl)
   92C6 21 E4 88      [10] 1923 	ld	hl, #_cu + 0
   92C9 46            [ 7] 1924 	ld	b,(hl)
   92CA D5            [11] 1925 	push	de
   92CB 33            [ 6] 1926 	inc	sp
   92CC C5            [11] 1927 	push	bc
   92CD 33            [ 6] 1928 	inc	sp
   92CE 21 00 C0      [10] 1929 	ld	hl,#0xC000
   92D1 E5            [11] 1930 	push	hl
   92D2 CD 4B 88      [17] 1931 	call	_cpct_getScreenPtr
   92D5 45            [ 4] 1932 	ld	b,l
   92D6 5C            [ 4] 1933 	ld	e,h
                           1934 ;src/main.c:439: if(cu.eje == E_X){
   92D7 21 EC 88      [10] 1935 	ld	hl, #_cu + 8
   92DA 4E            [ 7] 1936 	ld	c,(hl)
                           1937 ;src/main.c:440: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   92DB DD 70 FE      [19] 1938 	ld	-2 (ix),b
   92DE DD 73 FF      [19] 1939 	ld	-1 (ix),e
                           1940 ;src/main.c:439: if(cu.eje == E_X){
   92E1 79            [ 4] 1941 	ld	a,c
   92E2 B7            [ 4] 1942 	or	a, a
   92E3 20 19         [12] 1943 	jr	NZ,00104$
                           1944 ;src/main.c:440: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   92E5 11 00 3E      [10] 1945 	ld	de,#_g_tablatrans+0
   92E8 ED 4B E8 88   [20] 1946 	ld	bc, (#(_cu + 0x0004) + 0)
   92EC D5            [11] 1947 	push	de
   92ED 21 04 04      [10] 1948 	ld	hl,#0x0404
   92F0 E5            [11] 1949 	push	hl
   92F1 DD 6E FE      [19] 1950 	ld	l,-2 (ix)
   92F4 DD 66 FF      [19] 1951 	ld	h,-1 (ix)
   92F7 E5            [11] 1952 	push	hl
   92F8 C5            [11] 1953 	push	bc
   92F9 CD 6B 88      [17] 1954 	call	_cpct_drawSpriteMaskedAlignedTable
   92FC 18 1A         [12] 1955 	jr	00106$
   92FE                    1956 00104$:
                           1957 ;src/main.c:443: else if(cu.eje == E_Y){
   92FE 0D            [ 4] 1958 	dec	c
   92FF 20 17         [12] 1959 	jr	NZ,00106$
                           1960 ;src/main.c:444: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   9301 11 00 3E      [10] 1961 	ld	de,#_g_tablatrans+0
   9304 ED 4B E8 88   [20] 1962 	ld	bc, (#(_cu + 0x0004) + 0)
   9308 D5            [11] 1963 	push	de
   9309 21 02 08      [10] 1964 	ld	hl,#0x0802
   930C E5            [11] 1965 	push	hl
   930D DD 6E FE      [19] 1966 	ld	l,-2 (ix)
   9310 DD 66 FF      [19] 1967 	ld	h,-1 (ix)
   9313 E5            [11] 1968 	push	hl
   9314 C5            [11] 1969 	push	bc
   9315 CD 6B 88      [17] 1970 	call	_cpct_drawSpriteMaskedAlignedTable
   9318                    1971 00106$:
   9318 DD F9         [10] 1972 	ld	sp, ix
   931A DD E1         [14] 1973 	pop	ix
   931C C9            [10] 1974 	ret
                           1975 ;src/main.c:448: void borrarCuchillo() {
                           1976 ;	---------------------------------
                           1977 ; Function borrarCuchillo
                           1978 ; ---------------------------------
   931D                    1979 _borrarCuchillo::
   931D DD E5         [15] 1980 	push	ix
   931F DD 21 00 00   [14] 1981 	ld	ix,#0
   9323 DD 39         [15] 1982 	add	ix,sp
   9325 F5            [11] 1983 	push	af
   9326 3B            [ 6] 1984 	dec	sp
                           1985 ;src/main.c:450: u8 w = 2 + (cu.px & 1);
   9327 21 E6 88      [10] 1986 	ld	hl, #_cu + 2
   932A 4E            [ 7] 1987 	ld	c,(hl)
   932B 79            [ 4] 1988 	ld	a,c
   932C E6 01         [ 7] 1989 	and	a, #0x01
   932E 47            [ 4] 1990 	ld	b,a
   932F 04            [ 4] 1991 	inc	b
   9330 04            [ 4] 1992 	inc	b
                           1993 ;src/main.c:451: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   9331 21 E7 88      [10] 1994 	ld	hl, #_cu + 3
   9334 5E            [ 7] 1995 	ld	e,(hl)
   9335 7B            [ 4] 1996 	ld	a,e
   9336 E6 03         [ 7] 1997 	and	a, #0x03
   9338 28 04         [12] 1998 	jr	Z,00105$
   933A 3E 01         [ 7] 1999 	ld	a,#0x01
   933C 18 02         [12] 2000 	jr	00106$
   933E                    2001 00105$:
   933E 3E 00         [ 7] 2002 	ld	a,#0x00
   9340                    2003 00106$:
   9340 C6 02         [ 7] 2004 	add	a, #0x02
   9342 DD 77 FD      [19] 2005 	ld	-3 (ix),a
                           2006 ;src/main.c:452: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   9345 FD 2A EE 88   [20] 2007 	ld	iy,(_mapa)
   9349 16 00         [ 7] 2008 	ld	d,#0x00
   934B 7B            [ 4] 2009 	ld	a,e
   934C C6 E8         [ 7] 2010 	add	a,#0xE8
   934E DD 77 FE      [19] 2011 	ld	-2 (ix),a
   9351 7A            [ 4] 2012 	ld	a,d
   9352 CE FF         [ 7] 2013 	adc	a,#0xFF
   9354 DD 77 FF      [19] 2014 	ld	-1 (ix),a
   9357 DD 6E FE      [19] 2015 	ld	l,-2 (ix)
   935A DD 66 FF      [19] 2016 	ld	h,-1 (ix)
   935D DD CB FF 7E   [20] 2017 	bit	7, -1 (ix)
   9361 28 04         [12] 2018 	jr	Z,00107$
   9363 21 EB FF      [10] 2019 	ld	hl,#0xFFEB
   9366 19            [11] 2020 	add	hl,de
   9367                    2021 00107$:
   9367 CB 2C         [ 8] 2022 	sra	h
   9369 CB 1D         [ 8] 2023 	rr	l
   936B CB 2C         [ 8] 2024 	sra	h
   936D CB 1D         [ 8] 2025 	rr	l
   936F 55            [ 4] 2026 	ld	d,l
   9370 CB 39         [ 8] 2027 	srl	c
   9372 FD E5         [15] 2028 	push	iy
   9374 21 F0 C0      [10] 2029 	ld	hl,#0xC0F0
   9377 E5            [11] 2030 	push	hl
   9378 3E 28         [ 7] 2031 	ld	a,#0x28
   937A F5            [11] 2032 	push	af
   937B 33            [ 6] 2033 	inc	sp
   937C DD 7E FD      [19] 2034 	ld	a,-3 (ix)
   937F F5            [11] 2035 	push	af
   9380 33            [ 6] 2036 	inc	sp
   9381 C5            [11] 2037 	push	bc
   9382 33            [ 6] 2038 	inc	sp
   9383 D5            [11] 2039 	push	de
   9384 33            [ 6] 2040 	inc	sp
   9385 79            [ 4] 2041 	ld	a,c
   9386 F5            [11] 2042 	push	af
   9387 33            [ 6] 2043 	inc	sp
   9388 CD 44 7D      [17] 2044 	call	_cpct_etm_drawTileBox2x4
                           2045 ;src/main.c:453: if(!cu.mover){
   938B 3A ED 88      [13] 2046 	ld	a, (#_cu + 9)
   938E B7            [ 4] 2047 	or	a, a
   938F 20 05         [12] 2048 	jr	NZ,00103$
                           2049 ;src/main.c:454: cu.lanzado = NO;
   9391 21 EA 88      [10] 2050 	ld	hl,#(_cu + 0x0006)
   9394 36 00         [10] 2051 	ld	(hl),#0x00
   9396                    2052 00103$:
   9396 DD F9         [10] 2053 	ld	sp, ix
   9398 DD E1         [14] 2054 	pop	ix
   939A C9            [10] 2055 	ret
                           2056 ;src/main.c:458: void redibujarCuchillo( ) {
                           2057 ;	---------------------------------
                           2058 ; Function redibujarCuchillo
                           2059 ; ---------------------------------
   939B                    2060 _redibujarCuchillo::
                           2061 ;src/main.c:459: borrarCuchillo();
   939B CD 1D 93      [17] 2062 	call	_borrarCuchillo
                           2063 ;src/main.c:460: cu.px = cu.x;
   939E 01 E6 88      [10] 2064 	ld	bc,#_cu + 2
   93A1 3A E4 88      [13] 2065 	ld	a, (#_cu + 0)
   93A4 02            [ 7] 2066 	ld	(bc),a
                           2067 ;src/main.c:461: cu.py = cu.y;
   93A5 01 E7 88      [10] 2068 	ld	bc,#_cu + 3
   93A8 3A E5 88      [13] 2069 	ld	a, (#_cu + 1)
   93AB 02            [ 7] 2070 	ld	(bc),a
                           2071 ;src/main.c:462: dibujarCuchillo();
   93AC C3 B9 92      [10] 2072 	jp  _dibujarCuchillo
                           2073 ;src/main.c:465: void lanzarCuchillo(){
                           2074 ;	---------------------------------
                           2075 ; Function lanzarCuchillo
                           2076 ; ---------------------------------
   93AF                    2077 _lanzarCuchillo::
                           2078 ;src/main.c:467: if(!cu.lanzado){
   93AF 3A EA 88      [13] 2079 	ld	a, (#(_cu + 0x0006) + 0)
   93B2 B7            [ 4] 2080 	or	a, a
   93B3 C0            [11] 2081 	ret	NZ
                           2082 ;src/main.c:469: if(prota.mira == M_derecha){
   93B4 21 E3 88      [10] 2083 	ld	hl, #_prota + 7
   93B7 5E            [ 7] 2084 	ld	e,(hl)
                           2085 ;src/main.c:470: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   93B8 01 DD 88      [10] 2086 	ld	bc,#_prota + 1
                           2087 ;src/main.c:472: cu.direccion = M_derecha;
                           2088 ;src/main.c:474: cu.y=prota.y + G_HERO_H /2;
                           2089 ;src/main.c:475: cu.sprite=g_knifeX_0;
                           2090 ;src/main.c:476: cu.eje = E_X;
                           2091 ;src/main.c:469: if(prota.mira == M_derecha){
   93BB 7B            [ 4] 2092 	ld	a,e
   93BC B7            [ 4] 2093 	or	a, a
   93BD 20 41         [12] 2094 	jr	NZ,00118$
                           2095 ;src/main.c:470: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   93BF 0A            [ 7] 2096 	ld	a,(bc)
   93C0 C6 0B         [ 7] 2097 	add	a, #0x0B
   93C2 5F            [ 4] 2098 	ld	e,a
   93C3 3A DC 88      [13] 2099 	ld	a, (#_prota + 0)
   93C6 C6 0C         [ 7] 2100 	add	a, #0x0C
   93C8 6F            [ 4] 2101 	ld	l,a
   93C9 C5            [11] 2102 	push	bc
   93CA 7B            [ 4] 2103 	ld	a,e
   93CB F5            [11] 2104 	push	af
   93CC 33            [ 6] 2105 	inc	sp
   93CD 7D            [ 4] 2106 	ld	a,l
   93CE F5            [11] 2107 	push	af
   93CF 33            [ 6] 2108 	inc	sp
   93D0 CD FC 89      [17] 2109 	call	_getTilePtr
   93D3 F1            [10] 2110 	pop	af
   93D4 C1            [10] 2111 	pop	bc
   93D5 5E            [ 7] 2112 	ld	e,(hl)
   93D6 3E 02         [ 7] 2113 	ld	a,#0x02
   93D8 93            [ 4] 2114 	sub	a, e
   93D9 D8            [11] 2115 	ret	C
                           2116 ;src/main.c:471: cu.lanzado = SI;
   93DA 21 EA 88      [10] 2117 	ld	hl,#(_cu + 0x0006)
   93DD 36 01         [10] 2118 	ld	(hl),#0x01
                           2119 ;src/main.c:472: cu.direccion = M_derecha;
   93DF 21 EB 88      [10] 2120 	ld	hl,#(_cu + 0x0007)
   93E2 36 00         [10] 2121 	ld	(hl),#0x00
                           2122 ;src/main.c:473: cu.x=prota.x + G_HERO_W;
   93E4 3A DC 88      [13] 2123 	ld	a, (#_prota + 0)
   93E7 C6 07         [ 7] 2124 	add	a, #0x07
   93E9 32 E4 88      [13] 2125 	ld	(#_cu),a
                           2126 ;src/main.c:474: cu.y=prota.y + G_HERO_H /2;
   93EC 0A            [ 7] 2127 	ld	a,(bc)
   93ED C6 0B         [ 7] 2128 	add	a, #0x0B
   93EF 32 E5 88      [13] 2129 	ld	(#(_cu + 0x0001)),a
                           2130 ;src/main.c:475: cu.sprite=g_knifeX_0;
   93F2 21 C0 54      [10] 2131 	ld	hl,#_g_knifeX_0
   93F5 22 E8 88      [16] 2132 	ld	((_cu + 0x0004)), hl
                           2133 ;src/main.c:476: cu.eje = E_X;
   93F8 21 EC 88      [10] 2134 	ld	hl,#(_cu + 0x0008)
   93FB 36 00         [10] 2135 	ld	(hl),#0x00
                           2136 ;src/main.c:477: dibujarCuchillo();
   93FD C3 B9 92      [10] 2137 	jp  _dibujarCuchillo
   9400                    2138 00118$:
                           2139 ;src/main.c:480: else if(prota.mira == M_izquierda){
   9400 7B            [ 4] 2140 	ld	a,e
   9401 3D            [ 4] 2141 	dec	a
   9402 20 41         [12] 2142 	jr	NZ,00115$
                           2143 ;src/main.c:481: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   9404 0A            [ 7] 2144 	ld	a,(bc)
   9405 C6 0B         [ 7] 2145 	add	a, #0x0B
   9407 5F            [ 4] 2146 	ld	e,a
   9408 3A DC 88      [13] 2147 	ld	a, (#_prota + 0)
   940B C6 F6         [ 7] 2148 	add	a,#0xF6
   940D 6F            [ 4] 2149 	ld	l,a
   940E C5            [11] 2150 	push	bc
   940F 7B            [ 4] 2151 	ld	a,e
   9410 F5            [11] 2152 	push	af
   9411 33            [ 6] 2153 	inc	sp
   9412 7D            [ 4] 2154 	ld	a,l
   9413 F5            [11] 2155 	push	af
   9414 33            [ 6] 2156 	inc	sp
   9415 CD FC 89      [17] 2157 	call	_getTilePtr
   9418 F1            [10] 2158 	pop	af
   9419 C1            [10] 2159 	pop	bc
   941A 5E            [ 7] 2160 	ld	e,(hl)
   941B 3E 02         [ 7] 2161 	ld	a,#0x02
   941D 93            [ 4] 2162 	sub	a, e
   941E D8            [11] 2163 	ret	C
                           2164 ;src/main.c:482: cu.lanzado = SI;
   941F 21 EA 88      [10] 2165 	ld	hl,#(_cu + 0x0006)
   9422 36 01         [10] 2166 	ld	(hl),#0x01
                           2167 ;src/main.c:483: cu.direccion = M_izquierda;
   9424 21 EB 88      [10] 2168 	ld	hl,#(_cu + 0x0007)
   9427 36 01         [10] 2169 	ld	(hl),#0x01
                           2170 ;src/main.c:484: cu.x = prota.x - G_KNIFEX_0_W;
   9429 3A DC 88      [13] 2171 	ld	a, (#_prota + 0)
   942C C6 FC         [ 7] 2172 	add	a,#0xFC
   942E 32 E4 88      [13] 2173 	ld	(#_cu),a
                           2174 ;src/main.c:485: cu.y = prota.y + G_HERO_H /2;
   9431 0A            [ 7] 2175 	ld	a,(bc)
   9432 C6 0B         [ 7] 2176 	add	a, #0x0B
   9434 32 E5 88      [13] 2177 	ld	(#(_cu + 0x0001)),a
                           2178 ;src/main.c:486: cu.sprite = g_knifeX_1;
   9437 21 D0 54      [10] 2179 	ld	hl,#_g_knifeX_1
   943A 22 E8 88      [16] 2180 	ld	((_cu + 0x0004)), hl
                           2181 ;src/main.c:487: cu.eje = E_X;
   943D 21 EC 88      [10] 2182 	ld	hl,#(_cu + 0x0008)
   9440 36 00         [10] 2183 	ld	(hl),#0x00
                           2184 ;src/main.c:488: dibujarCuchillo();
   9442 C3 B9 92      [10] 2185 	jp  _dibujarCuchillo
   9445                    2186 00115$:
                           2187 ;src/main.c:491: else if(prota.mira == M_abajo){
   9445 7B            [ 4] 2188 	ld	a,e
   9446 D6 03         [ 7] 2189 	sub	a, #0x03
   9448 20 41         [12] 2190 	jr	NZ,00112$
                           2191 ;src/main.c:493: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   944A 0A            [ 7] 2192 	ld	a,(bc)
   944B C6 1F         [ 7] 2193 	add	a, #0x1F
   944D 5F            [ 4] 2194 	ld	e,a
   944E 3A DC 88      [13] 2195 	ld	a, (#_prota + 0)
   9451 57            [ 4] 2196 	ld	d,a
   9452 14            [ 4] 2197 	inc	d
   9453 14            [ 4] 2198 	inc	d
   9454 14            [ 4] 2199 	inc	d
   9455 C5            [11] 2200 	push	bc
   9456 7B            [ 4] 2201 	ld	a,e
   9457 F5            [11] 2202 	push	af
   9458 33            [ 6] 2203 	inc	sp
   9459 D5            [11] 2204 	push	de
   945A 33            [ 6] 2205 	inc	sp
   945B CD FC 89      [17] 2206 	call	_getTilePtr
   945E F1            [10] 2207 	pop	af
   945F C1            [10] 2208 	pop	bc
   9460 5E            [ 7] 2209 	ld	e,(hl)
   9461 3E 02         [ 7] 2210 	ld	a,#0x02
   9463 93            [ 4] 2211 	sub	a, e
   9464 D8            [11] 2212 	ret	C
                           2213 ;src/main.c:494: cu.lanzado = SI;
   9465 21 EA 88      [10] 2214 	ld	hl,#(_cu + 0x0006)
   9468 36 01         [10] 2215 	ld	(hl),#0x01
                           2216 ;src/main.c:495: cu.direccion = M_abajo;
   946A 21 EB 88      [10] 2217 	ld	hl,#(_cu + 0x0007)
   946D 36 03         [10] 2218 	ld	(hl),#0x03
                           2219 ;src/main.c:496: cu.x = prota.x + G_HERO_W / 2;
   946F 3A DC 88      [13] 2220 	ld	a, (#_prota + 0)
   9472 C6 03         [ 7] 2221 	add	a, #0x03
   9474 32 E4 88      [13] 2222 	ld	(#_cu),a
                           2223 ;src/main.c:497: cu.y = prota.y + G_HERO_H;
   9477 0A            [ 7] 2224 	ld	a,(bc)
   9478 C6 16         [ 7] 2225 	add	a, #0x16
   947A 32 E5 88      [13] 2226 	ld	(#(_cu + 0x0001)),a
                           2227 ;src/main.c:498: cu.sprite = g_knifeY_0;
   947D 21 A0 54      [10] 2228 	ld	hl,#_g_knifeY_0
   9480 22 E8 88      [16] 2229 	ld	((_cu + 0x0004)), hl
                           2230 ;src/main.c:499: cu.eje = E_Y;
   9483 21 EC 88      [10] 2231 	ld	hl,#(_cu + 0x0008)
   9486 36 01         [10] 2232 	ld	(hl),#0x01
                           2233 ;src/main.c:500: dibujarCuchillo();
   9488 C3 B9 92      [10] 2234 	jp  _dibujarCuchillo
   948B                    2235 00112$:
                           2236 ;src/main.c:503: else if(prota.mira == M_arriba){
   948B 7B            [ 4] 2237 	ld	a,e
   948C D6 02         [ 7] 2238 	sub	a, #0x02
   948E C0            [11] 2239 	ret	NZ
                           2240 ;src/main.c:504: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   948F 0A            [ 7] 2241 	ld	a,(bc)
   9490 C6 F7         [ 7] 2242 	add	a,#0xF7
   9492 57            [ 4] 2243 	ld	d,a
   9493 3A DC 88      [13] 2244 	ld	a, (#_prota + 0)
   9496 C6 03         [ 7] 2245 	add	a, #0x03
   9498 C5            [11] 2246 	push	bc
   9499 D5            [11] 2247 	push	de
   949A 33            [ 6] 2248 	inc	sp
   949B F5            [11] 2249 	push	af
   949C 33            [ 6] 2250 	inc	sp
   949D CD FC 89      [17] 2251 	call	_getTilePtr
   94A0 F1            [10] 2252 	pop	af
   94A1 C1            [10] 2253 	pop	bc
   94A2 5E            [ 7] 2254 	ld	e,(hl)
   94A3 3E 02         [ 7] 2255 	ld	a,#0x02
   94A5 93            [ 4] 2256 	sub	a, e
   94A6 D8            [11] 2257 	ret	C
                           2258 ;src/main.c:505: cu.lanzado = SI;
   94A7 21 EA 88      [10] 2259 	ld	hl,#(_cu + 0x0006)
   94AA 36 01         [10] 2260 	ld	(hl),#0x01
                           2261 ;src/main.c:506: cu.direccion = M_arriba;
   94AC 21 EB 88      [10] 2262 	ld	hl,#(_cu + 0x0007)
   94AF 36 02         [10] 2263 	ld	(hl),#0x02
                           2264 ;src/main.c:507: cu.x = prota.x + G_HERO_W / 2;
   94B1 3A DC 88      [13] 2265 	ld	a, (#_prota + 0)
   94B4 C6 03         [ 7] 2266 	add	a, #0x03
   94B6 32 E4 88      [13] 2267 	ld	(#_cu),a
                           2268 ;src/main.c:508: cu.y = prota.y;
   94B9 0A            [ 7] 2269 	ld	a,(bc)
   94BA 32 E5 88      [13] 2270 	ld	(#(_cu + 0x0001)),a
                           2271 ;src/main.c:509: cu.sprite = g_knifeY_1;
   94BD 21 B0 54      [10] 2272 	ld	hl,#_g_knifeY_1
   94C0 22 E8 88      [16] 2273 	ld	((_cu + 0x0004)), hl
                           2274 ;src/main.c:510: cu.eje = E_Y;
   94C3 21 EC 88      [10] 2275 	ld	hl,#(_cu + 0x0008)
   94C6 36 01         [10] 2276 	ld	(hl),#0x01
                           2277 ;src/main.c:511: dibujarCuchillo();
   94C8 C3 B9 92      [10] 2278 	jp  _dibujarCuchillo
                           2279 ;src/main.c:517: void comprobarTeclado() {
                           2280 ;	---------------------------------
                           2281 ; Function comprobarTeclado
                           2282 ; ---------------------------------
   94CB                    2283 _comprobarTeclado::
                           2284 ;src/main.c:518: cpct_scanKeyboard_if();
   94CB CD 9C 7E      [17] 2285 	call	_cpct_scanKeyboard_if
                           2286 ;src/main.c:520: if (cpct_isAnyKeyPressed()) {
   94CE CD 8F 7E      [17] 2287 	call	_cpct_isAnyKeyPressed
   94D1 7D            [ 4] 2288 	ld	a,l
   94D2 B7            [ 4] 2289 	or	a, a
   94D3 C8            [11] 2290 	ret	Z
                           2291 ;src/main.c:521: if (cpct_isKeyPressed(Key_CursorLeft))
   94D4 21 01 01      [10] 2292 	ld	hl,#0x0101
   94D7 CD F9 7B      [17] 2293 	call	_cpct_isKeyPressed
   94DA 7D            [ 4] 2294 	ld	a,l
   94DB B7            [ 4] 2295 	or	a, a
                           2296 ;src/main.c:522: moverIzquierda();
   94DC C2 06 92      [10] 2297 	jp	NZ,_moverIzquierda
                           2298 ;src/main.c:523: else if (cpct_isKeyPressed(Key_CursorRight))
   94DF 21 00 02      [10] 2299 	ld	hl,#0x0200
   94E2 CD F9 7B      [17] 2300 	call	_cpct_isKeyPressed
   94E5 7D            [ 4] 2301 	ld	a,l
   94E6 B7            [ 4] 2302 	or	a, a
                           2303 ;src/main.c:524: moverDerecha();
   94E7 C2 2B 92      [10] 2304 	jp	NZ,_moverDerecha
                           2305 ;src/main.c:525: else if (cpct_isKeyPressed(Key_CursorUp))
   94EA 21 00 01      [10] 2306 	ld	hl,#0x0100
   94ED CD F9 7B      [17] 2307 	call	_cpct_isKeyPressed
   94F0 7D            [ 4] 2308 	ld	a,l
   94F1 B7            [ 4] 2309 	or	a, a
                           2310 ;src/main.c:526: moverArriba();
   94F2 C2 71 92      [10] 2311 	jp	NZ,_moverArriba
                           2312 ;src/main.c:527: else if (cpct_isKeyPressed(Key_CursorDown))
   94F5 21 00 04      [10] 2313 	ld	hl,#0x0400
   94F8 CD F9 7B      [17] 2314 	call	_cpct_isKeyPressed
   94FB 7D            [ 4] 2315 	ld	a,l
   94FC B7            [ 4] 2316 	or	a, a
                           2317 ;src/main.c:528: moverAbajo();
   94FD C2 95 92      [10] 2318 	jp	NZ,_moverAbajo
                           2319 ;src/main.c:529: else if (cpct_isKeyPressed(Key_Space))
   9500 21 05 80      [10] 2320 	ld	hl,#0x8005
   9503 CD F9 7B      [17] 2321 	call	_cpct_isKeyPressed
   9506 7D            [ 4] 2322 	ld	a,l
   9507 B7            [ 4] 2323 	or	a, a
   9508 C8            [11] 2324 	ret	Z
                           2325 ;src/main.c:530: lanzarCuchillo();
   9509 C3 AF 93      [10] 2326 	jp  _lanzarCuchillo
                           2327 ;src/main.c:534: u8 checkKnifeCollision(int direction, u8 xoff, u8 yoff){
                           2328 ;	---------------------------------
                           2329 ; Function checkKnifeCollision
                           2330 ; ---------------------------------
   950C                    2331 _checkKnifeCollision::
                           2332 ;src/main.c:536: return *getTilePtr(cu.x + xoff, cu.y + yoff) <= 2;
   950C 3A E5 88      [13] 2333 	ld	a,(#_cu + 1)
   950F 21 05 00      [10] 2334 	ld	hl,#5
   9512 39            [11] 2335 	add	hl,sp
   9513 86            [ 7] 2336 	add	a, (hl)
   9514 47            [ 4] 2337 	ld	b,a
   9515 3A E4 88      [13] 2338 	ld	a,(#_cu + 0)
   9518 21 04 00      [10] 2339 	ld	hl,#4
   951B 39            [11] 2340 	add	hl,sp
   951C 86            [ 7] 2341 	add	a, (hl)
   951D 4F            [ 4] 2342 	ld	c,a
   951E C5            [11] 2343 	push	bc
   951F CD FC 89      [17] 2344 	call	_getTilePtr
   9522 F1            [10] 2345 	pop	af
   9523 4E            [ 7] 2346 	ld	c,(hl)
   9524 3E 02         [ 7] 2347 	ld	a,#0x02
   9526 91            [ 4] 2348 	sub	a, c
   9527 3E 00         [ 7] 2349 	ld	a,#0x00
   9529 17            [ 4] 2350 	rla
   952A EE 01         [ 7] 2351 	xor	a, #0x01
   952C 6F            [ 4] 2352 	ld	l, a
   952D C9            [10] 2353 	ret
                           2354 ;src/main.c:539: void moverCuchillo(){
                           2355 ;	---------------------------------
                           2356 ; Function moverCuchillo
                           2357 ; ---------------------------------
   952E                    2358 _moverCuchillo::
                           2359 ;src/main.c:540: if(cu.lanzado){
   952E 01 E4 88      [10] 2360 	ld	bc,#_cu+0
   9531 3A EA 88      [13] 2361 	ld	a, (#_cu + 6)
   9534 B7            [ 4] 2362 	or	a, a
   9535 C8            [11] 2363 	ret	Z
                           2364 ;src/main.c:541: cu.mover = SI;
   9536 21 09 00      [10] 2365 	ld	hl,#0x0009
   9539 09            [11] 2366 	add	hl,bc
   953A EB            [ 4] 2367 	ex	de,hl
   953B 3E 01         [ 7] 2368 	ld	a,#0x01
   953D 12            [ 7] 2369 	ld	(de),a
                           2370 ;src/main.c:542: if(cu.direccion == M_derecha){
   953E 21 EB 88      [10] 2371 	ld	hl, #_cu + 7
   9541 6E            [ 7] 2372 	ld	l,(hl)
   9542 7D            [ 4] 2373 	ld	a,l
   9543 B7            [ 4] 2374 	or	a, a
   9544 20 1E         [12] 2375 	jr	NZ,00122$
                           2376 ;src/main.c:544: if(checkKnifeCollision(M_derecha, G_KNIFEX_0_W + 1, 0)){
   9546 C5            [11] 2377 	push	bc
   9547 D5            [11] 2378 	push	de
   9548 21 05 00      [10] 2379 	ld	hl,#0x0005
   954B E5            [11] 2380 	push	hl
   954C 2E 00         [ 7] 2381 	ld	l, #0x00
   954E E5            [11] 2382 	push	hl
   954F CD 0C 95      [17] 2383 	call	_checkKnifeCollision
   9552 F1            [10] 2384 	pop	af
   9553 F1            [10] 2385 	pop	af
   9554 D1            [10] 2386 	pop	de
   9555 C1            [10] 2387 	pop	bc
   9556 7D            [ 4] 2388 	ld	a,l
   9557 B7            [ 4] 2389 	or	a, a
   9558 28 07         [12] 2390 	jr	Z,00102$
                           2391 ;src/main.c:545: cu.mover = SI;
   955A 3E 01         [ 7] 2392 	ld	a,#0x01
   955C 12            [ 7] 2393 	ld	(de),a
                           2394 ;src/main.c:546: cu.x++;
   955D 0A            [ 7] 2395 	ld	a,(bc)
   955E 3C            [ 4] 2396 	inc	a
   955F 02            [ 7] 2397 	ld	(bc),a
   9560 C9            [10] 2398 	ret
   9561                    2399 00102$:
                           2400 ;src/main.c:549: cu.mover=NO;
   9561 AF            [ 4] 2401 	xor	a, a
   9562 12            [ 7] 2402 	ld	(de),a
   9563 C9            [10] 2403 	ret
   9564                    2404 00122$:
                           2405 ;src/main.c:552: else if(cu.direccion == M_izquierda){
   9564 7D            [ 4] 2406 	ld	a,l
   9565 3D            [ 4] 2407 	dec	a
   9566 20 1F         [12] 2408 	jr	NZ,00119$
                           2409 ;src/main.c:553: if(checkKnifeCollision(M_derecha, -1, 0)){
   9568 C5            [11] 2410 	push	bc
   9569 D5            [11] 2411 	push	de
   956A 21 FF 00      [10] 2412 	ld	hl,#0x00FF
   956D E5            [11] 2413 	push	hl
   956E 2E 00         [ 7] 2414 	ld	l, #0x00
   9570 E5            [11] 2415 	push	hl
   9571 CD 0C 95      [17] 2416 	call	_checkKnifeCollision
   9574 F1            [10] 2417 	pop	af
   9575 F1            [10] 2418 	pop	af
   9576 D1            [10] 2419 	pop	de
   9577 C1            [10] 2420 	pop	bc
   9578 7D            [ 4] 2421 	ld	a,l
   9579 B7            [ 4] 2422 	or	a, a
   957A 28 08         [12] 2423 	jr	Z,00105$
                           2424 ;src/main.c:554: cu.mover = SI;
   957C 3E 01         [ 7] 2425 	ld	a,#0x01
   957E 12            [ 7] 2426 	ld	(de),a
                           2427 ;src/main.c:555: cu.x--;
   957F 0A            [ 7] 2428 	ld	a,(bc)
   9580 C6 FF         [ 7] 2429 	add	a,#0xFF
   9582 02            [ 7] 2430 	ld	(bc),a
   9583 C9            [10] 2431 	ret
   9584                    2432 00105$:
                           2433 ;src/main.c:557: cu.mover=NO;
   9584 AF            [ 4] 2434 	xor	a, a
   9585 12            [ 7] 2435 	ld	(de),a
   9586 C9            [10] 2436 	ret
   9587                    2437 00119$:
                           2438 ;src/main.c:563: cu.y--;
   9587 03            [ 6] 2439 	inc	bc
                           2440 ;src/main.c:560: else if(cu.direccion == M_arriba){
   9588 7D            [ 4] 2441 	ld	a,l
   9589 D6 02         [ 7] 2442 	sub	a, #0x02
   958B 20 22         [12] 2443 	jr	NZ,00116$
                           2444 ;src/main.c:561: if(checkKnifeCollision(M_derecha, 0, -2)){
   958D C5            [11] 2445 	push	bc
   958E D5            [11] 2446 	push	de
   958F 21 00 FE      [10] 2447 	ld	hl,#0xFE00
   9592 E5            [11] 2448 	push	hl
   9593 26 00         [ 7] 2449 	ld	h, #0x00
   9595 E5            [11] 2450 	push	hl
   9596 CD 0C 95      [17] 2451 	call	_checkKnifeCollision
   9599 F1            [10] 2452 	pop	af
   959A F1            [10] 2453 	pop	af
   959B D1            [10] 2454 	pop	de
   959C C1            [10] 2455 	pop	bc
   959D 7D            [ 4] 2456 	ld	a,l
   959E B7            [ 4] 2457 	or	a, a
   959F 28 0B         [12] 2458 	jr	Z,00108$
                           2459 ;src/main.c:562: cu.mover = SI;
   95A1 3E 01         [ 7] 2460 	ld	a,#0x01
   95A3 12            [ 7] 2461 	ld	(de),a
                           2462 ;src/main.c:563: cu.y--;
   95A4 0A            [ 7] 2463 	ld	a,(bc)
   95A5 C6 FF         [ 7] 2464 	add	a,#0xFF
   95A7 02            [ 7] 2465 	ld	(bc),a
                           2466 ;src/main.c:564: cu.y--;
   95A8 C6 FF         [ 7] 2467 	add	a,#0xFF
   95AA 02            [ 7] 2468 	ld	(bc),a
   95AB C9            [10] 2469 	ret
   95AC                    2470 00108$:
                           2471 ;src/main.c:567: cu.mover=NO;
   95AC AF            [ 4] 2472 	xor	a, a
   95AD 12            [ 7] 2473 	ld	(de),a
   95AE C9            [10] 2474 	ret
   95AF                    2475 00116$:
                           2476 ;src/main.c:570: else if(cu.direccion == M_abajo){
   95AF 7D            [ 4] 2477 	ld	a,l
   95B0 D6 03         [ 7] 2478 	sub	a, #0x03
   95B2 C0            [11] 2479 	ret	NZ
                           2480 ;src/main.c:571: if(checkKnifeCollision(M_derecha, 0, G_KNIFEY_0_H + 2)){
   95B3 C5            [11] 2481 	push	bc
   95B4 D5            [11] 2482 	push	de
   95B5 21 00 0A      [10] 2483 	ld	hl,#0x0A00
   95B8 E5            [11] 2484 	push	hl
   95B9 26 00         [ 7] 2485 	ld	h, #0x00
   95BB E5            [11] 2486 	push	hl
   95BC CD 0C 95      [17] 2487 	call	_checkKnifeCollision
   95BF F1            [10] 2488 	pop	af
   95C0 F1            [10] 2489 	pop	af
   95C1 D1            [10] 2490 	pop	de
   95C2 C1            [10] 2491 	pop	bc
   95C3 7D            [ 4] 2492 	ld	a,l
   95C4 B7            [ 4] 2493 	or	a, a
   95C5 28 09         [12] 2494 	jr	Z,00111$
                           2495 ;src/main.c:572: cu.mover = SI;
   95C7 3E 01         [ 7] 2496 	ld	a,#0x01
   95C9 12            [ 7] 2497 	ld	(de),a
                           2498 ;src/main.c:573: cu.y++;
   95CA 0A            [ 7] 2499 	ld	a,(bc)
   95CB 3C            [ 4] 2500 	inc	a
   95CC 02            [ 7] 2501 	ld	(bc),a
                           2502 ;src/main.c:574: cu.y++;
   95CD 3C            [ 4] 2503 	inc	a
   95CE 02            [ 7] 2504 	ld	(bc),a
   95CF C9            [10] 2505 	ret
   95D0                    2506 00111$:
                           2507 ;src/main.c:577: cu.mover=NO;
   95D0 AF            [ 4] 2508 	xor	a, a
   95D1 12            [ 7] 2509 	ld	(de),a
   95D2 C9            [10] 2510 	ret
                           2511 ;src/main.c:583: void barraPuntuacionInicial(){
                           2512 ;	---------------------------------
                           2513 ; Function barraPuntuacionInicial
                           2514 ; ---------------------------------
   95D3                    2515 _barraPuntuacionInicial::
                           2516 ;src/main.c:588: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   95D3 21 00 02      [10] 2517 	ld	hl,#0x0200
   95D6 E5            [11] 2518 	push	hl
   95D7 26 C0         [ 7] 2519 	ld	h, #0xC0
   95D9 E5            [11] 2520 	push	hl
   95DA CD 4B 88      [17] 2521 	call	_cpct_getScreenPtr
   95DD 4D            [ 4] 2522 	ld	c,l
   95DE 44            [ 4] 2523 	ld	b,h
                           2524 ;src/main.c:589: cpct_drawStringM0("SCORE", memptr, 1, 0);
   95DF 21 01 00      [10] 2525 	ld	hl,#0x0001
   95E2 E5            [11] 2526 	push	hl
   95E3 C5            [11] 2527 	push	bc
   95E4 21 7B 96      [10] 2528 	ld	hl,#___str_1
   95E7 E5            [11] 2529 	push	hl
   95E8 CD 7B 7C      [17] 2530 	call	_cpct_drawStringM0
   95EB 21 06 00      [10] 2531 	ld	hl,#6
   95EE 39            [11] 2532 	add	hl,sp
   95EF F9            [ 6] 2533 	ld	sp,hl
                           2534 ;src/main.c:590: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   95F0 21 00 0E      [10] 2535 	ld	hl,#0x0E00
   95F3 E5            [11] 2536 	push	hl
   95F4 26 C0         [ 7] 2537 	ld	h, #0xC0
   95F6 E5            [11] 2538 	push	hl
   95F7 CD 4B 88      [17] 2539 	call	_cpct_getScreenPtr
   95FA 4D            [ 4] 2540 	ld	c,l
   95FB 44            [ 4] 2541 	ld	b,h
                           2542 ;src/main.c:591: cpct_drawStringM0("00000", memptr, 15, 0);
   95FC 21 0F 00      [10] 2543 	ld	hl,#0x000F
   95FF E5            [11] 2544 	push	hl
   9600 C5            [11] 2545 	push	bc
   9601 21 81 96      [10] 2546 	ld	hl,#___str_2
   9604 E5            [11] 2547 	push	hl
   9605 CD 7B 7C      [17] 2548 	call	_cpct_drawStringM0
   9608 21 06 00      [10] 2549 	ld	hl,#6
   960B 39            [11] 2550 	add	hl,sp
   960C F9            [ 6] 2551 	ld	sp,hl
                           2552 ;src/main.c:594: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 14);
   960D 21 1A 0E      [10] 2553 	ld	hl,#0x0E1A
   9610 E5            [11] 2554 	push	hl
   9611 21 00 C0      [10] 2555 	ld	hl,#0xC000
   9614 E5            [11] 2556 	push	hl
   9615 CD 4B 88      [17] 2557 	call	_cpct_getScreenPtr
   9618 4D            [ 4] 2558 	ld	c,l
   9619 44            [ 4] 2559 	ld	b,h
                           2560 ;src/main.c:595: cpct_drawStringM0("ROBOBIT", memptr, 3, 0);
   961A 21 03 00      [10] 2561 	ld	hl,#0x0003
   961D E5            [11] 2562 	push	hl
   961E C5            [11] 2563 	push	bc
   961F 21 87 96      [10] 2564 	ld	hl,#___str_3
   9622 E5            [11] 2565 	push	hl
   9623 CD 7B 7C      [17] 2566 	call	_cpct_drawStringM0
   9626 21 06 00      [10] 2567 	ld	hl,#6
   9629 39            [11] 2568 	add	hl,sp
   962A F9            [ 6] 2569 	ld	sp,hl
                           2570 ;src/main.c:597: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   962B 21 3C 02      [10] 2571 	ld	hl,#0x023C
   962E E5            [11] 2572 	push	hl
   962F 21 00 C0      [10] 2573 	ld	hl,#0xC000
   9632 E5            [11] 2574 	push	hl
   9633 CD 4B 88      [17] 2575 	call	_cpct_getScreenPtr
   9636 4D            [ 4] 2576 	ld	c,l
   9637 44            [ 4] 2577 	ld	b,h
                           2578 ;src/main.c:598: cpct_drawStringM0("LIVES", memptr, 1, 0);
   9638 21 01 00      [10] 2579 	ld	hl,#0x0001
   963B E5            [11] 2580 	push	hl
   963C C5            [11] 2581 	push	bc
   963D 21 8F 96      [10] 2582 	ld	hl,#___str_4
   9640 E5            [11] 2583 	push	hl
   9641 CD 7B 7C      [17] 2584 	call	_cpct_drawStringM0
   9644 21 06 00      [10] 2585 	ld	hl,#6
   9647 39            [11] 2586 	add	hl,sp
   9648 F9            [ 6] 2587 	ld	sp,hl
                           2588 ;src/main.c:600: for(i=0; i<5; i++){
   9649 01 00 00      [10] 2589 	ld	bc,#0x0000
   964C                    2590 00102$:
                           2591 ;src/main.c:601: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   964C 79            [ 4] 2592 	ld	a,c
   964D 87            [ 4] 2593 	add	a, a
   964E 87            [ 4] 2594 	add	a, a
   964F C6 3C         [ 7] 2595 	add	a, #0x3C
   9651 57            [ 4] 2596 	ld	d,a
   9652 C5            [11] 2597 	push	bc
   9653 3E 0E         [ 7] 2598 	ld	a,#0x0E
   9655 F5            [11] 2599 	push	af
   9656 33            [ 6] 2600 	inc	sp
   9657 D5            [11] 2601 	push	de
   9658 33            [ 6] 2602 	inc	sp
   9659 21 00 C0      [10] 2603 	ld	hl,#0xC000
   965C E5            [11] 2604 	push	hl
   965D CD 4B 88      [17] 2605 	call	_cpct_getScreenPtr
   9660 EB            [ 4] 2606 	ex	de,hl
   9661 21 03 06      [10] 2607 	ld	hl,#0x0603
   9664 E5            [11] 2608 	push	hl
   9665 D5            [11] 2609 	push	de
   9666 21 60 78      [10] 2610 	ld	hl,#_g_heart
   9669 E5            [11] 2611 	push	hl
   966A CD 9F 7C      [17] 2612 	call	_cpct_drawSprite
   966D C1            [10] 2613 	pop	bc
                           2614 ;src/main.c:600: for(i=0; i<5; i++){
   966E 03            [ 6] 2615 	inc	bc
   966F 79            [ 4] 2616 	ld	a,c
   9670 D6 05         [ 7] 2617 	sub	a, #0x05
   9672 78            [ 4] 2618 	ld	a,b
   9673 17            [ 4] 2619 	rla
   9674 3F            [ 4] 2620 	ccf
   9675 1F            [ 4] 2621 	rra
   9676 DE 80         [ 7] 2622 	sbc	a, #0x80
   9678 38 D2         [12] 2623 	jr	C,00102$
   967A C9            [10] 2624 	ret
   967B                    2625 ___str_1:
   967B 53 43 4F 52 45     2626 	.ascii "SCORE"
   9680 00                 2627 	.db 0x00
   9681                    2628 ___str_2:
   9681 30 30 30 30 30     2629 	.ascii "00000"
   9686 00                 2630 	.db 0x00
   9687                    2631 ___str_3:
   9687 52 4F 42 4F 42 49  2632 	.ascii "ROBOBIT"
        54
   968E 00                 2633 	.db 0x00
   968F                    2634 ___str_4:
   968F 4C 49 56 45 53     2635 	.ascii "LIVES"
   9694 00                 2636 	.db 0x00
                           2637 ;src/main.c:606: void borrarPantallaArriba(u8 x, u8 y, u8 ancho, u8 alto){
                           2638 ;	---------------------------------
                           2639 ; Function borrarPantallaArriba
                           2640 ; ---------------------------------
   9695                    2641 _borrarPantallaArriba::
   9695 DD E5         [15] 2642 	push	ix
   9697 DD 21 00 00   [14] 2643 	ld	ix,#0
   969B DD 39         [15] 2644 	add	ix,sp
                           2645 ;src/main.c:609: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   969D DD 66 05      [19] 2646 	ld	h,5 (ix)
   96A0 DD 6E 04      [19] 2647 	ld	l,4 (ix)
   96A3 E5            [11] 2648 	push	hl
   96A4 21 00 C0      [10] 2649 	ld	hl,#0xC000
   96A7 E5            [11] 2650 	push	hl
   96A8 CD 4B 88      [17] 2651 	call	_cpct_getScreenPtr
   96AB 4D            [ 4] 2652 	ld	c,l
   96AC 44            [ 4] 2653 	ld	b,h
                           2654 ;src/main.c:610: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra la mitad derecha
   96AD DD 66 07      [19] 2655 	ld	h,7 (ix)
   96B0 DD 6E 06      [19] 2656 	ld	l,6 (ix)
   96B3 E5            [11] 2657 	push	hl
   96B4 AF            [ 4] 2658 	xor	a, a
   96B5 F5            [11] 2659 	push	af
   96B6 33            [ 6] 2660 	inc	sp
   96B7 C5            [11] 2661 	push	bc
   96B8 CD 71 87      [17] 2662 	call	_cpct_drawSolidBox
   96BB F1            [10] 2663 	pop	af
   96BC F1            [10] 2664 	pop	af
   96BD 33            [ 6] 2665 	inc	sp
                           2666 ;src/main.c:611: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   96BE DD 7E 04      [19] 2667 	ld	a,4 (ix)
   96C1 C6 28         [ 7] 2668 	add	a, #0x28
   96C3 47            [ 4] 2669 	ld	b,a
   96C4 DD 7E 05      [19] 2670 	ld	a,5 (ix)
   96C7 F5            [11] 2671 	push	af
   96C8 33            [ 6] 2672 	inc	sp
   96C9 C5            [11] 2673 	push	bc
   96CA 33            [ 6] 2674 	inc	sp
   96CB 21 00 C0      [10] 2675 	ld	hl,#0xC000
   96CE E5            [11] 2676 	push	hl
   96CF CD 4B 88      [17] 2677 	call	_cpct_getScreenPtr
   96D2 4D            [ 4] 2678 	ld	c,l
   96D3 44            [ 4] 2679 	ld	b,h
                           2680 ;src/main.c:612: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra la mitad izquierda
   96D4 DD 66 07      [19] 2681 	ld	h,7 (ix)
   96D7 DD 6E 06      [19] 2682 	ld	l,6 (ix)
   96DA E5            [11] 2683 	push	hl
   96DB AF            [ 4] 2684 	xor	a, a
   96DC F5            [11] 2685 	push	af
   96DD 33            [ 6] 2686 	inc	sp
   96DE C5            [11] 2687 	push	bc
   96DF CD 71 87      [17] 2688 	call	_cpct_drawSolidBox
   96E2 F1            [10] 2689 	pop	af
   96E3 F1            [10] 2690 	pop	af
   96E4 33            [ 6] 2691 	inc	sp
   96E5 DD E1         [14] 2692 	pop	ix
   96E7 C9            [10] 2693 	ret
                           2694 ;src/main.c:615: void menuInicio(){
                           2695 ;	---------------------------------
                           2696 ; Function menuInicio
                           2697 ; ---------------------------------
   96E8                    2698 _menuInicio::
                           2699 ;src/main.c:619: cpct_clearScreen(0);
   96E8 21 00 40      [10] 2700 	ld	hl,#0x4000
   96EB E5            [11] 2701 	push	hl
   96EC AF            [ 4] 2702 	xor	a, a
   96ED F5            [11] 2703 	push	af
   96EE 33            [ 6] 2704 	inc	sp
   96EF 26 C0         [ 7] 2705 	ld	h, #0xC0
   96F1 E5            [11] 2706 	push	hl
   96F2 CD 2A 7F      [17] 2707 	call	_cpct_memset
                           2708 ;src/main.c:621: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   96F5 21 1A 0F      [10] 2709 	ld	hl,#0x0F1A
   96F8 E5            [11] 2710 	push	hl
   96F9 21 00 C0      [10] 2711 	ld	hl,#0xC000
   96FC E5            [11] 2712 	push	hl
   96FD CD 4B 88      [17] 2713 	call	_cpct_getScreenPtr
   9700 4D            [ 4] 2714 	ld	c,l
   9701 44            [ 4] 2715 	ld	b,h
                           2716 ;src/main.c:622: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   9702 21 04 00      [10] 2717 	ld	hl,#0x0004
   9705 E5            [11] 2718 	push	hl
   9706 C5            [11] 2719 	push	bc
   9707 21 9B 97      [10] 2720 	ld	hl,#___str_5
   970A E5            [11] 2721 	push	hl
   970B CD 7B 7C      [17] 2722 	call	_cpct_drawStringM0
   970E 21 06 00      [10] 2723 	ld	hl,#6
   9711 39            [11] 2724 	add	hl,sp
   9712 F9            [ 6] 2725 	ld	sp,hl
                           2726 ;src/main.c:624: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   9713 21 28 6E      [10] 2727 	ld	hl,#0x6E28
   9716 E5            [11] 2728 	push	hl
   9717 21 F0 F0      [10] 2729 	ld	hl,#0xF0F0
   971A E5            [11] 2730 	push	hl
   971B 21 00 56      [10] 2731 	ld	hl,#_g_text_0
   971E E5            [11] 2732 	push	hl
   971F CD 9F 7C      [17] 2733 	call	_cpct_drawSprite
                           2734 ;src/main.c:625: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   9722 21 28 6E      [10] 2735 	ld	hl,#0x6E28
   9725 E5            [11] 2736 	push	hl
   9726 21 18 F1      [10] 2737 	ld	hl,#0xF118
   9729 E5            [11] 2738 	push	hl
   972A 21 30 67      [10] 2739 	ld	hl,#_g_text_1
   972D E5            [11] 2740 	push	hl
   972E CD 9F 7C      [17] 2741 	call	_cpct_drawSprite
                           2742 ;src/main.c:648: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   9731 21 08 A0      [10] 2743 	ld	hl,#0xA008
   9734 E5            [11] 2744 	push	hl
   9735 21 00 C0      [10] 2745 	ld	hl,#0xC000
   9738 E5            [11] 2746 	push	hl
   9739 CD 4B 88      [17] 2747 	call	_cpct_getScreenPtr
   973C 4D            [ 4] 2748 	ld	c,l
   973D 44            [ 4] 2749 	ld	b,h
                           2750 ;src/main.c:649: cpct_drawStringM0("TO START PRESS S", memptr, 4, 0);
   973E 21 04 00      [10] 2751 	ld	hl,#0x0004
   9741 E5            [11] 2752 	push	hl
   9742 C5            [11] 2753 	push	bc
   9743 21 A3 97      [10] 2754 	ld	hl,#___str_6
   9746 E5            [11] 2755 	push	hl
   9747 CD 7B 7C      [17] 2756 	call	_cpct_drawStringM0
   974A 21 06 00      [10] 2757 	ld	hl,#6
   974D 39            [11] 2758 	add	hl,sp
   974E F9            [ 6] 2759 	ld	sp,hl
                           2760 ;src/main.c:651: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 170); // centrado en horizontal y abajo en vertical
   974F 21 0A AA      [10] 2761 	ld	hl,#0xAA0A
   9752 E5            [11] 2762 	push	hl
   9753 21 00 C0      [10] 2763 	ld	hl,#0xC000
   9756 E5            [11] 2764 	push	hl
   9757 CD 4B 88      [17] 2765 	call	_cpct_getScreenPtr
   975A 4D            [ 4] 2766 	ld	c,l
   975B 44            [ 4] 2767 	ld	b,h
                           2768 ;src/main.c:652: cpct_drawStringM0("TO MENU PRESS M", memptr, 4, 0);
   975C 21 04 00      [10] 2769 	ld	hl,#0x0004
   975F E5            [11] 2770 	push	hl
   9760 C5            [11] 2771 	push	bc
   9761 21 B4 97      [10] 2772 	ld	hl,#___str_7
   9764 E5            [11] 2773 	push	hl
   9765 CD 7B 7C      [17] 2774 	call	_cpct_drawStringM0
   9768 21 06 00      [10] 2775 	ld	hl,#6
   976B 39            [11] 2776 	add	hl,sp
   976C F9            [ 6] 2777 	ld	sp,hl
                           2778 ;src/main.c:655: do{
   976D                    2779 00106$:
                           2780 ;src/main.c:656: cpct_scanKeyboard_f();
   976D CD 05 7C      [17] 2781 	call	_cpct_scanKeyboard_f
                           2782 ;src/main.c:660: if(cpct_isKeyPressed(Key_M)){
   9770 21 04 40      [10] 2783 	ld	hl,#0x4004
   9773 CD F9 7B      [17] 2784 	call	_cpct_isKeyPressed
   9776 7D            [ 4] 2785 	ld	a,l
   9777 B7            [ 4] 2786 	or	a, a
   9778 28 0D         [12] 2787 	jr	Z,00107$
                           2788 ;src/main.c:661: cpct_scanKeyboard_f();
   977A CD 05 7C      [17] 2789 	call	_cpct_scanKeyboard_f
                           2790 ;src/main.c:662: do{
   977D                    2791 00101$:
                           2792 ;src/main.c:664: } while(!cpct_isKeyPressed(Key_S));
   977D 21 07 10      [10] 2793 	ld	hl,#0x1007
   9780 CD F9 7B      [17] 2794 	call	_cpct_isKeyPressed
   9783 7D            [ 4] 2795 	ld	a,l
   9784 B7            [ 4] 2796 	or	a, a
   9785 28 F6         [12] 2797 	jr	Z,00101$
   9787                    2798 00107$:
                           2799 ;src/main.c:666: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   9787 21 07 10      [10] 2800 	ld	hl,#0x1007
   978A CD F9 7B      [17] 2801 	call	_cpct_isKeyPressed
   978D 7D            [ 4] 2802 	ld	a,l
   978E B7            [ 4] 2803 	or	a, a
   978F C0            [11] 2804 	ret	NZ
   9790 21 04 40      [10] 2805 	ld	hl,#0x4004
   9793 CD F9 7B      [17] 2806 	call	_cpct_isKeyPressed
   9796 7D            [ 4] 2807 	ld	a,l
   9797 B7            [ 4] 2808 	or	a, a
   9798 28 D3         [12] 2809 	jr	Z,00106$
   979A C9            [10] 2810 	ret
   979B                    2811 ___str_5:
   979B 52 4F 42 4F 42 49  2812 	.ascii "ROBOBIT"
        54
   97A2 00                 2813 	.db 0x00
   97A3                    2814 ___str_6:
   97A3 54 4F 20 53 54 41  2815 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   97B3 00                 2816 	.db 0x00
   97B4                    2817 ___str_7:
   97B4 54 4F 20 4D 45 4E  2818 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   97C3 00                 2819 	.db 0x00
                           2820 ;src/main.c:669: void inicializarCPC() {
                           2821 ;	---------------------------------
                           2822 ; Function inicializarCPC
                           2823 ; ---------------------------------
   97C4                    2824 _inicializarCPC::
                           2825 ;src/main.c:670: cpct_disableFirmware();
   97C4 CD 61 87      [17] 2826 	call	_cpct_disableFirmware
                           2827 ;src/main.c:671: cpct_setVideoMode(0);
   97C7 2E 00         [ 7] 2828 	ld	l,#0x00
   97C9 CD 0C 7F      [17] 2829 	call	_cpct_setVideoMode
                           2830 ;src/main.c:672: cpct_setBorder(HW_BLACK);
   97CC 21 10 14      [10] 2831 	ld	hl,#0x1410
   97CF E5            [11] 2832 	push	hl
   97D0 CD 6F 7C      [17] 2833 	call	_cpct_setPALColour
                           2834 ;src/main.c:673: cpct_setPalette(g_palette, 16);
   97D3 21 10 00      [10] 2835 	ld	hl,#0x0010
   97D6 E5            [11] 2836 	push	hl
   97D7 21 98 7A      [10] 2837 	ld	hl,#_g_palette
   97DA E5            [11] 2838 	push	hl
   97DB CD E2 7B      [17] 2839 	call	_cpct_setPalette
                           2840 ;src/main.c:674: cpct_akp_musicInit(G_song);
   97DE 21 00 3F      [10] 2841 	ld	hl,#_G_song
   97E1 E5            [11] 2842 	push	hl
   97E2 CD 3D 86      [17] 2843 	call	_cpct_akp_musicInit
   97E5 F1            [10] 2844 	pop	af
   97E6 C9            [10] 2845 	ret
                           2846 ;src/main.c:677: void inicializarEnemy() {
                           2847 ;	---------------------------------
                           2848 ; Function inicializarEnemy
                           2849 ; ---------------------------------
   97E7                    2850 _inicializarEnemy::
   97E7 DD E5         [15] 2851 	push	ix
   97E9 DD 21 00 00   [14] 2852 	ld	ix,#0
   97ED DD 39         [15] 2853 	add	ix,sp
   97EF 3B            [ 6] 2854 	dec	sp
                           2855 ;src/main.c:678: u8 i = (2 + num_mapa) + 1; //sacar distinto numero dependiendo del mapa
   97F0 3A F0 88      [13] 2856 	ld	a,(#_num_mapa + 0)
   97F3 C6 03         [ 7] 2857 	add	a, #0x03
   97F5 DD 77 FF      [19] 2858 	ld	-1 (ix),a
                           2859 ;src/main.c:683: actual = enemy;
   97F8 11 A8 88      [10] 2860 	ld	de,#_enemy+0
                           2861 ;src/main.c:684: while(--i){
   97FB                    2862 00101$:
   97FB DD 35 FF      [23] 2863 	dec	-1 (ix)
   97FE DD 7E FF      [19] 2864 	ld	a,-1 (ix)
   9801 B7            [ 4] 2865 	or	a, a
   9802 28 61         [12] 2866 	jr	Z,00104$
                           2867 ;src/main.c:685: actual->x = actual->px = spawnX[i];
   9804 4B            [ 4] 2868 	ld	c, e
   9805 42            [ 4] 2869 	ld	b, d
   9806 03            [ 6] 2870 	inc	bc
   9807 03            [ 6] 2871 	inc	bc
   9808 3E 0D         [ 7] 2872 	ld	a,#<(_spawnX)
   980A DD 86 FF      [19] 2873 	add	a, -1 (ix)
   980D 6F            [ 4] 2874 	ld	l,a
   980E 3E 89         [ 7] 2875 	ld	a,#>(_spawnX)
   9810 CE 00         [ 7] 2876 	adc	a, #0x00
   9812 67            [ 4] 2877 	ld	h,a
   9813 7E            [ 7] 2878 	ld	a,(hl)
   9814 02            [ 7] 2879 	ld	(bc),a
   9815 12            [ 7] 2880 	ld	(de),a
                           2881 ;src/main.c:686: actual->y = actual->py = spawnY[i];
   9816 D5            [11] 2882 	push	de
   9817 FD E1         [14] 2883 	pop	iy
   9819 FD 23         [10] 2884 	inc	iy
   981B 4B            [ 4] 2885 	ld	c, e
   981C 42            [ 4] 2886 	ld	b, d
   981D 03            [ 6] 2887 	inc	bc
   981E 03            [ 6] 2888 	inc	bc
   981F 03            [ 6] 2889 	inc	bc
   9820 3E 12         [ 7] 2890 	ld	a,#<(_spawnY)
   9822 DD 86 FF      [19] 2891 	add	a, -1 (ix)
   9825 6F            [ 4] 2892 	ld	l,a
   9826 3E 89         [ 7] 2893 	ld	a,#>(_spawnY)
   9828 CE 00         [ 7] 2894 	adc	a, #0x00
   982A 67            [ 4] 2895 	ld	h,a
   982B 7E            [ 7] 2896 	ld	a,(hl)
   982C 02            [ 7] 2897 	ld	(bc),a
   982D FD 77 00      [19] 2898 	ld	0 (iy), a
                           2899 ;src/main.c:687: actual->mover  = NO;
   9830 21 06 00      [10] 2900 	ld	hl,#0x0006
   9833 19            [11] 2901 	add	hl,de
   9834 36 00         [10] 2902 	ld	(hl),#0x00
                           2903 ;src/main.c:688: actual->mira   = M_abajo;
   9836 21 07 00      [10] 2904 	ld	hl,#0x0007
   9839 19            [11] 2905 	add	hl,de
   983A 36 03         [10] 2906 	ld	(hl),#0x03
                           2907 ;src/main.c:689: actual->sprite = g_enemy;
   983C 21 04 00      [10] 2908 	ld	hl,#0x0004
   983F 19            [11] 2909 	add	hl,de
   9840 36 72         [10] 2910 	ld	(hl),#<(_g_enemy)
   9842 23            [ 6] 2911 	inc	hl
   9843 36 78         [10] 2912 	ld	(hl),#>(_g_enemy)
                           2913 ;src/main.c:690: actual->muerto = NO;
   9845 21 08 00      [10] 2914 	ld	hl,#0x0008
   9848 19            [11] 2915 	add	hl,de
   9849 36 00         [10] 2916 	ld	(hl),#0x00
                           2917 ;src/main.c:691: actual->muertes = 0;
   984B 21 0C 00      [10] 2918 	ld	hl,#0x000C
   984E 19            [11] 2919 	add	hl,de
   984F 36 00         [10] 2920 	ld	(hl),#0x00
                           2921 ;src/main.c:692: actual->patroling = SI;
   9851 21 09 00      [10] 2922 	ld	hl,#0x0009
   9854 19            [11] 2923 	add	hl,de
   9855 36 01         [10] 2924 	ld	(hl),#0x01
                           2925 ;src/main.c:694: dibujarEnemigo(actual);
   9857 D5            [11] 2926 	push	de
   9858 D5            [11] 2927 	push	de
   9859 CD 92 8B      [17] 2928 	call	_dibujarEnemigo
   985C F1            [10] 2929 	pop	af
   985D D1            [10] 2930 	pop	de
                           2931 ;src/main.c:696: ++actual;
   985E 21 0D 00      [10] 2932 	ld	hl,#0x000D
   9861 19            [11] 2933 	add	hl,de
   9862 EB            [ 4] 2934 	ex	de,hl
   9863 18 96         [12] 2935 	jr	00101$
   9865                    2936 00104$:
   9865 33            [ 6] 2937 	inc	sp
   9866 DD E1         [14] 2938 	pop	ix
   9868 C9            [10] 2939 	ret
                           2940 ;src/main.c:700: void inicializarJuego() {
                           2941 ;	---------------------------------
                           2942 ; Function inicializarJuego
                           2943 ; ---------------------------------
   9869                    2944 _inicializarJuego::
                           2945 ;src/main.c:702: num_mapa = 0;
   9869 21 F0 88      [10] 2946 	ld	hl,#_num_mapa + 0
   986C 36 00         [10] 2947 	ld	(hl), #0x00
                           2948 ;src/main.c:703: mapa = mapas[num_mapa];
   986E 21 07 89      [10] 2949 	ld	hl, #_mapas + 0
   9871 7E            [ 7] 2950 	ld	a,(hl)
   9872 FD 21 EE 88   [14] 2951 	ld	iy,#_mapa
   9876 FD 77 00      [19] 2952 	ld	0 (iy),a
   9879 23            [ 6] 2953 	inc	hl
   987A 7E            [ 7] 2954 	ld	a,(hl)
   987B 32 EF 88      [13] 2955 	ld	(#_mapa + 1),a
                           2956 ;src/main.c:704: cpct_etm_setTileset2x4(g_tileset);
   987E 21 E0 54      [10] 2957 	ld	hl,#_g_tileset
   9881 CD D3 7D      [17] 2958 	call	_cpct_etm_setTileset2x4
                           2959 ;src/main.c:706: dibujarMapa();
   9884 CD F1 88      [17] 2960 	call	_dibujarMapa
                           2961 ;src/main.c:708: borrarPantallaArriba(0, 0, 40, 1);
   9887 21 28 01      [10] 2962 	ld	hl,#0x0128
   988A E5            [11] 2963 	push	hl
   988B 21 00 00      [10] 2964 	ld	hl,#0x0000
   988E E5            [11] 2965 	push	hl
   988F CD 95 96      [17] 2966 	call	_borrarPantallaArriba
   9892 F1            [10] 2967 	pop	af
   9893 F1            [10] 2968 	pop	af
                           2969 ;src/main.c:709: barraPuntuacionInicial();
   9894 CD D3 95      [17] 2970 	call	_barraPuntuacionInicial
                           2971 ;src/main.c:712: prota.x = prota.px = 4;
   9897 21 DE 88      [10] 2972 	ld	hl,#(_prota + 0x0002)
   989A 36 04         [10] 2973 	ld	(hl),#0x04
   989C 21 DC 88      [10] 2974 	ld	hl,#_prota
   989F 36 04         [10] 2975 	ld	(hl),#0x04
                           2976 ;src/main.c:713: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   98A1 21 DF 88      [10] 2977 	ld	hl,#(_prota + 0x0003)
   98A4 36 68         [10] 2978 	ld	(hl),#0x68
   98A6 21 DD 88      [10] 2979 	ld	hl,#(_prota + 0x0001)
   98A9 36 68         [10] 2980 	ld	(hl),#0x68
                           2981 ;src/main.c:714: prota.mover  = NO;
   98AB 21 E2 88      [10] 2982 	ld	hl,#(_prota + 0x0006)
   98AE 36 00         [10] 2983 	ld	(hl),#0x00
                           2984 ;src/main.c:715: prota.mira=M_derecha;
   98B0 21 E3 88      [10] 2985 	ld	hl,#(_prota + 0x0007)
   98B3 36 00         [10] 2986 	ld	(hl),#0x00
                           2987 ;src/main.c:716: prota.sprite = g_hero;
   98B5 21 A8 7A      [10] 2988 	ld	hl,#_g_hero
   98B8 22 E0 88      [16] 2989 	ld	((_prota + 0x0004)), hl
                           2990 ;src/main.c:720: cu.x = cu.px = 0;
   98BB 21 E6 88      [10] 2991 	ld	hl,#(_cu + 0x0002)
   98BE 36 00         [10] 2992 	ld	(hl),#0x00
   98C0 21 E4 88      [10] 2993 	ld	hl,#_cu
   98C3 36 00         [10] 2994 	ld	(hl),#0x00
                           2995 ;src/main.c:721: cu.y = cu.py = 0;
   98C5 21 E7 88      [10] 2996 	ld	hl,#(_cu + 0x0003)
   98C8 36 00         [10] 2997 	ld	(hl),#0x00
   98CA 21 E5 88      [10] 2998 	ld	hl,#(_cu + 0x0001)
   98CD 36 00         [10] 2999 	ld	(hl),#0x00
                           3000 ;src/main.c:722: cu.lanzado = NO;
   98CF 21 EA 88      [10] 3001 	ld	hl,#(_cu + 0x0006)
   98D2 36 00         [10] 3002 	ld	(hl),#0x00
                           3003 ;src/main.c:723: cu.mover = NO;
   98D4 21 ED 88      [10] 3004 	ld	hl,#(_cu + 0x0009)
   98D7 36 00         [10] 3005 	ld	(hl),#0x00
                           3006 ;src/main.c:725: inicializarEnemy();
   98D9 CD E7 97      [17] 3007 	call	_inicializarEnemy
                           3008 ;src/main.c:727: dibujarProta();
   98DC C3 17 89      [10] 3009 	jp  _dibujarProta
                           3010 ;src/main.c:730: void main(void) {
                           3011 ;	---------------------------------
                           3012 ; Function main
                           3013 ; ---------------------------------
   98DF                    3014 _main::
                           3015 ;src/main.c:734: inicializarCPC();
   98DF CD C4 97      [17] 3016 	call	_inicializarCPC
                           3017 ;src/main.c:735: menuInicio();
   98E2 CD E8 96      [17] 3018 	call	_menuInicio
                           3019 ;src/main.c:737: inicializarJuego();
   98E5 CD 69 98      [17] 3020 	call	_inicializarJuego
                           3021 ;src/main.c:738: cpct_akp_musicPlay();
   98E8 CD 3A 7F      [17] 3022 	call	_cpct_akp_musicPlay
                           3023 ;src/main.c:740: while (1) {
   98EB                    3024 00122$:
                           3025 ;src/main.c:742: i = (2 + num_mapa) + 1;
   98EB 21 F0 88      [10] 3026 	ld	hl,#_num_mapa + 0
   98EE 4E            [ 7] 3027 	ld	c, (hl)
   98EF 0C            [ 4] 3028 	inc	c
   98F0 0C            [ 4] 3029 	inc	c
   98F1 0C            [ 4] 3030 	inc	c
                           3031 ;src/main.c:743: actual = enemy;
                           3032 ;src/main.c:745: comprobarTeclado();
   98F2 C5            [11] 3033 	push	bc
   98F3 CD CB 94      [17] 3034 	call	_comprobarTeclado
   98F6 CD 2E 95      [17] 3035 	call	_moverCuchillo
   98F9 C1            [10] 3036 	pop	bc
                           3037 ;src/main.c:748: while(--i){
   98FA 11 A8 88      [10] 3038 	ld	de,#_enemy
   98FD                    3039 00101$:
   98FD 0D            [ 4] 3040 	dec c
   98FE 28 11         [12] 3041 	jr	Z,00103$
                           3042 ;src/main.c:749: moverEnemigo(actual);
   9900 C5            [11] 3043 	push	bc
   9901 D5            [11] 3044 	push	de
   9902 D5            [11] 3045 	push	de
   9903 CD 67 91      [17] 3046 	call	_moverEnemigo
   9906 F1            [10] 3047 	pop	af
   9907 D1            [10] 3048 	pop	de
   9908 C1            [10] 3049 	pop	bc
                           3050 ;src/main.c:750: ++actual;
   9909 21 0D 00      [10] 3051 	ld	hl,#0x000D
   990C 19            [11] 3052 	add	hl,de
   990D 5D            [ 4] 3053 	ld	e,l
   990E 54            [ 4] 3054 	ld	d,h
   990F 18 EC         [12] 3055 	jr	00101$
   9911                    3056 00103$:
                           3057 ;src/main.c:753: actual = enemy;
   9911 01 A8 88      [10] 3058 	ld	bc,#_enemy
                           3059 ;src/main.c:755: cpct_waitVSYNC();
   9914 C5            [11] 3060 	push	bc
   9915 CD 04 7F      [17] 3061 	call	_cpct_waitVSYNC
   9918 C1            [10] 3062 	pop	bc
                           3063 ;src/main.c:757: if (prota.mover) {
   9919 11 E2 88      [10] 3064 	ld	de,#_prota+6
   991C 1A            [ 7] 3065 	ld	a,(de)
   991D B7            [ 4] 3066 	or	a, a
   991E 28 09         [12] 3067 	jr	Z,00105$
                           3068 ;src/main.c:758: redibujarProta();
   9920 C5            [11] 3069 	push	bc
   9921 D5            [11] 3070 	push	de
   9922 CD E8 89      [17] 3071 	call	_redibujarProta
   9925 D1            [10] 3072 	pop	de
   9926 C1            [10] 3073 	pop	bc
                           3074 ;src/main.c:759: prota.mover = NO;
   9927 AF            [ 4] 3075 	xor	a, a
   9928 12            [ 7] 3076 	ld	(de),a
   9929                    3077 00105$:
                           3078 ;src/main.c:761: if(cu.lanzado && cu.mover){
   9929 21 EA 88      [10] 3079 	ld	hl,#_cu + 6
   992C 5E            [ 7] 3080 	ld	e,(hl)
   992D 21 ED 88      [10] 3081 	ld	hl,#_cu + 9
   9930 7B            [ 4] 3082 	ld	a,e
   9931 B7            [ 4] 3083 	or	a, a
   9932 28 0B         [12] 3084 	jr	Z,00110$
   9934 7E            [ 7] 3085 	ld	a,(hl)
   9935 B7            [ 4] 3086 	or	a, a
   9936 28 07         [12] 3087 	jr	Z,00110$
                           3088 ;src/main.c:762: redibujarCuchillo();
   9938 C5            [11] 3089 	push	bc
   9939 CD 9B 93      [17] 3090 	call	_redibujarCuchillo
   993C C1            [10] 3091 	pop	bc
   993D 18 0D         [12] 3092 	jr	00137$
   993F                    3093 00110$:
                           3094 ;src/main.c:763: }else if (cu.lanzado && !cu.mover){
   993F 7B            [ 4] 3095 	ld	a,e
   9940 B7            [ 4] 3096 	or	a, a
   9941 28 09         [12] 3097 	jr	Z,00137$
   9943 7E            [ 7] 3098 	ld	a,(hl)
   9944 B7            [ 4] 3099 	or	a, a
   9945 20 05         [12] 3100 	jr	NZ,00137$
                           3101 ;src/main.c:764: borrarCuchillo();
   9947 C5            [11] 3102 	push	bc
   9948 CD 1D 93      [17] 3103 	call	_borrarCuchillo
   994B C1            [10] 3104 	pop	bc
                           3105 ;src/main.c:767: while(--i){
   994C                    3106 00137$:
   994C 1E 05         [ 7] 3107 	ld	e,#0x05
   994E                    3108 00118$:
   994E 1D            [ 4] 3109 	dec	e
   994F 7B            [ 4] 3110 	ld	a,e
   9950 B7            [ 4] 3111 	or	a, a
   9951 28 49         [12] 3112 	jr	Z,00120$
                           3113 ;src/main.c:768: if(actual->mover){
   9953 C5            [11] 3114 	push	bc
   9954 FD E1         [14] 3115 	pop	iy
   9956 FD 7E 06      [19] 3116 	ld	a,6 (iy)
   9959 B7            [ 4] 3117 	or	a, a
   995A 28 09         [12] 3118 	jr	Z,00114$
                           3119 ;src/main.c:769: redibujarEnemigo(actual);
   995C C5            [11] 3120 	push	bc
   995D D5            [11] 3121 	push	de
   995E C5            [11] 3122 	push	bc
   995F CD 06 8D      [17] 3123 	call	_redibujarEnemigo
   9962 F1            [10] 3124 	pop	af
   9963 D1            [10] 3125 	pop	de
   9964 C1            [10] 3126 	pop	bc
   9965                    3127 00114$:
                           3128 ;src/main.c:771: if (actual->muerto && actual->muertes == 0){
   9965 C5            [11] 3129 	push	bc
   9966 FD E1         [14] 3130 	pop	iy
   9968 FD 7E 08      [19] 3131 	ld	a,8 (iy)
   996B B7            [ 4] 3132 	or	a, a
   996C 28 26         [12] 3133 	jr	Z,00116$
   996E 21 0C 00      [10] 3134 	ld	hl,#0x000C
   9971 09            [11] 3135 	add	hl,bc
   9972 7E            [ 7] 3136 	ld	a,(hl)
   9973 B7            [ 4] 3137 	or	a, a
   9974 20 1E         [12] 3138 	jr	NZ,00116$
                           3139 ;src/main.c:772: borrarEnemigo(actual);
   9976 E5            [11] 3140 	push	hl
   9977 C5            [11] 3141 	push	bc
   9978 D5            [11] 3142 	push	de
   9979 C5            [11] 3143 	push	bc
   997A CD 72 8C      [17] 3144 	call	_borrarEnemigo
   997D F1            [10] 3145 	pop	af
   997E D1            [10] 3146 	pop	de
   997F C1            [10] 3147 	pop	bc
   9980 C5            [11] 3148 	push	bc
   9981 D5            [11] 3149 	push	de
   9982 C5            [11] 3150 	push	bc
   9983 CD CA 8B      [17] 3151 	call	_dibujarExplosion
   9986 F1            [10] 3152 	pop	af
   9987 D1            [10] 3153 	pop	de
   9988 C1            [10] 3154 	pop	bc
   9989 E1            [10] 3155 	pop	hl
                           3156 ;src/main.c:775: actual->muertes++;
   998A 56            [ 7] 3157 	ld	d,(hl)
   998B 14            [ 4] 3158 	inc	d
   998C 72            [ 7] 3159 	ld	(hl),d
                           3160 ;src/main.c:776: actual->x = 0;
   998D AF            [ 4] 3161 	xor	a, a
   998E 02            [ 7] 3162 	ld	(bc),a
                           3163 ;src/main.c:777: actual->y = 0;
   998F 69            [ 4] 3164 	ld	l, c
   9990 60            [ 4] 3165 	ld	h, b
   9991 23            [ 6] 3166 	inc	hl
   9992 36 00         [10] 3167 	ld	(hl),#0x00
   9994                    3168 00116$:
                           3169 ;src/main.c:779: ++actual;
   9994 21 0D 00      [10] 3170 	ld	hl,#0x000D
   9997 09            [11] 3171 	add	hl,bc
   9998 4D            [ 4] 3172 	ld	c,l
   9999 44            [ 4] 3173 	ld	b,h
   999A 18 B2         [12] 3174 	jr	00118$
   999C                    3175 00120$:
                           3176 ;src/main.c:781: cpct_waitVSYNC();
   999C CD 04 7F      [17] 3177 	call	_cpct_waitVSYNC
   999F C3 EB 98      [10] 3178 	jp	00122$
                           3179 	.area _CODE
                           3180 	.area _INITIALIZER
                           3181 	.area _CABS (ABS)
   3F00                    3182 	.org 0x3F00
   3F00                    3183 _G_song:
   3F00 41                 3184 	.db #0x41	; 65	'A'
   3F01 54                 3185 	.db #0x54	; 84	'T'
   3F02 31                 3186 	.db #0x31	; 49	'1'
   3F03 30                 3187 	.db #0x30	; 48	'0'
   3F04 01                 3188 	.db #0x01	; 1
   3F05 40                 3189 	.db #0x40	; 64
   3F06 42                 3190 	.db #0x42	; 66	'B'
   3F07 0F                 3191 	.db #0x0F	; 15
   3F08 02                 3192 	.db #0x02	; 2
   3F09 06                 3193 	.db #0x06	; 6
   3F0A 1D                 3194 	.db #0x1D	; 29
   3F0B 00                 3195 	.db #0x00	; 0
   3F0C 10                 3196 	.db #0x10	; 16
   3F0D 40                 3197 	.db #0x40	; 64
   3F0E 19                 3198 	.db #0x19	; 25
   3F0F 40                 3199 	.db #0x40	; 64
   3F10 00                 3200 	.db #0x00	; 0
   3F11 00                 3201 	.db #0x00	; 0
   3F12 00                 3202 	.db #0x00	; 0
   3F13 00                 3203 	.db #0x00	; 0
   3F14 00                 3204 	.db #0x00	; 0
   3F15 00                 3205 	.db #0x00	; 0
   3F16 0D                 3206 	.db #0x0D	; 13
   3F17 12                 3207 	.db #0x12	; 18
   3F18 40                 3208 	.db #0x40	; 64
   3F19 01                 3209 	.db #0x01	; 1
   3F1A 00                 3210 	.db #0x00	; 0
   3F1B 7C                 3211 	.db #0x7C	; 124
   3F1C 18                 3212 	.db #0x18	; 24
   3F1D 78                 3213 	.db #0x78	; 120	'x'
   3F1E 0C                 3214 	.db #0x0C	; 12
   3F1F 34                 3215 	.db #0x34	; 52	'4'
   3F20 30                 3216 	.db #0x30	; 48	'0'
   3F21 2C                 3217 	.db #0x2C	; 44
   3F22 28                 3218 	.db #0x28	; 40
   3F23 24                 3219 	.db #0x24	; 36
   3F24 20                 3220 	.db #0x20	; 32
   3F25 1C                 3221 	.db #0x1C	; 28
   3F26 0D                 3222 	.db #0x0D	; 13
   3F27 25                 3223 	.db #0x25	; 37
   3F28 40                 3224 	.db #0x40	; 64
   3F29 20                 3225 	.db #0x20	; 32
   3F2A 00                 3226 	.db #0x00	; 0
   3F2B 00                 3227 	.db #0x00	; 0
   3F2C 00                 3228 	.db #0x00	; 0
   3F2D 39                 3229 	.db #0x39	; 57	'9'
   3F2E 40                 3230 	.db #0x40	; 64
   3F2F 00                 3231 	.db #0x00	; 0
   3F30 57                 3232 	.db #0x57	; 87	'W'
   3F31 40                 3233 	.db #0x40	; 64
   3F32 3B                 3234 	.db #0x3B	; 59
   3F33 40                 3235 	.db #0x40	; 64
   3F34 57                 3236 	.db #0x57	; 87	'W'
   3F35 40                 3237 	.db #0x40	; 64
   3F36 01                 3238 	.db #0x01	; 1
   3F37 2F                 3239 	.db #0x2F	; 47
   3F38 40                 3240 	.db #0x40	; 64
   3F39 19                 3241 	.db #0x19	; 25
   3F3A 00                 3242 	.db #0x00	; 0
   3F3B 76                 3243 	.db #0x76	; 118	'v'
   3F3C E1                 3244 	.db #0xE1	; 225
   3F3D 00                 3245 	.db #0x00	; 0
   3F3E 00                 3246 	.db #0x00	; 0
   3F3F 01                 3247 	.db #0x01	; 1
   3F40 04                 3248 	.db #0x04	; 4
   3F41 51                 3249 	.db #0x51	; 81	'Q'
   3F42 04                 3250 	.db #0x04	; 4
   3F43 37                 3251 	.db #0x37	; 55	'7'
   3F44 04                 3252 	.db #0x04	; 4
   3F45 4F                 3253 	.db #0x4F	; 79	'O'
   3F46 04                 3254 	.db #0x04	; 4
   3F47 37                 3255 	.db #0x37	; 55	'7'
   3F48 02                 3256 	.db #0x02	; 2
   3F49 4B                 3257 	.db #0x4B	; 75	'K'
   3F4A 02                 3258 	.db #0x02	; 2
   3F4B 37                 3259 	.db #0x37	; 55	'7'
   3F4C 04                 3260 	.db #0x04	; 4
   3F4D 4F                 3261 	.db #0x4F	; 79	'O'
   3F4E 04                 3262 	.db #0x04	; 4
   3F4F 37                 3263 	.db #0x37	; 55	'7'
   3F50 04                 3264 	.db #0x04	; 4
   3F51 4F                 3265 	.db #0x4F	; 79	'O'
   3F52 04                 3266 	.db #0x04	; 4
   3F53 37                 3267 	.db #0x37	; 55	'7'
   3F54 02                 3268 	.db #0x02	; 2
   3F55 4B                 3269 	.db #0x4B	; 75	'K'
   3F56 00                 3270 	.db #0x00	; 0
   3F57 42                 3271 	.db #0x42	; 66	'B'
   3F58 60                 3272 	.db #0x60	; 96
   3F59 00                 3273 	.db #0x00	; 0
   3F5A 42                 3274 	.db #0x42	; 66	'B'
   3F5B 80                 3275 	.db #0x80	; 128
   3F5C 00                 3276 	.db #0x00	; 0
   3F5D 00                 3277 	.db #0x00	; 0
   3F5E 42                 3278 	.db #0x42	; 66	'B'
   3F5F 00                 3279 	.db #0x00	; 0
   3F60 00                 3280 	.db #0x00	; 0
