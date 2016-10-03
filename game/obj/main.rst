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
                             13 	.globl _inicializar
                             14 	.globl _moverCuchillo
                             15 	.globl _comprobarTeclado
                             16 	.globl _lanzarCuchillo
                             17 	.globl _redibujarCuchillo
                             18 	.globl _borrarCuchillo
                             19 	.globl _dibujarCuchillo
                             20 	.globl _moverAbajo
                             21 	.globl _moverArriba
                             22 	.globl _moverDerecha
                             23 	.globl _moverIzquierda
                             24 	.globl _avanzarMapa
                             25 	.globl _checkCollision
                             26 	.globl _getTilePtr
                             27 	.globl _redibujarProta
                             28 	.globl _borrarProta
                             29 	.globl _dibujarProta
                             30 	.globl _dibujarMapa
                             31 	.globl _cpct_etm_setTileset2x4
                             32 	.globl _cpct_etm_drawTileBox2x4
                             33 	.globl _cpct_akp_musicPlay
                             34 	.globl _cpct_akp_musicInit
                             35 	.globl _cpct_getScreenPtr
                             36 	.globl _cpct_setPalette
                             37 	.globl _cpct_waitVSYNC
                             38 	.globl _cpct_setVideoMode
                             39 	.globl _cpct_drawSpriteMaskedAlignedTable
                             40 	.globl _cpct_isAnyKeyPressed
                             41 	.globl _cpct_isKeyPressed
                             42 	.globl _cpct_scanKeyboard_if
                             43 	.globl _cpct_disableFirmware
                             44 	.globl _num_mapa
                             45 	.globl _mapa
                             46 	.globl _cu
                             47 	.globl _prota
                             48 	.globl _EEje
                             49 	.globl _EMirar
                             50 	.globl _mapas
                             51 ;--------------------------------------------------------
                             52 ; special function registers
                             53 ;--------------------------------------------------------
                             54 ;--------------------------------------------------------
                             55 ; ram data
                             56 ;--------------------------------------------------------
                             57 	.area _DATA
   60FE                      58 _EMirar::
   60FE                      59 	.ds 1
   60FF                      60 _EEje::
   60FF                      61 	.ds 1
   6100                      62 _prota::
   6100                      63 	.ds 8
   6108                      64 _cu::
   6108                      65 	.ds 90
   6162                      66 _mapa::
   6162                      67 	.ds 2
   6164                      68 _num_mapa::
   6164                      69 	.ds 1
                             70 ;--------------------------------------------------------
                             71 ; ram data
                             72 ;--------------------------------------------------------
                             73 	.area _INITIALIZED
                             74 ;--------------------------------------------------------
                             75 ; absolute external ram data
                             76 ;--------------------------------------------------------
                             77 	.area _DABS (ABS)
                             78 ;--------------------------------------------------------
                             79 ; global & static initialisations
                             80 ;--------------------------------------------------------
                             81 	.area _HOME
                             82 	.area _GSINIT
                             83 	.area _GSFINAL
                             84 	.area _GSINIT
                             85 ;--------------------------------------------------------
                             86 ; Home
                             87 ;--------------------------------------------------------
                             88 	.area _HOME
                             89 	.area _HOME
                             90 ;--------------------------------------------------------
                             91 ; code
                             92 ;--------------------------------------------------------
                             93 	.area _CODE
                             94 ;src/main.c:96: cpctm_createTransparentMaskTable(g_tablatrans, 0x3E00, M0, 0); // es el color 8 - 4D - FF00FF
                             95 ;	---------------------------------
                             96 ; Function dummy_cpct_transparentMaskTable0M0_container
                             97 ; ---------------------------------
   568C                      98 _dummy_cpct_transparentMaskTable0M0_container::
                             99 	.area _g_tablatrans_ (ABS) 
   3E00                     100 	.org 0x3E00 
   3E00                     101 	 _g_tablatrans::
   3E00 FF AA 55 00 AA AA   102 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E08 55 00 55 00 00 00   103 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E10 AA AA 00 00 AA AA   104 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E18 00 00 00 00 00 00   105 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E20 55 00 55 00 00 00   106 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E28 55 00 55 00 00 00   107 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E30 00 00 00 00 00 00   108 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E38 00 00 00 00 00 00   109 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E40 AA AA 00 00 AA AA   110 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E48 00 00 00 00 00 00   111 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E50 AA AA 00 00 AA AA   112 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3E58 00 00 00 00 00 00   113 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E60 00 00 00 00 00 00   114 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E68 00 00 00 00 00 00   115 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E70 00 00 00 00 00 00   116 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E78 00 00 00 00 00 00   117 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E80 55 00 55 00 00 00   118 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E88 55 00 55 00 00 00   119 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E90 00 00 00 00 00 00   120 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3E98 00 00 00 00 00 00   121 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA0 55 00 55 00 00 00   122 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EA8 55 00 55 00 00 00   123 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB0 00 00 00 00 00 00   124 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EB8 00 00 00 00 00 00   125 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC0 00 00 00 00 00 00   126 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EC8 00 00 00 00 00 00   127 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED0 00 00 00 00 00 00   128 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3ED8 00 00 00 00 00 00   129 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE0 00 00 00 00 00 00   130 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EE8 00 00 00 00 00 00   131 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF0 00 00 00 00 00 00   132 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3EF8 00 00 00 00 00 00   133 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            134 	.area _CSEG (REL, CON) 
                            135 ;src/main.c:99: void dibujarMapa() {
                            136 ;	---------------------------------
                            137 ; Function dibujarMapa
                            138 ; ---------------------------------
   6165                     139 _dibujarMapa::
                            140 ;src/main.c:100: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   6165 2A 62 61      [16]  141 	ld	hl,(_mapa)
   6168 E5            [11]  142 	push	hl
   6169 21 00 C0      [10]  143 	ld	hl,#0xC000
   616C E5            [11]  144 	push	hl
   616D 21 2C 28      [10]  145 	ld	hl,#0x282C
   6170 E5            [11]  146 	push	hl
   6171 2E 00         [ 7]  147 	ld	l, #0x00
   6173 E5            [11]  148 	push	hl
   6174 AF            [ 4]  149 	xor	a, a
   6175 F5            [11]  150 	push	af
   6176 33            [ 6]  151 	inc	sp
   6177 CD FF 56      [17]  152 	call	_cpct_etm_drawTileBox2x4
   617A C9            [10]  153 	ret
   617B                     154 _mapas:
   617B C0 4D               155 	.dw _g_map1
   617D E0 46               156 	.dw _g_map2
   617F 00 40               157 	.dw _g_map3
                            158 ;src/main.c:105: void dibujarProta() {
                            159 ;	---------------------------------
                            160 ; Function dibujarProta
                            161 ; ---------------------------------
   6181                     162 _dibujarProta::
                            163 ;src/main.c:106: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   6181 21 01 61      [10]  164 	ld	hl, #_prota + 1
   6184 56            [ 7]  165 	ld	d,(hl)
   6185 21 00 61      [10]  166 	ld	hl, #_prota + 0
   6188 46            [ 7]  167 	ld	b,(hl)
   6189 D5            [11]  168 	push	de
   618A 33            [ 6]  169 	inc	sp
   618B C5            [11]  170 	push	bc
   618C 33            [ 6]  171 	inc	sp
   618D 21 00 C0      [10]  172 	ld	hl,#0xC000
   6190 E5            [11]  173 	push	hl
   6191 CD A3 60      [17]  174 	call	_cpct_getScreenPtr
   6194 EB            [ 4]  175 	ex	de,hl
                            176 ;src/main.c:107: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   6195 ED 4B 04 61   [20]  177 	ld	bc, (#_prota + 4)
   6199 21 00 3E      [10]  178 	ld	hl,#_g_tablatrans
   619C E5            [11]  179 	push	hl
   619D 21 07 16      [10]  180 	ld	hl,#0x1607
   61A0 E5            [11]  181 	push	hl
   61A1 D5            [11]  182 	push	de
   61A2 C5            [11]  183 	push	bc
   61A3 CD C3 60      [17]  184 	call	_cpct_drawSpriteMaskedAlignedTable
   61A6 C9            [10]  185 	ret
                            186 ;src/main.c:110: void borrarProta() {
                            187 ;	---------------------------------
                            188 ; Function borrarProta
                            189 ; ---------------------------------
   61A7                     190 _borrarProta::
   61A7 DD E5         [15]  191 	push	ix
   61A9 DD 21 00 00   [14]  192 	ld	ix,#0
   61AD DD 39         [15]  193 	add	ix,sp
   61AF 3B            [ 6]  194 	dec	sp
                            195 ;src/main.c:112: u8 w = 4 + (prota.px & 1);
   61B0 21 02 61      [10]  196 	ld	hl, #_prota + 2
   61B3 4E            [ 7]  197 	ld	c,(hl)
   61B4 79            [ 4]  198 	ld	a,c
   61B5 E6 01         [ 7]  199 	and	a, #0x01
   61B7 47            [ 4]  200 	ld	b,a
   61B8 04            [ 4]  201 	inc	b
   61B9 04            [ 4]  202 	inc	b
   61BA 04            [ 4]  203 	inc	b
   61BB 04            [ 4]  204 	inc	b
                            205 ;src/main.c:115: u8 h = 6 + (prota.py & 2 ? 1 : 0);
   61BC 21 03 61      [10]  206 	ld	hl, #_prota + 3
   61BF 5E            [ 7]  207 	ld	e,(hl)
   61C0 CB 4B         [ 8]  208 	bit	1, e
   61C2 28 04         [12]  209 	jr	Z,00103$
   61C4 3E 01         [ 7]  210 	ld	a,#0x01
   61C6 18 02         [12]  211 	jr	00104$
   61C8                     212 00103$:
   61C8 3E 00         [ 7]  213 	ld	a,#0x00
   61CA                     214 00104$:
   61CA C6 06         [ 7]  215 	add	a, #0x06
   61CC DD 77 FF      [19]  216 	ld	-1 (ix),a
                            217 ;src/main.c:117: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   61CF FD 2A 62 61   [20]  218 	ld	iy,(_mapa)
   61D3 16 00         [ 7]  219 	ld	d,#0x00
   61D5 63            [ 4]  220 	ld	h,e
   61D6 6A            [ 4]  221 	ld	l,d
   61D7 CB 7A         [ 8]  222 	bit	7, d
   61D9 28 05         [12]  223 	jr	Z,00105$
   61DB 13            [ 6]  224 	inc	de
   61DC 13            [ 6]  225 	inc	de
   61DD 13            [ 6]  226 	inc	de
   61DE 63            [ 4]  227 	ld	h,e
   61DF 6A            [ 4]  228 	ld	l,d
   61E0                     229 00105$:
   61E0 5C            [ 4]  230 	ld	e, h
   61E1 55            [ 4]  231 	ld	d, l
   61E2 CB 2A         [ 8]  232 	sra	d
   61E4 CB 1B         [ 8]  233 	rr	e
   61E6 CB 2A         [ 8]  234 	sra	d
   61E8 CB 1B         [ 8]  235 	rr	e
   61EA 51            [ 4]  236 	ld	d,c
   61EB CB 3A         [ 8]  237 	srl	d
   61ED FD E5         [15]  238 	push	iy
   61EF 21 00 C0      [10]  239 	ld	hl,#0xC000
   61F2 E5            [11]  240 	push	hl
   61F3 3E 28         [ 7]  241 	ld	a,#0x28
   61F5 F5            [11]  242 	push	af
   61F6 33            [ 6]  243 	inc	sp
   61F7 DD 7E FF      [19]  244 	ld	a,-1 (ix)
   61FA F5            [11]  245 	push	af
   61FB 33            [ 6]  246 	inc	sp
   61FC C5            [11]  247 	push	bc
   61FD 33            [ 6]  248 	inc	sp
   61FE 7B            [ 4]  249 	ld	a,e
   61FF F5            [11]  250 	push	af
   6200 33            [ 6]  251 	inc	sp
   6201 D5            [11]  252 	push	de
   6202 33            [ 6]  253 	inc	sp
   6203 CD FF 56      [17]  254 	call	_cpct_etm_drawTileBox2x4
   6206 33            [ 6]  255 	inc	sp
   6207 DD E1         [14]  256 	pop	ix
   6209 C9            [10]  257 	ret
                            258 ;src/main.c:120: void redibujarProta() {
                            259 ;	---------------------------------
                            260 ; Function redibujarProta
                            261 ; ---------------------------------
   620A                     262 _redibujarProta::
                            263 ;src/main.c:121: borrarProta();
   620A CD A7 61      [17]  264 	call	_borrarProta
                            265 ;src/main.c:122: prota.px = prota.x;
   620D 01 02 61      [10]  266 	ld	bc,#_prota + 2
   6210 3A 00 61      [13]  267 	ld	a, (#_prota + 0)
   6213 02            [ 7]  268 	ld	(bc),a
                            269 ;src/main.c:123: prota.py = prota.y;
   6214 01 03 61      [10]  270 	ld	bc,#_prota + 3
   6217 3A 01 61      [13]  271 	ld	a, (#_prota + 1)
   621A 02            [ 7]  272 	ld	(bc),a
                            273 ;src/main.c:124: dibujarProta();
   621B C3 81 61      [10]  274 	jp  _dibujarProta
                            275 ;src/main.c:127: u8* getTilePtr(u8 x, u8 y) {
                            276 ;	---------------------------------
                            277 ; Function getTilePtr
                            278 ; ---------------------------------
   621E                     279 _getTilePtr::
                            280 ;src/main.c:128: return mapa + (y-ORIGEN_MAPA_Y)/4*g_map1_W + x/2;
   621E FD 21 03 00   [14]  281 	ld	iy,#3
   6222 FD 39         [15]  282 	add	iy,sp
   6224 FD 6E 00      [19]  283 	ld	l,0 (iy)
   6227 26 00         [ 7]  284 	ld	h,#0x00
   6229 4D            [ 4]  285 	ld	c,l
   622A 5C            [ 4]  286 	ld	e,h
   622B CB 7C         [ 8]  287 	bit	7, h
   622D 28 05         [12]  288 	jr	Z,00103$
   622F 23            [ 6]  289 	inc	hl
   6230 23            [ 6]  290 	inc	hl
   6231 23            [ 6]  291 	inc	hl
   6232 4D            [ 4]  292 	ld	c,l
   6233 5C            [ 4]  293 	ld	e,h
   6234                     294 00103$:
   6234 43            [ 4]  295 	ld	b, e
   6235 CB 28         [ 8]  296 	sra	b
   6237 CB 19         [ 8]  297 	rr	c
   6239 CB 28         [ 8]  298 	sra	b
   623B CB 19         [ 8]  299 	rr	c
   623D 69            [ 4]  300 	ld	l, c
   623E 60            [ 4]  301 	ld	h, b
   623F 29            [11]  302 	add	hl, hl
   6240 29            [11]  303 	add	hl, hl
   6241 09            [11]  304 	add	hl, bc
   6242 29            [11]  305 	add	hl, hl
   6243 29            [11]  306 	add	hl, hl
   6244 29            [11]  307 	add	hl, hl
   6245 ED 5B 62 61   [20]  308 	ld	de,(_mapa)
   6249 19            [11]  309 	add	hl,de
   624A FD 21 02 00   [14]  310 	ld	iy,#2
   624E FD 39         [15]  311 	add	iy,sp
   6250 FD 4E 00      [19]  312 	ld	c,0 (iy)
   6253 CB 39         [ 8]  313 	srl	c
   6255 59            [ 4]  314 	ld	e,c
   6256 16 00         [ 7]  315 	ld	d,#0x00
   6258 19            [11]  316 	add	hl,de
   6259 C9            [10]  317 	ret
                            318 ;src/main.c:131: u8 checkCollision(int direction) { // check optimization
                            319 ;	---------------------------------
                            320 ; Function checkCollision
                            321 ; ---------------------------------
   625A                     322 _checkCollision::
   625A DD E5         [15]  323 	push	ix
   625C DD 21 00 00   [14]  324 	ld	ix,#0
   6260 DD 39         [15]  325 	add	ix,sp
   6262 21 F8 FF      [10]  326 	ld	hl,#-8
   6265 39            [11]  327 	add	hl,sp
   6266 F9            [ 6]  328 	ld	sp,hl
                            329 ;src/main.c:134: switch (direction) {
   6267 DD CB 05 7E   [20]  330 	bit	7, 5 (ix)
   626B C2 75 63      [10]  331 	jp	NZ,00105$
   626E 3E 03         [ 7]  332 	ld	a,#0x03
   6270 DD BE 04      [19]  333 	cp	a, 4 (ix)
   6273 3E 00         [ 7]  334 	ld	a,#0x00
   6275 DD 9E 05      [19]  335 	sbc	a, 5 (ix)
   6278 E2 7D 62      [10]  336 	jp	PO, 00128$
   627B EE 80         [ 7]  337 	xor	a, #0x80
   627D                     338 00128$:
   627D FA 75 63      [10]  339 	jp	M,00105$
   6280 DD 5E 04      [19]  340 	ld	e,4 (ix)
   6283 16 00         [ 7]  341 	ld	d,#0x00
   6285 21 8C 62      [10]  342 	ld	hl,#00129$
   6288 19            [11]  343 	add	hl,de
   6289 19            [11]  344 	add	hl,de
   628A 19            [11]  345 	add	hl,de
   628B E9            [ 4]  346 	jp	(hl)
   628C                     347 00129$:
   628C C3 98 62      [10]  348 	jp	00101$
   628F C3 DD 62      [10]  349 	jp	00102$
   6292 C3 1D 63      [10]  350 	jp	00103$
   6295 C3 49 63      [10]  351 	jp	00104$
                            352 ;src/main.c:135: case 0:
   6298                     353 00101$:
                            354 ;src/main.c:136: headTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y);
   6298 21 01 61      [10]  355 	ld	hl, #(_prota + 0x0001) + 0
   629B 46            [ 7]  356 	ld	b,(hl)
   629C 3A 00 61      [13]  357 	ld	a, (#_prota + 0)
   629F C6 04         [ 7]  358 	add	a, #0x04
   62A1 C5            [11]  359 	push	bc
   62A2 33            [ 6]  360 	inc	sp
   62A3 F5            [11]  361 	push	af
   62A4 33            [ 6]  362 	inc	sp
   62A5 CD 1E 62      [17]  363 	call	_getTilePtr
   62A8 F1            [10]  364 	pop	af
   62A9 DD 75 FE      [19]  365 	ld	-2 (ix),l
   62AC DD 74 FF      [19]  366 	ld	-1 (ix),h
                            367 ;src/main.c:137: feetTile  = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA);
   62AF 3A 01 61      [13]  368 	ld	a, (#(_prota + 0x0001) + 0)
   62B2 C6 16         [ 7]  369 	add	a, #0x16
   62B4 47            [ 4]  370 	ld	b,a
   62B5 3A 00 61      [13]  371 	ld	a, (#_prota + 0)
   62B8 C6 04         [ 7]  372 	add	a, #0x04
   62BA C5            [11]  373 	push	bc
   62BB 33            [ 6]  374 	inc	sp
   62BC F5            [11]  375 	push	af
   62BD 33            [ 6]  376 	inc	sp
   62BE CD 1E 62      [17]  377 	call	_getTilePtr
   62C1 F1            [10]  378 	pop	af
   62C2 4D            [ 4]  379 	ld	c,l
   62C3 44            [ 4]  380 	ld	b,h
                            381 ;src/main.c:138: waistTile = getTilePtr(prota.x + G_HERO_W - 3, prota.y + ALTO_PROTA/2);
   62C4 3A 01 61      [13]  382 	ld	a, (#(_prota + 0x0001) + 0)
   62C7 C6 0B         [ 7]  383 	add	a, #0x0B
   62C9 57            [ 4]  384 	ld	d,a
   62CA 3A 00 61      [13]  385 	ld	a, (#_prota + 0)
   62CD C6 04         [ 7]  386 	add	a, #0x04
   62CF C5            [11]  387 	push	bc
   62D0 D5            [11]  388 	push	de
   62D1 33            [ 6]  389 	inc	sp
   62D2 F5            [11]  390 	push	af
   62D3 33            [ 6]  391 	inc	sp
   62D4 CD 1E 62      [17]  392 	call	_getTilePtr
   62D7 F1            [10]  393 	pop	af
   62D8 EB            [ 4]  394 	ex	de,hl
   62D9 C1            [10]  395 	pop	bc
                            396 ;src/main.c:139: break;
   62DA C3 75 63      [10]  397 	jp	00105$
                            398 ;src/main.c:140: case 1:
   62DD                     399 00102$:
                            400 ;src/main.c:141: headTile  = getTilePtr(prota.x - 1, prota.y);
   62DD 21 01 61      [10]  401 	ld	hl, #(_prota + 0x0001) + 0
   62E0 46            [ 7]  402 	ld	b,(hl)
   62E1 21 00 61      [10]  403 	ld	hl, #_prota + 0
   62E4 56            [ 7]  404 	ld	d,(hl)
   62E5 15            [ 4]  405 	dec	d
   62E6 4A            [ 4]  406 	ld	c, d
   62E7 C5            [11]  407 	push	bc
   62E8 CD 1E 62      [17]  408 	call	_getTilePtr
   62EB F1            [10]  409 	pop	af
   62EC DD 75 FE      [19]  410 	ld	-2 (ix),l
   62EF DD 74 FF      [19]  411 	ld	-1 (ix),h
                            412 ;src/main.c:142: feetTile  = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA);
   62F2 3A 01 61      [13]  413 	ld	a, (#(_prota + 0x0001) + 0)
   62F5 C6 16         [ 7]  414 	add	a, #0x16
   62F7 47            [ 4]  415 	ld	b,a
   62F8 21 00 61      [10]  416 	ld	hl, #_prota + 0
   62FB 56            [ 7]  417 	ld	d,(hl)
   62FC 15            [ 4]  418 	dec	d
   62FD 4A            [ 4]  419 	ld	c, d
   62FE C5            [11]  420 	push	bc
   62FF CD 1E 62      [17]  421 	call	_getTilePtr
   6302 F1            [10]  422 	pop	af
   6303 4D            [ 4]  423 	ld	c,l
   6304 44            [ 4]  424 	ld	b,h
                            425 ;src/main.c:143: waistTile = getTilePtr(prota.x - 1, prota.y + ALTO_PROTA/2);
   6305 3A 01 61      [13]  426 	ld	a, (#(_prota + 0x0001) + 0)
   6308 C6 0B         [ 7]  427 	add	a, #0x0B
   630A 57            [ 4]  428 	ld	d,a
   630B 3A 00 61      [13]  429 	ld	a, (#_prota + 0)
   630E C6 FF         [ 7]  430 	add	a,#0xFF
   6310 C5            [11]  431 	push	bc
   6311 D5            [11]  432 	push	de
   6312 33            [ 6]  433 	inc	sp
   6313 F5            [11]  434 	push	af
   6314 33            [ 6]  435 	inc	sp
   6315 CD 1E 62      [17]  436 	call	_getTilePtr
   6318 F1            [10]  437 	pop	af
   6319 EB            [ 4]  438 	ex	de,hl
   631A C1            [10]  439 	pop	bc
                            440 ;src/main.c:144: break;
   631B 18 58         [12]  441 	jr	00105$
                            442 ;src/main.c:145: case 2:
   631D                     443 00103$:
                            444 ;src/main.c:146: headTile   = getTilePtr(prota.x, prota.y - 1);
   631D 21 01 61      [10]  445 	ld	hl, #(_prota + 0x0001) + 0
   6320 46            [ 7]  446 	ld	b,(hl)
   6321 05            [ 4]  447 	dec	b
   6322 21 00 61      [10]  448 	ld	hl, #_prota + 0
   6325 4E            [ 7]  449 	ld	c, (hl)
   6326 C5            [11]  450 	push	bc
   6327 CD 1E 62      [17]  451 	call	_getTilePtr
   632A F1            [10]  452 	pop	af
   632B DD 75 FE      [19]  453 	ld	-2 (ix),l
   632E DD 74 FF      [19]  454 	ld	-1 (ix),h
                            455 ;src/main.c:147: feetTile   = getTilePtr(prota.x + G_HERO_W - 4, prota.y - 1);
   6331 3A 01 61      [13]  456 	ld	a, (#(_prota + 0x0001) + 0)
   6334 47            [ 4]  457 	ld	b,a
   6335 05            [ 4]  458 	dec	b
   6336 3A 00 61      [13]  459 	ld	a, (#_prota + 0)
   6339 C6 03         [ 7]  460 	add	a, #0x03
   633B C5            [11]  461 	push	bc
   633C 33            [ 6]  462 	inc	sp
   633D F5            [11]  463 	push	af
   633E 33            [ 6]  464 	inc	sp
   633F CD 1E 62      [17]  465 	call	_getTilePtr
   6342 F1            [10]  466 	pop	af
   6343 4D            [ 4]  467 	ld	c,l
   6344 44            [ 4]  468 	ld	b,h
                            469 ;src/main.c:148: *waistTile = 0;
   6345 AF            [ 4]  470 	xor	a, a
   6346 12            [ 7]  471 	ld	(de),a
                            472 ;src/main.c:149: break;
   6347 18 2C         [12]  473 	jr	00105$
                            474 ;src/main.c:150: case 3:
   6349                     475 00104$:
                            476 ;src/main.c:151: headTile  = getTilePtr(prota.x, prota.y + ALTO_PROTA + 1);
   6349 3A 01 61      [13]  477 	ld	a, (#(_prota + 0x0001) + 0)
   634C C6 17         [ 7]  478 	add	a, #0x17
   634E 47            [ 4]  479 	ld	b,a
   634F 21 00 61      [10]  480 	ld	hl, #_prota + 0
   6352 4E            [ 7]  481 	ld	c, (hl)
   6353 C5            [11]  482 	push	bc
   6354 CD 1E 62      [17]  483 	call	_getTilePtr
   6357 F1            [10]  484 	pop	af
   6358 DD 75 FE      [19]  485 	ld	-2 (ix),l
   635B DD 74 FF      [19]  486 	ld	-1 (ix),h
                            487 ;src/main.c:152: feetTile  = getTilePtr(prota.x + G_HERO_W - 4, prota.y + ALTO_PROTA + 1);
   635E 3A 01 61      [13]  488 	ld	a, (#(_prota + 0x0001) + 0)
   6361 C6 17         [ 7]  489 	add	a, #0x17
   6363 47            [ 4]  490 	ld	b,a
   6364 3A 00 61      [13]  491 	ld	a, (#_prota + 0)
   6367 C6 03         [ 7]  492 	add	a, #0x03
   6369 C5            [11]  493 	push	bc
   636A 33            [ 6]  494 	inc	sp
   636B F5            [11]  495 	push	af
   636C 33            [ 6]  496 	inc	sp
   636D CD 1E 62      [17]  497 	call	_getTilePtr
   6370 F1            [10]  498 	pop	af
   6371 4D            [ 4]  499 	ld	c,l
   6372 44            [ 4]  500 	ld	b,h
                            501 ;src/main.c:153: *waistTile = 0;
   6373 AF            [ 4]  502 	xor	a, a
   6374 12            [ 7]  503 	ld	(de),a
                            504 ;src/main.c:155: }
   6375                     505 00105$:
                            506 ;src/main.c:157: if (*headTile > 0 || *feetTile > 0 || *waistTile > 0)
   6375 DD 6E FE      [19]  507 	ld	l,-2 (ix)
   6378 DD 66 FF      [19]  508 	ld	h,-1 (ix)
   637B 7E            [ 7]  509 	ld	a,(hl)
   637C B7            [ 4]  510 	or	a, a
   637D 20 08         [12]  511 	jr	NZ,00106$
   637F 0A            [ 7]  512 	ld	a,(bc)
   6380 B7            [ 4]  513 	or	a, a
   6381 20 04         [12]  514 	jr	NZ,00106$
   6383 1A            [ 7]  515 	ld	a,(de)
   6384 B7            [ 4]  516 	or	a, a
   6385 28 04         [12]  517 	jr	Z,00107$
   6387                     518 00106$:
                            519 ;src/main.c:161: return 1;
   6387 2E 01         [ 7]  520 	ld	l,#0x01
   6389 18 02         [12]  521 	jr	00110$
   638B                     522 00107$:
                            523 ;src/main.c:163: return 0;
   638B 2E 00         [ 7]  524 	ld	l,#0x00
   638D                     525 00110$:
   638D DD F9         [10]  526 	ld	sp, ix
   638F DD E1         [14]  527 	pop	ix
   6391 C9            [10]  528 	ret
                            529 ;src/main.c:166: void avanzarMapa() {
                            530 ;	---------------------------------
                            531 ; Function avanzarMapa
                            532 ; ---------------------------------
   6392                     533 _avanzarMapa::
                            534 ;src/main.c:167: if(num_mapa < NUM_MAPAS -1) {
   6392 3A 64 61      [13]  535 	ld	a,(#_num_mapa + 0)
   6395 D6 02         [ 7]  536 	sub	a, #0x02
   6397 D0            [11]  537 	ret	NC
                            538 ;src/main.c:168: mapa = mapas[++num_mapa];
   6398 01 7B 61      [10]  539 	ld	bc,#_mapas+0
   639B 21 64 61      [10]  540 	ld	hl, #_num_mapa+0
   639E 34            [11]  541 	inc	(hl)
   639F FD 21 64 61   [14]  542 	ld	iy,#_num_mapa
   63A3 FD 6E 00      [19]  543 	ld	l,0 (iy)
   63A6 26 00         [ 7]  544 	ld	h,#0x00
   63A8 29            [11]  545 	add	hl, hl
   63A9 09            [11]  546 	add	hl,bc
   63AA 7E            [ 7]  547 	ld	a,(hl)
   63AB FD 21 62 61   [14]  548 	ld	iy,#_mapa
   63AF FD 77 00      [19]  549 	ld	0 (iy),a
   63B2 23            [ 6]  550 	inc	hl
   63B3 7E            [ 7]  551 	ld	a,(hl)
   63B4 32 63 61      [13]  552 	ld	(#_mapa + 1),a
                            553 ;src/main.c:169: prota.x = prota.px = 2;
   63B7 21 02 61      [10]  554 	ld	hl,#(_prota + 0x0002)
   63BA 36 02         [10]  555 	ld	(hl),#0x02
   63BC 21 00 61      [10]  556 	ld	hl,#_prota
   63BF 36 02         [10]  557 	ld	(hl),#0x02
                            558 ;src/main.c:170: prota.mover = SI;
   63C1 21 06 61      [10]  559 	ld	hl,#(_prota + 0x0006)
   63C4 36 01         [10]  560 	ld	(hl),#0x01
                            561 ;src/main.c:171: dibujarMapa();
   63C6 C3 65 61      [10]  562 	jp  _dibujarMapa
                            563 ;src/main.c:175: void moverIzquierda() {
                            564 ;	---------------------------------
                            565 ; Function moverIzquierda
                            566 ; ---------------------------------
   63C9                     567 _moverIzquierda::
                            568 ;src/main.c:176: prota.mira = M_izquierda;
   63C9 01 00 61      [10]  569 	ld	bc,#_prota+0
   63CC 21 07 61      [10]  570 	ld	hl,#(_prota + 0x0007)
   63CF 36 01         [10]  571 	ld	(hl),#0x01
                            572 ;src/main.c:177: if (!checkCollision(M_izquierda)) {
   63D1 C5            [11]  573 	push	bc
   63D2 21 01 00      [10]  574 	ld	hl,#0x0001
   63D5 E5            [11]  575 	push	hl
   63D6 CD 5A 62      [17]  576 	call	_checkCollision
   63D9 F1            [10]  577 	pop	af
   63DA C1            [10]  578 	pop	bc
   63DB 7D            [ 4]  579 	ld	a,l
   63DC B7            [ 4]  580 	or	a, a
   63DD C0            [11]  581 	ret	NZ
                            582 ;src/main.c:178: prota.x--;
   63DE 0A            [ 7]  583 	ld	a,(bc)
   63DF C6 FF         [ 7]  584 	add	a,#0xFF
   63E1 02            [ 7]  585 	ld	(bc),a
                            586 ;src/main.c:179: prota.mover = SI;
   63E2 21 06 61      [10]  587 	ld	hl,#(_prota + 0x0006)
   63E5 36 01         [10]  588 	ld	(hl),#0x01
   63E7 C9            [10]  589 	ret
                            590 ;src/main.c:183: void moverDerecha() {
                            591 ;	---------------------------------
                            592 ; Function moverDerecha
                            593 ; ---------------------------------
   63E8                     594 _moverDerecha::
                            595 ;src/main.c:184: prota.mira = M_derecha;
   63E8 21 07 61      [10]  596 	ld	hl,#(_prota + 0x0007)
   63EB 36 00         [10]  597 	ld	(hl),#0x00
                            598 ;src/main.c:185: if (!checkCollision(M_derecha)) {
   63ED 21 00 00      [10]  599 	ld	hl,#0x0000
   63F0 E5            [11]  600 	push	hl
   63F1 CD 5A 62      [17]  601 	call	_checkCollision
   63F4 F1            [10]  602 	pop	af
   63F5 7D            [ 4]  603 	ld	a,l
                            604 ;src/main.c:186: prota.x++;
   63F6 21 00 61      [10]  605 	ld	hl, #_prota + 0
   63F9 5E            [ 7]  606 	ld	e,(hl)
                            607 ;src/main.c:185: if (!checkCollision(M_derecha)) {
   63FA B7            [ 4]  608 	or	a, a
   63FB 20 0B         [12]  609 	jr	NZ,00106$
                            610 ;src/main.c:186: prota.x++;
   63FD 1C            [ 4]  611 	inc	e
   63FE 21 00 61      [10]  612 	ld	hl,#_prota
   6401 73            [ 7]  613 	ld	(hl),e
                            614 ;src/main.c:187: prota.mover = SI;
   6402 21 06 61      [10]  615 	ld	hl,#(_prota + 0x0006)
   6405 36 01         [10]  616 	ld	(hl),#0x01
   6407 C9            [10]  617 	ret
   6408                     618 00106$:
                            619 ;src/main.c:188: }else if ( prota.x > 68 && prota.y >72 && prota.y < 80){  //TODO que avance solo si estamos en el centro
   6408 3E 44         [ 7]  620 	ld	a,#0x44
   640A 93            [ 4]  621 	sub	a, e
   640B D0            [11]  622 	ret	NC
   640C 21 01 61      [10]  623 	ld	hl, #_prota + 1
   640F 4E            [ 7]  624 	ld	c,(hl)
   6410 3E 48         [ 7]  625 	ld	a,#0x48
   6412 91            [ 4]  626 	sub	a, c
   6413 D0            [11]  627 	ret	NC
   6414 79            [ 4]  628 	ld	a,c
   6415 D6 50         [ 7]  629 	sub	a, #0x50
   6417 D0            [11]  630 	ret	NC
                            631 ;src/main.c:189: avanzarMapa();
   6418 C3 92 63      [10]  632 	jp  _avanzarMapa
                            633 ;src/main.c:193: void moverArriba() {
                            634 ;	---------------------------------
                            635 ; Function moverArriba
                            636 ; ---------------------------------
   641B                     637 _moverArriba::
                            638 ;src/main.c:194: prota.mira = M_arriba;
   641B 21 07 61      [10]  639 	ld	hl,#(_prota + 0x0007)
   641E 36 02         [10]  640 	ld	(hl),#0x02
                            641 ;src/main.c:195: if (!checkCollision(M_arriba)) {
   6420 21 02 00      [10]  642 	ld	hl,#0x0002
   6423 E5            [11]  643 	push	hl
   6424 CD 5A 62      [17]  644 	call	_checkCollision
   6427 F1            [10]  645 	pop	af
   6428 7D            [ 4]  646 	ld	a,l
   6429 B7            [ 4]  647 	or	a, a
   642A C0            [11]  648 	ret	NZ
                            649 ;src/main.c:196: prota.y--;
   642B 21 01 61      [10]  650 	ld	hl,#_prota + 1
   642E 4E            [ 7]  651 	ld	c,(hl)
   642F 0D            [ 4]  652 	dec	c
   6430 71            [ 7]  653 	ld	(hl),c
                            654 ;src/main.c:197: prota.mover  = SI;
   6431 21 06 61      [10]  655 	ld	hl,#(_prota + 0x0006)
   6434 36 01         [10]  656 	ld	(hl),#0x01
   6436 C9            [10]  657 	ret
                            658 ;src/main.c:201: void moverAbajo() {
                            659 ;	---------------------------------
                            660 ; Function moverAbajo
                            661 ; ---------------------------------
   6437                     662 _moverAbajo::
                            663 ;src/main.c:202: prota.mira = M_abajo;
   6437 21 07 61      [10]  664 	ld	hl,#(_prota + 0x0007)
   643A 36 03         [10]  665 	ld	(hl),#0x03
                            666 ;src/main.c:203: if (!checkCollision(M_abajo)) {
   643C 21 03 00      [10]  667 	ld	hl,#0x0003
   643F E5            [11]  668 	push	hl
   6440 CD 5A 62      [17]  669 	call	_checkCollision
   6443 F1            [10]  670 	pop	af
   6444 7D            [ 4]  671 	ld	a,l
   6445 B7            [ 4]  672 	or	a, a
   6446 C0            [11]  673 	ret	NZ
                            674 ;src/main.c:204: prota.y++;
   6447 01 01 61      [10]  675 	ld	bc,#_prota + 1
   644A 0A            [ 7]  676 	ld	a,(bc)
   644B 3C            [ 4]  677 	inc	a
   644C 02            [ 7]  678 	ld	(bc),a
                            679 ;src/main.c:205: prota.mover  = SI;
   644D 21 06 61      [10]  680 	ld	hl,#(_prota + 0x0006)
   6450 36 01         [10]  681 	ld	(hl),#0x01
   6452 C9            [10]  682 	ret
                            683 ;src/main.c:209: void dibujarCuchillo(TKnife* actual) {
                            684 ;	---------------------------------
                            685 ; Function dibujarCuchillo
                            686 ; ---------------------------------
   6453                     687 _dibujarCuchillo::
   6453 DD E5         [15]  688 	push	ix
   6455 DD 21 00 00   [14]  689 	ld	ix,#0
   6459 DD 39         [15]  690 	add	ix,sp
   645B F5            [11]  691 	push	af
   645C F5            [11]  692 	push	af
                            693 ;src/main.c:210: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, actual->x, actual->y);
   645D DD 5E 04      [19]  694 	ld	e,4 (ix)
   6460 DD 56 05      [19]  695 	ld	d,5 (ix)
   6463 6B            [ 4]  696 	ld	l, e
   6464 62            [ 4]  697 	ld	h, d
   6465 23            [ 6]  698 	inc	hl
   6466 46            [ 7]  699 	ld	b,(hl)
   6467 1A            [ 7]  700 	ld	a,(de)
   6468 D5            [11]  701 	push	de
   6469 C5            [11]  702 	push	bc
   646A 33            [ 6]  703 	inc	sp
   646B F5            [11]  704 	push	af
   646C 33            [ 6]  705 	inc	sp
   646D 21 00 C0      [10]  706 	ld	hl,#0xC000
   6470 E5            [11]  707 	push	hl
   6471 CD A3 60      [17]  708 	call	_cpct_getScreenPtr
   6474 D1            [10]  709 	pop	de
   6475 E5            [11]  710 	push	hl
   6476 FD E1         [14]  711 	pop	iy
                            712 ;src/main.c:211: if(actual->eje == E_X){
   6478 6B            [ 4]  713 	ld	l, e
   6479 62            [ 4]  714 	ld	h, d
   647A 01 08 00      [10]  715 	ld	bc, #0x0008
   647D 09            [11]  716 	add	hl, bc
   647E 4E            [ 7]  717 	ld	c,(hl)
                            718 ;src/main.c:212: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   647F FD E5         [15]  719 	push	iy
   6481 F1            [10]  720 	pop	af
   6482 DD 77 FD      [19]  721 	ld	-3 (ix),a
   6485 FD E5         [15]  722 	push	iy
   6487 3B            [ 6]  723 	dec	sp
   6488 F1            [10]  724 	pop	af
   6489 33            [ 6]  725 	inc	sp
   648A DD 77 FC      [19]  726 	ld	-4 (ix),a
   648D 21 04 00      [10]  727 	ld	hl,#0x0004
   6490 19            [11]  728 	add	hl,de
   6491 DD 75 FE      [19]  729 	ld	-2 (ix),l
   6494 DD 74 FF      [19]  730 	ld	-1 (ix),h
                            731 ;src/main.c:211: if(actual->eje == E_X){
   6497 79            [ 4]  732 	ld	a,c
   6498 B7            [ 4]  733 	or	a, a
   6499 20 1E         [12]  734 	jr	NZ,00104$
                            735 ;src/main.c:212: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   649B 11 00 3E      [10]  736 	ld	de,#_g_tablatrans+0
   649E DD 6E FE      [19]  737 	ld	l,-2 (ix)
   64A1 DD 66 FF      [19]  738 	ld	h,-1 (ix)
   64A4 4E            [ 7]  739 	ld	c,(hl)
   64A5 23            [ 6]  740 	inc	hl
   64A6 46            [ 7]  741 	ld	b,(hl)
   64A7 D5            [11]  742 	push	de
   64A8 21 03 03      [10]  743 	ld	hl,#0x0303
   64AB E5            [11]  744 	push	hl
   64AC DD 6E FC      [19]  745 	ld	l,-4 (ix)
   64AF DD 66 FD      [19]  746 	ld	h,-3 (ix)
   64B2 E5            [11]  747 	push	hl
   64B3 C5            [11]  748 	push	bc
   64B4 CD C3 60      [17]  749 	call	_cpct_drawSpriteMaskedAlignedTable
   64B7 18 1F         [12]  750 	jr	00106$
   64B9                     751 00104$:
                            752 ;src/main.c:215: else if(actual->eje == E_Y){
   64B9 0D            [ 4]  753 	dec	c
   64BA 20 1C         [12]  754 	jr	NZ,00106$
                            755 ;src/main.c:216: cpct_drawSpriteMaskedAlignedTable (actual->sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   64BC 11 00 3E      [10]  756 	ld	de,#_g_tablatrans+0
   64BF DD 6E FE      [19]  757 	ld	l,-2 (ix)
   64C2 DD 66 FF      [19]  758 	ld	h,-1 (ix)
   64C5 4E            [ 7]  759 	ld	c,(hl)
   64C6 23            [ 6]  760 	inc	hl
   64C7 46            [ 7]  761 	ld	b,(hl)
   64C8 D5            [11]  762 	push	de
   64C9 21 02 06      [10]  763 	ld	hl,#0x0602
   64CC E5            [11]  764 	push	hl
   64CD DD 6E FC      [19]  765 	ld	l,-4 (ix)
   64D0 DD 66 FD      [19]  766 	ld	h,-3 (ix)
   64D3 E5            [11]  767 	push	hl
   64D4 C5            [11]  768 	push	bc
   64D5 CD C3 60      [17]  769 	call	_cpct_drawSpriteMaskedAlignedTable
   64D8                     770 00106$:
   64D8 DD F9         [10]  771 	ld	sp, ix
   64DA DD E1         [14]  772 	pop	ix
   64DC C9            [10]  773 	ret
                            774 ;src/main.c:220: void borrarCuchillo(TKnife* actual) {
                            775 ;	---------------------------------
                            776 ; Function borrarCuchillo
                            777 ; ---------------------------------
   64DD                     778 _borrarCuchillo::
   64DD DD E5         [15]  779 	push	ix
   64DF DD 21 00 00   [14]  780 	ld	ix,#0
   64E3 DD 39         [15]  781 	add	ix,sp
   64E5 3B            [ 6]  782 	dec	sp
                            783 ;src/main.c:221: u8 w = 2 + (actual->px & 1);
   64E6 DD 5E 04      [19]  784 	ld	e,4 (ix)
   64E9 DD 56 05      [19]  785 	ld	d,5 (ix)
   64EC 6B            [ 4]  786 	ld	l, e
   64ED 62            [ 4]  787 	ld	h, d
   64EE 23            [ 6]  788 	inc	hl
   64EF 23            [ 6]  789 	inc	hl
   64F0 4E            [ 7]  790 	ld	c,(hl)
   64F1 79            [ 4]  791 	ld	a,c
   64F2 E6 01         [ 7]  792 	and	a, #0x01
   64F4 47            [ 4]  793 	ld	b,a
   64F5 04            [ 4]  794 	inc	b
   64F6 04            [ 4]  795 	inc	b
                            796 ;src/main.c:222: u8 h = 2 + (actual->py & 3 ? 1 : 0);
   64F7 EB            [ 4]  797 	ex	de,hl
   64F8 23            [ 6]  798 	inc	hl
   64F9 23            [ 6]  799 	inc	hl
   64FA 23            [ 6]  800 	inc	hl
   64FB 5E            [ 7]  801 	ld	e,(hl)
   64FC 7B            [ 4]  802 	ld	a,e
   64FD E6 03         [ 7]  803 	and	a, #0x03
   64FF 28 04         [12]  804 	jr	Z,00103$
   6501 3E 01         [ 7]  805 	ld	a,#0x01
   6503 18 02         [12]  806 	jr	00104$
   6505                     807 00103$:
   6505 3E 00         [ 7]  808 	ld	a,#0x00
   6507                     809 00104$:
   6507 C6 02         [ 7]  810 	add	a, #0x02
   6509 DD 77 FF      [19]  811 	ld	-1 (ix),a
                            812 ;src/main.c:223: cpct_etm_drawTileBox2x4 (actual->px / 2, (actual->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   650C FD 2A 62 61   [20]  813 	ld	iy,(_mapa)
   6510 16 00         [ 7]  814 	ld	d,#0x00
   6512 63            [ 4]  815 	ld	h,e
   6513 6A            [ 4]  816 	ld	l,d
   6514 CB 7A         [ 8]  817 	bit	7, d
   6516 28 05         [12]  818 	jr	Z,00105$
   6518 13            [ 6]  819 	inc	de
   6519 13            [ 6]  820 	inc	de
   651A 13            [ 6]  821 	inc	de
   651B 63            [ 4]  822 	ld	h,e
   651C 6A            [ 4]  823 	ld	l,d
   651D                     824 00105$:
   651D 5C            [ 4]  825 	ld	e, h
   651E 55            [ 4]  826 	ld	d, l
   651F CB 2A         [ 8]  827 	sra	d
   6521 CB 1B         [ 8]  828 	rr	e
   6523 CB 2A         [ 8]  829 	sra	d
   6525 CB 1B         [ 8]  830 	rr	e
   6527 51            [ 4]  831 	ld	d,c
   6528 CB 3A         [ 8]  832 	srl	d
   652A FD E5         [15]  833 	push	iy
   652C 21 00 C0      [10]  834 	ld	hl,#0xC000
   652F E5            [11]  835 	push	hl
   6530 3E 28         [ 7]  836 	ld	a,#0x28
   6532 F5            [11]  837 	push	af
   6533 33            [ 6]  838 	inc	sp
   6534 DD 7E FF      [19]  839 	ld	a,-1 (ix)
   6537 F5            [11]  840 	push	af
   6538 33            [ 6]  841 	inc	sp
   6539 C5            [11]  842 	push	bc
   653A 33            [ 6]  843 	inc	sp
   653B 7B            [ 4]  844 	ld	a,e
   653C F5            [11]  845 	push	af
   653D 33            [ 6]  846 	inc	sp
   653E D5            [11]  847 	push	de
   653F 33            [ 6]  848 	inc	sp
   6540 CD FF 56      [17]  849 	call	_cpct_etm_drawTileBox2x4
   6543 33            [ 6]  850 	inc	sp
   6544 DD E1         [14]  851 	pop	ix
   6546 C9            [10]  852 	ret
                            853 ;src/main.c:226: void redibujarCuchillo(TKnife* actual) {
                            854 ;	---------------------------------
                            855 ; Function redibujarCuchillo
                            856 ; ---------------------------------
   6547                     857 _redibujarCuchillo::
   6547 DD E5         [15]  858 	push	ix
   6549 DD 21 00 00   [14]  859 	ld	ix,#0
   654D DD 39         [15]  860 	add	ix,sp
                            861 ;src/main.c:227: borrarCuchillo(actual);
   654F DD 6E 04      [19]  862 	ld	l,4 (ix)
   6552 DD 66 05      [19]  863 	ld	h,5 (ix)
   6555 E5            [11]  864 	push	hl
   6556 CD DD 64      [17]  865 	call	_borrarCuchillo
   6559 F1            [10]  866 	pop	af
                            867 ;src/main.c:228: actual->px = actual->x;
   655A DD 4E 04      [19]  868 	ld	c,4 (ix)
   655D DD 46 05      [19]  869 	ld	b,5 (ix)
   6560 59            [ 4]  870 	ld	e, c
   6561 50            [ 4]  871 	ld	d, b
   6562 13            [ 6]  872 	inc	de
   6563 13            [ 6]  873 	inc	de
   6564 0A            [ 7]  874 	ld	a,(bc)
   6565 12            [ 7]  875 	ld	(de),a
                            876 ;src/main.c:229: actual->py = actual->y;
   6566 59            [ 4]  877 	ld	e, c
   6567 50            [ 4]  878 	ld	d, b
   6568 13            [ 6]  879 	inc	de
   6569 13            [ 6]  880 	inc	de
   656A 13            [ 6]  881 	inc	de
   656B 69            [ 4]  882 	ld	l, c
   656C 60            [ 4]  883 	ld	h, b
   656D 23            [ 6]  884 	inc	hl
   656E 7E            [ 7]  885 	ld	a,(hl)
   656F 12            [ 7]  886 	ld	(de),a
                            887 ;src/main.c:230: dibujarCuchillo(actual);
   6570 C5            [11]  888 	push	bc
   6571 CD 53 64      [17]  889 	call	_dibujarCuchillo
   6574 F1            [10]  890 	pop	af
   6575 DD E1         [14]  891 	pop	ix
   6577 C9            [10]  892 	ret
                            893 ;src/main.c:234: void lanzarCuchillo(){
                            894 ;	---------------------------------
                            895 ; Function lanzarCuchillo
                            896 ; ---------------------------------
   6578                     897 _lanzarCuchillo::
   6578 DD E5         [15]  898 	push	ix
   657A DD 21 00 00   [14]  899 	ld	ix,#0
   657E DD 39         [15]  900 	add	ix,sp
   6580 21 FA FF      [10]  901 	ld	hl,#-6
   6583 39            [11]  902 	add	hl,sp
   6584 F9            [ 6]  903 	ld	sp,hl
                            904 ;src/main.c:236: TKnife* actual = cu;
   6585 01 08 61      [10]  905 	ld	bc,#_cu+0
                            906 ;src/main.c:239: while(i>0 && actual->lanzado){
   6588 1E 0A         [ 7]  907 	ld	e,#0x0A
   658A                     908 00102$:
   658A 21 06 00      [10]  909 	ld	hl,#0x0006
   658D 09            [11]  910 	add	hl,bc
   658E E3            [19]  911 	ex	(sp), hl
   658F 7B            [ 4]  912 	ld	a,e
   6590 B7            [ 4]  913 	or	a, a
   6591 28 0F         [12]  914 	jr	Z,00104$
   6593 E1            [10]  915 	pop	hl
   6594 E5            [11]  916 	push	hl
   6595 7E            [ 7]  917 	ld	a,(hl)
   6596 B7            [ 4]  918 	or	a, a
   6597 28 09         [12]  919 	jr	Z,00104$
                            920 ;src/main.c:240: --i;
   6599 1D            [ 4]  921 	dec	e
                            922 ;src/main.c:241: actual++;
   659A 21 09 00      [10]  923 	ld	hl,#0x0009
   659D 09            [11]  924 	add	hl,bc
   659E 4D            [ 4]  925 	ld	c,l
   659F 44            [ 4]  926 	ld	b,h
   65A0 18 E8         [12]  927 	jr	00102$
   65A2                     928 00104$:
                            929 ;src/main.c:244: if(i>0 && !actual->lanzado){
   65A2 7B            [ 4]  930 	ld	a,e
   65A3 B7            [ 4]  931 	or	a, a
   65A4 CA 0D 67      [10]  932 	jp	Z,00127$
   65A7 E1            [10]  933 	pop	hl
   65A8 E5            [11]  934 	push	hl
   65A9 7E            [ 7]  935 	ld	a,(hl)
   65AA B7            [ 4]  936 	or	a, a
   65AB C2 0D 67      [10]  937 	jp	NZ,00127$
                            938 ;src/main.c:246: if(prota.mira == M_derecha){
   65AE 21 07 61      [10]  939 	ld	hl, #_prota + 7
   65B1 6E            [ 7]  940 	ld	l,(hl)
                            941 ;src/main.c:249: actual->direccion = M_derecha;
   65B2 FD 21 07 00   [14]  942 	ld	iy,#0x0007
   65B6 FD 09         [15]  943 	add	iy, bc
                            944 ;src/main.c:251: actual->y=prota.y + G_HERO_H /2;
   65B8 59            [ 4]  945 	ld	e, c
   65B9 50            [ 4]  946 	ld	d, b
   65BA 13            [ 6]  947 	inc	de
                            948 ;src/main.c:252: actual->sprite=g_knifeX_0;
   65BB 79            [ 4]  949 	ld	a,c
   65BC C6 04         [ 7]  950 	add	a, #0x04
   65BE DD 77 FE      [19]  951 	ld	-2 (ix),a
   65C1 78            [ 4]  952 	ld	a,b
   65C2 CE 00         [ 7]  953 	adc	a, #0x00
   65C4 DD 77 FF      [19]  954 	ld	-1 (ix),a
                            955 ;src/main.c:253: actual->eje = E_X;
   65C7 79            [ 4]  956 	ld	a,c
   65C8 C6 08         [ 7]  957 	add	a, #0x08
   65CA DD 77 FC      [19]  958 	ld	-4 (ix),a
   65CD 78            [ 4]  959 	ld	a,b
   65CE CE 00         [ 7]  960 	adc	a, #0x00
   65D0 DD 77 FD      [19]  961 	ld	-3 (ix),a
                            962 ;src/main.c:246: if(prota.mira == M_derecha){
   65D3 7D            [ 4]  963 	ld	a,l
   65D4 B7            [ 4]  964 	or	a, a
   65D5 20 4F         [12]  965 	jr	NZ,00122$
                            966 ;src/main.c:247: if( (LIMITE_DERECHO - (prota.x + G_HERO_W) ) >= G_KNIFEX_0_W + 1){
   65D7 21 00 61      [10]  967 	ld	hl, #_prota + 0
   65DA 6E            [ 7]  968 	ld	l,(hl)
   65DB 26 00         [ 7]  969 	ld	h,#0x00
   65DD D5            [11]  970 	push	de
   65DE 11 07 00      [10]  971 	ld	de,#0x0007
   65E1 19            [11]  972 	add	hl, de
   65E2 D1            [10]  973 	pop	de
   65E3 3E 4C         [ 7]  974 	ld	a,#0x4C
   65E5 95            [ 4]  975 	sub	a, l
   65E6 6F            [ 4]  976 	ld	l,a
   65E7 3E 00         [ 7]  977 	ld	a,#0x00
   65E9 9C            [ 4]  978 	sbc	a, h
   65EA 67            [ 4]  979 	ld	h,a
   65EB 7D            [ 4]  980 	ld	a,l
   65EC D6 04         [ 7]  981 	sub	a, #0x04
   65EE 7C            [ 4]  982 	ld	a,h
   65EF 17            [ 4]  983 	rla
   65F0 3F            [ 4]  984 	ccf
   65F1 1F            [ 4]  985 	rra
   65F2 DE 80         [ 7]  986 	sbc	a, #0x80
   65F4 DA 0D 67      [10]  987 	jp	C,00127$
                            988 ;src/main.c:248: actual->lanzado = SI;
   65F7 E1            [10]  989 	pop	hl
   65F8 E5            [11]  990 	push	hl
   65F9 36 01         [10]  991 	ld	(hl),#0x01
                            992 ;src/main.c:249: actual->direccion = M_derecha;
   65FB FD 36 00 00   [19]  993 	ld	0 (iy), #0x00
                            994 ;src/main.c:250: actual->x=prota.x + G_HERO_W;
   65FF 3A 00 61      [13]  995 	ld	a, (#_prota + 0)
   6602 C6 07         [ 7]  996 	add	a, #0x07
   6604 02            [ 7]  997 	ld	(bc),a
                            998 ;src/main.c:251: actual->y=prota.y + G_HERO_H /2;
   6605 3A 01 61      [13]  999 	ld	a, (#(_prota + 0x0001) + 0)
   6608 C6 0B         [ 7] 1000 	add	a, #0x0B
   660A 12            [ 7] 1001 	ld	(de),a
                           1002 ;src/main.c:252: actual->sprite=g_knifeX_0;
   660B DD 6E FE      [19] 1003 	ld	l,-2 (ix)
   660E DD 66 FF      [19] 1004 	ld	h,-1 (ix)
   6611 36 B8         [10] 1005 	ld	(hl),#<(_g_knifeX_0)
   6613 23            [ 6] 1006 	inc	hl
   6614 36 54         [10] 1007 	ld	(hl),#>(_g_knifeX_0)
                           1008 ;src/main.c:253: actual->eje = E_X;
   6616 DD 6E FC      [19] 1009 	ld	l,-4 (ix)
   6619 DD 66 FD      [19] 1010 	ld	h,-3 (ix)
   661C 36 00         [10] 1011 	ld	(hl),#0x00
                           1012 ;src/main.c:254: dibujarCuchillo(actual);
   661E C5            [11] 1013 	push	bc
   661F CD 53 64      [17] 1014 	call	_dibujarCuchillo
   6622 F1            [10] 1015 	pop	af
   6623 C3 0D 67      [10] 1016 	jp	00127$
   6626                    1017 00122$:
                           1018 ;src/main.c:257: else if(prota.mira == M_izquierda){
   6626 7D            [ 4] 1019 	ld	a,l
   6627 3D            [ 4] 1020 	dec	a
   6628 20 49         [12] 1021 	jr	NZ,00119$
                           1022 ;src/main.c:258: if( (prota.x - 4 ) >= G_KNIFEX_1_W + 1){
   662A 21 00 61      [10] 1023 	ld	hl, #_prota + 0
   662D 6E            [ 7] 1024 	ld	l,(hl)
   662E 26 00         [ 7] 1025 	ld	h,#0x00
   6630 7D            [ 4] 1026 	ld	a,l
   6631 C6 FC         [ 7] 1027 	add	a,#0xFC
   6633 6F            [ 4] 1028 	ld	l,a
   6634 7C            [ 4] 1029 	ld	a,h
   6635 CE FF         [ 7] 1030 	adc	a,#0xFF
   6637 67            [ 4] 1031 	ld	h,a
   6638 7D            [ 4] 1032 	ld	a,l
   6639 D6 04         [ 7] 1033 	sub	a, #0x04
   663B 7C            [ 4] 1034 	ld	a,h
   663C 17            [ 4] 1035 	rla
   663D 3F            [ 4] 1036 	ccf
   663E 1F            [ 4] 1037 	rra
   663F DE 80         [ 7] 1038 	sbc	a, #0x80
   6641 DA 0D 67      [10] 1039 	jp	C,00127$
                           1040 ;src/main.c:259: actual->lanzado = SI;
   6644 E1            [10] 1041 	pop	hl
   6645 E5            [11] 1042 	push	hl
   6646 36 01         [10] 1043 	ld	(hl),#0x01
                           1044 ;src/main.c:260: actual->direccion = M_izquierda;
   6648 FD 36 00 01   [19] 1045 	ld	0 (iy), #0x01
                           1046 ;src/main.c:261: actual->x = prota.x - G_KNIFEX_0_W;
   664C 3A 00 61      [13] 1047 	ld	a, (#_prota + 0)
   664F C6 FD         [ 7] 1048 	add	a,#0xFD
   6651 02            [ 7] 1049 	ld	(bc),a
                           1050 ;src/main.c:262: actual->y = prota.y + G_HERO_H /2;
   6652 3A 01 61      [13] 1051 	ld	a, (#(_prota + 0x0001) + 0)
   6655 C6 0B         [ 7] 1052 	add	a, #0x0B
   6657 12            [ 7] 1053 	ld	(de),a
                           1054 ;src/main.c:263: actual->sprite = g_knifeX_1;
   6658 DD 6E FE      [19] 1055 	ld	l,-2 (ix)
   665B DD 66 FF      [19] 1056 	ld	h,-1 (ix)
   665E 36 C1         [10] 1057 	ld	(hl),#<(_g_knifeX_1)
   6660 23            [ 6] 1058 	inc	hl
   6661 36 54         [10] 1059 	ld	(hl),#>(_g_knifeX_1)
                           1060 ;src/main.c:264: actual->eje = E_X;
   6663 DD 6E FC      [19] 1061 	ld	l,-4 (ix)
   6666 DD 66 FD      [19] 1062 	ld	h,-3 (ix)
   6669 36 00         [10] 1063 	ld	(hl),#0x00
                           1064 ;src/main.c:265: dibujarCuchillo(actual);
   666B C5            [11] 1065 	push	bc
   666C CD 53 64      [17] 1066 	call	_dibujarCuchillo
   666F F1            [10] 1067 	pop	af
   6670 C3 0D 67      [10] 1068 	jp	00127$
   6673                    1069 00119$:
                           1070 ;src/main.c:268: else if(prota.mira == M_abajo){
   6673 7D            [ 4] 1071 	ld	a,l
   6674 D6 03         [ 7] 1072 	sub	a, #0x03
   6676 20 4D         [12] 1073 	jr	NZ,00116$
                           1074 ;src/main.c:270: if((valor - (prota.y + G_HERO_H)) >= G_KNIFEY_0_H + 1){
   6678 21 01 61      [10] 1075 	ld	hl, #(_prota + 0x0001) + 0
   667B 6E            [ 7] 1076 	ld	l,(hl)
   667C 26 00         [ 7] 1077 	ld	h,#0x00
   667E D5            [11] 1078 	push	de
   667F 11 16 00      [10] 1079 	ld	de,#0x0016
   6682 19            [11] 1080 	add	hl, de
   6683 D1            [10] 1081 	pop	de
   6684 3E A8         [ 7] 1082 	ld	a,#0xA8
   6686 95            [ 4] 1083 	sub	a, l
   6687 6F            [ 4] 1084 	ld	l,a
   6688 3E 00         [ 7] 1085 	ld	a,#0x00
   668A 9C            [ 4] 1086 	sbc	a, h
   668B 67            [ 4] 1087 	ld	h,a
   668C 7D            [ 4] 1088 	ld	a,l
   668D D6 07         [ 7] 1089 	sub	a, #0x07
   668F 7C            [ 4] 1090 	ld	a,h
   6690 17            [ 4] 1091 	rla
   6691 3F            [ 4] 1092 	ccf
   6692 1F            [ 4] 1093 	rra
   6693 DE 80         [ 7] 1094 	sbc	a, #0x80
   6695 38 76         [12] 1095 	jr	C,00127$
                           1096 ;src/main.c:271: actual->lanzado = SI;
   6697 E1            [10] 1097 	pop	hl
   6698 E5            [11] 1098 	push	hl
   6699 36 01         [10] 1099 	ld	(hl),#0x01
                           1100 ;src/main.c:272: actual->direccion = M_abajo;
   669B FD 36 00 03   [19] 1101 	ld	0 (iy), #0x03
                           1102 ;src/main.c:273: actual->x = prota.x + G_HERO_W / 2;
   669F 3A 00 61      [13] 1103 	ld	a, (#_prota + 0)
   66A2 C6 03         [ 7] 1104 	add	a, #0x03
   66A4 02            [ 7] 1105 	ld	(bc),a
                           1106 ;src/main.c:274: actual->y = prota.y + G_HERO_H;
   66A5 3A 01 61      [13] 1107 	ld	a, (#(_prota + 0x0001) + 0)
   66A8 C6 16         [ 7] 1108 	add	a, #0x16
   66AA 12            [ 7] 1109 	ld	(de),a
                           1110 ;src/main.c:275: actual->sprite = g_knifeY_0;
   66AB DD 6E FE      [19] 1111 	ld	l,-2 (ix)
   66AE DD 66 FF      [19] 1112 	ld	h,-1 (ix)
   66B1 36 A0         [10] 1113 	ld	(hl),#<(_g_knifeY_0)
   66B3 23            [ 6] 1114 	inc	hl
   66B4 36 54         [10] 1115 	ld	(hl),#>(_g_knifeY_0)
                           1116 ;src/main.c:276: actual->eje = E_Y;
   66B6 DD 6E FC      [19] 1117 	ld	l,-4 (ix)
   66B9 DD 66 FD      [19] 1118 	ld	h,-3 (ix)
   66BC 36 01         [10] 1119 	ld	(hl),#0x01
                           1120 ;src/main.c:277: dibujarCuchillo(actual);
   66BE C5            [11] 1121 	push	bc
   66BF CD 53 64      [17] 1122 	call	_dibujarCuchillo
   66C2 F1            [10] 1123 	pop	af
   66C3 18 48         [12] 1124 	jr	00127$
   66C5                    1125 00116$:
                           1126 ;src/main.c:280: else if(prota.mira == M_arriba){
   66C5 7D            [ 4] 1127 	ld	a,l
   66C6 D6 02         [ 7] 1128 	sub	a, #0x02
   66C8 20 43         [12] 1129 	jr	NZ,00127$
                           1130 ;src/main.c:281: if((prota.y - 8)>= G_KNIFEY_0_H +1 ){
   66CA 21 01 61      [10] 1131 	ld	hl, #(_prota + 0x0001) + 0
   66CD 6E            [ 7] 1132 	ld	l,(hl)
   66CE 26 00         [ 7] 1133 	ld	h,#0x00
   66D0 7D            [ 4] 1134 	ld	a,l
   66D1 C6 F8         [ 7] 1135 	add	a,#0xF8
   66D3 6F            [ 4] 1136 	ld	l,a
   66D4 7C            [ 4] 1137 	ld	a,h
   66D5 CE FF         [ 7] 1138 	adc	a,#0xFF
   66D7 67            [ 4] 1139 	ld	h,a
   66D8 7D            [ 4] 1140 	ld	a,l
   66D9 D6 07         [ 7] 1141 	sub	a, #0x07
   66DB 7C            [ 4] 1142 	ld	a,h
   66DC 17            [ 4] 1143 	rla
   66DD 3F            [ 4] 1144 	ccf
   66DE 1F            [ 4] 1145 	rra
   66DF DE 80         [ 7] 1146 	sbc	a, #0x80
   66E1 38 2A         [12] 1147 	jr	C,00127$
                           1148 ;src/main.c:282: actual->lanzado = SI;
   66E3 E1            [10] 1149 	pop	hl
   66E4 E5            [11] 1150 	push	hl
   66E5 36 01         [10] 1151 	ld	(hl),#0x01
                           1152 ;src/main.c:283: actual->direccion = M_arriba;
   66E7 FD 36 00 02   [19] 1153 	ld	0 (iy), #0x02
                           1154 ;src/main.c:284: actual->x = prota.x + G_HERO_W / 2;
   66EB 3A 00 61      [13] 1155 	ld	a, (#_prota + 0)
   66EE C6 03         [ 7] 1156 	add	a, #0x03
   66F0 02            [ 7] 1157 	ld	(bc),a
                           1158 ;src/main.c:285: actual->y = prota.y;
   66F1 3A 01 61      [13] 1159 	ld	a, (#(_prota + 0x0001) + 0)
   66F4 12            [ 7] 1160 	ld	(de),a
                           1161 ;src/main.c:286: actual->sprite = g_knifeY_1;
   66F5 DD 6E FE      [19] 1162 	ld	l,-2 (ix)
   66F8 DD 66 FF      [19] 1163 	ld	h,-1 (ix)
   66FB 36 AC         [10] 1164 	ld	(hl),#<(_g_knifeY_1)
   66FD 23            [ 6] 1165 	inc	hl
   66FE 36 54         [10] 1166 	ld	(hl),#>(_g_knifeY_1)
                           1167 ;src/main.c:287: actual->eje = E_Y;
   6700 DD 6E FC      [19] 1168 	ld	l,-4 (ix)
   6703 DD 66 FD      [19] 1169 	ld	h,-3 (ix)
   6706 36 01         [10] 1170 	ld	(hl),#0x01
                           1171 ;src/main.c:288: dibujarCuchillo(actual);
   6708 C5            [11] 1172 	push	bc
   6709 CD 53 64      [17] 1173 	call	_dibujarCuchillo
   670C F1            [10] 1174 	pop	af
   670D                    1175 00127$:
   670D DD F9         [10] 1176 	ld	sp, ix
   670F DD E1         [14] 1177 	pop	ix
   6711 C9            [10] 1178 	ret
                           1179 ;src/main.c:294: void comprobarTeclado() {
                           1180 ;	---------------------------------
                           1181 ; Function comprobarTeclado
                           1182 ; ---------------------------------
   6712                    1183 _comprobarTeclado::
                           1184 ;src/main.c:295: cpct_scanKeyboard_if();
   6712 CD CA 57      [17] 1185 	call	_cpct_scanKeyboard_if
                           1186 ;src/main.c:297: if (cpct_isAnyKeyPressed()) {
   6715 CD BD 57      [17] 1187 	call	_cpct_isAnyKeyPressed
   6718 7D            [ 4] 1188 	ld	a,l
   6719 B7            [ 4] 1189 	or	a, a
   671A C8            [11] 1190 	ret	Z
                           1191 ;src/main.c:298: if (cpct_isKeyPressed(Key_CursorLeft))
   671B 21 01 01      [10] 1192 	ld	hl,#0x0101
   671E CD F3 56      [17] 1193 	call	_cpct_isKeyPressed
   6721 7D            [ 4] 1194 	ld	a,l
   6722 B7            [ 4] 1195 	or	a, a
                           1196 ;src/main.c:299: moverIzquierda();
   6723 C2 C9 63      [10] 1197 	jp	NZ,_moverIzquierda
                           1198 ;src/main.c:300: else if (cpct_isKeyPressed(Key_CursorRight))
   6726 21 00 02      [10] 1199 	ld	hl,#0x0200
   6729 CD F3 56      [17] 1200 	call	_cpct_isKeyPressed
   672C 7D            [ 4] 1201 	ld	a,l
   672D B7            [ 4] 1202 	or	a, a
                           1203 ;src/main.c:301: moverDerecha();
   672E C2 E8 63      [10] 1204 	jp	NZ,_moverDerecha
                           1205 ;src/main.c:302: else if (cpct_isKeyPressed(Key_CursorUp))
   6731 21 00 01      [10] 1206 	ld	hl,#0x0100
   6734 CD F3 56      [17] 1207 	call	_cpct_isKeyPressed
   6737 7D            [ 4] 1208 	ld	a,l
   6738 B7            [ 4] 1209 	or	a, a
                           1210 ;src/main.c:303: moverArriba();
   6739 C2 1B 64      [10] 1211 	jp	NZ,_moverArriba
                           1212 ;src/main.c:304: else if (cpct_isKeyPressed(Key_CursorDown))
   673C 21 00 04      [10] 1213 	ld	hl,#0x0400
   673F CD F3 56      [17] 1214 	call	_cpct_isKeyPressed
   6742 7D            [ 4] 1215 	ld	a,l
   6743 B7            [ 4] 1216 	or	a, a
                           1217 ;src/main.c:305: moverAbajo();
   6744 C2 37 64      [10] 1218 	jp	NZ,_moverAbajo
                           1219 ;src/main.c:306: else if (cpct_isKeyPressed(Key_Space))
   6747 21 05 80      [10] 1220 	ld	hl,#0x8005
   674A CD F3 56      [17] 1221 	call	_cpct_isKeyPressed
   674D 7D            [ 4] 1222 	ld	a,l
   674E B7            [ 4] 1223 	or	a, a
   674F C8            [11] 1224 	ret	Z
                           1225 ;src/main.c:307: lanzarCuchillo();
   6750 C3 78 65      [10] 1226 	jp  _lanzarCuchillo
                           1227 ;src/main.c:313: void moverCuchillo(){
                           1228 ;	---------------------------------
                           1229 ; Function moverCuchillo
                           1230 ; ---------------------------------
   6753                    1231 _moverCuchillo::
   6753 DD E5         [15] 1232 	push	ix
   6755 DD 21 00 00   [14] 1233 	ld	ix,#0
   6759 DD 39         [15] 1234 	add	ix,sp
   675B 3B            [ 6] 1235 	dec	sp
                           1236 ;src/main.c:315: u8 i = 10 + 1;
   675C DD 36 FF 0B   [19] 1237 	ld	-1 (ix),#0x0B
                           1238 ;src/main.c:316: TKnife* actual = cu;
   6760 11 08 61      [10] 1239 	ld	de,#_cu+0
                           1240 ;src/main.c:318: while(--i){
   6763                    1241 00134$:
   6763 DD 35 FF      [23] 1242 	dec	-1 (ix)
   6766 DD 7E FF      [19] 1243 	ld	a, -1 (ix)
   6769 B7            [ 4] 1244 	or	a, a
   676A CA 47 68      [10] 1245 	jp	Z,00137$
                           1246 ;src/main.c:319: if(actual->lanzado){
   676D 21 06 00      [10] 1247 	ld	hl,#0x0006
   6770 19            [11] 1248 	add	hl,de
   6771 4D            [ 4] 1249 	ld	c,l
   6772 44            [ 4] 1250 	ld	b,h
   6773 0A            [ 7] 1251 	ld	a,(bc)
   6774 B7            [ 4] 1252 	or	a, a
   6775 CA 3F 68      [10] 1253 	jp	Z,00133$
                           1254 ;src/main.c:320: if(actual->direccion == M_derecha){
   6778 D5            [11] 1255 	push	de
   6779 FD E1         [14] 1256 	pop	iy
   677B FD 6E 07      [19] 1257 	ld	l,7 (iy)
   677E 7D            [ 4] 1258 	ld	a,l
   677F B7            [ 4] 1259 	or	a, a
   6780 20 29         [12] 1260 	jr	NZ,00130$
                           1261 ;src/main.c:321: if(actual->x< LIMITE_DERECHO - G_KNIFEX_0_W){
   6782 1A            [ 7] 1262 	ld	a,(de)
   6783 6F            [ 4] 1263 	ld	l,a
   6784 D6 49         [ 7] 1264 	sub	a, #0x49
   6786 3E 00         [ 7] 1265 	ld	a,#0x00
   6788 17            [ 4] 1266 	rla
   6789 B7            [ 4] 1267 	or	a, a
   678A 28 0D         [12] 1268 	jr	Z,00104$
                           1269 ;src/main.c:322: actual->x++;
   678C 7D            [ 4] 1270 	ld	a,l
   678D 3C            [ 4] 1271 	inc	a
   678E 12            [ 7] 1272 	ld	(de),a
                           1273 ;src/main.c:324: redibujarCuchillo(actual);
   678F D5            [11] 1274 	push	de
   6790 D5            [11] 1275 	push	de
   6791 CD 47 65      [17] 1276 	call	_redibujarCuchillo
   6794 F1            [10] 1277 	pop	af
   6795 D1            [10] 1278 	pop	de
   6796 C3 3F 68      [10] 1279 	jp	00133$
   6799                    1280 00104$:
                           1281 ;src/main.c:326: else if(actual->x >= LIMITE_DERECHO  - G_KNIFEX_0_W){
   6799 B7            [ 4] 1282 	or	a, a
   679A C2 3F 68      [10] 1283 	jp	NZ,00133$
                           1284 ;src/main.c:327: borrarCuchillo(actual);
   679D C5            [11] 1285 	push	bc
   679E D5            [11] 1286 	push	de
   679F D5            [11] 1287 	push	de
   67A0 CD DD 64      [17] 1288 	call	_borrarCuchillo
   67A3 F1            [10] 1289 	pop	af
   67A4 D1            [10] 1290 	pop	de
   67A5 C1            [10] 1291 	pop	bc
                           1292 ;src/main.c:328: actual->lanzado = NO;
   67A6 AF            [ 4] 1293 	xor	a, a
   67A7 02            [ 7] 1294 	ld	(bc),a
   67A8 C3 3F 68      [10] 1295 	jp	00133$
   67AB                    1296 00130$:
                           1297 ;src/main.c:331: else if(actual->direccion == M_izquierda){
   67AB 7D            [ 4] 1298 	ld	a,l
   67AC 3D            [ 4] 1299 	dec	a
   67AD 20 29         [12] 1300 	jr	NZ,00127$
                           1301 ;src/main.c:321: if(actual->x< LIMITE_DERECHO - G_KNIFEX_0_W){
   67AF 1A            [ 7] 1302 	ld	a,(de)
   67B0 6F            [ 4] 1303 	ld	l,a
                           1304 ;src/main.c:332: if(actual->x > LIMITE_IZQUIERDO){
   67B1 3E 04         [ 7] 1305 	ld	a,#0x04
   67B3 95            [ 4] 1306 	sub	a, l
   67B4 3E 00         [ 7] 1307 	ld	a,#0x00
   67B6 17            [ 4] 1308 	rla
   67B7 B7            [ 4] 1309 	or	a, a
   67B8 28 0E         [12] 1310 	jr	Z,00109$
                           1311 ;src/main.c:333: actual->x--;
   67BA 4D            [ 4] 1312 	ld	c,l
   67BB 0D            [ 4] 1313 	dec	c
   67BC 79            [ 4] 1314 	ld	a,c
   67BD 12            [ 7] 1315 	ld	(de),a
                           1316 ;src/main.c:335: redibujarCuchillo(actual);
   67BE D5            [11] 1317 	push	de
   67BF D5            [11] 1318 	push	de
   67C0 CD 47 65      [17] 1319 	call	_redibujarCuchillo
   67C3 F1            [10] 1320 	pop	af
   67C4 D1            [10] 1321 	pop	de
   67C5 C3 3F 68      [10] 1322 	jp	00133$
   67C8                    1323 00109$:
                           1324 ;src/main.c:336: }else if(actual->x <= LIMITE_IZQUIERDO){
   67C8 B7            [ 4] 1325 	or	a, a
   67C9 20 74         [12] 1326 	jr	NZ,00133$
                           1327 ;src/main.c:337: borrarCuchillo(actual);
   67CB C5            [11] 1328 	push	bc
   67CC D5            [11] 1329 	push	de
   67CD D5            [11] 1330 	push	de
   67CE CD DD 64      [17] 1331 	call	_borrarCuchillo
   67D1 F1            [10] 1332 	pop	af
   67D2 D1            [10] 1333 	pop	de
   67D3 C1            [10] 1334 	pop	bc
                           1335 ;src/main.c:338: actual->lanzado = NO;
   67D4 AF            [ 4] 1336 	xor	a, a
   67D5 02            [ 7] 1337 	ld	(bc),a
   67D6 18 67         [12] 1338 	jr	00133$
   67D8                    1339 00127$:
                           1340 ;src/main.c:342: if(actual->y < LIMITE_INFERIOR - G_KNIFEY_0_H){
   67D8 D5            [11] 1341 	push	de
   67D9 FD E1         [14] 1342 	pop	iy
   67DB FD 23         [10] 1343 	inc	iy
                           1344 ;src/main.c:341: else if(actual->direccion == M_abajo){
   67DD 7D            [ 4] 1345 	ld	a,l
   67DE D6 03         [ 7] 1346 	sub	a, #0x03
   67E0 20 2D         [12] 1347 	jr	NZ,00124$
                           1348 ;src/main.c:342: if(actual->y < LIMITE_INFERIOR - G_KNIFEY_0_H){
   67E2 FD 6E 00      [19] 1349 	ld	l, 0 (iy)
   67E5 7D            [ 4] 1350 	ld	a,l
   67E6 D6 A2         [ 7] 1351 	sub	a, #0xA2
   67E8 3E 00         [ 7] 1352 	ld	a,#0x00
   67EA 17            [ 4] 1353 	rla
   67EB B7            [ 4] 1354 	or	a, a
   67EC 28 11         [12] 1355 	jr	Z,00114$
                           1356 ;src/main.c:343: actual->y++;
   67EE 2C            [ 4] 1357 	inc	l
   67EF FD 75 00      [19] 1358 	ld	0 (iy), l
                           1359 ;src/main.c:344: actual->y++;
   67F2 2C            [ 4] 1360 	inc	l
   67F3 FD 75 00      [19] 1361 	ld	0 (iy), l
                           1362 ;src/main.c:345: redibujarCuchillo(actual);
   67F6 D5            [11] 1363 	push	de
   67F7 D5            [11] 1364 	push	de
   67F8 CD 47 65      [17] 1365 	call	_redibujarCuchillo
   67FB F1            [10] 1366 	pop	af
   67FC D1            [10] 1367 	pop	de
   67FD 18 40         [12] 1368 	jr	00133$
   67FF                    1369 00114$:
                           1370 ;src/main.c:348: }else if(actual->y >= LIMITE_INFERIOR - G_KNIFEY_0_H ){
   67FF B7            [ 4] 1371 	or	a, a
   6800 20 3D         [12] 1372 	jr	NZ,00133$
                           1373 ;src/main.c:349: borrarCuchillo(actual);
   6802 C5            [11] 1374 	push	bc
   6803 D5            [11] 1375 	push	de
   6804 D5            [11] 1376 	push	de
   6805 CD DD 64      [17] 1377 	call	_borrarCuchillo
   6808 F1            [10] 1378 	pop	af
   6809 D1            [10] 1379 	pop	de
   680A C1            [10] 1380 	pop	bc
                           1381 ;src/main.c:350: actual->lanzado = NO;
   680B AF            [ 4] 1382 	xor	a, a
   680C 02            [ 7] 1383 	ld	(bc),a
   680D 18 30         [12] 1384 	jr	00133$
   680F                    1385 00124$:
                           1386 ;src/main.c:353: else if(actual->direccion == M_arriba){
   680F 7D            [ 4] 1387 	ld	a,l
   6810 D6 02         [ 7] 1388 	sub	a, #0x02
   6812 20 2B         [12] 1389 	jr	NZ,00133$
                           1390 ;src/main.c:342: if(actual->y < LIMITE_INFERIOR - G_KNIFEY_0_H){
   6814 FD 6E 00      [19] 1391 	ld	l, 0 (iy)
                           1392 ;src/main.c:354: if(actual->y > LIMITE_SUPERIOR){
   6817 3E 08         [ 7] 1393 	ld	a,#0x08
   6819 95            [ 4] 1394 	sub	a, l
   681A 3E 00         [ 7] 1395 	ld	a,#0x00
   681C 17            [ 4] 1396 	rla
   681D B7            [ 4] 1397 	or	a, a
   681E 28 11         [12] 1398 	jr	Z,00119$
                           1399 ;src/main.c:355: actual->y--;
   6820 2D            [ 4] 1400 	dec	l
   6821 FD 75 00      [19] 1401 	ld	0 (iy), l
                           1402 ;src/main.c:356: actual->y--;
   6824 2D            [ 4] 1403 	dec	l
   6825 FD 75 00      [19] 1404 	ld	0 (iy), l
                           1405 ;src/main.c:357: redibujarCuchillo(actual);
   6828 D5            [11] 1406 	push	de
   6829 D5            [11] 1407 	push	de
   682A CD 47 65      [17] 1408 	call	_redibujarCuchillo
   682D F1            [10] 1409 	pop	af
   682E D1            [10] 1410 	pop	de
   682F 18 0E         [12] 1411 	jr	00133$
   6831                    1412 00119$:
                           1413 ;src/main.c:359: }else if(actual->y <= LIMITE_SUPERIOR){
   6831 B7            [ 4] 1414 	or	a, a
   6832 20 0B         [12] 1415 	jr	NZ,00133$
                           1416 ;src/main.c:360: borrarCuchillo(actual);
   6834 C5            [11] 1417 	push	bc
   6835 D5            [11] 1418 	push	de
   6836 D5            [11] 1419 	push	de
   6837 CD DD 64      [17] 1420 	call	_borrarCuchillo
   683A F1            [10] 1421 	pop	af
   683B D1            [10] 1422 	pop	de
   683C C1            [10] 1423 	pop	bc
                           1424 ;src/main.c:361: actual->lanzado = NO;
   683D AF            [ 4] 1425 	xor	a, a
   683E 02            [ 7] 1426 	ld	(bc),a
   683F                    1427 00133$:
                           1428 ;src/main.c:365: ++actual;
   683F 21 09 00      [10] 1429 	ld	hl,#0x0009
   6842 19            [11] 1430 	add	hl,de
   6843 EB            [ 4] 1431 	ex	de,hl
   6844 C3 63 67      [10] 1432 	jp	00134$
   6847                    1433 00137$:
   6847 33            [ 6] 1434 	inc	sp
   6848 DD E1         [14] 1435 	pop	ix
   684A C9            [10] 1436 	ret
                           1437 ;src/main.c:369: void inicializar() {
                           1438 ;	---------------------------------
                           1439 ; Function inicializar
                           1440 ; ---------------------------------
   684B                    1441 _inicializar::
                           1442 ;src/main.c:372: TKnife* actual = cu;
                           1443 ;src/main.c:374: cpct_disableFirmware();
   684B CD 71 60      [17] 1444 	call	_cpct_disableFirmware
                           1445 ;src/main.c:375: cpct_setVideoMode(0);
   684E 2E 00         [ 7] 1446 	ld	l,#0x00
   6850 CD 3A 58      [17] 1447 	call	_cpct_setVideoMode
                           1448 ;src/main.c:377: cpct_setPalette(g_palette, 16);
   6853 21 10 00      [10] 1449 	ld	hl,#0x0010
   6856 E5            [11] 1450 	push	hl
   6857 21 92 55      [10] 1451 	ld	hl,#_g_palette
   685A E5            [11] 1452 	push	hl
   685B CD DC 56      [17] 1453 	call	_cpct_setPalette
                           1454 ;src/main.c:378: cpct_akp_musicInit(G_song);
   685E 21 00 3F      [10] 1455 	ld	hl,#_G_song
   6861 E5            [11] 1456 	push	hl
   6862 CD 4D 5F      [17] 1457 	call	_cpct_akp_musicInit
   6865 F1            [10] 1458 	pop	af
                           1459 ;src/main.c:379: mapa = g_map1;
   6866 21 C0 4D      [10] 1460 	ld	hl,#_g_map1+0
   6869 22 62 61      [16] 1461 	ld	(_mapa),hl
                           1462 ;src/main.c:380: num_mapa = 0;
   686C 21 64 61      [10] 1463 	ld	hl,#_num_mapa + 0
   686F 36 00         [10] 1464 	ld	(hl), #0x00
                           1465 ;src/main.c:381: cpct_etm_setTileset2x4(g_tileset);
   6871 21 CA 54      [10] 1466 	ld	hl,#_g_tileset
   6874 CD 8E 57      [17] 1467 	call	_cpct_etm_setTileset2x4
                           1468 ;src/main.c:382: dibujarMapa();
   6877 CD 65 61      [17] 1469 	call	_dibujarMapa
                           1470 ;src/main.c:385: prota.x = prota.px = 4;
   687A 21 02 61      [10] 1471 	ld	hl,#(_prota + 0x0002)
   687D 36 04         [10] 1472 	ld	(hl),#0x04
   687F 21 00 61      [10] 1473 	ld	hl,#_prota
   6882 36 04         [10] 1474 	ld	(hl),#0x04
                           1475 ;src/main.c:386: prota.y = prota.py = 80;
   6884 21 03 61      [10] 1476 	ld	hl,#(_prota + 0x0003)
   6887 36 50         [10] 1477 	ld	(hl),#0x50
   6889 21 01 61      [10] 1478 	ld	hl,#(_prota + 0x0001)
   688C 36 50         [10] 1479 	ld	(hl),#0x50
                           1480 ;src/main.c:387: prota.mover  = NO;
   688E 21 06 61      [10] 1481 	ld	hl,#(_prota + 0x0006)
   6891 36 00         [10] 1482 	ld	(hl),#0x00
                           1483 ;src/main.c:388: prota.mira=M_derecha;
   6893 21 07 61      [10] 1484 	ld	hl,#(_prota + 0x0007)
   6896 36 00         [10] 1485 	ld	(hl),#0x00
                           1486 ;src/main.c:389: prota.sprite = g_hero;
   6898 21 A2 55      [10] 1487 	ld	hl,#_g_hero
   689B 22 04 61      [16] 1488 	ld	((_prota + 0x0004)), hl
                           1489 ;src/main.c:392: i = 10 + 1;
   689E 0E 0B         [ 7] 1490 	ld	c,#0x0B
                           1491 ;src/main.c:395: while(--i){
   68A0 11 08 61      [10] 1492 	ld	de,#_cu
   68A3                    1493 00101$:
   68A3 41            [ 4] 1494 	ld	b,c
   68A4 05            [ 4] 1495 	dec	b
   68A5 78            [ 4] 1496 	ld	a,b
   68A6 4F            [ 4] 1497 	ld	c,a
   68A7 B7            [ 4] 1498 	or	a, a
   68A8 28 25         [12] 1499 	jr	Z,00103$
                           1500 ;src/main.c:396: actual->x = actual->px = 0;
   68AA 6B            [ 4] 1501 	ld	l, e
   68AB 62            [ 4] 1502 	ld	h, d
   68AC 23            [ 6] 1503 	inc	hl
   68AD 23            [ 6] 1504 	inc	hl
   68AE 36 00         [10] 1505 	ld	(hl),#0x00
   68B0 AF            [ 4] 1506 	xor	a, a
   68B1 12            [ 7] 1507 	ld	(de),a
                           1508 ;src/main.c:397: actual->y = actual->py = 0;
   68B2 D5            [11] 1509 	push	de
   68B3 FD E1         [14] 1510 	pop	iy
   68B5 FD 23         [10] 1511 	inc	iy
   68B7 6B            [ 4] 1512 	ld	l, e
   68B8 62            [ 4] 1513 	ld	h, d
   68B9 23            [ 6] 1514 	inc	hl
   68BA 23            [ 6] 1515 	inc	hl
   68BB 23            [ 6] 1516 	inc	hl
   68BC 36 00         [10] 1517 	ld	(hl),#0x00
   68BE FD 36 00 00   [19] 1518 	ld	0 (iy), #0x00
                           1519 ;src/main.c:398: actual->lanzado = 0;
   68C2 21 06 00      [10] 1520 	ld	hl,#0x0006
   68C5 19            [11] 1521 	add	hl,de
   68C6 36 00         [10] 1522 	ld	(hl),#0x00
                           1523 ;src/main.c:399: ++actual;
   68C8 21 09 00      [10] 1524 	ld	hl,#0x0009
   68CB 19            [11] 1525 	add	hl,de
   68CC EB            [ 4] 1526 	ex	de,hl
   68CD 18 D4         [12] 1527 	jr	00101$
   68CF                    1528 00103$:
                           1529 ;src/main.c:403: dibujarProta();
   68CF CD 81 61      [17] 1530 	call	_dibujarProta
   68D2 C9            [10] 1531 	ret
                           1532 ;src/main.c:406: void main(void) {
                           1533 ;	---------------------------------
                           1534 ; Function main
                           1535 ; ---------------------------------
   68D3                    1536 _main::
                           1537 ;src/main.c:409: inicializar();
   68D3 CD 4B 68      [17] 1538 	call	_inicializar
                           1539 ;src/main.c:410: cpct_akp_musicPlay();
   68D6 CD 4A 58      [17] 1540 	call	_cpct_akp_musicPlay
                           1541 ;src/main.c:413: while (1) {
   68D9                    1542 00104$:
                           1543 ;src/main.c:416: comprobarTeclado();
   68D9 CD 12 67      [17] 1544 	call	_comprobarTeclado
                           1545 ;src/main.c:418: cpct_waitVSYNC();
   68DC CD 32 58      [17] 1546 	call	_cpct_waitVSYNC
                           1547 ;src/main.c:419: moverCuchillo();
   68DF CD 53 67      [17] 1548 	call	_moverCuchillo
                           1549 ;src/main.c:421: if (prota.mover) {
   68E2 3A 06 61      [13] 1550 	ld	a, (#(_prota + 0x0006) + 0)
   68E5 B7            [ 4] 1551 	or	a, a
   68E6 28 F1         [12] 1552 	jr	Z,00104$
                           1553 ;src/main.c:423: redibujarProta();
   68E8 CD 0A 62      [17] 1554 	call	_redibujarProta
                           1555 ;src/main.c:424: prota.mover = NO;
   68EB 21 06 61      [10] 1556 	ld	hl,#(_prota + 0x0006)
   68EE 36 00         [10] 1557 	ld	(hl),#0x00
   68F0 18 E7         [12] 1558 	jr	00104$
                           1559 	.area _CODE
                           1560 	.area _INITIALIZER
                           1561 	.area _CABS (ABS)
   3F00                    1562 	.org 0x3F00
   3F00                    1563 _G_song:
   3F00 41                 1564 	.db #0x41	; 65	'A'
   3F01 54                 1565 	.db #0x54	; 84	'T'
   3F02 31                 1566 	.db #0x31	; 49	'1'
   3F03 30                 1567 	.db #0x30	; 48	'0'
   3F04 01                 1568 	.db #0x01	; 1
   3F05 40                 1569 	.db #0x40	; 64
   3F06 42                 1570 	.db #0x42	; 66	'B'
   3F07 0F                 1571 	.db #0x0F	; 15
   3F08 02                 1572 	.db #0x02	; 2
   3F09 06                 1573 	.db #0x06	; 6
   3F0A 1D                 1574 	.db #0x1D	; 29
   3F0B 00                 1575 	.db #0x00	; 0
   3F0C 10                 1576 	.db #0x10	; 16
   3F0D 40                 1577 	.db #0x40	; 64
   3F0E 19                 1578 	.db #0x19	; 25
   3F0F 40                 1579 	.db #0x40	; 64
   3F10 00                 1580 	.db #0x00	; 0
   3F11 00                 1581 	.db #0x00	; 0
   3F12 00                 1582 	.db #0x00	; 0
   3F13 00                 1583 	.db #0x00	; 0
   3F14 00                 1584 	.db #0x00	; 0
   3F15 00                 1585 	.db #0x00	; 0
   3F16 0D                 1586 	.db #0x0D	; 13
   3F17 12                 1587 	.db #0x12	; 18
   3F18 40                 1588 	.db #0x40	; 64
   3F19 01                 1589 	.db #0x01	; 1
   3F1A 00                 1590 	.db #0x00	; 0
   3F1B 7C                 1591 	.db #0x7C	; 124
   3F1C 18                 1592 	.db #0x18	; 24
   3F1D 78                 1593 	.db #0x78	; 120	'x'
   3F1E 0C                 1594 	.db #0x0C	; 12
   3F1F 34                 1595 	.db #0x34	; 52	'4'
   3F20 30                 1596 	.db #0x30	; 48	'0'
   3F21 2C                 1597 	.db #0x2C	; 44
   3F22 28                 1598 	.db #0x28	; 40
   3F23 24                 1599 	.db #0x24	; 36
   3F24 20                 1600 	.db #0x20	; 32
   3F25 1C                 1601 	.db #0x1C	; 28
   3F26 0D                 1602 	.db #0x0D	; 13
   3F27 25                 1603 	.db #0x25	; 37
   3F28 40                 1604 	.db #0x40	; 64
   3F29 20                 1605 	.db #0x20	; 32
   3F2A 00                 1606 	.db #0x00	; 0
   3F2B 00                 1607 	.db #0x00	; 0
   3F2C 00                 1608 	.db #0x00	; 0
   3F2D 39                 1609 	.db #0x39	; 57	'9'
   3F2E 40                 1610 	.db #0x40	; 64
   3F2F 00                 1611 	.db #0x00	; 0
   3F30 57                 1612 	.db #0x57	; 87	'W'
   3F31 40                 1613 	.db #0x40	; 64
   3F32 3B                 1614 	.db #0x3B	; 59
   3F33 40                 1615 	.db #0x40	; 64
   3F34 57                 1616 	.db #0x57	; 87	'W'
   3F35 40                 1617 	.db #0x40	; 64
   3F36 01                 1618 	.db #0x01	; 1
   3F37 2F                 1619 	.db #0x2F	; 47
   3F38 40                 1620 	.db #0x40	; 64
   3F39 19                 1621 	.db #0x19	; 25
   3F3A 00                 1622 	.db #0x00	; 0
   3F3B 76                 1623 	.db #0x76	; 118	'v'
   3F3C E1                 1624 	.db #0xE1	; 225
   3F3D 00                 1625 	.db #0x00	; 0
   3F3E 00                 1626 	.db #0x00	; 0
   3F3F 01                 1627 	.db #0x01	; 1
   3F40 04                 1628 	.db #0x04	; 4
   3F41 51                 1629 	.db #0x51	; 81	'Q'
   3F42 04                 1630 	.db #0x04	; 4
   3F43 37                 1631 	.db #0x37	; 55	'7'
   3F44 04                 1632 	.db #0x04	; 4
   3F45 4F                 1633 	.db #0x4F	; 79	'O'
   3F46 04                 1634 	.db #0x04	; 4
   3F47 37                 1635 	.db #0x37	; 55	'7'
   3F48 02                 1636 	.db #0x02	; 2
   3F49 4B                 1637 	.db #0x4B	; 75	'K'
   3F4A 02                 1638 	.db #0x02	; 2
   3F4B 37                 1639 	.db #0x37	; 55	'7'
   3F4C 04                 1640 	.db #0x04	; 4
   3F4D 4F                 1641 	.db #0x4F	; 79	'O'
   3F4E 04                 1642 	.db #0x04	; 4
   3F4F 37                 1643 	.db #0x37	; 55	'7'
   3F50 04                 1644 	.db #0x04	; 4
   3F51 4F                 1645 	.db #0x4F	; 79	'O'
   3F52 04                 1646 	.db #0x04	; 4
   3F53 37                 1647 	.db #0x37	; 55	'7'
   3F54 02                 1648 	.db #0x02	; 2
   3F55 4B                 1649 	.db #0x4B	; 75	'K'
   3F56 00                 1650 	.db #0x00	; 0
   3F57 42                 1651 	.db #0x42	; 66	'B'
   3F58 60                 1652 	.db #0x60	; 96
   3F59 00                 1653 	.db #0x00	; 0
   3F5A 42                 1654 	.db #0x42	; 66	'B'
   3F5B 80                 1655 	.db #0x80	; 128
   3F5C 00                 1656 	.db #0x00	; 0
   3F5D 00                 1657 	.db #0x00	; 0
   3F5E 42                 1658 	.db #0x42	; 66	'B'
   3F5F 00                 1659 	.db #0x00	; 0
   3F60 00                 1660 	.db #0x00	; 0
