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
   58C8                      53 _g_tiles3_00:
   58C8 FC                   54 	.db #0xFC	; 252
   58C9 FC                   55 	.db #0xFC	; 252
   58CA FC                   56 	.db #0xFC	; 252
   58CB FC                   57 	.db #0xFC	; 252
   58CC FC                   58 	.db #0xFC	; 252
   58CD FC                   59 	.db #0xFC	; 252
   58CE FC                   60 	.db #0xFC	; 252
   58CF FC                   61 	.db #0xFC	; 252
   58D0                      62 _g_tiles3_01:
   58D0 C0                   63 	.db #0xC0	; 192
   58D1 C0                   64 	.db #0xC0	; 192
   58D2 C0                   65 	.db #0xC0	; 192
   58D3 C0                   66 	.db #0xC0	; 192
   58D4 C0                   67 	.db #0xC0	; 192
   58D5 C0                   68 	.db #0xC0	; 192
   58D6 C0                   69 	.db #0xC0	; 192
   58D7 C0                   70 	.db #0xC0	; 192
   58D8                      71 _g_tiles3_02:
   58D8 C9                   72 	.db #0xC9	; 201
   58D9 C9                   73 	.db #0xC9	; 201
   58DA C6                   74 	.db #0xC6	; 198
   58DB C6                   75 	.db #0xC6	; 198
   58DC C9                   76 	.db #0xC9	; 201
   58DD C9                   77 	.db #0xC9	; 201
   58DE C6                   78 	.db #0xC6	; 198
   58DF C6                   79 	.db #0xC6	; 198
   58E0                      80 _g_tiles3_03:
   58E0 C8                   81 	.db #0xC8	; 200
   58E1 CF                   82 	.db #0xCF	; 207
   58E2 C0                   83 	.db #0xC0	; 192
   58E3 C0                   84 	.db #0xC0	; 192
   58E4 CA                   85 	.db #0xCA	; 202
   58E5 CF                   86 	.db #0xCF	; 207
   58E6 CA                   87 	.db #0xCA	; 202
   58E7 CF                   88 	.db #0xCF	; 207
   58E8                      89 _g_tiles3_04:
   58E8 CF                   90 	.db #0xCF	; 207
   58E9 C0                   91 	.db #0xC0	; 192
   58EA C0                   92 	.db #0xC0	; 192
   58EB C0                   93 	.db #0xC0	; 192
   58EC CF                   94 	.db #0xCF	; 207
   58ED C5                   95 	.db #0xC5	; 197
   58EE CF                   96 	.db #0xCF	; 207
   58EF C5                   97 	.db #0xC5	; 197
   58F0                      98 _g_tiles3_05:
   58F0 FF                   99 	.db #0xFF	; 255
   58F1 FF                  100 	.db #0xFF	; 255
   58F2 FF                  101 	.db #0xFF	; 255
   58F3 FF                  102 	.db #0xFF	; 255
   58F4 FF                  103 	.db #0xFF	; 255
   58F5 FF                  104 	.db #0xFF	; 255
   58F6 FF                  105 	.db #0xFF	; 255
   58F7 FF                  106 	.db #0xFF	; 255
   58F8                     107 _g_tiles3_06:
   58F8 CB                  108 	.db #0xCB	; 203
   58F9 CF                  109 	.db #0xCF	; 207
   58FA C9                  110 	.db #0xC9	; 201
   58FB C7                  111 	.db #0xC7	; 199
   58FC CC                  112 	.db #0xCC	; 204
   58FD C3                  113 	.db #0xC3	; 195
   58FE CE                  114 	.db #0xCE	; 206
   58FF CF                  115 	.db #0xCF	; 207
   5900                     116 _g_tiles3_07:
   5900 C0                  117 	.db #0xC0	; 192
   5901 C7                  118 	.db #0xC7	; 199
   5902 CA                  119 	.db #0xCA	; 202
   5903 C5                  120 	.db #0xC5	; 197
   5904 C3                  121 	.db #0xC3	; 195
   5905 C0                  122 	.db #0xC0	; 192
   5906 CF                  123 	.db #0xCF	; 207
   5907 CA                  124 	.db #0xCA	; 202
   5908                     125 _g_tiles3_08:
   5908 CA                  126 	.db #0xCA	; 202
   5909 CF                  127 	.db #0xCF	; 207
   590A CA                  128 	.db #0xCA	; 202
   590B CF                  129 	.db #0xCF	; 207
   590C C0                  130 	.db #0xC0	; 192
   590D C0                  131 	.db #0xC0	; 192
   590E C0                  132 	.db #0xC0	; 192
   590F CF                  133 	.db #0xCF	; 207
   5910                     134 _g_tiles3_09:
   5910 CF                  135 	.db #0xCF	; 207
   5911 C5                  136 	.db #0xC5	; 197
   5912 CF                  137 	.db #0xCF	; 207
   5913 C5                  138 	.db #0xC5	; 197
   5914 C0                  139 	.db #0xC0	; 192
   5915 C0                  140 	.db #0xC0	; 192
   5916 CF                  141 	.db #0xCF	; 207
   5917 C0                  142 	.db #0xC0	; 192
                            143 	.area _INITIALIZER
                            144 	.area _CABS (ABS)
