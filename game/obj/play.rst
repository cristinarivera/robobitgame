ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .globl cpct_akp_musicPlay_asm
                              2 
   52DC                       3 _play::
   52DC D9            [ 4]    4 	exx
   52DD 08            [ 4]    5 	ex af' , af
   52DE F5            [11]    6 	push af
   52DF C5            [11]    7 	push bc
   52E0 D5            [11]    8 	push de
   52E1 E5            [11]    9 	push hl
                             10 
   52E2 CD 4D 57      [17]   11 	call cpct_akp_musicPlay_asm
                             12 
   52E5 E1            [10]   13 	pop hl
   52E6 D1            [10]   14 	pop de
   52E7 C1            [10]   15 	pop bc
   52E8 F1            [10]   16 	pop af
   52E9 08            [ 4]   17 	ex af' , af
   52EA D9            [ 4]   18 	exx
                             19 
   52EB C9            [10]   20 	ret
