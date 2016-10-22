                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module score
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _cpct_getScreenPtr
                             12 	.globl _cpct_drawStringM0
                             13 	.globl _cpct_drawSprite
                             14 	.globl _barraPuntuacionInicial
                             15 ;--------------------------------------------------------
                             16 ; special function registers
                             17 ;--------------------------------------------------------
                             18 ;--------------------------------------------------------
                             19 ; ram data
                             20 ;--------------------------------------------------------
                             21 	.area _DATA
                             22 ;--------------------------------------------------------
                             23 ; ram data
                             24 ;--------------------------------------------------------
                             25 	.area _INITIALIZED
                             26 ;--------------------------------------------------------
                             27 ; absolute external ram data
                             28 ;--------------------------------------------------------
                             29 	.area _DABS (ABS)
                             30 ;--------------------------------------------------------
                             31 ; global & static initialisations
                             32 ;--------------------------------------------------------
                             33 	.area _HOME
                             34 	.area _GSINIT
                             35 	.area _GSFINAL
                             36 	.area _GSINIT
                             37 ;--------------------------------------------------------
                             38 ; Home
                             39 ;--------------------------------------------------------
                             40 	.area _HOME
                             41 	.area _HOME
                             42 ;--------------------------------------------------------
                             43 ; code
                             44 ;--------------------------------------------------------
                             45 	.area _CODE
                             46 ;src/score/score.c:5: void barraPuntuacionInicial(){
                             47 ;	---------------------------------
                             48 ; Function barraPuntuacionInicial
                             49 ; ---------------------------------
   806D                      50 _barraPuntuacionInicial::
                             51 ;src/score/score.c:9: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 2); //
   806D 21 00 02      [10]   52 	ld	hl,#0x0200
   8070 E5            [11]   53 	push	hl
   8071 26 C0         [ 7]   54 	ld	h, #0xC0
   8073 E5            [11]   55 	push	hl
   8074 CD 72 8D      [17]   56 	call	_cpct_getScreenPtr
   8077 4D            [ 4]   57 	ld	c,l
   8078 44            [ 4]   58 	ld	b,h
                             59 ;src/score/score.c:10: cpct_drawStringM0("SCORE", memptr, 1, 0);
   8079 21 01 00      [10]   60 	ld	hl,#0x0001
   807C E5            [11]   61 	push	hl
   807D C5            [11]   62 	push	bc
   807E 21 F7 80      [10]   63 	ld	hl,#___str_0
   8081 E5            [11]   64 	push	hl
   8082 CD A2 81      [17]   65 	call	_cpct_drawStringM0
   8085 21 06 00      [10]   66 	ld	hl,#6
   8088 39            [11]   67 	add	hl,sp
   8089 F9            [ 6]   68 	ld	sp,hl
                             69 ;src/score/score.c:11: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 0, 14); // puntuación inicial
   808A 21 00 0E      [10]   70 	ld	hl,#0x0E00
   808D E5            [11]   71 	push	hl
   808E 26 C0         [ 7]   72 	ld	h, #0xC0
   8090 E5            [11]   73 	push	hl
   8091 CD 72 8D      [17]   74 	call	_cpct_getScreenPtr
   8094 4D            [ 4]   75 	ld	c,l
   8095 44            [ 4]   76 	ld	b,h
                             77 ;src/score/score.c:12: cpct_drawStringM0("00000", memptr, 15, 0);
   8096 21 0F 00      [10]   78 	ld	hl,#0x000F
   8099 E5            [11]   79 	push	hl
   809A C5            [11]   80 	push	bc
   809B 21 FD 80      [10]   81 	ld	hl,#___str_1
   809E E5            [11]   82 	push	hl
   809F CD A2 81      [17]   83 	call	_cpct_drawStringM0
   80A2 21 06 00      [10]   84 	ld	hl,#6
   80A5 39            [11]   85 	add	hl,sp
   80A6 F9            [ 6]   86 	ld	sp,hl
                             87 ;src/score/score.c:14: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60, 2); //
   80A7 21 3C 02      [10]   88 	ld	hl,#0x023C
   80AA E5            [11]   89 	push	hl
   80AB 21 00 C0      [10]   90 	ld	hl,#0xC000
   80AE E5            [11]   91 	push	hl
   80AF CD 72 8D      [17]   92 	call	_cpct_getScreenPtr
   80B2 4D            [ 4]   93 	ld	c,l
   80B3 44            [ 4]   94 	ld	b,h
                             95 ;src/score/score.c:15: cpct_drawStringM0("LIVES", memptr, 1, 0);
   80B4 21 01 00      [10]   96 	ld	hl,#0x0001
   80B7 E5            [11]   97 	push	hl
   80B8 C5            [11]   98 	push	bc
   80B9 21 03 81      [10]   99 	ld	hl,#___str_2
   80BC E5            [11]  100 	push	hl
   80BD CD A2 81      [17]  101 	call	_cpct_drawStringM0
   80C0 21 06 00      [10]  102 	ld	hl,#6
   80C3 39            [11]  103 	add	hl,sp
   80C4 F9            [ 6]  104 	ld	sp,hl
                            105 ;src/score/score.c:17: for(i=0; i<5; i++){
   80C5 01 00 00      [10]  106 	ld	bc,#0x0000
   80C8                     107 00102$:
                            108 ;src/score/score.c:18: memptr = cpct_getScreenPtr(CPCT_VMEM_START, 60 + i*4, 14); // dibuja 5 corazones
   80C8 79            [ 4]  109 	ld	a,c
   80C9 87            [ 4]  110 	add	a, a
   80CA 87            [ 4]  111 	add	a, a
   80CB C6 3C         [ 7]  112 	add	a, #0x3C
   80CD 57            [ 4]  113 	ld	d,a
   80CE C5            [11]  114 	push	bc
   80CF 3E 0E         [ 7]  115 	ld	a,#0x0E
   80D1 F5            [11]  116 	push	af
   80D2 33            [ 6]  117 	inc	sp
   80D3 D5            [11]  118 	push	de
   80D4 33            [ 6]  119 	inc	sp
   80D5 21 00 C0      [10]  120 	ld	hl,#0xC000
   80D8 E5            [11]  121 	push	hl
   80D9 CD 72 8D      [17]  122 	call	_cpct_getScreenPtr
   80DC EB            [ 4]  123 	ex	de,hl
   80DD 21 03 06      [10]  124 	ld	hl,#0x0603
   80E0 E5            [11]  125 	push	hl
   80E1 D5            [11]  126 	push	de
   80E2 21 28 79      [10]  127 	ld	hl,#_g_heart
   80E5 E5            [11]  128 	push	hl
   80E6 CD C6 81      [17]  129 	call	_cpct_drawSprite
   80E9 C1            [10]  130 	pop	bc
                            131 ;src/score/score.c:17: for(i=0; i<5; i++){
   80EA 03            [ 6]  132 	inc	bc
   80EB 79            [ 4]  133 	ld	a,c
   80EC D6 05         [ 7]  134 	sub	a, #0x05
   80EE 78            [ 4]  135 	ld	a,b
   80EF 17            [ 4]  136 	rla
   80F0 3F            [ 4]  137 	ccf
   80F1 1F            [ 4]  138 	rra
   80F2 DE 80         [ 7]  139 	sbc	a, #0x80
   80F4 38 D2         [12]  140 	jr	C,00102$
   80F6 C9            [10]  141 	ret
   80F7                     142 ___str_0:
   80F7 53 43 4F 52 45      143 	.ascii "SCORE"
   80FC 00                  144 	.db 0x00
   80FD                     145 ___str_1:
   80FD 30 30 30 30 30      146 	.ascii "00000"
   8102 00                  147 	.db 0x00
   8103                     148 ___str_2:
   8103 4C 49 56 45 53      149 	.ascii "LIVES"
   8108 00                  150 	.db 0x00
                            151 	.area _CODE
                            152 	.area _INITIALIZER
                            153 	.area _CABS (ABS)
