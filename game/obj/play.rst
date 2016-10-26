ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .globl cpct_akp_musicPlay_asm
                              2 
   5389                       3 _play::
   5389 D9            [ 4]    4 	exx
   538A 08            [ 4]    5 	ex af' , af
   538B F5            [11]    6 	push af
   538C C5            [11]    7 	push bc
   538D D5            [11]    8 	push de
   538E E5            [11]    9 	push hl
                             10 
   538F CD FA 57      [17]   11 	call cpct_akp_musicPlay_asm
                             12 
   5392 E1            [10]   13 	pop hl
   5393 D1            [10]   14 	pop de
   5394 C1            [10]   15 	pop bc
   5395 F1            [10]   16 	pop af
   5396 08            [ 4]   17 	ex af' , af
   5397 D9            [ 4]   18 	exx
                             19 
   5398 C9            [10]   20 	ret
