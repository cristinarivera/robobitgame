ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .globl cpct_akp_musicPlay_asm
                              2 
   7DC0                       3 _play::
   7DC0 D9            [ 4]    4 	exx
   7DC1 08            [ 4]    5 	ex af' , af
   7DC2 F5            [11]    6 	push af
   7DC3 C5            [11]    7 	push bc
   7DC4 D5            [11]    8 	push de
   7DC5 E5            [11]    9 	push hl
                             10 
   7DC6 CD 69 81      [17]   11 	call cpct_akp_musicPlay_asm
                             12 
   7DC9 E1            [10]   13 	pop hl
   7DCA D1            [10]   14 	pop de
   7DCB C1            [10]   15 	pop bc
   7DCC F1            [10]   16 	pop af
   7DCD 08            [ 4]   17 	ex af' , af
   7DCE D9            [ 4]   18 	exx
                             19 
   7DCF C9            [10]   20 	ret
