                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module menu
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _cpct_getScreenPtr
                             12 	.globl _cpct_drawStringM0
                             13 	.globl _cpct_drawSolidBox
                             14 	.globl _cpct_drawSprite
                             15 	.globl _cpct_isKeyPressed
                             16 	.globl _cpct_scanKeyboard_f
                             17 	.globl _cpct_memset
                             18 	.globl _borrarPantalla
                             19 	.globl _menuInstrucciones
                             20 	.globl _menuCreditos
                             21 	.globl _menuOpciones
                             22 	.globl _menuInicio
                             23 ;--------------------------------------------------------
                             24 ; special function registers
                             25 ;--------------------------------------------------------
                             26 ;--------------------------------------------------------
                             27 ; ram data
                             28 ;--------------------------------------------------------
                             29 	.area _DATA
                             30 ;--------------------------------------------------------
                             31 ; ram data
                             32 ;--------------------------------------------------------
                             33 	.area _INITIALIZED
                             34 ;--------------------------------------------------------
                             35 ; absolute external ram data
                             36 ;--------------------------------------------------------
                             37 	.area _DABS (ABS)
                             38 ;--------------------------------------------------------
                             39 ; global & static initialisations
                             40 ;--------------------------------------------------------
                             41 	.area _HOME
                             42 	.area _GSINIT
                             43 	.area _GSFINAL
                             44 	.area _GSINIT
                             45 ;--------------------------------------------------------
                             46 ; Home
                             47 ;--------------------------------------------------------
                             48 	.area _HOME
                             49 	.area _HOME
                             50 ;--------------------------------------------------------
                             51 ; code
                             52 ;--------------------------------------------------------
                             53 	.area _CODE
                             54 ;src/menu/menu.c:7: void borrarPantalla(u8 x, u8 y, u8 ancho, u8 alto){
                             55 ;	---------------------------------
                             56 ; Function borrarPantalla
                             57 ; ---------------------------------
   4BE5                      58 _borrarPantalla::
   4BE5 DD E5         [15]   59 	push	ix
   4BE7 DD 21 00 00   [14]   60 	ld	ix,#0
   4BEB DD 39         [15]   61 	add	ix,sp
                             62 ;src/menu/menu.c:9: if (ancho <= 40){
   4BED 3E 28         [ 7]   63 	ld	a,#0x28
   4BEF DD 96 06      [19]   64 	sub	a, 6 (ix)
   4BF2 3E 00         [ 7]   65 	ld	a,#0x00
   4BF4 17            [ 4]   66 	rla
   4BF5 4F            [ 4]   67 	ld	c,a
   4BF6 CB 41         [ 8]   68 	bit	0,c
   4BF8 20 23         [12]   69 	jr	NZ,00104$
                             70 ;src/menu/menu.c:10: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar
   4BFA DD 66 05      [19]   71 	ld	h,5 (ix)
   4BFD DD 6E 04      [19]   72 	ld	l,4 (ix)
   4C00 E5            [11]   73 	push	hl
   4C01 21 00 C0      [10]   74 	ld	hl,#0xC000
   4C04 E5            [11]   75 	push	hl
   4C05 CD FB 5E      [17]   76 	call	_cpct_getScreenPtr
   4C08 4D            [ 4]   77 	ld	c,l
   4C09 44            [ 4]   78 	ld	b,h
                             79 ;src/menu/menu.c:11: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra
   4C0A DD 66 07      [19]   80 	ld	h,7 (ix)
   4C0D DD 6E 06      [19]   81 	ld	l,6 (ix)
   4C10 E5            [11]   82 	push	hl
   4C11 AF            [ 4]   83 	xor	a, a
   4C12 F5            [11]   84 	push	af
   4C13 33            [ 6]   85 	inc	sp
   4C14 C5            [11]   86 	push	bc
   4C15 CD F8 55      [17]   87 	call	_cpct_drawSolidBox
   4C18 F1            [10]   88 	pop	af
   4C19 F1            [10]   89 	pop	af
   4C1A 33            [ 6]   90 	inc	sp
   4C1B 18 51         [12]   91 	jr	00106$
   4C1D                      92 00104$:
                             93 ;src/menu/menu.c:13: else if (ancho > 40){
   4C1D CB 41         [ 8]   94 	bit	0,c
   4C1F 28 4D         [12]   95 	jr	Z,00106$
                             96 ;src/menu/menu.c:15: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   4C21 DD 66 05      [19]   97 	ld	h,5 (ix)
   4C24 DD 6E 04      [19]   98 	ld	l,4 (ix)
   4C27 E5            [11]   99 	push	hl
   4C28 21 00 C0      [10]  100 	ld	hl,#0xC000
   4C2B E5            [11]  101 	push	hl
   4C2C CD FB 5E      [17]  102 	call	_cpct_getScreenPtr
   4C2F 4D            [ 4]  103 	ld	c,l
   4C30 44            [ 4]  104 	ld	b,h
                            105 ;src/menu/menu.c:16: cpct_drawSolidBox(memptr, 0, 40, alto);  //borra la mitad derecha
   4C31 DD 7E 07      [19]  106 	ld	a,7 (ix)
   4C34 F5            [11]  107 	push	af
   4C35 33            [ 6]  108 	inc	sp
   4C36 21 00 28      [10]  109 	ld	hl,#0x2800
   4C39 E5            [11]  110 	push	hl
   4C3A C5            [11]  111 	push	bc
   4C3B CD F8 55      [17]  112 	call	_cpct_drawSolidBox
   4C3E F1            [10]  113 	pop	af
   4C3F F1            [10]  114 	pop	af
   4C40 33            [ 6]  115 	inc	sp
                            116 ;src/menu/menu.c:17: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   4C41 DD 7E 04      [19]  117 	ld	a,4 (ix)
   4C44 C6 28         [ 7]  118 	add	a, #0x28
   4C46 47            [ 4]  119 	ld	b,a
   4C47 DD 7E 05      [19]  120 	ld	a,5 (ix)
   4C4A F5            [11]  121 	push	af
   4C4B 33            [ 6]  122 	inc	sp
   4C4C C5            [11]  123 	push	bc
   4C4D 33            [ 6]  124 	inc	sp
   4C4E 21 00 C0      [10]  125 	ld	hl,#0xC000
   4C51 E5            [11]  126 	push	hl
   4C52 CD FB 5E      [17]  127 	call	_cpct_getScreenPtr
   4C55 4D            [ 4]  128 	ld	c,l
   4C56 44            [ 4]  129 	ld	b,h
                            130 ;src/menu/menu.c:18: cpct_drawSolidBox(memptr, 0, ancho-40, alto);  //borra la mitad izquierda
   4C57 DD 7E 06      [19]  131 	ld	a,6 (ix)
   4C5A C6 D8         [ 7]  132 	add	a,#0xD8
   4C5C 57            [ 4]  133 	ld	d,a
   4C5D DD 7E 07      [19]  134 	ld	a,7 (ix)
   4C60 F5            [11]  135 	push	af
   4C61 33            [ 6]  136 	inc	sp
   4C62 D5            [11]  137 	push	de
   4C63 33            [ 6]  138 	inc	sp
   4C64 AF            [ 4]  139 	xor	a, a
   4C65 F5            [11]  140 	push	af
   4C66 33            [ 6]  141 	inc	sp
   4C67 C5            [11]  142 	push	bc
   4C68 CD F8 55      [17]  143 	call	_cpct_drawSolidBox
   4C6B F1            [10]  144 	pop	af
   4C6C F1            [10]  145 	pop	af
   4C6D 33            [ 6]  146 	inc	sp
   4C6E                     147 00106$:
   4C6E DD E1         [14]  148 	pop	ix
   4C70 C9            [10]  149 	ret
                            150 ;src/menu/menu.c:22: void menuInstrucciones(){ // TODO TODO
                            151 ;	---------------------------------
                            152 ; Function menuInstrucciones
                            153 ; ---------------------------------
   4C71                     154 _menuInstrucciones::
                            155 ;src/menu/menu.c:24: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4C71 21 50 82      [10]  156 	ld	hl,#0x8250
   4C74 E5            [11]  157 	push	hl
   4C75 21 00 1E      [10]  158 	ld	hl,#0x1E00
   4C78 E5            [11]  159 	push	hl
   4C79 CD E5 4B      [17]  160 	call	_borrarPantalla
   4C7C F1            [10]  161 	pop	af
                            162 ;src/menu/menu.c:27: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 16, 85); // centrado en horizontal y abajo en vertical
   4C7D 21 10 55      [10]  163 	ld	hl, #0x5510
   4C80 E3            [19]  164 	ex	(sp),hl
   4C81 21 00 C0      [10]  165 	ld	hl,#0xC000
   4C84 E5            [11]  166 	push	hl
   4C85 CD FB 5E      [17]  167 	call	_cpct_getScreenPtr
   4C88 4D            [ 4]  168 	ld	c,l
   4C89 44            [ 4]  169 	ld	b,h
                            170 ;src/menu/menu.c:28: cpct_drawStringM0("INSTRUCTIONS", memptr, 2, 0);
   4C8A 21 02 00      [10]  171 	ld	hl,#0x0002
   4C8D E5            [11]  172 	push	hl
   4C8E C5            [11]  173 	push	bc
   4C8F 21 5F 4D      [10]  174 	ld	hl,#___str_0
   4C92 E5            [11]  175 	push	hl
   4C93 CD 14 53      [17]  176 	call	_cpct_drawStringM0
   4C96 21 06 00      [10]  177 	ld	hl,#6
   4C99 39            [11]  178 	add	hl,sp
   4C9A F9            [ 6]  179 	ld	sp,hl
                            180 ;src/menu/menu.c:31: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 115); // dibuja 5 corazones
   4C9B 21 04 73      [10]  181 	ld	hl,#0x7304
   4C9E E5            [11]  182 	push	hl
   4C9F 21 00 C0      [10]  183 	ld	hl,#0xC000
   4CA2 E5            [11]  184 	push	hl
   4CA3 CD FB 5E      [17]  185 	call	_cpct_getScreenPtr
   4CA6 4D            [ 4]  186 	ld	c,l
   4CA7 44            [ 4]  187 	ld	b,h
                            188 ;src/menu/menu.c:32: cpct_drawSprite (g_arrows_0, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4CA8 21 05 0A      [10]  189 	ld	hl,#0x0A05
   4CAB E5            [11]  190 	push	hl
   4CAC C5            [11]  191 	push	bc
   4CAD 21 A8 18      [10]  192 	ld	hl,#_g_arrows_0
   4CB0 E5            [11]  193 	push	hl
   4CB1 CD 38 53      [17]  194 	call	_cpct_drawSprite
                            195 ;src/menu/menu.c:34: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // dibuja 5 corazones
   4CB4 21 0E 73      [10]  196 	ld	hl,#0x730E
   4CB7 E5            [11]  197 	push	hl
   4CB8 21 00 C0      [10]  198 	ld	hl,#0xC000
   4CBB E5            [11]  199 	push	hl
   4CBC CD FB 5E      [17]  200 	call	_cpct_getScreenPtr
   4CBF 4D            [ 4]  201 	ld	c,l
   4CC0 44            [ 4]  202 	ld	b,h
                            203 ;src/menu/menu.c:35: cpct_drawSprite (g_arrows_1, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4CC1 21 05 0A      [10]  204 	ld	hl,#0x0A05
   4CC4 E5            [11]  205 	push	hl
   4CC5 C5            [11]  206 	push	bc
   4CC6 21 DA 18      [10]  207 	ld	hl,#_g_arrows_1
   4CC9 E5            [11]  208 	push	hl
   4CCA CD 38 53      [17]  209 	call	_cpct_drawSprite
                            210 ;src/menu/menu.c:37: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 115); // dibuja 5 corazones
   4CCD 21 18 73      [10]  211 	ld	hl,#0x7318
   4CD0 E5            [11]  212 	push	hl
   4CD1 21 00 C0      [10]  213 	ld	hl,#0xC000
   4CD4 E5            [11]  214 	push	hl
   4CD5 CD FB 5E      [17]  215 	call	_cpct_getScreenPtr
   4CD8 4D            [ 4]  216 	ld	c,l
   4CD9 44            [ 4]  217 	ld	b,h
                            218 ;src/menu/menu.c:38: cpct_drawSprite (g_arrows_2, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4CDA 21 05 0A      [10]  219 	ld	hl,#0x0A05
   4CDD E5            [11]  220 	push	hl
   4CDE C5            [11]  221 	push	bc
   4CDF 21 0C 19      [10]  222 	ld	hl,#_g_arrows_2
   4CE2 E5            [11]  223 	push	hl
   4CE3 CD 38 53      [17]  224 	call	_cpct_drawSprite
                            225 ;src/menu/menu.c:40: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 34, 115); // dibuja 5 corazones
   4CE6 21 22 73      [10]  226 	ld	hl,#0x7322
   4CE9 E5            [11]  227 	push	hl
   4CEA 21 00 C0      [10]  228 	ld	hl,#0xC000
   4CED E5            [11]  229 	push	hl
   4CEE CD FB 5E      [17]  230 	call	_cpct_getScreenPtr
   4CF1 4D            [ 4]  231 	ld	c,l
   4CF2 44            [ 4]  232 	ld	b,h
                            233 ;src/menu/menu.c:41: cpct_drawSprite (g_arrows_3, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4CF3 21 05 0A      [10]  234 	ld	hl,#0x0A05
   4CF6 E5            [11]  235 	push	hl
   4CF7 C5            [11]  236 	push	bc
   4CF8 21 3E 19      [10]  237 	ld	hl,#_g_arrows_3
   4CFB E5            [11]  238 	push	hl
   4CFC CD 38 53      [17]  239 	call	_cpct_drawSprite
                            240 ;src/menu/menu.c:43: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 115); // centrado en horizontal y abajo en vertical
   4CFF 21 2D 73      [10]  241 	ld	hl,#0x732D
   4D02 E5            [11]  242 	push	hl
   4D03 21 00 C0      [10]  243 	ld	hl,#0xC000
   4D06 E5            [11]  244 	push	hl
   4D07 CD FB 5E      [17]  245 	call	_cpct_getScreenPtr
   4D0A 4D            [ 4]  246 	ld	c,l
   4D0B 44            [ 4]  247 	ld	b,h
                            248 ;src/menu/menu.c:44: cpct_drawStringM0(" TO MOVE", memptr, 2, 0);
   4D0C 21 02 00      [10]  249 	ld	hl,#0x0002
   4D0F E5            [11]  250 	push	hl
   4D10 C5            [11]  251 	push	bc
   4D11 21 6C 4D      [10]  252 	ld	hl,#___str_1
   4D14 E5            [11]  253 	push	hl
   4D15 CD 14 53      [17]  254 	call	_cpct_drawStringM0
   4D18 21 06 00      [10]  255 	ld	hl,#6
   4D1B 39            [11]  256 	add	hl,sp
   4D1C F9            [ 6]  257 	ld	sp,hl
                            258 ;src/menu/menu.c:46: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 130); // centrado en horizontal y abajo en vertical
   4D1D 21 04 82      [10]  259 	ld	hl,#0x8204
   4D20 E5            [11]  260 	push	hl
   4D21 21 00 C0      [10]  261 	ld	hl,#0xC000
   4D24 E5            [11]  262 	push	hl
   4D25 CD FB 5E      [17]  263 	call	_cpct_getScreenPtr
   4D28 4D            [ 4]  264 	ld	c,l
   4D29 44            [ 4]  265 	ld	b,h
                            266 ;src/menu/menu.c:47: cpct_drawStringM0("SPACE BAR TO SHOOT", memptr, 2, 0);
   4D2A 21 02 00      [10]  267 	ld	hl,#0x0002
   4D2D E5            [11]  268 	push	hl
   4D2E C5            [11]  269 	push	bc
   4D2F 21 75 4D      [10]  270 	ld	hl,#___str_2
   4D32 E5            [11]  271 	push	hl
   4D33 CD 14 53      [17]  272 	call	_cpct_drawStringM0
   4D36 21 06 00      [10]  273 	ld	hl,#6
   4D39 39            [11]  274 	add	hl,sp
   4D3A F9            [ 6]  275 	ld	sp,hl
                            276 ;src/menu/menu.c:49: do{
   4D3B                     277 00104$:
                            278 ;src/menu/menu.c:50: cpct_scanKeyboard_f();
   4D3B CD 9E 52      [17]  279 	call	_cpct_scanKeyboard_f
                            280 ;src/menu/menu.c:51: if(cpct_isKeyPressed(Key_M)){
   4D3E 21 04 40      [10]  281 	ld	hl,#0x4004
   4D41 CD 92 52      [17]  282 	call	_cpct_isKeyPressed
   4D44 7D            [ 4]  283 	ld	a,l
   4D45 B7            [ 4]  284 	or	a, a
   4D46 28 03         [12]  285 	jr	Z,00105$
                            286 ;src/menu/menu.c:52: menuOpciones();
   4D48 CD 67 4E      [17]  287 	call	_menuOpciones
   4D4B                     288 00105$:
                            289 ;src/menu/menu.c:55: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   4D4B 21 07 10      [10]  290 	ld	hl,#0x1007
   4D4E CD 92 52      [17]  291 	call	_cpct_isKeyPressed
   4D51 7D            [ 4]  292 	ld	a,l
   4D52 B7            [ 4]  293 	or	a, a
   4D53 C0            [11]  294 	ret	NZ
   4D54 21 04 40      [10]  295 	ld	hl,#0x4004
   4D57 CD 92 52      [17]  296 	call	_cpct_isKeyPressed
   4D5A 7D            [ 4]  297 	ld	a,l
   4D5B B7            [ 4]  298 	or	a, a
   4D5C 28 DD         [12]  299 	jr	Z,00104$
   4D5E C9            [10]  300 	ret
   4D5F                     301 ___str_0:
   4D5F 49 4E 53 54 52 55   302 	.ascii "INSTRUCTIONS"
        43 54 49 4F 4E 53
   4D6B 00                  303 	.db 0x00
   4D6C                     304 ___str_1:
   4D6C 20 54 4F 20 4D 4F   305 	.ascii " TO MOVE"
        56 45
   4D74 00                  306 	.db 0x00
   4D75                     307 ___str_2:
   4D75 53 50 41 43 45 20   308 	.ascii "SPACE BAR TO SHOOT"
        42 41 52 20 54 4F
        20 53 48 4F 4F 54
   4D87 00                  309 	.db 0x00
                            310 ;src/menu/menu.c:58: void menuCreditos(){ // TODO TODO
                            311 ;	---------------------------------
                            312 ; Function menuCreditos
                            313 ; ---------------------------------
   4D88                     314 _menuCreditos::
                            315 ;src/menu/menu.c:60: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4D88 21 50 82      [10]  316 	ld	hl,#0x8250
   4D8B E5            [11]  317 	push	hl
   4D8C 21 00 1E      [10]  318 	ld	hl,#0x1E00
   4D8F E5            [11]  319 	push	hl
   4D90 CD E5 4B      [17]  320 	call	_borrarPantalla
   4D93 F1            [10]  321 	pop	af
                            322 ;src/menu/menu.c:63: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 70); // centrado en horizontal y abajo en vertical
   4D94 21 1A 46      [10]  323 	ld	hl, #0x461A
   4D97 E3            [19]  324 	ex	(sp),hl
   4D98 21 00 C0      [10]  325 	ld	hl,#0xC000
   4D9B E5            [11]  326 	push	hl
   4D9C CD FB 5E      [17]  327 	call	_cpct_getScreenPtr
   4D9F 4D            [ 4]  328 	ld	c,l
   4DA0 44            [ 4]  329 	ld	b,h
                            330 ;src/menu/menu.c:64: cpct_drawStringM0("CREDITS", memptr, 2, 0);
   4DA1 21 02 00      [10]  331 	ld	hl,#0x0002
   4DA4 E5            [11]  332 	push	hl
   4DA5 C5            [11]  333 	push	bc
   4DA6 21 30 4E      [10]  334 	ld	hl,#___str_3
   4DA9 E5            [11]  335 	push	hl
   4DAA CD 14 53      [17]  336 	call	_cpct_drawStringM0
   4DAD 21 06 00      [10]  337 	ld	hl,#6
   4DB0 39            [11]  338 	add	hl,sp
   4DB1 F9            [ 6]  339 	ld	sp,hl
                            340 ;src/menu/menu.c:66: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 100); // centrado en horizontal y abajo en vertical
   4DB2 21 0A 64      [10]  341 	ld	hl,#0x640A
   4DB5 E5            [11]  342 	push	hl
   4DB6 21 00 C0      [10]  343 	ld	hl,#0xC000
   4DB9 E5            [11]  344 	push	hl
   4DBA CD FB 5E      [17]  345 	call	_cpct_getScreenPtr
   4DBD 4D            [ 4]  346 	ld	c,l
   4DBE 44            [ 4]  347 	ld	b,h
                            348 ;src/menu/menu.c:67: cpct_drawStringM0("Cristina Rivera", memptr, 2, 0);
   4DBF 21 02 00      [10]  349 	ld	hl,#0x0002
   4DC2 E5            [11]  350 	push	hl
   4DC3 C5            [11]  351 	push	bc
   4DC4 21 38 4E      [10]  352 	ld	hl,#___str_4
   4DC7 E5            [11]  353 	push	hl
   4DC8 CD 14 53      [17]  354 	call	_cpct_drawStringM0
   4DCB 21 06 00      [10]  355 	ld	hl,#6
   4DCE 39            [11]  356 	add	hl,sp
   4DCF F9            [ 6]  357 	ld	sp,hl
                            358 ;src/menu/menu.c:69: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // centrado en horizontal y abajo en vertical
   4DD0 21 0E 73      [10]  359 	ld	hl,#0x730E
   4DD3 E5            [11]  360 	push	hl
   4DD4 21 00 C0      [10]  361 	ld	hl,#0xC000
   4DD7 E5            [11]  362 	push	hl
   4DD8 CD FB 5E      [17]  363 	call	_cpct_getScreenPtr
   4DDB 4D            [ 4]  364 	ld	c,l
   4DDC 44            [ 4]  365 	ld	b,h
                            366 ;src/menu/menu.c:70: cpct_drawStringM0("Miguel Sancho", memptr, 2, 0);
   4DDD 21 02 00      [10]  367 	ld	hl,#0x0002
   4DE0 E5            [11]  368 	push	hl
   4DE1 C5            [11]  369 	push	bc
   4DE2 21 48 4E      [10]  370 	ld	hl,#___str_5
   4DE5 E5            [11]  371 	push	hl
   4DE6 CD 14 53      [17]  372 	call	_cpct_drawStringM0
   4DE9 21 06 00      [10]  373 	ld	hl,#6
   4DEC 39            [11]  374 	add	hl,sp
   4DED F9            [ 6]  375 	ld	sp,hl
                            376 ;src/menu/menu.c:72: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 130); // centrado en horizontal y abajo en vertical
   4DEE 21 08 82      [10]  377 	ld	hl,#0x8208
   4DF1 E5            [11]  378 	push	hl
   4DF2 21 00 C0      [10]  379 	ld	hl,#0xC000
   4DF5 E5            [11]  380 	push	hl
   4DF6 CD FB 5E      [17]  381 	call	_cpct_getScreenPtr
   4DF9 4D            [ 4]  382 	ld	c,l
   4DFA 44            [ 4]  383 	ld	b,h
                            384 ;src/menu/menu.c:73: cpct_drawStringM0("Fernando Verdejo", memptr, 2, 0);
   4DFB 21 02 00      [10]  385 	ld	hl,#0x0002
   4DFE E5            [11]  386 	push	hl
   4DFF C5            [11]  387 	push	bc
   4E00 21 56 4E      [10]  388 	ld	hl,#___str_6
   4E03 E5            [11]  389 	push	hl
   4E04 CD 14 53      [17]  390 	call	_cpct_drawStringM0
   4E07 21 06 00      [10]  391 	ld	hl,#6
   4E0A 39            [11]  392 	add	hl,sp
   4E0B F9            [ 6]  393 	ld	sp,hl
                            394 ;src/menu/menu.c:75: do{
   4E0C                     395 00104$:
                            396 ;src/menu/menu.c:76: cpct_scanKeyboard_f();
   4E0C CD 9E 52      [17]  397 	call	_cpct_scanKeyboard_f
                            398 ;src/menu/menu.c:77: if(cpct_isKeyPressed(Key_M)){
   4E0F 21 04 40      [10]  399 	ld	hl,#0x4004
   4E12 CD 92 52      [17]  400 	call	_cpct_isKeyPressed
   4E15 7D            [ 4]  401 	ld	a,l
   4E16 B7            [ 4]  402 	or	a, a
   4E17 28 03         [12]  403 	jr	Z,00105$
                            404 ;src/menu/menu.c:78: menuOpciones();
   4E19 CD 67 4E      [17]  405 	call	_menuOpciones
   4E1C                     406 00105$:
                            407 ;src/menu/menu.c:81: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   4E1C 21 07 10      [10]  408 	ld	hl,#0x1007
   4E1F CD 92 52      [17]  409 	call	_cpct_isKeyPressed
   4E22 7D            [ 4]  410 	ld	a,l
   4E23 B7            [ 4]  411 	or	a, a
   4E24 C0            [11]  412 	ret	NZ
   4E25 21 04 40      [10]  413 	ld	hl,#0x4004
   4E28 CD 92 52      [17]  414 	call	_cpct_isKeyPressed
   4E2B 7D            [ 4]  415 	ld	a,l
   4E2C B7            [ 4]  416 	or	a, a
   4E2D 28 DD         [12]  417 	jr	Z,00104$
   4E2F C9            [10]  418 	ret
   4E30                     419 ___str_3:
   4E30 43 52 45 44 49 54   420 	.ascii "CREDITS"
        53
   4E37 00                  421 	.db 0x00
   4E38                     422 ___str_4:
   4E38 43 72 69 73 74 69   423 	.ascii "Cristina Rivera"
        6E 61 20 52 69 76
        65 72 61
   4E47 00                  424 	.db 0x00
   4E48                     425 ___str_5:
   4E48 4D 69 67 75 65 6C   426 	.ascii "Miguel Sancho"
        20 53 61 6E 63 68
        6F
   4E55 00                  427 	.db 0x00
   4E56                     428 ___str_6:
   4E56 46 65 72 6E 61 6E   429 	.ascii "Fernando Verdejo"
        64 6F 20 56 65 72
        64 65 6A 6F
   4E66 00                  430 	.db 0x00
                            431 ;src/menu/menu.c:85: void menuOpciones(){ // TODO TODO
                            432 ;	---------------------------------
                            433 ; Function menuOpciones
                            434 ; ---------------------------------
   4E67                     435 _menuOpciones::
                            436 ;src/menu/menu.c:87: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4E67 21 50 82      [10]  437 	ld	hl,#0x8250
   4E6A E5            [11]  438 	push	hl
   4E6B 21 00 1E      [10]  439 	ld	hl,#0x1E00
   4E6E E5            [11]  440 	push	hl
   4E6F CD E5 4B      [17]  441 	call	_borrarPantalla
   4E72 F1            [10]  442 	pop	af
                            443 ;src/menu/menu.c:90: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 100); // centrado en horizontal y abajo en vertical
   4E73 21 20 64      [10]  444 	ld	hl, #0x6420
   4E76 E3            [19]  445 	ex	(sp),hl
   4E77 21 00 C0      [10]  446 	ld	hl,#0xC000
   4E7A E5            [11]  447 	push	hl
   4E7B CD FB 5E      [17]  448 	call	_cpct_getScreenPtr
   4E7E 4D            [ 4]  449 	ld	c,l
   4E7F 44            [ 4]  450 	ld	b,h
                            451 ;src/menu/menu.c:91: cpct_drawStringM0("MENU", memptr, 2, 0);
   4E80 21 02 00      [10]  452 	ld	hl,#0x0002
   4E83 E5            [11]  453 	push	hl
   4E84 C5            [11]  454 	push	bc
   4E85 21 08 4F      [10]  455 	ld	hl,#___str_7
   4E88 E5            [11]  456 	push	hl
   4E89 CD 14 53      [17]  457 	call	_cpct_drawStringM0
   4E8C 21 06 00      [10]  458 	ld	hl,#6
   4E8F 39            [11]  459 	add	hl,sp
   4E90 F9            [ 6]  460 	ld	sp,hl
                            461 ;src/menu/menu.c:93: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 130); // centrado en horizontal y abajo en vertical
   4E91 21 00 82      [10]  462 	ld	hl,#0x8200
   4E94 E5            [11]  463 	push	hl
   4E95 26 C0         [ 7]  464 	ld	h, #0xC0
   4E97 E5            [11]  465 	push	hl
   4E98 CD FB 5E      [17]  466 	call	_cpct_getScreenPtr
   4E9B 4D            [ 4]  467 	ld	c,l
   4E9C 44            [ 4]  468 	ld	b,h
                            469 ;src/menu/menu.c:94: cpct_drawStringM0("INSTRUCTIONS PRESS I", memptr, 2, 0);
   4E9D 21 02 00      [10]  470 	ld	hl,#0x0002
   4EA0 E5            [11]  471 	push	hl
   4EA1 C5            [11]  472 	push	bc
   4EA2 21 0D 4F      [10]  473 	ld	hl,#___str_8
   4EA5 E5            [11]  474 	push	hl
   4EA6 CD 14 53      [17]  475 	call	_cpct_drawStringM0
   4EA9 21 06 00      [10]  476 	ld	hl,#6
   4EAC 39            [11]  477 	add	hl,sp
   4EAD F9            [ 6]  478 	ld	sp,hl
                            479 ;src/menu/menu.c:96: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 145); // centrado en horizontal y abajo en vertical
   4EAE 21 0A 91      [10]  480 	ld	hl,#0x910A
   4EB1 E5            [11]  481 	push	hl
   4EB2 21 00 C0      [10]  482 	ld	hl,#0xC000
   4EB5 E5            [11]  483 	push	hl
   4EB6 CD FB 5E      [17]  484 	call	_cpct_getScreenPtr
   4EB9 4D            [ 4]  485 	ld	c,l
   4EBA 44            [ 4]  486 	ld	b,h
                            487 ;src/menu/menu.c:97: cpct_drawStringM0("CREDITS PRESS C", memptr, 2, 0);
   4EBB 21 02 00      [10]  488 	ld	hl,#0x0002
   4EBE E5            [11]  489 	push	hl
   4EBF C5            [11]  490 	push	bc
   4EC0 21 22 4F      [10]  491 	ld	hl,#___str_9
   4EC3 E5            [11]  492 	push	hl
   4EC4 CD 14 53      [17]  493 	call	_cpct_drawStringM0
   4EC7 21 06 00      [10]  494 	ld	hl,#6
   4ECA 39            [11]  495 	add	hl,sp
   4ECB F9            [ 6]  496 	ld	sp,hl
                            497 ;src/menu/menu.c:99: do{
   4ECC                     498 00108$:
                            499 ;src/menu/menu.c:100: cpct_scanKeyboard_f();
   4ECC CD 9E 52      [17]  500 	call	_cpct_scanKeyboard_f
                            501 ;src/menu/menu.c:105: if(cpct_isKeyPressed(Key_I)){
   4ECF 21 04 08      [10]  502 	ld	hl,#0x0804
   4ED2 CD 92 52      [17]  503 	call	_cpct_isKeyPressed
   4ED5 7D            [ 4]  504 	ld	a,l
   4ED6 B7            [ 4]  505 	or	a, a
   4ED7 28 05         [12]  506 	jr	Z,00104$
                            507 ;src/menu/menu.c:106: menuInstrucciones();
   4ED9 CD 71 4C      [17]  508 	call	_menuInstrucciones
   4EDC 18 0D         [12]  509 	jr	00109$
   4EDE                     510 00104$:
                            511 ;src/menu/menu.c:110: else if(cpct_isKeyPressed(Key_C)){
   4EDE 21 07 40      [10]  512 	ld	hl,#0x4007
   4EE1 CD 92 52      [17]  513 	call	_cpct_isKeyPressed
   4EE4 7D            [ 4]  514 	ld	a,l
   4EE5 B7            [ 4]  515 	or	a, a
   4EE6 28 03         [12]  516 	jr	Z,00109$
                            517 ;src/menu/menu.c:111: menuCreditos();
   4EE8 CD 88 4D      [17]  518 	call	_menuCreditos
   4EEB                     519 00109$:
                            520 ;src/menu/menu.c:119: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_I) && !cpct_isKeyPressed(Key_C));
   4EEB 21 07 10      [10]  521 	ld	hl,#0x1007
   4EEE CD 92 52      [17]  522 	call	_cpct_isKeyPressed
   4EF1 7D            [ 4]  523 	ld	a,l
   4EF2 B7            [ 4]  524 	or	a, a
   4EF3 C0            [11]  525 	ret	NZ
   4EF4 21 04 08      [10]  526 	ld	hl,#0x0804
   4EF7 CD 92 52      [17]  527 	call	_cpct_isKeyPressed
   4EFA 7D            [ 4]  528 	ld	a,l
   4EFB B7            [ 4]  529 	or	a, a
   4EFC C0            [11]  530 	ret	NZ
   4EFD 21 07 40      [10]  531 	ld	hl,#0x4007
   4F00 CD 92 52      [17]  532 	call	_cpct_isKeyPressed
   4F03 7D            [ 4]  533 	ld	a,l
   4F04 B7            [ 4]  534 	or	a, a
   4F05 28 C5         [12]  535 	jr	Z,00108$
   4F07 C9            [10]  536 	ret
   4F08                     537 ___str_7:
   4F08 4D 45 4E 55         538 	.ascii "MENU"
   4F0C 00                  539 	.db 0x00
   4F0D                     540 ___str_8:
   4F0D 49 4E 53 54 52 55   541 	.ascii "INSTRUCTIONS PRESS I"
        43 54 49 4F 4E 53
        20 50 52 45 53 53
        20 49
   4F21 00                  542 	.db 0x00
   4F22                     543 ___str_9:
   4F22 43 52 45 44 49 54   544 	.ascii "CREDITS PRESS C"
        53 20 50 52 45 53
        53 20 43
   4F31 00                  545 	.db 0x00
                            546 ;src/menu/menu.c:122: void menuInicio() {
                            547 ;	---------------------------------
                            548 ; Function menuInicio
                            549 ; ---------------------------------
   4F32                     550 _menuInicio::
                            551 ;src/menu/menu.c:125: cpct_clearScreen(0);
   4F32 21 00 40      [10]  552 	ld	hl,#0x4000
   4F35 E5            [11]  553 	push	hl
   4F36 AF            [ 4]  554 	xor	a, a
   4F37 F5            [11]  555 	push	af
   4F38 33            [ 6]  556 	inc	sp
   4F39 26 C0         [ 7]  557 	ld	h, #0xC0
   4F3B E5            [11]  558 	push	hl
   4F3C CD DA 55      [17]  559 	call	_cpct_memset
                            560 ;src/menu/menu.c:127: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   4F3F 21 1A 0F      [10]  561 	ld	hl,#0x0F1A
   4F42 E5            [11]  562 	push	hl
   4F43 21 00 C0      [10]  563 	ld	hl,#0xC000
   4F46 E5            [11]  564 	push	hl
   4F47 CD FB 5E      [17]  565 	call	_cpct_getScreenPtr
   4F4A 4D            [ 4]  566 	ld	c,l
   4F4B 44            [ 4]  567 	ld	b,h
                            568 ;src/menu/menu.c:128: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   4F4C 21 04 00      [10]  569 	ld	hl,#0x0004
   4F4F E5            [11]  570 	push	hl
   4F50 C5            [11]  571 	push	bc
   4F51 21 E8 4F      [10]  572 	ld	hl,#___str_10
   4F54 E5            [11]  573 	push	hl
   4F55 CD 14 53      [17]  574 	call	_cpct_drawStringM0
   4F58 21 06 00      [10]  575 	ld	hl,#6
   4F5B 39            [11]  576 	add	hl,sp
   4F5C F9            [ 6]  577 	ld	sp,hl
                            578 ;src/menu/menu.c:130: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   4F5D 21 28 6E      [10]  579 	ld	hl,#0x6E28
   4F60 E5            [11]  580 	push	hl
   4F61 21 F0 F0      [10]  581 	ld	hl,#0xF0F0
   4F64 E5            [11]  582 	push	hl
   4F65 21 C8 19      [10]  583 	ld	hl,#_g_text_0
   4F68 E5            [11]  584 	push	hl
   4F69 CD 38 53      [17]  585 	call	_cpct_drawSprite
                            586 ;src/menu/menu.c:131: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   4F6C 21 28 6E      [10]  587 	ld	hl,#0x6E28
   4F6F E5            [11]  588 	push	hl
   4F70 21 18 F1      [10]  589 	ld	hl,#0xF118
   4F73 E5            [11]  590 	push	hl
   4F74 21 F8 2A      [10]  591 	ld	hl,#_g_text_1
   4F77 E5            [11]  592 	push	hl
   4F78 CD 38 53      [17]  593 	call	_cpct_drawSprite
                            594 ;src/menu/menu.c:133: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   4F7B 21 08 A0      [10]  595 	ld	hl,#0xA008
   4F7E E5            [11]  596 	push	hl
   4F7F 21 00 C0      [10]  597 	ld	hl,#0xC000
   4F82 E5            [11]  598 	push	hl
   4F83 CD FB 5E      [17]  599 	call	_cpct_getScreenPtr
   4F86 4D            [ 4]  600 	ld	c,l
   4F87 44            [ 4]  601 	ld	b,h
                            602 ;src/menu/menu.c:134: cpct_drawStringM0("TO START PRESS S", memptr, 2, 0);
   4F88 21 02 00      [10]  603 	ld	hl,#0x0002
   4F8B E5            [11]  604 	push	hl
   4F8C C5            [11]  605 	push	bc
   4F8D 21 F0 4F      [10]  606 	ld	hl,#___str_11
   4F90 E5            [11]  607 	push	hl
   4F91 CD 14 53      [17]  608 	call	_cpct_drawStringM0
   4F94 21 06 00      [10]  609 	ld	hl,#6
   4F97 39            [11]  610 	add	hl,sp
   4F98 F9            [ 6]  611 	ld	sp,hl
                            612 ;src/menu/menu.c:136: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 175); // centrado en horizontal y abajo en vertical
   4F99 21 0A AF      [10]  613 	ld	hl,#0xAF0A
   4F9C E5            [11]  614 	push	hl
   4F9D 21 00 C0      [10]  615 	ld	hl,#0xC000
   4FA0 E5            [11]  616 	push	hl
   4FA1 CD FB 5E      [17]  617 	call	_cpct_getScreenPtr
   4FA4 4D            [ 4]  618 	ld	c,l
   4FA5 44            [ 4]  619 	ld	b,h
                            620 ;src/menu/menu.c:137: cpct_drawStringM0("TO MENU PRESS M", memptr, 2, 0);
   4FA6 21 02 00      [10]  621 	ld	hl,#0x0002
   4FA9 E5            [11]  622 	push	hl
   4FAA C5            [11]  623 	push	bc
   4FAB 21 01 50      [10]  624 	ld	hl,#___str_12
   4FAE E5            [11]  625 	push	hl
   4FAF CD 14 53      [17]  626 	call	_cpct_drawStringM0
   4FB2 21 06 00      [10]  627 	ld	hl,#6
   4FB5 39            [11]  628 	add	hl,sp
   4FB6 F9            [ 6]  629 	ld	sp,hl
                            630 ;src/menu/menu.c:140: do{
   4FB7                     631 00107$:
                            632 ;src/menu/menu.c:141: cpct_scanKeyboard_f();
   4FB7 CD 9E 52      [17]  633 	call	_cpct_scanKeyboard_f
                            634 ;src/menu/menu.c:145: if(cpct_isKeyPressed(Key_M)){
   4FBA 21 04 40      [10]  635 	ld	hl,#0x4004
   4FBD CD 92 52      [17]  636 	call	_cpct_isKeyPressed
   4FC0 7D            [ 4]  637 	ld	a,l
   4FC1 B7            [ 4]  638 	or	a, a
   4FC2 28 10         [12]  639 	jr	Z,00108$
                            640 ;src/menu/menu.c:146: cpct_scanKeyboard_f();
   4FC4 CD 9E 52      [17]  641 	call	_cpct_scanKeyboard_f
                            642 ;src/menu/menu.c:147: do{
   4FC7                     643 00101$:
                            644 ;src/menu/menu.c:148: menuOpciones();
   4FC7 CD 67 4E      [17]  645 	call	_menuOpciones
                            646 ;src/menu/menu.c:150: } while(!cpct_isKeyPressed(Key_S));
   4FCA 21 07 10      [10]  647 	ld	hl,#0x1007
   4FCD CD 92 52      [17]  648 	call	_cpct_isKeyPressed
   4FD0 7D            [ 4]  649 	ld	a,l
   4FD1 B7            [ 4]  650 	or	a, a
   4FD2 28 F3         [12]  651 	jr	Z,00101$
   4FD4                     652 00108$:
                            653 ;src/menu/menu.c:152: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   4FD4 21 07 10      [10]  654 	ld	hl,#0x1007
   4FD7 CD 92 52      [17]  655 	call	_cpct_isKeyPressed
   4FDA 7D            [ 4]  656 	ld	a,l
   4FDB B7            [ 4]  657 	or	a, a
   4FDC C0            [11]  658 	ret	NZ
   4FDD 21 04 40      [10]  659 	ld	hl,#0x4004
   4FE0 CD 92 52      [17]  660 	call	_cpct_isKeyPressed
   4FE3 7D            [ 4]  661 	ld	a,l
   4FE4 B7            [ 4]  662 	or	a, a
   4FE5 28 D0         [12]  663 	jr	Z,00107$
   4FE7 C9            [10]  664 	ret
   4FE8                     665 ___str_10:
   4FE8 52 4F 42 4F 42 49   666 	.ascii "ROBOBIT"
        54
   4FEF 00                  667 	.db 0x00
   4FF0                     668 ___str_11:
   4FF0 54 4F 20 53 54 41   669 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   5000 00                  670 	.db 0x00
   5001                     671 ___str_12:
   5001 54 4F 20 4D 45 4E   672 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   5010 00                  673 	.db 0x00
                            674 	.area _CODE
                            675 	.area _INITIALIZER
                            676 	.area _CABS (ABS)
