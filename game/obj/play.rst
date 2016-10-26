ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .globl cpct_akp_musicPlay_asm
                              2 
   5381                       3 _play::
   5381 D9            [ 4]    4 	exx
   5382 08            [ 4]    5 	ex af' , af
   5383 F5            [11]    6 	push af
   5384 C5            [11]    7 	push bc
   5385 D5            [11]    8 	push de
   5386 E5            [11]    9 	push hl
                             10 
   5387 CD F2 57      [17]   11 	call cpct_akp_musicPlay_asm
                             12 
   538A E1            [10]   13 	pop hl
   538B D1            [10]   14 	pop de
   538C C1            [10]   15 	pop bc
   538D F1            [10]   16 	pop af
   538E 08            [ 4]   17 	ex af' , af
   538F D9            [ 4]   18 	exx
                             19 
   5390 C9            [10]   20 	ret
