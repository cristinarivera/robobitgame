ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .globl cpct_akp_musicPlay_asm
                              2 
   57D2                       3 _play::
   57D2 D9            [ 4]    4 	exx
   57D3 08            [ 4]    5 	ex af' , af
   57D4 F5            [11]    6 	push af
   57D5 C5            [11]    7 	push bc
   57D6 D5            [11]    8 	push de
   57D7 E5            [11]    9 	push hl
                             10 
   57D8 CD 43 5C      [17]   11 	call cpct_akp_musicPlay_asm
                             12 
   57DB E1            [10]   13 	pop hl
   57DC D1            [10]   14 	pop de
   57DD C1            [10]   15 	pop bc
   57DE F1            [10]   16 	pop af
   57DF 08            [ 4]   17 	ex af' , af
   57E0 D9            [ 4]   18 	exx
                             19 
   57E1 C9            [10]   20 	ret
