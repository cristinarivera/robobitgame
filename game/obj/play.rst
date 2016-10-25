ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .globl cpct_akp_musicPlay_asm
                              2 
   51F0                       3 _play::
   51F0 D9            [ 4]    4 	exx
   51F1 08            [ 4]    5 	ex af' , af
   51F2 F5            [11]    6 	push af
   51F3 C5            [11]    7 	push bc
   51F4 D5            [11]    8 	push de
   51F5 E5            [11]    9 	push hl
                             10 
   51F6 CD 61 56      [17]   11 	call cpct_akp_musicPlay_asm
                             12 
   51F9 E1            [10]   13 	pop hl
   51FA D1            [10]   14 	pop de
   51FB C1            [10]   15 	pop bc
   51FC F1            [10]   16 	pop af
   51FD 08            [ 4]   17 	ex af' , af
   51FE D9            [ 4]   18 	exx
                             19 
   51FF C9            [10]   20 	ret
