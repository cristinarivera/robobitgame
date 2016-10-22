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
                             18 	.globl _menuFin
                             19 	.globl _borrarPantalla
                             20 	.globl _menuInstrucciones
                             21 	.globl _menuCreditos
                             22 	.globl _menuOpciones
                             23 	.globl _menuInicio
                             24 ;--------------------------------------------------------
                             25 ; special function registers
                             26 ;--------------------------------------------------------
                             27 ;--------------------------------------------------------
                             28 ; ram data
                             29 ;--------------------------------------------------------
                             30 	.area _DATA
                             31 ;--------------------------------------------------------
                             32 ; ram data
                             33 ;--------------------------------------------------------
                             34 	.area _INITIALIZED
                             35 ;--------------------------------------------------------
                             36 ; absolute external ram data
                             37 ;--------------------------------------------------------
                             38 	.area _DABS (ABS)
                             39 ;--------------------------------------------------------
                             40 ; global & static initialisations
                             41 ;--------------------------------------------------------
                             42 	.area _HOME
                             43 	.area _GSINIT
                             44 	.area _GSFINAL
                             45 	.area _GSINIT
                             46 ;--------------------------------------------------------
                             47 ; Home
                             48 ;--------------------------------------------------------
                             49 	.area _HOME
                             50 	.area _HOME
                             51 ;--------------------------------------------------------
                             52 ; code
                             53 ;--------------------------------------------------------
                             54 	.area _CODE
                             55 ;src/menu/menu.c:5: void menuFin(){
                             56 ;	---------------------------------
                             57 ; Function menuFin
                             58 ; ---------------------------------
   7C0A                      59 _menuFin::
                             60 ;src/menu/menu.c:8: cpct_clearScreen(0);
   7C0A 21 00 40      [10]   61 	ld	hl,#0x4000
   7C0D E5            [11]   62 	push	hl
   7C0E AF            [ 4]   63 	xor	a, a
   7C0F F5            [11]   64 	push	af
   7C10 33            [ 6]   65 	inc	sp
   7C11 26 C0         [ 7]   66 	ld	h, #0xC0
   7C13 E5            [11]   67 	push	hl
   7C14 CD 51 84      [17]   68 	call	_cpct_memset
                             69 ;src/menu/menu.c:10: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 90); // centrado en horizontal y arriba en vertical
   7C17 21 18 5A      [10]   70 	ld	hl,#0x5A18
   7C1A E5            [11]   71 	push	hl
   7C1B 21 00 C0      [10]   72 	ld	hl,#0xC000
   7C1E E5            [11]   73 	push	hl
   7C1F CD 72 8D      [17]   74 	call	_cpct_getScreenPtr
   7C22 4D            [ 4]   75 	ld	c,l
   7C23 44            [ 4]   76 	ld	b,h
                             77 ;src/menu/menu.c:11: cpct_drawStringM0("GAME OVER", memptr, 2, 0);
   7C24 21 02 00      [10]   78 	ld	hl,#0x0002
   7C27 E5            [11]   79 	push	hl
   7C28 C5            [11]   80 	push	bc
   7C29 21 37 7C      [10]   81 	ld	hl,#___str_0
   7C2C E5            [11]   82 	push	hl
   7C2D CD A2 81      [17]   83 	call	_cpct_drawStringM0
   7C30 21 06 00      [10]   84 	ld	hl,#6
   7C33 39            [11]   85 	add	hl,sp
   7C34 F9            [ 6]   86 	ld	sp,hl
                             87 ;src/menu/menu.c:13: while(1){}
   7C35                      88 00102$:
   7C35 18 FE         [12]   89 	jr	00102$
   7C37                      90 ___str_0:
   7C37 47 41 4D 45 20 4F    91 	.ascii "GAME OVER"
        56 45 52
   7C40 00                   92 	.db 0x00
                             93 ;src/menu/menu.c:16: void borrarPantalla(u8 x, u8 y, u8 ancho, u8 alto){
                             94 ;	---------------------------------
                             95 ; Function borrarPantalla
                             96 ; ---------------------------------
   7C41                      97 _borrarPantalla::
   7C41 DD E5         [15]   98 	push	ix
   7C43 DD 21 00 00   [14]   99 	ld	ix,#0
   7C47 DD 39         [15]  100 	add	ix,sp
                            101 ;src/menu/menu.c:18: if (ancho <= 40){
   7C49 3E 28         [ 7]  102 	ld	a,#0x28
   7C4B DD 96 06      [19]  103 	sub	a, 6 (ix)
   7C4E 3E 00         [ 7]  104 	ld	a,#0x00
   7C50 17            [ 4]  105 	rla
   7C51 4F            [ 4]  106 	ld	c,a
   7C52 CB 41         [ 8]  107 	bit	0,c
   7C54 20 23         [12]  108 	jr	NZ,00104$
                            109 ;src/menu/menu.c:19: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar 
   7C56 DD 66 05      [19]  110 	ld	h,5 (ix)
   7C59 DD 6E 04      [19]  111 	ld	l,4 (ix)
   7C5C E5            [11]  112 	push	hl
   7C5D 21 00 C0      [10]  113 	ld	hl,#0xC000
   7C60 E5            [11]  114 	push	hl
   7C61 CD 72 8D      [17]  115 	call	_cpct_getScreenPtr
   7C64 4D            [ 4]  116 	ld	c,l
   7C65 44            [ 4]  117 	ld	b,h
                            118 ;src/menu/menu.c:20: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra 
   7C66 DD 66 07      [19]  119 	ld	h,7 (ix)
   7C69 DD 6E 06      [19]  120 	ld	l,6 (ix)
   7C6C E5            [11]  121 	push	hl
   7C6D AF            [ 4]  122 	xor	a, a
   7C6E F5            [11]  123 	push	af
   7C6F 33            [ 6]  124 	inc	sp
   7C70 C5            [11]  125 	push	bc
   7C71 CD 98 8C      [17]  126 	call	_cpct_drawSolidBox
   7C74 F1            [10]  127 	pop	af
   7C75 F1            [10]  128 	pop	af
   7C76 33            [ 6]  129 	inc	sp
   7C77 18 51         [12]  130 	jr	00106$
   7C79                     131 00104$:
                            132 ;src/menu/menu.c:22: else if (ancho > 40){
   7C79 CB 41         [ 8]  133 	bit	0,c
   7C7B 28 4D         [12]  134 	jr	Z,00106$
                            135 ;src/menu/menu.c:24: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
   7C7D DD 66 05      [19]  136 	ld	h,5 (ix)
   7C80 DD 6E 04      [19]  137 	ld	l,4 (ix)
   7C83 E5            [11]  138 	push	hl
   7C84 21 00 C0      [10]  139 	ld	hl,#0xC000
   7C87 E5            [11]  140 	push	hl
   7C88 CD 72 8D      [17]  141 	call	_cpct_getScreenPtr
   7C8B 4D            [ 4]  142 	ld	c,l
   7C8C 44            [ 4]  143 	ld	b,h
                            144 ;src/menu/menu.c:25: cpct_drawSolidBox(memptr, 0, 40, alto);  //borra la mitad derecha
   7C8D DD 7E 07      [19]  145 	ld	a,7 (ix)
   7C90 F5            [11]  146 	push	af
   7C91 33            [ 6]  147 	inc	sp
   7C92 21 00 28      [10]  148 	ld	hl,#0x2800
   7C95 E5            [11]  149 	push	hl
   7C96 C5            [11]  150 	push	bc
   7C97 CD 98 8C      [17]  151 	call	_cpct_drawSolidBox
   7C9A F1            [10]  152 	pop	af
   7C9B F1            [10]  153 	pop	af
   7C9C 33            [ 6]  154 	inc	sp
                            155 ;src/menu/menu.c:26: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
   7C9D DD 7E 04      [19]  156 	ld	a,4 (ix)
   7CA0 C6 28         [ 7]  157 	add	a, #0x28
   7CA2 47            [ 4]  158 	ld	b,a
   7CA3 DD 7E 05      [19]  159 	ld	a,5 (ix)
   7CA6 F5            [11]  160 	push	af
   7CA7 33            [ 6]  161 	inc	sp
   7CA8 C5            [11]  162 	push	bc
   7CA9 33            [ 6]  163 	inc	sp
   7CAA 21 00 C0      [10]  164 	ld	hl,#0xC000
   7CAD E5            [11]  165 	push	hl
   7CAE CD 72 8D      [17]  166 	call	_cpct_getScreenPtr
   7CB1 4D            [ 4]  167 	ld	c,l
   7CB2 44            [ 4]  168 	ld	b,h
                            169 ;src/menu/menu.c:27: cpct_drawSolidBox(memptr, 0, ancho-40, alto);  //borra la mitad izquierda
   7CB3 DD 7E 06      [19]  170 	ld	a,6 (ix)
   7CB6 C6 D8         [ 7]  171 	add	a,#0xD8
   7CB8 57            [ 4]  172 	ld	d,a
   7CB9 DD 7E 07      [19]  173 	ld	a,7 (ix)
   7CBC F5            [11]  174 	push	af
   7CBD 33            [ 6]  175 	inc	sp
   7CBE D5            [11]  176 	push	de
   7CBF 33            [ 6]  177 	inc	sp
   7CC0 AF            [ 4]  178 	xor	a, a
   7CC1 F5            [11]  179 	push	af
   7CC2 33            [ 6]  180 	inc	sp
   7CC3 C5            [11]  181 	push	bc
   7CC4 CD 98 8C      [17]  182 	call	_cpct_drawSolidBox
   7CC7 F1            [10]  183 	pop	af
   7CC8 F1            [10]  184 	pop	af
   7CC9 33            [ 6]  185 	inc	sp
   7CCA                     186 00106$:
   7CCA DD E1         [14]  187 	pop	ix
   7CCC C9            [10]  188 	ret
                            189 ;src/menu/menu.c:31: void menuInstrucciones(){ // TODO TODO
                            190 ;	---------------------------------
                            191 ; Function menuInstrucciones
                            192 ; ---------------------------------
   7CCD                     193 _menuInstrucciones::
                            194 ;src/menu/menu.c:33: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   7CCD 21 50 82      [10]  195 	ld	hl,#0x8250
   7CD0 E5            [11]  196 	push	hl
   7CD1 21 00 1E      [10]  197 	ld	hl,#0x1E00
   7CD4 E5            [11]  198 	push	hl
   7CD5 CD 41 7C      [17]  199 	call	_borrarPantalla
   7CD8 F1            [10]  200 	pop	af
                            201 ;src/menu/menu.c:36: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 16, 85); // centrado en horizontal y abajo en vertical
   7CD9 21 10 55      [10]  202 	ld	hl, #0x5510
   7CDC E3            [19]  203 	ex	(sp),hl
   7CDD 21 00 C0      [10]  204 	ld	hl,#0xC000
   7CE0 E5            [11]  205 	push	hl
   7CE1 CD 72 8D      [17]  206 	call	_cpct_getScreenPtr
   7CE4 4D            [ 4]  207 	ld	c,l
   7CE5 44            [ 4]  208 	ld	b,h
                            209 ;src/menu/menu.c:37: cpct_drawStringM0("INSTRUCTIONS", memptr, 2, 0);
   7CE6 21 02 00      [10]  210 	ld	hl,#0x0002
   7CE9 E5            [11]  211 	push	hl
   7CEA C5            [11]  212 	push	bc
   7CEB 21 BB 7D      [10]  213 	ld	hl,#___str_1
   7CEE E5            [11]  214 	push	hl
   7CEF CD A2 81      [17]  215 	call	_cpct_drawStringM0
   7CF2 21 06 00      [10]  216 	ld	hl,#6
   7CF5 39            [11]  217 	add	hl,sp
   7CF6 F9            [ 6]  218 	ld	sp,hl
                            219 ;src/menu/menu.c:40: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 115); // dibuja 5 corazones
   7CF7 21 04 73      [10]  220 	ld	hl,#0x7304
   7CFA E5            [11]  221 	push	hl
   7CFB 21 00 C0      [10]  222 	ld	hl,#0xC000
   7CFE E5            [11]  223 	push	hl
   7CFF CD 72 8D      [17]  224 	call	_cpct_getScreenPtr
   7D02 4D            [ 4]  225 	ld	c,l
   7D03 44            [ 4]  226 	ld	b,h
                            227 ;src/menu/menu.c:41: cpct_drawSprite (g_arrows_0, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   7D04 21 05 0A      [10]  228 	ld	hl,#0x0A05
   7D07 E5            [11]  229 	push	hl
   7D08 C5            [11]  230 	push	bc
   7D09 21 A8 55      [10]  231 	ld	hl,#_g_arrows_0
   7D0C E5            [11]  232 	push	hl
   7D0D CD C6 81      [17]  233 	call	_cpct_drawSprite
                            234 ;src/menu/menu.c:43: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // dibuja 5 corazones
   7D10 21 0E 73      [10]  235 	ld	hl,#0x730E
   7D13 E5            [11]  236 	push	hl
   7D14 21 00 C0      [10]  237 	ld	hl,#0xC000
   7D17 E5            [11]  238 	push	hl
   7D18 CD 72 8D      [17]  239 	call	_cpct_getScreenPtr
   7D1B 4D            [ 4]  240 	ld	c,l
   7D1C 44            [ 4]  241 	ld	b,h
                            242 ;src/menu/menu.c:44: cpct_drawSprite (g_arrows_1, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   7D1D 21 05 0A      [10]  243 	ld	hl,#0x0A05
   7D20 E5            [11]  244 	push	hl
   7D21 C5            [11]  245 	push	bc
   7D22 21 DA 55      [10]  246 	ld	hl,#_g_arrows_1
   7D25 E5            [11]  247 	push	hl
   7D26 CD C6 81      [17]  248 	call	_cpct_drawSprite
                            249 ;src/menu/menu.c:46: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 115); // dibuja 5 corazones
   7D29 21 18 73      [10]  250 	ld	hl,#0x7318
   7D2C E5            [11]  251 	push	hl
   7D2D 21 00 C0      [10]  252 	ld	hl,#0xC000
   7D30 E5            [11]  253 	push	hl
   7D31 CD 72 8D      [17]  254 	call	_cpct_getScreenPtr
   7D34 4D            [ 4]  255 	ld	c,l
   7D35 44            [ 4]  256 	ld	b,h
                            257 ;src/menu/menu.c:47: cpct_drawSprite (g_arrows_2, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   7D36 21 05 0A      [10]  258 	ld	hl,#0x0A05
   7D39 E5            [11]  259 	push	hl
   7D3A C5            [11]  260 	push	bc
   7D3B 21 0C 56      [10]  261 	ld	hl,#_g_arrows_2
   7D3E E5            [11]  262 	push	hl
   7D3F CD C6 81      [17]  263 	call	_cpct_drawSprite
                            264 ;src/menu/menu.c:49: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 34, 115); // dibuja 5 corazones
   7D42 21 22 73      [10]  265 	ld	hl,#0x7322
   7D45 E5            [11]  266 	push	hl
   7D46 21 00 C0      [10]  267 	ld	hl,#0xC000
   7D49 E5            [11]  268 	push	hl
   7D4A CD 72 8D      [17]  269 	call	_cpct_getScreenPtr
   7D4D 4D            [ 4]  270 	ld	c,l
   7D4E 44            [ 4]  271 	ld	b,h
                            272 ;src/menu/menu.c:50: cpct_drawSprite (g_arrows_3, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
   7D4F 21 05 0A      [10]  273 	ld	hl,#0x0A05
   7D52 E5            [11]  274 	push	hl
   7D53 C5            [11]  275 	push	bc
   7D54 21 3E 56      [10]  276 	ld	hl,#_g_arrows_3
   7D57 E5            [11]  277 	push	hl
   7D58 CD C6 81      [17]  278 	call	_cpct_drawSprite
                            279 ;src/menu/menu.c:52: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 115); // centrado en horizontal y abajo en vertical
   7D5B 21 2D 73      [10]  280 	ld	hl,#0x732D
   7D5E E5            [11]  281 	push	hl
   7D5F 21 00 C0      [10]  282 	ld	hl,#0xC000
   7D62 E5            [11]  283 	push	hl
   7D63 CD 72 8D      [17]  284 	call	_cpct_getScreenPtr
   7D66 4D            [ 4]  285 	ld	c,l
   7D67 44            [ 4]  286 	ld	b,h
                            287 ;src/menu/menu.c:53: cpct_drawStringM0(" TO MOVE", memptr, 2, 0);
   7D68 21 02 00      [10]  288 	ld	hl,#0x0002
   7D6B E5            [11]  289 	push	hl
   7D6C C5            [11]  290 	push	bc
   7D6D 21 C8 7D      [10]  291 	ld	hl,#___str_2
   7D70 E5            [11]  292 	push	hl
   7D71 CD A2 81      [17]  293 	call	_cpct_drawStringM0
   7D74 21 06 00      [10]  294 	ld	hl,#6
   7D77 39            [11]  295 	add	hl,sp
   7D78 F9            [ 6]  296 	ld	sp,hl
                            297 ;src/menu/menu.c:55: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 130); // centrado en horizontal y abajo en vertical
   7D79 21 04 82      [10]  298 	ld	hl,#0x8204
   7D7C E5            [11]  299 	push	hl
   7D7D 21 00 C0      [10]  300 	ld	hl,#0xC000
   7D80 E5            [11]  301 	push	hl
   7D81 CD 72 8D      [17]  302 	call	_cpct_getScreenPtr
   7D84 4D            [ 4]  303 	ld	c,l
   7D85 44            [ 4]  304 	ld	b,h
                            305 ;src/menu/menu.c:56: cpct_drawStringM0("SPACE BAR TO SHOOT", memptr, 2, 0);
   7D86 21 02 00      [10]  306 	ld	hl,#0x0002
   7D89 E5            [11]  307 	push	hl
   7D8A C5            [11]  308 	push	bc
   7D8B 21 D1 7D      [10]  309 	ld	hl,#___str_3
   7D8E E5            [11]  310 	push	hl
   7D8F CD A2 81      [17]  311 	call	_cpct_drawStringM0
   7D92 21 06 00      [10]  312 	ld	hl,#6
   7D95 39            [11]  313 	add	hl,sp
   7D96 F9            [ 6]  314 	ld	sp,hl
                            315 ;src/menu/menu.c:58: do{
   7D97                     316 00104$:
                            317 ;src/menu/menu.c:59: cpct_scanKeyboard_f(); 
   7D97 CD 09 81      [17]  318 	call	_cpct_scanKeyboard_f
                            319 ;src/menu/menu.c:60: if(cpct_isKeyPressed(Key_M)){
   7D9A 21 04 40      [10]  320 	ld	hl,#0x4004
   7D9D CD 8A 81      [17]  321 	call	_cpct_isKeyPressed
   7DA0 7D            [ 4]  322 	ld	a,l
   7DA1 B7            [ 4]  323 	or	a, a
   7DA2 28 03         [12]  324 	jr	Z,00105$
                            325 ;src/menu/menu.c:61: menuOpciones();
   7DA4 CD C3 7E      [17]  326 	call	_menuOpciones
   7DA7                     327 00105$:
                            328 ;src/menu/menu.c:64: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   7DA7 21 07 10      [10]  329 	ld	hl,#0x1007
   7DAA CD 8A 81      [17]  330 	call	_cpct_isKeyPressed
   7DAD 7D            [ 4]  331 	ld	a,l
   7DAE B7            [ 4]  332 	or	a, a
   7DAF C0            [11]  333 	ret	NZ
   7DB0 21 04 40      [10]  334 	ld	hl,#0x4004
   7DB3 CD 8A 81      [17]  335 	call	_cpct_isKeyPressed
   7DB6 7D            [ 4]  336 	ld	a,l
   7DB7 B7            [ 4]  337 	or	a, a
   7DB8 28 DD         [12]  338 	jr	Z,00104$
   7DBA C9            [10]  339 	ret
   7DBB                     340 ___str_1:
   7DBB 49 4E 53 54 52 55   341 	.ascii "INSTRUCTIONS"
        43 54 49 4F 4E 53
   7DC7 00                  342 	.db 0x00
   7DC8                     343 ___str_2:
   7DC8 20 54 4F 20 4D 4F   344 	.ascii " TO MOVE"
        56 45
   7DD0 00                  345 	.db 0x00
   7DD1                     346 ___str_3:
   7DD1 53 50 41 43 45 20   347 	.ascii "SPACE BAR TO SHOOT"
        42 41 52 20 54 4F
        20 53 48 4F 4F 54
   7DE3 00                  348 	.db 0x00
                            349 ;src/menu/menu.c:67: void menuCreditos(){ // TODO TODO
                            350 ;	---------------------------------
                            351 ; Function menuCreditos
                            352 ; ---------------------------------
   7DE4                     353 _menuCreditos::
                            354 ;src/menu/menu.c:69: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   7DE4 21 50 82      [10]  355 	ld	hl,#0x8250
   7DE7 E5            [11]  356 	push	hl
   7DE8 21 00 1E      [10]  357 	ld	hl,#0x1E00
   7DEB E5            [11]  358 	push	hl
   7DEC CD 41 7C      [17]  359 	call	_borrarPantalla
   7DEF F1            [10]  360 	pop	af
                            361 ;src/menu/menu.c:72: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 70); // centrado en horizontal y abajo en vertical
   7DF0 21 1A 46      [10]  362 	ld	hl, #0x461A
   7DF3 E3            [19]  363 	ex	(sp),hl
   7DF4 21 00 C0      [10]  364 	ld	hl,#0xC000
   7DF7 E5            [11]  365 	push	hl
   7DF8 CD 72 8D      [17]  366 	call	_cpct_getScreenPtr
   7DFB 4D            [ 4]  367 	ld	c,l
   7DFC 44            [ 4]  368 	ld	b,h
                            369 ;src/menu/menu.c:73: cpct_drawStringM0("CREDITS", memptr, 2, 0);
   7DFD 21 02 00      [10]  370 	ld	hl,#0x0002
   7E00 E5            [11]  371 	push	hl
   7E01 C5            [11]  372 	push	bc
   7E02 21 8C 7E      [10]  373 	ld	hl,#___str_4
   7E05 E5            [11]  374 	push	hl
   7E06 CD A2 81      [17]  375 	call	_cpct_drawStringM0
   7E09 21 06 00      [10]  376 	ld	hl,#6
   7E0C 39            [11]  377 	add	hl,sp
   7E0D F9            [ 6]  378 	ld	sp,hl
                            379 ;src/menu/menu.c:75: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 100); // centrado en horizontal y abajo en vertical
   7E0E 21 0A 64      [10]  380 	ld	hl,#0x640A
   7E11 E5            [11]  381 	push	hl
   7E12 21 00 C0      [10]  382 	ld	hl,#0xC000
   7E15 E5            [11]  383 	push	hl
   7E16 CD 72 8D      [17]  384 	call	_cpct_getScreenPtr
   7E19 4D            [ 4]  385 	ld	c,l
   7E1A 44            [ 4]  386 	ld	b,h
                            387 ;src/menu/menu.c:76: cpct_drawStringM0("Cristina Rivera", memptr, 2, 0);
   7E1B 21 02 00      [10]  388 	ld	hl,#0x0002
   7E1E E5            [11]  389 	push	hl
   7E1F C5            [11]  390 	push	bc
   7E20 21 94 7E      [10]  391 	ld	hl,#___str_5
   7E23 E5            [11]  392 	push	hl
   7E24 CD A2 81      [17]  393 	call	_cpct_drawStringM0
   7E27 21 06 00      [10]  394 	ld	hl,#6
   7E2A 39            [11]  395 	add	hl,sp
   7E2B F9            [ 6]  396 	ld	sp,hl
                            397 ;src/menu/menu.c:78: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // centrado en horizontal y abajo en vertical
   7E2C 21 0E 73      [10]  398 	ld	hl,#0x730E
   7E2F E5            [11]  399 	push	hl
   7E30 21 00 C0      [10]  400 	ld	hl,#0xC000
   7E33 E5            [11]  401 	push	hl
   7E34 CD 72 8D      [17]  402 	call	_cpct_getScreenPtr
   7E37 4D            [ 4]  403 	ld	c,l
   7E38 44            [ 4]  404 	ld	b,h
                            405 ;src/menu/menu.c:79: cpct_drawStringM0("Miguel Sancho", memptr, 2, 0);
   7E39 21 02 00      [10]  406 	ld	hl,#0x0002
   7E3C E5            [11]  407 	push	hl
   7E3D C5            [11]  408 	push	bc
   7E3E 21 A4 7E      [10]  409 	ld	hl,#___str_6
   7E41 E5            [11]  410 	push	hl
   7E42 CD A2 81      [17]  411 	call	_cpct_drawStringM0
   7E45 21 06 00      [10]  412 	ld	hl,#6
   7E48 39            [11]  413 	add	hl,sp
   7E49 F9            [ 6]  414 	ld	sp,hl
                            415 ;src/menu/menu.c:81: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 130); // centrado en horizontal y abajo en vertical
   7E4A 21 08 82      [10]  416 	ld	hl,#0x8208
   7E4D E5            [11]  417 	push	hl
   7E4E 21 00 C0      [10]  418 	ld	hl,#0xC000
   7E51 E5            [11]  419 	push	hl
   7E52 CD 72 8D      [17]  420 	call	_cpct_getScreenPtr
   7E55 4D            [ 4]  421 	ld	c,l
   7E56 44            [ 4]  422 	ld	b,h
                            423 ;src/menu/menu.c:82: cpct_drawStringM0("Fernando Verdejo", memptr, 2, 0);
   7E57 21 02 00      [10]  424 	ld	hl,#0x0002
   7E5A E5            [11]  425 	push	hl
   7E5B C5            [11]  426 	push	bc
   7E5C 21 B2 7E      [10]  427 	ld	hl,#___str_7
   7E5F E5            [11]  428 	push	hl
   7E60 CD A2 81      [17]  429 	call	_cpct_drawStringM0
   7E63 21 06 00      [10]  430 	ld	hl,#6
   7E66 39            [11]  431 	add	hl,sp
   7E67 F9            [ 6]  432 	ld	sp,hl
                            433 ;src/menu/menu.c:84: do{
   7E68                     434 00104$:
                            435 ;src/menu/menu.c:85: cpct_scanKeyboard_f(); 
   7E68 CD 09 81      [17]  436 	call	_cpct_scanKeyboard_f
                            437 ;src/menu/menu.c:86: if(cpct_isKeyPressed(Key_M)){
   7E6B 21 04 40      [10]  438 	ld	hl,#0x4004
   7E6E CD 8A 81      [17]  439 	call	_cpct_isKeyPressed
   7E71 7D            [ 4]  440 	ld	a,l
   7E72 B7            [ 4]  441 	or	a, a
   7E73 28 03         [12]  442 	jr	Z,00105$
                            443 ;src/menu/menu.c:87: menuOpciones();
   7E75 CD C3 7E      [17]  444 	call	_menuOpciones
   7E78                     445 00105$:
                            446 ;src/menu/menu.c:90: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   7E78 21 07 10      [10]  447 	ld	hl,#0x1007
   7E7B CD 8A 81      [17]  448 	call	_cpct_isKeyPressed
   7E7E 7D            [ 4]  449 	ld	a,l
   7E7F B7            [ 4]  450 	or	a, a
   7E80 C0            [11]  451 	ret	NZ
   7E81 21 04 40      [10]  452 	ld	hl,#0x4004
   7E84 CD 8A 81      [17]  453 	call	_cpct_isKeyPressed
   7E87 7D            [ 4]  454 	ld	a,l
   7E88 B7            [ 4]  455 	or	a, a
   7E89 28 DD         [12]  456 	jr	Z,00104$
   7E8B C9            [10]  457 	ret
   7E8C                     458 ___str_4:
   7E8C 43 52 45 44 49 54   459 	.ascii "CREDITS"
        53
   7E93 00                  460 	.db 0x00
   7E94                     461 ___str_5:
   7E94 43 72 69 73 74 69   462 	.ascii "Cristina Rivera"
        6E 61 20 52 69 76
        65 72 61
   7EA3 00                  463 	.db 0x00
   7EA4                     464 ___str_6:
   7EA4 4D 69 67 75 65 6C   465 	.ascii "Miguel Sancho"
        20 53 61 6E 63 68
        6F
   7EB1 00                  466 	.db 0x00
   7EB2                     467 ___str_7:
   7EB2 46 65 72 6E 61 6E   468 	.ascii "Fernando Verdejo"
        64 6F 20 56 65 72
        64 65 6A 6F
   7EC2 00                  469 	.db 0x00
                            470 ;src/menu/menu.c:94: void menuOpciones(){ // TODO TODO
                            471 ;	---------------------------------
                            472 ; Function menuOpciones
                            473 ; ---------------------------------
   7EC3                     474 _menuOpciones::
                            475 ;src/menu/menu.c:96: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
   7EC3 21 50 82      [10]  476 	ld	hl,#0x8250
   7EC6 E5            [11]  477 	push	hl
   7EC7 21 00 1E      [10]  478 	ld	hl,#0x1E00
   7ECA E5            [11]  479 	push	hl
   7ECB CD 41 7C      [17]  480 	call	_borrarPantalla
   7ECE F1            [10]  481 	pop	af
                            482 ;src/menu/menu.c:99: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 100); // centrado en horizontal y abajo en vertical
   7ECF 21 20 64      [10]  483 	ld	hl, #0x6420
   7ED2 E3            [19]  484 	ex	(sp),hl
   7ED3 21 00 C0      [10]  485 	ld	hl,#0xC000
   7ED6 E5            [11]  486 	push	hl
   7ED7 CD 72 8D      [17]  487 	call	_cpct_getScreenPtr
   7EDA 4D            [ 4]  488 	ld	c,l
   7EDB 44            [ 4]  489 	ld	b,h
                            490 ;src/menu/menu.c:100: cpct_drawStringM0("MENU", memptr, 2, 0);
   7EDC 21 02 00      [10]  491 	ld	hl,#0x0002
   7EDF E5            [11]  492 	push	hl
   7EE0 C5            [11]  493 	push	bc
   7EE1 21 64 7F      [10]  494 	ld	hl,#___str_8
   7EE4 E5            [11]  495 	push	hl
   7EE5 CD A2 81      [17]  496 	call	_cpct_drawStringM0
   7EE8 21 06 00      [10]  497 	ld	hl,#6
   7EEB 39            [11]  498 	add	hl,sp
   7EEC F9            [ 6]  499 	ld	sp,hl
                            500 ;src/menu/menu.c:102: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 130); // centrado en horizontal y abajo en vertical
   7EED 21 00 82      [10]  501 	ld	hl,#0x8200
   7EF0 E5            [11]  502 	push	hl
   7EF1 26 C0         [ 7]  503 	ld	h, #0xC0
   7EF3 E5            [11]  504 	push	hl
   7EF4 CD 72 8D      [17]  505 	call	_cpct_getScreenPtr
   7EF7 4D            [ 4]  506 	ld	c,l
   7EF8 44            [ 4]  507 	ld	b,h
                            508 ;src/menu/menu.c:103: cpct_drawStringM0("INSTRUCTIONS PRESS I", memptr, 2, 0);
   7EF9 21 02 00      [10]  509 	ld	hl,#0x0002
   7EFC E5            [11]  510 	push	hl
   7EFD C5            [11]  511 	push	bc
   7EFE 21 69 7F      [10]  512 	ld	hl,#___str_9
   7F01 E5            [11]  513 	push	hl
   7F02 CD A2 81      [17]  514 	call	_cpct_drawStringM0
   7F05 21 06 00      [10]  515 	ld	hl,#6
   7F08 39            [11]  516 	add	hl,sp
   7F09 F9            [ 6]  517 	ld	sp,hl
                            518 ;src/menu/menu.c:105: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 145); // centrado en horizontal y abajo en vertical
   7F0A 21 0A 91      [10]  519 	ld	hl,#0x910A
   7F0D E5            [11]  520 	push	hl
   7F0E 21 00 C0      [10]  521 	ld	hl,#0xC000
   7F11 E5            [11]  522 	push	hl
   7F12 CD 72 8D      [17]  523 	call	_cpct_getScreenPtr
   7F15 4D            [ 4]  524 	ld	c,l
   7F16 44            [ 4]  525 	ld	b,h
                            526 ;src/menu/menu.c:106: cpct_drawStringM0("CREDITS PRESS C", memptr, 2, 0);
   7F17 21 02 00      [10]  527 	ld	hl,#0x0002
   7F1A E5            [11]  528 	push	hl
   7F1B C5            [11]  529 	push	bc
   7F1C 21 7E 7F      [10]  530 	ld	hl,#___str_10
   7F1F E5            [11]  531 	push	hl
   7F20 CD A2 81      [17]  532 	call	_cpct_drawStringM0
   7F23 21 06 00      [10]  533 	ld	hl,#6
   7F26 39            [11]  534 	add	hl,sp
   7F27 F9            [ 6]  535 	ld	sp,hl
                            536 ;src/menu/menu.c:108: do{
   7F28                     537 00108$:
                            538 ;src/menu/menu.c:109: cpct_scanKeyboard_f(); 
   7F28 CD 09 81      [17]  539 	call	_cpct_scanKeyboard_f
                            540 ;src/menu/menu.c:114: if(cpct_isKeyPressed(Key_I)){
   7F2B 21 04 08      [10]  541 	ld	hl,#0x0804
   7F2E CD 8A 81      [17]  542 	call	_cpct_isKeyPressed
   7F31 7D            [ 4]  543 	ld	a,l
   7F32 B7            [ 4]  544 	or	a, a
   7F33 28 05         [12]  545 	jr	Z,00104$
                            546 ;src/menu/menu.c:115: menuInstrucciones();
   7F35 CD CD 7C      [17]  547 	call	_menuInstrucciones
   7F38 18 0D         [12]  548 	jr	00109$
   7F3A                     549 00104$:
                            550 ;src/menu/menu.c:119: else if(cpct_isKeyPressed(Key_C)){
   7F3A 21 07 40      [10]  551 	ld	hl,#0x4007
   7F3D CD 8A 81      [17]  552 	call	_cpct_isKeyPressed
   7F40 7D            [ 4]  553 	ld	a,l
   7F41 B7            [ 4]  554 	or	a, a
   7F42 28 03         [12]  555 	jr	Z,00109$
                            556 ;src/menu/menu.c:120: menuCreditos();
   7F44 CD E4 7D      [17]  557 	call	_menuCreditos
   7F47                     558 00109$:
                            559 ;src/menu/menu.c:128: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_I) && !cpct_isKeyPressed(Key_C));
   7F47 21 07 10      [10]  560 	ld	hl,#0x1007
   7F4A CD 8A 81      [17]  561 	call	_cpct_isKeyPressed
   7F4D 7D            [ 4]  562 	ld	a,l
   7F4E B7            [ 4]  563 	or	a, a
   7F4F C0            [11]  564 	ret	NZ
   7F50 21 04 08      [10]  565 	ld	hl,#0x0804
   7F53 CD 8A 81      [17]  566 	call	_cpct_isKeyPressed
   7F56 7D            [ 4]  567 	ld	a,l
   7F57 B7            [ 4]  568 	or	a, a
   7F58 C0            [11]  569 	ret	NZ
   7F59 21 07 40      [10]  570 	ld	hl,#0x4007
   7F5C CD 8A 81      [17]  571 	call	_cpct_isKeyPressed
   7F5F 7D            [ 4]  572 	ld	a,l
   7F60 B7            [ 4]  573 	or	a, a
   7F61 28 C5         [12]  574 	jr	Z,00108$
   7F63 C9            [10]  575 	ret
   7F64                     576 ___str_8:
   7F64 4D 45 4E 55         577 	.ascii "MENU"
   7F68 00                  578 	.db 0x00
   7F69                     579 ___str_9:
   7F69 49 4E 53 54 52 55   580 	.ascii "INSTRUCTIONS PRESS I"
        43 54 49 4F 4E 53
        20 50 52 45 53 53
        20 49
   7F7D 00                  581 	.db 0x00
   7F7E                     582 ___str_10:
   7F7E 43 52 45 44 49 54   583 	.ascii "CREDITS PRESS C"
        53 20 50 52 45 53
        53 20 43
   7F8D 00                  584 	.db 0x00
                            585 ;src/menu/menu.c:131: void menuInicio(){
                            586 ;	---------------------------------
                            587 ; Function menuInicio
                            588 ; ---------------------------------
   7F8E                     589 _menuInicio::
                            590 ;src/menu/menu.c:135: cpct_clearScreen(0);
   7F8E 21 00 40      [10]  591 	ld	hl,#0x4000
   7F91 E5            [11]  592 	push	hl
   7F92 AF            [ 4]  593 	xor	a, a
   7F93 F5            [11]  594 	push	af
   7F94 33            [ 6]  595 	inc	sp
   7F95 26 C0         [ 7]  596 	ld	h, #0xC0
   7F97 E5            [11]  597 	push	hl
   7F98 CD 51 84      [17]  598 	call	_cpct_memset
                            599 ;src/menu/menu.c:137: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
   7F9B 21 1A 0F      [10]  600 	ld	hl,#0x0F1A
   7F9E E5            [11]  601 	push	hl
   7F9F 21 00 C0      [10]  602 	ld	hl,#0xC000
   7FA2 E5            [11]  603 	push	hl
   7FA3 CD 72 8D      [17]  604 	call	_cpct_getScreenPtr
   7FA6 4D            [ 4]  605 	ld	c,l
   7FA7 44            [ 4]  606 	ld	b,h
                            607 ;src/menu/menu.c:138: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
   7FA8 21 04 00      [10]  608 	ld	hl,#0x0004
   7FAB E5            [11]  609 	push	hl
   7FAC C5            [11]  610 	push	bc
   7FAD 21 44 80      [10]  611 	ld	hl,#___str_11
   7FB0 E5            [11]  612 	push	hl
   7FB1 CD A2 81      [17]  613 	call	_cpct_drawStringM0
   7FB4 21 06 00      [10]  614 	ld	hl,#6
   7FB7 39            [11]  615 	add	hl,sp
   7FB8 F9            [ 6]  616 	ld	sp,hl
                            617 ;src/menu/menu.c:140: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
   7FB9 21 28 6E      [10]  618 	ld	hl,#0x6E28
   7FBC E5            [11]  619 	push	hl
   7FBD 21 F0 F0      [10]  620 	ld	hl,#0xF0F0
   7FC0 E5            [11]  621 	push	hl
   7FC1 21 C8 56      [10]  622 	ld	hl,#_g_text_0
   7FC4 E5            [11]  623 	push	hl
   7FC5 CD C6 81      [17]  624 	call	_cpct_drawSprite
                            625 ;src/menu/menu.c:141: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
   7FC8 21 28 6E      [10]  626 	ld	hl,#0x6E28
   7FCB E5            [11]  627 	push	hl
   7FCC 21 18 F1      [10]  628 	ld	hl,#0xF118
   7FCF E5            [11]  629 	push	hl
   7FD0 21 F8 67      [10]  630 	ld	hl,#_g_text_1
   7FD3 E5            [11]  631 	push	hl
   7FD4 CD C6 81      [17]  632 	call	_cpct_drawSprite
                            633 ;src/menu/menu.c:143: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
   7FD7 21 08 A0      [10]  634 	ld	hl,#0xA008
   7FDA E5            [11]  635 	push	hl
   7FDB 21 00 C0      [10]  636 	ld	hl,#0xC000
   7FDE E5            [11]  637 	push	hl
   7FDF CD 72 8D      [17]  638 	call	_cpct_getScreenPtr
   7FE2 4D            [ 4]  639 	ld	c,l
   7FE3 44            [ 4]  640 	ld	b,h
                            641 ;src/menu/menu.c:144: cpct_drawStringM0("TO START PRESS S", memptr, 2, 0);
   7FE4 21 02 00      [10]  642 	ld	hl,#0x0002
   7FE7 E5            [11]  643 	push	hl
   7FE8 C5            [11]  644 	push	bc
   7FE9 21 4C 80      [10]  645 	ld	hl,#___str_12
   7FEC E5            [11]  646 	push	hl
   7FED CD A2 81      [17]  647 	call	_cpct_drawStringM0
   7FF0 21 06 00      [10]  648 	ld	hl,#6
   7FF3 39            [11]  649 	add	hl,sp
   7FF4 F9            [ 6]  650 	ld	sp,hl
                            651 ;src/menu/menu.c:146: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 175); // centrado en horizontal y abajo en vertical
   7FF5 21 0A AF      [10]  652 	ld	hl,#0xAF0A
   7FF8 E5            [11]  653 	push	hl
   7FF9 21 00 C0      [10]  654 	ld	hl,#0xC000
   7FFC E5            [11]  655 	push	hl
   7FFD CD 72 8D      [17]  656 	call	_cpct_getScreenPtr
   8000 4D            [ 4]  657 	ld	c,l
   8001 44            [ 4]  658 	ld	b,h
                            659 ;src/menu/menu.c:147: cpct_drawStringM0("TO MENU PRESS M", memptr, 2, 0);
   8002 21 02 00      [10]  660 	ld	hl,#0x0002
   8005 E5            [11]  661 	push	hl
   8006 C5            [11]  662 	push	bc
   8007 21 5D 80      [10]  663 	ld	hl,#___str_13
   800A E5            [11]  664 	push	hl
   800B CD A2 81      [17]  665 	call	_cpct_drawStringM0
   800E 21 06 00      [10]  666 	ld	hl,#6
   8011 39            [11]  667 	add	hl,sp
   8012 F9            [ 6]  668 	ld	sp,hl
                            669 ;src/menu/menu.c:150: do{
   8013                     670 00107$:
                            671 ;src/menu/menu.c:151: cpct_scanKeyboard_f();
   8013 CD 09 81      [17]  672 	call	_cpct_scanKeyboard_f
                            673 ;src/menu/menu.c:155: if(cpct_isKeyPressed(Key_M)){
   8016 21 04 40      [10]  674 	ld	hl,#0x4004
   8019 CD 8A 81      [17]  675 	call	_cpct_isKeyPressed
   801C 7D            [ 4]  676 	ld	a,l
   801D B7            [ 4]  677 	or	a, a
   801E 28 10         [12]  678 	jr	Z,00108$
                            679 ;src/menu/menu.c:156: cpct_scanKeyboard_f();
   8020 CD 09 81      [17]  680 	call	_cpct_scanKeyboard_f
                            681 ;src/menu/menu.c:157: do{
   8023                     682 00101$:
                            683 ;src/menu/menu.c:158: menuOpciones();
   8023 CD C3 7E      [17]  684 	call	_menuOpciones
                            685 ;src/menu/menu.c:160: } while(!cpct_isKeyPressed(Key_S));
   8026 21 07 10      [10]  686 	ld	hl,#0x1007
   8029 CD 8A 81      [17]  687 	call	_cpct_isKeyPressed
   802C 7D            [ 4]  688 	ld	a,l
   802D B7            [ 4]  689 	or	a, a
   802E 28 F3         [12]  690 	jr	Z,00101$
   8030                     691 00108$:
                            692 ;src/menu/menu.c:162: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
   8030 21 07 10      [10]  693 	ld	hl,#0x1007
   8033 CD 8A 81      [17]  694 	call	_cpct_isKeyPressed
   8036 7D            [ 4]  695 	ld	a,l
   8037 B7            [ 4]  696 	or	a, a
   8038 C0            [11]  697 	ret	NZ
   8039 21 04 40      [10]  698 	ld	hl,#0x4004
   803C CD 8A 81      [17]  699 	call	_cpct_isKeyPressed
   803F 7D            [ 4]  700 	ld	a,l
   8040 B7            [ 4]  701 	or	a, a
   8041 28 D0         [12]  702 	jr	Z,00107$
   8043 C9            [10]  703 	ret
   8044                     704 ___str_11:
   8044 52 4F 42 4F 42 49   705 	.ascii "ROBOBIT"
        54
   804B 00                  706 	.db 0x00
   804C                     707 ___str_12:
   804C 54 4F 20 53 54 41   708 	.ascii "TO START PRESS S"
        52 54 20 50 52 45
        53 53 20 53
   805C 00                  709 	.db 0x00
   805D                     710 ___str_13:
   805D 54 4F 20 4D 45 4E   711 	.ascii "TO MENU PRESS M"
        55 20 50 52 45 53
        53 20 4D
   806C 00                  712 	.db 0x00
                            713 	.area _CODE
                            714 	.area _INITIALIZER
                            715 	.area _CABS (ABS)
