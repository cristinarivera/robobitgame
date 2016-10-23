ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .globl cpct_akp_musicPlay_asm
                              2 
   78C0                       3 _play::
   78C0 D9            [ 4]    4 	exx
   78C1 08            [ 4]    5 	ex af' , af
   78C2 F5            [11]    6 	push af
   78C3 C5            [11]    7 	push bc
   78C4 D5            [11]    8 	push de
   78C5 E5            [11]    9 	push hl
                             10 
   78C6 CD 31 7D      [17]   11 	call cpct_akp_musicPlay_asm
                             12 
   78C9 E1            [10]   13 	pop hl
   78CA D1            [10]   14 	pop de
   78CB C1            [10]   15 	pop bc
   78CC F1            [10]   16 	pop af
   78CD 08            [ 4]   17 	ex af' , af
   78CE D9            [ 4]   18 	exx
                             19 
   78CF C9            [10]   20 	ret
