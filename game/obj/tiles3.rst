                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module tiles3
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _g_tiles3_09
                             12 	.globl _g_tiles3_08
                             13 	.globl _g_tiles3_07
                             14 	.globl _g_tiles3_06
                             15 	.globl _g_tiles3_05
                             16 	.globl _g_tiles3_04
                             17 	.globl _g_tiles3_03
                             18 	.globl _g_tiles3_02
                             19 	.globl _g_tiles3_01
                             20 	.globl _g_tiles3_00
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
   578A                      53 _g_tiles3_00:
   578A FC                   54 	.db #0xFC	; 252
   578B FC                   55 	.db #0xFC	; 252
   578C FC                   56 	.db #0xFC	; 252
   578D FC                   57 	.db #0xFC	; 252
   578E FC                   58 	.db #0xFC	; 252
   578F FC                   59 	.db #0xFC	; 252
   5790 FC                   60 	.db #0xFC	; 252
   5791 FC                   61 	.db #0xFC	; 252
   5792                      62 _g_tiles3_01:
   5792 C0                   63 	.db #0xC0	; 192
   5793 C0                   64 	.db #0xC0	; 192
   5794 C0                   65 	.db #0xC0	; 192
   5795 C0                   66 	.db #0xC0	; 192
   5796 C0                   67 	.db #0xC0	; 192
   5797 C0                   68 	.db #0xC0	; 192
   5798 C0                   69 	.db #0xC0	; 192
   5799 C0                   70 	.db #0xC0	; 192
   579A                      71 _g_tiles3_02:
   579A C9                   72 	.db #0xC9	; 201
   579B C9                   73 	.db #0xC9	; 201
   579C C6                   74 	.db #0xC6	; 198
   579D C6                   75 	.db #0xC6	; 198
   579E C9                   76 	.db #0xC9	; 201
   579F C9                   77 	.db #0xC9	; 201
   57A0 C6                   78 	.db #0xC6	; 198
   57A1 C6                   79 	.db #0xC6	; 198
   57A2                      80 _g_tiles3_03:
   57A2 C8                   81 	.db #0xC8	; 200
   57A3 CF                   82 	.db #0xCF	; 207
   57A4 C0                   83 	.db #0xC0	; 192
   57A5 C0                   84 	.db #0xC0	; 192
   57A6 CA                   85 	.db #0xCA	; 202
   57A7 CF                   86 	.db #0xCF	; 207
   57A8 CA                   87 	.db #0xCA	; 202
   57A9 CF                   88 	.db #0xCF	; 207
   57AA                      89 _g_tiles3_04:
   57AA CF                   90 	.db #0xCF	; 207
   57AB C0                   91 	.db #0xC0	; 192
   57AC C0                   92 	.db #0xC0	; 192
   57AD C0                   93 	.db #0xC0	; 192
   57AE CF                   94 	.db #0xCF	; 207
   57AF C5                   95 	.db #0xC5	; 197
   57B0 CF                   96 	.db #0xCF	; 207
   57B1 C5                   97 	.db #0xC5	; 197
   57B2                      98 _g_tiles3_05:
   57B2 FF                   99 	.db #0xFF	; 255
   57B3 FF                  100 	.db #0xFF	; 255
   57B4 FF                  101 	.db #0xFF	; 255
   57B5 FF                  102 	.db #0xFF	; 255
   57B6 FF                  103 	.db #0xFF	; 255
   57B7 FF                  104 	.db #0xFF	; 255
   57B8 FF                  105 	.db #0xFF	; 255
   57B9 FF                  106 	.db #0xFF	; 255
   57BA                     107 _g_tiles3_06:
   57BA CB                  108 	.db #0xCB	; 203
   57BB CF                  109 	.db #0xCF	; 207
   57BC C9                  110 	.db #0xC9	; 201
   57BD C7                  111 	.db #0xC7	; 199
   57BE CC                  112 	.db #0xCC	; 204
   57BF C3                  113 	.db #0xC3	; 195
   57C0 CE                  114 	.db #0xCE	; 206
   57C1 CF                  115 	.db #0xCF	; 207
   57C2                     116 _g_tiles3_07:
   57C2 C0                  117 	.db #0xC0	; 192
   57C3 C7                  118 	.db #0xC7	; 199
   57C4 CA                  119 	.db #0xCA	; 202
   57C5 C5                  120 	.db #0xC5	; 197
   57C6 C3                  121 	.db #0xC3	; 195
   57C7 C0                  122 	.db #0xC0	; 192
   57C8 CF                  123 	.db #0xCF	; 207
   57C9 CA                  124 	.db #0xCA	; 202
   57CA                     125 _g_tiles3_08:
   57CA CA                  126 	.db #0xCA	; 202
   57CB CF                  127 	.db #0xCF	; 207
   57CC CA                  128 	.db #0xCA	; 202
   57CD CF                  129 	.db #0xCF	; 207
   57CE C0                  130 	.db #0xC0	; 192
   57CF C0                  131 	.db #0xC0	; 192
   57D0 C0                  132 	.db #0xC0	; 192
   57D1 CF                  133 	.db #0xCF	; 207
   57D2                     134 _g_tiles3_09:
   57D2 CF                  135 	.db #0xCF	; 207
   57D3 C5                  136 	.db #0xC5	; 197
   57D4 CF                  137 	.db #0xCF	; 207
   57D5 C5                  138 	.db #0xC5	; 197
   57D6 C0                  139 	.db #0xC0	; 192
   57D7 C0                  140 	.db #0xC0	; 192
   57D8 CF                  141 	.db #0xCF	; 207
   57D9 C0                  142 	.db #0xC0	; 192
                            143 	.area _INITIALIZER
                            144 	.area _CABS (ABS)
