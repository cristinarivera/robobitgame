ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .globl cpct_akp_musicPlay_asm
                              2 
   53AE                       3 _play::
   53AE D9            [ 4]    4 	exx
   53AF 08            [ 4]    5 	ex af' , af
   53B0 F5            [11]    6 	push af
   53B1 C5            [11]    7 	push bc
   53B2 D5            [11]    8 	push de
   53B3 E5            [11]    9 	push hl
                             10 
<<<<<<< HEAD
   53B4 CD 36 58      [17]   11 	call cpct_akp_musicPlay_asm
=======
   5377 CD 1A 57      [17]   11 	call cpct_akp_musicPlay_asm
>>>>>>> f6f0208c5a072b24018e9303c551e0ad8807af24
                             12 
   53B7 E1            [10]   13 	pop hl
   53B8 D1            [10]   14 	pop de
   53B9 C1            [10]   15 	pop bc
   53BA F1            [10]   16 	pop af
   53BB 08            [ 4]   17 	ex af' , af
   53BC D9            [ 4]   18 	exx
                             19 
   53BD C9            [10]   20 	ret
