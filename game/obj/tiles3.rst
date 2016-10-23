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
   4B92                      53 _g_tiles3_00:
   4B92 FC                   54 	.db #0xFC	; 252
   4B93 FC                   55 	.db #0xFC	; 252
   4B94 FC                   56 	.db #0xFC	; 252
   4B95 FC                   57 	.db #0xFC	; 252
   4B96 FC                   58 	.db #0xFC	; 252
   4B97 FC                   59 	.db #0xFC	; 252
   4B98 FC                   60 	.db #0xFC	; 252
   4B99 FC                   61 	.db #0xFC	; 252
   4B9A                      62 _g_tiles3_01:
   4B9A C0                   63 	.db #0xC0	; 192
   4B9B C0                   64 	.db #0xC0	; 192
   4B9C C0                   65 	.db #0xC0	; 192
   4B9D C0                   66 	.db #0xC0	; 192
   4B9E C0                   67 	.db #0xC0	; 192
   4B9F C0                   68 	.db #0xC0	; 192
   4BA0 C0                   69 	.db #0xC0	; 192
   4BA1 C0                   70 	.db #0xC0	; 192
   4BA2                      71 _g_tiles3_02:
   4BA2 C9                   72 	.db #0xC9	; 201
   4BA3 C9                   73 	.db #0xC9	; 201
   4BA4 C6                   74 	.db #0xC6	; 198
   4BA5 C6                   75 	.db #0xC6	; 198
   4BA6 C9                   76 	.db #0xC9	; 201
   4BA7 C9                   77 	.db #0xC9	; 201
   4BA8 C6                   78 	.db #0xC6	; 198
   4BA9 C6                   79 	.db #0xC6	; 198
   4BAA                      80 _g_tiles3_03:
   4BAA C8                   81 	.db #0xC8	; 200
   4BAB CF                   82 	.db #0xCF	; 207
   4BAC C0                   83 	.db #0xC0	; 192
   4BAD C0                   84 	.db #0xC0	; 192
   4BAE CA                   85 	.db #0xCA	; 202
   4BAF CF                   86 	.db #0xCF	; 207
   4BB0 CA                   87 	.db #0xCA	; 202
   4BB1 CF                   88 	.db #0xCF	; 207
   4BB2                      89 _g_tiles3_04:
   4BB2 CF                   90 	.db #0xCF	; 207
   4BB3 C0                   91 	.db #0xC0	; 192
   4BB4 C0                   92 	.db #0xC0	; 192
   4BB5 C0                   93 	.db #0xC0	; 192
   4BB6 CF                   94 	.db #0xCF	; 207
   4BB7 C5                   95 	.db #0xC5	; 197
   4BB8 CF                   96 	.db #0xCF	; 207
   4BB9 C5                   97 	.db #0xC5	; 197
   4BBA                      98 _g_tiles3_05:
   4BBA FF                   99 	.db #0xFF	; 255
   4BBB FF                  100 	.db #0xFF	; 255
   4BBC FF                  101 	.db #0xFF	; 255
   4BBD FF                  102 	.db #0xFF	; 255
   4BBE FF                  103 	.db #0xFF	; 255
   4BBF FF                  104 	.db #0xFF	; 255
   4BC0 FF                  105 	.db #0xFF	; 255
   4BC1 FF                  106 	.db #0xFF	; 255
   4BC2                     107 _g_tiles3_06:
   4BC2 CB                  108 	.db #0xCB	; 203
   4BC3 CF                  109 	.db #0xCF	; 207
   4BC4 C9                  110 	.db #0xC9	; 201
   4BC5 C7                  111 	.db #0xC7	; 199
   4BC6 CC                  112 	.db #0xCC	; 204
   4BC7 C3                  113 	.db #0xC3	; 195
   4BC8 CE                  114 	.db #0xCE	; 206
   4BC9 CF                  115 	.db #0xCF	; 207
   4BCA                     116 _g_tiles3_07:
   4BCA C0                  117 	.db #0xC0	; 192
   4BCB C7                  118 	.db #0xC7	; 199
   4BCC CA                  119 	.db #0xCA	; 202
   4BCD C5                  120 	.db #0xC5	; 197
   4BCE C3                  121 	.db #0xC3	; 195
   4BCF C0                  122 	.db #0xC0	; 192
   4BD0 CF                  123 	.db #0xCF	; 207
   4BD1 CA                  124 	.db #0xCA	; 202
   4BD2                     125 _g_tiles3_08:
   4BD2 CA                  126 	.db #0xCA	; 202
   4BD3 CF                  127 	.db #0xCF	; 207
   4BD4 CA                  128 	.db #0xCA	; 202
   4BD5 CF                  129 	.db #0xCF	; 207
   4BD6 C0                  130 	.db #0xC0	; 192
   4BD7 C0                  131 	.db #0xC0	; 192
   4BD8 C0                  132 	.db #0xC0	; 192
   4BD9 CF                  133 	.db #0xCF	; 207
   4BDA                     134 _g_tiles3_09:
   4BDA CF                  135 	.db #0xCF	; 207
   4BDB C5                  136 	.db #0xC5	; 197
   4BDC CF                  137 	.db #0xCF	; 207
   4BDD C5                  138 	.db #0xC5	; 197
   4BDE C0                  139 	.db #0xC0	; 192
   4BDF C0                  140 	.db #0xC0	; 192
   4BE0 CF                  141 	.db #0xCF	; 207
   4BE1 C0                  142 	.db #0xC0	; 192
                            143 	.area _INITIALIZER
                            144 	.area _CABS (ABS)
