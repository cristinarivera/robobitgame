;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (Linux)
;--------------------------------------------------------
	.module menu
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cpct_getScreenPtr
	.globl _cpct_drawStringM0
	.globl _cpct_drawSolidBox
	.globl _cpct_drawSprite
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_f
	.globl _cpct_memset
	.globl _borrarPantalla
	.globl _menuInstrucciones
	.globl _menuCreditos
	.globl _menuOpciones
	.globl _menuInicio
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/menu/menu.c:26: void borrarPantalla(u8 x, u8 y, u8 ancho, u8 alto){
;	---------------------------------
; Function borrarPantalla
; ---------------------------------
_borrarPantalla::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/menu/menu.c:28: if (ancho <= 40){
	ld	a,#0x28
	sub	a, 6 (ix)
	ld	a,#0x00
	rla
	ld	c,a
	bit	0,c
	jr	NZ,00104$
;src/menu/menu.c:29: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar
	ld	h,5 (ix)
	ld	l,4 (ix)
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/menu/menu.c:30: cpct_drawSolidBox(memptr, 0, ancho, alto);  //borra
	ld	h,7 (ix)
	ld	l,6 (ix)
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	jr	00106$
00104$:
;src/menu/menu.c:32: else if (ancho > 40){
	bit	0,c
	jr	Z,00106$
;src/menu/menu.c:34: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x, y); // posición para borrar la mitad derecha
	ld	h,5 (ix)
	ld	l,4 (ix)
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/menu/menu.c:35: cpct_drawSolidBox(memptr, 0, 40, alto);  //borra la mitad derecha
	ld	a,7 (ix)
	push	af
	inc	sp
	ld	hl,#0x2800
	push	hl
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
;src/menu/menu.c:36: memptr = cpct_getScreenPtr(CPCT_VMEM_START, x + 40, y); // posición para borrar la mitad izquierda
	ld	a,4 (ix)
	add	a, #0x28
	ld	b,a
	ld	a,5 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/menu/menu.c:37: cpct_drawSolidBox(memptr, 0, ancho-40, alto);  //borra la mitad izquierda
	ld	a,6 (ix)
	add	a,#0xD8
	ld	d,a
	ld	a,7 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	xor	a, a
	push	af
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
00106$:
	pop	ix
	ret
;src/menu/menu.c:41: void menuInstrucciones(){ // TODO TODO
;	---------------------------------
; Function menuInstrucciones
; ---------------------------------
_menuInstrucciones::
;src/menu/menu.c:43: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
	ld	hl,#0x8250
	push	hl
	ld	hl,#0x1E00
	push	hl
	call	_borrarPantalla
	pop	af
;src/menu/menu.c:46: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 16, 85); // centrado en horizontal y abajo en vertical
	ld	hl, #0x5510
	ex	(sp),hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/menu/menu.c:47: cpct_drawStringM0("INSTRUCTIONS", memptr, 2, 0);
	ld	hl,#0x0002
	push	hl
	push	bc
	ld	hl,#___str_0
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/menu/menu.c:50: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 115); // dibuja 5 corazones
	ld	hl,#0x7304
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/menu/menu.c:51: cpct_drawSprite (g_arrows_0, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
	ld	hl,#0x0A05
	push	hl
	push	bc
	ld	hl,#_g_arrows_0
	push	hl
	call	_cpct_drawSprite
;src/menu/menu.c:53: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // dibuja 5 corazones
	ld	hl,#0x730E
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/menu/menu.c:54: cpct_drawSprite (g_arrows_1, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
	ld	hl,#0x0A05
	push	hl
	push	bc
	ld	hl,#_g_arrows_1
	push	hl
	call	_cpct_drawSprite
;src/menu/menu.c:56: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 24, 115); // dibuja 5 corazones
	ld	hl,#0x7318
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/menu/menu.c:57: cpct_drawSprite (g_arrows_2, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
	ld	hl,#0x0A05
	push	hl
	push	bc
	ld	hl,#_g_arrows_2
	push	hl
	call	_cpct_drawSprite
;src/menu/menu.c:59: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 34, 115); // dibuja 5 corazones
	ld	hl,#0x7322
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/menu/menu.c:60: cpct_drawSprite (g_arrows_3, memptr, G_ARROWS_0_W, G_ARROWS_0_H);
	ld	hl,#0x0A05
	push	hl
	push	bc
	ld	hl,#_g_arrows_3
	push	hl
	call	_cpct_drawSprite
;src/menu/menu.c:62: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 45, 115); // centrado en horizontal y abajo en vertical
	ld	hl,#0x732D
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/menu/menu.c:63: cpct_drawStringM0(" TO MOVE", memptr, 2, 0);
	ld	hl,#0x0002
	push	hl
	push	bc
	ld	hl,#___str_1
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/menu/menu.c:65: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 4, 130); // centrado en horizontal y abajo en vertical
	ld	hl,#0x8204
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/menu/menu.c:66: cpct_drawStringM0("SPACE BAR TO SHOOT", memptr, 2, 0);
	ld	hl,#0x0002
	push	hl
	push	bc
	ld	hl,#___str_2
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/menu/menu.c:68: do{
00104$:
;src/menu/menu.c:69: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/menu/menu.c:70: if(cpct_isKeyPressed(Key_M)){
	ld	hl,#0x4004
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00105$
;src/menu/menu.c:71: menuOpciones();
	call	_menuOpciones
00105$:
;src/menu/menu.c:74: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
	ld	hl,#0x1007
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	ret	NZ
	ld	hl,#0x4004
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00104$
	ret
___str_0:
	.ascii "INSTRUCTIONS"
	.db 0x00
___str_1:
	.ascii " TO MOVE"
	.db 0x00
___str_2:
	.ascii "SPACE BAR TO SHOOT"
	.db 0x00
;src/menu/menu.c:77: void menuCreditos(){ // TODO TODO
;	---------------------------------
; Function menuCreditos
; ---------------------------------
_menuCreditos::
;src/menu/menu.c:79: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
	ld	hl,#0x8250
	push	hl
	ld	hl,#0x1E00
	push	hl
	call	_borrarPantalla
	pop	af
;src/menu/menu.c:82: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 70); // centrado en horizontal y abajo en vertical
	ld	hl, #0x461A
	ex	(sp),hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/menu/menu.c:83: cpct_drawStringM0("CREDITS", memptr, 2, 0);
	ld	hl,#0x0002
	push	hl
	push	bc
	ld	hl,#___str_3
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/menu/menu.c:85: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 100); // centrado en horizontal y abajo en vertical
	ld	hl,#0x640A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/menu/menu.c:86: cpct_drawStringM0("Cristina Rivera", memptr, 2, 0);
	ld	hl,#0x0002
	push	hl
	push	bc
	ld	hl,#___str_4
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/menu/menu.c:88: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 14, 115); // centrado en horizontal y abajo en vertical
	ld	hl,#0x730E
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/menu/menu.c:89: cpct_drawStringM0("Miguel Sancho", memptr, 2, 0);
	ld	hl,#0x0002
	push	hl
	push	bc
	ld	hl,#___str_5
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/menu/menu.c:91: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 130); // centrado en horizontal y abajo en vertical
	ld	hl,#0x8208
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/menu/menu.c:92: cpct_drawStringM0("Fernando Verdejo", memptr, 2, 0);
	ld	hl,#0x0002
	push	hl
	push	bc
	ld	hl,#___str_6
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/menu/menu.c:94: do{
00104$:
;src/menu/menu.c:95: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/menu/menu.c:96: if(cpct_isKeyPressed(Key_M)){
	ld	hl,#0x4004
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00105$
;src/menu/menu.c:97: menuOpciones();
	call	_menuOpciones
00105$:
;src/menu/menu.c:100: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
	ld	hl,#0x1007
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	ret	NZ
	ld	hl,#0x4004
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00104$
	ret
___str_3:
	.ascii "CREDITS"
	.db 0x00
___str_4:
	.ascii "Cristina Rivera"
	.db 0x00
___str_5:
	.ascii "Miguel Sancho"
	.db 0x00
___str_6:
	.ascii "Fernando Verdejo"
	.db 0x00
;src/menu/menu.c:104: void menuOpciones(){ // TODO TODO
;	---------------------------------
; Function menuOpciones
; ---------------------------------
_menuOpciones::
;src/menu/menu.c:106: borrarPantalla(0, 30, 80, 130);//borra el texto de información inicial
	ld	hl,#0x8250
	push	hl
	ld	hl,#0x1E00
	push	hl
	call	_borrarPantalla
	pop	af
;src/menu/menu.c:109: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 32, 100); // centrado en horizontal y abajo en vertical
	ld	hl, #0x6420
	ex	(sp),hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/menu/menu.c:110: cpct_drawStringM0("MENU", memptr, 2, 0);
	ld	hl,#0x0002
	push	hl
	push	bc
	ld	hl,#___str_7
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/menu/menu.c:112: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 130); // centrado en horizontal y abajo en vertical
	ld	hl,#0x8200
	push	hl
	ld	h, #0xC0
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/menu/menu.c:113: cpct_drawStringM0("INSTRUCTIONS PRESS I", memptr, 2, 0);
	ld	hl,#0x0002
	push	hl
	push	bc
	ld	hl,#___str_8
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/menu/menu.c:115: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 145); // centrado en horizontal y abajo en vertical
	ld	hl,#0x910A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/menu/menu.c:116: cpct_drawStringM0("CREDITS PRESS C", memptr, 2, 0);
	ld	hl,#0x0002
	push	hl
	push	bc
	ld	hl,#___str_9
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/menu/menu.c:118: do{
00108$:
;src/menu/menu.c:119: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/menu/menu.c:124: if(cpct_isKeyPressed(Key_I)){
	ld	hl,#0x0804
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00104$
;src/menu/menu.c:125: menuInstrucciones();
	call	_menuInstrucciones
	jr	00109$
00104$:
;src/menu/menu.c:129: else if(cpct_isKeyPressed(Key_C)){
	ld	hl,#0x4007
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00109$
;src/menu/menu.c:130: menuCreditos();
	call	_menuCreditos
00109$:
;src/menu/menu.c:138: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_I) && !cpct_isKeyPressed(Key_C));
	ld	hl,#0x1007
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	ret	NZ
	ld	hl,#0x0804
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	ret	NZ
	ld	hl,#0x4007
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00108$
	ret
___str_7:
	.ascii "MENU"
	.db 0x00
___str_8:
	.ascii "INSTRUCTIONS PRESS I"
	.db 0x00
___str_9:
	.ascii "CREDITS PRESS C"
	.db 0x00
;src/menu/menu.c:141: void menuInicio() {
;	---------------------------------
; Function menuInicio
; ---------------------------------
_menuInicio::
;src/menu/menu.c:144: cpct_clearScreen(0);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/menu/menu.c:146: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 26, 15); // centrado en horizontal y arriba en vertical
	ld	hl,#0x0F1A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/menu/menu.c:147: cpct_drawStringM0("ROBOBIT", memptr, 4, 0);
	ld	hl,#0x0004
	push	hl
	push	bc
	ld	hl,#___str_10
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/menu/menu.c:149: cpct_drawSprite(g_text_0, cpctm_screenPtr(CPCT_VMEM_START,  0, 30), G_TEXT_0_W, G_TEXT_0_H); // imagen
	ld	hl,#0x6E28
	push	hl
	ld	hl,#0xF0F0
	push	hl
	ld	hl,#_g_text_0
	push	hl
	call	_cpct_drawSprite
;src/menu/menu.c:150: cpct_drawSprite(g_text_1, cpctm_screenPtr(CPCT_VMEM_START, 40, 30), G_TEXT_0_W, G_TEXT_0_H);
	ld	hl,#0x6E28
	push	hl
	ld	hl,#0xF118
	push	hl
	ld	hl,#_g_text_1
	push	hl
	call	_cpct_drawSprite
;src/menu/menu.c:152: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 8, 160); // centrado en horizontal y abajo en vertical
	ld	hl,#0xA008
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/menu/menu.c:153: cpct_drawStringM0("TO START PRESS S", memptr, 2, 0);
	ld	hl,#0x0002
	push	hl
	push	bc
	ld	hl,#___str_11
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/menu/menu.c:155: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 10, 175); // centrado en horizontal y abajo en vertical
	ld	hl,#0xAF0A
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/menu/menu.c:156: cpct_drawStringM0("TO MENU PRESS M", memptr, 2, 0);
	ld	hl,#0x0002
	push	hl
	push	bc
	ld	hl,#___str_12
	push	hl
	call	_cpct_drawStringM0
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/menu/menu.c:159: do{
00107$:
;src/menu/menu.c:160: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/menu/menu.c:164: if(cpct_isKeyPressed(Key_M)){
	ld	hl,#0x4004
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00108$
;src/menu/menu.c:165: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/menu/menu.c:166: do{
00101$:
;src/menu/menu.c:167: menuOpciones();
	call	_menuOpciones
;src/menu/menu.c:169: } while(!cpct_isKeyPressed(Key_S));
	ld	hl,#0x1007
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00101$
00108$:
;src/menu/menu.c:171: } while(!cpct_isKeyPressed(Key_S) && !cpct_isKeyPressed(Key_M));
	ld	hl,#0x1007
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	ret	NZ
	ld	hl,#0x4004
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00107$
	ret
___str_10:
	.ascii "ROBOBIT"
	.db 0x00
___str_11:
	.ascii "TO START PRESS S"
	.db 0x00
___str_12:
	.ascii "TO MENU PRESS M"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
