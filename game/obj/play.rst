ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .globl cpct_akp_musicPlay_asm
                              2 
   57C2                       3 _play::
   57C2 D9            [ 4]    4 	exx
   57C3 08            [ 4]    5 	ex af' , af
   57C4 F5            [11]    6 	push af
   57C5 C5            [11]    7 	push bc
   57C6 D5            [11]    8 	push de
   57C7 E5            [11]    9 	push hl
                             10 
   57C8 CD 33 5C      [17]   11 	call cpct_akp_musicPlay_asm
                             12 
   57CB E1            [10]   13 	pop hl
   57CC D1            [10]   14 	pop de
   57CD C1            [10]   15 	pop bc
   57CE F1            [10]   16 	pop af
   57CF 08            [ 4]   17 	ex af' , af
   57D0 D9            [ 4]   18 	exx
                             19 
   57D1 C9            [10]   20 	ret
