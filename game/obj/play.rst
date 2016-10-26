ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .globl cpct_akp_musicPlay_asm
                              2 
   523A                       3 _play::
   523A D9            [ 4]    4 	exx
   523B 08            [ 4]    5 	ex af' , af
   523C F5            [11]    6 	push af
   523D C5            [11]    7 	push bc
   523E D5            [11]    8 	push de
   523F E5            [11]    9 	push hl
                             10 
   5240 CD FA 55      [17]   11 	call cpct_akp_musicPlay_asm
                             12 
   5243 E1            [10]   13 	pop hl
   5244 D1            [10]   14 	pop de
   5245 C1            [10]   15 	pop bc
   5246 F1            [10]   16 	pop af
   5247 08            [ 4]   17 	ex af' , af
   5248 D9            [ 4]   18 	exx
                             19 
   5249 C9            [10]   20 	ret
