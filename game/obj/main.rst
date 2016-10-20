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
                            123 ;src/main.c:121: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
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
                            164 ;src/main.c:124: void dibujarMapa() {
                            165 ;	---------------------------------
                            166 ; Function dibujarMapa
                            167 ; ---------------------------------
   88F1                     168 _dibujarMapa::
                            169 ;src/main.c:125: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
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
                            199 ;src/main.c:128: void dibujarProta() {
                            200 ;	---------------------------------
                            201 ; Function dibujarProta
                            202 ; ---------------------------------
   8917                     203 _dibujarProta::
                            204 ;src/main.c:129: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
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
                            217 ;src/main.c:130: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   892B ED 4B E0 88   [20]  218 	ld	bc, (#_prota + 4)
   892F 21 00 3E      [10]  219 	ld	hl,#_g_tablatrans
   8932 E5            [11]  220 	push	hl
   8933 21 07 16      [10]  221 	ld	hl,#0x1607
   8936 E5            [11]  222 	push	hl
   8937 D5            [11]  223 	push	de
   8938 C5            [11]  224 	push	bc
   8939 CD 6B 88      [17]  225 	call	_cpct_drawSpriteMaskedAlignedTable
   893C C9            [10]  226 	ret
                            227 ;src/main.c:133: void borrarProta() {
                            228 ;	---------------------------------
                            229 ; Function borrarProta
                            230 ; ---------------------------------
   893D                     231 _borrarProta::
   893D DD E5         [15]  232 	push	ix
   893F DD 21 00 00   [14]  233 	ld	ix,#0
   8943 DD 39         [15]  234 	add	ix,sp
   8945 F5            [11]  235 	push	af
   8946 3B            [ 6]  236 	dec	sp
                            237 ;src/main.c:135: u8 w = 4 + (prota.px & 1);
   8947 21 DE 88      [10]  238 	ld	hl, #_prota + 2
   894A 4E            [ 7]  239 	ld	c,(hl)
   894B 79            [ 4]  240 	ld	a,c
   894C E6 01         [ 7]  241 	and	a, #0x01
   894E 47            [ 4]  242 	ld	b,a
   894F 04            [ 4]  243 	inc	b
   8950 04            [ 4]  244 	inc	b
   8951 04            [ 4]  245 	inc	b
   8952 04            [ 4]  246 	inc	b
                            247 ;src/main.c:138: u8 h = 6 + (prota.py & 2 ? 1 : 0);
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
                            259 ;src/main.c:140: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
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
                            301 ;src/main.c:143: void menuFin(){
                            302 ;	---------------------------------
                            303 ; Function menuFin
                            304 ; ---------------------------------
   89B1                     305 _menuFin::
                            306 ;src/main.c:146: cpct_clearScreen(0);
   89B1 21 00 40      [10]  307 	ld	hl,#0x4000
   89B4 E5            [11]  308 	push	hl
   89B5 AF            [ 4]  309 	xor	a, a
   89B6 F5            [11]  310 	push	af
   89B7 33            [ 6]  311 	inc	sp
   89B8 26 C0         [ 7]  312 	ld	h, #0xC0
   89BA E5            [11]  313 	push	hl
   89BB CD 2A 7F      [17]  314 	call	_cpct_memset
                            315 ;src/main.c:148: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   89BE 21 18 5A      [10]  316 	ld	hl,#0x5A18
   89C1 E5            [11]  317 	push	hl
   89C2 21 00 C0      [10]  318 	ld	hl,#0xC000
   89C5 E5            [11]  319 	push	hl
   89C6 CD 4B 88      [17]  320 	call	_cpct_getScreenPtr
   89C9 4D            [ 4]  321 	ld	c,l
   89CA 44            [ 4]  322 	ld	b,h
                            323 ;src/main.c:149: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   89CB 21 02 00      [10]  324 	ld	hl,#0x0002
   89CE E5            [11]  325 	push	hl
   89CF C5            [11]  326 	push	bc
   89D0 21 DE 89      [10]  327 	ld	hl,#___str_0
   89D3 E5            [11]  328 	push	hl
   89D4 CD 7B 7C      [17]  329 	call	_cpct_drawStringM0
   89D7 21 06 00      [10]  330 	ld	hl,#6
   89DA 39            [11]  331 	add	hl,sp
   89DB F9            [ 6]  332 	ld	sp,hl
                            333 ;src/main.c:151: while(1){}
   89DC                     334 00102$:
   89DC 18 FE         [12]  335 	jr	00102$
   89DE                     336 ___str_0:
   89DE 47 41 4D 45 20 4F   337 	.ascii "GAME OVER"
        56 45 52
   89E7 00                  338 	.db 0x00
                            339 ;src/main.c:154: void redibujarProta() {
                            340 ;	---------------------------------
                            341 ; Function redibujarProta
                            342 ; ---------------------------------
   89E8                     343 _redibujarProta::
                            344 ;src/main.c:155: borrarProta();
   89E8 CD 3D 89      [17]  345 	call	_borrarProta
                            346 ;src/main.c:156: prota.px = prota.x;
   89EB 01 DE 88      [10]  347 	ld	bc,#_prota + 2
   89EE 3A DC 88      [13]  348 	ld	a, (#_prota + 0)
   89F1 02            [ 7]  349 	ld	(bc),a
                            350 ;src/main.c:157: prota.py = prota.y;
   89F2 01 DF 88      [10]  351 	ld	bc,#_prota + 3
   89F5 3A DD 88      [13]  352 	ld	a, (#_prota + 1)
   89F8 02            [ 7]  353 	ld	(bc),a
                            354 ;src/main.c:158: dibujarProta();
   89F9 C3 17 89      [10]  355 	jp  _dibujarProta
                            356 ;src/main.c:161: u8* getTilePtr(u8 x, u8 y) {
                            357 ;	---------------------------------
                            358 ; Function getTilePtr
                            359 ; ---------------------------------
   89FC                     360 _getTilePtr::
   89FC DD E5         [15]  361 	push	ix
   89FE DD 21 00 00   [14]  362 	ld	ix,#0
   8A02 DD 39         [15]  363 	add	ix,sp
                            364 ;src/main.c:162: return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
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
                            403 ;src/main.c:165: u8 checkCollision(int direction) { // check optimization
                            404 ;	---------------------------------
                            405 ; Function checkCollision
                            406 ; ---------------------------------
   8A3D                     407 _checkCollision::
   8A3D DD E5         [15]  408 	push	ix
   8A3F DD 21 00 00   [14]  409 	ld	ix,#0
   8A43 DD 39         [15]  410 	add	ix,sp
   8A45 F5            [11]  411 	push	af
                            412 ;src/main.c:166: u8 *headTile=0, *feetTile=0, *waistTile=0;
   8A46 21 00 00      [10]  413 	ld	hl,#0x0000
   8A49 E3            [19]  414 	ex	(sp), hl
   8A4A 11 00 00      [10]  415 	ld	de,#0x0000
   8A4D 01 00 00      [10]  416 	ld	bc,#0x0000
                            417 ;src/main.c:168: switch (direction) {
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
                            440 ;src/main.c:169: case 0:
   8A81                     441 00101$:
                            442 ;src/main.c:170: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
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
                            462 ;src/main.c:171: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
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
                            480 ;src/main.c:172: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
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
                            496 ;src/main.c:173: break;
   8AC9 C3 71 8B      [10]  497 	jp	00105$
                            498 ;src/main.c:174: case 1:
   8ACC                     499 00102$:
                            500 ;src/main.c:175: headTile  = getTilePtr(prota.x - 1, prota.y);
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
                            515 ;src/main.c:176: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
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
                            529 ;src/main.c:177: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
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
                            545 ;src/main.c:178: break;
   8B0B 18 64         [12]  546 	jr	00105$
                            547 ;src/main.c:179: case 2:
   8B0D                     548 00103$:
                            549 ;src/main.c:180: headTile   = getTilePtr(prota.x, prota.y - 2);
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
                            565 ;src/main.c:181: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
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
                            581 ;src/main.c:182: *waistTile = 0;
   8B39 21 00 00      [10]  582 	ld	hl,#0x0000
   8B3C 36 00         [10]  583 	ld	(hl),#0x00
                            584 ;src/main.c:183: break;
   8B3E 18 31         [12]  585 	jr	00105$
                            586 ;src/main.c:184: case 3:
   8B40                     587 00104$:
                            588 ;src/main.c:185: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
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
                            604 ;src/main.c:186: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
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
                            619 ;src/main.c:187: *waistTile = 0;
   8B6C 21 00 00      [10]  620 	ld	hl,#0x0000
   8B6F 36 00         [10]  621 	ld	(hl),#0x00
                            622 ;src/main.c:189: }
   8B71                     623 00105$:
                            624 ;src/main.c:191: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
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
                            642 ;src/main.c:192: return 1;
   8B87 2E 01         [ 7]  643 	ld	l,#0x01
   8B89 18 02         [12]  644 	jr	00110$
   8B8B                     645 00107$:
                            646 ;src/main.c:194: return 0;
   8B8B 2E 00         [ 7]  647 	ld	l,#0x00
   8B8D                     648 00110$:
   8B8D DD F9         [10]  649 	ld	sp, ix
   8B8F DD E1         [14]  650 	pop	ix
   8B91 C9            [10]  651 	ret
                            652 ;src/main.c:197: void dibujarEnemigo(TEnemy *enemy) {
                            653 ;	---------------------------------
                            654 ; Function dibujarEnemigo
                            655 ; ---------------------------------
   8B92                     656 _dibujarEnemigo::
   8B92 DD E5         [15]  657 	push	ix
   8B94 DD 21 00 00   [14]  658 	ld	ix,#0
   8B98 DD 39         [15]  659 	add	ix,sp
                            660 ;src/main.c:198: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
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
                            677 ;src/main.c:199: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
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
                            693 ;src/main.c:202: void dibujarExplosion(TEnemy *enemy) {
                            694 ;	---------------------------------
                            695 ; Function dibujarExplosion
                            696 ; ---------------------------------
   8BCA                     697 _dibujarExplosion::
   8BCA DD E5         [15]  698 	push	ix
   8BCC DD 21 00 00   [14]  699 	ld	ix,#0
   8BD0 DD 39         [15]  700 	add	ix,sp
                            701 ;src/main.c:203: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
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
                            719 ;src/main.c:204: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
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
                            730 ;src/main.c:207: void borrarExplosion() {
                            731 ;	---------------------------------
                            732 ; Function borrarExplosion
                            733 ; ---------------------------------
   8BFE                     734 _borrarExplosion::
   8BFE DD E5         [15]  735 	push	ix
   8C00 DD 21 00 00   [14]  736 	ld	ix,#0
   8C04 DD 39         [15]  737 	add	ix,sp
   8C06 F5            [11]  738 	push	af
   8C07 3B            [ 6]  739 	dec	sp
                            740 ;src/main.c:208: u8 w = 4 + (enemy->px & 1);
   8C08 21 AA 88      [10]  741 	ld	hl, #_enemy + 2
   8C0B 4E            [ 7]  742 	ld	c,(hl)
   8C0C 79            [ 4]  743 	ld	a,c
   8C0D E6 01         [ 7]  744 	and	a, #0x01
   8C0F 47            [ 4]  745 	ld	b,a
   8C10 04            [ 4]  746 	inc	b
   8C11 04            [ 4]  747 	inc	b
   8C12 04            [ 4]  748 	inc	b
   8C13 04            [ 4]  749 	inc	b
                            750 ;src/main.c:211: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
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
                            762 ;src/main.c:213: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
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
                            804 ;src/main.c:217: void borrarEnemigo(TEnemy *enemy) {
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
                            815 ;src/main.c:219: u8 w = 4 + (enemy->px & 1);
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
                            827 ;src/main.c:222: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
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
                            843 ;src/main.c:224: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
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
                            882 ;src/main.c:226: enemy->mover = NO;
   8CFB 21 06 00      [10]  883 	ld	hl,#0x0006
   8CFE 09            [11]  884 	add	hl,bc
   8CFF 36 00         [10]  885 	ld	(hl),#0x00
   8D01 DD F9         [10]  886 	ld	sp, ix
   8D03 DD E1         [14]  887 	pop	ix
   8D05 C9            [10]  888 	ret
                            889 ;src/main.c:229: void redibujarEnemigo(TEnemy *enemy) {
                            890 ;	---------------------------------
                            891 ; Function redibujarEnemigo
                            892 ; ---------------------------------
   8D06                     893 _redibujarEnemigo::
   8D06 DD E5         [15]  894 	push	ix
   8D08 DD 21 00 00   [14]  895 	ld	ix,#0
   8D0C DD 39         [15]  896 	add	ix,sp
                            897 ;src/main.c:230: borrarEnemigo(enemy);
   8D0E DD 6E 04      [19]  898 	ld	l,4 (ix)
   8D11 DD 66 05      [19]  899 	ld	h,5 (ix)
   8D14 E5            [11]  900 	push	hl
   8D15 CD 72 8C      [17]  901 	call	_borrarEnemigo
   8D18 F1            [10]  902 	pop	af
                            903 ;src/main.c:231: enemy->px = enemy->x;
   8D19 DD 4E 04      [19]  904 	ld	c,4 (ix)
   8D1C DD 46 05      [19]  905 	ld	b,5 (ix)
   8D1F 59            [ 4]  906 	ld	e, c
   8D20 50            [ 4]  907 	ld	d, b
   8D21 13            [ 6]  908 	inc	de
   8D22 13            [ 6]  909 	inc	de
   8D23 0A            [ 7]  910 	ld	a,(bc)
   8D24 12            [ 7]  911 	ld	(de),a
                            912 ;src/main.c:232: enemy->py = enemy->y;
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
                            923 ;src/main.c:233: dibujarEnemigo(enemy);
   8D2F C5            [11]  924 	push	bc
   8D30 CD 92 8B      [17]  925 	call	_dibujarEnemigo
   8D33 F1            [10]  926 	pop	af
   8D34 DD E1         [14]  927 	pop	ix
   8D36 C9            [10]  928 	ret
                            929 ;src/main.c:236: u8 checkEnemyCollision(int direction, TEnemy *enemy){
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
                            940 ;src/main.c:238: u8 colisiona = 1;
   8D44 DD 36 F7 01   [19]  941 	ld	-9 (ix),#0x01
                            942 ;src/main.c:240: switch (direction) {
   8D48 DD CB 05 7E   [20]  943 	bit	7, 5 (ix)
   8D4C C2 53 8F      [10]  944 	jp	NZ,00135$
   8D4F 3E 03         [ 7]  945 	ld	a,#0x03
   8D51 DD BE 04      [19]  946 	cp	a, 4 (ix)
   8D54 3E 00         [ 7]  947 	ld	a,#0x00
   8D56 DD 9E 05      [19]  948 	sbc	a, 5 (ix)
   8D59 E2 5E 8D      [10]  949 	jp	PO, 00194$
   8D5C EE 80         [ 7]  950 	xor	a, #0x80
   8D5E                     951 00194$:
   8D5E FA 53 8F      [10]  952 	jp	M,00135$
                            953 ;src/main.c:246: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   8D61 DD 4E 06      [19]  954 	ld	c,6 (ix)
   8D64 DD 46 07      [19]  955 	ld	b,7 (ix)
   8D67 21 01 00      [10]  956 	ld	hl,#0x0001
   8D6A 09            [11]  957 	add	hl,bc
   8D6B DD 75 FC      [19]  958 	ld	-4 (ix),l
   8D6E DD 74 FD      [19]  959 	ld	-3 (ix),h
                            960 ;src/main.c:257: enemy->muerto = SI;
   8D71 21 08 00      [10]  961 	ld	hl,#0x0008
   8D74 09            [11]  962 	add	hl,bc
   8D75 DD 75 FA      [19]  963 	ld	-6 (ix),l
   8D78 DD 74 FB      [19]  964 	ld	-5 (ix),h
                            965 ;src/main.c:264: enemy->mira = M_abajo;
   8D7B 21 07 00      [10]  966 	ld	hl,#0x0007
   8D7E 09            [11]  967 	add	hl,bc
   8D7F DD 75 FE      [19]  968 	ld	-2 (ix),l
   8D82 DD 74 FF      [19]  969 	ld	-1 (ix),h
                            970 ;src/main.c:240: switch (direction) {
   8D85 DD 5E 04      [19]  971 	ld	e,4 (ix)
   8D88 16 00         [ 7]  972 	ld	d,#0x00
   8D8A 21 91 8D      [10]  973 	ld	hl,#00195$
   8D8D 19            [11]  974 	add	hl,de
   8D8E 19            [11]  975 	add	hl,de
   8D8F 19            [11]  976 	add	hl,de
   8D90 E9            [ 4]  977 	jp	(hl)
   8D91                     978 00195$:
   8D91 C3 53 8F      [10]  979 	jp	00135$
   8D94 C3 53 8F      [10]  980 	jp	00135$
   8D97 C3 A3 8D      [10]  981 	jp	00103$
   8D9A C3 79 8E      [10]  982 	jp	00119$
                            983 ;src/main.c:241: case 0:
                            984 ;src/main.c:242: break;
   8D9D C3 53 8F      [10]  985 	jp	00135$
                            986 ;src/main.c:243: case 1:
                            987 ;src/main.c:244: break;
   8DA0 C3 53 8F      [10]  988 	jp	00135$
                            989 ;src/main.c:245: case 2:
   8DA3                     990 00103$:
                            991 ;src/main.c:246: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   8DA3 DD 6E FC      [19]  992 	ld	l,-4 (ix)
   8DA6 DD 66 FD      [19]  993 	ld	h,-3 (ix)
   8DA9 56            [ 7]  994 	ld	d,(hl)
   8DAA 15            [ 4]  995 	dec	d
   8DAB 15            [ 4]  996 	dec	d
   8DAC 0A            [ 7]  997 	ld	a,(bc)
   8DAD C5            [11]  998 	push	bc
   8DAE D5            [11]  999 	push	de
   8DAF 33            [ 6] 1000 	inc	sp
   8DB0 F5            [11] 1001 	push	af
   8DB1 33            [ 6] 1002 	inc	sp
   8DB2 CD FC 89      [17] 1003 	call	_getTilePtr
   8DB5 F1            [10] 1004 	pop	af
   8DB6 C1            [10] 1005 	pop	bc
   8DB7 5E            [ 7] 1006 	ld	e,(hl)
   8DB8 3E 02         [ 7] 1007 	ld	a,#0x02
   8DBA 93            [ 4] 1008 	sub	a, e
   8DBB DA 71 8E      [10] 1009 	jp	C,00115$
                           1010 ;src/main.c:247: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   8DBE DD 6E FC      [19] 1011 	ld	l,-4 (ix)
   8DC1 DD 66 FD      [19] 1012 	ld	h,-3 (ix)
   8DC4 56            [ 7] 1013 	ld	d,(hl)
   8DC5 15            [ 4] 1014 	dec	d
   8DC6 15            [ 4] 1015 	dec	d
   8DC7 0A            [ 7] 1016 	ld	a,(bc)
   8DC8 C6 02         [ 7] 1017 	add	a, #0x02
   8DCA C5            [11] 1018 	push	bc
   8DCB D5            [11] 1019 	push	de
   8DCC 33            [ 6] 1020 	inc	sp
   8DCD F5            [11] 1021 	push	af
   8DCE 33            [ 6] 1022 	inc	sp
   8DCF CD FC 89      [17] 1023 	call	_getTilePtr
   8DD2 F1            [10] 1024 	pop	af
   8DD3 C1            [10] 1025 	pop	bc
   8DD4 5E            [ 7] 1026 	ld	e,(hl)
   8DD5 3E 02         [ 7] 1027 	ld	a,#0x02
   8DD7 93            [ 4] 1028 	sub	a, e
   8DD8 DA 71 8E      [10] 1029 	jp	C,00115$
                           1030 ;src/main.c:248: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   8DDB DD 6E FC      [19] 1031 	ld	l,-4 (ix)
   8DDE DD 66 FD      [19] 1032 	ld	h,-3 (ix)
   8DE1 56            [ 7] 1033 	ld	d,(hl)
   8DE2 15            [ 4] 1034 	dec	d
   8DE3 15            [ 4] 1035 	dec	d
   8DE4 0A            [ 7] 1036 	ld	a,(bc)
   8DE5 C6 04         [ 7] 1037 	add	a, #0x04
   8DE7 C5            [11] 1038 	push	bc
   8DE8 D5            [11] 1039 	push	de
   8DE9 33            [ 6] 1040 	inc	sp
   8DEA F5            [11] 1041 	push	af
   8DEB 33            [ 6] 1042 	inc	sp
   8DEC CD FC 89      [17] 1043 	call	_getTilePtr
   8DEF F1            [10] 1044 	pop	af
   8DF0 C1            [10] 1045 	pop	bc
   8DF1 5E            [ 7] 1046 	ld	e,(hl)
   8DF2 3E 02         [ 7] 1047 	ld	a,#0x02
   8DF4 93            [ 4] 1048 	sub	a, e
   8DF5 38 7A         [12] 1049 	jr	C,00115$
                           1050 ;src/main.c:250: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   8DF7 21 E4 88      [10] 1051 	ld	hl, #_cu + 0
   8DFA 5E            [ 7] 1052 	ld	e,(hl)
   8DFB 16 00         [ 7] 1053 	ld	d,#0x00
   8DFD 21 02 00      [10] 1054 	ld	hl,#0x0002
   8E00 19            [11] 1055 	add	hl,de
   8E01 DD 75 F8      [19] 1056 	ld	-8 (ix),l
   8E04 DD 74 F9      [19] 1057 	ld	-7 (ix),h
   8E07 0A            [ 7] 1058 	ld	a,(bc)
   8E08 6F            [ 4] 1059 	ld	l,a
   8E09 26 00         [ 7] 1060 	ld	h,#0x00
   8E0B DD 7E F8      [19] 1061 	ld	a,-8 (ix)
   8E0E 95            [ 4] 1062 	sub	a, l
   8E0F DD 7E F9      [19] 1063 	ld	a,-7 (ix)
   8E12 9C            [ 4] 1064 	sbc	a, h
   8E13 E2 18 8E      [10] 1065 	jp	PO, 00196$
   8E16 EE 80         [ 7] 1066 	xor	a, #0x80
   8E18                    1067 00196$:
   8E18 FA 2B 8E      [10] 1068 	jp	M,00110$
   8E1B 23            [ 6] 1069 	inc	hl
   8E1C 23            [ 6] 1070 	inc	hl
   8E1D 23            [ 6] 1071 	inc	hl
   8E1E 23            [ 6] 1072 	inc	hl
   8E1F 7D            [ 4] 1073 	ld	a,l
   8E20 93            [ 4] 1074 	sub	a, e
   8E21 7C            [ 4] 1075 	ld	a,h
   8E22 9A            [ 4] 1076 	sbc	a, d
   8E23 E2 28 8E      [10] 1077 	jp	PO, 00197$
   8E26 EE 80         [ 7] 1078 	xor	a, #0x80
   8E28                    1079 00197$:
   8E28 F2 31 8E      [10] 1080 	jp	P,00111$
   8E2B                    1081 00110$:
                           1082 ;src/main.c:251: colisiona = 0;
   8E2B DD 36 F7 00   [19] 1083 	ld	-9 (ix),#0x00
   8E2F 18 48         [12] 1084 	jr	00119$
   8E31                    1085 00111$:
                           1086 ;src/main.c:253: if(enemy->y>cu.y){
   8E31 DD 6E FC      [19] 1087 	ld	l,-4 (ix)
   8E34 DD 66 FD      [19] 1088 	ld	h,-3 (ix)
   8E37 5E            [ 7] 1089 	ld	e,(hl)
   8E38 21 E5 88      [10] 1090 	ld	hl, #(_cu + 0x0001) + 0
   8E3B 6E            [ 7] 1091 	ld	l,(hl)
   8E3C 7D            [ 4] 1092 	ld	a,l
   8E3D 93            [ 4] 1093 	sub	a, e
   8E3E 30 2B         [12] 1094 	jr	NC,00108$
                           1095 ;src/main.c:254: if(enemy->y - (cu.y + G_KNIFEY_0_H -2) >= 2){
   8E40 16 00         [ 7] 1096 	ld	d,#0x00
   8E42 26 00         [ 7] 1097 	ld	h,#0x00
   8E44 D5            [11] 1098 	push	de
   8E45 11 06 00      [10] 1099 	ld	de,#0x0006
   8E48 19            [11] 1100 	add	hl, de
   8E49 D1            [10] 1101 	pop	de
   8E4A 7B            [ 4] 1102 	ld	a,e
   8E4B 95            [ 4] 1103 	sub	a, l
   8E4C 5F            [ 4] 1104 	ld	e,a
   8E4D 7A            [ 4] 1105 	ld	a,d
   8E4E 9C            [ 4] 1106 	sbc	a, h
   8E4F 57            [ 4] 1107 	ld	d,a
   8E50 7B            [ 4] 1108 	ld	a,e
   8E51 D6 02         [ 7] 1109 	sub	a, #0x02
   8E53 7A            [ 4] 1110 	ld	a,d
   8E54 17            [ 4] 1111 	rla
   8E55 3F            [ 4] 1112 	ccf
   8E56 1F            [ 4] 1113 	rra
   8E57 DE 80         [ 7] 1114 	sbc	a, #0x80
   8E59 38 06         [12] 1115 	jr	C,00105$
                           1116 ;src/main.c:255: colisiona = 0;
   8E5B DD 36 F7 00   [19] 1117 	ld	-9 (ix),#0x00
   8E5F 18 18         [12] 1118 	jr	00119$
   8E61                    1119 00105$:
                           1120 ;src/main.c:257: enemy->muerto = SI;
   8E61 DD 6E FA      [19] 1121 	ld	l,-6 (ix)
   8E64 DD 66 FB      [19] 1122 	ld	h,-5 (ix)
   8E67 36 01         [10] 1123 	ld	(hl),#0x01
   8E69 18 0E         [12] 1124 	jr	00119$
   8E6B                    1125 00108$:
                           1126 ;src/main.c:260: colisiona = 0;
   8E6B DD 36 F7 00   [19] 1127 	ld	-9 (ix),#0x00
   8E6F 18 08         [12] 1128 	jr	00119$
   8E71                    1129 00115$:
                           1130 ;src/main.c:264: enemy->mira = M_abajo;
   8E71 DD 6E FE      [19] 1131 	ld	l,-2 (ix)
   8E74 DD 66 FF      [19] 1132 	ld	h,-1 (ix)
   8E77 36 03         [10] 1133 	ld	(hl),#0x03
                           1134 ;src/main.c:267: case 3:
   8E79                    1135 00119$:
                           1136 ;src/main.c:268: if( *getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   8E79 DD 6E FC      [19] 1137 	ld	l,-4 (ix)
   8E7C DD 66 FD      [19] 1138 	ld	h,-3 (ix)
   8E7F 7E            [ 7] 1139 	ld	a,(hl)
   8E80 C6 18         [ 7] 1140 	add	a, #0x18
   8E82 57            [ 4] 1141 	ld	d,a
   8E83 0A            [ 7] 1142 	ld	a,(bc)
   8E84 C5            [11] 1143 	push	bc
   8E85 D5            [11] 1144 	push	de
   8E86 33            [ 6] 1145 	inc	sp
   8E87 F5            [11] 1146 	push	af
   8E88 33            [ 6] 1147 	inc	sp
   8E89 CD FC 89      [17] 1148 	call	_getTilePtr
   8E8C F1            [10] 1149 	pop	af
   8E8D C1            [10] 1150 	pop	bc
   8E8E 5E            [ 7] 1151 	ld	e,(hl)
   8E8F 3E 02         [ 7] 1152 	ld	a,#0x02
   8E91 93            [ 4] 1153 	sub	a, e
   8E92 DA 4B 8F      [10] 1154 	jp	C,00131$
                           1155 ;src/main.c:269: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   8E95 DD 6E FC      [19] 1156 	ld	l,-4 (ix)
   8E98 DD 66 FD      [19] 1157 	ld	h,-3 (ix)
   8E9B 7E            [ 7] 1158 	ld	a,(hl)
   8E9C C6 18         [ 7] 1159 	add	a, #0x18
   8E9E 57            [ 4] 1160 	ld	d,a
   8E9F 0A            [ 7] 1161 	ld	a,(bc)
   8EA0 C6 02         [ 7] 1162 	add	a, #0x02
   8EA2 C5            [11] 1163 	push	bc
   8EA3 D5            [11] 1164 	push	de
   8EA4 33            [ 6] 1165 	inc	sp
   8EA5 F5            [11] 1166 	push	af
   8EA6 33            [ 6] 1167 	inc	sp
   8EA7 CD FC 89      [17] 1168 	call	_getTilePtr
   8EAA F1            [10] 1169 	pop	af
   8EAB C1            [10] 1170 	pop	bc
   8EAC 5E            [ 7] 1171 	ld	e,(hl)
   8EAD 3E 02         [ 7] 1172 	ld	a,#0x02
   8EAF 93            [ 4] 1173 	sub	a, e
   8EB0 DA 4B 8F      [10] 1174 	jp	C,00131$
                           1175 ;src/main.c:270: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   8EB3 DD 6E FC      [19] 1176 	ld	l,-4 (ix)
   8EB6 DD 66 FD      [19] 1177 	ld	h,-3 (ix)
   8EB9 7E            [ 7] 1178 	ld	a,(hl)
   8EBA C6 18         [ 7] 1179 	add	a, #0x18
   8EBC 57            [ 4] 1180 	ld	d,a
   8EBD 0A            [ 7] 1181 	ld	a,(bc)
   8EBE C6 04         [ 7] 1182 	add	a, #0x04
   8EC0 C5            [11] 1183 	push	bc
   8EC1 D5            [11] 1184 	push	de
   8EC2 33            [ 6] 1185 	inc	sp
   8EC3 F5            [11] 1186 	push	af
   8EC4 33            [ 6] 1187 	inc	sp
   8EC5 CD FC 89      [17] 1188 	call	_getTilePtr
   8EC8 F1            [10] 1189 	pop	af
   8EC9 C1            [10] 1190 	pop	bc
   8ECA 5E            [ 7] 1191 	ld	e,(hl)
   8ECB 3E 02         [ 7] 1192 	ld	a,#0x02
   8ECD 93            [ 4] 1193 	sub	a, e
   8ECE 38 7B         [12] 1194 	jr	C,00131$
                           1195 ;src/main.c:272: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   8ED0 21 E4 88      [10] 1196 	ld	hl, #_cu + 0
   8ED3 5E            [ 7] 1197 	ld	e,(hl)
   8ED4 16 00         [ 7] 1198 	ld	d,#0x00
   8ED6 21 02 00      [10] 1199 	ld	hl,#0x0002
   8ED9 19            [11] 1200 	add	hl,de
   8EDA DD 75 F8      [19] 1201 	ld	-8 (ix),l
   8EDD DD 74 F9      [19] 1202 	ld	-7 (ix),h
   8EE0 0A            [ 7] 1203 	ld	a,(bc)
   8EE1 4F            [ 4] 1204 	ld	c,a
   8EE2 06 00         [ 7] 1205 	ld	b,#0x00
   8EE4 DD 7E F8      [19] 1206 	ld	a,-8 (ix)
   8EE7 91            [ 4] 1207 	sub	a, c
   8EE8 DD 7E F9      [19] 1208 	ld	a,-7 (ix)
   8EEB 98            [ 4] 1209 	sbc	a, b
   8EEC E2 F1 8E      [10] 1210 	jp	PO, 00198$
   8EEF EE 80         [ 7] 1211 	xor	a, #0x80
   8EF1                    1212 00198$:
   8EF1 FA 04 8F      [10] 1213 	jp	M,00126$
   8EF4 03            [ 6] 1214 	inc	bc
   8EF5 03            [ 6] 1215 	inc	bc
   8EF6 03            [ 6] 1216 	inc	bc
   8EF7 03            [ 6] 1217 	inc	bc
   8EF8 79            [ 4] 1218 	ld	a,c
   8EF9 93            [ 4] 1219 	sub	a, e
   8EFA 78            [ 4] 1220 	ld	a,b
   8EFB 9A            [ 4] 1221 	sbc	a, d
   8EFC E2 01 8F      [10] 1222 	jp	PO, 00199$
   8EFF EE 80         [ 7] 1223 	xor	a, #0x80
   8F01                    1224 00199$:
   8F01 F2 0A 8F      [10] 1225 	jp	P,00127$
   8F04                    1226 00126$:
                           1227 ;src/main.c:273: colisiona = 0;
   8F04 DD 36 F7 00   [19] 1228 	ld	-9 (ix),#0x00
   8F08 18 49         [12] 1229 	jr	00135$
   8F0A                    1230 00127$:
                           1231 ;src/main.c:276: if(cu.y > enemy->y){ //si el cu esta abajo
   8F0A 21 E5 88      [10] 1232 	ld	hl, #(_cu + 0x0001) + 0
   8F0D 4E            [ 7] 1233 	ld	c,(hl)
   8F0E DD 6E FC      [19] 1234 	ld	l,-4 (ix)
   8F11 DD 66 FD      [19] 1235 	ld	h,-3 (ix)
   8F14 5E            [ 7] 1236 	ld	e,(hl)
   8F15 7B            [ 4] 1237 	ld	a,e
   8F16 91            [ 4] 1238 	sub	a, c
   8F17 30 2C         [12] 1239 	jr	NC,00124$
                           1240 ;src/main.c:277: if( cu.y - (enemy->y + G_ENEMY_H) > 2){ // si hay espacio entre el enemigo y el cu
   8F19 06 00         [ 7] 1241 	ld	b,#0x00
   8F1B 16 00         [ 7] 1242 	ld	d,#0x00
   8F1D 21 16 00      [10] 1243 	ld	hl,#0x0016
   8F20 19            [11] 1244 	add	hl,de
   8F21 79            [ 4] 1245 	ld	a,c
   8F22 95            [ 4] 1246 	sub	a, l
   8F23 4F            [ 4] 1247 	ld	c,a
   8F24 78            [ 4] 1248 	ld	a,b
   8F25 9C            [ 4] 1249 	sbc	a, h
   8F26 47            [ 4] 1250 	ld	b,a
   8F27 3E 02         [ 7] 1251 	ld	a,#0x02
   8F29 B9            [ 4] 1252 	cp	a, c
   8F2A 3E 00         [ 7] 1253 	ld	a,#0x00
   8F2C 98            [ 4] 1254 	sbc	a, b
   8F2D E2 32 8F      [10] 1255 	jp	PO, 00200$
   8F30 EE 80         [ 7] 1256 	xor	a, #0x80
   8F32                    1257 00200$:
   8F32 F2 3B 8F      [10] 1258 	jp	P,00121$
                           1259 ;src/main.c:278: colisiona = 0;
   8F35 DD 36 F7 00   [19] 1260 	ld	-9 (ix),#0x00
   8F39 18 18         [12] 1261 	jr	00135$
   8F3B                    1262 00121$:
                           1263 ;src/main.c:281: enemy->muerto = SI;
   8F3B DD 6E FA      [19] 1264 	ld	l,-6 (ix)
   8F3E DD 66 FB      [19] 1265 	ld	h,-5 (ix)
   8F41 36 01         [10] 1266 	ld	(hl),#0x01
   8F43 18 0E         [12] 1267 	jr	00135$
   8F45                    1268 00124$:
                           1269 ;src/main.c:285: colisiona = 0;
   8F45 DD 36 F7 00   [19] 1270 	ld	-9 (ix),#0x00
   8F49 18 08         [12] 1271 	jr	00135$
   8F4B                    1272 00131$:
                           1273 ;src/main.c:289: enemy->mira = M_arriba;
   8F4B DD 6E FE      [19] 1274 	ld	l,-2 (ix)
   8F4E DD 66 FF      [19] 1275 	ld	h,-1 (ix)
   8F51 36 02         [10] 1276 	ld	(hl),#0x02
                           1277 ;src/main.c:292: }
   8F53                    1278 00135$:
                           1279 ;src/main.c:293: return colisiona;
   8F53 DD 6E F7      [19] 1280 	ld	l,-9 (ix)
   8F56 DD F9         [10] 1281 	ld	sp, ix
   8F58 DD E1         [14] 1282 	pop	ix
   8F5A C9            [10] 1283 	ret
                           1284 ;src/main.c:296: void moverEnemigoArriba(TEnemy *enemy){
                           1285 ;	---------------------------------
                           1286 ; Function moverEnemigoArriba
                           1287 ; ---------------------------------
   8F5B                    1288 _moverEnemigoArriba::
   8F5B DD E5         [15] 1289 	push	ix
   8F5D DD 21 00 00   [14] 1290 	ld	ix,#0
   8F61 DD 39         [15] 1291 	add	ix,sp
                           1292 ;src/main.c:297: enemy->y--;
   8F63 DD 4E 04      [19] 1293 	ld	c,4 (ix)
   8F66 DD 46 05      [19] 1294 	ld	b,5 (ix)
   8F69 69            [ 4] 1295 	ld	l, c
   8F6A 60            [ 4] 1296 	ld	h, b
   8F6B 23            [ 6] 1297 	inc	hl
   8F6C 5E            [ 7] 1298 	ld	e,(hl)
   8F6D 1D            [ 4] 1299 	dec	e
   8F6E 73            [ 7] 1300 	ld	(hl),e
                           1301 ;src/main.c:298: enemy->y--;
   8F6F 1D            [ 4] 1302 	dec	e
   8F70 73            [ 7] 1303 	ld	(hl),e
                           1304 ;src/main.c:299: enemy->mover = SI;
   8F71 21 06 00      [10] 1305 	ld	hl,#0x0006
   8F74 09            [11] 1306 	add	hl,bc
   8F75 36 01         [10] 1307 	ld	(hl),#0x01
   8F77 DD E1         [14] 1308 	pop	ix
   8F79 C9            [10] 1309 	ret
                           1310 ;src/main.c:302: void moverEnemigoAbajo(TEnemy *enemy){
                           1311 ;	---------------------------------
                           1312 ; Function moverEnemigoAbajo
                           1313 ; ---------------------------------
   8F7A                    1314 _moverEnemigoAbajo::
   8F7A DD E5         [15] 1315 	push	ix
   8F7C DD 21 00 00   [14] 1316 	ld	ix,#0
   8F80 DD 39         [15] 1317 	add	ix,sp
                           1318 ;src/main.c:303: enemy->y++;
   8F82 DD 4E 04      [19] 1319 	ld	c,4 (ix)
   8F85 DD 46 05      [19] 1320 	ld	b,5 (ix)
   8F88 59            [ 4] 1321 	ld	e, c
   8F89 50            [ 4] 1322 	ld	d, b
   8F8A 13            [ 6] 1323 	inc	de
   8F8B 1A            [ 7] 1324 	ld	a,(de)
   8F8C 3C            [ 4] 1325 	inc	a
   8F8D 12            [ 7] 1326 	ld	(de),a
                           1327 ;src/main.c:304: enemy->y++;
   8F8E 3C            [ 4] 1328 	inc	a
   8F8F 12            [ 7] 1329 	ld	(de),a
                           1330 ;src/main.c:305: enemy->mover = SI;
   8F90 21 06 00      [10] 1331 	ld	hl,#0x0006
   8F93 09            [11] 1332 	add	hl,bc
   8F94 36 01         [10] 1333 	ld	(hl),#0x01
   8F96 DD E1         [14] 1334 	pop	ix
   8F98 C9            [10] 1335 	ret
                           1336 ;src/main.c:308: void moverEnemigoDerecha(TEnemy *enemy){
                           1337 ;	---------------------------------
                           1338 ; Function moverEnemigoDerecha
                           1339 ; ---------------------------------
   8F99                    1340 _moverEnemigoDerecha::
                           1341 ;src/main.c:309: enemy->x++;
   8F99 D1            [10] 1342 	pop	de
   8F9A C1            [10] 1343 	pop	bc
   8F9B C5            [11] 1344 	push	bc
   8F9C D5            [11] 1345 	push	de
   8F9D 0A            [ 7] 1346 	ld	a,(bc)
   8F9E 3C            [ 4] 1347 	inc	a
   8F9F 02            [ 7] 1348 	ld	(bc),a
                           1349 ;src/main.c:310: enemy->x++;
   8FA0 3C            [ 4] 1350 	inc	a
   8FA1 02            [ 7] 1351 	ld	(bc),a
                           1352 ;src/main.c:311: enemy->mover = SI;
   8FA2 21 06 00      [10] 1353 	ld	hl,#0x0006
   8FA5 09            [11] 1354 	add	hl,bc
   8FA6 36 01         [10] 1355 	ld	(hl),#0x01
   8FA8 C9            [10] 1356 	ret
                           1357 ;src/main.c:314: void moverEnemigoIzquierda(TEnemy *enemy){
                           1358 ;	---------------------------------
                           1359 ; Function moverEnemigoIzquierda
                           1360 ; ---------------------------------
   8FA9                    1361 _moverEnemigoIzquierda::
                           1362 ;src/main.c:315: enemy->x--;
   8FA9 D1            [10] 1363 	pop	de
   8FAA C1            [10] 1364 	pop	bc
   8FAB C5            [11] 1365 	push	bc
   8FAC D5            [11] 1366 	push	de
   8FAD 0A            [ 7] 1367 	ld	a,(bc)
   8FAE C6 FF         [ 7] 1368 	add	a,#0xFF
   8FB0 02            [ 7] 1369 	ld	(bc),a
                           1370 ;src/main.c:316: enemy->x--;
   8FB1 C6 FF         [ 7] 1371 	add	a,#0xFF
   8FB3 02            [ 7] 1372 	ld	(bc),a
                           1373 ;src/main.c:317: enemy->mover = SI;
   8FB4 21 06 00      [10] 1374 	ld	hl,#0x0006
   8FB7 09            [11] 1375 	add	hl,bc
   8FB8 36 01         [10] 1376 	ld	(hl),#0x01
   8FBA C9            [10] 1377 	ret
                           1378 ;src/main.c:320: void moverEnemigo(TEnemy *enemy){
                           1379 ;	---------------------------------
                           1380 ; Function moverEnemigo
                           1381 ; ---------------------------------
   8FBB                    1382 _moverEnemigo::
   8FBB DD E5         [15] 1383 	push	ix
   8FBD DD 21 00 00   [14] 1384 	ld	ix,#0
   8FC1 DD 39         [15] 1385 	add	ix,sp
                           1386 ;src/main.c:321: if(!enemy->muerto){
   8FC3 DD 4E 04      [19] 1387 	ld	c,4 (ix)
   8FC6 DD 46 05      [19] 1388 	ld	b,5 (ix)
   8FC9 C5            [11] 1389 	push	bc
   8FCA FD E1         [14] 1390 	pop	iy
   8FCC FD 7E 08      [19] 1391 	ld	a,8 (iy)
   8FCF B7            [ 4] 1392 	or	a, a
   8FD0 20 3C         [12] 1393 	jr	NZ,00110$
                           1394 ;src/main.c:322: if(!checkEnemyCollision(enemy->mira, enemy)){
   8FD2 21 07 00      [10] 1395 	ld	hl,#0x0007
   8FD5 09            [11] 1396 	add	hl,bc
   8FD6 5E            [ 7] 1397 	ld	e,(hl)
   8FD7 16 00         [ 7] 1398 	ld	d,#0x00
   8FD9 E5            [11] 1399 	push	hl
   8FDA C5            [11] 1400 	push	bc
   8FDB C5            [11] 1401 	push	bc
   8FDC D5            [11] 1402 	push	de
   8FDD CD 37 8D      [17] 1403 	call	_checkEnemyCollision
   8FE0 F1            [10] 1404 	pop	af
   8FE1 F1            [10] 1405 	pop	af
   8FE2 7D            [ 4] 1406 	ld	a,l
   8FE3 C1            [10] 1407 	pop	bc
   8FE4 E1            [10] 1408 	pop	hl
   8FE5 B7            [ 4] 1409 	or	a, a
   8FE6 20 26         [12] 1410 	jr	NZ,00110$
                           1411 ;src/main.c:324: switch (enemy->mira) {
   8FE8 5E            [ 7] 1412 	ld	e,(hl)
   8FE9 3E 03         [ 7] 1413 	ld	a,#0x03
   8FEB 93            [ 4] 1414 	sub	a, e
   8FEC 38 20         [12] 1415 	jr	C,00110$
   8FEE 16 00         [ 7] 1416 	ld	d,#0x00
   8FF0 21 F6 8F      [10] 1417 	ld	hl,#00124$
   8FF3 19            [11] 1418 	add	hl,de
   8FF4 19            [11] 1419 	add	hl,de
                           1420 ;src/main.c:326: case 0:
                           1421 ;src/main.c:328: break;
                           1422 ;src/main.c:329: case 1:
                           1423 ;src/main.c:331: break;
                           1424 ;src/main.c:332: case 2:
   8FF5 E9            [ 4] 1425 	jp	(hl)
   8FF6                    1426 00124$:
   8FF6 18 16         [12] 1427 	jr	00110$
   8FF8 18 14         [12] 1428 	jr	00110$
   8FFA 18 06         [12] 1429 	jr	00103$
   8FFC 18 0B         [12] 1430 	jr	00104$
   8FFE 18 0E         [12] 1431 	jr	00110$
   9000 18 0C         [12] 1432 	jr	00110$
   9002                    1433 00103$:
                           1434 ;src/main.c:333: moverEnemigoArriba(enemy);
   9002 C5            [11] 1435 	push	bc
   9003 CD 5B 8F      [17] 1436 	call	_moverEnemigoArriba
   9006 F1            [10] 1437 	pop	af
                           1438 ;src/main.c:334: break;
   9007 18 05         [12] 1439 	jr	00110$
                           1440 ;src/main.c:335: case 3:
   9009                    1441 00104$:
                           1442 ;src/main.c:336: moverEnemigoAbajo(enemy);
   9009 C5            [11] 1443 	push	bc
   900A CD 7A 8F      [17] 1444 	call	_moverEnemigoAbajo
   900D F1            [10] 1445 	pop	af
                           1446 ;src/main.c:338: }
   900E                    1447 00110$:
   900E DD E1         [14] 1448 	pop	ix
   9010 C9            [10] 1449 	ret
                           1450 ;src/main.c:343: void avanzarMapa() {
                           1451 ;	---------------------------------
                           1452 ; Function avanzarMapa
                           1453 ; ---------------------------------
   9011                    1454 _avanzarMapa::
                           1455 ;src/main.c:344: if(num_mapa < NUM_MAPAS -1) {
   9011 3A F0 88      [13] 1456 	ld	a,(#_num_mapa + 0)
   9014 D6 02         [ 7] 1457 	sub	a, #0x02
   9016 D2 B1 89      [10] 1458 	jp	NC,_menuFin
                           1459 ;src/main.c:345: mapa = mapas[++num_mapa];
   9019 21 F0 88      [10] 1460 	ld	hl, #_num_mapa+0
   901C 34            [11] 1461 	inc	(hl)
   901D FD 21 F0 88   [14] 1462 	ld	iy,#_num_mapa
   9021 FD 6E 00      [19] 1463 	ld	l,0 (iy)
   9024 26 00         [ 7] 1464 	ld	h,#0x00
   9026 29            [11] 1465 	add	hl, hl
   9027 11 07 89      [10] 1466 	ld	de,#_mapas
   902A 19            [11] 1467 	add	hl,de
   902B 7E            [ 7] 1468 	ld	a,(hl)
   902C FD 21 EE 88   [14] 1469 	ld	iy,#_mapa
   9030 FD 77 00      [19] 1470 	ld	0 (iy),a
   9033 23            [ 6] 1471 	inc	hl
   9034 7E            [ 7] 1472 	ld	a,(hl)
   9035 32 EF 88      [13] 1473 	ld	(#_mapa + 1),a
                           1474 ;src/main.c:346: prota.x = prota.px = 2;
   9038 21 DE 88      [10] 1475 	ld	hl,#(_prota + 0x0002)
   903B 36 02         [10] 1476 	ld	(hl),#0x02
   903D 21 DC 88      [10] 1477 	ld	hl,#_prota
   9040 36 02         [10] 1478 	ld	(hl),#0x02
                           1479 ;src/main.c:347: prota.mover = SI;
   9042 21 E2 88      [10] 1480 	ld	hl,#(_prota + 0x0006)
                           1481 ;src/main.c:348: dibujarMapa();
                           1482 ;src/main.c:352: menuFin();
   9045 36 01         [10] 1483 	ld	(hl), #0x01
   9047 C3 F1 88      [10] 1484 	jp	_dibujarMapa
                           1485 ;src/main.c:356: void moverIzquierda() {
                           1486 ;	---------------------------------
                           1487 ; Function moverIzquierda
                           1488 ; ---------------------------------
   904A                    1489 _moverIzquierda::
                           1490 ;src/main.c:357: prota.mira = M_izquierda;
   904A 01 DC 88      [10] 1491 	ld	bc,#_prota+0
   904D 21 E3 88      [10] 1492 	ld	hl,#(_prota + 0x0007)
   9050 36 01         [10] 1493 	ld	(hl),#0x01
                           1494 ;src/main.c:358: if (!checkCollision(M_izquierda)) {
   9052 C5            [11] 1495 	push	bc
   9053 21 01 00      [10] 1496 	ld	hl,#0x0001
   9056 E5            [11] 1497 	push	hl
   9057 CD 3D 8A      [17] 1498 	call	_checkCollision
   905A F1            [10] 1499 	pop	af
   905B C1            [10] 1500 	pop	bc
   905C 7D            [ 4] 1501 	ld	a,l
   905D B7            [ 4] 1502 	or	a, a
   905E C0            [11] 1503 	ret	NZ
                           1504 ;src/main.c:359: prota.x--;
   905F 0A            [ 7] 1505 	ld	a,(bc)
   9060 C6 FF         [ 7] 1506 	add	a,#0xFF
   9062 02            [ 7] 1507 	ld	(bc),a
                           1508 ;src/main.c:360: prota.mover = SI;
   9063 21 E2 88      [10] 1509 	ld	hl,#(_prota + 0x0006)
   9066 36 01         [10] 1510 	ld	(hl),#0x01
                           1511 ;src/main.c:361: prota.sprite = g_hero_left;
   9068 21 FE 79      [10] 1512 	ld	hl,#_g_hero_left
   906B 22 E0 88      [16] 1513 	ld	((_prota + 0x0004)), hl
   906E C9            [10] 1514 	ret
                           1515 ;src/main.c:365: void moverDerecha() {
                           1516 ;	---------------------------------
                           1517 ; Function moverDerecha
                           1518 ; ---------------------------------
   906F                    1519 _moverDerecha::
                           1520 ;src/main.c:366: prota.mira = M_derecha;
   906F 21 E3 88      [10] 1521 	ld	hl,#(_prota + 0x0007)
   9072 36 00         [10] 1522 	ld	(hl),#0x00
                           1523 ;src/main.c:367: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   9074 21 00 00      [10] 1524 	ld	hl,#0x0000
   9077 E5            [11] 1525 	push	hl
   9078 CD 3D 8A      [17] 1526 	call	_checkCollision
   907B F1            [10] 1527 	pop	af
   907C 45            [ 4] 1528 	ld	b,l
   907D 21 DC 88      [10] 1529 	ld	hl, #_prota + 0
   9080 4E            [ 7] 1530 	ld	c,(hl)
   9081 59            [ 4] 1531 	ld	e,c
   9082 16 00         [ 7] 1532 	ld	d,#0x00
   9084 21 07 00      [10] 1533 	ld	hl,#0x0007
   9087 19            [11] 1534 	add	hl,de
   9088 11 50 80      [10] 1535 	ld	de, #0x8050
   908B 29            [11] 1536 	add	hl, hl
   908C 3F            [ 4] 1537 	ccf
   908D CB 1C         [ 8] 1538 	rr	h
   908F CB 1D         [ 8] 1539 	rr	l
   9091 ED 52         [15] 1540 	sbc	hl, de
   9093 3E 00         [ 7] 1541 	ld	a,#0x00
   9095 17            [ 4] 1542 	rla
   9096 5F            [ 4] 1543 	ld	e,a
   9097 78            [ 4] 1544 	ld	a,b
   9098 B7            [ 4] 1545 	or	a,a
   9099 20 14         [12] 1546 	jr	NZ,00104$
   909B B3            [ 4] 1547 	or	a,e
   909C 28 11         [12] 1548 	jr	Z,00104$
                           1549 ;src/main.c:368: prota.x++;
   909E 0C            [ 4] 1550 	inc	c
   909F 21 DC 88      [10] 1551 	ld	hl,#_prota
   90A2 71            [ 7] 1552 	ld	(hl),c
                           1553 ;src/main.c:369: prota.mover = SI;
   90A3 21 E2 88      [10] 1554 	ld	hl,#(_prota + 0x0006)
   90A6 36 01         [10] 1555 	ld	(hl),#0x01
                           1556 ;src/main.c:370: prota.sprite = g_hero;
   90A8 21 A8 7A      [10] 1557 	ld	hl,#_g_hero
   90AB 22 E0 88      [16] 1558 	ld	((_prota + 0x0004)), hl
   90AE C9            [10] 1559 	ret
   90AF                    1560 00104$:
                           1561 ;src/main.c:372: }else if( prota.x + G_HERO_W >= 80){
   90AF 7B            [ 4] 1562 	ld	a,e
   90B0 B7            [ 4] 1563 	or	a, a
   90B1 C0            [11] 1564 	ret	NZ
                           1565 ;src/main.c:373: avanzarMapa();
   90B2 C3 11 90      [10] 1566 	jp  _avanzarMapa
                           1567 ;src/main.c:377: void moverArriba() {
                           1568 ;	---------------------------------
                           1569 ; Function moverArriba
                           1570 ; ---------------------------------
   90B5                    1571 _moverArriba::
                           1572 ;src/main.c:378: prota.mira = M_arriba;
   90B5 21 E3 88      [10] 1573 	ld	hl,#(_prota + 0x0007)
   90B8 36 02         [10] 1574 	ld	(hl),#0x02
                           1575 ;src/main.c:379: if (!checkCollision(M_arriba)) { // TODO: COMPROBAR
   90BA 21 02 00      [10] 1576 	ld	hl,#0x0002
   90BD E5            [11] 1577 	push	hl
   90BE CD 3D 8A      [17] 1578 	call	_checkCollision
   90C1 F1            [10] 1579 	pop	af
   90C2 7D            [ 4] 1580 	ld	a,l
   90C3 B7            [ 4] 1581 	or	a, a
   90C4 C0            [11] 1582 	ret	NZ
                           1583 ;src/main.c:380: prota.y--;
   90C5 21 DD 88      [10] 1584 	ld	hl,#_prota + 1
   90C8 4E            [ 7] 1585 	ld	c,(hl)
   90C9 0D            [ 4] 1586 	dec	c
   90CA 71            [ 7] 1587 	ld	(hl),c
                           1588 ;src/main.c:381: prota.y--;
   90CB 0D            [ 4] 1589 	dec	c
   90CC 71            [ 7] 1590 	ld	(hl),c
                           1591 ;src/main.c:382: prota.mover  = SI;
   90CD 21 E2 88      [10] 1592 	ld	hl,#(_prota + 0x0006)
   90D0 36 01         [10] 1593 	ld	(hl),#0x01
                           1594 ;src/main.c:383: prota.sprite = g_hero_up;
   90D2 21 64 79      [10] 1595 	ld	hl,#_g_hero_up
   90D5 22 E0 88      [16] 1596 	ld	((_prota + 0x0004)), hl
   90D8 C9            [10] 1597 	ret
                           1598 ;src/main.c:387: void moverAbajo() {
                           1599 ;	---------------------------------
                           1600 ; Function moverAbajo
                           1601 ; ---------------------------------
   90D9                    1602 _moverAbajo::
                           1603 ;src/main.c:388: prota.mira = M_abajo;
   90D9 21 E3 88      [10] 1604 	ld	hl,#(_prota + 0x0007)
   90DC 36 03         [10] 1605 	ld	(hl),#0x03
                           1606 ;src/main.c:389: if (!checkCollision(M_abajo) ) { // TODO: COMPROBAR
   90DE 21 03 00      [10] 1607 	ld	hl,#0x0003
   90E1 E5            [11] 1608 	push	hl
   90E2 CD 3D 8A      [17] 1609 	call	_checkCollision
   90E5 F1            [10] 1610 	pop	af
   90E6 7D            [ 4] 1611 	ld	a,l
   90E7 B7            [ 4] 1612 	or	a, a
   90E8 C0            [11] 1613 	ret	NZ
                           1614 ;src/main.c:390: prota.y++;
   90E9 01 DD 88      [10] 1615 	ld	bc,#_prota + 1
   90EC 0A            [ 7] 1616 	ld	a,(bc)
   90ED 3C            [ 4] 1617 	inc	a
   90EE 02            [ 7] 1618 	ld	(bc),a
                           1619 ;src/main.c:391: prota.y++;
   90EF 3C            [ 4] 1620 	inc	a
   90F0 02            [ 7] 1621 	ld	(bc),a
                           1622 ;src/main.c:392: prota.mover  = SI;
   90F1 21 E2 88      [10] 1623 	ld	hl,#(_prota + 0x0006)
   90F4 36 01         [10] 1624 	ld	(hl),#0x01
                           1625 ;src/main.c:393: prota.sprite = g_hero_down;
   90F6 21 CA 78      [10] 1626 	ld	hl,#_g_hero_down
   90F9 22 E0 88      [16] 1627 	ld	((_prota + 0x0004)), hl
   90FC C9            [10] 1628 	ret
                           1629 ;src/main.c:397: void dibujarCuchillo() {
                           1630 ;	---------------------------------
                           1631 ; Function dibujarCuchillo
                           1632 ; ---------------------------------
   90FD                    1633 _dibujarCuchillo::
   90FD DD E5         [15] 1634 	push	ix
   90FF DD 21 00 00   [14] 1635 	ld	ix,#0
   9103 DD 39         [15] 1636 	add	ix,sp
   9105 F5            [11] 1637 	push	af
                           1638 ;src/main.c:398: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   9106 21 E5 88      [10] 1639 	ld	hl, #_cu + 1
   9109 56            [ 7] 1640 	ld	d,(hl)
   910A 21 E4 88      [10] 1641 	ld	hl, #_cu + 0
   910D 46            [ 7] 1642 	ld	b,(hl)
   910E D5            [11] 1643 	push	de
   910F 33            [ 6] 1644 	inc	sp
   9110 C5            [11] 1645 	push	bc
   9111 33            [ 6] 1646 	inc	sp
   9112 21 00 C0      [10] 1647 	ld	hl,#0xC000
   9115 E5            [11] 1648 	push	hl
   9116 CD 4B 88      [17] 1649 	call	_cpct_getScreenPtr
   9119 45            [ 4] 1650 	ld	b,l
   911A 5C            [ 4] 1651 	ld	e,h
                           1652 ;src/main.c:399: if(cu.eje == E_X){
   911B 21 EC 88      [10] 1653 	ld	hl, #_cu + 8
   911E 4E            [ 7] 1654 	ld	c,(hl)
                           1655 ;src/main.c:400: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   911F DD 70 FE      [19] 1656 	ld	-2 (ix),b
   9122 DD 73 FF      [19] 1657 	ld	-1 (ix),e
                           1658 ;src/main.c:399: if(cu.eje == E_X){
   9125 79            [ 4] 1659 	ld	a,c
   9126 B7            [ 4] 1660 	or	a, a
   9127 20 19         [12] 1661 	jr	NZ,00104$
                           1662 ;src/main.c:400: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   9129 11 00 3E      [10] 1663 	ld	de,#_g_tablatrans+0
   912C ED 4B E8 88   [20] 1664 	ld	bc, (#(_cu + 0x0004) + 0)
   9130 D5            [11] 1665 	push	de
   9131 21 04 04      [10] 1666 	ld	hl,#0x0404
   9134 E5            [11] 1667 	push	hl
   9135 DD 6E FE      [19] 1668 	ld	l,-2 (ix)
   9138 DD 66 FF      [19] 1669 	ld	h,-1 (ix)
   913B E5            [11] 1670 	push	hl
   913C C5            [11] 1671 	push	bc
   913D CD 6B 88      [17] 1672 	call	_cpct_drawSpriteMaskedAlignedTable
   9140 18 1A         [12] 1673 	jr	00106$
   9142                    1674 00104$:
                           1675 ;src/main.c:403: else if(cu.eje == E_Y){
   9142 0D            [ 4] 1676 	dec	c
   9143 20 17         [12] 1677 	jr	NZ,00106$
                           1678 ;src/main.c:404: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   9145 11 00 3E      [10] 1679 	ld	de,#_g_tablatrans+0
   9148 ED 4B E8 88   [20] 1680 	ld	bc, (#(_cu + 0x0004) + 0)
   914C D5            [11] 1681 	push	de
   914D 21 02 08      [10] 1682 	ld	hl,#0x0802
   9150 E5            [11] 1683 	push	hl
   9151 DD 6E FE      [19] 1684 	ld	l,-2 (ix)
   9154 DD 66 FF      [19] 1685 	ld	h,-1 (ix)
   9157 E5            [11] 1686 	push	hl
   9158 C5            [11] 1687 	push	bc
   9159 CD 6B 88      [17] 1688 	call	_cpct_drawSpriteMaskedAlignedTable
   915C                    1689 00106$:
   915C DD F9         [10] 1690 	ld	sp, ix
   915E DD E1         [14] 1691 	pop	ix
   9160 C9            [10] 1692 	ret
                           1693 ;src/main.c:408: void borrarCuchillo() {
                           1694 ;	---------------------------------
                           1695 ; Function borrarCuchillo
                           1696 ; ---------------------------------
   9161                    1697 _borrarCuchillo::
   9161 DD E5         [15] 1698 	push	ix
   9163 DD 21 00 00   [14] 1699 	ld	ix,#0
   9167 DD 39         [15] 1700 	add	ix,sp
   9169 F5            [11] 1701 	push	af
   916A 3B            [ 6] 1702 	dec	sp
                           1703 ;src/main.c:410: u8 w = 2 + (cu.px & 1);
   916B 21 E6 88      [10] 1704 	ld	hl, #_cu + 2
   916E 4E            [ 7] 1705 	ld	c,(hl)
   916F 79            [ 4] 1706 	ld	a,c
   9170 E6 01         [ 7] 1707 	and	a, #0x01
   9172 47            [ 4] 1708 	ld	b,a
   9173 04            [ 4] 1709 	inc	b
   9174 04            [ 4] 1710 	inc	b
                           1711 ;src/main.c:411: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   9175 21 E7 88      [10] 1712 	ld	hl, #_cu + 3
   9178 5E            [ 7] 1713 	ld	e,(hl)
   9179 7B            [ 4] 1714 	ld	a,e
   917A E6 03         [ 7] 1715 	and	a, #0x03
   917C 28 04         [12] 1716 	jr	Z,00105$
   917E 3E 01         [ 7] 1717 	ld	a,#0x01
   9180 18 02         [12] 1718 	jr	00106$
   9182                    1719 00105$:
   9182 3E 00         [ 7] 1720 	ld	a,#0x00
   9184                    1721 00106$:
   9184 C6 02         [ 7] 1722 	add	a, #0x02
   9186 DD 77 FD      [19] 1723 	ld	-3 (ix),a
                           1724 ;src/main.c:412: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   9189 FD 2A EE 88   [20] 1725 	ld	iy,(_mapa)
   918D 16 00         [ 7] 1726 	ld	d,#0x00
   918F 7B            [ 4] 1727 	ld	a,e
   9190 C6 E8         [ 7] 1728 	add	a,#0xE8
   9192 DD 77 FE      [19] 1729 	ld	-2 (ix),a
   9195 7A            [ 4] 1730 	ld	a,d
   9196 CE FF         [ 7] 1731 	adc	a,#0xFF
   9198 DD 77 FF      [19] 1732 	ld	-1 (ix),a
   919B DD 6E FE      [19] 1733 	ld	l,-2 (ix)
   919E DD 66 FF      [19] 1734 	ld	h,-1 (ix)
   91A1 DD CB FF 7E   [20] 1735 	bit	7, -1 (ix)
   91A5 28 04         [12] 1736 	jr	Z,00107$
   91A7 21 EB FF      [10] 1737 	ld	hl,#0xFFEB
   91AA 19            [11] 1738 	add	hl,de
   91AB                    1739 00107$:
   91AB CB 2C         [ 8] 1740 	sra	h
   91AD CB 1D         [ 8] 1741 	rr	l
   91AF CB 2C         [ 8] 1742 	sra	h
   91B1 CB 1D         [ 8] 1743 	rr	l
   91B3 55            [ 4] 1744 	ld	d,l
   91B4 CB 39         [ 8] 1745 	srl	c
   91B6 FD E5         [15] 1746 	push	iy
   91B8 21 F0 C0      [10] 1747 	ld	hl,#0xC0F0
   91BB E5            [11] 1748 	push	hl
   91BC 3E 28         [ 7] 1749 	ld	a,#0x28
   91BE F5            [11] 1750 	push	af
   91BF 33            [ 6] 1751 	inc	sp
   91C0 DD 7E FD      [19] 1752 	ld	a,-3 (ix)
   91C3 F5            [11] 1753 	push	af
   91C4 33            [ 6] 1754 	inc	sp
   91C5 C5            [11] 1755 	push	bc
   91C6 33            [ 6] 1756 	inc	sp
   91C7 D5            [11] 1757 	push	de
   91C8 33            [ 6] 1758 	inc	sp
   91C9 79            [ 4] 1759 	ld	a,c
   91CA F5            [11] 1760 	push	af
   91CB 33            [ 6] 1761 	inc	sp
   91CC CD 44 7D      [17] 1762 	call	_cpct_etm_drawTileBox2x4
                           1763 ;src/main.c:413: if(!cu.mover){
   91CF 3A ED 88      [13] 1764 	ld	a, (#_cu + 9)
   91D2 B7            [ 4] 1765 	or	a, a
   91D3 20 05         [12] 1766 	jr	NZ,00103$
                           1767 ;src/main.c:414: cu.lanzado = NO;
   91D5 21 EA 88      [10] 1768 	ld	hl,#(_cu + 0x0006)
   91D8 36 00         [10] 1769 	ld	(hl),#0x00
   91DA                    1770 00103$:
   91DA DD F9         [10] 1771 	ld	sp, ix
   91DC DD E1         [14] 1772 	pop	ix
   91DE C9            [10] 1773 	ret
                           1774 ;src/main.c:418: void redibujarCuchillo( ) {
                           1775 ;	---------------------------------
                           1776 ; Function redibujarCuchillo
                           1777 ; ---------------------------------
   91DF                    1778 _redibujarCuchillo::
                           1779 ;src/main.c:419: borrarCuchillo();
   91DF CD 61 91      [17] 1780 	call	_borrarCuchillo
                           1781 ;src/main.c:420: cu.px = cu.x;
   91E2 01 E6 88      [10] 1782 	ld	bc,#_cu + 2
   91E5 3A E4 88      [13] 1783 	ld	a, (#_cu + 0)
   91E8 02            [ 7] 1784 	ld	(bc),a
                           1785 ;src/main.c:421: cu.py = cu.y;
   91E9 01 E7 88      [10] 1786 	ld	bc,#_cu + 3
   91EC 3A E5 88      [13] 1787 	ld	a, (#_cu + 1)
   91EF 02            [ 7] 1788 	ld	(bc),a
                           1789 ;src/main.c:422: dibujarCuchillo();
   91F0 C3 FD 90      [10] 1790 	jp  _dibujarCuchillo
                           1791 ;src/main.c:425: void lanzarCuchillo(){
                           1792 ;	---------------------------------
                           1793 ; Function lanzarCuchillo
                           1794 ; ---------------------------------
   91F3                    1795 _lanzarCuchillo::
                           1796 ;src/main.c:427: if(!cu.lanzado){
   91F3 3A EA 88      [13] 1797 	ld	a, (#(_cu + 0x0006) + 0)
   91F6 B7            [ 4] 1798 	or	a, a
   91F7 C0            [11] 1799 	ret	NZ
                           1800 ;src/main.c:429: if(prota.mira == M_derecha){
   91F8 21 E3 88      [10] 1801 	ld	hl, #_prota + 7
   91FB 5E            [ 7] 1802 	ld	e,(hl)
                           1803 ;src/main.c:430: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   91FC 01 DD 88      [10] 1804 	ld	bc,#_prota + 1
                           1805 ;src/main.c:432: cu.direccion = M_derecha;
                           1806 ;src/main.c:434: cu.y=prota.y + G_HERO_H /2;
                           1807 ;src/main.c:435: cu.sprite=g_knifeX_0;
                           1808 ;src/main.c:436: cu.eje = E_X;
                           1809 ;src/main.c:429: if(prota.mira == M_derecha){
   91FF 7B            [ 4] 1810 	ld	a,e
   9200 B7            [ 4] 1811 	or	a, a
   9201 20 41         [12] 1812 	jr	NZ,00118$
                           1813 ;src/main.c:430: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   9203 0A            [ 7] 1814 	ld	a,(bc)
   9204 C6 0B         [ 7] 1815 	add	a, #0x0B
   9206 5F            [ 4] 1816 	ld	e,a
   9207 3A DC 88      [13] 1817 	ld	a, (#_prota + 0)
   920A C6 0C         [ 7] 1818 	add	a, #0x0C
   920C 6F            [ 4] 1819 	ld	l,a
   920D C5            [11] 1820 	push	bc
   920E 7B            [ 4] 1821 	ld	a,e
   920F F5            [11] 1822 	push	af
   9210 33            [ 6] 1823 	inc	sp
   9211 7D            [ 4] 1824 	ld	a,l
   9212 F5            [11] 1825 	push	af
   9213 33            [ 6] 1826 	inc	sp
   9214 CD FC 89      [17] 1827 	call	_getTilePtr
   9217 F1            [10] 1828 	pop	af
   9218 C1            [10] 1829 	pop	bc
   9219 5E            [ 7] 1830 	ld	e,(hl)
   921A 3E 02         [ 7] 1831 	ld	a,#0x02
   921C 93            [ 4] 1832 	sub	a, e
   921D D8            [11] 1833 	ret	C
                           1834 ;src/main.c:431: cu.lanzado = SI;
   921E 21 EA 88      [10] 1835 	ld	hl,#(_cu + 0x0006)
   9221 36 01         [10] 1836 	ld	(hl),#0x01
                           1837 ;src/main.c:432: cu.direccion = M_derecha;
   9223 21 EB 88      [10] 1838 	ld	hl,#(_cu + 0x0007)
   9226 36 00         [10] 1839 	ld	(hl),#0x00
                           1840 ;src/main.c:433: cu.x=prota.x + G_HERO_W;
   9228 3A DC 88      [13] 1841 	ld	a, (#_prota + 0)
   922B C6 07         [ 7] 1842 	add	a, #0x07
   922D 32 E4 88      [13] 1843 	ld	(#_cu),a
                           1844 ;src/main.c:434: cu.y=prota.y + G_HERO_H /2;
   9230 0A            [ 7] 1845 	ld	a,(bc)
   9231 C6 0B         [ 7] 1846 	add	a, #0x0B
   9233 32 E5 88      [13] 1847 	ld	(#(_cu + 0x0001)),a
                           1848 ;src/main.c:435: cu.sprite=g_knifeX_0;
   9236 21 C0 54      [10] 1849 	ld	hl,#_g_knifeX_0
   9239 22 E8 88      [16] 1850 	ld	((_cu + 0x0004)), hl
                           1851 ;src/main.c:436: cu.eje = E_X;
   923C 21 EC 88      [10] 1852 	ld	hl,#(_cu + 0x0008)
   923F 36 00         [10] 1853 	ld	(hl),#0x00
                           1854 ;src/main.c:437: dibujarCuchillo();
   9241 C3 FD 90      [10] 1855 	jp  _dibujarCuchillo
   9244                    1856 00118$:
                           1857 ;src/main.c:440: else if(prota.mira == M_izquierda){
   9244 7B            [ 4] 1858 	ld	a,e
   9245 3D            [ 4] 1859 	dec	a
   9246 20 41         [12] 1860 	jr	NZ,00115$
                           1861 ;src/main.c:441: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   9248 0A            [ 7] 1862 	ld	a,(bc)
   9249 C6 0B         [ 7] 1863 	add	a, #0x0B
   924B 5F            [ 4] 1864 	ld	e,a
   924C 3A DC 88      [13] 1865 	ld	a, (#_prota + 0)
   924F C6 F6         [ 7] 1866 	add	a,#0xF6
   9251 6F            [ 4] 1867 	ld	l,a
   9252 C5            [11] 1868 	push	bc
   9253 7B            [ 4] 1869 	ld	a,e
   9254 F5            [11] 1870 	push	af
   9255 33            [ 6] 1871 	inc	sp
   9256 7D            [ 4] 1872 	ld	a,l
   9257 F5            [11] 1873 	push	af
   9258 33            [ 6] 1874 	inc	sp
   9259 CD FC 89      [17] 1875 	call	_getTilePtr
   925C F1            [10] 1876 	pop	af
   925D C1            [10] 1877 	pop	bc
   925E 5E            [ 7] 1878 	ld	e,(hl)
   925F 3E 02         [ 7] 1879 	ld	a,#0x02
   9261 93            [ 4] 1880 	sub	a, e
   9262 D8            [11] 1881 	ret	C
                           1882 ;src/main.c:442: cu.lanzado = SI;
   9263 21 EA 88      [10] 1883 	ld	hl,#(_cu + 0x0006)
   9266 36 01         [10] 1884 	ld	(hl),#0x01
                           1885 ;src/main.c:443: cu.direccion = M_izquierda;
   9268 21 EB 88      [10] 1886 	ld	hl,#(_cu + 0x0007)
   926B 36 01         [10] 1887 	ld	(hl),#0x01
                           1888 ;src/main.c:444: cu.x = prota.x - G_KNIFEX_0_W;
   926D 3A DC 88      [13] 1889 	ld	a, (#_prota + 0)
   9270 C6 FC         [ 7] 1890 	add	a,#0xFC
   9272 32 E4 88      [13] 1891 	ld	(#_cu),a
                           1892 ;src/main.c:445: cu.y = prota.y + G_HERO_H /2;
   9275 0A            [ 7] 1893 	ld	a,(bc)
   9276 C6 0B         [ 7] 1894 	add	a, #0x0B
   9278 32 E5 88      [13] 1895 	ld	(#(_cu + 0x0001)),a
                           1896 ;src/main.c:446: cu.sprite = g_knifeX_1;
   927B 21 D0 54      [10] 1897 	ld	hl,#_g_knifeX_1
   927E 22 E8 88      [16] 1898 	ld	((_cu + 0x0004)), hl
                           1899 ;src/main.c:447: cu.eje = E_X;
   9281 21 EC 88      [10] 1900 	ld	hl,#(_cu + 0x0008)
   9284 36 00         [10] 1901 	ld	(hl),#0x00
                           1902 ;src/main.c:448: dibujarCuchillo();
   9286 C3 FD 90      [10] 1903 	jp  _dibujarCuchillo
   9289                    1904 00115$:
                           1905 ;src/main.c:451: else if(prota.mira == M_abajo){
   9289 7B            [ 4] 1906 	ld	a,e
   928A D6 03         [ 7] 1907 	sub	a, #0x03
   928C 20 41         [12] 1908 	jr	NZ,00112$
                           1909 ;src/main.c:453: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   928E 0A            [ 7] 1910 	ld	a,(bc)
   928F C6 1F         [ 7] 1911 	add	a, #0x1F
   9291 5F            [ 4] 1912 	ld	e,a
   9292 3A DC 88      [13] 1913 	ld	a, (#_prota + 0)
   9295 57            [ 4] 1914 	ld	d,a
   9296 14            [ 4] 1915 	inc	d
   9297 14            [ 4] 1916 	inc	d
   9298 14            [ 4] 1917 	inc	d
   9299 C5            [11] 1918 	push	bc
   929A 7B            [ 4] 1919 	ld	a,e
   929B F5            [11] 1920 	push	af
   929C 33            [ 6] 1921 	inc	sp
   929D D5            [11] 1922 	push	de
   929E 33            [ 6] 1923 	inc	sp
   929F CD FC 89      [17] 1924 	call	_getTilePtr
   92A2 F1            [10] 1925 	pop	af
   92A3 C1            [10] 1926 	pop	bc
   92A4 5E            [ 7] 1927 	ld	e,(hl)
   92A5 3E 02         [ 7] 1928 	ld	a,#0x02
   92A7 93            [ 4] 1929 	sub	a, e
   92A8 D8            [11] 1930 	ret	C
                           1931 ;src/main.c:454: cu.lanzado = SI;
   92A9 21 EA 88      [10] 1932 	ld	hl,#(_cu + 0x0006)
   92AC 36 01         [10] 1933 	ld	(hl),#0x01
                           1934 ;src/main.c:455: cu.direccion = M_abajo;
   92AE 21 EB 88      [10] 1935 	ld	hl,#(_cu + 0x0007)
   92B1 36 03         [10] 1936 	ld	(hl),#0x03
                           1937 ;src/main.c:456: cu.x = prota.x + G_HERO_W / 2;
   92B3 3A DC 88      [13] 1938 	ld	a, (#_prota + 0)
   92B6 C6 03         [ 7] 1939 	add	a, #0x03
   92B8 32 E4 88      [13] 1940 	ld	(#_cu),a
                           1941 ;src/main.c:457: cu.y = prota.y + G_HERO_H;
   92BB 0A            [ 7] 1942 	ld	a,(bc)
   92BC C6 16         [ 7] 1943 	add	a, #0x16
   92BE 32 E5 88      [13] 1944 	ld	(#(_cu + 0x0001)),a
                           1945 ;src/main.c:458: cu.sprite = g_knifeY_0;
   92C1 21 A0 54      [10] 1946 	ld	hl,#_g_knifeY_0
   92C4 22 E8 88      [16] 1947 	ld	((_cu + 0x0004)), hl
                           1948 ;src/main.c:459: cu.eje = E_Y;
   92C7 21 EC 88      [10] 1949 	ld	hl,#(_cu + 0x0008)
   92CA 36 01         [10] 1950 	ld	(hl),#0x01
                           1951 ;src/main.c:460: dibujarCuchillo();
   92CC C3 FD 90      [10] 1952 	jp  _dibujarCuchillo
   92CF                    1953 00112$:
                           1954 ;src/main.c:463: else if(prota.mira == M_arriba){
   92CF 7B            [ 4] 1955 	ld	a,e
   92D0 D6 02         [ 7] 1956 	sub	a, #0x02
   92D2 C0            [11] 1957 	ret	NZ
                           1958 ;src/main.c:464: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   92D3 0A            [ 7] 1959 	ld	a,(bc)
   92D4 C6 F7         [ 7] 1960 	add	a,#0xF7
   92D6 57            [ 4] 1961 	ld	d,a
   92D7 3A DC 88      [13] 1962 	ld	a, (#_prota + 0)
   92DA C6 03         [ 7] 1963 	add	a, #0x03
   92DC C5            [11] 1964 	push	bc
   92DD D5            [11] 1965 	push	de
   92DE 33            [ 6] 1966 	inc	sp
   92DF F5            [11] 1967 	push	af
   92E0 33            [ 6] 1968 	inc	sp
   92E1 CD FC 89      [17] 1969 	call	_getTilePtr
   92E4 F1            [10] 1970 	pop	af
   92E5 C1            [10] 1971 	pop	bc
   92E6 5E            [ 7] 1972 	ld	e,(hl)
   92E7 3E 02         [ 7] 1973 	ld	a,#0x02
   92E9 93            [ 4] 1974 	sub	a, e
   92EA D8            [11] 1975 	ret	C
                           1976 ;src/main.c:465: cu.lanzado = SI;
   92EB 21 EA 88      [10] 1977 	ld	hl,#(_cu + 0x0006)
   92EE 36 01         [10] 1978 	ld	(hl),#0x01
                           1979 ;src/main.c:466: cu.direccion = M_arriba;
   92F0 21 EB 88      [10] 1980 	ld	hl,#(_cu + 0x0007)
   92F3 36 02         [10] 1981 	ld	(hl),#0x02
                           1982 ;src/main.c:467: cu.x = prota.x + G_HERO_W / 2;
   92F5 3A DC 88      [13] 1983 	ld	a, (#_prota + 0)
   92F8 C6 03         [ 7] 1984 	add	a, #0x03
   92FA 32 E4 88      [13] 1985 	ld	(#_cu),a
                           1986 ;src/main.c:468: cu.y = prota.y;
   92FD 0A            [ 7] 1987 	ld	a,(bc)
   92FE 32 E5 88      [13] 1988 	ld	(#(_cu + 0x0001)),a
                           1989 ;src/main.c:469: cu.sprite = g_knifeY_1;
   9301 21 B0 54      [10] 1990 	ld	hl,#_g_knifeY_1
   9304 22 E8 88      [16] 1991 	ld	((_cu + 0x0004)), hl
                           1992 ;src/main.c:470: cu.eje = E_Y;
   9307 21 EC 88      [10] 1993 	ld	hl,#(_cu + 0x0008)
   930A 36 01         [10] 1994 	ld	(hl),#0x01
                           1995 ;src/main.c:471: dibujarCuchillo();
   930C C3 FD 90      [10] 1996 	jp  _dibujarCuchillo
                           1997 ;src/main.c:477: void comprobarTeclado() {
                           1998 ;	---------------------------------
                           1999 ; Function comprobarTeclado
                           2000 ; ---------------------------------
   930F                    2001 _comprobarTeclado::
                           2002 ;src/main.c:478: cpct_scanKeyboard_if();
   930F CD 9C 7E      [17] 2003 	call	_cpct_scanKeyboard_if
                           2004 ;src/main.c:480: if (cpct_isAnyKeyPressed()) {
   9312 CD 8F 7E      [17] 2005 	call	_cpct_isAnyKeyPressed
   9315 7D            [ 4] 2006 	ld	a,l
   9316 B7            [ 4] 2007 	or	a, a
   9317 C8            [11] 2008 	ret	Z
                           2009 ;src/main.c:481: if (cpct_isKeyPressed(Key_CursorLeft))
   9318 21 01 01      [10] 2010 	ld	hl,#0x0101
   931B CD F9 7B      [17] 2011 	call	_cpct_isKeyPressed
   931E 7D            [ 4] 2012 	ld	a,l
   931F B7            [ 4] 2013 	or	a, a
                           2014 ;src/main.c:482: moverIzquierda();
   9320 C2 4A 90      [10] 2015 	jp	NZ,_moverIzquierda
                           2016 ;src/main.c:483: else if (cpct_isKeyPressed(Key_CursorRight))
   9323 21 00 02      [10] 2017 	ld	hl,#0x0200
   9326 CD F9 7B      [17] 2018 	call	_cpct_isKeyPressed
   9329 7D            [ 4] 2019 	ld	a,l
   932A B7            [ 4] 2020 	or	a, a
                           2021 ;src/main.c:484: moverDerecha();
   932B C2 6F 90      [10] 2022 	jp	NZ,_moverDerecha
                           2023 ;src/main.c:485: else if (cpct_isKeyPressed(Key_CursorUp))
   932E 21 00 01      [10] 2024 	ld	hl,#0x0100
   9331 CD F9 7B      [17] 2025 	call	_cpct_isKeyPressed
   9334 7D            [ 4] 2026 	ld	a,l
   9335 B7            [ 4] 2027 	or	a, a
                           2028 ;src/main.c:486: moverArriba();
   9336 C2 B5 90      [10] 2029 	jp	NZ,_moverArriba
                           2030 ;src/main.c:487: else if (cpct_isKeyPressed(Key_CursorDown))
   9339 21 00 04      [10] 2031 	ld	hl,#0x0400
   933C CD F9 7B      [17] 2032 	call	_cpct_isKeyPressed
   933F 7D            [ 4] 2033 	ld	a,l
   9340 B7            [ 4] 2034 	or	a, a
                           2035 ;src/main.c:488: moverAbajo();
   9341 C2 D9 90      [10] 2036 	jp	NZ,_moverAbajo
                           2037 ;src/main.c:489: else if (cpct_isKeyPressed(Key_Space))
   9344 21 05 80      [10] 2038 	ld	hl,#0x8005
   9347 CD F9 7B      [17] 2039 	call	_cpct_isKeyPressed
   934A 7D            [ 4] 2040 	ld	a,l
   934B B7            [ 4] 2041 	or	a, a
   934C C8            [11] 2042 	ret	Z
                           2043 ;src/main.c:490: lanzarCuchillo();
   934D C3 F3 91      [10] 2044 	jp  _lanzarCuchillo
                           2045 ;src/main.c:494: u8 checkKnifeCollision(int direction){
                           2046 ;	---------------------------------
                           2047 ; Function checkKnifeCollision
                           2048 ; ---------------------------------
   9350                    2049 _checkKnifeCollision::
   9350 DD E5         [15] 2050 	push	ix
   9352 DD 21 00 00   [14] 2051 	ld	ix,#0
   9356 DD 39         [15] 2052 	add	ix,sp
                           2053 ;src/main.c:496: u8 colisiona = 1;
   9358 0E 01         [ 7] 2054 	ld	c,#0x01
                           2055 ;src/main.c:498: switch (direction) {
   935A DD CB 05 7E   [20] 2056 	bit	7, 5 (ix)
   935E C2 26 94      [10] 2057 	jp	NZ,00125$
   9361 3E 03         [ 7] 2058 	ld	a,#0x03
   9363 DD BE 04      [19] 2059 	cp	a, 4 (ix)
   9366 3E 00         [ 7] 2060 	ld	a,#0x00
   9368 DD 9E 05      [19] 2061 	sbc	a, 5 (ix)
   936B E2 70 93      [10] 2062 	jp	PO, 00159$
   936E EE 80         [ 7] 2063 	xor	a, #0x80
   9370                    2064 00159$:
   9370 FA 26 94      [10] 2065 	jp	M,00125$
   9373 DD 5E 04      [19] 2066 	ld	e,4 (ix)
   9376 16 00         [ 7] 2067 	ld	d,#0x00
   9378 21 7F 93      [10] 2068 	ld	hl,#00160$
   937B 19            [11] 2069 	add	hl,de
   937C 19            [11] 2070 	add	hl,de
   937D 19            [11] 2071 	add	hl,de
   937E E9            [ 4] 2072 	jp	(hl)
   937F                    2073 00160$:
   937F C3 26 94      [10] 2074 	jp	00125$
   9382 C3 26 94      [10] 2075 	jp	00125$
   9385 C3 91 93      [10] 2076 	jp	00103$
   9388 C3 C9 93      [10] 2077 	jp	00114$
                           2078 ;src/main.c:499: case 0:
                           2079 ;src/main.c:501: break;
   938B C3 26 94      [10] 2080 	jp	00125$
                           2081 ;src/main.c:502: case 1:
                           2082 ;src/main.c:504: break;
   938E C3 26 94      [10] 2083 	jp	00125$
                           2084 ;src/main.c:505: case 2:
   9391                    2085 00103$:
                           2086 ;src/main.c:507: if((enemy->x + G_ENEMY_W) < cu.x || enemy->x  > (cu.x + G_KNIFEX_0_W)){
   9391 21 A8 88      [10] 2087 	ld	hl,#_enemy+0
   9394 4E            [ 7] 2088 	ld	c,(hl)
   9395 06 00         [ 7] 2089 	ld	b,#0x00
   9397 21 04 00      [10] 2090 	ld	hl,#0x0004
   939A 09            [11] 2091 	add	hl,bc
   939B EB            [ 4] 2092 	ex	de,hl
   939C 21 E4 88      [10] 2093 	ld	hl,#_cu+0
   939F 6E            [ 7] 2094 	ld	l,(hl)
   93A0 26 00         [ 7] 2095 	ld	h,#0x00
   93A2 7B            [ 4] 2096 	ld	a,e
   93A3 95            [ 4] 2097 	sub	a, l
   93A4 7A            [ 4] 2098 	ld	a,d
   93A5 9C            [ 4] 2099 	sbc	a, h
   93A6 E2 AB 93      [10] 2100 	jp	PO, 00161$
   93A9 EE 80         [ 7] 2101 	xor	a, #0x80
   93AB                    2102 00161$:
   93AB FA C9 93      [10] 2103 	jp	M,00114$
   93AE 11 04 00      [10] 2104 	ld	de,#0x0004
   93B1 19            [11] 2105 	add	hl,de
   93B2 7D            [ 4] 2106 	ld	a,l
   93B3 91            [ 4] 2107 	sub	a, c
   93B4 7C            [ 4] 2108 	ld	a,h
   93B5 98            [ 4] 2109 	sbc	a, b
   93B6 E2 BB 93      [10] 2110 	jp	PO, 00162$
   93B9 EE 80         [ 7] 2111 	xor	a, #0x80
   93BB                    2112 00162$:
   93BB FA C9 93      [10] 2113 	jp	M,00114$
                           2114 ;src/main.c:510: if(cu.y>enemy->y){
   93BE 21 E5 88      [10] 2115 	ld	hl, #(_cu + 0x0001) + 0
   93C1 4E            [ 7] 2116 	ld	c,(hl)
   93C2 3A A9 88      [13] 2117 	ld	a,(#(_enemy + 0x0001) + 0)
   93C5 91            [ 4] 2118 	sub	a, c
   93C6 3E 00         [ 7] 2119 	ld	a,#0x00
   93C8 17            [ 4] 2120 	rla
                           2121 ;src/main.c:523: case 3:
   93C9                    2122 00114$:
                           2123 ;src/main.c:525: if((enemy->x + G_ENEMY_W) < cu.x || enemy->x  > (cu.x + G_KNIFEX_0_W)){
   93C9 21 A8 88      [10] 2124 	ld	hl, #_enemy + 0
   93CC 4E            [ 7] 2125 	ld	c,(hl)
   93CD 06 00         [ 7] 2126 	ld	b,#0x00
   93CF 21 04 00      [10] 2127 	ld	hl,#0x0004
   93D2 09            [11] 2128 	add	hl,bc
   93D3 EB            [ 4] 2129 	ex	de,hl
   93D4 21 E4 88      [10] 2130 	ld	hl, #_cu + 0
   93D7 6E            [ 7] 2131 	ld	l,(hl)
   93D8 26 00         [ 7] 2132 	ld	h,#0x00
   93DA 7B            [ 4] 2133 	ld	a,e
   93DB 95            [ 4] 2134 	sub	a, l
   93DC 7A            [ 4] 2135 	ld	a,d
   93DD 9C            [ 4] 2136 	sbc	a, h
   93DE E2 E3 93      [10] 2137 	jp	PO, 00163$
   93E1 EE 80         [ 7] 2138 	xor	a, #0x80
   93E3                    2139 00163$:
   93E3 FA F6 93      [10] 2140 	jp	M,00121$
   93E6 11 04 00      [10] 2141 	ld	de,#0x0004
   93E9 19            [11] 2142 	add	hl,de
   93EA 7D            [ 4] 2143 	ld	a,l
   93EB 91            [ 4] 2144 	sub	a, c
   93EC 7C            [ 4] 2145 	ld	a,h
   93ED 98            [ 4] 2146 	sbc	a, b
   93EE E2 F3 93      [10] 2147 	jp	PO, 00164$
   93F1 EE 80         [ 7] 2148 	xor	a, #0x80
   93F3                    2149 00164$:
   93F3 F2 FA 93      [10] 2150 	jp	P,00122$
   93F6                    2151 00121$:
                           2152 ;src/main.c:526: colisiona = 0;
   93F6 0E 00         [ 7] 2153 	ld	c,#0x00
   93F8 18 2C         [12] 2154 	jr	00125$
   93FA                    2155 00122$:
                           2156 ;src/main.c:528: if(cu.y<enemy->y){
   93FA 21 E5 88      [10] 2157 	ld	hl, #(_cu + 0x0001) + 0
   93FD 4E            [ 7] 2158 	ld	c,(hl)
   93FE 21 A9 88      [10] 2159 	ld	hl, #(_enemy + 0x0001) + 0
   9401 6E            [ 7] 2160 	ld	l,(hl)
   9402 79            [ 4] 2161 	ld	a,c
   9403 95            [ 4] 2162 	sub	a, l
   9404 30 1E         [12] 2163 	jr	NC,00119$
                           2164 ;src/main.c:529: if(enemy->y - (cu.y + G_KNIFEX_0_H - 2) >= 2){
   9406 26 00         [ 7] 2165 	ld	h,#0x00
   9408 06 00         [ 7] 2166 	ld	b,#0x00
   940A 03            [ 6] 2167 	inc	bc
   940B 03            [ 6] 2168 	inc	bc
   940C BF            [ 4] 2169 	cp	a, a
   940D ED 42         [15] 2170 	sbc	hl, bc
   940F 11 02 80      [10] 2171 	ld	de, #0x8002
   9412 29            [11] 2172 	add	hl, hl
   9413 3F            [ 4] 2173 	ccf
   9414 CB 1C         [ 8] 2174 	rr	h
   9416 CB 1D         [ 8] 2175 	rr	l
   9418 ED 52         [15] 2176 	sbc	hl, de
   941A 38 04         [12] 2177 	jr	C,00116$
                           2178 ;src/main.c:530: colisiona = 0;
   941C 0E 00         [ 7] 2179 	ld	c,#0x00
   941E 18 06         [12] 2180 	jr	00125$
   9420                    2181 00116$:
                           2182 ;src/main.c:532: colisiona = 1;
   9420 0E 01         [ 7] 2183 	ld	c,#0x01
   9422 18 02         [12] 2184 	jr	00125$
   9424                    2185 00119$:
                           2186 ;src/main.c:536: colisiona = 0;
   9424 0E 00         [ 7] 2187 	ld	c,#0x00
                           2188 ;src/main.c:539: }
   9426                    2189 00125$:
                           2190 ;src/main.c:540: return colisiona;
   9426 69            [ 4] 2191 	ld	l,c
   9427 DD E1         [14] 2192 	pop	ix
   9429 C9            [10] 2193 	ret
                           2194 ;src/main.c:543: void moverCuchillo(){
                           2195 ;	---------------------------------
                           2196 ; Function moverCuchillo
                           2197 ; ---------------------------------
   942A                    2198 _moverCuchillo::
                           2199 ;src/main.c:545: if(cu.lanzado){
   942A 01 E4 88      [10] 2200 	ld	bc,#_cu+0
   942D 3A EA 88      [13] 2201 	ld	a, (#_cu + 6)
   9430 B7            [ 4] 2202 	or	a, a
   9431 C8            [11] 2203 	ret	Z
                           2204 ;src/main.c:546: cu.mover = 1;
   9432 21 ED 88      [10] 2205 	ld	hl,#(_cu + 0x0009)
   9435 36 01         [10] 2206 	ld	(hl),#0x01
                           2207 ;src/main.c:547: if(cu.direccion == M_derecha){
   9437 21 EB 88      [10] 2208 	ld	hl, #_cu + 7
   943A 6E            [ 7] 2209 	ld	l,(hl)
                           2210 ;src/main.c:549: if( *getTilePtr(cu.x + G_KNIFEX_0_W + 1, cu.y) <= 2){
   943B 59            [ 4] 2211 	ld	e, c
   943C 50            [ 4] 2212 	ld	d, b
   943D 13            [ 6] 2213 	inc	de
                           2214 ;src/main.c:547: if(cu.direccion == M_derecha){
   943E 7D            [ 4] 2215 	ld	a,l
   943F B7            [ 4] 2216 	or	a, a
   9440 20 27         [12] 2217 	jr	NZ,00128$
                           2218 ;src/main.c:549: if( *getTilePtr(cu.x + G_KNIFEX_0_W + 1, cu.y) <= 2){
   9442 1A            [ 7] 2219 	ld	a,(de)
   9443 5F            [ 4] 2220 	ld	e,a
   9444 0A            [ 7] 2221 	ld	a,(bc)
   9445 C6 05         [ 7] 2222 	add	a, #0x05
   9447 6F            [ 4] 2223 	ld	l,a
   9448 C5            [11] 2224 	push	bc
   9449 7B            [ 4] 2225 	ld	a,e
   944A F5            [11] 2226 	push	af
   944B 33            [ 6] 2227 	inc	sp
   944C 7D            [ 4] 2228 	ld	a,l
   944D F5            [11] 2229 	push	af
   944E 33            [ 6] 2230 	inc	sp
   944F CD FC 89      [17] 2231 	call	_getTilePtr
   9452 F1            [10] 2232 	pop	af
   9453 C1            [10] 2233 	pop	bc
   9454 5E            [ 7] 2234 	ld	e,(hl)
   9455 3E 02         [ 7] 2235 	ld	a,#0x02
   9457 93            [ 4] 2236 	sub	a, e
   9458 38 09         [12] 2237 	jr	C,00102$
                           2238 ;src/main.c:550: cu.x++;
   945A 0A            [ 7] 2239 	ld	a,(bc)
   945B 3C            [ 4] 2240 	inc	a
   945C 02            [ 7] 2241 	ld	(bc),a
                           2242 ;src/main.c:551: cu.mover = SI;
   945D 21 ED 88      [10] 2243 	ld	hl,#(_cu + 0x0009)
   9460 36 01         [10] 2244 	ld	(hl),#0x01
   9462 C9            [10] 2245 	ret
   9463                    2246 00102$:
                           2247 ;src/main.c:555: cu.mover=NO;
   9463 21 ED 88      [10] 2248 	ld	hl,#(_cu + 0x0009)
   9466 36 00         [10] 2249 	ld	(hl),#0x00
   9468 C9            [10] 2250 	ret
   9469                    2251 00128$:
                           2252 ;src/main.c:558: else if(cu.direccion == M_izquierda){
   9469 7D            [ 4] 2253 	ld	a,l
   946A 3D            [ 4] 2254 	dec	a
   946B 20 26         [12] 2255 	jr	NZ,00125$
                           2256 ;src/main.c:559: if(*getTilePtr(cu.x - 1, cu.y) <= 2){
   946D 1A            [ 7] 2257 	ld	a,(de)
   946E 5F            [ 4] 2258 	ld	e,a
   946F 0A            [ 7] 2259 	ld	a,(bc)
   9470 57            [ 4] 2260 	ld	d,a
   9471 15            [ 4] 2261 	dec	d
   9472 C5            [11] 2262 	push	bc
   9473 7B            [ 4] 2263 	ld	a,e
   9474 F5            [11] 2264 	push	af
   9475 33            [ 6] 2265 	inc	sp
   9476 D5            [11] 2266 	push	de
   9477 33            [ 6] 2267 	inc	sp
   9478 CD FC 89      [17] 2268 	call	_getTilePtr
   947B F1            [10] 2269 	pop	af
   947C C1            [10] 2270 	pop	bc
   947D 5E            [ 7] 2271 	ld	e,(hl)
   947E 3E 02         [ 7] 2272 	ld	a,#0x02
   9480 93            [ 4] 2273 	sub	a, e
   9481 38 0A         [12] 2274 	jr	C,00105$
                           2275 ;src/main.c:560: cu.x--;
   9483 0A            [ 7] 2276 	ld	a,(bc)
   9484 C6 FF         [ 7] 2277 	add	a,#0xFF
   9486 02            [ 7] 2278 	ld	(bc),a
                           2279 ;src/main.c:561: cu.mover = SI;
   9487 21 ED 88      [10] 2280 	ld	hl,#(_cu + 0x0009)
   948A 36 01         [10] 2281 	ld	(hl),#0x01
   948C C9            [10] 2282 	ret
   948D                    2283 00105$:
                           2284 ;src/main.c:564: cu.mover=NO;
   948D 21 ED 88      [10] 2285 	ld	hl,#(_cu + 0x0009)
   9490 36 00         [10] 2286 	ld	(hl),#0x00
   9492 C9            [10] 2287 	ret
   9493                    2288 00125$:
                           2289 ;src/main.c:567: else if(cu.direccion == M_arriba){
   9493 7D            [ 4] 2290 	ld	a,l
   9494 D6 02         [ 7] 2291 	sub	a, #0x02
   9496 20 3E         [12] 2292 	jr	NZ,00122$
                           2293 ;src/main.c:568: if(*getTilePtr(cu.x, cu.y - 2) <= 2){
   9498 1A            [ 7] 2294 	ld	a,(de)
   9499 C6 FE         [ 7] 2295 	add	a,#0xFE
   949B F5            [11] 2296 	push	af
   949C 0A            [ 7] 2297 	ld	a,(bc)
   949D 47            [ 4] 2298 	ld	b,a
   949E F1            [10] 2299 	pop	af
   949F D5            [11] 2300 	push	de
   94A0 F5            [11] 2301 	push	af
   94A1 33            [ 6] 2302 	inc	sp
   94A2 C5            [11] 2303 	push	bc
   94A3 33            [ 6] 2304 	inc	sp
   94A4 CD FC 89      [17] 2305 	call	_getTilePtr
   94A7 F1            [10] 2306 	pop	af
   94A8 D1            [10] 2307 	pop	de
   94A9 4E            [ 7] 2308 	ld	c,(hl)
   94AA 3E 02         [ 7] 2309 	ld	a,#0x02
   94AC 91            [ 4] 2310 	sub	a, c
   94AD 38 21         [12] 2311 	jr	C,00111$
                           2312 ;src/main.c:569: if(!checkKnifeCollision(M_arriba)){
   94AF D5            [11] 2313 	push	de
   94B0 21 02 00      [10] 2314 	ld	hl,#0x0002
   94B3 E5            [11] 2315 	push	hl
   94B4 CD 50 93      [17] 2316 	call	_checkKnifeCollision
   94B7 F1            [10] 2317 	pop	af
   94B8 D1            [10] 2318 	pop	de
   94B9 7D            [ 4] 2319 	ld	a,l
   94BA B7            [ 4] 2320 	or	a, a
   94BB 20 0D         [12] 2321 	jr	NZ,00108$
                           2322 ;src/main.c:570: cu.y--;
   94BD 1A            [ 7] 2323 	ld	a,(de)
   94BE C6 FF         [ 7] 2324 	add	a,#0xFF
   94C0 12            [ 7] 2325 	ld	(de),a
                           2326 ;src/main.c:571: cu.y--;
   94C1 C6 FF         [ 7] 2327 	add	a,#0xFF
   94C3 12            [ 7] 2328 	ld	(de),a
                           2329 ;src/main.c:572: cu.mover = SI;
   94C4 21 ED 88      [10] 2330 	ld	hl,#(_cu + 0x0009)
   94C7 36 01         [10] 2331 	ld	(hl),#0x01
   94C9 C9            [10] 2332 	ret
   94CA                    2333 00108$:
                           2334 ;src/main.c:575: cu.mover=NO;
   94CA 21 ED 88      [10] 2335 	ld	hl,#(_cu + 0x0009)
   94CD 36 00         [10] 2336 	ld	(hl),#0x00
   94CF C9            [10] 2337 	ret
   94D0                    2338 00111$:
                           2339 ;src/main.c:578: cu.mover=NO;
   94D0 21 ED 88      [10] 2340 	ld	hl,#(_cu + 0x0009)
   94D3 36 00         [10] 2341 	ld	(hl),#0x00
   94D5 C9            [10] 2342 	ret
   94D6                    2343 00122$:
                           2344 ;src/main.c:583: else if(cu.direccion == M_abajo){
   94D6 7D            [ 4] 2345 	ld	a,l
   94D7 D6 03         [ 7] 2346 	sub	a, #0x03
   94D9 C0            [11] 2347 	ret	NZ
                           2348 ;src/main.c:584: if(*getTilePtr(cu.x, cu.y + G_KNIFEY_0_H + 2) <= 2){
   94DA 1A            [ 7] 2349 	ld	a,(de)
   94DB C6 0A         [ 7] 2350 	add	a, #0x0A
   94DD F5            [11] 2351 	push	af
   94DE 0A            [ 7] 2352 	ld	a,(bc)
   94DF 47            [ 4] 2353 	ld	b,a
   94E0 F1            [10] 2354 	pop	af
   94E1 D5            [11] 2355 	push	de
   94E2 F5            [11] 2356 	push	af
   94E3 33            [ 6] 2357 	inc	sp
   94E4 C5            [11] 2358 	push	bc
   94E5 33            [ 6] 2359 	inc	sp
   94E6 CD FC 89      [17] 2360 	call	_getTilePtr
   94E9 F1            [10] 2361 	pop	af
   94EA D1            [10] 2362 	pop	de
   94EB 4E            [ 7] 2363 	ld	c,(hl)
   94EC 3E 02         [ 7] 2364 	ld	a,#0x02
   94EE 91            [ 4] 2365 	sub	a, c
   94EF 38 1F         [12] 2366 	jr	C,00117$
                           2367 ;src/main.c:585: if(!checkKnifeCollision(M_abajo)){
   94F1 D5            [11] 2368 	push	de
   94F2 21 03 00      [10] 2369 	ld	hl,#0x0003
   94F5 E5            [11] 2370 	push	hl
   94F6 CD 50 93      [17] 2371 	call	_checkKnifeCollision
   94F9 F1            [10] 2372 	pop	af
   94FA D1            [10] 2373 	pop	de
   94FB 7D            [ 4] 2374 	ld	a,l
   94FC B7            [ 4] 2375 	or	a, a
   94FD 20 0B         [12] 2376 	jr	NZ,00114$
                           2377 ;src/main.c:586: cu.y++;
   94FF 1A            [ 7] 2378 	ld	a,(de)
   9500 3C            [ 4] 2379 	inc	a
   9501 12            [ 7] 2380 	ld	(de),a
                           2381 ;src/main.c:587: cu.y++;
   9502 3C            [ 4] 2382 	inc	a
   9503 12            [ 7] 2383 	ld	(de),a
                           2384 ;src/main.c:588: cu.mover = SI;
   9504 21 ED 88      [10] 2385 	ld	hl,#(_cu + 0x0009)
   9507 36 01         [10] 2386 	ld	(hl),#0x01
   9509 C9            [10] 2387 	ret
   950A                    2388 00114$:
                           2389 ;src/main.c:591: cu.mover=NO;
   950A 21 ED 88      [10] 2390 	ld	hl,#(_cu + 0x0009)
   950D 36 00         [10] 2391 	ld	(hl),#0x00
   950F C9            [10] 2392 	ret
   9510                    2393 00117$:
                           2394 ;src/main.c:594: cu.mover=NO;
   9510 21 ED 88      [10] 2395 	ld	hl,#(_cu + 0x0009)
   9513 36 00         [10] 2396 	ld	(hl),#0x00
   9515 C9            [10] 2397 	ret
                           2398 ;src/main.c:600: void barraPuntuacionInicial(){
                           2399 ;	---------------------------------
                           2400 ; Function barraPuntuacionInicial
                           2401 ; ---------------------------------
   9516                    2402 _barraPuntuacionInicial::
                           2403 ;src/main.c:605: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   9516 21 00 02      [10] 2404 	ld	hl,#0x0200
   9519 E5            [11] 2405 	push	hl
   951A 26 C0         [ 7] 2406 	ld	h, #0xC0
   951C E5            [11] 2407 	push	hl
   951D CD 4B 88      [17] 2408 	call	_cpct_getScreenPtr
   9520 4D            [ 4] 2409 	ld	c,l
   9521 44            [ 4] 2410 	ld	b,h
                           2411 ;src/main.c:606: cpct_drawStringM0("SCORE", memptr, 1, 0);
   9522 21 01 00      [10] 2412 	ld	hl,#0x0001
   9525 E5            [11] 2413 	push	hl
   9526 C5            [11] 2414 	push	bc
   9527 21 BE 95      [10] 2415 	ld	hl,#___str_1
   952A E5            [11] 2416 	push	hl
   952B CD 7B 7C      [17] 2417 	call	_cpct_drawStringM0
   952E 21 06 00      [10] 2418 	ld	hl,#6
   9531 39            [11] 2419 	add	hl,sp
   9532 F9            [ 6] 2420 	ld	sp,hl
                           2421 ;src/main.c:607: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   9533 21 00 0E      [10] 2422 	ld	hl,#0x0E00
   9536 E5            [11] 2423 	push	hl
   9537 26 C0         [ 7] 2424 	ld	h, #0xC0
   9539 E5            [11] 2425 	push	hl
   953A CD 4B 88      [17] 2426 	call	_cpct_getScreenPtr
   953D 4D            [ 4] 2427 	ld	c,l
   953E 44            [ 4] 2428 	ld	b,h
                           2429 ;src/main.c:608: cpct_drawStringM0("00000", memptr, 15, 0);
   953F 21 0F 00      [10] 2430 	ld	hl,#0x000F
   9542 E5            [11] 2431 	push	hl
   9543 C5            [11] 2432 	push	bc
   9544 21 C4 95      [10] 2433 	ld	hl,#___str_2
   9547 E5            [11] 2434 	push	hl
   9548 CD 7B 7C      [17] 2435 	call	_cpct_drawStringM0
   954B 21 06 00      [10] 2436 	ld	hl,#6
   954E 39            [11] 2437 	add	hl,sp
   954F F9            [ 6] 2438 	ld	sp,hl
                           2439 ;src/main.c:611: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 14);
   9550 21 1A 0E      [10] 2440 	ld	hl,#0x0E1A
   9553 E5            [11] 2441 	push	hl
   9554 21 00 C0      [10] 2442 	ld	hl,#0xC000
   9557 E5            [11] 2443 	push	hl
   9558 CD 4B 88      [17] 2444 	call	_cpct_getScreenPtr
   955B 4D            [ 4] 2445 	ld	c,l
   955C 44            [ 4] 2446 	ld	b,h
                           2447 ;src/main.c:612: cpct_drawStringM0("ROBOBIT", memptr, 3, 0);
   955D 21 03 00      [10] 2448 	ld	hl,#0x0003
   9560 E5            [11] 2449 	push	hl
   9561 C5            [11] 2450 	push	bc
   9562 21 CA 95      [10] 2451 	ld	hl,#___str_3
   9565 E5            [11] 2452 	push	hl
   9566 CD 7B 7C      [17] 2453 	call	_cpct_drawStringM0
   9569 21 06 00      [10] 2454 	ld	hl,#6
   956C 39            [11] 2455 	add	hl,sp
   956D F9            [ 6] 2456 	ld	sp,hl
                           2457 ;src/main.c:614: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   956E 21 3C 02      [10] 2458 	ld	hl,#0x023C
   9571 E5            [11] 2459 	push	hl
   9572 21 00 C0      [10] 2460 	ld	hl,#0xC000
   9575 E5            [11] 2461 	push	hl
   9576 CD 4B 88      [17] 2462 	call	_cpct_getScreenPtr
   9579 4D            [ 4] 2463 	ld	c,l
   957A 44            [ 4] 2464 	ld	b,h
                           2465 ;src/main.c:615: cpct_drawStringM0("LIVES", memptr, 1, 0);
   957B 21 01 00      [10] 2466 	ld	hl,#0x0001
   957E E5            [11] 2467 	push	hl
   957F C5            [11] 2468 	push	bc
   9580 21 D2 95      [10] 2469 	ld	hl,#___str_4
   9583 E5            [11] 2470 	push	hl
   9584 CD 7B 7C      [17] 2471 	call	_cpct_drawStringM0
   9587 21 06 00      [10] 2472 	ld	hl,#6
   958A 39            [11] 2473 	add	hl,sp
   958B F9            [ 6] 2474 	ld	sp,hl
                           2475 ;src/main.c:617: for(i=0; i<5; i++){
   958C 01 00 00      [10] 2476 	ld	bc,#0x0000
   958F                    2477 00102$:
                           2478 ;src/main.c:618: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   958F 79            [ 4] 2479 	ld	a,c
   9590 87            [ 4] 2480 	add	a, a
   9591 87            [ 4] 2481 	add	a, a
   9592 C6 3C         [ 7] 2482 	add	a, #0x3C
   9594 57            [ 4] 2483 	ld	d,a
   9595 C5            [11] 2484 	push	bc
   9596 3E 0E         [ 7] 2485 	ld	a,#0x0E
   9598 F5            [11] 2486 	push	af
   9599 33            [ 6] 2487 	inc	sp
   959A D5            [11] 2488 	push	de
   959B 33            [ 6] 2489 	inc	sp
   959C 21 00 C0      [10] 2490 	ld	hl,#0xC000
   959F E5            [11] 2491 	push	hl
   95A0 CD 4B 88      [17] 2492 	call	_cpct_getScreenPtr
   95A3 EB            [ 4] 2493 	ex	de,hl
   95A4 21 03 06      [10] 2494 	ld	hl,#0x0603
   95A7 E5            [11] 2495 	push	hl
   95A8 D5            [11] 2496 	push	de
   95A9 21 60 78      [10] 2497 	ld	hl,#_g_heart
   95AC E5            [11] 2498 	push	hl
   95AD CD 9F 7C      [17] 2499 	call	_cpct_drawSprite
   95B0 C1            [10] 2500 	pop	bc
                           2501 ;src/main.c:617: for(i=0; i<5; i++){
   95B1 03            [ 6] 2502 	inc	bc
   95B2 79            [ 4] 2503 	ld	a,c
   95B3 D6 05         [ 7] 2504 	sub	a, #0x05
   95B5 78            [ 4] 2505 	ld	a,b
   95B6 17            [ 4] 2506 	rla
   95B7 3F            [ 4] 2507 	ccf
   95B8 1F            [ 4] 2508 	rra
   95B9 DE 80         [ 7] 2509 	sbc	a, #0x80
   95BB 38 D2         [12] 2510 	jr	C,00102$
   95BD C9            [10] 2511 	ret
   95BE                    2512 ___str_1:
   95BE 53 43 4F 52 45     2513 	.ascii "SCORE"
   95C3 00                 2514 	.db 0x00
   95C4                    2515 ___str_2:
   95C4 30 30 30 30 30     2516 	.ascii "00000"
   95C9 00                 2517 	.db 0x00
   95CA                    2518 ___str_3:
   95CA 52 4F 42 4F 42 49  2519 	.ascii "ROBOBIT"
        54
   95D1 00                 2520 	.db 0x00
   95D2                    2521 ___str_4:
   95D2 4C 49 56 45 53     2522 	.ascii "LIVES"
   95D7 00                 2523 	.db 0x00
                           2524 ;src/main.c:623: void borrarPantallaArriba(u8 x, u8 y, u8 ancho, u8 alto){
                           2525 ;	---------------------------------
                           2526 ; Function borrarPantallaArriba
                           2527 ; ---------------------------------
   95D8                    2528 _borrarPantallaArriba::
   95D8 DD E5         [15] 2529 	push	ix
   95DA DD 21 00 00   [14] 2530 	ld	ix,#0
   95DE DD 39         [15] 2531 	add	ix,sp
                           2532 ;src/main.c:626: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   95E0 DD 66 05      [19] 2533 	ld	h,5 (ix)
   95E3 DD 6E 04      [19] 2534 	ld	l,4 (ix)
   95E6 E5            [11] 2535 	push	hl
   95E7 21 00 C0      [10] 2536 	ld	hl,#0xC000
   95EA E5            [11] 2537 	push	hl
   95EB CD 4B 88      [17] 2538 	call	_cpct_getScreenPtr
   95EE 4D            [ 4] 2539 	ld	c,l
   95EF 44            [ 4] 2540 	ld	b,h
                           2541 ;src/main.c:627: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra la mitad derecha
   95F0 DD 66 07      [19] 2542 	ld	h,7 (ix)
   95F3 DD 6E 06      [19] 2543 	ld	l,6 (ix)
   95F6 E5            [11] 2544 	push	hl
   95F7 AF            [ 4] 2545 	xor	a, a
   95F8 F5            [11] 2546 	push	af
   95F9 33            [ 6] 2547 	inc	sp
   95FA C5            [11] 2548 	push	bc
   95FB CD 71 87      [17] 2549 	call	_cpct_drawSolidBox
   95FE F1            [10] 2550 	pop	af
   95FF F1            [10] 2551 	pop	af
   9600 33            [ 6] 2552 	inc	sp
                           2553 ;src/main.c:628: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   9601 DD 7E 04      [19] 2554 	ld	a,4 (ix)
   9604 C6 28         [ 7] 2555 	add	a, #0x28
   9606 47            [ 4] 2556 	ld	b,a
   9607 DD 7E 05      [19] 2557 	ld	a,5 (ix)
   960A F5            [11] 2558 	push	af
   960B 33            [ 6] 2559 	inc	sp
   960C C5            [11] 2560 	push	bc
   960D 33            [ 6] 2561 	inc	sp
   960E 21 00 C0      [10] 2562 	ld	hl,#0xC000
   9611 E5            [11] 2563 	push	hl
   9612 CD 4B 88      [17] 2564 	call	_cpct_getScreenPtr
   9615 4D            [ 4] 2565 	ld	c,l
   9616 44            [ 4] 2566 	ld	b,h
                           2567 ;src/main.c:629: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra la mitad izquierda
   9617 DD 66 07      [19] 2568 	ld	h,7 (ix)
   961A DD 6E 06      [19] 2569 	ld	l,6 (ix)
   961D E5            [11] 2570 	push	hl
   961E AF            [ 4] 2571 	xor	a, a
   961F F5            [11] 2572 	push	af
   9620 33            [ 6] 2573 	inc	sp
   9621 C5            [11] 2574 	push	bc
   9622 CD 71 87      [17] 2575 	call	_cpct_drawSolidBox
   9625 F1            [10] 2576 	pop	af
   9626 F1            [10] 2577 	pop	af
   9627 33            [ 6] 2578 	inc	sp
   9628 DD E1         [14] 2579 	pop	ix
   962A C9            [10] 2580 	ret
                           2581 ;src/main.c:632: void menuInicio(){
                           2582 ;	---------------------------------
                           2583 ; Function menuInicio
                           2584 ; ---------------------------------
   962B                    2585 _menuInicio::
                           2586 ;src/main.c:636: cpct_clearScreen(0);
   962B 21 00 40      [10] 2587 	ld	hl,#0x4000
   962E E5            [11] 2588 	push	hl
   962F AF            [ 4] 2589 	xor	a, a
   9630 F5            [11] 2590 	push	af
   9631 33            [ 6] 2591 	inc	sp
   9632 26 C0         [ 7] 2592 	ld	h, #0xC0
   9634 E5            [11] 2593 	push	hl
   9635 CD 2A 7F      [17] 2594 	call	_cpct_memset
                           2595 ;src/main.c:638: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   9638 21 1A 0F      [10] 2596 	ld	hl,#0x0F1A
   963B E5            [11] 2597 	push	hl
   963C 21 00 C0      [10] 2598 	ld	hl,#0xC000
   963F E5            [11] 2599 	push	hl
   9640 CD 4B 88      [17] 2600 	call	_cpct_getScreenPtr
   9643 4D            [ 4] 2601 	ld	c,l
   9644 44            [ 4] 2602 	ld	b,h
                           2603 ;src/main.c:639: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   9645 21 04 00      [10] 2604 	ld	hl,#0x0004
   9648 E5            [11] 2605 	push	hl
   9649 C5            [11] 2606 	push	bc
   964A 21 DE 96      [10] 2607 	ld	hl,#___str_5
   964D E5            [11] 2608 	push	hl
   964E CD 7B 7C      [17] 2609 	call	_cpct_drawStringM0
   9651 21 06 00      [10] 2610 	ld	hl,#6
   9654 39            [11] 2611 	add	hl,sp
   9655 F9            [ 6] 2612 	ld	sp,hl
                           2613 ;src/main.c:641: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   9656 21 28 6E      [10] 2614 	ld	hl,#0x6E28
   9659 E5            [11] 2615 	push	hl
   965A 21 F0 F0      [10] 2616 	ld	hl,#0xF0F0
   965D E5            [11] 2617 	push	hl
   965E 21 00 56      [10] 2618 	ld	hl,#_g_text_0
   9661 E5            [11] 2619 	push	hl
   9662 CD 9F 7C      [17] 2620 	call	_cpct_drawSprite
                           2621 ;src/main.c:642: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   9665 21 28 6E      [10] 2622 	ld	hl,#0x6E28
   9668 E5            [11] 2623 	push	hl
   9669 21 18 F1      [10] 2624 	ld	hl,#0xF118
   966C E5            [11] 2625 	push	hl
   966D 21 30 67      [10] 2626 	ld	hl,#_g_text_1
   9670 E5            [11] 2627 	push	hl
   9671 CD 9F 7C      [17] 2628 	call	_cpct_drawSprite
                           2629 ;src/main.c:665: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   9674 21 08 A0      [10] 2630 	ld	hl,#0xA008
   9677 E5            [11] 2631 	push	hl
   9678 21 00 C0      [10] 2632 	ld	hl,#0xC000
   967B E5            [11] 2633 	push	hl
   967C CD 4B 88      [17] 2634 	call	_cpct_getScreenPtr
   967F 4D            [ 4] 2635 	ld	c,l
   9680 44            [ 4] 2636 	ld	b,h
                           2637 ;src/main.c:666: cpct_drawStringM0("TO START PRESS S", memptr, 4, 0);
   9681 21 04 00      [10] 2638 	ld	hl,#0x0004
   9684 E5            [11] 2639 	push	hl
   9685 C5            [11] 2640 	push	bc
   9686 21 E6 96      [10] 2641 	ld	hl,#___str_6
   9689 E5            [11] 2642 	push	hl
   968A CD 7B 7C      [17] 2643 	call	_cpct_drawStringM0
   968D 21 06 00      [10] 2644 	ld	hl,#6
   9690 39            [11] 2645 	add	hl,sp
   9691 F9            [ 6] 2646 	ld	sp,hl
                           2647 ;src/main.c:668: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 170); // centrado en horizontal y abajo en vertical
   9692 21 0A AA      [10] 2648 	ld	hl,#0xAA0A
   9695 E5            [11] 2649 	push	hl
   9696 21 00 C0      [10] 2650 	ld	hl,#0xC000
   9699 E5            [11] 2651 	push	hl
   969A CD 4B 88      [17] 2652 	call	_cpct_getScreenPtr
   969D 4D            [ 4] 2653 	ld	c,l
   969E 44            [ 4] 2654 	ld	b,h
                           2655 ;src/main.c:669: cpct_drawStringM0("TO MENU PRESS M", memptr, 4, 0);
   969F 21 04 00      [10] 2656 	ld	hl,#0x0004
   96A2 E5            [11] 2657 	push	hl
   96A3 C5            [11] 2658 	push	bc
   96A4 21 F7 96      [10] 2659 	ld	hl,#___str_7
   96A7 E5            [11] 2660 	push	hl
   96A8 CD 7B 7C      [17] 2661 	call	_cpct_drawStringM0
   96AB 21 06 00      [10] 2662 	ld	hl,#6
   96AE 39            [11] 2663 	add	hl,sp
   96AF F9            [ 6] 2664 	ld	sp,hl
                           2665 ;src/main.c:672: do{
   96B0                    2666 00106$:
                           2667 ;src/main.c:673: cpct_scanKeyboard_f();
   96B0 CD 05 7C      [17] 2668 	call	_cpct_scanKeyboard_f
                           2669 ;src/main.c:677: if(cpct_isKeyPressed(Key_M)){
   96B3 21 04 40      [10] 2670 	ld	hl,#0x4004
   96B6 CD F9 7B      [17] 2671 	call	_cpct_isKeyPressed
   96B9 7D            [ 4] 2672 	ld	a,l
   96BA B7            [ 4] 2673 	or	a, a
   96BB 28 0D         [12] 2674 	jr	Z,00107$
                           2675 ;src/main.c:678: cpct_scanKeyboard_f();
   96BD CD 05 7C      [17] 2676 	call	_cpct_scanKeyboard_f
                           2677 ;src/main.c:679: do{
   96C0                    2678 00101$:
                           2679 ;src/main.c:681: } while(!cpct_isKeyPressed(Key_S));
   96C0 21 07 10      [10] 2680 	ld	hl,#0x1007
   96C3 CD F9 7B      [17] 2681 	call	_cpct_isKeyPressed
   96C6 7D            [ 4] 2682 	ld	a,l
   96C7 B7            [ 4] 2683 	or	a, a
   96C8 28 F6         [12] 2684 	jr	Z,00101$
   96CA                    2685 00107$:
                           2686 ;src/main.c:683: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   96CA 21 07 10      [10] 2687 	ld	hl,#0x1007
   96CD CD F9 7B      [17] 2688 	call	_cpct_isKeyPressed
   96D0 7D            [ 4] 2689 	ld	a,l
   96D1 B7            [ 4] 2690 	or	a, a
   96D2 C0            [11] 2691 	ret	NZ
   96D3 21 04 40      [10] 2692 	ld	hl,#0x4004
   96D6 CD F9 7B      [17] 2693 	call	_cpct_isKeyPressed
   96D9 7D            [ 4] 2694 	ld	a,l
   96DA B7            [ 4] 2695 	or	a, a
   96DB 28 D3         [12] 2696 	jr	Z,00106$
   96DD C9            [10] 2697 	ret
   96DE                    2698 ___str_5:
   96DE 52 4F 42 4F 42 49  2699 	.ascii "ROBOBIT"
        54
   96E5 00                 2700 	.db 0x00
   96E6                    2701 ___str_6:
   96E6 54 4F 20 53 54 41  2702 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   96F6 00                 2703 	.db 0x00
   96F7                    2704 ___str_7:
   96F7 54 4F 20 4D 45 4E  2705 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   9706 00                 2706 	.db 0x00
                           2707 ;src/main.c:686: void inicializarCPC() {
                           2708 ;	---------------------------------
                           2709 ; Function inicializarCPC
                           2710 ; ---------------------------------
   9707                    2711 _inicializarCPC::
                           2712 ;src/main.c:687: cpct_disableFirmware();
   9707 CD 61 87      [17] 2713 	call	_cpct_disableFirmware
                           2714 ;src/main.c:688: cpct_setVideoMode(0);
   970A 2E 00         [ 7] 2715 	ld	l,#0x00
   970C CD 0C 7F      [17] 2716 	call	_cpct_setVideoMode
                           2717 ;src/main.c:689: cpct_setBorder(HW_BLACK);
   970F 21 10 14      [10] 2718 	ld	hl,#0x1410
   9712 E5            [11] 2719 	push	hl
   9713 CD 6F 7C      [17] 2720 	call	_cpct_setPALColour
                           2721 ;src/main.c:690: cpct_setPalette(g_palette, 16);
   9716 21 10 00      [10] 2722 	ld	hl,#0x0010
   9719 E5            [11] 2723 	push	hl
   971A 21 98 7A      [10] 2724 	ld	hl,#_g_palette
   971D E5            [11] 2725 	push	hl
   971E CD E2 7B      [17] 2726 	call	_cpct_setPalette
                           2727 ;src/main.c:691: cpct_akp_musicInit(G_song);
   9721 21 00 3F      [10] 2728 	ld	hl,#_G_song
   9724 E5            [11] 2729 	push	hl
   9725 CD 3D 86      [17] 2730 	call	_cpct_akp_musicInit
   9728 F1            [10] 2731 	pop	af
   9729 C9            [10] 2732 	ret
                           2733 ;src/main.c:694: void inicializarEnemy() {
                           2734 ;	---------------------------------
                           2735 ; Function inicializarEnemy
                           2736 ; ---------------------------------
   972A                    2737 _inicializarEnemy::
   972A DD E5         [15] 2738 	push	ix
   972C DD 21 00 00   [14] 2739 	ld	ix,#0
   9730 DD 39         [15] 2740 	add	ix,sp
   9732 3B            [ 6] 2741 	dec	sp
                           2742 ;src/main.c:700: actual = enemy;
   9733 01 A8 88      [10] 2743 	ld	bc,#_enemy+0
                           2744 ;src/main.c:701: while(--i){
   9736 DD 36 FF 05   [19] 2745 	ld	-1 (ix),#0x05
   973A                    2746 00101$:
   973A DD 35 FF      [23] 2747 	dec	-1 (ix)
   973D DD 7E FF      [19] 2748 	ld	a,-1 (ix)
   9740 B7            [ 4] 2749 	or	a, a
   9741 28 62         [12] 2750 	jr	Z,00104$
                           2751 ;src/main.c:702: actual->x = actual->px = spawnX[i];
   9743 59            [ 4] 2752 	ld	e, c
   9744 50            [ 4] 2753 	ld	d, b
   9745 13            [ 6] 2754 	inc	de
   9746 13            [ 6] 2755 	inc	de
   9747 3E 0D         [ 7] 2756 	ld	a,#<(_spawnX)
   9749 DD 86 FF      [19] 2757 	add	a, -1 (ix)
   974C 6F            [ 4] 2758 	ld	l,a
   974D 3E 89         [ 7] 2759 	ld	a,#>(_spawnX)
   974F CE 00         [ 7] 2760 	adc	a, #0x00
   9751 67            [ 4] 2761 	ld	h,a
   9752 7E            [ 7] 2762 	ld	a,(hl)
   9753 12            [ 7] 2763 	ld	(de),a
   9754 02            [ 7] 2764 	ld	(bc),a
                           2765 ;src/main.c:703: actual->y = actual->py = spawnY[i];
   9755 C5            [11] 2766 	push	bc
   9756 FD E1         [14] 2767 	pop	iy
   9758 FD 23         [10] 2768 	inc	iy
   975A 59            [ 4] 2769 	ld	e, c
   975B 50            [ 4] 2770 	ld	d, b
   975C 13            [ 6] 2771 	inc	de
   975D 13            [ 6] 2772 	inc	de
   975E 13            [ 6] 2773 	inc	de
   975F 3E 12         [ 7] 2774 	ld	a,#<(_spawnY)
   9761 DD 86 FF      [19] 2775 	add	a, -1 (ix)
   9764 6F            [ 4] 2776 	ld	l,a
   9765 3E 89         [ 7] 2777 	ld	a,#>(_spawnY)
   9767 CE 00         [ 7] 2778 	adc	a, #0x00
   9769 67            [ 4] 2779 	ld	h,a
   976A 7E            [ 7] 2780 	ld	a,(hl)
   976B 12            [ 7] 2781 	ld	(de),a
   976C FD 77 00      [19] 2782 	ld	0 (iy), a
                           2783 ;src/main.c:704: actual->mover  = NO;
   976F 21 06 00      [10] 2784 	ld	hl,#0x0006
   9772 09            [11] 2785 	add	hl,bc
   9773 36 00         [10] 2786 	ld	(hl),#0x00
                           2787 ;src/main.c:705: actual->mira   = M_abajo;
   9775 21 07 00      [10] 2788 	ld	hl,#0x0007
   9778 09            [11] 2789 	add	hl,bc
   9779 36 03         [10] 2790 	ld	(hl),#0x03
                           2791 ;src/main.c:706: actual->sprite = g_enemy;
   977B 21 04 00      [10] 2792 	ld	hl,#0x0004
   977E 09            [11] 2793 	add	hl,bc
   977F 36 72         [10] 2794 	ld	(hl),#<(_g_enemy)
   9781 23            [ 6] 2795 	inc	hl
   9782 36 78         [10] 2796 	ld	(hl),#>(_g_enemy)
                           2797 ;src/main.c:707: actual->muerto = NO;
   9784 21 08 00      [10] 2798 	ld	hl,#0x0008
   9787 09            [11] 2799 	add	hl,bc
   9788 36 00         [10] 2800 	ld	(hl),#0x00
                           2801 ;src/main.c:708: actual->muertes = 0;
   978A 21 0C 00      [10] 2802 	ld	hl,#0x000C
   978D 09            [11] 2803 	add	hl,bc
   978E 36 00         [10] 2804 	ld	(hl),#0x00
                           2805 ;src/main.c:709: actual->patroling = SI;
   9790 21 09 00      [10] 2806 	ld	hl,#0x0009
   9793 09            [11] 2807 	add	hl,bc
   9794 36 01         [10] 2808 	ld	(hl),#0x01
                           2809 ;src/main.c:711: dibujarEnemigo(actual);
   9796 C5            [11] 2810 	push	bc
   9797 C5            [11] 2811 	push	bc
   9798 CD 92 8B      [17] 2812 	call	_dibujarEnemigo
   979B F1            [10] 2813 	pop	af
   979C C1            [10] 2814 	pop	bc
                           2815 ;src/main.c:713: ++actual;
   979D 21 0D 00      [10] 2816 	ld	hl,#0x000D
   97A0 09            [11] 2817 	add	hl,bc
   97A1 4D            [ 4] 2818 	ld	c,l
   97A2 44            [ 4] 2819 	ld	b,h
   97A3 18 95         [12] 2820 	jr	00101$
   97A5                    2821 00104$:
   97A5 33            [ 6] 2822 	inc	sp
   97A6 DD E1         [14] 2823 	pop	ix
   97A8 C9            [10] 2824 	ret
                           2825 ;src/main.c:717: void inicializarJuego() {
                           2826 ;	---------------------------------
                           2827 ; Function inicializarJuego
                           2828 ; ---------------------------------
   97A9                    2829 _inicializarJuego::
                           2830 ;src/main.c:719: num_mapa = 0;
   97A9 21 F0 88      [10] 2831 	ld	hl,#_num_mapa + 0
   97AC 36 00         [10] 2832 	ld	(hl), #0x00
                           2833 ;src/main.c:720: mapa = mapas[num_mapa];
   97AE 21 07 89      [10] 2834 	ld	hl, #_mapas + 0
   97B1 7E            [ 7] 2835 	ld	a,(hl)
   97B2 FD 21 EE 88   [14] 2836 	ld	iy,#_mapa
   97B6 FD 77 00      [19] 2837 	ld	0 (iy),a
   97B9 23            [ 6] 2838 	inc	hl
   97BA 7E            [ 7] 2839 	ld	a,(hl)
   97BB 32 EF 88      [13] 2840 	ld	(#_mapa + 1),a
                           2841 ;src/main.c:721: cpct_etm_setTileset2x4(g_tileset);
   97BE 21 E0 54      [10] 2842 	ld	hl,#_g_tileset
   97C1 CD D3 7D      [17] 2843 	call	_cpct_etm_setTileset2x4
                           2844 ;src/main.c:723: dibujarMapa();
   97C4 CD F1 88      [17] 2845 	call	_dibujarMapa
                           2846 ;src/main.c:725: borrarPantallaArriba(0, 0, 40, 1);
   97C7 21 28 01      [10] 2847 	ld	hl,#0x0128
   97CA E5            [11] 2848 	push	hl
   97CB 21 00 00      [10] 2849 	ld	hl,#0x0000
   97CE E5            [11] 2850 	push	hl
   97CF CD D8 95      [17] 2851 	call	_borrarPantallaArriba
   97D2 F1            [10] 2852 	pop	af
   97D3 F1            [10] 2853 	pop	af
                           2854 ;src/main.c:726: barraPuntuacionInicial();
   97D4 CD 16 95      [17] 2855 	call	_barraPuntuacionInicial
                           2856 ;src/main.c:729: prota.x = prota.px = 4;
   97D7 21 DE 88      [10] 2857 	ld	hl,#(_prota + 0x0002)
   97DA 36 04         [10] 2858 	ld	(hl),#0x04
   97DC 21 DC 88      [10] 2859 	ld	hl,#_prota
   97DF 36 04         [10] 2860 	ld	(hl),#0x04
                           2861 ;src/main.c:730: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   97E1 21 DF 88      [10] 2862 	ld	hl,#(_prota + 0x0003)
   97E4 36 68         [10] 2863 	ld	(hl),#0x68
   97E6 21 DD 88      [10] 2864 	ld	hl,#(_prota + 0x0001)
   97E9 36 68         [10] 2865 	ld	(hl),#0x68
                           2866 ;src/main.c:731: prota.mover  = NO;
   97EB 21 E2 88      [10] 2867 	ld	hl,#(_prota + 0x0006)
   97EE 36 00         [10] 2868 	ld	(hl),#0x00
                           2869 ;src/main.c:732: prota.mira=M_derecha;
   97F0 21 E3 88      [10] 2870 	ld	hl,#(_prota + 0x0007)
   97F3 36 00         [10] 2871 	ld	(hl),#0x00
                           2872 ;src/main.c:733: prota.sprite = g_hero;
   97F5 21 A8 7A      [10] 2873 	ld	hl,#_g_hero
   97F8 22 E0 88      [16] 2874 	ld	((_prota + 0x0004)), hl
                           2875 ;src/main.c:737: cu.x = cu.px = 0;
   97FB 21 E6 88      [10] 2876 	ld	hl,#(_cu + 0x0002)
   97FE 36 00         [10] 2877 	ld	(hl),#0x00
   9800 21 E4 88      [10] 2878 	ld	hl,#_cu
   9803 36 00         [10] 2879 	ld	(hl),#0x00
                           2880 ;src/main.c:738: cu.y = cu.py = 0;
   9805 21 E7 88      [10] 2881 	ld	hl,#(_cu + 0x0003)
   9808 36 00         [10] 2882 	ld	(hl),#0x00
   980A 21 E5 88      [10] 2883 	ld	hl,#(_cu + 0x0001)
   980D 36 00         [10] 2884 	ld	(hl),#0x00
                           2885 ;src/main.c:739: cu.lanzado = NO;
   980F 21 EA 88      [10] 2886 	ld	hl,#(_cu + 0x0006)
   9812 36 00         [10] 2887 	ld	(hl),#0x00
                           2888 ;src/main.c:740: cu.mover = NO;
   9814 21 ED 88      [10] 2889 	ld	hl,#(_cu + 0x0009)
   9817 36 00         [10] 2890 	ld	(hl),#0x00
                           2891 ;src/main.c:742: inicializarEnemy();
   9819 CD 2A 97      [17] 2892 	call	_inicializarEnemy
                           2893 ;src/main.c:744: dibujarProta();
   981C C3 17 89      [10] 2894 	jp  _dibujarProta
                           2895 ;src/main.c:747: void main(void) {
                           2896 ;	---------------------------------
                           2897 ; Function main
                           2898 ; ---------------------------------
   981F                    2899 _main::
                           2900 ;src/main.c:751: inicializarCPC();
   981F CD 07 97      [17] 2901 	call	_inicializarCPC
                           2902 ;src/main.c:752: menuInicio();
   9822 CD 2B 96      [17] 2903 	call	_menuInicio
                           2904 ;src/main.c:754: inicializarJuego();
   9825 CD A9 97      [17] 2905 	call	_inicializarJuego
                           2906 ;src/main.c:755: cpct_akp_musicPlay();
   9828 CD 3A 7F      [17] 2907 	call	_cpct_akp_musicPlay
                           2908 ;src/main.c:757: while (1) {
   982B                    2909 00122$:
                           2910 ;src/main.c:760: actual = enemy;
                           2911 ;src/main.c:762: comprobarTeclado();
   982B CD 0F 93      [17] 2912 	call	_comprobarTeclado
                           2913 ;src/main.c:763: moverCuchillo();
   982E CD 2A 94      [17] 2914 	call	_moverCuchillo
                           2915 ;src/main.c:765: while(--i){
   9831 11 A8 88      [10] 2916 	ld	de,#_enemy
   9834 0E 05         [ 7] 2917 	ld	c,#0x05
   9836                    2918 00101$:
   9836 0D            [ 4] 2919 	dec c
   9837 28 11         [12] 2920 	jr	Z,00103$
                           2921 ;src/main.c:766: moverEnemigo(actual);
   9839 C5            [11] 2922 	push	bc
   983A D5            [11] 2923 	push	de
   983B D5            [11] 2924 	push	de
   983C CD BB 8F      [17] 2925 	call	_moverEnemigo
   983F F1            [10] 2926 	pop	af
   9840 D1            [10] 2927 	pop	de
   9841 C1            [10] 2928 	pop	bc
                           2929 ;src/main.c:767: ++actual;
   9842 21 0D 00      [10] 2930 	ld	hl,#0x000D
   9845 19            [11] 2931 	add	hl,de
   9846 5D            [ 4] 2932 	ld	e,l
   9847 54            [ 4] 2933 	ld	d,h
   9848 18 EC         [12] 2934 	jr	00101$
   984A                    2935 00103$:
                           2936 ;src/main.c:770: actual = enemy;
   984A 01 A8 88      [10] 2937 	ld	bc,#_enemy
                           2938 ;src/main.c:772: cpct_waitVSYNC();
   984D C5            [11] 2939 	push	bc
   984E CD 04 7F      [17] 2940 	call	_cpct_waitVSYNC
   9851 C1            [10] 2941 	pop	bc
                           2942 ;src/main.c:774: if (prota.mover) {
   9852 11 E2 88      [10] 2943 	ld	de,#_prota+6
   9855 1A            [ 7] 2944 	ld	a,(de)
   9856 B7            [ 4] 2945 	or	a, a
   9857 28 09         [12] 2946 	jr	Z,00105$
                           2947 ;src/main.c:775: redibujarProta();
   9859 C5            [11] 2948 	push	bc
   985A D5            [11] 2949 	push	de
   985B CD E8 89      [17] 2950 	call	_redibujarProta
   985E D1            [10] 2951 	pop	de
   985F C1            [10] 2952 	pop	bc
                           2953 ;src/main.c:776: prota.mover = NO;
   9860 AF            [ 4] 2954 	xor	a, a
   9861 12            [ 7] 2955 	ld	(de),a
   9862                    2956 00105$:
                           2957 ;src/main.c:778: if(cu.lanzado && cu.mover){
   9862 21 EA 88      [10] 2958 	ld	hl,#_cu + 6
   9865 5E            [ 7] 2959 	ld	e,(hl)
   9866 21 ED 88      [10] 2960 	ld	hl,#_cu + 9
   9869 7B            [ 4] 2961 	ld	a,e
   986A B7            [ 4] 2962 	or	a, a
   986B 28 0B         [12] 2963 	jr	Z,00110$
   986D 7E            [ 7] 2964 	ld	a,(hl)
   986E B7            [ 4] 2965 	or	a, a
   986F 28 07         [12] 2966 	jr	Z,00110$
                           2967 ;src/main.c:779: redibujarCuchillo();
   9871 C5            [11] 2968 	push	bc
   9872 CD DF 91      [17] 2969 	call	_redibujarCuchillo
   9875 C1            [10] 2970 	pop	bc
   9876 18 0D         [12] 2971 	jr	00137$
   9878                    2972 00110$:
                           2973 ;src/main.c:780: }else if (cu.lanzado && !cu.mover){
   9878 7B            [ 4] 2974 	ld	a,e
   9879 B7            [ 4] 2975 	or	a, a
   987A 28 09         [12] 2976 	jr	Z,00137$
   987C 7E            [ 7] 2977 	ld	a,(hl)
   987D B7            [ 4] 2978 	or	a, a
   987E 20 05         [12] 2979 	jr	NZ,00137$
                           2980 ;src/main.c:781: borrarCuchillo();
   9880 C5            [11] 2981 	push	bc
   9881 CD 61 91      [17] 2982 	call	_borrarCuchillo
   9884 C1            [10] 2983 	pop	bc
                           2984 ;src/main.c:784: while(--i){
   9885                    2985 00137$:
   9885 1E 05         [ 7] 2986 	ld	e,#0x05
   9887                    2987 00118$:
   9887 1D            [ 4] 2988 	dec	e
   9888 7B            [ 4] 2989 	ld	a,e
   9889 B7            [ 4] 2990 	or	a, a
   988A 28 49         [12] 2991 	jr	Z,00120$
                           2992 ;src/main.c:785: if(actual->mover){
   988C C5            [11] 2993 	push	bc
   988D FD E1         [14] 2994 	pop	iy
   988F FD 7E 06      [19] 2995 	ld	a,6 (iy)
   9892 B7            [ 4] 2996 	or	a, a
   9893 28 09         [12] 2997 	jr	Z,00114$
                           2998 ;src/main.c:786: redibujarEnemigo(actual);
   9895 C5            [11] 2999 	push	bc
   9896 D5            [11] 3000 	push	de
   9897 C5            [11] 3001 	push	bc
   9898 CD 06 8D      [17] 3002 	call	_redibujarEnemigo
   989B F1            [10] 3003 	pop	af
   989C D1            [10] 3004 	pop	de
   989D C1            [10] 3005 	pop	bc
   989E                    3006 00114$:
                           3007 ;src/main.c:788: if (actual->muerto && actual->muertes == 0){
   989E C5            [11] 3008 	push	bc
   989F FD E1         [14] 3009 	pop	iy
   98A1 FD 7E 08      [19] 3010 	ld	a,8 (iy)
   98A4 B7            [ 4] 3011 	or	a, a
   98A5 28 26         [12] 3012 	jr	Z,00116$
   98A7 21 0C 00      [10] 3013 	ld	hl,#0x000C
   98AA 09            [11] 3014 	add	hl,bc
   98AB 7E            [ 7] 3015 	ld	a,(hl)
   98AC B7            [ 4] 3016 	or	a, a
   98AD 20 1E         [12] 3017 	jr	NZ,00116$
                           3018 ;src/main.c:789: borrarEnemigo(actual);
   98AF E5            [11] 3019 	push	hl
   98B0 C5            [11] 3020 	push	bc
   98B1 D5            [11] 3021 	push	de
   98B2 C5            [11] 3022 	push	bc
   98B3 CD 72 8C      [17] 3023 	call	_borrarEnemigo
   98B6 F1            [10] 3024 	pop	af
   98B7 D1            [10] 3025 	pop	de
   98B8 C1            [10] 3026 	pop	bc
   98B9 C5            [11] 3027 	push	bc
   98BA D5            [11] 3028 	push	de
   98BB C5            [11] 3029 	push	bc
   98BC CD CA 8B      [17] 3030 	call	_dibujarExplosion
   98BF F1            [10] 3031 	pop	af
   98C0 D1            [10] 3032 	pop	de
   98C1 C1            [10] 3033 	pop	bc
   98C2 E1            [10] 3034 	pop	hl
                           3035 ;src/main.c:792: actual->muertes++;
   98C3 56            [ 7] 3036 	ld	d,(hl)
   98C4 14            [ 4] 3037 	inc	d
   98C5 72            [ 7] 3038 	ld	(hl),d
                           3039 ;src/main.c:793: actual->x = 0;
   98C6 AF            [ 4] 3040 	xor	a, a
   98C7 02            [ 7] 3041 	ld	(bc),a
                           3042 ;src/main.c:794: actual->y = 0;
   98C8 69            [ 4] 3043 	ld	l, c
   98C9 60            [ 4] 3044 	ld	h, b
   98CA 23            [ 6] 3045 	inc	hl
   98CB 36 00         [10] 3046 	ld	(hl),#0x00
   98CD                    3047 00116$:
                           3048 ;src/main.c:796: ++actual;
   98CD 21 0D 00      [10] 3049 	ld	hl,#0x000D
   98D0 09            [11] 3050 	add	hl,bc
   98D1 4D            [ 4] 3051 	ld	c,l
   98D2 44            [ 4] 3052 	ld	b,h
   98D3 18 B2         [12] 3053 	jr	00118$
   98D5                    3054 00120$:
                           3055 ;src/main.c:798: cpct_waitVSYNC();
   98D5 CD 04 7F      [17] 3056 	call	_cpct_waitVSYNC
   98D8 C3 2B 98      [10] 3057 	jp	00122$
                           3058 	.area _CODE
                           3059 	.area _INITIALIZER
                           3060 	.area _CABS (ABS)
   3F00                    3061 	.org 0x3F00
   3F00                    3062 _G_song:
   3F00 41                 3063 	.db #0x41	; 65	'A'
   3F01 54                 3064 	.db #0x54	; 84	'T'
   3F02 31                 3065 	.db #0x31	; 49	'1'
   3F03 30                 3066 	.db #0x30	; 48	'0'
   3F04 01                 3067 	.db #0x01	; 1
   3F05 40                 3068 	.db #0x40	; 64
   3F06 42                 3069 	.db #0x42	; 66	'B'
   3F07 0F                 3070 	.db #0x0F	; 15
   3F08 02                 3071 	.db #0x02	; 2
   3F09 06                 3072 	.db #0x06	; 6
   3F0A 1D                 3073 	.db #0x1D	; 29
   3F0B 00                 3074 	.db #0x00	; 0
   3F0C 10                 3075 	.db #0x10	; 16
   3F0D 40                 3076 	.db #0x40	; 64
   3F0E 19                 3077 	.db #0x19	; 25
   3F0F 40                 3078 	.db #0x40	; 64
   3F10 00                 3079 	.db #0x00	; 0
   3F11 00                 3080 	.db #0x00	; 0
   3F12 00                 3081 	.db #0x00	; 0
   3F13 00                 3082 	.db #0x00	; 0
   3F14 00                 3083 	.db #0x00	; 0
   3F15 00                 3084 	.db #0x00	; 0
   3F16 0D                 3085 	.db #0x0D	; 13
   3F17 12                 3086 	.db #0x12	; 18
   3F18 40                 3087 	.db #0x40	; 64
   3F19 01                 3088 	.db #0x01	; 1
   3F1A 00                 3089 	.db #0x00	; 0
   3F1B 7C                 3090 	.db #0x7C	; 124
   3F1C 18                 3091 	.db #0x18	; 24
   3F1D 78                 3092 	.db #0x78	; 120	'x'
   3F1E 0C                 3093 	.db #0x0C	; 12
   3F1F 34                 3094 	.db #0x34	; 52	'4'
   3F20 30                 3095 	.db #0x30	; 48	'0'
   3F21 2C                 3096 	.db #0x2C	; 44
   3F22 28                 3097 	.db #0x28	; 40
   3F23 24                 3098 	.db #0x24	; 36
   3F24 20                 3099 	.db #0x20	; 32
   3F25 1C                 3100 	.db #0x1C	; 28
   3F26 0D                 3101 	.db #0x0D	; 13
   3F27 25                 3102 	.db #0x25	; 37
   3F28 40                 3103 	.db #0x40	; 64
   3F29 20                 3104 	.db #0x20	; 32
   3F2A 00                 3105 	.db #0x00	; 0
   3F2B 00                 3106 	.db #0x00	; 0
   3F2C 00                 3107 	.db #0x00	; 0
   3F2D 39                 3108 	.db #0x39	; 57	'9'
   3F2E 40                 3109 	.db #0x40	; 64
   3F2F 00                 3110 	.db #0x00	; 0
   3F30 57                 3111 	.db #0x57	; 87	'W'
   3F31 40                 3112 	.db #0x40	; 64
   3F32 3B                 3113 	.db #0x3B	; 59
   3F33 40                 3114 	.db #0x40	; 64
   3F34 57                 3115 	.db #0x57	; 87	'W'
   3F35 40                 3116 	.db #0x40	; 64
   3F36 01                 3117 	.db #0x01	; 1
   3F37 2F                 3118 	.db #0x2F	; 47
   3F38 40                 3119 	.db #0x40	; 64
   3F39 19                 3120 	.db #0x19	; 25
   3F3A 00                 3121 	.db #0x00	; 0
   3F3B 76                 3122 	.db #0x76	; 118	'v'
   3F3C E1                 3123 	.db #0xE1	; 225
   3F3D 00                 3124 	.db #0x00	; 0
   3F3E 00                 3125 	.db #0x00	; 0
   3F3F 01                 3126 	.db #0x01	; 1
   3F40 04                 3127 	.db #0x04	; 4
   3F41 51                 3128 	.db #0x51	; 81	'Q'
   3F42 04                 3129 	.db #0x04	; 4
   3F43 37                 3130 	.db #0x37	; 55	'7'
   3F44 04                 3131 	.db #0x04	; 4
   3F45 4F                 3132 	.db #0x4F	; 79	'O'
   3F46 04                 3133 	.db #0x04	; 4
   3F47 37                 3134 	.db #0x37	; 55	'7'
   3F48 02                 3135 	.db #0x02	; 2
   3F49 4B                 3136 	.db #0x4B	; 75	'K'
   3F4A 02                 3137 	.db #0x02	; 2
   3F4B 37                 3138 	.db #0x37	; 55	'7'
   3F4C 04                 3139 	.db #0x04	; 4
   3F4D 4F                 3140 	.db #0x4F	; 79	'O'
   3F4E 04                 3141 	.db #0x04	; 4
   3F4F 37                 3142 	.db #0x37	; 55	'7'
   3F50 04                 3143 	.db #0x04	; 4
   3F51 4F                 3144 	.db #0x4F	; 79	'O'
   3F52 04                 3145 	.db #0x04	; 4
   3F53 37                 3146 	.db #0x37	; 55	'7'
   3F54 02                 3147 	.db #0x02	; 2
   3F55 4B                 3148 	.db #0x4B	; 75	'K'
   3F56 00                 3149 	.db #0x00	; 0
   3F57 42                 3150 	.db #0x42	; 66	'B'
   3F58 60                 3151 	.db #0x60	; 96
   3F59 00                 3152 	.db #0x00	; 0
   3F5A 42                 3153 	.db #0x42	; 66	'B'
   3F5B 80                 3154 	.db #0x80	; 128
   3F5C 00                 3155 	.db #0x00	; 0
   3F5D 00                 3156 	.db #0x00	; 0
   3F5E 42                 3157 	.db #0x42	; 66	'B'
   3F5F 00                 3158 	.db #0x00	; 0
   3F60 00                 3159 	.db #0x00	; 0
