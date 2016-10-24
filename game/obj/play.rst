ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .globl cpct_akp_musicPlay_asm
                              2 
   57EB                       3 _play::
   57EB D9            [ 4]    4 	exx
   57EC 08            [ 4]    5 	ex af' , af
   57ED F5            [11]    6 	push af
   57EE C5            [11]    7 	push bc
   57EF D5            [11]    8 	push de
   57F0 E5            [11]    9 	push hl
                             10 
   57F1 CD 94 5B      [17]   11 	call cpct_akp_musicPlay_asm
                             12 
   57F4 E1            [10]   13 	pop hl
   57F5 D1            [10]   14 	pop de
   57F6 C1            [10]   15 	pop bc
   57F7 F1            [10]   16 	pop af
   57F8 08            [ 4]   17 	ex af' , af
   57F9 D9            [ 4]   18 	exx
                             19 
   57FA C9            [10]   20 	ret
