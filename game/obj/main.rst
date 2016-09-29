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
   5257                      45 _prota::
   5257                      46 	.ds 7
   525E                      47 _mapa::
   525E                      48 	.ds 2
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
                             73 ;src/main.c:47: cpctm_createTransparentMaskTable(g_tablatrans, 0x3F00, M0, 0); // es el color 8 - 4D - FF00FF
                             74 ;	---------------------------------
                             75 ; Function dummy_cpct_transparentMaskTable0M0_container
                             76 ; ---------------------------------
   4835                      77 _dummy_cpct_transparentMaskTable0M0_container::
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
                            114 ;src/main.c:49: void dibujarMapa() {
                            115 ;	---------------------------------
                            116 ; Function dibujarMapa
                            117 ; ---------------------------------
   5260                     118 _dibujarMapa::
                            119 ;src/main.c:50: cpct_etm_drawTilemap2x4 (g_map1_W, g_map1_H, ORIGEN_MAPA, mapa);
   5260 2A 5E 52      [16]  120 	ld	hl,(_mapa)
   5263 E5            [11]  121 	push	hl
   5264 21 00 C0      [10]  122 	ld	hl,#0xC000
   5267 E5            [11]  123 	push	hl
   5268 21 2C 28      [10]  124 	ld	hl,#0x282C
   526B E5            [11]  125 	push	hl
   526C 2E 00         [ 7]  126 	ld	l, #0x00
   526E E5            [11]  127 	push	hl
   526F AF            [ 4]  128 	xor	a, a
   5270 F5            [11]  129 	push	af
   5271 33            [ 6]  130 	inc	sp
   5272 CD 58 48      [17]  131 	call	_cpct_etm_drawTileBox2x4
   5275 C9            [10]  132 	ret
                            133 ;src/main.c:55: void dibujarProta() {
                            134 ;	---------------------------------
                            135 ; Function dibujarProta
                            136 ; ---------------------------------
   5276                     137 _dibujarProta::
                            138 ;src/main.c:56: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, prota.x, prota.y);
   5276 21 58 52      [10]  139 	ld	hl, #_prota + 1
   5279 56            [ 7]  140 	ld	d,(hl)
   527A 21 57 52      [10]  141 	ld	hl, #_prota + 0
   527D 46            [ 7]  142 	ld	b,(hl)
   527E D5            [11]  143 	push	de
   527F 33            [ 6]  144 	inc	sp
   5280 C5            [11]  145 	push	bc
   5281 33            [ 6]  146 	inc	sp
   5282 21 00 C0      [10]  147 	ld	hl,#0xC000
   5285 E5            [11]  148 	push	hl
   5286 CD FC 51      [17]  149 	call	_cpct_getScreenPtr
   5289 EB            [ 4]  150 	ex	de,hl
                            151 ;src/main.c:57: cpct_drawSpriteMaskedAlignedTable (prota.sprite, pvmem, G_HERO_W, G_HERO_H, g_tablatrans);
   528A ED 4B 5B 52   [20]  152 	ld	bc, (#_prota + 4)
   528E 21 00 3F      [10]  153 	ld	hl,#_g_tablatrans
   5291 E5            [11]  154 	push	hl
   5292 21 09 19      [10]  155 	ld	hl,#0x1909
   5295 E5            [11]  156 	push	hl
   5296 D5            [11]  157 	push	de
   5297 C5            [11]  158 	push	bc
   5298 CD 1C 52      [17]  159 	call	_cpct_drawSpriteMaskedAlignedTable
   529B C9            [10]  160 	ret
                            161 ;src/main.c:60: void borrarProta() {
                            162 ;	---------------------------------
                            163 ; Function borrarProta
                            164 ; ---------------------------------
   529C                     165 _borrarProta::
                            166 ;src/main.c:67: cpct_etm_drawTileBox2x4 (prota.px / 2, (prota.py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, ORIGEN_MAPA, mapa);
   529C ED 4B 5E 52   [20]  167 	ld	bc,(_mapa)
   52A0 21 5A 52      [10]  168 	ld	hl, #_prota + 3
   52A3 5E            [ 7]  169 	ld	e,(hl)
   52A4 16 00         [ 7]  170 	ld	d,#0x00
   52A6 63            [ 4]  171 	ld	h,e
   52A7 6A            [ 4]  172 	ld	l,d
   52A8 CB 7A         [ 8]  173 	bit	7, d
   52AA 28 05         [12]  174 	jr	Z,00103$
   52AC 13            [ 6]  175 	inc	de
   52AD 13            [ 6]  176 	inc	de
   52AE 13            [ 6]  177 	inc	de
   52AF 63            [ 4]  178 	ld	h,e
   52B0 6A            [ 4]  179 	ld	l,d
   52B1                     180 00103$:
   52B1 5C            [ 4]  181 	ld	e, h
   52B2 55            [ 4]  182 	ld	d, l
   52B3 CB 2A         [ 8]  183 	sra	d
   52B5 CB 1B         [ 8]  184 	rr	e
   52B7 CB 2A         [ 8]  185 	sra	d
   52B9 CB 1B         [ 8]  186 	rr	e
   52BB 3A 59 52      [13]  187 	ld	a, (#_prota + 2)
   52BE CB 3F         [ 8]  188 	srl	a
   52C0 57            [ 4]  189 	ld	d,a
   52C1 C5            [11]  190 	push	bc
   52C2 21 00 C0      [10]  191 	ld	hl,#0xC000
   52C5 E5            [11]  192 	push	hl
   52C6 21 08 28      [10]  193 	ld	hl,#0x2808
   52C9 E5            [11]  194 	push	hl
   52CA 3E 05         [ 7]  195 	ld	a,#0x05
   52CC F5            [11]  196 	push	af
   52CD 33            [ 6]  197 	inc	sp
   52CE 7B            [ 4]  198 	ld	a,e
   52CF F5            [11]  199 	push	af
   52D0 33            [ 6]  200 	inc	sp
   52D1 D5            [11]  201 	push	de
   52D2 33            [ 6]  202 	inc	sp
   52D3 CD 58 48      [17]  203 	call	_cpct_etm_drawTileBox2x4
   52D6 C9            [10]  204 	ret
                            205 ;src/main.c:70: void redibujarProta() {
                            206 ;	---------------------------------
                            207 ; Function redibujarProta
                            208 ; ---------------------------------
   52D7                     209 _redibujarProta::
                            210 ;src/main.c:71: borrarProta();
   52D7 CD 9C 52      [17]  211 	call	_borrarProta
                            212 ;src/main.c:72: prota.px = prota.x;
   52DA 01 59 52      [10]  213 	ld	bc,#_prota + 2
   52DD 3A 57 52      [13]  214 	ld	a, (#_prota + 0)
   52E0 02            [ 7]  215 	ld	(bc),a
                            216 ;src/main.c:73: prota.py = prota.y;
   52E1 01 5A 52      [10]  217 	ld	bc,#_prota + 3
   52E4 3A 58 52      [13]  218 	ld	a, (#_prota + 1)
   52E7 02            [ 7]  219 	ld	(bc),a
                            220 ;src/main.c:74: dibujarProta();
   52E8 C3 76 52      [10]  221 	jp  _dibujarProta
                            222 ;src/main.c:77: void moverIzquierda() {
                            223 ;	---------------------------------
                            224 ; Function moverIzquierda
                            225 ; ---------------------------------
   52EB                     226 _moverIzquierda::
                            227 ;src/main.c:78: if (prota.x > 0) {
   52EB 01 57 52      [10]  228 	ld	bc,#_prota+0
   52EE 0A            [ 7]  229 	ld	a,(bc)
   52EF B7            [ 4]  230 	or	a, a
   52F0 C8            [11]  231 	ret	Z
                            232 ;src/main.c:79: prota.x--;
   52F1 C6 FF         [ 7]  233 	add	a,#0xFF
   52F3 02            [ 7]  234 	ld	(bc),a
                            235 ;src/main.c:80: prota.mover  = SI;
   52F4 21 5D 52      [10]  236 	ld	hl,#(_prota + 0x0006)
   52F7 36 01         [10]  237 	ld	(hl),#0x01
   52F9 C9            [10]  238 	ret
                            239 ;src/main.c:84: void moverDerecha() {
                            240 ;	---------------------------------
                            241 ; Function moverDerecha
                            242 ; ---------------------------------
   52FA                     243 _moverDerecha::
                            244 ;src/main.c:85: if (prota.x < LIMITE_DERECHO) {
   52FA 21 57 52      [10]  245 	ld	hl,#_prota+0
   52FD 4E            [ 7]  246 	ld	c,(hl)
   52FE 79            [ 4]  247 	ld	a,c
   52FF D6 47         [ 7]  248 	sub	a, #0x47
   5301 D0            [11]  249 	ret	NC
                            250 ;src/main.c:86: prota.x++;
   5302 0C            [ 4]  251 	inc	c
   5303 71            [ 7]  252 	ld	(hl),c
                            253 ;src/main.c:87: prota.mover  = SI;
   5304 21 5D 52      [10]  254 	ld	hl,#(_prota + 0x0006)
   5307 36 01         [10]  255 	ld	(hl),#0x01
   5309 C9            [10]  256 	ret
                            257 ;src/main.c:91: void moverArriba() {
                            258 ;	---------------------------------
                            259 ; Function moverArriba
                            260 ; ---------------------------------
   530A                     261 _moverArriba::
                            262 ;src/main.c:92: if (prota.y > 0) {
   530A 01 58 52      [10]  263 	ld	bc,#_prota + 1
   530D 0A            [ 7]  264 	ld	a,(bc)
   530E B7            [ 4]  265 	or	a, a
   530F C8            [11]  266 	ret	Z
                            267 ;src/main.c:93: prota.y--;
   5310 C6 FF         [ 7]  268 	add	a,#0xFF
   5312 02            [ 7]  269 	ld	(bc),a
                            270 ;src/main.c:94: prota.mover  = SI;
   5313 21 5D 52      [10]  271 	ld	hl,#(_prota + 0x0006)
   5316 36 01         [10]  272 	ld	(hl),#0x01
   5318 C9            [10]  273 	ret
                            274 ;src/main.c:98: void moverAbajo() {
                            275 ;	---------------------------------
                            276 ; Function moverAbajo
                            277 ; ---------------------------------
   5319                     278 _moverAbajo::
                            279 ;src/main.c:99: prota.y++;
   5319 01 58 52      [10]  280 	ld	bc,#_prota + 1
   531C 0A            [ 7]  281 	ld	a,(bc)
   531D 3C            [ 4]  282 	inc	a
   531E 02            [ 7]  283 	ld	(bc),a
                            284 ;src/main.c:100: prota.mover  = SI;
   531F 21 5D 52      [10]  285 	ld	hl,#(_prota + 0x0006)
   5322 36 01         [10]  286 	ld	(hl),#0x01
   5324 C9            [10]  287 	ret
                            288 ;src/main.c:103: void comprobarTeclado() {
                            289 ;	---------------------------------
                            290 ; Function comprobarTeclado
                            291 ; ---------------------------------
   5325                     292 _comprobarTeclado::
                            293 ;src/main.c:104: cpct_scanKeyboard_if();
   5325 CD 23 49      [17]  294 	call	_cpct_scanKeyboard_if
                            295 ;src/main.c:106: if (cpct_isAnyKeyPressed()) {
   5328 CD 16 49      [17]  296 	call	_cpct_isAnyKeyPressed
   532B 7D            [ 4]  297 	ld	a,l
   532C B7            [ 4]  298 	or	a, a
   532D C8            [11]  299 	ret	Z
                            300 ;src/main.c:107: if (cpct_isKeyPressed(Key_CursorLeft))
   532E 21 01 01      [10]  301 	ld	hl,#0x0101
   5331 CD 4C 48      [17]  302 	call	_cpct_isKeyPressed
   5334 7D            [ 4]  303 	ld	a,l
   5335 B7            [ 4]  304 	or	a, a
                            305 ;src/main.c:108: moverIzquierda();
   5336 C2 EB 52      [10]  306 	jp	NZ,_moverIzquierda
                            307 ;src/main.c:109: else if (cpct_isKeyPressed(Key_CursorRight))
   5339 21 00 02      [10]  308 	ld	hl,#0x0200
   533C CD 4C 48      [17]  309 	call	_cpct_isKeyPressed
   533F 7D            [ 4]  310 	ld	a,l
   5340 B7            [ 4]  311 	or	a, a
                            312 ;src/main.c:110: moverDerecha();
   5341 C2 FA 52      [10]  313 	jp	NZ,_moverDerecha
                            314 ;src/main.c:111: else if (cpct_isKeyPressed(Key_CursorUp))
   5344 21 00 01      [10]  315 	ld	hl,#0x0100
   5347 CD 4C 48      [17]  316 	call	_cpct_isKeyPressed
   534A 7D            [ 4]  317 	ld	a,l
   534B B7            [ 4]  318 	or	a, a
                            319 ;src/main.c:112: moverArriba();
   534C C2 0A 53      [10]  320 	jp	NZ,_moverArriba
                            321 ;src/main.c:113: else if (cpct_isKeyPressed(Key_CursorDown))
   534F 21 00 04      [10]  322 	ld	hl,#0x0400
   5352 CD 4C 48      [17]  323 	call	_cpct_isKeyPressed
   5355 7D            [ 4]  324 	ld	a,l
   5356 B7            [ 4]  325 	or	a, a
   5357 C8            [11]  326 	ret	Z
                            327 ;src/main.c:114: moverAbajo();
   5358 C3 19 53      [10]  328 	jp  _moverAbajo
                            329 ;src/main.c:118: void inicializar() {
                            330 ;	---------------------------------
                            331 ; Function inicializar
                            332 ; ---------------------------------
   535B                     333 _inicializar::
                            334 ;src/main.c:119: cpct_disableFirmware();
   535B CD CA 51      [17]  335 	call	_cpct_disableFirmware
                            336 ;src/main.c:120: cpct_setVideoMode(0);
   535E 2E 00         [ 7]  337 	ld	l,#0x00
   5360 CD 93 49      [17]  338 	call	_cpct_setVideoMode
                            339 ;src/main.c:122: cpct_setPalette(g_palette, 16);
   5363 21 10 00      [10]  340 	ld	hl,#0x0010
   5366 E5            [11]  341 	push	hl
   5367 21 44 47      [10]  342 	ld	hl,#_g_palette
   536A E5            [11]  343 	push	hl
   536B CD 35 48      [17]  344 	call	_cpct_setPalette
                            345 ;src/main.c:123: cpct_akp_musicInit(G_song);
   536E 21 00 02      [10]  346 	ld	hl,#_G_song
   5371 E5            [11]  347 	push	hl
   5372 CD A6 50      [17]  348 	call	_cpct_akp_musicInit
   5375 F1            [10]  349 	pop	af
                            350 ;src/main.c:124: mapa = g_map1;
   5376 21 00 40      [10]  351 	ld	hl,#_g_map1+0
   5379 22 5E 52      [16]  352 	ld	(_mapa),hl
                            353 ;src/main.c:125: cpct_etm_setTileset2x4(g_tileset);
   537C 21 E0 46      [10]  354 	ld	hl,#_g_tileset
   537F CD E7 48      [17]  355 	call	_cpct_etm_setTileset2x4
                            356 ;src/main.c:126: dibujarMapa();
   5382 CD 60 52      [17]  357 	call	_dibujarMapa
                            358 ;src/main.c:129: prota.x = prota.px = 15;
   5385 21 59 52      [10]  359 	ld	hl,#(_prota + 0x0002)
   5388 36 0F         [10]  360 	ld	(hl),#0x0F
   538A 21 57 52      [10]  361 	ld	hl,#_prota
   538D 36 0F         [10]  362 	ld	(hl),#0x0F
                            363 ;src/main.c:130: prota.y = prota.py = 120;
   538F 21 5A 52      [10]  364 	ld	hl,#(_prota + 0x0003)
   5392 36 78         [10]  365 	ld	(hl),#0x78
   5394 21 58 52      [10]  366 	ld	hl,#(_prota + 0x0001)
   5397 36 78         [10]  367 	ld	(hl),#0x78
                            368 ;src/main.c:131: prota.mover  = NO;
   5399 21 5D 52      [10]  369 	ld	hl,#(_prota + 0x0006)
   539C 36 00         [10]  370 	ld	(hl),#0x00
                            371 ;src/main.c:132: prota.sprite = g_hero;
   539E 21 54 47      [10]  372 	ld	hl,#_g_hero
   53A1 22 5B 52      [16]  373 	ld	((_prota + 0x0004)), hl
                            374 ;src/main.c:133: dibujarProta();
   53A4 CD 76 52      [17]  375 	call	_dibujarProta
   53A7 C9            [10]  376 	ret
                            377 ;src/main.c:137: void main(void) {
                            378 ;	---------------------------------
                            379 ; Function main
                            380 ; ---------------------------------
   53A8                     381 _main::
                            382 ;src/main.c:138: inicializar();
   53A8 CD 5B 53      [17]  383 	call	_inicializar
                            384 ;src/main.c:139: while (1) {
   53AB                     385 00104$:
                            386 ;src/main.c:140: comprobarTeclado();
   53AB CD 25 53      [17]  387 	call	_comprobarTeclado
                            388 ;src/main.c:141: cpct_akp_musicPlay();
   53AE CD A3 49      [17]  389 	call	_cpct_akp_musicPlay
                            390 ;src/main.c:142: if (prota.mover) {
   53B1 01 5D 52      [10]  391 	ld	bc,#_prota+6
   53B4 0A            [ 7]  392 	ld	a,(bc)
   53B5 B7            [ 4]  393 	or	a, a
   53B6 28 07         [12]  394 	jr	Z,00102$
                            395 ;src/main.c:143: redibujarProta();
   53B8 C5            [11]  396 	push	bc
   53B9 CD D7 52      [17]  397 	call	_redibujarProta
   53BC C1            [10]  398 	pop	bc
                            399 ;src/main.c:144: prota.mover = NO;
   53BD AF            [ 4]  400 	xor	a, a
   53BE 02            [ 7]  401 	ld	(bc),a
   53BF                     402 00102$:
                            403 ;src/main.c:146: cpct_waitVSYNC();
   53BF CD 8B 49      [17]  404 	call	_cpct_waitVSYNC
   53C2 18 E7         [12]  405 	jr	00104$
                            406 	.area _CODE
                            407 	.area _INITIALIZER
                            408 	.area _CABS (ABS)
   0200                     409 	.org 0x0200
   0200                     410 _G_song:
   0200 41                  411 	.db #0x41	; 65	'A'
   0201 54                  412 	.db #0x54	; 84	'T'
   0202 31                  413 	.db #0x31	; 49	'1'
   0203 30                  414 	.db #0x30	; 48	'0'
   0204 01                  415 	.db #0x01	; 1
   0205 40                  416 	.db #0x40	; 64
   0206 42                  417 	.db #0x42	; 66	'B'
   0207 0F                  418 	.db #0x0F	; 15
   0208 02                  419 	.db #0x02	; 2
   0209 06                  420 	.db #0x06	; 6
   020A 1D                  421 	.db #0x1D	; 29
   020B 00                  422 	.db #0x00	; 0
   020C 10                  423 	.db #0x10	; 16
   020D 40                  424 	.db #0x40	; 64
   020E 19                  425 	.db #0x19	; 25
   020F 40                  426 	.db #0x40	; 64
   0210 00                  427 	.db #0x00	; 0
   0211 00                  428 	.db #0x00	; 0
   0212 00                  429 	.db #0x00	; 0
   0213 00                  430 	.db #0x00	; 0
   0214 00                  431 	.db #0x00	; 0
   0215 00                  432 	.db #0x00	; 0
   0216 0D                  433 	.db #0x0D	; 13
   0217 12                  434 	.db #0x12	; 18
   0218 40                  435 	.db #0x40	; 64
   0219 01                  436 	.db #0x01	; 1
   021A 00                  437 	.db #0x00	; 0
   021B 7C                  438 	.db #0x7C	; 124
   021C 18                  439 	.db #0x18	; 24
   021D 78                  440 	.db #0x78	; 120	'x'
   021E 0C                  441 	.db #0x0C	; 12
   021F 34                  442 	.db #0x34	; 52	'4'
   0220 30                  443 	.db #0x30	; 48	'0'
   0221 2C                  444 	.db #0x2C	; 44
   0222 28                  445 	.db #0x28	; 40
   0223 24                  446 	.db #0x24	; 36
   0224 20                  447 	.db #0x20	; 32
   0225 1C                  448 	.db #0x1C	; 28
   0226 0D                  449 	.db #0x0D	; 13
   0227 25                  450 	.db #0x25	; 37
   0228 40                  451 	.db #0x40	; 64
   0229 20                  452 	.db #0x20	; 32
   022A 00                  453 	.db #0x00	; 0
   022B 00                  454 	.db #0x00	; 0
   022C 00                  455 	.db #0x00	; 0
   022D 39                  456 	.db #0x39	; 57	'9'
   022E 40                  457 	.db #0x40	; 64
   022F 00                  458 	.db #0x00	; 0
   0230 57                  459 	.db #0x57	; 87	'W'
   0231 40                  460 	.db #0x40	; 64
   0232 3B                  461 	.db #0x3B	; 59
   0233 40                  462 	.db #0x40	; 64
   0234 57                  463 	.db #0x57	; 87	'W'
   0235 40                  464 	.db #0x40	; 64
   0236 01                  465 	.db #0x01	; 1
   0237 2F                  466 	.db #0x2F	; 47
   0238 40                  467 	.db #0x40	; 64
   0239 19                  468 	.db #0x19	; 25
   023A 00                  469 	.db #0x00	; 0
   023B 76                  470 	.db #0x76	; 118	'v'
   023C E1                  471 	.db #0xE1	; 225
   023D 00                  472 	.db #0x00	; 0
   023E 00                  473 	.db #0x00	; 0
   023F 01                  474 	.db #0x01	; 1
   0240 04                  475 	.db #0x04	; 4
   0241 51                  476 	.db #0x51	; 81	'Q'
   0242 04                  477 	.db #0x04	; 4
   0243 37                  478 	.db #0x37	; 55	'7'
   0244 04                  479 	.db #0x04	; 4
   0245 4F                  480 	.db #0x4F	; 79	'O'
   0246 04                  481 	.db #0x04	; 4
   0247 37                  482 	.db #0x37	; 55	'7'
   0248 02                  483 	.db #0x02	; 2
   0249 4B                  484 	.db #0x4B	; 75	'K'
   024A 02                  485 	.db #0x02	; 2
   024B 37                  486 	.db #0x37	; 55	'7'
   024C 04                  487 	.db #0x04	; 4
   024D 4F                  488 	.db #0x4F	; 79	'O'
   024E 04                  489 	.db #0x04	; 4
   024F 37                  490 	.db #0x37	; 55	'7'
   0250 04                  491 	.db #0x04	; 4
   0251 4F                  492 	.db #0x4F	; 79	'O'
   0252 04                  493 	.db #0x04	; 4
   0253 37                  494 	.db #0x37	; 55	'7'
   0254 02                  495 	.db #0x02	; 2
   0255 4B                  496 	.db #0x4B	; 75	'K'
   0256 00                  497 	.db #0x00	; 0
   0257 42                  498 	.db #0x42	; 66	'B'
   0258 60                  499 	.db #0x60	; 96
   0259 00                  500 	.db #0x00	; 0
   025A 42                  501 	.db #0x42	; 66	'B'
   025B 80                  502 	.db #0x80	; 128
   025C 00                  503 	.db #0x00	; 0
   025D 00                  504 	.db #0x00	; 0
   025E 42                  505 	.db #0x42	; 66	'B'
   025F 00                  506 	.db #0x00	; 0
   0260 00                  507 	.db #0x00	; 0
