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
   710A                      56 _dibujarCuchillo::
   710A DD E5         [15]   57 	push	ix
   710C DD 21 00 00   [14]   58 	ld	ix,#0
   7110 DD 39         [15]   59 	add	ix,sp
   7112 21 FA FF      [10]   60 	ld	hl,#-6
   7115 39            [11]   61 	add	hl,sp
   7116 F9            [ 6]   62 	ld	sp,hl
                             63 ;src/knifestruct.c:4: u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, cu->x, cu->y);
   7117 DD 5E 04      [19]   64 	ld	e,4 (ix)
   711A DD 56 05      [19]   65 	ld	d,5 (ix)
   711D 6B            [ 4]   66 	ld	l, e
   711E 62            [ 4]   67 	ld	h, d
   711F 23            [ 6]   68 	inc	hl
   7120 46            [ 7]   69 	ld	b,(hl)
   7121 1A            [ 7]   70 	ld	a,(de)
   7122 D5            [11]   71 	push	de
   7123 C5            [11]   72 	push	bc
   7124 33            [ 6]   73 	inc	sp
   7125 F5            [11]   74 	push	af
   7126 33            [ 6]   75 	inc	sp
   7127 21 00 C0      [10]   76 	ld	hl,#0xC000
   712A E5            [11]   77 	push	hl
   712B CD 91 8A      [17]   78 	call	_cpct_getScreenPtr
   712E D1            [10]   79 	pop	de
   712F 33            [ 6]   80 	inc	sp
   7130 33            [ 6]   81 	inc	sp
   7131 E5            [11]   82 	push	hl
                             83 ;src/knifestruct.c:5: if(cu->eje == E_X){
   7132 D5            [11]   84 	push	de
   7133 FD E1         [14]   85 	pop	iy
   7135 FD 4E 08      [19]   86 	ld	c,8 (iy)
                             87 ;src/knifestruct.c:6: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   7138 DD 7E 06      [19]   88 	ld	a,6 (ix)
   713B DD 77 FC      [19]   89 	ld	-4 (ix),a
   713E DD 7E 07      [19]   90 	ld	a,7 (ix)
   7141 DD 77 FD      [19]   91 	ld	-3 (ix),a
   7144 DD 7E FA      [19]   92 	ld	a,-6 (ix)
   7147 DD 77 FE      [19]   93 	ld	-2 (ix),a
   714A DD 7E FB      [19]   94 	ld	a,-5 (ix)
   714D DD 77 FF      [19]   95 	ld	-1 (ix),a
   7150 13            [ 6]   96 	inc	de
   7151 13            [ 6]   97 	inc	de
   7152 13            [ 6]   98 	inc	de
   7153 13            [ 6]   99 	inc	de
                            100 ;src/knifestruct.c:5: if(cu->eje == E_X){
   7154 79            [ 4]  101 	ld	a,c
   7155 B7            [ 4]  102 	or	a, a
   7156 20 1A         [12]  103 	jr	NZ,00104$
                            104 ;src/knifestruct.c:6: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEX_0_W, G_KNIFEX_0_H, g_tablatrans);
   7158 EB            [ 4]  105 	ex	de,hl
   7159 4E            [ 7]  106 	ld	c,(hl)
   715A 23            [ 6]  107 	inc	hl
   715B 46            [ 7]  108 	ld	b,(hl)
   715C D1            [10]  109 	pop	de
   715D E1            [10]  110 	pop	hl
   715E E5            [11]  111 	push	hl
   715F D5            [11]  112 	push	de
   7160 E5            [11]  113 	push	hl
   7161 21 04 04      [10]  114 	ld	hl,#0x0404
   7164 E5            [11]  115 	push	hl
   7165 DD 6E FE      [19]  116 	ld	l,-2 (ix)
   7168 DD 66 FF      [19]  117 	ld	h,-1 (ix)
   716B E5            [11]  118 	push	hl
   716C C5            [11]  119 	push	bc
   716D CD B1 8A      [17]  120 	call	_cpct_drawSpriteMaskedAlignedTable
   7170 18 1B         [12]  121 	jr	00106$
   7172                     122 00104$:
                            123 ;src/knifestruct.c:9: else if(cu->eje == E_Y){
   7172 0D            [ 4]  124 	dec	c
   7173 20 18         [12]  125 	jr	NZ,00106$
                            126 ;src/knifestruct.c:10: cpct_drawSpriteMaskedAlignedTable (cu->sprite, pvmem, G_KNIFEY_0_W, G_KNIFEY_0_H, g_tablatrans);
   7175 EB            [ 4]  127 	ex	de,hl
   7176 4E            [ 7]  128 	ld	c,(hl)
   7177 23            [ 6]  129 	inc	hl
   7178 46            [ 7]  130 	ld	b,(hl)
   7179 D1            [10]  131 	pop	de
   717A E1            [10]  132 	pop	hl
   717B E5            [11]  133 	push	hl
   717C D5            [11]  134 	push	de
   717D E5            [11]  135 	push	hl
   717E 21 02 08      [10]  136 	ld	hl,#0x0802
   7181 E5            [11]  137 	push	hl
   7182 DD 6E FE      [19]  138 	ld	l,-2 (ix)
   7185 DD 66 FF      [19]  139 	ld	h,-1 (ix)
   7188 E5            [11]  140 	push	hl
   7189 C5            [11]  141 	push	bc
   718A CD B1 8A      [17]  142 	call	_cpct_drawSpriteMaskedAlignedTable
   718D                     143 00106$:
   718D DD F9         [10]  144 	ld	sp, ix
   718F DD E1         [14]  145 	pop	ix
   7191 C9            [10]  146 	ret
                            147 ;src/knifestruct.c:14: void borrarCuchillo(TKnife* cu, u8* mapa) {
                            148 ;	---------------------------------
                            149 ; Function borrarCuchillo
                            150 ; ---------------------------------
   7192                     151 _borrarCuchillo::
   7192 DD E5         [15]  152 	push	ix
   7194 DD 21 00 00   [14]  153 	ld	ix,#0
   7198 DD 39         [15]  154 	add	ix,sp
   719A 21 F9 FF      [10]  155 	ld	hl,#-7
   719D 39            [11]  156 	add	hl,sp
   719E F9            [ 6]  157 	ld	sp,hl
                            158 ;src/knifestruct.c:19: u8 w = 2 + (cu->px & 1);
   719F DD 4E 04      [19]  159 	ld	c,4 (ix)
   71A2 DD 46 05      [19]  160 	ld	b,5 (ix)
   71A5 69            [ 4]  161 	ld	l, c
   71A6 60            [ 4]  162 	ld	h, b
   71A7 23            [ 6]  163 	inc	hl
   71A8 23            [ 6]  164 	inc	hl
   71A9 7E            [ 7]  165 	ld	a,(hl)
   71AA DD 77 FF      [19]  166 	ld	-1 (ix), a
   71AD E6 01         [ 7]  167 	and	a, #0x01
   71AF C6 02         [ 7]  168 	add	a, #0x02
   71B1 DD 77 F9      [19]  169 	ld	-7 (ix),a
                            170 ;src/knifestruct.c:20: u8 h = 2 + (cu->py & 3 ? 1 : 0);
   71B4 69            [ 4]  171 	ld	l, c
   71B5 60            [ 4]  172 	ld	h, b
   71B6 23            [ 6]  173 	inc	hl
   71B7 23            [ 6]  174 	inc	hl
   71B8 23            [ 6]  175 	inc	hl
   71B9 5E            [ 7]  176 	ld	e,(hl)
   71BA 7B            [ 4]  177 	ld	a,e
   71BB E6 03         [ 7]  178 	and	a, #0x03
   71BD 28 04         [12]  179 	jr	Z,00105$
   71BF 3E 01         [ 7]  180 	ld	a,#0x01
   71C1 18 02         [12]  181 	jr	00106$
   71C3                     182 00105$:
   71C3 3E 00         [ 7]  183 	ld	a,#0x00
   71C5                     184 00106$:
   71C5 C6 02         [ 7]  185 	add	a, #0x02
   71C7 DD 77 FA      [19]  186 	ld	-6 (ix),a
                            187 ;src/knifestruct.c:22: cpct_etm_drawTileBox2x4 (cu->px / 2, (cu->py - ORIGEN_MAPA_Y)/4, w, h, g_map1_W, p, mapa);
   71CA DD 7E 06      [19]  188 	ld	a,6 (ix)
   71CD DD 77 FD      [19]  189 	ld	-3 (ix),a
   71D0 DD 7E 07      [19]  190 	ld	a,7 (ix)
   71D3 DD 77 FE      [19]  191 	ld	-2 (ix),a
   71D6 16 00         [ 7]  192 	ld	d,#0x00
   71D8 7B            [ 4]  193 	ld	a,e
   71D9 C6 E8         [ 7]  194 	add	a,#0xE8
   71DB DD 77 FB      [19]  195 	ld	-5 (ix),a
   71DE 7A            [ 4]  196 	ld	a,d
   71DF CE FF         [ 7]  197 	adc	a,#0xFF
   71E1 DD 77 FC      [19]  198 	ld	-4 (ix),a
   71E4 DD 6E FB      [19]  199 	ld	l,-5 (ix)
   71E7 DD 66 FC      [19]  200 	ld	h,-4 (ix)
   71EA DD CB FC 7E   [20]  201 	bit	7, -4 (ix)
   71EE 28 04         [12]  202 	jr	Z,00107$
   71F0 21 EB FF      [10]  203 	ld	hl,#0xFFEB
   71F3 19            [11]  204 	add	hl,de
   71F4                     205 00107$:
   71F4 CB 2C         [ 8]  206 	sra	h
   71F6 CB 1D         [ 8]  207 	rr	l
   71F8 CB 2C         [ 8]  208 	sra	h
   71FA CB 1D         [ 8]  209 	rr	l
   71FC 5D            [ 4]  210 	ld	e,l
   71FD DD 56 FF      [19]  211 	ld	d,-1 (ix)
   7200 CB 3A         [ 8]  212 	srl	d
   7202 C5            [11]  213 	push	bc
   7203 DD 6E FD      [19]  214 	ld	l,-3 (ix)
   7206 DD 66 FE      [19]  215 	ld	h,-2 (ix)
   7209 E5            [11]  216 	push	hl
   720A 21 F0 C0      [10]  217 	ld	hl,#0xC0F0
   720D E5            [11]  218 	push	hl
   720E 3E 28         [ 7]  219 	ld	a,#0x28
   7210 F5            [11]  220 	push	af
   7211 33            [ 6]  221 	inc	sp
   7212 DD 66 FA      [19]  222 	ld	h,-6 (ix)
   7215 DD 6E F9      [19]  223 	ld	l,-7 (ix)
   7218 E5            [11]  224 	push	hl
   7219 7B            [ 4]  225 	ld	a,e
   721A F5            [11]  226 	push	af
   721B 33            [ 6]  227 	inc	sp
   721C D5            [11]  228 	push	de
   721D 33            [ 6]  229 	inc	sp
   721E CD 73 7F      [17]  230 	call	_cpct_etm_drawTileBox2x4
   7221 C1            [10]  231 	pop	bc
                            232 ;src/knifestruct.c:23: if(!cu->mover){
   7222 C5            [11]  233 	push	bc
   7223 FD E1         [14]  234 	pop	iy
   7225 FD 7E 09      [19]  235 	ld	a,9 (iy)
   7228 B7            [ 4]  236 	or	a, a
   7229 20 06         [12]  237 	jr	NZ,00103$
                            238 ;src/knifestruct.c:24: cu->lanzado = NO;
   722B 21 06 00      [10]  239 	ld	hl,#0x0006
   722E 09            [11]  240 	add	hl,bc
   722F 36 00         [10]  241 	ld	(hl),#0x00
   7231                     242 00103$:
   7231 DD F9         [10]  243 	ld	sp, ix
   7233 DD E1         [14]  244 	pop	ix
   7235 C9            [10]  245 	ret
                            246 ;src/knifestruct.c:28: void redibujarCuchillo(TKnife* cu, u8* g_tablatrans, u8* mapa) {
                            247 ;	---------------------------------
                            248 ; Function redibujarCuchillo
                            249 ; ---------------------------------
   7236                     250 _redibujarCuchillo::
   7236 DD E5         [15]  251 	push	ix
   7238 DD 21 00 00   [14]  252 	ld	ix,#0
   723C DD 39         [15]  253 	add	ix,sp
                            254 ;src/knifestruct.c:29: borrarCuchillo(cu, mapa);
   723E DD 6E 08      [19]  255 	ld	l,8 (ix)
   7241 DD 66 09      [19]  256 	ld	h,9 (ix)
   7244 E5            [11]  257 	push	hl
   7245 DD 6E 04      [19]  258 	ld	l,4 (ix)
   7248 DD 66 05      [19]  259 	ld	h,5 (ix)
   724B E5            [11]  260 	push	hl
   724C CD 92 71      [17]  261 	call	_borrarCuchillo
   724F F1            [10]  262 	pop	af
   7250 F1            [10]  263 	pop	af
                            264 ;src/knifestruct.c:30: cu->px = cu->x;
   7251 DD 4E 04      [19]  265 	ld	c,4 (ix)
   7254 DD 46 05      [19]  266 	ld	b,5 (ix)
   7257 59            [ 4]  267 	ld	e, c
   7258 50            [ 4]  268 	ld	d, b
   7259 13            [ 6]  269 	inc	de
   725A 13            [ 6]  270 	inc	de
   725B 0A            [ 7]  271 	ld	a,(bc)
   725C 12            [ 7]  272 	ld	(de),a
                            273 ;src/knifestruct.c:31: cu->py = cu->y;
   725D 59            [ 4]  274 	ld	e, c
   725E 50            [ 4]  275 	ld	d, b
   725F 13            [ 6]  276 	inc	de
   7260 13            [ 6]  277 	inc	de
   7261 13            [ 6]  278 	inc	de
   7262 69            [ 4]  279 	ld	l, c
   7263 60            [ 4]  280 	ld	h, b
   7264 23            [ 6]  281 	inc	hl
   7265 7E            [ 7]  282 	ld	a,(hl)
   7266 12            [ 7]  283 	ld	(de),a
                            284 ;src/knifestruct.c:32: dibujarCuchillo(cu, g_tablatrans);
   7267 DD 6E 06      [19]  285 	ld	l,6 (ix)
   726A DD 66 07      [19]  286 	ld	h,7 (ix)
   726D E5            [11]  287 	push	hl
   726E C5            [11]  288 	push	bc
   726F CD 0A 71      [17]  289 	call	_dibujarCuchillo
   7272 F1            [10]  290 	pop	af
   7273 F1            [10]  291 	pop	af
   7274 DD E1         [14]  292 	pop	ix
   7276 C9            [10]  293 	ret
                            294 ;src/knifestruct.c:35: void lanzarCuchillo(TKnife* cu, TProta* prota, u8* mapa, u8* g_tablatrans){
                            295 ;	---------------------------------
                            296 ; Function lanzarCuchillo
                            297 ; ---------------------------------
   7277                     298 _lanzarCuchillo::
   7277 DD E5         [15]  299 	push	ix
   7279 DD 21 00 00   [14]  300 	ld	ix,#0
   727D DD 39         [15]  301 	add	ix,sp
   727F 21 F2 FF      [10]  302 	ld	hl,#-14
   7282 39            [11]  303 	add	hl,sp
   7283 F9            [ 6]  304 	ld	sp,hl
                            305 ;src/knifestruct.c:37: if(!cu->lanzado){
   7284 DD 4E 04      [19]  306 	ld	c,4 (ix)
   7287 DD 46 05      [19]  307 	ld	b,5 (ix)
   728A 21 06 00      [10]  308 	ld	hl,#0x0006
   728D 09            [11]  309 	add	hl,bc
   728E DD 75 FE      [19]  310 	ld	-2 (ix),l
   7291 DD 74 FF      [19]  311 	ld	-1 (ix),h
   7294 DD 6E FE      [19]  312 	ld	l,-2 (ix)
   7297 DD 66 FF      [19]  313 	ld	h,-1 (ix)
   729A 7E            [ 7]  314 	ld	a,(hl)
   729B B7            [ 4]  315 	or	a, a
   729C C2 C1 74      [10]  316 	jp	NZ,00122$
                            317 ;src/knifestruct.c:39: if(prota->mira == M_derecha){
   729F DD 5E 06      [19]  318 	ld	e,6 (ix)
   72A2 DD 56 07      [19]  319 	ld	d,7 (ix)
   72A5 6B            [ 4]  320 	ld	l, e
   72A6 62            [ 4]  321 	ld	h, d
   72A7 C5            [11]  322 	push	bc
   72A8 01 07 00      [10]  323 	ld	bc, #0x0007
   72AB 09            [11]  324 	add	hl, bc
   72AC C1            [10]  325 	pop	bc
   72AD 6E            [ 7]  326 	ld	l,(hl)
                            327 ;src/knifestruct.c:40: if( *getTilePtr(mapa, prota->x + G_HERO_W + G_KNIFEX_0_W + 1, prota->y + G_HERO_H /2) <= 2){
   72AE 7B            [ 4]  328 	ld	a,e
   72AF C6 01         [ 7]  329 	add	a, #0x01
   72B1 DD 77 FC      [19]  330 	ld	-4 (ix),a
   72B4 7A            [ 4]  331 	ld	a,d
   72B5 CE 00         [ 7]  332 	adc	a, #0x00
   72B7 DD 77 FD      [19]  333 	ld	-3 (ix),a
                            334 ;src/knifestruct.c:42: cu->direccion = M_derecha;
   72BA 79            [ 4]  335 	ld	a,c
   72BB C6 07         [ 7]  336 	add	a, #0x07
   72BD DD 77 F8      [19]  337 	ld	-8 (ix),a
   72C0 78            [ 4]  338 	ld	a,b
   72C1 CE 00         [ 7]  339 	adc	a, #0x00
   72C3 DD 77 F9      [19]  340 	ld	-7 (ix),a
                            341 ;src/knifestruct.c:44: cu->y=prota->y + G_HERO_H /2;
   72C6 79            [ 4]  342 	ld	a,c
   72C7 C6 01         [ 7]  343 	add	a, #0x01
   72C9 DD 77 F4      [19]  344 	ld	-12 (ix),a
   72CC 78            [ 4]  345 	ld	a,b
   72CD CE 00         [ 7]  346 	adc	a, #0x00
   72CF DD 77 F5      [19]  347 	ld	-11 (ix),a
                            348 ;src/knifestruct.c:45: cu->sprite=g_knifeX_0;
   72D2 79            [ 4]  349 	ld	a,c
   72D3 C6 04         [ 7]  350 	add	a, #0x04
   72D5 DD 77 F2      [19]  351 	ld	-14 (ix),a
   72D8 78            [ 4]  352 	ld	a,b
   72D9 CE 00         [ 7]  353 	adc	a, #0x00
   72DB DD 77 F3      [19]  354 	ld	-13 (ix),a
                            355 ;src/knifestruct.c:46: cu->eje = E_X;
   72DE 79            [ 4]  356 	ld	a,c
   72DF C6 08         [ 7]  357 	add	a, #0x08
   72E1 DD 77 F6      [19]  358 	ld	-10 (ix),a
   72E4 78            [ 4]  359 	ld	a,b
   72E5 CE 00         [ 7]  360 	adc	a, #0x00
   72E7 DD 77 F7      [19]  361 	ld	-9 (ix),a
                            362 ;src/knifestruct.c:39: if(prota->mira == M_derecha){
   72EA 7D            [ 4]  363 	ld	a,l
   72EB B7            [ 4]  364 	or	a, a
   72EC 20 73         [12]  365 	jr	NZ,00118$
                            366 ;src/knifestruct.c:40: if( *getTilePtr(mapa, prota->x + G_HERO_W + G_KNIFEX_0_W + 1, prota->y + G_HERO_H /2) <= 2){
   72EE DD 6E FC      [19]  367 	ld	l,-4 (ix)
   72F1 DD 66 FD      [19]  368 	ld	h,-3 (ix)
   72F4 7E            [ 7]  369 	ld	a,(hl)
   72F5 C6 0B         [ 7]  370 	add	a, #0x0B
   72F7 DD 77 FB      [19]  371 	ld	-5 (ix),a
   72FA 1A            [ 7]  372 	ld	a,(de)
   72FB C6 0C         [ 7]  373 	add	a, #0x0C
   72FD DD 77 FA      [19]  374 	ld	-6 (ix),a
   7300 C5            [11]  375 	push	bc
   7301 D5            [11]  376 	push	de
   7302 DD 66 FB      [19]  377 	ld	h,-5 (ix)
   7305 DD 6E FA      [19]  378 	ld	l,-6 (ix)
   7308 E5            [11]  379 	push	hl
   7309 DD 6E 08      [19]  380 	ld	l,8 (ix)
   730C DD 66 09      [19]  381 	ld	h,9 (ix)
   730F E5            [11]  382 	push	hl
   7310 CD E8 75      [17]  383 	call	_getTilePtr
   7313 F1            [10]  384 	pop	af
   7314 F1            [10]  385 	pop	af
   7315 D1            [10]  386 	pop	de
   7316 C1            [10]  387 	pop	bc
   7317 6E            [ 7]  388 	ld	l,(hl)
   7318 3E 02         [ 7]  389 	ld	a,#0x02
   731A 95            [ 4]  390 	sub	a, l
   731B DA C1 74      [10]  391 	jp	C,00122$
                            392 ;src/knifestruct.c:41: cu->lanzado = SI;
   731E DD 6E FE      [19]  393 	ld	l,-2 (ix)
   7321 DD 66 FF      [19]  394 	ld	h,-1 (ix)
   7324 36 01         [10]  395 	ld	(hl),#0x01
                            396 ;src/knifestruct.c:42: cu->direccion = M_derecha;
   7326 DD 6E F8      [19]  397 	ld	l,-8 (ix)
   7329 DD 66 F9      [19]  398 	ld	h,-7 (ix)
   732C 36 00         [10]  399 	ld	(hl),#0x00
                            400 ;src/knifestruct.c:43: cu->x=prota->x + G_HERO_W;
   732E 1A            [ 7]  401 	ld	a,(de)
   732F C6 07         [ 7]  402 	add	a, #0x07
   7331 02            [ 7]  403 	ld	(bc),a
                            404 ;src/knifestruct.c:44: cu->y=prota->y + G_HERO_H /2;
   7332 DD 6E FC      [19]  405 	ld	l,-4 (ix)
   7335 DD 66 FD      [19]  406 	ld	h,-3 (ix)
   7338 7E            [ 7]  407 	ld	a,(hl)
   7339 C6 0B         [ 7]  408 	add	a, #0x0B
   733B DD 6E F4      [19]  409 	ld	l,-12 (ix)
   733E DD 66 F5      [19]  410 	ld	h,-11 (ix)
   7341 77            [ 7]  411 	ld	(hl),a
                            412 ;src/knifestruct.c:45: cu->sprite=g_knifeX_0;
   7342 E1            [10]  413 	pop	hl
   7343 E5            [11]  414 	push	hl
   7344 36 C0         [10]  415 	ld	(hl),#<(_g_knifeX_0)
   7346 23            [ 6]  416 	inc	hl
   7347 36 49         [10]  417 	ld	(hl),#>(_g_knifeX_0)
                            418 ;src/knifestruct.c:46: cu->eje = E_X;
   7349 DD 6E F6      [19]  419 	ld	l,-10 (ix)
   734C DD 66 F7      [19]  420 	ld	h,-9 (ix)
   734F 36 00         [10]  421 	ld	(hl),#0x00
                            422 ;src/knifestruct.c:47: dibujarCuchillo(cu, g_tablatrans);
   7351 DD 6E 0A      [19]  423 	ld	l,10 (ix)
   7354 DD 66 0B      [19]  424 	ld	h,11 (ix)
   7357 E5            [11]  425 	push	hl
   7358 C5            [11]  426 	push	bc
   7359 CD 0A 71      [17]  427 	call	_dibujarCuchillo
   735C F1            [10]  428 	pop	af
   735D F1            [10]  429 	pop	af
   735E C3 C1 74      [10]  430 	jp	00122$
   7361                     431 00118$:
                            432 ;src/knifestruct.c:50: else if(prota->mira == M_izquierda){
   7361 7D            [ 4]  433 	ld	a,l
   7362 3D            [ 4]  434 	dec	a
   7363 20 73         [12]  435 	jr	NZ,00115$
                            436 ;src/knifestruct.c:51: if( *getTilePtr(mapa, prota->x - G_KNIFEX_0_W - 1 - G_KNIFEX_0_W - 1, prota->y + G_HERO_H /2) <= 2){
   7365 DD 6E FC      [19]  437 	ld	l,-4 (ix)
   7368 DD 66 FD      [19]  438 	ld	h,-3 (ix)
   736B 7E            [ 7]  439 	ld	a,(hl)
   736C C6 0B         [ 7]  440 	add	a, #0x0B
   736E DD 77 FA      [19]  441 	ld	-6 (ix),a
   7371 1A            [ 7]  442 	ld	a,(de)
   7372 C6 F6         [ 7]  443 	add	a,#0xF6
   7374 DD 77 FB      [19]  444 	ld	-5 (ix),a
   7377 C5            [11]  445 	push	bc
   7378 D5            [11]  446 	push	de
   7379 DD 66 FA      [19]  447 	ld	h,-6 (ix)
   737C DD 6E FB      [19]  448 	ld	l,-5 (ix)
   737F E5            [11]  449 	push	hl
   7380 DD 6E 08      [19]  450 	ld	l,8 (ix)
   7383 DD 66 09      [19]  451 	ld	h,9 (ix)
   7386 E5            [11]  452 	push	hl
   7387 CD E8 75      [17]  453 	call	_getTilePtr
   738A F1            [10]  454 	pop	af
   738B F1            [10]  455 	pop	af
   738C D1            [10]  456 	pop	de
   738D C1            [10]  457 	pop	bc
   738E 6E            [ 7]  458 	ld	l,(hl)
   738F 3E 02         [ 7]  459 	ld	a,#0x02
   7391 95            [ 4]  460 	sub	a, l
   7392 DA C1 74      [10]  461 	jp	C,00122$
                            462 ;src/knifestruct.c:52: cu->lanzado = SI;
   7395 DD 6E FE      [19]  463 	ld	l,-2 (ix)
   7398 DD 66 FF      [19]  464 	ld	h,-1 (ix)
   739B 36 01         [10]  465 	ld	(hl),#0x01
                            466 ;src/knifestruct.c:53: cu->direccion = M_izquierda;
   739D DD 6E F8      [19]  467 	ld	l,-8 (ix)
   73A0 DD 66 F9      [19]  468 	ld	h,-7 (ix)
   73A3 36 01         [10]  469 	ld	(hl),#0x01
                            470 ;src/knifestruct.c:54: cu->x = prota->x - G_KNIFEX_0_W;
   73A5 1A            [ 7]  471 	ld	a,(de)
   73A6 C6 FC         [ 7]  472 	add	a,#0xFC
   73A8 02            [ 7]  473 	ld	(bc),a
                            474 ;src/knifestruct.c:55: cu->y = prota->y + G_HERO_H /2;
   73A9 DD 6E FC      [19]  475 	ld	l,-4 (ix)
   73AC DD 66 FD      [19]  476 	ld	h,-3 (ix)
   73AF 7E            [ 7]  477 	ld	a,(hl)
   73B0 C6 0B         [ 7]  478 	add	a, #0x0B
   73B2 DD 6E F4      [19]  479 	ld	l,-12 (ix)
   73B5 DD 66 F5      [19]  480 	ld	h,-11 (ix)
   73B8 77            [ 7]  481 	ld	(hl),a
                            482 ;src/knifestruct.c:56: cu->sprite = g_knifeX_1;
   73B9 E1            [10]  483 	pop	hl
   73BA E5            [11]  484 	push	hl
   73BB 36 D0         [10]  485 	ld	(hl),#<(_g_knifeX_1)
   73BD 23            [ 6]  486 	inc	hl
   73BE 36 49         [10]  487 	ld	(hl),#>(_g_knifeX_1)
                            488 ;src/knifestruct.c:57: cu->eje = E_X;
   73C0 DD 6E F6      [19]  489 	ld	l,-10 (ix)
   73C3 DD 66 F7      [19]  490 	ld	h,-9 (ix)
   73C6 36 00         [10]  491 	ld	(hl),#0x00
                            492 ;src/knifestruct.c:58: dibujarCuchillo(cu, g_tablatrans);
   73C8 DD 6E 0A      [19]  493 	ld	l,10 (ix)
   73CB DD 66 0B      [19]  494 	ld	h,11 (ix)
   73CE E5            [11]  495 	push	hl
   73CF C5            [11]  496 	push	bc
   73D0 CD 0A 71      [17]  497 	call	_dibujarCuchillo
   73D3 F1            [10]  498 	pop	af
   73D4 F1            [10]  499 	pop	af
   73D5 C3 C1 74      [10]  500 	jp	00122$
   73D8                     501 00115$:
                            502 ;src/knifestruct.c:61: else if(prota->mira == M_abajo){
   73D8 7D            [ 4]  503 	ld	a,l
   73D9 D6 03         [ 7]  504 	sub	a, #0x03
   73DB 20 72         [12]  505 	jr	NZ,00112$
                            506 ;src/knifestruct.c:63: if( *getTilePtr(mapa, prota->x + G_HERO_W / 2, prota->y + G_HERO_H + G_KNIFEY_0_H + 1) <= 2){
   73DD DD 6E FC      [19]  507 	ld	l,-4 (ix)
   73E0 DD 66 FD      [19]  508 	ld	h,-3 (ix)
   73E3 7E            [ 7]  509 	ld	a,(hl)
   73E4 C6 1F         [ 7]  510 	add	a, #0x1F
   73E6 DD 77 FA      [19]  511 	ld	-6 (ix),a
   73E9 1A            [ 7]  512 	ld	a,(de)
   73EA C6 03         [ 7]  513 	add	a, #0x03
   73EC DD 77 FB      [19]  514 	ld	-5 (ix),a
   73EF C5            [11]  515 	push	bc
   73F0 D5            [11]  516 	push	de
   73F1 DD 66 FA      [19]  517 	ld	h,-6 (ix)
   73F4 DD 6E FB      [19]  518 	ld	l,-5 (ix)
   73F7 E5            [11]  519 	push	hl
   73F8 DD 6E 08      [19]  520 	ld	l,8 (ix)
   73FB DD 66 09      [19]  521 	ld	h,9 (ix)
   73FE E5            [11]  522 	push	hl
   73FF CD E8 75      [17]  523 	call	_getTilePtr
   7402 F1            [10]  524 	pop	af
   7403 F1            [10]  525 	pop	af
   7404 D1            [10]  526 	pop	de
   7405 C1            [10]  527 	pop	bc
   7406 6E            [ 7]  528 	ld	l,(hl)
   7407 3E 02         [ 7]  529 	ld	a,#0x02
   7409 95            [ 4]  530 	sub	a, l
   740A DA C1 74      [10]  531 	jp	C,00122$
                            532 ;src/knifestruct.c:64: cu->lanzado = SI;
   740D DD 6E FE      [19]  533 	ld	l,-2 (ix)
   7410 DD 66 FF      [19]  534 	ld	h,-1 (ix)
   7413 36 01         [10]  535 	ld	(hl),#0x01
                            536 ;src/knifestruct.c:65: cu->direccion = M_abajo;
   7415 DD 6E F8      [19]  537 	ld	l,-8 (ix)
   7418 DD 66 F9      [19]  538 	ld	h,-7 (ix)
   741B 36 03         [10]  539 	ld	(hl),#0x03
                            540 ;src/knifestruct.c:66: cu->x = prota->x + G_HERO_W / 2;
   741D 1A            [ 7]  541 	ld	a,(de)
   741E C6 03         [ 7]  542 	add	a, #0x03
   7420 02            [ 7]  543 	ld	(bc),a
                            544 ;src/knifestruct.c:67: cu->y = prota->y + G_HERO_H;
   7421 DD 6E FC      [19]  545 	ld	l,-4 (ix)
   7424 DD 66 FD      [19]  546 	ld	h,-3 (ix)
   7427 7E            [ 7]  547 	ld	a,(hl)
   7428 C6 16         [ 7]  548 	add	a, #0x16
   742A DD 6E F4      [19]  549 	ld	l,-12 (ix)
   742D DD 66 F5      [19]  550 	ld	h,-11 (ix)
   7430 77            [ 7]  551 	ld	(hl),a
                            552 ;src/knifestruct.c:68: cu->sprite = g_knifeY_0;
   7431 E1            [10]  553 	pop	hl
   7432 E5            [11]  554 	push	hl
   7433 36 A0         [10]  555 	ld	(hl),#<(_g_knifeY_0)
   7435 23            [ 6]  556 	inc	hl
   7436 36 49         [10]  557 	ld	(hl),#>(_g_knifeY_0)
                            558 ;src/knifestruct.c:69: cu->eje = E_Y;
   7438 DD 6E F6      [19]  559 	ld	l,-10 (ix)
   743B DD 66 F7      [19]  560 	ld	h,-9 (ix)
   743E 36 01         [10]  561 	ld	(hl),#0x01
                            562 ;src/knifestruct.c:70: dibujarCuchillo(cu, g_tablatrans);
   7440 DD 6E 0A      [19]  563 	ld	l,10 (ix)
   7443 DD 66 0B      [19]  564 	ld	h,11 (ix)
   7446 E5            [11]  565 	push	hl
   7447 C5            [11]  566 	push	bc
   7448 CD 0A 71      [17]  567 	call	_dibujarCuchillo
   744B F1            [10]  568 	pop	af
   744C F1            [10]  569 	pop	af
   744D 18 72         [12]  570 	jr	00122$
   744F                     571 00112$:
                            572 ;src/knifestruct.c:73: else if(prota->mira == M_arriba){
   744F 7D            [ 4]  573 	ld	a,l
   7450 D6 02         [ 7]  574 	sub	a, #0x02
   7452 20 6D         [12]  575 	jr	NZ,00122$
                            576 ;src/knifestruct.c:74: if( *getTilePtr(mapa, prota->x + G_HERO_W / 2, prota->y - G_KNIFEY_0_H - 1) <= 2){
   7454 DD 6E FC      [19]  577 	ld	l,-4 (ix)
   7457 DD 66 FD      [19]  578 	ld	h,-3 (ix)
   745A 7E            [ 7]  579 	ld	a,(hl)
   745B C6 F7         [ 7]  580 	add	a,#0xF7
   745D DD 77 FA      [19]  581 	ld	-6 (ix),a
   7460 1A            [ 7]  582 	ld	a,(de)
   7461 C6 03         [ 7]  583 	add	a, #0x03
   7463 DD 77 FB      [19]  584 	ld	-5 (ix),a
   7466 C5            [11]  585 	push	bc
   7467 D5            [11]  586 	push	de
   7468 DD 66 FA      [19]  587 	ld	h,-6 (ix)
   746B DD 6E FB      [19]  588 	ld	l,-5 (ix)
   746E E5            [11]  589 	push	hl
   746F DD 6E 08      [19]  590 	ld	l,8 (ix)
   7472 DD 66 09      [19]  591 	ld	h,9 (ix)
   7475 E5            [11]  592 	push	hl
   7476 CD E8 75      [17]  593 	call	_getTilePtr
   7479 F1            [10]  594 	pop	af
   747A F1            [10]  595 	pop	af
   747B D1            [10]  596 	pop	de
   747C C1            [10]  597 	pop	bc
   747D 6E            [ 7]  598 	ld	l,(hl)
   747E 3E 02         [ 7]  599 	ld	a,#0x02
   7480 95            [ 4]  600 	sub	a, l
   7481 38 3E         [12]  601 	jr	C,00122$
                            602 ;src/knifestruct.c:75: cu->lanzado = SI;
   7483 DD 6E FE      [19]  603 	ld	l,-2 (ix)
   7486 DD 66 FF      [19]  604 	ld	h,-1 (ix)
   7489 36 01         [10]  605 	ld	(hl),#0x01
                            606 ;src/knifestruct.c:76: cu->direccion = M_arriba;
   748B DD 6E F8      [19]  607 	ld	l,-8 (ix)
   748E DD 66 F9      [19]  608 	ld	h,-7 (ix)
   7491 36 02         [10]  609 	ld	(hl),#0x02
                            610 ;src/knifestruct.c:77: cu->x = prota->x + G_HERO_W / 2;
   7493 1A            [ 7]  611 	ld	a,(de)
   7494 C6 03         [ 7]  612 	add	a, #0x03
   7496 02            [ 7]  613 	ld	(bc),a
                            614 ;src/knifestruct.c:78: cu->y = prota->y;
   7497 DD 6E FC      [19]  615 	ld	l,-4 (ix)
   749A DD 66 FD      [19]  616 	ld	h,-3 (ix)
   749D 5E            [ 7]  617 	ld	e,(hl)
   749E DD 6E F4      [19]  618 	ld	l,-12 (ix)
   74A1 DD 66 F5      [19]  619 	ld	h,-11 (ix)
   74A4 73            [ 7]  620 	ld	(hl),e
                            621 ;src/knifestruct.c:79: cu->sprite = g_knifeY_1;
   74A5 E1            [10]  622 	pop	hl
   74A6 E5            [11]  623 	push	hl
   74A7 36 B0         [10]  624 	ld	(hl),#<(_g_knifeY_1)
   74A9 23            [ 6]  625 	inc	hl
   74AA 36 49         [10]  626 	ld	(hl),#>(_g_knifeY_1)
                            627 ;src/knifestruct.c:80: cu->eje = E_Y;
   74AC DD 6E F6      [19]  628 	ld	l,-10 (ix)
   74AF DD 66 F7      [19]  629 	ld	h,-9 (ix)
   74B2 36 01         [10]  630 	ld	(hl),#0x01
                            631 ;src/knifestruct.c:81: dibujarCuchillo(cu, g_tablatrans);
   74B4 DD 6E 0A      [19]  632 	ld	l,10 (ix)
   74B7 DD 66 0B      [19]  633 	ld	h,11 (ix)
   74BA E5            [11]  634 	push	hl
   74BB C5            [11]  635 	push	bc
   74BC CD 0A 71      [17]  636 	call	_dibujarCuchillo
   74BF F1            [10]  637 	pop	af
   74C0 F1            [10]  638 	pop	af
   74C1                     639 00122$:
   74C1 DD F9         [10]  640 	ld	sp, ix
   74C3 DD E1         [14]  641 	pop	ix
   74C5 C9            [10]  642 	ret
                            643 ;src/knifestruct.c:89: u8 checkKnifeCollision(TKnife* cu, u8 xoff, u8 yoff, u8* mapa){
                            644 ;	---------------------------------
                            645 ; Function checkKnifeCollision
                            646 ; ---------------------------------
   74C6                     647 _checkKnifeCollision::
                            648 ;src/knifestruct.c:91: return *getTilePtr(mapa, cu->x + xoff, cu->y + yoff) <= 2;
   74C6 D1            [10]  649 	pop	de
   74C7 C1            [10]  650 	pop	bc
   74C8 C5            [11]  651 	push	bc
   74C9 D5            [11]  652 	push	de
   74CA 69            [ 4]  653 	ld	l, c
   74CB 60            [ 4]  654 	ld	h, b
   74CC 23            [ 6]  655 	inc	hl
   74CD 5E            [ 7]  656 	ld	e,(hl)
   74CE 7B            [ 4]  657 	ld	a,e
   74CF 21 05 00      [10]  658 	ld	hl,#5
   74D2 39            [11]  659 	add	hl,sp
   74D3 86            [ 7]  660 	add	a, (hl)
   74D4 57            [ 4]  661 	ld	d,a
   74D5 0A            [ 7]  662 	ld	a,(bc)
   74D6 4F            [ 4]  663 	ld	c,a
   74D7 21 04 00      [10]  664 	ld	hl,#4
   74DA 39            [11]  665 	add	hl,sp
   74DB 86            [ 7]  666 	add	a, (hl)
   74DC 47            [ 4]  667 	ld	b,a
   74DD D5            [11]  668 	push	de
   74DE 33            [ 6]  669 	inc	sp
   74DF C5            [11]  670 	push	bc
   74E0 33            [ 6]  671 	inc	sp
   74E1 21 08 00      [10]  672 	ld	hl, #8
   74E4 39            [11]  673 	add	hl, sp
   74E5 4E            [ 7]  674 	ld	c, (hl)
   74E6 23            [ 6]  675 	inc	hl
   74E7 46            [ 7]  676 	ld	b, (hl)
   74E8 C5            [11]  677 	push	bc
   74E9 CD E8 75      [17]  678 	call	_getTilePtr
   74EC F1            [10]  679 	pop	af
   74ED F1            [10]  680 	pop	af
   74EE 4E            [ 7]  681 	ld	c,(hl)
   74EF 3E 02         [ 7]  682 	ld	a,#0x02
   74F1 91            [ 4]  683 	sub	a, c
   74F2 3E 00         [ 7]  684 	ld	a,#0x00
   74F4 17            [ 4]  685 	rla
   74F5 EE 01         [ 7]  686 	xor	a, #0x01
   74F7 6F            [ 4]  687 	ld	l, a
   74F8 C9            [10]  688 	ret
                            689 ;src/knifestruct.c:94: void moverCuchillo(TKnife* cu, u8* mapa){
                            690 ;	---------------------------------
                            691 ; Function moverCuchillo
                            692 ; ---------------------------------
   74F9                     693 _moverCuchillo::
   74F9 DD E5         [15]  694 	push	ix
   74FB DD 21 00 00   [14]  695 	ld	ix,#0
   74FF DD 39         [15]  696 	add	ix,sp
   7501 F5            [11]  697 	push	af
                            698 ;src/knifestruct.c:95: if(cu->lanzado){
   7502 DD 4E 04      [19]  699 	ld	c,4 (ix)
   7505 DD 46 05      [19]  700 	ld	b,5 (ix)
   7508 C5            [11]  701 	push	bc
   7509 FD E1         [14]  702 	pop	iy
   750B FD 7E 06      [19]  703 	ld	a,6 (iy)
   750E B7            [ 4]  704 	or	a, a
   750F CA E3 75      [10]  705 	jp	Z,00126$
                            706 ;src/knifestruct.c:96: cu->mover = SI;
   7512 21 09 00      [10]  707 	ld	hl,#0x0009
   7515 09            [11]  708 	add	hl,bc
   7516 EB            [ 4]  709 	ex	de,hl
   7517 3E 01         [ 7]  710 	ld	a,#0x01
   7519 12            [ 7]  711 	ld	(de),a
                            712 ;src/knifestruct.c:97: if(cu->direccion == M_derecha){
   751A C5            [11]  713 	push	bc
   751B FD E1         [14]  714 	pop	iy
   751D FD 6E 07      [19]  715 	ld	l,7 (iy)
   7520 7D            [ 4]  716 	ld	a,l
   7521 B7            [ 4]  717 	or	a, a
   7522 20 28         [12]  718 	jr	NZ,00122$
                            719 ;src/knifestruct.c:99: if(checkKnifeCollision(cu, G_KNIFEX_0_W + 1, 0, mapa)){
   7524 C5            [11]  720 	push	bc
   7525 D5            [11]  721 	push	de
   7526 DD 6E 06      [19]  722 	ld	l,6 (ix)
   7529 DD 66 07      [19]  723 	ld	h,7 (ix)
   752C E5            [11]  724 	push	hl
   752D 21 05 00      [10]  725 	ld	hl,#0x0005
   7530 E5            [11]  726 	push	hl
   7531 C5            [11]  727 	push	bc
   7532 CD C6 74      [17]  728 	call	_checkKnifeCollision
   7535 F1            [10]  729 	pop	af
   7536 F1            [10]  730 	pop	af
   7537 F1            [10]  731 	pop	af
   7538 D1            [10]  732 	pop	de
   7539 C1            [10]  733 	pop	bc
   753A 7D            [ 4]  734 	ld	a,l
   753B B7            [ 4]  735 	or	a, a
   753C 28 09         [12]  736 	jr	Z,00102$
                            737 ;src/knifestruct.c:100: cu->mover = SI;
   753E 3E 01         [ 7]  738 	ld	a,#0x01
   7540 12            [ 7]  739 	ld	(de),a
                            740 ;src/knifestruct.c:101: cu->x++;
   7541 0A            [ 7]  741 	ld	a,(bc)
   7542 3C            [ 4]  742 	inc	a
   7543 02            [ 7]  743 	ld	(bc),a
   7544 C3 E3 75      [10]  744 	jp	00126$
   7547                     745 00102$:
                            746 ;src/knifestruct.c:104: cu->mover=NO;
   7547 AF            [ 4]  747 	xor	a, a
   7548 12            [ 7]  748 	ld	(de),a
   7549 C3 E3 75      [10]  749 	jp	00126$
   754C                     750 00122$:
                            751 ;src/knifestruct.c:107: else if(cu->direccion == M_izquierda){
   754C 7D            [ 4]  752 	ld	a,l
   754D 3D            [ 4]  753 	dec	a
   754E 20 27         [12]  754 	jr	NZ,00119$
                            755 ;src/knifestruct.c:108: if(checkKnifeCollision(cu, -1, 0, mapa)){
   7550 C5            [11]  756 	push	bc
   7551 D5            [11]  757 	push	de
   7552 DD 6E 06      [19]  758 	ld	l,6 (ix)
   7555 DD 66 07      [19]  759 	ld	h,7 (ix)
   7558 E5            [11]  760 	push	hl
   7559 21 FF 00      [10]  761 	ld	hl,#0x00FF
   755C E5            [11]  762 	push	hl
   755D C5            [11]  763 	push	bc
   755E CD C6 74      [17]  764 	call	_checkKnifeCollision
   7561 F1            [10]  765 	pop	af
   7562 F1            [10]  766 	pop	af
   7563 F1            [10]  767 	pop	af
   7564 D1            [10]  768 	pop	de
   7565 C1            [10]  769 	pop	bc
   7566 7D            [ 4]  770 	ld	a,l
   7567 B7            [ 4]  771 	or	a, a
   7568 28 09         [12]  772 	jr	Z,00105$
                            773 ;src/knifestruct.c:109: cu->mover = SI;
   756A 3E 01         [ 7]  774 	ld	a,#0x01
   756C 12            [ 7]  775 	ld	(de),a
                            776 ;src/knifestruct.c:110: cu->x--;
   756D 0A            [ 7]  777 	ld	a,(bc)
   756E C6 FF         [ 7]  778 	add	a,#0xFF
   7570 02            [ 7]  779 	ld	(bc),a
   7571 18 70         [12]  780 	jr	00126$
   7573                     781 00105$:
                            782 ;src/knifestruct.c:112: cu->mover=NO;
   7573 AF            [ 4]  783 	xor	a, a
   7574 12            [ 7]  784 	ld	(de),a
   7575 18 6C         [12]  785 	jr	00126$
   7577                     786 00119$:
                            787 ;src/knifestruct.c:118: cu->y--;
   7577 79            [ 4]  788 	ld	a,c
   7578 C6 01         [ 7]  789 	add	a, #0x01
   757A DD 77 FE      [19]  790 	ld	-2 (ix),a
   757D 78            [ 4]  791 	ld	a,b
   757E CE 00         [ 7]  792 	adc	a, #0x00
   7580 DD 77 FF      [19]  793 	ld	-1 (ix),a
                            794 ;src/knifestruct.c:115: else if(cu->direccion == M_arriba){
   7583 7D            [ 4]  795 	ld	a,l
   7584 D6 02         [ 7]  796 	sub	a, #0x02
   7586 20 2C         [12]  797 	jr	NZ,00116$
                            798 ;src/knifestruct.c:116: if(checkKnifeCollision(cu, 0, -2, mapa)){
   7588 D5            [11]  799 	push	de
   7589 DD 6E 06      [19]  800 	ld	l,6 (ix)
   758C DD 66 07      [19]  801 	ld	h,7 (ix)
   758F E5            [11]  802 	push	hl
   7590 21 00 FE      [10]  803 	ld	hl,#0xFE00
   7593 E5            [11]  804 	push	hl
   7594 C5            [11]  805 	push	bc
   7595 CD C6 74      [17]  806 	call	_checkKnifeCollision
   7598 F1            [10]  807 	pop	af
   7599 F1            [10]  808 	pop	af
   759A F1            [10]  809 	pop	af
   759B D1            [10]  810 	pop	de
   759C 7D            [ 4]  811 	ld	a,l
   759D B7            [ 4]  812 	or	a, a
   759E 28 10         [12]  813 	jr	Z,00108$
                            814 ;src/knifestruct.c:117: cu->mover = SI;
   75A0 3E 01         [ 7]  815 	ld	a,#0x01
   75A2 12            [ 7]  816 	ld	(de),a
                            817 ;src/knifestruct.c:118: cu->y--;
   75A3 E1            [10]  818 	pop	hl
   75A4 E5            [11]  819 	push	hl
   75A5 4E            [ 7]  820 	ld	c,(hl)
   75A6 0D            [ 4]  821 	dec	c
   75A7 E1            [10]  822 	pop	hl
   75A8 E5            [11]  823 	push	hl
   75A9 71            [ 7]  824 	ld	(hl),c
                            825 ;src/knifestruct.c:119: cu->y--;
   75AA 0D            [ 4]  826 	dec	c
   75AB E1            [10]  827 	pop	hl
   75AC E5            [11]  828 	push	hl
   75AD 71            [ 7]  829 	ld	(hl),c
   75AE 18 33         [12]  830 	jr	00126$
   75B0                     831 00108$:
                            832 ;src/knifestruct.c:122: cu->mover=NO;
   75B0 AF            [ 4]  833 	xor	a, a
   75B1 12            [ 7]  834 	ld	(de),a
   75B2 18 2F         [12]  835 	jr	00126$
   75B4                     836 00116$:
                            837 ;src/knifestruct.c:125: else if(cu->direccion == M_abajo){
   75B4 7D            [ 4]  838 	ld	a,l
   75B5 D6 03         [ 7]  839 	sub	a, #0x03
   75B7 20 2A         [12]  840 	jr	NZ,00126$
                            841 ;src/knifestruct.c:126: if(checkKnifeCollision(cu, 0, G_KNIFEY_0_H + 2, mapa)){
   75B9 D5            [11]  842 	push	de
   75BA DD 6E 06      [19]  843 	ld	l,6 (ix)
   75BD DD 66 07      [19]  844 	ld	h,7 (ix)
   75C0 E5            [11]  845 	push	hl
   75C1 21 00 0A      [10]  846 	ld	hl,#0x0A00
   75C4 E5            [11]  847 	push	hl
   75C5 C5            [11]  848 	push	bc
   75C6 CD C6 74      [17]  849 	call	_checkKnifeCollision
   75C9 F1            [10]  850 	pop	af
   75CA F1            [10]  851 	pop	af
   75CB F1            [10]  852 	pop	af
   75CC D1            [10]  853 	pop	de
   75CD 7D            [ 4]  854 	ld	a,l
   75CE B7            [ 4]  855 	or	a, a
   75CF 28 10         [12]  856 	jr	Z,00111$
                            857 ;src/knifestruct.c:127: cu->mover = SI;
   75D1 3E 01         [ 7]  858 	ld	a,#0x01
   75D3 12            [ 7]  859 	ld	(de),a
                            860 ;src/knifestruct.c:128: cu->y++;
   75D4 E1            [10]  861 	pop	hl
   75D5 E5            [11]  862 	push	hl
   75D6 4E            [ 7]  863 	ld	c,(hl)
   75D7 0C            [ 4]  864 	inc	c
   75D8 E1            [10]  865 	pop	hl
   75D9 E5            [11]  866 	push	hl
   75DA 71            [ 7]  867 	ld	(hl),c
                            868 ;src/knifestruct.c:129: cu->y++;
   75DB 0C            [ 4]  869 	inc	c
   75DC E1            [10]  870 	pop	hl
   75DD E5            [11]  871 	push	hl
   75DE 71            [ 7]  872 	ld	(hl),c
   75DF 18 02         [12]  873 	jr	00126$
   75E1                     874 00111$:
                            875 ;src/knifestruct.c:132: cu->mover=NO;
   75E1 AF            [ 4]  876 	xor	a, a
   75E2 12            [ 7]  877 	ld	(de),a
   75E3                     878 00126$:
   75E3 DD F9         [10]  879 	ld	sp, ix
   75E5 DD E1         [14]  880 	pop	ix
   75E7 C9            [10]  881 	ret
                            882 	.area _CODE
                            883 	.area _INITIALIZER
                            884 	.area _CABS (ABS)
