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
   57B0                      53 _g_tiles3_00:
   57B0 FC                   54 	.db #0xFC	; 252
   57B1 FC                   55 	.db #0xFC	; 252
   57B2 FC                   56 	.db #0xFC	; 252
   57B3 FC                   57 	.db #0xFC	; 252
   57B4 FC                   58 	.db #0xFC	; 252
   57B5 FC                   59 	.db #0xFC	; 252
   57B6 FC                   60 	.db #0xFC	; 252
   57B7 FC                   61 	.db #0xFC	; 252
   57B8                      62 _g_tiles3_01:
   57B8 C0                   63 	.db #0xC0	; 192
   57B9 C0                   64 	.db #0xC0	; 192
   57BA C0                   65 	.db #0xC0	; 192
   57BB C0                   66 	.db #0xC0	; 192
   57BC C0                   67 	.db #0xC0	; 192
   57BD C0                   68 	.db #0xC0	; 192
   57BE C0                   69 	.db #0xC0	; 192
   57BF C0                   70 	.db #0xC0	; 192
   57C0                      71 _g_tiles3_02:
   57C0 C9                   72 	.db #0xC9	; 201
   57C1 C9                   73 	.db #0xC9	; 201
   57C2 C6                   74 	.db #0xC6	; 198
   57C3 C6                   75 	.db #0xC6	; 198
   57C4 C9                   76 	.db #0xC9	; 201
   57C5 C9                   77 	.db #0xC9	; 201
   57C6 C6                   78 	.db #0xC6	; 198
   57C7 C6                   79 	.db #0xC6	; 198
   57C8                      80 _g_tiles3_03:
   57C8 C8                   81 	.db #0xC8	; 200
   57C9 CF                   82 	.db #0xCF	; 207
   57CA C0                   83 	.db #0xC0	; 192
   57CB C0                   84 	.db #0xC0	; 192
   57CC CA                   85 	.db #0xCA	; 202
   57CD CF                   86 	.db #0xCF	; 207
   57CE CA                   87 	.db #0xCA	; 202
   57CF CF                   88 	.db #0xCF	; 207
   57D0                      89 _g_tiles3_04:
   57D0 CF                   90 	.db #0xCF	; 207
   57D1 C0                   91 	.db #0xC0	; 192
   57D2 C0                   92 	.db #0xC0	; 192
   57D3 C0                   93 	.db #0xC0	; 192
   57D4 CF                   94 	.db #0xCF	; 207
   57D5 C5                   95 	.db #0xC5	; 197
   57D6 CF                   96 	.db #0xCF	; 207
   57D7 C5                   97 	.db #0xC5	; 197
   57D8                      98 _g_tiles3_05:
   57D8 FF                   99 	.db #0xFF	; 255
   57D9 FF                  100 	.db #0xFF	; 255
   57DA FF                  101 	.db #0xFF	; 255
   57DB FF                  102 	.db #0xFF	; 255
   57DC FF                  103 	.db #0xFF	; 255
   57DD FF                  104 	.db #0xFF	; 255
   57DE FF                  105 	.db #0xFF	; 255
   57DF FF                  106 	.db #0xFF	; 255
   57E0                     107 _g_tiles3_06:
   57E0 CB                  108 	.db #0xCB	; 203
   57E1 CF                  109 	.db #0xCF	; 207
   57E2 C9                  110 	.db #0xC9	; 201
   57E3 C7                  111 	.db #0xC7	; 199
   57E4 CC                  112 	.db #0xCC	; 204
   57E5 C3                  113 	.db #0xC3	; 195
   57E6 CE                  114 	.db #0xCE	; 206
   57E7 CF                  115 	.db #0xCF	; 207
   57E8                     116 _g_tiles3_07:
   57E8 C0                  117 	.db #0xC0	; 192
   57E9 C7                  118 	.db #0xC7	; 199
   57EA CA                  119 	.db #0xCA	; 202
   57EB C5                  120 	.db #0xC5	; 197
   57EC C3                  121 	.db #0xC3	; 195
   57ED C0                  122 	.db #0xC0	; 192
   57EE CF                  123 	.db #0xCF	; 207
   57EF CA                  124 	.db #0xCA	; 202
   57F0                     125 _g_tiles3_08:
   57F0 CA                  126 	.db #0xCA	; 202
   57F1 CF                  127 	.db #0xCF	; 207
   57F2 CA                  128 	.db #0xCA	; 202
   57F3 CF                  129 	.db #0xCF	; 207
   57F4 C0                  130 	.db #0xC0	; 192
   57F5 C0                  131 	.db #0xC0	; 192
   57F6 C0                  132 	.db #0xC0	; 192
   57F7 CF                  133 	.db #0xCF	; 207
   57F8                     134 _g_tiles3_09:
   57F8 CF                  135 	.db #0xCF	; 207
   57F9 C5                  136 	.db #0xC5	; 197
   57FA CF                  137 	.db #0xCF	; 207
   57FB C5                  138 	.db #0xC5	; 197
   57FC C0                  139 	.db #0xC0	; 192
   57FD C0                  140 	.db #0xC0	; 192
   57FE CF                  141 	.db #0xCF	; 207
   57FF C0                  142 	.db #0xC0	; 192
                            143 	.area _INITIALIZER
                            144 	.area _CABS (ABS)
