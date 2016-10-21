                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module tiles2
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _g_tiles2_09
                             12 	.globl _g_tiles2_08
                             13 	.globl _g_tiles2_07
                             14 	.globl _g_tiles2_06
                             15 	.globl _g_tiles2_05
                             16 	.globl _g_tiles2_04
                             17 	.globl _g_tiles2_03
                             18 	.globl _g_tiles2_02
                             19 	.globl _g_tiles2_01
                             20 	.globl _g_tiles2_00
                             21 ;--------------------------------------------------------
                             22 ; special function registers
                             23 ;--------------------------------------------------------
                             24 ;--------------------------------------------------------
                             25 ; ram data
                             26 ;--------------------------------------------------------
                             27 	.area _DATA
                             28 ;--------------------------------------------------------
                             29 ; ram data
                             30 ;--------------------------------------------------------
                             31 	.area _INITIALIZED
                             32 ;--------------------------------------------------------
                             33 ; absolute external ram data
                             34 ;--------------------------------------------------------
                             35 	.area _DABS (ABS)
                             36 ;--------------------------------------------------------
                             37 ; global & static initialisations
                             38 ;--------------------------------------------------------
                             39 	.area _HOME
                             40 	.area _GSINIT
                             41 	.area _GSFINAL
                             42 	.area _GSINIT
                             43 ;--------------------------------------------------------
                             44 ; Home
                             45 ;--------------------------------------------------------
                             46 	.area _HOME
                             47 	.area _HOME
                             48 ;--------------------------------------------------------
                             49 ; code
                             50 ;--------------------------------------------------------
                             51 	.area _CODE
                             52 	.area _CODE
   64FB                      53 _g_tiles2_00:
   64FB C3                   54 	.db #0xC3	; 195
   64FC C3                   55 	.db #0xC3	; 195
   64FD C6                   56 	.db #0xC6	; 198
   64FE C3                   57 	.db #0xC3	; 195
   64FF C3                   58 	.db #0xC3	; 195
   6500 C3                   59 	.db #0xC3	; 195
   6501 C3                   60 	.db #0xC3	; 195
   6502 C6                   61 	.db #0xC6	; 198
   6503                      62 _g_tiles2_01:
   6503 CC                   63 	.db #0xCC	; 204
   6504 CF                   64 	.db #0xCF	; 207
   6505 CE                   65 	.db #0xCE	; 206
   6506 C9                   66 	.db #0xC9	; 201
   6507 CB                   67 	.db #0xCB	; 203
   6508 CC                   68 	.db #0xCC	; 204
   6509 CB                   69 	.db #0xCB	; 203
   650A CE                   70 	.db #0xCE	; 206
   650B                      71 _g_tiles2_02:
   650B CE                   72 	.db #0xCE	; 206
   650C CD                   73 	.db #0xCD	; 205
   650D C7                   74 	.db #0xC7	; 199
   650E CC                   75 	.db #0xCC	; 204
   650F C3                   76 	.db #0xC3	; 195
   6510 CE                   77 	.db #0xCE	; 206
   6511 C9                   78 	.db #0xC9	; 201
   6512 C7                   79 	.db #0xC7	; 199
   6513                      80 _g_tiles2_03:
   6513 CC                   81 	.db #0xCC	; 204
   6514 CF                   82 	.db #0xCF	; 207
   6515 CC                   83 	.db #0xCC	; 204
   6516 CC                   84 	.db #0xCC	; 204
   6517 CE                   85 	.db #0xCE	; 206
   6518 CF                   86 	.db #0xCF	; 207
   6519 CE                   87 	.db #0xCE	; 206
   651A CF                   88 	.db #0xCF	; 207
   651B                      89 _g_tiles2_04:
   651B CF                   90 	.db #0xCF	; 207
   651C CC                   91 	.db #0xCC	; 204
   651D CC                   92 	.db #0xCC	; 204
   651E CC                   93 	.db #0xCC	; 204
   651F CF                   94 	.db #0xCF	; 207
   6520 CD                   95 	.db #0xCD	; 205
   6521 CF                   96 	.db #0xCF	; 207
   6522 CD                   97 	.db #0xCD	; 205
   6523                      98 _g_tiles2_05:
   6523 FF                   99 	.db #0xFF	; 255
   6524 FF                  100 	.db #0xFF	; 255
   6525 FF                  101 	.db #0xFF	; 255
   6526 FF                  102 	.db #0xFF	; 255
   6527 FF                  103 	.db #0xFF	; 255
   6528 FF                  104 	.db #0xFF	; 255
   6529 FF                  105 	.db #0xFF	; 255
   652A FF                  106 	.db #0xFF	; 255
   652B                     107 _g_tiles2_06:
   652B CB                  108 	.db #0xCB	; 203
   652C CF                  109 	.db #0xCF	; 207
   652D C9                  110 	.db #0xC9	; 201
   652E C7                  111 	.db #0xC7	; 199
   652F CC                  112 	.db #0xCC	; 204
   6530 C3                  113 	.db #0xC3	; 195
   6531 CE                  114 	.db #0xCE	; 206
   6532 CF                  115 	.db #0xCF	; 207
   6533                     116 _g_tiles2_07:
   6533 CC                  117 	.db #0xCC	; 204
   6534 C7                  118 	.db #0xC7	; 199
   6535 CE                  119 	.db #0xCE	; 206
   6536 CD                  120 	.db #0xCD	; 205
   6537 C3                  121 	.db #0xC3	; 195
   6538 CC                  122 	.db #0xCC	; 204
   6539 CF                  123 	.db #0xCF	; 207
   653A CE                  124 	.db #0xCE	; 206
   653B                     125 _g_tiles2_08:
   653B CE                  126 	.db #0xCE	; 206
   653C CF                  127 	.db #0xCF	; 207
   653D CE                  128 	.db #0xCE	; 206
   653E CF                  129 	.db #0xCF	; 207
   653F CC                  130 	.db #0xCC	; 204
   6540 CC                  131 	.db #0xCC	; 204
   6541 CC                  132 	.db #0xCC	; 204
   6542 CF                  133 	.db #0xCF	; 207
   6543                     134 _g_tiles2_09:
   6543 CF                  135 	.db #0xCF	; 207
   6544 CD                  136 	.db #0xCD	; 205
   6545 CF                  137 	.db #0xCF	; 207
   6546 CD                  138 	.db #0xCD	; 205
   6547 CC                  139 	.db #0xCC	; 204
   6548 CC                  140 	.db #0xCC	; 204
   6549 CF                  141 	.db #0xCF	; 207
   654A CC                  142 	.db #0xCC	; 204
                            143 	.area _INITIALIZER
                            144 	.area _CABS (ABS)
