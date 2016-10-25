ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .globl cpct_akp_musicPlay_asm
                              2 
   5234                       3 _play::
   5234 D9            [ 4]    4 	exx
   5235 08            [ 4]    5 	ex af' , af
   5236 F5            [11]    6 	push af
   5237 C5            [11]    7 	push bc
   5238 D5            [11]    8 	push de
   5239 E5            [11]    9 	push hl
                             10 
   523A CD A5 56      [17]   11 	call cpct_akp_musicPlay_asm
                             12 
   523D E1            [10]   13 	pop hl
   523E D1            [10]   14 	pop de
   523F C1            [10]   15 	pop bc
   5240 F1            [10]   16 	pop af
   5241 08            [ 4]   17 	ex af' , af
   5242 D9            [ 4]   18 	exx
                             19 
   5243 C9            [10]   20 	ret
