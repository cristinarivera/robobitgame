ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .globl cpct_akp_musicPlay_asm
                              2 
   539E                       3 _play::
   539E D9            [ 4]    4 	exx
   539F 08            [ 4]    5 	ex af' , af
   53A0 F5            [11]    6 	push af
   53A1 C5            [11]    7 	push bc
   53A2 D5            [11]    8 	push de
   53A3 E5            [11]    9 	push hl
                             10 
   53A4 CD 26 58      [17]   11 	call cpct_akp_musicPlay_asm
                             12 
   53A7 E1            [10]   13 	pop hl
   53A8 D1            [10]   14 	pop de
   53A9 C1            [10]   15 	pop bc
   53AA F1            [10]   16 	pop af
   53AB 08            [ 4]   17 	ex af' , af
   53AC D9            [ 4]   18 	exx
                             19 
   53AD C9            [10]   20 	ret
