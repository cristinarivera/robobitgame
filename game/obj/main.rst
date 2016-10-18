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
                             15 	.globl _menuInicio
                             16 	.globl _borrarPantallaAbajo
                             17 	.globl _barraPuntuacionInicial
                             18 	.globl _moverCuchillo
                             19 	.globl _checkKnifeCollision
                             20 	.globl _comprobarTeclado
                             21 	.globl _lanzarCuchillo
                             22 	.globl _redibujarCuchillo
                             23 	.globl _borrarCuchillo
                             24 	.globl _dibujarCuchillo
                             25 	.globl _moverAbajo
                             26 	.globl _moverArriba
                             27 	.globl _moverDerecha
                             28 	.globl _moverIzquierda
                             29 	.globl _avanzarMapa
                             30 	.globl _moverEnemigo
                             31 	.globl _moverEnemigoAbajo
                             32 	.globl _moverEnemigoArriba
                             33 	.globl _checkEnemyCollision
                             34 	.globl _redibujarEnemigo
                             35 	.globl _borrarEnemigo
                             36 	.globl _dibujarEnemigo
                             37 	.globl _checkCollision
                             38 	.globl _getTilePtr
                             39 	.globl _redibujarProta
                             40 	.globl _menuFin
                             41 	.globl _borrarProta
                             42 	.globl _dibujarProta
                             43 	.globl _dibujarMapa
                             44 	.globl _cpct_etm_setTileset2x4
                             45 	.globl _cpct_etm_drawTileBox2x4
                             46 	.globl _cpct_akp_musicPlay
                             47 	.globl _cpct_akp_musicInit
                             48 	.globl _cpct_getScreenPtr
                             49 	.globl _cpct_setPALColour
                             50 	.globl _cpct_setPalette
                             51 	.globl _cpct_waitVSYNC
                             52 	.globl _cpct_setVideoMode
                             53 	.globl _cpct_drawStringM0
                             54 	.globl _cpct_drawSpriteMaskedAlignedTable
                             55 	.globl _cpct_drawSolidBox
                             56 	.globl _cpct_drawSprite
                             57 	.globl _cpct_isAnyKeyPressed
                             58 	.globl _cpct_isKeyPressed
                             59 	.globl _cpct_scanKeyboard_if
                             60 	.globl _cpct_scanKeyboard_f
                             61 	.globl _cpct_memset
                             62 	.globl _cpct_disableFirmware
                             63 	.globl _num_mapa
                             64 	.globl _mapa
                             65 	.globl _cu
                             66 	.globl _prota
                             67 	.globl _enemy
                             68 	.globl _EEje
                             69 	.globl _EMirar
                             70 	.globl _mapas
                             71 ;--------------------------------------------------------
                             72 ; special function registers
                             73 ;--------------------------------------------------------
                             74 ;--------------------------------------------------------
                             75 ; ram data
                             76 ;--------------------------------------------------------
                             77 	.area _DATA
   884E                      78 _EMirar::
   884E                      79 	.ds 1
   884F                      80 _EEje::
   884F                      81 	.ds 1
   8850                      82 _enemy::
   8850                      83 	.ds 9
   8859                      84 _prota::
   8859                      85 	.ds 8
   8861                      86 _cu::
   8861                      87 	.ds 10
   886B                      88 _mapa::
   886B                      89 	.ds 2
   886D                      90 _num_mapa::
   886D                      91 	.ds 1
                             92 ;--------------------------------------------------------
                             93 ; ram data
                             94 ;--------------------------------------------------------
                             95 	.area _INITIALIZED
                             96 ;--------------------------------------------------------
                             97 ; absolute external ram data
                             98 ;--------------------------------------------------------
                             99 	.area _DABS (ABS)
                            100 ;--------------------------------------------------------
                            101 ; global & static initialisations
                            102 ;--------------------------------------------------------
                            103 	.area _HOME
                            104 	.area _GSINIT
                            105 	.area _GSFINAL
                            106 	.area _GSINIT
                            107 ;--------------------------------------------------------
                            108 ; Home
                            109 ;--------------------------------------------------------
                            110 	.area _HOME
                            111 	.area _HOME
                            112 ;--------------------------------------------------------
                            113 ; code
                            114 ;--------------------------------------------------------
                            115 	.area _CODE
                            116 ;src/main.c:114: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
                            117 ;	---------------------------------
                            118 ; Function dummy_cpct_transparentMaskTable0M0_container
                            119 ; ---------------------------------
   7B3A                     120 _dummy_cpct_transparentMaskTable0M0_container::
                            121 	.area _g_tablatrans_ (ABS) 
   3E00                     122 	.org 0x3E00 
   3E00                     123 	 _g_tablatrans::
   3E00 FF AA 55 00 AA AA   124 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E08 55 00 55 00 00 00   125 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E10 AA AA 00 00 AA AA   126 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E18 00 00 00 00 00 00   127 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E20 55 00 55 00 00 00   128 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E28 55 00 55 00 00 00   129 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E30 00 00 00 00 00 00   130 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E38 00 00 00 00 00 00   131 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E40 AA AA 00 00 AA AA   132 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E48 00 00 00 00 00 00   133 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E50 AA AA 00 00 AA AA   134 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E58 00 00 00 00 00 00   135 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E60 00 00 00 00 00 00   136 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E68 00 00 00 00 00 00   137 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E70 00 00 00 00 00 00   138 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E78 00 00 00 00 00 00   139 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E80 55 00 55 00 00 00   140 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E88 55 00 55 00 00 00   141 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E90 00 00 00 00 00 00   142 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E98 00 00 00 00 00 00   143 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA0 55 00 55 00 00 00   144 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA8 55 00 55 00 00 00   145 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB0 00 00 00 00 00 00   146 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB8 00 00 00 00 00 00   147 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC0 00 00 00 00 00 00   148 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC8 00 00 00 00 00 00   149 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED0 00 00 00 00 00 00   150 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED8 00 00 00 00 00 00   151 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE0 00 00 00 00 00 00   152 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE8 00 00 00 00 00 00   153 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF0 00 00 00 00 00 00   154 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF8 00 00 00 00 00 00   155 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            156 	.area _CSEG (REL, CON) 
                            157 ;src/main.c:117: void dibujarMapa() {
                            158 ;	---------------------------------
                            159 ; Function dibujarMapa
                            160 ; ---------------------------------
   886E                     161 _dibujarMapa::
                            162 ;src/main.c:118: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   886E 2A 6B 88      [16]  163 	ld	hl,(_mapa)
   8871 E5            [11]  164 	push	hl
   8872 21 00 C0      [10]  165 	ld	hl,#0xC000
   8875 E5            [11]  166 	push	hl
   8876 21 2C 28      [10]  167 	ld	hl,#0x282C
   8879 E5            [11]  168 	push	hl
   887A 2E 00         [ 7]  169 	ld	l, #0x00
   887C E5            [11]  170 	push	hl
   887D AF            [ 4]  171 	xor	a, a
   887E F5            [11]  172 	push	af
   887F 33            [ 6]  173 	inc	sp
   8880 CD EC 7C      [17]  174 	call	_cpct_etm_drawTileBox2x4
   8883 C9            [10]  175 	ret
   8884                     176 _mapas:
   8884 C0 4D               177 	.dw _g_map1
   8886 E0 46               178 	.dw _g_map2
   8888 00 40               179 	.dw _g_map3
                            180 ;src/main.c:123: void dibujarProta() {
                            181 ;	---------------------------------
                            182 ; Function dibujarProta
                            183 ; ---------------------------------
   888A                     184 _dibujarProta::
                            185 ;src/main.c:124: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   888A 21 5A 88      [10]  186 	ld	hl, #_prota + 1
   888D 56            [ 7]  187 	ld	d,(hl)
   888E 21 59 88      [10]  188 	ld	hl, #_prota + 0
   8891 46            [ 7]  189 	ld	b,(hl)
   8892 D5            [11]  190 	push	de
   8893 33            [ 6]  191 	inc	sp
   8894 C5            [11]  192 	push	bc
   8895 33            [ 6]  193 	inc	sp
   8896 21 00 C0      [10]  194 	ld	hl,#0xC000
   8899 E5            [11]  195 	push	hl
   889A CD F3 87      [17]  196 	call	_cpct_getScreenPtr
   889D EB            [ 4]  197 	ex	de,hl
                            198 ;src/main.c:125: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   889E ED 4B 5D 88   [20]  199 	ld	bc, (#_prota + 4)
   88A2 21 00 3E      [10]  200 	ld	hl,#_g_tablatrans
   88A5 E5            [11]  201 	push	hl
   88A6 21 07 16      [10]  202 	ld	hl,#0x1607
   88A9 E5            [11]  203 	push	hl
   88AA D5            [11]  204 	push	de
   88AB C5            [11]  205 	push	bc
   88AC CD 13 88      [17]  206 	call	_cpct_drawSpriteMaskedAlignedTable
   88AF C9            [10]  207 	ret
                            208 ;src/main.c:128: void borrarProta() {
                            209 ;	---------------------------------
                            210 ; Function borrarProta
                            211 ; ---------------------------------
   88B0                     212 _borrarProta::
   88B0 DD E5         [15]  213 	push	ix
   88B2 DD 21 00 00   [14]  214 	ld	ix,#0
   88B6 DD 39         [15]  215 	add	ix,sp
   88B8 3B            [ 6]  216 	dec	sp
                            217 ;src/main.c:130: u8 w = 4 + (prota.px & 1);
   88B9 21 5B 88      [10]  218 	ld	hl, #_prota + 2
   88BC 4E            [ 7]  219 	ld	c,(hl)
   88BD 79            [ 4]  220 	ld	a,c
   88BE E6 01         [ 7]  221 	and	a, #0x01
   88C0 47            [ 4]  222 	ld	b,a
   88C1 04            [ 4]  223 	inc	b
   88C2 04            [ 4]  224 	inc	b
   88C3 04            [ 4]  225 	inc	b
   88C4 04            [ 4]  226 	inc	b
                            227 ;src/main.c:133: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   88C5 21 5C 88      [10]  228 	ld	hl, #_prota + 3
   88C8 5E            [ 7]  229 	ld	e,(hl)
   88C9 CB 4B         [ 8]  230 	bit	1, e
   88CB 28 04         [12]  231 	jr	Z,00103$
   88CD 3E 01         [ 7]  232 	ld	a,#0x01
   88CF 18 02         [12]  233 	jr	00104$
   88D1                     234 00103$:
   88D1 3E 00         [ 7]  235 	ld	a,#0x00
   88D3                     236 00104$:
   88D3 C6 06         [ 7]  237 	add	a, #0x06
   88D5 DD 77 FF      [19]  238 	ld	-1 (ix),a
                            239 ;src/main.c:135: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   88D8 FD 2A 6B 88   [20]  240 	ld	iy,(_mapa)
   88DC 16 00         [ 7]  241 	ld	d,#0x00
   88DE 63            [ 4]  242 	ld	h,e
   88DF 6A            [ 4]  243 	ld	l,d
   88E0 CB 7A         [ 8]  244 	bit	7, d
   88E2 28 05         [12]  245 	jr	Z,00105$
   88E4 13            [ 6]  246 	inc	de
   88E5 13            [ 6]  247 	inc	de
   88E6 13            [ 6]  248 	inc	de
   88E7 63            [ 4]  249 	ld	h,e
   88E8 6A            [ 4]  250 	ld	l,d
   88E9                     251 00105$:
   88E9 5C            [ 4]  252 	ld	e, h
   88EA 55            [ 4]  253 	ld	d, l
   88EB CB 2A         [ 8]  254 	sra	d
   88ED CB 1B         [ 8]  255 	rr	e
   88EF CB 2A         [ 8]  256 	sra	d
   88F1 CB 1B         [ 8]  257 	rr	e
   88F3 51            [ 4]  258 	ld	d,c
   88F4 CB 3A         [ 8]  259 	srl	d
   88F6 FD E5         [15]  260 	push	iy
   88F8 21 00 C0      [10]  261 	ld	hl,#0xC000
   88FB E5            [11]  262 	push	hl
   88FC 3E 28         [ 7]  263 	ld	a,#0x28
   88FE F5            [11]  264 	push	af
   88FF 33            [ 6]  265 	inc	sp
   8900 DD 7E FF      [19]  266 	ld	a,-1 (ix)
   8903 F5            [11]  267 	push	af
   8904 33            [ 6]  268 	inc	sp
   8905 C5            [11]  269 	push	bc
   8906 33            [ 6]  270 	inc	sp
   8907 7B            [ 4]  271 	ld	a,e
   8908 F5            [11]  272 	push	af
   8909 33            [ 6]  273 	inc	sp
   890A D5            [11]  274 	push	de
   890B 33            [ 6]  275 	inc	sp
   890C CD EC 7C      [17]  276 	call	_cpct_etm_drawTileBox2x4
   890F 33            [ 6]  277 	inc	sp
   8910 DD E1         [14]  278 	pop	ix
   8912 C9            [10]  279 	ret
                            280 ;src/main.c:138: void menuFin(){
                            281 ;	---------------------------------
                            282 ; Function menuFin
                            283 ; ---------------------------------
   8913                     284 _menuFin::
                            285 ;src/main.c:141: cpct_clearScreen(0);
   8913 21 00 40      [10]  286 	ld	hl,#0x4000
   8916 E5            [11]  287 	push	hl
   8917 AF            [ 4]  288 	xor	a, a
   8918 F5            [11]  289 	push	af
   8919 33            [ 6]  290 	inc	sp
   891A 26 C0         [ 7]  291 	ld	h, #0xC0
   891C E5            [11]  292 	push	hl
   891D CD D2 7E      [17]  293 	call	_cpct_memset
                            294 ;src/main.c:143: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   8920 21 18 5A      [10]  295 	ld	hl,#0x5A18
   8923 E5            [11]  296 	push	hl
   8924 21 00 C0      [10]  297 	ld	hl,#0xC000
   8927 E5            [11]  298 	push	hl
   8928 CD F3 87      [17]  299 	call	_cpct_getScreenPtr
   892B 4D            [ 4]  300 	ld	c,l
   892C 44            [ 4]  301 	ld	b,h
                            302 ;src/main.c:144: cpct_drawStringM0("GAME OVER", memptr, 2, 0);   	
   892D 21 02 00      [10]  303 	ld	hl,#0x0002
   8930 E5            [11]  304 	push	hl
   8931 C5            [11]  305 	push	bc
   8932 21 40 89      [10]  306 	ld	hl,#___str_0
   8935 E5            [11]  307 	push	hl
   8936 CD 23 7C      [17]  308 	call	_cpct_drawStringM0
   8939 21 06 00      [10]  309 	ld	hl,#6
   893C 39            [11]  310 	add	hl,sp
   893D F9            [ 6]  311 	ld	sp,hl
                            312 ;src/main.c:146: while(1){}	
   893E                     313 00102$:
   893E 18 FE         [12]  314 	jr	00102$
   8940                     315 ___str_0:
   8940 47 41 4D 45 20 4F   316 	.ascii "GAME OVER"
        56 45 52
   8949 00                  317 	.db 0x00
                            318 ;src/main.c:149: void redibujarProta() {
                            319 ;	---------------------------------
                            320 ; Function redibujarProta
                            321 ; ---------------------------------
   894A                     322 _redibujarProta::
                            323 ;src/main.c:150: borrarProta();
   894A CD B0 88      [17]  324 	call	_borrarProta
                            325 ;src/main.c:151: prota.px = prota.x;
   894D 01 5B 88      [10]  326 	ld	bc,#_prota + 2
   8950 3A 59 88      [13]  327 	ld	a, (#_prota + 0)
   8953 02            [ 7]  328 	ld	(bc),a
                            329 ;src/main.c:152: prota.py = prota.y;
   8954 01 5C 88      [10]  330 	ld	bc,#_prota + 3
   8957 3A 5A 88      [13]  331 	ld	a, (#_prota + 1)
   895A 02            [ 7]  332 	ld	(bc),a
                            333 ;src/main.c:153: dibujarProta();
   895B C3 8A 88      [10]  334 	jp  _dibujarProta
                            335 ;src/main.c:156: u8* getTilePtr(u8 x, u8 y) {
                            336 ;	---------------------------------
                            337 ; Function getTilePtr
                            338 ; ---------------------------------
   895E                     339 _getTilePtr::
                            340 ;src/main.c:157: return mapa + (y/4)*g_map1_W + x/2;
   895E 21 03 00      [10]  341 	ld	hl, #3+0
   8961 39            [11]  342 	add	hl, sp
   8962 4E            [ 7]  343 	ld	c, (hl)
   8963 CB 39         [ 8]  344 	srl	c
   8965 CB 39         [ 8]  345 	srl	c
   8967 06 00         [ 7]  346 	ld	b,#0x00
   8969 69            [ 4]  347 	ld	l, c
   896A 60            [ 4]  348 	ld	h, b
   896B 29            [11]  349 	add	hl, hl
   896C 29            [11]  350 	add	hl, hl
   896D 09            [11]  351 	add	hl, bc
   896E 29            [11]  352 	add	hl, hl
   896F 29            [11]  353 	add	hl, hl
   8970 29            [11]  354 	add	hl, hl
   8971 ED 5B 6B 88   [20]  355 	ld	de,(_mapa)
   8975 19            [11]  356 	add	hl,de
   8976 FD 21 02 00   [14]  357 	ld	iy,#2
   897A FD 39         [15]  358 	add	iy,sp
   897C FD 4E 00      [19]  359 	ld	c,0 (iy)
   897F CB 39         [ 8]  360 	srl	c
   8981 59            [ 4]  361 	ld	e,c
   8982 16 00         [ 7]  362 	ld	d,#0x00
   8984 19            [11]  363 	add	hl,de
   8985 C9            [10]  364 	ret
                            365 ;src/main.c:160: u8 checkCollision(int direction) { // check optimization
                            366 ;	---------------------------------
                            367 ; Function checkCollision
                            368 ; ---------------------------------
   8986                     369 _checkCollision::
   8986 DD E5         [15]  370 	push	ix
   8988 DD 21 00 00   [14]  371 	ld	ix,#0
   898C DD 39         [15]  372 	add	ix,sp
   898E F5            [11]  373 	push	af
                            374 ;src/main.c:161: u8 *headTile=0, *feetTile=0, *waistTile=0;
   898F 21 00 00      [10]  375 	ld	hl,#0x0000
   8992 E3            [19]  376 	ex	(sp), hl
   8993 11 00 00      [10]  377 	ld	de,#0x0000
   8996 01 00 00      [10]  378 	ld	bc,#0x0000
                            379 ;src/main.c:163: switch (direction) {
   8999 DD CB 05 7E   [20]  380 	bit	7, 5 (ix)
   899D C2 BA 8A      [10]  381 	jp	NZ,00105$
   89A0 3E 03         [ 7]  382 	ld	a,#0x03
   89A2 DD BE 04      [19]  383 	cp	a, 4 (ix)
   89A5 3E 00         [ 7]  384 	ld	a,#0x00
   89A7 DD 9E 05      [19]  385 	sbc	a, 5 (ix)
   89AA E2 AF 89      [10]  386 	jp	PO, 00128$
   89AD EE 80         [ 7]  387 	xor	a, #0x80
   89AF                     388 00128$:
   89AF FA BA 8A      [10]  389 	jp	M,00105$
   89B2 DD 5E 04      [19]  390 	ld	e,4 (ix)
   89B5 16 00         [ 7]  391 	ld	d,#0x00
   89B7 21 BE 89      [10]  392 	ld	hl,#00129$
   89BA 19            [11]  393 	add	hl,de
   89BB 19            [11]  394 	add	hl,de
   89BC 19            [11]  395 	add	hl,de
   89BD E9            [ 4]  396 	jp	(hl)
   89BE                     397 00129$:
   89BE C3 CA 89      [10]  398 	jp	00101$
   89C1 C3 15 8A      [10]  399 	jp	00102$
   89C4 C3 56 8A      [10]  400 	jp	00103$
   89C7 C3 89 8A      [10]  401 	jp	00104$
                            402 ;src/main.c:164: case 0:
   89CA                     403 00101$:
                            404 ;src/main.c:165: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   89CA 21 5A 88      [10]  405 	ld	hl, #(_prota + 0x0001) + 0
   89CD 5E            [ 7]  406 	ld	e,(hl)
   89CE 21 59 88      [10]  407 	ld	hl, #_prota + 0
   89D1 4E            [ 7]  408 	ld	c,(hl)
   89D2 0C            [ 4]  409 	inc	c
   89D3 0C            [ 4]  410 	inc	c
   89D4 0C            [ 4]  411 	inc	c
   89D5 0C            [ 4]  412 	inc	c
   89D6 7B            [ 4]  413 	ld	a,e
   89D7 F5            [11]  414 	push	af
   89D8 33            [ 6]  415 	inc	sp
   89D9 79            [ 4]  416 	ld	a,c
   89DA F5            [11]  417 	push	af
   89DB 33            [ 6]  418 	inc	sp
   89DC CD 5E 89      [17]  419 	call	_getTilePtr
   89DF F1            [10]  420 	pop	af
   89E0 33            [ 6]  421 	inc	sp
   89E1 33            [ 6]  422 	inc	sp
   89E2 E5            [11]  423 	push	hl
                            424 ;src/main.c:166: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA - 2);
   89E3 3A 5A 88      [13]  425 	ld	a, (#(_prota + 0x0001) + 0)
   89E6 C6 14         [ 7]  426 	add	a, #0x14
   89E8 4F            [ 4]  427 	ld	c,a
   89E9 21 59 88      [10]  428 	ld	hl, #_prota + 0
   89EC 46            [ 7]  429 	ld	b,(hl)
   89ED 04            [ 4]  430 	inc	b
   89EE 04            [ 4]  431 	inc	b
   89EF 04            [ 4]  432 	inc	b
   89F0 04            [ 4]  433 	inc	b
   89F1 79            [ 4]  434 	ld	a,c
   89F2 F5            [11]  435 	push	af
   89F3 33            [ 6]  436 	inc	sp
   89F4 C5            [11]  437 	push	bc
   89F5 33            [ 6]  438 	inc	sp
   89F6 CD 5E 89      [17]  439 	call	_getTilePtr
   89F9 F1            [10]  440 	pop	af
   89FA EB            [ 4]  441 	ex	de,hl
                            442 ;src/main.c:167: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   89FB 3A 5A 88      [13]  443 	ld	a, (#(_prota + 0x0001) + 0)
   89FE C6 0B         [ 7]  444 	add	a, #0x0B
   8A00 47            [ 4]  445 	ld	b,a
   8A01 3A 59 88      [13]  446 	ld	a, (#_prota + 0)
   8A04 C6 04         [ 7]  447 	add	a, #0x04
   8A06 D5            [11]  448 	push	de
   8A07 C5            [11]  449 	push	bc
   8A08 33            [ 6]  450 	inc	sp
   8A09 F5            [11]  451 	push	af
   8A0A 33            [ 6]  452 	inc	sp
   8A0B CD 5E 89      [17]  453 	call	_getTilePtr
   8A0E F1            [10]  454 	pop	af
   8A0F 4D            [ 4]  455 	ld	c,l
   8A10 44            [ 4]  456 	ld	b,h
   8A11 D1            [10]  457 	pop	de
                            458 ;src/main.c:168: break;
   8A12 C3 BA 8A      [10]  459 	jp	00105$
                            460 ;src/main.c:169: case 1:
   8A15                     461 00102$:
                            462 ;src/main.c:170: headTile  = getTilePtr(prota.x - 1, prota.y);
   8A15 21 5A 88      [10]  463 	ld	hl, #(_prota + 0x0001) + 0
   8A18 56            [ 7]  464 	ld	d,(hl)
   8A19 21 59 88      [10]  465 	ld	hl, #_prota + 0
   8A1C 46            [ 7]  466 	ld	b,(hl)
   8A1D 05            [ 4]  467 	dec	b
   8A1E D5            [11]  468 	push	de
   8A1F 33            [ 6]  469 	inc	sp
   8A20 C5            [11]  470 	push	bc
   8A21 33            [ 6]  471 	inc	sp
   8A22 CD 5E 89      [17]  472 	call	_getTilePtr
   8A25 F1            [10]  473 	pop	af
   8A26 33            [ 6]  474 	inc	sp
   8A27 33            [ 6]  475 	inc	sp
   8A28 E5            [11]  476 	push	hl
                            477 ;src/main.c:171: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA - 2);
   8A29 3A 5A 88      [13]  478 	ld	a, (#(_prota + 0x0001) + 0)
   8A2C C6 14         [ 7]  479 	add	a, #0x14
   8A2E 57            [ 4]  480 	ld	d,a
   8A2F 21 59 88      [10]  481 	ld	hl, #_prota + 0
   8A32 46            [ 7]  482 	ld	b,(hl)
   8A33 05            [ 4]  483 	dec	b
   8A34 D5            [11]  484 	push	de
   8A35 33            [ 6]  485 	inc	sp
   8A36 C5            [11]  486 	push	bc
   8A37 33            [ 6]  487 	inc	sp
   8A38 CD 5E 89      [17]  488 	call	_getTilePtr
   8A3B F1            [10]  489 	pop	af
   8A3C EB            [ 4]  490 	ex	de,hl
                            491 ;src/main.c:172: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
   8A3D 3A 5A 88      [13]  492 	ld	a, (#(_prota + 0x0001) + 0)
   8A40 C6 0B         [ 7]  493 	add	a, #0x0B
   8A42 47            [ 4]  494 	ld	b,a
   8A43 3A 59 88      [13]  495 	ld	a, (#_prota + 0)
   8A46 C6 FF         [ 7]  496 	add	a,#0xFF
   8A48 D5            [11]  497 	push	de
   8A49 C5            [11]  498 	push	bc
   8A4A 33            [ 6]  499 	inc	sp
   8A4B F5            [11]  500 	push	af
   8A4C 33            [ 6]  501 	inc	sp
   8A4D CD 5E 89      [17]  502 	call	_getTilePtr
   8A50 F1            [10]  503 	pop	af
   8A51 4D            [ 4]  504 	ld	c,l
   8A52 44            [ 4]  505 	ld	b,h
   8A53 D1            [10]  506 	pop	de
                            507 ;src/main.c:173: break;
   8A54 18 64         [12]  508 	jr	00105$
                            509 ;src/main.c:174: case 2:
   8A56                     510 00103$:
                            511 ;src/main.c:175: headTile   = getTilePtr(prota.x, prota.y - 2);
   8A56 3A 5A 88      [13]  512 	ld	a, (#(_prota + 0x0001) + 0)
   8A59 C6 FE         [ 7]  513 	add	a,#0xFE
   8A5B 21 59 88      [10]  514 	ld	hl, #_prota + 0
   8A5E 56            [ 7]  515 	ld	d,(hl)
   8A5F C5            [11]  516 	push	bc
   8A60 F5            [11]  517 	push	af
   8A61 33            [ 6]  518 	inc	sp
   8A62 D5            [11]  519 	push	de
   8A63 33            [ 6]  520 	inc	sp
   8A64 CD 5E 89      [17]  521 	call	_getTilePtr
   8A67 F1            [10]  522 	pop	af
   8A68 C1            [10]  523 	pop	bc
   8A69 33            [ 6]  524 	inc	sp
   8A6A 33            [ 6]  525 	inc	sp
   8A6B E5            [11]  526 	push	hl
                            527 ;src/main.c:176: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 2);
   8A6C 21 5A 88      [10]  528 	ld	hl, #(_prota + 0x0001) + 0
   8A6F 56            [ 7]  529 	ld	d,(hl)
   8A70 15            [ 4]  530 	dec	d
   8A71 15            [ 4]  531 	dec	d
   8A72 3A 59 88      [13]  532 	ld	a, (#_prota + 0)
   8A75 C6 03         [ 7]  533 	add	a, #0x03
   8A77 C5            [11]  534 	push	bc
   8A78 D5            [11]  535 	push	de
   8A79 33            [ 6]  536 	inc	sp
   8A7A F5            [11]  537 	push	af
   8A7B 33            [ 6]  538 	inc	sp
   8A7C CD 5E 89      [17]  539 	call	_getTilePtr
   8A7F F1            [10]  540 	pop	af
   8A80 EB            [ 4]  541 	ex	de,hl
   8A81 C1            [10]  542 	pop	bc
                            543 ;src/main.c:177: *waistTile = 0;
   8A82 21 00 00      [10]  544 	ld	hl,#0x0000
   8A85 36 00         [10]  545 	ld	(hl),#0x00
                            546 ;src/main.c:178: break;
   8A87 18 31         [12]  547 	jr	00105$
                            548 ;src/main.c:179: case 3:
   8A89                     549 00104$:
                            550 ;src/main.c:180: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA  );
   8A89 3A 5A 88      [13]  551 	ld	a, (#(_prota + 0x0001) + 0)
   8A8C C6 16         [ 7]  552 	add	a, #0x16
   8A8E 21 59 88      [10]  553 	ld	hl, #_prota + 0
   8A91 56            [ 7]  554 	ld	d,(hl)
   8A92 C5            [11]  555 	push	bc
   8A93 F5            [11]  556 	push	af
   8A94 33            [ 6]  557 	inc	sp
   8A95 D5            [11]  558 	push	de
   8A96 33            [ 6]  559 	inc	sp
   8A97 CD 5E 89      [17]  560 	call	_getTilePtr
   8A9A F1            [10]  561 	pop	af
   8A9B C1            [10]  562 	pop	bc
   8A9C 33            [ 6]  563 	inc	sp
   8A9D 33            [ 6]  564 	inc	sp
   8A9E E5            [11]  565 	push	hl
                            566 ;src/main.c:181: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA );
   8A9F 3A 5A 88      [13]  567 	ld	a, (#(_prota + 0x0001) + 0)
   8AA2 C6 16         [ 7]  568 	add	a, #0x16
   8AA4 57            [ 4]  569 	ld	d,a
   8AA5 3A 59 88      [13]  570 	ld	a, (#_prota + 0)
   8AA8 C6 03         [ 7]  571 	add	a, #0x03
   8AAA C5            [11]  572 	push	bc
   8AAB D5            [11]  573 	push	de
   8AAC 33            [ 6]  574 	inc	sp
   8AAD F5            [11]  575 	push	af
   8AAE 33            [ 6]  576 	inc	sp
   8AAF CD 5E 89      [17]  577 	call	_getTilePtr
   8AB2 F1            [10]  578 	pop	af
   8AB3 EB            [ 4]  579 	ex	de,hl
   8AB4 C1            [10]  580 	pop	bc
                            581 ;src/main.c:182: *waistTile = 0;
   8AB5 21 00 00      [10]  582 	ld	hl,#0x0000
   8AB8 36 00         [10]  583 	ld	(hl),#0x00
                            584 ;src/main.c:184: }
   8ABA                     585 00105$:
                            586 ;src/main.c:186: if (*headTile > 2 || *feetTile > 2 || *waistTile > 2)
   8ABA E1            [10]  587 	pop	hl
   8ABB E5            [11]  588 	push	hl
   8ABC 6E            [ 7]  589 	ld	l,(hl)
   8ABD 3E 02         [ 7]  590 	ld	a,#0x02
   8ABF 95            [ 4]  591 	sub	a, l
   8AC0 38 0E         [12]  592 	jr	C,00106$
   8AC2 1A            [ 7]  593 	ld	a,(de)
   8AC3 5F            [ 4]  594 	ld	e,a
   8AC4 3E 02         [ 7]  595 	ld	a,#0x02
   8AC6 93            [ 4]  596 	sub	a, e
   8AC7 38 07         [12]  597 	jr	C,00106$
   8AC9 0A            [ 7]  598 	ld	a,(bc)
   8ACA 4F            [ 4]  599 	ld	c,a
   8ACB 3E 02         [ 7]  600 	ld	a,#0x02
   8ACD 91            [ 4]  601 	sub	a, c
   8ACE 30 04         [12]  602 	jr	NC,00107$
   8AD0                     603 00106$:
                            604 ;src/main.c:187: return 1;
   8AD0 2E 01         [ 7]  605 	ld	l,#0x01
   8AD2 18 02         [12]  606 	jr	00110$
   8AD4                     607 00107$:
                            608 ;src/main.c:189: return 0;
   8AD4 2E 00         [ 7]  609 	ld	l,#0x00
   8AD6                     610 00110$:
   8AD6 DD F9         [10]  611 	ld	sp, ix
   8AD8 DD E1         [14]  612 	pop	ix
   8ADA C9            [10]  613 	ret
                            614 ;src/main.c:193: void dibujarEnemigo() {
                            615 ;	---------------------------------
                            616 ; Function dibujarEnemigo
                            617 ; ---------------------------------
   8ADB                     618 _dibujarEnemigo::
                            619 ;src/main.c:194: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, enemy.x, enemy.y);
   8ADB 21 51 88      [10]  620 	ld	hl, #_enemy + 1
   8ADE 56            [ 7]  621 	ld	d,(hl)
   8ADF 21 50 88      [10]  622 	ld	hl, #_enemy + 0
   8AE2 46            [ 7]  623 	ld	b,(hl)
   8AE3 D5            [11]  624 	push	de
   8AE4 33            [ 6]  625 	inc	sp
   8AE5 C5            [11]  626 	push	bc
   8AE6 33            [ 6]  627 	inc	sp
   8AE7 21 00 C0      [10]  628 	ld	hl,#0xC000
   8AEA E5            [11]  629 	push	hl
   8AEB CD F3 87      [17]  630 	call	_cpct_getScreenPtr
   8AEE EB            [ 4]  631 	ex	de,hl
                            632 ;src/main.c:195: cpct_drawSpriteMaskedAlignedTable (enemy.sprite, pvmem, G_ENEMY_W, G_ENEMY_H, g_tablatrans);
   8AEF ED 4B 54 88   [20]  633 	ld	bc, (#_enemy + 4)
   8AF3 21 00 3E      [10]  634 	ld	hl,#_g_tablatrans
   8AF6 E5            [11]  635 	push	hl
   8AF7 21 04 16      [10]  636 	ld	hl,#0x1604
   8AFA E5            [11]  637 	push	hl
   8AFB D5            [11]  638 	push	de
   8AFC C5            [11]  639 	push	bc
   8AFD CD 13 88      [17]  640 	call	_cpct_drawSpriteMaskedAlignedTable
   8B00 C9            [10]  641 	ret
                            642 ;src/main.c:198: void borrarEnemigo() {
                            643 ;	---------------------------------
                            644 ; Function borrarEnemigo
                            645 ; ---------------------------------
   8B01                     646 _borrarEnemigo::
   8B01 DD E5         [15]  647 	push	ix
   8B03 DD 21 00 00   [14]  648 	ld	ix,#0
   8B07 DD 39         [15]  649 	add	ix,sp
   8B09 3B            [ 6]  650 	dec	sp
                            651 ;src/main.c:200: u8 w = 4 + (enemy.px & 1);
   8B0A 21 52 88      [10]  652 	ld	hl, #_enemy + 2
   8B0D 4E            [ 7]  653 	ld	c,(hl)
   8B0E 79            [ 4]  654 	ld	a,c
   8B0F E6 01         [ 7]  655 	and	a, #0x01
   8B11 47            [ 4]  656 	ld	b,a
   8B12 04            [ 4]  657 	inc	b
   8B13 04            [ 4]  658 	inc	b
   8B14 04            [ 4]  659 	inc	b
   8B15 04            [ 4]  660 	inc	b
                            661 ;src/main.c:203: u8 h = 7 + (enemy.py & 2 ? 1 : 0);
   8B16 21 53 88      [10]  662 	ld	hl, #_enemy + 3
   8B19 5E            [ 7]  663 	ld	e,(hl)
   8B1A CB 4B         [ 8]  664 	bit	1, e
   8B1C 28 04         [12]  665 	jr	Z,00103$
   8B1E 3E 01         [ 7]  666 	ld	a,#0x01
   8B20 18 02         [12]  667 	jr	00104$
   8B22                     668 00103$:
   8B22 3E 00         [ 7]  669 	ld	a,#0x00
   8B24                     670 00104$:
   8B24 C6 07         [ 7]  671 	add	a, #0x07
   8B26 DD 77 FF      [19]  672 	ld	-1 (ix),a
                            673 ;src/main.c:205: cpct_etm_drawTileBox2x4 (enemy.px / 2, (enemy.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   8B29 FD 2A 6B 88   [20]  674 	ld	iy,(_mapa)
   8B2D 16 00         [ 7]  675 	ld	d,#0x00
   8B2F 63            [ 4]  676 	ld	h,e
   8B30 6A            [ 4]  677 	ld	l,d
   8B31 CB 7A         [ 8]  678 	bit	7, d
   8B33 28 05         [12]  679 	jr	Z,00105$
   8B35 13            [ 6]  680 	inc	de
   8B36 13            [ 6]  681 	inc	de
   8B37 13            [ 6]  682 	inc	de
   8B38 63            [ 4]  683 	ld	h,e
   8B39 6A            [ 4]  684 	ld	l,d
   8B3A                     685 00105$:
   8B3A 5C            [ 4]  686 	ld	e, h
   8B3B 55            [ 4]  687 	ld	d, l
   8B3C CB 2A         [ 8]  688 	sra	d
   8B3E CB 1B         [ 8]  689 	rr	e
   8B40 CB 2A         [ 8]  690 	sra	d
   8B42 CB 1B         [ 8]  691 	rr	e
   8B44 51            [ 4]  692 	ld	d,c
   8B45 CB 3A         [ 8]  693 	srl	d
   8B47 FD E5         [15]  694 	push	iy
   8B49 21 00 C0      [10]  695 	ld	hl,#0xC000
   8B4C E5            [11]  696 	push	hl
   8B4D 3E 28         [ 7]  697 	ld	a,#0x28
   8B4F F5            [11]  698 	push	af
   8B50 33            [ 6]  699 	inc	sp
   8B51 DD 7E FF      [19]  700 	ld	a,-1 (ix)
   8B54 F5            [11]  701 	push	af
   8B55 33            [ 6]  702 	inc	sp
   8B56 C5            [11]  703 	push	bc
   8B57 33            [ 6]  704 	inc	sp
   8B58 7B            [ 4]  705 	ld	a,e
   8B59 F5            [11]  706 	push	af
   8B5A 33            [ 6]  707 	inc	sp
   8B5B D5            [11]  708 	push	de
   8B5C 33            [ 6]  709 	inc	sp
   8B5D CD EC 7C      [17]  710 	call	_cpct_etm_drawTileBox2x4
                            711 ;src/main.c:207: enemy.mover = NO;
   8B60 21 56 88      [10]  712 	ld	hl,#(_enemy + 0x0006)
   8B63 36 00         [10]  713 	ld	(hl),#0x00
   8B65 33            [ 6]  714 	inc	sp
   8B66 DD E1         [14]  715 	pop	ix
   8B68 C9            [10]  716 	ret
                            717 ;src/main.c:210: void redibujarEnemigo() {
                            718 ;	---------------------------------
                            719 ; Function redibujarEnemigo
                            720 ; ---------------------------------
   8B69                     721 _redibujarEnemigo::
                            722 ;src/main.c:211: borrarEnemigo();
   8B69 CD 01 8B      [17]  723 	call	_borrarEnemigo
                            724 ;src/main.c:212: enemy.px = enemy.x;
   8B6C 01 52 88      [10]  725 	ld	bc,#_enemy + 2
   8B6F 3A 50 88      [13]  726 	ld	a, (#_enemy + 0)
   8B72 02            [ 7]  727 	ld	(bc),a
                            728 ;src/main.c:213: enemy.py = enemy.y;
   8B73 01 53 88      [10]  729 	ld	bc,#_enemy + 3
   8B76 3A 51 88      [13]  730 	ld	a, (#_enemy + 1)
   8B79 02            [ 7]  731 	ld	(bc),a
                            732 ;src/main.c:214: dibujarEnemigo();
   8B7A C3 DB 8A      [10]  733 	jp  _dibujarEnemigo
                            734 ;src/main.c:217: u8 checkEnemyCollision(int direction){
                            735 ;	---------------------------------
                            736 ; Function checkEnemyCollision
                            737 ; ---------------------------------
   8B7D                     738 _checkEnemyCollision::
   8B7D DD E5         [15]  739 	push	ix
   8B7F DD 21 00 00   [14]  740 	ld	ix,#0
   8B83 DD 39         [15]  741 	add	ix,sp
   8B85 3B            [ 6]  742 	dec	sp
                            743 ;src/main.c:219: u8 colisiona = 1;
   8B86 DD 36 FF 01   [19]  744 	ld	-1 (ix),#0x01
                            745 ;src/main.c:221: switch (direction) {
   8B8A DD CB 05 7E   [20]  746 	bit	7, 5 (ix)
   8B8E C2 37 8D      [10]  747 	jp	NZ,00135$
   8B91 3E 03         [ 7]  748 	ld	a,#0x03
   8B93 DD BE 04      [19]  749 	cp	a, 4 (ix)
   8B96 3E 00         [ 7]  750 	ld	a,#0x00
   8B98 DD 9E 05      [19]  751 	sbc	a, 5 (ix)
   8B9B E2 A0 8B      [10]  752 	jp	PO, 00194$
   8B9E EE 80         [ 7]  753 	xor	a, #0x80
   8BA0                     754 00194$:
   8BA0 FA 37 8D      [10]  755 	jp	M,00135$
   8BA3 DD 5E 04      [19]  756 	ld	e,4 (ix)
   8BA6 16 00         [ 7]  757 	ld	d,#0x00
   8BA8 21 AF 8B      [10]  758 	ld	hl,#00195$
   8BAB 19            [11]  759 	add	hl,de
   8BAC 19            [11]  760 	add	hl,de
   8BAD 19            [11]  761 	add	hl,de
   8BAE E9            [ 4]  762 	jp	(hl)
   8BAF                     763 00195$:
   8BAF C3 37 8D      [10]  764 	jp	00135$
   8BB2 C3 37 8D      [10]  765 	jp	00135$
   8BB5 C3 C1 8B      [10]  766 	jp	00103$
   8BB8 C3 7C 8C      [10]  767 	jp	00119$
                            768 ;src/main.c:222: case 0:
                            769 ;src/main.c:224: break;
   8BBB C3 37 8D      [10]  770 	jp	00135$
                            771 ;src/main.c:225: case 1:
                            772 ;src/main.c:227: break;
   8BBE C3 37 8D      [10]  773 	jp	00135$
                            774 ;src/main.c:228: case 2:
   8BC1                     775 00103$:
                            776 ;src/main.c:229: if( *getTilePtr(enemy.x, enemy.y - 2) <= 2
   8BC1 3A 51 88      [13]  777 	ld	a, (#(_enemy + 0x0001) + 0)
   8BC4 57            [ 4]  778 	ld	d,a
   8BC5 15            [ 4]  779 	dec	d
   8BC6 15            [ 4]  780 	dec	d
   8BC7 21 50 88      [10]  781 	ld	hl, #_enemy + 0
   8BCA 46            [ 7]  782 	ld	b,(hl)
   8BCB D5            [11]  783 	push	de
   8BCC 33            [ 6]  784 	inc	sp
   8BCD C5            [11]  785 	push	bc
   8BCE 33            [ 6]  786 	inc	sp
   8BCF CD 5E 89      [17]  787 	call	_getTilePtr
   8BD2 F1            [10]  788 	pop	af
   8BD3 4E            [ 7]  789 	ld	c,(hl)
                            790 ;src/main.c:243: enemy.mira = M_abajo;
                            791 ;src/main.c:229: if( *getTilePtr(enemy.x, enemy.y - 2) <= 2
   8BD4 3E 02         [ 7]  792 	ld	a,#0x02
   8BD6 91            [ 4]  793 	sub	a, c
   8BD7 DA 77 8C      [10]  794 	jp	C,00115$
                            795 ;src/main.c:230: && *getTilePtr(enemy.x + G_ENEMY_W / 2, enemy.y - 2) <= 2
   8BDA 21 51 88      [10]  796 	ld	hl, #(_enemy + 0x0001) + 0
   8BDD 46            [ 7]  797 	ld	b,(hl)
   8BDE 05            [ 4]  798 	dec	b
   8BDF 05            [ 4]  799 	dec	b
   8BE0 21 50 88      [10]  800 	ld	hl, #_enemy + 0
   8BE3 56            [ 7]  801 	ld	d,(hl)
   8BE4 14            [ 4]  802 	inc	d
   8BE5 14            [ 4]  803 	inc	d
   8BE6 4A            [ 4]  804 	ld	c, d
   8BE7 C5            [11]  805 	push	bc
   8BE8 CD 5E 89      [17]  806 	call	_getTilePtr
   8BEB F1            [10]  807 	pop	af
   8BEC 4E            [ 7]  808 	ld	c,(hl)
   8BED 3E 02         [ 7]  809 	ld	a,#0x02
   8BEF 91            [ 4]  810 	sub	a, c
   8BF0 DA 77 8C      [10]  811 	jp	C,00115$
                            812 ;src/main.c:231: && *getTilePtr(enemy.x + G_ENEMY_W, enemy.y - 2) <= 2)
   8BF3 21 51 88      [10]  813 	ld	hl, #(_enemy + 0x0001) + 0
   8BF6 46            [ 7]  814 	ld	b,(hl)
   8BF7 05            [ 4]  815 	dec	b
   8BF8 05            [ 4]  816 	dec	b
   8BF9 3A 50 88      [13]  817 	ld	a, (#_enemy + 0)
   8BFC C6 04         [ 7]  818 	add	a, #0x04
   8BFE C5            [11]  819 	push	bc
   8BFF 33            [ 6]  820 	inc	sp
   8C00 F5            [11]  821 	push	af
   8C01 33            [ 6]  822 	inc	sp
   8C02 CD 5E 89      [17]  823 	call	_getTilePtr
   8C05 F1            [10]  824 	pop	af
   8C06 4E            [ 7]  825 	ld	c,(hl)
   8C07 3E 02         [ 7]  826 	ld	a,#0x02
   8C09 91            [ 4]  827 	sub	a, c
   8C0A 38 6B         [12]  828 	jr	C,00115$
                            829 ;src/main.c:233: if((prota.x + G_HERO_W -4) < enemy.x || prota.x  > (enemy.x + G_ENEMY_W)){
   8C0C 21 59 88      [10]  830 	ld	hl, #_prota + 0
   8C0F 4E            [ 7]  831 	ld	c,(hl)
   8C10 06 00         [ 7]  832 	ld	b,#0x00
   8C12 59            [ 4]  833 	ld	e, c
   8C13 50            [ 4]  834 	ld	d, b
   8C14 13            [ 6]  835 	inc	de
   8C15 13            [ 6]  836 	inc	de
   8C16 13            [ 6]  837 	inc	de
   8C17 21 50 88      [10]  838 	ld	hl, #_enemy + 0
   8C1A 6E            [ 7]  839 	ld	l,(hl)
   8C1B 26 00         [ 7]  840 	ld	h,#0x00
   8C1D 7B            [ 4]  841 	ld	a,e
   8C1E 95            [ 4]  842 	sub	a, l
   8C1F 7A            [ 4]  843 	ld	a,d
   8C20 9C            [ 4]  844 	sbc	a, h
   8C21 E2 26 8C      [10]  845 	jp	PO, 00196$
   8C24 EE 80         [ 7]  846 	xor	a, #0x80
   8C26                     847 00196$:
   8C26 FA 39 8C      [10]  848 	jp	M,00110$
   8C29 11 04 00      [10]  849 	ld	de,#0x0004
   8C2C 19            [11]  850 	add	hl,de
   8C2D 7D            [ 4]  851 	ld	a,l
   8C2E 91            [ 4]  852 	sub	a, c
   8C2F 7C            [ 4]  853 	ld	a,h
   8C30 98            [ 4]  854 	sbc	a, b
   8C31 E2 36 8C      [10]  855 	jp	PO, 00197$
   8C34 EE 80         [ 7]  856 	xor	a, #0x80
   8C36                     857 00197$:
   8C36 F2 3F 8C      [10]  858 	jp	P,00111$
   8C39                     859 00110$:
                            860 ;src/main.c:235: colisiona = 0;
   8C39 DD 36 FF 00   [19]  861 	ld	-1 (ix),#0x00
   8C3D 18 3D         [12]  862 	jr	00119$
   8C3F                     863 00111$:
                            864 ;src/main.c:238: if(enemy.y>prota.y){
   8C3F 21 51 88      [10]  865 	ld	hl, #(_enemy + 0x0001) + 0
   8C42 4E            [ 7]  866 	ld	c,(hl)
   8C43 21 5A 88      [10]  867 	ld	hl, #(_prota + 0x0001) + 0
   8C46 5E            [ 7]  868 	ld	e,(hl)
   8C47 7B            [ 4]  869 	ld	a,e
   8C48 91            [ 4]  870 	sub	a, c
   8C49 30 26         [12]  871 	jr	NC,00108$
                            872 ;src/main.c:239: if(enemy.y - (prota.y + G_HERO_H -2) >= 2){
   8C4B 06 00         [ 7]  873 	ld	b,#0x00
   8C4D 16 00         [ 7]  874 	ld	d,#0x00
   8C4F 21 14 00      [10]  875 	ld	hl,#0x0014
   8C52 19            [11]  876 	add	hl,de
   8C53 79            [ 4]  877 	ld	a,c
   8C54 95            [ 4]  878 	sub	a, l
   8C55 4F            [ 4]  879 	ld	c,a
   8C56 78            [ 4]  880 	ld	a,b
   8C57 9C            [ 4]  881 	sbc	a, h
   8C58 47            [ 4]  882 	ld	b,a
   8C59 79            [ 4]  883 	ld	a,c
   8C5A D6 02         [ 7]  884 	sub	a, #0x02
   8C5C 78            [ 4]  885 	ld	a,b
   8C5D 17            [ 4]  886 	rla
   8C5E 3F            [ 4]  887 	ccf
   8C5F 1F            [ 4]  888 	rra
   8C60 DE 80         [ 7]  889 	sbc	a, #0x80
   8C62 38 06         [12]  890 	jr	C,00105$
                            891 ;src/main.c:240: colisiona = 0;
   8C64 DD 36 FF 00   [19]  892 	ld	-1 (ix),#0x00
   8C68 18 12         [12]  893 	jr	00119$
   8C6A                     894 00105$:
                            895 ;src/main.c:243: enemy.mira = M_abajo;
   8C6A 21 57 88      [10]  896 	ld	hl,#(_enemy + 0x0007)
   8C6D 36 03         [10]  897 	ld	(hl),#0x03
   8C6F 18 0B         [12]  898 	jr	00119$
   8C71                     899 00108$:
                            900 ;src/main.c:246: colisiona = 0;
   8C71 DD 36 FF 00   [19]  901 	ld	-1 (ix),#0x00
   8C75 18 05         [12]  902 	jr	00119$
   8C77                     903 00115$:
                            904 ;src/main.c:252: enemy.mira = M_abajo;
   8C77 21 57 88      [10]  905 	ld	hl,#(_enemy + 0x0007)
   8C7A 36 03         [10]  906 	ld	(hl),#0x03
                            907 ;src/main.c:255: case 3:
   8C7C                     908 00119$:
                            909 ;src/main.c:258: if( *getTilePtr(enemy.x, enemy.y + G_ENEMY_H + 2) <= 2
   8C7C 3A 51 88      [13]  910 	ld	a, (#(_enemy + 0x0001) + 0)
   8C7F C6 18         [ 7]  911 	add	a, #0x18
   8C81 47            [ 4]  912 	ld	b,a
   8C82 21 50 88      [10]  913 	ld	hl, #_enemy + 0
   8C85 4E            [ 7]  914 	ld	c, (hl)
   8C86 C5            [11]  915 	push	bc
   8C87 CD 5E 89      [17]  916 	call	_getTilePtr
   8C8A F1            [10]  917 	pop	af
   8C8B 4E            [ 7]  918 	ld	c,(hl)
                            919 ;src/main.c:271: enemy.mira = M_arriba;
                            920 ;src/main.c:258: if( *getTilePtr(enemy.x, enemy.y + G_ENEMY_H + 2) <= 2
   8C8C 3E 02         [ 7]  921 	ld	a,#0x02
   8C8E 91            [ 4]  922 	sub	a, c
   8C8F DA 32 8D      [10]  923 	jp	C,00131$
                            924 ;src/main.c:259: && *getTilePtr(enemy.x + G_ENEMY_W / 2, enemy.y + G_ENEMY_H + 2) <= 2
   8C92 3A 51 88      [13]  925 	ld	a, (#(_enemy + 0x0001) + 0)
   8C95 C6 18         [ 7]  926 	add	a, #0x18
   8C97 47            [ 4]  927 	ld	b,a
   8C98 21 50 88      [10]  928 	ld	hl, #_enemy + 0
   8C9B 56            [ 7]  929 	ld	d,(hl)
   8C9C 14            [ 4]  930 	inc	d
   8C9D 14            [ 4]  931 	inc	d
   8C9E 4A            [ 4]  932 	ld	c, d
   8C9F C5            [11]  933 	push	bc
   8CA0 CD 5E 89      [17]  934 	call	_getTilePtr
   8CA3 F1            [10]  935 	pop	af
   8CA4 4E            [ 7]  936 	ld	c,(hl)
   8CA5 3E 02         [ 7]  937 	ld	a,#0x02
   8CA7 91            [ 4]  938 	sub	a, c
   8CA8 DA 32 8D      [10]  939 	jp	C,00131$
                            940 ;src/main.c:260: && *getTilePtr(enemy.x + G_ENEMY_W, enemy.y + G_ENEMY_H + 2) <= 2)			  
   8CAB 3A 51 88      [13]  941 	ld	a, (#(_enemy + 0x0001) + 0)
   8CAE C6 18         [ 7]  942 	add	a, #0x18
   8CB0 47            [ 4]  943 	ld	b,a
   8CB1 3A 50 88      [13]  944 	ld	a, (#_enemy + 0)
   8CB4 C6 04         [ 7]  945 	add	a, #0x04
   8CB6 C5            [11]  946 	push	bc
   8CB7 33            [ 6]  947 	inc	sp
   8CB8 F5            [11]  948 	push	af
   8CB9 33            [ 6]  949 	inc	sp
   8CBA CD 5E 89      [17]  950 	call	_getTilePtr
   8CBD F1            [10]  951 	pop	af
   8CBE 4E            [ 7]  952 	ld	c,(hl)
   8CBF 3E 02         [ 7]  953 	ld	a,#0x02
   8CC1 91            [ 4]  954 	sub	a, c
   8CC2 38 6E         [12]  955 	jr	C,00131$
                            956 ;src/main.c:262: if( (prota.x + G_HERO_W -4) < enemy.x || prota.x  > (enemy.x + G_ENEMY_W) ){
   8CC4 21 59 88      [10]  957 	ld	hl, #_prota + 0
   8CC7 4E            [ 7]  958 	ld	c,(hl)
   8CC8 06 00         [ 7]  959 	ld	b,#0x00
   8CCA 59            [ 4]  960 	ld	e, c
   8CCB 50            [ 4]  961 	ld	d, b
   8CCC 13            [ 6]  962 	inc	de
   8CCD 13            [ 6]  963 	inc	de
   8CCE 13            [ 6]  964 	inc	de
   8CCF 21 50 88      [10]  965 	ld	hl, #_enemy + 0
   8CD2 6E            [ 7]  966 	ld	l,(hl)
   8CD3 26 00         [ 7]  967 	ld	h,#0x00
   8CD5 7B            [ 4]  968 	ld	a,e
   8CD6 95            [ 4]  969 	sub	a, l
   8CD7 7A            [ 4]  970 	ld	a,d
   8CD8 9C            [ 4]  971 	sbc	a, h
   8CD9 E2 DE 8C      [10]  972 	jp	PO, 00198$
   8CDC EE 80         [ 7]  973 	xor	a, #0x80
   8CDE                     974 00198$:
   8CDE FA F1 8C      [10]  975 	jp	M,00126$
   8CE1 11 04 00      [10]  976 	ld	de,#0x0004
   8CE4 19            [11]  977 	add	hl,de
   8CE5 7D            [ 4]  978 	ld	a,l
   8CE6 91            [ 4]  979 	sub	a, c
   8CE7 7C            [ 4]  980 	ld	a,h
   8CE8 98            [ 4]  981 	sbc	a, b
   8CE9 E2 EE 8C      [10]  982 	jp	PO, 00199$
   8CEC EE 80         [ 7]  983 	xor	a, #0x80
   8CEE                     984 00199$:
   8CEE F2 F7 8C      [10]  985 	jp	P,00127$
   8CF1                     986 00126$:
                            987 ;src/main.c:263: colisiona = 0;
   8CF1 DD 36 FF 00   [19]  988 	ld	-1 (ix),#0x00
   8CF5 18 40         [12]  989 	jr	00135$
   8CF7                     990 00127$:
                            991 ;src/main.c:266: if(prota.y > enemy.y){ //si el prota esta abajo
   8CF7 21 5A 88      [10]  992 	ld	hl, #(_prota + 0x0001) + 0
   8CFA 4E            [ 7]  993 	ld	c,(hl)
   8CFB 21 51 88      [10]  994 	ld	hl, #(_enemy + 0x0001) + 0
   8CFE 5E            [ 7]  995 	ld	e,(hl)
   8CFF 7B            [ 4]  996 	ld	a,e
   8D00 91            [ 4]  997 	sub	a, c
   8D01 30 29         [12]  998 	jr	NC,00124$
                            999 ;src/main.c:267: if( prota.y - (enemy.y + G_ENEMY_H) > 2){ // si hay espacio entre el enemigo y el prota
   8D03 06 00         [ 7] 1000 	ld	b,#0x00
   8D05 16 00         [ 7] 1001 	ld	d,#0x00
   8D07 21 16 00      [10] 1002 	ld	hl,#0x0016
   8D0A 19            [11] 1003 	add	hl,de
   8D0B 79            [ 4] 1004 	ld	a,c
   8D0C 95            [ 4] 1005 	sub	a, l
   8D0D 4F            [ 4] 1006 	ld	c,a
   8D0E 78            [ 4] 1007 	ld	a,b
   8D0F 9C            [ 4] 1008 	sbc	a, h
   8D10 47            [ 4] 1009 	ld	b,a
   8D11 3E 02         [ 7] 1010 	ld	a,#0x02
   8D13 B9            [ 4] 1011 	cp	a, c
   8D14 3E 00         [ 7] 1012 	ld	a,#0x00
   8D16 98            [ 4] 1013 	sbc	a, b
   8D17 E2 1C 8D      [10] 1014 	jp	PO, 00200$
   8D1A EE 80         [ 7] 1015 	xor	a, #0x80
   8D1C                    1016 00200$:
   8D1C F2 25 8D      [10] 1017 	jp	P,00121$
                           1018 ;src/main.c:268: colisiona = 0;
   8D1F DD 36 FF 00   [19] 1019 	ld	-1 (ix),#0x00
   8D23 18 12         [12] 1020 	jr	00135$
   8D25                    1021 00121$:
                           1022 ;src/main.c:271: enemy.mira = M_arriba;
   8D25 21 57 88      [10] 1023 	ld	hl,#(_enemy + 0x0007)
   8D28 36 02         [10] 1024 	ld	(hl),#0x02
   8D2A 18 0B         [12] 1025 	jr	00135$
   8D2C                    1026 00124$:
                           1027 ;src/main.c:274: colisiona = 0;
   8D2C DD 36 FF 00   [19] 1028 	ld	-1 (ix),#0x00
   8D30 18 05         [12] 1029 	jr	00135$
   8D32                    1030 00131$:
                           1031 ;src/main.c:278: enemy.mira = M_arriba;
   8D32 21 57 88      [10] 1032 	ld	hl,#(_enemy + 0x0007)
   8D35 36 02         [10] 1033 	ld	(hl),#0x02
                           1034 ;src/main.c:281: }
   8D37                    1035 00135$:
                           1036 ;src/main.c:282: return colisiona;
   8D37 DD 6E FF      [19] 1037 	ld	l,-1 (ix)
   8D3A 33            [ 6] 1038 	inc	sp
   8D3B DD E1         [14] 1039 	pop	ix
   8D3D C9            [10] 1040 	ret
                           1041 ;src/main.c:285: void moverEnemigoArriba(){
                           1042 ;	---------------------------------
                           1043 ; Function moverEnemigoArriba
                           1044 ; ---------------------------------
   8D3E                    1045 _moverEnemigoArriba::
                           1046 ;src/main.c:286: enemy.y--;
   8D3E 21 51 88      [10] 1047 	ld	hl,#_enemy + 1
   8D41 4E            [ 7] 1048 	ld	c,(hl)
   8D42 0D            [ 4] 1049 	dec	c
   8D43 71            [ 7] 1050 	ld	(hl),c
                           1051 ;src/main.c:287: enemy.y--;
   8D44 0D            [ 4] 1052 	dec	c
   8D45 71            [ 7] 1053 	ld	(hl),c
                           1054 ;src/main.c:288: enemy.mover = SI;
   8D46 21 56 88      [10] 1055 	ld	hl,#(_enemy + 0x0006)
   8D49 36 01         [10] 1056 	ld	(hl),#0x01
   8D4B C9            [10] 1057 	ret
                           1058 ;src/main.c:291: void moverEnemigoAbajo(){
                           1059 ;	---------------------------------
                           1060 ; Function moverEnemigoAbajo
                           1061 ; ---------------------------------
   8D4C                    1062 _moverEnemigoAbajo::
                           1063 ;src/main.c:292: enemy.y++;
   8D4C 01 51 88      [10] 1064 	ld	bc,#_enemy + 1
   8D4F 0A            [ 7] 1065 	ld	a,(bc)
   8D50 3C            [ 4] 1066 	inc	a
   8D51 02            [ 7] 1067 	ld	(bc),a
                           1068 ;src/main.c:293: enemy.y++;
   8D52 3C            [ 4] 1069 	inc	a
   8D53 02            [ 7] 1070 	ld	(bc),a
                           1071 ;src/main.c:294: enemy.mover = SI;
   8D54 21 56 88      [10] 1072 	ld	hl,#(_enemy + 0x0006)
   8D57 36 01         [10] 1073 	ld	(hl),#0x01
   8D59 C9            [10] 1074 	ret
                           1075 ;src/main.c:297: void moverEnemigo(){
                           1076 ;	---------------------------------
                           1077 ; Function moverEnemigo
                           1078 ; ---------------------------------
   8D5A                    1079 _moverEnemigo::
                           1080 ;src/main.c:298: if(!enemy.muerto){
   8D5A 3A 58 88      [13] 1081 	ld	a, (#_enemy + 8)
   8D5D B7            [ 4] 1082 	or	a, a
   8D5E C0            [11] 1083 	ret	NZ
                           1084 ;src/main.c:299: if(!checkEnemyCollision(enemy.mira)){
   8D5F 21 57 88      [10] 1085 	ld	hl,#_enemy + 7
   8D62 4E            [ 7] 1086 	ld	c,(hl)
   8D63 06 00         [ 7] 1087 	ld	b,#0x00
   8D65 E5            [11] 1088 	push	hl
   8D66 C5            [11] 1089 	push	bc
   8D67 CD 7D 8B      [17] 1090 	call	_checkEnemyCollision
   8D6A F1            [10] 1091 	pop	af
   8D6B 7D            [ 4] 1092 	ld	a,l
   8D6C E1            [10] 1093 	pop	hl
   8D6D B7            [ 4] 1094 	or	a, a
   8D6E C0            [11] 1095 	ret	NZ
                           1096 ;src/main.c:301: switch (enemy.mira) {
   8D6F 5E            [ 7] 1097 	ld	e,(hl)
   8D70 3E 03         [ 7] 1098 	ld	a,#0x03
   8D72 93            [ 4] 1099 	sub	a, e
   8D73 D8            [11] 1100 	ret	C
   8D74 16 00         [ 7] 1101 	ld	d,#0x00
   8D76 21 7C 8D      [10] 1102 	ld	hl,#00124$
   8D79 19            [11] 1103 	add	hl,de
   8D7A 19            [11] 1104 	add	hl,de
                           1105 ;src/main.c:302: case 0:
                           1106 ;src/main.c:304: break;
                           1107 ;src/main.c:305: case 1:
                           1108 ;src/main.c:307: break;
                           1109 ;src/main.c:308: case 2:
   8D7B E9            [ 4] 1110 	jp	(hl)
   8D7C                    1111 00124$:
   8D7C 18 10         [12] 1112 	jr	00110$
   8D7E 18 0E         [12] 1113 	jr	00110$
   8D80 18 06         [12] 1114 	jr	00103$
   8D82 18 07         [12] 1115 	jr	00104$
   8D84 18 08         [12] 1116 	jr	00110$
   8D86 18 06         [12] 1117 	jr	00110$
   8D88                    1118 00103$:
                           1119 ;src/main.c:309: moverEnemigoArriba();
                           1120 ;src/main.c:310: break;
   8D88 C3 3E 8D      [10] 1121 	jp  _moverEnemigoArriba
                           1122 ;src/main.c:311: case 3:
   8D8B                    1123 00104$:
                           1124 ;src/main.c:312: moverEnemigoAbajo();
   8D8B CD 4C 8D      [17] 1125 	call	_moverEnemigoAbajo
                           1126 ;src/main.c:314: }
   8D8E                    1127 00110$:
   8D8E C9            [10] 1128 	ret
                           1129 ;src/main.c:319: void avanzarMapa() {
                           1130 ;	---------------------------------
                           1131 ; Function avanzarMapa
                           1132 ; ---------------------------------
   8D8F                    1133 _avanzarMapa::
                           1134 ;src/main.c:320: if(num_mapa < NUM_MAPAS -1) {
   8D8F 3A 6D 88      [13] 1135 	ld	a,(#_num_mapa + 0)
   8D92 D6 02         [ 7] 1136 	sub	a, #0x02
   8D94 D2 13 89      [10] 1137 	jp	NC,_menuFin
                           1138 ;src/main.c:321: mapa = mapas[++num_mapa];
   8D97 21 6D 88      [10] 1139 	ld	hl, #_num_mapa+0
   8D9A 34            [11] 1140 	inc	(hl)
   8D9B FD 21 6D 88   [14] 1141 	ld	iy,#_num_mapa
   8D9F FD 6E 00      [19] 1142 	ld	l,0 (iy)
   8DA2 26 00         [ 7] 1143 	ld	h,#0x00
   8DA4 29            [11] 1144 	add	hl, hl
   8DA5 11 84 88      [10] 1145 	ld	de,#_mapas
   8DA8 19            [11] 1146 	add	hl,de
   8DA9 7E            [ 7] 1147 	ld	a,(hl)
   8DAA FD 21 6B 88   [14] 1148 	ld	iy,#_mapa
   8DAE FD 77 00      [19] 1149 	ld	0 (iy),a
   8DB1 23            [ 6] 1150 	inc	hl
   8DB2 7E            [ 7] 1151 	ld	a,(hl)
   8DB3 32 6C 88      [13] 1152 	ld	(#_mapa + 1),a
                           1153 ;src/main.c:322: prota.x = prota.px = 2;
   8DB6 21 5B 88      [10] 1154 	ld	hl,#(_prota + 0x0002)
   8DB9 36 02         [10] 1155 	ld	(hl),#0x02
   8DBB 21 59 88      [10] 1156 	ld	hl,#_prota
   8DBE 36 02         [10] 1157 	ld	(hl),#0x02
                           1158 ;src/main.c:323: prota.mover = SI;
   8DC0 21 5F 88      [10] 1159 	ld	hl,#(_prota + 0x0006)
                           1160 ;src/main.c:324: dibujarMapa();
                           1161 ;src/main.c:328: menuFin();
   8DC3 36 01         [10] 1162 	ld	(hl), #0x01
   8DC5 C3 6E 88      [10] 1163 	jp	_dibujarMapa
                           1164 ;src/main.c:332: void moverIzquierda() {
                           1165 ;	---------------------------------
                           1166 ; Function moverIzquierda
                           1167 ; ---------------------------------
   8DC8                    1168 _moverIzquierda::
                           1169 ;src/main.c:333: prota.mira = M_izquierda;
   8DC8 01 59 88      [10] 1170 	ld	bc,#_prota+0
   8DCB 21 60 88      [10] 1171 	ld	hl,#(_prota + 0x0007)
   8DCE 36 01         [10] 1172 	ld	(hl),#0x01
                           1173 ;src/main.c:334: if (!checkCollision(M_izquierda)) {
   8DD0 C5            [11] 1174 	push	bc
   8DD1 21 01 00      [10] 1175 	ld	hl,#0x0001
   8DD4 E5            [11] 1176 	push	hl
   8DD5 CD 86 89      [17] 1177 	call	_checkCollision
   8DD8 F1            [10] 1178 	pop	af
   8DD9 C1            [10] 1179 	pop	bc
   8DDA 7D            [ 4] 1180 	ld	a,l
   8DDB B7            [ 4] 1181 	or	a, a
   8DDC C0            [11] 1182 	ret	NZ
                           1183 ;src/main.c:335: prota.x--;
   8DDD 0A            [ 7] 1184 	ld	a,(bc)
   8DDE C6 FF         [ 7] 1185 	add	a,#0xFF
   8DE0 02            [ 7] 1186 	ld	(bc),a
                           1187 ;src/main.c:336: prota.mover = SI;
   8DE1 21 5F 88      [10] 1188 	ld	hl,#(_prota + 0x0006)
   8DE4 36 01         [10] 1189 	ld	(hl),#0x01
                           1190 ;src/main.c:337: prota.sprite = g_hero_left;
   8DE6 21 A6 79      [10] 1191 	ld	hl,#_g_hero_left
   8DE9 22 5D 88      [16] 1192 	ld	((_prota + 0x0004)), hl
   8DEC C9            [10] 1193 	ret
                           1194 ;src/main.c:341: void moverDerecha() {
                           1195 ;	---------------------------------
                           1196 ; Function moverDerecha
                           1197 ; ---------------------------------
   8DED                    1198 _moverDerecha::
                           1199 ;src/main.c:342: prota.mira = M_derecha;
   8DED 21 60 88      [10] 1200 	ld	hl,#(_prota + 0x0007)
   8DF0 36 00         [10] 1201 	ld	(hl),#0x00
                           1202 ;src/main.c:343: if (!checkCollision(M_derecha) && ( prota.x + G_HERO_W < 80)) {
   8DF2 21 00 00      [10] 1203 	ld	hl,#0x0000
   8DF5 E5            [11] 1204 	push	hl
   8DF6 CD 86 89      [17] 1205 	call	_checkCollision
   8DF9 F1            [10] 1206 	pop	af
   8DFA 45            [ 4] 1207 	ld	b,l
   8DFB 21 59 88      [10] 1208 	ld	hl, #_prota + 0
   8DFE 4E            [ 7] 1209 	ld	c,(hl)
   8DFF 59            [ 4] 1210 	ld	e,c
   8E00 16 00         [ 7] 1211 	ld	d,#0x00
   8E02 21 07 00      [10] 1212 	ld	hl,#0x0007
   8E05 19            [11] 1213 	add	hl,de
   8E06 11 50 80      [10] 1214 	ld	de, #0x8050
   8E09 29            [11] 1215 	add	hl, hl
   8E0A 3F            [ 4] 1216 	ccf
   8E0B CB 1C         [ 8] 1217 	rr	h
   8E0D CB 1D         [ 8] 1218 	rr	l
   8E0F ED 52         [15] 1219 	sbc	hl, de
   8E11 3E 00         [ 7] 1220 	ld	a,#0x00
   8E13 17            [ 4] 1221 	rla
   8E14 5F            [ 4] 1222 	ld	e,a
   8E15 78            [ 4] 1223 	ld	a,b
   8E16 B7            [ 4] 1224 	or	a,a
   8E17 20 14         [12] 1225 	jr	NZ,00104$
   8E19 B3            [ 4] 1226 	or	a,e
   8E1A 28 11         [12] 1227 	jr	Z,00104$
                           1228 ;src/main.c:344: prota.x++;
   8E1C 0C            [ 4] 1229 	inc	c
   8E1D 21 59 88      [10] 1230 	ld	hl,#_prota
   8E20 71            [ 7] 1231 	ld	(hl),c
                           1232 ;src/main.c:345: prota.mover = SI;
   8E21 21 5F 88      [10] 1233 	ld	hl,#(_prota + 0x0006)
   8E24 36 01         [10] 1234 	ld	(hl),#0x01
                           1235 ;src/main.c:346: prota.sprite = g_hero;
   8E26 21 50 7A      [10] 1236 	ld	hl,#_g_hero
   8E29 22 5D 88      [16] 1237 	ld	((_prota + 0x0004)), hl
   8E2C C9            [10] 1238 	ret
   8E2D                    1239 00104$:
                           1240 ;src/main.c:348: }else if( prota.x + G_HERO_W >= 80){
   8E2D 7B            [ 4] 1241 	ld	a,e
   8E2E B7            [ 4] 1242 	or	a, a
   8E2F C0            [11] 1243 	ret	NZ
                           1244 ;src/main.c:349: avanzarMapa();	
   8E30 C3 8F 8D      [10] 1245 	jp  _avanzarMapa
                           1246 ;src/main.c:353: void moverArriba() {
                           1247 ;	---------------------------------
                           1248 ; Function moverArriba
                           1249 ; ---------------------------------
   8E33                    1250 _moverArriba::
                           1251 ;src/main.c:354: prota.mira = M_arriba;
   8E33 21 60 88      [10] 1252 	ld	hl,#(_prota + 0x0007)
   8E36 36 02         [10] 1253 	ld	(hl),#0x02
                           1254 ;src/main.c:355: if (!checkCollision(M_arriba) && (prota.y >= 0)) { // TODO: COMPROBAR
   8E38 21 02 00      [10] 1255 	ld	hl,#0x0002
   8E3B E5            [11] 1256 	push	hl
   8E3C CD 86 89      [17] 1257 	call	_checkCollision
   8E3F F1            [10] 1258 	pop	af
   8E40 7D            [ 4] 1259 	ld	a,l
   8E41 B7            [ 4] 1260 	or	a, a
   8E42 C0            [11] 1261 	ret	NZ
                           1262 ;src/main.c:356: prota.y--;
   8E43 21 5A 88      [10] 1263 	ld	hl,#_prota + 1
   8E46 4E            [ 7] 1264 	ld	c,(hl)
   8E47 0D            [ 4] 1265 	dec	c
   8E48 71            [ 7] 1266 	ld	(hl),c
                           1267 ;src/main.c:357: prota.y--;
   8E49 0D            [ 4] 1268 	dec	c
   8E4A 71            [ 7] 1269 	ld	(hl),c
                           1270 ;src/main.c:358: prota.mover  = SI;
   8E4B 21 5F 88      [10] 1271 	ld	hl,#(_prota + 0x0006)
   8E4E 36 01         [10] 1272 	ld	(hl),#0x01
                           1273 ;src/main.c:359: prota.sprite = g_hero_up;
   8E50 21 0C 79      [10] 1274 	ld	hl,#_g_hero_up
   8E53 22 5D 88      [16] 1275 	ld	((_prota + 0x0004)), hl
   8E56 C9            [10] 1276 	ret
                           1277 ;src/main.c:363: void moverAbajo() {
                           1278 ;	---------------------------------
                           1279 ; Function moverAbajo
                           1280 ; ---------------------------------
   8E57                    1281 _moverAbajo::
                           1282 ;src/main.c:364: prota.mira = M_abajo;
   8E57 21 60 88      [10] 1283 	ld	hl,#(_prota + 0x0007)
   8E5A 36 03         [10] 1284 	ld	(hl),#0x03
                           1285 ;src/main.c:365: if (!checkCollision(M_abajo) && (prota.y + G_HERO_H < ALTO_MAPA)) { // TODO: COMPROBAR
   8E5C 21 03 00      [10] 1286 	ld	hl,#0x0003
   8E5F E5            [11] 1287 	push	hl
   8E60 CD 86 89      [17] 1288 	call	_checkCollision
   8E63 F1            [10] 1289 	pop	af
   8E64 7D            [ 4] 1290 	ld	a,l
   8E65 B7            [ 4] 1291 	or	a, a
   8E66 C0            [11] 1292 	ret	NZ
   8E67 01 5A 88      [10] 1293 	ld	bc,#_prota + 1
   8E6A 0A            [ 7] 1294 	ld	a,(bc)
   8E6B 5F            [ 4] 1295 	ld	e,a
   8E6C 6B            [ 4] 1296 	ld	l,e
   8E6D 26 00         [ 7] 1297 	ld	h,#0x00
   8E6F D5            [11] 1298 	push	de
   8E70 11 16 00      [10] 1299 	ld	de,#0x0016
   8E73 19            [11] 1300 	add	hl, de
   8E74 D1            [10] 1301 	pop	de
   8E75 7D            [ 4] 1302 	ld	a,l
   8E76 D6 B0         [ 7] 1303 	sub	a, #0xB0
   8E78 7C            [ 4] 1304 	ld	a,h
   8E79 17            [ 4] 1305 	rla
   8E7A 3F            [ 4] 1306 	ccf
   8E7B 1F            [ 4] 1307 	rra
   8E7C DE 80         [ 7] 1308 	sbc	a, #0x80
   8E7E D0            [11] 1309 	ret	NC
                           1310 ;src/main.c:366: prota.y++;
   8E7F 7B            [ 4] 1311 	ld	a,e
   8E80 3C            [ 4] 1312 	inc	a
   8E81 02            [ 7] 1313 	ld	(bc),a
                           1314 ;src/main.c:367: prota.y++;
   8E82 3C            [ 4] 1315 	inc	a
   8E83 02            [ 7] 1316 	ld	(bc),a
                           1317 ;src/main.c:368: prota.mover  = SI;
   8E84 21 5F 88      [10] 1318 	ld	hl,#(_prota + 0x0006)
   8E87 36 01         [10] 1319 	ld	(hl),#0x01
                           1320 ;src/main.c:369: prota.sprite = g_hero_down;
   8E89 21 72 78      [10] 1321 	ld	hl,#_g_hero_down
   8E8C 22 5D 88      [16] 1322 	ld	((_prota + 0x0004)), hl
   8E8F C9            [10] 1323 	ret
                           1324 ;src/main.c:373: void dibujarCuchillo() {
                           1325 ;	---------------------------------
                           1326 ; Function dibujarCuchillo
                           1327 ; ---------------------------------
   8E90                    1328 _dibujarCuchillo::
   8E90 DD E5         [15] 1329 	push	ix
   8E92 DD 21 00 00   [14] 1330 	ld	ix,#0
   8E96 DD 39         [15] 1331 	add	ix,sp
   8E98 F5            [11] 1332 	push	af
                           1333 ;src/main.c:374: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu.x, cu.y);
   8E99 21 62 88      [10] 1334 	ld	hl, #_cu + 1
   8E9C 56            [ 7] 1335 	ld	d,(hl)
   8E9D 21 61 88      [10] 1336 	ld	hl, #_cu + 0
   8EA0 46            [ 7] 1337 	ld	b,(hl)
   8EA1 D5            [11] 1338 	push	de
   8EA2 33            [ 6] 1339 	inc	sp
   8EA3 C5            [11] 1340 	push	bc
   8EA4 33            [ 6] 1341 	inc	sp
   8EA5 21 00 C0      [10] 1342 	ld	hl,#0xC000
   8EA8 E5            [11] 1343 	push	hl
   8EA9 CD F3 87      [17] 1344 	call	_cpct_getScreenPtr
   8EAC 45            [ 4] 1345 	ld	b,l
   8EAD 5C            [ 4] 1346 	ld	e,h
                           1347 ;src/main.c:375: if(cu.eje == E_X){
   8EAE 21 69 88      [10] 1348 	ld	hl, #_cu + 8
   8EB1 4E            [ 7] 1349 	ld	c,(hl)
                           1350 ;src/main.c:376: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   8EB2 DD 70 FE      [19] 1351 	ld	-2 (ix),b
   8EB5 DD 73 FF      [19] 1352 	ld	-1 (ix),e
                           1353 ;src/main.c:375: if(cu.eje == E_X){
   8EB8 79            [ 4] 1354 	ld	a,c
   8EB9 B7            [ 4] 1355 	or	a, a
   8EBA 20 19         [12] 1356 	jr	NZ,00104$
                           1357 ;src/main.c:376: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   8EBC 11 00 3E      [10] 1358 	ld	de,#_g_tablatrans+0
   8EBF ED 4B 65 88   [20] 1359 	ld	bc, (#(_cu + 0x0004) + 0)
   8EC3 D5            [11] 1360 	push	de
   8EC4 21 04 04      [10] 1361 	ld	hl,#0x0404
   8EC7 E5            [11] 1362 	push	hl
   8EC8 DD 6E FE      [19] 1363 	ld	l,-2 (ix)
   8ECB DD 66 FF      [19] 1364 	ld	h,-1 (ix)
   8ECE E5            [11] 1365 	push	hl
   8ECF C5            [11] 1366 	push	bc
   8ED0 CD 13 88      [17] 1367 	call	_cpct_drawSpriteMaskedAlignedTable
   8ED3 18 1A         [12] 1368 	jr	00106$
   8ED5                    1369 00104$:
                           1370 ;src/main.c:379: else if(cu.eje == E_Y){
   8ED5 0D            [ 4] 1371 	dec	c
   8ED6 20 17         [12] 1372 	jr	NZ,00106$
                           1373 ;src/main.c:380: cpct_drawSpriteMaskedAlignedTable (cu.sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   8ED8 11 00 3E      [10] 1374 	ld	de,#_g_tablatrans+0
   8EDB ED 4B 65 88   [20] 1375 	ld	bc, (#(_cu + 0x0004) + 0)
   8EDF D5            [11] 1376 	push	de
   8EE0 21 02 08      [10] 1377 	ld	hl,#0x0802
   8EE3 E5            [11] 1378 	push	hl
   8EE4 DD 6E FE      [19] 1379 	ld	l,-2 (ix)
   8EE7 DD 66 FF      [19] 1380 	ld	h,-1 (ix)
   8EEA E5            [11] 1381 	push	hl
   8EEB C5            [11] 1382 	push	bc
   8EEC CD 13 88      [17] 1383 	call	_cpct_drawSpriteMaskedAlignedTable
   8EEF                    1384 00106$:
   8EEF DD F9         [10] 1385 	ld	sp, ix
   8EF1 DD E1         [14] 1386 	pop	ix
   8EF3 C9            [10] 1387 	ret
                           1388 ;src/main.c:384: void borrarCuchillo() {
                           1389 ;	---------------------------------
                           1390 ; Function borrarCuchillo
                           1391 ; ---------------------------------
   8EF4                    1392 _borrarCuchillo::
   8EF4 DD E5         [15] 1393 	push	ix
   8EF6 DD 21 00 00   [14] 1394 	ld	ix,#0
   8EFA DD 39         [15] 1395 	add	ix,sp
   8EFC 3B            [ 6] 1396 	dec	sp
                           1397 ;src/main.c:386: u8 w = 2 + (cu.px & 1);
   8EFD 21 63 88      [10] 1398 	ld	hl, #_cu + 2
   8F00 4E            [ 7] 1399 	ld	c,(hl)
   8F01 79            [ 4] 1400 	ld	a,c
   8F02 E6 01         [ 7] 1401 	and	a, #0x01
   8F04 47            [ 4] 1402 	ld	b,a
   8F05 04            [ 4] 1403 	inc	b
   8F06 04            [ 4] 1404 	inc	b
                           1405 ;src/main.c:387: u8 h = 2 + (cu.py & 3 ? 1 : 0);
   8F07 21 64 88      [10] 1406 	ld	hl, #_cu + 3
   8F0A 5E            [ 7] 1407 	ld	e,(hl)
   8F0B 7B            [ 4] 1408 	ld	a,e
   8F0C E6 03         [ 7] 1409 	and	a, #0x03
   8F0E 28 04         [12] 1410 	jr	Z,00105$
   8F10 3E 01         [ 7] 1411 	ld	a,#0x01
   8F12 18 02         [12] 1412 	jr	00106$
   8F14                    1413 00105$:
   8F14 3E 00         [ 7] 1414 	ld	a,#0x00
   8F16                    1415 00106$:
   8F16 C6 02         [ 7] 1416 	add	a, #0x02
   8F18 DD 77 FF      [19] 1417 	ld	-1 (ix),a
                           1418 ;src/main.c:388: cpct_etm_drawTileBox2x4 (cu.px / 2, (cu.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   8F1B FD 2A 6B 88   [20] 1419 	ld	iy,(_mapa)
   8F1F 16 00         [ 7] 1420 	ld	d,#0x00
   8F21 63            [ 4] 1421 	ld	h,e
   8F22 6A            [ 4] 1422 	ld	l,d
   8F23 CB 7A         [ 8] 1423 	bit	7, d
   8F25 28 05         [12] 1424 	jr	Z,00107$
   8F27 13            [ 6] 1425 	inc	de
   8F28 13            [ 6] 1426 	inc	de
   8F29 13            [ 6] 1427 	inc	de
   8F2A 63            [ 4] 1428 	ld	h,e
   8F2B 6A            [ 4] 1429 	ld	l,d
   8F2C                    1430 00107$:
   8F2C 5C            [ 4] 1431 	ld	e, h
   8F2D 55            [ 4] 1432 	ld	d, l
   8F2E CB 2A         [ 8] 1433 	sra	d
   8F30 CB 1B         [ 8] 1434 	rr	e
   8F32 CB 2A         [ 8] 1435 	sra	d
   8F34 CB 1B         [ 8] 1436 	rr	e
   8F36 51            [ 4] 1437 	ld	d,c
   8F37 CB 3A         [ 8] 1438 	srl	d
   8F39 FD E5         [15] 1439 	push	iy
   8F3B 21 00 C0      [10] 1440 	ld	hl,#0xC000
   8F3E E5            [11] 1441 	push	hl
   8F3F 3E 28         [ 7] 1442 	ld	a,#0x28
   8F41 F5            [11] 1443 	push	af
   8F42 33            [ 6] 1444 	inc	sp
   8F43 DD 7E FF      [19] 1445 	ld	a,-1 (ix)
   8F46 F5            [11] 1446 	push	af
   8F47 33            [ 6] 1447 	inc	sp
   8F48 C5            [11] 1448 	push	bc
   8F49 33            [ 6] 1449 	inc	sp
   8F4A 7B            [ 4] 1450 	ld	a,e
   8F4B F5            [11] 1451 	push	af
   8F4C 33            [ 6] 1452 	inc	sp
   8F4D D5            [11] 1453 	push	de
   8F4E 33            [ 6] 1454 	inc	sp
   8F4F CD EC 7C      [17] 1455 	call	_cpct_etm_drawTileBox2x4
                           1456 ;src/main.c:389: if(!cu.mover){
   8F52 3A 6A 88      [13] 1457 	ld	a, (#_cu + 9)
   8F55 B7            [ 4] 1458 	or	a, a
   8F56 20 05         [12] 1459 	jr	NZ,00103$
                           1460 ;src/main.c:390: cu.lanzado = NO;
   8F58 21 67 88      [10] 1461 	ld	hl,#(_cu + 0x0006)
   8F5B 36 00         [10] 1462 	ld	(hl),#0x00
   8F5D                    1463 00103$:
   8F5D 33            [ 6] 1464 	inc	sp
   8F5E DD E1         [14] 1465 	pop	ix
   8F60 C9            [10] 1466 	ret
                           1467 ;src/main.c:394: void redibujarCuchillo( ) {
                           1468 ;	---------------------------------
                           1469 ; Function redibujarCuchillo
                           1470 ; ---------------------------------
   8F61                    1471 _redibujarCuchillo::
                           1472 ;src/main.c:395: borrarCuchillo();
   8F61 CD F4 8E      [17] 1473 	call	_borrarCuchillo
                           1474 ;src/main.c:396: cu.px = cu.x;
   8F64 01 63 88      [10] 1475 	ld	bc,#_cu + 2
   8F67 3A 61 88      [13] 1476 	ld	a, (#_cu + 0)
   8F6A 02            [ 7] 1477 	ld	(bc),a
                           1478 ;src/main.c:397: cu.py = cu.y;
   8F6B 01 64 88      [10] 1479 	ld	bc,#_cu + 3
   8F6E 3A 62 88      [13] 1480 	ld	a, (#_cu + 1)
   8F71 02            [ 7] 1481 	ld	(bc),a
                           1482 ;src/main.c:398: dibujarCuchillo();
   8F72 C3 90 8E      [10] 1483 	jp  _dibujarCuchillo
                           1484 ;src/main.c:402: void lanzarCuchillo(){
                           1485 ;	---------------------------------
                           1486 ; Function lanzarCuchillo
                           1487 ; ---------------------------------
   8F75                    1488 _lanzarCuchillo::
                           1489 ;src/main.c:404: if(!cu.lanzado){
   8F75 3A 67 88      [13] 1490 	ld	a, (#(_cu + 0x0006) + 0)
   8F78 B7            [ 4] 1491 	or	a, a
   8F79 C0            [11] 1492 	ret	NZ
                           1493 ;src/main.c:406: if(prota.mira == M_derecha){
   8F7A 21 60 88      [10] 1494 	ld	hl, #_prota + 7
   8F7D 5E            [ 7] 1495 	ld	e,(hl)
                           1496 ;src/main.c:407: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   8F7E 01 5A 88      [10] 1497 	ld	bc,#_prota + 1
                           1498 ;src/main.c:409: cu.direccion = M_derecha;
                           1499 ;src/main.c:411: cu.y=prota.y + G_HERO_H /2;
                           1500 ;src/main.c:412: cu.sprite=g_knifeX_0;
                           1501 ;src/main.c:413: cu.eje = E_X;
                           1502 ;src/main.c:406: if(prota.mira == M_derecha){
   8F81 7B            [ 4] 1503 	ld	a,e
   8F82 B7            [ 4] 1504 	or	a, a
   8F83 20 41         [12] 1505 	jr	NZ,00118$
                           1506 ;src/main.c:407: if( *getTilePtr(prota.x + G_HERO_W + G_KNIFEX_0_W + 1, prota.y + G_HERO_H /2) <= 2){
   8F85 0A            [ 7] 1507 	ld	a,(bc)
   8F86 C6 0B         [ 7] 1508 	add	a, #0x0B
   8F88 5F            [ 4] 1509 	ld	e,a
   8F89 3A 59 88      [13] 1510 	ld	a, (#_prota + 0)
   8F8C C6 0C         [ 7] 1511 	add	a, #0x0C
   8F8E 6F            [ 4] 1512 	ld	l,a
   8F8F C5            [11] 1513 	push	bc
   8F90 7B            [ 4] 1514 	ld	a,e
   8F91 F5            [11] 1515 	push	af
   8F92 33            [ 6] 1516 	inc	sp
   8F93 7D            [ 4] 1517 	ld	a,l
   8F94 F5            [11] 1518 	push	af
   8F95 33            [ 6] 1519 	inc	sp
   8F96 CD 5E 89      [17] 1520 	call	_getTilePtr
   8F99 F1            [10] 1521 	pop	af
   8F9A C1            [10] 1522 	pop	bc
   8F9B 5E            [ 7] 1523 	ld	e,(hl)
   8F9C 3E 02         [ 7] 1524 	ld	a,#0x02
   8F9E 93            [ 4] 1525 	sub	a, e
   8F9F D8            [11] 1526 	ret	C
                           1527 ;src/main.c:408: cu.lanzado = SI;
   8FA0 21 67 88      [10] 1528 	ld	hl,#(_cu + 0x0006)
   8FA3 36 01         [10] 1529 	ld	(hl),#0x01
                           1530 ;src/main.c:409: cu.direccion = M_derecha;
   8FA5 21 68 88      [10] 1531 	ld	hl,#(_cu + 0x0007)
   8FA8 36 00         [10] 1532 	ld	(hl),#0x00
                           1533 ;src/main.c:410: cu.x=prota.x + G_HERO_W;
   8FAA 3A 59 88      [13] 1534 	ld	a, (#_prota + 0)
   8FAD C6 07         [ 7] 1535 	add	a, #0x07
   8FAF 32 61 88      [13] 1536 	ld	(#_cu),a
                           1537 ;src/main.c:411: cu.y=prota.y + G_HERO_H /2;
   8FB2 0A            [ 7] 1538 	ld	a,(bc)
   8FB3 C6 0B         [ 7] 1539 	add	a, #0x0B
   8FB5 32 62 88      [13] 1540 	ld	(#(_cu + 0x0001)),a
                           1541 ;src/main.c:412: cu.sprite=g_knifeX_0;
   8FB8 21 C0 54      [10] 1542 	ld	hl,#_g_knifeX_0
   8FBB 22 65 88      [16] 1543 	ld	((_cu + 0x0004)), hl
                           1544 ;src/main.c:413: cu.eje = E_X;
   8FBE 21 69 88      [10] 1545 	ld	hl,#(_cu + 0x0008)
   8FC1 36 00         [10] 1546 	ld	(hl),#0x00
                           1547 ;src/main.c:414: dibujarCuchillo();
   8FC3 C3 90 8E      [10] 1548 	jp  _dibujarCuchillo
   8FC6                    1549 00118$:
                           1550 ;src/main.c:417: else if(prota.mira == M_izquierda){
   8FC6 7B            [ 4] 1551 	ld	a,e
   8FC7 3D            [ 4] 1552 	dec	a
   8FC8 20 41         [12] 1553 	jr	NZ,00115$
                           1554 ;src/main.c:418: if( *getTilePtr(prota.x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota.y + G_HERO_H /2) <= 2){
   8FCA 0A            [ 7] 1555 	ld	a,(bc)
   8FCB C6 0B         [ 7] 1556 	add	a, #0x0B
   8FCD 5F            [ 4] 1557 	ld	e,a
   8FCE 3A 59 88      [13] 1558 	ld	a, (#_prota + 0)
   8FD1 C6 F6         [ 7] 1559 	add	a,#0xF6
   8FD3 6F            [ 4] 1560 	ld	l,a
   8FD4 C5            [11] 1561 	push	bc
   8FD5 7B            [ 4] 1562 	ld	a,e
   8FD6 F5            [11] 1563 	push	af
   8FD7 33            [ 6] 1564 	inc	sp
   8FD8 7D            [ 4] 1565 	ld	a,l
   8FD9 F5            [11] 1566 	push	af
   8FDA 33            [ 6] 1567 	inc	sp
   8FDB CD 5E 89      [17] 1568 	call	_getTilePtr
   8FDE F1            [10] 1569 	pop	af
   8FDF C1            [10] 1570 	pop	bc
   8FE0 5E            [ 7] 1571 	ld	e,(hl)
   8FE1 3E 02         [ 7] 1572 	ld	a,#0x02
   8FE3 93            [ 4] 1573 	sub	a, e
   8FE4 D8            [11] 1574 	ret	C
                           1575 ;src/main.c:419: cu.lanzado = SI;
   8FE5 21 67 88      [10] 1576 	ld	hl,#(_cu + 0x0006)
   8FE8 36 01         [10] 1577 	ld	(hl),#0x01
                           1578 ;src/main.c:420: cu.direccion = M_izquierda;
   8FEA 21 68 88      [10] 1579 	ld	hl,#(_cu + 0x0007)
   8FED 36 01         [10] 1580 	ld	(hl),#0x01
                           1581 ;src/main.c:421: cu.x = prota.x - G_KNIFEX_0_W;
   8FEF 3A 59 88      [13] 1582 	ld	a, (#_prota + 0)
   8FF2 C6 FC         [ 7] 1583 	add	a,#0xFC
   8FF4 32 61 88      [13] 1584 	ld	(#_cu),a
                           1585 ;src/main.c:422: cu.y = prota.y + G_HERO_H /2;
   8FF7 0A            [ 7] 1586 	ld	a,(bc)
   8FF8 C6 0B         [ 7] 1587 	add	a, #0x0B
   8FFA 32 62 88      [13] 1588 	ld	(#(_cu + 0x0001)),a
                           1589 ;src/main.c:423: cu.sprite = g_knifeX_1;
   8FFD 21 D0 54      [10] 1590 	ld	hl,#_g_knifeX_1
   9000 22 65 88      [16] 1591 	ld	((_cu + 0x0004)), hl
                           1592 ;src/main.c:424: cu.eje = E_X;
   9003 21 69 88      [10] 1593 	ld	hl,#(_cu + 0x0008)
   9006 36 00         [10] 1594 	ld	(hl),#0x00
                           1595 ;src/main.c:425: dibujarCuchillo();
   9008 C3 90 8E      [10] 1596 	jp  _dibujarCuchillo
   900B                    1597 00115$:
                           1598 ;src/main.c:428: else if(prota.mira == M_abajo){
   900B 7B            [ 4] 1599 	ld	a,e
   900C D6 03         [ 7] 1600 	sub	a, #0x03
   900E 20 41         [12] 1601 	jr	NZ,00112$
                           1602 ;src/main.c:430: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   9010 0A            [ 7] 1603 	ld	a,(bc)
   9011 C6 1F         [ 7] 1604 	add	a, #0x1F
   9013 5F            [ 4] 1605 	ld	e,a
   9014 3A 59 88      [13] 1606 	ld	a, (#_prota + 0)
   9017 57            [ 4] 1607 	ld	d,a
   9018 14            [ 4] 1608 	inc	d
   9019 14            [ 4] 1609 	inc	d
   901A 14            [ 4] 1610 	inc	d
   901B C5            [11] 1611 	push	bc
   901C 7B            [ 4] 1612 	ld	a,e
   901D F5            [11] 1613 	push	af
   901E 33            [ 6] 1614 	inc	sp
   901F D5            [11] 1615 	push	de
   9020 33            [ 6] 1616 	inc	sp
   9021 CD 5E 89      [17] 1617 	call	_getTilePtr
   9024 F1            [10] 1618 	pop	af
   9025 C1            [10] 1619 	pop	bc
   9026 5E            [ 7] 1620 	ld	e,(hl)
   9027 3E 02         [ 7] 1621 	ld	a,#0x02
   9029 93            [ 4] 1622 	sub	a, e
   902A D8            [11] 1623 	ret	C
                           1624 ;src/main.c:431: cu.lanzado = SI;
   902B 21 67 88      [10] 1625 	ld	hl,#(_cu + 0x0006)
   902E 36 01         [10] 1626 	ld	(hl),#0x01
                           1627 ;src/main.c:432: cu.direccion = M_abajo;
   9030 21 68 88      [10] 1628 	ld	hl,#(_cu + 0x0007)
   9033 36 03         [10] 1629 	ld	(hl),#0x03
                           1630 ;src/main.c:433: cu.x = prota.x + G_HERO_W / 2;
   9035 3A 59 88      [13] 1631 	ld	a, (#_prota + 0)
   9038 C6 03         [ 7] 1632 	add	a, #0x03
   903A 32 61 88      [13] 1633 	ld	(#_cu),a
                           1634 ;src/main.c:434: cu.y = prota.y + G_HERO_H;
   903D 0A            [ 7] 1635 	ld	a,(bc)
   903E C6 16         [ 7] 1636 	add	a, #0x16
   9040 32 62 88      [13] 1637 	ld	(#(_cu + 0x0001)),a
                           1638 ;src/main.c:435: cu.sprite = g_knifeY_0;
   9043 21 A0 54      [10] 1639 	ld	hl,#_g_knifeY_0
   9046 22 65 88      [16] 1640 	ld	((_cu + 0x0004)), hl
                           1641 ;src/main.c:436: cu.eje = E_Y;
   9049 21 69 88      [10] 1642 	ld	hl,#(_cu + 0x0008)
   904C 36 01         [10] 1643 	ld	(hl),#0x01
                           1644 ;src/main.c:437: dibujarCuchillo();
   904E C3 90 8E      [10] 1645 	jp  _dibujarCuchillo
   9051                    1646 00112$:
                           1647 ;src/main.c:440: else if(prota.mira == M_arriba){
   9051 7B            [ 4] 1648 	ld	a,e
   9052 D6 02         [ 7] 1649 	sub	a, #0x02
   9054 C0            [11] 1650 	ret	NZ
                           1651 ;src/main.c:441: if( *getTilePtr(prota.x + G_HERO_W / 2, prota.y - G_KNIFEY_0_H - 1) <= 2){
   9055 0A            [ 7] 1652 	ld	a,(bc)
   9056 C6 F7         [ 7] 1653 	add	a,#0xF7
   9058 57            [ 4] 1654 	ld	d,a
   9059 3A 59 88      [13] 1655 	ld	a, (#_prota + 0)
   905C C6 03         [ 7] 1656 	add	a, #0x03
   905E C5            [11] 1657 	push	bc
   905F D5            [11] 1658 	push	de
   9060 33            [ 6] 1659 	inc	sp
   9061 F5            [11] 1660 	push	af
   9062 33            [ 6] 1661 	inc	sp
   9063 CD 5E 89      [17] 1662 	call	_getTilePtr
   9066 F1            [10] 1663 	pop	af
   9067 C1            [10] 1664 	pop	bc
   9068 5E            [ 7] 1665 	ld	e,(hl)
   9069 3E 02         [ 7] 1666 	ld	a,#0x02
   906B 93            [ 4] 1667 	sub	a, e
   906C D8            [11] 1668 	ret	C
                           1669 ;src/main.c:442: cu.lanzado = SI;
   906D 21 67 88      [10] 1670 	ld	hl,#(_cu + 0x0006)
   9070 36 01         [10] 1671 	ld	(hl),#0x01
                           1672 ;src/main.c:443: cu.direccion = M_arriba;
   9072 21 68 88      [10] 1673 	ld	hl,#(_cu + 0x0007)
   9075 36 02         [10] 1674 	ld	(hl),#0x02
                           1675 ;src/main.c:444: cu.x = prota.x + G_HERO_W / 2;
   9077 3A 59 88      [13] 1676 	ld	a, (#_prota + 0)
   907A C6 03         [ 7] 1677 	add	a, #0x03
   907C 32 61 88      [13] 1678 	ld	(#_cu),a
                           1679 ;src/main.c:445: cu.y = prota.y;
   907F 0A            [ 7] 1680 	ld	a,(bc)
   9080 32 62 88      [13] 1681 	ld	(#(_cu + 0x0001)),a
                           1682 ;src/main.c:446: cu.sprite = g_knifeY_1;
   9083 21 B0 54      [10] 1683 	ld	hl,#_g_knifeY_1
   9086 22 65 88      [16] 1684 	ld	((_cu + 0x0004)), hl
                           1685 ;src/main.c:447: cu.eje = E_Y;
   9089 21 69 88      [10] 1686 	ld	hl,#(_cu + 0x0008)
   908C 36 01         [10] 1687 	ld	(hl),#0x01
                           1688 ;src/main.c:448: dibujarCuchillo();
   908E C3 90 8E      [10] 1689 	jp  _dibujarCuchillo
                           1690 ;src/main.c:454: void comprobarTeclado() {
                           1691 ;	---------------------------------
                           1692 ; Function comprobarTeclado
                           1693 ; ---------------------------------
   9091                    1694 _comprobarTeclado::
                           1695 ;src/main.c:455: cpct_scanKeyboard_if();
   9091 CD 44 7E      [17] 1696 	call	_cpct_scanKeyboard_if
                           1697 ;src/main.c:457: if (cpct_isAnyKeyPressed()) {
   9094 CD 37 7E      [17] 1698 	call	_cpct_isAnyKeyPressed
   9097 7D            [ 4] 1699 	ld	a,l
   9098 B7            [ 4] 1700 	or	a, a
   9099 C8            [11] 1701 	ret	Z
                           1702 ;src/main.c:458: if (cpct_isKeyPressed(Key_CursorLeft))
   909A 21 01 01      [10] 1703 	ld	hl,#0x0101
   909D CD A1 7B      [17] 1704 	call	_cpct_isKeyPressed
   90A0 7D            [ 4] 1705 	ld	a,l
   90A1 B7            [ 4] 1706 	or	a, a
                           1707 ;src/main.c:459: moverIzquierda();
   90A2 C2 C8 8D      [10] 1708 	jp	NZ,_moverIzquierda
                           1709 ;src/main.c:460: else if (cpct_isKeyPressed(Key_CursorRight))
   90A5 21 00 02      [10] 1710 	ld	hl,#0x0200
   90A8 CD A1 7B      [17] 1711 	call	_cpct_isKeyPressed
   90AB 7D            [ 4] 1712 	ld	a,l
   90AC B7            [ 4] 1713 	or	a, a
                           1714 ;src/main.c:461: moverDerecha();
   90AD C2 ED 8D      [10] 1715 	jp	NZ,_moverDerecha
                           1716 ;src/main.c:462: else if (cpct_isKeyPressed(Key_CursorUp))
   90B0 21 00 01      [10] 1717 	ld	hl,#0x0100
   90B3 CD A1 7B      [17] 1718 	call	_cpct_isKeyPressed
   90B6 7D            [ 4] 1719 	ld	a,l
   90B7 B7            [ 4] 1720 	or	a, a
                           1721 ;src/main.c:463: moverArriba();
   90B8 C2 33 8E      [10] 1722 	jp	NZ,_moverArriba
                           1723 ;src/main.c:464: else if (cpct_isKeyPressed(Key_CursorDown))
   90BB 21 00 04      [10] 1724 	ld	hl,#0x0400
   90BE CD A1 7B      [17] 1725 	call	_cpct_isKeyPressed
   90C1 7D            [ 4] 1726 	ld	a,l
   90C2 B7            [ 4] 1727 	or	a, a
                           1728 ;src/main.c:465: moverAbajo();
   90C3 C2 57 8E      [10] 1729 	jp	NZ,_moverAbajo
                           1730 ;src/main.c:466: else if (cpct_isKeyPressed(Key_Space))
   90C6 21 05 80      [10] 1731 	ld	hl,#0x8005
   90C9 CD A1 7B      [17] 1732 	call	_cpct_isKeyPressed
   90CC 7D            [ 4] 1733 	ld	a,l
   90CD B7            [ 4] 1734 	or	a, a
   90CE C8            [11] 1735 	ret	Z
                           1736 ;src/main.c:467: lanzarCuchillo();
   90CF C3 75 8F      [10] 1737 	jp  _lanzarCuchillo
                           1738 ;src/main.c:471: u8 checkKnifeCollision(int direction){
                           1739 ;	---------------------------------
                           1740 ; Function checkKnifeCollision
                           1741 ; ---------------------------------
   90D2                    1742 _checkKnifeCollision::
   90D2 DD E5         [15] 1743 	push	ix
   90D4 DD 21 00 00   [14] 1744 	ld	ix,#0
   90D8 DD 39         [15] 1745 	add	ix,sp
                           1746 ;src/main.c:473: u8 colisiona = 1;
   90DA 0E 01         [ 7] 1747 	ld	c,#0x01
                           1748 ;src/main.c:475: switch (direction) {
   90DC DD CB 05 7E   [20] 1749 	bit	7, 5 (ix)
   90E0 C2 CC 91      [10] 1750 	jp	NZ,00125$
   90E3 3E 03         [ 7] 1751 	ld	a,#0x03
   90E5 DD BE 04      [19] 1752 	cp	a, 4 (ix)
   90E8 3E 00         [ 7] 1753 	ld	a,#0x00
   90EA DD 9E 05      [19] 1754 	sbc	a, 5 (ix)
   90ED E2 F2 90      [10] 1755 	jp	PO, 00163$
   90F0 EE 80         [ 7] 1756 	xor	a, #0x80
   90F2                    1757 00163$:
   90F2 FA CC 91      [10] 1758 	jp	M,00125$
   90F5 DD 5E 04      [19] 1759 	ld	e,4 (ix)
   90F8 16 00         [ 7] 1760 	ld	d,#0x00
   90FA 21 01 91      [10] 1761 	ld	hl,#00164$
   90FD 19            [11] 1762 	add	hl,de
   90FE 19            [11] 1763 	add	hl,de
   90FF 19            [11] 1764 	add	hl,de
   9100 E9            [ 4] 1765 	jp	(hl)
   9101                    1766 00164$:
   9101 C3 CC 91      [10] 1767 	jp	00125$
   9104 C3 CC 91      [10] 1768 	jp	00125$
   9107 C3 13 91      [10] 1769 	jp	00103$
   910A C3 6A 91      [10] 1770 	jp	00114$
                           1771 ;src/main.c:476: case 0:
                           1772 ;src/main.c:478: break;
   910D C3 CC 91      [10] 1773 	jp	00125$
                           1774 ;src/main.c:479: case 1:
                           1775 ;src/main.c:481: break;
   9110 C3 CC 91      [10] 1776 	jp	00125$
                           1777 ;src/main.c:482: case 2:
   9113                    1778 00103$:
                           1779 ;src/main.c:484: if((enemy.x + G_ENEMY_W) < cu.x || enemy.x  > (cu.x + G_KNIFEX_0_W)){
   9113 21 50 88      [10] 1780 	ld	hl,#_enemy+0
   9116 4E            [ 7] 1781 	ld	c,(hl)
   9117 06 00         [ 7] 1782 	ld	b,#0x00
   9119 21 04 00      [10] 1783 	ld	hl,#0x0004
   911C 09            [11] 1784 	add	hl,bc
   911D EB            [ 4] 1785 	ex	de,hl
   911E 21 61 88      [10] 1786 	ld	hl,#_cu+0
   9121 6E            [ 7] 1787 	ld	l,(hl)
   9122 26 00         [ 7] 1788 	ld	h,#0x00
   9124 7B            [ 4] 1789 	ld	a,e
   9125 95            [ 4] 1790 	sub	a, l
   9126 7A            [ 4] 1791 	ld	a,d
   9127 9C            [ 4] 1792 	sbc	a, h
   9128 E2 2D 91      [10] 1793 	jp	PO, 00165$
   912B EE 80         [ 7] 1794 	xor	a, #0x80
   912D                    1795 00165$:
   912D FA 6A 91      [10] 1796 	jp	M,00114$
   9130 11 04 00      [10] 1797 	ld	de,#0x0004
   9133 19            [11] 1798 	add	hl,de
   9134 7D            [ 4] 1799 	ld	a,l
   9135 91            [ 4] 1800 	sub	a, c
   9136 7C            [ 4] 1801 	ld	a,h
   9137 98            [ 4] 1802 	sbc	a, b
   9138 E2 3D 91      [10] 1803 	jp	PO, 00166$
   913B EE 80         [ 7] 1804 	xor	a, #0x80
   913D                    1805 00166$:
   913D FA 6A 91      [10] 1806 	jp	M,00114$
                           1807 ;src/main.c:487: if(cu.y>enemy.y){
   9140 21 62 88      [10] 1808 	ld	hl, #(_cu + 0x0001) + 0
   9143 4E            [ 7] 1809 	ld	c,(hl)
   9144 21 51 88      [10] 1810 	ld	hl, #_enemy + 1
   9147 5E            [ 7] 1811 	ld	e,(hl)
   9148 7B            [ 4] 1812 	ld	a,e
   9149 91            [ 4] 1813 	sub	a, c
   914A 30 1E         [12] 1814 	jr	NC,00114$
                           1815 ;src/main.c:488: if(cu.y - (enemy.y + G_ENEMY_H) >= 2){
   914C 06 00         [ 7] 1816 	ld	b,#0x00
   914E 16 00         [ 7] 1817 	ld	d,#0x00
   9150 21 16 00      [10] 1818 	ld	hl,#0x0016
   9153 19            [11] 1819 	add	hl,de
   9154 79            [ 4] 1820 	ld	a,c
   9155 95            [ 4] 1821 	sub	a, l
   9156 4F            [ 4] 1822 	ld	c,a
   9157 78            [ 4] 1823 	ld	a,b
   9158 9C            [ 4] 1824 	sbc	a, h
   9159 47            [ 4] 1825 	ld	b,a
   915A 79            [ 4] 1826 	ld	a,c
   915B D6 02         [ 7] 1827 	sub	a, #0x02
   915D 78            [ 4] 1828 	ld	a,b
   915E 17            [ 4] 1829 	rla
   915F 3F            [ 4] 1830 	ccf
   9160 1F            [ 4] 1831 	rra
   9161 DE 80         [ 7] 1832 	sbc	a, #0x80
   9163 30 05         [12] 1833 	jr	NC,00114$
                           1834 ;src/main.c:493: enemy.muerto = SI;
   9165 21 58 88      [10] 1835 	ld	hl,#(_enemy + 0x0008)
   9168 36 01         [10] 1836 	ld	(hl),#0x01
                           1837 ;src/main.c:500: case 3:
   916A                    1838 00114$:
                           1839 ;src/main.c:502: if((enemy.x + G_ENEMY_W) < cu.x || enemy.x  > (cu.x + G_KNIFEX_0_W)){
   916A 21 50 88      [10] 1840 	ld	hl, #_enemy + 0
   916D 4E            [ 7] 1841 	ld	c,(hl)
   916E 06 00         [ 7] 1842 	ld	b,#0x00
   9170 21 04 00      [10] 1843 	ld	hl,#0x0004
   9173 09            [11] 1844 	add	hl,bc
   9174 EB            [ 4] 1845 	ex	de,hl
   9175 21 61 88      [10] 1846 	ld	hl, #_cu + 0
   9178 6E            [ 7] 1847 	ld	l,(hl)
   9179 26 00         [ 7] 1848 	ld	h,#0x00
   917B 7B            [ 4] 1849 	ld	a,e
   917C 95            [ 4] 1850 	sub	a, l
   917D 7A            [ 4] 1851 	ld	a,d
   917E 9C            [ 4] 1852 	sbc	a, h
   917F E2 84 91      [10] 1853 	jp	PO, 00167$
   9182 EE 80         [ 7] 1854 	xor	a, #0x80
   9184                    1855 00167$:
   9184 FA 97 91      [10] 1856 	jp	M,00121$
   9187 11 04 00      [10] 1857 	ld	de,#0x0004
   918A 19            [11] 1858 	add	hl,de
   918B 7D            [ 4] 1859 	ld	a,l
   918C 91            [ 4] 1860 	sub	a, c
   918D 7C            [ 4] 1861 	ld	a,h
   918E 98            [ 4] 1862 	sbc	a, b
   918F E2 94 91      [10] 1863 	jp	PO, 00168$
   9192 EE 80         [ 7] 1864 	xor	a, #0x80
   9194                    1865 00168$:
   9194 F2 9B 91      [10] 1866 	jp	P,00122$
   9197                    1867 00121$:
                           1868 ;src/main.c:503: colisiona = 0;
   9197 0E 00         [ 7] 1869 	ld	c,#0x00
   9199 18 31         [12] 1870 	jr	00125$
   919B                    1871 00122$:
                           1872 ;src/main.c:505: if(cu.y<enemy.y){
   919B 21 62 88      [10] 1873 	ld	hl, #(_cu + 0x0001) + 0
   919E 4E            [ 7] 1874 	ld	c,(hl)
   919F 21 51 88      [10] 1875 	ld	hl, #_enemy + 1
   91A2 6E            [ 7] 1876 	ld	l,(hl)
   91A3 79            [ 4] 1877 	ld	a,c
   91A4 95            [ 4] 1878 	sub	a, l
   91A5 30 23         [12] 1879 	jr	NC,00119$
                           1880 ;src/main.c:506: if(enemy.y - (cu.y + G_KNIFEX_0_H - 2) >= 2){
   91A7 26 00         [ 7] 1881 	ld	h,#0x00
   91A9 06 00         [ 7] 1882 	ld	b,#0x00
   91AB 03            [ 6] 1883 	inc	bc
   91AC 03            [ 6] 1884 	inc	bc
   91AD BF            [ 4] 1885 	cp	a, a
   91AE ED 42         [15] 1886 	sbc	hl, bc
   91B0 11 02 80      [10] 1887 	ld	de, #0x8002
   91B3 29            [11] 1888 	add	hl, hl
   91B4 3F            [ 4] 1889 	ccf
   91B5 CB 1C         [ 8] 1890 	rr	h
   91B7 CB 1D         [ 8] 1891 	rr	l
   91B9 ED 52         [15] 1892 	sbc	hl, de
   91BB 38 04         [12] 1893 	jr	C,00116$
                           1894 ;src/main.c:507: colisiona = 0;
   91BD 0E 00         [ 7] 1895 	ld	c,#0x00
   91BF 18 0B         [12] 1896 	jr	00125$
   91C1                    1897 00116$:
                           1898 ;src/main.c:509: colisiona = 1;
   91C1 0E 01         [ 7] 1899 	ld	c,#0x01
                           1900 ;src/main.c:510: enemy.muerto = SI;
   91C3 21 58 88      [10] 1901 	ld	hl,#(_enemy + 0x0008)
   91C6 36 01         [10] 1902 	ld	(hl),#0x01
   91C8 18 02         [12] 1903 	jr	00125$
   91CA                    1904 00119$:
                           1905 ;src/main.c:513: colisiona = 0;	
   91CA 0E 00         [ 7] 1906 	ld	c,#0x00
                           1907 ;src/main.c:516: }
   91CC                    1908 00125$:
                           1909 ;src/main.c:517: return colisiona;
   91CC 69            [ 4] 1910 	ld	l,c
   91CD DD E1         [14] 1911 	pop	ix
   91CF C9            [10] 1912 	ret
                           1913 ;src/main.c:520: void moverCuchillo(){
                           1914 ;	---------------------------------
                           1915 ; Function moverCuchillo
                           1916 ; ---------------------------------
   91D0                    1917 _moverCuchillo::
                           1918 ;src/main.c:522: if(cu.lanzado){
   91D0 01 61 88      [10] 1919 	ld	bc,#_cu+0
   91D3 3A 67 88      [13] 1920 	ld	a, (#_cu + 6)
   91D6 B7            [ 4] 1921 	or	a, a
   91D7 C8            [11] 1922 	ret	Z
                           1923 ;src/main.c:523: cu.mover = 1;
   91D8 21 6A 88      [10] 1924 	ld	hl,#(_cu + 0x0009)
   91DB 36 01         [10] 1925 	ld	(hl),#0x01
                           1926 ;src/main.c:524: if(cu.direccion == M_derecha){
   91DD 21 68 88      [10] 1927 	ld	hl, #_cu + 7
   91E0 6E            [ 7] 1928 	ld	l,(hl)
                           1929 ;src/main.c:526: if( *getTilePtr(cu.x + G_KNIFEX_0_W + 1, cu.y) <= 2){
   91E1 59            [ 4] 1930 	ld	e, c
   91E2 50            [ 4] 1931 	ld	d, b
   91E3 13            [ 6] 1932 	inc	de
                           1933 ;src/main.c:524: if(cu.direccion == M_derecha){
   91E4 7D            [ 4] 1934 	ld	a,l
   91E5 B7            [ 4] 1935 	or	a, a
   91E6 20 27         [12] 1936 	jr	NZ,00128$
                           1937 ;src/main.c:526: if( *getTilePtr(cu.x + G_KNIFEX_0_W + 1, cu.y) <= 2){
   91E8 1A            [ 7] 1938 	ld	a,(de)
   91E9 5F            [ 4] 1939 	ld	e,a
   91EA 0A            [ 7] 1940 	ld	a,(bc)
   91EB C6 05         [ 7] 1941 	add	a, #0x05
   91ED 6F            [ 4] 1942 	ld	l,a
   91EE C5            [11] 1943 	push	bc
   91EF 7B            [ 4] 1944 	ld	a,e
   91F0 F5            [11] 1945 	push	af
   91F1 33            [ 6] 1946 	inc	sp
   91F2 7D            [ 4] 1947 	ld	a,l
   91F3 F5            [11] 1948 	push	af
   91F4 33            [ 6] 1949 	inc	sp
   91F5 CD 5E 89      [17] 1950 	call	_getTilePtr
   91F8 F1            [10] 1951 	pop	af
   91F9 C1            [10] 1952 	pop	bc
   91FA 5E            [ 7] 1953 	ld	e,(hl)
   91FB 3E 02         [ 7] 1954 	ld	a,#0x02
   91FD 93            [ 4] 1955 	sub	a, e
   91FE 38 09         [12] 1956 	jr	C,00102$
                           1957 ;src/main.c:527: cu.x++;
   9200 0A            [ 7] 1958 	ld	a,(bc)
   9201 3C            [ 4] 1959 	inc	a
   9202 02            [ 7] 1960 	ld	(bc),a
                           1961 ;src/main.c:528: cu.mover = SI;
   9203 21 6A 88      [10] 1962 	ld	hl,#(_cu + 0x0009)
   9206 36 01         [10] 1963 	ld	(hl),#0x01
   9208 C9            [10] 1964 	ret
   9209                    1965 00102$:
                           1966 ;src/main.c:532: cu.mover=NO;
   9209 21 6A 88      [10] 1967 	ld	hl,#(_cu + 0x0009)
   920C 36 00         [10] 1968 	ld	(hl),#0x00
   920E C9            [10] 1969 	ret
   920F                    1970 00128$:
                           1971 ;src/main.c:535: else if(cu.direccion == M_izquierda){
   920F 7D            [ 4] 1972 	ld	a,l
   9210 3D            [ 4] 1973 	dec	a
   9211 20 26         [12] 1974 	jr	NZ,00125$
                           1975 ;src/main.c:536: if(*getTilePtr(cu.x - 1, cu.y) <= 2){
   9213 1A            [ 7] 1976 	ld	a,(de)
   9214 5F            [ 4] 1977 	ld	e,a
   9215 0A            [ 7] 1978 	ld	a,(bc)
   9216 57            [ 4] 1979 	ld	d,a
   9217 15            [ 4] 1980 	dec	d
   9218 C5            [11] 1981 	push	bc
   9219 7B            [ 4] 1982 	ld	a,e
   921A F5            [11] 1983 	push	af
   921B 33            [ 6] 1984 	inc	sp
   921C D5            [11] 1985 	push	de
   921D 33            [ 6] 1986 	inc	sp
   921E CD 5E 89      [17] 1987 	call	_getTilePtr
   9221 F1            [10] 1988 	pop	af
   9222 C1            [10] 1989 	pop	bc
   9223 5E            [ 7] 1990 	ld	e,(hl)
   9224 3E 02         [ 7] 1991 	ld	a,#0x02
   9226 93            [ 4] 1992 	sub	a, e
   9227 38 0A         [12] 1993 	jr	C,00105$
                           1994 ;src/main.c:537: cu.x--;
   9229 0A            [ 7] 1995 	ld	a,(bc)
   922A C6 FF         [ 7] 1996 	add	a,#0xFF
   922C 02            [ 7] 1997 	ld	(bc),a
                           1998 ;src/main.c:538: cu.mover = SI;
   922D 21 6A 88      [10] 1999 	ld	hl,#(_cu + 0x0009)
   9230 36 01         [10] 2000 	ld	(hl),#0x01
   9232 C9            [10] 2001 	ret
   9233                    2002 00105$:
                           2003 ;src/main.c:541: cu.mover=NO;
   9233 21 6A 88      [10] 2004 	ld	hl,#(_cu + 0x0009)
   9236 36 00         [10] 2005 	ld	(hl),#0x00
   9238 C9            [10] 2006 	ret
   9239                    2007 00125$:
                           2008 ;src/main.c:544: else if(cu.direccion == M_arriba){
   9239 7D            [ 4] 2009 	ld	a,l
   923A D6 02         [ 7] 2010 	sub	a, #0x02
   923C 20 3E         [12] 2011 	jr	NZ,00122$
                           2012 ;src/main.c:545: if(*getTilePtr(cu.x, cu.y - 2) <= 2){
   923E 1A            [ 7] 2013 	ld	a,(de)
   923F C6 FE         [ 7] 2014 	add	a,#0xFE
   9241 F5            [11] 2015 	push	af
   9242 0A            [ 7] 2016 	ld	a,(bc)
   9243 47            [ 4] 2017 	ld	b,a
   9244 F1            [10] 2018 	pop	af
   9245 D5            [11] 2019 	push	de
   9246 F5            [11] 2020 	push	af
   9247 33            [ 6] 2021 	inc	sp
   9248 C5            [11] 2022 	push	bc
   9249 33            [ 6] 2023 	inc	sp
   924A CD 5E 89      [17] 2024 	call	_getTilePtr
   924D F1            [10] 2025 	pop	af
   924E D1            [10] 2026 	pop	de
   924F 4E            [ 7] 2027 	ld	c,(hl)
   9250 3E 02         [ 7] 2028 	ld	a,#0x02
   9252 91            [ 4] 2029 	sub	a, c
   9253 38 21         [12] 2030 	jr	C,00111$
                           2031 ;src/main.c:546: if(!checkKnifeCollision(M_arriba)){
   9255 D5            [11] 2032 	push	de
   9256 21 02 00      [10] 2033 	ld	hl,#0x0002
   9259 E5            [11] 2034 	push	hl
   925A CD D2 90      [17] 2035 	call	_checkKnifeCollision
   925D F1            [10] 2036 	pop	af
   925E D1            [10] 2037 	pop	de
   925F 7D            [ 4] 2038 	ld	a,l
   9260 B7            [ 4] 2039 	or	a, a
   9261 20 0D         [12] 2040 	jr	NZ,00108$
                           2041 ;src/main.c:547: cu.y--;
   9263 1A            [ 7] 2042 	ld	a,(de)
   9264 C6 FF         [ 7] 2043 	add	a,#0xFF
   9266 12            [ 7] 2044 	ld	(de),a
                           2045 ;src/main.c:548: cu.y--;
   9267 C6 FF         [ 7] 2046 	add	a,#0xFF
   9269 12            [ 7] 2047 	ld	(de),a
                           2048 ;src/main.c:549: cu.mover = SI;
   926A 21 6A 88      [10] 2049 	ld	hl,#(_cu + 0x0009)
   926D 36 01         [10] 2050 	ld	(hl),#0x01
   926F C9            [10] 2051 	ret
   9270                    2052 00108$:
                           2053 ;src/main.c:552: cu.mover=NO;
   9270 21 6A 88      [10] 2054 	ld	hl,#(_cu + 0x0009)
   9273 36 00         [10] 2055 	ld	(hl),#0x00
   9275 C9            [10] 2056 	ret
   9276                    2057 00111$:
                           2058 ;src/main.c:555: cu.mover=NO;
   9276 21 6A 88      [10] 2059 	ld	hl,#(_cu + 0x0009)
   9279 36 00         [10] 2060 	ld	(hl),#0x00
   927B C9            [10] 2061 	ret
   927C                    2062 00122$:
                           2063 ;src/main.c:560: else if(cu.direccion == M_abajo){
   927C 7D            [ 4] 2064 	ld	a,l
   927D D6 03         [ 7] 2065 	sub	a, #0x03
   927F C0            [11] 2066 	ret	NZ
                           2067 ;src/main.c:561: if(*getTilePtr(cu.x, cu.y + G_KNIFEY_0_H + 2) <= 2){
   9280 1A            [ 7] 2068 	ld	a,(de)
   9281 C6 0A         [ 7] 2069 	add	a, #0x0A
   9283 F5            [11] 2070 	push	af
   9284 0A            [ 7] 2071 	ld	a,(bc)
   9285 47            [ 4] 2072 	ld	b,a
   9286 F1            [10] 2073 	pop	af
   9287 D5            [11] 2074 	push	de
   9288 F5            [11] 2075 	push	af
   9289 33            [ 6] 2076 	inc	sp
   928A C5            [11] 2077 	push	bc
   928B 33            [ 6] 2078 	inc	sp
   928C CD 5E 89      [17] 2079 	call	_getTilePtr
   928F F1            [10] 2080 	pop	af
   9290 D1            [10] 2081 	pop	de
   9291 4E            [ 7] 2082 	ld	c,(hl)
   9292 3E 02         [ 7] 2083 	ld	a,#0x02
   9294 91            [ 4] 2084 	sub	a, c
   9295 38 1F         [12] 2085 	jr	C,00117$
                           2086 ;src/main.c:562: if(!checkKnifeCollision(M_abajo)){
   9297 D5            [11] 2087 	push	de
   9298 21 03 00      [10] 2088 	ld	hl,#0x0003
   929B E5            [11] 2089 	push	hl
   929C CD D2 90      [17] 2090 	call	_checkKnifeCollision
   929F F1            [10] 2091 	pop	af
   92A0 D1            [10] 2092 	pop	de
   92A1 7D            [ 4] 2093 	ld	a,l
   92A2 B7            [ 4] 2094 	or	a, a
   92A3 20 0B         [12] 2095 	jr	NZ,00114$
                           2096 ;src/main.c:563: cu.y++;
   92A5 1A            [ 7] 2097 	ld	a,(de)
   92A6 3C            [ 4] 2098 	inc	a
   92A7 12            [ 7] 2099 	ld	(de),a
                           2100 ;src/main.c:564: cu.y++;
   92A8 3C            [ 4] 2101 	inc	a
   92A9 12            [ 7] 2102 	ld	(de),a
                           2103 ;src/main.c:565: cu.mover = SI;
   92AA 21 6A 88      [10] 2104 	ld	hl,#(_cu + 0x0009)
   92AD 36 01         [10] 2105 	ld	(hl),#0x01
   92AF C9            [10] 2106 	ret
   92B0                    2107 00114$:
                           2108 ;src/main.c:568: cu.mover=NO;					
   92B0 21 6A 88      [10] 2109 	ld	hl,#(_cu + 0x0009)
   92B3 36 00         [10] 2110 	ld	(hl),#0x00
   92B5 C9            [10] 2111 	ret
   92B6                    2112 00117$:
                           2113 ;src/main.c:571: cu.mover=NO;
   92B6 21 6A 88      [10] 2114 	ld	hl,#(_cu + 0x0009)
   92B9 36 00         [10] 2115 	ld	(hl),#0x00
   92BB C9            [10] 2116 	ret
                           2117 ;src/main.c:576: void barraPuntuacionInicial(){
                           2118 ;	---------------------------------
                           2119 ; Function barraPuntuacionInicial
                           2120 ; ---------------------------------
   92BC                    2121 _barraPuntuacionInicial::
                           2122 ;src/main.c:581: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 178); // 
   92BC 21 00 B2      [10] 2123 	ld	hl,#0xB200
   92BF E5            [11] 2124 	push	hl
   92C0 26 C0         [ 7] 2125 	ld	h, #0xC0
   92C2 E5            [11] 2126 	push	hl
   92C3 CD F3 87      [17] 2127 	call	_cpct_getScreenPtr
   92C6 4D            [ 4] 2128 	ld	c,l
   92C7 44            [ 4] 2129 	ld	b,h
                           2130 ;src/main.c:582: cpct_drawStringM0("SCORE", memptr, 1, 0);
   92C8 21 01 00      [10] 2131 	ld	hl,#0x0001
   92CB E5            [11] 2132 	push	hl
   92CC C5            [11] 2133 	push	bc
   92CD 21 64 93      [10] 2134 	ld	hl,#___str_1
   92D0 E5            [11] 2135 	push	hl
   92D1 CD 23 7C      [17] 2136 	call	_cpct_drawStringM0
   92D4 21 06 00      [10] 2137 	ld	hl,#6
   92D7 39            [11] 2138 	add	hl,sp
   92D8 F9            [ 6] 2139 	ld	sp,hl
                           2140 ;src/main.c:583: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 190); // puntuación inicial
   92D9 21 00 BE      [10] 2141 	ld	hl,#0xBE00
   92DC E5            [11] 2142 	push	hl
   92DD 26 C0         [ 7] 2143 	ld	h, #0xC0
   92DF E5            [11] 2144 	push	hl
   92E0 CD F3 87      [17] 2145 	call	_cpct_getScreenPtr
   92E3 4D            [ 4] 2146 	ld	c,l
   92E4 44            [ 4] 2147 	ld	b,h
                           2148 ;src/main.c:584: cpct_drawStringM0("00000", memptr, 15, 0);
   92E5 21 0F 00      [10] 2149 	ld	hl,#0x000F
   92E8 E5            [11] 2150 	push	hl
   92E9 C5            [11] 2151 	push	bc
   92EA 21 6A 93      [10] 2152 	ld	hl,#___str_2
   92ED E5            [11] 2153 	push	hl
   92EE CD 23 7C      [17] 2154 	call	_cpct_drawStringM0
   92F1 21 06 00      [10] 2155 	ld	hl,#6
   92F4 39            [11] 2156 	add	hl,sp
   92F5 F9            [ 6] 2157 	ld	sp,hl
                           2158 ;src/main.c:587: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 190);
   92F6 21 1A BE      [10] 2159 	ld	hl,#0xBE1A
   92F9 E5            [11] 2160 	push	hl
   92FA 21 00 C0      [10] 2161 	ld	hl,#0xC000
   92FD E5            [11] 2162 	push	hl
   92FE CD F3 87      [17] 2163 	call	_cpct_getScreenPtr
   9301 4D            [ 4] 2164 	ld	c,l
   9302 44            [ 4] 2165 	ld	b,h
                           2166 ;src/main.c:588: cpct_drawStringM0("ROBOBIT", memptr, 3, 0);
   9303 21 03 00      [10] 2167 	ld	hl,#0x0003
   9306 E5            [11] 2168 	push	hl
   9307 C5            [11] 2169 	push	bc
   9308 21 70 93      [10] 2170 	ld	hl,#___str_3
   930B E5            [11] 2171 	push	hl
   930C CD 23 7C      [17] 2172 	call	_cpct_drawStringM0
   930F 21 06 00      [10] 2173 	ld	hl,#6
   9312 39            [11] 2174 	add	hl,sp
   9313 F9            [ 6] 2175 	ld	sp,hl
                           2176 ;src/main.c:590: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 178); // 
   9314 21 3C B2      [10] 2177 	ld	hl,#0xB23C
   9317 E5            [11] 2178 	push	hl
   9318 21 00 C0      [10] 2179 	ld	hl,#0xC000
   931B E5            [11] 2180 	push	hl
   931C CD F3 87      [17] 2181 	call	_cpct_getScreenPtr
   931F 4D            [ 4] 2182 	ld	c,l
   9320 44            [ 4] 2183 	ld	b,h
                           2184 ;src/main.c:591: cpct_drawStringM0("LIVES", memptr, 1, 0);
   9321 21 01 00      [10] 2185 	ld	hl,#0x0001
   9324 E5            [11] 2186 	push	hl
   9325 C5            [11] 2187 	push	bc
   9326 21 78 93      [10] 2188 	ld	hl,#___str_4
   9329 E5            [11] 2189 	push	hl
   932A CD 23 7C      [17] 2190 	call	_cpct_drawStringM0
   932D 21 06 00      [10] 2191 	ld	hl,#6
   9330 39            [11] 2192 	add	hl,sp
   9331 F9            [ 6] 2193 	ld	sp,hl
                           2194 ;src/main.c:593: for(i=0; i<5; i++){
   9332 01 00 00      [10] 2195 	ld	bc,#0x0000
   9335                    2196 00102$:
                           2197 ;src/main.c:594: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 190); // dibuja 5 corazones
   9335 79            [ 4] 2198 	ld	a,c
   9336 87            [ 4] 2199 	add	a, a
   9337 87            [ 4] 2200 	add	a, a
   9338 C6 3C         [ 7] 2201 	add	a, #0x3C
   933A 57            [ 4] 2202 	ld	d,a
   933B C5            [11] 2203 	push	bc
   933C 3E BE         [ 7] 2204 	ld	a,#0xBE
   933E F5            [11] 2205 	push	af
   933F 33            [ 6] 2206 	inc	sp
   9340 D5            [11] 2207 	push	de
   9341 33            [ 6] 2208 	inc	sp
   9342 21 00 C0      [10] 2209 	ld	hl,#0xC000
   9345 E5            [11] 2210 	push	hl
   9346 CD F3 87      [17] 2211 	call	_cpct_getScreenPtr
   9349 EB            [ 4] 2212 	ex	de,hl
   934A 21 03 06      [10] 2213 	ld	hl,#0x0603
   934D E5            [11] 2214 	push	hl
   934E D5            [11] 2215 	push	de
   934F 21 08 78      [10] 2216 	ld	hl,#_g_heart
   9352 E5            [11] 2217 	push	hl
   9353 CD 47 7C      [17] 2218 	call	_cpct_drawSprite
   9356 C1            [10] 2219 	pop	bc
                           2220 ;src/main.c:593: for(i=0; i<5; i++){
   9357 03            [ 6] 2221 	inc	bc
   9358 79            [ 4] 2222 	ld	a,c
   9359 D6 05         [ 7] 2223 	sub	a, #0x05
   935B 78            [ 4] 2224 	ld	a,b
   935C 17            [ 4] 2225 	rla
   935D 3F            [ 4] 2226 	ccf
   935E 1F            [ 4] 2227 	rra
   935F DE 80         [ 7] 2228 	sbc	a, #0x80
   9361 38 D2         [12] 2229 	jr	C,00102$
   9363 C9            [10] 2230 	ret
   9364                    2231 ___str_1:
   9364 53 43 4F 52 45     2232 	.ascii "SCORE"
   9369 00                 2233 	.db 0x00
   936A                    2234 ___str_2:
   936A 30 30 30 30 30     2235 	.ascii "00000"
   936F 00                 2236 	.db 0x00
   9370                    2237 ___str_3:
   9370 52 4F 42 4F 42 49  2238 	.ascii "ROBOBIT"
        54
   9377 00                 2239 	.db 0x00
   9378                    2240 ___str_4:
   9378 4C 49 56 45 53     2241 	.ascii "LIVES"
   937D 00                 2242 	.db 0x00
                           2243 ;src/main.c:599: void borrarPantallaAbajo(){
                           2244 ;	---------------------------------
                           2245 ; Function borrarPantallaAbajo
                           2246 ; ---------------------------------
   937E                    2247 _borrarPantallaAbajo::
                           2248 ;src/main.c:601: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 176); // posición para borrar 
   937E 21 00 B0      [10] 2249 	ld	hl,#0xB000
   9381 E5            [11] 2250 	push	hl
   9382 26 C0         [ 7] 2251 	ld	h, #0xC0
   9384 E5            [11] 2252 	push	hl
   9385 CD F3 87      [17] 2253 	call	_cpct_getScreenPtr
   9388 4D            [ 4] 2254 	ld	c,l
   9389 44            [ 4] 2255 	ld	b,h
                           2256 ;src/main.c:602: cpct_drawSolidBox(memptr, 0, 40, 7);  //borra la mitad derecha
   938A 21 28 07      [10] 2257 	ld	hl,#0x0728
   938D E5            [11] 2258 	push	hl
   938E AF            [ 4] 2259 	xor	a, a
   938F F5            [11] 2260 	push	af
   9390 33            [ 6] 2261 	inc	sp
   9391 C5            [11] 2262 	push	bc
   9392 CD 19 87      [17] 2263 	call	_cpct_drawSolidBox
   9395 F1            [10] 2264 	pop	af
                           2265 ;src/main.c:603: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 40, 176); // posición para borrar 
   9396 33            [ 6] 2266 	inc	sp
   9397 21 28 B0      [10] 2267 	ld	hl,#0xB028
   939A E3            [19] 2268 	ex	(sp),hl
   939B 21 00 C0      [10] 2269 	ld	hl,#0xC000
   939E E5            [11] 2270 	push	hl
   939F CD F3 87      [17] 2271 	call	_cpct_getScreenPtr
   93A2 4D            [ 4] 2272 	ld	c,l
   93A3 44            [ 4] 2273 	ld	b,h
                           2274 ;src/main.c:604: cpct_drawSolidBox(memptr, 0, 40, 7);  //borra la mitad izquierda
   93A4 21 28 07      [10] 2275 	ld	hl,#0x0728
   93A7 E5            [11] 2276 	push	hl
   93A8 AF            [ 4] 2277 	xor	a, a
   93A9 F5            [11] 2278 	push	af
   93AA 33            [ 6] 2279 	inc	sp
   93AB C5            [11] 2280 	push	bc
   93AC CD 19 87      [17] 2281 	call	_cpct_drawSolidBox
   93AF F1            [10] 2282 	pop	af
   93B0 F1            [10] 2283 	pop	af
   93B1 33            [ 6] 2284 	inc	sp
   93B2 C9            [10] 2285 	ret
                           2286 ;src/main.c:607: void menuInicio(){
                           2287 ;	---------------------------------
                           2288 ; Function menuInicio
                           2289 ; ---------------------------------
   93B3                    2290 _menuInicio::
                           2291 ;src/main.c:611: cpct_clearScreen(0);
   93B3 21 00 40      [10] 2292 	ld	hl,#0x4000
   93B6 E5            [11] 2293 	push	hl
   93B7 AF            [ 4] 2294 	xor	a, a
   93B8 F5            [11] 2295 	push	af
   93B9 33            [ 6] 2296 	inc	sp
   93BA 26 C0         [ 7] 2297 	ld	h, #0xC0
   93BC E5            [11] 2298 	push	hl
   93BD CD D2 7E      [17] 2299 	call	_cpct_memset
                           2300 ;src/main.c:613: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   93C0 21 1A 0F      [10] 2301 	ld	hl,#0x0F1A
   93C3 E5            [11] 2302 	push	hl
   93C4 21 00 C0      [10] 2303 	ld	hl,#0xC000
   93C7 E5            [11] 2304 	push	hl
   93C8 CD F3 87      [17] 2305 	call	_cpct_getScreenPtr
   93CB 4D            [ 4] 2306 	ld	c,l
   93CC 44            [ 4] 2307 	ld	b,h
                           2308 ;src/main.c:614: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   93CD 21 04 00      [10] 2309 	ld	hl,#0x0004
   93D0 E5            [11] 2310 	push	hl
   93D1 C5            [11] 2311 	push	bc
   93D2 21 66 94      [10] 2312 	ld	hl,#___str_5
   93D5 E5            [11] 2313 	push	hl
   93D6 CD 23 7C      [17] 2314 	call	_cpct_drawStringM0
   93D9 21 06 00      [10] 2315 	ld	hl,#6
   93DC 39            [11] 2316 	add	hl,sp
   93DD F9            [ 6] 2317 	ld	sp,hl
                           2318 ;src/main.c:616: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   93DE 21 28 6E      [10] 2319 	ld	hl,#0x6E28
   93E1 E5            [11] 2320 	push	hl
   93E2 21 F0 F0      [10] 2321 	ld	hl,#0xF0F0
   93E5 E5            [11] 2322 	push	hl
   93E6 21 A8 55      [10] 2323 	ld	hl,#_g_text_0
   93E9 E5            [11] 2324 	push	hl
   93EA CD 47 7C      [17] 2325 	call	_cpct_drawSprite
                           2326 ;src/main.c:617: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   93ED 21 28 6E      [10] 2327 	ld	hl,#0x6E28
   93F0 E5            [11] 2328 	push	hl
   93F1 21 18 F1      [10] 2329 	ld	hl,#0xF118
   93F4 E5            [11] 2330 	push	hl
   93F5 21 D8 66      [10] 2331 	ld	hl,#_g_text_1
   93F8 E5            [11] 2332 	push	hl
   93F9 CD 47 7C      [17] 2333 	call	_cpct_drawSprite
                           2334 ;src/main.c:644: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   93FC 21 08 A0      [10] 2335 	ld	hl,#0xA008
   93FF E5            [11] 2336 	push	hl
   9400 21 00 C0      [10] 2337 	ld	hl,#0xC000
   9403 E5            [11] 2338 	push	hl
   9404 CD F3 87      [17] 2339 	call	_cpct_getScreenPtr
   9407 4D            [ 4] 2340 	ld	c,l
   9408 44            [ 4] 2341 	ld	b,h
                           2342 ;src/main.c:645: cpct_drawStringM0("TO START PRESS S", memptr, 4, 0);
   9409 21 04 00      [10] 2343 	ld	hl,#0x0004
   940C E5            [11] 2344 	push	hl
   940D C5            [11] 2345 	push	bc
   940E 21 6E 94      [10] 2346 	ld	hl,#___str_6
   9411 E5            [11] 2347 	push	hl
   9412 CD 23 7C      [17] 2348 	call	_cpct_drawStringM0
   9415 21 06 00      [10] 2349 	ld	hl,#6
   9418 39            [11] 2350 	add	hl,sp
   9419 F9            [ 6] 2351 	ld	sp,hl
                           2352 ;src/main.c:647: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 170); // centrado en horizontal y abajo en vertical
   941A 21 0A AA      [10] 2353 	ld	hl,#0xAA0A
   941D E5            [11] 2354 	push	hl
   941E 21 00 C0      [10] 2355 	ld	hl,#0xC000
   9421 E5            [11] 2356 	push	hl
   9422 CD F3 87      [17] 2357 	call	_cpct_getScreenPtr
   9425 4D            [ 4] 2358 	ld	c,l
   9426 44            [ 4] 2359 	ld	b,h
                           2360 ;src/main.c:648: cpct_drawStringM0("TO MENU PRESS M", memptr, 4, 0);
   9427 21 04 00      [10] 2361 	ld	hl,#0x0004
   942A E5            [11] 2362 	push	hl
   942B C5            [11] 2363 	push	bc
   942C 21 7F 94      [10] 2364 	ld	hl,#___str_7
   942F E5            [11] 2365 	push	hl
   9430 CD 23 7C      [17] 2366 	call	_cpct_drawStringM0
   9433 21 06 00      [10] 2367 	ld	hl,#6
   9436 39            [11] 2368 	add	hl,sp
   9437 F9            [ 6] 2369 	ld	sp,hl
                           2370 ;src/main.c:651: do{
   9438                    2371 00106$:
                           2372 ;src/main.c:652: cpct_scanKeyboard_f();   	
   9438 CD AD 7B      [17] 2373 	call	_cpct_scanKeyboard_f
                           2374 ;src/main.c:656: else */if(cpct_isKeyPressed(Key_M)){
   943B 21 04 40      [10] 2375 	ld	hl,#0x4004
   943E CD A1 7B      [17] 2376 	call	_cpct_isKeyPressed
   9441 7D            [ 4] 2377 	ld	a,l
   9442 B7            [ 4] 2378 	or	a, a
   9443 28 0D         [12] 2379 	jr	Z,00107$
                           2380 ;src/main.c:657: cpct_scanKeyboard_f(); 
   9445 CD AD 7B      [17] 2381 	call	_cpct_scanKeyboard_f
                           2382 ;src/main.c:658: do{
   9448                    2383 00101$:
                           2384 ;src/main.c:660: } while(!cpct_isKeyPressed(Key_S));
   9448 21 07 10      [10] 2385 	ld	hl,#0x1007
   944B CD A1 7B      [17] 2386 	call	_cpct_isKeyPressed
   944E 7D            [ 4] 2387 	ld	a,l
   944F B7            [ 4] 2388 	or	a, a
   9450 28 F6         [12] 2389 	jr	Z,00101$
   9452                    2390 00107$:
                           2391 ;src/main.c:662: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   9452 21 07 10      [10] 2392 	ld	hl,#0x1007
   9455 CD A1 7B      [17] 2393 	call	_cpct_isKeyPressed
   9458 7D            [ 4] 2394 	ld	a,l
   9459 B7            [ 4] 2395 	or	a, a
   945A C0            [11] 2396 	ret	NZ
   945B 21 04 40      [10] 2397 	ld	hl,#0x4004
   945E CD A1 7B      [17] 2398 	call	_cpct_isKeyPressed
   9461 7D            [ 4] 2399 	ld	a,l
   9462 B7            [ 4] 2400 	or	a, a
   9463 28 D3         [12] 2401 	jr	Z,00106$
   9465 C9            [10] 2402 	ret
   9466                    2403 ___str_5:
   9466 52 4F 42 4F 42 49  2404 	.ascii "ROBOBIT"
        54
   946D 00                 2405 	.db 0x00
   946E                    2406 ___str_6:
   946E 54 4F 20 53 54 41  2407 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   947E 00                 2408 	.db 0x00
   947F                    2409 ___str_7:
   947F 54 4F 20 4D 45 4E  2410 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   948E 00                 2411 	.db 0x00
                           2412 ;src/main.c:665: void inicializarCPC() {
                           2413 ;	---------------------------------
                           2414 ; Function inicializarCPC
                           2415 ; ---------------------------------
   948F                    2416 _inicializarCPC::
                           2417 ;src/main.c:666: cpct_disableFirmware();
   948F CD 09 87      [17] 2418 	call	_cpct_disableFirmware
                           2419 ;src/main.c:667: cpct_setVideoMode(0);
   9492 2E 00         [ 7] 2420 	ld	l,#0x00
   9494 CD B4 7E      [17] 2421 	call	_cpct_setVideoMode
                           2422 ;src/main.c:668: cpct_setBorder(HW_BLACK);
   9497 21 10 14      [10] 2423 	ld	hl,#0x1410
   949A E5            [11] 2424 	push	hl
   949B CD 17 7C      [17] 2425 	call	_cpct_setPALColour
                           2426 ;src/main.c:669: cpct_setPalette(g_palette, 16);
   949E 21 10 00      [10] 2427 	ld	hl,#0x0010
   94A1 E5            [11] 2428 	push	hl
   94A2 21 40 7A      [10] 2429 	ld	hl,#_g_palette
   94A5 E5            [11] 2430 	push	hl
   94A6 CD 8A 7B      [17] 2431 	call	_cpct_setPalette
                           2432 ;src/main.c:670: cpct_akp_musicInit(G_song);
   94A9 21 00 3F      [10] 2433 	ld	hl,#_G_song
   94AC E5            [11] 2434 	push	hl
   94AD CD E5 85      [17] 2435 	call	_cpct_akp_musicInit
   94B0 F1            [10] 2436 	pop	af
   94B1 C9            [10] 2437 	ret
                           2438 ;src/main.c:673: void inicializarJuego() {
                           2439 ;	---------------------------------
                           2440 ; Function inicializarJuego
                           2441 ; ---------------------------------
   94B2                    2442 _inicializarJuego::
                           2443 ;src/main.c:675: num_mapa = 0;
   94B2 21 6D 88      [10] 2444 	ld	hl,#_num_mapa + 0
   94B5 36 00         [10] 2445 	ld	(hl), #0x00
                           2446 ;src/main.c:676: mapa = mapas[num_mapa];
   94B7 21 84 88      [10] 2447 	ld	hl, #_mapas + 0
   94BA 7E            [ 7] 2448 	ld	a,(hl)
   94BB FD 21 6B 88   [14] 2449 	ld	iy,#_mapa
   94BF FD 77 00      [19] 2450 	ld	0 (iy),a
   94C2 23            [ 6] 2451 	inc	hl
   94C3 7E            [ 7] 2452 	ld	a,(hl)
   94C4 32 6C 88      [13] 2453 	ld	(#_mapa + 1),a
                           2454 ;src/main.c:677: cpct_etm_setTileset2x4(g_tileset);
   94C7 21 E0 54      [10] 2455 	ld	hl,#_g_tileset
   94CA CD 7B 7D      [17] 2456 	call	_cpct_etm_setTileset2x4
                           2457 ;src/main.c:678: dibujarMapa();
   94CD CD 6E 88      [17] 2458 	call	_dibujarMapa
                           2459 ;src/main.c:679: borrarPantallaAbajo();
   94D0 CD 7E 93      [17] 2460 	call	_borrarPantallaAbajo
                           2461 ;src/main.c:680: barraPuntuacionInicial();
   94D3 CD BC 92      [17] 2462 	call	_barraPuntuacionInicial
                           2463 ;src/main.c:683: prota.x = prota.px = 4;
   94D6 21 5B 88      [10] 2464 	ld	hl,#(_prota + 0x0002)
   94D9 36 04         [10] 2465 	ld	(hl),#0x04
   94DB 21 59 88      [10] 2466 	ld	hl,#_prota
   94DE 36 04         [10] 2467 	ld	(hl),#0x04
                           2468 ;src/main.c:684: prota.y = prota.py = 80;
   94E0 21 5C 88      [10] 2469 	ld	hl,#(_prota + 0x0003)
   94E3 36 50         [10] 2470 	ld	(hl),#0x50
   94E5 21 5A 88      [10] 2471 	ld	hl,#(_prota + 0x0001)
   94E8 36 50         [10] 2472 	ld	(hl),#0x50
                           2473 ;src/main.c:685: prota.mover  = NO;
   94EA 21 5F 88      [10] 2474 	ld	hl,#(_prota + 0x0006)
   94ED 36 00         [10] 2475 	ld	(hl),#0x00
                           2476 ;src/main.c:686: prota.mira=M_derecha;
   94EF 21 60 88      [10] 2477 	ld	hl,#(_prota + 0x0007)
   94F2 36 00         [10] 2478 	ld	(hl),#0x00
                           2479 ;src/main.c:687: prota.sprite = g_hero;
   94F4 21 50 7A      [10] 2480 	ld	hl,#_g_hero
   94F7 22 5D 88      [16] 2481 	ld	((_prota + 0x0004)), hl
                           2482 ;src/main.c:689: enemy.x = enemy.px = 71;
   94FA 21 52 88      [10] 2483 	ld	hl,#(_enemy + 0x0002)
   94FD 36 47         [10] 2484 	ld	(hl),#0x47
   94FF 21 50 88      [10] 2485 	ld	hl,#_enemy
   9502 36 47         [10] 2486 	ld	(hl),#0x47
                           2487 ;src/main.c:690: enemy.y = enemy.py = 84;
   9504 21 53 88      [10] 2488 	ld	hl,#(_enemy + 0x0003)
   9507 36 54         [10] 2489 	ld	(hl),#0x54
   9509 21 51 88      [10] 2490 	ld	hl,#(_enemy + 0x0001)
   950C 36 54         [10] 2491 	ld	(hl),#0x54
                           2492 ;src/main.c:691: enemy.mover  = NO;
   950E 21 56 88      [10] 2493 	ld	hl,#(_enemy + 0x0006)
   9511 36 00         [10] 2494 	ld	(hl),#0x00
                           2495 ;src/main.c:692: enemy.mira=M_abajo;
   9513 21 57 88      [10] 2496 	ld	hl,#(_enemy + 0x0007)
   9516 36 03         [10] 2497 	ld	(hl),#0x03
                           2498 ;src/main.c:693: enemy.sprite = g_enemy;
   9518 21 1A 78      [10] 2499 	ld	hl,#_g_enemy
   951B 22 54 88      [16] 2500 	ld	((_enemy + 0x0004)), hl
                           2501 ;src/main.c:694: enemy.muerto = NO;
   951E 21 58 88      [10] 2502 	ld	hl,#(_enemy + 0x0008)
   9521 36 00         [10] 2503 	ld	(hl),#0x00
                           2504 ;src/main.c:696: cu.x = cu.px = 0;
   9523 21 63 88      [10] 2505 	ld	hl,#(_cu + 0x0002)
   9526 36 00         [10] 2506 	ld	(hl),#0x00
   9528 21 61 88      [10] 2507 	ld	hl,#_cu
   952B 36 00         [10] 2508 	ld	(hl),#0x00
                           2509 ;src/main.c:697: cu.y = cu.py = 0;
   952D 21 64 88      [10] 2510 	ld	hl,#(_cu + 0x0003)
   9530 36 00         [10] 2511 	ld	(hl),#0x00
   9532 21 62 88      [10] 2512 	ld	hl,#(_cu + 0x0001)
   9535 36 00         [10] 2513 	ld	(hl),#0x00
                           2514 ;src/main.c:698: cu.lanzado = NO;
   9537 21 67 88      [10] 2515 	ld	hl,#(_cu + 0x0006)
   953A 36 00         [10] 2516 	ld	(hl),#0x00
                           2517 ;src/main.c:699: cu.mover = NO;
   953C 21 6A 88      [10] 2518 	ld	hl,#(_cu + 0x0009)
   953F 36 00         [10] 2519 	ld	(hl),#0x00
                           2520 ;src/main.c:703: dibujarProta();
   9541 CD 8A 88      [17] 2521 	call	_dibujarProta
                           2522 ;src/main.c:704: dibujarEnemigo();
   9544 C3 DB 8A      [10] 2523 	jp  _dibujarEnemigo
                           2524 ;src/main.c:707: void main(void) {
                           2525 ;	---------------------------------
                           2526 ; Function main
                           2527 ; ---------------------------------
   9547                    2528 _main::
                           2529 ;src/main.c:709: inicializarCPC();
   9547 CD 8F 94      [17] 2530 	call	_inicializarCPC
                           2531 ;src/main.c:710: menuInicio();
   954A CD B3 93      [17] 2532 	call	_menuInicio
                           2533 ;src/main.c:712: inicializarJuego();
   954D CD B2 94      [17] 2534 	call	_inicializarJuego
                           2535 ;src/main.c:713: cpct_akp_musicPlay();
   9550 CD E2 7E      [17] 2536 	call	_cpct_akp_musicPlay
                           2537 ;src/main.c:715: while (1) {
   9553                    2538 00115$:
                           2539 ;src/main.c:717: comprobarTeclado();
   9553 CD 91 90      [17] 2540 	call	_comprobarTeclado
                           2541 ;src/main.c:718: moverCuchillo();
   9556 CD D0 91      [17] 2542 	call	_moverCuchillo
                           2543 ;src/main.c:719: moverEnemigo();
   9559 CD 5A 8D      [17] 2544 	call	_moverEnemigo
                           2545 ;src/main.c:721: cpct_waitVSYNC();
   955C CD AC 7E      [17] 2546 	call	_cpct_waitVSYNC
                           2547 ;src/main.c:723: if (prota.mover) {
   955F 01 5F 88      [10] 2548 	ld	bc,#_prota+6
   9562 0A            [ 7] 2549 	ld	a,(bc)
   9563 B7            [ 4] 2550 	or	a, a
   9564 28 07         [12] 2551 	jr	Z,00102$
                           2552 ;src/main.c:724: redibujarProta();
   9566 C5            [11] 2553 	push	bc
   9567 CD 4A 89      [17] 2554 	call	_redibujarProta
   956A C1            [10] 2555 	pop	bc
                           2556 ;src/main.c:725: prota.mover = NO;
   956B AF            [ 4] 2557 	xor	a, a
   956C 02            [ 7] 2558 	ld	(bc),a
   956D                    2559 00102$:
                           2560 ;src/main.c:727: if(cu.lanzado && cu.mover){
   956D 21 67 88      [10] 2561 	ld	hl,#_cu + 6
   9570 4E            [ 7] 2562 	ld	c,(hl)
   9571 11 6A 88      [10] 2563 	ld	de,#_cu + 9
   9574 79            [ 4] 2564 	ld	a,c
   9575 B7            [ 4] 2565 	or	a, a
   9576 28 09         [12] 2566 	jr	Z,00107$
   9578 1A            [ 7] 2567 	ld	a,(de)
   9579 B7            [ 4] 2568 	or	a, a
   957A 28 05         [12] 2569 	jr	Z,00107$
                           2570 ;src/main.c:728: redibujarCuchillo();
   957C CD 61 8F      [17] 2571 	call	_redibujarCuchillo
   957F 18 0B         [12] 2572 	jr	00108$
   9581                    2573 00107$:
                           2574 ;src/main.c:729: }else if (cu.lanzado && !cu.mover){
   9581 79            [ 4] 2575 	ld	a,c
   9582 B7            [ 4] 2576 	or	a, a
   9583 28 07         [12] 2577 	jr	Z,00108$
   9585 1A            [ 7] 2578 	ld	a,(de)
   9586 B7            [ 4] 2579 	or	a, a
   9587 20 03         [12] 2580 	jr	NZ,00108$
                           2581 ;src/main.c:730: borrarCuchillo();
   9589 CD F4 8E      [17] 2582 	call	_borrarCuchillo
   958C                    2583 00108$:
                           2584 ;src/main.c:733: if(enemy.mover){
   958C 3A 56 88      [13] 2585 	ld	a, (#_enemy + 6)
   958F B7            [ 4] 2586 	or	a, a
   9590 28 03         [12] 2587 	jr	Z,00111$
                           2588 ;src/main.c:734: redibujarEnemigo();
   9592 CD 69 8B      [17] 2589 	call	_redibujarEnemigo
   9595                    2590 00111$:
                           2591 ;src/main.c:736: if (enemy.muerto){
   9595 3A 58 88      [13] 2592 	ld	a, (#_enemy + 8)
   9598 B7            [ 4] 2593 	or	a, a
   9599 28 B8         [12] 2594 	jr	Z,00115$
                           2595 ;src/main.c:737: borrarEnemigo();
   959B CD 01 8B      [17] 2596 	call	_borrarEnemigo
   959E 18 B3         [12] 2597 	jr	00115$
                           2598 	.area _CODE
                           2599 	.area _INITIALIZER
                           2600 	.area _CABS (ABS)
   3F00                    2601 	.org 0x3F00
   3F00                    2602 _G_song:
   3F00 41                 2603 	.db #0x41	; 65	'A'
   3F01 54                 2604 	.db #0x54	; 84	'T'
   3F02 31                 2605 	.db #0x31	; 49	'1'
   3F03 30                 2606 	.db #0x30	; 48	'0'
   3F04 01                 2607 	.db #0x01	; 1
   3F05 40                 2608 	.db #0x40	; 64
   3F06 42                 2609 	.db #0x42	; 66	'B'
   3F07 0F                 2610 	.db #0x0F	; 15
   3F08 02                 2611 	.db #0x02	; 2
   3F09 06                 2612 	.db #0x06	; 6
   3F0A 1D                 2613 	.db #0x1D	; 29
   3F0B 00                 2614 	.db #0x00	; 0
   3F0C 10                 2615 	.db #0x10	; 16
   3F0D 40                 2616 	.db #0x40	; 64
   3F0E 19                 2617 	.db #0x19	; 25
   3F0F 40                 2618 	.db #0x40	; 64
   3F10 00                 2619 	.db #0x00	; 0
   3F11 00                 2620 	.db #0x00	; 0
   3F12 00                 2621 	.db #0x00	; 0
   3F13 00                 2622 	.db #0x00	; 0
   3F14 00                 2623 	.db #0x00	; 0
   3F15 00                 2624 	.db #0x00	; 0
   3F16 0D                 2625 	.db #0x0D	; 13
   3F17 12                 2626 	.db #0x12	; 18
   3F18 40                 2627 	.db #0x40	; 64
   3F19 01                 2628 	.db #0x01	; 1
   3F1A 00                 2629 	.db #0x00	; 0
   3F1B 7C                 2630 	.db #0x7C	; 124
   3F1C 18                 2631 	.db #0x18	; 24
   3F1D 78                 2632 	.db #0x78	; 120	'x'
   3F1E 0C                 2633 	.db #0x0C	; 12
   3F1F 34                 2634 	.db #0x34	; 52	'4'
   3F20 30                 2635 	.db #0x30	; 48	'0'
   3F21 2C                 2636 	.db #0x2C	; 44
   3F22 28                 2637 	.db #0x28	; 40
   3F23 24                 2638 	.db #0x24	; 36
   3F24 20                 2639 	.db #0x20	; 32
   3F25 1C                 2640 	.db #0x1C	; 28
   3F26 0D                 2641 	.db #0x0D	; 13
   3F27 25                 2642 	.db #0x25	; 37
   3F28 40                 2643 	.db #0x40	; 64
   3F29 20                 2644 	.db #0x20	; 32
   3F2A 00                 2645 	.db #0x00	; 0
   3F2B 00                 2646 	.db #0x00	; 0
   3F2C 00                 2647 	.db #0x00	; 0
   3F2D 39                 2648 	.db #0x39	; 57	'9'
   3F2E 40                 2649 	.db #0x40	; 64
   3F2F 00                 2650 	.db #0x00	; 0
   3F30 57                 2651 	.db #0x57	; 87	'W'
   3F31 40                 2652 	.db #0x40	; 64
   3F32 3B                 2653 	.db #0x3B	; 59
   3F33 40                 2654 	.db #0x40	; 64
   3F34 57                 2655 	.db #0x57	; 87	'W'
   3F35 40                 2656 	.db #0x40	; 64
   3F36 01                 2657 	.db #0x01	; 1
   3F37 2F                 2658 	.db #0x2F	; 47
   3F38 40                 2659 	.db #0x40	; 64
   3F39 19                 2660 	.db #0x19	; 25
   3F3A 00                 2661 	.db #0x00	; 0
   3F3B 76                 2662 	.db #0x76	; 118	'v'
   3F3C E1                 2663 	.db #0xE1	; 225
   3F3D 00                 2664 	.db #0x00	; 0
   3F3E 00                 2665 	.db #0x00	; 0
   3F3F 01                 2666 	.db #0x01	; 1
   3F40 04                 2667 	.db #0x04	; 4
   3F41 51                 2668 	.db #0x51	; 81	'Q'
   3F42 04                 2669 	.db #0x04	; 4
   3F43 37                 2670 	.db #0x37	; 55	'7'
   3F44 04                 2671 	.db #0x04	; 4
   3F45 4F                 2672 	.db #0x4F	; 79	'O'
   3F46 04                 2673 	.db #0x04	; 4
   3F47 37                 2674 	.db #0x37	; 55	'7'
   3F48 02                 2675 	.db #0x02	; 2
   3F49 4B                 2676 	.db #0x4B	; 75	'K'
   3F4A 02                 2677 	.db #0x02	; 2
   3F4B 37                 2678 	.db #0x37	; 55	'7'
   3F4C 04                 2679 	.db #0x04	; 4
   3F4D 4F                 2680 	.db #0x4F	; 79	'O'
   3F4E 04                 2681 	.db #0x04	; 4
   3F4F 37                 2682 	.db #0x37	; 55	'7'
   3F50 04                 2683 	.db #0x04	; 4
   3F51 4F                 2684 	.db #0x4F	; 79	'O'
   3F52 04                 2685 	.db #0x04	; 4
   3F53 37                 2686 	.db #0x37	; 55	'7'
   3F54 02                 2687 	.db #0x02	; 2
   3F55 4B                 2688 	.db #0x4B	; 75	'K'
   3F56 00                 2689 	.db #0x00	; 0
   3F57 42                 2690 	.db #0x42	; 66	'B'
   3F58 60                 2691 	.db #0x60	; 96
   3F59 00                 2692 	.db #0x00	; 0
   3F5A 42                 2693 	.db #0x42	; 66	'B'
   3F5B 80                 2694 	.db #0x80	; 128
   3F5C 00                 2695 	.db #0x00	; 0
   3F5D 00                 2696 	.db #0x00	; 0
   3F5E 42                 2697 	.db #0x42	; 66	'B'
   3F5F 00                 2698 	.db #0x00	; 0
   3F60 00                 2699 	.db #0x00	; 0
