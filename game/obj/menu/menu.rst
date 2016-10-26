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
                             54 ;src/menu/menu.c:26: void borrarPantalla(u8 x, u8 y, u8 ancho, u8 alto){
                             55 ;	---------------------------------
                             56 ; Function borrarPantalla
                             57 ; ---------------------------------
   4BF5                      58 _borrarPantalla::
   4BF5 DD E5         [15]   59 	push	ix
   4BF7 DD 21 00 00   [14]   60 	ld	ix,#0
   4BFB DD 39         [15]   61 	add	ix,sp
                             62 ;src/menu/menu.c:28: if (ancho <= 40){
   4BFD 3E 28         [ 7]   63 	ld	a,#0x28
   4BFF DD 96 06      [19]   64 	sub	a, 6 (ix)
   4C02 3E 00         [ 7]   65 	ld	a,#0x00
   4C04 17            [ 4]   66 	rla
   4C05 4F            [ 4]   67 	ld	c,a
   4C06 CB 41         [ 8]   68 	bit	0,c
   4C08 20 23         [12]   69 	jr	NZ,00104$
                             70 ;src/menu/menu.c:29: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar
   4C0A DD 66 05      [19]   71 	ld	h,5 (ix)
   4C0D DD 6E 04      [19]   72 	ld	l,4 (ix)
   4C10 E5            [11]   73 	push	hl
   4C11 21 00 C0      [10]   74 	ld	hl,#0xC000
   4C14 E5            [11]   75 	push	hl
   4C15 CD 0B 5F      [17]   76 	call	_cpct_getScreenPtr
   4C18 4D            [ 4]   77 	ld	c,l
   4C19 44            [ 4]   78 	ld	b,h
                             79 ;src/menu/menu.c:30: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra
   4C1A DD 66 07      [19]   80 	ld	h,7 (ix)
   4C1D DD 6E 06      [19]   81 	ld	l,6 (ix)
   4C20 E5            [11]   82 	push	hl
   4C21 AF            [ 4]   83 	xor	a, a
   4C22 F5            [11]   84 	push	af
   4C23 33            [ 6]   85 	inc	sp
   4C24 C5            [11]   86 	push	bc
   4C25 CD 31 5E      [17]   87 	call	_cpct_drawSolidBox
   4C28 F1            [10]   88 	pop	af
   4C29 F1            [10]   89 	pop	af
   4C2A 33            [ 6]   90 	inc	sp
   4C2B 18 51         [12]   91 	jr	00106$
   4C2D                      92 00104$:
                             93 ;src/menu/menu.c:32: else if (ancho > 40){
   4C2D CB 41         [ 8]   94 	bit	0,c
   4C2F 28 4D         [12]   95 	jr	Z,00106$
                             96 ;src/menu/menu.c:34: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   4C31 DD 66 05      [19]   97 	ld	h,5 (ix)
   4C34 DD 6E 04      [19]   98 	ld	l,4 (ix)
   4C37 E5            [11]   99 	push	hl
   4C38 21 00 C0      [10]  100 	ld	hl,#0xC000
   4C3B E5            [11]  101 	push	hl
   4C3C CD 0B 5F      [17]  102 	call	_cpct_getScreenPtr
   4C3F 4D            [ 4]  103 	ld	c,l
   4C40 44            [ 4]  104 	ld	b,h
                            105 ;src/menu/menu.c:35: cpct_drawSolidBox(memptr, 0, 40, alto);  //borra la mitad derecha
   4C41 DD 7E 07      [19]  106 	ld	a,7 (ix)
   4C44 F5            [11]  107 	push	af
   4C45 33            [ 6]  108 	inc	sp
   4C46 21 00 28      [10]  109 	ld	hl,#0x2800
   4C49 E5            [11]  110 	push	hl
   4C4A C5            [11]  111 	push	bc
   4C4B CD 31 5E      [17]  112 	call	_cpct_drawSolidBox
   4C4E F1            [10]  113 	pop	af
   4C4F F1            [10]  114 	pop	af
   4C50 33            [ 6]  115 	inc	sp
                            116 ;src/menu/menu.c:36: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   4C51 DD 7E 04      [19]  117 	ld	a,4 (ix)
   4C54 C6 28         [ 7]  118 	add	a, #0x28
   4C56 47            [ 4]  119 	ld	b,a
   4C57 DD 7E 05      [19]  120 	ld	a,5 (ix)
   4C5A F5            [11]  121 	push	af
   4C5B 33            [ 6]  122 	inc	sp
   4C5C C5            [11]  123 	push	bc
   4C5D 33            [ 6]  124 	inc	sp
   4C5E 21 00 C0      [10]  125 	ld	hl,#0xC000
   4C61 E5            [11]  126 	push	hl
   4C62 CD 0B 5F      [17]  127 	call	_cpct_getScreenPtr
   4C65 4D            [ 4]  128 	ld	c,l
   4C66 44            [ 4]  129 	ld	b,h
                            130 ;src/menu/menu.c:37: cpct_drawSolidBox(memptr, 0, ancho-40, alto);  //borra la mitad izquierda
   4C67 DD 7E 06      [19]  131 	ld	a,6 (ix)
   4C6A C6 D8         [ 7]  132 	add	a,#0xD8
   4C6C 57            [ 4]  133 	ld	d,a
   4C6D DD 7E 07      [19]  134 	ld	a,7 (ix)
   4C70 F5            [11]  135 	push	af
   4C71 33            [ 6]  136 	inc	sp
   4C72 D5            [11]  137 	push	de
   4C73 33            [ 6]  138 	inc	sp
   4C74 AF            [ 4]  139 	xor	a, a
   4C75 F5            [11]  140 	push	af
   4C76 33            [ 6]  141 	inc	sp
   4C77 C5            [11]  142 	push	bc
   4C78 CD 31 5E      [17]  143 	call	_cpct_drawSolidBox
   4C7B F1            [10]  144 	pop	af
   4C7C F1            [10]  145 	pop	af
   4C7D 33            [ 6]  146 	inc	sp
   4C7E                     147 00106$:
   4C7E DD E1         [14]  148 	pop	ix
   4C80 C9            [10]  149 	ret
                            150 ;src/menu/menu.c:41: void menuInstrucciones(){ // TODO TODO
                            151 ;	---------------------------------
                            152 ; Function menuInstrucciones
                            153 ; ---------------------------------
   4C81                     154 _menuInstrucciones::
                            155 ;src/menu/menu.c:43: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4C81 21 50 82      [10]  156 	ld	hl,#0x8250
   4C84 E5            [11]  157 	push	hl
   4C85 21 00 1E      [10]  158 	ld	hl,#0x1E00
   4C88 E5            [11]  159 	push	hl
   4C89 CD F5 4B      [17]  160 	call	_borrarPantalla
   4C8C F1            [10]  161 	pop	af
                            162 ;src/menu/menu.c:46: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 16, 85); // centrado en horizontal y abajo en vertical
   4C8D 21 10 55      [10]  163 	ld	hl, #0x5510
   4C90 E3            [19]  164 	ex	(sp),hl
   4C91 21 00 C0      [10]  165 	ld	hl,#0xC000
   4C94 E5            [11]  166 	push	hl
   4C95 CD 0B 5F      [17]  167 	call	_cpct_getScreenPtr
   4C98 4D            [ 4]  168 	ld	c,l
   4C99 44            [ 4]  169 	ld	b,h
                            170 ;src/menu/menu.c:47: cpct_drawStringM0("INSTRUCTIONS", memptr, 2, 0);
   4C9A 21 02 00      [10]  171 	ld	hl,#0x0002
   4C9D E5            [11]  172 	push	hl
   4C9E C5            [11]  173 	push	bc
   4C9F 21 6F 4D      [10]  174 	ld	hl,#___str_0
   4CA2 E5            [11]  175 	push	hl
   4CA3 CD 24 53      [17]  176 	call	_cpct_drawStringM0
   4CA6 21 06 00      [10]  177 	ld	hl,#6
   4CA9 39            [11]  178 	add	hl,sp
   4CAA F9            [ 6]  179 	ld	sp,hl
                            180 ;src/menu/menu.c:50: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 115); // dibuja 5 corazones
   4CAB 21 04 73      [10]  181 	ld	hl,#0x7304
   4CAE E5            [11]  182 	push	hl
   4CAF 21 00 C0      [10]  183 	ld	hl,#0xC000
   4CB2 E5            [11]  184 	push	hl
   4CB3 CD 0B 5F      [17]  185 	call	_cpct_getScreenPtr
   4CB6 4D            [ 4]  186 	ld	c,l
   4CB7 44            [ 4]  187 	ld	b,h
                            188 ;src/menu/menu.c:51: cpct_drawSprite (g_arrows_0, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4CB8 21 05 0A      [10]  189 	ld	hl,#0x0A05
   4CBB E5            [11]  190 	push	hl
   4CBC C5            [11]  191 	push	bc
   4CBD 21 A8 18      [10]  192 	ld	hl,#_g_arrows_0
   4CC0 E5            [11]  193 	push	hl
   4CC1 CD 48 53      [17]  194 	call	_cpct_drawSprite
                            195 ;src/menu/menu.c:53: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // dibuja 5 corazones
   4CC4 21 0E 73      [10]  196 	ld	hl,#0x730E
   4CC7 E5            [11]  197 	push	hl
   4CC8 21 00 C0      [10]  198 	ld	hl,#0xC000
   4CCB E5            [11]  199 	push	hl
   4CCC CD 0B 5F      [17]  200 	call	_cpct_getScreenPtr
   4CCF 4D            [ 4]  201 	ld	c,l
   4CD0 44            [ 4]  202 	ld	b,h
                            203 ;src/menu/menu.c:54: cpct_drawSprite (g_arrows_1, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4CD1 21 05 0A      [10]  204 	ld	hl,#0x0A05
   4CD4 E5            [11]  205 	push	hl
   4CD5 C5            [11]  206 	push	bc
   4CD6 21 DA 18      [10]  207 	ld	hl,#_g_arrows_1
   4CD9 E5            [11]  208 	push	hl
   4CDA CD 48 53      [17]  209 	call	_cpct_drawSprite
                            210 ;src/menu/menu.c:56: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 115); // dibuja 5 corazones
   4CDD 21 18 73      [10]  211 	ld	hl,#0x7318
   4CE0 E5            [11]  212 	push	hl
   4CE1 21 00 C0      [10]  213 	ld	hl,#0xC000
   4CE4 E5            [11]  214 	push	hl
   4CE5 CD 0B 5F      [17]  215 	call	_cpct_getScreenPtr
   4CE8 4D            [ 4]  216 	ld	c,l
   4CE9 44            [ 4]  217 	ld	b,h
                            218 ;src/menu/menu.c:57: cpct_drawSprite (g_arrows_2, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4CEA 21 05 0A      [10]  219 	ld	hl,#0x0A05
   4CED E5            [11]  220 	push	hl
   4CEE C5            [11]  221 	push	bc
   4CEF 21 0C 19      [10]  222 	ld	hl,#_g_arrows_2
   4CF2 E5            [11]  223 	push	hl
   4CF3 CD 48 53      [17]  224 	call	_cpct_drawSprite
                            225 ;src/menu/menu.c:59: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 34, 115); // dibuja 5 corazones
   4CF6 21 22 73      [10]  226 	ld	hl,#0x7322
   4CF9 E5            [11]  227 	push	hl
   4CFA 21 00 C0      [10]  228 	ld	hl,#0xC000
   4CFD E5            [11]  229 	push	hl
   4CFE CD 0B 5F      [17]  230 	call	_cpct_getScreenPtr
   4D01 4D            [ 4]  231 	ld	c,l
   4D02 44            [ 4]  232 	ld	b,h
                            233 ;src/menu/menu.c:60: cpct_drawSprite (g_arrows_3, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   4D03 21 05 0A      [10]  234 	ld	hl,#0x0A05
   4D06 E5            [11]  235 	push	hl
   4D07 C5            [11]  236 	push	bc
   4D08 21 3E 19      [10]  237 	ld	hl,#_g_arrows_3
   4D0B E5            [11]  238 	push	hl
   4D0C CD 48 53      [17]  239 	call	_cpct_drawSprite
                            240 ;src/menu/menu.c:62: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 115); // centrado en horizontal y abajo en vertical
   4D0F 21 2D 73      [10]  241 	ld	hl,#0x732D
   4D12 E5            [11]  242 	push	hl
   4D13 21 00 C0      [10]  243 	ld	hl,#0xC000
   4D16 E5            [11]  244 	push	hl
   4D17 CD 0B 5F      [17]  245 	call	_cpct_getScreenPtr
   4D1A 4D            [ 4]  246 	ld	c,l
   4D1B 44            [ 4]  247 	ld	b,h
                            248 ;src/menu/menu.c:63: cpct_drawStringM0(" TO MOVE", memptr, 2, 0);
   4D1C 21 02 00      [10]  249 	ld	hl,#0x0002
   4D1F E5            [11]  250 	push	hl
   4D20 C5            [11]  251 	push	bc
   4D21 21 7C 4D      [10]  252 	ld	hl,#___str_1
   4D24 E5            [11]  253 	push	hl
   4D25 CD 24 53      [17]  254 	call	_cpct_drawStringM0
   4D28 21 06 00      [10]  255 	ld	hl,#6
   4D2B 39            [11]  256 	add	hl,sp
   4D2C F9            [ 6]  257 	ld	sp,hl
                            258 ;src/menu/menu.c:65: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 130); // centrado en horizontal y abajo en vertical
   4D2D 21 04 82      [10]  259 	ld	hl,#0x8204
   4D30 E5            [11]  260 	push	hl
   4D31 21 00 C0      [10]  261 	ld	hl,#0xC000
   4D34 E5            [11]  262 	push	hl
   4D35 CD 0B 5F      [17]  263 	call	_cpct_getScreenPtr
   4D38 4D            [ 4]  264 	ld	c,l
   4D39 44            [ 4]  265 	ld	b,h
                            266 ;src/menu/menu.c:66: cpct_drawStringM0("SPACE BAR TO SHOOT", memptr, 2, 0);
   4D3A 21 02 00      [10]  267 	ld	hl,#0x0002
   4D3D E5            [11]  268 	push	hl
   4D3E C5            [11]  269 	push	bc
   4D3F 21 85 4D      [10]  270 	ld	hl,#___str_2
   4D42 E5            [11]  271 	push	hl
   4D43 CD 24 53      [17]  272 	call	_cpct_drawStringM0
   4D46 21 06 00      [10]  273 	ld	hl,#6
   4D49 39            [11]  274 	add	hl,sp
   4D4A F9            [ 6]  275 	ld	sp,hl
                            276 ;src/menu/menu.c:68: do{
   4D4B                     277 00104$:
                            278 ;src/menu/menu.c:69: cpct_scanKeyboard_f();
   4D4B CD AE 52      [17]  279 	call	_cpct_scanKeyboard_f
                            280 ;src/menu/menu.c:70: if(cpct_isKeyPressed(Key_M)){
   4D4E 21 04 40      [10]  281 	ld	hl,#0x4004
   4D51 CD A2 52      [17]  282 	call	_cpct_isKeyPressed
   4D54 7D            [ 4]  283 	ld	a,l
   4D55 B7            [ 4]  284 	or	a, a
   4D56 28 03         [12]  285 	jr	Z,00105$
                            286 ;src/menu/menu.c:71: menuOpciones();
   4D58 CD 77 4E      [17]  287 	call	_menuOpciones
   4D5B                     288 00105$:
                            289 ;src/menu/menu.c:74: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   4D5B 21 07 10      [10]  290 	ld	hl,#0x1007
   4D5E CD A2 52      [17]  291 	call	_cpct_isKeyPressed
   4D61 7D            [ 4]  292 	ld	a,l
   4D62 B7            [ 4]  293 	or	a, a
   4D63 C0            [11]  294 	ret	NZ
   4D64 21 04 40      [10]  295 	ld	hl,#0x4004
   4D67 CD A2 52      [17]  296 	call	_cpct_isKeyPressed
   4D6A 7D            [ 4]  297 	ld	a,l
   4D6B B7            [ 4]  298 	or	a, a
   4D6C 28 DD         [12]  299 	jr	Z,00104$
   4D6E C9            [10]  300 	ret
   4D6F                     301 ___str_0:
   4D6F 49 4E 53 54 52 55   302 	.ascii "INSTRUCTIONS"
        43 54 49 4F 4E 53
   4D7B 00                  303 	.db 0x00
   4D7C                     304 ___str_1:
   4D7C 20 54 4F 20 4D 4F   305 	.ascii " TO MOVE"
        56 45
   4D84 00                  306 	.db 0x00
   4D85                     307 ___str_2:
   4D85 53 50 41 43 45 20   308 	.ascii "SPACE BAR TO SHOOT"
        42 41 52 20 54 4F
        20 53 48 4F 4F 54
   4D97 00                  309 	.db 0x00
                            310 ;src/menu/menu.c:77: void menuCreditos(){ // TODO TODO
                            311 ;	---------------------------------
                            312 ; Function menuCreditos
                            313 ; ---------------------------------
   4D98                     314 _menuCreditos::
                            315 ;src/menu/menu.c:79: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4D98 21 50 82      [10]  316 	ld	hl,#0x8250
   4D9B E5            [11]  317 	push	hl
   4D9C 21 00 1E      [10]  318 	ld	hl,#0x1E00
   4D9F E5            [11]  319 	push	hl
   4DA0 CD F5 4B      [17]  320 	call	_borrarPantalla
   4DA3 F1            [10]  321 	pop	af
                            322 ;src/menu/menu.c:82: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 70); // centrado en horizontal y abajo en vertical
   4DA4 21 1A 46      [10]  323 	ld	hl, #0x461A
   4DA7 E3            [19]  324 	ex	(sp),hl
   4DA8 21 00 C0      [10]  325 	ld	hl,#0xC000
   4DAB E5            [11]  326 	push	hl
   4DAC CD 0B 5F      [17]  327 	call	_cpct_getScreenPtr
   4DAF 4D            [ 4]  328 	ld	c,l
   4DB0 44            [ 4]  329 	ld	b,h
                            330 ;src/menu/menu.c:83: cpct_drawStringM0("CREDITS", memptr, 2, 0);
   4DB1 21 02 00      [10]  331 	ld	hl,#0x0002
   4DB4 E5            [11]  332 	push	hl
   4DB5 C5            [11]  333 	push	bc
   4DB6 21 40 4E      [10]  334 	ld	hl,#___str_3
   4DB9 E5            [11]  335 	push	hl
   4DBA CD 24 53      [17]  336 	call	_cpct_drawStringM0
   4DBD 21 06 00      [10]  337 	ld	hl,#6
   4DC0 39            [11]  338 	add	hl,sp
   4DC1 F9            [ 6]  339 	ld	sp,hl
                            340 ;src/menu/menu.c:85: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 100); // centrado en horizontal y abajo en vertical
   4DC2 21 0A 64      [10]  341 	ld	hl,#0x640A
   4DC5 E5            [11]  342 	push	hl
   4DC6 21 00 C0      [10]  343 	ld	hl,#0xC000
   4DC9 E5            [11]  344 	push	hl
   4DCA CD 0B 5F      [17]  345 	call	_cpct_getScreenPtr
   4DCD 4D            [ 4]  346 	ld	c,l
   4DCE 44            [ 4]  347 	ld	b,h
                            348 ;src/menu/menu.c:86: cpct_drawStringM0("Cristina Rivera", memptr, 2, 0);
   4DCF 21 02 00      [10]  349 	ld	hl,#0x0002
   4DD2 E5            [11]  350 	push	hl
   4DD3 C5            [11]  351 	push	bc
   4DD4 21 48 4E      [10]  352 	ld	hl,#___str_4
   4DD7 E5            [11]  353 	push	hl
   4DD8 CD 24 53      [17]  354 	call	_cpct_drawStringM0
   4DDB 21 06 00      [10]  355 	ld	hl,#6
   4DDE 39            [11]  356 	add	hl,sp
   4DDF F9            [ 6]  357 	ld	sp,hl
                            358 ;src/menu/menu.c:88: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // centrado en horizontal y abajo en vertical
   4DE0 21 0E 73      [10]  359 	ld	hl,#0x730E
   4DE3 E5            [11]  360 	push	hl
   4DE4 21 00 C0      [10]  361 	ld	hl,#0xC000
   4DE7 E5            [11]  362 	push	hl
   4DE8 CD 0B 5F      [17]  363 	call	_cpct_getScreenPtr
   4DEB 4D            [ 4]  364 	ld	c,l
   4DEC 44            [ 4]  365 	ld	b,h
                            366 ;src/menu/menu.c:89: cpct_drawStringM0("Miguel Sancho", memptr, 2, 0);
   4DED 21 02 00      [10]  367 	ld	hl,#0x0002
   4DF0 E5            [11]  368 	push	hl
   4DF1 C5            [11]  369 	push	bc
   4DF2 21 58 4E      [10]  370 	ld	hl,#___str_5
   4DF5 E5            [11]  371 	push	hl
   4DF6 CD 24 53      [17]  372 	call	_cpct_drawStringM0
   4DF9 21 06 00      [10]  373 	ld	hl,#6
   4DFC 39            [11]  374 	add	hl,sp
   4DFD F9            [ 6]  375 	ld	sp,hl
                            376 ;src/menu/menu.c:91: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 130); // centrado en horizontal y abajo en vertical
   4DFE 21 08 82      [10]  377 	ld	hl,#0x8208
   4E01 E5            [11]  378 	push	hl
   4E02 21 00 C0      [10]  379 	ld	hl,#0xC000
   4E05 E5            [11]  380 	push	hl
   4E06 CD 0B 5F      [17]  381 	call	_cpct_getScreenPtr
   4E09 4D            [ 4]  382 	ld	c,l
   4E0A 44            [ 4]  383 	ld	b,h
                            384 ;src/menu/menu.c:92: cpct_drawStringM0("Fernando Verdejo", memptr, 2, 0);
   4E0B 21 02 00      [10]  385 	ld	hl,#0x0002
   4E0E E5            [11]  386 	push	hl
   4E0F C5            [11]  387 	push	bc
   4E10 21 66 4E      [10]  388 	ld	hl,#___str_6
   4E13 E5            [11]  389 	push	hl
   4E14 CD 24 53      [17]  390 	call	_cpct_drawStringM0
   4E17 21 06 00      [10]  391 	ld	hl,#6
   4E1A 39            [11]  392 	add	hl,sp
   4E1B F9            [ 6]  393 	ld	sp,hl
                            394 ;src/menu/menu.c:94: do{
   4E1C                     395 00104$:
                            396 ;src/menu/menu.c:95: cpct_scanKeyboard_f();
   4E1C CD AE 52      [17]  397 	call	_cpct_scanKeyboard_f
                            398 ;src/menu/menu.c:96: if(cpct_isKeyPressed(Key_M)){
   4E1F 21 04 40      [10]  399 	ld	hl,#0x4004
   4E22 CD A2 52      [17]  400 	call	_cpct_isKeyPressed
   4E25 7D            [ 4]  401 	ld	a,l
   4E26 B7            [ 4]  402 	or	a, a
   4E27 28 03         [12]  403 	jr	Z,00105$
                            404 ;src/menu/menu.c:97: menuOpciones();
   4E29 CD 77 4E      [17]  405 	call	_menuOpciones
   4E2C                     406 00105$:
                            407 ;src/menu/menu.c:100: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   4E2C 21 07 10      [10]  408 	ld	hl,#0x1007
   4E2F CD A2 52      [17]  409 	call	_cpct_isKeyPressed
   4E32 7D            [ 4]  410 	ld	a,l
   4E33 B7            [ 4]  411 	or	a, a
   4E34 C0            [11]  412 	ret	NZ
   4E35 21 04 40      [10]  413 	ld	hl,#0x4004
   4E38 CD A2 52      [17]  414 	call	_cpct_isKeyPressed
   4E3B 7D            [ 4]  415 	ld	a,l
   4E3C B7            [ 4]  416 	or	a, a
   4E3D 28 DD         [12]  417 	jr	Z,00104$
   4E3F C9            [10]  418 	ret
   4E40                     419 ___str_3:
   4E40 43 52 45 44 49 54   420 	.ascii "CREDITS"
        53
   4E47 00                  421 	.db 0x00
   4E48                     422 ___str_4:
   4E48 43 72 69 73 74 69   423 	.ascii "Cristina Rivera"
        6E 61 20 52 69 76
        65 72 61
   4E57 00                  424 	.db 0x00
   4E58                     425 ___str_5:
   4E58 4D 69 67 75 65 6C   426 	.ascii "Miguel Sancho"
        20 53 61 6E 63 68
        6F
   4E65 00                  427 	.db 0x00
   4E66                     428 ___str_6:
   4E66 46 65 72 6E 61 6E   429 	.ascii "Fernando Verdejo"
        64 6F 20 56 65 72
        64 65 6A 6F
   4E76 00                  430 	.db 0x00
                            431 ;src/menu/menu.c:104: void menuOpciones(){ // TODO TODO
                            432 ;	---------------------------------
                            433 ; Function menuOpciones
                            434 ; ---------------------------------
   4E77                     435 _menuOpciones::
                            436 ;src/menu/menu.c:106: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   4E77 21 50 82      [10]  437 	ld	hl,#0x8250
   4E7A E5            [11]  438 	push	hl
   4E7B 21 00 1E      [10]  439 	ld	hl,#0x1E00
   4E7E E5            [11]  440 	push	hl
   4E7F CD F5 4B      [17]  441 	call	_borrarPantalla
   4E82 F1            [10]  442 	pop	af
                            443 ;src/menu/menu.c:109: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 100); // centrado en horizontal y abajo en vertical
   4E83 21 20 64      [10]  444 	ld	hl, #0x6420
   4E86 E3            [19]  445 	ex	(sp),hl
   4E87 21 00 C0      [10]  446 	ld	hl,#0xC000
   4E8A E5            [11]  447 	push	hl
   4E8B CD 0B 5F      [17]  448 	call	_cpct_getScreenPtr
   4E8E 4D            [ 4]  449 	ld	c,l
   4E8F 44            [ 4]  450 	ld	b,h
                            451 ;src/menu/menu.c:110: cpct_drawStringM0("MENU", memptr, 2, 0);
   4E90 21 02 00      [10]  452 	ld	hl,#0x0002
   4E93 E5            [11]  453 	push	hl
   4E94 C5            [11]  454 	push	bc
   4E95 21 18 4F      [10]  455 	ld	hl,#___str_7
   4E98 E5            [11]  456 	push	hl
   4E99 CD 24 53      [17]  457 	call	_cpct_drawStringM0
   4E9C 21 06 00      [10]  458 	ld	hl,#6
   4E9F 39            [11]  459 	add	hl,sp
   4EA0 F9            [ 6]  460 	ld	sp,hl
                            461 ;src/menu/menu.c:112: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 130); // centrado en horizontal y abajo en vertical
   4EA1 21 00 82      [10]  462 	ld	hl,#0x8200
   4EA4 E5            [11]  463 	push	hl
   4EA5 26 C0         [ 7]  464 	ld	h, #0xC0
   4EA7 E5            [11]  465 	push	hl
   4EA8 CD 0B 5F      [17]  466 	call	_cpct_getScreenPtr
   4EAB 4D            [ 4]  467 	ld	c,l
   4EAC 44            [ 4]  468 	ld	b,h
                            469 ;src/menu/menu.c:113: cpct_drawStringM0("INSTRUCTIONS PRESS I", memptr, 2, 0);
   4EAD 21 02 00      [10]  470 	ld	hl,#0x0002
   4EB0 E5            [11]  471 	push	hl
   4EB1 C5            [11]  472 	push	bc
   4EB2 21 1D 4F      [10]  473 	ld	hl,#___str_8
   4EB5 E5            [11]  474 	push	hl
   4EB6 CD 24 53      [17]  475 	call	_cpct_drawStringM0
   4EB9 21 06 00      [10]  476 	ld	hl,#6
   4EBC 39            [11]  477 	add	hl,sp
   4EBD F9            [ 6]  478 	ld	sp,hl
                            479 ;src/menu/menu.c:115: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 145); // centrado en horizontal y abajo en vertical
   4EBE 21 0A 91      [10]  480 	ld	hl,#0x910A
   4EC1 E5            [11]  481 	push	hl
   4EC2 21 00 C0      [10]  482 	ld	hl,#0xC000
   4EC5 E5            [11]  483 	push	hl
   4EC6 CD 0B 5F      [17]  484 	call	_cpct_getScreenPtr
   4EC9 4D            [ 4]  485 	ld	c,l
   4ECA 44            [ 4]  486 	ld	b,h
                            487 ;src/menu/menu.c:116: cpct_drawStringM0("CREDITS PRESS C", memptr, 2, 0);
   4ECB 21 02 00      [10]  488 	ld	hl,#0x0002
   4ECE E5            [11]  489 	push	hl
   4ECF C5            [11]  490 	push	bc
   4ED0 21 32 4F      [10]  491 	ld	hl,#___str_9
   4ED3 E5            [11]  492 	push	hl
   4ED4 CD 24 53      [17]  493 	call	_cpct_drawStringM0
   4ED7 21 06 00      [10]  494 	ld	hl,#6
   4EDA 39            [11]  495 	add	hl,sp
   4EDB F9            [ 6]  496 	ld	sp,hl
                            497 ;src/menu/menu.c:118: do{
   4EDC                     498 00108$:
                            499 ;src/menu/menu.c:119: cpct_scanKeyboard_f();
   4EDC CD AE 52      [17]  500 	call	_cpct_scanKeyboard_f
                            501 ;src/menu/menu.c:124: if(cpct_isKeyPressed(Key_I)){
   4EDF 21 04 08      [10]  502 	ld	hl,#0x0804
   4EE2 CD A2 52      [17]  503 	call	_cpct_isKeyPressed
   4EE5 7D            [ 4]  504 	ld	a,l
   4EE6 B7            [ 4]  505 	or	a, a
   4EE7 28 05         [12]  506 	jr	Z,00104$
                            507 ;src/menu/menu.c:125: menuInstrucciones();
   4EE9 CD 81 4C      [17]  508 	call	_menuInstrucciones
   4EEC 18 0D         [12]  509 	jr	00109$
   4EEE                     510 00104$:
                            511 ;src/menu/menu.c:129: else if(cpct_isKeyPressed(Key_C)){
   4EEE 21 07 40      [10]  512 	ld	hl,#0x4007
   4EF1 CD A2 52      [17]  513 	call	_cpct_isKeyPressed
   4EF4 7D            [ 4]  514 	ld	a,l
   4EF5 B7            [ 4]  515 	or	a, a
   4EF6 28 03         [12]  516 	jr	Z,00109$
                            517 ;src/menu/menu.c:130: menuCreditos();
   4EF8 CD 98 4D      [17]  518 	call	_menuCreditos
   4EFB                     519 00109$:
                            520 ;src/menu/menu.c:138: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_I) && !cpct_isKeyPressed(Key_C));
   4EFB 21 07 10      [10]  521 	ld	hl,#0x1007
   4EFE CD A2 52      [17]  522 	call	_cpct_isKeyPressed
   4F01 7D            [ 4]  523 	ld	a,l
   4F02 B7            [ 4]  524 	or	a, a
   4F03 C0            [11]  525 	ret	NZ
   4F04 21 04 08      [10]  526 	ld	hl,#0x0804
   4F07 CD A2 52      [17]  527 	call	_cpct_isKeyPressed
   4F0A 7D            [ 4]  528 	ld	a,l
   4F0B B7            [ 4]  529 	or	a, a
   4F0C C0            [11]  530 	ret	NZ
   4F0D 21 07 40      [10]  531 	ld	hl,#0x4007
   4F10 CD A2 52      [17]  532 	call	_cpct_isKeyPressed
   4F13 7D            [ 4]  533 	ld	a,l
   4F14 B7            [ 4]  534 	or	a, a
   4F15 28 C5         [12]  535 	jr	Z,00108$
   4F17 C9            [10]  536 	ret
   4F18                     537 ___str_7:
   4F18 4D 45 4E 55         538 	.ascii "MENU"
   4F1C 00                  539 	.db 0x00
   4F1D                     540 ___str_8:
   4F1D 49 4E 53 54 52 55   541 	.ascii "INSTRUCTIONS PRESS I"
        43 54 49 4F 4E 53
        20 50 52 45 53 53
        20 49
   4F31 00                  542 	.db 0x00
   4F32                     543 ___str_9:
   4F32 43 52 45 44 49 54   544 	.ascii "CREDITS PRESS C"
        53 20 50 52 45 53
        53 20 43
   4F41 00                  545 	.db 0x00
                            546 ;src/menu/menu.c:141: void menuInicio() {
                            547 ;	---------------------------------
                            548 ; Function menuInicio
                            549 ; ---------------------------------
   4F42                     550 _menuInicio::
                            551 ;src/menu/menu.c:144: cpct_clearScreen(0);
   4F42 21 00 40      [10]  552 	ld	hl,#0x4000
   4F45 E5            [11]  553 	push	hl
   4F46 AF            [ 4]  554 	xor	a, a
   4F47 F5            [11]  555 	push	af
   4F48 33            [ 6]  556 	inc	sp
   4F49 26 C0         [ 7]  557 	ld	h, #0xC0
   4F4B E5            [11]  558 	push	hl
   4F4C CD EA 55      [17]  559 	call	_cpct_memset
                            560 ;src/menu/menu.c:146: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   4F4F 21 1A 0F      [10]  561 	ld	hl,#0x0F1A
   4F52 E5            [11]  562 	push	hl
   4F53 21 00 C0      [10]  563 	ld	hl,#0xC000
   4F56 E5            [11]  564 	push	hl
   4F57 CD 0B 5F      [17]  565 	call	_cpct_getScreenPtr
   4F5A 4D            [ 4]  566 	ld	c,l
   4F5B 44            [ 4]  567 	ld	b,h
                            568 ;src/menu/menu.c:147: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   4F5C 21 04 00      [10]  569 	ld	hl,#0x0004
   4F5F E5            [11]  570 	push	hl
   4F60 C5            [11]  571 	push	bc
   4F61 21 F8 4F      [10]  572 	ld	hl,#___str_10
   4F64 E5            [11]  573 	push	hl
   4F65 CD 24 53      [17]  574 	call	_cpct_drawStringM0
   4F68 21 06 00      [10]  575 	ld	hl,#6
   4F6B 39            [11]  576 	add	hl,sp
   4F6C F9            [ 6]  577 	ld	sp,hl
                            578 ;src/menu/menu.c:149: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   4F6D 21 28 6E      [10]  579 	ld	hl,#0x6E28
   4F70 E5            [11]  580 	push	hl
   4F71 21 F0 F0      [10]  581 	ld	hl,#0xF0F0
   4F74 E5            [11]  582 	push	hl
   4F75 21 C8 19      [10]  583 	ld	hl,#_g_text_0
   4F78 E5            [11]  584 	push	hl
   4F79 CD 48 53      [17]  585 	call	_cpct_drawSprite
                            586 ;src/menu/menu.c:150: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   4F7C 21 28 6E      [10]  587 	ld	hl,#0x6E28
   4F7F E5            [11]  588 	push	hl
   4F80 21 18 F1      [10]  589 	ld	hl,#0xF118
   4F83 E5            [11]  590 	push	hl
   4F84 21 F8 2A      [10]  591 	ld	hl,#_g_text_1
   4F87 E5            [11]  592 	push	hl
   4F88 CD 48 53      [17]  593 	call	_cpct_drawSprite
                            594 ;src/menu/menu.c:152: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   4F8B 21 08 A0      [10]  595 	ld	hl,#0xA008
   4F8E E5            [11]  596 	push	hl
   4F8F 21 00 C0      [10]  597 	ld	hl,#0xC000
   4F92 E5            [11]  598 	push	hl
   4F93 CD 0B 5F      [17]  599 	call	_cpct_getScreenPtr
   4F96 4D            [ 4]  600 	ld	c,l
   4F97 44            [ 4]  601 	ld	b,h
                            602 ;src/menu/menu.c:153: cpct_drawStringM0("TO START PRESS S", memptr, 2, 0);
   4F98 21 02 00      [10]  603 	ld	hl,#0x0002
   4F9B E5            [11]  604 	push	hl
   4F9C C5            [11]  605 	push	bc
   4F9D 21 00 50      [10]  606 	ld	hl,#___str_11
   4FA0 E5            [11]  607 	push	hl
   4FA1 CD 24 53      [17]  608 	call	_cpct_drawStringM0
   4FA4 21 06 00      [10]  609 	ld	hl,#6
   4FA7 39            [11]  610 	add	hl,sp
   4FA8 F9            [ 6]  611 	ld	sp,hl
                            612 ;src/menu/menu.c:155: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 175); // centrado en horizontal y abajo en vertical
   4FA9 21 0A AF      [10]  613 	ld	hl,#0xAF0A
   4FAC E5            [11]  614 	push	hl
   4FAD 21 00 C0      [10]  615 	ld	hl,#0xC000
   4FB0 E5            [11]  616 	push	hl
   4FB1 CD 0B 5F      [17]  617 	call	_cpct_getScreenPtr
   4FB4 4D            [ 4]  618 	ld	c,l
   4FB5 44            [ 4]  619 	ld	b,h
                            620 ;src/menu/menu.c:156: cpct_drawStringM0("TO MENU PRESS M", memptr, 2, 0);
   4FB6 21 02 00      [10]  621 	ld	hl,#0x0002
   4FB9 E5            [11]  622 	push	hl
   4FBA C5            [11]  623 	push	bc
   4FBB 21 11 50      [10]  624 	ld	hl,#___str_12
   4FBE E5            [11]  625 	push	hl
   4FBF CD 24 53      [17]  626 	call	_cpct_drawStringM0
   4FC2 21 06 00      [10]  627 	ld	hl,#6
   4FC5 39            [11]  628 	add	hl,sp
   4FC6 F9            [ 6]  629 	ld	sp,hl
                            630 ;src/menu/menu.c:159: do{
   4FC7                     631 00107$:
                            632 ;src/menu/menu.c:160: cpct_scanKeyboard_f();
   4FC7 CD AE 52      [17]  633 	call	_cpct_scanKeyboard_f
                            634 ;src/menu/menu.c:164: if(cpct_isKeyPressed(Key_M)){
   4FCA 21 04 40      [10]  635 	ld	hl,#0x4004
   4FCD CD A2 52      [17]  636 	call	_cpct_isKeyPressed
   4FD0 7D            [ 4]  637 	ld	a,l
   4FD1 B7            [ 4]  638 	or	a, a
   4FD2 28 10         [12]  639 	jr	Z,00108$
                            640 ;src/menu/menu.c:165: cpct_scanKeyboard_f();
   4FD4 CD AE 52      [17]  641 	call	_cpct_scanKeyboard_f
                            642 ;src/menu/menu.c:166: do{
   4FD7                     643 00101$:
                            644 ;src/menu/menu.c:167: menuOpciones();
   4FD7 CD 77 4E      [17]  645 	call	_menuOpciones
                            646 ;src/menu/menu.c:169: } while(!cpct_isKeyPressed(Key_S));
   4FDA 21 07 10      [10]  647 	ld	hl,#0x1007
   4FDD CD A2 52      [17]  648 	call	_cpct_isKeyPressed
   4FE0 7D            [ 4]  649 	ld	a,l
   4FE1 B7            [ 4]  650 	or	a, a
   4FE2 28 F3         [12]  651 	jr	Z,00101$
   4FE4                     652 00108$:
                            653 ;src/menu/menu.c:171: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   4FE4 21 07 10      [10]  654 	ld	hl,#0x1007
   4FE7 CD A2 52      [17]  655 	call	_cpct_isKeyPressed
   4FEA 7D            [ 4]  656 	ld	a,l
   4FEB B7            [ 4]  657 	or	a, a
   4FEC C0            [11]  658 	ret	NZ
   4FED 21 04 40      [10]  659 	ld	hl,#0x4004
   4FF0 CD A2 52      [17]  660 	call	_cpct_isKeyPressed
   4FF3 7D            [ 4]  661 	ld	a,l
   4FF4 B7            [ 4]  662 	or	a, a
   4FF5 28 D0         [12]  663 	jr	Z,00107$
   4FF7 C9            [10]  664 	ret
   4FF8                     665 ___str_10:
   4FF8 52 4F 42 4F 42 49   666 	.ascii "ROBOBIT"
        54
   4FFF 00                  667 	.db 0x00
   5000                     668 ___str_11:
   5000 54 4F 20 53 54 41   669 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   5010 00                  670 	.db 0x00
   5011                     671 ___str_12:
   5011 54 4F 20 4D 45 4E   672 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   5020 00                  673 	.db 0x00
                            674 	.area _CODE
                            675 	.area _INITIALIZER
                            676 	.area _CABS (ABS)
