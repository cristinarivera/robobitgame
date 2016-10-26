ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .globl cpct_akp_musicPlay_asm
                              2 
   522A                       3 _play::
   522A D9            [ 4]    4 	exx
   522B 08            [ 4]    5 	ex af' , af
   522C F5            [11]    6 	push af
   522D C5            [11]    7 	push bc
   522E D5            [11]    8 	push de
   522F E5            [11]    9 	push hl
                             10 
   5230 CD B2 56      [17]   11 	call cpct_akp_musicPlay_asm
                             12 
   5233 E1            [10]   13 	pop hl
   5234 D1            [10]   14 	pop de
   5235 C1            [10]   15 	pop bc
   5236 F1            [10]   16 	pop af
   5237 08            [ 4]   17 	ex af' , af
   5238 D9            [ 4]   18 	exx
                             19 
   5239 C9            [10]   20 	ret
