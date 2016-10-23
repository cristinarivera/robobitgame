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
   57A1                      53 _g_tiles3_00:
   57A1 FC                   54 	.db #0xFC	; 252
   57A2 FC                   55 	.db #0xFC	; 252
   57A3 FC                   56 	.db #0xFC	; 252
   57A4 FC                   57 	.db #0xFC	; 252
   57A5 FC                   58 	.db #0xFC	; 252
   57A6 FC                   59 	.db #0xFC	; 252
   57A7 FC                   60 	.db #0xFC	; 252
   57A8 FC                   61 	.db #0xFC	; 252
   57A9                      62 _g_tiles3_01:
   57A9 C0                   63 	.db #0xC0	; 192
   57AA C0                   64 	.db #0xC0	; 192
   57AB C0                   65 	.db #0xC0	; 192
   57AC C0                   66 	.db #0xC0	; 192
   57AD C0                   67 	.db #0xC0	; 192
   57AE C0                   68 	.db #0xC0	; 192
   57AF C0                   69 	.db #0xC0	; 192
   57B0 C0                   70 	.db #0xC0	; 192
   57B1                      71 _g_tiles3_02:
   57B1 C9                   72 	.db #0xC9	; 201
   57B2 C9                   73 	.db #0xC9	; 201
   57B3 C6                   74 	.db #0xC6	; 198
   57B4 C6                   75 	.db #0xC6	; 198
   57B5 C9                   76 	.db #0xC9	; 201
   57B6 C9                   77 	.db #0xC9	; 201
   57B7 C6                   78 	.db #0xC6	; 198
   57B8 C6                   79 	.db #0xC6	; 198
   57B9                      80 _g_tiles3_03:
   57B9 C8                   81 	.db #0xC8	; 200
   57BA CF                   82 	.db #0xCF	; 207
   57BB C0                   83 	.db #0xC0	; 192
   57BC C0                   84 	.db #0xC0	; 192
   57BD CA                   85 	.db #0xCA	; 202
   57BE CF                   86 	.db #0xCF	; 207
   57BF CA                   87 	.db #0xCA	; 202
   57C0 CF                   88 	.db #0xCF	; 207
   57C1                      89 _g_tiles3_04:
   57C1 CF                   90 	.db #0xCF	; 207
   57C2 C0                   91 	.db #0xC0	; 192
   57C3 C0                   92 	.db #0xC0	; 192
   57C4 C0                   93 	.db #0xC0	; 192
   57C5 CF                   94 	.db #0xCF	; 207
   57C6 C5                   95 	.db #0xC5	; 197
   57C7 CF                   96 	.db #0xCF	; 207
   57C8 C5                   97 	.db #0xC5	; 197
   57C9                      98 _g_tiles3_05:
   57C9 FF                   99 	.db #0xFF	; 255
   57CA FF                  100 	.db #0xFF	; 255
   57CB FF                  101 	.db #0xFF	; 255
   57CC FF                  102 	.db #0xFF	; 255
   57CD FF                  103 	.db #0xFF	; 255
   57CE FF                  104 	.db #0xFF	; 255
   57CF FF                  105 	.db #0xFF	; 255
   57D0 FF                  106 	.db #0xFF	; 255
   57D1                     107 _g_tiles3_06:
   57D1 CB                  108 	.db #0xCB	; 203
   57D2 CF                  109 	.db #0xCF	; 207
   57D3 C9                  110 	.db #0xC9	; 201
   57D4 C7                  111 	.db #0xC7	; 199
   57D5 CC                  112 	.db #0xCC	; 204
   57D6 C3                  113 	.db #0xC3	; 195
   57D7 CE                  114 	.db #0xCE	; 206
   57D8 CF                  115 	.db #0xCF	; 207
   57D9                     116 _g_tiles3_07:
   57D9 C0                  117 	.db #0xC0	; 192
   57DA C7                  118 	.db #0xC7	; 199
   57DB CA                  119 	.db #0xCA	; 202
   57DC C5                  120 	.db #0xC5	; 197
   57DD C3                  121 	.db #0xC3	; 195
   57DE C0                  122 	.db #0xC0	; 192
   57DF CF                  123 	.db #0xCF	; 207
   57E0 CA                  124 	.db #0xCA	; 202
   57E1                     125 _g_tiles3_08:
   57E1 CA                  126 	.db #0xCA	; 202
   57E2 CF                  127 	.db #0xCF	; 207
   57E3 CA                  128 	.db #0xCA	; 202
   57E4 CF                  129 	.db #0xCF	; 207
   57E5 C0                  130 	.db #0xC0	; 192
   57E6 C0                  131 	.db #0xC0	; 192
   57E7 C0                  132 	.db #0xC0	; 192
   57E8 CF                  133 	.db #0xCF	; 207
   57E9                     134 _g_tiles3_09:
   57E9 CF                  135 	.db #0xCF	; 207
   57EA C5                  136 	.db #0xC5	; 197
   57EB CF                  137 	.db #0xCF	; 207
   57EC C5                  138 	.db #0xC5	; 197
   57ED C0                  139 	.db #0xC0	; 192
   57EE C0                  140 	.db #0xC0	; 192
   57EF CF                  141 	.db #0xCF	; 207
   57F0 C0                  142 	.db #0xC0	; 192
                            143 	.area _INITIALIZER
                            144 	.area _CABS (ABS)
