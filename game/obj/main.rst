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
                             14 	.globl _comprobarTeclado
                             15 	.globl _moverAbajo
                             16 	.globl _moverArriba
                             17 	.globl _moverDerecha
                             18 	.globl _moverIzquierda
                             19 	.globl _redibujarProta
                             20 	.globl _borrarProta
                             21 	.globl _dibujarProta
                             22 	.globl _dibujarMapa
                             23 	.globl _cpct_etm_setTileset2x4
                             24 	.globl _cpct_etm_drawTileBox2x4
                             25 	.globl _cpct_akp_musicPlay
                             26 	.globl _cpct_akp_musicInit
                             27 	.globl _cpct_getScreenPtr
                             28 	.globl _cpct_setPalette
                             29 	.globl _cpct_waitVSYNC
                             30 	.globl _cpct_setVideoMode
                             31 	.globl _cpct_drawSpriteMaskedAlignedTable
                             32 	.globl _cpct_isAnyKeyPressed
                             33 	.globl _cpct_isKeyPressed
                             34 	.globl _cpct_scanKeyboard_if
                             35 	.globl _cpct_disableFirmware
                             36 	.globl _mapa
                             37 	.globl _prota
                             38 ;--------------------------------------------------------
                             39 ; special function registers
                             40 ;--------------------------------------------------------
                             41 ;--------------------------------------------------------
                             42 ; ram data
                             43 ;--------------------------------------------------------
                             44 	.area _DATA
   524E                      45 _prota::
   524E                      46 	.ds 7
   5255                      47 _mapa::
   5255                      48 	.ds 2
                             49 ;--------------------------------------------------------
                             50 ; ram data
                             51 ;--------------------------------------------------------
                             52 	.area _INITIALIZED
                             53 ;--------------------------------------------------------
                             54 ; absolute external ram data
                             55 ;--------------------------------------------------------
                             56 	.area _DABS (ABS)
                             57 ;--------------------------------------------------------
                             58 ; global & static initialisations
                             59 ;--------------------------------------------------------
                             60 	.area _HOME
                             61 	.area _GSINIT
                             62 	.area _GSFINAL
                             63 	.area _GSINIT
                             64 ;--------------------------------------------------------
                             65 ; Home
                             66 ;--------------------------------------------------------
                             67 	.area _HOME
                             68 	.area _HOME
                             69 ;--------------------------------------------------------
                             70 ; code
                             71 ;--------------------------------------------------------
                             72 	.area _CODE
                             73 ;src/main.c:43: cpctm_createTransparentMaskTable(g_tablatrans, 0x3F00, M0, 0);
                             74 ;	---------------------------------
                             75 ; Function dummy_cpct_transparentMaskTable0M0_container
                             76 ; ---------------------------------
   482C                      77 _dummy_cpct_transparentMaskTable0M0_container::
                             78 	.area _g_tablatrans_ (ABS) 
   3F00                      79 	.org 0x3F00 
   3F00                      80 	 _g_tablatrans::
   3F00 FF AA 55 00 AA AA    81 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3F08 55 00 55 00 00 00    82 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3F10 AA AA 00 00 AA AA    83 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3F18 00 00 00 00 00 00    84 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3F20 55 00 55 00 00 00    85 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3F28 55 00 55 00 00 00    86 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3F30 00 00 00 00 00 00    87 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3F38 00 00 00 00 00 00    88 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3F40 AA AA 00 00 AA AA    89 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3F48 00 00 00 00 00 00    90 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3F50 AA AA 00 00 AA AA    91 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   3F58 00 00 00 00 00 00    92 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3F60 00 00 00 00 00 00    93 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3F68 00 00 00 00 00 00    94 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3F70 00 00 00 00 00 00    95 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3F78 00 00 00 00 00 00    96 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3F80 55 00 55 00 00 00    97 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3F88 55 00 55 00 00 00    98 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3F90 00 00 00 00 00 00    99 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3F98 00 00 00 00 00 00   100 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3FA0 55 00 55 00 00 00   101 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3FA8 55 00 55 00 00 00   102 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3FB0 00 00 00 00 00 00   103 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3FB8 00 00 00 00 00 00   104 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3FC0 00 00 00 00 00 00   105 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3FC8 00 00 00 00 00 00   106 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3FD0 00 00 00 00 00 00   107 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3FD8 00 00 00 00 00 00   108 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3FE0 00 00 00 00 00 00   109 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3FE8 00 00 00 00 00 00   110 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3FF0 00 00 00 00 00 00   111 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   3FF8 00 00 00 00 00 00   112 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            113 	.area _CSEG (REL, CON) 
                            114 ;src/main.c:45: void dibujarMapa() {
                            115 ;	---------------------------------
                            116 ; Function dibujarMapa
                            117 ; ---------------------------------
   5257                     118 _dibujarMapa::
                            119 ;src/main.c:46: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   5257 2A 55 52      [16]  120 	ld	hl,(_mapa)
   525A E5            [11]  121 	push	hl
   525B 21 00 C0      [10]  122 	ld	hl,#0xC000
   525E E5            [11]  123 	push	hl
   525F 21 2C 28      [10]  124 	ld	hl,#0x282C
   5262 E5            [11]  125 	push	hl
   5263 2E 00         [ 7]  126 	ld	l, #0x00
   5265 E5            [11]  127 	push	hl
   5266 AF            [ 4]  128 	xor	a, a
   5267 F5            [11]  129 	push	af
   5268 33            [ 6]  130 	inc	sp
   5269 CD 4F 48      [17]  131 	call	_cpct_etm_drawTileBox2x4
   526C C9            [10]  132 	ret
                            133 ;src/main.c:51: void dibujarProta() {
                            134 ;	---------------------------------
                            135 ; Function dibujarProta
                            136 ; ---------------------------------
   526D                     137 _dibujarProta::
                            138 ;src/main.c:52: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   526D 21 4F 52      [10]  139 	ld	hl, #_prota + 1
   5270 56            [ 7]  140 	ld	d,(hl)
   5271 21 4E 52      [10]  141 	ld	hl, #_prota + 0
   5274 46            [ 7]  142 	ld	b,(hl)
   5275 D5            [11]  143 	push	de
   5276 33            [ 6]  144 	inc	sp
   5277 C5            [11]  145 	push	bc
   5278 33            [ 6]  146 	inc	sp
   5279 21 00 C0      [10]  147 	ld	hl,#0xC000
   527C E5            [11]  148 	push	hl
   527D CD F3 51      [17]  149 	call	_cpct_getScreenPtr
   5280 EB            [ 4]  150 	ex	de,hl
                            151 ;src/main.c:53: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   5281 ED 4B 52 52   [20]  152 	ld	bc, (#_prota + 4)
   5285 21 00 3F      [10]  153 	ld	hl,#_g_tablatrans
   5288 E5            [11]  154 	push	hl
   5289 21 08 1B      [10]  155 	ld	hl,#0x1B08
   528C E5            [11]  156 	push	hl
   528D D5            [11]  157 	push	de
   528E C5            [11]  158 	push	bc
   528F CD 13 52      [17]  159 	call	_cpct_drawSpriteMaskedAlignedTable
   5292 C9            [10]  160 	ret
                            161 ;src/main.c:56: void borrarProta() {
                            162 ;	---------------------------------
                            163 ; Function borrarProta
                            164 ; ---------------------------------
   5293                     165 _borrarProta::
   5293 DD E5         [15]  166 	push	ix
   5295 DD 21 00 00   [14]  167 	ld	ix,#0
   5299 DD 39         [15]  168 	add	ix,sp
   529B 3B            [ 6]  169 	dec	sp
                            170 ;src/main.c:57: u8 w = 4 + (prota.px & 1);
   529C 21 50 52      [10]  171 	ld	hl, #_prota + 2
   529F 4E            [ 7]  172 	ld	c,(hl)
   52A0 79            [ 4]  173 	ld	a,c
   52A1 E6 01         [ 7]  174 	and	a, #0x01
   52A3 47            [ 4]  175 	ld	b,a
   52A4 04            [ 4]  176 	inc	b
   52A5 04            [ 4]  177 	inc	b
   52A6 04            [ 4]  178 	inc	b
   52A7 04            [ 4]  179 	inc	b
                            180 ;src/main.c:58: u8 h = 7 + (prota.py & 3 ? 1 : 0);
   52A8 21 51 52      [10]  181 	ld	hl, #_prota + 3
   52AB 5E            [ 7]  182 	ld	e,(hl)
   52AC 7B            [ 4]  183 	ld	a,e
   52AD E6 03         [ 7]  184 	and	a, #0x03
   52AF 28 04         [12]  185 	jr	Z,00103$
   52B1 3E 01         [ 7]  186 	ld	a,#0x01
   52B3 18 02         [12]  187 	jr	00104$
   52B5                     188 00103$:
   52B5 3E 00         [ 7]  189 	ld	a,#0x00
   52B7                     190 00104$:
   52B7 C6 07         [ 7]  191 	add	a, #0x07
   52B9 DD 77 FF      [19]  192 	ld	-1 (ix),a
                            193 ;src/main.c:59: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   52BC FD 2A 55 52   [20]  194 	ld	iy,(_mapa)
   52C0 16 00         [ 7]  195 	ld	d,#0x00
   52C2 63            [ 4]  196 	ld	h,e
   52C3 6A            [ 4]  197 	ld	l,d
   52C4 CB 7A         [ 8]  198 	bit	7, d
   52C6 28 05         [12]  199 	jr	Z,00105$
   52C8 13            [ 6]  200 	inc	de
   52C9 13            [ 6]  201 	inc	de
   52CA 13            [ 6]  202 	inc	de
   52CB 63            [ 4]  203 	ld	h,e
   52CC 6A            [ 4]  204 	ld	l,d
   52CD                     205 00105$:
   52CD 5C            [ 4]  206 	ld	e, h
   52CE 55            [ 4]  207 	ld	d, l
   52CF CB 2A         [ 8]  208 	sra	d
   52D1 CB 1B         [ 8]  209 	rr	e
   52D3 CB 2A         [ 8]  210 	sra	d
   52D5 CB 1B         [ 8]  211 	rr	e
   52D7 51            [ 4]  212 	ld	d,c
   52D8 CB 3A         [ 8]  213 	srl	d
   52DA FD E5         [15]  214 	push	iy
   52DC 21 00 C0      [10]  215 	ld	hl,#0xC000
   52DF E5            [11]  216 	push	hl
   52E0 3E 28         [ 7]  217 	ld	a,#0x28
   52E2 F5            [11]  218 	push	af
   52E3 33            [ 6]  219 	inc	sp
   52E4 DD 7E FF      [19]  220 	ld	a,-1 (ix)
   52E7 F5            [11]  221 	push	af
   52E8 33            [ 6]  222 	inc	sp
   52E9 C5            [11]  223 	push	bc
   52EA 33            [ 6]  224 	inc	sp
   52EB 7B            [ 4]  225 	ld	a,e
   52EC F5            [11]  226 	push	af
   52ED 33            [ 6]  227 	inc	sp
   52EE D5            [11]  228 	push	de
   52EF 33            [ 6]  229 	inc	sp
   52F0 CD 4F 48      [17]  230 	call	_cpct_etm_drawTileBox2x4
   52F3 33            [ 6]  231 	inc	sp
   52F4 DD E1         [14]  232 	pop	ix
   52F6 C9            [10]  233 	ret
                            234 ;src/main.c:62: void redibujarProta() {
                            235 ;	---------------------------------
                            236 ; Function redibujarProta
                            237 ; ---------------------------------
   52F7                     238 _redibujarProta::
                            239 ;src/main.c:63: borrarProta();
   52F7 CD 93 52      [17]  240 	call	_borrarProta
                            241 ;src/main.c:64: prota.px = prota.x;
   52FA 01 50 52      [10]  242 	ld	bc,#_prota + 2
   52FD 3A 4E 52      [13]  243 	ld	a, (#_prota + 0)
   5300 02            [ 7]  244 	ld	(bc),a
                            245 ;src/main.c:65: prota.py = prota.y;
   5301 01 51 52      [10]  246 	ld	bc,#_prota + 3
   5304 3A 4F 52      [13]  247 	ld	a, (#_prota + 1)
   5307 02            [ 7]  248 	ld	(bc),a
                            249 ;src/main.c:66: dibujarProta();
   5308 C3 6D 52      [10]  250 	jp  _dibujarProta
                            251 ;src/main.c:69: void moverIzquierda() {
                            252 ;	---------------------------------
                            253 ; Function moverIzquierda
                            254 ; ---------------------------------
   530B                     255 _moverIzquierda::
                            256 ;src/main.c:70: if (prota.x > 0) {
   530B 01 4E 52      [10]  257 	ld	bc,#_prota+0
   530E 0A            [ 7]  258 	ld	a,(bc)
   530F B7            [ 4]  259 	or	a, a
   5310 C8            [11]  260 	ret	Z
                            261 ;src/main.c:71: prota.x--;
   5311 C6 FF         [ 7]  262 	add	a,#0xFF
   5313 02            [ 7]  263 	ld	(bc),a
                            264 ;src/main.c:72: prota.mover  = SI;
   5314 21 54 52      [10]  265 	ld	hl,#(_prota + 0x0006)
   5317 36 01         [10]  266 	ld	(hl),#0x01
   5319 C9            [10]  267 	ret
                            268 ;src/main.c:76: void moverDerecha() {
                            269 ;	---------------------------------
                            270 ; Function moverDerecha
                            271 ; ---------------------------------
   531A                     272 _moverDerecha::
                            273 ;src/main.c:77: if (prota.x < LIMITE_DERECHO) {
   531A 21 4E 52      [10]  274 	ld	hl,#_prota+0
   531D 4E            [ 7]  275 	ld	c,(hl)
   531E 79            [ 4]  276 	ld	a,c
   531F D6 48         [ 7]  277 	sub	a, #0x48
   5321 D0            [11]  278 	ret	NC
                            279 ;src/main.c:78: prota.x++;
   5322 0C            [ 4]  280 	inc	c
   5323 71            [ 7]  281 	ld	(hl),c
                            282 ;src/main.c:79: prota.mover  = SI;
   5324 21 54 52      [10]  283 	ld	hl,#(_prota + 0x0006)
   5327 36 01         [10]  284 	ld	(hl),#0x01
   5329 C9            [10]  285 	ret
                            286 ;src/main.c:83: void moverArriba() {
                            287 ;	---------------------------------
                            288 ; Function moverArriba
                            289 ; ---------------------------------
   532A                     290 _moverArriba::
                            291 ;src/main.c:84: if (prota.y > 0) {
   532A 01 4F 52      [10]  292 	ld	bc,#_prota + 1
   532D 0A            [ 7]  293 	ld	a,(bc)
   532E B7            [ 4]  294 	or	a, a
   532F C8            [11]  295 	ret	Z
                            296 ;src/main.c:85: prota.y--;
   5330 C6 FF         [ 7]  297 	add	a,#0xFF
   5332 02            [ 7]  298 	ld	(bc),a
                            299 ;src/main.c:86: prota.mover  = SI;
   5333 21 54 52      [10]  300 	ld	hl,#(_prota + 0x0006)
   5336 36 01         [10]  301 	ld	(hl),#0x01
   5338 C9            [10]  302 	ret
                            303 ;src/main.c:90: void moverAbajo() {
                            304 ;	---------------------------------
                            305 ; Function moverAbajo
                            306 ; ---------------------------------
   5339                     307 _moverAbajo::
                            308 ;src/main.c:91: prota.y++;
   5339 01 4F 52      [10]  309 	ld	bc,#_prota + 1
   533C 0A            [ 7]  310 	ld	a,(bc)
   533D 3C            [ 4]  311 	inc	a
   533E 02            [ 7]  312 	ld	(bc),a
                            313 ;src/main.c:92: prota.mover  = SI;
   533F 21 54 52      [10]  314 	ld	hl,#(_prota + 0x0006)
   5342 36 01         [10]  315 	ld	(hl),#0x01
   5344 C9            [10]  316 	ret
                            317 ;src/main.c:95: void comprobarTeclado() {
                            318 ;	---------------------------------
                            319 ; Function comprobarTeclado
                            320 ; ---------------------------------
   5345                     321 _comprobarTeclado::
                            322 ;src/main.c:96: cpct_scanKeyboard_if();
   5345 CD 1A 49      [17]  323 	call	_cpct_scanKeyboard_if
                            324 ;src/main.c:98: if (cpct_isAnyKeyPressed()) {
   5348 CD 0D 49      [17]  325 	call	_cpct_isAnyKeyPressed
   534B 7D            [ 4]  326 	ld	a,l
   534C B7            [ 4]  327 	or	a, a
   534D C8            [11]  328 	ret	Z
                            329 ;src/main.c:99: if (cpct_isKeyPressed(Key_CursorLeft))
   534E 21 01 01      [10]  330 	ld	hl,#0x0101
   5351 CD 43 48      [17]  331 	call	_cpct_isKeyPressed
   5354 7D            [ 4]  332 	ld	a,l
   5355 B7            [ 4]  333 	or	a, a
                            334 ;src/main.c:100: moverIzquierda();
   5356 C2 0B 53      [10]  335 	jp	NZ,_moverIzquierda
                            336 ;src/main.c:101: else if (cpct_isKeyPressed(Key_CursorRight))
   5359 21 00 02      [10]  337 	ld	hl,#0x0200
   535C CD 43 48      [17]  338 	call	_cpct_isKeyPressed
   535F 7D            [ 4]  339 	ld	a,l
   5360 B7            [ 4]  340 	or	a, a
                            341 ;src/main.c:102: moverDerecha();
   5361 C2 1A 53      [10]  342 	jp	NZ,_moverDerecha
                            343 ;src/main.c:103: else if (cpct_isKeyPressed(Key_CursorUp))
   5364 21 00 01      [10]  344 	ld	hl,#0x0100
   5367 CD 43 48      [17]  345 	call	_cpct_isKeyPressed
   536A 7D            [ 4]  346 	ld	a,l
   536B B7            [ 4]  347 	or	a, a
                            348 ;src/main.c:104: moverArriba();
   536C C2 2A 53      [10]  349 	jp	NZ,_moverArriba
                            350 ;src/main.c:105: else if (cpct_isKeyPressed(Key_CursorDown))
   536F 21 00 04      [10]  351 	ld	hl,#0x0400
   5372 CD 43 48      [17]  352 	call	_cpct_isKeyPressed
   5375 7D            [ 4]  353 	ld	a,l
   5376 B7            [ 4]  354 	or	a, a
   5377 C8            [11]  355 	ret	Z
                            356 ;src/main.c:106: moverAbajo();
   5378 C3 39 53      [10]  357 	jp  _moverAbajo
                            358 ;src/main.c:110: void inicializar() {
                            359 ;	---------------------------------
                            360 ; Function inicializar
                            361 ; ---------------------------------
   537B                     362 _inicializar::
                            363 ;src/main.c:111: cpct_disableFirmware();
   537B CD C1 51      [17]  364 	call	_cpct_disableFirmware
                            365 ;src/main.c:112: cpct_setVideoMode(0);
   537E 2E 00         [ 7]  366 	ld	l,#0x00
   5380 CD 8A 49      [17]  367 	call	_cpct_setVideoMode
                            368 ;src/main.c:114: cpct_setPalette(g_palette, 16);
   5383 21 10 00      [10]  369 	ld	hl,#0x0010
   5386 E5            [11]  370 	push	hl
   5387 21 44 47      [10]  371 	ld	hl,#_g_palette
   538A E5            [11]  372 	push	hl
   538B CD 2C 48      [17]  373 	call	_cpct_setPalette
                            374 ;src/main.c:115: cpct_akp_musicInit(G_song);
   538E 21 00 02      [10]  375 	ld	hl,#_G_song
   5391 E5            [11]  376 	push	hl
   5392 CD 9D 50      [17]  377 	call	_cpct_akp_musicInit
   5395 F1            [10]  378 	pop	af
                            379 ;src/main.c:116: mapa = g_map1;
   5396 21 00 40      [10]  380 	ld	hl,#_g_map1+0
   5399 22 55 52      [16]  381 	ld	(_mapa),hl
                            382 ;src/main.c:117: cpct_etm_setTileset2x4(g_tileset);
   539C 21 E0 46      [10]  383 	ld	hl,#_g_tileset
   539F CD DE 48      [17]  384 	call	_cpct_etm_setTileset2x4
                            385 ;src/main.c:118: dibujarMapa();
   53A2 CD 57 52      [17]  386 	call	_dibujarMapa
                            387 ;src/main.c:121: prota.x = prota.px = 15;
   53A5 21 50 52      [10]  388 	ld	hl,#(_prota + 0x0002)
   53A8 36 0F         [10]  389 	ld	(hl),#0x0F
   53AA 21 4E 52      [10]  390 	ld	hl,#_prota
   53AD 36 0F         [10]  391 	ld	(hl),#0x0F
                            392 ;src/main.c:122: prota.y = prota.py = 120;
   53AF 21 51 52      [10]  393 	ld	hl,#(_prota + 0x0003)
   53B2 36 78         [10]  394 	ld	(hl),#0x78
   53B4 21 4F 52      [10]  395 	ld	hl,#(_prota + 0x0001)
   53B7 36 78         [10]  396 	ld	(hl),#0x78
                            397 ;src/main.c:123: prota.mover  = NO;
   53B9 21 54 52      [10]  398 	ld	hl,#(_prota + 0x0006)
   53BC 36 00         [10]  399 	ld	(hl),#0x00
                            400 ;src/main.c:124: prota.sprite = g_hero;
   53BE 21 54 47      [10]  401 	ld	hl,#_g_hero
   53C1 22 52 52      [16]  402 	ld	((_prota + 0x0004)), hl
                            403 ;src/main.c:125: dibujarProta();
   53C4 CD 6D 52      [17]  404 	call	_dibujarProta
   53C7 C9            [10]  405 	ret
                            406 ;src/main.c:129: void main(void) {
                            407 ;	---------------------------------
                            408 ; Function main
                            409 ; ---------------------------------
   53C8                     410 _main::
                            411 ;src/main.c:130: inicializar();
   53C8 CD 7B 53      [17]  412 	call	_inicializar
                            413 ;src/main.c:131: while (1) {
   53CB                     414 00104$:
                            415 ;src/main.c:132: comprobarTeclado();
   53CB CD 45 53      [17]  416 	call	_comprobarTeclado
                            417 ;src/main.c:133: cpct_akp_musicPlay();
   53CE CD 9A 49      [17]  418 	call	_cpct_akp_musicPlay
                            419 ;src/main.c:134: if (prota.mover) {
   53D1 01 54 52      [10]  420 	ld	bc,#_prota+6
   53D4 0A            [ 7]  421 	ld	a,(bc)
   53D5 B7            [ 4]  422 	or	a, a
   53D6 28 07         [12]  423 	jr	Z,00102$
                            424 ;src/main.c:135: redibujarProta();
   53D8 C5            [11]  425 	push	bc
   53D9 CD F7 52      [17]  426 	call	_redibujarProta
   53DC C1            [10]  427 	pop	bc
                            428 ;src/main.c:136: prota.mover = NO;
   53DD AF            [ 4]  429 	xor	a, a
   53DE 02            [ 7]  430 	ld	(bc),a
   53DF                     431 00102$:
                            432 ;src/main.c:138: cpct_waitVSYNC();
   53DF CD 82 49      [17]  433 	call	_cpct_waitVSYNC
   53E2 18 E7         [12]  434 	jr	00104$
                            435 	.area _CODE
                            436 	.area _INITIALIZER
                            437 	.area _CABS (ABS)
   0200                     438 	.org 0x0200
   0200                     439 _G_song:
   0200 41                  440 	.db #0x41	; 65	'A'
   0201 54                  441 	.db #0x54	; 84	'T'
   0202 31                  442 	.db #0x31	; 49	'1'
   0203 30                  443 	.db #0x30	; 48	'0'
   0204 01                  444 	.db #0x01	; 1
   0205 40                  445 	.db #0x40	; 64
   0206 42                  446 	.db #0x42	; 66	'B'
   0207 0F                  447 	.db #0x0F	; 15
   0208 02                  448 	.db #0x02	; 2
   0209 06                  449 	.db #0x06	; 6
   020A 1D                  450 	.db #0x1D	; 29
   020B 00                  451 	.db #0x00	; 0
   020C 10                  452 	.db #0x10	; 16
   020D 40                  453 	.db #0x40	; 64
   020E 19                  454 	.db #0x19	; 25
   020F 40                  455 	.db #0x40	; 64
   0210 00                  456 	.db #0x00	; 0
   0211 00                  457 	.db #0x00	; 0
   0212 00                  458 	.db #0x00	; 0
   0213 00                  459 	.db #0x00	; 0
   0214 00                  460 	.db #0x00	; 0
   0215 00                  461 	.db #0x00	; 0
   0216 0D                  462 	.db #0x0D	; 13
   0217 12                  463 	.db #0x12	; 18
   0218 40                  464 	.db #0x40	; 64
   0219 01                  465 	.db #0x01	; 1
   021A 00                  466 	.db #0x00	; 0
   021B 7C                  467 	.db #0x7C	; 124
   021C 18                  468 	.db #0x18	; 24
   021D 78                  469 	.db #0x78	; 120	'x'
   021E 0C                  470 	.db #0x0C	; 12
   021F 34                  471 	.db #0x34	; 52	'4'
   0220 30                  472 	.db #0x30	; 48	'0'
   0221 2C                  473 	.db #0x2C	; 44
   0222 28                  474 	.db #0x28	; 40
   0223 24                  475 	.db #0x24	; 36
   0224 20                  476 	.db #0x20	; 32
   0225 1C                  477 	.db #0x1C	; 28
   0226 0D                  478 	.db #0x0D	; 13
   0227 25                  479 	.db #0x25	; 37
   0228 40                  480 	.db #0x40	; 64
   0229 20                  481 	.db #0x20	; 32
   022A 00                  482 	.db #0x00	; 0
   022B 00                  483 	.db #0x00	; 0
   022C 00                  484 	.db #0x00	; 0
   022D 39                  485 	.db #0x39	; 57	'9'
   022E 40                  486 	.db #0x40	; 64
   022F 00                  487 	.db #0x00	; 0
   0230 57                  488 	.db #0x57	; 87	'W'
   0231 40                  489 	.db #0x40	; 64
   0232 3B                  490 	.db #0x3B	; 59
   0233 40                  491 	.db #0x40	; 64
   0234 57                  492 	.db #0x57	; 87	'W'
   0235 40                  493 	.db #0x40	; 64
   0236 01                  494 	.db #0x01	; 1
   0237 2F                  495 	.db #0x2F	; 47
   0238 40                  496 	.db #0x40	; 64
   0239 19                  497 	.db #0x19	; 25
   023A 00                  498 	.db #0x00	; 0
   023B 76                  499 	.db #0x76	; 118	'v'
   023C E1                  500 	.db #0xE1	; 225
   023D 00                  501 	.db #0x00	; 0
   023E 00                  502 	.db #0x00	; 0
   023F 01                  503 	.db #0x01	; 1
   0240 04                  504 	.db #0x04	; 4
   0241 51                  505 	.db #0x51	; 81	'Q'
   0242 04                  506 	.db #0x04	; 4
   0243 37                  507 	.db #0x37	; 55	'7'
   0244 04                  508 	.db #0x04	; 4
   0245 4F                  509 	.db #0x4F	; 79	'O'
   0246 04                  510 	.db #0x04	; 4
   0247 37                  511 	.db #0x37	; 55	'7'
   0248 02                  512 	.db #0x02	; 2
   0249 4B                  513 	.db #0x4B	; 75	'K'
   024A 02                  514 	.db #0x02	; 2
   024B 37                  515 	.db #0x37	; 55	'7'
   024C 04                  516 	.db #0x04	; 4
   024D 4F                  517 	.db #0x4F	; 79	'O'
   024E 04                  518 	.db #0x04	; 4
   024F 37                  519 	.db #0x37	; 55	'7'
   0250 04                  520 	.db #0x04	; 4
   0251 4F                  521 	.db #0x4F	; 79	'O'
   0252 04                  522 	.db #0x04	; 4
   0253 37                  523 	.db #0x37	; 55	'7'
   0254 02                  524 	.db #0x02	; 2
   0255 4B                  525 	.db #0x4B	; 75	'K'
   0256 00                  526 	.db #0x00	; 0
   0257 42                  527 	.db #0x42	; 66	'B'
   0258 60                  528 	.db #0x60	; 96
   0259 00                  529 	.db #0x00	; 0
   025A 42                  530 	.db #0x42	; 66	'B'
   025B 80                  531 	.db #0x80	; 128
   025C 00                  532 	.db #0x00	; 0
   025D 00                  533 	.db #0x00	; 0
   025E 42                  534 	.db #0x42	; 66	'B'
   025F 00                  535 	.db #0x00	; 0
   0260 00                  536 	.db #0x00	; 0
