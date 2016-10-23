                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module knifestruct
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _getTilePtr
                             12 	.globl _cpct_etm_drawTileBox2x4
                             13 	.globl _cpct_getScreenPtr
                             14 	.globl _cpct_drawSpriteMaskedAlignedTable
                             15 	.globl _dibujarCuchillo
                             16 	.globl _borrarCuchillo
                             17 	.globl _redibujarCuchillo
                             18 	.globl _lanzarCuchillo
                             19 	.globl _checkKnifeCollision
                             20 	.globl _moverCuchillo
                             21 ;--------------------------------------------------------
                             22 ; special function registers
                             23 ;--------------------------------------------------------
                             24 ;--------------------------------------------------------
                             25 ; ram data
                             26 ;--------------------------------------------------------
                             27 	.area _DATA
                             28 ;--------------------------------------------------------
                             29 ; ram data
                             30 ;--------------------------------------------------------
                             31 	.area _INITIALIZED
                             32 ;--------------------------------------------------------
                             33 ; absolute external ram data
                             34 ;--------------------------------------------------------
                             35 	.area _DABS (ABS)
                             36 ;--------------------------------------------------------
                             37 ; global & static initialisations
                             38 ;--------------------------------------------------------
                             39 	.area _HOME
                             40 	.area _GSINIT
                             41 	.area _GSFINAL
                             42 	.area _GSINIT
                             43 ;--------------------------------------------------------
                             44 ; Home
                             45 ;--------------------------------------------------------
                             46 	.area _HOME
                             47 	.area _HOME
                             48 ;--------------------------------------------------------
                             49 ; code
                             50 ;--------------------------------------------------------
                             51 	.area _CODE
                             52 ;src/knifestruct.c:3: void dibujarCuchillo(TKnife* cu, u8* g_tablatrans) {
                             53 ;	---------------------------------
                             54 ; Function dibujarCuchillo
                             55 ; ---------------------------------
   6C0A                      56 _dibujarCuchillo::
   6C0A DD E5         [15]   57 	push	ix
   6C0C DD 21 00 00   [14]   58 	ld	ix,#0
   6C10 DD 39         [15]   59 	add	ix,sp
   6C12 21 FA FF      [10]   60 	ld	hl,#-6
   6C15 39            [11]   61 	add	hl,sp
   6C16 F9            [ 6]   62 	ld	sp,hl
                             63 ;src/knifestruct.c:4: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu->x, cu->y);
   6C17 DD 5E 04      [19]   64 	ld	e,4 (ix)
   6C1A DD 56 05      [19]   65 	ld	d,5 (ix)
   6C1D 6B            [ 4]   66 	ld	l, e
   6C1E 62            [ 4]   67 	ld	h, d
   6C1F 23            [ 6]   68 	inc	hl
   6C20 46            [ 7]   69 	ld	b,(hl)
   6C21 1A            [ 7]   70 	ld	a,(de)
   6C22 D5            [11]   71 	push	de
   6C23 C5            [11]   72 	push	bc
   6C24 33            [ 6]   73 	inc	sp
   6C25 F5            [11]   74 	push	af
   6C26 33            [ 6]   75 	inc	sp
   6C27 21 00 C0      [10]   76 	ld	hl,#0xC000
   6C2A E5            [11]   77 	push	hl
   6C2B CD 91 85      [17]   78 	call	_cpct_getScreenPtr
   6C2E D1            [10]   79 	pop	de
   6C2F 33            [ 6]   80 	inc	sp
   6C30 33            [ 6]   81 	inc	sp
   6C31 E5            [11]   82 	push	hl
                             83 ;src/knifestruct.c:5: if(cu->eje == E_X){
   6C32 D5            [11]   84 	push	de
   6C33 FD E1         [14]   85 	pop	iy
   6C35 FD 4E 08      [19]   86 	ld	c,8 (iy)
                             87 ;src/knifestruct.c:6: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   6C38 DD 7E 06      [19]   88 	ld	a,6 (ix)
   6C3B DD 77 FC      [19]   89 	ld	-4 (ix),a
   6C3E DD 7E 07      [19]   90 	ld	a,7 (ix)
   6C41 DD 77 FD      [19]   91 	ld	-3 (ix),a
   6C44 DD 7E FA      [19]   92 	ld	a,-6 (ix)
   6C47 DD 77 FE      [19]   93 	ld	-2 (ix),a
   6C4A DD 7E FB      [19]   94 	ld	a,-5 (ix)
   6C4D DD 77 FF      [19]   95 	ld	-1 (ix),a
   6C50 13            [ 6]   96 	inc	de
   6C51 13            [ 6]   97 	inc	de
   6C52 13            [ 6]   98 	inc	de
   6C53 13            [ 6]   99 	inc	de
                            100 ;src/knifestruct.c:5: if(cu->eje == E_X){
   6C54 79            [ 4]  101 	ld	a,c
   6C55 B7            [ 4]  102 	or	a, a
   6C56 20 1A         [12]  103 	jr	NZ,00104$
                            104 ;src/knifestruct.c:6: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   6C58 EB            [ 4]  105 	ex	de,hl
   6C59 4E            [ 7]  106 	ld	c,(hl)
   6C5A 23            [ 6]  107 	inc	hl
   6C5B 46            [ 7]  108 	ld	b,(hl)
   6C5C D1            [10]  109 	pop	de
   6C5D E1            [10]  110 	pop	hl
   6C5E E5            [11]  111 	push	hl
   6C5F D5            [11]  112 	push	de
   6C60 E5            [11]  113 	push	hl
   6C61 21 04 04      [10]  114 	ld	hl,#0x0404
   6C64 E5            [11]  115 	push	hl
   6C65 DD 6E FE      [19]  116 	ld	l,-2 (ix)
   6C68 DD 66 FF      [19]  117 	ld	h,-1 (ix)
   6C6B E5            [11]  118 	push	hl
   6C6C C5            [11]  119 	push	bc
   6C6D CD B1 85      [17]  120 	call	_cpct_drawSpriteMaskedAlignedTable
   6C70 18 1B         [12]  121 	jr	00106$
   6C72                     122 00104$:
                            123 ;src/knifestruct.c:9: else if(cu->eje == E_Y){
   6C72 0D            [ 4]  124 	dec	c
   6C73 20 18         [12]  125 	jr	NZ,00106$
                            126 ;src/knifestruct.c:10: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   6C75 EB            [ 4]  127 	ex	de,hl
   6C76 4E            [ 7]  128 	ld	c,(hl)
   6C77 23            [ 6]  129 	inc	hl
   6C78 46            [ 7]  130 	ld	b,(hl)
   6C79 D1            [10]  131 	pop	de
   6C7A E1            [10]  132 	pop	hl
   6C7B E5            [11]  133 	push	hl
   6C7C D5            [11]  134 	push	de
   6C7D E5            [11]  135 	push	hl
   6C7E 21 02 08      [10]  136 	ld	hl,#0x0802
   6C81 E5            [11]  137 	push	hl
   6C82 DD 6E FE      [19]  138 	ld	l,-2 (ix)
   6C85 DD 66 FF      [19]  139 	ld	h,-1 (ix)
   6C88 E5            [11]  140 	push	hl
   6C89 C5            [11]  141 	push	bc
   6C8A CD B1 85      [17]  142 	call	_cpct_drawSpriteMaskedAlignedTable
   6C8D                     143 00106$:
   6C8D DD F9         [10]  144 	ld	sp, ix
   6C8F DD E1         [14]  145 	pop	ix
   6C91 C9            [10]  146 	ret
                            147 ;src/knifestruct.c:14: void borrarCuchillo(TKnife* cu, u8* mapa) {
                            148 ;	---------------------------------
                            149 ; Function borrarCuchillo
                            150 ; ---------------------------------
   6C92                     151 _borrarCuchillo::
   6C92 DD E5         [15]  152 	push	ix
   6C94 DD 21 00 00   [14]  153 	ld	ix,#0
   6C98 DD 39         [15]  154 	add	ix,sp
   6C9A 21 F9 FF      [10]  155 	ld	hl,#-7
   6C9D 39            [11]  156 	add	hl,sp
   6C9E F9            [ 6]  157 	ld	sp,hl
                            158 ;src/knifestruct.c:19: u8 w = 2 + (cu->px & 1);
   6C9F DD 4E 04      [19]  159 	ld	c,4 (ix)
   6CA2 DD 46 05      [19]  160 	ld	b,5 (ix)
   6CA5 69            [ 4]  161 	ld	l, c
   6CA6 60            [ 4]  162 	ld	h, b
   6CA7 23            [ 6]  163 	inc	hl
   6CA8 23            [ 6]  164 	inc	hl
   6CA9 7E            [ 7]  165 	ld	a,(hl)
   6CAA DD 77 FF      [19]  166 	ld	-1 (ix), a
   6CAD E6 01         [ 7]  167 	and	a, #0x01
   6CAF C6 02         [ 7]  168 	add	a, #0x02
   6CB1 DD 77 F9      [19]  169 	ld	-7 (ix),a
                            170 ;src/knifestruct.c:20: u8 h = 2 + (cu->py & 3 ? 1 : 0);
   6CB4 69            [ 4]  171 	ld	l, c
   6CB5 60            [ 4]  172 	ld	h, b
   6CB6 23            [ 6]  173 	inc	hl
   6CB7 23            [ 6]  174 	inc	hl
   6CB8 23            [ 6]  175 	inc	hl
   6CB9 5E            [ 7]  176 	ld	e,(hl)
   6CBA 7B            [ 4]  177 	ld	a,e
   6CBB E6 03         [ 7]  178 	and	a, #0x03
   6CBD 28 04         [12]  179 	jr	Z,00105$
   6CBF 3E 01         [ 7]  180 	ld	a,#0x01
   6CC1 18 02         [12]  181 	jr	00106$
   6CC3                     182 00105$:
   6CC3 3E 00         [ 7]  183 	ld	a,#0x00
   6CC5                     184 00106$:
   6CC5 C6 02         [ 7]  185 	add	a, #0x02
   6CC7 DD 77 FA      [19]  186 	ld	-6 (ix),a
                            187 ;src/knifestruct.c:22: cpct_etm_drawTileBox2x4 (cu->px / 2, (cu->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   6CCA DD 7E 06      [19]  188 	ld	a,6 (ix)
   6CCD DD 77 FD      [19]  189 	ld	-3 (ix),a
   6CD0 DD 7E 07      [19]  190 	ld	a,7 (ix)
   6CD3 DD 77 FE      [19]  191 	ld	-2 (ix),a
   6CD6 16 00         [ 7]  192 	ld	d,#0x00
   6CD8 7B            [ 4]  193 	ld	a,e
   6CD9 C6 E8         [ 7]  194 	add	a,#0xE8
   6CDB DD 77 FB      [19]  195 	ld	-5 (ix),a
   6CDE 7A            [ 4]  196 	ld	a,d
   6CDF CE FF         [ 7]  197 	adc	a,#0xFF
   6CE1 DD 77 FC      [19]  198 	ld	-4 (ix),a
   6CE4 DD 6E FB      [19]  199 	ld	l,-5 (ix)
   6CE7 DD 66 FC      [19]  200 	ld	h,-4 (ix)
   6CEA DD CB FC 7E   [20]  201 	bit	7, -4 (ix)
   6CEE 28 04         [12]  202 	jr	Z,00107$
   6CF0 21 EB FF      [10]  203 	ld	hl,#0xFFEB
   6CF3 19            [11]  204 	add	hl,de
   6CF4                     205 00107$:
   6CF4 CB 2C         [ 8]  206 	sra	h
   6CF6 CB 1D         [ 8]  207 	rr	l
   6CF8 CB 2C         [ 8]  208 	sra	h
   6CFA CB 1D         [ 8]  209 	rr	l
   6CFC 5D            [ 4]  210 	ld	e,l
   6CFD DD 56 FF      [19]  211 	ld	d,-1 (ix)
   6D00 CB 3A         [ 8]  212 	srl	d
   6D02 C5            [11]  213 	push	bc
   6D03 DD 6E FD      [19]  214 	ld	l,-3 (ix)
   6D06 DD 66 FE      [19]  215 	ld	h,-2 (ix)
   6D09 E5            [11]  216 	push	hl
   6D0A 21 F0 C0      [10]  217 	ld	hl,#0xC0F0
   6D0D E5            [11]  218 	push	hl
   6D0E 3E 28         [ 7]  219 	ld	a,#0x28
   6D10 F5            [11]  220 	push	af
   6D11 33            [ 6]  221 	inc	sp
   6D12 DD 66 FA      [19]  222 	ld	h,-6 (ix)
   6D15 DD 6E F9      [19]  223 	ld	l,-7 (ix)
   6D18 E5            [11]  224 	push	hl
   6D19 7B            [ 4]  225 	ld	a,e
   6D1A F5            [11]  226 	push	af
   6D1B 33            [ 6]  227 	inc	sp
   6D1C D5            [11]  228 	push	de
   6D1D 33            [ 6]  229 	inc	sp
   6D1E CD 73 7A      [17]  230 	call	_cpct_etm_drawTileBox2x4
   6D21 C1            [10]  231 	pop	bc
                            232 ;src/knifestruct.c:23: if(!cu->mover){
   6D22 C5            [11]  233 	push	bc
   6D23 FD E1         [14]  234 	pop	iy
   6D25 FD 7E 09      [19]  235 	ld	a,9 (iy)
   6D28 B7            [ 4]  236 	or	a, a
   6D29 20 06         [12]  237 	jr	NZ,00103$
                            238 ;src/knifestruct.c:24: cu->lanzado = NO;
   6D2B 21 06 00      [10]  239 	ld	hl,#0x0006
   6D2E 09            [11]  240 	add	hl,bc
   6D2F 36 00         [10]  241 	ld	(hl),#0x00
   6D31                     242 00103$:
   6D31 DD F9         [10]  243 	ld	sp, ix
   6D33 DD E1         [14]  244 	pop	ix
   6D35 C9            [10]  245 	ret
                            246 ;src/knifestruct.c:28: void redibujarCuchillo(TKnife* cu, u8* g_tablatrans, u8* mapa) {
                            247 ;	---------------------------------
                            248 ; Function redibujarCuchillo
                            249 ; ---------------------------------
   6D36                     250 _redibujarCuchillo::
   6D36 DD E5         [15]  251 	push	ix
   6D38 DD 21 00 00   [14]  252 	ld	ix,#0
   6D3C DD 39         [15]  253 	add	ix,sp
                            254 ;src/knifestruct.c:29: borrarCuchillo(cu, mapa);
   6D3E DD 6E 08      [19]  255 	ld	l,8 (ix)
   6D41 DD 66 09      [19]  256 	ld	h,9 (ix)
   6D44 E5            [11]  257 	push	hl
   6D45 DD 6E 04      [19]  258 	ld	l,4 (ix)
   6D48 DD 66 05      [19]  259 	ld	h,5 (ix)
   6D4B E5            [11]  260 	push	hl
   6D4C CD 92 6C      [17]  261 	call	_borrarCuchillo
   6D4F F1            [10]  262 	pop	af
   6D50 F1            [10]  263 	pop	af
                            264 ;src/knifestruct.c:30: cu->px = cu->x;
   6D51 DD 4E 04      [19]  265 	ld	c,4 (ix)
   6D54 DD 46 05      [19]  266 	ld	b,5 (ix)
   6D57 59            [ 4]  267 	ld	e, c
   6D58 50            [ 4]  268 	ld	d, b
   6D59 13            [ 6]  269 	inc	de
   6D5A 13            [ 6]  270 	inc	de
   6D5B 0A            [ 7]  271 	ld	a,(bc)
   6D5C 12            [ 7]  272 	ld	(de),a
                            273 ;src/knifestruct.c:31: cu->py = cu->y;
   6D5D 59            [ 4]  274 	ld	e, c
   6D5E 50            [ 4]  275 	ld	d, b
   6D5F 13            [ 6]  276 	inc	de
   6D60 13            [ 6]  277 	inc	de
   6D61 13            [ 6]  278 	inc	de
   6D62 69            [ 4]  279 	ld	l, c
   6D63 60            [ 4]  280 	ld	h, b
   6D64 23            [ 6]  281 	inc	hl
   6D65 7E            [ 7]  282 	ld	a,(hl)
   6D66 12            [ 7]  283 	ld	(de),a
                            284 ;src/knifestruct.c:32: dibujarCuchillo(cu, g_tablatrans);
   6D67 DD 6E 06      [19]  285 	ld	l,6 (ix)
   6D6A DD 66 07      [19]  286 	ld	h,7 (ix)
   6D6D E5            [11]  287 	push	hl
   6D6E C5            [11]  288 	push	bc
   6D6F CD 0A 6C      [17]  289 	call	_dibujarCuchillo
   6D72 F1            [10]  290 	pop	af
   6D73 F1            [10]  291 	pop	af
   6D74 DD E1         [14]  292 	pop	ix
   6D76 C9            [10]  293 	ret
                            294 ;src/knifestruct.c:35: void lanzarCuchillo(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans){
                            295 ;	---------------------------------
                            296 ; Function lanzarCuchillo
                            297 ; ---------------------------------
   6D77                     298 _lanzarCuchillo::
   6D77 DD E5         [15]  299 	push	ix
   6D79 DD 21 00 00   [14]  300 	ld	ix,#0
   6D7D DD 39         [15]  301 	add	ix,sp
   6D7F 21 F2 FF      [10]  302 	ld	hl,#-14
   6D82 39            [11]  303 	add	hl,sp
   6D83 F9            [ 6]  304 	ld	sp,hl
                            305 ;src/knifestruct.c:37: if(!cu->lanzado){
   6D84 DD 4E 04      [19]  306 	ld	c,4 (ix)
   6D87 DD 46 05      [19]  307 	ld	b,5 (ix)
   6D8A 21 06 00      [10]  308 	ld	hl,#0x0006
   6D8D 09            [11]  309 	add	hl,bc
   6D8E DD 75 FE      [19]  310 	ld	-2 (ix),l
   6D91 DD 74 FF      [19]  311 	ld	-1 (ix),h
   6D94 DD 6E FE      [19]  312 	ld	l,-2 (ix)
   6D97 DD 66 FF      [19]  313 	ld	h,-1 (ix)
   6D9A 7E            [ 7]  314 	ld	a,(hl)
   6D9B B7            [ 4]  315 	or	a, a
   6D9C C2 C1 6F      [10]  316 	jp	NZ,00122$
                            317 ;src/knifestruct.c:39: if(prota->mira == M_derecha){
   6D9F DD 5E 06      [19]  318 	ld	e,6 (ix)
   6DA2 DD 56 07      [19]  319 	ld	d,7 (ix)
   6DA5 6B            [ 4]  320 	ld	l, e
   6DA6 62            [ 4]  321 	ld	h, d
   6DA7 C5            [11]  322 	push	bc
   6DA8 01 07 00      [10]  323 	ld	bc, #0x0007
   6DAB 09            [11]  324 	add	hl, bc
   6DAC C1            [10]  325 	pop	bc
   6DAD 6E            [ 7]  326 	ld	l,(hl)
                            327 ;src/knifestruct.c:40: if( *getTilePtr(mapa, prota->x + G_HERO_W + G_KNIFEX_0_W + 1, prota->y + G_HERO_H /2) <= 2){
   6DAE 7B            [ 4]  328 	ld	a,e
   6DAF C6 01         [ 7]  329 	add	a, #0x01
   6DB1 DD 77 FC      [19]  330 	ld	-4 (ix),a
   6DB4 7A            [ 4]  331 	ld	a,d
   6DB5 CE 00         [ 7]  332 	adc	a, #0x00
   6DB7 DD 77 FD      [19]  333 	ld	-3 (ix),a
                            334 ;src/knifestruct.c:42: cu->direccion = M_derecha;
   6DBA 79            [ 4]  335 	ld	a,c
   6DBB C6 07         [ 7]  336 	add	a, #0x07
   6DBD DD 77 F8      [19]  337 	ld	-8 (ix),a
   6DC0 78            [ 4]  338 	ld	a,b
   6DC1 CE 00         [ 7]  339 	adc	a, #0x00
   6DC3 DD 77 F9      [19]  340 	ld	-7 (ix),a
                            341 ;src/knifestruct.c:44: cu->y=prota->y + G_HERO_H /2;
   6DC6 79            [ 4]  342 	ld	a,c
   6DC7 C6 01         [ 7]  343 	add	a, #0x01
   6DC9 DD 77 F4      [19]  344 	ld	-12 (ix),a
   6DCC 78            [ 4]  345 	ld	a,b
   6DCD CE 00         [ 7]  346 	adc	a, #0x00
   6DCF DD 77 F5      [19]  347 	ld	-11 (ix),a
                            348 ;src/knifestruct.c:45: cu->sprite=g_knifeX_0;
   6DD2 79            [ 4]  349 	ld	a,c
   6DD3 C6 04         [ 7]  350 	add	a, #0x04
   6DD5 DD 77 F2      [19]  351 	ld	-14 (ix),a
   6DD8 78            [ 4]  352 	ld	a,b
   6DD9 CE 00         [ 7]  353 	adc	a, #0x00
   6DDB DD 77 F3      [19]  354 	ld	-13 (ix),a
                            355 ;src/knifestruct.c:46: cu->eje = E_X;
   6DDE 79            [ 4]  356 	ld	a,c
   6DDF C6 08         [ 7]  357 	add	a, #0x08
   6DE1 DD 77 F6      [19]  358 	ld	-10 (ix),a
   6DE4 78            [ 4]  359 	ld	a,b
   6DE5 CE 00         [ 7]  360 	adc	a, #0x00
   6DE7 DD 77 F7      [19]  361 	ld	-9 (ix),a
                            362 ;src/knifestruct.c:39: if(prota->mira == M_derecha){
   6DEA 7D            [ 4]  363 	ld	a,l
   6DEB B7            [ 4]  364 	or	a, a
   6DEC 20 73         [12]  365 	jr	NZ,00118$
                            366 ;src/knifestruct.c:40: if( *getTilePtr(mapa, prota->x + G_HERO_W + G_KNIFEX_0_W + 1, prota->y + G_HERO_H /2) <= 2){
   6DEE DD 6E FC      [19]  367 	ld	l,-4 (ix)
   6DF1 DD 66 FD      [19]  368 	ld	h,-3 (ix)
   6DF4 7E            [ 7]  369 	ld	a,(hl)
   6DF5 C6 0B         [ 7]  370 	add	a, #0x0B
   6DF7 DD 77 FB      [19]  371 	ld	-5 (ix),a
   6DFA 1A            [ 7]  372 	ld	a,(de)
   6DFB C6 0C         [ 7]  373 	add	a, #0x0C
   6DFD DD 77 FA      [19]  374 	ld	-6 (ix),a
   6E00 C5            [11]  375 	push	bc
   6E01 D5            [11]  376 	push	de
   6E02 DD 66 FB      [19]  377 	ld	h,-5 (ix)
   6E05 DD 6E FA      [19]  378 	ld	l,-6 (ix)
   6E08 E5            [11]  379 	push	hl
   6E09 DD 6E 08      [19]  380 	ld	l,8 (ix)
   6E0C DD 66 09      [19]  381 	ld	h,9 (ix)
   6E0F E5            [11]  382 	push	hl
   6E10 CD E8 70      [17]  383 	call	_getTilePtr
   6E13 F1            [10]  384 	pop	af
   6E14 F1            [10]  385 	pop	af
   6E15 D1            [10]  386 	pop	de
   6E16 C1            [10]  387 	pop	bc
   6E17 6E            [ 7]  388 	ld	l,(hl)
   6E18 3E 02         [ 7]  389 	ld	a,#0x02
   6E1A 95            [ 4]  390 	sub	a, l
   6E1B DA C1 6F      [10]  391 	jp	C,00122$
                            392 ;src/knifestruct.c:41: cu->lanzado = SI;
   6E1E DD 6E FE      [19]  393 	ld	l,-2 (ix)
   6E21 DD 66 FF      [19]  394 	ld	h,-1 (ix)
   6E24 36 01         [10]  395 	ld	(hl),#0x01
                            396 ;src/knifestruct.c:42: cu->direccion = M_derecha;
   6E26 DD 6E F8      [19]  397 	ld	l,-8 (ix)
   6E29 DD 66 F9      [19]  398 	ld	h,-7 (ix)
   6E2C 36 00         [10]  399 	ld	(hl),#0x00
                            400 ;src/knifestruct.c:43: cu->x=prota->x + G_HERO_W;
   6E2E 1A            [ 7]  401 	ld	a,(de)
   6E2F C6 07         [ 7]  402 	add	a, #0x07
   6E31 02            [ 7]  403 	ld	(bc),a
                            404 ;src/knifestruct.c:44: cu->y=prota->y + G_HERO_H /2;
   6E32 DD 6E FC      [19]  405 	ld	l,-4 (ix)
   6E35 DD 66 FD      [19]  406 	ld	h,-3 (ix)
   6E38 7E            [ 7]  407 	ld	a,(hl)
   6E39 C6 0B         [ 7]  408 	add	a, #0x0B
   6E3B DD 6E F4      [19]  409 	ld	l,-12 (ix)
   6E3E DD 66 F5      [19]  410 	ld	h,-11 (ix)
   6E41 77            [ 7]  411 	ld	(hl),a
                            412 ;src/knifestruct.c:45: cu->sprite=g_knifeX_0;
   6E42 E1            [10]  413 	pop	hl
   6E43 E5            [11]  414 	push	hl
   6E44 36 C0         [10]  415 	ld	(hl),#<(_g_knifeX_0)
   6E46 23            [ 6]  416 	inc	hl
   6E47 36 44         [10]  417 	ld	(hl),#>(_g_knifeX_0)
                            418 ;src/knifestruct.c:46: cu->eje = E_X;
   6E49 DD 6E F6      [19]  419 	ld	l,-10 (ix)
   6E4C DD 66 F7      [19]  420 	ld	h,-9 (ix)
   6E4F 36 00         [10]  421 	ld	(hl),#0x00
                            422 ;src/knifestruct.c:47: dibujarCuchillo(cu, g_tablatrans);
   6E51 DD 6E 0A      [19]  423 	ld	l,10 (ix)
   6E54 DD 66 0B      [19]  424 	ld	h,11 (ix)
   6E57 E5            [11]  425 	push	hl
   6E58 C5            [11]  426 	push	bc
   6E59 CD 0A 6C      [17]  427 	call	_dibujarCuchillo
   6E5C F1            [10]  428 	pop	af
   6E5D F1            [10]  429 	pop	af
   6E5E C3 C1 6F      [10]  430 	jp	00122$
   6E61                     431 00118$:
                            432 ;src/knifestruct.c:50: else if(prota->mira == M_izquierda){
   6E61 7D            [ 4]  433 	ld	a,l
   6E62 3D            [ 4]  434 	dec	a
   6E63 20 73         [12]  435 	jr	NZ,00115$
                            436 ;src/knifestruct.c:51: if( *getTilePtr(mapa, prota->x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota->y + G_HERO_H /2) <= 2){
   6E65 DD 6E FC      [19]  437 	ld	l,-4 (ix)
   6E68 DD 66 FD      [19]  438 	ld	h,-3 (ix)
   6E6B 7E            [ 7]  439 	ld	a,(hl)
   6E6C C6 0B         [ 7]  440 	add	a, #0x0B
   6E6E DD 77 FA      [19]  441 	ld	-6 (ix),a
   6E71 1A            [ 7]  442 	ld	a,(de)
   6E72 C6 F6         [ 7]  443 	add	a,#0xF6
   6E74 DD 77 FB      [19]  444 	ld	-5 (ix),a
   6E77 C5            [11]  445 	push	bc
   6E78 D5            [11]  446 	push	de
   6E79 DD 66 FA      [19]  447 	ld	h,-6 (ix)
   6E7C DD 6E FB      [19]  448 	ld	l,-5 (ix)
   6E7F E5            [11]  449 	push	hl
   6E80 DD 6E 08      [19]  450 	ld	l,8 (ix)
   6E83 DD 66 09      [19]  451 	ld	h,9 (ix)
   6E86 E5            [11]  452 	push	hl
   6E87 CD E8 70      [17]  453 	call	_getTilePtr
   6E8A F1            [10]  454 	pop	af
   6E8B F1            [10]  455 	pop	af
   6E8C D1            [10]  456 	pop	de
   6E8D C1            [10]  457 	pop	bc
   6E8E 6E            [ 7]  458 	ld	l,(hl)
   6E8F 3E 02         [ 7]  459 	ld	a,#0x02
   6E91 95            [ 4]  460 	sub	a, l
   6E92 DA C1 6F      [10]  461 	jp	C,00122$
                            462 ;src/knifestruct.c:52: cu->lanzado = SI;
   6E95 DD 6E FE      [19]  463 	ld	l,-2 (ix)
   6E98 DD 66 FF      [19]  464 	ld	h,-1 (ix)
   6E9B 36 01         [10]  465 	ld	(hl),#0x01
                            466 ;src/knifestruct.c:53: cu->direccion = M_izquierda;
   6E9D DD 6E F8      [19]  467 	ld	l,-8 (ix)
   6EA0 DD 66 F9      [19]  468 	ld	h,-7 (ix)
   6EA3 36 01         [10]  469 	ld	(hl),#0x01
                            470 ;src/knifestruct.c:54: cu->x = prota->x - G_KNIFEX_0_W;
   6EA5 1A            [ 7]  471 	ld	a,(de)
   6EA6 C6 FC         [ 7]  472 	add	a,#0xFC
   6EA8 02            [ 7]  473 	ld	(bc),a
                            474 ;src/knifestruct.c:55: cu->y = prota->y + G_HERO_H /2;
   6EA9 DD 6E FC      [19]  475 	ld	l,-4 (ix)
   6EAC DD 66 FD      [19]  476 	ld	h,-3 (ix)
   6EAF 7E            [ 7]  477 	ld	a,(hl)
   6EB0 C6 0B         [ 7]  478 	add	a, #0x0B
   6EB2 DD 6E F4      [19]  479 	ld	l,-12 (ix)
   6EB5 DD 66 F5      [19]  480 	ld	h,-11 (ix)
   6EB8 77            [ 7]  481 	ld	(hl),a
                            482 ;src/knifestruct.c:56: cu->sprite = g_knifeX_1;
   6EB9 E1            [10]  483 	pop	hl
   6EBA E5            [11]  484 	push	hl
   6EBB 36 D0         [10]  485 	ld	(hl),#<(_g_knifeX_1)
   6EBD 23            [ 6]  486 	inc	hl
   6EBE 36 44         [10]  487 	ld	(hl),#>(_g_knifeX_1)
                            488 ;src/knifestruct.c:57: cu->eje = E_X;
   6EC0 DD 6E F6      [19]  489 	ld	l,-10 (ix)
   6EC3 DD 66 F7      [19]  490 	ld	h,-9 (ix)
   6EC6 36 00         [10]  491 	ld	(hl),#0x00
                            492 ;src/knifestruct.c:58: dibujarCuchillo(cu, g_tablatrans);
   6EC8 DD 6E 0A      [19]  493 	ld	l,10 (ix)
   6ECB DD 66 0B      [19]  494 	ld	h,11 (ix)
   6ECE E5            [11]  495 	push	hl
   6ECF C5            [11]  496 	push	bc
   6ED0 CD 0A 6C      [17]  497 	call	_dibujarCuchillo
   6ED3 F1            [10]  498 	pop	af
   6ED4 F1            [10]  499 	pop	af
   6ED5 C3 C1 6F      [10]  500 	jp	00122$
   6ED8                     501 00115$:
                            502 ;src/knifestruct.c:61: else if(prota->mira == M_abajo){
   6ED8 7D            [ 4]  503 	ld	a,l
   6ED9 D6 03         [ 7]  504 	sub	a, #0x03
   6EDB 20 72         [12]  505 	jr	NZ,00112$
                            506 ;src/knifestruct.c:63: if( *getTilePtr(mapa, prota->x + G_HERO_W / 2, prota->y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   6EDD DD 6E FC      [19]  507 	ld	l,-4 (ix)
   6EE0 DD 66 FD      [19]  508 	ld	h,-3 (ix)
   6EE3 7E            [ 7]  509 	ld	a,(hl)
   6EE4 C6 1F         [ 7]  510 	add	a, #0x1F
   6EE6 DD 77 FA      [19]  511 	ld	-6 (ix),a
   6EE9 1A            [ 7]  512 	ld	a,(de)
   6EEA C6 03         [ 7]  513 	add	a, #0x03
   6EEC DD 77 FB      [19]  514 	ld	-5 (ix),a
   6EEF C5            [11]  515 	push	bc
   6EF0 D5            [11]  516 	push	de
   6EF1 DD 66 FA      [19]  517 	ld	h,-6 (ix)
   6EF4 DD 6E FB      [19]  518 	ld	l,-5 (ix)
   6EF7 E5            [11]  519 	push	hl
   6EF8 DD 6E 08      [19]  520 	ld	l,8 (ix)
   6EFB DD 66 09      [19]  521 	ld	h,9 (ix)
   6EFE E5            [11]  522 	push	hl
   6EFF CD E8 70      [17]  523 	call	_getTilePtr
   6F02 F1            [10]  524 	pop	af
   6F03 F1            [10]  525 	pop	af
   6F04 D1            [10]  526 	pop	de
   6F05 C1            [10]  527 	pop	bc
   6F06 6E            [ 7]  528 	ld	l,(hl)
   6F07 3E 02         [ 7]  529 	ld	a,#0x02
   6F09 95            [ 4]  530 	sub	a, l
   6F0A DA C1 6F      [10]  531 	jp	C,00122$
                            532 ;src/knifestruct.c:64: cu->lanzado = SI;
   6F0D DD 6E FE      [19]  533 	ld	l,-2 (ix)
   6F10 DD 66 FF      [19]  534 	ld	h,-1 (ix)
   6F13 36 01         [10]  535 	ld	(hl),#0x01
                            536 ;src/knifestruct.c:65: cu->direccion = M_abajo;
   6F15 DD 6E F8      [19]  537 	ld	l,-8 (ix)
   6F18 DD 66 F9      [19]  538 	ld	h,-7 (ix)
   6F1B 36 03         [10]  539 	ld	(hl),#0x03
                            540 ;src/knifestruct.c:66: cu->x = prota->x + G_HERO_W / 2;
   6F1D 1A            [ 7]  541 	ld	a,(de)
   6F1E C6 03         [ 7]  542 	add	a, #0x03
   6F20 02            [ 7]  543 	ld	(bc),a
                            544 ;src/knifestruct.c:67: cu->y = prota->y + G_HERO_H;
   6F21 DD 6E FC      [19]  545 	ld	l,-4 (ix)
   6F24 DD 66 FD      [19]  546 	ld	h,-3 (ix)
   6F27 7E            [ 7]  547 	ld	a,(hl)
   6F28 C6 16         [ 7]  548 	add	a, #0x16
   6F2A DD 6E F4      [19]  549 	ld	l,-12 (ix)
   6F2D DD 66 F5      [19]  550 	ld	h,-11 (ix)
   6F30 77            [ 7]  551 	ld	(hl),a
                            552 ;src/knifestruct.c:68: cu->sprite = g_knifeY_0;
   6F31 E1            [10]  553 	pop	hl
   6F32 E5            [11]  554 	push	hl
   6F33 36 A0         [10]  555 	ld	(hl),#<(_g_knifeY_0)
   6F35 23            [ 6]  556 	inc	hl
   6F36 36 44         [10]  557 	ld	(hl),#>(_g_knifeY_0)
                            558 ;src/knifestruct.c:69: cu->eje = E_Y;
   6F38 DD 6E F6      [19]  559 	ld	l,-10 (ix)
   6F3B DD 66 F7      [19]  560 	ld	h,-9 (ix)
   6F3E 36 01         [10]  561 	ld	(hl),#0x01
                            562 ;src/knifestruct.c:70: dibujarCuchillo(cu, g_tablatrans);
   6F40 DD 6E 0A      [19]  563 	ld	l,10 (ix)
   6F43 DD 66 0B      [19]  564 	ld	h,11 (ix)
   6F46 E5            [11]  565 	push	hl
   6F47 C5            [11]  566 	push	bc
   6F48 CD 0A 6C      [17]  567 	call	_dibujarCuchillo
   6F4B F1            [10]  568 	pop	af
   6F4C F1            [10]  569 	pop	af
   6F4D 18 72         [12]  570 	jr	00122$
   6F4F                     571 00112$:
                            572 ;src/knifestruct.c:73: else if(prota->mira == M_arriba){
   6F4F 7D            [ 4]  573 	ld	a,l
   6F50 D6 02         [ 7]  574 	sub	a, #0x02
   6F52 20 6D         [12]  575 	jr	NZ,00122$
                            576 ;src/knifestruct.c:74: if( *getTilePtr(mapa, prota->x + G_HERO_W / 2, prota->y - G_KNIFEY_0_H - 1) <= 2){
   6F54 DD 6E FC      [19]  577 	ld	l,-4 (ix)
   6F57 DD 66 FD      [19]  578 	ld	h,-3 (ix)
   6F5A 7E            [ 7]  579 	ld	a,(hl)
   6F5B C6 F7         [ 7]  580 	add	a,#0xF7
   6F5D DD 77 FA      [19]  581 	ld	-6 (ix),a
   6F60 1A            [ 7]  582 	ld	a,(de)
   6F61 C6 03         [ 7]  583 	add	a, #0x03
   6F63 DD 77 FB      [19]  584 	ld	-5 (ix),a
   6F66 C5            [11]  585 	push	bc
   6F67 D5            [11]  586 	push	de
   6F68 DD 66 FA      [19]  587 	ld	h,-6 (ix)
   6F6B DD 6E FB      [19]  588 	ld	l,-5 (ix)
   6F6E E5            [11]  589 	push	hl
   6F6F DD 6E 08      [19]  590 	ld	l,8 (ix)
   6F72 DD 66 09      [19]  591 	ld	h,9 (ix)
   6F75 E5            [11]  592 	push	hl
   6F76 CD E8 70      [17]  593 	call	_getTilePtr
   6F79 F1            [10]  594 	pop	af
   6F7A F1            [10]  595 	pop	af
   6F7B D1            [10]  596 	pop	de
   6F7C C1            [10]  597 	pop	bc
   6F7D 6E            [ 7]  598 	ld	l,(hl)
   6F7E 3E 02         [ 7]  599 	ld	a,#0x02
   6F80 95            [ 4]  600 	sub	a, l
   6F81 38 3E         [12]  601 	jr	C,00122$
                            602 ;src/knifestruct.c:75: cu->lanzado = SI;
   6F83 DD 6E FE      [19]  603 	ld	l,-2 (ix)
   6F86 DD 66 FF      [19]  604 	ld	h,-1 (ix)
   6F89 36 01         [10]  605 	ld	(hl),#0x01
                            606 ;src/knifestruct.c:76: cu->direccion = M_arriba;
   6F8B DD 6E F8      [19]  607 	ld	l,-8 (ix)
   6F8E DD 66 F9      [19]  608 	ld	h,-7 (ix)
   6F91 36 02         [10]  609 	ld	(hl),#0x02
                            610 ;src/knifestruct.c:77: cu->x = prota->x + G_HERO_W / 2;
   6F93 1A            [ 7]  611 	ld	a,(de)
   6F94 C6 03         [ 7]  612 	add	a, #0x03
   6F96 02            [ 7]  613 	ld	(bc),a
                            614 ;src/knifestruct.c:78: cu->y = prota->y;
   6F97 DD 6E FC      [19]  615 	ld	l,-4 (ix)
   6F9A DD 66 FD      [19]  616 	ld	h,-3 (ix)
   6F9D 5E            [ 7]  617 	ld	e,(hl)
   6F9E DD 6E F4      [19]  618 	ld	l,-12 (ix)
   6FA1 DD 66 F5      [19]  619 	ld	h,-11 (ix)
   6FA4 73            [ 7]  620 	ld	(hl),e
                            621 ;src/knifestruct.c:79: cu->sprite = g_knifeY_1;
   6FA5 E1            [10]  622 	pop	hl
   6FA6 E5            [11]  623 	push	hl
   6FA7 36 B0         [10]  624 	ld	(hl),#<(_g_knifeY_1)
   6FA9 23            [ 6]  625 	inc	hl
   6FAA 36 44         [10]  626 	ld	(hl),#>(_g_knifeY_1)
                            627 ;src/knifestruct.c:80: cu->eje = E_Y;
   6FAC DD 6E F6      [19]  628 	ld	l,-10 (ix)
   6FAF DD 66 F7      [19]  629 	ld	h,-9 (ix)
   6FB2 36 01         [10]  630 	ld	(hl),#0x01
                            631 ;src/knifestruct.c:81: dibujarCuchillo(cu, g_tablatrans);
   6FB4 DD 6E 0A      [19]  632 	ld	l,10 (ix)
   6FB7 DD 66 0B      [19]  633 	ld	h,11 (ix)
   6FBA E5            [11]  634 	push	hl
   6FBB C5            [11]  635 	push	bc
   6FBC CD 0A 6C      [17]  636 	call	_dibujarCuchillo
   6FBF F1            [10]  637 	pop	af
   6FC0 F1            [10]  638 	pop	af
   6FC1                     639 00122$:
   6FC1 DD F9         [10]  640 	ld	sp, ix
   6FC3 DD E1         [14]  641 	pop	ix
   6FC5 C9            [10]  642 	ret
                            643 ;src/knifestruct.c:89: u8 checkKnifeCollision(TKnife* cu, u8 xoff, u8 yoff, u8* mapa){
                            644 ;	---------------------------------
                            645 ; Function checkKnifeCollision
                            646 ; ---------------------------------
   6FC6                     647 _checkKnifeCollision::
                            648 ;src/knifestruct.c:91: return *getTilePtr(mapa, cu->x + xoff, cu->y + yoff) <= 2;
   6FC6 D1            [10]  649 	pop	de
   6FC7 C1            [10]  650 	pop	bc
   6FC8 C5            [11]  651 	push	bc
   6FC9 D5            [11]  652 	push	de
   6FCA 69            [ 4]  653 	ld	l, c
   6FCB 60            [ 4]  654 	ld	h, b
   6FCC 23            [ 6]  655 	inc	hl
   6FCD 5E            [ 7]  656 	ld	e,(hl)
   6FCE 7B            [ 4]  657 	ld	a,e
   6FCF 21 05 00      [10]  658 	ld	hl,#5
   6FD2 39            [11]  659 	add	hl,sp
   6FD3 86            [ 7]  660 	add	a, (hl)
   6FD4 57            [ 4]  661 	ld	d,a
   6FD5 0A            [ 7]  662 	ld	a,(bc)
   6FD6 4F            [ 4]  663 	ld	c,a
   6FD7 21 04 00      [10]  664 	ld	hl,#4
   6FDA 39            [11]  665 	add	hl,sp
   6FDB 86            [ 7]  666 	add	a, (hl)
   6FDC 47            [ 4]  667 	ld	b,a
   6FDD D5            [11]  668 	push	de
   6FDE 33            [ 6]  669 	inc	sp
   6FDF C5            [11]  670 	push	bc
   6FE0 33            [ 6]  671 	inc	sp
   6FE1 21 08 00      [10]  672 	ld	hl, #8
   6FE4 39            [11]  673 	add	hl, sp
   6FE5 4E            [ 7]  674 	ld	c, (hl)
   6FE6 23            [ 6]  675 	inc	hl
   6FE7 46            [ 7]  676 	ld	b, (hl)
   6FE8 C5            [11]  677 	push	bc
   6FE9 CD E8 70      [17]  678 	call	_getTilePtr
   6FEC F1            [10]  679 	pop	af
   6FED F1            [10]  680 	pop	af
   6FEE 4E            [ 7]  681 	ld	c,(hl)
   6FEF 3E 02         [ 7]  682 	ld	a,#0x02
   6FF1 91            [ 4]  683 	sub	a, c
   6FF2 3E 00         [ 7]  684 	ld	a,#0x00
   6FF4 17            [ 4]  685 	rla
   6FF5 EE 01         [ 7]  686 	xor	a, #0x01
   6FF7 6F            [ 4]  687 	ld	l, a
   6FF8 C9            [10]  688 	ret
                            689 ;src/knifestruct.c:94: void moverCuchillo(TKnife* cu, u8* mapa){
                            690 ;	---------------------------------
                            691 ; Function moverCuchillo
                            692 ; ---------------------------------
   6FF9                     693 _moverCuchillo::
   6FF9 DD E5         [15]  694 	push	ix
   6FFB DD 21 00 00   [14]  695 	ld	ix,#0
   6FFF DD 39         [15]  696 	add	ix,sp
   7001 F5            [11]  697 	push	af
                            698 ;src/knifestruct.c:95: if(cu->lanzado){
   7002 DD 4E 04      [19]  699 	ld	c,4 (ix)
   7005 DD 46 05      [19]  700 	ld	b,5 (ix)
   7008 C5            [11]  701 	push	bc
   7009 FD E1         [14]  702 	pop	iy
   700B FD 7E 06      [19]  703 	ld	a,6 (iy)
   700E B7            [ 4]  704 	or	a, a
   700F CA E3 70      [10]  705 	jp	Z,00126$
                            706 ;src/knifestruct.c:96: cu->mover = SI;
   7012 21 09 00      [10]  707 	ld	hl,#0x0009
   7015 09            [11]  708 	add	hl,bc
   7016 EB            [ 4]  709 	ex	de,hl
   7017 3E 01         [ 7]  710 	ld	a,#0x01
   7019 12            [ 7]  711 	ld	(de),a
                            712 ;src/knifestruct.c:97: if(cu->direccion == M_derecha){
   701A C5            [11]  713 	push	bc
   701B FD E1         [14]  714 	pop	iy
   701D FD 6E 07      [19]  715 	ld	l,7 (iy)
   7020 7D            [ 4]  716 	ld	a,l
   7021 B7            [ 4]  717 	or	a, a
   7022 20 28         [12]  718 	jr	NZ,00122$
                            719 ;src/knifestruct.c:99: if(checkKnifeCollision(cu, G_KNIFEX_0_W + 1, 0, mapa)){
   7024 C5            [11]  720 	push	bc
   7025 D5            [11]  721 	push	de
   7026 DD 6E 06      [19]  722 	ld	l,6 (ix)
   7029 DD 66 07      [19]  723 	ld	h,7 (ix)
   702C E5            [11]  724 	push	hl
   702D 21 05 00      [10]  725 	ld	hl,#0x0005
   7030 E5            [11]  726 	push	hl
   7031 C5            [11]  727 	push	bc
   7032 CD C6 6F      [17]  728 	call	_checkKnifeCollision
   7035 F1            [10]  729 	pop	af
   7036 F1            [10]  730 	pop	af
   7037 F1            [10]  731 	pop	af
   7038 D1            [10]  732 	pop	de
   7039 C1            [10]  733 	pop	bc
   703A 7D            [ 4]  734 	ld	a,l
   703B B7            [ 4]  735 	or	a, a
   703C 28 09         [12]  736 	jr	Z,00102$
                            737 ;src/knifestruct.c:100: cu->mover = SI;
   703E 3E 01         [ 7]  738 	ld	a,#0x01
   7040 12            [ 7]  739 	ld	(de),a
                            740 ;src/knifestruct.c:101: cu->x++;
   7041 0A            [ 7]  741 	ld	a,(bc)
   7042 3C            [ 4]  742 	inc	a
   7043 02            [ 7]  743 	ld	(bc),a
   7044 C3 E3 70      [10]  744 	jp	00126$
   7047                     745 00102$:
                            746 ;src/knifestruct.c:104: cu->mover=NO;
   7047 AF            [ 4]  747 	xor	a, a
   7048 12            [ 7]  748 	ld	(de),a
   7049 C3 E3 70      [10]  749 	jp	00126$
   704C                     750 00122$:
                            751 ;src/knifestruct.c:107: else if(cu->direccion == M_izquierda){
   704C 7D            [ 4]  752 	ld	a,l
   704D 3D            [ 4]  753 	dec	a
   704E 20 27         [12]  754 	jr	NZ,00119$
                            755 ;src/knifestruct.c:108: if(checkKnifeCollision(cu, -1, 0, mapa)){
   7050 C5            [11]  756 	push	bc
   7051 D5            [11]  757 	push	de
   7052 DD 6E 06      [19]  758 	ld	l,6 (ix)
   7055 DD 66 07      [19]  759 	ld	h,7 (ix)
   7058 E5            [11]  760 	push	hl
   7059 21 FF 00      [10]  761 	ld	hl,#0x00FF
   705C E5            [11]  762 	push	hl
   705D C5            [11]  763 	push	bc
   705E CD C6 6F      [17]  764 	call	_checkKnifeCollision
   7061 F1            [10]  765 	pop	af
   7062 F1            [10]  766 	pop	af
   7063 F1            [10]  767 	pop	af
   7064 D1            [10]  768 	pop	de
   7065 C1            [10]  769 	pop	bc
   7066 7D            [ 4]  770 	ld	a,l
   7067 B7            [ 4]  771 	or	a, a
   7068 28 09         [12]  772 	jr	Z,00105$
                            773 ;src/knifestruct.c:109: cu->mover = SI;
   706A 3E 01         [ 7]  774 	ld	a,#0x01
   706C 12            [ 7]  775 	ld	(de),a
                            776 ;src/knifestruct.c:110: cu->x--;
   706D 0A            [ 7]  777 	ld	a,(bc)
   706E C6 FF         [ 7]  778 	add	a,#0xFF
   7070 02            [ 7]  779 	ld	(bc),a
   7071 18 70         [12]  780 	jr	00126$
   7073                     781 00105$:
                            782 ;src/knifestruct.c:112: cu->mover=NO;
   7073 AF            [ 4]  783 	xor	a, a
   7074 12            [ 7]  784 	ld	(de),a
   7075 18 6C         [12]  785 	jr	00126$
   7077                     786 00119$:
                            787 ;src/knifestruct.c:118: cu->y--;
   7077 79            [ 4]  788 	ld	a,c
   7078 C6 01         [ 7]  789 	add	a, #0x01
   707A DD 77 FE      [19]  790 	ld	-2 (ix),a
   707D 78            [ 4]  791 	ld	a,b
   707E CE 00         [ 7]  792 	adc	a, #0x00
   7080 DD 77 FF      [19]  793 	ld	-1 (ix),a
                            794 ;src/knifestruct.c:115: else if(cu->direccion == M_arriba){
   7083 7D            [ 4]  795 	ld	a,l
   7084 D6 02         [ 7]  796 	sub	a, #0x02
   7086 20 2C         [12]  797 	jr	NZ,00116$
                            798 ;src/knifestruct.c:116: if(checkKnifeCollision(cu, 0, -2, mapa)){
   7088 D5            [11]  799 	push	de
   7089 DD 6E 06      [19]  800 	ld	l,6 (ix)
   708C DD 66 07      [19]  801 	ld	h,7 (ix)
   708F E5            [11]  802 	push	hl
   7090 21 00 FE      [10]  803 	ld	hl,#0xFE00
   7093 E5            [11]  804 	push	hl
   7094 C5            [11]  805 	push	bc
   7095 CD C6 6F      [17]  806 	call	_checkKnifeCollision
   7098 F1            [10]  807 	pop	af
   7099 F1            [10]  808 	pop	af
   709A F1            [10]  809 	pop	af
   709B D1            [10]  810 	pop	de
   709C 7D            [ 4]  811 	ld	a,l
   709D B7            [ 4]  812 	or	a, a
   709E 28 10         [12]  813 	jr	Z,00108$
                            814 ;src/knifestruct.c:117: cu->mover = SI;
   70A0 3E 01         [ 7]  815 	ld	a,#0x01
   70A2 12            [ 7]  816 	ld	(de),a
                            817 ;src/knifestruct.c:118: cu->y--;
   70A3 E1            [10]  818 	pop	hl
   70A4 E5            [11]  819 	push	hl
   70A5 4E            [ 7]  820 	ld	c,(hl)
   70A6 0D            [ 4]  821 	dec	c
   70A7 E1            [10]  822 	pop	hl
   70A8 E5            [11]  823 	push	hl
   70A9 71            [ 7]  824 	ld	(hl),c
                            825 ;src/knifestruct.c:119: cu->y--;
   70AA 0D            [ 4]  826 	dec	c
   70AB E1            [10]  827 	pop	hl
   70AC E5            [11]  828 	push	hl
   70AD 71            [ 7]  829 	ld	(hl),c
   70AE 18 33         [12]  830 	jr	00126$
   70B0                     831 00108$:
                            832 ;src/knifestruct.c:122: cu->mover=NO;
   70B0 AF            [ 4]  833 	xor	a, a
   70B1 12            [ 7]  834 	ld	(de),a
   70B2 18 2F         [12]  835 	jr	00126$
   70B4                     836 00116$:
                            837 ;src/knifestruct.c:125: else if(cu->direccion == M_abajo){
   70B4 7D            [ 4]  838 	ld	a,l
   70B5 D6 03         [ 7]  839 	sub	a, #0x03
   70B7 20 2A         [12]  840 	jr	NZ,00126$
                            841 ;src/knifestruct.c:126: if(checkKnifeCollision(cu, 0, G_KNIFEY_0_H + 2, mapa)){
   70B9 D5            [11]  842 	push	de
   70BA DD 6E 06      [19]  843 	ld	l,6 (ix)
   70BD DD 66 07      [19]  844 	ld	h,7 (ix)
   70C0 E5            [11]  845 	push	hl
   70C1 21 00 0A      [10]  846 	ld	hl,#0x0A00
   70C4 E5            [11]  847 	push	hl
   70C5 C5            [11]  848 	push	bc
   70C6 CD C6 6F      [17]  849 	call	_checkKnifeCollision
   70C9 F1            [10]  850 	pop	af
   70CA F1            [10]  851 	pop	af
   70CB F1            [10]  852 	pop	af
   70CC D1            [10]  853 	pop	de
   70CD 7D            [ 4]  854 	ld	a,l
   70CE B7            [ 4]  855 	or	a, a
   70CF 28 10         [12]  856 	jr	Z,00111$
                            857 ;src/knifestruct.c:127: cu->mover = SI;
   70D1 3E 01         [ 7]  858 	ld	a,#0x01
   70D3 12            [ 7]  859 	ld	(de),a
                            860 ;src/knifestruct.c:128: cu->y++;
   70D4 E1            [10]  861 	pop	hl
   70D5 E5            [11]  862 	push	hl
   70D6 4E            [ 7]  863 	ld	c,(hl)
   70D7 0C            [ 4]  864 	inc	c
   70D8 E1            [10]  865 	pop	hl
   70D9 E5            [11]  866 	push	hl
   70DA 71            [ 7]  867 	ld	(hl),c
                            868 ;src/knifestruct.c:129: cu->y++;
   70DB 0C            [ 4]  869 	inc	c
   70DC E1            [10]  870 	pop	hl
   70DD E5            [11]  871 	push	hl
   70DE 71            [ 7]  872 	ld	(hl),c
   70DF 18 02         [12]  873 	jr	00126$
   70E1                     874 00111$:
                            875 ;src/knifestruct.c:132: cu->mover=NO;
   70E1 AF            [ 4]  876 	xor	a, a
   70E2 12            [ 7]  877 	ld	(de),a
   70E3                     878 00126$:
   70E3 DD F9         [10]  879 	ld	sp, ix
   70E5 DD E1         [14]  880 	pop	ix
   70E7 C9            [10]  881 	ret
                            882 	.area _CODE
                            883 	.area _INITIALIZER
                            884 	.area _CABS (ABS)
