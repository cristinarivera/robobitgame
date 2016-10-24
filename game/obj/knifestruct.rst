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
   4AE5                      56 _dibujarCuchillo::
   4AE5 DD E5         [15]   57 	push	ix
   4AE7 DD 21 00 00   [14]   58 	ld	ix,#0
   4AEB DD 39         [15]   59 	add	ix,sp
   4AED 21 FA FF      [10]   60 	ld	hl,#-6
   4AF0 39            [11]   61 	add	hl,sp
   4AF1 F9            [ 6]   62 	ld	sp,hl
                             63 ;src/knifestruct.c:4: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu->x, cu->y);
   4AF2 DD 5E 04      [19]   64 	ld	e,4 (ix)
   4AF5 DD 56 05      [19]   65 	ld	d,5 (ix)
   4AF8 6B            [ 4]   66 	ld	l, e
   4AF9 62            [ 4]   67 	ld	h, d
   4AFA 23            [ 6]   68 	inc	hl
   4AFB 46            [ 7]   69 	ld	b,(hl)
   4AFC 1A            [ 7]   70 	ld	a,(de)
   4AFD D5            [11]   71 	push	de
   4AFE C5            [11]   72 	push	bc
   4AFF 33            [ 6]   73 	inc	sp
   4B00 F5            [11]   74 	push	af
   4B01 33            [ 6]   75 	inc	sp
   4B02 21 00 C0      [10]   76 	ld	hl,#0xC000
   4B05 E5            [11]   77 	push	hl
   4B06 CD BC 64      [17]   78 	call	_cpct_getScreenPtr
   4B09 D1            [10]   79 	pop	de
   4B0A 33            [ 6]   80 	inc	sp
   4B0B 33            [ 6]   81 	inc	sp
   4B0C E5            [11]   82 	push	hl
                             83 ;src/knifestruct.c:5: if(cu->eje == E_X){
   4B0D D5            [11]   84 	push	de
   4B0E FD E1         [14]   85 	pop	iy
   4B10 FD 4E 08      [19]   86 	ld	c,8 (iy)
                             87 ;src/knifestruct.c:6: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   4B13 DD 7E 06      [19]   88 	ld	a,6 (ix)
   4B16 DD 77 FC      [19]   89 	ld	-4 (ix),a
   4B19 DD 7E 07      [19]   90 	ld	a,7 (ix)
   4B1C DD 77 FD      [19]   91 	ld	-3 (ix),a
   4B1F DD 7E FA      [19]   92 	ld	a,-6 (ix)
   4B22 DD 77 FE      [19]   93 	ld	-2 (ix),a
   4B25 DD 7E FB      [19]   94 	ld	a,-5 (ix)
   4B28 DD 77 FF      [19]   95 	ld	-1 (ix),a
   4B2B 13            [ 6]   96 	inc	de
   4B2C 13            [ 6]   97 	inc	de
   4B2D 13            [ 6]   98 	inc	de
   4B2E 13            [ 6]   99 	inc	de
                            100 ;src/knifestruct.c:5: if(cu->eje == E_X){
   4B2F 79            [ 4]  101 	ld	a,c
   4B30 B7            [ 4]  102 	or	a, a
   4B31 20 1A         [12]  103 	jr	NZ,00104$
                            104 ;src/knifestruct.c:6: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   4B33 EB            [ 4]  105 	ex	de,hl
   4B34 4E            [ 7]  106 	ld	c,(hl)
   4B35 23            [ 6]  107 	inc	hl
   4B36 46            [ 7]  108 	ld	b,(hl)
   4B37 D1            [10]  109 	pop	de
   4B38 E1            [10]  110 	pop	hl
   4B39 E5            [11]  111 	push	hl
   4B3A D5            [11]  112 	push	de
   4B3B E5            [11]  113 	push	hl
   4B3C 21 04 04      [10]  114 	ld	hl,#0x0404
   4B3F E5            [11]  115 	push	hl
   4B40 DD 6E FE      [19]  116 	ld	l,-2 (ix)
   4B43 DD 66 FF      [19]  117 	ld	h,-1 (ix)
   4B46 E5            [11]  118 	push	hl
   4B47 C5            [11]  119 	push	bc
   4B48 CD DC 64      [17]  120 	call	_cpct_drawSpriteMaskedAlignedTable
   4B4B 18 1B         [12]  121 	jr	00106$
   4B4D                     122 00104$:
                            123 ;src/knifestruct.c:9: else if(cu->eje == E_Y){
   4B4D 0D            [ 4]  124 	dec	c
   4B4E 20 18         [12]  125 	jr	NZ,00106$
                            126 ;src/knifestruct.c:10: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   4B50 EB            [ 4]  127 	ex	de,hl
   4B51 4E            [ 7]  128 	ld	c,(hl)
   4B52 23            [ 6]  129 	inc	hl
   4B53 46            [ 7]  130 	ld	b,(hl)
   4B54 D1            [10]  131 	pop	de
   4B55 E1            [10]  132 	pop	hl
   4B56 E5            [11]  133 	push	hl
   4B57 D5            [11]  134 	push	de
   4B58 E5            [11]  135 	push	hl
   4B59 21 02 08      [10]  136 	ld	hl,#0x0802
   4B5C E5            [11]  137 	push	hl
   4B5D DD 6E FE      [19]  138 	ld	l,-2 (ix)
   4B60 DD 66 FF      [19]  139 	ld	h,-1 (ix)
   4B63 E5            [11]  140 	push	hl
   4B64 C5            [11]  141 	push	bc
   4B65 CD DC 64      [17]  142 	call	_cpct_drawSpriteMaskedAlignedTable
   4B68                     143 00106$:
   4B68 DD F9         [10]  144 	ld	sp, ix
   4B6A DD E1         [14]  145 	pop	ix
   4B6C C9            [10]  146 	ret
                            147 ;src/knifestruct.c:14: void borrarCuchillo(TKnife* cu, u8* mapa) {
                            148 ;	---------------------------------
                            149 ; Function borrarCuchillo
                            150 ; ---------------------------------
   4B6D                     151 _borrarCuchillo::
   4B6D DD E5         [15]  152 	push	ix
   4B6F DD 21 00 00   [14]  153 	ld	ix,#0
   4B73 DD 39         [15]  154 	add	ix,sp
   4B75 21 F9 FF      [10]  155 	ld	hl,#-7
   4B78 39            [11]  156 	add	hl,sp
   4B79 F9            [ 6]  157 	ld	sp,hl
                            158 ;src/knifestruct.c:19: u8 w = 2 + (cu->px & 1);
   4B7A DD 4E 04      [19]  159 	ld	c,4 (ix)
   4B7D DD 46 05      [19]  160 	ld	b,5 (ix)
   4B80 69            [ 4]  161 	ld	l, c
   4B81 60            [ 4]  162 	ld	h, b
   4B82 23            [ 6]  163 	inc	hl
   4B83 23            [ 6]  164 	inc	hl
   4B84 7E            [ 7]  165 	ld	a,(hl)
   4B85 DD 77 FB      [19]  166 	ld	-5 (ix), a
   4B88 E6 01         [ 7]  167 	and	a, #0x01
   4B8A C6 02         [ 7]  168 	add	a, #0x02
   4B8C DD 77 F9      [19]  169 	ld	-7 (ix),a
                            170 ;src/knifestruct.c:20: u8 h = 2 + (cu->py & 3 ? 1 : 0);
   4B8F 69            [ 4]  171 	ld	l, c
   4B90 60            [ 4]  172 	ld	h, b
   4B91 23            [ 6]  173 	inc	hl
   4B92 23            [ 6]  174 	inc	hl
   4B93 23            [ 6]  175 	inc	hl
   4B94 5E            [ 7]  176 	ld	e,(hl)
   4B95 7B            [ 4]  177 	ld	a,e
   4B96 E6 03         [ 7]  178 	and	a, #0x03
   4B98 28 04         [12]  179 	jr	Z,00105$
   4B9A 3E 01         [ 7]  180 	ld	a,#0x01
   4B9C 18 02         [12]  181 	jr	00106$
   4B9E                     182 00105$:
   4B9E 3E 00         [ 7]  183 	ld	a,#0x00
   4BA0                     184 00106$:
   4BA0 C6 02         [ 7]  185 	add	a, #0x02
   4BA2 DD 77 FA      [19]  186 	ld	-6 (ix),a
                            187 ;src/knifestruct.c:22: cpct_etm_drawTileBox2x4 (cu->px / 2, (cu->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   4BA5 DD 7E 06      [19]  188 	ld	a,6 (ix)
   4BA8 DD 77 FC      [19]  189 	ld	-4 (ix),a
   4BAB DD 7E 07      [19]  190 	ld	a,7 (ix)
   4BAE DD 77 FD      [19]  191 	ld	-3 (ix),a
   4BB1 16 00         [ 7]  192 	ld	d,#0x00
   4BB3 7B            [ 4]  193 	ld	a,e
   4BB4 C6 E8         [ 7]  194 	add	a,#0xE8
   4BB6 DD 77 FE      [19]  195 	ld	-2 (ix),a
   4BB9 7A            [ 4]  196 	ld	a,d
   4BBA CE FF         [ 7]  197 	adc	a,#0xFF
   4BBC DD 77 FF      [19]  198 	ld	-1 (ix),a
   4BBF DD 6E FE      [19]  199 	ld	l,-2 (ix)
   4BC2 DD 66 FF      [19]  200 	ld	h,-1 (ix)
   4BC5 DD CB FF 7E   [20]  201 	bit	7, -1 (ix)
   4BC9 28 04         [12]  202 	jr	Z,00107$
   4BCB 21 EB FF      [10]  203 	ld	hl,#0xFFEB
   4BCE 19            [11]  204 	add	hl,de
   4BCF                     205 00107$:
   4BCF CB 2C         [ 8]  206 	sra	h
   4BD1 CB 1D         [ 8]  207 	rr	l
   4BD3 CB 2C         [ 8]  208 	sra	h
   4BD5 CB 1D         [ 8]  209 	rr	l
   4BD7 5D            [ 4]  210 	ld	e,l
   4BD8 DD 56 FB      [19]  211 	ld	d,-5 (ix)
   4BDB CB 3A         [ 8]  212 	srl	d
   4BDD C5            [11]  213 	push	bc
   4BDE DD 6E FC      [19]  214 	ld	l,-4 (ix)
   4BE1 DD 66 FD      [19]  215 	ld	h,-3 (ix)
   4BE4 E5            [11]  216 	push	hl
   4BE5 21 F0 C0      [10]  217 	ld	hl,#0xC0F0
   4BE8 E5            [11]  218 	push	hl
   4BE9 3E 28         [ 7]  219 	ld	a,#0x28
   4BEB F5            [11]  220 	push	af
   4BEC 33            [ 6]  221 	inc	sp
   4BED DD 66 FA      [19]  222 	ld	h,-6 (ix)
   4BF0 DD 6E F9      [19]  223 	ld	l,-7 (ix)
   4BF3 E5            [11]  224 	push	hl
   4BF4 7B            [ 4]  225 	ld	a,e
   4BF5 F5            [11]  226 	push	af
   4BF6 33            [ 6]  227 	inc	sp
   4BF7 D5            [11]  228 	push	de
   4BF8 33            [ 6]  229 	inc	sp
   4BF9 CD 9E 59      [17]  230 	call	_cpct_etm_drawTileBox2x4
   4BFC C1            [10]  231 	pop	bc
                            232 ;src/knifestruct.c:23: if(!cu->mover){
   4BFD C5            [11]  233 	push	bc
   4BFE FD E1         [14]  234 	pop	iy
   4C00 FD 7E 09      [19]  235 	ld	a,9 (iy)
   4C03 B7            [ 4]  236 	or	a, a
   4C04 20 06         [12]  237 	jr	NZ,00103$
                            238 ;src/knifestruct.c:24: cu->lanzado = NO;
   4C06 21 06 00      [10]  239 	ld	hl,#0x0006
   4C09 09            [11]  240 	add	hl,bc
   4C0A 36 00         [10]  241 	ld	(hl),#0x00
   4C0C                     242 00103$:
   4C0C DD F9         [10]  243 	ld	sp, ix
   4C0E DD E1         [14]  244 	pop	ix
   4C10 C9            [10]  245 	ret
                            246 ;src/knifestruct.c:28: void redibujarCuchillo(TKnife* cu, u8* g_tablatrans, u8* mapa) {
                            247 ;	---------------------------------
                            248 ; Function redibujarCuchillo
                            249 ; ---------------------------------
   4C11                     250 _redibujarCuchillo::
   4C11 DD E5         [15]  251 	push	ix
   4C13 DD 21 00 00   [14]  252 	ld	ix,#0
   4C17 DD 39         [15]  253 	add	ix,sp
                            254 ;src/knifestruct.c:29: borrarCuchillo(cu, mapa);
   4C19 DD 6E 08      [19]  255 	ld	l,8 (ix)
   4C1C DD 66 09      [19]  256 	ld	h,9 (ix)
   4C1F E5            [11]  257 	push	hl
   4C20 DD 6E 04      [19]  258 	ld	l,4 (ix)
   4C23 DD 66 05      [19]  259 	ld	h,5 (ix)
   4C26 E5            [11]  260 	push	hl
   4C27 CD 6D 4B      [17]  261 	call	_borrarCuchillo
   4C2A F1            [10]  262 	pop	af
   4C2B F1            [10]  263 	pop	af
                            264 ;src/knifestruct.c:30: cu->px = cu->x;
   4C2C DD 4E 04      [19]  265 	ld	c,4 (ix)
   4C2F DD 46 05      [19]  266 	ld	b,5 (ix)
   4C32 59            [ 4]  267 	ld	e, c
   4C33 50            [ 4]  268 	ld	d, b
   4C34 13            [ 6]  269 	inc	de
   4C35 13            [ 6]  270 	inc	de
   4C36 0A            [ 7]  271 	ld	a,(bc)
   4C37 12            [ 7]  272 	ld	(de),a
                            273 ;src/knifestruct.c:31: cu->py = cu->y;
   4C38 59            [ 4]  274 	ld	e, c
   4C39 50            [ 4]  275 	ld	d, b
   4C3A 13            [ 6]  276 	inc	de
   4C3B 13            [ 6]  277 	inc	de
   4C3C 13            [ 6]  278 	inc	de
   4C3D 69            [ 4]  279 	ld	l, c
   4C3E 60            [ 4]  280 	ld	h, b
   4C3F 23            [ 6]  281 	inc	hl
   4C40 7E            [ 7]  282 	ld	a,(hl)
   4C41 12            [ 7]  283 	ld	(de),a
                            284 ;src/knifestruct.c:32: dibujarCuchillo(cu, g_tablatrans);
   4C42 DD 6E 06      [19]  285 	ld	l,6 (ix)
   4C45 DD 66 07      [19]  286 	ld	h,7 (ix)
   4C48 E5            [11]  287 	push	hl
   4C49 C5            [11]  288 	push	bc
   4C4A CD E5 4A      [17]  289 	call	_dibujarCuchillo
   4C4D F1            [10]  290 	pop	af
   4C4E F1            [10]  291 	pop	af
   4C4F DD E1         [14]  292 	pop	ix
   4C51 C9            [10]  293 	ret
                            294 ;src/knifestruct.c:35: void lanzarCuchillo(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans){
                            295 ;	---------------------------------
                            296 ; Function lanzarCuchillo
                            297 ; ---------------------------------
   4C52                     298 _lanzarCuchillo::
   4C52 DD E5         [15]  299 	push	ix
   4C54 DD 21 00 00   [14]  300 	ld	ix,#0
   4C58 DD 39         [15]  301 	add	ix,sp
   4C5A 21 F2 FF      [10]  302 	ld	hl,#-14
   4C5D 39            [11]  303 	add	hl,sp
   4C5E F9            [ 6]  304 	ld	sp,hl
                            305 ;src/knifestruct.c:37: if(!cu->lanzado){
   4C5F DD 4E 04      [19]  306 	ld	c,4 (ix)
   4C62 DD 46 05      [19]  307 	ld	b,5 (ix)
   4C65 21 06 00      [10]  308 	ld	hl,#0x0006
   4C68 09            [11]  309 	add	hl,bc
   4C69 DD 75 FE      [19]  310 	ld	-2 (ix),l
   4C6C DD 74 FF      [19]  311 	ld	-1 (ix),h
   4C6F DD 6E FE      [19]  312 	ld	l,-2 (ix)
   4C72 DD 66 FF      [19]  313 	ld	h,-1 (ix)
   4C75 7E            [ 7]  314 	ld	a,(hl)
   4C76 B7            [ 4]  315 	or	a, a
   4C77 C2 AC 4E      [10]  316 	jp	NZ,00122$
                            317 ;src/knifestruct.c:39: if(prota->mira == M_derecha){
   4C7A DD 5E 06      [19]  318 	ld	e,6 (ix)
   4C7D DD 56 07      [19]  319 	ld	d,7 (ix)
   4C80 6B            [ 4]  320 	ld	l, e
   4C81 62            [ 4]  321 	ld	h, d
   4C82 C5            [11]  322 	push	bc
   4C83 01 07 00      [10]  323 	ld	bc, #0x0007
   4C86 09            [11]  324 	add	hl, bc
   4C87 C1            [10]  325 	pop	bc
   4C88 6E            [ 7]  326 	ld	l,(hl)
                            327 ;src/knifestruct.c:40: if( *getTilePtr(mapa, prota->x + G_HERO_W + G_KNIFEX_0_W + 1, prota->y + G_HERO_H /2) <= 2){
   4C89 7B            [ 4]  328 	ld	a,e
   4C8A C6 01         [ 7]  329 	add	a, #0x01
   4C8C DD 77 F5      [19]  330 	ld	-11 (ix),a
   4C8F 7A            [ 4]  331 	ld	a,d
   4C90 CE 00         [ 7]  332 	adc	a, #0x00
   4C92 DD 77 F6      [19]  333 	ld	-10 (ix),a
                            334 ;src/knifestruct.c:42: cu->direccion = M_derecha;
   4C95 79            [ 4]  335 	ld	a,c
   4C96 C6 07         [ 7]  336 	add	a, #0x07
   4C98 DD 77 FC      [19]  337 	ld	-4 (ix),a
   4C9B 78            [ 4]  338 	ld	a,b
   4C9C CE 00         [ 7]  339 	adc	a, #0x00
   4C9E DD 77 FD      [19]  340 	ld	-3 (ix),a
                            341 ;src/knifestruct.c:44: cu->y=prota->y + G_HERO_H /2;
   4CA1 79            [ 4]  342 	ld	a,c
   4CA2 C6 01         [ 7]  343 	add	a, #0x01
   4CA4 DD 77 F8      [19]  344 	ld	-8 (ix),a
   4CA7 78            [ 4]  345 	ld	a,b
   4CA8 CE 00         [ 7]  346 	adc	a, #0x00
   4CAA DD 77 F9      [19]  347 	ld	-7 (ix),a
                            348 ;src/knifestruct.c:45: cu->sprite=g_knifeX_0;
   4CAD 79            [ 4]  349 	ld	a,c
   4CAE C6 04         [ 7]  350 	add	a, #0x04
   4CB0 DD 77 FA      [19]  351 	ld	-6 (ix),a
   4CB3 78            [ 4]  352 	ld	a,b
   4CB4 CE 00         [ 7]  353 	adc	a, #0x00
   4CB6 DD 77 FB      [19]  354 	ld	-5 (ix),a
                            355 ;src/knifestruct.c:46: cu->eje = E_X;
   4CB9 79            [ 4]  356 	ld	a,c
   4CBA C6 08         [ 7]  357 	add	a, #0x08
   4CBC DD 77 F3      [19]  358 	ld	-13 (ix),a
   4CBF 78            [ 4]  359 	ld	a,b
   4CC0 CE 00         [ 7]  360 	adc	a, #0x00
   4CC2 DD 77 F4      [19]  361 	ld	-12 (ix),a
                            362 ;src/knifestruct.c:39: if(prota->mira == M_derecha){
   4CC5 7D            [ 4]  363 	ld	a,l
   4CC6 B7            [ 4]  364 	or	a, a
   4CC7 20 77         [12]  365 	jr	NZ,00118$
                            366 ;src/knifestruct.c:40: if( *getTilePtr(mapa, prota->x + G_HERO_W + G_KNIFEX_0_W + 1, prota->y + G_HERO_H /2) <= 2){
   4CC9 DD 6E F5      [19]  367 	ld	l,-11 (ix)
   4CCC DD 66 F6      [19]  368 	ld	h,-10 (ix)
   4CCF 7E            [ 7]  369 	ld	a,(hl)
   4CD0 C6 0B         [ 7]  370 	add	a, #0x0B
   4CD2 DD 77 F7      [19]  371 	ld	-9 (ix),a
   4CD5 1A            [ 7]  372 	ld	a,(de)
   4CD6 C6 0C         [ 7]  373 	add	a, #0x0C
   4CD8 DD 77 F2      [19]  374 	ld	-14 (ix),a
   4CDB C5            [11]  375 	push	bc
   4CDC D5            [11]  376 	push	de
   4CDD DD 66 F7      [19]  377 	ld	h,-9 (ix)
   4CE0 DD 6E F2      [19]  378 	ld	l,-14 (ix)
   4CE3 E5            [11]  379 	push	hl
   4CE4 DD 6E 08      [19]  380 	ld	l,8 (ix)
   4CE7 DD 66 09      [19]  381 	ld	h,9 (ix)
   4CEA E5            [11]  382 	push	hl
   4CEB CD D3 4F      [17]  383 	call	_getTilePtr
   4CEE F1            [10]  384 	pop	af
   4CEF F1            [10]  385 	pop	af
   4CF0 D1            [10]  386 	pop	de
   4CF1 C1            [10]  387 	pop	bc
   4CF2 6E            [ 7]  388 	ld	l,(hl)
   4CF3 3E 02         [ 7]  389 	ld	a,#0x02
   4CF5 95            [ 4]  390 	sub	a, l
   4CF6 DA AC 4E      [10]  391 	jp	C,00122$
                            392 ;src/knifestruct.c:41: cu->lanzado = SI;
   4CF9 DD 6E FE      [19]  393 	ld	l,-2 (ix)
   4CFC DD 66 FF      [19]  394 	ld	h,-1 (ix)
   4CFF 36 01         [10]  395 	ld	(hl),#0x01
                            396 ;src/knifestruct.c:42: cu->direccion = M_derecha;
   4D01 DD 6E FC      [19]  397 	ld	l,-4 (ix)
   4D04 DD 66 FD      [19]  398 	ld	h,-3 (ix)
   4D07 36 00         [10]  399 	ld	(hl),#0x00
                            400 ;src/knifestruct.c:43: cu->x=prota->x + G_HERO_W;
   4D09 1A            [ 7]  401 	ld	a,(de)
   4D0A C6 07         [ 7]  402 	add	a, #0x07
   4D0C 02            [ 7]  403 	ld	(bc),a
                            404 ;src/knifestruct.c:44: cu->y=prota->y + G_HERO_H /2;
   4D0D DD 6E F5      [19]  405 	ld	l,-11 (ix)
   4D10 DD 66 F6      [19]  406 	ld	h,-10 (ix)
   4D13 7E            [ 7]  407 	ld	a,(hl)
   4D14 C6 0B         [ 7]  408 	add	a, #0x0B
   4D16 DD 6E F8      [19]  409 	ld	l,-8 (ix)
   4D19 DD 66 F9      [19]  410 	ld	h,-7 (ix)
   4D1C 77            [ 7]  411 	ld	(hl),a
                            412 ;src/knifestruct.c:45: cu->sprite=g_knifeX_0;
   4D1D DD 6E FA      [19]  413 	ld	l,-6 (ix)
   4D20 DD 66 FB      [19]  414 	ld	h,-5 (ix)
   4D23 36 C0         [10]  415 	ld	(hl),#<(_g_knifeX_0)
   4D25 23            [ 6]  416 	inc	hl
   4D26 36 17         [10]  417 	ld	(hl),#>(_g_knifeX_0)
                            418 ;src/knifestruct.c:46: cu->eje = E_X;
   4D28 DD 6E F3      [19]  419 	ld	l,-13 (ix)
   4D2B DD 66 F4      [19]  420 	ld	h,-12 (ix)
   4D2E 36 00         [10]  421 	ld	(hl),#0x00
                            422 ;src/knifestruct.c:47: dibujarCuchillo(cu, g_tablatrans);
   4D30 DD 6E 0A      [19]  423 	ld	l,10 (ix)
   4D33 DD 66 0B      [19]  424 	ld	h,11 (ix)
   4D36 E5            [11]  425 	push	hl
   4D37 C5            [11]  426 	push	bc
   4D38 CD E5 4A      [17]  427 	call	_dibujarCuchillo
   4D3B F1            [10]  428 	pop	af
   4D3C F1            [10]  429 	pop	af
   4D3D C3 AC 4E      [10]  430 	jp	00122$
   4D40                     431 00118$:
                            432 ;src/knifestruct.c:50: else if(prota->mira == M_izquierda){
   4D40 7D            [ 4]  433 	ld	a,l
   4D41 3D            [ 4]  434 	dec	a
   4D42 20 77         [12]  435 	jr	NZ,00115$
                            436 ;src/knifestruct.c:51: if( *getTilePtr(mapa, prota->x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota->y + G_HERO_H /2) <= 2){
   4D44 DD 6E F5      [19]  437 	ld	l,-11 (ix)
   4D47 DD 66 F6      [19]  438 	ld	h,-10 (ix)
   4D4A 7E            [ 7]  439 	ld	a,(hl)
   4D4B C6 0B         [ 7]  440 	add	a, #0x0B
   4D4D DD 77 F2      [19]  441 	ld	-14 (ix),a
   4D50 1A            [ 7]  442 	ld	a,(de)
   4D51 C6 F6         [ 7]  443 	add	a,#0xF6
   4D53 DD 77 F7      [19]  444 	ld	-9 (ix),a
   4D56 C5            [11]  445 	push	bc
   4D57 D5            [11]  446 	push	de
   4D58 DD 66 F2      [19]  447 	ld	h,-14 (ix)
   4D5B DD 6E F7      [19]  448 	ld	l,-9 (ix)
   4D5E E5            [11]  449 	push	hl
   4D5F DD 6E 08      [19]  450 	ld	l,8 (ix)
   4D62 DD 66 09      [19]  451 	ld	h,9 (ix)
   4D65 E5            [11]  452 	push	hl
   4D66 CD D3 4F      [17]  453 	call	_getTilePtr
   4D69 F1            [10]  454 	pop	af
   4D6A F1            [10]  455 	pop	af
   4D6B D1            [10]  456 	pop	de
   4D6C C1            [10]  457 	pop	bc
   4D6D 6E            [ 7]  458 	ld	l,(hl)
   4D6E 3E 02         [ 7]  459 	ld	a,#0x02
   4D70 95            [ 4]  460 	sub	a, l
   4D71 DA AC 4E      [10]  461 	jp	C,00122$
                            462 ;src/knifestruct.c:52: cu->lanzado = SI;
   4D74 DD 6E FE      [19]  463 	ld	l,-2 (ix)
   4D77 DD 66 FF      [19]  464 	ld	h,-1 (ix)
   4D7A 36 01         [10]  465 	ld	(hl),#0x01
                            466 ;src/knifestruct.c:53: cu->direccion = M_izquierda;
   4D7C DD 6E FC      [19]  467 	ld	l,-4 (ix)
   4D7F DD 66 FD      [19]  468 	ld	h,-3 (ix)
   4D82 36 01         [10]  469 	ld	(hl),#0x01
                            470 ;src/knifestruct.c:54: cu->x = prota->x - G_KNIFEX_0_W;
   4D84 1A            [ 7]  471 	ld	a,(de)
   4D85 C6 FC         [ 7]  472 	add	a,#0xFC
   4D87 02            [ 7]  473 	ld	(bc),a
                            474 ;src/knifestruct.c:55: cu->y = prota->y + G_HERO_H /2;
   4D88 DD 6E F5      [19]  475 	ld	l,-11 (ix)
   4D8B DD 66 F6      [19]  476 	ld	h,-10 (ix)
   4D8E 7E            [ 7]  477 	ld	a,(hl)
   4D8F C6 0B         [ 7]  478 	add	a, #0x0B
   4D91 DD 6E F8      [19]  479 	ld	l,-8 (ix)
   4D94 DD 66 F9      [19]  480 	ld	h,-7 (ix)
   4D97 77            [ 7]  481 	ld	(hl),a
                            482 ;src/knifestruct.c:56: cu->sprite = g_knifeX_1;
   4D98 DD 6E FA      [19]  483 	ld	l,-6 (ix)
   4D9B DD 66 FB      [19]  484 	ld	h,-5 (ix)
   4D9E 36 D0         [10]  485 	ld	(hl),#<(_g_knifeX_1)
   4DA0 23            [ 6]  486 	inc	hl
   4DA1 36 17         [10]  487 	ld	(hl),#>(_g_knifeX_1)
                            488 ;src/knifestruct.c:57: cu->eje = E_X;
   4DA3 DD 6E F3      [19]  489 	ld	l,-13 (ix)
   4DA6 DD 66 F4      [19]  490 	ld	h,-12 (ix)
   4DA9 36 00         [10]  491 	ld	(hl),#0x00
                            492 ;src/knifestruct.c:58: dibujarCuchillo(cu, g_tablatrans);
   4DAB DD 6E 0A      [19]  493 	ld	l,10 (ix)
   4DAE DD 66 0B      [19]  494 	ld	h,11 (ix)
   4DB1 E5            [11]  495 	push	hl
   4DB2 C5            [11]  496 	push	bc
   4DB3 CD E5 4A      [17]  497 	call	_dibujarCuchillo
   4DB6 F1            [10]  498 	pop	af
   4DB7 F1            [10]  499 	pop	af
   4DB8 C3 AC 4E      [10]  500 	jp	00122$
   4DBB                     501 00115$:
                            502 ;src/knifestruct.c:61: else if(prota->mira == M_abajo){
   4DBB 7D            [ 4]  503 	ld	a,l
   4DBC D6 03         [ 7]  504 	sub	a, #0x03
   4DBE 20 76         [12]  505 	jr	NZ,00112$
                            506 ;src/knifestruct.c:63: if( *getTilePtr(mapa, prota->x + G_HERO_W / 2, prota->y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   4DC0 DD 6E F5      [19]  507 	ld	l,-11 (ix)
   4DC3 DD 66 F6      [19]  508 	ld	h,-10 (ix)
   4DC6 7E            [ 7]  509 	ld	a,(hl)
   4DC7 C6 1F         [ 7]  510 	add	a, #0x1F
   4DC9 DD 77 F2      [19]  511 	ld	-14 (ix),a
   4DCC 1A            [ 7]  512 	ld	a,(de)
   4DCD C6 03         [ 7]  513 	add	a, #0x03
   4DCF DD 77 F7      [19]  514 	ld	-9 (ix),a
   4DD2 C5            [11]  515 	push	bc
   4DD3 D5            [11]  516 	push	de
   4DD4 DD 66 F2      [19]  517 	ld	h,-14 (ix)
   4DD7 DD 6E F7      [19]  518 	ld	l,-9 (ix)
   4DDA E5            [11]  519 	push	hl
   4DDB DD 6E 08      [19]  520 	ld	l,8 (ix)
   4DDE DD 66 09      [19]  521 	ld	h,9 (ix)
   4DE1 E5            [11]  522 	push	hl
   4DE2 CD D3 4F      [17]  523 	call	_getTilePtr
   4DE5 F1            [10]  524 	pop	af
   4DE6 F1            [10]  525 	pop	af
   4DE7 D1            [10]  526 	pop	de
   4DE8 C1            [10]  527 	pop	bc
   4DE9 6E            [ 7]  528 	ld	l,(hl)
   4DEA 3E 02         [ 7]  529 	ld	a,#0x02
   4DEC 95            [ 4]  530 	sub	a, l
   4DED DA AC 4E      [10]  531 	jp	C,00122$
                            532 ;src/knifestruct.c:64: cu->lanzado = SI;
   4DF0 DD 6E FE      [19]  533 	ld	l,-2 (ix)
   4DF3 DD 66 FF      [19]  534 	ld	h,-1 (ix)
   4DF6 36 01         [10]  535 	ld	(hl),#0x01
                            536 ;src/knifestruct.c:65: cu->direccion = M_abajo;
   4DF8 DD 6E FC      [19]  537 	ld	l,-4 (ix)
   4DFB DD 66 FD      [19]  538 	ld	h,-3 (ix)
   4DFE 36 03         [10]  539 	ld	(hl),#0x03
                            540 ;src/knifestruct.c:66: cu->x = prota->x + G_HERO_W / 2;
   4E00 1A            [ 7]  541 	ld	a,(de)
   4E01 C6 03         [ 7]  542 	add	a, #0x03
   4E03 02            [ 7]  543 	ld	(bc),a
                            544 ;src/knifestruct.c:67: cu->y = prota->y + G_HERO_H;
   4E04 DD 6E F5      [19]  545 	ld	l,-11 (ix)
   4E07 DD 66 F6      [19]  546 	ld	h,-10 (ix)
   4E0A 7E            [ 7]  547 	ld	a,(hl)
   4E0B C6 16         [ 7]  548 	add	a, #0x16
   4E0D DD 6E F8      [19]  549 	ld	l,-8 (ix)
   4E10 DD 66 F9      [19]  550 	ld	h,-7 (ix)
   4E13 77            [ 7]  551 	ld	(hl),a
                            552 ;src/knifestruct.c:68: cu->sprite = g_knifeY_0;
   4E14 DD 6E FA      [19]  553 	ld	l,-6 (ix)
   4E17 DD 66 FB      [19]  554 	ld	h,-5 (ix)
   4E1A 36 A0         [10]  555 	ld	(hl),#<(_g_knifeY_0)
   4E1C 23            [ 6]  556 	inc	hl
   4E1D 36 17         [10]  557 	ld	(hl),#>(_g_knifeY_0)
                            558 ;src/knifestruct.c:69: cu->eje = E_Y;
   4E1F DD 6E F3      [19]  559 	ld	l,-13 (ix)
   4E22 DD 66 F4      [19]  560 	ld	h,-12 (ix)
   4E25 36 01         [10]  561 	ld	(hl),#0x01
                            562 ;src/knifestruct.c:70: dibujarCuchillo(cu, g_tablatrans);
   4E27 DD 6E 0A      [19]  563 	ld	l,10 (ix)
   4E2A DD 66 0B      [19]  564 	ld	h,11 (ix)
   4E2D E5            [11]  565 	push	hl
   4E2E C5            [11]  566 	push	bc
   4E2F CD E5 4A      [17]  567 	call	_dibujarCuchillo
   4E32 F1            [10]  568 	pop	af
   4E33 F1            [10]  569 	pop	af
   4E34 18 76         [12]  570 	jr	00122$
   4E36                     571 00112$:
                            572 ;src/knifestruct.c:73: else if(prota->mira == M_arriba){
   4E36 7D            [ 4]  573 	ld	a,l
   4E37 D6 02         [ 7]  574 	sub	a, #0x02
   4E39 20 71         [12]  575 	jr	NZ,00122$
                            576 ;src/knifestruct.c:74: if( *getTilePtr(mapa, prota->x + G_HERO_W / 2, prota->y - G_KNIFEY_0_H - 1) <= 2){
   4E3B DD 6E F5      [19]  577 	ld	l,-11 (ix)
   4E3E DD 66 F6      [19]  578 	ld	h,-10 (ix)
   4E41 7E            [ 7]  579 	ld	a,(hl)
   4E42 C6 F7         [ 7]  580 	add	a,#0xF7
   4E44 DD 77 F2      [19]  581 	ld	-14 (ix),a
   4E47 1A            [ 7]  582 	ld	a,(de)
   4E48 C6 03         [ 7]  583 	add	a, #0x03
   4E4A DD 77 F7      [19]  584 	ld	-9 (ix),a
   4E4D C5            [11]  585 	push	bc
   4E4E D5            [11]  586 	push	de
   4E4F DD 66 F2      [19]  587 	ld	h,-14 (ix)
   4E52 DD 6E F7      [19]  588 	ld	l,-9 (ix)
   4E55 E5            [11]  589 	push	hl
   4E56 DD 6E 08      [19]  590 	ld	l,8 (ix)
   4E59 DD 66 09      [19]  591 	ld	h,9 (ix)
   4E5C E5            [11]  592 	push	hl
   4E5D CD D3 4F      [17]  593 	call	_getTilePtr
   4E60 F1            [10]  594 	pop	af
   4E61 F1            [10]  595 	pop	af
   4E62 D1            [10]  596 	pop	de
   4E63 C1            [10]  597 	pop	bc
   4E64 6E            [ 7]  598 	ld	l,(hl)
   4E65 3E 02         [ 7]  599 	ld	a,#0x02
   4E67 95            [ 4]  600 	sub	a, l
   4E68 38 42         [12]  601 	jr	C,00122$
                            602 ;src/knifestruct.c:75: cu->lanzado = SI;
   4E6A DD 6E FE      [19]  603 	ld	l,-2 (ix)
   4E6D DD 66 FF      [19]  604 	ld	h,-1 (ix)
   4E70 36 01         [10]  605 	ld	(hl),#0x01
                            606 ;src/knifestruct.c:76: cu->direccion = M_arriba;
   4E72 DD 6E FC      [19]  607 	ld	l,-4 (ix)
   4E75 DD 66 FD      [19]  608 	ld	h,-3 (ix)
   4E78 36 02         [10]  609 	ld	(hl),#0x02
                            610 ;src/knifestruct.c:77: cu->x = prota->x + G_HERO_W / 2;
   4E7A 1A            [ 7]  611 	ld	a,(de)
   4E7B C6 03         [ 7]  612 	add	a, #0x03
   4E7D 02            [ 7]  613 	ld	(bc),a
                            614 ;src/knifestruct.c:78: cu->y = prota->y;
   4E7E DD 6E F5      [19]  615 	ld	l,-11 (ix)
   4E81 DD 66 F6      [19]  616 	ld	h,-10 (ix)
   4E84 5E            [ 7]  617 	ld	e,(hl)
   4E85 DD 6E F8      [19]  618 	ld	l,-8 (ix)
   4E88 DD 66 F9      [19]  619 	ld	h,-7 (ix)
   4E8B 73            [ 7]  620 	ld	(hl),e
                            621 ;src/knifestruct.c:79: cu->sprite = g_knifeY_1;
   4E8C DD 6E FA      [19]  622 	ld	l,-6 (ix)
   4E8F DD 66 FB      [19]  623 	ld	h,-5 (ix)
   4E92 36 B0         [10]  624 	ld	(hl),#<(_g_knifeY_1)
   4E94 23            [ 6]  625 	inc	hl
   4E95 36 17         [10]  626 	ld	(hl),#>(_g_knifeY_1)
                            627 ;src/knifestruct.c:80: cu->eje = E_Y;
   4E97 DD 6E F3      [19]  628 	ld	l,-13 (ix)
   4E9A DD 66 F4      [19]  629 	ld	h,-12 (ix)
   4E9D 36 01         [10]  630 	ld	(hl),#0x01
                            631 ;src/knifestruct.c:81: dibujarCuchillo(cu, g_tablatrans);
   4E9F DD 6E 0A      [19]  632 	ld	l,10 (ix)
   4EA2 DD 66 0B      [19]  633 	ld	h,11 (ix)
   4EA5 E5            [11]  634 	push	hl
   4EA6 C5            [11]  635 	push	bc
   4EA7 CD E5 4A      [17]  636 	call	_dibujarCuchillo
   4EAA F1            [10]  637 	pop	af
   4EAB F1            [10]  638 	pop	af
   4EAC                     639 00122$:
   4EAC DD F9         [10]  640 	ld	sp, ix
   4EAE DD E1         [14]  641 	pop	ix
   4EB0 C9            [10]  642 	ret
                            643 ;src/knifestruct.c:89: u8 checkKnifeCollision(TKnife* cu, u8 xoff, u8 yoff, u8* mapa){
                            644 ;	---------------------------------
                            645 ; Function checkKnifeCollision
                            646 ; ---------------------------------
   4EB1                     647 _checkKnifeCollision::
                            648 ;src/knifestruct.c:91: return *getTilePtr(mapa, cu->x + xoff, cu->y + yoff) <= 2;
   4EB1 D1            [10]  649 	pop	de
   4EB2 C1            [10]  650 	pop	bc
   4EB3 C5            [11]  651 	push	bc
   4EB4 D5            [11]  652 	push	de
   4EB5 69            [ 4]  653 	ld	l, c
   4EB6 60            [ 4]  654 	ld	h, b
   4EB7 23            [ 6]  655 	inc	hl
   4EB8 5E            [ 7]  656 	ld	e,(hl)
   4EB9 7B            [ 4]  657 	ld	a,e
   4EBA 21 05 00      [10]  658 	ld	hl,#5
   4EBD 39            [11]  659 	add	hl,sp
   4EBE 86            [ 7]  660 	add	a, (hl)
   4EBF 57            [ 4]  661 	ld	d,a
   4EC0 0A            [ 7]  662 	ld	a,(bc)
   4EC1 4F            [ 4]  663 	ld	c,a
   4EC2 21 04 00      [10]  664 	ld	hl,#4
   4EC5 39            [11]  665 	add	hl,sp
   4EC6 86            [ 7]  666 	add	a, (hl)
   4EC7 47            [ 4]  667 	ld	b,a
   4EC8 D5            [11]  668 	push	de
   4EC9 33            [ 6]  669 	inc	sp
   4ECA C5            [11]  670 	push	bc
   4ECB 33            [ 6]  671 	inc	sp
   4ECC 21 08 00      [10]  672 	ld	hl, #8
   4ECF 39            [11]  673 	add	hl, sp
   4ED0 4E            [ 7]  674 	ld	c, (hl)
   4ED1 23            [ 6]  675 	inc	hl
   4ED2 46            [ 7]  676 	ld	b, (hl)
   4ED3 C5            [11]  677 	push	bc
   4ED4 CD D3 4F      [17]  678 	call	_getTilePtr
   4ED7 F1            [10]  679 	pop	af
   4ED8 F1            [10]  680 	pop	af
   4ED9 4E            [ 7]  681 	ld	c,(hl)
   4EDA 3E 02         [ 7]  682 	ld	a,#0x02
   4EDC 91            [ 4]  683 	sub	a, c
   4EDD 3E 00         [ 7]  684 	ld	a,#0x00
   4EDF 17            [ 4]  685 	rla
   4EE0 EE 01         [ 7]  686 	xor	a, #0x01
   4EE2 6F            [ 4]  687 	ld	l, a
   4EE3 C9            [10]  688 	ret
                            689 ;src/knifestruct.c:94: void moverCuchillo(TKnife* cu, u8* mapa){
                            690 ;	---------------------------------
                            691 ; Function moverCuchillo
                            692 ; ---------------------------------
   4EE4                     693 _moverCuchillo::
   4EE4 DD E5         [15]  694 	push	ix
   4EE6 DD 21 00 00   [14]  695 	ld	ix,#0
   4EEA DD 39         [15]  696 	add	ix,sp
   4EEC F5            [11]  697 	push	af
                            698 ;src/knifestruct.c:95: if(cu->lanzado){
   4EED DD 4E 04      [19]  699 	ld	c,4 (ix)
   4EF0 DD 46 05      [19]  700 	ld	b,5 (ix)
   4EF3 C5            [11]  701 	push	bc
   4EF4 FD E1         [14]  702 	pop	iy
   4EF6 FD 7E 06      [19]  703 	ld	a,6 (iy)
   4EF9 B7            [ 4]  704 	or	a, a
   4EFA CA CE 4F      [10]  705 	jp	Z,00126$
                            706 ;src/knifestruct.c:96: cu->mover = SI;
   4EFD 21 09 00      [10]  707 	ld	hl,#0x0009
   4F00 09            [11]  708 	add	hl,bc
   4F01 EB            [ 4]  709 	ex	de,hl
   4F02 3E 01         [ 7]  710 	ld	a,#0x01
   4F04 12            [ 7]  711 	ld	(de),a
                            712 ;src/knifestruct.c:97: if(cu->direccion == M_derecha){
   4F05 C5            [11]  713 	push	bc
   4F06 FD E1         [14]  714 	pop	iy
   4F08 FD 6E 07      [19]  715 	ld	l,7 (iy)
   4F0B 7D            [ 4]  716 	ld	a,l
   4F0C B7            [ 4]  717 	or	a, a
   4F0D 20 28         [12]  718 	jr	NZ,00122$
                            719 ;src/knifestruct.c:99: if(checkKnifeCollision(cu, G_KNIFEX_0_W + 1, 0, mapa)){
   4F0F C5            [11]  720 	push	bc
   4F10 D5            [11]  721 	push	de
   4F11 DD 6E 06      [19]  722 	ld	l,6 (ix)
   4F14 DD 66 07      [19]  723 	ld	h,7 (ix)
   4F17 E5            [11]  724 	push	hl
   4F18 21 05 00      [10]  725 	ld	hl,#0x0005
   4F1B E5            [11]  726 	push	hl
   4F1C C5            [11]  727 	push	bc
   4F1D CD B1 4E      [17]  728 	call	_checkKnifeCollision
   4F20 F1            [10]  729 	pop	af
   4F21 F1            [10]  730 	pop	af
   4F22 F1            [10]  731 	pop	af
   4F23 D1            [10]  732 	pop	de
   4F24 C1            [10]  733 	pop	bc
   4F25 7D            [ 4]  734 	ld	a,l
   4F26 B7            [ 4]  735 	or	a, a
   4F27 28 09         [12]  736 	jr	Z,00102$
                            737 ;src/knifestruct.c:100: cu->mover = SI;
   4F29 3E 01         [ 7]  738 	ld	a,#0x01
   4F2B 12            [ 7]  739 	ld	(de),a
                            740 ;src/knifestruct.c:101: cu->x++;
   4F2C 0A            [ 7]  741 	ld	a,(bc)
   4F2D 3C            [ 4]  742 	inc	a
   4F2E 02            [ 7]  743 	ld	(bc),a
   4F2F C3 CE 4F      [10]  744 	jp	00126$
   4F32                     745 00102$:
                            746 ;src/knifestruct.c:104: cu->mover=NO;
   4F32 AF            [ 4]  747 	xor	a, a
   4F33 12            [ 7]  748 	ld	(de),a
   4F34 C3 CE 4F      [10]  749 	jp	00126$
   4F37                     750 00122$:
                            751 ;src/knifestruct.c:107: else if(cu->direccion == M_izquierda){
   4F37 7D            [ 4]  752 	ld	a,l
   4F38 3D            [ 4]  753 	dec	a
   4F39 20 27         [12]  754 	jr	NZ,00119$
                            755 ;src/knifestruct.c:108: if(checkKnifeCollision(cu, -1, 0, mapa)){
   4F3B C5            [11]  756 	push	bc
   4F3C D5            [11]  757 	push	de
   4F3D DD 6E 06      [19]  758 	ld	l,6 (ix)
   4F40 DD 66 07      [19]  759 	ld	h,7 (ix)
   4F43 E5            [11]  760 	push	hl
   4F44 21 FF 00      [10]  761 	ld	hl,#0x00FF
   4F47 E5            [11]  762 	push	hl
   4F48 C5            [11]  763 	push	bc
   4F49 CD B1 4E      [17]  764 	call	_checkKnifeCollision
   4F4C F1            [10]  765 	pop	af
   4F4D F1            [10]  766 	pop	af
   4F4E F1            [10]  767 	pop	af
   4F4F D1            [10]  768 	pop	de
   4F50 C1            [10]  769 	pop	bc
   4F51 7D            [ 4]  770 	ld	a,l
   4F52 B7            [ 4]  771 	or	a, a
   4F53 28 09         [12]  772 	jr	Z,00105$
                            773 ;src/knifestruct.c:109: cu->mover = SI;
   4F55 3E 01         [ 7]  774 	ld	a,#0x01
   4F57 12            [ 7]  775 	ld	(de),a
                            776 ;src/knifestruct.c:110: cu->x--;
   4F58 0A            [ 7]  777 	ld	a,(bc)
   4F59 C6 FF         [ 7]  778 	add	a,#0xFF
   4F5B 02            [ 7]  779 	ld	(bc),a
   4F5C 18 70         [12]  780 	jr	00126$
   4F5E                     781 00105$:
                            782 ;src/knifestruct.c:112: cu->mover=NO;
   4F5E AF            [ 4]  783 	xor	a, a
   4F5F 12            [ 7]  784 	ld	(de),a
   4F60 18 6C         [12]  785 	jr	00126$
   4F62                     786 00119$:
                            787 ;src/knifestruct.c:118: cu->y--;
   4F62 79            [ 4]  788 	ld	a,c
   4F63 C6 01         [ 7]  789 	add	a, #0x01
   4F65 DD 77 FE      [19]  790 	ld	-2 (ix),a
   4F68 78            [ 4]  791 	ld	a,b
   4F69 CE 00         [ 7]  792 	adc	a, #0x00
   4F6B DD 77 FF      [19]  793 	ld	-1 (ix),a
                            794 ;src/knifestruct.c:115: else if(cu->direccion == M_arriba){
   4F6E 7D            [ 4]  795 	ld	a,l
   4F6F D6 02         [ 7]  796 	sub	a, #0x02
   4F71 20 2C         [12]  797 	jr	NZ,00116$
                            798 ;src/knifestruct.c:116: if(checkKnifeCollision(cu, 0, -2, mapa)){
   4F73 D5            [11]  799 	push	de
   4F74 DD 6E 06      [19]  800 	ld	l,6 (ix)
   4F77 DD 66 07      [19]  801 	ld	h,7 (ix)
   4F7A E5            [11]  802 	push	hl
   4F7B 21 00 FE      [10]  803 	ld	hl,#0xFE00
   4F7E E5            [11]  804 	push	hl
   4F7F C5            [11]  805 	push	bc
   4F80 CD B1 4E      [17]  806 	call	_checkKnifeCollision
   4F83 F1            [10]  807 	pop	af
   4F84 F1            [10]  808 	pop	af
   4F85 F1            [10]  809 	pop	af
   4F86 D1            [10]  810 	pop	de
   4F87 7D            [ 4]  811 	ld	a,l
   4F88 B7            [ 4]  812 	or	a, a
   4F89 28 10         [12]  813 	jr	Z,00108$
                            814 ;src/knifestruct.c:117: cu->mover = SI;
   4F8B 3E 01         [ 7]  815 	ld	a,#0x01
   4F8D 12            [ 7]  816 	ld	(de),a
                            817 ;src/knifestruct.c:118: cu->y--;
   4F8E E1            [10]  818 	pop	hl
   4F8F E5            [11]  819 	push	hl
   4F90 4E            [ 7]  820 	ld	c,(hl)
   4F91 0D            [ 4]  821 	dec	c
   4F92 E1            [10]  822 	pop	hl
   4F93 E5            [11]  823 	push	hl
   4F94 71            [ 7]  824 	ld	(hl),c
                            825 ;src/knifestruct.c:119: cu->y--;
   4F95 0D            [ 4]  826 	dec	c
   4F96 E1            [10]  827 	pop	hl
   4F97 E5            [11]  828 	push	hl
   4F98 71            [ 7]  829 	ld	(hl),c
   4F99 18 33         [12]  830 	jr	00126$
   4F9B                     831 00108$:
                            832 ;src/knifestruct.c:122: cu->mover=NO;
   4F9B AF            [ 4]  833 	xor	a, a
   4F9C 12            [ 7]  834 	ld	(de),a
   4F9D 18 2F         [12]  835 	jr	00126$
   4F9F                     836 00116$:
                            837 ;src/knifestruct.c:125: else if(cu->direccion == M_abajo){
   4F9F 7D            [ 4]  838 	ld	a,l
   4FA0 D6 03         [ 7]  839 	sub	a, #0x03
   4FA2 20 2A         [12]  840 	jr	NZ,00126$
                            841 ;src/knifestruct.c:126: if(checkKnifeCollision(cu, 0, G_KNIFEY_0_H + 2, mapa)){
   4FA4 D5            [11]  842 	push	de
   4FA5 DD 6E 06      [19]  843 	ld	l,6 (ix)
   4FA8 DD 66 07      [19]  844 	ld	h,7 (ix)
   4FAB E5            [11]  845 	push	hl
   4FAC 21 00 0A      [10]  846 	ld	hl,#0x0A00
   4FAF E5            [11]  847 	push	hl
   4FB0 C5            [11]  848 	push	bc
   4FB1 CD B1 4E      [17]  849 	call	_checkKnifeCollision
   4FB4 F1            [10]  850 	pop	af
   4FB5 F1            [10]  851 	pop	af
   4FB6 F1            [10]  852 	pop	af
   4FB7 D1            [10]  853 	pop	de
   4FB8 7D            [ 4]  854 	ld	a,l
   4FB9 B7            [ 4]  855 	or	a, a
   4FBA 28 10         [12]  856 	jr	Z,00111$
                            857 ;src/knifestruct.c:127: cu->mover = SI;
   4FBC 3E 01         [ 7]  858 	ld	a,#0x01
   4FBE 12            [ 7]  859 	ld	(de),a
                            860 ;src/knifestruct.c:128: cu->y++;
   4FBF E1            [10]  861 	pop	hl
   4FC0 E5            [11]  862 	push	hl
   4FC1 4E            [ 7]  863 	ld	c,(hl)
   4FC2 0C            [ 4]  864 	inc	c
   4FC3 E1            [10]  865 	pop	hl
   4FC4 E5            [11]  866 	push	hl
   4FC5 71            [ 7]  867 	ld	(hl),c
                            868 ;src/knifestruct.c:129: cu->y++;
   4FC6 0C            [ 4]  869 	inc	c
   4FC7 E1            [10]  870 	pop	hl
   4FC8 E5            [11]  871 	push	hl
   4FC9 71            [ 7]  872 	ld	(hl),c
   4FCA 18 02         [12]  873 	jr	00126$
   4FCC                     874 00111$:
                            875 ;src/knifestruct.c:132: cu->mover=NO;
   4FCC AF            [ 4]  876 	xor	a, a
   4FCD 12            [ 7]  877 	ld	(de),a
   4FCE                     878 00126$:
   4FCE DD F9         [10]  879 	ld	sp, ix
   4FD0 DD E1         [14]  880 	pop	ix
   4FD2 C9            [10]  881 	ret
                            882 	.area _CODE
                            883 	.area _INITIALIZER
                            884 	.area _CABS (ABS)
