ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .globl cpct_akp_musicPlay_asm
                              2 
   5371                       3 _play::
   5371 D9            [ 4]    4 	exx
   5372 08            [ 4]    5 	ex af' , af
   5373 F5            [11]    6 	push af
   5374 C5            [11]    7 	push bc
   5375 D5            [11]    8 	push de
   5376 E5            [11]    9 	push hl
                             10 
   5377 CD E2 57      [17]   11 	call cpct_akp_musicPlay_asm
                             12 
   537A E1            [10]   13 	pop hl
   537B D1            [10]   14 	pop de
   537C C1            [10]   15 	pop bc
   537D F1            [10]   16 	pop af
   537E 08            [ 4]   17 	ex af' , af
   537F D9            [ 4]   18 	exx
                             19 
   5380 C9            [10]   20 	ret
