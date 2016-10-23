ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .globl cpct_akp_musicPlay_asm
                              2 
   839E                       3 _play::
   839E D9            [ 4]    4 	exx
   839F 08            [ 4]    5 	ex af' , af
   83A0 F5            [11]    6 	push af
   83A1 C5            [11]    7 	push bc
   83A2 D5            [11]    8 	push de
   83A3 E5            [11]    9 	push hl
                             10 
   83A4 CD 47 87      [17]   11 	call cpct_akp_musicPlay_asm
                             12 
   83A7 E1            [10]   13 	pop hl
   83A8 D1            [10]   14 	pop de
   83A9 C1            [10]   15 	pop bc
   83AA F1            [10]   16 	pop af
   83AB 08            [ 4]   17 	ex af' , af
   83AC D9            [ 4]   18 	exx
                             19 
   83AD C9            [10]   20 	ret
