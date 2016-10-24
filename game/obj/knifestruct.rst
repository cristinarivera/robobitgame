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
   4B06 CD 93 64      [17]   78 	call	_cpct_getScreenPtr
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
   4B48 CD B3 64      [17]  120 	call	_cpct_drawSpriteMaskedAlignedTable
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
   4B65 CD B3 64      [17]  142 	call	_cpct_drawSpriteMaskedAlignedTable
   4B68                     143 00106$:
   4B68 DD F9         [10]  144 	ld	sp, ix
   4B6A DD E1         [14]  145 	pop	ix
   4B6C C9            [10]  146 	ret
                            147 ;src/knifestruct.c:14: void borrarCuchillo(u8 eje, u8 x, u8 y, u8* mapa) {
                            148 ;	---------------------------------
                            149 ; Function borrarCuchillo
                            150 ; ---------------------------------
   4B6D                     151 _borrarCuchillo::
   4B6D DD E5         [15]  152 	push	ix
   4B6F DD 21 00 00   [14]  153 	ld	ix,#0
   4B73 DD 39         [15]  154 	add	ix,sp
   4B75 F5            [11]  155 	push	af
   4B76 F5            [11]  156 	push	af
                            157 ;src/knifestruct.c:20: w = 4 + (x & 1);
   4B77 DD 7E 05      [19]  158 	ld	a,5 (ix)
   4B7A E6 01         [ 7]  159 	and	a, #0x01
   4B7C 47            [ 4]  160 	ld	b,a
                            161 ;src/knifestruct.c:21: h = 1 + (y & 3 ? 1 : 0);
   4B7D DD 7E 06      [19]  162 	ld	a,6 (ix)
   4B80 E6 03         [ 7]  163 	and	a, #0x03
   4B82 4F            [ 4]  164 	ld	c,a
                            165 ;src/knifestruct.c:19: if(eje == E_X){
   4B83 DD 7E 04      [19]  166 	ld	a,4 (ix)
   4B86 B7            [ 4]  167 	or	a, a
   4B87 20 11         [12]  168 	jr	NZ,00102$
                            169 ;src/knifestruct.c:20: w = 4 + (x & 1);
   4B89 04            [ 4]  170 	inc	b
   4B8A 04            [ 4]  171 	inc	b
   4B8B 04            [ 4]  172 	inc	b
   4B8C 04            [ 4]  173 	inc	b
                            174 ;src/knifestruct.c:21: h = 1 + (y & 3 ? 1 : 0);
   4B8D 79            [ 4]  175 	ld	a,c
   4B8E B7            [ 4]  176 	or	a, a
   4B8F 28 04         [12]  177 	jr	Z,00106$
   4B91 0E 01         [ 7]  178 	ld	c,#0x01
   4B93 18 02         [12]  179 	jr	00107$
   4B95                     180 00106$:
   4B95 0E 00         [ 7]  181 	ld	c,#0x00
   4B97                     182 00107$:
   4B97 0C            [ 4]  183 	inc	c
   4B98 18 0E         [12]  184 	jr	00103$
   4B9A                     185 00102$:
                            186 ;src/knifestruct.c:23: w = 2 + (x & 1);
   4B9A 04            [ 4]  187 	inc	b
   4B9B 04            [ 4]  188 	inc	b
                            189 ;src/knifestruct.c:24: h = 2 + (y & 3 ? 1 : 0);
   4B9C 79            [ 4]  190 	ld	a,c
   4B9D B7            [ 4]  191 	or	a, a
   4B9E 28 04         [12]  192 	jr	Z,00108$
   4BA0 0E 01         [ 7]  193 	ld	c,#0x01
   4BA2 18 02         [12]  194 	jr	00109$
   4BA4                     195 00108$:
   4BA4 0E 00         [ 7]  196 	ld	c,#0x00
   4BA6                     197 00109$:
   4BA6 0C            [ 4]  198 	inc	c
   4BA7 0C            [ 4]  199 	inc	c
   4BA8                     200 00103$:
                            201 ;src/knifestruct.c:28: cpct_etm_drawTileBox2x4 (x / 2, (y - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   4BA8 DD 7E 07      [19]  202 	ld	a,7 (ix)
   4BAB DD 77 FE      [19]  203 	ld	-2 (ix),a
   4BAE DD 7E 08      [19]  204 	ld	a,8 (ix)
   4BB1 DD 77 FF      [19]  205 	ld	-1 (ix),a
   4BB4 DD 5E 06      [19]  206 	ld	e,6 (ix)
   4BB7 16 00         [ 7]  207 	ld	d,#0x00
   4BB9 7B            [ 4]  208 	ld	a,e
   4BBA C6 E8         [ 7]  209 	add	a,#0xE8
   4BBC DD 77 FC      [19]  210 	ld	-4 (ix),a
   4BBF 7A            [ 4]  211 	ld	a,d
   4BC0 CE FF         [ 7]  212 	adc	a,#0xFF
   4BC2 DD 77 FD      [19]  213 	ld	-3 (ix),a
   4BC5 E1            [10]  214 	pop	hl
   4BC6 E5            [11]  215 	push	hl
   4BC7 DD CB FD 7E   [20]  216 	bit	7, -3 (ix)
   4BCB 28 04         [12]  217 	jr	Z,00110$
   4BCD 21 EB FF      [10]  218 	ld	hl,#0xFFEB
   4BD0 19            [11]  219 	add	hl,de
   4BD1                     220 00110$:
   4BD1 5D            [ 4]  221 	ld	e,l
   4BD2 CB 2C         [ 8]  222 	sra	h
   4BD4 CB 1B         [ 8]  223 	rr	e
   4BD6 CB 2C         [ 8]  224 	sra	h
   4BD8 CB 1B         [ 8]  225 	rr	e
   4BDA DD 56 05      [19]  226 	ld	d,5 (ix)
   4BDD CB 3A         [ 8]  227 	srl	d
   4BDF DD 6E FE      [19]  228 	ld	l,-2 (ix)
   4BE2 DD 66 FF      [19]  229 	ld	h,-1 (ix)
   4BE5 E5            [11]  230 	push	hl
   4BE6 21 F0 C0      [10]  231 	ld	hl,#0xC0F0
   4BE9 E5            [11]  232 	push	hl
   4BEA 3E 28         [ 7]  233 	ld	a,#0x28
   4BEC F5            [11]  234 	push	af
   4BED 33            [ 6]  235 	inc	sp
   4BEE 79            [ 4]  236 	ld	a,c
   4BEF F5            [11]  237 	push	af
   4BF0 33            [ 6]  238 	inc	sp
   4BF1 C5            [11]  239 	push	bc
   4BF2 33            [ 6]  240 	inc	sp
   4BF3 7B            [ 4]  241 	ld	a,e
   4BF4 F5            [11]  242 	push	af
   4BF5 33            [ 6]  243 	inc	sp
   4BF6 D5            [11]  244 	push	de
   4BF7 33            [ 6]  245 	inc	sp
   4BF8 CD 75 59      [17]  246 	call	_cpct_etm_drawTileBox2x4
   4BFB DD F9         [10]  247 	ld	sp, ix
   4BFD DD E1         [14]  248 	pop	ix
   4BFF C9            [10]  249 	ret
                            250 ;src/knifestruct.c:31: void redibujarCuchillo(u8 eje, u8 x, u8 y, TKnife* cu, u8* g_tablatrans, u8* mapa) {
                            251 ;	---------------------------------
                            252 ; Function redibujarCuchillo
                            253 ; ---------------------------------
   4C00                     254 _redibujarCuchillo::
   4C00 DD E5         [15]  255 	push	ix
   4C02 DD 21 00 00   [14]  256 	ld	ix,#0
   4C06 DD 39         [15]  257 	add	ix,sp
                            258 ;src/knifestruct.c:32: borrarCuchillo(eje, x, y, mapa);
   4C08 DD 6E 0B      [19]  259 	ld	l,11 (ix)
   4C0B DD 66 0C      [19]  260 	ld	h,12 (ix)
   4C0E E5            [11]  261 	push	hl
   4C0F DD 66 06      [19]  262 	ld	h,6 (ix)
   4C12 DD 6E 05      [19]  263 	ld	l,5 (ix)
   4C15 E5            [11]  264 	push	hl
   4C16 DD 7E 04      [19]  265 	ld	a,4 (ix)
   4C19 F5            [11]  266 	push	af
   4C1A 33            [ 6]  267 	inc	sp
   4C1B CD 6D 4B      [17]  268 	call	_borrarCuchillo
   4C1E F1            [10]  269 	pop	af
   4C1F F1            [10]  270 	pop	af
   4C20 33            [ 6]  271 	inc	sp
                            272 ;src/knifestruct.c:33: cu->px = cu->x;
   4C21 DD 4E 07      [19]  273 	ld	c,7 (ix)
   4C24 DD 46 08      [19]  274 	ld	b,8 (ix)
   4C27 59            [ 4]  275 	ld	e, c
   4C28 50            [ 4]  276 	ld	d, b
   4C29 13            [ 6]  277 	inc	de
   4C2A 13            [ 6]  278 	inc	de
   4C2B 0A            [ 7]  279 	ld	a,(bc)
   4C2C 12            [ 7]  280 	ld	(de),a
                            281 ;src/knifestruct.c:34: cu->py = cu->y;
   4C2D 59            [ 4]  282 	ld	e, c
   4C2E 50            [ 4]  283 	ld	d, b
   4C2F 13            [ 6]  284 	inc	de
   4C30 13            [ 6]  285 	inc	de
   4C31 13            [ 6]  286 	inc	de
   4C32 69            [ 4]  287 	ld	l, c
   4C33 60            [ 4]  288 	ld	h, b
   4C34 23            [ 6]  289 	inc	hl
   4C35 7E            [ 7]  290 	ld	a,(hl)
   4C36 12            [ 7]  291 	ld	(de),a
                            292 ;src/knifestruct.c:35: dibujarCuchillo(cu, g_tablatrans);
   4C37 DD 6E 09      [19]  293 	ld	l,9 (ix)
   4C3A DD 66 0A      [19]  294 	ld	h,10 (ix)
   4C3D E5            [11]  295 	push	hl
   4C3E C5            [11]  296 	push	bc
   4C3F CD E5 4A      [17]  297 	call	_dibujarCuchillo
   4C42 F1            [10]  298 	pop	af
   4C43 F1            [10]  299 	pop	af
   4C44 DD E1         [14]  300 	pop	ix
   4C46 C9            [10]  301 	ret
                            302 ;src/knifestruct.c:38: void lanzarCuchillo(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans){
                            303 ;	---------------------------------
                            304 ; Function lanzarCuchillo
                            305 ; ---------------------------------
   4C47                     306 _lanzarCuchillo::
   4C47 DD E5         [15]  307 	push	ix
   4C49 DD 21 00 00   [14]  308 	ld	ix,#0
   4C4D DD 39         [15]  309 	add	ix,sp
   4C4F 21 F2 FF      [10]  310 	ld	hl,#-14
   4C52 39            [11]  311 	add	hl,sp
   4C53 F9            [ 6]  312 	ld	sp,hl
                            313 ;src/knifestruct.c:40: if(!cu->lanzado){
   4C54 DD 4E 04      [19]  314 	ld	c,4 (ix)
   4C57 DD 46 05      [19]  315 	ld	b,5 (ix)
   4C5A 21 06 00      [10]  316 	ld	hl,#0x0006
   4C5D 09            [11]  317 	add	hl,bc
   4C5E DD 75 FE      [19]  318 	ld	-2 (ix),l
   4C61 DD 74 FF      [19]  319 	ld	-1 (ix),h
   4C64 DD 6E FE      [19]  320 	ld	l,-2 (ix)
   4C67 DD 66 FF      [19]  321 	ld	h,-1 (ix)
   4C6A 7E            [ 7]  322 	ld	a,(hl)
   4C6B B7            [ 4]  323 	or	a, a
   4C6C C2 83 4E      [10]  324 	jp	NZ,00122$
                            325 ;src/knifestruct.c:42: if(prota->mira == M_derecha){
   4C6F DD 5E 06      [19]  326 	ld	e,6 (ix)
   4C72 DD 56 07      [19]  327 	ld	d,7 (ix)
   4C75 6B            [ 4]  328 	ld	l, e
   4C76 62            [ 4]  329 	ld	h, d
   4C77 C5            [11]  330 	push	bc
   4C78 01 07 00      [10]  331 	ld	bc, #0x0007
   4C7B 09            [11]  332 	add	hl, bc
   4C7C C1            [10]  333 	pop	bc
   4C7D 6E            [ 7]  334 	ld	l,(hl)
                            335 ;src/knifestruct.c:43: if( *getTilePtr(mapa, prota->x + G_HERO_W + G_KNIFEX_0_W + 1, prota->y + G_HERO_H /2) <= 2){
   4C7E 7B            [ 4]  336 	ld	a,e
   4C7F C6 01         [ 7]  337 	add	a, #0x01
   4C81 DD 77 F2      [19]  338 	ld	-14 (ix),a
   4C84 7A            [ 4]  339 	ld	a,d
   4C85 CE 00         [ 7]  340 	adc	a, #0x00
   4C87 DD 77 F3      [19]  341 	ld	-13 (ix),a
                            342 ;src/knifestruct.c:45: cu->direccion = M_derecha;
   4C8A 79            [ 4]  343 	ld	a,c
   4C8B C6 07         [ 7]  344 	add	a, #0x07
   4C8D DD 77 F7      [19]  345 	ld	-9 (ix),a
   4C90 78            [ 4]  346 	ld	a,b
   4C91 CE 00         [ 7]  347 	adc	a, #0x00
   4C93 DD 77 F8      [19]  348 	ld	-8 (ix),a
                            349 ;src/knifestruct.c:47: cu->y=prota->y + G_HERO_H /2;
   4C96 79            [ 4]  350 	ld	a,c
   4C97 C6 01         [ 7]  351 	add	a, #0x01
   4C99 DD 77 F4      [19]  352 	ld	-12 (ix),a
   4C9C 78            [ 4]  353 	ld	a,b
   4C9D CE 00         [ 7]  354 	adc	a, #0x00
   4C9F DD 77 F5      [19]  355 	ld	-11 (ix),a
                            356 ;src/knifestruct.c:48: cu->sprite=g_knifeX_0;
   4CA2 79            [ 4]  357 	ld	a,c
   4CA3 C6 04         [ 7]  358 	add	a, #0x04
   4CA5 DD 77 FC      [19]  359 	ld	-4 (ix),a
   4CA8 78            [ 4]  360 	ld	a,b
   4CA9 CE 00         [ 7]  361 	adc	a, #0x00
   4CAB DD 77 FD      [19]  362 	ld	-3 (ix),a
                            363 ;src/knifestruct.c:49: cu->eje = E_X;
   4CAE 79            [ 4]  364 	ld	a,c
   4CAF C6 08         [ 7]  365 	add	a, #0x08
   4CB1 DD 77 FA      [19]  366 	ld	-6 (ix),a
   4CB4 78            [ 4]  367 	ld	a,b
   4CB5 CE 00         [ 7]  368 	adc	a, #0x00
   4CB7 DD 77 FB      [19]  369 	ld	-5 (ix),a
                            370 ;src/knifestruct.c:42: if(prota->mira == M_derecha){
   4CBA 7D            [ 4]  371 	ld	a,l
   4CBB B7            [ 4]  372 	or	a, a
   4CBC 20 6F         [12]  373 	jr	NZ,00118$
                            374 ;src/knifestruct.c:43: if( *getTilePtr(mapa, prota->x + G_HERO_W + G_KNIFEX_0_W + 1, prota->y + G_HERO_H /2) <= 2){
   4CBE E1            [10]  375 	pop	hl
   4CBF E5            [11]  376 	push	hl
   4CC0 7E            [ 7]  377 	ld	a,(hl)
   4CC1 C6 0B         [ 7]  378 	add	a, #0x0B
   4CC3 DD 77 F9      [19]  379 	ld	-7 (ix),a
   4CC6 1A            [ 7]  380 	ld	a,(de)
   4CC7 C6 0C         [ 7]  381 	add	a, #0x0C
   4CC9 DD 77 F6      [19]  382 	ld	-10 (ix),a
   4CCC C5            [11]  383 	push	bc
   4CCD D5            [11]  384 	push	de
   4CCE DD 66 F9      [19]  385 	ld	h,-7 (ix)
   4CD1 DD 6E F6      [19]  386 	ld	l,-10 (ix)
   4CD4 E5            [11]  387 	push	hl
   4CD5 DD 6E 08      [19]  388 	ld	l,8 (ix)
   4CD8 DD 66 09      [19]  389 	ld	h,9 (ix)
   4CDB E5            [11]  390 	push	hl
   4CDC CD AA 4F      [17]  391 	call	_getTilePtr
   4CDF F1            [10]  392 	pop	af
   4CE0 F1            [10]  393 	pop	af
   4CE1 D1            [10]  394 	pop	de
   4CE2 C1            [10]  395 	pop	bc
   4CE3 6E            [ 7]  396 	ld	l,(hl)
   4CE4 3E 02         [ 7]  397 	ld	a,#0x02
   4CE6 95            [ 4]  398 	sub	a, l
   4CE7 DA 83 4E      [10]  399 	jp	C,00122$
                            400 ;src/knifestruct.c:44: cu->lanzado = SI;
   4CEA DD 6E FE      [19]  401 	ld	l,-2 (ix)
   4CED DD 66 FF      [19]  402 	ld	h,-1 (ix)
   4CF0 36 01         [10]  403 	ld	(hl),#0x01
                            404 ;src/knifestruct.c:45: cu->direccion = M_derecha;
   4CF2 DD 6E F7      [19]  405 	ld	l,-9 (ix)
   4CF5 DD 66 F8      [19]  406 	ld	h,-8 (ix)
   4CF8 36 00         [10]  407 	ld	(hl),#0x00
                            408 ;src/knifestruct.c:46: cu->x=prota->x + G_HERO_W;
   4CFA 1A            [ 7]  409 	ld	a,(de)
   4CFB C6 07         [ 7]  410 	add	a, #0x07
   4CFD 02            [ 7]  411 	ld	(bc),a
                            412 ;src/knifestruct.c:47: cu->y=prota->y + G_HERO_H /2;
   4CFE E1            [10]  413 	pop	hl
   4CFF E5            [11]  414 	push	hl
   4D00 7E            [ 7]  415 	ld	a,(hl)
   4D01 C6 0B         [ 7]  416 	add	a, #0x0B
   4D03 DD 6E F4      [19]  417 	ld	l,-12 (ix)
   4D06 DD 66 F5      [19]  418 	ld	h,-11 (ix)
   4D09 77            [ 7]  419 	ld	(hl),a
                            420 ;src/knifestruct.c:48: cu->sprite=g_knifeX_0;
   4D0A DD 6E FC      [19]  421 	ld	l,-4 (ix)
   4D0D DD 66 FD      [19]  422 	ld	h,-3 (ix)
   4D10 36 C0         [10]  423 	ld	(hl),#<(_g_knifeX_0)
   4D12 23            [ 6]  424 	inc	hl
   4D13 36 17         [10]  425 	ld	(hl),#>(_g_knifeX_0)
                            426 ;src/knifestruct.c:49: cu->eje = E_X;
   4D15 DD 6E FA      [19]  427 	ld	l,-6 (ix)
   4D18 DD 66 FB      [19]  428 	ld	h,-5 (ix)
   4D1B 36 00         [10]  429 	ld	(hl),#0x00
                            430 ;src/knifestruct.c:50: dibujarCuchillo(cu, g_tablatrans);
   4D1D DD 6E 0A      [19]  431 	ld	l,10 (ix)
   4D20 DD 66 0B      [19]  432 	ld	h,11 (ix)
   4D23 E5            [11]  433 	push	hl
   4D24 C5            [11]  434 	push	bc
   4D25 CD E5 4A      [17]  435 	call	_dibujarCuchillo
   4D28 F1            [10]  436 	pop	af
   4D29 F1            [10]  437 	pop	af
   4D2A C3 83 4E      [10]  438 	jp	00122$
   4D2D                     439 00118$:
                            440 ;src/knifestruct.c:53: else if(prota->mira == M_izquierda){
   4D2D 7D            [ 4]  441 	ld	a,l
   4D2E 3D            [ 4]  442 	dec	a
   4D2F 20 6F         [12]  443 	jr	NZ,00115$
                            444 ;src/knifestruct.c:54: if( *getTilePtr(mapa, prota->x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota->y + G_HERO_H /2) <= 2){
   4D31 E1            [10]  445 	pop	hl
   4D32 E5            [11]  446 	push	hl
   4D33 7E            [ 7]  447 	ld	a,(hl)
   4D34 C6 0B         [ 7]  448 	add	a, #0x0B
   4D36 DD 77 F6      [19]  449 	ld	-10 (ix),a
   4D39 1A            [ 7]  450 	ld	a,(de)
   4D3A C6 F6         [ 7]  451 	add	a,#0xF6
   4D3C DD 77 F9      [19]  452 	ld	-7 (ix),a
   4D3F C5            [11]  453 	push	bc
   4D40 D5            [11]  454 	push	de
   4D41 DD 66 F6      [19]  455 	ld	h,-10 (ix)
   4D44 DD 6E F9      [19]  456 	ld	l,-7 (ix)
   4D47 E5            [11]  457 	push	hl
   4D48 DD 6E 08      [19]  458 	ld	l,8 (ix)
   4D4B DD 66 09      [19]  459 	ld	h,9 (ix)
   4D4E E5            [11]  460 	push	hl
   4D4F CD AA 4F      [17]  461 	call	_getTilePtr
   4D52 F1            [10]  462 	pop	af
   4D53 F1            [10]  463 	pop	af
   4D54 D1            [10]  464 	pop	de
   4D55 C1            [10]  465 	pop	bc
   4D56 6E            [ 7]  466 	ld	l,(hl)
   4D57 3E 02         [ 7]  467 	ld	a,#0x02
   4D59 95            [ 4]  468 	sub	a, l
   4D5A DA 83 4E      [10]  469 	jp	C,00122$
                            470 ;src/knifestruct.c:55: cu->lanzado = SI;
   4D5D DD 6E FE      [19]  471 	ld	l,-2 (ix)
   4D60 DD 66 FF      [19]  472 	ld	h,-1 (ix)
   4D63 36 01         [10]  473 	ld	(hl),#0x01
                            474 ;src/knifestruct.c:56: cu->direccion = M_izquierda;
   4D65 DD 6E F7      [19]  475 	ld	l,-9 (ix)
   4D68 DD 66 F8      [19]  476 	ld	h,-8 (ix)
   4D6B 36 01         [10]  477 	ld	(hl),#0x01
                            478 ;src/knifestruct.c:57: cu->x = prota->x - G_KNIFEX_0_W;
   4D6D 1A            [ 7]  479 	ld	a,(de)
   4D6E C6 FC         [ 7]  480 	add	a,#0xFC
   4D70 02            [ 7]  481 	ld	(bc),a
                            482 ;src/knifestruct.c:58: cu->y = prota->y + G_HERO_H /2;
   4D71 E1            [10]  483 	pop	hl
   4D72 E5            [11]  484 	push	hl
   4D73 7E            [ 7]  485 	ld	a,(hl)
   4D74 C6 0B         [ 7]  486 	add	a, #0x0B
   4D76 DD 6E F4      [19]  487 	ld	l,-12 (ix)
   4D79 DD 66 F5      [19]  488 	ld	h,-11 (ix)
   4D7C 77            [ 7]  489 	ld	(hl),a
                            490 ;src/knifestruct.c:59: cu->sprite = g_knifeX_1;
   4D7D DD 6E FC      [19]  491 	ld	l,-4 (ix)
   4D80 DD 66 FD      [19]  492 	ld	h,-3 (ix)
   4D83 36 D0         [10]  493 	ld	(hl),#<(_g_knifeX_1)
   4D85 23            [ 6]  494 	inc	hl
   4D86 36 17         [10]  495 	ld	(hl),#>(_g_knifeX_1)
                            496 ;src/knifestruct.c:60: cu->eje = E_X;
   4D88 DD 6E FA      [19]  497 	ld	l,-6 (ix)
   4D8B DD 66 FB      [19]  498 	ld	h,-5 (ix)
   4D8E 36 00         [10]  499 	ld	(hl),#0x00
                            500 ;src/knifestruct.c:61: dibujarCuchillo(cu, g_tablatrans);
   4D90 DD 6E 0A      [19]  501 	ld	l,10 (ix)
   4D93 DD 66 0B      [19]  502 	ld	h,11 (ix)
   4D96 E5            [11]  503 	push	hl
   4D97 C5            [11]  504 	push	bc
   4D98 CD E5 4A      [17]  505 	call	_dibujarCuchillo
   4D9B F1            [10]  506 	pop	af
   4D9C F1            [10]  507 	pop	af
   4D9D C3 83 4E      [10]  508 	jp	00122$
   4DA0                     509 00115$:
                            510 ;src/knifestruct.c:64: else if(prota->mira == M_abajo){
   4DA0 7D            [ 4]  511 	ld	a,l
   4DA1 D6 03         [ 7]  512 	sub	a, #0x03
   4DA3 20 6E         [12]  513 	jr	NZ,00112$
                            514 ;src/knifestruct.c:66: if( *getTilePtr(mapa, prota->x + G_HERO_W / 2, prota->y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   4DA5 E1            [10]  515 	pop	hl
   4DA6 E5            [11]  516 	push	hl
   4DA7 7E            [ 7]  517 	ld	a,(hl)
   4DA8 C6 1F         [ 7]  518 	add	a, #0x1F
   4DAA DD 77 F6      [19]  519 	ld	-10 (ix),a
   4DAD 1A            [ 7]  520 	ld	a,(de)
   4DAE C6 03         [ 7]  521 	add	a, #0x03
   4DB0 DD 77 F9      [19]  522 	ld	-7 (ix),a
   4DB3 C5            [11]  523 	push	bc
   4DB4 D5            [11]  524 	push	de
   4DB5 DD 66 F6      [19]  525 	ld	h,-10 (ix)
   4DB8 DD 6E F9      [19]  526 	ld	l,-7 (ix)
   4DBB E5            [11]  527 	push	hl
   4DBC DD 6E 08      [19]  528 	ld	l,8 (ix)
   4DBF DD 66 09      [19]  529 	ld	h,9 (ix)
   4DC2 E5            [11]  530 	push	hl
   4DC3 CD AA 4F      [17]  531 	call	_getTilePtr
   4DC6 F1            [10]  532 	pop	af
   4DC7 F1            [10]  533 	pop	af
   4DC8 D1            [10]  534 	pop	de
   4DC9 C1            [10]  535 	pop	bc
   4DCA 6E            [ 7]  536 	ld	l,(hl)
   4DCB 3E 02         [ 7]  537 	ld	a,#0x02
   4DCD 95            [ 4]  538 	sub	a, l
   4DCE DA 83 4E      [10]  539 	jp	C,00122$
                            540 ;src/knifestruct.c:67: cu->lanzado = SI;
   4DD1 DD 6E FE      [19]  541 	ld	l,-2 (ix)
   4DD4 DD 66 FF      [19]  542 	ld	h,-1 (ix)
   4DD7 36 01         [10]  543 	ld	(hl),#0x01
                            544 ;src/knifestruct.c:68: cu->direccion = M_abajo;
   4DD9 DD 6E F7      [19]  545 	ld	l,-9 (ix)
   4DDC DD 66 F8      [19]  546 	ld	h,-8 (ix)
   4DDF 36 03         [10]  547 	ld	(hl),#0x03
                            548 ;src/knifestruct.c:69: cu->x = prota->x + G_HERO_W / 2;
   4DE1 1A            [ 7]  549 	ld	a,(de)
   4DE2 C6 03         [ 7]  550 	add	a, #0x03
   4DE4 02            [ 7]  551 	ld	(bc),a
                            552 ;src/knifestruct.c:70: cu->y = prota->y + G_HERO_H;
   4DE5 E1            [10]  553 	pop	hl
   4DE6 E5            [11]  554 	push	hl
   4DE7 7E            [ 7]  555 	ld	a,(hl)
   4DE8 C6 16         [ 7]  556 	add	a, #0x16
   4DEA DD 6E F4      [19]  557 	ld	l,-12 (ix)
   4DED DD 66 F5      [19]  558 	ld	h,-11 (ix)
   4DF0 77            [ 7]  559 	ld	(hl),a
                            560 ;src/knifestruct.c:71: cu->sprite = g_knifeY_0;
   4DF1 DD 6E FC      [19]  561 	ld	l,-4 (ix)
   4DF4 DD 66 FD      [19]  562 	ld	h,-3 (ix)
   4DF7 36 A0         [10]  563 	ld	(hl),#<(_g_knifeY_0)
   4DF9 23            [ 6]  564 	inc	hl
   4DFA 36 17         [10]  565 	ld	(hl),#>(_g_knifeY_0)
                            566 ;src/knifestruct.c:72: cu->eje = E_Y;
   4DFC DD 6E FA      [19]  567 	ld	l,-6 (ix)
   4DFF DD 66 FB      [19]  568 	ld	h,-5 (ix)
   4E02 36 01         [10]  569 	ld	(hl),#0x01
                            570 ;src/knifestruct.c:73: dibujarCuchillo(cu, g_tablatrans);
   4E04 DD 6E 0A      [19]  571 	ld	l,10 (ix)
   4E07 DD 66 0B      [19]  572 	ld	h,11 (ix)
   4E0A E5            [11]  573 	push	hl
   4E0B C5            [11]  574 	push	bc
   4E0C CD E5 4A      [17]  575 	call	_dibujarCuchillo
   4E0F F1            [10]  576 	pop	af
   4E10 F1            [10]  577 	pop	af
   4E11 18 70         [12]  578 	jr	00122$
   4E13                     579 00112$:
                            580 ;src/knifestruct.c:76: else if(prota->mira == M_arriba){
   4E13 7D            [ 4]  581 	ld	a,l
   4E14 D6 02         [ 7]  582 	sub	a, #0x02
   4E16 20 6B         [12]  583 	jr	NZ,00122$
                            584 ;src/knifestruct.c:77: if( *getTilePtr(mapa, prota->x + G_HERO_W / 2, prota->y - G_KNIFEY_0_H - 1) <= 2){
   4E18 E1            [10]  585 	pop	hl
   4E19 E5            [11]  586 	push	hl
   4E1A 7E            [ 7]  587 	ld	a,(hl)
   4E1B C6 F7         [ 7]  588 	add	a,#0xF7
   4E1D DD 77 F6      [19]  589 	ld	-10 (ix),a
   4E20 1A            [ 7]  590 	ld	a,(de)
   4E21 C6 03         [ 7]  591 	add	a, #0x03
   4E23 DD 77 F9      [19]  592 	ld	-7 (ix),a
   4E26 C5            [11]  593 	push	bc
   4E27 D5            [11]  594 	push	de
   4E28 DD 66 F6      [19]  595 	ld	h,-10 (ix)
   4E2B DD 6E F9      [19]  596 	ld	l,-7 (ix)
   4E2E E5            [11]  597 	push	hl
   4E2F DD 6E 08      [19]  598 	ld	l,8 (ix)
   4E32 DD 66 09      [19]  599 	ld	h,9 (ix)
   4E35 E5            [11]  600 	push	hl
   4E36 CD AA 4F      [17]  601 	call	_getTilePtr
   4E39 F1            [10]  602 	pop	af
   4E3A F1            [10]  603 	pop	af
   4E3B D1            [10]  604 	pop	de
   4E3C C1            [10]  605 	pop	bc
   4E3D 6E            [ 7]  606 	ld	l,(hl)
   4E3E 3E 02         [ 7]  607 	ld	a,#0x02
   4E40 95            [ 4]  608 	sub	a, l
   4E41 38 40         [12]  609 	jr	C,00122$
                            610 ;src/knifestruct.c:78: cu->lanzado = SI;
   4E43 DD 6E FE      [19]  611 	ld	l,-2 (ix)
   4E46 DD 66 FF      [19]  612 	ld	h,-1 (ix)
   4E49 36 01         [10]  613 	ld	(hl),#0x01
                            614 ;src/knifestruct.c:79: cu->direccion = M_arriba;
   4E4B DD 6E F7      [19]  615 	ld	l,-9 (ix)
   4E4E DD 66 F8      [19]  616 	ld	h,-8 (ix)
   4E51 36 02         [10]  617 	ld	(hl),#0x02
                            618 ;src/knifestruct.c:80: cu->x = prota->x + G_HERO_W / 2;
   4E53 1A            [ 7]  619 	ld	a,(de)
   4E54 C6 03         [ 7]  620 	add	a, #0x03
   4E56 02            [ 7]  621 	ld	(bc),a
                            622 ;src/knifestruct.c:81: cu->y = prota->y - G_KNIFEY_0_H;
   4E57 E1            [10]  623 	pop	hl
   4E58 E5            [11]  624 	push	hl
   4E59 7E            [ 7]  625 	ld	a,(hl)
   4E5A C6 F8         [ 7]  626 	add	a,#0xF8
   4E5C DD 6E F4      [19]  627 	ld	l,-12 (ix)
   4E5F DD 66 F5      [19]  628 	ld	h,-11 (ix)
   4E62 77            [ 7]  629 	ld	(hl),a
                            630 ;src/knifestruct.c:82: cu->sprite = g_knifeY_1;
   4E63 DD 6E FC      [19]  631 	ld	l,-4 (ix)
   4E66 DD 66 FD      [19]  632 	ld	h,-3 (ix)
   4E69 36 B0         [10]  633 	ld	(hl),#<(_g_knifeY_1)
   4E6B 23            [ 6]  634 	inc	hl
   4E6C 36 17         [10]  635 	ld	(hl),#>(_g_knifeY_1)
                            636 ;src/knifestruct.c:83: cu->eje = E_Y;
   4E6E DD 6E FA      [19]  637 	ld	l,-6 (ix)
   4E71 DD 66 FB      [19]  638 	ld	h,-5 (ix)
   4E74 36 01         [10]  639 	ld	(hl),#0x01
                            640 ;src/knifestruct.c:84: dibujarCuchillo(cu, g_tablatrans);
   4E76 DD 6E 0A      [19]  641 	ld	l,10 (ix)
   4E79 DD 66 0B      [19]  642 	ld	h,11 (ix)
   4E7C E5            [11]  643 	push	hl
   4E7D C5            [11]  644 	push	bc
   4E7E CD E5 4A      [17]  645 	call	_dibujarCuchillo
   4E81 F1            [10]  646 	pop	af
   4E82 F1            [10]  647 	pop	af
   4E83                     648 00122$:
   4E83 DD F9         [10]  649 	ld	sp, ix
   4E85 DD E1         [14]  650 	pop	ix
   4E87 C9            [10]  651 	ret
                            652 ;src/knifestruct.c:92: u8 checkKnifeCollision(TKnife* cu, u8 xoff, u8 yoff, u8* mapa){
                            653 ;	---------------------------------
                            654 ; Function checkKnifeCollision
                            655 ; ---------------------------------
   4E88                     656 _checkKnifeCollision::
                            657 ;src/knifestruct.c:94: return *getTilePtr(mapa, cu->x + xoff, cu->y + yoff) <= 2;
   4E88 D1            [10]  658 	pop	de
   4E89 C1            [10]  659 	pop	bc
   4E8A C5            [11]  660 	push	bc
   4E8B D5            [11]  661 	push	de
   4E8C 69            [ 4]  662 	ld	l, c
   4E8D 60            [ 4]  663 	ld	h, b
   4E8E 23            [ 6]  664 	inc	hl
   4E8F 5E            [ 7]  665 	ld	e,(hl)
   4E90 7B            [ 4]  666 	ld	a,e
   4E91 21 05 00      [10]  667 	ld	hl,#5
   4E94 39            [11]  668 	add	hl,sp
   4E95 86            [ 7]  669 	add	a, (hl)
   4E96 57            [ 4]  670 	ld	d,a
   4E97 0A            [ 7]  671 	ld	a,(bc)
   4E98 4F            [ 4]  672 	ld	c,a
   4E99 21 04 00      [10]  673 	ld	hl,#4
   4E9C 39            [11]  674 	add	hl,sp
   4E9D 86            [ 7]  675 	add	a, (hl)
   4E9E 47            [ 4]  676 	ld	b,a
   4E9F D5            [11]  677 	push	de
   4EA0 33            [ 6]  678 	inc	sp
   4EA1 C5            [11]  679 	push	bc
   4EA2 33            [ 6]  680 	inc	sp
   4EA3 21 08 00      [10]  681 	ld	hl, #8
   4EA6 39            [11]  682 	add	hl, sp
   4EA7 4E            [ 7]  683 	ld	c, (hl)
   4EA8 23            [ 6]  684 	inc	hl
   4EA9 46            [ 7]  685 	ld	b, (hl)
   4EAA C5            [11]  686 	push	bc
   4EAB CD AA 4F      [17]  687 	call	_getTilePtr
   4EAE F1            [10]  688 	pop	af
   4EAF F1            [10]  689 	pop	af
   4EB0 4E            [ 7]  690 	ld	c,(hl)
   4EB1 3E 02         [ 7]  691 	ld	a,#0x02
   4EB3 91            [ 4]  692 	sub	a, c
   4EB4 3E 00         [ 7]  693 	ld	a,#0x00
   4EB6 17            [ 4]  694 	rla
   4EB7 EE 01         [ 7]  695 	xor	a, #0x01
   4EB9 6F            [ 4]  696 	ld	l, a
   4EBA C9            [10]  697 	ret
                            698 ;src/knifestruct.c:97: void moverCuchillo(TKnife* cu, u8* mapa){
                            699 ;	---------------------------------
                            700 ; Function moverCuchillo
                            701 ; ---------------------------------
   4EBB                     702 _moverCuchillo::
   4EBB DD E5         [15]  703 	push	ix
   4EBD DD 21 00 00   [14]  704 	ld	ix,#0
   4EC1 DD 39         [15]  705 	add	ix,sp
   4EC3 F5            [11]  706 	push	af
                            707 ;src/knifestruct.c:98: if(cu->lanzado){
   4EC4 DD 4E 04      [19]  708 	ld	c,4 (ix)
   4EC7 DD 46 05      [19]  709 	ld	b,5 (ix)
   4ECA C5            [11]  710 	push	bc
   4ECB FD E1         [14]  711 	pop	iy
   4ECD FD 7E 06      [19]  712 	ld	a,6 (iy)
   4ED0 B7            [ 4]  713 	or	a, a
   4ED1 CA A5 4F      [10]  714 	jp	Z,00126$
                            715 ;src/knifestruct.c:99: cu->mover = SI;
   4ED4 21 09 00      [10]  716 	ld	hl,#0x0009
   4ED7 09            [11]  717 	add	hl,bc
   4ED8 EB            [ 4]  718 	ex	de,hl
   4ED9 3E 01         [ 7]  719 	ld	a,#0x01
   4EDB 12            [ 7]  720 	ld	(de),a
                            721 ;src/knifestruct.c:100: if(cu->direccion == M_derecha){
   4EDC C5            [11]  722 	push	bc
   4EDD FD E1         [14]  723 	pop	iy
   4EDF FD 6E 07      [19]  724 	ld	l,7 (iy)
   4EE2 7D            [ 4]  725 	ld	a,l
   4EE3 B7            [ 4]  726 	or	a, a
   4EE4 20 28         [12]  727 	jr	NZ,00122$
                            728 ;src/knifestruct.c:102: if(checkKnifeCollision(cu, G_KNIFEX_0_W + 1, 0, mapa)){
   4EE6 C5            [11]  729 	push	bc
   4EE7 D5            [11]  730 	push	de
   4EE8 DD 6E 06      [19]  731 	ld	l,6 (ix)
   4EEB DD 66 07      [19]  732 	ld	h,7 (ix)
   4EEE E5            [11]  733 	push	hl
   4EEF 21 05 00      [10]  734 	ld	hl,#0x0005
   4EF2 E5            [11]  735 	push	hl
   4EF3 C5            [11]  736 	push	bc
   4EF4 CD 88 4E      [17]  737 	call	_checkKnifeCollision
   4EF7 F1            [10]  738 	pop	af
   4EF8 F1            [10]  739 	pop	af
   4EF9 F1            [10]  740 	pop	af
   4EFA D1            [10]  741 	pop	de
   4EFB C1            [10]  742 	pop	bc
   4EFC 7D            [ 4]  743 	ld	a,l
   4EFD B7            [ 4]  744 	or	a, a
   4EFE 28 09         [12]  745 	jr	Z,00102$
                            746 ;src/knifestruct.c:103: cu->mover = SI;
   4F00 3E 01         [ 7]  747 	ld	a,#0x01
   4F02 12            [ 7]  748 	ld	(de),a
                            749 ;src/knifestruct.c:104: cu->x++;
   4F03 0A            [ 7]  750 	ld	a,(bc)
   4F04 3C            [ 4]  751 	inc	a
   4F05 02            [ 7]  752 	ld	(bc),a
   4F06 C3 A5 4F      [10]  753 	jp	00126$
   4F09                     754 00102$:
                            755 ;src/knifestruct.c:107: cu->mover=NO;
   4F09 AF            [ 4]  756 	xor	a, a
   4F0A 12            [ 7]  757 	ld	(de),a
   4F0B C3 A5 4F      [10]  758 	jp	00126$
   4F0E                     759 00122$:
                            760 ;src/knifestruct.c:110: else if(cu->direccion == M_izquierda){
   4F0E 7D            [ 4]  761 	ld	a,l
   4F0F 3D            [ 4]  762 	dec	a
   4F10 20 27         [12]  763 	jr	NZ,00119$
                            764 ;src/knifestruct.c:111: if(checkKnifeCollision(cu, -1, 0, mapa)){
   4F12 C5            [11]  765 	push	bc
   4F13 D5            [11]  766 	push	de
   4F14 DD 6E 06      [19]  767 	ld	l,6 (ix)
   4F17 DD 66 07      [19]  768 	ld	h,7 (ix)
   4F1A E5            [11]  769 	push	hl
   4F1B 21 FF 00      [10]  770 	ld	hl,#0x00FF
   4F1E E5            [11]  771 	push	hl
   4F1F C5            [11]  772 	push	bc
   4F20 CD 88 4E      [17]  773 	call	_checkKnifeCollision
   4F23 F1            [10]  774 	pop	af
   4F24 F1            [10]  775 	pop	af
   4F25 F1            [10]  776 	pop	af
   4F26 D1            [10]  777 	pop	de
   4F27 C1            [10]  778 	pop	bc
   4F28 7D            [ 4]  779 	ld	a,l
   4F29 B7            [ 4]  780 	or	a, a
   4F2A 28 09         [12]  781 	jr	Z,00105$
                            782 ;src/knifestruct.c:112: cu->mover = SI;
   4F2C 3E 01         [ 7]  783 	ld	a,#0x01
   4F2E 12            [ 7]  784 	ld	(de),a
                            785 ;src/knifestruct.c:113: cu->x--;
   4F2F 0A            [ 7]  786 	ld	a,(bc)
   4F30 C6 FF         [ 7]  787 	add	a,#0xFF
   4F32 02            [ 7]  788 	ld	(bc),a
   4F33 18 70         [12]  789 	jr	00126$
   4F35                     790 00105$:
                            791 ;src/knifestruct.c:115: cu->mover=NO;
   4F35 AF            [ 4]  792 	xor	a, a
   4F36 12            [ 7]  793 	ld	(de),a
   4F37 18 6C         [12]  794 	jr	00126$
   4F39                     795 00119$:
                            796 ;src/knifestruct.c:121: cu->y--;
   4F39 79            [ 4]  797 	ld	a,c
   4F3A C6 01         [ 7]  798 	add	a, #0x01
   4F3C DD 77 FE      [19]  799 	ld	-2 (ix),a
   4F3F 78            [ 4]  800 	ld	a,b
   4F40 CE 00         [ 7]  801 	adc	a, #0x00
   4F42 DD 77 FF      [19]  802 	ld	-1 (ix),a
                            803 ;src/knifestruct.c:118: else if(cu->direccion == M_arriba){
   4F45 7D            [ 4]  804 	ld	a,l
   4F46 D6 02         [ 7]  805 	sub	a, #0x02
   4F48 20 2C         [12]  806 	jr	NZ,00116$
                            807 ;src/knifestruct.c:119: if(checkKnifeCollision(cu, 0, -2, mapa)){
   4F4A D5            [11]  808 	push	de
   4F4B DD 6E 06      [19]  809 	ld	l,6 (ix)
   4F4E DD 66 07      [19]  810 	ld	h,7 (ix)
   4F51 E5            [11]  811 	push	hl
   4F52 21 00 FE      [10]  812 	ld	hl,#0xFE00
   4F55 E5            [11]  813 	push	hl
   4F56 C5            [11]  814 	push	bc
   4F57 CD 88 4E      [17]  815 	call	_checkKnifeCollision
   4F5A F1            [10]  816 	pop	af
   4F5B F1            [10]  817 	pop	af
   4F5C F1            [10]  818 	pop	af
   4F5D D1            [10]  819 	pop	de
   4F5E 7D            [ 4]  820 	ld	a,l
   4F5F B7            [ 4]  821 	or	a, a
   4F60 28 10         [12]  822 	jr	Z,00108$
                            823 ;src/knifestruct.c:120: cu->mover = SI;
   4F62 3E 01         [ 7]  824 	ld	a,#0x01
   4F64 12            [ 7]  825 	ld	(de),a
                            826 ;src/knifestruct.c:121: cu->y--;
   4F65 E1            [10]  827 	pop	hl
   4F66 E5            [11]  828 	push	hl
   4F67 4E            [ 7]  829 	ld	c,(hl)
   4F68 0D            [ 4]  830 	dec	c
   4F69 E1            [10]  831 	pop	hl
   4F6A E5            [11]  832 	push	hl
   4F6B 71            [ 7]  833 	ld	(hl),c
                            834 ;src/knifestruct.c:122: cu->y--;
   4F6C 0D            [ 4]  835 	dec	c
   4F6D E1            [10]  836 	pop	hl
   4F6E E5            [11]  837 	push	hl
   4F6F 71            [ 7]  838 	ld	(hl),c
   4F70 18 33         [12]  839 	jr	00126$
   4F72                     840 00108$:
                            841 ;src/knifestruct.c:125: cu->mover=NO;
   4F72 AF            [ 4]  842 	xor	a, a
   4F73 12            [ 7]  843 	ld	(de),a
   4F74 18 2F         [12]  844 	jr	00126$
   4F76                     845 00116$:
                            846 ;src/knifestruct.c:128: else if(cu->direccion == M_abajo){
   4F76 7D            [ 4]  847 	ld	a,l
   4F77 D6 03         [ 7]  848 	sub	a, #0x03
   4F79 20 2A         [12]  849 	jr	NZ,00126$
                            850 ;src/knifestruct.c:129: if(checkKnifeCollision(cu, 0, G_KNIFEY_0_H + 2, mapa)){
   4F7B D5            [11]  851 	push	de
   4F7C DD 6E 06      [19]  852 	ld	l,6 (ix)
   4F7F DD 66 07      [19]  853 	ld	h,7 (ix)
   4F82 E5            [11]  854 	push	hl
   4F83 21 00 0A      [10]  855 	ld	hl,#0x0A00
   4F86 E5            [11]  856 	push	hl
   4F87 C5            [11]  857 	push	bc
   4F88 CD 88 4E      [17]  858 	call	_checkKnifeCollision
   4F8B F1            [10]  859 	pop	af
   4F8C F1            [10]  860 	pop	af
   4F8D F1            [10]  861 	pop	af
   4F8E D1            [10]  862 	pop	de
   4F8F 7D            [ 4]  863 	ld	a,l
   4F90 B7            [ 4]  864 	or	a, a
   4F91 28 10         [12]  865 	jr	Z,00111$
                            866 ;src/knifestruct.c:130: cu->mover = SI;
   4F93 3E 01         [ 7]  867 	ld	a,#0x01
   4F95 12            [ 7]  868 	ld	(de),a
                            869 ;src/knifestruct.c:131: cu->y++;
   4F96 E1            [10]  870 	pop	hl
   4F97 E5            [11]  871 	push	hl
   4F98 4E            [ 7]  872 	ld	c,(hl)
   4F99 0C            [ 4]  873 	inc	c
   4F9A E1            [10]  874 	pop	hl
   4F9B E5            [11]  875 	push	hl
   4F9C 71            [ 7]  876 	ld	(hl),c
                            877 ;src/knifestruct.c:132: cu->y++;
   4F9D 0C            [ 4]  878 	inc	c
   4F9E E1            [10]  879 	pop	hl
   4F9F E5            [11]  880 	push	hl
   4FA0 71            [ 7]  881 	ld	(hl),c
   4FA1 18 02         [12]  882 	jr	00126$
   4FA3                     883 00111$:
                            884 ;src/knifestruct.c:135: cu->mover=NO;
   4FA3 AF            [ 4]  885 	xor	a, a
   4FA4 12            [ 7]  886 	ld	(de),a
   4FA5                     887 00126$:
   4FA5 DD F9         [10]  888 	ld	sp, ix
   4FA7 DD E1         [14]  889 	pop	ix
   4FA9 C9            [10]  890 	ret
                            891 	.area _CODE
                            892 	.area _INITIALIZER
                            893 	.area _CABS (ABS)
