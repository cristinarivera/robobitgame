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
                             17 	.globl _borrarPantallaAbajo
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
                             31 	.globl _patrolDecision
                             32 	.globl _moverEnemigo
                             33 	.globl _moverEnemigoAbajo
                             34 	.globl _moverEnemigoArriba
                             35 	.globl _checkEnemyCollision
                             36 	.globl _redibujarEnemigo
                             37 	.globl _borrarEnemigo
                             38 	.globl _dibujarEnemigo
                             39 	.globl _checkCollision
                             40 	.globl _getTilePtr
                             41 	.globl _redibujarProta
                             42 	.globl _menuFin
                             43 	.globl _borrarProta
                             44 	.globl _dibujarProta
                             45 	.globl _dibujarMapa
                             46 	.globl _cpct_etm_setTileset2x4
                             47 	.globl _cpct_etm_drawTileBox2x4
                             48 	.globl _cpct_getRandom_mxor_u8
                             49 	.globl _cpct_akp_musicPlay
                             50 	.globl _cpct_akp_musicInit
                             51 	.globl _cpct_getScreenPtr
                             52 	.globl _cpct_setPALColour
                             53 	.globl _cpct_setPalette
                             54 	.globl _cpct_waitVSYNC
                             55 	.globl _cpct_setVideoMode
                             56 	.globl _cpct_drawStringM0
                             57 	.globl _cpct_drawSpriteMaskedAlignedTable
                             58 	.globl _cpct_drawSolidBox
                             59 	.globl _cpct_drawSprite
                             60 	.globl _cpct_isAnyKeyPressed
                             61 	.globl _cpct_isKeyPressed
                             62 	.globl _cpct_scanKeyboard_if
                             63 	.globl _cpct_scanKeyboard_f
                             64 	.globl _cpct_memset
                             65 	.globl _cpct_disableFirmware
                             66 	.globl _num_mapa
                             67 	.globl _mapa
                             68 	.globl _cu
                             69 	.globl _prota
                             70 	.globl _enemy
                             71 	.globl _EEje
                             72 	.globl _EMirar
                             73 	.globl _mapas
                             74 ;--------------------------------------------------------
                             75 ; special function registers
                             76 ;--------------------------------------------------------
                             77 ;--------------------------------------------------------
                             78 ; ram data
                             79 ;--------------------------------------------------------
                             80 	.area _DATA
   889A                      81 _EMirar::
   889A                      82 	.ds 1
   889B                      83 _EEje::
   889B                      84 	.ds 1
   889C                      85 _enemy::
   889C                      86 	.ds 40
   88C4                      87 _prota::
   88C4                      88 	.ds 8
   88CC                      89 _cu::
   88CC                      90 	.ds 10
   88D6                      91 _mapa::
   88D6                      92 	.ds 2
   88D8                      93 _num_mapa::
   88D8                      94 	.ds 1
                             95 ;--------------------------------------------------------
                             96 ; ram data
                             97 ;--------------------------------------------------------
                             98 	.area _INITIALIZED
                             99 ;--------------------------------------------------------
                            100 ; absolute external ram data
                            101 ;--------------------------------------------------------
                            102 	.area _DABS (ABS)
                            103 ;--------------------------------------------------------
                            104 ; global & static initialisations
                            105 ;--------------------------------------------------------
                            106 	.area _HOME
                            107 	.area _GSINIT
                            108 	.area _GSFINAL
                            109 	.area _GSINIT
                            110 ;--------------------------------------------------------
                            111 ; Home
                            112 ;--------------------------------------------------------
                            113 	.area _HOME
                            114 	.area _HOME
                            115 ;--------------------------------------------------------
                            116 ; code
                            117 ;--------------------------------------------------------
                            118 	.area _CODE
                            119 ;src/main.c:115: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
                            120 ;	---------------------------------
                            121 ; Function dummy_cpct_transparentMaskTable0M0_container
                            122 ; ---------------------------------
   7AEA                     123 _dummy_cpct_transparentMaskTable0M0_container::
                            124 	.area _g_tablatrans_ (ABS) 
   3E00                     125 	.org 0x3E00 
   3E00                     126 	 _g_tablatrans::
   3E00 FF AA 55 00 AA AA   127 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E08 55 00 55 00 00 00   128 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E10 AA AA 00 00 AA AA   129 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E18 00 00 00 00 00 00   130 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E20 55 00 55 00 00 00   131 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E28 55 00 55 00 00 00   132 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E30 00 00 00 00 00 00   133 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E38 00 00 00 00 00 00   134 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E40 AA AA 00 00 AA AA   135 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E48 00 00 00 00 00 00   136 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E50 AA AA 00 00 AA AA   137 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E58 00 00 00 00 00 00   138 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E60 00 00 00 00 00 00   139 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E68 00 00 00 00 00 00   140 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E70 00 00 00 00 00 00   141 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E78 00 00 00 00 00 00   142 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E80 55 00 55 00 00 00   143 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E88 55 00 55 00 00 00   144 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E90 00 00 00 00 00 00   145 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E98 00 00 00 00 00 00   146 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA0 55 00 55 00 00 00   147 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA8 55 00 55 00 00 00   148 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB0 00 00 00 00 00 00   149 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB8 00 00 00 00 00 00   150 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC0 00 00 00 00 00 00   151 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC8 00 00 00 00 00 00   152 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED0 00 00 00 00 00 00   153 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED8 00 00 00 00 00 00   154 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE0 00 00 00 00 00 00   155 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE8 00 00 00 00 00 00   156 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF0 00 00 00 00 00 00   157 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF8 00 00 00 00 00 00   158 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            159 	.area _CSEG (REL, CON) 
                            160 ;src/main.c:118: void dibujarMapa() {
                            161 ;	---------------------------------
                            162 ; Function dibujarMapa
                            163 ; ---------------------------------
   88D9                     164 _dibujarMapa::
                            165 ;src/main.c:119: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   88D9 2A D6 88      [16]  166 	ld	hl,(_mapa)
   88DC E5            [11]  167 	push	hl
   88DD 21 00 C0      [10]  168 	ld	hl,#0xC000
   88E0 E5            [11]  169 	push	hl
   88E1 21 2C 28      [10]  170 	ld	hl,#0x282C
   88E4 E5            [11]  171 	push	hl
   88E5 2E 00         [ 7]  172 	ld	l, #0x00
   88E7 E5            [11]  173 	push	hl
   88E8 AF            [ 4]  174 	xor	a, a
   88E9 F5            [11]  175 	push	af
   88EA 33            [ 6]  176 	inc	sp
   88EB CD EC 7C      [17]  177 	call	_cpct_etm_drawTileBox2x4
   88EE C9            [10]  178 	ret
   88EF                     179 _mapas:
   88EF C0 4D               180 	.dw _g_map1
   88F1 E0 46               181 	.dw _g_map2
   88F3 00 40               182 	.dw _g_map3
                            183 ;src/main.c:124: void dibujarProta() {
                            184 ;	---------------------------------
                            185 ; Function dibujarProta
                            186 ; ---------------------------------
   88F5                     187 _dibujarProta::
                            188 ;src/main.c:125: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   88F5 21 C5 88      [10]  189 	ld	hl, #_prota + 1
   88F8 56            [ 7]  190 	ld	d,(hl)
   88F9 21 C4 88      [10]  191 	ld	hl, #_prota + 0
   88FC 46            [ 7]  192 	ld	b,(hl)
   88FD D5            [11]  193 	push	de
   88FE 33            [ 6]  194 	inc	sp
   88FF C5            [11]  195 	push	bc
   8900 33            [ 6]  196 	inc	sp
   8901 21 00 C0      [10]  197 	ld	hl,#0xC000
   8904 E5            [11]  198 	push	hl
   8905 CD 18 88      [17]  199 	call	_cpct_getScreenPtr
   8908 EB            [ 4]  200 	ex	de,hl
                            201 ;src/main.c:126: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   8909 ED 4B C8 88   [20]  202 	ld	bc, (#_prota + 4)
   890D 21 00 3E      [10]  203 	ld	hl,#_g_tablatrans
   8910 E5            [11]  204 	push	hl
   8911 21 07 16      [10]  205 	ld	hl,#0x1607
   8914 E5            [11]  206 	push	hl
   8915 D5            [11]  207 	push	de
   8916 C5            [11]  208 	push	bc
   8917 CD 38 88      [17]  209 	call	_cpct_drawSpriteMaskedAlignedTable
   891A C9            [10]  210 	ret
                            211 ;src/main.c:129: void borrarProta() {
                            212 ;	---------------------------------
                            213 ; Function borrarProta
                            214 ; ---------------------------------
   891B                     215 _borrarProta::
   891B DD E5         [15]  216 	push	ix
   891D DD 21 00 00   [14]  217 	ld	ix,#0
   8921 DD 39         [15]  218 	add	ix,sp
   8923 3B            [ 6]  219 	dec	sp
                            220 ;src/main.c:131: u8 w = 4 + (prota.px & 1);
   8924 21 C6 88      [10]  221 	ld	hl, #_prota + 2
   8927 4E            [ 7]  222 	ld	c,(hl)
   8928 79            [ 4]  223 	ld	a,c
   8929 E6 01         [ 7]  224 	and	a, #0x01
   892B 47            [ 4]  225 	ld	b,a
   892C 04            [ 4]  226 	inc	b
   892D 04            [ 4]  227 	inc	b
   892E 04            [ 4]  228 	inc	b
   892F 04            [ 4]  229 	inc	b
                            230 ;src/main.c:134: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   8930 21 C7 88      [10]  231 	ld	hl, #_prota + 3
   8933 5E            [ 7]  232 	ld	e,(hl)
   8934 CB 4B         [ 8]  233 	bit	1, e
   8936 28 04         [12]  234 	jr	Z,00103$
   8938 3E 01         [ 7]  235 	ld	a,#0x01
   893A 18 02         [12]  236 	jr	00104$
   893C                     237 00103$:
   893C 3E 00         [ 7]  238 	ld	a,#0x00
   893E                     239 00104$:
   893E C6 06         [ 7]  240 	add	a, #0x06
   8940 DD 77 FF      [19]  241 	ld	-1 (ix),a
                            242 ;src/main.c:136: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   8943 FD 2A D6 88   [20]  243 	ld	iy,(_mapa)
   8947 16 00         [ 7]  244 	ld	d,#0x00
   8949 63            [ 4]  245 	ld	h,e
   894A 6A            [ 4]  246 	ld	l,d
   894B CB 7A         [ 8]  247 	bit	7, d
   894D 28 05         [12]  248 	jr	Z,00105$
   894F 13            [ 6]  249 	inc	de
   8950 13            [ 6]  250 	inc	de
   8951 13            [ 6]  251 	inc	de
   8952 63            [ 4]  252 	ld	h,e
   8953 6A            [ 4]  253 	ld	l,d
   8954                     254 00105$:
   8954 5C            [ 4]  255 	ld	e, h
   8955 55            [ 4]  256 	ld	d, l
   8956 CB 2A         [ 8]  257 	sra	d
   8958 CB 1B         [ 8]  258 	rr	e
   895A CB 2A         [ 8]  259 	sra	d
   895C CB 1B         [ 8]  260 	rr	e
   895E 51            [ 4]  261 	ld	d,c
   895F CB 3A         [ 8]  262 	srl	d
   8961 FD E5         [15]  263 	push	iy
   8963 21 00 C0      [10]  264 	ld	hl,#0xC000
   8966 E5            [11]  265 	push	hl
   8967 3E 28         [ 7]  266 	ld	a,#0x28
   8969 F5            [11]  267 	push	af
   896A 33            [ 6]  268 	inc	sp
   896B DD 7E FF      [19]  269 	ld	a,-1 (ix)
   896E F5            [11]  270 	push	af
   896F 33            [ 6]  271 	inc	sp
   8970 C5            [11]  272 	push	bc
   8971 33            [ 6]  273 	inc	sp
   8972 7B            [ 4]  274 	ld	a,e
   8973 F5            [11]  275 	push	af
   8974 33            [ 6]  276 	inc	sp
   8975 D5            [11]  277 	push	de
   8976 33            [ 6]  278 	inc	sp
   8977 CD EC 7C      [17]  279 	call	_cpct_etm_drawTileBox2x4
   897A 33            [ 6]  280 	inc	sp
   897B DD E1         [14]  281 	pop	ix
   897D C9            [10]  282 	ret
                            283 ;src/main.c:139: void menuFin(){
                            284 ;	---------------------------------
                            285 ; Function menuFin
                            286 ; ---------------------------------
   897E                     287 _menuFin::
                            288 ;src/main.c:142: cpct_clearScreen(0);
   897E 21 00 40      [10]  289 	ld	hl,#0x4000
   8981 E5            [11]  290 	push	hl
   8982 AF            [ 4]  291 	xor	a, a
   8983 F5            [11]  292 	push	af
   8984 33            [ 6]  293 	inc	sp
   8985 26 C0         [ 7]  294 	ld	h, #0xC0
   8987 E5            [11]  295 	push	hl
   8988 CD D2 7E      [17]  296 	call	_cpct_memset
                            297 ;src/main.c:144: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   898B 21 18 5A      [10]  298 	ld	hl,#0x5A18
   898E E5            [11]  299 	push	hl
   898F 21 00 C0      [10]  300 	ld	hl,#0xC000
   8992 E5            [11]  301 	push	hl
   8993 CD 18 88      [17]  302 	call	_cpct_getScreenPtr
   8996 4D            [ 4]  303 	ld	c,l
   8997 44            [ 4]  304 	ld	b,h
                            305 ;src/main.c:145: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   8998 21 02 00      [10]  306 	ld	hl,#0x0002
   899B E5            [11]  307 	push	hl
   899C C5            [11]  308 	push	bc
   899D 21 AB 89      [10]  309 	ld	hl,#___str_0
   89A0 E5            [11]  310 	push	hl
   89A1 CD 23 7C      [17]  311 	call	_cpct_drawStringM0
   89A4 21 06 00      [10]  312 	ld	hl,#6
   89A7 39            [11]  313 	add	hl,sp
   89A8 F9            [ 6]  314 	ld	sp,hl
                            315 ;src/main.c:147: while(1){}
   89A9                     316 00102$:
   89A9 18 FE         [12]  317 	jr	00102$
   89AB                     318 ___str_0:
   89AB 47 41 4D 45 20 4F   319 	.ascii "GAME OVER"
        56 45 52
   89B4 00                  320 	.db 0x00
                            321 ;src/main.c:150: void redibujarProta() {
                            322 ;	---------------------------------
                            323 ; Function redibujarProta
                            324 ; ---------------------------------
   89B5                     325 _redibujarProta::
                            326 ;src/main.c:151: borrarProta();
   89B5 CD 1B 89      [17]  327 	call	_borrarProta
                            328 ;src/main.c:152: prota.px = prota.x;
   89B8 01 C6 88      [10]  329 	ld	bc,#_prota + 2
   89BB 3A C4 88      [13]  330 	ld	a, (#_prota + 0)
   89BE 02            [ 7]  331 	ld	(bc),a
                            332 ;src/main.c:153: prota.py = prota.y;
   89BF 01 C7 88      [10]  333 	ld	bc,#_prota + 3
   89C2 3A C5 88      [13]  334 	ld	a, (#_prota + 1)
   89C5 02            [ 7]  335 	ld	(bc),a
                            336 ;src/main.c:154: dibujarProta();
   89C6 C3 F5 88      [10]  337 	jp  _dibujarProta
                            338 ;src/main.c:157: u8* getTilePtr(u8 x, u8 y) {
                            339 ;	---------------------------------
                            340 ; Function getTilePtr
                            341 ; ---------------------------------
   89C9                     342 _getTilePtr::
                            343 ;src/main.c:158: return mapa + (y/4)*g_map1_W + x/2;
   89C9 21 03 00      [10]  344 	ld	hl, #3+0
   89CC 39            [11]  345 	add	hl, sp
   89CD 4E            [ 7]  346 	ld	c, (hl)
   89CE CB 39         [ 8]  347 	srl	c
   89D0 CB 39         [ 8]  348 	srl	c
   89D2 06 00         [ 7]  349 	ld	b,#0x00
   89D4 69            [ 4]  350 	ld	l, c
   89D5 60            [ 4]  351 	ld	h, b
   89D6 29            [11]  352 	add	hl, hl
   89D7 29            [11]  353 	add	hl, hl
   89D8 09            [11]  354 	add	hl, bc
   89D9 29            [11]  355 	add	hl, hl
   89DA 29            [11]  356 	add	hl, hl
   89DB 29            [11]  357 	add	hl, hl
   89DC ED 5B D6 88   [20]  358 	ld	de,(_mapa)
   89E0 19            [11]  359 	add	hl,de
   89E1 FD 21 02 00   [14]  360 	ld	iy,#2
   89E5 FD 39         [15]  361 	add	iy,sp
   89E7 FD 4E 00      [19]  362 	ld	c,0 (iy)
   89EA CB 39         [ 8]  363 	srl	c
   89EC 59            [ 4]  364 	ld	e,c
   89ED 16 00         [ 7]  365 	ld	d,#0x00
   89EF 19            [11]  366 	add	hl,de
   89F0 C9            [10]  367 	ret
                            368 ;src/main.c:161: u8 checkCollision(int direction) { // check optimization
                            369 ;	---------------------------------
                            370 ; Function checkCollision
                            371 ; ---------------------------------
   89F1                     372 _checkCollision::
   89F1 DD E5         [15]  373 	push	ix
   89F3 DD 21 00 00   [14]  374 	ld	ix,#0
   89F7 DD 39         [15]  375 	add	ix,sp
   89F9 F5            [11]  376 	push	af
                            377 ;src/main.c:162: u8 *headTile=0, *feetTile=0, *waistTile=0;
   89FA 21 00 00      [10]  378 	ld	hl,#0x0000
   89FD E3            [19]  379 	ex	(sp), hl
   89FE 11 00 00      [10]  380 	ld	de,#0x0000
   8A01 01 00 00      [10]  381 	ld	bc,#0x0000
                            382 ;src/main.c:164: switch (direction) {
   8A04 DD CB 05 7E   [20]  383 	bit	7, 5 (ix)
   8A08 C2 25 8B      [10]  384 	jp	NZ,00105$
   8A0B 3E 03         [ 7]  385 	ld	a,#0x03
   8A0D DD BE 04      [19]  386 	cp	a, 4 (ix)
   8A10 3E 00         [ 7]  387 	ld	a,#0x00
   8A12 DD 9E 05      [19]  388 	sbc	a, 5 (ix)
   8A15 E2 1A 8A      [10]  389 	jp	PO, 00128$
   8A18 EE 80         [ 7]  390 	xor	a, #0x80
   8A1A                     391 00128$:
   8A1A FA 25 8B      [10]  392 	jp	M,00105$
   8A1D DD 5E 04      [19]  393 	ld	e,4 (ix)
   8A20 16 00         [ 7]  394 	ld	d,#0x00
   8A22 21 29 8A      [10]  395 	ld	hl,#00129$
   8A25 19            [11]  396 	add	hl,de
   8A26 19            [11]  397 	add	hl,de
   8A27 19            [11]  398 	add	hl,de
   8A28 E9            [ 4]  399 	jp	(hl)
   8A29                     400 00129$:
   8A29 C3 35 8A      [10]  401 	jp	00101$
   8A2C C3 80 8A      [10]  402 	jp	00102$
   8A2F C3 C1 8A      [10]  403 	jp	00103$
   8A32 C3 F4 8A      [10]  404 	jp	00104$
                            405 ;src/main.c:165: case 0:
   8A35                     406 00101$:
                            407 ;src/main.c:166: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   8A35 21 C5 88      [10]  408 	ld	hl, #(_prota + 0x0001) + 0
   8A38 5E            [ 7]  409 	ld	e,(hl)
   8A39 21 C4 88      [10]  410 	ld	hl, #_prota + 0
   8A3C 4E            [ 7]  411 	ld	c,(hl)
   8A3D 0C            [ 4]  412 	inc	c
   8A3E 0C            [ 4]  413 	inc	c
   8A3F 0C            [ 4]  414 	inc	c
   8A40 0C            [ 4]  415 	inc	c
   8A41 7B            [ 4]  416 	ld	a,e
   8A42 F5            [11]  417 	push	af
   8A43 33            [ 6]  418 	inc	sp
   8A44 79            [ 4]  419 	ld	a,c
   8A45 F5            [11]  420 	push	af
   8A46 33            [ 6]  421 	inc	sp
   8A47 CD C9 89      [17]  422 	call	_getTilePtr
   8A4A F1            [10]  423 	pop	af
   8A4B 33            [ 6]  424 	inc	sp
   8A4C 33            [ 6]  425 	inc	sp
   8A4D E5            [11]  426 	push	hl
                            427 ;src/main.c:167: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   8A4E 3A C5 88      [13]  428 	ld	a, (#(_prota + 0x0001) + 0)
   8A51 C6 14         [ 7]  429 	add	a, #0x14
   8A53 4F            [ 4]  430 	ld	c,a
   8A54 21 C4 88      [10]  431 	ld	hl, #_prota + 0
   8A57 46            [ 7]  432 	ld	b,(hl)
   8A58 04            [ 4]  433 	inc	b
   8A59 04            [ 4]  434 	inc	b
   8A5A 04            [ 4]  435 	inc	b
   8A5B 04            [ 4]  436 	inc	b
   8A5C 79            [ 4]  437 	ld	a,c
   8A5D F5            [11]  438 	push	af
   8A5E 33            [ 6]  439 	inc	sp
   8A5F C5            [11]  440 	push	bc
   8A60 33            [ 6]  441 	inc	sp
   8A61 CD C9 89      [17]  442 	call	_getTilePtr
   8A64 F1            [10]  443 	pop	af
   8A65 EB            [ 4]  444 	ex	de,hl
                            445 ;src/main.c:168: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   8A66 3A C5 88      [13]  446 	ld	a, (#(_prota + 0x0001) + 0)
   8A69 C6 0B         [ 7]  447 	add	a, #0x0B
   8A6B 47            [ 4]  448 	ld	b,a
   8A6C 3A C4 88      [13]  449 	ld	a, (#_prota + 0)
   8A6F C6 04         [ 7]  450 	add	a, #0x04
   8A71 D5            [11]  451 	push	de
   8A72 C5            [11]  452 	push	bc
   8A73 33            [ 6]  453 	inc	sp
   8A74 F5            [11]  454 	push	af
   8A75 33            [ 6]  455 	inc	sp
   8A76 CD C9 89      [17]  456 	call	_getTilePtr
   8A79 F1            [10]  457 	pop	af
   8A7A 4D            [ 4]  458 	ld	c,l
   8A7B 44            [ 4]  459 	ld	b,h
   8A7C D1            [10]  460 	pop	de
                            461 ;src/main.c:169: break;
   8A7D C3 25 8B      [10]  462 	jp	00105$
                            463 ;src/main.c:170: case 1:
   8A80                     464 00102$:
                            465 ;src/main.c:171: headTile  = getTilePtr(prota.x - 1, prota.y);
   8A80 21 C5 88      [10]  466 	ld	hl, #(_prota + 0x0001) + 0
   8A83 56            [ 7]  467 	ld	d,(hl)
   8A84 21 C4 88      [10]  468 	ld	hl, #_prota + 0
   8A87 46            [ 7]  469 	ld	b,(hl)
   8A88 05            [ 4]  470 	dec	b
   8A89 D5            [11]  471 	push	de
   8A8A 33            [ 6]  472 	inc	sp
   8A8B C5            [11]  473 	push	bc
   8A8C 33            [ 6]  474 	inc	sp
   8A8D CD C9 89      [17]  475 	call	_getTilePtr
   8A90 F1            [10]  476 	pop	af
   8A91 33            [ 6]  477 	inc	sp
   8A92 33            [ 6]  478 	inc	sp
   8A93 E5            [11]  479 	push	hl
                            480 ;src/main.c:172: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
   8A94 3A C5 88      [13]  481 	ld	a, (#(_prota + 0x0001) + 0)
   8A97 C6 14         [ 7]  482 	add	a, #0x14
   8A99 57            [ 4]  483 	ld	d,a
   8A9A 21 C4 88      [10]  484 	ld	hl, #_prota + 0
   8A9D 46            [ 7]  485 	ld	b,(hl)
   8A9E 05            [ 4]  486 	dec	b
   8A9F D5            [11]  487 	push	de
   8AA0 33            [ 6]  488 	inc	sp
   8AA1 C5            [11]  489 	push	bc
   8AA2 33            [ 6]  490 	inc	sp
   8AA3 CD C9 89      [17]  491 	call	_getTilePtr
   8AA6 F1            [10]  492 	pop	af
   8AA7 EB            [ 4]  493 	ex	de,hl
                            494 ;src/main.c:173: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
   8AA8 3A C5 88      [13]  495 	ld	a, (#(_prota + 0x0001) + 0)
   8AAB C6 0B         [ 7]  496 	add	a, #0x0B
   8AAD 47            [ 4]  497 	ld	b,a
   8AAE 3A C4 88      [13]  498 	ld	a, (#_prota + 0)
   8AB1 C6 FF         [ 7]  499 	add	a,#0xFF
   8AB3 D5            [11]  500 	push	de
   8AB4 C5            [11]  501 	push	bc
   8AB5 33            [ 6]  502 	inc	sp
   8AB6 F5            [11]  503 	push	af
   8AB7 33            [ 6]  504 	inc	sp
   8AB8 CD C9 89      [17]  505 	call	_getTilePtr
   8ABB F1            [10]  506 	pop	af
   8ABC 4D            [ 4]  507 	ld	c,l
   8ABD 44            [ 4]  508 	ld	b,h
   8ABE D1            [10]  509 	pop	de
                            510 ;src/main.c:174: break;
   8ABF 18 64         [12]  511 	jr	00105$
                            512 ;src/main.c:175: case 2:
   8AC1                     513 00103$:
                            514 ;src/main.c:176: headTile   = getTilePtr(prota.x, prota.y - 2);
   8AC1 3A C5 88      [13]  515 	ld	a, (#(_prota + 0x0001) + 0)
   8AC4 C6 FE         [ 7]  516 	add	a,#0xFE
   8AC6 21 C4 88      [10]  517 	ld	hl, #_prota + 0
   8AC9 56            [ 7]  518 	ld	d,(hl)
   8ACA C5            [11]  519 	push	bc
   8ACB F5            [11]  520 	push	af
   8ACC 33            [ 6]  521 	inc	sp
   8ACD D5            [11]  522 	push	de
   8ACE 33            [ 6]  523 	inc	sp
   8ACF CD C9 89      [17]  524 	call	_getTilePtr
   8AD2 F1            [10]  525 	pop	af
   8AD3 C1            [10]  526 	pop	bc
   8AD4 33            [ 6]  527 	inc	sp
   8AD5 33            [ 6]  528 	inc	sp
   8AD6 E5            [11]  529 	push	hl
                            530 ;src/main.c:177: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
   8AD7 21 C5 88      [10]  531 	ld	hl, #(_prota + 0x0001) + 0
   8ADA 56            [ 7]  532 	ld	d,(hl)
   8ADB 15            [ 4]  533 	dec	d
   8ADC 15            [ 4]  534 	dec	d
   8ADD 3A C4 88      [13]  535 	ld	a, (#_prota + 0)
   8AE0 C6 03         [ 7]  536 	add	a, #0x03
   8AE2 C5            [11]  537 	push	bc
   8AE3 D5            [11]  538 	push	de
   8AE4 33            [ 6]  539 	inc	sp
   8AE5 F5            [11]  540 	push	af
   8AE6 33            [ 6]  541 	inc	sp
   8AE7 CD C9 89      [17]  542 	call	_getTilePtr
   8AEA F1            [10]  543 	pop	af
   8AEB EB            [ 4]  544 	ex	de,hl
   8AEC C1            [10]  545 	pop	bc
                            546 ;src/main.c:178: *waistTile = 0;
   8AED 21 00 00      [10]  547 	ld	hl,#0x0000
   8AF0 36 00         [10]  548 	ld	(hl),#0x00
                            549 ;src/main.c:179: break;
   8AF2 18 31         [12]  550 	jr	00105$
                            551 ;src/main.c:180: case 3:
   8AF4                     552 00104$:
                            553 ;src/main.c:181: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
   8AF4 3A C5 88      [13]  554 	ld	a, (#(_prota + 0x0001) + 0)
   8AF7 C6 16         [ 7]  555 	add	a, #0x16
   8AF9 21 C4 88      [10]  556 	ld	hl, #_prota + 0
   8AFC 56            [ 7]  557 	ld	d,(hl)
   8AFD C5            [11]  558 	push	bc
   8AFE F5            [11]  559 	push	af
   8AFF 33            [ 6]  560 	inc	sp
   8B00 D5            [11]  561 	push	de
   8B01 33            [ 6]  562 	inc	sp
   8B02 CD C9 89      [17]  563 	call	_getTilePtr
   8B05 F1            [10]  564 	pop	af
   8B06 C1            [10]  565 	pop	bc
   8B07 33            [ 6]  566 	inc	sp
   8B08 33            [ 6]  567 	inc	sp
   8B09 E5            [11]  568 	push	hl
                            569 ;src/main.c:182: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   8B0A 3A C5 88      [13]  570 	ld	a, (#(_prota + 0x0001) + 0)
   8B0D C6 16         [ 7]  571 	add	a, #0x16
   8B0F 57            [ 4]  572 	ld	d,a
   8B10 3A C4 88      [13]  573 	ld	a, (#_prota + 0)
   8B13 C6 03         [ 7]  574 	add	a, #0x03
   8B15 C5            [11]  575 	push	bc
   8B16 D5            [11]  576 	push	de
   8B17 33            [ 6]  577 	inc	sp
   8B18 F5            [11]  578 	push	af
   8B19 33            [ 6]  579 	inc	sp
   8B1A CD C9 89      [17]  580 	call	_getTilePtr
   8B1D F1            [10]  581 	pop	af
   8B1E EB            [ 4]  582 	ex	de,hl
   8B1F C1            [10]  583 	pop	bc
                            584 ;src/main.c:183: *waistTile = 0;
   8B20 21 00 00      [10]  585 	ld	hl,#0x0000
   8B23 36 00         [10]  586 	ld	(hl),#0x00
                            587 ;src/main.c:185: }
   8B25                     588 00105$:
                            589 ;src/main.c:187: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   8B25 E1            [10]  590 	pop	hl
   8B26 E5            [11]  591 	push	hl
   8B27 6E            [ 7]  592 	ld	l,(hl)
   8B28 3E 02         [ 7]  593 	ld	a,#0x02
   8B2A 95            [ 4]  594 	sub	a, l
   8B2B 38 0E         [12]  595 	jr	C,00106$
   8B2D 1A            [ 7]  596 	ld	a,(de)
   8B2E 5F            [ 4]  597 	ld	e,a
   8B2F 3E 02         [ 7]  598 	ld	a,#0x02
   8B31 93            [ 4]  599 	sub	a, e
   8B32 38 07         [12]  600 	jr	C,00106$
   8B34 0A            [ 7]  601 	ld	a,(bc)
   8B35 4F            [ 4]  602 	ld	c,a
   8B36 3E 02         [ 7]  603 	ld	a,#0x02
   8B38 91            [ 4]  604 	sub	a, c
   8B39 30 04         [12]  605 	jr	NC,00107$
   8B3B                     606 00106$:
                            607 ;src/main.c:188: return 1;
   8B3B 2E 01         [ 7]  608 	ld	l,#0x01
   8B3D 18 02         [12]  609 	jr	00110$
   8B3F                     610 00107$:
                            611 ;src/main.c:190: return 0;
   8B3F 2E 00         [ 7]  612 	ld	l,#0x00
   8B41                     613 00110$:
   8B41 DD F9         [10]  614 	ld	sp, ix
   8B43 DD E1         [14]  615 	pop	ix
   8B45 C9            [10]  616 	ret
                            617 ;src/main.c:194: void dibujarEnemigo(TEnemy *enemy) {
                            618 ;	---------------------------------
                            619 ; Function dibujarEnemigo
                            620 ; ---------------------------------
   8B46                     621 _dibujarEnemigo::
   8B46 DD E5         [15]  622 	push	ix
   8B48 DD 21 00 00   [14]  623 	ld	ix,#0
   8B4C DD 39         [15]  624 	add	ix,sp
                            625 ;src/main.c:195: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy->x, enemy->y);
   8B4E DD 4E 04      [19]  626 	ld	c,4 (ix)
   8B51 DD 46 05      [19]  627 	ld	b,5 (ix)
   8B54 69            [ 4]  628 	ld	l, c
   8B55 60            [ 4]  629 	ld	h, b
   8B56 23            [ 6]  630 	inc	hl
   8B57 56            [ 7]  631 	ld	d,(hl)
   8B58 0A            [ 7]  632 	ld	a,(bc)
   8B59 C5            [11]  633 	push	bc
   8B5A D5            [11]  634 	push	de
   8B5B 33            [ 6]  635 	inc	sp
   8B5C F5            [11]  636 	push	af
   8B5D 33            [ 6]  637 	inc	sp
   8B5E 21 00 C0      [10]  638 	ld	hl,#0xC000
   8B61 E5            [11]  639 	push	hl
   8B62 CD 18 88      [17]  640 	call	_cpct_getScreenPtr
   8B65 EB            [ 4]  641 	ex	de,hl
                            642 ;src/main.c:196: cpct_drawSpriteMaskedAlignedTable (enemy->sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   8B66 E1            [10]  643 	pop	hl
   8B67 01 04 00      [10]  644 	ld	bc, #0x0004
   8B6A 09            [11]  645 	add	hl, bc
   8B6B 4E            [ 7]  646 	ld	c,(hl)
   8B6C 23            [ 6]  647 	inc	hl
   8B6D 46            [ 7]  648 	ld	b,(hl)
   8B6E 21 00 3E      [10]  649 	ld	hl,#_g_tablatrans
   8B71 E5            [11]  650 	push	hl
   8B72 21 04 16      [10]  651 	ld	hl,#0x1604
   8B75 E5            [11]  652 	push	hl
   8B76 D5            [11]  653 	push	de
   8B77 C5            [11]  654 	push	bc
   8B78 CD 38 88      [17]  655 	call	_cpct_drawSpriteMaskedAlignedTable
   8B7B DD E1         [14]  656 	pop	ix
   8B7D C9            [10]  657 	ret
                            658 ;src/main.c:199: void borrarEnemigo(TEnemy *enemy) {
                            659 ;	---------------------------------
                            660 ; Function borrarEnemigo
                            661 ; ---------------------------------
   8B7E                     662 _borrarEnemigo::
   8B7E DD E5         [15]  663 	push	ix
   8B80 DD 21 00 00   [14]  664 	ld	ix,#0
   8B84 DD 39         [15]  665 	add	ix,sp
   8B86 F5            [11]  666 	push	af
   8B87 F5            [11]  667 	push	af
                            668 ;src/main.c:201: u8 w = 4 + (enemy->px & 1);
   8B88 DD 4E 04      [19]  669 	ld	c,4 (ix)
   8B8B DD 46 05      [19]  670 	ld	b,5 (ix)
   8B8E 69            [ 4]  671 	ld	l, c
   8B8F 60            [ 4]  672 	ld	h, b
   8B90 23            [ 6]  673 	inc	hl
   8B91 23            [ 6]  674 	inc	hl
   8B92 5E            [ 7]  675 	ld	e,(hl)
   8B93 7B            [ 4]  676 	ld	a,e
   8B94 E6 01         [ 7]  677 	and	a, #0x01
   8B96 C6 04         [ 7]  678 	add	a, #0x04
   8B98 DD 77 FC      [19]  679 	ld	-4 (ix),a
                            680 ;src/main.c:204: u8 h = 7 + (enemy->py & 2 ? 1 : 0);
   8B9B 69            [ 4]  681 	ld	l, c
   8B9C 60            [ 4]  682 	ld	h, b
   8B9D 23            [ 6]  683 	inc	hl
   8B9E 23            [ 6]  684 	inc	hl
   8B9F 23            [ 6]  685 	inc	hl
   8BA0 56            [ 7]  686 	ld	d,(hl)
   8BA1 CB 4A         [ 8]  687 	bit	1, d
   8BA3 28 04         [12]  688 	jr	Z,00103$
   8BA5 3E 01         [ 7]  689 	ld	a,#0x01
   8BA7 18 02         [12]  690 	jr	00104$
   8BA9                     691 00103$:
   8BA9 3E 00         [ 7]  692 	ld	a,#0x00
   8BAB                     693 00104$:
   8BAB C6 07         [ 7]  694 	add	a, #0x07
   8BAD DD 77 FD      [19]  695 	ld	-3 (ix),a
                            696 ;src/main.c:206: cpct_etm_drawTileBox2x4 (enemy->px / 2, (enemy->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   8BB0 FD 2A D6 88   [20]  697 	ld	iy,(_mapa)
   8BB4 6A            [ 4]  698 	ld	l,d
   8BB5 26 00         [ 7]  699 	ld	h,#0x00
   8BB7 DD 75 FE      [19]  700 	ld	-2 (ix),l
   8BBA DD 74 FF      [19]  701 	ld	-1 (ix),h
   8BBD CB 7C         [ 8]  702 	bit	7, h
   8BBF 28 09         [12]  703 	jr	Z,00105$
   8BC1 23            [ 6]  704 	inc	hl
   8BC2 23            [ 6]  705 	inc	hl
   8BC3 23            [ 6]  706 	inc	hl
   8BC4 DD 75 FE      [19]  707 	ld	-2 (ix),l
   8BC7 DD 74 FF      [19]  708 	ld	-1 (ix),h
   8BCA                     709 00105$:
   8BCA DD 56 FE      [19]  710 	ld	d,-2 (ix)
   8BCD DD 6E FF      [19]  711 	ld	l,-1 (ix)
   8BD0 CB 2D         [ 8]  712 	sra	l
   8BD2 CB 1A         [ 8]  713 	rr	d
   8BD4 CB 2D         [ 8]  714 	sra	l
   8BD6 CB 1A         [ 8]  715 	rr	d
   8BD8 CB 3B         [ 8]  716 	srl	e
   8BDA C5            [11]  717 	push	bc
   8BDB FD E5         [15]  718 	push	iy
   8BDD 21 00 C0      [10]  719 	ld	hl,#0xC000
   8BE0 E5            [11]  720 	push	hl
   8BE1 3E 28         [ 7]  721 	ld	a,#0x28
   8BE3 F5            [11]  722 	push	af
   8BE4 33            [ 6]  723 	inc	sp
   8BE5 DD 66 FD      [19]  724 	ld	h,-3 (ix)
   8BE8 DD 6E FC      [19]  725 	ld	l,-4 (ix)
   8BEB E5            [11]  726 	push	hl
   8BEC D5            [11]  727 	push	de
   8BED CD EC 7C      [17]  728 	call	_cpct_etm_drawTileBox2x4
   8BF0 C1            [10]  729 	pop	bc
                            730 ;src/main.c:208: enemy->mover = NO;
   8BF1 21 06 00      [10]  731 	ld	hl,#0x0006
   8BF4 09            [11]  732 	add	hl,bc
   8BF5 36 00         [10]  733 	ld	(hl),#0x00
   8BF7 DD F9         [10]  734 	ld	sp, ix
   8BF9 DD E1         [14]  735 	pop	ix
   8BFB C9            [10]  736 	ret
                            737 ;src/main.c:211: void redibujarEnemigo(TEnemy *enemy) {
                            738 ;	---------------------------------
                            739 ; Function redibujarEnemigo
                            740 ; ---------------------------------
   8BFC                     741 _redibujarEnemigo::
   8BFC DD E5         [15]  742 	push	ix
   8BFE DD 21 00 00   [14]  743 	ld	ix,#0
   8C02 DD 39         [15]  744 	add	ix,sp
                            745 ;src/main.c:212: borrarEnemigo(enemy);
   8C04 DD 6E 04      [19]  746 	ld	l,4 (ix)
   8C07 DD 66 05      [19]  747 	ld	h,5 (ix)
   8C0A E5            [11]  748 	push	hl
   8C0B CD 7E 8B      [17]  749 	call	_borrarEnemigo
   8C0E F1            [10]  750 	pop	af
                            751 ;src/main.c:213: enemy->px = enemy->x;
   8C0F DD 4E 04      [19]  752 	ld	c,4 (ix)
   8C12 DD 46 05      [19]  753 	ld	b,5 (ix)
   8C15 59            [ 4]  754 	ld	e, c
   8C16 50            [ 4]  755 	ld	d, b
   8C17 13            [ 6]  756 	inc	de
   8C18 13            [ 6]  757 	inc	de
   8C19 0A            [ 7]  758 	ld	a,(bc)
   8C1A 12            [ 7]  759 	ld	(de),a
                            760 ;src/main.c:214: enemy->py = enemy->y;
   8C1B 59            [ 4]  761 	ld	e, c
   8C1C 50            [ 4]  762 	ld	d, b
   8C1D 13            [ 6]  763 	inc	de
   8C1E 13            [ 6]  764 	inc	de
   8C1F 13            [ 6]  765 	inc	de
   8C20 69            [ 4]  766 	ld	l, c
   8C21 60            [ 4]  767 	ld	h, b
   8C22 23            [ 6]  768 	inc	hl
   8C23 7E            [ 7]  769 	ld	a,(hl)
   8C24 12            [ 7]  770 	ld	(de),a
                            771 ;src/main.c:215: dibujarEnemigo(enemy);
   8C25 C5            [11]  772 	push	bc
   8C26 CD 46 8B      [17]  773 	call	_dibujarEnemigo
   8C29 F1            [10]  774 	pop	af
   8C2A DD E1         [14]  775 	pop	ix
   8C2C C9            [10]  776 	ret
                            777 ;src/main.c:218: u8 checkEnemyCollision(int direction, TEnemy *enemy){
                            778 ;	---------------------------------
                            779 ; Function checkEnemyCollision
                            780 ; ---------------------------------
   8C2D                     781 _checkEnemyCollision::
   8C2D DD E5         [15]  782 	push	ix
   8C2F DD 21 00 00   [14]  783 	ld	ix,#0
   8C33 DD 39         [15]  784 	add	ix,sp
   8C35 21 F9 FF      [10]  785 	ld	hl,#-7
   8C38 39            [11]  786 	add	hl,sp
   8C39 F9            [ 6]  787 	ld	sp,hl
                            788 ;src/main.c:220: u8 colisiona = 1;
   8C3A DD 36 F9 01   [19]  789 	ld	-7 (ix),#0x01
                            790 ;src/main.c:222: switch (direction) {
   8C3E DD CB 05 7E   [20]  791 	bit	7, 5 (ix)
   8C42 C2 40 8E      [10]  792 	jp	NZ,00135$
   8C45 3E 03         [ 7]  793 	ld	a,#0x03
   8C47 DD BE 04      [19]  794 	cp	a, 4 (ix)
   8C4A 3E 00         [ 7]  795 	ld	a,#0x00
   8C4C DD 9E 05      [19]  796 	sbc	a, 5 (ix)
   8C4F E2 54 8C      [10]  797 	jp	PO, 00194$
   8C52 EE 80         [ 7]  798 	xor	a, #0x80
   8C54                     799 00194$:
   8C54 FA 40 8E      [10]  800 	jp	M,00135$
                            801 ;src/main.c:230: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   8C57 DD 4E 06      [19]  802 	ld	c,6 (ix)
   8C5A DD 46 07      [19]  803 	ld	b,7 (ix)
                            804 ;src/main.c:244: enemy->mira = M_abajo;
   8C5D 21 07 00      [10]  805 	ld	hl,#0x0007
   8C60 09            [11]  806 	add	hl,bc
   8C61 DD 75 FC      [19]  807 	ld	-4 (ix),l
   8C64 DD 74 FD      [19]  808 	ld	-3 (ix),h
                            809 ;src/main.c:230: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   8C67 21 01 00      [10]  810 	ld	hl,#0x0001
   8C6A 09            [11]  811 	add	hl,bc
   8C6B DD 75 FE      [19]  812 	ld	-2 (ix),l
   8C6E DD 74 FF      [19]  813 	ld	-1 (ix),h
                            814 ;src/main.c:222: switch (direction) {
   8C71 DD 5E 04      [19]  815 	ld	e,4 (ix)
   8C74 16 00         [ 7]  816 	ld	d,#0x00
   8C76 21 7D 8C      [10]  817 	ld	hl,#00195$
   8C79 19            [11]  818 	add	hl,de
   8C7A 19            [11]  819 	add	hl,de
   8C7B 19            [11]  820 	add	hl,de
   8C7C E9            [ 4]  821 	jp	(hl)
   8C7D                     822 00195$:
   8C7D C3 40 8E      [10]  823 	jp	00135$
   8C80 C3 40 8E      [10]  824 	jp	00135$
   8C83 C3 8F 8C      [10]  825 	jp	00103$
   8C86 C3 66 8D      [10]  826 	jp	00119$
                            827 ;src/main.c:223: case 0:
                            828 ;src/main.c:225: break;
   8C89 C3 40 8E      [10]  829 	jp	00135$
                            830 ;src/main.c:226: case 1:
                            831 ;src/main.c:228: break;
   8C8C C3 40 8E      [10]  832 	jp	00135$
                            833 ;src/main.c:229: case 2:
   8C8F                     834 00103$:
                            835 ;src/main.c:230: if( *getTilePtr(enemy->x, enemy->y - 2) <= 2
   8C8F DD 6E FE      [19]  836 	ld	l,-2 (ix)
   8C92 DD 66 FF      [19]  837 	ld	h,-1 (ix)
   8C95 5E            [ 7]  838 	ld	e,(hl)
   8C96 53            [ 4]  839 	ld	d,e
   8C97 15            [ 4]  840 	dec	d
   8C98 15            [ 4]  841 	dec	d
   8C99 0A            [ 7]  842 	ld	a,(bc)
   8C9A C5            [11]  843 	push	bc
   8C9B D5            [11]  844 	push	de
   8C9C 33            [ 6]  845 	inc	sp
   8C9D F5            [11]  846 	push	af
   8C9E 33            [ 6]  847 	inc	sp
   8C9F CD C9 89      [17]  848 	call	_getTilePtr
   8CA2 F1            [10]  849 	pop	af
   8CA3 C1            [10]  850 	pop	bc
   8CA4 5E            [ 7]  851 	ld	e,(hl)
   8CA5 3E 02         [ 7]  852 	ld	a,#0x02
   8CA7 93            [ 4]  853 	sub	a, e
   8CA8 DA 5E 8D      [10]  854 	jp	C,00115$
                            855 ;src/main.c:231: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y - 2) <= 2
   8CAB DD 6E FE      [19]  856 	ld	l,-2 (ix)
   8CAE DD 66 FF      [19]  857 	ld	h,-1 (ix)
   8CB1 56            [ 7]  858 	ld	d,(hl)
   8CB2 15            [ 4]  859 	dec	d
   8CB3 15            [ 4]  860 	dec	d
   8CB4 0A            [ 7]  861 	ld	a,(bc)
   8CB5 C6 02         [ 7]  862 	add	a, #0x02
   8CB7 C5            [11]  863 	push	bc
   8CB8 D5            [11]  864 	push	de
   8CB9 33            [ 6]  865 	inc	sp
   8CBA F5            [11]  866 	push	af
   8CBB 33            [ 6]  867 	inc	sp
   8CBC CD C9 89      [17]  868 	call	_getTilePtr
   8CBF F1            [10]  869 	pop	af
   8CC0 C1            [10]  870 	pop	bc
   8CC1 5E            [ 7]  871 	ld	e,(hl)
   8CC2 3E 02         [ 7]  872 	ld	a,#0x02
   8CC4 93            [ 4]  873 	sub	a, e
   8CC5 DA 5E 8D      [10]  874 	jp	C,00115$
                            875 ;src/main.c:232: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y - 2) <= 2)
   8CC8 DD 6E FE      [19]  876 	ld	l,-2 (ix)
   8CCB DD 66 FF      [19]  877 	ld	h,-1 (ix)
   8CCE 56            [ 7]  878 	ld	d,(hl)
   8CCF 15            [ 4]  879 	dec	d
   8CD0 15            [ 4]  880 	dec	d
   8CD1 0A            [ 7]  881 	ld	a,(bc)
   8CD2 C6 04         [ 7]  882 	add	a, #0x04
   8CD4 C5            [11]  883 	push	bc
   8CD5 D5            [11]  884 	push	de
   8CD6 33            [ 6]  885 	inc	sp
   8CD7 F5            [11]  886 	push	af
   8CD8 33            [ 6]  887 	inc	sp
   8CD9 CD C9 89      [17]  888 	call	_getTilePtr
   8CDC F1            [10]  889 	pop	af
   8CDD C1            [10]  890 	pop	bc
   8CDE 5E            [ 7]  891 	ld	e,(hl)
   8CDF 3E 02         [ 7]  892 	ld	a,#0x02
   8CE1 93            [ 4]  893 	sub	a, e
   8CE2 38 7A         [12]  894 	jr	C,00115$
                            895 ;src/main.c:234: if((prota.x + G_HERO_W -4) < enemy->x || prota.x  > (enemy->x + G_ENEMY_W)){
   8CE4 21 C4 88      [10]  896 	ld	hl, #_prota + 0
   8CE7 5E            [ 7]  897 	ld	e,(hl)
   8CE8 16 00         [ 7]  898 	ld	d,#0x00
   8CEA 21 03 00      [10]  899 	ld	hl,#0x0003
   8CED 19            [11]  900 	add	hl,de
   8CEE DD 75 FA      [19]  901 	ld	-6 (ix),l
   8CF1 DD 74 FB      [19]  902 	ld	-5 (ix),h
   8CF4 0A            [ 7]  903 	ld	a,(bc)
   8CF5 6F            [ 4]  904 	ld	l,a
   8CF6 26 00         [ 7]  905 	ld	h,#0x00
   8CF8 DD 7E FA      [19]  906 	ld	a,-6 (ix)
   8CFB 95            [ 4]  907 	sub	a, l
   8CFC DD 7E FB      [19]  908 	ld	a,-5 (ix)
   8CFF 9C            [ 4]  909 	sbc	a, h
   8D00 E2 05 8D      [10]  910 	jp	PO, 00196$
   8D03 EE 80         [ 7]  911 	xor	a, #0x80
   8D05                     912 00196$:
   8D05 FA 18 8D      [10]  913 	jp	M,00110$
   8D08 23            [ 6]  914 	inc	hl
   8D09 23            [ 6]  915 	inc	hl
   8D0A 23            [ 6]  916 	inc	hl
   8D0B 23            [ 6]  917 	inc	hl
   8D0C 7D            [ 4]  918 	ld	a,l
   8D0D 93            [ 4]  919 	sub	a, e
   8D0E 7C            [ 4]  920 	ld	a,h
   8D0F 9A            [ 4]  921 	sbc	a, d
   8D10 E2 15 8D      [10]  922 	jp	PO, 00197$
   8D13 EE 80         [ 7]  923 	xor	a, #0x80
   8D15                     924 00197$:
   8D15 F2 1E 8D      [10]  925 	jp	P,00111$
   8D18                     926 00110$:
                            927 ;src/main.c:236: colisiona = 0;
   8D18 DD 36 F9 00   [19]  928 	ld	-7 (ix),#0x00
   8D1C 18 48         [12]  929 	jr	00119$
   8D1E                     930 00111$:
                            931 ;src/main.c:239: if(enemy->y>prota.y){
   8D1E DD 6E FE      [19]  932 	ld	l,-2 (ix)
   8D21 DD 66 FF      [19]  933 	ld	h,-1 (ix)
   8D24 5E            [ 7]  934 	ld	e,(hl)
   8D25 21 C5 88      [10]  935 	ld	hl, #(_prota + 0x0001) + 0
   8D28 6E            [ 7]  936 	ld	l,(hl)
   8D29 7D            [ 4]  937 	ld	a,l
   8D2A 93            [ 4]  938 	sub	a, e
   8D2B 30 2B         [12]  939 	jr	NC,00108$
                            940 ;src/main.c:240: if(enemy->y - (prota.y + G_HERO_H -2) >= 2){
   8D2D 16 00         [ 7]  941 	ld	d,#0x00
   8D2F 26 00         [ 7]  942 	ld	h,#0x00
   8D31 D5            [11]  943 	push	de
   8D32 11 14 00      [10]  944 	ld	de,#0x0014
   8D35 19            [11]  945 	add	hl, de
   8D36 D1            [10]  946 	pop	de
   8D37 7B            [ 4]  947 	ld	a,e
   8D38 95            [ 4]  948 	sub	a, l
   8D39 5F            [ 4]  949 	ld	e,a
   8D3A 7A            [ 4]  950 	ld	a,d
   8D3B 9C            [ 4]  951 	sbc	a, h
   8D3C 57            [ 4]  952 	ld	d,a
   8D3D 7B            [ 4]  953 	ld	a,e
   8D3E D6 02         [ 7]  954 	sub	a, #0x02
   8D40 7A            [ 4]  955 	ld	a,d
   8D41 17            [ 4]  956 	rla
   8D42 3F            [ 4]  957 	ccf
   8D43 1F            [ 4]  958 	rra
   8D44 DE 80         [ 7]  959 	sbc	a, #0x80
   8D46 38 06         [12]  960 	jr	C,00105$
                            961 ;src/main.c:241: colisiona = 0;
   8D48 DD 36 F9 00   [19]  962 	ld	-7 (ix),#0x00
   8D4C 18 18         [12]  963 	jr	00119$
   8D4E                     964 00105$:
                            965 ;src/main.c:244: enemy->mira = M_abajo;
   8D4E DD 6E FC      [19]  966 	ld	l,-4 (ix)
   8D51 DD 66 FD      [19]  967 	ld	h,-3 (ix)
   8D54 36 03         [10]  968 	ld	(hl),#0x03
   8D56 18 0E         [12]  969 	jr	00119$
   8D58                     970 00108$:
                            971 ;src/main.c:247: colisiona = 0;
   8D58 DD 36 F9 00   [19]  972 	ld	-7 (ix),#0x00
   8D5C 18 08         [12]  973 	jr	00119$
   8D5E                     974 00115$:
                            975 ;src/main.c:253: enemy->mira = M_abajo;
   8D5E DD 6E FC      [19]  976 	ld	l,-4 (ix)
   8D61 DD 66 FD      [19]  977 	ld	h,-3 (ix)
   8D64 36 03         [10]  978 	ld	(hl),#0x03
                            979 ;src/main.c:256: case 3:
   8D66                     980 00119$:
                            981 ;src/main.c:259: if( *getTilePtr(enemy->x, enemy->y + G_ENEMY_H + 2) <= 2
   8D66 DD 6E FE      [19]  982 	ld	l,-2 (ix)
   8D69 DD 66 FF      [19]  983 	ld	h,-1 (ix)
   8D6C 7E            [ 7]  984 	ld	a,(hl)
   8D6D C6 18         [ 7]  985 	add	a, #0x18
   8D6F 57            [ 4]  986 	ld	d,a
   8D70 0A            [ 7]  987 	ld	a,(bc)
   8D71 C5            [11]  988 	push	bc
   8D72 D5            [11]  989 	push	de
   8D73 33            [ 6]  990 	inc	sp
   8D74 F5            [11]  991 	push	af
   8D75 33            [ 6]  992 	inc	sp
   8D76 CD C9 89      [17]  993 	call	_getTilePtr
   8D79 F1            [10]  994 	pop	af
   8D7A C1            [10]  995 	pop	bc
   8D7B 5E            [ 7]  996 	ld	e,(hl)
   8D7C 3E 02         [ 7]  997 	ld	a,#0x02
   8D7E 93            [ 4]  998 	sub	a, e
   8D7F DA 38 8E      [10]  999 	jp	C,00131$
                           1000 ;src/main.c:260: && *getTilePtr(enemy->x + G_ENEMY_W / 2, enemy->y + G_ENEMY_H + 2) <= 2
   8D82 DD 6E FE      [19] 1001 	ld	l,-2 (ix)
   8D85 DD 66 FF      [19] 1002 	ld	h,-1 (ix)
   8D88 7E            [ 7] 1003 	ld	a,(hl)
   8D89 C6 18         [ 7] 1004 	add	a, #0x18
   8D8B 57            [ 4] 1005 	ld	d,a
   8D8C 0A            [ 7] 1006 	ld	a,(bc)
   8D8D C6 02         [ 7] 1007 	add	a, #0x02
   8D8F C5            [11] 1008 	push	bc
   8D90 D5            [11] 1009 	push	de
   8D91 33            [ 6] 1010 	inc	sp
   8D92 F5            [11] 1011 	push	af
   8D93 33            [ 6] 1012 	inc	sp
   8D94 CD C9 89      [17] 1013 	call	_getTilePtr
   8D97 F1            [10] 1014 	pop	af
   8D98 C1            [10] 1015 	pop	bc
   8D99 5E            [ 7] 1016 	ld	e,(hl)
   8D9A 3E 02         [ 7] 1017 	ld	a,#0x02
   8D9C 93            [ 4] 1018 	sub	a, e
   8D9D DA 38 8E      [10] 1019 	jp	C,00131$
                           1020 ;src/main.c:261: && *getTilePtr(enemy->x + G_ENEMY_W, enemy->y + G_ENEMY_H + 2) <= 2)
   8DA0 DD 6E FE      [19] 1021 	ld	l,-2 (ix)
   8DA3 DD 66 FF      [19] 1022 	ld	h,-1 (ix)
   8DA6 7E            [ 7] 1023 	ld	a,(hl)
   8DA7 C6 18         [ 7] 1024 	add	a, #0x18
   8DA9 57            [ 4] 1025 	ld	d,a
   8DAA 0A            [ 7] 1026 	ld	a,(bc)
   8DAB C6 04         [ 7] 1027 	add	a, #0x04
   8DAD C5            [11] 1028 	push	bc
   8DAE D5            [11] 1029 	push	de
   8DAF 33            [ 6] 1030 	inc	sp
   8DB0 F5            [11] 1031 	push	af
   8DB1 33            [ 6] 1032 	inc	sp
   8DB2 CD C9 89      [17] 1033 	call	_getTilePtr
   8DB5 F1            [10] 1034 	pop	af
   8DB6 C1            [10] 1035 	pop	bc
   8DB7 5E            [ 7] 1036 	ld	e,(hl)
   8DB8 3E 02         [ 7] 1037 	ld	a,#0x02
   8DBA 93            [ 4] 1038 	sub	a, e
   8DBB 38 7B         [12] 1039 	jr	C,00131$
                           1040 ;src/main.c:263: if( (prota.x + G_HERO_W -4) < enemy->x || prota.x  > (enemy->x + G_ENEMY_W) ){
   8DBD 21 C4 88      [10] 1041 	ld	hl, #_prota + 0
   8DC0 5E            [ 7] 1042 	ld	e,(hl)
   8DC1 16 00         [ 7] 1043 	ld	d,#0x00
   8DC3 21 03 00      [10] 1044 	ld	hl,#0x0003
   8DC6 19            [11] 1045 	add	hl,de
   8DC7 DD 75 FA      [19] 1046 	ld	-6 (ix),l
   8DCA DD 74 FB      [19] 1047 	ld	-5 (ix),h
   8DCD 0A            [ 7] 1048 	ld	a,(bc)
   8DCE 4F            [ 4] 1049 	ld	c,a
   8DCF 06 00         [ 7] 1050 	ld	b,#0x00
   8DD1 DD 7E FA      [19] 1051 	ld	a,-6 (ix)
   8DD4 91            [ 4] 1052 	sub	a, c
   8DD5 DD 7E FB      [19] 1053 	ld	a,-5 (ix)
   8DD8 98            [ 4] 1054 	sbc	a, b
   8DD9 E2 DE 8D      [10] 1055 	jp	PO, 00198$
   8DDC EE 80         [ 7] 1056 	xor	a, #0x80
   8DDE                    1057 00198$:
   8DDE FA F1 8D      [10] 1058 	jp	M,00126$
   8DE1 03            [ 6] 1059 	inc	bc
   8DE2 03            [ 6] 1060 	inc	bc
   8DE3 03            [ 6] 1061 	inc	bc
   8DE4 03            [ 6] 1062 	inc	bc
   8DE5 79            [ 4] 1063 	ld	a,c
   8DE6 93            [ 4] 1064 	sub	a, e
   8DE7 78            [ 4] 1065 	ld	a,b
   8DE8 9A            [ 4] 1066 	sbc	a, d
   8DE9 E2 EE 8D      [10] 1067 	jp	PO, 00199$
   8DEC EE 80         [ 7] 1068 	xor	a, #0x80
   8DEE                    1069 00199$:
   8DEE F2 F7 8D      [10] 1070 	jp	P,00127$
   8DF1                    1071 00126$:
                           1072 ;src/main.c:264: colisiona = 0;
   8DF1 DD 36 F9 00   [19] 1073 	ld	-7 (ix),#0x00
   8DF5 18 49         [12] 1074 	jr	00135$
   8DF7                    1075 00127$:
                           1076 ;src/main.c:267: if(prota.y > enemy->y){ //si el prota esta abajo
   8DF7 21 C5 88      [10] 1077 	ld	hl, #(_prota + 0x0001) + 0
   8DFA 4E            [ 7] 1078 	ld	c,(hl)
   8DFB DD 6E FE      [19] 1079 	ld	l,-2 (ix)
   8DFE DD 66 FF      [19] 1080 	ld	h,-1 (ix)
   8E01 5E            [ 7] 1081 	ld	e,(hl)
   8E02 7B            [ 4] 1082 	ld	a,e
   8E03 91            [ 4] 1083 	sub	a, c
   8E04 30 2C         [12] 1084 	jr	NC,00124$
                           1085 ;src/main.c:268: if( prota.y - (enemy->y + G_ENEMY_H) > 2){ // si hay espacio entre el enemigo y el prota
   8E06 06 00         [ 7] 1086 	ld	b,#0x00
   8E08 16 00         [ 7] 1087 	ld	d,#0x00
   8E0A 21 16 00      [10] 1088 	ld	hl,#0x0016
   8E0D 19            [11] 1089 	add	hl,de
   8E0E 79            [ 4] 1090 	ld	a,c
   8E0F 95            [ 4] 1091 	sub	a, l
   8E10 4F            [ 4] 1092 	ld	c,a
   8E11 78            [ 4] 1093 	ld	a,b
   8E12 9C            [ 4] 1094 	sbc	a, h
   8E13 47            [ 4] 1095 	ld	b,a
   8E14 3E 02         [ 7] 1096 	ld	a,#0x02
   8E16 B9            [ 4] 1097 	cp	a, c
   8E17 3E 00         [ 7] 1098 	ld	a,#0x00
   8E19 98            [ 4] 1099 	sbc	a, b
   8E1A E2 1F 8E      [10] 1100 	jp	PO, 00200$
   8E1D EE 80         [ 7] 1101 	xor	a, #0x80
   8E1F                    1102 00200$:
   8E1F F2 28 8E      [10] 1103 	jp	P,00121$
                           1104 ;src/main.c:269: colisiona = 0;
   8E22 DD 36 F9 00   [19] 1105 	ld	-7 (ix),#0x00
   8E26 18 18         [12] 1106 	jr	00135$
   8E28                    1107 00121$:
                           1108 ;src/main.c:272: enemy->mira = M_arriba;
   8E28 DD 6E FC      [19] 1109 	ld	l,-4 (ix)
   8E2B DD 66 FD      [19] 1110 	ld	h,-3 (ix)
   8E2E 36 02         [10] 1111 	ld	(hl),#0x02
   8E30 18 0E         [12] 1112 	jr	00135$
   8E32                    1113 00124$:
                           1114 ;src/main.c:275: colisiona = 0;
   8E32 DD 36 F9 00   [19] 1115 	ld	-7 (ix),#0x00
   8E36 18 08         [12] 1116 	jr	00135$
   8E38                    1117 00131$:
                           1118 ;src/main.c:279: enemy->mira = M_arriba;
   8E38 DD 6E FC      [19] 1119 	ld	l,-4 (ix)
   8E3B DD 66 FD      [19] 1120 	ld	h,-3 (ix)
   8E3E 36 02         [10] 1121 	ld	(hl),#0x02
                           1122 ;src/main.c:282: }
   8E40                    1123 00135$:
                           1124 ;src/main.c:283: return colisiona;
   8E40 DD 6E F9      [19] 1125 	ld	l,-7 (ix)
   8E43 DD F9         [10] 1126 	ld	sp, ix
   8E45 DD E1         [14] 1127 	pop	ix
   8E47 C9            [10] 1128 	ret
                           1129 ;src/main.c:286: void moverEnemigoArriba(TEnemy *enemy){
                           1130 ;	---------------------------------
                           1131 ; Function moverEnemigoArriba
                           1132 ; ---------------------------------
   8E48                    1133 _moverEnemigoArriba::
   8E48 DD E5         [15] 1134 	push	ix
   8E4A DD 21 00 00   [14] 1135 	ld	ix,#0
   8E4E DD 39         [15] 1136 	add	ix,sp
                           1137 ;src/main.c:287: enemy->y--;
   8E50 DD 4E 04      [19] 1138 	ld	c,4 (ix)
   8E53 DD 46 05      [19] 1139 	ld	b,5 (ix)
   8E56 69            [ 4] 1140 	ld	l, c
   8E57 60            [ 4] 1141 	ld	h, b
   8E58 23            [ 6] 1142 	inc	hl
   8E59 5E            [ 7] 1143 	ld	e,(hl)
   8E5A 1D            [ 4] 1144 	dec	e
   8E5B 73            [ 7] 1145 	ld	(hl),e
                           1146 ;src/main.c:288: enemy->y--;
   8E5C 1D            [ 4] 1147 	dec	e
   8E5D 73            [ 7] 1148 	ld	(hl),e
                           1149 ;src/main.c:289: enemy->mover = SI;
   8E5E 21 06 00      [10] 1150 	ld	hl,#0x0006
   8E61 09            [11] 1151 	add	hl,bc
   8E62 36 01         [10] 1152 	ld	(hl),#0x01
   8E64 DD E1         [14] 1153 	pop	ix
   8E66 C9            [10] 1154 	ret
                           1155 ;src/main.c:292: void moverEnemigoAbajo(TEnemy *enemy){
                           1156 ;	---------------------------------
                           1157 ; Function moverEnemigoAbajo
                           1158 ; ---------------------------------
   8E67                    1159 _moverEnemigoAbajo::
   8E67 DD E5         [15] 1160 	push	ix
   8E69 DD 21 00 00   [14] 1161 	ld	ix,#0
   8E6D DD 39         [15] 1162 	add	ix,sp
                           1163 ;src/main.c:293: enemy->y++;
   8E6F DD 4E 04      [19] 1164 	ld	c,4 (ix)
   8E72 DD 46 05      [19] 1165 	ld	b,5 (ix)
   8E75 59            [ 4] 1166 	ld	e, c
   8E76 50            [ 4] 1167 	ld	d, b
   8E77 13            [ 6] 1168 	inc	de
   8E78 1A            [ 7] 1169 	ld	a,(de)
   8E79 3C            [ 4] 1170 	inc	a
   8E7A 12            [ 7] 1171 	ld	(de),a
                           1172 ;src/main.c:294: enemy->y++;
   8E7B 3C            [ 4] 1173 	inc	a
   8E7C 12            [ 7] 1174 	ld	(de),a
                           1175 ;src/main.c:295: enemy->mover = SI;
   8E7D 21 06 00      [10] 1176 	ld	hl,#0x0006
   8E80 09            [11] 1177 	add	hl,bc
   8E81 36 01         [10] 1178 	ld	(hl),#0x01
   8E83 DD E1         [14] 1179 	pop	ix
   8E85 C9            [10] 1180 	ret
                           1181 ;src/main.c:298: void moverEnemigo(TEnemy *enemy){
                           1182 ;	---------------------------------
                           1183 ; Function moverEnemigo
                           1184 ; ---------------------------------
   8E86                    1185 _moverEnemigo::
   8E86 DD E5         [15] 1186 	push	ix
   8E88 DD 21 00 00   [14] 1187 	ld	ix,#0
   8E8C DD 39         [15] 1188 	add	ix,sp
                           1189 ;src/main.c:299: if(!enemy->muerto){
   8E8E DD 4E 04      [19] 1190 	ld	c,4 (ix)
   8E91 DD 46 05      [19] 1191 	ld	b,5 (ix)
   8E94 C5            [11] 1192 	push	bc
   8E95 FD E1         [14] 1193 	pop	iy
   8E97 FD 7E 08      [19] 1194 	ld	a,8 (iy)
   8E9A B7            [ 4] 1195 	or	a, a
   8E9B 20 3C         [12] 1196 	jr	NZ,00110$
                           1197 ;src/main.c:300: if(!checkEnemyCollision(enemy->mira, enemy)){
   8E9D 21 07 00      [10] 1198 	ld	hl,#0x0007
   8EA0 09            [11] 1199 	add	hl,bc
   8EA1 5E            [ 7] 1200 	ld	e,(hl)
   8EA2 16 00         [ 7] 1201 	ld	d,#0x00
   8EA4 E5            [11] 1202 	push	hl
   8EA5 C5            [11] 1203 	push	bc
   8EA6 C5            [11] 1204 	push	bc
   8EA7 D5            [11] 1205 	push	de
   8EA8 CD 2D 8C      [17] 1206 	call	_checkEnemyCollision
   8EAB F1            [10] 1207 	pop	af
   8EAC F1            [10] 1208 	pop	af
   8EAD 7D            [ 4] 1209 	ld	a,l
   8EAE C1            [10] 1210 	pop	bc
   8EAF E1            [10] 1211 	pop	hl
   8EB0 B7            [ 4] 1212 	or	a, a
   8EB1 20 26         [12] 1213 	jr	NZ,00110$
                           1214 ;src/main.c:302: switch (enemy->mira) {
   8EB3 5E            [ 7] 1215 	ld	e,(hl)
   8EB4 3E 03         [ 7] 1216 	ld	a,#0x03
   8EB6 93            [ 4] 1217 	sub	a, e
   8EB7 38 20         [12] 1218 	jr	C,00110$
   8EB9 16 00         [ 7] 1219 	ld	d,#0x00
   8EBB 21 C1 8E      [10] 1220 	ld	hl,#00124$
   8EBE 19            [11] 1221 	add	hl,de
   8EBF 19            [11] 1222 	add	hl,de
                           1223 ;src/main.c:304: case 0:
                           1224 ;src/main.c:306: break;
                           1225 ;src/main.c:307: case 1:
                           1226 ;src/main.c:309: break;
                           1227 ;src/main.c:310: case 2:
   8EC0 E9            [ 4] 1228 	jp	(hl)
   8EC1                    1229 00124$:
   8EC1 18 16         [12] 1230 	jr	00110$
   8EC3 18 14         [12] 1231 	jr	00110$
   8EC5 18 06         [12] 1232 	jr	00103$
   8EC7 18 0B         [12] 1233 	jr	00104$
   8EC9 18 0E         [12] 1234 	jr	00110$
   8ECB 18 0C         [12] 1235 	jr	00110$
   8ECD                    1236 00103$:
                           1237 ;src/main.c:311: moverEnemigoArriba(enemy);
   8ECD C5            [11] 1238 	push	bc
   8ECE CD 48 8E      [17] 1239 	call	_moverEnemigoArriba
   8ED1 F1            [10] 1240 	pop	af
                           1241 ;src/main.c:312: break;
   8ED2 18 05         [12] 1242 	jr	00110$
                           1243 ;src/main.c:313: case 3:
   8ED4                    1244 00104$:
                           1245 ;src/main.c:314: moverEnemigoAbajo(enemy);
   8ED4 C5            [11] 1246 	push	bc
   8ED5 CD 67 8E      [17] 1247 	call	_moverEnemigoAbajo
   8ED8 F1            [10] 1248 	pop	af
                           1249 ;src/main.c:316: }
   8ED9                    1250 00110$:
   8ED9 DD E1         [14] 1251 	pop	ix
   8EDB C9            [10] 1252 	ret
                           1253 ;src/main.c:322: void patrolDecision(TEnemy *enemy) { // o devuelve direccion o le pasamos un enemigo y lo mueve
                           1254 ;	---------------------------------
                           1255 ; Function patrolDecision
                           1256 ; ---------------------------------
   8EDC                    1257 _patrolDecision::
                           1258 ;src/main.c:323: u8 decision = cpct_getRandom_mxor_u8() % 4;
   8EDC CD 19 87      [17] 1259 	call	_cpct_getRandom_mxor_u8
   8EDF 7D            [ 4] 1260 	ld	a,l
   8EE0 E6 03         [ 7] 1261 	and	a, #0x03
   8EE2 5F            [ 4] 1262 	ld	e,a
                           1263 ;src/main.c:325: switch (decision) {
   8EE3 3E 03         [ 7] 1264 	ld	a,#0x03
   8EE5 93            [ 4] 1265 	sub	a, e
   8EE6 D8            [11] 1266 	ret	C
   8EE7 16 00         [ 7] 1267 	ld	d,#0x00
   8EE9 21 EF 8E      [10] 1268 	ld	hl,#00112$
   8EEC 19            [11] 1269 	add	hl,de
   8EED 19            [11] 1270 	add	hl,de
                           1271 ;src/main.c:326: case 0:
   8EEE E9            [ 4] 1272 	jp	(hl)
   8EEF                    1273 00112$:
   8EEF 18 06         [12] 1274 	jr	00101$
   8EF1 18 0D         [12] 1275 	jr	00106$
   8EF3 18 0B         [12] 1276 	jr	00106$
   8EF5 18 09         [12] 1277 	jr	00104$
   8EF7                    1278 00101$:
                           1279 ;src/main.c:327: moverEnemigoAbajo(enemy);
   8EF7 C1            [10] 1280 	pop	bc
   8EF8 E1            [10] 1281 	pop	hl
   8EF9 E5            [11] 1282 	push	hl
   8EFA C5            [11] 1283 	push	bc
   8EFB E5            [11] 1284 	push	hl
   8EFC CD 67 8E      [17] 1285 	call	_moverEnemigoAbajo
   8EFF F1            [10] 1286 	pop	af
                           1287 ;src/main.c:328: break;
                           1288 ;src/main.c:329: case 1:
                           1289 ;src/main.c:330: break;
                           1290 ;src/main.c:331: case 2:
                           1291 ;src/main.c:332: break;
                           1292 ;src/main.c:333: case 3:
                           1293 ;src/main.c:335: }
   8F00                    1294 00104$:
   8F00                    1295 00106$:
   8F00 C9            [10] 1296 	ret
                           1297 ;src/main.c:338: void avanzarMapa() {
                           1298 ;	---------------------------------
                           1299 ; Function avanzarMapa
                           1300 ; ---------------------------------
   8F01                    1301 _avanzarMapa::
                           1302 ;src/main.c:339: if(num_mapa < NUM_MAPAS -1) {
   8F01 3A D8 88      [13] 1303 	ld	a,(#_num_mapa + 0)
   8F04 D6 02         [ 7] 1304 	sub	a, #0x02
   8F06 D2 7E 89      [10] 1305 	jp	NC,_menuFin
                           1306 ;src/main.c:340: mapa = mapas[++num_mapa];
   8F09 21 D8 88      [10] 1307 	ld	hl, #_num_mapa+0
   8F0C 34            [11] 1308 	inc	(hl)
   8F0D FD 21 D8 88   [14] 1309 	ld	iy,#_num_mapa
   8F11 FD 6E 00      [19] 1310 	ld	l,0 (iy)
   8F14 26 00         [ 7] 1311 	ld	h,#0x00
   8F16 29            [11] 1312 	add	hl, hl
   8F17 11 EF 88      [10] 1313 	ld	de,#_mapas
   8F1A 19            [11] 1314 	add	hl,de
   8F1B 7E            [ 7] 1315 	ld	a,(hl)
   8F1C FD 21 D6 88   [14] 1316 	ld	iy,#_mapa
   8F20 FD 77 00      [19] 1317 	ld	0 (iy),a
   8F23 23            [ 6] 1318 	inc	hl
   8F24 7E            [ 7] 1319 	ld	a,(hl)
   8F25 32 D7 88      [13] 1320 	ld	(#_mapa + 1),a
                           1321 ;src/main.c:341: prota.x = prota.px = 2;
   8F28 21 C6 88      [10] 1322 	ld	hl,#(_prota + 0x0002)
   8F2B 36 02         [10] 1323 	ld	(hl),#0x02
   8F2D 21 C4 88      [10] 1324 	ld	hl,#_prota
   8F30 36 02         [10] 1325 	ld	(hl),#0x02
                           1326 ;src/main.c:342: prota.mover = SI;
   8F32 21 CA 88      [10] 1327 	ld	hl,#(_prota + 0x0006)
                           1328 ;src/main.c:343: dibujarMapa();
                           1329 ;src/main.c:347: menuFin();
   8F35 36 01         [10] 1330 	ld	(hl), #0x01
   8F37 C3 D9 88      [10] 1331 	jp	_dibujarMapa
                           1332 ;src/main.c:351: void moverIzquierda() {
                           1333 ;	---------------------------------
                           1334 ; Function moverIzquierda
                           1335 ; ---------------------------------
   8F3A                    1336 _moverIzquierda::
                           1337 ;src/main.c:352: prota.mira = M_izquierda;
   8F3A 01 C4 88      [10] 1338 	ld	bc,#_prota+0
   8F3D 21 CB 88      [10] 1339 	ld	hl,#(_prota + 0x0007)
   8F40 36 01         [10] 1340 	ld	(hl),#0x01
                           1341 ;src/main.c:353: if (!checkCollision(M_izquierda)) {
   8F42 C5            [11] 1342 	push	bc
   8F43 21 01 00      [10] 1343 	ld	hl,#0x0001
   8F46 E5            [11] 1344 	push	hl
   8F47 CD F1 89      [17] 1345 	call	_checkCollision
   8F4A F1            [10] 1346 	pop	af
   8F4B C1            [10] 1347 	pop	bc
   8F4C 7D            [ 4] 1348 	ld	a,l
   8F4D B7            [ 4] 1349 	or	a, a
   8F4E C0            [11] 1350 	ret	NZ
                           1351 ;src/main.c:354: prota.x--;
   8F4F 0A            [ 7] 1352 	ld	a,(bc)
   8F50 C6 FF         [ 7] 1353 	add	a,#0xFF
   8F52 02            [ 7] 1354 	ld	(bc),a
                           1355 ;src/main.c:355: prota.mover = SI;
   8F53 21 CA 88      [10] 1356 	ld	hl,#(_prota + 0x0006)
   8F56 36 01         [10] 1357 	ld	(hl),#0x01
                           1358 ;src/main.c:356: prota.sprite = g_hero_left;
   8F58 21 A6 79      [10] 1359 	ld	hl,#_g_hero_left
   8F5B 22 C8 88      [16] 1360 	ld	((_prota + 0x0004)), hl
   8F5E C9            [10] 1361 	ret
                           1362 ;src/main.c:360: void moverDerecha() {
                           1363 ;	---------------------------------
                           1364 ; Function moverDerecha
                           1365 ; ---------------------------------
   8F5F                    1366 _moverDerecha::
                           1367 ;src/main.c:361: prota.mira = M_derecha;
   8F5F 21 CB 88      [10] 1368 	ld	hl,#(_prota + 0x0007)
   8F62 36 00         [10] 1369 	ld	(hl),#0x00
                           1370 ;src/main.c:362: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   8F64 21 00 00      [10] 1371 	ld	hl,#0x0000
   8F67 E5            [11] 1372 	push	hl
   8F68 CD F1 89      [17] 1373 	call	_checkCollision
   8F6B F1            [10] 1374 	pop	af
   8F6C 45            [ 4] 1375 	ld	b,l
   8F6D 21 C4 88      [10] 1376 	ld	hl, #_prota + 0
   8F70 4E            [ 7] 1377 	ld	c,(hl)
   8F71 59            [ 4] 1378 	ld	e,c
   8F72 16 00         [ 7] 1379 	ld	d,#0x00
   8F74 21 07 00      [10] 1380 	ld	hl,#0x0007
   8F77 19            [11] 1381 	add	hl,de
   8F78 11 50 80      [10] 1382 	ld	de, #0x8050
   8F7B 29            [11] 1383 	add	hl, hl
   8F7C 3F            [ 4] 1384 	ccf
   8F7D CB 1C         [ 8] 1385 	rr	h
   8F7F CB 1D         [ 8] 1386 	rr	l
   8F81 ED 52         [15] 1387 	sbc	hl, de
   8F83 3E 00         [ 7] 1388 	ld	a,#0x00
   8F85 17            [ 4] 1389 	rla
   8F86 5F            [ 4] 1390 	ld	e,a
   8F87 78            [ 4] 1391 	ld	a,b
   8F88 B7            [ 4] 1392 	or	a,a
   8F89 20 14         [12] 1393 	jr	NZ,00104$
   8F8B B3            [ 4] 1394 	or	a,e
   8F8C 28 11         [12] 1395 	jr	Z,00104$
                           1396 ;src/main.c:363: prota.x++;
   8F8E 0C            [ 4] 1397 	inc	c
   8F8F 21 C4 88      [10] 1398 	ld	hl,#_prota
   8F92 71            [ 7] 1399 	ld	(hl),c
                           1400 ;src/main.c:364: prota.mover = SI;
   8F93 21 CA 88      [10] 1401 	ld	hl,#(_prota + 0x0006)
   8F96 36 01         [10] 1402 	ld	(hl),#0x01
                           1403 ;src/main.c:365: prota.sprite = g_hero;
   8F98 21 50 7A      [10] 1404 	ld	hl,#_g_hero
   8F9B 22 C8 88      [16] 1405 	ld	((_prota + 0x0004)), hl
   8F9E C9            [10] 1406 	ret
   8F9F                    1407 00104$:
                           1408 ;src/main.c:367: }else if( prota.x + G_HERO_W >= 80){
   8F9F 7B            [ 4] 1409 	ld	a,e
   8FA0 B7            [ 4] 1410 	or	a, a
   8FA1 C0            [11] 1411 	ret	NZ
                           1412 ;src/main.c:368: avanzarMapa();
   8FA2 C3 01 8F      [10] 1413 	jp  _avanzarMapa
                           1414 ;src/main.c:372: void moverArriba() {
                           1415 ;	---------------------------------
                           1416 ; Function moverArriba
                           1417 ; ---------------------------------
   8FA5                    1418 _moverArriba::
                           1419 ;src/main.c:373: prota.mira = M_arriba;
   8FA5 21 CB 88      [10] 1420 	ld	hl,#(_prota + 0x0007)
   8FA8 36 02         [10] 1421 	ld	(hl),#0x02
                           1422 ;src/main.c:374: if (!checkCollision(M_arriba) && (prota.y >= 0)) { // TODO: COMPROBAR
   8FAA 21 02 00      [10] 1423 	ld	hl,#0x0002
   8FAD E5            [11] 1424 	push	hl
   8FAE CD F1 89      [17] 1425 	call	_checkCollision
   8FB1 F1            [10] 1426 	pop	af
   8FB2 7D            [ 4] 1427 	ld	a,l
   8FB3 B7            [ 4] 1428 	or	a, a
   8FB4 C0            [11] 1429 	ret	NZ
                           1430 ;src/main.c:375: prota.y--;
   8FB5 21 C5 88      [10] 1431 	ld	hl,#_prota + 1
   8FB8 4E            [ 7] 1432 	ld	c,(hl)
   8FB9 0D            [ 4] 1433 	dec	c
   8FBA 71            [ 7] 1434 	ld	(hl),c
                           1435 ;src/main.c:376: prota.y--;
   8FBB 0D            [ 4] 1436 	dec	c
   8FBC 71            [ 7] 1437 	ld	(hl),c
                           1438 ;src/main.c:377: prota.mover  = SI;
   8FBD 21 CA 88      [10] 1439 	ld	hl,#(_prota + 0x0006)
   8FC0 36 01         [10] 1440 	ld	(hl),#0x01
                           1441 ;src/main.c:378: prota.sprite = g_hero_up;
   8FC2 21 0C 79      [10] 1442 	ld	hl,#_g_hero_up
   8FC5 22 C8 88      [16] 1443 	ld	((_prota + 0x0004)), hl
   8FC8 C9            [10] 1444 	ret
                           1445 ;src/main.c:382: void moverAbajo() {
                           1446 ;	---------------------------------
                           1447 ; Function moverAbajo
                           1448 ; ---------------------------------
   8FC9                    1449 _moverAbajo::
                           1450 ;src/main.c:383: prota.mira = M_abajo;
   8FC9 21 CB 88      [10] 1451 	ld	hl,#(_prota + 0x0007)
   8FCC 36 03         [10] 1452 	ld	(hl),#0x03
                           1453 ;src/main.c:384: if (!checkCollision(M_abajo) && (prota.y + G_HERO_H < ALTO_MAPA)) { // TODO: COMPROBAR
   8FCE 21 03 00      [10] 1454 	ld	hl,#0x0003
   8FD1 E5            [11] 1455 	push	hl
   8FD2 CD F1 89      [17] 1456 	call	_checkCollision
   8FD5 F1            [10] 1457 	pop	af
   8FD6 7D            [ 4] 1458 	ld	a,l
   8FD7 B7            [ 4] 1459 	or	a, a
   8FD8 C0            [11] 1460 	ret	NZ
   8FD9 01 C5 88      [10] 1461 	ld	bc,#_prota + 1
   8FDC 0A            [ 7] 1462 	ld	a,(bc)
   8FDD 5F            [ 4] 1463 	ld	e,a
   8FDE 6B            [ 4] 1464 	ld	l,e
   8FDF 26 00         [ 7] 1465 	ld	h,#0x00
   8FE1 D5            [11] 1466 	push	de
   8FE2 11 16 00      [10] 1467 	ld	de,#0x0016
   8FE5 19            [11] 1468 	add	hl, de
   8FE6 D1            [10] 1469 	pop	de
   8FE7 7D            [ 4] 1470 	ld	a,l
   8FE8 D6 B0         [ 7] 1471 	sub	a, #0xB0
   8FEA 7C            [ 4] 1472 	ld	a,h
   8FEB 17            [ 4] 1473 	rla
   8FEC 3F            [ 4] 1474 	ccf
   8FED 1F            [ 4] 1475 	rra
   8FEE DE 80         [ 7] 1476 	sbc	a, #0x80
   8FF0 D0            [11] 1477 	ret	NC
                           1478 ;src/main.c:385: prota.y++;
   8FF1 7B            [ 4] 1479 	ld	a,e
   8FF2 3C            [ 4] 1480 	inc	a
   8FF3 02            [ 7] 1481 	ld	(bc),a
                           1482 ;src/main.c:386: prota.y++;
   8FF4 3C            [ 4] 1483 	inc	a
   8FF5 02            [ 7] 1484 	ld	(bc),a
                           1485 ;src/main.c:387: prota.mover  = SI;
   8FF6 21 CA 88      [10] 1486 	ld	hl,#(_prota + 0x0006)
   8FF9 36 01         [10] 1487 	ld	(hl),#0x01
                           1488 ;src/main.c:388: prota.sprite = g_hero_down;
   8FFB 21 72 78      [10] 1489 	ld	hl,#_g_hero_down
   8FFE 22 C8 88      [16] 1490 	ld	((_prota + 0x0004)), hl
   9001 C9            [10] 1491 	ret
                           1492 ;src/main.c:392: void dibujarCuchillo() {
                           1493 ;	---------------------------------
                           1494 ; Function dibujarCuchillo
                           1495 ; ---------------------------------
   9002                    1496 _dibujarCuchillo::
   9002 DD E5         [15] 1497 	push	ix
   9004 DD 21 00 00   [14] 1498 	ld	ix,#0
   9008 DD 39         [15] 1499 	add	ix,sp
   900A F5            [11] 1500 	push	af
                           1501 ;src/main.c:393: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   900B 21 CD 88      [10] 1502 	ld	hl, #_cu + 1
   900E 56            [ 7] 1503 	ld	d,(hl)
   900F 21 CC 88      [10] 1504 	ld	hl, #_cu + 0
   9012 46            [ 7] 1505 	ld	b,(hl)
   9013 D5            [11] 1506 	push	de
   9014 33            [ 6] 1507 	inc	sp
   9015 C5            [11] 1508 	push	bc
   9016 33            [ 6] 1509 	inc	sp
   9017 21 00 C0      [10] 1510 	ld	hl,#0xC000
   901A E5            [11] 1511 	push	hl
   901B CD 18 88      [17] 1512 	call	_cpct_getScreenPtr
   901E 45            [ 4] 1513 	ld	b,l
   901F 5C            [ 4] 1514 	ld	e,h
                           1515 ;src/main.c:394: if(cu.eje == E_X){
   9020 21 D4 88      [10] 1516 	ld	hl, #_cu + 8
   9023 4E            [ 7] 1517 	ld	c,(hl)
                           1518 ;src/main.c:395: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   9024 DD 70 FE      [19] 1519 	ld	-2 (ix),b
   9027 DD 73 FF      [19] 1520 	ld	-1 (ix),e
                           1521 ;src/main.c:394: if(cu.eje == E_X){
   902A 79            [ 4] 1522 	ld	a,c
   902B B7            [ 4] 1523 	or	a, a
   902C 20 19         [12] 1524 	jr	NZ,00104$
                           1525 ;src/main.c:395: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   902E 11 00 3E      [10] 1526 	ld	de,#_g_tablatrans+0
   9031 ED 4B D0 88   [20] 1527 	ld	bc, (#(_cu + 0x0004) + 0)
   9035 D5            [11] 1528 	push	de
   9036 21 04 04      [10] 1529 	ld	hl,#0x0404
   9039 E5            [11] 1530 	push	hl
   903A DD 6E FE      [19] 1531 	ld	l,-2 (ix)
   903D DD 66 FF      [19] 1532 	ld	h,-1 (ix)
   9040 E5            [11] 1533 	push	hl
   9041 C5            [11] 1534 	push	bc
   9042 CD 38 88      [17] 1535 	call	_cpct_drawSpriteMaskedAlignedTable
   9045 18 1A         [12] 1536 	jr	00106$
   9047                    1537 00104$:
                           1538 ;src/main.c:398: else if(cu.eje == E_Y){
   9047 0D            [ 4] 1539 	dec	c
   9048 20 17         [12] 1540 	jr	NZ,00106$
                           1541 ;src/main.c:399: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   904A 11 00 3E      [10] 1542 	ld	de,#_g_tablatrans+0
   904D ED 4B D0 88   [20] 1543 	ld	bc, (#(_cu + 0x0004) + 0)
   9051 D5            [11] 1544 	push	de
   9052 21 02 08      [10] 1545 	ld	hl,#0x0802
   9055 E5            [11] 1546 	push	hl
   9056 DD 6E FE      [19] 1547 	ld	l,-2 (ix)
   9059 DD 66 FF      [19] 1548 	ld	h,-1 (ix)
   905C E5            [11] 1549 	push	hl
   905D C5            [11] 1550 	push	bc
   905E CD 38 88      [17] 1551 	call	_cpct_drawSpriteMaskedAlignedTable
   9061                    1552 00106$:
   9061 DD F9         [10] 1553 	ld	sp, ix
   9063 DD E1         [14] 1554 	pop	ix
   9065 C9            [10] 1555 	ret
                           1556 ;src/main.c:403: void borrarCuchillo() {
                           1557 ;	---------------------------------
                           1558 ; Function borrarCuchillo
                           1559 ; ---------------------------------
   9066                    1560 _borrarCuchillo::
   9066 DD E5         [15] 1561 	push	ix
   9068 DD 21 00 00   [14] 1562 	ld	ix,#0
   906C DD 39         [15] 1563 	add	ix,sp
   906E 3B            [ 6] 1564 	dec	sp
                           1565 ;src/main.c:405: u8 w = 2 + (cu.px & 1);
   906F 21 CE 88      [10] 1566 	ld	hl, #_cu + 2
   9072 4E            [ 7] 1567 	ld	c,(hl)
   9073 79            [ 4] 1568 	ld	a,c
   9074 E6 01         [ 7] 1569 	and	a, #0x01
   9076 47            [ 4] 1570 	ld	b,a
   9077 04            [ 4] 1571 	inc	b
   9078 04            [ 4] 1572 	inc	b
                           1573 ;src/main.c:406: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   9079 21 CF 88      [10] 1574 	ld	hl, #_cu + 3
   907C 5E            [ 7] 1575 	ld	e,(hl)
   907D 7B            [ 4] 1576 	ld	a,e
   907E E6 03         [ 7] 1577 	and	a, #0x03
   9080 28 04         [12] 1578 	jr	Z,00105$
   9082 3E 01         [ 7] 1579 	ld	a,#0x01
   9084 18 02         [12] 1580 	jr	00106$
   9086                    1581 00105$:
   9086 3E 00         [ 7] 1582 	ld	a,#0x00
   9088                    1583 00106$:
   9088 C6 02         [ 7] 1584 	add	a, #0x02
   908A DD 77 FF      [19] 1585 	ld	-1 (ix),a
                           1586 ;src/main.c:407: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   908D FD 2A D6 88   [20] 1587 	ld	iy,(_mapa)
   9091 16 00         [ 7] 1588 	ld	d,#0x00
   9093 63            [ 4] 1589 	ld	h,e
   9094 6A            [ 4] 1590 	ld	l,d
   9095 CB 7A         [ 8] 1591 	bit	7, d
   9097 28 05         [12] 1592 	jr	Z,00107$
   9099 13            [ 6] 1593 	inc	de
   909A 13            [ 6] 1594 	inc	de
   909B 13            [ 6] 1595 	inc	de
   909C 63            [ 4] 1596 	ld	h,e
   909D 6A            [ 4] 1597 	ld	l,d
   909E                    1598 00107$:
   909E 5C            [ 4] 1599 	ld	e, h
   909F 55            [ 4] 1600 	ld	d, l
   90A0 CB 2A         [ 8] 1601 	sra	d
   90A2 CB 1B         [ 8] 1602 	rr	e
   90A4 CB 2A         [ 8] 1603 	sra	d
   90A6 CB 1B         [ 8] 1604 	rr	e
   90A8 51            [ 4] 1605 	ld	d,c
   90A9 CB 3A         [ 8] 1606 	srl	d
   90AB FD E5         [15] 1607 	push	iy
   90AD 21 00 C0      [10] 1608 	ld	hl,#0xC000
   90B0 E5            [11] 1609 	push	hl
   90B1 3E 28         [ 7] 1610 	ld	a,#0x28
   90B3 F5            [11] 1611 	push	af
   90B4 33            [ 6] 1612 	inc	sp
   90B5 DD 7E FF      [19] 1613 	ld	a,-1 (ix)
   90B8 F5            [11] 1614 	push	af
   90B9 33            [ 6] 1615 	inc	sp
   90BA C5            [11] 1616 	push	bc
   90BB 33            [ 6] 1617 	inc	sp
   90BC 7B            [ 4] 1618 	ld	a,e
   90BD F5            [11] 1619 	push	af
   90BE 33            [ 6] 1620 	inc	sp
   90BF D5            [11] 1621 	push	de
   90C0 33            [ 6] 1622 	inc	sp
   90C1 CD EC 7C      [17] 1623 	call	_cpct_etm_drawTileBox2x4
                           1624 ;src/main.c:408: if(!cu.mover){
   90C4 3A D5 88      [13] 1625 	ld	a, (#_cu + 9)
   90C7 B7            [ 4] 1626 	or	a, a
   90C8 20 05         [12] 1627 	jr	NZ,00103$
                           1628 ;src/main.c:409: cu.lanzado = NO;
   90CA 21 D2 88      [10] 1629 	ld	hl,#(_cu + 0x0006)
   90CD 36 00         [10] 1630 	ld	(hl),#0x00
   90CF                    1631 00103$:
   90CF 33            [ 6] 1632 	inc	sp
   90D0 DD E1         [14] 1633 	pop	ix
   90D2 C9            [10] 1634 	ret
                           1635 ;src/main.c:413: void redibujarCuchillo( ) {
                           1636 ;	---------------------------------
                           1637 ; Function redibujarCuchillo
                           1638 ; ---------------------------------
   90D3                    1639 _redibujarCuchillo::
                           1640 ;src/main.c:414: borrarCuchillo();
   90D3 CD 66 90      [17] 1641 	call	_borrarCuchillo
                           1642 ;src/main.c:415: cu.px = cu.x;
   90D6 01 CE 88      [10] 1643 	ld	bc,#_cu + 2
   90D9 3A CC 88      [13] 1644 	ld	a, (#_cu + 0)
   90DC 02            [ 7] 1645 	ld	(bc),a
                           1646 ;src/main.c:416: cu.py = cu.y;
   90DD 01 CF 88      [10] 1647 	ld	bc,#_cu + 3
   90E0 3A CD 88      [13] 1648 	ld	a, (#_cu + 1)
   90E3 02            [ 7] 1649 	ld	(bc),a
                           1650 ;src/main.c:417: dibujarCuchillo();
   90E4 C3 02 90      [10] 1651 	jp  _dibujarCuchillo
                           1652 ;src/main.c:421: void lanzarCuchillo(){
                           1653 ;	---------------------------------
                           1654 ; Function lanzarCuchillo
                           1655 ; ---------------------------------
   90E7                    1656 _lanzarCuchillo::
                           1657 ;src/main.c:423: if(!cu.lanzado){
   90E7 3A D2 88      [13] 1658 	ld	a, (#(_cu + 0x0006) + 0)
   90EA B7            [ 4] 1659 	or	a, a
   90EB C0            [11] 1660 	ret	NZ
                           1661 ;src/main.c:425: if(prota.mira == M_derecha){
   90EC 21 CB 88      [10] 1662 	ld	hl, #_prota + 7
   90EF 5E            [ 7] 1663 	ld	e,(hl)
                           1664 ;src/main.c:426: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   90F0 01 C5 88      [10] 1665 	ld	bc,#_prota + 1
                           1666 ;src/main.c:428: cu.direccion = M_derecha;
                           1667 ;src/main.c:430: cu.y=prota.y + G_HERO_H /2;
                           1668 ;src/main.c:431: cu.sprite=g_knifeX_0;
                           1669 ;src/main.c:432: cu.eje = E_X;
                           1670 ;src/main.c:425: if(prota.mira == M_derecha){
   90F3 7B            [ 4] 1671 	ld	a,e
   90F4 B7            [ 4] 1672 	or	a, a
   90F5 20 41         [12] 1673 	jr	NZ,00118$
                           1674 ;src/main.c:426: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   90F7 0A            [ 7] 1675 	ld	a,(bc)
   90F8 C6 0B         [ 7] 1676 	add	a, #0x0B
   90FA 5F            [ 4] 1677 	ld	e,a
   90FB 3A C4 88      [13] 1678 	ld	a, (#_prota + 0)
   90FE C6 0C         [ 7] 1679 	add	a, #0x0C
   9100 6F            [ 4] 1680 	ld	l,a
   9101 C5            [11] 1681 	push	bc
   9102 7B            [ 4] 1682 	ld	a,e
   9103 F5            [11] 1683 	push	af
   9104 33            [ 6] 1684 	inc	sp
   9105 7D            [ 4] 1685 	ld	a,l
   9106 F5            [11] 1686 	push	af
   9107 33            [ 6] 1687 	inc	sp
   9108 CD C9 89      [17] 1688 	call	_getTilePtr
   910B F1            [10] 1689 	pop	af
   910C C1            [10] 1690 	pop	bc
   910D 5E            [ 7] 1691 	ld	e,(hl)
   910E 3E 02         [ 7] 1692 	ld	a,#0x02
   9110 93            [ 4] 1693 	sub	a, e
   9111 D8            [11] 1694 	ret	C
                           1695 ;src/main.c:427: cu.lanzado = SI;
   9112 21 D2 88      [10] 1696 	ld	hl,#(_cu + 0x0006)
   9115 36 01         [10] 1697 	ld	(hl),#0x01
                           1698 ;src/main.c:428: cu.direccion = M_derecha;
   9117 21 D3 88      [10] 1699 	ld	hl,#(_cu + 0x0007)
   911A 36 00         [10] 1700 	ld	(hl),#0x00
                           1701 ;src/main.c:429: cu.x=prota.x + G_HERO_W;
   911C 3A C4 88      [13] 1702 	ld	a, (#_prota + 0)
   911F C6 07         [ 7] 1703 	add	a, #0x07
   9121 32 CC 88      [13] 1704 	ld	(#_cu),a
                           1705 ;src/main.c:430: cu.y=prota.y + G_HERO_H /2;
   9124 0A            [ 7] 1706 	ld	a,(bc)
   9125 C6 0B         [ 7] 1707 	add	a, #0x0B
   9127 32 CD 88      [13] 1708 	ld	(#(_cu + 0x0001)),a
                           1709 ;src/main.c:431: cu.sprite=g_knifeX_0;
   912A 21 C0 54      [10] 1710 	ld	hl,#_g_knifeX_0
   912D 22 D0 88      [16] 1711 	ld	((_cu + 0x0004)), hl
                           1712 ;src/main.c:432: cu.eje = E_X;
   9130 21 D4 88      [10] 1713 	ld	hl,#(_cu + 0x0008)
   9133 36 00         [10] 1714 	ld	(hl),#0x00
                           1715 ;src/main.c:433: dibujarCuchillo();
   9135 C3 02 90      [10] 1716 	jp  _dibujarCuchillo
   9138                    1717 00118$:
                           1718 ;src/main.c:436: else if(prota.mira == M_izquierda){
   9138 7B            [ 4] 1719 	ld	a,e
   9139 3D            [ 4] 1720 	dec	a
   913A 20 41         [12] 1721 	jr	NZ,00115$
                           1722 ;src/main.c:437: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   913C 0A            [ 7] 1723 	ld	a,(bc)
   913D C6 0B         [ 7] 1724 	add	a, #0x0B
   913F 5F            [ 4] 1725 	ld	e,a
   9140 3A C4 88      [13] 1726 	ld	a, (#_prota + 0)
   9143 C6 F6         [ 7] 1727 	add	a,#0xF6
   9145 6F            [ 4] 1728 	ld	l,a
   9146 C5            [11] 1729 	push	bc
   9147 7B            [ 4] 1730 	ld	a,e
   9148 F5            [11] 1731 	push	af
   9149 33            [ 6] 1732 	inc	sp
   914A 7D            [ 4] 1733 	ld	a,l
   914B F5            [11] 1734 	push	af
   914C 33            [ 6] 1735 	inc	sp
   914D CD C9 89      [17] 1736 	call	_getTilePtr
   9150 F1            [10] 1737 	pop	af
   9151 C1            [10] 1738 	pop	bc
   9152 5E            [ 7] 1739 	ld	e,(hl)
   9153 3E 02         [ 7] 1740 	ld	a,#0x02
   9155 93            [ 4] 1741 	sub	a, e
   9156 D8            [11] 1742 	ret	C
                           1743 ;src/main.c:438: cu.lanzado = SI;
   9157 21 D2 88      [10] 1744 	ld	hl,#(_cu + 0x0006)
   915A 36 01         [10] 1745 	ld	(hl),#0x01
                           1746 ;src/main.c:439: cu.direccion = M_izquierda;
   915C 21 D3 88      [10] 1747 	ld	hl,#(_cu + 0x0007)
   915F 36 01         [10] 1748 	ld	(hl),#0x01
                           1749 ;src/main.c:440: cu.x = prota.x - G_KNIFEX_0_W;
   9161 3A C4 88      [13] 1750 	ld	a, (#_prota + 0)
   9164 C6 FC         [ 7] 1751 	add	a,#0xFC
   9166 32 CC 88      [13] 1752 	ld	(#_cu),a
                           1753 ;src/main.c:441: cu.y = prota.y + G_HERO_H /2;
   9169 0A            [ 7] 1754 	ld	a,(bc)
   916A C6 0B         [ 7] 1755 	add	a, #0x0B
   916C 32 CD 88      [13] 1756 	ld	(#(_cu + 0x0001)),a
                           1757 ;src/main.c:442: cu.sprite = g_knifeX_1;
   916F 21 D0 54      [10] 1758 	ld	hl,#_g_knifeX_1
   9172 22 D0 88      [16] 1759 	ld	((_cu + 0x0004)), hl
                           1760 ;src/main.c:443: cu.eje = E_X;
   9175 21 D4 88      [10] 1761 	ld	hl,#(_cu + 0x0008)
   9178 36 00         [10] 1762 	ld	(hl),#0x00
                           1763 ;src/main.c:444: dibujarCuchillo();
   917A C3 02 90      [10] 1764 	jp  _dibujarCuchillo
   917D                    1765 00115$:
                           1766 ;src/main.c:447: else if(prota.mira == M_abajo){
   917D 7B            [ 4] 1767 	ld	a,e
   917E D6 03         [ 7] 1768 	sub	a, #0x03
   9180 20 41         [12] 1769 	jr	NZ,00112$
                           1770 ;src/main.c:449: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   9182 0A            [ 7] 1771 	ld	a,(bc)
   9183 C6 1F         [ 7] 1772 	add	a, #0x1F
   9185 5F            [ 4] 1773 	ld	e,a
   9186 3A C4 88      [13] 1774 	ld	a, (#_prota + 0)
   9189 57            [ 4] 1775 	ld	d,a
   918A 14            [ 4] 1776 	inc	d
   918B 14            [ 4] 1777 	inc	d
   918C 14            [ 4] 1778 	inc	d
   918D C5            [11] 1779 	push	bc
   918E 7B            [ 4] 1780 	ld	a,e
   918F F5            [11] 1781 	push	af
   9190 33            [ 6] 1782 	inc	sp
   9191 D5            [11] 1783 	push	de
   9192 33            [ 6] 1784 	inc	sp
   9193 CD C9 89      [17] 1785 	call	_getTilePtr
   9196 F1            [10] 1786 	pop	af
   9197 C1            [10] 1787 	pop	bc
   9198 5E            [ 7] 1788 	ld	e,(hl)
   9199 3E 02         [ 7] 1789 	ld	a,#0x02
   919B 93            [ 4] 1790 	sub	a, e
   919C D8            [11] 1791 	ret	C
                           1792 ;src/main.c:450: cu.lanzado = SI;
   919D 21 D2 88      [10] 1793 	ld	hl,#(_cu + 0x0006)
   91A0 36 01         [10] 1794 	ld	(hl),#0x01
                           1795 ;src/main.c:451: cu.direccion = M_abajo;
   91A2 21 D3 88      [10] 1796 	ld	hl,#(_cu + 0x0007)
   91A5 36 03         [10] 1797 	ld	(hl),#0x03
                           1798 ;src/main.c:452: cu.x = prota.x + G_HERO_W / 2;
   91A7 3A C4 88      [13] 1799 	ld	a, (#_prota + 0)
   91AA C6 03         [ 7] 1800 	add	a, #0x03
   91AC 32 CC 88      [13] 1801 	ld	(#_cu),a
                           1802 ;src/main.c:453: cu.y = prota.y + G_HERO_H;
   91AF 0A            [ 7] 1803 	ld	a,(bc)
   91B0 C6 16         [ 7] 1804 	add	a, #0x16
   91B2 32 CD 88      [13] 1805 	ld	(#(_cu + 0x0001)),a
                           1806 ;src/main.c:454: cu.sprite = g_knifeY_0;
   91B5 21 A0 54      [10] 1807 	ld	hl,#_g_knifeY_0
   91B8 22 D0 88      [16] 1808 	ld	((_cu + 0x0004)), hl
                           1809 ;src/main.c:455: cu.eje = E_Y;
   91BB 21 D4 88      [10] 1810 	ld	hl,#(_cu + 0x0008)
   91BE 36 01         [10] 1811 	ld	(hl),#0x01
                           1812 ;src/main.c:456: dibujarCuchillo();
   91C0 C3 02 90      [10] 1813 	jp  _dibujarCuchillo
   91C3                    1814 00112$:
                           1815 ;src/main.c:459: else if(prota.mira == M_arriba){
   91C3 7B            [ 4] 1816 	ld	a,e
   91C4 D6 02         [ 7] 1817 	sub	a, #0x02
   91C6 C0            [11] 1818 	ret	NZ
                           1819 ;src/main.c:460: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   91C7 0A            [ 7] 1820 	ld	a,(bc)
   91C8 C6 F7         [ 7] 1821 	add	a,#0xF7
   91CA 57            [ 4] 1822 	ld	d,a
   91CB 3A C4 88      [13] 1823 	ld	a, (#_prota + 0)
   91CE C6 03         [ 7] 1824 	add	a, #0x03
   91D0 C5            [11] 1825 	push	bc
   91D1 D5            [11] 1826 	push	de
   91D2 33            [ 6] 1827 	inc	sp
   91D3 F5            [11] 1828 	push	af
   91D4 33            [ 6] 1829 	inc	sp
   91D5 CD C9 89      [17] 1830 	call	_getTilePtr
   91D8 F1            [10] 1831 	pop	af
   91D9 C1            [10] 1832 	pop	bc
   91DA 5E            [ 7] 1833 	ld	e,(hl)
   91DB 3E 02         [ 7] 1834 	ld	a,#0x02
   91DD 93            [ 4] 1835 	sub	a, e
   91DE D8            [11] 1836 	ret	C
                           1837 ;src/main.c:461: cu.lanzado = SI;
   91DF 21 D2 88      [10] 1838 	ld	hl,#(_cu + 0x0006)
   91E2 36 01         [10] 1839 	ld	(hl),#0x01
                           1840 ;src/main.c:462: cu.direccion = M_arriba;
   91E4 21 D3 88      [10] 1841 	ld	hl,#(_cu + 0x0007)
   91E7 36 02         [10] 1842 	ld	(hl),#0x02
                           1843 ;src/main.c:463: cu.x = prota.x + G_HERO_W / 2;
   91E9 3A C4 88      [13] 1844 	ld	a, (#_prota + 0)
   91EC C6 03         [ 7] 1845 	add	a, #0x03
   91EE 32 CC 88      [13] 1846 	ld	(#_cu),a
                           1847 ;src/main.c:464: cu.y = prota.y;
   91F1 0A            [ 7] 1848 	ld	a,(bc)
   91F2 32 CD 88      [13] 1849 	ld	(#(_cu + 0x0001)),a
                           1850 ;src/main.c:465: cu.sprite = g_knifeY_1;
   91F5 21 B0 54      [10] 1851 	ld	hl,#_g_knifeY_1
   91F8 22 D0 88      [16] 1852 	ld	((_cu + 0x0004)), hl
                           1853 ;src/main.c:466: cu.eje = E_Y;
   91FB 21 D4 88      [10] 1854 	ld	hl,#(_cu + 0x0008)
   91FE 36 01         [10] 1855 	ld	(hl),#0x01
                           1856 ;src/main.c:467: dibujarCuchillo();
   9200 C3 02 90      [10] 1857 	jp  _dibujarCuchillo
                           1858 ;src/main.c:473: void comprobarTeclado() {
                           1859 ;	---------------------------------
                           1860 ; Function comprobarTeclado
                           1861 ; ---------------------------------
   9203                    1862 _comprobarTeclado::
                           1863 ;src/main.c:474: cpct_scanKeyboard_if();
   9203 CD 44 7E      [17] 1864 	call	_cpct_scanKeyboard_if
                           1865 ;src/main.c:476: if (cpct_isAnyKeyPressed()) {
   9206 CD 37 7E      [17] 1866 	call	_cpct_isAnyKeyPressed
   9209 7D            [ 4] 1867 	ld	a,l
   920A B7            [ 4] 1868 	or	a, a
   920B C8            [11] 1869 	ret	Z
                           1870 ;src/main.c:477: if (cpct_isKeyPressed(Key_CursorLeft))
   920C 21 01 01      [10] 1871 	ld	hl,#0x0101
   920F CD A1 7B      [17] 1872 	call	_cpct_isKeyPressed
   9212 7D            [ 4] 1873 	ld	a,l
   9213 B7            [ 4] 1874 	or	a, a
                           1875 ;src/main.c:478: moverIzquierda();
   9214 C2 3A 8F      [10] 1876 	jp	NZ,_moverIzquierda
                           1877 ;src/main.c:479: else if (cpct_isKeyPressed(Key_CursorRight))
   9217 21 00 02      [10] 1878 	ld	hl,#0x0200
   921A CD A1 7B      [17] 1879 	call	_cpct_isKeyPressed
   921D 7D            [ 4] 1880 	ld	a,l
   921E B7            [ 4] 1881 	or	a, a
                           1882 ;src/main.c:480: moverDerecha();
   921F C2 5F 8F      [10] 1883 	jp	NZ,_moverDerecha
                           1884 ;src/main.c:481: else if (cpct_isKeyPressed(Key_CursorUp))
   9222 21 00 01      [10] 1885 	ld	hl,#0x0100
   9225 CD A1 7B      [17] 1886 	call	_cpct_isKeyPressed
   9228 7D            [ 4] 1887 	ld	a,l
   9229 B7            [ 4] 1888 	or	a, a
                           1889 ;src/main.c:482: moverArriba();
   922A C2 A5 8F      [10] 1890 	jp	NZ,_moverArriba
                           1891 ;src/main.c:483: else if (cpct_isKeyPressed(Key_CursorDown))
   922D 21 00 04      [10] 1892 	ld	hl,#0x0400
   9230 CD A1 7B      [17] 1893 	call	_cpct_isKeyPressed
   9233 7D            [ 4] 1894 	ld	a,l
   9234 B7            [ 4] 1895 	or	a, a
                           1896 ;src/main.c:484: moverAbajo();
   9235 C2 C9 8F      [10] 1897 	jp	NZ,_moverAbajo
                           1898 ;src/main.c:485: else if (cpct_isKeyPressed(Key_Space))
   9238 21 05 80      [10] 1899 	ld	hl,#0x8005
   923B CD A1 7B      [17] 1900 	call	_cpct_isKeyPressed
   923E 7D            [ 4] 1901 	ld	a,l
   923F B7            [ 4] 1902 	or	a, a
   9240 C8            [11] 1903 	ret	Z
                           1904 ;src/main.c:486: lanzarCuchillo();
   9241 C3 E7 90      [10] 1905 	jp  _lanzarCuchillo
                           1906 ;src/main.c:490: u8 checkKnifeCollision(int direction){
                           1907 ;	---------------------------------
                           1908 ; Function checkKnifeCollision
                           1909 ; ---------------------------------
   9244                    1910 _checkKnifeCollision::
   9244 DD E5         [15] 1911 	push	ix
   9246 DD 21 00 00   [14] 1912 	ld	ix,#0
   924A DD 39         [15] 1913 	add	ix,sp
                           1914 ;src/main.c:492: u8 colisiona = 1;
   924C 0E 01         [ 7] 1915 	ld	c,#0x01
                           1916 ;src/main.c:494: switch (direction) {
   924E DD CB 05 7E   [20] 1917 	bit	7, 5 (ix)
   9252 C2 3E 93      [10] 1918 	jp	NZ,00125$
   9255 3E 03         [ 7] 1919 	ld	a,#0x03
   9257 DD BE 04      [19] 1920 	cp	a, 4 (ix)
   925A 3E 00         [ 7] 1921 	ld	a,#0x00
   925C DD 9E 05      [19] 1922 	sbc	a, 5 (ix)
   925F E2 64 92      [10] 1923 	jp	PO, 00163$
   9262 EE 80         [ 7] 1924 	xor	a, #0x80
   9264                    1925 00163$:
   9264 FA 3E 93      [10] 1926 	jp	M,00125$
   9267 DD 5E 04      [19] 1927 	ld	e,4 (ix)
   926A 16 00         [ 7] 1928 	ld	d,#0x00
   926C 21 73 92      [10] 1929 	ld	hl,#00164$
   926F 19            [11] 1930 	add	hl,de
   9270 19            [11] 1931 	add	hl,de
   9271 19            [11] 1932 	add	hl,de
   9272 E9            [ 4] 1933 	jp	(hl)
   9273                    1934 00164$:
   9273 C3 3E 93      [10] 1935 	jp	00125$
   9276 C3 3E 93      [10] 1936 	jp	00125$
   9279 C3 85 92      [10] 1937 	jp	00103$
   927C C3 DC 92      [10] 1938 	jp	00114$
                           1939 ;src/main.c:495: case 0:
                           1940 ;src/main.c:497: break;
   927F C3 3E 93      [10] 1941 	jp	00125$
                           1942 ;src/main.c:498: case 1:
                           1943 ;src/main.c:500: break;
   9282 C3 3E 93      [10] 1944 	jp	00125$
                           1945 ;src/main.c:501: case 2:
   9285                    1946 00103$:
                           1947 ;src/main.c:503: if((enemy->x + G_ENEMY_W) < cu.x || enemy->x  > (cu.x + G_KNIFEX_0_W)){
   9285 21 9C 88      [10] 1948 	ld	hl,#_enemy+0
   9288 4E            [ 7] 1949 	ld	c,(hl)
   9289 06 00         [ 7] 1950 	ld	b,#0x00
   928B 21 04 00      [10] 1951 	ld	hl,#0x0004
   928E 09            [11] 1952 	add	hl,bc
   928F EB            [ 4] 1953 	ex	de,hl
   9290 21 CC 88      [10] 1954 	ld	hl,#_cu+0
   9293 6E            [ 7] 1955 	ld	l,(hl)
   9294 26 00         [ 7] 1956 	ld	h,#0x00
   9296 7B            [ 4] 1957 	ld	a,e
   9297 95            [ 4] 1958 	sub	a, l
   9298 7A            [ 4] 1959 	ld	a,d
   9299 9C            [ 4] 1960 	sbc	a, h
   929A E2 9F 92      [10] 1961 	jp	PO, 00165$
   929D EE 80         [ 7] 1962 	xor	a, #0x80
   929F                    1963 00165$:
   929F FA DC 92      [10] 1964 	jp	M,00114$
   92A2 11 04 00      [10] 1965 	ld	de,#0x0004
   92A5 19            [11] 1966 	add	hl,de
   92A6 7D            [ 4] 1967 	ld	a,l
   92A7 91            [ 4] 1968 	sub	a, c
   92A8 7C            [ 4] 1969 	ld	a,h
   92A9 98            [ 4] 1970 	sbc	a, b
   92AA E2 AF 92      [10] 1971 	jp	PO, 00166$
   92AD EE 80         [ 7] 1972 	xor	a, #0x80
   92AF                    1973 00166$:
   92AF FA DC 92      [10] 1974 	jp	M,00114$
                           1975 ;src/main.c:506: if(cu.y>enemy->y){
   92B2 21 CD 88      [10] 1976 	ld	hl, #(_cu + 0x0001) + 0
   92B5 4E            [ 7] 1977 	ld	c,(hl)
   92B6 21 9D 88      [10] 1978 	ld	hl, #_enemy + 1
   92B9 5E            [ 7] 1979 	ld	e,(hl)
   92BA 7B            [ 4] 1980 	ld	a,e
   92BB 91            [ 4] 1981 	sub	a, c
   92BC 30 1E         [12] 1982 	jr	NC,00114$
                           1983 ;src/main.c:507: if(cu.y - (enemy->y + G_ENEMY_H) >= 2){
   92BE 06 00         [ 7] 1984 	ld	b,#0x00
   92C0 16 00         [ 7] 1985 	ld	d,#0x00
   92C2 21 16 00      [10] 1986 	ld	hl,#0x0016
   92C5 19            [11] 1987 	add	hl,de
   92C6 79            [ 4] 1988 	ld	a,c
   92C7 95            [ 4] 1989 	sub	a, l
   92C8 4F            [ 4] 1990 	ld	c,a
   92C9 78            [ 4] 1991 	ld	a,b
   92CA 9C            [ 4] 1992 	sbc	a, h
   92CB 47            [ 4] 1993 	ld	b,a
   92CC 79            [ 4] 1994 	ld	a,c
   92CD D6 02         [ 7] 1995 	sub	a, #0x02
   92CF 78            [ 4] 1996 	ld	a,b
   92D0 17            [ 4] 1997 	rla
   92D1 3F            [ 4] 1998 	ccf
   92D2 1F            [ 4] 1999 	rra
   92D3 DE 80         [ 7] 2000 	sbc	a, #0x80
   92D5 30 05         [12] 2001 	jr	NC,00114$
                           2002 ;src/main.c:512: enemy->muerto = SI;
   92D7 21 A4 88      [10] 2003 	ld	hl,#(_enemy + 0x0008)
   92DA 36 01         [10] 2004 	ld	(hl),#0x01
                           2005 ;src/main.c:519: case 3:
   92DC                    2006 00114$:
                           2007 ;src/main.c:521: if((enemy->x + G_ENEMY_W) < cu.x || enemy->x  > (cu.x + G_KNIFEX_0_W)){
   92DC 21 9C 88      [10] 2008 	ld	hl, #_enemy + 0
   92DF 4E            [ 7] 2009 	ld	c,(hl)
   92E0 06 00         [ 7] 2010 	ld	b,#0x00
   92E2 21 04 00      [10] 2011 	ld	hl,#0x0004
   92E5 09            [11] 2012 	add	hl,bc
   92E6 EB            [ 4] 2013 	ex	de,hl
   92E7 21 CC 88      [10] 2014 	ld	hl, #_cu + 0
   92EA 6E            [ 7] 2015 	ld	l,(hl)
   92EB 26 00         [ 7] 2016 	ld	h,#0x00
   92ED 7B            [ 4] 2017 	ld	a,e
   92EE 95            [ 4] 2018 	sub	a, l
   92EF 7A            [ 4] 2019 	ld	a,d
   92F0 9C            [ 4] 2020 	sbc	a, h
   92F1 E2 F6 92      [10] 2021 	jp	PO, 00167$
   92F4 EE 80         [ 7] 2022 	xor	a, #0x80
   92F6                    2023 00167$:
   92F6 FA 09 93      [10] 2024 	jp	M,00121$
   92F9 11 04 00      [10] 2025 	ld	de,#0x0004
   92FC 19            [11] 2026 	add	hl,de
   92FD 7D            [ 4] 2027 	ld	a,l
   92FE 91            [ 4] 2028 	sub	a, c
   92FF 7C            [ 4] 2029 	ld	a,h
   9300 98            [ 4] 2030 	sbc	a, b
   9301 E2 06 93      [10] 2031 	jp	PO, 00168$
   9304 EE 80         [ 7] 2032 	xor	a, #0x80
   9306                    2033 00168$:
   9306 F2 0D 93      [10] 2034 	jp	P,00122$
   9309                    2035 00121$:
                           2036 ;src/main.c:522: colisiona = 0;
   9309 0E 00         [ 7] 2037 	ld	c,#0x00
   930B 18 31         [12] 2038 	jr	00125$
   930D                    2039 00122$:
                           2040 ;src/main.c:524: if(cu.y<enemy->y){
   930D 21 CD 88      [10] 2041 	ld	hl, #(_cu + 0x0001) + 0
   9310 4E            [ 7] 2042 	ld	c,(hl)
   9311 21 9D 88      [10] 2043 	ld	hl, #_enemy + 1
   9314 6E            [ 7] 2044 	ld	l,(hl)
   9315 79            [ 4] 2045 	ld	a,c
   9316 95            [ 4] 2046 	sub	a, l
   9317 30 23         [12] 2047 	jr	NC,00119$
                           2048 ;src/main.c:525: if(enemy->y - (cu.y + G_KNIFEX_0_H - 2) >= 2){
   9319 26 00         [ 7] 2049 	ld	h,#0x00
   931B 06 00         [ 7] 2050 	ld	b,#0x00
   931D 03            [ 6] 2051 	inc	bc
   931E 03            [ 6] 2052 	inc	bc
   931F BF            [ 4] 2053 	cp	a, a
   9320 ED 42         [15] 2054 	sbc	hl, bc
   9322 11 02 80      [10] 2055 	ld	de, #0x8002
   9325 29            [11] 2056 	add	hl, hl
   9326 3F            [ 4] 2057 	ccf
   9327 CB 1C         [ 8] 2058 	rr	h
   9329 CB 1D         [ 8] 2059 	rr	l
   932B ED 52         [15] 2060 	sbc	hl, de
   932D 38 04         [12] 2061 	jr	C,00116$
                           2062 ;src/main.c:526: colisiona = 0;
   932F 0E 00         [ 7] 2063 	ld	c,#0x00
   9331 18 0B         [12] 2064 	jr	00125$
   9333                    2065 00116$:
                           2066 ;src/main.c:528: colisiona = 1;
   9333 0E 01         [ 7] 2067 	ld	c,#0x01
                           2068 ;src/main.c:529: enemy->muerto = SI;
   9335 21 A4 88      [10] 2069 	ld	hl,#(_enemy + 0x0008)
   9338 36 01         [10] 2070 	ld	(hl),#0x01
   933A 18 02         [12] 2071 	jr	00125$
   933C                    2072 00119$:
                           2073 ;src/main.c:532: colisiona = 0;
   933C 0E 00         [ 7] 2074 	ld	c,#0x00
                           2075 ;src/main.c:535: }
   933E                    2076 00125$:
                           2077 ;src/main.c:536: return colisiona;
   933E 69            [ 4] 2078 	ld	l,c
   933F DD E1         [14] 2079 	pop	ix
   9341 C9            [10] 2080 	ret
                           2081 ;src/main.c:539: void moverCuchillo(){
                           2082 ;	---------------------------------
                           2083 ; Function moverCuchillo
                           2084 ; ---------------------------------
   9342                    2085 _moverCuchillo::
                           2086 ;src/main.c:541: if(cu.lanzado){
   9342 01 CC 88      [10] 2087 	ld	bc,#_cu+0
   9345 3A D2 88      [13] 2088 	ld	a, (#_cu + 6)
   9348 B7            [ 4] 2089 	or	a, a
   9349 C8            [11] 2090 	ret	Z
                           2091 ;src/main.c:542: cu.mover = 1;
   934A 21 D5 88      [10] 2092 	ld	hl,#(_cu + 0x0009)
   934D 36 01         [10] 2093 	ld	(hl),#0x01
                           2094 ;src/main.c:543: if(cu.direccion == M_derecha){
   934F 21 D3 88      [10] 2095 	ld	hl, #_cu + 7
   9352 6E            [ 7] 2096 	ld	l,(hl)
                           2097 ;src/main.c:545: if( *getTilePtr(cu.x + G_KNIFEX_0_W + 1, cu.y) <= 2){
   9353 59            [ 4] 2098 	ld	e, c
   9354 50            [ 4] 2099 	ld	d, b
   9355 13            [ 6] 2100 	inc	de
                           2101 ;src/main.c:543: if(cu.direccion == M_derecha){
   9356 7D            [ 4] 2102 	ld	a,l
   9357 B7            [ 4] 2103 	or	a, a
   9358 20 27         [12] 2104 	jr	NZ,00128$
                           2105 ;src/main.c:545: if( *getTilePtr(cu.x + G_KNIFEX_0_W + 1, cu.y) <= 2){
   935A 1A            [ 7] 2106 	ld	a,(de)
   935B 5F            [ 4] 2107 	ld	e,a
   935C 0A            [ 7] 2108 	ld	a,(bc)
   935D C6 05         [ 7] 2109 	add	a, #0x05
   935F 6F            [ 4] 2110 	ld	l,a
   9360 C5            [11] 2111 	push	bc
   9361 7B            [ 4] 2112 	ld	a,e
   9362 F5            [11] 2113 	push	af
   9363 33            [ 6] 2114 	inc	sp
   9364 7D            [ 4] 2115 	ld	a,l
   9365 F5            [11] 2116 	push	af
   9366 33            [ 6] 2117 	inc	sp
   9367 CD C9 89      [17] 2118 	call	_getTilePtr
   936A F1            [10] 2119 	pop	af
   936B C1            [10] 2120 	pop	bc
   936C 5E            [ 7] 2121 	ld	e,(hl)
   936D 3E 02         [ 7] 2122 	ld	a,#0x02
   936F 93            [ 4] 2123 	sub	a, e
   9370 38 09         [12] 2124 	jr	C,00102$
                           2125 ;src/main.c:546: cu.x++;
   9372 0A            [ 7] 2126 	ld	a,(bc)
   9373 3C            [ 4] 2127 	inc	a
   9374 02            [ 7] 2128 	ld	(bc),a
                           2129 ;src/main.c:547: cu.mover = SI;
   9375 21 D5 88      [10] 2130 	ld	hl,#(_cu + 0x0009)
   9378 36 01         [10] 2131 	ld	(hl),#0x01
   937A C9            [10] 2132 	ret
   937B                    2133 00102$:
                           2134 ;src/main.c:551: cu.mover=NO;
   937B 21 D5 88      [10] 2135 	ld	hl,#(_cu + 0x0009)
   937E 36 00         [10] 2136 	ld	(hl),#0x00
   9380 C9            [10] 2137 	ret
   9381                    2138 00128$:
                           2139 ;src/main.c:554: else if(cu.direccion == M_izquierda){
   9381 7D            [ 4] 2140 	ld	a,l
   9382 3D            [ 4] 2141 	dec	a
   9383 20 26         [12] 2142 	jr	NZ,00125$
                           2143 ;src/main.c:555: if(*getTilePtr(cu.x - 1, cu.y) <= 2){
   9385 1A            [ 7] 2144 	ld	a,(de)
   9386 5F            [ 4] 2145 	ld	e,a
   9387 0A            [ 7] 2146 	ld	a,(bc)
   9388 57            [ 4] 2147 	ld	d,a
   9389 15            [ 4] 2148 	dec	d
   938A C5            [11] 2149 	push	bc
   938B 7B            [ 4] 2150 	ld	a,e
   938C F5            [11] 2151 	push	af
   938D 33            [ 6] 2152 	inc	sp
   938E D5            [11] 2153 	push	de
   938F 33            [ 6] 2154 	inc	sp
   9390 CD C9 89      [17] 2155 	call	_getTilePtr
   9393 F1            [10] 2156 	pop	af
   9394 C1            [10] 2157 	pop	bc
   9395 5E            [ 7] 2158 	ld	e,(hl)
   9396 3E 02         [ 7] 2159 	ld	a,#0x02
   9398 93            [ 4] 2160 	sub	a, e
   9399 38 0A         [12] 2161 	jr	C,00105$
                           2162 ;src/main.c:556: cu.x--;
   939B 0A            [ 7] 2163 	ld	a,(bc)
   939C C6 FF         [ 7] 2164 	add	a,#0xFF
   939E 02            [ 7] 2165 	ld	(bc),a
                           2166 ;src/main.c:557: cu.mover = SI;
   939F 21 D5 88      [10] 2167 	ld	hl,#(_cu + 0x0009)
   93A2 36 01         [10] 2168 	ld	(hl),#0x01
   93A4 C9            [10] 2169 	ret
   93A5                    2170 00105$:
                           2171 ;src/main.c:560: cu.mover=NO;
   93A5 21 D5 88      [10] 2172 	ld	hl,#(_cu + 0x0009)
   93A8 36 00         [10] 2173 	ld	(hl),#0x00
   93AA C9            [10] 2174 	ret
   93AB                    2175 00125$:
                           2176 ;src/main.c:563: else if(cu.direccion == M_arriba){
   93AB 7D            [ 4] 2177 	ld	a,l
   93AC D6 02         [ 7] 2178 	sub	a, #0x02
   93AE 20 3E         [12] 2179 	jr	NZ,00122$
                           2180 ;src/main.c:564: if(*getTilePtr(cu.x, cu.y - 2) <= 2){
   93B0 1A            [ 7] 2181 	ld	a,(de)
   93B1 C6 FE         [ 7] 2182 	add	a,#0xFE
   93B3 F5            [11] 2183 	push	af
   93B4 0A            [ 7] 2184 	ld	a,(bc)
   93B5 47            [ 4] 2185 	ld	b,a
   93B6 F1            [10] 2186 	pop	af
   93B7 D5            [11] 2187 	push	de
   93B8 F5            [11] 2188 	push	af
   93B9 33            [ 6] 2189 	inc	sp
   93BA C5            [11] 2190 	push	bc
   93BB 33            [ 6] 2191 	inc	sp
   93BC CD C9 89      [17] 2192 	call	_getTilePtr
   93BF F1            [10] 2193 	pop	af
   93C0 D1            [10] 2194 	pop	de
   93C1 4E            [ 7] 2195 	ld	c,(hl)
   93C2 3E 02         [ 7] 2196 	ld	a,#0x02
   93C4 91            [ 4] 2197 	sub	a, c
   93C5 38 21         [12] 2198 	jr	C,00111$
                           2199 ;src/main.c:565: if(!checkKnifeCollision(M_arriba)){
   93C7 D5            [11] 2200 	push	de
   93C8 21 02 00      [10] 2201 	ld	hl,#0x0002
   93CB E5            [11] 2202 	push	hl
   93CC CD 44 92      [17] 2203 	call	_checkKnifeCollision
   93CF F1            [10] 2204 	pop	af
   93D0 D1            [10] 2205 	pop	de
   93D1 7D            [ 4] 2206 	ld	a,l
   93D2 B7            [ 4] 2207 	or	a, a
   93D3 20 0D         [12] 2208 	jr	NZ,00108$
                           2209 ;src/main.c:566: cu.y--;
   93D5 1A            [ 7] 2210 	ld	a,(de)
   93D6 C6 FF         [ 7] 2211 	add	a,#0xFF
   93D8 12            [ 7] 2212 	ld	(de),a
                           2213 ;src/main.c:567: cu.y--;
   93D9 C6 FF         [ 7] 2214 	add	a,#0xFF
   93DB 12            [ 7] 2215 	ld	(de),a
                           2216 ;src/main.c:568: cu.mover = SI;
   93DC 21 D5 88      [10] 2217 	ld	hl,#(_cu + 0x0009)
   93DF 36 01         [10] 2218 	ld	(hl),#0x01
   93E1 C9            [10] 2219 	ret
   93E2                    2220 00108$:
                           2221 ;src/main.c:571: cu.mover=NO;
   93E2 21 D5 88      [10] 2222 	ld	hl,#(_cu + 0x0009)
   93E5 36 00         [10] 2223 	ld	(hl),#0x00
   93E7 C9            [10] 2224 	ret
   93E8                    2225 00111$:
                           2226 ;src/main.c:574: cu.mover=NO;
   93E8 21 D5 88      [10] 2227 	ld	hl,#(_cu + 0x0009)
   93EB 36 00         [10] 2228 	ld	(hl),#0x00
   93ED C9            [10] 2229 	ret
   93EE                    2230 00122$:
                           2231 ;src/main.c:579: else if(cu.direccion == M_abajo){
   93EE 7D            [ 4] 2232 	ld	a,l
   93EF D6 03         [ 7] 2233 	sub	a, #0x03
   93F1 C0            [11] 2234 	ret	NZ
                           2235 ;src/main.c:580: if(*getTilePtr(cu.x, cu.y + G_KNIFEY_0_H + 2) <= 2){
   93F2 1A            [ 7] 2236 	ld	a,(de)
   93F3 C6 0A         [ 7] 2237 	add	a, #0x0A
   93F5 F5            [11] 2238 	push	af
   93F6 0A            [ 7] 2239 	ld	a,(bc)
   93F7 47            [ 4] 2240 	ld	b,a
   93F8 F1            [10] 2241 	pop	af
   93F9 D5            [11] 2242 	push	de
   93FA F5            [11] 2243 	push	af
   93FB 33            [ 6] 2244 	inc	sp
   93FC C5            [11] 2245 	push	bc
   93FD 33            [ 6] 2246 	inc	sp
   93FE CD C9 89      [17] 2247 	call	_getTilePtr
   9401 F1            [10] 2248 	pop	af
   9402 D1            [10] 2249 	pop	de
   9403 4E            [ 7] 2250 	ld	c,(hl)
   9404 3E 02         [ 7] 2251 	ld	a,#0x02
   9406 91            [ 4] 2252 	sub	a, c
   9407 38 1F         [12] 2253 	jr	C,00117$
                           2254 ;src/main.c:581: if(!checkKnifeCollision(M_abajo)){
   9409 D5            [11] 2255 	push	de
   940A 21 03 00      [10] 2256 	ld	hl,#0x0003
   940D E5            [11] 2257 	push	hl
   940E CD 44 92      [17] 2258 	call	_checkKnifeCollision
   9411 F1            [10] 2259 	pop	af
   9412 D1            [10] 2260 	pop	de
   9413 7D            [ 4] 2261 	ld	a,l
   9414 B7            [ 4] 2262 	or	a, a
   9415 20 0B         [12] 2263 	jr	NZ,00114$
                           2264 ;src/main.c:582: cu.y++;
   9417 1A            [ 7] 2265 	ld	a,(de)
   9418 3C            [ 4] 2266 	inc	a
   9419 12            [ 7] 2267 	ld	(de),a
                           2268 ;src/main.c:583: cu.y++;
   941A 3C            [ 4] 2269 	inc	a
   941B 12            [ 7] 2270 	ld	(de),a
                           2271 ;src/main.c:584: cu.mover = SI;
   941C 21 D5 88      [10] 2272 	ld	hl,#(_cu + 0x0009)
   941F 36 01         [10] 2273 	ld	(hl),#0x01
   9421 C9            [10] 2274 	ret
   9422                    2275 00114$:
                           2276 ;src/main.c:587: cu.mover=NO;
   9422 21 D5 88      [10] 2277 	ld	hl,#(_cu + 0x0009)
   9425 36 00         [10] 2278 	ld	(hl),#0x00
   9427 C9            [10] 2279 	ret
   9428                    2280 00117$:
                           2281 ;src/main.c:590: cu.mover=NO;
   9428 21 D5 88      [10] 2282 	ld	hl,#(_cu + 0x0009)
   942B 36 00         [10] 2283 	ld	(hl),#0x00
   942D C9            [10] 2284 	ret
                           2285 ;src/main.c:595: void barraPuntuacionInicial(){
                           2286 ;	---------------------------------
                           2287 ; Function barraPuntuacionInicial
                           2288 ; ---------------------------------
   942E                    2289 _barraPuntuacionInicial::
                           2290 ;src/main.c:600: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 178); //
   942E 21 00 B2      [10] 2291 	ld	hl,#0xB200
   9431 E5            [11] 2292 	push	hl
   9432 26 C0         [ 7] 2293 	ld	h, #0xC0
   9434 E5            [11] 2294 	push	hl
   9435 CD 18 88      [17] 2295 	call	_cpct_getScreenPtr
   9438 4D            [ 4] 2296 	ld	c,l
   9439 44            [ 4] 2297 	ld	b,h
                           2298 ;src/main.c:601: cpct_drawStringM0("SCORE", memptr, 1, 0);
   943A 21 01 00      [10] 2299 	ld	hl,#0x0001
   943D E5            [11] 2300 	push	hl
   943E C5            [11] 2301 	push	bc
   943F 21 D6 94      [10] 2302 	ld	hl,#___str_1
   9442 E5            [11] 2303 	push	hl
   9443 CD 23 7C      [17] 2304 	call	_cpct_drawStringM0
   9446 21 06 00      [10] 2305 	ld	hl,#6
   9449 39            [11] 2306 	add	hl,sp
   944A F9            [ 6] 2307 	ld	sp,hl
                           2308 ;src/main.c:602: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 190); // puntuación inicial
   944B 21 00 BE      [10] 2309 	ld	hl,#0xBE00
   944E E5            [11] 2310 	push	hl
   944F 26 C0         [ 7] 2311 	ld	h, #0xC0
   9451 E5            [11] 2312 	push	hl
   9452 CD 18 88      [17] 2313 	call	_cpct_getScreenPtr
   9455 4D            [ 4] 2314 	ld	c,l
   9456 44            [ 4] 2315 	ld	b,h
                           2316 ;src/main.c:603: cpct_drawStringM0("00000", memptr, 15, 0);
   9457 21 0F 00      [10] 2317 	ld	hl,#0x000F
   945A E5            [11] 2318 	push	hl
   945B C5            [11] 2319 	push	bc
   945C 21 DC 94      [10] 2320 	ld	hl,#___str_2
   945F E5            [11] 2321 	push	hl
   9460 CD 23 7C      [17] 2322 	call	_cpct_drawStringM0
   9463 21 06 00      [10] 2323 	ld	hl,#6
   9466 39            [11] 2324 	add	hl,sp
   9467 F9            [ 6] 2325 	ld	sp,hl
                           2326 ;src/main.c:606: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 190);
   9468 21 1A BE      [10] 2327 	ld	hl,#0xBE1A
   946B E5            [11] 2328 	push	hl
   946C 21 00 C0      [10] 2329 	ld	hl,#0xC000
   946F E5            [11] 2330 	push	hl
   9470 CD 18 88      [17] 2331 	call	_cpct_getScreenPtr
   9473 4D            [ 4] 2332 	ld	c,l
   9474 44            [ 4] 2333 	ld	b,h
                           2334 ;src/main.c:607: cpct_drawStringM0("ROBOBIT", memptr, 3, 0);
   9475 21 03 00      [10] 2335 	ld	hl,#0x0003
   9478 E5            [11] 2336 	push	hl
   9479 C5            [11] 2337 	push	bc
   947A 21 E2 94      [10] 2338 	ld	hl,#___str_3
   947D E5            [11] 2339 	push	hl
   947E CD 23 7C      [17] 2340 	call	_cpct_drawStringM0
   9481 21 06 00      [10] 2341 	ld	hl,#6
   9484 39            [11] 2342 	add	hl,sp
   9485 F9            [ 6] 2343 	ld	sp,hl
                           2344 ;src/main.c:609: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 178); //
   9486 21 3C B2      [10] 2345 	ld	hl,#0xB23C
   9489 E5            [11] 2346 	push	hl
   948A 21 00 C0      [10] 2347 	ld	hl,#0xC000
   948D E5            [11] 2348 	push	hl
   948E CD 18 88      [17] 2349 	call	_cpct_getScreenPtr
   9491 4D            [ 4] 2350 	ld	c,l
   9492 44            [ 4] 2351 	ld	b,h
                           2352 ;src/main.c:610: cpct_drawStringM0("LIVES", memptr, 1, 0);
   9493 21 01 00      [10] 2353 	ld	hl,#0x0001
   9496 E5            [11] 2354 	push	hl
   9497 C5            [11] 2355 	push	bc
   9498 21 EA 94      [10] 2356 	ld	hl,#___str_4
   949B E5            [11] 2357 	push	hl
   949C CD 23 7C      [17] 2358 	call	_cpct_drawStringM0
   949F 21 06 00      [10] 2359 	ld	hl,#6
   94A2 39            [11] 2360 	add	hl,sp
   94A3 F9            [ 6] 2361 	ld	sp,hl
                           2362 ;src/main.c:612: for(i=0; i<5; i++){
   94A4 01 00 00      [10] 2363 	ld	bc,#0x0000
   94A7                    2364 00102$:
                           2365 ;src/main.c:613: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 190); // dibuja 5 corazones
   94A7 79            [ 4] 2366 	ld	a,c
   94A8 87            [ 4] 2367 	add	a, a
   94A9 87            [ 4] 2368 	add	a, a
   94AA C6 3C         [ 7] 2369 	add	a, #0x3C
   94AC 57            [ 4] 2370 	ld	d,a
   94AD C5            [11] 2371 	push	bc
   94AE 3E BE         [ 7] 2372 	ld	a,#0xBE
   94B0 F5            [11] 2373 	push	af
   94B1 33            [ 6] 2374 	inc	sp
   94B2 D5            [11] 2375 	push	de
   94B3 33            [ 6] 2376 	inc	sp
   94B4 21 00 C0      [10] 2377 	ld	hl,#0xC000
   94B7 E5            [11] 2378 	push	hl
   94B8 CD 18 88      [17] 2379 	call	_cpct_getScreenPtr
   94BB EB            [ 4] 2380 	ex	de,hl
   94BC 21 03 06      [10] 2381 	ld	hl,#0x0603
   94BF E5            [11] 2382 	push	hl
   94C0 D5            [11] 2383 	push	de
   94C1 21 08 78      [10] 2384 	ld	hl,#_g_heart
   94C4 E5            [11] 2385 	push	hl
   94C5 CD 47 7C      [17] 2386 	call	_cpct_drawSprite
   94C8 C1            [10] 2387 	pop	bc
                           2388 ;src/main.c:612: for(i=0; i<5; i++){
   94C9 03            [ 6] 2389 	inc	bc
   94CA 79            [ 4] 2390 	ld	a,c
   94CB D6 05         [ 7] 2391 	sub	a, #0x05
   94CD 78            [ 4] 2392 	ld	a,b
   94CE 17            [ 4] 2393 	rla
   94CF 3F            [ 4] 2394 	ccf
   94D0 1F            [ 4] 2395 	rra
   94D1 DE 80         [ 7] 2396 	sbc	a, #0x80
   94D3 38 D2         [12] 2397 	jr	C,00102$
   94D5 C9            [10] 2398 	ret
   94D6                    2399 ___str_1:
   94D6 53 43 4F 52 45     2400 	.ascii "SCORE"
   94DB 00                 2401 	.db 0x00
   94DC                    2402 ___str_2:
   94DC 30 30 30 30 30     2403 	.ascii "00000"
   94E1 00                 2404 	.db 0x00
   94E2                    2405 ___str_3:
   94E2 52 4F 42 4F 42 49  2406 	.ascii "ROBOBIT"
        54
   94E9 00                 2407 	.db 0x00
   94EA                    2408 ___str_4:
   94EA 4C 49 56 45 53     2409 	.ascii "LIVES"
   94EF 00                 2410 	.db 0x00
                           2411 ;src/main.c:618: void borrarPantallaAbajo(){
                           2412 ;	---------------------------------
                           2413 ; Function borrarPantallaAbajo
                           2414 ; ---------------------------------
   94F0                    2415 _borrarPantallaAbajo::
                           2416 ;src/main.c:621: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 176); // posición para borrar la mitad derecha
   94F0 21 00 B0      [10] 2417 	ld	hl,#0xB000
   94F3 E5            [11] 2418 	push	hl
   94F4 26 C0         [ 7] 2419 	ld	h, #0xC0
   94F6 E5            [11] 2420 	push	hl
   94F7 CD 18 88      [17] 2421 	call	_cpct_getScreenPtr
   94FA 4D            [ 4] 2422 	ld	c,l
   94FB 44            [ 4] 2423 	ld	b,h
                           2424 ;src/main.c:622: cpct_drawSolidBox(memptr, 0, 40, 7);  //borra la mitad derecha
   94FC 21 28 07      [10] 2425 	ld	hl,#0x0728
   94FF E5            [11] 2426 	push	hl
   9500 AF            [ 4] 2427 	xor	a, a
   9501 F5            [11] 2428 	push	af
   9502 33            [ 6] 2429 	inc	sp
   9503 C5            [11] 2430 	push	bc
   9504 CD 3E 87      [17] 2431 	call	_cpct_drawSolidBox
   9507 F1            [10] 2432 	pop	af
                           2433 ;src/main.c:623: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 40, 176); // posición para borrar la mitad izquierda
   9508 33            [ 6] 2434 	inc	sp
   9509 21 28 B0      [10] 2435 	ld	hl,#0xB028
   950C E3            [19] 2436 	ex	(sp),hl
   950D 21 00 C0      [10] 2437 	ld	hl,#0xC000
   9510 E5            [11] 2438 	push	hl
   9511 CD 18 88      [17] 2439 	call	_cpct_getScreenPtr
   9514 4D            [ 4] 2440 	ld	c,l
   9515 44            [ 4] 2441 	ld	b,h
                           2442 ;src/main.c:624: cpct_drawSolidBox(memptr, 0, 40, 7);  //borra la mitad izquierda
   9516 21 28 07      [10] 2443 	ld	hl,#0x0728
   9519 E5            [11] 2444 	push	hl
   951A AF            [ 4] 2445 	xor	a, a
   951B F5            [11] 2446 	push	af
   951C 33            [ 6] 2447 	inc	sp
   951D C5            [11] 2448 	push	bc
   951E CD 3E 87      [17] 2449 	call	_cpct_drawSolidBox
   9521 F1            [10] 2450 	pop	af
   9522 F1            [10] 2451 	pop	af
   9523 33            [ 6] 2452 	inc	sp
   9524 C9            [10] 2453 	ret
                           2454 ;src/main.c:627: void menuInicio(){
                           2455 ;	---------------------------------
                           2456 ; Function menuInicio
                           2457 ; ---------------------------------
   9525                    2458 _menuInicio::
                           2459 ;src/main.c:631: cpct_clearScreen(0);
   9525 21 00 40      [10] 2460 	ld	hl,#0x4000
   9528 E5            [11] 2461 	push	hl
   9529 AF            [ 4] 2462 	xor	a, a
   952A F5            [11] 2463 	push	af
   952B 33            [ 6] 2464 	inc	sp
   952C 26 C0         [ 7] 2465 	ld	h, #0xC0
   952E E5            [11] 2466 	push	hl
   952F CD D2 7E      [17] 2467 	call	_cpct_memset
                           2468 ;src/main.c:633: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   9532 21 1A 0F      [10] 2469 	ld	hl,#0x0F1A
   9535 E5            [11] 2470 	push	hl
   9536 21 00 C0      [10] 2471 	ld	hl,#0xC000
   9539 E5            [11] 2472 	push	hl
   953A CD 18 88      [17] 2473 	call	_cpct_getScreenPtr
   953D 4D            [ 4] 2474 	ld	c,l
   953E 44            [ 4] 2475 	ld	b,h
                           2476 ;src/main.c:634: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   953F 21 04 00      [10] 2477 	ld	hl,#0x0004
   9542 E5            [11] 2478 	push	hl
   9543 C5            [11] 2479 	push	bc
   9544 21 D8 95      [10] 2480 	ld	hl,#___str_5
   9547 E5            [11] 2481 	push	hl
   9548 CD 23 7C      [17] 2482 	call	_cpct_drawStringM0
   954B 21 06 00      [10] 2483 	ld	hl,#6
   954E 39            [11] 2484 	add	hl,sp
   954F F9            [ 6] 2485 	ld	sp,hl
                           2486 ;src/main.c:636: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   9550 21 28 6E      [10] 2487 	ld	hl,#0x6E28
   9553 E5            [11] 2488 	push	hl
   9554 21 F0 F0      [10] 2489 	ld	hl,#0xF0F0
   9557 E5            [11] 2490 	push	hl
   9558 21 A8 55      [10] 2491 	ld	hl,#_g_text_0
   955B E5            [11] 2492 	push	hl
   955C CD 47 7C      [17] 2493 	call	_cpct_drawSprite
                           2494 ;src/main.c:637: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   955F 21 28 6E      [10] 2495 	ld	hl,#0x6E28
   9562 E5            [11] 2496 	push	hl
   9563 21 18 F1      [10] 2497 	ld	hl,#0xF118
   9566 E5            [11] 2498 	push	hl
   9567 21 D8 66      [10] 2499 	ld	hl,#_g_text_1
   956A E5            [11] 2500 	push	hl
   956B CD 47 7C      [17] 2501 	call	_cpct_drawSprite
                           2502 ;src/main.c:660: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   956E 21 08 A0      [10] 2503 	ld	hl,#0xA008
   9571 E5            [11] 2504 	push	hl
   9572 21 00 C0      [10] 2505 	ld	hl,#0xC000
   9575 E5            [11] 2506 	push	hl
   9576 CD 18 88      [17] 2507 	call	_cpct_getScreenPtr
   9579 4D            [ 4] 2508 	ld	c,l
   957A 44            [ 4] 2509 	ld	b,h
                           2510 ;src/main.c:661: cpct_drawStringM0("TO START PRESS S", memptr, 4, 0);
   957B 21 04 00      [10] 2511 	ld	hl,#0x0004
   957E E5            [11] 2512 	push	hl
   957F C5            [11] 2513 	push	bc
   9580 21 E0 95      [10] 2514 	ld	hl,#___str_6
   9583 E5            [11] 2515 	push	hl
   9584 CD 23 7C      [17] 2516 	call	_cpct_drawStringM0
   9587 21 06 00      [10] 2517 	ld	hl,#6
   958A 39            [11] 2518 	add	hl,sp
   958B F9            [ 6] 2519 	ld	sp,hl
                           2520 ;src/main.c:663: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 170); // centrado en horizontal y abajo en vertical
   958C 21 0A AA      [10] 2521 	ld	hl,#0xAA0A
   958F E5            [11] 2522 	push	hl
   9590 21 00 C0      [10] 2523 	ld	hl,#0xC000
   9593 E5            [11] 2524 	push	hl
   9594 CD 18 88      [17] 2525 	call	_cpct_getScreenPtr
   9597 4D            [ 4] 2526 	ld	c,l
   9598 44            [ 4] 2527 	ld	b,h
                           2528 ;src/main.c:664: cpct_drawStringM0("TO MENU PRESS M", memptr, 4, 0);
   9599 21 04 00      [10] 2529 	ld	hl,#0x0004
   959C E5            [11] 2530 	push	hl
   959D C5            [11] 2531 	push	bc
   959E 21 F1 95      [10] 2532 	ld	hl,#___str_7
   95A1 E5            [11] 2533 	push	hl
   95A2 CD 23 7C      [17] 2534 	call	_cpct_drawStringM0
   95A5 21 06 00      [10] 2535 	ld	hl,#6
   95A8 39            [11] 2536 	add	hl,sp
   95A9 F9            [ 6] 2537 	ld	sp,hl
                           2538 ;src/main.c:667: do{
   95AA                    2539 00106$:
                           2540 ;src/main.c:668: cpct_scanKeyboard_f();
   95AA CD AD 7B      [17] 2541 	call	_cpct_scanKeyboard_f
                           2542 ;src/main.c:671: else */if(cpct_isKeyPressed(Key_M)){
   95AD 21 04 40      [10] 2543 	ld	hl,#0x4004
   95B0 CD A1 7B      [17] 2544 	call	_cpct_isKeyPressed
   95B3 7D            [ 4] 2545 	ld	a,l
   95B4 B7            [ 4] 2546 	or	a, a
   95B5 28 0D         [12] 2547 	jr	Z,00107$
                           2548 ;src/main.c:672: cpct_scanKeyboard_f();
   95B7 CD AD 7B      [17] 2549 	call	_cpct_scanKeyboard_f
                           2550 ;src/main.c:673: do{
   95BA                    2551 00101$:
                           2552 ;src/main.c:675: } while(!cpct_isKeyPressed(Key_S));
   95BA 21 07 10      [10] 2553 	ld	hl,#0x1007
   95BD CD A1 7B      [17] 2554 	call	_cpct_isKeyPressed
   95C0 7D            [ 4] 2555 	ld	a,l
   95C1 B7            [ 4] 2556 	or	a, a
   95C2 28 F6         [12] 2557 	jr	Z,00101$
   95C4                    2558 00107$:
                           2559 ;src/main.c:677: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   95C4 21 07 10      [10] 2560 	ld	hl,#0x1007
   95C7 CD A1 7B      [17] 2561 	call	_cpct_isKeyPressed
   95CA 7D            [ 4] 2562 	ld	a,l
   95CB B7            [ 4] 2563 	or	a, a
   95CC C0            [11] 2564 	ret	NZ
   95CD 21 04 40      [10] 2565 	ld	hl,#0x4004
   95D0 CD A1 7B      [17] 2566 	call	_cpct_isKeyPressed
   95D3 7D            [ 4] 2567 	ld	a,l
   95D4 B7            [ 4] 2568 	or	a, a
   95D5 28 D3         [12] 2569 	jr	Z,00106$
   95D7 C9            [10] 2570 	ret
   95D8                    2571 ___str_5:
   95D8 52 4F 42 4F 42 49  2572 	.ascii "ROBOBIT"
        54
   95DF 00                 2573 	.db 0x00
   95E0                    2574 ___str_6:
   95E0 54 4F 20 53 54 41  2575 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   95F0 00                 2576 	.db 0x00
   95F1                    2577 ___str_7:
   95F1 54 4F 20 4D 45 4E  2578 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   9600 00                 2579 	.db 0x00
                           2580 ;src/main.c:680: void inicializarCPC() {
                           2581 ;	---------------------------------
                           2582 ; Function inicializarCPC
                           2583 ; ---------------------------------
   9601                    2584 _inicializarCPC::
                           2585 ;src/main.c:681: cpct_disableFirmware();
   9601 CD 09 87      [17] 2586 	call	_cpct_disableFirmware
                           2587 ;src/main.c:682: cpct_setVideoMode(0);
   9604 2E 00         [ 7] 2588 	ld	l,#0x00
   9606 CD B4 7E      [17] 2589 	call	_cpct_setVideoMode
                           2590 ;src/main.c:683: cpct_setBorder(HW_BLACK);
   9609 21 10 14      [10] 2591 	ld	hl,#0x1410
   960C E5            [11] 2592 	push	hl
   960D CD 17 7C      [17] 2593 	call	_cpct_setPALColour
                           2594 ;src/main.c:684: cpct_setPalette(g_palette, 16);
   9610 21 10 00      [10] 2595 	ld	hl,#0x0010
   9613 E5            [11] 2596 	push	hl
   9614 21 40 7A      [10] 2597 	ld	hl,#_g_palette
   9617 E5            [11] 2598 	push	hl
   9618 CD 8A 7B      [17] 2599 	call	_cpct_setPalette
                           2600 ;src/main.c:685: cpct_akp_musicInit(G_song);
   961B 21 00 3F      [10] 2601 	ld	hl,#_G_song
   961E E5            [11] 2602 	push	hl
   961F CD E5 85      [17] 2603 	call	_cpct_akp_musicInit
   9622 F1            [10] 2604 	pop	af
   9623 C9            [10] 2605 	ret
                           2606 ;src/main.c:688: void inicializarEnemy() {
                           2607 ;	---------------------------------
                           2608 ; Function inicializarEnemy
                           2609 ; ---------------------------------
   9624                    2610 _inicializarEnemy::
                           2611 ;src/main.c:693: actual = enemy;
   9624 01 9C 88      [10] 2612 	ld	bc,#_enemy+0
                           2613 ;src/main.c:694: while(--i){
   9627 1E 05         [ 7] 2614 	ld	e,#0x05
   9629                    2615 00104$:
   9629 1D            [ 4] 2616 	dec e
   962A C8            [11] 2617 	ret	Z
                           2618 ;src/main.c:695: actual->x = actual->px = 71;
   962B 69            [ 4] 2619 	ld	l, c
   962C 60            [ 4] 2620 	ld	h, b
   962D 23            [ 6] 2621 	inc	hl
   962E 23            [ 6] 2622 	inc	hl
   962F 36 47         [10] 2623 	ld	(hl),#0x47
   9631 3E 47         [ 7] 2624 	ld	a,#0x47
   9633 02            [ 7] 2625 	ld	(bc),a
                           2626 ;src/main.c:696: actual->y = actual->py = 84;
   9634 C5            [11] 2627 	push	bc
   9635 FD E1         [14] 2628 	pop	iy
   9637 FD 23         [10] 2629 	inc	iy
   9639 69            [ 4] 2630 	ld	l, c
   963A 60            [ 4] 2631 	ld	h, b
   963B 23            [ 6] 2632 	inc	hl
   963C 23            [ 6] 2633 	inc	hl
   963D 23            [ 6] 2634 	inc	hl
   963E 36 54         [10] 2635 	ld	(hl),#0x54
   9640 FD 36 00 54   [19] 2636 	ld	0 (iy), #0x54
                           2637 ;src/main.c:697: actual->mover  = NO;
   9644 21 06 00      [10] 2638 	ld	hl,#0x0006
   9647 09            [11] 2639 	add	hl,bc
   9648 36 00         [10] 2640 	ld	(hl),#0x00
                           2641 ;src/main.c:698: actual->mira=M_abajo;
   964A 21 07 00      [10] 2642 	ld	hl,#0x0007
   964D 09            [11] 2643 	add	hl,bc
   964E 36 03         [10] 2644 	ld	(hl),#0x03
                           2645 ;src/main.c:699: actual->sprite = g_enemy;
   9650 21 04 00      [10] 2646 	ld	hl,#0x0004
   9653 09            [11] 2647 	add	hl,bc
   9654 36 1A         [10] 2648 	ld	(hl),#<(_g_enemy)
   9656 23            [ 6] 2649 	inc	hl
   9657 36 78         [10] 2650 	ld	(hl),#>(_g_enemy)
                           2651 ;src/main.c:701: actual->muerto = SI;
   9659 21 08 00      [10] 2652 	ld	hl,#0x0008
   965C 09            [11] 2653 	add	hl,bc
                           2654 ;src/main.c:700: if(i!=4){
   965D 7B            [ 4] 2655 	ld	a,e
   965E D6 04         [ 7] 2656 	sub	a, #0x04
   9660 28 04         [12] 2657 	jr	Z,00102$
                           2658 ;src/main.c:701: actual->muerto = SI;
   9662 36 01         [10] 2659 	ld	(hl),#0x01
   9664 18 02         [12] 2660 	jr	00103$
   9666                    2661 00102$:
                           2662 ;src/main.c:704: actual->muerto = NO;
   9666 36 00         [10] 2663 	ld	(hl),#0x00
   9668                    2664 00103$:
                           2665 ;src/main.c:706: actual->patrol = SI;
   9668 21 09 00      [10] 2666 	ld	hl,#0x0009
   966B 09            [11] 2667 	add	hl,bc
   966C 36 01         [10] 2668 	ld	(hl),#0x01
                           2669 ;src/main.c:707: actual++;
   966E 21 0A 00      [10] 2670 	ld	hl,#0x000A
   9671 09            [11] 2671 	add	hl,bc
   9672 4D            [ 4] 2672 	ld	c,l
   9673 44            [ 4] 2673 	ld	b,h
   9674 18 B3         [12] 2674 	jr	00104$
                           2675 ;src/main.c:711: void inicializarJuego() {
                           2676 ;	---------------------------------
                           2677 ; Function inicializarJuego
                           2678 ; ---------------------------------
   9676                    2679 _inicializarJuego::
                           2680 ;src/main.c:715: actual = enemy;
                           2681 ;src/main.c:718: num_mapa = 0;
   9676 21 D8 88      [10] 2682 	ld	hl,#_num_mapa + 0
   9679 36 00         [10] 2683 	ld	(hl), #0x00
                           2684 ;src/main.c:719: mapa = mapas[num_mapa];
   967B 21 EF 88      [10] 2685 	ld	hl, #_mapas + 0
   967E 7E            [ 7] 2686 	ld	a,(hl)
   967F FD 21 D6 88   [14] 2687 	ld	iy,#_mapa
   9683 FD 77 00      [19] 2688 	ld	0 (iy),a
   9686 23            [ 6] 2689 	inc	hl
   9687 7E            [ 7] 2690 	ld	a,(hl)
   9688 32 D7 88      [13] 2691 	ld	(#_mapa + 1),a
                           2692 ;src/main.c:720: cpct_etm_setTileset2x4(g_tileset);
   968B 21 E0 54      [10] 2693 	ld	hl,#_g_tileset
   968E CD 7B 7D      [17] 2694 	call	_cpct_etm_setTileset2x4
                           2695 ;src/main.c:721: dibujarMapa();
   9691 CD D9 88      [17] 2696 	call	_dibujarMapa
                           2697 ;src/main.c:722: borrarPantallaAbajo();
   9694 CD F0 94      [17] 2698 	call	_borrarPantallaAbajo
                           2699 ;src/main.c:723: barraPuntuacionInicial();
   9697 CD 2E 94      [17] 2700 	call	_barraPuntuacionInicial
                           2701 ;src/main.c:726: prota.x = prota.px = 4;
   969A 21 C6 88      [10] 2702 	ld	hl,#(_prota + 0x0002)
   969D 36 04         [10] 2703 	ld	(hl),#0x04
   969F 21 C4 88      [10] 2704 	ld	hl,#_prota
   96A2 36 04         [10] 2705 	ld	(hl),#0x04
                           2706 ;src/main.c:727: prota.y = prota.py = 80;
   96A4 21 C7 88      [10] 2707 	ld	hl,#(_prota + 0x0003)
   96A7 36 50         [10] 2708 	ld	(hl),#0x50
   96A9 21 C5 88      [10] 2709 	ld	hl,#(_prota + 0x0001)
   96AC 36 50         [10] 2710 	ld	(hl),#0x50
                           2711 ;src/main.c:728: prota.mover  = NO;
   96AE 21 CA 88      [10] 2712 	ld	hl,#(_prota + 0x0006)
   96B1 36 00         [10] 2713 	ld	(hl),#0x00
                           2714 ;src/main.c:729: prota.mira=M_derecha;
   96B3 21 CB 88      [10] 2715 	ld	hl,#(_prota + 0x0007)
   96B6 36 00         [10] 2716 	ld	(hl),#0x00
                           2717 ;src/main.c:730: prota.sprite = g_hero;
   96B8 21 50 7A      [10] 2718 	ld	hl,#_g_hero
   96BB 22 C8 88      [16] 2719 	ld	((_prota + 0x0004)), hl
                           2720 ;src/main.c:734: cu.x = cu.px = 0;
   96BE 21 CE 88      [10] 2721 	ld	hl,#(_cu + 0x0002)
   96C1 36 00         [10] 2722 	ld	(hl),#0x00
   96C3 21 CC 88      [10] 2723 	ld	hl,#_cu
   96C6 36 00         [10] 2724 	ld	(hl),#0x00
                           2725 ;src/main.c:735: cu.y = cu.py = 0;
   96C8 21 CF 88      [10] 2726 	ld	hl,#(_cu + 0x0003)
   96CB 36 00         [10] 2727 	ld	(hl),#0x00
   96CD 21 CD 88      [10] 2728 	ld	hl,#(_cu + 0x0001)
   96D0 36 00         [10] 2729 	ld	(hl),#0x00
                           2730 ;src/main.c:736: cu.lanzado = NO;
   96D2 21 D2 88      [10] 2731 	ld	hl,#(_cu + 0x0006)
   96D5 36 00         [10] 2732 	ld	(hl),#0x00
                           2733 ;src/main.c:737: cu.mover = NO;
   96D7 21 D5 88      [10] 2734 	ld	hl,#(_cu + 0x0009)
   96DA 36 00         [10] 2735 	ld	(hl),#0x00
                           2736 ;src/main.c:739: inicializarEnemy();
   96DC CD 24 96      [17] 2737 	call	_inicializarEnemy
                           2738 ;src/main.c:741: dibujarProta();
   96DF CD F5 88      [17] 2739 	call	_dibujarProta
                           2740 ;src/main.c:742: dibujarEnemigo(actual);
   96E2 21 9C 88      [10] 2741 	ld	hl,#_enemy
   96E5 E5            [11] 2742 	push	hl
   96E6 CD 46 8B      [17] 2743 	call	_dibujarEnemigo
   96E9 F1            [10] 2744 	pop	af
   96EA C9            [10] 2745 	ret
                           2746 ;src/main.c:745: void main(void) {
                           2747 ;	---------------------------------
                           2748 ; Function main
                           2749 ; ---------------------------------
   96EB                    2750 _main::
   96EB DD E5         [15] 2751 	push	ix
   96ED DD 21 00 00   [14] 2752 	ld	ix,#0
   96F1 DD 39         [15] 2753 	add	ix,sp
   96F3 3B            [ 6] 2754 	dec	sp
                           2755 ;src/main.c:749: inicializarCPC();
   96F4 CD 01 96      [17] 2756 	call	_inicializarCPC
                           2757 ;src/main.c:750: menuInicio();
   96F7 CD 25 95      [17] 2758 	call	_menuInicio
                           2759 ;src/main.c:754: inicializarJuego();
   96FA CD 76 96      [17] 2760 	call	_inicializarJuego
                           2761 ;src/main.c:759: cpct_akp_musicPlay();
   96FD CD E2 7E      [17] 2762 	call	_cpct_akp_musicPlay
                           2763 ;src/main.c:762: actual = enemy;
                           2764 ;src/main.c:764: while (1) {
   9700                    2765 00115$:
                           2766 ;src/main.c:766: cpct_waitVSYNC();
   9700 CD AC 7E      [17] 2767 	call	_cpct_waitVSYNC
                           2768 ;src/main.c:767: comprobarTeclado();
   9703 CD 03 92      [17] 2769 	call	_comprobarTeclado
                           2770 ;src/main.c:768: moverCuchillo();
   9706 CD 42 93      [17] 2771 	call	_moverCuchillo
                           2772 ;src/main.c:770: moverEnemigo(actual);
   9709 21 9C 88      [10] 2773 	ld	hl,#_enemy
   970C E5            [11] 2774 	push	hl
   970D CD 86 8E      [17] 2775 	call	_moverEnemigo
   9710 F1            [10] 2776 	pop	af
                           2777 ;src/main.c:772: cpct_waitVSYNC();
   9711 CD AC 7E      [17] 2778 	call	_cpct_waitVSYNC
                           2779 ;src/main.c:774: if (prota.mover) {
   9714 01 CA 88      [10] 2780 	ld	bc,#_prota+6
   9717 0A            [ 7] 2781 	ld	a,(bc)
   9718 B7            [ 4] 2782 	or	a, a
   9719 28 07         [12] 2783 	jr	Z,00102$
                           2784 ;src/main.c:775: redibujarProta();
   971B C5            [11] 2785 	push	bc
   971C CD B5 89      [17] 2786 	call	_redibujarProta
   971F C1            [10] 2787 	pop	bc
                           2788 ;src/main.c:776: prota.mover = NO;
   9720 AF            [ 4] 2789 	xor	a, a
   9721 02            [ 7] 2790 	ld	(bc),a
   9722                    2791 00102$:
                           2792 ;src/main.c:778: if(cu.lanzado && cu.mover){
   9722 21 D2 88      [10] 2793 	ld	hl,#_cu + 6
   9725 4E            [ 7] 2794 	ld	c,(hl)
   9726 11 D5 88      [10] 2795 	ld	de,#_cu + 9
   9729 79            [ 4] 2796 	ld	a,c
   972A B7            [ 4] 2797 	or	a, a
   972B 28 09         [12] 2798 	jr	Z,00107$
   972D 1A            [ 7] 2799 	ld	a,(de)
   972E B7            [ 4] 2800 	or	a, a
   972F 28 05         [12] 2801 	jr	Z,00107$
                           2802 ;src/main.c:779: redibujarCuchillo();
   9731 CD D3 90      [17] 2803 	call	_redibujarCuchillo
   9734 18 0B         [12] 2804 	jr	00108$
   9736                    2805 00107$:
                           2806 ;src/main.c:780: }else if (cu.lanzado && !cu.mover){
   9736 79            [ 4] 2807 	ld	a,c
   9737 B7            [ 4] 2808 	or	a, a
   9738 28 07         [12] 2809 	jr	Z,00108$
   973A 1A            [ 7] 2810 	ld	a,(de)
   973B B7            [ 4] 2811 	or	a, a
   973C 20 03         [12] 2812 	jr	NZ,00108$
                           2813 ;src/main.c:781: borrarCuchillo();
   973E CD 66 90      [17] 2814 	call	_borrarCuchillo
   9741                    2815 00108$:
                           2816 ;src/main.c:784: if(enemy->mover){
   9741 3A A2 88      [13] 2817 	ld	a, (#_enemy + 6)
   9744 B7            [ 4] 2818 	or	a, a
   9745 28 08         [12] 2819 	jr	Z,00111$
                           2820 ;src/main.c:785: redibujarEnemigo(actual);
   9747 21 9C 88      [10] 2821 	ld	hl,#_enemy
   974A E5            [11] 2822 	push	hl
   974B CD FC 8B      [17] 2823 	call	_redibujarEnemigo
   974E F1            [10] 2824 	pop	af
   974F                    2825 00111$:
                           2826 ;src/main.c:787: if (enemy->muerto){
   974F 3A A4 88      [13] 2827 	ld	a,(#_enemy + 8)
   9752 DD 77 FF      [19] 2828 	ld	-1 (ix), a
   9755 B7            [ 4] 2829 	or	a, a
   9756 28 A8         [12] 2830 	jr	Z,00115$
                           2831 ;src/main.c:788: borrarEnemigo(actual);
   9758 21 9C 88      [10] 2832 	ld	hl,#_enemy
   975B E5            [11] 2833 	push	hl
   975C CD 7E 8B      [17] 2834 	call	_borrarEnemigo
   975F F1            [10] 2835 	pop	af
   9760 18 9E         [12] 2836 	jr	00115$
   9762 33            [ 6] 2837 	inc	sp
   9763 DD E1         [14] 2838 	pop	ix
   9765 C9            [10] 2839 	ret
                           2840 	.area _CODE
                           2841 	.area _INITIALIZER
                           2842 	.area _CABS (ABS)
   3F00                    2843 	.org 0x3F00
   3F00                    2844 _G_song:
   3F00 41                 2845 	.db #0x41	; 65	'A'
   3F01 54                 2846 	.db #0x54	; 84	'T'
   3F02 31                 2847 	.db #0x31	; 49	'1'
   3F03 30                 2848 	.db #0x30	; 48	'0'
   3F04 01                 2849 	.db #0x01	; 1
   3F05 40                 2850 	.db #0x40	; 64
   3F06 42                 2851 	.db #0x42	; 66	'B'
   3F07 0F                 2852 	.db #0x0F	; 15
   3F08 02                 2853 	.db #0x02	; 2
   3F09 06                 2854 	.db #0x06	; 6
   3F0A 1D                 2855 	.db #0x1D	; 29
   3F0B 00                 2856 	.db #0x00	; 0
   3F0C 10                 2857 	.db #0x10	; 16
   3F0D 40                 2858 	.db #0x40	; 64
   3F0E 19                 2859 	.db #0x19	; 25
   3F0F 40                 2860 	.db #0x40	; 64
   3F10 00                 2861 	.db #0x00	; 0
   3F11 00                 2862 	.db #0x00	; 0
   3F12 00                 2863 	.db #0x00	; 0
   3F13 00                 2864 	.db #0x00	; 0
   3F14 00                 2865 	.db #0x00	; 0
   3F15 00                 2866 	.db #0x00	; 0
   3F16 0D                 2867 	.db #0x0D	; 13
   3F17 12                 2868 	.db #0x12	; 18
   3F18 40                 2869 	.db #0x40	; 64
   3F19 01                 2870 	.db #0x01	; 1
   3F1A 00                 2871 	.db #0x00	; 0
   3F1B 7C                 2872 	.db #0x7C	; 124
   3F1C 18                 2873 	.db #0x18	; 24
   3F1D 78                 2874 	.db #0x78	; 120	'x'
   3F1E 0C                 2875 	.db #0x0C	; 12
   3F1F 34                 2876 	.db #0x34	; 52	'4'
   3F20 30                 2877 	.db #0x30	; 48	'0'
   3F21 2C                 2878 	.db #0x2C	; 44
   3F22 28                 2879 	.db #0x28	; 40
   3F23 24                 2880 	.db #0x24	; 36
   3F24 20                 2881 	.db #0x20	; 32
   3F25 1C                 2882 	.db #0x1C	; 28
   3F26 0D                 2883 	.db #0x0D	; 13
   3F27 25                 2884 	.db #0x25	; 37
   3F28 40                 2885 	.db #0x40	; 64
   3F29 20                 2886 	.db #0x20	; 32
   3F2A 00                 2887 	.db #0x00	; 0
   3F2B 00                 2888 	.db #0x00	; 0
   3F2C 00                 2889 	.db #0x00	; 0
   3F2D 39                 2890 	.db #0x39	; 57	'9'
   3F2E 40                 2891 	.db #0x40	; 64
   3F2F 00                 2892 	.db #0x00	; 0
   3F30 57                 2893 	.db #0x57	; 87	'W'
   3F31 40                 2894 	.db #0x40	; 64
   3F32 3B                 2895 	.db #0x3B	; 59
   3F33 40                 2896 	.db #0x40	; 64
   3F34 57                 2897 	.db #0x57	; 87	'W'
   3F35 40                 2898 	.db #0x40	; 64
   3F36 01                 2899 	.db #0x01	; 1
   3F37 2F                 2900 	.db #0x2F	; 47
   3F38 40                 2901 	.db #0x40	; 64
   3F39 19                 2902 	.db #0x19	; 25
   3F3A 00                 2903 	.db #0x00	; 0
   3F3B 76                 2904 	.db #0x76	; 118	'v'
   3F3C E1                 2905 	.db #0xE1	; 225
   3F3D 00                 2906 	.db #0x00	; 0
   3F3E 00                 2907 	.db #0x00	; 0
   3F3F 01                 2908 	.db #0x01	; 1
   3F40 04                 2909 	.db #0x04	; 4
   3F41 51                 2910 	.db #0x51	; 81	'Q'
   3F42 04                 2911 	.db #0x04	; 4
   3F43 37                 2912 	.db #0x37	; 55	'7'
   3F44 04                 2913 	.db #0x04	; 4
   3F45 4F                 2914 	.db #0x4F	; 79	'O'
   3F46 04                 2915 	.db #0x04	; 4
   3F47 37                 2916 	.db #0x37	; 55	'7'
   3F48 02                 2917 	.db #0x02	; 2
   3F49 4B                 2918 	.db #0x4B	; 75	'K'
   3F4A 02                 2919 	.db #0x02	; 2
   3F4B 37                 2920 	.db #0x37	; 55	'7'
   3F4C 04                 2921 	.db #0x04	; 4
   3F4D 4F                 2922 	.db #0x4F	; 79	'O'
   3F4E 04                 2923 	.db #0x04	; 4
   3F4F 37                 2924 	.db #0x37	; 55	'7'
   3F50 04                 2925 	.db #0x04	; 4
   3F51 4F                 2926 	.db #0x4F	; 79	'O'
   3F52 04                 2927 	.db #0x04	; 4
   3F53 37                 2928 	.db #0x37	; 55	'7'
   3F54 02                 2929 	.db #0x02	; 2
   3F55 4B                 2930 	.db #0x4B	; 75	'K'
   3F56 00                 2931 	.db #0x00	; 0
   3F57 42                 2932 	.db #0x42	; 66	'B'
   3F58 60                 2933 	.db #0x60	; 96
   3F59 00                 2934 	.db #0x00	; 0
   3F5A 42                 2935 	.db #0x42	; 66	'B'
   3F5B 80                 2936 	.db #0x80	; 128
   3F5C 00                 2937 	.db #0x00	; 0
   3F5D 00                 2938 	.db #0x00	; 0
   3F5E 42                 2939 	.db #0x42	; 66	'B'
   3F5F 00                 2940 	.db #0x00	; 0
   3F60 00                 2941 	.db #0x00	; 0
