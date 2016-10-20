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
   7B42                     127 _dummy_cpct_transparentMaskTable0M0_container::
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
   8C8F DD 77 FB      [19]  826 	ld	-5 (ix),a
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
   8CA4 DD 77 FA      [19]  842 	ld	-6 (ix),a
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
   8CEF DD 66 FA      [19]  876 	ld	h,-6 (ix)
   8CF2 DD 6E FB      [19]  877 	ld	l,-5 (ix)
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
   8D4C C2 FF 90      [10]  944 	jp	NZ,00165$
   8D4F 3E 03         [ 7]  945 	ld	a,#0x03
   8D51 DD BE 04      [19]  946 	cp	a, 4 (ix)
   8D54 3E 00         [ 7]  947 	ld	a,#0x00
   8D56 DD 9E 05      [19]  948 	sbc	a, 5 (ix)
   8D59 E2 5E 8D      [10]  949 	jp	PO, 00272$
   8D5C EE 80         [ 7]  950 	xor	a, #0x80
   8D5E                     951 00272$:
   8D5E FA FF 90      [10]  952 	jp	M,00165$
                            953 ;src/main.c:242: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
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
                            965 ;src/main.c:255: enemy->muerto = SI;
   8D7A 21 08 00      [10]  966 	ld	hl,#0x0008
   8D7D 09            [11]  967 	add	hl,bc
   8D7E DD 75 FA      [19]  968 	ld	-6 (ix),l
   8D81 DD 74 FB      [19]  969 	ld	-5 (ix),h
                            970 ;src/main.c:262: enemy->mira = M_izquierda;
   8D84 21 07 00      [10]  971 	ld	hl,#0x0007
   8D87 09            [11]  972 	add	hl,bc
   8D88 DD 75 FC      [19]  973 	ld	-4 (ix),l
   8D8B DD 74 FD      [19]  974 	ld	-3 (ix),h
                            975 ;src/main.c:240: switch (direction) {
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
                            990 ;src/main.c:241: case 0:
   8DA8                     991 00101$:
                            992 ;src/main.c:242: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
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
                           1007 ;src/main.c:243: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
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
                           1027 ;src/main.c:244: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
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
                           1047 ;src/main.c:246: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
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
                           1080 ;src/main.c:247: colisiona = 0;
   8E33 DD 36 F7 00   [19] 1081 	ld	-9 (ix),#0x00
   8E37 C3 FF 90      [10] 1082 	jp	00165$
   8E3A                    1083 00109$:
                           1084 ;src/main.c:250: if(cu.x > enemy->x){ //si el cu esta abajo
   8E3A 21 E4 88      [10] 1085 	ld	hl, #_cu + 0
   8E3D 5E            [ 7] 1086 	ld	e,(hl)
   8E3E 0A            [ 7] 1087 	ld	a,(bc)
   8E3F 4F            [ 4] 1088 	ld	c,a
   8E40 93            [ 4] 1089 	sub	a, e
   8E41 30 2C         [12] 1090 	jr	NC,00106$
                           1091 ;src/main.c:251: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
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
                           1109 ;src/main.c:252: colisiona = 0;
   8E5D DD 36 F7 00   [19] 1110 	ld	-9 (ix),#0x00
   8E61 C3 FF 90      [10] 1111 	jp	00165$
   8E64                    1112 00103$:
                           1113 ;src/main.c:255: enemy->muerto = SI;
   8E64 DD 6E FA      [19] 1114 	ld	l,-6 (ix)
   8E67 DD 66 FB      [19] 1115 	ld	h,-5 (ix)
   8E6A 36 01         [10] 1116 	ld	(hl),#0x01
   8E6C C3 FF 90      [10] 1117 	jp	00165$
   8E6F                    1118 00106$:
                           1119 ;src/main.c:258: colisiona = 0;
   8E6F DD 36 F7 00   [19] 1120 	ld	-9 (ix),#0x00
   8E73 C3 FF 90      [10] 1121 	jp	00165$
   8E76                    1122 00113$:
                           1123 ;src/main.c:262: enemy->mira = M_izquierda;
   8E76 DD 6E FC      [19] 1124 	ld	l,-4 (ix)
   8E79 DD 66 FD      [19] 1125 	ld	h,-3 (ix)
   8E7C 36 01         [10] 1126 	ld	(hl),#0x01
                           1127 ;src/main.c:264: break;
   8E7E C3 FF 90      [10] 1128 	jp	00165$
                           1129 ;src/main.c:265: case 1:
   8E81                    1130 00117$:
                           1131 ;src/main.c:266: if( *getTilePtr(enemy->x - 1, enemy->y) <= 2
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
                           1142 ;src/main.c:267: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
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
                           1162 ;src/main.c:268: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
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
                           1182 ;src/main.c:270: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
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
                           1215 ;src/main.c:271: colisiona = 0;
   8F07 DD 36 F7 00   [19] 1216 	ld	-9 (ix),#0x00
   8F0B C3 FF 90      [10] 1217 	jp	00165$
   8F0E                    1218 00125$:
                           1219 ;src/main.c:274: if(enemy->x > cu.x){ //si el cu esta abajo
   8F0E 0A            [ 7] 1220 	ld	a,(bc)
   8F0F 5F            [ 4] 1221 	ld	e,a
   8F10 21 E4 88      [10] 1222 	ld	hl, #_cu + 0
   8F13 4E            [ 7] 1223 	ld	c,(hl)
   8F14 79            [ 4] 1224 	ld	a,c
   8F15 93            [ 4] 1225 	sub	a, e
   8F16 30 2C         [12] 1226 	jr	NC,00122$
                           1227 ;src/main.c:275: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
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
                           1245 ;src/main.c:276: colisiona = 0;
   8F32 DD 36 F7 00   [19] 1246 	ld	-9 (ix),#0x00
   8F36 C3 FF 90      [10] 1247 	jp	00165$
   8F39                    1248 00119$:
                           1249 ;src/main.c:279: enemy->muerto = SI;
   8F39 DD 6E FA      [19] 1250 	ld	l,-6 (ix)
   8F3C DD 66 FB      [19] 1251 	ld	h,-5 (ix)
   8F3F 36 01         [10] 1252 	ld	(hl),#0x01
   8F41 C3 FF 90      [10] 1253 	jp	00165$
   8F44                    1254 00122$:
                           1255 ;src/main.c:282: colisiona = 0;
   8F44 DD 36 F7 00   [19] 1256 	ld	-9 (ix),#0x00
   8F48 C3 FF 90      [10] 1257 	jp	00165$
   8F4B                    1258 00129$:
                           1259 ;src/main.c:286: enemy->mira = M_derecha;
   8F4B DD 6E FC      [19] 1260 	ld	l,-4 (ix)
   8F4E DD 66 FD      [19] 1261 	ld	h,-3 (ix)
   8F51 36 00         [10] 1262 	ld	(hl),#0x00
                           1263 ;src/main.c:288: break;
   8F53 C3 FF 90      [10] 1264 	jp	00165$
                           1265 ;src/main.c:289: case 2:
   8F56                    1266 00133$:
                           1267 ;src/main.c:290: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
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
                           1279 ;src/main.c:291: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
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
                           1299 ;src/main.c:292: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
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
                           1319 ;src/main.c:294: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
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
                           1351 ;src/main.c:296: colisiona = 0;
   8FD4 DD 36 F7 00   [19] 1352 	ld	-9 (ix),#0x00
   8FD8 18 4B         [12] 1353 	jr	00149$
   8FDA                    1354 00141$:
                           1355 ;src/main.c:299: if(enemy->y>cu.y){
   8FDA DD 6E F8      [19] 1356 	ld	l,-8 (ix)
   8FDD DD 66 F9      [19] 1357 	ld	h,-7 (ix)
   8FE0 5E            [ 7] 1358 	ld	e,(hl)
   8FE1 21 E5 88      [10] 1359 	ld	hl, #(_cu + 0x0001) + 0
   8FE4 6E            [ 7] 1360 	ld	l,(hl)
   8FE5 7D            [ 4] 1361 	ld	a,l
   8FE6 93            [ 4] 1362 	sub	a, e
   8FE7 30 2E         [12] 1363 	jr	NC,00138$
                           1364 ;src/main.c:300: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
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
                           1385 ;src/main.c:301: colisiona = 0;
   9007 DD 36 F7 00   [19] 1386 	ld	-9 (ix),#0x00
   900B 18 18         [12] 1387 	jr	00149$
   900D                    1388 00135$:
                           1389 ;src/main.c:304: enemy->muerto = SI;
   900D DD 6E FA      [19] 1390 	ld	l,-6 (ix)
   9010 DD 66 FB      [19] 1391 	ld	h,-5 (ix)
   9013 36 01         [10] 1392 	ld	(hl),#0x01
   9015 18 0E         [12] 1393 	jr	00149$
   9017                    1394 00138$:
                           1395 ;src/main.c:308: colisiona = 0;
   9017 DD 36 F7 00   [19] 1396 	ld	-9 (ix),#0x00
   901B 18 08         [12] 1397 	jr	00149$
   901D                    1398 00145$:
                           1399 ;src/main.c:314: enemy->mira = M_abajo;
   901D DD 6E FC      [19] 1400 	ld	l,-4 (ix)
   9020 DD 66 FD      [19] 1401 	ld	h,-3 (ix)
   9023 36 03         [10] 1402 	ld	(hl),#0x03
                           1403 ;src/main.c:317: case 3:
   9025                    1404 00149$:
                           1405 ;src/main.c:320: if( *getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
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
                           1424 ;src/main.c:321: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
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
                           1444 ;src/main.c:322: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
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
                           1464 ;src/main.c:324: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
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
                           1496 ;src/main.c:325: colisiona = 0;
   90B0 DD 36 F7 00   [19] 1497 	ld	-9 (ix),#0x00
   90B4 18 49         [12] 1498 	jr	00165$
   90B6                    1499 00157$:
                           1500 ;src/main.c:328: if(cu.y > enemy->y){ //si el cu esta abajo
   90B6 21 E5 88      [10] 1501 	ld	hl, #(_cu + 0x0001) + 0
   90B9 4E            [ 7] 1502 	ld	c,(hl)
   90BA DD 6E F8      [19] 1503 	ld	l,-8 (ix)
   90BD DD 66 F9      [19] 1504 	ld	h,-7 (ix)
   90C0 5E            [ 7] 1505 	ld	e,(hl)
   90C1 7B            [ 4] 1506 	ld	a,e
   90C2 91            [ 4] 1507 	sub	a, c
   90C3 30 2C         [12] 1508 	jr	NC,00154$
                           1509 ;src/main.c:329: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
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
                           1528 ;src/main.c:330: colisiona = 0;
   90E1 DD 36 F7 00   [19] 1529 	ld	-9 (ix),#0x00
   90E5 18 18         [12] 1530 	jr	00165$
   90E7                    1531 00151$:
                           1532 ;src/main.c:333: enemy->muerto = SI;
   90E7 DD 6E FA      [19] 1533 	ld	l,-6 (ix)
   90EA DD 66 FB      [19] 1534 	ld	h,-5 (ix)
   90ED 36 01         [10] 1535 	ld	(hl),#0x01
   90EF 18 0E         [12] 1536 	jr	00165$
   90F1                    1537 00154$:
                           1538 ;src/main.c:337: colisiona = 0;
   90F1 DD 36 F7 00   [19] 1539 	ld	-9 (ix),#0x00
   90F5 18 08         [12] 1540 	jr	00165$
   90F7                    1541 00161$:
                           1542 ;src/main.c:341: enemy->mira = M_arriba;
   90F7 DD 6E FC      [19] 1543 	ld	l,-4 (ix)
   90FA DD 66 FD      [19] 1544 	ld	h,-3 (ix)
   90FD 36 02         [10] 1545 	ld	(hl),#0x02
                           1546 ;src/main.c:344: }
   90FF                    1547 00165$:
                           1548 ;src/main.c:345: return colisiona;
   90FF DD 6E F7      [19] 1549 	ld	l,-9 (ix)
   9102 DD F9         [10] 1550 	ld	sp, ix
   9104 DD E1         [14] 1551 	pop	ix
   9106 C9            [10] 1552 	ret
                           1553 ;src/main.c:348: void moverEnemigoArriba(TEnemy *enemy){
                           1554 ;	---------------------------------
                           1555 ; Function moverEnemigoArriba
                           1556 ; ---------------------------------
   9107                    1557 _moverEnemigoArriba::
   9107 DD E5         [15] 1558 	push	ix
   9109 DD 21 00 00   [14] 1559 	ld	ix,#0
   910D DD 39         [15] 1560 	add	ix,sp
                           1561 ;src/main.c:349: enemy->y--;
   910F DD 4E 04      [19] 1562 	ld	c,4 (ix)
   9112 DD 46 05      [19] 1563 	ld	b,5 (ix)
   9115 69            [ 4] 1564 	ld	l, c
   9116 60            [ 4] 1565 	ld	h, b
   9117 23            [ 6] 1566 	inc	hl
   9118 5E            [ 7] 1567 	ld	e,(hl)
   9119 1D            [ 4] 1568 	dec	e
   911A 73            [ 7] 1569 	ld	(hl),e
                           1570 ;src/main.c:350: enemy->y--;
   911B 1D            [ 4] 1571 	dec	e
   911C 73            [ 7] 1572 	ld	(hl),e
                           1573 ;src/main.c:351: enemy->mover = SI;
   911D 21 06 00      [10] 1574 	ld	hl,#0x0006
   9120 09            [11] 1575 	add	hl,bc
   9121 36 01         [10] 1576 	ld	(hl),#0x01
   9123 DD E1         [14] 1577 	pop	ix
   9125 C9            [10] 1578 	ret
                           1579 ;src/main.c:354: void moverEnemigoAbajo(TEnemy *enemy){
                           1580 ;	---------------------------------
                           1581 ; Function moverEnemigoAbajo
                           1582 ; ---------------------------------
   9126                    1583 _moverEnemigoAbajo::
   9126 DD E5         [15] 1584 	push	ix
   9128 DD 21 00 00   [14] 1585 	ld	ix,#0
   912C DD 39         [15] 1586 	add	ix,sp
                           1587 ;src/main.c:355: enemy->y++;
   912E DD 4E 04      [19] 1588 	ld	c,4 (ix)
   9131 DD 46 05      [19] 1589 	ld	b,5 (ix)
   9134 59            [ 4] 1590 	ld	e, c
   9135 50            [ 4] 1591 	ld	d, b
   9136 13            [ 6] 1592 	inc	de
   9137 1A            [ 7] 1593 	ld	a,(de)
   9138 3C            [ 4] 1594 	inc	a
   9139 12            [ 7] 1595 	ld	(de),a
                           1596 ;src/main.c:356: enemy->y++;
   913A 3C            [ 4] 1597 	inc	a
   913B 12            [ 7] 1598 	ld	(de),a
                           1599 ;src/main.c:357: enemy->mover = SI;
   913C 21 06 00      [10] 1600 	ld	hl,#0x0006
   913F 09            [11] 1601 	add	hl,bc
   9140 36 01         [10] 1602 	ld	(hl),#0x01
   9142 DD E1         [14] 1603 	pop	ix
   9144 C9            [10] 1604 	ret
                           1605 ;src/main.c:360: void moverEnemigoDerecha(TEnemy *enemy){
                           1606 ;	---------------------------------
                           1607 ; Function moverEnemigoDerecha
                           1608 ; ---------------------------------
   9145                    1609 _moverEnemigoDerecha::
                           1610 ;src/main.c:361: enemy->x++;
   9145 D1            [10] 1611 	pop	de
   9146 C1            [10] 1612 	pop	bc
   9147 C5            [11] 1613 	push	bc
   9148 D5            [11] 1614 	push	de
   9149 0A            [ 7] 1615 	ld	a,(bc)
   914A 3C            [ 4] 1616 	inc	a
   914B 02            [ 7] 1617 	ld	(bc),a
                           1618 ;src/main.c:362: enemy->x++;
   914C 3C            [ 4] 1619 	inc	a
   914D 02            [ 7] 1620 	ld	(bc),a
                           1621 ;src/main.c:363: enemy->mover = SI;
   914E 21 06 00      [10] 1622 	ld	hl,#0x0006
   9151 09            [11] 1623 	add	hl,bc
   9152 36 01         [10] 1624 	ld	(hl),#0x01
   9154 C9            [10] 1625 	ret
                           1626 ;src/main.c:366: void moverEnemigoIzquierda(TEnemy *enemy){
                           1627 ;	---------------------------------
                           1628 ; Function moverEnemigoIzquierda
                           1629 ; ---------------------------------
   9155                    1630 _moverEnemigoIzquierda::
                           1631 ;src/main.c:367: enemy->x--;
   9155 D1            [10] 1632 	pop	de
   9156 C1            [10] 1633 	pop	bc
   9157 C5            [11] 1634 	push	bc
   9158 D5            [11] 1635 	push	de
   9159 0A            [ 7] 1636 	ld	a,(bc)
   915A C6 FF         [ 7] 1637 	add	a,#0xFF
   915C 02            [ 7] 1638 	ld	(bc),a
                           1639 ;src/main.c:368: enemy->x--;
   915D C6 FF         [ 7] 1640 	add	a,#0xFF
   915F 02            [ 7] 1641 	ld	(bc),a
                           1642 ;src/main.c:369: enemy->mover = SI;
   9160 21 06 00      [10] 1643 	ld	hl,#0x0006
   9163 09            [11] 1644 	add	hl,bc
   9164 36 01         [10] 1645 	ld	(hl),#0x01
   9166 C9            [10] 1646 	ret
                           1647 ;src/main.c:372: void moverEnemigo(TEnemy *enemy){
                           1648 ;	---------------------------------
                           1649 ; Function moverEnemigo
                           1650 ; ---------------------------------
   9167                    1651 _moverEnemigo::
   9167 DD E5         [15] 1652 	push	ix
   9169 DD 21 00 00   [14] 1653 	ld	ix,#0
   916D DD 39         [15] 1654 	add	ix,sp
                           1655 ;src/main.c:373: if(!enemy->muerto){
   916F DD 4E 04      [19] 1656 	ld	c,4 (ix)
   9172 DD 46 05      [19] 1657 	ld	b,5 (ix)
   9175 C5            [11] 1658 	push	bc
   9176 FD E1         [14] 1659 	pop	iy
   9178 FD 7E 08      [19] 1660 	ld	a,8 (iy)
   917B B7            [ 4] 1661 	or	a, a
   917C 20 46         [12] 1662 	jr	NZ,00110$
                           1663 ;src/main.c:374: if(!checkEnemyCollision(enemy->mira, enemy)){
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
                           1680 ;src/main.c:376: switch (enemy->mira) {
   9194 5E            [ 7] 1681 	ld	e,(hl)
   9195 3E 03         [ 7] 1682 	ld	a,#0x03
   9197 93            [ 4] 1683 	sub	a, e
   9198 38 2A         [12] 1684 	jr	C,00110$
   919A 16 00         [ 7] 1685 	ld	d,#0x00
   919C 21 A2 91      [10] 1686 	ld	hl,#00124$
   919F 19            [11] 1687 	add	hl,de
   91A0 19            [11] 1688 	add	hl,de
                           1689 ;src/main.c:378: case 0:
   91A1 E9            [ 4] 1690 	jp	(hl)
   91A2                    1691 00124$:
   91A2 18 06         [12] 1692 	jr	00101$
   91A4 18 0B         [12] 1693 	jr	00102$
   91A6 18 10         [12] 1694 	jr	00103$
   91A8 18 15         [12] 1695 	jr	00104$
   91AA                    1696 00101$:
                           1697 ;src/main.c:379: moverEnemigoDerecha(enemy);
   91AA C5            [11] 1698 	push	bc
   91AB CD 45 91      [17] 1699 	call	_moverEnemigoDerecha
   91AE F1            [10] 1700 	pop	af
                           1701 ;src/main.c:380: break;
   91AF 18 13         [12] 1702 	jr	00110$
                           1703 ;src/main.c:381: case 1:
   91B1                    1704 00102$:
                           1705 ;src/main.c:382: moverEnemigoIzquierda(enemy);
   91B1 C5            [11] 1706 	push	bc
   91B2 CD 55 91      [17] 1707 	call	_moverEnemigoIzquierda
   91B5 F1            [10] 1708 	pop	af
                           1709 ;src/main.c:383: break;
   91B6 18 0C         [12] 1710 	jr	00110$
                           1711 ;src/main.c:384: case 2:
   91B8                    1712 00103$:
                           1713 ;src/main.c:385: moverEnemigoArriba(enemy);
   91B8 C5            [11] 1714 	push	bc
   91B9 CD 07 91      [17] 1715 	call	_moverEnemigoArriba
   91BC F1            [10] 1716 	pop	af
                           1717 ;src/main.c:386: break;
   91BD 18 05         [12] 1718 	jr	00110$
                           1719 ;src/main.c:387: case 3:
   91BF                    1720 00104$:
                           1721 ;src/main.c:388: moverEnemigoAbajo(enemy);
   91BF C5            [11] 1722 	push	bc
   91C0 CD 26 91      [17] 1723 	call	_moverEnemigoAbajo
   91C3 F1            [10] 1724 	pop	af
                           1725 ;src/main.c:390: }
   91C4                    1726 00110$:
   91C4 DD E1         [14] 1727 	pop	ix
   91C6 C9            [10] 1728 	ret
                           1729 ;src/main.c:395: void avanzarMapa() {
                           1730 ;	---------------------------------
                           1731 ; Function avanzarMapa
                           1732 ; ---------------------------------
   91C7                    1733 _avanzarMapa::
                           1734 ;src/main.c:396: if(num_mapa < NUM_MAPAS -1) {
   91C7 3A F0 88      [13] 1735 	ld	a,(#_num_mapa + 0)
   91CA D6 02         [ 7] 1736 	sub	a, #0x02
   91CC D2 B1 89      [10] 1737 	jp	NC,_menuFin
                           1738 ;src/main.c:397: mapa = mapas[++num_mapa];
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
                           1753 ;src/main.c:398: prota.x = prota.px = 2;
   91EE 21 DE 88      [10] 1754 	ld	hl,#(_prota + 0x0002)
   91F1 36 02         [10] 1755 	ld	(hl),#0x02
   91F3 21 DC 88      [10] 1756 	ld	hl,#_prota
   91F6 36 02         [10] 1757 	ld	(hl),#0x02
                           1758 ;src/main.c:399: prota.mover = SI;
   91F8 21 E2 88      [10] 1759 	ld	hl,#(_prota + 0x0006)
                           1760 ;src/main.c:400: dibujarMapa();
                           1761 ;src/main.c:404: menuFin();
   91FB 36 01         [10] 1762 	ld	(hl), #0x01
   91FD C3 F1 88      [10] 1763 	jp	_dibujarMapa
                           1764 ;src/main.c:408: void moverIzquierda() {
                           1765 ;	---------------------------------
                           1766 ; Function moverIzquierda
                           1767 ; ---------------------------------
   9200                    1768 _moverIzquierda::
                           1769 ;src/main.c:409: prota.mira = M_izquierda;
   9200 01 DC 88      [10] 1770 	ld	bc,#_prota+0
   9203 21 E3 88      [10] 1771 	ld	hl,#(_prota + 0x0007)
   9206 36 01         [10] 1772 	ld	(hl),#0x01
                           1773 ;src/main.c:410: if (!checkCollision(M_izquierda)) {
   9208 C5            [11] 1774 	push	bc
   9209 21 01 00      [10] 1775 	ld	hl,#0x0001
   920C E5            [11] 1776 	push	hl
   920D CD 3D 8A      [17] 1777 	call	_checkCollision
   9210 F1            [10] 1778 	pop	af
   9211 C1            [10] 1779 	pop	bc
   9212 7D            [ 4] 1780 	ld	a,l
   9213 B7            [ 4] 1781 	or	a, a
   9214 C0            [11] 1782 	ret	NZ
                           1783 ;src/main.c:411: prota.x--;
   9215 0A            [ 7] 1784 	ld	a,(bc)
   9216 C6 FF         [ 7] 1785 	add	a,#0xFF
   9218 02            [ 7] 1786 	ld	(bc),a
                           1787 ;src/main.c:412: prota.mover = SI;
   9219 21 E2 88      [10] 1788 	ld	hl,#(_prota + 0x0006)
   921C 36 01         [10] 1789 	ld	(hl),#0x01
                           1790 ;src/main.c:413: prota.sprite = g_hero_left;
   921E 21 FE 79      [10] 1791 	ld	hl,#_g_hero_left
   9221 22 E0 88      [16] 1792 	ld	((_prota + 0x0004)), hl
   9224 C9            [10] 1793 	ret
                           1794 ;src/main.c:417: void moverDerecha() {
                           1795 ;	---------------------------------
                           1796 ; Function moverDerecha
                           1797 ; ---------------------------------
   9225                    1798 _moverDerecha::
                           1799 ;src/main.c:418: prota.mira = M_derecha;
   9225 21 E3 88      [10] 1800 	ld	hl,#(_prota + 0x0007)
   9228 36 00         [10] 1801 	ld	(hl),#0x00
                           1802 ;src/main.c:419: if (!checkCollision(M_derecha)) {
   922A 21 00 00      [10] 1803 	ld	hl,#0x0000
   922D E5            [11] 1804 	push	hl
   922E CD 3D 8A      [17] 1805 	call	_checkCollision
   9231 F1            [10] 1806 	pop	af
   9232 4D            [ 4] 1807 	ld	c,l
                           1808 ;src/main.c:420: prota.x++;
   9233 21 DC 88      [10] 1809 	ld	hl, #_prota + 0
   9236 5E            [ 7] 1810 	ld	e,(hl)
                           1811 ;src/main.c:419: if (!checkCollision(M_derecha)) {
   9237 79            [ 4] 1812 	ld	a,c
   9238 B7            [ 4] 1813 	or	a, a
   9239 20 11         [12] 1814 	jr	NZ,00104$
                           1815 ;src/main.c:420: prota.x++;
   923B 1C            [ 4] 1816 	inc	e
   923C 21 DC 88      [10] 1817 	ld	hl,#_prota
   923F 73            [ 7] 1818 	ld	(hl),e
                           1819 ;src/main.c:421: prota.mover = SI;
   9240 21 E2 88      [10] 1820 	ld	hl,#(_prota + 0x0006)
   9243 36 01         [10] 1821 	ld	(hl),#0x01
                           1822 ;src/main.c:422: prota.sprite = g_hero;
   9245 21 A8 7A      [10] 1823 	ld	hl,#_g_hero
   9248 22 E0 88      [16] 1824 	ld	((_prota + 0x0004)), hl
   924B C9            [10] 1825 	ret
   924C                    1826 00104$:
                           1827 ;src/main.c:424: }else if( prota.x + G_HERO_W >= 80){
   924C 16 00         [ 7] 1828 	ld	d,#0x00
   924E 21 07 00      [10] 1829 	ld	hl,#0x0007
   9251 19            [11] 1830 	add	hl,de
   9252 11 50 80      [10] 1831 	ld	de, #0x8050
   9255 29            [11] 1832 	add	hl, hl
   9256 3F            [ 4] 1833 	ccf
   9257 CB 1C         [ 8] 1834 	rr	h
   9259 CB 1D         [ 8] 1835 	rr	l
   925B ED 52         [15] 1836 	sbc	hl, de
   925D D8            [11] 1837 	ret	C
                           1838 ;src/main.c:425: avanzarMapa();
   925E C3 C7 91      [10] 1839 	jp  _avanzarMapa
                           1840 ;src/main.c:429: void moverArriba() {
                           1841 ;	---------------------------------
                           1842 ; Function moverArriba
                           1843 ; ---------------------------------
   9261                    1844 _moverArriba::
                           1845 ;src/main.c:430: prota.mira = M_arriba;
   9261 21 E3 88      [10] 1846 	ld	hl,#(_prota + 0x0007)
   9264 36 02         [10] 1847 	ld	(hl),#0x02
                           1848 ;src/main.c:431: if (!checkCollision(M_arriba)) { // TODO: COMPROBAR
   9266 21 02 00      [10] 1849 	ld	hl,#0x0002
   9269 E5            [11] 1850 	push	hl
   926A CD 3D 8A      [17] 1851 	call	_checkCollision
   926D F1            [10] 1852 	pop	af
   926E 7D            [ 4] 1853 	ld	a,l
   926F B7            [ 4] 1854 	or	a, a
   9270 C0            [11] 1855 	ret	NZ
                           1856 ;src/main.c:432: prota.y--;
   9271 21 DD 88      [10] 1857 	ld	hl,#_prota + 1
   9274 4E            [ 7] 1858 	ld	c,(hl)
   9275 0D            [ 4] 1859 	dec	c
   9276 71            [ 7] 1860 	ld	(hl),c
                           1861 ;src/main.c:433: prota.y--;
   9277 0D            [ 4] 1862 	dec	c
   9278 71            [ 7] 1863 	ld	(hl),c
                           1864 ;src/main.c:434: prota.mover  = SI;
   9279 21 E2 88      [10] 1865 	ld	hl,#(_prota + 0x0006)
   927C 36 01         [10] 1866 	ld	(hl),#0x01
                           1867 ;src/main.c:435: prota.sprite = g_hero_up;
   927E 21 64 79      [10] 1868 	ld	hl,#_g_hero_up
   9281 22 E0 88      [16] 1869 	ld	((_prota + 0x0004)), hl
   9284 C9            [10] 1870 	ret
                           1871 ;src/main.c:439: void moverAbajo() {
                           1872 ;	---------------------------------
                           1873 ; Function moverAbajo
                           1874 ; ---------------------------------
   9285                    1875 _moverAbajo::
                           1876 ;src/main.c:440: prota.mira = M_abajo;
   9285 21 E3 88      [10] 1877 	ld	hl,#(_prota + 0x0007)
   9288 36 03         [10] 1878 	ld	(hl),#0x03
                           1879 ;src/main.c:441: if (!checkCollision(M_abajo) ) { // TODO: COMPROBAR
   928A 21 03 00      [10] 1880 	ld	hl,#0x0003
   928D E5            [11] 1881 	push	hl
   928E CD 3D 8A      [17] 1882 	call	_checkCollision
   9291 F1            [10] 1883 	pop	af
   9292 7D            [ 4] 1884 	ld	a,l
   9293 B7            [ 4] 1885 	or	a, a
   9294 C0            [11] 1886 	ret	NZ
                           1887 ;src/main.c:442: prota.y++;
   9295 01 DD 88      [10] 1888 	ld	bc,#_prota + 1
   9298 0A            [ 7] 1889 	ld	a,(bc)
   9299 3C            [ 4] 1890 	inc	a
   929A 02            [ 7] 1891 	ld	(bc),a
                           1892 ;src/main.c:443: prota.y++;
   929B 3C            [ 4] 1893 	inc	a
   929C 02            [ 7] 1894 	ld	(bc),a
                           1895 ;src/main.c:444: prota.mover  = SI;
   929D 21 E2 88      [10] 1896 	ld	hl,#(_prota + 0x0006)
   92A0 36 01         [10] 1897 	ld	(hl),#0x01
                           1898 ;src/main.c:445: prota.sprite = g_hero_down;
   92A2 21 CA 78      [10] 1899 	ld	hl,#_g_hero_down
   92A5 22 E0 88      [16] 1900 	ld	((_prota + 0x0004)), hl
   92A8 C9            [10] 1901 	ret
                           1902 ;src/main.c:449: void dibujarCuchillo() {
                           1903 ;	---------------------------------
                           1904 ; Function dibujarCuchillo
                           1905 ; ---------------------------------
   92A9                    1906 _dibujarCuchillo::
   92A9 DD E5         [15] 1907 	push	ix
   92AB DD 21 00 00   [14] 1908 	ld	ix,#0
   92AF DD 39         [15] 1909 	add	ix,sp
   92B1 F5            [11] 1910 	push	af
                           1911 ;src/main.c:450: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   92B2 21 E5 88      [10] 1912 	ld	hl, #_cu + 1
   92B5 56            [ 7] 1913 	ld	d,(hl)
   92B6 21 E4 88      [10] 1914 	ld	hl, #_cu + 0
   92B9 46            [ 7] 1915 	ld	b,(hl)
   92BA D5            [11] 1916 	push	de
   92BB 33            [ 6] 1917 	inc	sp
   92BC C5            [11] 1918 	push	bc
   92BD 33            [ 6] 1919 	inc	sp
   92BE 21 00 C0      [10] 1920 	ld	hl,#0xC000
   92C1 E5            [11] 1921 	push	hl
   92C2 CD 4B 88      [17] 1922 	call	_cpct_getScreenPtr
   92C5 45            [ 4] 1923 	ld	b,l
   92C6 5C            [ 4] 1924 	ld	e,h
                           1925 ;src/main.c:451: if(cu.eje == E_X){
   92C7 21 EC 88      [10] 1926 	ld	hl, #_cu + 8
   92CA 4E            [ 7] 1927 	ld	c,(hl)
                           1928 ;src/main.c:452: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   92CB DD 70 FE      [19] 1929 	ld	-2 (ix),b
   92CE DD 73 FF      [19] 1930 	ld	-1 (ix),e
                           1931 ;src/main.c:451: if(cu.eje == E_X){
   92D1 79            [ 4] 1932 	ld	a,c
   92D2 B7            [ 4] 1933 	or	a, a
   92D3 20 19         [12] 1934 	jr	NZ,00104$
                           1935 ;src/main.c:452: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   92D5 11 00 3E      [10] 1936 	ld	de,#_g_tablatrans+0
   92D8 ED 4B E8 88   [20] 1937 	ld	bc, (#(_cu + 0x0004) + 0)
   92DC D5            [11] 1938 	push	de
   92DD 21 04 04      [10] 1939 	ld	hl,#0x0404
   92E0 E5            [11] 1940 	push	hl
   92E1 DD 6E FE      [19] 1941 	ld	l,-2 (ix)
   92E4 DD 66 FF      [19] 1942 	ld	h,-1 (ix)
   92E7 E5            [11] 1943 	push	hl
   92E8 C5            [11] 1944 	push	bc
   92E9 CD 6B 88      [17] 1945 	call	_cpct_drawSpriteMaskedAlignedTable
   92EC 18 1A         [12] 1946 	jr	00106$
   92EE                    1947 00104$:
                           1948 ;src/main.c:455: else if(cu.eje == E_Y){
   92EE 0D            [ 4] 1949 	dec	c
   92EF 20 17         [12] 1950 	jr	NZ,00106$
                           1951 ;src/main.c:456: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   92F1 11 00 3E      [10] 1952 	ld	de,#_g_tablatrans+0
   92F4 ED 4B E8 88   [20] 1953 	ld	bc, (#(_cu + 0x0004) + 0)
   92F8 D5            [11] 1954 	push	de
   92F9 21 02 08      [10] 1955 	ld	hl,#0x0802
   92FC E5            [11] 1956 	push	hl
   92FD DD 6E FE      [19] 1957 	ld	l,-2 (ix)
   9300 DD 66 FF      [19] 1958 	ld	h,-1 (ix)
   9303 E5            [11] 1959 	push	hl
   9304 C5            [11] 1960 	push	bc
   9305 CD 6B 88      [17] 1961 	call	_cpct_drawSpriteMaskedAlignedTable
   9308                    1962 00106$:
   9308 DD F9         [10] 1963 	ld	sp, ix
   930A DD E1         [14] 1964 	pop	ix
   930C C9            [10] 1965 	ret
                           1966 ;src/main.c:460: void borrarCuchillo() {
                           1967 ;	---------------------------------
                           1968 ; Function borrarCuchillo
                           1969 ; ---------------------------------
   930D                    1970 _borrarCuchillo::
   930D DD E5         [15] 1971 	push	ix
   930F DD 21 00 00   [14] 1972 	ld	ix,#0
   9313 DD 39         [15] 1973 	add	ix,sp
   9315 F5            [11] 1974 	push	af
   9316 3B            [ 6] 1975 	dec	sp
                           1976 ;src/main.c:462: u8 w = 2 + (cu.px & 1);
   9317 21 E6 88      [10] 1977 	ld	hl, #_cu + 2
   931A 4E            [ 7] 1978 	ld	c,(hl)
   931B 79            [ 4] 1979 	ld	a,c
   931C E6 01         [ 7] 1980 	and	a, #0x01
   931E 47            [ 4] 1981 	ld	b,a
   931F 04            [ 4] 1982 	inc	b
   9320 04            [ 4] 1983 	inc	b
                           1984 ;src/main.c:463: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   9321 21 E7 88      [10] 1985 	ld	hl, #_cu + 3
   9324 5E            [ 7] 1986 	ld	e,(hl)
   9325 7B            [ 4] 1987 	ld	a,e
   9326 E6 03         [ 7] 1988 	and	a, #0x03
   9328 28 04         [12] 1989 	jr	Z,00105$
   932A 3E 01         [ 7] 1990 	ld	a,#0x01
   932C 18 02         [12] 1991 	jr	00106$
   932E                    1992 00105$:
   932E 3E 00         [ 7] 1993 	ld	a,#0x00
   9330                    1994 00106$:
   9330 C6 02         [ 7] 1995 	add	a, #0x02
   9332 DD 77 FD      [19] 1996 	ld	-3 (ix),a
                           1997 ;src/main.c:464: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   9335 FD 2A EE 88   [20] 1998 	ld	iy,(_mapa)
   9339 16 00         [ 7] 1999 	ld	d,#0x00
   933B 7B            [ 4] 2000 	ld	a,e
   933C C6 E8         [ 7] 2001 	add	a,#0xE8
   933E DD 77 FE      [19] 2002 	ld	-2 (ix),a
   9341 7A            [ 4] 2003 	ld	a,d
   9342 CE FF         [ 7] 2004 	adc	a,#0xFF
   9344 DD 77 FF      [19] 2005 	ld	-1 (ix),a
   9347 DD 6E FE      [19] 2006 	ld	l,-2 (ix)
   934A DD 66 FF      [19] 2007 	ld	h,-1 (ix)
   934D DD CB FF 7E   [20] 2008 	bit	7, -1 (ix)
   9351 28 04         [12] 2009 	jr	Z,00107$
   9353 21 EB FF      [10] 2010 	ld	hl,#0xFFEB
   9356 19            [11] 2011 	add	hl,de
   9357                    2012 00107$:
   9357 CB 2C         [ 8] 2013 	sra	h
   9359 CB 1D         [ 8] 2014 	rr	l
   935B CB 2C         [ 8] 2015 	sra	h
   935D CB 1D         [ 8] 2016 	rr	l
   935F 55            [ 4] 2017 	ld	d,l
   9360 CB 39         [ 8] 2018 	srl	c
   9362 FD E5         [15] 2019 	push	iy
   9364 21 F0 C0      [10] 2020 	ld	hl,#0xC0F0
   9367 E5            [11] 2021 	push	hl
   9368 3E 28         [ 7] 2022 	ld	a,#0x28
   936A F5            [11] 2023 	push	af
   936B 33            [ 6] 2024 	inc	sp
   936C DD 7E FD      [19] 2025 	ld	a,-3 (ix)
   936F F5            [11] 2026 	push	af
   9370 33            [ 6] 2027 	inc	sp
   9371 C5            [11] 2028 	push	bc
   9372 33            [ 6] 2029 	inc	sp
   9373 D5            [11] 2030 	push	de
   9374 33            [ 6] 2031 	inc	sp
   9375 79            [ 4] 2032 	ld	a,c
   9376 F5            [11] 2033 	push	af
   9377 33            [ 6] 2034 	inc	sp
   9378 CD 44 7D      [17] 2035 	call	_cpct_etm_drawTileBox2x4
                           2036 ;src/main.c:465: if(!cu.mover){
   937B 3A ED 88      [13] 2037 	ld	a, (#_cu + 9)
   937E B7            [ 4] 2038 	or	a, a
   937F 20 05         [12] 2039 	jr	NZ,00103$
                           2040 ;src/main.c:466: cu.lanzado = NO;
   9381 21 EA 88      [10] 2041 	ld	hl,#(_cu + 0x0006)
   9384 36 00         [10] 2042 	ld	(hl),#0x00
   9386                    2043 00103$:
   9386 DD F9         [10] 2044 	ld	sp, ix
   9388 DD E1         [14] 2045 	pop	ix
   938A C9            [10] 2046 	ret
                           2047 ;src/main.c:470: void redibujarCuchillo( ) {
                           2048 ;	---------------------------------
                           2049 ; Function redibujarCuchillo
                           2050 ; ---------------------------------
   938B                    2051 _redibujarCuchillo::
                           2052 ;src/main.c:471: borrarCuchillo();
   938B CD 0D 93      [17] 2053 	call	_borrarCuchillo
                           2054 ;src/main.c:472: cu.px = cu.x;
   938E 01 E6 88      [10] 2055 	ld	bc,#_cu + 2
   9391 3A E4 88      [13] 2056 	ld	a, (#_cu + 0)
   9394 02            [ 7] 2057 	ld	(bc),a
                           2058 ;src/main.c:473: cu.py = cu.y;
   9395 01 E7 88      [10] 2059 	ld	bc,#_cu + 3
   9398 3A E5 88      [13] 2060 	ld	a, (#_cu + 1)
   939B 02            [ 7] 2061 	ld	(bc),a
                           2062 ;src/main.c:474: dibujarCuchillo();
   939C C3 A9 92      [10] 2063 	jp  _dibujarCuchillo
                           2064 ;src/main.c:477: void lanzarCuchillo(){
                           2065 ;	---------------------------------
                           2066 ; Function lanzarCuchillo
                           2067 ; ---------------------------------
   939F                    2068 _lanzarCuchillo::
                           2069 ;src/main.c:479: if(!cu.lanzado){
   939F 3A EA 88      [13] 2070 	ld	a, (#(_cu + 0x0006) + 0)
   93A2 B7            [ 4] 2071 	or	a, a
   93A3 C0            [11] 2072 	ret	NZ
                           2073 ;src/main.c:481: if(prota.mira == M_derecha){
   93A4 21 E3 88      [10] 2074 	ld	hl, #_prota + 7
   93A7 5E            [ 7] 2075 	ld	e,(hl)
                           2076 ;src/main.c:482: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   93A8 01 DD 88      [10] 2077 	ld	bc,#_prota + 1
                           2078 ;src/main.c:484: cu.direccion = M_derecha;
                           2079 ;src/main.c:486: cu.y=prota.y + G_HERO_H /2;
                           2080 ;src/main.c:487: cu.sprite=g_knifeX_0;
                           2081 ;src/main.c:488: cu.eje = E_X;
                           2082 ;src/main.c:481: if(prota.mira == M_derecha){
   93AB 7B            [ 4] 2083 	ld	a,e
   93AC B7            [ 4] 2084 	or	a, a
   93AD 20 41         [12] 2085 	jr	NZ,00118$
                           2086 ;src/main.c:482: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   93AF 0A            [ 7] 2087 	ld	a,(bc)
   93B0 C6 0B         [ 7] 2088 	add	a, #0x0B
   93B2 5F            [ 4] 2089 	ld	e,a
   93B3 3A DC 88      [13] 2090 	ld	a, (#_prota + 0)
   93B6 C6 0C         [ 7] 2091 	add	a, #0x0C
   93B8 6F            [ 4] 2092 	ld	l,a
   93B9 C5            [11] 2093 	push	bc
   93BA 7B            [ 4] 2094 	ld	a,e
   93BB F5            [11] 2095 	push	af
   93BC 33            [ 6] 2096 	inc	sp
   93BD 7D            [ 4] 2097 	ld	a,l
   93BE F5            [11] 2098 	push	af
   93BF 33            [ 6] 2099 	inc	sp
   93C0 CD FC 89      [17] 2100 	call	_getTilePtr
   93C3 F1            [10] 2101 	pop	af
   93C4 C1            [10] 2102 	pop	bc
   93C5 5E            [ 7] 2103 	ld	e,(hl)
   93C6 3E 02         [ 7] 2104 	ld	a,#0x02
   93C8 93            [ 4] 2105 	sub	a, e
   93C9 D8            [11] 2106 	ret	C
                           2107 ;src/main.c:483: cu.lanzado = SI;
   93CA 21 EA 88      [10] 2108 	ld	hl,#(_cu + 0x0006)
   93CD 36 01         [10] 2109 	ld	(hl),#0x01
                           2110 ;src/main.c:484: cu.direccion = M_derecha;
   93CF 21 EB 88      [10] 2111 	ld	hl,#(_cu + 0x0007)
   93D2 36 00         [10] 2112 	ld	(hl),#0x00
                           2113 ;src/main.c:485: cu.x=prota.x + G_HERO_W;
   93D4 3A DC 88      [13] 2114 	ld	a, (#_prota + 0)
   93D7 C6 07         [ 7] 2115 	add	a, #0x07
   93D9 32 E4 88      [13] 2116 	ld	(#_cu),a
                           2117 ;src/main.c:486: cu.y=prota.y + G_HERO_H /2;
   93DC 0A            [ 7] 2118 	ld	a,(bc)
   93DD C6 0B         [ 7] 2119 	add	a, #0x0B
   93DF 32 E5 88      [13] 2120 	ld	(#(_cu + 0x0001)),a
                           2121 ;src/main.c:487: cu.sprite=g_knifeX_0;
   93E2 21 C0 54      [10] 2122 	ld	hl,#_g_knifeX_0
   93E5 22 E8 88      [16] 2123 	ld	((_cu + 0x0004)), hl
                           2124 ;src/main.c:488: cu.eje = E_X;
   93E8 21 EC 88      [10] 2125 	ld	hl,#(_cu + 0x0008)
   93EB 36 00         [10] 2126 	ld	(hl),#0x00
                           2127 ;src/main.c:489: dibujarCuchillo();
   93ED C3 A9 92      [10] 2128 	jp  _dibujarCuchillo
   93F0                    2129 00118$:
                           2130 ;src/main.c:492: else if(prota.mira == M_izquierda){
   93F0 7B            [ 4] 2131 	ld	a,e
   93F1 3D            [ 4] 2132 	dec	a
   93F2 20 41         [12] 2133 	jr	NZ,00115$
                           2134 ;src/main.c:493: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   93F4 0A            [ 7] 2135 	ld	a,(bc)
   93F5 C6 0B         [ 7] 2136 	add	a, #0x0B
   93F7 5F            [ 4] 2137 	ld	e,a
   93F8 3A DC 88      [13] 2138 	ld	a, (#_prota + 0)
   93FB C6 F6         [ 7] 2139 	add	a,#0xF6
   93FD 6F            [ 4] 2140 	ld	l,a
   93FE C5            [11] 2141 	push	bc
   93FF 7B            [ 4] 2142 	ld	a,e
   9400 F5            [11] 2143 	push	af
   9401 33            [ 6] 2144 	inc	sp
   9402 7D            [ 4] 2145 	ld	a,l
   9403 F5            [11] 2146 	push	af
   9404 33            [ 6] 2147 	inc	sp
   9405 CD FC 89      [17] 2148 	call	_getTilePtr
   9408 F1            [10] 2149 	pop	af
   9409 C1            [10] 2150 	pop	bc
   940A 5E            [ 7] 2151 	ld	e,(hl)
   940B 3E 02         [ 7] 2152 	ld	a,#0x02
   940D 93            [ 4] 2153 	sub	a, e
   940E D8            [11] 2154 	ret	C
                           2155 ;src/main.c:494: cu.lanzado = SI;
   940F 21 EA 88      [10] 2156 	ld	hl,#(_cu + 0x0006)
   9412 36 01         [10] 2157 	ld	(hl),#0x01
                           2158 ;src/main.c:495: cu.direccion = M_izquierda;
   9414 21 EB 88      [10] 2159 	ld	hl,#(_cu + 0x0007)
   9417 36 01         [10] 2160 	ld	(hl),#0x01
                           2161 ;src/main.c:496: cu.x = prota.x - G_KNIFEX_0_W;
   9419 3A DC 88      [13] 2162 	ld	a, (#_prota + 0)
   941C C6 FC         [ 7] 2163 	add	a,#0xFC
   941E 32 E4 88      [13] 2164 	ld	(#_cu),a
                           2165 ;src/main.c:497: cu.y = prota.y + G_HERO_H /2;
   9421 0A            [ 7] 2166 	ld	a,(bc)
   9422 C6 0B         [ 7] 2167 	add	a, #0x0B
   9424 32 E5 88      [13] 2168 	ld	(#(_cu + 0x0001)),a
                           2169 ;src/main.c:498: cu.sprite = g_knifeX_1;
   9427 21 D0 54      [10] 2170 	ld	hl,#_g_knifeX_1
   942A 22 E8 88      [16] 2171 	ld	((_cu + 0x0004)), hl
                           2172 ;src/main.c:499: cu.eje = E_X;
   942D 21 EC 88      [10] 2173 	ld	hl,#(_cu + 0x0008)
   9430 36 00         [10] 2174 	ld	(hl),#0x00
                           2175 ;src/main.c:500: dibujarCuchillo();
   9432 C3 A9 92      [10] 2176 	jp  _dibujarCuchillo
   9435                    2177 00115$:
                           2178 ;src/main.c:503: else if(prota.mira == M_abajo){
   9435 7B            [ 4] 2179 	ld	a,e
   9436 D6 03         [ 7] 2180 	sub	a, #0x03
   9438 20 41         [12] 2181 	jr	NZ,00112$
                           2182 ;src/main.c:505: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   943A 0A            [ 7] 2183 	ld	a,(bc)
   943B C6 1F         [ 7] 2184 	add	a, #0x1F
   943D 5F            [ 4] 2185 	ld	e,a
   943E 3A DC 88      [13] 2186 	ld	a, (#_prota + 0)
   9441 57            [ 4] 2187 	ld	d,a
   9442 14            [ 4] 2188 	inc	d
   9443 14            [ 4] 2189 	inc	d
   9444 14            [ 4] 2190 	inc	d
   9445 C5            [11] 2191 	push	bc
   9446 7B            [ 4] 2192 	ld	a,e
   9447 F5            [11] 2193 	push	af
   9448 33            [ 6] 2194 	inc	sp
   9449 D5            [11] 2195 	push	de
   944A 33            [ 6] 2196 	inc	sp
   944B CD FC 89      [17] 2197 	call	_getTilePtr
   944E F1            [10] 2198 	pop	af
   944F C1            [10] 2199 	pop	bc
   9450 5E            [ 7] 2200 	ld	e,(hl)
   9451 3E 02         [ 7] 2201 	ld	a,#0x02
   9453 93            [ 4] 2202 	sub	a, e
   9454 D8            [11] 2203 	ret	C
                           2204 ;src/main.c:506: cu.lanzado = SI;
   9455 21 EA 88      [10] 2205 	ld	hl,#(_cu + 0x0006)
   9458 36 01         [10] 2206 	ld	(hl),#0x01
                           2207 ;src/main.c:507: cu.direccion = M_abajo;
   945A 21 EB 88      [10] 2208 	ld	hl,#(_cu + 0x0007)
   945D 36 03         [10] 2209 	ld	(hl),#0x03
                           2210 ;src/main.c:508: cu.x = prota.x + G_HERO_W / 2;
   945F 3A DC 88      [13] 2211 	ld	a, (#_prota + 0)
   9462 C6 03         [ 7] 2212 	add	a, #0x03
   9464 32 E4 88      [13] 2213 	ld	(#_cu),a
                           2214 ;src/main.c:509: cu.y = prota.y + G_HERO_H;
   9467 0A            [ 7] 2215 	ld	a,(bc)
   9468 C6 16         [ 7] 2216 	add	a, #0x16
   946A 32 E5 88      [13] 2217 	ld	(#(_cu + 0x0001)),a
                           2218 ;src/main.c:510: cu.sprite = g_knifeY_0;
   946D 21 A0 54      [10] 2219 	ld	hl,#_g_knifeY_0
   9470 22 E8 88      [16] 2220 	ld	((_cu + 0x0004)), hl
                           2221 ;src/main.c:511: cu.eje = E_Y;
   9473 21 EC 88      [10] 2222 	ld	hl,#(_cu + 0x0008)
   9476 36 01         [10] 2223 	ld	(hl),#0x01
                           2224 ;src/main.c:512: dibujarCuchillo();
   9478 C3 A9 92      [10] 2225 	jp  _dibujarCuchillo
   947B                    2226 00112$:
                           2227 ;src/main.c:515: else if(prota.mira == M_arriba){
   947B 7B            [ 4] 2228 	ld	a,e
   947C D6 02         [ 7] 2229 	sub	a, #0x02
   947E C0            [11] 2230 	ret	NZ
                           2231 ;src/main.c:516: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   947F 0A            [ 7] 2232 	ld	a,(bc)
   9480 C6 F7         [ 7] 2233 	add	a,#0xF7
   9482 57            [ 4] 2234 	ld	d,a
   9483 3A DC 88      [13] 2235 	ld	a, (#_prota + 0)
   9486 C6 03         [ 7] 2236 	add	a, #0x03
   9488 C5            [11] 2237 	push	bc
   9489 D5            [11] 2238 	push	de
   948A 33            [ 6] 2239 	inc	sp
   948B F5            [11] 2240 	push	af
   948C 33            [ 6] 2241 	inc	sp
   948D CD FC 89      [17] 2242 	call	_getTilePtr
   9490 F1            [10] 2243 	pop	af
   9491 C1            [10] 2244 	pop	bc
   9492 5E            [ 7] 2245 	ld	e,(hl)
   9493 3E 02         [ 7] 2246 	ld	a,#0x02
   9495 93            [ 4] 2247 	sub	a, e
   9496 D8            [11] 2248 	ret	C
                           2249 ;src/main.c:517: cu.lanzado = SI;
   9497 21 EA 88      [10] 2250 	ld	hl,#(_cu + 0x0006)
   949A 36 01         [10] 2251 	ld	(hl),#0x01
                           2252 ;src/main.c:518: cu.direccion = M_arriba;
   949C 21 EB 88      [10] 2253 	ld	hl,#(_cu + 0x0007)
   949F 36 02         [10] 2254 	ld	(hl),#0x02
                           2255 ;src/main.c:519: cu.x = prota.x + G_HERO_W / 2;
   94A1 3A DC 88      [13] 2256 	ld	a, (#_prota + 0)
   94A4 C6 03         [ 7] 2257 	add	a, #0x03
   94A6 32 E4 88      [13] 2258 	ld	(#_cu),a
                           2259 ;src/main.c:520: cu.y = prota.y;
   94A9 0A            [ 7] 2260 	ld	a,(bc)
   94AA 32 E5 88      [13] 2261 	ld	(#(_cu + 0x0001)),a
                           2262 ;src/main.c:521: cu.sprite = g_knifeY_1;
   94AD 21 B0 54      [10] 2263 	ld	hl,#_g_knifeY_1
   94B0 22 E8 88      [16] 2264 	ld	((_cu + 0x0004)), hl
                           2265 ;src/main.c:522: cu.eje = E_Y;
   94B3 21 EC 88      [10] 2266 	ld	hl,#(_cu + 0x0008)
   94B6 36 01         [10] 2267 	ld	(hl),#0x01
                           2268 ;src/main.c:523: dibujarCuchillo();
   94B8 C3 A9 92      [10] 2269 	jp  _dibujarCuchillo
                           2270 ;src/main.c:529: void comprobarTeclado() {
                           2271 ;	---------------------------------
                           2272 ; Function comprobarTeclado
                           2273 ; ---------------------------------
   94BB                    2274 _comprobarTeclado::
                           2275 ;src/main.c:530: cpct_scanKeyboard_if();
   94BB CD 9C 7E      [17] 2276 	call	_cpct_scanKeyboard_if
                           2277 ;src/main.c:532: if (cpct_isAnyKeyPressed()) {
   94BE CD 8F 7E      [17] 2278 	call	_cpct_isAnyKeyPressed
   94C1 7D            [ 4] 2279 	ld	a,l
   94C2 B7            [ 4] 2280 	or	a, a
   94C3 C8            [11] 2281 	ret	Z
                           2282 ;src/main.c:533: if (cpct_isKeyPressed(Key_CursorLeft))
   94C4 21 01 01      [10] 2283 	ld	hl,#0x0101
   94C7 CD F9 7B      [17] 2284 	call	_cpct_isKeyPressed
   94CA 7D            [ 4] 2285 	ld	a,l
   94CB B7            [ 4] 2286 	or	a, a
                           2287 ;src/main.c:534: moverIzquierda();
   94CC C2 00 92      [10] 2288 	jp	NZ,_moverIzquierda
                           2289 ;src/main.c:535: else if (cpct_isKeyPressed(Key_CursorRight))
   94CF 21 00 02      [10] 2290 	ld	hl,#0x0200
   94D2 CD F9 7B      [17] 2291 	call	_cpct_isKeyPressed
   94D5 7D            [ 4] 2292 	ld	a,l
   94D6 B7            [ 4] 2293 	or	a, a
                           2294 ;src/main.c:536: moverDerecha();
   94D7 C2 25 92      [10] 2295 	jp	NZ,_moverDerecha
                           2296 ;src/main.c:537: else if (cpct_isKeyPressed(Key_CursorUp))
   94DA 21 00 01      [10] 2297 	ld	hl,#0x0100
   94DD CD F9 7B      [17] 2298 	call	_cpct_isKeyPressed
   94E0 7D            [ 4] 2299 	ld	a,l
   94E1 B7            [ 4] 2300 	or	a, a
                           2301 ;src/main.c:538: moverArriba();
   94E2 C2 61 92      [10] 2302 	jp	NZ,_moverArriba
                           2303 ;src/main.c:539: else if (cpct_isKeyPressed(Key_CursorDown))
   94E5 21 00 04      [10] 2304 	ld	hl,#0x0400
   94E8 CD F9 7B      [17] 2305 	call	_cpct_isKeyPressed
   94EB 7D            [ 4] 2306 	ld	a,l
   94EC B7            [ 4] 2307 	or	a, a
                           2308 ;src/main.c:540: moverAbajo();
   94ED C2 85 92      [10] 2309 	jp	NZ,_moverAbajo
                           2310 ;src/main.c:541: else if (cpct_isKeyPressed(Key_Space))
   94F0 21 05 80      [10] 2311 	ld	hl,#0x8005
   94F3 CD F9 7B      [17] 2312 	call	_cpct_isKeyPressed
   94F6 7D            [ 4] 2313 	ld	a,l
   94F7 B7            [ 4] 2314 	or	a, a
   94F8 C8            [11] 2315 	ret	Z
                           2316 ;src/main.c:542: lanzarCuchillo();
   94F9 C3 9F 93      [10] 2317 	jp  _lanzarCuchillo
                           2318 ;src/main.c:546: u8 checkKnifeCollision(int direction, u8 xoff, u8 yoff){
                           2319 ;	---------------------------------
                           2320 ; Function checkKnifeCollision
                           2321 ; ---------------------------------
   94FC                    2322 _checkKnifeCollision::
                           2323 ;src/main.c:548: return *getTilePtr(cu.x + xoff, cu.y + yoff) <= 2;
   94FC 3A E5 88      [13] 2324 	ld	a,(#_cu + 1)
   94FF 21 05 00      [10] 2325 	ld	hl,#5
   9502 39            [11] 2326 	add	hl,sp
   9503 86            [ 7] 2327 	add	a, (hl)
   9504 47            [ 4] 2328 	ld	b,a
   9505 3A E4 88      [13] 2329 	ld	a,(#_cu + 0)
   9508 21 04 00      [10] 2330 	ld	hl,#4
   950B 39            [11] 2331 	add	hl,sp
   950C 86            [ 7] 2332 	add	a, (hl)
   950D 4F            [ 4] 2333 	ld	c,a
   950E C5            [11] 2334 	push	bc
   950F CD FC 89      [17] 2335 	call	_getTilePtr
   9512 F1            [10] 2336 	pop	af
   9513 4E            [ 7] 2337 	ld	c,(hl)
   9514 3E 02         [ 7] 2338 	ld	a,#0x02
   9516 91            [ 4] 2339 	sub	a, c
   9517 3E 00         [ 7] 2340 	ld	a,#0x00
   9519 17            [ 4] 2341 	rla
   951A EE 01         [ 7] 2342 	xor	a, #0x01
   951C 6F            [ 4] 2343 	ld	l, a
   951D C9            [10] 2344 	ret
                           2345 ;src/main.c:551: void moverCuchillo(){
                           2346 ;	---------------------------------
                           2347 ; Function moverCuchillo
                           2348 ; ---------------------------------
   951E                    2349 _moverCuchillo::
                           2350 ;src/main.c:552: if(cu.lanzado){
   951E 01 E4 88      [10] 2351 	ld	bc,#_cu+0
   9521 3A EA 88      [13] 2352 	ld	a, (#_cu + 6)
   9524 B7            [ 4] 2353 	or	a, a
   9525 C8            [11] 2354 	ret	Z
                           2355 ;src/main.c:553: cu.mover = SI;
   9526 21 09 00      [10] 2356 	ld	hl,#0x0009
   9529 09            [11] 2357 	add	hl,bc
   952A EB            [ 4] 2358 	ex	de,hl
   952B 3E 01         [ 7] 2359 	ld	a,#0x01
   952D 12            [ 7] 2360 	ld	(de),a
                           2361 ;src/main.c:554: if(cu.direccion == M_derecha){
   952E 21 EB 88      [10] 2362 	ld	hl, #_cu + 7
   9531 6E            [ 7] 2363 	ld	l,(hl)
   9532 7D            [ 4] 2364 	ld	a,l
   9533 B7            [ 4] 2365 	or	a, a
   9534 20 1E         [12] 2366 	jr	NZ,00122$
                           2367 ;src/main.c:556: if(checkKnifeCollision(M_derecha, G_KNIFEX_0_W + 1, 0)){
   9536 C5            [11] 2368 	push	bc
   9537 D5            [11] 2369 	push	de
   9538 21 05 00      [10] 2370 	ld	hl,#0x0005
   953B E5            [11] 2371 	push	hl
   953C 2E 00         [ 7] 2372 	ld	l, #0x00
   953E E5            [11] 2373 	push	hl
   953F CD FC 94      [17] 2374 	call	_checkKnifeCollision
   9542 F1            [10] 2375 	pop	af
   9543 F1            [10] 2376 	pop	af
   9544 D1            [10] 2377 	pop	de
   9545 C1            [10] 2378 	pop	bc
   9546 7D            [ 4] 2379 	ld	a,l
   9547 B7            [ 4] 2380 	or	a, a
   9548 28 07         [12] 2381 	jr	Z,00102$
                           2382 ;src/main.c:557: cu.mover = SI;
   954A 3E 01         [ 7] 2383 	ld	a,#0x01
   954C 12            [ 7] 2384 	ld	(de),a
                           2385 ;src/main.c:558: cu.x++;
   954D 0A            [ 7] 2386 	ld	a,(bc)
   954E 3C            [ 4] 2387 	inc	a
   954F 02            [ 7] 2388 	ld	(bc),a
   9550 C9            [10] 2389 	ret
   9551                    2390 00102$:
                           2391 ;src/main.c:561: cu.mover=NO;
   9551 AF            [ 4] 2392 	xor	a, a
   9552 12            [ 7] 2393 	ld	(de),a
   9553 C9            [10] 2394 	ret
   9554                    2395 00122$:
                           2396 ;src/main.c:564: else if(cu.direccion == M_izquierda){
   9554 7D            [ 4] 2397 	ld	a,l
   9555 3D            [ 4] 2398 	dec	a
   9556 20 1F         [12] 2399 	jr	NZ,00119$
                           2400 ;src/main.c:565: if(checkKnifeCollision(M_derecha, -1, 0)){			
   9558 C5            [11] 2401 	push	bc
   9559 D5            [11] 2402 	push	de
   955A 21 FF 00      [10] 2403 	ld	hl,#0x00FF
   955D E5            [11] 2404 	push	hl
   955E 2E 00         [ 7] 2405 	ld	l, #0x00
   9560 E5            [11] 2406 	push	hl
   9561 CD FC 94      [17] 2407 	call	_checkKnifeCollision
   9564 F1            [10] 2408 	pop	af
   9565 F1            [10] 2409 	pop	af
   9566 D1            [10] 2410 	pop	de
   9567 C1            [10] 2411 	pop	bc
   9568 7D            [ 4] 2412 	ld	a,l
   9569 B7            [ 4] 2413 	or	a, a
   956A 28 08         [12] 2414 	jr	Z,00105$
                           2415 ;src/main.c:566: cu.mover = SI;		
   956C 3E 01         [ 7] 2416 	ld	a,#0x01
   956E 12            [ 7] 2417 	ld	(de),a
                           2418 ;src/main.c:567: cu.x--;
   956F 0A            [ 7] 2419 	ld	a,(bc)
   9570 C6 FF         [ 7] 2420 	add	a,#0xFF
   9572 02            [ 7] 2421 	ld	(bc),a
   9573 C9            [10] 2422 	ret
   9574                    2423 00105$:
                           2424 ;src/main.c:569: cu.mover=NO;
   9574 AF            [ 4] 2425 	xor	a, a
   9575 12            [ 7] 2426 	ld	(de),a
   9576 C9            [10] 2427 	ret
   9577                    2428 00119$:
                           2429 ;src/main.c:575: cu.y--;
   9577 03            [ 6] 2430 	inc	bc
                           2431 ;src/main.c:572: else if(cu.direccion == M_arriba){
   9578 7D            [ 4] 2432 	ld	a,l
   9579 D6 02         [ 7] 2433 	sub	a, #0x02
   957B 20 22         [12] 2434 	jr	NZ,00116$
                           2435 ;src/main.c:573: if(checkKnifeCollision(M_derecha, 0, -2)){
   957D C5            [11] 2436 	push	bc
   957E D5            [11] 2437 	push	de
   957F 21 00 FE      [10] 2438 	ld	hl,#0xFE00
   9582 E5            [11] 2439 	push	hl
   9583 26 00         [ 7] 2440 	ld	h, #0x00
   9585 E5            [11] 2441 	push	hl
   9586 CD FC 94      [17] 2442 	call	_checkKnifeCollision
   9589 F1            [10] 2443 	pop	af
   958A F1            [10] 2444 	pop	af
   958B D1            [10] 2445 	pop	de
   958C C1            [10] 2446 	pop	bc
   958D 7D            [ 4] 2447 	ld	a,l
   958E B7            [ 4] 2448 	or	a, a
   958F 28 0B         [12] 2449 	jr	Z,00108$
                           2450 ;src/main.c:574: cu.mover = SI;
   9591 3E 01         [ 7] 2451 	ld	a,#0x01
   9593 12            [ 7] 2452 	ld	(de),a
                           2453 ;src/main.c:575: cu.y--;
   9594 0A            [ 7] 2454 	ld	a,(bc)
   9595 C6 FF         [ 7] 2455 	add	a,#0xFF
   9597 02            [ 7] 2456 	ld	(bc),a
                           2457 ;src/main.c:576: cu.y--;
   9598 C6 FF         [ 7] 2458 	add	a,#0xFF
   959A 02            [ 7] 2459 	ld	(bc),a
   959B C9            [10] 2460 	ret
   959C                    2461 00108$:
                           2462 ;src/main.c:579: cu.mover=NO;
   959C AF            [ 4] 2463 	xor	a, a
   959D 12            [ 7] 2464 	ld	(de),a
   959E C9            [10] 2465 	ret
   959F                    2466 00116$:
                           2467 ;src/main.c:582: else if(cu.direccion == M_abajo){
   959F 7D            [ 4] 2468 	ld	a,l
   95A0 D6 03         [ 7] 2469 	sub	a, #0x03
   95A2 C0            [11] 2470 	ret	NZ
                           2471 ;src/main.c:583: if(checkKnifeCollision(M_derecha, 0, G_KNIFEY_0_H + 2)){
   95A3 C5            [11] 2472 	push	bc
   95A4 D5            [11] 2473 	push	de
   95A5 21 00 0A      [10] 2474 	ld	hl,#0x0A00
   95A8 E5            [11] 2475 	push	hl
   95A9 26 00         [ 7] 2476 	ld	h, #0x00
   95AB E5            [11] 2477 	push	hl
   95AC CD FC 94      [17] 2478 	call	_checkKnifeCollision
   95AF F1            [10] 2479 	pop	af
   95B0 F1            [10] 2480 	pop	af
   95B1 D1            [10] 2481 	pop	de
   95B2 C1            [10] 2482 	pop	bc
   95B3 7D            [ 4] 2483 	ld	a,l
   95B4 B7            [ 4] 2484 	or	a, a
   95B5 28 09         [12] 2485 	jr	Z,00111$
                           2486 ;src/main.c:584: cu.mover = SI;
   95B7 3E 01         [ 7] 2487 	ld	a,#0x01
   95B9 12            [ 7] 2488 	ld	(de),a
                           2489 ;src/main.c:585: cu.y++;
   95BA 0A            [ 7] 2490 	ld	a,(bc)
   95BB 3C            [ 4] 2491 	inc	a
   95BC 02            [ 7] 2492 	ld	(bc),a
                           2493 ;src/main.c:586: cu.y++;
   95BD 3C            [ 4] 2494 	inc	a
   95BE 02            [ 7] 2495 	ld	(bc),a
   95BF C9            [10] 2496 	ret
   95C0                    2497 00111$:
                           2498 ;src/main.c:589: cu.mover=NO;
   95C0 AF            [ 4] 2499 	xor	a, a
   95C1 12            [ 7] 2500 	ld	(de),a
   95C2 C9            [10] 2501 	ret
                           2502 ;src/main.c:595: void barraPuntuacionInicial(){
                           2503 ;	---------------------------------
                           2504 ; Function barraPuntuacionInicial
                           2505 ; ---------------------------------
   95C3                    2506 _barraPuntuacionInicial::
                           2507 ;src/main.c:600: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   95C3 21 00 02      [10] 2508 	ld	hl,#0x0200
   95C6 E5            [11] 2509 	push	hl
   95C7 26 C0         [ 7] 2510 	ld	h, #0xC0
   95C9 E5            [11] 2511 	push	hl
   95CA CD 4B 88      [17] 2512 	call	_cpct_getScreenPtr
   95CD 4D            [ 4] 2513 	ld	c,l
   95CE 44            [ 4] 2514 	ld	b,h
                           2515 ;src/main.c:601: cpct_drawStringM0("SCORE", memptr, 1, 0);
   95CF 21 01 00      [10] 2516 	ld	hl,#0x0001
   95D2 E5            [11] 2517 	push	hl
   95D3 C5            [11] 2518 	push	bc
   95D4 21 6B 96      [10] 2519 	ld	hl,#___str_1
   95D7 E5            [11] 2520 	push	hl
   95D8 CD 7B 7C      [17] 2521 	call	_cpct_drawStringM0
   95DB 21 06 00      [10] 2522 	ld	hl,#6
   95DE 39            [11] 2523 	add	hl,sp
   95DF F9            [ 6] 2524 	ld	sp,hl
                           2525 ;src/main.c:602: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   95E0 21 00 0E      [10] 2526 	ld	hl,#0x0E00
   95E3 E5            [11] 2527 	push	hl
   95E4 26 C0         [ 7] 2528 	ld	h, #0xC0
   95E6 E5            [11] 2529 	push	hl
   95E7 CD 4B 88      [17] 2530 	call	_cpct_getScreenPtr
   95EA 4D            [ 4] 2531 	ld	c,l
   95EB 44            [ 4] 2532 	ld	b,h
                           2533 ;src/main.c:603: cpct_drawStringM0("00000", memptr, 15, 0);
   95EC 21 0F 00      [10] 2534 	ld	hl,#0x000F
   95EF E5            [11] 2535 	push	hl
   95F0 C5            [11] 2536 	push	bc
   95F1 21 71 96      [10] 2537 	ld	hl,#___str_2
   95F4 E5            [11] 2538 	push	hl
   95F5 CD 7B 7C      [17] 2539 	call	_cpct_drawStringM0
   95F8 21 06 00      [10] 2540 	ld	hl,#6
   95FB 39            [11] 2541 	add	hl,sp
   95FC F9            [ 6] 2542 	ld	sp,hl
                           2543 ;src/main.c:606: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 14);
   95FD 21 1A 0E      [10] 2544 	ld	hl,#0x0E1A
   9600 E5            [11] 2545 	push	hl
   9601 21 00 C0      [10] 2546 	ld	hl,#0xC000
   9604 E5            [11] 2547 	push	hl
   9605 CD 4B 88      [17] 2548 	call	_cpct_getScreenPtr
   9608 4D            [ 4] 2549 	ld	c,l
   9609 44            [ 4] 2550 	ld	b,h
                           2551 ;src/main.c:607: cpct_drawStringM0("ROBOBIT", memptr, 3, 0);
   960A 21 03 00      [10] 2552 	ld	hl,#0x0003
   960D E5            [11] 2553 	push	hl
   960E C5            [11] 2554 	push	bc
   960F 21 77 96      [10] 2555 	ld	hl,#___str_3
   9612 E5            [11] 2556 	push	hl
   9613 CD 7B 7C      [17] 2557 	call	_cpct_drawStringM0
   9616 21 06 00      [10] 2558 	ld	hl,#6
   9619 39            [11] 2559 	add	hl,sp
   961A F9            [ 6] 2560 	ld	sp,hl
                           2561 ;src/main.c:609: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   961B 21 3C 02      [10] 2562 	ld	hl,#0x023C
   961E E5            [11] 2563 	push	hl
   961F 21 00 C0      [10] 2564 	ld	hl,#0xC000
   9622 E5            [11] 2565 	push	hl
   9623 CD 4B 88      [17] 2566 	call	_cpct_getScreenPtr
   9626 4D            [ 4] 2567 	ld	c,l
   9627 44            [ 4] 2568 	ld	b,h
                           2569 ;src/main.c:610: cpct_drawStringM0("LIVES", memptr, 1, 0);
   9628 21 01 00      [10] 2570 	ld	hl,#0x0001
   962B E5            [11] 2571 	push	hl
   962C C5            [11] 2572 	push	bc
   962D 21 7F 96      [10] 2573 	ld	hl,#___str_4
   9630 E5            [11] 2574 	push	hl
   9631 CD 7B 7C      [17] 2575 	call	_cpct_drawStringM0
   9634 21 06 00      [10] 2576 	ld	hl,#6
   9637 39            [11] 2577 	add	hl,sp
   9638 F9            [ 6] 2578 	ld	sp,hl
                           2579 ;src/main.c:612: for(i=0; i<5; i++){
   9639 01 00 00      [10] 2580 	ld	bc,#0x0000
   963C                    2581 00102$:
                           2582 ;src/main.c:613: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   963C 79            [ 4] 2583 	ld	a,c
   963D 87            [ 4] 2584 	add	a, a
   963E 87            [ 4] 2585 	add	a, a
   963F C6 3C         [ 7] 2586 	add	a, #0x3C
   9641 57            [ 4] 2587 	ld	d,a
   9642 C5            [11] 2588 	push	bc
   9643 3E 0E         [ 7] 2589 	ld	a,#0x0E
   9645 F5            [11] 2590 	push	af
   9646 33            [ 6] 2591 	inc	sp
   9647 D5            [11] 2592 	push	de
   9648 33            [ 6] 2593 	inc	sp
   9649 21 00 C0      [10] 2594 	ld	hl,#0xC000
   964C E5            [11] 2595 	push	hl
   964D CD 4B 88      [17] 2596 	call	_cpct_getScreenPtr
   9650 EB            [ 4] 2597 	ex	de,hl
   9651 21 03 06      [10] 2598 	ld	hl,#0x0603
   9654 E5            [11] 2599 	push	hl
   9655 D5            [11] 2600 	push	de
   9656 21 60 78      [10] 2601 	ld	hl,#_g_heart
   9659 E5            [11] 2602 	push	hl
   965A CD 9F 7C      [17] 2603 	call	_cpct_drawSprite
   965D C1            [10] 2604 	pop	bc
                           2605 ;src/main.c:612: for(i=0; i<5; i++){
   965E 03            [ 6] 2606 	inc	bc
   965F 79            [ 4] 2607 	ld	a,c
   9660 D6 05         [ 7] 2608 	sub	a, #0x05
   9662 78            [ 4] 2609 	ld	a,b
   9663 17            [ 4] 2610 	rla
   9664 3F            [ 4] 2611 	ccf
   9665 1F            [ 4] 2612 	rra
   9666 DE 80         [ 7] 2613 	sbc	a, #0x80
   9668 38 D2         [12] 2614 	jr	C,00102$
   966A C9            [10] 2615 	ret
   966B                    2616 ___str_1:
   966B 53 43 4F 52 45     2617 	.ascii "SCORE"
   9670 00                 2618 	.db 0x00
   9671                    2619 ___str_2:
   9671 30 30 30 30 30     2620 	.ascii "00000"
   9676 00                 2621 	.db 0x00
   9677                    2622 ___str_3:
   9677 52 4F 42 4F 42 49  2623 	.ascii "ROBOBIT"
        54
   967E 00                 2624 	.db 0x00
   967F                    2625 ___str_4:
   967F 4C 49 56 45 53     2626 	.ascii "LIVES"
   9684 00                 2627 	.db 0x00
                           2628 ;src/main.c:618: void borrarPantallaArriba(u8 x, u8 y, u8 ancho, u8 alto){
                           2629 ;	---------------------------------
                           2630 ; Function borrarPantallaArriba
                           2631 ; ---------------------------------
   9685                    2632 _borrarPantallaArriba::
   9685 DD E5         [15] 2633 	push	ix
   9687 DD 21 00 00   [14] 2634 	ld	ix,#0
   968B DD 39         [15] 2635 	add	ix,sp
                           2636 ;src/main.c:621: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   968D DD 66 05      [19] 2637 	ld	h,5 (ix)
   9690 DD 6E 04      [19] 2638 	ld	l,4 (ix)
   9693 E5            [11] 2639 	push	hl
   9694 21 00 C0      [10] 2640 	ld	hl,#0xC000
   9697 E5            [11] 2641 	push	hl
   9698 CD 4B 88      [17] 2642 	call	_cpct_getScreenPtr
   969B 4D            [ 4] 2643 	ld	c,l
   969C 44            [ 4] 2644 	ld	b,h
                           2645 ;src/main.c:622: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra la mitad derecha
   969D DD 66 07      [19] 2646 	ld	h,7 (ix)
   96A0 DD 6E 06      [19] 2647 	ld	l,6 (ix)
   96A3 E5            [11] 2648 	push	hl
   96A4 AF            [ 4] 2649 	xor	a, a
   96A5 F5            [11] 2650 	push	af
   96A6 33            [ 6] 2651 	inc	sp
   96A7 C5            [11] 2652 	push	bc
   96A8 CD 71 87      [17] 2653 	call	_cpct_drawSolidBox
   96AB F1            [10] 2654 	pop	af
   96AC F1            [10] 2655 	pop	af
   96AD 33            [ 6] 2656 	inc	sp
                           2657 ;src/main.c:623: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   96AE DD 7E 04      [19] 2658 	ld	a,4 (ix)
   96B1 C6 28         [ 7] 2659 	add	a, #0x28
   96B3 47            [ 4] 2660 	ld	b,a
   96B4 DD 7E 05      [19] 2661 	ld	a,5 (ix)
   96B7 F5            [11] 2662 	push	af
   96B8 33            [ 6] 2663 	inc	sp
   96B9 C5            [11] 2664 	push	bc
   96BA 33            [ 6] 2665 	inc	sp
   96BB 21 00 C0      [10] 2666 	ld	hl,#0xC000
   96BE E5            [11] 2667 	push	hl
   96BF CD 4B 88      [17] 2668 	call	_cpct_getScreenPtr
   96C2 4D            [ 4] 2669 	ld	c,l
   96C3 44            [ 4] 2670 	ld	b,h
                           2671 ;src/main.c:624: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra la mitad izquierda
   96C4 DD 66 07      [19] 2672 	ld	h,7 (ix)
   96C7 DD 6E 06      [19] 2673 	ld	l,6 (ix)
   96CA E5            [11] 2674 	push	hl
   96CB AF            [ 4] 2675 	xor	a, a
   96CC F5            [11] 2676 	push	af
   96CD 33            [ 6] 2677 	inc	sp
   96CE C5            [11] 2678 	push	bc
   96CF CD 71 87      [17] 2679 	call	_cpct_drawSolidBox
   96D2 F1            [10] 2680 	pop	af
   96D3 F1            [10] 2681 	pop	af
   96D4 33            [ 6] 2682 	inc	sp
   96D5 DD E1         [14] 2683 	pop	ix
   96D7 C9            [10] 2684 	ret
                           2685 ;src/main.c:627: void menuInicio(){
                           2686 ;	---------------------------------
                           2687 ; Function menuInicio
                           2688 ; ---------------------------------
   96D8                    2689 _menuInicio::
                           2690 ;src/main.c:631: cpct_clearScreen(0);
   96D8 21 00 40      [10] 2691 	ld	hl,#0x4000
   96DB E5            [11] 2692 	push	hl
   96DC AF            [ 4] 2693 	xor	a, a
   96DD F5            [11] 2694 	push	af
   96DE 33            [ 6] 2695 	inc	sp
   96DF 26 C0         [ 7] 2696 	ld	h, #0xC0
   96E1 E5            [11] 2697 	push	hl
   96E2 CD 2A 7F      [17] 2698 	call	_cpct_memset
                           2699 ;src/main.c:633: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   96E5 21 1A 0F      [10] 2700 	ld	hl,#0x0F1A
   96E8 E5            [11] 2701 	push	hl
   96E9 21 00 C0      [10] 2702 	ld	hl,#0xC000
   96EC E5            [11] 2703 	push	hl
   96ED CD 4B 88      [17] 2704 	call	_cpct_getScreenPtr
   96F0 4D            [ 4] 2705 	ld	c,l
   96F1 44            [ 4] 2706 	ld	b,h
                           2707 ;src/main.c:634: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   96F2 21 04 00      [10] 2708 	ld	hl,#0x0004
   96F5 E5            [11] 2709 	push	hl
   96F6 C5            [11] 2710 	push	bc
   96F7 21 8B 97      [10] 2711 	ld	hl,#___str_5
   96FA E5            [11] 2712 	push	hl
   96FB CD 7B 7C      [17] 2713 	call	_cpct_drawStringM0
   96FE 21 06 00      [10] 2714 	ld	hl,#6
   9701 39            [11] 2715 	add	hl,sp
   9702 F9            [ 6] 2716 	ld	sp,hl
                           2717 ;src/main.c:636: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   9703 21 28 6E      [10] 2718 	ld	hl,#0x6E28
   9706 E5            [11] 2719 	push	hl
   9707 21 F0 F0      [10] 2720 	ld	hl,#0xF0F0
   970A E5            [11] 2721 	push	hl
   970B 21 00 56      [10] 2722 	ld	hl,#_g_text_0
   970E E5            [11] 2723 	push	hl
   970F CD 9F 7C      [17] 2724 	call	_cpct_drawSprite
                           2725 ;src/main.c:637: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   9712 21 28 6E      [10] 2726 	ld	hl,#0x6E28
   9715 E5            [11] 2727 	push	hl
   9716 21 18 F1      [10] 2728 	ld	hl,#0xF118
   9719 E5            [11] 2729 	push	hl
   971A 21 30 67      [10] 2730 	ld	hl,#_g_text_1
   971D E5            [11] 2731 	push	hl
   971E CD 9F 7C      [17] 2732 	call	_cpct_drawSprite
                           2733 ;src/main.c:660: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   9721 21 08 A0      [10] 2734 	ld	hl,#0xA008
   9724 E5            [11] 2735 	push	hl
   9725 21 00 C0      [10] 2736 	ld	hl,#0xC000
   9728 E5            [11] 2737 	push	hl
   9729 CD 4B 88      [17] 2738 	call	_cpct_getScreenPtr
   972C 4D            [ 4] 2739 	ld	c,l
   972D 44            [ 4] 2740 	ld	b,h
                           2741 ;src/main.c:661: cpct_drawStringM0("TO START PRESS S", memptr, 4, 0);
   972E 21 04 00      [10] 2742 	ld	hl,#0x0004
   9731 E5            [11] 2743 	push	hl
   9732 C5            [11] 2744 	push	bc
   9733 21 93 97      [10] 2745 	ld	hl,#___str_6
   9736 E5            [11] 2746 	push	hl
   9737 CD 7B 7C      [17] 2747 	call	_cpct_drawStringM0
   973A 21 06 00      [10] 2748 	ld	hl,#6
   973D 39            [11] 2749 	add	hl,sp
   973E F9            [ 6] 2750 	ld	sp,hl
                           2751 ;src/main.c:663: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 170); // centrado en horizontal y abajo en vertical
   973F 21 0A AA      [10] 2752 	ld	hl,#0xAA0A
   9742 E5            [11] 2753 	push	hl
   9743 21 00 C0      [10] 2754 	ld	hl,#0xC000
   9746 E5            [11] 2755 	push	hl
   9747 CD 4B 88      [17] 2756 	call	_cpct_getScreenPtr
   974A 4D            [ 4] 2757 	ld	c,l
   974B 44            [ 4] 2758 	ld	b,h
                           2759 ;src/main.c:664: cpct_drawStringM0("TO MENU PRESS M", memptr, 4, 0);
   974C 21 04 00      [10] 2760 	ld	hl,#0x0004
   974F E5            [11] 2761 	push	hl
   9750 C5            [11] 2762 	push	bc
   9751 21 A4 97      [10] 2763 	ld	hl,#___str_7
   9754 E5            [11] 2764 	push	hl
   9755 CD 7B 7C      [17] 2765 	call	_cpct_drawStringM0
   9758 21 06 00      [10] 2766 	ld	hl,#6
   975B 39            [11] 2767 	add	hl,sp
   975C F9            [ 6] 2768 	ld	sp,hl
                           2769 ;src/main.c:667: do{
   975D                    2770 00106$:
                           2771 ;src/main.c:668: cpct_scanKeyboard_f();
   975D CD 05 7C      [17] 2772 	call	_cpct_scanKeyboard_f
                           2773 ;src/main.c:672: if(cpct_isKeyPressed(Key_M)){
   9760 21 04 40      [10] 2774 	ld	hl,#0x4004
   9763 CD F9 7B      [17] 2775 	call	_cpct_isKeyPressed
   9766 7D            [ 4] 2776 	ld	a,l
   9767 B7            [ 4] 2777 	or	a, a
   9768 28 0D         [12] 2778 	jr	Z,00107$
                           2779 ;src/main.c:673: cpct_scanKeyboard_f();
   976A CD 05 7C      [17] 2780 	call	_cpct_scanKeyboard_f
                           2781 ;src/main.c:674: do{
   976D                    2782 00101$:
                           2783 ;src/main.c:676: } while(!cpct_isKeyPressed(Key_S));
   976D 21 07 10      [10] 2784 	ld	hl,#0x1007
   9770 CD F9 7B      [17] 2785 	call	_cpct_isKeyPressed
   9773 7D            [ 4] 2786 	ld	a,l
   9774 B7            [ 4] 2787 	or	a, a
   9775 28 F6         [12] 2788 	jr	Z,00101$
   9777                    2789 00107$:
                           2790 ;src/main.c:678: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   9777 21 07 10      [10] 2791 	ld	hl,#0x1007
   977A CD F9 7B      [17] 2792 	call	_cpct_isKeyPressed
   977D 7D            [ 4] 2793 	ld	a,l
   977E B7            [ 4] 2794 	or	a, a
   977F C0            [11] 2795 	ret	NZ
   9780 21 04 40      [10] 2796 	ld	hl,#0x4004
   9783 CD F9 7B      [17] 2797 	call	_cpct_isKeyPressed
   9786 7D            [ 4] 2798 	ld	a,l
   9787 B7            [ 4] 2799 	or	a, a
   9788 28 D3         [12] 2800 	jr	Z,00106$
   978A C9            [10] 2801 	ret
   978B                    2802 ___str_5:
   978B 52 4F 42 4F 42 49  2803 	.ascii "ROBOBIT"
        54
   9792 00                 2804 	.db 0x00
   9793                    2805 ___str_6:
   9793 54 4F 20 53 54 41  2806 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   97A3 00                 2807 	.db 0x00
   97A4                    2808 ___str_7:
   97A4 54 4F 20 4D 45 4E  2809 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   97B3 00                 2810 	.db 0x00
                           2811 ;src/main.c:681: void inicializarCPC() {
                           2812 ;	---------------------------------
                           2813 ; Function inicializarCPC
                           2814 ; ---------------------------------
   97B4                    2815 _inicializarCPC::
                           2816 ;src/main.c:682: cpct_disableFirmware();
   97B4 CD 61 87      [17] 2817 	call	_cpct_disableFirmware
                           2818 ;src/main.c:683: cpct_setVideoMode(0);
   97B7 2E 00         [ 7] 2819 	ld	l,#0x00
   97B9 CD 0C 7F      [17] 2820 	call	_cpct_setVideoMode
                           2821 ;src/main.c:684: cpct_setBorder(HW_BLACK);
   97BC 21 10 14      [10] 2822 	ld	hl,#0x1410
   97BF E5            [11] 2823 	push	hl
   97C0 CD 6F 7C      [17] 2824 	call	_cpct_setPALColour
                           2825 ;src/main.c:685: cpct_setPalette(g_palette, 16);
   97C3 21 10 00      [10] 2826 	ld	hl,#0x0010
   97C6 E5            [11] 2827 	push	hl
   97C7 21 98 7A      [10] 2828 	ld	hl,#_g_palette
   97CA E5            [11] 2829 	push	hl
   97CB CD E2 7B      [17] 2830 	call	_cpct_setPalette
                           2831 ;src/main.c:686: cpct_akp_musicInit(G_song);
   97CE 21 00 3F      [10] 2832 	ld	hl,#_G_song
   97D1 E5            [11] 2833 	push	hl
   97D2 CD 3D 86      [17] 2834 	call	_cpct_akp_musicInit
   97D5 F1            [10] 2835 	pop	af
   97D6 C9            [10] 2836 	ret
                           2837 ;src/main.c:689: void inicializarEnemy() {
                           2838 ;	---------------------------------
                           2839 ; Function inicializarEnemy
                           2840 ; ---------------------------------
   97D7                    2841 _inicializarEnemy::
   97D7 DD E5         [15] 2842 	push	ix
   97D9 DD 21 00 00   [14] 2843 	ld	ix,#0
   97DD DD 39         [15] 2844 	add	ix,sp
   97DF 3B            [ 6] 2845 	dec	sp
                           2846 ;src/main.c:690: u8 i = (2 + num_mapa) + 1; //sacar distinto numero dependiendo del mapa
   97E0 3A F0 88      [13] 2847 	ld	a,(#_num_mapa + 0)
   97E3 C6 03         [ 7] 2848 	add	a, #0x03
   97E5 DD 77 FF      [19] 2849 	ld	-1 (ix),a
                           2850 ;src/main.c:695: actual = enemy;
   97E8 11 A8 88      [10] 2851 	ld	de,#_enemy+0
                           2852 ;src/main.c:696: while(--i){
   97EB                    2853 00101$:
   97EB DD 35 FF      [23] 2854 	dec	-1 (ix)
   97EE DD 7E FF      [19] 2855 	ld	a,-1 (ix)
   97F1 B7            [ 4] 2856 	or	a, a
   97F2 28 61         [12] 2857 	jr	Z,00104$
                           2858 ;src/main.c:697: actual->x = actual->px = spawnX[i];
   97F4 4B            [ 4] 2859 	ld	c, e
   97F5 42            [ 4] 2860 	ld	b, d
   97F6 03            [ 6] 2861 	inc	bc
   97F7 03            [ 6] 2862 	inc	bc
   97F8 3E 0D         [ 7] 2863 	ld	a,#<(_spawnX)
   97FA DD 86 FF      [19] 2864 	add	a, -1 (ix)
   97FD 6F            [ 4] 2865 	ld	l,a
   97FE 3E 89         [ 7] 2866 	ld	a,#>(_spawnX)
   9800 CE 00         [ 7] 2867 	adc	a, #0x00
   9802 67            [ 4] 2868 	ld	h,a
   9803 7E            [ 7] 2869 	ld	a,(hl)
   9804 02            [ 7] 2870 	ld	(bc),a
   9805 12            [ 7] 2871 	ld	(de),a
                           2872 ;src/main.c:698: actual->y = actual->py = spawnY[i];
   9806 D5            [11] 2873 	push	de
   9807 FD E1         [14] 2874 	pop	iy
   9809 FD 23         [10] 2875 	inc	iy
   980B 4B            [ 4] 2876 	ld	c, e
   980C 42            [ 4] 2877 	ld	b, d
   980D 03            [ 6] 2878 	inc	bc
   980E 03            [ 6] 2879 	inc	bc
   980F 03            [ 6] 2880 	inc	bc
   9810 3E 12         [ 7] 2881 	ld	a,#<(_spawnY)
   9812 DD 86 FF      [19] 2882 	add	a, -1 (ix)
   9815 6F            [ 4] 2883 	ld	l,a
   9816 3E 89         [ 7] 2884 	ld	a,#>(_spawnY)
   9818 CE 00         [ 7] 2885 	adc	a, #0x00
   981A 67            [ 4] 2886 	ld	h,a
   981B 7E            [ 7] 2887 	ld	a,(hl)
   981C 02            [ 7] 2888 	ld	(bc),a
   981D FD 77 00      [19] 2889 	ld	0 (iy), a
                           2890 ;src/main.c:699: actual->mover  = NO;
   9820 21 06 00      [10] 2891 	ld	hl,#0x0006
   9823 19            [11] 2892 	add	hl,de
   9824 36 00         [10] 2893 	ld	(hl),#0x00
                           2894 ;src/main.c:700: actual->mira   = M_abajo;
   9826 21 07 00      [10] 2895 	ld	hl,#0x0007
   9829 19            [11] 2896 	add	hl,de
   982A 36 03         [10] 2897 	ld	(hl),#0x03
                           2898 ;src/main.c:701: actual->sprite = g_enemy;
   982C 21 04 00      [10] 2899 	ld	hl,#0x0004
   982F 19            [11] 2900 	add	hl,de
   9830 36 72         [10] 2901 	ld	(hl),#<(_g_enemy)
   9832 23            [ 6] 2902 	inc	hl
   9833 36 78         [10] 2903 	ld	(hl),#>(_g_enemy)
                           2904 ;src/main.c:702: actual->muerto = NO;
   9835 21 08 00      [10] 2905 	ld	hl,#0x0008
   9838 19            [11] 2906 	add	hl,de
   9839 36 00         [10] 2907 	ld	(hl),#0x00
                           2908 ;src/main.c:703: actual->muertes = 0;
   983B 21 0C 00      [10] 2909 	ld	hl,#0x000C
   983E 19            [11] 2910 	add	hl,de
   983F 36 00         [10] 2911 	ld	(hl),#0x00
                           2912 ;src/main.c:704: actual->patroling = SI;
   9841 21 09 00      [10] 2913 	ld	hl,#0x0009
   9844 19            [11] 2914 	add	hl,de
   9845 36 01         [10] 2915 	ld	(hl),#0x01
                           2916 ;src/main.c:706: dibujarEnemigo(actual);
   9847 D5            [11] 2917 	push	de
   9848 D5            [11] 2918 	push	de
   9849 CD 92 8B      [17] 2919 	call	_dibujarEnemigo
   984C F1            [10] 2920 	pop	af
   984D D1            [10] 2921 	pop	de
                           2922 ;src/main.c:708: ++actual;
   984E 21 0D 00      [10] 2923 	ld	hl,#0x000D
   9851 19            [11] 2924 	add	hl,de
   9852 EB            [ 4] 2925 	ex	de,hl
   9853 18 96         [12] 2926 	jr	00101$
   9855                    2927 00104$:
   9855 33            [ 6] 2928 	inc	sp
   9856 DD E1         [14] 2929 	pop	ix
   9858 C9            [10] 2930 	ret
                           2931 ;src/main.c:712: void inicializarJuego() {
                           2932 ;	---------------------------------
                           2933 ; Function inicializarJuego
                           2934 ; ---------------------------------
   9859                    2935 _inicializarJuego::
                           2936 ;src/main.c:714: num_mapa = 0;
   9859 21 F0 88      [10] 2937 	ld	hl,#_num_mapa + 0
   985C 36 00         [10] 2938 	ld	(hl), #0x00
                           2939 ;src/main.c:715: mapa = mapas[num_mapa];
   985E 21 07 89      [10] 2940 	ld	hl, #_mapas + 0
   9861 7E            [ 7] 2941 	ld	a,(hl)
   9862 FD 21 EE 88   [14] 2942 	ld	iy,#_mapa
   9866 FD 77 00      [19] 2943 	ld	0 (iy),a
   9869 23            [ 6] 2944 	inc	hl
   986A 7E            [ 7] 2945 	ld	a,(hl)
   986B 32 EF 88      [13] 2946 	ld	(#_mapa + 1),a
                           2947 ;src/main.c:716: cpct_etm_setTileset2x4(g_tileset);
   986E 21 E0 54      [10] 2948 	ld	hl,#_g_tileset
   9871 CD D3 7D      [17] 2949 	call	_cpct_etm_setTileset2x4
                           2950 ;src/main.c:718: dibujarMapa();
   9874 CD F1 88      [17] 2951 	call	_dibujarMapa
                           2952 ;src/main.c:720: borrarPantallaArriba(0, 0, 40, 1);
   9877 21 28 01      [10] 2953 	ld	hl,#0x0128
   987A E5            [11] 2954 	push	hl
   987B 21 00 00      [10] 2955 	ld	hl,#0x0000
   987E E5            [11] 2956 	push	hl
   987F CD 85 96      [17] 2957 	call	_borrarPantallaArriba
   9882 F1            [10] 2958 	pop	af
   9883 F1            [10] 2959 	pop	af
                           2960 ;src/main.c:721: barraPuntuacionInicial();
   9884 CD C3 95      [17] 2961 	call	_barraPuntuacionInicial
                           2962 ;src/main.c:724: prota.x = prota.px = 4;
   9887 21 DE 88      [10] 2963 	ld	hl,#(_prota + 0x0002)
   988A 36 04         [10] 2964 	ld	(hl),#0x04
   988C 21 DC 88      [10] 2965 	ld	hl,#_prota
   988F 36 04         [10] 2966 	ld	(hl),#0x04
                           2967 ;src/main.c:725: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   9891 21 DF 88      [10] 2968 	ld	hl,#(_prota + 0x0003)
   9894 36 68         [10] 2969 	ld	(hl),#0x68
   9896 21 DD 88      [10] 2970 	ld	hl,#(_prota + 0x0001)
   9899 36 68         [10] 2971 	ld	(hl),#0x68
                           2972 ;src/main.c:726: prota.mover  = NO;
   989B 21 E2 88      [10] 2973 	ld	hl,#(_prota + 0x0006)
   989E 36 00         [10] 2974 	ld	(hl),#0x00
                           2975 ;src/main.c:727: prota.mira=M_derecha;
   98A0 21 E3 88      [10] 2976 	ld	hl,#(_prota + 0x0007)
   98A3 36 00         [10] 2977 	ld	(hl),#0x00
                           2978 ;src/main.c:728: prota.sprite = g_hero;
   98A5 21 A8 7A      [10] 2979 	ld	hl,#_g_hero
   98A8 22 E0 88      [16] 2980 	ld	((_prota + 0x0004)), hl
                           2981 ;src/main.c:732: cu.x = cu.px = 0;
   98AB 21 E6 88      [10] 2982 	ld	hl,#(_cu + 0x0002)
   98AE 36 00         [10] 2983 	ld	(hl),#0x00
   98B0 21 E4 88      [10] 2984 	ld	hl,#_cu
   98B3 36 00         [10] 2985 	ld	(hl),#0x00
                           2986 ;src/main.c:733: cu.y = cu.py = 0;
   98B5 21 E7 88      [10] 2987 	ld	hl,#(_cu + 0x0003)
   98B8 36 00         [10] 2988 	ld	(hl),#0x00
   98BA 21 E5 88      [10] 2989 	ld	hl,#(_cu + 0x0001)
   98BD 36 00         [10] 2990 	ld	(hl),#0x00
                           2991 ;src/main.c:734: cu.lanzado = NO;
   98BF 21 EA 88      [10] 2992 	ld	hl,#(_cu + 0x0006)
   98C2 36 00         [10] 2993 	ld	(hl),#0x00
                           2994 ;src/main.c:735: cu.mover = NO;
   98C4 21 ED 88      [10] 2995 	ld	hl,#(_cu + 0x0009)
   98C7 36 00         [10] 2996 	ld	(hl),#0x00
                           2997 ;src/main.c:737: inicializarEnemy();
   98C9 CD D7 97      [17] 2998 	call	_inicializarEnemy
                           2999 ;src/main.c:739: dibujarProta();
   98CC C3 17 89      [10] 3000 	jp  _dibujarProta
                           3001 ;src/main.c:742: void main(void) {
                           3002 ;	---------------------------------
                           3003 ; Function main
                           3004 ; ---------------------------------
   98CF                    3005 _main::
                           3006 ;src/main.c:746: inicializarCPC();
   98CF CD B4 97      [17] 3007 	call	_inicializarCPC
                           3008 ;src/main.c:747: menuInicio();
   98D2 CD D8 96      [17] 3009 	call	_menuInicio
                           3010 ;src/main.c:749: inicializarJuego();
   98D5 CD 59 98      [17] 3011 	call	_inicializarJuego
                           3012 ;src/main.c:750: cpct_akp_musicPlay();
   98D8 CD 3A 7F      [17] 3013 	call	_cpct_akp_musicPlay
                           3014 ;src/main.c:752: while (1) {
   98DB                    3015 00122$:
                           3016 ;src/main.c:754: i = (2 + num_mapa) + 1;
   98DB 21 F0 88      [10] 3017 	ld	hl,#_num_mapa + 0
   98DE 4E            [ 7] 3018 	ld	c, (hl)
   98DF 0C            [ 4] 3019 	inc	c
   98E0 0C            [ 4] 3020 	inc	c
   98E1 0C            [ 4] 3021 	inc	c
                           3022 ;src/main.c:755: actual = enemy;
                           3023 ;src/main.c:757: comprobarTeclado();
   98E2 C5            [11] 3024 	push	bc
   98E3 CD BB 94      [17] 3025 	call	_comprobarTeclado
   98E6 CD 1E 95      [17] 3026 	call	_moverCuchillo
   98E9 C1            [10] 3027 	pop	bc
                           3028 ;src/main.c:760: while(--i){
   98EA 11 A8 88      [10] 3029 	ld	de,#_enemy
   98ED                    3030 00101$:
   98ED 0D            [ 4] 3031 	dec c
   98EE 28 11         [12] 3032 	jr	Z,00103$
                           3033 ;src/main.c:761: moverEnemigo(actual);
   98F0 C5            [11] 3034 	push	bc
   98F1 D5            [11] 3035 	push	de
   98F2 D5            [11] 3036 	push	de
   98F3 CD 67 91      [17] 3037 	call	_moverEnemigo
   98F6 F1            [10] 3038 	pop	af
   98F7 D1            [10] 3039 	pop	de
   98F8 C1            [10] 3040 	pop	bc
                           3041 ;src/main.c:762: ++actual;
   98F9 21 0D 00      [10] 3042 	ld	hl,#0x000D
   98FC 19            [11] 3043 	add	hl,de
   98FD 5D            [ 4] 3044 	ld	e,l
   98FE 54            [ 4] 3045 	ld	d,h
   98FF 18 EC         [12] 3046 	jr	00101$
   9901                    3047 00103$:
                           3048 ;src/main.c:765: actual = enemy;
   9901 01 A8 88      [10] 3049 	ld	bc,#_enemy
                           3050 ;src/main.c:767: cpct_waitVSYNC();
   9904 C5            [11] 3051 	push	bc
   9905 CD 04 7F      [17] 3052 	call	_cpct_waitVSYNC
   9908 C1            [10] 3053 	pop	bc
                           3054 ;src/main.c:769: if (prota.mover) {
   9909 11 E2 88      [10] 3055 	ld	de,#_prota+6
   990C 1A            [ 7] 3056 	ld	a,(de)
   990D B7            [ 4] 3057 	or	a, a
   990E 28 09         [12] 3058 	jr	Z,00105$
                           3059 ;src/main.c:770: redibujarProta();
   9910 C5            [11] 3060 	push	bc
   9911 D5            [11] 3061 	push	de
   9912 CD E8 89      [17] 3062 	call	_redibujarProta
   9915 D1            [10] 3063 	pop	de
   9916 C1            [10] 3064 	pop	bc
                           3065 ;src/main.c:771: prota.mover = NO;
   9917 AF            [ 4] 3066 	xor	a, a
   9918 12            [ 7] 3067 	ld	(de),a
   9919                    3068 00105$:
                           3069 ;src/main.c:773: if(cu.lanzado && cu.mover){
   9919 21 EA 88      [10] 3070 	ld	hl,#_cu + 6
   991C 5E            [ 7] 3071 	ld	e,(hl)
   991D 21 ED 88      [10] 3072 	ld	hl,#_cu + 9
   9920 7B            [ 4] 3073 	ld	a,e
   9921 B7            [ 4] 3074 	or	a, a
   9922 28 0B         [12] 3075 	jr	Z,00110$
   9924 7E            [ 7] 3076 	ld	a,(hl)
   9925 B7            [ 4] 3077 	or	a, a
   9926 28 07         [12] 3078 	jr	Z,00110$
                           3079 ;src/main.c:774: redibujarCuchillo();
   9928 C5            [11] 3080 	push	bc
   9929 CD 8B 93      [17] 3081 	call	_redibujarCuchillo
   992C C1            [10] 3082 	pop	bc
   992D 18 0D         [12] 3083 	jr	00137$
   992F                    3084 00110$:
                           3085 ;src/main.c:775: }else if (cu.lanzado && !cu.mover){
   992F 7B            [ 4] 3086 	ld	a,e
   9930 B7            [ 4] 3087 	or	a, a
   9931 28 09         [12] 3088 	jr	Z,00137$
   9933 7E            [ 7] 3089 	ld	a,(hl)
   9934 B7            [ 4] 3090 	or	a, a
   9935 20 05         [12] 3091 	jr	NZ,00137$
                           3092 ;src/main.c:776: borrarCuchillo();
   9937 C5            [11] 3093 	push	bc
   9938 CD 0D 93      [17] 3094 	call	_borrarCuchillo
   993B C1            [10] 3095 	pop	bc
                           3096 ;src/main.c:779: while(--i){
   993C                    3097 00137$:
   993C 1E 05         [ 7] 3098 	ld	e,#0x05
   993E                    3099 00118$:
   993E 1D            [ 4] 3100 	dec	e
   993F 7B            [ 4] 3101 	ld	a,e
   9940 B7            [ 4] 3102 	or	a, a
   9941 28 49         [12] 3103 	jr	Z,00120$
                           3104 ;src/main.c:780: if(actual->mover){
   9943 C5            [11] 3105 	push	bc
   9944 FD E1         [14] 3106 	pop	iy
   9946 FD 7E 06      [19] 3107 	ld	a,6 (iy)
   9949 B7            [ 4] 3108 	or	a, a
   994A 28 09         [12] 3109 	jr	Z,00114$
                           3110 ;src/main.c:781: redibujarEnemigo(actual);
   994C C5            [11] 3111 	push	bc
   994D D5            [11] 3112 	push	de
   994E C5            [11] 3113 	push	bc
   994F CD 06 8D      [17] 3114 	call	_redibujarEnemigo
   9952 F1            [10] 3115 	pop	af
   9953 D1            [10] 3116 	pop	de
   9954 C1            [10] 3117 	pop	bc
   9955                    3118 00114$:
                           3119 ;src/main.c:783: if (actual->muerto && actual->muertes == 0){
   9955 C5            [11] 3120 	push	bc
   9956 FD E1         [14] 3121 	pop	iy
   9958 FD 7E 08      [19] 3122 	ld	a,8 (iy)
   995B B7            [ 4] 3123 	or	a, a
   995C 28 26         [12] 3124 	jr	Z,00116$
   995E 21 0C 00      [10] 3125 	ld	hl,#0x000C
   9961 09            [11] 3126 	add	hl,bc
   9962 7E            [ 7] 3127 	ld	a,(hl)
   9963 B7            [ 4] 3128 	or	a, a
   9964 20 1E         [12] 3129 	jr	NZ,00116$
                           3130 ;src/main.c:784: borrarEnemigo(actual);
   9966 E5            [11] 3131 	push	hl
   9967 C5            [11] 3132 	push	bc
   9968 D5            [11] 3133 	push	de
   9969 C5            [11] 3134 	push	bc
   996A CD 72 8C      [17] 3135 	call	_borrarEnemigo
   996D F1            [10] 3136 	pop	af
   996E D1            [10] 3137 	pop	de
   996F C1            [10] 3138 	pop	bc
   9970 C5            [11] 3139 	push	bc
   9971 D5            [11] 3140 	push	de
   9972 C5            [11] 3141 	push	bc
   9973 CD CA 8B      [17] 3142 	call	_dibujarExplosion
   9976 F1            [10] 3143 	pop	af
   9977 D1            [10] 3144 	pop	de
   9978 C1            [10] 3145 	pop	bc
   9979 E1            [10] 3146 	pop	hl
                           3147 ;src/main.c:787: actual->muertes++;
   997A 56            [ 7] 3148 	ld	d,(hl)
   997B 14            [ 4] 3149 	inc	d
   997C 72            [ 7] 3150 	ld	(hl),d
                           3151 ;src/main.c:788: actual->x = 0;
   997D AF            [ 4] 3152 	xor	a, a
   997E 02            [ 7] 3153 	ld	(bc),a
                           3154 ;src/main.c:789: actual->y = 0;
   997F 69            [ 4] 3155 	ld	l, c
   9980 60            [ 4] 3156 	ld	h, b
   9981 23            [ 6] 3157 	inc	hl
   9982 36 00         [10] 3158 	ld	(hl),#0x00
   9984                    3159 00116$:
                           3160 ;src/main.c:791: ++actual;
   9984 21 0D 00      [10] 3161 	ld	hl,#0x000D
   9987 09            [11] 3162 	add	hl,bc
   9988 4D            [ 4] 3163 	ld	c,l
   9989 44            [ 4] 3164 	ld	b,h
   998A 18 B2         [12] 3165 	jr	00118$
   998C                    3166 00120$:
                           3167 ;src/main.c:793: cpct_waitVSYNC();
   998C CD 04 7F      [17] 3168 	call	_cpct_waitVSYNC
   998F C3 DB 98      [10] 3169 	jp	00122$
                           3170 	.area _CODE
                           3171 	.area _INITIALIZER
                           3172 	.area _CABS (ABS)
   3F00                    3173 	.org 0x3F00
   3F00                    3174 _G_song:
   3F00 41                 3175 	.db #0x41	; 65	'A'
   3F01 54                 3176 	.db #0x54	; 84	'T'
   3F02 31                 3177 	.db #0x31	; 49	'1'
   3F03 30                 3178 	.db #0x30	; 48	'0'
   3F04 01                 3179 	.db #0x01	; 1
   3F05 40                 3180 	.db #0x40	; 64
   3F06 42                 3181 	.db #0x42	; 66	'B'
   3F07 0F                 3182 	.db #0x0F	; 15
   3F08 02                 3183 	.db #0x02	; 2
   3F09 06                 3184 	.db #0x06	; 6
   3F0A 1D                 3185 	.db #0x1D	; 29
   3F0B 00                 3186 	.db #0x00	; 0
   3F0C 10                 3187 	.db #0x10	; 16
   3F0D 40                 3188 	.db #0x40	; 64
   3F0E 19                 3189 	.db #0x19	; 25
   3F0F 40                 3190 	.db #0x40	; 64
   3F10 00                 3191 	.db #0x00	; 0
   3F11 00                 3192 	.db #0x00	; 0
   3F12 00                 3193 	.db #0x00	; 0
   3F13 00                 3194 	.db #0x00	; 0
   3F14 00                 3195 	.db #0x00	; 0
   3F15 00                 3196 	.db #0x00	; 0
   3F16 0D                 3197 	.db #0x0D	; 13
   3F17 12                 3198 	.db #0x12	; 18
   3F18 40                 3199 	.db #0x40	; 64
   3F19 01                 3200 	.db #0x01	; 1
   3F1A 00                 3201 	.db #0x00	; 0
   3F1B 7C                 3202 	.db #0x7C	; 124
   3F1C 18                 3203 	.db #0x18	; 24
   3F1D 78                 3204 	.db #0x78	; 120	'x'
   3F1E 0C                 3205 	.db #0x0C	; 12
   3F1F 34                 3206 	.db #0x34	; 52	'4'
   3F20 30                 3207 	.db #0x30	; 48	'0'
   3F21 2C                 3208 	.db #0x2C	; 44
   3F22 28                 3209 	.db #0x28	; 40
   3F23 24                 3210 	.db #0x24	; 36
   3F24 20                 3211 	.db #0x20	; 32
   3F25 1C                 3212 	.db #0x1C	; 28
   3F26 0D                 3213 	.db #0x0D	; 13
   3F27 25                 3214 	.db #0x25	; 37
   3F28 40                 3215 	.db #0x40	; 64
   3F29 20                 3216 	.db #0x20	; 32
   3F2A 00                 3217 	.db #0x00	; 0
   3F2B 00                 3218 	.db #0x00	; 0
   3F2C 00                 3219 	.db #0x00	; 0
   3F2D 39                 3220 	.db #0x39	; 57	'9'
   3F2E 40                 3221 	.db #0x40	; 64
   3F2F 00                 3222 	.db #0x00	; 0
   3F30 57                 3223 	.db #0x57	; 87	'W'
   3F31 40                 3224 	.db #0x40	; 64
   3F32 3B                 3225 	.db #0x3B	; 59
   3F33 40                 3226 	.db #0x40	; 64
   3F34 57                 3227 	.db #0x57	; 87	'W'
   3F35 40                 3228 	.db #0x40	; 64
   3F36 01                 3229 	.db #0x01	; 1
   3F37 2F                 3230 	.db #0x2F	; 47
   3F38 40                 3231 	.db #0x40	; 64
   3F39 19                 3232 	.db #0x19	; 25
   3F3A 00                 3233 	.db #0x00	; 0
   3F3B 76                 3234 	.db #0x76	; 118	'v'
   3F3C E1                 3235 	.db #0xE1	; 225
   3F3D 00                 3236 	.db #0x00	; 0
   3F3E 00                 3237 	.db #0x00	; 0
   3F3F 01                 3238 	.db #0x01	; 1
   3F40 04                 3239 	.db #0x04	; 4
   3F41 51                 3240 	.db #0x51	; 81	'Q'
   3F42 04                 3241 	.db #0x04	; 4
   3F43 37                 3242 	.db #0x37	; 55	'7'
   3F44 04                 3243 	.db #0x04	; 4
   3F45 4F                 3244 	.db #0x4F	; 79	'O'
   3F46 04                 3245 	.db #0x04	; 4
   3F47 37                 3246 	.db #0x37	; 55	'7'
   3F48 02                 3247 	.db #0x02	; 2
   3F49 4B                 3248 	.db #0x4B	; 75	'K'
   3F4A 02                 3249 	.db #0x02	; 2
   3F4B 37                 3250 	.db #0x37	; 55	'7'
   3F4C 04                 3251 	.db #0x04	; 4
   3F4D 4F                 3252 	.db #0x4F	; 79	'O'
   3F4E 04                 3253 	.db #0x04	; 4
   3F4F 37                 3254 	.db #0x37	; 55	'7'
   3F50 04                 3255 	.db #0x04	; 4
   3F51 4F                 3256 	.db #0x4F	; 79	'O'
   3F52 04                 3257 	.db #0x04	; 4
   3F53 37                 3258 	.db #0x37	; 55	'7'
   3F54 02                 3259 	.db #0x02	; 2
   3F55 4B                 3260 	.db #0x4B	; 75	'K'
   3F56 00                 3261 	.db #0x00	; 0
   3F57 42                 3262 	.db #0x42	; 66	'B'
   3F58 60                 3263 	.db #0x60	; 96
   3F59 00                 3264 	.db #0x00	; 0
   3F5A 42                 3265 	.db #0x42	; 66	'B'
   3F5B 80                 3266 	.db #0x80	; 128
   3F5C 00                 3267 	.db #0x00	; 0
   3F5D 00                 3268 	.db #0x00	; 0
   3F5E 42                 3269 	.db #0x42	; 66	'B'
   3F5F 00                 3270 	.db #0x00	; 0
   3F60 00                 3271 	.db #0x00	; 0
