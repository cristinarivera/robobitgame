ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .globl cpct_akp_musicPlay_asm
                              2 
   51CD                       3 _play::
   51CD D9            [ 4]    4 	exx
   51CE 08            [ 4]    5 	ex af' , af
   51CF F5            [11]    6 	push af
   51D0 C5            [11]    7 	push bc
   51D1 D5            [11]    8 	push de
   51D2 E5            [11]    9 	push hl
                             10 
   51D3 CD 3E 56      [17]   11 	call cpct_akp_musicPlay_asm
                             12 
   51D6 E1            [10]   13 	pop hl
   51D7 D1            [10]   14 	pop de
   51D8 C1            [10]   15 	pop bc
   51D9 F1            [10]   16 	pop af
   51DA 08            [ 4]   17 	ex af' , af
   51DB D9            [ 4]   18 	exx
                             19 
   51DC C9            [10]   20 	ret
