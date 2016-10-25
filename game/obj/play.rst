ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .globl cpct_akp_musicPlay_asm
                              2 
   51AE                       3 _play::
   51AE D9            [ 4]    4 	exx
   51AF 08            [ 4]    5 	ex af' , af
   51B0 F5            [11]    6 	push af
   51B1 C5            [11]    7 	push bc
   51B2 D5            [11]    8 	push de
   51B3 E5            [11]    9 	push hl
                             10 
   51B4 CD 1F 56      [17]   11 	call cpct_akp_musicPlay_asm
                             12 
   51B7 E1            [10]   13 	pop hl
   51B8 D1            [10]   14 	pop de
   51B9 C1            [10]   15 	pop bc
   51BA F1            [10]   16 	pop af
   51BB 08            [ 4]   17 	ex af' , af
   51BC D9            [ 4]   18 	exx
                             19 
   51BD C9            [10]   20 	ret
