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
   568C                      53 _g_tiles3_00:
   568C FC                   54 	.db #0xFC	; 252
   568D FC                   55 	.db #0xFC	; 252
   568E FC                   56 	.db #0xFC	; 252
   568F FC                   57 	.db #0xFC	; 252
   5690 FC                   58 	.db #0xFC	; 252
   5691 FC                   59 	.db #0xFC	; 252
   5692 FC                   60 	.db #0xFC	; 252
   5693 FC                   61 	.db #0xFC	; 252
   5694                      62 _g_tiles3_01:
   5694 C0                   63 	.db #0xC0	; 192
   5695 C0                   64 	.db #0xC0	; 192
   5696 C0                   65 	.db #0xC0	; 192
   5697 C0                   66 	.db #0xC0	; 192
   5698 C0                   67 	.db #0xC0	; 192
   5699 C0                   68 	.db #0xC0	; 192
   569A C0                   69 	.db #0xC0	; 192
   569B C0                   70 	.db #0xC0	; 192
   569C                      71 _g_tiles3_02:
   569C C9                   72 	.db #0xC9	; 201
   569D C9                   73 	.db #0xC9	; 201
   569E C6                   74 	.db #0xC6	; 198
   569F C6                   75 	.db #0xC6	; 198
   56A0 C9                   76 	.db #0xC9	; 201
   56A1 C9                   77 	.db #0xC9	; 201
   56A2 C6                   78 	.db #0xC6	; 198
   56A3 C6                   79 	.db #0xC6	; 198
   56A4                      80 _g_tiles3_03:
   56A4 C8                   81 	.db #0xC8	; 200
   56A5 CF                   82 	.db #0xCF	; 207
   56A6 C0                   83 	.db #0xC0	; 192
   56A7 C0                   84 	.db #0xC0	; 192
   56A8 CA                   85 	.db #0xCA	; 202
   56A9 CF                   86 	.db #0xCF	; 207
   56AA CA                   87 	.db #0xCA	; 202
   56AB CF                   88 	.db #0xCF	; 207
   56AC                      89 _g_tiles3_04:
   56AC CF                   90 	.db #0xCF	; 207
   56AD C0                   91 	.db #0xC0	; 192
   56AE C0                   92 	.db #0xC0	; 192
   56AF C0                   93 	.db #0xC0	; 192
   56B0 CF                   94 	.db #0xCF	; 207
   56B1 C5                   95 	.db #0xC5	; 197
   56B2 CF                   96 	.db #0xCF	; 207
   56B3 C5                   97 	.db #0xC5	; 197
   56B4                      98 _g_tiles3_05:
   56B4 FF                   99 	.db #0xFF	; 255
   56B5 FF                  100 	.db #0xFF	; 255
   56B6 FF                  101 	.db #0xFF	; 255
   56B7 FF                  102 	.db #0xFF	; 255
   56B8 FF                  103 	.db #0xFF	; 255
   56B9 FF                  104 	.db #0xFF	; 255
   56BA FF                  105 	.db #0xFF	; 255
   56BB FF                  106 	.db #0xFF	; 255
   56BC                     107 _g_tiles3_06:
   56BC CB                  108 	.db #0xCB	; 203
   56BD CF                  109 	.db #0xCF	; 207
   56BE C9                  110 	.db #0xC9	; 201
   56BF C7                  111 	.db #0xC7	; 199
   56C0 CC                  112 	.db #0xCC	; 204
   56C1 C3                  113 	.db #0xC3	; 195
   56C2 CE                  114 	.db #0xCE	; 206
   56C3 CF                  115 	.db #0xCF	; 207
   56C4                     116 _g_tiles3_07:
   56C4 C0                  117 	.db #0xC0	; 192
   56C5 C7                  118 	.db #0xC7	; 199
   56C6 CA                  119 	.db #0xCA	; 202
   56C7 C5                  120 	.db #0xC5	; 197
   56C8 C3                  121 	.db #0xC3	; 195
   56C9 C0                  122 	.db #0xC0	; 192
   56CA CF                  123 	.db #0xCF	; 207
   56CB CA                  124 	.db #0xCA	; 202
   56CC                     125 _g_tiles3_08:
   56CC CA                  126 	.db #0xCA	; 202
   56CD CF                  127 	.db #0xCF	; 207
   56CE CA                  128 	.db #0xCA	; 202
   56CF CF                  129 	.db #0xCF	; 207
   56D0 C0                  130 	.db #0xC0	; 192
   56D1 C0                  131 	.db #0xC0	; 192
   56D2 C0                  132 	.db #0xC0	; 192
   56D3 CF                  133 	.db #0xCF	; 207
   56D4                     134 _g_tiles3_09:
   56D4 CF                  135 	.db #0xCF	; 207
   56D5 C5                  136 	.db #0xC5	; 197
   56D6 CF                  137 	.db #0xCF	; 207
   56D7 C5                  138 	.db #0xC5	; 197
   56D8 C0                  139 	.db #0xC0	; 192
   56D9 C0                  140 	.db #0xC0	; 192
   56DA CF                  141 	.db #0xCF	; 207
   56DB C0                  142 	.db #0xC0	; 192
                            143 	.area _INITIALIZER
                            144 	.area _CABS (ABS)
