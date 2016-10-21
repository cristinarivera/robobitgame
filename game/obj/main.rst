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
                             17 	.globl _menuOpciones
                             18 	.globl _menuCreditos
                             19 	.globl _menuInstrucciones
                             20 	.globl _borrarPantalla
                             21 	.globl _barraPuntuacionInicial
                             22 	.globl _moverCuchillo
                             23 	.globl _checkKnifeCollision
                             24 	.globl _comprobarTeclado
                             25 	.globl _lanzarCuchillo
                             26 	.globl _redibujarCuchillo
                             27 	.globl _borrarCuchillo
                             28 	.globl _dibujarCuchillo
                             29 	.globl _moverAbajo
                             30 	.globl _moverArriba
                             31 	.globl _moverDerecha
                             32 	.globl _moverIzquierda
                             33 	.globl _avanzarMapa
                             34 	.globl _moverEnemigo
                             35 	.globl _moverEnemigoIzquierda
                             36 	.globl _moverEnemigoDerecha
                             37 	.globl _moverEnemigoAbajo
                             38 	.globl _moverEnemigoArriba
                             39 	.globl _checkEnemyCollision
                             40 	.globl _redibujarEnemigo
                             41 	.globl _borrarEnemigo
                             42 	.globl _borrarExplosion
                             43 	.globl _dibujarExplosion
                             44 	.globl _dibujarEnemigo
                             45 	.globl _checkCollision
                             46 	.globl _getTilePtr
                             47 	.globl _redibujarProta
                             48 	.globl _menuFin
                             49 	.globl _borrarProta
                             50 	.globl _dibujarProta
                             51 	.globl _dibujarMapa
                             52 	.globl _cpct_etm_setTileset2x4
                             53 	.globl _cpct_etm_drawTileBox2x4
                             54 	.globl _cpct_akp_musicPlay
                             55 	.globl _cpct_akp_musicInit
                             56 	.globl _cpct_getScreenPtr
                             57 	.globl _cpct_setPalette
                             58 	.globl _cpct_waitVSYNC
                             59 	.globl _cpct_setVideoMode
                             60 	.globl _cpct_drawStringM0
                             61 	.globl _cpct_drawSpriteMaskedAlignedTable
                             62 	.globl _cpct_drawSolidBox
                             63 	.globl _cpct_drawSprite
                             64 	.globl _cpct_isAnyKeyPressed
                             65 	.globl _cpct_isKeyPressed
                             66 	.globl _cpct_scanKeyboard_if
                             67 	.globl _cpct_scanKeyboard_f
                             68 	.globl _cpct_memset
                             69 	.globl _cpct_disableFirmware
                             70 	.globl _num_mapa
                             71 	.globl _mapa
                             72 	.globl _cu
                             73 	.globl _prota
                             74 	.globl _enemy
                             75 	.globl _EEje
                             76 	.globl _EMirar
                             77 	.globl _spawnY
                             78 	.globl _spawnX
                             79 	.globl _mapas
                             80 ;--------------------------------------------------------
                             81 ; special function registers
                             82 ;--------------------------------------------------------
                             83 ;--------------------------------------------------------
                             84 ; ram data
                             85 ;--------------------------------------------------------
                             86 	.area _DATA
   889A                      87 _EMirar::
   889A                      88 	.ds 1
   889B                      89 _EEje::
   889B                      90 	.ds 1
   889C                      91 _enemy::
   889C                      92 	.ds 52
   88D0                      93 _prota::
   88D0                      94 	.ds 8
   88D8                      95 _cu::
   88D8                      96 	.ds 10
   88E2                      97 _mapa::
   88E2                      98 	.ds 2
   88E4                      99 _num_mapa::
   88E4                     100 	.ds 1
                            101 ;--------------------------------------------------------
                            102 ; ram data
                            103 ;--------------------------------------------------------
                            104 	.area _INITIALIZED
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
                            125 ;src/main.c:108: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
                            126 ;	---------------------------------
                            127 ; Function dummy_cpct_transparentMaskTable0M0_container
                            128 ; ---------------------------------
   7B92                     129 _dummy_cpct_transparentMaskTable0M0_container::
                            130 	.area _g_tablatrans_ (ABS) 
   3E00                     131 	.org 0x3E00 
   3E00                     132 	 _g_tablatrans::
   3E00 FF AA 55 00 AA AA   133 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E08 55 00 55 00 00 00   134 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E10 AA AA 00 00 AA AA   135 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E18 00 00 00 00 00 00   136 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E20 55 00 55 00 00 00   137 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E28 55 00 55 00 00 00   138 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E30 00 00 00 00 00 00   139 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E38 00 00 00 00 00 00   140 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E40 AA AA 00 00 AA AA   141 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E48 00 00 00 00 00 00   142 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E50 AA AA 00 00 AA AA   143 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E58 00 00 00 00 00 00   144 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E60 00 00 00 00 00 00   145 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E68 00 00 00 00 00 00   146 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E70 00 00 00 00 00 00   147 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E78 00 00 00 00 00 00   148 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E80 55 00 55 00 00 00   149 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E88 55 00 55 00 00 00   150 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E90 00 00 00 00 00 00   151 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E98 00 00 00 00 00 00   152 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA0 55 00 55 00 00 00   153 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA8 55 00 55 00 00 00   154 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB0 00 00 00 00 00 00   155 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB8 00 00 00 00 00 00   156 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC0 00 00 00 00 00 00   157 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC8 00 00 00 00 00 00   158 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED0 00 00 00 00 00 00   159 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED8 00 00 00 00 00 00   160 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE0 00 00 00 00 00 00   161 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE8 00 00 00 00 00 00   162 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF0 00 00 00 00 00 00   163 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF8 00 00 00 00 00 00   164 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            165 	.area _CSEG (REL, CON) 
                            166 ;src/main.c:111: void dibujarMapa() {
                            167 ;	---------------------------------
                            168 ; Function dibujarMapa
                            169 ; ---------------------------------
   88E5                     170 _dibujarMapa::
                            171 ;src/main.c:112: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   88E5 2A E2 88      [16]  172 	ld	hl,(_mapa)
   88E8 E5            [11]  173 	push	hl
   88E9 21 F0 C0      [10]  174 	ld	hl,#0xC0F0
   88EC E5            [11]  175 	push	hl
   88ED 21 2C 28      [10]  176 	ld	hl,#0x282C
   88F0 E5            [11]  177 	push	hl
   88F1 2E 00         [ 7]  178 	ld	l, #0x00
   88F3 E5            [11]  179 	push	hl
   88F4 AF            [ 4]  180 	xor	a, a
   88F5 F5            [11]  181 	push	af
   88F6 33            [ 6]  182 	inc	sp
   88F7 CD 38 7D      [17]  183 	call	_cpct_etm_drawTileBox2x4
   88FA C9            [10]  184 	ret
   88FB                     185 _mapas:
   88FB C0 4D               186 	.dw _g_map1
   88FD E0 46               187 	.dw _g_map2
   88FF 00 40               188 	.dw _g_map3
   8901                     189 _spawnX:
   8901 00                  190 	.db #0x00	; 0
   8902 28                  191 	.db #0x28	; 40
   8903 47                  192 	.db #0x47	; 71	'G'
   8904 14                  193 	.db #0x14	; 20
   8905 3C                  194 	.db #0x3C	; 60
   8906                     195 _spawnY:
   8906 00                  196 	.db #0x00	; 0
   8907 2C                  197 	.db #0x2C	; 44
   8908 72                  198 	.db #0x72	; 114	'r'
   8909 8A                  199 	.db #0x8A	; 138
   890A 8A                  200 	.db #0x8A	; 138
                            201 ;src/main.c:115: void dibujarProta() {
                            202 ;	---------------------------------
                            203 ; Function dibujarProta
                            204 ; ---------------------------------
   890B                     205 _dibujarProta::
                            206 ;src/main.c:116: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   890B 21 D1 88      [10]  207 	ld	hl, #_prota + 1
   890E 56            [ 7]  208 	ld	d,(hl)
   890F 21 D0 88      [10]  209 	ld	hl, #_prota + 0
   8912 46            [ 7]  210 	ld	b,(hl)
   8913 D5            [11]  211 	push	de
   8914 33            [ 6]  212 	inc	sp
   8915 C5            [11]  213 	push	bc
   8916 33            [ 6]  214 	inc	sp
   8917 21 00 C0      [10]  215 	ld	hl,#0xC000
   891A E5            [11]  216 	push	hl
   891B CD 3F 88      [17]  217 	call	_cpct_getScreenPtr
   891E EB            [ 4]  218 	ex	de,hl
                            219 ;src/main.c:117: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   891F ED 4B D4 88   [20]  220 	ld	bc, (#_prota + 4)
   8923 21 00 3E      [10]  221 	ld	hl,#_g_tablatrans
   8926 E5            [11]  222 	push	hl
   8927 21 07 16      [10]  223 	ld	hl,#0x1607
   892A E5            [11]  224 	push	hl
   892B D5            [11]  225 	push	de
   892C C5            [11]  226 	push	bc
   892D CD 5F 88      [17]  227 	call	_cpct_drawSpriteMaskedAlignedTable
   8930 C9            [10]  228 	ret
                            229 ;src/main.c:120: void borrarProta() {
                            230 ;	---------------------------------
                            231 ; Function borrarProta
                            232 ; ---------------------------------
   8931                     233 _borrarProta::
   8931 DD E5         [15]  234 	push	ix
   8933 DD 21 00 00   [14]  235 	ld	ix,#0
   8937 DD 39         [15]  236 	add	ix,sp
   8939 F5            [11]  237 	push	af
   893A 3B            [ 6]  238 	dec	sp
                            239 ;src/main.c:122: u8 w = 4 + (prota.px & 1);
   893B 21 D2 88      [10]  240 	ld	hl, #_prota + 2
   893E 4E            [ 7]  241 	ld	c,(hl)
   893F 79            [ 4]  242 	ld	a,c
   8940 E6 01         [ 7]  243 	and	a, #0x01
   8942 47            [ 4]  244 	ld	b,a
   8943 04            [ 4]  245 	inc	b
   8944 04            [ 4]  246 	inc	b
   8945 04            [ 4]  247 	inc	b
   8946 04            [ 4]  248 	inc	b
                            249 ;src/main.c:125: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   8947 21 D3 88      [10]  250 	ld	hl, #_prota + 3
   894A 5E            [ 7]  251 	ld	e,(hl)
   894B CB 4B         [ 8]  252 	bit	1, e
   894D 28 04         [12]  253 	jr	Z,00103$
   894F 3E 01         [ 7]  254 	ld	a,#0x01
   8951 18 02         [12]  255 	jr	00104$
   8953                     256 00103$:
   8953 3E 00         [ 7]  257 	ld	a,#0x00
   8955                     258 00104$:
   8955 C6 06         [ 7]  259 	add	a, #0x06
   8957 DD 77 FD      [19]  260 	ld	-3 (ix),a
                            261 ;src/main.c:127: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   895A FD 2A E2 88   [20]  262 	ld	iy,(_mapa)
   895E 16 00         [ 7]  263 	ld	d,#0x00
   8960 7B            [ 4]  264 	ld	a,e
   8961 C6 E8         [ 7]  265 	add	a,#0xE8
   8963 DD 77 FE      [19]  266 	ld	-2 (ix),a
   8966 7A            [ 4]  267 	ld	a,d
   8967 CE FF         [ 7]  268 	adc	a,#0xFF
   8969 DD 77 FF      [19]  269 	ld	-1 (ix),a
   896C DD 6E FE      [19]  270 	ld	l,-2 (ix)
   896F DD 66 FF      [19]  271 	ld	h,-1 (ix)
   8972 DD CB FF 7E   [20]  272 	bit	7, -1 (ix)
   8976 28 04         [12]  273 	jr	Z,00105$
   8978 21 EB FF      [10]  274 	ld	hl,#0xFFEB
   897B 19            [11]  275 	add	hl,de
   897C                     276 00105$:
   897C CB 2C         [ 8]  277 	sra	h
   897E CB 1D         [ 8]  278 	rr	l
   8980 CB 2C         [ 8]  279 	sra	h
   8982 CB 1D         [ 8]  280 	rr	l
   8984 55            [ 4]  281 	ld	d,l
   8985 CB 39         [ 8]  282 	srl	c
   8987 FD E5         [15]  283 	push	iy
   8989 21 F0 C0      [10]  284 	ld	hl,#0xC0F0
   898C E5            [11]  285 	push	hl
   898D 3E 28         [ 7]  286 	ld	a,#0x28
   898F F5            [11]  287 	push	af
   8990 33            [ 6]  288 	inc	sp
   8991 DD 7E FD      [19]  289 	ld	a,-3 (ix)
   8994 F5            [11]  290 	push	af
   8995 33            [ 6]  291 	inc	sp
   8996 C5            [11]  292 	push	bc
   8997 33            [ 6]  293 	inc	sp
   8998 D5            [11]  294 	push	de
   8999 33            [ 6]  295 	inc	sp
   899A 79            [ 4]  296 	ld	a,c
   899B F5            [11]  297 	push	af
   899C 33            [ 6]  298 	inc	sp
   899D CD 38 7D      [17]  299 	call	_cpct_etm_drawTileBox2x4
   89A0 DD F9         [10]  300 	ld	sp, ix
   89A2 DD E1         [14]  301 	pop	ix
   89A4 C9            [10]  302 	ret
                            303 ;src/main.c:130: void menuFin(){
                            304 ;	---------------------------------
                            305 ; Function menuFin
                            306 ; ---------------------------------
   89A5                     307 _menuFin::
                            308 ;src/main.c:133: cpct_clearScreen(0);
   89A5 21 00 40      [10]  309 	ld	hl,#0x4000
   89A8 E5            [11]  310 	push	hl
   89A9 AF            [ 4]  311 	xor	a, a
   89AA F5            [11]  312 	push	af
   89AB 33            [ 6]  313 	inc	sp
   89AC 26 C0         [ 7]  314 	ld	h, #0xC0
   89AE E5            [11]  315 	push	hl
   89AF CD 1E 7F      [17]  316 	call	_cpct_memset
                            317 ;src/main.c:135: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   89B2 21 18 5A      [10]  318 	ld	hl,#0x5A18
   89B5 E5            [11]  319 	push	hl
   89B6 21 00 C0      [10]  320 	ld	hl,#0xC000
   89B9 E5            [11]  321 	push	hl
   89BA CD 3F 88      [17]  322 	call	_cpct_getScreenPtr
   89BD 4D            [ 4]  323 	ld	c,l
   89BE 44            [ 4]  324 	ld	b,h
                            325 ;src/main.c:136: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   89BF 21 02 00      [10]  326 	ld	hl,#0x0002
   89C2 E5            [11]  327 	push	hl
   89C3 C5            [11]  328 	push	bc
   89C4 21 D2 89      [10]  329 	ld	hl,#___str_0
   89C7 E5            [11]  330 	push	hl
   89C8 CD 6F 7C      [17]  331 	call	_cpct_drawStringM0
   89CB 21 06 00      [10]  332 	ld	hl,#6
   89CE 39            [11]  333 	add	hl,sp
   89CF F9            [ 6]  334 	ld	sp,hl
                            335 ;src/main.c:138: while(1){}
   89D0                     336 00102$:
   89D0 18 FE         [12]  337 	jr	00102$
   89D2                     338 ___str_0:
   89D2 47 41 4D 45 20 4F   339 	.ascii "GAME OVER"
        56 45 52
   89DB 00                  340 	.db 0x00
                            341 ;src/main.c:141: void redibujarProta() {
                            342 ;	---------------------------------
                            343 ; Function redibujarProta
                            344 ; ---------------------------------
   89DC                     345 _redibujarProta::
                            346 ;src/main.c:142: borrarProta();
   89DC CD 31 89      [17]  347 	call	_borrarProta
                            348 ;src/main.c:143: prota.px = prota.x;
   89DF 01 D2 88      [10]  349 	ld	bc,#_prota + 2
   89E2 3A D0 88      [13]  350 	ld	a, (#_prota + 0)
   89E5 02            [ 7]  351 	ld	(bc),a
                            352 ;src/main.c:144: prota.py = prota.y;
   89E6 01 D3 88      [10]  353 	ld	bc,#_prota + 3
   89E9 3A D1 88      [13]  354 	ld	a, (#_prota + 1)
   89EC 02            [ 7]  355 	ld	(bc),a
                            356 ;src/main.c:145: dibujarProta();
   89ED C3 0B 89      [10]  357 	jp  _dibujarProta
                            358 ;src/main.c:148: u8* getTilePtr(u8 x, u8 y) {
                            359 ;	---------------------------------
                            360 ; Function getTilePtr
                            361 ; ---------------------------------
   89F0                     362 _getTilePtr::
   89F0 DD E5         [15]  363 	push	ix
   89F2 DD 21 00 00   [14]  364 	ld	ix,#0
   89F6 DD 39         [15]  365 	add	ix,sp
                            366 ;src/main.c:149: return mapa + ((y-ORIGEN_MAPA_Y)/4)*g_map1_W + x/2;
   89F8 DD 4E 05      [19]  367 	ld	c,5 (ix)
   89FB 06 00         [ 7]  368 	ld	b,#0x00
   89FD 79            [ 4]  369 	ld	a,c
   89FE C6 E8         [ 7]  370 	add	a,#0xE8
   8A00 5F            [ 4]  371 	ld	e,a
   8A01 78            [ 4]  372 	ld	a,b
   8A02 CE FF         [ 7]  373 	adc	a,#0xFF
   8A04 57            [ 4]  374 	ld	d,a
   8A05 6B            [ 4]  375 	ld	l, e
   8A06 62            [ 4]  376 	ld	h, d
   8A07 CB 7A         [ 8]  377 	bit	7, d
   8A09 28 04         [12]  378 	jr	Z,00103$
   8A0B 21 EB FF      [10]  379 	ld	hl,#0xFFEB
   8A0E 09            [11]  380 	add	hl,bc
   8A0F                     381 00103$:
   8A0F CB 2C         [ 8]  382 	sra	h
   8A11 CB 1D         [ 8]  383 	rr	l
   8A13 CB 2C         [ 8]  384 	sra	h
   8A15 CB 1D         [ 8]  385 	rr	l
   8A17 4D            [ 4]  386 	ld	c, l
   8A18 44            [ 4]  387 	ld	b, h
   8A19 29            [11]  388 	add	hl, hl
   8A1A 29            [11]  389 	add	hl, hl
   8A1B 09            [11]  390 	add	hl, bc
   8A1C 29            [11]  391 	add	hl, hl
   8A1D 29            [11]  392 	add	hl, hl
   8A1E 29            [11]  393 	add	hl, hl
   8A1F 4D            [ 4]  394 	ld	c,l
   8A20 44            [ 4]  395 	ld	b,h
   8A21 2A E2 88      [16]  396 	ld	hl,(_mapa)
   8A24 09            [11]  397 	add	hl,bc
   8A25 DD 4E 04      [19]  398 	ld	c,4 (ix)
   8A28 CB 39         [ 8]  399 	srl	c
   8A2A 59            [ 4]  400 	ld	e,c
   8A2B 16 00         [ 7]  401 	ld	d,#0x00
   8A2D 19            [11]  402 	add	hl,de
   8A2E DD E1         [14]  403 	pop	ix
   8A30 C9            [10]  404 	ret
                            405 ;src/main.c:152: u8 checkCollision(int direction) { // check optimization
                            406 ;	---------------------------------
                            407 ; Function checkCollision
                            408 ; ---------------------------------
   8A31                     409 _checkCollision::
   8A31 DD E5         [15]  410 	push	ix
   8A33 DD 21 00 00   [14]  411 	ld	ix,#0
   8A37 DD 39         [15]  412 	add	ix,sp
   8A39 F5            [11]  413 	push	af
                            414 ;src/main.c:153: u8 *headTile=0, *feetTile=0, *waistTile=0;
   8A3A 21 00 00      [10]  415 	ld	hl,#0x0000
   8A3D E3            [19]  416 	ex	(sp), hl
   8A3E 11 00 00      [10]  417 	ld	de,#0x0000
   8A41 01 00 00      [10]  418 	ld	bc,#0x0000
                            419 ;src/main.c:155: switch (direction) {
   8A44 DD CB 05 7E   [20]  420 	bit	7, 5 (ix)
   8A48 C2 65 8B      [10]  421 	jp	NZ,00105$
   8A4B 3E 03         [ 7]  422 	ld	a,#0x03
   8A4D DD BE 04      [19]  423 	cp	a, 4 (ix)
   8A50 3E 00         [ 7]  424 	ld	a,#0x00
   8A52 DD 9E 05      [19]  425 	sbc	a, 5 (ix)
   8A55 E2 5A 8A      [10]  426 	jp	PO, 00128$
   8A58 EE 80         [ 7]  427 	xor	a, #0x80
   8A5A                     428 00128$:
   8A5A FA 65 8B      [10]  429 	jp	M,00105$
   8A5D DD 5E 04      [19]  430 	ld	e,4 (ix)
   8A60 16 00         [ 7]  431 	ld	d,#0x00
   8A62 21 69 8A      [10]  432 	ld	hl,#00129$
   8A65 19            [11]  433 	add	hl,de
   8A66 19            [11]  434 	add	hl,de
   8A67 19            [11]  435 	add	hl,de
   8A68 E9            [ 4]  436 	jp	(hl)
   8A69                     437 00129$:
   8A69 C3 75 8A      [10]  438 	jp	00101$
   8A6C C3 C0 8A      [10]  439 	jp	00102$
   8A6F C3 01 8B      [10]  440 	jp	00103$
   8A72 C3 34 8B      [10]  441 	jp	00104$
                            442 ;src/main.c:156: case 0:
   8A75                     443 00101$:
                            444 ;src/main.c:157: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   8A75 21 D1 88      [10]  445 	ld	hl, #(_prota + 0x0001) + 0
   8A78 5E            [ 7]  446 	ld	e,(hl)
   8A79 21 D0 88      [10]  447 	ld	hl, #_prota + 0
   8A7C 4E            [ 7]  448 	ld	c,(hl)
   8A7D 0C            [ 4]  449 	inc	c
   8A7E 0C            [ 4]  450 	inc	c
   8A7F 0C            [ 4]  451 	inc	c
   8A80 0C            [ 4]  452 	inc	c
   8A81 7B            [ 4]  453 	ld	a,e
   8A82 F5            [11]  454 	push	af
   8A83 33            [ 6]  455 	inc	sp
   8A84 79            [ 4]  456 	ld	a,c
   8A85 F5            [11]  457 	push	af
   8A86 33            [ 6]  458 	inc	sp
   8A87 CD F0 89      [17]  459 	call	_getTilePtr
   8A8A F1            [10]  460 	pop	af
   8A8B 33            [ 6]  461 	inc	sp
   8A8C 33            [ 6]  462 	inc	sp
   8A8D E5            [11]  463 	push	hl
                            464 ;src/main.c:158: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   8A8E 3A D1 88      [13]  465 	ld	a, (#(_prota + 0x0001) + 0)
   8A91 C6 14         [ 7]  466 	add	a, #0x14
   8A93 4F            [ 4]  467 	ld	c,a
   8A94 21 D0 88      [10]  468 	ld	hl, #_prota + 0
   8A97 46            [ 7]  469 	ld	b,(hl)
   8A98 04            [ 4]  470 	inc	b
   8A99 04            [ 4]  471 	inc	b
   8A9A 04            [ 4]  472 	inc	b
   8A9B 04            [ 4]  473 	inc	b
   8A9C 79            [ 4]  474 	ld	a,c
   8A9D F5            [11]  475 	push	af
   8A9E 33            [ 6]  476 	inc	sp
   8A9F C5            [11]  477 	push	bc
   8AA0 33            [ 6]  478 	inc	sp
   8AA1 CD F0 89      [17]  479 	call	_getTilePtr
   8AA4 F1            [10]  480 	pop	af
   8AA5 EB            [ 4]  481 	ex	de,hl
                            482 ;src/main.c:159: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   8AA6 3A D1 88      [13]  483 	ld	a, (#(_prota + 0x0001) + 0)
   8AA9 C6 0B         [ 7]  484 	add	a, #0x0B
   8AAB 47            [ 4]  485 	ld	b,a
   8AAC 3A D0 88      [13]  486 	ld	a, (#_prota + 0)
   8AAF C6 04         [ 7]  487 	add	a, #0x04
   8AB1 D5            [11]  488 	push	de
   8AB2 C5            [11]  489 	push	bc
   8AB3 33            [ 6]  490 	inc	sp
   8AB4 F5            [11]  491 	push	af
   8AB5 33            [ 6]  492 	inc	sp
   8AB6 CD F0 89      [17]  493 	call	_getTilePtr
   8AB9 F1            [10]  494 	pop	af
   8ABA 4D            [ 4]  495 	ld	c,l
   8ABB 44            [ 4]  496 	ld	b,h
   8ABC D1            [10]  497 	pop	de
                            498 ;src/main.c:160: break;
   8ABD C3 65 8B      [10]  499 	jp	00105$
                            500 ;src/main.c:161: case 1:
   8AC0                     501 00102$:
                            502 ;src/main.c:162: headTile  = getTilePtr(prota.x - 1, prota.y);
   8AC0 21 D1 88      [10]  503 	ld	hl, #(_prota + 0x0001) + 0
   8AC3 56            [ 7]  504 	ld	d,(hl)
   8AC4 21 D0 88      [10]  505 	ld	hl, #_prota + 0
   8AC7 46            [ 7]  506 	ld	b,(hl)
   8AC8 05            [ 4]  507 	dec	b
   8AC9 D5            [11]  508 	push	de
   8ACA 33            [ 6]  509 	inc	sp
   8ACB C5            [11]  510 	push	bc
   8ACC 33            [ 6]  511 	inc	sp
   8ACD CD F0 89      [17]  512 	call	_getTilePtr
   8AD0 F1            [10]  513 	pop	af
   8AD1 33            [ 6]  514 	inc	sp
   8AD2 33            [ 6]  515 	inc	sp
   8AD3 E5            [11]  516 	push	hl
                            517 ;src/main.c:163: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
   8AD4 3A D1 88      [13]  518 	ld	a, (#(_prota + 0x0001) + 0)
   8AD7 C6 14         [ 7]  519 	add	a, #0x14
   8AD9 57            [ 4]  520 	ld	d,a
   8ADA 21 D0 88      [10]  521 	ld	hl, #_prota + 0
   8ADD 46            [ 7]  522 	ld	b,(hl)
   8ADE 05            [ 4]  523 	dec	b
   8ADF D5            [11]  524 	push	de
   8AE0 33            [ 6]  525 	inc	sp
   8AE1 C5            [11]  526 	push	bc
   8AE2 33            [ 6]  527 	inc	sp
   8AE3 CD F0 89      [17]  528 	call	_getTilePtr
   8AE6 F1            [10]  529 	pop	af
   8AE7 EB            [ 4]  530 	ex	de,hl
                            531 ;src/main.c:164: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
   8AE8 3A D1 88      [13]  532 	ld	a, (#(_prota + 0x0001) + 0)
   8AEB C6 0B         [ 7]  533 	add	a, #0x0B
   8AED 47            [ 4]  534 	ld	b,a
   8AEE 3A D0 88      [13]  535 	ld	a, (#_prota + 0)
   8AF1 C6 FF         [ 7]  536 	add	a,#0xFF
   8AF3 D5            [11]  537 	push	de
   8AF4 C5            [11]  538 	push	bc
   8AF5 33            [ 6]  539 	inc	sp
   8AF6 F5            [11]  540 	push	af
   8AF7 33            [ 6]  541 	inc	sp
   8AF8 CD F0 89      [17]  542 	call	_getTilePtr
   8AFB F1            [10]  543 	pop	af
   8AFC 4D            [ 4]  544 	ld	c,l
   8AFD 44            [ 4]  545 	ld	b,h
   8AFE D1            [10]  546 	pop	de
                            547 ;src/main.c:165: break;
   8AFF 18 64         [12]  548 	jr	00105$
                            549 ;src/main.c:166: case 2:
   8B01                     550 00103$:
                            551 ;src/main.c:167: headTile   = getTilePtr(prota.x, prota.y - 2);
   8B01 3A D1 88      [13]  552 	ld	a, (#(_prota + 0x0001) + 0)
   8B04 C6 FE         [ 7]  553 	add	a,#0xFE
   8B06 21 D0 88      [10]  554 	ld	hl, #_prota + 0
   8B09 56            [ 7]  555 	ld	d,(hl)
   8B0A C5            [11]  556 	push	bc
   8B0B F5            [11]  557 	push	af
   8B0C 33            [ 6]  558 	inc	sp
   8B0D D5            [11]  559 	push	de
   8B0E 33            [ 6]  560 	inc	sp
   8B0F CD F0 89      [17]  561 	call	_getTilePtr
   8B12 F1            [10]  562 	pop	af
   8B13 C1            [10]  563 	pop	bc
   8B14 33            [ 6]  564 	inc	sp
   8B15 33            [ 6]  565 	inc	sp
   8B16 E5            [11]  566 	push	hl
                            567 ;src/main.c:168: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
   8B17 21 D1 88      [10]  568 	ld	hl, #(_prota + 0x0001) + 0
   8B1A 56            [ 7]  569 	ld	d,(hl)
   8B1B 15            [ 4]  570 	dec	d
   8B1C 15            [ 4]  571 	dec	d
   8B1D 3A D0 88      [13]  572 	ld	a, (#_prota + 0)
   8B20 C6 03         [ 7]  573 	add	a, #0x03
   8B22 C5            [11]  574 	push	bc
   8B23 D5            [11]  575 	push	de
   8B24 33            [ 6]  576 	inc	sp
   8B25 F5            [11]  577 	push	af
   8B26 33            [ 6]  578 	inc	sp
   8B27 CD F0 89      [17]  579 	call	_getTilePtr
   8B2A F1            [10]  580 	pop	af
   8B2B EB            [ 4]  581 	ex	de,hl
   8B2C C1            [10]  582 	pop	bc
                            583 ;src/main.c:169: *waistTile = 0;
   8B2D 21 00 00      [10]  584 	ld	hl,#0x0000
   8B30 36 00         [10]  585 	ld	(hl),#0x00
                            586 ;src/main.c:170: break;
   8B32 18 31         [12]  587 	jr	00105$
                            588 ;src/main.c:171: case 3:
   8B34                     589 00104$:
                            590 ;src/main.c:172: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
   8B34 3A D1 88      [13]  591 	ld	a, (#(_prota + 0x0001) + 0)
   8B37 C6 16         [ 7]  592 	add	a, #0x16
   8B39 21 D0 88      [10]  593 	ld	hl, #_prota + 0
   8B3C 56            [ 7]  594 	ld	d,(hl)
   8B3D C5            [11]  595 	push	bc
   8B3E F5            [11]  596 	push	af
   8B3F 33            [ 6]  597 	inc	sp
   8B40 D5            [11]  598 	push	de
   8B41 33            [ 6]  599 	inc	sp
   8B42 CD F0 89      [17]  600 	call	_getTilePtr
   8B45 F1            [10]  601 	pop	af
   8B46 C1            [10]  602 	pop	bc
   8B47 33            [ 6]  603 	inc	sp
   8B48 33            [ 6]  604 	inc	sp
   8B49 E5            [11]  605 	push	hl
                            606 ;src/main.c:173: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   8B4A 3A D1 88      [13]  607 	ld	a, (#(_prota + 0x0001) + 0)
   8B4D C6 16         [ 7]  608 	add	a, #0x16
   8B4F 57            [ 4]  609 	ld	d,a
   8B50 3A D0 88      [13]  610 	ld	a, (#_prota + 0)
   8B53 C6 03         [ 7]  611 	add	a, #0x03
   8B55 C5            [11]  612 	push	bc
   8B56 D5            [11]  613 	push	de
   8B57 33            [ 6]  614 	inc	sp
   8B58 F5            [11]  615 	push	af
   8B59 33            [ 6]  616 	inc	sp
   8B5A CD F0 89      [17]  617 	call	_getTilePtr
   8B5D F1            [10]  618 	pop	af
   8B5E EB            [ 4]  619 	ex	de,hl
   8B5F C1            [10]  620 	pop	bc
                            621 ;src/main.c:174: *waistTile = 0;
   8B60 21 00 00      [10]  622 	ld	hl,#0x0000
   8B63 36 00         [10]  623 	ld	(hl),#0x00
                            624 ;src/main.c:176: }
   8B65                     625 00105$:
                            626 ;src/main.c:178: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   8B65 E1            [10]  627 	pop	hl
   8B66 E5            [11]  628 	push	hl
   8B67 6E            [ 7]  629 	ld	l,(hl)
   8B68 3E 02         [ 7]  630 	ld	a,#0x02
   8B6A 95            [ 4]  631 	sub	a, l
   8B6B 38 0E         [12]  632 	jr	C,00106$
   8B6D 1A            [ 7]  633 	ld	a,(de)
   8B6E 5F            [ 4]  634 	ld	e,a
   8B6F 3E 02         [ 7]  635 	ld	a,#0x02
   8B71 93            [ 4]  636 	sub	a, e
   8B72 38 07         [12]  637 	jr	C,00106$
   8B74 0A            [ 7]  638 	ld	a,(bc)
   8B75 4F            [ 4]  639 	ld	c,a
   8B76 3E 02         [ 7]  640 	ld	a,#0x02
   8B78 91            [ 4]  641 	sub	a, c
   8B79 30 04         [12]  642 	jr	NC,00107$
   8B7B                     643 00106$:
                            644 ;src/main.c:179: return 1;
   8B7B 2E 01         [ 7]  645 	ld	l,#0x01
   8B7D 18 02         [12]  646 	jr	00110$
   8B7F                     647 00107$:
                            648 ;src/main.c:181: return 0;
   8B7F 2E 00         [ 7]  649 	ld	l,#0x00
   8B81                     650 00110$:
   8B81 DD F9         [10]  651 	ld	sp, ix
   8B83 DD E1         [14]  652 	pop	ix
   8B85 C9            [10]  653 	ret
                            654 ;src/main.c:184: void dibujarEnemigo(TEnemy *enemy) {
                            655 ;	---------------------------------
                            656 ; Function dibujarEnemigo
                            657 ; ---------------------------------
   8B86                     658 _dibujarEnemigo::
   8B86 DD E5         [15]  659 	push	ix
   8B88 DD 21 00 00   [14]  660 	ld	ix,#0
   8B8C DD 39         [15]  661 	add	ix,sp
                            662 ;src/main.c:185: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   8B8E DD 4E 04      [19]  663 	ld	c,4 (ix)
   8B91 DD 46 05      [19]  664 	ld	b,5 (ix)
   8B94 69            [ 4]  665 	ld	l, c
   8B95 60            [ 4]  666 	ld	h, b
   8B96 23            [ 6]  667 	inc	hl
   8B97 56            [ 7]  668 	ld	d,(hl)
   8B98 0A            [ 7]  669 	ld	a,(bc)
   8B99 C5            [11]  670 	push	bc
   8B9A D5            [11]  671 	push	de
   8B9B 33            [ 6]  672 	inc	sp
   8B9C F5            [11]  673 	push	af
   8B9D 33            [ 6]  674 	inc	sp
   8B9E 21 00 C0      [10]  675 	ld	hl,#0xC000
   8BA1 E5            [11]  676 	push	hl
   8BA2 CD 3F 88      [17]  677 	call	_cpct_getScreenPtr
   8BA5 EB            [ 4]  678 	ex	de,hl
                            679 ;src/main.c:186: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   8BA6 E1            [10]  680 	pop	hl
   8BA7 01 04 00      [10]  681 	ld	bc, #0x0004
   8BAA 09            [11]  682 	add	hl, bc
   8BAB 4E            [ 7]  683 	ld	c,(hl)
   8BAC 23            [ 6]  684 	inc	hl
   8BAD 46            [ 7]  685 	ld	b,(hl)
   8BAE 21 00 3E      [10]  686 	ld	hl,#_g_tablatrans
   8BB1 E5            [11]  687 	push	hl
   8BB2 21 04 16      [10]  688 	ld	hl,#0x1604
   8BB5 E5            [11]  689 	push	hl
   8BB6 D5            [11]  690 	push	de
   8BB7 C5            [11]  691 	push	bc
   8BB8 CD 5F 88      [17]  692 	call	_cpct_drawSpriteMaskedAlignedTable
   8BBB DD E1         [14]  693 	pop	ix
   8BBD C9            [10]  694 	ret
                            695 ;src/main.c:189: void dibujarExplosion(TEnemy *enemy) {
                            696 ;	---------------------------------
                            697 ; Function dibujarExplosion
                            698 ; ---------------------------------
   8BBE                     699 _dibujarExplosion::
   8BBE DD E5         [15]  700 	push	ix
   8BC0 DD 21 00 00   [14]  701 	ld	ix,#0
   8BC4 DD 39         [15]  702 	add	ix,sp
                            703 ;src/main.c:190: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   8BC6 DD 4E 04      [19]  704 	ld	c,4 (ix)
   8BC9 DD 46 05      [19]  705 	ld	b,5 (ix)
   8BCC 69            [ 4]  706 	ld	l, c
   8BCD 60            [ 4]  707 	ld	h, b
   8BCE 23            [ 6]  708 	inc	hl
   8BCF 56            [ 7]  709 	ld	d,(hl)
   8BD0 0A            [ 7]  710 	ld	a,(bc)
   8BD1 47            [ 4]  711 	ld	b,a
   8BD2 D5            [11]  712 	push	de
   8BD3 33            [ 6]  713 	inc	sp
   8BD4 C5            [11]  714 	push	bc
   8BD5 33            [ 6]  715 	inc	sp
   8BD6 21 00 C0      [10]  716 	ld	hl,#0xC000
   8BD9 E5            [11]  717 	push	hl
   8BDA CD 3F 88      [17]  718 	call	_cpct_getScreenPtr
   8BDD 4D            [ 4]  719 	ld	c,l
   8BDE 44            [ 4]  720 	ld	b,h
                            721 ;src/main.c:191: cpct_drawSpriteMaskedAlignedTable (g_explosion, pvmem, G_EXPLOSION_W, G_EXPLOSION_H, g_tablatrans);
   8BDF 11 00 3E      [10]  722 	ld	de,#_g_tablatrans+0
   8BE2 D5            [11]  723 	push	de
   8BE3 21 04 16      [10]  724 	ld	hl,#0x1604
   8BE6 E5            [11]  725 	push	hl
   8BE7 C5            [11]  726 	push	bc
   8BE8 21 A8 55      [10]  727 	ld	hl,#_g_explosion
   8BEB E5            [11]  728 	push	hl
   8BEC CD 5F 88      [17]  729 	call	_cpct_drawSpriteMaskedAlignedTable
   8BEF DD E1         [14]  730 	pop	ix
   8BF1 C9            [10]  731 	ret
                            732 ;src/main.c:194: void borrarExplosion() {
                            733 ;	---------------------------------
                            734 ; Function borrarExplosion
                            735 ; ---------------------------------
   8BF2                     736 _borrarExplosion::
   8BF2 DD E5         [15]  737 	push	ix
   8BF4 DD 21 00 00   [14]  738 	ld	ix,#0
   8BF8 DD 39         [15]  739 	add	ix,sp
   8BFA F5            [11]  740 	push	af
   8BFB 3B            [ 6]  741 	dec	sp
                            742 ;src/main.c:195: u8 w = 4 + (enemy->px & 1);
   8BFC 21 9E 88      [10]  743 	ld	hl, #_enemy + 2
   8BFF 4E            [ 7]  744 	ld	c,(hl)
   8C00 79            [ 4]  745 	ld	a,c
   8C01 E6 01         [ 7]  746 	and	a, #0x01
   8C03 47            [ 4]  747 	ld	b,a
   8C04 04            [ 4]  748 	inc	b
   8C05 04            [ 4]  749 	inc	b
   8C06 04            [ 4]  750 	inc	b
   8C07 04            [ 4]  751 	inc	b
                            752 ;src/main.c:198: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   8C08 21 9F 88      [10]  753 	ld	hl, #_enemy + 3
   8C0B 5E            [ 7]  754 	ld	e,(hl)
   8C0C CB 4B         [ 8]  755 	bit	1, e
   8C0E 28 04         [12]  756 	jr	Z,00103$
   8C10 3E 01         [ 7]  757 	ld	a,#0x01
   8C12 18 02         [12]  758 	jr	00104$
   8C14                     759 00103$:
   8C14 3E 00         [ 7]  760 	ld	a,#0x00
   8C16                     761 00104$:
   8C16 C6 07         [ 7]  762 	add	a, #0x07
   8C18 DD 77 FD      [19]  763 	ld	-3 (ix),a
                            764 ;src/main.c:200: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   8C1B FD 2A E2 88   [20]  765 	ld	iy,(_mapa)
   8C1F 16 00         [ 7]  766 	ld	d,#0x00
   8C21 7B            [ 4]  767 	ld	a,e
   8C22 C6 E8         [ 7]  768 	add	a,#0xE8
   8C24 DD 77 FE      [19]  769 	ld	-2 (ix),a
   8C27 7A            [ 4]  770 	ld	a,d
   8C28 CE FF         [ 7]  771 	adc	a,#0xFF
   8C2A DD 77 FF      [19]  772 	ld	-1 (ix),a
   8C2D DD 6E FE      [19]  773 	ld	l,-2 (ix)
   8C30 DD 66 FF      [19]  774 	ld	h,-1 (ix)
   8C33 DD CB FF 7E   [20]  775 	bit	7, -1 (ix)
   8C37 28 04         [12]  776 	jr	Z,00105$
   8C39 21 EB FF      [10]  777 	ld	hl,#0xFFEB
   8C3C 19            [11]  778 	add	hl,de
   8C3D                     779 00105$:
   8C3D CB 2C         [ 8]  780 	sra	h
   8C3F CB 1D         [ 8]  781 	rr	l
   8C41 CB 2C         [ 8]  782 	sra	h
   8C43 CB 1D         [ 8]  783 	rr	l
   8C45 55            [ 4]  784 	ld	d,l
   8C46 CB 39         [ 8]  785 	srl	c
   8C48 FD E5         [15]  786 	push	iy
   8C4A 21 F0 C0      [10]  787 	ld	hl,#0xC0F0
   8C4D E5            [11]  788 	push	hl
   8C4E 3E 28         [ 7]  789 	ld	a,#0x28
   8C50 F5            [11]  790 	push	af
   8C51 33            [ 6]  791 	inc	sp
   8C52 DD 7E FD      [19]  792 	ld	a,-3 (ix)
   8C55 F5            [11]  793 	push	af
   8C56 33            [ 6]  794 	inc	sp
   8C57 C5            [11]  795 	push	bc
   8C58 33            [ 6]  796 	inc	sp
   8C59 D5            [11]  797 	push	de
   8C5A 33            [ 6]  798 	inc	sp
   8C5B 79            [ 4]  799 	ld	a,c
   8C5C F5            [11]  800 	push	af
   8C5D 33            [ 6]  801 	inc	sp
   8C5E CD 38 7D      [17]  802 	call	_cpct_etm_drawTileBox2x4
   8C61 DD F9         [10]  803 	ld	sp, ix
   8C63 DD E1         [14]  804 	pop	ix
   8C65 C9            [10]  805 	ret
                            806 ;src/main.c:204: void borrarEnemigo(TEnemy *enemy) {
                            807 ;	---------------------------------
                            808 ; Function borrarEnemigo
                            809 ; ---------------------------------
   8C66                     810 _borrarEnemigo::
   8C66 DD E5         [15]  811 	push	ix
   8C68 DD 21 00 00   [14]  812 	ld	ix,#0
   8C6C DD 39         [15]  813 	add	ix,sp
   8C6E 21 FA FF      [10]  814 	ld	hl,#-6
   8C71 39            [11]  815 	add	hl,sp
   8C72 F9            [ 6]  816 	ld	sp,hl
                            817 ;src/main.c:206: u8 w = 4 + (enemy->px & 1);
   8C73 DD 4E 04      [19]  818 	ld	c,4 (ix)
   8C76 DD 46 05      [19]  819 	ld	b,5 (ix)
   8C79 69            [ 4]  820 	ld	l, c
   8C7A 60            [ 4]  821 	ld	h, b
   8C7B 23            [ 6]  822 	inc	hl
   8C7C 23            [ 6]  823 	inc	hl
   8C7D 5E            [ 7]  824 	ld	e,(hl)
   8C7E 7B            [ 4]  825 	ld	a,e
   8C7F E6 01         [ 7]  826 	and	a, #0x01
   8C81 C6 04         [ 7]  827 	add	a, #0x04
   8C83 DD 77 FA      [19]  828 	ld	-6 (ix),a
                            829 ;src/main.c:209: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   8C86 69            [ 4]  830 	ld	l, c
   8C87 60            [ 4]  831 	ld	h, b
   8C88 23            [ 6]  832 	inc	hl
   8C89 23            [ 6]  833 	inc	hl
   8C8A 23            [ 6]  834 	inc	hl
   8C8B 56            [ 7]  835 	ld	d,(hl)
   8C8C CB 4A         [ 8]  836 	bit	1, d
   8C8E 28 04         [12]  837 	jr	Z,00103$
   8C90 3E 01         [ 7]  838 	ld	a,#0x01
   8C92 18 02         [12]  839 	jr	00104$
   8C94                     840 00103$:
   8C94 3E 00         [ 7]  841 	ld	a,#0x00
   8C96                     842 00104$:
   8C96 C6 07         [ 7]  843 	add	a, #0x07
   8C98 DD 77 FB      [19]  844 	ld	-5 (ix),a
                            845 ;src/main.c:211: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   8C9B FD 2A E2 88   [20]  846 	ld	iy,(_mapa)
   8C9F DD 72 FE      [19]  847 	ld	-2 (ix),d
   8CA2 DD 36 FF 00   [19]  848 	ld	-1 (ix),#0x00
   8CA6 DD 7E FE      [19]  849 	ld	a,-2 (ix)
   8CA9 C6 E8         [ 7]  850 	add	a,#0xE8
   8CAB DD 77 FC      [19]  851 	ld	-4 (ix),a
   8CAE DD 7E FF      [19]  852 	ld	a,-1 (ix)
   8CB1 CE FF         [ 7]  853 	adc	a,#0xFF
   8CB3 DD 77 FD      [19]  854 	ld	-3 (ix),a
   8CB6 DD 56 FC      [19]  855 	ld	d,-4 (ix)
   8CB9 DD 6E FD      [19]  856 	ld	l,-3 (ix)
   8CBC DD CB FD 7E   [20]  857 	bit	7, -3 (ix)
   8CC0 28 0C         [12]  858 	jr	Z,00105$
   8CC2 DD 7E FE      [19]  859 	ld	a,-2 (ix)
   8CC5 C6 EB         [ 7]  860 	add	a, #0xEB
   8CC7 57            [ 4]  861 	ld	d,a
   8CC8 DD 7E FF      [19]  862 	ld	a,-1 (ix)
   8CCB CE FF         [ 7]  863 	adc	a, #0xFF
   8CCD 6F            [ 4]  864 	ld	l,a
   8CCE                     865 00105$:
   8CCE CB 2D         [ 8]  866 	sra	l
   8CD0 CB 1A         [ 8]  867 	rr	d
   8CD2 CB 2D         [ 8]  868 	sra	l
   8CD4 CB 1A         [ 8]  869 	rr	d
   8CD6 CB 3B         [ 8]  870 	srl	e
   8CD8 C5            [11]  871 	push	bc
   8CD9 FD E5         [15]  872 	push	iy
   8CDB 21 F0 C0      [10]  873 	ld	hl,#0xC0F0
   8CDE E5            [11]  874 	push	hl
   8CDF 3E 28         [ 7]  875 	ld	a,#0x28
   8CE1 F5            [11]  876 	push	af
   8CE2 33            [ 6]  877 	inc	sp
   8CE3 DD 66 FB      [19]  878 	ld	h,-5 (ix)
   8CE6 DD 6E FA      [19]  879 	ld	l,-6 (ix)
   8CE9 E5            [11]  880 	push	hl
   8CEA D5            [11]  881 	push	de
   8CEB CD 38 7D      [17]  882 	call	_cpct_etm_drawTileBox2x4
   8CEE C1            [10]  883 	pop	bc
                            884 ;src/main.c:213: enemy->mover = NO;
   8CEF 21 06 00      [10]  885 	ld	hl,#0x0006
   8CF2 09            [11]  886 	add	hl,bc
   8CF3 36 00         [10]  887 	ld	(hl),#0x00
   8CF5 DD F9         [10]  888 	ld	sp, ix
   8CF7 DD E1         [14]  889 	pop	ix
   8CF9 C9            [10]  890 	ret
                            891 ;src/main.c:216: void redibujarEnemigo(TEnemy *enemy) {
                            892 ;	---------------------------------
                            893 ; Function redibujarEnemigo
                            894 ; ---------------------------------
   8CFA                     895 _redibujarEnemigo::
   8CFA DD E5         [15]  896 	push	ix
   8CFC DD 21 00 00   [14]  897 	ld	ix,#0
   8D00 DD 39         [15]  898 	add	ix,sp
                            899 ;src/main.c:217: borrarEnemigo(enemy);
   8D02 DD 6E 04      [19]  900 	ld	l,4 (ix)
   8D05 DD 66 05      [19]  901 	ld	h,5 (ix)
   8D08 E5            [11]  902 	push	hl
   8D09 CD 66 8C      [17]  903 	call	_borrarEnemigo
   8D0C F1            [10]  904 	pop	af
                            905 ;src/main.c:218: enemy->px = enemy->x;
   8D0D DD 4E 04      [19]  906 	ld	c,4 (ix)
   8D10 DD 46 05      [19]  907 	ld	b,5 (ix)
   8D13 59            [ 4]  908 	ld	e, c
   8D14 50            [ 4]  909 	ld	d, b
   8D15 13            [ 6]  910 	inc	de
   8D16 13            [ 6]  911 	inc	de
   8D17 0A            [ 7]  912 	ld	a,(bc)
   8D18 12            [ 7]  913 	ld	(de),a
                            914 ;src/main.c:219: enemy->py = enemy->y;
   8D19 59            [ 4]  915 	ld	e, c
   8D1A 50            [ 4]  916 	ld	d, b
   8D1B 13            [ 6]  917 	inc	de
   8D1C 13            [ 6]  918 	inc	de
   8D1D 13            [ 6]  919 	inc	de
   8D1E 69            [ 4]  920 	ld	l, c
   8D1F 60            [ 4]  921 	ld	h, b
   8D20 23            [ 6]  922 	inc	hl
   8D21 7E            [ 7]  923 	ld	a,(hl)
   8D22 12            [ 7]  924 	ld	(de),a
                            925 ;src/main.c:220: dibujarEnemigo(enemy);
   8D23 C5            [11]  926 	push	bc
   8D24 CD 86 8B      [17]  927 	call	_dibujarEnemigo
   8D27 F1            [10]  928 	pop	af
   8D28 DD E1         [14]  929 	pop	ix
   8D2A C9            [10]  930 	ret
                            931 ;src/main.c:223: u8 checkEnemyCollision(int direction, TEnemy *enemy){
                            932 ;	---------------------------------
                            933 ; Function checkEnemyCollision
                            934 ; ---------------------------------
   8D2B                     935 _checkEnemyCollision::
   8D2B DD E5         [15]  936 	push	ix
   8D2D DD 21 00 00   [14]  937 	ld	ix,#0
   8D31 DD 39         [15]  938 	add	ix,sp
   8D33 21 F7 FF      [10]  939 	ld	hl,#-9
   8D36 39            [11]  940 	add	hl,sp
   8D37 F9            [ 6]  941 	ld	sp,hl
                            942 ;src/main.c:225: u8 colisiona = 1;
   8D38 DD 36 F7 01   [19]  943 	ld	-9 (ix),#0x01
                            944 ;src/main.c:227: switch (direction) {
   8D3C DD CB 05 7E   [20]  945 	bit	7, 5 (ix)
   8D40 C2 F3 90      [10]  946 	jp	NZ,00165$
   8D43 3E 03         [ 7]  947 	ld	a,#0x03
   8D45 DD BE 04      [19]  948 	cp	a, 4 (ix)
   8D48 3E 00         [ 7]  949 	ld	a,#0x00
   8D4A DD 9E 05      [19]  950 	sbc	a, 5 (ix)
   8D4D E2 52 8D      [10]  951 	jp	PO, 00272$
   8D50 EE 80         [ 7]  952 	xor	a, #0x80
   8D52                     953 00272$:
   8D52 FA F3 90      [10]  954 	jp	M,00165$
                            955 ;src/main.c:229: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   8D55 DD 4E 06      [19]  956 	ld	c,6 (ix)
   8D58 DD 46 07      [19]  957 	ld	b,7 (ix)
   8D5B 0A            [ 7]  958 	ld	a,(bc)
   8D5C 5F            [ 4]  959 	ld	e,a
   8D5D 21 01 00      [10]  960 	ld	hl,#0x0001
   8D60 09            [11]  961 	add	hl,bc
   8D61 DD 75 F8      [19]  962 	ld	-8 (ix),l
   8D64 DD 74 F9      [19]  963 	ld	-7 (ix),h
   8D67 DD 6E F8      [19]  964 	ld	l,-8 (ix)
   8D6A DD 66 F9      [19]  965 	ld	h,-7 (ix)
   8D6D 56            [ 7]  966 	ld	d,(hl)
                            967 ;src/main.c:242: enemy->muerto = SI;
   8D6E 21 08 00      [10]  968 	ld	hl,#0x0008
   8D71 09            [11]  969 	add	hl,bc
   8D72 DD 75 FA      [19]  970 	ld	-6 (ix),l
   8D75 DD 74 FB      [19]  971 	ld	-5 (ix),h
                            972 ;src/main.c:249: enemy->mira = M_izquierda;
   8D78 21 07 00      [10]  973 	ld	hl,#0x0007
   8D7B 09            [11]  974 	add	hl,bc
   8D7C DD 75 FC      [19]  975 	ld	-4 (ix),l
   8D7F DD 74 FD      [19]  976 	ld	-3 (ix),h
                            977 ;src/main.c:227: switch (direction) {
   8D82 D5            [11]  978 	push	de
   8D83 DD 5E 04      [19]  979 	ld	e,4 (ix)
   8D86 16 00         [ 7]  980 	ld	d,#0x00
   8D88 21 90 8D      [10]  981 	ld	hl,#00273$
   8D8B 19            [11]  982 	add	hl,de
   8D8C 19            [11]  983 	add	hl,de
   8D8D 19            [11]  984 	add	hl,de
   8D8E D1            [10]  985 	pop	de
   8D8F E9            [ 4]  986 	jp	(hl)
   8D90                     987 00273$:
   8D90 C3 9C 8D      [10]  988 	jp	00101$
   8D93 C3 75 8E      [10]  989 	jp	00117$
   8D96 C3 4A 8F      [10]  990 	jp	00133$
   8D99 C3 19 90      [10]  991 	jp	00149$
                            992 ;src/main.c:228: case 0:
   8D9C                     993 00101$:
                            994 ;src/main.c:229: if( *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y) <= 2
   8D9C 7B            [ 4]  995 	ld	a,e
   8D9D C6 05         [ 7]  996 	add	a, #0x05
   8D9F C5            [11]  997 	push	bc
   8DA0 D5            [11]  998 	push	de
   8DA1 33            [ 6]  999 	inc	sp
   8DA2 F5            [11] 1000 	push	af
   8DA3 33            [ 6] 1001 	inc	sp
   8DA4 CD F0 89      [17] 1002 	call	_getTilePtr
   8DA7 F1            [10] 1003 	pop	af
   8DA8 C1            [10] 1004 	pop	bc
   8DA9 5E            [ 7] 1005 	ld	e,(hl)
   8DAA 3E 02         [ 7] 1006 	ld	a,#0x02
   8DAC 93            [ 4] 1007 	sub	a, e
   8DAD DA 6A 8E      [10] 1008 	jp	C,00113$
                           1009 ;src/main.c:230: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H/2) <= 2
   8DB0 DD 6E F8      [19] 1010 	ld	l,-8 (ix)
   8DB3 DD 66 F9      [19] 1011 	ld	h,-7 (ix)
   8DB6 7E            [ 7] 1012 	ld	a,(hl)
   8DB7 C6 0B         [ 7] 1013 	add	a, #0x0B
   8DB9 57            [ 4] 1014 	ld	d,a
   8DBA 0A            [ 7] 1015 	ld	a,(bc)
   8DBB C6 05         [ 7] 1016 	add	a, #0x05
   8DBD C5            [11] 1017 	push	bc
   8DBE D5            [11] 1018 	push	de
   8DBF 33            [ 6] 1019 	inc	sp
   8DC0 F5            [11] 1020 	push	af
   8DC1 33            [ 6] 1021 	inc	sp
   8DC2 CD F0 89      [17] 1022 	call	_getTilePtr
   8DC5 F1            [10] 1023 	pop	af
   8DC6 C1            [10] 1024 	pop	bc
   8DC7 5E            [ 7] 1025 	ld	e,(hl)
   8DC8 3E 02         [ 7] 1026 	ld	a,#0x02
   8DCA 93            [ 4] 1027 	sub	a, e
   8DCB DA 6A 8E      [10] 1028 	jp	C,00113$
                           1029 ;src/main.c:231: && *getTilePtr(enemy->x + G_ENEMY_W + 1, enemy->y + G_ENEMY_H) <= 2)
   8DCE DD 6E F8      [19] 1030 	ld	l,-8 (ix)
   8DD1 DD 66 F9      [19] 1031 	ld	h,-7 (ix)
   8DD4 7E            [ 7] 1032 	ld	a,(hl)
   8DD5 C6 16         [ 7] 1033 	add	a, #0x16
   8DD7 57            [ 4] 1034 	ld	d,a
   8DD8 0A            [ 7] 1035 	ld	a,(bc)
   8DD9 C6 05         [ 7] 1036 	add	a, #0x05
   8DDB C5            [11] 1037 	push	bc
   8DDC D5            [11] 1038 	push	de
   8DDD 33            [ 6] 1039 	inc	sp
   8DDE F5            [11] 1040 	push	af
   8DDF 33            [ 6] 1041 	inc	sp
   8DE0 CD F0 89      [17] 1042 	call	_getTilePtr
   8DE3 F1            [10] 1043 	pop	af
   8DE4 C1            [10] 1044 	pop	bc
   8DE5 5E            [ 7] 1045 	ld	e,(hl)
   8DE6 3E 02         [ 7] 1046 	ld	a,#0x02
   8DE8 93            [ 4] 1047 	sub	a, e
   8DE9 DA 6A 8E      [10] 1048 	jp	C,00113$
                           1049 ;src/main.c:233: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   8DEC 21 D9 88      [10] 1050 	ld	hl, #_cu + 1
   8DEF 5E            [ 7] 1051 	ld	e,(hl)
   8DF0 16 00         [ 7] 1052 	ld	d,#0x00
   8DF2 21 04 00      [10] 1053 	ld	hl,#0x0004
   8DF5 19            [11] 1054 	add	hl,de
   8DF6 DD 75 FE      [19] 1055 	ld	-2 (ix),l
   8DF9 DD 74 FF      [19] 1056 	ld	-1 (ix),h
   8DFC DD 6E F8      [19] 1057 	ld	l,-8 (ix)
   8DFF DD 66 F9      [19] 1058 	ld	h,-7 (ix)
   8E02 6E            [ 7] 1059 	ld	l,(hl)
   8E03 26 00         [ 7] 1060 	ld	h,#0x00
   8E05 DD 7E FE      [19] 1061 	ld	a,-2 (ix)
   8E08 95            [ 4] 1062 	sub	a, l
   8E09 DD 7E FF      [19] 1063 	ld	a,-1 (ix)
   8E0C 9C            [ 4] 1064 	sbc	a, h
   8E0D E2 12 8E      [10] 1065 	jp	PO, 00274$
   8E10 EE 80         [ 7] 1066 	xor	a, #0x80
   8E12                    1067 00274$:
   8E12 FA 27 8E      [10] 1068 	jp	M,00108$
   8E15 D5            [11] 1069 	push	de
   8E16 11 16 00      [10] 1070 	ld	de,#0x0016
   8E19 19            [11] 1071 	add	hl, de
   8E1A D1            [10] 1072 	pop	de
   8E1B 7D            [ 4] 1073 	ld	a,l
   8E1C 93            [ 4] 1074 	sub	a, e
   8E1D 7C            [ 4] 1075 	ld	a,h
   8E1E 9A            [ 4] 1076 	sbc	a, d
   8E1F E2 24 8E      [10] 1077 	jp	PO, 00275$
   8E22 EE 80         [ 7] 1078 	xor	a, #0x80
   8E24                    1079 00275$:
   8E24 F2 2E 8E      [10] 1080 	jp	P,00109$
   8E27                    1081 00108$:
                           1082 ;src/main.c:234: colisiona = 0;
   8E27 DD 36 F7 00   [19] 1083 	ld	-9 (ix),#0x00
   8E2B C3 F3 90      [10] 1084 	jp	00165$
   8E2E                    1085 00109$:
                           1086 ;src/main.c:237: if(cu.x > enemy->x){ //si el cu esta abajo
   8E2E 21 D8 88      [10] 1087 	ld	hl, #_cu + 0
   8E31 5E            [ 7] 1088 	ld	e,(hl)
   8E32 0A            [ 7] 1089 	ld	a,(bc)
   8E33 4F            [ 4] 1090 	ld	c,a
   8E34 93            [ 4] 1091 	sub	a, e
   8E35 30 2C         [12] 1092 	jr	NC,00106$
                           1093 ;src/main.c:238: if( cu.x - (enemy->x + G_ENEMY_W) > 1){ // si hay espacio entre el enemigo y el cu
   8E37 6B            [ 4] 1094 	ld	l,e
   8E38 26 00         [ 7] 1095 	ld	h,#0x00
   8E3A 06 00         [ 7] 1096 	ld	b,#0x00
   8E3C 03            [ 6] 1097 	inc	bc
   8E3D 03            [ 6] 1098 	inc	bc
   8E3E 03            [ 6] 1099 	inc	bc
   8E3F 03            [ 6] 1100 	inc	bc
   8E40 BF            [ 4] 1101 	cp	a, a
   8E41 ED 42         [15] 1102 	sbc	hl, bc
   8E43 3E 01         [ 7] 1103 	ld	a,#0x01
   8E45 BD            [ 4] 1104 	cp	a, l
   8E46 3E 00         [ 7] 1105 	ld	a,#0x00
   8E48 9C            [ 4] 1106 	sbc	a, h
   8E49 E2 4E 8E      [10] 1107 	jp	PO, 00276$
   8E4C EE 80         [ 7] 1108 	xor	a, #0x80
   8E4E                    1109 00276$:
   8E4E F2 58 8E      [10] 1110 	jp	P,00103$
                           1111 ;src/main.c:239: colisiona = 0;
   8E51 DD 36 F7 00   [19] 1112 	ld	-9 (ix),#0x00
   8E55 C3 F3 90      [10] 1113 	jp	00165$
   8E58                    1114 00103$:
                           1115 ;src/main.c:242: enemy->muerto = SI;
   8E58 DD 6E FA      [19] 1116 	ld	l,-6 (ix)
   8E5B DD 66 FB      [19] 1117 	ld	h,-5 (ix)
   8E5E 36 01         [10] 1118 	ld	(hl),#0x01
   8E60 C3 F3 90      [10] 1119 	jp	00165$
   8E63                    1120 00106$:
                           1121 ;src/main.c:245: colisiona = 0;
   8E63 DD 36 F7 00   [19] 1122 	ld	-9 (ix),#0x00
   8E67 C3 F3 90      [10] 1123 	jp	00165$
   8E6A                    1124 00113$:
                           1125 ;src/main.c:249: enemy->mira = M_izquierda;
   8E6A DD 6E FC      [19] 1126 	ld	l,-4 (ix)
   8E6D DD 66 FD      [19] 1127 	ld	h,-3 (ix)
   8E70 36 01         [10] 1128 	ld	(hl),#0x01
                           1129 ;src/main.c:251: break;
   8E72 C3 F3 90      [10] 1130 	jp	00165$
                           1131 ;src/main.c:252: case 1:
   8E75                    1132 00117$:
                           1133 ;src/main.c:253: if( *getTilePtr(enemy->x - 1, enemy->y) <= 2
   8E75 1D            [ 4] 1134 	dec	e
   8E76 C5            [11] 1135 	push	bc
   8E77 D5            [11] 1136 	push	de
   8E78 CD F0 89      [17] 1137 	call	_getTilePtr
   8E7B F1            [10] 1138 	pop	af
   8E7C C1            [10] 1139 	pop	bc
   8E7D 5E            [ 7] 1140 	ld	e,(hl)
   8E7E 3E 02         [ 7] 1141 	ld	a,#0x02
   8E80 93            [ 4] 1142 	sub	a, e
   8E81 DA 3F 8F      [10] 1143 	jp	C,00129$
                           1144 ;src/main.c:254: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H/2) <= 2
   8E84 DD 6E F8      [19] 1145 	ld	l,-8 (ix)
   8E87 DD 66 F9      [19] 1146 	ld	h,-7 (ix)
   8E8A 7E            [ 7] 1147 	ld	a,(hl)
   8E8B C6 0B         [ 7] 1148 	add	a, #0x0B
   8E8D 57            [ 4] 1149 	ld	d,a
   8E8E 0A            [ 7] 1150 	ld	a,(bc)
   8E8F C6 FF         [ 7] 1151 	add	a,#0xFF
   8E91 C5            [11] 1152 	push	bc
   8E92 D5            [11] 1153 	push	de
   8E93 33            [ 6] 1154 	inc	sp
   8E94 F5            [11] 1155 	push	af
   8E95 33            [ 6] 1156 	inc	sp
   8E96 CD F0 89      [17] 1157 	call	_getTilePtr
   8E99 F1            [10] 1158 	pop	af
   8E9A C1            [10] 1159 	pop	bc
   8E9B 5E            [ 7] 1160 	ld	e,(hl)
   8E9C 3E 02         [ 7] 1161 	ld	a,#0x02
   8E9E 93            [ 4] 1162 	sub	a, e
   8E9F DA 3F 8F      [10] 1163 	jp	C,00129$
                           1164 ;src/main.c:255: && *getTilePtr(enemy->x - 1, enemy->y + G_ENEMY_H) <= 2)
   8EA2 DD 6E F8      [19] 1165 	ld	l,-8 (ix)
   8EA5 DD 66 F9      [19] 1166 	ld	h,-7 (ix)
   8EA8 7E            [ 7] 1167 	ld	a,(hl)
   8EA9 C6 16         [ 7] 1168 	add	a, #0x16
   8EAB 57            [ 4] 1169 	ld	d,a
   8EAC 0A            [ 7] 1170 	ld	a,(bc)
   8EAD C6 FF         [ 7] 1171 	add	a,#0xFF
   8EAF C5            [11] 1172 	push	bc
   8EB0 D5            [11] 1173 	push	de
   8EB1 33            [ 6] 1174 	inc	sp
   8EB2 F5            [11] 1175 	push	af
   8EB3 33            [ 6] 1176 	inc	sp
   8EB4 CD F0 89      [17] 1177 	call	_getTilePtr
   8EB7 F1            [10] 1178 	pop	af
   8EB8 C1            [10] 1179 	pop	bc
   8EB9 5E            [ 7] 1180 	ld	e,(hl)
   8EBA 3E 02         [ 7] 1181 	ld	a,#0x02
   8EBC 93            [ 4] 1182 	sub	a, e
   8EBD DA 3F 8F      [10] 1183 	jp	C,00129$
                           1184 ;src/main.c:257: if( (cu.y + G_KNIFEX_0_H) < enemy->y || cu.y  > (enemy->y + G_ENEMY_H) ){
   8EC0 21 D9 88      [10] 1185 	ld	hl, #_cu + 1
   8EC3 5E            [ 7] 1186 	ld	e,(hl)
   8EC4 16 00         [ 7] 1187 	ld	d,#0x00
   8EC6 21 04 00      [10] 1188 	ld	hl,#0x0004
   8EC9 19            [11] 1189 	add	hl,de
   8ECA DD 75 FE      [19] 1190 	ld	-2 (ix),l
   8ECD DD 74 FF      [19] 1191 	ld	-1 (ix),h
   8ED0 DD 6E F8      [19] 1192 	ld	l,-8 (ix)
   8ED3 DD 66 F9      [19] 1193 	ld	h,-7 (ix)
   8ED6 6E            [ 7] 1194 	ld	l,(hl)
   8ED7 26 00         [ 7] 1195 	ld	h,#0x00
   8ED9 DD 7E FE      [19] 1196 	ld	a,-2 (ix)
   8EDC 95            [ 4] 1197 	sub	a, l
   8EDD DD 7E FF      [19] 1198 	ld	a,-1 (ix)
   8EE0 9C            [ 4] 1199 	sbc	a, h
   8EE1 E2 E6 8E      [10] 1200 	jp	PO, 00277$
   8EE4 EE 80         [ 7] 1201 	xor	a, #0x80
   8EE6                    1202 00277$:
   8EE6 FA FB 8E      [10] 1203 	jp	M,00124$
   8EE9 D5            [11] 1204 	push	de
   8EEA 11 16 00      [10] 1205 	ld	de,#0x0016
   8EED 19            [11] 1206 	add	hl, de
   8EEE D1            [10] 1207 	pop	de
   8EEF 7D            [ 4] 1208 	ld	a,l
   8EF0 93            [ 4] 1209 	sub	a, e
   8EF1 7C            [ 4] 1210 	ld	a,h
   8EF2 9A            [ 4] 1211 	sbc	a, d
   8EF3 E2 F8 8E      [10] 1212 	jp	PO, 00278$
   8EF6 EE 80         [ 7] 1213 	xor	a, #0x80
   8EF8                    1214 00278$:
   8EF8 F2 02 8F      [10] 1215 	jp	P,00125$
   8EFB                    1216 00124$:
                           1217 ;src/main.c:258: colisiona = 0;
   8EFB DD 36 F7 00   [19] 1218 	ld	-9 (ix),#0x00
   8EFF C3 F3 90      [10] 1219 	jp	00165$
   8F02                    1220 00125$:
                           1221 ;src/main.c:261: if(enemy->x > cu.x){ //si el cu esta abajo
   8F02 0A            [ 7] 1222 	ld	a,(bc)
   8F03 5F            [ 4] 1223 	ld	e,a
   8F04 21 D8 88      [10] 1224 	ld	hl, #_cu + 0
   8F07 4E            [ 7] 1225 	ld	c,(hl)
   8F08 79            [ 4] 1226 	ld	a,c
   8F09 93            [ 4] 1227 	sub	a, e
   8F0A 30 2C         [12] 1228 	jr	NC,00122$
                           1229 ;src/main.c:262: if( enemy->x - (cu.x + G_KNIFEX_0_W) > 1){ // si hay espacio entre el enemigo y el cu
   8F0C 6B            [ 4] 1230 	ld	l,e
   8F0D 26 00         [ 7] 1231 	ld	h,#0x00
   8F0F 06 00         [ 7] 1232 	ld	b,#0x00
   8F11 03            [ 6] 1233 	inc	bc
   8F12 03            [ 6] 1234 	inc	bc
   8F13 03            [ 6] 1235 	inc	bc
   8F14 03            [ 6] 1236 	inc	bc
   8F15 BF            [ 4] 1237 	cp	a, a
   8F16 ED 42         [15] 1238 	sbc	hl, bc
   8F18 3E 01         [ 7] 1239 	ld	a,#0x01
   8F1A BD            [ 4] 1240 	cp	a, l
   8F1B 3E 00         [ 7] 1241 	ld	a,#0x00
   8F1D 9C            [ 4] 1242 	sbc	a, h
   8F1E E2 23 8F      [10] 1243 	jp	PO, 00279$
   8F21 EE 80         [ 7] 1244 	xor	a, #0x80
   8F23                    1245 00279$:
   8F23 F2 2D 8F      [10] 1246 	jp	P,00119$
                           1247 ;src/main.c:263: colisiona = 0;
   8F26 DD 36 F7 00   [19] 1248 	ld	-9 (ix),#0x00
   8F2A C3 F3 90      [10] 1249 	jp	00165$
   8F2D                    1250 00119$:
                           1251 ;src/main.c:266: enemy->muerto = SI;
   8F2D DD 6E FA      [19] 1252 	ld	l,-6 (ix)
   8F30 DD 66 FB      [19] 1253 	ld	h,-5 (ix)
   8F33 36 01         [10] 1254 	ld	(hl),#0x01
   8F35 C3 F3 90      [10] 1255 	jp	00165$
   8F38                    1256 00122$:
                           1257 ;src/main.c:269: colisiona = 0;
   8F38 DD 36 F7 00   [19] 1258 	ld	-9 (ix),#0x00
   8F3C C3 F3 90      [10] 1259 	jp	00165$
   8F3F                    1260 00129$:
                           1261 ;src/main.c:273: enemy->mira = M_derecha;
   8F3F DD 6E FC      [19] 1262 	ld	l,-4 (ix)
   8F42 DD 66 FD      [19] 1263 	ld	h,-3 (ix)
   8F45 36 00         [10] 1264 	ld	(hl),#0x00
                           1265 ;src/main.c:275: break;
   8F47 C3 F3 90      [10] 1266 	jp	00165$
                           1267 ;src/main.c:276: case 2:
   8F4A                    1268 00133$:
                           1269 ;src/main.c:277: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   8F4A 15            [ 4] 1270 	dec	d
   8F4B 15            [ 4] 1271 	dec	d
   8F4C C5            [11] 1272 	push	bc
   8F4D D5            [11] 1273 	push	de
   8F4E CD F0 89      [17] 1274 	call	_getTilePtr
   8F51 F1            [10] 1275 	pop	af
   8F52 C1            [10] 1276 	pop	bc
   8F53 5E            [ 7] 1277 	ld	e,(hl)
   8F54 3E 02         [ 7] 1278 	ld	a,#0x02
   8F56 93            [ 4] 1279 	sub	a, e
   8F57 DA 11 90      [10] 1280 	jp	C,00145$
                           1281 ;src/main.c:278: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   8F5A DD 6E F8      [19] 1282 	ld	l,-8 (ix)
   8F5D DD 66 F9      [19] 1283 	ld	h,-7 (ix)
   8F60 56            [ 7] 1284 	ld	d,(hl)
   8F61 15            [ 4] 1285 	dec	d
   8F62 15            [ 4] 1286 	dec	d
   8F63 0A            [ 7] 1287 	ld	a,(bc)
   8F64 C6 02         [ 7] 1288 	add	a, #0x02
   8F66 C5            [11] 1289 	push	bc
   8F67 D5            [11] 1290 	push	de
   8F68 33            [ 6] 1291 	inc	sp
   8F69 F5            [11] 1292 	push	af
   8F6A 33            [ 6] 1293 	inc	sp
   8F6B CD F0 89      [17] 1294 	call	_getTilePtr
   8F6E F1            [10] 1295 	pop	af
   8F6F C1            [10] 1296 	pop	bc
   8F70 5E            [ 7] 1297 	ld	e,(hl)
   8F71 3E 02         [ 7] 1298 	ld	a,#0x02
   8F73 93            [ 4] 1299 	sub	a, e
   8F74 DA 11 90      [10] 1300 	jp	C,00145$
                           1301 ;src/main.c:279: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   8F77 DD 6E F8      [19] 1302 	ld	l,-8 (ix)
   8F7A DD 66 F9      [19] 1303 	ld	h,-7 (ix)
   8F7D 56            [ 7] 1304 	ld	d,(hl)
   8F7E 15            [ 4] 1305 	dec	d
   8F7F 15            [ 4] 1306 	dec	d
   8F80 0A            [ 7] 1307 	ld	a,(bc)
   8F81 C6 04         [ 7] 1308 	add	a, #0x04
   8F83 C5            [11] 1309 	push	bc
   8F84 D5            [11] 1310 	push	de
   8F85 33            [ 6] 1311 	inc	sp
   8F86 F5            [11] 1312 	push	af
   8F87 33            [ 6] 1313 	inc	sp
   8F88 CD F0 89      [17] 1314 	call	_getTilePtr
   8F8B F1            [10] 1315 	pop	af
   8F8C C1            [10] 1316 	pop	bc
   8F8D 5E            [ 7] 1317 	ld	e,(hl)
   8F8E 3E 02         [ 7] 1318 	ld	a,#0x02
   8F90 93            [ 4] 1319 	sub	a, e
   8F91 DA 11 90      [10] 1320 	jp	C,00145$
                           1321 ;src/main.c:281: if((cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W)){
   8F94 21 D8 88      [10] 1322 	ld	hl, #_cu + 0
   8F97 5E            [ 7] 1323 	ld	e,(hl)
   8F98 16 00         [ 7] 1324 	ld	d,#0x00
   8F9A 21 02 00      [10] 1325 	ld	hl,#0x0002
   8F9D 19            [11] 1326 	add	hl,de
   8F9E DD 75 FE      [19] 1327 	ld	-2 (ix),l
   8FA1 DD 74 FF      [19] 1328 	ld	-1 (ix),h
   8FA4 0A            [ 7] 1329 	ld	a,(bc)
   8FA5 6F            [ 4] 1330 	ld	l,a
   8FA6 26 00         [ 7] 1331 	ld	h,#0x00
   8FA8 DD 7E FE      [19] 1332 	ld	a,-2 (ix)
   8FAB 95            [ 4] 1333 	sub	a, l
   8FAC DD 7E FF      [19] 1334 	ld	a,-1 (ix)
   8FAF 9C            [ 4] 1335 	sbc	a, h
   8FB0 E2 B5 8F      [10] 1336 	jp	PO, 00280$
   8FB3 EE 80         [ 7] 1337 	xor	a, #0x80
   8FB5                    1338 00280$:
   8FB5 FA C8 8F      [10] 1339 	jp	M,00140$
   8FB8 23            [ 6] 1340 	inc	hl
   8FB9 23            [ 6] 1341 	inc	hl
   8FBA 23            [ 6] 1342 	inc	hl
   8FBB 23            [ 6] 1343 	inc	hl
   8FBC 7D            [ 4] 1344 	ld	a,l
   8FBD 93            [ 4] 1345 	sub	a, e
   8FBE 7C            [ 4] 1346 	ld	a,h
   8FBF 9A            [ 4] 1347 	sbc	a, d
   8FC0 E2 C5 8F      [10] 1348 	jp	PO, 00281$
   8FC3 EE 80         [ 7] 1349 	xor	a, #0x80
   8FC5                    1350 00281$:
   8FC5 F2 CE 8F      [10] 1351 	jp	P,00141$
   8FC8                    1352 00140$:
                           1353 ;src/main.c:283: colisiona = 0;
   8FC8 DD 36 F7 00   [19] 1354 	ld	-9 (ix),#0x00
   8FCC 18 4B         [12] 1355 	jr	00149$
   8FCE                    1356 00141$:
                           1357 ;src/main.c:286: if(enemy->y>cu.y){
   8FCE DD 6E F8      [19] 1358 	ld	l,-8 (ix)
   8FD1 DD 66 F9      [19] 1359 	ld	h,-7 (ix)
   8FD4 5E            [ 7] 1360 	ld	e,(hl)
   8FD5 21 D9 88      [10] 1361 	ld	hl, #(_cu + 0x0001) + 0
   8FD8 6E            [ 7] 1362 	ld	l,(hl)
   8FD9 7D            [ 4] 1363 	ld	a,l
   8FDA 93            [ 4] 1364 	sub	a, e
   8FDB 30 2E         [12] 1365 	jr	NC,00138$
                           1366 ;src/main.c:287: if(enemy->y - (cu.y + G_KNIFEY_0_H)  > 2){
   8FDD 16 00         [ 7] 1367 	ld	d,#0x00
   8FDF 26 00         [ 7] 1368 	ld	h,#0x00
   8FE1 D5            [11] 1369 	push	de
   8FE2 11 08 00      [10] 1370 	ld	de,#0x0008
   8FE5 19            [11] 1371 	add	hl, de
   8FE6 D1            [10] 1372 	pop	de
   8FE7 7B            [ 4] 1373 	ld	a,e
   8FE8 95            [ 4] 1374 	sub	a, l
   8FE9 5F            [ 4] 1375 	ld	e,a
   8FEA 7A            [ 4] 1376 	ld	a,d
   8FEB 9C            [ 4] 1377 	sbc	a, h
   8FEC 57            [ 4] 1378 	ld	d,a
   8FED 3E 02         [ 7] 1379 	ld	a,#0x02
   8FEF BB            [ 4] 1380 	cp	a, e
   8FF0 3E 00         [ 7] 1381 	ld	a,#0x00
   8FF2 9A            [ 4] 1382 	sbc	a, d
   8FF3 E2 F8 8F      [10] 1383 	jp	PO, 00282$
   8FF6 EE 80         [ 7] 1384 	xor	a, #0x80
   8FF8                    1385 00282$:
   8FF8 F2 01 90      [10] 1386 	jp	P,00135$
                           1387 ;src/main.c:288: colisiona = 0;
   8FFB DD 36 F7 00   [19] 1388 	ld	-9 (ix),#0x00
   8FFF 18 18         [12] 1389 	jr	00149$
   9001                    1390 00135$:
                           1391 ;src/main.c:291: enemy->muerto = SI;
   9001 DD 6E FA      [19] 1392 	ld	l,-6 (ix)
   9004 DD 66 FB      [19] 1393 	ld	h,-5 (ix)
   9007 36 01         [10] 1394 	ld	(hl),#0x01
   9009 18 0E         [12] 1395 	jr	00149$
   900B                    1396 00138$:
                           1397 ;src/main.c:295: colisiona = 0;
   900B DD 36 F7 00   [19] 1398 	ld	-9 (ix),#0x00
   900F 18 08         [12] 1399 	jr	00149$
   9011                    1400 00145$:
                           1401 ;src/main.c:301: enemy->mira = M_abajo;
   9011 DD 6E FC      [19] 1402 	ld	l,-4 (ix)
   9014 DD 66 FD      [19] 1403 	ld	h,-3 (ix)
   9017 36 03         [10] 1404 	ld	(hl),#0x03
                           1405 ;src/main.c:304: case 3:
   9019                    1406 00149$:
                           1407 ;src/main.c:307: if( *getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   9019 DD 6E F8      [19] 1408 	ld	l,-8 (ix)
   901C DD 66 F9      [19] 1409 	ld	h,-7 (ix)
   901F 7E            [ 7] 1410 	ld	a,(hl)
   9020 C6 18         [ 7] 1411 	add	a, #0x18
   9022 57            [ 4] 1412 	ld	d,a
   9023 0A            [ 7] 1413 	ld	a,(bc)
   9024 C5            [11] 1414 	push	bc
   9025 D5            [11] 1415 	push	de
   9026 33            [ 6] 1416 	inc	sp
   9027 F5            [11] 1417 	push	af
   9028 33            [ 6] 1418 	inc	sp
   9029 CD F0 89      [17] 1419 	call	_getTilePtr
   902C F1            [10] 1420 	pop	af
   902D C1            [10] 1421 	pop	bc
   902E 5E            [ 7] 1422 	ld	e,(hl)
   902F 3E 02         [ 7] 1423 	ld	a,#0x02
   9031 93            [ 4] 1424 	sub	a, e
   9032 DA EB 90      [10] 1425 	jp	C,00161$
                           1426 ;src/main.c:308: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   9035 DD 6E F8      [19] 1427 	ld	l,-8 (ix)
   9038 DD 66 F9      [19] 1428 	ld	h,-7 (ix)
   903B 7E            [ 7] 1429 	ld	a,(hl)
   903C C6 18         [ 7] 1430 	add	a, #0x18
   903E 57            [ 4] 1431 	ld	d,a
   903F 0A            [ 7] 1432 	ld	a,(bc)
   9040 C6 02         [ 7] 1433 	add	a, #0x02
   9042 C5            [11] 1434 	push	bc
   9043 D5            [11] 1435 	push	de
   9044 33            [ 6] 1436 	inc	sp
   9045 F5            [11] 1437 	push	af
   9046 33            [ 6] 1438 	inc	sp
   9047 CD F0 89      [17] 1439 	call	_getTilePtr
   904A F1            [10] 1440 	pop	af
   904B C1            [10] 1441 	pop	bc
   904C 5E            [ 7] 1442 	ld	e,(hl)
   904D 3E 02         [ 7] 1443 	ld	a,#0x02
   904F 93            [ 4] 1444 	sub	a, e
   9050 DA EB 90      [10] 1445 	jp	C,00161$
                           1446 ;src/main.c:309: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   9053 DD 6E F8      [19] 1447 	ld	l,-8 (ix)
   9056 DD 66 F9      [19] 1448 	ld	h,-7 (ix)
   9059 7E            [ 7] 1449 	ld	a,(hl)
   905A C6 18         [ 7] 1450 	add	a, #0x18
   905C 57            [ 4] 1451 	ld	d,a
   905D 0A            [ 7] 1452 	ld	a,(bc)
   905E C6 04         [ 7] 1453 	add	a, #0x04
   9060 C5            [11] 1454 	push	bc
   9061 D5            [11] 1455 	push	de
   9062 33            [ 6] 1456 	inc	sp
   9063 F5            [11] 1457 	push	af
   9064 33            [ 6] 1458 	inc	sp
   9065 CD F0 89      [17] 1459 	call	_getTilePtr
   9068 F1            [10] 1460 	pop	af
   9069 C1            [10] 1461 	pop	bc
   906A 5E            [ 7] 1462 	ld	e,(hl)
   906B 3E 02         [ 7] 1463 	ld	a,#0x02
   906D 93            [ 4] 1464 	sub	a, e
   906E 38 7B         [12] 1465 	jr	C,00161$
                           1466 ;src/main.c:311: if( (cu.x + G_KNIFEY_0_W) < enemy->x || cu.x  > (enemy->x + G_ENEMY_W) ){
   9070 21 D8 88      [10] 1467 	ld	hl, #_cu + 0
   9073 5E            [ 7] 1468 	ld	e,(hl)
   9074 16 00         [ 7] 1469 	ld	d,#0x00
   9076 21 02 00      [10] 1470 	ld	hl,#0x0002
   9079 19            [11] 1471 	add	hl,de
   907A DD 75 FE      [19] 1472 	ld	-2 (ix),l
   907D DD 74 FF      [19] 1473 	ld	-1 (ix),h
   9080 0A            [ 7] 1474 	ld	a,(bc)
   9081 4F            [ 4] 1475 	ld	c,a
   9082 06 00         [ 7] 1476 	ld	b,#0x00
   9084 DD 7E FE      [19] 1477 	ld	a,-2 (ix)
   9087 91            [ 4] 1478 	sub	a, c
   9088 DD 7E FF      [19] 1479 	ld	a,-1 (ix)
   908B 98            [ 4] 1480 	sbc	a, b
   908C E2 91 90      [10] 1481 	jp	PO, 00283$
   908F EE 80         [ 7] 1482 	xor	a, #0x80
   9091                    1483 00283$:
   9091 FA A4 90      [10] 1484 	jp	M,00156$
   9094 03            [ 6] 1485 	inc	bc
   9095 03            [ 6] 1486 	inc	bc
   9096 03            [ 6] 1487 	inc	bc
   9097 03            [ 6] 1488 	inc	bc
   9098 79            [ 4] 1489 	ld	a,c
   9099 93            [ 4] 1490 	sub	a, e
   909A 78            [ 4] 1491 	ld	a,b
   909B 9A            [ 4] 1492 	sbc	a, d
   909C E2 A1 90      [10] 1493 	jp	PO, 00284$
   909F EE 80         [ 7] 1494 	xor	a, #0x80
   90A1                    1495 00284$:
   90A1 F2 AA 90      [10] 1496 	jp	P,00157$
   90A4                    1497 00156$:
                           1498 ;src/main.c:312: colisiona = 0;
   90A4 DD 36 F7 00   [19] 1499 	ld	-9 (ix),#0x00
   90A8 18 49         [12] 1500 	jr	00165$
   90AA                    1501 00157$:
                           1502 ;src/main.c:315: if(cu.y > enemy->y){ //si el cu esta abajo
   90AA 21 D9 88      [10] 1503 	ld	hl, #(_cu + 0x0001) + 0
   90AD 4E            [ 7] 1504 	ld	c,(hl)
   90AE DD 6E F8      [19] 1505 	ld	l,-8 (ix)
   90B1 DD 66 F9      [19] 1506 	ld	h,-7 (ix)
   90B4 5E            [ 7] 1507 	ld	e,(hl)
   90B5 7B            [ 4] 1508 	ld	a,e
   90B6 91            [ 4] 1509 	sub	a, c
   90B7 30 2C         [12] 1510 	jr	NC,00154$
                           1511 ;src/main.c:316: if( cu.y - (enemy->y + G_ENEMY_H)  > 2){ // si hay espacio entre el enemigo y el cu
   90B9 06 00         [ 7] 1512 	ld	b,#0x00
   90BB 16 00         [ 7] 1513 	ld	d,#0x00
   90BD 21 16 00      [10] 1514 	ld	hl,#0x0016
   90C0 19            [11] 1515 	add	hl,de
   90C1 79            [ 4] 1516 	ld	a,c
   90C2 95            [ 4] 1517 	sub	a, l
   90C3 4F            [ 4] 1518 	ld	c,a
   90C4 78            [ 4] 1519 	ld	a,b
   90C5 9C            [ 4] 1520 	sbc	a, h
   90C6 47            [ 4] 1521 	ld	b,a
   90C7 3E 02         [ 7] 1522 	ld	a,#0x02
   90C9 B9            [ 4] 1523 	cp	a, c
   90CA 3E 00         [ 7] 1524 	ld	a,#0x00
   90CC 98            [ 4] 1525 	sbc	a, b
   90CD E2 D2 90      [10] 1526 	jp	PO, 00285$
   90D0 EE 80         [ 7] 1527 	xor	a, #0x80
   90D2                    1528 00285$:
   90D2 F2 DB 90      [10] 1529 	jp	P,00151$
                           1530 ;src/main.c:317: colisiona = 0;
   90D5 DD 36 F7 00   [19] 1531 	ld	-9 (ix),#0x00
   90D9 18 18         [12] 1532 	jr	00165$
   90DB                    1533 00151$:
                           1534 ;src/main.c:320: enemy->muerto = SI;
   90DB DD 6E FA      [19] 1535 	ld	l,-6 (ix)
   90DE DD 66 FB      [19] 1536 	ld	h,-5 (ix)
   90E1 36 01         [10] 1537 	ld	(hl),#0x01
   90E3 18 0E         [12] 1538 	jr	00165$
   90E5                    1539 00154$:
                           1540 ;src/main.c:324: colisiona = 0;
   90E5 DD 36 F7 00   [19] 1541 	ld	-9 (ix),#0x00
   90E9 18 08         [12] 1542 	jr	00165$
   90EB                    1543 00161$:
                           1544 ;src/main.c:328: enemy->mira = M_arriba;
   90EB DD 6E FC      [19] 1545 	ld	l,-4 (ix)
   90EE DD 66 FD      [19] 1546 	ld	h,-3 (ix)
   90F1 36 02         [10] 1547 	ld	(hl),#0x02
                           1548 ;src/main.c:331: }
   90F3                    1549 00165$:
                           1550 ;src/main.c:332: return colisiona;
   90F3 DD 6E F7      [19] 1551 	ld	l,-9 (ix)
   90F6 DD F9         [10] 1552 	ld	sp, ix
   90F8 DD E1         [14] 1553 	pop	ix
   90FA C9            [10] 1554 	ret
                           1555 ;src/main.c:335: void moverEnemigoArriba(TEnemy *enemy){
                           1556 ;	---------------------------------
                           1557 ; Function moverEnemigoArriba
                           1558 ; ---------------------------------
   90FB                    1559 _moverEnemigoArriba::
   90FB DD E5         [15] 1560 	push	ix
   90FD DD 21 00 00   [14] 1561 	ld	ix,#0
   9101 DD 39         [15] 1562 	add	ix,sp
                           1563 ;src/main.c:336: enemy->y--;
   9103 DD 4E 04      [19] 1564 	ld	c,4 (ix)
   9106 DD 46 05      [19] 1565 	ld	b,5 (ix)
   9109 69            [ 4] 1566 	ld	l, c
   910A 60            [ 4] 1567 	ld	h, b
   910B 23            [ 6] 1568 	inc	hl
   910C 5E            [ 7] 1569 	ld	e,(hl)
   910D 1D            [ 4] 1570 	dec	e
   910E 73            [ 7] 1571 	ld	(hl),e
                           1572 ;src/main.c:337: enemy->y--;
   910F 1D            [ 4] 1573 	dec	e
   9110 73            [ 7] 1574 	ld	(hl),e
                           1575 ;src/main.c:338: enemy->mover = SI;
   9111 21 06 00      [10] 1576 	ld	hl,#0x0006
   9114 09            [11] 1577 	add	hl,bc
   9115 36 01         [10] 1578 	ld	(hl),#0x01
   9117 DD E1         [14] 1579 	pop	ix
   9119 C9            [10] 1580 	ret
                           1581 ;src/main.c:341: void moverEnemigoAbajo(TEnemy *enemy){
                           1582 ;	---------------------------------
                           1583 ; Function moverEnemigoAbajo
                           1584 ; ---------------------------------
   911A                    1585 _moverEnemigoAbajo::
   911A DD E5         [15] 1586 	push	ix
   911C DD 21 00 00   [14] 1587 	ld	ix,#0
   9120 DD 39         [15] 1588 	add	ix,sp
                           1589 ;src/main.c:342: enemy->y++;
   9122 DD 4E 04      [19] 1590 	ld	c,4 (ix)
   9125 DD 46 05      [19] 1591 	ld	b,5 (ix)
   9128 59            [ 4] 1592 	ld	e, c
   9129 50            [ 4] 1593 	ld	d, b
   912A 13            [ 6] 1594 	inc	de
   912B 1A            [ 7] 1595 	ld	a,(de)
   912C 3C            [ 4] 1596 	inc	a
   912D 12            [ 7] 1597 	ld	(de),a
                           1598 ;src/main.c:343: enemy->y++;
   912E 3C            [ 4] 1599 	inc	a
   912F 12            [ 7] 1600 	ld	(de),a
                           1601 ;src/main.c:344: enemy->mover = SI;
   9130 21 06 00      [10] 1602 	ld	hl,#0x0006
   9133 09            [11] 1603 	add	hl,bc
   9134 36 01         [10] 1604 	ld	(hl),#0x01
   9136 DD E1         [14] 1605 	pop	ix
   9138 C9            [10] 1606 	ret
                           1607 ;src/main.c:347: void moverEnemigoDerecha(TEnemy *enemy){
                           1608 ;	---------------------------------
                           1609 ; Function moverEnemigoDerecha
                           1610 ; ---------------------------------
   9139                    1611 _moverEnemigoDerecha::
                           1612 ;src/main.c:348: enemy->x++;
   9139 D1            [10] 1613 	pop	de
   913A C1            [10] 1614 	pop	bc
   913B C5            [11] 1615 	push	bc
   913C D5            [11] 1616 	push	de
   913D 0A            [ 7] 1617 	ld	a,(bc)
   913E 3C            [ 4] 1618 	inc	a
   913F 02            [ 7] 1619 	ld	(bc),a
                           1620 ;src/main.c:349: enemy->x++;
   9140 3C            [ 4] 1621 	inc	a
   9141 02            [ 7] 1622 	ld	(bc),a
                           1623 ;src/main.c:350: enemy->mover = SI;
   9142 21 06 00      [10] 1624 	ld	hl,#0x0006
   9145 09            [11] 1625 	add	hl,bc
   9146 36 01         [10] 1626 	ld	(hl),#0x01
   9148 C9            [10] 1627 	ret
                           1628 ;src/main.c:353: void moverEnemigoIzquierda(TEnemy *enemy){
                           1629 ;	---------------------------------
                           1630 ; Function moverEnemigoIzquierda
                           1631 ; ---------------------------------
   9149                    1632 _moverEnemigoIzquierda::
                           1633 ;src/main.c:354: enemy->x--;
   9149 D1            [10] 1634 	pop	de
   914A C1            [10] 1635 	pop	bc
   914B C5            [11] 1636 	push	bc
   914C D5            [11] 1637 	push	de
   914D 0A            [ 7] 1638 	ld	a,(bc)
   914E C6 FF         [ 7] 1639 	add	a,#0xFF
   9150 02            [ 7] 1640 	ld	(bc),a
                           1641 ;src/main.c:355: enemy->x--;
   9151 C6 FF         [ 7] 1642 	add	a,#0xFF
   9153 02            [ 7] 1643 	ld	(bc),a
                           1644 ;src/main.c:356: enemy->mover = SI;
   9154 21 06 00      [10] 1645 	ld	hl,#0x0006
   9157 09            [11] 1646 	add	hl,bc
   9158 36 01         [10] 1647 	ld	(hl),#0x01
   915A C9            [10] 1648 	ret
                           1649 ;src/main.c:359: void moverEnemigo(TEnemy *enemy){
                           1650 ;	---------------------------------
                           1651 ; Function moverEnemigo
                           1652 ; ---------------------------------
   915B                    1653 _moverEnemigo::
   915B DD E5         [15] 1654 	push	ix
   915D DD 21 00 00   [14] 1655 	ld	ix,#0
   9161 DD 39         [15] 1656 	add	ix,sp
                           1657 ;src/main.c:360: if(!enemy->muerto){
   9163 DD 4E 04      [19] 1658 	ld	c,4 (ix)
   9166 DD 46 05      [19] 1659 	ld	b,5 (ix)
   9169 C5            [11] 1660 	push	bc
   916A FD E1         [14] 1661 	pop	iy
   916C FD 7E 08      [19] 1662 	ld	a,8 (iy)
   916F B7            [ 4] 1663 	or	a, a
   9170 20 46         [12] 1664 	jr	NZ,00110$
                           1665 ;src/main.c:361: if(!checkEnemyCollision(enemy->mira, enemy)){
   9172 21 07 00      [10] 1666 	ld	hl,#0x0007
   9175 09            [11] 1667 	add	hl,bc
   9176 5E            [ 7] 1668 	ld	e,(hl)
   9177 16 00         [ 7] 1669 	ld	d,#0x00
   9179 E5            [11] 1670 	push	hl
   917A C5            [11] 1671 	push	bc
   917B C5            [11] 1672 	push	bc
   917C D5            [11] 1673 	push	de
   917D CD 2B 8D      [17] 1674 	call	_checkEnemyCollision
   9180 F1            [10] 1675 	pop	af
   9181 F1            [10] 1676 	pop	af
   9182 7D            [ 4] 1677 	ld	a,l
   9183 C1            [10] 1678 	pop	bc
   9184 E1            [10] 1679 	pop	hl
   9185 B7            [ 4] 1680 	or	a, a
   9186 20 30         [12] 1681 	jr	NZ,00110$
                           1682 ;src/main.c:363: switch (enemy->mira) {
   9188 5E            [ 7] 1683 	ld	e,(hl)
   9189 3E 03         [ 7] 1684 	ld	a,#0x03
   918B 93            [ 4] 1685 	sub	a, e
   918C 38 2A         [12] 1686 	jr	C,00110$
   918E 16 00         [ 7] 1687 	ld	d,#0x00
   9190 21 96 91      [10] 1688 	ld	hl,#00124$
   9193 19            [11] 1689 	add	hl,de
   9194 19            [11] 1690 	add	hl,de
                           1691 ;src/main.c:365: case 0:
   9195 E9            [ 4] 1692 	jp	(hl)
   9196                    1693 00124$:
   9196 18 06         [12] 1694 	jr	00101$
   9198 18 0B         [12] 1695 	jr	00102$
   919A 18 10         [12] 1696 	jr	00103$
   919C 18 15         [12] 1697 	jr	00104$
   919E                    1698 00101$:
                           1699 ;src/main.c:366: moverEnemigoDerecha(enemy);
   919E C5            [11] 1700 	push	bc
   919F CD 39 91      [17] 1701 	call	_moverEnemigoDerecha
   91A2 F1            [10] 1702 	pop	af
                           1703 ;src/main.c:367: break;
   91A3 18 13         [12] 1704 	jr	00110$
                           1705 ;src/main.c:368: case 1:
   91A5                    1706 00102$:
                           1707 ;src/main.c:369: moverEnemigoIzquierda(enemy);
   91A5 C5            [11] 1708 	push	bc
   91A6 CD 49 91      [17] 1709 	call	_moverEnemigoIzquierda
   91A9 F1            [10] 1710 	pop	af
                           1711 ;src/main.c:370: break;
   91AA 18 0C         [12] 1712 	jr	00110$
                           1713 ;src/main.c:371: case 2:
   91AC                    1714 00103$:
                           1715 ;src/main.c:372: moverEnemigoArriba(enemy);
   91AC C5            [11] 1716 	push	bc
   91AD CD FB 90      [17] 1717 	call	_moverEnemigoArriba
   91B0 F1            [10] 1718 	pop	af
                           1719 ;src/main.c:373: break;
   91B1 18 05         [12] 1720 	jr	00110$
                           1721 ;src/main.c:374: case 3:
   91B3                    1722 00104$:
                           1723 ;src/main.c:375: moverEnemigoAbajo(enemy);
   91B3 C5            [11] 1724 	push	bc
   91B4 CD 1A 91      [17] 1725 	call	_moverEnemigoAbajo
   91B7 F1            [10] 1726 	pop	af
                           1727 ;src/main.c:377: }
   91B8                    1728 00110$:
   91B8 DD E1         [14] 1729 	pop	ix
   91BA C9            [10] 1730 	ret
                           1731 ;src/main.c:382: void avanzarMapa() {
                           1732 ;	---------------------------------
                           1733 ; Function avanzarMapa
                           1734 ; ---------------------------------
   91BB                    1735 _avanzarMapa::
                           1736 ;src/main.c:383: if(num_mapa < NUM_MAPAS -1) {
   91BB 3A E4 88      [13] 1737 	ld	a,(#_num_mapa + 0)
   91BE D6 02         [ 7] 1738 	sub	a, #0x02
   91C0 D2 A5 89      [10] 1739 	jp	NC,_menuFin
                           1740 ;src/main.c:384: mapa = mapas[++num_mapa];
   91C3 21 E4 88      [10] 1741 	ld	hl, #_num_mapa+0
   91C6 34            [11] 1742 	inc	(hl)
   91C7 FD 21 E4 88   [14] 1743 	ld	iy,#_num_mapa
   91CB FD 6E 00      [19] 1744 	ld	l,0 (iy)
   91CE 26 00         [ 7] 1745 	ld	h,#0x00
   91D0 29            [11] 1746 	add	hl, hl
   91D1 11 FB 88      [10] 1747 	ld	de,#_mapas
   91D4 19            [11] 1748 	add	hl,de
   91D5 7E            [ 7] 1749 	ld	a,(hl)
   91D6 FD 21 E2 88   [14] 1750 	ld	iy,#_mapa
   91DA FD 77 00      [19] 1751 	ld	0 (iy),a
   91DD 23            [ 6] 1752 	inc	hl
   91DE 7E            [ 7] 1753 	ld	a,(hl)
   91DF 32 E3 88      [13] 1754 	ld	(#_mapa + 1),a
                           1755 ;src/main.c:385: prota.x = prota.px = 2;
   91E2 21 D2 88      [10] 1756 	ld	hl,#(_prota + 0x0002)
   91E5 36 02         [10] 1757 	ld	(hl),#0x02
   91E7 21 D0 88      [10] 1758 	ld	hl,#_prota
   91EA 36 02         [10] 1759 	ld	(hl),#0x02
                           1760 ;src/main.c:386: prota.mover = SI;
   91EC 21 D6 88      [10] 1761 	ld	hl,#(_prota + 0x0006)
   91EF 36 01         [10] 1762 	ld	(hl),#0x01
                           1763 ;src/main.c:387: dibujarMapa();
   91F1 CD E5 88      [17] 1764 	call	_dibujarMapa
                           1765 ;src/main.c:388: inicializarEnemy();
   91F4 C3 4F 9A      [10] 1766 	jp  _inicializarEnemy
                           1767 ;src/main.c:392: menuFin();
   91F7 C3 A5 89      [10] 1768 	jp  _menuFin
                           1769 ;src/main.c:396: void moverIzquierda() {
                           1770 ;	---------------------------------
                           1771 ; Function moverIzquierda
                           1772 ; ---------------------------------
   91FA                    1773 _moverIzquierda::
                           1774 ;src/main.c:397: prota.mira = M_izquierda;
   91FA 01 D0 88      [10] 1775 	ld	bc,#_prota+0
   91FD 21 D7 88      [10] 1776 	ld	hl,#(_prota + 0x0007)
   9200 36 01         [10] 1777 	ld	(hl),#0x01
                           1778 ;src/main.c:398: if (!checkCollision(M_izquierda)) {
   9202 C5            [11] 1779 	push	bc
   9203 21 01 00      [10] 1780 	ld	hl,#0x0001
   9206 E5            [11] 1781 	push	hl
   9207 CD 31 8A      [17] 1782 	call	_checkCollision
   920A F1            [10] 1783 	pop	af
   920B C1            [10] 1784 	pop	bc
   920C 7D            [ 4] 1785 	ld	a,l
   920D B7            [ 4] 1786 	or	a, a
   920E C0            [11] 1787 	ret	NZ
                           1788 ;src/main.c:399: prota.x--;
   920F 0A            [ 7] 1789 	ld	a,(bc)
   9210 C6 FF         [ 7] 1790 	add	a,#0xFF
   9212 02            [ 7] 1791 	ld	(bc),a
                           1792 ;src/main.c:400: prota.mover = SI;
   9213 21 D6 88      [10] 1793 	ld	hl,#(_prota + 0x0006)
   9216 36 01         [10] 1794 	ld	(hl),#0x01
                           1795 ;src/main.c:401: prota.sprite = g_hero_left;
   9218 21 FE 79      [10] 1796 	ld	hl,#_g_hero_left
   921B 22 D4 88      [16] 1797 	ld	((_prota + 0x0004)), hl
   921E C9            [10] 1798 	ret
                           1799 ;src/main.c:405: void moverDerecha() {
                           1800 ;	---------------------------------
                           1801 ; Function moverDerecha
                           1802 ; ---------------------------------
   921F                    1803 _moverDerecha::
                           1804 ;src/main.c:406: prota.mira = M_derecha;
   921F 21 D7 88      [10] 1805 	ld	hl,#(_prota + 0x0007)
   9222 36 00         [10] 1806 	ld	(hl),#0x00
                           1807 ;src/main.c:407: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   9224 21 00 00      [10] 1808 	ld	hl,#0x0000
   9227 E5            [11] 1809 	push	hl
   9228 CD 31 8A      [17] 1810 	call	_checkCollision
   922B F1            [10] 1811 	pop	af
   922C 45            [ 4] 1812 	ld	b,l
   922D 21 D0 88      [10] 1813 	ld	hl, #_prota + 0
   9230 4E            [ 7] 1814 	ld	c,(hl)
   9231 59            [ 4] 1815 	ld	e,c
   9232 16 00         [ 7] 1816 	ld	d,#0x00
   9234 21 07 00      [10] 1817 	ld	hl,#0x0007
   9237 19            [11] 1818 	add	hl,de
   9238 11 50 80      [10] 1819 	ld	de, #0x8050
   923B 29            [11] 1820 	add	hl, hl
   923C 3F            [ 4] 1821 	ccf
   923D CB 1C         [ 8] 1822 	rr	h
   923F CB 1D         [ 8] 1823 	rr	l
   9241 ED 52         [15] 1824 	sbc	hl, de
   9243 3E 00         [ 7] 1825 	ld	a,#0x00
   9245 17            [ 4] 1826 	rla
   9246 5F            [ 4] 1827 	ld	e,a
   9247 78            [ 4] 1828 	ld	a,b
   9248 B7            [ 4] 1829 	or	a,a
   9249 20 14         [12] 1830 	jr	NZ,00104$
   924B B3            [ 4] 1831 	or	a,e
   924C 28 11         [12] 1832 	jr	Z,00104$
                           1833 ;src/main.c:408: prota.x++;
   924E 0C            [ 4] 1834 	inc	c
   924F 21 D0 88      [10] 1835 	ld	hl,#_prota
   9252 71            [ 7] 1836 	ld	(hl),c
                           1837 ;src/main.c:409: prota.mover = SI;
   9253 21 D6 88      [10] 1838 	ld	hl,#(_prota + 0x0006)
   9256 36 01         [10] 1839 	ld	(hl),#0x01
                           1840 ;src/main.c:410: prota.sprite = g_hero;
   9258 21 A8 7A      [10] 1841 	ld	hl,#_g_hero
   925B 22 D4 88      [16] 1842 	ld	((_prota + 0x0004)), hl
   925E C9            [10] 1843 	ret
   925F                    1844 00104$:
                           1845 ;src/main.c:412: }else if( prota.x + G_HERO_W >= 80){
   925F 7B            [ 4] 1846 	ld	a,e
   9260 B7            [ 4] 1847 	or	a, a
   9261 C0            [11] 1848 	ret	NZ
                           1849 ;src/main.c:413: avanzarMapa();
   9262 C3 BB 91      [10] 1850 	jp  _avanzarMapa
                           1851 ;src/main.c:417: void moverArriba() {
                           1852 ;	---------------------------------
                           1853 ; Function moverArriba
                           1854 ; ---------------------------------
   9265                    1855 _moverArriba::
                           1856 ;src/main.c:418: prota.mira = M_arriba;
   9265 21 D7 88      [10] 1857 	ld	hl,#(_prota + 0x0007)
   9268 36 02         [10] 1858 	ld	(hl),#0x02
                           1859 ;src/main.c:419: if (!checkCollision(M_arriba)) { 
   926A 21 02 00      [10] 1860 	ld	hl,#0x0002
   926D E5            [11] 1861 	push	hl
   926E CD 31 8A      [17] 1862 	call	_checkCollision
   9271 F1            [10] 1863 	pop	af
   9272 7D            [ 4] 1864 	ld	a,l
   9273 B7            [ 4] 1865 	or	a, a
   9274 C0            [11] 1866 	ret	NZ
                           1867 ;src/main.c:420: prota.y--;
   9275 21 D1 88      [10] 1868 	ld	hl,#_prota + 1
   9278 4E            [ 7] 1869 	ld	c,(hl)
   9279 0D            [ 4] 1870 	dec	c
   927A 71            [ 7] 1871 	ld	(hl),c
                           1872 ;src/main.c:421: prota.y--;
   927B 0D            [ 4] 1873 	dec	c
   927C 71            [ 7] 1874 	ld	(hl),c
                           1875 ;src/main.c:422: prota.mover  = SI;
   927D 21 D6 88      [10] 1876 	ld	hl,#(_prota + 0x0006)
   9280 36 01         [10] 1877 	ld	(hl),#0x01
                           1878 ;src/main.c:423: prota.sprite = g_hero_up;
   9282 21 64 79      [10] 1879 	ld	hl,#_g_hero_up
   9285 22 D4 88      [16] 1880 	ld	((_prota + 0x0004)), hl
   9288 C9            [10] 1881 	ret
                           1882 ;src/main.c:427: void moverAbajo() {
                           1883 ;	---------------------------------
                           1884 ; Function moverAbajo
                           1885 ; ---------------------------------
   9289                    1886 _moverAbajo::
                           1887 ;src/main.c:428: prota.mira = M_abajo;
   9289 21 D7 88      [10] 1888 	ld	hl,#(_prota + 0x0007)
   928C 36 03         [10] 1889 	ld	(hl),#0x03
                           1890 ;src/main.c:429: if (!checkCollision(M_abajo) ) { 
   928E 21 03 00      [10] 1891 	ld	hl,#0x0003
   9291 E5            [11] 1892 	push	hl
   9292 CD 31 8A      [17] 1893 	call	_checkCollision
   9295 F1            [10] 1894 	pop	af
   9296 7D            [ 4] 1895 	ld	a,l
   9297 B7            [ 4] 1896 	or	a, a
   9298 C0            [11] 1897 	ret	NZ
                           1898 ;src/main.c:430: prota.y++;
   9299 01 D1 88      [10] 1899 	ld	bc,#_prota + 1
   929C 0A            [ 7] 1900 	ld	a,(bc)
   929D 3C            [ 4] 1901 	inc	a
   929E 02            [ 7] 1902 	ld	(bc),a
                           1903 ;src/main.c:431: prota.y++;
   929F 3C            [ 4] 1904 	inc	a
   92A0 02            [ 7] 1905 	ld	(bc),a
                           1906 ;src/main.c:432: prota.mover  = SI;
   92A1 21 D6 88      [10] 1907 	ld	hl,#(_prota + 0x0006)
   92A4 36 01         [10] 1908 	ld	(hl),#0x01
                           1909 ;src/main.c:433: prota.sprite = g_hero_down;
   92A6 21 CA 78      [10] 1910 	ld	hl,#_g_hero_down
   92A9 22 D4 88      [16] 1911 	ld	((_prota + 0x0004)), hl
   92AC C9            [10] 1912 	ret
                           1913 ;src/main.c:437: void dibujarCuchillo() {
                           1914 ;	---------------------------------
                           1915 ; Function dibujarCuchillo
                           1916 ; ---------------------------------
   92AD                    1917 _dibujarCuchillo::
   92AD DD E5         [15] 1918 	push	ix
   92AF DD 21 00 00   [14] 1919 	ld	ix,#0
   92B3 DD 39         [15] 1920 	add	ix,sp
   92B5 F5            [11] 1921 	push	af
                           1922 ;src/main.c:438: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   92B6 21 D9 88      [10] 1923 	ld	hl, #_cu + 1
   92B9 56            [ 7] 1924 	ld	d,(hl)
   92BA 21 D8 88      [10] 1925 	ld	hl, #_cu + 0
   92BD 46            [ 7] 1926 	ld	b,(hl)
   92BE D5            [11] 1927 	push	de
   92BF 33            [ 6] 1928 	inc	sp
   92C0 C5            [11] 1929 	push	bc
   92C1 33            [ 6] 1930 	inc	sp
   92C2 21 00 C0      [10] 1931 	ld	hl,#0xC000
   92C5 E5            [11] 1932 	push	hl
   92C6 CD 3F 88      [17] 1933 	call	_cpct_getScreenPtr
   92C9 45            [ 4] 1934 	ld	b,l
   92CA 5C            [ 4] 1935 	ld	e,h
                           1936 ;src/main.c:439: if(cu.eje == E_X){
   92CB 21 E0 88      [10] 1937 	ld	hl, #_cu + 8
   92CE 4E            [ 7] 1938 	ld	c,(hl)
                           1939 ;src/main.c:440: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   92CF DD 70 FE      [19] 1940 	ld	-2 (ix),b
   92D2 DD 73 FF      [19] 1941 	ld	-1 (ix),e
                           1942 ;src/main.c:439: if(cu.eje == E_X){
   92D5 79            [ 4] 1943 	ld	a,c
   92D6 B7            [ 4] 1944 	or	a, a
   92D7 20 19         [12] 1945 	jr	NZ,00104$
                           1946 ;src/main.c:440: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   92D9 11 00 3E      [10] 1947 	ld	de,#_g_tablatrans+0
   92DC ED 4B DC 88   [20] 1948 	ld	bc, (#(_cu + 0x0004) + 0)
   92E0 D5            [11] 1949 	push	de
   92E1 21 04 04      [10] 1950 	ld	hl,#0x0404
   92E4 E5            [11] 1951 	push	hl
   92E5 DD 6E FE      [19] 1952 	ld	l,-2 (ix)
   92E8 DD 66 FF      [19] 1953 	ld	h,-1 (ix)
   92EB E5            [11] 1954 	push	hl
   92EC C5            [11] 1955 	push	bc
   92ED CD 5F 88      [17] 1956 	call	_cpct_drawSpriteMaskedAlignedTable
   92F0 18 1A         [12] 1957 	jr	00106$
   92F2                    1958 00104$:
                           1959 ;src/main.c:443: else if(cu.eje == E_Y){
   92F2 0D            [ 4] 1960 	dec	c
   92F3 20 17         [12] 1961 	jr	NZ,00106$
                           1962 ;src/main.c:444: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   92F5 11 00 3E      [10] 1963 	ld	de,#_g_tablatrans+0
   92F8 ED 4B DC 88   [20] 1964 	ld	bc, (#(_cu + 0x0004) + 0)
   92FC D5            [11] 1965 	push	de
   92FD 21 02 08      [10] 1966 	ld	hl,#0x0802
   9300 E5            [11] 1967 	push	hl
   9301 DD 6E FE      [19] 1968 	ld	l,-2 (ix)
   9304 DD 66 FF      [19] 1969 	ld	h,-1 (ix)
   9307 E5            [11] 1970 	push	hl
   9308 C5            [11] 1971 	push	bc
   9309 CD 5F 88      [17] 1972 	call	_cpct_drawSpriteMaskedAlignedTable
   930C                    1973 00106$:
   930C DD F9         [10] 1974 	ld	sp, ix
   930E DD E1         [14] 1975 	pop	ix
   9310 C9            [10] 1976 	ret
                           1977 ;src/main.c:448: void borrarCuchillo() {
                           1978 ;	---------------------------------
                           1979 ; Function borrarCuchillo
                           1980 ; ---------------------------------
   9311                    1981 _borrarCuchillo::
   9311 DD E5         [15] 1982 	push	ix
   9313 DD 21 00 00   [14] 1983 	ld	ix,#0
   9317 DD 39         [15] 1984 	add	ix,sp
   9319 F5            [11] 1985 	push	af
   931A 3B            [ 6] 1986 	dec	sp
                           1987 ;src/main.c:450: u8 w = 2 + (cu.px & 1);
   931B 21 DA 88      [10] 1988 	ld	hl, #_cu + 2
   931E 4E            [ 7] 1989 	ld	c,(hl)
   931F 79            [ 4] 1990 	ld	a,c
   9320 E6 01         [ 7] 1991 	and	a, #0x01
   9322 47            [ 4] 1992 	ld	b,a
   9323 04            [ 4] 1993 	inc	b
   9324 04            [ 4] 1994 	inc	b
                           1995 ;src/main.c:451: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   9325 21 DB 88      [10] 1996 	ld	hl, #_cu + 3
   9328 5E            [ 7] 1997 	ld	e,(hl)
   9329 7B            [ 4] 1998 	ld	a,e
   932A E6 03         [ 7] 1999 	and	a, #0x03
   932C 28 04         [12] 2000 	jr	Z,00105$
   932E 3E 01         [ 7] 2001 	ld	a,#0x01
   9330 18 02         [12] 2002 	jr	00106$
   9332                    2003 00105$:
   9332 3E 00         [ 7] 2004 	ld	a,#0x00
   9334                    2005 00106$:
   9334 C6 02         [ 7] 2006 	add	a, #0x02
   9336 DD 77 FD      [19] 2007 	ld	-3 (ix),a
                           2008 ;src/main.c:452: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   9339 FD 2A E2 88   [20] 2009 	ld	iy,(_mapa)
   933D 16 00         [ 7] 2010 	ld	d,#0x00
   933F 7B            [ 4] 2011 	ld	a,e
   9340 C6 E8         [ 7] 2012 	add	a,#0xE8
   9342 DD 77 FE      [19] 2013 	ld	-2 (ix),a
   9345 7A            [ 4] 2014 	ld	a,d
   9346 CE FF         [ 7] 2015 	adc	a,#0xFF
   9348 DD 77 FF      [19] 2016 	ld	-1 (ix),a
   934B DD 6E FE      [19] 2017 	ld	l,-2 (ix)
   934E DD 66 FF      [19] 2018 	ld	h,-1 (ix)
   9351 DD CB FF 7E   [20] 2019 	bit	7, -1 (ix)
   9355 28 04         [12] 2020 	jr	Z,00107$
   9357 21 EB FF      [10] 2021 	ld	hl,#0xFFEB
   935A 19            [11] 2022 	add	hl,de
   935B                    2023 00107$:
   935B CB 2C         [ 8] 2024 	sra	h
   935D CB 1D         [ 8] 2025 	rr	l
   935F CB 2C         [ 8] 2026 	sra	h
   9361 CB 1D         [ 8] 2027 	rr	l
   9363 55            [ 4] 2028 	ld	d,l
   9364 CB 39         [ 8] 2029 	srl	c
   9366 FD E5         [15] 2030 	push	iy
   9368 21 F0 C0      [10] 2031 	ld	hl,#0xC0F0
   936B E5            [11] 2032 	push	hl
   936C 3E 28         [ 7] 2033 	ld	a,#0x28
   936E F5            [11] 2034 	push	af
   936F 33            [ 6] 2035 	inc	sp
   9370 DD 7E FD      [19] 2036 	ld	a,-3 (ix)
   9373 F5            [11] 2037 	push	af
   9374 33            [ 6] 2038 	inc	sp
   9375 C5            [11] 2039 	push	bc
   9376 33            [ 6] 2040 	inc	sp
   9377 D5            [11] 2041 	push	de
   9378 33            [ 6] 2042 	inc	sp
   9379 79            [ 4] 2043 	ld	a,c
   937A F5            [11] 2044 	push	af
   937B 33            [ 6] 2045 	inc	sp
   937C CD 38 7D      [17] 2046 	call	_cpct_etm_drawTileBox2x4
                           2047 ;src/main.c:453: if(!cu.mover){
   937F 3A E1 88      [13] 2048 	ld	a, (#_cu + 9)
   9382 B7            [ 4] 2049 	or	a, a
   9383 20 05         [12] 2050 	jr	NZ,00103$
                           2051 ;src/main.c:454: cu.lanzado = NO;
   9385 21 DE 88      [10] 2052 	ld	hl,#(_cu + 0x0006)
   9388 36 00         [10] 2053 	ld	(hl),#0x00
   938A                    2054 00103$:
   938A DD F9         [10] 2055 	ld	sp, ix
   938C DD E1         [14] 2056 	pop	ix
   938E C9            [10] 2057 	ret
                           2058 ;src/main.c:458: void redibujarCuchillo( ) {
                           2059 ;	---------------------------------
                           2060 ; Function redibujarCuchillo
                           2061 ; ---------------------------------
   938F                    2062 _redibujarCuchillo::
                           2063 ;src/main.c:459: borrarCuchillo();
   938F CD 11 93      [17] 2064 	call	_borrarCuchillo
                           2065 ;src/main.c:460: cu.px = cu.x;
   9392 01 DA 88      [10] 2066 	ld	bc,#_cu + 2
   9395 3A D8 88      [13] 2067 	ld	a, (#_cu + 0)
   9398 02            [ 7] 2068 	ld	(bc),a
                           2069 ;src/main.c:461: cu.py = cu.y;
   9399 01 DB 88      [10] 2070 	ld	bc,#_cu + 3
   939C 3A D9 88      [13] 2071 	ld	a, (#_cu + 1)
   939F 02            [ 7] 2072 	ld	(bc),a
                           2073 ;src/main.c:462: dibujarCuchillo();
   93A0 C3 AD 92      [10] 2074 	jp  _dibujarCuchillo
                           2075 ;src/main.c:465: void lanzarCuchillo(){
                           2076 ;	---------------------------------
                           2077 ; Function lanzarCuchillo
                           2078 ; ---------------------------------
   93A3                    2079 _lanzarCuchillo::
                           2080 ;src/main.c:467: if(!cu.lanzado){
   93A3 3A DE 88      [13] 2081 	ld	a, (#(_cu + 0x0006) + 0)
   93A6 B7            [ 4] 2082 	or	a, a
   93A7 C0            [11] 2083 	ret	NZ
                           2084 ;src/main.c:469: if(prota.mira == M_derecha){
   93A8 21 D7 88      [10] 2085 	ld	hl, #_prota + 7
   93AB 5E            [ 7] 2086 	ld	e,(hl)
                           2087 ;src/main.c:470: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   93AC 01 D1 88      [10] 2088 	ld	bc,#_prota + 1
                           2089 ;src/main.c:472: cu.direccion = M_derecha;
                           2090 ;src/main.c:474: cu.y=prota.y + G_HERO_H /2;
                           2091 ;src/main.c:475: cu.sprite=g_knifeX_0;
                           2092 ;src/main.c:476: cu.eje = E_X;
                           2093 ;src/main.c:469: if(prota.mira == M_derecha){
   93AF 7B            [ 4] 2094 	ld	a,e
   93B0 B7            [ 4] 2095 	or	a, a
   93B1 20 41         [12] 2096 	jr	NZ,00118$
                           2097 ;src/main.c:470: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   93B3 0A            [ 7] 2098 	ld	a,(bc)
   93B4 C6 0B         [ 7] 2099 	add	a, #0x0B
   93B6 5F            [ 4] 2100 	ld	e,a
   93B7 3A D0 88      [13] 2101 	ld	a, (#_prota + 0)
   93BA C6 0C         [ 7] 2102 	add	a, #0x0C
   93BC 6F            [ 4] 2103 	ld	l,a
   93BD C5            [11] 2104 	push	bc
   93BE 7B            [ 4] 2105 	ld	a,e
   93BF F5            [11] 2106 	push	af
   93C0 33            [ 6] 2107 	inc	sp
   93C1 7D            [ 4] 2108 	ld	a,l
   93C2 F5            [11] 2109 	push	af
   93C3 33            [ 6] 2110 	inc	sp
   93C4 CD F0 89      [17] 2111 	call	_getTilePtr
   93C7 F1            [10] 2112 	pop	af
   93C8 C1            [10] 2113 	pop	bc
   93C9 5E            [ 7] 2114 	ld	e,(hl)
   93CA 3E 02         [ 7] 2115 	ld	a,#0x02
   93CC 93            [ 4] 2116 	sub	a, e
   93CD D8            [11] 2117 	ret	C
                           2118 ;src/main.c:471: cu.lanzado = SI;
   93CE 21 DE 88      [10] 2119 	ld	hl,#(_cu + 0x0006)
   93D1 36 01         [10] 2120 	ld	(hl),#0x01
                           2121 ;src/main.c:472: cu.direccion = M_derecha;
   93D3 21 DF 88      [10] 2122 	ld	hl,#(_cu + 0x0007)
   93D6 36 00         [10] 2123 	ld	(hl),#0x00
                           2124 ;src/main.c:473: cu.x=prota.x + G_HERO_W;
   93D8 3A D0 88      [13] 2125 	ld	a, (#_prota + 0)
   93DB C6 07         [ 7] 2126 	add	a, #0x07
   93DD 32 D8 88      [13] 2127 	ld	(#_cu),a
                           2128 ;src/main.c:474: cu.y=prota.y + G_HERO_H /2;
   93E0 0A            [ 7] 2129 	ld	a,(bc)
   93E1 C6 0B         [ 7] 2130 	add	a, #0x0B
   93E3 32 D9 88      [13] 2131 	ld	(#(_cu + 0x0001)),a
                           2132 ;src/main.c:475: cu.sprite=g_knifeX_0;
   93E6 21 C0 54      [10] 2133 	ld	hl,#_g_knifeX_0
   93E9 22 DC 88      [16] 2134 	ld	((_cu + 0x0004)), hl
                           2135 ;src/main.c:476: cu.eje = E_X;
   93EC 21 E0 88      [10] 2136 	ld	hl,#(_cu + 0x0008)
   93EF 36 00         [10] 2137 	ld	(hl),#0x00
                           2138 ;src/main.c:477: dibujarCuchillo();
   93F1 C3 AD 92      [10] 2139 	jp  _dibujarCuchillo
   93F4                    2140 00118$:
                           2141 ;src/main.c:480: else if(prota.mira == M_izquierda){
   93F4 7B            [ 4] 2142 	ld	a,e
   93F5 3D            [ 4] 2143 	dec	a
   93F6 20 41         [12] 2144 	jr	NZ,00115$
                           2145 ;src/main.c:481: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   93F8 0A            [ 7] 2146 	ld	a,(bc)
   93F9 C6 0B         [ 7] 2147 	add	a, #0x0B
   93FB 5F            [ 4] 2148 	ld	e,a
   93FC 3A D0 88      [13] 2149 	ld	a, (#_prota + 0)
   93FF C6 F6         [ 7] 2150 	add	a,#0xF6
   9401 6F            [ 4] 2151 	ld	l,a
   9402 C5            [11] 2152 	push	bc
   9403 7B            [ 4] 2153 	ld	a,e
   9404 F5            [11] 2154 	push	af
   9405 33            [ 6] 2155 	inc	sp
   9406 7D            [ 4] 2156 	ld	a,l
   9407 F5            [11] 2157 	push	af
   9408 33            [ 6] 2158 	inc	sp
   9409 CD F0 89      [17] 2159 	call	_getTilePtr
   940C F1            [10] 2160 	pop	af
   940D C1            [10] 2161 	pop	bc
   940E 5E            [ 7] 2162 	ld	e,(hl)
   940F 3E 02         [ 7] 2163 	ld	a,#0x02
   9411 93            [ 4] 2164 	sub	a, e
   9412 D8            [11] 2165 	ret	C
                           2166 ;src/main.c:482: cu.lanzado = SI;
   9413 21 DE 88      [10] 2167 	ld	hl,#(_cu + 0x0006)
   9416 36 01         [10] 2168 	ld	(hl),#0x01
                           2169 ;src/main.c:483: cu.direccion = M_izquierda;
   9418 21 DF 88      [10] 2170 	ld	hl,#(_cu + 0x0007)
   941B 36 01         [10] 2171 	ld	(hl),#0x01
                           2172 ;src/main.c:484: cu.x = prota.x - G_KNIFEX_0_W;
   941D 3A D0 88      [13] 2173 	ld	a, (#_prota + 0)
   9420 C6 FC         [ 7] 2174 	add	a,#0xFC
   9422 32 D8 88      [13] 2175 	ld	(#_cu),a
                           2176 ;src/main.c:485: cu.y = prota.y + G_HERO_H /2;
   9425 0A            [ 7] 2177 	ld	a,(bc)
   9426 C6 0B         [ 7] 2178 	add	a, #0x0B
   9428 32 D9 88      [13] 2179 	ld	(#(_cu + 0x0001)),a
                           2180 ;src/main.c:486: cu.sprite = g_knifeX_1;
   942B 21 D0 54      [10] 2181 	ld	hl,#_g_knifeX_1
   942E 22 DC 88      [16] 2182 	ld	((_cu + 0x0004)), hl
                           2183 ;src/main.c:487: cu.eje = E_X;
   9431 21 E0 88      [10] 2184 	ld	hl,#(_cu + 0x0008)
   9434 36 00         [10] 2185 	ld	(hl),#0x00
                           2186 ;src/main.c:488: dibujarCuchillo();
   9436 C3 AD 92      [10] 2187 	jp  _dibujarCuchillo
   9439                    2188 00115$:
                           2189 ;src/main.c:491: else if(prota.mira == M_abajo){
   9439 7B            [ 4] 2190 	ld	a,e
   943A D6 03         [ 7] 2191 	sub	a, #0x03
   943C 20 41         [12] 2192 	jr	NZ,00112$
                           2193 ;src/main.c:493: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   943E 0A            [ 7] 2194 	ld	a,(bc)
   943F C6 1F         [ 7] 2195 	add	a, #0x1F
   9441 5F            [ 4] 2196 	ld	e,a
   9442 3A D0 88      [13] 2197 	ld	a, (#_prota + 0)
   9445 57            [ 4] 2198 	ld	d,a
   9446 14            [ 4] 2199 	inc	d
   9447 14            [ 4] 2200 	inc	d
   9448 14            [ 4] 2201 	inc	d
   9449 C5            [11] 2202 	push	bc
   944A 7B            [ 4] 2203 	ld	a,e
   944B F5            [11] 2204 	push	af
   944C 33            [ 6] 2205 	inc	sp
   944D D5            [11] 2206 	push	de
   944E 33            [ 6] 2207 	inc	sp
   944F CD F0 89      [17] 2208 	call	_getTilePtr
   9452 F1            [10] 2209 	pop	af
   9453 C1            [10] 2210 	pop	bc
   9454 5E            [ 7] 2211 	ld	e,(hl)
   9455 3E 02         [ 7] 2212 	ld	a,#0x02
   9457 93            [ 4] 2213 	sub	a, e
   9458 D8            [11] 2214 	ret	C
                           2215 ;src/main.c:494: cu.lanzado = SI;
   9459 21 DE 88      [10] 2216 	ld	hl,#(_cu + 0x0006)
   945C 36 01         [10] 2217 	ld	(hl),#0x01
                           2218 ;src/main.c:495: cu.direccion = M_abajo;
   945E 21 DF 88      [10] 2219 	ld	hl,#(_cu + 0x0007)
   9461 36 03         [10] 2220 	ld	(hl),#0x03
                           2221 ;src/main.c:496: cu.x = prota.x + G_HERO_W / 2;
   9463 3A D0 88      [13] 2222 	ld	a, (#_prota + 0)
   9466 C6 03         [ 7] 2223 	add	a, #0x03
   9468 32 D8 88      [13] 2224 	ld	(#_cu),a
                           2225 ;src/main.c:497: cu.y = prota.y + G_HERO_H;
   946B 0A            [ 7] 2226 	ld	a,(bc)
   946C C6 16         [ 7] 2227 	add	a, #0x16
   946E 32 D9 88      [13] 2228 	ld	(#(_cu + 0x0001)),a
                           2229 ;src/main.c:498: cu.sprite = g_knifeY_0;
   9471 21 A0 54      [10] 2230 	ld	hl,#_g_knifeY_0
   9474 22 DC 88      [16] 2231 	ld	((_cu + 0x0004)), hl
                           2232 ;src/main.c:499: cu.eje = E_Y;
   9477 21 E0 88      [10] 2233 	ld	hl,#(_cu + 0x0008)
   947A 36 01         [10] 2234 	ld	(hl),#0x01
                           2235 ;src/main.c:500: dibujarCuchillo();
   947C C3 AD 92      [10] 2236 	jp  _dibujarCuchillo
   947F                    2237 00112$:
                           2238 ;src/main.c:503: else if(prota.mira == M_arriba){
   947F 7B            [ 4] 2239 	ld	a,e
   9480 D6 02         [ 7] 2240 	sub	a, #0x02
   9482 C0            [11] 2241 	ret	NZ
                           2242 ;src/main.c:504: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   9483 0A            [ 7] 2243 	ld	a,(bc)
   9484 C6 F7         [ 7] 2244 	add	a,#0xF7
   9486 57            [ 4] 2245 	ld	d,a
   9487 3A D0 88      [13] 2246 	ld	a, (#_prota + 0)
   948A C6 03         [ 7] 2247 	add	a, #0x03
   948C C5            [11] 2248 	push	bc
   948D D5            [11] 2249 	push	de
   948E 33            [ 6] 2250 	inc	sp
   948F F5            [11] 2251 	push	af
   9490 33            [ 6] 2252 	inc	sp
   9491 CD F0 89      [17] 2253 	call	_getTilePtr
   9494 F1            [10] 2254 	pop	af
   9495 C1            [10] 2255 	pop	bc
   9496 5E            [ 7] 2256 	ld	e,(hl)
   9497 3E 02         [ 7] 2257 	ld	a,#0x02
   9499 93            [ 4] 2258 	sub	a, e
   949A D8            [11] 2259 	ret	C
                           2260 ;src/main.c:505: cu.lanzado = SI;
   949B 21 DE 88      [10] 2261 	ld	hl,#(_cu + 0x0006)
   949E 36 01         [10] 2262 	ld	(hl),#0x01
                           2263 ;src/main.c:506: cu.direccion = M_arriba;
   94A0 21 DF 88      [10] 2264 	ld	hl,#(_cu + 0x0007)
   94A3 36 02         [10] 2265 	ld	(hl),#0x02
                           2266 ;src/main.c:507: cu.x = prota.x + G_HERO_W / 2;
   94A5 3A D0 88      [13] 2267 	ld	a, (#_prota + 0)
   94A8 C6 03         [ 7] 2268 	add	a, #0x03
   94AA 32 D8 88      [13] 2269 	ld	(#_cu),a
                           2270 ;src/main.c:508: cu.y = prota.y;
   94AD 0A            [ 7] 2271 	ld	a,(bc)
   94AE 32 D9 88      [13] 2272 	ld	(#(_cu + 0x0001)),a
                           2273 ;src/main.c:509: cu.sprite = g_knifeY_1;
   94B1 21 B0 54      [10] 2274 	ld	hl,#_g_knifeY_1
   94B4 22 DC 88      [16] 2275 	ld	((_cu + 0x0004)), hl
                           2276 ;src/main.c:510: cu.eje = E_Y;
   94B7 21 E0 88      [10] 2277 	ld	hl,#(_cu + 0x0008)
   94BA 36 01         [10] 2278 	ld	(hl),#0x01
                           2279 ;src/main.c:511: dibujarCuchillo();
   94BC C3 AD 92      [10] 2280 	jp  _dibujarCuchillo
                           2281 ;src/main.c:517: void comprobarTeclado() {
                           2282 ;	---------------------------------
                           2283 ; Function comprobarTeclado
                           2284 ; ---------------------------------
   94BF                    2285 _comprobarTeclado::
                           2286 ;src/main.c:518: cpct_scanKeyboard_if();
   94BF CD 90 7E      [17] 2287 	call	_cpct_scanKeyboard_if
                           2288 ;src/main.c:520: if (cpct_isAnyKeyPressed()) {
   94C2 CD 83 7E      [17] 2289 	call	_cpct_isAnyKeyPressed
   94C5 7D            [ 4] 2290 	ld	a,l
   94C6 B7            [ 4] 2291 	or	a, a
   94C7 C8            [11] 2292 	ret	Z
                           2293 ;src/main.c:521: if (cpct_isKeyPressed(Key_CursorLeft))
   94C8 21 01 01      [10] 2294 	ld	hl,#0x0101
   94CB CD F9 7B      [17] 2295 	call	_cpct_isKeyPressed
   94CE 7D            [ 4] 2296 	ld	a,l
   94CF B7            [ 4] 2297 	or	a, a
                           2298 ;src/main.c:522: moverIzquierda();
   94D0 C2 FA 91      [10] 2299 	jp	NZ,_moverIzquierda
                           2300 ;src/main.c:523: else if (cpct_isKeyPressed(Key_CursorRight))
   94D3 21 00 02      [10] 2301 	ld	hl,#0x0200
   94D6 CD F9 7B      [17] 2302 	call	_cpct_isKeyPressed
   94D9 7D            [ 4] 2303 	ld	a,l
   94DA B7            [ 4] 2304 	or	a, a
                           2305 ;src/main.c:524: moverDerecha();
   94DB C2 1F 92      [10] 2306 	jp	NZ,_moverDerecha
                           2307 ;src/main.c:525: else if (cpct_isKeyPressed(Key_CursorUp))
   94DE 21 00 01      [10] 2308 	ld	hl,#0x0100
   94E1 CD F9 7B      [17] 2309 	call	_cpct_isKeyPressed
   94E4 7D            [ 4] 2310 	ld	a,l
   94E5 B7            [ 4] 2311 	or	a, a
                           2312 ;src/main.c:526: moverArriba();
   94E6 C2 65 92      [10] 2313 	jp	NZ,_moverArriba
                           2314 ;src/main.c:527: else if (cpct_isKeyPressed(Key_CursorDown))
   94E9 21 00 04      [10] 2315 	ld	hl,#0x0400
   94EC CD F9 7B      [17] 2316 	call	_cpct_isKeyPressed
   94EF 7D            [ 4] 2317 	ld	a,l
   94F0 B7            [ 4] 2318 	or	a, a
                           2319 ;src/main.c:528: moverAbajo();
   94F1 C2 89 92      [10] 2320 	jp	NZ,_moverAbajo
                           2321 ;src/main.c:529: else if (cpct_isKeyPressed(Key_Space))
   94F4 21 05 80      [10] 2322 	ld	hl,#0x8005
   94F7 CD F9 7B      [17] 2323 	call	_cpct_isKeyPressed
   94FA 7D            [ 4] 2324 	ld	a,l
   94FB B7            [ 4] 2325 	or	a, a
   94FC C8            [11] 2326 	ret	Z
                           2327 ;src/main.c:530: lanzarCuchillo();
   94FD C3 A3 93      [10] 2328 	jp  _lanzarCuchillo
                           2329 ;src/main.c:534: u8 checkKnifeCollision(int direction, u8 xoff, u8 yoff){
                           2330 ;	---------------------------------
                           2331 ; Function checkKnifeCollision
                           2332 ; ---------------------------------
   9500                    2333 _checkKnifeCollision::
                           2334 ;src/main.c:536: return *getTilePtr(cu.x + xoff, cu.y + yoff) <= 2;
   9500 3A D9 88      [13] 2335 	ld	a,(#_cu + 1)
   9503 21 05 00      [10] 2336 	ld	hl,#5
   9506 39            [11] 2337 	add	hl,sp
   9507 86            [ 7] 2338 	add	a, (hl)
   9508 47            [ 4] 2339 	ld	b,a
   9509 3A D8 88      [13] 2340 	ld	a,(#_cu + 0)
   950C 21 04 00      [10] 2341 	ld	hl,#4
   950F 39            [11] 2342 	add	hl,sp
   9510 86            [ 7] 2343 	add	a, (hl)
   9511 4F            [ 4] 2344 	ld	c,a
   9512 C5            [11] 2345 	push	bc
   9513 CD F0 89      [17] 2346 	call	_getTilePtr
   9516 F1            [10] 2347 	pop	af
   9517 4E            [ 7] 2348 	ld	c,(hl)
   9518 3E 02         [ 7] 2349 	ld	a,#0x02
   951A 91            [ 4] 2350 	sub	a, c
   951B 3E 00         [ 7] 2351 	ld	a,#0x00
   951D 17            [ 4] 2352 	rla
   951E EE 01         [ 7] 2353 	xor	a, #0x01
   9520 6F            [ 4] 2354 	ld	l, a
   9521 C9            [10] 2355 	ret
                           2356 ;src/main.c:539: void moverCuchillo(){
                           2357 ;	---------------------------------
                           2358 ; Function moverCuchillo
                           2359 ; ---------------------------------
   9522                    2360 _moverCuchillo::
                           2361 ;src/main.c:540: if(cu.lanzado){
   9522 01 D8 88      [10] 2362 	ld	bc,#_cu+0
   9525 3A DE 88      [13] 2363 	ld	a, (#_cu + 6)
   9528 B7            [ 4] 2364 	or	a, a
   9529 C8            [11] 2365 	ret	Z
                           2366 ;src/main.c:541: cu.mover = SI;
   952A 21 09 00      [10] 2367 	ld	hl,#0x0009
   952D 09            [11] 2368 	add	hl,bc
   952E EB            [ 4] 2369 	ex	de,hl
   952F 3E 01         [ 7] 2370 	ld	a,#0x01
   9531 12            [ 7] 2371 	ld	(de),a
                           2372 ;src/main.c:542: if(cu.direccion == M_derecha){
   9532 21 DF 88      [10] 2373 	ld	hl, #_cu + 7
   9535 6E            [ 7] 2374 	ld	l,(hl)
   9536 7D            [ 4] 2375 	ld	a,l
   9537 B7            [ 4] 2376 	or	a, a
   9538 20 1E         [12] 2377 	jr	NZ,00122$
                           2378 ;src/main.c:544: if(checkKnifeCollision(M_derecha, G_KNIFEX_0_W + 1, 0)){
   953A C5            [11] 2379 	push	bc
   953B D5            [11] 2380 	push	de
   953C 21 05 00      [10] 2381 	ld	hl,#0x0005
   953F E5            [11] 2382 	push	hl
   9540 2E 00         [ 7] 2383 	ld	l, #0x00
   9542 E5            [11] 2384 	push	hl
   9543 CD 00 95      [17] 2385 	call	_checkKnifeCollision
   9546 F1            [10] 2386 	pop	af
   9547 F1            [10] 2387 	pop	af
   9548 D1            [10] 2388 	pop	de
   9549 C1            [10] 2389 	pop	bc
   954A 7D            [ 4] 2390 	ld	a,l
   954B B7            [ 4] 2391 	or	a, a
   954C 28 07         [12] 2392 	jr	Z,00102$
                           2393 ;src/main.c:545: cu.mover = SI;
   954E 3E 01         [ 7] 2394 	ld	a,#0x01
   9550 12            [ 7] 2395 	ld	(de),a
                           2396 ;src/main.c:546: cu.x++;
   9551 0A            [ 7] 2397 	ld	a,(bc)
   9552 3C            [ 4] 2398 	inc	a
   9553 02            [ 7] 2399 	ld	(bc),a
   9554 C9            [10] 2400 	ret
   9555                    2401 00102$:
                           2402 ;src/main.c:549: cu.mover=NO;
   9555 AF            [ 4] 2403 	xor	a, a
   9556 12            [ 7] 2404 	ld	(de),a
   9557 C9            [10] 2405 	ret
   9558                    2406 00122$:
                           2407 ;src/main.c:552: else if(cu.direccion == M_izquierda){
   9558 7D            [ 4] 2408 	ld	a,l
   9559 3D            [ 4] 2409 	dec	a
   955A 20 1F         [12] 2410 	jr	NZ,00119$
                           2411 ;src/main.c:553: if(checkKnifeCollision(M_derecha, -1, 0)){
   955C C5            [11] 2412 	push	bc
   955D D5            [11] 2413 	push	de
   955E 21 FF 00      [10] 2414 	ld	hl,#0x00FF
   9561 E5            [11] 2415 	push	hl
   9562 2E 00         [ 7] 2416 	ld	l, #0x00
   9564 E5            [11] 2417 	push	hl
   9565 CD 00 95      [17] 2418 	call	_checkKnifeCollision
   9568 F1            [10] 2419 	pop	af
   9569 F1            [10] 2420 	pop	af
   956A D1            [10] 2421 	pop	de
   956B C1            [10] 2422 	pop	bc
   956C 7D            [ 4] 2423 	ld	a,l
   956D B7            [ 4] 2424 	or	a, a
   956E 28 08         [12] 2425 	jr	Z,00105$
                           2426 ;src/main.c:554: cu.mover = SI;
   9570 3E 01         [ 7] 2427 	ld	a,#0x01
   9572 12            [ 7] 2428 	ld	(de),a
                           2429 ;src/main.c:555: cu.x--;
   9573 0A            [ 7] 2430 	ld	a,(bc)
   9574 C6 FF         [ 7] 2431 	add	a,#0xFF
   9576 02            [ 7] 2432 	ld	(bc),a
   9577 C9            [10] 2433 	ret
   9578                    2434 00105$:
                           2435 ;src/main.c:557: cu.mover=NO;
   9578 AF            [ 4] 2436 	xor	a, a
   9579 12            [ 7] 2437 	ld	(de),a
   957A C9            [10] 2438 	ret
   957B                    2439 00119$:
                           2440 ;src/main.c:563: cu.y--;
   957B 03            [ 6] 2441 	inc	bc
                           2442 ;src/main.c:560: else if(cu.direccion == M_arriba){
   957C 7D            [ 4] 2443 	ld	a,l
   957D D6 02         [ 7] 2444 	sub	a, #0x02
   957F 20 22         [12] 2445 	jr	NZ,00116$
                           2446 ;src/main.c:561: if(checkKnifeCollision(M_derecha, 0, -2)){
   9581 C5            [11] 2447 	push	bc
   9582 D5            [11] 2448 	push	de
   9583 21 00 FE      [10] 2449 	ld	hl,#0xFE00
   9586 E5            [11] 2450 	push	hl
   9587 26 00         [ 7] 2451 	ld	h, #0x00
   9589 E5            [11] 2452 	push	hl
   958A CD 00 95      [17] 2453 	call	_checkKnifeCollision
   958D F1            [10] 2454 	pop	af
   958E F1            [10] 2455 	pop	af
   958F D1            [10] 2456 	pop	de
   9590 C1            [10] 2457 	pop	bc
   9591 7D            [ 4] 2458 	ld	a,l
   9592 B7            [ 4] 2459 	or	a, a
   9593 28 0B         [12] 2460 	jr	Z,00108$
                           2461 ;src/main.c:562: cu.mover = SI;
   9595 3E 01         [ 7] 2462 	ld	a,#0x01
   9597 12            [ 7] 2463 	ld	(de),a
                           2464 ;src/main.c:563: cu.y--;
   9598 0A            [ 7] 2465 	ld	a,(bc)
   9599 C6 FF         [ 7] 2466 	add	a,#0xFF
   959B 02            [ 7] 2467 	ld	(bc),a
                           2468 ;src/main.c:564: cu.y--;
   959C C6 FF         [ 7] 2469 	add	a,#0xFF
   959E 02            [ 7] 2470 	ld	(bc),a
   959F C9            [10] 2471 	ret
   95A0                    2472 00108$:
                           2473 ;src/main.c:567: cu.mover=NO;
   95A0 AF            [ 4] 2474 	xor	a, a
   95A1 12            [ 7] 2475 	ld	(de),a
   95A2 C9            [10] 2476 	ret
   95A3                    2477 00116$:
                           2478 ;src/main.c:570: else if(cu.direccion == M_abajo){
   95A3 7D            [ 4] 2479 	ld	a,l
   95A4 D6 03         [ 7] 2480 	sub	a, #0x03
   95A6 C0            [11] 2481 	ret	NZ
                           2482 ;src/main.c:571: if(checkKnifeCollision(M_derecha, 0, G_KNIFEY_0_H + 2)){
   95A7 C5            [11] 2483 	push	bc
   95A8 D5            [11] 2484 	push	de
   95A9 21 00 0A      [10] 2485 	ld	hl,#0x0A00
   95AC E5            [11] 2486 	push	hl
   95AD 26 00         [ 7] 2487 	ld	h, #0x00
   95AF E5            [11] 2488 	push	hl
   95B0 CD 00 95      [17] 2489 	call	_checkKnifeCollision
   95B3 F1            [10] 2490 	pop	af
   95B4 F1            [10] 2491 	pop	af
   95B5 D1            [10] 2492 	pop	de
   95B6 C1            [10] 2493 	pop	bc
   95B7 7D            [ 4] 2494 	ld	a,l
   95B8 B7            [ 4] 2495 	or	a, a
   95B9 28 09         [12] 2496 	jr	Z,00111$
                           2497 ;src/main.c:572: cu.mover = SI;
   95BB 3E 01         [ 7] 2498 	ld	a,#0x01
   95BD 12            [ 7] 2499 	ld	(de),a
                           2500 ;src/main.c:573: cu.y++;
   95BE 0A            [ 7] 2501 	ld	a,(bc)
   95BF 3C            [ 4] 2502 	inc	a
   95C0 02            [ 7] 2503 	ld	(bc),a
                           2504 ;src/main.c:574: cu.y++;
   95C1 3C            [ 4] 2505 	inc	a
   95C2 02            [ 7] 2506 	ld	(bc),a
   95C3 C9            [10] 2507 	ret
   95C4                    2508 00111$:
                           2509 ;src/main.c:577: cu.mover=NO;
   95C4 AF            [ 4] 2510 	xor	a, a
   95C5 12            [ 7] 2511 	ld	(de),a
   95C6 C9            [10] 2512 	ret
                           2513 ;src/main.c:583: void barraPuntuacionInicial(){
                           2514 ;	---------------------------------
                           2515 ; Function barraPuntuacionInicial
                           2516 ; ---------------------------------
   95C7                    2517 _barraPuntuacionInicial::
                           2518 ;src/main.c:588: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   95C7 21 00 02      [10] 2519 	ld	hl,#0x0200
   95CA E5            [11] 2520 	push	hl
   95CB 26 C0         [ 7] 2521 	ld	h, #0xC0
   95CD E5            [11] 2522 	push	hl
   95CE CD 3F 88      [17] 2523 	call	_cpct_getScreenPtr
   95D1 4D            [ 4] 2524 	ld	c,l
   95D2 44            [ 4] 2525 	ld	b,h
                           2526 ;src/main.c:589: cpct_drawStringM0("SCORE", memptr, 1, 0);
   95D3 21 01 00      [10] 2527 	ld	hl,#0x0001
   95D6 E5            [11] 2528 	push	hl
   95D7 C5            [11] 2529 	push	bc
   95D8 21 51 96      [10] 2530 	ld	hl,#___str_1
   95DB E5            [11] 2531 	push	hl
   95DC CD 6F 7C      [17] 2532 	call	_cpct_drawStringM0
   95DF 21 06 00      [10] 2533 	ld	hl,#6
   95E2 39            [11] 2534 	add	hl,sp
   95E3 F9            [ 6] 2535 	ld	sp,hl
                           2536 ;src/main.c:590: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   95E4 21 00 0E      [10] 2537 	ld	hl,#0x0E00
   95E7 E5            [11] 2538 	push	hl
   95E8 26 C0         [ 7] 2539 	ld	h, #0xC0
   95EA E5            [11] 2540 	push	hl
   95EB CD 3F 88      [17] 2541 	call	_cpct_getScreenPtr
   95EE 4D            [ 4] 2542 	ld	c,l
   95EF 44            [ 4] 2543 	ld	b,h
                           2544 ;src/main.c:591: cpct_drawStringM0("00000", memptr, 15, 0);
   95F0 21 0F 00      [10] 2545 	ld	hl,#0x000F
   95F3 E5            [11] 2546 	push	hl
   95F4 C5            [11] 2547 	push	bc
   95F5 21 57 96      [10] 2548 	ld	hl,#___str_2
   95F8 E5            [11] 2549 	push	hl
   95F9 CD 6F 7C      [17] 2550 	call	_cpct_drawStringM0
   95FC 21 06 00      [10] 2551 	ld	hl,#6
   95FF 39            [11] 2552 	add	hl,sp
   9600 F9            [ 6] 2553 	ld	sp,hl
                           2554 ;src/main.c:597: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   9601 21 3C 02      [10] 2555 	ld	hl,#0x023C
   9604 E5            [11] 2556 	push	hl
   9605 21 00 C0      [10] 2557 	ld	hl,#0xC000
   9608 E5            [11] 2558 	push	hl
   9609 CD 3F 88      [17] 2559 	call	_cpct_getScreenPtr
   960C 4D            [ 4] 2560 	ld	c,l
   960D 44            [ 4] 2561 	ld	b,h
                           2562 ;src/main.c:598: cpct_drawStringM0("LIVES", memptr, 1, 0);
   960E 21 01 00      [10] 2563 	ld	hl,#0x0001
   9611 E5            [11] 2564 	push	hl
   9612 C5            [11] 2565 	push	bc
   9613 21 5D 96      [10] 2566 	ld	hl,#___str_3
   9616 E5            [11] 2567 	push	hl
   9617 CD 6F 7C      [17] 2568 	call	_cpct_drawStringM0
   961A 21 06 00      [10] 2569 	ld	hl,#6
   961D 39            [11] 2570 	add	hl,sp
   961E F9            [ 6] 2571 	ld	sp,hl
                           2572 ;src/main.c:600: for(i=0; i<5; i++){
   961F 01 00 00      [10] 2573 	ld	bc,#0x0000
   9622                    2574 00102$:
                           2575 ;src/main.c:601: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   9622 79            [ 4] 2576 	ld	a,c
   9623 87            [ 4] 2577 	add	a, a
   9624 87            [ 4] 2578 	add	a, a
   9625 C6 3C         [ 7] 2579 	add	a, #0x3C
   9627 57            [ 4] 2580 	ld	d,a
   9628 C5            [11] 2581 	push	bc
   9629 3E 0E         [ 7] 2582 	ld	a,#0x0E
   962B F5            [11] 2583 	push	af
   962C 33            [ 6] 2584 	inc	sp
   962D D5            [11] 2585 	push	de
   962E 33            [ 6] 2586 	inc	sp
   962F 21 00 C0      [10] 2587 	ld	hl,#0xC000
   9632 E5            [11] 2588 	push	hl
   9633 CD 3F 88      [17] 2589 	call	_cpct_getScreenPtr
   9636 EB            [ 4] 2590 	ex	de,hl
   9637 21 03 06      [10] 2591 	ld	hl,#0x0603
   963A E5            [11] 2592 	push	hl
   963B D5            [11] 2593 	push	de
   963C 21 60 78      [10] 2594 	ld	hl,#_g_heart
   963F E5            [11] 2595 	push	hl
   9640 CD 93 7C      [17] 2596 	call	_cpct_drawSprite
   9643 C1            [10] 2597 	pop	bc
                           2598 ;src/main.c:600: for(i=0; i<5; i++){
   9644 03            [ 6] 2599 	inc	bc
   9645 79            [ 4] 2600 	ld	a,c
   9646 D6 05         [ 7] 2601 	sub	a, #0x05
   9648 78            [ 4] 2602 	ld	a,b
   9649 17            [ 4] 2603 	rla
   964A 3F            [ 4] 2604 	ccf
   964B 1F            [ 4] 2605 	rra
   964C DE 80         [ 7] 2606 	sbc	a, #0x80
   964E 38 D2         [12] 2607 	jr	C,00102$
   9650 C9            [10] 2608 	ret
   9651                    2609 ___str_1:
   9651 53 43 4F 52 45     2610 	.ascii "SCORE"
   9656 00                 2611 	.db 0x00
   9657                    2612 ___str_2:
   9657 30 30 30 30 30     2613 	.ascii "00000"
   965C 00                 2614 	.db 0x00
   965D                    2615 ___str_3:
   965D 4C 49 56 45 53     2616 	.ascii "LIVES"
   9662 00                 2617 	.db 0x00
                           2618 ;src/main.c:606: void borrarPantalla(u8 x, u8 y, u8 ancho, u8 alto){
                           2619 ;	---------------------------------
                           2620 ; Function borrarPantalla
                           2621 ; ---------------------------------
   9663                    2622 _borrarPantalla::
   9663 DD E5         [15] 2623 	push	ix
   9665 DD 21 00 00   [14] 2624 	ld	ix,#0
   9669 DD 39         [15] 2625 	add	ix,sp
                           2626 ;src/main.c:608: if (ancho <= 40){
   966B 3E 28         [ 7] 2627 	ld	a,#0x28
   966D DD 96 06      [19] 2628 	sub	a, 6 (ix)
   9670 3E 00         [ 7] 2629 	ld	a,#0x00
   9672 17            [ 4] 2630 	rla
   9673 4F            [ 4] 2631 	ld	c,a
   9674 CB 41         [ 8] 2632 	bit	0,c
   9676 20 23         [12] 2633 	jr	NZ,00104$
                           2634 ;src/main.c:609: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar 
   9678 DD 66 05      [19] 2635 	ld	h,5 (ix)
   967B DD 6E 04      [19] 2636 	ld	l,4 (ix)
   967E E5            [11] 2637 	push	hl
   967F 21 00 C0      [10] 2638 	ld	hl,#0xC000
   9682 E5            [11] 2639 	push	hl
   9683 CD 3F 88      [17] 2640 	call	_cpct_getScreenPtr
   9686 4D            [ 4] 2641 	ld	c,l
   9687 44            [ 4] 2642 	ld	b,h
                           2643 ;src/main.c:610: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra 
   9688 DD 66 07      [19] 2644 	ld	h,7 (ix)
   968B DD 6E 06      [19] 2645 	ld	l,6 (ix)
   968E E5            [11] 2646 	push	hl
   968F AF            [ 4] 2647 	xor	a, a
   9690 F5            [11] 2648 	push	af
   9691 33            [ 6] 2649 	inc	sp
   9692 C5            [11] 2650 	push	bc
   9693 CD 65 87      [17] 2651 	call	_cpct_drawSolidBox
   9696 F1            [10] 2652 	pop	af
   9697 F1            [10] 2653 	pop	af
   9698 33            [ 6] 2654 	inc	sp
   9699 18 51         [12] 2655 	jr	00106$
   969B                    2656 00104$:
                           2657 ;src/main.c:612: else if (ancho > 40){
   969B CB 41         [ 8] 2658 	bit	0,c
   969D 28 4D         [12] 2659 	jr	Z,00106$
                           2660 ;src/main.c:614: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   969F DD 66 05      [19] 2661 	ld	h,5 (ix)
   96A2 DD 6E 04      [19] 2662 	ld	l,4 (ix)
   96A5 E5            [11] 2663 	push	hl
   96A6 21 00 C0      [10] 2664 	ld	hl,#0xC000
   96A9 E5            [11] 2665 	push	hl
   96AA CD 3F 88      [17] 2666 	call	_cpct_getScreenPtr
   96AD 4D            [ 4] 2667 	ld	c,l
   96AE 44            [ 4] 2668 	ld	b,h
                           2669 ;src/main.c:615: cpct_drawSolidBox(memptr, 0, 40, alto);  //borra la mitad derecha
   96AF DD 7E 07      [19] 2670 	ld	a,7 (ix)
   96B2 F5            [11] 2671 	push	af
   96B3 33            [ 6] 2672 	inc	sp
   96B4 21 00 28      [10] 2673 	ld	hl,#0x2800
   96B7 E5            [11] 2674 	push	hl
   96B8 C5            [11] 2675 	push	bc
   96B9 CD 65 87      [17] 2676 	call	_cpct_drawSolidBox
   96BC F1            [10] 2677 	pop	af
   96BD F1            [10] 2678 	pop	af
   96BE 33            [ 6] 2679 	inc	sp
                           2680 ;src/main.c:616: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   96BF DD 7E 04      [19] 2681 	ld	a,4 (ix)
   96C2 C6 28         [ 7] 2682 	add	a, #0x28
   96C4 47            [ 4] 2683 	ld	b,a
   96C5 DD 7E 05      [19] 2684 	ld	a,5 (ix)
   96C8 F5            [11] 2685 	push	af
   96C9 33            [ 6] 2686 	inc	sp
   96CA C5            [11] 2687 	push	bc
   96CB 33            [ 6] 2688 	inc	sp
   96CC 21 00 C0      [10] 2689 	ld	hl,#0xC000
   96CF E5            [11] 2690 	push	hl
   96D0 CD 3F 88      [17] 2691 	call	_cpct_getScreenPtr
   96D3 4D            [ 4] 2692 	ld	c,l
   96D4 44            [ 4] 2693 	ld	b,h
                           2694 ;src/main.c:617: cpct_drawSolidBox(memptr, 0, ancho-40, alto);  //borra la mitad izquierda
   96D5 DD 7E 06      [19] 2695 	ld	a,6 (ix)
   96D8 C6 D8         [ 7] 2696 	add	a,#0xD8
   96DA 57            [ 4] 2697 	ld	d,a
   96DB DD 7E 07      [19] 2698 	ld	a,7 (ix)
   96DE F5            [11] 2699 	push	af
   96DF 33            [ 6] 2700 	inc	sp
   96E0 D5            [11] 2701 	push	de
   96E1 33            [ 6] 2702 	inc	sp
   96E2 AF            [ 4] 2703 	xor	a, a
   96E3 F5            [11] 2704 	push	af
   96E4 33            [ 6] 2705 	inc	sp
   96E5 C5            [11] 2706 	push	bc
   96E6 CD 65 87      [17] 2707 	call	_cpct_drawSolidBox
   96E9 F1            [10] 2708 	pop	af
   96EA F1            [10] 2709 	pop	af
   96EB 33            [ 6] 2710 	inc	sp
   96EC                    2711 00106$:
   96EC DD E1         [14] 2712 	pop	ix
   96EE C9            [10] 2713 	ret
                           2714 ;src/main.c:621: void menuInstrucciones(){ // TODO TODO
                           2715 ;	---------------------------------
                           2716 ; Function menuInstrucciones
                           2717 ; ---------------------------------
   96EF                    2718 _menuInstrucciones::
                           2719 ;src/main.c:623: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   96EF 21 50 82      [10] 2720 	ld	hl,#0x8250
   96F2 E5            [11] 2721 	push	hl
   96F3 21 00 1E      [10] 2722 	ld	hl,#0x1E00
   96F6 E5            [11] 2723 	push	hl
   96F7 CD 63 96      [17] 2724 	call	_borrarPantalla
   96FA F1            [10] 2725 	pop	af
                           2726 ;src/main.c:626: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 16, 85); // centrado en horizontal y abajo en vertical
   96FB 21 10 55      [10] 2727 	ld	hl, #0x5510
   96FE E3            [19] 2728 	ex	(sp),hl
   96FF 21 00 C0      [10] 2729 	ld	hl,#0xC000
   9702 E5            [11] 2730 	push	hl
   9703 CD 3F 88      [17] 2731 	call	_cpct_getScreenPtr
   9706 4D            [ 4] 2732 	ld	c,l
   9707 44            [ 4] 2733 	ld	b,h
                           2734 ;src/main.c:627: cpct_drawStringM0("INSTRUCTIONS", memptr, 2, 0);
   9708 21 02 00      [10] 2735 	ld	hl,#0x0002
   970B E5            [11] 2736 	push	hl
   970C C5            [11] 2737 	push	bc
   970D 21 79 97      [10] 2738 	ld	hl,#___str_4
   9710 E5            [11] 2739 	push	hl
   9711 CD 6F 7C      [17] 2740 	call	_cpct_drawStringM0
   9714 21 06 00      [10] 2741 	ld	hl,#6
   9717 39            [11] 2742 	add	hl,sp
   9718 F9            [ 6] 2743 	ld	sp,hl
                           2744 ;src/main.c:629: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 115); // centrado en horizontal y abajo en vertical
   9719 21 08 73      [10] 2745 	ld	hl,#0x7308
   971C E5            [11] 2746 	push	hl
   971D 21 00 C0      [10] 2747 	ld	hl,#0xC000
   9720 E5            [11] 2748 	push	hl
   9721 CD 3F 88      [17] 2749 	call	_cpct_getScreenPtr
   9724 4D            [ 4] 2750 	ld	c,l
   9725 44            [ 4] 2751 	ld	b,h
                           2752 ;src/main.c:630: cpct_drawStringM0("-> <- || TO MOVE", memptr, 2, 0);
   9726 21 02 00      [10] 2753 	ld	hl,#0x0002
   9729 E5            [11] 2754 	push	hl
   972A C5            [11] 2755 	push	bc
   972B 21 86 97      [10] 2756 	ld	hl,#___str_5
   972E E5            [11] 2757 	push	hl
   972F CD 6F 7C      [17] 2758 	call	_cpct_drawStringM0
   9732 21 06 00      [10] 2759 	ld	hl,#6
   9735 39            [11] 2760 	add	hl,sp
   9736 F9            [ 6] 2761 	ld	sp,hl
                           2762 ;src/main.c:632: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 130); // centrado en horizontal y abajo en vertical
   9737 21 04 82      [10] 2763 	ld	hl,#0x8204
   973A E5            [11] 2764 	push	hl
   973B 21 00 C0      [10] 2765 	ld	hl,#0xC000
   973E E5            [11] 2766 	push	hl
   973F CD 3F 88      [17] 2767 	call	_cpct_getScreenPtr
   9742 4D            [ 4] 2768 	ld	c,l
   9743 44            [ 4] 2769 	ld	b,h
                           2770 ;src/main.c:633: cpct_drawStringM0("SPACE BAR TO SHOOT", memptr, 2, 0);
   9744 21 02 00      [10] 2771 	ld	hl,#0x0002
   9747 E5            [11] 2772 	push	hl
   9748 C5            [11] 2773 	push	bc
   9749 21 97 97      [10] 2774 	ld	hl,#___str_6
   974C E5            [11] 2775 	push	hl
   974D CD 6F 7C      [17] 2776 	call	_cpct_drawStringM0
   9750 21 06 00      [10] 2777 	ld	hl,#6
   9753 39            [11] 2778 	add	hl,sp
   9754 F9            [ 6] 2779 	ld	sp,hl
                           2780 ;src/main.c:635: do{
   9755                    2781 00104$:
                           2782 ;src/main.c:636: cpct_scanKeyboard_f(); 
   9755 CD 05 7C      [17] 2783 	call	_cpct_scanKeyboard_f
                           2784 ;src/main.c:637: if(cpct_isKeyPressed(Key_M)){
   9758 21 04 40      [10] 2785 	ld	hl,#0x4004
   975B CD F9 7B      [17] 2786 	call	_cpct_isKeyPressed
   975E 7D            [ 4] 2787 	ld	a,l
   975F B7            [ 4] 2788 	or	a, a
   9760 28 03         [12] 2789 	jr	Z,00105$
                           2790 ;src/main.c:638: menuOpciones();
   9762 CD 89 98      [17] 2791 	call	_menuOpciones
   9765                    2792 00105$:
                           2793 ;src/main.c:641: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   9765 21 07 10      [10] 2794 	ld	hl,#0x1007
   9768 CD F9 7B      [17] 2795 	call	_cpct_isKeyPressed
   976B 7D            [ 4] 2796 	ld	a,l
   976C B7            [ 4] 2797 	or	a, a
   976D C0            [11] 2798 	ret	NZ
   976E 21 04 40      [10] 2799 	ld	hl,#0x4004
   9771 CD F9 7B      [17] 2800 	call	_cpct_isKeyPressed
   9774 7D            [ 4] 2801 	ld	a,l
   9775 B7            [ 4] 2802 	or	a, a
   9776 28 DD         [12] 2803 	jr	Z,00104$
   9778 C9            [10] 2804 	ret
   9779                    2805 ___str_4:
   9779 49 4E 53 54 52 55  2806 	.ascii "INSTRUCTIONS"
        43 54 49 4F 4E 53
   9785 00                 2807 	.db 0x00
   9786                    2808 ___str_5:
   9786 2D 3E 20 3C 2D 20  2809 	.ascii "-> <- || TO MOVE"
        7C 7C 20 54 4F 20
        4D 4F 56 45
   9796 00                 2810 	.db 0x00
   9797                    2811 ___str_6:
   9797 53 50 41 43 45 20  2812 	.ascii "SPACE BAR TO SHOOT"
        42 41 52 20 54 4F
        20 53 48 4F 4F 54
   97A9 00                 2813 	.db 0x00
                           2814 ;src/main.c:644: void menuCreditos(){ // TODO TODO
                           2815 ;	---------------------------------
                           2816 ; Function menuCreditos
                           2817 ; ---------------------------------
   97AA                    2818 _menuCreditos::
                           2819 ;src/main.c:646: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   97AA 21 50 82      [10] 2820 	ld	hl,#0x8250
   97AD E5            [11] 2821 	push	hl
   97AE 21 00 1E      [10] 2822 	ld	hl,#0x1E00
   97B1 E5            [11] 2823 	push	hl
   97B2 CD 63 96      [17] 2824 	call	_borrarPantalla
   97B5 F1            [10] 2825 	pop	af
                           2826 ;src/main.c:649: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 70); // centrado en horizontal y abajo en vertical
   97B6 21 1A 46      [10] 2827 	ld	hl, #0x461A
   97B9 E3            [19] 2828 	ex	(sp),hl
   97BA 21 00 C0      [10] 2829 	ld	hl,#0xC000
   97BD E5            [11] 2830 	push	hl
   97BE CD 3F 88      [17] 2831 	call	_cpct_getScreenPtr
   97C1 4D            [ 4] 2832 	ld	c,l
   97C2 44            [ 4] 2833 	ld	b,h
                           2834 ;src/main.c:650: cpct_drawStringM0("CREDITS", memptr, 2, 0);
   97C3 21 02 00      [10] 2835 	ld	hl,#0x0002
   97C6 E5            [11] 2836 	push	hl
   97C7 C5            [11] 2837 	push	bc
   97C8 21 52 98      [10] 2838 	ld	hl,#___str_7
   97CB E5            [11] 2839 	push	hl
   97CC CD 6F 7C      [17] 2840 	call	_cpct_drawStringM0
   97CF 21 06 00      [10] 2841 	ld	hl,#6
   97D2 39            [11] 2842 	add	hl,sp
   97D3 F9            [ 6] 2843 	ld	sp,hl
                           2844 ;src/main.c:652: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 100); // centrado en horizontal y abajo en vertical
   97D4 21 0A 64      [10] 2845 	ld	hl,#0x640A
   97D7 E5            [11] 2846 	push	hl
   97D8 21 00 C0      [10] 2847 	ld	hl,#0xC000
   97DB E5            [11] 2848 	push	hl
   97DC CD 3F 88      [17] 2849 	call	_cpct_getScreenPtr
   97DF 4D            [ 4] 2850 	ld	c,l
   97E0 44            [ 4] 2851 	ld	b,h
                           2852 ;src/main.c:653: cpct_drawStringM0("Cristina Rivera", memptr, 2, 0);
   97E1 21 02 00      [10] 2853 	ld	hl,#0x0002
   97E4 E5            [11] 2854 	push	hl
   97E5 C5            [11] 2855 	push	bc
   97E6 21 5A 98      [10] 2856 	ld	hl,#___str_8
   97E9 E5            [11] 2857 	push	hl
   97EA CD 6F 7C      [17] 2858 	call	_cpct_drawStringM0
   97ED 21 06 00      [10] 2859 	ld	hl,#6
   97F0 39            [11] 2860 	add	hl,sp
   97F1 F9            [ 6] 2861 	ld	sp,hl
                           2862 ;src/main.c:655: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // centrado en horizontal y abajo en vertical
   97F2 21 0E 73      [10] 2863 	ld	hl,#0x730E
   97F5 E5            [11] 2864 	push	hl
   97F6 21 00 C0      [10] 2865 	ld	hl,#0xC000
   97F9 E5            [11] 2866 	push	hl
   97FA CD 3F 88      [17] 2867 	call	_cpct_getScreenPtr
   97FD 4D            [ 4] 2868 	ld	c,l
   97FE 44            [ 4] 2869 	ld	b,h
                           2870 ;src/main.c:656: cpct_drawStringM0("Miguel Sancho", memptr, 2, 0);
   97FF 21 02 00      [10] 2871 	ld	hl,#0x0002
   9802 E5            [11] 2872 	push	hl
   9803 C5            [11] 2873 	push	bc
   9804 21 6A 98      [10] 2874 	ld	hl,#___str_9
   9807 E5            [11] 2875 	push	hl
   9808 CD 6F 7C      [17] 2876 	call	_cpct_drawStringM0
   980B 21 06 00      [10] 2877 	ld	hl,#6
   980E 39            [11] 2878 	add	hl,sp
   980F F9            [ 6] 2879 	ld	sp,hl
                           2880 ;src/main.c:658: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 130); // centrado en horizontal y abajo en vertical
   9810 21 08 82      [10] 2881 	ld	hl,#0x8208
   9813 E5            [11] 2882 	push	hl
   9814 21 00 C0      [10] 2883 	ld	hl,#0xC000
   9817 E5            [11] 2884 	push	hl
   9818 CD 3F 88      [17] 2885 	call	_cpct_getScreenPtr
   981B 4D            [ 4] 2886 	ld	c,l
   981C 44            [ 4] 2887 	ld	b,h
                           2888 ;src/main.c:659: cpct_drawStringM0("Fernando Verdejo", memptr, 2, 0);
   981D 21 02 00      [10] 2889 	ld	hl,#0x0002
   9820 E5            [11] 2890 	push	hl
   9821 C5            [11] 2891 	push	bc
   9822 21 78 98      [10] 2892 	ld	hl,#___str_10
   9825 E5            [11] 2893 	push	hl
   9826 CD 6F 7C      [17] 2894 	call	_cpct_drawStringM0
   9829 21 06 00      [10] 2895 	ld	hl,#6
   982C 39            [11] 2896 	add	hl,sp
   982D F9            [ 6] 2897 	ld	sp,hl
                           2898 ;src/main.c:661: do{
   982E                    2899 00104$:
                           2900 ;src/main.c:662: cpct_scanKeyboard_f(); 
   982E CD 05 7C      [17] 2901 	call	_cpct_scanKeyboard_f
                           2902 ;src/main.c:663: if(cpct_isKeyPressed(Key_M)){
   9831 21 04 40      [10] 2903 	ld	hl,#0x4004
   9834 CD F9 7B      [17] 2904 	call	_cpct_isKeyPressed
   9837 7D            [ 4] 2905 	ld	a,l
   9838 B7            [ 4] 2906 	or	a, a
   9839 28 03         [12] 2907 	jr	Z,00105$
                           2908 ;src/main.c:664: menuOpciones();
   983B CD 89 98      [17] 2909 	call	_menuOpciones
   983E                    2910 00105$:
                           2911 ;src/main.c:667: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   983E 21 07 10      [10] 2912 	ld	hl,#0x1007
   9841 CD F9 7B      [17] 2913 	call	_cpct_isKeyPressed
   9844 7D            [ 4] 2914 	ld	a,l
   9845 B7            [ 4] 2915 	or	a, a
   9846 C0            [11] 2916 	ret	NZ
   9847 21 04 40      [10] 2917 	ld	hl,#0x4004
   984A CD F9 7B      [17] 2918 	call	_cpct_isKeyPressed
   984D 7D            [ 4] 2919 	ld	a,l
   984E B7            [ 4] 2920 	or	a, a
   984F 28 DD         [12] 2921 	jr	Z,00104$
   9851 C9            [10] 2922 	ret
   9852                    2923 ___str_7:
   9852 43 52 45 44 49 54  2924 	.ascii "CREDITS"
        53
   9859 00                 2925 	.db 0x00
   985A                    2926 ___str_8:
   985A 43 72 69 73 74 69  2927 	.ascii "Cristina Rivera"
        6E 61 20 52 69 76
        65 72 61
   9869 00                 2928 	.db 0x00
   986A                    2929 ___str_9:
   986A 4D 69 67 75 65 6C  2930 	.ascii "Miguel Sancho"
        20 53 61 6E 63 68
        6F
   9877 00                 2931 	.db 0x00
   9878                    2932 ___str_10:
   9878 46 65 72 6E 61 6E  2933 	.ascii "Fernando Verdejo"
        64 6F 20 56 65 72
        64 65 6A 6F
   9888 00                 2934 	.db 0x00
                           2935 ;src/main.c:671: void menuOpciones(){ // TODO TODO
                           2936 ;	---------------------------------
                           2937 ; Function menuOpciones
                           2938 ; ---------------------------------
   9889                    2939 _menuOpciones::
                           2940 ;src/main.c:673: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   9889 21 50 82      [10] 2941 	ld	hl,#0x8250
   988C E5            [11] 2942 	push	hl
   988D 21 00 1E      [10] 2943 	ld	hl,#0x1E00
   9890 E5            [11] 2944 	push	hl
   9891 CD 63 96      [17] 2945 	call	_borrarPantalla
   9894 F1            [10] 2946 	pop	af
                           2947 ;src/main.c:676: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 100); // centrado en horizontal y abajo en vertical
   9895 21 20 64      [10] 2948 	ld	hl, #0x6420
   9898 E3            [19] 2949 	ex	(sp),hl
   9899 21 00 C0      [10] 2950 	ld	hl,#0xC000
   989C E5            [11] 2951 	push	hl
   989D CD 3F 88      [17] 2952 	call	_cpct_getScreenPtr
   98A0 4D            [ 4] 2953 	ld	c,l
   98A1 44            [ 4] 2954 	ld	b,h
                           2955 ;src/main.c:677: cpct_drawStringM0("MENU", memptr, 2, 0);
   98A2 21 02 00      [10] 2956 	ld	hl,#0x0002
   98A5 E5            [11] 2957 	push	hl
   98A6 C5            [11] 2958 	push	bc
   98A7 21 2A 99      [10] 2959 	ld	hl,#___str_11
   98AA E5            [11] 2960 	push	hl
   98AB CD 6F 7C      [17] 2961 	call	_cpct_drawStringM0
   98AE 21 06 00      [10] 2962 	ld	hl,#6
   98B1 39            [11] 2963 	add	hl,sp
   98B2 F9            [ 6] 2964 	ld	sp,hl
                           2965 ;src/main.c:679: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 130); // centrado en horizontal y abajo en vertical
   98B3 21 00 82      [10] 2966 	ld	hl,#0x8200
   98B6 E5            [11] 2967 	push	hl
   98B7 26 C0         [ 7] 2968 	ld	h, #0xC0
   98B9 E5            [11] 2969 	push	hl
   98BA CD 3F 88      [17] 2970 	call	_cpct_getScreenPtr
   98BD 4D            [ 4] 2971 	ld	c,l
   98BE 44            [ 4] 2972 	ld	b,h
                           2973 ;src/main.c:680: cpct_drawStringM0("INSTRUCTIONS PRESS I", memptr, 2, 0);
   98BF 21 02 00      [10] 2974 	ld	hl,#0x0002
   98C2 E5            [11] 2975 	push	hl
   98C3 C5            [11] 2976 	push	bc
   98C4 21 2F 99      [10] 2977 	ld	hl,#___str_12
   98C7 E5            [11] 2978 	push	hl
   98C8 CD 6F 7C      [17] 2979 	call	_cpct_drawStringM0
   98CB 21 06 00      [10] 2980 	ld	hl,#6
   98CE 39            [11] 2981 	add	hl,sp
   98CF F9            [ 6] 2982 	ld	sp,hl
                           2983 ;src/main.c:682: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 145); // centrado en horizontal y abajo en vertical
   98D0 21 0A 91      [10] 2984 	ld	hl,#0x910A
   98D3 E5            [11] 2985 	push	hl
   98D4 21 00 C0      [10] 2986 	ld	hl,#0xC000
   98D7 E5            [11] 2987 	push	hl
   98D8 CD 3F 88      [17] 2988 	call	_cpct_getScreenPtr
   98DB 4D            [ 4] 2989 	ld	c,l
   98DC 44            [ 4] 2990 	ld	b,h
                           2991 ;src/main.c:683: cpct_drawStringM0("CREDITS PRESS C", memptr, 2, 0);
   98DD 21 02 00      [10] 2992 	ld	hl,#0x0002
   98E0 E5            [11] 2993 	push	hl
   98E1 C5            [11] 2994 	push	bc
   98E2 21 44 99      [10] 2995 	ld	hl,#___str_13
   98E5 E5            [11] 2996 	push	hl
   98E6 CD 6F 7C      [17] 2997 	call	_cpct_drawStringM0
   98E9 21 06 00      [10] 2998 	ld	hl,#6
   98EC 39            [11] 2999 	add	hl,sp
   98ED F9            [ 6] 3000 	ld	sp,hl
                           3001 ;src/main.c:685: do{
   98EE                    3002 00108$:
                           3003 ;src/main.c:686: cpct_scanKeyboard_f(); 
   98EE CD 05 7C      [17] 3004 	call	_cpct_scanKeyboard_f
                           3005 ;src/main.c:691: if(cpct_isKeyPressed(Key_I)){
   98F1 21 04 08      [10] 3006 	ld	hl,#0x0804
   98F4 CD F9 7B      [17] 3007 	call	_cpct_isKeyPressed
   98F7 7D            [ 4] 3008 	ld	a,l
   98F8 B7            [ 4] 3009 	or	a, a
   98F9 28 05         [12] 3010 	jr	Z,00104$
                           3011 ;src/main.c:692: menuInstrucciones();
   98FB CD EF 96      [17] 3012 	call	_menuInstrucciones
   98FE 18 0D         [12] 3013 	jr	00109$
   9900                    3014 00104$:
                           3015 ;src/main.c:696: else if(cpct_isKeyPressed(Key_C)){
   9900 21 07 40      [10] 3016 	ld	hl,#0x4007
   9903 CD F9 7B      [17] 3017 	call	_cpct_isKeyPressed
   9906 7D            [ 4] 3018 	ld	a,l
   9907 B7            [ 4] 3019 	or	a, a
   9908 28 03         [12] 3020 	jr	Z,00109$
                           3021 ;src/main.c:697: menuCreditos();
   990A CD AA 97      [17] 3022 	call	_menuCreditos
   990D                    3023 00109$:
                           3024 ;src/main.c:705: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_I) && !cpct_isKeyPressed(Key_C));
   990D 21 07 10      [10] 3025 	ld	hl,#0x1007
   9910 CD F9 7B      [17] 3026 	call	_cpct_isKeyPressed
   9913 7D            [ 4] 3027 	ld	a,l
   9914 B7            [ 4] 3028 	or	a, a
   9915 C0            [11] 3029 	ret	NZ
   9916 21 04 08      [10] 3030 	ld	hl,#0x0804
   9919 CD F9 7B      [17] 3031 	call	_cpct_isKeyPressed
   991C 7D            [ 4] 3032 	ld	a,l
   991D B7            [ 4] 3033 	or	a, a
   991E C0            [11] 3034 	ret	NZ
   991F 21 07 40      [10] 3035 	ld	hl,#0x4007
   9922 CD F9 7B      [17] 3036 	call	_cpct_isKeyPressed
   9925 7D            [ 4] 3037 	ld	a,l
   9926 B7            [ 4] 3038 	or	a, a
   9927 28 C5         [12] 3039 	jr	Z,00108$
   9929 C9            [10] 3040 	ret
   992A                    3041 ___str_11:
   992A 4D 45 4E 55        3042 	.ascii "MENU"
   992E 00                 3043 	.db 0x00
   992F                    3044 ___str_12:
   992F 49 4E 53 54 52 55  3045 	.ascii "INSTRUCTIONS PRESS I"
        43 54 49 4F 4E 53
        20 50 52 45 53 53
        20 49
   9943 00                 3046 	.db 0x00
   9944                    3047 ___str_13:
   9944 43 52 45 44 49 54  3048 	.ascii "CREDITS PRESS C"
        53 20 50 52 45 53
        53 20 43
   9953 00                 3049 	.db 0x00
                           3050 ;src/main.c:708: void menuInicio(){
                           3051 ;	---------------------------------
                           3052 ; Function menuInicio
                           3053 ; ---------------------------------
   9954                    3054 _menuInicio::
                           3055 ;src/main.c:712: cpct_clearScreen(0);
   9954 21 00 40      [10] 3056 	ld	hl,#0x4000
   9957 E5            [11] 3057 	push	hl
   9958 AF            [ 4] 3058 	xor	a, a
   9959 F5            [11] 3059 	push	af
   995A 33            [ 6] 3060 	inc	sp
   995B 26 C0         [ 7] 3061 	ld	h, #0xC0
   995D E5            [11] 3062 	push	hl
   995E CD 1E 7F      [17] 3063 	call	_cpct_memset
                           3064 ;src/main.c:714: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   9961 21 1A 0F      [10] 3065 	ld	hl,#0x0F1A
   9964 E5            [11] 3066 	push	hl
   9965 21 00 C0      [10] 3067 	ld	hl,#0xC000
   9968 E5            [11] 3068 	push	hl
   9969 CD 3F 88      [17] 3069 	call	_cpct_getScreenPtr
   996C 4D            [ 4] 3070 	ld	c,l
   996D 44            [ 4] 3071 	ld	b,h
                           3072 ;src/main.c:715: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   996E 21 04 00      [10] 3073 	ld	hl,#0x0004
   9971 E5            [11] 3074 	push	hl
   9972 C5            [11] 3075 	push	bc
   9973 21 0A 9A      [10] 3076 	ld	hl,#___str_14
   9976 E5            [11] 3077 	push	hl
   9977 CD 6F 7C      [17] 3078 	call	_cpct_drawStringM0
   997A 21 06 00      [10] 3079 	ld	hl,#6
   997D 39            [11] 3080 	add	hl,sp
   997E F9            [ 6] 3081 	ld	sp,hl
                           3082 ;src/main.c:717: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   997F 21 28 6E      [10] 3083 	ld	hl,#0x6E28
   9982 E5            [11] 3084 	push	hl
   9983 21 F0 F0      [10] 3085 	ld	hl,#0xF0F0
   9986 E5            [11] 3086 	push	hl
   9987 21 00 56      [10] 3087 	ld	hl,#_g_text_0
   998A E5            [11] 3088 	push	hl
   998B CD 93 7C      [17] 3089 	call	_cpct_drawSprite
                           3090 ;src/main.c:718: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   998E 21 28 6E      [10] 3091 	ld	hl,#0x6E28
   9991 E5            [11] 3092 	push	hl
   9992 21 18 F1      [10] 3093 	ld	hl,#0xF118
   9995 E5            [11] 3094 	push	hl
   9996 21 30 67      [10] 3095 	ld	hl,#_g_text_1
   9999 E5            [11] 3096 	push	hl
   999A CD 93 7C      [17] 3097 	call	_cpct_drawSprite
                           3098 ;src/main.c:720: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   999D 21 08 A0      [10] 3099 	ld	hl,#0xA008
   99A0 E5            [11] 3100 	push	hl
   99A1 21 00 C0      [10] 3101 	ld	hl,#0xC000
   99A4 E5            [11] 3102 	push	hl
   99A5 CD 3F 88      [17] 3103 	call	_cpct_getScreenPtr
   99A8 4D            [ 4] 3104 	ld	c,l
   99A9 44            [ 4] 3105 	ld	b,h
                           3106 ;src/main.c:721: cpct_drawStringM0("TO START PRESS S", memptr, 2, 0);
   99AA 21 02 00      [10] 3107 	ld	hl,#0x0002
   99AD E5            [11] 3108 	push	hl
   99AE C5            [11] 3109 	push	bc
   99AF 21 12 9A      [10] 3110 	ld	hl,#___str_15
   99B2 E5            [11] 3111 	push	hl
   99B3 CD 6F 7C      [17] 3112 	call	_cpct_drawStringM0
   99B6 21 06 00      [10] 3113 	ld	hl,#6
   99B9 39            [11] 3114 	add	hl,sp
   99BA F9            [ 6] 3115 	ld	sp,hl
                           3116 ;src/main.c:723: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 175); // centrado en horizontal y abajo en vertical
   99BB 21 0A AF      [10] 3117 	ld	hl,#0xAF0A
   99BE E5            [11] 3118 	push	hl
   99BF 21 00 C0      [10] 3119 	ld	hl,#0xC000
   99C2 E5            [11] 3120 	push	hl
   99C3 CD 3F 88      [17] 3121 	call	_cpct_getScreenPtr
   99C6 4D            [ 4] 3122 	ld	c,l
   99C7 44            [ 4] 3123 	ld	b,h
                           3124 ;src/main.c:724: cpct_drawStringM0("TO MENU PRESS M", memptr, 2, 0);
   99C8 21 02 00      [10] 3125 	ld	hl,#0x0002
   99CB E5            [11] 3126 	push	hl
   99CC C5            [11] 3127 	push	bc
   99CD 21 23 9A      [10] 3128 	ld	hl,#___str_16
   99D0 E5            [11] 3129 	push	hl
   99D1 CD 6F 7C      [17] 3130 	call	_cpct_drawStringM0
   99D4 21 06 00      [10] 3131 	ld	hl,#6
   99D7 39            [11] 3132 	add	hl,sp
   99D8 F9            [ 6] 3133 	ld	sp,hl
                           3134 ;src/main.c:727: do{
   99D9                    3135 00107$:
                           3136 ;src/main.c:728: cpct_scanKeyboard_f();
   99D9 CD 05 7C      [17] 3137 	call	_cpct_scanKeyboard_f
                           3138 ;src/main.c:732: if(cpct_isKeyPressed(Key_M)){
   99DC 21 04 40      [10] 3139 	ld	hl,#0x4004
   99DF CD F9 7B      [17] 3140 	call	_cpct_isKeyPressed
   99E2 7D            [ 4] 3141 	ld	a,l
   99E3 B7            [ 4] 3142 	or	a, a
   99E4 28 10         [12] 3143 	jr	Z,00108$
                           3144 ;src/main.c:733: cpct_scanKeyboard_f();
   99E6 CD 05 7C      [17] 3145 	call	_cpct_scanKeyboard_f
                           3146 ;src/main.c:734: do{
   99E9                    3147 00101$:
                           3148 ;src/main.c:736: menuOpciones();
   99E9 CD 89 98      [17] 3149 	call	_menuOpciones
                           3150 ;src/main.c:741: } while(!cpct_isKeyPressed(Key_S));
   99EC 21 07 10      [10] 3151 	ld	hl,#0x1007
   99EF CD F9 7B      [17] 3152 	call	_cpct_isKeyPressed
   99F2 7D            [ 4] 3153 	ld	a,l
   99F3 B7            [ 4] 3154 	or	a, a
   99F4 28 F3         [12] 3155 	jr	Z,00101$
   99F6                    3156 00108$:
                           3157 ;src/main.c:743: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   99F6 21 07 10      [10] 3158 	ld	hl,#0x1007
   99F9 CD F9 7B      [17] 3159 	call	_cpct_isKeyPressed
   99FC 7D            [ 4] 3160 	ld	a,l
   99FD B7            [ 4] 3161 	or	a, a
   99FE C0            [11] 3162 	ret	NZ
   99FF 21 04 40      [10] 3163 	ld	hl,#0x4004
   9A02 CD F9 7B      [17] 3164 	call	_cpct_isKeyPressed
   9A05 7D            [ 4] 3165 	ld	a,l
   9A06 B7            [ 4] 3166 	or	a, a
   9A07 28 D0         [12] 3167 	jr	Z,00107$
   9A09 C9            [10] 3168 	ret
   9A0A                    3169 ___str_14:
   9A0A 52 4F 42 4F 42 49  3170 	.ascii "ROBOBIT"
        54
   9A11 00                 3171 	.db 0x00
   9A12                    3172 ___str_15:
   9A12 54 4F 20 53 54 41  3173 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   9A22 00                 3174 	.db 0x00
   9A23                    3175 ___str_16:
   9A23 54 4F 20 4D 45 4E  3176 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   9A32 00                 3177 	.db 0x00
                           3178 ;src/main.c:746: void inicializarCPC() {
                           3179 ;	---------------------------------
                           3180 ; Function inicializarCPC
                           3181 ; ---------------------------------
   9A33                    3182 _inicializarCPC::
                           3183 ;src/main.c:747: cpct_disableFirmware();
   9A33 CD 55 87      [17] 3184 	call	_cpct_disableFirmware
                           3185 ;src/main.c:748: cpct_setVideoMode(0);
   9A36 2E 00         [ 7] 3186 	ld	l,#0x00
   9A38 CD 00 7F      [17] 3187 	call	_cpct_setVideoMode
                           3188 ;src/main.c:750: cpct_setPalette(g_palette, 16);
   9A3B 21 10 00      [10] 3189 	ld	hl,#0x0010
   9A3E E5            [11] 3190 	push	hl
   9A3F 21 98 7A      [10] 3191 	ld	hl,#_g_palette
   9A42 E5            [11] 3192 	push	hl
   9A43 CD E2 7B      [17] 3193 	call	_cpct_setPalette
                           3194 ;src/main.c:751: cpct_akp_musicInit(G_song);
   9A46 21 00 3F      [10] 3195 	ld	hl,#_G_song
   9A49 E5            [11] 3196 	push	hl
   9A4A CD 31 86      [17] 3197 	call	_cpct_akp_musicInit
   9A4D F1            [10] 3198 	pop	af
   9A4E C9            [10] 3199 	ret
                           3200 ;src/main.c:754: void inicializarEnemy() {
                           3201 ;	---------------------------------
                           3202 ; Function inicializarEnemy
                           3203 ; ---------------------------------
   9A4F                    3204 _inicializarEnemy::
   9A4F DD E5         [15] 3205 	push	ix
   9A51 DD 21 00 00   [14] 3206 	ld	ix,#0
   9A55 DD 39         [15] 3207 	add	ix,sp
   9A57 3B            [ 6] 3208 	dec	sp
                           3209 ;src/main.c:755: u8 i = (2 + num_mapa) + 1; //sacar distinto numero dependiendo del mapa
   9A58 3A E4 88      [13] 3210 	ld	a,(#_num_mapa + 0)
   9A5B C6 03         [ 7] 3211 	add	a, #0x03
   9A5D DD 77 FF      [19] 3212 	ld	-1 (ix),a
                           3213 ;src/main.c:760: actual = enemy;
   9A60 11 9C 88      [10] 3214 	ld	de,#_enemy+0
                           3215 ;src/main.c:761: while(--i){
   9A63                    3216 00101$:
   9A63 DD 35 FF      [23] 3217 	dec	-1 (ix)
   9A66 DD 7E FF      [19] 3218 	ld	a,-1 (ix)
   9A69 B7            [ 4] 3219 	or	a, a
   9A6A 28 61         [12] 3220 	jr	Z,00104$
                           3221 ;src/main.c:762: actual->x = actual->px = spawnX[i];
   9A6C 4B            [ 4] 3222 	ld	c, e
   9A6D 42            [ 4] 3223 	ld	b, d
   9A6E 03            [ 6] 3224 	inc	bc
   9A6F 03            [ 6] 3225 	inc	bc
   9A70 3E 01         [ 7] 3226 	ld	a,#<(_spawnX)
   9A72 DD 86 FF      [19] 3227 	add	a, -1 (ix)
   9A75 6F            [ 4] 3228 	ld	l,a
   9A76 3E 89         [ 7] 3229 	ld	a,#>(_spawnX)
   9A78 CE 00         [ 7] 3230 	adc	a, #0x00
   9A7A 67            [ 4] 3231 	ld	h,a
   9A7B 7E            [ 7] 3232 	ld	a,(hl)
   9A7C 02            [ 7] 3233 	ld	(bc),a
   9A7D 12            [ 7] 3234 	ld	(de),a
                           3235 ;src/main.c:763: actual->y = actual->py = spawnY[i];
   9A7E D5            [11] 3236 	push	de
   9A7F FD E1         [14] 3237 	pop	iy
   9A81 FD 23         [10] 3238 	inc	iy
   9A83 4B            [ 4] 3239 	ld	c, e
   9A84 42            [ 4] 3240 	ld	b, d
   9A85 03            [ 6] 3241 	inc	bc
   9A86 03            [ 6] 3242 	inc	bc
   9A87 03            [ 6] 3243 	inc	bc
   9A88 3E 06         [ 7] 3244 	ld	a,#<(_spawnY)
   9A8A DD 86 FF      [19] 3245 	add	a, -1 (ix)
   9A8D 6F            [ 4] 3246 	ld	l,a
   9A8E 3E 89         [ 7] 3247 	ld	a,#>(_spawnY)
   9A90 CE 00         [ 7] 3248 	adc	a, #0x00
   9A92 67            [ 4] 3249 	ld	h,a
   9A93 7E            [ 7] 3250 	ld	a,(hl)
   9A94 02            [ 7] 3251 	ld	(bc),a
   9A95 FD 77 00      [19] 3252 	ld	0 (iy), a
                           3253 ;src/main.c:764: actual->mover  = NO;
   9A98 21 06 00      [10] 3254 	ld	hl,#0x0006
   9A9B 19            [11] 3255 	add	hl,de
   9A9C 36 00         [10] 3256 	ld	(hl),#0x00
                           3257 ;src/main.c:765: actual->mira   = M_abajo;
   9A9E 21 07 00      [10] 3258 	ld	hl,#0x0007
   9AA1 19            [11] 3259 	add	hl,de
   9AA2 36 03         [10] 3260 	ld	(hl),#0x03
                           3261 ;src/main.c:766: actual->sprite = g_enemy;
   9AA4 21 04 00      [10] 3262 	ld	hl,#0x0004
   9AA7 19            [11] 3263 	add	hl,de
   9AA8 36 72         [10] 3264 	ld	(hl),#<(_g_enemy)
   9AAA 23            [ 6] 3265 	inc	hl
   9AAB 36 78         [10] 3266 	ld	(hl),#>(_g_enemy)
                           3267 ;src/main.c:767: actual->muerto = NO;
   9AAD 21 08 00      [10] 3268 	ld	hl,#0x0008
   9AB0 19            [11] 3269 	add	hl,de
   9AB1 36 00         [10] 3270 	ld	(hl),#0x00
                           3271 ;src/main.c:768: actual->muertes = 0;
   9AB3 21 0C 00      [10] 3272 	ld	hl,#0x000C
   9AB6 19            [11] 3273 	add	hl,de
   9AB7 36 00         [10] 3274 	ld	(hl),#0x00
                           3275 ;src/main.c:769: actual->patroling = SI;
   9AB9 21 09 00      [10] 3276 	ld	hl,#0x0009
   9ABC 19            [11] 3277 	add	hl,de
   9ABD 36 01         [10] 3278 	ld	(hl),#0x01
                           3279 ;src/main.c:771: dibujarEnemigo(actual);
   9ABF D5            [11] 3280 	push	de
   9AC0 D5            [11] 3281 	push	de
   9AC1 CD 86 8B      [17] 3282 	call	_dibujarEnemigo
   9AC4 F1            [10] 3283 	pop	af
   9AC5 D1            [10] 3284 	pop	de
                           3285 ;src/main.c:773: ++actual;
   9AC6 21 0D 00      [10] 3286 	ld	hl,#0x000D
   9AC9 19            [11] 3287 	add	hl,de
   9ACA EB            [ 4] 3288 	ex	de,hl
   9ACB 18 96         [12] 3289 	jr	00101$
   9ACD                    3290 00104$:
   9ACD 33            [ 6] 3291 	inc	sp
   9ACE DD E1         [14] 3292 	pop	ix
   9AD0 C9            [10] 3293 	ret
                           3294 ;src/main.c:777: void inicializarJuego() {
                           3295 ;	---------------------------------
                           3296 ; Function inicializarJuego
                           3297 ; ---------------------------------
   9AD1                    3298 _inicializarJuego::
                           3299 ;src/main.c:779: num_mapa = 0;
   9AD1 21 E4 88      [10] 3300 	ld	hl,#_num_mapa + 0
   9AD4 36 00         [10] 3301 	ld	(hl), #0x00
                           3302 ;src/main.c:780: mapa = mapas[num_mapa];
   9AD6 21 FB 88      [10] 3303 	ld	hl, #_mapas + 0
   9AD9 7E            [ 7] 3304 	ld	a,(hl)
   9ADA FD 21 E2 88   [14] 3305 	ld	iy,#_mapa
   9ADE FD 77 00      [19] 3306 	ld	0 (iy),a
   9AE1 23            [ 6] 3307 	inc	hl
   9AE2 7E            [ 7] 3308 	ld	a,(hl)
   9AE3 32 E3 88      [13] 3309 	ld	(#_mapa + 1),a
                           3310 ;src/main.c:781: cpct_etm_setTileset2x4(g_tileset);
   9AE6 21 E0 54      [10] 3311 	ld	hl,#_g_tileset
   9AE9 CD C7 7D      [17] 3312 	call	_cpct_etm_setTileset2x4
                           3313 ;src/main.c:783: dibujarMapa();
   9AEC CD E5 88      [17] 3314 	call	_dibujarMapa
                           3315 ;src/main.c:786: barraPuntuacionInicial();
   9AEF CD C7 95      [17] 3316 	call	_barraPuntuacionInicial
                           3317 ;src/main.c:789: prota.x = prota.px = 4;
   9AF2 21 D2 88      [10] 3318 	ld	hl,#(_prota + 0x0002)
   9AF5 36 04         [10] 3319 	ld	(hl),#0x04
   9AF7 21 D0 88      [10] 3320 	ld	hl,#_prota
   9AFA 36 04         [10] 3321 	ld	(hl),#0x04
                           3322 ;src/main.c:790: prota.y = prota.py = 80 + ORIGEN_MAPA_Y;
   9AFC 21 D3 88      [10] 3323 	ld	hl,#(_prota + 0x0003)
   9AFF 36 68         [10] 3324 	ld	(hl),#0x68
   9B01 21 D1 88      [10] 3325 	ld	hl,#(_prota + 0x0001)
   9B04 36 68         [10] 3326 	ld	(hl),#0x68
                           3327 ;src/main.c:791: prota.mover  = NO;
   9B06 21 D6 88      [10] 3328 	ld	hl,#(_prota + 0x0006)
   9B09 36 00         [10] 3329 	ld	(hl),#0x00
                           3330 ;src/main.c:792: prota.mira=M_derecha;
   9B0B 21 D7 88      [10] 3331 	ld	hl,#(_prota + 0x0007)
   9B0E 36 00         [10] 3332 	ld	(hl),#0x00
                           3333 ;src/main.c:793: prota.sprite = g_hero;
   9B10 21 A8 7A      [10] 3334 	ld	hl,#_g_hero
   9B13 22 D4 88      [16] 3335 	ld	((_prota + 0x0004)), hl
                           3336 ;src/main.c:797: cu.x = cu.px = 0;
   9B16 21 DA 88      [10] 3337 	ld	hl,#(_cu + 0x0002)
   9B19 36 00         [10] 3338 	ld	(hl),#0x00
   9B1B 21 D8 88      [10] 3339 	ld	hl,#_cu
   9B1E 36 00         [10] 3340 	ld	(hl),#0x00
                           3341 ;src/main.c:798: cu.y = cu.py = 0;
   9B20 21 DB 88      [10] 3342 	ld	hl,#(_cu + 0x0003)
   9B23 36 00         [10] 3343 	ld	(hl),#0x00
   9B25 21 D9 88      [10] 3344 	ld	hl,#(_cu + 0x0001)
   9B28 36 00         [10] 3345 	ld	(hl),#0x00
                           3346 ;src/main.c:799: cu.lanzado = NO;
   9B2A 21 DE 88      [10] 3347 	ld	hl,#(_cu + 0x0006)
   9B2D 36 00         [10] 3348 	ld	(hl),#0x00
                           3349 ;src/main.c:800: cu.mover = NO;
   9B2F 21 E1 88      [10] 3350 	ld	hl,#(_cu + 0x0009)
   9B32 36 00         [10] 3351 	ld	(hl),#0x00
                           3352 ;src/main.c:802: inicializarEnemy();
   9B34 CD 4F 9A      [17] 3353 	call	_inicializarEnemy
                           3354 ;src/main.c:804: dibujarProta();
   9B37 C3 0B 89      [10] 3355 	jp  _dibujarProta
                           3356 ;src/main.c:807: void main(void) {
                           3357 ;	---------------------------------
                           3358 ; Function main
                           3359 ; ---------------------------------
   9B3A                    3360 _main::
                           3361 ;src/main.c:811: inicializarCPC();
   9B3A CD 33 9A      [17] 3362 	call	_inicializarCPC
                           3363 ;src/main.c:812: menuInicio();
   9B3D CD 54 99      [17] 3364 	call	_menuInicio
                           3365 ;src/main.c:814: inicializarJuego();
   9B40 CD D1 9A      [17] 3366 	call	_inicializarJuego
                           3367 ;src/main.c:815: cpct_akp_musicPlay();
   9B43 CD 2E 7F      [17] 3368 	call	_cpct_akp_musicPlay
                           3369 ;src/main.c:817: while (1) {
   9B46                    3370 00122$:
                           3371 ;src/main.c:819: i = (2 + num_mapa) + 1;
   9B46 21 E4 88      [10] 3372 	ld	hl,#_num_mapa + 0
   9B49 4E            [ 7] 3373 	ld	c, (hl)
   9B4A 0C            [ 4] 3374 	inc	c
   9B4B 0C            [ 4] 3375 	inc	c
   9B4C 0C            [ 4] 3376 	inc	c
                           3377 ;src/main.c:820: actual = enemy;
                           3378 ;src/main.c:822: comprobarTeclado();
   9B4D C5            [11] 3379 	push	bc
   9B4E CD BF 94      [17] 3380 	call	_comprobarTeclado
   9B51 CD 22 95      [17] 3381 	call	_moverCuchillo
   9B54 C1            [10] 3382 	pop	bc
                           3383 ;src/main.c:825: while(--i){
   9B55 11 9C 88      [10] 3384 	ld	de,#_enemy
   9B58                    3385 00101$:
   9B58 0D            [ 4] 3386 	dec c
   9B59 28 11         [12] 3387 	jr	Z,00103$
                           3388 ;src/main.c:826: moverEnemigo(actual);
   9B5B C5            [11] 3389 	push	bc
   9B5C D5            [11] 3390 	push	de
   9B5D D5            [11] 3391 	push	de
   9B5E CD 5B 91      [17] 3392 	call	_moverEnemigo
   9B61 F1            [10] 3393 	pop	af
   9B62 D1            [10] 3394 	pop	de
   9B63 C1            [10] 3395 	pop	bc
                           3396 ;src/main.c:827: ++actual;
   9B64 21 0D 00      [10] 3397 	ld	hl,#0x000D
   9B67 19            [11] 3398 	add	hl,de
   9B68 5D            [ 4] 3399 	ld	e,l
   9B69 54            [ 4] 3400 	ld	d,h
   9B6A 18 EC         [12] 3401 	jr	00101$
   9B6C                    3402 00103$:
                           3403 ;src/main.c:830: actual = enemy;
   9B6C 01 9C 88      [10] 3404 	ld	bc,#_enemy
                           3405 ;src/main.c:832: cpct_waitVSYNC();
   9B6F C5            [11] 3406 	push	bc
   9B70 CD F8 7E      [17] 3407 	call	_cpct_waitVSYNC
   9B73 C1            [10] 3408 	pop	bc
                           3409 ;src/main.c:834: if (prota.mover) {
   9B74 11 D6 88      [10] 3410 	ld	de,#_prota+6
   9B77 1A            [ 7] 3411 	ld	a,(de)
   9B78 B7            [ 4] 3412 	or	a, a
   9B79 28 09         [12] 3413 	jr	Z,00105$
                           3414 ;src/main.c:835: redibujarProta();
   9B7B C5            [11] 3415 	push	bc
   9B7C D5            [11] 3416 	push	de
   9B7D CD DC 89      [17] 3417 	call	_redibujarProta
   9B80 D1            [10] 3418 	pop	de
   9B81 C1            [10] 3419 	pop	bc
                           3420 ;src/main.c:836: prota.mover = NO;
   9B82 AF            [ 4] 3421 	xor	a, a
   9B83 12            [ 7] 3422 	ld	(de),a
   9B84                    3423 00105$:
                           3424 ;src/main.c:838: if(cu.lanzado && cu.mover){
   9B84 21 DE 88      [10] 3425 	ld	hl,#_cu + 6
   9B87 5E            [ 7] 3426 	ld	e,(hl)
   9B88 21 E1 88      [10] 3427 	ld	hl,#_cu + 9
   9B8B 7B            [ 4] 3428 	ld	a,e
   9B8C B7            [ 4] 3429 	or	a, a
   9B8D 28 0B         [12] 3430 	jr	Z,00110$
   9B8F 7E            [ 7] 3431 	ld	a,(hl)
   9B90 B7            [ 4] 3432 	or	a, a
   9B91 28 07         [12] 3433 	jr	Z,00110$
                           3434 ;src/main.c:839: redibujarCuchillo();
   9B93 C5            [11] 3435 	push	bc
   9B94 CD 8F 93      [17] 3436 	call	_redibujarCuchillo
   9B97 C1            [10] 3437 	pop	bc
   9B98 18 0D         [12] 3438 	jr	00137$
   9B9A                    3439 00110$:
                           3440 ;src/main.c:840: }else if (cu.lanzado && !cu.mover){
   9B9A 7B            [ 4] 3441 	ld	a,e
   9B9B B7            [ 4] 3442 	or	a, a
   9B9C 28 09         [12] 3443 	jr	Z,00137$
   9B9E 7E            [ 7] 3444 	ld	a,(hl)
   9B9F B7            [ 4] 3445 	or	a, a
   9BA0 20 05         [12] 3446 	jr	NZ,00137$
                           3447 ;src/main.c:841: borrarCuchillo();
   9BA2 C5            [11] 3448 	push	bc
   9BA3 CD 11 93      [17] 3449 	call	_borrarCuchillo
   9BA6 C1            [10] 3450 	pop	bc
                           3451 ;src/main.c:844: while(--i){
   9BA7                    3452 00137$:
   9BA7 1E 05         [ 7] 3453 	ld	e,#0x05
   9BA9                    3454 00118$:
   9BA9 1D            [ 4] 3455 	dec	e
   9BAA 7B            [ 4] 3456 	ld	a,e
   9BAB B7            [ 4] 3457 	or	a, a
   9BAC 28 49         [12] 3458 	jr	Z,00120$
                           3459 ;src/main.c:845: if(actual->mover){
   9BAE C5            [11] 3460 	push	bc
   9BAF FD E1         [14] 3461 	pop	iy
   9BB1 FD 7E 06      [19] 3462 	ld	a,6 (iy)
   9BB4 B7            [ 4] 3463 	or	a, a
   9BB5 28 09         [12] 3464 	jr	Z,00114$
                           3465 ;src/main.c:846: redibujarEnemigo(actual);
   9BB7 C5            [11] 3466 	push	bc
   9BB8 D5            [11] 3467 	push	de
   9BB9 C5            [11] 3468 	push	bc
   9BBA CD FA 8C      [17] 3469 	call	_redibujarEnemigo
   9BBD F1            [10] 3470 	pop	af
   9BBE D1            [10] 3471 	pop	de
   9BBF C1            [10] 3472 	pop	bc
   9BC0                    3473 00114$:
                           3474 ;src/main.c:848: if (actual->muerto && actual->muertes == 0){
   9BC0 C5            [11] 3475 	push	bc
   9BC1 FD E1         [14] 3476 	pop	iy
   9BC3 FD 7E 08      [19] 3477 	ld	a,8 (iy)
   9BC6 B7            [ 4] 3478 	or	a, a
   9BC7 28 26         [12] 3479 	jr	Z,00116$
   9BC9 21 0C 00      [10] 3480 	ld	hl,#0x000C
   9BCC 09            [11] 3481 	add	hl,bc
   9BCD 7E            [ 7] 3482 	ld	a,(hl)
   9BCE B7            [ 4] 3483 	or	a, a
   9BCF 20 1E         [12] 3484 	jr	NZ,00116$
                           3485 ;src/main.c:849: borrarEnemigo(actual);
   9BD1 E5            [11] 3486 	push	hl
   9BD2 C5            [11] 3487 	push	bc
   9BD3 D5            [11] 3488 	push	de
   9BD4 C5            [11] 3489 	push	bc
   9BD5 CD 66 8C      [17] 3490 	call	_borrarEnemigo
   9BD8 F1            [10] 3491 	pop	af
   9BD9 D1            [10] 3492 	pop	de
   9BDA C1            [10] 3493 	pop	bc
   9BDB C5            [11] 3494 	push	bc
   9BDC D5            [11] 3495 	push	de
   9BDD C5            [11] 3496 	push	bc
   9BDE CD BE 8B      [17] 3497 	call	_dibujarExplosion
   9BE1 F1            [10] 3498 	pop	af
   9BE2 D1            [10] 3499 	pop	de
   9BE3 C1            [10] 3500 	pop	bc
   9BE4 E1            [10] 3501 	pop	hl
                           3502 ;src/main.c:852: actual->muertes++;
   9BE5 56            [ 7] 3503 	ld	d,(hl)
   9BE6 14            [ 4] 3504 	inc	d
   9BE7 72            [ 7] 3505 	ld	(hl),d
                           3506 ;src/main.c:853: actual->x = 0;
   9BE8 AF            [ 4] 3507 	xor	a, a
   9BE9 02            [ 7] 3508 	ld	(bc),a
                           3509 ;src/main.c:854: actual->y = 0;
   9BEA 69            [ 4] 3510 	ld	l, c
   9BEB 60            [ 4] 3511 	ld	h, b
   9BEC 23            [ 6] 3512 	inc	hl
   9BED 36 00         [10] 3513 	ld	(hl),#0x00
   9BEF                    3514 00116$:
                           3515 ;src/main.c:856: ++actual;
   9BEF 21 0D 00      [10] 3516 	ld	hl,#0x000D
   9BF2 09            [11] 3517 	add	hl,bc
   9BF3 4D            [ 4] 3518 	ld	c,l
   9BF4 44            [ 4] 3519 	ld	b,h
   9BF5 18 B2         [12] 3520 	jr	00118$
   9BF7                    3521 00120$:
                           3522 ;src/main.c:858: cpct_waitVSYNC();
   9BF7 CD F8 7E      [17] 3523 	call	_cpct_waitVSYNC
   9BFA C3 46 9B      [10] 3524 	jp	00122$
                           3525 	.area _CODE
                           3526 	.area _INITIALIZER
                           3527 	.area _CABS (ABS)
   3F00                    3528 	.org 0x3F00
   3F00                    3529 _G_song:
   3F00 41                 3530 	.db #0x41	; 65	'A'
   3F01 54                 3531 	.db #0x54	; 84	'T'
   3F02 31                 3532 	.db #0x31	; 49	'1'
   3F03 30                 3533 	.db #0x30	; 48	'0'
   3F04 01                 3534 	.db #0x01	; 1
   3F05 40                 3535 	.db #0x40	; 64
   3F06 42                 3536 	.db #0x42	; 66	'B'
   3F07 0F                 3537 	.db #0x0F	; 15
   3F08 02                 3538 	.db #0x02	; 2
   3F09 06                 3539 	.db #0x06	; 6
   3F0A 1D                 3540 	.db #0x1D	; 29
   3F0B 00                 3541 	.db #0x00	; 0
   3F0C 10                 3542 	.db #0x10	; 16
   3F0D 40                 3543 	.db #0x40	; 64
   3F0E 19                 3544 	.db #0x19	; 25
   3F0F 40                 3545 	.db #0x40	; 64
   3F10 00                 3546 	.db #0x00	; 0
   3F11 00                 3547 	.db #0x00	; 0
   3F12 00                 3548 	.db #0x00	; 0
   3F13 00                 3549 	.db #0x00	; 0
   3F14 00                 3550 	.db #0x00	; 0
   3F15 00                 3551 	.db #0x00	; 0
   3F16 0D                 3552 	.db #0x0D	; 13
   3F17 12                 3553 	.db #0x12	; 18
   3F18 40                 3554 	.db #0x40	; 64
   3F19 01                 3555 	.db #0x01	; 1
   3F1A 00                 3556 	.db #0x00	; 0
   3F1B 7C                 3557 	.db #0x7C	; 124
   3F1C 18                 3558 	.db #0x18	; 24
   3F1D 78                 3559 	.db #0x78	; 120	'x'
   3F1E 0C                 3560 	.db #0x0C	; 12
   3F1F 34                 3561 	.db #0x34	; 52	'4'
   3F20 30                 3562 	.db #0x30	; 48	'0'
   3F21 2C                 3563 	.db #0x2C	; 44
   3F22 28                 3564 	.db #0x28	; 40
   3F23 24                 3565 	.db #0x24	; 36
   3F24 20                 3566 	.db #0x20	; 32
   3F25 1C                 3567 	.db #0x1C	; 28
   3F26 0D                 3568 	.db #0x0D	; 13
   3F27 25                 3569 	.db #0x25	; 37
   3F28 40                 3570 	.db #0x40	; 64
   3F29 20                 3571 	.db #0x20	; 32
   3F2A 00                 3572 	.db #0x00	; 0
   3F2B 00                 3573 	.db #0x00	; 0
   3F2C 00                 3574 	.db #0x00	; 0
   3F2D 39                 3575 	.db #0x39	; 57	'9'
   3F2E 40                 3576 	.db #0x40	; 64
   3F2F 00                 3577 	.db #0x00	; 0
   3F30 57                 3578 	.db #0x57	; 87	'W'
   3F31 40                 3579 	.db #0x40	; 64
   3F32 3B                 3580 	.db #0x3B	; 59
   3F33 40                 3581 	.db #0x40	; 64
   3F34 57                 3582 	.db #0x57	; 87	'W'
   3F35 40                 3583 	.db #0x40	; 64
   3F36 01                 3584 	.db #0x01	; 1
   3F37 2F                 3585 	.db #0x2F	; 47
   3F38 40                 3586 	.db #0x40	; 64
   3F39 19                 3587 	.db #0x19	; 25
   3F3A 00                 3588 	.db #0x00	; 0
   3F3B 76                 3589 	.db #0x76	; 118	'v'
   3F3C E1                 3590 	.db #0xE1	; 225
   3F3D 00                 3591 	.db #0x00	; 0
   3F3E 00                 3592 	.db #0x00	; 0
   3F3F 01                 3593 	.db #0x01	; 1
   3F40 04                 3594 	.db #0x04	; 4
   3F41 51                 3595 	.db #0x51	; 81	'Q'
   3F42 04                 3596 	.db #0x04	; 4
   3F43 37                 3597 	.db #0x37	; 55	'7'
   3F44 04                 3598 	.db #0x04	; 4
   3F45 4F                 3599 	.db #0x4F	; 79	'O'
   3F46 04                 3600 	.db #0x04	; 4
   3F47 37                 3601 	.db #0x37	; 55	'7'
   3F48 02                 3602 	.db #0x02	; 2
   3F49 4B                 3603 	.db #0x4B	; 75	'K'
   3F4A 02                 3604 	.db #0x02	; 2
   3F4B 37                 3605 	.db #0x37	; 55	'7'
   3F4C 04                 3606 	.db #0x04	; 4
   3F4D 4F                 3607 	.db #0x4F	; 79	'O'
   3F4E 04                 3608 	.db #0x04	; 4
   3F4F 37                 3609 	.db #0x37	; 55	'7'
   3F50 04                 3610 	.db #0x04	; 4
   3F51 4F                 3611 	.db #0x4F	; 79	'O'
   3F52 04                 3612 	.db #0x04	; 4
   3F53 37                 3613 	.db #0x37	; 55	'7'
   3F54 02                 3614 	.db #0x02	; 2
   3F55 4B                 3615 	.db #0x4B	; 75	'K'
   3F56 00                 3616 	.db #0x00	; 0
   3F57 42                 3617 	.db #0x42	; 66	'B'
   3F58 60                 3618 	.db #0x60	; 96
   3F59 00                 3619 	.db #0x00	; 0
   3F5A 42                 3620 	.db #0x42	; 66	'B'
   3F5B 80                 3621 	.db #0x80	; 128
   3F5C 00                 3622 	.db #0x00	; 0
   3F5D 00                 3623 	.db #0x00	; 0
   3F5E 42                 3624 	.db #0x42	; 66	'B'
   3F5F 00                 3625 	.db #0x00	; 0
   3F60 00                 3626 	.db #0x00	; 0
