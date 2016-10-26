ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .globl cpct_akp_musicPlay_asm
                              2 
   5334                       3 _play::
   5334 D9            [ 4]    4 	exx
   5335 08            [ 4]    5 	ex af' , af
   5336 F5            [11]    6 	push af
   5337 C5            [11]    7 	push bc
   5338 D5            [11]    8 	push de
   5339 E5            [11]    9 	push hl
                             10 
   533A CD A5 57      [17]   11 	call cpct_akp_musicPlay_asm
                             12 
   533D E1            [10]   13 	pop hl
   533E D1            [10]   14 	pop de
   533F C1            [10]   15 	pop bc
   5340 F1            [10]   16 	pop af
   5341 08            [ 4]   17 	ex af' , af
   5342 D9            [ 4]   18 	exx
                             19 
   5343 C9            [10]   20 	ret
