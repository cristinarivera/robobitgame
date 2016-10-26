ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .globl cpct_akp_musicPlay_asm
                              2 
   537D                       3 _play::
   537D D9            [ 4]    4 	exx
   537E 08            [ 4]    5 	ex af' , af
   537F F5            [11]    6 	push af
   5380 C5            [11]    7 	push bc
   5381 D5            [11]    8 	push de
   5382 E5            [11]    9 	push hl
                             10 
   5383 CD EE 57      [17]   11 	call cpct_akp_musicPlay_asm
                             12 
   5386 E1            [10]   13 	pop hl
   5387 D1            [10]   14 	pop de
   5388 C1            [10]   15 	pop bc
   5389 F1            [10]   16 	pop af
   538A 08            [ 4]   17 	ex af' , af
   538B D9            [ 4]   18 	exx
                             19 
   538C C9            [10]   20 	ret
