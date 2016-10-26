ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .globl cpct_akp_musicPlay_asm
                              2 
   5244                       3 _play::
   5244 D9            [ 4]    4 	exx
   5245 08            [ 4]    5 	ex af' , af
   5246 F5            [11]    6 	push af
   5247 C5            [11]    7 	push bc
   5248 D5            [11]    8 	push de
   5249 E5            [11]    9 	push hl
                             10 
   524A CD B5 56      [17]   11 	call cpct_akp_musicPlay_asm
                             12 
   524D E1            [10]   13 	pop hl
   524E D1            [10]   14 	pop de
   524F C1            [10]   15 	pop bc
   5250 F1            [10]   16 	pop af
   5251 08            [ 4]   17 	ex af' , af
   5252 D9            [ 4]   18 	exx
                             19 
   5253 C9            [10]   20 	ret
